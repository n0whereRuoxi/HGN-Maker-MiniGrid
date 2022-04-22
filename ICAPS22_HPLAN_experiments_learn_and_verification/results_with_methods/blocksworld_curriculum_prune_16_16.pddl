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
      ?auto_565309 - BLOCK
    )
    :vars
    (
      ?auto_565310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565309 ?auto_565310 ) ( CLEAR ?auto_565309 ) ( HAND-EMPTY ) ( not ( = ?auto_565309 ?auto_565310 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_565309 ?auto_565310 )
      ( !PUTDOWN ?auto_565309 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_565316 - BLOCK
      ?auto_565317 - BLOCK
    )
    :vars
    (
      ?auto_565318 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_565316 ) ( ON ?auto_565317 ?auto_565318 ) ( CLEAR ?auto_565317 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_565316 ) ( not ( = ?auto_565316 ?auto_565317 ) ) ( not ( = ?auto_565316 ?auto_565318 ) ) ( not ( = ?auto_565317 ?auto_565318 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_565317 ?auto_565318 )
      ( !STACK ?auto_565317 ?auto_565316 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_565326 - BLOCK
      ?auto_565327 - BLOCK
    )
    :vars
    (
      ?auto_565328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565327 ?auto_565328 ) ( not ( = ?auto_565326 ?auto_565327 ) ) ( not ( = ?auto_565326 ?auto_565328 ) ) ( not ( = ?auto_565327 ?auto_565328 ) ) ( ON ?auto_565326 ?auto_565327 ) ( CLEAR ?auto_565326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_565326 )
      ( MAKE-2PILE ?auto_565326 ?auto_565327 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_565337 - BLOCK
      ?auto_565338 - BLOCK
      ?auto_565339 - BLOCK
    )
    :vars
    (
      ?auto_565340 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_565338 ) ( ON ?auto_565339 ?auto_565340 ) ( CLEAR ?auto_565339 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_565337 ) ( ON ?auto_565338 ?auto_565337 ) ( not ( = ?auto_565337 ?auto_565338 ) ) ( not ( = ?auto_565337 ?auto_565339 ) ) ( not ( = ?auto_565337 ?auto_565340 ) ) ( not ( = ?auto_565338 ?auto_565339 ) ) ( not ( = ?auto_565338 ?auto_565340 ) ) ( not ( = ?auto_565339 ?auto_565340 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_565339 ?auto_565340 )
      ( !STACK ?auto_565339 ?auto_565338 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_565351 - BLOCK
      ?auto_565352 - BLOCK
      ?auto_565353 - BLOCK
    )
    :vars
    (
      ?auto_565354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565353 ?auto_565354 ) ( ON-TABLE ?auto_565351 ) ( not ( = ?auto_565351 ?auto_565352 ) ) ( not ( = ?auto_565351 ?auto_565353 ) ) ( not ( = ?auto_565351 ?auto_565354 ) ) ( not ( = ?auto_565352 ?auto_565353 ) ) ( not ( = ?auto_565352 ?auto_565354 ) ) ( not ( = ?auto_565353 ?auto_565354 ) ) ( CLEAR ?auto_565351 ) ( ON ?auto_565352 ?auto_565353 ) ( CLEAR ?auto_565352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_565351 ?auto_565352 )
      ( MAKE-3PILE ?auto_565351 ?auto_565352 ?auto_565353 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_565365 - BLOCK
      ?auto_565366 - BLOCK
      ?auto_565367 - BLOCK
    )
    :vars
    (
      ?auto_565368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565367 ?auto_565368 ) ( not ( = ?auto_565365 ?auto_565366 ) ) ( not ( = ?auto_565365 ?auto_565367 ) ) ( not ( = ?auto_565365 ?auto_565368 ) ) ( not ( = ?auto_565366 ?auto_565367 ) ) ( not ( = ?auto_565366 ?auto_565368 ) ) ( not ( = ?auto_565367 ?auto_565368 ) ) ( ON ?auto_565366 ?auto_565367 ) ( ON ?auto_565365 ?auto_565366 ) ( CLEAR ?auto_565365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_565365 )
      ( MAKE-3PILE ?auto_565365 ?auto_565366 ?auto_565367 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_565380 - BLOCK
      ?auto_565381 - BLOCK
      ?auto_565382 - BLOCK
      ?auto_565383 - BLOCK
    )
    :vars
    (
      ?auto_565384 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_565382 ) ( ON ?auto_565383 ?auto_565384 ) ( CLEAR ?auto_565383 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_565380 ) ( ON ?auto_565381 ?auto_565380 ) ( ON ?auto_565382 ?auto_565381 ) ( not ( = ?auto_565380 ?auto_565381 ) ) ( not ( = ?auto_565380 ?auto_565382 ) ) ( not ( = ?auto_565380 ?auto_565383 ) ) ( not ( = ?auto_565380 ?auto_565384 ) ) ( not ( = ?auto_565381 ?auto_565382 ) ) ( not ( = ?auto_565381 ?auto_565383 ) ) ( not ( = ?auto_565381 ?auto_565384 ) ) ( not ( = ?auto_565382 ?auto_565383 ) ) ( not ( = ?auto_565382 ?auto_565384 ) ) ( not ( = ?auto_565383 ?auto_565384 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_565383 ?auto_565384 )
      ( !STACK ?auto_565383 ?auto_565382 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_565398 - BLOCK
      ?auto_565399 - BLOCK
      ?auto_565400 - BLOCK
      ?auto_565401 - BLOCK
    )
    :vars
    (
      ?auto_565402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565401 ?auto_565402 ) ( ON-TABLE ?auto_565398 ) ( ON ?auto_565399 ?auto_565398 ) ( not ( = ?auto_565398 ?auto_565399 ) ) ( not ( = ?auto_565398 ?auto_565400 ) ) ( not ( = ?auto_565398 ?auto_565401 ) ) ( not ( = ?auto_565398 ?auto_565402 ) ) ( not ( = ?auto_565399 ?auto_565400 ) ) ( not ( = ?auto_565399 ?auto_565401 ) ) ( not ( = ?auto_565399 ?auto_565402 ) ) ( not ( = ?auto_565400 ?auto_565401 ) ) ( not ( = ?auto_565400 ?auto_565402 ) ) ( not ( = ?auto_565401 ?auto_565402 ) ) ( CLEAR ?auto_565399 ) ( ON ?auto_565400 ?auto_565401 ) ( CLEAR ?auto_565400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_565398 ?auto_565399 ?auto_565400 )
      ( MAKE-4PILE ?auto_565398 ?auto_565399 ?auto_565400 ?auto_565401 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_565416 - BLOCK
      ?auto_565417 - BLOCK
      ?auto_565418 - BLOCK
      ?auto_565419 - BLOCK
    )
    :vars
    (
      ?auto_565420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565419 ?auto_565420 ) ( ON-TABLE ?auto_565416 ) ( not ( = ?auto_565416 ?auto_565417 ) ) ( not ( = ?auto_565416 ?auto_565418 ) ) ( not ( = ?auto_565416 ?auto_565419 ) ) ( not ( = ?auto_565416 ?auto_565420 ) ) ( not ( = ?auto_565417 ?auto_565418 ) ) ( not ( = ?auto_565417 ?auto_565419 ) ) ( not ( = ?auto_565417 ?auto_565420 ) ) ( not ( = ?auto_565418 ?auto_565419 ) ) ( not ( = ?auto_565418 ?auto_565420 ) ) ( not ( = ?auto_565419 ?auto_565420 ) ) ( ON ?auto_565418 ?auto_565419 ) ( CLEAR ?auto_565416 ) ( ON ?auto_565417 ?auto_565418 ) ( CLEAR ?auto_565417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_565416 ?auto_565417 )
      ( MAKE-4PILE ?auto_565416 ?auto_565417 ?auto_565418 ?auto_565419 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_565434 - BLOCK
      ?auto_565435 - BLOCK
      ?auto_565436 - BLOCK
      ?auto_565437 - BLOCK
    )
    :vars
    (
      ?auto_565438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565437 ?auto_565438 ) ( not ( = ?auto_565434 ?auto_565435 ) ) ( not ( = ?auto_565434 ?auto_565436 ) ) ( not ( = ?auto_565434 ?auto_565437 ) ) ( not ( = ?auto_565434 ?auto_565438 ) ) ( not ( = ?auto_565435 ?auto_565436 ) ) ( not ( = ?auto_565435 ?auto_565437 ) ) ( not ( = ?auto_565435 ?auto_565438 ) ) ( not ( = ?auto_565436 ?auto_565437 ) ) ( not ( = ?auto_565436 ?auto_565438 ) ) ( not ( = ?auto_565437 ?auto_565438 ) ) ( ON ?auto_565436 ?auto_565437 ) ( ON ?auto_565435 ?auto_565436 ) ( ON ?auto_565434 ?auto_565435 ) ( CLEAR ?auto_565434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_565434 )
      ( MAKE-4PILE ?auto_565434 ?auto_565435 ?auto_565436 ?auto_565437 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_565453 - BLOCK
      ?auto_565454 - BLOCK
      ?auto_565455 - BLOCK
      ?auto_565456 - BLOCK
      ?auto_565457 - BLOCK
    )
    :vars
    (
      ?auto_565458 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_565456 ) ( ON ?auto_565457 ?auto_565458 ) ( CLEAR ?auto_565457 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_565453 ) ( ON ?auto_565454 ?auto_565453 ) ( ON ?auto_565455 ?auto_565454 ) ( ON ?auto_565456 ?auto_565455 ) ( not ( = ?auto_565453 ?auto_565454 ) ) ( not ( = ?auto_565453 ?auto_565455 ) ) ( not ( = ?auto_565453 ?auto_565456 ) ) ( not ( = ?auto_565453 ?auto_565457 ) ) ( not ( = ?auto_565453 ?auto_565458 ) ) ( not ( = ?auto_565454 ?auto_565455 ) ) ( not ( = ?auto_565454 ?auto_565456 ) ) ( not ( = ?auto_565454 ?auto_565457 ) ) ( not ( = ?auto_565454 ?auto_565458 ) ) ( not ( = ?auto_565455 ?auto_565456 ) ) ( not ( = ?auto_565455 ?auto_565457 ) ) ( not ( = ?auto_565455 ?auto_565458 ) ) ( not ( = ?auto_565456 ?auto_565457 ) ) ( not ( = ?auto_565456 ?auto_565458 ) ) ( not ( = ?auto_565457 ?auto_565458 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_565457 ?auto_565458 )
      ( !STACK ?auto_565457 ?auto_565456 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_565475 - BLOCK
      ?auto_565476 - BLOCK
      ?auto_565477 - BLOCK
      ?auto_565478 - BLOCK
      ?auto_565479 - BLOCK
    )
    :vars
    (
      ?auto_565480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565479 ?auto_565480 ) ( ON-TABLE ?auto_565475 ) ( ON ?auto_565476 ?auto_565475 ) ( ON ?auto_565477 ?auto_565476 ) ( not ( = ?auto_565475 ?auto_565476 ) ) ( not ( = ?auto_565475 ?auto_565477 ) ) ( not ( = ?auto_565475 ?auto_565478 ) ) ( not ( = ?auto_565475 ?auto_565479 ) ) ( not ( = ?auto_565475 ?auto_565480 ) ) ( not ( = ?auto_565476 ?auto_565477 ) ) ( not ( = ?auto_565476 ?auto_565478 ) ) ( not ( = ?auto_565476 ?auto_565479 ) ) ( not ( = ?auto_565476 ?auto_565480 ) ) ( not ( = ?auto_565477 ?auto_565478 ) ) ( not ( = ?auto_565477 ?auto_565479 ) ) ( not ( = ?auto_565477 ?auto_565480 ) ) ( not ( = ?auto_565478 ?auto_565479 ) ) ( not ( = ?auto_565478 ?auto_565480 ) ) ( not ( = ?auto_565479 ?auto_565480 ) ) ( CLEAR ?auto_565477 ) ( ON ?auto_565478 ?auto_565479 ) ( CLEAR ?auto_565478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_565475 ?auto_565476 ?auto_565477 ?auto_565478 )
      ( MAKE-5PILE ?auto_565475 ?auto_565476 ?auto_565477 ?auto_565478 ?auto_565479 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_565497 - BLOCK
      ?auto_565498 - BLOCK
      ?auto_565499 - BLOCK
      ?auto_565500 - BLOCK
      ?auto_565501 - BLOCK
    )
    :vars
    (
      ?auto_565502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565501 ?auto_565502 ) ( ON-TABLE ?auto_565497 ) ( ON ?auto_565498 ?auto_565497 ) ( not ( = ?auto_565497 ?auto_565498 ) ) ( not ( = ?auto_565497 ?auto_565499 ) ) ( not ( = ?auto_565497 ?auto_565500 ) ) ( not ( = ?auto_565497 ?auto_565501 ) ) ( not ( = ?auto_565497 ?auto_565502 ) ) ( not ( = ?auto_565498 ?auto_565499 ) ) ( not ( = ?auto_565498 ?auto_565500 ) ) ( not ( = ?auto_565498 ?auto_565501 ) ) ( not ( = ?auto_565498 ?auto_565502 ) ) ( not ( = ?auto_565499 ?auto_565500 ) ) ( not ( = ?auto_565499 ?auto_565501 ) ) ( not ( = ?auto_565499 ?auto_565502 ) ) ( not ( = ?auto_565500 ?auto_565501 ) ) ( not ( = ?auto_565500 ?auto_565502 ) ) ( not ( = ?auto_565501 ?auto_565502 ) ) ( ON ?auto_565500 ?auto_565501 ) ( CLEAR ?auto_565498 ) ( ON ?auto_565499 ?auto_565500 ) ( CLEAR ?auto_565499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_565497 ?auto_565498 ?auto_565499 )
      ( MAKE-5PILE ?auto_565497 ?auto_565498 ?auto_565499 ?auto_565500 ?auto_565501 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_565519 - BLOCK
      ?auto_565520 - BLOCK
      ?auto_565521 - BLOCK
      ?auto_565522 - BLOCK
      ?auto_565523 - BLOCK
    )
    :vars
    (
      ?auto_565524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565523 ?auto_565524 ) ( ON-TABLE ?auto_565519 ) ( not ( = ?auto_565519 ?auto_565520 ) ) ( not ( = ?auto_565519 ?auto_565521 ) ) ( not ( = ?auto_565519 ?auto_565522 ) ) ( not ( = ?auto_565519 ?auto_565523 ) ) ( not ( = ?auto_565519 ?auto_565524 ) ) ( not ( = ?auto_565520 ?auto_565521 ) ) ( not ( = ?auto_565520 ?auto_565522 ) ) ( not ( = ?auto_565520 ?auto_565523 ) ) ( not ( = ?auto_565520 ?auto_565524 ) ) ( not ( = ?auto_565521 ?auto_565522 ) ) ( not ( = ?auto_565521 ?auto_565523 ) ) ( not ( = ?auto_565521 ?auto_565524 ) ) ( not ( = ?auto_565522 ?auto_565523 ) ) ( not ( = ?auto_565522 ?auto_565524 ) ) ( not ( = ?auto_565523 ?auto_565524 ) ) ( ON ?auto_565522 ?auto_565523 ) ( ON ?auto_565521 ?auto_565522 ) ( CLEAR ?auto_565519 ) ( ON ?auto_565520 ?auto_565521 ) ( CLEAR ?auto_565520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_565519 ?auto_565520 )
      ( MAKE-5PILE ?auto_565519 ?auto_565520 ?auto_565521 ?auto_565522 ?auto_565523 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_565541 - BLOCK
      ?auto_565542 - BLOCK
      ?auto_565543 - BLOCK
      ?auto_565544 - BLOCK
      ?auto_565545 - BLOCK
    )
    :vars
    (
      ?auto_565546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565545 ?auto_565546 ) ( not ( = ?auto_565541 ?auto_565542 ) ) ( not ( = ?auto_565541 ?auto_565543 ) ) ( not ( = ?auto_565541 ?auto_565544 ) ) ( not ( = ?auto_565541 ?auto_565545 ) ) ( not ( = ?auto_565541 ?auto_565546 ) ) ( not ( = ?auto_565542 ?auto_565543 ) ) ( not ( = ?auto_565542 ?auto_565544 ) ) ( not ( = ?auto_565542 ?auto_565545 ) ) ( not ( = ?auto_565542 ?auto_565546 ) ) ( not ( = ?auto_565543 ?auto_565544 ) ) ( not ( = ?auto_565543 ?auto_565545 ) ) ( not ( = ?auto_565543 ?auto_565546 ) ) ( not ( = ?auto_565544 ?auto_565545 ) ) ( not ( = ?auto_565544 ?auto_565546 ) ) ( not ( = ?auto_565545 ?auto_565546 ) ) ( ON ?auto_565544 ?auto_565545 ) ( ON ?auto_565543 ?auto_565544 ) ( ON ?auto_565542 ?auto_565543 ) ( ON ?auto_565541 ?auto_565542 ) ( CLEAR ?auto_565541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_565541 )
      ( MAKE-5PILE ?auto_565541 ?auto_565542 ?auto_565543 ?auto_565544 ?auto_565545 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_565564 - BLOCK
      ?auto_565565 - BLOCK
      ?auto_565566 - BLOCK
      ?auto_565567 - BLOCK
      ?auto_565568 - BLOCK
      ?auto_565569 - BLOCK
    )
    :vars
    (
      ?auto_565570 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_565568 ) ( ON ?auto_565569 ?auto_565570 ) ( CLEAR ?auto_565569 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_565564 ) ( ON ?auto_565565 ?auto_565564 ) ( ON ?auto_565566 ?auto_565565 ) ( ON ?auto_565567 ?auto_565566 ) ( ON ?auto_565568 ?auto_565567 ) ( not ( = ?auto_565564 ?auto_565565 ) ) ( not ( = ?auto_565564 ?auto_565566 ) ) ( not ( = ?auto_565564 ?auto_565567 ) ) ( not ( = ?auto_565564 ?auto_565568 ) ) ( not ( = ?auto_565564 ?auto_565569 ) ) ( not ( = ?auto_565564 ?auto_565570 ) ) ( not ( = ?auto_565565 ?auto_565566 ) ) ( not ( = ?auto_565565 ?auto_565567 ) ) ( not ( = ?auto_565565 ?auto_565568 ) ) ( not ( = ?auto_565565 ?auto_565569 ) ) ( not ( = ?auto_565565 ?auto_565570 ) ) ( not ( = ?auto_565566 ?auto_565567 ) ) ( not ( = ?auto_565566 ?auto_565568 ) ) ( not ( = ?auto_565566 ?auto_565569 ) ) ( not ( = ?auto_565566 ?auto_565570 ) ) ( not ( = ?auto_565567 ?auto_565568 ) ) ( not ( = ?auto_565567 ?auto_565569 ) ) ( not ( = ?auto_565567 ?auto_565570 ) ) ( not ( = ?auto_565568 ?auto_565569 ) ) ( not ( = ?auto_565568 ?auto_565570 ) ) ( not ( = ?auto_565569 ?auto_565570 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_565569 ?auto_565570 )
      ( !STACK ?auto_565569 ?auto_565568 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_565590 - BLOCK
      ?auto_565591 - BLOCK
      ?auto_565592 - BLOCK
      ?auto_565593 - BLOCK
      ?auto_565594 - BLOCK
      ?auto_565595 - BLOCK
    )
    :vars
    (
      ?auto_565596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565595 ?auto_565596 ) ( ON-TABLE ?auto_565590 ) ( ON ?auto_565591 ?auto_565590 ) ( ON ?auto_565592 ?auto_565591 ) ( ON ?auto_565593 ?auto_565592 ) ( not ( = ?auto_565590 ?auto_565591 ) ) ( not ( = ?auto_565590 ?auto_565592 ) ) ( not ( = ?auto_565590 ?auto_565593 ) ) ( not ( = ?auto_565590 ?auto_565594 ) ) ( not ( = ?auto_565590 ?auto_565595 ) ) ( not ( = ?auto_565590 ?auto_565596 ) ) ( not ( = ?auto_565591 ?auto_565592 ) ) ( not ( = ?auto_565591 ?auto_565593 ) ) ( not ( = ?auto_565591 ?auto_565594 ) ) ( not ( = ?auto_565591 ?auto_565595 ) ) ( not ( = ?auto_565591 ?auto_565596 ) ) ( not ( = ?auto_565592 ?auto_565593 ) ) ( not ( = ?auto_565592 ?auto_565594 ) ) ( not ( = ?auto_565592 ?auto_565595 ) ) ( not ( = ?auto_565592 ?auto_565596 ) ) ( not ( = ?auto_565593 ?auto_565594 ) ) ( not ( = ?auto_565593 ?auto_565595 ) ) ( not ( = ?auto_565593 ?auto_565596 ) ) ( not ( = ?auto_565594 ?auto_565595 ) ) ( not ( = ?auto_565594 ?auto_565596 ) ) ( not ( = ?auto_565595 ?auto_565596 ) ) ( CLEAR ?auto_565593 ) ( ON ?auto_565594 ?auto_565595 ) ( CLEAR ?auto_565594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_565590 ?auto_565591 ?auto_565592 ?auto_565593 ?auto_565594 )
      ( MAKE-6PILE ?auto_565590 ?auto_565591 ?auto_565592 ?auto_565593 ?auto_565594 ?auto_565595 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_565616 - BLOCK
      ?auto_565617 - BLOCK
      ?auto_565618 - BLOCK
      ?auto_565619 - BLOCK
      ?auto_565620 - BLOCK
      ?auto_565621 - BLOCK
    )
    :vars
    (
      ?auto_565622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565621 ?auto_565622 ) ( ON-TABLE ?auto_565616 ) ( ON ?auto_565617 ?auto_565616 ) ( ON ?auto_565618 ?auto_565617 ) ( not ( = ?auto_565616 ?auto_565617 ) ) ( not ( = ?auto_565616 ?auto_565618 ) ) ( not ( = ?auto_565616 ?auto_565619 ) ) ( not ( = ?auto_565616 ?auto_565620 ) ) ( not ( = ?auto_565616 ?auto_565621 ) ) ( not ( = ?auto_565616 ?auto_565622 ) ) ( not ( = ?auto_565617 ?auto_565618 ) ) ( not ( = ?auto_565617 ?auto_565619 ) ) ( not ( = ?auto_565617 ?auto_565620 ) ) ( not ( = ?auto_565617 ?auto_565621 ) ) ( not ( = ?auto_565617 ?auto_565622 ) ) ( not ( = ?auto_565618 ?auto_565619 ) ) ( not ( = ?auto_565618 ?auto_565620 ) ) ( not ( = ?auto_565618 ?auto_565621 ) ) ( not ( = ?auto_565618 ?auto_565622 ) ) ( not ( = ?auto_565619 ?auto_565620 ) ) ( not ( = ?auto_565619 ?auto_565621 ) ) ( not ( = ?auto_565619 ?auto_565622 ) ) ( not ( = ?auto_565620 ?auto_565621 ) ) ( not ( = ?auto_565620 ?auto_565622 ) ) ( not ( = ?auto_565621 ?auto_565622 ) ) ( ON ?auto_565620 ?auto_565621 ) ( CLEAR ?auto_565618 ) ( ON ?auto_565619 ?auto_565620 ) ( CLEAR ?auto_565619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_565616 ?auto_565617 ?auto_565618 ?auto_565619 )
      ( MAKE-6PILE ?auto_565616 ?auto_565617 ?auto_565618 ?auto_565619 ?auto_565620 ?auto_565621 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_565642 - BLOCK
      ?auto_565643 - BLOCK
      ?auto_565644 - BLOCK
      ?auto_565645 - BLOCK
      ?auto_565646 - BLOCK
      ?auto_565647 - BLOCK
    )
    :vars
    (
      ?auto_565648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565647 ?auto_565648 ) ( ON-TABLE ?auto_565642 ) ( ON ?auto_565643 ?auto_565642 ) ( not ( = ?auto_565642 ?auto_565643 ) ) ( not ( = ?auto_565642 ?auto_565644 ) ) ( not ( = ?auto_565642 ?auto_565645 ) ) ( not ( = ?auto_565642 ?auto_565646 ) ) ( not ( = ?auto_565642 ?auto_565647 ) ) ( not ( = ?auto_565642 ?auto_565648 ) ) ( not ( = ?auto_565643 ?auto_565644 ) ) ( not ( = ?auto_565643 ?auto_565645 ) ) ( not ( = ?auto_565643 ?auto_565646 ) ) ( not ( = ?auto_565643 ?auto_565647 ) ) ( not ( = ?auto_565643 ?auto_565648 ) ) ( not ( = ?auto_565644 ?auto_565645 ) ) ( not ( = ?auto_565644 ?auto_565646 ) ) ( not ( = ?auto_565644 ?auto_565647 ) ) ( not ( = ?auto_565644 ?auto_565648 ) ) ( not ( = ?auto_565645 ?auto_565646 ) ) ( not ( = ?auto_565645 ?auto_565647 ) ) ( not ( = ?auto_565645 ?auto_565648 ) ) ( not ( = ?auto_565646 ?auto_565647 ) ) ( not ( = ?auto_565646 ?auto_565648 ) ) ( not ( = ?auto_565647 ?auto_565648 ) ) ( ON ?auto_565646 ?auto_565647 ) ( ON ?auto_565645 ?auto_565646 ) ( CLEAR ?auto_565643 ) ( ON ?auto_565644 ?auto_565645 ) ( CLEAR ?auto_565644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_565642 ?auto_565643 ?auto_565644 )
      ( MAKE-6PILE ?auto_565642 ?auto_565643 ?auto_565644 ?auto_565645 ?auto_565646 ?auto_565647 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_565668 - BLOCK
      ?auto_565669 - BLOCK
      ?auto_565670 - BLOCK
      ?auto_565671 - BLOCK
      ?auto_565672 - BLOCK
      ?auto_565673 - BLOCK
    )
    :vars
    (
      ?auto_565674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565673 ?auto_565674 ) ( ON-TABLE ?auto_565668 ) ( not ( = ?auto_565668 ?auto_565669 ) ) ( not ( = ?auto_565668 ?auto_565670 ) ) ( not ( = ?auto_565668 ?auto_565671 ) ) ( not ( = ?auto_565668 ?auto_565672 ) ) ( not ( = ?auto_565668 ?auto_565673 ) ) ( not ( = ?auto_565668 ?auto_565674 ) ) ( not ( = ?auto_565669 ?auto_565670 ) ) ( not ( = ?auto_565669 ?auto_565671 ) ) ( not ( = ?auto_565669 ?auto_565672 ) ) ( not ( = ?auto_565669 ?auto_565673 ) ) ( not ( = ?auto_565669 ?auto_565674 ) ) ( not ( = ?auto_565670 ?auto_565671 ) ) ( not ( = ?auto_565670 ?auto_565672 ) ) ( not ( = ?auto_565670 ?auto_565673 ) ) ( not ( = ?auto_565670 ?auto_565674 ) ) ( not ( = ?auto_565671 ?auto_565672 ) ) ( not ( = ?auto_565671 ?auto_565673 ) ) ( not ( = ?auto_565671 ?auto_565674 ) ) ( not ( = ?auto_565672 ?auto_565673 ) ) ( not ( = ?auto_565672 ?auto_565674 ) ) ( not ( = ?auto_565673 ?auto_565674 ) ) ( ON ?auto_565672 ?auto_565673 ) ( ON ?auto_565671 ?auto_565672 ) ( ON ?auto_565670 ?auto_565671 ) ( CLEAR ?auto_565668 ) ( ON ?auto_565669 ?auto_565670 ) ( CLEAR ?auto_565669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_565668 ?auto_565669 )
      ( MAKE-6PILE ?auto_565668 ?auto_565669 ?auto_565670 ?auto_565671 ?auto_565672 ?auto_565673 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_565694 - BLOCK
      ?auto_565695 - BLOCK
      ?auto_565696 - BLOCK
      ?auto_565697 - BLOCK
      ?auto_565698 - BLOCK
      ?auto_565699 - BLOCK
    )
    :vars
    (
      ?auto_565700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565699 ?auto_565700 ) ( not ( = ?auto_565694 ?auto_565695 ) ) ( not ( = ?auto_565694 ?auto_565696 ) ) ( not ( = ?auto_565694 ?auto_565697 ) ) ( not ( = ?auto_565694 ?auto_565698 ) ) ( not ( = ?auto_565694 ?auto_565699 ) ) ( not ( = ?auto_565694 ?auto_565700 ) ) ( not ( = ?auto_565695 ?auto_565696 ) ) ( not ( = ?auto_565695 ?auto_565697 ) ) ( not ( = ?auto_565695 ?auto_565698 ) ) ( not ( = ?auto_565695 ?auto_565699 ) ) ( not ( = ?auto_565695 ?auto_565700 ) ) ( not ( = ?auto_565696 ?auto_565697 ) ) ( not ( = ?auto_565696 ?auto_565698 ) ) ( not ( = ?auto_565696 ?auto_565699 ) ) ( not ( = ?auto_565696 ?auto_565700 ) ) ( not ( = ?auto_565697 ?auto_565698 ) ) ( not ( = ?auto_565697 ?auto_565699 ) ) ( not ( = ?auto_565697 ?auto_565700 ) ) ( not ( = ?auto_565698 ?auto_565699 ) ) ( not ( = ?auto_565698 ?auto_565700 ) ) ( not ( = ?auto_565699 ?auto_565700 ) ) ( ON ?auto_565698 ?auto_565699 ) ( ON ?auto_565697 ?auto_565698 ) ( ON ?auto_565696 ?auto_565697 ) ( ON ?auto_565695 ?auto_565696 ) ( ON ?auto_565694 ?auto_565695 ) ( CLEAR ?auto_565694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_565694 )
      ( MAKE-6PILE ?auto_565694 ?auto_565695 ?auto_565696 ?auto_565697 ?auto_565698 ?auto_565699 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_565721 - BLOCK
      ?auto_565722 - BLOCK
      ?auto_565723 - BLOCK
      ?auto_565724 - BLOCK
      ?auto_565725 - BLOCK
      ?auto_565726 - BLOCK
      ?auto_565727 - BLOCK
    )
    :vars
    (
      ?auto_565728 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_565726 ) ( ON ?auto_565727 ?auto_565728 ) ( CLEAR ?auto_565727 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_565721 ) ( ON ?auto_565722 ?auto_565721 ) ( ON ?auto_565723 ?auto_565722 ) ( ON ?auto_565724 ?auto_565723 ) ( ON ?auto_565725 ?auto_565724 ) ( ON ?auto_565726 ?auto_565725 ) ( not ( = ?auto_565721 ?auto_565722 ) ) ( not ( = ?auto_565721 ?auto_565723 ) ) ( not ( = ?auto_565721 ?auto_565724 ) ) ( not ( = ?auto_565721 ?auto_565725 ) ) ( not ( = ?auto_565721 ?auto_565726 ) ) ( not ( = ?auto_565721 ?auto_565727 ) ) ( not ( = ?auto_565721 ?auto_565728 ) ) ( not ( = ?auto_565722 ?auto_565723 ) ) ( not ( = ?auto_565722 ?auto_565724 ) ) ( not ( = ?auto_565722 ?auto_565725 ) ) ( not ( = ?auto_565722 ?auto_565726 ) ) ( not ( = ?auto_565722 ?auto_565727 ) ) ( not ( = ?auto_565722 ?auto_565728 ) ) ( not ( = ?auto_565723 ?auto_565724 ) ) ( not ( = ?auto_565723 ?auto_565725 ) ) ( not ( = ?auto_565723 ?auto_565726 ) ) ( not ( = ?auto_565723 ?auto_565727 ) ) ( not ( = ?auto_565723 ?auto_565728 ) ) ( not ( = ?auto_565724 ?auto_565725 ) ) ( not ( = ?auto_565724 ?auto_565726 ) ) ( not ( = ?auto_565724 ?auto_565727 ) ) ( not ( = ?auto_565724 ?auto_565728 ) ) ( not ( = ?auto_565725 ?auto_565726 ) ) ( not ( = ?auto_565725 ?auto_565727 ) ) ( not ( = ?auto_565725 ?auto_565728 ) ) ( not ( = ?auto_565726 ?auto_565727 ) ) ( not ( = ?auto_565726 ?auto_565728 ) ) ( not ( = ?auto_565727 ?auto_565728 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_565727 ?auto_565728 )
      ( !STACK ?auto_565727 ?auto_565726 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_565751 - BLOCK
      ?auto_565752 - BLOCK
      ?auto_565753 - BLOCK
      ?auto_565754 - BLOCK
      ?auto_565755 - BLOCK
      ?auto_565756 - BLOCK
      ?auto_565757 - BLOCK
    )
    :vars
    (
      ?auto_565758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565757 ?auto_565758 ) ( ON-TABLE ?auto_565751 ) ( ON ?auto_565752 ?auto_565751 ) ( ON ?auto_565753 ?auto_565752 ) ( ON ?auto_565754 ?auto_565753 ) ( ON ?auto_565755 ?auto_565754 ) ( not ( = ?auto_565751 ?auto_565752 ) ) ( not ( = ?auto_565751 ?auto_565753 ) ) ( not ( = ?auto_565751 ?auto_565754 ) ) ( not ( = ?auto_565751 ?auto_565755 ) ) ( not ( = ?auto_565751 ?auto_565756 ) ) ( not ( = ?auto_565751 ?auto_565757 ) ) ( not ( = ?auto_565751 ?auto_565758 ) ) ( not ( = ?auto_565752 ?auto_565753 ) ) ( not ( = ?auto_565752 ?auto_565754 ) ) ( not ( = ?auto_565752 ?auto_565755 ) ) ( not ( = ?auto_565752 ?auto_565756 ) ) ( not ( = ?auto_565752 ?auto_565757 ) ) ( not ( = ?auto_565752 ?auto_565758 ) ) ( not ( = ?auto_565753 ?auto_565754 ) ) ( not ( = ?auto_565753 ?auto_565755 ) ) ( not ( = ?auto_565753 ?auto_565756 ) ) ( not ( = ?auto_565753 ?auto_565757 ) ) ( not ( = ?auto_565753 ?auto_565758 ) ) ( not ( = ?auto_565754 ?auto_565755 ) ) ( not ( = ?auto_565754 ?auto_565756 ) ) ( not ( = ?auto_565754 ?auto_565757 ) ) ( not ( = ?auto_565754 ?auto_565758 ) ) ( not ( = ?auto_565755 ?auto_565756 ) ) ( not ( = ?auto_565755 ?auto_565757 ) ) ( not ( = ?auto_565755 ?auto_565758 ) ) ( not ( = ?auto_565756 ?auto_565757 ) ) ( not ( = ?auto_565756 ?auto_565758 ) ) ( not ( = ?auto_565757 ?auto_565758 ) ) ( CLEAR ?auto_565755 ) ( ON ?auto_565756 ?auto_565757 ) ( CLEAR ?auto_565756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_565751 ?auto_565752 ?auto_565753 ?auto_565754 ?auto_565755 ?auto_565756 )
      ( MAKE-7PILE ?auto_565751 ?auto_565752 ?auto_565753 ?auto_565754 ?auto_565755 ?auto_565756 ?auto_565757 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_565781 - BLOCK
      ?auto_565782 - BLOCK
      ?auto_565783 - BLOCK
      ?auto_565784 - BLOCK
      ?auto_565785 - BLOCK
      ?auto_565786 - BLOCK
      ?auto_565787 - BLOCK
    )
    :vars
    (
      ?auto_565788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565787 ?auto_565788 ) ( ON-TABLE ?auto_565781 ) ( ON ?auto_565782 ?auto_565781 ) ( ON ?auto_565783 ?auto_565782 ) ( ON ?auto_565784 ?auto_565783 ) ( not ( = ?auto_565781 ?auto_565782 ) ) ( not ( = ?auto_565781 ?auto_565783 ) ) ( not ( = ?auto_565781 ?auto_565784 ) ) ( not ( = ?auto_565781 ?auto_565785 ) ) ( not ( = ?auto_565781 ?auto_565786 ) ) ( not ( = ?auto_565781 ?auto_565787 ) ) ( not ( = ?auto_565781 ?auto_565788 ) ) ( not ( = ?auto_565782 ?auto_565783 ) ) ( not ( = ?auto_565782 ?auto_565784 ) ) ( not ( = ?auto_565782 ?auto_565785 ) ) ( not ( = ?auto_565782 ?auto_565786 ) ) ( not ( = ?auto_565782 ?auto_565787 ) ) ( not ( = ?auto_565782 ?auto_565788 ) ) ( not ( = ?auto_565783 ?auto_565784 ) ) ( not ( = ?auto_565783 ?auto_565785 ) ) ( not ( = ?auto_565783 ?auto_565786 ) ) ( not ( = ?auto_565783 ?auto_565787 ) ) ( not ( = ?auto_565783 ?auto_565788 ) ) ( not ( = ?auto_565784 ?auto_565785 ) ) ( not ( = ?auto_565784 ?auto_565786 ) ) ( not ( = ?auto_565784 ?auto_565787 ) ) ( not ( = ?auto_565784 ?auto_565788 ) ) ( not ( = ?auto_565785 ?auto_565786 ) ) ( not ( = ?auto_565785 ?auto_565787 ) ) ( not ( = ?auto_565785 ?auto_565788 ) ) ( not ( = ?auto_565786 ?auto_565787 ) ) ( not ( = ?auto_565786 ?auto_565788 ) ) ( not ( = ?auto_565787 ?auto_565788 ) ) ( ON ?auto_565786 ?auto_565787 ) ( CLEAR ?auto_565784 ) ( ON ?auto_565785 ?auto_565786 ) ( CLEAR ?auto_565785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_565781 ?auto_565782 ?auto_565783 ?auto_565784 ?auto_565785 )
      ( MAKE-7PILE ?auto_565781 ?auto_565782 ?auto_565783 ?auto_565784 ?auto_565785 ?auto_565786 ?auto_565787 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_565811 - BLOCK
      ?auto_565812 - BLOCK
      ?auto_565813 - BLOCK
      ?auto_565814 - BLOCK
      ?auto_565815 - BLOCK
      ?auto_565816 - BLOCK
      ?auto_565817 - BLOCK
    )
    :vars
    (
      ?auto_565818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565817 ?auto_565818 ) ( ON-TABLE ?auto_565811 ) ( ON ?auto_565812 ?auto_565811 ) ( ON ?auto_565813 ?auto_565812 ) ( not ( = ?auto_565811 ?auto_565812 ) ) ( not ( = ?auto_565811 ?auto_565813 ) ) ( not ( = ?auto_565811 ?auto_565814 ) ) ( not ( = ?auto_565811 ?auto_565815 ) ) ( not ( = ?auto_565811 ?auto_565816 ) ) ( not ( = ?auto_565811 ?auto_565817 ) ) ( not ( = ?auto_565811 ?auto_565818 ) ) ( not ( = ?auto_565812 ?auto_565813 ) ) ( not ( = ?auto_565812 ?auto_565814 ) ) ( not ( = ?auto_565812 ?auto_565815 ) ) ( not ( = ?auto_565812 ?auto_565816 ) ) ( not ( = ?auto_565812 ?auto_565817 ) ) ( not ( = ?auto_565812 ?auto_565818 ) ) ( not ( = ?auto_565813 ?auto_565814 ) ) ( not ( = ?auto_565813 ?auto_565815 ) ) ( not ( = ?auto_565813 ?auto_565816 ) ) ( not ( = ?auto_565813 ?auto_565817 ) ) ( not ( = ?auto_565813 ?auto_565818 ) ) ( not ( = ?auto_565814 ?auto_565815 ) ) ( not ( = ?auto_565814 ?auto_565816 ) ) ( not ( = ?auto_565814 ?auto_565817 ) ) ( not ( = ?auto_565814 ?auto_565818 ) ) ( not ( = ?auto_565815 ?auto_565816 ) ) ( not ( = ?auto_565815 ?auto_565817 ) ) ( not ( = ?auto_565815 ?auto_565818 ) ) ( not ( = ?auto_565816 ?auto_565817 ) ) ( not ( = ?auto_565816 ?auto_565818 ) ) ( not ( = ?auto_565817 ?auto_565818 ) ) ( ON ?auto_565816 ?auto_565817 ) ( ON ?auto_565815 ?auto_565816 ) ( CLEAR ?auto_565813 ) ( ON ?auto_565814 ?auto_565815 ) ( CLEAR ?auto_565814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_565811 ?auto_565812 ?auto_565813 ?auto_565814 )
      ( MAKE-7PILE ?auto_565811 ?auto_565812 ?auto_565813 ?auto_565814 ?auto_565815 ?auto_565816 ?auto_565817 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_565841 - BLOCK
      ?auto_565842 - BLOCK
      ?auto_565843 - BLOCK
      ?auto_565844 - BLOCK
      ?auto_565845 - BLOCK
      ?auto_565846 - BLOCK
      ?auto_565847 - BLOCK
    )
    :vars
    (
      ?auto_565848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565847 ?auto_565848 ) ( ON-TABLE ?auto_565841 ) ( ON ?auto_565842 ?auto_565841 ) ( not ( = ?auto_565841 ?auto_565842 ) ) ( not ( = ?auto_565841 ?auto_565843 ) ) ( not ( = ?auto_565841 ?auto_565844 ) ) ( not ( = ?auto_565841 ?auto_565845 ) ) ( not ( = ?auto_565841 ?auto_565846 ) ) ( not ( = ?auto_565841 ?auto_565847 ) ) ( not ( = ?auto_565841 ?auto_565848 ) ) ( not ( = ?auto_565842 ?auto_565843 ) ) ( not ( = ?auto_565842 ?auto_565844 ) ) ( not ( = ?auto_565842 ?auto_565845 ) ) ( not ( = ?auto_565842 ?auto_565846 ) ) ( not ( = ?auto_565842 ?auto_565847 ) ) ( not ( = ?auto_565842 ?auto_565848 ) ) ( not ( = ?auto_565843 ?auto_565844 ) ) ( not ( = ?auto_565843 ?auto_565845 ) ) ( not ( = ?auto_565843 ?auto_565846 ) ) ( not ( = ?auto_565843 ?auto_565847 ) ) ( not ( = ?auto_565843 ?auto_565848 ) ) ( not ( = ?auto_565844 ?auto_565845 ) ) ( not ( = ?auto_565844 ?auto_565846 ) ) ( not ( = ?auto_565844 ?auto_565847 ) ) ( not ( = ?auto_565844 ?auto_565848 ) ) ( not ( = ?auto_565845 ?auto_565846 ) ) ( not ( = ?auto_565845 ?auto_565847 ) ) ( not ( = ?auto_565845 ?auto_565848 ) ) ( not ( = ?auto_565846 ?auto_565847 ) ) ( not ( = ?auto_565846 ?auto_565848 ) ) ( not ( = ?auto_565847 ?auto_565848 ) ) ( ON ?auto_565846 ?auto_565847 ) ( ON ?auto_565845 ?auto_565846 ) ( ON ?auto_565844 ?auto_565845 ) ( CLEAR ?auto_565842 ) ( ON ?auto_565843 ?auto_565844 ) ( CLEAR ?auto_565843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_565841 ?auto_565842 ?auto_565843 )
      ( MAKE-7PILE ?auto_565841 ?auto_565842 ?auto_565843 ?auto_565844 ?auto_565845 ?auto_565846 ?auto_565847 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_565871 - BLOCK
      ?auto_565872 - BLOCK
      ?auto_565873 - BLOCK
      ?auto_565874 - BLOCK
      ?auto_565875 - BLOCK
      ?auto_565876 - BLOCK
      ?auto_565877 - BLOCK
    )
    :vars
    (
      ?auto_565878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565877 ?auto_565878 ) ( ON-TABLE ?auto_565871 ) ( not ( = ?auto_565871 ?auto_565872 ) ) ( not ( = ?auto_565871 ?auto_565873 ) ) ( not ( = ?auto_565871 ?auto_565874 ) ) ( not ( = ?auto_565871 ?auto_565875 ) ) ( not ( = ?auto_565871 ?auto_565876 ) ) ( not ( = ?auto_565871 ?auto_565877 ) ) ( not ( = ?auto_565871 ?auto_565878 ) ) ( not ( = ?auto_565872 ?auto_565873 ) ) ( not ( = ?auto_565872 ?auto_565874 ) ) ( not ( = ?auto_565872 ?auto_565875 ) ) ( not ( = ?auto_565872 ?auto_565876 ) ) ( not ( = ?auto_565872 ?auto_565877 ) ) ( not ( = ?auto_565872 ?auto_565878 ) ) ( not ( = ?auto_565873 ?auto_565874 ) ) ( not ( = ?auto_565873 ?auto_565875 ) ) ( not ( = ?auto_565873 ?auto_565876 ) ) ( not ( = ?auto_565873 ?auto_565877 ) ) ( not ( = ?auto_565873 ?auto_565878 ) ) ( not ( = ?auto_565874 ?auto_565875 ) ) ( not ( = ?auto_565874 ?auto_565876 ) ) ( not ( = ?auto_565874 ?auto_565877 ) ) ( not ( = ?auto_565874 ?auto_565878 ) ) ( not ( = ?auto_565875 ?auto_565876 ) ) ( not ( = ?auto_565875 ?auto_565877 ) ) ( not ( = ?auto_565875 ?auto_565878 ) ) ( not ( = ?auto_565876 ?auto_565877 ) ) ( not ( = ?auto_565876 ?auto_565878 ) ) ( not ( = ?auto_565877 ?auto_565878 ) ) ( ON ?auto_565876 ?auto_565877 ) ( ON ?auto_565875 ?auto_565876 ) ( ON ?auto_565874 ?auto_565875 ) ( ON ?auto_565873 ?auto_565874 ) ( CLEAR ?auto_565871 ) ( ON ?auto_565872 ?auto_565873 ) ( CLEAR ?auto_565872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_565871 ?auto_565872 )
      ( MAKE-7PILE ?auto_565871 ?auto_565872 ?auto_565873 ?auto_565874 ?auto_565875 ?auto_565876 ?auto_565877 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_565901 - BLOCK
      ?auto_565902 - BLOCK
      ?auto_565903 - BLOCK
      ?auto_565904 - BLOCK
      ?auto_565905 - BLOCK
      ?auto_565906 - BLOCK
      ?auto_565907 - BLOCK
    )
    :vars
    (
      ?auto_565908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565907 ?auto_565908 ) ( not ( = ?auto_565901 ?auto_565902 ) ) ( not ( = ?auto_565901 ?auto_565903 ) ) ( not ( = ?auto_565901 ?auto_565904 ) ) ( not ( = ?auto_565901 ?auto_565905 ) ) ( not ( = ?auto_565901 ?auto_565906 ) ) ( not ( = ?auto_565901 ?auto_565907 ) ) ( not ( = ?auto_565901 ?auto_565908 ) ) ( not ( = ?auto_565902 ?auto_565903 ) ) ( not ( = ?auto_565902 ?auto_565904 ) ) ( not ( = ?auto_565902 ?auto_565905 ) ) ( not ( = ?auto_565902 ?auto_565906 ) ) ( not ( = ?auto_565902 ?auto_565907 ) ) ( not ( = ?auto_565902 ?auto_565908 ) ) ( not ( = ?auto_565903 ?auto_565904 ) ) ( not ( = ?auto_565903 ?auto_565905 ) ) ( not ( = ?auto_565903 ?auto_565906 ) ) ( not ( = ?auto_565903 ?auto_565907 ) ) ( not ( = ?auto_565903 ?auto_565908 ) ) ( not ( = ?auto_565904 ?auto_565905 ) ) ( not ( = ?auto_565904 ?auto_565906 ) ) ( not ( = ?auto_565904 ?auto_565907 ) ) ( not ( = ?auto_565904 ?auto_565908 ) ) ( not ( = ?auto_565905 ?auto_565906 ) ) ( not ( = ?auto_565905 ?auto_565907 ) ) ( not ( = ?auto_565905 ?auto_565908 ) ) ( not ( = ?auto_565906 ?auto_565907 ) ) ( not ( = ?auto_565906 ?auto_565908 ) ) ( not ( = ?auto_565907 ?auto_565908 ) ) ( ON ?auto_565906 ?auto_565907 ) ( ON ?auto_565905 ?auto_565906 ) ( ON ?auto_565904 ?auto_565905 ) ( ON ?auto_565903 ?auto_565904 ) ( ON ?auto_565902 ?auto_565903 ) ( ON ?auto_565901 ?auto_565902 ) ( CLEAR ?auto_565901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_565901 )
      ( MAKE-7PILE ?auto_565901 ?auto_565902 ?auto_565903 ?auto_565904 ?auto_565905 ?auto_565906 ?auto_565907 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_565932 - BLOCK
      ?auto_565933 - BLOCK
      ?auto_565934 - BLOCK
      ?auto_565935 - BLOCK
      ?auto_565936 - BLOCK
      ?auto_565937 - BLOCK
      ?auto_565938 - BLOCK
      ?auto_565939 - BLOCK
    )
    :vars
    (
      ?auto_565940 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_565938 ) ( ON ?auto_565939 ?auto_565940 ) ( CLEAR ?auto_565939 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_565932 ) ( ON ?auto_565933 ?auto_565932 ) ( ON ?auto_565934 ?auto_565933 ) ( ON ?auto_565935 ?auto_565934 ) ( ON ?auto_565936 ?auto_565935 ) ( ON ?auto_565937 ?auto_565936 ) ( ON ?auto_565938 ?auto_565937 ) ( not ( = ?auto_565932 ?auto_565933 ) ) ( not ( = ?auto_565932 ?auto_565934 ) ) ( not ( = ?auto_565932 ?auto_565935 ) ) ( not ( = ?auto_565932 ?auto_565936 ) ) ( not ( = ?auto_565932 ?auto_565937 ) ) ( not ( = ?auto_565932 ?auto_565938 ) ) ( not ( = ?auto_565932 ?auto_565939 ) ) ( not ( = ?auto_565932 ?auto_565940 ) ) ( not ( = ?auto_565933 ?auto_565934 ) ) ( not ( = ?auto_565933 ?auto_565935 ) ) ( not ( = ?auto_565933 ?auto_565936 ) ) ( not ( = ?auto_565933 ?auto_565937 ) ) ( not ( = ?auto_565933 ?auto_565938 ) ) ( not ( = ?auto_565933 ?auto_565939 ) ) ( not ( = ?auto_565933 ?auto_565940 ) ) ( not ( = ?auto_565934 ?auto_565935 ) ) ( not ( = ?auto_565934 ?auto_565936 ) ) ( not ( = ?auto_565934 ?auto_565937 ) ) ( not ( = ?auto_565934 ?auto_565938 ) ) ( not ( = ?auto_565934 ?auto_565939 ) ) ( not ( = ?auto_565934 ?auto_565940 ) ) ( not ( = ?auto_565935 ?auto_565936 ) ) ( not ( = ?auto_565935 ?auto_565937 ) ) ( not ( = ?auto_565935 ?auto_565938 ) ) ( not ( = ?auto_565935 ?auto_565939 ) ) ( not ( = ?auto_565935 ?auto_565940 ) ) ( not ( = ?auto_565936 ?auto_565937 ) ) ( not ( = ?auto_565936 ?auto_565938 ) ) ( not ( = ?auto_565936 ?auto_565939 ) ) ( not ( = ?auto_565936 ?auto_565940 ) ) ( not ( = ?auto_565937 ?auto_565938 ) ) ( not ( = ?auto_565937 ?auto_565939 ) ) ( not ( = ?auto_565937 ?auto_565940 ) ) ( not ( = ?auto_565938 ?auto_565939 ) ) ( not ( = ?auto_565938 ?auto_565940 ) ) ( not ( = ?auto_565939 ?auto_565940 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_565939 ?auto_565940 )
      ( !STACK ?auto_565939 ?auto_565938 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_565966 - BLOCK
      ?auto_565967 - BLOCK
      ?auto_565968 - BLOCK
      ?auto_565969 - BLOCK
      ?auto_565970 - BLOCK
      ?auto_565971 - BLOCK
      ?auto_565972 - BLOCK
      ?auto_565973 - BLOCK
    )
    :vars
    (
      ?auto_565974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_565973 ?auto_565974 ) ( ON-TABLE ?auto_565966 ) ( ON ?auto_565967 ?auto_565966 ) ( ON ?auto_565968 ?auto_565967 ) ( ON ?auto_565969 ?auto_565968 ) ( ON ?auto_565970 ?auto_565969 ) ( ON ?auto_565971 ?auto_565970 ) ( not ( = ?auto_565966 ?auto_565967 ) ) ( not ( = ?auto_565966 ?auto_565968 ) ) ( not ( = ?auto_565966 ?auto_565969 ) ) ( not ( = ?auto_565966 ?auto_565970 ) ) ( not ( = ?auto_565966 ?auto_565971 ) ) ( not ( = ?auto_565966 ?auto_565972 ) ) ( not ( = ?auto_565966 ?auto_565973 ) ) ( not ( = ?auto_565966 ?auto_565974 ) ) ( not ( = ?auto_565967 ?auto_565968 ) ) ( not ( = ?auto_565967 ?auto_565969 ) ) ( not ( = ?auto_565967 ?auto_565970 ) ) ( not ( = ?auto_565967 ?auto_565971 ) ) ( not ( = ?auto_565967 ?auto_565972 ) ) ( not ( = ?auto_565967 ?auto_565973 ) ) ( not ( = ?auto_565967 ?auto_565974 ) ) ( not ( = ?auto_565968 ?auto_565969 ) ) ( not ( = ?auto_565968 ?auto_565970 ) ) ( not ( = ?auto_565968 ?auto_565971 ) ) ( not ( = ?auto_565968 ?auto_565972 ) ) ( not ( = ?auto_565968 ?auto_565973 ) ) ( not ( = ?auto_565968 ?auto_565974 ) ) ( not ( = ?auto_565969 ?auto_565970 ) ) ( not ( = ?auto_565969 ?auto_565971 ) ) ( not ( = ?auto_565969 ?auto_565972 ) ) ( not ( = ?auto_565969 ?auto_565973 ) ) ( not ( = ?auto_565969 ?auto_565974 ) ) ( not ( = ?auto_565970 ?auto_565971 ) ) ( not ( = ?auto_565970 ?auto_565972 ) ) ( not ( = ?auto_565970 ?auto_565973 ) ) ( not ( = ?auto_565970 ?auto_565974 ) ) ( not ( = ?auto_565971 ?auto_565972 ) ) ( not ( = ?auto_565971 ?auto_565973 ) ) ( not ( = ?auto_565971 ?auto_565974 ) ) ( not ( = ?auto_565972 ?auto_565973 ) ) ( not ( = ?auto_565972 ?auto_565974 ) ) ( not ( = ?auto_565973 ?auto_565974 ) ) ( CLEAR ?auto_565971 ) ( ON ?auto_565972 ?auto_565973 ) ( CLEAR ?auto_565972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_565966 ?auto_565967 ?auto_565968 ?auto_565969 ?auto_565970 ?auto_565971 ?auto_565972 )
      ( MAKE-8PILE ?auto_565966 ?auto_565967 ?auto_565968 ?auto_565969 ?auto_565970 ?auto_565971 ?auto_565972 ?auto_565973 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_566000 - BLOCK
      ?auto_566001 - BLOCK
      ?auto_566002 - BLOCK
      ?auto_566003 - BLOCK
      ?auto_566004 - BLOCK
      ?auto_566005 - BLOCK
      ?auto_566006 - BLOCK
      ?auto_566007 - BLOCK
    )
    :vars
    (
      ?auto_566008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_566007 ?auto_566008 ) ( ON-TABLE ?auto_566000 ) ( ON ?auto_566001 ?auto_566000 ) ( ON ?auto_566002 ?auto_566001 ) ( ON ?auto_566003 ?auto_566002 ) ( ON ?auto_566004 ?auto_566003 ) ( not ( = ?auto_566000 ?auto_566001 ) ) ( not ( = ?auto_566000 ?auto_566002 ) ) ( not ( = ?auto_566000 ?auto_566003 ) ) ( not ( = ?auto_566000 ?auto_566004 ) ) ( not ( = ?auto_566000 ?auto_566005 ) ) ( not ( = ?auto_566000 ?auto_566006 ) ) ( not ( = ?auto_566000 ?auto_566007 ) ) ( not ( = ?auto_566000 ?auto_566008 ) ) ( not ( = ?auto_566001 ?auto_566002 ) ) ( not ( = ?auto_566001 ?auto_566003 ) ) ( not ( = ?auto_566001 ?auto_566004 ) ) ( not ( = ?auto_566001 ?auto_566005 ) ) ( not ( = ?auto_566001 ?auto_566006 ) ) ( not ( = ?auto_566001 ?auto_566007 ) ) ( not ( = ?auto_566001 ?auto_566008 ) ) ( not ( = ?auto_566002 ?auto_566003 ) ) ( not ( = ?auto_566002 ?auto_566004 ) ) ( not ( = ?auto_566002 ?auto_566005 ) ) ( not ( = ?auto_566002 ?auto_566006 ) ) ( not ( = ?auto_566002 ?auto_566007 ) ) ( not ( = ?auto_566002 ?auto_566008 ) ) ( not ( = ?auto_566003 ?auto_566004 ) ) ( not ( = ?auto_566003 ?auto_566005 ) ) ( not ( = ?auto_566003 ?auto_566006 ) ) ( not ( = ?auto_566003 ?auto_566007 ) ) ( not ( = ?auto_566003 ?auto_566008 ) ) ( not ( = ?auto_566004 ?auto_566005 ) ) ( not ( = ?auto_566004 ?auto_566006 ) ) ( not ( = ?auto_566004 ?auto_566007 ) ) ( not ( = ?auto_566004 ?auto_566008 ) ) ( not ( = ?auto_566005 ?auto_566006 ) ) ( not ( = ?auto_566005 ?auto_566007 ) ) ( not ( = ?auto_566005 ?auto_566008 ) ) ( not ( = ?auto_566006 ?auto_566007 ) ) ( not ( = ?auto_566006 ?auto_566008 ) ) ( not ( = ?auto_566007 ?auto_566008 ) ) ( ON ?auto_566006 ?auto_566007 ) ( CLEAR ?auto_566004 ) ( ON ?auto_566005 ?auto_566006 ) ( CLEAR ?auto_566005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_566000 ?auto_566001 ?auto_566002 ?auto_566003 ?auto_566004 ?auto_566005 )
      ( MAKE-8PILE ?auto_566000 ?auto_566001 ?auto_566002 ?auto_566003 ?auto_566004 ?auto_566005 ?auto_566006 ?auto_566007 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_566034 - BLOCK
      ?auto_566035 - BLOCK
      ?auto_566036 - BLOCK
      ?auto_566037 - BLOCK
      ?auto_566038 - BLOCK
      ?auto_566039 - BLOCK
      ?auto_566040 - BLOCK
      ?auto_566041 - BLOCK
    )
    :vars
    (
      ?auto_566042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_566041 ?auto_566042 ) ( ON-TABLE ?auto_566034 ) ( ON ?auto_566035 ?auto_566034 ) ( ON ?auto_566036 ?auto_566035 ) ( ON ?auto_566037 ?auto_566036 ) ( not ( = ?auto_566034 ?auto_566035 ) ) ( not ( = ?auto_566034 ?auto_566036 ) ) ( not ( = ?auto_566034 ?auto_566037 ) ) ( not ( = ?auto_566034 ?auto_566038 ) ) ( not ( = ?auto_566034 ?auto_566039 ) ) ( not ( = ?auto_566034 ?auto_566040 ) ) ( not ( = ?auto_566034 ?auto_566041 ) ) ( not ( = ?auto_566034 ?auto_566042 ) ) ( not ( = ?auto_566035 ?auto_566036 ) ) ( not ( = ?auto_566035 ?auto_566037 ) ) ( not ( = ?auto_566035 ?auto_566038 ) ) ( not ( = ?auto_566035 ?auto_566039 ) ) ( not ( = ?auto_566035 ?auto_566040 ) ) ( not ( = ?auto_566035 ?auto_566041 ) ) ( not ( = ?auto_566035 ?auto_566042 ) ) ( not ( = ?auto_566036 ?auto_566037 ) ) ( not ( = ?auto_566036 ?auto_566038 ) ) ( not ( = ?auto_566036 ?auto_566039 ) ) ( not ( = ?auto_566036 ?auto_566040 ) ) ( not ( = ?auto_566036 ?auto_566041 ) ) ( not ( = ?auto_566036 ?auto_566042 ) ) ( not ( = ?auto_566037 ?auto_566038 ) ) ( not ( = ?auto_566037 ?auto_566039 ) ) ( not ( = ?auto_566037 ?auto_566040 ) ) ( not ( = ?auto_566037 ?auto_566041 ) ) ( not ( = ?auto_566037 ?auto_566042 ) ) ( not ( = ?auto_566038 ?auto_566039 ) ) ( not ( = ?auto_566038 ?auto_566040 ) ) ( not ( = ?auto_566038 ?auto_566041 ) ) ( not ( = ?auto_566038 ?auto_566042 ) ) ( not ( = ?auto_566039 ?auto_566040 ) ) ( not ( = ?auto_566039 ?auto_566041 ) ) ( not ( = ?auto_566039 ?auto_566042 ) ) ( not ( = ?auto_566040 ?auto_566041 ) ) ( not ( = ?auto_566040 ?auto_566042 ) ) ( not ( = ?auto_566041 ?auto_566042 ) ) ( ON ?auto_566040 ?auto_566041 ) ( ON ?auto_566039 ?auto_566040 ) ( CLEAR ?auto_566037 ) ( ON ?auto_566038 ?auto_566039 ) ( CLEAR ?auto_566038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_566034 ?auto_566035 ?auto_566036 ?auto_566037 ?auto_566038 )
      ( MAKE-8PILE ?auto_566034 ?auto_566035 ?auto_566036 ?auto_566037 ?auto_566038 ?auto_566039 ?auto_566040 ?auto_566041 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_566068 - BLOCK
      ?auto_566069 - BLOCK
      ?auto_566070 - BLOCK
      ?auto_566071 - BLOCK
      ?auto_566072 - BLOCK
      ?auto_566073 - BLOCK
      ?auto_566074 - BLOCK
      ?auto_566075 - BLOCK
    )
    :vars
    (
      ?auto_566076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_566075 ?auto_566076 ) ( ON-TABLE ?auto_566068 ) ( ON ?auto_566069 ?auto_566068 ) ( ON ?auto_566070 ?auto_566069 ) ( not ( = ?auto_566068 ?auto_566069 ) ) ( not ( = ?auto_566068 ?auto_566070 ) ) ( not ( = ?auto_566068 ?auto_566071 ) ) ( not ( = ?auto_566068 ?auto_566072 ) ) ( not ( = ?auto_566068 ?auto_566073 ) ) ( not ( = ?auto_566068 ?auto_566074 ) ) ( not ( = ?auto_566068 ?auto_566075 ) ) ( not ( = ?auto_566068 ?auto_566076 ) ) ( not ( = ?auto_566069 ?auto_566070 ) ) ( not ( = ?auto_566069 ?auto_566071 ) ) ( not ( = ?auto_566069 ?auto_566072 ) ) ( not ( = ?auto_566069 ?auto_566073 ) ) ( not ( = ?auto_566069 ?auto_566074 ) ) ( not ( = ?auto_566069 ?auto_566075 ) ) ( not ( = ?auto_566069 ?auto_566076 ) ) ( not ( = ?auto_566070 ?auto_566071 ) ) ( not ( = ?auto_566070 ?auto_566072 ) ) ( not ( = ?auto_566070 ?auto_566073 ) ) ( not ( = ?auto_566070 ?auto_566074 ) ) ( not ( = ?auto_566070 ?auto_566075 ) ) ( not ( = ?auto_566070 ?auto_566076 ) ) ( not ( = ?auto_566071 ?auto_566072 ) ) ( not ( = ?auto_566071 ?auto_566073 ) ) ( not ( = ?auto_566071 ?auto_566074 ) ) ( not ( = ?auto_566071 ?auto_566075 ) ) ( not ( = ?auto_566071 ?auto_566076 ) ) ( not ( = ?auto_566072 ?auto_566073 ) ) ( not ( = ?auto_566072 ?auto_566074 ) ) ( not ( = ?auto_566072 ?auto_566075 ) ) ( not ( = ?auto_566072 ?auto_566076 ) ) ( not ( = ?auto_566073 ?auto_566074 ) ) ( not ( = ?auto_566073 ?auto_566075 ) ) ( not ( = ?auto_566073 ?auto_566076 ) ) ( not ( = ?auto_566074 ?auto_566075 ) ) ( not ( = ?auto_566074 ?auto_566076 ) ) ( not ( = ?auto_566075 ?auto_566076 ) ) ( ON ?auto_566074 ?auto_566075 ) ( ON ?auto_566073 ?auto_566074 ) ( ON ?auto_566072 ?auto_566073 ) ( CLEAR ?auto_566070 ) ( ON ?auto_566071 ?auto_566072 ) ( CLEAR ?auto_566071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_566068 ?auto_566069 ?auto_566070 ?auto_566071 )
      ( MAKE-8PILE ?auto_566068 ?auto_566069 ?auto_566070 ?auto_566071 ?auto_566072 ?auto_566073 ?auto_566074 ?auto_566075 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_566102 - BLOCK
      ?auto_566103 - BLOCK
      ?auto_566104 - BLOCK
      ?auto_566105 - BLOCK
      ?auto_566106 - BLOCK
      ?auto_566107 - BLOCK
      ?auto_566108 - BLOCK
      ?auto_566109 - BLOCK
    )
    :vars
    (
      ?auto_566110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_566109 ?auto_566110 ) ( ON-TABLE ?auto_566102 ) ( ON ?auto_566103 ?auto_566102 ) ( not ( = ?auto_566102 ?auto_566103 ) ) ( not ( = ?auto_566102 ?auto_566104 ) ) ( not ( = ?auto_566102 ?auto_566105 ) ) ( not ( = ?auto_566102 ?auto_566106 ) ) ( not ( = ?auto_566102 ?auto_566107 ) ) ( not ( = ?auto_566102 ?auto_566108 ) ) ( not ( = ?auto_566102 ?auto_566109 ) ) ( not ( = ?auto_566102 ?auto_566110 ) ) ( not ( = ?auto_566103 ?auto_566104 ) ) ( not ( = ?auto_566103 ?auto_566105 ) ) ( not ( = ?auto_566103 ?auto_566106 ) ) ( not ( = ?auto_566103 ?auto_566107 ) ) ( not ( = ?auto_566103 ?auto_566108 ) ) ( not ( = ?auto_566103 ?auto_566109 ) ) ( not ( = ?auto_566103 ?auto_566110 ) ) ( not ( = ?auto_566104 ?auto_566105 ) ) ( not ( = ?auto_566104 ?auto_566106 ) ) ( not ( = ?auto_566104 ?auto_566107 ) ) ( not ( = ?auto_566104 ?auto_566108 ) ) ( not ( = ?auto_566104 ?auto_566109 ) ) ( not ( = ?auto_566104 ?auto_566110 ) ) ( not ( = ?auto_566105 ?auto_566106 ) ) ( not ( = ?auto_566105 ?auto_566107 ) ) ( not ( = ?auto_566105 ?auto_566108 ) ) ( not ( = ?auto_566105 ?auto_566109 ) ) ( not ( = ?auto_566105 ?auto_566110 ) ) ( not ( = ?auto_566106 ?auto_566107 ) ) ( not ( = ?auto_566106 ?auto_566108 ) ) ( not ( = ?auto_566106 ?auto_566109 ) ) ( not ( = ?auto_566106 ?auto_566110 ) ) ( not ( = ?auto_566107 ?auto_566108 ) ) ( not ( = ?auto_566107 ?auto_566109 ) ) ( not ( = ?auto_566107 ?auto_566110 ) ) ( not ( = ?auto_566108 ?auto_566109 ) ) ( not ( = ?auto_566108 ?auto_566110 ) ) ( not ( = ?auto_566109 ?auto_566110 ) ) ( ON ?auto_566108 ?auto_566109 ) ( ON ?auto_566107 ?auto_566108 ) ( ON ?auto_566106 ?auto_566107 ) ( ON ?auto_566105 ?auto_566106 ) ( CLEAR ?auto_566103 ) ( ON ?auto_566104 ?auto_566105 ) ( CLEAR ?auto_566104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_566102 ?auto_566103 ?auto_566104 )
      ( MAKE-8PILE ?auto_566102 ?auto_566103 ?auto_566104 ?auto_566105 ?auto_566106 ?auto_566107 ?auto_566108 ?auto_566109 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_566136 - BLOCK
      ?auto_566137 - BLOCK
      ?auto_566138 - BLOCK
      ?auto_566139 - BLOCK
      ?auto_566140 - BLOCK
      ?auto_566141 - BLOCK
      ?auto_566142 - BLOCK
      ?auto_566143 - BLOCK
    )
    :vars
    (
      ?auto_566144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_566143 ?auto_566144 ) ( ON-TABLE ?auto_566136 ) ( not ( = ?auto_566136 ?auto_566137 ) ) ( not ( = ?auto_566136 ?auto_566138 ) ) ( not ( = ?auto_566136 ?auto_566139 ) ) ( not ( = ?auto_566136 ?auto_566140 ) ) ( not ( = ?auto_566136 ?auto_566141 ) ) ( not ( = ?auto_566136 ?auto_566142 ) ) ( not ( = ?auto_566136 ?auto_566143 ) ) ( not ( = ?auto_566136 ?auto_566144 ) ) ( not ( = ?auto_566137 ?auto_566138 ) ) ( not ( = ?auto_566137 ?auto_566139 ) ) ( not ( = ?auto_566137 ?auto_566140 ) ) ( not ( = ?auto_566137 ?auto_566141 ) ) ( not ( = ?auto_566137 ?auto_566142 ) ) ( not ( = ?auto_566137 ?auto_566143 ) ) ( not ( = ?auto_566137 ?auto_566144 ) ) ( not ( = ?auto_566138 ?auto_566139 ) ) ( not ( = ?auto_566138 ?auto_566140 ) ) ( not ( = ?auto_566138 ?auto_566141 ) ) ( not ( = ?auto_566138 ?auto_566142 ) ) ( not ( = ?auto_566138 ?auto_566143 ) ) ( not ( = ?auto_566138 ?auto_566144 ) ) ( not ( = ?auto_566139 ?auto_566140 ) ) ( not ( = ?auto_566139 ?auto_566141 ) ) ( not ( = ?auto_566139 ?auto_566142 ) ) ( not ( = ?auto_566139 ?auto_566143 ) ) ( not ( = ?auto_566139 ?auto_566144 ) ) ( not ( = ?auto_566140 ?auto_566141 ) ) ( not ( = ?auto_566140 ?auto_566142 ) ) ( not ( = ?auto_566140 ?auto_566143 ) ) ( not ( = ?auto_566140 ?auto_566144 ) ) ( not ( = ?auto_566141 ?auto_566142 ) ) ( not ( = ?auto_566141 ?auto_566143 ) ) ( not ( = ?auto_566141 ?auto_566144 ) ) ( not ( = ?auto_566142 ?auto_566143 ) ) ( not ( = ?auto_566142 ?auto_566144 ) ) ( not ( = ?auto_566143 ?auto_566144 ) ) ( ON ?auto_566142 ?auto_566143 ) ( ON ?auto_566141 ?auto_566142 ) ( ON ?auto_566140 ?auto_566141 ) ( ON ?auto_566139 ?auto_566140 ) ( ON ?auto_566138 ?auto_566139 ) ( CLEAR ?auto_566136 ) ( ON ?auto_566137 ?auto_566138 ) ( CLEAR ?auto_566137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_566136 ?auto_566137 )
      ( MAKE-8PILE ?auto_566136 ?auto_566137 ?auto_566138 ?auto_566139 ?auto_566140 ?auto_566141 ?auto_566142 ?auto_566143 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_566170 - BLOCK
      ?auto_566171 - BLOCK
      ?auto_566172 - BLOCK
      ?auto_566173 - BLOCK
      ?auto_566174 - BLOCK
      ?auto_566175 - BLOCK
      ?auto_566176 - BLOCK
      ?auto_566177 - BLOCK
    )
    :vars
    (
      ?auto_566178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_566177 ?auto_566178 ) ( not ( = ?auto_566170 ?auto_566171 ) ) ( not ( = ?auto_566170 ?auto_566172 ) ) ( not ( = ?auto_566170 ?auto_566173 ) ) ( not ( = ?auto_566170 ?auto_566174 ) ) ( not ( = ?auto_566170 ?auto_566175 ) ) ( not ( = ?auto_566170 ?auto_566176 ) ) ( not ( = ?auto_566170 ?auto_566177 ) ) ( not ( = ?auto_566170 ?auto_566178 ) ) ( not ( = ?auto_566171 ?auto_566172 ) ) ( not ( = ?auto_566171 ?auto_566173 ) ) ( not ( = ?auto_566171 ?auto_566174 ) ) ( not ( = ?auto_566171 ?auto_566175 ) ) ( not ( = ?auto_566171 ?auto_566176 ) ) ( not ( = ?auto_566171 ?auto_566177 ) ) ( not ( = ?auto_566171 ?auto_566178 ) ) ( not ( = ?auto_566172 ?auto_566173 ) ) ( not ( = ?auto_566172 ?auto_566174 ) ) ( not ( = ?auto_566172 ?auto_566175 ) ) ( not ( = ?auto_566172 ?auto_566176 ) ) ( not ( = ?auto_566172 ?auto_566177 ) ) ( not ( = ?auto_566172 ?auto_566178 ) ) ( not ( = ?auto_566173 ?auto_566174 ) ) ( not ( = ?auto_566173 ?auto_566175 ) ) ( not ( = ?auto_566173 ?auto_566176 ) ) ( not ( = ?auto_566173 ?auto_566177 ) ) ( not ( = ?auto_566173 ?auto_566178 ) ) ( not ( = ?auto_566174 ?auto_566175 ) ) ( not ( = ?auto_566174 ?auto_566176 ) ) ( not ( = ?auto_566174 ?auto_566177 ) ) ( not ( = ?auto_566174 ?auto_566178 ) ) ( not ( = ?auto_566175 ?auto_566176 ) ) ( not ( = ?auto_566175 ?auto_566177 ) ) ( not ( = ?auto_566175 ?auto_566178 ) ) ( not ( = ?auto_566176 ?auto_566177 ) ) ( not ( = ?auto_566176 ?auto_566178 ) ) ( not ( = ?auto_566177 ?auto_566178 ) ) ( ON ?auto_566176 ?auto_566177 ) ( ON ?auto_566175 ?auto_566176 ) ( ON ?auto_566174 ?auto_566175 ) ( ON ?auto_566173 ?auto_566174 ) ( ON ?auto_566172 ?auto_566173 ) ( ON ?auto_566171 ?auto_566172 ) ( ON ?auto_566170 ?auto_566171 ) ( CLEAR ?auto_566170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_566170 )
      ( MAKE-8PILE ?auto_566170 ?auto_566171 ?auto_566172 ?auto_566173 ?auto_566174 ?auto_566175 ?auto_566176 ?auto_566177 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_566205 - BLOCK
      ?auto_566206 - BLOCK
      ?auto_566207 - BLOCK
      ?auto_566208 - BLOCK
      ?auto_566209 - BLOCK
      ?auto_566210 - BLOCK
      ?auto_566211 - BLOCK
      ?auto_566212 - BLOCK
      ?auto_566213 - BLOCK
    )
    :vars
    (
      ?auto_566214 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_566212 ) ( ON ?auto_566213 ?auto_566214 ) ( CLEAR ?auto_566213 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_566205 ) ( ON ?auto_566206 ?auto_566205 ) ( ON ?auto_566207 ?auto_566206 ) ( ON ?auto_566208 ?auto_566207 ) ( ON ?auto_566209 ?auto_566208 ) ( ON ?auto_566210 ?auto_566209 ) ( ON ?auto_566211 ?auto_566210 ) ( ON ?auto_566212 ?auto_566211 ) ( not ( = ?auto_566205 ?auto_566206 ) ) ( not ( = ?auto_566205 ?auto_566207 ) ) ( not ( = ?auto_566205 ?auto_566208 ) ) ( not ( = ?auto_566205 ?auto_566209 ) ) ( not ( = ?auto_566205 ?auto_566210 ) ) ( not ( = ?auto_566205 ?auto_566211 ) ) ( not ( = ?auto_566205 ?auto_566212 ) ) ( not ( = ?auto_566205 ?auto_566213 ) ) ( not ( = ?auto_566205 ?auto_566214 ) ) ( not ( = ?auto_566206 ?auto_566207 ) ) ( not ( = ?auto_566206 ?auto_566208 ) ) ( not ( = ?auto_566206 ?auto_566209 ) ) ( not ( = ?auto_566206 ?auto_566210 ) ) ( not ( = ?auto_566206 ?auto_566211 ) ) ( not ( = ?auto_566206 ?auto_566212 ) ) ( not ( = ?auto_566206 ?auto_566213 ) ) ( not ( = ?auto_566206 ?auto_566214 ) ) ( not ( = ?auto_566207 ?auto_566208 ) ) ( not ( = ?auto_566207 ?auto_566209 ) ) ( not ( = ?auto_566207 ?auto_566210 ) ) ( not ( = ?auto_566207 ?auto_566211 ) ) ( not ( = ?auto_566207 ?auto_566212 ) ) ( not ( = ?auto_566207 ?auto_566213 ) ) ( not ( = ?auto_566207 ?auto_566214 ) ) ( not ( = ?auto_566208 ?auto_566209 ) ) ( not ( = ?auto_566208 ?auto_566210 ) ) ( not ( = ?auto_566208 ?auto_566211 ) ) ( not ( = ?auto_566208 ?auto_566212 ) ) ( not ( = ?auto_566208 ?auto_566213 ) ) ( not ( = ?auto_566208 ?auto_566214 ) ) ( not ( = ?auto_566209 ?auto_566210 ) ) ( not ( = ?auto_566209 ?auto_566211 ) ) ( not ( = ?auto_566209 ?auto_566212 ) ) ( not ( = ?auto_566209 ?auto_566213 ) ) ( not ( = ?auto_566209 ?auto_566214 ) ) ( not ( = ?auto_566210 ?auto_566211 ) ) ( not ( = ?auto_566210 ?auto_566212 ) ) ( not ( = ?auto_566210 ?auto_566213 ) ) ( not ( = ?auto_566210 ?auto_566214 ) ) ( not ( = ?auto_566211 ?auto_566212 ) ) ( not ( = ?auto_566211 ?auto_566213 ) ) ( not ( = ?auto_566211 ?auto_566214 ) ) ( not ( = ?auto_566212 ?auto_566213 ) ) ( not ( = ?auto_566212 ?auto_566214 ) ) ( not ( = ?auto_566213 ?auto_566214 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_566213 ?auto_566214 )
      ( !STACK ?auto_566213 ?auto_566212 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_566243 - BLOCK
      ?auto_566244 - BLOCK
      ?auto_566245 - BLOCK
      ?auto_566246 - BLOCK
      ?auto_566247 - BLOCK
      ?auto_566248 - BLOCK
      ?auto_566249 - BLOCK
      ?auto_566250 - BLOCK
      ?auto_566251 - BLOCK
    )
    :vars
    (
      ?auto_566252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_566251 ?auto_566252 ) ( ON-TABLE ?auto_566243 ) ( ON ?auto_566244 ?auto_566243 ) ( ON ?auto_566245 ?auto_566244 ) ( ON ?auto_566246 ?auto_566245 ) ( ON ?auto_566247 ?auto_566246 ) ( ON ?auto_566248 ?auto_566247 ) ( ON ?auto_566249 ?auto_566248 ) ( not ( = ?auto_566243 ?auto_566244 ) ) ( not ( = ?auto_566243 ?auto_566245 ) ) ( not ( = ?auto_566243 ?auto_566246 ) ) ( not ( = ?auto_566243 ?auto_566247 ) ) ( not ( = ?auto_566243 ?auto_566248 ) ) ( not ( = ?auto_566243 ?auto_566249 ) ) ( not ( = ?auto_566243 ?auto_566250 ) ) ( not ( = ?auto_566243 ?auto_566251 ) ) ( not ( = ?auto_566243 ?auto_566252 ) ) ( not ( = ?auto_566244 ?auto_566245 ) ) ( not ( = ?auto_566244 ?auto_566246 ) ) ( not ( = ?auto_566244 ?auto_566247 ) ) ( not ( = ?auto_566244 ?auto_566248 ) ) ( not ( = ?auto_566244 ?auto_566249 ) ) ( not ( = ?auto_566244 ?auto_566250 ) ) ( not ( = ?auto_566244 ?auto_566251 ) ) ( not ( = ?auto_566244 ?auto_566252 ) ) ( not ( = ?auto_566245 ?auto_566246 ) ) ( not ( = ?auto_566245 ?auto_566247 ) ) ( not ( = ?auto_566245 ?auto_566248 ) ) ( not ( = ?auto_566245 ?auto_566249 ) ) ( not ( = ?auto_566245 ?auto_566250 ) ) ( not ( = ?auto_566245 ?auto_566251 ) ) ( not ( = ?auto_566245 ?auto_566252 ) ) ( not ( = ?auto_566246 ?auto_566247 ) ) ( not ( = ?auto_566246 ?auto_566248 ) ) ( not ( = ?auto_566246 ?auto_566249 ) ) ( not ( = ?auto_566246 ?auto_566250 ) ) ( not ( = ?auto_566246 ?auto_566251 ) ) ( not ( = ?auto_566246 ?auto_566252 ) ) ( not ( = ?auto_566247 ?auto_566248 ) ) ( not ( = ?auto_566247 ?auto_566249 ) ) ( not ( = ?auto_566247 ?auto_566250 ) ) ( not ( = ?auto_566247 ?auto_566251 ) ) ( not ( = ?auto_566247 ?auto_566252 ) ) ( not ( = ?auto_566248 ?auto_566249 ) ) ( not ( = ?auto_566248 ?auto_566250 ) ) ( not ( = ?auto_566248 ?auto_566251 ) ) ( not ( = ?auto_566248 ?auto_566252 ) ) ( not ( = ?auto_566249 ?auto_566250 ) ) ( not ( = ?auto_566249 ?auto_566251 ) ) ( not ( = ?auto_566249 ?auto_566252 ) ) ( not ( = ?auto_566250 ?auto_566251 ) ) ( not ( = ?auto_566250 ?auto_566252 ) ) ( not ( = ?auto_566251 ?auto_566252 ) ) ( CLEAR ?auto_566249 ) ( ON ?auto_566250 ?auto_566251 ) ( CLEAR ?auto_566250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_566243 ?auto_566244 ?auto_566245 ?auto_566246 ?auto_566247 ?auto_566248 ?auto_566249 ?auto_566250 )
      ( MAKE-9PILE ?auto_566243 ?auto_566244 ?auto_566245 ?auto_566246 ?auto_566247 ?auto_566248 ?auto_566249 ?auto_566250 ?auto_566251 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_566281 - BLOCK
      ?auto_566282 - BLOCK
      ?auto_566283 - BLOCK
      ?auto_566284 - BLOCK
      ?auto_566285 - BLOCK
      ?auto_566286 - BLOCK
      ?auto_566287 - BLOCK
      ?auto_566288 - BLOCK
      ?auto_566289 - BLOCK
    )
    :vars
    (
      ?auto_566290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_566289 ?auto_566290 ) ( ON-TABLE ?auto_566281 ) ( ON ?auto_566282 ?auto_566281 ) ( ON ?auto_566283 ?auto_566282 ) ( ON ?auto_566284 ?auto_566283 ) ( ON ?auto_566285 ?auto_566284 ) ( ON ?auto_566286 ?auto_566285 ) ( not ( = ?auto_566281 ?auto_566282 ) ) ( not ( = ?auto_566281 ?auto_566283 ) ) ( not ( = ?auto_566281 ?auto_566284 ) ) ( not ( = ?auto_566281 ?auto_566285 ) ) ( not ( = ?auto_566281 ?auto_566286 ) ) ( not ( = ?auto_566281 ?auto_566287 ) ) ( not ( = ?auto_566281 ?auto_566288 ) ) ( not ( = ?auto_566281 ?auto_566289 ) ) ( not ( = ?auto_566281 ?auto_566290 ) ) ( not ( = ?auto_566282 ?auto_566283 ) ) ( not ( = ?auto_566282 ?auto_566284 ) ) ( not ( = ?auto_566282 ?auto_566285 ) ) ( not ( = ?auto_566282 ?auto_566286 ) ) ( not ( = ?auto_566282 ?auto_566287 ) ) ( not ( = ?auto_566282 ?auto_566288 ) ) ( not ( = ?auto_566282 ?auto_566289 ) ) ( not ( = ?auto_566282 ?auto_566290 ) ) ( not ( = ?auto_566283 ?auto_566284 ) ) ( not ( = ?auto_566283 ?auto_566285 ) ) ( not ( = ?auto_566283 ?auto_566286 ) ) ( not ( = ?auto_566283 ?auto_566287 ) ) ( not ( = ?auto_566283 ?auto_566288 ) ) ( not ( = ?auto_566283 ?auto_566289 ) ) ( not ( = ?auto_566283 ?auto_566290 ) ) ( not ( = ?auto_566284 ?auto_566285 ) ) ( not ( = ?auto_566284 ?auto_566286 ) ) ( not ( = ?auto_566284 ?auto_566287 ) ) ( not ( = ?auto_566284 ?auto_566288 ) ) ( not ( = ?auto_566284 ?auto_566289 ) ) ( not ( = ?auto_566284 ?auto_566290 ) ) ( not ( = ?auto_566285 ?auto_566286 ) ) ( not ( = ?auto_566285 ?auto_566287 ) ) ( not ( = ?auto_566285 ?auto_566288 ) ) ( not ( = ?auto_566285 ?auto_566289 ) ) ( not ( = ?auto_566285 ?auto_566290 ) ) ( not ( = ?auto_566286 ?auto_566287 ) ) ( not ( = ?auto_566286 ?auto_566288 ) ) ( not ( = ?auto_566286 ?auto_566289 ) ) ( not ( = ?auto_566286 ?auto_566290 ) ) ( not ( = ?auto_566287 ?auto_566288 ) ) ( not ( = ?auto_566287 ?auto_566289 ) ) ( not ( = ?auto_566287 ?auto_566290 ) ) ( not ( = ?auto_566288 ?auto_566289 ) ) ( not ( = ?auto_566288 ?auto_566290 ) ) ( not ( = ?auto_566289 ?auto_566290 ) ) ( ON ?auto_566288 ?auto_566289 ) ( CLEAR ?auto_566286 ) ( ON ?auto_566287 ?auto_566288 ) ( CLEAR ?auto_566287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_566281 ?auto_566282 ?auto_566283 ?auto_566284 ?auto_566285 ?auto_566286 ?auto_566287 )
      ( MAKE-9PILE ?auto_566281 ?auto_566282 ?auto_566283 ?auto_566284 ?auto_566285 ?auto_566286 ?auto_566287 ?auto_566288 ?auto_566289 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_566319 - BLOCK
      ?auto_566320 - BLOCK
      ?auto_566321 - BLOCK
      ?auto_566322 - BLOCK
      ?auto_566323 - BLOCK
      ?auto_566324 - BLOCK
      ?auto_566325 - BLOCK
      ?auto_566326 - BLOCK
      ?auto_566327 - BLOCK
    )
    :vars
    (
      ?auto_566328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_566327 ?auto_566328 ) ( ON-TABLE ?auto_566319 ) ( ON ?auto_566320 ?auto_566319 ) ( ON ?auto_566321 ?auto_566320 ) ( ON ?auto_566322 ?auto_566321 ) ( ON ?auto_566323 ?auto_566322 ) ( not ( = ?auto_566319 ?auto_566320 ) ) ( not ( = ?auto_566319 ?auto_566321 ) ) ( not ( = ?auto_566319 ?auto_566322 ) ) ( not ( = ?auto_566319 ?auto_566323 ) ) ( not ( = ?auto_566319 ?auto_566324 ) ) ( not ( = ?auto_566319 ?auto_566325 ) ) ( not ( = ?auto_566319 ?auto_566326 ) ) ( not ( = ?auto_566319 ?auto_566327 ) ) ( not ( = ?auto_566319 ?auto_566328 ) ) ( not ( = ?auto_566320 ?auto_566321 ) ) ( not ( = ?auto_566320 ?auto_566322 ) ) ( not ( = ?auto_566320 ?auto_566323 ) ) ( not ( = ?auto_566320 ?auto_566324 ) ) ( not ( = ?auto_566320 ?auto_566325 ) ) ( not ( = ?auto_566320 ?auto_566326 ) ) ( not ( = ?auto_566320 ?auto_566327 ) ) ( not ( = ?auto_566320 ?auto_566328 ) ) ( not ( = ?auto_566321 ?auto_566322 ) ) ( not ( = ?auto_566321 ?auto_566323 ) ) ( not ( = ?auto_566321 ?auto_566324 ) ) ( not ( = ?auto_566321 ?auto_566325 ) ) ( not ( = ?auto_566321 ?auto_566326 ) ) ( not ( = ?auto_566321 ?auto_566327 ) ) ( not ( = ?auto_566321 ?auto_566328 ) ) ( not ( = ?auto_566322 ?auto_566323 ) ) ( not ( = ?auto_566322 ?auto_566324 ) ) ( not ( = ?auto_566322 ?auto_566325 ) ) ( not ( = ?auto_566322 ?auto_566326 ) ) ( not ( = ?auto_566322 ?auto_566327 ) ) ( not ( = ?auto_566322 ?auto_566328 ) ) ( not ( = ?auto_566323 ?auto_566324 ) ) ( not ( = ?auto_566323 ?auto_566325 ) ) ( not ( = ?auto_566323 ?auto_566326 ) ) ( not ( = ?auto_566323 ?auto_566327 ) ) ( not ( = ?auto_566323 ?auto_566328 ) ) ( not ( = ?auto_566324 ?auto_566325 ) ) ( not ( = ?auto_566324 ?auto_566326 ) ) ( not ( = ?auto_566324 ?auto_566327 ) ) ( not ( = ?auto_566324 ?auto_566328 ) ) ( not ( = ?auto_566325 ?auto_566326 ) ) ( not ( = ?auto_566325 ?auto_566327 ) ) ( not ( = ?auto_566325 ?auto_566328 ) ) ( not ( = ?auto_566326 ?auto_566327 ) ) ( not ( = ?auto_566326 ?auto_566328 ) ) ( not ( = ?auto_566327 ?auto_566328 ) ) ( ON ?auto_566326 ?auto_566327 ) ( ON ?auto_566325 ?auto_566326 ) ( CLEAR ?auto_566323 ) ( ON ?auto_566324 ?auto_566325 ) ( CLEAR ?auto_566324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_566319 ?auto_566320 ?auto_566321 ?auto_566322 ?auto_566323 ?auto_566324 )
      ( MAKE-9PILE ?auto_566319 ?auto_566320 ?auto_566321 ?auto_566322 ?auto_566323 ?auto_566324 ?auto_566325 ?auto_566326 ?auto_566327 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_566357 - BLOCK
      ?auto_566358 - BLOCK
      ?auto_566359 - BLOCK
      ?auto_566360 - BLOCK
      ?auto_566361 - BLOCK
      ?auto_566362 - BLOCK
      ?auto_566363 - BLOCK
      ?auto_566364 - BLOCK
      ?auto_566365 - BLOCK
    )
    :vars
    (
      ?auto_566366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_566365 ?auto_566366 ) ( ON-TABLE ?auto_566357 ) ( ON ?auto_566358 ?auto_566357 ) ( ON ?auto_566359 ?auto_566358 ) ( ON ?auto_566360 ?auto_566359 ) ( not ( = ?auto_566357 ?auto_566358 ) ) ( not ( = ?auto_566357 ?auto_566359 ) ) ( not ( = ?auto_566357 ?auto_566360 ) ) ( not ( = ?auto_566357 ?auto_566361 ) ) ( not ( = ?auto_566357 ?auto_566362 ) ) ( not ( = ?auto_566357 ?auto_566363 ) ) ( not ( = ?auto_566357 ?auto_566364 ) ) ( not ( = ?auto_566357 ?auto_566365 ) ) ( not ( = ?auto_566357 ?auto_566366 ) ) ( not ( = ?auto_566358 ?auto_566359 ) ) ( not ( = ?auto_566358 ?auto_566360 ) ) ( not ( = ?auto_566358 ?auto_566361 ) ) ( not ( = ?auto_566358 ?auto_566362 ) ) ( not ( = ?auto_566358 ?auto_566363 ) ) ( not ( = ?auto_566358 ?auto_566364 ) ) ( not ( = ?auto_566358 ?auto_566365 ) ) ( not ( = ?auto_566358 ?auto_566366 ) ) ( not ( = ?auto_566359 ?auto_566360 ) ) ( not ( = ?auto_566359 ?auto_566361 ) ) ( not ( = ?auto_566359 ?auto_566362 ) ) ( not ( = ?auto_566359 ?auto_566363 ) ) ( not ( = ?auto_566359 ?auto_566364 ) ) ( not ( = ?auto_566359 ?auto_566365 ) ) ( not ( = ?auto_566359 ?auto_566366 ) ) ( not ( = ?auto_566360 ?auto_566361 ) ) ( not ( = ?auto_566360 ?auto_566362 ) ) ( not ( = ?auto_566360 ?auto_566363 ) ) ( not ( = ?auto_566360 ?auto_566364 ) ) ( not ( = ?auto_566360 ?auto_566365 ) ) ( not ( = ?auto_566360 ?auto_566366 ) ) ( not ( = ?auto_566361 ?auto_566362 ) ) ( not ( = ?auto_566361 ?auto_566363 ) ) ( not ( = ?auto_566361 ?auto_566364 ) ) ( not ( = ?auto_566361 ?auto_566365 ) ) ( not ( = ?auto_566361 ?auto_566366 ) ) ( not ( = ?auto_566362 ?auto_566363 ) ) ( not ( = ?auto_566362 ?auto_566364 ) ) ( not ( = ?auto_566362 ?auto_566365 ) ) ( not ( = ?auto_566362 ?auto_566366 ) ) ( not ( = ?auto_566363 ?auto_566364 ) ) ( not ( = ?auto_566363 ?auto_566365 ) ) ( not ( = ?auto_566363 ?auto_566366 ) ) ( not ( = ?auto_566364 ?auto_566365 ) ) ( not ( = ?auto_566364 ?auto_566366 ) ) ( not ( = ?auto_566365 ?auto_566366 ) ) ( ON ?auto_566364 ?auto_566365 ) ( ON ?auto_566363 ?auto_566364 ) ( ON ?auto_566362 ?auto_566363 ) ( CLEAR ?auto_566360 ) ( ON ?auto_566361 ?auto_566362 ) ( CLEAR ?auto_566361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_566357 ?auto_566358 ?auto_566359 ?auto_566360 ?auto_566361 )
      ( MAKE-9PILE ?auto_566357 ?auto_566358 ?auto_566359 ?auto_566360 ?auto_566361 ?auto_566362 ?auto_566363 ?auto_566364 ?auto_566365 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_566395 - BLOCK
      ?auto_566396 - BLOCK
      ?auto_566397 - BLOCK
      ?auto_566398 - BLOCK
      ?auto_566399 - BLOCK
      ?auto_566400 - BLOCK
      ?auto_566401 - BLOCK
      ?auto_566402 - BLOCK
      ?auto_566403 - BLOCK
    )
    :vars
    (
      ?auto_566404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_566403 ?auto_566404 ) ( ON-TABLE ?auto_566395 ) ( ON ?auto_566396 ?auto_566395 ) ( ON ?auto_566397 ?auto_566396 ) ( not ( = ?auto_566395 ?auto_566396 ) ) ( not ( = ?auto_566395 ?auto_566397 ) ) ( not ( = ?auto_566395 ?auto_566398 ) ) ( not ( = ?auto_566395 ?auto_566399 ) ) ( not ( = ?auto_566395 ?auto_566400 ) ) ( not ( = ?auto_566395 ?auto_566401 ) ) ( not ( = ?auto_566395 ?auto_566402 ) ) ( not ( = ?auto_566395 ?auto_566403 ) ) ( not ( = ?auto_566395 ?auto_566404 ) ) ( not ( = ?auto_566396 ?auto_566397 ) ) ( not ( = ?auto_566396 ?auto_566398 ) ) ( not ( = ?auto_566396 ?auto_566399 ) ) ( not ( = ?auto_566396 ?auto_566400 ) ) ( not ( = ?auto_566396 ?auto_566401 ) ) ( not ( = ?auto_566396 ?auto_566402 ) ) ( not ( = ?auto_566396 ?auto_566403 ) ) ( not ( = ?auto_566396 ?auto_566404 ) ) ( not ( = ?auto_566397 ?auto_566398 ) ) ( not ( = ?auto_566397 ?auto_566399 ) ) ( not ( = ?auto_566397 ?auto_566400 ) ) ( not ( = ?auto_566397 ?auto_566401 ) ) ( not ( = ?auto_566397 ?auto_566402 ) ) ( not ( = ?auto_566397 ?auto_566403 ) ) ( not ( = ?auto_566397 ?auto_566404 ) ) ( not ( = ?auto_566398 ?auto_566399 ) ) ( not ( = ?auto_566398 ?auto_566400 ) ) ( not ( = ?auto_566398 ?auto_566401 ) ) ( not ( = ?auto_566398 ?auto_566402 ) ) ( not ( = ?auto_566398 ?auto_566403 ) ) ( not ( = ?auto_566398 ?auto_566404 ) ) ( not ( = ?auto_566399 ?auto_566400 ) ) ( not ( = ?auto_566399 ?auto_566401 ) ) ( not ( = ?auto_566399 ?auto_566402 ) ) ( not ( = ?auto_566399 ?auto_566403 ) ) ( not ( = ?auto_566399 ?auto_566404 ) ) ( not ( = ?auto_566400 ?auto_566401 ) ) ( not ( = ?auto_566400 ?auto_566402 ) ) ( not ( = ?auto_566400 ?auto_566403 ) ) ( not ( = ?auto_566400 ?auto_566404 ) ) ( not ( = ?auto_566401 ?auto_566402 ) ) ( not ( = ?auto_566401 ?auto_566403 ) ) ( not ( = ?auto_566401 ?auto_566404 ) ) ( not ( = ?auto_566402 ?auto_566403 ) ) ( not ( = ?auto_566402 ?auto_566404 ) ) ( not ( = ?auto_566403 ?auto_566404 ) ) ( ON ?auto_566402 ?auto_566403 ) ( ON ?auto_566401 ?auto_566402 ) ( ON ?auto_566400 ?auto_566401 ) ( ON ?auto_566399 ?auto_566400 ) ( CLEAR ?auto_566397 ) ( ON ?auto_566398 ?auto_566399 ) ( CLEAR ?auto_566398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_566395 ?auto_566396 ?auto_566397 ?auto_566398 )
      ( MAKE-9PILE ?auto_566395 ?auto_566396 ?auto_566397 ?auto_566398 ?auto_566399 ?auto_566400 ?auto_566401 ?auto_566402 ?auto_566403 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_566433 - BLOCK
      ?auto_566434 - BLOCK
      ?auto_566435 - BLOCK
      ?auto_566436 - BLOCK
      ?auto_566437 - BLOCK
      ?auto_566438 - BLOCK
      ?auto_566439 - BLOCK
      ?auto_566440 - BLOCK
      ?auto_566441 - BLOCK
    )
    :vars
    (
      ?auto_566442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_566441 ?auto_566442 ) ( ON-TABLE ?auto_566433 ) ( ON ?auto_566434 ?auto_566433 ) ( not ( = ?auto_566433 ?auto_566434 ) ) ( not ( = ?auto_566433 ?auto_566435 ) ) ( not ( = ?auto_566433 ?auto_566436 ) ) ( not ( = ?auto_566433 ?auto_566437 ) ) ( not ( = ?auto_566433 ?auto_566438 ) ) ( not ( = ?auto_566433 ?auto_566439 ) ) ( not ( = ?auto_566433 ?auto_566440 ) ) ( not ( = ?auto_566433 ?auto_566441 ) ) ( not ( = ?auto_566433 ?auto_566442 ) ) ( not ( = ?auto_566434 ?auto_566435 ) ) ( not ( = ?auto_566434 ?auto_566436 ) ) ( not ( = ?auto_566434 ?auto_566437 ) ) ( not ( = ?auto_566434 ?auto_566438 ) ) ( not ( = ?auto_566434 ?auto_566439 ) ) ( not ( = ?auto_566434 ?auto_566440 ) ) ( not ( = ?auto_566434 ?auto_566441 ) ) ( not ( = ?auto_566434 ?auto_566442 ) ) ( not ( = ?auto_566435 ?auto_566436 ) ) ( not ( = ?auto_566435 ?auto_566437 ) ) ( not ( = ?auto_566435 ?auto_566438 ) ) ( not ( = ?auto_566435 ?auto_566439 ) ) ( not ( = ?auto_566435 ?auto_566440 ) ) ( not ( = ?auto_566435 ?auto_566441 ) ) ( not ( = ?auto_566435 ?auto_566442 ) ) ( not ( = ?auto_566436 ?auto_566437 ) ) ( not ( = ?auto_566436 ?auto_566438 ) ) ( not ( = ?auto_566436 ?auto_566439 ) ) ( not ( = ?auto_566436 ?auto_566440 ) ) ( not ( = ?auto_566436 ?auto_566441 ) ) ( not ( = ?auto_566436 ?auto_566442 ) ) ( not ( = ?auto_566437 ?auto_566438 ) ) ( not ( = ?auto_566437 ?auto_566439 ) ) ( not ( = ?auto_566437 ?auto_566440 ) ) ( not ( = ?auto_566437 ?auto_566441 ) ) ( not ( = ?auto_566437 ?auto_566442 ) ) ( not ( = ?auto_566438 ?auto_566439 ) ) ( not ( = ?auto_566438 ?auto_566440 ) ) ( not ( = ?auto_566438 ?auto_566441 ) ) ( not ( = ?auto_566438 ?auto_566442 ) ) ( not ( = ?auto_566439 ?auto_566440 ) ) ( not ( = ?auto_566439 ?auto_566441 ) ) ( not ( = ?auto_566439 ?auto_566442 ) ) ( not ( = ?auto_566440 ?auto_566441 ) ) ( not ( = ?auto_566440 ?auto_566442 ) ) ( not ( = ?auto_566441 ?auto_566442 ) ) ( ON ?auto_566440 ?auto_566441 ) ( ON ?auto_566439 ?auto_566440 ) ( ON ?auto_566438 ?auto_566439 ) ( ON ?auto_566437 ?auto_566438 ) ( ON ?auto_566436 ?auto_566437 ) ( CLEAR ?auto_566434 ) ( ON ?auto_566435 ?auto_566436 ) ( CLEAR ?auto_566435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_566433 ?auto_566434 ?auto_566435 )
      ( MAKE-9PILE ?auto_566433 ?auto_566434 ?auto_566435 ?auto_566436 ?auto_566437 ?auto_566438 ?auto_566439 ?auto_566440 ?auto_566441 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_566471 - BLOCK
      ?auto_566472 - BLOCK
      ?auto_566473 - BLOCK
      ?auto_566474 - BLOCK
      ?auto_566475 - BLOCK
      ?auto_566476 - BLOCK
      ?auto_566477 - BLOCK
      ?auto_566478 - BLOCK
      ?auto_566479 - BLOCK
    )
    :vars
    (
      ?auto_566480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_566479 ?auto_566480 ) ( ON-TABLE ?auto_566471 ) ( not ( = ?auto_566471 ?auto_566472 ) ) ( not ( = ?auto_566471 ?auto_566473 ) ) ( not ( = ?auto_566471 ?auto_566474 ) ) ( not ( = ?auto_566471 ?auto_566475 ) ) ( not ( = ?auto_566471 ?auto_566476 ) ) ( not ( = ?auto_566471 ?auto_566477 ) ) ( not ( = ?auto_566471 ?auto_566478 ) ) ( not ( = ?auto_566471 ?auto_566479 ) ) ( not ( = ?auto_566471 ?auto_566480 ) ) ( not ( = ?auto_566472 ?auto_566473 ) ) ( not ( = ?auto_566472 ?auto_566474 ) ) ( not ( = ?auto_566472 ?auto_566475 ) ) ( not ( = ?auto_566472 ?auto_566476 ) ) ( not ( = ?auto_566472 ?auto_566477 ) ) ( not ( = ?auto_566472 ?auto_566478 ) ) ( not ( = ?auto_566472 ?auto_566479 ) ) ( not ( = ?auto_566472 ?auto_566480 ) ) ( not ( = ?auto_566473 ?auto_566474 ) ) ( not ( = ?auto_566473 ?auto_566475 ) ) ( not ( = ?auto_566473 ?auto_566476 ) ) ( not ( = ?auto_566473 ?auto_566477 ) ) ( not ( = ?auto_566473 ?auto_566478 ) ) ( not ( = ?auto_566473 ?auto_566479 ) ) ( not ( = ?auto_566473 ?auto_566480 ) ) ( not ( = ?auto_566474 ?auto_566475 ) ) ( not ( = ?auto_566474 ?auto_566476 ) ) ( not ( = ?auto_566474 ?auto_566477 ) ) ( not ( = ?auto_566474 ?auto_566478 ) ) ( not ( = ?auto_566474 ?auto_566479 ) ) ( not ( = ?auto_566474 ?auto_566480 ) ) ( not ( = ?auto_566475 ?auto_566476 ) ) ( not ( = ?auto_566475 ?auto_566477 ) ) ( not ( = ?auto_566475 ?auto_566478 ) ) ( not ( = ?auto_566475 ?auto_566479 ) ) ( not ( = ?auto_566475 ?auto_566480 ) ) ( not ( = ?auto_566476 ?auto_566477 ) ) ( not ( = ?auto_566476 ?auto_566478 ) ) ( not ( = ?auto_566476 ?auto_566479 ) ) ( not ( = ?auto_566476 ?auto_566480 ) ) ( not ( = ?auto_566477 ?auto_566478 ) ) ( not ( = ?auto_566477 ?auto_566479 ) ) ( not ( = ?auto_566477 ?auto_566480 ) ) ( not ( = ?auto_566478 ?auto_566479 ) ) ( not ( = ?auto_566478 ?auto_566480 ) ) ( not ( = ?auto_566479 ?auto_566480 ) ) ( ON ?auto_566478 ?auto_566479 ) ( ON ?auto_566477 ?auto_566478 ) ( ON ?auto_566476 ?auto_566477 ) ( ON ?auto_566475 ?auto_566476 ) ( ON ?auto_566474 ?auto_566475 ) ( ON ?auto_566473 ?auto_566474 ) ( CLEAR ?auto_566471 ) ( ON ?auto_566472 ?auto_566473 ) ( CLEAR ?auto_566472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_566471 ?auto_566472 )
      ( MAKE-9PILE ?auto_566471 ?auto_566472 ?auto_566473 ?auto_566474 ?auto_566475 ?auto_566476 ?auto_566477 ?auto_566478 ?auto_566479 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_566509 - BLOCK
      ?auto_566510 - BLOCK
      ?auto_566511 - BLOCK
      ?auto_566512 - BLOCK
      ?auto_566513 - BLOCK
      ?auto_566514 - BLOCK
      ?auto_566515 - BLOCK
      ?auto_566516 - BLOCK
      ?auto_566517 - BLOCK
    )
    :vars
    (
      ?auto_566518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_566517 ?auto_566518 ) ( not ( = ?auto_566509 ?auto_566510 ) ) ( not ( = ?auto_566509 ?auto_566511 ) ) ( not ( = ?auto_566509 ?auto_566512 ) ) ( not ( = ?auto_566509 ?auto_566513 ) ) ( not ( = ?auto_566509 ?auto_566514 ) ) ( not ( = ?auto_566509 ?auto_566515 ) ) ( not ( = ?auto_566509 ?auto_566516 ) ) ( not ( = ?auto_566509 ?auto_566517 ) ) ( not ( = ?auto_566509 ?auto_566518 ) ) ( not ( = ?auto_566510 ?auto_566511 ) ) ( not ( = ?auto_566510 ?auto_566512 ) ) ( not ( = ?auto_566510 ?auto_566513 ) ) ( not ( = ?auto_566510 ?auto_566514 ) ) ( not ( = ?auto_566510 ?auto_566515 ) ) ( not ( = ?auto_566510 ?auto_566516 ) ) ( not ( = ?auto_566510 ?auto_566517 ) ) ( not ( = ?auto_566510 ?auto_566518 ) ) ( not ( = ?auto_566511 ?auto_566512 ) ) ( not ( = ?auto_566511 ?auto_566513 ) ) ( not ( = ?auto_566511 ?auto_566514 ) ) ( not ( = ?auto_566511 ?auto_566515 ) ) ( not ( = ?auto_566511 ?auto_566516 ) ) ( not ( = ?auto_566511 ?auto_566517 ) ) ( not ( = ?auto_566511 ?auto_566518 ) ) ( not ( = ?auto_566512 ?auto_566513 ) ) ( not ( = ?auto_566512 ?auto_566514 ) ) ( not ( = ?auto_566512 ?auto_566515 ) ) ( not ( = ?auto_566512 ?auto_566516 ) ) ( not ( = ?auto_566512 ?auto_566517 ) ) ( not ( = ?auto_566512 ?auto_566518 ) ) ( not ( = ?auto_566513 ?auto_566514 ) ) ( not ( = ?auto_566513 ?auto_566515 ) ) ( not ( = ?auto_566513 ?auto_566516 ) ) ( not ( = ?auto_566513 ?auto_566517 ) ) ( not ( = ?auto_566513 ?auto_566518 ) ) ( not ( = ?auto_566514 ?auto_566515 ) ) ( not ( = ?auto_566514 ?auto_566516 ) ) ( not ( = ?auto_566514 ?auto_566517 ) ) ( not ( = ?auto_566514 ?auto_566518 ) ) ( not ( = ?auto_566515 ?auto_566516 ) ) ( not ( = ?auto_566515 ?auto_566517 ) ) ( not ( = ?auto_566515 ?auto_566518 ) ) ( not ( = ?auto_566516 ?auto_566517 ) ) ( not ( = ?auto_566516 ?auto_566518 ) ) ( not ( = ?auto_566517 ?auto_566518 ) ) ( ON ?auto_566516 ?auto_566517 ) ( ON ?auto_566515 ?auto_566516 ) ( ON ?auto_566514 ?auto_566515 ) ( ON ?auto_566513 ?auto_566514 ) ( ON ?auto_566512 ?auto_566513 ) ( ON ?auto_566511 ?auto_566512 ) ( ON ?auto_566510 ?auto_566511 ) ( ON ?auto_566509 ?auto_566510 ) ( CLEAR ?auto_566509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_566509 )
      ( MAKE-9PILE ?auto_566509 ?auto_566510 ?auto_566511 ?auto_566512 ?auto_566513 ?auto_566514 ?auto_566515 ?auto_566516 ?auto_566517 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_566548 - BLOCK
      ?auto_566549 - BLOCK
      ?auto_566550 - BLOCK
      ?auto_566551 - BLOCK
      ?auto_566552 - BLOCK
      ?auto_566553 - BLOCK
      ?auto_566554 - BLOCK
      ?auto_566555 - BLOCK
      ?auto_566556 - BLOCK
      ?auto_566557 - BLOCK
    )
    :vars
    (
      ?auto_566558 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_566556 ) ( ON ?auto_566557 ?auto_566558 ) ( CLEAR ?auto_566557 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_566548 ) ( ON ?auto_566549 ?auto_566548 ) ( ON ?auto_566550 ?auto_566549 ) ( ON ?auto_566551 ?auto_566550 ) ( ON ?auto_566552 ?auto_566551 ) ( ON ?auto_566553 ?auto_566552 ) ( ON ?auto_566554 ?auto_566553 ) ( ON ?auto_566555 ?auto_566554 ) ( ON ?auto_566556 ?auto_566555 ) ( not ( = ?auto_566548 ?auto_566549 ) ) ( not ( = ?auto_566548 ?auto_566550 ) ) ( not ( = ?auto_566548 ?auto_566551 ) ) ( not ( = ?auto_566548 ?auto_566552 ) ) ( not ( = ?auto_566548 ?auto_566553 ) ) ( not ( = ?auto_566548 ?auto_566554 ) ) ( not ( = ?auto_566548 ?auto_566555 ) ) ( not ( = ?auto_566548 ?auto_566556 ) ) ( not ( = ?auto_566548 ?auto_566557 ) ) ( not ( = ?auto_566548 ?auto_566558 ) ) ( not ( = ?auto_566549 ?auto_566550 ) ) ( not ( = ?auto_566549 ?auto_566551 ) ) ( not ( = ?auto_566549 ?auto_566552 ) ) ( not ( = ?auto_566549 ?auto_566553 ) ) ( not ( = ?auto_566549 ?auto_566554 ) ) ( not ( = ?auto_566549 ?auto_566555 ) ) ( not ( = ?auto_566549 ?auto_566556 ) ) ( not ( = ?auto_566549 ?auto_566557 ) ) ( not ( = ?auto_566549 ?auto_566558 ) ) ( not ( = ?auto_566550 ?auto_566551 ) ) ( not ( = ?auto_566550 ?auto_566552 ) ) ( not ( = ?auto_566550 ?auto_566553 ) ) ( not ( = ?auto_566550 ?auto_566554 ) ) ( not ( = ?auto_566550 ?auto_566555 ) ) ( not ( = ?auto_566550 ?auto_566556 ) ) ( not ( = ?auto_566550 ?auto_566557 ) ) ( not ( = ?auto_566550 ?auto_566558 ) ) ( not ( = ?auto_566551 ?auto_566552 ) ) ( not ( = ?auto_566551 ?auto_566553 ) ) ( not ( = ?auto_566551 ?auto_566554 ) ) ( not ( = ?auto_566551 ?auto_566555 ) ) ( not ( = ?auto_566551 ?auto_566556 ) ) ( not ( = ?auto_566551 ?auto_566557 ) ) ( not ( = ?auto_566551 ?auto_566558 ) ) ( not ( = ?auto_566552 ?auto_566553 ) ) ( not ( = ?auto_566552 ?auto_566554 ) ) ( not ( = ?auto_566552 ?auto_566555 ) ) ( not ( = ?auto_566552 ?auto_566556 ) ) ( not ( = ?auto_566552 ?auto_566557 ) ) ( not ( = ?auto_566552 ?auto_566558 ) ) ( not ( = ?auto_566553 ?auto_566554 ) ) ( not ( = ?auto_566553 ?auto_566555 ) ) ( not ( = ?auto_566553 ?auto_566556 ) ) ( not ( = ?auto_566553 ?auto_566557 ) ) ( not ( = ?auto_566553 ?auto_566558 ) ) ( not ( = ?auto_566554 ?auto_566555 ) ) ( not ( = ?auto_566554 ?auto_566556 ) ) ( not ( = ?auto_566554 ?auto_566557 ) ) ( not ( = ?auto_566554 ?auto_566558 ) ) ( not ( = ?auto_566555 ?auto_566556 ) ) ( not ( = ?auto_566555 ?auto_566557 ) ) ( not ( = ?auto_566555 ?auto_566558 ) ) ( not ( = ?auto_566556 ?auto_566557 ) ) ( not ( = ?auto_566556 ?auto_566558 ) ) ( not ( = ?auto_566557 ?auto_566558 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_566557 ?auto_566558 )
      ( !STACK ?auto_566557 ?auto_566556 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_566590 - BLOCK
      ?auto_566591 - BLOCK
      ?auto_566592 - BLOCK
      ?auto_566593 - BLOCK
      ?auto_566594 - BLOCK
      ?auto_566595 - BLOCK
      ?auto_566596 - BLOCK
      ?auto_566597 - BLOCK
      ?auto_566598 - BLOCK
      ?auto_566599 - BLOCK
    )
    :vars
    (
      ?auto_566600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_566599 ?auto_566600 ) ( ON-TABLE ?auto_566590 ) ( ON ?auto_566591 ?auto_566590 ) ( ON ?auto_566592 ?auto_566591 ) ( ON ?auto_566593 ?auto_566592 ) ( ON ?auto_566594 ?auto_566593 ) ( ON ?auto_566595 ?auto_566594 ) ( ON ?auto_566596 ?auto_566595 ) ( ON ?auto_566597 ?auto_566596 ) ( not ( = ?auto_566590 ?auto_566591 ) ) ( not ( = ?auto_566590 ?auto_566592 ) ) ( not ( = ?auto_566590 ?auto_566593 ) ) ( not ( = ?auto_566590 ?auto_566594 ) ) ( not ( = ?auto_566590 ?auto_566595 ) ) ( not ( = ?auto_566590 ?auto_566596 ) ) ( not ( = ?auto_566590 ?auto_566597 ) ) ( not ( = ?auto_566590 ?auto_566598 ) ) ( not ( = ?auto_566590 ?auto_566599 ) ) ( not ( = ?auto_566590 ?auto_566600 ) ) ( not ( = ?auto_566591 ?auto_566592 ) ) ( not ( = ?auto_566591 ?auto_566593 ) ) ( not ( = ?auto_566591 ?auto_566594 ) ) ( not ( = ?auto_566591 ?auto_566595 ) ) ( not ( = ?auto_566591 ?auto_566596 ) ) ( not ( = ?auto_566591 ?auto_566597 ) ) ( not ( = ?auto_566591 ?auto_566598 ) ) ( not ( = ?auto_566591 ?auto_566599 ) ) ( not ( = ?auto_566591 ?auto_566600 ) ) ( not ( = ?auto_566592 ?auto_566593 ) ) ( not ( = ?auto_566592 ?auto_566594 ) ) ( not ( = ?auto_566592 ?auto_566595 ) ) ( not ( = ?auto_566592 ?auto_566596 ) ) ( not ( = ?auto_566592 ?auto_566597 ) ) ( not ( = ?auto_566592 ?auto_566598 ) ) ( not ( = ?auto_566592 ?auto_566599 ) ) ( not ( = ?auto_566592 ?auto_566600 ) ) ( not ( = ?auto_566593 ?auto_566594 ) ) ( not ( = ?auto_566593 ?auto_566595 ) ) ( not ( = ?auto_566593 ?auto_566596 ) ) ( not ( = ?auto_566593 ?auto_566597 ) ) ( not ( = ?auto_566593 ?auto_566598 ) ) ( not ( = ?auto_566593 ?auto_566599 ) ) ( not ( = ?auto_566593 ?auto_566600 ) ) ( not ( = ?auto_566594 ?auto_566595 ) ) ( not ( = ?auto_566594 ?auto_566596 ) ) ( not ( = ?auto_566594 ?auto_566597 ) ) ( not ( = ?auto_566594 ?auto_566598 ) ) ( not ( = ?auto_566594 ?auto_566599 ) ) ( not ( = ?auto_566594 ?auto_566600 ) ) ( not ( = ?auto_566595 ?auto_566596 ) ) ( not ( = ?auto_566595 ?auto_566597 ) ) ( not ( = ?auto_566595 ?auto_566598 ) ) ( not ( = ?auto_566595 ?auto_566599 ) ) ( not ( = ?auto_566595 ?auto_566600 ) ) ( not ( = ?auto_566596 ?auto_566597 ) ) ( not ( = ?auto_566596 ?auto_566598 ) ) ( not ( = ?auto_566596 ?auto_566599 ) ) ( not ( = ?auto_566596 ?auto_566600 ) ) ( not ( = ?auto_566597 ?auto_566598 ) ) ( not ( = ?auto_566597 ?auto_566599 ) ) ( not ( = ?auto_566597 ?auto_566600 ) ) ( not ( = ?auto_566598 ?auto_566599 ) ) ( not ( = ?auto_566598 ?auto_566600 ) ) ( not ( = ?auto_566599 ?auto_566600 ) ) ( CLEAR ?auto_566597 ) ( ON ?auto_566598 ?auto_566599 ) ( CLEAR ?auto_566598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_566590 ?auto_566591 ?auto_566592 ?auto_566593 ?auto_566594 ?auto_566595 ?auto_566596 ?auto_566597 ?auto_566598 )
      ( MAKE-10PILE ?auto_566590 ?auto_566591 ?auto_566592 ?auto_566593 ?auto_566594 ?auto_566595 ?auto_566596 ?auto_566597 ?auto_566598 ?auto_566599 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_566632 - BLOCK
      ?auto_566633 - BLOCK
      ?auto_566634 - BLOCK
      ?auto_566635 - BLOCK
      ?auto_566636 - BLOCK
      ?auto_566637 - BLOCK
      ?auto_566638 - BLOCK
      ?auto_566639 - BLOCK
      ?auto_566640 - BLOCK
      ?auto_566641 - BLOCK
    )
    :vars
    (
      ?auto_566642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_566641 ?auto_566642 ) ( ON-TABLE ?auto_566632 ) ( ON ?auto_566633 ?auto_566632 ) ( ON ?auto_566634 ?auto_566633 ) ( ON ?auto_566635 ?auto_566634 ) ( ON ?auto_566636 ?auto_566635 ) ( ON ?auto_566637 ?auto_566636 ) ( ON ?auto_566638 ?auto_566637 ) ( not ( = ?auto_566632 ?auto_566633 ) ) ( not ( = ?auto_566632 ?auto_566634 ) ) ( not ( = ?auto_566632 ?auto_566635 ) ) ( not ( = ?auto_566632 ?auto_566636 ) ) ( not ( = ?auto_566632 ?auto_566637 ) ) ( not ( = ?auto_566632 ?auto_566638 ) ) ( not ( = ?auto_566632 ?auto_566639 ) ) ( not ( = ?auto_566632 ?auto_566640 ) ) ( not ( = ?auto_566632 ?auto_566641 ) ) ( not ( = ?auto_566632 ?auto_566642 ) ) ( not ( = ?auto_566633 ?auto_566634 ) ) ( not ( = ?auto_566633 ?auto_566635 ) ) ( not ( = ?auto_566633 ?auto_566636 ) ) ( not ( = ?auto_566633 ?auto_566637 ) ) ( not ( = ?auto_566633 ?auto_566638 ) ) ( not ( = ?auto_566633 ?auto_566639 ) ) ( not ( = ?auto_566633 ?auto_566640 ) ) ( not ( = ?auto_566633 ?auto_566641 ) ) ( not ( = ?auto_566633 ?auto_566642 ) ) ( not ( = ?auto_566634 ?auto_566635 ) ) ( not ( = ?auto_566634 ?auto_566636 ) ) ( not ( = ?auto_566634 ?auto_566637 ) ) ( not ( = ?auto_566634 ?auto_566638 ) ) ( not ( = ?auto_566634 ?auto_566639 ) ) ( not ( = ?auto_566634 ?auto_566640 ) ) ( not ( = ?auto_566634 ?auto_566641 ) ) ( not ( = ?auto_566634 ?auto_566642 ) ) ( not ( = ?auto_566635 ?auto_566636 ) ) ( not ( = ?auto_566635 ?auto_566637 ) ) ( not ( = ?auto_566635 ?auto_566638 ) ) ( not ( = ?auto_566635 ?auto_566639 ) ) ( not ( = ?auto_566635 ?auto_566640 ) ) ( not ( = ?auto_566635 ?auto_566641 ) ) ( not ( = ?auto_566635 ?auto_566642 ) ) ( not ( = ?auto_566636 ?auto_566637 ) ) ( not ( = ?auto_566636 ?auto_566638 ) ) ( not ( = ?auto_566636 ?auto_566639 ) ) ( not ( = ?auto_566636 ?auto_566640 ) ) ( not ( = ?auto_566636 ?auto_566641 ) ) ( not ( = ?auto_566636 ?auto_566642 ) ) ( not ( = ?auto_566637 ?auto_566638 ) ) ( not ( = ?auto_566637 ?auto_566639 ) ) ( not ( = ?auto_566637 ?auto_566640 ) ) ( not ( = ?auto_566637 ?auto_566641 ) ) ( not ( = ?auto_566637 ?auto_566642 ) ) ( not ( = ?auto_566638 ?auto_566639 ) ) ( not ( = ?auto_566638 ?auto_566640 ) ) ( not ( = ?auto_566638 ?auto_566641 ) ) ( not ( = ?auto_566638 ?auto_566642 ) ) ( not ( = ?auto_566639 ?auto_566640 ) ) ( not ( = ?auto_566639 ?auto_566641 ) ) ( not ( = ?auto_566639 ?auto_566642 ) ) ( not ( = ?auto_566640 ?auto_566641 ) ) ( not ( = ?auto_566640 ?auto_566642 ) ) ( not ( = ?auto_566641 ?auto_566642 ) ) ( ON ?auto_566640 ?auto_566641 ) ( CLEAR ?auto_566638 ) ( ON ?auto_566639 ?auto_566640 ) ( CLEAR ?auto_566639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_566632 ?auto_566633 ?auto_566634 ?auto_566635 ?auto_566636 ?auto_566637 ?auto_566638 ?auto_566639 )
      ( MAKE-10PILE ?auto_566632 ?auto_566633 ?auto_566634 ?auto_566635 ?auto_566636 ?auto_566637 ?auto_566638 ?auto_566639 ?auto_566640 ?auto_566641 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_566674 - BLOCK
      ?auto_566675 - BLOCK
      ?auto_566676 - BLOCK
      ?auto_566677 - BLOCK
      ?auto_566678 - BLOCK
      ?auto_566679 - BLOCK
      ?auto_566680 - BLOCK
      ?auto_566681 - BLOCK
      ?auto_566682 - BLOCK
      ?auto_566683 - BLOCK
    )
    :vars
    (
      ?auto_566684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_566683 ?auto_566684 ) ( ON-TABLE ?auto_566674 ) ( ON ?auto_566675 ?auto_566674 ) ( ON ?auto_566676 ?auto_566675 ) ( ON ?auto_566677 ?auto_566676 ) ( ON ?auto_566678 ?auto_566677 ) ( ON ?auto_566679 ?auto_566678 ) ( not ( = ?auto_566674 ?auto_566675 ) ) ( not ( = ?auto_566674 ?auto_566676 ) ) ( not ( = ?auto_566674 ?auto_566677 ) ) ( not ( = ?auto_566674 ?auto_566678 ) ) ( not ( = ?auto_566674 ?auto_566679 ) ) ( not ( = ?auto_566674 ?auto_566680 ) ) ( not ( = ?auto_566674 ?auto_566681 ) ) ( not ( = ?auto_566674 ?auto_566682 ) ) ( not ( = ?auto_566674 ?auto_566683 ) ) ( not ( = ?auto_566674 ?auto_566684 ) ) ( not ( = ?auto_566675 ?auto_566676 ) ) ( not ( = ?auto_566675 ?auto_566677 ) ) ( not ( = ?auto_566675 ?auto_566678 ) ) ( not ( = ?auto_566675 ?auto_566679 ) ) ( not ( = ?auto_566675 ?auto_566680 ) ) ( not ( = ?auto_566675 ?auto_566681 ) ) ( not ( = ?auto_566675 ?auto_566682 ) ) ( not ( = ?auto_566675 ?auto_566683 ) ) ( not ( = ?auto_566675 ?auto_566684 ) ) ( not ( = ?auto_566676 ?auto_566677 ) ) ( not ( = ?auto_566676 ?auto_566678 ) ) ( not ( = ?auto_566676 ?auto_566679 ) ) ( not ( = ?auto_566676 ?auto_566680 ) ) ( not ( = ?auto_566676 ?auto_566681 ) ) ( not ( = ?auto_566676 ?auto_566682 ) ) ( not ( = ?auto_566676 ?auto_566683 ) ) ( not ( = ?auto_566676 ?auto_566684 ) ) ( not ( = ?auto_566677 ?auto_566678 ) ) ( not ( = ?auto_566677 ?auto_566679 ) ) ( not ( = ?auto_566677 ?auto_566680 ) ) ( not ( = ?auto_566677 ?auto_566681 ) ) ( not ( = ?auto_566677 ?auto_566682 ) ) ( not ( = ?auto_566677 ?auto_566683 ) ) ( not ( = ?auto_566677 ?auto_566684 ) ) ( not ( = ?auto_566678 ?auto_566679 ) ) ( not ( = ?auto_566678 ?auto_566680 ) ) ( not ( = ?auto_566678 ?auto_566681 ) ) ( not ( = ?auto_566678 ?auto_566682 ) ) ( not ( = ?auto_566678 ?auto_566683 ) ) ( not ( = ?auto_566678 ?auto_566684 ) ) ( not ( = ?auto_566679 ?auto_566680 ) ) ( not ( = ?auto_566679 ?auto_566681 ) ) ( not ( = ?auto_566679 ?auto_566682 ) ) ( not ( = ?auto_566679 ?auto_566683 ) ) ( not ( = ?auto_566679 ?auto_566684 ) ) ( not ( = ?auto_566680 ?auto_566681 ) ) ( not ( = ?auto_566680 ?auto_566682 ) ) ( not ( = ?auto_566680 ?auto_566683 ) ) ( not ( = ?auto_566680 ?auto_566684 ) ) ( not ( = ?auto_566681 ?auto_566682 ) ) ( not ( = ?auto_566681 ?auto_566683 ) ) ( not ( = ?auto_566681 ?auto_566684 ) ) ( not ( = ?auto_566682 ?auto_566683 ) ) ( not ( = ?auto_566682 ?auto_566684 ) ) ( not ( = ?auto_566683 ?auto_566684 ) ) ( ON ?auto_566682 ?auto_566683 ) ( ON ?auto_566681 ?auto_566682 ) ( CLEAR ?auto_566679 ) ( ON ?auto_566680 ?auto_566681 ) ( CLEAR ?auto_566680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_566674 ?auto_566675 ?auto_566676 ?auto_566677 ?auto_566678 ?auto_566679 ?auto_566680 )
      ( MAKE-10PILE ?auto_566674 ?auto_566675 ?auto_566676 ?auto_566677 ?auto_566678 ?auto_566679 ?auto_566680 ?auto_566681 ?auto_566682 ?auto_566683 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_566716 - BLOCK
      ?auto_566717 - BLOCK
      ?auto_566718 - BLOCK
      ?auto_566719 - BLOCK
      ?auto_566720 - BLOCK
      ?auto_566721 - BLOCK
      ?auto_566722 - BLOCK
      ?auto_566723 - BLOCK
      ?auto_566724 - BLOCK
      ?auto_566725 - BLOCK
    )
    :vars
    (
      ?auto_566726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_566725 ?auto_566726 ) ( ON-TABLE ?auto_566716 ) ( ON ?auto_566717 ?auto_566716 ) ( ON ?auto_566718 ?auto_566717 ) ( ON ?auto_566719 ?auto_566718 ) ( ON ?auto_566720 ?auto_566719 ) ( not ( = ?auto_566716 ?auto_566717 ) ) ( not ( = ?auto_566716 ?auto_566718 ) ) ( not ( = ?auto_566716 ?auto_566719 ) ) ( not ( = ?auto_566716 ?auto_566720 ) ) ( not ( = ?auto_566716 ?auto_566721 ) ) ( not ( = ?auto_566716 ?auto_566722 ) ) ( not ( = ?auto_566716 ?auto_566723 ) ) ( not ( = ?auto_566716 ?auto_566724 ) ) ( not ( = ?auto_566716 ?auto_566725 ) ) ( not ( = ?auto_566716 ?auto_566726 ) ) ( not ( = ?auto_566717 ?auto_566718 ) ) ( not ( = ?auto_566717 ?auto_566719 ) ) ( not ( = ?auto_566717 ?auto_566720 ) ) ( not ( = ?auto_566717 ?auto_566721 ) ) ( not ( = ?auto_566717 ?auto_566722 ) ) ( not ( = ?auto_566717 ?auto_566723 ) ) ( not ( = ?auto_566717 ?auto_566724 ) ) ( not ( = ?auto_566717 ?auto_566725 ) ) ( not ( = ?auto_566717 ?auto_566726 ) ) ( not ( = ?auto_566718 ?auto_566719 ) ) ( not ( = ?auto_566718 ?auto_566720 ) ) ( not ( = ?auto_566718 ?auto_566721 ) ) ( not ( = ?auto_566718 ?auto_566722 ) ) ( not ( = ?auto_566718 ?auto_566723 ) ) ( not ( = ?auto_566718 ?auto_566724 ) ) ( not ( = ?auto_566718 ?auto_566725 ) ) ( not ( = ?auto_566718 ?auto_566726 ) ) ( not ( = ?auto_566719 ?auto_566720 ) ) ( not ( = ?auto_566719 ?auto_566721 ) ) ( not ( = ?auto_566719 ?auto_566722 ) ) ( not ( = ?auto_566719 ?auto_566723 ) ) ( not ( = ?auto_566719 ?auto_566724 ) ) ( not ( = ?auto_566719 ?auto_566725 ) ) ( not ( = ?auto_566719 ?auto_566726 ) ) ( not ( = ?auto_566720 ?auto_566721 ) ) ( not ( = ?auto_566720 ?auto_566722 ) ) ( not ( = ?auto_566720 ?auto_566723 ) ) ( not ( = ?auto_566720 ?auto_566724 ) ) ( not ( = ?auto_566720 ?auto_566725 ) ) ( not ( = ?auto_566720 ?auto_566726 ) ) ( not ( = ?auto_566721 ?auto_566722 ) ) ( not ( = ?auto_566721 ?auto_566723 ) ) ( not ( = ?auto_566721 ?auto_566724 ) ) ( not ( = ?auto_566721 ?auto_566725 ) ) ( not ( = ?auto_566721 ?auto_566726 ) ) ( not ( = ?auto_566722 ?auto_566723 ) ) ( not ( = ?auto_566722 ?auto_566724 ) ) ( not ( = ?auto_566722 ?auto_566725 ) ) ( not ( = ?auto_566722 ?auto_566726 ) ) ( not ( = ?auto_566723 ?auto_566724 ) ) ( not ( = ?auto_566723 ?auto_566725 ) ) ( not ( = ?auto_566723 ?auto_566726 ) ) ( not ( = ?auto_566724 ?auto_566725 ) ) ( not ( = ?auto_566724 ?auto_566726 ) ) ( not ( = ?auto_566725 ?auto_566726 ) ) ( ON ?auto_566724 ?auto_566725 ) ( ON ?auto_566723 ?auto_566724 ) ( ON ?auto_566722 ?auto_566723 ) ( CLEAR ?auto_566720 ) ( ON ?auto_566721 ?auto_566722 ) ( CLEAR ?auto_566721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_566716 ?auto_566717 ?auto_566718 ?auto_566719 ?auto_566720 ?auto_566721 )
      ( MAKE-10PILE ?auto_566716 ?auto_566717 ?auto_566718 ?auto_566719 ?auto_566720 ?auto_566721 ?auto_566722 ?auto_566723 ?auto_566724 ?auto_566725 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_566758 - BLOCK
      ?auto_566759 - BLOCK
      ?auto_566760 - BLOCK
      ?auto_566761 - BLOCK
      ?auto_566762 - BLOCK
      ?auto_566763 - BLOCK
      ?auto_566764 - BLOCK
      ?auto_566765 - BLOCK
      ?auto_566766 - BLOCK
      ?auto_566767 - BLOCK
    )
    :vars
    (
      ?auto_566768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_566767 ?auto_566768 ) ( ON-TABLE ?auto_566758 ) ( ON ?auto_566759 ?auto_566758 ) ( ON ?auto_566760 ?auto_566759 ) ( ON ?auto_566761 ?auto_566760 ) ( not ( = ?auto_566758 ?auto_566759 ) ) ( not ( = ?auto_566758 ?auto_566760 ) ) ( not ( = ?auto_566758 ?auto_566761 ) ) ( not ( = ?auto_566758 ?auto_566762 ) ) ( not ( = ?auto_566758 ?auto_566763 ) ) ( not ( = ?auto_566758 ?auto_566764 ) ) ( not ( = ?auto_566758 ?auto_566765 ) ) ( not ( = ?auto_566758 ?auto_566766 ) ) ( not ( = ?auto_566758 ?auto_566767 ) ) ( not ( = ?auto_566758 ?auto_566768 ) ) ( not ( = ?auto_566759 ?auto_566760 ) ) ( not ( = ?auto_566759 ?auto_566761 ) ) ( not ( = ?auto_566759 ?auto_566762 ) ) ( not ( = ?auto_566759 ?auto_566763 ) ) ( not ( = ?auto_566759 ?auto_566764 ) ) ( not ( = ?auto_566759 ?auto_566765 ) ) ( not ( = ?auto_566759 ?auto_566766 ) ) ( not ( = ?auto_566759 ?auto_566767 ) ) ( not ( = ?auto_566759 ?auto_566768 ) ) ( not ( = ?auto_566760 ?auto_566761 ) ) ( not ( = ?auto_566760 ?auto_566762 ) ) ( not ( = ?auto_566760 ?auto_566763 ) ) ( not ( = ?auto_566760 ?auto_566764 ) ) ( not ( = ?auto_566760 ?auto_566765 ) ) ( not ( = ?auto_566760 ?auto_566766 ) ) ( not ( = ?auto_566760 ?auto_566767 ) ) ( not ( = ?auto_566760 ?auto_566768 ) ) ( not ( = ?auto_566761 ?auto_566762 ) ) ( not ( = ?auto_566761 ?auto_566763 ) ) ( not ( = ?auto_566761 ?auto_566764 ) ) ( not ( = ?auto_566761 ?auto_566765 ) ) ( not ( = ?auto_566761 ?auto_566766 ) ) ( not ( = ?auto_566761 ?auto_566767 ) ) ( not ( = ?auto_566761 ?auto_566768 ) ) ( not ( = ?auto_566762 ?auto_566763 ) ) ( not ( = ?auto_566762 ?auto_566764 ) ) ( not ( = ?auto_566762 ?auto_566765 ) ) ( not ( = ?auto_566762 ?auto_566766 ) ) ( not ( = ?auto_566762 ?auto_566767 ) ) ( not ( = ?auto_566762 ?auto_566768 ) ) ( not ( = ?auto_566763 ?auto_566764 ) ) ( not ( = ?auto_566763 ?auto_566765 ) ) ( not ( = ?auto_566763 ?auto_566766 ) ) ( not ( = ?auto_566763 ?auto_566767 ) ) ( not ( = ?auto_566763 ?auto_566768 ) ) ( not ( = ?auto_566764 ?auto_566765 ) ) ( not ( = ?auto_566764 ?auto_566766 ) ) ( not ( = ?auto_566764 ?auto_566767 ) ) ( not ( = ?auto_566764 ?auto_566768 ) ) ( not ( = ?auto_566765 ?auto_566766 ) ) ( not ( = ?auto_566765 ?auto_566767 ) ) ( not ( = ?auto_566765 ?auto_566768 ) ) ( not ( = ?auto_566766 ?auto_566767 ) ) ( not ( = ?auto_566766 ?auto_566768 ) ) ( not ( = ?auto_566767 ?auto_566768 ) ) ( ON ?auto_566766 ?auto_566767 ) ( ON ?auto_566765 ?auto_566766 ) ( ON ?auto_566764 ?auto_566765 ) ( ON ?auto_566763 ?auto_566764 ) ( CLEAR ?auto_566761 ) ( ON ?auto_566762 ?auto_566763 ) ( CLEAR ?auto_566762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_566758 ?auto_566759 ?auto_566760 ?auto_566761 ?auto_566762 )
      ( MAKE-10PILE ?auto_566758 ?auto_566759 ?auto_566760 ?auto_566761 ?auto_566762 ?auto_566763 ?auto_566764 ?auto_566765 ?auto_566766 ?auto_566767 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_566800 - BLOCK
      ?auto_566801 - BLOCK
      ?auto_566802 - BLOCK
      ?auto_566803 - BLOCK
      ?auto_566804 - BLOCK
      ?auto_566805 - BLOCK
      ?auto_566806 - BLOCK
      ?auto_566807 - BLOCK
      ?auto_566808 - BLOCK
      ?auto_566809 - BLOCK
    )
    :vars
    (
      ?auto_566810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_566809 ?auto_566810 ) ( ON-TABLE ?auto_566800 ) ( ON ?auto_566801 ?auto_566800 ) ( ON ?auto_566802 ?auto_566801 ) ( not ( = ?auto_566800 ?auto_566801 ) ) ( not ( = ?auto_566800 ?auto_566802 ) ) ( not ( = ?auto_566800 ?auto_566803 ) ) ( not ( = ?auto_566800 ?auto_566804 ) ) ( not ( = ?auto_566800 ?auto_566805 ) ) ( not ( = ?auto_566800 ?auto_566806 ) ) ( not ( = ?auto_566800 ?auto_566807 ) ) ( not ( = ?auto_566800 ?auto_566808 ) ) ( not ( = ?auto_566800 ?auto_566809 ) ) ( not ( = ?auto_566800 ?auto_566810 ) ) ( not ( = ?auto_566801 ?auto_566802 ) ) ( not ( = ?auto_566801 ?auto_566803 ) ) ( not ( = ?auto_566801 ?auto_566804 ) ) ( not ( = ?auto_566801 ?auto_566805 ) ) ( not ( = ?auto_566801 ?auto_566806 ) ) ( not ( = ?auto_566801 ?auto_566807 ) ) ( not ( = ?auto_566801 ?auto_566808 ) ) ( not ( = ?auto_566801 ?auto_566809 ) ) ( not ( = ?auto_566801 ?auto_566810 ) ) ( not ( = ?auto_566802 ?auto_566803 ) ) ( not ( = ?auto_566802 ?auto_566804 ) ) ( not ( = ?auto_566802 ?auto_566805 ) ) ( not ( = ?auto_566802 ?auto_566806 ) ) ( not ( = ?auto_566802 ?auto_566807 ) ) ( not ( = ?auto_566802 ?auto_566808 ) ) ( not ( = ?auto_566802 ?auto_566809 ) ) ( not ( = ?auto_566802 ?auto_566810 ) ) ( not ( = ?auto_566803 ?auto_566804 ) ) ( not ( = ?auto_566803 ?auto_566805 ) ) ( not ( = ?auto_566803 ?auto_566806 ) ) ( not ( = ?auto_566803 ?auto_566807 ) ) ( not ( = ?auto_566803 ?auto_566808 ) ) ( not ( = ?auto_566803 ?auto_566809 ) ) ( not ( = ?auto_566803 ?auto_566810 ) ) ( not ( = ?auto_566804 ?auto_566805 ) ) ( not ( = ?auto_566804 ?auto_566806 ) ) ( not ( = ?auto_566804 ?auto_566807 ) ) ( not ( = ?auto_566804 ?auto_566808 ) ) ( not ( = ?auto_566804 ?auto_566809 ) ) ( not ( = ?auto_566804 ?auto_566810 ) ) ( not ( = ?auto_566805 ?auto_566806 ) ) ( not ( = ?auto_566805 ?auto_566807 ) ) ( not ( = ?auto_566805 ?auto_566808 ) ) ( not ( = ?auto_566805 ?auto_566809 ) ) ( not ( = ?auto_566805 ?auto_566810 ) ) ( not ( = ?auto_566806 ?auto_566807 ) ) ( not ( = ?auto_566806 ?auto_566808 ) ) ( not ( = ?auto_566806 ?auto_566809 ) ) ( not ( = ?auto_566806 ?auto_566810 ) ) ( not ( = ?auto_566807 ?auto_566808 ) ) ( not ( = ?auto_566807 ?auto_566809 ) ) ( not ( = ?auto_566807 ?auto_566810 ) ) ( not ( = ?auto_566808 ?auto_566809 ) ) ( not ( = ?auto_566808 ?auto_566810 ) ) ( not ( = ?auto_566809 ?auto_566810 ) ) ( ON ?auto_566808 ?auto_566809 ) ( ON ?auto_566807 ?auto_566808 ) ( ON ?auto_566806 ?auto_566807 ) ( ON ?auto_566805 ?auto_566806 ) ( ON ?auto_566804 ?auto_566805 ) ( CLEAR ?auto_566802 ) ( ON ?auto_566803 ?auto_566804 ) ( CLEAR ?auto_566803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_566800 ?auto_566801 ?auto_566802 ?auto_566803 )
      ( MAKE-10PILE ?auto_566800 ?auto_566801 ?auto_566802 ?auto_566803 ?auto_566804 ?auto_566805 ?auto_566806 ?auto_566807 ?auto_566808 ?auto_566809 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_566842 - BLOCK
      ?auto_566843 - BLOCK
      ?auto_566844 - BLOCK
      ?auto_566845 - BLOCK
      ?auto_566846 - BLOCK
      ?auto_566847 - BLOCK
      ?auto_566848 - BLOCK
      ?auto_566849 - BLOCK
      ?auto_566850 - BLOCK
      ?auto_566851 - BLOCK
    )
    :vars
    (
      ?auto_566852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_566851 ?auto_566852 ) ( ON-TABLE ?auto_566842 ) ( ON ?auto_566843 ?auto_566842 ) ( not ( = ?auto_566842 ?auto_566843 ) ) ( not ( = ?auto_566842 ?auto_566844 ) ) ( not ( = ?auto_566842 ?auto_566845 ) ) ( not ( = ?auto_566842 ?auto_566846 ) ) ( not ( = ?auto_566842 ?auto_566847 ) ) ( not ( = ?auto_566842 ?auto_566848 ) ) ( not ( = ?auto_566842 ?auto_566849 ) ) ( not ( = ?auto_566842 ?auto_566850 ) ) ( not ( = ?auto_566842 ?auto_566851 ) ) ( not ( = ?auto_566842 ?auto_566852 ) ) ( not ( = ?auto_566843 ?auto_566844 ) ) ( not ( = ?auto_566843 ?auto_566845 ) ) ( not ( = ?auto_566843 ?auto_566846 ) ) ( not ( = ?auto_566843 ?auto_566847 ) ) ( not ( = ?auto_566843 ?auto_566848 ) ) ( not ( = ?auto_566843 ?auto_566849 ) ) ( not ( = ?auto_566843 ?auto_566850 ) ) ( not ( = ?auto_566843 ?auto_566851 ) ) ( not ( = ?auto_566843 ?auto_566852 ) ) ( not ( = ?auto_566844 ?auto_566845 ) ) ( not ( = ?auto_566844 ?auto_566846 ) ) ( not ( = ?auto_566844 ?auto_566847 ) ) ( not ( = ?auto_566844 ?auto_566848 ) ) ( not ( = ?auto_566844 ?auto_566849 ) ) ( not ( = ?auto_566844 ?auto_566850 ) ) ( not ( = ?auto_566844 ?auto_566851 ) ) ( not ( = ?auto_566844 ?auto_566852 ) ) ( not ( = ?auto_566845 ?auto_566846 ) ) ( not ( = ?auto_566845 ?auto_566847 ) ) ( not ( = ?auto_566845 ?auto_566848 ) ) ( not ( = ?auto_566845 ?auto_566849 ) ) ( not ( = ?auto_566845 ?auto_566850 ) ) ( not ( = ?auto_566845 ?auto_566851 ) ) ( not ( = ?auto_566845 ?auto_566852 ) ) ( not ( = ?auto_566846 ?auto_566847 ) ) ( not ( = ?auto_566846 ?auto_566848 ) ) ( not ( = ?auto_566846 ?auto_566849 ) ) ( not ( = ?auto_566846 ?auto_566850 ) ) ( not ( = ?auto_566846 ?auto_566851 ) ) ( not ( = ?auto_566846 ?auto_566852 ) ) ( not ( = ?auto_566847 ?auto_566848 ) ) ( not ( = ?auto_566847 ?auto_566849 ) ) ( not ( = ?auto_566847 ?auto_566850 ) ) ( not ( = ?auto_566847 ?auto_566851 ) ) ( not ( = ?auto_566847 ?auto_566852 ) ) ( not ( = ?auto_566848 ?auto_566849 ) ) ( not ( = ?auto_566848 ?auto_566850 ) ) ( not ( = ?auto_566848 ?auto_566851 ) ) ( not ( = ?auto_566848 ?auto_566852 ) ) ( not ( = ?auto_566849 ?auto_566850 ) ) ( not ( = ?auto_566849 ?auto_566851 ) ) ( not ( = ?auto_566849 ?auto_566852 ) ) ( not ( = ?auto_566850 ?auto_566851 ) ) ( not ( = ?auto_566850 ?auto_566852 ) ) ( not ( = ?auto_566851 ?auto_566852 ) ) ( ON ?auto_566850 ?auto_566851 ) ( ON ?auto_566849 ?auto_566850 ) ( ON ?auto_566848 ?auto_566849 ) ( ON ?auto_566847 ?auto_566848 ) ( ON ?auto_566846 ?auto_566847 ) ( ON ?auto_566845 ?auto_566846 ) ( CLEAR ?auto_566843 ) ( ON ?auto_566844 ?auto_566845 ) ( CLEAR ?auto_566844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_566842 ?auto_566843 ?auto_566844 )
      ( MAKE-10PILE ?auto_566842 ?auto_566843 ?auto_566844 ?auto_566845 ?auto_566846 ?auto_566847 ?auto_566848 ?auto_566849 ?auto_566850 ?auto_566851 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_566884 - BLOCK
      ?auto_566885 - BLOCK
      ?auto_566886 - BLOCK
      ?auto_566887 - BLOCK
      ?auto_566888 - BLOCK
      ?auto_566889 - BLOCK
      ?auto_566890 - BLOCK
      ?auto_566891 - BLOCK
      ?auto_566892 - BLOCK
      ?auto_566893 - BLOCK
    )
    :vars
    (
      ?auto_566894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_566893 ?auto_566894 ) ( ON-TABLE ?auto_566884 ) ( not ( = ?auto_566884 ?auto_566885 ) ) ( not ( = ?auto_566884 ?auto_566886 ) ) ( not ( = ?auto_566884 ?auto_566887 ) ) ( not ( = ?auto_566884 ?auto_566888 ) ) ( not ( = ?auto_566884 ?auto_566889 ) ) ( not ( = ?auto_566884 ?auto_566890 ) ) ( not ( = ?auto_566884 ?auto_566891 ) ) ( not ( = ?auto_566884 ?auto_566892 ) ) ( not ( = ?auto_566884 ?auto_566893 ) ) ( not ( = ?auto_566884 ?auto_566894 ) ) ( not ( = ?auto_566885 ?auto_566886 ) ) ( not ( = ?auto_566885 ?auto_566887 ) ) ( not ( = ?auto_566885 ?auto_566888 ) ) ( not ( = ?auto_566885 ?auto_566889 ) ) ( not ( = ?auto_566885 ?auto_566890 ) ) ( not ( = ?auto_566885 ?auto_566891 ) ) ( not ( = ?auto_566885 ?auto_566892 ) ) ( not ( = ?auto_566885 ?auto_566893 ) ) ( not ( = ?auto_566885 ?auto_566894 ) ) ( not ( = ?auto_566886 ?auto_566887 ) ) ( not ( = ?auto_566886 ?auto_566888 ) ) ( not ( = ?auto_566886 ?auto_566889 ) ) ( not ( = ?auto_566886 ?auto_566890 ) ) ( not ( = ?auto_566886 ?auto_566891 ) ) ( not ( = ?auto_566886 ?auto_566892 ) ) ( not ( = ?auto_566886 ?auto_566893 ) ) ( not ( = ?auto_566886 ?auto_566894 ) ) ( not ( = ?auto_566887 ?auto_566888 ) ) ( not ( = ?auto_566887 ?auto_566889 ) ) ( not ( = ?auto_566887 ?auto_566890 ) ) ( not ( = ?auto_566887 ?auto_566891 ) ) ( not ( = ?auto_566887 ?auto_566892 ) ) ( not ( = ?auto_566887 ?auto_566893 ) ) ( not ( = ?auto_566887 ?auto_566894 ) ) ( not ( = ?auto_566888 ?auto_566889 ) ) ( not ( = ?auto_566888 ?auto_566890 ) ) ( not ( = ?auto_566888 ?auto_566891 ) ) ( not ( = ?auto_566888 ?auto_566892 ) ) ( not ( = ?auto_566888 ?auto_566893 ) ) ( not ( = ?auto_566888 ?auto_566894 ) ) ( not ( = ?auto_566889 ?auto_566890 ) ) ( not ( = ?auto_566889 ?auto_566891 ) ) ( not ( = ?auto_566889 ?auto_566892 ) ) ( not ( = ?auto_566889 ?auto_566893 ) ) ( not ( = ?auto_566889 ?auto_566894 ) ) ( not ( = ?auto_566890 ?auto_566891 ) ) ( not ( = ?auto_566890 ?auto_566892 ) ) ( not ( = ?auto_566890 ?auto_566893 ) ) ( not ( = ?auto_566890 ?auto_566894 ) ) ( not ( = ?auto_566891 ?auto_566892 ) ) ( not ( = ?auto_566891 ?auto_566893 ) ) ( not ( = ?auto_566891 ?auto_566894 ) ) ( not ( = ?auto_566892 ?auto_566893 ) ) ( not ( = ?auto_566892 ?auto_566894 ) ) ( not ( = ?auto_566893 ?auto_566894 ) ) ( ON ?auto_566892 ?auto_566893 ) ( ON ?auto_566891 ?auto_566892 ) ( ON ?auto_566890 ?auto_566891 ) ( ON ?auto_566889 ?auto_566890 ) ( ON ?auto_566888 ?auto_566889 ) ( ON ?auto_566887 ?auto_566888 ) ( ON ?auto_566886 ?auto_566887 ) ( CLEAR ?auto_566884 ) ( ON ?auto_566885 ?auto_566886 ) ( CLEAR ?auto_566885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_566884 ?auto_566885 )
      ( MAKE-10PILE ?auto_566884 ?auto_566885 ?auto_566886 ?auto_566887 ?auto_566888 ?auto_566889 ?auto_566890 ?auto_566891 ?auto_566892 ?auto_566893 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_566926 - BLOCK
      ?auto_566927 - BLOCK
      ?auto_566928 - BLOCK
      ?auto_566929 - BLOCK
      ?auto_566930 - BLOCK
      ?auto_566931 - BLOCK
      ?auto_566932 - BLOCK
      ?auto_566933 - BLOCK
      ?auto_566934 - BLOCK
      ?auto_566935 - BLOCK
    )
    :vars
    (
      ?auto_566936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_566935 ?auto_566936 ) ( not ( = ?auto_566926 ?auto_566927 ) ) ( not ( = ?auto_566926 ?auto_566928 ) ) ( not ( = ?auto_566926 ?auto_566929 ) ) ( not ( = ?auto_566926 ?auto_566930 ) ) ( not ( = ?auto_566926 ?auto_566931 ) ) ( not ( = ?auto_566926 ?auto_566932 ) ) ( not ( = ?auto_566926 ?auto_566933 ) ) ( not ( = ?auto_566926 ?auto_566934 ) ) ( not ( = ?auto_566926 ?auto_566935 ) ) ( not ( = ?auto_566926 ?auto_566936 ) ) ( not ( = ?auto_566927 ?auto_566928 ) ) ( not ( = ?auto_566927 ?auto_566929 ) ) ( not ( = ?auto_566927 ?auto_566930 ) ) ( not ( = ?auto_566927 ?auto_566931 ) ) ( not ( = ?auto_566927 ?auto_566932 ) ) ( not ( = ?auto_566927 ?auto_566933 ) ) ( not ( = ?auto_566927 ?auto_566934 ) ) ( not ( = ?auto_566927 ?auto_566935 ) ) ( not ( = ?auto_566927 ?auto_566936 ) ) ( not ( = ?auto_566928 ?auto_566929 ) ) ( not ( = ?auto_566928 ?auto_566930 ) ) ( not ( = ?auto_566928 ?auto_566931 ) ) ( not ( = ?auto_566928 ?auto_566932 ) ) ( not ( = ?auto_566928 ?auto_566933 ) ) ( not ( = ?auto_566928 ?auto_566934 ) ) ( not ( = ?auto_566928 ?auto_566935 ) ) ( not ( = ?auto_566928 ?auto_566936 ) ) ( not ( = ?auto_566929 ?auto_566930 ) ) ( not ( = ?auto_566929 ?auto_566931 ) ) ( not ( = ?auto_566929 ?auto_566932 ) ) ( not ( = ?auto_566929 ?auto_566933 ) ) ( not ( = ?auto_566929 ?auto_566934 ) ) ( not ( = ?auto_566929 ?auto_566935 ) ) ( not ( = ?auto_566929 ?auto_566936 ) ) ( not ( = ?auto_566930 ?auto_566931 ) ) ( not ( = ?auto_566930 ?auto_566932 ) ) ( not ( = ?auto_566930 ?auto_566933 ) ) ( not ( = ?auto_566930 ?auto_566934 ) ) ( not ( = ?auto_566930 ?auto_566935 ) ) ( not ( = ?auto_566930 ?auto_566936 ) ) ( not ( = ?auto_566931 ?auto_566932 ) ) ( not ( = ?auto_566931 ?auto_566933 ) ) ( not ( = ?auto_566931 ?auto_566934 ) ) ( not ( = ?auto_566931 ?auto_566935 ) ) ( not ( = ?auto_566931 ?auto_566936 ) ) ( not ( = ?auto_566932 ?auto_566933 ) ) ( not ( = ?auto_566932 ?auto_566934 ) ) ( not ( = ?auto_566932 ?auto_566935 ) ) ( not ( = ?auto_566932 ?auto_566936 ) ) ( not ( = ?auto_566933 ?auto_566934 ) ) ( not ( = ?auto_566933 ?auto_566935 ) ) ( not ( = ?auto_566933 ?auto_566936 ) ) ( not ( = ?auto_566934 ?auto_566935 ) ) ( not ( = ?auto_566934 ?auto_566936 ) ) ( not ( = ?auto_566935 ?auto_566936 ) ) ( ON ?auto_566934 ?auto_566935 ) ( ON ?auto_566933 ?auto_566934 ) ( ON ?auto_566932 ?auto_566933 ) ( ON ?auto_566931 ?auto_566932 ) ( ON ?auto_566930 ?auto_566931 ) ( ON ?auto_566929 ?auto_566930 ) ( ON ?auto_566928 ?auto_566929 ) ( ON ?auto_566927 ?auto_566928 ) ( ON ?auto_566926 ?auto_566927 ) ( CLEAR ?auto_566926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_566926 )
      ( MAKE-10PILE ?auto_566926 ?auto_566927 ?auto_566928 ?auto_566929 ?auto_566930 ?auto_566931 ?auto_566932 ?auto_566933 ?auto_566934 ?auto_566935 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_566969 - BLOCK
      ?auto_566970 - BLOCK
      ?auto_566971 - BLOCK
      ?auto_566972 - BLOCK
      ?auto_566973 - BLOCK
      ?auto_566974 - BLOCK
      ?auto_566975 - BLOCK
      ?auto_566976 - BLOCK
      ?auto_566977 - BLOCK
      ?auto_566978 - BLOCK
      ?auto_566979 - BLOCK
    )
    :vars
    (
      ?auto_566980 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_566978 ) ( ON ?auto_566979 ?auto_566980 ) ( CLEAR ?auto_566979 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_566969 ) ( ON ?auto_566970 ?auto_566969 ) ( ON ?auto_566971 ?auto_566970 ) ( ON ?auto_566972 ?auto_566971 ) ( ON ?auto_566973 ?auto_566972 ) ( ON ?auto_566974 ?auto_566973 ) ( ON ?auto_566975 ?auto_566974 ) ( ON ?auto_566976 ?auto_566975 ) ( ON ?auto_566977 ?auto_566976 ) ( ON ?auto_566978 ?auto_566977 ) ( not ( = ?auto_566969 ?auto_566970 ) ) ( not ( = ?auto_566969 ?auto_566971 ) ) ( not ( = ?auto_566969 ?auto_566972 ) ) ( not ( = ?auto_566969 ?auto_566973 ) ) ( not ( = ?auto_566969 ?auto_566974 ) ) ( not ( = ?auto_566969 ?auto_566975 ) ) ( not ( = ?auto_566969 ?auto_566976 ) ) ( not ( = ?auto_566969 ?auto_566977 ) ) ( not ( = ?auto_566969 ?auto_566978 ) ) ( not ( = ?auto_566969 ?auto_566979 ) ) ( not ( = ?auto_566969 ?auto_566980 ) ) ( not ( = ?auto_566970 ?auto_566971 ) ) ( not ( = ?auto_566970 ?auto_566972 ) ) ( not ( = ?auto_566970 ?auto_566973 ) ) ( not ( = ?auto_566970 ?auto_566974 ) ) ( not ( = ?auto_566970 ?auto_566975 ) ) ( not ( = ?auto_566970 ?auto_566976 ) ) ( not ( = ?auto_566970 ?auto_566977 ) ) ( not ( = ?auto_566970 ?auto_566978 ) ) ( not ( = ?auto_566970 ?auto_566979 ) ) ( not ( = ?auto_566970 ?auto_566980 ) ) ( not ( = ?auto_566971 ?auto_566972 ) ) ( not ( = ?auto_566971 ?auto_566973 ) ) ( not ( = ?auto_566971 ?auto_566974 ) ) ( not ( = ?auto_566971 ?auto_566975 ) ) ( not ( = ?auto_566971 ?auto_566976 ) ) ( not ( = ?auto_566971 ?auto_566977 ) ) ( not ( = ?auto_566971 ?auto_566978 ) ) ( not ( = ?auto_566971 ?auto_566979 ) ) ( not ( = ?auto_566971 ?auto_566980 ) ) ( not ( = ?auto_566972 ?auto_566973 ) ) ( not ( = ?auto_566972 ?auto_566974 ) ) ( not ( = ?auto_566972 ?auto_566975 ) ) ( not ( = ?auto_566972 ?auto_566976 ) ) ( not ( = ?auto_566972 ?auto_566977 ) ) ( not ( = ?auto_566972 ?auto_566978 ) ) ( not ( = ?auto_566972 ?auto_566979 ) ) ( not ( = ?auto_566972 ?auto_566980 ) ) ( not ( = ?auto_566973 ?auto_566974 ) ) ( not ( = ?auto_566973 ?auto_566975 ) ) ( not ( = ?auto_566973 ?auto_566976 ) ) ( not ( = ?auto_566973 ?auto_566977 ) ) ( not ( = ?auto_566973 ?auto_566978 ) ) ( not ( = ?auto_566973 ?auto_566979 ) ) ( not ( = ?auto_566973 ?auto_566980 ) ) ( not ( = ?auto_566974 ?auto_566975 ) ) ( not ( = ?auto_566974 ?auto_566976 ) ) ( not ( = ?auto_566974 ?auto_566977 ) ) ( not ( = ?auto_566974 ?auto_566978 ) ) ( not ( = ?auto_566974 ?auto_566979 ) ) ( not ( = ?auto_566974 ?auto_566980 ) ) ( not ( = ?auto_566975 ?auto_566976 ) ) ( not ( = ?auto_566975 ?auto_566977 ) ) ( not ( = ?auto_566975 ?auto_566978 ) ) ( not ( = ?auto_566975 ?auto_566979 ) ) ( not ( = ?auto_566975 ?auto_566980 ) ) ( not ( = ?auto_566976 ?auto_566977 ) ) ( not ( = ?auto_566976 ?auto_566978 ) ) ( not ( = ?auto_566976 ?auto_566979 ) ) ( not ( = ?auto_566976 ?auto_566980 ) ) ( not ( = ?auto_566977 ?auto_566978 ) ) ( not ( = ?auto_566977 ?auto_566979 ) ) ( not ( = ?auto_566977 ?auto_566980 ) ) ( not ( = ?auto_566978 ?auto_566979 ) ) ( not ( = ?auto_566978 ?auto_566980 ) ) ( not ( = ?auto_566979 ?auto_566980 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_566979 ?auto_566980 )
      ( !STACK ?auto_566979 ?auto_566978 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_567015 - BLOCK
      ?auto_567016 - BLOCK
      ?auto_567017 - BLOCK
      ?auto_567018 - BLOCK
      ?auto_567019 - BLOCK
      ?auto_567020 - BLOCK
      ?auto_567021 - BLOCK
      ?auto_567022 - BLOCK
      ?auto_567023 - BLOCK
      ?auto_567024 - BLOCK
      ?auto_567025 - BLOCK
    )
    :vars
    (
      ?auto_567026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_567025 ?auto_567026 ) ( ON-TABLE ?auto_567015 ) ( ON ?auto_567016 ?auto_567015 ) ( ON ?auto_567017 ?auto_567016 ) ( ON ?auto_567018 ?auto_567017 ) ( ON ?auto_567019 ?auto_567018 ) ( ON ?auto_567020 ?auto_567019 ) ( ON ?auto_567021 ?auto_567020 ) ( ON ?auto_567022 ?auto_567021 ) ( ON ?auto_567023 ?auto_567022 ) ( not ( = ?auto_567015 ?auto_567016 ) ) ( not ( = ?auto_567015 ?auto_567017 ) ) ( not ( = ?auto_567015 ?auto_567018 ) ) ( not ( = ?auto_567015 ?auto_567019 ) ) ( not ( = ?auto_567015 ?auto_567020 ) ) ( not ( = ?auto_567015 ?auto_567021 ) ) ( not ( = ?auto_567015 ?auto_567022 ) ) ( not ( = ?auto_567015 ?auto_567023 ) ) ( not ( = ?auto_567015 ?auto_567024 ) ) ( not ( = ?auto_567015 ?auto_567025 ) ) ( not ( = ?auto_567015 ?auto_567026 ) ) ( not ( = ?auto_567016 ?auto_567017 ) ) ( not ( = ?auto_567016 ?auto_567018 ) ) ( not ( = ?auto_567016 ?auto_567019 ) ) ( not ( = ?auto_567016 ?auto_567020 ) ) ( not ( = ?auto_567016 ?auto_567021 ) ) ( not ( = ?auto_567016 ?auto_567022 ) ) ( not ( = ?auto_567016 ?auto_567023 ) ) ( not ( = ?auto_567016 ?auto_567024 ) ) ( not ( = ?auto_567016 ?auto_567025 ) ) ( not ( = ?auto_567016 ?auto_567026 ) ) ( not ( = ?auto_567017 ?auto_567018 ) ) ( not ( = ?auto_567017 ?auto_567019 ) ) ( not ( = ?auto_567017 ?auto_567020 ) ) ( not ( = ?auto_567017 ?auto_567021 ) ) ( not ( = ?auto_567017 ?auto_567022 ) ) ( not ( = ?auto_567017 ?auto_567023 ) ) ( not ( = ?auto_567017 ?auto_567024 ) ) ( not ( = ?auto_567017 ?auto_567025 ) ) ( not ( = ?auto_567017 ?auto_567026 ) ) ( not ( = ?auto_567018 ?auto_567019 ) ) ( not ( = ?auto_567018 ?auto_567020 ) ) ( not ( = ?auto_567018 ?auto_567021 ) ) ( not ( = ?auto_567018 ?auto_567022 ) ) ( not ( = ?auto_567018 ?auto_567023 ) ) ( not ( = ?auto_567018 ?auto_567024 ) ) ( not ( = ?auto_567018 ?auto_567025 ) ) ( not ( = ?auto_567018 ?auto_567026 ) ) ( not ( = ?auto_567019 ?auto_567020 ) ) ( not ( = ?auto_567019 ?auto_567021 ) ) ( not ( = ?auto_567019 ?auto_567022 ) ) ( not ( = ?auto_567019 ?auto_567023 ) ) ( not ( = ?auto_567019 ?auto_567024 ) ) ( not ( = ?auto_567019 ?auto_567025 ) ) ( not ( = ?auto_567019 ?auto_567026 ) ) ( not ( = ?auto_567020 ?auto_567021 ) ) ( not ( = ?auto_567020 ?auto_567022 ) ) ( not ( = ?auto_567020 ?auto_567023 ) ) ( not ( = ?auto_567020 ?auto_567024 ) ) ( not ( = ?auto_567020 ?auto_567025 ) ) ( not ( = ?auto_567020 ?auto_567026 ) ) ( not ( = ?auto_567021 ?auto_567022 ) ) ( not ( = ?auto_567021 ?auto_567023 ) ) ( not ( = ?auto_567021 ?auto_567024 ) ) ( not ( = ?auto_567021 ?auto_567025 ) ) ( not ( = ?auto_567021 ?auto_567026 ) ) ( not ( = ?auto_567022 ?auto_567023 ) ) ( not ( = ?auto_567022 ?auto_567024 ) ) ( not ( = ?auto_567022 ?auto_567025 ) ) ( not ( = ?auto_567022 ?auto_567026 ) ) ( not ( = ?auto_567023 ?auto_567024 ) ) ( not ( = ?auto_567023 ?auto_567025 ) ) ( not ( = ?auto_567023 ?auto_567026 ) ) ( not ( = ?auto_567024 ?auto_567025 ) ) ( not ( = ?auto_567024 ?auto_567026 ) ) ( not ( = ?auto_567025 ?auto_567026 ) ) ( CLEAR ?auto_567023 ) ( ON ?auto_567024 ?auto_567025 ) ( CLEAR ?auto_567024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_567015 ?auto_567016 ?auto_567017 ?auto_567018 ?auto_567019 ?auto_567020 ?auto_567021 ?auto_567022 ?auto_567023 ?auto_567024 )
      ( MAKE-11PILE ?auto_567015 ?auto_567016 ?auto_567017 ?auto_567018 ?auto_567019 ?auto_567020 ?auto_567021 ?auto_567022 ?auto_567023 ?auto_567024 ?auto_567025 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_567061 - BLOCK
      ?auto_567062 - BLOCK
      ?auto_567063 - BLOCK
      ?auto_567064 - BLOCK
      ?auto_567065 - BLOCK
      ?auto_567066 - BLOCK
      ?auto_567067 - BLOCK
      ?auto_567068 - BLOCK
      ?auto_567069 - BLOCK
      ?auto_567070 - BLOCK
      ?auto_567071 - BLOCK
    )
    :vars
    (
      ?auto_567072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_567071 ?auto_567072 ) ( ON-TABLE ?auto_567061 ) ( ON ?auto_567062 ?auto_567061 ) ( ON ?auto_567063 ?auto_567062 ) ( ON ?auto_567064 ?auto_567063 ) ( ON ?auto_567065 ?auto_567064 ) ( ON ?auto_567066 ?auto_567065 ) ( ON ?auto_567067 ?auto_567066 ) ( ON ?auto_567068 ?auto_567067 ) ( not ( = ?auto_567061 ?auto_567062 ) ) ( not ( = ?auto_567061 ?auto_567063 ) ) ( not ( = ?auto_567061 ?auto_567064 ) ) ( not ( = ?auto_567061 ?auto_567065 ) ) ( not ( = ?auto_567061 ?auto_567066 ) ) ( not ( = ?auto_567061 ?auto_567067 ) ) ( not ( = ?auto_567061 ?auto_567068 ) ) ( not ( = ?auto_567061 ?auto_567069 ) ) ( not ( = ?auto_567061 ?auto_567070 ) ) ( not ( = ?auto_567061 ?auto_567071 ) ) ( not ( = ?auto_567061 ?auto_567072 ) ) ( not ( = ?auto_567062 ?auto_567063 ) ) ( not ( = ?auto_567062 ?auto_567064 ) ) ( not ( = ?auto_567062 ?auto_567065 ) ) ( not ( = ?auto_567062 ?auto_567066 ) ) ( not ( = ?auto_567062 ?auto_567067 ) ) ( not ( = ?auto_567062 ?auto_567068 ) ) ( not ( = ?auto_567062 ?auto_567069 ) ) ( not ( = ?auto_567062 ?auto_567070 ) ) ( not ( = ?auto_567062 ?auto_567071 ) ) ( not ( = ?auto_567062 ?auto_567072 ) ) ( not ( = ?auto_567063 ?auto_567064 ) ) ( not ( = ?auto_567063 ?auto_567065 ) ) ( not ( = ?auto_567063 ?auto_567066 ) ) ( not ( = ?auto_567063 ?auto_567067 ) ) ( not ( = ?auto_567063 ?auto_567068 ) ) ( not ( = ?auto_567063 ?auto_567069 ) ) ( not ( = ?auto_567063 ?auto_567070 ) ) ( not ( = ?auto_567063 ?auto_567071 ) ) ( not ( = ?auto_567063 ?auto_567072 ) ) ( not ( = ?auto_567064 ?auto_567065 ) ) ( not ( = ?auto_567064 ?auto_567066 ) ) ( not ( = ?auto_567064 ?auto_567067 ) ) ( not ( = ?auto_567064 ?auto_567068 ) ) ( not ( = ?auto_567064 ?auto_567069 ) ) ( not ( = ?auto_567064 ?auto_567070 ) ) ( not ( = ?auto_567064 ?auto_567071 ) ) ( not ( = ?auto_567064 ?auto_567072 ) ) ( not ( = ?auto_567065 ?auto_567066 ) ) ( not ( = ?auto_567065 ?auto_567067 ) ) ( not ( = ?auto_567065 ?auto_567068 ) ) ( not ( = ?auto_567065 ?auto_567069 ) ) ( not ( = ?auto_567065 ?auto_567070 ) ) ( not ( = ?auto_567065 ?auto_567071 ) ) ( not ( = ?auto_567065 ?auto_567072 ) ) ( not ( = ?auto_567066 ?auto_567067 ) ) ( not ( = ?auto_567066 ?auto_567068 ) ) ( not ( = ?auto_567066 ?auto_567069 ) ) ( not ( = ?auto_567066 ?auto_567070 ) ) ( not ( = ?auto_567066 ?auto_567071 ) ) ( not ( = ?auto_567066 ?auto_567072 ) ) ( not ( = ?auto_567067 ?auto_567068 ) ) ( not ( = ?auto_567067 ?auto_567069 ) ) ( not ( = ?auto_567067 ?auto_567070 ) ) ( not ( = ?auto_567067 ?auto_567071 ) ) ( not ( = ?auto_567067 ?auto_567072 ) ) ( not ( = ?auto_567068 ?auto_567069 ) ) ( not ( = ?auto_567068 ?auto_567070 ) ) ( not ( = ?auto_567068 ?auto_567071 ) ) ( not ( = ?auto_567068 ?auto_567072 ) ) ( not ( = ?auto_567069 ?auto_567070 ) ) ( not ( = ?auto_567069 ?auto_567071 ) ) ( not ( = ?auto_567069 ?auto_567072 ) ) ( not ( = ?auto_567070 ?auto_567071 ) ) ( not ( = ?auto_567070 ?auto_567072 ) ) ( not ( = ?auto_567071 ?auto_567072 ) ) ( ON ?auto_567070 ?auto_567071 ) ( CLEAR ?auto_567068 ) ( ON ?auto_567069 ?auto_567070 ) ( CLEAR ?auto_567069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_567061 ?auto_567062 ?auto_567063 ?auto_567064 ?auto_567065 ?auto_567066 ?auto_567067 ?auto_567068 ?auto_567069 )
      ( MAKE-11PILE ?auto_567061 ?auto_567062 ?auto_567063 ?auto_567064 ?auto_567065 ?auto_567066 ?auto_567067 ?auto_567068 ?auto_567069 ?auto_567070 ?auto_567071 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_567107 - BLOCK
      ?auto_567108 - BLOCK
      ?auto_567109 - BLOCK
      ?auto_567110 - BLOCK
      ?auto_567111 - BLOCK
      ?auto_567112 - BLOCK
      ?auto_567113 - BLOCK
      ?auto_567114 - BLOCK
      ?auto_567115 - BLOCK
      ?auto_567116 - BLOCK
      ?auto_567117 - BLOCK
    )
    :vars
    (
      ?auto_567118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_567117 ?auto_567118 ) ( ON-TABLE ?auto_567107 ) ( ON ?auto_567108 ?auto_567107 ) ( ON ?auto_567109 ?auto_567108 ) ( ON ?auto_567110 ?auto_567109 ) ( ON ?auto_567111 ?auto_567110 ) ( ON ?auto_567112 ?auto_567111 ) ( ON ?auto_567113 ?auto_567112 ) ( not ( = ?auto_567107 ?auto_567108 ) ) ( not ( = ?auto_567107 ?auto_567109 ) ) ( not ( = ?auto_567107 ?auto_567110 ) ) ( not ( = ?auto_567107 ?auto_567111 ) ) ( not ( = ?auto_567107 ?auto_567112 ) ) ( not ( = ?auto_567107 ?auto_567113 ) ) ( not ( = ?auto_567107 ?auto_567114 ) ) ( not ( = ?auto_567107 ?auto_567115 ) ) ( not ( = ?auto_567107 ?auto_567116 ) ) ( not ( = ?auto_567107 ?auto_567117 ) ) ( not ( = ?auto_567107 ?auto_567118 ) ) ( not ( = ?auto_567108 ?auto_567109 ) ) ( not ( = ?auto_567108 ?auto_567110 ) ) ( not ( = ?auto_567108 ?auto_567111 ) ) ( not ( = ?auto_567108 ?auto_567112 ) ) ( not ( = ?auto_567108 ?auto_567113 ) ) ( not ( = ?auto_567108 ?auto_567114 ) ) ( not ( = ?auto_567108 ?auto_567115 ) ) ( not ( = ?auto_567108 ?auto_567116 ) ) ( not ( = ?auto_567108 ?auto_567117 ) ) ( not ( = ?auto_567108 ?auto_567118 ) ) ( not ( = ?auto_567109 ?auto_567110 ) ) ( not ( = ?auto_567109 ?auto_567111 ) ) ( not ( = ?auto_567109 ?auto_567112 ) ) ( not ( = ?auto_567109 ?auto_567113 ) ) ( not ( = ?auto_567109 ?auto_567114 ) ) ( not ( = ?auto_567109 ?auto_567115 ) ) ( not ( = ?auto_567109 ?auto_567116 ) ) ( not ( = ?auto_567109 ?auto_567117 ) ) ( not ( = ?auto_567109 ?auto_567118 ) ) ( not ( = ?auto_567110 ?auto_567111 ) ) ( not ( = ?auto_567110 ?auto_567112 ) ) ( not ( = ?auto_567110 ?auto_567113 ) ) ( not ( = ?auto_567110 ?auto_567114 ) ) ( not ( = ?auto_567110 ?auto_567115 ) ) ( not ( = ?auto_567110 ?auto_567116 ) ) ( not ( = ?auto_567110 ?auto_567117 ) ) ( not ( = ?auto_567110 ?auto_567118 ) ) ( not ( = ?auto_567111 ?auto_567112 ) ) ( not ( = ?auto_567111 ?auto_567113 ) ) ( not ( = ?auto_567111 ?auto_567114 ) ) ( not ( = ?auto_567111 ?auto_567115 ) ) ( not ( = ?auto_567111 ?auto_567116 ) ) ( not ( = ?auto_567111 ?auto_567117 ) ) ( not ( = ?auto_567111 ?auto_567118 ) ) ( not ( = ?auto_567112 ?auto_567113 ) ) ( not ( = ?auto_567112 ?auto_567114 ) ) ( not ( = ?auto_567112 ?auto_567115 ) ) ( not ( = ?auto_567112 ?auto_567116 ) ) ( not ( = ?auto_567112 ?auto_567117 ) ) ( not ( = ?auto_567112 ?auto_567118 ) ) ( not ( = ?auto_567113 ?auto_567114 ) ) ( not ( = ?auto_567113 ?auto_567115 ) ) ( not ( = ?auto_567113 ?auto_567116 ) ) ( not ( = ?auto_567113 ?auto_567117 ) ) ( not ( = ?auto_567113 ?auto_567118 ) ) ( not ( = ?auto_567114 ?auto_567115 ) ) ( not ( = ?auto_567114 ?auto_567116 ) ) ( not ( = ?auto_567114 ?auto_567117 ) ) ( not ( = ?auto_567114 ?auto_567118 ) ) ( not ( = ?auto_567115 ?auto_567116 ) ) ( not ( = ?auto_567115 ?auto_567117 ) ) ( not ( = ?auto_567115 ?auto_567118 ) ) ( not ( = ?auto_567116 ?auto_567117 ) ) ( not ( = ?auto_567116 ?auto_567118 ) ) ( not ( = ?auto_567117 ?auto_567118 ) ) ( ON ?auto_567116 ?auto_567117 ) ( ON ?auto_567115 ?auto_567116 ) ( CLEAR ?auto_567113 ) ( ON ?auto_567114 ?auto_567115 ) ( CLEAR ?auto_567114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_567107 ?auto_567108 ?auto_567109 ?auto_567110 ?auto_567111 ?auto_567112 ?auto_567113 ?auto_567114 )
      ( MAKE-11PILE ?auto_567107 ?auto_567108 ?auto_567109 ?auto_567110 ?auto_567111 ?auto_567112 ?auto_567113 ?auto_567114 ?auto_567115 ?auto_567116 ?auto_567117 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_567153 - BLOCK
      ?auto_567154 - BLOCK
      ?auto_567155 - BLOCK
      ?auto_567156 - BLOCK
      ?auto_567157 - BLOCK
      ?auto_567158 - BLOCK
      ?auto_567159 - BLOCK
      ?auto_567160 - BLOCK
      ?auto_567161 - BLOCK
      ?auto_567162 - BLOCK
      ?auto_567163 - BLOCK
    )
    :vars
    (
      ?auto_567164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_567163 ?auto_567164 ) ( ON-TABLE ?auto_567153 ) ( ON ?auto_567154 ?auto_567153 ) ( ON ?auto_567155 ?auto_567154 ) ( ON ?auto_567156 ?auto_567155 ) ( ON ?auto_567157 ?auto_567156 ) ( ON ?auto_567158 ?auto_567157 ) ( not ( = ?auto_567153 ?auto_567154 ) ) ( not ( = ?auto_567153 ?auto_567155 ) ) ( not ( = ?auto_567153 ?auto_567156 ) ) ( not ( = ?auto_567153 ?auto_567157 ) ) ( not ( = ?auto_567153 ?auto_567158 ) ) ( not ( = ?auto_567153 ?auto_567159 ) ) ( not ( = ?auto_567153 ?auto_567160 ) ) ( not ( = ?auto_567153 ?auto_567161 ) ) ( not ( = ?auto_567153 ?auto_567162 ) ) ( not ( = ?auto_567153 ?auto_567163 ) ) ( not ( = ?auto_567153 ?auto_567164 ) ) ( not ( = ?auto_567154 ?auto_567155 ) ) ( not ( = ?auto_567154 ?auto_567156 ) ) ( not ( = ?auto_567154 ?auto_567157 ) ) ( not ( = ?auto_567154 ?auto_567158 ) ) ( not ( = ?auto_567154 ?auto_567159 ) ) ( not ( = ?auto_567154 ?auto_567160 ) ) ( not ( = ?auto_567154 ?auto_567161 ) ) ( not ( = ?auto_567154 ?auto_567162 ) ) ( not ( = ?auto_567154 ?auto_567163 ) ) ( not ( = ?auto_567154 ?auto_567164 ) ) ( not ( = ?auto_567155 ?auto_567156 ) ) ( not ( = ?auto_567155 ?auto_567157 ) ) ( not ( = ?auto_567155 ?auto_567158 ) ) ( not ( = ?auto_567155 ?auto_567159 ) ) ( not ( = ?auto_567155 ?auto_567160 ) ) ( not ( = ?auto_567155 ?auto_567161 ) ) ( not ( = ?auto_567155 ?auto_567162 ) ) ( not ( = ?auto_567155 ?auto_567163 ) ) ( not ( = ?auto_567155 ?auto_567164 ) ) ( not ( = ?auto_567156 ?auto_567157 ) ) ( not ( = ?auto_567156 ?auto_567158 ) ) ( not ( = ?auto_567156 ?auto_567159 ) ) ( not ( = ?auto_567156 ?auto_567160 ) ) ( not ( = ?auto_567156 ?auto_567161 ) ) ( not ( = ?auto_567156 ?auto_567162 ) ) ( not ( = ?auto_567156 ?auto_567163 ) ) ( not ( = ?auto_567156 ?auto_567164 ) ) ( not ( = ?auto_567157 ?auto_567158 ) ) ( not ( = ?auto_567157 ?auto_567159 ) ) ( not ( = ?auto_567157 ?auto_567160 ) ) ( not ( = ?auto_567157 ?auto_567161 ) ) ( not ( = ?auto_567157 ?auto_567162 ) ) ( not ( = ?auto_567157 ?auto_567163 ) ) ( not ( = ?auto_567157 ?auto_567164 ) ) ( not ( = ?auto_567158 ?auto_567159 ) ) ( not ( = ?auto_567158 ?auto_567160 ) ) ( not ( = ?auto_567158 ?auto_567161 ) ) ( not ( = ?auto_567158 ?auto_567162 ) ) ( not ( = ?auto_567158 ?auto_567163 ) ) ( not ( = ?auto_567158 ?auto_567164 ) ) ( not ( = ?auto_567159 ?auto_567160 ) ) ( not ( = ?auto_567159 ?auto_567161 ) ) ( not ( = ?auto_567159 ?auto_567162 ) ) ( not ( = ?auto_567159 ?auto_567163 ) ) ( not ( = ?auto_567159 ?auto_567164 ) ) ( not ( = ?auto_567160 ?auto_567161 ) ) ( not ( = ?auto_567160 ?auto_567162 ) ) ( not ( = ?auto_567160 ?auto_567163 ) ) ( not ( = ?auto_567160 ?auto_567164 ) ) ( not ( = ?auto_567161 ?auto_567162 ) ) ( not ( = ?auto_567161 ?auto_567163 ) ) ( not ( = ?auto_567161 ?auto_567164 ) ) ( not ( = ?auto_567162 ?auto_567163 ) ) ( not ( = ?auto_567162 ?auto_567164 ) ) ( not ( = ?auto_567163 ?auto_567164 ) ) ( ON ?auto_567162 ?auto_567163 ) ( ON ?auto_567161 ?auto_567162 ) ( ON ?auto_567160 ?auto_567161 ) ( CLEAR ?auto_567158 ) ( ON ?auto_567159 ?auto_567160 ) ( CLEAR ?auto_567159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_567153 ?auto_567154 ?auto_567155 ?auto_567156 ?auto_567157 ?auto_567158 ?auto_567159 )
      ( MAKE-11PILE ?auto_567153 ?auto_567154 ?auto_567155 ?auto_567156 ?auto_567157 ?auto_567158 ?auto_567159 ?auto_567160 ?auto_567161 ?auto_567162 ?auto_567163 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_567199 - BLOCK
      ?auto_567200 - BLOCK
      ?auto_567201 - BLOCK
      ?auto_567202 - BLOCK
      ?auto_567203 - BLOCK
      ?auto_567204 - BLOCK
      ?auto_567205 - BLOCK
      ?auto_567206 - BLOCK
      ?auto_567207 - BLOCK
      ?auto_567208 - BLOCK
      ?auto_567209 - BLOCK
    )
    :vars
    (
      ?auto_567210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_567209 ?auto_567210 ) ( ON-TABLE ?auto_567199 ) ( ON ?auto_567200 ?auto_567199 ) ( ON ?auto_567201 ?auto_567200 ) ( ON ?auto_567202 ?auto_567201 ) ( ON ?auto_567203 ?auto_567202 ) ( not ( = ?auto_567199 ?auto_567200 ) ) ( not ( = ?auto_567199 ?auto_567201 ) ) ( not ( = ?auto_567199 ?auto_567202 ) ) ( not ( = ?auto_567199 ?auto_567203 ) ) ( not ( = ?auto_567199 ?auto_567204 ) ) ( not ( = ?auto_567199 ?auto_567205 ) ) ( not ( = ?auto_567199 ?auto_567206 ) ) ( not ( = ?auto_567199 ?auto_567207 ) ) ( not ( = ?auto_567199 ?auto_567208 ) ) ( not ( = ?auto_567199 ?auto_567209 ) ) ( not ( = ?auto_567199 ?auto_567210 ) ) ( not ( = ?auto_567200 ?auto_567201 ) ) ( not ( = ?auto_567200 ?auto_567202 ) ) ( not ( = ?auto_567200 ?auto_567203 ) ) ( not ( = ?auto_567200 ?auto_567204 ) ) ( not ( = ?auto_567200 ?auto_567205 ) ) ( not ( = ?auto_567200 ?auto_567206 ) ) ( not ( = ?auto_567200 ?auto_567207 ) ) ( not ( = ?auto_567200 ?auto_567208 ) ) ( not ( = ?auto_567200 ?auto_567209 ) ) ( not ( = ?auto_567200 ?auto_567210 ) ) ( not ( = ?auto_567201 ?auto_567202 ) ) ( not ( = ?auto_567201 ?auto_567203 ) ) ( not ( = ?auto_567201 ?auto_567204 ) ) ( not ( = ?auto_567201 ?auto_567205 ) ) ( not ( = ?auto_567201 ?auto_567206 ) ) ( not ( = ?auto_567201 ?auto_567207 ) ) ( not ( = ?auto_567201 ?auto_567208 ) ) ( not ( = ?auto_567201 ?auto_567209 ) ) ( not ( = ?auto_567201 ?auto_567210 ) ) ( not ( = ?auto_567202 ?auto_567203 ) ) ( not ( = ?auto_567202 ?auto_567204 ) ) ( not ( = ?auto_567202 ?auto_567205 ) ) ( not ( = ?auto_567202 ?auto_567206 ) ) ( not ( = ?auto_567202 ?auto_567207 ) ) ( not ( = ?auto_567202 ?auto_567208 ) ) ( not ( = ?auto_567202 ?auto_567209 ) ) ( not ( = ?auto_567202 ?auto_567210 ) ) ( not ( = ?auto_567203 ?auto_567204 ) ) ( not ( = ?auto_567203 ?auto_567205 ) ) ( not ( = ?auto_567203 ?auto_567206 ) ) ( not ( = ?auto_567203 ?auto_567207 ) ) ( not ( = ?auto_567203 ?auto_567208 ) ) ( not ( = ?auto_567203 ?auto_567209 ) ) ( not ( = ?auto_567203 ?auto_567210 ) ) ( not ( = ?auto_567204 ?auto_567205 ) ) ( not ( = ?auto_567204 ?auto_567206 ) ) ( not ( = ?auto_567204 ?auto_567207 ) ) ( not ( = ?auto_567204 ?auto_567208 ) ) ( not ( = ?auto_567204 ?auto_567209 ) ) ( not ( = ?auto_567204 ?auto_567210 ) ) ( not ( = ?auto_567205 ?auto_567206 ) ) ( not ( = ?auto_567205 ?auto_567207 ) ) ( not ( = ?auto_567205 ?auto_567208 ) ) ( not ( = ?auto_567205 ?auto_567209 ) ) ( not ( = ?auto_567205 ?auto_567210 ) ) ( not ( = ?auto_567206 ?auto_567207 ) ) ( not ( = ?auto_567206 ?auto_567208 ) ) ( not ( = ?auto_567206 ?auto_567209 ) ) ( not ( = ?auto_567206 ?auto_567210 ) ) ( not ( = ?auto_567207 ?auto_567208 ) ) ( not ( = ?auto_567207 ?auto_567209 ) ) ( not ( = ?auto_567207 ?auto_567210 ) ) ( not ( = ?auto_567208 ?auto_567209 ) ) ( not ( = ?auto_567208 ?auto_567210 ) ) ( not ( = ?auto_567209 ?auto_567210 ) ) ( ON ?auto_567208 ?auto_567209 ) ( ON ?auto_567207 ?auto_567208 ) ( ON ?auto_567206 ?auto_567207 ) ( ON ?auto_567205 ?auto_567206 ) ( CLEAR ?auto_567203 ) ( ON ?auto_567204 ?auto_567205 ) ( CLEAR ?auto_567204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_567199 ?auto_567200 ?auto_567201 ?auto_567202 ?auto_567203 ?auto_567204 )
      ( MAKE-11PILE ?auto_567199 ?auto_567200 ?auto_567201 ?auto_567202 ?auto_567203 ?auto_567204 ?auto_567205 ?auto_567206 ?auto_567207 ?auto_567208 ?auto_567209 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_567245 - BLOCK
      ?auto_567246 - BLOCK
      ?auto_567247 - BLOCK
      ?auto_567248 - BLOCK
      ?auto_567249 - BLOCK
      ?auto_567250 - BLOCK
      ?auto_567251 - BLOCK
      ?auto_567252 - BLOCK
      ?auto_567253 - BLOCK
      ?auto_567254 - BLOCK
      ?auto_567255 - BLOCK
    )
    :vars
    (
      ?auto_567256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_567255 ?auto_567256 ) ( ON-TABLE ?auto_567245 ) ( ON ?auto_567246 ?auto_567245 ) ( ON ?auto_567247 ?auto_567246 ) ( ON ?auto_567248 ?auto_567247 ) ( not ( = ?auto_567245 ?auto_567246 ) ) ( not ( = ?auto_567245 ?auto_567247 ) ) ( not ( = ?auto_567245 ?auto_567248 ) ) ( not ( = ?auto_567245 ?auto_567249 ) ) ( not ( = ?auto_567245 ?auto_567250 ) ) ( not ( = ?auto_567245 ?auto_567251 ) ) ( not ( = ?auto_567245 ?auto_567252 ) ) ( not ( = ?auto_567245 ?auto_567253 ) ) ( not ( = ?auto_567245 ?auto_567254 ) ) ( not ( = ?auto_567245 ?auto_567255 ) ) ( not ( = ?auto_567245 ?auto_567256 ) ) ( not ( = ?auto_567246 ?auto_567247 ) ) ( not ( = ?auto_567246 ?auto_567248 ) ) ( not ( = ?auto_567246 ?auto_567249 ) ) ( not ( = ?auto_567246 ?auto_567250 ) ) ( not ( = ?auto_567246 ?auto_567251 ) ) ( not ( = ?auto_567246 ?auto_567252 ) ) ( not ( = ?auto_567246 ?auto_567253 ) ) ( not ( = ?auto_567246 ?auto_567254 ) ) ( not ( = ?auto_567246 ?auto_567255 ) ) ( not ( = ?auto_567246 ?auto_567256 ) ) ( not ( = ?auto_567247 ?auto_567248 ) ) ( not ( = ?auto_567247 ?auto_567249 ) ) ( not ( = ?auto_567247 ?auto_567250 ) ) ( not ( = ?auto_567247 ?auto_567251 ) ) ( not ( = ?auto_567247 ?auto_567252 ) ) ( not ( = ?auto_567247 ?auto_567253 ) ) ( not ( = ?auto_567247 ?auto_567254 ) ) ( not ( = ?auto_567247 ?auto_567255 ) ) ( not ( = ?auto_567247 ?auto_567256 ) ) ( not ( = ?auto_567248 ?auto_567249 ) ) ( not ( = ?auto_567248 ?auto_567250 ) ) ( not ( = ?auto_567248 ?auto_567251 ) ) ( not ( = ?auto_567248 ?auto_567252 ) ) ( not ( = ?auto_567248 ?auto_567253 ) ) ( not ( = ?auto_567248 ?auto_567254 ) ) ( not ( = ?auto_567248 ?auto_567255 ) ) ( not ( = ?auto_567248 ?auto_567256 ) ) ( not ( = ?auto_567249 ?auto_567250 ) ) ( not ( = ?auto_567249 ?auto_567251 ) ) ( not ( = ?auto_567249 ?auto_567252 ) ) ( not ( = ?auto_567249 ?auto_567253 ) ) ( not ( = ?auto_567249 ?auto_567254 ) ) ( not ( = ?auto_567249 ?auto_567255 ) ) ( not ( = ?auto_567249 ?auto_567256 ) ) ( not ( = ?auto_567250 ?auto_567251 ) ) ( not ( = ?auto_567250 ?auto_567252 ) ) ( not ( = ?auto_567250 ?auto_567253 ) ) ( not ( = ?auto_567250 ?auto_567254 ) ) ( not ( = ?auto_567250 ?auto_567255 ) ) ( not ( = ?auto_567250 ?auto_567256 ) ) ( not ( = ?auto_567251 ?auto_567252 ) ) ( not ( = ?auto_567251 ?auto_567253 ) ) ( not ( = ?auto_567251 ?auto_567254 ) ) ( not ( = ?auto_567251 ?auto_567255 ) ) ( not ( = ?auto_567251 ?auto_567256 ) ) ( not ( = ?auto_567252 ?auto_567253 ) ) ( not ( = ?auto_567252 ?auto_567254 ) ) ( not ( = ?auto_567252 ?auto_567255 ) ) ( not ( = ?auto_567252 ?auto_567256 ) ) ( not ( = ?auto_567253 ?auto_567254 ) ) ( not ( = ?auto_567253 ?auto_567255 ) ) ( not ( = ?auto_567253 ?auto_567256 ) ) ( not ( = ?auto_567254 ?auto_567255 ) ) ( not ( = ?auto_567254 ?auto_567256 ) ) ( not ( = ?auto_567255 ?auto_567256 ) ) ( ON ?auto_567254 ?auto_567255 ) ( ON ?auto_567253 ?auto_567254 ) ( ON ?auto_567252 ?auto_567253 ) ( ON ?auto_567251 ?auto_567252 ) ( ON ?auto_567250 ?auto_567251 ) ( CLEAR ?auto_567248 ) ( ON ?auto_567249 ?auto_567250 ) ( CLEAR ?auto_567249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_567245 ?auto_567246 ?auto_567247 ?auto_567248 ?auto_567249 )
      ( MAKE-11PILE ?auto_567245 ?auto_567246 ?auto_567247 ?auto_567248 ?auto_567249 ?auto_567250 ?auto_567251 ?auto_567252 ?auto_567253 ?auto_567254 ?auto_567255 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_567291 - BLOCK
      ?auto_567292 - BLOCK
      ?auto_567293 - BLOCK
      ?auto_567294 - BLOCK
      ?auto_567295 - BLOCK
      ?auto_567296 - BLOCK
      ?auto_567297 - BLOCK
      ?auto_567298 - BLOCK
      ?auto_567299 - BLOCK
      ?auto_567300 - BLOCK
      ?auto_567301 - BLOCK
    )
    :vars
    (
      ?auto_567302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_567301 ?auto_567302 ) ( ON-TABLE ?auto_567291 ) ( ON ?auto_567292 ?auto_567291 ) ( ON ?auto_567293 ?auto_567292 ) ( not ( = ?auto_567291 ?auto_567292 ) ) ( not ( = ?auto_567291 ?auto_567293 ) ) ( not ( = ?auto_567291 ?auto_567294 ) ) ( not ( = ?auto_567291 ?auto_567295 ) ) ( not ( = ?auto_567291 ?auto_567296 ) ) ( not ( = ?auto_567291 ?auto_567297 ) ) ( not ( = ?auto_567291 ?auto_567298 ) ) ( not ( = ?auto_567291 ?auto_567299 ) ) ( not ( = ?auto_567291 ?auto_567300 ) ) ( not ( = ?auto_567291 ?auto_567301 ) ) ( not ( = ?auto_567291 ?auto_567302 ) ) ( not ( = ?auto_567292 ?auto_567293 ) ) ( not ( = ?auto_567292 ?auto_567294 ) ) ( not ( = ?auto_567292 ?auto_567295 ) ) ( not ( = ?auto_567292 ?auto_567296 ) ) ( not ( = ?auto_567292 ?auto_567297 ) ) ( not ( = ?auto_567292 ?auto_567298 ) ) ( not ( = ?auto_567292 ?auto_567299 ) ) ( not ( = ?auto_567292 ?auto_567300 ) ) ( not ( = ?auto_567292 ?auto_567301 ) ) ( not ( = ?auto_567292 ?auto_567302 ) ) ( not ( = ?auto_567293 ?auto_567294 ) ) ( not ( = ?auto_567293 ?auto_567295 ) ) ( not ( = ?auto_567293 ?auto_567296 ) ) ( not ( = ?auto_567293 ?auto_567297 ) ) ( not ( = ?auto_567293 ?auto_567298 ) ) ( not ( = ?auto_567293 ?auto_567299 ) ) ( not ( = ?auto_567293 ?auto_567300 ) ) ( not ( = ?auto_567293 ?auto_567301 ) ) ( not ( = ?auto_567293 ?auto_567302 ) ) ( not ( = ?auto_567294 ?auto_567295 ) ) ( not ( = ?auto_567294 ?auto_567296 ) ) ( not ( = ?auto_567294 ?auto_567297 ) ) ( not ( = ?auto_567294 ?auto_567298 ) ) ( not ( = ?auto_567294 ?auto_567299 ) ) ( not ( = ?auto_567294 ?auto_567300 ) ) ( not ( = ?auto_567294 ?auto_567301 ) ) ( not ( = ?auto_567294 ?auto_567302 ) ) ( not ( = ?auto_567295 ?auto_567296 ) ) ( not ( = ?auto_567295 ?auto_567297 ) ) ( not ( = ?auto_567295 ?auto_567298 ) ) ( not ( = ?auto_567295 ?auto_567299 ) ) ( not ( = ?auto_567295 ?auto_567300 ) ) ( not ( = ?auto_567295 ?auto_567301 ) ) ( not ( = ?auto_567295 ?auto_567302 ) ) ( not ( = ?auto_567296 ?auto_567297 ) ) ( not ( = ?auto_567296 ?auto_567298 ) ) ( not ( = ?auto_567296 ?auto_567299 ) ) ( not ( = ?auto_567296 ?auto_567300 ) ) ( not ( = ?auto_567296 ?auto_567301 ) ) ( not ( = ?auto_567296 ?auto_567302 ) ) ( not ( = ?auto_567297 ?auto_567298 ) ) ( not ( = ?auto_567297 ?auto_567299 ) ) ( not ( = ?auto_567297 ?auto_567300 ) ) ( not ( = ?auto_567297 ?auto_567301 ) ) ( not ( = ?auto_567297 ?auto_567302 ) ) ( not ( = ?auto_567298 ?auto_567299 ) ) ( not ( = ?auto_567298 ?auto_567300 ) ) ( not ( = ?auto_567298 ?auto_567301 ) ) ( not ( = ?auto_567298 ?auto_567302 ) ) ( not ( = ?auto_567299 ?auto_567300 ) ) ( not ( = ?auto_567299 ?auto_567301 ) ) ( not ( = ?auto_567299 ?auto_567302 ) ) ( not ( = ?auto_567300 ?auto_567301 ) ) ( not ( = ?auto_567300 ?auto_567302 ) ) ( not ( = ?auto_567301 ?auto_567302 ) ) ( ON ?auto_567300 ?auto_567301 ) ( ON ?auto_567299 ?auto_567300 ) ( ON ?auto_567298 ?auto_567299 ) ( ON ?auto_567297 ?auto_567298 ) ( ON ?auto_567296 ?auto_567297 ) ( ON ?auto_567295 ?auto_567296 ) ( CLEAR ?auto_567293 ) ( ON ?auto_567294 ?auto_567295 ) ( CLEAR ?auto_567294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_567291 ?auto_567292 ?auto_567293 ?auto_567294 )
      ( MAKE-11PILE ?auto_567291 ?auto_567292 ?auto_567293 ?auto_567294 ?auto_567295 ?auto_567296 ?auto_567297 ?auto_567298 ?auto_567299 ?auto_567300 ?auto_567301 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_567337 - BLOCK
      ?auto_567338 - BLOCK
      ?auto_567339 - BLOCK
      ?auto_567340 - BLOCK
      ?auto_567341 - BLOCK
      ?auto_567342 - BLOCK
      ?auto_567343 - BLOCK
      ?auto_567344 - BLOCK
      ?auto_567345 - BLOCK
      ?auto_567346 - BLOCK
      ?auto_567347 - BLOCK
    )
    :vars
    (
      ?auto_567348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_567347 ?auto_567348 ) ( ON-TABLE ?auto_567337 ) ( ON ?auto_567338 ?auto_567337 ) ( not ( = ?auto_567337 ?auto_567338 ) ) ( not ( = ?auto_567337 ?auto_567339 ) ) ( not ( = ?auto_567337 ?auto_567340 ) ) ( not ( = ?auto_567337 ?auto_567341 ) ) ( not ( = ?auto_567337 ?auto_567342 ) ) ( not ( = ?auto_567337 ?auto_567343 ) ) ( not ( = ?auto_567337 ?auto_567344 ) ) ( not ( = ?auto_567337 ?auto_567345 ) ) ( not ( = ?auto_567337 ?auto_567346 ) ) ( not ( = ?auto_567337 ?auto_567347 ) ) ( not ( = ?auto_567337 ?auto_567348 ) ) ( not ( = ?auto_567338 ?auto_567339 ) ) ( not ( = ?auto_567338 ?auto_567340 ) ) ( not ( = ?auto_567338 ?auto_567341 ) ) ( not ( = ?auto_567338 ?auto_567342 ) ) ( not ( = ?auto_567338 ?auto_567343 ) ) ( not ( = ?auto_567338 ?auto_567344 ) ) ( not ( = ?auto_567338 ?auto_567345 ) ) ( not ( = ?auto_567338 ?auto_567346 ) ) ( not ( = ?auto_567338 ?auto_567347 ) ) ( not ( = ?auto_567338 ?auto_567348 ) ) ( not ( = ?auto_567339 ?auto_567340 ) ) ( not ( = ?auto_567339 ?auto_567341 ) ) ( not ( = ?auto_567339 ?auto_567342 ) ) ( not ( = ?auto_567339 ?auto_567343 ) ) ( not ( = ?auto_567339 ?auto_567344 ) ) ( not ( = ?auto_567339 ?auto_567345 ) ) ( not ( = ?auto_567339 ?auto_567346 ) ) ( not ( = ?auto_567339 ?auto_567347 ) ) ( not ( = ?auto_567339 ?auto_567348 ) ) ( not ( = ?auto_567340 ?auto_567341 ) ) ( not ( = ?auto_567340 ?auto_567342 ) ) ( not ( = ?auto_567340 ?auto_567343 ) ) ( not ( = ?auto_567340 ?auto_567344 ) ) ( not ( = ?auto_567340 ?auto_567345 ) ) ( not ( = ?auto_567340 ?auto_567346 ) ) ( not ( = ?auto_567340 ?auto_567347 ) ) ( not ( = ?auto_567340 ?auto_567348 ) ) ( not ( = ?auto_567341 ?auto_567342 ) ) ( not ( = ?auto_567341 ?auto_567343 ) ) ( not ( = ?auto_567341 ?auto_567344 ) ) ( not ( = ?auto_567341 ?auto_567345 ) ) ( not ( = ?auto_567341 ?auto_567346 ) ) ( not ( = ?auto_567341 ?auto_567347 ) ) ( not ( = ?auto_567341 ?auto_567348 ) ) ( not ( = ?auto_567342 ?auto_567343 ) ) ( not ( = ?auto_567342 ?auto_567344 ) ) ( not ( = ?auto_567342 ?auto_567345 ) ) ( not ( = ?auto_567342 ?auto_567346 ) ) ( not ( = ?auto_567342 ?auto_567347 ) ) ( not ( = ?auto_567342 ?auto_567348 ) ) ( not ( = ?auto_567343 ?auto_567344 ) ) ( not ( = ?auto_567343 ?auto_567345 ) ) ( not ( = ?auto_567343 ?auto_567346 ) ) ( not ( = ?auto_567343 ?auto_567347 ) ) ( not ( = ?auto_567343 ?auto_567348 ) ) ( not ( = ?auto_567344 ?auto_567345 ) ) ( not ( = ?auto_567344 ?auto_567346 ) ) ( not ( = ?auto_567344 ?auto_567347 ) ) ( not ( = ?auto_567344 ?auto_567348 ) ) ( not ( = ?auto_567345 ?auto_567346 ) ) ( not ( = ?auto_567345 ?auto_567347 ) ) ( not ( = ?auto_567345 ?auto_567348 ) ) ( not ( = ?auto_567346 ?auto_567347 ) ) ( not ( = ?auto_567346 ?auto_567348 ) ) ( not ( = ?auto_567347 ?auto_567348 ) ) ( ON ?auto_567346 ?auto_567347 ) ( ON ?auto_567345 ?auto_567346 ) ( ON ?auto_567344 ?auto_567345 ) ( ON ?auto_567343 ?auto_567344 ) ( ON ?auto_567342 ?auto_567343 ) ( ON ?auto_567341 ?auto_567342 ) ( ON ?auto_567340 ?auto_567341 ) ( CLEAR ?auto_567338 ) ( ON ?auto_567339 ?auto_567340 ) ( CLEAR ?auto_567339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_567337 ?auto_567338 ?auto_567339 )
      ( MAKE-11PILE ?auto_567337 ?auto_567338 ?auto_567339 ?auto_567340 ?auto_567341 ?auto_567342 ?auto_567343 ?auto_567344 ?auto_567345 ?auto_567346 ?auto_567347 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_567383 - BLOCK
      ?auto_567384 - BLOCK
      ?auto_567385 - BLOCK
      ?auto_567386 - BLOCK
      ?auto_567387 - BLOCK
      ?auto_567388 - BLOCK
      ?auto_567389 - BLOCK
      ?auto_567390 - BLOCK
      ?auto_567391 - BLOCK
      ?auto_567392 - BLOCK
      ?auto_567393 - BLOCK
    )
    :vars
    (
      ?auto_567394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_567393 ?auto_567394 ) ( ON-TABLE ?auto_567383 ) ( not ( = ?auto_567383 ?auto_567384 ) ) ( not ( = ?auto_567383 ?auto_567385 ) ) ( not ( = ?auto_567383 ?auto_567386 ) ) ( not ( = ?auto_567383 ?auto_567387 ) ) ( not ( = ?auto_567383 ?auto_567388 ) ) ( not ( = ?auto_567383 ?auto_567389 ) ) ( not ( = ?auto_567383 ?auto_567390 ) ) ( not ( = ?auto_567383 ?auto_567391 ) ) ( not ( = ?auto_567383 ?auto_567392 ) ) ( not ( = ?auto_567383 ?auto_567393 ) ) ( not ( = ?auto_567383 ?auto_567394 ) ) ( not ( = ?auto_567384 ?auto_567385 ) ) ( not ( = ?auto_567384 ?auto_567386 ) ) ( not ( = ?auto_567384 ?auto_567387 ) ) ( not ( = ?auto_567384 ?auto_567388 ) ) ( not ( = ?auto_567384 ?auto_567389 ) ) ( not ( = ?auto_567384 ?auto_567390 ) ) ( not ( = ?auto_567384 ?auto_567391 ) ) ( not ( = ?auto_567384 ?auto_567392 ) ) ( not ( = ?auto_567384 ?auto_567393 ) ) ( not ( = ?auto_567384 ?auto_567394 ) ) ( not ( = ?auto_567385 ?auto_567386 ) ) ( not ( = ?auto_567385 ?auto_567387 ) ) ( not ( = ?auto_567385 ?auto_567388 ) ) ( not ( = ?auto_567385 ?auto_567389 ) ) ( not ( = ?auto_567385 ?auto_567390 ) ) ( not ( = ?auto_567385 ?auto_567391 ) ) ( not ( = ?auto_567385 ?auto_567392 ) ) ( not ( = ?auto_567385 ?auto_567393 ) ) ( not ( = ?auto_567385 ?auto_567394 ) ) ( not ( = ?auto_567386 ?auto_567387 ) ) ( not ( = ?auto_567386 ?auto_567388 ) ) ( not ( = ?auto_567386 ?auto_567389 ) ) ( not ( = ?auto_567386 ?auto_567390 ) ) ( not ( = ?auto_567386 ?auto_567391 ) ) ( not ( = ?auto_567386 ?auto_567392 ) ) ( not ( = ?auto_567386 ?auto_567393 ) ) ( not ( = ?auto_567386 ?auto_567394 ) ) ( not ( = ?auto_567387 ?auto_567388 ) ) ( not ( = ?auto_567387 ?auto_567389 ) ) ( not ( = ?auto_567387 ?auto_567390 ) ) ( not ( = ?auto_567387 ?auto_567391 ) ) ( not ( = ?auto_567387 ?auto_567392 ) ) ( not ( = ?auto_567387 ?auto_567393 ) ) ( not ( = ?auto_567387 ?auto_567394 ) ) ( not ( = ?auto_567388 ?auto_567389 ) ) ( not ( = ?auto_567388 ?auto_567390 ) ) ( not ( = ?auto_567388 ?auto_567391 ) ) ( not ( = ?auto_567388 ?auto_567392 ) ) ( not ( = ?auto_567388 ?auto_567393 ) ) ( not ( = ?auto_567388 ?auto_567394 ) ) ( not ( = ?auto_567389 ?auto_567390 ) ) ( not ( = ?auto_567389 ?auto_567391 ) ) ( not ( = ?auto_567389 ?auto_567392 ) ) ( not ( = ?auto_567389 ?auto_567393 ) ) ( not ( = ?auto_567389 ?auto_567394 ) ) ( not ( = ?auto_567390 ?auto_567391 ) ) ( not ( = ?auto_567390 ?auto_567392 ) ) ( not ( = ?auto_567390 ?auto_567393 ) ) ( not ( = ?auto_567390 ?auto_567394 ) ) ( not ( = ?auto_567391 ?auto_567392 ) ) ( not ( = ?auto_567391 ?auto_567393 ) ) ( not ( = ?auto_567391 ?auto_567394 ) ) ( not ( = ?auto_567392 ?auto_567393 ) ) ( not ( = ?auto_567392 ?auto_567394 ) ) ( not ( = ?auto_567393 ?auto_567394 ) ) ( ON ?auto_567392 ?auto_567393 ) ( ON ?auto_567391 ?auto_567392 ) ( ON ?auto_567390 ?auto_567391 ) ( ON ?auto_567389 ?auto_567390 ) ( ON ?auto_567388 ?auto_567389 ) ( ON ?auto_567387 ?auto_567388 ) ( ON ?auto_567386 ?auto_567387 ) ( ON ?auto_567385 ?auto_567386 ) ( CLEAR ?auto_567383 ) ( ON ?auto_567384 ?auto_567385 ) ( CLEAR ?auto_567384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_567383 ?auto_567384 )
      ( MAKE-11PILE ?auto_567383 ?auto_567384 ?auto_567385 ?auto_567386 ?auto_567387 ?auto_567388 ?auto_567389 ?auto_567390 ?auto_567391 ?auto_567392 ?auto_567393 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_567429 - BLOCK
      ?auto_567430 - BLOCK
      ?auto_567431 - BLOCK
      ?auto_567432 - BLOCK
      ?auto_567433 - BLOCK
      ?auto_567434 - BLOCK
      ?auto_567435 - BLOCK
      ?auto_567436 - BLOCK
      ?auto_567437 - BLOCK
      ?auto_567438 - BLOCK
      ?auto_567439 - BLOCK
    )
    :vars
    (
      ?auto_567440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_567439 ?auto_567440 ) ( not ( = ?auto_567429 ?auto_567430 ) ) ( not ( = ?auto_567429 ?auto_567431 ) ) ( not ( = ?auto_567429 ?auto_567432 ) ) ( not ( = ?auto_567429 ?auto_567433 ) ) ( not ( = ?auto_567429 ?auto_567434 ) ) ( not ( = ?auto_567429 ?auto_567435 ) ) ( not ( = ?auto_567429 ?auto_567436 ) ) ( not ( = ?auto_567429 ?auto_567437 ) ) ( not ( = ?auto_567429 ?auto_567438 ) ) ( not ( = ?auto_567429 ?auto_567439 ) ) ( not ( = ?auto_567429 ?auto_567440 ) ) ( not ( = ?auto_567430 ?auto_567431 ) ) ( not ( = ?auto_567430 ?auto_567432 ) ) ( not ( = ?auto_567430 ?auto_567433 ) ) ( not ( = ?auto_567430 ?auto_567434 ) ) ( not ( = ?auto_567430 ?auto_567435 ) ) ( not ( = ?auto_567430 ?auto_567436 ) ) ( not ( = ?auto_567430 ?auto_567437 ) ) ( not ( = ?auto_567430 ?auto_567438 ) ) ( not ( = ?auto_567430 ?auto_567439 ) ) ( not ( = ?auto_567430 ?auto_567440 ) ) ( not ( = ?auto_567431 ?auto_567432 ) ) ( not ( = ?auto_567431 ?auto_567433 ) ) ( not ( = ?auto_567431 ?auto_567434 ) ) ( not ( = ?auto_567431 ?auto_567435 ) ) ( not ( = ?auto_567431 ?auto_567436 ) ) ( not ( = ?auto_567431 ?auto_567437 ) ) ( not ( = ?auto_567431 ?auto_567438 ) ) ( not ( = ?auto_567431 ?auto_567439 ) ) ( not ( = ?auto_567431 ?auto_567440 ) ) ( not ( = ?auto_567432 ?auto_567433 ) ) ( not ( = ?auto_567432 ?auto_567434 ) ) ( not ( = ?auto_567432 ?auto_567435 ) ) ( not ( = ?auto_567432 ?auto_567436 ) ) ( not ( = ?auto_567432 ?auto_567437 ) ) ( not ( = ?auto_567432 ?auto_567438 ) ) ( not ( = ?auto_567432 ?auto_567439 ) ) ( not ( = ?auto_567432 ?auto_567440 ) ) ( not ( = ?auto_567433 ?auto_567434 ) ) ( not ( = ?auto_567433 ?auto_567435 ) ) ( not ( = ?auto_567433 ?auto_567436 ) ) ( not ( = ?auto_567433 ?auto_567437 ) ) ( not ( = ?auto_567433 ?auto_567438 ) ) ( not ( = ?auto_567433 ?auto_567439 ) ) ( not ( = ?auto_567433 ?auto_567440 ) ) ( not ( = ?auto_567434 ?auto_567435 ) ) ( not ( = ?auto_567434 ?auto_567436 ) ) ( not ( = ?auto_567434 ?auto_567437 ) ) ( not ( = ?auto_567434 ?auto_567438 ) ) ( not ( = ?auto_567434 ?auto_567439 ) ) ( not ( = ?auto_567434 ?auto_567440 ) ) ( not ( = ?auto_567435 ?auto_567436 ) ) ( not ( = ?auto_567435 ?auto_567437 ) ) ( not ( = ?auto_567435 ?auto_567438 ) ) ( not ( = ?auto_567435 ?auto_567439 ) ) ( not ( = ?auto_567435 ?auto_567440 ) ) ( not ( = ?auto_567436 ?auto_567437 ) ) ( not ( = ?auto_567436 ?auto_567438 ) ) ( not ( = ?auto_567436 ?auto_567439 ) ) ( not ( = ?auto_567436 ?auto_567440 ) ) ( not ( = ?auto_567437 ?auto_567438 ) ) ( not ( = ?auto_567437 ?auto_567439 ) ) ( not ( = ?auto_567437 ?auto_567440 ) ) ( not ( = ?auto_567438 ?auto_567439 ) ) ( not ( = ?auto_567438 ?auto_567440 ) ) ( not ( = ?auto_567439 ?auto_567440 ) ) ( ON ?auto_567438 ?auto_567439 ) ( ON ?auto_567437 ?auto_567438 ) ( ON ?auto_567436 ?auto_567437 ) ( ON ?auto_567435 ?auto_567436 ) ( ON ?auto_567434 ?auto_567435 ) ( ON ?auto_567433 ?auto_567434 ) ( ON ?auto_567432 ?auto_567433 ) ( ON ?auto_567431 ?auto_567432 ) ( ON ?auto_567430 ?auto_567431 ) ( ON ?auto_567429 ?auto_567430 ) ( CLEAR ?auto_567429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_567429 )
      ( MAKE-11PILE ?auto_567429 ?auto_567430 ?auto_567431 ?auto_567432 ?auto_567433 ?auto_567434 ?auto_567435 ?auto_567436 ?auto_567437 ?auto_567438 ?auto_567439 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_567476 - BLOCK
      ?auto_567477 - BLOCK
      ?auto_567478 - BLOCK
      ?auto_567479 - BLOCK
      ?auto_567480 - BLOCK
      ?auto_567481 - BLOCK
      ?auto_567482 - BLOCK
      ?auto_567483 - BLOCK
      ?auto_567484 - BLOCK
      ?auto_567485 - BLOCK
      ?auto_567486 - BLOCK
      ?auto_567487 - BLOCK
    )
    :vars
    (
      ?auto_567488 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_567486 ) ( ON ?auto_567487 ?auto_567488 ) ( CLEAR ?auto_567487 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_567476 ) ( ON ?auto_567477 ?auto_567476 ) ( ON ?auto_567478 ?auto_567477 ) ( ON ?auto_567479 ?auto_567478 ) ( ON ?auto_567480 ?auto_567479 ) ( ON ?auto_567481 ?auto_567480 ) ( ON ?auto_567482 ?auto_567481 ) ( ON ?auto_567483 ?auto_567482 ) ( ON ?auto_567484 ?auto_567483 ) ( ON ?auto_567485 ?auto_567484 ) ( ON ?auto_567486 ?auto_567485 ) ( not ( = ?auto_567476 ?auto_567477 ) ) ( not ( = ?auto_567476 ?auto_567478 ) ) ( not ( = ?auto_567476 ?auto_567479 ) ) ( not ( = ?auto_567476 ?auto_567480 ) ) ( not ( = ?auto_567476 ?auto_567481 ) ) ( not ( = ?auto_567476 ?auto_567482 ) ) ( not ( = ?auto_567476 ?auto_567483 ) ) ( not ( = ?auto_567476 ?auto_567484 ) ) ( not ( = ?auto_567476 ?auto_567485 ) ) ( not ( = ?auto_567476 ?auto_567486 ) ) ( not ( = ?auto_567476 ?auto_567487 ) ) ( not ( = ?auto_567476 ?auto_567488 ) ) ( not ( = ?auto_567477 ?auto_567478 ) ) ( not ( = ?auto_567477 ?auto_567479 ) ) ( not ( = ?auto_567477 ?auto_567480 ) ) ( not ( = ?auto_567477 ?auto_567481 ) ) ( not ( = ?auto_567477 ?auto_567482 ) ) ( not ( = ?auto_567477 ?auto_567483 ) ) ( not ( = ?auto_567477 ?auto_567484 ) ) ( not ( = ?auto_567477 ?auto_567485 ) ) ( not ( = ?auto_567477 ?auto_567486 ) ) ( not ( = ?auto_567477 ?auto_567487 ) ) ( not ( = ?auto_567477 ?auto_567488 ) ) ( not ( = ?auto_567478 ?auto_567479 ) ) ( not ( = ?auto_567478 ?auto_567480 ) ) ( not ( = ?auto_567478 ?auto_567481 ) ) ( not ( = ?auto_567478 ?auto_567482 ) ) ( not ( = ?auto_567478 ?auto_567483 ) ) ( not ( = ?auto_567478 ?auto_567484 ) ) ( not ( = ?auto_567478 ?auto_567485 ) ) ( not ( = ?auto_567478 ?auto_567486 ) ) ( not ( = ?auto_567478 ?auto_567487 ) ) ( not ( = ?auto_567478 ?auto_567488 ) ) ( not ( = ?auto_567479 ?auto_567480 ) ) ( not ( = ?auto_567479 ?auto_567481 ) ) ( not ( = ?auto_567479 ?auto_567482 ) ) ( not ( = ?auto_567479 ?auto_567483 ) ) ( not ( = ?auto_567479 ?auto_567484 ) ) ( not ( = ?auto_567479 ?auto_567485 ) ) ( not ( = ?auto_567479 ?auto_567486 ) ) ( not ( = ?auto_567479 ?auto_567487 ) ) ( not ( = ?auto_567479 ?auto_567488 ) ) ( not ( = ?auto_567480 ?auto_567481 ) ) ( not ( = ?auto_567480 ?auto_567482 ) ) ( not ( = ?auto_567480 ?auto_567483 ) ) ( not ( = ?auto_567480 ?auto_567484 ) ) ( not ( = ?auto_567480 ?auto_567485 ) ) ( not ( = ?auto_567480 ?auto_567486 ) ) ( not ( = ?auto_567480 ?auto_567487 ) ) ( not ( = ?auto_567480 ?auto_567488 ) ) ( not ( = ?auto_567481 ?auto_567482 ) ) ( not ( = ?auto_567481 ?auto_567483 ) ) ( not ( = ?auto_567481 ?auto_567484 ) ) ( not ( = ?auto_567481 ?auto_567485 ) ) ( not ( = ?auto_567481 ?auto_567486 ) ) ( not ( = ?auto_567481 ?auto_567487 ) ) ( not ( = ?auto_567481 ?auto_567488 ) ) ( not ( = ?auto_567482 ?auto_567483 ) ) ( not ( = ?auto_567482 ?auto_567484 ) ) ( not ( = ?auto_567482 ?auto_567485 ) ) ( not ( = ?auto_567482 ?auto_567486 ) ) ( not ( = ?auto_567482 ?auto_567487 ) ) ( not ( = ?auto_567482 ?auto_567488 ) ) ( not ( = ?auto_567483 ?auto_567484 ) ) ( not ( = ?auto_567483 ?auto_567485 ) ) ( not ( = ?auto_567483 ?auto_567486 ) ) ( not ( = ?auto_567483 ?auto_567487 ) ) ( not ( = ?auto_567483 ?auto_567488 ) ) ( not ( = ?auto_567484 ?auto_567485 ) ) ( not ( = ?auto_567484 ?auto_567486 ) ) ( not ( = ?auto_567484 ?auto_567487 ) ) ( not ( = ?auto_567484 ?auto_567488 ) ) ( not ( = ?auto_567485 ?auto_567486 ) ) ( not ( = ?auto_567485 ?auto_567487 ) ) ( not ( = ?auto_567485 ?auto_567488 ) ) ( not ( = ?auto_567486 ?auto_567487 ) ) ( not ( = ?auto_567486 ?auto_567488 ) ) ( not ( = ?auto_567487 ?auto_567488 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_567487 ?auto_567488 )
      ( !STACK ?auto_567487 ?auto_567486 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_567526 - BLOCK
      ?auto_567527 - BLOCK
      ?auto_567528 - BLOCK
      ?auto_567529 - BLOCK
      ?auto_567530 - BLOCK
      ?auto_567531 - BLOCK
      ?auto_567532 - BLOCK
      ?auto_567533 - BLOCK
      ?auto_567534 - BLOCK
      ?auto_567535 - BLOCK
      ?auto_567536 - BLOCK
      ?auto_567537 - BLOCK
    )
    :vars
    (
      ?auto_567538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_567537 ?auto_567538 ) ( ON-TABLE ?auto_567526 ) ( ON ?auto_567527 ?auto_567526 ) ( ON ?auto_567528 ?auto_567527 ) ( ON ?auto_567529 ?auto_567528 ) ( ON ?auto_567530 ?auto_567529 ) ( ON ?auto_567531 ?auto_567530 ) ( ON ?auto_567532 ?auto_567531 ) ( ON ?auto_567533 ?auto_567532 ) ( ON ?auto_567534 ?auto_567533 ) ( ON ?auto_567535 ?auto_567534 ) ( not ( = ?auto_567526 ?auto_567527 ) ) ( not ( = ?auto_567526 ?auto_567528 ) ) ( not ( = ?auto_567526 ?auto_567529 ) ) ( not ( = ?auto_567526 ?auto_567530 ) ) ( not ( = ?auto_567526 ?auto_567531 ) ) ( not ( = ?auto_567526 ?auto_567532 ) ) ( not ( = ?auto_567526 ?auto_567533 ) ) ( not ( = ?auto_567526 ?auto_567534 ) ) ( not ( = ?auto_567526 ?auto_567535 ) ) ( not ( = ?auto_567526 ?auto_567536 ) ) ( not ( = ?auto_567526 ?auto_567537 ) ) ( not ( = ?auto_567526 ?auto_567538 ) ) ( not ( = ?auto_567527 ?auto_567528 ) ) ( not ( = ?auto_567527 ?auto_567529 ) ) ( not ( = ?auto_567527 ?auto_567530 ) ) ( not ( = ?auto_567527 ?auto_567531 ) ) ( not ( = ?auto_567527 ?auto_567532 ) ) ( not ( = ?auto_567527 ?auto_567533 ) ) ( not ( = ?auto_567527 ?auto_567534 ) ) ( not ( = ?auto_567527 ?auto_567535 ) ) ( not ( = ?auto_567527 ?auto_567536 ) ) ( not ( = ?auto_567527 ?auto_567537 ) ) ( not ( = ?auto_567527 ?auto_567538 ) ) ( not ( = ?auto_567528 ?auto_567529 ) ) ( not ( = ?auto_567528 ?auto_567530 ) ) ( not ( = ?auto_567528 ?auto_567531 ) ) ( not ( = ?auto_567528 ?auto_567532 ) ) ( not ( = ?auto_567528 ?auto_567533 ) ) ( not ( = ?auto_567528 ?auto_567534 ) ) ( not ( = ?auto_567528 ?auto_567535 ) ) ( not ( = ?auto_567528 ?auto_567536 ) ) ( not ( = ?auto_567528 ?auto_567537 ) ) ( not ( = ?auto_567528 ?auto_567538 ) ) ( not ( = ?auto_567529 ?auto_567530 ) ) ( not ( = ?auto_567529 ?auto_567531 ) ) ( not ( = ?auto_567529 ?auto_567532 ) ) ( not ( = ?auto_567529 ?auto_567533 ) ) ( not ( = ?auto_567529 ?auto_567534 ) ) ( not ( = ?auto_567529 ?auto_567535 ) ) ( not ( = ?auto_567529 ?auto_567536 ) ) ( not ( = ?auto_567529 ?auto_567537 ) ) ( not ( = ?auto_567529 ?auto_567538 ) ) ( not ( = ?auto_567530 ?auto_567531 ) ) ( not ( = ?auto_567530 ?auto_567532 ) ) ( not ( = ?auto_567530 ?auto_567533 ) ) ( not ( = ?auto_567530 ?auto_567534 ) ) ( not ( = ?auto_567530 ?auto_567535 ) ) ( not ( = ?auto_567530 ?auto_567536 ) ) ( not ( = ?auto_567530 ?auto_567537 ) ) ( not ( = ?auto_567530 ?auto_567538 ) ) ( not ( = ?auto_567531 ?auto_567532 ) ) ( not ( = ?auto_567531 ?auto_567533 ) ) ( not ( = ?auto_567531 ?auto_567534 ) ) ( not ( = ?auto_567531 ?auto_567535 ) ) ( not ( = ?auto_567531 ?auto_567536 ) ) ( not ( = ?auto_567531 ?auto_567537 ) ) ( not ( = ?auto_567531 ?auto_567538 ) ) ( not ( = ?auto_567532 ?auto_567533 ) ) ( not ( = ?auto_567532 ?auto_567534 ) ) ( not ( = ?auto_567532 ?auto_567535 ) ) ( not ( = ?auto_567532 ?auto_567536 ) ) ( not ( = ?auto_567532 ?auto_567537 ) ) ( not ( = ?auto_567532 ?auto_567538 ) ) ( not ( = ?auto_567533 ?auto_567534 ) ) ( not ( = ?auto_567533 ?auto_567535 ) ) ( not ( = ?auto_567533 ?auto_567536 ) ) ( not ( = ?auto_567533 ?auto_567537 ) ) ( not ( = ?auto_567533 ?auto_567538 ) ) ( not ( = ?auto_567534 ?auto_567535 ) ) ( not ( = ?auto_567534 ?auto_567536 ) ) ( not ( = ?auto_567534 ?auto_567537 ) ) ( not ( = ?auto_567534 ?auto_567538 ) ) ( not ( = ?auto_567535 ?auto_567536 ) ) ( not ( = ?auto_567535 ?auto_567537 ) ) ( not ( = ?auto_567535 ?auto_567538 ) ) ( not ( = ?auto_567536 ?auto_567537 ) ) ( not ( = ?auto_567536 ?auto_567538 ) ) ( not ( = ?auto_567537 ?auto_567538 ) ) ( CLEAR ?auto_567535 ) ( ON ?auto_567536 ?auto_567537 ) ( CLEAR ?auto_567536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_567526 ?auto_567527 ?auto_567528 ?auto_567529 ?auto_567530 ?auto_567531 ?auto_567532 ?auto_567533 ?auto_567534 ?auto_567535 ?auto_567536 )
      ( MAKE-12PILE ?auto_567526 ?auto_567527 ?auto_567528 ?auto_567529 ?auto_567530 ?auto_567531 ?auto_567532 ?auto_567533 ?auto_567534 ?auto_567535 ?auto_567536 ?auto_567537 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_567576 - BLOCK
      ?auto_567577 - BLOCK
      ?auto_567578 - BLOCK
      ?auto_567579 - BLOCK
      ?auto_567580 - BLOCK
      ?auto_567581 - BLOCK
      ?auto_567582 - BLOCK
      ?auto_567583 - BLOCK
      ?auto_567584 - BLOCK
      ?auto_567585 - BLOCK
      ?auto_567586 - BLOCK
      ?auto_567587 - BLOCK
    )
    :vars
    (
      ?auto_567588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_567587 ?auto_567588 ) ( ON-TABLE ?auto_567576 ) ( ON ?auto_567577 ?auto_567576 ) ( ON ?auto_567578 ?auto_567577 ) ( ON ?auto_567579 ?auto_567578 ) ( ON ?auto_567580 ?auto_567579 ) ( ON ?auto_567581 ?auto_567580 ) ( ON ?auto_567582 ?auto_567581 ) ( ON ?auto_567583 ?auto_567582 ) ( ON ?auto_567584 ?auto_567583 ) ( not ( = ?auto_567576 ?auto_567577 ) ) ( not ( = ?auto_567576 ?auto_567578 ) ) ( not ( = ?auto_567576 ?auto_567579 ) ) ( not ( = ?auto_567576 ?auto_567580 ) ) ( not ( = ?auto_567576 ?auto_567581 ) ) ( not ( = ?auto_567576 ?auto_567582 ) ) ( not ( = ?auto_567576 ?auto_567583 ) ) ( not ( = ?auto_567576 ?auto_567584 ) ) ( not ( = ?auto_567576 ?auto_567585 ) ) ( not ( = ?auto_567576 ?auto_567586 ) ) ( not ( = ?auto_567576 ?auto_567587 ) ) ( not ( = ?auto_567576 ?auto_567588 ) ) ( not ( = ?auto_567577 ?auto_567578 ) ) ( not ( = ?auto_567577 ?auto_567579 ) ) ( not ( = ?auto_567577 ?auto_567580 ) ) ( not ( = ?auto_567577 ?auto_567581 ) ) ( not ( = ?auto_567577 ?auto_567582 ) ) ( not ( = ?auto_567577 ?auto_567583 ) ) ( not ( = ?auto_567577 ?auto_567584 ) ) ( not ( = ?auto_567577 ?auto_567585 ) ) ( not ( = ?auto_567577 ?auto_567586 ) ) ( not ( = ?auto_567577 ?auto_567587 ) ) ( not ( = ?auto_567577 ?auto_567588 ) ) ( not ( = ?auto_567578 ?auto_567579 ) ) ( not ( = ?auto_567578 ?auto_567580 ) ) ( not ( = ?auto_567578 ?auto_567581 ) ) ( not ( = ?auto_567578 ?auto_567582 ) ) ( not ( = ?auto_567578 ?auto_567583 ) ) ( not ( = ?auto_567578 ?auto_567584 ) ) ( not ( = ?auto_567578 ?auto_567585 ) ) ( not ( = ?auto_567578 ?auto_567586 ) ) ( not ( = ?auto_567578 ?auto_567587 ) ) ( not ( = ?auto_567578 ?auto_567588 ) ) ( not ( = ?auto_567579 ?auto_567580 ) ) ( not ( = ?auto_567579 ?auto_567581 ) ) ( not ( = ?auto_567579 ?auto_567582 ) ) ( not ( = ?auto_567579 ?auto_567583 ) ) ( not ( = ?auto_567579 ?auto_567584 ) ) ( not ( = ?auto_567579 ?auto_567585 ) ) ( not ( = ?auto_567579 ?auto_567586 ) ) ( not ( = ?auto_567579 ?auto_567587 ) ) ( not ( = ?auto_567579 ?auto_567588 ) ) ( not ( = ?auto_567580 ?auto_567581 ) ) ( not ( = ?auto_567580 ?auto_567582 ) ) ( not ( = ?auto_567580 ?auto_567583 ) ) ( not ( = ?auto_567580 ?auto_567584 ) ) ( not ( = ?auto_567580 ?auto_567585 ) ) ( not ( = ?auto_567580 ?auto_567586 ) ) ( not ( = ?auto_567580 ?auto_567587 ) ) ( not ( = ?auto_567580 ?auto_567588 ) ) ( not ( = ?auto_567581 ?auto_567582 ) ) ( not ( = ?auto_567581 ?auto_567583 ) ) ( not ( = ?auto_567581 ?auto_567584 ) ) ( not ( = ?auto_567581 ?auto_567585 ) ) ( not ( = ?auto_567581 ?auto_567586 ) ) ( not ( = ?auto_567581 ?auto_567587 ) ) ( not ( = ?auto_567581 ?auto_567588 ) ) ( not ( = ?auto_567582 ?auto_567583 ) ) ( not ( = ?auto_567582 ?auto_567584 ) ) ( not ( = ?auto_567582 ?auto_567585 ) ) ( not ( = ?auto_567582 ?auto_567586 ) ) ( not ( = ?auto_567582 ?auto_567587 ) ) ( not ( = ?auto_567582 ?auto_567588 ) ) ( not ( = ?auto_567583 ?auto_567584 ) ) ( not ( = ?auto_567583 ?auto_567585 ) ) ( not ( = ?auto_567583 ?auto_567586 ) ) ( not ( = ?auto_567583 ?auto_567587 ) ) ( not ( = ?auto_567583 ?auto_567588 ) ) ( not ( = ?auto_567584 ?auto_567585 ) ) ( not ( = ?auto_567584 ?auto_567586 ) ) ( not ( = ?auto_567584 ?auto_567587 ) ) ( not ( = ?auto_567584 ?auto_567588 ) ) ( not ( = ?auto_567585 ?auto_567586 ) ) ( not ( = ?auto_567585 ?auto_567587 ) ) ( not ( = ?auto_567585 ?auto_567588 ) ) ( not ( = ?auto_567586 ?auto_567587 ) ) ( not ( = ?auto_567586 ?auto_567588 ) ) ( not ( = ?auto_567587 ?auto_567588 ) ) ( ON ?auto_567586 ?auto_567587 ) ( CLEAR ?auto_567584 ) ( ON ?auto_567585 ?auto_567586 ) ( CLEAR ?auto_567585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_567576 ?auto_567577 ?auto_567578 ?auto_567579 ?auto_567580 ?auto_567581 ?auto_567582 ?auto_567583 ?auto_567584 ?auto_567585 )
      ( MAKE-12PILE ?auto_567576 ?auto_567577 ?auto_567578 ?auto_567579 ?auto_567580 ?auto_567581 ?auto_567582 ?auto_567583 ?auto_567584 ?auto_567585 ?auto_567586 ?auto_567587 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_567626 - BLOCK
      ?auto_567627 - BLOCK
      ?auto_567628 - BLOCK
      ?auto_567629 - BLOCK
      ?auto_567630 - BLOCK
      ?auto_567631 - BLOCK
      ?auto_567632 - BLOCK
      ?auto_567633 - BLOCK
      ?auto_567634 - BLOCK
      ?auto_567635 - BLOCK
      ?auto_567636 - BLOCK
      ?auto_567637 - BLOCK
    )
    :vars
    (
      ?auto_567638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_567637 ?auto_567638 ) ( ON-TABLE ?auto_567626 ) ( ON ?auto_567627 ?auto_567626 ) ( ON ?auto_567628 ?auto_567627 ) ( ON ?auto_567629 ?auto_567628 ) ( ON ?auto_567630 ?auto_567629 ) ( ON ?auto_567631 ?auto_567630 ) ( ON ?auto_567632 ?auto_567631 ) ( ON ?auto_567633 ?auto_567632 ) ( not ( = ?auto_567626 ?auto_567627 ) ) ( not ( = ?auto_567626 ?auto_567628 ) ) ( not ( = ?auto_567626 ?auto_567629 ) ) ( not ( = ?auto_567626 ?auto_567630 ) ) ( not ( = ?auto_567626 ?auto_567631 ) ) ( not ( = ?auto_567626 ?auto_567632 ) ) ( not ( = ?auto_567626 ?auto_567633 ) ) ( not ( = ?auto_567626 ?auto_567634 ) ) ( not ( = ?auto_567626 ?auto_567635 ) ) ( not ( = ?auto_567626 ?auto_567636 ) ) ( not ( = ?auto_567626 ?auto_567637 ) ) ( not ( = ?auto_567626 ?auto_567638 ) ) ( not ( = ?auto_567627 ?auto_567628 ) ) ( not ( = ?auto_567627 ?auto_567629 ) ) ( not ( = ?auto_567627 ?auto_567630 ) ) ( not ( = ?auto_567627 ?auto_567631 ) ) ( not ( = ?auto_567627 ?auto_567632 ) ) ( not ( = ?auto_567627 ?auto_567633 ) ) ( not ( = ?auto_567627 ?auto_567634 ) ) ( not ( = ?auto_567627 ?auto_567635 ) ) ( not ( = ?auto_567627 ?auto_567636 ) ) ( not ( = ?auto_567627 ?auto_567637 ) ) ( not ( = ?auto_567627 ?auto_567638 ) ) ( not ( = ?auto_567628 ?auto_567629 ) ) ( not ( = ?auto_567628 ?auto_567630 ) ) ( not ( = ?auto_567628 ?auto_567631 ) ) ( not ( = ?auto_567628 ?auto_567632 ) ) ( not ( = ?auto_567628 ?auto_567633 ) ) ( not ( = ?auto_567628 ?auto_567634 ) ) ( not ( = ?auto_567628 ?auto_567635 ) ) ( not ( = ?auto_567628 ?auto_567636 ) ) ( not ( = ?auto_567628 ?auto_567637 ) ) ( not ( = ?auto_567628 ?auto_567638 ) ) ( not ( = ?auto_567629 ?auto_567630 ) ) ( not ( = ?auto_567629 ?auto_567631 ) ) ( not ( = ?auto_567629 ?auto_567632 ) ) ( not ( = ?auto_567629 ?auto_567633 ) ) ( not ( = ?auto_567629 ?auto_567634 ) ) ( not ( = ?auto_567629 ?auto_567635 ) ) ( not ( = ?auto_567629 ?auto_567636 ) ) ( not ( = ?auto_567629 ?auto_567637 ) ) ( not ( = ?auto_567629 ?auto_567638 ) ) ( not ( = ?auto_567630 ?auto_567631 ) ) ( not ( = ?auto_567630 ?auto_567632 ) ) ( not ( = ?auto_567630 ?auto_567633 ) ) ( not ( = ?auto_567630 ?auto_567634 ) ) ( not ( = ?auto_567630 ?auto_567635 ) ) ( not ( = ?auto_567630 ?auto_567636 ) ) ( not ( = ?auto_567630 ?auto_567637 ) ) ( not ( = ?auto_567630 ?auto_567638 ) ) ( not ( = ?auto_567631 ?auto_567632 ) ) ( not ( = ?auto_567631 ?auto_567633 ) ) ( not ( = ?auto_567631 ?auto_567634 ) ) ( not ( = ?auto_567631 ?auto_567635 ) ) ( not ( = ?auto_567631 ?auto_567636 ) ) ( not ( = ?auto_567631 ?auto_567637 ) ) ( not ( = ?auto_567631 ?auto_567638 ) ) ( not ( = ?auto_567632 ?auto_567633 ) ) ( not ( = ?auto_567632 ?auto_567634 ) ) ( not ( = ?auto_567632 ?auto_567635 ) ) ( not ( = ?auto_567632 ?auto_567636 ) ) ( not ( = ?auto_567632 ?auto_567637 ) ) ( not ( = ?auto_567632 ?auto_567638 ) ) ( not ( = ?auto_567633 ?auto_567634 ) ) ( not ( = ?auto_567633 ?auto_567635 ) ) ( not ( = ?auto_567633 ?auto_567636 ) ) ( not ( = ?auto_567633 ?auto_567637 ) ) ( not ( = ?auto_567633 ?auto_567638 ) ) ( not ( = ?auto_567634 ?auto_567635 ) ) ( not ( = ?auto_567634 ?auto_567636 ) ) ( not ( = ?auto_567634 ?auto_567637 ) ) ( not ( = ?auto_567634 ?auto_567638 ) ) ( not ( = ?auto_567635 ?auto_567636 ) ) ( not ( = ?auto_567635 ?auto_567637 ) ) ( not ( = ?auto_567635 ?auto_567638 ) ) ( not ( = ?auto_567636 ?auto_567637 ) ) ( not ( = ?auto_567636 ?auto_567638 ) ) ( not ( = ?auto_567637 ?auto_567638 ) ) ( ON ?auto_567636 ?auto_567637 ) ( ON ?auto_567635 ?auto_567636 ) ( CLEAR ?auto_567633 ) ( ON ?auto_567634 ?auto_567635 ) ( CLEAR ?auto_567634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_567626 ?auto_567627 ?auto_567628 ?auto_567629 ?auto_567630 ?auto_567631 ?auto_567632 ?auto_567633 ?auto_567634 )
      ( MAKE-12PILE ?auto_567626 ?auto_567627 ?auto_567628 ?auto_567629 ?auto_567630 ?auto_567631 ?auto_567632 ?auto_567633 ?auto_567634 ?auto_567635 ?auto_567636 ?auto_567637 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_567676 - BLOCK
      ?auto_567677 - BLOCK
      ?auto_567678 - BLOCK
      ?auto_567679 - BLOCK
      ?auto_567680 - BLOCK
      ?auto_567681 - BLOCK
      ?auto_567682 - BLOCK
      ?auto_567683 - BLOCK
      ?auto_567684 - BLOCK
      ?auto_567685 - BLOCK
      ?auto_567686 - BLOCK
      ?auto_567687 - BLOCK
    )
    :vars
    (
      ?auto_567688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_567687 ?auto_567688 ) ( ON-TABLE ?auto_567676 ) ( ON ?auto_567677 ?auto_567676 ) ( ON ?auto_567678 ?auto_567677 ) ( ON ?auto_567679 ?auto_567678 ) ( ON ?auto_567680 ?auto_567679 ) ( ON ?auto_567681 ?auto_567680 ) ( ON ?auto_567682 ?auto_567681 ) ( not ( = ?auto_567676 ?auto_567677 ) ) ( not ( = ?auto_567676 ?auto_567678 ) ) ( not ( = ?auto_567676 ?auto_567679 ) ) ( not ( = ?auto_567676 ?auto_567680 ) ) ( not ( = ?auto_567676 ?auto_567681 ) ) ( not ( = ?auto_567676 ?auto_567682 ) ) ( not ( = ?auto_567676 ?auto_567683 ) ) ( not ( = ?auto_567676 ?auto_567684 ) ) ( not ( = ?auto_567676 ?auto_567685 ) ) ( not ( = ?auto_567676 ?auto_567686 ) ) ( not ( = ?auto_567676 ?auto_567687 ) ) ( not ( = ?auto_567676 ?auto_567688 ) ) ( not ( = ?auto_567677 ?auto_567678 ) ) ( not ( = ?auto_567677 ?auto_567679 ) ) ( not ( = ?auto_567677 ?auto_567680 ) ) ( not ( = ?auto_567677 ?auto_567681 ) ) ( not ( = ?auto_567677 ?auto_567682 ) ) ( not ( = ?auto_567677 ?auto_567683 ) ) ( not ( = ?auto_567677 ?auto_567684 ) ) ( not ( = ?auto_567677 ?auto_567685 ) ) ( not ( = ?auto_567677 ?auto_567686 ) ) ( not ( = ?auto_567677 ?auto_567687 ) ) ( not ( = ?auto_567677 ?auto_567688 ) ) ( not ( = ?auto_567678 ?auto_567679 ) ) ( not ( = ?auto_567678 ?auto_567680 ) ) ( not ( = ?auto_567678 ?auto_567681 ) ) ( not ( = ?auto_567678 ?auto_567682 ) ) ( not ( = ?auto_567678 ?auto_567683 ) ) ( not ( = ?auto_567678 ?auto_567684 ) ) ( not ( = ?auto_567678 ?auto_567685 ) ) ( not ( = ?auto_567678 ?auto_567686 ) ) ( not ( = ?auto_567678 ?auto_567687 ) ) ( not ( = ?auto_567678 ?auto_567688 ) ) ( not ( = ?auto_567679 ?auto_567680 ) ) ( not ( = ?auto_567679 ?auto_567681 ) ) ( not ( = ?auto_567679 ?auto_567682 ) ) ( not ( = ?auto_567679 ?auto_567683 ) ) ( not ( = ?auto_567679 ?auto_567684 ) ) ( not ( = ?auto_567679 ?auto_567685 ) ) ( not ( = ?auto_567679 ?auto_567686 ) ) ( not ( = ?auto_567679 ?auto_567687 ) ) ( not ( = ?auto_567679 ?auto_567688 ) ) ( not ( = ?auto_567680 ?auto_567681 ) ) ( not ( = ?auto_567680 ?auto_567682 ) ) ( not ( = ?auto_567680 ?auto_567683 ) ) ( not ( = ?auto_567680 ?auto_567684 ) ) ( not ( = ?auto_567680 ?auto_567685 ) ) ( not ( = ?auto_567680 ?auto_567686 ) ) ( not ( = ?auto_567680 ?auto_567687 ) ) ( not ( = ?auto_567680 ?auto_567688 ) ) ( not ( = ?auto_567681 ?auto_567682 ) ) ( not ( = ?auto_567681 ?auto_567683 ) ) ( not ( = ?auto_567681 ?auto_567684 ) ) ( not ( = ?auto_567681 ?auto_567685 ) ) ( not ( = ?auto_567681 ?auto_567686 ) ) ( not ( = ?auto_567681 ?auto_567687 ) ) ( not ( = ?auto_567681 ?auto_567688 ) ) ( not ( = ?auto_567682 ?auto_567683 ) ) ( not ( = ?auto_567682 ?auto_567684 ) ) ( not ( = ?auto_567682 ?auto_567685 ) ) ( not ( = ?auto_567682 ?auto_567686 ) ) ( not ( = ?auto_567682 ?auto_567687 ) ) ( not ( = ?auto_567682 ?auto_567688 ) ) ( not ( = ?auto_567683 ?auto_567684 ) ) ( not ( = ?auto_567683 ?auto_567685 ) ) ( not ( = ?auto_567683 ?auto_567686 ) ) ( not ( = ?auto_567683 ?auto_567687 ) ) ( not ( = ?auto_567683 ?auto_567688 ) ) ( not ( = ?auto_567684 ?auto_567685 ) ) ( not ( = ?auto_567684 ?auto_567686 ) ) ( not ( = ?auto_567684 ?auto_567687 ) ) ( not ( = ?auto_567684 ?auto_567688 ) ) ( not ( = ?auto_567685 ?auto_567686 ) ) ( not ( = ?auto_567685 ?auto_567687 ) ) ( not ( = ?auto_567685 ?auto_567688 ) ) ( not ( = ?auto_567686 ?auto_567687 ) ) ( not ( = ?auto_567686 ?auto_567688 ) ) ( not ( = ?auto_567687 ?auto_567688 ) ) ( ON ?auto_567686 ?auto_567687 ) ( ON ?auto_567685 ?auto_567686 ) ( ON ?auto_567684 ?auto_567685 ) ( CLEAR ?auto_567682 ) ( ON ?auto_567683 ?auto_567684 ) ( CLEAR ?auto_567683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_567676 ?auto_567677 ?auto_567678 ?auto_567679 ?auto_567680 ?auto_567681 ?auto_567682 ?auto_567683 )
      ( MAKE-12PILE ?auto_567676 ?auto_567677 ?auto_567678 ?auto_567679 ?auto_567680 ?auto_567681 ?auto_567682 ?auto_567683 ?auto_567684 ?auto_567685 ?auto_567686 ?auto_567687 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_567726 - BLOCK
      ?auto_567727 - BLOCK
      ?auto_567728 - BLOCK
      ?auto_567729 - BLOCK
      ?auto_567730 - BLOCK
      ?auto_567731 - BLOCK
      ?auto_567732 - BLOCK
      ?auto_567733 - BLOCK
      ?auto_567734 - BLOCK
      ?auto_567735 - BLOCK
      ?auto_567736 - BLOCK
      ?auto_567737 - BLOCK
    )
    :vars
    (
      ?auto_567738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_567737 ?auto_567738 ) ( ON-TABLE ?auto_567726 ) ( ON ?auto_567727 ?auto_567726 ) ( ON ?auto_567728 ?auto_567727 ) ( ON ?auto_567729 ?auto_567728 ) ( ON ?auto_567730 ?auto_567729 ) ( ON ?auto_567731 ?auto_567730 ) ( not ( = ?auto_567726 ?auto_567727 ) ) ( not ( = ?auto_567726 ?auto_567728 ) ) ( not ( = ?auto_567726 ?auto_567729 ) ) ( not ( = ?auto_567726 ?auto_567730 ) ) ( not ( = ?auto_567726 ?auto_567731 ) ) ( not ( = ?auto_567726 ?auto_567732 ) ) ( not ( = ?auto_567726 ?auto_567733 ) ) ( not ( = ?auto_567726 ?auto_567734 ) ) ( not ( = ?auto_567726 ?auto_567735 ) ) ( not ( = ?auto_567726 ?auto_567736 ) ) ( not ( = ?auto_567726 ?auto_567737 ) ) ( not ( = ?auto_567726 ?auto_567738 ) ) ( not ( = ?auto_567727 ?auto_567728 ) ) ( not ( = ?auto_567727 ?auto_567729 ) ) ( not ( = ?auto_567727 ?auto_567730 ) ) ( not ( = ?auto_567727 ?auto_567731 ) ) ( not ( = ?auto_567727 ?auto_567732 ) ) ( not ( = ?auto_567727 ?auto_567733 ) ) ( not ( = ?auto_567727 ?auto_567734 ) ) ( not ( = ?auto_567727 ?auto_567735 ) ) ( not ( = ?auto_567727 ?auto_567736 ) ) ( not ( = ?auto_567727 ?auto_567737 ) ) ( not ( = ?auto_567727 ?auto_567738 ) ) ( not ( = ?auto_567728 ?auto_567729 ) ) ( not ( = ?auto_567728 ?auto_567730 ) ) ( not ( = ?auto_567728 ?auto_567731 ) ) ( not ( = ?auto_567728 ?auto_567732 ) ) ( not ( = ?auto_567728 ?auto_567733 ) ) ( not ( = ?auto_567728 ?auto_567734 ) ) ( not ( = ?auto_567728 ?auto_567735 ) ) ( not ( = ?auto_567728 ?auto_567736 ) ) ( not ( = ?auto_567728 ?auto_567737 ) ) ( not ( = ?auto_567728 ?auto_567738 ) ) ( not ( = ?auto_567729 ?auto_567730 ) ) ( not ( = ?auto_567729 ?auto_567731 ) ) ( not ( = ?auto_567729 ?auto_567732 ) ) ( not ( = ?auto_567729 ?auto_567733 ) ) ( not ( = ?auto_567729 ?auto_567734 ) ) ( not ( = ?auto_567729 ?auto_567735 ) ) ( not ( = ?auto_567729 ?auto_567736 ) ) ( not ( = ?auto_567729 ?auto_567737 ) ) ( not ( = ?auto_567729 ?auto_567738 ) ) ( not ( = ?auto_567730 ?auto_567731 ) ) ( not ( = ?auto_567730 ?auto_567732 ) ) ( not ( = ?auto_567730 ?auto_567733 ) ) ( not ( = ?auto_567730 ?auto_567734 ) ) ( not ( = ?auto_567730 ?auto_567735 ) ) ( not ( = ?auto_567730 ?auto_567736 ) ) ( not ( = ?auto_567730 ?auto_567737 ) ) ( not ( = ?auto_567730 ?auto_567738 ) ) ( not ( = ?auto_567731 ?auto_567732 ) ) ( not ( = ?auto_567731 ?auto_567733 ) ) ( not ( = ?auto_567731 ?auto_567734 ) ) ( not ( = ?auto_567731 ?auto_567735 ) ) ( not ( = ?auto_567731 ?auto_567736 ) ) ( not ( = ?auto_567731 ?auto_567737 ) ) ( not ( = ?auto_567731 ?auto_567738 ) ) ( not ( = ?auto_567732 ?auto_567733 ) ) ( not ( = ?auto_567732 ?auto_567734 ) ) ( not ( = ?auto_567732 ?auto_567735 ) ) ( not ( = ?auto_567732 ?auto_567736 ) ) ( not ( = ?auto_567732 ?auto_567737 ) ) ( not ( = ?auto_567732 ?auto_567738 ) ) ( not ( = ?auto_567733 ?auto_567734 ) ) ( not ( = ?auto_567733 ?auto_567735 ) ) ( not ( = ?auto_567733 ?auto_567736 ) ) ( not ( = ?auto_567733 ?auto_567737 ) ) ( not ( = ?auto_567733 ?auto_567738 ) ) ( not ( = ?auto_567734 ?auto_567735 ) ) ( not ( = ?auto_567734 ?auto_567736 ) ) ( not ( = ?auto_567734 ?auto_567737 ) ) ( not ( = ?auto_567734 ?auto_567738 ) ) ( not ( = ?auto_567735 ?auto_567736 ) ) ( not ( = ?auto_567735 ?auto_567737 ) ) ( not ( = ?auto_567735 ?auto_567738 ) ) ( not ( = ?auto_567736 ?auto_567737 ) ) ( not ( = ?auto_567736 ?auto_567738 ) ) ( not ( = ?auto_567737 ?auto_567738 ) ) ( ON ?auto_567736 ?auto_567737 ) ( ON ?auto_567735 ?auto_567736 ) ( ON ?auto_567734 ?auto_567735 ) ( ON ?auto_567733 ?auto_567734 ) ( CLEAR ?auto_567731 ) ( ON ?auto_567732 ?auto_567733 ) ( CLEAR ?auto_567732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_567726 ?auto_567727 ?auto_567728 ?auto_567729 ?auto_567730 ?auto_567731 ?auto_567732 )
      ( MAKE-12PILE ?auto_567726 ?auto_567727 ?auto_567728 ?auto_567729 ?auto_567730 ?auto_567731 ?auto_567732 ?auto_567733 ?auto_567734 ?auto_567735 ?auto_567736 ?auto_567737 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_567776 - BLOCK
      ?auto_567777 - BLOCK
      ?auto_567778 - BLOCK
      ?auto_567779 - BLOCK
      ?auto_567780 - BLOCK
      ?auto_567781 - BLOCK
      ?auto_567782 - BLOCK
      ?auto_567783 - BLOCK
      ?auto_567784 - BLOCK
      ?auto_567785 - BLOCK
      ?auto_567786 - BLOCK
      ?auto_567787 - BLOCK
    )
    :vars
    (
      ?auto_567788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_567787 ?auto_567788 ) ( ON-TABLE ?auto_567776 ) ( ON ?auto_567777 ?auto_567776 ) ( ON ?auto_567778 ?auto_567777 ) ( ON ?auto_567779 ?auto_567778 ) ( ON ?auto_567780 ?auto_567779 ) ( not ( = ?auto_567776 ?auto_567777 ) ) ( not ( = ?auto_567776 ?auto_567778 ) ) ( not ( = ?auto_567776 ?auto_567779 ) ) ( not ( = ?auto_567776 ?auto_567780 ) ) ( not ( = ?auto_567776 ?auto_567781 ) ) ( not ( = ?auto_567776 ?auto_567782 ) ) ( not ( = ?auto_567776 ?auto_567783 ) ) ( not ( = ?auto_567776 ?auto_567784 ) ) ( not ( = ?auto_567776 ?auto_567785 ) ) ( not ( = ?auto_567776 ?auto_567786 ) ) ( not ( = ?auto_567776 ?auto_567787 ) ) ( not ( = ?auto_567776 ?auto_567788 ) ) ( not ( = ?auto_567777 ?auto_567778 ) ) ( not ( = ?auto_567777 ?auto_567779 ) ) ( not ( = ?auto_567777 ?auto_567780 ) ) ( not ( = ?auto_567777 ?auto_567781 ) ) ( not ( = ?auto_567777 ?auto_567782 ) ) ( not ( = ?auto_567777 ?auto_567783 ) ) ( not ( = ?auto_567777 ?auto_567784 ) ) ( not ( = ?auto_567777 ?auto_567785 ) ) ( not ( = ?auto_567777 ?auto_567786 ) ) ( not ( = ?auto_567777 ?auto_567787 ) ) ( not ( = ?auto_567777 ?auto_567788 ) ) ( not ( = ?auto_567778 ?auto_567779 ) ) ( not ( = ?auto_567778 ?auto_567780 ) ) ( not ( = ?auto_567778 ?auto_567781 ) ) ( not ( = ?auto_567778 ?auto_567782 ) ) ( not ( = ?auto_567778 ?auto_567783 ) ) ( not ( = ?auto_567778 ?auto_567784 ) ) ( not ( = ?auto_567778 ?auto_567785 ) ) ( not ( = ?auto_567778 ?auto_567786 ) ) ( not ( = ?auto_567778 ?auto_567787 ) ) ( not ( = ?auto_567778 ?auto_567788 ) ) ( not ( = ?auto_567779 ?auto_567780 ) ) ( not ( = ?auto_567779 ?auto_567781 ) ) ( not ( = ?auto_567779 ?auto_567782 ) ) ( not ( = ?auto_567779 ?auto_567783 ) ) ( not ( = ?auto_567779 ?auto_567784 ) ) ( not ( = ?auto_567779 ?auto_567785 ) ) ( not ( = ?auto_567779 ?auto_567786 ) ) ( not ( = ?auto_567779 ?auto_567787 ) ) ( not ( = ?auto_567779 ?auto_567788 ) ) ( not ( = ?auto_567780 ?auto_567781 ) ) ( not ( = ?auto_567780 ?auto_567782 ) ) ( not ( = ?auto_567780 ?auto_567783 ) ) ( not ( = ?auto_567780 ?auto_567784 ) ) ( not ( = ?auto_567780 ?auto_567785 ) ) ( not ( = ?auto_567780 ?auto_567786 ) ) ( not ( = ?auto_567780 ?auto_567787 ) ) ( not ( = ?auto_567780 ?auto_567788 ) ) ( not ( = ?auto_567781 ?auto_567782 ) ) ( not ( = ?auto_567781 ?auto_567783 ) ) ( not ( = ?auto_567781 ?auto_567784 ) ) ( not ( = ?auto_567781 ?auto_567785 ) ) ( not ( = ?auto_567781 ?auto_567786 ) ) ( not ( = ?auto_567781 ?auto_567787 ) ) ( not ( = ?auto_567781 ?auto_567788 ) ) ( not ( = ?auto_567782 ?auto_567783 ) ) ( not ( = ?auto_567782 ?auto_567784 ) ) ( not ( = ?auto_567782 ?auto_567785 ) ) ( not ( = ?auto_567782 ?auto_567786 ) ) ( not ( = ?auto_567782 ?auto_567787 ) ) ( not ( = ?auto_567782 ?auto_567788 ) ) ( not ( = ?auto_567783 ?auto_567784 ) ) ( not ( = ?auto_567783 ?auto_567785 ) ) ( not ( = ?auto_567783 ?auto_567786 ) ) ( not ( = ?auto_567783 ?auto_567787 ) ) ( not ( = ?auto_567783 ?auto_567788 ) ) ( not ( = ?auto_567784 ?auto_567785 ) ) ( not ( = ?auto_567784 ?auto_567786 ) ) ( not ( = ?auto_567784 ?auto_567787 ) ) ( not ( = ?auto_567784 ?auto_567788 ) ) ( not ( = ?auto_567785 ?auto_567786 ) ) ( not ( = ?auto_567785 ?auto_567787 ) ) ( not ( = ?auto_567785 ?auto_567788 ) ) ( not ( = ?auto_567786 ?auto_567787 ) ) ( not ( = ?auto_567786 ?auto_567788 ) ) ( not ( = ?auto_567787 ?auto_567788 ) ) ( ON ?auto_567786 ?auto_567787 ) ( ON ?auto_567785 ?auto_567786 ) ( ON ?auto_567784 ?auto_567785 ) ( ON ?auto_567783 ?auto_567784 ) ( ON ?auto_567782 ?auto_567783 ) ( CLEAR ?auto_567780 ) ( ON ?auto_567781 ?auto_567782 ) ( CLEAR ?auto_567781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_567776 ?auto_567777 ?auto_567778 ?auto_567779 ?auto_567780 ?auto_567781 )
      ( MAKE-12PILE ?auto_567776 ?auto_567777 ?auto_567778 ?auto_567779 ?auto_567780 ?auto_567781 ?auto_567782 ?auto_567783 ?auto_567784 ?auto_567785 ?auto_567786 ?auto_567787 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_567826 - BLOCK
      ?auto_567827 - BLOCK
      ?auto_567828 - BLOCK
      ?auto_567829 - BLOCK
      ?auto_567830 - BLOCK
      ?auto_567831 - BLOCK
      ?auto_567832 - BLOCK
      ?auto_567833 - BLOCK
      ?auto_567834 - BLOCK
      ?auto_567835 - BLOCK
      ?auto_567836 - BLOCK
      ?auto_567837 - BLOCK
    )
    :vars
    (
      ?auto_567838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_567837 ?auto_567838 ) ( ON-TABLE ?auto_567826 ) ( ON ?auto_567827 ?auto_567826 ) ( ON ?auto_567828 ?auto_567827 ) ( ON ?auto_567829 ?auto_567828 ) ( not ( = ?auto_567826 ?auto_567827 ) ) ( not ( = ?auto_567826 ?auto_567828 ) ) ( not ( = ?auto_567826 ?auto_567829 ) ) ( not ( = ?auto_567826 ?auto_567830 ) ) ( not ( = ?auto_567826 ?auto_567831 ) ) ( not ( = ?auto_567826 ?auto_567832 ) ) ( not ( = ?auto_567826 ?auto_567833 ) ) ( not ( = ?auto_567826 ?auto_567834 ) ) ( not ( = ?auto_567826 ?auto_567835 ) ) ( not ( = ?auto_567826 ?auto_567836 ) ) ( not ( = ?auto_567826 ?auto_567837 ) ) ( not ( = ?auto_567826 ?auto_567838 ) ) ( not ( = ?auto_567827 ?auto_567828 ) ) ( not ( = ?auto_567827 ?auto_567829 ) ) ( not ( = ?auto_567827 ?auto_567830 ) ) ( not ( = ?auto_567827 ?auto_567831 ) ) ( not ( = ?auto_567827 ?auto_567832 ) ) ( not ( = ?auto_567827 ?auto_567833 ) ) ( not ( = ?auto_567827 ?auto_567834 ) ) ( not ( = ?auto_567827 ?auto_567835 ) ) ( not ( = ?auto_567827 ?auto_567836 ) ) ( not ( = ?auto_567827 ?auto_567837 ) ) ( not ( = ?auto_567827 ?auto_567838 ) ) ( not ( = ?auto_567828 ?auto_567829 ) ) ( not ( = ?auto_567828 ?auto_567830 ) ) ( not ( = ?auto_567828 ?auto_567831 ) ) ( not ( = ?auto_567828 ?auto_567832 ) ) ( not ( = ?auto_567828 ?auto_567833 ) ) ( not ( = ?auto_567828 ?auto_567834 ) ) ( not ( = ?auto_567828 ?auto_567835 ) ) ( not ( = ?auto_567828 ?auto_567836 ) ) ( not ( = ?auto_567828 ?auto_567837 ) ) ( not ( = ?auto_567828 ?auto_567838 ) ) ( not ( = ?auto_567829 ?auto_567830 ) ) ( not ( = ?auto_567829 ?auto_567831 ) ) ( not ( = ?auto_567829 ?auto_567832 ) ) ( not ( = ?auto_567829 ?auto_567833 ) ) ( not ( = ?auto_567829 ?auto_567834 ) ) ( not ( = ?auto_567829 ?auto_567835 ) ) ( not ( = ?auto_567829 ?auto_567836 ) ) ( not ( = ?auto_567829 ?auto_567837 ) ) ( not ( = ?auto_567829 ?auto_567838 ) ) ( not ( = ?auto_567830 ?auto_567831 ) ) ( not ( = ?auto_567830 ?auto_567832 ) ) ( not ( = ?auto_567830 ?auto_567833 ) ) ( not ( = ?auto_567830 ?auto_567834 ) ) ( not ( = ?auto_567830 ?auto_567835 ) ) ( not ( = ?auto_567830 ?auto_567836 ) ) ( not ( = ?auto_567830 ?auto_567837 ) ) ( not ( = ?auto_567830 ?auto_567838 ) ) ( not ( = ?auto_567831 ?auto_567832 ) ) ( not ( = ?auto_567831 ?auto_567833 ) ) ( not ( = ?auto_567831 ?auto_567834 ) ) ( not ( = ?auto_567831 ?auto_567835 ) ) ( not ( = ?auto_567831 ?auto_567836 ) ) ( not ( = ?auto_567831 ?auto_567837 ) ) ( not ( = ?auto_567831 ?auto_567838 ) ) ( not ( = ?auto_567832 ?auto_567833 ) ) ( not ( = ?auto_567832 ?auto_567834 ) ) ( not ( = ?auto_567832 ?auto_567835 ) ) ( not ( = ?auto_567832 ?auto_567836 ) ) ( not ( = ?auto_567832 ?auto_567837 ) ) ( not ( = ?auto_567832 ?auto_567838 ) ) ( not ( = ?auto_567833 ?auto_567834 ) ) ( not ( = ?auto_567833 ?auto_567835 ) ) ( not ( = ?auto_567833 ?auto_567836 ) ) ( not ( = ?auto_567833 ?auto_567837 ) ) ( not ( = ?auto_567833 ?auto_567838 ) ) ( not ( = ?auto_567834 ?auto_567835 ) ) ( not ( = ?auto_567834 ?auto_567836 ) ) ( not ( = ?auto_567834 ?auto_567837 ) ) ( not ( = ?auto_567834 ?auto_567838 ) ) ( not ( = ?auto_567835 ?auto_567836 ) ) ( not ( = ?auto_567835 ?auto_567837 ) ) ( not ( = ?auto_567835 ?auto_567838 ) ) ( not ( = ?auto_567836 ?auto_567837 ) ) ( not ( = ?auto_567836 ?auto_567838 ) ) ( not ( = ?auto_567837 ?auto_567838 ) ) ( ON ?auto_567836 ?auto_567837 ) ( ON ?auto_567835 ?auto_567836 ) ( ON ?auto_567834 ?auto_567835 ) ( ON ?auto_567833 ?auto_567834 ) ( ON ?auto_567832 ?auto_567833 ) ( ON ?auto_567831 ?auto_567832 ) ( CLEAR ?auto_567829 ) ( ON ?auto_567830 ?auto_567831 ) ( CLEAR ?auto_567830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_567826 ?auto_567827 ?auto_567828 ?auto_567829 ?auto_567830 )
      ( MAKE-12PILE ?auto_567826 ?auto_567827 ?auto_567828 ?auto_567829 ?auto_567830 ?auto_567831 ?auto_567832 ?auto_567833 ?auto_567834 ?auto_567835 ?auto_567836 ?auto_567837 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_567876 - BLOCK
      ?auto_567877 - BLOCK
      ?auto_567878 - BLOCK
      ?auto_567879 - BLOCK
      ?auto_567880 - BLOCK
      ?auto_567881 - BLOCK
      ?auto_567882 - BLOCK
      ?auto_567883 - BLOCK
      ?auto_567884 - BLOCK
      ?auto_567885 - BLOCK
      ?auto_567886 - BLOCK
      ?auto_567887 - BLOCK
    )
    :vars
    (
      ?auto_567888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_567887 ?auto_567888 ) ( ON-TABLE ?auto_567876 ) ( ON ?auto_567877 ?auto_567876 ) ( ON ?auto_567878 ?auto_567877 ) ( not ( = ?auto_567876 ?auto_567877 ) ) ( not ( = ?auto_567876 ?auto_567878 ) ) ( not ( = ?auto_567876 ?auto_567879 ) ) ( not ( = ?auto_567876 ?auto_567880 ) ) ( not ( = ?auto_567876 ?auto_567881 ) ) ( not ( = ?auto_567876 ?auto_567882 ) ) ( not ( = ?auto_567876 ?auto_567883 ) ) ( not ( = ?auto_567876 ?auto_567884 ) ) ( not ( = ?auto_567876 ?auto_567885 ) ) ( not ( = ?auto_567876 ?auto_567886 ) ) ( not ( = ?auto_567876 ?auto_567887 ) ) ( not ( = ?auto_567876 ?auto_567888 ) ) ( not ( = ?auto_567877 ?auto_567878 ) ) ( not ( = ?auto_567877 ?auto_567879 ) ) ( not ( = ?auto_567877 ?auto_567880 ) ) ( not ( = ?auto_567877 ?auto_567881 ) ) ( not ( = ?auto_567877 ?auto_567882 ) ) ( not ( = ?auto_567877 ?auto_567883 ) ) ( not ( = ?auto_567877 ?auto_567884 ) ) ( not ( = ?auto_567877 ?auto_567885 ) ) ( not ( = ?auto_567877 ?auto_567886 ) ) ( not ( = ?auto_567877 ?auto_567887 ) ) ( not ( = ?auto_567877 ?auto_567888 ) ) ( not ( = ?auto_567878 ?auto_567879 ) ) ( not ( = ?auto_567878 ?auto_567880 ) ) ( not ( = ?auto_567878 ?auto_567881 ) ) ( not ( = ?auto_567878 ?auto_567882 ) ) ( not ( = ?auto_567878 ?auto_567883 ) ) ( not ( = ?auto_567878 ?auto_567884 ) ) ( not ( = ?auto_567878 ?auto_567885 ) ) ( not ( = ?auto_567878 ?auto_567886 ) ) ( not ( = ?auto_567878 ?auto_567887 ) ) ( not ( = ?auto_567878 ?auto_567888 ) ) ( not ( = ?auto_567879 ?auto_567880 ) ) ( not ( = ?auto_567879 ?auto_567881 ) ) ( not ( = ?auto_567879 ?auto_567882 ) ) ( not ( = ?auto_567879 ?auto_567883 ) ) ( not ( = ?auto_567879 ?auto_567884 ) ) ( not ( = ?auto_567879 ?auto_567885 ) ) ( not ( = ?auto_567879 ?auto_567886 ) ) ( not ( = ?auto_567879 ?auto_567887 ) ) ( not ( = ?auto_567879 ?auto_567888 ) ) ( not ( = ?auto_567880 ?auto_567881 ) ) ( not ( = ?auto_567880 ?auto_567882 ) ) ( not ( = ?auto_567880 ?auto_567883 ) ) ( not ( = ?auto_567880 ?auto_567884 ) ) ( not ( = ?auto_567880 ?auto_567885 ) ) ( not ( = ?auto_567880 ?auto_567886 ) ) ( not ( = ?auto_567880 ?auto_567887 ) ) ( not ( = ?auto_567880 ?auto_567888 ) ) ( not ( = ?auto_567881 ?auto_567882 ) ) ( not ( = ?auto_567881 ?auto_567883 ) ) ( not ( = ?auto_567881 ?auto_567884 ) ) ( not ( = ?auto_567881 ?auto_567885 ) ) ( not ( = ?auto_567881 ?auto_567886 ) ) ( not ( = ?auto_567881 ?auto_567887 ) ) ( not ( = ?auto_567881 ?auto_567888 ) ) ( not ( = ?auto_567882 ?auto_567883 ) ) ( not ( = ?auto_567882 ?auto_567884 ) ) ( not ( = ?auto_567882 ?auto_567885 ) ) ( not ( = ?auto_567882 ?auto_567886 ) ) ( not ( = ?auto_567882 ?auto_567887 ) ) ( not ( = ?auto_567882 ?auto_567888 ) ) ( not ( = ?auto_567883 ?auto_567884 ) ) ( not ( = ?auto_567883 ?auto_567885 ) ) ( not ( = ?auto_567883 ?auto_567886 ) ) ( not ( = ?auto_567883 ?auto_567887 ) ) ( not ( = ?auto_567883 ?auto_567888 ) ) ( not ( = ?auto_567884 ?auto_567885 ) ) ( not ( = ?auto_567884 ?auto_567886 ) ) ( not ( = ?auto_567884 ?auto_567887 ) ) ( not ( = ?auto_567884 ?auto_567888 ) ) ( not ( = ?auto_567885 ?auto_567886 ) ) ( not ( = ?auto_567885 ?auto_567887 ) ) ( not ( = ?auto_567885 ?auto_567888 ) ) ( not ( = ?auto_567886 ?auto_567887 ) ) ( not ( = ?auto_567886 ?auto_567888 ) ) ( not ( = ?auto_567887 ?auto_567888 ) ) ( ON ?auto_567886 ?auto_567887 ) ( ON ?auto_567885 ?auto_567886 ) ( ON ?auto_567884 ?auto_567885 ) ( ON ?auto_567883 ?auto_567884 ) ( ON ?auto_567882 ?auto_567883 ) ( ON ?auto_567881 ?auto_567882 ) ( ON ?auto_567880 ?auto_567881 ) ( CLEAR ?auto_567878 ) ( ON ?auto_567879 ?auto_567880 ) ( CLEAR ?auto_567879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_567876 ?auto_567877 ?auto_567878 ?auto_567879 )
      ( MAKE-12PILE ?auto_567876 ?auto_567877 ?auto_567878 ?auto_567879 ?auto_567880 ?auto_567881 ?auto_567882 ?auto_567883 ?auto_567884 ?auto_567885 ?auto_567886 ?auto_567887 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_567926 - BLOCK
      ?auto_567927 - BLOCK
      ?auto_567928 - BLOCK
      ?auto_567929 - BLOCK
      ?auto_567930 - BLOCK
      ?auto_567931 - BLOCK
      ?auto_567932 - BLOCK
      ?auto_567933 - BLOCK
      ?auto_567934 - BLOCK
      ?auto_567935 - BLOCK
      ?auto_567936 - BLOCK
      ?auto_567937 - BLOCK
    )
    :vars
    (
      ?auto_567938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_567937 ?auto_567938 ) ( ON-TABLE ?auto_567926 ) ( ON ?auto_567927 ?auto_567926 ) ( not ( = ?auto_567926 ?auto_567927 ) ) ( not ( = ?auto_567926 ?auto_567928 ) ) ( not ( = ?auto_567926 ?auto_567929 ) ) ( not ( = ?auto_567926 ?auto_567930 ) ) ( not ( = ?auto_567926 ?auto_567931 ) ) ( not ( = ?auto_567926 ?auto_567932 ) ) ( not ( = ?auto_567926 ?auto_567933 ) ) ( not ( = ?auto_567926 ?auto_567934 ) ) ( not ( = ?auto_567926 ?auto_567935 ) ) ( not ( = ?auto_567926 ?auto_567936 ) ) ( not ( = ?auto_567926 ?auto_567937 ) ) ( not ( = ?auto_567926 ?auto_567938 ) ) ( not ( = ?auto_567927 ?auto_567928 ) ) ( not ( = ?auto_567927 ?auto_567929 ) ) ( not ( = ?auto_567927 ?auto_567930 ) ) ( not ( = ?auto_567927 ?auto_567931 ) ) ( not ( = ?auto_567927 ?auto_567932 ) ) ( not ( = ?auto_567927 ?auto_567933 ) ) ( not ( = ?auto_567927 ?auto_567934 ) ) ( not ( = ?auto_567927 ?auto_567935 ) ) ( not ( = ?auto_567927 ?auto_567936 ) ) ( not ( = ?auto_567927 ?auto_567937 ) ) ( not ( = ?auto_567927 ?auto_567938 ) ) ( not ( = ?auto_567928 ?auto_567929 ) ) ( not ( = ?auto_567928 ?auto_567930 ) ) ( not ( = ?auto_567928 ?auto_567931 ) ) ( not ( = ?auto_567928 ?auto_567932 ) ) ( not ( = ?auto_567928 ?auto_567933 ) ) ( not ( = ?auto_567928 ?auto_567934 ) ) ( not ( = ?auto_567928 ?auto_567935 ) ) ( not ( = ?auto_567928 ?auto_567936 ) ) ( not ( = ?auto_567928 ?auto_567937 ) ) ( not ( = ?auto_567928 ?auto_567938 ) ) ( not ( = ?auto_567929 ?auto_567930 ) ) ( not ( = ?auto_567929 ?auto_567931 ) ) ( not ( = ?auto_567929 ?auto_567932 ) ) ( not ( = ?auto_567929 ?auto_567933 ) ) ( not ( = ?auto_567929 ?auto_567934 ) ) ( not ( = ?auto_567929 ?auto_567935 ) ) ( not ( = ?auto_567929 ?auto_567936 ) ) ( not ( = ?auto_567929 ?auto_567937 ) ) ( not ( = ?auto_567929 ?auto_567938 ) ) ( not ( = ?auto_567930 ?auto_567931 ) ) ( not ( = ?auto_567930 ?auto_567932 ) ) ( not ( = ?auto_567930 ?auto_567933 ) ) ( not ( = ?auto_567930 ?auto_567934 ) ) ( not ( = ?auto_567930 ?auto_567935 ) ) ( not ( = ?auto_567930 ?auto_567936 ) ) ( not ( = ?auto_567930 ?auto_567937 ) ) ( not ( = ?auto_567930 ?auto_567938 ) ) ( not ( = ?auto_567931 ?auto_567932 ) ) ( not ( = ?auto_567931 ?auto_567933 ) ) ( not ( = ?auto_567931 ?auto_567934 ) ) ( not ( = ?auto_567931 ?auto_567935 ) ) ( not ( = ?auto_567931 ?auto_567936 ) ) ( not ( = ?auto_567931 ?auto_567937 ) ) ( not ( = ?auto_567931 ?auto_567938 ) ) ( not ( = ?auto_567932 ?auto_567933 ) ) ( not ( = ?auto_567932 ?auto_567934 ) ) ( not ( = ?auto_567932 ?auto_567935 ) ) ( not ( = ?auto_567932 ?auto_567936 ) ) ( not ( = ?auto_567932 ?auto_567937 ) ) ( not ( = ?auto_567932 ?auto_567938 ) ) ( not ( = ?auto_567933 ?auto_567934 ) ) ( not ( = ?auto_567933 ?auto_567935 ) ) ( not ( = ?auto_567933 ?auto_567936 ) ) ( not ( = ?auto_567933 ?auto_567937 ) ) ( not ( = ?auto_567933 ?auto_567938 ) ) ( not ( = ?auto_567934 ?auto_567935 ) ) ( not ( = ?auto_567934 ?auto_567936 ) ) ( not ( = ?auto_567934 ?auto_567937 ) ) ( not ( = ?auto_567934 ?auto_567938 ) ) ( not ( = ?auto_567935 ?auto_567936 ) ) ( not ( = ?auto_567935 ?auto_567937 ) ) ( not ( = ?auto_567935 ?auto_567938 ) ) ( not ( = ?auto_567936 ?auto_567937 ) ) ( not ( = ?auto_567936 ?auto_567938 ) ) ( not ( = ?auto_567937 ?auto_567938 ) ) ( ON ?auto_567936 ?auto_567937 ) ( ON ?auto_567935 ?auto_567936 ) ( ON ?auto_567934 ?auto_567935 ) ( ON ?auto_567933 ?auto_567934 ) ( ON ?auto_567932 ?auto_567933 ) ( ON ?auto_567931 ?auto_567932 ) ( ON ?auto_567930 ?auto_567931 ) ( ON ?auto_567929 ?auto_567930 ) ( CLEAR ?auto_567927 ) ( ON ?auto_567928 ?auto_567929 ) ( CLEAR ?auto_567928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_567926 ?auto_567927 ?auto_567928 )
      ( MAKE-12PILE ?auto_567926 ?auto_567927 ?auto_567928 ?auto_567929 ?auto_567930 ?auto_567931 ?auto_567932 ?auto_567933 ?auto_567934 ?auto_567935 ?auto_567936 ?auto_567937 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_567976 - BLOCK
      ?auto_567977 - BLOCK
      ?auto_567978 - BLOCK
      ?auto_567979 - BLOCK
      ?auto_567980 - BLOCK
      ?auto_567981 - BLOCK
      ?auto_567982 - BLOCK
      ?auto_567983 - BLOCK
      ?auto_567984 - BLOCK
      ?auto_567985 - BLOCK
      ?auto_567986 - BLOCK
      ?auto_567987 - BLOCK
    )
    :vars
    (
      ?auto_567988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_567987 ?auto_567988 ) ( ON-TABLE ?auto_567976 ) ( not ( = ?auto_567976 ?auto_567977 ) ) ( not ( = ?auto_567976 ?auto_567978 ) ) ( not ( = ?auto_567976 ?auto_567979 ) ) ( not ( = ?auto_567976 ?auto_567980 ) ) ( not ( = ?auto_567976 ?auto_567981 ) ) ( not ( = ?auto_567976 ?auto_567982 ) ) ( not ( = ?auto_567976 ?auto_567983 ) ) ( not ( = ?auto_567976 ?auto_567984 ) ) ( not ( = ?auto_567976 ?auto_567985 ) ) ( not ( = ?auto_567976 ?auto_567986 ) ) ( not ( = ?auto_567976 ?auto_567987 ) ) ( not ( = ?auto_567976 ?auto_567988 ) ) ( not ( = ?auto_567977 ?auto_567978 ) ) ( not ( = ?auto_567977 ?auto_567979 ) ) ( not ( = ?auto_567977 ?auto_567980 ) ) ( not ( = ?auto_567977 ?auto_567981 ) ) ( not ( = ?auto_567977 ?auto_567982 ) ) ( not ( = ?auto_567977 ?auto_567983 ) ) ( not ( = ?auto_567977 ?auto_567984 ) ) ( not ( = ?auto_567977 ?auto_567985 ) ) ( not ( = ?auto_567977 ?auto_567986 ) ) ( not ( = ?auto_567977 ?auto_567987 ) ) ( not ( = ?auto_567977 ?auto_567988 ) ) ( not ( = ?auto_567978 ?auto_567979 ) ) ( not ( = ?auto_567978 ?auto_567980 ) ) ( not ( = ?auto_567978 ?auto_567981 ) ) ( not ( = ?auto_567978 ?auto_567982 ) ) ( not ( = ?auto_567978 ?auto_567983 ) ) ( not ( = ?auto_567978 ?auto_567984 ) ) ( not ( = ?auto_567978 ?auto_567985 ) ) ( not ( = ?auto_567978 ?auto_567986 ) ) ( not ( = ?auto_567978 ?auto_567987 ) ) ( not ( = ?auto_567978 ?auto_567988 ) ) ( not ( = ?auto_567979 ?auto_567980 ) ) ( not ( = ?auto_567979 ?auto_567981 ) ) ( not ( = ?auto_567979 ?auto_567982 ) ) ( not ( = ?auto_567979 ?auto_567983 ) ) ( not ( = ?auto_567979 ?auto_567984 ) ) ( not ( = ?auto_567979 ?auto_567985 ) ) ( not ( = ?auto_567979 ?auto_567986 ) ) ( not ( = ?auto_567979 ?auto_567987 ) ) ( not ( = ?auto_567979 ?auto_567988 ) ) ( not ( = ?auto_567980 ?auto_567981 ) ) ( not ( = ?auto_567980 ?auto_567982 ) ) ( not ( = ?auto_567980 ?auto_567983 ) ) ( not ( = ?auto_567980 ?auto_567984 ) ) ( not ( = ?auto_567980 ?auto_567985 ) ) ( not ( = ?auto_567980 ?auto_567986 ) ) ( not ( = ?auto_567980 ?auto_567987 ) ) ( not ( = ?auto_567980 ?auto_567988 ) ) ( not ( = ?auto_567981 ?auto_567982 ) ) ( not ( = ?auto_567981 ?auto_567983 ) ) ( not ( = ?auto_567981 ?auto_567984 ) ) ( not ( = ?auto_567981 ?auto_567985 ) ) ( not ( = ?auto_567981 ?auto_567986 ) ) ( not ( = ?auto_567981 ?auto_567987 ) ) ( not ( = ?auto_567981 ?auto_567988 ) ) ( not ( = ?auto_567982 ?auto_567983 ) ) ( not ( = ?auto_567982 ?auto_567984 ) ) ( not ( = ?auto_567982 ?auto_567985 ) ) ( not ( = ?auto_567982 ?auto_567986 ) ) ( not ( = ?auto_567982 ?auto_567987 ) ) ( not ( = ?auto_567982 ?auto_567988 ) ) ( not ( = ?auto_567983 ?auto_567984 ) ) ( not ( = ?auto_567983 ?auto_567985 ) ) ( not ( = ?auto_567983 ?auto_567986 ) ) ( not ( = ?auto_567983 ?auto_567987 ) ) ( not ( = ?auto_567983 ?auto_567988 ) ) ( not ( = ?auto_567984 ?auto_567985 ) ) ( not ( = ?auto_567984 ?auto_567986 ) ) ( not ( = ?auto_567984 ?auto_567987 ) ) ( not ( = ?auto_567984 ?auto_567988 ) ) ( not ( = ?auto_567985 ?auto_567986 ) ) ( not ( = ?auto_567985 ?auto_567987 ) ) ( not ( = ?auto_567985 ?auto_567988 ) ) ( not ( = ?auto_567986 ?auto_567987 ) ) ( not ( = ?auto_567986 ?auto_567988 ) ) ( not ( = ?auto_567987 ?auto_567988 ) ) ( ON ?auto_567986 ?auto_567987 ) ( ON ?auto_567985 ?auto_567986 ) ( ON ?auto_567984 ?auto_567985 ) ( ON ?auto_567983 ?auto_567984 ) ( ON ?auto_567982 ?auto_567983 ) ( ON ?auto_567981 ?auto_567982 ) ( ON ?auto_567980 ?auto_567981 ) ( ON ?auto_567979 ?auto_567980 ) ( ON ?auto_567978 ?auto_567979 ) ( CLEAR ?auto_567976 ) ( ON ?auto_567977 ?auto_567978 ) ( CLEAR ?auto_567977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_567976 ?auto_567977 )
      ( MAKE-12PILE ?auto_567976 ?auto_567977 ?auto_567978 ?auto_567979 ?auto_567980 ?auto_567981 ?auto_567982 ?auto_567983 ?auto_567984 ?auto_567985 ?auto_567986 ?auto_567987 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_568026 - BLOCK
      ?auto_568027 - BLOCK
      ?auto_568028 - BLOCK
      ?auto_568029 - BLOCK
      ?auto_568030 - BLOCK
      ?auto_568031 - BLOCK
      ?auto_568032 - BLOCK
      ?auto_568033 - BLOCK
      ?auto_568034 - BLOCK
      ?auto_568035 - BLOCK
      ?auto_568036 - BLOCK
      ?auto_568037 - BLOCK
    )
    :vars
    (
      ?auto_568038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_568037 ?auto_568038 ) ( not ( = ?auto_568026 ?auto_568027 ) ) ( not ( = ?auto_568026 ?auto_568028 ) ) ( not ( = ?auto_568026 ?auto_568029 ) ) ( not ( = ?auto_568026 ?auto_568030 ) ) ( not ( = ?auto_568026 ?auto_568031 ) ) ( not ( = ?auto_568026 ?auto_568032 ) ) ( not ( = ?auto_568026 ?auto_568033 ) ) ( not ( = ?auto_568026 ?auto_568034 ) ) ( not ( = ?auto_568026 ?auto_568035 ) ) ( not ( = ?auto_568026 ?auto_568036 ) ) ( not ( = ?auto_568026 ?auto_568037 ) ) ( not ( = ?auto_568026 ?auto_568038 ) ) ( not ( = ?auto_568027 ?auto_568028 ) ) ( not ( = ?auto_568027 ?auto_568029 ) ) ( not ( = ?auto_568027 ?auto_568030 ) ) ( not ( = ?auto_568027 ?auto_568031 ) ) ( not ( = ?auto_568027 ?auto_568032 ) ) ( not ( = ?auto_568027 ?auto_568033 ) ) ( not ( = ?auto_568027 ?auto_568034 ) ) ( not ( = ?auto_568027 ?auto_568035 ) ) ( not ( = ?auto_568027 ?auto_568036 ) ) ( not ( = ?auto_568027 ?auto_568037 ) ) ( not ( = ?auto_568027 ?auto_568038 ) ) ( not ( = ?auto_568028 ?auto_568029 ) ) ( not ( = ?auto_568028 ?auto_568030 ) ) ( not ( = ?auto_568028 ?auto_568031 ) ) ( not ( = ?auto_568028 ?auto_568032 ) ) ( not ( = ?auto_568028 ?auto_568033 ) ) ( not ( = ?auto_568028 ?auto_568034 ) ) ( not ( = ?auto_568028 ?auto_568035 ) ) ( not ( = ?auto_568028 ?auto_568036 ) ) ( not ( = ?auto_568028 ?auto_568037 ) ) ( not ( = ?auto_568028 ?auto_568038 ) ) ( not ( = ?auto_568029 ?auto_568030 ) ) ( not ( = ?auto_568029 ?auto_568031 ) ) ( not ( = ?auto_568029 ?auto_568032 ) ) ( not ( = ?auto_568029 ?auto_568033 ) ) ( not ( = ?auto_568029 ?auto_568034 ) ) ( not ( = ?auto_568029 ?auto_568035 ) ) ( not ( = ?auto_568029 ?auto_568036 ) ) ( not ( = ?auto_568029 ?auto_568037 ) ) ( not ( = ?auto_568029 ?auto_568038 ) ) ( not ( = ?auto_568030 ?auto_568031 ) ) ( not ( = ?auto_568030 ?auto_568032 ) ) ( not ( = ?auto_568030 ?auto_568033 ) ) ( not ( = ?auto_568030 ?auto_568034 ) ) ( not ( = ?auto_568030 ?auto_568035 ) ) ( not ( = ?auto_568030 ?auto_568036 ) ) ( not ( = ?auto_568030 ?auto_568037 ) ) ( not ( = ?auto_568030 ?auto_568038 ) ) ( not ( = ?auto_568031 ?auto_568032 ) ) ( not ( = ?auto_568031 ?auto_568033 ) ) ( not ( = ?auto_568031 ?auto_568034 ) ) ( not ( = ?auto_568031 ?auto_568035 ) ) ( not ( = ?auto_568031 ?auto_568036 ) ) ( not ( = ?auto_568031 ?auto_568037 ) ) ( not ( = ?auto_568031 ?auto_568038 ) ) ( not ( = ?auto_568032 ?auto_568033 ) ) ( not ( = ?auto_568032 ?auto_568034 ) ) ( not ( = ?auto_568032 ?auto_568035 ) ) ( not ( = ?auto_568032 ?auto_568036 ) ) ( not ( = ?auto_568032 ?auto_568037 ) ) ( not ( = ?auto_568032 ?auto_568038 ) ) ( not ( = ?auto_568033 ?auto_568034 ) ) ( not ( = ?auto_568033 ?auto_568035 ) ) ( not ( = ?auto_568033 ?auto_568036 ) ) ( not ( = ?auto_568033 ?auto_568037 ) ) ( not ( = ?auto_568033 ?auto_568038 ) ) ( not ( = ?auto_568034 ?auto_568035 ) ) ( not ( = ?auto_568034 ?auto_568036 ) ) ( not ( = ?auto_568034 ?auto_568037 ) ) ( not ( = ?auto_568034 ?auto_568038 ) ) ( not ( = ?auto_568035 ?auto_568036 ) ) ( not ( = ?auto_568035 ?auto_568037 ) ) ( not ( = ?auto_568035 ?auto_568038 ) ) ( not ( = ?auto_568036 ?auto_568037 ) ) ( not ( = ?auto_568036 ?auto_568038 ) ) ( not ( = ?auto_568037 ?auto_568038 ) ) ( ON ?auto_568036 ?auto_568037 ) ( ON ?auto_568035 ?auto_568036 ) ( ON ?auto_568034 ?auto_568035 ) ( ON ?auto_568033 ?auto_568034 ) ( ON ?auto_568032 ?auto_568033 ) ( ON ?auto_568031 ?auto_568032 ) ( ON ?auto_568030 ?auto_568031 ) ( ON ?auto_568029 ?auto_568030 ) ( ON ?auto_568028 ?auto_568029 ) ( ON ?auto_568027 ?auto_568028 ) ( ON ?auto_568026 ?auto_568027 ) ( CLEAR ?auto_568026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_568026 )
      ( MAKE-12PILE ?auto_568026 ?auto_568027 ?auto_568028 ?auto_568029 ?auto_568030 ?auto_568031 ?auto_568032 ?auto_568033 ?auto_568034 ?auto_568035 ?auto_568036 ?auto_568037 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_568077 - BLOCK
      ?auto_568078 - BLOCK
      ?auto_568079 - BLOCK
      ?auto_568080 - BLOCK
      ?auto_568081 - BLOCK
      ?auto_568082 - BLOCK
      ?auto_568083 - BLOCK
      ?auto_568084 - BLOCK
      ?auto_568085 - BLOCK
      ?auto_568086 - BLOCK
      ?auto_568087 - BLOCK
      ?auto_568088 - BLOCK
      ?auto_568089 - BLOCK
    )
    :vars
    (
      ?auto_568090 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_568088 ) ( ON ?auto_568089 ?auto_568090 ) ( CLEAR ?auto_568089 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_568077 ) ( ON ?auto_568078 ?auto_568077 ) ( ON ?auto_568079 ?auto_568078 ) ( ON ?auto_568080 ?auto_568079 ) ( ON ?auto_568081 ?auto_568080 ) ( ON ?auto_568082 ?auto_568081 ) ( ON ?auto_568083 ?auto_568082 ) ( ON ?auto_568084 ?auto_568083 ) ( ON ?auto_568085 ?auto_568084 ) ( ON ?auto_568086 ?auto_568085 ) ( ON ?auto_568087 ?auto_568086 ) ( ON ?auto_568088 ?auto_568087 ) ( not ( = ?auto_568077 ?auto_568078 ) ) ( not ( = ?auto_568077 ?auto_568079 ) ) ( not ( = ?auto_568077 ?auto_568080 ) ) ( not ( = ?auto_568077 ?auto_568081 ) ) ( not ( = ?auto_568077 ?auto_568082 ) ) ( not ( = ?auto_568077 ?auto_568083 ) ) ( not ( = ?auto_568077 ?auto_568084 ) ) ( not ( = ?auto_568077 ?auto_568085 ) ) ( not ( = ?auto_568077 ?auto_568086 ) ) ( not ( = ?auto_568077 ?auto_568087 ) ) ( not ( = ?auto_568077 ?auto_568088 ) ) ( not ( = ?auto_568077 ?auto_568089 ) ) ( not ( = ?auto_568077 ?auto_568090 ) ) ( not ( = ?auto_568078 ?auto_568079 ) ) ( not ( = ?auto_568078 ?auto_568080 ) ) ( not ( = ?auto_568078 ?auto_568081 ) ) ( not ( = ?auto_568078 ?auto_568082 ) ) ( not ( = ?auto_568078 ?auto_568083 ) ) ( not ( = ?auto_568078 ?auto_568084 ) ) ( not ( = ?auto_568078 ?auto_568085 ) ) ( not ( = ?auto_568078 ?auto_568086 ) ) ( not ( = ?auto_568078 ?auto_568087 ) ) ( not ( = ?auto_568078 ?auto_568088 ) ) ( not ( = ?auto_568078 ?auto_568089 ) ) ( not ( = ?auto_568078 ?auto_568090 ) ) ( not ( = ?auto_568079 ?auto_568080 ) ) ( not ( = ?auto_568079 ?auto_568081 ) ) ( not ( = ?auto_568079 ?auto_568082 ) ) ( not ( = ?auto_568079 ?auto_568083 ) ) ( not ( = ?auto_568079 ?auto_568084 ) ) ( not ( = ?auto_568079 ?auto_568085 ) ) ( not ( = ?auto_568079 ?auto_568086 ) ) ( not ( = ?auto_568079 ?auto_568087 ) ) ( not ( = ?auto_568079 ?auto_568088 ) ) ( not ( = ?auto_568079 ?auto_568089 ) ) ( not ( = ?auto_568079 ?auto_568090 ) ) ( not ( = ?auto_568080 ?auto_568081 ) ) ( not ( = ?auto_568080 ?auto_568082 ) ) ( not ( = ?auto_568080 ?auto_568083 ) ) ( not ( = ?auto_568080 ?auto_568084 ) ) ( not ( = ?auto_568080 ?auto_568085 ) ) ( not ( = ?auto_568080 ?auto_568086 ) ) ( not ( = ?auto_568080 ?auto_568087 ) ) ( not ( = ?auto_568080 ?auto_568088 ) ) ( not ( = ?auto_568080 ?auto_568089 ) ) ( not ( = ?auto_568080 ?auto_568090 ) ) ( not ( = ?auto_568081 ?auto_568082 ) ) ( not ( = ?auto_568081 ?auto_568083 ) ) ( not ( = ?auto_568081 ?auto_568084 ) ) ( not ( = ?auto_568081 ?auto_568085 ) ) ( not ( = ?auto_568081 ?auto_568086 ) ) ( not ( = ?auto_568081 ?auto_568087 ) ) ( not ( = ?auto_568081 ?auto_568088 ) ) ( not ( = ?auto_568081 ?auto_568089 ) ) ( not ( = ?auto_568081 ?auto_568090 ) ) ( not ( = ?auto_568082 ?auto_568083 ) ) ( not ( = ?auto_568082 ?auto_568084 ) ) ( not ( = ?auto_568082 ?auto_568085 ) ) ( not ( = ?auto_568082 ?auto_568086 ) ) ( not ( = ?auto_568082 ?auto_568087 ) ) ( not ( = ?auto_568082 ?auto_568088 ) ) ( not ( = ?auto_568082 ?auto_568089 ) ) ( not ( = ?auto_568082 ?auto_568090 ) ) ( not ( = ?auto_568083 ?auto_568084 ) ) ( not ( = ?auto_568083 ?auto_568085 ) ) ( not ( = ?auto_568083 ?auto_568086 ) ) ( not ( = ?auto_568083 ?auto_568087 ) ) ( not ( = ?auto_568083 ?auto_568088 ) ) ( not ( = ?auto_568083 ?auto_568089 ) ) ( not ( = ?auto_568083 ?auto_568090 ) ) ( not ( = ?auto_568084 ?auto_568085 ) ) ( not ( = ?auto_568084 ?auto_568086 ) ) ( not ( = ?auto_568084 ?auto_568087 ) ) ( not ( = ?auto_568084 ?auto_568088 ) ) ( not ( = ?auto_568084 ?auto_568089 ) ) ( not ( = ?auto_568084 ?auto_568090 ) ) ( not ( = ?auto_568085 ?auto_568086 ) ) ( not ( = ?auto_568085 ?auto_568087 ) ) ( not ( = ?auto_568085 ?auto_568088 ) ) ( not ( = ?auto_568085 ?auto_568089 ) ) ( not ( = ?auto_568085 ?auto_568090 ) ) ( not ( = ?auto_568086 ?auto_568087 ) ) ( not ( = ?auto_568086 ?auto_568088 ) ) ( not ( = ?auto_568086 ?auto_568089 ) ) ( not ( = ?auto_568086 ?auto_568090 ) ) ( not ( = ?auto_568087 ?auto_568088 ) ) ( not ( = ?auto_568087 ?auto_568089 ) ) ( not ( = ?auto_568087 ?auto_568090 ) ) ( not ( = ?auto_568088 ?auto_568089 ) ) ( not ( = ?auto_568088 ?auto_568090 ) ) ( not ( = ?auto_568089 ?auto_568090 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_568089 ?auto_568090 )
      ( !STACK ?auto_568089 ?auto_568088 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_568131 - BLOCK
      ?auto_568132 - BLOCK
      ?auto_568133 - BLOCK
      ?auto_568134 - BLOCK
      ?auto_568135 - BLOCK
      ?auto_568136 - BLOCK
      ?auto_568137 - BLOCK
      ?auto_568138 - BLOCK
      ?auto_568139 - BLOCK
      ?auto_568140 - BLOCK
      ?auto_568141 - BLOCK
      ?auto_568142 - BLOCK
      ?auto_568143 - BLOCK
    )
    :vars
    (
      ?auto_568144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_568143 ?auto_568144 ) ( ON-TABLE ?auto_568131 ) ( ON ?auto_568132 ?auto_568131 ) ( ON ?auto_568133 ?auto_568132 ) ( ON ?auto_568134 ?auto_568133 ) ( ON ?auto_568135 ?auto_568134 ) ( ON ?auto_568136 ?auto_568135 ) ( ON ?auto_568137 ?auto_568136 ) ( ON ?auto_568138 ?auto_568137 ) ( ON ?auto_568139 ?auto_568138 ) ( ON ?auto_568140 ?auto_568139 ) ( ON ?auto_568141 ?auto_568140 ) ( not ( = ?auto_568131 ?auto_568132 ) ) ( not ( = ?auto_568131 ?auto_568133 ) ) ( not ( = ?auto_568131 ?auto_568134 ) ) ( not ( = ?auto_568131 ?auto_568135 ) ) ( not ( = ?auto_568131 ?auto_568136 ) ) ( not ( = ?auto_568131 ?auto_568137 ) ) ( not ( = ?auto_568131 ?auto_568138 ) ) ( not ( = ?auto_568131 ?auto_568139 ) ) ( not ( = ?auto_568131 ?auto_568140 ) ) ( not ( = ?auto_568131 ?auto_568141 ) ) ( not ( = ?auto_568131 ?auto_568142 ) ) ( not ( = ?auto_568131 ?auto_568143 ) ) ( not ( = ?auto_568131 ?auto_568144 ) ) ( not ( = ?auto_568132 ?auto_568133 ) ) ( not ( = ?auto_568132 ?auto_568134 ) ) ( not ( = ?auto_568132 ?auto_568135 ) ) ( not ( = ?auto_568132 ?auto_568136 ) ) ( not ( = ?auto_568132 ?auto_568137 ) ) ( not ( = ?auto_568132 ?auto_568138 ) ) ( not ( = ?auto_568132 ?auto_568139 ) ) ( not ( = ?auto_568132 ?auto_568140 ) ) ( not ( = ?auto_568132 ?auto_568141 ) ) ( not ( = ?auto_568132 ?auto_568142 ) ) ( not ( = ?auto_568132 ?auto_568143 ) ) ( not ( = ?auto_568132 ?auto_568144 ) ) ( not ( = ?auto_568133 ?auto_568134 ) ) ( not ( = ?auto_568133 ?auto_568135 ) ) ( not ( = ?auto_568133 ?auto_568136 ) ) ( not ( = ?auto_568133 ?auto_568137 ) ) ( not ( = ?auto_568133 ?auto_568138 ) ) ( not ( = ?auto_568133 ?auto_568139 ) ) ( not ( = ?auto_568133 ?auto_568140 ) ) ( not ( = ?auto_568133 ?auto_568141 ) ) ( not ( = ?auto_568133 ?auto_568142 ) ) ( not ( = ?auto_568133 ?auto_568143 ) ) ( not ( = ?auto_568133 ?auto_568144 ) ) ( not ( = ?auto_568134 ?auto_568135 ) ) ( not ( = ?auto_568134 ?auto_568136 ) ) ( not ( = ?auto_568134 ?auto_568137 ) ) ( not ( = ?auto_568134 ?auto_568138 ) ) ( not ( = ?auto_568134 ?auto_568139 ) ) ( not ( = ?auto_568134 ?auto_568140 ) ) ( not ( = ?auto_568134 ?auto_568141 ) ) ( not ( = ?auto_568134 ?auto_568142 ) ) ( not ( = ?auto_568134 ?auto_568143 ) ) ( not ( = ?auto_568134 ?auto_568144 ) ) ( not ( = ?auto_568135 ?auto_568136 ) ) ( not ( = ?auto_568135 ?auto_568137 ) ) ( not ( = ?auto_568135 ?auto_568138 ) ) ( not ( = ?auto_568135 ?auto_568139 ) ) ( not ( = ?auto_568135 ?auto_568140 ) ) ( not ( = ?auto_568135 ?auto_568141 ) ) ( not ( = ?auto_568135 ?auto_568142 ) ) ( not ( = ?auto_568135 ?auto_568143 ) ) ( not ( = ?auto_568135 ?auto_568144 ) ) ( not ( = ?auto_568136 ?auto_568137 ) ) ( not ( = ?auto_568136 ?auto_568138 ) ) ( not ( = ?auto_568136 ?auto_568139 ) ) ( not ( = ?auto_568136 ?auto_568140 ) ) ( not ( = ?auto_568136 ?auto_568141 ) ) ( not ( = ?auto_568136 ?auto_568142 ) ) ( not ( = ?auto_568136 ?auto_568143 ) ) ( not ( = ?auto_568136 ?auto_568144 ) ) ( not ( = ?auto_568137 ?auto_568138 ) ) ( not ( = ?auto_568137 ?auto_568139 ) ) ( not ( = ?auto_568137 ?auto_568140 ) ) ( not ( = ?auto_568137 ?auto_568141 ) ) ( not ( = ?auto_568137 ?auto_568142 ) ) ( not ( = ?auto_568137 ?auto_568143 ) ) ( not ( = ?auto_568137 ?auto_568144 ) ) ( not ( = ?auto_568138 ?auto_568139 ) ) ( not ( = ?auto_568138 ?auto_568140 ) ) ( not ( = ?auto_568138 ?auto_568141 ) ) ( not ( = ?auto_568138 ?auto_568142 ) ) ( not ( = ?auto_568138 ?auto_568143 ) ) ( not ( = ?auto_568138 ?auto_568144 ) ) ( not ( = ?auto_568139 ?auto_568140 ) ) ( not ( = ?auto_568139 ?auto_568141 ) ) ( not ( = ?auto_568139 ?auto_568142 ) ) ( not ( = ?auto_568139 ?auto_568143 ) ) ( not ( = ?auto_568139 ?auto_568144 ) ) ( not ( = ?auto_568140 ?auto_568141 ) ) ( not ( = ?auto_568140 ?auto_568142 ) ) ( not ( = ?auto_568140 ?auto_568143 ) ) ( not ( = ?auto_568140 ?auto_568144 ) ) ( not ( = ?auto_568141 ?auto_568142 ) ) ( not ( = ?auto_568141 ?auto_568143 ) ) ( not ( = ?auto_568141 ?auto_568144 ) ) ( not ( = ?auto_568142 ?auto_568143 ) ) ( not ( = ?auto_568142 ?auto_568144 ) ) ( not ( = ?auto_568143 ?auto_568144 ) ) ( CLEAR ?auto_568141 ) ( ON ?auto_568142 ?auto_568143 ) ( CLEAR ?auto_568142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_568131 ?auto_568132 ?auto_568133 ?auto_568134 ?auto_568135 ?auto_568136 ?auto_568137 ?auto_568138 ?auto_568139 ?auto_568140 ?auto_568141 ?auto_568142 )
      ( MAKE-13PILE ?auto_568131 ?auto_568132 ?auto_568133 ?auto_568134 ?auto_568135 ?auto_568136 ?auto_568137 ?auto_568138 ?auto_568139 ?auto_568140 ?auto_568141 ?auto_568142 ?auto_568143 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_568185 - BLOCK
      ?auto_568186 - BLOCK
      ?auto_568187 - BLOCK
      ?auto_568188 - BLOCK
      ?auto_568189 - BLOCK
      ?auto_568190 - BLOCK
      ?auto_568191 - BLOCK
      ?auto_568192 - BLOCK
      ?auto_568193 - BLOCK
      ?auto_568194 - BLOCK
      ?auto_568195 - BLOCK
      ?auto_568196 - BLOCK
      ?auto_568197 - BLOCK
    )
    :vars
    (
      ?auto_568198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_568197 ?auto_568198 ) ( ON-TABLE ?auto_568185 ) ( ON ?auto_568186 ?auto_568185 ) ( ON ?auto_568187 ?auto_568186 ) ( ON ?auto_568188 ?auto_568187 ) ( ON ?auto_568189 ?auto_568188 ) ( ON ?auto_568190 ?auto_568189 ) ( ON ?auto_568191 ?auto_568190 ) ( ON ?auto_568192 ?auto_568191 ) ( ON ?auto_568193 ?auto_568192 ) ( ON ?auto_568194 ?auto_568193 ) ( not ( = ?auto_568185 ?auto_568186 ) ) ( not ( = ?auto_568185 ?auto_568187 ) ) ( not ( = ?auto_568185 ?auto_568188 ) ) ( not ( = ?auto_568185 ?auto_568189 ) ) ( not ( = ?auto_568185 ?auto_568190 ) ) ( not ( = ?auto_568185 ?auto_568191 ) ) ( not ( = ?auto_568185 ?auto_568192 ) ) ( not ( = ?auto_568185 ?auto_568193 ) ) ( not ( = ?auto_568185 ?auto_568194 ) ) ( not ( = ?auto_568185 ?auto_568195 ) ) ( not ( = ?auto_568185 ?auto_568196 ) ) ( not ( = ?auto_568185 ?auto_568197 ) ) ( not ( = ?auto_568185 ?auto_568198 ) ) ( not ( = ?auto_568186 ?auto_568187 ) ) ( not ( = ?auto_568186 ?auto_568188 ) ) ( not ( = ?auto_568186 ?auto_568189 ) ) ( not ( = ?auto_568186 ?auto_568190 ) ) ( not ( = ?auto_568186 ?auto_568191 ) ) ( not ( = ?auto_568186 ?auto_568192 ) ) ( not ( = ?auto_568186 ?auto_568193 ) ) ( not ( = ?auto_568186 ?auto_568194 ) ) ( not ( = ?auto_568186 ?auto_568195 ) ) ( not ( = ?auto_568186 ?auto_568196 ) ) ( not ( = ?auto_568186 ?auto_568197 ) ) ( not ( = ?auto_568186 ?auto_568198 ) ) ( not ( = ?auto_568187 ?auto_568188 ) ) ( not ( = ?auto_568187 ?auto_568189 ) ) ( not ( = ?auto_568187 ?auto_568190 ) ) ( not ( = ?auto_568187 ?auto_568191 ) ) ( not ( = ?auto_568187 ?auto_568192 ) ) ( not ( = ?auto_568187 ?auto_568193 ) ) ( not ( = ?auto_568187 ?auto_568194 ) ) ( not ( = ?auto_568187 ?auto_568195 ) ) ( not ( = ?auto_568187 ?auto_568196 ) ) ( not ( = ?auto_568187 ?auto_568197 ) ) ( not ( = ?auto_568187 ?auto_568198 ) ) ( not ( = ?auto_568188 ?auto_568189 ) ) ( not ( = ?auto_568188 ?auto_568190 ) ) ( not ( = ?auto_568188 ?auto_568191 ) ) ( not ( = ?auto_568188 ?auto_568192 ) ) ( not ( = ?auto_568188 ?auto_568193 ) ) ( not ( = ?auto_568188 ?auto_568194 ) ) ( not ( = ?auto_568188 ?auto_568195 ) ) ( not ( = ?auto_568188 ?auto_568196 ) ) ( not ( = ?auto_568188 ?auto_568197 ) ) ( not ( = ?auto_568188 ?auto_568198 ) ) ( not ( = ?auto_568189 ?auto_568190 ) ) ( not ( = ?auto_568189 ?auto_568191 ) ) ( not ( = ?auto_568189 ?auto_568192 ) ) ( not ( = ?auto_568189 ?auto_568193 ) ) ( not ( = ?auto_568189 ?auto_568194 ) ) ( not ( = ?auto_568189 ?auto_568195 ) ) ( not ( = ?auto_568189 ?auto_568196 ) ) ( not ( = ?auto_568189 ?auto_568197 ) ) ( not ( = ?auto_568189 ?auto_568198 ) ) ( not ( = ?auto_568190 ?auto_568191 ) ) ( not ( = ?auto_568190 ?auto_568192 ) ) ( not ( = ?auto_568190 ?auto_568193 ) ) ( not ( = ?auto_568190 ?auto_568194 ) ) ( not ( = ?auto_568190 ?auto_568195 ) ) ( not ( = ?auto_568190 ?auto_568196 ) ) ( not ( = ?auto_568190 ?auto_568197 ) ) ( not ( = ?auto_568190 ?auto_568198 ) ) ( not ( = ?auto_568191 ?auto_568192 ) ) ( not ( = ?auto_568191 ?auto_568193 ) ) ( not ( = ?auto_568191 ?auto_568194 ) ) ( not ( = ?auto_568191 ?auto_568195 ) ) ( not ( = ?auto_568191 ?auto_568196 ) ) ( not ( = ?auto_568191 ?auto_568197 ) ) ( not ( = ?auto_568191 ?auto_568198 ) ) ( not ( = ?auto_568192 ?auto_568193 ) ) ( not ( = ?auto_568192 ?auto_568194 ) ) ( not ( = ?auto_568192 ?auto_568195 ) ) ( not ( = ?auto_568192 ?auto_568196 ) ) ( not ( = ?auto_568192 ?auto_568197 ) ) ( not ( = ?auto_568192 ?auto_568198 ) ) ( not ( = ?auto_568193 ?auto_568194 ) ) ( not ( = ?auto_568193 ?auto_568195 ) ) ( not ( = ?auto_568193 ?auto_568196 ) ) ( not ( = ?auto_568193 ?auto_568197 ) ) ( not ( = ?auto_568193 ?auto_568198 ) ) ( not ( = ?auto_568194 ?auto_568195 ) ) ( not ( = ?auto_568194 ?auto_568196 ) ) ( not ( = ?auto_568194 ?auto_568197 ) ) ( not ( = ?auto_568194 ?auto_568198 ) ) ( not ( = ?auto_568195 ?auto_568196 ) ) ( not ( = ?auto_568195 ?auto_568197 ) ) ( not ( = ?auto_568195 ?auto_568198 ) ) ( not ( = ?auto_568196 ?auto_568197 ) ) ( not ( = ?auto_568196 ?auto_568198 ) ) ( not ( = ?auto_568197 ?auto_568198 ) ) ( ON ?auto_568196 ?auto_568197 ) ( CLEAR ?auto_568194 ) ( ON ?auto_568195 ?auto_568196 ) ( CLEAR ?auto_568195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_568185 ?auto_568186 ?auto_568187 ?auto_568188 ?auto_568189 ?auto_568190 ?auto_568191 ?auto_568192 ?auto_568193 ?auto_568194 ?auto_568195 )
      ( MAKE-13PILE ?auto_568185 ?auto_568186 ?auto_568187 ?auto_568188 ?auto_568189 ?auto_568190 ?auto_568191 ?auto_568192 ?auto_568193 ?auto_568194 ?auto_568195 ?auto_568196 ?auto_568197 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_568239 - BLOCK
      ?auto_568240 - BLOCK
      ?auto_568241 - BLOCK
      ?auto_568242 - BLOCK
      ?auto_568243 - BLOCK
      ?auto_568244 - BLOCK
      ?auto_568245 - BLOCK
      ?auto_568246 - BLOCK
      ?auto_568247 - BLOCK
      ?auto_568248 - BLOCK
      ?auto_568249 - BLOCK
      ?auto_568250 - BLOCK
      ?auto_568251 - BLOCK
    )
    :vars
    (
      ?auto_568252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_568251 ?auto_568252 ) ( ON-TABLE ?auto_568239 ) ( ON ?auto_568240 ?auto_568239 ) ( ON ?auto_568241 ?auto_568240 ) ( ON ?auto_568242 ?auto_568241 ) ( ON ?auto_568243 ?auto_568242 ) ( ON ?auto_568244 ?auto_568243 ) ( ON ?auto_568245 ?auto_568244 ) ( ON ?auto_568246 ?auto_568245 ) ( ON ?auto_568247 ?auto_568246 ) ( not ( = ?auto_568239 ?auto_568240 ) ) ( not ( = ?auto_568239 ?auto_568241 ) ) ( not ( = ?auto_568239 ?auto_568242 ) ) ( not ( = ?auto_568239 ?auto_568243 ) ) ( not ( = ?auto_568239 ?auto_568244 ) ) ( not ( = ?auto_568239 ?auto_568245 ) ) ( not ( = ?auto_568239 ?auto_568246 ) ) ( not ( = ?auto_568239 ?auto_568247 ) ) ( not ( = ?auto_568239 ?auto_568248 ) ) ( not ( = ?auto_568239 ?auto_568249 ) ) ( not ( = ?auto_568239 ?auto_568250 ) ) ( not ( = ?auto_568239 ?auto_568251 ) ) ( not ( = ?auto_568239 ?auto_568252 ) ) ( not ( = ?auto_568240 ?auto_568241 ) ) ( not ( = ?auto_568240 ?auto_568242 ) ) ( not ( = ?auto_568240 ?auto_568243 ) ) ( not ( = ?auto_568240 ?auto_568244 ) ) ( not ( = ?auto_568240 ?auto_568245 ) ) ( not ( = ?auto_568240 ?auto_568246 ) ) ( not ( = ?auto_568240 ?auto_568247 ) ) ( not ( = ?auto_568240 ?auto_568248 ) ) ( not ( = ?auto_568240 ?auto_568249 ) ) ( not ( = ?auto_568240 ?auto_568250 ) ) ( not ( = ?auto_568240 ?auto_568251 ) ) ( not ( = ?auto_568240 ?auto_568252 ) ) ( not ( = ?auto_568241 ?auto_568242 ) ) ( not ( = ?auto_568241 ?auto_568243 ) ) ( not ( = ?auto_568241 ?auto_568244 ) ) ( not ( = ?auto_568241 ?auto_568245 ) ) ( not ( = ?auto_568241 ?auto_568246 ) ) ( not ( = ?auto_568241 ?auto_568247 ) ) ( not ( = ?auto_568241 ?auto_568248 ) ) ( not ( = ?auto_568241 ?auto_568249 ) ) ( not ( = ?auto_568241 ?auto_568250 ) ) ( not ( = ?auto_568241 ?auto_568251 ) ) ( not ( = ?auto_568241 ?auto_568252 ) ) ( not ( = ?auto_568242 ?auto_568243 ) ) ( not ( = ?auto_568242 ?auto_568244 ) ) ( not ( = ?auto_568242 ?auto_568245 ) ) ( not ( = ?auto_568242 ?auto_568246 ) ) ( not ( = ?auto_568242 ?auto_568247 ) ) ( not ( = ?auto_568242 ?auto_568248 ) ) ( not ( = ?auto_568242 ?auto_568249 ) ) ( not ( = ?auto_568242 ?auto_568250 ) ) ( not ( = ?auto_568242 ?auto_568251 ) ) ( not ( = ?auto_568242 ?auto_568252 ) ) ( not ( = ?auto_568243 ?auto_568244 ) ) ( not ( = ?auto_568243 ?auto_568245 ) ) ( not ( = ?auto_568243 ?auto_568246 ) ) ( not ( = ?auto_568243 ?auto_568247 ) ) ( not ( = ?auto_568243 ?auto_568248 ) ) ( not ( = ?auto_568243 ?auto_568249 ) ) ( not ( = ?auto_568243 ?auto_568250 ) ) ( not ( = ?auto_568243 ?auto_568251 ) ) ( not ( = ?auto_568243 ?auto_568252 ) ) ( not ( = ?auto_568244 ?auto_568245 ) ) ( not ( = ?auto_568244 ?auto_568246 ) ) ( not ( = ?auto_568244 ?auto_568247 ) ) ( not ( = ?auto_568244 ?auto_568248 ) ) ( not ( = ?auto_568244 ?auto_568249 ) ) ( not ( = ?auto_568244 ?auto_568250 ) ) ( not ( = ?auto_568244 ?auto_568251 ) ) ( not ( = ?auto_568244 ?auto_568252 ) ) ( not ( = ?auto_568245 ?auto_568246 ) ) ( not ( = ?auto_568245 ?auto_568247 ) ) ( not ( = ?auto_568245 ?auto_568248 ) ) ( not ( = ?auto_568245 ?auto_568249 ) ) ( not ( = ?auto_568245 ?auto_568250 ) ) ( not ( = ?auto_568245 ?auto_568251 ) ) ( not ( = ?auto_568245 ?auto_568252 ) ) ( not ( = ?auto_568246 ?auto_568247 ) ) ( not ( = ?auto_568246 ?auto_568248 ) ) ( not ( = ?auto_568246 ?auto_568249 ) ) ( not ( = ?auto_568246 ?auto_568250 ) ) ( not ( = ?auto_568246 ?auto_568251 ) ) ( not ( = ?auto_568246 ?auto_568252 ) ) ( not ( = ?auto_568247 ?auto_568248 ) ) ( not ( = ?auto_568247 ?auto_568249 ) ) ( not ( = ?auto_568247 ?auto_568250 ) ) ( not ( = ?auto_568247 ?auto_568251 ) ) ( not ( = ?auto_568247 ?auto_568252 ) ) ( not ( = ?auto_568248 ?auto_568249 ) ) ( not ( = ?auto_568248 ?auto_568250 ) ) ( not ( = ?auto_568248 ?auto_568251 ) ) ( not ( = ?auto_568248 ?auto_568252 ) ) ( not ( = ?auto_568249 ?auto_568250 ) ) ( not ( = ?auto_568249 ?auto_568251 ) ) ( not ( = ?auto_568249 ?auto_568252 ) ) ( not ( = ?auto_568250 ?auto_568251 ) ) ( not ( = ?auto_568250 ?auto_568252 ) ) ( not ( = ?auto_568251 ?auto_568252 ) ) ( ON ?auto_568250 ?auto_568251 ) ( ON ?auto_568249 ?auto_568250 ) ( CLEAR ?auto_568247 ) ( ON ?auto_568248 ?auto_568249 ) ( CLEAR ?auto_568248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_568239 ?auto_568240 ?auto_568241 ?auto_568242 ?auto_568243 ?auto_568244 ?auto_568245 ?auto_568246 ?auto_568247 ?auto_568248 )
      ( MAKE-13PILE ?auto_568239 ?auto_568240 ?auto_568241 ?auto_568242 ?auto_568243 ?auto_568244 ?auto_568245 ?auto_568246 ?auto_568247 ?auto_568248 ?auto_568249 ?auto_568250 ?auto_568251 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_568293 - BLOCK
      ?auto_568294 - BLOCK
      ?auto_568295 - BLOCK
      ?auto_568296 - BLOCK
      ?auto_568297 - BLOCK
      ?auto_568298 - BLOCK
      ?auto_568299 - BLOCK
      ?auto_568300 - BLOCK
      ?auto_568301 - BLOCK
      ?auto_568302 - BLOCK
      ?auto_568303 - BLOCK
      ?auto_568304 - BLOCK
      ?auto_568305 - BLOCK
    )
    :vars
    (
      ?auto_568306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_568305 ?auto_568306 ) ( ON-TABLE ?auto_568293 ) ( ON ?auto_568294 ?auto_568293 ) ( ON ?auto_568295 ?auto_568294 ) ( ON ?auto_568296 ?auto_568295 ) ( ON ?auto_568297 ?auto_568296 ) ( ON ?auto_568298 ?auto_568297 ) ( ON ?auto_568299 ?auto_568298 ) ( ON ?auto_568300 ?auto_568299 ) ( not ( = ?auto_568293 ?auto_568294 ) ) ( not ( = ?auto_568293 ?auto_568295 ) ) ( not ( = ?auto_568293 ?auto_568296 ) ) ( not ( = ?auto_568293 ?auto_568297 ) ) ( not ( = ?auto_568293 ?auto_568298 ) ) ( not ( = ?auto_568293 ?auto_568299 ) ) ( not ( = ?auto_568293 ?auto_568300 ) ) ( not ( = ?auto_568293 ?auto_568301 ) ) ( not ( = ?auto_568293 ?auto_568302 ) ) ( not ( = ?auto_568293 ?auto_568303 ) ) ( not ( = ?auto_568293 ?auto_568304 ) ) ( not ( = ?auto_568293 ?auto_568305 ) ) ( not ( = ?auto_568293 ?auto_568306 ) ) ( not ( = ?auto_568294 ?auto_568295 ) ) ( not ( = ?auto_568294 ?auto_568296 ) ) ( not ( = ?auto_568294 ?auto_568297 ) ) ( not ( = ?auto_568294 ?auto_568298 ) ) ( not ( = ?auto_568294 ?auto_568299 ) ) ( not ( = ?auto_568294 ?auto_568300 ) ) ( not ( = ?auto_568294 ?auto_568301 ) ) ( not ( = ?auto_568294 ?auto_568302 ) ) ( not ( = ?auto_568294 ?auto_568303 ) ) ( not ( = ?auto_568294 ?auto_568304 ) ) ( not ( = ?auto_568294 ?auto_568305 ) ) ( not ( = ?auto_568294 ?auto_568306 ) ) ( not ( = ?auto_568295 ?auto_568296 ) ) ( not ( = ?auto_568295 ?auto_568297 ) ) ( not ( = ?auto_568295 ?auto_568298 ) ) ( not ( = ?auto_568295 ?auto_568299 ) ) ( not ( = ?auto_568295 ?auto_568300 ) ) ( not ( = ?auto_568295 ?auto_568301 ) ) ( not ( = ?auto_568295 ?auto_568302 ) ) ( not ( = ?auto_568295 ?auto_568303 ) ) ( not ( = ?auto_568295 ?auto_568304 ) ) ( not ( = ?auto_568295 ?auto_568305 ) ) ( not ( = ?auto_568295 ?auto_568306 ) ) ( not ( = ?auto_568296 ?auto_568297 ) ) ( not ( = ?auto_568296 ?auto_568298 ) ) ( not ( = ?auto_568296 ?auto_568299 ) ) ( not ( = ?auto_568296 ?auto_568300 ) ) ( not ( = ?auto_568296 ?auto_568301 ) ) ( not ( = ?auto_568296 ?auto_568302 ) ) ( not ( = ?auto_568296 ?auto_568303 ) ) ( not ( = ?auto_568296 ?auto_568304 ) ) ( not ( = ?auto_568296 ?auto_568305 ) ) ( not ( = ?auto_568296 ?auto_568306 ) ) ( not ( = ?auto_568297 ?auto_568298 ) ) ( not ( = ?auto_568297 ?auto_568299 ) ) ( not ( = ?auto_568297 ?auto_568300 ) ) ( not ( = ?auto_568297 ?auto_568301 ) ) ( not ( = ?auto_568297 ?auto_568302 ) ) ( not ( = ?auto_568297 ?auto_568303 ) ) ( not ( = ?auto_568297 ?auto_568304 ) ) ( not ( = ?auto_568297 ?auto_568305 ) ) ( not ( = ?auto_568297 ?auto_568306 ) ) ( not ( = ?auto_568298 ?auto_568299 ) ) ( not ( = ?auto_568298 ?auto_568300 ) ) ( not ( = ?auto_568298 ?auto_568301 ) ) ( not ( = ?auto_568298 ?auto_568302 ) ) ( not ( = ?auto_568298 ?auto_568303 ) ) ( not ( = ?auto_568298 ?auto_568304 ) ) ( not ( = ?auto_568298 ?auto_568305 ) ) ( not ( = ?auto_568298 ?auto_568306 ) ) ( not ( = ?auto_568299 ?auto_568300 ) ) ( not ( = ?auto_568299 ?auto_568301 ) ) ( not ( = ?auto_568299 ?auto_568302 ) ) ( not ( = ?auto_568299 ?auto_568303 ) ) ( not ( = ?auto_568299 ?auto_568304 ) ) ( not ( = ?auto_568299 ?auto_568305 ) ) ( not ( = ?auto_568299 ?auto_568306 ) ) ( not ( = ?auto_568300 ?auto_568301 ) ) ( not ( = ?auto_568300 ?auto_568302 ) ) ( not ( = ?auto_568300 ?auto_568303 ) ) ( not ( = ?auto_568300 ?auto_568304 ) ) ( not ( = ?auto_568300 ?auto_568305 ) ) ( not ( = ?auto_568300 ?auto_568306 ) ) ( not ( = ?auto_568301 ?auto_568302 ) ) ( not ( = ?auto_568301 ?auto_568303 ) ) ( not ( = ?auto_568301 ?auto_568304 ) ) ( not ( = ?auto_568301 ?auto_568305 ) ) ( not ( = ?auto_568301 ?auto_568306 ) ) ( not ( = ?auto_568302 ?auto_568303 ) ) ( not ( = ?auto_568302 ?auto_568304 ) ) ( not ( = ?auto_568302 ?auto_568305 ) ) ( not ( = ?auto_568302 ?auto_568306 ) ) ( not ( = ?auto_568303 ?auto_568304 ) ) ( not ( = ?auto_568303 ?auto_568305 ) ) ( not ( = ?auto_568303 ?auto_568306 ) ) ( not ( = ?auto_568304 ?auto_568305 ) ) ( not ( = ?auto_568304 ?auto_568306 ) ) ( not ( = ?auto_568305 ?auto_568306 ) ) ( ON ?auto_568304 ?auto_568305 ) ( ON ?auto_568303 ?auto_568304 ) ( ON ?auto_568302 ?auto_568303 ) ( CLEAR ?auto_568300 ) ( ON ?auto_568301 ?auto_568302 ) ( CLEAR ?auto_568301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_568293 ?auto_568294 ?auto_568295 ?auto_568296 ?auto_568297 ?auto_568298 ?auto_568299 ?auto_568300 ?auto_568301 )
      ( MAKE-13PILE ?auto_568293 ?auto_568294 ?auto_568295 ?auto_568296 ?auto_568297 ?auto_568298 ?auto_568299 ?auto_568300 ?auto_568301 ?auto_568302 ?auto_568303 ?auto_568304 ?auto_568305 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_568347 - BLOCK
      ?auto_568348 - BLOCK
      ?auto_568349 - BLOCK
      ?auto_568350 - BLOCK
      ?auto_568351 - BLOCK
      ?auto_568352 - BLOCK
      ?auto_568353 - BLOCK
      ?auto_568354 - BLOCK
      ?auto_568355 - BLOCK
      ?auto_568356 - BLOCK
      ?auto_568357 - BLOCK
      ?auto_568358 - BLOCK
      ?auto_568359 - BLOCK
    )
    :vars
    (
      ?auto_568360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_568359 ?auto_568360 ) ( ON-TABLE ?auto_568347 ) ( ON ?auto_568348 ?auto_568347 ) ( ON ?auto_568349 ?auto_568348 ) ( ON ?auto_568350 ?auto_568349 ) ( ON ?auto_568351 ?auto_568350 ) ( ON ?auto_568352 ?auto_568351 ) ( ON ?auto_568353 ?auto_568352 ) ( not ( = ?auto_568347 ?auto_568348 ) ) ( not ( = ?auto_568347 ?auto_568349 ) ) ( not ( = ?auto_568347 ?auto_568350 ) ) ( not ( = ?auto_568347 ?auto_568351 ) ) ( not ( = ?auto_568347 ?auto_568352 ) ) ( not ( = ?auto_568347 ?auto_568353 ) ) ( not ( = ?auto_568347 ?auto_568354 ) ) ( not ( = ?auto_568347 ?auto_568355 ) ) ( not ( = ?auto_568347 ?auto_568356 ) ) ( not ( = ?auto_568347 ?auto_568357 ) ) ( not ( = ?auto_568347 ?auto_568358 ) ) ( not ( = ?auto_568347 ?auto_568359 ) ) ( not ( = ?auto_568347 ?auto_568360 ) ) ( not ( = ?auto_568348 ?auto_568349 ) ) ( not ( = ?auto_568348 ?auto_568350 ) ) ( not ( = ?auto_568348 ?auto_568351 ) ) ( not ( = ?auto_568348 ?auto_568352 ) ) ( not ( = ?auto_568348 ?auto_568353 ) ) ( not ( = ?auto_568348 ?auto_568354 ) ) ( not ( = ?auto_568348 ?auto_568355 ) ) ( not ( = ?auto_568348 ?auto_568356 ) ) ( not ( = ?auto_568348 ?auto_568357 ) ) ( not ( = ?auto_568348 ?auto_568358 ) ) ( not ( = ?auto_568348 ?auto_568359 ) ) ( not ( = ?auto_568348 ?auto_568360 ) ) ( not ( = ?auto_568349 ?auto_568350 ) ) ( not ( = ?auto_568349 ?auto_568351 ) ) ( not ( = ?auto_568349 ?auto_568352 ) ) ( not ( = ?auto_568349 ?auto_568353 ) ) ( not ( = ?auto_568349 ?auto_568354 ) ) ( not ( = ?auto_568349 ?auto_568355 ) ) ( not ( = ?auto_568349 ?auto_568356 ) ) ( not ( = ?auto_568349 ?auto_568357 ) ) ( not ( = ?auto_568349 ?auto_568358 ) ) ( not ( = ?auto_568349 ?auto_568359 ) ) ( not ( = ?auto_568349 ?auto_568360 ) ) ( not ( = ?auto_568350 ?auto_568351 ) ) ( not ( = ?auto_568350 ?auto_568352 ) ) ( not ( = ?auto_568350 ?auto_568353 ) ) ( not ( = ?auto_568350 ?auto_568354 ) ) ( not ( = ?auto_568350 ?auto_568355 ) ) ( not ( = ?auto_568350 ?auto_568356 ) ) ( not ( = ?auto_568350 ?auto_568357 ) ) ( not ( = ?auto_568350 ?auto_568358 ) ) ( not ( = ?auto_568350 ?auto_568359 ) ) ( not ( = ?auto_568350 ?auto_568360 ) ) ( not ( = ?auto_568351 ?auto_568352 ) ) ( not ( = ?auto_568351 ?auto_568353 ) ) ( not ( = ?auto_568351 ?auto_568354 ) ) ( not ( = ?auto_568351 ?auto_568355 ) ) ( not ( = ?auto_568351 ?auto_568356 ) ) ( not ( = ?auto_568351 ?auto_568357 ) ) ( not ( = ?auto_568351 ?auto_568358 ) ) ( not ( = ?auto_568351 ?auto_568359 ) ) ( not ( = ?auto_568351 ?auto_568360 ) ) ( not ( = ?auto_568352 ?auto_568353 ) ) ( not ( = ?auto_568352 ?auto_568354 ) ) ( not ( = ?auto_568352 ?auto_568355 ) ) ( not ( = ?auto_568352 ?auto_568356 ) ) ( not ( = ?auto_568352 ?auto_568357 ) ) ( not ( = ?auto_568352 ?auto_568358 ) ) ( not ( = ?auto_568352 ?auto_568359 ) ) ( not ( = ?auto_568352 ?auto_568360 ) ) ( not ( = ?auto_568353 ?auto_568354 ) ) ( not ( = ?auto_568353 ?auto_568355 ) ) ( not ( = ?auto_568353 ?auto_568356 ) ) ( not ( = ?auto_568353 ?auto_568357 ) ) ( not ( = ?auto_568353 ?auto_568358 ) ) ( not ( = ?auto_568353 ?auto_568359 ) ) ( not ( = ?auto_568353 ?auto_568360 ) ) ( not ( = ?auto_568354 ?auto_568355 ) ) ( not ( = ?auto_568354 ?auto_568356 ) ) ( not ( = ?auto_568354 ?auto_568357 ) ) ( not ( = ?auto_568354 ?auto_568358 ) ) ( not ( = ?auto_568354 ?auto_568359 ) ) ( not ( = ?auto_568354 ?auto_568360 ) ) ( not ( = ?auto_568355 ?auto_568356 ) ) ( not ( = ?auto_568355 ?auto_568357 ) ) ( not ( = ?auto_568355 ?auto_568358 ) ) ( not ( = ?auto_568355 ?auto_568359 ) ) ( not ( = ?auto_568355 ?auto_568360 ) ) ( not ( = ?auto_568356 ?auto_568357 ) ) ( not ( = ?auto_568356 ?auto_568358 ) ) ( not ( = ?auto_568356 ?auto_568359 ) ) ( not ( = ?auto_568356 ?auto_568360 ) ) ( not ( = ?auto_568357 ?auto_568358 ) ) ( not ( = ?auto_568357 ?auto_568359 ) ) ( not ( = ?auto_568357 ?auto_568360 ) ) ( not ( = ?auto_568358 ?auto_568359 ) ) ( not ( = ?auto_568358 ?auto_568360 ) ) ( not ( = ?auto_568359 ?auto_568360 ) ) ( ON ?auto_568358 ?auto_568359 ) ( ON ?auto_568357 ?auto_568358 ) ( ON ?auto_568356 ?auto_568357 ) ( ON ?auto_568355 ?auto_568356 ) ( CLEAR ?auto_568353 ) ( ON ?auto_568354 ?auto_568355 ) ( CLEAR ?auto_568354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_568347 ?auto_568348 ?auto_568349 ?auto_568350 ?auto_568351 ?auto_568352 ?auto_568353 ?auto_568354 )
      ( MAKE-13PILE ?auto_568347 ?auto_568348 ?auto_568349 ?auto_568350 ?auto_568351 ?auto_568352 ?auto_568353 ?auto_568354 ?auto_568355 ?auto_568356 ?auto_568357 ?auto_568358 ?auto_568359 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_568401 - BLOCK
      ?auto_568402 - BLOCK
      ?auto_568403 - BLOCK
      ?auto_568404 - BLOCK
      ?auto_568405 - BLOCK
      ?auto_568406 - BLOCK
      ?auto_568407 - BLOCK
      ?auto_568408 - BLOCK
      ?auto_568409 - BLOCK
      ?auto_568410 - BLOCK
      ?auto_568411 - BLOCK
      ?auto_568412 - BLOCK
      ?auto_568413 - BLOCK
    )
    :vars
    (
      ?auto_568414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_568413 ?auto_568414 ) ( ON-TABLE ?auto_568401 ) ( ON ?auto_568402 ?auto_568401 ) ( ON ?auto_568403 ?auto_568402 ) ( ON ?auto_568404 ?auto_568403 ) ( ON ?auto_568405 ?auto_568404 ) ( ON ?auto_568406 ?auto_568405 ) ( not ( = ?auto_568401 ?auto_568402 ) ) ( not ( = ?auto_568401 ?auto_568403 ) ) ( not ( = ?auto_568401 ?auto_568404 ) ) ( not ( = ?auto_568401 ?auto_568405 ) ) ( not ( = ?auto_568401 ?auto_568406 ) ) ( not ( = ?auto_568401 ?auto_568407 ) ) ( not ( = ?auto_568401 ?auto_568408 ) ) ( not ( = ?auto_568401 ?auto_568409 ) ) ( not ( = ?auto_568401 ?auto_568410 ) ) ( not ( = ?auto_568401 ?auto_568411 ) ) ( not ( = ?auto_568401 ?auto_568412 ) ) ( not ( = ?auto_568401 ?auto_568413 ) ) ( not ( = ?auto_568401 ?auto_568414 ) ) ( not ( = ?auto_568402 ?auto_568403 ) ) ( not ( = ?auto_568402 ?auto_568404 ) ) ( not ( = ?auto_568402 ?auto_568405 ) ) ( not ( = ?auto_568402 ?auto_568406 ) ) ( not ( = ?auto_568402 ?auto_568407 ) ) ( not ( = ?auto_568402 ?auto_568408 ) ) ( not ( = ?auto_568402 ?auto_568409 ) ) ( not ( = ?auto_568402 ?auto_568410 ) ) ( not ( = ?auto_568402 ?auto_568411 ) ) ( not ( = ?auto_568402 ?auto_568412 ) ) ( not ( = ?auto_568402 ?auto_568413 ) ) ( not ( = ?auto_568402 ?auto_568414 ) ) ( not ( = ?auto_568403 ?auto_568404 ) ) ( not ( = ?auto_568403 ?auto_568405 ) ) ( not ( = ?auto_568403 ?auto_568406 ) ) ( not ( = ?auto_568403 ?auto_568407 ) ) ( not ( = ?auto_568403 ?auto_568408 ) ) ( not ( = ?auto_568403 ?auto_568409 ) ) ( not ( = ?auto_568403 ?auto_568410 ) ) ( not ( = ?auto_568403 ?auto_568411 ) ) ( not ( = ?auto_568403 ?auto_568412 ) ) ( not ( = ?auto_568403 ?auto_568413 ) ) ( not ( = ?auto_568403 ?auto_568414 ) ) ( not ( = ?auto_568404 ?auto_568405 ) ) ( not ( = ?auto_568404 ?auto_568406 ) ) ( not ( = ?auto_568404 ?auto_568407 ) ) ( not ( = ?auto_568404 ?auto_568408 ) ) ( not ( = ?auto_568404 ?auto_568409 ) ) ( not ( = ?auto_568404 ?auto_568410 ) ) ( not ( = ?auto_568404 ?auto_568411 ) ) ( not ( = ?auto_568404 ?auto_568412 ) ) ( not ( = ?auto_568404 ?auto_568413 ) ) ( not ( = ?auto_568404 ?auto_568414 ) ) ( not ( = ?auto_568405 ?auto_568406 ) ) ( not ( = ?auto_568405 ?auto_568407 ) ) ( not ( = ?auto_568405 ?auto_568408 ) ) ( not ( = ?auto_568405 ?auto_568409 ) ) ( not ( = ?auto_568405 ?auto_568410 ) ) ( not ( = ?auto_568405 ?auto_568411 ) ) ( not ( = ?auto_568405 ?auto_568412 ) ) ( not ( = ?auto_568405 ?auto_568413 ) ) ( not ( = ?auto_568405 ?auto_568414 ) ) ( not ( = ?auto_568406 ?auto_568407 ) ) ( not ( = ?auto_568406 ?auto_568408 ) ) ( not ( = ?auto_568406 ?auto_568409 ) ) ( not ( = ?auto_568406 ?auto_568410 ) ) ( not ( = ?auto_568406 ?auto_568411 ) ) ( not ( = ?auto_568406 ?auto_568412 ) ) ( not ( = ?auto_568406 ?auto_568413 ) ) ( not ( = ?auto_568406 ?auto_568414 ) ) ( not ( = ?auto_568407 ?auto_568408 ) ) ( not ( = ?auto_568407 ?auto_568409 ) ) ( not ( = ?auto_568407 ?auto_568410 ) ) ( not ( = ?auto_568407 ?auto_568411 ) ) ( not ( = ?auto_568407 ?auto_568412 ) ) ( not ( = ?auto_568407 ?auto_568413 ) ) ( not ( = ?auto_568407 ?auto_568414 ) ) ( not ( = ?auto_568408 ?auto_568409 ) ) ( not ( = ?auto_568408 ?auto_568410 ) ) ( not ( = ?auto_568408 ?auto_568411 ) ) ( not ( = ?auto_568408 ?auto_568412 ) ) ( not ( = ?auto_568408 ?auto_568413 ) ) ( not ( = ?auto_568408 ?auto_568414 ) ) ( not ( = ?auto_568409 ?auto_568410 ) ) ( not ( = ?auto_568409 ?auto_568411 ) ) ( not ( = ?auto_568409 ?auto_568412 ) ) ( not ( = ?auto_568409 ?auto_568413 ) ) ( not ( = ?auto_568409 ?auto_568414 ) ) ( not ( = ?auto_568410 ?auto_568411 ) ) ( not ( = ?auto_568410 ?auto_568412 ) ) ( not ( = ?auto_568410 ?auto_568413 ) ) ( not ( = ?auto_568410 ?auto_568414 ) ) ( not ( = ?auto_568411 ?auto_568412 ) ) ( not ( = ?auto_568411 ?auto_568413 ) ) ( not ( = ?auto_568411 ?auto_568414 ) ) ( not ( = ?auto_568412 ?auto_568413 ) ) ( not ( = ?auto_568412 ?auto_568414 ) ) ( not ( = ?auto_568413 ?auto_568414 ) ) ( ON ?auto_568412 ?auto_568413 ) ( ON ?auto_568411 ?auto_568412 ) ( ON ?auto_568410 ?auto_568411 ) ( ON ?auto_568409 ?auto_568410 ) ( ON ?auto_568408 ?auto_568409 ) ( CLEAR ?auto_568406 ) ( ON ?auto_568407 ?auto_568408 ) ( CLEAR ?auto_568407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_568401 ?auto_568402 ?auto_568403 ?auto_568404 ?auto_568405 ?auto_568406 ?auto_568407 )
      ( MAKE-13PILE ?auto_568401 ?auto_568402 ?auto_568403 ?auto_568404 ?auto_568405 ?auto_568406 ?auto_568407 ?auto_568408 ?auto_568409 ?auto_568410 ?auto_568411 ?auto_568412 ?auto_568413 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_568455 - BLOCK
      ?auto_568456 - BLOCK
      ?auto_568457 - BLOCK
      ?auto_568458 - BLOCK
      ?auto_568459 - BLOCK
      ?auto_568460 - BLOCK
      ?auto_568461 - BLOCK
      ?auto_568462 - BLOCK
      ?auto_568463 - BLOCK
      ?auto_568464 - BLOCK
      ?auto_568465 - BLOCK
      ?auto_568466 - BLOCK
      ?auto_568467 - BLOCK
    )
    :vars
    (
      ?auto_568468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_568467 ?auto_568468 ) ( ON-TABLE ?auto_568455 ) ( ON ?auto_568456 ?auto_568455 ) ( ON ?auto_568457 ?auto_568456 ) ( ON ?auto_568458 ?auto_568457 ) ( ON ?auto_568459 ?auto_568458 ) ( not ( = ?auto_568455 ?auto_568456 ) ) ( not ( = ?auto_568455 ?auto_568457 ) ) ( not ( = ?auto_568455 ?auto_568458 ) ) ( not ( = ?auto_568455 ?auto_568459 ) ) ( not ( = ?auto_568455 ?auto_568460 ) ) ( not ( = ?auto_568455 ?auto_568461 ) ) ( not ( = ?auto_568455 ?auto_568462 ) ) ( not ( = ?auto_568455 ?auto_568463 ) ) ( not ( = ?auto_568455 ?auto_568464 ) ) ( not ( = ?auto_568455 ?auto_568465 ) ) ( not ( = ?auto_568455 ?auto_568466 ) ) ( not ( = ?auto_568455 ?auto_568467 ) ) ( not ( = ?auto_568455 ?auto_568468 ) ) ( not ( = ?auto_568456 ?auto_568457 ) ) ( not ( = ?auto_568456 ?auto_568458 ) ) ( not ( = ?auto_568456 ?auto_568459 ) ) ( not ( = ?auto_568456 ?auto_568460 ) ) ( not ( = ?auto_568456 ?auto_568461 ) ) ( not ( = ?auto_568456 ?auto_568462 ) ) ( not ( = ?auto_568456 ?auto_568463 ) ) ( not ( = ?auto_568456 ?auto_568464 ) ) ( not ( = ?auto_568456 ?auto_568465 ) ) ( not ( = ?auto_568456 ?auto_568466 ) ) ( not ( = ?auto_568456 ?auto_568467 ) ) ( not ( = ?auto_568456 ?auto_568468 ) ) ( not ( = ?auto_568457 ?auto_568458 ) ) ( not ( = ?auto_568457 ?auto_568459 ) ) ( not ( = ?auto_568457 ?auto_568460 ) ) ( not ( = ?auto_568457 ?auto_568461 ) ) ( not ( = ?auto_568457 ?auto_568462 ) ) ( not ( = ?auto_568457 ?auto_568463 ) ) ( not ( = ?auto_568457 ?auto_568464 ) ) ( not ( = ?auto_568457 ?auto_568465 ) ) ( not ( = ?auto_568457 ?auto_568466 ) ) ( not ( = ?auto_568457 ?auto_568467 ) ) ( not ( = ?auto_568457 ?auto_568468 ) ) ( not ( = ?auto_568458 ?auto_568459 ) ) ( not ( = ?auto_568458 ?auto_568460 ) ) ( not ( = ?auto_568458 ?auto_568461 ) ) ( not ( = ?auto_568458 ?auto_568462 ) ) ( not ( = ?auto_568458 ?auto_568463 ) ) ( not ( = ?auto_568458 ?auto_568464 ) ) ( not ( = ?auto_568458 ?auto_568465 ) ) ( not ( = ?auto_568458 ?auto_568466 ) ) ( not ( = ?auto_568458 ?auto_568467 ) ) ( not ( = ?auto_568458 ?auto_568468 ) ) ( not ( = ?auto_568459 ?auto_568460 ) ) ( not ( = ?auto_568459 ?auto_568461 ) ) ( not ( = ?auto_568459 ?auto_568462 ) ) ( not ( = ?auto_568459 ?auto_568463 ) ) ( not ( = ?auto_568459 ?auto_568464 ) ) ( not ( = ?auto_568459 ?auto_568465 ) ) ( not ( = ?auto_568459 ?auto_568466 ) ) ( not ( = ?auto_568459 ?auto_568467 ) ) ( not ( = ?auto_568459 ?auto_568468 ) ) ( not ( = ?auto_568460 ?auto_568461 ) ) ( not ( = ?auto_568460 ?auto_568462 ) ) ( not ( = ?auto_568460 ?auto_568463 ) ) ( not ( = ?auto_568460 ?auto_568464 ) ) ( not ( = ?auto_568460 ?auto_568465 ) ) ( not ( = ?auto_568460 ?auto_568466 ) ) ( not ( = ?auto_568460 ?auto_568467 ) ) ( not ( = ?auto_568460 ?auto_568468 ) ) ( not ( = ?auto_568461 ?auto_568462 ) ) ( not ( = ?auto_568461 ?auto_568463 ) ) ( not ( = ?auto_568461 ?auto_568464 ) ) ( not ( = ?auto_568461 ?auto_568465 ) ) ( not ( = ?auto_568461 ?auto_568466 ) ) ( not ( = ?auto_568461 ?auto_568467 ) ) ( not ( = ?auto_568461 ?auto_568468 ) ) ( not ( = ?auto_568462 ?auto_568463 ) ) ( not ( = ?auto_568462 ?auto_568464 ) ) ( not ( = ?auto_568462 ?auto_568465 ) ) ( not ( = ?auto_568462 ?auto_568466 ) ) ( not ( = ?auto_568462 ?auto_568467 ) ) ( not ( = ?auto_568462 ?auto_568468 ) ) ( not ( = ?auto_568463 ?auto_568464 ) ) ( not ( = ?auto_568463 ?auto_568465 ) ) ( not ( = ?auto_568463 ?auto_568466 ) ) ( not ( = ?auto_568463 ?auto_568467 ) ) ( not ( = ?auto_568463 ?auto_568468 ) ) ( not ( = ?auto_568464 ?auto_568465 ) ) ( not ( = ?auto_568464 ?auto_568466 ) ) ( not ( = ?auto_568464 ?auto_568467 ) ) ( not ( = ?auto_568464 ?auto_568468 ) ) ( not ( = ?auto_568465 ?auto_568466 ) ) ( not ( = ?auto_568465 ?auto_568467 ) ) ( not ( = ?auto_568465 ?auto_568468 ) ) ( not ( = ?auto_568466 ?auto_568467 ) ) ( not ( = ?auto_568466 ?auto_568468 ) ) ( not ( = ?auto_568467 ?auto_568468 ) ) ( ON ?auto_568466 ?auto_568467 ) ( ON ?auto_568465 ?auto_568466 ) ( ON ?auto_568464 ?auto_568465 ) ( ON ?auto_568463 ?auto_568464 ) ( ON ?auto_568462 ?auto_568463 ) ( ON ?auto_568461 ?auto_568462 ) ( CLEAR ?auto_568459 ) ( ON ?auto_568460 ?auto_568461 ) ( CLEAR ?auto_568460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_568455 ?auto_568456 ?auto_568457 ?auto_568458 ?auto_568459 ?auto_568460 )
      ( MAKE-13PILE ?auto_568455 ?auto_568456 ?auto_568457 ?auto_568458 ?auto_568459 ?auto_568460 ?auto_568461 ?auto_568462 ?auto_568463 ?auto_568464 ?auto_568465 ?auto_568466 ?auto_568467 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_568509 - BLOCK
      ?auto_568510 - BLOCK
      ?auto_568511 - BLOCK
      ?auto_568512 - BLOCK
      ?auto_568513 - BLOCK
      ?auto_568514 - BLOCK
      ?auto_568515 - BLOCK
      ?auto_568516 - BLOCK
      ?auto_568517 - BLOCK
      ?auto_568518 - BLOCK
      ?auto_568519 - BLOCK
      ?auto_568520 - BLOCK
      ?auto_568521 - BLOCK
    )
    :vars
    (
      ?auto_568522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_568521 ?auto_568522 ) ( ON-TABLE ?auto_568509 ) ( ON ?auto_568510 ?auto_568509 ) ( ON ?auto_568511 ?auto_568510 ) ( ON ?auto_568512 ?auto_568511 ) ( not ( = ?auto_568509 ?auto_568510 ) ) ( not ( = ?auto_568509 ?auto_568511 ) ) ( not ( = ?auto_568509 ?auto_568512 ) ) ( not ( = ?auto_568509 ?auto_568513 ) ) ( not ( = ?auto_568509 ?auto_568514 ) ) ( not ( = ?auto_568509 ?auto_568515 ) ) ( not ( = ?auto_568509 ?auto_568516 ) ) ( not ( = ?auto_568509 ?auto_568517 ) ) ( not ( = ?auto_568509 ?auto_568518 ) ) ( not ( = ?auto_568509 ?auto_568519 ) ) ( not ( = ?auto_568509 ?auto_568520 ) ) ( not ( = ?auto_568509 ?auto_568521 ) ) ( not ( = ?auto_568509 ?auto_568522 ) ) ( not ( = ?auto_568510 ?auto_568511 ) ) ( not ( = ?auto_568510 ?auto_568512 ) ) ( not ( = ?auto_568510 ?auto_568513 ) ) ( not ( = ?auto_568510 ?auto_568514 ) ) ( not ( = ?auto_568510 ?auto_568515 ) ) ( not ( = ?auto_568510 ?auto_568516 ) ) ( not ( = ?auto_568510 ?auto_568517 ) ) ( not ( = ?auto_568510 ?auto_568518 ) ) ( not ( = ?auto_568510 ?auto_568519 ) ) ( not ( = ?auto_568510 ?auto_568520 ) ) ( not ( = ?auto_568510 ?auto_568521 ) ) ( not ( = ?auto_568510 ?auto_568522 ) ) ( not ( = ?auto_568511 ?auto_568512 ) ) ( not ( = ?auto_568511 ?auto_568513 ) ) ( not ( = ?auto_568511 ?auto_568514 ) ) ( not ( = ?auto_568511 ?auto_568515 ) ) ( not ( = ?auto_568511 ?auto_568516 ) ) ( not ( = ?auto_568511 ?auto_568517 ) ) ( not ( = ?auto_568511 ?auto_568518 ) ) ( not ( = ?auto_568511 ?auto_568519 ) ) ( not ( = ?auto_568511 ?auto_568520 ) ) ( not ( = ?auto_568511 ?auto_568521 ) ) ( not ( = ?auto_568511 ?auto_568522 ) ) ( not ( = ?auto_568512 ?auto_568513 ) ) ( not ( = ?auto_568512 ?auto_568514 ) ) ( not ( = ?auto_568512 ?auto_568515 ) ) ( not ( = ?auto_568512 ?auto_568516 ) ) ( not ( = ?auto_568512 ?auto_568517 ) ) ( not ( = ?auto_568512 ?auto_568518 ) ) ( not ( = ?auto_568512 ?auto_568519 ) ) ( not ( = ?auto_568512 ?auto_568520 ) ) ( not ( = ?auto_568512 ?auto_568521 ) ) ( not ( = ?auto_568512 ?auto_568522 ) ) ( not ( = ?auto_568513 ?auto_568514 ) ) ( not ( = ?auto_568513 ?auto_568515 ) ) ( not ( = ?auto_568513 ?auto_568516 ) ) ( not ( = ?auto_568513 ?auto_568517 ) ) ( not ( = ?auto_568513 ?auto_568518 ) ) ( not ( = ?auto_568513 ?auto_568519 ) ) ( not ( = ?auto_568513 ?auto_568520 ) ) ( not ( = ?auto_568513 ?auto_568521 ) ) ( not ( = ?auto_568513 ?auto_568522 ) ) ( not ( = ?auto_568514 ?auto_568515 ) ) ( not ( = ?auto_568514 ?auto_568516 ) ) ( not ( = ?auto_568514 ?auto_568517 ) ) ( not ( = ?auto_568514 ?auto_568518 ) ) ( not ( = ?auto_568514 ?auto_568519 ) ) ( not ( = ?auto_568514 ?auto_568520 ) ) ( not ( = ?auto_568514 ?auto_568521 ) ) ( not ( = ?auto_568514 ?auto_568522 ) ) ( not ( = ?auto_568515 ?auto_568516 ) ) ( not ( = ?auto_568515 ?auto_568517 ) ) ( not ( = ?auto_568515 ?auto_568518 ) ) ( not ( = ?auto_568515 ?auto_568519 ) ) ( not ( = ?auto_568515 ?auto_568520 ) ) ( not ( = ?auto_568515 ?auto_568521 ) ) ( not ( = ?auto_568515 ?auto_568522 ) ) ( not ( = ?auto_568516 ?auto_568517 ) ) ( not ( = ?auto_568516 ?auto_568518 ) ) ( not ( = ?auto_568516 ?auto_568519 ) ) ( not ( = ?auto_568516 ?auto_568520 ) ) ( not ( = ?auto_568516 ?auto_568521 ) ) ( not ( = ?auto_568516 ?auto_568522 ) ) ( not ( = ?auto_568517 ?auto_568518 ) ) ( not ( = ?auto_568517 ?auto_568519 ) ) ( not ( = ?auto_568517 ?auto_568520 ) ) ( not ( = ?auto_568517 ?auto_568521 ) ) ( not ( = ?auto_568517 ?auto_568522 ) ) ( not ( = ?auto_568518 ?auto_568519 ) ) ( not ( = ?auto_568518 ?auto_568520 ) ) ( not ( = ?auto_568518 ?auto_568521 ) ) ( not ( = ?auto_568518 ?auto_568522 ) ) ( not ( = ?auto_568519 ?auto_568520 ) ) ( not ( = ?auto_568519 ?auto_568521 ) ) ( not ( = ?auto_568519 ?auto_568522 ) ) ( not ( = ?auto_568520 ?auto_568521 ) ) ( not ( = ?auto_568520 ?auto_568522 ) ) ( not ( = ?auto_568521 ?auto_568522 ) ) ( ON ?auto_568520 ?auto_568521 ) ( ON ?auto_568519 ?auto_568520 ) ( ON ?auto_568518 ?auto_568519 ) ( ON ?auto_568517 ?auto_568518 ) ( ON ?auto_568516 ?auto_568517 ) ( ON ?auto_568515 ?auto_568516 ) ( ON ?auto_568514 ?auto_568515 ) ( CLEAR ?auto_568512 ) ( ON ?auto_568513 ?auto_568514 ) ( CLEAR ?auto_568513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_568509 ?auto_568510 ?auto_568511 ?auto_568512 ?auto_568513 )
      ( MAKE-13PILE ?auto_568509 ?auto_568510 ?auto_568511 ?auto_568512 ?auto_568513 ?auto_568514 ?auto_568515 ?auto_568516 ?auto_568517 ?auto_568518 ?auto_568519 ?auto_568520 ?auto_568521 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_568563 - BLOCK
      ?auto_568564 - BLOCK
      ?auto_568565 - BLOCK
      ?auto_568566 - BLOCK
      ?auto_568567 - BLOCK
      ?auto_568568 - BLOCK
      ?auto_568569 - BLOCK
      ?auto_568570 - BLOCK
      ?auto_568571 - BLOCK
      ?auto_568572 - BLOCK
      ?auto_568573 - BLOCK
      ?auto_568574 - BLOCK
      ?auto_568575 - BLOCK
    )
    :vars
    (
      ?auto_568576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_568575 ?auto_568576 ) ( ON-TABLE ?auto_568563 ) ( ON ?auto_568564 ?auto_568563 ) ( ON ?auto_568565 ?auto_568564 ) ( not ( = ?auto_568563 ?auto_568564 ) ) ( not ( = ?auto_568563 ?auto_568565 ) ) ( not ( = ?auto_568563 ?auto_568566 ) ) ( not ( = ?auto_568563 ?auto_568567 ) ) ( not ( = ?auto_568563 ?auto_568568 ) ) ( not ( = ?auto_568563 ?auto_568569 ) ) ( not ( = ?auto_568563 ?auto_568570 ) ) ( not ( = ?auto_568563 ?auto_568571 ) ) ( not ( = ?auto_568563 ?auto_568572 ) ) ( not ( = ?auto_568563 ?auto_568573 ) ) ( not ( = ?auto_568563 ?auto_568574 ) ) ( not ( = ?auto_568563 ?auto_568575 ) ) ( not ( = ?auto_568563 ?auto_568576 ) ) ( not ( = ?auto_568564 ?auto_568565 ) ) ( not ( = ?auto_568564 ?auto_568566 ) ) ( not ( = ?auto_568564 ?auto_568567 ) ) ( not ( = ?auto_568564 ?auto_568568 ) ) ( not ( = ?auto_568564 ?auto_568569 ) ) ( not ( = ?auto_568564 ?auto_568570 ) ) ( not ( = ?auto_568564 ?auto_568571 ) ) ( not ( = ?auto_568564 ?auto_568572 ) ) ( not ( = ?auto_568564 ?auto_568573 ) ) ( not ( = ?auto_568564 ?auto_568574 ) ) ( not ( = ?auto_568564 ?auto_568575 ) ) ( not ( = ?auto_568564 ?auto_568576 ) ) ( not ( = ?auto_568565 ?auto_568566 ) ) ( not ( = ?auto_568565 ?auto_568567 ) ) ( not ( = ?auto_568565 ?auto_568568 ) ) ( not ( = ?auto_568565 ?auto_568569 ) ) ( not ( = ?auto_568565 ?auto_568570 ) ) ( not ( = ?auto_568565 ?auto_568571 ) ) ( not ( = ?auto_568565 ?auto_568572 ) ) ( not ( = ?auto_568565 ?auto_568573 ) ) ( not ( = ?auto_568565 ?auto_568574 ) ) ( not ( = ?auto_568565 ?auto_568575 ) ) ( not ( = ?auto_568565 ?auto_568576 ) ) ( not ( = ?auto_568566 ?auto_568567 ) ) ( not ( = ?auto_568566 ?auto_568568 ) ) ( not ( = ?auto_568566 ?auto_568569 ) ) ( not ( = ?auto_568566 ?auto_568570 ) ) ( not ( = ?auto_568566 ?auto_568571 ) ) ( not ( = ?auto_568566 ?auto_568572 ) ) ( not ( = ?auto_568566 ?auto_568573 ) ) ( not ( = ?auto_568566 ?auto_568574 ) ) ( not ( = ?auto_568566 ?auto_568575 ) ) ( not ( = ?auto_568566 ?auto_568576 ) ) ( not ( = ?auto_568567 ?auto_568568 ) ) ( not ( = ?auto_568567 ?auto_568569 ) ) ( not ( = ?auto_568567 ?auto_568570 ) ) ( not ( = ?auto_568567 ?auto_568571 ) ) ( not ( = ?auto_568567 ?auto_568572 ) ) ( not ( = ?auto_568567 ?auto_568573 ) ) ( not ( = ?auto_568567 ?auto_568574 ) ) ( not ( = ?auto_568567 ?auto_568575 ) ) ( not ( = ?auto_568567 ?auto_568576 ) ) ( not ( = ?auto_568568 ?auto_568569 ) ) ( not ( = ?auto_568568 ?auto_568570 ) ) ( not ( = ?auto_568568 ?auto_568571 ) ) ( not ( = ?auto_568568 ?auto_568572 ) ) ( not ( = ?auto_568568 ?auto_568573 ) ) ( not ( = ?auto_568568 ?auto_568574 ) ) ( not ( = ?auto_568568 ?auto_568575 ) ) ( not ( = ?auto_568568 ?auto_568576 ) ) ( not ( = ?auto_568569 ?auto_568570 ) ) ( not ( = ?auto_568569 ?auto_568571 ) ) ( not ( = ?auto_568569 ?auto_568572 ) ) ( not ( = ?auto_568569 ?auto_568573 ) ) ( not ( = ?auto_568569 ?auto_568574 ) ) ( not ( = ?auto_568569 ?auto_568575 ) ) ( not ( = ?auto_568569 ?auto_568576 ) ) ( not ( = ?auto_568570 ?auto_568571 ) ) ( not ( = ?auto_568570 ?auto_568572 ) ) ( not ( = ?auto_568570 ?auto_568573 ) ) ( not ( = ?auto_568570 ?auto_568574 ) ) ( not ( = ?auto_568570 ?auto_568575 ) ) ( not ( = ?auto_568570 ?auto_568576 ) ) ( not ( = ?auto_568571 ?auto_568572 ) ) ( not ( = ?auto_568571 ?auto_568573 ) ) ( not ( = ?auto_568571 ?auto_568574 ) ) ( not ( = ?auto_568571 ?auto_568575 ) ) ( not ( = ?auto_568571 ?auto_568576 ) ) ( not ( = ?auto_568572 ?auto_568573 ) ) ( not ( = ?auto_568572 ?auto_568574 ) ) ( not ( = ?auto_568572 ?auto_568575 ) ) ( not ( = ?auto_568572 ?auto_568576 ) ) ( not ( = ?auto_568573 ?auto_568574 ) ) ( not ( = ?auto_568573 ?auto_568575 ) ) ( not ( = ?auto_568573 ?auto_568576 ) ) ( not ( = ?auto_568574 ?auto_568575 ) ) ( not ( = ?auto_568574 ?auto_568576 ) ) ( not ( = ?auto_568575 ?auto_568576 ) ) ( ON ?auto_568574 ?auto_568575 ) ( ON ?auto_568573 ?auto_568574 ) ( ON ?auto_568572 ?auto_568573 ) ( ON ?auto_568571 ?auto_568572 ) ( ON ?auto_568570 ?auto_568571 ) ( ON ?auto_568569 ?auto_568570 ) ( ON ?auto_568568 ?auto_568569 ) ( ON ?auto_568567 ?auto_568568 ) ( CLEAR ?auto_568565 ) ( ON ?auto_568566 ?auto_568567 ) ( CLEAR ?auto_568566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_568563 ?auto_568564 ?auto_568565 ?auto_568566 )
      ( MAKE-13PILE ?auto_568563 ?auto_568564 ?auto_568565 ?auto_568566 ?auto_568567 ?auto_568568 ?auto_568569 ?auto_568570 ?auto_568571 ?auto_568572 ?auto_568573 ?auto_568574 ?auto_568575 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_568617 - BLOCK
      ?auto_568618 - BLOCK
      ?auto_568619 - BLOCK
      ?auto_568620 - BLOCK
      ?auto_568621 - BLOCK
      ?auto_568622 - BLOCK
      ?auto_568623 - BLOCK
      ?auto_568624 - BLOCK
      ?auto_568625 - BLOCK
      ?auto_568626 - BLOCK
      ?auto_568627 - BLOCK
      ?auto_568628 - BLOCK
      ?auto_568629 - BLOCK
    )
    :vars
    (
      ?auto_568630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_568629 ?auto_568630 ) ( ON-TABLE ?auto_568617 ) ( ON ?auto_568618 ?auto_568617 ) ( not ( = ?auto_568617 ?auto_568618 ) ) ( not ( = ?auto_568617 ?auto_568619 ) ) ( not ( = ?auto_568617 ?auto_568620 ) ) ( not ( = ?auto_568617 ?auto_568621 ) ) ( not ( = ?auto_568617 ?auto_568622 ) ) ( not ( = ?auto_568617 ?auto_568623 ) ) ( not ( = ?auto_568617 ?auto_568624 ) ) ( not ( = ?auto_568617 ?auto_568625 ) ) ( not ( = ?auto_568617 ?auto_568626 ) ) ( not ( = ?auto_568617 ?auto_568627 ) ) ( not ( = ?auto_568617 ?auto_568628 ) ) ( not ( = ?auto_568617 ?auto_568629 ) ) ( not ( = ?auto_568617 ?auto_568630 ) ) ( not ( = ?auto_568618 ?auto_568619 ) ) ( not ( = ?auto_568618 ?auto_568620 ) ) ( not ( = ?auto_568618 ?auto_568621 ) ) ( not ( = ?auto_568618 ?auto_568622 ) ) ( not ( = ?auto_568618 ?auto_568623 ) ) ( not ( = ?auto_568618 ?auto_568624 ) ) ( not ( = ?auto_568618 ?auto_568625 ) ) ( not ( = ?auto_568618 ?auto_568626 ) ) ( not ( = ?auto_568618 ?auto_568627 ) ) ( not ( = ?auto_568618 ?auto_568628 ) ) ( not ( = ?auto_568618 ?auto_568629 ) ) ( not ( = ?auto_568618 ?auto_568630 ) ) ( not ( = ?auto_568619 ?auto_568620 ) ) ( not ( = ?auto_568619 ?auto_568621 ) ) ( not ( = ?auto_568619 ?auto_568622 ) ) ( not ( = ?auto_568619 ?auto_568623 ) ) ( not ( = ?auto_568619 ?auto_568624 ) ) ( not ( = ?auto_568619 ?auto_568625 ) ) ( not ( = ?auto_568619 ?auto_568626 ) ) ( not ( = ?auto_568619 ?auto_568627 ) ) ( not ( = ?auto_568619 ?auto_568628 ) ) ( not ( = ?auto_568619 ?auto_568629 ) ) ( not ( = ?auto_568619 ?auto_568630 ) ) ( not ( = ?auto_568620 ?auto_568621 ) ) ( not ( = ?auto_568620 ?auto_568622 ) ) ( not ( = ?auto_568620 ?auto_568623 ) ) ( not ( = ?auto_568620 ?auto_568624 ) ) ( not ( = ?auto_568620 ?auto_568625 ) ) ( not ( = ?auto_568620 ?auto_568626 ) ) ( not ( = ?auto_568620 ?auto_568627 ) ) ( not ( = ?auto_568620 ?auto_568628 ) ) ( not ( = ?auto_568620 ?auto_568629 ) ) ( not ( = ?auto_568620 ?auto_568630 ) ) ( not ( = ?auto_568621 ?auto_568622 ) ) ( not ( = ?auto_568621 ?auto_568623 ) ) ( not ( = ?auto_568621 ?auto_568624 ) ) ( not ( = ?auto_568621 ?auto_568625 ) ) ( not ( = ?auto_568621 ?auto_568626 ) ) ( not ( = ?auto_568621 ?auto_568627 ) ) ( not ( = ?auto_568621 ?auto_568628 ) ) ( not ( = ?auto_568621 ?auto_568629 ) ) ( not ( = ?auto_568621 ?auto_568630 ) ) ( not ( = ?auto_568622 ?auto_568623 ) ) ( not ( = ?auto_568622 ?auto_568624 ) ) ( not ( = ?auto_568622 ?auto_568625 ) ) ( not ( = ?auto_568622 ?auto_568626 ) ) ( not ( = ?auto_568622 ?auto_568627 ) ) ( not ( = ?auto_568622 ?auto_568628 ) ) ( not ( = ?auto_568622 ?auto_568629 ) ) ( not ( = ?auto_568622 ?auto_568630 ) ) ( not ( = ?auto_568623 ?auto_568624 ) ) ( not ( = ?auto_568623 ?auto_568625 ) ) ( not ( = ?auto_568623 ?auto_568626 ) ) ( not ( = ?auto_568623 ?auto_568627 ) ) ( not ( = ?auto_568623 ?auto_568628 ) ) ( not ( = ?auto_568623 ?auto_568629 ) ) ( not ( = ?auto_568623 ?auto_568630 ) ) ( not ( = ?auto_568624 ?auto_568625 ) ) ( not ( = ?auto_568624 ?auto_568626 ) ) ( not ( = ?auto_568624 ?auto_568627 ) ) ( not ( = ?auto_568624 ?auto_568628 ) ) ( not ( = ?auto_568624 ?auto_568629 ) ) ( not ( = ?auto_568624 ?auto_568630 ) ) ( not ( = ?auto_568625 ?auto_568626 ) ) ( not ( = ?auto_568625 ?auto_568627 ) ) ( not ( = ?auto_568625 ?auto_568628 ) ) ( not ( = ?auto_568625 ?auto_568629 ) ) ( not ( = ?auto_568625 ?auto_568630 ) ) ( not ( = ?auto_568626 ?auto_568627 ) ) ( not ( = ?auto_568626 ?auto_568628 ) ) ( not ( = ?auto_568626 ?auto_568629 ) ) ( not ( = ?auto_568626 ?auto_568630 ) ) ( not ( = ?auto_568627 ?auto_568628 ) ) ( not ( = ?auto_568627 ?auto_568629 ) ) ( not ( = ?auto_568627 ?auto_568630 ) ) ( not ( = ?auto_568628 ?auto_568629 ) ) ( not ( = ?auto_568628 ?auto_568630 ) ) ( not ( = ?auto_568629 ?auto_568630 ) ) ( ON ?auto_568628 ?auto_568629 ) ( ON ?auto_568627 ?auto_568628 ) ( ON ?auto_568626 ?auto_568627 ) ( ON ?auto_568625 ?auto_568626 ) ( ON ?auto_568624 ?auto_568625 ) ( ON ?auto_568623 ?auto_568624 ) ( ON ?auto_568622 ?auto_568623 ) ( ON ?auto_568621 ?auto_568622 ) ( ON ?auto_568620 ?auto_568621 ) ( CLEAR ?auto_568618 ) ( ON ?auto_568619 ?auto_568620 ) ( CLEAR ?auto_568619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_568617 ?auto_568618 ?auto_568619 )
      ( MAKE-13PILE ?auto_568617 ?auto_568618 ?auto_568619 ?auto_568620 ?auto_568621 ?auto_568622 ?auto_568623 ?auto_568624 ?auto_568625 ?auto_568626 ?auto_568627 ?auto_568628 ?auto_568629 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_568671 - BLOCK
      ?auto_568672 - BLOCK
      ?auto_568673 - BLOCK
      ?auto_568674 - BLOCK
      ?auto_568675 - BLOCK
      ?auto_568676 - BLOCK
      ?auto_568677 - BLOCK
      ?auto_568678 - BLOCK
      ?auto_568679 - BLOCK
      ?auto_568680 - BLOCK
      ?auto_568681 - BLOCK
      ?auto_568682 - BLOCK
      ?auto_568683 - BLOCK
    )
    :vars
    (
      ?auto_568684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_568683 ?auto_568684 ) ( ON-TABLE ?auto_568671 ) ( not ( = ?auto_568671 ?auto_568672 ) ) ( not ( = ?auto_568671 ?auto_568673 ) ) ( not ( = ?auto_568671 ?auto_568674 ) ) ( not ( = ?auto_568671 ?auto_568675 ) ) ( not ( = ?auto_568671 ?auto_568676 ) ) ( not ( = ?auto_568671 ?auto_568677 ) ) ( not ( = ?auto_568671 ?auto_568678 ) ) ( not ( = ?auto_568671 ?auto_568679 ) ) ( not ( = ?auto_568671 ?auto_568680 ) ) ( not ( = ?auto_568671 ?auto_568681 ) ) ( not ( = ?auto_568671 ?auto_568682 ) ) ( not ( = ?auto_568671 ?auto_568683 ) ) ( not ( = ?auto_568671 ?auto_568684 ) ) ( not ( = ?auto_568672 ?auto_568673 ) ) ( not ( = ?auto_568672 ?auto_568674 ) ) ( not ( = ?auto_568672 ?auto_568675 ) ) ( not ( = ?auto_568672 ?auto_568676 ) ) ( not ( = ?auto_568672 ?auto_568677 ) ) ( not ( = ?auto_568672 ?auto_568678 ) ) ( not ( = ?auto_568672 ?auto_568679 ) ) ( not ( = ?auto_568672 ?auto_568680 ) ) ( not ( = ?auto_568672 ?auto_568681 ) ) ( not ( = ?auto_568672 ?auto_568682 ) ) ( not ( = ?auto_568672 ?auto_568683 ) ) ( not ( = ?auto_568672 ?auto_568684 ) ) ( not ( = ?auto_568673 ?auto_568674 ) ) ( not ( = ?auto_568673 ?auto_568675 ) ) ( not ( = ?auto_568673 ?auto_568676 ) ) ( not ( = ?auto_568673 ?auto_568677 ) ) ( not ( = ?auto_568673 ?auto_568678 ) ) ( not ( = ?auto_568673 ?auto_568679 ) ) ( not ( = ?auto_568673 ?auto_568680 ) ) ( not ( = ?auto_568673 ?auto_568681 ) ) ( not ( = ?auto_568673 ?auto_568682 ) ) ( not ( = ?auto_568673 ?auto_568683 ) ) ( not ( = ?auto_568673 ?auto_568684 ) ) ( not ( = ?auto_568674 ?auto_568675 ) ) ( not ( = ?auto_568674 ?auto_568676 ) ) ( not ( = ?auto_568674 ?auto_568677 ) ) ( not ( = ?auto_568674 ?auto_568678 ) ) ( not ( = ?auto_568674 ?auto_568679 ) ) ( not ( = ?auto_568674 ?auto_568680 ) ) ( not ( = ?auto_568674 ?auto_568681 ) ) ( not ( = ?auto_568674 ?auto_568682 ) ) ( not ( = ?auto_568674 ?auto_568683 ) ) ( not ( = ?auto_568674 ?auto_568684 ) ) ( not ( = ?auto_568675 ?auto_568676 ) ) ( not ( = ?auto_568675 ?auto_568677 ) ) ( not ( = ?auto_568675 ?auto_568678 ) ) ( not ( = ?auto_568675 ?auto_568679 ) ) ( not ( = ?auto_568675 ?auto_568680 ) ) ( not ( = ?auto_568675 ?auto_568681 ) ) ( not ( = ?auto_568675 ?auto_568682 ) ) ( not ( = ?auto_568675 ?auto_568683 ) ) ( not ( = ?auto_568675 ?auto_568684 ) ) ( not ( = ?auto_568676 ?auto_568677 ) ) ( not ( = ?auto_568676 ?auto_568678 ) ) ( not ( = ?auto_568676 ?auto_568679 ) ) ( not ( = ?auto_568676 ?auto_568680 ) ) ( not ( = ?auto_568676 ?auto_568681 ) ) ( not ( = ?auto_568676 ?auto_568682 ) ) ( not ( = ?auto_568676 ?auto_568683 ) ) ( not ( = ?auto_568676 ?auto_568684 ) ) ( not ( = ?auto_568677 ?auto_568678 ) ) ( not ( = ?auto_568677 ?auto_568679 ) ) ( not ( = ?auto_568677 ?auto_568680 ) ) ( not ( = ?auto_568677 ?auto_568681 ) ) ( not ( = ?auto_568677 ?auto_568682 ) ) ( not ( = ?auto_568677 ?auto_568683 ) ) ( not ( = ?auto_568677 ?auto_568684 ) ) ( not ( = ?auto_568678 ?auto_568679 ) ) ( not ( = ?auto_568678 ?auto_568680 ) ) ( not ( = ?auto_568678 ?auto_568681 ) ) ( not ( = ?auto_568678 ?auto_568682 ) ) ( not ( = ?auto_568678 ?auto_568683 ) ) ( not ( = ?auto_568678 ?auto_568684 ) ) ( not ( = ?auto_568679 ?auto_568680 ) ) ( not ( = ?auto_568679 ?auto_568681 ) ) ( not ( = ?auto_568679 ?auto_568682 ) ) ( not ( = ?auto_568679 ?auto_568683 ) ) ( not ( = ?auto_568679 ?auto_568684 ) ) ( not ( = ?auto_568680 ?auto_568681 ) ) ( not ( = ?auto_568680 ?auto_568682 ) ) ( not ( = ?auto_568680 ?auto_568683 ) ) ( not ( = ?auto_568680 ?auto_568684 ) ) ( not ( = ?auto_568681 ?auto_568682 ) ) ( not ( = ?auto_568681 ?auto_568683 ) ) ( not ( = ?auto_568681 ?auto_568684 ) ) ( not ( = ?auto_568682 ?auto_568683 ) ) ( not ( = ?auto_568682 ?auto_568684 ) ) ( not ( = ?auto_568683 ?auto_568684 ) ) ( ON ?auto_568682 ?auto_568683 ) ( ON ?auto_568681 ?auto_568682 ) ( ON ?auto_568680 ?auto_568681 ) ( ON ?auto_568679 ?auto_568680 ) ( ON ?auto_568678 ?auto_568679 ) ( ON ?auto_568677 ?auto_568678 ) ( ON ?auto_568676 ?auto_568677 ) ( ON ?auto_568675 ?auto_568676 ) ( ON ?auto_568674 ?auto_568675 ) ( ON ?auto_568673 ?auto_568674 ) ( CLEAR ?auto_568671 ) ( ON ?auto_568672 ?auto_568673 ) ( CLEAR ?auto_568672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_568671 ?auto_568672 )
      ( MAKE-13PILE ?auto_568671 ?auto_568672 ?auto_568673 ?auto_568674 ?auto_568675 ?auto_568676 ?auto_568677 ?auto_568678 ?auto_568679 ?auto_568680 ?auto_568681 ?auto_568682 ?auto_568683 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_568725 - BLOCK
      ?auto_568726 - BLOCK
      ?auto_568727 - BLOCK
      ?auto_568728 - BLOCK
      ?auto_568729 - BLOCK
      ?auto_568730 - BLOCK
      ?auto_568731 - BLOCK
      ?auto_568732 - BLOCK
      ?auto_568733 - BLOCK
      ?auto_568734 - BLOCK
      ?auto_568735 - BLOCK
      ?auto_568736 - BLOCK
      ?auto_568737 - BLOCK
    )
    :vars
    (
      ?auto_568738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_568737 ?auto_568738 ) ( not ( = ?auto_568725 ?auto_568726 ) ) ( not ( = ?auto_568725 ?auto_568727 ) ) ( not ( = ?auto_568725 ?auto_568728 ) ) ( not ( = ?auto_568725 ?auto_568729 ) ) ( not ( = ?auto_568725 ?auto_568730 ) ) ( not ( = ?auto_568725 ?auto_568731 ) ) ( not ( = ?auto_568725 ?auto_568732 ) ) ( not ( = ?auto_568725 ?auto_568733 ) ) ( not ( = ?auto_568725 ?auto_568734 ) ) ( not ( = ?auto_568725 ?auto_568735 ) ) ( not ( = ?auto_568725 ?auto_568736 ) ) ( not ( = ?auto_568725 ?auto_568737 ) ) ( not ( = ?auto_568725 ?auto_568738 ) ) ( not ( = ?auto_568726 ?auto_568727 ) ) ( not ( = ?auto_568726 ?auto_568728 ) ) ( not ( = ?auto_568726 ?auto_568729 ) ) ( not ( = ?auto_568726 ?auto_568730 ) ) ( not ( = ?auto_568726 ?auto_568731 ) ) ( not ( = ?auto_568726 ?auto_568732 ) ) ( not ( = ?auto_568726 ?auto_568733 ) ) ( not ( = ?auto_568726 ?auto_568734 ) ) ( not ( = ?auto_568726 ?auto_568735 ) ) ( not ( = ?auto_568726 ?auto_568736 ) ) ( not ( = ?auto_568726 ?auto_568737 ) ) ( not ( = ?auto_568726 ?auto_568738 ) ) ( not ( = ?auto_568727 ?auto_568728 ) ) ( not ( = ?auto_568727 ?auto_568729 ) ) ( not ( = ?auto_568727 ?auto_568730 ) ) ( not ( = ?auto_568727 ?auto_568731 ) ) ( not ( = ?auto_568727 ?auto_568732 ) ) ( not ( = ?auto_568727 ?auto_568733 ) ) ( not ( = ?auto_568727 ?auto_568734 ) ) ( not ( = ?auto_568727 ?auto_568735 ) ) ( not ( = ?auto_568727 ?auto_568736 ) ) ( not ( = ?auto_568727 ?auto_568737 ) ) ( not ( = ?auto_568727 ?auto_568738 ) ) ( not ( = ?auto_568728 ?auto_568729 ) ) ( not ( = ?auto_568728 ?auto_568730 ) ) ( not ( = ?auto_568728 ?auto_568731 ) ) ( not ( = ?auto_568728 ?auto_568732 ) ) ( not ( = ?auto_568728 ?auto_568733 ) ) ( not ( = ?auto_568728 ?auto_568734 ) ) ( not ( = ?auto_568728 ?auto_568735 ) ) ( not ( = ?auto_568728 ?auto_568736 ) ) ( not ( = ?auto_568728 ?auto_568737 ) ) ( not ( = ?auto_568728 ?auto_568738 ) ) ( not ( = ?auto_568729 ?auto_568730 ) ) ( not ( = ?auto_568729 ?auto_568731 ) ) ( not ( = ?auto_568729 ?auto_568732 ) ) ( not ( = ?auto_568729 ?auto_568733 ) ) ( not ( = ?auto_568729 ?auto_568734 ) ) ( not ( = ?auto_568729 ?auto_568735 ) ) ( not ( = ?auto_568729 ?auto_568736 ) ) ( not ( = ?auto_568729 ?auto_568737 ) ) ( not ( = ?auto_568729 ?auto_568738 ) ) ( not ( = ?auto_568730 ?auto_568731 ) ) ( not ( = ?auto_568730 ?auto_568732 ) ) ( not ( = ?auto_568730 ?auto_568733 ) ) ( not ( = ?auto_568730 ?auto_568734 ) ) ( not ( = ?auto_568730 ?auto_568735 ) ) ( not ( = ?auto_568730 ?auto_568736 ) ) ( not ( = ?auto_568730 ?auto_568737 ) ) ( not ( = ?auto_568730 ?auto_568738 ) ) ( not ( = ?auto_568731 ?auto_568732 ) ) ( not ( = ?auto_568731 ?auto_568733 ) ) ( not ( = ?auto_568731 ?auto_568734 ) ) ( not ( = ?auto_568731 ?auto_568735 ) ) ( not ( = ?auto_568731 ?auto_568736 ) ) ( not ( = ?auto_568731 ?auto_568737 ) ) ( not ( = ?auto_568731 ?auto_568738 ) ) ( not ( = ?auto_568732 ?auto_568733 ) ) ( not ( = ?auto_568732 ?auto_568734 ) ) ( not ( = ?auto_568732 ?auto_568735 ) ) ( not ( = ?auto_568732 ?auto_568736 ) ) ( not ( = ?auto_568732 ?auto_568737 ) ) ( not ( = ?auto_568732 ?auto_568738 ) ) ( not ( = ?auto_568733 ?auto_568734 ) ) ( not ( = ?auto_568733 ?auto_568735 ) ) ( not ( = ?auto_568733 ?auto_568736 ) ) ( not ( = ?auto_568733 ?auto_568737 ) ) ( not ( = ?auto_568733 ?auto_568738 ) ) ( not ( = ?auto_568734 ?auto_568735 ) ) ( not ( = ?auto_568734 ?auto_568736 ) ) ( not ( = ?auto_568734 ?auto_568737 ) ) ( not ( = ?auto_568734 ?auto_568738 ) ) ( not ( = ?auto_568735 ?auto_568736 ) ) ( not ( = ?auto_568735 ?auto_568737 ) ) ( not ( = ?auto_568735 ?auto_568738 ) ) ( not ( = ?auto_568736 ?auto_568737 ) ) ( not ( = ?auto_568736 ?auto_568738 ) ) ( not ( = ?auto_568737 ?auto_568738 ) ) ( ON ?auto_568736 ?auto_568737 ) ( ON ?auto_568735 ?auto_568736 ) ( ON ?auto_568734 ?auto_568735 ) ( ON ?auto_568733 ?auto_568734 ) ( ON ?auto_568732 ?auto_568733 ) ( ON ?auto_568731 ?auto_568732 ) ( ON ?auto_568730 ?auto_568731 ) ( ON ?auto_568729 ?auto_568730 ) ( ON ?auto_568728 ?auto_568729 ) ( ON ?auto_568727 ?auto_568728 ) ( ON ?auto_568726 ?auto_568727 ) ( ON ?auto_568725 ?auto_568726 ) ( CLEAR ?auto_568725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_568725 )
      ( MAKE-13PILE ?auto_568725 ?auto_568726 ?auto_568727 ?auto_568728 ?auto_568729 ?auto_568730 ?auto_568731 ?auto_568732 ?auto_568733 ?auto_568734 ?auto_568735 ?auto_568736 ?auto_568737 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_568780 - BLOCK
      ?auto_568781 - BLOCK
      ?auto_568782 - BLOCK
      ?auto_568783 - BLOCK
      ?auto_568784 - BLOCK
      ?auto_568785 - BLOCK
      ?auto_568786 - BLOCK
      ?auto_568787 - BLOCK
      ?auto_568788 - BLOCK
      ?auto_568789 - BLOCK
      ?auto_568790 - BLOCK
      ?auto_568791 - BLOCK
      ?auto_568792 - BLOCK
      ?auto_568793 - BLOCK
    )
    :vars
    (
      ?auto_568794 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_568792 ) ( ON ?auto_568793 ?auto_568794 ) ( CLEAR ?auto_568793 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_568780 ) ( ON ?auto_568781 ?auto_568780 ) ( ON ?auto_568782 ?auto_568781 ) ( ON ?auto_568783 ?auto_568782 ) ( ON ?auto_568784 ?auto_568783 ) ( ON ?auto_568785 ?auto_568784 ) ( ON ?auto_568786 ?auto_568785 ) ( ON ?auto_568787 ?auto_568786 ) ( ON ?auto_568788 ?auto_568787 ) ( ON ?auto_568789 ?auto_568788 ) ( ON ?auto_568790 ?auto_568789 ) ( ON ?auto_568791 ?auto_568790 ) ( ON ?auto_568792 ?auto_568791 ) ( not ( = ?auto_568780 ?auto_568781 ) ) ( not ( = ?auto_568780 ?auto_568782 ) ) ( not ( = ?auto_568780 ?auto_568783 ) ) ( not ( = ?auto_568780 ?auto_568784 ) ) ( not ( = ?auto_568780 ?auto_568785 ) ) ( not ( = ?auto_568780 ?auto_568786 ) ) ( not ( = ?auto_568780 ?auto_568787 ) ) ( not ( = ?auto_568780 ?auto_568788 ) ) ( not ( = ?auto_568780 ?auto_568789 ) ) ( not ( = ?auto_568780 ?auto_568790 ) ) ( not ( = ?auto_568780 ?auto_568791 ) ) ( not ( = ?auto_568780 ?auto_568792 ) ) ( not ( = ?auto_568780 ?auto_568793 ) ) ( not ( = ?auto_568780 ?auto_568794 ) ) ( not ( = ?auto_568781 ?auto_568782 ) ) ( not ( = ?auto_568781 ?auto_568783 ) ) ( not ( = ?auto_568781 ?auto_568784 ) ) ( not ( = ?auto_568781 ?auto_568785 ) ) ( not ( = ?auto_568781 ?auto_568786 ) ) ( not ( = ?auto_568781 ?auto_568787 ) ) ( not ( = ?auto_568781 ?auto_568788 ) ) ( not ( = ?auto_568781 ?auto_568789 ) ) ( not ( = ?auto_568781 ?auto_568790 ) ) ( not ( = ?auto_568781 ?auto_568791 ) ) ( not ( = ?auto_568781 ?auto_568792 ) ) ( not ( = ?auto_568781 ?auto_568793 ) ) ( not ( = ?auto_568781 ?auto_568794 ) ) ( not ( = ?auto_568782 ?auto_568783 ) ) ( not ( = ?auto_568782 ?auto_568784 ) ) ( not ( = ?auto_568782 ?auto_568785 ) ) ( not ( = ?auto_568782 ?auto_568786 ) ) ( not ( = ?auto_568782 ?auto_568787 ) ) ( not ( = ?auto_568782 ?auto_568788 ) ) ( not ( = ?auto_568782 ?auto_568789 ) ) ( not ( = ?auto_568782 ?auto_568790 ) ) ( not ( = ?auto_568782 ?auto_568791 ) ) ( not ( = ?auto_568782 ?auto_568792 ) ) ( not ( = ?auto_568782 ?auto_568793 ) ) ( not ( = ?auto_568782 ?auto_568794 ) ) ( not ( = ?auto_568783 ?auto_568784 ) ) ( not ( = ?auto_568783 ?auto_568785 ) ) ( not ( = ?auto_568783 ?auto_568786 ) ) ( not ( = ?auto_568783 ?auto_568787 ) ) ( not ( = ?auto_568783 ?auto_568788 ) ) ( not ( = ?auto_568783 ?auto_568789 ) ) ( not ( = ?auto_568783 ?auto_568790 ) ) ( not ( = ?auto_568783 ?auto_568791 ) ) ( not ( = ?auto_568783 ?auto_568792 ) ) ( not ( = ?auto_568783 ?auto_568793 ) ) ( not ( = ?auto_568783 ?auto_568794 ) ) ( not ( = ?auto_568784 ?auto_568785 ) ) ( not ( = ?auto_568784 ?auto_568786 ) ) ( not ( = ?auto_568784 ?auto_568787 ) ) ( not ( = ?auto_568784 ?auto_568788 ) ) ( not ( = ?auto_568784 ?auto_568789 ) ) ( not ( = ?auto_568784 ?auto_568790 ) ) ( not ( = ?auto_568784 ?auto_568791 ) ) ( not ( = ?auto_568784 ?auto_568792 ) ) ( not ( = ?auto_568784 ?auto_568793 ) ) ( not ( = ?auto_568784 ?auto_568794 ) ) ( not ( = ?auto_568785 ?auto_568786 ) ) ( not ( = ?auto_568785 ?auto_568787 ) ) ( not ( = ?auto_568785 ?auto_568788 ) ) ( not ( = ?auto_568785 ?auto_568789 ) ) ( not ( = ?auto_568785 ?auto_568790 ) ) ( not ( = ?auto_568785 ?auto_568791 ) ) ( not ( = ?auto_568785 ?auto_568792 ) ) ( not ( = ?auto_568785 ?auto_568793 ) ) ( not ( = ?auto_568785 ?auto_568794 ) ) ( not ( = ?auto_568786 ?auto_568787 ) ) ( not ( = ?auto_568786 ?auto_568788 ) ) ( not ( = ?auto_568786 ?auto_568789 ) ) ( not ( = ?auto_568786 ?auto_568790 ) ) ( not ( = ?auto_568786 ?auto_568791 ) ) ( not ( = ?auto_568786 ?auto_568792 ) ) ( not ( = ?auto_568786 ?auto_568793 ) ) ( not ( = ?auto_568786 ?auto_568794 ) ) ( not ( = ?auto_568787 ?auto_568788 ) ) ( not ( = ?auto_568787 ?auto_568789 ) ) ( not ( = ?auto_568787 ?auto_568790 ) ) ( not ( = ?auto_568787 ?auto_568791 ) ) ( not ( = ?auto_568787 ?auto_568792 ) ) ( not ( = ?auto_568787 ?auto_568793 ) ) ( not ( = ?auto_568787 ?auto_568794 ) ) ( not ( = ?auto_568788 ?auto_568789 ) ) ( not ( = ?auto_568788 ?auto_568790 ) ) ( not ( = ?auto_568788 ?auto_568791 ) ) ( not ( = ?auto_568788 ?auto_568792 ) ) ( not ( = ?auto_568788 ?auto_568793 ) ) ( not ( = ?auto_568788 ?auto_568794 ) ) ( not ( = ?auto_568789 ?auto_568790 ) ) ( not ( = ?auto_568789 ?auto_568791 ) ) ( not ( = ?auto_568789 ?auto_568792 ) ) ( not ( = ?auto_568789 ?auto_568793 ) ) ( not ( = ?auto_568789 ?auto_568794 ) ) ( not ( = ?auto_568790 ?auto_568791 ) ) ( not ( = ?auto_568790 ?auto_568792 ) ) ( not ( = ?auto_568790 ?auto_568793 ) ) ( not ( = ?auto_568790 ?auto_568794 ) ) ( not ( = ?auto_568791 ?auto_568792 ) ) ( not ( = ?auto_568791 ?auto_568793 ) ) ( not ( = ?auto_568791 ?auto_568794 ) ) ( not ( = ?auto_568792 ?auto_568793 ) ) ( not ( = ?auto_568792 ?auto_568794 ) ) ( not ( = ?auto_568793 ?auto_568794 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_568793 ?auto_568794 )
      ( !STACK ?auto_568793 ?auto_568792 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_568838 - BLOCK
      ?auto_568839 - BLOCK
      ?auto_568840 - BLOCK
      ?auto_568841 - BLOCK
      ?auto_568842 - BLOCK
      ?auto_568843 - BLOCK
      ?auto_568844 - BLOCK
      ?auto_568845 - BLOCK
      ?auto_568846 - BLOCK
      ?auto_568847 - BLOCK
      ?auto_568848 - BLOCK
      ?auto_568849 - BLOCK
      ?auto_568850 - BLOCK
      ?auto_568851 - BLOCK
    )
    :vars
    (
      ?auto_568852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_568851 ?auto_568852 ) ( ON-TABLE ?auto_568838 ) ( ON ?auto_568839 ?auto_568838 ) ( ON ?auto_568840 ?auto_568839 ) ( ON ?auto_568841 ?auto_568840 ) ( ON ?auto_568842 ?auto_568841 ) ( ON ?auto_568843 ?auto_568842 ) ( ON ?auto_568844 ?auto_568843 ) ( ON ?auto_568845 ?auto_568844 ) ( ON ?auto_568846 ?auto_568845 ) ( ON ?auto_568847 ?auto_568846 ) ( ON ?auto_568848 ?auto_568847 ) ( ON ?auto_568849 ?auto_568848 ) ( not ( = ?auto_568838 ?auto_568839 ) ) ( not ( = ?auto_568838 ?auto_568840 ) ) ( not ( = ?auto_568838 ?auto_568841 ) ) ( not ( = ?auto_568838 ?auto_568842 ) ) ( not ( = ?auto_568838 ?auto_568843 ) ) ( not ( = ?auto_568838 ?auto_568844 ) ) ( not ( = ?auto_568838 ?auto_568845 ) ) ( not ( = ?auto_568838 ?auto_568846 ) ) ( not ( = ?auto_568838 ?auto_568847 ) ) ( not ( = ?auto_568838 ?auto_568848 ) ) ( not ( = ?auto_568838 ?auto_568849 ) ) ( not ( = ?auto_568838 ?auto_568850 ) ) ( not ( = ?auto_568838 ?auto_568851 ) ) ( not ( = ?auto_568838 ?auto_568852 ) ) ( not ( = ?auto_568839 ?auto_568840 ) ) ( not ( = ?auto_568839 ?auto_568841 ) ) ( not ( = ?auto_568839 ?auto_568842 ) ) ( not ( = ?auto_568839 ?auto_568843 ) ) ( not ( = ?auto_568839 ?auto_568844 ) ) ( not ( = ?auto_568839 ?auto_568845 ) ) ( not ( = ?auto_568839 ?auto_568846 ) ) ( not ( = ?auto_568839 ?auto_568847 ) ) ( not ( = ?auto_568839 ?auto_568848 ) ) ( not ( = ?auto_568839 ?auto_568849 ) ) ( not ( = ?auto_568839 ?auto_568850 ) ) ( not ( = ?auto_568839 ?auto_568851 ) ) ( not ( = ?auto_568839 ?auto_568852 ) ) ( not ( = ?auto_568840 ?auto_568841 ) ) ( not ( = ?auto_568840 ?auto_568842 ) ) ( not ( = ?auto_568840 ?auto_568843 ) ) ( not ( = ?auto_568840 ?auto_568844 ) ) ( not ( = ?auto_568840 ?auto_568845 ) ) ( not ( = ?auto_568840 ?auto_568846 ) ) ( not ( = ?auto_568840 ?auto_568847 ) ) ( not ( = ?auto_568840 ?auto_568848 ) ) ( not ( = ?auto_568840 ?auto_568849 ) ) ( not ( = ?auto_568840 ?auto_568850 ) ) ( not ( = ?auto_568840 ?auto_568851 ) ) ( not ( = ?auto_568840 ?auto_568852 ) ) ( not ( = ?auto_568841 ?auto_568842 ) ) ( not ( = ?auto_568841 ?auto_568843 ) ) ( not ( = ?auto_568841 ?auto_568844 ) ) ( not ( = ?auto_568841 ?auto_568845 ) ) ( not ( = ?auto_568841 ?auto_568846 ) ) ( not ( = ?auto_568841 ?auto_568847 ) ) ( not ( = ?auto_568841 ?auto_568848 ) ) ( not ( = ?auto_568841 ?auto_568849 ) ) ( not ( = ?auto_568841 ?auto_568850 ) ) ( not ( = ?auto_568841 ?auto_568851 ) ) ( not ( = ?auto_568841 ?auto_568852 ) ) ( not ( = ?auto_568842 ?auto_568843 ) ) ( not ( = ?auto_568842 ?auto_568844 ) ) ( not ( = ?auto_568842 ?auto_568845 ) ) ( not ( = ?auto_568842 ?auto_568846 ) ) ( not ( = ?auto_568842 ?auto_568847 ) ) ( not ( = ?auto_568842 ?auto_568848 ) ) ( not ( = ?auto_568842 ?auto_568849 ) ) ( not ( = ?auto_568842 ?auto_568850 ) ) ( not ( = ?auto_568842 ?auto_568851 ) ) ( not ( = ?auto_568842 ?auto_568852 ) ) ( not ( = ?auto_568843 ?auto_568844 ) ) ( not ( = ?auto_568843 ?auto_568845 ) ) ( not ( = ?auto_568843 ?auto_568846 ) ) ( not ( = ?auto_568843 ?auto_568847 ) ) ( not ( = ?auto_568843 ?auto_568848 ) ) ( not ( = ?auto_568843 ?auto_568849 ) ) ( not ( = ?auto_568843 ?auto_568850 ) ) ( not ( = ?auto_568843 ?auto_568851 ) ) ( not ( = ?auto_568843 ?auto_568852 ) ) ( not ( = ?auto_568844 ?auto_568845 ) ) ( not ( = ?auto_568844 ?auto_568846 ) ) ( not ( = ?auto_568844 ?auto_568847 ) ) ( not ( = ?auto_568844 ?auto_568848 ) ) ( not ( = ?auto_568844 ?auto_568849 ) ) ( not ( = ?auto_568844 ?auto_568850 ) ) ( not ( = ?auto_568844 ?auto_568851 ) ) ( not ( = ?auto_568844 ?auto_568852 ) ) ( not ( = ?auto_568845 ?auto_568846 ) ) ( not ( = ?auto_568845 ?auto_568847 ) ) ( not ( = ?auto_568845 ?auto_568848 ) ) ( not ( = ?auto_568845 ?auto_568849 ) ) ( not ( = ?auto_568845 ?auto_568850 ) ) ( not ( = ?auto_568845 ?auto_568851 ) ) ( not ( = ?auto_568845 ?auto_568852 ) ) ( not ( = ?auto_568846 ?auto_568847 ) ) ( not ( = ?auto_568846 ?auto_568848 ) ) ( not ( = ?auto_568846 ?auto_568849 ) ) ( not ( = ?auto_568846 ?auto_568850 ) ) ( not ( = ?auto_568846 ?auto_568851 ) ) ( not ( = ?auto_568846 ?auto_568852 ) ) ( not ( = ?auto_568847 ?auto_568848 ) ) ( not ( = ?auto_568847 ?auto_568849 ) ) ( not ( = ?auto_568847 ?auto_568850 ) ) ( not ( = ?auto_568847 ?auto_568851 ) ) ( not ( = ?auto_568847 ?auto_568852 ) ) ( not ( = ?auto_568848 ?auto_568849 ) ) ( not ( = ?auto_568848 ?auto_568850 ) ) ( not ( = ?auto_568848 ?auto_568851 ) ) ( not ( = ?auto_568848 ?auto_568852 ) ) ( not ( = ?auto_568849 ?auto_568850 ) ) ( not ( = ?auto_568849 ?auto_568851 ) ) ( not ( = ?auto_568849 ?auto_568852 ) ) ( not ( = ?auto_568850 ?auto_568851 ) ) ( not ( = ?auto_568850 ?auto_568852 ) ) ( not ( = ?auto_568851 ?auto_568852 ) ) ( CLEAR ?auto_568849 ) ( ON ?auto_568850 ?auto_568851 ) ( CLEAR ?auto_568850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_568838 ?auto_568839 ?auto_568840 ?auto_568841 ?auto_568842 ?auto_568843 ?auto_568844 ?auto_568845 ?auto_568846 ?auto_568847 ?auto_568848 ?auto_568849 ?auto_568850 )
      ( MAKE-14PILE ?auto_568838 ?auto_568839 ?auto_568840 ?auto_568841 ?auto_568842 ?auto_568843 ?auto_568844 ?auto_568845 ?auto_568846 ?auto_568847 ?auto_568848 ?auto_568849 ?auto_568850 ?auto_568851 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_568896 - BLOCK
      ?auto_568897 - BLOCK
      ?auto_568898 - BLOCK
      ?auto_568899 - BLOCK
      ?auto_568900 - BLOCK
      ?auto_568901 - BLOCK
      ?auto_568902 - BLOCK
      ?auto_568903 - BLOCK
      ?auto_568904 - BLOCK
      ?auto_568905 - BLOCK
      ?auto_568906 - BLOCK
      ?auto_568907 - BLOCK
      ?auto_568908 - BLOCK
      ?auto_568909 - BLOCK
    )
    :vars
    (
      ?auto_568910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_568909 ?auto_568910 ) ( ON-TABLE ?auto_568896 ) ( ON ?auto_568897 ?auto_568896 ) ( ON ?auto_568898 ?auto_568897 ) ( ON ?auto_568899 ?auto_568898 ) ( ON ?auto_568900 ?auto_568899 ) ( ON ?auto_568901 ?auto_568900 ) ( ON ?auto_568902 ?auto_568901 ) ( ON ?auto_568903 ?auto_568902 ) ( ON ?auto_568904 ?auto_568903 ) ( ON ?auto_568905 ?auto_568904 ) ( ON ?auto_568906 ?auto_568905 ) ( not ( = ?auto_568896 ?auto_568897 ) ) ( not ( = ?auto_568896 ?auto_568898 ) ) ( not ( = ?auto_568896 ?auto_568899 ) ) ( not ( = ?auto_568896 ?auto_568900 ) ) ( not ( = ?auto_568896 ?auto_568901 ) ) ( not ( = ?auto_568896 ?auto_568902 ) ) ( not ( = ?auto_568896 ?auto_568903 ) ) ( not ( = ?auto_568896 ?auto_568904 ) ) ( not ( = ?auto_568896 ?auto_568905 ) ) ( not ( = ?auto_568896 ?auto_568906 ) ) ( not ( = ?auto_568896 ?auto_568907 ) ) ( not ( = ?auto_568896 ?auto_568908 ) ) ( not ( = ?auto_568896 ?auto_568909 ) ) ( not ( = ?auto_568896 ?auto_568910 ) ) ( not ( = ?auto_568897 ?auto_568898 ) ) ( not ( = ?auto_568897 ?auto_568899 ) ) ( not ( = ?auto_568897 ?auto_568900 ) ) ( not ( = ?auto_568897 ?auto_568901 ) ) ( not ( = ?auto_568897 ?auto_568902 ) ) ( not ( = ?auto_568897 ?auto_568903 ) ) ( not ( = ?auto_568897 ?auto_568904 ) ) ( not ( = ?auto_568897 ?auto_568905 ) ) ( not ( = ?auto_568897 ?auto_568906 ) ) ( not ( = ?auto_568897 ?auto_568907 ) ) ( not ( = ?auto_568897 ?auto_568908 ) ) ( not ( = ?auto_568897 ?auto_568909 ) ) ( not ( = ?auto_568897 ?auto_568910 ) ) ( not ( = ?auto_568898 ?auto_568899 ) ) ( not ( = ?auto_568898 ?auto_568900 ) ) ( not ( = ?auto_568898 ?auto_568901 ) ) ( not ( = ?auto_568898 ?auto_568902 ) ) ( not ( = ?auto_568898 ?auto_568903 ) ) ( not ( = ?auto_568898 ?auto_568904 ) ) ( not ( = ?auto_568898 ?auto_568905 ) ) ( not ( = ?auto_568898 ?auto_568906 ) ) ( not ( = ?auto_568898 ?auto_568907 ) ) ( not ( = ?auto_568898 ?auto_568908 ) ) ( not ( = ?auto_568898 ?auto_568909 ) ) ( not ( = ?auto_568898 ?auto_568910 ) ) ( not ( = ?auto_568899 ?auto_568900 ) ) ( not ( = ?auto_568899 ?auto_568901 ) ) ( not ( = ?auto_568899 ?auto_568902 ) ) ( not ( = ?auto_568899 ?auto_568903 ) ) ( not ( = ?auto_568899 ?auto_568904 ) ) ( not ( = ?auto_568899 ?auto_568905 ) ) ( not ( = ?auto_568899 ?auto_568906 ) ) ( not ( = ?auto_568899 ?auto_568907 ) ) ( not ( = ?auto_568899 ?auto_568908 ) ) ( not ( = ?auto_568899 ?auto_568909 ) ) ( not ( = ?auto_568899 ?auto_568910 ) ) ( not ( = ?auto_568900 ?auto_568901 ) ) ( not ( = ?auto_568900 ?auto_568902 ) ) ( not ( = ?auto_568900 ?auto_568903 ) ) ( not ( = ?auto_568900 ?auto_568904 ) ) ( not ( = ?auto_568900 ?auto_568905 ) ) ( not ( = ?auto_568900 ?auto_568906 ) ) ( not ( = ?auto_568900 ?auto_568907 ) ) ( not ( = ?auto_568900 ?auto_568908 ) ) ( not ( = ?auto_568900 ?auto_568909 ) ) ( not ( = ?auto_568900 ?auto_568910 ) ) ( not ( = ?auto_568901 ?auto_568902 ) ) ( not ( = ?auto_568901 ?auto_568903 ) ) ( not ( = ?auto_568901 ?auto_568904 ) ) ( not ( = ?auto_568901 ?auto_568905 ) ) ( not ( = ?auto_568901 ?auto_568906 ) ) ( not ( = ?auto_568901 ?auto_568907 ) ) ( not ( = ?auto_568901 ?auto_568908 ) ) ( not ( = ?auto_568901 ?auto_568909 ) ) ( not ( = ?auto_568901 ?auto_568910 ) ) ( not ( = ?auto_568902 ?auto_568903 ) ) ( not ( = ?auto_568902 ?auto_568904 ) ) ( not ( = ?auto_568902 ?auto_568905 ) ) ( not ( = ?auto_568902 ?auto_568906 ) ) ( not ( = ?auto_568902 ?auto_568907 ) ) ( not ( = ?auto_568902 ?auto_568908 ) ) ( not ( = ?auto_568902 ?auto_568909 ) ) ( not ( = ?auto_568902 ?auto_568910 ) ) ( not ( = ?auto_568903 ?auto_568904 ) ) ( not ( = ?auto_568903 ?auto_568905 ) ) ( not ( = ?auto_568903 ?auto_568906 ) ) ( not ( = ?auto_568903 ?auto_568907 ) ) ( not ( = ?auto_568903 ?auto_568908 ) ) ( not ( = ?auto_568903 ?auto_568909 ) ) ( not ( = ?auto_568903 ?auto_568910 ) ) ( not ( = ?auto_568904 ?auto_568905 ) ) ( not ( = ?auto_568904 ?auto_568906 ) ) ( not ( = ?auto_568904 ?auto_568907 ) ) ( not ( = ?auto_568904 ?auto_568908 ) ) ( not ( = ?auto_568904 ?auto_568909 ) ) ( not ( = ?auto_568904 ?auto_568910 ) ) ( not ( = ?auto_568905 ?auto_568906 ) ) ( not ( = ?auto_568905 ?auto_568907 ) ) ( not ( = ?auto_568905 ?auto_568908 ) ) ( not ( = ?auto_568905 ?auto_568909 ) ) ( not ( = ?auto_568905 ?auto_568910 ) ) ( not ( = ?auto_568906 ?auto_568907 ) ) ( not ( = ?auto_568906 ?auto_568908 ) ) ( not ( = ?auto_568906 ?auto_568909 ) ) ( not ( = ?auto_568906 ?auto_568910 ) ) ( not ( = ?auto_568907 ?auto_568908 ) ) ( not ( = ?auto_568907 ?auto_568909 ) ) ( not ( = ?auto_568907 ?auto_568910 ) ) ( not ( = ?auto_568908 ?auto_568909 ) ) ( not ( = ?auto_568908 ?auto_568910 ) ) ( not ( = ?auto_568909 ?auto_568910 ) ) ( ON ?auto_568908 ?auto_568909 ) ( CLEAR ?auto_568906 ) ( ON ?auto_568907 ?auto_568908 ) ( CLEAR ?auto_568907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_568896 ?auto_568897 ?auto_568898 ?auto_568899 ?auto_568900 ?auto_568901 ?auto_568902 ?auto_568903 ?auto_568904 ?auto_568905 ?auto_568906 ?auto_568907 )
      ( MAKE-14PILE ?auto_568896 ?auto_568897 ?auto_568898 ?auto_568899 ?auto_568900 ?auto_568901 ?auto_568902 ?auto_568903 ?auto_568904 ?auto_568905 ?auto_568906 ?auto_568907 ?auto_568908 ?auto_568909 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_568954 - BLOCK
      ?auto_568955 - BLOCK
      ?auto_568956 - BLOCK
      ?auto_568957 - BLOCK
      ?auto_568958 - BLOCK
      ?auto_568959 - BLOCK
      ?auto_568960 - BLOCK
      ?auto_568961 - BLOCK
      ?auto_568962 - BLOCK
      ?auto_568963 - BLOCK
      ?auto_568964 - BLOCK
      ?auto_568965 - BLOCK
      ?auto_568966 - BLOCK
      ?auto_568967 - BLOCK
    )
    :vars
    (
      ?auto_568968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_568967 ?auto_568968 ) ( ON-TABLE ?auto_568954 ) ( ON ?auto_568955 ?auto_568954 ) ( ON ?auto_568956 ?auto_568955 ) ( ON ?auto_568957 ?auto_568956 ) ( ON ?auto_568958 ?auto_568957 ) ( ON ?auto_568959 ?auto_568958 ) ( ON ?auto_568960 ?auto_568959 ) ( ON ?auto_568961 ?auto_568960 ) ( ON ?auto_568962 ?auto_568961 ) ( ON ?auto_568963 ?auto_568962 ) ( not ( = ?auto_568954 ?auto_568955 ) ) ( not ( = ?auto_568954 ?auto_568956 ) ) ( not ( = ?auto_568954 ?auto_568957 ) ) ( not ( = ?auto_568954 ?auto_568958 ) ) ( not ( = ?auto_568954 ?auto_568959 ) ) ( not ( = ?auto_568954 ?auto_568960 ) ) ( not ( = ?auto_568954 ?auto_568961 ) ) ( not ( = ?auto_568954 ?auto_568962 ) ) ( not ( = ?auto_568954 ?auto_568963 ) ) ( not ( = ?auto_568954 ?auto_568964 ) ) ( not ( = ?auto_568954 ?auto_568965 ) ) ( not ( = ?auto_568954 ?auto_568966 ) ) ( not ( = ?auto_568954 ?auto_568967 ) ) ( not ( = ?auto_568954 ?auto_568968 ) ) ( not ( = ?auto_568955 ?auto_568956 ) ) ( not ( = ?auto_568955 ?auto_568957 ) ) ( not ( = ?auto_568955 ?auto_568958 ) ) ( not ( = ?auto_568955 ?auto_568959 ) ) ( not ( = ?auto_568955 ?auto_568960 ) ) ( not ( = ?auto_568955 ?auto_568961 ) ) ( not ( = ?auto_568955 ?auto_568962 ) ) ( not ( = ?auto_568955 ?auto_568963 ) ) ( not ( = ?auto_568955 ?auto_568964 ) ) ( not ( = ?auto_568955 ?auto_568965 ) ) ( not ( = ?auto_568955 ?auto_568966 ) ) ( not ( = ?auto_568955 ?auto_568967 ) ) ( not ( = ?auto_568955 ?auto_568968 ) ) ( not ( = ?auto_568956 ?auto_568957 ) ) ( not ( = ?auto_568956 ?auto_568958 ) ) ( not ( = ?auto_568956 ?auto_568959 ) ) ( not ( = ?auto_568956 ?auto_568960 ) ) ( not ( = ?auto_568956 ?auto_568961 ) ) ( not ( = ?auto_568956 ?auto_568962 ) ) ( not ( = ?auto_568956 ?auto_568963 ) ) ( not ( = ?auto_568956 ?auto_568964 ) ) ( not ( = ?auto_568956 ?auto_568965 ) ) ( not ( = ?auto_568956 ?auto_568966 ) ) ( not ( = ?auto_568956 ?auto_568967 ) ) ( not ( = ?auto_568956 ?auto_568968 ) ) ( not ( = ?auto_568957 ?auto_568958 ) ) ( not ( = ?auto_568957 ?auto_568959 ) ) ( not ( = ?auto_568957 ?auto_568960 ) ) ( not ( = ?auto_568957 ?auto_568961 ) ) ( not ( = ?auto_568957 ?auto_568962 ) ) ( not ( = ?auto_568957 ?auto_568963 ) ) ( not ( = ?auto_568957 ?auto_568964 ) ) ( not ( = ?auto_568957 ?auto_568965 ) ) ( not ( = ?auto_568957 ?auto_568966 ) ) ( not ( = ?auto_568957 ?auto_568967 ) ) ( not ( = ?auto_568957 ?auto_568968 ) ) ( not ( = ?auto_568958 ?auto_568959 ) ) ( not ( = ?auto_568958 ?auto_568960 ) ) ( not ( = ?auto_568958 ?auto_568961 ) ) ( not ( = ?auto_568958 ?auto_568962 ) ) ( not ( = ?auto_568958 ?auto_568963 ) ) ( not ( = ?auto_568958 ?auto_568964 ) ) ( not ( = ?auto_568958 ?auto_568965 ) ) ( not ( = ?auto_568958 ?auto_568966 ) ) ( not ( = ?auto_568958 ?auto_568967 ) ) ( not ( = ?auto_568958 ?auto_568968 ) ) ( not ( = ?auto_568959 ?auto_568960 ) ) ( not ( = ?auto_568959 ?auto_568961 ) ) ( not ( = ?auto_568959 ?auto_568962 ) ) ( not ( = ?auto_568959 ?auto_568963 ) ) ( not ( = ?auto_568959 ?auto_568964 ) ) ( not ( = ?auto_568959 ?auto_568965 ) ) ( not ( = ?auto_568959 ?auto_568966 ) ) ( not ( = ?auto_568959 ?auto_568967 ) ) ( not ( = ?auto_568959 ?auto_568968 ) ) ( not ( = ?auto_568960 ?auto_568961 ) ) ( not ( = ?auto_568960 ?auto_568962 ) ) ( not ( = ?auto_568960 ?auto_568963 ) ) ( not ( = ?auto_568960 ?auto_568964 ) ) ( not ( = ?auto_568960 ?auto_568965 ) ) ( not ( = ?auto_568960 ?auto_568966 ) ) ( not ( = ?auto_568960 ?auto_568967 ) ) ( not ( = ?auto_568960 ?auto_568968 ) ) ( not ( = ?auto_568961 ?auto_568962 ) ) ( not ( = ?auto_568961 ?auto_568963 ) ) ( not ( = ?auto_568961 ?auto_568964 ) ) ( not ( = ?auto_568961 ?auto_568965 ) ) ( not ( = ?auto_568961 ?auto_568966 ) ) ( not ( = ?auto_568961 ?auto_568967 ) ) ( not ( = ?auto_568961 ?auto_568968 ) ) ( not ( = ?auto_568962 ?auto_568963 ) ) ( not ( = ?auto_568962 ?auto_568964 ) ) ( not ( = ?auto_568962 ?auto_568965 ) ) ( not ( = ?auto_568962 ?auto_568966 ) ) ( not ( = ?auto_568962 ?auto_568967 ) ) ( not ( = ?auto_568962 ?auto_568968 ) ) ( not ( = ?auto_568963 ?auto_568964 ) ) ( not ( = ?auto_568963 ?auto_568965 ) ) ( not ( = ?auto_568963 ?auto_568966 ) ) ( not ( = ?auto_568963 ?auto_568967 ) ) ( not ( = ?auto_568963 ?auto_568968 ) ) ( not ( = ?auto_568964 ?auto_568965 ) ) ( not ( = ?auto_568964 ?auto_568966 ) ) ( not ( = ?auto_568964 ?auto_568967 ) ) ( not ( = ?auto_568964 ?auto_568968 ) ) ( not ( = ?auto_568965 ?auto_568966 ) ) ( not ( = ?auto_568965 ?auto_568967 ) ) ( not ( = ?auto_568965 ?auto_568968 ) ) ( not ( = ?auto_568966 ?auto_568967 ) ) ( not ( = ?auto_568966 ?auto_568968 ) ) ( not ( = ?auto_568967 ?auto_568968 ) ) ( ON ?auto_568966 ?auto_568967 ) ( ON ?auto_568965 ?auto_568966 ) ( CLEAR ?auto_568963 ) ( ON ?auto_568964 ?auto_568965 ) ( CLEAR ?auto_568964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_568954 ?auto_568955 ?auto_568956 ?auto_568957 ?auto_568958 ?auto_568959 ?auto_568960 ?auto_568961 ?auto_568962 ?auto_568963 ?auto_568964 )
      ( MAKE-14PILE ?auto_568954 ?auto_568955 ?auto_568956 ?auto_568957 ?auto_568958 ?auto_568959 ?auto_568960 ?auto_568961 ?auto_568962 ?auto_568963 ?auto_568964 ?auto_568965 ?auto_568966 ?auto_568967 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_569012 - BLOCK
      ?auto_569013 - BLOCK
      ?auto_569014 - BLOCK
      ?auto_569015 - BLOCK
      ?auto_569016 - BLOCK
      ?auto_569017 - BLOCK
      ?auto_569018 - BLOCK
      ?auto_569019 - BLOCK
      ?auto_569020 - BLOCK
      ?auto_569021 - BLOCK
      ?auto_569022 - BLOCK
      ?auto_569023 - BLOCK
      ?auto_569024 - BLOCK
      ?auto_569025 - BLOCK
    )
    :vars
    (
      ?auto_569026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_569025 ?auto_569026 ) ( ON-TABLE ?auto_569012 ) ( ON ?auto_569013 ?auto_569012 ) ( ON ?auto_569014 ?auto_569013 ) ( ON ?auto_569015 ?auto_569014 ) ( ON ?auto_569016 ?auto_569015 ) ( ON ?auto_569017 ?auto_569016 ) ( ON ?auto_569018 ?auto_569017 ) ( ON ?auto_569019 ?auto_569018 ) ( ON ?auto_569020 ?auto_569019 ) ( not ( = ?auto_569012 ?auto_569013 ) ) ( not ( = ?auto_569012 ?auto_569014 ) ) ( not ( = ?auto_569012 ?auto_569015 ) ) ( not ( = ?auto_569012 ?auto_569016 ) ) ( not ( = ?auto_569012 ?auto_569017 ) ) ( not ( = ?auto_569012 ?auto_569018 ) ) ( not ( = ?auto_569012 ?auto_569019 ) ) ( not ( = ?auto_569012 ?auto_569020 ) ) ( not ( = ?auto_569012 ?auto_569021 ) ) ( not ( = ?auto_569012 ?auto_569022 ) ) ( not ( = ?auto_569012 ?auto_569023 ) ) ( not ( = ?auto_569012 ?auto_569024 ) ) ( not ( = ?auto_569012 ?auto_569025 ) ) ( not ( = ?auto_569012 ?auto_569026 ) ) ( not ( = ?auto_569013 ?auto_569014 ) ) ( not ( = ?auto_569013 ?auto_569015 ) ) ( not ( = ?auto_569013 ?auto_569016 ) ) ( not ( = ?auto_569013 ?auto_569017 ) ) ( not ( = ?auto_569013 ?auto_569018 ) ) ( not ( = ?auto_569013 ?auto_569019 ) ) ( not ( = ?auto_569013 ?auto_569020 ) ) ( not ( = ?auto_569013 ?auto_569021 ) ) ( not ( = ?auto_569013 ?auto_569022 ) ) ( not ( = ?auto_569013 ?auto_569023 ) ) ( not ( = ?auto_569013 ?auto_569024 ) ) ( not ( = ?auto_569013 ?auto_569025 ) ) ( not ( = ?auto_569013 ?auto_569026 ) ) ( not ( = ?auto_569014 ?auto_569015 ) ) ( not ( = ?auto_569014 ?auto_569016 ) ) ( not ( = ?auto_569014 ?auto_569017 ) ) ( not ( = ?auto_569014 ?auto_569018 ) ) ( not ( = ?auto_569014 ?auto_569019 ) ) ( not ( = ?auto_569014 ?auto_569020 ) ) ( not ( = ?auto_569014 ?auto_569021 ) ) ( not ( = ?auto_569014 ?auto_569022 ) ) ( not ( = ?auto_569014 ?auto_569023 ) ) ( not ( = ?auto_569014 ?auto_569024 ) ) ( not ( = ?auto_569014 ?auto_569025 ) ) ( not ( = ?auto_569014 ?auto_569026 ) ) ( not ( = ?auto_569015 ?auto_569016 ) ) ( not ( = ?auto_569015 ?auto_569017 ) ) ( not ( = ?auto_569015 ?auto_569018 ) ) ( not ( = ?auto_569015 ?auto_569019 ) ) ( not ( = ?auto_569015 ?auto_569020 ) ) ( not ( = ?auto_569015 ?auto_569021 ) ) ( not ( = ?auto_569015 ?auto_569022 ) ) ( not ( = ?auto_569015 ?auto_569023 ) ) ( not ( = ?auto_569015 ?auto_569024 ) ) ( not ( = ?auto_569015 ?auto_569025 ) ) ( not ( = ?auto_569015 ?auto_569026 ) ) ( not ( = ?auto_569016 ?auto_569017 ) ) ( not ( = ?auto_569016 ?auto_569018 ) ) ( not ( = ?auto_569016 ?auto_569019 ) ) ( not ( = ?auto_569016 ?auto_569020 ) ) ( not ( = ?auto_569016 ?auto_569021 ) ) ( not ( = ?auto_569016 ?auto_569022 ) ) ( not ( = ?auto_569016 ?auto_569023 ) ) ( not ( = ?auto_569016 ?auto_569024 ) ) ( not ( = ?auto_569016 ?auto_569025 ) ) ( not ( = ?auto_569016 ?auto_569026 ) ) ( not ( = ?auto_569017 ?auto_569018 ) ) ( not ( = ?auto_569017 ?auto_569019 ) ) ( not ( = ?auto_569017 ?auto_569020 ) ) ( not ( = ?auto_569017 ?auto_569021 ) ) ( not ( = ?auto_569017 ?auto_569022 ) ) ( not ( = ?auto_569017 ?auto_569023 ) ) ( not ( = ?auto_569017 ?auto_569024 ) ) ( not ( = ?auto_569017 ?auto_569025 ) ) ( not ( = ?auto_569017 ?auto_569026 ) ) ( not ( = ?auto_569018 ?auto_569019 ) ) ( not ( = ?auto_569018 ?auto_569020 ) ) ( not ( = ?auto_569018 ?auto_569021 ) ) ( not ( = ?auto_569018 ?auto_569022 ) ) ( not ( = ?auto_569018 ?auto_569023 ) ) ( not ( = ?auto_569018 ?auto_569024 ) ) ( not ( = ?auto_569018 ?auto_569025 ) ) ( not ( = ?auto_569018 ?auto_569026 ) ) ( not ( = ?auto_569019 ?auto_569020 ) ) ( not ( = ?auto_569019 ?auto_569021 ) ) ( not ( = ?auto_569019 ?auto_569022 ) ) ( not ( = ?auto_569019 ?auto_569023 ) ) ( not ( = ?auto_569019 ?auto_569024 ) ) ( not ( = ?auto_569019 ?auto_569025 ) ) ( not ( = ?auto_569019 ?auto_569026 ) ) ( not ( = ?auto_569020 ?auto_569021 ) ) ( not ( = ?auto_569020 ?auto_569022 ) ) ( not ( = ?auto_569020 ?auto_569023 ) ) ( not ( = ?auto_569020 ?auto_569024 ) ) ( not ( = ?auto_569020 ?auto_569025 ) ) ( not ( = ?auto_569020 ?auto_569026 ) ) ( not ( = ?auto_569021 ?auto_569022 ) ) ( not ( = ?auto_569021 ?auto_569023 ) ) ( not ( = ?auto_569021 ?auto_569024 ) ) ( not ( = ?auto_569021 ?auto_569025 ) ) ( not ( = ?auto_569021 ?auto_569026 ) ) ( not ( = ?auto_569022 ?auto_569023 ) ) ( not ( = ?auto_569022 ?auto_569024 ) ) ( not ( = ?auto_569022 ?auto_569025 ) ) ( not ( = ?auto_569022 ?auto_569026 ) ) ( not ( = ?auto_569023 ?auto_569024 ) ) ( not ( = ?auto_569023 ?auto_569025 ) ) ( not ( = ?auto_569023 ?auto_569026 ) ) ( not ( = ?auto_569024 ?auto_569025 ) ) ( not ( = ?auto_569024 ?auto_569026 ) ) ( not ( = ?auto_569025 ?auto_569026 ) ) ( ON ?auto_569024 ?auto_569025 ) ( ON ?auto_569023 ?auto_569024 ) ( ON ?auto_569022 ?auto_569023 ) ( CLEAR ?auto_569020 ) ( ON ?auto_569021 ?auto_569022 ) ( CLEAR ?auto_569021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_569012 ?auto_569013 ?auto_569014 ?auto_569015 ?auto_569016 ?auto_569017 ?auto_569018 ?auto_569019 ?auto_569020 ?auto_569021 )
      ( MAKE-14PILE ?auto_569012 ?auto_569013 ?auto_569014 ?auto_569015 ?auto_569016 ?auto_569017 ?auto_569018 ?auto_569019 ?auto_569020 ?auto_569021 ?auto_569022 ?auto_569023 ?auto_569024 ?auto_569025 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_569070 - BLOCK
      ?auto_569071 - BLOCK
      ?auto_569072 - BLOCK
      ?auto_569073 - BLOCK
      ?auto_569074 - BLOCK
      ?auto_569075 - BLOCK
      ?auto_569076 - BLOCK
      ?auto_569077 - BLOCK
      ?auto_569078 - BLOCK
      ?auto_569079 - BLOCK
      ?auto_569080 - BLOCK
      ?auto_569081 - BLOCK
      ?auto_569082 - BLOCK
      ?auto_569083 - BLOCK
    )
    :vars
    (
      ?auto_569084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_569083 ?auto_569084 ) ( ON-TABLE ?auto_569070 ) ( ON ?auto_569071 ?auto_569070 ) ( ON ?auto_569072 ?auto_569071 ) ( ON ?auto_569073 ?auto_569072 ) ( ON ?auto_569074 ?auto_569073 ) ( ON ?auto_569075 ?auto_569074 ) ( ON ?auto_569076 ?auto_569075 ) ( ON ?auto_569077 ?auto_569076 ) ( not ( = ?auto_569070 ?auto_569071 ) ) ( not ( = ?auto_569070 ?auto_569072 ) ) ( not ( = ?auto_569070 ?auto_569073 ) ) ( not ( = ?auto_569070 ?auto_569074 ) ) ( not ( = ?auto_569070 ?auto_569075 ) ) ( not ( = ?auto_569070 ?auto_569076 ) ) ( not ( = ?auto_569070 ?auto_569077 ) ) ( not ( = ?auto_569070 ?auto_569078 ) ) ( not ( = ?auto_569070 ?auto_569079 ) ) ( not ( = ?auto_569070 ?auto_569080 ) ) ( not ( = ?auto_569070 ?auto_569081 ) ) ( not ( = ?auto_569070 ?auto_569082 ) ) ( not ( = ?auto_569070 ?auto_569083 ) ) ( not ( = ?auto_569070 ?auto_569084 ) ) ( not ( = ?auto_569071 ?auto_569072 ) ) ( not ( = ?auto_569071 ?auto_569073 ) ) ( not ( = ?auto_569071 ?auto_569074 ) ) ( not ( = ?auto_569071 ?auto_569075 ) ) ( not ( = ?auto_569071 ?auto_569076 ) ) ( not ( = ?auto_569071 ?auto_569077 ) ) ( not ( = ?auto_569071 ?auto_569078 ) ) ( not ( = ?auto_569071 ?auto_569079 ) ) ( not ( = ?auto_569071 ?auto_569080 ) ) ( not ( = ?auto_569071 ?auto_569081 ) ) ( not ( = ?auto_569071 ?auto_569082 ) ) ( not ( = ?auto_569071 ?auto_569083 ) ) ( not ( = ?auto_569071 ?auto_569084 ) ) ( not ( = ?auto_569072 ?auto_569073 ) ) ( not ( = ?auto_569072 ?auto_569074 ) ) ( not ( = ?auto_569072 ?auto_569075 ) ) ( not ( = ?auto_569072 ?auto_569076 ) ) ( not ( = ?auto_569072 ?auto_569077 ) ) ( not ( = ?auto_569072 ?auto_569078 ) ) ( not ( = ?auto_569072 ?auto_569079 ) ) ( not ( = ?auto_569072 ?auto_569080 ) ) ( not ( = ?auto_569072 ?auto_569081 ) ) ( not ( = ?auto_569072 ?auto_569082 ) ) ( not ( = ?auto_569072 ?auto_569083 ) ) ( not ( = ?auto_569072 ?auto_569084 ) ) ( not ( = ?auto_569073 ?auto_569074 ) ) ( not ( = ?auto_569073 ?auto_569075 ) ) ( not ( = ?auto_569073 ?auto_569076 ) ) ( not ( = ?auto_569073 ?auto_569077 ) ) ( not ( = ?auto_569073 ?auto_569078 ) ) ( not ( = ?auto_569073 ?auto_569079 ) ) ( not ( = ?auto_569073 ?auto_569080 ) ) ( not ( = ?auto_569073 ?auto_569081 ) ) ( not ( = ?auto_569073 ?auto_569082 ) ) ( not ( = ?auto_569073 ?auto_569083 ) ) ( not ( = ?auto_569073 ?auto_569084 ) ) ( not ( = ?auto_569074 ?auto_569075 ) ) ( not ( = ?auto_569074 ?auto_569076 ) ) ( not ( = ?auto_569074 ?auto_569077 ) ) ( not ( = ?auto_569074 ?auto_569078 ) ) ( not ( = ?auto_569074 ?auto_569079 ) ) ( not ( = ?auto_569074 ?auto_569080 ) ) ( not ( = ?auto_569074 ?auto_569081 ) ) ( not ( = ?auto_569074 ?auto_569082 ) ) ( not ( = ?auto_569074 ?auto_569083 ) ) ( not ( = ?auto_569074 ?auto_569084 ) ) ( not ( = ?auto_569075 ?auto_569076 ) ) ( not ( = ?auto_569075 ?auto_569077 ) ) ( not ( = ?auto_569075 ?auto_569078 ) ) ( not ( = ?auto_569075 ?auto_569079 ) ) ( not ( = ?auto_569075 ?auto_569080 ) ) ( not ( = ?auto_569075 ?auto_569081 ) ) ( not ( = ?auto_569075 ?auto_569082 ) ) ( not ( = ?auto_569075 ?auto_569083 ) ) ( not ( = ?auto_569075 ?auto_569084 ) ) ( not ( = ?auto_569076 ?auto_569077 ) ) ( not ( = ?auto_569076 ?auto_569078 ) ) ( not ( = ?auto_569076 ?auto_569079 ) ) ( not ( = ?auto_569076 ?auto_569080 ) ) ( not ( = ?auto_569076 ?auto_569081 ) ) ( not ( = ?auto_569076 ?auto_569082 ) ) ( not ( = ?auto_569076 ?auto_569083 ) ) ( not ( = ?auto_569076 ?auto_569084 ) ) ( not ( = ?auto_569077 ?auto_569078 ) ) ( not ( = ?auto_569077 ?auto_569079 ) ) ( not ( = ?auto_569077 ?auto_569080 ) ) ( not ( = ?auto_569077 ?auto_569081 ) ) ( not ( = ?auto_569077 ?auto_569082 ) ) ( not ( = ?auto_569077 ?auto_569083 ) ) ( not ( = ?auto_569077 ?auto_569084 ) ) ( not ( = ?auto_569078 ?auto_569079 ) ) ( not ( = ?auto_569078 ?auto_569080 ) ) ( not ( = ?auto_569078 ?auto_569081 ) ) ( not ( = ?auto_569078 ?auto_569082 ) ) ( not ( = ?auto_569078 ?auto_569083 ) ) ( not ( = ?auto_569078 ?auto_569084 ) ) ( not ( = ?auto_569079 ?auto_569080 ) ) ( not ( = ?auto_569079 ?auto_569081 ) ) ( not ( = ?auto_569079 ?auto_569082 ) ) ( not ( = ?auto_569079 ?auto_569083 ) ) ( not ( = ?auto_569079 ?auto_569084 ) ) ( not ( = ?auto_569080 ?auto_569081 ) ) ( not ( = ?auto_569080 ?auto_569082 ) ) ( not ( = ?auto_569080 ?auto_569083 ) ) ( not ( = ?auto_569080 ?auto_569084 ) ) ( not ( = ?auto_569081 ?auto_569082 ) ) ( not ( = ?auto_569081 ?auto_569083 ) ) ( not ( = ?auto_569081 ?auto_569084 ) ) ( not ( = ?auto_569082 ?auto_569083 ) ) ( not ( = ?auto_569082 ?auto_569084 ) ) ( not ( = ?auto_569083 ?auto_569084 ) ) ( ON ?auto_569082 ?auto_569083 ) ( ON ?auto_569081 ?auto_569082 ) ( ON ?auto_569080 ?auto_569081 ) ( ON ?auto_569079 ?auto_569080 ) ( CLEAR ?auto_569077 ) ( ON ?auto_569078 ?auto_569079 ) ( CLEAR ?auto_569078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_569070 ?auto_569071 ?auto_569072 ?auto_569073 ?auto_569074 ?auto_569075 ?auto_569076 ?auto_569077 ?auto_569078 )
      ( MAKE-14PILE ?auto_569070 ?auto_569071 ?auto_569072 ?auto_569073 ?auto_569074 ?auto_569075 ?auto_569076 ?auto_569077 ?auto_569078 ?auto_569079 ?auto_569080 ?auto_569081 ?auto_569082 ?auto_569083 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_569128 - BLOCK
      ?auto_569129 - BLOCK
      ?auto_569130 - BLOCK
      ?auto_569131 - BLOCK
      ?auto_569132 - BLOCK
      ?auto_569133 - BLOCK
      ?auto_569134 - BLOCK
      ?auto_569135 - BLOCK
      ?auto_569136 - BLOCK
      ?auto_569137 - BLOCK
      ?auto_569138 - BLOCK
      ?auto_569139 - BLOCK
      ?auto_569140 - BLOCK
      ?auto_569141 - BLOCK
    )
    :vars
    (
      ?auto_569142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_569141 ?auto_569142 ) ( ON-TABLE ?auto_569128 ) ( ON ?auto_569129 ?auto_569128 ) ( ON ?auto_569130 ?auto_569129 ) ( ON ?auto_569131 ?auto_569130 ) ( ON ?auto_569132 ?auto_569131 ) ( ON ?auto_569133 ?auto_569132 ) ( ON ?auto_569134 ?auto_569133 ) ( not ( = ?auto_569128 ?auto_569129 ) ) ( not ( = ?auto_569128 ?auto_569130 ) ) ( not ( = ?auto_569128 ?auto_569131 ) ) ( not ( = ?auto_569128 ?auto_569132 ) ) ( not ( = ?auto_569128 ?auto_569133 ) ) ( not ( = ?auto_569128 ?auto_569134 ) ) ( not ( = ?auto_569128 ?auto_569135 ) ) ( not ( = ?auto_569128 ?auto_569136 ) ) ( not ( = ?auto_569128 ?auto_569137 ) ) ( not ( = ?auto_569128 ?auto_569138 ) ) ( not ( = ?auto_569128 ?auto_569139 ) ) ( not ( = ?auto_569128 ?auto_569140 ) ) ( not ( = ?auto_569128 ?auto_569141 ) ) ( not ( = ?auto_569128 ?auto_569142 ) ) ( not ( = ?auto_569129 ?auto_569130 ) ) ( not ( = ?auto_569129 ?auto_569131 ) ) ( not ( = ?auto_569129 ?auto_569132 ) ) ( not ( = ?auto_569129 ?auto_569133 ) ) ( not ( = ?auto_569129 ?auto_569134 ) ) ( not ( = ?auto_569129 ?auto_569135 ) ) ( not ( = ?auto_569129 ?auto_569136 ) ) ( not ( = ?auto_569129 ?auto_569137 ) ) ( not ( = ?auto_569129 ?auto_569138 ) ) ( not ( = ?auto_569129 ?auto_569139 ) ) ( not ( = ?auto_569129 ?auto_569140 ) ) ( not ( = ?auto_569129 ?auto_569141 ) ) ( not ( = ?auto_569129 ?auto_569142 ) ) ( not ( = ?auto_569130 ?auto_569131 ) ) ( not ( = ?auto_569130 ?auto_569132 ) ) ( not ( = ?auto_569130 ?auto_569133 ) ) ( not ( = ?auto_569130 ?auto_569134 ) ) ( not ( = ?auto_569130 ?auto_569135 ) ) ( not ( = ?auto_569130 ?auto_569136 ) ) ( not ( = ?auto_569130 ?auto_569137 ) ) ( not ( = ?auto_569130 ?auto_569138 ) ) ( not ( = ?auto_569130 ?auto_569139 ) ) ( not ( = ?auto_569130 ?auto_569140 ) ) ( not ( = ?auto_569130 ?auto_569141 ) ) ( not ( = ?auto_569130 ?auto_569142 ) ) ( not ( = ?auto_569131 ?auto_569132 ) ) ( not ( = ?auto_569131 ?auto_569133 ) ) ( not ( = ?auto_569131 ?auto_569134 ) ) ( not ( = ?auto_569131 ?auto_569135 ) ) ( not ( = ?auto_569131 ?auto_569136 ) ) ( not ( = ?auto_569131 ?auto_569137 ) ) ( not ( = ?auto_569131 ?auto_569138 ) ) ( not ( = ?auto_569131 ?auto_569139 ) ) ( not ( = ?auto_569131 ?auto_569140 ) ) ( not ( = ?auto_569131 ?auto_569141 ) ) ( not ( = ?auto_569131 ?auto_569142 ) ) ( not ( = ?auto_569132 ?auto_569133 ) ) ( not ( = ?auto_569132 ?auto_569134 ) ) ( not ( = ?auto_569132 ?auto_569135 ) ) ( not ( = ?auto_569132 ?auto_569136 ) ) ( not ( = ?auto_569132 ?auto_569137 ) ) ( not ( = ?auto_569132 ?auto_569138 ) ) ( not ( = ?auto_569132 ?auto_569139 ) ) ( not ( = ?auto_569132 ?auto_569140 ) ) ( not ( = ?auto_569132 ?auto_569141 ) ) ( not ( = ?auto_569132 ?auto_569142 ) ) ( not ( = ?auto_569133 ?auto_569134 ) ) ( not ( = ?auto_569133 ?auto_569135 ) ) ( not ( = ?auto_569133 ?auto_569136 ) ) ( not ( = ?auto_569133 ?auto_569137 ) ) ( not ( = ?auto_569133 ?auto_569138 ) ) ( not ( = ?auto_569133 ?auto_569139 ) ) ( not ( = ?auto_569133 ?auto_569140 ) ) ( not ( = ?auto_569133 ?auto_569141 ) ) ( not ( = ?auto_569133 ?auto_569142 ) ) ( not ( = ?auto_569134 ?auto_569135 ) ) ( not ( = ?auto_569134 ?auto_569136 ) ) ( not ( = ?auto_569134 ?auto_569137 ) ) ( not ( = ?auto_569134 ?auto_569138 ) ) ( not ( = ?auto_569134 ?auto_569139 ) ) ( not ( = ?auto_569134 ?auto_569140 ) ) ( not ( = ?auto_569134 ?auto_569141 ) ) ( not ( = ?auto_569134 ?auto_569142 ) ) ( not ( = ?auto_569135 ?auto_569136 ) ) ( not ( = ?auto_569135 ?auto_569137 ) ) ( not ( = ?auto_569135 ?auto_569138 ) ) ( not ( = ?auto_569135 ?auto_569139 ) ) ( not ( = ?auto_569135 ?auto_569140 ) ) ( not ( = ?auto_569135 ?auto_569141 ) ) ( not ( = ?auto_569135 ?auto_569142 ) ) ( not ( = ?auto_569136 ?auto_569137 ) ) ( not ( = ?auto_569136 ?auto_569138 ) ) ( not ( = ?auto_569136 ?auto_569139 ) ) ( not ( = ?auto_569136 ?auto_569140 ) ) ( not ( = ?auto_569136 ?auto_569141 ) ) ( not ( = ?auto_569136 ?auto_569142 ) ) ( not ( = ?auto_569137 ?auto_569138 ) ) ( not ( = ?auto_569137 ?auto_569139 ) ) ( not ( = ?auto_569137 ?auto_569140 ) ) ( not ( = ?auto_569137 ?auto_569141 ) ) ( not ( = ?auto_569137 ?auto_569142 ) ) ( not ( = ?auto_569138 ?auto_569139 ) ) ( not ( = ?auto_569138 ?auto_569140 ) ) ( not ( = ?auto_569138 ?auto_569141 ) ) ( not ( = ?auto_569138 ?auto_569142 ) ) ( not ( = ?auto_569139 ?auto_569140 ) ) ( not ( = ?auto_569139 ?auto_569141 ) ) ( not ( = ?auto_569139 ?auto_569142 ) ) ( not ( = ?auto_569140 ?auto_569141 ) ) ( not ( = ?auto_569140 ?auto_569142 ) ) ( not ( = ?auto_569141 ?auto_569142 ) ) ( ON ?auto_569140 ?auto_569141 ) ( ON ?auto_569139 ?auto_569140 ) ( ON ?auto_569138 ?auto_569139 ) ( ON ?auto_569137 ?auto_569138 ) ( ON ?auto_569136 ?auto_569137 ) ( CLEAR ?auto_569134 ) ( ON ?auto_569135 ?auto_569136 ) ( CLEAR ?auto_569135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_569128 ?auto_569129 ?auto_569130 ?auto_569131 ?auto_569132 ?auto_569133 ?auto_569134 ?auto_569135 )
      ( MAKE-14PILE ?auto_569128 ?auto_569129 ?auto_569130 ?auto_569131 ?auto_569132 ?auto_569133 ?auto_569134 ?auto_569135 ?auto_569136 ?auto_569137 ?auto_569138 ?auto_569139 ?auto_569140 ?auto_569141 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_569186 - BLOCK
      ?auto_569187 - BLOCK
      ?auto_569188 - BLOCK
      ?auto_569189 - BLOCK
      ?auto_569190 - BLOCK
      ?auto_569191 - BLOCK
      ?auto_569192 - BLOCK
      ?auto_569193 - BLOCK
      ?auto_569194 - BLOCK
      ?auto_569195 - BLOCK
      ?auto_569196 - BLOCK
      ?auto_569197 - BLOCK
      ?auto_569198 - BLOCK
      ?auto_569199 - BLOCK
    )
    :vars
    (
      ?auto_569200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_569199 ?auto_569200 ) ( ON-TABLE ?auto_569186 ) ( ON ?auto_569187 ?auto_569186 ) ( ON ?auto_569188 ?auto_569187 ) ( ON ?auto_569189 ?auto_569188 ) ( ON ?auto_569190 ?auto_569189 ) ( ON ?auto_569191 ?auto_569190 ) ( not ( = ?auto_569186 ?auto_569187 ) ) ( not ( = ?auto_569186 ?auto_569188 ) ) ( not ( = ?auto_569186 ?auto_569189 ) ) ( not ( = ?auto_569186 ?auto_569190 ) ) ( not ( = ?auto_569186 ?auto_569191 ) ) ( not ( = ?auto_569186 ?auto_569192 ) ) ( not ( = ?auto_569186 ?auto_569193 ) ) ( not ( = ?auto_569186 ?auto_569194 ) ) ( not ( = ?auto_569186 ?auto_569195 ) ) ( not ( = ?auto_569186 ?auto_569196 ) ) ( not ( = ?auto_569186 ?auto_569197 ) ) ( not ( = ?auto_569186 ?auto_569198 ) ) ( not ( = ?auto_569186 ?auto_569199 ) ) ( not ( = ?auto_569186 ?auto_569200 ) ) ( not ( = ?auto_569187 ?auto_569188 ) ) ( not ( = ?auto_569187 ?auto_569189 ) ) ( not ( = ?auto_569187 ?auto_569190 ) ) ( not ( = ?auto_569187 ?auto_569191 ) ) ( not ( = ?auto_569187 ?auto_569192 ) ) ( not ( = ?auto_569187 ?auto_569193 ) ) ( not ( = ?auto_569187 ?auto_569194 ) ) ( not ( = ?auto_569187 ?auto_569195 ) ) ( not ( = ?auto_569187 ?auto_569196 ) ) ( not ( = ?auto_569187 ?auto_569197 ) ) ( not ( = ?auto_569187 ?auto_569198 ) ) ( not ( = ?auto_569187 ?auto_569199 ) ) ( not ( = ?auto_569187 ?auto_569200 ) ) ( not ( = ?auto_569188 ?auto_569189 ) ) ( not ( = ?auto_569188 ?auto_569190 ) ) ( not ( = ?auto_569188 ?auto_569191 ) ) ( not ( = ?auto_569188 ?auto_569192 ) ) ( not ( = ?auto_569188 ?auto_569193 ) ) ( not ( = ?auto_569188 ?auto_569194 ) ) ( not ( = ?auto_569188 ?auto_569195 ) ) ( not ( = ?auto_569188 ?auto_569196 ) ) ( not ( = ?auto_569188 ?auto_569197 ) ) ( not ( = ?auto_569188 ?auto_569198 ) ) ( not ( = ?auto_569188 ?auto_569199 ) ) ( not ( = ?auto_569188 ?auto_569200 ) ) ( not ( = ?auto_569189 ?auto_569190 ) ) ( not ( = ?auto_569189 ?auto_569191 ) ) ( not ( = ?auto_569189 ?auto_569192 ) ) ( not ( = ?auto_569189 ?auto_569193 ) ) ( not ( = ?auto_569189 ?auto_569194 ) ) ( not ( = ?auto_569189 ?auto_569195 ) ) ( not ( = ?auto_569189 ?auto_569196 ) ) ( not ( = ?auto_569189 ?auto_569197 ) ) ( not ( = ?auto_569189 ?auto_569198 ) ) ( not ( = ?auto_569189 ?auto_569199 ) ) ( not ( = ?auto_569189 ?auto_569200 ) ) ( not ( = ?auto_569190 ?auto_569191 ) ) ( not ( = ?auto_569190 ?auto_569192 ) ) ( not ( = ?auto_569190 ?auto_569193 ) ) ( not ( = ?auto_569190 ?auto_569194 ) ) ( not ( = ?auto_569190 ?auto_569195 ) ) ( not ( = ?auto_569190 ?auto_569196 ) ) ( not ( = ?auto_569190 ?auto_569197 ) ) ( not ( = ?auto_569190 ?auto_569198 ) ) ( not ( = ?auto_569190 ?auto_569199 ) ) ( not ( = ?auto_569190 ?auto_569200 ) ) ( not ( = ?auto_569191 ?auto_569192 ) ) ( not ( = ?auto_569191 ?auto_569193 ) ) ( not ( = ?auto_569191 ?auto_569194 ) ) ( not ( = ?auto_569191 ?auto_569195 ) ) ( not ( = ?auto_569191 ?auto_569196 ) ) ( not ( = ?auto_569191 ?auto_569197 ) ) ( not ( = ?auto_569191 ?auto_569198 ) ) ( not ( = ?auto_569191 ?auto_569199 ) ) ( not ( = ?auto_569191 ?auto_569200 ) ) ( not ( = ?auto_569192 ?auto_569193 ) ) ( not ( = ?auto_569192 ?auto_569194 ) ) ( not ( = ?auto_569192 ?auto_569195 ) ) ( not ( = ?auto_569192 ?auto_569196 ) ) ( not ( = ?auto_569192 ?auto_569197 ) ) ( not ( = ?auto_569192 ?auto_569198 ) ) ( not ( = ?auto_569192 ?auto_569199 ) ) ( not ( = ?auto_569192 ?auto_569200 ) ) ( not ( = ?auto_569193 ?auto_569194 ) ) ( not ( = ?auto_569193 ?auto_569195 ) ) ( not ( = ?auto_569193 ?auto_569196 ) ) ( not ( = ?auto_569193 ?auto_569197 ) ) ( not ( = ?auto_569193 ?auto_569198 ) ) ( not ( = ?auto_569193 ?auto_569199 ) ) ( not ( = ?auto_569193 ?auto_569200 ) ) ( not ( = ?auto_569194 ?auto_569195 ) ) ( not ( = ?auto_569194 ?auto_569196 ) ) ( not ( = ?auto_569194 ?auto_569197 ) ) ( not ( = ?auto_569194 ?auto_569198 ) ) ( not ( = ?auto_569194 ?auto_569199 ) ) ( not ( = ?auto_569194 ?auto_569200 ) ) ( not ( = ?auto_569195 ?auto_569196 ) ) ( not ( = ?auto_569195 ?auto_569197 ) ) ( not ( = ?auto_569195 ?auto_569198 ) ) ( not ( = ?auto_569195 ?auto_569199 ) ) ( not ( = ?auto_569195 ?auto_569200 ) ) ( not ( = ?auto_569196 ?auto_569197 ) ) ( not ( = ?auto_569196 ?auto_569198 ) ) ( not ( = ?auto_569196 ?auto_569199 ) ) ( not ( = ?auto_569196 ?auto_569200 ) ) ( not ( = ?auto_569197 ?auto_569198 ) ) ( not ( = ?auto_569197 ?auto_569199 ) ) ( not ( = ?auto_569197 ?auto_569200 ) ) ( not ( = ?auto_569198 ?auto_569199 ) ) ( not ( = ?auto_569198 ?auto_569200 ) ) ( not ( = ?auto_569199 ?auto_569200 ) ) ( ON ?auto_569198 ?auto_569199 ) ( ON ?auto_569197 ?auto_569198 ) ( ON ?auto_569196 ?auto_569197 ) ( ON ?auto_569195 ?auto_569196 ) ( ON ?auto_569194 ?auto_569195 ) ( ON ?auto_569193 ?auto_569194 ) ( CLEAR ?auto_569191 ) ( ON ?auto_569192 ?auto_569193 ) ( CLEAR ?auto_569192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_569186 ?auto_569187 ?auto_569188 ?auto_569189 ?auto_569190 ?auto_569191 ?auto_569192 )
      ( MAKE-14PILE ?auto_569186 ?auto_569187 ?auto_569188 ?auto_569189 ?auto_569190 ?auto_569191 ?auto_569192 ?auto_569193 ?auto_569194 ?auto_569195 ?auto_569196 ?auto_569197 ?auto_569198 ?auto_569199 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_569244 - BLOCK
      ?auto_569245 - BLOCK
      ?auto_569246 - BLOCK
      ?auto_569247 - BLOCK
      ?auto_569248 - BLOCK
      ?auto_569249 - BLOCK
      ?auto_569250 - BLOCK
      ?auto_569251 - BLOCK
      ?auto_569252 - BLOCK
      ?auto_569253 - BLOCK
      ?auto_569254 - BLOCK
      ?auto_569255 - BLOCK
      ?auto_569256 - BLOCK
      ?auto_569257 - BLOCK
    )
    :vars
    (
      ?auto_569258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_569257 ?auto_569258 ) ( ON-TABLE ?auto_569244 ) ( ON ?auto_569245 ?auto_569244 ) ( ON ?auto_569246 ?auto_569245 ) ( ON ?auto_569247 ?auto_569246 ) ( ON ?auto_569248 ?auto_569247 ) ( not ( = ?auto_569244 ?auto_569245 ) ) ( not ( = ?auto_569244 ?auto_569246 ) ) ( not ( = ?auto_569244 ?auto_569247 ) ) ( not ( = ?auto_569244 ?auto_569248 ) ) ( not ( = ?auto_569244 ?auto_569249 ) ) ( not ( = ?auto_569244 ?auto_569250 ) ) ( not ( = ?auto_569244 ?auto_569251 ) ) ( not ( = ?auto_569244 ?auto_569252 ) ) ( not ( = ?auto_569244 ?auto_569253 ) ) ( not ( = ?auto_569244 ?auto_569254 ) ) ( not ( = ?auto_569244 ?auto_569255 ) ) ( not ( = ?auto_569244 ?auto_569256 ) ) ( not ( = ?auto_569244 ?auto_569257 ) ) ( not ( = ?auto_569244 ?auto_569258 ) ) ( not ( = ?auto_569245 ?auto_569246 ) ) ( not ( = ?auto_569245 ?auto_569247 ) ) ( not ( = ?auto_569245 ?auto_569248 ) ) ( not ( = ?auto_569245 ?auto_569249 ) ) ( not ( = ?auto_569245 ?auto_569250 ) ) ( not ( = ?auto_569245 ?auto_569251 ) ) ( not ( = ?auto_569245 ?auto_569252 ) ) ( not ( = ?auto_569245 ?auto_569253 ) ) ( not ( = ?auto_569245 ?auto_569254 ) ) ( not ( = ?auto_569245 ?auto_569255 ) ) ( not ( = ?auto_569245 ?auto_569256 ) ) ( not ( = ?auto_569245 ?auto_569257 ) ) ( not ( = ?auto_569245 ?auto_569258 ) ) ( not ( = ?auto_569246 ?auto_569247 ) ) ( not ( = ?auto_569246 ?auto_569248 ) ) ( not ( = ?auto_569246 ?auto_569249 ) ) ( not ( = ?auto_569246 ?auto_569250 ) ) ( not ( = ?auto_569246 ?auto_569251 ) ) ( not ( = ?auto_569246 ?auto_569252 ) ) ( not ( = ?auto_569246 ?auto_569253 ) ) ( not ( = ?auto_569246 ?auto_569254 ) ) ( not ( = ?auto_569246 ?auto_569255 ) ) ( not ( = ?auto_569246 ?auto_569256 ) ) ( not ( = ?auto_569246 ?auto_569257 ) ) ( not ( = ?auto_569246 ?auto_569258 ) ) ( not ( = ?auto_569247 ?auto_569248 ) ) ( not ( = ?auto_569247 ?auto_569249 ) ) ( not ( = ?auto_569247 ?auto_569250 ) ) ( not ( = ?auto_569247 ?auto_569251 ) ) ( not ( = ?auto_569247 ?auto_569252 ) ) ( not ( = ?auto_569247 ?auto_569253 ) ) ( not ( = ?auto_569247 ?auto_569254 ) ) ( not ( = ?auto_569247 ?auto_569255 ) ) ( not ( = ?auto_569247 ?auto_569256 ) ) ( not ( = ?auto_569247 ?auto_569257 ) ) ( not ( = ?auto_569247 ?auto_569258 ) ) ( not ( = ?auto_569248 ?auto_569249 ) ) ( not ( = ?auto_569248 ?auto_569250 ) ) ( not ( = ?auto_569248 ?auto_569251 ) ) ( not ( = ?auto_569248 ?auto_569252 ) ) ( not ( = ?auto_569248 ?auto_569253 ) ) ( not ( = ?auto_569248 ?auto_569254 ) ) ( not ( = ?auto_569248 ?auto_569255 ) ) ( not ( = ?auto_569248 ?auto_569256 ) ) ( not ( = ?auto_569248 ?auto_569257 ) ) ( not ( = ?auto_569248 ?auto_569258 ) ) ( not ( = ?auto_569249 ?auto_569250 ) ) ( not ( = ?auto_569249 ?auto_569251 ) ) ( not ( = ?auto_569249 ?auto_569252 ) ) ( not ( = ?auto_569249 ?auto_569253 ) ) ( not ( = ?auto_569249 ?auto_569254 ) ) ( not ( = ?auto_569249 ?auto_569255 ) ) ( not ( = ?auto_569249 ?auto_569256 ) ) ( not ( = ?auto_569249 ?auto_569257 ) ) ( not ( = ?auto_569249 ?auto_569258 ) ) ( not ( = ?auto_569250 ?auto_569251 ) ) ( not ( = ?auto_569250 ?auto_569252 ) ) ( not ( = ?auto_569250 ?auto_569253 ) ) ( not ( = ?auto_569250 ?auto_569254 ) ) ( not ( = ?auto_569250 ?auto_569255 ) ) ( not ( = ?auto_569250 ?auto_569256 ) ) ( not ( = ?auto_569250 ?auto_569257 ) ) ( not ( = ?auto_569250 ?auto_569258 ) ) ( not ( = ?auto_569251 ?auto_569252 ) ) ( not ( = ?auto_569251 ?auto_569253 ) ) ( not ( = ?auto_569251 ?auto_569254 ) ) ( not ( = ?auto_569251 ?auto_569255 ) ) ( not ( = ?auto_569251 ?auto_569256 ) ) ( not ( = ?auto_569251 ?auto_569257 ) ) ( not ( = ?auto_569251 ?auto_569258 ) ) ( not ( = ?auto_569252 ?auto_569253 ) ) ( not ( = ?auto_569252 ?auto_569254 ) ) ( not ( = ?auto_569252 ?auto_569255 ) ) ( not ( = ?auto_569252 ?auto_569256 ) ) ( not ( = ?auto_569252 ?auto_569257 ) ) ( not ( = ?auto_569252 ?auto_569258 ) ) ( not ( = ?auto_569253 ?auto_569254 ) ) ( not ( = ?auto_569253 ?auto_569255 ) ) ( not ( = ?auto_569253 ?auto_569256 ) ) ( not ( = ?auto_569253 ?auto_569257 ) ) ( not ( = ?auto_569253 ?auto_569258 ) ) ( not ( = ?auto_569254 ?auto_569255 ) ) ( not ( = ?auto_569254 ?auto_569256 ) ) ( not ( = ?auto_569254 ?auto_569257 ) ) ( not ( = ?auto_569254 ?auto_569258 ) ) ( not ( = ?auto_569255 ?auto_569256 ) ) ( not ( = ?auto_569255 ?auto_569257 ) ) ( not ( = ?auto_569255 ?auto_569258 ) ) ( not ( = ?auto_569256 ?auto_569257 ) ) ( not ( = ?auto_569256 ?auto_569258 ) ) ( not ( = ?auto_569257 ?auto_569258 ) ) ( ON ?auto_569256 ?auto_569257 ) ( ON ?auto_569255 ?auto_569256 ) ( ON ?auto_569254 ?auto_569255 ) ( ON ?auto_569253 ?auto_569254 ) ( ON ?auto_569252 ?auto_569253 ) ( ON ?auto_569251 ?auto_569252 ) ( ON ?auto_569250 ?auto_569251 ) ( CLEAR ?auto_569248 ) ( ON ?auto_569249 ?auto_569250 ) ( CLEAR ?auto_569249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_569244 ?auto_569245 ?auto_569246 ?auto_569247 ?auto_569248 ?auto_569249 )
      ( MAKE-14PILE ?auto_569244 ?auto_569245 ?auto_569246 ?auto_569247 ?auto_569248 ?auto_569249 ?auto_569250 ?auto_569251 ?auto_569252 ?auto_569253 ?auto_569254 ?auto_569255 ?auto_569256 ?auto_569257 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_569302 - BLOCK
      ?auto_569303 - BLOCK
      ?auto_569304 - BLOCK
      ?auto_569305 - BLOCK
      ?auto_569306 - BLOCK
      ?auto_569307 - BLOCK
      ?auto_569308 - BLOCK
      ?auto_569309 - BLOCK
      ?auto_569310 - BLOCK
      ?auto_569311 - BLOCK
      ?auto_569312 - BLOCK
      ?auto_569313 - BLOCK
      ?auto_569314 - BLOCK
      ?auto_569315 - BLOCK
    )
    :vars
    (
      ?auto_569316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_569315 ?auto_569316 ) ( ON-TABLE ?auto_569302 ) ( ON ?auto_569303 ?auto_569302 ) ( ON ?auto_569304 ?auto_569303 ) ( ON ?auto_569305 ?auto_569304 ) ( not ( = ?auto_569302 ?auto_569303 ) ) ( not ( = ?auto_569302 ?auto_569304 ) ) ( not ( = ?auto_569302 ?auto_569305 ) ) ( not ( = ?auto_569302 ?auto_569306 ) ) ( not ( = ?auto_569302 ?auto_569307 ) ) ( not ( = ?auto_569302 ?auto_569308 ) ) ( not ( = ?auto_569302 ?auto_569309 ) ) ( not ( = ?auto_569302 ?auto_569310 ) ) ( not ( = ?auto_569302 ?auto_569311 ) ) ( not ( = ?auto_569302 ?auto_569312 ) ) ( not ( = ?auto_569302 ?auto_569313 ) ) ( not ( = ?auto_569302 ?auto_569314 ) ) ( not ( = ?auto_569302 ?auto_569315 ) ) ( not ( = ?auto_569302 ?auto_569316 ) ) ( not ( = ?auto_569303 ?auto_569304 ) ) ( not ( = ?auto_569303 ?auto_569305 ) ) ( not ( = ?auto_569303 ?auto_569306 ) ) ( not ( = ?auto_569303 ?auto_569307 ) ) ( not ( = ?auto_569303 ?auto_569308 ) ) ( not ( = ?auto_569303 ?auto_569309 ) ) ( not ( = ?auto_569303 ?auto_569310 ) ) ( not ( = ?auto_569303 ?auto_569311 ) ) ( not ( = ?auto_569303 ?auto_569312 ) ) ( not ( = ?auto_569303 ?auto_569313 ) ) ( not ( = ?auto_569303 ?auto_569314 ) ) ( not ( = ?auto_569303 ?auto_569315 ) ) ( not ( = ?auto_569303 ?auto_569316 ) ) ( not ( = ?auto_569304 ?auto_569305 ) ) ( not ( = ?auto_569304 ?auto_569306 ) ) ( not ( = ?auto_569304 ?auto_569307 ) ) ( not ( = ?auto_569304 ?auto_569308 ) ) ( not ( = ?auto_569304 ?auto_569309 ) ) ( not ( = ?auto_569304 ?auto_569310 ) ) ( not ( = ?auto_569304 ?auto_569311 ) ) ( not ( = ?auto_569304 ?auto_569312 ) ) ( not ( = ?auto_569304 ?auto_569313 ) ) ( not ( = ?auto_569304 ?auto_569314 ) ) ( not ( = ?auto_569304 ?auto_569315 ) ) ( not ( = ?auto_569304 ?auto_569316 ) ) ( not ( = ?auto_569305 ?auto_569306 ) ) ( not ( = ?auto_569305 ?auto_569307 ) ) ( not ( = ?auto_569305 ?auto_569308 ) ) ( not ( = ?auto_569305 ?auto_569309 ) ) ( not ( = ?auto_569305 ?auto_569310 ) ) ( not ( = ?auto_569305 ?auto_569311 ) ) ( not ( = ?auto_569305 ?auto_569312 ) ) ( not ( = ?auto_569305 ?auto_569313 ) ) ( not ( = ?auto_569305 ?auto_569314 ) ) ( not ( = ?auto_569305 ?auto_569315 ) ) ( not ( = ?auto_569305 ?auto_569316 ) ) ( not ( = ?auto_569306 ?auto_569307 ) ) ( not ( = ?auto_569306 ?auto_569308 ) ) ( not ( = ?auto_569306 ?auto_569309 ) ) ( not ( = ?auto_569306 ?auto_569310 ) ) ( not ( = ?auto_569306 ?auto_569311 ) ) ( not ( = ?auto_569306 ?auto_569312 ) ) ( not ( = ?auto_569306 ?auto_569313 ) ) ( not ( = ?auto_569306 ?auto_569314 ) ) ( not ( = ?auto_569306 ?auto_569315 ) ) ( not ( = ?auto_569306 ?auto_569316 ) ) ( not ( = ?auto_569307 ?auto_569308 ) ) ( not ( = ?auto_569307 ?auto_569309 ) ) ( not ( = ?auto_569307 ?auto_569310 ) ) ( not ( = ?auto_569307 ?auto_569311 ) ) ( not ( = ?auto_569307 ?auto_569312 ) ) ( not ( = ?auto_569307 ?auto_569313 ) ) ( not ( = ?auto_569307 ?auto_569314 ) ) ( not ( = ?auto_569307 ?auto_569315 ) ) ( not ( = ?auto_569307 ?auto_569316 ) ) ( not ( = ?auto_569308 ?auto_569309 ) ) ( not ( = ?auto_569308 ?auto_569310 ) ) ( not ( = ?auto_569308 ?auto_569311 ) ) ( not ( = ?auto_569308 ?auto_569312 ) ) ( not ( = ?auto_569308 ?auto_569313 ) ) ( not ( = ?auto_569308 ?auto_569314 ) ) ( not ( = ?auto_569308 ?auto_569315 ) ) ( not ( = ?auto_569308 ?auto_569316 ) ) ( not ( = ?auto_569309 ?auto_569310 ) ) ( not ( = ?auto_569309 ?auto_569311 ) ) ( not ( = ?auto_569309 ?auto_569312 ) ) ( not ( = ?auto_569309 ?auto_569313 ) ) ( not ( = ?auto_569309 ?auto_569314 ) ) ( not ( = ?auto_569309 ?auto_569315 ) ) ( not ( = ?auto_569309 ?auto_569316 ) ) ( not ( = ?auto_569310 ?auto_569311 ) ) ( not ( = ?auto_569310 ?auto_569312 ) ) ( not ( = ?auto_569310 ?auto_569313 ) ) ( not ( = ?auto_569310 ?auto_569314 ) ) ( not ( = ?auto_569310 ?auto_569315 ) ) ( not ( = ?auto_569310 ?auto_569316 ) ) ( not ( = ?auto_569311 ?auto_569312 ) ) ( not ( = ?auto_569311 ?auto_569313 ) ) ( not ( = ?auto_569311 ?auto_569314 ) ) ( not ( = ?auto_569311 ?auto_569315 ) ) ( not ( = ?auto_569311 ?auto_569316 ) ) ( not ( = ?auto_569312 ?auto_569313 ) ) ( not ( = ?auto_569312 ?auto_569314 ) ) ( not ( = ?auto_569312 ?auto_569315 ) ) ( not ( = ?auto_569312 ?auto_569316 ) ) ( not ( = ?auto_569313 ?auto_569314 ) ) ( not ( = ?auto_569313 ?auto_569315 ) ) ( not ( = ?auto_569313 ?auto_569316 ) ) ( not ( = ?auto_569314 ?auto_569315 ) ) ( not ( = ?auto_569314 ?auto_569316 ) ) ( not ( = ?auto_569315 ?auto_569316 ) ) ( ON ?auto_569314 ?auto_569315 ) ( ON ?auto_569313 ?auto_569314 ) ( ON ?auto_569312 ?auto_569313 ) ( ON ?auto_569311 ?auto_569312 ) ( ON ?auto_569310 ?auto_569311 ) ( ON ?auto_569309 ?auto_569310 ) ( ON ?auto_569308 ?auto_569309 ) ( ON ?auto_569307 ?auto_569308 ) ( CLEAR ?auto_569305 ) ( ON ?auto_569306 ?auto_569307 ) ( CLEAR ?auto_569306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_569302 ?auto_569303 ?auto_569304 ?auto_569305 ?auto_569306 )
      ( MAKE-14PILE ?auto_569302 ?auto_569303 ?auto_569304 ?auto_569305 ?auto_569306 ?auto_569307 ?auto_569308 ?auto_569309 ?auto_569310 ?auto_569311 ?auto_569312 ?auto_569313 ?auto_569314 ?auto_569315 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_569360 - BLOCK
      ?auto_569361 - BLOCK
      ?auto_569362 - BLOCK
      ?auto_569363 - BLOCK
      ?auto_569364 - BLOCK
      ?auto_569365 - BLOCK
      ?auto_569366 - BLOCK
      ?auto_569367 - BLOCK
      ?auto_569368 - BLOCK
      ?auto_569369 - BLOCK
      ?auto_569370 - BLOCK
      ?auto_569371 - BLOCK
      ?auto_569372 - BLOCK
      ?auto_569373 - BLOCK
    )
    :vars
    (
      ?auto_569374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_569373 ?auto_569374 ) ( ON-TABLE ?auto_569360 ) ( ON ?auto_569361 ?auto_569360 ) ( ON ?auto_569362 ?auto_569361 ) ( not ( = ?auto_569360 ?auto_569361 ) ) ( not ( = ?auto_569360 ?auto_569362 ) ) ( not ( = ?auto_569360 ?auto_569363 ) ) ( not ( = ?auto_569360 ?auto_569364 ) ) ( not ( = ?auto_569360 ?auto_569365 ) ) ( not ( = ?auto_569360 ?auto_569366 ) ) ( not ( = ?auto_569360 ?auto_569367 ) ) ( not ( = ?auto_569360 ?auto_569368 ) ) ( not ( = ?auto_569360 ?auto_569369 ) ) ( not ( = ?auto_569360 ?auto_569370 ) ) ( not ( = ?auto_569360 ?auto_569371 ) ) ( not ( = ?auto_569360 ?auto_569372 ) ) ( not ( = ?auto_569360 ?auto_569373 ) ) ( not ( = ?auto_569360 ?auto_569374 ) ) ( not ( = ?auto_569361 ?auto_569362 ) ) ( not ( = ?auto_569361 ?auto_569363 ) ) ( not ( = ?auto_569361 ?auto_569364 ) ) ( not ( = ?auto_569361 ?auto_569365 ) ) ( not ( = ?auto_569361 ?auto_569366 ) ) ( not ( = ?auto_569361 ?auto_569367 ) ) ( not ( = ?auto_569361 ?auto_569368 ) ) ( not ( = ?auto_569361 ?auto_569369 ) ) ( not ( = ?auto_569361 ?auto_569370 ) ) ( not ( = ?auto_569361 ?auto_569371 ) ) ( not ( = ?auto_569361 ?auto_569372 ) ) ( not ( = ?auto_569361 ?auto_569373 ) ) ( not ( = ?auto_569361 ?auto_569374 ) ) ( not ( = ?auto_569362 ?auto_569363 ) ) ( not ( = ?auto_569362 ?auto_569364 ) ) ( not ( = ?auto_569362 ?auto_569365 ) ) ( not ( = ?auto_569362 ?auto_569366 ) ) ( not ( = ?auto_569362 ?auto_569367 ) ) ( not ( = ?auto_569362 ?auto_569368 ) ) ( not ( = ?auto_569362 ?auto_569369 ) ) ( not ( = ?auto_569362 ?auto_569370 ) ) ( not ( = ?auto_569362 ?auto_569371 ) ) ( not ( = ?auto_569362 ?auto_569372 ) ) ( not ( = ?auto_569362 ?auto_569373 ) ) ( not ( = ?auto_569362 ?auto_569374 ) ) ( not ( = ?auto_569363 ?auto_569364 ) ) ( not ( = ?auto_569363 ?auto_569365 ) ) ( not ( = ?auto_569363 ?auto_569366 ) ) ( not ( = ?auto_569363 ?auto_569367 ) ) ( not ( = ?auto_569363 ?auto_569368 ) ) ( not ( = ?auto_569363 ?auto_569369 ) ) ( not ( = ?auto_569363 ?auto_569370 ) ) ( not ( = ?auto_569363 ?auto_569371 ) ) ( not ( = ?auto_569363 ?auto_569372 ) ) ( not ( = ?auto_569363 ?auto_569373 ) ) ( not ( = ?auto_569363 ?auto_569374 ) ) ( not ( = ?auto_569364 ?auto_569365 ) ) ( not ( = ?auto_569364 ?auto_569366 ) ) ( not ( = ?auto_569364 ?auto_569367 ) ) ( not ( = ?auto_569364 ?auto_569368 ) ) ( not ( = ?auto_569364 ?auto_569369 ) ) ( not ( = ?auto_569364 ?auto_569370 ) ) ( not ( = ?auto_569364 ?auto_569371 ) ) ( not ( = ?auto_569364 ?auto_569372 ) ) ( not ( = ?auto_569364 ?auto_569373 ) ) ( not ( = ?auto_569364 ?auto_569374 ) ) ( not ( = ?auto_569365 ?auto_569366 ) ) ( not ( = ?auto_569365 ?auto_569367 ) ) ( not ( = ?auto_569365 ?auto_569368 ) ) ( not ( = ?auto_569365 ?auto_569369 ) ) ( not ( = ?auto_569365 ?auto_569370 ) ) ( not ( = ?auto_569365 ?auto_569371 ) ) ( not ( = ?auto_569365 ?auto_569372 ) ) ( not ( = ?auto_569365 ?auto_569373 ) ) ( not ( = ?auto_569365 ?auto_569374 ) ) ( not ( = ?auto_569366 ?auto_569367 ) ) ( not ( = ?auto_569366 ?auto_569368 ) ) ( not ( = ?auto_569366 ?auto_569369 ) ) ( not ( = ?auto_569366 ?auto_569370 ) ) ( not ( = ?auto_569366 ?auto_569371 ) ) ( not ( = ?auto_569366 ?auto_569372 ) ) ( not ( = ?auto_569366 ?auto_569373 ) ) ( not ( = ?auto_569366 ?auto_569374 ) ) ( not ( = ?auto_569367 ?auto_569368 ) ) ( not ( = ?auto_569367 ?auto_569369 ) ) ( not ( = ?auto_569367 ?auto_569370 ) ) ( not ( = ?auto_569367 ?auto_569371 ) ) ( not ( = ?auto_569367 ?auto_569372 ) ) ( not ( = ?auto_569367 ?auto_569373 ) ) ( not ( = ?auto_569367 ?auto_569374 ) ) ( not ( = ?auto_569368 ?auto_569369 ) ) ( not ( = ?auto_569368 ?auto_569370 ) ) ( not ( = ?auto_569368 ?auto_569371 ) ) ( not ( = ?auto_569368 ?auto_569372 ) ) ( not ( = ?auto_569368 ?auto_569373 ) ) ( not ( = ?auto_569368 ?auto_569374 ) ) ( not ( = ?auto_569369 ?auto_569370 ) ) ( not ( = ?auto_569369 ?auto_569371 ) ) ( not ( = ?auto_569369 ?auto_569372 ) ) ( not ( = ?auto_569369 ?auto_569373 ) ) ( not ( = ?auto_569369 ?auto_569374 ) ) ( not ( = ?auto_569370 ?auto_569371 ) ) ( not ( = ?auto_569370 ?auto_569372 ) ) ( not ( = ?auto_569370 ?auto_569373 ) ) ( not ( = ?auto_569370 ?auto_569374 ) ) ( not ( = ?auto_569371 ?auto_569372 ) ) ( not ( = ?auto_569371 ?auto_569373 ) ) ( not ( = ?auto_569371 ?auto_569374 ) ) ( not ( = ?auto_569372 ?auto_569373 ) ) ( not ( = ?auto_569372 ?auto_569374 ) ) ( not ( = ?auto_569373 ?auto_569374 ) ) ( ON ?auto_569372 ?auto_569373 ) ( ON ?auto_569371 ?auto_569372 ) ( ON ?auto_569370 ?auto_569371 ) ( ON ?auto_569369 ?auto_569370 ) ( ON ?auto_569368 ?auto_569369 ) ( ON ?auto_569367 ?auto_569368 ) ( ON ?auto_569366 ?auto_569367 ) ( ON ?auto_569365 ?auto_569366 ) ( ON ?auto_569364 ?auto_569365 ) ( CLEAR ?auto_569362 ) ( ON ?auto_569363 ?auto_569364 ) ( CLEAR ?auto_569363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_569360 ?auto_569361 ?auto_569362 ?auto_569363 )
      ( MAKE-14PILE ?auto_569360 ?auto_569361 ?auto_569362 ?auto_569363 ?auto_569364 ?auto_569365 ?auto_569366 ?auto_569367 ?auto_569368 ?auto_569369 ?auto_569370 ?auto_569371 ?auto_569372 ?auto_569373 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_569418 - BLOCK
      ?auto_569419 - BLOCK
      ?auto_569420 - BLOCK
      ?auto_569421 - BLOCK
      ?auto_569422 - BLOCK
      ?auto_569423 - BLOCK
      ?auto_569424 - BLOCK
      ?auto_569425 - BLOCK
      ?auto_569426 - BLOCK
      ?auto_569427 - BLOCK
      ?auto_569428 - BLOCK
      ?auto_569429 - BLOCK
      ?auto_569430 - BLOCK
      ?auto_569431 - BLOCK
    )
    :vars
    (
      ?auto_569432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_569431 ?auto_569432 ) ( ON-TABLE ?auto_569418 ) ( ON ?auto_569419 ?auto_569418 ) ( not ( = ?auto_569418 ?auto_569419 ) ) ( not ( = ?auto_569418 ?auto_569420 ) ) ( not ( = ?auto_569418 ?auto_569421 ) ) ( not ( = ?auto_569418 ?auto_569422 ) ) ( not ( = ?auto_569418 ?auto_569423 ) ) ( not ( = ?auto_569418 ?auto_569424 ) ) ( not ( = ?auto_569418 ?auto_569425 ) ) ( not ( = ?auto_569418 ?auto_569426 ) ) ( not ( = ?auto_569418 ?auto_569427 ) ) ( not ( = ?auto_569418 ?auto_569428 ) ) ( not ( = ?auto_569418 ?auto_569429 ) ) ( not ( = ?auto_569418 ?auto_569430 ) ) ( not ( = ?auto_569418 ?auto_569431 ) ) ( not ( = ?auto_569418 ?auto_569432 ) ) ( not ( = ?auto_569419 ?auto_569420 ) ) ( not ( = ?auto_569419 ?auto_569421 ) ) ( not ( = ?auto_569419 ?auto_569422 ) ) ( not ( = ?auto_569419 ?auto_569423 ) ) ( not ( = ?auto_569419 ?auto_569424 ) ) ( not ( = ?auto_569419 ?auto_569425 ) ) ( not ( = ?auto_569419 ?auto_569426 ) ) ( not ( = ?auto_569419 ?auto_569427 ) ) ( not ( = ?auto_569419 ?auto_569428 ) ) ( not ( = ?auto_569419 ?auto_569429 ) ) ( not ( = ?auto_569419 ?auto_569430 ) ) ( not ( = ?auto_569419 ?auto_569431 ) ) ( not ( = ?auto_569419 ?auto_569432 ) ) ( not ( = ?auto_569420 ?auto_569421 ) ) ( not ( = ?auto_569420 ?auto_569422 ) ) ( not ( = ?auto_569420 ?auto_569423 ) ) ( not ( = ?auto_569420 ?auto_569424 ) ) ( not ( = ?auto_569420 ?auto_569425 ) ) ( not ( = ?auto_569420 ?auto_569426 ) ) ( not ( = ?auto_569420 ?auto_569427 ) ) ( not ( = ?auto_569420 ?auto_569428 ) ) ( not ( = ?auto_569420 ?auto_569429 ) ) ( not ( = ?auto_569420 ?auto_569430 ) ) ( not ( = ?auto_569420 ?auto_569431 ) ) ( not ( = ?auto_569420 ?auto_569432 ) ) ( not ( = ?auto_569421 ?auto_569422 ) ) ( not ( = ?auto_569421 ?auto_569423 ) ) ( not ( = ?auto_569421 ?auto_569424 ) ) ( not ( = ?auto_569421 ?auto_569425 ) ) ( not ( = ?auto_569421 ?auto_569426 ) ) ( not ( = ?auto_569421 ?auto_569427 ) ) ( not ( = ?auto_569421 ?auto_569428 ) ) ( not ( = ?auto_569421 ?auto_569429 ) ) ( not ( = ?auto_569421 ?auto_569430 ) ) ( not ( = ?auto_569421 ?auto_569431 ) ) ( not ( = ?auto_569421 ?auto_569432 ) ) ( not ( = ?auto_569422 ?auto_569423 ) ) ( not ( = ?auto_569422 ?auto_569424 ) ) ( not ( = ?auto_569422 ?auto_569425 ) ) ( not ( = ?auto_569422 ?auto_569426 ) ) ( not ( = ?auto_569422 ?auto_569427 ) ) ( not ( = ?auto_569422 ?auto_569428 ) ) ( not ( = ?auto_569422 ?auto_569429 ) ) ( not ( = ?auto_569422 ?auto_569430 ) ) ( not ( = ?auto_569422 ?auto_569431 ) ) ( not ( = ?auto_569422 ?auto_569432 ) ) ( not ( = ?auto_569423 ?auto_569424 ) ) ( not ( = ?auto_569423 ?auto_569425 ) ) ( not ( = ?auto_569423 ?auto_569426 ) ) ( not ( = ?auto_569423 ?auto_569427 ) ) ( not ( = ?auto_569423 ?auto_569428 ) ) ( not ( = ?auto_569423 ?auto_569429 ) ) ( not ( = ?auto_569423 ?auto_569430 ) ) ( not ( = ?auto_569423 ?auto_569431 ) ) ( not ( = ?auto_569423 ?auto_569432 ) ) ( not ( = ?auto_569424 ?auto_569425 ) ) ( not ( = ?auto_569424 ?auto_569426 ) ) ( not ( = ?auto_569424 ?auto_569427 ) ) ( not ( = ?auto_569424 ?auto_569428 ) ) ( not ( = ?auto_569424 ?auto_569429 ) ) ( not ( = ?auto_569424 ?auto_569430 ) ) ( not ( = ?auto_569424 ?auto_569431 ) ) ( not ( = ?auto_569424 ?auto_569432 ) ) ( not ( = ?auto_569425 ?auto_569426 ) ) ( not ( = ?auto_569425 ?auto_569427 ) ) ( not ( = ?auto_569425 ?auto_569428 ) ) ( not ( = ?auto_569425 ?auto_569429 ) ) ( not ( = ?auto_569425 ?auto_569430 ) ) ( not ( = ?auto_569425 ?auto_569431 ) ) ( not ( = ?auto_569425 ?auto_569432 ) ) ( not ( = ?auto_569426 ?auto_569427 ) ) ( not ( = ?auto_569426 ?auto_569428 ) ) ( not ( = ?auto_569426 ?auto_569429 ) ) ( not ( = ?auto_569426 ?auto_569430 ) ) ( not ( = ?auto_569426 ?auto_569431 ) ) ( not ( = ?auto_569426 ?auto_569432 ) ) ( not ( = ?auto_569427 ?auto_569428 ) ) ( not ( = ?auto_569427 ?auto_569429 ) ) ( not ( = ?auto_569427 ?auto_569430 ) ) ( not ( = ?auto_569427 ?auto_569431 ) ) ( not ( = ?auto_569427 ?auto_569432 ) ) ( not ( = ?auto_569428 ?auto_569429 ) ) ( not ( = ?auto_569428 ?auto_569430 ) ) ( not ( = ?auto_569428 ?auto_569431 ) ) ( not ( = ?auto_569428 ?auto_569432 ) ) ( not ( = ?auto_569429 ?auto_569430 ) ) ( not ( = ?auto_569429 ?auto_569431 ) ) ( not ( = ?auto_569429 ?auto_569432 ) ) ( not ( = ?auto_569430 ?auto_569431 ) ) ( not ( = ?auto_569430 ?auto_569432 ) ) ( not ( = ?auto_569431 ?auto_569432 ) ) ( ON ?auto_569430 ?auto_569431 ) ( ON ?auto_569429 ?auto_569430 ) ( ON ?auto_569428 ?auto_569429 ) ( ON ?auto_569427 ?auto_569428 ) ( ON ?auto_569426 ?auto_569427 ) ( ON ?auto_569425 ?auto_569426 ) ( ON ?auto_569424 ?auto_569425 ) ( ON ?auto_569423 ?auto_569424 ) ( ON ?auto_569422 ?auto_569423 ) ( ON ?auto_569421 ?auto_569422 ) ( CLEAR ?auto_569419 ) ( ON ?auto_569420 ?auto_569421 ) ( CLEAR ?auto_569420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_569418 ?auto_569419 ?auto_569420 )
      ( MAKE-14PILE ?auto_569418 ?auto_569419 ?auto_569420 ?auto_569421 ?auto_569422 ?auto_569423 ?auto_569424 ?auto_569425 ?auto_569426 ?auto_569427 ?auto_569428 ?auto_569429 ?auto_569430 ?auto_569431 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_569476 - BLOCK
      ?auto_569477 - BLOCK
      ?auto_569478 - BLOCK
      ?auto_569479 - BLOCK
      ?auto_569480 - BLOCK
      ?auto_569481 - BLOCK
      ?auto_569482 - BLOCK
      ?auto_569483 - BLOCK
      ?auto_569484 - BLOCK
      ?auto_569485 - BLOCK
      ?auto_569486 - BLOCK
      ?auto_569487 - BLOCK
      ?auto_569488 - BLOCK
      ?auto_569489 - BLOCK
    )
    :vars
    (
      ?auto_569490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_569489 ?auto_569490 ) ( ON-TABLE ?auto_569476 ) ( not ( = ?auto_569476 ?auto_569477 ) ) ( not ( = ?auto_569476 ?auto_569478 ) ) ( not ( = ?auto_569476 ?auto_569479 ) ) ( not ( = ?auto_569476 ?auto_569480 ) ) ( not ( = ?auto_569476 ?auto_569481 ) ) ( not ( = ?auto_569476 ?auto_569482 ) ) ( not ( = ?auto_569476 ?auto_569483 ) ) ( not ( = ?auto_569476 ?auto_569484 ) ) ( not ( = ?auto_569476 ?auto_569485 ) ) ( not ( = ?auto_569476 ?auto_569486 ) ) ( not ( = ?auto_569476 ?auto_569487 ) ) ( not ( = ?auto_569476 ?auto_569488 ) ) ( not ( = ?auto_569476 ?auto_569489 ) ) ( not ( = ?auto_569476 ?auto_569490 ) ) ( not ( = ?auto_569477 ?auto_569478 ) ) ( not ( = ?auto_569477 ?auto_569479 ) ) ( not ( = ?auto_569477 ?auto_569480 ) ) ( not ( = ?auto_569477 ?auto_569481 ) ) ( not ( = ?auto_569477 ?auto_569482 ) ) ( not ( = ?auto_569477 ?auto_569483 ) ) ( not ( = ?auto_569477 ?auto_569484 ) ) ( not ( = ?auto_569477 ?auto_569485 ) ) ( not ( = ?auto_569477 ?auto_569486 ) ) ( not ( = ?auto_569477 ?auto_569487 ) ) ( not ( = ?auto_569477 ?auto_569488 ) ) ( not ( = ?auto_569477 ?auto_569489 ) ) ( not ( = ?auto_569477 ?auto_569490 ) ) ( not ( = ?auto_569478 ?auto_569479 ) ) ( not ( = ?auto_569478 ?auto_569480 ) ) ( not ( = ?auto_569478 ?auto_569481 ) ) ( not ( = ?auto_569478 ?auto_569482 ) ) ( not ( = ?auto_569478 ?auto_569483 ) ) ( not ( = ?auto_569478 ?auto_569484 ) ) ( not ( = ?auto_569478 ?auto_569485 ) ) ( not ( = ?auto_569478 ?auto_569486 ) ) ( not ( = ?auto_569478 ?auto_569487 ) ) ( not ( = ?auto_569478 ?auto_569488 ) ) ( not ( = ?auto_569478 ?auto_569489 ) ) ( not ( = ?auto_569478 ?auto_569490 ) ) ( not ( = ?auto_569479 ?auto_569480 ) ) ( not ( = ?auto_569479 ?auto_569481 ) ) ( not ( = ?auto_569479 ?auto_569482 ) ) ( not ( = ?auto_569479 ?auto_569483 ) ) ( not ( = ?auto_569479 ?auto_569484 ) ) ( not ( = ?auto_569479 ?auto_569485 ) ) ( not ( = ?auto_569479 ?auto_569486 ) ) ( not ( = ?auto_569479 ?auto_569487 ) ) ( not ( = ?auto_569479 ?auto_569488 ) ) ( not ( = ?auto_569479 ?auto_569489 ) ) ( not ( = ?auto_569479 ?auto_569490 ) ) ( not ( = ?auto_569480 ?auto_569481 ) ) ( not ( = ?auto_569480 ?auto_569482 ) ) ( not ( = ?auto_569480 ?auto_569483 ) ) ( not ( = ?auto_569480 ?auto_569484 ) ) ( not ( = ?auto_569480 ?auto_569485 ) ) ( not ( = ?auto_569480 ?auto_569486 ) ) ( not ( = ?auto_569480 ?auto_569487 ) ) ( not ( = ?auto_569480 ?auto_569488 ) ) ( not ( = ?auto_569480 ?auto_569489 ) ) ( not ( = ?auto_569480 ?auto_569490 ) ) ( not ( = ?auto_569481 ?auto_569482 ) ) ( not ( = ?auto_569481 ?auto_569483 ) ) ( not ( = ?auto_569481 ?auto_569484 ) ) ( not ( = ?auto_569481 ?auto_569485 ) ) ( not ( = ?auto_569481 ?auto_569486 ) ) ( not ( = ?auto_569481 ?auto_569487 ) ) ( not ( = ?auto_569481 ?auto_569488 ) ) ( not ( = ?auto_569481 ?auto_569489 ) ) ( not ( = ?auto_569481 ?auto_569490 ) ) ( not ( = ?auto_569482 ?auto_569483 ) ) ( not ( = ?auto_569482 ?auto_569484 ) ) ( not ( = ?auto_569482 ?auto_569485 ) ) ( not ( = ?auto_569482 ?auto_569486 ) ) ( not ( = ?auto_569482 ?auto_569487 ) ) ( not ( = ?auto_569482 ?auto_569488 ) ) ( not ( = ?auto_569482 ?auto_569489 ) ) ( not ( = ?auto_569482 ?auto_569490 ) ) ( not ( = ?auto_569483 ?auto_569484 ) ) ( not ( = ?auto_569483 ?auto_569485 ) ) ( not ( = ?auto_569483 ?auto_569486 ) ) ( not ( = ?auto_569483 ?auto_569487 ) ) ( not ( = ?auto_569483 ?auto_569488 ) ) ( not ( = ?auto_569483 ?auto_569489 ) ) ( not ( = ?auto_569483 ?auto_569490 ) ) ( not ( = ?auto_569484 ?auto_569485 ) ) ( not ( = ?auto_569484 ?auto_569486 ) ) ( not ( = ?auto_569484 ?auto_569487 ) ) ( not ( = ?auto_569484 ?auto_569488 ) ) ( not ( = ?auto_569484 ?auto_569489 ) ) ( not ( = ?auto_569484 ?auto_569490 ) ) ( not ( = ?auto_569485 ?auto_569486 ) ) ( not ( = ?auto_569485 ?auto_569487 ) ) ( not ( = ?auto_569485 ?auto_569488 ) ) ( not ( = ?auto_569485 ?auto_569489 ) ) ( not ( = ?auto_569485 ?auto_569490 ) ) ( not ( = ?auto_569486 ?auto_569487 ) ) ( not ( = ?auto_569486 ?auto_569488 ) ) ( not ( = ?auto_569486 ?auto_569489 ) ) ( not ( = ?auto_569486 ?auto_569490 ) ) ( not ( = ?auto_569487 ?auto_569488 ) ) ( not ( = ?auto_569487 ?auto_569489 ) ) ( not ( = ?auto_569487 ?auto_569490 ) ) ( not ( = ?auto_569488 ?auto_569489 ) ) ( not ( = ?auto_569488 ?auto_569490 ) ) ( not ( = ?auto_569489 ?auto_569490 ) ) ( ON ?auto_569488 ?auto_569489 ) ( ON ?auto_569487 ?auto_569488 ) ( ON ?auto_569486 ?auto_569487 ) ( ON ?auto_569485 ?auto_569486 ) ( ON ?auto_569484 ?auto_569485 ) ( ON ?auto_569483 ?auto_569484 ) ( ON ?auto_569482 ?auto_569483 ) ( ON ?auto_569481 ?auto_569482 ) ( ON ?auto_569480 ?auto_569481 ) ( ON ?auto_569479 ?auto_569480 ) ( ON ?auto_569478 ?auto_569479 ) ( CLEAR ?auto_569476 ) ( ON ?auto_569477 ?auto_569478 ) ( CLEAR ?auto_569477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_569476 ?auto_569477 )
      ( MAKE-14PILE ?auto_569476 ?auto_569477 ?auto_569478 ?auto_569479 ?auto_569480 ?auto_569481 ?auto_569482 ?auto_569483 ?auto_569484 ?auto_569485 ?auto_569486 ?auto_569487 ?auto_569488 ?auto_569489 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_569534 - BLOCK
      ?auto_569535 - BLOCK
      ?auto_569536 - BLOCK
      ?auto_569537 - BLOCK
      ?auto_569538 - BLOCK
      ?auto_569539 - BLOCK
      ?auto_569540 - BLOCK
      ?auto_569541 - BLOCK
      ?auto_569542 - BLOCK
      ?auto_569543 - BLOCK
      ?auto_569544 - BLOCK
      ?auto_569545 - BLOCK
      ?auto_569546 - BLOCK
      ?auto_569547 - BLOCK
    )
    :vars
    (
      ?auto_569548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_569547 ?auto_569548 ) ( not ( = ?auto_569534 ?auto_569535 ) ) ( not ( = ?auto_569534 ?auto_569536 ) ) ( not ( = ?auto_569534 ?auto_569537 ) ) ( not ( = ?auto_569534 ?auto_569538 ) ) ( not ( = ?auto_569534 ?auto_569539 ) ) ( not ( = ?auto_569534 ?auto_569540 ) ) ( not ( = ?auto_569534 ?auto_569541 ) ) ( not ( = ?auto_569534 ?auto_569542 ) ) ( not ( = ?auto_569534 ?auto_569543 ) ) ( not ( = ?auto_569534 ?auto_569544 ) ) ( not ( = ?auto_569534 ?auto_569545 ) ) ( not ( = ?auto_569534 ?auto_569546 ) ) ( not ( = ?auto_569534 ?auto_569547 ) ) ( not ( = ?auto_569534 ?auto_569548 ) ) ( not ( = ?auto_569535 ?auto_569536 ) ) ( not ( = ?auto_569535 ?auto_569537 ) ) ( not ( = ?auto_569535 ?auto_569538 ) ) ( not ( = ?auto_569535 ?auto_569539 ) ) ( not ( = ?auto_569535 ?auto_569540 ) ) ( not ( = ?auto_569535 ?auto_569541 ) ) ( not ( = ?auto_569535 ?auto_569542 ) ) ( not ( = ?auto_569535 ?auto_569543 ) ) ( not ( = ?auto_569535 ?auto_569544 ) ) ( not ( = ?auto_569535 ?auto_569545 ) ) ( not ( = ?auto_569535 ?auto_569546 ) ) ( not ( = ?auto_569535 ?auto_569547 ) ) ( not ( = ?auto_569535 ?auto_569548 ) ) ( not ( = ?auto_569536 ?auto_569537 ) ) ( not ( = ?auto_569536 ?auto_569538 ) ) ( not ( = ?auto_569536 ?auto_569539 ) ) ( not ( = ?auto_569536 ?auto_569540 ) ) ( not ( = ?auto_569536 ?auto_569541 ) ) ( not ( = ?auto_569536 ?auto_569542 ) ) ( not ( = ?auto_569536 ?auto_569543 ) ) ( not ( = ?auto_569536 ?auto_569544 ) ) ( not ( = ?auto_569536 ?auto_569545 ) ) ( not ( = ?auto_569536 ?auto_569546 ) ) ( not ( = ?auto_569536 ?auto_569547 ) ) ( not ( = ?auto_569536 ?auto_569548 ) ) ( not ( = ?auto_569537 ?auto_569538 ) ) ( not ( = ?auto_569537 ?auto_569539 ) ) ( not ( = ?auto_569537 ?auto_569540 ) ) ( not ( = ?auto_569537 ?auto_569541 ) ) ( not ( = ?auto_569537 ?auto_569542 ) ) ( not ( = ?auto_569537 ?auto_569543 ) ) ( not ( = ?auto_569537 ?auto_569544 ) ) ( not ( = ?auto_569537 ?auto_569545 ) ) ( not ( = ?auto_569537 ?auto_569546 ) ) ( not ( = ?auto_569537 ?auto_569547 ) ) ( not ( = ?auto_569537 ?auto_569548 ) ) ( not ( = ?auto_569538 ?auto_569539 ) ) ( not ( = ?auto_569538 ?auto_569540 ) ) ( not ( = ?auto_569538 ?auto_569541 ) ) ( not ( = ?auto_569538 ?auto_569542 ) ) ( not ( = ?auto_569538 ?auto_569543 ) ) ( not ( = ?auto_569538 ?auto_569544 ) ) ( not ( = ?auto_569538 ?auto_569545 ) ) ( not ( = ?auto_569538 ?auto_569546 ) ) ( not ( = ?auto_569538 ?auto_569547 ) ) ( not ( = ?auto_569538 ?auto_569548 ) ) ( not ( = ?auto_569539 ?auto_569540 ) ) ( not ( = ?auto_569539 ?auto_569541 ) ) ( not ( = ?auto_569539 ?auto_569542 ) ) ( not ( = ?auto_569539 ?auto_569543 ) ) ( not ( = ?auto_569539 ?auto_569544 ) ) ( not ( = ?auto_569539 ?auto_569545 ) ) ( not ( = ?auto_569539 ?auto_569546 ) ) ( not ( = ?auto_569539 ?auto_569547 ) ) ( not ( = ?auto_569539 ?auto_569548 ) ) ( not ( = ?auto_569540 ?auto_569541 ) ) ( not ( = ?auto_569540 ?auto_569542 ) ) ( not ( = ?auto_569540 ?auto_569543 ) ) ( not ( = ?auto_569540 ?auto_569544 ) ) ( not ( = ?auto_569540 ?auto_569545 ) ) ( not ( = ?auto_569540 ?auto_569546 ) ) ( not ( = ?auto_569540 ?auto_569547 ) ) ( not ( = ?auto_569540 ?auto_569548 ) ) ( not ( = ?auto_569541 ?auto_569542 ) ) ( not ( = ?auto_569541 ?auto_569543 ) ) ( not ( = ?auto_569541 ?auto_569544 ) ) ( not ( = ?auto_569541 ?auto_569545 ) ) ( not ( = ?auto_569541 ?auto_569546 ) ) ( not ( = ?auto_569541 ?auto_569547 ) ) ( not ( = ?auto_569541 ?auto_569548 ) ) ( not ( = ?auto_569542 ?auto_569543 ) ) ( not ( = ?auto_569542 ?auto_569544 ) ) ( not ( = ?auto_569542 ?auto_569545 ) ) ( not ( = ?auto_569542 ?auto_569546 ) ) ( not ( = ?auto_569542 ?auto_569547 ) ) ( not ( = ?auto_569542 ?auto_569548 ) ) ( not ( = ?auto_569543 ?auto_569544 ) ) ( not ( = ?auto_569543 ?auto_569545 ) ) ( not ( = ?auto_569543 ?auto_569546 ) ) ( not ( = ?auto_569543 ?auto_569547 ) ) ( not ( = ?auto_569543 ?auto_569548 ) ) ( not ( = ?auto_569544 ?auto_569545 ) ) ( not ( = ?auto_569544 ?auto_569546 ) ) ( not ( = ?auto_569544 ?auto_569547 ) ) ( not ( = ?auto_569544 ?auto_569548 ) ) ( not ( = ?auto_569545 ?auto_569546 ) ) ( not ( = ?auto_569545 ?auto_569547 ) ) ( not ( = ?auto_569545 ?auto_569548 ) ) ( not ( = ?auto_569546 ?auto_569547 ) ) ( not ( = ?auto_569546 ?auto_569548 ) ) ( not ( = ?auto_569547 ?auto_569548 ) ) ( ON ?auto_569546 ?auto_569547 ) ( ON ?auto_569545 ?auto_569546 ) ( ON ?auto_569544 ?auto_569545 ) ( ON ?auto_569543 ?auto_569544 ) ( ON ?auto_569542 ?auto_569543 ) ( ON ?auto_569541 ?auto_569542 ) ( ON ?auto_569540 ?auto_569541 ) ( ON ?auto_569539 ?auto_569540 ) ( ON ?auto_569538 ?auto_569539 ) ( ON ?auto_569537 ?auto_569538 ) ( ON ?auto_569536 ?auto_569537 ) ( ON ?auto_569535 ?auto_569536 ) ( ON ?auto_569534 ?auto_569535 ) ( CLEAR ?auto_569534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_569534 )
      ( MAKE-14PILE ?auto_569534 ?auto_569535 ?auto_569536 ?auto_569537 ?auto_569538 ?auto_569539 ?auto_569540 ?auto_569541 ?auto_569542 ?auto_569543 ?auto_569544 ?auto_569545 ?auto_569546 ?auto_569547 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_569593 - BLOCK
      ?auto_569594 - BLOCK
      ?auto_569595 - BLOCK
      ?auto_569596 - BLOCK
      ?auto_569597 - BLOCK
      ?auto_569598 - BLOCK
      ?auto_569599 - BLOCK
      ?auto_569600 - BLOCK
      ?auto_569601 - BLOCK
      ?auto_569602 - BLOCK
      ?auto_569603 - BLOCK
      ?auto_569604 - BLOCK
      ?auto_569605 - BLOCK
      ?auto_569606 - BLOCK
      ?auto_569607 - BLOCK
    )
    :vars
    (
      ?auto_569608 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_569606 ) ( ON ?auto_569607 ?auto_569608 ) ( CLEAR ?auto_569607 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_569593 ) ( ON ?auto_569594 ?auto_569593 ) ( ON ?auto_569595 ?auto_569594 ) ( ON ?auto_569596 ?auto_569595 ) ( ON ?auto_569597 ?auto_569596 ) ( ON ?auto_569598 ?auto_569597 ) ( ON ?auto_569599 ?auto_569598 ) ( ON ?auto_569600 ?auto_569599 ) ( ON ?auto_569601 ?auto_569600 ) ( ON ?auto_569602 ?auto_569601 ) ( ON ?auto_569603 ?auto_569602 ) ( ON ?auto_569604 ?auto_569603 ) ( ON ?auto_569605 ?auto_569604 ) ( ON ?auto_569606 ?auto_569605 ) ( not ( = ?auto_569593 ?auto_569594 ) ) ( not ( = ?auto_569593 ?auto_569595 ) ) ( not ( = ?auto_569593 ?auto_569596 ) ) ( not ( = ?auto_569593 ?auto_569597 ) ) ( not ( = ?auto_569593 ?auto_569598 ) ) ( not ( = ?auto_569593 ?auto_569599 ) ) ( not ( = ?auto_569593 ?auto_569600 ) ) ( not ( = ?auto_569593 ?auto_569601 ) ) ( not ( = ?auto_569593 ?auto_569602 ) ) ( not ( = ?auto_569593 ?auto_569603 ) ) ( not ( = ?auto_569593 ?auto_569604 ) ) ( not ( = ?auto_569593 ?auto_569605 ) ) ( not ( = ?auto_569593 ?auto_569606 ) ) ( not ( = ?auto_569593 ?auto_569607 ) ) ( not ( = ?auto_569593 ?auto_569608 ) ) ( not ( = ?auto_569594 ?auto_569595 ) ) ( not ( = ?auto_569594 ?auto_569596 ) ) ( not ( = ?auto_569594 ?auto_569597 ) ) ( not ( = ?auto_569594 ?auto_569598 ) ) ( not ( = ?auto_569594 ?auto_569599 ) ) ( not ( = ?auto_569594 ?auto_569600 ) ) ( not ( = ?auto_569594 ?auto_569601 ) ) ( not ( = ?auto_569594 ?auto_569602 ) ) ( not ( = ?auto_569594 ?auto_569603 ) ) ( not ( = ?auto_569594 ?auto_569604 ) ) ( not ( = ?auto_569594 ?auto_569605 ) ) ( not ( = ?auto_569594 ?auto_569606 ) ) ( not ( = ?auto_569594 ?auto_569607 ) ) ( not ( = ?auto_569594 ?auto_569608 ) ) ( not ( = ?auto_569595 ?auto_569596 ) ) ( not ( = ?auto_569595 ?auto_569597 ) ) ( not ( = ?auto_569595 ?auto_569598 ) ) ( not ( = ?auto_569595 ?auto_569599 ) ) ( not ( = ?auto_569595 ?auto_569600 ) ) ( not ( = ?auto_569595 ?auto_569601 ) ) ( not ( = ?auto_569595 ?auto_569602 ) ) ( not ( = ?auto_569595 ?auto_569603 ) ) ( not ( = ?auto_569595 ?auto_569604 ) ) ( not ( = ?auto_569595 ?auto_569605 ) ) ( not ( = ?auto_569595 ?auto_569606 ) ) ( not ( = ?auto_569595 ?auto_569607 ) ) ( not ( = ?auto_569595 ?auto_569608 ) ) ( not ( = ?auto_569596 ?auto_569597 ) ) ( not ( = ?auto_569596 ?auto_569598 ) ) ( not ( = ?auto_569596 ?auto_569599 ) ) ( not ( = ?auto_569596 ?auto_569600 ) ) ( not ( = ?auto_569596 ?auto_569601 ) ) ( not ( = ?auto_569596 ?auto_569602 ) ) ( not ( = ?auto_569596 ?auto_569603 ) ) ( not ( = ?auto_569596 ?auto_569604 ) ) ( not ( = ?auto_569596 ?auto_569605 ) ) ( not ( = ?auto_569596 ?auto_569606 ) ) ( not ( = ?auto_569596 ?auto_569607 ) ) ( not ( = ?auto_569596 ?auto_569608 ) ) ( not ( = ?auto_569597 ?auto_569598 ) ) ( not ( = ?auto_569597 ?auto_569599 ) ) ( not ( = ?auto_569597 ?auto_569600 ) ) ( not ( = ?auto_569597 ?auto_569601 ) ) ( not ( = ?auto_569597 ?auto_569602 ) ) ( not ( = ?auto_569597 ?auto_569603 ) ) ( not ( = ?auto_569597 ?auto_569604 ) ) ( not ( = ?auto_569597 ?auto_569605 ) ) ( not ( = ?auto_569597 ?auto_569606 ) ) ( not ( = ?auto_569597 ?auto_569607 ) ) ( not ( = ?auto_569597 ?auto_569608 ) ) ( not ( = ?auto_569598 ?auto_569599 ) ) ( not ( = ?auto_569598 ?auto_569600 ) ) ( not ( = ?auto_569598 ?auto_569601 ) ) ( not ( = ?auto_569598 ?auto_569602 ) ) ( not ( = ?auto_569598 ?auto_569603 ) ) ( not ( = ?auto_569598 ?auto_569604 ) ) ( not ( = ?auto_569598 ?auto_569605 ) ) ( not ( = ?auto_569598 ?auto_569606 ) ) ( not ( = ?auto_569598 ?auto_569607 ) ) ( not ( = ?auto_569598 ?auto_569608 ) ) ( not ( = ?auto_569599 ?auto_569600 ) ) ( not ( = ?auto_569599 ?auto_569601 ) ) ( not ( = ?auto_569599 ?auto_569602 ) ) ( not ( = ?auto_569599 ?auto_569603 ) ) ( not ( = ?auto_569599 ?auto_569604 ) ) ( not ( = ?auto_569599 ?auto_569605 ) ) ( not ( = ?auto_569599 ?auto_569606 ) ) ( not ( = ?auto_569599 ?auto_569607 ) ) ( not ( = ?auto_569599 ?auto_569608 ) ) ( not ( = ?auto_569600 ?auto_569601 ) ) ( not ( = ?auto_569600 ?auto_569602 ) ) ( not ( = ?auto_569600 ?auto_569603 ) ) ( not ( = ?auto_569600 ?auto_569604 ) ) ( not ( = ?auto_569600 ?auto_569605 ) ) ( not ( = ?auto_569600 ?auto_569606 ) ) ( not ( = ?auto_569600 ?auto_569607 ) ) ( not ( = ?auto_569600 ?auto_569608 ) ) ( not ( = ?auto_569601 ?auto_569602 ) ) ( not ( = ?auto_569601 ?auto_569603 ) ) ( not ( = ?auto_569601 ?auto_569604 ) ) ( not ( = ?auto_569601 ?auto_569605 ) ) ( not ( = ?auto_569601 ?auto_569606 ) ) ( not ( = ?auto_569601 ?auto_569607 ) ) ( not ( = ?auto_569601 ?auto_569608 ) ) ( not ( = ?auto_569602 ?auto_569603 ) ) ( not ( = ?auto_569602 ?auto_569604 ) ) ( not ( = ?auto_569602 ?auto_569605 ) ) ( not ( = ?auto_569602 ?auto_569606 ) ) ( not ( = ?auto_569602 ?auto_569607 ) ) ( not ( = ?auto_569602 ?auto_569608 ) ) ( not ( = ?auto_569603 ?auto_569604 ) ) ( not ( = ?auto_569603 ?auto_569605 ) ) ( not ( = ?auto_569603 ?auto_569606 ) ) ( not ( = ?auto_569603 ?auto_569607 ) ) ( not ( = ?auto_569603 ?auto_569608 ) ) ( not ( = ?auto_569604 ?auto_569605 ) ) ( not ( = ?auto_569604 ?auto_569606 ) ) ( not ( = ?auto_569604 ?auto_569607 ) ) ( not ( = ?auto_569604 ?auto_569608 ) ) ( not ( = ?auto_569605 ?auto_569606 ) ) ( not ( = ?auto_569605 ?auto_569607 ) ) ( not ( = ?auto_569605 ?auto_569608 ) ) ( not ( = ?auto_569606 ?auto_569607 ) ) ( not ( = ?auto_569606 ?auto_569608 ) ) ( not ( = ?auto_569607 ?auto_569608 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_569607 ?auto_569608 )
      ( !STACK ?auto_569607 ?auto_569606 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_569655 - BLOCK
      ?auto_569656 - BLOCK
      ?auto_569657 - BLOCK
      ?auto_569658 - BLOCK
      ?auto_569659 - BLOCK
      ?auto_569660 - BLOCK
      ?auto_569661 - BLOCK
      ?auto_569662 - BLOCK
      ?auto_569663 - BLOCK
      ?auto_569664 - BLOCK
      ?auto_569665 - BLOCK
      ?auto_569666 - BLOCK
      ?auto_569667 - BLOCK
      ?auto_569668 - BLOCK
      ?auto_569669 - BLOCK
    )
    :vars
    (
      ?auto_569670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_569669 ?auto_569670 ) ( ON-TABLE ?auto_569655 ) ( ON ?auto_569656 ?auto_569655 ) ( ON ?auto_569657 ?auto_569656 ) ( ON ?auto_569658 ?auto_569657 ) ( ON ?auto_569659 ?auto_569658 ) ( ON ?auto_569660 ?auto_569659 ) ( ON ?auto_569661 ?auto_569660 ) ( ON ?auto_569662 ?auto_569661 ) ( ON ?auto_569663 ?auto_569662 ) ( ON ?auto_569664 ?auto_569663 ) ( ON ?auto_569665 ?auto_569664 ) ( ON ?auto_569666 ?auto_569665 ) ( ON ?auto_569667 ?auto_569666 ) ( not ( = ?auto_569655 ?auto_569656 ) ) ( not ( = ?auto_569655 ?auto_569657 ) ) ( not ( = ?auto_569655 ?auto_569658 ) ) ( not ( = ?auto_569655 ?auto_569659 ) ) ( not ( = ?auto_569655 ?auto_569660 ) ) ( not ( = ?auto_569655 ?auto_569661 ) ) ( not ( = ?auto_569655 ?auto_569662 ) ) ( not ( = ?auto_569655 ?auto_569663 ) ) ( not ( = ?auto_569655 ?auto_569664 ) ) ( not ( = ?auto_569655 ?auto_569665 ) ) ( not ( = ?auto_569655 ?auto_569666 ) ) ( not ( = ?auto_569655 ?auto_569667 ) ) ( not ( = ?auto_569655 ?auto_569668 ) ) ( not ( = ?auto_569655 ?auto_569669 ) ) ( not ( = ?auto_569655 ?auto_569670 ) ) ( not ( = ?auto_569656 ?auto_569657 ) ) ( not ( = ?auto_569656 ?auto_569658 ) ) ( not ( = ?auto_569656 ?auto_569659 ) ) ( not ( = ?auto_569656 ?auto_569660 ) ) ( not ( = ?auto_569656 ?auto_569661 ) ) ( not ( = ?auto_569656 ?auto_569662 ) ) ( not ( = ?auto_569656 ?auto_569663 ) ) ( not ( = ?auto_569656 ?auto_569664 ) ) ( not ( = ?auto_569656 ?auto_569665 ) ) ( not ( = ?auto_569656 ?auto_569666 ) ) ( not ( = ?auto_569656 ?auto_569667 ) ) ( not ( = ?auto_569656 ?auto_569668 ) ) ( not ( = ?auto_569656 ?auto_569669 ) ) ( not ( = ?auto_569656 ?auto_569670 ) ) ( not ( = ?auto_569657 ?auto_569658 ) ) ( not ( = ?auto_569657 ?auto_569659 ) ) ( not ( = ?auto_569657 ?auto_569660 ) ) ( not ( = ?auto_569657 ?auto_569661 ) ) ( not ( = ?auto_569657 ?auto_569662 ) ) ( not ( = ?auto_569657 ?auto_569663 ) ) ( not ( = ?auto_569657 ?auto_569664 ) ) ( not ( = ?auto_569657 ?auto_569665 ) ) ( not ( = ?auto_569657 ?auto_569666 ) ) ( not ( = ?auto_569657 ?auto_569667 ) ) ( not ( = ?auto_569657 ?auto_569668 ) ) ( not ( = ?auto_569657 ?auto_569669 ) ) ( not ( = ?auto_569657 ?auto_569670 ) ) ( not ( = ?auto_569658 ?auto_569659 ) ) ( not ( = ?auto_569658 ?auto_569660 ) ) ( not ( = ?auto_569658 ?auto_569661 ) ) ( not ( = ?auto_569658 ?auto_569662 ) ) ( not ( = ?auto_569658 ?auto_569663 ) ) ( not ( = ?auto_569658 ?auto_569664 ) ) ( not ( = ?auto_569658 ?auto_569665 ) ) ( not ( = ?auto_569658 ?auto_569666 ) ) ( not ( = ?auto_569658 ?auto_569667 ) ) ( not ( = ?auto_569658 ?auto_569668 ) ) ( not ( = ?auto_569658 ?auto_569669 ) ) ( not ( = ?auto_569658 ?auto_569670 ) ) ( not ( = ?auto_569659 ?auto_569660 ) ) ( not ( = ?auto_569659 ?auto_569661 ) ) ( not ( = ?auto_569659 ?auto_569662 ) ) ( not ( = ?auto_569659 ?auto_569663 ) ) ( not ( = ?auto_569659 ?auto_569664 ) ) ( not ( = ?auto_569659 ?auto_569665 ) ) ( not ( = ?auto_569659 ?auto_569666 ) ) ( not ( = ?auto_569659 ?auto_569667 ) ) ( not ( = ?auto_569659 ?auto_569668 ) ) ( not ( = ?auto_569659 ?auto_569669 ) ) ( not ( = ?auto_569659 ?auto_569670 ) ) ( not ( = ?auto_569660 ?auto_569661 ) ) ( not ( = ?auto_569660 ?auto_569662 ) ) ( not ( = ?auto_569660 ?auto_569663 ) ) ( not ( = ?auto_569660 ?auto_569664 ) ) ( not ( = ?auto_569660 ?auto_569665 ) ) ( not ( = ?auto_569660 ?auto_569666 ) ) ( not ( = ?auto_569660 ?auto_569667 ) ) ( not ( = ?auto_569660 ?auto_569668 ) ) ( not ( = ?auto_569660 ?auto_569669 ) ) ( not ( = ?auto_569660 ?auto_569670 ) ) ( not ( = ?auto_569661 ?auto_569662 ) ) ( not ( = ?auto_569661 ?auto_569663 ) ) ( not ( = ?auto_569661 ?auto_569664 ) ) ( not ( = ?auto_569661 ?auto_569665 ) ) ( not ( = ?auto_569661 ?auto_569666 ) ) ( not ( = ?auto_569661 ?auto_569667 ) ) ( not ( = ?auto_569661 ?auto_569668 ) ) ( not ( = ?auto_569661 ?auto_569669 ) ) ( not ( = ?auto_569661 ?auto_569670 ) ) ( not ( = ?auto_569662 ?auto_569663 ) ) ( not ( = ?auto_569662 ?auto_569664 ) ) ( not ( = ?auto_569662 ?auto_569665 ) ) ( not ( = ?auto_569662 ?auto_569666 ) ) ( not ( = ?auto_569662 ?auto_569667 ) ) ( not ( = ?auto_569662 ?auto_569668 ) ) ( not ( = ?auto_569662 ?auto_569669 ) ) ( not ( = ?auto_569662 ?auto_569670 ) ) ( not ( = ?auto_569663 ?auto_569664 ) ) ( not ( = ?auto_569663 ?auto_569665 ) ) ( not ( = ?auto_569663 ?auto_569666 ) ) ( not ( = ?auto_569663 ?auto_569667 ) ) ( not ( = ?auto_569663 ?auto_569668 ) ) ( not ( = ?auto_569663 ?auto_569669 ) ) ( not ( = ?auto_569663 ?auto_569670 ) ) ( not ( = ?auto_569664 ?auto_569665 ) ) ( not ( = ?auto_569664 ?auto_569666 ) ) ( not ( = ?auto_569664 ?auto_569667 ) ) ( not ( = ?auto_569664 ?auto_569668 ) ) ( not ( = ?auto_569664 ?auto_569669 ) ) ( not ( = ?auto_569664 ?auto_569670 ) ) ( not ( = ?auto_569665 ?auto_569666 ) ) ( not ( = ?auto_569665 ?auto_569667 ) ) ( not ( = ?auto_569665 ?auto_569668 ) ) ( not ( = ?auto_569665 ?auto_569669 ) ) ( not ( = ?auto_569665 ?auto_569670 ) ) ( not ( = ?auto_569666 ?auto_569667 ) ) ( not ( = ?auto_569666 ?auto_569668 ) ) ( not ( = ?auto_569666 ?auto_569669 ) ) ( not ( = ?auto_569666 ?auto_569670 ) ) ( not ( = ?auto_569667 ?auto_569668 ) ) ( not ( = ?auto_569667 ?auto_569669 ) ) ( not ( = ?auto_569667 ?auto_569670 ) ) ( not ( = ?auto_569668 ?auto_569669 ) ) ( not ( = ?auto_569668 ?auto_569670 ) ) ( not ( = ?auto_569669 ?auto_569670 ) ) ( CLEAR ?auto_569667 ) ( ON ?auto_569668 ?auto_569669 ) ( CLEAR ?auto_569668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_569655 ?auto_569656 ?auto_569657 ?auto_569658 ?auto_569659 ?auto_569660 ?auto_569661 ?auto_569662 ?auto_569663 ?auto_569664 ?auto_569665 ?auto_569666 ?auto_569667 ?auto_569668 )
      ( MAKE-15PILE ?auto_569655 ?auto_569656 ?auto_569657 ?auto_569658 ?auto_569659 ?auto_569660 ?auto_569661 ?auto_569662 ?auto_569663 ?auto_569664 ?auto_569665 ?auto_569666 ?auto_569667 ?auto_569668 ?auto_569669 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_569717 - BLOCK
      ?auto_569718 - BLOCK
      ?auto_569719 - BLOCK
      ?auto_569720 - BLOCK
      ?auto_569721 - BLOCK
      ?auto_569722 - BLOCK
      ?auto_569723 - BLOCK
      ?auto_569724 - BLOCK
      ?auto_569725 - BLOCK
      ?auto_569726 - BLOCK
      ?auto_569727 - BLOCK
      ?auto_569728 - BLOCK
      ?auto_569729 - BLOCK
      ?auto_569730 - BLOCK
      ?auto_569731 - BLOCK
    )
    :vars
    (
      ?auto_569732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_569731 ?auto_569732 ) ( ON-TABLE ?auto_569717 ) ( ON ?auto_569718 ?auto_569717 ) ( ON ?auto_569719 ?auto_569718 ) ( ON ?auto_569720 ?auto_569719 ) ( ON ?auto_569721 ?auto_569720 ) ( ON ?auto_569722 ?auto_569721 ) ( ON ?auto_569723 ?auto_569722 ) ( ON ?auto_569724 ?auto_569723 ) ( ON ?auto_569725 ?auto_569724 ) ( ON ?auto_569726 ?auto_569725 ) ( ON ?auto_569727 ?auto_569726 ) ( ON ?auto_569728 ?auto_569727 ) ( not ( = ?auto_569717 ?auto_569718 ) ) ( not ( = ?auto_569717 ?auto_569719 ) ) ( not ( = ?auto_569717 ?auto_569720 ) ) ( not ( = ?auto_569717 ?auto_569721 ) ) ( not ( = ?auto_569717 ?auto_569722 ) ) ( not ( = ?auto_569717 ?auto_569723 ) ) ( not ( = ?auto_569717 ?auto_569724 ) ) ( not ( = ?auto_569717 ?auto_569725 ) ) ( not ( = ?auto_569717 ?auto_569726 ) ) ( not ( = ?auto_569717 ?auto_569727 ) ) ( not ( = ?auto_569717 ?auto_569728 ) ) ( not ( = ?auto_569717 ?auto_569729 ) ) ( not ( = ?auto_569717 ?auto_569730 ) ) ( not ( = ?auto_569717 ?auto_569731 ) ) ( not ( = ?auto_569717 ?auto_569732 ) ) ( not ( = ?auto_569718 ?auto_569719 ) ) ( not ( = ?auto_569718 ?auto_569720 ) ) ( not ( = ?auto_569718 ?auto_569721 ) ) ( not ( = ?auto_569718 ?auto_569722 ) ) ( not ( = ?auto_569718 ?auto_569723 ) ) ( not ( = ?auto_569718 ?auto_569724 ) ) ( not ( = ?auto_569718 ?auto_569725 ) ) ( not ( = ?auto_569718 ?auto_569726 ) ) ( not ( = ?auto_569718 ?auto_569727 ) ) ( not ( = ?auto_569718 ?auto_569728 ) ) ( not ( = ?auto_569718 ?auto_569729 ) ) ( not ( = ?auto_569718 ?auto_569730 ) ) ( not ( = ?auto_569718 ?auto_569731 ) ) ( not ( = ?auto_569718 ?auto_569732 ) ) ( not ( = ?auto_569719 ?auto_569720 ) ) ( not ( = ?auto_569719 ?auto_569721 ) ) ( not ( = ?auto_569719 ?auto_569722 ) ) ( not ( = ?auto_569719 ?auto_569723 ) ) ( not ( = ?auto_569719 ?auto_569724 ) ) ( not ( = ?auto_569719 ?auto_569725 ) ) ( not ( = ?auto_569719 ?auto_569726 ) ) ( not ( = ?auto_569719 ?auto_569727 ) ) ( not ( = ?auto_569719 ?auto_569728 ) ) ( not ( = ?auto_569719 ?auto_569729 ) ) ( not ( = ?auto_569719 ?auto_569730 ) ) ( not ( = ?auto_569719 ?auto_569731 ) ) ( not ( = ?auto_569719 ?auto_569732 ) ) ( not ( = ?auto_569720 ?auto_569721 ) ) ( not ( = ?auto_569720 ?auto_569722 ) ) ( not ( = ?auto_569720 ?auto_569723 ) ) ( not ( = ?auto_569720 ?auto_569724 ) ) ( not ( = ?auto_569720 ?auto_569725 ) ) ( not ( = ?auto_569720 ?auto_569726 ) ) ( not ( = ?auto_569720 ?auto_569727 ) ) ( not ( = ?auto_569720 ?auto_569728 ) ) ( not ( = ?auto_569720 ?auto_569729 ) ) ( not ( = ?auto_569720 ?auto_569730 ) ) ( not ( = ?auto_569720 ?auto_569731 ) ) ( not ( = ?auto_569720 ?auto_569732 ) ) ( not ( = ?auto_569721 ?auto_569722 ) ) ( not ( = ?auto_569721 ?auto_569723 ) ) ( not ( = ?auto_569721 ?auto_569724 ) ) ( not ( = ?auto_569721 ?auto_569725 ) ) ( not ( = ?auto_569721 ?auto_569726 ) ) ( not ( = ?auto_569721 ?auto_569727 ) ) ( not ( = ?auto_569721 ?auto_569728 ) ) ( not ( = ?auto_569721 ?auto_569729 ) ) ( not ( = ?auto_569721 ?auto_569730 ) ) ( not ( = ?auto_569721 ?auto_569731 ) ) ( not ( = ?auto_569721 ?auto_569732 ) ) ( not ( = ?auto_569722 ?auto_569723 ) ) ( not ( = ?auto_569722 ?auto_569724 ) ) ( not ( = ?auto_569722 ?auto_569725 ) ) ( not ( = ?auto_569722 ?auto_569726 ) ) ( not ( = ?auto_569722 ?auto_569727 ) ) ( not ( = ?auto_569722 ?auto_569728 ) ) ( not ( = ?auto_569722 ?auto_569729 ) ) ( not ( = ?auto_569722 ?auto_569730 ) ) ( not ( = ?auto_569722 ?auto_569731 ) ) ( not ( = ?auto_569722 ?auto_569732 ) ) ( not ( = ?auto_569723 ?auto_569724 ) ) ( not ( = ?auto_569723 ?auto_569725 ) ) ( not ( = ?auto_569723 ?auto_569726 ) ) ( not ( = ?auto_569723 ?auto_569727 ) ) ( not ( = ?auto_569723 ?auto_569728 ) ) ( not ( = ?auto_569723 ?auto_569729 ) ) ( not ( = ?auto_569723 ?auto_569730 ) ) ( not ( = ?auto_569723 ?auto_569731 ) ) ( not ( = ?auto_569723 ?auto_569732 ) ) ( not ( = ?auto_569724 ?auto_569725 ) ) ( not ( = ?auto_569724 ?auto_569726 ) ) ( not ( = ?auto_569724 ?auto_569727 ) ) ( not ( = ?auto_569724 ?auto_569728 ) ) ( not ( = ?auto_569724 ?auto_569729 ) ) ( not ( = ?auto_569724 ?auto_569730 ) ) ( not ( = ?auto_569724 ?auto_569731 ) ) ( not ( = ?auto_569724 ?auto_569732 ) ) ( not ( = ?auto_569725 ?auto_569726 ) ) ( not ( = ?auto_569725 ?auto_569727 ) ) ( not ( = ?auto_569725 ?auto_569728 ) ) ( not ( = ?auto_569725 ?auto_569729 ) ) ( not ( = ?auto_569725 ?auto_569730 ) ) ( not ( = ?auto_569725 ?auto_569731 ) ) ( not ( = ?auto_569725 ?auto_569732 ) ) ( not ( = ?auto_569726 ?auto_569727 ) ) ( not ( = ?auto_569726 ?auto_569728 ) ) ( not ( = ?auto_569726 ?auto_569729 ) ) ( not ( = ?auto_569726 ?auto_569730 ) ) ( not ( = ?auto_569726 ?auto_569731 ) ) ( not ( = ?auto_569726 ?auto_569732 ) ) ( not ( = ?auto_569727 ?auto_569728 ) ) ( not ( = ?auto_569727 ?auto_569729 ) ) ( not ( = ?auto_569727 ?auto_569730 ) ) ( not ( = ?auto_569727 ?auto_569731 ) ) ( not ( = ?auto_569727 ?auto_569732 ) ) ( not ( = ?auto_569728 ?auto_569729 ) ) ( not ( = ?auto_569728 ?auto_569730 ) ) ( not ( = ?auto_569728 ?auto_569731 ) ) ( not ( = ?auto_569728 ?auto_569732 ) ) ( not ( = ?auto_569729 ?auto_569730 ) ) ( not ( = ?auto_569729 ?auto_569731 ) ) ( not ( = ?auto_569729 ?auto_569732 ) ) ( not ( = ?auto_569730 ?auto_569731 ) ) ( not ( = ?auto_569730 ?auto_569732 ) ) ( not ( = ?auto_569731 ?auto_569732 ) ) ( ON ?auto_569730 ?auto_569731 ) ( CLEAR ?auto_569728 ) ( ON ?auto_569729 ?auto_569730 ) ( CLEAR ?auto_569729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_569717 ?auto_569718 ?auto_569719 ?auto_569720 ?auto_569721 ?auto_569722 ?auto_569723 ?auto_569724 ?auto_569725 ?auto_569726 ?auto_569727 ?auto_569728 ?auto_569729 )
      ( MAKE-15PILE ?auto_569717 ?auto_569718 ?auto_569719 ?auto_569720 ?auto_569721 ?auto_569722 ?auto_569723 ?auto_569724 ?auto_569725 ?auto_569726 ?auto_569727 ?auto_569728 ?auto_569729 ?auto_569730 ?auto_569731 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_569779 - BLOCK
      ?auto_569780 - BLOCK
      ?auto_569781 - BLOCK
      ?auto_569782 - BLOCK
      ?auto_569783 - BLOCK
      ?auto_569784 - BLOCK
      ?auto_569785 - BLOCK
      ?auto_569786 - BLOCK
      ?auto_569787 - BLOCK
      ?auto_569788 - BLOCK
      ?auto_569789 - BLOCK
      ?auto_569790 - BLOCK
      ?auto_569791 - BLOCK
      ?auto_569792 - BLOCK
      ?auto_569793 - BLOCK
    )
    :vars
    (
      ?auto_569794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_569793 ?auto_569794 ) ( ON-TABLE ?auto_569779 ) ( ON ?auto_569780 ?auto_569779 ) ( ON ?auto_569781 ?auto_569780 ) ( ON ?auto_569782 ?auto_569781 ) ( ON ?auto_569783 ?auto_569782 ) ( ON ?auto_569784 ?auto_569783 ) ( ON ?auto_569785 ?auto_569784 ) ( ON ?auto_569786 ?auto_569785 ) ( ON ?auto_569787 ?auto_569786 ) ( ON ?auto_569788 ?auto_569787 ) ( ON ?auto_569789 ?auto_569788 ) ( not ( = ?auto_569779 ?auto_569780 ) ) ( not ( = ?auto_569779 ?auto_569781 ) ) ( not ( = ?auto_569779 ?auto_569782 ) ) ( not ( = ?auto_569779 ?auto_569783 ) ) ( not ( = ?auto_569779 ?auto_569784 ) ) ( not ( = ?auto_569779 ?auto_569785 ) ) ( not ( = ?auto_569779 ?auto_569786 ) ) ( not ( = ?auto_569779 ?auto_569787 ) ) ( not ( = ?auto_569779 ?auto_569788 ) ) ( not ( = ?auto_569779 ?auto_569789 ) ) ( not ( = ?auto_569779 ?auto_569790 ) ) ( not ( = ?auto_569779 ?auto_569791 ) ) ( not ( = ?auto_569779 ?auto_569792 ) ) ( not ( = ?auto_569779 ?auto_569793 ) ) ( not ( = ?auto_569779 ?auto_569794 ) ) ( not ( = ?auto_569780 ?auto_569781 ) ) ( not ( = ?auto_569780 ?auto_569782 ) ) ( not ( = ?auto_569780 ?auto_569783 ) ) ( not ( = ?auto_569780 ?auto_569784 ) ) ( not ( = ?auto_569780 ?auto_569785 ) ) ( not ( = ?auto_569780 ?auto_569786 ) ) ( not ( = ?auto_569780 ?auto_569787 ) ) ( not ( = ?auto_569780 ?auto_569788 ) ) ( not ( = ?auto_569780 ?auto_569789 ) ) ( not ( = ?auto_569780 ?auto_569790 ) ) ( not ( = ?auto_569780 ?auto_569791 ) ) ( not ( = ?auto_569780 ?auto_569792 ) ) ( not ( = ?auto_569780 ?auto_569793 ) ) ( not ( = ?auto_569780 ?auto_569794 ) ) ( not ( = ?auto_569781 ?auto_569782 ) ) ( not ( = ?auto_569781 ?auto_569783 ) ) ( not ( = ?auto_569781 ?auto_569784 ) ) ( not ( = ?auto_569781 ?auto_569785 ) ) ( not ( = ?auto_569781 ?auto_569786 ) ) ( not ( = ?auto_569781 ?auto_569787 ) ) ( not ( = ?auto_569781 ?auto_569788 ) ) ( not ( = ?auto_569781 ?auto_569789 ) ) ( not ( = ?auto_569781 ?auto_569790 ) ) ( not ( = ?auto_569781 ?auto_569791 ) ) ( not ( = ?auto_569781 ?auto_569792 ) ) ( not ( = ?auto_569781 ?auto_569793 ) ) ( not ( = ?auto_569781 ?auto_569794 ) ) ( not ( = ?auto_569782 ?auto_569783 ) ) ( not ( = ?auto_569782 ?auto_569784 ) ) ( not ( = ?auto_569782 ?auto_569785 ) ) ( not ( = ?auto_569782 ?auto_569786 ) ) ( not ( = ?auto_569782 ?auto_569787 ) ) ( not ( = ?auto_569782 ?auto_569788 ) ) ( not ( = ?auto_569782 ?auto_569789 ) ) ( not ( = ?auto_569782 ?auto_569790 ) ) ( not ( = ?auto_569782 ?auto_569791 ) ) ( not ( = ?auto_569782 ?auto_569792 ) ) ( not ( = ?auto_569782 ?auto_569793 ) ) ( not ( = ?auto_569782 ?auto_569794 ) ) ( not ( = ?auto_569783 ?auto_569784 ) ) ( not ( = ?auto_569783 ?auto_569785 ) ) ( not ( = ?auto_569783 ?auto_569786 ) ) ( not ( = ?auto_569783 ?auto_569787 ) ) ( not ( = ?auto_569783 ?auto_569788 ) ) ( not ( = ?auto_569783 ?auto_569789 ) ) ( not ( = ?auto_569783 ?auto_569790 ) ) ( not ( = ?auto_569783 ?auto_569791 ) ) ( not ( = ?auto_569783 ?auto_569792 ) ) ( not ( = ?auto_569783 ?auto_569793 ) ) ( not ( = ?auto_569783 ?auto_569794 ) ) ( not ( = ?auto_569784 ?auto_569785 ) ) ( not ( = ?auto_569784 ?auto_569786 ) ) ( not ( = ?auto_569784 ?auto_569787 ) ) ( not ( = ?auto_569784 ?auto_569788 ) ) ( not ( = ?auto_569784 ?auto_569789 ) ) ( not ( = ?auto_569784 ?auto_569790 ) ) ( not ( = ?auto_569784 ?auto_569791 ) ) ( not ( = ?auto_569784 ?auto_569792 ) ) ( not ( = ?auto_569784 ?auto_569793 ) ) ( not ( = ?auto_569784 ?auto_569794 ) ) ( not ( = ?auto_569785 ?auto_569786 ) ) ( not ( = ?auto_569785 ?auto_569787 ) ) ( not ( = ?auto_569785 ?auto_569788 ) ) ( not ( = ?auto_569785 ?auto_569789 ) ) ( not ( = ?auto_569785 ?auto_569790 ) ) ( not ( = ?auto_569785 ?auto_569791 ) ) ( not ( = ?auto_569785 ?auto_569792 ) ) ( not ( = ?auto_569785 ?auto_569793 ) ) ( not ( = ?auto_569785 ?auto_569794 ) ) ( not ( = ?auto_569786 ?auto_569787 ) ) ( not ( = ?auto_569786 ?auto_569788 ) ) ( not ( = ?auto_569786 ?auto_569789 ) ) ( not ( = ?auto_569786 ?auto_569790 ) ) ( not ( = ?auto_569786 ?auto_569791 ) ) ( not ( = ?auto_569786 ?auto_569792 ) ) ( not ( = ?auto_569786 ?auto_569793 ) ) ( not ( = ?auto_569786 ?auto_569794 ) ) ( not ( = ?auto_569787 ?auto_569788 ) ) ( not ( = ?auto_569787 ?auto_569789 ) ) ( not ( = ?auto_569787 ?auto_569790 ) ) ( not ( = ?auto_569787 ?auto_569791 ) ) ( not ( = ?auto_569787 ?auto_569792 ) ) ( not ( = ?auto_569787 ?auto_569793 ) ) ( not ( = ?auto_569787 ?auto_569794 ) ) ( not ( = ?auto_569788 ?auto_569789 ) ) ( not ( = ?auto_569788 ?auto_569790 ) ) ( not ( = ?auto_569788 ?auto_569791 ) ) ( not ( = ?auto_569788 ?auto_569792 ) ) ( not ( = ?auto_569788 ?auto_569793 ) ) ( not ( = ?auto_569788 ?auto_569794 ) ) ( not ( = ?auto_569789 ?auto_569790 ) ) ( not ( = ?auto_569789 ?auto_569791 ) ) ( not ( = ?auto_569789 ?auto_569792 ) ) ( not ( = ?auto_569789 ?auto_569793 ) ) ( not ( = ?auto_569789 ?auto_569794 ) ) ( not ( = ?auto_569790 ?auto_569791 ) ) ( not ( = ?auto_569790 ?auto_569792 ) ) ( not ( = ?auto_569790 ?auto_569793 ) ) ( not ( = ?auto_569790 ?auto_569794 ) ) ( not ( = ?auto_569791 ?auto_569792 ) ) ( not ( = ?auto_569791 ?auto_569793 ) ) ( not ( = ?auto_569791 ?auto_569794 ) ) ( not ( = ?auto_569792 ?auto_569793 ) ) ( not ( = ?auto_569792 ?auto_569794 ) ) ( not ( = ?auto_569793 ?auto_569794 ) ) ( ON ?auto_569792 ?auto_569793 ) ( ON ?auto_569791 ?auto_569792 ) ( CLEAR ?auto_569789 ) ( ON ?auto_569790 ?auto_569791 ) ( CLEAR ?auto_569790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_569779 ?auto_569780 ?auto_569781 ?auto_569782 ?auto_569783 ?auto_569784 ?auto_569785 ?auto_569786 ?auto_569787 ?auto_569788 ?auto_569789 ?auto_569790 )
      ( MAKE-15PILE ?auto_569779 ?auto_569780 ?auto_569781 ?auto_569782 ?auto_569783 ?auto_569784 ?auto_569785 ?auto_569786 ?auto_569787 ?auto_569788 ?auto_569789 ?auto_569790 ?auto_569791 ?auto_569792 ?auto_569793 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_569841 - BLOCK
      ?auto_569842 - BLOCK
      ?auto_569843 - BLOCK
      ?auto_569844 - BLOCK
      ?auto_569845 - BLOCK
      ?auto_569846 - BLOCK
      ?auto_569847 - BLOCK
      ?auto_569848 - BLOCK
      ?auto_569849 - BLOCK
      ?auto_569850 - BLOCK
      ?auto_569851 - BLOCK
      ?auto_569852 - BLOCK
      ?auto_569853 - BLOCK
      ?auto_569854 - BLOCK
      ?auto_569855 - BLOCK
    )
    :vars
    (
      ?auto_569856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_569855 ?auto_569856 ) ( ON-TABLE ?auto_569841 ) ( ON ?auto_569842 ?auto_569841 ) ( ON ?auto_569843 ?auto_569842 ) ( ON ?auto_569844 ?auto_569843 ) ( ON ?auto_569845 ?auto_569844 ) ( ON ?auto_569846 ?auto_569845 ) ( ON ?auto_569847 ?auto_569846 ) ( ON ?auto_569848 ?auto_569847 ) ( ON ?auto_569849 ?auto_569848 ) ( ON ?auto_569850 ?auto_569849 ) ( not ( = ?auto_569841 ?auto_569842 ) ) ( not ( = ?auto_569841 ?auto_569843 ) ) ( not ( = ?auto_569841 ?auto_569844 ) ) ( not ( = ?auto_569841 ?auto_569845 ) ) ( not ( = ?auto_569841 ?auto_569846 ) ) ( not ( = ?auto_569841 ?auto_569847 ) ) ( not ( = ?auto_569841 ?auto_569848 ) ) ( not ( = ?auto_569841 ?auto_569849 ) ) ( not ( = ?auto_569841 ?auto_569850 ) ) ( not ( = ?auto_569841 ?auto_569851 ) ) ( not ( = ?auto_569841 ?auto_569852 ) ) ( not ( = ?auto_569841 ?auto_569853 ) ) ( not ( = ?auto_569841 ?auto_569854 ) ) ( not ( = ?auto_569841 ?auto_569855 ) ) ( not ( = ?auto_569841 ?auto_569856 ) ) ( not ( = ?auto_569842 ?auto_569843 ) ) ( not ( = ?auto_569842 ?auto_569844 ) ) ( not ( = ?auto_569842 ?auto_569845 ) ) ( not ( = ?auto_569842 ?auto_569846 ) ) ( not ( = ?auto_569842 ?auto_569847 ) ) ( not ( = ?auto_569842 ?auto_569848 ) ) ( not ( = ?auto_569842 ?auto_569849 ) ) ( not ( = ?auto_569842 ?auto_569850 ) ) ( not ( = ?auto_569842 ?auto_569851 ) ) ( not ( = ?auto_569842 ?auto_569852 ) ) ( not ( = ?auto_569842 ?auto_569853 ) ) ( not ( = ?auto_569842 ?auto_569854 ) ) ( not ( = ?auto_569842 ?auto_569855 ) ) ( not ( = ?auto_569842 ?auto_569856 ) ) ( not ( = ?auto_569843 ?auto_569844 ) ) ( not ( = ?auto_569843 ?auto_569845 ) ) ( not ( = ?auto_569843 ?auto_569846 ) ) ( not ( = ?auto_569843 ?auto_569847 ) ) ( not ( = ?auto_569843 ?auto_569848 ) ) ( not ( = ?auto_569843 ?auto_569849 ) ) ( not ( = ?auto_569843 ?auto_569850 ) ) ( not ( = ?auto_569843 ?auto_569851 ) ) ( not ( = ?auto_569843 ?auto_569852 ) ) ( not ( = ?auto_569843 ?auto_569853 ) ) ( not ( = ?auto_569843 ?auto_569854 ) ) ( not ( = ?auto_569843 ?auto_569855 ) ) ( not ( = ?auto_569843 ?auto_569856 ) ) ( not ( = ?auto_569844 ?auto_569845 ) ) ( not ( = ?auto_569844 ?auto_569846 ) ) ( not ( = ?auto_569844 ?auto_569847 ) ) ( not ( = ?auto_569844 ?auto_569848 ) ) ( not ( = ?auto_569844 ?auto_569849 ) ) ( not ( = ?auto_569844 ?auto_569850 ) ) ( not ( = ?auto_569844 ?auto_569851 ) ) ( not ( = ?auto_569844 ?auto_569852 ) ) ( not ( = ?auto_569844 ?auto_569853 ) ) ( not ( = ?auto_569844 ?auto_569854 ) ) ( not ( = ?auto_569844 ?auto_569855 ) ) ( not ( = ?auto_569844 ?auto_569856 ) ) ( not ( = ?auto_569845 ?auto_569846 ) ) ( not ( = ?auto_569845 ?auto_569847 ) ) ( not ( = ?auto_569845 ?auto_569848 ) ) ( not ( = ?auto_569845 ?auto_569849 ) ) ( not ( = ?auto_569845 ?auto_569850 ) ) ( not ( = ?auto_569845 ?auto_569851 ) ) ( not ( = ?auto_569845 ?auto_569852 ) ) ( not ( = ?auto_569845 ?auto_569853 ) ) ( not ( = ?auto_569845 ?auto_569854 ) ) ( not ( = ?auto_569845 ?auto_569855 ) ) ( not ( = ?auto_569845 ?auto_569856 ) ) ( not ( = ?auto_569846 ?auto_569847 ) ) ( not ( = ?auto_569846 ?auto_569848 ) ) ( not ( = ?auto_569846 ?auto_569849 ) ) ( not ( = ?auto_569846 ?auto_569850 ) ) ( not ( = ?auto_569846 ?auto_569851 ) ) ( not ( = ?auto_569846 ?auto_569852 ) ) ( not ( = ?auto_569846 ?auto_569853 ) ) ( not ( = ?auto_569846 ?auto_569854 ) ) ( not ( = ?auto_569846 ?auto_569855 ) ) ( not ( = ?auto_569846 ?auto_569856 ) ) ( not ( = ?auto_569847 ?auto_569848 ) ) ( not ( = ?auto_569847 ?auto_569849 ) ) ( not ( = ?auto_569847 ?auto_569850 ) ) ( not ( = ?auto_569847 ?auto_569851 ) ) ( not ( = ?auto_569847 ?auto_569852 ) ) ( not ( = ?auto_569847 ?auto_569853 ) ) ( not ( = ?auto_569847 ?auto_569854 ) ) ( not ( = ?auto_569847 ?auto_569855 ) ) ( not ( = ?auto_569847 ?auto_569856 ) ) ( not ( = ?auto_569848 ?auto_569849 ) ) ( not ( = ?auto_569848 ?auto_569850 ) ) ( not ( = ?auto_569848 ?auto_569851 ) ) ( not ( = ?auto_569848 ?auto_569852 ) ) ( not ( = ?auto_569848 ?auto_569853 ) ) ( not ( = ?auto_569848 ?auto_569854 ) ) ( not ( = ?auto_569848 ?auto_569855 ) ) ( not ( = ?auto_569848 ?auto_569856 ) ) ( not ( = ?auto_569849 ?auto_569850 ) ) ( not ( = ?auto_569849 ?auto_569851 ) ) ( not ( = ?auto_569849 ?auto_569852 ) ) ( not ( = ?auto_569849 ?auto_569853 ) ) ( not ( = ?auto_569849 ?auto_569854 ) ) ( not ( = ?auto_569849 ?auto_569855 ) ) ( not ( = ?auto_569849 ?auto_569856 ) ) ( not ( = ?auto_569850 ?auto_569851 ) ) ( not ( = ?auto_569850 ?auto_569852 ) ) ( not ( = ?auto_569850 ?auto_569853 ) ) ( not ( = ?auto_569850 ?auto_569854 ) ) ( not ( = ?auto_569850 ?auto_569855 ) ) ( not ( = ?auto_569850 ?auto_569856 ) ) ( not ( = ?auto_569851 ?auto_569852 ) ) ( not ( = ?auto_569851 ?auto_569853 ) ) ( not ( = ?auto_569851 ?auto_569854 ) ) ( not ( = ?auto_569851 ?auto_569855 ) ) ( not ( = ?auto_569851 ?auto_569856 ) ) ( not ( = ?auto_569852 ?auto_569853 ) ) ( not ( = ?auto_569852 ?auto_569854 ) ) ( not ( = ?auto_569852 ?auto_569855 ) ) ( not ( = ?auto_569852 ?auto_569856 ) ) ( not ( = ?auto_569853 ?auto_569854 ) ) ( not ( = ?auto_569853 ?auto_569855 ) ) ( not ( = ?auto_569853 ?auto_569856 ) ) ( not ( = ?auto_569854 ?auto_569855 ) ) ( not ( = ?auto_569854 ?auto_569856 ) ) ( not ( = ?auto_569855 ?auto_569856 ) ) ( ON ?auto_569854 ?auto_569855 ) ( ON ?auto_569853 ?auto_569854 ) ( ON ?auto_569852 ?auto_569853 ) ( CLEAR ?auto_569850 ) ( ON ?auto_569851 ?auto_569852 ) ( CLEAR ?auto_569851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_569841 ?auto_569842 ?auto_569843 ?auto_569844 ?auto_569845 ?auto_569846 ?auto_569847 ?auto_569848 ?auto_569849 ?auto_569850 ?auto_569851 )
      ( MAKE-15PILE ?auto_569841 ?auto_569842 ?auto_569843 ?auto_569844 ?auto_569845 ?auto_569846 ?auto_569847 ?auto_569848 ?auto_569849 ?auto_569850 ?auto_569851 ?auto_569852 ?auto_569853 ?auto_569854 ?auto_569855 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_569903 - BLOCK
      ?auto_569904 - BLOCK
      ?auto_569905 - BLOCK
      ?auto_569906 - BLOCK
      ?auto_569907 - BLOCK
      ?auto_569908 - BLOCK
      ?auto_569909 - BLOCK
      ?auto_569910 - BLOCK
      ?auto_569911 - BLOCK
      ?auto_569912 - BLOCK
      ?auto_569913 - BLOCK
      ?auto_569914 - BLOCK
      ?auto_569915 - BLOCK
      ?auto_569916 - BLOCK
      ?auto_569917 - BLOCK
    )
    :vars
    (
      ?auto_569918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_569917 ?auto_569918 ) ( ON-TABLE ?auto_569903 ) ( ON ?auto_569904 ?auto_569903 ) ( ON ?auto_569905 ?auto_569904 ) ( ON ?auto_569906 ?auto_569905 ) ( ON ?auto_569907 ?auto_569906 ) ( ON ?auto_569908 ?auto_569907 ) ( ON ?auto_569909 ?auto_569908 ) ( ON ?auto_569910 ?auto_569909 ) ( ON ?auto_569911 ?auto_569910 ) ( not ( = ?auto_569903 ?auto_569904 ) ) ( not ( = ?auto_569903 ?auto_569905 ) ) ( not ( = ?auto_569903 ?auto_569906 ) ) ( not ( = ?auto_569903 ?auto_569907 ) ) ( not ( = ?auto_569903 ?auto_569908 ) ) ( not ( = ?auto_569903 ?auto_569909 ) ) ( not ( = ?auto_569903 ?auto_569910 ) ) ( not ( = ?auto_569903 ?auto_569911 ) ) ( not ( = ?auto_569903 ?auto_569912 ) ) ( not ( = ?auto_569903 ?auto_569913 ) ) ( not ( = ?auto_569903 ?auto_569914 ) ) ( not ( = ?auto_569903 ?auto_569915 ) ) ( not ( = ?auto_569903 ?auto_569916 ) ) ( not ( = ?auto_569903 ?auto_569917 ) ) ( not ( = ?auto_569903 ?auto_569918 ) ) ( not ( = ?auto_569904 ?auto_569905 ) ) ( not ( = ?auto_569904 ?auto_569906 ) ) ( not ( = ?auto_569904 ?auto_569907 ) ) ( not ( = ?auto_569904 ?auto_569908 ) ) ( not ( = ?auto_569904 ?auto_569909 ) ) ( not ( = ?auto_569904 ?auto_569910 ) ) ( not ( = ?auto_569904 ?auto_569911 ) ) ( not ( = ?auto_569904 ?auto_569912 ) ) ( not ( = ?auto_569904 ?auto_569913 ) ) ( not ( = ?auto_569904 ?auto_569914 ) ) ( not ( = ?auto_569904 ?auto_569915 ) ) ( not ( = ?auto_569904 ?auto_569916 ) ) ( not ( = ?auto_569904 ?auto_569917 ) ) ( not ( = ?auto_569904 ?auto_569918 ) ) ( not ( = ?auto_569905 ?auto_569906 ) ) ( not ( = ?auto_569905 ?auto_569907 ) ) ( not ( = ?auto_569905 ?auto_569908 ) ) ( not ( = ?auto_569905 ?auto_569909 ) ) ( not ( = ?auto_569905 ?auto_569910 ) ) ( not ( = ?auto_569905 ?auto_569911 ) ) ( not ( = ?auto_569905 ?auto_569912 ) ) ( not ( = ?auto_569905 ?auto_569913 ) ) ( not ( = ?auto_569905 ?auto_569914 ) ) ( not ( = ?auto_569905 ?auto_569915 ) ) ( not ( = ?auto_569905 ?auto_569916 ) ) ( not ( = ?auto_569905 ?auto_569917 ) ) ( not ( = ?auto_569905 ?auto_569918 ) ) ( not ( = ?auto_569906 ?auto_569907 ) ) ( not ( = ?auto_569906 ?auto_569908 ) ) ( not ( = ?auto_569906 ?auto_569909 ) ) ( not ( = ?auto_569906 ?auto_569910 ) ) ( not ( = ?auto_569906 ?auto_569911 ) ) ( not ( = ?auto_569906 ?auto_569912 ) ) ( not ( = ?auto_569906 ?auto_569913 ) ) ( not ( = ?auto_569906 ?auto_569914 ) ) ( not ( = ?auto_569906 ?auto_569915 ) ) ( not ( = ?auto_569906 ?auto_569916 ) ) ( not ( = ?auto_569906 ?auto_569917 ) ) ( not ( = ?auto_569906 ?auto_569918 ) ) ( not ( = ?auto_569907 ?auto_569908 ) ) ( not ( = ?auto_569907 ?auto_569909 ) ) ( not ( = ?auto_569907 ?auto_569910 ) ) ( not ( = ?auto_569907 ?auto_569911 ) ) ( not ( = ?auto_569907 ?auto_569912 ) ) ( not ( = ?auto_569907 ?auto_569913 ) ) ( not ( = ?auto_569907 ?auto_569914 ) ) ( not ( = ?auto_569907 ?auto_569915 ) ) ( not ( = ?auto_569907 ?auto_569916 ) ) ( not ( = ?auto_569907 ?auto_569917 ) ) ( not ( = ?auto_569907 ?auto_569918 ) ) ( not ( = ?auto_569908 ?auto_569909 ) ) ( not ( = ?auto_569908 ?auto_569910 ) ) ( not ( = ?auto_569908 ?auto_569911 ) ) ( not ( = ?auto_569908 ?auto_569912 ) ) ( not ( = ?auto_569908 ?auto_569913 ) ) ( not ( = ?auto_569908 ?auto_569914 ) ) ( not ( = ?auto_569908 ?auto_569915 ) ) ( not ( = ?auto_569908 ?auto_569916 ) ) ( not ( = ?auto_569908 ?auto_569917 ) ) ( not ( = ?auto_569908 ?auto_569918 ) ) ( not ( = ?auto_569909 ?auto_569910 ) ) ( not ( = ?auto_569909 ?auto_569911 ) ) ( not ( = ?auto_569909 ?auto_569912 ) ) ( not ( = ?auto_569909 ?auto_569913 ) ) ( not ( = ?auto_569909 ?auto_569914 ) ) ( not ( = ?auto_569909 ?auto_569915 ) ) ( not ( = ?auto_569909 ?auto_569916 ) ) ( not ( = ?auto_569909 ?auto_569917 ) ) ( not ( = ?auto_569909 ?auto_569918 ) ) ( not ( = ?auto_569910 ?auto_569911 ) ) ( not ( = ?auto_569910 ?auto_569912 ) ) ( not ( = ?auto_569910 ?auto_569913 ) ) ( not ( = ?auto_569910 ?auto_569914 ) ) ( not ( = ?auto_569910 ?auto_569915 ) ) ( not ( = ?auto_569910 ?auto_569916 ) ) ( not ( = ?auto_569910 ?auto_569917 ) ) ( not ( = ?auto_569910 ?auto_569918 ) ) ( not ( = ?auto_569911 ?auto_569912 ) ) ( not ( = ?auto_569911 ?auto_569913 ) ) ( not ( = ?auto_569911 ?auto_569914 ) ) ( not ( = ?auto_569911 ?auto_569915 ) ) ( not ( = ?auto_569911 ?auto_569916 ) ) ( not ( = ?auto_569911 ?auto_569917 ) ) ( not ( = ?auto_569911 ?auto_569918 ) ) ( not ( = ?auto_569912 ?auto_569913 ) ) ( not ( = ?auto_569912 ?auto_569914 ) ) ( not ( = ?auto_569912 ?auto_569915 ) ) ( not ( = ?auto_569912 ?auto_569916 ) ) ( not ( = ?auto_569912 ?auto_569917 ) ) ( not ( = ?auto_569912 ?auto_569918 ) ) ( not ( = ?auto_569913 ?auto_569914 ) ) ( not ( = ?auto_569913 ?auto_569915 ) ) ( not ( = ?auto_569913 ?auto_569916 ) ) ( not ( = ?auto_569913 ?auto_569917 ) ) ( not ( = ?auto_569913 ?auto_569918 ) ) ( not ( = ?auto_569914 ?auto_569915 ) ) ( not ( = ?auto_569914 ?auto_569916 ) ) ( not ( = ?auto_569914 ?auto_569917 ) ) ( not ( = ?auto_569914 ?auto_569918 ) ) ( not ( = ?auto_569915 ?auto_569916 ) ) ( not ( = ?auto_569915 ?auto_569917 ) ) ( not ( = ?auto_569915 ?auto_569918 ) ) ( not ( = ?auto_569916 ?auto_569917 ) ) ( not ( = ?auto_569916 ?auto_569918 ) ) ( not ( = ?auto_569917 ?auto_569918 ) ) ( ON ?auto_569916 ?auto_569917 ) ( ON ?auto_569915 ?auto_569916 ) ( ON ?auto_569914 ?auto_569915 ) ( ON ?auto_569913 ?auto_569914 ) ( CLEAR ?auto_569911 ) ( ON ?auto_569912 ?auto_569913 ) ( CLEAR ?auto_569912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_569903 ?auto_569904 ?auto_569905 ?auto_569906 ?auto_569907 ?auto_569908 ?auto_569909 ?auto_569910 ?auto_569911 ?auto_569912 )
      ( MAKE-15PILE ?auto_569903 ?auto_569904 ?auto_569905 ?auto_569906 ?auto_569907 ?auto_569908 ?auto_569909 ?auto_569910 ?auto_569911 ?auto_569912 ?auto_569913 ?auto_569914 ?auto_569915 ?auto_569916 ?auto_569917 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_569965 - BLOCK
      ?auto_569966 - BLOCK
      ?auto_569967 - BLOCK
      ?auto_569968 - BLOCK
      ?auto_569969 - BLOCK
      ?auto_569970 - BLOCK
      ?auto_569971 - BLOCK
      ?auto_569972 - BLOCK
      ?auto_569973 - BLOCK
      ?auto_569974 - BLOCK
      ?auto_569975 - BLOCK
      ?auto_569976 - BLOCK
      ?auto_569977 - BLOCK
      ?auto_569978 - BLOCK
      ?auto_569979 - BLOCK
    )
    :vars
    (
      ?auto_569980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_569979 ?auto_569980 ) ( ON-TABLE ?auto_569965 ) ( ON ?auto_569966 ?auto_569965 ) ( ON ?auto_569967 ?auto_569966 ) ( ON ?auto_569968 ?auto_569967 ) ( ON ?auto_569969 ?auto_569968 ) ( ON ?auto_569970 ?auto_569969 ) ( ON ?auto_569971 ?auto_569970 ) ( ON ?auto_569972 ?auto_569971 ) ( not ( = ?auto_569965 ?auto_569966 ) ) ( not ( = ?auto_569965 ?auto_569967 ) ) ( not ( = ?auto_569965 ?auto_569968 ) ) ( not ( = ?auto_569965 ?auto_569969 ) ) ( not ( = ?auto_569965 ?auto_569970 ) ) ( not ( = ?auto_569965 ?auto_569971 ) ) ( not ( = ?auto_569965 ?auto_569972 ) ) ( not ( = ?auto_569965 ?auto_569973 ) ) ( not ( = ?auto_569965 ?auto_569974 ) ) ( not ( = ?auto_569965 ?auto_569975 ) ) ( not ( = ?auto_569965 ?auto_569976 ) ) ( not ( = ?auto_569965 ?auto_569977 ) ) ( not ( = ?auto_569965 ?auto_569978 ) ) ( not ( = ?auto_569965 ?auto_569979 ) ) ( not ( = ?auto_569965 ?auto_569980 ) ) ( not ( = ?auto_569966 ?auto_569967 ) ) ( not ( = ?auto_569966 ?auto_569968 ) ) ( not ( = ?auto_569966 ?auto_569969 ) ) ( not ( = ?auto_569966 ?auto_569970 ) ) ( not ( = ?auto_569966 ?auto_569971 ) ) ( not ( = ?auto_569966 ?auto_569972 ) ) ( not ( = ?auto_569966 ?auto_569973 ) ) ( not ( = ?auto_569966 ?auto_569974 ) ) ( not ( = ?auto_569966 ?auto_569975 ) ) ( not ( = ?auto_569966 ?auto_569976 ) ) ( not ( = ?auto_569966 ?auto_569977 ) ) ( not ( = ?auto_569966 ?auto_569978 ) ) ( not ( = ?auto_569966 ?auto_569979 ) ) ( not ( = ?auto_569966 ?auto_569980 ) ) ( not ( = ?auto_569967 ?auto_569968 ) ) ( not ( = ?auto_569967 ?auto_569969 ) ) ( not ( = ?auto_569967 ?auto_569970 ) ) ( not ( = ?auto_569967 ?auto_569971 ) ) ( not ( = ?auto_569967 ?auto_569972 ) ) ( not ( = ?auto_569967 ?auto_569973 ) ) ( not ( = ?auto_569967 ?auto_569974 ) ) ( not ( = ?auto_569967 ?auto_569975 ) ) ( not ( = ?auto_569967 ?auto_569976 ) ) ( not ( = ?auto_569967 ?auto_569977 ) ) ( not ( = ?auto_569967 ?auto_569978 ) ) ( not ( = ?auto_569967 ?auto_569979 ) ) ( not ( = ?auto_569967 ?auto_569980 ) ) ( not ( = ?auto_569968 ?auto_569969 ) ) ( not ( = ?auto_569968 ?auto_569970 ) ) ( not ( = ?auto_569968 ?auto_569971 ) ) ( not ( = ?auto_569968 ?auto_569972 ) ) ( not ( = ?auto_569968 ?auto_569973 ) ) ( not ( = ?auto_569968 ?auto_569974 ) ) ( not ( = ?auto_569968 ?auto_569975 ) ) ( not ( = ?auto_569968 ?auto_569976 ) ) ( not ( = ?auto_569968 ?auto_569977 ) ) ( not ( = ?auto_569968 ?auto_569978 ) ) ( not ( = ?auto_569968 ?auto_569979 ) ) ( not ( = ?auto_569968 ?auto_569980 ) ) ( not ( = ?auto_569969 ?auto_569970 ) ) ( not ( = ?auto_569969 ?auto_569971 ) ) ( not ( = ?auto_569969 ?auto_569972 ) ) ( not ( = ?auto_569969 ?auto_569973 ) ) ( not ( = ?auto_569969 ?auto_569974 ) ) ( not ( = ?auto_569969 ?auto_569975 ) ) ( not ( = ?auto_569969 ?auto_569976 ) ) ( not ( = ?auto_569969 ?auto_569977 ) ) ( not ( = ?auto_569969 ?auto_569978 ) ) ( not ( = ?auto_569969 ?auto_569979 ) ) ( not ( = ?auto_569969 ?auto_569980 ) ) ( not ( = ?auto_569970 ?auto_569971 ) ) ( not ( = ?auto_569970 ?auto_569972 ) ) ( not ( = ?auto_569970 ?auto_569973 ) ) ( not ( = ?auto_569970 ?auto_569974 ) ) ( not ( = ?auto_569970 ?auto_569975 ) ) ( not ( = ?auto_569970 ?auto_569976 ) ) ( not ( = ?auto_569970 ?auto_569977 ) ) ( not ( = ?auto_569970 ?auto_569978 ) ) ( not ( = ?auto_569970 ?auto_569979 ) ) ( not ( = ?auto_569970 ?auto_569980 ) ) ( not ( = ?auto_569971 ?auto_569972 ) ) ( not ( = ?auto_569971 ?auto_569973 ) ) ( not ( = ?auto_569971 ?auto_569974 ) ) ( not ( = ?auto_569971 ?auto_569975 ) ) ( not ( = ?auto_569971 ?auto_569976 ) ) ( not ( = ?auto_569971 ?auto_569977 ) ) ( not ( = ?auto_569971 ?auto_569978 ) ) ( not ( = ?auto_569971 ?auto_569979 ) ) ( not ( = ?auto_569971 ?auto_569980 ) ) ( not ( = ?auto_569972 ?auto_569973 ) ) ( not ( = ?auto_569972 ?auto_569974 ) ) ( not ( = ?auto_569972 ?auto_569975 ) ) ( not ( = ?auto_569972 ?auto_569976 ) ) ( not ( = ?auto_569972 ?auto_569977 ) ) ( not ( = ?auto_569972 ?auto_569978 ) ) ( not ( = ?auto_569972 ?auto_569979 ) ) ( not ( = ?auto_569972 ?auto_569980 ) ) ( not ( = ?auto_569973 ?auto_569974 ) ) ( not ( = ?auto_569973 ?auto_569975 ) ) ( not ( = ?auto_569973 ?auto_569976 ) ) ( not ( = ?auto_569973 ?auto_569977 ) ) ( not ( = ?auto_569973 ?auto_569978 ) ) ( not ( = ?auto_569973 ?auto_569979 ) ) ( not ( = ?auto_569973 ?auto_569980 ) ) ( not ( = ?auto_569974 ?auto_569975 ) ) ( not ( = ?auto_569974 ?auto_569976 ) ) ( not ( = ?auto_569974 ?auto_569977 ) ) ( not ( = ?auto_569974 ?auto_569978 ) ) ( not ( = ?auto_569974 ?auto_569979 ) ) ( not ( = ?auto_569974 ?auto_569980 ) ) ( not ( = ?auto_569975 ?auto_569976 ) ) ( not ( = ?auto_569975 ?auto_569977 ) ) ( not ( = ?auto_569975 ?auto_569978 ) ) ( not ( = ?auto_569975 ?auto_569979 ) ) ( not ( = ?auto_569975 ?auto_569980 ) ) ( not ( = ?auto_569976 ?auto_569977 ) ) ( not ( = ?auto_569976 ?auto_569978 ) ) ( not ( = ?auto_569976 ?auto_569979 ) ) ( not ( = ?auto_569976 ?auto_569980 ) ) ( not ( = ?auto_569977 ?auto_569978 ) ) ( not ( = ?auto_569977 ?auto_569979 ) ) ( not ( = ?auto_569977 ?auto_569980 ) ) ( not ( = ?auto_569978 ?auto_569979 ) ) ( not ( = ?auto_569978 ?auto_569980 ) ) ( not ( = ?auto_569979 ?auto_569980 ) ) ( ON ?auto_569978 ?auto_569979 ) ( ON ?auto_569977 ?auto_569978 ) ( ON ?auto_569976 ?auto_569977 ) ( ON ?auto_569975 ?auto_569976 ) ( ON ?auto_569974 ?auto_569975 ) ( CLEAR ?auto_569972 ) ( ON ?auto_569973 ?auto_569974 ) ( CLEAR ?auto_569973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_569965 ?auto_569966 ?auto_569967 ?auto_569968 ?auto_569969 ?auto_569970 ?auto_569971 ?auto_569972 ?auto_569973 )
      ( MAKE-15PILE ?auto_569965 ?auto_569966 ?auto_569967 ?auto_569968 ?auto_569969 ?auto_569970 ?auto_569971 ?auto_569972 ?auto_569973 ?auto_569974 ?auto_569975 ?auto_569976 ?auto_569977 ?auto_569978 ?auto_569979 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_570027 - BLOCK
      ?auto_570028 - BLOCK
      ?auto_570029 - BLOCK
      ?auto_570030 - BLOCK
      ?auto_570031 - BLOCK
      ?auto_570032 - BLOCK
      ?auto_570033 - BLOCK
      ?auto_570034 - BLOCK
      ?auto_570035 - BLOCK
      ?auto_570036 - BLOCK
      ?auto_570037 - BLOCK
      ?auto_570038 - BLOCK
      ?auto_570039 - BLOCK
      ?auto_570040 - BLOCK
      ?auto_570041 - BLOCK
    )
    :vars
    (
      ?auto_570042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_570041 ?auto_570042 ) ( ON-TABLE ?auto_570027 ) ( ON ?auto_570028 ?auto_570027 ) ( ON ?auto_570029 ?auto_570028 ) ( ON ?auto_570030 ?auto_570029 ) ( ON ?auto_570031 ?auto_570030 ) ( ON ?auto_570032 ?auto_570031 ) ( ON ?auto_570033 ?auto_570032 ) ( not ( = ?auto_570027 ?auto_570028 ) ) ( not ( = ?auto_570027 ?auto_570029 ) ) ( not ( = ?auto_570027 ?auto_570030 ) ) ( not ( = ?auto_570027 ?auto_570031 ) ) ( not ( = ?auto_570027 ?auto_570032 ) ) ( not ( = ?auto_570027 ?auto_570033 ) ) ( not ( = ?auto_570027 ?auto_570034 ) ) ( not ( = ?auto_570027 ?auto_570035 ) ) ( not ( = ?auto_570027 ?auto_570036 ) ) ( not ( = ?auto_570027 ?auto_570037 ) ) ( not ( = ?auto_570027 ?auto_570038 ) ) ( not ( = ?auto_570027 ?auto_570039 ) ) ( not ( = ?auto_570027 ?auto_570040 ) ) ( not ( = ?auto_570027 ?auto_570041 ) ) ( not ( = ?auto_570027 ?auto_570042 ) ) ( not ( = ?auto_570028 ?auto_570029 ) ) ( not ( = ?auto_570028 ?auto_570030 ) ) ( not ( = ?auto_570028 ?auto_570031 ) ) ( not ( = ?auto_570028 ?auto_570032 ) ) ( not ( = ?auto_570028 ?auto_570033 ) ) ( not ( = ?auto_570028 ?auto_570034 ) ) ( not ( = ?auto_570028 ?auto_570035 ) ) ( not ( = ?auto_570028 ?auto_570036 ) ) ( not ( = ?auto_570028 ?auto_570037 ) ) ( not ( = ?auto_570028 ?auto_570038 ) ) ( not ( = ?auto_570028 ?auto_570039 ) ) ( not ( = ?auto_570028 ?auto_570040 ) ) ( not ( = ?auto_570028 ?auto_570041 ) ) ( not ( = ?auto_570028 ?auto_570042 ) ) ( not ( = ?auto_570029 ?auto_570030 ) ) ( not ( = ?auto_570029 ?auto_570031 ) ) ( not ( = ?auto_570029 ?auto_570032 ) ) ( not ( = ?auto_570029 ?auto_570033 ) ) ( not ( = ?auto_570029 ?auto_570034 ) ) ( not ( = ?auto_570029 ?auto_570035 ) ) ( not ( = ?auto_570029 ?auto_570036 ) ) ( not ( = ?auto_570029 ?auto_570037 ) ) ( not ( = ?auto_570029 ?auto_570038 ) ) ( not ( = ?auto_570029 ?auto_570039 ) ) ( not ( = ?auto_570029 ?auto_570040 ) ) ( not ( = ?auto_570029 ?auto_570041 ) ) ( not ( = ?auto_570029 ?auto_570042 ) ) ( not ( = ?auto_570030 ?auto_570031 ) ) ( not ( = ?auto_570030 ?auto_570032 ) ) ( not ( = ?auto_570030 ?auto_570033 ) ) ( not ( = ?auto_570030 ?auto_570034 ) ) ( not ( = ?auto_570030 ?auto_570035 ) ) ( not ( = ?auto_570030 ?auto_570036 ) ) ( not ( = ?auto_570030 ?auto_570037 ) ) ( not ( = ?auto_570030 ?auto_570038 ) ) ( not ( = ?auto_570030 ?auto_570039 ) ) ( not ( = ?auto_570030 ?auto_570040 ) ) ( not ( = ?auto_570030 ?auto_570041 ) ) ( not ( = ?auto_570030 ?auto_570042 ) ) ( not ( = ?auto_570031 ?auto_570032 ) ) ( not ( = ?auto_570031 ?auto_570033 ) ) ( not ( = ?auto_570031 ?auto_570034 ) ) ( not ( = ?auto_570031 ?auto_570035 ) ) ( not ( = ?auto_570031 ?auto_570036 ) ) ( not ( = ?auto_570031 ?auto_570037 ) ) ( not ( = ?auto_570031 ?auto_570038 ) ) ( not ( = ?auto_570031 ?auto_570039 ) ) ( not ( = ?auto_570031 ?auto_570040 ) ) ( not ( = ?auto_570031 ?auto_570041 ) ) ( not ( = ?auto_570031 ?auto_570042 ) ) ( not ( = ?auto_570032 ?auto_570033 ) ) ( not ( = ?auto_570032 ?auto_570034 ) ) ( not ( = ?auto_570032 ?auto_570035 ) ) ( not ( = ?auto_570032 ?auto_570036 ) ) ( not ( = ?auto_570032 ?auto_570037 ) ) ( not ( = ?auto_570032 ?auto_570038 ) ) ( not ( = ?auto_570032 ?auto_570039 ) ) ( not ( = ?auto_570032 ?auto_570040 ) ) ( not ( = ?auto_570032 ?auto_570041 ) ) ( not ( = ?auto_570032 ?auto_570042 ) ) ( not ( = ?auto_570033 ?auto_570034 ) ) ( not ( = ?auto_570033 ?auto_570035 ) ) ( not ( = ?auto_570033 ?auto_570036 ) ) ( not ( = ?auto_570033 ?auto_570037 ) ) ( not ( = ?auto_570033 ?auto_570038 ) ) ( not ( = ?auto_570033 ?auto_570039 ) ) ( not ( = ?auto_570033 ?auto_570040 ) ) ( not ( = ?auto_570033 ?auto_570041 ) ) ( not ( = ?auto_570033 ?auto_570042 ) ) ( not ( = ?auto_570034 ?auto_570035 ) ) ( not ( = ?auto_570034 ?auto_570036 ) ) ( not ( = ?auto_570034 ?auto_570037 ) ) ( not ( = ?auto_570034 ?auto_570038 ) ) ( not ( = ?auto_570034 ?auto_570039 ) ) ( not ( = ?auto_570034 ?auto_570040 ) ) ( not ( = ?auto_570034 ?auto_570041 ) ) ( not ( = ?auto_570034 ?auto_570042 ) ) ( not ( = ?auto_570035 ?auto_570036 ) ) ( not ( = ?auto_570035 ?auto_570037 ) ) ( not ( = ?auto_570035 ?auto_570038 ) ) ( not ( = ?auto_570035 ?auto_570039 ) ) ( not ( = ?auto_570035 ?auto_570040 ) ) ( not ( = ?auto_570035 ?auto_570041 ) ) ( not ( = ?auto_570035 ?auto_570042 ) ) ( not ( = ?auto_570036 ?auto_570037 ) ) ( not ( = ?auto_570036 ?auto_570038 ) ) ( not ( = ?auto_570036 ?auto_570039 ) ) ( not ( = ?auto_570036 ?auto_570040 ) ) ( not ( = ?auto_570036 ?auto_570041 ) ) ( not ( = ?auto_570036 ?auto_570042 ) ) ( not ( = ?auto_570037 ?auto_570038 ) ) ( not ( = ?auto_570037 ?auto_570039 ) ) ( not ( = ?auto_570037 ?auto_570040 ) ) ( not ( = ?auto_570037 ?auto_570041 ) ) ( not ( = ?auto_570037 ?auto_570042 ) ) ( not ( = ?auto_570038 ?auto_570039 ) ) ( not ( = ?auto_570038 ?auto_570040 ) ) ( not ( = ?auto_570038 ?auto_570041 ) ) ( not ( = ?auto_570038 ?auto_570042 ) ) ( not ( = ?auto_570039 ?auto_570040 ) ) ( not ( = ?auto_570039 ?auto_570041 ) ) ( not ( = ?auto_570039 ?auto_570042 ) ) ( not ( = ?auto_570040 ?auto_570041 ) ) ( not ( = ?auto_570040 ?auto_570042 ) ) ( not ( = ?auto_570041 ?auto_570042 ) ) ( ON ?auto_570040 ?auto_570041 ) ( ON ?auto_570039 ?auto_570040 ) ( ON ?auto_570038 ?auto_570039 ) ( ON ?auto_570037 ?auto_570038 ) ( ON ?auto_570036 ?auto_570037 ) ( ON ?auto_570035 ?auto_570036 ) ( CLEAR ?auto_570033 ) ( ON ?auto_570034 ?auto_570035 ) ( CLEAR ?auto_570034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_570027 ?auto_570028 ?auto_570029 ?auto_570030 ?auto_570031 ?auto_570032 ?auto_570033 ?auto_570034 )
      ( MAKE-15PILE ?auto_570027 ?auto_570028 ?auto_570029 ?auto_570030 ?auto_570031 ?auto_570032 ?auto_570033 ?auto_570034 ?auto_570035 ?auto_570036 ?auto_570037 ?auto_570038 ?auto_570039 ?auto_570040 ?auto_570041 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_570089 - BLOCK
      ?auto_570090 - BLOCK
      ?auto_570091 - BLOCK
      ?auto_570092 - BLOCK
      ?auto_570093 - BLOCK
      ?auto_570094 - BLOCK
      ?auto_570095 - BLOCK
      ?auto_570096 - BLOCK
      ?auto_570097 - BLOCK
      ?auto_570098 - BLOCK
      ?auto_570099 - BLOCK
      ?auto_570100 - BLOCK
      ?auto_570101 - BLOCK
      ?auto_570102 - BLOCK
      ?auto_570103 - BLOCK
    )
    :vars
    (
      ?auto_570104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_570103 ?auto_570104 ) ( ON-TABLE ?auto_570089 ) ( ON ?auto_570090 ?auto_570089 ) ( ON ?auto_570091 ?auto_570090 ) ( ON ?auto_570092 ?auto_570091 ) ( ON ?auto_570093 ?auto_570092 ) ( ON ?auto_570094 ?auto_570093 ) ( not ( = ?auto_570089 ?auto_570090 ) ) ( not ( = ?auto_570089 ?auto_570091 ) ) ( not ( = ?auto_570089 ?auto_570092 ) ) ( not ( = ?auto_570089 ?auto_570093 ) ) ( not ( = ?auto_570089 ?auto_570094 ) ) ( not ( = ?auto_570089 ?auto_570095 ) ) ( not ( = ?auto_570089 ?auto_570096 ) ) ( not ( = ?auto_570089 ?auto_570097 ) ) ( not ( = ?auto_570089 ?auto_570098 ) ) ( not ( = ?auto_570089 ?auto_570099 ) ) ( not ( = ?auto_570089 ?auto_570100 ) ) ( not ( = ?auto_570089 ?auto_570101 ) ) ( not ( = ?auto_570089 ?auto_570102 ) ) ( not ( = ?auto_570089 ?auto_570103 ) ) ( not ( = ?auto_570089 ?auto_570104 ) ) ( not ( = ?auto_570090 ?auto_570091 ) ) ( not ( = ?auto_570090 ?auto_570092 ) ) ( not ( = ?auto_570090 ?auto_570093 ) ) ( not ( = ?auto_570090 ?auto_570094 ) ) ( not ( = ?auto_570090 ?auto_570095 ) ) ( not ( = ?auto_570090 ?auto_570096 ) ) ( not ( = ?auto_570090 ?auto_570097 ) ) ( not ( = ?auto_570090 ?auto_570098 ) ) ( not ( = ?auto_570090 ?auto_570099 ) ) ( not ( = ?auto_570090 ?auto_570100 ) ) ( not ( = ?auto_570090 ?auto_570101 ) ) ( not ( = ?auto_570090 ?auto_570102 ) ) ( not ( = ?auto_570090 ?auto_570103 ) ) ( not ( = ?auto_570090 ?auto_570104 ) ) ( not ( = ?auto_570091 ?auto_570092 ) ) ( not ( = ?auto_570091 ?auto_570093 ) ) ( not ( = ?auto_570091 ?auto_570094 ) ) ( not ( = ?auto_570091 ?auto_570095 ) ) ( not ( = ?auto_570091 ?auto_570096 ) ) ( not ( = ?auto_570091 ?auto_570097 ) ) ( not ( = ?auto_570091 ?auto_570098 ) ) ( not ( = ?auto_570091 ?auto_570099 ) ) ( not ( = ?auto_570091 ?auto_570100 ) ) ( not ( = ?auto_570091 ?auto_570101 ) ) ( not ( = ?auto_570091 ?auto_570102 ) ) ( not ( = ?auto_570091 ?auto_570103 ) ) ( not ( = ?auto_570091 ?auto_570104 ) ) ( not ( = ?auto_570092 ?auto_570093 ) ) ( not ( = ?auto_570092 ?auto_570094 ) ) ( not ( = ?auto_570092 ?auto_570095 ) ) ( not ( = ?auto_570092 ?auto_570096 ) ) ( not ( = ?auto_570092 ?auto_570097 ) ) ( not ( = ?auto_570092 ?auto_570098 ) ) ( not ( = ?auto_570092 ?auto_570099 ) ) ( not ( = ?auto_570092 ?auto_570100 ) ) ( not ( = ?auto_570092 ?auto_570101 ) ) ( not ( = ?auto_570092 ?auto_570102 ) ) ( not ( = ?auto_570092 ?auto_570103 ) ) ( not ( = ?auto_570092 ?auto_570104 ) ) ( not ( = ?auto_570093 ?auto_570094 ) ) ( not ( = ?auto_570093 ?auto_570095 ) ) ( not ( = ?auto_570093 ?auto_570096 ) ) ( not ( = ?auto_570093 ?auto_570097 ) ) ( not ( = ?auto_570093 ?auto_570098 ) ) ( not ( = ?auto_570093 ?auto_570099 ) ) ( not ( = ?auto_570093 ?auto_570100 ) ) ( not ( = ?auto_570093 ?auto_570101 ) ) ( not ( = ?auto_570093 ?auto_570102 ) ) ( not ( = ?auto_570093 ?auto_570103 ) ) ( not ( = ?auto_570093 ?auto_570104 ) ) ( not ( = ?auto_570094 ?auto_570095 ) ) ( not ( = ?auto_570094 ?auto_570096 ) ) ( not ( = ?auto_570094 ?auto_570097 ) ) ( not ( = ?auto_570094 ?auto_570098 ) ) ( not ( = ?auto_570094 ?auto_570099 ) ) ( not ( = ?auto_570094 ?auto_570100 ) ) ( not ( = ?auto_570094 ?auto_570101 ) ) ( not ( = ?auto_570094 ?auto_570102 ) ) ( not ( = ?auto_570094 ?auto_570103 ) ) ( not ( = ?auto_570094 ?auto_570104 ) ) ( not ( = ?auto_570095 ?auto_570096 ) ) ( not ( = ?auto_570095 ?auto_570097 ) ) ( not ( = ?auto_570095 ?auto_570098 ) ) ( not ( = ?auto_570095 ?auto_570099 ) ) ( not ( = ?auto_570095 ?auto_570100 ) ) ( not ( = ?auto_570095 ?auto_570101 ) ) ( not ( = ?auto_570095 ?auto_570102 ) ) ( not ( = ?auto_570095 ?auto_570103 ) ) ( not ( = ?auto_570095 ?auto_570104 ) ) ( not ( = ?auto_570096 ?auto_570097 ) ) ( not ( = ?auto_570096 ?auto_570098 ) ) ( not ( = ?auto_570096 ?auto_570099 ) ) ( not ( = ?auto_570096 ?auto_570100 ) ) ( not ( = ?auto_570096 ?auto_570101 ) ) ( not ( = ?auto_570096 ?auto_570102 ) ) ( not ( = ?auto_570096 ?auto_570103 ) ) ( not ( = ?auto_570096 ?auto_570104 ) ) ( not ( = ?auto_570097 ?auto_570098 ) ) ( not ( = ?auto_570097 ?auto_570099 ) ) ( not ( = ?auto_570097 ?auto_570100 ) ) ( not ( = ?auto_570097 ?auto_570101 ) ) ( not ( = ?auto_570097 ?auto_570102 ) ) ( not ( = ?auto_570097 ?auto_570103 ) ) ( not ( = ?auto_570097 ?auto_570104 ) ) ( not ( = ?auto_570098 ?auto_570099 ) ) ( not ( = ?auto_570098 ?auto_570100 ) ) ( not ( = ?auto_570098 ?auto_570101 ) ) ( not ( = ?auto_570098 ?auto_570102 ) ) ( not ( = ?auto_570098 ?auto_570103 ) ) ( not ( = ?auto_570098 ?auto_570104 ) ) ( not ( = ?auto_570099 ?auto_570100 ) ) ( not ( = ?auto_570099 ?auto_570101 ) ) ( not ( = ?auto_570099 ?auto_570102 ) ) ( not ( = ?auto_570099 ?auto_570103 ) ) ( not ( = ?auto_570099 ?auto_570104 ) ) ( not ( = ?auto_570100 ?auto_570101 ) ) ( not ( = ?auto_570100 ?auto_570102 ) ) ( not ( = ?auto_570100 ?auto_570103 ) ) ( not ( = ?auto_570100 ?auto_570104 ) ) ( not ( = ?auto_570101 ?auto_570102 ) ) ( not ( = ?auto_570101 ?auto_570103 ) ) ( not ( = ?auto_570101 ?auto_570104 ) ) ( not ( = ?auto_570102 ?auto_570103 ) ) ( not ( = ?auto_570102 ?auto_570104 ) ) ( not ( = ?auto_570103 ?auto_570104 ) ) ( ON ?auto_570102 ?auto_570103 ) ( ON ?auto_570101 ?auto_570102 ) ( ON ?auto_570100 ?auto_570101 ) ( ON ?auto_570099 ?auto_570100 ) ( ON ?auto_570098 ?auto_570099 ) ( ON ?auto_570097 ?auto_570098 ) ( ON ?auto_570096 ?auto_570097 ) ( CLEAR ?auto_570094 ) ( ON ?auto_570095 ?auto_570096 ) ( CLEAR ?auto_570095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_570089 ?auto_570090 ?auto_570091 ?auto_570092 ?auto_570093 ?auto_570094 ?auto_570095 )
      ( MAKE-15PILE ?auto_570089 ?auto_570090 ?auto_570091 ?auto_570092 ?auto_570093 ?auto_570094 ?auto_570095 ?auto_570096 ?auto_570097 ?auto_570098 ?auto_570099 ?auto_570100 ?auto_570101 ?auto_570102 ?auto_570103 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_570151 - BLOCK
      ?auto_570152 - BLOCK
      ?auto_570153 - BLOCK
      ?auto_570154 - BLOCK
      ?auto_570155 - BLOCK
      ?auto_570156 - BLOCK
      ?auto_570157 - BLOCK
      ?auto_570158 - BLOCK
      ?auto_570159 - BLOCK
      ?auto_570160 - BLOCK
      ?auto_570161 - BLOCK
      ?auto_570162 - BLOCK
      ?auto_570163 - BLOCK
      ?auto_570164 - BLOCK
      ?auto_570165 - BLOCK
    )
    :vars
    (
      ?auto_570166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_570165 ?auto_570166 ) ( ON-TABLE ?auto_570151 ) ( ON ?auto_570152 ?auto_570151 ) ( ON ?auto_570153 ?auto_570152 ) ( ON ?auto_570154 ?auto_570153 ) ( ON ?auto_570155 ?auto_570154 ) ( not ( = ?auto_570151 ?auto_570152 ) ) ( not ( = ?auto_570151 ?auto_570153 ) ) ( not ( = ?auto_570151 ?auto_570154 ) ) ( not ( = ?auto_570151 ?auto_570155 ) ) ( not ( = ?auto_570151 ?auto_570156 ) ) ( not ( = ?auto_570151 ?auto_570157 ) ) ( not ( = ?auto_570151 ?auto_570158 ) ) ( not ( = ?auto_570151 ?auto_570159 ) ) ( not ( = ?auto_570151 ?auto_570160 ) ) ( not ( = ?auto_570151 ?auto_570161 ) ) ( not ( = ?auto_570151 ?auto_570162 ) ) ( not ( = ?auto_570151 ?auto_570163 ) ) ( not ( = ?auto_570151 ?auto_570164 ) ) ( not ( = ?auto_570151 ?auto_570165 ) ) ( not ( = ?auto_570151 ?auto_570166 ) ) ( not ( = ?auto_570152 ?auto_570153 ) ) ( not ( = ?auto_570152 ?auto_570154 ) ) ( not ( = ?auto_570152 ?auto_570155 ) ) ( not ( = ?auto_570152 ?auto_570156 ) ) ( not ( = ?auto_570152 ?auto_570157 ) ) ( not ( = ?auto_570152 ?auto_570158 ) ) ( not ( = ?auto_570152 ?auto_570159 ) ) ( not ( = ?auto_570152 ?auto_570160 ) ) ( not ( = ?auto_570152 ?auto_570161 ) ) ( not ( = ?auto_570152 ?auto_570162 ) ) ( not ( = ?auto_570152 ?auto_570163 ) ) ( not ( = ?auto_570152 ?auto_570164 ) ) ( not ( = ?auto_570152 ?auto_570165 ) ) ( not ( = ?auto_570152 ?auto_570166 ) ) ( not ( = ?auto_570153 ?auto_570154 ) ) ( not ( = ?auto_570153 ?auto_570155 ) ) ( not ( = ?auto_570153 ?auto_570156 ) ) ( not ( = ?auto_570153 ?auto_570157 ) ) ( not ( = ?auto_570153 ?auto_570158 ) ) ( not ( = ?auto_570153 ?auto_570159 ) ) ( not ( = ?auto_570153 ?auto_570160 ) ) ( not ( = ?auto_570153 ?auto_570161 ) ) ( not ( = ?auto_570153 ?auto_570162 ) ) ( not ( = ?auto_570153 ?auto_570163 ) ) ( not ( = ?auto_570153 ?auto_570164 ) ) ( not ( = ?auto_570153 ?auto_570165 ) ) ( not ( = ?auto_570153 ?auto_570166 ) ) ( not ( = ?auto_570154 ?auto_570155 ) ) ( not ( = ?auto_570154 ?auto_570156 ) ) ( not ( = ?auto_570154 ?auto_570157 ) ) ( not ( = ?auto_570154 ?auto_570158 ) ) ( not ( = ?auto_570154 ?auto_570159 ) ) ( not ( = ?auto_570154 ?auto_570160 ) ) ( not ( = ?auto_570154 ?auto_570161 ) ) ( not ( = ?auto_570154 ?auto_570162 ) ) ( not ( = ?auto_570154 ?auto_570163 ) ) ( not ( = ?auto_570154 ?auto_570164 ) ) ( not ( = ?auto_570154 ?auto_570165 ) ) ( not ( = ?auto_570154 ?auto_570166 ) ) ( not ( = ?auto_570155 ?auto_570156 ) ) ( not ( = ?auto_570155 ?auto_570157 ) ) ( not ( = ?auto_570155 ?auto_570158 ) ) ( not ( = ?auto_570155 ?auto_570159 ) ) ( not ( = ?auto_570155 ?auto_570160 ) ) ( not ( = ?auto_570155 ?auto_570161 ) ) ( not ( = ?auto_570155 ?auto_570162 ) ) ( not ( = ?auto_570155 ?auto_570163 ) ) ( not ( = ?auto_570155 ?auto_570164 ) ) ( not ( = ?auto_570155 ?auto_570165 ) ) ( not ( = ?auto_570155 ?auto_570166 ) ) ( not ( = ?auto_570156 ?auto_570157 ) ) ( not ( = ?auto_570156 ?auto_570158 ) ) ( not ( = ?auto_570156 ?auto_570159 ) ) ( not ( = ?auto_570156 ?auto_570160 ) ) ( not ( = ?auto_570156 ?auto_570161 ) ) ( not ( = ?auto_570156 ?auto_570162 ) ) ( not ( = ?auto_570156 ?auto_570163 ) ) ( not ( = ?auto_570156 ?auto_570164 ) ) ( not ( = ?auto_570156 ?auto_570165 ) ) ( not ( = ?auto_570156 ?auto_570166 ) ) ( not ( = ?auto_570157 ?auto_570158 ) ) ( not ( = ?auto_570157 ?auto_570159 ) ) ( not ( = ?auto_570157 ?auto_570160 ) ) ( not ( = ?auto_570157 ?auto_570161 ) ) ( not ( = ?auto_570157 ?auto_570162 ) ) ( not ( = ?auto_570157 ?auto_570163 ) ) ( not ( = ?auto_570157 ?auto_570164 ) ) ( not ( = ?auto_570157 ?auto_570165 ) ) ( not ( = ?auto_570157 ?auto_570166 ) ) ( not ( = ?auto_570158 ?auto_570159 ) ) ( not ( = ?auto_570158 ?auto_570160 ) ) ( not ( = ?auto_570158 ?auto_570161 ) ) ( not ( = ?auto_570158 ?auto_570162 ) ) ( not ( = ?auto_570158 ?auto_570163 ) ) ( not ( = ?auto_570158 ?auto_570164 ) ) ( not ( = ?auto_570158 ?auto_570165 ) ) ( not ( = ?auto_570158 ?auto_570166 ) ) ( not ( = ?auto_570159 ?auto_570160 ) ) ( not ( = ?auto_570159 ?auto_570161 ) ) ( not ( = ?auto_570159 ?auto_570162 ) ) ( not ( = ?auto_570159 ?auto_570163 ) ) ( not ( = ?auto_570159 ?auto_570164 ) ) ( not ( = ?auto_570159 ?auto_570165 ) ) ( not ( = ?auto_570159 ?auto_570166 ) ) ( not ( = ?auto_570160 ?auto_570161 ) ) ( not ( = ?auto_570160 ?auto_570162 ) ) ( not ( = ?auto_570160 ?auto_570163 ) ) ( not ( = ?auto_570160 ?auto_570164 ) ) ( not ( = ?auto_570160 ?auto_570165 ) ) ( not ( = ?auto_570160 ?auto_570166 ) ) ( not ( = ?auto_570161 ?auto_570162 ) ) ( not ( = ?auto_570161 ?auto_570163 ) ) ( not ( = ?auto_570161 ?auto_570164 ) ) ( not ( = ?auto_570161 ?auto_570165 ) ) ( not ( = ?auto_570161 ?auto_570166 ) ) ( not ( = ?auto_570162 ?auto_570163 ) ) ( not ( = ?auto_570162 ?auto_570164 ) ) ( not ( = ?auto_570162 ?auto_570165 ) ) ( not ( = ?auto_570162 ?auto_570166 ) ) ( not ( = ?auto_570163 ?auto_570164 ) ) ( not ( = ?auto_570163 ?auto_570165 ) ) ( not ( = ?auto_570163 ?auto_570166 ) ) ( not ( = ?auto_570164 ?auto_570165 ) ) ( not ( = ?auto_570164 ?auto_570166 ) ) ( not ( = ?auto_570165 ?auto_570166 ) ) ( ON ?auto_570164 ?auto_570165 ) ( ON ?auto_570163 ?auto_570164 ) ( ON ?auto_570162 ?auto_570163 ) ( ON ?auto_570161 ?auto_570162 ) ( ON ?auto_570160 ?auto_570161 ) ( ON ?auto_570159 ?auto_570160 ) ( ON ?auto_570158 ?auto_570159 ) ( ON ?auto_570157 ?auto_570158 ) ( CLEAR ?auto_570155 ) ( ON ?auto_570156 ?auto_570157 ) ( CLEAR ?auto_570156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_570151 ?auto_570152 ?auto_570153 ?auto_570154 ?auto_570155 ?auto_570156 )
      ( MAKE-15PILE ?auto_570151 ?auto_570152 ?auto_570153 ?auto_570154 ?auto_570155 ?auto_570156 ?auto_570157 ?auto_570158 ?auto_570159 ?auto_570160 ?auto_570161 ?auto_570162 ?auto_570163 ?auto_570164 ?auto_570165 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_570213 - BLOCK
      ?auto_570214 - BLOCK
      ?auto_570215 - BLOCK
      ?auto_570216 - BLOCK
      ?auto_570217 - BLOCK
      ?auto_570218 - BLOCK
      ?auto_570219 - BLOCK
      ?auto_570220 - BLOCK
      ?auto_570221 - BLOCK
      ?auto_570222 - BLOCK
      ?auto_570223 - BLOCK
      ?auto_570224 - BLOCK
      ?auto_570225 - BLOCK
      ?auto_570226 - BLOCK
      ?auto_570227 - BLOCK
    )
    :vars
    (
      ?auto_570228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_570227 ?auto_570228 ) ( ON-TABLE ?auto_570213 ) ( ON ?auto_570214 ?auto_570213 ) ( ON ?auto_570215 ?auto_570214 ) ( ON ?auto_570216 ?auto_570215 ) ( not ( = ?auto_570213 ?auto_570214 ) ) ( not ( = ?auto_570213 ?auto_570215 ) ) ( not ( = ?auto_570213 ?auto_570216 ) ) ( not ( = ?auto_570213 ?auto_570217 ) ) ( not ( = ?auto_570213 ?auto_570218 ) ) ( not ( = ?auto_570213 ?auto_570219 ) ) ( not ( = ?auto_570213 ?auto_570220 ) ) ( not ( = ?auto_570213 ?auto_570221 ) ) ( not ( = ?auto_570213 ?auto_570222 ) ) ( not ( = ?auto_570213 ?auto_570223 ) ) ( not ( = ?auto_570213 ?auto_570224 ) ) ( not ( = ?auto_570213 ?auto_570225 ) ) ( not ( = ?auto_570213 ?auto_570226 ) ) ( not ( = ?auto_570213 ?auto_570227 ) ) ( not ( = ?auto_570213 ?auto_570228 ) ) ( not ( = ?auto_570214 ?auto_570215 ) ) ( not ( = ?auto_570214 ?auto_570216 ) ) ( not ( = ?auto_570214 ?auto_570217 ) ) ( not ( = ?auto_570214 ?auto_570218 ) ) ( not ( = ?auto_570214 ?auto_570219 ) ) ( not ( = ?auto_570214 ?auto_570220 ) ) ( not ( = ?auto_570214 ?auto_570221 ) ) ( not ( = ?auto_570214 ?auto_570222 ) ) ( not ( = ?auto_570214 ?auto_570223 ) ) ( not ( = ?auto_570214 ?auto_570224 ) ) ( not ( = ?auto_570214 ?auto_570225 ) ) ( not ( = ?auto_570214 ?auto_570226 ) ) ( not ( = ?auto_570214 ?auto_570227 ) ) ( not ( = ?auto_570214 ?auto_570228 ) ) ( not ( = ?auto_570215 ?auto_570216 ) ) ( not ( = ?auto_570215 ?auto_570217 ) ) ( not ( = ?auto_570215 ?auto_570218 ) ) ( not ( = ?auto_570215 ?auto_570219 ) ) ( not ( = ?auto_570215 ?auto_570220 ) ) ( not ( = ?auto_570215 ?auto_570221 ) ) ( not ( = ?auto_570215 ?auto_570222 ) ) ( not ( = ?auto_570215 ?auto_570223 ) ) ( not ( = ?auto_570215 ?auto_570224 ) ) ( not ( = ?auto_570215 ?auto_570225 ) ) ( not ( = ?auto_570215 ?auto_570226 ) ) ( not ( = ?auto_570215 ?auto_570227 ) ) ( not ( = ?auto_570215 ?auto_570228 ) ) ( not ( = ?auto_570216 ?auto_570217 ) ) ( not ( = ?auto_570216 ?auto_570218 ) ) ( not ( = ?auto_570216 ?auto_570219 ) ) ( not ( = ?auto_570216 ?auto_570220 ) ) ( not ( = ?auto_570216 ?auto_570221 ) ) ( not ( = ?auto_570216 ?auto_570222 ) ) ( not ( = ?auto_570216 ?auto_570223 ) ) ( not ( = ?auto_570216 ?auto_570224 ) ) ( not ( = ?auto_570216 ?auto_570225 ) ) ( not ( = ?auto_570216 ?auto_570226 ) ) ( not ( = ?auto_570216 ?auto_570227 ) ) ( not ( = ?auto_570216 ?auto_570228 ) ) ( not ( = ?auto_570217 ?auto_570218 ) ) ( not ( = ?auto_570217 ?auto_570219 ) ) ( not ( = ?auto_570217 ?auto_570220 ) ) ( not ( = ?auto_570217 ?auto_570221 ) ) ( not ( = ?auto_570217 ?auto_570222 ) ) ( not ( = ?auto_570217 ?auto_570223 ) ) ( not ( = ?auto_570217 ?auto_570224 ) ) ( not ( = ?auto_570217 ?auto_570225 ) ) ( not ( = ?auto_570217 ?auto_570226 ) ) ( not ( = ?auto_570217 ?auto_570227 ) ) ( not ( = ?auto_570217 ?auto_570228 ) ) ( not ( = ?auto_570218 ?auto_570219 ) ) ( not ( = ?auto_570218 ?auto_570220 ) ) ( not ( = ?auto_570218 ?auto_570221 ) ) ( not ( = ?auto_570218 ?auto_570222 ) ) ( not ( = ?auto_570218 ?auto_570223 ) ) ( not ( = ?auto_570218 ?auto_570224 ) ) ( not ( = ?auto_570218 ?auto_570225 ) ) ( not ( = ?auto_570218 ?auto_570226 ) ) ( not ( = ?auto_570218 ?auto_570227 ) ) ( not ( = ?auto_570218 ?auto_570228 ) ) ( not ( = ?auto_570219 ?auto_570220 ) ) ( not ( = ?auto_570219 ?auto_570221 ) ) ( not ( = ?auto_570219 ?auto_570222 ) ) ( not ( = ?auto_570219 ?auto_570223 ) ) ( not ( = ?auto_570219 ?auto_570224 ) ) ( not ( = ?auto_570219 ?auto_570225 ) ) ( not ( = ?auto_570219 ?auto_570226 ) ) ( not ( = ?auto_570219 ?auto_570227 ) ) ( not ( = ?auto_570219 ?auto_570228 ) ) ( not ( = ?auto_570220 ?auto_570221 ) ) ( not ( = ?auto_570220 ?auto_570222 ) ) ( not ( = ?auto_570220 ?auto_570223 ) ) ( not ( = ?auto_570220 ?auto_570224 ) ) ( not ( = ?auto_570220 ?auto_570225 ) ) ( not ( = ?auto_570220 ?auto_570226 ) ) ( not ( = ?auto_570220 ?auto_570227 ) ) ( not ( = ?auto_570220 ?auto_570228 ) ) ( not ( = ?auto_570221 ?auto_570222 ) ) ( not ( = ?auto_570221 ?auto_570223 ) ) ( not ( = ?auto_570221 ?auto_570224 ) ) ( not ( = ?auto_570221 ?auto_570225 ) ) ( not ( = ?auto_570221 ?auto_570226 ) ) ( not ( = ?auto_570221 ?auto_570227 ) ) ( not ( = ?auto_570221 ?auto_570228 ) ) ( not ( = ?auto_570222 ?auto_570223 ) ) ( not ( = ?auto_570222 ?auto_570224 ) ) ( not ( = ?auto_570222 ?auto_570225 ) ) ( not ( = ?auto_570222 ?auto_570226 ) ) ( not ( = ?auto_570222 ?auto_570227 ) ) ( not ( = ?auto_570222 ?auto_570228 ) ) ( not ( = ?auto_570223 ?auto_570224 ) ) ( not ( = ?auto_570223 ?auto_570225 ) ) ( not ( = ?auto_570223 ?auto_570226 ) ) ( not ( = ?auto_570223 ?auto_570227 ) ) ( not ( = ?auto_570223 ?auto_570228 ) ) ( not ( = ?auto_570224 ?auto_570225 ) ) ( not ( = ?auto_570224 ?auto_570226 ) ) ( not ( = ?auto_570224 ?auto_570227 ) ) ( not ( = ?auto_570224 ?auto_570228 ) ) ( not ( = ?auto_570225 ?auto_570226 ) ) ( not ( = ?auto_570225 ?auto_570227 ) ) ( not ( = ?auto_570225 ?auto_570228 ) ) ( not ( = ?auto_570226 ?auto_570227 ) ) ( not ( = ?auto_570226 ?auto_570228 ) ) ( not ( = ?auto_570227 ?auto_570228 ) ) ( ON ?auto_570226 ?auto_570227 ) ( ON ?auto_570225 ?auto_570226 ) ( ON ?auto_570224 ?auto_570225 ) ( ON ?auto_570223 ?auto_570224 ) ( ON ?auto_570222 ?auto_570223 ) ( ON ?auto_570221 ?auto_570222 ) ( ON ?auto_570220 ?auto_570221 ) ( ON ?auto_570219 ?auto_570220 ) ( ON ?auto_570218 ?auto_570219 ) ( CLEAR ?auto_570216 ) ( ON ?auto_570217 ?auto_570218 ) ( CLEAR ?auto_570217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_570213 ?auto_570214 ?auto_570215 ?auto_570216 ?auto_570217 )
      ( MAKE-15PILE ?auto_570213 ?auto_570214 ?auto_570215 ?auto_570216 ?auto_570217 ?auto_570218 ?auto_570219 ?auto_570220 ?auto_570221 ?auto_570222 ?auto_570223 ?auto_570224 ?auto_570225 ?auto_570226 ?auto_570227 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_570275 - BLOCK
      ?auto_570276 - BLOCK
      ?auto_570277 - BLOCK
      ?auto_570278 - BLOCK
      ?auto_570279 - BLOCK
      ?auto_570280 - BLOCK
      ?auto_570281 - BLOCK
      ?auto_570282 - BLOCK
      ?auto_570283 - BLOCK
      ?auto_570284 - BLOCK
      ?auto_570285 - BLOCK
      ?auto_570286 - BLOCK
      ?auto_570287 - BLOCK
      ?auto_570288 - BLOCK
      ?auto_570289 - BLOCK
    )
    :vars
    (
      ?auto_570290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_570289 ?auto_570290 ) ( ON-TABLE ?auto_570275 ) ( ON ?auto_570276 ?auto_570275 ) ( ON ?auto_570277 ?auto_570276 ) ( not ( = ?auto_570275 ?auto_570276 ) ) ( not ( = ?auto_570275 ?auto_570277 ) ) ( not ( = ?auto_570275 ?auto_570278 ) ) ( not ( = ?auto_570275 ?auto_570279 ) ) ( not ( = ?auto_570275 ?auto_570280 ) ) ( not ( = ?auto_570275 ?auto_570281 ) ) ( not ( = ?auto_570275 ?auto_570282 ) ) ( not ( = ?auto_570275 ?auto_570283 ) ) ( not ( = ?auto_570275 ?auto_570284 ) ) ( not ( = ?auto_570275 ?auto_570285 ) ) ( not ( = ?auto_570275 ?auto_570286 ) ) ( not ( = ?auto_570275 ?auto_570287 ) ) ( not ( = ?auto_570275 ?auto_570288 ) ) ( not ( = ?auto_570275 ?auto_570289 ) ) ( not ( = ?auto_570275 ?auto_570290 ) ) ( not ( = ?auto_570276 ?auto_570277 ) ) ( not ( = ?auto_570276 ?auto_570278 ) ) ( not ( = ?auto_570276 ?auto_570279 ) ) ( not ( = ?auto_570276 ?auto_570280 ) ) ( not ( = ?auto_570276 ?auto_570281 ) ) ( not ( = ?auto_570276 ?auto_570282 ) ) ( not ( = ?auto_570276 ?auto_570283 ) ) ( not ( = ?auto_570276 ?auto_570284 ) ) ( not ( = ?auto_570276 ?auto_570285 ) ) ( not ( = ?auto_570276 ?auto_570286 ) ) ( not ( = ?auto_570276 ?auto_570287 ) ) ( not ( = ?auto_570276 ?auto_570288 ) ) ( not ( = ?auto_570276 ?auto_570289 ) ) ( not ( = ?auto_570276 ?auto_570290 ) ) ( not ( = ?auto_570277 ?auto_570278 ) ) ( not ( = ?auto_570277 ?auto_570279 ) ) ( not ( = ?auto_570277 ?auto_570280 ) ) ( not ( = ?auto_570277 ?auto_570281 ) ) ( not ( = ?auto_570277 ?auto_570282 ) ) ( not ( = ?auto_570277 ?auto_570283 ) ) ( not ( = ?auto_570277 ?auto_570284 ) ) ( not ( = ?auto_570277 ?auto_570285 ) ) ( not ( = ?auto_570277 ?auto_570286 ) ) ( not ( = ?auto_570277 ?auto_570287 ) ) ( not ( = ?auto_570277 ?auto_570288 ) ) ( not ( = ?auto_570277 ?auto_570289 ) ) ( not ( = ?auto_570277 ?auto_570290 ) ) ( not ( = ?auto_570278 ?auto_570279 ) ) ( not ( = ?auto_570278 ?auto_570280 ) ) ( not ( = ?auto_570278 ?auto_570281 ) ) ( not ( = ?auto_570278 ?auto_570282 ) ) ( not ( = ?auto_570278 ?auto_570283 ) ) ( not ( = ?auto_570278 ?auto_570284 ) ) ( not ( = ?auto_570278 ?auto_570285 ) ) ( not ( = ?auto_570278 ?auto_570286 ) ) ( not ( = ?auto_570278 ?auto_570287 ) ) ( not ( = ?auto_570278 ?auto_570288 ) ) ( not ( = ?auto_570278 ?auto_570289 ) ) ( not ( = ?auto_570278 ?auto_570290 ) ) ( not ( = ?auto_570279 ?auto_570280 ) ) ( not ( = ?auto_570279 ?auto_570281 ) ) ( not ( = ?auto_570279 ?auto_570282 ) ) ( not ( = ?auto_570279 ?auto_570283 ) ) ( not ( = ?auto_570279 ?auto_570284 ) ) ( not ( = ?auto_570279 ?auto_570285 ) ) ( not ( = ?auto_570279 ?auto_570286 ) ) ( not ( = ?auto_570279 ?auto_570287 ) ) ( not ( = ?auto_570279 ?auto_570288 ) ) ( not ( = ?auto_570279 ?auto_570289 ) ) ( not ( = ?auto_570279 ?auto_570290 ) ) ( not ( = ?auto_570280 ?auto_570281 ) ) ( not ( = ?auto_570280 ?auto_570282 ) ) ( not ( = ?auto_570280 ?auto_570283 ) ) ( not ( = ?auto_570280 ?auto_570284 ) ) ( not ( = ?auto_570280 ?auto_570285 ) ) ( not ( = ?auto_570280 ?auto_570286 ) ) ( not ( = ?auto_570280 ?auto_570287 ) ) ( not ( = ?auto_570280 ?auto_570288 ) ) ( not ( = ?auto_570280 ?auto_570289 ) ) ( not ( = ?auto_570280 ?auto_570290 ) ) ( not ( = ?auto_570281 ?auto_570282 ) ) ( not ( = ?auto_570281 ?auto_570283 ) ) ( not ( = ?auto_570281 ?auto_570284 ) ) ( not ( = ?auto_570281 ?auto_570285 ) ) ( not ( = ?auto_570281 ?auto_570286 ) ) ( not ( = ?auto_570281 ?auto_570287 ) ) ( not ( = ?auto_570281 ?auto_570288 ) ) ( not ( = ?auto_570281 ?auto_570289 ) ) ( not ( = ?auto_570281 ?auto_570290 ) ) ( not ( = ?auto_570282 ?auto_570283 ) ) ( not ( = ?auto_570282 ?auto_570284 ) ) ( not ( = ?auto_570282 ?auto_570285 ) ) ( not ( = ?auto_570282 ?auto_570286 ) ) ( not ( = ?auto_570282 ?auto_570287 ) ) ( not ( = ?auto_570282 ?auto_570288 ) ) ( not ( = ?auto_570282 ?auto_570289 ) ) ( not ( = ?auto_570282 ?auto_570290 ) ) ( not ( = ?auto_570283 ?auto_570284 ) ) ( not ( = ?auto_570283 ?auto_570285 ) ) ( not ( = ?auto_570283 ?auto_570286 ) ) ( not ( = ?auto_570283 ?auto_570287 ) ) ( not ( = ?auto_570283 ?auto_570288 ) ) ( not ( = ?auto_570283 ?auto_570289 ) ) ( not ( = ?auto_570283 ?auto_570290 ) ) ( not ( = ?auto_570284 ?auto_570285 ) ) ( not ( = ?auto_570284 ?auto_570286 ) ) ( not ( = ?auto_570284 ?auto_570287 ) ) ( not ( = ?auto_570284 ?auto_570288 ) ) ( not ( = ?auto_570284 ?auto_570289 ) ) ( not ( = ?auto_570284 ?auto_570290 ) ) ( not ( = ?auto_570285 ?auto_570286 ) ) ( not ( = ?auto_570285 ?auto_570287 ) ) ( not ( = ?auto_570285 ?auto_570288 ) ) ( not ( = ?auto_570285 ?auto_570289 ) ) ( not ( = ?auto_570285 ?auto_570290 ) ) ( not ( = ?auto_570286 ?auto_570287 ) ) ( not ( = ?auto_570286 ?auto_570288 ) ) ( not ( = ?auto_570286 ?auto_570289 ) ) ( not ( = ?auto_570286 ?auto_570290 ) ) ( not ( = ?auto_570287 ?auto_570288 ) ) ( not ( = ?auto_570287 ?auto_570289 ) ) ( not ( = ?auto_570287 ?auto_570290 ) ) ( not ( = ?auto_570288 ?auto_570289 ) ) ( not ( = ?auto_570288 ?auto_570290 ) ) ( not ( = ?auto_570289 ?auto_570290 ) ) ( ON ?auto_570288 ?auto_570289 ) ( ON ?auto_570287 ?auto_570288 ) ( ON ?auto_570286 ?auto_570287 ) ( ON ?auto_570285 ?auto_570286 ) ( ON ?auto_570284 ?auto_570285 ) ( ON ?auto_570283 ?auto_570284 ) ( ON ?auto_570282 ?auto_570283 ) ( ON ?auto_570281 ?auto_570282 ) ( ON ?auto_570280 ?auto_570281 ) ( ON ?auto_570279 ?auto_570280 ) ( CLEAR ?auto_570277 ) ( ON ?auto_570278 ?auto_570279 ) ( CLEAR ?auto_570278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_570275 ?auto_570276 ?auto_570277 ?auto_570278 )
      ( MAKE-15PILE ?auto_570275 ?auto_570276 ?auto_570277 ?auto_570278 ?auto_570279 ?auto_570280 ?auto_570281 ?auto_570282 ?auto_570283 ?auto_570284 ?auto_570285 ?auto_570286 ?auto_570287 ?auto_570288 ?auto_570289 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_570337 - BLOCK
      ?auto_570338 - BLOCK
      ?auto_570339 - BLOCK
      ?auto_570340 - BLOCK
      ?auto_570341 - BLOCK
      ?auto_570342 - BLOCK
      ?auto_570343 - BLOCK
      ?auto_570344 - BLOCK
      ?auto_570345 - BLOCK
      ?auto_570346 - BLOCK
      ?auto_570347 - BLOCK
      ?auto_570348 - BLOCK
      ?auto_570349 - BLOCK
      ?auto_570350 - BLOCK
      ?auto_570351 - BLOCK
    )
    :vars
    (
      ?auto_570352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_570351 ?auto_570352 ) ( ON-TABLE ?auto_570337 ) ( ON ?auto_570338 ?auto_570337 ) ( not ( = ?auto_570337 ?auto_570338 ) ) ( not ( = ?auto_570337 ?auto_570339 ) ) ( not ( = ?auto_570337 ?auto_570340 ) ) ( not ( = ?auto_570337 ?auto_570341 ) ) ( not ( = ?auto_570337 ?auto_570342 ) ) ( not ( = ?auto_570337 ?auto_570343 ) ) ( not ( = ?auto_570337 ?auto_570344 ) ) ( not ( = ?auto_570337 ?auto_570345 ) ) ( not ( = ?auto_570337 ?auto_570346 ) ) ( not ( = ?auto_570337 ?auto_570347 ) ) ( not ( = ?auto_570337 ?auto_570348 ) ) ( not ( = ?auto_570337 ?auto_570349 ) ) ( not ( = ?auto_570337 ?auto_570350 ) ) ( not ( = ?auto_570337 ?auto_570351 ) ) ( not ( = ?auto_570337 ?auto_570352 ) ) ( not ( = ?auto_570338 ?auto_570339 ) ) ( not ( = ?auto_570338 ?auto_570340 ) ) ( not ( = ?auto_570338 ?auto_570341 ) ) ( not ( = ?auto_570338 ?auto_570342 ) ) ( not ( = ?auto_570338 ?auto_570343 ) ) ( not ( = ?auto_570338 ?auto_570344 ) ) ( not ( = ?auto_570338 ?auto_570345 ) ) ( not ( = ?auto_570338 ?auto_570346 ) ) ( not ( = ?auto_570338 ?auto_570347 ) ) ( not ( = ?auto_570338 ?auto_570348 ) ) ( not ( = ?auto_570338 ?auto_570349 ) ) ( not ( = ?auto_570338 ?auto_570350 ) ) ( not ( = ?auto_570338 ?auto_570351 ) ) ( not ( = ?auto_570338 ?auto_570352 ) ) ( not ( = ?auto_570339 ?auto_570340 ) ) ( not ( = ?auto_570339 ?auto_570341 ) ) ( not ( = ?auto_570339 ?auto_570342 ) ) ( not ( = ?auto_570339 ?auto_570343 ) ) ( not ( = ?auto_570339 ?auto_570344 ) ) ( not ( = ?auto_570339 ?auto_570345 ) ) ( not ( = ?auto_570339 ?auto_570346 ) ) ( not ( = ?auto_570339 ?auto_570347 ) ) ( not ( = ?auto_570339 ?auto_570348 ) ) ( not ( = ?auto_570339 ?auto_570349 ) ) ( not ( = ?auto_570339 ?auto_570350 ) ) ( not ( = ?auto_570339 ?auto_570351 ) ) ( not ( = ?auto_570339 ?auto_570352 ) ) ( not ( = ?auto_570340 ?auto_570341 ) ) ( not ( = ?auto_570340 ?auto_570342 ) ) ( not ( = ?auto_570340 ?auto_570343 ) ) ( not ( = ?auto_570340 ?auto_570344 ) ) ( not ( = ?auto_570340 ?auto_570345 ) ) ( not ( = ?auto_570340 ?auto_570346 ) ) ( not ( = ?auto_570340 ?auto_570347 ) ) ( not ( = ?auto_570340 ?auto_570348 ) ) ( not ( = ?auto_570340 ?auto_570349 ) ) ( not ( = ?auto_570340 ?auto_570350 ) ) ( not ( = ?auto_570340 ?auto_570351 ) ) ( not ( = ?auto_570340 ?auto_570352 ) ) ( not ( = ?auto_570341 ?auto_570342 ) ) ( not ( = ?auto_570341 ?auto_570343 ) ) ( not ( = ?auto_570341 ?auto_570344 ) ) ( not ( = ?auto_570341 ?auto_570345 ) ) ( not ( = ?auto_570341 ?auto_570346 ) ) ( not ( = ?auto_570341 ?auto_570347 ) ) ( not ( = ?auto_570341 ?auto_570348 ) ) ( not ( = ?auto_570341 ?auto_570349 ) ) ( not ( = ?auto_570341 ?auto_570350 ) ) ( not ( = ?auto_570341 ?auto_570351 ) ) ( not ( = ?auto_570341 ?auto_570352 ) ) ( not ( = ?auto_570342 ?auto_570343 ) ) ( not ( = ?auto_570342 ?auto_570344 ) ) ( not ( = ?auto_570342 ?auto_570345 ) ) ( not ( = ?auto_570342 ?auto_570346 ) ) ( not ( = ?auto_570342 ?auto_570347 ) ) ( not ( = ?auto_570342 ?auto_570348 ) ) ( not ( = ?auto_570342 ?auto_570349 ) ) ( not ( = ?auto_570342 ?auto_570350 ) ) ( not ( = ?auto_570342 ?auto_570351 ) ) ( not ( = ?auto_570342 ?auto_570352 ) ) ( not ( = ?auto_570343 ?auto_570344 ) ) ( not ( = ?auto_570343 ?auto_570345 ) ) ( not ( = ?auto_570343 ?auto_570346 ) ) ( not ( = ?auto_570343 ?auto_570347 ) ) ( not ( = ?auto_570343 ?auto_570348 ) ) ( not ( = ?auto_570343 ?auto_570349 ) ) ( not ( = ?auto_570343 ?auto_570350 ) ) ( not ( = ?auto_570343 ?auto_570351 ) ) ( not ( = ?auto_570343 ?auto_570352 ) ) ( not ( = ?auto_570344 ?auto_570345 ) ) ( not ( = ?auto_570344 ?auto_570346 ) ) ( not ( = ?auto_570344 ?auto_570347 ) ) ( not ( = ?auto_570344 ?auto_570348 ) ) ( not ( = ?auto_570344 ?auto_570349 ) ) ( not ( = ?auto_570344 ?auto_570350 ) ) ( not ( = ?auto_570344 ?auto_570351 ) ) ( not ( = ?auto_570344 ?auto_570352 ) ) ( not ( = ?auto_570345 ?auto_570346 ) ) ( not ( = ?auto_570345 ?auto_570347 ) ) ( not ( = ?auto_570345 ?auto_570348 ) ) ( not ( = ?auto_570345 ?auto_570349 ) ) ( not ( = ?auto_570345 ?auto_570350 ) ) ( not ( = ?auto_570345 ?auto_570351 ) ) ( not ( = ?auto_570345 ?auto_570352 ) ) ( not ( = ?auto_570346 ?auto_570347 ) ) ( not ( = ?auto_570346 ?auto_570348 ) ) ( not ( = ?auto_570346 ?auto_570349 ) ) ( not ( = ?auto_570346 ?auto_570350 ) ) ( not ( = ?auto_570346 ?auto_570351 ) ) ( not ( = ?auto_570346 ?auto_570352 ) ) ( not ( = ?auto_570347 ?auto_570348 ) ) ( not ( = ?auto_570347 ?auto_570349 ) ) ( not ( = ?auto_570347 ?auto_570350 ) ) ( not ( = ?auto_570347 ?auto_570351 ) ) ( not ( = ?auto_570347 ?auto_570352 ) ) ( not ( = ?auto_570348 ?auto_570349 ) ) ( not ( = ?auto_570348 ?auto_570350 ) ) ( not ( = ?auto_570348 ?auto_570351 ) ) ( not ( = ?auto_570348 ?auto_570352 ) ) ( not ( = ?auto_570349 ?auto_570350 ) ) ( not ( = ?auto_570349 ?auto_570351 ) ) ( not ( = ?auto_570349 ?auto_570352 ) ) ( not ( = ?auto_570350 ?auto_570351 ) ) ( not ( = ?auto_570350 ?auto_570352 ) ) ( not ( = ?auto_570351 ?auto_570352 ) ) ( ON ?auto_570350 ?auto_570351 ) ( ON ?auto_570349 ?auto_570350 ) ( ON ?auto_570348 ?auto_570349 ) ( ON ?auto_570347 ?auto_570348 ) ( ON ?auto_570346 ?auto_570347 ) ( ON ?auto_570345 ?auto_570346 ) ( ON ?auto_570344 ?auto_570345 ) ( ON ?auto_570343 ?auto_570344 ) ( ON ?auto_570342 ?auto_570343 ) ( ON ?auto_570341 ?auto_570342 ) ( ON ?auto_570340 ?auto_570341 ) ( CLEAR ?auto_570338 ) ( ON ?auto_570339 ?auto_570340 ) ( CLEAR ?auto_570339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_570337 ?auto_570338 ?auto_570339 )
      ( MAKE-15PILE ?auto_570337 ?auto_570338 ?auto_570339 ?auto_570340 ?auto_570341 ?auto_570342 ?auto_570343 ?auto_570344 ?auto_570345 ?auto_570346 ?auto_570347 ?auto_570348 ?auto_570349 ?auto_570350 ?auto_570351 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_570399 - BLOCK
      ?auto_570400 - BLOCK
      ?auto_570401 - BLOCK
      ?auto_570402 - BLOCK
      ?auto_570403 - BLOCK
      ?auto_570404 - BLOCK
      ?auto_570405 - BLOCK
      ?auto_570406 - BLOCK
      ?auto_570407 - BLOCK
      ?auto_570408 - BLOCK
      ?auto_570409 - BLOCK
      ?auto_570410 - BLOCK
      ?auto_570411 - BLOCK
      ?auto_570412 - BLOCK
      ?auto_570413 - BLOCK
    )
    :vars
    (
      ?auto_570414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_570413 ?auto_570414 ) ( ON-TABLE ?auto_570399 ) ( not ( = ?auto_570399 ?auto_570400 ) ) ( not ( = ?auto_570399 ?auto_570401 ) ) ( not ( = ?auto_570399 ?auto_570402 ) ) ( not ( = ?auto_570399 ?auto_570403 ) ) ( not ( = ?auto_570399 ?auto_570404 ) ) ( not ( = ?auto_570399 ?auto_570405 ) ) ( not ( = ?auto_570399 ?auto_570406 ) ) ( not ( = ?auto_570399 ?auto_570407 ) ) ( not ( = ?auto_570399 ?auto_570408 ) ) ( not ( = ?auto_570399 ?auto_570409 ) ) ( not ( = ?auto_570399 ?auto_570410 ) ) ( not ( = ?auto_570399 ?auto_570411 ) ) ( not ( = ?auto_570399 ?auto_570412 ) ) ( not ( = ?auto_570399 ?auto_570413 ) ) ( not ( = ?auto_570399 ?auto_570414 ) ) ( not ( = ?auto_570400 ?auto_570401 ) ) ( not ( = ?auto_570400 ?auto_570402 ) ) ( not ( = ?auto_570400 ?auto_570403 ) ) ( not ( = ?auto_570400 ?auto_570404 ) ) ( not ( = ?auto_570400 ?auto_570405 ) ) ( not ( = ?auto_570400 ?auto_570406 ) ) ( not ( = ?auto_570400 ?auto_570407 ) ) ( not ( = ?auto_570400 ?auto_570408 ) ) ( not ( = ?auto_570400 ?auto_570409 ) ) ( not ( = ?auto_570400 ?auto_570410 ) ) ( not ( = ?auto_570400 ?auto_570411 ) ) ( not ( = ?auto_570400 ?auto_570412 ) ) ( not ( = ?auto_570400 ?auto_570413 ) ) ( not ( = ?auto_570400 ?auto_570414 ) ) ( not ( = ?auto_570401 ?auto_570402 ) ) ( not ( = ?auto_570401 ?auto_570403 ) ) ( not ( = ?auto_570401 ?auto_570404 ) ) ( not ( = ?auto_570401 ?auto_570405 ) ) ( not ( = ?auto_570401 ?auto_570406 ) ) ( not ( = ?auto_570401 ?auto_570407 ) ) ( not ( = ?auto_570401 ?auto_570408 ) ) ( not ( = ?auto_570401 ?auto_570409 ) ) ( not ( = ?auto_570401 ?auto_570410 ) ) ( not ( = ?auto_570401 ?auto_570411 ) ) ( not ( = ?auto_570401 ?auto_570412 ) ) ( not ( = ?auto_570401 ?auto_570413 ) ) ( not ( = ?auto_570401 ?auto_570414 ) ) ( not ( = ?auto_570402 ?auto_570403 ) ) ( not ( = ?auto_570402 ?auto_570404 ) ) ( not ( = ?auto_570402 ?auto_570405 ) ) ( not ( = ?auto_570402 ?auto_570406 ) ) ( not ( = ?auto_570402 ?auto_570407 ) ) ( not ( = ?auto_570402 ?auto_570408 ) ) ( not ( = ?auto_570402 ?auto_570409 ) ) ( not ( = ?auto_570402 ?auto_570410 ) ) ( not ( = ?auto_570402 ?auto_570411 ) ) ( not ( = ?auto_570402 ?auto_570412 ) ) ( not ( = ?auto_570402 ?auto_570413 ) ) ( not ( = ?auto_570402 ?auto_570414 ) ) ( not ( = ?auto_570403 ?auto_570404 ) ) ( not ( = ?auto_570403 ?auto_570405 ) ) ( not ( = ?auto_570403 ?auto_570406 ) ) ( not ( = ?auto_570403 ?auto_570407 ) ) ( not ( = ?auto_570403 ?auto_570408 ) ) ( not ( = ?auto_570403 ?auto_570409 ) ) ( not ( = ?auto_570403 ?auto_570410 ) ) ( not ( = ?auto_570403 ?auto_570411 ) ) ( not ( = ?auto_570403 ?auto_570412 ) ) ( not ( = ?auto_570403 ?auto_570413 ) ) ( not ( = ?auto_570403 ?auto_570414 ) ) ( not ( = ?auto_570404 ?auto_570405 ) ) ( not ( = ?auto_570404 ?auto_570406 ) ) ( not ( = ?auto_570404 ?auto_570407 ) ) ( not ( = ?auto_570404 ?auto_570408 ) ) ( not ( = ?auto_570404 ?auto_570409 ) ) ( not ( = ?auto_570404 ?auto_570410 ) ) ( not ( = ?auto_570404 ?auto_570411 ) ) ( not ( = ?auto_570404 ?auto_570412 ) ) ( not ( = ?auto_570404 ?auto_570413 ) ) ( not ( = ?auto_570404 ?auto_570414 ) ) ( not ( = ?auto_570405 ?auto_570406 ) ) ( not ( = ?auto_570405 ?auto_570407 ) ) ( not ( = ?auto_570405 ?auto_570408 ) ) ( not ( = ?auto_570405 ?auto_570409 ) ) ( not ( = ?auto_570405 ?auto_570410 ) ) ( not ( = ?auto_570405 ?auto_570411 ) ) ( not ( = ?auto_570405 ?auto_570412 ) ) ( not ( = ?auto_570405 ?auto_570413 ) ) ( not ( = ?auto_570405 ?auto_570414 ) ) ( not ( = ?auto_570406 ?auto_570407 ) ) ( not ( = ?auto_570406 ?auto_570408 ) ) ( not ( = ?auto_570406 ?auto_570409 ) ) ( not ( = ?auto_570406 ?auto_570410 ) ) ( not ( = ?auto_570406 ?auto_570411 ) ) ( not ( = ?auto_570406 ?auto_570412 ) ) ( not ( = ?auto_570406 ?auto_570413 ) ) ( not ( = ?auto_570406 ?auto_570414 ) ) ( not ( = ?auto_570407 ?auto_570408 ) ) ( not ( = ?auto_570407 ?auto_570409 ) ) ( not ( = ?auto_570407 ?auto_570410 ) ) ( not ( = ?auto_570407 ?auto_570411 ) ) ( not ( = ?auto_570407 ?auto_570412 ) ) ( not ( = ?auto_570407 ?auto_570413 ) ) ( not ( = ?auto_570407 ?auto_570414 ) ) ( not ( = ?auto_570408 ?auto_570409 ) ) ( not ( = ?auto_570408 ?auto_570410 ) ) ( not ( = ?auto_570408 ?auto_570411 ) ) ( not ( = ?auto_570408 ?auto_570412 ) ) ( not ( = ?auto_570408 ?auto_570413 ) ) ( not ( = ?auto_570408 ?auto_570414 ) ) ( not ( = ?auto_570409 ?auto_570410 ) ) ( not ( = ?auto_570409 ?auto_570411 ) ) ( not ( = ?auto_570409 ?auto_570412 ) ) ( not ( = ?auto_570409 ?auto_570413 ) ) ( not ( = ?auto_570409 ?auto_570414 ) ) ( not ( = ?auto_570410 ?auto_570411 ) ) ( not ( = ?auto_570410 ?auto_570412 ) ) ( not ( = ?auto_570410 ?auto_570413 ) ) ( not ( = ?auto_570410 ?auto_570414 ) ) ( not ( = ?auto_570411 ?auto_570412 ) ) ( not ( = ?auto_570411 ?auto_570413 ) ) ( not ( = ?auto_570411 ?auto_570414 ) ) ( not ( = ?auto_570412 ?auto_570413 ) ) ( not ( = ?auto_570412 ?auto_570414 ) ) ( not ( = ?auto_570413 ?auto_570414 ) ) ( ON ?auto_570412 ?auto_570413 ) ( ON ?auto_570411 ?auto_570412 ) ( ON ?auto_570410 ?auto_570411 ) ( ON ?auto_570409 ?auto_570410 ) ( ON ?auto_570408 ?auto_570409 ) ( ON ?auto_570407 ?auto_570408 ) ( ON ?auto_570406 ?auto_570407 ) ( ON ?auto_570405 ?auto_570406 ) ( ON ?auto_570404 ?auto_570405 ) ( ON ?auto_570403 ?auto_570404 ) ( ON ?auto_570402 ?auto_570403 ) ( ON ?auto_570401 ?auto_570402 ) ( CLEAR ?auto_570399 ) ( ON ?auto_570400 ?auto_570401 ) ( CLEAR ?auto_570400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_570399 ?auto_570400 )
      ( MAKE-15PILE ?auto_570399 ?auto_570400 ?auto_570401 ?auto_570402 ?auto_570403 ?auto_570404 ?auto_570405 ?auto_570406 ?auto_570407 ?auto_570408 ?auto_570409 ?auto_570410 ?auto_570411 ?auto_570412 ?auto_570413 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_570461 - BLOCK
      ?auto_570462 - BLOCK
      ?auto_570463 - BLOCK
      ?auto_570464 - BLOCK
      ?auto_570465 - BLOCK
      ?auto_570466 - BLOCK
      ?auto_570467 - BLOCK
      ?auto_570468 - BLOCK
      ?auto_570469 - BLOCK
      ?auto_570470 - BLOCK
      ?auto_570471 - BLOCK
      ?auto_570472 - BLOCK
      ?auto_570473 - BLOCK
      ?auto_570474 - BLOCK
      ?auto_570475 - BLOCK
    )
    :vars
    (
      ?auto_570476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_570475 ?auto_570476 ) ( not ( = ?auto_570461 ?auto_570462 ) ) ( not ( = ?auto_570461 ?auto_570463 ) ) ( not ( = ?auto_570461 ?auto_570464 ) ) ( not ( = ?auto_570461 ?auto_570465 ) ) ( not ( = ?auto_570461 ?auto_570466 ) ) ( not ( = ?auto_570461 ?auto_570467 ) ) ( not ( = ?auto_570461 ?auto_570468 ) ) ( not ( = ?auto_570461 ?auto_570469 ) ) ( not ( = ?auto_570461 ?auto_570470 ) ) ( not ( = ?auto_570461 ?auto_570471 ) ) ( not ( = ?auto_570461 ?auto_570472 ) ) ( not ( = ?auto_570461 ?auto_570473 ) ) ( not ( = ?auto_570461 ?auto_570474 ) ) ( not ( = ?auto_570461 ?auto_570475 ) ) ( not ( = ?auto_570461 ?auto_570476 ) ) ( not ( = ?auto_570462 ?auto_570463 ) ) ( not ( = ?auto_570462 ?auto_570464 ) ) ( not ( = ?auto_570462 ?auto_570465 ) ) ( not ( = ?auto_570462 ?auto_570466 ) ) ( not ( = ?auto_570462 ?auto_570467 ) ) ( not ( = ?auto_570462 ?auto_570468 ) ) ( not ( = ?auto_570462 ?auto_570469 ) ) ( not ( = ?auto_570462 ?auto_570470 ) ) ( not ( = ?auto_570462 ?auto_570471 ) ) ( not ( = ?auto_570462 ?auto_570472 ) ) ( not ( = ?auto_570462 ?auto_570473 ) ) ( not ( = ?auto_570462 ?auto_570474 ) ) ( not ( = ?auto_570462 ?auto_570475 ) ) ( not ( = ?auto_570462 ?auto_570476 ) ) ( not ( = ?auto_570463 ?auto_570464 ) ) ( not ( = ?auto_570463 ?auto_570465 ) ) ( not ( = ?auto_570463 ?auto_570466 ) ) ( not ( = ?auto_570463 ?auto_570467 ) ) ( not ( = ?auto_570463 ?auto_570468 ) ) ( not ( = ?auto_570463 ?auto_570469 ) ) ( not ( = ?auto_570463 ?auto_570470 ) ) ( not ( = ?auto_570463 ?auto_570471 ) ) ( not ( = ?auto_570463 ?auto_570472 ) ) ( not ( = ?auto_570463 ?auto_570473 ) ) ( not ( = ?auto_570463 ?auto_570474 ) ) ( not ( = ?auto_570463 ?auto_570475 ) ) ( not ( = ?auto_570463 ?auto_570476 ) ) ( not ( = ?auto_570464 ?auto_570465 ) ) ( not ( = ?auto_570464 ?auto_570466 ) ) ( not ( = ?auto_570464 ?auto_570467 ) ) ( not ( = ?auto_570464 ?auto_570468 ) ) ( not ( = ?auto_570464 ?auto_570469 ) ) ( not ( = ?auto_570464 ?auto_570470 ) ) ( not ( = ?auto_570464 ?auto_570471 ) ) ( not ( = ?auto_570464 ?auto_570472 ) ) ( not ( = ?auto_570464 ?auto_570473 ) ) ( not ( = ?auto_570464 ?auto_570474 ) ) ( not ( = ?auto_570464 ?auto_570475 ) ) ( not ( = ?auto_570464 ?auto_570476 ) ) ( not ( = ?auto_570465 ?auto_570466 ) ) ( not ( = ?auto_570465 ?auto_570467 ) ) ( not ( = ?auto_570465 ?auto_570468 ) ) ( not ( = ?auto_570465 ?auto_570469 ) ) ( not ( = ?auto_570465 ?auto_570470 ) ) ( not ( = ?auto_570465 ?auto_570471 ) ) ( not ( = ?auto_570465 ?auto_570472 ) ) ( not ( = ?auto_570465 ?auto_570473 ) ) ( not ( = ?auto_570465 ?auto_570474 ) ) ( not ( = ?auto_570465 ?auto_570475 ) ) ( not ( = ?auto_570465 ?auto_570476 ) ) ( not ( = ?auto_570466 ?auto_570467 ) ) ( not ( = ?auto_570466 ?auto_570468 ) ) ( not ( = ?auto_570466 ?auto_570469 ) ) ( not ( = ?auto_570466 ?auto_570470 ) ) ( not ( = ?auto_570466 ?auto_570471 ) ) ( not ( = ?auto_570466 ?auto_570472 ) ) ( not ( = ?auto_570466 ?auto_570473 ) ) ( not ( = ?auto_570466 ?auto_570474 ) ) ( not ( = ?auto_570466 ?auto_570475 ) ) ( not ( = ?auto_570466 ?auto_570476 ) ) ( not ( = ?auto_570467 ?auto_570468 ) ) ( not ( = ?auto_570467 ?auto_570469 ) ) ( not ( = ?auto_570467 ?auto_570470 ) ) ( not ( = ?auto_570467 ?auto_570471 ) ) ( not ( = ?auto_570467 ?auto_570472 ) ) ( not ( = ?auto_570467 ?auto_570473 ) ) ( not ( = ?auto_570467 ?auto_570474 ) ) ( not ( = ?auto_570467 ?auto_570475 ) ) ( not ( = ?auto_570467 ?auto_570476 ) ) ( not ( = ?auto_570468 ?auto_570469 ) ) ( not ( = ?auto_570468 ?auto_570470 ) ) ( not ( = ?auto_570468 ?auto_570471 ) ) ( not ( = ?auto_570468 ?auto_570472 ) ) ( not ( = ?auto_570468 ?auto_570473 ) ) ( not ( = ?auto_570468 ?auto_570474 ) ) ( not ( = ?auto_570468 ?auto_570475 ) ) ( not ( = ?auto_570468 ?auto_570476 ) ) ( not ( = ?auto_570469 ?auto_570470 ) ) ( not ( = ?auto_570469 ?auto_570471 ) ) ( not ( = ?auto_570469 ?auto_570472 ) ) ( not ( = ?auto_570469 ?auto_570473 ) ) ( not ( = ?auto_570469 ?auto_570474 ) ) ( not ( = ?auto_570469 ?auto_570475 ) ) ( not ( = ?auto_570469 ?auto_570476 ) ) ( not ( = ?auto_570470 ?auto_570471 ) ) ( not ( = ?auto_570470 ?auto_570472 ) ) ( not ( = ?auto_570470 ?auto_570473 ) ) ( not ( = ?auto_570470 ?auto_570474 ) ) ( not ( = ?auto_570470 ?auto_570475 ) ) ( not ( = ?auto_570470 ?auto_570476 ) ) ( not ( = ?auto_570471 ?auto_570472 ) ) ( not ( = ?auto_570471 ?auto_570473 ) ) ( not ( = ?auto_570471 ?auto_570474 ) ) ( not ( = ?auto_570471 ?auto_570475 ) ) ( not ( = ?auto_570471 ?auto_570476 ) ) ( not ( = ?auto_570472 ?auto_570473 ) ) ( not ( = ?auto_570472 ?auto_570474 ) ) ( not ( = ?auto_570472 ?auto_570475 ) ) ( not ( = ?auto_570472 ?auto_570476 ) ) ( not ( = ?auto_570473 ?auto_570474 ) ) ( not ( = ?auto_570473 ?auto_570475 ) ) ( not ( = ?auto_570473 ?auto_570476 ) ) ( not ( = ?auto_570474 ?auto_570475 ) ) ( not ( = ?auto_570474 ?auto_570476 ) ) ( not ( = ?auto_570475 ?auto_570476 ) ) ( ON ?auto_570474 ?auto_570475 ) ( ON ?auto_570473 ?auto_570474 ) ( ON ?auto_570472 ?auto_570473 ) ( ON ?auto_570471 ?auto_570472 ) ( ON ?auto_570470 ?auto_570471 ) ( ON ?auto_570469 ?auto_570470 ) ( ON ?auto_570468 ?auto_570469 ) ( ON ?auto_570467 ?auto_570468 ) ( ON ?auto_570466 ?auto_570467 ) ( ON ?auto_570465 ?auto_570466 ) ( ON ?auto_570464 ?auto_570465 ) ( ON ?auto_570463 ?auto_570464 ) ( ON ?auto_570462 ?auto_570463 ) ( ON ?auto_570461 ?auto_570462 ) ( CLEAR ?auto_570461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_570461 )
      ( MAKE-15PILE ?auto_570461 ?auto_570462 ?auto_570463 ?auto_570464 ?auto_570465 ?auto_570466 ?auto_570467 ?auto_570468 ?auto_570469 ?auto_570470 ?auto_570471 ?auto_570472 ?auto_570473 ?auto_570474 ?auto_570475 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_570524 - BLOCK
      ?auto_570525 - BLOCK
      ?auto_570526 - BLOCK
      ?auto_570527 - BLOCK
      ?auto_570528 - BLOCK
      ?auto_570529 - BLOCK
      ?auto_570530 - BLOCK
      ?auto_570531 - BLOCK
      ?auto_570532 - BLOCK
      ?auto_570533 - BLOCK
      ?auto_570534 - BLOCK
      ?auto_570535 - BLOCK
      ?auto_570536 - BLOCK
      ?auto_570537 - BLOCK
      ?auto_570538 - BLOCK
      ?auto_570539 - BLOCK
    )
    :vars
    (
      ?auto_570540 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_570538 ) ( ON ?auto_570539 ?auto_570540 ) ( CLEAR ?auto_570539 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_570524 ) ( ON ?auto_570525 ?auto_570524 ) ( ON ?auto_570526 ?auto_570525 ) ( ON ?auto_570527 ?auto_570526 ) ( ON ?auto_570528 ?auto_570527 ) ( ON ?auto_570529 ?auto_570528 ) ( ON ?auto_570530 ?auto_570529 ) ( ON ?auto_570531 ?auto_570530 ) ( ON ?auto_570532 ?auto_570531 ) ( ON ?auto_570533 ?auto_570532 ) ( ON ?auto_570534 ?auto_570533 ) ( ON ?auto_570535 ?auto_570534 ) ( ON ?auto_570536 ?auto_570535 ) ( ON ?auto_570537 ?auto_570536 ) ( ON ?auto_570538 ?auto_570537 ) ( not ( = ?auto_570524 ?auto_570525 ) ) ( not ( = ?auto_570524 ?auto_570526 ) ) ( not ( = ?auto_570524 ?auto_570527 ) ) ( not ( = ?auto_570524 ?auto_570528 ) ) ( not ( = ?auto_570524 ?auto_570529 ) ) ( not ( = ?auto_570524 ?auto_570530 ) ) ( not ( = ?auto_570524 ?auto_570531 ) ) ( not ( = ?auto_570524 ?auto_570532 ) ) ( not ( = ?auto_570524 ?auto_570533 ) ) ( not ( = ?auto_570524 ?auto_570534 ) ) ( not ( = ?auto_570524 ?auto_570535 ) ) ( not ( = ?auto_570524 ?auto_570536 ) ) ( not ( = ?auto_570524 ?auto_570537 ) ) ( not ( = ?auto_570524 ?auto_570538 ) ) ( not ( = ?auto_570524 ?auto_570539 ) ) ( not ( = ?auto_570524 ?auto_570540 ) ) ( not ( = ?auto_570525 ?auto_570526 ) ) ( not ( = ?auto_570525 ?auto_570527 ) ) ( not ( = ?auto_570525 ?auto_570528 ) ) ( not ( = ?auto_570525 ?auto_570529 ) ) ( not ( = ?auto_570525 ?auto_570530 ) ) ( not ( = ?auto_570525 ?auto_570531 ) ) ( not ( = ?auto_570525 ?auto_570532 ) ) ( not ( = ?auto_570525 ?auto_570533 ) ) ( not ( = ?auto_570525 ?auto_570534 ) ) ( not ( = ?auto_570525 ?auto_570535 ) ) ( not ( = ?auto_570525 ?auto_570536 ) ) ( not ( = ?auto_570525 ?auto_570537 ) ) ( not ( = ?auto_570525 ?auto_570538 ) ) ( not ( = ?auto_570525 ?auto_570539 ) ) ( not ( = ?auto_570525 ?auto_570540 ) ) ( not ( = ?auto_570526 ?auto_570527 ) ) ( not ( = ?auto_570526 ?auto_570528 ) ) ( not ( = ?auto_570526 ?auto_570529 ) ) ( not ( = ?auto_570526 ?auto_570530 ) ) ( not ( = ?auto_570526 ?auto_570531 ) ) ( not ( = ?auto_570526 ?auto_570532 ) ) ( not ( = ?auto_570526 ?auto_570533 ) ) ( not ( = ?auto_570526 ?auto_570534 ) ) ( not ( = ?auto_570526 ?auto_570535 ) ) ( not ( = ?auto_570526 ?auto_570536 ) ) ( not ( = ?auto_570526 ?auto_570537 ) ) ( not ( = ?auto_570526 ?auto_570538 ) ) ( not ( = ?auto_570526 ?auto_570539 ) ) ( not ( = ?auto_570526 ?auto_570540 ) ) ( not ( = ?auto_570527 ?auto_570528 ) ) ( not ( = ?auto_570527 ?auto_570529 ) ) ( not ( = ?auto_570527 ?auto_570530 ) ) ( not ( = ?auto_570527 ?auto_570531 ) ) ( not ( = ?auto_570527 ?auto_570532 ) ) ( not ( = ?auto_570527 ?auto_570533 ) ) ( not ( = ?auto_570527 ?auto_570534 ) ) ( not ( = ?auto_570527 ?auto_570535 ) ) ( not ( = ?auto_570527 ?auto_570536 ) ) ( not ( = ?auto_570527 ?auto_570537 ) ) ( not ( = ?auto_570527 ?auto_570538 ) ) ( not ( = ?auto_570527 ?auto_570539 ) ) ( not ( = ?auto_570527 ?auto_570540 ) ) ( not ( = ?auto_570528 ?auto_570529 ) ) ( not ( = ?auto_570528 ?auto_570530 ) ) ( not ( = ?auto_570528 ?auto_570531 ) ) ( not ( = ?auto_570528 ?auto_570532 ) ) ( not ( = ?auto_570528 ?auto_570533 ) ) ( not ( = ?auto_570528 ?auto_570534 ) ) ( not ( = ?auto_570528 ?auto_570535 ) ) ( not ( = ?auto_570528 ?auto_570536 ) ) ( not ( = ?auto_570528 ?auto_570537 ) ) ( not ( = ?auto_570528 ?auto_570538 ) ) ( not ( = ?auto_570528 ?auto_570539 ) ) ( not ( = ?auto_570528 ?auto_570540 ) ) ( not ( = ?auto_570529 ?auto_570530 ) ) ( not ( = ?auto_570529 ?auto_570531 ) ) ( not ( = ?auto_570529 ?auto_570532 ) ) ( not ( = ?auto_570529 ?auto_570533 ) ) ( not ( = ?auto_570529 ?auto_570534 ) ) ( not ( = ?auto_570529 ?auto_570535 ) ) ( not ( = ?auto_570529 ?auto_570536 ) ) ( not ( = ?auto_570529 ?auto_570537 ) ) ( not ( = ?auto_570529 ?auto_570538 ) ) ( not ( = ?auto_570529 ?auto_570539 ) ) ( not ( = ?auto_570529 ?auto_570540 ) ) ( not ( = ?auto_570530 ?auto_570531 ) ) ( not ( = ?auto_570530 ?auto_570532 ) ) ( not ( = ?auto_570530 ?auto_570533 ) ) ( not ( = ?auto_570530 ?auto_570534 ) ) ( not ( = ?auto_570530 ?auto_570535 ) ) ( not ( = ?auto_570530 ?auto_570536 ) ) ( not ( = ?auto_570530 ?auto_570537 ) ) ( not ( = ?auto_570530 ?auto_570538 ) ) ( not ( = ?auto_570530 ?auto_570539 ) ) ( not ( = ?auto_570530 ?auto_570540 ) ) ( not ( = ?auto_570531 ?auto_570532 ) ) ( not ( = ?auto_570531 ?auto_570533 ) ) ( not ( = ?auto_570531 ?auto_570534 ) ) ( not ( = ?auto_570531 ?auto_570535 ) ) ( not ( = ?auto_570531 ?auto_570536 ) ) ( not ( = ?auto_570531 ?auto_570537 ) ) ( not ( = ?auto_570531 ?auto_570538 ) ) ( not ( = ?auto_570531 ?auto_570539 ) ) ( not ( = ?auto_570531 ?auto_570540 ) ) ( not ( = ?auto_570532 ?auto_570533 ) ) ( not ( = ?auto_570532 ?auto_570534 ) ) ( not ( = ?auto_570532 ?auto_570535 ) ) ( not ( = ?auto_570532 ?auto_570536 ) ) ( not ( = ?auto_570532 ?auto_570537 ) ) ( not ( = ?auto_570532 ?auto_570538 ) ) ( not ( = ?auto_570532 ?auto_570539 ) ) ( not ( = ?auto_570532 ?auto_570540 ) ) ( not ( = ?auto_570533 ?auto_570534 ) ) ( not ( = ?auto_570533 ?auto_570535 ) ) ( not ( = ?auto_570533 ?auto_570536 ) ) ( not ( = ?auto_570533 ?auto_570537 ) ) ( not ( = ?auto_570533 ?auto_570538 ) ) ( not ( = ?auto_570533 ?auto_570539 ) ) ( not ( = ?auto_570533 ?auto_570540 ) ) ( not ( = ?auto_570534 ?auto_570535 ) ) ( not ( = ?auto_570534 ?auto_570536 ) ) ( not ( = ?auto_570534 ?auto_570537 ) ) ( not ( = ?auto_570534 ?auto_570538 ) ) ( not ( = ?auto_570534 ?auto_570539 ) ) ( not ( = ?auto_570534 ?auto_570540 ) ) ( not ( = ?auto_570535 ?auto_570536 ) ) ( not ( = ?auto_570535 ?auto_570537 ) ) ( not ( = ?auto_570535 ?auto_570538 ) ) ( not ( = ?auto_570535 ?auto_570539 ) ) ( not ( = ?auto_570535 ?auto_570540 ) ) ( not ( = ?auto_570536 ?auto_570537 ) ) ( not ( = ?auto_570536 ?auto_570538 ) ) ( not ( = ?auto_570536 ?auto_570539 ) ) ( not ( = ?auto_570536 ?auto_570540 ) ) ( not ( = ?auto_570537 ?auto_570538 ) ) ( not ( = ?auto_570537 ?auto_570539 ) ) ( not ( = ?auto_570537 ?auto_570540 ) ) ( not ( = ?auto_570538 ?auto_570539 ) ) ( not ( = ?auto_570538 ?auto_570540 ) ) ( not ( = ?auto_570539 ?auto_570540 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_570539 ?auto_570540 )
      ( !STACK ?auto_570539 ?auto_570538 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_570557 - BLOCK
      ?auto_570558 - BLOCK
      ?auto_570559 - BLOCK
      ?auto_570560 - BLOCK
      ?auto_570561 - BLOCK
      ?auto_570562 - BLOCK
      ?auto_570563 - BLOCK
      ?auto_570564 - BLOCK
      ?auto_570565 - BLOCK
      ?auto_570566 - BLOCK
      ?auto_570567 - BLOCK
      ?auto_570568 - BLOCK
      ?auto_570569 - BLOCK
      ?auto_570570 - BLOCK
      ?auto_570571 - BLOCK
      ?auto_570572 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_570571 ) ( ON-TABLE ?auto_570572 ) ( CLEAR ?auto_570572 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_570557 ) ( ON ?auto_570558 ?auto_570557 ) ( ON ?auto_570559 ?auto_570558 ) ( ON ?auto_570560 ?auto_570559 ) ( ON ?auto_570561 ?auto_570560 ) ( ON ?auto_570562 ?auto_570561 ) ( ON ?auto_570563 ?auto_570562 ) ( ON ?auto_570564 ?auto_570563 ) ( ON ?auto_570565 ?auto_570564 ) ( ON ?auto_570566 ?auto_570565 ) ( ON ?auto_570567 ?auto_570566 ) ( ON ?auto_570568 ?auto_570567 ) ( ON ?auto_570569 ?auto_570568 ) ( ON ?auto_570570 ?auto_570569 ) ( ON ?auto_570571 ?auto_570570 ) ( not ( = ?auto_570557 ?auto_570558 ) ) ( not ( = ?auto_570557 ?auto_570559 ) ) ( not ( = ?auto_570557 ?auto_570560 ) ) ( not ( = ?auto_570557 ?auto_570561 ) ) ( not ( = ?auto_570557 ?auto_570562 ) ) ( not ( = ?auto_570557 ?auto_570563 ) ) ( not ( = ?auto_570557 ?auto_570564 ) ) ( not ( = ?auto_570557 ?auto_570565 ) ) ( not ( = ?auto_570557 ?auto_570566 ) ) ( not ( = ?auto_570557 ?auto_570567 ) ) ( not ( = ?auto_570557 ?auto_570568 ) ) ( not ( = ?auto_570557 ?auto_570569 ) ) ( not ( = ?auto_570557 ?auto_570570 ) ) ( not ( = ?auto_570557 ?auto_570571 ) ) ( not ( = ?auto_570557 ?auto_570572 ) ) ( not ( = ?auto_570558 ?auto_570559 ) ) ( not ( = ?auto_570558 ?auto_570560 ) ) ( not ( = ?auto_570558 ?auto_570561 ) ) ( not ( = ?auto_570558 ?auto_570562 ) ) ( not ( = ?auto_570558 ?auto_570563 ) ) ( not ( = ?auto_570558 ?auto_570564 ) ) ( not ( = ?auto_570558 ?auto_570565 ) ) ( not ( = ?auto_570558 ?auto_570566 ) ) ( not ( = ?auto_570558 ?auto_570567 ) ) ( not ( = ?auto_570558 ?auto_570568 ) ) ( not ( = ?auto_570558 ?auto_570569 ) ) ( not ( = ?auto_570558 ?auto_570570 ) ) ( not ( = ?auto_570558 ?auto_570571 ) ) ( not ( = ?auto_570558 ?auto_570572 ) ) ( not ( = ?auto_570559 ?auto_570560 ) ) ( not ( = ?auto_570559 ?auto_570561 ) ) ( not ( = ?auto_570559 ?auto_570562 ) ) ( not ( = ?auto_570559 ?auto_570563 ) ) ( not ( = ?auto_570559 ?auto_570564 ) ) ( not ( = ?auto_570559 ?auto_570565 ) ) ( not ( = ?auto_570559 ?auto_570566 ) ) ( not ( = ?auto_570559 ?auto_570567 ) ) ( not ( = ?auto_570559 ?auto_570568 ) ) ( not ( = ?auto_570559 ?auto_570569 ) ) ( not ( = ?auto_570559 ?auto_570570 ) ) ( not ( = ?auto_570559 ?auto_570571 ) ) ( not ( = ?auto_570559 ?auto_570572 ) ) ( not ( = ?auto_570560 ?auto_570561 ) ) ( not ( = ?auto_570560 ?auto_570562 ) ) ( not ( = ?auto_570560 ?auto_570563 ) ) ( not ( = ?auto_570560 ?auto_570564 ) ) ( not ( = ?auto_570560 ?auto_570565 ) ) ( not ( = ?auto_570560 ?auto_570566 ) ) ( not ( = ?auto_570560 ?auto_570567 ) ) ( not ( = ?auto_570560 ?auto_570568 ) ) ( not ( = ?auto_570560 ?auto_570569 ) ) ( not ( = ?auto_570560 ?auto_570570 ) ) ( not ( = ?auto_570560 ?auto_570571 ) ) ( not ( = ?auto_570560 ?auto_570572 ) ) ( not ( = ?auto_570561 ?auto_570562 ) ) ( not ( = ?auto_570561 ?auto_570563 ) ) ( not ( = ?auto_570561 ?auto_570564 ) ) ( not ( = ?auto_570561 ?auto_570565 ) ) ( not ( = ?auto_570561 ?auto_570566 ) ) ( not ( = ?auto_570561 ?auto_570567 ) ) ( not ( = ?auto_570561 ?auto_570568 ) ) ( not ( = ?auto_570561 ?auto_570569 ) ) ( not ( = ?auto_570561 ?auto_570570 ) ) ( not ( = ?auto_570561 ?auto_570571 ) ) ( not ( = ?auto_570561 ?auto_570572 ) ) ( not ( = ?auto_570562 ?auto_570563 ) ) ( not ( = ?auto_570562 ?auto_570564 ) ) ( not ( = ?auto_570562 ?auto_570565 ) ) ( not ( = ?auto_570562 ?auto_570566 ) ) ( not ( = ?auto_570562 ?auto_570567 ) ) ( not ( = ?auto_570562 ?auto_570568 ) ) ( not ( = ?auto_570562 ?auto_570569 ) ) ( not ( = ?auto_570562 ?auto_570570 ) ) ( not ( = ?auto_570562 ?auto_570571 ) ) ( not ( = ?auto_570562 ?auto_570572 ) ) ( not ( = ?auto_570563 ?auto_570564 ) ) ( not ( = ?auto_570563 ?auto_570565 ) ) ( not ( = ?auto_570563 ?auto_570566 ) ) ( not ( = ?auto_570563 ?auto_570567 ) ) ( not ( = ?auto_570563 ?auto_570568 ) ) ( not ( = ?auto_570563 ?auto_570569 ) ) ( not ( = ?auto_570563 ?auto_570570 ) ) ( not ( = ?auto_570563 ?auto_570571 ) ) ( not ( = ?auto_570563 ?auto_570572 ) ) ( not ( = ?auto_570564 ?auto_570565 ) ) ( not ( = ?auto_570564 ?auto_570566 ) ) ( not ( = ?auto_570564 ?auto_570567 ) ) ( not ( = ?auto_570564 ?auto_570568 ) ) ( not ( = ?auto_570564 ?auto_570569 ) ) ( not ( = ?auto_570564 ?auto_570570 ) ) ( not ( = ?auto_570564 ?auto_570571 ) ) ( not ( = ?auto_570564 ?auto_570572 ) ) ( not ( = ?auto_570565 ?auto_570566 ) ) ( not ( = ?auto_570565 ?auto_570567 ) ) ( not ( = ?auto_570565 ?auto_570568 ) ) ( not ( = ?auto_570565 ?auto_570569 ) ) ( not ( = ?auto_570565 ?auto_570570 ) ) ( not ( = ?auto_570565 ?auto_570571 ) ) ( not ( = ?auto_570565 ?auto_570572 ) ) ( not ( = ?auto_570566 ?auto_570567 ) ) ( not ( = ?auto_570566 ?auto_570568 ) ) ( not ( = ?auto_570566 ?auto_570569 ) ) ( not ( = ?auto_570566 ?auto_570570 ) ) ( not ( = ?auto_570566 ?auto_570571 ) ) ( not ( = ?auto_570566 ?auto_570572 ) ) ( not ( = ?auto_570567 ?auto_570568 ) ) ( not ( = ?auto_570567 ?auto_570569 ) ) ( not ( = ?auto_570567 ?auto_570570 ) ) ( not ( = ?auto_570567 ?auto_570571 ) ) ( not ( = ?auto_570567 ?auto_570572 ) ) ( not ( = ?auto_570568 ?auto_570569 ) ) ( not ( = ?auto_570568 ?auto_570570 ) ) ( not ( = ?auto_570568 ?auto_570571 ) ) ( not ( = ?auto_570568 ?auto_570572 ) ) ( not ( = ?auto_570569 ?auto_570570 ) ) ( not ( = ?auto_570569 ?auto_570571 ) ) ( not ( = ?auto_570569 ?auto_570572 ) ) ( not ( = ?auto_570570 ?auto_570571 ) ) ( not ( = ?auto_570570 ?auto_570572 ) ) ( not ( = ?auto_570571 ?auto_570572 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_570572 )
      ( !STACK ?auto_570572 ?auto_570571 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_570589 - BLOCK
      ?auto_570590 - BLOCK
      ?auto_570591 - BLOCK
      ?auto_570592 - BLOCK
      ?auto_570593 - BLOCK
      ?auto_570594 - BLOCK
      ?auto_570595 - BLOCK
      ?auto_570596 - BLOCK
      ?auto_570597 - BLOCK
      ?auto_570598 - BLOCK
      ?auto_570599 - BLOCK
      ?auto_570600 - BLOCK
      ?auto_570601 - BLOCK
      ?auto_570602 - BLOCK
      ?auto_570603 - BLOCK
      ?auto_570604 - BLOCK
    )
    :vars
    (
      ?auto_570605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_570604 ?auto_570605 ) ( ON-TABLE ?auto_570589 ) ( ON ?auto_570590 ?auto_570589 ) ( ON ?auto_570591 ?auto_570590 ) ( ON ?auto_570592 ?auto_570591 ) ( ON ?auto_570593 ?auto_570592 ) ( ON ?auto_570594 ?auto_570593 ) ( ON ?auto_570595 ?auto_570594 ) ( ON ?auto_570596 ?auto_570595 ) ( ON ?auto_570597 ?auto_570596 ) ( ON ?auto_570598 ?auto_570597 ) ( ON ?auto_570599 ?auto_570598 ) ( ON ?auto_570600 ?auto_570599 ) ( ON ?auto_570601 ?auto_570600 ) ( ON ?auto_570602 ?auto_570601 ) ( not ( = ?auto_570589 ?auto_570590 ) ) ( not ( = ?auto_570589 ?auto_570591 ) ) ( not ( = ?auto_570589 ?auto_570592 ) ) ( not ( = ?auto_570589 ?auto_570593 ) ) ( not ( = ?auto_570589 ?auto_570594 ) ) ( not ( = ?auto_570589 ?auto_570595 ) ) ( not ( = ?auto_570589 ?auto_570596 ) ) ( not ( = ?auto_570589 ?auto_570597 ) ) ( not ( = ?auto_570589 ?auto_570598 ) ) ( not ( = ?auto_570589 ?auto_570599 ) ) ( not ( = ?auto_570589 ?auto_570600 ) ) ( not ( = ?auto_570589 ?auto_570601 ) ) ( not ( = ?auto_570589 ?auto_570602 ) ) ( not ( = ?auto_570589 ?auto_570603 ) ) ( not ( = ?auto_570589 ?auto_570604 ) ) ( not ( = ?auto_570589 ?auto_570605 ) ) ( not ( = ?auto_570590 ?auto_570591 ) ) ( not ( = ?auto_570590 ?auto_570592 ) ) ( not ( = ?auto_570590 ?auto_570593 ) ) ( not ( = ?auto_570590 ?auto_570594 ) ) ( not ( = ?auto_570590 ?auto_570595 ) ) ( not ( = ?auto_570590 ?auto_570596 ) ) ( not ( = ?auto_570590 ?auto_570597 ) ) ( not ( = ?auto_570590 ?auto_570598 ) ) ( not ( = ?auto_570590 ?auto_570599 ) ) ( not ( = ?auto_570590 ?auto_570600 ) ) ( not ( = ?auto_570590 ?auto_570601 ) ) ( not ( = ?auto_570590 ?auto_570602 ) ) ( not ( = ?auto_570590 ?auto_570603 ) ) ( not ( = ?auto_570590 ?auto_570604 ) ) ( not ( = ?auto_570590 ?auto_570605 ) ) ( not ( = ?auto_570591 ?auto_570592 ) ) ( not ( = ?auto_570591 ?auto_570593 ) ) ( not ( = ?auto_570591 ?auto_570594 ) ) ( not ( = ?auto_570591 ?auto_570595 ) ) ( not ( = ?auto_570591 ?auto_570596 ) ) ( not ( = ?auto_570591 ?auto_570597 ) ) ( not ( = ?auto_570591 ?auto_570598 ) ) ( not ( = ?auto_570591 ?auto_570599 ) ) ( not ( = ?auto_570591 ?auto_570600 ) ) ( not ( = ?auto_570591 ?auto_570601 ) ) ( not ( = ?auto_570591 ?auto_570602 ) ) ( not ( = ?auto_570591 ?auto_570603 ) ) ( not ( = ?auto_570591 ?auto_570604 ) ) ( not ( = ?auto_570591 ?auto_570605 ) ) ( not ( = ?auto_570592 ?auto_570593 ) ) ( not ( = ?auto_570592 ?auto_570594 ) ) ( not ( = ?auto_570592 ?auto_570595 ) ) ( not ( = ?auto_570592 ?auto_570596 ) ) ( not ( = ?auto_570592 ?auto_570597 ) ) ( not ( = ?auto_570592 ?auto_570598 ) ) ( not ( = ?auto_570592 ?auto_570599 ) ) ( not ( = ?auto_570592 ?auto_570600 ) ) ( not ( = ?auto_570592 ?auto_570601 ) ) ( not ( = ?auto_570592 ?auto_570602 ) ) ( not ( = ?auto_570592 ?auto_570603 ) ) ( not ( = ?auto_570592 ?auto_570604 ) ) ( not ( = ?auto_570592 ?auto_570605 ) ) ( not ( = ?auto_570593 ?auto_570594 ) ) ( not ( = ?auto_570593 ?auto_570595 ) ) ( not ( = ?auto_570593 ?auto_570596 ) ) ( not ( = ?auto_570593 ?auto_570597 ) ) ( not ( = ?auto_570593 ?auto_570598 ) ) ( not ( = ?auto_570593 ?auto_570599 ) ) ( not ( = ?auto_570593 ?auto_570600 ) ) ( not ( = ?auto_570593 ?auto_570601 ) ) ( not ( = ?auto_570593 ?auto_570602 ) ) ( not ( = ?auto_570593 ?auto_570603 ) ) ( not ( = ?auto_570593 ?auto_570604 ) ) ( not ( = ?auto_570593 ?auto_570605 ) ) ( not ( = ?auto_570594 ?auto_570595 ) ) ( not ( = ?auto_570594 ?auto_570596 ) ) ( not ( = ?auto_570594 ?auto_570597 ) ) ( not ( = ?auto_570594 ?auto_570598 ) ) ( not ( = ?auto_570594 ?auto_570599 ) ) ( not ( = ?auto_570594 ?auto_570600 ) ) ( not ( = ?auto_570594 ?auto_570601 ) ) ( not ( = ?auto_570594 ?auto_570602 ) ) ( not ( = ?auto_570594 ?auto_570603 ) ) ( not ( = ?auto_570594 ?auto_570604 ) ) ( not ( = ?auto_570594 ?auto_570605 ) ) ( not ( = ?auto_570595 ?auto_570596 ) ) ( not ( = ?auto_570595 ?auto_570597 ) ) ( not ( = ?auto_570595 ?auto_570598 ) ) ( not ( = ?auto_570595 ?auto_570599 ) ) ( not ( = ?auto_570595 ?auto_570600 ) ) ( not ( = ?auto_570595 ?auto_570601 ) ) ( not ( = ?auto_570595 ?auto_570602 ) ) ( not ( = ?auto_570595 ?auto_570603 ) ) ( not ( = ?auto_570595 ?auto_570604 ) ) ( not ( = ?auto_570595 ?auto_570605 ) ) ( not ( = ?auto_570596 ?auto_570597 ) ) ( not ( = ?auto_570596 ?auto_570598 ) ) ( not ( = ?auto_570596 ?auto_570599 ) ) ( not ( = ?auto_570596 ?auto_570600 ) ) ( not ( = ?auto_570596 ?auto_570601 ) ) ( not ( = ?auto_570596 ?auto_570602 ) ) ( not ( = ?auto_570596 ?auto_570603 ) ) ( not ( = ?auto_570596 ?auto_570604 ) ) ( not ( = ?auto_570596 ?auto_570605 ) ) ( not ( = ?auto_570597 ?auto_570598 ) ) ( not ( = ?auto_570597 ?auto_570599 ) ) ( not ( = ?auto_570597 ?auto_570600 ) ) ( not ( = ?auto_570597 ?auto_570601 ) ) ( not ( = ?auto_570597 ?auto_570602 ) ) ( not ( = ?auto_570597 ?auto_570603 ) ) ( not ( = ?auto_570597 ?auto_570604 ) ) ( not ( = ?auto_570597 ?auto_570605 ) ) ( not ( = ?auto_570598 ?auto_570599 ) ) ( not ( = ?auto_570598 ?auto_570600 ) ) ( not ( = ?auto_570598 ?auto_570601 ) ) ( not ( = ?auto_570598 ?auto_570602 ) ) ( not ( = ?auto_570598 ?auto_570603 ) ) ( not ( = ?auto_570598 ?auto_570604 ) ) ( not ( = ?auto_570598 ?auto_570605 ) ) ( not ( = ?auto_570599 ?auto_570600 ) ) ( not ( = ?auto_570599 ?auto_570601 ) ) ( not ( = ?auto_570599 ?auto_570602 ) ) ( not ( = ?auto_570599 ?auto_570603 ) ) ( not ( = ?auto_570599 ?auto_570604 ) ) ( not ( = ?auto_570599 ?auto_570605 ) ) ( not ( = ?auto_570600 ?auto_570601 ) ) ( not ( = ?auto_570600 ?auto_570602 ) ) ( not ( = ?auto_570600 ?auto_570603 ) ) ( not ( = ?auto_570600 ?auto_570604 ) ) ( not ( = ?auto_570600 ?auto_570605 ) ) ( not ( = ?auto_570601 ?auto_570602 ) ) ( not ( = ?auto_570601 ?auto_570603 ) ) ( not ( = ?auto_570601 ?auto_570604 ) ) ( not ( = ?auto_570601 ?auto_570605 ) ) ( not ( = ?auto_570602 ?auto_570603 ) ) ( not ( = ?auto_570602 ?auto_570604 ) ) ( not ( = ?auto_570602 ?auto_570605 ) ) ( not ( = ?auto_570603 ?auto_570604 ) ) ( not ( = ?auto_570603 ?auto_570605 ) ) ( not ( = ?auto_570604 ?auto_570605 ) ) ( CLEAR ?auto_570602 ) ( ON ?auto_570603 ?auto_570604 ) ( CLEAR ?auto_570603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_570589 ?auto_570590 ?auto_570591 ?auto_570592 ?auto_570593 ?auto_570594 ?auto_570595 ?auto_570596 ?auto_570597 ?auto_570598 ?auto_570599 ?auto_570600 ?auto_570601 ?auto_570602 ?auto_570603 )
      ( MAKE-16PILE ?auto_570589 ?auto_570590 ?auto_570591 ?auto_570592 ?auto_570593 ?auto_570594 ?auto_570595 ?auto_570596 ?auto_570597 ?auto_570598 ?auto_570599 ?auto_570600 ?auto_570601 ?auto_570602 ?auto_570603 ?auto_570604 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_570622 - BLOCK
      ?auto_570623 - BLOCK
      ?auto_570624 - BLOCK
      ?auto_570625 - BLOCK
      ?auto_570626 - BLOCK
      ?auto_570627 - BLOCK
      ?auto_570628 - BLOCK
      ?auto_570629 - BLOCK
      ?auto_570630 - BLOCK
      ?auto_570631 - BLOCK
      ?auto_570632 - BLOCK
      ?auto_570633 - BLOCK
      ?auto_570634 - BLOCK
      ?auto_570635 - BLOCK
      ?auto_570636 - BLOCK
      ?auto_570637 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_570637 ) ( ON-TABLE ?auto_570622 ) ( ON ?auto_570623 ?auto_570622 ) ( ON ?auto_570624 ?auto_570623 ) ( ON ?auto_570625 ?auto_570624 ) ( ON ?auto_570626 ?auto_570625 ) ( ON ?auto_570627 ?auto_570626 ) ( ON ?auto_570628 ?auto_570627 ) ( ON ?auto_570629 ?auto_570628 ) ( ON ?auto_570630 ?auto_570629 ) ( ON ?auto_570631 ?auto_570630 ) ( ON ?auto_570632 ?auto_570631 ) ( ON ?auto_570633 ?auto_570632 ) ( ON ?auto_570634 ?auto_570633 ) ( ON ?auto_570635 ?auto_570634 ) ( not ( = ?auto_570622 ?auto_570623 ) ) ( not ( = ?auto_570622 ?auto_570624 ) ) ( not ( = ?auto_570622 ?auto_570625 ) ) ( not ( = ?auto_570622 ?auto_570626 ) ) ( not ( = ?auto_570622 ?auto_570627 ) ) ( not ( = ?auto_570622 ?auto_570628 ) ) ( not ( = ?auto_570622 ?auto_570629 ) ) ( not ( = ?auto_570622 ?auto_570630 ) ) ( not ( = ?auto_570622 ?auto_570631 ) ) ( not ( = ?auto_570622 ?auto_570632 ) ) ( not ( = ?auto_570622 ?auto_570633 ) ) ( not ( = ?auto_570622 ?auto_570634 ) ) ( not ( = ?auto_570622 ?auto_570635 ) ) ( not ( = ?auto_570622 ?auto_570636 ) ) ( not ( = ?auto_570622 ?auto_570637 ) ) ( not ( = ?auto_570623 ?auto_570624 ) ) ( not ( = ?auto_570623 ?auto_570625 ) ) ( not ( = ?auto_570623 ?auto_570626 ) ) ( not ( = ?auto_570623 ?auto_570627 ) ) ( not ( = ?auto_570623 ?auto_570628 ) ) ( not ( = ?auto_570623 ?auto_570629 ) ) ( not ( = ?auto_570623 ?auto_570630 ) ) ( not ( = ?auto_570623 ?auto_570631 ) ) ( not ( = ?auto_570623 ?auto_570632 ) ) ( not ( = ?auto_570623 ?auto_570633 ) ) ( not ( = ?auto_570623 ?auto_570634 ) ) ( not ( = ?auto_570623 ?auto_570635 ) ) ( not ( = ?auto_570623 ?auto_570636 ) ) ( not ( = ?auto_570623 ?auto_570637 ) ) ( not ( = ?auto_570624 ?auto_570625 ) ) ( not ( = ?auto_570624 ?auto_570626 ) ) ( not ( = ?auto_570624 ?auto_570627 ) ) ( not ( = ?auto_570624 ?auto_570628 ) ) ( not ( = ?auto_570624 ?auto_570629 ) ) ( not ( = ?auto_570624 ?auto_570630 ) ) ( not ( = ?auto_570624 ?auto_570631 ) ) ( not ( = ?auto_570624 ?auto_570632 ) ) ( not ( = ?auto_570624 ?auto_570633 ) ) ( not ( = ?auto_570624 ?auto_570634 ) ) ( not ( = ?auto_570624 ?auto_570635 ) ) ( not ( = ?auto_570624 ?auto_570636 ) ) ( not ( = ?auto_570624 ?auto_570637 ) ) ( not ( = ?auto_570625 ?auto_570626 ) ) ( not ( = ?auto_570625 ?auto_570627 ) ) ( not ( = ?auto_570625 ?auto_570628 ) ) ( not ( = ?auto_570625 ?auto_570629 ) ) ( not ( = ?auto_570625 ?auto_570630 ) ) ( not ( = ?auto_570625 ?auto_570631 ) ) ( not ( = ?auto_570625 ?auto_570632 ) ) ( not ( = ?auto_570625 ?auto_570633 ) ) ( not ( = ?auto_570625 ?auto_570634 ) ) ( not ( = ?auto_570625 ?auto_570635 ) ) ( not ( = ?auto_570625 ?auto_570636 ) ) ( not ( = ?auto_570625 ?auto_570637 ) ) ( not ( = ?auto_570626 ?auto_570627 ) ) ( not ( = ?auto_570626 ?auto_570628 ) ) ( not ( = ?auto_570626 ?auto_570629 ) ) ( not ( = ?auto_570626 ?auto_570630 ) ) ( not ( = ?auto_570626 ?auto_570631 ) ) ( not ( = ?auto_570626 ?auto_570632 ) ) ( not ( = ?auto_570626 ?auto_570633 ) ) ( not ( = ?auto_570626 ?auto_570634 ) ) ( not ( = ?auto_570626 ?auto_570635 ) ) ( not ( = ?auto_570626 ?auto_570636 ) ) ( not ( = ?auto_570626 ?auto_570637 ) ) ( not ( = ?auto_570627 ?auto_570628 ) ) ( not ( = ?auto_570627 ?auto_570629 ) ) ( not ( = ?auto_570627 ?auto_570630 ) ) ( not ( = ?auto_570627 ?auto_570631 ) ) ( not ( = ?auto_570627 ?auto_570632 ) ) ( not ( = ?auto_570627 ?auto_570633 ) ) ( not ( = ?auto_570627 ?auto_570634 ) ) ( not ( = ?auto_570627 ?auto_570635 ) ) ( not ( = ?auto_570627 ?auto_570636 ) ) ( not ( = ?auto_570627 ?auto_570637 ) ) ( not ( = ?auto_570628 ?auto_570629 ) ) ( not ( = ?auto_570628 ?auto_570630 ) ) ( not ( = ?auto_570628 ?auto_570631 ) ) ( not ( = ?auto_570628 ?auto_570632 ) ) ( not ( = ?auto_570628 ?auto_570633 ) ) ( not ( = ?auto_570628 ?auto_570634 ) ) ( not ( = ?auto_570628 ?auto_570635 ) ) ( not ( = ?auto_570628 ?auto_570636 ) ) ( not ( = ?auto_570628 ?auto_570637 ) ) ( not ( = ?auto_570629 ?auto_570630 ) ) ( not ( = ?auto_570629 ?auto_570631 ) ) ( not ( = ?auto_570629 ?auto_570632 ) ) ( not ( = ?auto_570629 ?auto_570633 ) ) ( not ( = ?auto_570629 ?auto_570634 ) ) ( not ( = ?auto_570629 ?auto_570635 ) ) ( not ( = ?auto_570629 ?auto_570636 ) ) ( not ( = ?auto_570629 ?auto_570637 ) ) ( not ( = ?auto_570630 ?auto_570631 ) ) ( not ( = ?auto_570630 ?auto_570632 ) ) ( not ( = ?auto_570630 ?auto_570633 ) ) ( not ( = ?auto_570630 ?auto_570634 ) ) ( not ( = ?auto_570630 ?auto_570635 ) ) ( not ( = ?auto_570630 ?auto_570636 ) ) ( not ( = ?auto_570630 ?auto_570637 ) ) ( not ( = ?auto_570631 ?auto_570632 ) ) ( not ( = ?auto_570631 ?auto_570633 ) ) ( not ( = ?auto_570631 ?auto_570634 ) ) ( not ( = ?auto_570631 ?auto_570635 ) ) ( not ( = ?auto_570631 ?auto_570636 ) ) ( not ( = ?auto_570631 ?auto_570637 ) ) ( not ( = ?auto_570632 ?auto_570633 ) ) ( not ( = ?auto_570632 ?auto_570634 ) ) ( not ( = ?auto_570632 ?auto_570635 ) ) ( not ( = ?auto_570632 ?auto_570636 ) ) ( not ( = ?auto_570632 ?auto_570637 ) ) ( not ( = ?auto_570633 ?auto_570634 ) ) ( not ( = ?auto_570633 ?auto_570635 ) ) ( not ( = ?auto_570633 ?auto_570636 ) ) ( not ( = ?auto_570633 ?auto_570637 ) ) ( not ( = ?auto_570634 ?auto_570635 ) ) ( not ( = ?auto_570634 ?auto_570636 ) ) ( not ( = ?auto_570634 ?auto_570637 ) ) ( not ( = ?auto_570635 ?auto_570636 ) ) ( not ( = ?auto_570635 ?auto_570637 ) ) ( not ( = ?auto_570636 ?auto_570637 ) ) ( CLEAR ?auto_570635 ) ( ON ?auto_570636 ?auto_570637 ) ( CLEAR ?auto_570636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_570622 ?auto_570623 ?auto_570624 ?auto_570625 ?auto_570626 ?auto_570627 ?auto_570628 ?auto_570629 ?auto_570630 ?auto_570631 ?auto_570632 ?auto_570633 ?auto_570634 ?auto_570635 ?auto_570636 )
      ( MAKE-16PILE ?auto_570622 ?auto_570623 ?auto_570624 ?auto_570625 ?auto_570626 ?auto_570627 ?auto_570628 ?auto_570629 ?auto_570630 ?auto_570631 ?auto_570632 ?auto_570633 ?auto_570634 ?auto_570635 ?auto_570636 ?auto_570637 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_570654 - BLOCK
      ?auto_570655 - BLOCK
      ?auto_570656 - BLOCK
      ?auto_570657 - BLOCK
      ?auto_570658 - BLOCK
      ?auto_570659 - BLOCK
      ?auto_570660 - BLOCK
      ?auto_570661 - BLOCK
      ?auto_570662 - BLOCK
      ?auto_570663 - BLOCK
      ?auto_570664 - BLOCK
      ?auto_570665 - BLOCK
      ?auto_570666 - BLOCK
      ?auto_570667 - BLOCK
      ?auto_570668 - BLOCK
      ?auto_570669 - BLOCK
    )
    :vars
    (
      ?auto_570670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_570669 ?auto_570670 ) ( ON-TABLE ?auto_570654 ) ( ON ?auto_570655 ?auto_570654 ) ( ON ?auto_570656 ?auto_570655 ) ( ON ?auto_570657 ?auto_570656 ) ( ON ?auto_570658 ?auto_570657 ) ( ON ?auto_570659 ?auto_570658 ) ( ON ?auto_570660 ?auto_570659 ) ( ON ?auto_570661 ?auto_570660 ) ( ON ?auto_570662 ?auto_570661 ) ( ON ?auto_570663 ?auto_570662 ) ( ON ?auto_570664 ?auto_570663 ) ( ON ?auto_570665 ?auto_570664 ) ( ON ?auto_570666 ?auto_570665 ) ( not ( = ?auto_570654 ?auto_570655 ) ) ( not ( = ?auto_570654 ?auto_570656 ) ) ( not ( = ?auto_570654 ?auto_570657 ) ) ( not ( = ?auto_570654 ?auto_570658 ) ) ( not ( = ?auto_570654 ?auto_570659 ) ) ( not ( = ?auto_570654 ?auto_570660 ) ) ( not ( = ?auto_570654 ?auto_570661 ) ) ( not ( = ?auto_570654 ?auto_570662 ) ) ( not ( = ?auto_570654 ?auto_570663 ) ) ( not ( = ?auto_570654 ?auto_570664 ) ) ( not ( = ?auto_570654 ?auto_570665 ) ) ( not ( = ?auto_570654 ?auto_570666 ) ) ( not ( = ?auto_570654 ?auto_570667 ) ) ( not ( = ?auto_570654 ?auto_570668 ) ) ( not ( = ?auto_570654 ?auto_570669 ) ) ( not ( = ?auto_570654 ?auto_570670 ) ) ( not ( = ?auto_570655 ?auto_570656 ) ) ( not ( = ?auto_570655 ?auto_570657 ) ) ( not ( = ?auto_570655 ?auto_570658 ) ) ( not ( = ?auto_570655 ?auto_570659 ) ) ( not ( = ?auto_570655 ?auto_570660 ) ) ( not ( = ?auto_570655 ?auto_570661 ) ) ( not ( = ?auto_570655 ?auto_570662 ) ) ( not ( = ?auto_570655 ?auto_570663 ) ) ( not ( = ?auto_570655 ?auto_570664 ) ) ( not ( = ?auto_570655 ?auto_570665 ) ) ( not ( = ?auto_570655 ?auto_570666 ) ) ( not ( = ?auto_570655 ?auto_570667 ) ) ( not ( = ?auto_570655 ?auto_570668 ) ) ( not ( = ?auto_570655 ?auto_570669 ) ) ( not ( = ?auto_570655 ?auto_570670 ) ) ( not ( = ?auto_570656 ?auto_570657 ) ) ( not ( = ?auto_570656 ?auto_570658 ) ) ( not ( = ?auto_570656 ?auto_570659 ) ) ( not ( = ?auto_570656 ?auto_570660 ) ) ( not ( = ?auto_570656 ?auto_570661 ) ) ( not ( = ?auto_570656 ?auto_570662 ) ) ( not ( = ?auto_570656 ?auto_570663 ) ) ( not ( = ?auto_570656 ?auto_570664 ) ) ( not ( = ?auto_570656 ?auto_570665 ) ) ( not ( = ?auto_570656 ?auto_570666 ) ) ( not ( = ?auto_570656 ?auto_570667 ) ) ( not ( = ?auto_570656 ?auto_570668 ) ) ( not ( = ?auto_570656 ?auto_570669 ) ) ( not ( = ?auto_570656 ?auto_570670 ) ) ( not ( = ?auto_570657 ?auto_570658 ) ) ( not ( = ?auto_570657 ?auto_570659 ) ) ( not ( = ?auto_570657 ?auto_570660 ) ) ( not ( = ?auto_570657 ?auto_570661 ) ) ( not ( = ?auto_570657 ?auto_570662 ) ) ( not ( = ?auto_570657 ?auto_570663 ) ) ( not ( = ?auto_570657 ?auto_570664 ) ) ( not ( = ?auto_570657 ?auto_570665 ) ) ( not ( = ?auto_570657 ?auto_570666 ) ) ( not ( = ?auto_570657 ?auto_570667 ) ) ( not ( = ?auto_570657 ?auto_570668 ) ) ( not ( = ?auto_570657 ?auto_570669 ) ) ( not ( = ?auto_570657 ?auto_570670 ) ) ( not ( = ?auto_570658 ?auto_570659 ) ) ( not ( = ?auto_570658 ?auto_570660 ) ) ( not ( = ?auto_570658 ?auto_570661 ) ) ( not ( = ?auto_570658 ?auto_570662 ) ) ( not ( = ?auto_570658 ?auto_570663 ) ) ( not ( = ?auto_570658 ?auto_570664 ) ) ( not ( = ?auto_570658 ?auto_570665 ) ) ( not ( = ?auto_570658 ?auto_570666 ) ) ( not ( = ?auto_570658 ?auto_570667 ) ) ( not ( = ?auto_570658 ?auto_570668 ) ) ( not ( = ?auto_570658 ?auto_570669 ) ) ( not ( = ?auto_570658 ?auto_570670 ) ) ( not ( = ?auto_570659 ?auto_570660 ) ) ( not ( = ?auto_570659 ?auto_570661 ) ) ( not ( = ?auto_570659 ?auto_570662 ) ) ( not ( = ?auto_570659 ?auto_570663 ) ) ( not ( = ?auto_570659 ?auto_570664 ) ) ( not ( = ?auto_570659 ?auto_570665 ) ) ( not ( = ?auto_570659 ?auto_570666 ) ) ( not ( = ?auto_570659 ?auto_570667 ) ) ( not ( = ?auto_570659 ?auto_570668 ) ) ( not ( = ?auto_570659 ?auto_570669 ) ) ( not ( = ?auto_570659 ?auto_570670 ) ) ( not ( = ?auto_570660 ?auto_570661 ) ) ( not ( = ?auto_570660 ?auto_570662 ) ) ( not ( = ?auto_570660 ?auto_570663 ) ) ( not ( = ?auto_570660 ?auto_570664 ) ) ( not ( = ?auto_570660 ?auto_570665 ) ) ( not ( = ?auto_570660 ?auto_570666 ) ) ( not ( = ?auto_570660 ?auto_570667 ) ) ( not ( = ?auto_570660 ?auto_570668 ) ) ( not ( = ?auto_570660 ?auto_570669 ) ) ( not ( = ?auto_570660 ?auto_570670 ) ) ( not ( = ?auto_570661 ?auto_570662 ) ) ( not ( = ?auto_570661 ?auto_570663 ) ) ( not ( = ?auto_570661 ?auto_570664 ) ) ( not ( = ?auto_570661 ?auto_570665 ) ) ( not ( = ?auto_570661 ?auto_570666 ) ) ( not ( = ?auto_570661 ?auto_570667 ) ) ( not ( = ?auto_570661 ?auto_570668 ) ) ( not ( = ?auto_570661 ?auto_570669 ) ) ( not ( = ?auto_570661 ?auto_570670 ) ) ( not ( = ?auto_570662 ?auto_570663 ) ) ( not ( = ?auto_570662 ?auto_570664 ) ) ( not ( = ?auto_570662 ?auto_570665 ) ) ( not ( = ?auto_570662 ?auto_570666 ) ) ( not ( = ?auto_570662 ?auto_570667 ) ) ( not ( = ?auto_570662 ?auto_570668 ) ) ( not ( = ?auto_570662 ?auto_570669 ) ) ( not ( = ?auto_570662 ?auto_570670 ) ) ( not ( = ?auto_570663 ?auto_570664 ) ) ( not ( = ?auto_570663 ?auto_570665 ) ) ( not ( = ?auto_570663 ?auto_570666 ) ) ( not ( = ?auto_570663 ?auto_570667 ) ) ( not ( = ?auto_570663 ?auto_570668 ) ) ( not ( = ?auto_570663 ?auto_570669 ) ) ( not ( = ?auto_570663 ?auto_570670 ) ) ( not ( = ?auto_570664 ?auto_570665 ) ) ( not ( = ?auto_570664 ?auto_570666 ) ) ( not ( = ?auto_570664 ?auto_570667 ) ) ( not ( = ?auto_570664 ?auto_570668 ) ) ( not ( = ?auto_570664 ?auto_570669 ) ) ( not ( = ?auto_570664 ?auto_570670 ) ) ( not ( = ?auto_570665 ?auto_570666 ) ) ( not ( = ?auto_570665 ?auto_570667 ) ) ( not ( = ?auto_570665 ?auto_570668 ) ) ( not ( = ?auto_570665 ?auto_570669 ) ) ( not ( = ?auto_570665 ?auto_570670 ) ) ( not ( = ?auto_570666 ?auto_570667 ) ) ( not ( = ?auto_570666 ?auto_570668 ) ) ( not ( = ?auto_570666 ?auto_570669 ) ) ( not ( = ?auto_570666 ?auto_570670 ) ) ( not ( = ?auto_570667 ?auto_570668 ) ) ( not ( = ?auto_570667 ?auto_570669 ) ) ( not ( = ?auto_570667 ?auto_570670 ) ) ( not ( = ?auto_570668 ?auto_570669 ) ) ( not ( = ?auto_570668 ?auto_570670 ) ) ( not ( = ?auto_570669 ?auto_570670 ) ) ( ON ?auto_570668 ?auto_570669 ) ( CLEAR ?auto_570666 ) ( ON ?auto_570667 ?auto_570668 ) ( CLEAR ?auto_570667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_570654 ?auto_570655 ?auto_570656 ?auto_570657 ?auto_570658 ?auto_570659 ?auto_570660 ?auto_570661 ?auto_570662 ?auto_570663 ?auto_570664 ?auto_570665 ?auto_570666 ?auto_570667 )
      ( MAKE-16PILE ?auto_570654 ?auto_570655 ?auto_570656 ?auto_570657 ?auto_570658 ?auto_570659 ?auto_570660 ?auto_570661 ?auto_570662 ?auto_570663 ?auto_570664 ?auto_570665 ?auto_570666 ?auto_570667 ?auto_570668 ?auto_570669 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_570687 - BLOCK
      ?auto_570688 - BLOCK
      ?auto_570689 - BLOCK
      ?auto_570690 - BLOCK
      ?auto_570691 - BLOCK
      ?auto_570692 - BLOCK
      ?auto_570693 - BLOCK
      ?auto_570694 - BLOCK
      ?auto_570695 - BLOCK
      ?auto_570696 - BLOCK
      ?auto_570697 - BLOCK
      ?auto_570698 - BLOCK
      ?auto_570699 - BLOCK
      ?auto_570700 - BLOCK
      ?auto_570701 - BLOCK
      ?auto_570702 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_570702 ) ( ON-TABLE ?auto_570687 ) ( ON ?auto_570688 ?auto_570687 ) ( ON ?auto_570689 ?auto_570688 ) ( ON ?auto_570690 ?auto_570689 ) ( ON ?auto_570691 ?auto_570690 ) ( ON ?auto_570692 ?auto_570691 ) ( ON ?auto_570693 ?auto_570692 ) ( ON ?auto_570694 ?auto_570693 ) ( ON ?auto_570695 ?auto_570694 ) ( ON ?auto_570696 ?auto_570695 ) ( ON ?auto_570697 ?auto_570696 ) ( ON ?auto_570698 ?auto_570697 ) ( ON ?auto_570699 ?auto_570698 ) ( not ( = ?auto_570687 ?auto_570688 ) ) ( not ( = ?auto_570687 ?auto_570689 ) ) ( not ( = ?auto_570687 ?auto_570690 ) ) ( not ( = ?auto_570687 ?auto_570691 ) ) ( not ( = ?auto_570687 ?auto_570692 ) ) ( not ( = ?auto_570687 ?auto_570693 ) ) ( not ( = ?auto_570687 ?auto_570694 ) ) ( not ( = ?auto_570687 ?auto_570695 ) ) ( not ( = ?auto_570687 ?auto_570696 ) ) ( not ( = ?auto_570687 ?auto_570697 ) ) ( not ( = ?auto_570687 ?auto_570698 ) ) ( not ( = ?auto_570687 ?auto_570699 ) ) ( not ( = ?auto_570687 ?auto_570700 ) ) ( not ( = ?auto_570687 ?auto_570701 ) ) ( not ( = ?auto_570687 ?auto_570702 ) ) ( not ( = ?auto_570688 ?auto_570689 ) ) ( not ( = ?auto_570688 ?auto_570690 ) ) ( not ( = ?auto_570688 ?auto_570691 ) ) ( not ( = ?auto_570688 ?auto_570692 ) ) ( not ( = ?auto_570688 ?auto_570693 ) ) ( not ( = ?auto_570688 ?auto_570694 ) ) ( not ( = ?auto_570688 ?auto_570695 ) ) ( not ( = ?auto_570688 ?auto_570696 ) ) ( not ( = ?auto_570688 ?auto_570697 ) ) ( not ( = ?auto_570688 ?auto_570698 ) ) ( not ( = ?auto_570688 ?auto_570699 ) ) ( not ( = ?auto_570688 ?auto_570700 ) ) ( not ( = ?auto_570688 ?auto_570701 ) ) ( not ( = ?auto_570688 ?auto_570702 ) ) ( not ( = ?auto_570689 ?auto_570690 ) ) ( not ( = ?auto_570689 ?auto_570691 ) ) ( not ( = ?auto_570689 ?auto_570692 ) ) ( not ( = ?auto_570689 ?auto_570693 ) ) ( not ( = ?auto_570689 ?auto_570694 ) ) ( not ( = ?auto_570689 ?auto_570695 ) ) ( not ( = ?auto_570689 ?auto_570696 ) ) ( not ( = ?auto_570689 ?auto_570697 ) ) ( not ( = ?auto_570689 ?auto_570698 ) ) ( not ( = ?auto_570689 ?auto_570699 ) ) ( not ( = ?auto_570689 ?auto_570700 ) ) ( not ( = ?auto_570689 ?auto_570701 ) ) ( not ( = ?auto_570689 ?auto_570702 ) ) ( not ( = ?auto_570690 ?auto_570691 ) ) ( not ( = ?auto_570690 ?auto_570692 ) ) ( not ( = ?auto_570690 ?auto_570693 ) ) ( not ( = ?auto_570690 ?auto_570694 ) ) ( not ( = ?auto_570690 ?auto_570695 ) ) ( not ( = ?auto_570690 ?auto_570696 ) ) ( not ( = ?auto_570690 ?auto_570697 ) ) ( not ( = ?auto_570690 ?auto_570698 ) ) ( not ( = ?auto_570690 ?auto_570699 ) ) ( not ( = ?auto_570690 ?auto_570700 ) ) ( not ( = ?auto_570690 ?auto_570701 ) ) ( not ( = ?auto_570690 ?auto_570702 ) ) ( not ( = ?auto_570691 ?auto_570692 ) ) ( not ( = ?auto_570691 ?auto_570693 ) ) ( not ( = ?auto_570691 ?auto_570694 ) ) ( not ( = ?auto_570691 ?auto_570695 ) ) ( not ( = ?auto_570691 ?auto_570696 ) ) ( not ( = ?auto_570691 ?auto_570697 ) ) ( not ( = ?auto_570691 ?auto_570698 ) ) ( not ( = ?auto_570691 ?auto_570699 ) ) ( not ( = ?auto_570691 ?auto_570700 ) ) ( not ( = ?auto_570691 ?auto_570701 ) ) ( not ( = ?auto_570691 ?auto_570702 ) ) ( not ( = ?auto_570692 ?auto_570693 ) ) ( not ( = ?auto_570692 ?auto_570694 ) ) ( not ( = ?auto_570692 ?auto_570695 ) ) ( not ( = ?auto_570692 ?auto_570696 ) ) ( not ( = ?auto_570692 ?auto_570697 ) ) ( not ( = ?auto_570692 ?auto_570698 ) ) ( not ( = ?auto_570692 ?auto_570699 ) ) ( not ( = ?auto_570692 ?auto_570700 ) ) ( not ( = ?auto_570692 ?auto_570701 ) ) ( not ( = ?auto_570692 ?auto_570702 ) ) ( not ( = ?auto_570693 ?auto_570694 ) ) ( not ( = ?auto_570693 ?auto_570695 ) ) ( not ( = ?auto_570693 ?auto_570696 ) ) ( not ( = ?auto_570693 ?auto_570697 ) ) ( not ( = ?auto_570693 ?auto_570698 ) ) ( not ( = ?auto_570693 ?auto_570699 ) ) ( not ( = ?auto_570693 ?auto_570700 ) ) ( not ( = ?auto_570693 ?auto_570701 ) ) ( not ( = ?auto_570693 ?auto_570702 ) ) ( not ( = ?auto_570694 ?auto_570695 ) ) ( not ( = ?auto_570694 ?auto_570696 ) ) ( not ( = ?auto_570694 ?auto_570697 ) ) ( not ( = ?auto_570694 ?auto_570698 ) ) ( not ( = ?auto_570694 ?auto_570699 ) ) ( not ( = ?auto_570694 ?auto_570700 ) ) ( not ( = ?auto_570694 ?auto_570701 ) ) ( not ( = ?auto_570694 ?auto_570702 ) ) ( not ( = ?auto_570695 ?auto_570696 ) ) ( not ( = ?auto_570695 ?auto_570697 ) ) ( not ( = ?auto_570695 ?auto_570698 ) ) ( not ( = ?auto_570695 ?auto_570699 ) ) ( not ( = ?auto_570695 ?auto_570700 ) ) ( not ( = ?auto_570695 ?auto_570701 ) ) ( not ( = ?auto_570695 ?auto_570702 ) ) ( not ( = ?auto_570696 ?auto_570697 ) ) ( not ( = ?auto_570696 ?auto_570698 ) ) ( not ( = ?auto_570696 ?auto_570699 ) ) ( not ( = ?auto_570696 ?auto_570700 ) ) ( not ( = ?auto_570696 ?auto_570701 ) ) ( not ( = ?auto_570696 ?auto_570702 ) ) ( not ( = ?auto_570697 ?auto_570698 ) ) ( not ( = ?auto_570697 ?auto_570699 ) ) ( not ( = ?auto_570697 ?auto_570700 ) ) ( not ( = ?auto_570697 ?auto_570701 ) ) ( not ( = ?auto_570697 ?auto_570702 ) ) ( not ( = ?auto_570698 ?auto_570699 ) ) ( not ( = ?auto_570698 ?auto_570700 ) ) ( not ( = ?auto_570698 ?auto_570701 ) ) ( not ( = ?auto_570698 ?auto_570702 ) ) ( not ( = ?auto_570699 ?auto_570700 ) ) ( not ( = ?auto_570699 ?auto_570701 ) ) ( not ( = ?auto_570699 ?auto_570702 ) ) ( not ( = ?auto_570700 ?auto_570701 ) ) ( not ( = ?auto_570700 ?auto_570702 ) ) ( not ( = ?auto_570701 ?auto_570702 ) ) ( ON ?auto_570701 ?auto_570702 ) ( CLEAR ?auto_570699 ) ( ON ?auto_570700 ?auto_570701 ) ( CLEAR ?auto_570700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_570687 ?auto_570688 ?auto_570689 ?auto_570690 ?auto_570691 ?auto_570692 ?auto_570693 ?auto_570694 ?auto_570695 ?auto_570696 ?auto_570697 ?auto_570698 ?auto_570699 ?auto_570700 )
      ( MAKE-16PILE ?auto_570687 ?auto_570688 ?auto_570689 ?auto_570690 ?auto_570691 ?auto_570692 ?auto_570693 ?auto_570694 ?auto_570695 ?auto_570696 ?auto_570697 ?auto_570698 ?auto_570699 ?auto_570700 ?auto_570701 ?auto_570702 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_570719 - BLOCK
      ?auto_570720 - BLOCK
      ?auto_570721 - BLOCK
      ?auto_570722 - BLOCK
      ?auto_570723 - BLOCK
      ?auto_570724 - BLOCK
      ?auto_570725 - BLOCK
      ?auto_570726 - BLOCK
      ?auto_570727 - BLOCK
      ?auto_570728 - BLOCK
      ?auto_570729 - BLOCK
      ?auto_570730 - BLOCK
      ?auto_570731 - BLOCK
      ?auto_570732 - BLOCK
      ?auto_570733 - BLOCK
      ?auto_570734 - BLOCK
    )
    :vars
    (
      ?auto_570735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_570734 ?auto_570735 ) ( ON-TABLE ?auto_570719 ) ( ON ?auto_570720 ?auto_570719 ) ( ON ?auto_570721 ?auto_570720 ) ( ON ?auto_570722 ?auto_570721 ) ( ON ?auto_570723 ?auto_570722 ) ( ON ?auto_570724 ?auto_570723 ) ( ON ?auto_570725 ?auto_570724 ) ( ON ?auto_570726 ?auto_570725 ) ( ON ?auto_570727 ?auto_570726 ) ( ON ?auto_570728 ?auto_570727 ) ( ON ?auto_570729 ?auto_570728 ) ( ON ?auto_570730 ?auto_570729 ) ( not ( = ?auto_570719 ?auto_570720 ) ) ( not ( = ?auto_570719 ?auto_570721 ) ) ( not ( = ?auto_570719 ?auto_570722 ) ) ( not ( = ?auto_570719 ?auto_570723 ) ) ( not ( = ?auto_570719 ?auto_570724 ) ) ( not ( = ?auto_570719 ?auto_570725 ) ) ( not ( = ?auto_570719 ?auto_570726 ) ) ( not ( = ?auto_570719 ?auto_570727 ) ) ( not ( = ?auto_570719 ?auto_570728 ) ) ( not ( = ?auto_570719 ?auto_570729 ) ) ( not ( = ?auto_570719 ?auto_570730 ) ) ( not ( = ?auto_570719 ?auto_570731 ) ) ( not ( = ?auto_570719 ?auto_570732 ) ) ( not ( = ?auto_570719 ?auto_570733 ) ) ( not ( = ?auto_570719 ?auto_570734 ) ) ( not ( = ?auto_570719 ?auto_570735 ) ) ( not ( = ?auto_570720 ?auto_570721 ) ) ( not ( = ?auto_570720 ?auto_570722 ) ) ( not ( = ?auto_570720 ?auto_570723 ) ) ( not ( = ?auto_570720 ?auto_570724 ) ) ( not ( = ?auto_570720 ?auto_570725 ) ) ( not ( = ?auto_570720 ?auto_570726 ) ) ( not ( = ?auto_570720 ?auto_570727 ) ) ( not ( = ?auto_570720 ?auto_570728 ) ) ( not ( = ?auto_570720 ?auto_570729 ) ) ( not ( = ?auto_570720 ?auto_570730 ) ) ( not ( = ?auto_570720 ?auto_570731 ) ) ( not ( = ?auto_570720 ?auto_570732 ) ) ( not ( = ?auto_570720 ?auto_570733 ) ) ( not ( = ?auto_570720 ?auto_570734 ) ) ( not ( = ?auto_570720 ?auto_570735 ) ) ( not ( = ?auto_570721 ?auto_570722 ) ) ( not ( = ?auto_570721 ?auto_570723 ) ) ( not ( = ?auto_570721 ?auto_570724 ) ) ( not ( = ?auto_570721 ?auto_570725 ) ) ( not ( = ?auto_570721 ?auto_570726 ) ) ( not ( = ?auto_570721 ?auto_570727 ) ) ( not ( = ?auto_570721 ?auto_570728 ) ) ( not ( = ?auto_570721 ?auto_570729 ) ) ( not ( = ?auto_570721 ?auto_570730 ) ) ( not ( = ?auto_570721 ?auto_570731 ) ) ( not ( = ?auto_570721 ?auto_570732 ) ) ( not ( = ?auto_570721 ?auto_570733 ) ) ( not ( = ?auto_570721 ?auto_570734 ) ) ( not ( = ?auto_570721 ?auto_570735 ) ) ( not ( = ?auto_570722 ?auto_570723 ) ) ( not ( = ?auto_570722 ?auto_570724 ) ) ( not ( = ?auto_570722 ?auto_570725 ) ) ( not ( = ?auto_570722 ?auto_570726 ) ) ( not ( = ?auto_570722 ?auto_570727 ) ) ( not ( = ?auto_570722 ?auto_570728 ) ) ( not ( = ?auto_570722 ?auto_570729 ) ) ( not ( = ?auto_570722 ?auto_570730 ) ) ( not ( = ?auto_570722 ?auto_570731 ) ) ( not ( = ?auto_570722 ?auto_570732 ) ) ( not ( = ?auto_570722 ?auto_570733 ) ) ( not ( = ?auto_570722 ?auto_570734 ) ) ( not ( = ?auto_570722 ?auto_570735 ) ) ( not ( = ?auto_570723 ?auto_570724 ) ) ( not ( = ?auto_570723 ?auto_570725 ) ) ( not ( = ?auto_570723 ?auto_570726 ) ) ( not ( = ?auto_570723 ?auto_570727 ) ) ( not ( = ?auto_570723 ?auto_570728 ) ) ( not ( = ?auto_570723 ?auto_570729 ) ) ( not ( = ?auto_570723 ?auto_570730 ) ) ( not ( = ?auto_570723 ?auto_570731 ) ) ( not ( = ?auto_570723 ?auto_570732 ) ) ( not ( = ?auto_570723 ?auto_570733 ) ) ( not ( = ?auto_570723 ?auto_570734 ) ) ( not ( = ?auto_570723 ?auto_570735 ) ) ( not ( = ?auto_570724 ?auto_570725 ) ) ( not ( = ?auto_570724 ?auto_570726 ) ) ( not ( = ?auto_570724 ?auto_570727 ) ) ( not ( = ?auto_570724 ?auto_570728 ) ) ( not ( = ?auto_570724 ?auto_570729 ) ) ( not ( = ?auto_570724 ?auto_570730 ) ) ( not ( = ?auto_570724 ?auto_570731 ) ) ( not ( = ?auto_570724 ?auto_570732 ) ) ( not ( = ?auto_570724 ?auto_570733 ) ) ( not ( = ?auto_570724 ?auto_570734 ) ) ( not ( = ?auto_570724 ?auto_570735 ) ) ( not ( = ?auto_570725 ?auto_570726 ) ) ( not ( = ?auto_570725 ?auto_570727 ) ) ( not ( = ?auto_570725 ?auto_570728 ) ) ( not ( = ?auto_570725 ?auto_570729 ) ) ( not ( = ?auto_570725 ?auto_570730 ) ) ( not ( = ?auto_570725 ?auto_570731 ) ) ( not ( = ?auto_570725 ?auto_570732 ) ) ( not ( = ?auto_570725 ?auto_570733 ) ) ( not ( = ?auto_570725 ?auto_570734 ) ) ( not ( = ?auto_570725 ?auto_570735 ) ) ( not ( = ?auto_570726 ?auto_570727 ) ) ( not ( = ?auto_570726 ?auto_570728 ) ) ( not ( = ?auto_570726 ?auto_570729 ) ) ( not ( = ?auto_570726 ?auto_570730 ) ) ( not ( = ?auto_570726 ?auto_570731 ) ) ( not ( = ?auto_570726 ?auto_570732 ) ) ( not ( = ?auto_570726 ?auto_570733 ) ) ( not ( = ?auto_570726 ?auto_570734 ) ) ( not ( = ?auto_570726 ?auto_570735 ) ) ( not ( = ?auto_570727 ?auto_570728 ) ) ( not ( = ?auto_570727 ?auto_570729 ) ) ( not ( = ?auto_570727 ?auto_570730 ) ) ( not ( = ?auto_570727 ?auto_570731 ) ) ( not ( = ?auto_570727 ?auto_570732 ) ) ( not ( = ?auto_570727 ?auto_570733 ) ) ( not ( = ?auto_570727 ?auto_570734 ) ) ( not ( = ?auto_570727 ?auto_570735 ) ) ( not ( = ?auto_570728 ?auto_570729 ) ) ( not ( = ?auto_570728 ?auto_570730 ) ) ( not ( = ?auto_570728 ?auto_570731 ) ) ( not ( = ?auto_570728 ?auto_570732 ) ) ( not ( = ?auto_570728 ?auto_570733 ) ) ( not ( = ?auto_570728 ?auto_570734 ) ) ( not ( = ?auto_570728 ?auto_570735 ) ) ( not ( = ?auto_570729 ?auto_570730 ) ) ( not ( = ?auto_570729 ?auto_570731 ) ) ( not ( = ?auto_570729 ?auto_570732 ) ) ( not ( = ?auto_570729 ?auto_570733 ) ) ( not ( = ?auto_570729 ?auto_570734 ) ) ( not ( = ?auto_570729 ?auto_570735 ) ) ( not ( = ?auto_570730 ?auto_570731 ) ) ( not ( = ?auto_570730 ?auto_570732 ) ) ( not ( = ?auto_570730 ?auto_570733 ) ) ( not ( = ?auto_570730 ?auto_570734 ) ) ( not ( = ?auto_570730 ?auto_570735 ) ) ( not ( = ?auto_570731 ?auto_570732 ) ) ( not ( = ?auto_570731 ?auto_570733 ) ) ( not ( = ?auto_570731 ?auto_570734 ) ) ( not ( = ?auto_570731 ?auto_570735 ) ) ( not ( = ?auto_570732 ?auto_570733 ) ) ( not ( = ?auto_570732 ?auto_570734 ) ) ( not ( = ?auto_570732 ?auto_570735 ) ) ( not ( = ?auto_570733 ?auto_570734 ) ) ( not ( = ?auto_570733 ?auto_570735 ) ) ( not ( = ?auto_570734 ?auto_570735 ) ) ( ON ?auto_570733 ?auto_570734 ) ( ON ?auto_570732 ?auto_570733 ) ( CLEAR ?auto_570730 ) ( ON ?auto_570731 ?auto_570732 ) ( CLEAR ?auto_570731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_570719 ?auto_570720 ?auto_570721 ?auto_570722 ?auto_570723 ?auto_570724 ?auto_570725 ?auto_570726 ?auto_570727 ?auto_570728 ?auto_570729 ?auto_570730 ?auto_570731 )
      ( MAKE-16PILE ?auto_570719 ?auto_570720 ?auto_570721 ?auto_570722 ?auto_570723 ?auto_570724 ?auto_570725 ?auto_570726 ?auto_570727 ?auto_570728 ?auto_570729 ?auto_570730 ?auto_570731 ?auto_570732 ?auto_570733 ?auto_570734 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_570752 - BLOCK
      ?auto_570753 - BLOCK
      ?auto_570754 - BLOCK
      ?auto_570755 - BLOCK
      ?auto_570756 - BLOCK
      ?auto_570757 - BLOCK
      ?auto_570758 - BLOCK
      ?auto_570759 - BLOCK
      ?auto_570760 - BLOCK
      ?auto_570761 - BLOCK
      ?auto_570762 - BLOCK
      ?auto_570763 - BLOCK
      ?auto_570764 - BLOCK
      ?auto_570765 - BLOCK
      ?auto_570766 - BLOCK
      ?auto_570767 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_570767 ) ( ON-TABLE ?auto_570752 ) ( ON ?auto_570753 ?auto_570752 ) ( ON ?auto_570754 ?auto_570753 ) ( ON ?auto_570755 ?auto_570754 ) ( ON ?auto_570756 ?auto_570755 ) ( ON ?auto_570757 ?auto_570756 ) ( ON ?auto_570758 ?auto_570757 ) ( ON ?auto_570759 ?auto_570758 ) ( ON ?auto_570760 ?auto_570759 ) ( ON ?auto_570761 ?auto_570760 ) ( ON ?auto_570762 ?auto_570761 ) ( ON ?auto_570763 ?auto_570762 ) ( not ( = ?auto_570752 ?auto_570753 ) ) ( not ( = ?auto_570752 ?auto_570754 ) ) ( not ( = ?auto_570752 ?auto_570755 ) ) ( not ( = ?auto_570752 ?auto_570756 ) ) ( not ( = ?auto_570752 ?auto_570757 ) ) ( not ( = ?auto_570752 ?auto_570758 ) ) ( not ( = ?auto_570752 ?auto_570759 ) ) ( not ( = ?auto_570752 ?auto_570760 ) ) ( not ( = ?auto_570752 ?auto_570761 ) ) ( not ( = ?auto_570752 ?auto_570762 ) ) ( not ( = ?auto_570752 ?auto_570763 ) ) ( not ( = ?auto_570752 ?auto_570764 ) ) ( not ( = ?auto_570752 ?auto_570765 ) ) ( not ( = ?auto_570752 ?auto_570766 ) ) ( not ( = ?auto_570752 ?auto_570767 ) ) ( not ( = ?auto_570753 ?auto_570754 ) ) ( not ( = ?auto_570753 ?auto_570755 ) ) ( not ( = ?auto_570753 ?auto_570756 ) ) ( not ( = ?auto_570753 ?auto_570757 ) ) ( not ( = ?auto_570753 ?auto_570758 ) ) ( not ( = ?auto_570753 ?auto_570759 ) ) ( not ( = ?auto_570753 ?auto_570760 ) ) ( not ( = ?auto_570753 ?auto_570761 ) ) ( not ( = ?auto_570753 ?auto_570762 ) ) ( not ( = ?auto_570753 ?auto_570763 ) ) ( not ( = ?auto_570753 ?auto_570764 ) ) ( not ( = ?auto_570753 ?auto_570765 ) ) ( not ( = ?auto_570753 ?auto_570766 ) ) ( not ( = ?auto_570753 ?auto_570767 ) ) ( not ( = ?auto_570754 ?auto_570755 ) ) ( not ( = ?auto_570754 ?auto_570756 ) ) ( not ( = ?auto_570754 ?auto_570757 ) ) ( not ( = ?auto_570754 ?auto_570758 ) ) ( not ( = ?auto_570754 ?auto_570759 ) ) ( not ( = ?auto_570754 ?auto_570760 ) ) ( not ( = ?auto_570754 ?auto_570761 ) ) ( not ( = ?auto_570754 ?auto_570762 ) ) ( not ( = ?auto_570754 ?auto_570763 ) ) ( not ( = ?auto_570754 ?auto_570764 ) ) ( not ( = ?auto_570754 ?auto_570765 ) ) ( not ( = ?auto_570754 ?auto_570766 ) ) ( not ( = ?auto_570754 ?auto_570767 ) ) ( not ( = ?auto_570755 ?auto_570756 ) ) ( not ( = ?auto_570755 ?auto_570757 ) ) ( not ( = ?auto_570755 ?auto_570758 ) ) ( not ( = ?auto_570755 ?auto_570759 ) ) ( not ( = ?auto_570755 ?auto_570760 ) ) ( not ( = ?auto_570755 ?auto_570761 ) ) ( not ( = ?auto_570755 ?auto_570762 ) ) ( not ( = ?auto_570755 ?auto_570763 ) ) ( not ( = ?auto_570755 ?auto_570764 ) ) ( not ( = ?auto_570755 ?auto_570765 ) ) ( not ( = ?auto_570755 ?auto_570766 ) ) ( not ( = ?auto_570755 ?auto_570767 ) ) ( not ( = ?auto_570756 ?auto_570757 ) ) ( not ( = ?auto_570756 ?auto_570758 ) ) ( not ( = ?auto_570756 ?auto_570759 ) ) ( not ( = ?auto_570756 ?auto_570760 ) ) ( not ( = ?auto_570756 ?auto_570761 ) ) ( not ( = ?auto_570756 ?auto_570762 ) ) ( not ( = ?auto_570756 ?auto_570763 ) ) ( not ( = ?auto_570756 ?auto_570764 ) ) ( not ( = ?auto_570756 ?auto_570765 ) ) ( not ( = ?auto_570756 ?auto_570766 ) ) ( not ( = ?auto_570756 ?auto_570767 ) ) ( not ( = ?auto_570757 ?auto_570758 ) ) ( not ( = ?auto_570757 ?auto_570759 ) ) ( not ( = ?auto_570757 ?auto_570760 ) ) ( not ( = ?auto_570757 ?auto_570761 ) ) ( not ( = ?auto_570757 ?auto_570762 ) ) ( not ( = ?auto_570757 ?auto_570763 ) ) ( not ( = ?auto_570757 ?auto_570764 ) ) ( not ( = ?auto_570757 ?auto_570765 ) ) ( not ( = ?auto_570757 ?auto_570766 ) ) ( not ( = ?auto_570757 ?auto_570767 ) ) ( not ( = ?auto_570758 ?auto_570759 ) ) ( not ( = ?auto_570758 ?auto_570760 ) ) ( not ( = ?auto_570758 ?auto_570761 ) ) ( not ( = ?auto_570758 ?auto_570762 ) ) ( not ( = ?auto_570758 ?auto_570763 ) ) ( not ( = ?auto_570758 ?auto_570764 ) ) ( not ( = ?auto_570758 ?auto_570765 ) ) ( not ( = ?auto_570758 ?auto_570766 ) ) ( not ( = ?auto_570758 ?auto_570767 ) ) ( not ( = ?auto_570759 ?auto_570760 ) ) ( not ( = ?auto_570759 ?auto_570761 ) ) ( not ( = ?auto_570759 ?auto_570762 ) ) ( not ( = ?auto_570759 ?auto_570763 ) ) ( not ( = ?auto_570759 ?auto_570764 ) ) ( not ( = ?auto_570759 ?auto_570765 ) ) ( not ( = ?auto_570759 ?auto_570766 ) ) ( not ( = ?auto_570759 ?auto_570767 ) ) ( not ( = ?auto_570760 ?auto_570761 ) ) ( not ( = ?auto_570760 ?auto_570762 ) ) ( not ( = ?auto_570760 ?auto_570763 ) ) ( not ( = ?auto_570760 ?auto_570764 ) ) ( not ( = ?auto_570760 ?auto_570765 ) ) ( not ( = ?auto_570760 ?auto_570766 ) ) ( not ( = ?auto_570760 ?auto_570767 ) ) ( not ( = ?auto_570761 ?auto_570762 ) ) ( not ( = ?auto_570761 ?auto_570763 ) ) ( not ( = ?auto_570761 ?auto_570764 ) ) ( not ( = ?auto_570761 ?auto_570765 ) ) ( not ( = ?auto_570761 ?auto_570766 ) ) ( not ( = ?auto_570761 ?auto_570767 ) ) ( not ( = ?auto_570762 ?auto_570763 ) ) ( not ( = ?auto_570762 ?auto_570764 ) ) ( not ( = ?auto_570762 ?auto_570765 ) ) ( not ( = ?auto_570762 ?auto_570766 ) ) ( not ( = ?auto_570762 ?auto_570767 ) ) ( not ( = ?auto_570763 ?auto_570764 ) ) ( not ( = ?auto_570763 ?auto_570765 ) ) ( not ( = ?auto_570763 ?auto_570766 ) ) ( not ( = ?auto_570763 ?auto_570767 ) ) ( not ( = ?auto_570764 ?auto_570765 ) ) ( not ( = ?auto_570764 ?auto_570766 ) ) ( not ( = ?auto_570764 ?auto_570767 ) ) ( not ( = ?auto_570765 ?auto_570766 ) ) ( not ( = ?auto_570765 ?auto_570767 ) ) ( not ( = ?auto_570766 ?auto_570767 ) ) ( ON ?auto_570766 ?auto_570767 ) ( ON ?auto_570765 ?auto_570766 ) ( CLEAR ?auto_570763 ) ( ON ?auto_570764 ?auto_570765 ) ( CLEAR ?auto_570764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_570752 ?auto_570753 ?auto_570754 ?auto_570755 ?auto_570756 ?auto_570757 ?auto_570758 ?auto_570759 ?auto_570760 ?auto_570761 ?auto_570762 ?auto_570763 ?auto_570764 )
      ( MAKE-16PILE ?auto_570752 ?auto_570753 ?auto_570754 ?auto_570755 ?auto_570756 ?auto_570757 ?auto_570758 ?auto_570759 ?auto_570760 ?auto_570761 ?auto_570762 ?auto_570763 ?auto_570764 ?auto_570765 ?auto_570766 ?auto_570767 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_570784 - BLOCK
      ?auto_570785 - BLOCK
      ?auto_570786 - BLOCK
      ?auto_570787 - BLOCK
      ?auto_570788 - BLOCK
      ?auto_570789 - BLOCK
      ?auto_570790 - BLOCK
      ?auto_570791 - BLOCK
      ?auto_570792 - BLOCK
      ?auto_570793 - BLOCK
      ?auto_570794 - BLOCK
      ?auto_570795 - BLOCK
      ?auto_570796 - BLOCK
      ?auto_570797 - BLOCK
      ?auto_570798 - BLOCK
      ?auto_570799 - BLOCK
    )
    :vars
    (
      ?auto_570800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_570799 ?auto_570800 ) ( ON-TABLE ?auto_570784 ) ( ON ?auto_570785 ?auto_570784 ) ( ON ?auto_570786 ?auto_570785 ) ( ON ?auto_570787 ?auto_570786 ) ( ON ?auto_570788 ?auto_570787 ) ( ON ?auto_570789 ?auto_570788 ) ( ON ?auto_570790 ?auto_570789 ) ( ON ?auto_570791 ?auto_570790 ) ( ON ?auto_570792 ?auto_570791 ) ( ON ?auto_570793 ?auto_570792 ) ( ON ?auto_570794 ?auto_570793 ) ( not ( = ?auto_570784 ?auto_570785 ) ) ( not ( = ?auto_570784 ?auto_570786 ) ) ( not ( = ?auto_570784 ?auto_570787 ) ) ( not ( = ?auto_570784 ?auto_570788 ) ) ( not ( = ?auto_570784 ?auto_570789 ) ) ( not ( = ?auto_570784 ?auto_570790 ) ) ( not ( = ?auto_570784 ?auto_570791 ) ) ( not ( = ?auto_570784 ?auto_570792 ) ) ( not ( = ?auto_570784 ?auto_570793 ) ) ( not ( = ?auto_570784 ?auto_570794 ) ) ( not ( = ?auto_570784 ?auto_570795 ) ) ( not ( = ?auto_570784 ?auto_570796 ) ) ( not ( = ?auto_570784 ?auto_570797 ) ) ( not ( = ?auto_570784 ?auto_570798 ) ) ( not ( = ?auto_570784 ?auto_570799 ) ) ( not ( = ?auto_570784 ?auto_570800 ) ) ( not ( = ?auto_570785 ?auto_570786 ) ) ( not ( = ?auto_570785 ?auto_570787 ) ) ( not ( = ?auto_570785 ?auto_570788 ) ) ( not ( = ?auto_570785 ?auto_570789 ) ) ( not ( = ?auto_570785 ?auto_570790 ) ) ( not ( = ?auto_570785 ?auto_570791 ) ) ( not ( = ?auto_570785 ?auto_570792 ) ) ( not ( = ?auto_570785 ?auto_570793 ) ) ( not ( = ?auto_570785 ?auto_570794 ) ) ( not ( = ?auto_570785 ?auto_570795 ) ) ( not ( = ?auto_570785 ?auto_570796 ) ) ( not ( = ?auto_570785 ?auto_570797 ) ) ( not ( = ?auto_570785 ?auto_570798 ) ) ( not ( = ?auto_570785 ?auto_570799 ) ) ( not ( = ?auto_570785 ?auto_570800 ) ) ( not ( = ?auto_570786 ?auto_570787 ) ) ( not ( = ?auto_570786 ?auto_570788 ) ) ( not ( = ?auto_570786 ?auto_570789 ) ) ( not ( = ?auto_570786 ?auto_570790 ) ) ( not ( = ?auto_570786 ?auto_570791 ) ) ( not ( = ?auto_570786 ?auto_570792 ) ) ( not ( = ?auto_570786 ?auto_570793 ) ) ( not ( = ?auto_570786 ?auto_570794 ) ) ( not ( = ?auto_570786 ?auto_570795 ) ) ( not ( = ?auto_570786 ?auto_570796 ) ) ( not ( = ?auto_570786 ?auto_570797 ) ) ( not ( = ?auto_570786 ?auto_570798 ) ) ( not ( = ?auto_570786 ?auto_570799 ) ) ( not ( = ?auto_570786 ?auto_570800 ) ) ( not ( = ?auto_570787 ?auto_570788 ) ) ( not ( = ?auto_570787 ?auto_570789 ) ) ( not ( = ?auto_570787 ?auto_570790 ) ) ( not ( = ?auto_570787 ?auto_570791 ) ) ( not ( = ?auto_570787 ?auto_570792 ) ) ( not ( = ?auto_570787 ?auto_570793 ) ) ( not ( = ?auto_570787 ?auto_570794 ) ) ( not ( = ?auto_570787 ?auto_570795 ) ) ( not ( = ?auto_570787 ?auto_570796 ) ) ( not ( = ?auto_570787 ?auto_570797 ) ) ( not ( = ?auto_570787 ?auto_570798 ) ) ( not ( = ?auto_570787 ?auto_570799 ) ) ( not ( = ?auto_570787 ?auto_570800 ) ) ( not ( = ?auto_570788 ?auto_570789 ) ) ( not ( = ?auto_570788 ?auto_570790 ) ) ( not ( = ?auto_570788 ?auto_570791 ) ) ( not ( = ?auto_570788 ?auto_570792 ) ) ( not ( = ?auto_570788 ?auto_570793 ) ) ( not ( = ?auto_570788 ?auto_570794 ) ) ( not ( = ?auto_570788 ?auto_570795 ) ) ( not ( = ?auto_570788 ?auto_570796 ) ) ( not ( = ?auto_570788 ?auto_570797 ) ) ( not ( = ?auto_570788 ?auto_570798 ) ) ( not ( = ?auto_570788 ?auto_570799 ) ) ( not ( = ?auto_570788 ?auto_570800 ) ) ( not ( = ?auto_570789 ?auto_570790 ) ) ( not ( = ?auto_570789 ?auto_570791 ) ) ( not ( = ?auto_570789 ?auto_570792 ) ) ( not ( = ?auto_570789 ?auto_570793 ) ) ( not ( = ?auto_570789 ?auto_570794 ) ) ( not ( = ?auto_570789 ?auto_570795 ) ) ( not ( = ?auto_570789 ?auto_570796 ) ) ( not ( = ?auto_570789 ?auto_570797 ) ) ( not ( = ?auto_570789 ?auto_570798 ) ) ( not ( = ?auto_570789 ?auto_570799 ) ) ( not ( = ?auto_570789 ?auto_570800 ) ) ( not ( = ?auto_570790 ?auto_570791 ) ) ( not ( = ?auto_570790 ?auto_570792 ) ) ( not ( = ?auto_570790 ?auto_570793 ) ) ( not ( = ?auto_570790 ?auto_570794 ) ) ( not ( = ?auto_570790 ?auto_570795 ) ) ( not ( = ?auto_570790 ?auto_570796 ) ) ( not ( = ?auto_570790 ?auto_570797 ) ) ( not ( = ?auto_570790 ?auto_570798 ) ) ( not ( = ?auto_570790 ?auto_570799 ) ) ( not ( = ?auto_570790 ?auto_570800 ) ) ( not ( = ?auto_570791 ?auto_570792 ) ) ( not ( = ?auto_570791 ?auto_570793 ) ) ( not ( = ?auto_570791 ?auto_570794 ) ) ( not ( = ?auto_570791 ?auto_570795 ) ) ( not ( = ?auto_570791 ?auto_570796 ) ) ( not ( = ?auto_570791 ?auto_570797 ) ) ( not ( = ?auto_570791 ?auto_570798 ) ) ( not ( = ?auto_570791 ?auto_570799 ) ) ( not ( = ?auto_570791 ?auto_570800 ) ) ( not ( = ?auto_570792 ?auto_570793 ) ) ( not ( = ?auto_570792 ?auto_570794 ) ) ( not ( = ?auto_570792 ?auto_570795 ) ) ( not ( = ?auto_570792 ?auto_570796 ) ) ( not ( = ?auto_570792 ?auto_570797 ) ) ( not ( = ?auto_570792 ?auto_570798 ) ) ( not ( = ?auto_570792 ?auto_570799 ) ) ( not ( = ?auto_570792 ?auto_570800 ) ) ( not ( = ?auto_570793 ?auto_570794 ) ) ( not ( = ?auto_570793 ?auto_570795 ) ) ( not ( = ?auto_570793 ?auto_570796 ) ) ( not ( = ?auto_570793 ?auto_570797 ) ) ( not ( = ?auto_570793 ?auto_570798 ) ) ( not ( = ?auto_570793 ?auto_570799 ) ) ( not ( = ?auto_570793 ?auto_570800 ) ) ( not ( = ?auto_570794 ?auto_570795 ) ) ( not ( = ?auto_570794 ?auto_570796 ) ) ( not ( = ?auto_570794 ?auto_570797 ) ) ( not ( = ?auto_570794 ?auto_570798 ) ) ( not ( = ?auto_570794 ?auto_570799 ) ) ( not ( = ?auto_570794 ?auto_570800 ) ) ( not ( = ?auto_570795 ?auto_570796 ) ) ( not ( = ?auto_570795 ?auto_570797 ) ) ( not ( = ?auto_570795 ?auto_570798 ) ) ( not ( = ?auto_570795 ?auto_570799 ) ) ( not ( = ?auto_570795 ?auto_570800 ) ) ( not ( = ?auto_570796 ?auto_570797 ) ) ( not ( = ?auto_570796 ?auto_570798 ) ) ( not ( = ?auto_570796 ?auto_570799 ) ) ( not ( = ?auto_570796 ?auto_570800 ) ) ( not ( = ?auto_570797 ?auto_570798 ) ) ( not ( = ?auto_570797 ?auto_570799 ) ) ( not ( = ?auto_570797 ?auto_570800 ) ) ( not ( = ?auto_570798 ?auto_570799 ) ) ( not ( = ?auto_570798 ?auto_570800 ) ) ( not ( = ?auto_570799 ?auto_570800 ) ) ( ON ?auto_570798 ?auto_570799 ) ( ON ?auto_570797 ?auto_570798 ) ( ON ?auto_570796 ?auto_570797 ) ( CLEAR ?auto_570794 ) ( ON ?auto_570795 ?auto_570796 ) ( CLEAR ?auto_570795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_570784 ?auto_570785 ?auto_570786 ?auto_570787 ?auto_570788 ?auto_570789 ?auto_570790 ?auto_570791 ?auto_570792 ?auto_570793 ?auto_570794 ?auto_570795 )
      ( MAKE-16PILE ?auto_570784 ?auto_570785 ?auto_570786 ?auto_570787 ?auto_570788 ?auto_570789 ?auto_570790 ?auto_570791 ?auto_570792 ?auto_570793 ?auto_570794 ?auto_570795 ?auto_570796 ?auto_570797 ?auto_570798 ?auto_570799 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_570817 - BLOCK
      ?auto_570818 - BLOCK
      ?auto_570819 - BLOCK
      ?auto_570820 - BLOCK
      ?auto_570821 - BLOCK
      ?auto_570822 - BLOCK
      ?auto_570823 - BLOCK
      ?auto_570824 - BLOCK
      ?auto_570825 - BLOCK
      ?auto_570826 - BLOCK
      ?auto_570827 - BLOCK
      ?auto_570828 - BLOCK
      ?auto_570829 - BLOCK
      ?auto_570830 - BLOCK
      ?auto_570831 - BLOCK
      ?auto_570832 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_570832 ) ( ON-TABLE ?auto_570817 ) ( ON ?auto_570818 ?auto_570817 ) ( ON ?auto_570819 ?auto_570818 ) ( ON ?auto_570820 ?auto_570819 ) ( ON ?auto_570821 ?auto_570820 ) ( ON ?auto_570822 ?auto_570821 ) ( ON ?auto_570823 ?auto_570822 ) ( ON ?auto_570824 ?auto_570823 ) ( ON ?auto_570825 ?auto_570824 ) ( ON ?auto_570826 ?auto_570825 ) ( ON ?auto_570827 ?auto_570826 ) ( not ( = ?auto_570817 ?auto_570818 ) ) ( not ( = ?auto_570817 ?auto_570819 ) ) ( not ( = ?auto_570817 ?auto_570820 ) ) ( not ( = ?auto_570817 ?auto_570821 ) ) ( not ( = ?auto_570817 ?auto_570822 ) ) ( not ( = ?auto_570817 ?auto_570823 ) ) ( not ( = ?auto_570817 ?auto_570824 ) ) ( not ( = ?auto_570817 ?auto_570825 ) ) ( not ( = ?auto_570817 ?auto_570826 ) ) ( not ( = ?auto_570817 ?auto_570827 ) ) ( not ( = ?auto_570817 ?auto_570828 ) ) ( not ( = ?auto_570817 ?auto_570829 ) ) ( not ( = ?auto_570817 ?auto_570830 ) ) ( not ( = ?auto_570817 ?auto_570831 ) ) ( not ( = ?auto_570817 ?auto_570832 ) ) ( not ( = ?auto_570818 ?auto_570819 ) ) ( not ( = ?auto_570818 ?auto_570820 ) ) ( not ( = ?auto_570818 ?auto_570821 ) ) ( not ( = ?auto_570818 ?auto_570822 ) ) ( not ( = ?auto_570818 ?auto_570823 ) ) ( not ( = ?auto_570818 ?auto_570824 ) ) ( not ( = ?auto_570818 ?auto_570825 ) ) ( not ( = ?auto_570818 ?auto_570826 ) ) ( not ( = ?auto_570818 ?auto_570827 ) ) ( not ( = ?auto_570818 ?auto_570828 ) ) ( not ( = ?auto_570818 ?auto_570829 ) ) ( not ( = ?auto_570818 ?auto_570830 ) ) ( not ( = ?auto_570818 ?auto_570831 ) ) ( not ( = ?auto_570818 ?auto_570832 ) ) ( not ( = ?auto_570819 ?auto_570820 ) ) ( not ( = ?auto_570819 ?auto_570821 ) ) ( not ( = ?auto_570819 ?auto_570822 ) ) ( not ( = ?auto_570819 ?auto_570823 ) ) ( not ( = ?auto_570819 ?auto_570824 ) ) ( not ( = ?auto_570819 ?auto_570825 ) ) ( not ( = ?auto_570819 ?auto_570826 ) ) ( not ( = ?auto_570819 ?auto_570827 ) ) ( not ( = ?auto_570819 ?auto_570828 ) ) ( not ( = ?auto_570819 ?auto_570829 ) ) ( not ( = ?auto_570819 ?auto_570830 ) ) ( not ( = ?auto_570819 ?auto_570831 ) ) ( not ( = ?auto_570819 ?auto_570832 ) ) ( not ( = ?auto_570820 ?auto_570821 ) ) ( not ( = ?auto_570820 ?auto_570822 ) ) ( not ( = ?auto_570820 ?auto_570823 ) ) ( not ( = ?auto_570820 ?auto_570824 ) ) ( not ( = ?auto_570820 ?auto_570825 ) ) ( not ( = ?auto_570820 ?auto_570826 ) ) ( not ( = ?auto_570820 ?auto_570827 ) ) ( not ( = ?auto_570820 ?auto_570828 ) ) ( not ( = ?auto_570820 ?auto_570829 ) ) ( not ( = ?auto_570820 ?auto_570830 ) ) ( not ( = ?auto_570820 ?auto_570831 ) ) ( not ( = ?auto_570820 ?auto_570832 ) ) ( not ( = ?auto_570821 ?auto_570822 ) ) ( not ( = ?auto_570821 ?auto_570823 ) ) ( not ( = ?auto_570821 ?auto_570824 ) ) ( not ( = ?auto_570821 ?auto_570825 ) ) ( not ( = ?auto_570821 ?auto_570826 ) ) ( not ( = ?auto_570821 ?auto_570827 ) ) ( not ( = ?auto_570821 ?auto_570828 ) ) ( not ( = ?auto_570821 ?auto_570829 ) ) ( not ( = ?auto_570821 ?auto_570830 ) ) ( not ( = ?auto_570821 ?auto_570831 ) ) ( not ( = ?auto_570821 ?auto_570832 ) ) ( not ( = ?auto_570822 ?auto_570823 ) ) ( not ( = ?auto_570822 ?auto_570824 ) ) ( not ( = ?auto_570822 ?auto_570825 ) ) ( not ( = ?auto_570822 ?auto_570826 ) ) ( not ( = ?auto_570822 ?auto_570827 ) ) ( not ( = ?auto_570822 ?auto_570828 ) ) ( not ( = ?auto_570822 ?auto_570829 ) ) ( not ( = ?auto_570822 ?auto_570830 ) ) ( not ( = ?auto_570822 ?auto_570831 ) ) ( not ( = ?auto_570822 ?auto_570832 ) ) ( not ( = ?auto_570823 ?auto_570824 ) ) ( not ( = ?auto_570823 ?auto_570825 ) ) ( not ( = ?auto_570823 ?auto_570826 ) ) ( not ( = ?auto_570823 ?auto_570827 ) ) ( not ( = ?auto_570823 ?auto_570828 ) ) ( not ( = ?auto_570823 ?auto_570829 ) ) ( not ( = ?auto_570823 ?auto_570830 ) ) ( not ( = ?auto_570823 ?auto_570831 ) ) ( not ( = ?auto_570823 ?auto_570832 ) ) ( not ( = ?auto_570824 ?auto_570825 ) ) ( not ( = ?auto_570824 ?auto_570826 ) ) ( not ( = ?auto_570824 ?auto_570827 ) ) ( not ( = ?auto_570824 ?auto_570828 ) ) ( not ( = ?auto_570824 ?auto_570829 ) ) ( not ( = ?auto_570824 ?auto_570830 ) ) ( not ( = ?auto_570824 ?auto_570831 ) ) ( not ( = ?auto_570824 ?auto_570832 ) ) ( not ( = ?auto_570825 ?auto_570826 ) ) ( not ( = ?auto_570825 ?auto_570827 ) ) ( not ( = ?auto_570825 ?auto_570828 ) ) ( not ( = ?auto_570825 ?auto_570829 ) ) ( not ( = ?auto_570825 ?auto_570830 ) ) ( not ( = ?auto_570825 ?auto_570831 ) ) ( not ( = ?auto_570825 ?auto_570832 ) ) ( not ( = ?auto_570826 ?auto_570827 ) ) ( not ( = ?auto_570826 ?auto_570828 ) ) ( not ( = ?auto_570826 ?auto_570829 ) ) ( not ( = ?auto_570826 ?auto_570830 ) ) ( not ( = ?auto_570826 ?auto_570831 ) ) ( not ( = ?auto_570826 ?auto_570832 ) ) ( not ( = ?auto_570827 ?auto_570828 ) ) ( not ( = ?auto_570827 ?auto_570829 ) ) ( not ( = ?auto_570827 ?auto_570830 ) ) ( not ( = ?auto_570827 ?auto_570831 ) ) ( not ( = ?auto_570827 ?auto_570832 ) ) ( not ( = ?auto_570828 ?auto_570829 ) ) ( not ( = ?auto_570828 ?auto_570830 ) ) ( not ( = ?auto_570828 ?auto_570831 ) ) ( not ( = ?auto_570828 ?auto_570832 ) ) ( not ( = ?auto_570829 ?auto_570830 ) ) ( not ( = ?auto_570829 ?auto_570831 ) ) ( not ( = ?auto_570829 ?auto_570832 ) ) ( not ( = ?auto_570830 ?auto_570831 ) ) ( not ( = ?auto_570830 ?auto_570832 ) ) ( not ( = ?auto_570831 ?auto_570832 ) ) ( ON ?auto_570831 ?auto_570832 ) ( ON ?auto_570830 ?auto_570831 ) ( ON ?auto_570829 ?auto_570830 ) ( CLEAR ?auto_570827 ) ( ON ?auto_570828 ?auto_570829 ) ( CLEAR ?auto_570828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_570817 ?auto_570818 ?auto_570819 ?auto_570820 ?auto_570821 ?auto_570822 ?auto_570823 ?auto_570824 ?auto_570825 ?auto_570826 ?auto_570827 ?auto_570828 )
      ( MAKE-16PILE ?auto_570817 ?auto_570818 ?auto_570819 ?auto_570820 ?auto_570821 ?auto_570822 ?auto_570823 ?auto_570824 ?auto_570825 ?auto_570826 ?auto_570827 ?auto_570828 ?auto_570829 ?auto_570830 ?auto_570831 ?auto_570832 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_570849 - BLOCK
      ?auto_570850 - BLOCK
      ?auto_570851 - BLOCK
      ?auto_570852 - BLOCK
      ?auto_570853 - BLOCK
      ?auto_570854 - BLOCK
      ?auto_570855 - BLOCK
      ?auto_570856 - BLOCK
      ?auto_570857 - BLOCK
      ?auto_570858 - BLOCK
      ?auto_570859 - BLOCK
      ?auto_570860 - BLOCK
      ?auto_570861 - BLOCK
      ?auto_570862 - BLOCK
      ?auto_570863 - BLOCK
      ?auto_570864 - BLOCK
    )
    :vars
    (
      ?auto_570865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_570864 ?auto_570865 ) ( ON-TABLE ?auto_570849 ) ( ON ?auto_570850 ?auto_570849 ) ( ON ?auto_570851 ?auto_570850 ) ( ON ?auto_570852 ?auto_570851 ) ( ON ?auto_570853 ?auto_570852 ) ( ON ?auto_570854 ?auto_570853 ) ( ON ?auto_570855 ?auto_570854 ) ( ON ?auto_570856 ?auto_570855 ) ( ON ?auto_570857 ?auto_570856 ) ( ON ?auto_570858 ?auto_570857 ) ( not ( = ?auto_570849 ?auto_570850 ) ) ( not ( = ?auto_570849 ?auto_570851 ) ) ( not ( = ?auto_570849 ?auto_570852 ) ) ( not ( = ?auto_570849 ?auto_570853 ) ) ( not ( = ?auto_570849 ?auto_570854 ) ) ( not ( = ?auto_570849 ?auto_570855 ) ) ( not ( = ?auto_570849 ?auto_570856 ) ) ( not ( = ?auto_570849 ?auto_570857 ) ) ( not ( = ?auto_570849 ?auto_570858 ) ) ( not ( = ?auto_570849 ?auto_570859 ) ) ( not ( = ?auto_570849 ?auto_570860 ) ) ( not ( = ?auto_570849 ?auto_570861 ) ) ( not ( = ?auto_570849 ?auto_570862 ) ) ( not ( = ?auto_570849 ?auto_570863 ) ) ( not ( = ?auto_570849 ?auto_570864 ) ) ( not ( = ?auto_570849 ?auto_570865 ) ) ( not ( = ?auto_570850 ?auto_570851 ) ) ( not ( = ?auto_570850 ?auto_570852 ) ) ( not ( = ?auto_570850 ?auto_570853 ) ) ( not ( = ?auto_570850 ?auto_570854 ) ) ( not ( = ?auto_570850 ?auto_570855 ) ) ( not ( = ?auto_570850 ?auto_570856 ) ) ( not ( = ?auto_570850 ?auto_570857 ) ) ( not ( = ?auto_570850 ?auto_570858 ) ) ( not ( = ?auto_570850 ?auto_570859 ) ) ( not ( = ?auto_570850 ?auto_570860 ) ) ( not ( = ?auto_570850 ?auto_570861 ) ) ( not ( = ?auto_570850 ?auto_570862 ) ) ( not ( = ?auto_570850 ?auto_570863 ) ) ( not ( = ?auto_570850 ?auto_570864 ) ) ( not ( = ?auto_570850 ?auto_570865 ) ) ( not ( = ?auto_570851 ?auto_570852 ) ) ( not ( = ?auto_570851 ?auto_570853 ) ) ( not ( = ?auto_570851 ?auto_570854 ) ) ( not ( = ?auto_570851 ?auto_570855 ) ) ( not ( = ?auto_570851 ?auto_570856 ) ) ( not ( = ?auto_570851 ?auto_570857 ) ) ( not ( = ?auto_570851 ?auto_570858 ) ) ( not ( = ?auto_570851 ?auto_570859 ) ) ( not ( = ?auto_570851 ?auto_570860 ) ) ( not ( = ?auto_570851 ?auto_570861 ) ) ( not ( = ?auto_570851 ?auto_570862 ) ) ( not ( = ?auto_570851 ?auto_570863 ) ) ( not ( = ?auto_570851 ?auto_570864 ) ) ( not ( = ?auto_570851 ?auto_570865 ) ) ( not ( = ?auto_570852 ?auto_570853 ) ) ( not ( = ?auto_570852 ?auto_570854 ) ) ( not ( = ?auto_570852 ?auto_570855 ) ) ( not ( = ?auto_570852 ?auto_570856 ) ) ( not ( = ?auto_570852 ?auto_570857 ) ) ( not ( = ?auto_570852 ?auto_570858 ) ) ( not ( = ?auto_570852 ?auto_570859 ) ) ( not ( = ?auto_570852 ?auto_570860 ) ) ( not ( = ?auto_570852 ?auto_570861 ) ) ( not ( = ?auto_570852 ?auto_570862 ) ) ( not ( = ?auto_570852 ?auto_570863 ) ) ( not ( = ?auto_570852 ?auto_570864 ) ) ( not ( = ?auto_570852 ?auto_570865 ) ) ( not ( = ?auto_570853 ?auto_570854 ) ) ( not ( = ?auto_570853 ?auto_570855 ) ) ( not ( = ?auto_570853 ?auto_570856 ) ) ( not ( = ?auto_570853 ?auto_570857 ) ) ( not ( = ?auto_570853 ?auto_570858 ) ) ( not ( = ?auto_570853 ?auto_570859 ) ) ( not ( = ?auto_570853 ?auto_570860 ) ) ( not ( = ?auto_570853 ?auto_570861 ) ) ( not ( = ?auto_570853 ?auto_570862 ) ) ( not ( = ?auto_570853 ?auto_570863 ) ) ( not ( = ?auto_570853 ?auto_570864 ) ) ( not ( = ?auto_570853 ?auto_570865 ) ) ( not ( = ?auto_570854 ?auto_570855 ) ) ( not ( = ?auto_570854 ?auto_570856 ) ) ( not ( = ?auto_570854 ?auto_570857 ) ) ( not ( = ?auto_570854 ?auto_570858 ) ) ( not ( = ?auto_570854 ?auto_570859 ) ) ( not ( = ?auto_570854 ?auto_570860 ) ) ( not ( = ?auto_570854 ?auto_570861 ) ) ( not ( = ?auto_570854 ?auto_570862 ) ) ( not ( = ?auto_570854 ?auto_570863 ) ) ( not ( = ?auto_570854 ?auto_570864 ) ) ( not ( = ?auto_570854 ?auto_570865 ) ) ( not ( = ?auto_570855 ?auto_570856 ) ) ( not ( = ?auto_570855 ?auto_570857 ) ) ( not ( = ?auto_570855 ?auto_570858 ) ) ( not ( = ?auto_570855 ?auto_570859 ) ) ( not ( = ?auto_570855 ?auto_570860 ) ) ( not ( = ?auto_570855 ?auto_570861 ) ) ( not ( = ?auto_570855 ?auto_570862 ) ) ( not ( = ?auto_570855 ?auto_570863 ) ) ( not ( = ?auto_570855 ?auto_570864 ) ) ( not ( = ?auto_570855 ?auto_570865 ) ) ( not ( = ?auto_570856 ?auto_570857 ) ) ( not ( = ?auto_570856 ?auto_570858 ) ) ( not ( = ?auto_570856 ?auto_570859 ) ) ( not ( = ?auto_570856 ?auto_570860 ) ) ( not ( = ?auto_570856 ?auto_570861 ) ) ( not ( = ?auto_570856 ?auto_570862 ) ) ( not ( = ?auto_570856 ?auto_570863 ) ) ( not ( = ?auto_570856 ?auto_570864 ) ) ( not ( = ?auto_570856 ?auto_570865 ) ) ( not ( = ?auto_570857 ?auto_570858 ) ) ( not ( = ?auto_570857 ?auto_570859 ) ) ( not ( = ?auto_570857 ?auto_570860 ) ) ( not ( = ?auto_570857 ?auto_570861 ) ) ( not ( = ?auto_570857 ?auto_570862 ) ) ( not ( = ?auto_570857 ?auto_570863 ) ) ( not ( = ?auto_570857 ?auto_570864 ) ) ( not ( = ?auto_570857 ?auto_570865 ) ) ( not ( = ?auto_570858 ?auto_570859 ) ) ( not ( = ?auto_570858 ?auto_570860 ) ) ( not ( = ?auto_570858 ?auto_570861 ) ) ( not ( = ?auto_570858 ?auto_570862 ) ) ( not ( = ?auto_570858 ?auto_570863 ) ) ( not ( = ?auto_570858 ?auto_570864 ) ) ( not ( = ?auto_570858 ?auto_570865 ) ) ( not ( = ?auto_570859 ?auto_570860 ) ) ( not ( = ?auto_570859 ?auto_570861 ) ) ( not ( = ?auto_570859 ?auto_570862 ) ) ( not ( = ?auto_570859 ?auto_570863 ) ) ( not ( = ?auto_570859 ?auto_570864 ) ) ( not ( = ?auto_570859 ?auto_570865 ) ) ( not ( = ?auto_570860 ?auto_570861 ) ) ( not ( = ?auto_570860 ?auto_570862 ) ) ( not ( = ?auto_570860 ?auto_570863 ) ) ( not ( = ?auto_570860 ?auto_570864 ) ) ( not ( = ?auto_570860 ?auto_570865 ) ) ( not ( = ?auto_570861 ?auto_570862 ) ) ( not ( = ?auto_570861 ?auto_570863 ) ) ( not ( = ?auto_570861 ?auto_570864 ) ) ( not ( = ?auto_570861 ?auto_570865 ) ) ( not ( = ?auto_570862 ?auto_570863 ) ) ( not ( = ?auto_570862 ?auto_570864 ) ) ( not ( = ?auto_570862 ?auto_570865 ) ) ( not ( = ?auto_570863 ?auto_570864 ) ) ( not ( = ?auto_570863 ?auto_570865 ) ) ( not ( = ?auto_570864 ?auto_570865 ) ) ( ON ?auto_570863 ?auto_570864 ) ( ON ?auto_570862 ?auto_570863 ) ( ON ?auto_570861 ?auto_570862 ) ( ON ?auto_570860 ?auto_570861 ) ( CLEAR ?auto_570858 ) ( ON ?auto_570859 ?auto_570860 ) ( CLEAR ?auto_570859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_570849 ?auto_570850 ?auto_570851 ?auto_570852 ?auto_570853 ?auto_570854 ?auto_570855 ?auto_570856 ?auto_570857 ?auto_570858 ?auto_570859 )
      ( MAKE-16PILE ?auto_570849 ?auto_570850 ?auto_570851 ?auto_570852 ?auto_570853 ?auto_570854 ?auto_570855 ?auto_570856 ?auto_570857 ?auto_570858 ?auto_570859 ?auto_570860 ?auto_570861 ?auto_570862 ?auto_570863 ?auto_570864 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_570882 - BLOCK
      ?auto_570883 - BLOCK
      ?auto_570884 - BLOCK
      ?auto_570885 - BLOCK
      ?auto_570886 - BLOCK
      ?auto_570887 - BLOCK
      ?auto_570888 - BLOCK
      ?auto_570889 - BLOCK
      ?auto_570890 - BLOCK
      ?auto_570891 - BLOCK
      ?auto_570892 - BLOCK
      ?auto_570893 - BLOCK
      ?auto_570894 - BLOCK
      ?auto_570895 - BLOCK
      ?auto_570896 - BLOCK
      ?auto_570897 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_570897 ) ( ON-TABLE ?auto_570882 ) ( ON ?auto_570883 ?auto_570882 ) ( ON ?auto_570884 ?auto_570883 ) ( ON ?auto_570885 ?auto_570884 ) ( ON ?auto_570886 ?auto_570885 ) ( ON ?auto_570887 ?auto_570886 ) ( ON ?auto_570888 ?auto_570887 ) ( ON ?auto_570889 ?auto_570888 ) ( ON ?auto_570890 ?auto_570889 ) ( ON ?auto_570891 ?auto_570890 ) ( not ( = ?auto_570882 ?auto_570883 ) ) ( not ( = ?auto_570882 ?auto_570884 ) ) ( not ( = ?auto_570882 ?auto_570885 ) ) ( not ( = ?auto_570882 ?auto_570886 ) ) ( not ( = ?auto_570882 ?auto_570887 ) ) ( not ( = ?auto_570882 ?auto_570888 ) ) ( not ( = ?auto_570882 ?auto_570889 ) ) ( not ( = ?auto_570882 ?auto_570890 ) ) ( not ( = ?auto_570882 ?auto_570891 ) ) ( not ( = ?auto_570882 ?auto_570892 ) ) ( not ( = ?auto_570882 ?auto_570893 ) ) ( not ( = ?auto_570882 ?auto_570894 ) ) ( not ( = ?auto_570882 ?auto_570895 ) ) ( not ( = ?auto_570882 ?auto_570896 ) ) ( not ( = ?auto_570882 ?auto_570897 ) ) ( not ( = ?auto_570883 ?auto_570884 ) ) ( not ( = ?auto_570883 ?auto_570885 ) ) ( not ( = ?auto_570883 ?auto_570886 ) ) ( not ( = ?auto_570883 ?auto_570887 ) ) ( not ( = ?auto_570883 ?auto_570888 ) ) ( not ( = ?auto_570883 ?auto_570889 ) ) ( not ( = ?auto_570883 ?auto_570890 ) ) ( not ( = ?auto_570883 ?auto_570891 ) ) ( not ( = ?auto_570883 ?auto_570892 ) ) ( not ( = ?auto_570883 ?auto_570893 ) ) ( not ( = ?auto_570883 ?auto_570894 ) ) ( not ( = ?auto_570883 ?auto_570895 ) ) ( not ( = ?auto_570883 ?auto_570896 ) ) ( not ( = ?auto_570883 ?auto_570897 ) ) ( not ( = ?auto_570884 ?auto_570885 ) ) ( not ( = ?auto_570884 ?auto_570886 ) ) ( not ( = ?auto_570884 ?auto_570887 ) ) ( not ( = ?auto_570884 ?auto_570888 ) ) ( not ( = ?auto_570884 ?auto_570889 ) ) ( not ( = ?auto_570884 ?auto_570890 ) ) ( not ( = ?auto_570884 ?auto_570891 ) ) ( not ( = ?auto_570884 ?auto_570892 ) ) ( not ( = ?auto_570884 ?auto_570893 ) ) ( not ( = ?auto_570884 ?auto_570894 ) ) ( not ( = ?auto_570884 ?auto_570895 ) ) ( not ( = ?auto_570884 ?auto_570896 ) ) ( not ( = ?auto_570884 ?auto_570897 ) ) ( not ( = ?auto_570885 ?auto_570886 ) ) ( not ( = ?auto_570885 ?auto_570887 ) ) ( not ( = ?auto_570885 ?auto_570888 ) ) ( not ( = ?auto_570885 ?auto_570889 ) ) ( not ( = ?auto_570885 ?auto_570890 ) ) ( not ( = ?auto_570885 ?auto_570891 ) ) ( not ( = ?auto_570885 ?auto_570892 ) ) ( not ( = ?auto_570885 ?auto_570893 ) ) ( not ( = ?auto_570885 ?auto_570894 ) ) ( not ( = ?auto_570885 ?auto_570895 ) ) ( not ( = ?auto_570885 ?auto_570896 ) ) ( not ( = ?auto_570885 ?auto_570897 ) ) ( not ( = ?auto_570886 ?auto_570887 ) ) ( not ( = ?auto_570886 ?auto_570888 ) ) ( not ( = ?auto_570886 ?auto_570889 ) ) ( not ( = ?auto_570886 ?auto_570890 ) ) ( not ( = ?auto_570886 ?auto_570891 ) ) ( not ( = ?auto_570886 ?auto_570892 ) ) ( not ( = ?auto_570886 ?auto_570893 ) ) ( not ( = ?auto_570886 ?auto_570894 ) ) ( not ( = ?auto_570886 ?auto_570895 ) ) ( not ( = ?auto_570886 ?auto_570896 ) ) ( not ( = ?auto_570886 ?auto_570897 ) ) ( not ( = ?auto_570887 ?auto_570888 ) ) ( not ( = ?auto_570887 ?auto_570889 ) ) ( not ( = ?auto_570887 ?auto_570890 ) ) ( not ( = ?auto_570887 ?auto_570891 ) ) ( not ( = ?auto_570887 ?auto_570892 ) ) ( not ( = ?auto_570887 ?auto_570893 ) ) ( not ( = ?auto_570887 ?auto_570894 ) ) ( not ( = ?auto_570887 ?auto_570895 ) ) ( not ( = ?auto_570887 ?auto_570896 ) ) ( not ( = ?auto_570887 ?auto_570897 ) ) ( not ( = ?auto_570888 ?auto_570889 ) ) ( not ( = ?auto_570888 ?auto_570890 ) ) ( not ( = ?auto_570888 ?auto_570891 ) ) ( not ( = ?auto_570888 ?auto_570892 ) ) ( not ( = ?auto_570888 ?auto_570893 ) ) ( not ( = ?auto_570888 ?auto_570894 ) ) ( not ( = ?auto_570888 ?auto_570895 ) ) ( not ( = ?auto_570888 ?auto_570896 ) ) ( not ( = ?auto_570888 ?auto_570897 ) ) ( not ( = ?auto_570889 ?auto_570890 ) ) ( not ( = ?auto_570889 ?auto_570891 ) ) ( not ( = ?auto_570889 ?auto_570892 ) ) ( not ( = ?auto_570889 ?auto_570893 ) ) ( not ( = ?auto_570889 ?auto_570894 ) ) ( not ( = ?auto_570889 ?auto_570895 ) ) ( not ( = ?auto_570889 ?auto_570896 ) ) ( not ( = ?auto_570889 ?auto_570897 ) ) ( not ( = ?auto_570890 ?auto_570891 ) ) ( not ( = ?auto_570890 ?auto_570892 ) ) ( not ( = ?auto_570890 ?auto_570893 ) ) ( not ( = ?auto_570890 ?auto_570894 ) ) ( not ( = ?auto_570890 ?auto_570895 ) ) ( not ( = ?auto_570890 ?auto_570896 ) ) ( not ( = ?auto_570890 ?auto_570897 ) ) ( not ( = ?auto_570891 ?auto_570892 ) ) ( not ( = ?auto_570891 ?auto_570893 ) ) ( not ( = ?auto_570891 ?auto_570894 ) ) ( not ( = ?auto_570891 ?auto_570895 ) ) ( not ( = ?auto_570891 ?auto_570896 ) ) ( not ( = ?auto_570891 ?auto_570897 ) ) ( not ( = ?auto_570892 ?auto_570893 ) ) ( not ( = ?auto_570892 ?auto_570894 ) ) ( not ( = ?auto_570892 ?auto_570895 ) ) ( not ( = ?auto_570892 ?auto_570896 ) ) ( not ( = ?auto_570892 ?auto_570897 ) ) ( not ( = ?auto_570893 ?auto_570894 ) ) ( not ( = ?auto_570893 ?auto_570895 ) ) ( not ( = ?auto_570893 ?auto_570896 ) ) ( not ( = ?auto_570893 ?auto_570897 ) ) ( not ( = ?auto_570894 ?auto_570895 ) ) ( not ( = ?auto_570894 ?auto_570896 ) ) ( not ( = ?auto_570894 ?auto_570897 ) ) ( not ( = ?auto_570895 ?auto_570896 ) ) ( not ( = ?auto_570895 ?auto_570897 ) ) ( not ( = ?auto_570896 ?auto_570897 ) ) ( ON ?auto_570896 ?auto_570897 ) ( ON ?auto_570895 ?auto_570896 ) ( ON ?auto_570894 ?auto_570895 ) ( ON ?auto_570893 ?auto_570894 ) ( CLEAR ?auto_570891 ) ( ON ?auto_570892 ?auto_570893 ) ( CLEAR ?auto_570892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_570882 ?auto_570883 ?auto_570884 ?auto_570885 ?auto_570886 ?auto_570887 ?auto_570888 ?auto_570889 ?auto_570890 ?auto_570891 ?auto_570892 )
      ( MAKE-16PILE ?auto_570882 ?auto_570883 ?auto_570884 ?auto_570885 ?auto_570886 ?auto_570887 ?auto_570888 ?auto_570889 ?auto_570890 ?auto_570891 ?auto_570892 ?auto_570893 ?auto_570894 ?auto_570895 ?auto_570896 ?auto_570897 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_570914 - BLOCK
      ?auto_570915 - BLOCK
      ?auto_570916 - BLOCK
      ?auto_570917 - BLOCK
      ?auto_570918 - BLOCK
      ?auto_570919 - BLOCK
      ?auto_570920 - BLOCK
      ?auto_570921 - BLOCK
      ?auto_570922 - BLOCK
      ?auto_570923 - BLOCK
      ?auto_570924 - BLOCK
      ?auto_570925 - BLOCK
      ?auto_570926 - BLOCK
      ?auto_570927 - BLOCK
      ?auto_570928 - BLOCK
      ?auto_570929 - BLOCK
    )
    :vars
    (
      ?auto_570930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_570929 ?auto_570930 ) ( ON-TABLE ?auto_570914 ) ( ON ?auto_570915 ?auto_570914 ) ( ON ?auto_570916 ?auto_570915 ) ( ON ?auto_570917 ?auto_570916 ) ( ON ?auto_570918 ?auto_570917 ) ( ON ?auto_570919 ?auto_570918 ) ( ON ?auto_570920 ?auto_570919 ) ( ON ?auto_570921 ?auto_570920 ) ( ON ?auto_570922 ?auto_570921 ) ( not ( = ?auto_570914 ?auto_570915 ) ) ( not ( = ?auto_570914 ?auto_570916 ) ) ( not ( = ?auto_570914 ?auto_570917 ) ) ( not ( = ?auto_570914 ?auto_570918 ) ) ( not ( = ?auto_570914 ?auto_570919 ) ) ( not ( = ?auto_570914 ?auto_570920 ) ) ( not ( = ?auto_570914 ?auto_570921 ) ) ( not ( = ?auto_570914 ?auto_570922 ) ) ( not ( = ?auto_570914 ?auto_570923 ) ) ( not ( = ?auto_570914 ?auto_570924 ) ) ( not ( = ?auto_570914 ?auto_570925 ) ) ( not ( = ?auto_570914 ?auto_570926 ) ) ( not ( = ?auto_570914 ?auto_570927 ) ) ( not ( = ?auto_570914 ?auto_570928 ) ) ( not ( = ?auto_570914 ?auto_570929 ) ) ( not ( = ?auto_570914 ?auto_570930 ) ) ( not ( = ?auto_570915 ?auto_570916 ) ) ( not ( = ?auto_570915 ?auto_570917 ) ) ( not ( = ?auto_570915 ?auto_570918 ) ) ( not ( = ?auto_570915 ?auto_570919 ) ) ( not ( = ?auto_570915 ?auto_570920 ) ) ( not ( = ?auto_570915 ?auto_570921 ) ) ( not ( = ?auto_570915 ?auto_570922 ) ) ( not ( = ?auto_570915 ?auto_570923 ) ) ( not ( = ?auto_570915 ?auto_570924 ) ) ( not ( = ?auto_570915 ?auto_570925 ) ) ( not ( = ?auto_570915 ?auto_570926 ) ) ( not ( = ?auto_570915 ?auto_570927 ) ) ( not ( = ?auto_570915 ?auto_570928 ) ) ( not ( = ?auto_570915 ?auto_570929 ) ) ( not ( = ?auto_570915 ?auto_570930 ) ) ( not ( = ?auto_570916 ?auto_570917 ) ) ( not ( = ?auto_570916 ?auto_570918 ) ) ( not ( = ?auto_570916 ?auto_570919 ) ) ( not ( = ?auto_570916 ?auto_570920 ) ) ( not ( = ?auto_570916 ?auto_570921 ) ) ( not ( = ?auto_570916 ?auto_570922 ) ) ( not ( = ?auto_570916 ?auto_570923 ) ) ( not ( = ?auto_570916 ?auto_570924 ) ) ( not ( = ?auto_570916 ?auto_570925 ) ) ( not ( = ?auto_570916 ?auto_570926 ) ) ( not ( = ?auto_570916 ?auto_570927 ) ) ( not ( = ?auto_570916 ?auto_570928 ) ) ( not ( = ?auto_570916 ?auto_570929 ) ) ( not ( = ?auto_570916 ?auto_570930 ) ) ( not ( = ?auto_570917 ?auto_570918 ) ) ( not ( = ?auto_570917 ?auto_570919 ) ) ( not ( = ?auto_570917 ?auto_570920 ) ) ( not ( = ?auto_570917 ?auto_570921 ) ) ( not ( = ?auto_570917 ?auto_570922 ) ) ( not ( = ?auto_570917 ?auto_570923 ) ) ( not ( = ?auto_570917 ?auto_570924 ) ) ( not ( = ?auto_570917 ?auto_570925 ) ) ( not ( = ?auto_570917 ?auto_570926 ) ) ( not ( = ?auto_570917 ?auto_570927 ) ) ( not ( = ?auto_570917 ?auto_570928 ) ) ( not ( = ?auto_570917 ?auto_570929 ) ) ( not ( = ?auto_570917 ?auto_570930 ) ) ( not ( = ?auto_570918 ?auto_570919 ) ) ( not ( = ?auto_570918 ?auto_570920 ) ) ( not ( = ?auto_570918 ?auto_570921 ) ) ( not ( = ?auto_570918 ?auto_570922 ) ) ( not ( = ?auto_570918 ?auto_570923 ) ) ( not ( = ?auto_570918 ?auto_570924 ) ) ( not ( = ?auto_570918 ?auto_570925 ) ) ( not ( = ?auto_570918 ?auto_570926 ) ) ( not ( = ?auto_570918 ?auto_570927 ) ) ( not ( = ?auto_570918 ?auto_570928 ) ) ( not ( = ?auto_570918 ?auto_570929 ) ) ( not ( = ?auto_570918 ?auto_570930 ) ) ( not ( = ?auto_570919 ?auto_570920 ) ) ( not ( = ?auto_570919 ?auto_570921 ) ) ( not ( = ?auto_570919 ?auto_570922 ) ) ( not ( = ?auto_570919 ?auto_570923 ) ) ( not ( = ?auto_570919 ?auto_570924 ) ) ( not ( = ?auto_570919 ?auto_570925 ) ) ( not ( = ?auto_570919 ?auto_570926 ) ) ( not ( = ?auto_570919 ?auto_570927 ) ) ( not ( = ?auto_570919 ?auto_570928 ) ) ( not ( = ?auto_570919 ?auto_570929 ) ) ( not ( = ?auto_570919 ?auto_570930 ) ) ( not ( = ?auto_570920 ?auto_570921 ) ) ( not ( = ?auto_570920 ?auto_570922 ) ) ( not ( = ?auto_570920 ?auto_570923 ) ) ( not ( = ?auto_570920 ?auto_570924 ) ) ( not ( = ?auto_570920 ?auto_570925 ) ) ( not ( = ?auto_570920 ?auto_570926 ) ) ( not ( = ?auto_570920 ?auto_570927 ) ) ( not ( = ?auto_570920 ?auto_570928 ) ) ( not ( = ?auto_570920 ?auto_570929 ) ) ( not ( = ?auto_570920 ?auto_570930 ) ) ( not ( = ?auto_570921 ?auto_570922 ) ) ( not ( = ?auto_570921 ?auto_570923 ) ) ( not ( = ?auto_570921 ?auto_570924 ) ) ( not ( = ?auto_570921 ?auto_570925 ) ) ( not ( = ?auto_570921 ?auto_570926 ) ) ( not ( = ?auto_570921 ?auto_570927 ) ) ( not ( = ?auto_570921 ?auto_570928 ) ) ( not ( = ?auto_570921 ?auto_570929 ) ) ( not ( = ?auto_570921 ?auto_570930 ) ) ( not ( = ?auto_570922 ?auto_570923 ) ) ( not ( = ?auto_570922 ?auto_570924 ) ) ( not ( = ?auto_570922 ?auto_570925 ) ) ( not ( = ?auto_570922 ?auto_570926 ) ) ( not ( = ?auto_570922 ?auto_570927 ) ) ( not ( = ?auto_570922 ?auto_570928 ) ) ( not ( = ?auto_570922 ?auto_570929 ) ) ( not ( = ?auto_570922 ?auto_570930 ) ) ( not ( = ?auto_570923 ?auto_570924 ) ) ( not ( = ?auto_570923 ?auto_570925 ) ) ( not ( = ?auto_570923 ?auto_570926 ) ) ( not ( = ?auto_570923 ?auto_570927 ) ) ( not ( = ?auto_570923 ?auto_570928 ) ) ( not ( = ?auto_570923 ?auto_570929 ) ) ( not ( = ?auto_570923 ?auto_570930 ) ) ( not ( = ?auto_570924 ?auto_570925 ) ) ( not ( = ?auto_570924 ?auto_570926 ) ) ( not ( = ?auto_570924 ?auto_570927 ) ) ( not ( = ?auto_570924 ?auto_570928 ) ) ( not ( = ?auto_570924 ?auto_570929 ) ) ( not ( = ?auto_570924 ?auto_570930 ) ) ( not ( = ?auto_570925 ?auto_570926 ) ) ( not ( = ?auto_570925 ?auto_570927 ) ) ( not ( = ?auto_570925 ?auto_570928 ) ) ( not ( = ?auto_570925 ?auto_570929 ) ) ( not ( = ?auto_570925 ?auto_570930 ) ) ( not ( = ?auto_570926 ?auto_570927 ) ) ( not ( = ?auto_570926 ?auto_570928 ) ) ( not ( = ?auto_570926 ?auto_570929 ) ) ( not ( = ?auto_570926 ?auto_570930 ) ) ( not ( = ?auto_570927 ?auto_570928 ) ) ( not ( = ?auto_570927 ?auto_570929 ) ) ( not ( = ?auto_570927 ?auto_570930 ) ) ( not ( = ?auto_570928 ?auto_570929 ) ) ( not ( = ?auto_570928 ?auto_570930 ) ) ( not ( = ?auto_570929 ?auto_570930 ) ) ( ON ?auto_570928 ?auto_570929 ) ( ON ?auto_570927 ?auto_570928 ) ( ON ?auto_570926 ?auto_570927 ) ( ON ?auto_570925 ?auto_570926 ) ( ON ?auto_570924 ?auto_570925 ) ( CLEAR ?auto_570922 ) ( ON ?auto_570923 ?auto_570924 ) ( CLEAR ?auto_570923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_570914 ?auto_570915 ?auto_570916 ?auto_570917 ?auto_570918 ?auto_570919 ?auto_570920 ?auto_570921 ?auto_570922 ?auto_570923 )
      ( MAKE-16PILE ?auto_570914 ?auto_570915 ?auto_570916 ?auto_570917 ?auto_570918 ?auto_570919 ?auto_570920 ?auto_570921 ?auto_570922 ?auto_570923 ?auto_570924 ?auto_570925 ?auto_570926 ?auto_570927 ?auto_570928 ?auto_570929 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_570947 - BLOCK
      ?auto_570948 - BLOCK
      ?auto_570949 - BLOCK
      ?auto_570950 - BLOCK
      ?auto_570951 - BLOCK
      ?auto_570952 - BLOCK
      ?auto_570953 - BLOCK
      ?auto_570954 - BLOCK
      ?auto_570955 - BLOCK
      ?auto_570956 - BLOCK
      ?auto_570957 - BLOCK
      ?auto_570958 - BLOCK
      ?auto_570959 - BLOCK
      ?auto_570960 - BLOCK
      ?auto_570961 - BLOCK
      ?auto_570962 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_570962 ) ( ON-TABLE ?auto_570947 ) ( ON ?auto_570948 ?auto_570947 ) ( ON ?auto_570949 ?auto_570948 ) ( ON ?auto_570950 ?auto_570949 ) ( ON ?auto_570951 ?auto_570950 ) ( ON ?auto_570952 ?auto_570951 ) ( ON ?auto_570953 ?auto_570952 ) ( ON ?auto_570954 ?auto_570953 ) ( ON ?auto_570955 ?auto_570954 ) ( not ( = ?auto_570947 ?auto_570948 ) ) ( not ( = ?auto_570947 ?auto_570949 ) ) ( not ( = ?auto_570947 ?auto_570950 ) ) ( not ( = ?auto_570947 ?auto_570951 ) ) ( not ( = ?auto_570947 ?auto_570952 ) ) ( not ( = ?auto_570947 ?auto_570953 ) ) ( not ( = ?auto_570947 ?auto_570954 ) ) ( not ( = ?auto_570947 ?auto_570955 ) ) ( not ( = ?auto_570947 ?auto_570956 ) ) ( not ( = ?auto_570947 ?auto_570957 ) ) ( not ( = ?auto_570947 ?auto_570958 ) ) ( not ( = ?auto_570947 ?auto_570959 ) ) ( not ( = ?auto_570947 ?auto_570960 ) ) ( not ( = ?auto_570947 ?auto_570961 ) ) ( not ( = ?auto_570947 ?auto_570962 ) ) ( not ( = ?auto_570948 ?auto_570949 ) ) ( not ( = ?auto_570948 ?auto_570950 ) ) ( not ( = ?auto_570948 ?auto_570951 ) ) ( not ( = ?auto_570948 ?auto_570952 ) ) ( not ( = ?auto_570948 ?auto_570953 ) ) ( not ( = ?auto_570948 ?auto_570954 ) ) ( not ( = ?auto_570948 ?auto_570955 ) ) ( not ( = ?auto_570948 ?auto_570956 ) ) ( not ( = ?auto_570948 ?auto_570957 ) ) ( not ( = ?auto_570948 ?auto_570958 ) ) ( not ( = ?auto_570948 ?auto_570959 ) ) ( not ( = ?auto_570948 ?auto_570960 ) ) ( not ( = ?auto_570948 ?auto_570961 ) ) ( not ( = ?auto_570948 ?auto_570962 ) ) ( not ( = ?auto_570949 ?auto_570950 ) ) ( not ( = ?auto_570949 ?auto_570951 ) ) ( not ( = ?auto_570949 ?auto_570952 ) ) ( not ( = ?auto_570949 ?auto_570953 ) ) ( not ( = ?auto_570949 ?auto_570954 ) ) ( not ( = ?auto_570949 ?auto_570955 ) ) ( not ( = ?auto_570949 ?auto_570956 ) ) ( not ( = ?auto_570949 ?auto_570957 ) ) ( not ( = ?auto_570949 ?auto_570958 ) ) ( not ( = ?auto_570949 ?auto_570959 ) ) ( not ( = ?auto_570949 ?auto_570960 ) ) ( not ( = ?auto_570949 ?auto_570961 ) ) ( not ( = ?auto_570949 ?auto_570962 ) ) ( not ( = ?auto_570950 ?auto_570951 ) ) ( not ( = ?auto_570950 ?auto_570952 ) ) ( not ( = ?auto_570950 ?auto_570953 ) ) ( not ( = ?auto_570950 ?auto_570954 ) ) ( not ( = ?auto_570950 ?auto_570955 ) ) ( not ( = ?auto_570950 ?auto_570956 ) ) ( not ( = ?auto_570950 ?auto_570957 ) ) ( not ( = ?auto_570950 ?auto_570958 ) ) ( not ( = ?auto_570950 ?auto_570959 ) ) ( not ( = ?auto_570950 ?auto_570960 ) ) ( not ( = ?auto_570950 ?auto_570961 ) ) ( not ( = ?auto_570950 ?auto_570962 ) ) ( not ( = ?auto_570951 ?auto_570952 ) ) ( not ( = ?auto_570951 ?auto_570953 ) ) ( not ( = ?auto_570951 ?auto_570954 ) ) ( not ( = ?auto_570951 ?auto_570955 ) ) ( not ( = ?auto_570951 ?auto_570956 ) ) ( not ( = ?auto_570951 ?auto_570957 ) ) ( not ( = ?auto_570951 ?auto_570958 ) ) ( not ( = ?auto_570951 ?auto_570959 ) ) ( not ( = ?auto_570951 ?auto_570960 ) ) ( not ( = ?auto_570951 ?auto_570961 ) ) ( not ( = ?auto_570951 ?auto_570962 ) ) ( not ( = ?auto_570952 ?auto_570953 ) ) ( not ( = ?auto_570952 ?auto_570954 ) ) ( not ( = ?auto_570952 ?auto_570955 ) ) ( not ( = ?auto_570952 ?auto_570956 ) ) ( not ( = ?auto_570952 ?auto_570957 ) ) ( not ( = ?auto_570952 ?auto_570958 ) ) ( not ( = ?auto_570952 ?auto_570959 ) ) ( not ( = ?auto_570952 ?auto_570960 ) ) ( not ( = ?auto_570952 ?auto_570961 ) ) ( not ( = ?auto_570952 ?auto_570962 ) ) ( not ( = ?auto_570953 ?auto_570954 ) ) ( not ( = ?auto_570953 ?auto_570955 ) ) ( not ( = ?auto_570953 ?auto_570956 ) ) ( not ( = ?auto_570953 ?auto_570957 ) ) ( not ( = ?auto_570953 ?auto_570958 ) ) ( not ( = ?auto_570953 ?auto_570959 ) ) ( not ( = ?auto_570953 ?auto_570960 ) ) ( not ( = ?auto_570953 ?auto_570961 ) ) ( not ( = ?auto_570953 ?auto_570962 ) ) ( not ( = ?auto_570954 ?auto_570955 ) ) ( not ( = ?auto_570954 ?auto_570956 ) ) ( not ( = ?auto_570954 ?auto_570957 ) ) ( not ( = ?auto_570954 ?auto_570958 ) ) ( not ( = ?auto_570954 ?auto_570959 ) ) ( not ( = ?auto_570954 ?auto_570960 ) ) ( not ( = ?auto_570954 ?auto_570961 ) ) ( not ( = ?auto_570954 ?auto_570962 ) ) ( not ( = ?auto_570955 ?auto_570956 ) ) ( not ( = ?auto_570955 ?auto_570957 ) ) ( not ( = ?auto_570955 ?auto_570958 ) ) ( not ( = ?auto_570955 ?auto_570959 ) ) ( not ( = ?auto_570955 ?auto_570960 ) ) ( not ( = ?auto_570955 ?auto_570961 ) ) ( not ( = ?auto_570955 ?auto_570962 ) ) ( not ( = ?auto_570956 ?auto_570957 ) ) ( not ( = ?auto_570956 ?auto_570958 ) ) ( not ( = ?auto_570956 ?auto_570959 ) ) ( not ( = ?auto_570956 ?auto_570960 ) ) ( not ( = ?auto_570956 ?auto_570961 ) ) ( not ( = ?auto_570956 ?auto_570962 ) ) ( not ( = ?auto_570957 ?auto_570958 ) ) ( not ( = ?auto_570957 ?auto_570959 ) ) ( not ( = ?auto_570957 ?auto_570960 ) ) ( not ( = ?auto_570957 ?auto_570961 ) ) ( not ( = ?auto_570957 ?auto_570962 ) ) ( not ( = ?auto_570958 ?auto_570959 ) ) ( not ( = ?auto_570958 ?auto_570960 ) ) ( not ( = ?auto_570958 ?auto_570961 ) ) ( not ( = ?auto_570958 ?auto_570962 ) ) ( not ( = ?auto_570959 ?auto_570960 ) ) ( not ( = ?auto_570959 ?auto_570961 ) ) ( not ( = ?auto_570959 ?auto_570962 ) ) ( not ( = ?auto_570960 ?auto_570961 ) ) ( not ( = ?auto_570960 ?auto_570962 ) ) ( not ( = ?auto_570961 ?auto_570962 ) ) ( ON ?auto_570961 ?auto_570962 ) ( ON ?auto_570960 ?auto_570961 ) ( ON ?auto_570959 ?auto_570960 ) ( ON ?auto_570958 ?auto_570959 ) ( ON ?auto_570957 ?auto_570958 ) ( CLEAR ?auto_570955 ) ( ON ?auto_570956 ?auto_570957 ) ( CLEAR ?auto_570956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_570947 ?auto_570948 ?auto_570949 ?auto_570950 ?auto_570951 ?auto_570952 ?auto_570953 ?auto_570954 ?auto_570955 ?auto_570956 )
      ( MAKE-16PILE ?auto_570947 ?auto_570948 ?auto_570949 ?auto_570950 ?auto_570951 ?auto_570952 ?auto_570953 ?auto_570954 ?auto_570955 ?auto_570956 ?auto_570957 ?auto_570958 ?auto_570959 ?auto_570960 ?auto_570961 ?auto_570962 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_570979 - BLOCK
      ?auto_570980 - BLOCK
      ?auto_570981 - BLOCK
      ?auto_570982 - BLOCK
      ?auto_570983 - BLOCK
      ?auto_570984 - BLOCK
      ?auto_570985 - BLOCK
      ?auto_570986 - BLOCK
      ?auto_570987 - BLOCK
      ?auto_570988 - BLOCK
      ?auto_570989 - BLOCK
      ?auto_570990 - BLOCK
      ?auto_570991 - BLOCK
      ?auto_570992 - BLOCK
      ?auto_570993 - BLOCK
      ?auto_570994 - BLOCK
    )
    :vars
    (
      ?auto_570995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_570994 ?auto_570995 ) ( ON-TABLE ?auto_570979 ) ( ON ?auto_570980 ?auto_570979 ) ( ON ?auto_570981 ?auto_570980 ) ( ON ?auto_570982 ?auto_570981 ) ( ON ?auto_570983 ?auto_570982 ) ( ON ?auto_570984 ?auto_570983 ) ( ON ?auto_570985 ?auto_570984 ) ( ON ?auto_570986 ?auto_570985 ) ( not ( = ?auto_570979 ?auto_570980 ) ) ( not ( = ?auto_570979 ?auto_570981 ) ) ( not ( = ?auto_570979 ?auto_570982 ) ) ( not ( = ?auto_570979 ?auto_570983 ) ) ( not ( = ?auto_570979 ?auto_570984 ) ) ( not ( = ?auto_570979 ?auto_570985 ) ) ( not ( = ?auto_570979 ?auto_570986 ) ) ( not ( = ?auto_570979 ?auto_570987 ) ) ( not ( = ?auto_570979 ?auto_570988 ) ) ( not ( = ?auto_570979 ?auto_570989 ) ) ( not ( = ?auto_570979 ?auto_570990 ) ) ( not ( = ?auto_570979 ?auto_570991 ) ) ( not ( = ?auto_570979 ?auto_570992 ) ) ( not ( = ?auto_570979 ?auto_570993 ) ) ( not ( = ?auto_570979 ?auto_570994 ) ) ( not ( = ?auto_570979 ?auto_570995 ) ) ( not ( = ?auto_570980 ?auto_570981 ) ) ( not ( = ?auto_570980 ?auto_570982 ) ) ( not ( = ?auto_570980 ?auto_570983 ) ) ( not ( = ?auto_570980 ?auto_570984 ) ) ( not ( = ?auto_570980 ?auto_570985 ) ) ( not ( = ?auto_570980 ?auto_570986 ) ) ( not ( = ?auto_570980 ?auto_570987 ) ) ( not ( = ?auto_570980 ?auto_570988 ) ) ( not ( = ?auto_570980 ?auto_570989 ) ) ( not ( = ?auto_570980 ?auto_570990 ) ) ( not ( = ?auto_570980 ?auto_570991 ) ) ( not ( = ?auto_570980 ?auto_570992 ) ) ( not ( = ?auto_570980 ?auto_570993 ) ) ( not ( = ?auto_570980 ?auto_570994 ) ) ( not ( = ?auto_570980 ?auto_570995 ) ) ( not ( = ?auto_570981 ?auto_570982 ) ) ( not ( = ?auto_570981 ?auto_570983 ) ) ( not ( = ?auto_570981 ?auto_570984 ) ) ( not ( = ?auto_570981 ?auto_570985 ) ) ( not ( = ?auto_570981 ?auto_570986 ) ) ( not ( = ?auto_570981 ?auto_570987 ) ) ( not ( = ?auto_570981 ?auto_570988 ) ) ( not ( = ?auto_570981 ?auto_570989 ) ) ( not ( = ?auto_570981 ?auto_570990 ) ) ( not ( = ?auto_570981 ?auto_570991 ) ) ( not ( = ?auto_570981 ?auto_570992 ) ) ( not ( = ?auto_570981 ?auto_570993 ) ) ( not ( = ?auto_570981 ?auto_570994 ) ) ( not ( = ?auto_570981 ?auto_570995 ) ) ( not ( = ?auto_570982 ?auto_570983 ) ) ( not ( = ?auto_570982 ?auto_570984 ) ) ( not ( = ?auto_570982 ?auto_570985 ) ) ( not ( = ?auto_570982 ?auto_570986 ) ) ( not ( = ?auto_570982 ?auto_570987 ) ) ( not ( = ?auto_570982 ?auto_570988 ) ) ( not ( = ?auto_570982 ?auto_570989 ) ) ( not ( = ?auto_570982 ?auto_570990 ) ) ( not ( = ?auto_570982 ?auto_570991 ) ) ( not ( = ?auto_570982 ?auto_570992 ) ) ( not ( = ?auto_570982 ?auto_570993 ) ) ( not ( = ?auto_570982 ?auto_570994 ) ) ( not ( = ?auto_570982 ?auto_570995 ) ) ( not ( = ?auto_570983 ?auto_570984 ) ) ( not ( = ?auto_570983 ?auto_570985 ) ) ( not ( = ?auto_570983 ?auto_570986 ) ) ( not ( = ?auto_570983 ?auto_570987 ) ) ( not ( = ?auto_570983 ?auto_570988 ) ) ( not ( = ?auto_570983 ?auto_570989 ) ) ( not ( = ?auto_570983 ?auto_570990 ) ) ( not ( = ?auto_570983 ?auto_570991 ) ) ( not ( = ?auto_570983 ?auto_570992 ) ) ( not ( = ?auto_570983 ?auto_570993 ) ) ( not ( = ?auto_570983 ?auto_570994 ) ) ( not ( = ?auto_570983 ?auto_570995 ) ) ( not ( = ?auto_570984 ?auto_570985 ) ) ( not ( = ?auto_570984 ?auto_570986 ) ) ( not ( = ?auto_570984 ?auto_570987 ) ) ( not ( = ?auto_570984 ?auto_570988 ) ) ( not ( = ?auto_570984 ?auto_570989 ) ) ( not ( = ?auto_570984 ?auto_570990 ) ) ( not ( = ?auto_570984 ?auto_570991 ) ) ( not ( = ?auto_570984 ?auto_570992 ) ) ( not ( = ?auto_570984 ?auto_570993 ) ) ( not ( = ?auto_570984 ?auto_570994 ) ) ( not ( = ?auto_570984 ?auto_570995 ) ) ( not ( = ?auto_570985 ?auto_570986 ) ) ( not ( = ?auto_570985 ?auto_570987 ) ) ( not ( = ?auto_570985 ?auto_570988 ) ) ( not ( = ?auto_570985 ?auto_570989 ) ) ( not ( = ?auto_570985 ?auto_570990 ) ) ( not ( = ?auto_570985 ?auto_570991 ) ) ( not ( = ?auto_570985 ?auto_570992 ) ) ( not ( = ?auto_570985 ?auto_570993 ) ) ( not ( = ?auto_570985 ?auto_570994 ) ) ( not ( = ?auto_570985 ?auto_570995 ) ) ( not ( = ?auto_570986 ?auto_570987 ) ) ( not ( = ?auto_570986 ?auto_570988 ) ) ( not ( = ?auto_570986 ?auto_570989 ) ) ( not ( = ?auto_570986 ?auto_570990 ) ) ( not ( = ?auto_570986 ?auto_570991 ) ) ( not ( = ?auto_570986 ?auto_570992 ) ) ( not ( = ?auto_570986 ?auto_570993 ) ) ( not ( = ?auto_570986 ?auto_570994 ) ) ( not ( = ?auto_570986 ?auto_570995 ) ) ( not ( = ?auto_570987 ?auto_570988 ) ) ( not ( = ?auto_570987 ?auto_570989 ) ) ( not ( = ?auto_570987 ?auto_570990 ) ) ( not ( = ?auto_570987 ?auto_570991 ) ) ( not ( = ?auto_570987 ?auto_570992 ) ) ( not ( = ?auto_570987 ?auto_570993 ) ) ( not ( = ?auto_570987 ?auto_570994 ) ) ( not ( = ?auto_570987 ?auto_570995 ) ) ( not ( = ?auto_570988 ?auto_570989 ) ) ( not ( = ?auto_570988 ?auto_570990 ) ) ( not ( = ?auto_570988 ?auto_570991 ) ) ( not ( = ?auto_570988 ?auto_570992 ) ) ( not ( = ?auto_570988 ?auto_570993 ) ) ( not ( = ?auto_570988 ?auto_570994 ) ) ( not ( = ?auto_570988 ?auto_570995 ) ) ( not ( = ?auto_570989 ?auto_570990 ) ) ( not ( = ?auto_570989 ?auto_570991 ) ) ( not ( = ?auto_570989 ?auto_570992 ) ) ( not ( = ?auto_570989 ?auto_570993 ) ) ( not ( = ?auto_570989 ?auto_570994 ) ) ( not ( = ?auto_570989 ?auto_570995 ) ) ( not ( = ?auto_570990 ?auto_570991 ) ) ( not ( = ?auto_570990 ?auto_570992 ) ) ( not ( = ?auto_570990 ?auto_570993 ) ) ( not ( = ?auto_570990 ?auto_570994 ) ) ( not ( = ?auto_570990 ?auto_570995 ) ) ( not ( = ?auto_570991 ?auto_570992 ) ) ( not ( = ?auto_570991 ?auto_570993 ) ) ( not ( = ?auto_570991 ?auto_570994 ) ) ( not ( = ?auto_570991 ?auto_570995 ) ) ( not ( = ?auto_570992 ?auto_570993 ) ) ( not ( = ?auto_570992 ?auto_570994 ) ) ( not ( = ?auto_570992 ?auto_570995 ) ) ( not ( = ?auto_570993 ?auto_570994 ) ) ( not ( = ?auto_570993 ?auto_570995 ) ) ( not ( = ?auto_570994 ?auto_570995 ) ) ( ON ?auto_570993 ?auto_570994 ) ( ON ?auto_570992 ?auto_570993 ) ( ON ?auto_570991 ?auto_570992 ) ( ON ?auto_570990 ?auto_570991 ) ( ON ?auto_570989 ?auto_570990 ) ( ON ?auto_570988 ?auto_570989 ) ( CLEAR ?auto_570986 ) ( ON ?auto_570987 ?auto_570988 ) ( CLEAR ?auto_570987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_570979 ?auto_570980 ?auto_570981 ?auto_570982 ?auto_570983 ?auto_570984 ?auto_570985 ?auto_570986 ?auto_570987 )
      ( MAKE-16PILE ?auto_570979 ?auto_570980 ?auto_570981 ?auto_570982 ?auto_570983 ?auto_570984 ?auto_570985 ?auto_570986 ?auto_570987 ?auto_570988 ?auto_570989 ?auto_570990 ?auto_570991 ?auto_570992 ?auto_570993 ?auto_570994 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_571012 - BLOCK
      ?auto_571013 - BLOCK
      ?auto_571014 - BLOCK
      ?auto_571015 - BLOCK
      ?auto_571016 - BLOCK
      ?auto_571017 - BLOCK
      ?auto_571018 - BLOCK
      ?auto_571019 - BLOCK
      ?auto_571020 - BLOCK
      ?auto_571021 - BLOCK
      ?auto_571022 - BLOCK
      ?auto_571023 - BLOCK
      ?auto_571024 - BLOCK
      ?auto_571025 - BLOCK
      ?auto_571026 - BLOCK
      ?auto_571027 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_571027 ) ( ON-TABLE ?auto_571012 ) ( ON ?auto_571013 ?auto_571012 ) ( ON ?auto_571014 ?auto_571013 ) ( ON ?auto_571015 ?auto_571014 ) ( ON ?auto_571016 ?auto_571015 ) ( ON ?auto_571017 ?auto_571016 ) ( ON ?auto_571018 ?auto_571017 ) ( ON ?auto_571019 ?auto_571018 ) ( not ( = ?auto_571012 ?auto_571013 ) ) ( not ( = ?auto_571012 ?auto_571014 ) ) ( not ( = ?auto_571012 ?auto_571015 ) ) ( not ( = ?auto_571012 ?auto_571016 ) ) ( not ( = ?auto_571012 ?auto_571017 ) ) ( not ( = ?auto_571012 ?auto_571018 ) ) ( not ( = ?auto_571012 ?auto_571019 ) ) ( not ( = ?auto_571012 ?auto_571020 ) ) ( not ( = ?auto_571012 ?auto_571021 ) ) ( not ( = ?auto_571012 ?auto_571022 ) ) ( not ( = ?auto_571012 ?auto_571023 ) ) ( not ( = ?auto_571012 ?auto_571024 ) ) ( not ( = ?auto_571012 ?auto_571025 ) ) ( not ( = ?auto_571012 ?auto_571026 ) ) ( not ( = ?auto_571012 ?auto_571027 ) ) ( not ( = ?auto_571013 ?auto_571014 ) ) ( not ( = ?auto_571013 ?auto_571015 ) ) ( not ( = ?auto_571013 ?auto_571016 ) ) ( not ( = ?auto_571013 ?auto_571017 ) ) ( not ( = ?auto_571013 ?auto_571018 ) ) ( not ( = ?auto_571013 ?auto_571019 ) ) ( not ( = ?auto_571013 ?auto_571020 ) ) ( not ( = ?auto_571013 ?auto_571021 ) ) ( not ( = ?auto_571013 ?auto_571022 ) ) ( not ( = ?auto_571013 ?auto_571023 ) ) ( not ( = ?auto_571013 ?auto_571024 ) ) ( not ( = ?auto_571013 ?auto_571025 ) ) ( not ( = ?auto_571013 ?auto_571026 ) ) ( not ( = ?auto_571013 ?auto_571027 ) ) ( not ( = ?auto_571014 ?auto_571015 ) ) ( not ( = ?auto_571014 ?auto_571016 ) ) ( not ( = ?auto_571014 ?auto_571017 ) ) ( not ( = ?auto_571014 ?auto_571018 ) ) ( not ( = ?auto_571014 ?auto_571019 ) ) ( not ( = ?auto_571014 ?auto_571020 ) ) ( not ( = ?auto_571014 ?auto_571021 ) ) ( not ( = ?auto_571014 ?auto_571022 ) ) ( not ( = ?auto_571014 ?auto_571023 ) ) ( not ( = ?auto_571014 ?auto_571024 ) ) ( not ( = ?auto_571014 ?auto_571025 ) ) ( not ( = ?auto_571014 ?auto_571026 ) ) ( not ( = ?auto_571014 ?auto_571027 ) ) ( not ( = ?auto_571015 ?auto_571016 ) ) ( not ( = ?auto_571015 ?auto_571017 ) ) ( not ( = ?auto_571015 ?auto_571018 ) ) ( not ( = ?auto_571015 ?auto_571019 ) ) ( not ( = ?auto_571015 ?auto_571020 ) ) ( not ( = ?auto_571015 ?auto_571021 ) ) ( not ( = ?auto_571015 ?auto_571022 ) ) ( not ( = ?auto_571015 ?auto_571023 ) ) ( not ( = ?auto_571015 ?auto_571024 ) ) ( not ( = ?auto_571015 ?auto_571025 ) ) ( not ( = ?auto_571015 ?auto_571026 ) ) ( not ( = ?auto_571015 ?auto_571027 ) ) ( not ( = ?auto_571016 ?auto_571017 ) ) ( not ( = ?auto_571016 ?auto_571018 ) ) ( not ( = ?auto_571016 ?auto_571019 ) ) ( not ( = ?auto_571016 ?auto_571020 ) ) ( not ( = ?auto_571016 ?auto_571021 ) ) ( not ( = ?auto_571016 ?auto_571022 ) ) ( not ( = ?auto_571016 ?auto_571023 ) ) ( not ( = ?auto_571016 ?auto_571024 ) ) ( not ( = ?auto_571016 ?auto_571025 ) ) ( not ( = ?auto_571016 ?auto_571026 ) ) ( not ( = ?auto_571016 ?auto_571027 ) ) ( not ( = ?auto_571017 ?auto_571018 ) ) ( not ( = ?auto_571017 ?auto_571019 ) ) ( not ( = ?auto_571017 ?auto_571020 ) ) ( not ( = ?auto_571017 ?auto_571021 ) ) ( not ( = ?auto_571017 ?auto_571022 ) ) ( not ( = ?auto_571017 ?auto_571023 ) ) ( not ( = ?auto_571017 ?auto_571024 ) ) ( not ( = ?auto_571017 ?auto_571025 ) ) ( not ( = ?auto_571017 ?auto_571026 ) ) ( not ( = ?auto_571017 ?auto_571027 ) ) ( not ( = ?auto_571018 ?auto_571019 ) ) ( not ( = ?auto_571018 ?auto_571020 ) ) ( not ( = ?auto_571018 ?auto_571021 ) ) ( not ( = ?auto_571018 ?auto_571022 ) ) ( not ( = ?auto_571018 ?auto_571023 ) ) ( not ( = ?auto_571018 ?auto_571024 ) ) ( not ( = ?auto_571018 ?auto_571025 ) ) ( not ( = ?auto_571018 ?auto_571026 ) ) ( not ( = ?auto_571018 ?auto_571027 ) ) ( not ( = ?auto_571019 ?auto_571020 ) ) ( not ( = ?auto_571019 ?auto_571021 ) ) ( not ( = ?auto_571019 ?auto_571022 ) ) ( not ( = ?auto_571019 ?auto_571023 ) ) ( not ( = ?auto_571019 ?auto_571024 ) ) ( not ( = ?auto_571019 ?auto_571025 ) ) ( not ( = ?auto_571019 ?auto_571026 ) ) ( not ( = ?auto_571019 ?auto_571027 ) ) ( not ( = ?auto_571020 ?auto_571021 ) ) ( not ( = ?auto_571020 ?auto_571022 ) ) ( not ( = ?auto_571020 ?auto_571023 ) ) ( not ( = ?auto_571020 ?auto_571024 ) ) ( not ( = ?auto_571020 ?auto_571025 ) ) ( not ( = ?auto_571020 ?auto_571026 ) ) ( not ( = ?auto_571020 ?auto_571027 ) ) ( not ( = ?auto_571021 ?auto_571022 ) ) ( not ( = ?auto_571021 ?auto_571023 ) ) ( not ( = ?auto_571021 ?auto_571024 ) ) ( not ( = ?auto_571021 ?auto_571025 ) ) ( not ( = ?auto_571021 ?auto_571026 ) ) ( not ( = ?auto_571021 ?auto_571027 ) ) ( not ( = ?auto_571022 ?auto_571023 ) ) ( not ( = ?auto_571022 ?auto_571024 ) ) ( not ( = ?auto_571022 ?auto_571025 ) ) ( not ( = ?auto_571022 ?auto_571026 ) ) ( not ( = ?auto_571022 ?auto_571027 ) ) ( not ( = ?auto_571023 ?auto_571024 ) ) ( not ( = ?auto_571023 ?auto_571025 ) ) ( not ( = ?auto_571023 ?auto_571026 ) ) ( not ( = ?auto_571023 ?auto_571027 ) ) ( not ( = ?auto_571024 ?auto_571025 ) ) ( not ( = ?auto_571024 ?auto_571026 ) ) ( not ( = ?auto_571024 ?auto_571027 ) ) ( not ( = ?auto_571025 ?auto_571026 ) ) ( not ( = ?auto_571025 ?auto_571027 ) ) ( not ( = ?auto_571026 ?auto_571027 ) ) ( ON ?auto_571026 ?auto_571027 ) ( ON ?auto_571025 ?auto_571026 ) ( ON ?auto_571024 ?auto_571025 ) ( ON ?auto_571023 ?auto_571024 ) ( ON ?auto_571022 ?auto_571023 ) ( ON ?auto_571021 ?auto_571022 ) ( CLEAR ?auto_571019 ) ( ON ?auto_571020 ?auto_571021 ) ( CLEAR ?auto_571020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_571012 ?auto_571013 ?auto_571014 ?auto_571015 ?auto_571016 ?auto_571017 ?auto_571018 ?auto_571019 ?auto_571020 )
      ( MAKE-16PILE ?auto_571012 ?auto_571013 ?auto_571014 ?auto_571015 ?auto_571016 ?auto_571017 ?auto_571018 ?auto_571019 ?auto_571020 ?auto_571021 ?auto_571022 ?auto_571023 ?auto_571024 ?auto_571025 ?auto_571026 ?auto_571027 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_571044 - BLOCK
      ?auto_571045 - BLOCK
      ?auto_571046 - BLOCK
      ?auto_571047 - BLOCK
      ?auto_571048 - BLOCK
      ?auto_571049 - BLOCK
      ?auto_571050 - BLOCK
      ?auto_571051 - BLOCK
      ?auto_571052 - BLOCK
      ?auto_571053 - BLOCK
      ?auto_571054 - BLOCK
      ?auto_571055 - BLOCK
      ?auto_571056 - BLOCK
      ?auto_571057 - BLOCK
      ?auto_571058 - BLOCK
      ?auto_571059 - BLOCK
    )
    :vars
    (
      ?auto_571060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_571059 ?auto_571060 ) ( ON-TABLE ?auto_571044 ) ( ON ?auto_571045 ?auto_571044 ) ( ON ?auto_571046 ?auto_571045 ) ( ON ?auto_571047 ?auto_571046 ) ( ON ?auto_571048 ?auto_571047 ) ( ON ?auto_571049 ?auto_571048 ) ( ON ?auto_571050 ?auto_571049 ) ( not ( = ?auto_571044 ?auto_571045 ) ) ( not ( = ?auto_571044 ?auto_571046 ) ) ( not ( = ?auto_571044 ?auto_571047 ) ) ( not ( = ?auto_571044 ?auto_571048 ) ) ( not ( = ?auto_571044 ?auto_571049 ) ) ( not ( = ?auto_571044 ?auto_571050 ) ) ( not ( = ?auto_571044 ?auto_571051 ) ) ( not ( = ?auto_571044 ?auto_571052 ) ) ( not ( = ?auto_571044 ?auto_571053 ) ) ( not ( = ?auto_571044 ?auto_571054 ) ) ( not ( = ?auto_571044 ?auto_571055 ) ) ( not ( = ?auto_571044 ?auto_571056 ) ) ( not ( = ?auto_571044 ?auto_571057 ) ) ( not ( = ?auto_571044 ?auto_571058 ) ) ( not ( = ?auto_571044 ?auto_571059 ) ) ( not ( = ?auto_571044 ?auto_571060 ) ) ( not ( = ?auto_571045 ?auto_571046 ) ) ( not ( = ?auto_571045 ?auto_571047 ) ) ( not ( = ?auto_571045 ?auto_571048 ) ) ( not ( = ?auto_571045 ?auto_571049 ) ) ( not ( = ?auto_571045 ?auto_571050 ) ) ( not ( = ?auto_571045 ?auto_571051 ) ) ( not ( = ?auto_571045 ?auto_571052 ) ) ( not ( = ?auto_571045 ?auto_571053 ) ) ( not ( = ?auto_571045 ?auto_571054 ) ) ( not ( = ?auto_571045 ?auto_571055 ) ) ( not ( = ?auto_571045 ?auto_571056 ) ) ( not ( = ?auto_571045 ?auto_571057 ) ) ( not ( = ?auto_571045 ?auto_571058 ) ) ( not ( = ?auto_571045 ?auto_571059 ) ) ( not ( = ?auto_571045 ?auto_571060 ) ) ( not ( = ?auto_571046 ?auto_571047 ) ) ( not ( = ?auto_571046 ?auto_571048 ) ) ( not ( = ?auto_571046 ?auto_571049 ) ) ( not ( = ?auto_571046 ?auto_571050 ) ) ( not ( = ?auto_571046 ?auto_571051 ) ) ( not ( = ?auto_571046 ?auto_571052 ) ) ( not ( = ?auto_571046 ?auto_571053 ) ) ( not ( = ?auto_571046 ?auto_571054 ) ) ( not ( = ?auto_571046 ?auto_571055 ) ) ( not ( = ?auto_571046 ?auto_571056 ) ) ( not ( = ?auto_571046 ?auto_571057 ) ) ( not ( = ?auto_571046 ?auto_571058 ) ) ( not ( = ?auto_571046 ?auto_571059 ) ) ( not ( = ?auto_571046 ?auto_571060 ) ) ( not ( = ?auto_571047 ?auto_571048 ) ) ( not ( = ?auto_571047 ?auto_571049 ) ) ( not ( = ?auto_571047 ?auto_571050 ) ) ( not ( = ?auto_571047 ?auto_571051 ) ) ( not ( = ?auto_571047 ?auto_571052 ) ) ( not ( = ?auto_571047 ?auto_571053 ) ) ( not ( = ?auto_571047 ?auto_571054 ) ) ( not ( = ?auto_571047 ?auto_571055 ) ) ( not ( = ?auto_571047 ?auto_571056 ) ) ( not ( = ?auto_571047 ?auto_571057 ) ) ( not ( = ?auto_571047 ?auto_571058 ) ) ( not ( = ?auto_571047 ?auto_571059 ) ) ( not ( = ?auto_571047 ?auto_571060 ) ) ( not ( = ?auto_571048 ?auto_571049 ) ) ( not ( = ?auto_571048 ?auto_571050 ) ) ( not ( = ?auto_571048 ?auto_571051 ) ) ( not ( = ?auto_571048 ?auto_571052 ) ) ( not ( = ?auto_571048 ?auto_571053 ) ) ( not ( = ?auto_571048 ?auto_571054 ) ) ( not ( = ?auto_571048 ?auto_571055 ) ) ( not ( = ?auto_571048 ?auto_571056 ) ) ( not ( = ?auto_571048 ?auto_571057 ) ) ( not ( = ?auto_571048 ?auto_571058 ) ) ( not ( = ?auto_571048 ?auto_571059 ) ) ( not ( = ?auto_571048 ?auto_571060 ) ) ( not ( = ?auto_571049 ?auto_571050 ) ) ( not ( = ?auto_571049 ?auto_571051 ) ) ( not ( = ?auto_571049 ?auto_571052 ) ) ( not ( = ?auto_571049 ?auto_571053 ) ) ( not ( = ?auto_571049 ?auto_571054 ) ) ( not ( = ?auto_571049 ?auto_571055 ) ) ( not ( = ?auto_571049 ?auto_571056 ) ) ( not ( = ?auto_571049 ?auto_571057 ) ) ( not ( = ?auto_571049 ?auto_571058 ) ) ( not ( = ?auto_571049 ?auto_571059 ) ) ( not ( = ?auto_571049 ?auto_571060 ) ) ( not ( = ?auto_571050 ?auto_571051 ) ) ( not ( = ?auto_571050 ?auto_571052 ) ) ( not ( = ?auto_571050 ?auto_571053 ) ) ( not ( = ?auto_571050 ?auto_571054 ) ) ( not ( = ?auto_571050 ?auto_571055 ) ) ( not ( = ?auto_571050 ?auto_571056 ) ) ( not ( = ?auto_571050 ?auto_571057 ) ) ( not ( = ?auto_571050 ?auto_571058 ) ) ( not ( = ?auto_571050 ?auto_571059 ) ) ( not ( = ?auto_571050 ?auto_571060 ) ) ( not ( = ?auto_571051 ?auto_571052 ) ) ( not ( = ?auto_571051 ?auto_571053 ) ) ( not ( = ?auto_571051 ?auto_571054 ) ) ( not ( = ?auto_571051 ?auto_571055 ) ) ( not ( = ?auto_571051 ?auto_571056 ) ) ( not ( = ?auto_571051 ?auto_571057 ) ) ( not ( = ?auto_571051 ?auto_571058 ) ) ( not ( = ?auto_571051 ?auto_571059 ) ) ( not ( = ?auto_571051 ?auto_571060 ) ) ( not ( = ?auto_571052 ?auto_571053 ) ) ( not ( = ?auto_571052 ?auto_571054 ) ) ( not ( = ?auto_571052 ?auto_571055 ) ) ( not ( = ?auto_571052 ?auto_571056 ) ) ( not ( = ?auto_571052 ?auto_571057 ) ) ( not ( = ?auto_571052 ?auto_571058 ) ) ( not ( = ?auto_571052 ?auto_571059 ) ) ( not ( = ?auto_571052 ?auto_571060 ) ) ( not ( = ?auto_571053 ?auto_571054 ) ) ( not ( = ?auto_571053 ?auto_571055 ) ) ( not ( = ?auto_571053 ?auto_571056 ) ) ( not ( = ?auto_571053 ?auto_571057 ) ) ( not ( = ?auto_571053 ?auto_571058 ) ) ( not ( = ?auto_571053 ?auto_571059 ) ) ( not ( = ?auto_571053 ?auto_571060 ) ) ( not ( = ?auto_571054 ?auto_571055 ) ) ( not ( = ?auto_571054 ?auto_571056 ) ) ( not ( = ?auto_571054 ?auto_571057 ) ) ( not ( = ?auto_571054 ?auto_571058 ) ) ( not ( = ?auto_571054 ?auto_571059 ) ) ( not ( = ?auto_571054 ?auto_571060 ) ) ( not ( = ?auto_571055 ?auto_571056 ) ) ( not ( = ?auto_571055 ?auto_571057 ) ) ( not ( = ?auto_571055 ?auto_571058 ) ) ( not ( = ?auto_571055 ?auto_571059 ) ) ( not ( = ?auto_571055 ?auto_571060 ) ) ( not ( = ?auto_571056 ?auto_571057 ) ) ( not ( = ?auto_571056 ?auto_571058 ) ) ( not ( = ?auto_571056 ?auto_571059 ) ) ( not ( = ?auto_571056 ?auto_571060 ) ) ( not ( = ?auto_571057 ?auto_571058 ) ) ( not ( = ?auto_571057 ?auto_571059 ) ) ( not ( = ?auto_571057 ?auto_571060 ) ) ( not ( = ?auto_571058 ?auto_571059 ) ) ( not ( = ?auto_571058 ?auto_571060 ) ) ( not ( = ?auto_571059 ?auto_571060 ) ) ( ON ?auto_571058 ?auto_571059 ) ( ON ?auto_571057 ?auto_571058 ) ( ON ?auto_571056 ?auto_571057 ) ( ON ?auto_571055 ?auto_571056 ) ( ON ?auto_571054 ?auto_571055 ) ( ON ?auto_571053 ?auto_571054 ) ( ON ?auto_571052 ?auto_571053 ) ( CLEAR ?auto_571050 ) ( ON ?auto_571051 ?auto_571052 ) ( CLEAR ?auto_571051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_571044 ?auto_571045 ?auto_571046 ?auto_571047 ?auto_571048 ?auto_571049 ?auto_571050 ?auto_571051 )
      ( MAKE-16PILE ?auto_571044 ?auto_571045 ?auto_571046 ?auto_571047 ?auto_571048 ?auto_571049 ?auto_571050 ?auto_571051 ?auto_571052 ?auto_571053 ?auto_571054 ?auto_571055 ?auto_571056 ?auto_571057 ?auto_571058 ?auto_571059 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_571077 - BLOCK
      ?auto_571078 - BLOCK
      ?auto_571079 - BLOCK
      ?auto_571080 - BLOCK
      ?auto_571081 - BLOCK
      ?auto_571082 - BLOCK
      ?auto_571083 - BLOCK
      ?auto_571084 - BLOCK
      ?auto_571085 - BLOCK
      ?auto_571086 - BLOCK
      ?auto_571087 - BLOCK
      ?auto_571088 - BLOCK
      ?auto_571089 - BLOCK
      ?auto_571090 - BLOCK
      ?auto_571091 - BLOCK
      ?auto_571092 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_571092 ) ( ON-TABLE ?auto_571077 ) ( ON ?auto_571078 ?auto_571077 ) ( ON ?auto_571079 ?auto_571078 ) ( ON ?auto_571080 ?auto_571079 ) ( ON ?auto_571081 ?auto_571080 ) ( ON ?auto_571082 ?auto_571081 ) ( ON ?auto_571083 ?auto_571082 ) ( not ( = ?auto_571077 ?auto_571078 ) ) ( not ( = ?auto_571077 ?auto_571079 ) ) ( not ( = ?auto_571077 ?auto_571080 ) ) ( not ( = ?auto_571077 ?auto_571081 ) ) ( not ( = ?auto_571077 ?auto_571082 ) ) ( not ( = ?auto_571077 ?auto_571083 ) ) ( not ( = ?auto_571077 ?auto_571084 ) ) ( not ( = ?auto_571077 ?auto_571085 ) ) ( not ( = ?auto_571077 ?auto_571086 ) ) ( not ( = ?auto_571077 ?auto_571087 ) ) ( not ( = ?auto_571077 ?auto_571088 ) ) ( not ( = ?auto_571077 ?auto_571089 ) ) ( not ( = ?auto_571077 ?auto_571090 ) ) ( not ( = ?auto_571077 ?auto_571091 ) ) ( not ( = ?auto_571077 ?auto_571092 ) ) ( not ( = ?auto_571078 ?auto_571079 ) ) ( not ( = ?auto_571078 ?auto_571080 ) ) ( not ( = ?auto_571078 ?auto_571081 ) ) ( not ( = ?auto_571078 ?auto_571082 ) ) ( not ( = ?auto_571078 ?auto_571083 ) ) ( not ( = ?auto_571078 ?auto_571084 ) ) ( not ( = ?auto_571078 ?auto_571085 ) ) ( not ( = ?auto_571078 ?auto_571086 ) ) ( not ( = ?auto_571078 ?auto_571087 ) ) ( not ( = ?auto_571078 ?auto_571088 ) ) ( not ( = ?auto_571078 ?auto_571089 ) ) ( not ( = ?auto_571078 ?auto_571090 ) ) ( not ( = ?auto_571078 ?auto_571091 ) ) ( not ( = ?auto_571078 ?auto_571092 ) ) ( not ( = ?auto_571079 ?auto_571080 ) ) ( not ( = ?auto_571079 ?auto_571081 ) ) ( not ( = ?auto_571079 ?auto_571082 ) ) ( not ( = ?auto_571079 ?auto_571083 ) ) ( not ( = ?auto_571079 ?auto_571084 ) ) ( not ( = ?auto_571079 ?auto_571085 ) ) ( not ( = ?auto_571079 ?auto_571086 ) ) ( not ( = ?auto_571079 ?auto_571087 ) ) ( not ( = ?auto_571079 ?auto_571088 ) ) ( not ( = ?auto_571079 ?auto_571089 ) ) ( not ( = ?auto_571079 ?auto_571090 ) ) ( not ( = ?auto_571079 ?auto_571091 ) ) ( not ( = ?auto_571079 ?auto_571092 ) ) ( not ( = ?auto_571080 ?auto_571081 ) ) ( not ( = ?auto_571080 ?auto_571082 ) ) ( not ( = ?auto_571080 ?auto_571083 ) ) ( not ( = ?auto_571080 ?auto_571084 ) ) ( not ( = ?auto_571080 ?auto_571085 ) ) ( not ( = ?auto_571080 ?auto_571086 ) ) ( not ( = ?auto_571080 ?auto_571087 ) ) ( not ( = ?auto_571080 ?auto_571088 ) ) ( not ( = ?auto_571080 ?auto_571089 ) ) ( not ( = ?auto_571080 ?auto_571090 ) ) ( not ( = ?auto_571080 ?auto_571091 ) ) ( not ( = ?auto_571080 ?auto_571092 ) ) ( not ( = ?auto_571081 ?auto_571082 ) ) ( not ( = ?auto_571081 ?auto_571083 ) ) ( not ( = ?auto_571081 ?auto_571084 ) ) ( not ( = ?auto_571081 ?auto_571085 ) ) ( not ( = ?auto_571081 ?auto_571086 ) ) ( not ( = ?auto_571081 ?auto_571087 ) ) ( not ( = ?auto_571081 ?auto_571088 ) ) ( not ( = ?auto_571081 ?auto_571089 ) ) ( not ( = ?auto_571081 ?auto_571090 ) ) ( not ( = ?auto_571081 ?auto_571091 ) ) ( not ( = ?auto_571081 ?auto_571092 ) ) ( not ( = ?auto_571082 ?auto_571083 ) ) ( not ( = ?auto_571082 ?auto_571084 ) ) ( not ( = ?auto_571082 ?auto_571085 ) ) ( not ( = ?auto_571082 ?auto_571086 ) ) ( not ( = ?auto_571082 ?auto_571087 ) ) ( not ( = ?auto_571082 ?auto_571088 ) ) ( not ( = ?auto_571082 ?auto_571089 ) ) ( not ( = ?auto_571082 ?auto_571090 ) ) ( not ( = ?auto_571082 ?auto_571091 ) ) ( not ( = ?auto_571082 ?auto_571092 ) ) ( not ( = ?auto_571083 ?auto_571084 ) ) ( not ( = ?auto_571083 ?auto_571085 ) ) ( not ( = ?auto_571083 ?auto_571086 ) ) ( not ( = ?auto_571083 ?auto_571087 ) ) ( not ( = ?auto_571083 ?auto_571088 ) ) ( not ( = ?auto_571083 ?auto_571089 ) ) ( not ( = ?auto_571083 ?auto_571090 ) ) ( not ( = ?auto_571083 ?auto_571091 ) ) ( not ( = ?auto_571083 ?auto_571092 ) ) ( not ( = ?auto_571084 ?auto_571085 ) ) ( not ( = ?auto_571084 ?auto_571086 ) ) ( not ( = ?auto_571084 ?auto_571087 ) ) ( not ( = ?auto_571084 ?auto_571088 ) ) ( not ( = ?auto_571084 ?auto_571089 ) ) ( not ( = ?auto_571084 ?auto_571090 ) ) ( not ( = ?auto_571084 ?auto_571091 ) ) ( not ( = ?auto_571084 ?auto_571092 ) ) ( not ( = ?auto_571085 ?auto_571086 ) ) ( not ( = ?auto_571085 ?auto_571087 ) ) ( not ( = ?auto_571085 ?auto_571088 ) ) ( not ( = ?auto_571085 ?auto_571089 ) ) ( not ( = ?auto_571085 ?auto_571090 ) ) ( not ( = ?auto_571085 ?auto_571091 ) ) ( not ( = ?auto_571085 ?auto_571092 ) ) ( not ( = ?auto_571086 ?auto_571087 ) ) ( not ( = ?auto_571086 ?auto_571088 ) ) ( not ( = ?auto_571086 ?auto_571089 ) ) ( not ( = ?auto_571086 ?auto_571090 ) ) ( not ( = ?auto_571086 ?auto_571091 ) ) ( not ( = ?auto_571086 ?auto_571092 ) ) ( not ( = ?auto_571087 ?auto_571088 ) ) ( not ( = ?auto_571087 ?auto_571089 ) ) ( not ( = ?auto_571087 ?auto_571090 ) ) ( not ( = ?auto_571087 ?auto_571091 ) ) ( not ( = ?auto_571087 ?auto_571092 ) ) ( not ( = ?auto_571088 ?auto_571089 ) ) ( not ( = ?auto_571088 ?auto_571090 ) ) ( not ( = ?auto_571088 ?auto_571091 ) ) ( not ( = ?auto_571088 ?auto_571092 ) ) ( not ( = ?auto_571089 ?auto_571090 ) ) ( not ( = ?auto_571089 ?auto_571091 ) ) ( not ( = ?auto_571089 ?auto_571092 ) ) ( not ( = ?auto_571090 ?auto_571091 ) ) ( not ( = ?auto_571090 ?auto_571092 ) ) ( not ( = ?auto_571091 ?auto_571092 ) ) ( ON ?auto_571091 ?auto_571092 ) ( ON ?auto_571090 ?auto_571091 ) ( ON ?auto_571089 ?auto_571090 ) ( ON ?auto_571088 ?auto_571089 ) ( ON ?auto_571087 ?auto_571088 ) ( ON ?auto_571086 ?auto_571087 ) ( ON ?auto_571085 ?auto_571086 ) ( CLEAR ?auto_571083 ) ( ON ?auto_571084 ?auto_571085 ) ( CLEAR ?auto_571084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_571077 ?auto_571078 ?auto_571079 ?auto_571080 ?auto_571081 ?auto_571082 ?auto_571083 ?auto_571084 )
      ( MAKE-16PILE ?auto_571077 ?auto_571078 ?auto_571079 ?auto_571080 ?auto_571081 ?auto_571082 ?auto_571083 ?auto_571084 ?auto_571085 ?auto_571086 ?auto_571087 ?auto_571088 ?auto_571089 ?auto_571090 ?auto_571091 ?auto_571092 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_571109 - BLOCK
      ?auto_571110 - BLOCK
      ?auto_571111 - BLOCK
      ?auto_571112 - BLOCK
      ?auto_571113 - BLOCK
      ?auto_571114 - BLOCK
      ?auto_571115 - BLOCK
      ?auto_571116 - BLOCK
      ?auto_571117 - BLOCK
      ?auto_571118 - BLOCK
      ?auto_571119 - BLOCK
      ?auto_571120 - BLOCK
      ?auto_571121 - BLOCK
      ?auto_571122 - BLOCK
      ?auto_571123 - BLOCK
      ?auto_571124 - BLOCK
    )
    :vars
    (
      ?auto_571125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_571124 ?auto_571125 ) ( ON-TABLE ?auto_571109 ) ( ON ?auto_571110 ?auto_571109 ) ( ON ?auto_571111 ?auto_571110 ) ( ON ?auto_571112 ?auto_571111 ) ( ON ?auto_571113 ?auto_571112 ) ( ON ?auto_571114 ?auto_571113 ) ( not ( = ?auto_571109 ?auto_571110 ) ) ( not ( = ?auto_571109 ?auto_571111 ) ) ( not ( = ?auto_571109 ?auto_571112 ) ) ( not ( = ?auto_571109 ?auto_571113 ) ) ( not ( = ?auto_571109 ?auto_571114 ) ) ( not ( = ?auto_571109 ?auto_571115 ) ) ( not ( = ?auto_571109 ?auto_571116 ) ) ( not ( = ?auto_571109 ?auto_571117 ) ) ( not ( = ?auto_571109 ?auto_571118 ) ) ( not ( = ?auto_571109 ?auto_571119 ) ) ( not ( = ?auto_571109 ?auto_571120 ) ) ( not ( = ?auto_571109 ?auto_571121 ) ) ( not ( = ?auto_571109 ?auto_571122 ) ) ( not ( = ?auto_571109 ?auto_571123 ) ) ( not ( = ?auto_571109 ?auto_571124 ) ) ( not ( = ?auto_571109 ?auto_571125 ) ) ( not ( = ?auto_571110 ?auto_571111 ) ) ( not ( = ?auto_571110 ?auto_571112 ) ) ( not ( = ?auto_571110 ?auto_571113 ) ) ( not ( = ?auto_571110 ?auto_571114 ) ) ( not ( = ?auto_571110 ?auto_571115 ) ) ( not ( = ?auto_571110 ?auto_571116 ) ) ( not ( = ?auto_571110 ?auto_571117 ) ) ( not ( = ?auto_571110 ?auto_571118 ) ) ( not ( = ?auto_571110 ?auto_571119 ) ) ( not ( = ?auto_571110 ?auto_571120 ) ) ( not ( = ?auto_571110 ?auto_571121 ) ) ( not ( = ?auto_571110 ?auto_571122 ) ) ( not ( = ?auto_571110 ?auto_571123 ) ) ( not ( = ?auto_571110 ?auto_571124 ) ) ( not ( = ?auto_571110 ?auto_571125 ) ) ( not ( = ?auto_571111 ?auto_571112 ) ) ( not ( = ?auto_571111 ?auto_571113 ) ) ( not ( = ?auto_571111 ?auto_571114 ) ) ( not ( = ?auto_571111 ?auto_571115 ) ) ( not ( = ?auto_571111 ?auto_571116 ) ) ( not ( = ?auto_571111 ?auto_571117 ) ) ( not ( = ?auto_571111 ?auto_571118 ) ) ( not ( = ?auto_571111 ?auto_571119 ) ) ( not ( = ?auto_571111 ?auto_571120 ) ) ( not ( = ?auto_571111 ?auto_571121 ) ) ( not ( = ?auto_571111 ?auto_571122 ) ) ( not ( = ?auto_571111 ?auto_571123 ) ) ( not ( = ?auto_571111 ?auto_571124 ) ) ( not ( = ?auto_571111 ?auto_571125 ) ) ( not ( = ?auto_571112 ?auto_571113 ) ) ( not ( = ?auto_571112 ?auto_571114 ) ) ( not ( = ?auto_571112 ?auto_571115 ) ) ( not ( = ?auto_571112 ?auto_571116 ) ) ( not ( = ?auto_571112 ?auto_571117 ) ) ( not ( = ?auto_571112 ?auto_571118 ) ) ( not ( = ?auto_571112 ?auto_571119 ) ) ( not ( = ?auto_571112 ?auto_571120 ) ) ( not ( = ?auto_571112 ?auto_571121 ) ) ( not ( = ?auto_571112 ?auto_571122 ) ) ( not ( = ?auto_571112 ?auto_571123 ) ) ( not ( = ?auto_571112 ?auto_571124 ) ) ( not ( = ?auto_571112 ?auto_571125 ) ) ( not ( = ?auto_571113 ?auto_571114 ) ) ( not ( = ?auto_571113 ?auto_571115 ) ) ( not ( = ?auto_571113 ?auto_571116 ) ) ( not ( = ?auto_571113 ?auto_571117 ) ) ( not ( = ?auto_571113 ?auto_571118 ) ) ( not ( = ?auto_571113 ?auto_571119 ) ) ( not ( = ?auto_571113 ?auto_571120 ) ) ( not ( = ?auto_571113 ?auto_571121 ) ) ( not ( = ?auto_571113 ?auto_571122 ) ) ( not ( = ?auto_571113 ?auto_571123 ) ) ( not ( = ?auto_571113 ?auto_571124 ) ) ( not ( = ?auto_571113 ?auto_571125 ) ) ( not ( = ?auto_571114 ?auto_571115 ) ) ( not ( = ?auto_571114 ?auto_571116 ) ) ( not ( = ?auto_571114 ?auto_571117 ) ) ( not ( = ?auto_571114 ?auto_571118 ) ) ( not ( = ?auto_571114 ?auto_571119 ) ) ( not ( = ?auto_571114 ?auto_571120 ) ) ( not ( = ?auto_571114 ?auto_571121 ) ) ( not ( = ?auto_571114 ?auto_571122 ) ) ( not ( = ?auto_571114 ?auto_571123 ) ) ( not ( = ?auto_571114 ?auto_571124 ) ) ( not ( = ?auto_571114 ?auto_571125 ) ) ( not ( = ?auto_571115 ?auto_571116 ) ) ( not ( = ?auto_571115 ?auto_571117 ) ) ( not ( = ?auto_571115 ?auto_571118 ) ) ( not ( = ?auto_571115 ?auto_571119 ) ) ( not ( = ?auto_571115 ?auto_571120 ) ) ( not ( = ?auto_571115 ?auto_571121 ) ) ( not ( = ?auto_571115 ?auto_571122 ) ) ( not ( = ?auto_571115 ?auto_571123 ) ) ( not ( = ?auto_571115 ?auto_571124 ) ) ( not ( = ?auto_571115 ?auto_571125 ) ) ( not ( = ?auto_571116 ?auto_571117 ) ) ( not ( = ?auto_571116 ?auto_571118 ) ) ( not ( = ?auto_571116 ?auto_571119 ) ) ( not ( = ?auto_571116 ?auto_571120 ) ) ( not ( = ?auto_571116 ?auto_571121 ) ) ( not ( = ?auto_571116 ?auto_571122 ) ) ( not ( = ?auto_571116 ?auto_571123 ) ) ( not ( = ?auto_571116 ?auto_571124 ) ) ( not ( = ?auto_571116 ?auto_571125 ) ) ( not ( = ?auto_571117 ?auto_571118 ) ) ( not ( = ?auto_571117 ?auto_571119 ) ) ( not ( = ?auto_571117 ?auto_571120 ) ) ( not ( = ?auto_571117 ?auto_571121 ) ) ( not ( = ?auto_571117 ?auto_571122 ) ) ( not ( = ?auto_571117 ?auto_571123 ) ) ( not ( = ?auto_571117 ?auto_571124 ) ) ( not ( = ?auto_571117 ?auto_571125 ) ) ( not ( = ?auto_571118 ?auto_571119 ) ) ( not ( = ?auto_571118 ?auto_571120 ) ) ( not ( = ?auto_571118 ?auto_571121 ) ) ( not ( = ?auto_571118 ?auto_571122 ) ) ( not ( = ?auto_571118 ?auto_571123 ) ) ( not ( = ?auto_571118 ?auto_571124 ) ) ( not ( = ?auto_571118 ?auto_571125 ) ) ( not ( = ?auto_571119 ?auto_571120 ) ) ( not ( = ?auto_571119 ?auto_571121 ) ) ( not ( = ?auto_571119 ?auto_571122 ) ) ( not ( = ?auto_571119 ?auto_571123 ) ) ( not ( = ?auto_571119 ?auto_571124 ) ) ( not ( = ?auto_571119 ?auto_571125 ) ) ( not ( = ?auto_571120 ?auto_571121 ) ) ( not ( = ?auto_571120 ?auto_571122 ) ) ( not ( = ?auto_571120 ?auto_571123 ) ) ( not ( = ?auto_571120 ?auto_571124 ) ) ( not ( = ?auto_571120 ?auto_571125 ) ) ( not ( = ?auto_571121 ?auto_571122 ) ) ( not ( = ?auto_571121 ?auto_571123 ) ) ( not ( = ?auto_571121 ?auto_571124 ) ) ( not ( = ?auto_571121 ?auto_571125 ) ) ( not ( = ?auto_571122 ?auto_571123 ) ) ( not ( = ?auto_571122 ?auto_571124 ) ) ( not ( = ?auto_571122 ?auto_571125 ) ) ( not ( = ?auto_571123 ?auto_571124 ) ) ( not ( = ?auto_571123 ?auto_571125 ) ) ( not ( = ?auto_571124 ?auto_571125 ) ) ( ON ?auto_571123 ?auto_571124 ) ( ON ?auto_571122 ?auto_571123 ) ( ON ?auto_571121 ?auto_571122 ) ( ON ?auto_571120 ?auto_571121 ) ( ON ?auto_571119 ?auto_571120 ) ( ON ?auto_571118 ?auto_571119 ) ( ON ?auto_571117 ?auto_571118 ) ( ON ?auto_571116 ?auto_571117 ) ( CLEAR ?auto_571114 ) ( ON ?auto_571115 ?auto_571116 ) ( CLEAR ?auto_571115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_571109 ?auto_571110 ?auto_571111 ?auto_571112 ?auto_571113 ?auto_571114 ?auto_571115 )
      ( MAKE-16PILE ?auto_571109 ?auto_571110 ?auto_571111 ?auto_571112 ?auto_571113 ?auto_571114 ?auto_571115 ?auto_571116 ?auto_571117 ?auto_571118 ?auto_571119 ?auto_571120 ?auto_571121 ?auto_571122 ?auto_571123 ?auto_571124 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_571142 - BLOCK
      ?auto_571143 - BLOCK
      ?auto_571144 - BLOCK
      ?auto_571145 - BLOCK
      ?auto_571146 - BLOCK
      ?auto_571147 - BLOCK
      ?auto_571148 - BLOCK
      ?auto_571149 - BLOCK
      ?auto_571150 - BLOCK
      ?auto_571151 - BLOCK
      ?auto_571152 - BLOCK
      ?auto_571153 - BLOCK
      ?auto_571154 - BLOCK
      ?auto_571155 - BLOCK
      ?auto_571156 - BLOCK
      ?auto_571157 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_571157 ) ( ON-TABLE ?auto_571142 ) ( ON ?auto_571143 ?auto_571142 ) ( ON ?auto_571144 ?auto_571143 ) ( ON ?auto_571145 ?auto_571144 ) ( ON ?auto_571146 ?auto_571145 ) ( ON ?auto_571147 ?auto_571146 ) ( not ( = ?auto_571142 ?auto_571143 ) ) ( not ( = ?auto_571142 ?auto_571144 ) ) ( not ( = ?auto_571142 ?auto_571145 ) ) ( not ( = ?auto_571142 ?auto_571146 ) ) ( not ( = ?auto_571142 ?auto_571147 ) ) ( not ( = ?auto_571142 ?auto_571148 ) ) ( not ( = ?auto_571142 ?auto_571149 ) ) ( not ( = ?auto_571142 ?auto_571150 ) ) ( not ( = ?auto_571142 ?auto_571151 ) ) ( not ( = ?auto_571142 ?auto_571152 ) ) ( not ( = ?auto_571142 ?auto_571153 ) ) ( not ( = ?auto_571142 ?auto_571154 ) ) ( not ( = ?auto_571142 ?auto_571155 ) ) ( not ( = ?auto_571142 ?auto_571156 ) ) ( not ( = ?auto_571142 ?auto_571157 ) ) ( not ( = ?auto_571143 ?auto_571144 ) ) ( not ( = ?auto_571143 ?auto_571145 ) ) ( not ( = ?auto_571143 ?auto_571146 ) ) ( not ( = ?auto_571143 ?auto_571147 ) ) ( not ( = ?auto_571143 ?auto_571148 ) ) ( not ( = ?auto_571143 ?auto_571149 ) ) ( not ( = ?auto_571143 ?auto_571150 ) ) ( not ( = ?auto_571143 ?auto_571151 ) ) ( not ( = ?auto_571143 ?auto_571152 ) ) ( not ( = ?auto_571143 ?auto_571153 ) ) ( not ( = ?auto_571143 ?auto_571154 ) ) ( not ( = ?auto_571143 ?auto_571155 ) ) ( not ( = ?auto_571143 ?auto_571156 ) ) ( not ( = ?auto_571143 ?auto_571157 ) ) ( not ( = ?auto_571144 ?auto_571145 ) ) ( not ( = ?auto_571144 ?auto_571146 ) ) ( not ( = ?auto_571144 ?auto_571147 ) ) ( not ( = ?auto_571144 ?auto_571148 ) ) ( not ( = ?auto_571144 ?auto_571149 ) ) ( not ( = ?auto_571144 ?auto_571150 ) ) ( not ( = ?auto_571144 ?auto_571151 ) ) ( not ( = ?auto_571144 ?auto_571152 ) ) ( not ( = ?auto_571144 ?auto_571153 ) ) ( not ( = ?auto_571144 ?auto_571154 ) ) ( not ( = ?auto_571144 ?auto_571155 ) ) ( not ( = ?auto_571144 ?auto_571156 ) ) ( not ( = ?auto_571144 ?auto_571157 ) ) ( not ( = ?auto_571145 ?auto_571146 ) ) ( not ( = ?auto_571145 ?auto_571147 ) ) ( not ( = ?auto_571145 ?auto_571148 ) ) ( not ( = ?auto_571145 ?auto_571149 ) ) ( not ( = ?auto_571145 ?auto_571150 ) ) ( not ( = ?auto_571145 ?auto_571151 ) ) ( not ( = ?auto_571145 ?auto_571152 ) ) ( not ( = ?auto_571145 ?auto_571153 ) ) ( not ( = ?auto_571145 ?auto_571154 ) ) ( not ( = ?auto_571145 ?auto_571155 ) ) ( not ( = ?auto_571145 ?auto_571156 ) ) ( not ( = ?auto_571145 ?auto_571157 ) ) ( not ( = ?auto_571146 ?auto_571147 ) ) ( not ( = ?auto_571146 ?auto_571148 ) ) ( not ( = ?auto_571146 ?auto_571149 ) ) ( not ( = ?auto_571146 ?auto_571150 ) ) ( not ( = ?auto_571146 ?auto_571151 ) ) ( not ( = ?auto_571146 ?auto_571152 ) ) ( not ( = ?auto_571146 ?auto_571153 ) ) ( not ( = ?auto_571146 ?auto_571154 ) ) ( not ( = ?auto_571146 ?auto_571155 ) ) ( not ( = ?auto_571146 ?auto_571156 ) ) ( not ( = ?auto_571146 ?auto_571157 ) ) ( not ( = ?auto_571147 ?auto_571148 ) ) ( not ( = ?auto_571147 ?auto_571149 ) ) ( not ( = ?auto_571147 ?auto_571150 ) ) ( not ( = ?auto_571147 ?auto_571151 ) ) ( not ( = ?auto_571147 ?auto_571152 ) ) ( not ( = ?auto_571147 ?auto_571153 ) ) ( not ( = ?auto_571147 ?auto_571154 ) ) ( not ( = ?auto_571147 ?auto_571155 ) ) ( not ( = ?auto_571147 ?auto_571156 ) ) ( not ( = ?auto_571147 ?auto_571157 ) ) ( not ( = ?auto_571148 ?auto_571149 ) ) ( not ( = ?auto_571148 ?auto_571150 ) ) ( not ( = ?auto_571148 ?auto_571151 ) ) ( not ( = ?auto_571148 ?auto_571152 ) ) ( not ( = ?auto_571148 ?auto_571153 ) ) ( not ( = ?auto_571148 ?auto_571154 ) ) ( not ( = ?auto_571148 ?auto_571155 ) ) ( not ( = ?auto_571148 ?auto_571156 ) ) ( not ( = ?auto_571148 ?auto_571157 ) ) ( not ( = ?auto_571149 ?auto_571150 ) ) ( not ( = ?auto_571149 ?auto_571151 ) ) ( not ( = ?auto_571149 ?auto_571152 ) ) ( not ( = ?auto_571149 ?auto_571153 ) ) ( not ( = ?auto_571149 ?auto_571154 ) ) ( not ( = ?auto_571149 ?auto_571155 ) ) ( not ( = ?auto_571149 ?auto_571156 ) ) ( not ( = ?auto_571149 ?auto_571157 ) ) ( not ( = ?auto_571150 ?auto_571151 ) ) ( not ( = ?auto_571150 ?auto_571152 ) ) ( not ( = ?auto_571150 ?auto_571153 ) ) ( not ( = ?auto_571150 ?auto_571154 ) ) ( not ( = ?auto_571150 ?auto_571155 ) ) ( not ( = ?auto_571150 ?auto_571156 ) ) ( not ( = ?auto_571150 ?auto_571157 ) ) ( not ( = ?auto_571151 ?auto_571152 ) ) ( not ( = ?auto_571151 ?auto_571153 ) ) ( not ( = ?auto_571151 ?auto_571154 ) ) ( not ( = ?auto_571151 ?auto_571155 ) ) ( not ( = ?auto_571151 ?auto_571156 ) ) ( not ( = ?auto_571151 ?auto_571157 ) ) ( not ( = ?auto_571152 ?auto_571153 ) ) ( not ( = ?auto_571152 ?auto_571154 ) ) ( not ( = ?auto_571152 ?auto_571155 ) ) ( not ( = ?auto_571152 ?auto_571156 ) ) ( not ( = ?auto_571152 ?auto_571157 ) ) ( not ( = ?auto_571153 ?auto_571154 ) ) ( not ( = ?auto_571153 ?auto_571155 ) ) ( not ( = ?auto_571153 ?auto_571156 ) ) ( not ( = ?auto_571153 ?auto_571157 ) ) ( not ( = ?auto_571154 ?auto_571155 ) ) ( not ( = ?auto_571154 ?auto_571156 ) ) ( not ( = ?auto_571154 ?auto_571157 ) ) ( not ( = ?auto_571155 ?auto_571156 ) ) ( not ( = ?auto_571155 ?auto_571157 ) ) ( not ( = ?auto_571156 ?auto_571157 ) ) ( ON ?auto_571156 ?auto_571157 ) ( ON ?auto_571155 ?auto_571156 ) ( ON ?auto_571154 ?auto_571155 ) ( ON ?auto_571153 ?auto_571154 ) ( ON ?auto_571152 ?auto_571153 ) ( ON ?auto_571151 ?auto_571152 ) ( ON ?auto_571150 ?auto_571151 ) ( ON ?auto_571149 ?auto_571150 ) ( CLEAR ?auto_571147 ) ( ON ?auto_571148 ?auto_571149 ) ( CLEAR ?auto_571148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_571142 ?auto_571143 ?auto_571144 ?auto_571145 ?auto_571146 ?auto_571147 ?auto_571148 )
      ( MAKE-16PILE ?auto_571142 ?auto_571143 ?auto_571144 ?auto_571145 ?auto_571146 ?auto_571147 ?auto_571148 ?auto_571149 ?auto_571150 ?auto_571151 ?auto_571152 ?auto_571153 ?auto_571154 ?auto_571155 ?auto_571156 ?auto_571157 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_571174 - BLOCK
      ?auto_571175 - BLOCK
      ?auto_571176 - BLOCK
      ?auto_571177 - BLOCK
      ?auto_571178 - BLOCK
      ?auto_571179 - BLOCK
      ?auto_571180 - BLOCK
      ?auto_571181 - BLOCK
      ?auto_571182 - BLOCK
      ?auto_571183 - BLOCK
      ?auto_571184 - BLOCK
      ?auto_571185 - BLOCK
      ?auto_571186 - BLOCK
      ?auto_571187 - BLOCK
      ?auto_571188 - BLOCK
      ?auto_571189 - BLOCK
    )
    :vars
    (
      ?auto_571190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_571189 ?auto_571190 ) ( ON-TABLE ?auto_571174 ) ( ON ?auto_571175 ?auto_571174 ) ( ON ?auto_571176 ?auto_571175 ) ( ON ?auto_571177 ?auto_571176 ) ( ON ?auto_571178 ?auto_571177 ) ( not ( = ?auto_571174 ?auto_571175 ) ) ( not ( = ?auto_571174 ?auto_571176 ) ) ( not ( = ?auto_571174 ?auto_571177 ) ) ( not ( = ?auto_571174 ?auto_571178 ) ) ( not ( = ?auto_571174 ?auto_571179 ) ) ( not ( = ?auto_571174 ?auto_571180 ) ) ( not ( = ?auto_571174 ?auto_571181 ) ) ( not ( = ?auto_571174 ?auto_571182 ) ) ( not ( = ?auto_571174 ?auto_571183 ) ) ( not ( = ?auto_571174 ?auto_571184 ) ) ( not ( = ?auto_571174 ?auto_571185 ) ) ( not ( = ?auto_571174 ?auto_571186 ) ) ( not ( = ?auto_571174 ?auto_571187 ) ) ( not ( = ?auto_571174 ?auto_571188 ) ) ( not ( = ?auto_571174 ?auto_571189 ) ) ( not ( = ?auto_571174 ?auto_571190 ) ) ( not ( = ?auto_571175 ?auto_571176 ) ) ( not ( = ?auto_571175 ?auto_571177 ) ) ( not ( = ?auto_571175 ?auto_571178 ) ) ( not ( = ?auto_571175 ?auto_571179 ) ) ( not ( = ?auto_571175 ?auto_571180 ) ) ( not ( = ?auto_571175 ?auto_571181 ) ) ( not ( = ?auto_571175 ?auto_571182 ) ) ( not ( = ?auto_571175 ?auto_571183 ) ) ( not ( = ?auto_571175 ?auto_571184 ) ) ( not ( = ?auto_571175 ?auto_571185 ) ) ( not ( = ?auto_571175 ?auto_571186 ) ) ( not ( = ?auto_571175 ?auto_571187 ) ) ( not ( = ?auto_571175 ?auto_571188 ) ) ( not ( = ?auto_571175 ?auto_571189 ) ) ( not ( = ?auto_571175 ?auto_571190 ) ) ( not ( = ?auto_571176 ?auto_571177 ) ) ( not ( = ?auto_571176 ?auto_571178 ) ) ( not ( = ?auto_571176 ?auto_571179 ) ) ( not ( = ?auto_571176 ?auto_571180 ) ) ( not ( = ?auto_571176 ?auto_571181 ) ) ( not ( = ?auto_571176 ?auto_571182 ) ) ( not ( = ?auto_571176 ?auto_571183 ) ) ( not ( = ?auto_571176 ?auto_571184 ) ) ( not ( = ?auto_571176 ?auto_571185 ) ) ( not ( = ?auto_571176 ?auto_571186 ) ) ( not ( = ?auto_571176 ?auto_571187 ) ) ( not ( = ?auto_571176 ?auto_571188 ) ) ( not ( = ?auto_571176 ?auto_571189 ) ) ( not ( = ?auto_571176 ?auto_571190 ) ) ( not ( = ?auto_571177 ?auto_571178 ) ) ( not ( = ?auto_571177 ?auto_571179 ) ) ( not ( = ?auto_571177 ?auto_571180 ) ) ( not ( = ?auto_571177 ?auto_571181 ) ) ( not ( = ?auto_571177 ?auto_571182 ) ) ( not ( = ?auto_571177 ?auto_571183 ) ) ( not ( = ?auto_571177 ?auto_571184 ) ) ( not ( = ?auto_571177 ?auto_571185 ) ) ( not ( = ?auto_571177 ?auto_571186 ) ) ( not ( = ?auto_571177 ?auto_571187 ) ) ( not ( = ?auto_571177 ?auto_571188 ) ) ( not ( = ?auto_571177 ?auto_571189 ) ) ( not ( = ?auto_571177 ?auto_571190 ) ) ( not ( = ?auto_571178 ?auto_571179 ) ) ( not ( = ?auto_571178 ?auto_571180 ) ) ( not ( = ?auto_571178 ?auto_571181 ) ) ( not ( = ?auto_571178 ?auto_571182 ) ) ( not ( = ?auto_571178 ?auto_571183 ) ) ( not ( = ?auto_571178 ?auto_571184 ) ) ( not ( = ?auto_571178 ?auto_571185 ) ) ( not ( = ?auto_571178 ?auto_571186 ) ) ( not ( = ?auto_571178 ?auto_571187 ) ) ( not ( = ?auto_571178 ?auto_571188 ) ) ( not ( = ?auto_571178 ?auto_571189 ) ) ( not ( = ?auto_571178 ?auto_571190 ) ) ( not ( = ?auto_571179 ?auto_571180 ) ) ( not ( = ?auto_571179 ?auto_571181 ) ) ( not ( = ?auto_571179 ?auto_571182 ) ) ( not ( = ?auto_571179 ?auto_571183 ) ) ( not ( = ?auto_571179 ?auto_571184 ) ) ( not ( = ?auto_571179 ?auto_571185 ) ) ( not ( = ?auto_571179 ?auto_571186 ) ) ( not ( = ?auto_571179 ?auto_571187 ) ) ( not ( = ?auto_571179 ?auto_571188 ) ) ( not ( = ?auto_571179 ?auto_571189 ) ) ( not ( = ?auto_571179 ?auto_571190 ) ) ( not ( = ?auto_571180 ?auto_571181 ) ) ( not ( = ?auto_571180 ?auto_571182 ) ) ( not ( = ?auto_571180 ?auto_571183 ) ) ( not ( = ?auto_571180 ?auto_571184 ) ) ( not ( = ?auto_571180 ?auto_571185 ) ) ( not ( = ?auto_571180 ?auto_571186 ) ) ( not ( = ?auto_571180 ?auto_571187 ) ) ( not ( = ?auto_571180 ?auto_571188 ) ) ( not ( = ?auto_571180 ?auto_571189 ) ) ( not ( = ?auto_571180 ?auto_571190 ) ) ( not ( = ?auto_571181 ?auto_571182 ) ) ( not ( = ?auto_571181 ?auto_571183 ) ) ( not ( = ?auto_571181 ?auto_571184 ) ) ( not ( = ?auto_571181 ?auto_571185 ) ) ( not ( = ?auto_571181 ?auto_571186 ) ) ( not ( = ?auto_571181 ?auto_571187 ) ) ( not ( = ?auto_571181 ?auto_571188 ) ) ( not ( = ?auto_571181 ?auto_571189 ) ) ( not ( = ?auto_571181 ?auto_571190 ) ) ( not ( = ?auto_571182 ?auto_571183 ) ) ( not ( = ?auto_571182 ?auto_571184 ) ) ( not ( = ?auto_571182 ?auto_571185 ) ) ( not ( = ?auto_571182 ?auto_571186 ) ) ( not ( = ?auto_571182 ?auto_571187 ) ) ( not ( = ?auto_571182 ?auto_571188 ) ) ( not ( = ?auto_571182 ?auto_571189 ) ) ( not ( = ?auto_571182 ?auto_571190 ) ) ( not ( = ?auto_571183 ?auto_571184 ) ) ( not ( = ?auto_571183 ?auto_571185 ) ) ( not ( = ?auto_571183 ?auto_571186 ) ) ( not ( = ?auto_571183 ?auto_571187 ) ) ( not ( = ?auto_571183 ?auto_571188 ) ) ( not ( = ?auto_571183 ?auto_571189 ) ) ( not ( = ?auto_571183 ?auto_571190 ) ) ( not ( = ?auto_571184 ?auto_571185 ) ) ( not ( = ?auto_571184 ?auto_571186 ) ) ( not ( = ?auto_571184 ?auto_571187 ) ) ( not ( = ?auto_571184 ?auto_571188 ) ) ( not ( = ?auto_571184 ?auto_571189 ) ) ( not ( = ?auto_571184 ?auto_571190 ) ) ( not ( = ?auto_571185 ?auto_571186 ) ) ( not ( = ?auto_571185 ?auto_571187 ) ) ( not ( = ?auto_571185 ?auto_571188 ) ) ( not ( = ?auto_571185 ?auto_571189 ) ) ( not ( = ?auto_571185 ?auto_571190 ) ) ( not ( = ?auto_571186 ?auto_571187 ) ) ( not ( = ?auto_571186 ?auto_571188 ) ) ( not ( = ?auto_571186 ?auto_571189 ) ) ( not ( = ?auto_571186 ?auto_571190 ) ) ( not ( = ?auto_571187 ?auto_571188 ) ) ( not ( = ?auto_571187 ?auto_571189 ) ) ( not ( = ?auto_571187 ?auto_571190 ) ) ( not ( = ?auto_571188 ?auto_571189 ) ) ( not ( = ?auto_571188 ?auto_571190 ) ) ( not ( = ?auto_571189 ?auto_571190 ) ) ( ON ?auto_571188 ?auto_571189 ) ( ON ?auto_571187 ?auto_571188 ) ( ON ?auto_571186 ?auto_571187 ) ( ON ?auto_571185 ?auto_571186 ) ( ON ?auto_571184 ?auto_571185 ) ( ON ?auto_571183 ?auto_571184 ) ( ON ?auto_571182 ?auto_571183 ) ( ON ?auto_571181 ?auto_571182 ) ( ON ?auto_571180 ?auto_571181 ) ( CLEAR ?auto_571178 ) ( ON ?auto_571179 ?auto_571180 ) ( CLEAR ?auto_571179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_571174 ?auto_571175 ?auto_571176 ?auto_571177 ?auto_571178 ?auto_571179 )
      ( MAKE-16PILE ?auto_571174 ?auto_571175 ?auto_571176 ?auto_571177 ?auto_571178 ?auto_571179 ?auto_571180 ?auto_571181 ?auto_571182 ?auto_571183 ?auto_571184 ?auto_571185 ?auto_571186 ?auto_571187 ?auto_571188 ?auto_571189 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_571207 - BLOCK
      ?auto_571208 - BLOCK
      ?auto_571209 - BLOCK
      ?auto_571210 - BLOCK
      ?auto_571211 - BLOCK
      ?auto_571212 - BLOCK
      ?auto_571213 - BLOCK
      ?auto_571214 - BLOCK
      ?auto_571215 - BLOCK
      ?auto_571216 - BLOCK
      ?auto_571217 - BLOCK
      ?auto_571218 - BLOCK
      ?auto_571219 - BLOCK
      ?auto_571220 - BLOCK
      ?auto_571221 - BLOCK
      ?auto_571222 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_571222 ) ( ON-TABLE ?auto_571207 ) ( ON ?auto_571208 ?auto_571207 ) ( ON ?auto_571209 ?auto_571208 ) ( ON ?auto_571210 ?auto_571209 ) ( ON ?auto_571211 ?auto_571210 ) ( not ( = ?auto_571207 ?auto_571208 ) ) ( not ( = ?auto_571207 ?auto_571209 ) ) ( not ( = ?auto_571207 ?auto_571210 ) ) ( not ( = ?auto_571207 ?auto_571211 ) ) ( not ( = ?auto_571207 ?auto_571212 ) ) ( not ( = ?auto_571207 ?auto_571213 ) ) ( not ( = ?auto_571207 ?auto_571214 ) ) ( not ( = ?auto_571207 ?auto_571215 ) ) ( not ( = ?auto_571207 ?auto_571216 ) ) ( not ( = ?auto_571207 ?auto_571217 ) ) ( not ( = ?auto_571207 ?auto_571218 ) ) ( not ( = ?auto_571207 ?auto_571219 ) ) ( not ( = ?auto_571207 ?auto_571220 ) ) ( not ( = ?auto_571207 ?auto_571221 ) ) ( not ( = ?auto_571207 ?auto_571222 ) ) ( not ( = ?auto_571208 ?auto_571209 ) ) ( not ( = ?auto_571208 ?auto_571210 ) ) ( not ( = ?auto_571208 ?auto_571211 ) ) ( not ( = ?auto_571208 ?auto_571212 ) ) ( not ( = ?auto_571208 ?auto_571213 ) ) ( not ( = ?auto_571208 ?auto_571214 ) ) ( not ( = ?auto_571208 ?auto_571215 ) ) ( not ( = ?auto_571208 ?auto_571216 ) ) ( not ( = ?auto_571208 ?auto_571217 ) ) ( not ( = ?auto_571208 ?auto_571218 ) ) ( not ( = ?auto_571208 ?auto_571219 ) ) ( not ( = ?auto_571208 ?auto_571220 ) ) ( not ( = ?auto_571208 ?auto_571221 ) ) ( not ( = ?auto_571208 ?auto_571222 ) ) ( not ( = ?auto_571209 ?auto_571210 ) ) ( not ( = ?auto_571209 ?auto_571211 ) ) ( not ( = ?auto_571209 ?auto_571212 ) ) ( not ( = ?auto_571209 ?auto_571213 ) ) ( not ( = ?auto_571209 ?auto_571214 ) ) ( not ( = ?auto_571209 ?auto_571215 ) ) ( not ( = ?auto_571209 ?auto_571216 ) ) ( not ( = ?auto_571209 ?auto_571217 ) ) ( not ( = ?auto_571209 ?auto_571218 ) ) ( not ( = ?auto_571209 ?auto_571219 ) ) ( not ( = ?auto_571209 ?auto_571220 ) ) ( not ( = ?auto_571209 ?auto_571221 ) ) ( not ( = ?auto_571209 ?auto_571222 ) ) ( not ( = ?auto_571210 ?auto_571211 ) ) ( not ( = ?auto_571210 ?auto_571212 ) ) ( not ( = ?auto_571210 ?auto_571213 ) ) ( not ( = ?auto_571210 ?auto_571214 ) ) ( not ( = ?auto_571210 ?auto_571215 ) ) ( not ( = ?auto_571210 ?auto_571216 ) ) ( not ( = ?auto_571210 ?auto_571217 ) ) ( not ( = ?auto_571210 ?auto_571218 ) ) ( not ( = ?auto_571210 ?auto_571219 ) ) ( not ( = ?auto_571210 ?auto_571220 ) ) ( not ( = ?auto_571210 ?auto_571221 ) ) ( not ( = ?auto_571210 ?auto_571222 ) ) ( not ( = ?auto_571211 ?auto_571212 ) ) ( not ( = ?auto_571211 ?auto_571213 ) ) ( not ( = ?auto_571211 ?auto_571214 ) ) ( not ( = ?auto_571211 ?auto_571215 ) ) ( not ( = ?auto_571211 ?auto_571216 ) ) ( not ( = ?auto_571211 ?auto_571217 ) ) ( not ( = ?auto_571211 ?auto_571218 ) ) ( not ( = ?auto_571211 ?auto_571219 ) ) ( not ( = ?auto_571211 ?auto_571220 ) ) ( not ( = ?auto_571211 ?auto_571221 ) ) ( not ( = ?auto_571211 ?auto_571222 ) ) ( not ( = ?auto_571212 ?auto_571213 ) ) ( not ( = ?auto_571212 ?auto_571214 ) ) ( not ( = ?auto_571212 ?auto_571215 ) ) ( not ( = ?auto_571212 ?auto_571216 ) ) ( not ( = ?auto_571212 ?auto_571217 ) ) ( not ( = ?auto_571212 ?auto_571218 ) ) ( not ( = ?auto_571212 ?auto_571219 ) ) ( not ( = ?auto_571212 ?auto_571220 ) ) ( not ( = ?auto_571212 ?auto_571221 ) ) ( not ( = ?auto_571212 ?auto_571222 ) ) ( not ( = ?auto_571213 ?auto_571214 ) ) ( not ( = ?auto_571213 ?auto_571215 ) ) ( not ( = ?auto_571213 ?auto_571216 ) ) ( not ( = ?auto_571213 ?auto_571217 ) ) ( not ( = ?auto_571213 ?auto_571218 ) ) ( not ( = ?auto_571213 ?auto_571219 ) ) ( not ( = ?auto_571213 ?auto_571220 ) ) ( not ( = ?auto_571213 ?auto_571221 ) ) ( not ( = ?auto_571213 ?auto_571222 ) ) ( not ( = ?auto_571214 ?auto_571215 ) ) ( not ( = ?auto_571214 ?auto_571216 ) ) ( not ( = ?auto_571214 ?auto_571217 ) ) ( not ( = ?auto_571214 ?auto_571218 ) ) ( not ( = ?auto_571214 ?auto_571219 ) ) ( not ( = ?auto_571214 ?auto_571220 ) ) ( not ( = ?auto_571214 ?auto_571221 ) ) ( not ( = ?auto_571214 ?auto_571222 ) ) ( not ( = ?auto_571215 ?auto_571216 ) ) ( not ( = ?auto_571215 ?auto_571217 ) ) ( not ( = ?auto_571215 ?auto_571218 ) ) ( not ( = ?auto_571215 ?auto_571219 ) ) ( not ( = ?auto_571215 ?auto_571220 ) ) ( not ( = ?auto_571215 ?auto_571221 ) ) ( not ( = ?auto_571215 ?auto_571222 ) ) ( not ( = ?auto_571216 ?auto_571217 ) ) ( not ( = ?auto_571216 ?auto_571218 ) ) ( not ( = ?auto_571216 ?auto_571219 ) ) ( not ( = ?auto_571216 ?auto_571220 ) ) ( not ( = ?auto_571216 ?auto_571221 ) ) ( not ( = ?auto_571216 ?auto_571222 ) ) ( not ( = ?auto_571217 ?auto_571218 ) ) ( not ( = ?auto_571217 ?auto_571219 ) ) ( not ( = ?auto_571217 ?auto_571220 ) ) ( not ( = ?auto_571217 ?auto_571221 ) ) ( not ( = ?auto_571217 ?auto_571222 ) ) ( not ( = ?auto_571218 ?auto_571219 ) ) ( not ( = ?auto_571218 ?auto_571220 ) ) ( not ( = ?auto_571218 ?auto_571221 ) ) ( not ( = ?auto_571218 ?auto_571222 ) ) ( not ( = ?auto_571219 ?auto_571220 ) ) ( not ( = ?auto_571219 ?auto_571221 ) ) ( not ( = ?auto_571219 ?auto_571222 ) ) ( not ( = ?auto_571220 ?auto_571221 ) ) ( not ( = ?auto_571220 ?auto_571222 ) ) ( not ( = ?auto_571221 ?auto_571222 ) ) ( ON ?auto_571221 ?auto_571222 ) ( ON ?auto_571220 ?auto_571221 ) ( ON ?auto_571219 ?auto_571220 ) ( ON ?auto_571218 ?auto_571219 ) ( ON ?auto_571217 ?auto_571218 ) ( ON ?auto_571216 ?auto_571217 ) ( ON ?auto_571215 ?auto_571216 ) ( ON ?auto_571214 ?auto_571215 ) ( ON ?auto_571213 ?auto_571214 ) ( CLEAR ?auto_571211 ) ( ON ?auto_571212 ?auto_571213 ) ( CLEAR ?auto_571212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_571207 ?auto_571208 ?auto_571209 ?auto_571210 ?auto_571211 ?auto_571212 )
      ( MAKE-16PILE ?auto_571207 ?auto_571208 ?auto_571209 ?auto_571210 ?auto_571211 ?auto_571212 ?auto_571213 ?auto_571214 ?auto_571215 ?auto_571216 ?auto_571217 ?auto_571218 ?auto_571219 ?auto_571220 ?auto_571221 ?auto_571222 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_571239 - BLOCK
      ?auto_571240 - BLOCK
      ?auto_571241 - BLOCK
      ?auto_571242 - BLOCK
      ?auto_571243 - BLOCK
      ?auto_571244 - BLOCK
      ?auto_571245 - BLOCK
      ?auto_571246 - BLOCK
      ?auto_571247 - BLOCK
      ?auto_571248 - BLOCK
      ?auto_571249 - BLOCK
      ?auto_571250 - BLOCK
      ?auto_571251 - BLOCK
      ?auto_571252 - BLOCK
      ?auto_571253 - BLOCK
      ?auto_571254 - BLOCK
    )
    :vars
    (
      ?auto_571255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_571254 ?auto_571255 ) ( ON-TABLE ?auto_571239 ) ( ON ?auto_571240 ?auto_571239 ) ( ON ?auto_571241 ?auto_571240 ) ( ON ?auto_571242 ?auto_571241 ) ( not ( = ?auto_571239 ?auto_571240 ) ) ( not ( = ?auto_571239 ?auto_571241 ) ) ( not ( = ?auto_571239 ?auto_571242 ) ) ( not ( = ?auto_571239 ?auto_571243 ) ) ( not ( = ?auto_571239 ?auto_571244 ) ) ( not ( = ?auto_571239 ?auto_571245 ) ) ( not ( = ?auto_571239 ?auto_571246 ) ) ( not ( = ?auto_571239 ?auto_571247 ) ) ( not ( = ?auto_571239 ?auto_571248 ) ) ( not ( = ?auto_571239 ?auto_571249 ) ) ( not ( = ?auto_571239 ?auto_571250 ) ) ( not ( = ?auto_571239 ?auto_571251 ) ) ( not ( = ?auto_571239 ?auto_571252 ) ) ( not ( = ?auto_571239 ?auto_571253 ) ) ( not ( = ?auto_571239 ?auto_571254 ) ) ( not ( = ?auto_571239 ?auto_571255 ) ) ( not ( = ?auto_571240 ?auto_571241 ) ) ( not ( = ?auto_571240 ?auto_571242 ) ) ( not ( = ?auto_571240 ?auto_571243 ) ) ( not ( = ?auto_571240 ?auto_571244 ) ) ( not ( = ?auto_571240 ?auto_571245 ) ) ( not ( = ?auto_571240 ?auto_571246 ) ) ( not ( = ?auto_571240 ?auto_571247 ) ) ( not ( = ?auto_571240 ?auto_571248 ) ) ( not ( = ?auto_571240 ?auto_571249 ) ) ( not ( = ?auto_571240 ?auto_571250 ) ) ( not ( = ?auto_571240 ?auto_571251 ) ) ( not ( = ?auto_571240 ?auto_571252 ) ) ( not ( = ?auto_571240 ?auto_571253 ) ) ( not ( = ?auto_571240 ?auto_571254 ) ) ( not ( = ?auto_571240 ?auto_571255 ) ) ( not ( = ?auto_571241 ?auto_571242 ) ) ( not ( = ?auto_571241 ?auto_571243 ) ) ( not ( = ?auto_571241 ?auto_571244 ) ) ( not ( = ?auto_571241 ?auto_571245 ) ) ( not ( = ?auto_571241 ?auto_571246 ) ) ( not ( = ?auto_571241 ?auto_571247 ) ) ( not ( = ?auto_571241 ?auto_571248 ) ) ( not ( = ?auto_571241 ?auto_571249 ) ) ( not ( = ?auto_571241 ?auto_571250 ) ) ( not ( = ?auto_571241 ?auto_571251 ) ) ( not ( = ?auto_571241 ?auto_571252 ) ) ( not ( = ?auto_571241 ?auto_571253 ) ) ( not ( = ?auto_571241 ?auto_571254 ) ) ( not ( = ?auto_571241 ?auto_571255 ) ) ( not ( = ?auto_571242 ?auto_571243 ) ) ( not ( = ?auto_571242 ?auto_571244 ) ) ( not ( = ?auto_571242 ?auto_571245 ) ) ( not ( = ?auto_571242 ?auto_571246 ) ) ( not ( = ?auto_571242 ?auto_571247 ) ) ( not ( = ?auto_571242 ?auto_571248 ) ) ( not ( = ?auto_571242 ?auto_571249 ) ) ( not ( = ?auto_571242 ?auto_571250 ) ) ( not ( = ?auto_571242 ?auto_571251 ) ) ( not ( = ?auto_571242 ?auto_571252 ) ) ( not ( = ?auto_571242 ?auto_571253 ) ) ( not ( = ?auto_571242 ?auto_571254 ) ) ( not ( = ?auto_571242 ?auto_571255 ) ) ( not ( = ?auto_571243 ?auto_571244 ) ) ( not ( = ?auto_571243 ?auto_571245 ) ) ( not ( = ?auto_571243 ?auto_571246 ) ) ( not ( = ?auto_571243 ?auto_571247 ) ) ( not ( = ?auto_571243 ?auto_571248 ) ) ( not ( = ?auto_571243 ?auto_571249 ) ) ( not ( = ?auto_571243 ?auto_571250 ) ) ( not ( = ?auto_571243 ?auto_571251 ) ) ( not ( = ?auto_571243 ?auto_571252 ) ) ( not ( = ?auto_571243 ?auto_571253 ) ) ( not ( = ?auto_571243 ?auto_571254 ) ) ( not ( = ?auto_571243 ?auto_571255 ) ) ( not ( = ?auto_571244 ?auto_571245 ) ) ( not ( = ?auto_571244 ?auto_571246 ) ) ( not ( = ?auto_571244 ?auto_571247 ) ) ( not ( = ?auto_571244 ?auto_571248 ) ) ( not ( = ?auto_571244 ?auto_571249 ) ) ( not ( = ?auto_571244 ?auto_571250 ) ) ( not ( = ?auto_571244 ?auto_571251 ) ) ( not ( = ?auto_571244 ?auto_571252 ) ) ( not ( = ?auto_571244 ?auto_571253 ) ) ( not ( = ?auto_571244 ?auto_571254 ) ) ( not ( = ?auto_571244 ?auto_571255 ) ) ( not ( = ?auto_571245 ?auto_571246 ) ) ( not ( = ?auto_571245 ?auto_571247 ) ) ( not ( = ?auto_571245 ?auto_571248 ) ) ( not ( = ?auto_571245 ?auto_571249 ) ) ( not ( = ?auto_571245 ?auto_571250 ) ) ( not ( = ?auto_571245 ?auto_571251 ) ) ( not ( = ?auto_571245 ?auto_571252 ) ) ( not ( = ?auto_571245 ?auto_571253 ) ) ( not ( = ?auto_571245 ?auto_571254 ) ) ( not ( = ?auto_571245 ?auto_571255 ) ) ( not ( = ?auto_571246 ?auto_571247 ) ) ( not ( = ?auto_571246 ?auto_571248 ) ) ( not ( = ?auto_571246 ?auto_571249 ) ) ( not ( = ?auto_571246 ?auto_571250 ) ) ( not ( = ?auto_571246 ?auto_571251 ) ) ( not ( = ?auto_571246 ?auto_571252 ) ) ( not ( = ?auto_571246 ?auto_571253 ) ) ( not ( = ?auto_571246 ?auto_571254 ) ) ( not ( = ?auto_571246 ?auto_571255 ) ) ( not ( = ?auto_571247 ?auto_571248 ) ) ( not ( = ?auto_571247 ?auto_571249 ) ) ( not ( = ?auto_571247 ?auto_571250 ) ) ( not ( = ?auto_571247 ?auto_571251 ) ) ( not ( = ?auto_571247 ?auto_571252 ) ) ( not ( = ?auto_571247 ?auto_571253 ) ) ( not ( = ?auto_571247 ?auto_571254 ) ) ( not ( = ?auto_571247 ?auto_571255 ) ) ( not ( = ?auto_571248 ?auto_571249 ) ) ( not ( = ?auto_571248 ?auto_571250 ) ) ( not ( = ?auto_571248 ?auto_571251 ) ) ( not ( = ?auto_571248 ?auto_571252 ) ) ( not ( = ?auto_571248 ?auto_571253 ) ) ( not ( = ?auto_571248 ?auto_571254 ) ) ( not ( = ?auto_571248 ?auto_571255 ) ) ( not ( = ?auto_571249 ?auto_571250 ) ) ( not ( = ?auto_571249 ?auto_571251 ) ) ( not ( = ?auto_571249 ?auto_571252 ) ) ( not ( = ?auto_571249 ?auto_571253 ) ) ( not ( = ?auto_571249 ?auto_571254 ) ) ( not ( = ?auto_571249 ?auto_571255 ) ) ( not ( = ?auto_571250 ?auto_571251 ) ) ( not ( = ?auto_571250 ?auto_571252 ) ) ( not ( = ?auto_571250 ?auto_571253 ) ) ( not ( = ?auto_571250 ?auto_571254 ) ) ( not ( = ?auto_571250 ?auto_571255 ) ) ( not ( = ?auto_571251 ?auto_571252 ) ) ( not ( = ?auto_571251 ?auto_571253 ) ) ( not ( = ?auto_571251 ?auto_571254 ) ) ( not ( = ?auto_571251 ?auto_571255 ) ) ( not ( = ?auto_571252 ?auto_571253 ) ) ( not ( = ?auto_571252 ?auto_571254 ) ) ( not ( = ?auto_571252 ?auto_571255 ) ) ( not ( = ?auto_571253 ?auto_571254 ) ) ( not ( = ?auto_571253 ?auto_571255 ) ) ( not ( = ?auto_571254 ?auto_571255 ) ) ( ON ?auto_571253 ?auto_571254 ) ( ON ?auto_571252 ?auto_571253 ) ( ON ?auto_571251 ?auto_571252 ) ( ON ?auto_571250 ?auto_571251 ) ( ON ?auto_571249 ?auto_571250 ) ( ON ?auto_571248 ?auto_571249 ) ( ON ?auto_571247 ?auto_571248 ) ( ON ?auto_571246 ?auto_571247 ) ( ON ?auto_571245 ?auto_571246 ) ( ON ?auto_571244 ?auto_571245 ) ( CLEAR ?auto_571242 ) ( ON ?auto_571243 ?auto_571244 ) ( CLEAR ?auto_571243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_571239 ?auto_571240 ?auto_571241 ?auto_571242 ?auto_571243 )
      ( MAKE-16PILE ?auto_571239 ?auto_571240 ?auto_571241 ?auto_571242 ?auto_571243 ?auto_571244 ?auto_571245 ?auto_571246 ?auto_571247 ?auto_571248 ?auto_571249 ?auto_571250 ?auto_571251 ?auto_571252 ?auto_571253 ?auto_571254 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_571272 - BLOCK
      ?auto_571273 - BLOCK
      ?auto_571274 - BLOCK
      ?auto_571275 - BLOCK
      ?auto_571276 - BLOCK
      ?auto_571277 - BLOCK
      ?auto_571278 - BLOCK
      ?auto_571279 - BLOCK
      ?auto_571280 - BLOCK
      ?auto_571281 - BLOCK
      ?auto_571282 - BLOCK
      ?auto_571283 - BLOCK
      ?auto_571284 - BLOCK
      ?auto_571285 - BLOCK
      ?auto_571286 - BLOCK
      ?auto_571287 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_571287 ) ( ON-TABLE ?auto_571272 ) ( ON ?auto_571273 ?auto_571272 ) ( ON ?auto_571274 ?auto_571273 ) ( ON ?auto_571275 ?auto_571274 ) ( not ( = ?auto_571272 ?auto_571273 ) ) ( not ( = ?auto_571272 ?auto_571274 ) ) ( not ( = ?auto_571272 ?auto_571275 ) ) ( not ( = ?auto_571272 ?auto_571276 ) ) ( not ( = ?auto_571272 ?auto_571277 ) ) ( not ( = ?auto_571272 ?auto_571278 ) ) ( not ( = ?auto_571272 ?auto_571279 ) ) ( not ( = ?auto_571272 ?auto_571280 ) ) ( not ( = ?auto_571272 ?auto_571281 ) ) ( not ( = ?auto_571272 ?auto_571282 ) ) ( not ( = ?auto_571272 ?auto_571283 ) ) ( not ( = ?auto_571272 ?auto_571284 ) ) ( not ( = ?auto_571272 ?auto_571285 ) ) ( not ( = ?auto_571272 ?auto_571286 ) ) ( not ( = ?auto_571272 ?auto_571287 ) ) ( not ( = ?auto_571273 ?auto_571274 ) ) ( not ( = ?auto_571273 ?auto_571275 ) ) ( not ( = ?auto_571273 ?auto_571276 ) ) ( not ( = ?auto_571273 ?auto_571277 ) ) ( not ( = ?auto_571273 ?auto_571278 ) ) ( not ( = ?auto_571273 ?auto_571279 ) ) ( not ( = ?auto_571273 ?auto_571280 ) ) ( not ( = ?auto_571273 ?auto_571281 ) ) ( not ( = ?auto_571273 ?auto_571282 ) ) ( not ( = ?auto_571273 ?auto_571283 ) ) ( not ( = ?auto_571273 ?auto_571284 ) ) ( not ( = ?auto_571273 ?auto_571285 ) ) ( not ( = ?auto_571273 ?auto_571286 ) ) ( not ( = ?auto_571273 ?auto_571287 ) ) ( not ( = ?auto_571274 ?auto_571275 ) ) ( not ( = ?auto_571274 ?auto_571276 ) ) ( not ( = ?auto_571274 ?auto_571277 ) ) ( not ( = ?auto_571274 ?auto_571278 ) ) ( not ( = ?auto_571274 ?auto_571279 ) ) ( not ( = ?auto_571274 ?auto_571280 ) ) ( not ( = ?auto_571274 ?auto_571281 ) ) ( not ( = ?auto_571274 ?auto_571282 ) ) ( not ( = ?auto_571274 ?auto_571283 ) ) ( not ( = ?auto_571274 ?auto_571284 ) ) ( not ( = ?auto_571274 ?auto_571285 ) ) ( not ( = ?auto_571274 ?auto_571286 ) ) ( not ( = ?auto_571274 ?auto_571287 ) ) ( not ( = ?auto_571275 ?auto_571276 ) ) ( not ( = ?auto_571275 ?auto_571277 ) ) ( not ( = ?auto_571275 ?auto_571278 ) ) ( not ( = ?auto_571275 ?auto_571279 ) ) ( not ( = ?auto_571275 ?auto_571280 ) ) ( not ( = ?auto_571275 ?auto_571281 ) ) ( not ( = ?auto_571275 ?auto_571282 ) ) ( not ( = ?auto_571275 ?auto_571283 ) ) ( not ( = ?auto_571275 ?auto_571284 ) ) ( not ( = ?auto_571275 ?auto_571285 ) ) ( not ( = ?auto_571275 ?auto_571286 ) ) ( not ( = ?auto_571275 ?auto_571287 ) ) ( not ( = ?auto_571276 ?auto_571277 ) ) ( not ( = ?auto_571276 ?auto_571278 ) ) ( not ( = ?auto_571276 ?auto_571279 ) ) ( not ( = ?auto_571276 ?auto_571280 ) ) ( not ( = ?auto_571276 ?auto_571281 ) ) ( not ( = ?auto_571276 ?auto_571282 ) ) ( not ( = ?auto_571276 ?auto_571283 ) ) ( not ( = ?auto_571276 ?auto_571284 ) ) ( not ( = ?auto_571276 ?auto_571285 ) ) ( not ( = ?auto_571276 ?auto_571286 ) ) ( not ( = ?auto_571276 ?auto_571287 ) ) ( not ( = ?auto_571277 ?auto_571278 ) ) ( not ( = ?auto_571277 ?auto_571279 ) ) ( not ( = ?auto_571277 ?auto_571280 ) ) ( not ( = ?auto_571277 ?auto_571281 ) ) ( not ( = ?auto_571277 ?auto_571282 ) ) ( not ( = ?auto_571277 ?auto_571283 ) ) ( not ( = ?auto_571277 ?auto_571284 ) ) ( not ( = ?auto_571277 ?auto_571285 ) ) ( not ( = ?auto_571277 ?auto_571286 ) ) ( not ( = ?auto_571277 ?auto_571287 ) ) ( not ( = ?auto_571278 ?auto_571279 ) ) ( not ( = ?auto_571278 ?auto_571280 ) ) ( not ( = ?auto_571278 ?auto_571281 ) ) ( not ( = ?auto_571278 ?auto_571282 ) ) ( not ( = ?auto_571278 ?auto_571283 ) ) ( not ( = ?auto_571278 ?auto_571284 ) ) ( not ( = ?auto_571278 ?auto_571285 ) ) ( not ( = ?auto_571278 ?auto_571286 ) ) ( not ( = ?auto_571278 ?auto_571287 ) ) ( not ( = ?auto_571279 ?auto_571280 ) ) ( not ( = ?auto_571279 ?auto_571281 ) ) ( not ( = ?auto_571279 ?auto_571282 ) ) ( not ( = ?auto_571279 ?auto_571283 ) ) ( not ( = ?auto_571279 ?auto_571284 ) ) ( not ( = ?auto_571279 ?auto_571285 ) ) ( not ( = ?auto_571279 ?auto_571286 ) ) ( not ( = ?auto_571279 ?auto_571287 ) ) ( not ( = ?auto_571280 ?auto_571281 ) ) ( not ( = ?auto_571280 ?auto_571282 ) ) ( not ( = ?auto_571280 ?auto_571283 ) ) ( not ( = ?auto_571280 ?auto_571284 ) ) ( not ( = ?auto_571280 ?auto_571285 ) ) ( not ( = ?auto_571280 ?auto_571286 ) ) ( not ( = ?auto_571280 ?auto_571287 ) ) ( not ( = ?auto_571281 ?auto_571282 ) ) ( not ( = ?auto_571281 ?auto_571283 ) ) ( not ( = ?auto_571281 ?auto_571284 ) ) ( not ( = ?auto_571281 ?auto_571285 ) ) ( not ( = ?auto_571281 ?auto_571286 ) ) ( not ( = ?auto_571281 ?auto_571287 ) ) ( not ( = ?auto_571282 ?auto_571283 ) ) ( not ( = ?auto_571282 ?auto_571284 ) ) ( not ( = ?auto_571282 ?auto_571285 ) ) ( not ( = ?auto_571282 ?auto_571286 ) ) ( not ( = ?auto_571282 ?auto_571287 ) ) ( not ( = ?auto_571283 ?auto_571284 ) ) ( not ( = ?auto_571283 ?auto_571285 ) ) ( not ( = ?auto_571283 ?auto_571286 ) ) ( not ( = ?auto_571283 ?auto_571287 ) ) ( not ( = ?auto_571284 ?auto_571285 ) ) ( not ( = ?auto_571284 ?auto_571286 ) ) ( not ( = ?auto_571284 ?auto_571287 ) ) ( not ( = ?auto_571285 ?auto_571286 ) ) ( not ( = ?auto_571285 ?auto_571287 ) ) ( not ( = ?auto_571286 ?auto_571287 ) ) ( ON ?auto_571286 ?auto_571287 ) ( ON ?auto_571285 ?auto_571286 ) ( ON ?auto_571284 ?auto_571285 ) ( ON ?auto_571283 ?auto_571284 ) ( ON ?auto_571282 ?auto_571283 ) ( ON ?auto_571281 ?auto_571282 ) ( ON ?auto_571280 ?auto_571281 ) ( ON ?auto_571279 ?auto_571280 ) ( ON ?auto_571278 ?auto_571279 ) ( ON ?auto_571277 ?auto_571278 ) ( CLEAR ?auto_571275 ) ( ON ?auto_571276 ?auto_571277 ) ( CLEAR ?auto_571276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_571272 ?auto_571273 ?auto_571274 ?auto_571275 ?auto_571276 )
      ( MAKE-16PILE ?auto_571272 ?auto_571273 ?auto_571274 ?auto_571275 ?auto_571276 ?auto_571277 ?auto_571278 ?auto_571279 ?auto_571280 ?auto_571281 ?auto_571282 ?auto_571283 ?auto_571284 ?auto_571285 ?auto_571286 ?auto_571287 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_571304 - BLOCK
      ?auto_571305 - BLOCK
      ?auto_571306 - BLOCK
      ?auto_571307 - BLOCK
      ?auto_571308 - BLOCK
      ?auto_571309 - BLOCK
      ?auto_571310 - BLOCK
      ?auto_571311 - BLOCK
      ?auto_571312 - BLOCK
      ?auto_571313 - BLOCK
      ?auto_571314 - BLOCK
      ?auto_571315 - BLOCK
      ?auto_571316 - BLOCK
      ?auto_571317 - BLOCK
      ?auto_571318 - BLOCK
      ?auto_571319 - BLOCK
    )
    :vars
    (
      ?auto_571320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_571319 ?auto_571320 ) ( ON-TABLE ?auto_571304 ) ( ON ?auto_571305 ?auto_571304 ) ( ON ?auto_571306 ?auto_571305 ) ( not ( = ?auto_571304 ?auto_571305 ) ) ( not ( = ?auto_571304 ?auto_571306 ) ) ( not ( = ?auto_571304 ?auto_571307 ) ) ( not ( = ?auto_571304 ?auto_571308 ) ) ( not ( = ?auto_571304 ?auto_571309 ) ) ( not ( = ?auto_571304 ?auto_571310 ) ) ( not ( = ?auto_571304 ?auto_571311 ) ) ( not ( = ?auto_571304 ?auto_571312 ) ) ( not ( = ?auto_571304 ?auto_571313 ) ) ( not ( = ?auto_571304 ?auto_571314 ) ) ( not ( = ?auto_571304 ?auto_571315 ) ) ( not ( = ?auto_571304 ?auto_571316 ) ) ( not ( = ?auto_571304 ?auto_571317 ) ) ( not ( = ?auto_571304 ?auto_571318 ) ) ( not ( = ?auto_571304 ?auto_571319 ) ) ( not ( = ?auto_571304 ?auto_571320 ) ) ( not ( = ?auto_571305 ?auto_571306 ) ) ( not ( = ?auto_571305 ?auto_571307 ) ) ( not ( = ?auto_571305 ?auto_571308 ) ) ( not ( = ?auto_571305 ?auto_571309 ) ) ( not ( = ?auto_571305 ?auto_571310 ) ) ( not ( = ?auto_571305 ?auto_571311 ) ) ( not ( = ?auto_571305 ?auto_571312 ) ) ( not ( = ?auto_571305 ?auto_571313 ) ) ( not ( = ?auto_571305 ?auto_571314 ) ) ( not ( = ?auto_571305 ?auto_571315 ) ) ( not ( = ?auto_571305 ?auto_571316 ) ) ( not ( = ?auto_571305 ?auto_571317 ) ) ( not ( = ?auto_571305 ?auto_571318 ) ) ( not ( = ?auto_571305 ?auto_571319 ) ) ( not ( = ?auto_571305 ?auto_571320 ) ) ( not ( = ?auto_571306 ?auto_571307 ) ) ( not ( = ?auto_571306 ?auto_571308 ) ) ( not ( = ?auto_571306 ?auto_571309 ) ) ( not ( = ?auto_571306 ?auto_571310 ) ) ( not ( = ?auto_571306 ?auto_571311 ) ) ( not ( = ?auto_571306 ?auto_571312 ) ) ( not ( = ?auto_571306 ?auto_571313 ) ) ( not ( = ?auto_571306 ?auto_571314 ) ) ( not ( = ?auto_571306 ?auto_571315 ) ) ( not ( = ?auto_571306 ?auto_571316 ) ) ( not ( = ?auto_571306 ?auto_571317 ) ) ( not ( = ?auto_571306 ?auto_571318 ) ) ( not ( = ?auto_571306 ?auto_571319 ) ) ( not ( = ?auto_571306 ?auto_571320 ) ) ( not ( = ?auto_571307 ?auto_571308 ) ) ( not ( = ?auto_571307 ?auto_571309 ) ) ( not ( = ?auto_571307 ?auto_571310 ) ) ( not ( = ?auto_571307 ?auto_571311 ) ) ( not ( = ?auto_571307 ?auto_571312 ) ) ( not ( = ?auto_571307 ?auto_571313 ) ) ( not ( = ?auto_571307 ?auto_571314 ) ) ( not ( = ?auto_571307 ?auto_571315 ) ) ( not ( = ?auto_571307 ?auto_571316 ) ) ( not ( = ?auto_571307 ?auto_571317 ) ) ( not ( = ?auto_571307 ?auto_571318 ) ) ( not ( = ?auto_571307 ?auto_571319 ) ) ( not ( = ?auto_571307 ?auto_571320 ) ) ( not ( = ?auto_571308 ?auto_571309 ) ) ( not ( = ?auto_571308 ?auto_571310 ) ) ( not ( = ?auto_571308 ?auto_571311 ) ) ( not ( = ?auto_571308 ?auto_571312 ) ) ( not ( = ?auto_571308 ?auto_571313 ) ) ( not ( = ?auto_571308 ?auto_571314 ) ) ( not ( = ?auto_571308 ?auto_571315 ) ) ( not ( = ?auto_571308 ?auto_571316 ) ) ( not ( = ?auto_571308 ?auto_571317 ) ) ( not ( = ?auto_571308 ?auto_571318 ) ) ( not ( = ?auto_571308 ?auto_571319 ) ) ( not ( = ?auto_571308 ?auto_571320 ) ) ( not ( = ?auto_571309 ?auto_571310 ) ) ( not ( = ?auto_571309 ?auto_571311 ) ) ( not ( = ?auto_571309 ?auto_571312 ) ) ( not ( = ?auto_571309 ?auto_571313 ) ) ( not ( = ?auto_571309 ?auto_571314 ) ) ( not ( = ?auto_571309 ?auto_571315 ) ) ( not ( = ?auto_571309 ?auto_571316 ) ) ( not ( = ?auto_571309 ?auto_571317 ) ) ( not ( = ?auto_571309 ?auto_571318 ) ) ( not ( = ?auto_571309 ?auto_571319 ) ) ( not ( = ?auto_571309 ?auto_571320 ) ) ( not ( = ?auto_571310 ?auto_571311 ) ) ( not ( = ?auto_571310 ?auto_571312 ) ) ( not ( = ?auto_571310 ?auto_571313 ) ) ( not ( = ?auto_571310 ?auto_571314 ) ) ( not ( = ?auto_571310 ?auto_571315 ) ) ( not ( = ?auto_571310 ?auto_571316 ) ) ( not ( = ?auto_571310 ?auto_571317 ) ) ( not ( = ?auto_571310 ?auto_571318 ) ) ( not ( = ?auto_571310 ?auto_571319 ) ) ( not ( = ?auto_571310 ?auto_571320 ) ) ( not ( = ?auto_571311 ?auto_571312 ) ) ( not ( = ?auto_571311 ?auto_571313 ) ) ( not ( = ?auto_571311 ?auto_571314 ) ) ( not ( = ?auto_571311 ?auto_571315 ) ) ( not ( = ?auto_571311 ?auto_571316 ) ) ( not ( = ?auto_571311 ?auto_571317 ) ) ( not ( = ?auto_571311 ?auto_571318 ) ) ( not ( = ?auto_571311 ?auto_571319 ) ) ( not ( = ?auto_571311 ?auto_571320 ) ) ( not ( = ?auto_571312 ?auto_571313 ) ) ( not ( = ?auto_571312 ?auto_571314 ) ) ( not ( = ?auto_571312 ?auto_571315 ) ) ( not ( = ?auto_571312 ?auto_571316 ) ) ( not ( = ?auto_571312 ?auto_571317 ) ) ( not ( = ?auto_571312 ?auto_571318 ) ) ( not ( = ?auto_571312 ?auto_571319 ) ) ( not ( = ?auto_571312 ?auto_571320 ) ) ( not ( = ?auto_571313 ?auto_571314 ) ) ( not ( = ?auto_571313 ?auto_571315 ) ) ( not ( = ?auto_571313 ?auto_571316 ) ) ( not ( = ?auto_571313 ?auto_571317 ) ) ( not ( = ?auto_571313 ?auto_571318 ) ) ( not ( = ?auto_571313 ?auto_571319 ) ) ( not ( = ?auto_571313 ?auto_571320 ) ) ( not ( = ?auto_571314 ?auto_571315 ) ) ( not ( = ?auto_571314 ?auto_571316 ) ) ( not ( = ?auto_571314 ?auto_571317 ) ) ( not ( = ?auto_571314 ?auto_571318 ) ) ( not ( = ?auto_571314 ?auto_571319 ) ) ( not ( = ?auto_571314 ?auto_571320 ) ) ( not ( = ?auto_571315 ?auto_571316 ) ) ( not ( = ?auto_571315 ?auto_571317 ) ) ( not ( = ?auto_571315 ?auto_571318 ) ) ( not ( = ?auto_571315 ?auto_571319 ) ) ( not ( = ?auto_571315 ?auto_571320 ) ) ( not ( = ?auto_571316 ?auto_571317 ) ) ( not ( = ?auto_571316 ?auto_571318 ) ) ( not ( = ?auto_571316 ?auto_571319 ) ) ( not ( = ?auto_571316 ?auto_571320 ) ) ( not ( = ?auto_571317 ?auto_571318 ) ) ( not ( = ?auto_571317 ?auto_571319 ) ) ( not ( = ?auto_571317 ?auto_571320 ) ) ( not ( = ?auto_571318 ?auto_571319 ) ) ( not ( = ?auto_571318 ?auto_571320 ) ) ( not ( = ?auto_571319 ?auto_571320 ) ) ( ON ?auto_571318 ?auto_571319 ) ( ON ?auto_571317 ?auto_571318 ) ( ON ?auto_571316 ?auto_571317 ) ( ON ?auto_571315 ?auto_571316 ) ( ON ?auto_571314 ?auto_571315 ) ( ON ?auto_571313 ?auto_571314 ) ( ON ?auto_571312 ?auto_571313 ) ( ON ?auto_571311 ?auto_571312 ) ( ON ?auto_571310 ?auto_571311 ) ( ON ?auto_571309 ?auto_571310 ) ( ON ?auto_571308 ?auto_571309 ) ( CLEAR ?auto_571306 ) ( ON ?auto_571307 ?auto_571308 ) ( CLEAR ?auto_571307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_571304 ?auto_571305 ?auto_571306 ?auto_571307 )
      ( MAKE-16PILE ?auto_571304 ?auto_571305 ?auto_571306 ?auto_571307 ?auto_571308 ?auto_571309 ?auto_571310 ?auto_571311 ?auto_571312 ?auto_571313 ?auto_571314 ?auto_571315 ?auto_571316 ?auto_571317 ?auto_571318 ?auto_571319 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_571337 - BLOCK
      ?auto_571338 - BLOCK
      ?auto_571339 - BLOCK
      ?auto_571340 - BLOCK
      ?auto_571341 - BLOCK
      ?auto_571342 - BLOCK
      ?auto_571343 - BLOCK
      ?auto_571344 - BLOCK
      ?auto_571345 - BLOCK
      ?auto_571346 - BLOCK
      ?auto_571347 - BLOCK
      ?auto_571348 - BLOCK
      ?auto_571349 - BLOCK
      ?auto_571350 - BLOCK
      ?auto_571351 - BLOCK
      ?auto_571352 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_571352 ) ( ON-TABLE ?auto_571337 ) ( ON ?auto_571338 ?auto_571337 ) ( ON ?auto_571339 ?auto_571338 ) ( not ( = ?auto_571337 ?auto_571338 ) ) ( not ( = ?auto_571337 ?auto_571339 ) ) ( not ( = ?auto_571337 ?auto_571340 ) ) ( not ( = ?auto_571337 ?auto_571341 ) ) ( not ( = ?auto_571337 ?auto_571342 ) ) ( not ( = ?auto_571337 ?auto_571343 ) ) ( not ( = ?auto_571337 ?auto_571344 ) ) ( not ( = ?auto_571337 ?auto_571345 ) ) ( not ( = ?auto_571337 ?auto_571346 ) ) ( not ( = ?auto_571337 ?auto_571347 ) ) ( not ( = ?auto_571337 ?auto_571348 ) ) ( not ( = ?auto_571337 ?auto_571349 ) ) ( not ( = ?auto_571337 ?auto_571350 ) ) ( not ( = ?auto_571337 ?auto_571351 ) ) ( not ( = ?auto_571337 ?auto_571352 ) ) ( not ( = ?auto_571338 ?auto_571339 ) ) ( not ( = ?auto_571338 ?auto_571340 ) ) ( not ( = ?auto_571338 ?auto_571341 ) ) ( not ( = ?auto_571338 ?auto_571342 ) ) ( not ( = ?auto_571338 ?auto_571343 ) ) ( not ( = ?auto_571338 ?auto_571344 ) ) ( not ( = ?auto_571338 ?auto_571345 ) ) ( not ( = ?auto_571338 ?auto_571346 ) ) ( not ( = ?auto_571338 ?auto_571347 ) ) ( not ( = ?auto_571338 ?auto_571348 ) ) ( not ( = ?auto_571338 ?auto_571349 ) ) ( not ( = ?auto_571338 ?auto_571350 ) ) ( not ( = ?auto_571338 ?auto_571351 ) ) ( not ( = ?auto_571338 ?auto_571352 ) ) ( not ( = ?auto_571339 ?auto_571340 ) ) ( not ( = ?auto_571339 ?auto_571341 ) ) ( not ( = ?auto_571339 ?auto_571342 ) ) ( not ( = ?auto_571339 ?auto_571343 ) ) ( not ( = ?auto_571339 ?auto_571344 ) ) ( not ( = ?auto_571339 ?auto_571345 ) ) ( not ( = ?auto_571339 ?auto_571346 ) ) ( not ( = ?auto_571339 ?auto_571347 ) ) ( not ( = ?auto_571339 ?auto_571348 ) ) ( not ( = ?auto_571339 ?auto_571349 ) ) ( not ( = ?auto_571339 ?auto_571350 ) ) ( not ( = ?auto_571339 ?auto_571351 ) ) ( not ( = ?auto_571339 ?auto_571352 ) ) ( not ( = ?auto_571340 ?auto_571341 ) ) ( not ( = ?auto_571340 ?auto_571342 ) ) ( not ( = ?auto_571340 ?auto_571343 ) ) ( not ( = ?auto_571340 ?auto_571344 ) ) ( not ( = ?auto_571340 ?auto_571345 ) ) ( not ( = ?auto_571340 ?auto_571346 ) ) ( not ( = ?auto_571340 ?auto_571347 ) ) ( not ( = ?auto_571340 ?auto_571348 ) ) ( not ( = ?auto_571340 ?auto_571349 ) ) ( not ( = ?auto_571340 ?auto_571350 ) ) ( not ( = ?auto_571340 ?auto_571351 ) ) ( not ( = ?auto_571340 ?auto_571352 ) ) ( not ( = ?auto_571341 ?auto_571342 ) ) ( not ( = ?auto_571341 ?auto_571343 ) ) ( not ( = ?auto_571341 ?auto_571344 ) ) ( not ( = ?auto_571341 ?auto_571345 ) ) ( not ( = ?auto_571341 ?auto_571346 ) ) ( not ( = ?auto_571341 ?auto_571347 ) ) ( not ( = ?auto_571341 ?auto_571348 ) ) ( not ( = ?auto_571341 ?auto_571349 ) ) ( not ( = ?auto_571341 ?auto_571350 ) ) ( not ( = ?auto_571341 ?auto_571351 ) ) ( not ( = ?auto_571341 ?auto_571352 ) ) ( not ( = ?auto_571342 ?auto_571343 ) ) ( not ( = ?auto_571342 ?auto_571344 ) ) ( not ( = ?auto_571342 ?auto_571345 ) ) ( not ( = ?auto_571342 ?auto_571346 ) ) ( not ( = ?auto_571342 ?auto_571347 ) ) ( not ( = ?auto_571342 ?auto_571348 ) ) ( not ( = ?auto_571342 ?auto_571349 ) ) ( not ( = ?auto_571342 ?auto_571350 ) ) ( not ( = ?auto_571342 ?auto_571351 ) ) ( not ( = ?auto_571342 ?auto_571352 ) ) ( not ( = ?auto_571343 ?auto_571344 ) ) ( not ( = ?auto_571343 ?auto_571345 ) ) ( not ( = ?auto_571343 ?auto_571346 ) ) ( not ( = ?auto_571343 ?auto_571347 ) ) ( not ( = ?auto_571343 ?auto_571348 ) ) ( not ( = ?auto_571343 ?auto_571349 ) ) ( not ( = ?auto_571343 ?auto_571350 ) ) ( not ( = ?auto_571343 ?auto_571351 ) ) ( not ( = ?auto_571343 ?auto_571352 ) ) ( not ( = ?auto_571344 ?auto_571345 ) ) ( not ( = ?auto_571344 ?auto_571346 ) ) ( not ( = ?auto_571344 ?auto_571347 ) ) ( not ( = ?auto_571344 ?auto_571348 ) ) ( not ( = ?auto_571344 ?auto_571349 ) ) ( not ( = ?auto_571344 ?auto_571350 ) ) ( not ( = ?auto_571344 ?auto_571351 ) ) ( not ( = ?auto_571344 ?auto_571352 ) ) ( not ( = ?auto_571345 ?auto_571346 ) ) ( not ( = ?auto_571345 ?auto_571347 ) ) ( not ( = ?auto_571345 ?auto_571348 ) ) ( not ( = ?auto_571345 ?auto_571349 ) ) ( not ( = ?auto_571345 ?auto_571350 ) ) ( not ( = ?auto_571345 ?auto_571351 ) ) ( not ( = ?auto_571345 ?auto_571352 ) ) ( not ( = ?auto_571346 ?auto_571347 ) ) ( not ( = ?auto_571346 ?auto_571348 ) ) ( not ( = ?auto_571346 ?auto_571349 ) ) ( not ( = ?auto_571346 ?auto_571350 ) ) ( not ( = ?auto_571346 ?auto_571351 ) ) ( not ( = ?auto_571346 ?auto_571352 ) ) ( not ( = ?auto_571347 ?auto_571348 ) ) ( not ( = ?auto_571347 ?auto_571349 ) ) ( not ( = ?auto_571347 ?auto_571350 ) ) ( not ( = ?auto_571347 ?auto_571351 ) ) ( not ( = ?auto_571347 ?auto_571352 ) ) ( not ( = ?auto_571348 ?auto_571349 ) ) ( not ( = ?auto_571348 ?auto_571350 ) ) ( not ( = ?auto_571348 ?auto_571351 ) ) ( not ( = ?auto_571348 ?auto_571352 ) ) ( not ( = ?auto_571349 ?auto_571350 ) ) ( not ( = ?auto_571349 ?auto_571351 ) ) ( not ( = ?auto_571349 ?auto_571352 ) ) ( not ( = ?auto_571350 ?auto_571351 ) ) ( not ( = ?auto_571350 ?auto_571352 ) ) ( not ( = ?auto_571351 ?auto_571352 ) ) ( ON ?auto_571351 ?auto_571352 ) ( ON ?auto_571350 ?auto_571351 ) ( ON ?auto_571349 ?auto_571350 ) ( ON ?auto_571348 ?auto_571349 ) ( ON ?auto_571347 ?auto_571348 ) ( ON ?auto_571346 ?auto_571347 ) ( ON ?auto_571345 ?auto_571346 ) ( ON ?auto_571344 ?auto_571345 ) ( ON ?auto_571343 ?auto_571344 ) ( ON ?auto_571342 ?auto_571343 ) ( ON ?auto_571341 ?auto_571342 ) ( CLEAR ?auto_571339 ) ( ON ?auto_571340 ?auto_571341 ) ( CLEAR ?auto_571340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_571337 ?auto_571338 ?auto_571339 ?auto_571340 )
      ( MAKE-16PILE ?auto_571337 ?auto_571338 ?auto_571339 ?auto_571340 ?auto_571341 ?auto_571342 ?auto_571343 ?auto_571344 ?auto_571345 ?auto_571346 ?auto_571347 ?auto_571348 ?auto_571349 ?auto_571350 ?auto_571351 ?auto_571352 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_571369 - BLOCK
      ?auto_571370 - BLOCK
      ?auto_571371 - BLOCK
      ?auto_571372 - BLOCK
      ?auto_571373 - BLOCK
      ?auto_571374 - BLOCK
      ?auto_571375 - BLOCK
      ?auto_571376 - BLOCK
      ?auto_571377 - BLOCK
      ?auto_571378 - BLOCK
      ?auto_571379 - BLOCK
      ?auto_571380 - BLOCK
      ?auto_571381 - BLOCK
      ?auto_571382 - BLOCK
      ?auto_571383 - BLOCK
      ?auto_571384 - BLOCK
    )
    :vars
    (
      ?auto_571385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_571384 ?auto_571385 ) ( ON-TABLE ?auto_571369 ) ( ON ?auto_571370 ?auto_571369 ) ( not ( = ?auto_571369 ?auto_571370 ) ) ( not ( = ?auto_571369 ?auto_571371 ) ) ( not ( = ?auto_571369 ?auto_571372 ) ) ( not ( = ?auto_571369 ?auto_571373 ) ) ( not ( = ?auto_571369 ?auto_571374 ) ) ( not ( = ?auto_571369 ?auto_571375 ) ) ( not ( = ?auto_571369 ?auto_571376 ) ) ( not ( = ?auto_571369 ?auto_571377 ) ) ( not ( = ?auto_571369 ?auto_571378 ) ) ( not ( = ?auto_571369 ?auto_571379 ) ) ( not ( = ?auto_571369 ?auto_571380 ) ) ( not ( = ?auto_571369 ?auto_571381 ) ) ( not ( = ?auto_571369 ?auto_571382 ) ) ( not ( = ?auto_571369 ?auto_571383 ) ) ( not ( = ?auto_571369 ?auto_571384 ) ) ( not ( = ?auto_571369 ?auto_571385 ) ) ( not ( = ?auto_571370 ?auto_571371 ) ) ( not ( = ?auto_571370 ?auto_571372 ) ) ( not ( = ?auto_571370 ?auto_571373 ) ) ( not ( = ?auto_571370 ?auto_571374 ) ) ( not ( = ?auto_571370 ?auto_571375 ) ) ( not ( = ?auto_571370 ?auto_571376 ) ) ( not ( = ?auto_571370 ?auto_571377 ) ) ( not ( = ?auto_571370 ?auto_571378 ) ) ( not ( = ?auto_571370 ?auto_571379 ) ) ( not ( = ?auto_571370 ?auto_571380 ) ) ( not ( = ?auto_571370 ?auto_571381 ) ) ( not ( = ?auto_571370 ?auto_571382 ) ) ( not ( = ?auto_571370 ?auto_571383 ) ) ( not ( = ?auto_571370 ?auto_571384 ) ) ( not ( = ?auto_571370 ?auto_571385 ) ) ( not ( = ?auto_571371 ?auto_571372 ) ) ( not ( = ?auto_571371 ?auto_571373 ) ) ( not ( = ?auto_571371 ?auto_571374 ) ) ( not ( = ?auto_571371 ?auto_571375 ) ) ( not ( = ?auto_571371 ?auto_571376 ) ) ( not ( = ?auto_571371 ?auto_571377 ) ) ( not ( = ?auto_571371 ?auto_571378 ) ) ( not ( = ?auto_571371 ?auto_571379 ) ) ( not ( = ?auto_571371 ?auto_571380 ) ) ( not ( = ?auto_571371 ?auto_571381 ) ) ( not ( = ?auto_571371 ?auto_571382 ) ) ( not ( = ?auto_571371 ?auto_571383 ) ) ( not ( = ?auto_571371 ?auto_571384 ) ) ( not ( = ?auto_571371 ?auto_571385 ) ) ( not ( = ?auto_571372 ?auto_571373 ) ) ( not ( = ?auto_571372 ?auto_571374 ) ) ( not ( = ?auto_571372 ?auto_571375 ) ) ( not ( = ?auto_571372 ?auto_571376 ) ) ( not ( = ?auto_571372 ?auto_571377 ) ) ( not ( = ?auto_571372 ?auto_571378 ) ) ( not ( = ?auto_571372 ?auto_571379 ) ) ( not ( = ?auto_571372 ?auto_571380 ) ) ( not ( = ?auto_571372 ?auto_571381 ) ) ( not ( = ?auto_571372 ?auto_571382 ) ) ( not ( = ?auto_571372 ?auto_571383 ) ) ( not ( = ?auto_571372 ?auto_571384 ) ) ( not ( = ?auto_571372 ?auto_571385 ) ) ( not ( = ?auto_571373 ?auto_571374 ) ) ( not ( = ?auto_571373 ?auto_571375 ) ) ( not ( = ?auto_571373 ?auto_571376 ) ) ( not ( = ?auto_571373 ?auto_571377 ) ) ( not ( = ?auto_571373 ?auto_571378 ) ) ( not ( = ?auto_571373 ?auto_571379 ) ) ( not ( = ?auto_571373 ?auto_571380 ) ) ( not ( = ?auto_571373 ?auto_571381 ) ) ( not ( = ?auto_571373 ?auto_571382 ) ) ( not ( = ?auto_571373 ?auto_571383 ) ) ( not ( = ?auto_571373 ?auto_571384 ) ) ( not ( = ?auto_571373 ?auto_571385 ) ) ( not ( = ?auto_571374 ?auto_571375 ) ) ( not ( = ?auto_571374 ?auto_571376 ) ) ( not ( = ?auto_571374 ?auto_571377 ) ) ( not ( = ?auto_571374 ?auto_571378 ) ) ( not ( = ?auto_571374 ?auto_571379 ) ) ( not ( = ?auto_571374 ?auto_571380 ) ) ( not ( = ?auto_571374 ?auto_571381 ) ) ( not ( = ?auto_571374 ?auto_571382 ) ) ( not ( = ?auto_571374 ?auto_571383 ) ) ( not ( = ?auto_571374 ?auto_571384 ) ) ( not ( = ?auto_571374 ?auto_571385 ) ) ( not ( = ?auto_571375 ?auto_571376 ) ) ( not ( = ?auto_571375 ?auto_571377 ) ) ( not ( = ?auto_571375 ?auto_571378 ) ) ( not ( = ?auto_571375 ?auto_571379 ) ) ( not ( = ?auto_571375 ?auto_571380 ) ) ( not ( = ?auto_571375 ?auto_571381 ) ) ( not ( = ?auto_571375 ?auto_571382 ) ) ( not ( = ?auto_571375 ?auto_571383 ) ) ( not ( = ?auto_571375 ?auto_571384 ) ) ( not ( = ?auto_571375 ?auto_571385 ) ) ( not ( = ?auto_571376 ?auto_571377 ) ) ( not ( = ?auto_571376 ?auto_571378 ) ) ( not ( = ?auto_571376 ?auto_571379 ) ) ( not ( = ?auto_571376 ?auto_571380 ) ) ( not ( = ?auto_571376 ?auto_571381 ) ) ( not ( = ?auto_571376 ?auto_571382 ) ) ( not ( = ?auto_571376 ?auto_571383 ) ) ( not ( = ?auto_571376 ?auto_571384 ) ) ( not ( = ?auto_571376 ?auto_571385 ) ) ( not ( = ?auto_571377 ?auto_571378 ) ) ( not ( = ?auto_571377 ?auto_571379 ) ) ( not ( = ?auto_571377 ?auto_571380 ) ) ( not ( = ?auto_571377 ?auto_571381 ) ) ( not ( = ?auto_571377 ?auto_571382 ) ) ( not ( = ?auto_571377 ?auto_571383 ) ) ( not ( = ?auto_571377 ?auto_571384 ) ) ( not ( = ?auto_571377 ?auto_571385 ) ) ( not ( = ?auto_571378 ?auto_571379 ) ) ( not ( = ?auto_571378 ?auto_571380 ) ) ( not ( = ?auto_571378 ?auto_571381 ) ) ( not ( = ?auto_571378 ?auto_571382 ) ) ( not ( = ?auto_571378 ?auto_571383 ) ) ( not ( = ?auto_571378 ?auto_571384 ) ) ( not ( = ?auto_571378 ?auto_571385 ) ) ( not ( = ?auto_571379 ?auto_571380 ) ) ( not ( = ?auto_571379 ?auto_571381 ) ) ( not ( = ?auto_571379 ?auto_571382 ) ) ( not ( = ?auto_571379 ?auto_571383 ) ) ( not ( = ?auto_571379 ?auto_571384 ) ) ( not ( = ?auto_571379 ?auto_571385 ) ) ( not ( = ?auto_571380 ?auto_571381 ) ) ( not ( = ?auto_571380 ?auto_571382 ) ) ( not ( = ?auto_571380 ?auto_571383 ) ) ( not ( = ?auto_571380 ?auto_571384 ) ) ( not ( = ?auto_571380 ?auto_571385 ) ) ( not ( = ?auto_571381 ?auto_571382 ) ) ( not ( = ?auto_571381 ?auto_571383 ) ) ( not ( = ?auto_571381 ?auto_571384 ) ) ( not ( = ?auto_571381 ?auto_571385 ) ) ( not ( = ?auto_571382 ?auto_571383 ) ) ( not ( = ?auto_571382 ?auto_571384 ) ) ( not ( = ?auto_571382 ?auto_571385 ) ) ( not ( = ?auto_571383 ?auto_571384 ) ) ( not ( = ?auto_571383 ?auto_571385 ) ) ( not ( = ?auto_571384 ?auto_571385 ) ) ( ON ?auto_571383 ?auto_571384 ) ( ON ?auto_571382 ?auto_571383 ) ( ON ?auto_571381 ?auto_571382 ) ( ON ?auto_571380 ?auto_571381 ) ( ON ?auto_571379 ?auto_571380 ) ( ON ?auto_571378 ?auto_571379 ) ( ON ?auto_571377 ?auto_571378 ) ( ON ?auto_571376 ?auto_571377 ) ( ON ?auto_571375 ?auto_571376 ) ( ON ?auto_571374 ?auto_571375 ) ( ON ?auto_571373 ?auto_571374 ) ( ON ?auto_571372 ?auto_571373 ) ( CLEAR ?auto_571370 ) ( ON ?auto_571371 ?auto_571372 ) ( CLEAR ?auto_571371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_571369 ?auto_571370 ?auto_571371 )
      ( MAKE-16PILE ?auto_571369 ?auto_571370 ?auto_571371 ?auto_571372 ?auto_571373 ?auto_571374 ?auto_571375 ?auto_571376 ?auto_571377 ?auto_571378 ?auto_571379 ?auto_571380 ?auto_571381 ?auto_571382 ?auto_571383 ?auto_571384 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_571402 - BLOCK
      ?auto_571403 - BLOCK
      ?auto_571404 - BLOCK
      ?auto_571405 - BLOCK
      ?auto_571406 - BLOCK
      ?auto_571407 - BLOCK
      ?auto_571408 - BLOCK
      ?auto_571409 - BLOCK
      ?auto_571410 - BLOCK
      ?auto_571411 - BLOCK
      ?auto_571412 - BLOCK
      ?auto_571413 - BLOCK
      ?auto_571414 - BLOCK
      ?auto_571415 - BLOCK
      ?auto_571416 - BLOCK
      ?auto_571417 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_571417 ) ( ON-TABLE ?auto_571402 ) ( ON ?auto_571403 ?auto_571402 ) ( not ( = ?auto_571402 ?auto_571403 ) ) ( not ( = ?auto_571402 ?auto_571404 ) ) ( not ( = ?auto_571402 ?auto_571405 ) ) ( not ( = ?auto_571402 ?auto_571406 ) ) ( not ( = ?auto_571402 ?auto_571407 ) ) ( not ( = ?auto_571402 ?auto_571408 ) ) ( not ( = ?auto_571402 ?auto_571409 ) ) ( not ( = ?auto_571402 ?auto_571410 ) ) ( not ( = ?auto_571402 ?auto_571411 ) ) ( not ( = ?auto_571402 ?auto_571412 ) ) ( not ( = ?auto_571402 ?auto_571413 ) ) ( not ( = ?auto_571402 ?auto_571414 ) ) ( not ( = ?auto_571402 ?auto_571415 ) ) ( not ( = ?auto_571402 ?auto_571416 ) ) ( not ( = ?auto_571402 ?auto_571417 ) ) ( not ( = ?auto_571403 ?auto_571404 ) ) ( not ( = ?auto_571403 ?auto_571405 ) ) ( not ( = ?auto_571403 ?auto_571406 ) ) ( not ( = ?auto_571403 ?auto_571407 ) ) ( not ( = ?auto_571403 ?auto_571408 ) ) ( not ( = ?auto_571403 ?auto_571409 ) ) ( not ( = ?auto_571403 ?auto_571410 ) ) ( not ( = ?auto_571403 ?auto_571411 ) ) ( not ( = ?auto_571403 ?auto_571412 ) ) ( not ( = ?auto_571403 ?auto_571413 ) ) ( not ( = ?auto_571403 ?auto_571414 ) ) ( not ( = ?auto_571403 ?auto_571415 ) ) ( not ( = ?auto_571403 ?auto_571416 ) ) ( not ( = ?auto_571403 ?auto_571417 ) ) ( not ( = ?auto_571404 ?auto_571405 ) ) ( not ( = ?auto_571404 ?auto_571406 ) ) ( not ( = ?auto_571404 ?auto_571407 ) ) ( not ( = ?auto_571404 ?auto_571408 ) ) ( not ( = ?auto_571404 ?auto_571409 ) ) ( not ( = ?auto_571404 ?auto_571410 ) ) ( not ( = ?auto_571404 ?auto_571411 ) ) ( not ( = ?auto_571404 ?auto_571412 ) ) ( not ( = ?auto_571404 ?auto_571413 ) ) ( not ( = ?auto_571404 ?auto_571414 ) ) ( not ( = ?auto_571404 ?auto_571415 ) ) ( not ( = ?auto_571404 ?auto_571416 ) ) ( not ( = ?auto_571404 ?auto_571417 ) ) ( not ( = ?auto_571405 ?auto_571406 ) ) ( not ( = ?auto_571405 ?auto_571407 ) ) ( not ( = ?auto_571405 ?auto_571408 ) ) ( not ( = ?auto_571405 ?auto_571409 ) ) ( not ( = ?auto_571405 ?auto_571410 ) ) ( not ( = ?auto_571405 ?auto_571411 ) ) ( not ( = ?auto_571405 ?auto_571412 ) ) ( not ( = ?auto_571405 ?auto_571413 ) ) ( not ( = ?auto_571405 ?auto_571414 ) ) ( not ( = ?auto_571405 ?auto_571415 ) ) ( not ( = ?auto_571405 ?auto_571416 ) ) ( not ( = ?auto_571405 ?auto_571417 ) ) ( not ( = ?auto_571406 ?auto_571407 ) ) ( not ( = ?auto_571406 ?auto_571408 ) ) ( not ( = ?auto_571406 ?auto_571409 ) ) ( not ( = ?auto_571406 ?auto_571410 ) ) ( not ( = ?auto_571406 ?auto_571411 ) ) ( not ( = ?auto_571406 ?auto_571412 ) ) ( not ( = ?auto_571406 ?auto_571413 ) ) ( not ( = ?auto_571406 ?auto_571414 ) ) ( not ( = ?auto_571406 ?auto_571415 ) ) ( not ( = ?auto_571406 ?auto_571416 ) ) ( not ( = ?auto_571406 ?auto_571417 ) ) ( not ( = ?auto_571407 ?auto_571408 ) ) ( not ( = ?auto_571407 ?auto_571409 ) ) ( not ( = ?auto_571407 ?auto_571410 ) ) ( not ( = ?auto_571407 ?auto_571411 ) ) ( not ( = ?auto_571407 ?auto_571412 ) ) ( not ( = ?auto_571407 ?auto_571413 ) ) ( not ( = ?auto_571407 ?auto_571414 ) ) ( not ( = ?auto_571407 ?auto_571415 ) ) ( not ( = ?auto_571407 ?auto_571416 ) ) ( not ( = ?auto_571407 ?auto_571417 ) ) ( not ( = ?auto_571408 ?auto_571409 ) ) ( not ( = ?auto_571408 ?auto_571410 ) ) ( not ( = ?auto_571408 ?auto_571411 ) ) ( not ( = ?auto_571408 ?auto_571412 ) ) ( not ( = ?auto_571408 ?auto_571413 ) ) ( not ( = ?auto_571408 ?auto_571414 ) ) ( not ( = ?auto_571408 ?auto_571415 ) ) ( not ( = ?auto_571408 ?auto_571416 ) ) ( not ( = ?auto_571408 ?auto_571417 ) ) ( not ( = ?auto_571409 ?auto_571410 ) ) ( not ( = ?auto_571409 ?auto_571411 ) ) ( not ( = ?auto_571409 ?auto_571412 ) ) ( not ( = ?auto_571409 ?auto_571413 ) ) ( not ( = ?auto_571409 ?auto_571414 ) ) ( not ( = ?auto_571409 ?auto_571415 ) ) ( not ( = ?auto_571409 ?auto_571416 ) ) ( not ( = ?auto_571409 ?auto_571417 ) ) ( not ( = ?auto_571410 ?auto_571411 ) ) ( not ( = ?auto_571410 ?auto_571412 ) ) ( not ( = ?auto_571410 ?auto_571413 ) ) ( not ( = ?auto_571410 ?auto_571414 ) ) ( not ( = ?auto_571410 ?auto_571415 ) ) ( not ( = ?auto_571410 ?auto_571416 ) ) ( not ( = ?auto_571410 ?auto_571417 ) ) ( not ( = ?auto_571411 ?auto_571412 ) ) ( not ( = ?auto_571411 ?auto_571413 ) ) ( not ( = ?auto_571411 ?auto_571414 ) ) ( not ( = ?auto_571411 ?auto_571415 ) ) ( not ( = ?auto_571411 ?auto_571416 ) ) ( not ( = ?auto_571411 ?auto_571417 ) ) ( not ( = ?auto_571412 ?auto_571413 ) ) ( not ( = ?auto_571412 ?auto_571414 ) ) ( not ( = ?auto_571412 ?auto_571415 ) ) ( not ( = ?auto_571412 ?auto_571416 ) ) ( not ( = ?auto_571412 ?auto_571417 ) ) ( not ( = ?auto_571413 ?auto_571414 ) ) ( not ( = ?auto_571413 ?auto_571415 ) ) ( not ( = ?auto_571413 ?auto_571416 ) ) ( not ( = ?auto_571413 ?auto_571417 ) ) ( not ( = ?auto_571414 ?auto_571415 ) ) ( not ( = ?auto_571414 ?auto_571416 ) ) ( not ( = ?auto_571414 ?auto_571417 ) ) ( not ( = ?auto_571415 ?auto_571416 ) ) ( not ( = ?auto_571415 ?auto_571417 ) ) ( not ( = ?auto_571416 ?auto_571417 ) ) ( ON ?auto_571416 ?auto_571417 ) ( ON ?auto_571415 ?auto_571416 ) ( ON ?auto_571414 ?auto_571415 ) ( ON ?auto_571413 ?auto_571414 ) ( ON ?auto_571412 ?auto_571413 ) ( ON ?auto_571411 ?auto_571412 ) ( ON ?auto_571410 ?auto_571411 ) ( ON ?auto_571409 ?auto_571410 ) ( ON ?auto_571408 ?auto_571409 ) ( ON ?auto_571407 ?auto_571408 ) ( ON ?auto_571406 ?auto_571407 ) ( ON ?auto_571405 ?auto_571406 ) ( CLEAR ?auto_571403 ) ( ON ?auto_571404 ?auto_571405 ) ( CLEAR ?auto_571404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_571402 ?auto_571403 ?auto_571404 )
      ( MAKE-16PILE ?auto_571402 ?auto_571403 ?auto_571404 ?auto_571405 ?auto_571406 ?auto_571407 ?auto_571408 ?auto_571409 ?auto_571410 ?auto_571411 ?auto_571412 ?auto_571413 ?auto_571414 ?auto_571415 ?auto_571416 ?auto_571417 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_571434 - BLOCK
      ?auto_571435 - BLOCK
      ?auto_571436 - BLOCK
      ?auto_571437 - BLOCK
      ?auto_571438 - BLOCK
      ?auto_571439 - BLOCK
      ?auto_571440 - BLOCK
      ?auto_571441 - BLOCK
      ?auto_571442 - BLOCK
      ?auto_571443 - BLOCK
      ?auto_571444 - BLOCK
      ?auto_571445 - BLOCK
      ?auto_571446 - BLOCK
      ?auto_571447 - BLOCK
      ?auto_571448 - BLOCK
      ?auto_571449 - BLOCK
    )
    :vars
    (
      ?auto_571450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_571449 ?auto_571450 ) ( ON-TABLE ?auto_571434 ) ( not ( = ?auto_571434 ?auto_571435 ) ) ( not ( = ?auto_571434 ?auto_571436 ) ) ( not ( = ?auto_571434 ?auto_571437 ) ) ( not ( = ?auto_571434 ?auto_571438 ) ) ( not ( = ?auto_571434 ?auto_571439 ) ) ( not ( = ?auto_571434 ?auto_571440 ) ) ( not ( = ?auto_571434 ?auto_571441 ) ) ( not ( = ?auto_571434 ?auto_571442 ) ) ( not ( = ?auto_571434 ?auto_571443 ) ) ( not ( = ?auto_571434 ?auto_571444 ) ) ( not ( = ?auto_571434 ?auto_571445 ) ) ( not ( = ?auto_571434 ?auto_571446 ) ) ( not ( = ?auto_571434 ?auto_571447 ) ) ( not ( = ?auto_571434 ?auto_571448 ) ) ( not ( = ?auto_571434 ?auto_571449 ) ) ( not ( = ?auto_571434 ?auto_571450 ) ) ( not ( = ?auto_571435 ?auto_571436 ) ) ( not ( = ?auto_571435 ?auto_571437 ) ) ( not ( = ?auto_571435 ?auto_571438 ) ) ( not ( = ?auto_571435 ?auto_571439 ) ) ( not ( = ?auto_571435 ?auto_571440 ) ) ( not ( = ?auto_571435 ?auto_571441 ) ) ( not ( = ?auto_571435 ?auto_571442 ) ) ( not ( = ?auto_571435 ?auto_571443 ) ) ( not ( = ?auto_571435 ?auto_571444 ) ) ( not ( = ?auto_571435 ?auto_571445 ) ) ( not ( = ?auto_571435 ?auto_571446 ) ) ( not ( = ?auto_571435 ?auto_571447 ) ) ( not ( = ?auto_571435 ?auto_571448 ) ) ( not ( = ?auto_571435 ?auto_571449 ) ) ( not ( = ?auto_571435 ?auto_571450 ) ) ( not ( = ?auto_571436 ?auto_571437 ) ) ( not ( = ?auto_571436 ?auto_571438 ) ) ( not ( = ?auto_571436 ?auto_571439 ) ) ( not ( = ?auto_571436 ?auto_571440 ) ) ( not ( = ?auto_571436 ?auto_571441 ) ) ( not ( = ?auto_571436 ?auto_571442 ) ) ( not ( = ?auto_571436 ?auto_571443 ) ) ( not ( = ?auto_571436 ?auto_571444 ) ) ( not ( = ?auto_571436 ?auto_571445 ) ) ( not ( = ?auto_571436 ?auto_571446 ) ) ( not ( = ?auto_571436 ?auto_571447 ) ) ( not ( = ?auto_571436 ?auto_571448 ) ) ( not ( = ?auto_571436 ?auto_571449 ) ) ( not ( = ?auto_571436 ?auto_571450 ) ) ( not ( = ?auto_571437 ?auto_571438 ) ) ( not ( = ?auto_571437 ?auto_571439 ) ) ( not ( = ?auto_571437 ?auto_571440 ) ) ( not ( = ?auto_571437 ?auto_571441 ) ) ( not ( = ?auto_571437 ?auto_571442 ) ) ( not ( = ?auto_571437 ?auto_571443 ) ) ( not ( = ?auto_571437 ?auto_571444 ) ) ( not ( = ?auto_571437 ?auto_571445 ) ) ( not ( = ?auto_571437 ?auto_571446 ) ) ( not ( = ?auto_571437 ?auto_571447 ) ) ( not ( = ?auto_571437 ?auto_571448 ) ) ( not ( = ?auto_571437 ?auto_571449 ) ) ( not ( = ?auto_571437 ?auto_571450 ) ) ( not ( = ?auto_571438 ?auto_571439 ) ) ( not ( = ?auto_571438 ?auto_571440 ) ) ( not ( = ?auto_571438 ?auto_571441 ) ) ( not ( = ?auto_571438 ?auto_571442 ) ) ( not ( = ?auto_571438 ?auto_571443 ) ) ( not ( = ?auto_571438 ?auto_571444 ) ) ( not ( = ?auto_571438 ?auto_571445 ) ) ( not ( = ?auto_571438 ?auto_571446 ) ) ( not ( = ?auto_571438 ?auto_571447 ) ) ( not ( = ?auto_571438 ?auto_571448 ) ) ( not ( = ?auto_571438 ?auto_571449 ) ) ( not ( = ?auto_571438 ?auto_571450 ) ) ( not ( = ?auto_571439 ?auto_571440 ) ) ( not ( = ?auto_571439 ?auto_571441 ) ) ( not ( = ?auto_571439 ?auto_571442 ) ) ( not ( = ?auto_571439 ?auto_571443 ) ) ( not ( = ?auto_571439 ?auto_571444 ) ) ( not ( = ?auto_571439 ?auto_571445 ) ) ( not ( = ?auto_571439 ?auto_571446 ) ) ( not ( = ?auto_571439 ?auto_571447 ) ) ( not ( = ?auto_571439 ?auto_571448 ) ) ( not ( = ?auto_571439 ?auto_571449 ) ) ( not ( = ?auto_571439 ?auto_571450 ) ) ( not ( = ?auto_571440 ?auto_571441 ) ) ( not ( = ?auto_571440 ?auto_571442 ) ) ( not ( = ?auto_571440 ?auto_571443 ) ) ( not ( = ?auto_571440 ?auto_571444 ) ) ( not ( = ?auto_571440 ?auto_571445 ) ) ( not ( = ?auto_571440 ?auto_571446 ) ) ( not ( = ?auto_571440 ?auto_571447 ) ) ( not ( = ?auto_571440 ?auto_571448 ) ) ( not ( = ?auto_571440 ?auto_571449 ) ) ( not ( = ?auto_571440 ?auto_571450 ) ) ( not ( = ?auto_571441 ?auto_571442 ) ) ( not ( = ?auto_571441 ?auto_571443 ) ) ( not ( = ?auto_571441 ?auto_571444 ) ) ( not ( = ?auto_571441 ?auto_571445 ) ) ( not ( = ?auto_571441 ?auto_571446 ) ) ( not ( = ?auto_571441 ?auto_571447 ) ) ( not ( = ?auto_571441 ?auto_571448 ) ) ( not ( = ?auto_571441 ?auto_571449 ) ) ( not ( = ?auto_571441 ?auto_571450 ) ) ( not ( = ?auto_571442 ?auto_571443 ) ) ( not ( = ?auto_571442 ?auto_571444 ) ) ( not ( = ?auto_571442 ?auto_571445 ) ) ( not ( = ?auto_571442 ?auto_571446 ) ) ( not ( = ?auto_571442 ?auto_571447 ) ) ( not ( = ?auto_571442 ?auto_571448 ) ) ( not ( = ?auto_571442 ?auto_571449 ) ) ( not ( = ?auto_571442 ?auto_571450 ) ) ( not ( = ?auto_571443 ?auto_571444 ) ) ( not ( = ?auto_571443 ?auto_571445 ) ) ( not ( = ?auto_571443 ?auto_571446 ) ) ( not ( = ?auto_571443 ?auto_571447 ) ) ( not ( = ?auto_571443 ?auto_571448 ) ) ( not ( = ?auto_571443 ?auto_571449 ) ) ( not ( = ?auto_571443 ?auto_571450 ) ) ( not ( = ?auto_571444 ?auto_571445 ) ) ( not ( = ?auto_571444 ?auto_571446 ) ) ( not ( = ?auto_571444 ?auto_571447 ) ) ( not ( = ?auto_571444 ?auto_571448 ) ) ( not ( = ?auto_571444 ?auto_571449 ) ) ( not ( = ?auto_571444 ?auto_571450 ) ) ( not ( = ?auto_571445 ?auto_571446 ) ) ( not ( = ?auto_571445 ?auto_571447 ) ) ( not ( = ?auto_571445 ?auto_571448 ) ) ( not ( = ?auto_571445 ?auto_571449 ) ) ( not ( = ?auto_571445 ?auto_571450 ) ) ( not ( = ?auto_571446 ?auto_571447 ) ) ( not ( = ?auto_571446 ?auto_571448 ) ) ( not ( = ?auto_571446 ?auto_571449 ) ) ( not ( = ?auto_571446 ?auto_571450 ) ) ( not ( = ?auto_571447 ?auto_571448 ) ) ( not ( = ?auto_571447 ?auto_571449 ) ) ( not ( = ?auto_571447 ?auto_571450 ) ) ( not ( = ?auto_571448 ?auto_571449 ) ) ( not ( = ?auto_571448 ?auto_571450 ) ) ( not ( = ?auto_571449 ?auto_571450 ) ) ( ON ?auto_571448 ?auto_571449 ) ( ON ?auto_571447 ?auto_571448 ) ( ON ?auto_571446 ?auto_571447 ) ( ON ?auto_571445 ?auto_571446 ) ( ON ?auto_571444 ?auto_571445 ) ( ON ?auto_571443 ?auto_571444 ) ( ON ?auto_571442 ?auto_571443 ) ( ON ?auto_571441 ?auto_571442 ) ( ON ?auto_571440 ?auto_571441 ) ( ON ?auto_571439 ?auto_571440 ) ( ON ?auto_571438 ?auto_571439 ) ( ON ?auto_571437 ?auto_571438 ) ( ON ?auto_571436 ?auto_571437 ) ( CLEAR ?auto_571434 ) ( ON ?auto_571435 ?auto_571436 ) ( CLEAR ?auto_571435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_571434 ?auto_571435 )
      ( MAKE-16PILE ?auto_571434 ?auto_571435 ?auto_571436 ?auto_571437 ?auto_571438 ?auto_571439 ?auto_571440 ?auto_571441 ?auto_571442 ?auto_571443 ?auto_571444 ?auto_571445 ?auto_571446 ?auto_571447 ?auto_571448 ?auto_571449 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_571467 - BLOCK
      ?auto_571468 - BLOCK
      ?auto_571469 - BLOCK
      ?auto_571470 - BLOCK
      ?auto_571471 - BLOCK
      ?auto_571472 - BLOCK
      ?auto_571473 - BLOCK
      ?auto_571474 - BLOCK
      ?auto_571475 - BLOCK
      ?auto_571476 - BLOCK
      ?auto_571477 - BLOCK
      ?auto_571478 - BLOCK
      ?auto_571479 - BLOCK
      ?auto_571480 - BLOCK
      ?auto_571481 - BLOCK
      ?auto_571482 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_571482 ) ( ON-TABLE ?auto_571467 ) ( not ( = ?auto_571467 ?auto_571468 ) ) ( not ( = ?auto_571467 ?auto_571469 ) ) ( not ( = ?auto_571467 ?auto_571470 ) ) ( not ( = ?auto_571467 ?auto_571471 ) ) ( not ( = ?auto_571467 ?auto_571472 ) ) ( not ( = ?auto_571467 ?auto_571473 ) ) ( not ( = ?auto_571467 ?auto_571474 ) ) ( not ( = ?auto_571467 ?auto_571475 ) ) ( not ( = ?auto_571467 ?auto_571476 ) ) ( not ( = ?auto_571467 ?auto_571477 ) ) ( not ( = ?auto_571467 ?auto_571478 ) ) ( not ( = ?auto_571467 ?auto_571479 ) ) ( not ( = ?auto_571467 ?auto_571480 ) ) ( not ( = ?auto_571467 ?auto_571481 ) ) ( not ( = ?auto_571467 ?auto_571482 ) ) ( not ( = ?auto_571468 ?auto_571469 ) ) ( not ( = ?auto_571468 ?auto_571470 ) ) ( not ( = ?auto_571468 ?auto_571471 ) ) ( not ( = ?auto_571468 ?auto_571472 ) ) ( not ( = ?auto_571468 ?auto_571473 ) ) ( not ( = ?auto_571468 ?auto_571474 ) ) ( not ( = ?auto_571468 ?auto_571475 ) ) ( not ( = ?auto_571468 ?auto_571476 ) ) ( not ( = ?auto_571468 ?auto_571477 ) ) ( not ( = ?auto_571468 ?auto_571478 ) ) ( not ( = ?auto_571468 ?auto_571479 ) ) ( not ( = ?auto_571468 ?auto_571480 ) ) ( not ( = ?auto_571468 ?auto_571481 ) ) ( not ( = ?auto_571468 ?auto_571482 ) ) ( not ( = ?auto_571469 ?auto_571470 ) ) ( not ( = ?auto_571469 ?auto_571471 ) ) ( not ( = ?auto_571469 ?auto_571472 ) ) ( not ( = ?auto_571469 ?auto_571473 ) ) ( not ( = ?auto_571469 ?auto_571474 ) ) ( not ( = ?auto_571469 ?auto_571475 ) ) ( not ( = ?auto_571469 ?auto_571476 ) ) ( not ( = ?auto_571469 ?auto_571477 ) ) ( not ( = ?auto_571469 ?auto_571478 ) ) ( not ( = ?auto_571469 ?auto_571479 ) ) ( not ( = ?auto_571469 ?auto_571480 ) ) ( not ( = ?auto_571469 ?auto_571481 ) ) ( not ( = ?auto_571469 ?auto_571482 ) ) ( not ( = ?auto_571470 ?auto_571471 ) ) ( not ( = ?auto_571470 ?auto_571472 ) ) ( not ( = ?auto_571470 ?auto_571473 ) ) ( not ( = ?auto_571470 ?auto_571474 ) ) ( not ( = ?auto_571470 ?auto_571475 ) ) ( not ( = ?auto_571470 ?auto_571476 ) ) ( not ( = ?auto_571470 ?auto_571477 ) ) ( not ( = ?auto_571470 ?auto_571478 ) ) ( not ( = ?auto_571470 ?auto_571479 ) ) ( not ( = ?auto_571470 ?auto_571480 ) ) ( not ( = ?auto_571470 ?auto_571481 ) ) ( not ( = ?auto_571470 ?auto_571482 ) ) ( not ( = ?auto_571471 ?auto_571472 ) ) ( not ( = ?auto_571471 ?auto_571473 ) ) ( not ( = ?auto_571471 ?auto_571474 ) ) ( not ( = ?auto_571471 ?auto_571475 ) ) ( not ( = ?auto_571471 ?auto_571476 ) ) ( not ( = ?auto_571471 ?auto_571477 ) ) ( not ( = ?auto_571471 ?auto_571478 ) ) ( not ( = ?auto_571471 ?auto_571479 ) ) ( not ( = ?auto_571471 ?auto_571480 ) ) ( not ( = ?auto_571471 ?auto_571481 ) ) ( not ( = ?auto_571471 ?auto_571482 ) ) ( not ( = ?auto_571472 ?auto_571473 ) ) ( not ( = ?auto_571472 ?auto_571474 ) ) ( not ( = ?auto_571472 ?auto_571475 ) ) ( not ( = ?auto_571472 ?auto_571476 ) ) ( not ( = ?auto_571472 ?auto_571477 ) ) ( not ( = ?auto_571472 ?auto_571478 ) ) ( not ( = ?auto_571472 ?auto_571479 ) ) ( not ( = ?auto_571472 ?auto_571480 ) ) ( not ( = ?auto_571472 ?auto_571481 ) ) ( not ( = ?auto_571472 ?auto_571482 ) ) ( not ( = ?auto_571473 ?auto_571474 ) ) ( not ( = ?auto_571473 ?auto_571475 ) ) ( not ( = ?auto_571473 ?auto_571476 ) ) ( not ( = ?auto_571473 ?auto_571477 ) ) ( not ( = ?auto_571473 ?auto_571478 ) ) ( not ( = ?auto_571473 ?auto_571479 ) ) ( not ( = ?auto_571473 ?auto_571480 ) ) ( not ( = ?auto_571473 ?auto_571481 ) ) ( not ( = ?auto_571473 ?auto_571482 ) ) ( not ( = ?auto_571474 ?auto_571475 ) ) ( not ( = ?auto_571474 ?auto_571476 ) ) ( not ( = ?auto_571474 ?auto_571477 ) ) ( not ( = ?auto_571474 ?auto_571478 ) ) ( not ( = ?auto_571474 ?auto_571479 ) ) ( not ( = ?auto_571474 ?auto_571480 ) ) ( not ( = ?auto_571474 ?auto_571481 ) ) ( not ( = ?auto_571474 ?auto_571482 ) ) ( not ( = ?auto_571475 ?auto_571476 ) ) ( not ( = ?auto_571475 ?auto_571477 ) ) ( not ( = ?auto_571475 ?auto_571478 ) ) ( not ( = ?auto_571475 ?auto_571479 ) ) ( not ( = ?auto_571475 ?auto_571480 ) ) ( not ( = ?auto_571475 ?auto_571481 ) ) ( not ( = ?auto_571475 ?auto_571482 ) ) ( not ( = ?auto_571476 ?auto_571477 ) ) ( not ( = ?auto_571476 ?auto_571478 ) ) ( not ( = ?auto_571476 ?auto_571479 ) ) ( not ( = ?auto_571476 ?auto_571480 ) ) ( not ( = ?auto_571476 ?auto_571481 ) ) ( not ( = ?auto_571476 ?auto_571482 ) ) ( not ( = ?auto_571477 ?auto_571478 ) ) ( not ( = ?auto_571477 ?auto_571479 ) ) ( not ( = ?auto_571477 ?auto_571480 ) ) ( not ( = ?auto_571477 ?auto_571481 ) ) ( not ( = ?auto_571477 ?auto_571482 ) ) ( not ( = ?auto_571478 ?auto_571479 ) ) ( not ( = ?auto_571478 ?auto_571480 ) ) ( not ( = ?auto_571478 ?auto_571481 ) ) ( not ( = ?auto_571478 ?auto_571482 ) ) ( not ( = ?auto_571479 ?auto_571480 ) ) ( not ( = ?auto_571479 ?auto_571481 ) ) ( not ( = ?auto_571479 ?auto_571482 ) ) ( not ( = ?auto_571480 ?auto_571481 ) ) ( not ( = ?auto_571480 ?auto_571482 ) ) ( not ( = ?auto_571481 ?auto_571482 ) ) ( ON ?auto_571481 ?auto_571482 ) ( ON ?auto_571480 ?auto_571481 ) ( ON ?auto_571479 ?auto_571480 ) ( ON ?auto_571478 ?auto_571479 ) ( ON ?auto_571477 ?auto_571478 ) ( ON ?auto_571476 ?auto_571477 ) ( ON ?auto_571475 ?auto_571476 ) ( ON ?auto_571474 ?auto_571475 ) ( ON ?auto_571473 ?auto_571474 ) ( ON ?auto_571472 ?auto_571473 ) ( ON ?auto_571471 ?auto_571472 ) ( ON ?auto_571470 ?auto_571471 ) ( ON ?auto_571469 ?auto_571470 ) ( CLEAR ?auto_571467 ) ( ON ?auto_571468 ?auto_571469 ) ( CLEAR ?auto_571468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_571467 ?auto_571468 )
      ( MAKE-16PILE ?auto_571467 ?auto_571468 ?auto_571469 ?auto_571470 ?auto_571471 ?auto_571472 ?auto_571473 ?auto_571474 ?auto_571475 ?auto_571476 ?auto_571477 ?auto_571478 ?auto_571479 ?auto_571480 ?auto_571481 ?auto_571482 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_571499 - BLOCK
      ?auto_571500 - BLOCK
      ?auto_571501 - BLOCK
      ?auto_571502 - BLOCK
      ?auto_571503 - BLOCK
      ?auto_571504 - BLOCK
      ?auto_571505 - BLOCK
      ?auto_571506 - BLOCK
      ?auto_571507 - BLOCK
      ?auto_571508 - BLOCK
      ?auto_571509 - BLOCK
      ?auto_571510 - BLOCK
      ?auto_571511 - BLOCK
      ?auto_571512 - BLOCK
      ?auto_571513 - BLOCK
      ?auto_571514 - BLOCK
    )
    :vars
    (
      ?auto_571515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_571514 ?auto_571515 ) ( not ( = ?auto_571499 ?auto_571500 ) ) ( not ( = ?auto_571499 ?auto_571501 ) ) ( not ( = ?auto_571499 ?auto_571502 ) ) ( not ( = ?auto_571499 ?auto_571503 ) ) ( not ( = ?auto_571499 ?auto_571504 ) ) ( not ( = ?auto_571499 ?auto_571505 ) ) ( not ( = ?auto_571499 ?auto_571506 ) ) ( not ( = ?auto_571499 ?auto_571507 ) ) ( not ( = ?auto_571499 ?auto_571508 ) ) ( not ( = ?auto_571499 ?auto_571509 ) ) ( not ( = ?auto_571499 ?auto_571510 ) ) ( not ( = ?auto_571499 ?auto_571511 ) ) ( not ( = ?auto_571499 ?auto_571512 ) ) ( not ( = ?auto_571499 ?auto_571513 ) ) ( not ( = ?auto_571499 ?auto_571514 ) ) ( not ( = ?auto_571499 ?auto_571515 ) ) ( not ( = ?auto_571500 ?auto_571501 ) ) ( not ( = ?auto_571500 ?auto_571502 ) ) ( not ( = ?auto_571500 ?auto_571503 ) ) ( not ( = ?auto_571500 ?auto_571504 ) ) ( not ( = ?auto_571500 ?auto_571505 ) ) ( not ( = ?auto_571500 ?auto_571506 ) ) ( not ( = ?auto_571500 ?auto_571507 ) ) ( not ( = ?auto_571500 ?auto_571508 ) ) ( not ( = ?auto_571500 ?auto_571509 ) ) ( not ( = ?auto_571500 ?auto_571510 ) ) ( not ( = ?auto_571500 ?auto_571511 ) ) ( not ( = ?auto_571500 ?auto_571512 ) ) ( not ( = ?auto_571500 ?auto_571513 ) ) ( not ( = ?auto_571500 ?auto_571514 ) ) ( not ( = ?auto_571500 ?auto_571515 ) ) ( not ( = ?auto_571501 ?auto_571502 ) ) ( not ( = ?auto_571501 ?auto_571503 ) ) ( not ( = ?auto_571501 ?auto_571504 ) ) ( not ( = ?auto_571501 ?auto_571505 ) ) ( not ( = ?auto_571501 ?auto_571506 ) ) ( not ( = ?auto_571501 ?auto_571507 ) ) ( not ( = ?auto_571501 ?auto_571508 ) ) ( not ( = ?auto_571501 ?auto_571509 ) ) ( not ( = ?auto_571501 ?auto_571510 ) ) ( not ( = ?auto_571501 ?auto_571511 ) ) ( not ( = ?auto_571501 ?auto_571512 ) ) ( not ( = ?auto_571501 ?auto_571513 ) ) ( not ( = ?auto_571501 ?auto_571514 ) ) ( not ( = ?auto_571501 ?auto_571515 ) ) ( not ( = ?auto_571502 ?auto_571503 ) ) ( not ( = ?auto_571502 ?auto_571504 ) ) ( not ( = ?auto_571502 ?auto_571505 ) ) ( not ( = ?auto_571502 ?auto_571506 ) ) ( not ( = ?auto_571502 ?auto_571507 ) ) ( not ( = ?auto_571502 ?auto_571508 ) ) ( not ( = ?auto_571502 ?auto_571509 ) ) ( not ( = ?auto_571502 ?auto_571510 ) ) ( not ( = ?auto_571502 ?auto_571511 ) ) ( not ( = ?auto_571502 ?auto_571512 ) ) ( not ( = ?auto_571502 ?auto_571513 ) ) ( not ( = ?auto_571502 ?auto_571514 ) ) ( not ( = ?auto_571502 ?auto_571515 ) ) ( not ( = ?auto_571503 ?auto_571504 ) ) ( not ( = ?auto_571503 ?auto_571505 ) ) ( not ( = ?auto_571503 ?auto_571506 ) ) ( not ( = ?auto_571503 ?auto_571507 ) ) ( not ( = ?auto_571503 ?auto_571508 ) ) ( not ( = ?auto_571503 ?auto_571509 ) ) ( not ( = ?auto_571503 ?auto_571510 ) ) ( not ( = ?auto_571503 ?auto_571511 ) ) ( not ( = ?auto_571503 ?auto_571512 ) ) ( not ( = ?auto_571503 ?auto_571513 ) ) ( not ( = ?auto_571503 ?auto_571514 ) ) ( not ( = ?auto_571503 ?auto_571515 ) ) ( not ( = ?auto_571504 ?auto_571505 ) ) ( not ( = ?auto_571504 ?auto_571506 ) ) ( not ( = ?auto_571504 ?auto_571507 ) ) ( not ( = ?auto_571504 ?auto_571508 ) ) ( not ( = ?auto_571504 ?auto_571509 ) ) ( not ( = ?auto_571504 ?auto_571510 ) ) ( not ( = ?auto_571504 ?auto_571511 ) ) ( not ( = ?auto_571504 ?auto_571512 ) ) ( not ( = ?auto_571504 ?auto_571513 ) ) ( not ( = ?auto_571504 ?auto_571514 ) ) ( not ( = ?auto_571504 ?auto_571515 ) ) ( not ( = ?auto_571505 ?auto_571506 ) ) ( not ( = ?auto_571505 ?auto_571507 ) ) ( not ( = ?auto_571505 ?auto_571508 ) ) ( not ( = ?auto_571505 ?auto_571509 ) ) ( not ( = ?auto_571505 ?auto_571510 ) ) ( not ( = ?auto_571505 ?auto_571511 ) ) ( not ( = ?auto_571505 ?auto_571512 ) ) ( not ( = ?auto_571505 ?auto_571513 ) ) ( not ( = ?auto_571505 ?auto_571514 ) ) ( not ( = ?auto_571505 ?auto_571515 ) ) ( not ( = ?auto_571506 ?auto_571507 ) ) ( not ( = ?auto_571506 ?auto_571508 ) ) ( not ( = ?auto_571506 ?auto_571509 ) ) ( not ( = ?auto_571506 ?auto_571510 ) ) ( not ( = ?auto_571506 ?auto_571511 ) ) ( not ( = ?auto_571506 ?auto_571512 ) ) ( not ( = ?auto_571506 ?auto_571513 ) ) ( not ( = ?auto_571506 ?auto_571514 ) ) ( not ( = ?auto_571506 ?auto_571515 ) ) ( not ( = ?auto_571507 ?auto_571508 ) ) ( not ( = ?auto_571507 ?auto_571509 ) ) ( not ( = ?auto_571507 ?auto_571510 ) ) ( not ( = ?auto_571507 ?auto_571511 ) ) ( not ( = ?auto_571507 ?auto_571512 ) ) ( not ( = ?auto_571507 ?auto_571513 ) ) ( not ( = ?auto_571507 ?auto_571514 ) ) ( not ( = ?auto_571507 ?auto_571515 ) ) ( not ( = ?auto_571508 ?auto_571509 ) ) ( not ( = ?auto_571508 ?auto_571510 ) ) ( not ( = ?auto_571508 ?auto_571511 ) ) ( not ( = ?auto_571508 ?auto_571512 ) ) ( not ( = ?auto_571508 ?auto_571513 ) ) ( not ( = ?auto_571508 ?auto_571514 ) ) ( not ( = ?auto_571508 ?auto_571515 ) ) ( not ( = ?auto_571509 ?auto_571510 ) ) ( not ( = ?auto_571509 ?auto_571511 ) ) ( not ( = ?auto_571509 ?auto_571512 ) ) ( not ( = ?auto_571509 ?auto_571513 ) ) ( not ( = ?auto_571509 ?auto_571514 ) ) ( not ( = ?auto_571509 ?auto_571515 ) ) ( not ( = ?auto_571510 ?auto_571511 ) ) ( not ( = ?auto_571510 ?auto_571512 ) ) ( not ( = ?auto_571510 ?auto_571513 ) ) ( not ( = ?auto_571510 ?auto_571514 ) ) ( not ( = ?auto_571510 ?auto_571515 ) ) ( not ( = ?auto_571511 ?auto_571512 ) ) ( not ( = ?auto_571511 ?auto_571513 ) ) ( not ( = ?auto_571511 ?auto_571514 ) ) ( not ( = ?auto_571511 ?auto_571515 ) ) ( not ( = ?auto_571512 ?auto_571513 ) ) ( not ( = ?auto_571512 ?auto_571514 ) ) ( not ( = ?auto_571512 ?auto_571515 ) ) ( not ( = ?auto_571513 ?auto_571514 ) ) ( not ( = ?auto_571513 ?auto_571515 ) ) ( not ( = ?auto_571514 ?auto_571515 ) ) ( ON ?auto_571513 ?auto_571514 ) ( ON ?auto_571512 ?auto_571513 ) ( ON ?auto_571511 ?auto_571512 ) ( ON ?auto_571510 ?auto_571511 ) ( ON ?auto_571509 ?auto_571510 ) ( ON ?auto_571508 ?auto_571509 ) ( ON ?auto_571507 ?auto_571508 ) ( ON ?auto_571506 ?auto_571507 ) ( ON ?auto_571505 ?auto_571506 ) ( ON ?auto_571504 ?auto_571505 ) ( ON ?auto_571503 ?auto_571504 ) ( ON ?auto_571502 ?auto_571503 ) ( ON ?auto_571501 ?auto_571502 ) ( ON ?auto_571500 ?auto_571501 ) ( ON ?auto_571499 ?auto_571500 ) ( CLEAR ?auto_571499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_571499 )
      ( MAKE-16PILE ?auto_571499 ?auto_571500 ?auto_571501 ?auto_571502 ?auto_571503 ?auto_571504 ?auto_571505 ?auto_571506 ?auto_571507 ?auto_571508 ?auto_571509 ?auto_571510 ?auto_571511 ?auto_571512 ?auto_571513 ?auto_571514 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_571532 - BLOCK
      ?auto_571533 - BLOCK
      ?auto_571534 - BLOCK
      ?auto_571535 - BLOCK
      ?auto_571536 - BLOCK
      ?auto_571537 - BLOCK
      ?auto_571538 - BLOCK
      ?auto_571539 - BLOCK
      ?auto_571540 - BLOCK
      ?auto_571541 - BLOCK
      ?auto_571542 - BLOCK
      ?auto_571543 - BLOCK
      ?auto_571544 - BLOCK
      ?auto_571545 - BLOCK
      ?auto_571546 - BLOCK
      ?auto_571547 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_571547 ) ( not ( = ?auto_571532 ?auto_571533 ) ) ( not ( = ?auto_571532 ?auto_571534 ) ) ( not ( = ?auto_571532 ?auto_571535 ) ) ( not ( = ?auto_571532 ?auto_571536 ) ) ( not ( = ?auto_571532 ?auto_571537 ) ) ( not ( = ?auto_571532 ?auto_571538 ) ) ( not ( = ?auto_571532 ?auto_571539 ) ) ( not ( = ?auto_571532 ?auto_571540 ) ) ( not ( = ?auto_571532 ?auto_571541 ) ) ( not ( = ?auto_571532 ?auto_571542 ) ) ( not ( = ?auto_571532 ?auto_571543 ) ) ( not ( = ?auto_571532 ?auto_571544 ) ) ( not ( = ?auto_571532 ?auto_571545 ) ) ( not ( = ?auto_571532 ?auto_571546 ) ) ( not ( = ?auto_571532 ?auto_571547 ) ) ( not ( = ?auto_571533 ?auto_571534 ) ) ( not ( = ?auto_571533 ?auto_571535 ) ) ( not ( = ?auto_571533 ?auto_571536 ) ) ( not ( = ?auto_571533 ?auto_571537 ) ) ( not ( = ?auto_571533 ?auto_571538 ) ) ( not ( = ?auto_571533 ?auto_571539 ) ) ( not ( = ?auto_571533 ?auto_571540 ) ) ( not ( = ?auto_571533 ?auto_571541 ) ) ( not ( = ?auto_571533 ?auto_571542 ) ) ( not ( = ?auto_571533 ?auto_571543 ) ) ( not ( = ?auto_571533 ?auto_571544 ) ) ( not ( = ?auto_571533 ?auto_571545 ) ) ( not ( = ?auto_571533 ?auto_571546 ) ) ( not ( = ?auto_571533 ?auto_571547 ) ) ( not ( = ?auto_571534 ?auto_571535 ) ) ( not ( = ?auto_571534 ?auto_571536 ) ) ( not ( = ?auto_571534 ?auto_571537 ) ) ( not ( = ?auto_571534 ?auto_571538 ) ) ( not ( = ?auto_571534 ?auto_571539 ) ) ( not ( = ?auto_571534 ?auto_571540 ) ) ( not ( = ?auto_571534 ?auto_571541 ) ) ( not ( = ?auto_571534 ?auto_571542 ) ) ( not ( = ?auto_571534 ?auto_571543 ) ) ( not ( = ?auto_571534 ?auto_571544 ) ) ( not ( = ?auto_571534 ?auto_571545 ) ) ( not ( = ?auto_571534 ?auto_571546 ) ) ( not ( = ?auto_571534 ?auto_571547 ) ) ( not ( = ?auto_571535 ?auto_571536 ) ) ( not ( = ?auto_571535 ?auto_571537 ) ) ( not ( = ?auto_571535 ?auto_571538 ) ) ( not ( = ?auto_571535 ?auto_571539 ) ) ( not ( = ?auto_571535 ?auto_571540 ) ) ( not ( = ?auto_571535 ?auto_571541 ) ) ( not ( = ?auto_571535 ?auto_571542 ) ) ( not ( = ?auto_571535 ?auto_571543 ) ) ( not ( = ?auto_571535 ?auto_571544 ) ) ( not ( = ?auto_571535 ?auto_571545 ) ) ( not ( = ?auto_571535 ?auto_571546 ) ) ( not ( = ?auto_571535 ?auto_571547 ) ) ( not ( = ?auto_571536 ?auto_571537 ) ) ( not ( = ?auto_571536 ?auto_571538 ) ) ( not ( = ?auto_571536 ?auto_571539 ) ) ( not ( = ?auto_571536 ?auto_571540 ) ) ( not ( = ?auto_571536 ?auto_571541 ) ) ( not ( = ?auto_571536 ?auto_571542 ) ) ( not ( = ?auto_571536 ?auto_571543 ) ) ( not ( = ?auto_571536 ?auto_571544 ) ) ( not ( = ?auto_571536 ?auto_571545 ) ) ( not ( = ?auto_571536 ?auto_571546 ) ) ( not ( = ?auto_571536 ?auto_571547 ) ) ( not ( = ?auto_571537 ?auto_571538 ) ) ( not ( = ?auto_571537 ?auto_571539 ) ) ( not ( = ?auto_571537 ?auto_571540 ) ) ( not ( = ?auto_571537 ?auto_571541 ) ) ( not ( = ?auto_571537 ?auto_571542 ) ) ( not ( = ?auto_571537 ?auto_571543 ) ) ( not ( = ?auto_571537 ?auto_571544 ) ) ( not ( = ?auto_571537 ?auto_571545 ) ) ( not ( = ?auto_571537 ?auto_571546 ) ) ( not ( = ?auto_571537 ?auto_571547 ) ) ( not ( = ?auto_571538 ?auto_571539 ) ) ( not ( = ?auto_571538 ?auto_571540 ) ) ( not ( = ?auto_571538 ?auto_571541 ) ) ( not ( = ?auto_571538 ?auto_571542 ) ) ( not ( = ?auto_571538 ?auto_571543 ) ) ( not ( = ?auto_571538 ?auto_571544 ) ) ( not ( = ?auto_571538 ?auto_571545 ) ) ( not ( = ?auto_571538 ?auto_571546 ) ) ( not ( = ?auto_571538 ?auto_571547 ) ) ( not ( = ?auto_571539 ?auto_571540 ) ) ( not ( = ?auto_571539 ?auto_571541 ) ) ( not ( = ?auto_571539 ?auto_571542 ) ) ( not ( = ?auto_571539 ?auto_571543 ) ) ( not ( = ?auto_571539 ?auto_571544 ) ) ( not ( = ?auto_571539 ?auto_571545 ) ) ( not ( = ?auto_571539 ?auto_571546 ) ) ( not ( = ?auto_571539 ?auto_571547 ) ) ( not ( = ?auto_571540 ?auto_571541 ) ) ( not ( = ?auto_571540 ?auto_571542 ) ) ( not ( = ?auto_571540 ?auto_571543 ) ) ( not ( = ?auto_571540 ?auto_571544 ) ) ( not ( = ?auto_571540 ?auto_571545 ) ) ( not ( = ?auto_571540 ?auto_571546 ) ) ( not ( = ?auto_571540 ?auto_571547 ) ) ( not ( = ?auto_571541 ?auto_571542 ) ) ( not ( = ?auto_571541 ?auto_571543 ) ) ( not ( = ?auto_571541 ?auto_571544 ) ) ( not ( = ?auto_571541 ?auto_571545 ) ) ( not ( = ?auto_571541 ?auto_571546 ) ) ( not ( = ?auto_571541 ?auto_571547 ) ) ( not ( = ?auto_571542 ?auto_571543 ) ) ( not ( = ?auto_571542 ?auto_571544 ) ) ( not ( = ?auto_571542 ?auto_571545 ) ) ( not ( = ?auto_571542 ?auto_571546 ) ) ( not ( = ?auto_571542 ?auto_571547 ) ) ( not ( = ?auto_571543 ?auto_571544 ) ) ( not ( = ?auto_571543 ?auto_571545 ) ) ( not ( = ?auto_571543 ?auto_571546 ) ) ( not ( = ?auto_571543 ?auto_571547 ) ) ( not ( = ?auto_571544 ?auto_571545 ) ) ( not ( = ?auto_571544 ?auto_571546 ) ) ( not ( = ?auto_571544 ?auto_571547 ) ) ( not ( = ?auto_571545 ?auto_571546 ) ) ( not ( = ?auto_571545 ?auto_571547 ) ) ( not ( = ?auto_571546 ?auto_571547 ) ) ( ON ?auto_571546 ?auto_571547 ) ( ON ?auto_571545 ?auto_571546 ) ( ON ?auto_571544 ?auto_571545 ) ( ON ?auto_571543 ?auto_571544 ) ( ON ?auto_571542 ?auto_571543 ) ( ON ?auto_571541 ?auto_571542 ) ( ON ?auto_571540 ?auto_571541 ) ( ON ?auto_571539 ?auto_571540 ) ( ON ?auto_571538 ?auto_571539 ) ( ON ?auto_571537 ?auto_571538 ) ( ON ?auto_571536 ?auto_571537 ) ( ON ?auto_571535 ?auto_571536 ) ( ON ?auto_571534 ?auto_571535 ) ( ON ?auto_571533 ?auto_571534 ) ( ON ?auto_571532 ?auto_571533 ) ( CLEAR ?auto_571532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_571532 )
      ( MAKE-16PILE ?auto_571532 ?auto_571533 ?auto_571534 ?auto_571535 ?auto_571536 ?auto_571537 ?auto_571538 ?auto_571539 ?auto_571540 ?auto_571541 ?auto_571542 ?auto_571543 ?auto_571544 ?auto_571545 ?auto_571546 ?auto_571547 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_571564 - BLOCK
      ?auto_571565 - BLOCK
      ?auto_571566 - BLOCK
      ?auto_571567 - BLOCK
      ?auto_571568 - BLOCK
      ?auto_571569 - BLOCK
      ?auto_571570 - BLOCK
      ?auto_571571 - BLOCK
      ?auto_571572 - BLOCK
      ?auto_571573 - BLOCK
      ?auto_571574 - BLOCK
      ?auto_571575 - BLOCK
      ?auto_571576 - BLOCK
      ?auto_571577 - BLOCK
      ?auto_571578 - BLOCK
      ?auto_571579 - BLOCK
    )
    :vars
    (
      ?auto_571580 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_571564 ?auto_571565 ) ) ( not ( = ?auto_571564 ?auto_571566 ) ) ( not ( = ?auto_571564 ?auto_571567 ) ) ( not ( = ?auto_571564 ?auto_571568 ) ) ( not ( = ?auto_571564 ?auto_571569 ) ) ( not ( = ?auto_571564 ?auto_571570 ) ) ( not ( = ?auto_571564 ?auto_571571 ) ) ( not ( = ?auto_571564 ?auto_571572 ) ) ( not ( = ?auto_571564 ?auto_571573 ) ) ( not ( = ?auto_571564 ?auto_571574 ) ) ( not ( = ?auto_571564 ?auto_571575 ) ) ( not ( = ?auto_571564 ?auto_571576 ) ) ( not ( = ?auto_571564 ?auto_571577 ) ) ( not ( = ?auto_571564 ?auto_571578 ) ) ( not ( = ?auto_571564 ?auto_571579 ) ) ( not ( = ?auto_571565 ?auto_571566 ) ) ( not ( = ?auto_571565 ?auto_571567 ) ) ( not ( = ?auto_571565 ?auto_571568 ) ) ( not ( = ?auto_571565 ?auto_571569 ) ) ( not ( = ?auto_571565 ?auto_571570 ) ) ( not ( = ?auto_571565 ?auto_571571 ) ) ( not ( = ?auto_571565 ?auto_571572 ) ) ( not ( = ?auto_571565 ?auto_571573 ) ) ( not ( = ?auto_571565 ?auto_571574 ) ) ( not ( = ?auto_571565 ?auto_571575 ) ) ( not ( = ?auto_571565 ?auto_571576 ) ) ( not ( = ?auto_571565 ?auto_571577 ) ) ( not ( = ?auto_571565 ?auto_571578 ) ) ( not ( = ?auto_571565 ?auto_571579 ) ) ( not ( = ?auto_571566 ?auto_571567 ) ) ( not ( = ?auto_571566 ?auto_571568 ) ) ( not ( = ?auto_571566 ?auto_571569 ) ) ( not ( = ?auto_571566 ?auto_571570 ) ) ( not ( = ?auto_571566 ?auto_571571 ) ) ( not ( = ?auto_571566 ?auto_571572 ) ) ( not ( = ?auto_571566 ?auto_571573 ) ) ( not ( = ?auto_571566 ?auto_571574 ) ) ( not ( = ?auto_571566 ?auto_571575 ) ) ( not ( = ?auto_571566 ?auto_571576 ) ) ( not ( = ?auto_571566 ?auto_571577 ) ) ( not ( = ?auto_571566 ?auto_571578 ) ) ( not ( = ?auto_571566 ?auto_571579 ) ) ( not ( = ?auto_571567 ?auto_571568 ) ) ( not ( = ?auto_571567 ?auto_571569 ) ) ( not ( = ?auto_571567 ?auto_571570 ) ) ( not ( = ?auto_571567 ?auto_571571 ) ) ( not ( = ?auto_571567 ?auto_571572 ) ) ( not ( = ?auto_571567 ?auto_571573 ) ) ( not ( = ?auto_571567 ?auto_571574 ) ) ( not ( = ?auto_571567 ?auto_571575 ) ) ( not ( = ?auto_571567 ?auto_571576 ) ) ( not ( = ?auto_571567 ?auto_571577 ) ) ( not ( = ?auto_571567 ?auto_571578 ) ) ( not ( = ?auto_571567 ?auto_571579 ) ) ( not ( = ?auto_571568 ?auto_571569 ) ) ( not ( = ?auto_571568 ?auto_571570 ) ) ( not ( = ?auto_571568 ?auto_571571 ) ) ( not ( = ?auto_571568 ?auto_571572 ) ) ( not ( = ?auto_571568 ?auto_571573 ) ) ( not ( = ?auto_571568 ?auto_571574 ) ) ( not ( = ?auto_571568 ?auto_571575 ) ) ( not ( = ?auto_571568 ?auto_571576 ) ) ( not ( = ?auto_571568 ?auto_571577 ) ) ( not ( = ?auto_571568 ?auto_571578 ) ) ( not ( = ?auto_571568 ?auto_571579 ) ) ( not ( = ?auto_571569 ?auto_571570 ) ) ( not ( = ?auto_571569 ?auto_571571 ) ) ( not ( = ?auto_571569 ?auto_571572 ) ) ( not ( = ?auto_571569 ?auto_571573 ) ) ( not ( = ?auto_571569 ?auto_571574 ) ) ( not ( = ?auto_571569 ?auto_571575 ) ) ( not ( = ?auto_571569 ?auto_571576 ) ) ( not ( = ?auto_571569 ?auto_571577 ) ) ( not ( = ?auto_571569 ?auto_571578 ) ) ( not ( = ?auto_571569 ?auto_571579 ) ) ( not ( = ?auto_571570 ?auto_571571 ) ) ( not ( = ?auto_571570 ?auto_571572 ) ) ( not ( = ?auto_571570 ?auto_571573 ) ) ( not ( = ?auto_571570 ?auto_571574 ) ) ( not ( = ?auto_571570 ?auto_571575 ) ) ( not ( = ?auto_571570 ?auto_571576 ) ) ( not ( = ?auto_571570 ?auto_571577 ) ) ( not ( = ?auto_571570 ?auto_571578 ) ) ( not ( = ?auto_571570 ?auto_571579 ) ) ( not ( = ?auto_571571 ?auto_571572 ) ) ( not ( = ?auto_571571 ?auto_571573 ) ) ( not ( = ?auto_571571 ?auto_571574 ) ) ( not ( = ?auto_571571 ?auto_571575 ) ) ( not ( = ?auto_571571 ?auto_571576 ) ) ( not ( = ?auto_571571 ?auto_571577 ) ) ( not ( = ?auto_571571 ?auto_571578 ) ) ( not ( = ?auto_571571 ?auto_571579 ) ) ( not ( = ?auto_571572 ?auto_571573 ) ) ( not ( = ?auto_571572 ?auto_571574 ) ) ( not ( = ?auto_571572 ?auto_571575 ) ) ( not ( = ?auto_571572 ?auto_571576 ) ) ( not ( = ?auto_571572 ?auto_571577 ) ) ( not ( = ?auto_571572 ?auto_571578 ) ) ( not ( = ?auto_571572 ?auto_571579 ) ) ( not ( = ?auto_571573 ?auto_571574 ) ) ( not ( = ?auto_571573 ?auto_571575 ) ) ( not ( = ?auto_571573 ?auto_571576 ) ) ( not ( = ?auto_571573 ?auto_571577 ) ) ( not ( = ?auto_571573 ?auto_571578 ) ) ( not ( = ?auto_571573 ?auto_571579 ) ) ( not ( = ?auto_571574 ?auto_571575 ) ) ( not ( = ?auto_571574 ?auto_571576 ) ) ( not ( = ?auto_571574 ?auto_571577 ) ) ( not ( = ?auto_571574 ?auto_571578 ) ) ( not ( = ?auto_571574 ?auto_571579 ) ) ( not ( = ?auto_571575 ?auto_571576 ) ) ( not ( = ?auto_571575 ?auto_571577 ) ) ( not ( = ?auto_571575 ?auto_571578 ) ) ( not ( = ?auto_571575 ?auto_571579 ) ) ( not ( = ?auto_571576 ?auto_571577 ) ) ( not ( = ?auto_571576 ?auto_571578 ) ) ( not ( = ?auto_571576 ?auto_571579 ) ) ( not ( = ?auto_571577 ?auto_571578 ) ) ( not ( = ?auto_571577 ?auto_571579 ) ) ( not ( = ?auto_571578 ?auto_571579 ) ) ( ON ?auto_571564 ?auto_571580 ) ( not ( = ?auto_571579 ?auto_571580 ) ) ( not ( = ?auto_571578 ?auto_571580 ) ) ( not ( = ?auto_571577 ?auto_571580 ) ) ( not ( = ?auto_571576 ?auto_571580 ) ) ( not ( = ?auto_571575 ?auto_571580 ) ) ( not ( = ?auto_571574 ?auto_571580 ) ) ( not ( = ?auto_571573 ?auto_571580 ) ) ( not ( = ?auto_571572 ?auto_571580 ) ) ( not ( = ?auto_571571 ?auto_571580 ) ) ( not ( = ?auto_571570 ?auto_571580 ) ) ( not ( = ?auto_571569 ?auto_571580 ) ) ( not ( = ?auto_571568 ?auto_571580 ) ) ( not ( = ?auto_571567 ?auto_571580 ) ) ( not ( = ?auto_571566 ?auto_571580 ) ) ( not ( = ?auto_571565 ?auto_571580 ) ) ( not ( = ?auto_571564 ?auto_571580 ) ) ( ON ?auto_571565 ?auto_571564 ) ( ON ?auto_571566 ?auto_571565 ) ( ON ?auto_571567 ?auto_571566 ) ( ON ?auto_571568 ?auto_571567 ) ( ON ?auto_571569 ?auto_571568 ) ( ON ?auto_571570 ?auto_571569 ) ( ON ?auto_571571 ?auto_571570 ) ( ON ?auto_571572 ?auto_571571 ) ( ON ?auto_571573 ?auto_571572 ) ( ON ?auto_571574 ?auto_571573 ) ( ON ?auto_571575 ?auto_571574 ) ( ON ?auto_571576 ?auto_571575 ) ( ON ?auto_571577 ?auto_571576 ) ( ON ?auto_571578 ?auto_571577 ) ( ON ?auto_571579 ?auto_571578 ) ( CLEAR ?auto_571579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_571579 ?auto_571578 ?auto_571577 ?auto_571576 ?auto_571575 ?auto_571574 ?auto_571573 ?auto_571572 ?auto_571571 ?auto_571570 ?auto_571569 ?auto_571568 ?auto_571567 ?auto_571566 ?auto_571565 ?auto_571564 )
      ( MAKE-16PILE ?auto_571564 ?auto_571565 ?auto_571566 ?auto_571567 ?auto_571568 ?auto_571569 ?auto_571570 ?auto_571571 ?auto_571572 ?auto_571573 ?auto_571574 ?auto_571575 ?auto_571576 ?auto_571577 ?auto_571578 ?auto_571579 ) )
  )

)

