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
      ?auto_402349 - BLOCK
    )
    :vars
    (
      ?auto_402350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402349 ?auto_402350 ) ( CLEAR ?auto_402349 ) ( HAND-EMPTY ) ( not ( = ?auto_402349 ?auto_402350 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_402349 ?auto_402350 )
      ( !PUTDOWN ?auto_402349 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_402356 - BLOCK
      ?auto_402357 - BLOCK
    )
    :vars
    (
      ?auto_402358 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_402356 ) ( ON ?auto_402357 ?auto_402358 ) ( CLEAR ?auto_402357 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_402356 ) ( not ( = ?auto_402356 ?auto_402357 ) ) ( not ( = ?auto_402356 ?auto_402358 ) ) ( not ( = ?auto_402357 ?auto_402358 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_402357 ?auto_402358 )
      ( !STACK ?auto_402357 ?auto_402356 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_402366 - BLOCK
      ?auto_402367 - BLOCK
    )
    :vars
    (
      ?auto_402368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402367 ?auto_402368 ) ( not ( = ?auto_402366 ?auto_402367 ) ) ( not ( = ?auto_402366 ?auto_402368 ) ) ( not ( = ?auto_402367 ?auto_402368 ) ) ( ON ?auto_402366 ?auto_402367 ) ( CLEAR ?auto_402366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_402366 )
      ( MAKE-2PILE ?auto_402366 ?auto_402367 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_402377 - BLOCK
      ?auto_402378 - BLOCK
      ?auto_402379 - BLOCK
    )
    :vars
    (
      ?auto_402380 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_402378 ) ( ON ?auto_402379 ?auto_402380 ) ( CLEAR ?auto_402379 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_402377 ) ( ON ?auto_402378 ?auto_402377 ) ( not ( = ?auto_402377 ?auto_402378 ) ) ( not ( = ?auto_402377 ?auto_402379 ) ) ( not ( = ?auto_402377 ?auto_402380 ) ) ( not ( = ?auto_402378 ?auto_402379 ) ) ( not ( = ?auto_402378 ?auto_402380 ) ) ( not ( = ?auto_402379 ?auto_402380 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_402379 ?auto_402380 )
      ( !STACK ?auto_402379 ?auto_402378 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_402391 - BLOCK
      ?auto_402392 - BLOCK
      ?auto_402393 - BLOCK
    )
    :vars
    (
      ?auto_402394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402393 ?auto_402394 ) ( ON-TABLE ?auto_402391 ) ( not ( = ?auto_402391 ?auto_402392 ) ) ( not ( = ?auto_402391 ?auto_402393 ) ) ( not ( = ?auto_402391 ?auto_402394 ) ) ( not ( = ?auto_402392 ?auto_402393 ) ) ( not ( = ?auto_402392 ?auto_402394 ) ) ( not ( = ?auto_402393 ?auto_402394 ) ) ( CLEAR ?auto_402391 ) ( ON ?auto_402392 ?auto_402393 ) ( CLEAR ?auto_402392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_402391 ?auto_402392 )
      ( MAKE-3PILE ?auto_402391 ?auto_402392 ?auto_402393 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_402405 - BLOCK
      ?auto_402406 - BLOCK
      ?auto_402407 - BLOCK
    )
    :vars
    (
      ?auto_402408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402407 ?auto_402408 ) ( not ( = ?auto_402405 ?auto_402406 ) ) ( not ( = ?auto_402405 ?auto_402407 ) ) ( not ( = ?auto_402405 ?auto_402408 ) ) ( not ( = ?auto_402406 ?auto_402407 ) ) ( not ( = ?auto_402406 ?auto_402408 ) ) ( not ( = ?auto_402407 ?auto_402408 ) ) ( ON ?auto_402406 ?auto_402407 ) ( ON ?auto_402405 ?auto_402406 ) ( CLEAR ?auto_402405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_402405 )
      ( MAKE-3PILE ?auto_402405 ?auto_402406 ?auto_402407 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_402420 - BLOCK
      ?auto_402421 - BLOCK
      ?auto_402422 - BLOCK
      ?auto_402423 - BLOCK
    )
    :vars
    (
      ?auto_402424 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_402422 ) ( ON ?auto_402423 ?auto_402424 ) ( CLEAR ?auto_402423 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_402420 ) ( ON ?auto_402421 ?auto_402420 ) ( ON ?auto_402422 ?auto_402421 ) ( not ( = ?auto_402420 ?auto_402421 ) ) ( not ( = ?auto_402420 ?auto_402422 ) ) ( not ( = ?auto_402420 ?auto_402423 ) ) ( not ( = ?auto_402420 ?auto_402424 ) ) ( not ( = ?auto_402421 ?auto_402422 ) ) ( not ( = ?auto_402421 ?auto_402423 ) ) ( not ( = ?auto_402421 ?auto_402424 ) ) ( not ( = ?auto_402422 ?auto_402423 ) ) ( not ( = ?auto_402422 ?auto_402424 ) ) ( not ( = ?auto_402423 ?auto_402424 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_402423 ?auto_402424 )
      ( !STACK ?auto_402423 ?auto_402422 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_402438 - BLOCK
      ?auto_402439 - BLOCK
      ?auto_402440 - BLOCK
      ?auto_402441 - BLOCK
    )
    :vars
    (
      ?auto_402442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402441 ?auto_402442 ) ( ON-TABLE ?auto_402438 ) ( ON ?auto_402439 ?auto_402438 ) ( not ( = ?auto_402438 ?auto_402439 ) ) ( not ( = ?auto_402438 ?auto_402440 ) ) ( not ( = ?auto_402438 ?auto_402441 ) ) ( not ( = ?auto_402438 ?auto_402442 ) ) ( not ( = ?auto_402439 ?auto_402440 ) ) ( not ( = ?auto_402439 ?auto_402441 ) ) ( not ( = ?auto_402439 ?auto_402442 ) ) ( not ( = ?auto_402440 ?auto_402441 ) ) ( not ( = ?auto_402440 ?auto_402442 ) ) ( not ( = ?auto_402441 ?auto_402442 ) ) ( CLEAR ?auto_402439 ) ( ON ?auto_402440 ?auto_402441 ) ( CLEAR ?auto_402440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_402438 ?auto_402439 ?auto_402440 )
      ( MAKE-4PILE ?auto_402438 ?auto_402439 ?auto_402440 ?auto_402441 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_402456 - BLOCK
      ?auto_402457 - BLOCK
      ?auto_402458 - BLOCK
      ?auto_402459 - BLOCK
    )
    :vars
    (
      ?auto_402460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402459 ?auto_402460 ) ( ON-TABLE ?auto_402456 ) ( not ( = ?auto_402456 ?auto_402457 ) ) ( not ( = ?auto_402456 ?auto_402458 ) ) ( not ( = ?auto_402456 ?auto_402459 ) ) ( not ( = ?auto_402456 ?auto_402460 ) ) ( not ( = ?auto_402457 ?auto_402458 ) ) ( not ( = ?auto_402457 ?auto_402459 ) ) ( not ( = ?auto_402457 ?auto_402460 ) ) ( not ( = ?auto_402458 ?auto_402459 ) ) ( not ( = ?auto_402458 ?auto_402460 ) ) ( not ( = ?auto_402459 ?auto_402460 ) ) ( ON ?auto_402458 ?auto_402459 ) ( CLEAR ?auto_402456 ) ( ON ?auto_402457 ?auto_402458 ) ( CLEAR ?auto_402457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_402456 ?auto_402457 )
      ( MAKE-4PILE ?auto_402456 ?auto_402457 ?auto_402458 ?auto_402459 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_402474 - BLOCK
      ?auto_402475 - BLOCK
      ?auto_402476 - BLOCK
      ?auto_402477 - BLOCK
    )
    :vars
    (
      ?auto_402478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402477 ?auto_402478 ) ( not ( = ?auto_402474 ?auto_402475 ) ) ( not ( = ?auto_402474 ?auto_402476 ) ) ( not ( = ?auto_402474 ?auto_402477 ) ) ( not ( = ?auto_402474 ?auto_402478 ) ) ( not ( = ?auto_402475 ?auto_402476 ) ) ( not ( = ?auto_402475 ?auto_402477 ) ) ( not ( = ?auto_402475 ?auto_402478 ) ) ( not ( = ?auto_402476 ?auto_402477 ) ) ( not ( = ?auto_402476 ?auto_402478 ) ) ( not ( = ?auto_402477 ?auto_402478 ) ) ( ON ?auto_402476 ?auto_402477 ) ( ON ?auto_402475 ?auto_402476 ) ( ON ?auto_402474 ?auto_402475 ) ( CLEAR ?auto_402474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_402474 )
      ( MAKE-4PILE ?auto_402474 ?auto_402475 ?auto_402476 ?auto_402477 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_402493 - BLOCK
      ?auto_402494 - BLOCK
      ?auto_402495 - BLOCK
      ?auto_402496 - BLOCK
      ?auto_402497 - BLOCK
    )
    :vars
    (
      ?auto_402498 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_402496 ) ( ON ?auto_402497 ?auto_402498 ) ( CLEAR ?auto_402497 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_402493 ) ( ON ?auto_402494 ?auto_402493 ) ( ON ?auto_402495 ?auto_402494 ) ( ON ?auto_402496 ?auto_402495 ) ( not ( = ?auto_402493 ?auto_402494 ) ) ( not ( = ?auto_402493 ?auto_402495 ) ) ( not ( = ?auto_402493 ?auto_402496 ) ) ( not ( = ?auto_402493 ?auto_402497 ) ) ( not ( = ?auto_402493 ?auto_402498 ) ) ( not ( = ?auto_402494 ?auto_402495 ) ) ( not ( = ?auto_402494 ?auto_402496 ) ) ( not ( = ?auto_402494 ?auto_402497 ) ) ( not ( = ?auto_402494 ?auto_402498 ) ) ( not ( = ?auto_402495 ?auto_402496 ) ) ( not ( = ?auto_402495 ?auto_402497 ) ) ( not ( = ?auto_402495 ?auto_402498 ) ) ( not ( = ?auto_402496 ?auto_402497 ) ) ( not ( = ?auto_402496 ?auto_402498 ) ) ( not ( = ?auto_402497 ?auto_402498 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_402497 ?auto_402498 )
      ( !STACK ?auto_402497 ?auto_402496 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_402515 - BLOCK
      ?auto_402516 - BLOCK
      ?auto_402517 - BLOCK
      ?auto_402518 - BLOCK
      ?auto_402519 - BLOCK
    )
    :vars
    (
      ?auto_402520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402519 ?auto_402520 ) ( ON-TABLE ?auto_402515 ) ( ON ?auto_402516 ?auto_402515 ) ( ON ?auto_402517 ?auto_402516 ) ( not ( = ?auto_402515 ?auto_402516 ) ) ( not ( = ?auto_402515 ?auto_402517 ) ) ( not ( = ?auto_402515 ?auto_402518 ) ) ( not ( = ?auto_402515 ?auto_402519 ) ) ( not ( = ?auto_402515 ?auto_402520 ) ) ( not ( = ?auto_402516 ?auto_402517 ) ) ( not ( = ?auto_402516 ?auto_402518 ) ) ( not ( = ?auto_402516 ?auto_402519 ) ) ( not ( = ?auto_402516 ?auto_402520 ) ) ( not ( = ?auto_402517 ?auto_402518 ) ) ( not ( = ?auto_402517 ?auto_402519 ) ) ( not ( = ?auto_402517 ?auto_402520 ) ) ( not ( = ?auto_402518 ?auto_402519 ) ) ( not ( = ?auto_402518 ?auto_402520 ) ) ( not ( = ?auto_402519 ?auto_402520 ) ) ( CLEAR ?auto_402517 ) ( ON ?auto_402518 ?auto_402519 ) ( CLEAR ?auto_402518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_402515 ?auto_402516 ?auto_402517 ?auto_402518 )
      ( MAKE-5PILE ?auto_402515 ?auto_402516 ?auto_402517 ?auto_402518 ?auto_402519 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_402537 - BLOCK
      ?auto_402538 - BLOCK
      ?auto_402539 - BLOCK
      ?auto_402540 - BLOCK
      ?auto_402541 - BLOCK
    )
    :vars
    (
      ?auto_402542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402541 ?auto_402542 ) ( ON-TABLE ?auto_402537 ) ( ON ?auto_402538 ?auto_402537 ) ( not ( = ?auto_402537 ?auto_402538 ) ) ( not ( = ?auto_402537 ?auto_402539 ) ) ( not ( = ?auto_402537 ?auto_402540 ) ) ( not ( = ?auto_402537 ?auto_402541 ) ) ( not ( = ?auto_402537 ?auto_402542 ) ) ( not ( = ?auto_402538 ?auto_402539 ) ) ( not ( = ?auto_402538 ?auto_402540 ) ) ( not ( = ?auto_402538 ?auto_402541 ) ) ( not ( = ?auto_402538 ?auto_402542 ) ) ( not ( = ?auto_402539 ?auto_402540 ) ) ( not ( = ?auto_402539 ?auto_402541 ) ) ( not ( = ?auto_402539 ?auto_402542 ) ) ( not ( = ?auto_402540 ?auto_402541 ) ) ( not ( = ?auto_402540 ?auto_402542 ) ) ( not ( = ?auto_402541 ?auto_402542 ) ) ( ON ?auto_402540 ?auto_402541 ) ( CLEAR ?auto_402538 ) ( ON ?auto_402539 ?auto_402540 ) ( CLEAR ?auto_402539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_402537 ?auto_402538 ?auto_402539 )
      ( MAKE-5PILE ?auto_402537 ?auto_402538 ?auto_402539 ?auto_402540 ?auto_402541 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_402559 - BLOCK
      ?auto_402560 - BLOCK
      ?auto_402561 - BLOCK
      ?auto_402562 - BLOCK
      ?auto_402563 - BLOCK
    )
    :vars
    (
      ?auto_402564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402563 ?auto_402564 ) ( ON-TABLE ?auto_402559 ) ( not ( = ?auto_402559 ?auto_402560 ) ) ( not ( = ?auto_402559 ?auto_402561 ) ) ( not ( = ?auto_402559 ?auto_402562 ) ) ( not ( = ?auto_402559 ?auto_402563 ) ) ( not ( = ?auto_402559 ?auto_402564 ) ) ( not ( = ?auto_402560 ?auto_402561 ) ) ( not ( = ?auto_402560 ?auto_402562 ) ) ( not ( = ?auto_402560 ?auto_402563 ) ) ( not ( = ?auto_402560 ?auto_402564 ) ) ( not ( = ?auto_402561 ?auto_402562 ) ) ( not ( = ?auto_402561 ?auto_402563 ) ) ( not ( = ?auto_402561 ?auto_402564 ) ) ( not ( = ?auto_402562 ?auto_402563 ) ) ( not ( = ?auto_402562 ?auto_402564 ) ) ( not ( = ?auto_402563 ?auto_402564 ) ) ( ON ?auto_402562 ?auto_402563 ) ( ON ?auto_402561 ?auto_402562 ) ( CLEAR ?auto_402559 ) ( ON ?auto_402560 ?auto_402561 ) ( CLEAR ?auto_402560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_402559 ?auto_402560 )
      ( MAKE-5PILE ?auto_402559 ?auto_402560 ?auto_402561 ?auto_402562 ?auto_402563 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_402581 - BLOCK
      ?auto_402582 - BLOCK
      ?auto_402583 - BLOCK
      ?auto_402584 - BLOCK
      ?auto_402585 - BLOCK
    )
    :vars
    (
      ?auto_402586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402585 ?auto_402586 ) ( not ( = ?auto_402581 ?auto_402582 ) ) ( not ( = ?auto_402581 ?auto_402583 ) ) ( not ( = ?auto_402581 ?auto_402584 ) ) ( not ( = ?auto_402581 ?auto_402585 ) ) ( not ( = ?auto_402581 ?auto_402586 ) ) ( not ( = ?auto_402582 ?auto_402583 ) ) ( not ( = ?auto_402582 ?auto_402584 ) ) ( not ( = ?auto_402582 ?auto_402585 ) ) ( not ( = ?auto_402582 ?auto_402586 ) ) ( not ( = ?auto_402583 ?auto_402584 ) ) ( not ( = ?auto_402583 ?auto_402585 ) ) ( not ( = ?auto_402583 ?auto_402586 ) ) ( not ( = ?auto_402584 ?auto_402585 ) ) ( not ( = ?auto_402584 ?auto_402586 ) ) ( not ( = ?auto_402585 ?auto_402586 ) ) ( ON ?auto_402584 ?auto_402585 ) ( ON ?auto_402583 ?auto_402584 ) ( ON ?auto_402582 ?auto_402583 ) ( ON ?auto_402581 ?auto_402582 ) ( CLEAR ?auto_402581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_402581 )
      ( MAKE-5PILE ?auto_402581 ?auto_402582 ?auto_402583 ?auto_402584 ?auto_402585 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_402604 - BLOCK
      ?auto_402605 - BLOCK
      ?auto_402606 - BLOCK
      ?auto_402607 - BLOCK
      ?auto_402608 - BLOCK
      ?auto_402609 - BLOCK
    )
    :vars
    (
      ?auto_402610 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_402608 ) ( ON ?auto_402609 ?auto_402610 ) ( CLEAR ?auto_402609 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_402604 ) ( ON ?auto_402605 ?auto_402604 ) ( ON ?auto_402606 ?auto_402605 ) ( ON ?auto_402607 ?auto_402606 ) ( ON ?auto_402608 ?auto_402607 ) ( not ( = ?auto_402604 ?auto_402605 ) ) ( not ( = ?auto_402604 ?auto_402606 ) ) ( not ( = ?auto_402604 ?auto_402607 ) ) ( not ( = ?auto_402604 ?auto_402608 ) ) ( not ( = ?auto_402604 ?auto_402609 ) ) ( not ( = ?auto_402604 ?auto_402610 ) ) ( not ( = ?auto_402605 ?auto_402606 ) ) ( not ( = ?auto_402605 ?auto_402607 ) ) ( not ( = ?auto_402605 ?auto_402608 ) ) ( not ( = ?auto_402605 ?auto_402609 ) ) ( not ( = ?auto_402605 ?auto_402610 ) ) ( not ( = ?auto_402606 ?auto_402607 ) ) ( not ( = ?auto_402606 ?auto_402608 ) ) ( not ( = ?auto_402606 ?auto_402609 ) ) ( not ( = ?auto_402606 ?auto_402610 ) ) ( not ( = ?auto_402607 ?auto_402608 ) ) ( not ( = ?auto_402607 ?auto_402609 ) ) ( not ( = ?auto_402607 ?auto_402610 ) ) ( not ( = ?auto_402608 ?auto_402609 ) ) ( not ( = ?auto_402608 ?auto_402610 ) ) ( not ( = ?auto_402609 ?auto_402610 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_402609 ?auto_402610 )
      ( !STACK ?auto_402609 ?auto_402608 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_402630 - BLOCK
      ?auto_402631 - BLOCK
      ?auto_402632 - BLOCK
      ?auto_402633 - BLOCK
      ?auto_402634 - BLOCK
      ?auto_402635 - BLOCK
    )
    :vars
    (
      ?auto_402636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402635 ?auto_402636 ) ( ON-TABLE ?auto_402630 ) ( ON ?auto_402631 ?auto_402630 ) ( ON ?auto_402632 ?auto_402631 ) ( ON ?auto_402633 ?auto_402632 ) ( not ( = ?auto_402630 ?auto_402631 ) ) ( not ( = ?auto_402630 ?auto_402632 ) ) ( not ( = ?auto_402630 ?auto_402633 ) ) ( not ( = ?auto_402630 ?auto_402634 ) ) ( not ( = ?auto_402630 ?auto_402635 ) ) ( not ( = ?auto_402630 ?auto_402636 ) ) ( not ( = ?auto_402631 ?auto_402632 ) ) ( not ( = ?auto_402631 ?auto_402633 ) ) ( not ( = ?auto_402631 ?auto_402634 ) ) ( not ( = ?auto_402631 ?auto_402635 ) ) ( not ( = ?auto_402631 ?auto_402636 ) ) ( not ( = ?auto_402632 ?auto_402633 ) ) ( not ( = ?auto_402632 ?auto_402634 ) ) ( not ( = ?auto_402632 ?auto_402635 ) ) ( not ( = ?auto_402632 ?auto_402636 ) ) ( not ( = ?auto_402633 ?auto_402634 ) ) ( not ( = ?auto_402633 ?auto_402635 ) ) ( not ( = ?auto_402633 ?auto_402636 ) ) ( not ( = ?auto_402634 ?auto_402635 ) ) ( not ( = ?auto_402634 ?auto_402636 ) ) ( not ( = ?auto_402635 ?auto_402636 ) ) ( CLEAR ?auto_402633 ) ( ON ?auto_402634 ?auto_402635 ) ( CLEAR ?auto_402634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_402630 ?auto_402631 ?auto_402632 ?auto_402633 ?auto_402634 )
      ( MAKE-6PILE ?auto_402630 ?auto_402631 ?auto_402632 ?auto_402633 ?auto_402634 ?auto_402635 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_402656 - BLOCK
      ?auto_402657 - BLOCK
      ?auto_402658 - BLOCK
      ?auto_402659 - BLOCK
      ?auto_402660 - BLOCK
      ?auto_402661 - BLOCK
    )
    :vars
    (
      ?auto_402662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402661 ?auto_402662 ) ( ON-TABLE ?auto_402656 ) ( ON ?auto_402657 ?auto_402656 ) ( ON ?auto_402658 ?auto_402657 ) ( not ( = ?auto_402656 ?auto_402657 ) ) ( not ( = ?auto_402656 ?auto_402658 ) ) ( not ( = ?auto_402656 ?auto_402659 ) ) ( not ( = ?auto_402656 ?auto_402660 ) ) ( not ( = ?auto_402656 ?auto_402661 ) ) ( not ( = ?auto_402656 ?auto_402662 ) ) ( not ( = ?auto_402657 ?auto_402658 ) ) ( not ( = ?auto_402657 ?auto_402659 ) ) ( not ( = ?auto_402657 ?auto_402660 ) ) ( not ( = ?auto_402657 ?auto_402661 ) ) ( not ( = ?auto_402657 ?auto_402662 ) ) ( not ( = ?auto_402658 ?auto_402659 ) ) ( not ( = ?auto_402658 ?auto_402660 ) ) ( not ( = ?auto_402658 ?auto_402661 ) ) ( not ( = ?auto_402658 ?auto_402662 ) ) ( not ( = ?auto_402659 ?auto_402660 ) ) ( not ( = ?auto_402659 ?auto_402661 ) ) ( not ( = ?auto_402659 ?auto_402662 ) ) ( not ( = ?auto_402660 ?auto_402661 ) ) ( not ( = ?auto_402660 ?auto_402662 ) ) ( not ( = ?auto_402661 ?auto_402662 ) ) ( ON ?auto_402660 ?auto_402661 ) ( CLEAR ?auto_402658 ) ( ON ?auto_402659 ?auto_402660 ) ( CLEAR ?auto_402659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_402656 ?auto_402657 ?auto_402658 ?auto_402659 )
      ( MAKE-6PILE ?auto_402656 ?auto_402657 ?auto_402658 ?auto_402659 ?auto_402660 ?auto_402661 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_402682 - BLOCK
      ?auto_402683 - BLOCK
      ?auto_402684 - BLOCK
      ?auto_402685 - BLOCK
      ?auto_402686 - BLOCK
      ?auto_402687 - BLOCK
    )
    :vars
    (
      ?auto_402688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402687 ?auto_402688 ) ( ON-TABLE ?auto_402682 ) ( ON ?auto_402683 ?auto_402682 ) ( not ( = ?auto_402682 ?auto_402683 ) ) ( not ( = ?auto_402682 ?auto_402684 ) ) ( not ( = ?auto_402682 ?auto_402685 ) ) ( not ( = ?auto_402682 ?auto_402686 ) ) ( not ( = ?auto_402682 ?auto_402687 ) ) ( not ( = ?auto_402682 ?auto_402688 ) ) ( not ( = ?auto_402683 ?auto_402684 ) ) ( not ( = ?auto_402683 ?auto_402685 ) ) ( not ( = ?auto_402683 ?auto_402686 ) ) ( not ( = ?auto_402683 ?auto_402687 ) ) ( not ( = ?auto_402683 ?auto_402688 ) ) ( not ( = ?auto_402684 ?auto_402685 ) ) ( not ( = ?auto_402684 ?auto_402686 ) ) ( not ( = ?auto_402684 ?auto_402687 ) ) ( not ( = ?auto_402684 ?auto_402688 ) ) ( not ( = ?auto_402685 ?auto_402686 ) ) ( not ( = ?auto_402685 ?auto_402687 ) ) ( not ( = ?auto_402685 ?auto_402688 ) ) ( not ( = ?auto_402686 ?auto_402687 ) ) ( not ( = ?auto_402686 ?auto_402688 ) ) ( not ( = ?auto_402687 ?auto_402688 ) ) ( ON ?auto_402686 ?auto_402687 ) ( ON ?auto_402685 ?auto_402686 ) ( CLEAR ?auto_402683 ) ( ON ?auto_402684 ?auto_402685 ) ( CLEAR ?auto_402684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_402682 ?auto_402683 ?auto_402684 )
      ( MAKE-6PILE ?auto_402682 ?auto_402683 ?auto_402684 ?auto_402685 ?auto_402686 ?auto_402687 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_402708 - BLOCK
      ?auto_402709 - BLOCK
      ?auto_402710 - BLOCK
      ?auto_402711 - BLOCK
      ?auto_402712 - BLOCK
      ?auto_402713 - BLOCK
    )
    :vars
    (
      ?auto_402714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402713 ?auto_402714 ) ( ON-TABLE ?auto_402708 ) ( not ( = ?auto_402708 ?auto_402709 ) ) ( not ( = ?auto_402708 ?auto_402710 ) ) ( not ( = ?auto_402708 ?auto_402711 ) ) ( not ( = ?auto_402708 ?auto_402712 ) ) ( not ( = ?auto_402708 ?auto_402713 ) ) ( not ( = ?auto_402708 ?auto_402714 ) ) ( not ( = ?auto_402709 ?auto_402710 ) ) ( not ( = ?auto_402709 ?auto_402711 ) ) ( not ( = ?auto_402709 ?auto_402712 ) ) ( not ( = ?auto_402709 ?auto_402713 ) ) ( not ( = ?auto_402709 ?auto_402714 ) ) ( not ( = ?auto_402710 ?auto_402711 ) ) ( not ( = ?auto_402710 ?auto_402712 ) ) ( not ( = ?auto_402710 ?auto_402713 ) ) ( not ( = ?auto_402710 ?auto_402714 ) ) ( not ( = ?auto_402711 ?auto_402712 ) ) ( not ( = ?auto_402711 ?auto_402713 ) ) ( not ( = ?auto_402711 ?auto_402714 ) ) ( not ( = ?auto_402712 ?auto_402713 ) ) ( not ( = ?auto_402712 ?auto_402714 ) ) ( not ( = ?auto_402713 ?auto_402714 ) ) ( ON ?auto_402712 ?auto_402713 ) ( ON ?auto_402711 ?auto_402712 ) ( ON ?auto_402710 ?auto_402711 ) ( CLEAR ?auto_402708 ) ( ON ?auto_402709 ?auto_402710 ) ( CLEAR ?auto_402709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_402708 ?auto_402709 )
      ( MAKE-6PILE ?auto_402708 ?auto_402709 ?auto_402710 ?auto_402711 ?auto_402712 ?auto_402713 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_402734 - BLOCK
      ?auto_402735 - BLOCK
      ?auto_402736 - BLOCK
      ?auto_402737 - BLOCK
      ?auto_402738 - BLOCK
      ?auto_402739 - BLOCK
    )
    :vars
    (
      ?auto_402740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402739 ?auto_402740 ) ( not ( = ?auto_402734 ?auto_402735 ) ) ( not ( = ?auto_402734 ?auto_402736 ) ) ( not ( = ?auto_402734 ?auto_402737 ) ) ( not ( = ?auto_402734 ?auto_402738 ) ) ( not ( = ?auto_402734 ?auto_402739 ) ) ( not ( = ?auto_402734 ?auto_402740 ) ) ( not ( = ?auto_402735 ?auto_402736 ) ) ( not ( = ?auto_402735 ?auto_402737 ) ) ( not ( = ?auto_402735 ?auto_402738 ) ) ( not ( = ?auto_402735 ?auto_402739 ) ) ( not ( = ?auto_402735 ?auto_402740 ) ) ( not ( = ?auto_402736 ?auto_402737 ) ) ( not ( = ?auto_402736 ?auto_402738 ) ) ( not ( = ?auto_402736 ?auto_402739 ) ) ( not ( = ?auto_402736 ?auto_402740 ) ) ( not ( = ?auto_402737 ?auto_402738 ) ) ( not ( = ?auto_402737 ?auto_402739 ) ) ( not ( = ?auto_402737 ?auto_402740 ) ) ( not ( = ?auto_402738 ?auto_402739 ) ) ( not ( = ?auto_402738 ?auto_402740 ) ) ( not ( = ?auto_402739 ?auto_402740 ) ) ( ON ?auto_402738 ?auto_402739 ) ( ON ?auto_402737 ?auto_402738 ) ( ON ?auto_402736 ?auto_402737 ) ( ON ?auto_402735 ?auto_402736 ) ( ON ?auto_402734 ?auto_402735 ) ( CLEAR ?auto_402734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_402734 )
      ( MAKE-6PILE ?auto_402734 ?auto_402735 ?auto_402736 ?auto_402737 ?auto_402738 ?auto_402739 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_402761 - BLOCK
      ?auto_402762 - BLOCK
      ?auto_402763 - BLOCK
      ?auto_402764 - BLOCK
      ?auto_402765 - BLOCK
      ?auto_402766 - BLOCK
      ?auto_402767 - BLOCK
    )
    :vars
    (
      ?auto_402768 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_402766 ) ( ON ?auto_402767 ?auto_402768 ) ( CLEAR ?auto_402767 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_402761 ) ( ON ?auto_402762 ?auto_402761 ) ( ON ?auto_402763 ?auto_402762 ) ( ON ?auto_402764 ?auto_402763 ) ( ON ?auto_402765 ?auto_402764 ) ( ON ?auto_402766 ?auto_402765 ) ( not ( = ?auto_402761 ?auto_402762 ) ) ( not ( = ?auto_402761 ?auto_402763 ) ) ( not ( = ?auto_402761 ?auto_402764 ) ) ( not ( = ?auto_402761 ?auto_402765 ) ) ( not ( = ?auto_402761 ?auto_402766 ) ) ( not ( = ?auto_402761 ?auto_402767 ) ) ( not ( = ?auto_402761 ?auto_402768 ) ) ( not ( = ?auto_402762 ?auto_402763 ) ) ( not ( = ?auto_402762 ?auto_402764 ) ) ( not ( = ?auto_402762 ?auto_402765 ) ) ( not ( = ?auto_402762 ?auto_402766 ) ) ( not ( = ?auto_402762 ?auto_402767 ) ) ( not ( = ?auto_402762 ?auto_402768 ) ) ( not ( = ?auto_402763 ?auto_402764 ) ) ( not ( = ?auto_402763 ?auto_402765 ) ) ( not ( = ?auto_402763 ?auto_402766 ) ) ( not ( = ?auto_402763 ?auto_402767 ) ) ( not ( = ?auto_402763 ?auto_402768 ) ) ( not ( = ?auto_402764 ?auto_402765 ) ) ( not ( = ?auto_402764 ?auto_402766 ) ) ( not ( = ?auto_402764 ?auto_402767 ) ) ( not ( = ?auto_402764 ?auto_402768 ) ) ( not ( = ?auto_402765 ?auto_402766 ) ) ( not ( = ?auto_402765 ?auto_402767 ) ) ( not ( = ?auto_402765 ?auto_402768 ) ) ( not ( = ?auto_402766 ?auto_402767 ) ) ( not ( = ?auto_402766 ?auto_402768 ) ) ( not ( = ?auto_402767 ?auto_402768 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_402767 ?auto_402768 )
      ( !STACK ?auto_402767 ?auto_402766 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_402791 - BLOCK
      ?auto_402792 - BLOCK
      ?auto_402793 - BLOCK
      ?auto_402794 - BLOCK
      ?auto_402795 - BLOCK
      ?auto_402796 - BLOCK
      ?auto_402797 - BLOCK
    )
    :vars
    (
      ?auto_402798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402797 ?auto_402798 ) ( ON-TABLE ?auto_402791 ) ( ON ?auto_402792 ?auto_402791 ) ( ON ?auto_402793 ?auto_402792 ) ( ON ?auto_402794 ?auto_402793 ) ( ON ?auto_402795 ?auto_402794 ) ( not ( = ?auto_402791 ?auto_402792 ) ) ( not ( = ?auto_402791 ?auto_402793 ) ) ( not ( = ?auto_402791 ?auto_402794 ) ) ( not ( = ?auto_402791 ?auto_402795 ) ) ( not ( = ?auto_402791 ?auto_402796 ) ) ( not ( = ?auto_402791 ?auto_402797 ) ) ( not ( = ?auto_402791 ?auto_402798 ) ) ( not ( = ?auto_402792 ?auto_402793 ) ) ( not ( = ?auto_402792 ?auto_402794 ) ) ( not ( = ?auto_402792 ?auto_402795 ) ) ( not ( = ?auto_402792 ?auto_402796 ) ) ( not ( = ?auto_402792 ?auto_402797 ) ) ( not ( = ?auto_402792 ?auto_402798 ) ) ( not ( = ?auto_402793 ?auto_402794 ) ) ( not ( = ?auto_402793 ?auto_402795 ) ) ( not ( = ?auto_402793 ?auto_402796 ) ) ( not ( = ?auto_402793 ?auto_402797 ) ) ( not ( = ?auto_402793 ?auto_402798 ) ) ( not ( = ?auto_402794 ?auto_402795 ) ) ( not ( = ?auto_402794 ?auto_402796 ) ) ( not ( = ?auto_402794 ?auto_402797 ) ) ( not ( = ?auto_402794 ?auto_402798 ) ) ( not ( = ?auto_402795 ?auto_402796 ) ) ( not ( = ?auto_402795 ?auto_402797 ) ) ( not ( = ?auto_402795 ?auto_402798 ) ) ( not ( = ?auto_402796 ?auto_402797 ) ) ( not ( = ?auto_402796 ?auto_402798 ) ) ( not ( = ?auto_402797 ?auto_402798 ) ) ( CLEAR ?auto_402795 ) ( ON ?auto_402796 ?auto_402797 ) ( CLEAR ?auto_402796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_402791 ?auto_402792 ?auto_402793 ?auto_402794 ?auto_402795 ?auto_402796 )
      ( MAKE-7PILE ?auto_402791 ?auto_402792 ?auto_402793 ?auto_402794 ?auto_402795 ?auto_402796 ?auto_402797 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_402821 - BLOCK
      ?auto_402822 - BLOCK
      ?auto_402823 - BLOCK
      ?auto_402824 - BLOCK
      ?auto_402825 - BLOCK
      ?auto_402826 - BLOCK
      ?auto_402827 - BLOCK
    )
    :vars
    (
      ?auto_402828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402827 ?auto_402828 ) ( ON-TABLE ?auto_402821 ) ( ON ?auto_402822 ?auto_402821 ) ( ON ?auto_402823 ?auto_402822 ) ( ON ?auto_402824 ?auto_402823 ) ( not ( = ?auto_402821 ?auto_402822 ) ) ( not ( = ?auto_402821 ?auto_402823 ) ) ( not ( = ?auto_402821 ?auto_402824 ) ) ( not ( = ?auto_402821 ?auto_402825 ) ) ( not ( = ?auto_402821 ?auto_402826 ) ) ( not ( = ?auto_402821 ?auto_402827 ) ) ( not ( = ?auto_402821 ?auto_402828 ) ) ( not ( = ?auto_402822 ?auto_402823 ) ) ( not ( = ?auto_402822 ?auto_402824 ) ) ( not ( = ?auto_402822 ?auto_402825 ) ) ( not ( = ?auto_402822 ?auto_402826 ) ) ( not ( = ?auto_402822 ?auto_402827 ) ) ( not ( = ?auto_402822 ?auto_402828 ) ) ( not ( = ?auto_402823 ?auto_402824 ) ) ( not ( = ?auto_402823 ?auto_402825 ) ) ( not ( = ?auto_402823 ?auto_402826 ) ) ( not ( = ?auto_402823 ?auto_402827 ) ) ( not ( = ?auto_402823 ?auto_402828 ) ) ( not ( = ?auto_402824 ?auto_402825 ) ) ( not ( = ?auto_402824 ?auto_402826 ) ) ( not ( = ?auto_402824 ?auto_402827 ) ) ( not ( = ?auto_402824 ?auto_402828 ) ) ( not ( = ?auto_402825 ?auto_402826 ) ) ( not ( = ?auto_402825 ?auto_402827 ) ) ( not ( = ?auto_402825 ?auto_402828 ) ) ( not ( = ?auto_402826 ?auto_402827 ) ) ( not ( = ?auto_402826 ?auto_402828 ) ) ( not ( = ?auto_402827 ?auto_402828 ) ) ( ON ?auto_402826 ?auto_402827 ) ( CLEAR ?auto_402824 ) ( ON ?auto_402825 ?auto_402826 ) ( CLEAR ?auto_402825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_402821 ?auto_402822 ?auto_402823 ?auto_402824 ?auto_402825 )
      ( MAKE-7PILE ?auto_402821 ?auto_402822 ?auto_402823 ?auto_402824 ?auto_402825 ?auto_402826 ?auto_402827 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_402851 - BLOCK
      ?auto_402852 - BLOCK
      ?auto_402853 - BLOCK
      ?auto_402854 - BLOCK
      ?auto_402855 - BLOCK
      ?auto_402856 - BLOCK
      ?auto_402857 - BLOCK
    )
    :vars
    (
      ?auto_402858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402857 ?auto_402858 ) ( ON-TABLE ?auto_402851 ) ( ON ?auto_402852 ?auto_402851 ) ( ON ?auto_402853 ?auto_402852 ) ( not ( = ?auto_402851 ?auto_402852 ) ) ( not ( = ?auto_402851 ?auto_402853 ) ) ( not ( = ?auto_402851 ?auto_402854 ) ) ( not ( = ?auto_402851 ?auto_402855 ) ) ( not ( = ?auto_402851 ?auto_402856 ) ) ( not ( = ?auto_402851 ?auto_402857 ) ) ( not ( = ?auto_402851 ?auto_402858 ) ) ( not ( = ?auto_402852 ?auto_402853 ) ) ( not ( = ?auto_402852 ?auto_402854 ) ) ( not ( = ?auto_402852 ?auto_402855 ) ) ( not ( = ?auto_402852 ?auto_402856 ) ) ( not ( = ?auto_402852 ?auto_402857 ) ) ( not ( = ?auto_402852 ?auto_402858 ) ) ( not ( = ?auto_402853 ?auto_402854 ) ) ( not ( = ?auto_402853 ?auto_402855 ) ) ( not ( = ?auto_402853 ?auto_402856 ) ) ( not ( = ?auto_402853 ?auto_402857 ) ) ( not ( = ?auto_402853 ?auto_402858 ) ) ( not ( = ?auto_402854 ?auto_402855 ) ) ( not ( = ?auto_402854 ?auto_402856 ) ) ( not ( = ?auto_402854 ?auto_402857 ) ) ( not ( = ?auto_402854 ?auto_402858 ) ) ( not ( = ?auto_402855 ?auto_402856 ) ) ( not ( = ?auto_402855 ?auto_402857 ) ) ( not ( = ?auto_402855 ?auto_402858 ) ) ( not ( = ?auto_402856 ?auto_402857 ) ) ( not ( = ?auto_402856 ?auto_402858 ) ) ( not ( = ?auto_402857 ?auto_402858 ) ) ( ON ?auto_402856 ?auto_402857 ) ( ON ?auto_402855 ?auto_402856 ) ( CLEAR ?auto_402853 ) ( ON ?auto_402854 ?auto_402855 ) ( CLEAR ?auto_402854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_402851 ?auto_402852 ?auto_402853 ?auto_402854 )
      ( MAKE-7PILE ?auto_402851 ?auto_402852 ?auto_402853 ?auto_402854 ?auto_402855 ?auto_402856 ?auto_402857 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_402881 - BLOCK
      ?auto_402882 - BLOCK
      ?auto_402883 - BLOCK
      ?auto_402884 - BLOCK
      ?auto_402885 - BLOCK
      ?auto_402886 - BLOCK
      ?auto_402887 - BLOCK
    )
    :vars
    (
      ?auto_402888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402887 ?auto_402888 ) ( ON-TABLE ?auto_402881 ) ( ON ?auto_402882 ?auto_402881 ) ( not ( = ?auto_402881 ?auto_402882 ) ) ( not ( = ?auto_402881 ?auto_402883 ) ) ( not ( = ?auto_402881 ?auto_402884 ) ) ( not ( = ?auto_402881 ?auto_402885 ) ) ( not ( = ?auto_402881 ?auto_402886 ) ) ( not ( = ?auto_402881 ?auto_402887 ) ) ( not ( = ?auto_402881 ?auto_402888 ) ) ( not ( = ?auto_402882 ?auto_402883 ) ) ( not ( = ?auto_402882 ?auto_402884 ) ) ( not ( = ?auto_402882 ?auto_402885 ) ) ( not ( = ?auto_402882 ?auto_402886 ) ) ( not ( = ?auto_402882 ?auto_402887 ) ) ( not ( = ?auto_402882 ?auto_402888 ) ) ( not ( = ?auto_402883 ?auto_402884 ) ) ( not ( = ?auto_402883 ?auto_402885 ) ) ( not ( = ?auto_402883 ?auto_402886 ) ) ( not ( = ?auto_402883 ?auto_402887 ) ) ( not ( = ?auto_402883 ?auto_402888 ) ) ( not ( = ?auto_402884 ?auto_402885 ) ) ( not ( = ?auto_402884 ?auto_402886 ) ) ( not ( = ?auto_402884 ?auto_402887 ) ) ( not ( = ?auto_402884 ?auto_402888 ) ) ( not ( = ?auto_402885 ?auto_402886 ) ) ( not ( = ?auto_402885 ?auto_402887 ) ) ( not ( = ?auto_402885 ?auto_402888 ) ) ( not ( = ?auto_402886 ?auto_402887 ) ) ( not ( = ?auto_402886 ?auto_402888 ) ) ( not ( = ?auto_402887 ?auto_402888 ) ) ( ON ?auto_402886 ?auto_402887 ) ( ON ?auto_402885 ?auto_402886 ) ( ON ?auto_402884 ?auto_402885 ) ( CLEAR ?auto_402882 ) ( ON ?auto_402883 ?auto_402884 ) ( CLEAR ?auto_402883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_402881 ?auto_402882 ?auto_402883 )
      ( MAKE-7PILE ?auto_402881 ?auto_402882 ?auto_402883 ?auto_402884 ?auto_402885 ?auto_402886 ?auto_402887 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_402911 - BLOCK
      ?auto_402912 - BLOCK
      ?auto_402913 - BLOCK
      ?auto_402914 - BLOCK
      ?auto_402915 - BLOCK
      ?auto_402916 - BLOCK
      ?auto_402917 - BLOCK
    )
    :vars
    (
      ?auto_402918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402917 ?auto_402918 ) ( ON-TABLE ?auto_402911 ) ( not ( = ?auto_402911 ?auto_402912 ) ) ( not ( = ?auto_402911 ?auto_402913 ) ) ( not ( = ?auto_402911 ?auto_402914 ) ) ( not ( = ?auto_402911 ?auto_402915 ) ) ( not ( = ?auto_402911 ?auto_402916 ) ) ( not ( = ?auto_402911 ?auto_402917 ) ) ( not ( = ?auto_402911 ?auto_402918 ) ) ( not ( = ?auto_402912 ?auto_402913 ) ) ( not ( = ?auto_402912 ?auto_402914 ) ) ( not ( = ?auto_402912 ?auto_402915 ) ) ( not ( = ?auto_402912 ?auto_402916 ) ) ( not ( = ?auto_402912 ?auto_402917 ) ) ( not ( = ?auto_402912 ?auto_402918 ) ) ( not ( = ?auto_402913 ?auto_402914 ) ) ( not ( = ?auto_402913 ?auto_402915 ) ) ( not ( = ?auto_402913 ?auto_402916 ) ) ( not ( = ?auto_402913 ?auto_402917 ) ) ( not ( = ?auto_402913 ?auto_402918 ) ) ( not ( = ?auto_402914 ?auto_402915 ) ) ( not ( = ?auto_402914 ?auto_402916 ) ) ( not ( = ?auto_402914 ?auto_402917 ) ) ( not ( = ?auto_402914 ?auto_402918 ) ) ( not ( = ?auto_402915 ?auto_402916 ) ) ( not ( = ?auto_402915 ?auto_402917 ) ) ( not ( = ?auto_402915 ?auto_402918 ) ) ( not ( = ?auto_402916 ?auto_402917 ) ) ( not ( = ?auto_402916 ?auto_402918 ) ) ( not ( = ?auto_402917 ?auto_402918 ) ) ( ON ?auto_402916 ?auto_402917 ) ( ON ?auto_402915 ?auto_402916 ) ( ON ?auto_402914 ?auto_402915 ) ( ON ?auto_402913 ?auto_402914 ) ( CLEAR ?auto_402911 ) ( ON ?auto_402912 ?auto_402913 ) ( CLEAR ?auto_402912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_402911 ?auto_402912 )
      ( MAKE-7PILE ?auto_402911 ?auto_402912 ?auto_402913 ?auto_402914 ?auto_402915 ?auto_402916 ?auto_402917 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_402941 - BLOCK
      ?auto_402942 - BLOCK
      ?auto_402943 - BLOCK
      ?auto_402944 - BLOCK
      ?auto_402945 - BLOCK
      ?auto_402946 - BLOCK
      ?auto_402947 - BLOCK
    )
    :vars
    (
      ?auto_402948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402947 ?auto_402948 ) ( not ( = ?auto_402941 ?auto_402942 ) ) ( not ( = ?auto_402941 ?auto_402943 ) ) ( not ( = ?auto_402941 ?auto_402944 ) ) ( not ( = ?auto_402941 ?auto_402945 ) ) ( not ( = ?auto_402941 ?auto_402946 ) ) ( not ( = ?auto_402941 ?auto_402947 ) ) ( not ( = ?auto_402941 ?auto_402948 ) ) ( not ( = ?auto_402942 ?auto_402943 ) ) ( not ( = ?auto_402942 ?auto_402944 ) ) ( not ( = ?auto_402942 ?auto_402945 ) ) ( not ( = ?auto_402942 ?auto_402946 ) ) ( not ( = ?auto_402942 ?auto_402947 ) ) ( not ( = ?auto_402942 ?auto_402948 ) ) ( not ( = ?auto_402943 ?auto_402944 ) ) ( not ( = ?auto_402943 ?auto_402945 ) ) ( not ( = ?auto_402943 ?auto_402946 ) ) ( not ( = ?auto_402943 ?auto_402947 ) ) ( not ( = ?auto_402943 ?auto_402948 ) ) ( not ( = ?auto_402944 ?auto_402945 ) ) ( not ( = ?auto_402944 ?auto_402946 ) ) ( not ( = ?auto_402944 ?auto_402947 ) ) ( not ( = ?auto_402944 ?auto_402948 ) ) ( not ( = ?auto_402945 ?auto_402946 ) ) ( not ( = ?auto_402945 ?auto_402947 ) ) ( not ( = ?auto_402945 ?auto_402948 ) ) ( not ( = ?auto_402946 ?auto_402947 ) ) ( not ( = ?auto_402946 ?auto_402948 ) ) ( not ( = ?auto_402947 ?auto_402948 ) ) ( ON ?auto_402946 ?auto_402947 ) ( ON ?auto_402945 ?auto_402946 ) ( ON ?auto_402944 ?auto_402945 ) ( ON ?auto_402943 ?auto_402944 ) ( ON ?auto_402942 ?auto_402943 ) ( ON ?auto_402941 ?auto_402942 ) ( CLEAR ?auto_402941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_402941 )
      ( MAKE-7PILE ?auto_402941 ?auto_402942 ?auto_402943 ?auto_402944 ?auto_402945 ?auto_402946 ?auto_402947 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_402972 - BLOCK
      ?auto_402973 - BLOCK
      ?auto_402974 - BLOCK
      ?auto_402975 - BLOCK
      ?auto_402976 - BLOCK
      ?auto_402977 - BLOCK
      ?auto_402978 - BLOCK
      ?auto_402979 - BLOCK
    )
    :vars
    (
      ?auto_402980 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_402978 ) ( ON ?auto_402979 ?auto_402980 ) ( CLEAR ?auto_402979 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_402972 ) ( ON ?auto_402973 ?auto_402972 ) ( ON ?auto_402974 ?auto_402973 ) ( ON ?auto_402975 ?auto_402974 ) ( ON ?auto_402976 ?auto_402975 ) ( ON ?auto_402977 ?auto_402976 ) ( ON ?auto_402978 ?auto_402977 ) ( not ( = ?auto_402972 ?auto_402973 ) ) ( not ( = ?auto_402972 ?auto_402974 ) ) ( not ( = ?auto_402972 ?auto_402975 ) ) ( not ( = ?auto_402972 ?auto_402976 ) ) ( not ( = ?auto_402972 ?auto_402977 ) ) ( not ( = ?auto_402972 ?auto_402978 ) ) ( not ( = ?auto_402972 ?auto_402979 ) ) ( not ( = ?auto_402972 ?auto_402980 ) ) ( not ( = ?auto_402973 ?auto_402974 ) ) ( not ( = ?auto_402973 ?auto_402975 ) ) ( not ( = ?auto_402973 ?auto_402976 ) ) ( not ( = ?auto_402973 ?auto_402977 ) ) ( not ( = ?auto_402973 ?auto_402978 ) ) ( not ( = ?auto_402973 ?auto_402979 ) ) ( not ( = ?auto_402973 ?auto_402980 ) ) ( not ( = ?auto_402974 ?auto_402975 ) ) ( not ( = ?auto_402974 ?auto_402976 ) ) ( not ( = ?auto_402974 ?auto_402977 ) ) ( not ( = ?auto_402974 ?auto_402978 ) ) ( not ( = ?auto_402974 ?auto_402979 ) ) ( not ( = ?auto_402974 ?auto_402980 ) ) ( not ( = ?auto_402975 ?auto_402976 ) ) ( not ( = ?auto_402975 ?auto_402977 ) ) ( not ( = ?auto_402975 ?auto_402978 ) ) ( not ( = ?auto_402975 ?auto_402979 ) ) ( not ( = ?auto_402975 ?auto_402980 ) ) ( not ( = ?auto_402976 ?auto_402977 ) ) ( not ( = ?auto_402976 ?auto_402978 ) ) ( not ( = ?auto_402976 ?auto_402979 ) ) ( not ( = ?auto_402976 ?auto_402980 ) ) ( not ( = ?auto_402977 ?auto_402978 ) ) ( not ( = ?auto_402977 ?auto_402979 ) ) ( not ( = ?auto_402977 ?auto_402980 ) ) ( not ( = ?auto_402978 ?auto_402979 ) ) ( not ( = ?auto_402978 ?auto_402980 ) ) ( not ( = ?auto_402979 ?auto_402980 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_402979 ?auto_402980 )
      ( !STACK ?auto_402979 ?auto_402978 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_403006 - BLOCK
      ?auto_403007 - BLOCK
      ?auto_403008 - BLOCK
      ?auto_403009 - BLOCK
      ?auto_403010 - BLOCK
      ?auto_403011 - BLOCK
      ?auto_403012 - BLOCK
      ?auto_403013 - BLOCK
    )
    :vars
    (
      ?auto_403014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_403013 ?auto_403014 ) ( ON-TABLE ?auto_403006 ) ( ON ?auto_403007 ?auto_403006 ) ( ON ?auto_403008 ?auto_403007 ) ( ON ?auto_403009 ?auto_403008 ) ( ON ?auto_403010 ?auto_403009 ) ( ON ?auto_403011 ?auto_403010 ) ( not ( = ?auto_403006 ?auto_403007 ) ) ( not ( = ?auto_403006 ?auto_403008 ) ) ( not ( = ?auto_403006 ?auto_403009 ) ) ( not ( = ?auto_403006 ?auto_403010 ) ) ( not ( = ?auto_403006 ?auto_403011 ) ) ( not ( = ?auto_403006 ?auto_403012 ) ) ( not ( = ?auto_403006 ?auto_403013 ) ) ( not ( = ?auto_403006 ?auto_403014 ) ) ( not ( = ?auto_403007 ?auto_403008 ) ) ( not ( = ?auto_403007 ?auto_403009 ) ) ( not ( = ?auto_403007 ?auto_403010 ) ) ( not ( = ?auto_403007 ?auto_403011 ) ) ( not ( = ?auto_403007 ?auto_403012 ) ) ( not ( = ?auto_403007 ?auto_403013 ) ) ( not ( = ?auto_403007 ?auto_403014 ) ) ( not ( = ?auto_403008 ?auto_403009 ) ) ( not ( = ?auto_403008 ?auto_403010 ) ) ( not ( = ?auto_403008 ?auto_403011 ) ) ( not ( = ?auto_403008 ?auto_403012 ) ) ( not ( = ?auto_403008 ?auto_403013 ) ) ( not ( = ?auto_403008 ?auto_403014 ) ) ( not ( = ?auto_403009 ?auto_403010 ) ) ( not ( = ?auto_403009 ?auto_403011 ) ) ( not ( = ?auto_403009 ?auto_403012 ) ) ( not ( = ?auto_403009 ?auto_403013 ) ) ( not ( = ?auto_403009 ?auto_403014 ) ) ( not ( = ?auto_403010 ?auto_403011 ) ) ( not ( = ?auto_403010 ?auto_403012 ) ) ( not ( = ?auto_403010 ?auto_403013 ) ) ( not ( = ?auto_403010 ?auto_403014 ) ) ( not ( = ?auto_403011 ?auto_403012 ) ) ( not ( = ?auto_403011 ?auto_403013 ) ) ( not ( = ?auto_403011 ?auto_403014 ) ) ( not ( = ?auto_403012 ?auto_403013 ) ) ( not ( = ?auto_403012 ?auto_403014 ) ) ( not ( = ?auto_403013 ?auto_403014 ) ) ( CLEAR ?auto_403011 ) ( ON ?auto_403012 ?auto_403013 ) ( CLEAR ?auto_403012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_403006 ?auto_403007 ?auto_403008 ?auto_403009 ?auto_403010 ?auto_403011 ?auto_403012 )
      ( MAKE-8PILE ?auto_403006 ?auto_403007 ?auto_403008 ?auto_403009 ?auto_403010 ?auto_403011 ?auto_403012 ?auto_403013 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_403040 - BLOCK
      ?auto_403041 - BLOCK
      ?auto_403042 - BLOCK
      ?auto_403043 - BLOCK
      ?auto_403044 - BLOCK
      ?auto_403045 - BLOCK
      ?auto_403046 - BLOCK
      ?auto_403047 - BLOCK
    )
    :vars
    (
      ?auto_403048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_403047 ?auto_403048 ) ( ON-TABLE ?auto_403040 ) ( ON ?auto_403041 ?auto_403040 ) ( ON ?auto_403042 ?auto_403041 ) ( ON ?auto_403043 ?auto_403042 ) ( ON ?auto_403044 ?auto_403043 ) ( not ( = ?auto_403040 ?auto_403041 ) ) ( not ( = ?auto_403040 ?auto_403042 ) ) ( not ( = ?auto_403040 ?auto_403043 ) ) ( not ( = ?auto_403040 ?auto_403044 ) ) ( not ( = ?auto_403040 ?auto_403045 ) ) ( not ( = ?auto_403040 ?auto_403046 ) ) ( not ( = ?auto_403040 ?auto_403047 ) ) ( not ( = ?auto_403040 ?auto_403048 ) ) ( not ( = ?auto_403041 ?auto_403042 ) ) ( not ( = ?auto_403041 ?auto_403043 ) ) ( not ( = ?auto_403041 ?auto_403044 ) ) ( not ( = ?auto_403041 ?auto_403045 ) ) ( not ( = ?auto_403041 ?auto_403046 ) ) ( not ( = ?auto_403041 ?auto_403047 ) ) ( not ( = ?auto_403041 ?auto_403048 ) ) ( not ( = ?auto_403042 ?auto_403043 ) ) ( not ( = ?auto_403042 ?auto_403044 ) ) ( not ( = ?auto_403042 ?auto_403045 ) ) ( not ( = ?auto_403042 ?auto_403046 ) ) ( not ( = ?auto_403042 ?auto_403047 ) ) ( not ( = ?auto_403042 ?auto_403048 ) ) ( not ( = ?auto_403043 ?auto_403044 ) ) ( not ( = ?auto_403043 ?auto_403045 ) ) ( not ( = ?auto_403043 ?auto_403046 ) ) ( not ( = ?auto_403043 ?auto_403047 ) ) ( not ( = ?auto_403043 ?auto_403048 ) ) ( not ( = ?auto_403044 ?auto_403045 ) ) ( not ( = ?auto_403044 ?auto_403046 ) ) ( not ( = ?auto_403044 ?auto_403047 ) ) ( not ( = ?auto_403044 ?auto_403048 ) ) ( not ( = ?auto_403045 ?auto_403046 ) ) ( not ( = ?auto_403045 ?auto_403047 ) ) ( not ( = ?auto_403045 ?auto_403048 ) ) ( not ( = ?auto_403046 ?auto_403047 ) ) ( not ( = ?auto_403046 ?auto_403048 ) ) ( not ( = ?auto_403047 ?auto_403048 ) ) ( ON ?auto_403046 ?auto_403047 ) ( CLEAR ?auto_403044 ) ( ON ?auto_403045 ?auto_403046 ) ( CLEAR ?auto_403045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_403040 ?auto_403041 ?auto_403042 ?auto_403043 ?auto_403044 ?auto_403045 )
      ( MAKE-8PILE ?auto_403040 ?auto_403041 ?auto_403042 ?auto_403043 ?auto_403044 ?auto_403045 ?auto_403046 ?auto_403047 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_403074 - BLOCK
      ?auto_403075 - BLOCK
      ?auto_403076 - BLOCK
      ?auto_403077 - BLOCK
      ?auto_403078 - BLOCK
      ?auto_403079 - BLOCK
      ?auto_403080 - BLOCK
      ?auto_403081 - BLOCK
    )
    :vars
    (
      ?auto_403082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_403081 ?auto_403082 ) ( ON-TABLE ?auto_403074 ) ( ON ?auto_403075 ?auto_403074 ) ( ON ?auto_403076 ?auto_403075 ) ( ON ?auto_403077 ?auto_403076 ) ( not ( = ?auto_403074 ?auto_403075 ) ) ( not ( = ?auto_403074 ?auto_403076 ) ) ( not ( = ?auto_403074 ?auto_403077 ) ) ( not ( = ?auto_403074 ?auto_403078 ) ) ( not ( = ?auto_403074 ?auto_403079 ) ) ( not ( = ?auto_403074 ?auto_403080 ) ) ( not ( = ?auto_403074 ?auto_403081 ) ) ( not ( = ?auto_403074 ?auto_403082 ) ) ( not ( = ?auto_403075 ?auto_403076 ) ) ( not ( = ?auto_403075 ?auto_403077 ) ) ( not ( = ?auto_403075 ?auto_403078 ) ) ( not ( = ?auto_403075 ?auto_403079 ) ) ( not ( = ?auto_403075 ?auto_403080 ) ) ( not ( = ?auto_403075 ?auto_403081 ) ) ( not ( = ?auto_403075 ?auto_403082 ) ) ( not ( = ?auto_403076 ?auto_403077 ) ) ( not ( = ?auto_403076 ?auto_403078 ) ) ( not ( = ?auto_403076 ?auto_403079 ) ) ( not ( = ?auto_403076 ?auto_403080 ) ) ( not ( = ?auto_403076 ?auto_403081 ) ) ( not ( = ?auto_403076 ?auto_403082 ) ) ( not ( = ?auto_403077 ?auto_403078 ) ) ( not ( = ?auto_403077 ?auto_403079 ) ) ( not ( = ?auto_403077 ?auto_403080 ) ) ( not ( = ?auto_403077 ?auto_403081 ) ) ( not ( = ?auto_403077 ?auto_403082 ) ) ( not ( = ?auto_403078 ?auto_403079 ) ) ( not ( = ?auto_403078 ?auto_403080 ) ) ( not ( = ?auto_403078 ?auto_403081 ) ) ( not ( = ?auto_403078 ?auto_403082 ) ) ( not ( = ?auto_403079 ?auto_403080 ) ) ( not ( = ?auto_403079 ?auto_403081 ) ) ( not ( = ?auto_403079 ?auto_403082 ) ) ( not ( = ?auto_403080 ?auto_403081 ) ) ( not ( = ?auto_403080 ?auto_403082 ) ) ( not ( = ?auto_403081 ?auto_403082 ) ) ( ON ?auto_403080 ?auto_403081 ) ( ON ?auto_403079 ?auto_403080 ) ( CLEAR ?auto_403077 ) ( ON ?auto_403078 ?auto_403079 ) ( CLEAR ?auto_403078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_403074 ?auto_403075 ?auto_403076 ?auto_403077 ?auto_403078 )
      ( MAKE-8PILE ?auto_403074 ?auto_403075 ?auto_403076 ?auto_403077 ?auto_403078 ?auto_403079 ?auto_403080 ?auto_403081 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_403108 - BLOCK
      ?auto_403109 - BLOCK
      ?auto_403110 - BLOCK
      ?auto_403111 - BLOCK
      ?auto_403112 - BLOCK
      ?auto_403113 - BLOCK
      ?auto_403114 - BLOCK
      ?auto_403115 - BLOCK
    )
    :vars
    (
      ?auto_403116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_403115 ?auto_403116 ) ( ON-TABLE ?auto_403108 ) ( ON ?auto_403109 ?auto_403108 ) ( ON ?auto_403110 ?auto_403109 ) ( not ( = ?auto_403108 ?auto_403109 ) ) ( not ( = ?auto_403108 ?auto_403110 ) ) ( not ( = ?auto_403108 ?auto_403111 ) ) ( not ( = ?auto_403108 ?auto_403112 ) ) ( not ( = ?auto_403108 ?auto_403113 ) ) ( not ( = ?auto_403108 ?auto_403114 ) ) ( not ( = ?auto_403108 ?auto_403115 ) ) ( not ( = ?auto_403108 ?auto_403116 ) ) ( not ( = ?auto_403109 ?auto_403110 ) ) ( not ( = ?auto_403109 ?auto_403111 ) ) ( not ( = ?auto_403109 ?auto_403112 ) ) ( not ( = ?auto_403109 ?auto_403113 ) ) ( not ( = ?auto_403109 ?auto_403114 ) ) ( not ( = ?auto_403109 ?auto_403115 ) ) ( not ( = ?auto_403109 ?auto_403116 ) ) ( not ( = ?auto_403110 ?auto_403111 ) ) ( not ( = ?auto_403110 ?auto_403112 ) ) ( not ( = ?auto_403110 ?auto_403113 ) ) ( not ( = ?auto_403110 ?auto_403114 ) ) ( not ( = ?auto_403110 ?auto_403115 ) ) ( not ( = ?auto_403110 ?auto_403116 ) ) ( not ( = ?auto_403111 ?auto_403112 ) ) ( not ( = ?auto_403111 ?auto_403113 ) ) ( not ( = ?auto_403111 ?auto_403114 ) ) ( not ( = ?auto_403111 ?auto_403115 ) ) ( not ( = ?auto_403111 ?auto_403116 ) ) ( not ( = ?auto_403112 ?auto_403113 ) ) ( not ( = ?auto_403112 ?auto_403114 ) ) ( not ( = ?auto_403112 ?auto_403115 ) ) ( not ( = ?auto_403112 ?auto_403116 ) ) ( not ( = ?auto_403113 ?auto_403114 ) ) ( not ( = ?auto_403113 ?auto_403115 ) ) ( not ( = ?auto_403113 ?auto_403116 ) ) ( not ( = ?auto_403114 ?auto_403115 ) ) ( not ( = ?auto_403114 ?auto_403116 ) ) ( not ( = ?auto_403115 ?auto_403116 ) ) ( ON ?auto_403114 ?auto_403115 ) ( ON ?auto_403113 ?auto_403114 ) ( ON ?auto_403112 ?auto_403113 ) ( CLEAR ?auto_403110 ) ( ON ?auto_403111 ?auto_403112 ) ( CLEAR ?auto_403111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_403108 ?auto_403109 ?auto_403110 ?auto_403111 )
      ( MAKE-8PILE ?auto_403108 ?auto_403109 ?auto_403110 ?auto_403111 ?auto_403112 ?auto_403113 ?auto_403114 ?auto_403115 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_403142 - BLOCK
      ?auto_403143 - BLOCK
      ?auto_403144 - BLOCK
      ?auto_403145 - BLOCK
      ?auto_403146 - BLOCK
      ?auto_403147 - BLOCK
      ?auto_403148 - BLOCK
      ?auto_403149 - BLOCK
    )
    :vars
    (
      ?auto_403150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_403149 ?auto_403150 ) ( ON-TABLE ?auto_403142 ) ( ON ?auto_403143 ?auto_403142 ) ( not ( = ?auto_403142 ?auto_403143 ) ) ( not ( = ?auto_403142 ?auto_403144 ) ) ( not ( = ?auto_403142 ?auto_403145 ) ) ( not ( = ?auto_403142 ?auto_403146 ) ) ( not ( = ?auto_403142 ?auto_403147 ) ) ( not ( = ?auto_403142 ?auto_403148 ) ) ( not ( = ?auto_403142 ?auto_403149 ) ) ( not ( = ?auto_403142 ?auto_403150 ) ) ( not ( = ?auto_403143 ?auto_403144 ) ) ( not ( = ?auto_403143 ?auto_403145 ) ) ( not ( = ?auto_403143 ?auto_403146 ) ) ( not ( = ?auto_403143 ?auto_403147 ) ) ( not ( = ?auto_403143 ?auto_403148 ) ) ( not ( = ?auto_403143 ?auto_403149 ) ) ( not ( = ?auto_403143 ?auto_403150 ) ) ( not ( = ?auto_403144 ?auto_403145 ) ) ( not ( = ?auto_403144 ?auto_403146 ) ) ( not ( = ?auto_403144 ?auto_403147 ) ) ( not ( = ?auto_403144 ?auto_403148 ) ) ( not ( = ?auto_403144 ?auto_403149 ) ) ( not ( = ?auto_403144 ?auto_403150 ) ) ( not ( = ?auto_403145 ?auto_403146 ) ) ( not ( = ?auto_403145 ?auto_403147 ) ) ( not ( = ?auto_403145 ?auto_403148 ) ) ( not ( = ?auto_403145 ?auto_403149 ) ) ( not ( = ?auto_403145 ?auto_403150 ) ) ( not ( = ?auto_403146 ?auto_403147 ) ) ( not ( = ?auto_403146 ?auto_403148 ) ) ( not ( = ?auto_403146 ?auto_403149 ) ) ( not ( = ?auto_403146 ?auto_403150 ) ) ( not ( = ?auto_403147 ?auto_403148 ) ) ( not ( = ?auto_403147 ?auto_403149 ) ) ( not ( = ?auto_403147 ?auto_403150 ) ) ( not ( = ?auto_403148 ?auto_403149 ) ) ( not ( = ?auto_403148 ?auto_403150 ) ) ( not ( = ?auto_403149 ?auto_403150 ) ) ( ON ?auto_403148 ?auto_403149 ) ( ON ?auto_403147 ?auto_403148 ) ( ON ?auto_403146 ?auto_403147 ) ( ON ?auto_403145 ?auto_403146 ) ( CLEAR ?auto_403143 ) ( ON ?auto_403144 ?auto_403145 ) ( CLEAR ?auto_403144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_403142 ?auto_403143 ?auto_403144 )
      ( MAKE-8PILE ?auto_403142 ?auto_403143 ?auto_403144 ?auto_403145 ?auto_403146 ?auto_403147 ?auto_403148 ?auto_403149 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_403176 - BLOCK
      ?auto_403177 - BLOCK
      ?auto_403178 - BLOCK
      ?auto_403179 - BLOCK
      ?auto_403180 - BLOCK
      ?auto_403181 - BLOCK
      ?auto_403182 - BLOCK
      ?auto_403183 - BLOCK
    )
    :vars
    (
      ?auto_403184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_403183 ?auto_403184 ) ( ON-TABLE ?auto_403176 ) ( not ( = ?auto_403176 ?auto_403177 ) ) ( not ( = ?auto_403176 ?auto_403178 ) ) ( not ( = ?auto_403176 ?auto_403179 ) ) ( not ( = ?auto_403176 ?auto_403180 ) ) ( not ( = ?auto_403176 ?auto_403181 ) ) ( not ( = ?auto_403176 ?auto_403182 ) ) ( not ( = ?auto_403176 ?auto_403183 ) ) ( not ( = ?auto_403176 ?auto_403184 ) ) ( not ( = ?auto_403177 ?auto_403178 ) ) ( not ( = ?auto_403177 ?auto_403179 ) ) ( not ( = ?auto_403177 ?auto_403180 ) ) ( not ( = ?auto_403177 ?auto_403181 ) ) ( not ( = ?auto_403177 ?auto_403182 ) ) ( not ( = ?auto_403177 ?auto_403183 ) ) ( not ( = ?auto_403177 ?auto_403184 ) ) ( not ( = ?auto_403178 ?auto_403179 ) ) ( not ( = ?auto_403178 ?auto_403180 ) ) ( not ( = ?auto_403178 ?auto_403181 ) ) ( not ( = ?auto_403178 ?auto_403182 ) ) ( not ( = ?auto_403178 ?auto_403183 ) ) ( not ( = ?auto_403178 ?auto_403184 ) ) ( not ( = ?auto_403179 ?auto_403180 ) ) ( not ( = ?auto_403179 ?auto_403181 ) ) ( not ( = ?auto_403179 ?auto_403182 ) ) ( not ( = ?auto_403179 ?auto_403183 ) ) ( not ( = ?auto_403179 ?auto_403184 ) ) ( not ( = ?auto_403180 ?auto_403181 ) ) ( not ( = ?auto_403180 ?auto_403182 ) ) ( not ( = ?auto_403180 ?auto_403183 ) ) ( not ( = ?auto_403180 ?auto_403184 ) ) ( not ( = ?auto_403181 ?auto_403182 ) ) ( not ( = ?auto_403181 ?auto_403183 ) ) ( not ( = ?auto_403181 ?auto_403184 ) ) ( not ( = ?auto_403182 ?auto_403183 ) ) ( not ( = ?auto_403182 ?auto_403184 ) ) ( not ( = ?auto_403183 ?auto_403184 ) ) ( ON ?auto_403182 ?auto_403183 ) ( ON ?auto_403181 ?auto_403182 ) ( ON ?auto_403180 ?auto_403181 ) ( ON ?auto_403179 ?auto_403180 ) ( ON ?auto_403178 ?auto_403179 ) ( CLEAR ?auto_403176 ) ( ON ?auto_403177 ?auto_403178 ) ( CLEAR ?auto_403177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_403176 ?auto_403177 )
      ( MAKE-8PILE ?auto_403176 ?auto_403177 ?auto_403178 ?auto_403179 ?auto_403180 ?auto_403181 ?auto_403182 ?auto_403183 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_403210 - BLOCK
      ?auto_403211 - BLOCK
      ?auto_403212 - BLOCK
      ?auto_403213 - BLOCK
      ?auto_403214 - BLOCK
      ?auto_403215 - BLOCK
      ?auto_403216 - BLOCK
      ?auto_403217 - BLOCK
    )
    :vars
    (
      ?auto_403218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_403217 ?auto_403218 ) ( not ( = ?auto_403210 ?auto_403211 ) ) ( not ( = ?auto_403210 ?auto_403212 ) ) ( not ( = ?auto_403210 ?auto_403213 ) ) ( not ( = ?auto_403210 ?auto_403214 ) ) ( not ( = ?auto_403210 ?auto_403215 ) ) ( not ( = ?auto_403210 ?auto_403216 ) ) ( not ( = ?auto_403210 ?auto_403217 ) ) ( not ( = ?auto_403210 ?auto_403218 ) ) ( not ( = ?auto_403211 ?auto_403212 ) ) ( not ( = ?auto_403211 ?auto_403213 ) ) ( not ( = ?auto_403211 ?auto_403214 ) ) ( not ( = ?auto_403211 ?auto_403215 ) ) ( not ( = ?auto_403211 ?auto_403216 ) ) ( not ( = ?auto_403211 ?auto_403217 ) ) ( not ( = ?auto_403211 ?auto_403218 ) ) ( not ( = ?auto_403212 ?auto_403213 ) ) ( not ( = ?auto_403212 ?auto_403214 ) ) ( not ( = ?auto_403212 ?auto_403215 ) ) ( not ( = ?auto_403212 ?auto_403216 ) ) ( not ( = ?auto_403212 ?auto_403217 ) ) ( not ( = ?auto_403212 ?auto_403218 ) ) ( not ( = ?auto_403213 ?auto_403214 ) ) ( not ( = ?auto_403213 ?auto_403215 ) ) ( not ( = ?auto_403213 ?auto_403216 ) ) ( not ( = ?auto_403213 ?auto_403217 ) ) ( not ( = ?auto_403213 ?auto_403218 ) ) ( not ( = ?auto_403214 ?auto_403215 ) ) ( not ( = ?auto_403214 ?auto_403216 ) ) ( not ( = ?auto_403214 ?auto_403217 ) ) ( not ( = ?auto_403214 ?auto_403218 ) ) ( not ( = ?auto_403215 ?auto_403216 ) ) ( not ( = ?auto_403215 ?auto_403217 ) ) ( not ( = ?auto_403215 ?auto_403218 ) ) ( not ( = ?auto_403216 ?auto_403217 ) ) ( not ( = ?auto_403216 ?auto_403218 ) ) ( not ( = ?auto_403217 ?auto_403218 ) ) ( ON ?auto_403216 ?auto_403217 ) ( ON ?auto_403215 ?auto_403216 ) ( ON ?auto_403214 ?auto_403215 ) ( ON ?auto_403213 ?auto_403214 ) ( ON ?auto_403212 ?auto_403213 ) ( ON ?auto_403211 ?auto_403212 ) ( ON ?auto_403210 ?auto_403211 ) ( CLEAR ?auto_403210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_403210 )
      ( MAKE-8PILE ?auto_403210 ?auto_403211 ?auto_403212 ?auto_403213 ?auto_403214 ?auto_403215 ?auto_403216 ?auto_403217 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_403245 - BLOCK
      ?auto_403246 - BLOCK
      ?auto_403247 - BLOCK
      ?auto_403248 - BLOCK
      ?auto_403249 - BLOCK
      ?auto_403250 - BLOCK
      ?auto_403251 - BLOCK
      ?auto_403252 - BLOCK
      ?auto_403253 - BLOCK
    )
    :vars
    (
      ?auto_403254 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_403252 ) ( ON ?auto_403253 ?auto_403254 ) ( CLEAR ?auto_403253 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_403245 ) ( ON ?auto_403246 ?auto_403245 ) ( ON ?auto_403247 ?auto_403246 ) ( ON ?auto_403248 ?auto_403247 ) ( ON ?auto_403249 ?auto_403248 ) ( ON ?auto_403250 ?auto_403249 ) ( ON ?auto_403251 ?auto_403250 ) ( ON ?auto_403252 ?auto_403251 ) ( not ( = ?auto_403245 ?auto_403246 ) ) ( not ( = ?auto_403245 ?auto_403247 ) ) ( not ( = ?auto_403245 ?auto_403248 ) ) ( not ( = ?auto_403245 ?auto_403249 ) ) ( not ( = ?auto_403245 ?auto_403250 ) ) ( not ( = ?auto_403245 ?auto_403251 ) ) ( not ( = ?auto_403245 ?auto_403252 ) ) ( not ( = ?auto_403245 ?auto_403253 ) ) ( not ( = ?auto_403245 ?auto_403254 ) ) ( not ( = ?auto_403246 ?auto_403247 ) ) ( not ( = ?auto_403246 ?auto_403248 ) ) ( not ( = ?auto_403246 ?auto_403249 ) ) ( not ( = ?auto_403246 ?auto_403250 ) ) ( not ( = ?auto_403246 ?auto_403251 ) ) ( not ( = ?auto_403246 ?auto_403252 ) ) ( not ( = ?auto_403246 ?auto_403253 ) ) ( not ( = ?auto_403246 ?auto_403254 ) ) ( not ( = ?auto_403247 ?auto_403248 ) ) ( not ( = ?auto_403247 ?auto_403249 ) ) ( not ( = ?auto_403247 ?auto_403250 ) ) ( not ( = ?auto_403247 ?auto_403251 ) ) ( not ( = ?auto_403247 ?auto_403252 ) ) ( not ( = ?auto_403247 ?auto_403253 ) ) ( not ( = ?auto_403247 ?auto_403254 ) ) ( not ( = ?auto_403248 ?auto_403249 ) ) ( not ( = ?auto_403248 ?auto_403250 ) ) ( not ( = ?auto_403248 ?auto_403251 ) ) ( not ( = ?auto_403248 ?auto_403252 ) ) ( not ( = ?auto_403248 ?auto_403253 ) ) ( not ( = ?auto_403248 ?auto_403254 ) ) ( not ( = ?auto_403249 ?auto_403250 ) ) ( not ( = ?auto_403249 ?auto_403251 ) ) ( not ( = ?auto_403249 ?auto_403252 ) ) ( not ( = ?auto_403249 ?auto_403253 ) ) ( not ( = ?auto_403249 ?auto_403254 ) ) ( not ( = ?auto_403250 ?auto_403251 ) ) ( not ( = ?auto_403250 ?auto_403252 ) ) ( not ( = ?auto_403250 ?auto_403253 ) ) ( not ( = ?auto_403250 ?auto_403254 ) ) ( not ( = ?auto_403251 ?auto_403252 ) ) ( not ( = ?auto_403251 ?auto_403253 ) ) ( not ( = ?auto_403251 ?auto_403254 ) ) ( not ( = ?auto_403252 ?auto_403253 ) ) ( not ( = ?auto_403252 ?auto_403254 ) ) ( not ( = ?auto_403253 ?auto_403254 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_403253 ?auto_403254 )
      ( !STACK ?auto_403253 ?auto_403252 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_403283 - BLOCK
      ?auto_403284 - BLOCK
      ?auto_403285 - BLOCK
      ?auto_403286 - BLOCK
      ?auto_403287 - BLOCK
      ?auto_403288 - BLOCK
      ?auto_403289 - BLOCK
      ?auto_403290 - BLOCK
      ?auto_403291 - BLOCK
    )
    :vars
    (
      ?auto_403292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_403291 ?auto_403292 ) ( ON-TABLE ?auto_403283 ) ( ON ?auto_403284 ?auto_403283 ) ( ON ?auto_403285 ?auto_403284 ) ( ON ?auto_403286 ?auto_403285 ) ( ON ?auto_403287 ?auto_403286 ) ( ON ?auto_403288 ?auto_403287 ) ( ON ?auto_403289 ?auto_403288 ) ( not ( = ?auto_403283 ?auto_403284 ) ) ( not ( = ?auto_403283 ?auto_403285 ) ) ( not ( = ?auto_403283 ?auto_403286 ) ) ( not ( = ?auto_403283 ?auto_403287 ) ) ( not ( = ?auto_403283 ?auto_403288 ) ) ( not ( = ?auto_403283 ?auto_403289 ) ) ( not ( = ?auto_403283 ?auto_403290 ) ) ( not ( = ?auto_403283 ?auto_403291 ) ) ( not ( = ?auto_403283 ?auto_403292 ) ) ( not ( = ?auto_403284 ?auto_403285 ) ) ( not ( = ?auto_403284 ?auto_403286 ) ) ( not ( = ?auto_403284 ?auto_403287 ) ) ( not ( = ?auto_403284 ?auto_403288 ) ) ( not ( = ?auto_403284 ?auto_403289 ) ) ( not ( = ?auto_403284 ?auto_403290 ) ) ( not ( = ?auto_403284 ?auto_403291 ) ) ( not ( = ?auto_403284 ?auto_403292 ) ) ( not ( = ?auto_403285 ?auto_403286 ) ) ( not ( = ?auto_403285 ?auto_403287 ) ) ( not ( = ?auto_403285 ?auto_403288 ) ) ( not ( = ?auto_403285 ?auto_403289 ) ) ( not ( = ?auto_403285 ?auto_403290 ) ) ( not ( = ?auto_403285 ?auto_403291 ) ) ( not ( = ?auto_403285 ?auto_403292 ) ) ( not ( = ?auto_403286 ?auto_403287 ) ) ( not ( = ?auto_403286 ?auto_403288 ) ) ( not ( = ?auto_403286 ?auto_403289 ) ) ( not ( = ?auto_403286 ?auto_403290 ) ) ( not ( = ?auto_403286 ?auto_403291 ) ) ( not ( = ?auto_403286 ?auto_403292 ) ) ( not ( = ?auto_403287 ?auto_403288 ) ) ( not ( = ?auto_403287 ?auto_403289 ) ) ( not ( = ?auto_403287 ?auto_403290 ) ) ( not ( = ?auto_403287 ?auto_403291 ) ) ( not ( = ?auto_403287 ?auto_403292 ) ) ( not ( = ?auto_403288 ?auto_403289 ) ) ( not ( = ?auto_403288 ?auto_403290 ) ) ( not ( = ?auto_403288 ?auto_403291 ) ) ( not ( = ?auto_403288 ?auto_403292 ) ) ( not ( = ?auto_403289 ?auto_403290 ) ) ( not ( = ?auto_403289 ?auto_403291 ) ) ( not ( = ?auto_403289 ?auto_403292 ) ) ( not ( = ?auto_403290 ?auto_403291 ) ) ( not ( = ?auto_403290 ?auto_403292 ) ) ( not ( = ?auto_403291 ?auto_403292 ) ) ( CLEAR ?auto_403289 ) ( ON ?auto_403290 ?auto_403291 ) ( CLEAR ?auto_403290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_403283 ?auto_403284 ?auto_403285 ?auto_403286 ?auto_403287 ?auto_403288 ?auto_403289 ?auto_403290 )
      ( MAKE-9PILE ?auto_403283 ?auto_403284 ?auto_403285 ?auto_403286 ?auto_403287 ?auto_403288 ?auto_403289 ?auto_403290 ?auto_403291 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_403321 - BLOCK
      ?auto_403322 - BLOCK
      ?auto_403323 - BLOCK
      ?auto_403324 - BLOCK
      ?auto_403325 - BLOCK
      ?auto_403326 - BLOCK
      ?auto_403327 - BLOCK
      ?auto_403328 - BLOCK
      ?auto_403329 - BLOCK
    )
    :vars
    (
      ?auto_403330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_403329 ?auto_403330 ) ( ON-TABLE ?auto_403321 ) ( ON ?auto_403322 ?auto_403321 ) ( ON ?auto_403323 ?auto_403322 ) ( ON ?auto_403324 ?auto_403323 ) ( ON ?auto_403325 ?auto_403324 ) ( ON ?auto_403326 ?auto_403325 ) ( not ( = ?auto_403321 ?auto_403322 ) ) ( not ( = ?auto_403321 ?auto_403323 ) ) ( not ( = ?auto_403321 ?auto_403324 ) ) ( not ( = ?auto_403321 ?auto_403325 ) ) ( not ( = ?auto_403321 ?auto_403326 ) ) ( not ( = ?auto_403321 ?auto_403327 ) ) ( not ( = ?auto_403321 ?auto_403328 ) ) ( not ( = ?auto_403321 ?auto_403329 ) ) ( not ( = ?auto_403321 ?auto_403330 ) ) ( not ( = ?auto_403322 ?auto_403323 ) ) ( not ( = ?auto_403322 ?auto_403324 ) ) ( not ( = ?auto_403322 ?auto_403325 ) ) ( not ( = ?auto_403322 ?auto_403326 ) ) ( not ( = ?auto_403322 ?auto_403327 ) ) ( not ( = ?auto_403322 ?auto_403328 ) ) ( not ( = ?auto_403322 ?auto_403329 ) ) ( not ( = ?auto_403322 ?auto_403330 ) ) ( not ( = ?auto_403323 ?auto_403324 ) ) ( not ( = ?auto_403323 ?auto_403325 ) ) ( not ( = ?auto_403323 ?auto_403326 ) ) ( not ( = ?auto_403323 ?auto_403327 ) ) ( not ( = ?auto_403323 ?auto_403328 ) ) ( not ( = ?auto_403323 ?auto_403329 ) ) ( not ( = ?auto_403323 ?auto_403330 ) ) ( not ( = ?auto_403324 ?auto_403325 ) ) ( not ( = ?auto_403324 ?auto_403326 ) ) ( not ( = ?auto_403324 ?auto_403327 ) ) ( not ( = ?auto_403324 ?auto_403328 ) ) ( not ( = ?auto_403324 ?auto_403329 ) ) ( not ( = ?auto_403324 ?auto_403330 ) ) ( not ( = ?auto_403325 ?auto_403326 ) ) ( not ( = ?auto_403325 ?auto_403327 ) ) ( not ( = ?auto_403325 ?auto_403328 ) ) ( not ( = ?auto_403325 ?auto_403329 ) ) ( not ( = ?auto_403325 ?auto_403330 ) ) ( not ( = ?auto_403326 ?auto_403327 ) ) ( not ( = ?auto_403326 ?auto_403328 ) ) ( not ( = ?auto_403326 ?auto_403329 ) ) ( not ( = ?auto_403326 ?auto_403330 ) ) ( not ( = ?auto_403327 ?auto_403328 ) ) ( not ( = ?auto_403327 ?auto_403329 ) ) ( not ( = ?auto_403327 ?auto_403330 ) ) ( not ( = ?auto_403328 ?auto_403329 ) ) ( not ( = ?auto_403328 ?auto_403330 ) ) ( not ( = ?auto_403329 ?auto_403330 ) ) ( ON ?auto_403328 ?auto_403329 ) ( CLEAR ?auto_403326 ) ( ON ?auto_403327 ?auto_403328 ) ( CLEAR ?auto_403327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_403321 ?auto_403322 ?auto_403323 ?auto_403324 ?auto_403325 ?auto_403326 ?auto_403327 )
      ( MAKE-9PILE ?auto_403321 ?auto_403322 ?auto_403323 ?auto_403324 ?auto_403325 ?auto_403326 ?auto_403327 ?auto_403328 ?auto_403329 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_403359 - BLOCK
      ?auto_403360 - BLOCK
      ?auto_403361 - BLOCK
      ?auto_403362 - BLOCK
      ?auto_403363 - BLOCK
      ?auto_403364 - BLOCK
      ?auto_403365 - BLOCK
      ?auto_403366 - BLOCK
      ?auto_403367 - BLOCK
    )
    :vars
    (
      ?auto_403368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_403367 ?auto_403368 ) ( ON-TABLE ?auto_403359 ) ( ON ?auto_403360 ?auto_403359 ) ( ON ?auto_403361 ?auto_403360 ) ( ON ?auto_403362 ?auto_403361 ) ( ON ?auto_403363 ?auto_403362 ) ( not ( = ?auto_403359 ?auto_403360 ) ) ( not ( = ?auto_403359 ?auto_403361 ) ) ( not ( = ?auto_403359 ?auto_403362 ) ) ( not ( = ?auto_403359 ?auto_403363 ) ) ( not ( = ?auto_403359 ?auto_403364 ) ) ( not ( = ?auto_403359 ?auto_403365 ) ) ( not ( = ?auto_403359 ?auto_403366 ) ) ( not ( = ?auto_403359 ?auto_403367 ) ) ( not ( = ?auto_403359 ?auto_403368 ) ) ( not ( = ?auto_403360 ?auto_403361 ) ) ( not ( = ?auto_403360 ?auto_403362 ) ) ( not ( = ?auto_403360 ?auto_403363 ) ) ( not ( = ?auto_403360 ?auto_403364 ) ) ( not ( = ?auto_403360 ?auto_403365 ) ) ( not ( = ?auto_403360 ?auto_403366 ) ) ( not ( = ?auto_403360 ?auto_403367 ) ) ( not ( = ?auto_403360 ?auto_403368 ) ) ( not ( = ?auto_403361 ?auto_403362 ) ) ( not ( = ?auto_403361 ?auto_403363 ) ) ( not ( = ?auto_403361 ?auto_403364 ) ) ( not ( = ?auto_403361 ?auto_403365 ) ) ( not ( = ?auto_403361 ?auto_403366 ) ) ( not ( = ?auto_403361 ?auto_403367 ) ) ( not ( = ?auto_403361 ?auto_403368 ) ) ( not ( = ?auto_403362 ?auto_403363 ) ) ( not ( = ?auto_403362 ?auto_403364 ) ) ( not ( = ?auto_403362 ?auto_403365 ) ) ( not ( = ?auto_403362 ?auto_403366 ) ) ( not ( = ?auto_403362 ?auto_403367 ) ) ( not ( = ?auto_403362 ?auto_403368 ) ) ( not ( = ?auto_403363 ?auto_403364 ) ) ( not ( = ?auto_403363 ?auto_403365 ) ) ( not ( = ?auto_403363 ?auto_403366 ) ) ( not ( = ?auto_403363 ?auto_403367 ) ) ( not ( = ?auto_403363 ?auto_403368 ) ) ( not ( = ?auto_403364 ?auto_403365 ) ) ( not ( = ?auto_403364 ?auto_403366 ) ) ( not ( = ?auto_403364 ?auto_403367 ) ) ( not ( = ?auto_403364 ?auto_403368 ) ) ( not ( = ?auto_403365 ?auto_403366 ) ) ( not ( = ?auto_403365 ?auto_403367 ) ) ( not ( = ?auto_403365 ?auto_403368 ) ) ( not ( = ?auto_403366 ?auto_403367 ) ) ( not ( = ?auto_403366 ?auto_403368 ) ) ( not ( = ?auto_403367 ?auto_403368 ) ) ( ON ?auto_403366 ?auto_403367 ) ( ON ?auto_403365 ?auto_403366 ) ( CLEAR ?auto_403363 ) ( ON ?auto_403364 ?auto_403365 ) ( CLEAR ?auto_403364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_403359 ?auto_403360 ?auto_403361 ?auto_403362 ?auto_403363 ?auto_403364 )
      ( MAKE-9PILE ?auto_403359 ?auto_403360 ?auto_403361 ?auto_403362 ?auto_403363 ?auto_403364 ?auto_403365 ?auto_403366 ?auto_403367 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_403397 - BLOCK
      ?auto_403398 - BLOCK
      ?auto_403399 - BLOCK
      ?auto_403400 - BLOCK
      ?auto_403401 - BLOCK
      ?auto_403402 - BLOCK
      ?auto_403403 - BLOCK
      ?auto_403404 - BLOCK
      ?auto_403405 - BLOCK
    )
    :vars
    (
      ?auto_403406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_403405 ?auto_403406 ) ( ON-TABLE ?auto_403397 ) ( ON ?auto_403398 ?auto_403397 ) ( ON ?auto_403399 ?auto_403398 ) ( ON ?auto_403400 ?auto_403399 ) ( not ( = ?auto_403397 ?auto_403398 ) ) ( not ( = ?auto_403397 ?auto_403399 ) ) ( not ( = ?auto_403397 ?auto_403400 ) ) ( not ( = ?auto_403397 ?auto_403401 ) ) ( not ( = ?auto_403397 ?auto_403402 ) ) ( not ( = ?auto_403397 ?auto_403403 ) ) ( not ( = ?auto_403397 ?auto_403404 ) ) ( not ( = ?auto_403397 ?auto_403405 ) ) ( not ( = ?auto_403397 ?auto_403406 ) ) ( not ( = ?auto_403398 ?auto_403399 ) ) ( not ( = ?auto_403398 ?auto_403400 ) ) ( not ( = ?auto_403398 ?auto_403401 ) ) ( not ( = ?auto_403398 ?auto_403402 ) ) ( not ( = ?auto_403398 ?auto_403403 ) ) ( not ( = ?auto_403398 ?auto_403404 ) ) ( not ( = ?auto_403398 ?auto_403405 ) ) ( not ( = ?auto_403398 ?auto_403406 ) ) ( not ( = ?auto_403399 ?auto_403400 ) ) ( not ( = ?auto_403399 ?auto_403401 ) ) ( not ( = ?auto_403399 ?auto_403402 ) ) ( not ( = ?auto_403399 ?auto_403403 ) ) ( not ( = ?auto_403399 ?auto_403404 ) ) ( not ( = ?auto_403399 ?auto_403405 ) ) ( not ( = ?auto_403399 ?auto_403406 ) ) ( not ( = ?auto_403400 ?auto_403401 ) ) ( not ( = ?auto_403400 ?auto_403402 ) ) ( not ( = ?auto_403400 ?auto_403403 ) ) ( not ( = ?auto_403400 ?auto_403404 ) ) ( not ( = ?auto_403400 ?auto_403405 ) ) ( not ( = ?auto_403400 ?auto_403406 ) ) ( not ( = ?auto_403401 ?auto_403402 ) ) ( not ( = ?auto_403401 ?auto_403403 ) ) ( not ( = ?auto_403401 ?auto_403404 ) ) ( not ( = ?auto_403401 ?auto_403405 ) ) ( not ( = ?auto_403401 ?auto_403406 ) ) ( not ( = ?auto_403402 ?auto_403403 ) ) ( not ( = ?auto_403402 ?auto_403404 ) ) ( not ( = ?auto_403402 ?auto_403405 ) ) ( not ( = ?auto_403402 ?auto_403406 ) ) ( not ( = ?auto_403403 ?auto_403404 ) ) ( not ( = ?auto_403403 ?auto_403405 ) ) ( not ( = ?auto_403403 ?auto_403406 ) ) ( not ( = ?auto_403404 ?auto_403405 ) ) ( not ( = ?auto_403404 ?auto_403406 ) ) ( not ( = ?auto_403405 ?auto_403406 ) ) ( ON ?auto_403404 ?auto_403405 ) ( ON ?auto_403403 ?auto_403404 ) ( ON ?auto_403402 ?auto_403403 ) ( CLEAR ?auto_403400 ) ( ON ?auto_403401 ?auto_403402 ) ( CLEAR ?auto_403401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_403397 ?auto_403398 ?auto_403399 ?auto_403400 ?auto_403401 )
      ( MAKE-9PILE ?auto_403397 ?auto_403398 ?auto_403399 ?auto_403400 ?auto_403401 ?auto_403402 ?auto_403403 ?auto_403404 ?auto_403405 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_403435 - BLOCK
      ?auto_403436 - BLOCK
      ?auto_403437 - BLOCK
      ?auto_403438 - BLOCK
      ?auto_403439 - BLOCK
      ?auto_403440 - BLOCK
      ?auto_403441 - BLOCK
      ?auto_403442 - BLOCK
      ?auto_403443 - BLOCK
    )
    :vars
    (
      ?auto_403444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_403443 ?auto_403444 ) ( ON-TABLE ?auto_403435 ) ( ON ?auto_403436 ?auto_403435 ) ( ON ?auto_403437 ?auto_403436 ) ( not ( = ?auto_403435 ?auto_403436 ) ) ( not ( = ?auto_403435 ?auto_403437 ) ) ( not ( = ?auto_403435 ?auto_403438 ) ) ( not ( = ?auto_403435 ?auto_403439 ) ) ( not ( = ?auto_403435 ?auto_403440 ) ) ( not ( = ?auto_403435 ?auto_403441 ) ) ( not ( = ?auto_403435 ?auto_403442 ) ) ( not ( = ?auto_403435 ?auto_403443 ) ) ( not ( = ?auto_403435 ?auto_403444 ) ) ( not ( = ?auto_403436 ?auto_403437 ) ) ( not ( = ?auto_403436 ?auto_403438 ) ) ( not ( = ?auto_403436 ?auto_403439 ) ) ( not ( = ?auto_403436 ?auto_403440 ) ) ( not ( = ?auto_403436 ?auto_403441 ) ) ( not ( = ?auto_403436 ?auto_403442 ) ) ( not ( = ?auto_403436 ?auto_403443 ) ) ( not ( = ?auto_403436 ?auto_403444 ) ) ( not ( = ?auto_403437 ?auto_403438 ) ) ( not ( = ?auto_403437 ?auto_403439 ) ) ( not ( = ?auto_403437 ?auto_403440 ) ) ( not ( = ?auto_403437 ?auto_403441 ) ) ( not ( = ?auto_403437 ?auto_403442 ) ) ( not ( = ?auto_403437 ?auto_403443 ) ) ( not ( = ?auto_403437 ?auto_403444 ) ) ( not ( = ?auto_403438 ?auto_403439 ) ) ( not ( = ?auto_403438 ?auto_403440 ) ) ( not ( = ?auto_403438 ?auto_403441 ) ) ( not ( = ?auto_403438 ?auto_403442 ) ) ( not ( = ?auto_403438 ?auto_403443 ) ) ( not ( = ?auto_403438 ?auto_403444 ) ) ( not ( = ?auto_403439 ?auto_403440 ) ) ( not ( = ?auto_403439 ?auto_403441 ) ) ( not ( = ?auto_403439 ?auto_403442 ) ) ( not ( = ?auto_403439 ?auto_403443 ) ) ( not ( = ?auto_403439 ?auto_403444 ) ) ( not ( = ?auto_403440 ?auto_403441 ) ) ( not ( = ?auto_403440 ?auto_403442 ) ) ( not ( = ?auto_403440 ?auto_403443 ) ) ( not ( = ?auto_403440 ?auto_403444 ) ) ( not ( = ?auto_403441 ?auto_403442 ) ) ( not ( = ?auto_403441 ?auto_403443 ) ) ( not ( = ?auto_403441 ?auto_403444 ) ) ( not ( = ?auto_403442 ?auto_403443 ) ) ( not ( = ?auto_403442 ?auto_403444 ) ) ( not ( = ?auto_403443 ?auto_403444 ) ) ( ON ?auto_403442 ?auto_403443 ) ( ON ?auto_403441 ?auto_403442 ) ( ON ?auto_403440 ?auto_403441 ) ( ON ?auto_403439 ?auto_403440 ) ( CLEAR ?auto_403437 ) ( ON ?auto_403438 ?auto_403439 ) ( CLEAR ?auto_403438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_403435 ?auto_403436 ?auto_403437 ?auto_403438 )
      ( MAKE-9PILE ?auto_403435 ?auto_403436 ?auto_403437 ?auto_403438 ?auto_403439 ?auto_403440 ?auto_403441 ?auto_403442 ?auto_403443 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_403473 - BLOCK
      ?auto_403474 - BLOCK
      ?auto_403475 - BLOCK
      ?auto_403476 - BLOCK
      ?auto_403477 - BLOCK
      ?auto_403478 - BLOCK
      ?auto_403479 - BLOCK
      ?auto_403480 - BLOCK
      ?auto_403481 - BLOCK
    )
    :vars
    (
      ?auto_403482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_403481 ?auto_403482 ) ( ON-TABLE ?auto_403473 ) ( ON ?auto_403474 ?auto_403473 ) ( not ( = ?auto_403473 ?auto_403474 ) ) ( not ( = ?auto_403473 ?auto_403475 ) ) ( not ( = ?auto_403473 ?auto_403476 ) ) ( not ( = ?auto_403473 ?auto_403477 ) ) ( not ( = ?auto_403473 ?auto_403478 ) ) ( not ( = ?auto_403473 ?auto_403479 ) ) ( not ( = ?auto_403473 ?auto_403480 ) ) ( not ( = ?auto_403473 ?auto_403481 ) ) ( not ( = ?auto_403473 ?auto_403482 ) ) ( not ( = ?auto_403474 ?auto_403475 ) ) ( not ( = ?auto_403474 ?auto_403476 ) ) ( not ( = ?auto_403474 ?auto_403477 ) ) ( not ( = ?auto_403474 ?auto_403478 ) ) ( not ( = ?auto_403474 ?auto_403479 ) ) ( not ( = ?auto_403474 ?auto_403480 ) ) ( not ( = ?auto_403474 ?auto_403481 ) ) ( not ( = ?auto_403474 ?auto_403482 ) ) ( not ( = ?auto_403475 ?auto_403476 ) ) ( not ( = ?auto_403475 ?auto_403477 ) ) ( not ( = ?auto_403475 ?auto_403478 ) ) ( not ( = ?auto_403475 ?auto_403479 ) ) ( not ( = ?auto_403475 ?auto_403480 ) ) ( not ( = ?auto_403475 ?auto_403481 ) ) ( not ( = ?auto_403475 ?auto_403482 ) ) ( not ( = ?auto_403476 ?auto_403477 ) ) ( not ( = ?auto_403476 ?auto_403478 ) ) ( not ( = ?auto_403476 ?auto_403479 ) ) ( not ( = ?auto_403476 ?auto_403480 ) ) ( not ( = ?auto_403476 ?auto_403481 ) ) ( not ( = ?auto_403476 ?auto_403482 ) ) ( not ( = ?auto_403477 ?auto_403478 ) ) ( not ( = ?auto_403477 ?auto_403479 ) ) ( not ( = ?auto_403477 ?auto_403480 ) ) ( not ( = ?auto_403477 ?auto_403481 ) ) ( not ( = ?auto_403477 ?auto_403482 ) ) ( not ( = ?auto_403478 ?auto_403479 ) ) ( not ( = ?auto_403478 ?auto_403480 ) ) ( not ( = ?auto_403478 ?auto_403481 ) ) ( not ( = ?auto_403478 ?auto_403482 ) ) ( not ( = ?auto_403479 ?auto_403480 ) ) ( not ( = ?auto_403479 ?auto_403481 ) ) ( not ( = ?auto_403479 ?auto_403482 ) ) ( not ( = ?auto_403480 ?auto_403481 ) ) ( not ( = ?auto_403480 ?auto_403482 ) ) ( not ( = ?auto_403481 ?auto_403482 ) ) ( ON ?auto_403480 ?auto_403481 ) ( ON ?auto_403479 ?auto_403480 ) ( ON ?auto_403478 ?auto_403479 ) ( ON ?auto_403477 ?auto_403478 ) ( ON ?auto_403476 ?auto_403477 ) ( CLEAR ?auto_403474 ) ( ON ?auto_403475 ?auto_403476 ) ( CLEAR ?auto_403475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_403473 ?auto_403474 ?auto_403475 )
      ( MAKE-9PILE ?auto_403473 ?auto_403474 ?auto_403475 ?auto_403476 ?auto_403477 ?auto_403478 ?auto_403479 ?auto_403480 ?auto_403481 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_403511 - BLOCK
      ?auto_403512 - BLOCK
      ?auto_403513 - BLOCK
      ?auto_403514 - BLOCK
      ?auto_403515 - BLOCK
      ?auto_403516 - BLOCK
      ?auto_403517 - BLOCK
      ?auto_403518 - BLOCK
      ?auto_403519 - BLOCK
    )
    :vars
    (
      ?auto_403520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_403519 ?auto_403520 ) ( ON-TABLE ?auto_403511 ) ( not ( = ?auto_403511 ?auto_403512 ) ) ( not ( = ?auto_403511 ?auto_403513 ) ) ( not ( = ?auto_403511 ?auto_403514 ) ) ( not ( = ?auto_403511 ?auto_403515 ) ) ( not ( = ?auto_403511 ?auto_403516 ) ) ( not ( = ?auto_403511 ?auto_403517 ) ) ( not ( = ?auto_403511 ?auto_403518 ) ) ( not ( = ?auto_403511 ?auto_403519 ) ) ( not ( = ?auto_403511 ?auto_403520 ) ) ( not ( = ?auto_403512 ?auto_403513 ) ) ( not ( = ?auto_403512 ?auto_403514 ) ) ( not ( = ?auto_403512 ?auto_403515 ) ) ( not ( = ?auto_403512 ?auto_403516 ) ) ( not ( = ?auto_403512 ?auto_403517 ) ) ( not ( = ?auto_403512 ?auto_403518 ) ) ( not ( = ?auto_403512 ?auto_403519 ) ) ( not ( = ?auto_403512 ?auto_403520 ) ) ( not ( = ?auto_403513 ?auto_403514 ) ) ( not ( = ?auto_403513 ?auto_403515 ) ) ( not ( = ?auto_403513 ?auto_403516 ) ) ( not ( = ?auto_403513 ?auto_403517 ) ) ( not ( = ?auto_403513 ?auto_403518 ) ) ( not ( = ?auto_403513 ?auto_403519 ) ) ( not ( = ?auto_403513 ?auto_403520 ) ) ( not ( = ?auto_403514 ?auto_403515 ) ) ( not ( = ?auto_403514 ?auto_403516 ) ) ( not ( = ?auto_403514 ?auto_403517 ) ) ( not ( = ?auto_403514 ?auto_403518 ) ) ( not ( = ?auto_403514 ?auto_403519 ) ) ( not ( = ?auto_403514 ?auto_403520 ) ) ( not ( = ?auto_403515 ?auto_403516 ) ) ( not ( = ?auto_403515 ?auto_403517 ) ) ( not ( = ?auto_403515 ?auto_403518 ) ) ( not ( = ?auto_403515 ?auto_403519 ) ) ( not ( = ?auto_403515 ?auto_403520 ) ) ( not ( = ?auto_403516 ?auto_403517 ) ) ( not ( = ?auto_403516 ?auto_403518 ) ) ( not ( = ?auto_403516 ?auto_403519 ) ) ( not ( = ?auto_403516 ?auto_403520 ) ) ( not ( = ?auto_403517 ?auto_403518 ) ) ( not ( = ?auto_403517 ?auto_403519 ) ) ( not ( = ?auto_403517 ?auto_403520 ) ) ( not ( = ?auto_403518 ?auto_403519 ) ) ( not ( = ?auto_403518 ?auto_403520 ) ) ( not ( = ?auto_403519 ?auto_403520 ) ) ( ON ?auto_403518 ?auto_403519 ) ( ON ?auto_403517 ?auto_403518 ) ( ON ?auto_403516 ?auto_403517 ) ( ON ?auto_403515 ?auto_403516 ) ( ON ?auto_403514 ?auto_403515 ) ( ON ?auto_403513 ?auto_403514 ) ( CLEAR ?auto_403511 ) ( ON ?auto_403512 ?auto_403513 ) ( CLEAR ?auto_403512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_403511 ?auto_403512 )
      ( MAKE-9PILE ?auto_403511 ?auto_403512 ?auto_403513 ?auto_403514 ?auto_403515 ?auto_403516 ?auto_403517 ?auto_403518 ?auto_403519 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_403549 - BLOCK
      ?auto_403550 - BLOCK
      ?auto_403551 - BLOCK
      ?auto_403552 - BLOCK
      ?auto_403553 - BLOCK
      ?auto_403554 - BLOCK
      ?auto_403555 - BLOCK
      ?auto_403556 - BLOCK
      ?auto_403557 - BLOCK
    )
    :vars
    (
      ?auto_403558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_403557 ?auto_403558 ) ( not ( = ?auto_403549 ?auto_403550 ) ) ( not ( = ?auto_403549 ?auto_403551 ) ) ( not ( = ?auto_403549 ?auto_403552 ) ) ( not ( = ?auto_403549 ?auto_403553 ) ) ( not ( = ?auto_403549 ?auto_403554 ) ) ( not ( = ?auto_403549 ?auto_403555 ) ) ( not ( = ?auto_403549 ?auto_403556 ) ) ( not ( = ?auto_403549 ?auto_403557 ) ) ( not ( = ?auto_403549 ?auto_403558 ) ) ( not ( = ?auto_403550 ?auto_403551 ) ) ( not ( = ?auto_403550 ?auto_403552 ) ) ( not ( = ?auto_403550 ?auto_403553 ) ) ( not ( = ?auto_403550 ?auto_403554 ) ) ( not ( = ?auto_403550 ?auto_403555 ) ) ( not ( = ?auto_403550 ?auto_403556 ) ) ( not ( = ?auto_403550 ?auto_403557 ) ) ( not ( = ?auto_403550 ?auto_403558 ) ) ( not ( = ?auto_403551 ?auto_403552 ) ) ( not ( = ?auto_403551 ?auto_403553 ) ) ( not ( = ?auto_403551 ?auto_403554 ) ) ( not ( = ?auto_403551 ?auto_403555 ) ) ( not ( = ?auto_403551 ?auto_403556 ) ) ( not ( = ?auto_403551 ?auto_403557 ) ) ( not ( = ?auto_403551 ?auto_403558 ) ) ( not ( = ?auto_403552 ?auto_403553 ) ) ( not ( = ?auto_403552 ?auto_403554 ) ) ( not ( = ?auto_403552 ?auto_403555 ) ) ( not ( = ?auto_403552 ?auto_403556 ) ) ( not ( = ?auto_403552 ?auto_403557 ) ) ( not ( = ?auto_403552 ?auto_403558 ) ) ( not ( = ?auto_403553 ?auto_403554 ) ) ( not ( = ?auto_403553 ?auto_403555 ) ) ( not ( = ?auto_403553 ?auto_403556 ) ) ( not ( = ?auto_403553 ?auto_403557 ) ) ( not ( = ?auto_403553 ?auto_403558 ) ) ( not ( = ?auto_403554 ?auto_403555 ) ) ( not ( = ?auto_403554 ?auto_403556 ) ) ( not ( = ?auto_403554 ?auto_403557 ) ) ( not ( = ?auto_403554 ?auto_403558 ) ) ( not ( = ?auto_403555 ?auto_403556 ) ) ( not ( = ?auto_403555 ?auto_403557 ) ) ( not ( = ?auto_403555 ?auto_403558 ) ) ( not ( = ?auto_403556 ?auto_403557 ) ) ( not ( = ?auto_403556 ?auto_403558 ) ) ( not ( = ?auto_403557 ?auto_403558 ) ) ( ON ?auto_403556 ?auto_403557 ) ( ON ?auto_403555 ?auto_403556 ) ( ON ?auto_403554 ?auto_403555 ) ( ON ?auto_403553 ?auto_403554 ) ( ON ?auto_403552 ?auto_403553 ) ( ON ?auto_403551 ?auto_403552 ) ( ON ?auto_403550 ?auto_403551 ) ( ON ?auto_403549 ?auto_403550 ) ( CLEAR ?auto_403549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_403549 )
      ( MAKE-9PILE ?auto_403549 ?auto_403550 ?auto_403551 ?auto_403552 ?auto_403553 ?auto_403554 ?auto_403555 ?auto_403556 ?auto_403557 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_403588 - BLOCK
      ?auto_403589 - BLOCK
      ?auto_403590 - BLOCK
      ?auto_403591 - BLOCK
      ?auto_403592 - BLOCK
      ?auto_403593 - BLOCK
      ?auto_403594 - BLOCK
      ?auto_403595 - BLOCK
      ?auto_403596 - BLOCK
      ?auto_403597 - BLOCK
    )
    :vars
    (
      ?auto_403598 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_403596 ) ( ON ?auto_403597 ?auto_403598 ) ( CLEAR ?auto_403597 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_403588 ) ( ON ?auto_403589 ?auto_403588 ) ( ON ?auto_403590 ?auto_403589 ) ( ON ?auto_403591 ?auto_403590 ) ( ON ?auto_403592 ?auto_403591 ) ( ON ?auto_403593 ?auto_403592 ) ( ON ?auto_403594 ?auto_403593 ) ( ON ?auto_403595 ?auto_403594 ) ( ON ?auto_403596 ?auto_403595 ) ( not ( = ?auto_403588 ?auto_403589 ) ) ( not ( = ?auto_403588 ?auto_403590 ) ) ( not ( = ?auto_403588 ?auto_403591 ) ) ( not ( = ?auto_403588 ?auto_403592 ) ) ( not ( = ?auto_403588 ?auto_403593 ) ) ( not ( = ?auto_403588 ?auto_403594 ) ) ( not ( = ?auto_403588 ?auto_403595 ) ) ( not ( = ?auto_403588 ?auto_403596 ) ) ( not ( = ?auto_403588 ?auto_403597 ) ) ( not ( = ?auto_403588 ?auto_403598 ) ) ( not ( = ?auto_403589 ?auto_403590 ) ) ( not ( = ?auto_403589 ?auto_403591 ) ) ( not ( = ?auto_403589 ?auto_403592 ) ) ( not ( = ?auto_403589 ?auto_403593 ) ) ( not ( = ?auto_403589 ?auto_403594 ) ) ( not ( = ?auto_403589 ?auto_403595 ) ) ( not ( = ?auto_403589 ?auto_403596 ) ) ( not ( = ?auto_403589 ?auto_403597 ) ) ( not ( = ?auto_403589 ?auto_403598 ) ) ( not ( = ?auto_403590 ?auto_403591 ) ) ( not ( = ?auto_403590 ?auto_403592 ) ) ( not ( = ?auto_403590 ?auto_403593 ) ) ( not ( = ?auto_403590 ?auto_403594 ) ) ( not ( = ?auto_403590 ?auto_403595 ) ) ( not ( = ?auto_403590 ?auto_403596 ) ) ( not ( = ?auto_403590 ?auto_403597 ) ) ( not ( = ?auto_403590 ?auto_403598 ) ) ( not ( = ?auto_403591 ?auto_403592 ) ) ( not ( = ?auto_403591 ?auto_403593 ) ) ( not ( = ?auto_403591 ?auto_403594 ) ) ( not ( = ?auto_403591 ?auto_403595 ) ) ( not ( = ?auto_403591 ?auto_403596 ) ) ( not ( = ?auto_403591 ?auto_403597 ) ) ( not ( = ?auto_403591 ?auto_403598 ) ) ( not ( = ?auto_403592 ?auto_403593 ) ) ( not ( = ?auto_403592 ?auto_403594 ) ) ( not ( = ?auto_403592 ?auto_403595 ) ) ( not ( = ?auto_403592 ?auto_403596 ) ) ( not ( = ?auto_403592 ?auto_403597 ) ) ( not ( = ?auto_403592 ?auto_403598 ) ) ( not ( = ?auto_403593 ?auto_403594 ) ) ( not ( = ?auto_403593 ?auto_403595 ) ) ( not ( = ?auto_403593 ?auto_403596 ) ) ( not ( = ?auto_403593 ?auto_403597 ) ) ( not ( = ?auto_403593 ?auto_403598 ) ) ( not ( = ?auto_403594 ?auto_403595 ) ) ( not ( = ?auto_403594 ?auto_403596 ) ) ( not ( = ?auto_403594 ?auto_403597 ) ) ( not ( = ?auto_403594 ?auto_403598 ) ) ( not ( = ?auto_403595 ?auto_403596 ) ) ( not ( = ?auto_403595 ?auto_403597 ) ) ( not ( = ?auto_403595 ?auto_403598 ) ) ( not ( = ?auto_403596 ?auto_403597 ) ) ( not ( = ?auto_403596 ?auto_403598 ) ) ( not ( = ?auto_403597 ?auto_403598 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_403597 ?auto_403598 )
      ( !STACK ?auto_403597 ?auto_403596 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_403630 - BLOCK
      ?auto_403631 - BLOCK
      ?auto_403632 - BLOCK
      ?auto_403633 - BLOCK
      ?auto_403634 - BLOCK
      ?auto_403635 - BLOCK
      ?auto_403636 - BLOCK
      ?auto_403637 - BLOCK
      ?auto_403638 - BLOCK
      ?auto_403639 - BLOCK
    )
    :vars
    (
      ?auto_403640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_403639 ?auto_403640 ) ( ON-TABLE ?auto_403630 ) ( ON ?auto_403631 ?auto_403630 ) ( ON ?auto_403632 ?auto_403631 ) ( ON ?auto_403633 ?auto_403632 ) ( ON ?auto_403634 ?auto_403633 ) ( ON ?auto_403635 ?auto_403634 ) ( ON ?auto_403636 ?auto_403635 ) ( ON ?auto_403637 ?auto_403636 ) ( not ( = ?auto_403630 ?auto_403631 ) ) ( not ( = ?auto_403630 ?auto_403632 ) ) ( not ( = ?auto_403630 ?auto_403633 ) ) ( not ( = ?auto_403630 ?auto_403634 ) ) ( not ( = ?auto_403630 ?auto_403635 ) ) ( not ( = ?auto_403630 ?auto_403636 ) ) ( not ( = ?auto_403630 ?auto_403637 ) ) ( not ( = ?auto_403630 ?auto_403638 ) ) ( not ( = ?auto_403630 ?auto_403639 ) ) ( not ( = ?auto_403630 ?auto_403640 ) ) ( not ( = ?auto_403631 ?auto_403632 ) ) ( not ( = ?auto_403631 ?auto_403633 ) ) ( not ( = ?auto_403631 ?auto_403634 ) ) ( not ( = ?auto_403631 ?auto_403635 ) ) ( not ( = ?auto_403631 ?auto_403636 ) ) ( not ( = ?auto_403631 ?auto_403637 ) ) ( not ( = ?auto_403631 ?auto_403638 ) ) ( not ( = ?auto_403631 ?auto_403639 ) ) ( not ( = ?auto_403631 ?auto_403640 ) ) ( not ( = ?auto_403632 ?auto_403633 ) ) ( not ( = ?auto_403632 ?auto_403634 ) ) ( not ( = ?auto_403632 ?auto_403635 ) ) ( not ( = ?auto_403632 ?auto_403636 ) ) ( not ( = ?auto_403632 ?auto_403637 ) ) ( not ( = ?auto_403632 ?auto_403638 ) ) ( not ( = ?auto_403632 ?auto_403639 ) ) ( not ( = ?auto_403632 ?auto_403640 ) ) ( not ( = ?auto_403633 ?auto_403634 ) ) ( not ( = ?auto_403633 ?auto_403635 ) ) ( not ( = ?auto_403633 ?auto_403636 ) ) ( not ( = ?auto_403633 ?auto_403637 ) ) ( not ( = ?auto_403633 ?auto_403638 ) ) ( not ( = ?auto_403633 ?auto_403639 ) ) ( not ( = ?auto_403633 ?auto_403640 ) ) ( not ( = ?auto_403634 ?auto_403635 ) ) ( not ( = ?auto_403634 ?auto_403636 ) ) ( not ( = ?auto_403634 ?auto_403637 ) ) ( not ( = ?auto_403634 ?auto_403638 ) ) ( not ( = ?auto_403634 ?auto_403639 ) ) ( not ( = ?auto_403634 ?auto_403640 ) ) ( not ( = ?auto_403635 ?auto_403636 ) ) ( not ( = ?auto_403635 ?auto_403637 ) ) ( not ( = ?auto_403635 ?auto_403638 ) ) ( not ( = ?auto_403635 ?auto_403639 ) ) ( not ( = ?auto_403635 ?auto_403640 ) ) ( not ( = ?auto_403636 ?auto_403637 ) ) ( not ( = ?auto_403636 ?auto_403638 ) ) ( not ( = ?auto_403636 ?auto_403639 ) ) ( not ( = ?auto_403636 ?auto_403640 ) ) ( not ( = ?auto_403637 ?auto_403638 ) ) ( not ( = ?auto_403637 ?auto_403639 ) ) ( not ( = ?auto_403637 ?auto_403640 ) ) ( not ( = ?auto_403638 ?auto_403639 ) ) ( not ( = ?auto_403638 ?auto_403640 ) ) ( not ( = ?auto_403639 ?auto_403640 ) ) ( CLEAR ?auto_403637 ) ( ON ?auto_403638 ?auto_403639 ) ( CLEAR ?auto_403638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_403630 ?auto_403631 ?auto_403632 ?auto_403633 ?auto_403634 ?auto_403635 ?auto_403636 ?auto_403637 ?auto_403638 )
      ( MAKE-10PILE ?auto_403630 ?auto_403631 ?auto_403632 ?auto_403633 ?auto_403634 ?auto_403635 ?auto_403636 ?auto_403637 ?auto_403638 ?auto_403639 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_403672 - BLOCK
      ?auto_403673 - BLOCK
      ?auto_403674 - BLOCK
      ?auto_403675 - BLOCK
      ?auto_403676 - BLOCK
      ?auto_403677 - BLOCK
      ?auto_403678 - BLOCK
      ?auto_403679 - BLOCK
      ?auto_403680 - BLOCK
      ?auto_403681 - BLOCK
    )
    :vars
    (
      ?auto_403682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_403681 ?auto_403682 ) ( ON-TABLE ?auto_403672 ) ( ON ?auto_403673 ?auto_403672 ) ( ON ?auto_403674 ?auto_403673 ) ( ON ?auto_403675 ?auto_403674 ) ( ON ?auto_403676 ?auto_403675 ) ( ON ?auto_403677 ?auto_403676 ) ( ON ?auto_403678 ?auto_403677 ) ( not ( = ?auto_403672 ?auto_403673 ) ) ( not ( = ?auto_403672 ?auto_403674 ) ) ( not ( = ?auto_403672 ?auto_403675 ) ) ( not ( = ?auto_403672 ?auto_403676 ) ) ( not ( = ?auto_403672 ?auto_403677 ) ) ( not ( = ?auto_403672 ?auto_403678 ) ) ( not ( = ?auto_403672 ?auto_403679 ) ) ( not ( = ?auto_403672 ?auto_403680 ) ) ( not ( = ?auto_403672 ?auto_403681 ) ) ( not ( = ?auto_403672 ?auto_403682 ) ) ( not ( = ?auto_403673 ?auto_403674 ) ) ( not ( = ?auto_403673 ?auto_403675 ) ) ( not ( = ?auto_403673 ?auto_403676 ) ) ( not ( = ?auto_403673 ?auto_403677 ) ) ( not ( = ?auto_403673 ?auto_403678 ) ) ( not ( = ?auto_403673 ?auto_403679 ) ) ( not ( = ?auto_403673 ?auto_403680 ) ) ( not ( = ?auto_403673 ?auto_403681 ) ) ( not ( = ?auto_403673 ?auto_403682 ) ) ( not ( = ?auto_403674 ?auto_403675 ) ) ( not ( = ?auto_403674 ?auto_403676 ) ) ( not ( = ?auto_403674 ?auto_403677 ) ) ( not ( = ?auto_403674 ?auto_403678 ) ) ( not ( = ?auto_403674 ?auto_403679 ) ) ( not ( = ?auto_403674 ?auto_403680 ) ) ( not ( = ?auto_403674 ?auto_403681 ) ) ( not ( = ?auto_403674 ?auto_403682 ) ) ( not ( = ?auto_403675 ?auto_403676 ) ) ( not ( = ?auto_403675 ?auto_403677 ) ) ( not ( = ?auto_403675 ?auto_403678 ) ) ( not ( = ?auto_403675 ?auto_403679 ) ) ( not ( = ?auto_403675 ?auto_403680 ) ) ( not ( = ?auto_403675 ?auto_403681 ) ) ( not ( = ?auto_403675 ?auto_403682 ) ) ( not ( = ?auto_403676 ?auto_403677 ) ) ( not ( = ?auto_403676 ?auto_403678 ) ) ( not ( = ?auto_403676 ?auto_403679 ) ) ( not ( = ?auto_403676 ?auto_403680 ) ) ( not ( = ?auto_403676 ?auto_403681 ) ) ( not ( = ?auto_403676 ?auto_403682 ) ) ( not ( = ?auto_403677 ?auto_403678 ) ) ( not ( = ?auto_403677 ?auto_403679 ) ) ( not ( = ?auto_403677 ?auto_403680 ) ) ( not ( = ?auto_403677 ?auto_403681 ) ) ( not ( = ?auto_403677 ?auto_403682 ) ) ( not ( = ?auto_403678 ?auto_403679 ) ) ( not ( = ?auto_403678 ?auto_403680 ) ) ( not ( = ?auto_403678 ?auto_403681 ) ) ( not ( = ?auto_403678 ?auto_403682 ) ) ( not ( = ?auto_403679 ?auto_403680 ) ) ( not ( = ?auto_403679 ?auto_403681 ) ) ( not ( = ?auto_403679 ?auto_403682 ) ) ( not ( = ?auto_403680 ?auto_403681 ) ) ( not ( = ?auto_403680 ?auto_403682 ) ) ( not ( = ?auto_403681 ?auto_403682 ) ) ( ON ?auto_403680 ?auto_403681 ) ( CLEAR ?auto_403678 ) ( ON ?auto_403679 ?auto_403680 ) ( CLEAR ?auto_403679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_403672 ?auto_403673 ?auto_403674 ?auto_403675 ?auto_403676 ?auto_403677 ?auto_403678 ?auto_403679 )
      ( MAKE-10PILE ?auto_403672 ?auto_403673 ?auto_403674 ?auto_403675 ?auto_403676 ?auto_403677 ?auto_403678 ?auto_403679 ?auto_403680 ?auto_403681 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_403714 - BLOCK
      ?auto_403715 - BLOCK
      ?auto_403716 - BLOCK
      ?auto_403717 - BLOCK
      ?auto_403718 - BLOCK
      ?auto_403719 - BLOCK
      ?auto_403720 - BLOCK
      ?auto_403721 - BLOCK
      ?auto_403722 - BLOCK
      ?auto_403723 - BLOCK
    )
    :vars
    (
      ?auto_403724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_403723 ?auto_403724 ) ( ON-TABLE ?auto_403714 ) ( ON ?auto_403715 ?auto_403714 ) ( ON ?auto_403716 ?auto_403715 ) ( ON ?auto_403717 ?auto_403716 ) ( ON ?auto_403718 ?auto_403717 ) ( ON ?auto_403719 ?auto_403718 ) ( not ( = ?auto_403714 ?auto_403715 ) ) ( not ( = ?auto_403714 ?auto_403716 ) ) ( not ( = ?auto_403714 ?auto_403717 ) ) ( not ( = ?auto_403714 ?auto_403718 ) ) ( not ( = ?auto_403714 ?auto_403719 ) ) ( not ( = ?auto_403714 ?auto_403720 ) ) ( not ( = ?auto_403714 ?auto_403721 ) ) ( not ( = ?auto_403714 ?auto_403722 ) ) ( not ( = ?auto_403714 ?auto_403723 ) ) ( not ( = ?auto_403714 ?auto_403724 ) ) ( not ( = ?auto_403715 ?auto_403716 ) ) ( not ( = ?auto_403715 ?auto_403717 ) ) ( not ( = ?auto_403715 ?auto_403718 ) ) ( not ( = ?auto_403715 ?auto_403719 ) ) ( not ( = ?auto_403715 ?auto_403720 ) ) ( not ( = ?auto_403715 ?auto_403721 ) ) ( not ( = ?auto_403715 ?auto_403722 ) ) ( not ( = ?auto_403715 ?auto_403723 ) ) ( not ( = ?auto_403715 ?auto_403724 ) ) ( not ( = ?auto_403716 ?auto_403717 ) ) ( not ( = ?auto_403716 ?auto_403718 ) ) ( not ( = ?auto_403716 ?auto_403719 ) ) ( not ( = ?auto_403716 ?auto_403720 ) ) ( not ( = ?auto_403716 ?auto_403721 ) ) ( not ( = ?auto_403716 ?auto_403722 ) ) ( not ( = ?auto_403716 ?auto_403723 ) ) ( not ( = ?auto_403716 ?auto_403724 ) ) ( not ( = ?auto_403717 ?auto_403718 ) ) ( not ( = ?auto_403717 ?auto_403719 ) ) ( not ( = ?auto_403717 ?auto_403720 ) ) ( not ( = ?auto_403717 ?auto_403721 ) ) ( not ( = ?auto_403717 ?auto_403722 ) ) ( not ( = ?auto_403717 ?auto_403723 ) ) ( not ( = ?auto_403717 ?auto_403724 ) ) ( not ( = ?auto_403718 ?auto_403719 ) ) ( not ( = ?auto_403718 ?auto_403720 ) ) ( not ( = ?auto_403718 ?auto_403721 ) ) ( not ( = ?auto_403718 ?auto_403722 ) ) ( not ( = ?auto_403718 ?auto_403723 ) ) ( not ( = ?auto_403718 ?auto_403724 ) ) ( not ( = ?auto_403719 ?auto_403720 ) ) ( not ( = ?auto_403719 ?auto_403721 ) ) ( not ( = ?auto_403719 ?auto_403722 ) ) ( not ( = ?auto_403719 ?auto_403723 ) ) ( not ( = ?auto_403719 ?auto_403724 ) ) ( not ( = ?auto_403720 ?auto_403721 ) ) ( not ( = ?auto_403720 ?auto_403722 ) ) ( not ( = ?auto_403720 ?auto_403723 ) ) ( not ( = ?auto_403720 ?auto_403724 ) ) ( not ( = ?auto_403721 ?auto_403722 ) ) ( not ( = ?auto_403721 ?auto_403723 ) ) ( not ( = ?auto_403721 ?auto_403724 ) ) ( not ( = ?auto_403722 ?auto_403723 ) ) ( not ( = ?auto_403722 ?auto_403724 ) ) ( not ( = ?auto_403723 ?auto_403724 ) ) ( ON ?auto_403722 ?auto_403723 ) ( ON ?auto_403721 ?auto_403722 ) ( CLEAR ?auto_403719 ) ( ON ?auto_403720 ?auto_403721 ) ( CLEAR ?auto_403720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_403714 ?auto_403715 ?auto_403716 ?auto_403717 ?auto_403718 ?auto_403719 ?auto_403720 )
      ( MAKE-10PILE ?auto_403714 ?auto_403715 ?auto_403716 ?auto_403717 ?auto_403718 ?auto_403719 ?auto_403720 ?auto_403721 ?auto_403722 ?auto_403723 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_403756 - BLOCK
      ?auto_403757 - BLOCK
      ?auto_403758 - BLOCK
      ?auto_403759 - BLOCK
      ?auto_403760 - BLOCK
      ?auto_403761 - BLOCK
      ?auto_403762 - BLOCK
      ?auto_403763 - BLOCK
      ?auto_403764 - BLOCK
      ?auto_403765 - BLOCK
    )
    :vars
    (
      ?auto_403766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_403765 ?auto_403766 ) ( ON-TABLE ?auto_403756 ) ( ON ?auto_403757 ?auto_403756 ) ( ON ?auto_403758 ?auto_403757 ) ( ON ?auto_403759 ?auto_403758 ) ( ON ?auto_403760 ?auto_403759 ) ( not ( = ?auto_403756 ?auto_403757 ) ) ( not ( = ?auto_403756 ?auto_403758 ) ) ( not ( = ?auto_403756 ?auto_403759 ) ) ( not ( = ?auto_403756 ?auto_403760 ) ) ( not ( = ?auto_403756 ?auto_403761 ) ) ( not ( = ?auto_403756 ?auto_403762 ) ) ( not ( = ?auto_403756 ?auto_403763 ) ) ( not ( = ?auto_403756 ?auto_403764 ) ) ( not ( = ?auto_403756 ?auto_403765 ) ) ( not ( = ?auto_403756 ?auto_403766 ) ) ( not ( = ?auto_403757 ?auto_403758 ) ) ( not ( = ?auto_403757 ?auto_403759 ) ) ( not ( = ?auto_403757 ?auto_403760 ) ) ( not ( = ?auto_403757 ?auto_403761 ) ) ( not ( = ?auto_403757 ?auto_403762 ) ) ( not ( = ?auto_403757 ?auto_403763 ) ) ( not ( = ?auto_403757 ?auto_403764 ) ) ( not ( = ?auto_403757 ?auto_403765 ) ) ( not ( = ?auto_403757 ?auto_403766 ) ) ( not ( = ?auto_403758 ?auto_403759 ) ) ( not ( = ?auto_403758 ?auto_403760 ) ) ( not ( = ?auto_403758 ?auto_403761 ) ) ( not ( = ?auto_403758 ?auto_403762 ) ) ( not ( = ?auto_403758 ?auto_403763 ) ) ( not ( = ?auto_403758 ?auto_403764 ) ) ( not ( = ?auto_403758 ?auto_403765 ) ) ( not ( = ?auto_403758 ?auto_403766 ) ) ( not ( = ?auto_403759 ?auto_403760 ) ) ( not ( = ?auto_403759 ?auto_403761 ) ) ( not ( = ?auto_403759 ?auto_403762 ) ) ( not ( = ?auto_403759 ?auto_403763 ) ) ( not ( = ?auto_403759 ?auto_403764 ) ) ( not ( = ?auto_403759 ?auto_403765 ) ) ( not ( = ?auto_403759 ?auto_403766 ) ) ( not ( = ?auto_403760 ?auto_403761 ) ) ( not ( = ?auto_403760 ?auto_403762 ) ) ( not ( = ?auto_403760 ?auto_403763 ) ) ( not ( = ?auto_403760 ?auto_403764 ) ) ( not ( = ?auto_403760 ?auto_403765 ) ) ( not ( = ?auto_403760 ?auto_403766 ) ) ( not ( = ?auto_403761 ?auto_403762 ) ) ( not ( = ?auto_403761 ?auto_403763 ) ) ( not ( = ?auto_403761 ?auto_403764 ) ) ( not ( = ?auto_403761 ?auto_403765 ) ) ( not ( = ?auto_403761 ?auto_403766 ) ) ( not ( = ?auto_403762 ?auto_403763 ) ) ( not ( = ?auto_403762 ?auto_403764 ) ) ( not ( = ?auto_403762 ?auto_403765 ) ) ( not ( = ?auto_403762 ?auto_403766 ) ) ( not ( = ?auto_403763 ?auto_403764 ) ) ( not ( = ?auto_403763 ?auto_403765 ) ) ( not ( = ?auto_403763 ?auto_403766 ) ) ( not ( = ?auto_403764 ?auto_403765 ) ) ( not ( = ?auto_403764 ?auto_403766 ) ) ( not ( = ?auto_403765 ?auto_403766 ) ) ( ON ?auto_403764 ?auto_403765 ) ( ON ?auto_403763 ?auto_403764 ) ( ON ?auto_403762 ?auto_403763 ) ( CLEAR ?auto_403760 ) ( ON ?auto_403761 ?auto_403762 ) ( CLEAR ?auto_403761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_403756 ?auto_403757 ?auto_403758 ?auto_403759 ?auto_403760 ?auto_403761 )
      ( MAKE-10PILE ?auto_403756 ?auto_403757 ?auto_403758 ?auto_403759 ?auto_403760 ?auto_403761 ?auto_403762 ?auto_403763 ?auto_403764 ?auto_403765 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_403798 - BLOCK
      ?auto_403799 - BLOCK
      ?auto_403800 - BLOCK
      ?auto_403801 - BLOCK
      ?auto_403802 - BLOCK
      ?auto_403803 - BLOCK
      ?auto_403804 - BLOCK
      ?auto_403805 - BLOCK
      ?auto_403806 - BLOCK
      ?auto_403807 - BLOCK
    )
    :vars
    (
      ?auto_403808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_403807 ?auto_403808 ) ( ON-TABLE ?auto_403798 ) ( ON ?auto_403799 ?auto_403798 ) ( ON ?auto_403800 ?auto_403799 ) ( ON ?auto_403801 ?auto_403800 ) ( not ( = ?auto_403798 ?auto_403799 ) ) ( not ( = ?auto_403798 ?auto_403800 ) ) ( not ( = ?auto_403798 ?auto_403801 ) ) ( not ( = ?auto_403798 ?auto_403802 ) ) ( not ( = ?auto_403798 ?auto_403803 ) ) ( not ( = ?auto_403798 ?auto_403804 ) ) ( not ( = ?auto_403798 ?auto_403805 ) ) ( not ( = ?auto_403798 ?auto_403806 ) ) ( not ( = ?auto_403798 ?auto_403807 ) ) ( not ( = ?auto_403798 ?auto_403808 ) ) ( not ( = ?auto_403799 ?auto_403800 ) ) ( not ( = ?auto_403799 ?auto_403801 ) ) ( not ( = ?auto_403799 ?auto_403802 ) ) ( not ( = ?auto_403799 ?auto_403803 ) ) ( not ( = ?auto_403799 ?auto_403804 ) ) ( not ( = ?auto_403799 ?auto_403805 ) ) ( not ( = ?auto_403799 ?auto_403806 ) ) ( not ( = ?auto_403799 ?auto_403807 ) ) ( not ( = ?auto_403799 ?auto_403808 ) ) ( not ( = ?auto_403800 ?auto_403801 ) ) ( not ( = ?auto_403800 ?auto_403802 ) ) ( not ( = ?auto_403800 ?auto_403803 ) ) ( not ( = ?auto_403800 ?auto_403804 ) ) ( not ( = ?auto_403800 ?auto_403805 ) ) ( not ( = ?auto_403800 ?auto_403806 ) ) ( not ( = ?auto_403800 ?auto_403807 ) ) ( not ( = ?auto_403800 ?auto_403808 ) ) ( not ( = ?auto_403801 ?auto_403802 ) ) ( not ( = ?auto_403801 ?auto_403803 ) ) ( not ( = ?auto_403801 ?auto_403804 ) ) ( not ( = ?auto_403801 ?auto_403805 ) ) ( not ( = ?auto_403801 ?auto_403806 ) ) ( not ( = ?auto_403801 ?auto_403807 ) ) ( not ( = ?auto_403801 ?auto_403808 ) ) ( not ( = ?auto_403802 ?auto_403803 ) ) ( not ( = ?auto_403802 ?auto_403804 ) ) ( not ( = ?auto_403802 ?auto_403805 ) ) ( not ( = ?auto_403802 ?auto_403806 ) ) ( not ( = ?auto_403802 ?auto_403807 ) ) ( not ( = ?auto_403802 ?auto_403808 ) ) ( not ( = ?auto_403803 ?auto_403804 ) ) ( not ( = ?auto_403803 ?auto_403805 ) ) ( not ( = ?auto_403803 ?auto_403806 ) ) ( not ( = ?auto_403803 ?auto_403807 ) ) ( not ( = ?auto_403803 ?auto_403808 ) ) ( not ( = ?auto_403804 ?auto_403805 ) ) ( not ( = ?auto_403804 ?auto_403806 ) ) ( not ( = ?auto_403804 ?auto_403807 ) ) ( not ( = ?auto_403804 ?auto_403808 ) ) ( not ( = ?auto_403805 ?auto_403806 ) ) ( not ( = ?auto_403805 ?auto_403807 ) ) ( not ( = ?auto_403805 ?auto_403808 ) ) ( not ( = ?auto_403806 ?auto_403807 ) ) ( not ( = ?auto_403806 ?auto_403808 ) ) ( not ( = ?auto_403807 ?auto_403808 ) ) ( ON ?auto_403806 ?auto_403807 ) ( ON ?auto_403805 ?auto_403806 ) ( ON ?auto_403804 ?auto_403805 ) ( ON ?auto_403803 ?auto_403804 ) ( CLEAR ?auto_403801 ) ( ON ?auto_403802 ?auto_403803 ) ( CLEAR ?auto_403802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_403798 ?auto_403799 ?auto_403800 ?auto_403801 ?auto_403802 )
      ( MAKE-10PILE ?auto_403798 ?auto_403799 ?auto_403800 ?auto_403801 ?auto_403802 ?auto_403803 ?auto_403804 ?auto_403805 ?auto_403806 ?auto_403807 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_403840 - BLOCK
      ?auto_403841 - BLOCK
      ?auto_403842 - BLOCK
      ?auto_403843 - BLOCK
      ?auto_403844 - BLOCK
      ?auto_403845 - BLOCK
      ?auto_403846 - BLOCK
      ?auto_403847 - BLOCK
      ?auto_403848 - BLOCK
      ?auto_403849 - BLOCK
    )
    :vars
    (
      ?auto_403850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_403849 ?auto_403850 ) ( ON-TABLE ?auto_403840 ) ( ON ?auto_403841 ?auto_403840 ) ( ON ?auto_403842 ?auto_403841 ) ( not ( = ?auto_403840 ?auto_403841 ) ) ( not ( = ?auto_403840 ?auto_403842 ) ) ( not ( = ?auto_403840 ?auto_403843 ) ) ( not ( = ?auto_403840 ?auto_403844 ) ) ( not ( = ?auto_403840 ?auto_403845 ) ) ( not ( = ?auto_403840 ?auto_403846 ) ) ( not ( = ?auto_403840 ?auto_403847 ) ) ( not ( = ?auto_403840 ?auto_403848 ) ) ( not ( = ?auto_403840 ?auto_403849 ) ) ( not ( = ?auto_403840 ?auto_403850 ) ) ( not ( = ?auto_403841 ?auto_403842 ) ) ( not ( = ?auto_403841 ?auto_403843 ) ) ( not ( = ?auto_403841 ?auto_403844 ) ) ( not ( = ?auto_403841 ?auto_403845 ) ) ( not ( = ?auto_403841 ?auto_403846 ) ) ( not ( = ?auto_403841 ?auto_403847 ) ) ( not ( = ?auto_403841 ?auto_403848 ) ) ( not ( = ?auto_403841 ?auto_403849 ) ) ( not ( = ?auto_403841 ?auto_403850 ) ) ( not ( = ?auto_403842 ?auto_403843 ) ) ( not ( = ?auto_403842 ?auto_403844 ) ) ( not ( = ?auto_403842 ?auto_403845 ) ) ( not ( = ?auto_403842 ?auto_403846 ) ) ( not ( = ?auto_403842 ?auto_403847 ) ) ( not ( = ?auto_403842 ?auto_403848 ) ) ( not ( = ?auto_403842 ?auto_403849 ) ) ( not ( = ?auto_403842 ?auto_403850 ) ) ( not ( = ?auto_403843 ?auto_403844 ) ) ( not ( = ?auto_403843 ?auto_403845 ) ) ( not ( = ?auto_403843 ?auto_403846 ) ) ( not ( = ?auto_403843 ?auto_403847 ) ) ( not ( = ?auto_403843 ?auto_403848 ) ) ( not ( = ?auto_403843 ?auto_403849 ) ) ( not ( = ?auto_403843 ?auto_403850 ) ) ( not ( = ?auto_403844 ?auto_403845 ) ) ( not ( = ?auto_403844 ?auto_403846 ) ) ( not ( = ?auto_403844 ?auto_403847 ) ) ( not ( = ?auto_403844 ?auto_403848 ) ) ( not ( = ?auto_403844 ?auto_403849 ) ) ( not ( = ?auto_403844 ?auto_403850 ) ) ( not ( = ?auto_403845 ?auto_403846 ) ) ( not ( = ?auto_403845 ?auto_403847 ) ) ( not ( = ?auto_403845 ?auto_403848 ) ) ( not ( = ?auto_403845 ?auto_403849 ) ) ( not ( = ?auto_403845 ?auto_403850 ) ) ( not ( = ?auto_403846 ?auto_403847 ) ) ( not ( = ?auto_403846 ?auto_403848 ) ) ( not ( = ?auto_403846 ?auto_403849 ) ) ( not ( = ?auto_403846 ?auto_403850 ) ) ( not ( = ?auto_403847 ?auto_403848 ) ) ( not ( = ?auto_403847 ?auto_403849 ) ) ( not ( = ?auto_403847 ?auto_403850 ) ) ( not ( = ?auto_403848 ?auto_403849 ) ) ( not ( = ?auto_403848 ?auto_403850 ) ) ( not ( = ?auto_403849 ?auto_403850 ) ) ( ON ?auto_403848 ?auto_403849 ) ( ON ?auto_403847 ?auto_403848 ) ( ON ?auto_403846 ?auto_403847 ) ( ON ?auto_403845 ?auto_403846 ) ( ON ?auto_403844 ?auto_403845 ) ( CLEAR ?auto_403842 ) ( ON ?auto_403843 ?auto_403844 ) ( CLEAR ?auto_403843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_403840 ?auto_403841 ?auto_403842 ?auto_403843 )
      ( MAKE-10PILE ?auto_403840 ?auto_403841 ?auto_403842 ?auto_403843 ?auto_403844 ?auto_403845 ?auto_403846 ?auto_403847 ?auto_403848 ?auto_403849 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_403882 - BLOCK
      ?auto_403883 - BLOCK
      ?auto_403884 - BLOCK
      ?auto_403885 - BLOCK
      ?auto_403886 - BLOCK
      ?auto_403887 - BLOCK
      ?auto_403888 - BLOCK
      ?auto_403889 - BLOCK
      ?auto_403890 - BLOCK
      ?auto_403891 - BLOCK
    )
    :vars
    (
      ?auto_403892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_403891 ?auto_403892 ) ( ON-TABLE ?auto_403882 ) ( ON ?auto_403883 ?auto_403882 ) ( not ( = ?auto_403882 ?auto_403883 ) ) ( not ( = ?auto_403882 ?auto_403884 ) ) ( not ( = ?auto_403882 ?auto_403885 ) ) ( not ( = ?auto_403882 ?auto_403886 ) ) ( not ( = ?auto_403882 ?auto_403887 ) ) ( not ( = ?auto_403882 ?auto_403888 ) ) ( not ( = ?auto_403882 ?auto_403889 ) ) ( not ( = ?auto_403882 ?auto_403890 ) ) ( not ( = ?auto_403882 ?auto_403891 ) ) ( not ( = ?auto_403882 ?auto_403892 ) ) ( not ( = ?auto_403883 ?auto_403884 ) ) ( not ( = ?auto_403883 ?auto_403885 ) ) ( not ( = ?auto_403883 ?auto_403886 ) ) ( not ( = ?auto_403883 ?auto_403887 ) ) ( not ( = ?auto_403883 ?auto_403888 ) ) ( not ( = ?auto_403883 ?auto_403889 ) ) ( not ( = ?auto_403883 ?auto_403890 ) ) ( not ( = ?auto_403883 ?auto_403891 ) ) ( not ( = ?auto_403883 ?auto_403892 ) ) ( not ( = ?auto_403884 ?auto_403885 ) ) ( not ( = ?auto_403884 ?auto_403886 ) ) ( not ( = ?auto_403884 ?auto_403887 ) ) ( not ( = ?auto_403884 ?auto_403888 ) ) ( not ( = ?auto_403884 ?auto_403889 ) ) ( not ( = ?auto_403884 ?auto_403890 ) ) ( not ( = ?auto_403884 ?auto_403891 ) ) ( not ( = ?auto_403884 ?auto_403892 ) ) ( not ( = ?auto_403885 ?auto_403886 ) ) ( not ( = ?auto_403885 ?auto_403887 ) ) ( not ( = ?auto_403885 ?auto_403888 ) ) ( not ( = ?auto_403885 ?auto_403889 ) ) ( not ( = ?auto_403885 ?auto_403890 ) ) ( not ( = ?auto_403885 ?auto_403891 ) ) ( not ( = ?auto_403885 ?auto_403892 ) ) ( not ( = ?auto_403886 ?auto_403887 ) ) ( not ( = ?auto_403886 ?auto_403888 ) ) ( not ( = ?auto_403886 ?auto_403889 ) ) ( not ( = ?auto_403886 ?auto_403890 ) ) ( not ( = ?auto_403886 ?auto_403891 ) ) ( not ( = ?auto_403886 ?auto_403892 ) ) ( not ( = ?auto_403887 ?auto_403888 ) ) ( not ( = ?auto_403887 ?auto_403889 ) ) ( not ( = ?auto_403887 ?auto_403890 ) ) ( not ( = ?auto_403887 ?auto_403891 ) ) ( not ( = ?auto_403887 ?auto_403892 ) ) ( not ( = ?auto_403888 ?auto_403889 ) ) ( not ( = ?auto_403888 ?auto_403890 ) ) ( not ( = ?auto_403888 ?auto_403891 ) ) ( not ( = ?auto_403888 ?auto_403892 ) ) ( not ( = ?auto_403889 ?auto_403890 ) ) ( not ( = ?auto_403889 ?auto_403891 ) ) ( not ( = ?auto_403889 ?auto_403892 ) ) ( not ( = ?auto_403890 ?auto_403891 ) ) ( not ( = ?auto_403890 ?auto_403892 ) ) ( not ( = ?auto_403891 ?auto_403892 ) ) ( ON ?auto_403890 ?auto_403891 ) ( ON ?auto_403889 ?auto_403890 ) ( ON ?auto_403888 ?auto_403889 ) ( ON ?auto_403887 ?auto_403888 ) ( ON ?auto_403886 ?auto_403887 ) ( ON ?auto_403885 ?auto_403886 ) ( CLEAR ?auto_403883 ) ( ON ?auto_403884 ?auto_403885 ) ( CLEAR ?auto_403884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_403882 ?auto_403883 ?auto_403884 )
      ( MAKE-10PILE ?auto_403882 ?auto_403883 ?auto_403884 ?auto_403885 ?auto_403886 ?auto_403887 ?auto_403888 ?auto_403889 ?auto_403890 ?auto_403891 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_403924 - BLOCK
      ?auto_403925 - BLOCK
      ?auto_403926 - BLOCK
      ?auto_403927 - BLOCK
      ?auto_403928 - BLOCK
      ?auto_403929 - BLOCK
      ?auto_403930 - BLOCK
      ?auto_403931 - BLOCK
      ?auto_403932 - BLOCK
      ?auto_403933 - BLOCK
    )
    :vars
    (
      ?auto_403934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_403933 ?auto_403934 ) ( ON-TABLE ?auto_403924 ) ( not ( = ?auto_403924 ?auto_403925 ) ) ( not ( = ?auto_403924 ?auto_403926 ) ) ( not ( = ?auto_403924 ?auto_403927 ) ) ( not ( = ?auto_403924 ?auto_403928 ) ) ( not ( = ?auto_403924 ?auto_403929 ) ) ( not ( = ?auto_403924 ?auto_403930 ) ) ( not ( = ?auto_403924 ?auto_403931 ) ) ( not ( = ?auto_403924 ?auto_403932 ) ) ( not ( = ?auto_403924 ?auto_403933 ) ) ( not ( = ?auto_403924 ?auto_403934 ) ) ( not ( = ?auto_403925 ?auto_403926 ) ) ( not ( = ?auto_403925 ?auto_403927 ) ) ( not ( = ?auto_403925 ?auto_403928 ) ) ( not ( = ?auto_403925 ?auto_403929 ) ) ( not ( = ?auto_403925 ?auto_403930 ) ) ( not ( = ?auto_403925 ?auto_403931 ) ) ( not ( = ?auto_403925 ?auto_403932 ) ) ( not ( = ?auto_403925 ?auto_403933 ) ) ( not ( = ?auto_403925 ?auto_403934 ) ) ( not ( = ?auto_403926 ?auto_403927 ) ) ( not ( = ?auto_403926 ?auto_403928 ) ) ( not ( = ?auto_403926 ?auto_403929 ) ) ( not ( = ?auto_403926 ?auto_403930 ) ) ( not ( = ?auto_403926 ?auto_403931 ) ) ( not ( = ?auto_403926 ?auto_403932 ) ) ( not ( = ?auto_403926 ?auto_403933 ) ) ( not ( = ?auto_403926 ?auto_403934 ) ) ( not ( = ?auto_403927 ?auto_403928 ) ) ( not ( = ?auto_403927 ?auto_403929 ) ) ( not ( = ?auto_403927 ?auto_403930 ) ) ( not ( = ?auto_403927 ?auto_403931 ) ) ( not ( = ?auto_403927 ?auto_403932 ) ) ( not ( = ?auto_403927 ?auto_403933 ) ) ( not ( = ?auto_403927 ?auto_403934 ) ) ( not ( = ?auto_403928 ?auto_403929 ) ) ( not ( = ?auto_403928 ?auto_403930 ) ) ( not ( = ?auto_403928 ?auto_403931 ) ) ( not ( = ?auto_403928 ?auto_403932 ) ) ( not ( = ?auto_403928 ?auto_403933 ) ) ( not ( = ?auto_403928 ?auto_403934 ) ) ( not ( = ?auto_403929 ?auto_403930 ) ) ( not ( = ?auto_403929 ?auto_403931 ) ) ( not ( = ?auto_403929 ?auto_403932 ) ) ( not ( = ?auto_403929 ?auto_403933 ) ) ( not ( = ?auto_403929 ?auto_403934 ) ) ( not ( = ?auto_403930 ?auto_403931 ) ) ( not ( = ?auto_403930 ?auto_403932 ) ) ( not ( = ?auto_403930 ?auto_403933 ) ) ( not ( = ?auto_403930 ?auto_403934 ) ) ( not ( = ?auto_403931 ?auto_403932 ) ) ( not ( = ?auto_403931 ?auto_403933 ) ) ( not ( = ?auto_403931 ?auto_403934 ) ) ( not ( = ?auto_403932 ?auto_403933 ) ) ( not ( = ?auto_403932 ?auto_403934 ) ) ( not ( = ?auto_403933 ?auto_403934 ) ) ( ON ?auto_403932 ?auto_403933 ) ( ON ?auto_403931 ?auto_403932 ) ( ON ?auto_403930 ?auto_403931 ) ( ON ?auto_403929 ?auto_403930 ) ( ON ?auto_403928 ?auto_403929 ) ( ON ?auto_403927 ?auto_403928 ) ( ON ?auto_403926 ?auto_403927 ) ( CLEAR ?auto_403924 ) ( ON ?auto_403925 ?auto_403926 ) ( CLEAR ?auto_403925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_403924 ?auto_403925 )
      ( MAKE-10PILE ?auto_403924 ?auto_403925 ?auto_403926 ?auto_403927 ?auto_403928 ?auto_403929 ?auto_403930 ?auto_403931 ?auto_403932 ?auto_403933 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_403966 - BLOCK
      ?auto_403967 - BLOCK
      ?auto_403968 - BLOCK
      ?auto_403969 - BLOCK
      ?auto_403970 - BLOCK
      ?auto_403971 - BLOCK
      ?auto_403972 - BLOCK
      ?auto_403973 - BLOCK
      ?auto_403974 - BLOCK
      ?auto_403975 - BLOCK
    )
    :vars
    (
      ?auto_403976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_403975 ?auto_403976 ) ( not ( = ?auto_403966 ?auto_403967 ) ) ( not ( = ?auto_403966 ?auto_403968 ) ) ( not ( = ?auto_403966 ?auto_403969 ) ) ( not ( = ?auto_403966 ?auto_403970 ) ) ( not ( = ?auto_403966 ?auto_403971 ) ) ( not ( = ?auto_403966 ?auto_403972 ) ) ( not ( = ?auto_403966 ?auto_403973 ) ) ( not ( = ?auto_403966 ?auto_403974 ) ) ( not ( = ?auto_403966 ?auto_403975 ) ) ( not ( = ?auto_403966 ?auto_403976 ) ) ( not ( = ?auto_403967 ?auto_403968 ) ) ( not ( = ?auto_403967 ?auto_403969 ) ) ( not ( = ?auto_403967 ?auto_403970 ) ) ( not ( = ?auto_403967 ?auto_403971 ) ) ( not ( = ?auto_403967 ?auto_403972 ) ) ( not ( = ?auto_403967 ?auto_403973 ) ) ( not ( = ?auto_403967 ?auto_403974 ) ) ( not ( = ?auto_403967 ?auto_403975 ) ) ( not ( = ?auto_403967 ?auto_403976 ) ) ( not ( = ?auto_403968 ?auto_403969 ) ) ( not ( = ?auto_403968 ?auto_403970 ) ) ( not ( = ?auto_403968 ?auto_403971 ) ) ( not ( = ?auto_403968 ?auto_403972 ) ) ( not ( = ?auto_403968 ?auto_403973 ) ) ( not ( = ?auto_403968 ?auto_403974 ) ) ( not ( = ?auto_403968 ?auto_403975 ) ) ( not ( = ?auto_403968 ?auto_403976 ) ) ( not ( = ?auto_403969 ?auto_403970 ) ) ( not ( = ?auto_403969 ?auto_403971 ) ) ( not ( = ?auto_403969 ?auto_403972 ) ) ( not ( = ?auto_403969 ?auto_403973 ) ) ( not ( = ?auto_403969 ?auto_403974 ) ) ( not ( = ?auto_403969 ?auto_403975 ) ) ( not ( = ?auto_403969 ?auto_403976 ) ) ( not ( = ?auto_403970 ?auto_403971 ) ) ( not ( = ?auto_403970 ?auto_403972 ) ) ( not ( = ?auto_403970 ?auto_403973 ) ) ( not ( = ?auto_403970 ?auto_403974 ) ) ( not ( = ?auto_403970 ?auto_403975 ) ) ( not ( = ?auto_403970 ?auto_403976 ) ) ( not ( = ?auto_403971 ?auto_403972 ) ) ( not ( = ?auto_403971 ?auto_403973 ) ) ( not ( = ?auto_403971 ?auto_403974 ) ) ( not ( = ?auto_403971 ?auto_403975 ) ) ( not ( = ?auto_403971 ?auto_403976 ) ) ( not ( = ?auto_403972 ?auto_403973 ) ) ( not ( = ?auto_403972 ?auto_403974 ) ) ( not ( = ?auto_403972 ?auto_403975 ) ) ( not ( = ?auto_403972 ?auto_403976 ) ) ( not ( = ?auto_403973 ?auto_403974 ) ) ( not ( = ?auto_403973 ?auto_403975 ) ) ( not ( = ?auto_403973 ?auto_403976 ) ) ( not ( = ?auto_403974 ?auto_403975 ) ) ( not ( = ?auto_403974 ?auto_403976 ) ) ( not ( = ?auto_403975 ?auto_403976 ) ) ( ON ?auto_403974 ?auto_403975 ) ( ON ?auto_403973 ?auto_403974 ) ( ON ?auto_403972 ?auto_403973 ) ( ON ?auto_403971 ?auto_403972 ) ( ON ?auto_403970 ?auto_403971 ) ( ON ?auto_403969 ?auto_403970 ) ( ON ?auto_403968 ?auto_403969 ) ( ON ?auto_403967 ?auto_403968 ) ( ON ?auto_403966 ?auto_403967 ) ( CLEAR ?auto_403966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_403966 )
      ( MAKE-10PILE ?auto_403966 ?auto_403967 ?auto_403968 ?auto_403969 ?auto_403970 ?auto_403971 ?auto_403972 ?auto_403973 ?auto_403974 ?auto_403975 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_404009 - BLOCK
      ?auto_404010 - BLOCK
      ?auto_404011 - BLOCK
      ?auto_404012 - BLOCK
      ?auto_404013 - BLOCK
      ?auto_404014 - BLOCK
      ?auto_404015 - BLOCK
      ?auto_404016 - BLOCK
      ?auto_404017 - BLOCK
      ?auto_404018 - BLOCK
      ?auto_404019 - BLOCK
    )
    :vars
    (
      ?auto_404020 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_404018 ) ( ON ?auto_404019 ?auto_404020 ) ( CLEAR ?auto_404019 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_404009 ) ( ON ?auto_404010 ?auto_404009 ) ( ON ?auto_404011 ?auto_404010 ) ( ON ?auto_404012 ?auto_404011 ) ( ON ?auto_404013 ?auto_404012 ) ( ON ?auto_404014 ?auto_404013 ) ( ON ?auto_404015 ?auto_404014 ) ( ON ?auto_404016 ?auto_404015 ) ( ON ?auto_404017 ?auto_404016 ) ( ON ?auto_404018 ?auto_404017 ) ( not ( = ?auto_404009 ?auto_404010 ) ) ( not ( = ?auto_404009 ?auto_404011 ) ) ( not ( = ?auto_404009 ?auto_404012 ) ) ( not ( = ?auto_404009 ?auto_404013 ) ) ( not ( = ?auto_404009 ?auto_404014 ) ) ( not ( = ?auto_404009 ?auto_404015 ) ) ( not ( = ?auto_404009 ?auto_404016 ) ) ( not ( = ?auto_404009 ?auto_404017 ) ) ( not ( = ?auto_404009 ?auto_404018 ) ) ( not ( = ?auto_404009 ?auto_404019 ) ) ( not ( = ?auto_404009 ?auto_404020 ) ) ( not ( = ?auto_404010 ?auto_404011 ) ) ( not ( = ?auto_404010 ?auto_404012 ) ) ( not ( = ?auto_404010 ?auto_404013 ) ) ( not ( = ?auto_404010 ?auto_404014 ) ) ( not ( = ?auto_404010 ?auto_404015 ) ) ( not ( = ?auto_404010 ?auto_404016 ) ) ( not ( = ?auto_404010 ?auto_404017 ) ) ( not ( = ?auto_404010 ?auto_404018 ) ) ( not ( = ?auto_404010 ?auto_404019 ) ) ( not ( = ?auto_404010 ?auto_404020 ) ) ( not ( = ?auto_404011 ?auto_404012 ) ) ( not ( = ?auto_404011 ?auto_404013 ) ) ( not ( = ?auto_404011 ?auto_404014 ) ) ( not ( = ?auto_404011 ?auto_404015 ) ) ( not ( = ?auto_404011 ?auto_404016 ) ) ( not ( = ?auto_404011 ?auto_404017 ) ) ( not ( = ?auto_404011 ?auto_404018 ) ) ( not ( = ?auto_404011 ?auto_404019 ) ) ( not ( = ?auto_404011 ?auto_404020 ) ) ( not ( = ?auto_404012 ?auto_404013 ) ) ( not ( = ?auto_404012 ?auto_404014 ) ) ( not ( = ?auto_404012 ?auto_404015 ) ) ( not ( = ?auto_404012 ?auto_404016 ) ) ( not ( = ?auto_404012 ?auto_404017 ) ) ( not ( = ?auto_404012 ?auto_404018 ) ) ( not ( = ?auto_404012 ?auto_404019 ) ) ( not ( = ?auto_404012 ?auto_404020 ) ) ( not ( = ?auto_404013 ?auto_404014 ) ) ( not ( = ?auto_404013 ?auto_404015 ) ) ( not ( = ?auto_404013 ?auto_404016 ) ) ( not ( = ?auto_404013 ?auto_404017 ) ) ( not ( = ?auto_404013 ?auto_404018 ) ) ( not ( = ?auto_404013 ?auto_404019 ) ) ( not ( = ?auto_404013 ?auto_404020 ) ) ( not ( = ?auto_404014 ?auto_404015 ) ) ( not ( = ?auto_404014 ?auto_404016 ) ) ( not ( = ?auto_404014 ?auto_404017 ) ) ( not ( = ?auto_404014 ?auto_404018 ) ) ( not ( = ?auto_404014 ?auto_404019 ) ) ( not ( = ?auto_404014 ?auto_404020 ) ) ( not ( = ?auto_404015 ?auto_404016 ) ) ( not ( = ?auto_404015 ?auto_404017 ) ) ( not ( = ?auto_404015 ?auto_404018 ) ) ( not ( = ?auto_404015 ?auto_404019 ) ) ( not ( = ?auto_404015 ?auto_404020 ) ) ( not ( = ?auto_404016 ?auto_404017 ) ) ( not ( = ?auto_404016 ?auto_404018 ) ) ( not ( = ?auto_404016 ?auto_404019 ) ) ( not ( = ?auto_404016 ?auto_404020 ) ) ( not ( = ?auto_404017 ?auto_404018 ) ) ( not ( = ?auto_404017 ?auto_404019 ) ) ( not ( = ?auto_404017 ?auto_404020 ) ) ( not ( = ?auto_404018 ?auto_404019 ) ) ( not ( = ?auto_404018 ?auto_404020 ) ) ( not ( = ?auto_404019 ?auto_404020 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_404019 ?auto_404020 )
      ( !STACK ?auto_404019 ?auto_404018 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_404055 - BLOCK
      ?auto_404056 - BLOCK
      ?auto_404057 - BLOCK
      ?auto_404058 - BLOCK
      ?auto_404059 - BLOCK
      ?auto_404060 - BLOCK
      ?auto_404061 - BLOCK
      ?auto_404062 - BLOCK
      ?auto_404063 - BLOCK
      ?auto_404064 - BLOCK
      ?auto_404065 - BLOCK
    )
    :vars
    (
      ?auto_404066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_404065 ?auto_404066 ) ( ON-TABLE ?auto_404055 ) ( ON ?auto_404056 ?auto_404055 ) ( ON ?auto_404057 ?auto_404056 ) ( ON ?auto_404058 ?auto_404057 ) ( ON ?auto_404059 ?auto_404058 ) ( ON ?auto_404060 ?auto_404059 ) ( ON ?auto_404061 ?auto_404060 ) ( ON ?auto_404062 ?auto_404061 ) ( ON ?auto_404063 ?auto_404062 ) ( not ( = ?auto_404055 ?auto_404056 ) ) ( not ( = ?auto_404055 ?auto_404057 ) ) ( not ( = ?auto_404055 ?auto_404058 ) ) ( not ( = ?auto_404055 ?auto_404059 ) ) ( not ( = ?auto_404055 ?auto_404060 ) ) ( not ( = ?auto_404055 ?auto_404061 ) ) ( not ( = ?auto_404055 ?auto_404062 ) ) ( not ( = ?auto_404055 ?auto_404063 ) ) ( not ( = ?auto_404055 ?auto_404064 ) ) ( not ( = ?auto_404055 ?auto_404065 ) ) ( not ( = ?auto_404055 ?auto_404066 ) ) ( not ( = ?auto_404056 ?auto_404057 ) ) ( not ( = ?auto_404056 ?auto_404058 ) ) ( not ( = ?auto_404056 ?auto_404059 ) ) ( not ( = ?auto_404056 ?auto_404060 ) ) ( not ( = ?auto_404056 ?auto_404061 ) ) ( not ( = ?auto_404056 ?auto_404062 ) ) ( not ( = ?auto_404056 ?auto_404063 ) ) ( not ( = ?auto_404056 ?auto_404064 ) ) ( not ( = ?auto_404056 ?auto_404065 ) ) ( not ( = ?auto_404056 ?auto_404066 ) ) ( not ( = ?auto_404057 ?auto_404058 ) ) ( not ( = ?auto_404057 ?auto_404059 ) ) ( not ( = ?auto_404057 ?auto_404060 ) ) ( not ( = ?auto_404057 ?auto_404061 ) ) ( not ( = ?auto_404057 ?auto_404062 ) ) ( not ( = ?auto_404057 ?auto_404063 ) ) ( not ( = ?auto_404057 ?auto_404064 ) ) ( not ( = ?auto_404057 ?auto_404065 ) ) ( not ( = ?auto_404057 ?auto_404066 ) ) ( not ( = ?auto_404058 ?auto_404059 ) ) ( not ( = ?auto_404058 ?auto_404060 ) ) ( not ( = ?auto_404058 ?auto_404061 ) ) ( not ( = ?auto_404058 ?auto_404062 ) ) ( not ( = ?auto_404058 ?auto_404063 ) ) ( not ( = ?auto_404058 ?auto_404064 ) ) ( not ( = ?auto_404058 ?auto_404065 ) ) ( not ( = ?auto_404058 ?auto_404066 ) ) ( not ( = ?auto_404059 ?auto_404060 ) ) ( not ( = ?auto_404059 ?auto_404061 ) ) ( not ( = ?auto_404059 ?auto_404062 ) ) ( not ( = ?auto_404059 ?auto_404063 ) ) ( not ( = ?auto_404059 ?auto_404064 ) ) ( not ( = ?auto_404059 ?auto_404065 ) ) ( not ( = ?auto_404059 ?auto_404066 ) ) ( not ( = ?auto_404060 ?auto_404061 ) ) ( not ( = ?auto_404060 ?auto_404062 ) ) ( not ( = ?auto_404060 ?auto_404063 ) ) ( not ( = ?auto_404060 ?auto_404064 ) ) ( not ( = ?auto_404060 ?auto_404065 ) ) ( not ( = ?auto_404060 ?auto_404066 ) ) ( not ( = ?auto_404061 ?auto_404062 ) ) ( not ( = ?auto_404061 ?auto_404063 ) ) ( not ( = ?auto_404061 ?auto_404064 ) ) ( not ( = ?auto_404061 ?auto_404065 ) ) ( not ( = ?auto_404061 ?auto_404066 ) ) ( not ( = ?auto_404062 ?auto_404063 ) ) ( not ( = ?auto_404062 ?auto_404064 ) ) ( not ( = ?auto_404062 ?auto_404065 ) ) ( not ( = ?auto_404062 ?auto_404066 ) ) ( not ( = ?auto_404063 ?auto_404064 ) ) ( not ( = ?auto_404063 ?auto_404065 ) ) ( not ( = ?auto_404063 ?auto_404066 ) ) ( not ( = ?auto_404064 ?auto_404065 ) ) ( not ( = ?auto_404064 ?auto_404066 ) ) ( not ( = ?auto_404065 ?auto_404066 ) ) ( CLEAR ?auto_404063 ) ( ON ?auto_404064 ?auto_404065 ) ( CLEAR ?auto_404064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_404055 ?auto_404056 ?auto_404057 ?auto_404058 ?auto_404059 ?auto_404060 ?auto_404061 ?auto_404062 ?auto_404063 ?auto_404064 )
      ( MAKE-11PILE ?auto_404055 ?auto_404056 ?auto_404057 ?auto_404058 ?auto_404059 ?auto_404060 ?auto_404061 ?auto_404062 ?auto_404063 ?auto_404064 ?auto_404065 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_404101 - BLOCK
      ?auto_404102 - BLOCK
      ?auto_404103 - BLOCK
      ?auto_404104 - BLOCK
      ?auto_404105 - BLOCK
      ?auto_404106 - BLOCK
      ?auto_404107 - BLOCK
      ?auto_404108 - BLOCK
      ?auto_404109 - BLOCK
      ?auto_404110 - BLOCK
      ?auto_404111 - BLOCK
    )
    :vars
    (
      ?auto_404112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_404111 ?auto_404112 ) ( ON-TABLE ?auto_404101 ) ( ON ?auto_404102 ?auto_404101 ) ( ON ?auto_404103 ?auto_404102 ) ( ON ?auto_404104 ?auto_404103 ) ( ON ?auto_404105 ?auto_404104 ) ( ON ?auto_404106 ?auto_404105 ) ( ON ?auto_404107 ?auto_404106 ) ( ON ?auto_404108 ?auto_404107 ) ( not ( = ?auto_404101 ?auto_404102 ) ) ( not ( = ?auto_404101 ?auto_404103 ) ) ( not ( = ?auto_404101 ?auto_404104 ) ) ( not ( = ?auto_404101 ?auto_404105 ) ) ( not ( = ?auto_404101 ?auto_404106 ) ) ( not ( = ?auto_404101 ?auto_404107 ) ) ( not ( = ?auto_404101 ?auto_404108 ) ) ( not ( = ?auto_404101 ?auto_404109 ) ) ( not ( = ?auto_404101 ?auto_404110 ) ) ( not ( = ?auto_404101 ?auto_404111 ) ) ( not ( = ?auto_404101 ?auto_404112 ) ) ( not ( = ?auto_404102 ?auto_404103 ) ) ( not ( = ?auto_404102 ?auto_404104 ) ) ( not ( = ?auto_404102 ?auto_404105 ) ) ( not ( = ?auto_404102 ?auto_404106 ) ) ( not ( = ?auto_404102 ?auto_404107 ) ) ( not ( = ?auto_404102 ?auto_404108 ) ) ( not ( = ?auto_404102 ?auto_404109 ) ) ( not ( = ?auto_404102 ?auto_404110 ) ) ( not ( = ?auto_404102 ?auto_404111 ) ) ( not ( = ?auto_404102 ?auto_404112 ) ) ( not ( = ?auto_404103 ?auto_404104 ) ) ( not ( = ?auto_404103 ?auto_404105 ) ) ( not ( = ?auto_404103 ?auto_404106 ) ) ( not ( = ?auto_404103 ?auto_404107 ) ) ( not ( = ?auto_404103 ?auto_404108 ) ) ( not ( = ?auto_404103 ?auto_404109 ) ) ( not ( = ?auto_404103 ?auto_404110 ) ) ( not ( = ?auto_404103 ?auto_404111 ) ) ( not ( = ?auto_404103 ?auto_404112 ) ) ( not ( = ?auto_404104 ?auto_404105 ) ) ( not ( = ?auto_404104 ?auto_404106 ) ) ( not ( = ?auto_404104 ?auto_404107 ) ) ( not ( = ?auto_404104 ?auto_404108 ) ) ( not ( = ?auto_404104 ?auto_404109 ) ) ( not ( = ?auto_404104 ?auto_404110 ) ) ( not ( = ?auto_404104 ?auto_404111 ) ) ( not ( = ?auto_404104 ?auto_404112 ) ) ( not ( = ?auto_404105 ?auto_404106 ) ) ( not ( = ?auto_404105 ?auto_404107 ) ) ( not ( = ?auto_404105 ?auto_404108 ) ) ( not ( = ?auto_404105 ?auto_404109 ) ) ( not ( = ?auto_404105 ?auto_404110 ) ) ( not ( = ?auto_404105 ?auto_404111 ) ) ( not ( = ?auto_404105 ?auto_404112 ) ) ( not ( = ?auto_404106 ?auto_404107 ) ) ( not ( = ?auto_404106 ?auto_404108 ) ) ( not ( = ?auto_404106 ?auto_404109 ) ) ( not ( = ?auto_404106 ?auto_404110 ) ) ( not ( = ?auto_404106 ?auto_404111 ) ) ( not ( = ?auto_404106 ?auto_404112 ) ) ( not ( = ?auto_404107 ?auto_404108 ) ) ( not ( = ?auto_404107 ?auto_404109 ) ) ( not ( = ?auto_404107 ?auto_404110 ) ) ( not ( = ?auto_404107 ?auto_404111 ) ) ( not ( = ?auto_404107 ?auto_404112 ) ) ( not ( = ?auto_404108 ?auto_404109 ) ) ( not ( = ?auto_404108 ?auto_404110 ) ) ( not ( = ?auto_404108 ?auto_404111 ) ) ( not ( = ?auto_404108 ?auto_404112 ) ) ( not ( = ?auto_404109 ?auto_404110 ) ) ( not ( = ?auto_404109 ?auto_404111 ) ) ( not ( = ?auto_404109 ?auto_404112 ) ) ( not ( = ?auto_404110 ?auto_404111 ) ) ( not ( = ?auto_404110 ?auto_404112 ) ) ( not ( = ?auto_404111 ?auto_404112 ) ) ( ON ?auto_404110 ?auto_404111 ) ( CLEAR ?auto_404108 ) ( ON ?auto_404109 ?auto_404110 ) ( CLEAR ?auto_404109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_404101 ?auto_404102 ?auto_404103 ?auto_404104 ?auto_404105 ?auto_404106 ?auto_404107 ?auto_404108 ?auto_404109 )
      ( MAKE-11PILE ?auto_404101 ?auto_404102 ?auto_404103 ?auto_404104 ?auto_404105 ?auto_404106 ?auto_404107 ?auto_404108 ?auto_404109 ?auto_404110 ?auto_404111 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_404147 - BLOCK
      ?auto_404148 - BLOCK
      ?auto_404149 - BLOCK
      ?auto_404150 - BLOCK
      ?auto_404151 - BLOCK
      ?auto_404152 - BLOCK
      ?auto_404153 - BLOCK
      ?auto_404154 - BLOCK
      ?auto_404155 - BLOCK
      ?auto_404156 - BLOCK
      ?auto_404157 - BLOCK
    )
    :vars
    (
      ?auto_404158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_404157 ?auto_404158 ) ( ON-TABLE ?auto_404147 ) ( ON ?auto_404148 ?auto_404147 ) ( ON ?auto_404149 ?auto_404148 ) ( ON ?auto_404150 ?auto_404149 ) ( ON ?auto_404151 ?auto_404150 ) ( ON ?auto_404152 ?auto_404151 ) ( ON ?auto_404153 ?auto_404152 ) ( not ( = ?auto_404147 ?auto_404148 ) ) ( not ( = ?auto_404147 ?auto_404149 ) ) ( not ( = ?auto_404147 ?auto_404150 ) ) ( not ( = ?auto_404147 ?auto_404151 ) ) ( not ( = ?auto_404147 ?auto_404152 ) ) ( not ( = ?auto_404147 ?auto_404153 ) ) ( not ( = ?auto_404147 ?auto_404154 ) ) ( not ( = ?auto_404147 ?auto_404155 ) ) ( not ( = ?auto_404147 ?auto_404156 ) ) ( not ( = ?auto_404147 ?auto_404157 ) ) ( not ( = ?auto_404147 ?auto_404158 ) ) ( not ( = ?auto_404148 ?auto_404149 ) ) ( not ( = ?auto_404148 ?auto_404150 ) ) ( not ( = ?auto_404148 ?auto_404151 ) ) ( not ( = ?auto_404148 ?auto_404152 ) ) ( not ( = ?auto_404148 ?auto_404153 ) ) ( not ( = ?auto_404148 ?auto_404154 ) ) ( not ( = ?auto_404148 ?auto_404155 ) ) ( not ( = ?auto_404148 ?auto_404156 ) ) ( not ( = ?auto_404148 ?auto_404157 ) ) ( not ( = ?auto_404148 ?auto_404158 ) ) ( not ( = ?auto_404149 ?auto_404150 ) ) ( not ( = ?auto_404149 ?auto_404151 ) ) ( not ( = ?auto_404149 ?auto_404152 ) ) ( not ( = ?auto_404149 ?auto_404153 ) ) ( not ( = ?auto_404149 ?auto_404154 ) ) ( not ( = ?auto_404149 ?auto_404155 ) ) ( not ( = ?auto_404149 ?auto_404156 ) ) ( not ( = ?auto_404149 ?auto_404157 ) ) ( not ( = ?auto_404149 ?auto_404158 ) ) ( not ( = ?auto_404150 ?auto_404151 ) ) ( not ( = ?auto_404150 ?auto_404152 ) ) ( not ( = ?auto_404150 ?auto_404153 ) ) ( not ( = ?auto_404150 ?auto_404154 ) ) ( not ( = ?auto_404150 ?auto_404155 ) ) ( not ( = ?auto_404150 ?auto_404156 ) ) ( not ( = ?auto_404150 ?auto_404157 ) ) ( not ( = ?auto_404150 ?auto_404158 ) ) ( not ( = ?auto_404151 ?auto_404152 ) ) ( not ( = ?auto_404151 ?auto_404153 ) ) ( not ( = ?auto_404151 ?auto_404154 ) ) ( not ( = ?auto_404151 ?auto_404155 ) ) ( not ( = ?auto_404151 ?auto_404156 ) ) ( not ( = ?auto_404151 ?auto_404157 ) ) ( not ( = ?auto_404151 ?auto_404158 ) ) ( not ( = ?auto_404152 ?auto_404153 ) ) ( not ( = ?auto_404152 ?auto_404154 ) ) ( not ( = ?auto_404152 ?auto_404155 ) ) ( not ( = ?auto_404152 ?auto_404156 ) ) ( not ( = ?auto_404152 ?auto_404157 ) ) ( not ( = ?auto_404152 ?auto_404158 ) ) ( not ( = ?auto_404153 ?auto_404154 ) ) ( not ( = ?auto_404153 ?auto_404155 ) ) ( not ( = ?auto_404153 ?auto_404156 ) ) ( not ( = ?auto_404153 ?auto_404157 ) ) ( not ( = ?auto_404153 ?auto_404158 ) ) ( not ( = ?auto_404154 ?auto_404155 ) ) ( not ( = ?auto_404154 ?auto_404156 ) ) ( not ( = ?auto_404154 ?auto_404157 ) ) ( not ( = ?auto_404154 ?auto_404158 ) ) ( not ( = ?auto_404155 ?auto_404156 ) ) ( not ( = ?auto_404155 ?auto_404157 ) ) ( not ( = ?auto_404155 ?auto_404158 ) ) ( not ( = ?auto_404156 ?auto_404157 ) ) ( not ( = ?auto_404156 ?auto_404158 ) ) ( not ( = ?auto_404157 ?auto_404158 ) ) ( ON ?auto_404156 ?auto_404157 ) ( ON ?auto_404155 ?auto_404156 ) ( CLEAR ?auto_404153 ) ( ON ?auto_404154 ?auto_404155 ) ( CLEAR ?auto_404154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_404147 ?auto_404148 ?auto_404149 ?auto_404150 ?auto_404151 ?auto_404152 ?auto_404153 ?auto_404154 )
      ( MAKE-11PILE ?auto_404147 ?auto_404148 ?auto_404149 ?auto_404150 ?auto_404151 ?auto_404152 ?auto_404153 ?auto_404154 ?auto_404155 ?auto_404156 ?auto_404157 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_404193 - BLOCK
      ?auto_404194 - BLOCK
      ?auto_404195 - BLOCK
      ?auto_404196 - BLOCK
      ?auto_404197 - BLOCK
      ?auto_404198 - BLOCK
      ?auto_404199 - BLOCK
      ?auto_404200 - BLOCK
      ?auto_404201 - BLOCK
      ?auto_404202 - BLOCK
      ?auto_404203 - BLOCK
    )
    :vars
    (
      ?auto_404204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_404203 ?auto_404204 ) ( ON-TABLE ?auto_404193 ) ( ON ?auto_404194 ?auto_404193 ) ( ON ?auto_404195 ?auto_404194 ) ( ON ?auto_404196 ?auto_404195 ) ( ON ?auto_404197 ?auto_404196 ) ( ON ?auto_404198 ?auto_404197 ) ( not ( = ?auto_404193 ?auto_404194 ) ) ( not ( = ?auto_404193 ?auto_404195 ) ) ( not ( = ?auto_404193 ?auto_404196 ) ) ( not ( = ?auto_404193 ?auto_404197 ) ) ( not ( = ?auto_404193 ?auto_404198 ) ) ( not ( = ?auto_404193 ?auto_404199 ) ) ( not ( = ?auto_404193 ?auto_404200 ) ) ( not ( = ?auto_404193 ?auto_404201 ) ) ( not ( = ?auto_404193 ?auto_404202 ) ) ( not ( = ?auto_404193 ?auto_404203 ) ) ( not ( = ?auto_404193 ?auto_404204 ) ) ( not ( = ?auto_404194 ?auto_404195 ) ) ( not ( = ?auto_404194 ?auto_404196 ) ) ( not ( = ?auto_404194 ?auto_404197 ) ) ( not ( = ?auto_404194 ?auto_404198 ) ) ( not ( = ?auto_404194 ?auto_404199 ) ) ( not ( = ?auto_404194 ?auto_404200 ) ) ( not ( = ?auto_404194 ?auto_404201 ) ) ( not ( = ?auto_404194 ?auto_404202 ) ) ( not ( = ?auto_404194 ?auto_404203 ) ) ( not ( = ?auto_404194 ?auto_404204 ) ) ( not ( = ?auto_404195 ?auto_404196 ) ) ( not ( = ?auto_404195 ?auto_404197 ) ) ( not ( = ?auto_404195 ?auto_404198 ) ) ( not ( = ?auto_404195 ?auto_404199 ) ) ( not ( = ?auto_404195 ?auto_404200 ) ) ( not ( = ?auto_404195 ?auto_404201 ) ) ( not ( = ?auto_404195 ?auto_404202 ) ) ( not ( = ?auto_404195 ?auto_404203 ) ) ( not ( = ?auto_404195 ?auto_404204 ) ) ( not ( = ?auto_404196 ?auto_404197 ) ) ( not ( = ?auto_404196 ?auto_404198 ) ) ( not ( = ?auto_404196 ?auto_404199 ) ) ( not ( = ?auto_404196 ?auto_404200 ) ) ( not ( = ?auto_404196 ?auto_404201 ) ) ( not ( = ?auto_404196 ?auto_404202 ) ) ( not ( = ?auto_404196 ?auto_404203 ) ) ( not ( = ?auto_404196 ?auto_404204 ) ) ( not ( = ?auto_404197 ?auto_404198 ) ) ( not ( = ?auto_404197 ?auto_404199 ) ) ( not ( = ?auto_404197 ?auto_404200 ) ) ( not ( = ?auto_404197 ?auto_404201 ) ) ( not ( = ?auto_404197 ?auto_404202 ) ) ( not ( = ?auto_404197 ?auto_404203 ) ) ( not ( = ?auto_404197 ?auto_404204 ) ) ( not ( = ?auto_404198 ?auto_404199 ) ) ( not ( = ?auto_404198 ?auto_404200 ) ) ( not ( = ?auto_404198 ?auto_404201 ) ) ( not ( = ?auto_404198 ?auto_404202 ) ) ( not ( = ?auto_404198 ?auto_404203 ) ) ( not ( = ?auto_404198 ?auto_404204 ) ) ( not ( = ?auto_404199 ?auto_404200 ) ) ( not ( = ?auto_404199 ?auto_404201 ) ) ( not ( = ?auto_404199 ?auto_404202 ) ) ( not ( = ?auto_404199 ?auto_404203 ) ) ( not ( = ?auto_404199 ?auto_404204 ) ) ( not ( = ?auto_404200 ?auto_404201 ) ) ( not ( = ?auto_404200 ?auto_404202 ) ) ( not ( = ?auto_404200 ?auto_404203 ) ) ( not ( = ?auto_404200 ?auto_404204 ) ) ( not ( = ?auto_404201 ?auto_404202 ) ) ( not ( = ?auto_404201 ?auto_404203 ) ) ( not ( = ?auto_404201 ?auto_404204 ) ) ( not ( = ?auto_404202 ?auto_404203 ) ) ( not ( = ?auto_404202 ?auto_404204 ) ) ( not ( = ?auto_404203 ?auto_404204 ) ) ( ON ?auto_404202 ?auto_404203 ) ( ON ?auto_404201 ?auto_404202 ) ( ON ?auto_404200 ?auto_404201 ) ( CLEAR ?auto_404198 ) ( ON ?auto_404199 ?auto_404200 ) ( CLEAR ?auto_404199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_404193 ?auto_404194 ?auto_404195 ?auto_404196 ?auto_404197 ?auto_404198 ?auto_404199 )
      ( MAKE-11PILE ?auto_404193 ?auto_404194 ?auto_404195 ?auto_404196 ?auto_404197 ?auto_404198 ?auto_404199 ?auto_404200 ?auto_404201 ?auto_404202 ?auto_404203 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_404239 - BLOCK
      ?auto_404240 - BLOCK
      ?auto_404241 - BLOCK
      ?auto_404242 - BLOCK
      ?auto_404243 - BLOCK
      ?auto_404244 - BLOCK
      ?auto_404245 - BLOCK
      ?auto_404246 - BLOCK
      ?auto_404247 - BLOCK
      ?auto_404248 - BLOCK
      ?auto_404249 - BLOCK
    )
    :vars
    (
      ?auto_404250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_404249 ?auto_404250 ) ( ON-TABLE ?auto_404239 ) ( ON ?auto_404240 ?auto_404239 ) ( ON ?auto_404241 ?auto_404240 ) ( ON ?auto_404242 ?auto_404241 ) ( ON ?auto_404243 ?auto_404242 ) ( not ( = ?auto_404239 ?auto_404240 ) ) ( not ( = ?auto_404239 ?auto_404241 ) ) ( not ( = ?auto_404239 ?auto_404242 ) ) ( not ( = ?auto_404239 ?auto_404243 ) ) ( not ( = ?auto_404239 ?auto_404244 ) ) ( not ( = ?auto_404239 ?auto_404245 ) ) ( not ( = ?auto_404239 ?auto_404246 ) ) ( not ( = ?auto_404239 ?auto_404247 ) ) ( not ( = ?auto_404239 ?auto_404248 ) ) ( not ( = ?auto_404239 ?auto_404249 ) ) ( not ( = ?auto_404239 ?auto_404250 ) ) ( not ( = ?auto_404240 ?auto_404241 ) ) ( not ( = ?auto_404240 ?auto_404242 ) ) ( not ( = ?auto_404240 ?auto_404243 ) ) ( not ( = ?auto_404240 ?auto_404244 ) ) ( not ( = ?auto_404240 ?auto_404245 ) ) ( not ( = ?auto_404240 ?auto_404246 ) ) ( not ( = ?auto_404240 ?auto_404247 ) ) ( not ( = ?auto_404240 ?auto_404248 ) ) ( not ( = ?auto_404240 ?auto_404249 ) ) ( not ( = ?auto_404240 ?auto_404250 ) ) ( not ( = ?auto_404241 ?auto_404242 ) ) ( not ( = ?auto_404241 ?auto_404243 ) ) ( not ( = ?auto_404241 ?auto_404244 ) ) ( not ( = ?auto_404241 ?auto_404245 ) ) ( not ( = ?auto_404241 ?auto_404246 ) ) ( not ( = ?auto_404241 ?auto_404247 ) ) ( not ( = ?auto_404241 ?auto_404248 ) ) ( not ( = ?auto_404241 ?auto_404249 ) ) ( not ( = ?auto_404241 ?auto_404250 ) ) ( not ( = ?auto_404242 ?auto_404243 ) ) ( not ( = ?auto_404242 ?auto_404244 ) ) ( not ( = ?auto_404242 ?auto_404245 ) ) ( not ( = ?auto_404242 ?auto_404246 ) ) ( not ( = ?auto_404242 ?auto_404247 ) ) ( not ( = ?auto_404242 ?auto_404248 ) ) ( not ( = ?auto_404242 ?auto_404249 ) ) ( not ( = ?auto_404242 ?auto_404250 ) ) ( not ( = ?auto_404243 ?auto_404244 ) ) ( not ( = ?auto_404243 ?auto_404245 ) ) ( not ( = ?auto_404243 ?auto_404246 ) ) ( not ( = ?auto_404243 ?auto_404247 ) ) ( not ( = ?auto_404243 ?auto_404248 ) ) ( not ( = ?auto_404243 ?auto_404249 ) ) ( not ( = ?auto_404243 ?auto_404250 ) ) ( not ( = ?auto_404244 ?auto_404245 ) ) ( not ( = ?auto_404244 ?auto_404246 ) ) ( not ( = ?auto_404244 ?auto_404247 ) ) ( not ( = ?auto_404244 ?auto_404248 ) ) ( not ( = ?auto_404244 ?auto_404249 ) ) ( not ( = ?auto_404244 ?auto_404250 ) ) ( not ( = ?auto_404245 ?auto_404246 ) ) ( not ( = ?auto_404245 ?auto_404247 ) ) ( not ( = ?auto_404245 ?auto_404248 ) ) ( not ( = ?auto_404245 ?auto_404249 ) ) ( not ( = ?auto_404245 ?auto_404250 ) ) ( not ( = ?auto_404246 ?auto_404247 ) ) ( not ( = ?auto_404246 ?auto_404248 ) ) ( not ( = ?auto_404246 ?auto_404249 ) ) ( not ( = ?auto_404246 ?auto_404250 ) ) ( not ( = ?auto_404247 ?auto_404248 ) ) ( not ( = ?auto_404247 ?auto_404249 ) ) ( not ( = ?auto_404247 ?auto_404250 ) ) ( not ( = ?auto_404248 ?auto_404249 ) ) ( not ( = ?auto_404248 ?auto_404250 ) ) ( not ( = ?auto_404249 ?auto_404250 ) ) ( ON ?auto_404248 ?auto_404249 ) ( ON ?auto_404247 ?auto_404248 ) ( ON ?auto_404246 ?auto_404247 ) ( ON ?auto_404245 ?auto_404246 ) ( CLEAR ?auto_404243 ) ( ON ?auto_404244 ?auto_404245 ) ( CLEAR ?auto_404244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_404239 ?auto_404240 ?auto_404241 ?auto_404242 ?auto_404243 ?auto_404244 )
      ( MAKE-11PILE ?auto_404239 ?auto_404240 ?auto_404241 ?auto_404242 ?auto_404243 ?auto_404244 ?auto_404245 ?auto_404246 ?auto_404247 ?auto_404248 ?auto_404249 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_404285 - BLOCK
      ?auto_404286 - BLOCK
      ?auto_404287 - BLOCK
      ?auto_404288 - BLOCK
      ?auto_404289 - BLOCK
      ?auto_404290 - BLOCK
      ?auto_404291 - BLOCK
      ?auto_404292 - BLOCK
      ?auto_404293 - BLOCK
      ?auto_404294 - BLOCK
      ?auto_404295 - BLOCK
    )
    :vars
    (
      ?auto_404296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_404295 ?auto_404296 ) ( ON-TABLE ?auto_404285 ) ( ON ?auto_404286 ?auto_404285 ) ( ON ?auto_404287 ?auto_404286 ) ( ON ?auto_404288 ?auto_404287 ) ( not ( = ?auto_404285 ?auto_404286 ) ) ( not ( = ?auto_404285 ?auto_404287 ) ) ( not ( = ?auto_404285 ?auto_404288 ) ) ( not ( = ?auto_404285 ?auto_404289 ) ) ( not ( = ?auto_404285 ?auto_404290 ) ) ( not ( = ?auto_404285 ?auto_404291 ) ) ( not ( = ?auto_404285 ?auto_404292 ) ) ( not ( = ?auto_404285 ?auto_404293 ) ) ( not ( = ?auto_404285 ?auto_404294 ) ) ( not ( = ?auto_404285 ?auto_404295 ) ) ( not ( = ?auto_404285 ?auto_404296 ) ) ( not ( = ?auto_404286 ?auto_404287 ) ) ( not ( = ?auto_404286 ?auto_404288 ) ) ( not ( = ?auto_404286 ?auto_404289 ) ) ( not ( = ?auto_404286 ?auto_404290 ) ) ( not ( = ?auto_404286 ?auto_404291 ) ) ( not ( = ?auto_404286 ?auto_404292 ) ) ( not ( = ?auto_404286 ?auto_404293 ) ) ( not ( = ?auto_404286 ?auto_404294 ) ) ( not ( = ?auto_404286 ?auto_404295 ) ) ( not ( = ?auto_404286 ?auto_404296 ) ) ( not ( = ?auto_404287 ?auto_404288 ) ) ( not ( = ?auto_404287 ?auto_404289 ) ) ( not ( = ?auto_404287 ?auto_404290 ) ) ( not ( = ?auto_404287 ?auto_404291 ) ) ( not ( = ?auto_404287 ?auto_404292 ) ) ( not ( = ?auto_404287 ?auto_404293 ) ) ( not ( = ?auto_404287 ?auto_404294 ) ) ( not ( = ?auto_404287 ?auto_404295 ) ) ( not ( = ?auto_404287 ?auto_404296 ) ) ( not ( = ?auto_404288 ?auto_404289 ) ) ( not ( = ?auto_404288 ?auto_404290 ) ) ( not ( = ?auto_404288 ?auto_404291 ) ) ( not ( = ?auto_404288 ?auto_404292 ) ) ( not ( = ?auto_404288 ?auto_404293 ) ) ( not ( = ?auto_404288 ?auto_404294 ) ) ( not ( = ?auto_404288 ?auto_404295 ) ) ( not ( = ?auto_404288 ?auto_404296 ) ) ( not ( = ?auto_404289 ?auto_404290 ) ) ( not ( = ?auto_404289 ?auto_404291 ) ) ( not ( = ?auto_404289 ?auto_404292 ) ) ( not ( = ?auto_404289 ?auto_404293 ) ) ( not ( = ?auto_404289 ?auto_404294 ) ) ( not ( = ?auto_404289 ?auto_404295 ) ) ( not ( = ?auto_404289 ?auto_404296 ) ) ( not ( = ?auto_404290 ?auto_404291 ) ) ( not ( = ?auto_404290 ?auto_404292 ) ) ( not ( = ?auto_404290 ?auto_404293 ) ) ( not ( = ?auto_404290 ?auto_404294 ) ) ( not ( = ?auto_404290 ?auto_404295 ) ) ( not ( = ?auto_404290 ?auto_404296 ) ) ( not ( = ?auto_404291 ?auto_404292 ) ) ( not ( = ?auto_404291 ?auto_404293 ) ) ( not ( = ?auto_404291 ?auto_404294 ) ) ( not ( = ?auto_404291 ?auto_404295 ) ) ( not ( = ?auto_404291 ?auto_404296 ) ) ( not ( = ?auto_404292 ?auto_404293 ) ) ( not ( = ?auto_404292 ?auto_404294 ) ) ( not ( = ?auto_404292 ?auto_404295 ) ) ( not ( = ?auto_404292 ?auto_404296 ) ) ( not ( = ?auto_404293 ?auto_404294 ) ) ( not ( = ?auto_404293 ?auto_404295 ) ) ( not ( = ?auto_404293 ?auto_404296 ) ) ( not ( = ?auto_404294 ?auto_404295 ) ) ( not ( = ?auto_404294 ?auto_404296 ) ) ( not ( = ?auto_404295 ?auto_404296 ) ) ( ON ?auto_404294 ?auto_404295 ) ( ON ?auto_404293 ?auto_404294 ) ( ON ?auto_404292 ?auto_404293 ) ( ON ?auto_404291 ?auto_404292 ) ( ON ?auto_404290 ?auto_404291 ) ( CLEAR ?auto_404288 ) ( ON ?auto_404289 ?auto_404290 ) ( CLEAR ?auto_404289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_404285 ?auto_404286 ?auto_404287 ?auto_404288 ?auto_404289 )
      ( MAKE-11PILE ?auto_404285 ?auto_404286 ?auto_404287 ?auto_404288 ?auto_404289 ?auto_404290 ?auto_404291 ?auto_404292 ?auto_404293 ?auto_404294 ?auto_404295 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_404331 - BLOCK
      ?auto_404332 - BLOCK
      ?auto_404333 - BLOCK
      ?auto_404334 - BLOCK
      ?auto_404335 - BLOCK
      ?auto_404336 - BLOCK
      ?auto_404337 - BLOCK
      ?auto_404338 - BLOCK
      ?auto_404339 - BLOCK
      ?auto_404340 - BLOCK
      ?auto_404341 - BLOCK
    )
    :vars
    (
      ?auto_404342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_404341 ?auto_404342 ) ( ON-TABLE ?auto_404331 ) ( ON ?auto_404332 ?auto_404331 ) ( ON ?auto_404333 ?auto_404332 ) ( not ( = ?auto_404331 ?auto_404332 ) ) ( not ( = ?auto_404331 ?auto_404333 ) ) ( not ( = ?auto_404331 ?auto_404334 ) ) ( not ( = ?auto_404331 ?auto_404335 ) ) ( not ( = ?auto_404331 ?auto_404336 ) ) ( not ( = ?auto_404331 ?auto_404337 ) ) ( not ( = ?auto_404331 ?auto_404338 ) ) ( not ( = ?auto_404331 ?auto_404339 ) ) ( not ( = ?auto_404331 ?auto_404340 ) ) ( not ( = ?auto_404331 ?auto_404341 ) ) ( not ( = ?auto_404331 ?auto_404342 ) ) ( not ( = ?auto_404332 ?auto_404333 ) ) ( not ( = ?auto_404332 ?auto_404334 ) ) ( not ( = ?auto_404332 ?auto_404335 ) ) ( not ( = ?auto_404332 ?auto_404336 ) ) ( not ( = ?auto_404332 ?auto_404337 ) ) ( not ( = ?auto_404332 ?auto_404338 ) ) ( not ( = ?auto_404332 ?auto_404339 ) ) ( not ( = ?auto_404332 ?auto_404340 ) ) ( not ( = ?auto_404332 ?auto_404341 ) ) ( not ( = ?auto_404332 ?auto_404342 ) ) ( not ( = ?auto_404333 ?auto_404334 ) ) ( not ( = ?auto_404333 ?auto_404335 ) ) ( not ( = ?auto_404333 ?auto_404336 ) ) ( not ( = ?auto_404333 ?auto_404337 ) ) ( not ( = ?auto_404333 ?auto_404338 ) ) ( not ( = ?auto_404333 ?auto_404339 ) ) ( not ( = ?auto_404333 ?auto_404340 ) ) ( not ( = ?auto_404333 ?auto_404341 ) ) ( not ( = ?auto_404333 ?auto_404342 ) ) ( not ( = ?auto_404334 ?auto_404335 ) ) ( not ( = ?auto_404334 ?auto_404336 ) ) ( not ( = ?auto_404334 ?auto_404337 ) ) ( not ( = ?auto_404334 ?auto_404338 ) ) ( not ( = ?auto_404334 ?auto_404339 ) ) ( not ( = ?auto_404334 ?auto_404340 ) ) ( not ( = ?auto_404334 ?auto_404341 ) ) ( not ( = ?auto_404334 ?auto_404342 ) ) ( not ( = ?auto_404335 ?auto_404336 ) ) ( not ( = ?auto_404335 ?auto_404337 ) ) ( not ( = ?auto_404335 ?auto_404338 ) ) ( not ( = ?auto_404335 ?auto_404339 ) ) ( not ( = ?auto_404335 ?auto_404340 ) ) ( not ( = ?auto_404335 ?auto_404341 ) ) ( not ( = ?auto_404335 ?auto_404342 ) ) ( not ( = ?auto_404336 ?auto_404337 ) ) ( not ( = ?auto_404336 ?auto_404338 ) ) ( not ( = ?auto_404336 ?auto_404339 ) ) ( not ( = ?auto_404336 ?auto_404340 ) ) ( not ( = ?auto_404336 ?auto_404341 ) ) ( not ( = ?auto_404336 ?auto_404342 ) ) ( not ( = ?auto_404337 ?auto_404338 ) ) ( not ( = ?auto_404337 ?auto_404339 ) ) ( not ( = ?auto_404337 ?auto_404340 ) ) ( not ( = ?auto_404337 ?auto_404341 ) ) ( not ( = ?auto_404337 ?auto_404342 ) ) ( not ( = ?auto_404338 ?auto_404339 ) ) ( not ( = ?auto_404338 ?auto_404340 ) ) ( not ( = ?auto_404338 ?auto_404341 ) ) ( not ( = ?auto_404338 ?auto_404342 ) ) ( not ( = ?auto_404339 ?auto_404340 ) ) ( not ( = ?auto_404339 ?auto_404341 ) ) ( not ( = ?auto_404339 ?auto_404342 ) ) ( not ( = ?auto_404340 ?auto_404341 ) ) ( not ( = ?auto_404340 ?auto_404342 ) ) ( not ( = ?auto_404341 ?auto_404342 ) ) ( ON ?auto_404340 ?auto_404341 ) ( ON ?auto_404339 ?auto_404340 ) ( ON ?auto_404338 ?auto_404339 ) ( ON ?auto_404337 ?auto_404338 ) ( ON ?auto_404336 ?auto_404337 ) ( ON ?auto_404335 ?auto_404336 ) ( CLEAR ?auto_404333 ) ( ON ?auto_404334 ?auto_404335 ) ( CLEAR ?auto_404334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_404331 ?auto_404332 ?auto_404333 ?auto_404334 )
      ( MAKE-11PILE ?auto_404331 ?auto_404332 ?auto_404333 ?auto_404334 ?auto_404335 ?auto_404336 ?auto_404337 ?auto_404338 ?auto_404339 ?auto_404340 ?auto_404341 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_404377 - BLOCK
      ?auto_404378 - BLOCK
      ?auto_404379 - BLOCK
      ?auto_404380 - BLOCK
      ?auto_404381 - BLOCK
      ?auto_404382 - BLOCK
      ?auto_404383 - BLOCK
      ?auto_404384 - BLOCK
      ?auto_404385 - BLOCK
      ?auto_404386 - BLOCK
      ?auto_404387 - BLOCK
    )
    :vars
    (
      ?auto_404388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_404387 ?auto_404388 ) ( ON-TABLE ?auto_404377 ) ( ON ?auto_404378 ?auto_404377 ) ( not ( = ?auto_404377 ?auto_404378 ) ) ( not ( = ?auto_404377 ?auto_404379 ) ) ( not ( = ?auto_404377 ?auto_404380 ) ) ( not ( = ?auto_404377 ?auto_404381 ) ) ( not ( = ?auto_404377 ?auto_404382 ) ) ( not ( = ?auto_404377 ?auto_404383 ) ) ( not ( = ?auto_404377 ?auto_404384 ) ) ( not ( = ?auto_404377 ?auto_404385 ) ) ( not ( = ?auto_404377 ?auto_404386 ) ) ( not ( = ?auto_404377 ?auto_404387 ) ) ( not ( = ?auto_404377 ?auto_404388 ) ) ( not ( = ?auto_404378 ?auto_404379 ) ) ( not ( = ?auto_404378 ?auto_404380 ) ) ( not ( = ?auto_404378 ?auto_404381 ) ) ( not ( = ?auto_404378 ?auto_404382 ) ) ( not ( = ?auto_404378 ?auto_404383 ) ) ( not ( = ?auto_404378 ?auto_404384 ) ) ( not ( = ?auto_404378 ?auto_404385 ) ) ( not ( = ?auto_404378 ?auto_404386 ) ) ( not ( = ?auto_404378 ?auto_404387 ) ) ( not ( = ?auto_404378 ?auto_404388 ) ) ( not ( = ?auto_404379 ?auto_404380 ) ) ( not ( = ?auto_404379 ?auto_404381 ) ) ( not ( = ?auto_404379 ?auto_404382 ) ) ( not ( = ?auto_404379 ?auto_404383 ) ) ( not ( = ?auto_404379 ?auto_404384 ) ) ( not ( = ?auto_404379 ?auto_404385 ) ) ( not ( = ?auto_404379 ?auto_404386 ) ) ( not ( = ?auto_404379 ?auto_404387 ) ) ( not ( = ?auto_404379 ?auto_404388 ) ) ( not ( = ?auto_404380 ?auto_404381 ) ) ( not ( = ?auto_404380 ?auto_404382 ) ) ( not ( = ?auto_404380 ?auto_404383 ) ) ( not ( = ?auto_404380 ?auto_404384 ) ) ( not ( = ?auto_404380 ?auto_404385 ) ) ( not ( = ?auto_404380 ?auto_404386 ) ) ( not ( = ?auto_404380 ?auto_404387 ) ) ( not ( = ?auto_404380 ?auto_404388 ) ) ( not ( = ?auto_404381 ?auto_404382 ) ) ( not ( = ?auto_404381 ?auto_404383 ) ) ( not ( = ?auto_404381 ?auto_404384 ) ) ( not ( = ?auto_404381 ?auto_404385 ) ) ( not ( = ?auto_404381 ?auto_404386 ) ) ( not ( = ?auto_404381 ?auto_404387 ) ) ( not ( = ?auto_404381 ?auto_404388 ) ) ( not ( = ?auto_404382 ?auto_404383 ) ) ( not ( = ?auto_404382 ?auto_404384 ) ) ( not ( = ?auto_404382 ?auto_404385 ) ) ( not ( = ?auto_404382 ?auto_404386 ) ) ( not ( = ?auto_404382 ?auto_404387 ) ) ( not ( = ?auto_404382 ?auto_404388 ) ) ( not ( = ?auto_404383 ?auto_404384 ) ) ( not ( = ?auto_404383 ?auto_404385 ) ) ( not ( = ?auto_404383 ?auto_404386 ) ) ( not ( = ?auto_404383 ?auto_404387 ) ) ( not ( = ?auto_404383 ?auto_404388 ) ) ( not ( = ?auto_404384 ?auto_404385 ) ) ( not ( = ?auto_404384 ?auto_404386 ) ) ( not ( = ?auto_404384 ?auto_404387 ) ) ( not ( = ?auto_404384 ?auto_404388 ) ) ( not ( = ?auto_404385 ?auto_404386 ) ) ( not ( = ?auto_404385 ?auto_404387 ) ) ( not ( = ?auto_404385 ?auto_404388 ) ) ( not ( = ?auto_404386 ?auto_404387 ) ) ( not ( = ?auto_404386 ?auto_404388 ) ) ( not ( = ?auto_404387 ?auto_404388 ) ) ( ON ?auto_404386 ?auto_404387 ) ( ON ?auto_404385 ?auto_404386 ) ( ON ?auto_404384 ?auto_404385 ) ( ON ?auto_404383 ?auto_404384 ) ( ON ?auto_404382 ?auto_404383 ) ( ON ?auto_404381 ?auto_404382 ) ( ON ?auto_404380 ?auto_404381 ) ( CLEAR ?auto_404378 ) ( ON ?auto_404379 ?auto_404380 ) ( CLEAR ?auto_404379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_404377 ?auto_404378 ?auto_404379 )
      ( MAKE-11PILE ?auto_404377 ?auto_404378 ?auto_404379 ?auto_404380 ?auto_404381 ?auto_404382 ?auto_404383 ?auto_404384 ?auto_404385 ?auto_404386 ?auto_404387 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_404423 - BLOCK
      ?auto_404424 - BLOCK
      ?auto_404425 - BLOCK
      ?auto_404426 - BLOCK
      ?auto_404427 - BLOCK
      ?auto_404428 - BLOCK
      ?auto_404429 - BLOCK
      ?auto_404430 - BLOCK
      ?auto_404431 - BLOCK
      ?auto_404432 - BLOCK
      ?auto_404433 - BLOCK
    )
    :vars
    (
      ?auto_404434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_404433 ?auto_404434 ) ( ON-TABLE ?auto_404423 ) ( not ( = ?auto_404423 ?auto_404424 ) ) ( not ( = ?auto_404423 ?auto_404425 ) ) ( not ( = ?auto_404423 ?auto_404426 ) ) ( not ( = ?auto_404423 ?auto_404427 ) ) ( not ( = ?auto_404423 ?auto_404428 ) ) ( not ( = ?auto_404423 ?auto_404429 ) ) ( not ( = ?auto_404423 ?auto_404430 ) ) ( not ( = ?auto_404423 ?auto_404431 ) ) ( not ( = ?auto_404423 ?auto_404432 ) ) ( not ( = ?auto_404423 ?auto_404433 ) ) ( not ( = ?auto_404423 ?auto_404434 ) ) ( not ( = ?auto_404424 ?auto_404425 ) ) ( not ( = ?auto_404424 ?auto_404426 ) ) ( not ( = ?auto_404424 ?auto_404427 ) ) ( not ( = ?auto_404424 ?auto_404428 ) ) ( not ( = ?auto_404424 ?auto_404429 ) ) ( not ( = ?auto_404424 ?auto_404430 ) ) ( not ( = ?auto_404424 ?auto_404431 ) ) ( not ( = ?auto_404424 ?auto_404432 ) ) ( not ( = ?auto_404424 ?auto_404433 ) ) ( not ( = ?auto_404424 ?auto_404434 ) ) ( not ( = ?auto_404425 ?auto_404426 ) ) ( not ( = ?auto_404425 ?auto_404427 ) ) ( not ( = ?auto_404425 ?auto_404428 ) ) ( not ( = ?auto_404425 ?auto_404429 ) ) ( not ( = ?auto_404425 ?auto_404430 ) ) ( not ( = ?auto_404425 ?auto_404431 ) ) ( not ( = ?auto_404425 ?auto_404432 ) ) ( not ( = ?auto_404425 ?auto_404433 ) ) ( not ( = ?auto_404425 ?auto_404434 ) ) ( not ( = ?auto_404426 ?auto_404427 ) ) ( not ( = ?auto_404426 ?auto_404428 ) ) ( not ( = ?auto_404426 ?auto_404429 ) ) ( not ( = ?auto_404426 ?auto_404430 ) ) ( not ( = ?auto_404426 ?auto_404431 ) ) ( not ( = ?auto_404426 ?auto_404432 ) ) ( not ( = ?auto_404426 ?auto_404433 ) ) ( not ( = ?auto_404426 ?auto_404434 ) ) ( not ( = ?auto_404427 ?auto_404428 ) ) ( not ( = ?auto_404427 ?auto_404429 ) ) ( not ( = ?auto_404427 ?auto_404430 ) ) ( not ( = ?auto_404427 ?auto_404431 ) ) ( not ( = ?auto_404427 ?auto_404432 ) ) ( not ( = ?auto_404427 ?auto_404433 ) ) ( not ( = ?auto_404427 ?auto_404434 ) ) ( not ( = ?auto_404428 ?auto_404429 ) ) ( not ( = ?auto_404428 ?auto_404430 ) ) ( not ( = ?auto_404428 ?auto_404431 ) ) ( not ( = ?auto_404428 ?auto_404432 ) ) ( not ( = ?auto_404428 ?auto_404433 ) ) ( not ( = ?auto_404428 ?auto_404434 ) ) ( not ( = ?auto_404429 ?auto_404430 ) ) ( not ( = ?auto_404429 ?auto_404431 ) ) ( not ( = ?auto_404429 ?auto_404432 ) ) ( not ( = ?auto_404429 ?auto_404433 ) ) ( not ( = ?auto_404429 ?auto_404434 ) ) ( not ( = ?auto_404430 ?auto_404431 ) ) ( not ( = ?auto_404430 ?auto_404432 ) ) ( not ( = ?auto_404430 ?auto_404433 ) ) ( not ( = ?auto_404430 ?auto_404434 ) ) ( not ( = ?auto_404431 ?auto_404432 ) ) ( not ( = ?auto_404431 ?auto_404433 ) ) ( not ( = ?auto_404431 ?auto_404434 ) ) ( not ( = ?auto_404432 ?auto_404433 ) ) ( not ( = ?auto_404432 ?auto_404434 ) ) ( not ( = ?auto_404433 ?auto_404434 ) ) ( ON ?auto_404432 ?auto_404433 ) ( ON ?auto_404431 ?auto_404432 ) ( ON ?auto_404430 ?auto_404431 ) ( ON ?auto_404429 ?auto_404430 ) ( ON ?auto_404428 ?auto_404429 ) ( ON ?auto_404427 ?auto_404428 ) ( ON ?auto_404426 ?auto_404427 ) ( ON ?auto_404425 ?auto_404426 ) ( CLEAR ?auto_404423 ) ( ON ?auto_404424 ?auto_404425 ) ( CLEAR ?auto_404424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_404423 ?auto_404424 )
      ( MAKE-11PILE ?auto_404423 ?auto_404424 ?auto_404425 ?auto_404426 ?auto_404427 ?auto_404428 ?auto_404429 ?auto_404430 ?auto_404431 ?auto_404432 ?auto_404433 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_404469 - BLOCK
      ?auto_404470 - BLOCK
      ?auto_404471 - BLOCK
      ?auto_404472 - BLOCK
      ?auto_404473 - BLOCK
      ?auto_404474 - BLOCK
      ?auto_404475 - BLOCK
      ?auto_404476 - BLOCK
      ?auto_404477 - BLOCK
      ?auto_404478 - BLOCK
      ?auto_404479 - BLOCK
    )
    :vars
    (
      ?auto_404480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_404479 ?auto_404480 ) ( not ( = ?auto_404469 ?auto_404470 ) ) ( not ( = ?auto_404469 ?auto_404471 ) ) ( not ( = ?auto_404469 ?auto_404472 ) ) ( not ( = ?auto_404469 ?auto_404473 ) ) ( not ( = ?auto_404469 ?auto_404474 ) ) ( not ( = ?auto_404469 ?auto_404475 ) ) ( not ( = ?auto_404469 ?auto_404476 ) ) ( not ( = ?auto_404469 ?auto_404477 ) ) ( not ( = ?auto_404469 ?auto_404478 ) ) ( not ( = ?auto_404469 ?auto_404479 ) ) ( not ( = ?auto_404469 ?auto_404480 ) ) ( not ( = ?auto_404470 ?auto_404471 ) ) ( not ( = ?auto_404470 ?auto_404472 ) ) ( not ( = ?auto_404470 ?auto_404473 ) ) ( not ( = ?auto_404470 ?auto_404474 ) ) ( not ( = ?auto_404470 ?auto_404475 ) ) ( not ( = ?auto_404470 ?auto_404476 ) ) ( not ( = ?auto_404470 ?auto_404477 ) ) ( not ( = ?auto_404470 ?auto_404478 ) ) ( not ( = ?auto_404470 ?auto_404479 ) ) ( not ( = ?auto_404470 ?auto_404480 ) ) ( not ( = ?auto_404471 ?auto_404472 ) ) ( not ( = ?auto_404471 ?auto_404473 ) ) ( not ( = ?auto_404471 ?auto_404474 ) ) ( not ( = ?auto_404471 ?auto_404475 ) ) ( not ( = ?auto_404471 ?auto_404476 ) ) ( not ( = ?auto_404471 ?auto_404477 ) ) ( not ( = ?auto_404471 ?auto_404478 ) ) ( not ( = ?auto_404471 ?auto_404479 ) ) ( not ( = ?auto_404471 ?auto_404480 ) ) ( not ( = ?auto_404472 ?auto_404473 ) ) ( not ( = ?auto_404472 ?auto_404474 ) ) ( not ( = ?auto_404472 ?auto_404475 ) ) ( not ( = ?auto_404472 ?auto_404476 ) ) ( not ( = ?auto_404472 ?auto_404477 ) ) ( not ( = ?auto_404472 ?auto_404478 ) ) ( not ( = ?auto_404472 ?auto_404479 ) ) ( not ( = ?auto_404472 ?auto_404480 ) ) ( not ( = ?auto_404473 ?auto_404474 ) ) ( not ( = ?auto_404473 ?auto_404475 ) ) ( not ( = ?auto_404473 ?auto_404476 ) ) ( not ( = ?auto_404473 ?auto_404477 ) ) ( not ( = ?auto_404473 ?auto_404478 ) ) ( not ( = ?auto_404473 ?auto_404479 ) ) ( not ( = ?auto_404473 ?auto_404480 ) ) ( not ( = ?auto_404474 ?auto_404475 ) ) ( not ( = ?auto_404474 ?auto_404476 ) ) ( not ( = ?auto_404474 ?auto_404477 ) ) ( not ( = ?auto_404474 ?auto_404478 ) ) ( not ( = ?auto_404474 ?auto_404479 ) ) ( not ( = ?auto_404474 ?auto_404480 ) ) ( not ( = ?auto_404475 ?auto_404476 ) ) ( not ( = ?auto_404475 ?auto_404477 ) ) ( not ( = ?auto_404475 ?auto_404478 ) ) ( not ( = ?auto_404475 ?auto_404479 ) ) ( not ( = ?auto_404475 ?auto_404480 ) ) ( not ( = ?auto_404476 ?auto_404477 ) ) ( not ( = ?auto_404476 ?auto_404478 ) ) ( not ( = ?auto_404476 ?auto_404479 ) ) ( not ( = ?auto_404476 ?auto_404480 ) ) ( not ( = ?auto_404477 ?auto_404478 ) ) ( not ( = ?auto_404477 ?auto_404479 ) ) ( not ( = ?auto_404477 ?auto_404480 ) ) ( not ( = ?auto_404478 ?auto_404479 ) ) ( not ( = ?auto_404478 ?auto_404480 ) ) ( not ( = ?auto_404479 ?auto_404480 ) ) ( ON ?auto_404478 ?auto_404479 ) ( ON ?auto_404477 ?auto_404478 ) ( ON ?auto_404476 ?auto_404477 ) ( ON ?auto_404475 ?auto_404476 ) ( ON ?auto_404474 ?auto_404475 ) ( ON ?auto_404473 ?auto_404474 ) ( ON ?auto_404472 ?auto_404473 ) ( ON ?auto_404471 ?auto_404472 ) ( ON ?auto_404470 ?auto_404471 ) ( ON ?auto_404469 ?auto_404470 ) ( CLEAR ?auto_404469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_404469 )
      ( MAKE-11PILE ?auto_404469 ?auto_404470 ?auto_404471 ?auto_404472 ?auto_404473 ?auto_404474 ?auto_404475 ?auto_404476 ?auto_404477 ?auto_404478 ?auto_404479 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_404516 - BLOCK
      ?auto_404517 - BLOCK
      ?auto_404518 - BLOCK
      ?auto_404519 - BLOCK
      ?auto_404520 - BLOCK
      ?auto_404521 - BLOCK
      ?auto_404522 - BLOCK
      ?auto_404523 - BLOCK
      ?auto_404524 - BLOCK
      ?auto_404525 - BLOCK
      ?auto_404526 - BLOCK
      ?auto_404527 - BLOCK
    )
    :vars
    (
      ?auto_404528 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_404526 ) ( ON ?auto_404527 ?auto_404528 ) ( CLEAR ?auto_404527 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_404516 ) ( ON ?auto_404517 ?auto_404516 ) ( ON ?auto_404518 ?auto_404517 ) ( ON ?auto_404519 ?auto_404518 ) ( ON ?auto_404520 ?auto_404519 ) ( ON ?auto_404521 ?auto_404520 ) ( ON ?auto_404522 ?auto_404521 ) ( ON ?auto_404523 ?auto_404522 ) ( ON ?auto_404524 ?auto_404523 ) ( ON ?auto_404525 ?auto_404524 ) ( ON ?auto_404526 ?auto_404525 ) ( not ( = ?auto_404516 ?auto_404517 ) ) ( not ( = ?auto_404516 ?auto_404518 ) ) ( not ( = ?auto_404516 ?auto_404519 ) ) ( not ( = ?auto_404516 ?auto_404520 ) ) ( not ( = ?auto_404516 ?auto_404521 ) ) ( not ( = ?auto_404516 ?auto_404522 ) ) ( not ( = ?auto_404516 ?auto_404523 ) ) ( not ( = ?auto_404516 ?auto_404524 ) ) ( not ( = ?auto_404516 ?auto_404525 ) ) ( not ( = ?auto_404516 ?auto_404526 ) ) ( not ( = ?auto_404516 ?auto_404527 ) ) ( not ( = ?auto_404516 ?auto_404528 ) ) ( not ( = ?auto_404517 ?auto_404518 ) ) ( not ( = ?auto_404517 ?auto_404519 ) ) ( not ( = ?auto_404517 ?auto_404520 ) ) ( not ( = ?auto_404517 ?auto_404521 ) ) ( not ( = ?auto_404517 ?auto_404522 ) ) ( not ( = ?auto_404517 ?auto_404523 ) ) ( not ( = ?auto_404517 ?auto_404524 ) ) ( not ( = ?auto_404517 ?auto_404525 ) ) ( not ( = ?auto_404517 ?auto_404526 ) ) ( not ( = ?auto_404517 ?auto_404527 ) ) ( not ( = ?auto_404517 ?auto_404528 ) ) ( not ( = ?auto_404518 ?auto_404519 ) ) ( not ( = ?auto_404518 ?auto_404520 ) ) ( not ( = ?auto_404518 ?auto_404521 ) ) ( not ( = ?auto_404518 ?auto_404522 ) ) ( not ( = ?auto_404518 ?auto_404523 ) ) ( not ( = ?auto_404518 ?auto_404524 ) ) ( not ( = ?auto_404518 ?auto_404525 ) ) ( not ( = ?auto_404518 ?auto_404526 ) ) ( not ( = ?auto_404518 ?auto_404527 ) ) ( not ( = ?auto_404518 ?auto_404528 ) ) ( not ( = ?auto_404519 ?auto_404520 ) ) ( not ( = ?auto_404519 ?auto_404521 ) ) ( not ( = ?auto_404519 ?auto_404522 ) ) ( not ( = ?auto_404519 ?auto_404523 ) ) ( not ( = ?auto_404519 ?auto_404524 ) ) ( not ( = ?auto_404519 ?auto_404525 ) ) ( not ( = ?auto_404519 ?auto_404526 ) ) ( not ( = ?auto_404519 ?auto_404527 ) ) ( not ( = ?auto_404519 ?auto_404528 ) ) ( not ( = ?auto_404520 ?auto_404521 ) ) ( not ( = ?auto_404520 ?auto_404522 ) ) ( not ( = ?auto_404520 ?auto_404523 ) ) ( not ( = ?auto_404520 ?auto_404524 ) ) ( not ( = ?auto_404520 ?auto_404525 ) ) ( not ( = ?auto_404520 ?auto_404526 ) ) ( not ( = ?auto_404520 ?auto_404527 ) ) ( not ( = ?auto_404520 ?auto_404528 ) ) ( not ( = ?auto_404521 ?auto_404522 ) ) ( not ( = ?auto_404521 ?auto_404523 ) ) ( not ( = ?auto_404521 ?auto_404524 ) ) ( not ( = ?auto_404521 ?auto_404525 ) ) ( not ( = ?auto_404521 ?auto_404526 ) ) ( not ( = ?auto_404521 ?auto_404527 ) ) ( not ( = ?auto_404521 ?auto_404528 ) ) ( not ( = ?auto_404522 ?auto_404523 ) ) ( not ( = ?auto_404522 ?auto_404524 ) ) ( not ( = ?auto_404522 ?auto_404525 ) ) ( not ( = ?auto_404522 ?auto_404526 ) ) ( not ( = ?auto_404522 ?auto_404527 ) ) ( not ( = ?auto_404522 ?auto_404528 ) ) ( not ( = ?auto_404523 ?auto_404524 ) ) ( not ( = ?auto_404523 ?auto_404525 ) ) ( not ( = ?auto_404523 ?auto_404526 ) ) ( not ( = ?auto_404523 ?auto_404527 ) ) ( not ( = ?auto_404523 ?auto_404528 ) ) ( not ( = ?auto_404524 ?auto_404525 ) ) ( not ( = ?auto_404524 ?auto_404526 ) ) ( not ( = ?auto_404524 ?auto_404527 ) ) ( not ( = ?auto_404524 ?auto_404528 ) ) ( not ( = ?auto_404525 ?auto_404526 ) ) ( not ( = ?auto_404525 ?auto_404527 ) ) ( not ( = ?auto_404525 ?auto_404528 ) ) ( not ( = ?auto_404526 ?auto_404527 ) ) ( not ( = ?auto_404526 ?auto_404528 ) ) ( not ( = ?auto_404527 ?auto_404528 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_404527 ?auto_404528 )
      ( !STACK ?auto_404527 ?auto_404526 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_404566 - BLOCK
      ?auto_404567 - BLOCK
      ?auto_404568 - BLOCK
      ?auto_404569 - BLOCK
      ?auto_404570 - BLOCK
      ?auto_404571 - BLOCK
      ?auto_404572 - BLOCK
      ?auto_404573 - BLOCK
      ?auto_404574 - BLOCK
      ?auto_404575 - BLOCK
      ?auto_404576 - BLOCK
      ?auto_404577 - BLOCK
    )
    :vars
    (
      ?auto_404578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_404577 ?auto_404578 ) ( ON-TABLE ?auto_404566 ) ( ON ?auto_404567 ?auto_404566 ) ( ON ?auto_404568 ?auto_404567 ) ( ON ?auto_404569 ?auto_404568 ) ( ON ?auto_404570 ?auto_404569 ) ( ON ?auto_404571 ?auto_404570 ) ( ON ?auto_404572 ?auto_404571 ) ( ON ?auto_404573 ?auto_404572 ) ( ON ?auto_404574 ?auto_404573 ) ( ON ?auto_404575 ?auto_404574 ) ( not ( = ?auto_404566 ?auto_404567 ) ) ( not ( = ?auto_404566 ?auto_404568 ) ) ( not ( = ?auto_404566 ?auto_404569 ) ) ( not ( = ?auto_404566 ?auto_404570 ) ) ( not ( = ?auto_404566 ?auto_404571 ) ) ( not ( = ?auto_404566 ?auto_404572 ) ) ( not ( = ?auto_404566 ?auto_404573 ) ) ( not ( = ?auto_404566 ?auto_404574 ) ) ( not ( = ?auto_404566 ?auto_404575 ) ) ( not ( = ?auto_404566 ?auto_404576 ) ) ( not ( = ?auto_404566 ?auto_404577 ) ) ( not ( = ?auto_404566 ?auto_404578 ) ) ( not ( = ?auto_404567 ?auto_404568 ) ) ( not ( = ?auto_404567 ?auto_404569 ) ) ( not ( = ?auto_404567 ?auto_404570 ) ) ( not ( = ?auto_404567 ?auto_404571 ) ) ( not ( = ?auto_404567 ?auto_404572 ) ) ( not ( = ?auto_404567 ?auto_404573 ) ) ( not ( = ?auto_404567 ?auto_404574 ) ) ( not ( = ?auto_404567 ?auto_404575 ) ) ( not ( = ?auto_404567 ?auto_404576 ) ) ( not ( = ?auto_404567 ?auto_404577 ) ) ( not ( = ?auto_404567 ?auto_404578 ) ) ( not ( = ?auto_404568 ?auto_404569 ) ) ( not ( = ?auto_404568 ?auto_404570 ) ) ( not ( = ?auto_404568 ?auto_404571 ) ) ( not ( = ?auto_404568 ?auto_404572 ) ) ( not ( = ?auto_404568 ?auto_404573 ) ) ( not ( = ?auto_404568 ?auto_404574 ) ) ( not ( = ?auto_404568 ?auto_404575 ) ) ( not ( = ?auto_404568 ?auto_404576 ) ) ( not ( = ?auto_404568 ?auto_404577 ) ) ( not ( = ?auto_404568 ?auto_404578 ) ) ( not ( = ?auto_404569 ?auto_404570 ) ) ( not ( = ?auto_404569 ?auto_404571 ) ) ( not ( = ?auto_404569 ?auto_404572 ) ) ( not ( = ?auto_404569 ?auto_404573 ) ) ( not ( = ?auto_404569 ?auto_404574 ) ) ( not ( = ?auto_404569 ?auto_404575 ) ) ( not ( = ?auto_404569 ?auto_404576 ) ) ( not ( = ?auto_404569 ?auto_404577 ) ) ( not ( = ?auto_404569 ?auto_404578 ) ) ( not ( = ?auto_404570 ?auto_404571 ) ) ( not ( = ?auto_404570 ?auto_404572 ) ) ( not ( = ?auto_404570 ?auto_404573 ) ) ( not ( = ?auto_404570 ?auto_404574 ) ) ( not ( = ?auto_404570 ?auto_404575 ) ) ( not ( = ?auto_404570 ?auto_404576 ) ) ( not ( = ?auto_404570 ?auto_404577 ) ) ( not ( = ?auto_404570 ?auto_404578 ) ) ( not ( = ?auto_404571 ?auto_404572 ) ) ( not ( = ?auto_404571 ?auto_404573 ) ) ( not ( = ?auto_404571 ?auto_404574 ) ) ( not ( = ?auto_404571 ?auto_404575 ) ) ( not ( = ?auto_404571 ?auto_404576 ) ) ( not ( = ?auto_404571 ?auto_404577 ) ) ( not ( = ?auto_404571 ?auto_404578 ) ) ( not ( = ?auto_404572 ?auto_404573 ) ) ( not ( = ?auto_404572 ?auto_404574 ) ) ( not ( = ?auto_404572 ?auto_404575 ) ) ( not ( = ?auto_404572 ?auto_404576 ) ) ( not ( = ?auto_404572 ?auto_404577 ) ) ( not ( = ?auto_404572 ?auto_404578 ) ) ( not ( = ?auto_404573 ?auto_404574 ) ) ( not ( = ?auto_404573 ?auto_404575 ) ) ( not ( = ?auto_404573 ?auto_404576 ) ) ( not ( = ?auto_404573 ?auto_404577 ) ) ( not ( = ?auto_404573 ?auto_404578 ) ) ( not ( = ?auto_404574 ?auto_404575 ) ) ( not ( = ?auto_404574 ?auto_404576 ) ) ( not ( = ?auto_404574 ?auto_404577 ) ) ( not ( = ?auto_404574 ?auto_404578 ) ) ( not ( = ?auto_404575 ?auto_404576 ) ) ( not ( = ?auto_404575 ?auto_404577 ) ) ( not ( = ?auto_404575 ?auto_404578 ) ) ( not ( = ?auto_404576 ?auto_404577 ) ) ( not ( = ?auto_404576 ?auto_404578 ) ) ( not ( = ?auto_404577 ?auto_404578 ) ) ( CLEAR ?auto_404575 ) ( ON ?auto_404576 ?auto_404577 ) ( CLEAR ?auto_404576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_404566 ?auto_404567 ?auto_404568 ?auto_404569 ?auto_404570 ?auto_404571 ?auto_404572 ?auto_404573 ?auto_404574 ?auto_404575 ?auto_404576 )
      ( MAKE-12PILE ?auto_404566 ?auto_404567 ?auto_404568 ?auto_404569 ?auto_404570 ?auto_404571 ?auto_404572 ?auto_404573 ?auto_404574 ?auto_404575 ?auto_404576 ?auto_404577 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_404616 - BLOCK
      ?auto_404617 - BLOCK
      ?auto_404618 - BLOCK
      ?auto_404619 - BLOCK
      ?auto_404620 - BLOCK
      ?auto_404621 - BLOCK
      ?auto_404622 - BLOCK
      ?auto_404623 - BLOCK
      ?auto_404624 - BLOCK
      ?auto_404625 - BLOCK
      ?auto_404626 - BLOCK
      ?auto_404627 - BLOCK
    )
    :vars
    (
      ?auto_404628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_404627 ?auto_404628 ) ( ON-TABLE ?auto_404616 ) ( ON ?auto_404617 ?auto_404616 ) ( ON ?auto_404618 ?auto_404617 ) ( ON ?auto_404619 ?auto_404618 ) ( ON ?auto_404620 ?auto_404619 ) ( ON ?auto_404621 ?auto_404620 ) ( ON ?auto_404622 ?auto_404621 ) ( ON ?auto_404623 ?auto_404622 ) ( ON ?auto_404624 ?auto_404623 ) ( not ( = ?auto_404616 ?auto_404617 ) ) ( not ( = ?auto_404616 ?auto_404618 ) ) ( not ( = ?auto_404616 ?auto_404619 ) ) ( not ( = ?auto_404616 ?auto_404620 ) ) ( not ( = ?auto_404616 ?auto_404621 ) ) ( not ( = ?auto_404616 ?auto_404622 ) ) ( not ( = ?auto_404616 ?auto_404623 ) ) ( not ( = ?auto_404616 ?auto_404624 ) ) ( not ( = ?auto_404616 ?auto_404625 ) ) ( not ( = ?auto_404616 ?auto_404626 ) ) ( not ( = ?auto_404616 ?auto_404627 ) ) ( not ( = ?auto_404616 ?auto_404628 ) ) ( not ( = ?auto_404617 ?auto_404618 ) ) ( not ( = ?auto_404617 ?auto_404619 ) ) ( not ( = ?auto_404617 ?auto_404620 ) ) ( not ( = ?auto_404617 ?auto_404621 ) ) ( not ( = ?auto_404617 ?auto_404622 ) ) ( not ( = ?auto_404617 ?auto_404623 ) ) ( not ( = ?auto_404617 ?auto_404624 ) ) ( not ( = ?auto_404617 ?auto_404625 ) ) ( not ( = ?auto_404617 ?auto_404626 ) ) ( not ( = ?auto_404617 ?auto_404627 ) ) ( not ( = ?auto_404617 ?auto_404628 ) ) ( not ( = ?auto_404618 ?auto_404619 ) ) ( not ( = ?auto_404618 ?auto_404620 ) ) ( not ( = ?auto_404618 ?auto_404621 ) ) ( not ( = ?auto_404618 ?auto_404622 ) ) ( not ( = ?auto_404618 ?auto_404623 ) ) ( not ( = ?auto_404618 ?auto_404624 ) ) ( not ( = ?auto_404618 ?auto_404625 ) ) ( not ( = ?auto_404618 ?auto_404626 ) ) ( not ( = ?auto_404618 ?auto_404627 ) ) ( not ( = ?auto_404618 ?auto_404628 ) ) ( not ( = ?auto_404619 ?auto_404620 ) ) ( not ( = ?auto_404619 ?auto_404621 ) ) ( not ( = ?auto_404619 ?auto_404622 ) ) ( not ( = ?auto_404619 ?auto_404623 ) ) ( not ( = ?auto_404619 ?auto_404624 ) ) ( not ( = ?auto_404619 ?auto_404625 ) ) ( not ( = ?auto_404619 ?auto_404626 ) ) ( not ( = ?auto_404619 ?auto_404627 ) ) ( not ( = ?auto_404619 ?auto_404628 ) ) ( not ( = ?auto_404620 ?auto_404621 ) ) ( not ( = ?auto_404620 ?auto_404622 ) ) ( not ( = ?auto_404620 ?auto_404623 ) ) ( not ( = ?auto_404620 ?auto_404624 ) ) ( not ( = ?auto_404620 ?auto_404625 ) ) ( not ( = ?auto_404620 ?auto_404626 ) ) ( not ( = ?auto_404620 ?auto_404627 ) ) ( not ( = ?auto_404620 ?auto_404628 ) ) ( not ( = ?auto_404621 ?auto_404622 ) ) ( not ( = ?auto_404621 ?auto_404623 ) ) ( not ( = ?auto_404621 ?auto_404624 ) ) ( not ( = ?auto_404621 ?auto_404625 ) ) ( not ( = ?auto_404621 ?auto_404626 ) ) ( not ( = ?auto_404621 ?auto_404627 ) ) ( not ( = ?auto_404621 ?auto_404628 ) ) ( not ( = ?auto_404622 ?auto_404623 ) ) ( not ( = ?auto_404622 ?auto_404624 ) ) ( not ( = ?auto_404622 ?auto_404625 ) ) ( not ( = ?auto_404622 ?auto_404626 ) ) ( not ( = ?auto_404622 ?auto_404627 ) ) ( not ( = ?auto_404622 ?auto_404628 ) ) ( not ( = ?auto_404623 ?auto_404624 ) ) ( not ( = ?auto_404623 ?auto_404625 ) ) ( not ( = ?auto_404623 ?auto_404626 ) ) ( not ( = ?auto_404623 ?auto_404627 ) ) ( not ( = ?auto_404623 ?auto_404628 ) ) ( not ( = ?auto_404624 ?auto_404625 ) ) ( not ( = ?auto_404624 ?auto_404626 ) ) ( not ( = ?auto_404624 ?auto_404627 ) ) ( not ( = ?auto_404624 ?auto_404628 ) ) ( not ( = ?auto_404625 ?auto_404626 ) ) ( not ( = ?auto_404625 ?auto_404627 ) ) ( not ( = ?auto_404625 ?auto_404628 ) ) ( not ( = ?auto_404626 ?auto_404627 ) ) ( not ( = ?auto_404626 ?auto_404628 ) ) ( not ( = ?auto_404627 ?auto_404628 ) ) ( ON ?auto_404626 ?auto_404627 ) ( CLEAR ?auto_404624 ) ( ON ?auto_404625 ?auto_404626 ) ( CLEAR ?auto_404625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_404616 ?auto_404617 ?auto_404618 ?auto_404619 ?auto_404620 ?auto_404621 ?auto_404622 ?auto_404623 ?auto_404624 ?auto_404625 )
      ( MAKE-12PILE ?auto_404616 ?auto_404617 ?auto_404618 ?auto_404619 ?auto_404620 ?auto_404621 ?auto_404622 ?auto_404623 ?auto_404624 ?auto_404625 ?auto_404626 ?auto_404627 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_404666 - BLOCK
      ?auto_404667 - BLOCK
      ?auto_404668 - BLOCK
      ?auto_404669 - BLOCK
      ?auto_404670 - BLOCK
      ?auto_404671 - BLOCK
      ?auto_404672 - BLOCK
      ?auto_404673 - BLOCK
      ?auto_404674 - BLOCK
      ?auto_404675 - BLOCK
      ?auto_404676 - BLOCK
      ?auto_404677 - BLOCK
    )
    :vars
    (
      ?auto_404678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_404677 ?auto_404678 ) ( ON-TABLE ?auto_404666 ) ( ON ?auto_404667 ?auto_404666 ) ( ON ?auto_404668 ?auto_404667 ) ( ON ?auto_404669 ?auto_404668 ) ( ON ?auto_404670 ?auto_404669 ) ( ON ?auto_404671 ?auto_404670 ) ( ON ?auto_404672 ?auto_404671 ) ( ON ?auto_404673 ?auto_404672 ) ( not ( = ?auto_404666 ?auto_404667 ) ) ( not ( = ?auto_404666 ?auto_404668 ) ) ( not ( = ?auto_404666 ?auto_404669 ) ) ( not ( = ?auto_404666 ?auto_404670 ) ) ( not ( = ?auto_404666 ?auto_404671 ) ) ( not ( = ?auto_404666 ?auto_404672 ) ) ( not ( = ?auto_404666 ?auto_404673 ) ) ( not ( = ?auto_404666 ?auto_404674 ) ) ( not ( = ?auto_404666 ?auto_404675 ) ) ( not ( = ?auto_404666 ?auto_404676 ) ) ( not ( = ?auto_404666 ?auto_404677 ) ) ( not ( = ?auto_404666 ?auto_404678 ) ) ( not ( = ?auto_404667 ?auto_404668 ) ) ( not ( = ?auto_404667 ?auto_404669 ) ) ( not ( = ?auto_404667 ?auto_404670 ) ) ( not ( = ?auto_404667 ?auto_404671 ) ) ( not ( = ?auto_404667 ?auto_404672 ) ) ( not ( = ?auto_404667 ?auto_404673 ) ) ( not ( = ?auto_404667 ?auto_404674 ) ) ( not ( = ?auto_404667 ?auto_404675 ) ) ( not ( = ?auto_404667 ?auto_404676 ) ) ( not ( = ?auto_404667 ?auto_404677 ) ) ( not ( = ?auto_404667 ?auto_404678 ) ) ( not ( = ?auto_404668 ?auto_404669 ) ) ( not ( = ?auto_404668 ?auto_404670 ) ) ( not ( = ?auto_404668 ?auto_404671 ) ) ( not ( = ?auto_404668 ?auto_404672 ) ) ( not ( = ?auto_404668 ?auto_404673 ) ) ( not ( = ?auto_404668 ?auto_404674 ) ) ( not ( = ?auto_404668 ?auto_404675 ) ) ( not ( = ?auto_404668 ?auto_404676 ) ) ( not ( = ?auto_404668 ?auto_404677 ) ) ( not ( = ?auto_404668 ?auto_404678 ) ) ( not ( = ?auto_404669 ?auto_404670 ) ) ( not ( = ?auto_404669 ?auto_404671 ) ) ( not ( = ?auto_404669 ?auto_404672 ) ) ( not ( = ?auto_404669 ?auto_404673 ) ) ( not ( = ?auto_404669 ?auto_404674 ) ) ( not ( = ?auto_404669 ?auto_404675 ) ) ( not ( = ?auto_404669 ?auto_404676 ) ) ( not ( = ?auto_404669 ?auto_404677 ) ) ( not ( = ?auto_404669 ?auto_404678 ) ) ( not ( = ?auto_404670 ?auto_404671 ) ) ( not ( = ?auto_404670 ?auto_404672 ) ) ( not ( = ?auto_404670 ?auto_404673 ) ) ( not ( = ?auto_404670 ?auto_404674 ) ) ( not ( = ?auto_404670 ?auto_404675 ) ) ( not ( = ?auto_404670 ?auto_404676 ) ) ( not ( = ?auto_404670 ?auto_404677 ) ) ( not ( = ?auto_404670 ?auto_404678 ) ) ( not ( = ?auto_404671 ?auto_404672 ) ) ( not ( = ?auto_404671 ?auto_404673 ) ) ( not ( = ?auto_404671 ?auto_404674 ) ) ( not ( = ?auto_404671 ?auto_404675 ) ) ( not ( = ?auto_404671 ?auto_404676 ) ) ( not ( = ?auto_404671 ?auto_404677 ) ) ( not ( = ?auto_404671 ?auto_404678 ) ) ( not ( = ?auto_404672 ?auto_404673 ) ) ( not ( = ?auto_404672 ?auto_404674 ) ) ( not ( = ?auto_404672 ?auto_404675 ) ) ( not ( = ?auto_404672 ?auto_404676 ) ) ( not ( = ?auto_404672 ?auto_404677 ) ) ( not ( = ?auto_404672 ?auto_404678 ) ) ( not ( = ?auto_404673 ?auto_404674 ) ) ( not ( = ?auto_404673 ?auto_404675 ) ) ( not ( = ?auto_404673 ?auto_404676 ) ) ( not ( = ?auto_404673 ?auto_404677 ) ) ( not ( = ?auto_404673 ?auto_404678 ) ) ( not ( = ?auto_404674 ?auto_404675 ) ) ( not ( = ?auto_404674 ?auto_404676 ) ) ( not ( = ?auto_404674 ?auto_404677 ) ) ( not ( = ?auto_404674 ?auto_404678 ) ) ( not ( = ?auto_404675 ?auto_404676 ) ) ( not ( = ?auto_404675 ?auto_404677 ) ) ( not ( = ?auto_404675 ?auto_404678 ) ) ( not ( = ?auto_404676 ?auto_404677 ) ) ( not ( = ?auto_404676 ?auto_404678 ) ) ( not ( = ?auto_404677 ?auto_404678 ) ) ( ON ?auto_404676 ?auto_404677 ) ( ON ?auto_404675 ?auto_404676 ) ( CLEAR ?auto_404673 ) ( ON ?auto_404674 ?auto_404675 ) ( CLEAR ?auto_404674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_404666 ?auto_404667 ?auto_404668 ?auto_404669 ?auto_404670 ?auto_404671 ?auto_404672 ?auto_404673 ?auto_404674 )
      ( MAKE-12PILE ?auto_404666 ?auto_404667 ?auto_404668 ?auto_404669 ?auto_404670 ?auto_404671 ?auto_404672 ?auto_404673 ?auto_404674 ?auto_404675 ?auto_404676 ?auto_404677 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_404716 - BLOCK
      ?auto_404717 - BLOCK
      ?auto_404718 - BLOCK
      ?auto_404719 - BLOCK
      ?auto_404720 - BLOCK
      ?auto_404721 - BLOCK
      ?auto_404722 - BLOCK
      ?auto_404723 - BLOCK
      ?auto_404724 - BLOCK
      ?auto_404725 - BLOCK
      ?auto_404726 - BLOCK
      ?auto_404727 - BLOCK
    )
    :vars
    (
      ?auto_404728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_404727 ?auto_404728 ) ( ON-TABLE ?auto_404716 ) ( ON ?auto_404717 ?auto_404716 ) ( ON ?auto_404718 ?auto_404717 ) ( ON ?auto_404719 ?auto_404718 ) ( ON ?auto_404720 ?auto_404719 ) ( ON ?auto_404721 ?auto_404720 ) ( ON ?auto_404722 ?auto_404721 ) ( not ( = ?auto_404716 ?auto_404717 ) ) ( not ( = ?auto_404716 ?auto_404718 ) ) ( not ( = ?auto_404716 ?auto_404719 ) ) ( not ( = ?auto_404716 ?auto_404720 ) ) ( not ( = ?auto_404716 ?auto_404721 ) ) ( not ( = ?auto_404716 ?auto_404722 ) ) ( not ( = ?auto_404716 ?auto_404723 ) ) ( not ( = ?auto_404716 ?auto_404724 ) ) ( not ( = ?auto_404716 ?auto_404725 ) ) ( not ( = ?auto_404716 ?auto_404726 ) ) ( not ( = ?auto_404716 ?auto_404727 ) ) ( not ( = ?auto_404716 ?auto_404728 ) ) ( not ( = ?auto_404717 ?auto_404718 ) ) ( not ( = ?auto_404717 ?auto_404719 ) ) ( not ( = ?auto_404717 ?auto_404720 ) ) ( not ( = ?auto_404717 ?auto_404721 ) ) ( not ( = ?auto_404717 ?auto_404722 ) ) ( not ( = ?auto_404717 ?auto_404723 ) ) ( not ( = ?auto_404717 ?auto_404724 ) ) ( not ( = ?auto_404717 ?auto_404725 ) ) ( not ( = ?auto_404717 ?auto_404726 ) ) ( not ( = ?auto_404717 ?auto_404727 ) ) ( not ( = ?auto_404717 ?auto_404728 ) ) ( not ( = ?auto_404718 ?auto_404719 ) ) ( not ( = ?auto_404718 ?auto_404720 ) ) ( not ( = ?auto_404718 ?auto_404721 ) ) ( not ( = ?auto_404718 ?auto_404722 ) ) ( not ( = ?auto_404718 ?auto_404723 ) ) ( not ( = ?auto_404718 ?auto_404724 ) ) ( not ( = ?auto_404718 ?auto_404725 ) ) ( not ( = ?auto_404718 ?auto_404726 ) ) ( not ( = ?auto_404718 ?auto_404727 ) ) ( not ( = ?auto_404718 ?auto_404728 ) ) ( not ( = ?auto_404719 ?auto_404720 ) ) ( not ( = ?auto_404719 ?auto_404721 ) ) ( not ( = ?auto_404719 ?auto_404722 ) ) ( not ( = ?auto_404719 ?auto_404723 ) ) ( not ( = ?auto_404719 ?auto_404724 ) ) ( not ( = ?auto_404719 ?auto_404725 ) ) ( not ( = ?auto_404719 ?auto_404726 ) ) ( not ( = ?auto_404719 ?auto_404727 ) ) ( not ( = ?auto_404719 ?auto_404728 ) ) ( not ( = ?auto_404720 ?auto_404721 ) ) ( not ( = ?auto_404720 ?auto_404722 ) ) ( not ( = ?auto_404720 ?auto_404723 ) ) ( not ( = ?auto_404720 ?auto_404724 ) ) ( not ( = ?auto_404720 ?auto_404725 ) ) ( not ( = ?auto_404720 ?auto_404726 ) ) ( not ( = ?auto_404720 ?auto_404727 ) ) ( not ( = ?auto_404720 ?auto_404728 ) ) ( not ( = ?auto_404721 ?auto_404722 ) ) ( not ( = ?auto_404721 ?auto_404723 ) ) ( not ( = ?auto_404721 ?auto_404724 ) ) ( not ( = ?auto_404721 ?auto_404725 ) ) ( not ( = ?auto_404721 ?auto_404726 ) ) ( not ( = ?auto_404721 ?auto_404727 ) ) ( not ( = ?auto_404721 ?auto_404728 ) ) ( not ( = ?auto_404722 ?auto_404723 ) ) ( not ( = ?auto_404722 ?auto_404724 ) ) ( not ( = ?auto_404722 ?auto_404725 ) ) ( not ( = ?auto_404722 ?auto_404726 ) ) ( not ( = ?auto_404722 ?auto_404727 ) ) ( not ( = ?auto_404722 ?auto_404728 ) ) ( not ( = ?auto_404723 ?auto_404724 ) ) ( not ( = ?auto_404723 ?auto_404725 ) ) ( not ( = ?auto_404723 ?auto_404726 ) ) ( not ( = ?auto_404723 ?auto_404727 ) ) ( not ( = ?auto_404723 ?auto_404728 ) ) ( not ( = ?auto_404724 ?auto_404725 ) ) ( not ( = ?auto_404724 ?auto_404726 ) ) ( not ( = ?auto_404724 ?auto_404727 ) ) ( not ( = ?auto_404724 ?auto_404728 ) ) ( not ( = ?auto_404725 ?auto_404726 ) ) ( not ( = ?auto_404725 ?auto_404727 ) ) ( not ( = ?auto_404725 ?auto_404728 ) ) ( not ( = ?auto_404726 ?auto_404727 ) ) ( not ( = ?auto_404726 ?auto_404728 ) ) ( not ( = ?auto_404727 ?auto_404728 ) ) ( ON ?auto_404726 ?auto_404727 ) ( ON ?auto_404725 ?auto_404726 ) ( ON ?auto_404724 ?auto_404725 ) ( CLEAR ?auto_404722 ) ( ON ?auto_404723 ?auto_404724 ) ( CLEAR ?auto_404723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_404716 ?auto_404717 ?auto_404718 ?auto_404719 ?auto_404720 ?auto_404721 ?auto_404722 ?auto_404723 )
      ( MAKE-12PILE ?auto_404716 ?auto_404717 ?auto_404718 ?auto_404719 ?auto_404720 ?auto_404721 ?auto_404722 ?auto_404723 ?auto_404724 ?auto_404725 ?auto_404726 ?auto_404727 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_404766 - BLOCK
      ?auto_404767 - BLOCK
      ?auto_404768 - BLOCK
      ?auto_404769 - BLOCK
      ?auto_404770 - BLOCK
      ?auto_404771 - BLOCK
      ?auto_404772 - BLOCK
      ?auto_404773 - BLOCK
      ?auto_404774 - BLOCK
      ?auto_404775 - BLOCK
      ?auto_404776 - BLOCK
      ?auto_404777 - BLOCK
    )
    :vars
    (
      ?auto_404778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_404777 ?auto_404778 ) ( ON-TABLE ?auto_404766 ) ( ON ?auto_404767 ?auto_404766 ) ( ON ?auto_404768 ?auto_404767 ) ( ON ?auto_404769 ?auto_404768 ) ( ON ?auto_404770 ?auto_404769 ) ( ON ?auto_404771 ?auto_404770 ) ( not ( = ?auto_404766 ?auto_404767 ) ) ( not ( = ?auto_404766 ?auto_404768 ) ) ( not ( = ?auto_404766 ?auto_404769 ) ) ( not ( = ?auto_404766 ?auto_404770 ) ) ( not ( = ?auto_404766 ?auto_404771 ) ) ( not ( = ?auto_404766 ?auto_404772 ) ) ( not ( = ?auto_404766 ?auto_404773 ) ) ( not ( = ?auto_404766 ?auto_404774 ) ) ( not ( = ?auto_404766 ?auto_404775 ) ) ( not ( = ?auto_404766 ?auto_404776 ) ) ( not ( = ?auto_404766 ?auto_404777 ) ) ( not ( = ?auto_404766 ?auto_404778 ) ) ( not ( = ?auto_404767 ?auto_404768 ) ) ( not ( = ?auto_404767 ?auto_404769 ) ) ( not ( = ?auto_404767 ?auto_404770 ) ) ( not ( = ?auto_404767 ?auto_404771 ) ) ( not ( = ?auto_404767 ?auto_404772 ) ) ( not ( = ?auto_404767 ?auto_404773 ) ) ( not ( = ?auto_404767 ?auto_404774 ) ) ( not ( = ?auto_404767 ?auto_404775 ) ) ( not ( = ?auto_404767 ?auto_404776 ) ) ( not ( = ?auto_404767 ?auto_404777 ) ) ( not ( = ?auto_404767 ?auto_404778 ) ) ( not ( = ?auto_404768 ?auto_404769 ) ) ( not ( = ?auto_404768 ?auto_404770 ) ) ( not ( = ?auto_404768 ?auto_404771 ) ) ( not ( = ?auto_404768 ?auto_404772 ) ) ( not ( = ?auto_404768 ?auto_404773 ) ) ( not ( = ?auto_404768 ?auto_404774 ) ) ( not ( = ?auto_404768 ?auto_404775 ) ) ( not ( = ?auto_404768 ?auto_404776 ) ) ( not ( = ?auto_404768 ?auto_404777 ) ) ( not ( = ?auto_404768 ?auto_404778 ) ) ( not ( = ?auto_404769 ?auto_404770 ) ) ( not ( = ?auto_404769 ?auto_404771 ) ) ( not ( = ?auto_404769 ?auto_404772 ) ) ( not ( = ?auto_404769 ?auto_404773 ) ) ( not ( = ?auto_404769 ?auto_404774 ) ) ( not ( = ?auto_404769 ?auto_404775 ) ) ( not ( = ?auto_404769 ?auto_404776 ) ) ( not ( = ?auto_404769 ?auto_404777 ) ) ( not ( = ?auto_404769 ?auto_404778 ) ) ( not ( = ?auto_404770 ?auto_404771 ) ) ( not ( = ?auto_404770 ?auto_404772 ) ) ( not ( = ?auto_404770 ?auto_404773 ) ) ( not ( = ?auto_404770 ?auto_404774 ) ) ( not ( = ?auto_404770 ?auto_404775 ) ) ( not ( = ?auto_404770 ?auto_404776 ) ) ( not ( = ?auto_404770 ?auto_404777 ) ) ( not ( = ?auto_404770 ?auto_404778 ) ) ( not ( = ?auto_404771 ?auto_404772 ) ) ( not ( = ?auto_404771 ?auto_404773 ) ) ( not ( = ?auto_404771 ?auto_404774 ) ) ( not ( = ?auto_404771 ?auto_404775 ) ) ( not ( = ?auto_404771 ?auto_404776 ) ) ( not ( = ?auto_404771 ?auto_404777 ) ) ( not ( = ?auto_404771 ?auto_404778 ) ) ( not ( = ?auto_404772 ?auto_404773 ) ) ( not ( = ?auto_404772 ?auto_404774 ) ) ( not ( = ?auto_404772 ?auto_404775 ) ) ( not ( = ?auto_404772 ?auto_404776 ) ) ( not ( = ?auto_404772 ?auto_404777 ) ) ( not ( = ?auto_404772 ?auto_404778 ) ) ( not ( = ?auto_404773 ?auto_404774 ) ) ( not ( = ?auto_404773 ?auto_404775 ) ) ( not ( = ?auto_404773 ?auto_404776 ) ) ( not ( = ?auto_404773 ?auto_404777 ) ) ( not ( = ?auto_404773 ?auto_404778 ) ) ( not ( = ?auto_404774 ?auto_404775 ) ) ( not ( = ?auto_404774 ?auto_404776 ) ) ( not ( = ?auto_404774 ?auto_404777 ) ) ( not ( = ?auto_404774 ?auto_404778 ) ) ( not ( = ?auto_404775 ?auto_404776 ) ) ( not ( = ?auto_404775 ?auto_404777 ) ) ( not ( = ?auto_404775 ?auto_404778 ) ) ( not ( = ?auto_404776 ?auto_404777 ) ) ( not ( = ?auto_404776 ?auto_404778 ) ) ( not ( = ?auto_404777 ?auto_404778 ) ) ( ON ?auto_404776 ?auto_404777 ) ( ON ?auto_404775 ?auto_404776 ) ( ON ?auto_404774 ?auto_404775 ) ( ON ?auto_404773 ?auto_404774 ) ( CLEAR ?auto_404771 ) ( ON ?auto_404772 ?auto_404773 ) ( CLEAR ?auto_404772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_404766 ?auto_404767 ?auto_404768 ?auto_404769 ?auto_404770 ?auto_404771 ?auto_404772 )
      ( MAKE-12PILE ?auto_404766 ?auto_404767 ?auto_404768 ?auto_404769 ?auto_404770 ?auto_404771 ?auto_404772 ?auto_404773 ?auto_404774 ?auto_404775 ?auto_404776 ?auto_404777 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_404816 - BLOCK
      ?auto_404817 - BLOCK
      ?auto_404818 - BLOCK
      ?auto_404819 - BLOCK
      ?auto_404820 - BLOCK
      ?auto_404821 - BLOCK
      ?auto_404822 - BLOCK
      ?auto_404823 - BLOCK
      ?auto_404824 - BLOCK
      ?auto_404825 - BLOCK
      ?auto_404826 - BLOCK
      ?auto_404827 - BLOCK
    )
    :vars
    (
      ?auto_404828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_404827 ?auto_404828 ) ( ON-TABLE ?auto_404816 ) ( ON ?auto_404817 ?auto_404816 ) ( ON ?auto_404818 ?auto_404817 ) ( ON ?auto_404819 ?auto_404818 ) ( ON ?auto_404820 ?auto_404819 ) ( not ( = ?auto_404816 ?auto_404817 ) ) ( not ( = ?auto_404816 ?auto_404818 ) ) ( not ( = ?auto_404816 ?auto_404819 ) ) ( not ( = ?auto_404816 ?auto_404820 ) ) ( not ( = ?auto_404816 ?auto_404821 ) ) ( not ( = ?auto_404816 ?auto_404822 ) ) ( not ( = ?auto_404816 ?auto_404823 ) ) ( not ( = ?auto_404816 ?auto_404824 ) ) ( not ( = ?auto_404816 ?auto_404825 ) ) ( not ( = ?auto_404816 ?auto_404826 ) ) ( not ( = ?auto_404816 ?auto_404827 ) ) ( not ( = ?auto_404816 ?auto_404828 ) ) ( not ( = ?auto_404817 ?auto_404818 ) ) ( not ( = ?auto_404817 ?auto_404819 ) ) ( not ( = ?auto_404817 ?auto_404820 ) ) ( not ( = ?auto_404817 ?auto_404821 ) ) ( not ( = ?auto_404817 ?auto_404822 ) ) ( not ( = ?auto_404817 ?auto_404823 ) ) ( not ( = ?auto_404817 ?auto_404824 ) ) ( not ( = ?auto_404817 ?auto_404825 ) ) ( not ( = ?auto_404817 ?auto_404826 ) ) ( not ( = ?auto_404817 ?auto_404827 ) ) ( not ( = ?auto_404817 ?auto_404828 ) ) ( not ( = ?auto_404818 ?auto_404819 ) ) ( not ( = ?auto_404818 ?auto_404820 ) ) ( not ( = ?auto_404818 ?auto_404821 ) ) ( not ( = ?auto_404818 ?auto_404822 ) ) ( not ( = ?auto_404818 ?auto_404823 ) ) ( not ( = ?auto_404818 ?auto_404824 ) ) ( not ( = ?auto_404818 ?auto_404825 ) ) ( not ( = ?auto_404818 ?auto_404826 ) ) ( not ( = ?auto_404818 ?auto_404827 ) ) ( not ( = ?auto_404818 ?auto_404828 ) ) ( not ( = ?auto_404819 ?auto_404820 ) ) ( not ( = ?auto_404819 ?auto_404821 ) ) ( not ( = ?auto_404819 ?auto_404822 ) ) ( not ( = ?auto_404819 ?auto_404823 ) ) ( not ( = ?auto_404819 ?auto_404824 ) ) ( not ( = ?auto_404819 ?auto_404825 ) ) ( not ( = ?auto_404819 ?auto_404826 ) ) ( not ( = ?auto_404819 ?auto_404827 ) ) ( not ( = ?auto_404819 ?auto_404828 ) ) ( not ( = ?auto_404820 ?auto_404821 ) ) ( not ( = ?auto_404820 ?auto_404822 ) ) ( not ( = ?auto_404820 ?auto_404823 ) ) ( not ( = ?auto_404820 ?auto_404824 ) ) ( not ( = ?auto_404820 ?auto_404825 ) ) ( not ( = ?auto_404820 ?auto_404826 ) ) ( not ( = ?auto_404820 ?auto_404827 ) ) ( not ( = ?auto_404820 ?auto_404828 ) ) ( not ( = ?auto_404821 ?auto_404822 ) ) ( not ( = ?auto_404821 ?auto_404823 ) ) ( not ( = ?auto_404821 ?auto_404824 ) ) ( not ( = ?auto_404821 ?auto_404825 ) ) ( not ( = ?auto_404821 ?auto_404826 ) ) ( not ( = ?auto_404821 ?auto_404827 ) ) ( not ( = ?auto_404821 ?auto_404828 ) ) ( not ( = ?auto_404822 ?auto_404823 ) ) ( not ( = ?auto_404822 ?auto_404824 ) ) ( not ( = ?auto_404822 ?auto_404825 ) ) ( not ( = ?auto_404822 ?auto_404826 ) ) ( not ( = ?auto_404822 ?auto_404827 ) ) ( not ( = ?auto_404822 ?auto_404828 ) ) ( not ( = ?auto_404823 ?auto_404824 ) ) ( not ( = ?auto_404823 ?auto_404825 ) ) ( not ( = ?auto_404823 ?auto_404826 ) ) ( not ( = ?auto_404823 ?auto_404827 ) ) ( not ( = ?auto_404823 ?auto_404828 ) ) ( not ( = ?auto_404824 ?auto_404825 ) ) ( not ( = ?auto_404824 ?auto_404826 ) ) ( not ( = ?auto_404824 ?auto_404827 ) ) ( not ( = ?auto_404824 ?auto_404828 ) ) ( not ( = ?auto_404825 ?auto_404826 ) ) ( not ( = ?auto_404825 ?auto_404827 ) ) ( not ( = ?auto_404825 ?auto_404828 ) ) ( not ( = ?auto_404826 ?auto_404827 ) ) ( not ( = ?auto_404826 ?auto_404828 ) ) ( not ( = ?auto_404827 ?auto_404828 ) ) ( ON ?auto_404826 ?auto_404827 ) ( ON ?auto_404825 ?auto_404826 ) ( ON ?auto_404824 ?auto_404825 ) ( ON ?auto_404823 ?auto_404824 ) ( ON ?auto_404822 ?auto_404823 ) ( CLEAR ?auto_404820 ) ( ON ?auto_404821 ?auto_404822 ) ( CLEAR ?auto_404821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_404816 ?auto_404817 ?auto_404818 ?auto_404819 ?auto_404820 ?auto_404821 )
      ( MAKE-12PILE ?auto_404816 ?auto_404817 ?auto_404818 ?auto_404819 ?auto_404820 ?auto_404821 ?auto_404822 ?auto_404823 ?auto_404824 ?auto_404825 ?auto_404826 ?auto_404827 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_404866 - BLOCK
      ?auto_404867 - BLOCK
      ?auto_404868 - BLOCK
      ?auto_404869 - BLOCK
      ?auto_404870 - BLOCK
      ?auto_404871 - BLOCK
      ?auto_404872 - BLOCK
      ?auto_404873 - BLOCK
      ?auto_404874 - BLOCK
      ?auto_404875 - BLOCK
      ?auto_404876 - BLOCK
      ?auto_404877 - BLOCK
    )
    :vars
    (
      ?auto_404878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_404877 ?auto_404878 ) ( ON-TABLE ?auto_404866 ) ( ON ?auto_404867 ?auto_404866 ) ( ON ?auto_404868 ?auto_404867 ) ( ON ?auto_404869 ?auto_404868 ) ( not ( = ?auto_404866 ?auto_404867 ) ) ( not ( = ?auto_404866 ?auto_404868 ) ) ( not ( = ?auto_404866 ?auto_404869 ) ) ( not ( = ?auto_404866 ?auto_404870 ) ) ( not ( = ?auto_404866 ?auto_404871 ) ) ( not ( = ?auto_404866 ?auto_404872 ) ) ( not ( = ?auto_404866 ?auto_404873 ) ) ( not ( = ?auto_404866 ?auto_404874 ) ) ( not ( = ?auto_404866 ?auto_404875 ) ) ( not ( = ?auto_404866 ?auto_404876 ) ) ( not ( = ?auto_404866 ?auto_404877 ) ) ( not ( = ?auto_404866 ?auto_404878 ) ) ( not ( = ?auto_404867 ?auto_404868 ) ) ( not ( = ?auto_404867 ?auto_404869 ) ) ( not ( = ?auto_404867 ?auto_404870 ) ) ( not ( = ?auto_404867 ?auto_404871 ) ) ( not ( = ?auto_404867 ?auto_404872 ) ) ( not ( = ?auto_404867 ?auto_404873 ) ) ( not ( = ?auto_404867 ?auto_404874 ) ) ( not ( = ?auto_404867 ?auto_404875 ) ) ( not ( = ?auto_404867 ?auto_404876 ) ) ( not ( = ?auto_404867 ?auto_404877 ) ) ( not ( = ?auto_404867 ?auto_404878 ) ) ( not ( = ?auto_404868 ?auto_404869 ) ) ( not ( = ?auto_404868 ?auto_404870 ) ) ( not ( = ?auto_404868 ?auto_404871 ) ) ( not ( = ?auto_404868 ?auto_404872 ) ) ( not ( = ?auto_404868 ?auto_404873 ) ) ( not ( = ?auto_404868 ?auto_404874 ) ) ( not ( = ?auto_404868 ?auto_404875 ) ) ( not ( = ?auto_404868 ?auto_404876 ) ) ( not ( = ?auto_404868 ?auto_404877 ) ) ( not ( = ?auto_404868 ?auto_404878 ) ) ( not ( = ?auto_404869 ?auto_404870 ) ) ( not ( = ?auto_404869 ?auto_404871 ) ) ( not ( = ?auto_404869 ?auto_404872 ) ) ( not ( = ?auto_404869 ?auto_404873 ) ) ( not ( = ?auto_404869 ?auto_404874 ) ) ( not ( = ?auto_404869 ?auto_404875 ) ) ( not ( = ?auto_404869 ?auto_404876 ) ) ( not ( = ?auto_404869 ?auto_404877 ) ) ( not ( = ?auto_404869 ?auto_404878 ) ) ( not ( = ?auto_404870 ?auto_404871 ) ) ( not ( = ?auto_404870 ?auto_404872 ) ) ( not ( = ?auto_404870 ?auto_404873 ) ) ( not ( = ?auto_404870 ?auto_404874 ) ) ( not ( = ?auto_404870 ?auto_404875 ) ) ( not ( = ?auto_404870 ?auto_404876 ) ) ( not ( = ?auto_404870 ?auto_404877 ) ) ( not ( = ?auto_404870 ?auto_404878 ) ) ( not ( = ?auto_404871 ?auto_404872 ) ) ( not ( = ?auto_404871 ?auto_404873 ) ) ( not ( = ?auto_404871 ?auto_404874 ) ) ( not ( = ?auto_404871 ?auto_404875 ) ) ( not ( = ?auto_404871 ?auto_404876 ) ) ( not ( = ?auto_404871 ?auto_404877 ) ) ( not ( = ?auto_404871 ?auto_404878 ) ) ( not ( = ?auto_404872 ?auto_404873 ) ) ( not ( = ?auto_404872 ?auto_404874 ) ) ( not ( = ?auto_404872 ?auto_404875 ) ) ( not ( = ?auto_404872 ?auto_404876 ) ) ( not ( = ?auto_404872 ?auto_404877 ) ) ( not ( = ?auto_404872 ?auto_404878 ) ) ( not ( = ?auto_404873 ?auto_404874 ) ) ( not ( = ?auto_404873 ?auto_404875 ) ) ( not ( = ?auto_404873 ?auto_404876 ) ) ( not ( = ?auto_404873 ?auto_404877 ) ) ( not ( = ?auto_404873 ?auto_404878 ) ) ( not ( = ?auto_404874 ?auto_404875 ) ) ( not ( = ?auto_404874 ?auto_404876 ) ) ( not ( = ?auto_404874 ?auto_404877 ) ) ( not ( = ?auto_404874 ?auto_404878 ) ) ( not ( = ?auto_404875 ?auto_404876 ) ) ( not ( = ?auto_404875 ?auto_404877 ) ) ( not ( = ?auto_404875 ?auto_404878 ) ) ( not ( = ?auto_404876 ?auto_404877 ) ) ( not ( = ?auto_404876 ?auto_404878 ) ) ( not ( = ?auto_404877 ?auto_404878 ) ) ( ON ?auto_404876 ?auto_404877 ) ( ON ?auto_404875 ?auto_404876 ) ( ON ?auto_404874 ?auto_404875 ) ( ON ?auto_404873 ?auto_404874 ) ( ON ?auto_404872 ?auto_404873 ) ( ON ?auto_404871 ?auto_404872 ) ( CLEAR ?auto_404869 ) ( ON ?auto_404870 ?auto_404871 ) ( CLEAR ?auto_404870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_404866 ?auto_404867 ?auto_404868 ?auto_404869 ?auto_404870 )
      ( MAKE-12PILE ?auto_404866 ?auto_404867 ?auto_404868 ?auto_404869 ?auto_404870 ?auto_404871 ?auto_404872 ?auto_404873 ?auto_404874 ?auto_404875 ?auto_404876 ?auto_404877 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_404916 - BLOCK
      ?auto_404917 - BLOCK
      ?auto_404918 - BLOCK
      ?auto_404919 - BLOCK
      ?auto_404920 - BLOCK
      ?auto_404921 - BLOCK
      ?auto_404922 - BLOCK
      ?auto_404923 - BLOCK
      ?auto_404924 - BLOCK
      ?auto_404925 - BLOCK
      ?auto_404926 - BLOCK
      ?auto_404927 - BLOCK
    )
    :vars
    (
      ?auto_404928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_404927 ?auto_404928 ) ( ON-TABLE ?auto_404916 ) ( ON ?auto_404917 ?auto_404916 ) ( ON ?auto_404918 ?auto_404917 ) ( not ( = ?auto_404916 ?auto_404917 ) ) ( not ( = ?auto_404916 ?auto_404918 ) ) ( not ( = ?auto_404916 ?auto_404919 ) ) ( not ( = ?auto_404916 ?auto_404920 ) ) ( not ( = ?auto_404916 ?auto_404921 ) ) ( not ( = ?auto_404916 ?auto_404922 ) ) ( not ( = ?auto_404916 ?auto_404923 ) ) ( not ( = ?auto_404916 ?auto_404924 ) ) ( not ( = ?auto_404916 ?auto_404925 ) ) ( not ( = ?auto_404916 ?auto_404926 ) ) ( not ( = ?auto_404916 ?auto_404927 ) ) ( not ( = ?auto_404916 ?auto_404928 ) ) ( not ( = ?auto_404917 ?auto_404918 ) ) ( not ( = ?auto_404917 ?auto_404919 ) ) ( not ( = ?auto_404917 ?auto_404920 ) ) ( not ( = ?auto_404917 ?auto_404921 ) ) ( not ( = ?auto_404917 ?auto_404922 ) ) ( not ( = ?auto_404917 ?auto_404923 ) ) ( not ( = ?auto_404917 ?auto_404924 ) ) ( not ( = ?auto_404917 ?auto_404925 ) ) ( not ( = ?auto_404917 ?auto_404926 ) ) ( not ( = ?auto_404917 ?auto_404927 ) ) ( not ( = ?auto_404917 ?auto_404928 ) ) ( not ( = ?auto_404918 ?auto_404919 ) ) ( not ( = ?auto_404918 ?auto_404920 ) ) ( not ( = ?auto_404918 ?auto_404921 ) ) ( not ( = ?auto_404918 ?auto_404922 ) ) ( not ( = ?auto_404918 ?auto_404923 ) ) ( not ( = ?auto_404918 ?auto_404924 ) ) ( not ( = ?auto_404918 ?auto_404925 ) ) ( not ( = ?auto_404918 ?auto_404926 ) ) ( not ( = ?auto_404918 ?auto_404927 ) ) ( not ( = ?auto_404918 ?auto_404928 ) ) ( not ( = ?auto_404919 ?auto_404920 ) ) ( not ( = ?auto_404919 ?auto_404921 ) ) ( not ( = ?auto_404919 ?auto_404922 ) ) ( not ( = ?auto_404919 ?auto_404923 ) ) ( not ( = ?auto_404919 ?auto_404924 ) ) ( not ( = ?auto_404919 ?auto_404925 ) ) ( not ( = ?auto_404919 ?auto_404926 ) ) ( not ( = ?auto_404919 ?auto_404927 ) ) ( not ( = ?auto_404919 ?auto_404928 ) ) ( not ( = ?auto_404920 ?auto_404921 ) ) ( not ( = ?auto_404920 ?auto_404922 ) ) ( not ( = ?auto_404920 ?auto_404923 ) ) ( not ( = ?auto_404920 ?auto_404924 ) ) ( not ( = ?auto_404920 ?auto_404925 ) ) ( not ( = ?auto_404920 ?auto_404926 ) ) ( not ( = ?auto_404920 ?auto_404927 ) ) ( not ( = ?auto_404920 ?auto_404928 ) ) ( not ( = ?auto_404921 ?auto_404922 ) ) ( not ( = ?auto_404921 ?auto_404923 ) ) ( not ( = ?auto_404921 ?auto_404924 ) ) ( not ( = ?auto_404921 ?auto_404925 ) ) ( not ( = ?auto_404921 ?auto_404926 ) ) ( not ( = ?auto_404921 ?auto_404927 ) ) ( not ( = ?auto_404921 ?auto_404928 ) ) ( not ( = ?auto_404922 ?auto_404923 ) ) ( not ( = ?auto_404922 ?auto_404924 ) ) ( not ( = ?auto_404922 ?auto_404925 ) ) ( not ( = ?auto_404922 ?auto_404926 ) ) ( not ( = ?auto_404922 ?auto_404927 ) ) ( not ( = ?auto_404922 ?auto_404928 ) ) ( not ( = ?auto_404923 ?auto_404924 ) ) ( not ( = ?auto_404923 ?auto_404925 ) ) ( not ( = ?auto_404923 ?auto_404926 ) ) ( not ( = ?auto_404923 ?auto_404927 ) ) ( not ( = ?auto_404923 ?auto_404928 ) ) ( not ( = ?auto_404924 ?auto_404925 ) ) ( not ( = ?auto_404924 ?auto_404926 ) ) ( not ( = ?auto_404924 ?auto_404927 ) ) ( not ( = ?auto_404924 ?auto_404928 ) ) ( not ( = ?auto_404925 ?auto_404926 ) ) ( not ( = ?auto_404925 ?auto_404927 ) ) ( not ( = ?auto_404925 ?auto_404928 ) ) ( not ( = ?auto_404926 ?auto_404927 ) ) ( not ( = ?auto_404926 ?auto_404928 ) ) ( not ( = ?auto_404927 ?auto_404928 ) ) ( ON ?auto_404926 ?auto_404927 ) ( ON ?auto_404925 ?auto_404926 ) ( ON ?auto_404924 ?auto_404925 ) ( ON ?auto_404923 ?auto_404924 ) ( ON ?auto_404922 ?auto_404923 ) ( ON ?auto_404921 ?auto_404922 ) ( ON ?auto_404920 ?auto_404921 ) ( CLEAR ?auto_404918 ) ( ON ?auto_404919 ?auto_404920 ) ( CLEAR ?auto_404919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_404916 ?auto_404917 ?auto_404918 ?auto_404919 )
      ( MAKE-12PILE ?auto_404916 ?auto_404917 ?auto_404918 ?auto_404919 ?auto_404920 ?auto_404921 ?auto_404922 ?auto_404923 ?auto_404924 ?auto_404925 ?auto_404926 ?auto_404927 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_404966 - BLOCK
      ?auto_404967 - BLOCK
      ?auto_404968 - BLOCK
      ?auto_404969 - BLOCK
      ?auto_404970 - BLOCK
      ?auto_404971 - BLOCK
      ?auto_404972 - BLOCK
      ?auto_404973 - BLOCK
      ?auto_404974 - BLOCK
      ?auto_404975 - BLOCK
      ?auto_404976 - BLOCK
      ?auto_404977 - BLOCK
    )
    :vars
    (
      ?auto_404978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_404977 ?auto_404978 ) ( ON-TABLE ?auto_404966 ) ( ON ?auto_404967 ?auto_404966 ) ( not ( = ?auto_404966 ?auto_404967 ) ) ( not ( = ?auto_404966 ?auto_404968 ) ) ( not ( = ?auto_404966 ?auto_404969 ) ) ( not ( = ?auto_404966 ?auto_404970 ) ) ( not ( = ?auto_404966 ?auto_404971 ) ) ( not ( = ?auto_404966 ?auto_404972 ) ) ( not ( = ?auto_404966 ?auto_404973 ) ) ( not ( = ?auto_404966 ?auto_404974 ) ) ( not ( = ?auto_404966 ?auto_404975 ) ) ( not ( = ?auto_404966 ?auto_404976 ) ) ( not ( = ?auto_404966 ?auto_404977 ) ) ( not ( = ?auto_404966 ?auto_404978 ) ) ( not ( = ?auto_404967 ?auto_404968 ) ) ( not ( = ?auto_404967 ?auto_404969 ) ) ( not ( = ?auto_404967 ?auto_404970 ) ) ( not ( = ?auto_404967 ?auto_404971 ) ) ( not ( = ?auto_404967 ?auto_404972 ) ) ( not ( = ?auto_404967 ?auto_404973 ) ) ( not ( = ?auto_404967 ?auto_404974 ) ) ( not ( = ?auto_404967 ?auto_404975 ) ) ( not ( = ?auto_404967 ?auto_404976 ) ) ( not ( = ?auto_404967 ?auto_404977 ) ) ( not ( = ?auto_404967 ?auto_404978 ) ) ( not ( = ?auto_404968 ?auto_404969 ) ) ( not ( = ?auto_404968 ?auto_404970 ) ) ( not ( = ?auto_404968 ?auto_404971 ) ) ( not ( = ?auto_404968 ?auto_404972 ) ) ( not ( = ?auto_404968 ?auto_404973 ) ) ( not ( = ?auto_404968 ?auto_404974 ) ) ( not ( = ?auto_404968 ?auto_404975 ) ) ( not ( = ?auto_404968 ?auto_404976 ) ) ( not ( = ?auto_404968 ?auto_404977 ) ) ( not ( = ?auto_404968 ?auto_404978 ) ) ( not ( = ?auto_404969 ?auto_404970 ) ) ( not ( = ?auto_404969 ?auto_404971 ) ) ( not ( = ?auto_404969 ?auto_404972 ) ) ( not ( = ?auto_404969 ?auto_404973 ) ) ( not ( = ?auto_404969 ?auto_404974 ) ) ( not ( = ?auto_404969 ?auto_404975 ) ) ( not ( = ?auto_404969 ?auto_404976 ) ) ( not ( = ?auto_404969 ?auto_404977 ) ) ( not ( = ?auto_404969 ?auto_404978 ) ) ( not ( = ?auto_404970 ?auto_404971 ) ) ( not ( = ?auto_404970 ?auto_404972 ) ) ( not ( = ?auto_404970 ?auto_404973 ) ) ( not ( = ?auto_404970 ?auto_404974 ) ) ( not ( = ?auto_404970 ?auto_404975 ) ) ( not ( = ?auto_404970 ?auto_404976 ) ) ( not ( = ?auto_404970 ?auto_404977 ) ) ( not ( = ?auto_404970 ?auto_404978 ) ) ( not ( = ?auto_404971 ?auto_404972 ) ) ( not ( = ?auto_404971 ?auto_404973 ) ) ( not ( = ?auto_404971 ?auto_404974 ) ) ( not ( = ?auto_404971 ?auto_404975 ) ) ( not ( = ?auto_404971 ?auto_404976 ) ) ( not ( = ?auto_404971 ?auto_404977 ) ) ( not ( = ?auto_404971 ?auto_404978 ) ) ( not ( = ?auto_404972 ?auto_404973 ) ) ( not ( = ?auto_404972 ?auto_404974 ) ) ( not ( = ?auto_404972 ?auto_404975 ) ) ( not ( = ?auto_404972 ?auto_404976 ) ) ( not ( = ?auto_404972 ?auto_404977 ) ) ( not ( = ?auto_404972 ?auto_404978 ) ) ( not ( = ?auto_404973 ?auto_404974 ) ) ( not ( = ?auto_404973 ?auto_404975 ) ) ( not ( = ?auto_404973 ?auto_404976 ) ) ( not ( = ?auto_404973 ?auto_404977 ) ) ( not ( = ?auto_404973 ?auto_404978 ) ) ( not ( = ?auto_404974 ?auto_404975 ) ) ( not ( = ?auto_404974 ?auto_404976 ) ) ( not ( = ?auto_404974 ?auto_404977 ) ) ( not ( = ?auto_404974 ?auto_404978 ) ) ( not ( = ?auto_404975 ?auto_404976 ) ) ( not ( = ?auto_404975 ?auto_404977 ) ) ( not ( = ?auto_404975 ?auto_404978 ) ) ( not ( = ?auto_404976 ?auto_404977 ) ) ( not ( = ?auto_404976 ?auto_404978 ) ) ( not ( = ?auto_404977 ?auto_404978 ) ) ( ON ?auto_404976 ?auto_404977 ) ( ON ?auto_404975 ?auto_404976 ) ( ON ?auto_404974 ?auto_404975 ) ( ON ?auto_404973 ?auto_404974 ) ( ON ?auto_404972 ?auto_404973 ) ( ON ?auto_404971 ?auto_404972 ) ( ON ?auto_404970 ?auto_404971 ) ( ON ?auto_404969 ?auto_404970 ) ( CLEAR ?auto_404967 ) ( ON ?auto_404968 ?auto_404969 ) ( CLEAR ?auto_404968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_404966 ?auto_404967 ?auto_404968 )
      ( MAKE-12PILE ?auto_404966 ?auto_404967 ?auto_404968 ?auto_404969 ?auto_404970 ?auto_404971 ?auto_404972 ?auto_404973 ?auto_404974 ?auto_404975 ?auto_404976 ?auto_404977 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_405016 - BLOCK
      ?auto_405017 - BLOCK
      ?auto_405018 - BLOCK
      ?auto_405019 - BLOCK
      ?auto_405020 - BLOCK
      ?auto_405021 - BLOCK
      ?auto_405022 - BLOCK
      ?auto_405023 - BLOCK
      ?auto_405024 - BLOCK
      ?auto_405025 - BLOCK
      ?auto_405026 - BLOCK
      ?auto_405027 - BLOCK
    )
    :vars
    (
      ?auto_405028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_405027 ?auto_405028 ) ( ON-TABLE ?auto_405016 ) ( not ( = ?auto_405016 ?auto_405017 ) ) ( not ( = ?auto_405016 ?auto_405018 ) ) ( not ( = ?auto_405016 ?auto_405019 ) ) ( not ( = ?auto_405016 ?auto_405020 ) ) ( not ( = ?auto_405016 ?auto_405021 ) ) ( not ( = ?auto_405016 ?auto_405022 ) ) ( not ( = ?auto_405016 ?auto_405023 ) ) ( not ( = ?auto_405016 ?auto_405024 ) ) ( not ( = ?auto_405016 ?auto_405025 ) ) ( not ( = ?auto_405016 ?auto_405026 ) ) ( not ( = ?auto_405016 ?auto_405027 ) ) ( not ( = ?auto_405016 ?auto_405028 ) ) ( not ( = ?auto_405017 ?auto_405018 ) ) ( not ( = ?auto_405017 ?auto_405019 ) ) ( not ( = ?auto_405017 ?auto_405020 ) ) ( not ( = ?auto_405017 ?auto_405021 ) ) ( not ( = ?auto_405017 ?auto_405022 ) ) ( not ( = ?auto_405017 ?auto_405023 ) ) ( not ( = ?auto_405017 ?auto_405024 ) ) ( not ( = ?auto_405017 ?auto_405025 ) ) ( not ( = ?auto_405017 ?auto_405026 ) ) ( not ( = ?auto_405017 ?auto_405027 ) ) ( not ( = ?auto_405017 ?auto_405028 ) ) ( not ( = ?auto_405018 ?auto_405019 ) ) ( not ( = ?auto_405018 ?auto_405020 ) ) ( not ( = ?auto_405018 ?auto_405021 ) ) ( not ( = ?auto_405018 ?auto_405022 ) ) ( not ( = ?auto_405018 ?auto_405023 ) ) ( not ( = ?auto_405018 ?auto_405024 ) ) ( not ( = ?auto_405018 ?auto_405025 ) ) ( not ( = ?auto_405018 ?auto_405026 ) ) ( not ( = ?auto_405018 ?auto_405027 ) ) ( not ( = ?auto_405018 ?auto_405028 ) ) ( not ( = ?auto_405019 ?auto_405020 ) ) ( not ( = ?auto_405019 ?auto_405021 ) ) ( not ( = ?auto_405019 ?auto_405022 ) ) ( not ( = ?auto_405019 ?auto_405023 ) ) ( not ( = ?auto_405019 ?auto_405024 ) ) ( not ( = ?auto_405019 ?auto_405025 ) ) ( not ( = ?auto_405019 ?auto_405026 ) ) ( not ( = ?auto_405019 ?auto_405027 ) ) ( not ( = ?auto_405019 ?auto_405028 ) ) ( not ( = ?auto_405020 ?auto_405021 ) ) ( not ( = ?auto_405020 ?auto_405022 ) ) ( not ( = ?auto_405020 ?auto_405023 ) ) ( not ( = ?auto_405020 ?auto_405024 ) ) ( not ( = ?auto_405020 ?auto_405025 ) ) ( not ( = ?auto_405020 ?auto_405026 ) ) ( not ( = ?auto_405020 ?auto_405027 ) ) ( not ( = ?auto_405020 ?auto_405028 ) ) ( not ( = ?auto_405021 ?auto_405022 ) ) ( not ( = ?auto_405021 ?auto_405023 ) ) ( not ( = ?auto_405021 ?auto_405024 ) ) ( not ( = ?auto_405021 ?auto_405025 ) ) ( not ( = ?auto_405021 ?auto_405026 ) ) ( not ( = ?auto_405021 ?auto_405027 ) ) ( not ( = ?auto_405021 ?auto_405028 ) ) ( not ( = ?auto_405022 ?auto_405023 ) ) ( not ( = ?auto_405022 ?auto_405024 ) ) ( not ( = ?auto_405022 ?auto_405025 ) ) ( not ( = ?auto_405022 ?auto_405026 ) ) ( not ( = ?auto_405022 ?auto_405027 ) ) ( not ( = ?auto_405022 ?auto_405028 ) ) ( not ( = ?auto_405023 ?auto_405024 ) ) ( not ( = ?auto_405023 ?auto_405025 ) ) ( not ( = ?auto_405023 ?auto_405026 ) ) ( not ( = ?auto_405023 ?auto_405027 ) ) ( not ( = ?auto_405023 ?auto_405028 ) ) ( not ( = ?auto_405024 ?auto_405025 ) ) ( not ( = ?auto_405024 ?auto_405026 ) ) ( not ( = ?auto_405024 ?auto_405027 ) ) ( not ( = ?auto_405024 ?auto_405028 ) ) ( not ( = ?auto_405025 ?auto_405026 ) ) ( not ( = ?auto_405025 ?auto_405027 ) ) ( not ( = ?auto_405025 ?auto_405028 ) ) ( not ( = ?auto_405026 ?auto_405027 ) ) ( not ( = ?auto_405026 ?auto_405028 ) ) ( not ( = ?auto_405027 ?auto_405028 ) ) ( ON ?auto_405026 ?auto_405027 ) ( ON ?auto_405025 ?auto_405026 ) ( ON ?auto_405024 ?auto_405025 ) ( ON ?auto_405023 ?auto_405024 ) ( ON ?auto_405022 ?auto_405023 ) ( ON ?auto_405021 ?auto_405022 ) ( ON ?auto_405020 ?auto_405021 ) ( ON ?auto_405019 ?auto_405020 ) ( ON ?auto_405018 ?auto_405019 ) ( CLEAR ?auto_405016 ) ( ON ?auto_405017 ?auto_405018 ) ( CLEAR ?auto_405017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_405016 ?auto_405017 )
      ( MAKE-12PILE ?auto_405016 ?auto_405017 ?auto_405018 ?auto_405019 ?auto_405020 ?auto_405021 ?auto_405022 ?auto_405023 ?auto_405024 ?auto_405025 ?auto_405026 ?auto_405027 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_405066 - BLOCK
      ?auto_405067 - BLOCK
      ?auto_405068 - BLOCK
      ?auto_405069 - BLOCK
      ?auto_405070 - BLOCK
      ?auto_405071 - BLOCK
      ?auto_405072 - BLOCK
      ?auto_405073 - BLOCK
      ?auto_405074 - BLOCK
      ?auto_405075 - BLOCK
      ?auto_405076 - BLOCK
      ?auto_405077 - BLOCK
    )
    :vars
    (
      ?auto_405078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_405077 ?auto_405078 ) ( not ( = ?auto_405066 ?auto_405067 ) ) ( not ( = ?auto_405066 ?auto_405068 ) ) ( not ( = ?auto_405066 ?auto_405069 ) ) ( not ( = ?auto_405066 ?auto_405070 ) ) ( not ( = ?auto_405066 ?auto_405071 ) ) ( not ( = ?auto_405066 ?auto_405072 ) ) ( not ( = ?auto_405066 ?auto_405073 ) ) ( not ( = ?auto_405066 ?auto_405074 ) ) ( not ( = ?auto_405066 ?auto_405075 ) ) ( not ( = ?auto_405066 ?auto_405076 ) ) ( not ( = ?auto_405066 ?auto_405077 ) ) ( not ( = ?auto_405066 ?auto_405078 ) ) ( not ( = ?auto_405067 ?auto_405068 ) ) ( not ( = ?auto_405067 ?auto_405069 ) ) ( not ( = ?auto_405067 ?auto_405070 ) ) ( not ( = ?auto_405067 ?auto_405071 ) ) ( not ( = ?auto_405067 ?auto_405072 ) ) ( not ( = ?auto_405067 ?auto_405073 ) ) ( not ( = ?auto_405067 ?auto_405074 ) ) ( not ( = ?auto_405067 ?auto_405075 ) ) ( not ( = ?auto_405067 ?auto_405076 ) ) ( not ( = ?auto_405067 ?auto_405077 ) ) ( not ( = ?auto_405067 ?auto_405078 ) ) ( not ( = ?auto_405068 ?auto_405069 ) ) ( not ( = ?auto_405068 ?auto_405070 ) ) ( not ( = ?auto_405068 ?auto_405071 ) ) ( not ( = ?auto_405068 ?auto_405072 ) ) ( not ( = ?auto_405068 ?auto_405073 ) ) ( not ( = ?auto_405068 ?auto_405074 ) ) ( not ( = ?auto_405068 ?auto_405075 ) ) ( not ( = ?auto_405068 ?auto_405076 ) ) ( not ( = ?auto_405068 ?auto_405077 ) ) ( not ( = ?auto_405068 ?auto_405078 ) ) ( not ( = ?auto_405069 ?auto_405070 ) ) ( not ( = ?auto_405069 ?auto_405071 ) ) ( not ( = ?auto_405069 ?auto_405072 ) ) ( not ( = ?auto_405069 ?auto_405073 ) ) ( not ( = ?auto_405069 ?auto_405074 ) ) ( not ( = ?auto_405069 ?auto_405075 ) ) ( not ( = ?auto_405069 ?auto_405076 ) ) ( not ( = ?auto_405069 ?auto_405077 ) ) ( not ( = ?auto_405069 ?auto_405078 ) ) ( not ( = ?auto_405070 ?auto_405071 ) ) ( not ( = ?auto_405070 ?auto_405072 ) ) ( not ( = ?auto_405070 ?auto_405073 ) ) ( not ( = ?auto_405070 ?auto_405074 ) ) ( not ( = ?auto_405070 ?auto_405075 ) ) ( not ( = ?auto_405070 ?auto_405076 ) ) ( not ( = ?auto_405070 ?auto_405077 ) ) ( not ( = ?auto_405070 ?auto_405078 ) ) ( not ( = ?auto_405071 ?auto_405072 ) ) ( not ( = ?auto_405071 ?auto_405073 ) ) ( not ( = ?auto_405071 ?auto_405074 ) ) ( not ( = ?auto_405071 ?auto_405075 ) ) ( not ( = ?auto_405071 ?auto_405076 ) ) ( not ( = ?auto_405071 ?auto_405077 ) ) ( not ( = ?auto_405071 ?auto_405078 ) ) ( not ( = ?auto_405072 ?auto_405073 ) ) ( not ( = ?auto_405072 ?auto_405074 ) ) ( not ( = ?auto_405072 ?auto_405075 ) ) ( not ( = ?auto_405072 ?auto_405076 ) ) ( not ( = ?auto_405072 ?auto_405077 ) ) ( not ( = ?auto_405072 ?auto_405078 ) ) ( not ( = ?auto_405073 ?auto_405074 ) ) ( not ( = ?auto_405073 ?auto_405075 ) ) ( not ( = ?auto_405073 ?auto_405076 ) ) ( not ( = ?auto_405073 ?auto_405077 ) ) ( not ( = ?auto_405073 ?auto_405078 ) ) ( not ( = ?auto_405074 ?auto_405075 ) ) ( not ( = ?auto_405074 ?auto_405076 ) ) ( not ( = ?auto_405074 ?auto_405077 ) ) ( not ( = ?auto_405074 ?auto_405078 ) ) ( not ( = ?auto_405075 ?auto_405076 ) ) ( not ( = ?auto_405075 ?auto_405077 ) ) ( not ( = ?auto_405075 ?auto_405078 ) ) ( not ( = ?auto_405076 ?auto_405077 ) ) ( not ( = ?auto_405076 ?auto_405078 ) ) ( not ( = ?auto_405077 ?auto_405078 ) ) ( ON ?auto_405076 ?auto_405077 ) ( ON ?auto_405075 ?auto_405076 ) ( ON ?auto_405074 ?auto_405075 ) ( ON ?auto_405073 ?auto_405074 ) ( ON ?auto_405072 ?auto_405073 ) ( ON ?auto_405071 ?auto_405072 ) ( ON ?auto_405070 ?auto_405071 ) ( ON ?auto_405069 ?auto_405070 ) ( ON ?auto_405068 ?auto_405069 ) ( ON ?auto_405067 ?auto_405068 ) ( ON ?auto_405066 ?auto_405067 ) ( CLEAR ?auto_405066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_405066 )
      ( MAKE-12PILE ?auto_405066 ?auto_405067 ?auto_405068 ?auto_405069 ?auto_405070 ?auto_405071 ?auto_405072 ?auto_405073 ?auto_405074 ?auto_405075 ?auto_405076 ?auto_405077 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_405117 - BLOCK
      ?auto_405118 - BLOCK
      ?auto_405119 - BLOCK
      ?auto_405120 - BLOCK
      ?auto_405121 - BLOCK
      ?auto_405122 - BLOCK
      ?auto_405123 - BLOCK
      ?auto_405124 - BLOCK
      ?auto_405125 - BLOCK
      ?auto_405126 - BLOCK
      ?auto_405127 - BLOCK
      ?auto_405128 - BLOCK
      ?auto_405129 - BLOCK
    )
    :vars
    (
      ?auto_405130 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_405128 ) ( ON ?auto_405129 ?auto_405130 ) ( CLEAR ?auto_405129 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_405117 ) ( ON ?auto_405118 ?auto_405117 ) ( ON ?auto_405119 ?auto_405118 ) ( ON ?auto_405120 ?auto_405119 ) ( ON ?auto_405121 ?auto_405120 ) ( ON ?auto_405122 ?auto_405121 ) ( ON ?auto_405123 ?auto_405122 ) ( ON ?auto_405124 ?auto_405123 ) ( ON ?auto_405125 ?auto_405124 ) ( ON ?auto_405126 ?auto_405125 ) ( ON ?auto_405127 ?auto_405126 ) ( ON ?auto_405128 ?auto_405127 ) ( not ( = ?auto_405117 ?auto_405118 ) ) ( not ( = ?auto_405117 ?auto_405119 ) ) ( not ( = ?auto_405117 ?auto_405120 ) ) ( not ( = ?auto_405117 ?auto_405121 ) ) ( not ( = ?auto_405117 ?auto_405122 ) ) ( not ( = ?auto_405117 ?auto_405123 ) ) ( not ( = ?auto_405117 ?auto_405124 ) ) ( not ( = ?auto_405117 ?auto_405125 ) ) ( not ( = ?auto_405117 ?auto_405126 ) ) ( not ( = ?auto_405117 ?auto_405127 ) ) ( not ( = ?auto_405117 ?auto_405128 ) ) ( not ( = ?auto_405117 ?auto_405129 ) ) ( not ( = ?auto_405117 ?auto_405130 ) ) ( not ( = ?auto_405118 ?auto_405119 ) ) ( not ( = ?auto_405118 ?auto_405120 ) ) ( not ( = ?auto_405118 ?auto_405121 ) ) ( not ( = ?auto_405118 ?auto_405122 ) ) ( not ( = ?auto_405118 ?auto_405123 ) ) ( not ( = ?auto_405118 ?auto_405124 ) ) ( not ( = ?auto_405118 ?auto_405125 ) ) ( not ( = ?auto_405118 ?auto_405126 ) ) ( not ( = ?auto_405118 ?auto_405127 ) ) ( not ( = ?auto_405118 ?auto_405128 ) ) ( not ( = ?auto_405118 ?auto_405129 ) ) ( not ( = ?auto_405118 ?auto_405130 ) ) ( not ( = ?auto_405119 ?auto_405120 ) ) ( not ( = ?auto_405119 ?auto_405121 ) ) ( not ( = ?auto_405119 ?auto_405122 ) ) ( not ( = ?auto_405119 ?auto_405123 ) ) ( not ( = ?auto_405119 ?auto_405124 ) ) ( not ( = ?auto_405119 ?auto_405125 ) ) ( not ( = ?auto_405119 ?auto_405126 ) ) ( not ( = ?auto_405119 ?auto_405127 ) ) ( not ( = ?auto_405119 ?auto_405128 ) ) ( not ( = ?auto_405119 ?auto_405129 ) ) ( not ( = ?auto_405119 ?auto_405130 ) ) ( not ( = ?auto_405120 ?auto_405121 ) ) ( not ( = ?auto_405120 ?auto_405122 ) ) ( not ( = ?auto_405120 ?auto_405123 ) ) ( not ( = ?auto_405120 ?auto_405124 ) ) ( not ( = ?auto_405120 ?auto_405125 ) ) ( not ( = ?auto_405120 ?auto_405126 ) ) ( not ( = ?auto_405120 ?auto_405127 ) ) ( not ( = ?auto_405120 ?auto_405128 ) ) ( not ( = ?auto_405120 ?auto_405129 ) ) ( not ( = ?auto_405120 ?auto_405130 ) ) ( not ( = ?auto_405121 ?auto_405122 ) ) ( not ( = ?auto_405121 ?auto_405123 ) ) ( not ( = ?auto_405121 ?auto_405124 ) ) ( not ( = ?auto_405121 ?auto_405125 ) ) ( not ( = ?auto_405121 ?auto_405126 ) ) ( not ( = ?auto_405121 ?auto_405127 ) ) ( not ( = ?auto_405121 ?auto_405128 ) ) ( not ( = ?auto_405121 ?auto_405129 ) ) ( not ( = ?auto_405121 ?auto_405130 ) ) ( not ( = ?auto_405122 ?auto_405123 ) ) ( not ( = ?auto_405122 ?auto_405124 ) ) ( not ( = ?auto_405122 ?auto_405125 ) ) ( not ( = ?auto_405122 ?auto_405126 ) ) ( not ( = ?auto_405122 ?auto_405127 ) ) ( not ( = ?auto_405122 ?auto_405128 ) ) ( not ( = ?auto_405122 ?auto_405129 ) ) ( not ( = ?auto_405122 ?auto_405130 ) ) ( not ( = ?auto_405123 ?auto_405124 ) ) ( not ( = ?auto_405123 ?auto_405125 ) ) ( not ( = ?auto_405123 ?auto_405126 ) ) ( not ( = ?auto_405123 ?auto_405127 ) ) ( not ( = ?auto_405123 ?auto_405128 ) ) ( not ( = ?auto_405123 ?auto_405129 ) ) ( not ( = ?auto_405123 ?auto_405130 ) ) ( not ( = ?auto_405124 ?auto_405125 ) ) ( not ( = ?auto_405124 ?auto_405126 ) ) ( not ( = ?auto_405124 ?auto_405127 ) ) ( not ( = ?auto_405124 ?auto_405128 ) ) ( not ( = ?auto_405124 ?auto_405129 ) ) ( not ( = ?auto_405124 ?auto_405130 ) ) ( not ( = ?auto_405125 ?auto_405126 ) ) ( not ( = ?auto_405125 ?auto_405127 ) ) ( not ( = ?auto_405125 ?auto_405128 ) ) ( not ( = ?auto_405125 ?auto_405129 ) ) ( not ( = ?auto_405125 ?auto_405130 ) ) ( not ( = ?auto_405126 ?auto_405127 ) ) ( not ( = ?auto_405126 ?auto_405128 ) ) ( not ( = ?auto_405126 ?auto_405129 ) ) ( not ( = ?auto_405126 ?auto_405130 ) ) ( not ( = ?auto_405127 ?auto_405128 ) ) ( not ( = ?auto_405127 ?auto_405129 ) ) ( not ( = ?auto_405127 ?auto_405130 ) ) ( not ( = ?auto_405128 ?auto_405129 ) ) ( not ( = ?auto_405128 ?auto_405130 ) ) ( not ( = ?auto_405129 ?auto_405130 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_405129 ?auto_405130 )
      ( !STACK ?auto_405129 ?auto_405128 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_405171 - BLOCK
      ?auto_405172 - BLOCK
      ?auto_405173 - BLOCK
      ?auto_405174 - BLOCK
      ?auto_405175 - BLOCK
      ?auto_405176 - BLOCK
      ?auto_405177 - BLOCK
      ?auto_405178 - BLOCK
      ?auto_405179 - BLOCK
      ?auto_405180 - BLOCK
      ?auto_405181 - BLOCK
      ?auto_405182 - BLOCK
      ?auto_405183 - BLOCK
    )
    :vars
    (
      ?auto_405184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_405183 ?auto_405184 ) ( ON-TABLE ?auto_405171 ) ( ON ?auto_405172 ?auto_405171 ) ( ON ?auto_405173 ?auto_405172 ) ( ON ?auto_405174 ?auto_405173 ) ( ON ?auto_405175 ?auto_405174 ) ( ON ?auto_405176 ?auto_405175 ) ( ON ?auto_405177 ?auto_405176 ) ( ON ?auto_405178 ?auto_405177 ) ( ON ?auto_405179 ?auto_405178 ) ( ON ?auto_405180 ?auto_405179 ) ( ON ?auto_405181 ?auto_405180 ) ( not ( = ?auto_405171 ?auto_405172 ) ) ( not ( = ?auto_405171 ?auto_405173 ) ) ( not ( = ?auto_405171 ?auto_405174 ) ) ( not ( = ?auto_405171 ?auto_405175 ) ) ( not ( = ?auto_405171 ?auto_405176 ) ) ( not ( = ?auto_405171 ?auto_405177 ) ) ( not ( = ?auto_405171 ?auto_405178 ) ) ( not ( = ?auto_405171 ?auto_405179 ) ) ( not ( = ?auto_405171 ?auto_405180 ) ) ( not ( = ?auto_405171 ?auto_405181 ) ) ( not ( = ?auto_405171 ?auto_405182 ) ) ( not ( = ?auto_405171 ?auto_405183 ) ) ( not ( = ?auto_405171 ?auto_405184 ) ) ( not ( = ?auto_405172 ?auto_405173 ) ) ( not ( = ?auto_405172 ?auto_405174 ) ) ( not ( = ?auto_405172 ?auto_405175 ) ) ( not ( = ?auto_405172 ?auto_405176 ) ) ( not ( = ?auto_405172 ?auto_405177 ) ) ( not ( = ?auto_405172 ?auto_405178 ) ) ( not ( = ?auto_405172 ?auto_405179 ) ) ( not ( = ?auto_405172 ?auto_405180 ) ) ( not ( = ?auto_405172 ?auto_405181 ) ) ( not ( = ?auto_405172 ?auto_405182 ) ) ( not ( = ?auto_405172 ?auto_405183 ) ) ( not ( = ?auto_405172 ?auto_405184 ) ) ( not ( = ?auto_405173 ?auto_405174 ) ) ( not ( = ?auto_405173 ?auto_405175 ) ) ( not ( = ?auto_405173 ?auto_405176 ) ) ( not ( = ?auto_405173 ?auto_405177 ) ) ( not ( = ?auto_405173 ?auto_405178 ) ) ( not ( = ?auto_405173 ?auto_405179 ) ) ( not ( = ?auto_405173 ?auto_405180 ) ) ( not ( = ?auto_405173 ?auto_405181 ) ) ( not ( = ?auto_405173 ?auto_405182 ) ) ( not ( = ?auto_405173 ?auto_405183 ) ) ( not ( = ?auto_405173 ?auto_405184 ) ) ( not ( = ?auto_405174 ?auto_405175 ) ) ( not ( = ?auto_405174 ?auto_405176 ) ) ( not ( = ?auto_405174 ?auto_405177 ) ) ( not ( = ?auto_405174 ?auto_405178 ) ) ( not ( = ?auto_405174 ?auto_405179 ) ) ( not ( = ?auto_405174 ?auto_405180 ) ) ( not ( = ?auto_405174 ?auto_405181 ) ) ( not ( = ?auto_405174 ?auto_405182 ) ) ( not ( = ?auto_405174 ?auto_405183 ) ) ( not ( = ?auto_405174 ?auto_405184 ) ) ( not ( = ?auto_405175 ?auto_405176 ) ) ( not ( = ?auto_405175 ?auto_405177 ) ) ( not ( = ?auto_405175 ?auto_405178 ) ) ( not ( = ?auto_405175 ?auto_405179 ) ) ( not ( = ?auto_405175 ?auto_405180 ) ) ( not ( = ?auto_405175 ?auto_405181 ) ) ( not ( = ?auto_405175 ?auto_405182 ) ) ( not ( = ?auto_405175 ?auto_405183 ) ) ( not ( = ?auto_405175 ?auto_405184 ) ) ( not ( = ?auto_405176 ?auto_405177 ) ) ( not ( = ?auto_405176 ?auto_405178 ) ) ( not ( = ?auto_405176 ?auto_405179 ) ) ( not ( = ?auto_405176 ?auto_405180 ) ) ( not ( = ?auto_405176 ?auto_405181 ) ) ( not ( = ?auto_405176 ?auto_405182 ) ) ( not ( = ?auto_405176 ?auto_405183 ) ) ( not ( = ?auto_405176 ?auto_405184 ) ) ( not ( = ?auto_405177 ?auto_405178 ) ) ( not ( = ?auto_405177 ?auto_405179 ) ) ( not ( = ?auto_405177 ?auto_405180 ) ) ( not ( = ?auto_405177 ?auto_405181 ) ) ( not ( = ?auto_405177 ?auto_405182 ) ) ( not ( = ?auto_405177 ?auto_405183 ) ) ( not ( = ?auto_405177 ?auto_405184 ) ) ( not ( = ?auto_405178 ?auto_405179 ) ) ( not ( = ?auto_405178 ?auto_405180 ) ) ( not ( = ?auto_405178 ?auto_405181 ) ) ( not ( = ?auto_405178 ?auto_405182 ) ) ( not ( = ?auto_405178 ?auto_405183 ) ) ( not ( = ?auto_405178 ?auto_405184 ) ) ( not ( = ?auto_405179 ?auto_405180 ) ) ( not ( = ?auto_405179 ?auto_405181 ) ) ( not ( = ?auto_405179 ?auto_405182 ) ) ( not ( = ?auto_405179 ?auto_405183 ) ) ( not ( = ?auto_405179 ?auto_405184 ) ) ( not ( = ?auto_405180 ?auto_405181 ) ) ( not ( = ?auto_405180 ?auto_405182 ) ) ( not ( = ?auto_405180 ?auto_405183 ) ) ( not ( = ?auto_405180 ?auto_405184 ) ) ( not ( = ?auto_405181 ?auto_405182 ) ) ( not ( = ?auto_405181 ?auto_405183 ) ) ( not ( = ?auto_405181 ?auto_405184 ) ) ( not ( = ?auto_405182 ?auto_405183 ) ) ( not ( = ?auto_405182 ?auto_405184 ) ) ( not ( = ?auto_405183 ?auto_405184 ) ) ( CLEAR ?auto_405181 ) ( ON ?auto_405182 ?auto_405183 ) ( CLEAR ?auto_405182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_405171 ?auto_405172 ?auto_405173 ?auto_405174 ?auto_405175 ?auto_405176 ?auto_405177 ?auto_405178 ?auto_405179 ?auto_405180 ?auto_405181 ?auto_405182 )
      ( MAKE-13PILE ?auto_405171 ?auto_405172 ?auto_405173 ?auto_405174 ?auto_405175 ?auto_405176 ?auto_405177 ?auto_405178 ?auto_405179 ?auto_405180 ?auto_405181 ?auto_405182 ?auto_405183 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_405225 - BLOCK
      ?auto_405226 - BLOCK
      ?auto_405227 - BLOCK
      ?auto_405228 - BLOCK
      ?auto_405229 - BLOCK
      ?auto_405230 - BLOCK
      ?auto_405231 - BLOCK
      ?auto_405232 - BLOCK
      ?auto_405233 - BLOCK
      ?auto_405234 - BLOCK
      ?auto_405235 - BLOCK
      ?auto_405236 - BLOCK
      ?auto_405237 - BLOCK
    )
    :vars
    (
      ?auto_405238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_405237 ?auto_405238 ) ( ON-TABLE ?auto_405225 ) ( ON ?auto_405226 ?auto_405225 ) ( ON ?auto_405227 ?auto_405226 ) ( ON ?auto_405228 ?auto_405227 ) ( ON ?auto_405229 ?auto_405228 ) ( ON ?auto_405230 ?auto_405229 ) ( ON ?auto_405231 ?auto_405230 ) ( ON ?auto_405232 ?auto_405231 ) ( ON ?auto_405233 ?auto_405232 ) ( ON ?auto_405234 ?auto_405233 ) ( not ( = ?auto_405225 ?auto_405226 ) ) ( not ( = ?auto_405225 ?auto_405227 ) ) ( not ( = ?auto_405225 ?auto_405228 ) ) ( not ( = ?auto_405225 ?auto_405229 ) ) ( not ( = ?auto_405225 ?auto_405230 ) ) ( not ( = ?auto_405225 ?auto_405231 ) ) ( not ( = ?auto_405225 ?auto_405232 ) ) ( not ( = ?auto_405225 ?auto_405233 ) ) ( not ( = ?auto_405225 ?auto_405234 ) ) ( not ( = ?auto_405225 ?auto_405235 ) ) ( not ( = ?auto_405225 ?auto_405236 ) ) ( not ( = ?auto_405225 ?auto_405237 ) ) ( not ( = ?auto_405225 ?auto_405238 ) ) ( not ( = ?auto_405226 ?auto_405227 ) ) ( not ( = ?auto_405226 ?auto_405228 ) ) ( not ( = ?auto_405226 ?auto_405229 ) ) ( not ( = ?auto_405226 ?auto_405230 ) ) ( not ( = ?auto_405226 ?auto_405231 ) ) ( not ( = ?auto_405226 ?auto_405232 ) ) ( not ( = ?auto_405226 ?auto_405233 ) ) ( not ( = ?auto_405226 ?auto_405234 ) ) ( not ( = ?auto_405226 ?auto_405235 ) ) ( not ( = ?auto_405226 ?auto_405236 ) ) ( not ( = ?auto_405226 ?auto_405237 ) ) ( not ( = ?auto_405226 ?auto_405238 ) ) ( not ( = ?auto_405227 ?auto_405228 ) ) ( not ( = ?auto_405227 ?auto_405229 ) ) ( not ( = ?auto_405227 ?auto_405230 ) ) ( not ( = ?auto_405227 ?auto_405231 ) ) ( not ( = ?auto_405227 ?auto_405232 ) ) ( not ( = ?auto_405227 ?auto_405233 ) ) ( not ( = ?auto_405227 ?auto_405234 ) ) ( not ( = ?auto_405227 ?auto_405235 ) ) ( not ( = ?auto_405227 ?auto_405236 ) ) ( not ( = ?auto_405227 ?auto_405237 ) ) ( not ( = ?auto_405227 ?auto_405238 ) ) ( not ( = ?auto_405228 ?auto_405229 ) ) ( not ( = ?auto_405228 ?auto_405230 ) ) ( not ( = ?auto_405228 ?auto_405231 ) ) ( not ( = ?auto_405228 ?auto_405232 ) ) ( not ( = ?auto_405228 ?auto_405233 ) ) ( not ( = ?auto_405228 ?auto_405234 ) ) ( not ( = ?auto_405228 ?auto_405235 ) ) ( not ( = ?auto_405228 ?auto_405236 ) ) ( not ( = ?auto_405228 ?auto_405237 ) ) ( not ( = ?auto_405228 ?auto_405238 ) ) ( not ( = ?auto_405229 ?auto_405230 ) ) ( not ( = ?auto_405229 ?auto_405231 ) ) ( not ( = ?auto_405229 ?auto_405232 ) ) ( not ( = ?auto_405229 ?auto_405233 ) ) ( not ( = ?auto_405229 ?auto_405234 ) ) ( not ( = ?auto_405229 ?auto_405235 ) ) ( not ( = ?auto_405229 ?auto_405236 ) ) ( not ( = ?auto_405229 ?auto_405237 ) ) ( not ( = ?auto_405229 ?auto_405238 ) ) ( not ( = ?auto_405230 ?auto_405231 ) ) ( not ( = ?auto_405230 ?auto_405232 ) ) ( not ( = ?auto_405230 ?auto_405233 ) ) ( not ( = ?auto_405230 ?auto_405234 ) ) ( not ( = ?auto_405230 ?auto_405235 ) ) ( not ( = ?auto_405230 ?auto_405236 ) ) ( not ( = ?auto_405230 ?auto_405237 ) ) ( not ( = ?auto_405230 ?auto_405238 ) ) ( not ( = ?auto_405231 ?auto_405232 ) ) ( not ( = ?auto_405231 ?auto_405233 ) ) ( not ( = ?auto_405231 ?auto_405234 ) ) ( not ( = ?auto_405231 ?auto_405235 ) ) ( not ( = ?auto_405231 ?auto_405236 ) ) ( not ( = ?auto_405231 ?auto_405237 ) ) ( not ( = ?auto_405231 ?auto_405238 ) ) ( not ( = ?auto_405232 ?auto_405233 ) ) ( not ( = ?auto_405232 ?auto_405234 ) ) ( not ( = ?auto_405232 ?auto_405235 ) ) ( not ( = ?auto_405232 ?auto_405236 ) ) ( not ( = ?auto_405232 ?auto_405237 ) ) ( not ( = ?auto_405232 ?auto_405238 ) ) ( not ( = ?auto_405233 ?auto_405234 ) ) ( not ( = ?auto_405233 ?auto_405235 ) ) ( not ( = ?auto_405233 ?auto_405236 ) ) ( not ( = ?auto_405233 ?auto_405237 ) ) ( not ( = ?auto_405233 ?auto_405238 ) ) ( not ( = ?auto_405234 ?auto_405235 ) ) ( not ( = ?auto_405234 ?auto_405236 ) ) ( not ( = ?auto_405234 ?auto_405237 ) ) ( not ( = ?auto_405234 ?auto_405238 ) ) ( not ( = ?auto_405235 ?auto_405236 ) ) ( not ( = ?auto_405235 ?auto_405237 ) ) ( not ( = ?auto_405235 ?auto_405238 ) ) ( not ( = ?auto_405236 ?auto_405237 ) ) ( not ( = ?auto_405236 ?auto_405238 ) ) ( not ( = ?auto_405237 ?auto_405238 ) ) ( ON ?auto_405236 ?auto_405237 ) ( CLEAR ?auto_405234 ) ( ON ?auto_405235 ?auto_405236 ) ( CLEAR ?auto_405235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_405225 ?auto_405226 ?auto_405227 ?auto_405228 ?auto_405229 ?auto_405230 ?auto_405231 ?auto_405232 ?auto_405233 ?auto_405234 ?auto_405235 )
      ( MAKE-13PILE ?auto_405225 ?auto_405226 ?auto_405227 ?auto_405228 ?auto_405229 ?auto_405230 ?auto_405231 ?auto_405232 ?auto_405233 ?auto_405234 ?auto_405235 ?auto_405236 ?auto_405237 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_405279 - BLOCK
      ?auto_405280 - BLOCK
      ?auto_405281 - BLOCK
      ?auto_405282 - BLOCK
      ?auto_405283 - BLOCK
      ?auto_405284 - BLOCK
      ?auto_405285 - BLOCK
      ?auto_405286 - BLOCK
      ?auto_405287 - BLOCK
      ?auto_405288 - BLOCK
      ?auto_405289 - BLOCK
      ?auto_405290 - BLOCK
      ?auto_405291 - BLOCK
    )
    :vars
    (
      ?auto_405292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_405291 ?auto_405292 ) ( ON-TABLE ?auto_405279 ) ( ON ?auto_405280 ?auto_405279 ) ( ON ?auto_405281 ?auto_405280 ) ( ON ?auto_405282 ?auto_405281 ) ( ON ?auto_405283 ?auto_405282 ) ( ON ?auto_405284 ?auto_405283 ) ( ON ?auto_405285 ?auto_405284 ) ( ON ?auto_405286 ?auto_405285 ) ( ON ?auto_405287 ?auto_405286 ) ( not ( = ?auto_405279 ?auto_405280 ) ) ( not ( = ?auto_405279 ?auto_405281 ) ) ( not ( = ?auto_405279 ?auto_405282 ) ) ( not ( = ?auto_405279 ?auto_405283 ) ) ( not ( = ?auto_405279 ?auto_405284 ) ) ( not ( = ?auto_405279 ?auto_405285 ) ) ( not ( = ?auto_405279 ?auto_405286 ) ) ( not ( = ?auto_405279 ?auto_405287 ) ) ( not ( = ?auto_405279 ?auto_405288 ) ) ( not ( = ?auto_405279 ?auto_405289 ) ) ( not ( = ?auto_405279 ?auto_405290 ) ) ( not ( = ?auto_405279 ?auto_405291 ) ) ( not ( = ?auto_405279 ?auto_405292 ) ) ( not ( = ?auto_405280 ?auto_405281 ) ) ( not ( = ?auto_405280 ?auto_405282 ) ) ( not ( = ?auto_405280 ?auto_405283 ) ) ( not ( = ?auto_405280 ?auto_405284 ) ) ( not ( = ?auto_405280 ?auto_405285 ) ) ( not ( = ?auto_405280 ?auto_405286 ) ) ( not ( = ?auto_405280 ?auto_405287 ) ) ( not ( = ?auto_405280 ?auto_405288 ) ) ( not ( = ?auto_405280 ?auto_405289 ) ) ( not ( = ?auto_405280 ?auto_405290 ) ) ( not ( = ?auto_405280 ?auto_405291 ) ) ( not ( = ?auto_405280 ?auto_405292 ) ) ( not ( = ?auto_405281 ?auto_405282 ) ) ( not ( = ?auto_405281 ?auto_405283 ) ) ( not ( = ?auto_405281 ?auto_405284 ) ) ( not ( = ?auto_405281 ?auto_405285 ) ) ( not ( = ?auto_405281 ?auto_405286 ) ) ( not ( = ?auto_405281 ?auto_405287 ) ) ( not ( = ?auto_405281 ?auto_405288 ) ) ( not ( = ?auto_405281 ?auto_405289 ) ) ( not ( = ?auto_405281 ?auto_405290 ) ) ( not ( = ?auto_405281 ?auto_405291 ) ) ( not ( = ?auto_405281 ?auto_405292 ) ) ( not ( = ?auto_405282 ?auto_405283 ) ) ( not ( = ?auto_405282 ?auto_405284 ) ) ( not ( = ?auto_405282 ?auto_405285 ) ) ( not ( = ?auto_405282 ?auto_405286 ) ) ( not ( = ?auto_405282 ?auto_405287 ) ) ( not ( = ?auto_405282 ?auto_405288 ) ) ( not ( = ?auto_405282 ?auto_405289 ) ) ( not ( = ?auto_405282 ?auto_405290 ) ) ( not ( = ?auto_405282 ?auto_405291 ) ) ( not ( = ?auto_405282 ?auto_405292 ) ) ( not ( = ?auto_405283 ?auto_405284 ) ) ( not ( = ?auto_405283 ?auto_405285 ) ) ( not ( = ?auto_405283 ?auto_405286 ) ) ( not ( = ?auto_405283 ?auto_405287 ) ) ( not ( = ?auto_405283 ?auto_405288 ) ) ( not ( = ?auto_405283 ?auto_405289 ) ) ( not ( = ?auto_405283 ?auto_405290 ) ) ( not ( = ?auto_405283 ?auto_405291 ) ) ( not ( = ?auto_405283 ?auto_405292 ) ) ( not ( = ?auto_405284 ?auto_405285 ) ) ( not ( = ?auto_405284 ?auto_405286 ) ) ( not ( = ?auto_405284 ?auto_405287 ) ) ( not ( = ?auto_405284 ?auto_405288 ) ) ( not ( = ?auto_405284 ?auto_405289 ) ) ( not ( = ?auto_405284 ?auto_405290 ) ) ( not ( = ?auto_405284 ?auto_405291 ) ) ( not ( = ?auto_405284 ?auto_405292 ) ) ( not ( = ?auto_405285 ?auto_405286 ) ) ( not ( = ?auto_405285 ?auto_405287 ) ) ( not ( = ?auto_405285 ?auto_405288 ) ) ( not ( = ?auto_405285 ?auto_405289 ) ) ( not ( = ?auto_405285 ?auto_405290 ) ) ( not ( = ?auto_405285 ?auto_405291 ) ) ( not ( = ?auto_405285 ?auto_405292 ) ) ( not ( = ?auto_405286 ?auto_405287 ) ) ( not ( = ?auto_405286 ?auto_405288 ) ) ( not ( = ?auto_405286 ?auto_405289 ) ) ( not ( = ?auto_405286 ?auto_405290 ) ) ( not ( = ?auto_405286 ?auto_405291 ) ) ( not ( = ?auto_405286 ?auto_405292 ) ) ( not ( = ?auto_405287 ?auto_405288 ) ) ( not ( = ?auto_405287 ?auto_405289 ) ) ( not ( = ?auto_405287 ?auto_405290 ) ) ( not ( = ?auto_405287 ?auto_405291 ) ) ( not ( = ?auto_405287 ?auto_405292 ) ) ( not ( = ?auto_405288 ?auto_405289 ) ) ( not ( = ?auto_405288 ?auto_405290 ) ) ( not ( = ?auto_405288 ?auto_405291 ) ) ( not ( = ?auto_405288 ?auto_405292 ) ) ( not ( = ?auto_405289 ?auto_405290 ) ) ( not ( = ?auto_405289 ?auto_405291 ) ) ( not ( = ?auto_405289 ?auto_405292 ) ) ( not ( = ?auto_405290 ?auto_405291 ) ) ( not ( = ?auto_405290 ?auto_405292 ) ) ( not ( = ?auto_405291 ?auto_405292 ) ) ( ON ?auto_405290 ?auto_405291 ) ( ON ?auto_405289 ?auto_405290 ) ( CLEAR ?auto_405287 ) ( ON ?auto_405288 ?auto_405289 ) ( CLEAR ?auto_405288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_405279 ?auto_405280 ?auto_405281 ?auto_405282 ?auto_405283 ?auto_405284 ?auto_405285 ?auto_405286 ?auto_405287 ?auto_405288 )
      ( MAKE-13PILE ?auto_405279 ?auto_405280 ?auto_405281 ?auto_405282 ?auto_405283 ?auto_405284 ?auto_405285 ?auto_405286 ?auto_405287 ?auto_405288 ?auto_405289 ?auto_405290 ?auto_405291 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_405333 - BLOCK
      ?auto_405334 - BLOCK
      ?auto_405335 - BLOCK
      ?auto_405336 - BLOCK
      ?auto_405337 - BLOCK
      ?auto_405338 - BLOCK
      ?auto_405339 - BLOCK
      ?auto_405340 - BLOCK
      ?auto_405341 - BLOCK
      ?auto_405342 - BLOCK
      ?auto_405343 - BLOCK
      ?auto_405344 - BLOCK
      ?auto_405345 - BLOCK
    )
    :vars
    (
      ?auto_405346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_405345 ?auto_405346 ) ( ON-TABLE ?auto_405333 ) ( ON ?auto_405334 ?auto_405333 ) ( ON ?auto_405335 ?auto_405334 ) ( ON ?auto_405336 ?auto_405335 ) ( ON ?auto_405337 ?auto_405336 ) ( ON ?auto_405338 ?auto_405337 ) ( ON ?auto_405339 ?auto_405338 ) ( ON ?auto_405340 ?auto_405339 ) ( not ( = ?auto_405333 ?auto_405334 ) ) ( not ( = ?auto_405333 ?auto_405335 ) ) ( not ( = ?auto_405333 ?auto_405336 ) ) ( not ( = ?auto_405333 ?auto_405337 ) ) ( not ( = ?auto_405333 ?auto_405338 ) ) ( not ( = ?auto_405333 ?auto_405339 ) ) ( not ( = ?auto_405333 ?auto_405340 ) ) ( not ( = ?auto_405333 ?auto_405341 ) ) ( not ( = ?auto_405333 ?auto_405342 ) ) ( not ( = ?auto_405333 ?auto_405343 ) ) ( not ( = ?auto_405333 ?auto_405344 ) ) ( not ( = ?auto_405333 ?auto_405345 ) ) ( not ( = ?auto_405333 ?auto_405346 ) ) ( not ( = ?auto_405334 ?auto_405335 ) ) ( not ( = ?auto_405334 ?auto_405336 ) ) ( not ( = ?auto_405334 ?auto_405337 ) ) ( not ( = ?auto_405334 ?auto_405338 ) ) ( not ( = ?auto_405334 ?auto_405339 ) ) ( not ( = ?auto_405334 ?auto_405340 ) ) ( not ( = ?auto_405334 ?auto_405341 ) ) ( not ( = ?auto_405334 ?auto_405342 ) ) ( not ( = ?auto_405334 ?auto_405343 ) ) ( not ( = ?auto_405334 ?auto_405344 ) ) ( not ( = ?auto_405334 ?auto_405345 ) ) ( not ( = ?auto_405334 ?auto_405346 ) ) ( not ( = ?auto_405335 ?auto_405336 ) ) ( not ( = ?auto_405335 ?auto_405337 ) ) ( not ( = ?auto_405335 ?auto_405338 ) ) ( not ( = ?auto_405335 ?auto_405339 ) ) ( not ( = ?auto_405335 ?auto_405340 ) ) ( not ( = ?auto_405335 ?auto_405341 ) ) ( not ( = ?auto_405335 ?auto_405342 ) ) ( not ( = ?auto_405335 ?auto_405343 ) ) ( not ( = ?auto_405335 ?auto_405344 ) ) ( not ( = ?auto_405335 ?auto_405345 ) ) ( not ( = ?auto_405335 ?auto_405346 ) ) ( not ( = ?auto_405336 ?auto_405337 ) ) ( not ( = ?auto_405336 ?auto_405338 ) ) ( not ( = ?auto_405336 ?auto_405339 ) ) ( not ( = ?auto_405336 ?auto_405340 ) ) ( not ( = ?auto_405336 ?auto_405341 ) ) ( not ( = ?auto_405336 ?auto_405342 ) ) ( not ( = ?auto_405336 ?auto_405343 ) ) ( not ( = ?auto_405336 ?auto_405344 ) ) ( not ( = ?auto_405336 ?auto_405345 ) ) ( not ( = ?auto_405336 ?auto_405346 ) ) ( not ( = ?auto_405337 ?auto_405338 ) ) ( not ( = ?auto_405337 ?auto_405339 ) ) ( not ( = ?auto_405337 ?auto_405340 ) ) ( not ( = ?auto_405337 ?auto_405341 ) ) ( not ( = ?auto_405337 ?auto_405342 ) ) ( not ( = ?auto_405337 ?auto_405343 ) ) ( not ( = ?auto_405337 ?auto_405344 ) ) ( not ( = ?auto_405337 ?auto_405345 ) ) ( not ( = ?auto_405337 ?auto_405346 ) ) ( not ( = ?auto_405338 ?auto_405339 ) ) ( not ( = ?auto_405338 ?auto_405340 ) ) ( not ( = ?auto_405338 ?auto_405341 ) ) ( not ( = ?auto_405338 ?auto_405342 ) ) ( not ( = ?auto_405338 ?auto_405343 ) ) ( not ( = ?auto_405338 ?auto_405344 ) ) ( not ( = ?auto_405338 ?auto_405345 ) ) ( not ( = ?auto_405338 ?auto_405346 ) ) ( not ( = ?auto_405339 ?auto_405340 ) ) ( not ( = ?auto_405339 ?auto_405341 ) ) ( not ( = ?auto_405339 ?auto_405342 ) ) ( not ( = ?auto_405339 ?auto_405343 ) ) ( not ( = ?auto_405339 ?auto_405344 ) ) ( not ( = ?auto_405339 ?auto_405345 ) ) ( not ( = ?auto_405339 ?auto_405346 ) ) ( not ( = ?auto_405340 ?auto_405341 ) ) ( not ( = ?auto_405340 ?auto_405342 ) ) ( not ( = ?auto_405340 ?auto_405343 ) ) ( not ( = ?auto_405340 ?auto_405344 ) ) ( not ( = ?auto_405340 ?auto_405345 ) ) ( not ( = ?auto_405340 ?auto_405346 ) ) ( not ( = ?auto_405341 ?auto_405342 ) ) ( not ( = ?auto_405341 ?auto_405343 ) ) ( not ( = ?auto_405341 ?auto_405344 ) ) ( not ( = ?auto_405341 ?auto_405345 ) ) ( not ( = ?auto_405341 ?auto_405346 ) ) ( not ( = ?auto_405342 ?auto_405343 ) ) ( not ( = ?auto_405342 ?auto_405344 ) ) ( not ( = ?auto_405342 ?auto_405345 ) ) ( not ( = ?auto_405342 ?auto_405346 ) ) ( not ( = ?auto_405343 ?auto_405344 ) ) ( not ( = ?auto_405343 ?auto_405345 ) ) ( not ( = ?auto_405343 ?auto_405346 ) ) ( not ( = ?auto_405344 ?auto_405345 ) ) ( not ( = ?auto_405344 ?auto_405346 ) ) ( not ( = ?auto_405345 ?auto_405346 ) ) ( ON ?auto_405344 ?auto_405345 ) ( ON ?auto_405343 ?auto_405344 ) ( ON ?auto_405342 ?auto_405343 ) ( CLEAR ?auto_405340 ) ( ON ?auto_405341 ?auto_405342 ) ( CLEAR ?auto_405341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_405333 ?auto_405334 ?auto_405335 ?auto_405336 ?auto_405337 ?auto_405338 ?auto_405339 ?auto_405340 ?auto_405341 )
      ( MAKE-13PILE ?auto_405333 ?auto_405334 ?auto_405335 ?auto_405336 ?auto_405337 ?auto_405338 ?auto_405339 ?auto_405340 ?auto_405341 ?auto_405342 ?auto_405343 ?auto_405344 ?auto_405345 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_405387 - BLOCK
      ?auto_405388 - BLOCK
      ?auto_405389 - BLOCK
      ?auto_405390 - BLOCK
      ?auto_405391 - BLOCK
      ?auto_405392 - BLOCK
      ?auto_405393 - BLOCK
      ?auto_405394 - BLOCK
      ?auto_405395 - BLOCK
      ?auto_405396 - BLOCK
      ?auto_405397 - BLOCK
      ?auto_405398 - BLOCK
      ?auto_405399 - BLOCK
    )
    :vars
    (
      ?auto_405400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_405399 ?auto_405400 ) ( ON-TABLE ?auto_405387 ) ( ON ?auto_405388 ?auto_405387 ) ( ON ?auto_405389 ?auto_405388 ) ( ON ?auto_405390 ?auto_405389 ) ( ON ?auto_405391 ?auto_405390 ) ( ON ?auto_405392 ?auto_405391 ) ( ON ?auto_405393 ?auto_405392 ) ( not ( = ?auto_405387 ?auto_405388 ) ) ( not ( = ?auto_405387 ?auto_405389 ) ) ( not ( = ?auto_405387 ?auto_405390 ) ) ( not ( = ?auto_405387 ?auto_405391 ) ) ( not ( = ?auto_405387 ?auto_405392 ) ) ( not ( = ?auto_405387 ?auto_405393 ) ) ( not ( = ?auto_405387 ?auto_405394 ) ) ( not ( = ?auto_405387 ?auto_405395 ) ) ( not ( = ?auto_405387 ?auto_405396 ) ) ( not ( = ?auto_405387 ?auto_405397 ) ) ( not ( = ?auto_405387 ?auto_405398 ) ) ( not ( = ?auto_405387 ?auto_405399 ) ) ( not ( = ?auto_405387 ?auto_405400 ) ) ( not ( = ?auto_405388 ?auto_405389 ) ) ( not ( = ?auto_405388 ?auto_405390 ) ) ( not ( = ?auto_405388 ?auto_405391 ) ) ( not ( = ?auto_405388 ?auto_405392 ) ) ( not ( = ?auto_405388 ?auto_405393 ) ) ( not ( = ?auto_405388 ?auto_405394 ) ) ( not ( = ?auto_405388 ?auto_405395 ) ) ( not ( = ?auto_405388 ?auto_405396 ) ) ( not ( = ?auto_405388 ?auto_405397 ) ) ( not ( = ?auto_405388 ?auto_405398 ) ) ( not ( = ?auto_405388 ?auto_405399 ) ) ( not ( = ?auto_405388 ?auto_405400 ) ) ( not ( = ?auto_405389 ?auto_405390 ) ) ( not ( = ?auto_405389 ?auto_405391 ) ) ( not ( = ?auto_405389 ?auto_405392 ) ) ( not ( = ?auto_405389 ?auto_405393 ) ) ( not ( = ?auto_405389 ?auto_405394 ) ) ( not ( = ?auto_405389 ?auto_405395 ) ) ( not ( = ?auto_405389 ?auto_405396 ) ) ( not ( = ?auto_405389 ?auto_405397 ) ) ( not ( = ?auto_405389 ?auto_405398 ) ) ( not ( = ?auto_405389 ?auto_405399 ) ) ( not ( = ?auto_405389 ?auto_405400 ) ) ( not ( = ?auto_405390 ?auto_405391 ) ) ( not ( = ?auto_405390 ?auto_405392 ) ) ( not ( = ?auto_405390 ?auto_405393 ) ) ( not ( = ?auto_405390 ?auto_405394 ) ) ( not ( = ?auto_405390 ?auto_405395 ) ) ( not ( = ?auto_405390 ?auto_405396 ) ) ( not ( = ?auto_405390 ?auto_405397 ) ) ( not ( = ?auto_405390 ?auto_405398 ) ) ( not ( = ?auto_405390 ?auto_405399 ) ) ( not ( = ?auto_405390 ?auto_405400 ) ) ( not ( = ?auto_405391 ?auto_405392 ) ) ( not ( = ?auto_405391 ?auto_405393 ) ) ( not ( = ?auto_405391 ?auto_405394 ) ) ( not ( = ?auto_405391 ?auto_405395 ) ) ( not ( = ?auto_405391 ?auto_405396 ) ) ( not ( = ?auto_405391 ?auto_405397 ) ) ( not ( = ?auto_405391 ?auto_405398 ) ) ( not ( = ?auto_405391 ?auto_405399 ) ) ( not ( = ?auto_405391 ?auto_405400 ) ) ( not ( = ?auto_405392 ?auto_405393 ) ) ( not ( = ?auto_405392 ?auto_405394 ) ) ( not ( = ?auto_405392 ?auto_405395 ) ) ( not ( = ?auto_405392 ?auto_405396 ) ) ( not ( = ?auto_405392 ?auto_405397 ) ) ( not ( = ?auto_405392 ?auto_405398 ) ) ( not ( = ?auto_405392 ?auto_405399 ) ) ( not ( = ?auto_405392 ?auto_405400 ) ) ( not ( = ?auto_405393 ?auto_405394 ) ) ( not ( = ?auto_405393 ?auto_405395 ) ) ( not ( = ?auto_405393 ?auto_405396 ) ) ( not ( = ?auto_405393 ?auto_405397 ) ) ( not ( = ?auto_405393 ?auto_405398 ) ) ( not ( = ?auto_405393 ?auto_405399 ) ) ( not ( = ?auto_405393 ?auto_405400 ) ) ( not ( = ?auto_405394 ?auto_405395 ) ) ( not ( = ?auto_405394 ?auto_405396 ) ) ( not ( = ?auto_405394 ?auto_405397 ) ) ( not ( = ?auto_405394 ?auto_405398 ) ) ( not ( = ?auto_405394 ?auto_405399 ) ) ( not ( = ?auto_405394 ?auto_405400 ) ) ( not ( = ?auto_405395 ?auto_405396 ) ) ( not ( = ?auto_405395 ?auto_405397 ) ) ( not ( = ?auto_405395 ?auto_405398 ) ) ( not ( = ?auto_405395 ?auto_405399 ) ) ( not ( = ?auto_405395 ?auto_405400 ) ) ( not ( = ?auto_405396 ?auto_405397 ) ) ( not ( = ?auto_405396 ?auto_405398 ) ) ( not ( = ?auto_405396 ?auto_405399 ) ) ( not ( = ?auto_405396 ?auto_405400 ) ) ( not ( = ?auto_405397 ?auto_405398 ) ) ( not ( = ?auto_405397 ?auto_405399 ) ) ( not ( = ?auto_405397 ?auto_405400 ) ) ( not ( = ?auto_405398 ?auto_405399 ) ) ( not ( = ?auto_405398 ?auto_405400 ) ) ( not ( = ?auto_405399 ?auto_405400 ) ) ( ON ?auto_405398 ?auto_405399 ) ( ON ?auto_405397 ?auto_405398 ) ( ON ?auto_405396 ?auto_405397 ) ( ON ?auto_405395 ?auto_405396 ) ( CLEAR ?auto_405393 ) ( ON ?auto_405394 ?auto_405395 ) ( CLEAR ?auto_405394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_405387 ?auto_405388 ?auto_405389 ?auto_405390 ?auto_405391 ?auto_405392 ?auto_405393 ?auto_405394 )
      ( MAKE-13PILE ?auto_405387 ?auto_405388 ?auto_405389 ?auto_405390 ?auto_405391 ?auto_405392 ?auto_405393 ?auto_405394 ?auto_405395 ?auto_405396 ?auto_405397 ?auto_405398 ?auto_405399 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_405441 - BLOCK
      ?auto_405442 - BLOCK
      ?auto_405443 - BLOCK
      ?auto_405444 - BLOCK
      ?auto_405445 - BLOCK
      ?auto_405446 - BLOCK
      ?auto_405447 - BLOCK
      ?auto_405448 - BLOCK
      ?auto_405449 - BLOCK
      ?auto_405450 - BLOCK
      ?auto_405451 - BLOCK
      ?auto_405452 - BLOCK
      ?auto_405453 - BLOCK
    )
    :vars
    (
      ?auto_405454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_405453 ?auto_405454 ) ( ON-TABLE ?auto_405441 ) ( ON ?auto_405442 ?auto_405441 ) ( ON ?auto_405443 ?auto_405442 ) ( ON ?auto_405444 ?auto_405443 ) ( ON ?auto_405445 ?auto_405444 ) ( ON ?auto_405446 ?auto_405445 ) ( not ( = ?auto_405441 ?auto_405442 ) ) ( not ( = ?auto_405441 ?auto_405443 ) ) ( not ( = ?auto_405441 ?auto_405444 ) ) ( not ( = ?auto_405441 ?auto_405445 ) ) ( not ( = ?auto_405441 ?auto_405446 ) ) ( not ( = ?auto_405441 ?auto_405447 ) ) ( not ( = ?auto_405441 ?auto_405448 ) ) ( not ( = ?auto_405441 ?auto_405449 ) ) ( not ( = ?auto_405441 ?auto_405450 ) ) ( not ( = ?auto_405441 ?auto_405451 ) ) ( not ( = ?auto_405441 ?auto_405452 ) ) ( not ( = ?auto_405441 ?auto_405453 ) ) ( not ( = ?auto_405441 ?auto_405454 ) ) ( not ( = ?auto_405442 ?auto_405443 ) ) ( not ( = ?auto_405442 ?auto_405444 ) ) ( not ( = ?auto_405442 ?auto_405445 ) ) ( not ( = ?auto_405442 ?auto_405446 ) ) ( not ( = ?auto_405442 ?auto_405447 ) ) ( not ( = ?auto_405442 ?auto_405448 ) ) ( not ( = ?auto_405442 ?auto_405449 ) ) ( not ( = ?auto_405442 ?auto_405450 ) ) ( not ( = ?auto_405442 ?auto_405451 ) ) ( not ( = ?auto_405442 ?auto_405452 ) ) ( not ( = ?auto_405442 ?auto_405453 ) ) ( not ( = ?auto_405442 ?auto_405454 ) ) ( not ( = ?auto_405443 ?auto_405444 ) ) ( not ( = ?auto_405443 ?auto_405445 ) ) ( not ( = ?auto_405443 ?auto_405446 ) ) ( not ( = ?auto_405443 ?auto_405447 ) ) ( not ( = ?auto_405443 ?auto_405448 ) ) ( not ( = ?auto_405443 ?auto_405449 ) ) ( not ( = ?auto_405443 ?auto_405450 ) ) ( not ( = ?auto_405443 ?auto_405451 ) ) ( not ( = ?auto_405443 ?auto_405452 ) ) ( not ( = ?auto_405443 ?auto_405453 ) ) ( not ( = ?auto_405443 ?auto_405454 ) ) ( not ( = ?auto_405444 ?auto_405445 ) ) ( not ( = ?auto_405444 ?auto_405446 ) ) ( not ( = ?auto_405444 ?auto_405447 ) ) ( not ( = ?auto_405444 ?auto_405448 ) ) ( not ( = ?auto_405444 ?auto_405449 ) ) ( not ( = ?auto_405444 ?auto_405450 ) ) ( not ( = ?auto_405444 ?auto_405451 ) ) ( not ( = ?auto_405444 ?auto_405452 ) ) ( not ( = ?auto_405444 ?auto_405453 ) ) ( not ( = ?auto_405444 ?auto_405454 ) ) ( not ( = ?auto_405445 ?auto_405446 ) ) ( not ( = ?auto_405445 ?auto_405447 ) ) ( not ( = ?auto_405445 ?auto_405448 ) ) ( not ( = ?auto_405445 ?auto_405449 ) ) ( not ( = ?auto_405445 ?auto_405450 ) ) ( not ( = ?auto_405445 ?auto_405451 ) ) ( not ( = ?auto_405445 ?auto_405452 ) ) ( not ( = ?auto_405445 ?auto_405453 ) ) ( not ( = ?auto_405445 ?auto_405454 ) ) ( not ( = ?auto_405446 ?auto_405447 ) ) ( not ( = ?auto_405446 ?auto_405448 ) ) ( not ( = ?auto_405446 ?auto_405449 ) ) ( not ( = ?auto_405446 ?auto_405450 ) ) ( not ( = ?auto_405446 ?auto_405451 ) ) ( not ( = ?auto_405446 ?auto_405452 ) ) ( not ( = ?auto_405446 ?auto_405453 ) ) ( not ( = ?auto_405446 ?auto_405454 ) ) ( not ( = ?auto_405447 ?auto_405448 ) ) ( not ( = ?auto_405447 ?auto_405449 ) ) ( not ( = ?auto_405447 ?auto_405450 ) ) ( not ( = ?auto_405447 ?auto_405451 ) ) ( not ( = ?auto_405447 ?auto_405452 ) ) ( not ( = ?auto_405447 ?auto_405453 ) ) ( not ( = ?auto_405447 ?auto_405454 ) ) ( not ( = ?auto_405448 ?auto_405449 ) ) ( not ( = ?auto_405448 ?auto_405450 ) ) ( not ( = ?auto_405448 ?auto_405451 ) ) ( not ( = ?auto_405448 ?auto_405452 ) ) ( not ( = ?auto_405448 ?auto_405453 ) ) ( not ( = ?auto_405448 ?auto_405454 ) ) ( not ( = ?auto_405449 ?auto_405450 ) ) ( not ( = ?auto_405449 ?auto_405451 ) ) ( not ( = ?auto_405449 ?auto_405452 ) ) ( not ( = ?auto_405449 ?auto_405453 ) ) ( not ( = ?auto_405449 ?auto_405454 ) ) ( not ( = ?auto_405450 ?auto_405451 ) ) ( not ( = ?auto_405450 ?auto_405452 ) ) ( not ( = ?auto_405450 ?auto_405453 ) ) ( not ( = ?auto_405450 ?auto_405454 ) ) ( not ( = ?auto_405451 ?auto_405452 ) ) ( not ( = ?auto_405451 ?auto_405453 ) ) ( not ( = ?auto_405451 ?auto_405454 ) ) ( not ( = ?auto_405452 ?auto_405453 ) ) ( not ( = ?auto_405452 ?auto_405454 ) ) ( not ( = ?auto_405453 ?auto_405454 ) ) ( ON ?auto_405452 ?auto_405453 ) ( ON ?auto_405451 ?auto_405452 ) ( ON ?auto_405450 ?auto_405451 ) ( ON ?auto_405449 ?auto_405450 ) ( ON ?auto_405448 ?auto_405449 ) ( CLEAR ?auto_405446 ) ( ON ?auto_405447 ?auto_405448 ) ( CLEAR ?auto_405447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_405441 ?auto_405442 ?auto_405443 ?auto_405444 ?auto_405445 ?auto_405446 ?auto_405447 )
      ( MAKE-13PILE ?auto_405441 ?auto_405442 ?auto_405443 ?auto_405444 ?auto_405445 ?auto_405446 ?auto_405447 ?auto_405448 ?auto_405449 ?auto_405450 ?auto_405451 ?auto_405452 ?auto_405453 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_405495 - BLOCK
      ?auto_405496 - BLOCK
      ?auto_405497 - BLOCK
      ?auto_405498 - BLOCK
      ?auto_405499 - BLOCK
      ?auto_405500 - BLOCK
      ?auto_405501 - BLOCK
      ?auto_405502 - BLOCK
      ?auto_405503 - BLOCK
      ?auto_405504 - BLOCK
      ?auto_405505 - BLOCK
      ?auto_405506 - BLOCK
      ?auto_405507 - BLOCK
    )
    :vars
    (
      ?auto_405508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_405507 ?auto_405508 ) ( ON-TABLE ?auto_405495 ) ( ON ?auto_405496 ?auto_405495 ) ( ON ?auto_405497 ?auto_405496 ) ( ON ?auto_405498 ?auto_405497 ) ( ON ?auto_405499 ?auto_405498 ) ( not ( = ?auto_405495 ?auto_405496 ) ) ( not ( = ?auto_405495 ?auto_405497 ) ) ( not ( = ?auto_405495 ?auto_405498 ) ) ( not ( = ?auto_405495 ?auto_405499 ) ) ( not ( = ?auto_405495 ?auto_405500 ) ) ( not ( = ?auto_405495 ?auto_405501 ) ) ( not ( = ?auto_405495 ?auto_405502 ) ) ( not ( = ?auto_405495 ?auto_405503 ) ) ( not ( = ?auto_405495 ?auto_405504 ) ) ( not ( = ?auto_405495 ?auto_405505 ) ) ( not ( = ?auto_405495 ?auto_405506 ) ) ( not ( = ?auto_405495 ?auto_405507 ) ) ( not ( = ?auto_405495 ?auto_405508 ) ) ( not ( = ?auto_405496 ?auto_405497 ) ) ( not ( = ?auto_405496 ?auto_405498 ) ) ( not ( = ?auto_405496 ?auto_405499 ) ) ( not ( = ?auto_405496 ?auto_405500 ) ) ( not ( = ?auto_405496 ?auto_405501 ) ) ( not ( = ?auto_405496 ?auto_405502 ) ) ( not ( = ?auto_405496 ?auto_405503 ) ) ( not ( = ?auto_405496 ?auto_405504 ) ) ( not ( = ?auto_405496 ?auto_405505 ) ) ( not ( = ?auto_405496 ?auto_405506 ) ) ( not ( = ?auto_405496 ?auto_405507 ) ) ( not ( = ?auto_405496 ?auto_405508 ) ) ( not ( = ?auto_405497 ?auto_405498 ) ) ( not ( = ?auto_405497 ?auto_405499 ) ) ( not ( = ?auto_405497 ?auto_405500 ) ) ( not ( = ?auto_405497 ?auto_405501 ) ) ( not ( = ?auto_405497 ?auto_405502 ) ) ( not ( = ?auto_405497 ?auto_405503 ) ) ( not ( = ?auto_405497 ?auto_405504 ) ) ( not ( = ?auto_405497 ?auto_405505 ) ) ( not ( = ?auto_405497 ?auto_405506 ) ) ( not ( = ?auto_405497 ?auto_405507 ) ) ( not ( = ?auto_405497 ?auto_405508 ) ) ( not ( = ?auto_405498 ?auto_405499 ) ) ( not ( = ?auto_405498 ?auto_405500 ) ) ( not ( = ?auto_405498 ?auto_405501 ) ) ( not ( = ?auto_405498 ?auto_405502 ) ) ( not ( = ?auto_405498 ?auto_405503 ) ) ( not ( = ?auto_405498 ?auto_405504 ) ) ( not ( = ?auto_405498 ?auto_405505 ) ) ( not ( = ?auto_405498 ?auto_405506 ) ) ( not ( = ?auto_405498 ?auto_405507 ) ) ( not ( = ?auto_405498 ?auto_405508 ) ) ( not ( = ?auto_405499 ?auto_405500 ) ) ( not ( = ?auto_405499 ?auto_405501 ) ) ( not ( = ?auto_405499 ?auto_405502 ) ) ( not ( = ?auto_405499 ?auto_405503 ) ) ( not ( = ?auto_405499 ?auto_405504 ) ) ( not ( = ?auto_405499 ?auto_405505 ) ) ( not ( = ?auto_405499 ?auto_405506 ) ) ( not ( = ?auto_405499 ?auto_405507 ) ) ( not ( = ?auto_405499 ?auto_405508 ) ) ( not ( = ?auto_405500 ?auto_405501 ) ) ( not ( = ?auto_405500 ?auto_405502 ) ) ( not ( = ?auto_405500 ?auto_405503 ) ) ( not ( = ?auto_405500 ?auto_405504 ) ) ( not ( = ?auto_405500 ?auto_405505 ) ) ( not ( = ?auto_405500 ?auto_405506 ) ) ( not ( = ?auto_405500 ?auto_405507 ) ) ( not ( = ?auto_405500 ?auto_405508 ) ) ( not ( = ?auto_405501 ?auto_405502 ) ) ( not ( = ?auto_405501 ?auto_405503 ) ) ( not ( = ?auto_405501 ?auto_405504 ) ) ( not ( = ?auto_405501 ?auto_405505 ) ) ( not ( = ?auto_405501 ?auto_405506 ) ) ( not ( = ?auto_405501 ?auto_405507 ) ) ( not ( = ?auto_405501 ?auto_405508 ) ) ( not ( = ?auto_405502 ?auto_405503 ) ) ( not ( = ?auto_405502 ?auto_405504 ) ) ( not ( = ?auto_405502 ?auto_405505 ) ) ( not ( = ?auto_405502 ?auto_405506 ) ) ( not ( = ?auto_405502 ?auto_405507 ) ) ( not ( = ?auto_405502 ?auto_405508 ) ) ( not ( = ?auto_405503 ?auto_405504 ) ) ( not ( = ?auto_405503 ?auto_405505 ) ) ( not ( = ?auto_405503 ?auto_405506 ) ) ( not ( = ?auto_405503 ?auto_405507 ) ) ( not ( = ?auto_405503 ?auto_405508 ) ) ( not ( = ?auto_405504 ?auto_405505 ) ) ( not ( = ?auto_405504 ?auto_405506 ) ) ( not ( = ?auto_405504 ?auto_405507 ) ) ( not ( = ?auto_405504 ?auto_405508 ) ) ( not ( = ?auto_405505 ?auto_405506 ) ) ( not ( = ?auto_405505 ?auto_405507 ) ) ( not ( = ?auto_405505 ?auto_405508 ) ) ( not ( = ?auto_405506 ?auto_405507 ) ) ( not ( = ?auto_405506 ?auto_405508 ) ) ( not ( = ?auto_405507 ?auto_405508 ) ) ( ON ?auto_405506 ?auto_405507 ) ( ON ?auto_405505 ?auto_405506 ) ( ON ?auto_405504 ?auto_405505 ) ( ON ?auto_405503 ?auto_405504 ) ( ON ?auto_405502 ?auto_405503 ) ( ON ?auto_405501 ?auto_405502 ) ( CLEAR ?auto_405499 ) ( ON ?auto_405500 ?auto_405501 ) ( CLEAR ?auto_405500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_405495 ?auto_405496 ?auto_405497 ?auto_405498 ?auto_405499 ?auto_405500 )
      ( MAKE-13PILE ?auto_405495 ?auto_405496 ?auto_405497 ?auto_405498 ?auto_405499 ?auto_405500 ?auto_405501 ?auto_405502 ?auto_405503 ?auto_405504 ?auto_405505 ?auto_405506 ?auto_405507 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_405549 - BLOCK
      ?auto_405550 - BLOCK
      ?auto_405551 - BLOCK
      ?auto_405552 - BLOCK
      ?auto_405553 - BLOCK
      ?auto_405554 - BLOCK
      ?auto_405555 - BLOCK
      ?auto_405556 - BLOCK
      ?auto_405557 - BLOCK
      ?auto_405558 - BLOCK
      ?auto_405559 - BLOCK
      ?auto_405560 - BLOCK
      ?auto_405561 - BLOCK
    )
    :vars
    (
      ?auto_405562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_405561 ?auto_405562 ) ( ON-TABLE ?auto_405549 ) ( ON ?auto_405550 ?auto_405549 ) ( ON ?auto_405551 ?auto_405550 ) ( ON ?auto_405552 ?auto_405551 ) ( not ( = ?auto_405549 ?auto_405550 ) ) ( not ( = ?auto_405549 ?auto_405551 ) ) ( not ( = ?auto_405549 ?auto_405552 ) ) ( not ( = ?auto_405549 ?auto_405553 ) ) ( not ( = ?auto_405549 ?auto_405554 ) ) ( not ( = ?auto_405549 ?auto_405555 ) ) ( not ( = ?auto_405549 ?auto_405556 ) ) ( not ( = ?auto_405549 ?auto_405557 ) ) ( not ( = ?auto_405549 ?auto_405558 ) ) ( not ( = ?auto_405549 ?auto_405559 ) ) ( not ( = ?auto_405549 ?auto_405560 ) ) ( not ( = ?auto_405549 ?auto_405561 ) ) ( not ( = ?auto_405549 ?auto_405562 ) ) ( not ( = ?auto_405550 ?auto_405551 ) ) ( not ( = ?auto_405550 ?auto_405552 ) ) ( not ( = ?auto_405550 ?auto_405553 ) ) ( not ( = ?auto_405550 ?auto_405554 ) ) ( not ( = ?auto_405550 ?auto_405555 ) ) ( not ( = ?auto_405550 ?auto_405556 ) ) ( not ( = ?auto_405550 ?auto_405557 ) ) ( not ( = ?auto_405550 ?auto_405558 ) ) ( not ( = ?auto_405550 ?auto_405559 ) ) ( not ( = ?auto_405550 ?auto_405560 ) ) ( not ( = ?auto_405550 ?auto_405561 ) ) ( not ( = ?auto_405550 ?auto_405562 ) ) ( not ( = ?auto_405551 ?auto_405552 ) ) ( not ( = ?auto_405551 ?auto_405553 ) ) ( not ( = ?auto_405551 ?auto_405554 ) ) ( not ( = ?auto_405551 ?auto_405555 ) ) ( not ( = ?auto_405551 ?auto_405556 ) ) ( not ( = ?auto_405551 ?auto_405557 ) ) ( not ( = ?auto_405551 ?auto_405558 ) ) ( not ( = ?auto_405551 ?auto_405559 ) ) ( not ( = ?auto_405551 ?auto_405560 ) ) ( not ( = ?auto_405551 ?auto_405561 ) ) ( not ( = ?auto_405551 ?auto_405562 ) ) ( not ( = ?auto_405552 ?auto_405553 ) ) ( not ( = ?auto_405552 ?auto_405554 ) ) ( not ( = ?auto_405552 ?auto_405555 ) ) ( not ( = ?auto_405552 ?auto_405556 ) ) ( not ( = ?auto_405552 ?auto_405557 ) ) ( not ( = ?auto_405552 ?auto_405558 ) ) ( not ( = ?auto_405552 ?auto_405559 ) ) ( not ( = ?auto_405552 ?auto_405560 ) ) ( not ( = ?auto_405552 ?auto_405561 ) ) ( not ( = ?auto_405552 ?auto_405562 ) ) ( not ( = ?auto_405553 ?auto_405554 ) ) ( not ( = ?auto_405553 ?auto_405555 ) ) ( not ( = ?auto_405553 ?auto_405556 ) ) ( not ( = ?auto_405553 ?auto_405557 ) ) ( not ( = ?auto_405553 ?auto_405558 ) ) ( not ( = ?auto_405553 ?auto_405559 ) ) ( not ( = ?auto_405553 ?auto_405560 ) ) ( not ( = ?auto_405553 ?auto_405561 ) ) ( not ( = ?auto_405553 ?auto_405562 ) ) ( not ( = ?auto_405554 ?auto_405555 ) ) ( not ( = ?auto_405554 ?auto_405556 ) ) ( not ( = ?auto_405554 ?auto_405557 ) ) ( not ( = ?auto_405554 ?auto_405558 ) ) ( not ( = ?auto_405554 ?auto_405559 ) ) ( not ( = ?auto_405554 ?auto_405560 ) ) ( not ( = ?auto_405554 ?auto_405561 ) ) ( not ( = ?auto_405554 ?auto_405562 ) ) ( not ( = ?auto_405555 ?auto_405556 ) ) ( not ( = ?auto_405555 ?auto_405557 ) ) ( not ( = ?auto_405555 ?auto_405558 ) ) ( not ( = ?auto_405555 ?auto_405559 ) ) ( not ( = ?auto_405555 ?auto_405560 ) ) ( not ( = ?auto_405555 ?auto_405561 ) ) ( not ( = ?auto_405555 ?auto_405562 ) ) ( not ( = ?auto_405556 ?auto_405557 ) ) ( not ( = ?auto_405556 ?auto_405558 ) ) ( not ( = ?auto_405556 ?auto_405559 ) ) ( not ( = ?auto_405556 ?auto_405560 ) ) ( not ( = ?auto_405556 ?auto_405561 ) ) ( not ( = ?auto_405556 ?auto_405562 ) ) ( not ( = ?auto_405557 ?auto_405558 ) ) ( not ( = ?auto_405557 ?auto_405559 ) ) ( not ( = ?auto_405557 ?auto_405560 ) ) ( not ( = ?auto_405557 ?auto_405561 ) ) ( not ( = ?auto_405557 ?auto_405562 ) ) ( not ( = ?auto_405558 ?auto_405559 ) ) ( not ( = ?auto_405558 ?auto_405560 ) ) ( not ( = ?auto_405558 ?auto_405561 ) ) ( not ( = ?auto_405558 ?auto_405562 ) ) ( not ( = ?auto_405559 ?auto_405560 ) ) ( not ( = ?auto_405559 ?auto_405561 ) ) ( not ( = ?auto_405559 ?auto_405562 ) ) ( not ( = ?auto_405560 ?auto_405561 ) ) ( not ( = ?auto_405560 ?auto_405562 ) ) ( not ( = ?auto_405561 ?auto_405562 ) ) ( ON ?auto_405560 ?auto_405561 ) ( ON ?auto_405559 ?auto_405560 ) ( ON ?auto_405558 ?auto_405559 ) ( ON ?auto_405557 ?auto_405558 ) ( ON ?auto_405556 ?auto_405557 ) ( ON ?auto_405555 ?auto_405556 ) ( ON ?auto_405554 ?auto_405555 ) ( CLEAR ?auto_405552 ) ( ON ?auto_405553 ?auto_405554 ) ( CLEAR ?auto_405553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_405549 ?auto_405550 ?auto_405551 ?auto_405552 ?auto_405553 )
      ( MAKE-13PILE ?auto_405549 ?auto_405550 ?auto_405551 ?auto_405552 ?auto_405553 ?auto_405554 ?auto_405555 ?auto_405556 ?auto_405557 ?auto_405558 ?auto_405559 ?auto_405560 ?auto_405561 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_405603 - BLOCK
      ?auto_405604 - BLOCK
      ?auto_405605 - BLOCK
      ?auto_405606 - BLOCK
      ?auto_405607 - BLOCK
      ?auto_405608 - BLOCK
      ?auto_405609 - BLOCK
      ?auto_405610 - BLOCK
      ?auto_405611 - BLOCK
      ?auto_405612 - BLOCK
      ?auto_405613 - BLOCK
      ?auto_405614 - BLOCK
      ?auto_405615 - BLOCK
    )
    :vars
    (
      ?auto_405616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_405615 ?auto_405616 ) ( ON-TABLE ?auto_405603 ) ( ON ?auto_405604 ?auto_405603 ) ( ON ?auto_405605 ?auto_405604 ) ( not ( = ?auto_405603 ?auto_405604 ) ) ( not ( = ?auto_405603 ?auto_405605 ) ) ( not ( = ?auto_405603 ?auto_405606 ) ) ( not ( = ?auto_405603 ?auto_405607 ) ) ( not ( = ?auto_405603 ?auto_405608 ) ) ( not ( = ?auto_405603 ?auto_405609 ) ) ( not ( = ?auto_405603 ?auto_405610 ) ) ( not ( = ?auto_405603 ?auto_405611 ) ) ( not ( = ?auto_405603 ?auto_405612 ) ) ( not ( = ?auto_405603 ?auto_405613 ) ) ( not ( = ?auto_405603 ?auto_405614 ) ) ( not ( = ?auto_405603 ?auto_405615 ) ) ( not ( = ?auto_405603 ?auto_405616 ) ) ( not ( = ?auto_405604 ?auto_405605 ) ) ( not ( = ?auto_405604 ?auto_405606 ) ) ( not ( = ?auto_405604 ?auto_405607 ) ) ( not ( = ?auto_405604 ?auto_405608 ) ) ( not ( = ?auto_405604 ?auto_405609 ) ) ( not ( = ?auto_405604 ?auto_405610 ) ) ( not ( = ?auto_405604 ?auto_405611 ) ) ( not ( = ?auto_405604 ?auto_405612 ) ) ( not ( = ?auto_405604 ?auto_405613 ) ) ( not ( = ?auto_405604 ?auto_405614 ) ) ( not ( = ?auto_405604 ?auto_405615 ) ) ( not ( = ?auto_405604 ?auto_405616 ) ) ( not ( = ?auto_405605 ?auto_405606 ) ) ( not ( = ?auto_405605 ?auto_405607 ) ) ( not ( = ?auto_405605 ?auto_405608 ) ) ( not ( = ?auto_405605 ?auto_405609 ) ) ( not ( = ?auto_405605 ?auto_405610 ) ) ( not ( = ?auto_405605 ?auto_405611 ) ) ( not ( = ?auto_405605 ?auto_405612 ) ) ( not ( = ?auto_405605 ?auto_405613 ) ) ( not ( = ?auto_405605 ?auto_405614 ) ) ( not ( = ?auto_405605 ?auto_405615 ) ) ( not ( = ?auto_405605 ?auto_405616 ) ) ( not ( = ?auto_405606 ?auto_405607 ) ) ( not ( = ?auto_405606 ?auto_405608 ) ) ( not ( = ?auto_405606 ?auto_405609 ) ) ( not ( = ?auto_405606 ?auto_405610 ) ) ( not ( = ?auto_405606 ?auto_405611 ) ) ( not ( = ?auto_405606 ?auto_405612 ) ) ( not ( = ?auto_405606 ?auto_405613 ) ) ( not ( = ?auto_405606 ?auto_405614 ) ) ( not ( = ?auto_405606 ?auto_405615 ) ) ( not ( = ?auto_405606 ?auto_405616 ) ) ( not ( = ?auto_405607 ?auto_405608 ) ) ( not ( = ?auto_405607 ?auto_405609 ) ) ( not ( = ?auto_405607 ?auto_405610 ) ) ( not ( = ?auto_405607 ?auto_405611 ) ) ( not ( = ?auto_405607 ?auto_405612 ) ) ( not ( = ?auto_405607 ?auto_405613 ) ) ( not ( = ?auto_405607 ?auto_405614 ) ) ( not ( = ?auto_405607 ?auto_405615 ) ) ( not ( = ?auto_405607 ?auto_405616 ) ) ( not ( = ?auto_405608 ?auto_405609 ) ) ( not ( = ?auto_405608 ?auto_405610 ) ) ( not ( = ?auto_405608 ?auto_405611 ) ) ( not ( = ?auto_405608 ?auto_405612 ) ) ( not ( = ?auto_405608 ?auto_405613 ) ) ( not ( = ?auto_405608 ?auto_405614 ) ) ( not ( = ?auto_405608 ?auto_405615 ) ) ( not ( = ?auto_405608 ?auto_405616 ) ) ( not ( = ?auto_405609 ?auto_405610 ) ) ( not ( = ?auto_405609 ?auto_405611 ) ) ( not ( = ?auto_405609 ?auto_405612 ) ) ( not ( = ?auto_405609 ?auto_405613 ) ) ( not ( = ?auto_405609 ?auto_405614 ) ) ( not ( = ?auto_405609 ?auto_405615 ) ) ( not ( = ?auto_405609 ?auto_405616 ) ) ( not ( = ?auto_405610 ?auto_405611 ) ) ( not ( = ?auto_405610 ?auto_405612 ) ) ( not ( = ?auto_405610 ?auto_405613 ) ) ( not ( = ?auto_405610 ?auto_405614 ) ) ( not ( = ?auto_405610 ?auto_405615 ) ) ( not ( = ?auto_405610 ?auto_405616 ) ) ( not ( = ?auto_405611 ?auto_405612 ) ) ( not ( = ?auto_405611 ?auto_405613 ) ) ( not ( = ?auto_405611 ?auto_405614 ) ) ( not ( = ?auto_405611 ?auto_405615 ) ) ( not ( = ?auto_405611 ?auto_405616 ) ) ( not ( = ?auto_405612 ?auto_405613 ) ) ( not ( = ?auto_405612 ?auto_405614 ) ) ( not ( = ?auto_405612 ?auto_405615 ) ) ( not ( = ?auto_405612 ?auto_405616 ) ) ( not ( = ?auto_405613 ?auto_405614 ) ) ( not ( = ?auto_405613 ?auto_405615 ) ) ( not ( = ?auto_405613 ?auto_405616 ) ) ( not ( = ?auto_405614 ?auto_405615 ) ) ( not ( = ?auto_405614 ?auto_405616 ) ) ( not ( = ?auto_405615 ?auto_405616 ) ) ( ON ?auto_405614 ?auto_405615 ) ( ON ?auto_405613 ?auto_405614 ) ( ON ?auto_405612 ?auto_405613 ) ( ON ?auto_405611 ?auto_405612 ) ( ON ?auto_405610 ?auto_405611 ) ( ON ?auto_405609 ?auto_405610 ) ( ON ?auto_405608 ?auto_405609 ) ( ON ?auto_405607 ?auto_405608 ) ( CLEAR ?auto_405605 ) ( ON ?auto_405606 ?auto_405607 ) ( CLEAR ?auto_405606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_405603 ?auto_405604 ?auto_405605 ?auto_405606 )
      ( MAKE-13PILE ?auto_405603 ?auto_405604 ?auto_405605 ?auto_405606 ?auto_405607 ?auto_405608 ?auto_405609 ?auto_405610 ?auto_405611 ?auto_405612 ?auto_405613 ?auto_405614 ?auto_405615 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_405657 - BLOCK
      ?auto_405658 - BLOCK
      ?auto_405659 - BLOCK
      ?auto_405660 - BLOCK
      ?auto_405661 - BLOCK
      ?auto_405662 - BLOCK
      ?auto_405663 - BLOCK
      ?auto_405664 - BLOCK
      ?auto_405665 - BLOCK
      ?auto_405666 - BLOCK
      ?auto_405667 - BLOCK
      ?auto_405668 - BLOCK
      ?auto_405669 - BLOCK
    )
    :vars
    (
      ?auto_405670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_405669 ?auto_405670 ) ( ON-TABLE ?auto_405657 ) ( ON ?auto_405658 ?auto_405657 ) ( not ( = ?auto_405657 ?auto_405658 ) ) ( not ( = ?auto_405657 ?auto_405659 ) ) ( not ( = ?auto_405657 ?auto_405660 ) ) ( not ( = ?auto_405657 ?auto_405661 ) ) ( not ( = ?auto_405657 ?auto_405662 ) ) ( not ( = ?auto_405657 ?auto_405663 ) ) ( not ( = ?auto_405657 ?auto_405664 ) ) ( not ( = ?auto_405657 ?auto_405665 ) ) ( not ( = ?auto_405657 ?auto_405666 ) ) ( not ( = ?auto_405657 ?auto_405667 ) ) ( not ( = ?auto_405657 ?auto_405668 ) ) ( not ( = ?auto_405657 ?auto_405669 ) ) ( not ( = ?auto_405657 ?auto_405670 ) ) ( not ( = ?auto_405658 ?auto_405659 ) ) ( not ( = ?auto_405658 ?auto_405660 ) ) ( not ( = ?auto_405658 ?auto_405661 ) ) ( not ( = ?auto_405658 ?auto_405662 ) ) ( not ( = ?auto_405658 ?auto_405663 ) ) ( not ( = ?auto_405658 ?auto_405664 ) ) ( not ( = ?auto_405658 ?auto_405665 ) ) ( not ( = ?auto_405658 ?auto_405666 ) ) ( not ( = ?auto_405658 ?auto_405667 ) ) ( not ( = ?auto_405658 ?auto_405668 ) ) ( not ( = ?auto_405658 ?auto_405669 ) ) ( not ( = ?auto_405658 ?auto_405670 ) ) ( not ( = ?auto_405659 ?auto_405660 ) ) ( not ( = ?auto_405659 ?auto_405661 ) ) ( not ( = ?auto_405659 ?auto_405662 ) ) ( not ( = ?auto_405659 ?auto_405663 ) ) ( not ( = ?auto_405659 ?auto_405664 ) ) ( not ( = ?auto_405659 ?auto_405665 ) ) ( not ( = ?auto_405659 ?auto_405666 ) ) ( not ( = ?auto_405659 ?auto_405667 ) ) ( not ( = ?auto_405659 ?auto_405668 ) ) ( not ( = ?auto_405659 ?auto_405669 ) ) ( not ( = ?auto_405659 ?auto_405670 ) ) ( not ( = ?auto_405660 ?auto_405661 ) ) ( not ( = ?auto_405660 ?auto_405662 ) ) ( not ( = ?auto_405660 ?auto_405663 ) ) ( not ( = ?auto_405660 ?auto_405664 ) ) ( not ( = ?auto_405660 ?auto_405665 ) ) ( not ( = ?auto_405660 ?auto_405666 ) ) ( not ( = ?auto_405660 ?auto_405667 ) ) ( not ( = ?auto_405660 ?auto_405668 ) ) ( not ( = ?auto_405660 ?auto_405669 ) ) ( not ( = ?auto_405660 ?auto_405670 ) ) ( not ( = ?auto_405661 ?auto_405662 ) ) ( not ( = ?auto_405661 ?auto_405663 ) ) ( not ( = ?auto_405661 ?auto_405664 ) ) ( not ( = ?auto_405661 ?auto_405665 ) ) ( not ( = ?auto_405661 ?auto_405666 ) ) ( not ( = ?auto_405661 ?auto_405667 ) ) ( not ( = ?auto_405661 ?auto_405668 ) ) ( not ( = ?auto_405661 ?auto_405669 ) ) ( not ( = ?auto_405661 ?auto_405670 ) ) ( not ( = ?auto_405662 ?auto_405663 ) ) ( not ( = ?auto_405662 ?auto_405664 ) ) ( not ( = ?auto_405662 ?auto_405665 ) ) ( not ( = ?auto_405662 ?auto_405666 ) ) ( not ( = ?auto_405662 ?auto_405667 ) ) ( not ( = ?auto_405662 ?auto_405668 ) ) ( not ( = ?auto_405662 ?auto_405669 ) ) ( not ( = ?auto_405662 ?auto_405670 ) ) ( not ( = ?auto_405663 ?auto_405664 ) ) ( not ( = ?auto_405663 ?auto_405665 ) ) ( not ( = ?auto_405663 ?auto_405666 ) ) ( not ( = ?auto_405663 ?auto_405667 ) ) ( not ( = ?auto_405663 ?auto_405668 ) ) ( not ( = ?auto_405663 ?auto_405669 ) ) ( not ( = ?auto_405663 ?auto_405670 ) ) ( not ( = ?auto_405664 ?auto_405665 ) ) ( not ( = ?auto_405664 ?auto_405666 ) ) ( not ( = ?auto_405664 ?auto_405667 ) ) ( not ( = ?auto_405664 ?auto_405668 ) ) ( not ( = ?auto_405664 ?auto_405669 ) ) ( not ( = ?auto_405664 ?auto_405670 ) ) ( not ( = ?auto_405665 ?auto_405666 ) ) ( not ( = ?auto_405665 ?auto_405667 ) ) ( not ( = ?auto_405665 ?auto_405668 ) ) ( not ( = ?auto_405665 ?auto_405669 ) ) ( not ( = ?auto_405665 ?auto_405670 ) ) ( not ( = ?auto_405666 ?auto_405667 ) ) ( not ( = ?auto_405666 ?auto_405668 ) ) ( not ( = ?auto_405666 ?auto_405669 ) ) ( not ( = ?auto_405666 ?auto_405670 ) ) ( not ( = ?auto_405667 ?auto_405668 ) ) ( not ( = ?auto_405667 ?auto_405669 ) ) ( not ( = ?auto_405667 ?auto_405670 ) ) ( not ( = ?auto_405668 ?auto_405669 ) ) ( not ( = ?auto_405668 ?auto_405670 ) ) ( not ( = ?auto_405669 ?auto_405670 ) ) ( ON ?auto_405668 ?auto_405669 ) ( ON ?auto_405667 ?auto_405668 ) ( ON ?auto_405666 ?auto_405667 ) ( ON ?auto_405665 ?auto_405666 ) ( ON ?auto_405664 ?auto_405665 ) ( ON ?auto_405663 ?auto_405664 ) ( ON ?auto_405662 ?auto_405663 ) ( ON ?auto_405661 ?auto_405662 ) ( ON ?auto_405660 ?auto_405661 ) ( CLEAR ?auto_405658 ) ( ON ?auto_405659 ?auto_405660 ) ( CLEAR ?auto_405659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_405657 ?auto_405658 ?auto_405659 )
      ( MAKE-13PILE ?auto_405657 ?auto_405658 ?auto_405659 ?auto_405660 ?auto_405661 ?auto_405662 ?auto_405663 ?auto_405664 ?auto_405665 ?auto_405666 ?auto_405667 ?auto_405668 ?auto_405669 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_405711 - BLOCK
      ?auto_405712 - BLOCK
      ?auto_405713 - BLOCK
      ?auto_405714 - BLOCK
      ?auto_405715 - BLOCK
      ?auto_405716 - BLOCK
      ?auto_405717 - BLOCK
      ?auto_405718 - BLOCK
      ?auto_405719 - BLOCK
      ?auto_405720 - BLOCK
      ?auto_405721 - BLOCK
      ?auto_405722 - BLOCK
      ?auto_405723 - BLOCK
    )
    :vars
    (
      ?auto_405724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_405723 ?auto_405724 ) ( ON-TABLE ?auto_405711 ) ( not ( = ?auto_405711 ?auto_405712 ) ) ( not ( = ?auto_405711 ?auto_405713 ) ) ( not ( = ?auto_405711 ?auto_405714 ) ) ( not ( = ?auto_405711 ?auto_405715 ) ) ( not ( = ?auto_405711 ?auto_405716 ) ) ( not ( = ?auto_405711 ?auto_405717 ) ) ( not ( = ?auto_405711 ?auto_405718 ) ) ( not ( = ?auto_405711 ?auto_405719 ) ) ( not ( = ?auto_405711 ?auto_405720 ) ) ( not ( = ?auto_405711 ?auto_405721 ) ) ( not ( = ?auto_405711 ?auto_405722 ) ) ( not ( = ?auto_405711 ?auto_405723 ) ) ( not ( = ?auto_405711 ?auto_405724 ) ) ( not ( = ?auto_405712 ?auto_405713 ) ) ( not ( = ?auto_405712 ?auto_405714 ) ) ( not ( = ?auto_405712 ?auto_405715 ) ) ( not ( = ?auto_405712 ?auto_405716 ) ) ( not ( = ?auto_405712 ?auto_405717 ) ) ( not ( = ?auto_405712 ?auto_405718 ) ) ( not ( = ?auto_405712 ?auto_405719 ) ) ( not ( = ?auto_405712 ?auto_405720 ) ) ( not ( = ?auto_405712 ?auto_405721 ) ) ( not ( = ?auto_405712 ?auto_405722 ) ) ( not ( = ?auto_405712 ?auto_405723 ) ) ( not ( = ?auto_405712 ?auto_405724 ) ) ( not ( = ?auto_405713 ?auto_405714 ) ) ( not ( = ?auto_405713 ?auto_405715 ) ) ( not ( = ?auto_405713 ?auto_405716 ) ) ( not ( = ?auto_405713 ?auto_405717 ) ) ( not ( = ?auto_405713 ?auto_405718 ) ) ( not ( = ?auto_405713 ?auto_405719 ) ) ( not ( = ?auto_405713 ?auto_405720 ) ) ( not ( = ?auto_405713 ?auto_405721 ) ) ( not ( = ?auto_405713 ?auto_405722 ) ) ( not ( = ?auto_405713 ?auto_405723 ) ) ( not ( = ?auto_405713 ?auto_405724 ) ) ( not ( = ?auto_405714 ?auto_405715 ) ) ( not ( = ?auto_405714 ?auto_405716 ) ) ( not ( = ?auto_405714 ?auto_405717 ) ) ( not ( = ?auto_405714 ?auto_405718 ) ) ( not ( = ?auto_405714 ?auto_405719 ) ) ( not ( = ?auto_405714 ?auto_405720 ) ) ( not ( = ?auto_405714 ?auto_405721 ) ) ( not ( = ?auto_405714 ?auto_405722 ) ) ( not ( = ?auto_405714 ?auto_405723 ) ) ( not ( = ?auto_405714 ?auto_405724 ) ) ( not ( = ?auto_405715 ?auto_405716 ) ) ( not ( = ?auto_405715 ?auto_405717 ) ) ( not ( = ?auto_405715 ?auto_405718 ) ) ( not ( = ?auto_405715 ?auto_405719 ) ) ( not ( = ?auto_405715 ?auto_405720 ) ) ( not ( = ?auto_405715 ?auto_405721 ) ) ( not ( = ?auto_405715 ?auto_405722 ) ) ( not ( = ?auto_405715 ?auto_405723 ) ) ( not ( = ?auto_405715 ?auto_405724 ) ) ( not ( = ?auto_405716 ?auto_405717 ) ) ( not ( = ?auto_405716 ?auto_405718 ) ) ( not ( = ?auto_405716 ?auto_405719 ) ) ( not ( = ?auto_405716 ?auto_405720 ) ) ( not ( = ?auto_405716 ?auto_405721 ) ) ( not ( = ?auto_405716 ?auto_405722 ) ) ( not ( = ?auto_405716 ?auto_405723 ) ) ( not ( = ?auto_405716 ?auto_405724 ) ) ( not ( = ?auto_405717 ?auto_405718 ) ) ( not ( = ?auto_405717 ?auto_405719 ) ) ( not ( = ?auto_405717 ?auto_405720 ) ) ( not ( = ?auto_405717 ?auto_405721 ) ) ( not ( = ?auto_405717 ?auto_405722 ) ) ( not ( = ?auto_405717 ?auto_405723 ) ) ( not ( = ?auto_405717 ?auto_405724 ) ) ( not ( = ?auto_405718 ?auto_405719 ) ) ( not ( = ?auto_405718 ?auto_405720 ) ) ( not ( = ?auto_405718 ?auto_405721 ) ) ( not ( = ?auto_405718 ?auto_405722 ) ) ( not ( = ?auto_405718 ?auto_405723 ) ) ( not ( = ?auto_405718 ?auto_405724 ) ) ( not ( = ?auto_405719 ?auto_405720 ) ) ( not ( = ?auto_405719 ?auto_405721 ) ) ( not ( = ?auto_405719 ?auto_405722 ) ) ( not ( = ?auto_405719 ?auto_405723 ) ) ( not ( = ?auto_405719 ?auto_405724 ) ) ( not ( = ?auto_405720 ?auto_405721 ) ) ( not ( = ?auto_405720 ?auto_405722 ) ) ( not ( = ?auto_405720 ?auto_405723 ) ) ( not ( = ?auto_405720 ?auto_405724 ) ) ( not ( = ?auto_405721 ?auto_405722 ) ) ( not ( = ?auto_405721 ?auto_405723 ) ) ( not ( = ?auto_405721 ?auto_405724 ) ) ( not ( = ?auto_405722 ?auto_405723 ) ) ( not ( = ?auto_405722 ?auto_405724 ) ) ( not ( = ?auto_405723 ?auto_405724 ) ) ( ON ?auto_405722 ?auto_405723 ) ( ON ?auto_405721 ?auto_405722 ) ( ON ?auto_405720 ?auto_405721 ) ( ON ?auto_405719 ?auto_405720 ) ( ON ?auto_405718 ?auto_405719 ) ( ON ?auto_405717 ?auto_405718 ) ( ON ?auto_405716 ?auto_405717 ) ( ON ?auto_405715 ?auto_405716 ) ( ON ?auto_405714 ?auto_405715 ) ( ON ?auto_405713 ?auto_405714 ) ( CLEAR ?auto_405711 ) ( ON ?auto_405712 ?auto_405713 ) ( CLEAR ?auto_405712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_405711 ?auto_405712 )
      ( MAKE-13PILE ?auto_405711 ?auto_405712 ?auto_405713 ?auto_405714 ?auto_405715 ?auto_405716 ?auto_405717 ?auto_405718 ?auto_405719 ?auto_405720 ?auto_405721 ?auto_405722 ?auto_405723 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_405765 - BLOCK
      ?auto_405766 - BLOCK
      ?auto_405767 - BLOCK
      ?auto_405768 - BLOCK
      ?auto_405769 - BLOCK
      ?auto_405770 - BLOCK
      ?auto_405771 - BLOCK
      ?auto_405772 - BLOCK
      ?auto_405773 - BLOCK
      ?auto_405774 - BLOCK
      ?auto_405775 - BLOCK
      ?auto_405776 - BLOCK
      ?auto_405777 - BLOCK
    )
    :vars
    (
      ?auto_405778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_405777 ?auto_405778 ) ( not ( = ?auto_405765 ?auto_405766 ) ) ( not ( = ?auto_405765 ?auto_405767 ) ) ( not ( = ?auto_405765 ?auto_405768 ) ) ( not ( = ?auto_405765 ?auto_405769 ) ) ( not ( = ?auto_405765 ?auto_405770 ) ) ( not ( = ?auto_405765 ?auto_405771 ) ) ( not ( = ?auto_405765 ?auto_405772 ) ) ( not ( = ?auto_405765 ?auto_405773 ) ) ( not ( = ?auto_405765 ?auto_405774 ) ) ( not ( = ?auto_405765 ?auto_405775 ) ) ( not ( = ?auto_405765 ?auto_405776 ) ) ( not ( = ?auto_405765 ?auto_405777 ) ) ( not ( = ?auto_405765 ?auto_405778 ) ) ( not ( = ?auto_405766 ?auto_405767 ) ) ( not ( = ?auto_405766 ?auto_405768 ) ) ( not ( = ?auto_405766 ?auto_405769 ) ) ( not ( = ?auto_405766 ?auto_405770 ) ) ( not ( = ?auto_405766 ?auto_405771 ) ) ( not ( = ?auto_405766 ?auto_405772 ) ) ( not ( = ?auto_405766 ?auto_405773 ) ) ( not ( = ?auto_405766 ?auto_405774 ) ) ( not ( = ?auto_405766 ?auto_405775 ) ) ( not ( = ?auto_405766 ?auto_405776 ) ) ( not ( = ?auto_405766 ?auto_405777 ) ) ( not ( = ?auto_405766 ?auto_405778 ) ) ( not ( = ?auto_405767 ?auto_405768 ) ) ( not ( = ?auto_405767 ?auto_405769 ) ) ( not ( = ?auto_405767 ?auto_405770 ) ) ( not ( = ?auto_405767 ?auto_405771 ) ) ( not ( = ?auto_405767 ?auto_405772 ) ) ( not ( = ?auto_405767 ?auto_405773 ) ) ( not ( = ?auto_405767 ?auto_405774 ) ) ( not ( = ?auto_405767 ?auto_405775 ) ) ( not ( = ?auto_405767 ?auto_405776 ) ) ( not ( = ?auto_405767 ?auto_405777 ) ) ( not ( = ?auto_405767 ?auto_405778 ) ) ( not ( = ?auto_405768 ?auto_405769 ) ) ( not ( = ?auto_405768 ?auto_405770 ) ) ( not ( = ?auto_405768 ?auto_405771 ) ) ( not ( = ?auto_405768 ?auto_405772 ) ) ( not ( = ?auto_405768 ?auto_405773 ) ) ( not ( = ?auto_405768 ?auto_405774 ) ) ( not ( = ?auto_405768 ?auto_405775 ) ) ( not ( = ?auto_405768 ?auto_405776 ) ) ( not ( = ?auto_405768 ?auto_405777 ) ) ( not ( = ?auto_405768 ?auto_405778 ) ) ( not ( = ?auto_405769 ?auto_405770 ) ) ( not ( = ?auto_405769 ?auto_405771 ) ) ( not ( = ?auto_405769 ?auto_405772 ) ) ( not ( = ?auto_405769 ?auto_405773 ) ) ( not ( = ?auto_405769 ?auto_405774 ) ) ( not ( = ?auto_405769 ?auto_405775 ) ) ( not ( = ?auto_405769 ?auto_405776 ) ) ( not ( = ?auto_405769 ?auto_405777 ) ) ( not ( = ?auto_405769 ?auto_405778 ) ) ( not ( = ?auto_405770 ?auto_405771 ) ) ( not ( = ?auto_405770 ?auto_405772 ) ) ( not ( = ?auto_405770 ?auto_405773 ) ) ( not ( = ?auto_405770 ?auto_405774 ) ) ( not ( = ?auto_405770 ?auto_405775 ) ) ( not ( = ?auto_405770 ?auto_405776 ) ) ( not ( = ?auto_405770 ?auto_405777 ) ) ( not ( = ?auto_405770 ?auto_405778 ) ) ( not ( = ?auto_405771 ?auto_405772 ) ) ( not ( = ?auto_405771 ?auto_405773 ) ) ( not ( = ?auto_405771 ?auto_405774 ) ) ( not ( = ?auto_405771 ?auto_405775 ) ) ( not ( = ?auto_405771 ?auto_405776 ) ) ( not ( = ?auto_405771 ?auto_405777 ) ) ( not ( = ?auto_405771 ?auto_405778 ) ) ( not ( = ?auto_405772 ?auto_405773 ) ) ( not ( = ?auto_405772 ?auto_405774 ) ) ( not ( = ?auto_405772 ?auto_405775 ) ) ( not ( = ?auto_405772 ?auto_405776 ) ) ( not ( = ?auto_405772 ?auto_405777 ) ) ( not ( = ?auto_405772 ?auto_405778 ) ) ( not ( = ?auto_405773 ?auto_405774 ) ) ( not ( = ?auto_405773 ?auto_405775 ) ) ( not ( = ?auto_405773 ?auto_405776 ) ) ( not ( = ?auto_405773 ?auto_405777 ) ) ( not ( = ?auto_405773 ?auto_405778 ) ) ( not ( = ?auto_405774 ?auto_405775 ) ) ( not ( = ?auto_405774 ?auto_405776 ) ) ( not ( = ?auto_405774 ?auto_405777 ) ) ( not ( = ?auto_405774 ?auto_405778 ) ) ( not ( = ?auto_405775 ?auto_405776 ) ) ( not ( = ?auto_405775 ?auto_405777 ) ) ( not ( = ?auto_405775 ?auto_405778 ) ) ( not ( = ?auto_405776 ?auto_405777 ) ) ( not ( = ?auto_405776 ?auto_405778 ) ) ( not ( = ?auto_405777 ?auto_405778 ) ) ( ON ?auto_405776 ?auto_405777 ) ( ON ?auto_405775 ?auto_405776 ) ( ON ?auto_405774 ?auto_405775 ) ( ON ?auto_405773 ?auto_405774 ) ( ON ?auto_405772 ?auto_405773 ) ( ON ?auto_405771 ?auto_405772 ) ( ON ?auto_405770 ?auto_405771 ) ( ON ?auto_405769 ?auto_405770 ) ( ON ?auto_405768 ?auto_405769 ) ( ON ?auto_405767 ?auto_405768 ) ( ON ?auto_405766 ?auto_405767 ) ( ON ?auto_405765 ?auto_405766 ) ( CLEAR ?auto_405765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_405765 )
      ( MAKE-13PILE ?auto_405765 ?auto_405766 ?auto_405767 ?auto_405768 ?auto_405769 ?auto_405770 ?auto_405771 ?auto_405772 ?auto_405773 ?auto_405774 ?auto_405775 ?auto_405776 ?auto_405777 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_405820 - BLOCK
      ?auto_405821 - BLOCK
      ?auto_405822 - BLOCK
      ?auto_405823 - BLOCK
      ?auto_405824 - BLOCK
      ?auto_405825 - BLOCK
      ?auto_405826 - BLOCK
      ?auto_405827 - BLOCK
      ?auto_405828 - BLOCK
      ?auto_405829 - BLOCK
      ?auto_405830 - BLOCK
      ?auto_405831 - BLOCK
      ?auto_405832 - BLOCK
      ?auto_405833 - BLOCK
    )
    :vars
    (
      ?auto_405834 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_405832 ) ( ON ?auto_405833 ?auto_405834 ) ( CLEAR ?auto_405833 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_405820 ) ( ON ?auto_405821 ?auto_405820 ) ( ON ?auto_405822 ?auto_405821 ) ( ON ?auto_405823 ?auto_405822 ) ( ON ?auto_405824 ?auto_405823 ) ( ON ?auto_405825 ?auto_405824 ) ( ON ?auto_405826 ?auto_405825 ) ( ON ?auto_405827 ?auto_405826 ) ( ON ?auto_405828 ?auto_405827 ) ( ON ?auto_405829 ?auto_405828 ) ( ON ?auto_405830 ?auto_405829 ) ( ON ?auto_405831 ?auto_405830 ) ( ON ?auto_405832 ?auto_405831 ) ( not ( = ?auto_405820 ?auto_405821 ) ) ( not ( = ?auto_405820 ?auto_405822 ) ) ( not ( = ?auto_405820 ?auto_405823 ) ) ( not ( = ?auto_405820 ?auto_405824 ) ) ( not ( = ?auto_405820 ?auto_405825 ) ) ( not ( = ?auto_405820 ?auto_405826 ) ) ( not ( = ?auto_405820 ?auto_405827 ) ) ( not ( = ?auto_405820 ?auto_405828 ) ) ( not ( = ?auto_405820 ?auto_405829 ) ) ( not ( = ?auto_405820 ?auto_405830 ) ) ( not ( = ?auto_405820 ?auto_405831 ) ) ( not ( = ?auto_405820 ?auto_405832 ) ) ( not ( = ?auto_405820 ?auto_405833 ) ) ( not ( = ?auto_405820 ?auto_405834 ) ) ( not ( = ?auto_405821 ?auto_405822 ) ) ( not ( = ?auto_405821 ?auto_405823 ) ) ( not ( = ?auto_405821 ?auto_405824 ) ) ( not ( = ?auto_405821 ?auto_405825 ) ) ( not ( = ?auto_405821 ?auto_405826 ) ) ( not ( = ?auto_405821 ?auto_405827 ) ) ( not ( = ?auto_405821 ?auto_405828 ) ) ( not ( = ?auto_405821 ?auto_405829 ) ) ( not ( = ?auto_405821 ?auto_405830 ) ) ( not ( = ?auto_405821 ?auto_405831 ) ) ( not ( = ?auto_405821 ?auto_405832 ) ) ( not ( = ?auto_405821 ?auto_405833 ) ) ( not ( = ?auto_405821 ?auto_405834 ) ) ( not ( = ?auto_405822 ?auto_405823 ) ) ( not ( = ?auto_405822 ?auto_405824 ) ) ( not ( = ?auto_405822 ?auto_405825 ) ) ( not ( = ?auto_405822 ?auto_405826 ) ) ( not ( = ?auto_405822 ?auto_405827 ) ) ( not ( = ?auto_405822 ?auto_405828 ) ) ( not ( = ?auto_405822 ?auto_405829 ) ) ( not ( = ?auto_405822 ?auto_405830 ) ) ( not ( = ?auto_405822 ?auto_405831 ) ) ( not ( = ?auto_405822 ?auto_405832 ) ) ( not ( = ?auto_405822 ?auto_405833 ) ) ( not ( = ?auto_405822 ?auto_405834 ) ) ( not ( = ?auto_405823 ?auto_405824 ) ) ( not ( = ?auto_405823 ?auto_405825 ) ) ( not ( = ?auto_405823 ?auto_405826 ) ) ( not ( = ?auto_405823 ?auto_405827 ) ) ( not ( = ?auto_405823 ?auto_405828 ) ) ( not ( = ?auto_405823 ?auto_405829 ) ) ( not ( = ?auto_405823 ?auto_405830 ) ) ( not ( = ?auto_405823 ?auto_405831 ) ) ( not ( = ?auto_405823 ?auto_405832 ) ) ( not ( = ?auto_405823 ?auto_405833 ) ) ( not ( = ?auto_405823 ?auto_405834 ) ) ( not ( = ?auto_405824 ?auto_405825 ) ) ( not ( = ?auto_405824 ?auto_405826 ) ) ( not ( = ?auto_405824 ?auto_405827 ) ) ( not ( = ?auto_405824 ?auto_405828 ) ) ( not ( = ?auto_405824 ?auto_405829 ) ) ( not ( = ?auto_405824 ?auto_405830 ) ) ( not ( = ?auto_405824 ?auto_405831 ) ) ( not ( = ?auto_405824 ?auto_405832 ) ) ( not ( = ?auto_405824 ?auto_405833 ) ) ( not ( = ?auto_405824 ?auto_405834 ) ) ( not ( = ?auto_405825 ?auto_405826 ) ) ( not ( = ?auto_405825 ?auto_405827 ) ) ( not ( = ?auto_405825 ?auto_405828 ) ) ( not ( = ?auto_405825 ?auto_405829 ) ) ( not ( = ?auto_405825 ?auto_405830 ) ) ( not ( = ?auto_405825 ?auto_405831 ) ) ( not ( = ?auto_405825 ?auto_405832 ) ) ( not ( = ?auto_405825 ?auto_405833 ) ) ( not ( = ?auto_405825 ?auto_405834 ) ) ( not ( = ?auto_405826 ?auto_405827 ) ) ( not ( = ?auto_405826 ?auto_405828 ) ) ( not ( = ?auto_405826 ?auto_405829 ) ) ( not ( = ?auto_405826 ?auto_405830 ) ) ( not ( = ?auto_405826 ?auto_405831 ) ) ( not ( = ?auto_405826 ?auto_405832 ) ) ( not ( = ?auto_405826 ?auto_405833 ) ) ( not ( = ?auto_405826 ?auto_405834 ) ) ( not ( = ?auto_405827 ?auto_405828 ) ) ( not ( = ?auto_405827 ?auto_405829 ) ) ( not ( = ?auto_405827 ?auto_405830 ) ) ( not ( = ?auto_405827 ?auto_405831 ) ) ( not ( = ?auto_405827 ?auto_405832 ) ) ( not ( = ?auto_405827 ?auto_405833 ) ) ( not ( = ?auto_405827 ?auto_405834 ) ) ( not ( = ?auto_405828 ?auto_405829 ) ) ( not ( = ?auto_405828 ?auto_405830 ) ) ( not ( = ?auto_405828 ?auto_405831 ) ) ( not ( = ?auto_405828 ?auto_405832 ) ) ( not ( = ?auto_405828 ?auto_405833 ) ) ( not ( = ?auto_405828 ?auto_405834 ) ) ( not ( = ?auto_405829 ?auto_405830 ) ) ( not ( = ?auto_405829 ?auto_405831 ) ) ( not ( = ?auto_405829 ?auto_405832 ) ) ( not ( = ?auto_405829 ?auto_405833 ) ) ( not ( = ?auto_405829 ?auto_405834 ) ) ( not ( = ?auto_405830 ?auto_405831 ) ) ( not ( = ?auto_405830 ?auto_405832 ) ) ( not ( = ?auto_405830 ?auto_405833 ) ) ( not ( = ?auto_405830 ?auto_405834 ) ) ( not ( = ?auto_405831 ?auto_405832 ) ) ( not ( = ?auto_405831 ?auto_405833 ) ) ( not ( = ?auto_405831 ?auto_405834 ) ) ( not ( = ?auto_405832 ?auto_405833 ) ) ( not ( = ?auto_405832 ?auto_405834 ) ) ( not ( = ?auto_405833 ?auto_405834 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_405833 ?auto_405834 )
      ( !STACK ?auto_405833 ?auto_405832 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_405878 - BLOCK
      ?auto_405879 - BLOCK
      ?auto_405880 - BLOCK
      ?auto_405881 - BLOCK
      ?auto_405882 - BLOCK
      ?auto_405883 - BLOCK
      ?auto_405884 - BLOCK
      ?auto_405885 - BLOCK
      ?auto_405886 - BLOCK
      ?auto_405887 - BLOCK
      ?auto_405888 - BLOCK
      ?auto_405889 - BLOCK
      ?auto_405890 - BLOCK
      ?auto_405891 - BLOCK
    )
    :vars
    (
      ?auto_405892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_405891 ?auto_405892 ) ( ON-TABLE ?auto_405878 ) ( ON ?auto_405879 ?auto_405878 ) ( ON ?auto_405880 ?auto_405879 ) ( ON ?auto_405881 ?auto_405880 ) ( ON ?auto_405882 ?auto_405881 ) ( ON ?auto_405883 ?auto_405882 ) ( ON ?auto_405884 ?auto_405883 ) ( ON ?auto_405885 ?auto_405884 ) ( ON ?auto_405886 ?auto_405885 ) ( ON ?auto_405887 ?auto_405886 ) ( ON ?auto_405888 ?auto_405887 ) ( ON ?auto_405889 ?auto_405888 ) ( not ( = ?auto_405878 ?auto_405879 ) ) ( not ( = ?auto_405878 ?auto_405880 ) ) ( not ( = ?auto_405878 ?auto_405881 ) ) ( not ( = ?auto_405878 ?auto_405882 ) ) ( not ( = ?auto_405878 ?auto_405883 ) ) ( not ( = ?auto_405878 ?auto_405884 ) ) ( not ( = ?auto_405878 ?auto_405885 ) ) ( not ( = ?auto_405878 ?auto_405886 ) ) ( not ( = ?auto_405878 ?auto_405887 ) ) ( not ( = ?auto_405878 ?auto_405888 ) ) ( not ( = ?auto_405878 ?auto_405889 ) ) ( not ( = ?auto_405878 ?auto_405890 ) ) ( not ( = ?auto_405878 ?auto_405891 ) ) ( not ( = ?auto_405878 ?auto_405892 ) ) ( not ( = ?auto_405879 ?auto_405880 ) ) ( not ( = ?auto_405879 ?auto_405881 ) ) ( not ( = ?auto_405879 ?auto_405882 ) ) ( not ( = ?auto_405879 ?auto_405883 ) ) ( not ( = ?auto_405879 ?auto_405884 ) ) ( not ( = ?auto_405879 ?auto_405885 ) ) ( not ( = ?auto_405879 ?auto_405886 ) ) ( not ( = ?auto_405879 ?auto_405887 ) ) ( not ( = ?auto_405879 ?auto_405888 ) ) ( not ( = ?auto_405879 ?auto_405889 ) ) ( not ( = ?auto_405879 ?auto_405890 ) ) ( not ( = ?auto_405879 ?auto_405891 ) ) ( not ( = ?auto_405879 ?auto_405892 ) ) ( not ( = ?auto_405880 ?auto_405881 ) ) ( not ( = ?auto_405880 ?auto_405882 ) ) ( not ( = ?auto_405880 ?auto_405883 ) ) ( not ( = ?auto_405880 ?auto_405884 ) ) ( not ( = ?auto_405880 ?auto_405885 ) ) ( not ( = ?auto_405880 ?auto_405886 ) ) ( not ( = ?auto_405880 ?auto_405887 ) ) ( not ( = ?auto_405880 ?auto_405888 ) ) ( not ( = ?auto_405880 ?auto_405889 ) ) ( not ( = ?auto_405880 ?auto_405890 ) ) ( not ( = ?auto_405880 ?auto_405891 ) ) ( not ( = ?auto_405880 ?auto_405892 ) ) ( not ( = ?auto_405881 ?auto_405882 ) ) ( not ( = ?auto_405881 ?auto_405883 ) ) ( not ( = ?auto_405881 ?auto_405884 ) ) ( not ( = ?auto_405881 ?auto_405885 ) ) ( not ( = ?auto_405881 ?auto_405886 ) ) ( not ( = ?auto_405881 ?auto_405887 ) ) ( not ( = ?auto_405881 ?auto_405888 ) ) ( not ( = ?auto_405881 ?auto_405889 ) ) ( not ( = ?auto_405881 ?auto_405890 ) ) ( not ( = ?auto_405881 ?auto_405891 ) ) ( not ( = ?auto_405881 ?auto_405892 ) ) ( not ( = ?auto_405882 ?auto_405883 ) ) ( not ( = ?auto_405882 ?auto_405884 ) ) ( not ( = ?auto_405882 ?auto_405885 ) ) ( not ( = ?auto_405882 ?auto_405886 ) ) ( not ( = ?auto_405882 ?auto_405887 ) ) ( not ( = ?auto_405882 ?auto_405888 ) ) ( not ( = ?auto_405882 ?auto_405889 ) ) ( not ( = ?auto_405882 ?auto_405890 ) ) ( not ( = ?auto_405882 ?auto_405891 ) ) ( not ( = ?auto_405882 ?auto_405892 ) ) ( not ( = ?auto_405883 ?auto_405884 ) ) ( not ( = ?auto_405883 ?auto_405885 ) ) ( not ( = ?auto_405883 ?auto_405886 ) ) ( not ( = ?auto_405883 ?auto_405887 ) ) ( not ( = ?auto_405883 ?auto_405888 ) ) ( not ( = ?auto_405883 ?auto_405889 ) ) ( not ( = ?auto_405883 ?auto_405890 ) ) ( not ( = ?auto_405883 ?auto_405891 ) ) ( not ( = ?auto_405883 ?auto_405892 ) ) ( not ( = ?auto_405884 ?auto_405885 ) ) ( not ( = ?auto_405884 ?auto_405886 ) ) ( not ( = ?auto_405884 ?auto_405887 ) ) ( not ( = ?auto_405884 ?auto_405888 ) ) ( not ( = ?auto_405884 ?auto_405889 ) ) ( not ( = ?auto_405884 ?auto_405890 ) ) ( not ( = ?auto_405884 ?auto_405891 ) ) ( not ( = ?auto_405884 ?auto_405892 ) ) ( not ( = ?auto_405885 ?auto_405886 ) ) ( not ( = ?auto_405885 ?auto_405887 ) ) ( not ( = ?auto_405885 ?auto_405888 ) ) ( not ( = ?auto_405885 ?auto_405889 ) ) ( not ( = ?auto_405885 ?auto_405890 ) ) ( not ( = ?auto_405885 ?auto_405891 ) ) ( not ( = ?auto_405885 ?auto_405892 ) ) ( not ( = ?auto_405886 ?auto_405887 ) ) ( not ( = ?auto_405886 ?auto_405888 ) ) ( not ( = ?auto_405886 ?auto_405889 ) ) ( not ( = ?auto_405886 ?auto_405890 ) ) ( not ( = ?auto_405886 ?auto_405891 ) ) ( not ( = ?auto_405886 ?auto_405892 ) ) ( not ( = ?auto_405887 ?auto_405888 ) ) ( not ( = ?auto_405887 ?auto_405889 ) ) ( not ( = ?auto_405887 ?auto_405890 ) ) ( not ( = ?auto_405887 ?auto_405891 ) ) ( not ( = ?auto_405887 ?auto_405892 ) ) ( not ( = ?auto_405888 ?auto_405889 ) ) ( not ( = ?auto_405888 ?auto_405890 ) ) ( not ( = ?auto_405888 ?auto_405891 ) ) ( not ( = ?auto_405888 ?auto_405892 ) ) ( not ( = ?auto_405889 ?auto_405890 ) ) ( not ( = ?auto_405889 ?auto_405891 ) ) ( not ( = ?auto_405889 ?auto_405892 ) ) ( not ( = ?auto_405890 ?auto_405891 ) ) ( not ( = ?auto_405890 ?auto_405892 ) ) ( not ( = ?auto_405891 ?auto_405892 ) ) ( CLEAR ?auto_405889 ) ( ON ?auto_405890 ?auto_405891 ) ( CLEAR ?auto_405890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_405878 ?auto_405879 ?auto_405880 ?auto_405881 ?auto_405882 ?auto_405883 ?auto_405884 ?auto_405885 ?auto_405886 ?auto_405887 ?auto_405888 ?auto_405889 ?auto_405890 )
      ( MAKE-14PILE ?auto_405878 ?auto_405879 ?auto_405880 ?auto_405881 ?auto_405882 ?auto_405883 ?auto_405884 ?auto_405885 ?auto_405886 ?auto_405887 ?auto_405888 ?auto_405889 ?auto_405890 ?auto_405891 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_405936 - BLOCK
      ?auto_405937 - BLOCK
      ?auto_405938 - BLOCK
      ?auto_405939 - BLOCK
      ?auto_405940 - BLOCK
      ?auto_405941 - BLOCK
      ?auto_405942 - BLOCK
      ?auto_405943 - BLOCK
      ?auto_405944 - BLOCK
      ?auto_405945 - BLOCK
      ?auto_405946 - BLOCK
      ?auto_405947 - BLOCK
      ?auto_405948 - BLOCK
      ?auto_405949 - BLOCK
    )
    :vars
    (
      ?auto_405950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_405949 ?auto_405950 ) ( ON-TABLE ?auto_405936 ) ( ON ?auto_405937 ?auto_405936 ) ( ON ?auto_405938 ?auto_405937 ) ( ON ?auto_405939 ?auto_405938 ) ( ON ?auto_405940 ?auto_405939 ) ( ON ?auto_405941 ?auto_405940 ) ( ON ?auto_405942 ?auto_405941 ) ( ON ?auto_405943 ?auto_405942 ) ( ON ?auto_405944 ?auto_405943 ) ( ON ?auto_405945 ?auto_405944 ) ( ON ?auto_405946 ?auto_405945 ) ( not ( = ?auto_405936 ?auto_405937 ) ) ( not ( = ?auto_405936 ?auto_405938 ) ) ( not ( = ?auto_405936 ?auto_405939 ) ) ( not ( = ?auto_405936 ?auto_405940 ) ) ( not ( = ?auto_405936 ?auto_405941 ) ) ( not ( = ?auto_405936 ?auto_405942 ) ) ( not ( = ?auto_405936 ?auto_405943 ) ) ( not ( = ?auto_405936 ?auto_405944 ) ) ( not ( = ?auto_405936 ?auto_405945 ) ) ( not ( = ?auto_405936 ?auto_405946 ) ) ( not ( = ?auto_405936 ?auto_405947 ) ) ( not ( = ?auto_405936 ?auto_405948 ) ) ( not ( = ?auto_405936 ?auto_405949 ) ) ( not ( = ?auto_405936 ?auto_405950 ) ) ( not ( = ?auto_405937 ?auto_405938 ) ) ( not ( = ?auto_405937 ?auto_405939 ) ) ( not ( = ?auto_405937 ?auto_405940 ) ) ( not ( = ?auto_405937 ?auto_405941 ) ) ( not ( = ?auto_405937 ?auto_405942 ) ) ( not ( = ?auto_405937 ?auto_405943 ) ) ( not ( = ?auto_405937 ?auto_405944 ) ) ( not ( = ?auto_405937 ?auto_405945 ) ) ( not ( = ?auto_405937 ?auto_405946 ) ) ( not ( = ?auto_405937 ?auto_405947 ) ) ( not ( = ?auto_405937 ?auto_405948 ) ) ( not ( = ?auto_405937 ?auto_405949 ) ) ( not ( = ?auto_405937 ?auto_405950 ) ) ( not ( = ?auto_405938 ?auto_405939 ) ) ( not ( = ?auto_405938 ?auto_405940 ) ) ( not ( = ?auto_405938 ?auto_405941 ) ) ( not ( = ?auto_405938 ?auto_405942 ) ) ( not ( = ?auto_405938 ?auto_405943 ) ) ( not ( = ?auto_405938 ?auto_405944 ) ) ( not ( = ?auto_405938 ?auto_405945 ) ) ( not ( = ?auto_405938 ?auto_405946 ) ) ( not ( = ?auto_405938 ?auto_405947 ) ) ( not ( = ?auto_405938 ?auto_405948 ) ) ( not ( = ?auto_405938 ?auto_405949 ) ) ( not ( = ?auto_405938 ?auto_405950 ) ) ( not ( = ?auto_405939 ?auto_405940 ) ) ( not ( = ?auto_405939 ?auto_405941 ) ) ( not ( = ?auto_405939 ?auto_405942 ) ) ( not ( = ?auto_405939 ?auto_405943 ) ) ( not ( = ?auto_405939 ?auto_405944 ) ) ( not ( = ?auto_405939 ?auto_405945 ) ) ( not ( = ?auto_405939 ?auto_405946 ) ) ( not ( = ?auto_405939 ?auto_405947 ) ) ( not ( = ?auto_405939 ?auto_405948 ) ) ( not ( = ?auto_405939 ?auto_405949 ) ) ( not ( = ?auto_405939 ?auto_405950 ) ) ( not ( = ?auto_405940 ?auto_405941 ) ) ( not ( = ?auto_405940 ?auto_405942 ) ) ( not ( = ?auto_405940 ?auto_405943 ) ) ( not ( = ?auto_405940 ?auto_405944 ) ) ( not ( = ?auto_405940 ?auto_405945 ) ) ( not ( = ?auto_405940 ?auto_405946 ) ) ( not ( = ?auto_405940 ?auto_405947 ) ) ( not ( = ?auto_405940 ?auto_405948 ) ) ( not ( = ?auto_405940 ?auto_405949 ) ) ( not ( = ?auto_405940 ?auto_405950 ) ) ( not ( = ?auto_405941 ?auto_405942 ) ) ( not ( = ?auto_405941 ?auto_405943 ) ) ( not ( = ?auto_405941 ?auto_405944 ) ) ( not ( = ?auto_405941 ?auto_405945 ) ) ( not ( = ?auto_405941 ?auto_405946 ) ) ( not ( = ?auto_405941 ?auto_405947 ) ) ( not ( = ?auto_405941 ?auto_405948 ) ) ( not ( = ?auto_405941 ?auto_405949 ) ) ( not ( = ?auto_405941 ?auto_405950 ) ) ( not ( = ?auto_405942 ?auto_405943 ) ) ( not ( = ?auto_405942 ?auto_405944 ) ) ( not ( = ?auto_405942 ?auto_405945 ) ) ( not ( = ?auto_405942 ?auto_405946 ) ) ( not ( = ?auto_405942 ?auto_405947 ) ) ( not ( = ?auto_405942 ?auto_405948 ) ) ( not ( = ?auto_405942 ?auto_405949 ) ) ( not ( = ?auto_405942 ?auto_405950 ) ) ( not ( = ?auto_405943 ?auto_405944 ) ) ( not ( = ?auto_405943 ?auto_405945 ) ) ( not ( = ?auto_405943 ?auto_405946 ) ) ( not ( = ?auto_405943 ?auto_405947 ) ) ( not ( = ?auto_405943 ?auto_405948 ) ) ( not ( = ?auto_405943 ?auto_405949 ) ) ( not ( = ?auto_405943 ?auto_405950 ) ) ( not ( = ?auto_405944 ?auto_405945 ) ) ( not ( = ?auto_405944 ?auto_405946 ) ) ( not ( = ?auto_405944 ?auto_405947 ) ) ( not ( = ?auto_405944 ?auto_405948 ) ) ( not ( = ?auto_405944 ?auto_405949 ) ) ( not ( = ?auto_405944 ?auto_405950 ) ) ( not ( = ?auto_405945 ?auto_405946 ) ) ( not ( = ?auto_405945 ?auto_405947 ) ) ( not ( = ?auto_405945 ?auto_405948 ) ) ( not ( = ?auto_405945 ?auto_405949 ) ) ( not ( = ?auto_405945 ?auto_405950 ) ) ( not ( = ?auto_405946 ?auto_405947 ) ) ( not ( = ?auto_405946 ?auto_405948 ) ) ( not ( = ?auto_405946 ?auto_405949 ) ) ( not ( = ?auto_405946 ?auto_405950 ) ) ( not ( = ?auto_405947 ?auto_405948 ) ) ( not ( = ?auto_405947 ?auto_405949 ) ) ( not ( = ?auto_405947 ?auto_405950 ) ) ( not ( = ?auto_405948 ?auto_405949 ) ) ( not ( = ?auto_405948 ?auto_405950 ) ) ( not ( = ?auto_405949 ?auto_405950 ) ) ( ON ?auto_405948 ?auto_405949 ) ( CLEAR ?auto_405946 ) ( ON ?auto_405947 ?auto_405948 ) ( CLEAR ?auto_405947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_405936 ?auto_405937 ?auto_405938 ?auto_405939 ?auto_405940 ?auto_405941 ?auto_405942 ?auto_405943 ?auto_405944 ?auto_405945 ?auto_405946 ?auto_405947 )
      ( MAKE-14PILE ?auto_405936 ?auto_405937 ?auto_405938 ?auto_405939 ?auto_405940 ?auto_405941 ?auto_405942 ?auto_405943 ?auto_405944 ?auto_405945 ?auto_405946 ?auto_405947 ?auto_405948 ?auto_405949 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_405994 - BLOCK
      ?auto_405995 - BLOCK
      ?auto_405996 - BLOCK
      ?auto_405997 - BLOCK
      ?auto_405998 - BLOCK
      ?auto_405999 - BLOCK
      ?auto_406000 - BLOCK
      ?auto_406001 - BLOCK
      ?auto_406002 - BLOCK
      ?auto_406003 - BLOCK
      ?auto_406004 - BLOCK
      ?auto_406005 - BLOCK
      ?auto_406006 - BLOCK
      ?auto_406007 - BLOCK
    )
    :vars
    (
      ?auto_406008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_406007 ?auto_406008 ) ( ON-TABLE ?auto_405994 ) ( ON ?auto_405995 ?auto_405994 ) ( ON ?auto_405996 ?auto_405995 ) ( ON ?auto_405997 ?auto_405996 ) ( ON ?auto_405998 ?auto_405997 ) ( ON ?auto_405999 ?auto_405998 ) ( ON ?auto_406000 ?auto_405999 ) ( ON ?auto_406001 ?auto_406000 ) ( ON ?auto_406002 ?auto_406001 ) ( ON ?auto_406003 ?auto_406002 ) ( not ( = ?auto_405994 ?auto_405995 ) ) ( not ( = ?auto_405994 ?auto_405996 ) ) ( not ( = ?auto_405994 ?auto_405997 ) ) ( not ( = ?auto_405994 ?auto_405998 ) ) ( not ( = ?auto_405994 ?auto_405999 ) ) ( not ( = ?auto_405994 ?auto_406000 ) ) ( not ( = ?auto_405994 ?auto_406001 ) ) ( not ( = ?auto_405994 ?auto_406002 ) ) ( not ( = ?auto_405994 ?auto_406003 ) ) ( not ( = ?auto_405994 ?auto_406004 ) ) ( not ( = ?auto_405994 ?auto_406005 ) ) ( not ( = ?auto_405994 ?auto_406006 ) ) ( not ( = ?auto_405994 ?auto_406007 ) ) ( not ( = ?auto_405994 ?auto_406008 ) ) ( not ( = ?auto_405995 ?auto_405996 ) ) ( not ( = ?auto_405995 ?auto_405997 ) ) ( not ( = ?auto_405995 ?auto_405998 ) ) ( not ( = ?auto_405995 ?auto_405999 ) ) ( not ( = ?auto_405995 ?auto_406000 ) ) ( not ( = ?auto_405995 ?auto_406001 ) ) ( not ( = ?auto_405995 ?auto_406002 ) ) ( not ( = ?auto_405995 ?auto_406003 ) ) ( not ( = ?auto_405995 ?auto_406004 ) ) ( not ( = ?auto_405995 ?auto_406005 ) ) ( not ( = ?auto_405995 ?auto_406006 ) ) ( not ( = ?auto_405995 ?auto_406007 ) ) ( not ( = ?auto_405995 ?auto_406008 ) ) ( not ( = ?auto_405996 ?auto_405997 ) ) ( not ( = ?auto_405996 ?auto_405998 ) ) ( not ( = ?auto_405996 ?auto_405999 ) ) ( not ( = ?auto_405996 ?auto_406000 ) ) ( not ( = ?auto_405996 ?auto_406001 ) ) ( not ( = ?auto_405996 ?auto_406002 ) ) ( not ( = ?auto_405996 ?auto_406003 ) ) ( not ( = ?auto_405996 ?auto_406004 ) ) ( not ( = ?auto_405996 ?auto_406005 ) ) ( not ( = ?auto_405996 ?auto_406006 ) ) ( not ( = ?auto_405996 ?auto_406007 ) ) ( not ( = ?auto_405996 ?auto_406008 ) ) ( not ( = ?auto_405997 ?auto_405998 ) ) ( not ( = ?auto_405997 ?auto_405999 ) ) ( not ( = ?auto_405997 ?auto_406000 ) ) ( not ( = ?auto_405997 ?auto_406001 ) ) ( not ( = ?auto_405997 ?auto_406002 ) ) ( not ( = ?auto_405997 ?auto_406003 ) ) ( not ( = ?auto_405997 ?auto_406004 ) ) ( not ( = ?auto_405997 ?auto_406005 ) ) ( not ( = ?auto_405997 ?auto_406006 ) ) ( not ( = ?auto_405997 ?auto_406007 ) ) ( not ( = ?auto_405997 ?auto_406008 ) ) ( not ( = ?auto_405998 ?auto_405999 ) ) ( not ( = ?auto_405998 ?auto_406000 ) ) ( not ( = ?auto_405998 ?auto_406001 ) ) ( not ( = ?auto_405998 ?auto_406002 ) ) ( not ( = ?auto_405998 ?auto_406003 ) ) ( not ( = ?auto_405998 ?auto_406004 ) ) ( not ( = ?auto_405998 ?auto_406005 ) ) ( not ( = ?auto_405998 ?auto_406006 ) ) ( not ( = ?auto_405998 ?auto_406007 ) ) ( not ( = ?auto_405998 ?auto_406008 ) ) ( not ( = ?auto_405999 ?auto_406000 ) ) ( not ( = ?auto_405999 ?auto_406001 ) ) ( not ( = ?auto_405999 ?auto_406002 ) ) ( not ( = ?auto_405999 ?auto_406003 ) ) ( not ( = ?auto_405999 ?auto_406004 ) ) ( not ( = ?auto_405999 ?auto_406005 ) ) ( not ( = ?auto_405999 ?auto_406006 ) ) ( not ( = ?auto_405999 ?auto_406007 ) ) ( not ( = ?auto_405999 ?auto_406008 ) ) ( not ( = ?auto_406000 ?auto_406001 ) ) ( not ( = ?auto_406000 ?auto_406002 ) ) ( not ( = ?auto_406000 ?auto_406003 ) ) ( not ( = ?auto_406000 ?auto_406004 ) ) ( not ( = ?auto_406000 ?auto_406005 ) ) ( not ( = ?auto_406000 ?auto_406006 ) ) ( not ( = ?auto_406000 ?auto_406007 ) ) ( not ( = ?auto_406000 ?auto_406008 ) ) ( not ( = ?auto_406001 ?auto_406002 ) ) ( not ( = ?auto_406001 ?auto_406003 ) ) ( not ( = ?auto_406001 ?auto_406004 ) ) ( not ( = ?auto_406001 ?auto_406005 ) ) ( not ( = ?auto_406001 ?auto_406006 ) ) ( not ( = ?auto_406001 ?auto_406007 ) ) ( not ( = ?auto_406001 ?auto_406008 ) ) ( not ( = ?auto_406002 ?auto_406003 ) ) ( not ( = ?auto_406002 ?auto_406004 ) ) ( not ( = ?auto_406002 ?auto_406005 ) ) ( not ( = ?auto_406002 ?auto_406006 ) ) ( not ( = ?auto_406002 ?auto_406007 ) ) ( not ( = ?auto_406002 ?auto_406008 ) ) ( not ( = ?auto_406003 ?auto_406004 ) ) ( not ( = ?auto_406003 ?auto_406005 ) ) ( not ( = ?auto_406003 ?auto_406006 ) ) ( not ( = ?auto_406003 ?auto_406007 ) ) ( not ( = ?auto_406003 ?auto_406008 ) ) ( not ( = ?auto_406004 ?auto_406005 ) ) ( not ( = ?auto_406004 ?auto_406006 ) ) ( not ( = ?auto_406004 ?auto_406007 ) ) ( not ( = ?auto_406004 ?auto_406008 ) ) ( not ( = ?auto_406005 ?auto_406006 ) ) ( not ( = ?auto_406005 ?auto_406007 ) ) ( not ( = ?auto_406005 ?auto_406008 ) ) ( not ( = ?auto_406006 ?auto_406007 ) ) ( not ( = ?auto_406006 ?auto_406008 ) ) ( not ( = ?auto_406007 ?auto_406008 ) ) ( ON ?auto_406006 ?auto_406007 ) ( ON ?auto_406005 ?auto_406006 ) ( CLEAR ?auto_406003 ) ( ON ?auto_406004 ?auto_406005 ) ( CLEAR ?auto_406004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_405994 ?auto_405995 ?auto_405996 ?auto_405997 ?auto_405998 ?auto_405999 ?auto_406000 ?auto_406001 ?auto_406002 ?auto_406003 ?auto_406004 )
      ( MAKE-14PILE ?auto_405994 ?auto_405995 ?auto_405996 ?auto_405997 ?auto_405998 ?auto_405999 ?auto_406000 ?auto_406001 ?auto_406002 ?auto_406003 ?auto_406004 ?auto_406005 ?auto_406006 ?auto_406007 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_406052 - BLOCK
      ?auto_406053 - BLOCK
      ?auto_406054 - BLOCK
      ?auto_406055 - BLOCK
      ?auto_406056 - BLOCK
      ?auto_406057 - BLOCK
      ?auto_406058 - BLOCK
      ?auto_406059 - BLOCK
      ?auto_406060 - BLOCK
      ?auto_406061 - BLOCK
      ?auto_406062 - BLOCK
      ?auto_406063 - BLOCK
      ?auto_406064 - BLOCK
      ?auto_406065 - BLOCK
    )
    :vars
    (
      ?auto_406066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_406065 ?auto_406066 ) ( ON-TABLE ?auto_406052 ) ( ON ?auto_406053 ?auto_406052 ) ( ON ?auto_406054 ?auto_406053 ) ( ON ?auto_406055 ?auto_406054 ) ( ON ?auto_406056 ?auto_406055 ) ( ON ?auto_406057 ?auto_406056 ) ( ON ?auto_406058 ?auto_406057 ) ( ON ?auto_406059 ?auto_406058 ) ( ON ?auto_406060 ?auto_406059 ) ( not ( = ?auto_406052 ?auto_406053 ) ) ( not ( = ?auto_406052 ?auto_406054 ) ) ( not ( = ?auto_406052 ?auto_406055 ) ) ( not ( = ?auto_406052 ?auto_406056 ) ) ( not ( = ?auto_406052 ?auto_406057 ) ) ( not ( = ?auto_406052 ?auto_406058 ) ) ( not ( = ?auto_406052 ?auto_406059 ) ) ( not ( = ?auto_406052 ?auto_406060 ) ) ( not ( = ?auto_406052 ?auto_406061 ) ) ( not ( = ?auto_406052 ?auto_406062 ) ) ( not ( = ?auto_406052 ?auto_406063 ) ) ( not ( = ?auto_406052 ?auto_406064 ) ) ( not ( = ?auto_406052 ?auto_406065 ) ) ( not ( = ?auto_406052 ?auto_406066 ) ) ( not ( = ?auto_406053 ?auto_406054 ) ) ( not ( = ?auto_406053 ?auto_406055 ) ) ( not ( = ?auto_406053 ?auto_406056 ) ) ( not ( = ?auto_406053 ?auto_406057 ) ) ( not ( = ?auto_406053 ?auto_406058 ) ) ( not ( = ?auto_406053 ?auto_406059 ) ) ( not ( = ?auto_406053 ?auto_406060 ) ) ( not ( = ?auto_406053 ?auto_406061 ) ) ( not ( = ?auto_406053 ?auto_406062 ) ) ( not ( = ?auto_406053 ?auto_406063 ) ) ( not ( = ?auto_406053 ?auto_406064 ) ) ( not ( = ?auto_406053 ?auto_406065 ) ) ( not ( = ?auto_406053 ?auto_406066 ) ) ( not ( = ?auto_406054 ?auto_406055 ) ) ( not ( = ?auto_406054 ?auto_406056 ) ) ( not ( = ?auto_406054 ?auto_406057 ) ) ( not ( = ?auto_406054 ?auto_406058 ) ) ( not ( = ?auto_406054 ?auto_406059 ) ) ( not ( = ?auto_406054 ?auto_406060 ) ) ( not ( = ?auto_406054 ?auto_406061 ) ) ( not ( = ?auto_406054 ?auto_406062 ) ) ( not ( = ?auto_406054 ?auto_406063 ) ) ( not ( = ?auto_406054 ?auto_406064 ) ) ( not ( = ?auto_406054 ?auto_406065 ) ) ( not ( = ?auto_406054 ?auto_406066 ) ) ( not ( = ?auto_406055 ?auto_406056 ) ) ( not ( = ?auto_406055 ?auto_406057 ) ) ( not ( = ?auto_406055 ?auto_406058 ) ) ( not ( = ?auto_406055 ?auto_406059 ) ) ( not ( = ?auto_406055 ?auto_406060 ) ) ( not ( = ?auto_406055 ?auto_406061 ) ) ( not ( = ?auto_406055 ?auto_406062 ) ) ( not ( = ?auto_406055 ?auto_406063 ) ) ( not ( = ?auto_406055 ?auto_406064 ) ) ( not ( = ?auto_406055 ?auto_406065 ) ) ( not ( = ?auto_406055 ?auto_406066 ) ) ( not ( = ?auto_406056 ?auto_406057 ) ) ( not ( = ?auto_406056 ?auto_406058 ) ) ( not ( = ?auto_406056 ?auto_406059 ) ) ( not ( = ?auto_406056 ?auto_406060 ) ) ( not ( = ?auto_406056 ?auto_406061 ) ) ( not ( = ?auto_406056 ?auto_406062 ) ) ( not ( = ?auto_406056 ?auto_406063 ) ) ( not ( = ?auto_406056 ?auto_406064 ) ) ( not ( = ?auto_406056 ?auto_406065 ) ) ( not ( = ?auto_406056 ?auto_406066 ) ) ( not ( = ?auto_406057 ?auto_406058 ) ) ( not ( = ?auto_406057 ?auto_406059 ) ) ( not ( = ?auto_406057 ?auto_406060 ) ) ( not ( = ?auto_406057 ?auto_406061 ) ) ( not ( = ?auto_406057 ?auto_406062 ) ) ( not ( = ?auto_406057 ?auto_406063 ) ) ( not ( = ?auto_406057 ?auto_406064 ) ) ( not ( = ?auto_406057 ?auto_406065 ) ) ( not ( = ?auto_406057 ?auto_406066 ) ) ( not ( = ?auto_406058 ?auto_406059 ) ) ( not ( = ?auto_406058 ?auto_406060 ) ) ( not ( = ?auto_406058 ?auto_406061 ) ) ( not ( = ?auto_406058 ?auto_406062 ) ) ( not ( = ?auto_406058 ?auto_406063 ) ) ( not ( = ?auto_406058 ?auto_406064 ) ) ( not ( = ?auto_406058 ?auto_406065 ) ) ( not ( = ?auto_406058 ?auto_406066 ) ) ( not ( = ?auto_406059 ?auto_406060 ) ) ( not ( = ?auto_406059 ?auto_406061 ) ) ( not ( = ?auto_406059 ?auto_406062 ) ) ( not ( = ?auto_406059 ?auto_406063 ) ) ( not ( = ?auto_406059 ?auto_406064 ) ) ( not ( = ?auto_406059 ?auto_406065 ) ) ( not ( = ?auto_406059 ?auto_406066 ) ) ( not ( = ?auto_406060 ?auto_406061 ) ) ( not ( = ?auto_406060 ?auto_406062 ) ) ( not ( = ?auto_406060 ?auto_406063 ) ) ( not ( = ?auto_406060 ?auto_406064 ) ) ( not ( = ?auto_406060 ?auto_406065 ) ) ( not ( = ?auto_406060 ?auto_406066 ) ) ( not ( = ?auto_406061 ?auto_406062 ) ) ( not ( = ?auto_406061 ?auto_406063 ) ) ( not ( = ?auto_406061 ?auto_406064 ) ) ( not ( = ?auto_406061 ?auto_406065 ) ) ( not ( = ?auto_406061 ?auto_406066 ) ) ( not ( = ?auto_406062 ?auto_406063 ) ) ( not ( = ?auto_406062 ?auto_406064 ) ) ( not ( = ?auto_406062 ?auto_406065 ) ) ( not ( = ?auto_406062 ?auto_406066 ) ) ( not ( = ?auto_406063 ?auto_406064 ) ) ( not ( = ?auto_406063 ?auto_406065 ) ) ( not ( = ?auto_406063 ?auto_406066 ) ) ( not ( = ?auto_406064 ?auto_406065 ) ) ( not ( = ?auto_406064 ?auto_406066 ) ) ( not ( = ?auto_406065 ?auto_406066 ) ) ( ON ?auto_406064 ?auto_406065 ) ( ON ?auto_406063 ?auto_406064 ) ( ON ?auto_406062 ?auto_406063 ) ( CLEAR ?auto_406060 ) ( ON ?auto_406061 ?auto_406062 ) ( CLEAR ?auto_406061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_406052 ?auto_406053 ?auto_406054 ?auto_406055 ?auto_406056 ?auto_406057 ?auto_406058 ?auto_406059 ?auto_406060 ?auto_406061 )
      ( MAKE-14PILE ?auto_406052 ?auto_406053 ?auto_406054 ?auto_406055 ?auto_406056 ?auto_406057 ?auto_406058 ?auto_406059 ?auto_406060 ?auto_406061 ?auto_406062 ?auto_406063 ?auto_406064 ?auto_406065 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_406110 - BLOCK
      ?auto_406111 - BLOCK
      ?auto_406112 - BLOCK
      ?auto_406113 - BLOCK
      ?auto_406114 - BLOCK
      ?auto_406115 - BLOCK
      ?auto_406116 - BLOCK
      ?auto_406117 - BLOCK
      ?auto_406118 - BLOCK
      ?auto_406119 - BLOCK
      ?auto_406120 - BLOCK
      ?auto_406121 - BLOCK
      ?auto_406122 - BLOCK
      ?auto_406123 - BLOCK
    )
    :vars
    (
      ?auto_406124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_406123 ?auto_406124 ) ( ON-TABLE ?auto_406110 ) ( ON ?auto_406111 ?auto_406110 ) ( ON ?auto_406112 ?auto_406111 ) ( ON ?auto_406113 ?auto_406112 ) ( ON ?auto_406114 ?auto_406113 ) ( ON ?auto_406115 ?auto_406114 ) ( ON ?auto_406116 ?auto_406115 ) ( ON ?auto_406117 ?auto_406116 ) ( not ( = ?auto_406110 ?auto_406111 ) ) ( not ( = ?auto_406110 ?auto_406112 ) ) ( not ( = ?auto_406110 ?auto_406113 ) ) ( not ( = ?auto_406110 ?auto_406114 ) ) ( not ( = ?auto_406110 ?auto_406115 ) ) ( not ( = ?auto_406110 ?auto_406116 ) ) ( not ( = ?auto_406110 ?auto_406117 ) ) ( not ( = ?auto_406110 ?auto_406118 ) ) ( not ( = ?auto_406110 ?auto_406119 ) ) ( not ( = ?auto_406110 ?auto_406120 ) ) ( not ( = ?auto_406110 ?auto_406121 ) ) ( not ( = ?auto_406110 ?auto_406122 ) ) ( not ( = ?auto_406110 ?auto_406123 ) ) ( not ( = ?auto_406110 ?auto_406124 ) ) ( not ( = ?auto_406111 ?auto_406112 ) ) ( not ( = ?auto_406111 ?auto_406113 ) ) ( not ( = ?auto_406111 ?auto_406114 ) ) ( not ( = ?auto_406111 ?auto_406115 ) ) ( not ( = ?auto_406111 ?auto_406116 ) ) ( not ( = ?auto_406111 ?auto_406117 ) ) ( not ( = ?auto_406111 ?auto_406118 ) ) ( not ( = ?auto_406111 ?auto_406119 ) ) ( not ( = ?auto_406111 ?auto_406120 ) ) ( not ( = ?auto_406111 ?auto_406121 ) ) ( not ( = ?auto_406111 ?auto_406122 ) ) ( not ( = ?auto_406111 ?auto_406123 ) ) ( not ( = ?auto_406111 ?auto_406124 ) ) ( not ( = ?auto_406112 ?auto_406113 ) ) ( not ( = ?auto_406112 ?auto_406114 ) ) ( not ( = ?auto_406112 ?auto_406115 ) ) ( not ( = ?auto_406112 ?auto_406116 ) ) ( not ( = ?auto_406112 ?auto_406117 ) ) ( not ( = ?auto_406112 ?auto_406118 ) ) ( not ( = ?auto_406112 ?auto_406119 ) ) ( not ( = ?auto_406112 ?auto_406120 ) ) ( not ( = ?auto_406112 ?auto_406121 ) ) ( not ( = ?auto_406112 ?auto_406122 ) ) ( not ( = ?auto_406112 ?auto_406123 ) ) ( not ( = ?auto_406112 ?auto_406124 ) ) ( not ( = ?auto_406113 ?auto_406114 ) ) ( not ( = ?auto_406113 ?auto_406115 ) ) ( not ( = ?auto_406113 ?auto_406116 ) ) ( not ( = ?auto_406113 ?auto_406117 ) ) ( not ( = ?auto_406113 ?auto_406118 ) ) ( not ( = ?auto_406113 ?auto_406119 ) ) ( not ( = ?auto_406113 ?auto_406120 ) ) ( not ( = ?auto_406113 ?auto_406121 ) ) ( not ( = ?auto_406113 ?auto_406122 ) ) ( not ( = ?auto_406113 ?auto_406123 ) ) ( not ( = ?auto_406113 ?auto_406124 ) ) ( not ( = ?auto_406114 ?auto_406115 ) ) ( not ( = ?auto_406114 ?auto_406116 ) ) ( not ( = ?auto_406114 ?auto_406117 ) ) ( not ( = ?auto_406114 ?auto_406118 ) ) ( not ( = ?auto_406114 ?auto_406119 ) ) ( not ( = ?auto_406114 ?auto_406120 ) ) ( not ( = ?auto_406114 ?auto_406121 ) ) ( not ( = ?auto_406114 ?auto_406122 ) ) ( not ( = ?auto_406114 ?auto_406123 ) ) ( not ( = ?auto_406114 ?auto_406124 ) ) ( not ( = ?auto_406115 ?auto_406116 ) ) ( not ( = ?auto_406115 ?auto_406117 ) ) ( not ( = ?auto_406115 ?auto_406118 ) ) ( not ( = ?auto_406115 ?auto_406119 ) ) ( not ( = ?auto_406115 ?auto_406120 ) ) ( not ( = ?auto_406115 ?auto_406121 ) ) ( not ( = ?auto_406115 ?auto_406122 ) ) ( not ( = ?auto_406115 ?auto_406123 ) ) ( not ( = ?auto_406115 ?auto_406124 ) ) ( not ( = ?auto_406116 ?auto_406117 ) ) ( not ( = ?auto_406116 ?auto_406118 ) ) ( not ( = ?auto_406116 ?auto_406119 ) ) ( not ( = ?auto_406116 ?auto_406120 ) ) ( not ( = ?auto_406116 ?auto_406121 ) ) ( not ( = ?auto_406116 ?auto_406122 ) ) ( not ( = ?auto_406116 ?auto_406123 ) ) ( not ( = ?auto_406116 ?auto_406124 ) ) ( not ( = ?auto_406117 ?auto_406118 ) ) ( not ( = ?auto_406117 ?auto_406119 ) ) ( not ( = ?auto_406117 ?auto_406120 ) ) ( not ( = ?auto_406117 ?auto_406121 ) ) ( not ( = ?auto_406117 ?auto_406122 ) ) ( not ( = ?auto_406117 ?auto_406123 ) ) ( not ( = ?auto_406117 ?auto_406124 ) ) ( not ( = ?auto_406118 ?auto_406119 ) ) ( not ( = ?auto_406118 ?auto_406120 ) ) ( not ( = ?auto_406118 ?auto_406121 ) ) ( not ( = ?auto_406118 ?auto_406122 ) ) ( not ( = ?auto_406118 ?auto_406123 ) ) ( not ( = ?auto_406118 ?auto_406124 ) ) ( not ( = ?auto_406119 ?auto_406120 ) ) ( not ( = ?auto_406119 ?auto_406121 ) ) ( not ( = ?auto_406119 ?auto_406122 ) ) ( not ( = ?auto_406119 ?auto_406123 ) ) ( not ( = ?auto_406119 ?auto_406124 ) ) ( not ( = ?auto_406120 ?auto_406121 ) ) ( not ( = ?auto_406120 ?auto_406122 ) ) ( not ( = ?auto_406120 ?auto_406123 ) ) ( not ( = ?auto_406120 ?auto_406124 ) ) ( not ( = ?auto_406121 ?auto_406122 ) ) ( not ( = ?auto_406121 ?auto_406123 ) ) ( not ( = ?auto_406121 ?auto_406124 ) ) ( not ( = ?auto_406122 ?auto_406123 ) ) ( not ( = ?auto_406122 ?auto_406124 ) ) ( not ( = ?auto_406123 ?auto_406124 ) ) ( ON ?auto_406122 ?auto_406123 ) ( ON ?auto_406121 ?auto_406122 ) ( ON ?auto_406120 ?auto_406121 ) ( ON ?auto_406119 ?auto_406120 ) ( CLEAR ?auto_406117 ) ( ON ?auto_406118 ?auto_406119 ) ( CLEAR ?auto_406118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_406110 ?auto_406111 ?auto_406112 ?auto_406113 ?auto_406114 ?auto_406115 ?auto_406116 ?auto_406117 ?auto_406118 )
      ( MAKE-14PILE ?auto_406110 ?auto_406111 ?auto_406112 ?auto_406113 ?auto_406114 ?auto_406115 ?auto_406116 ?auto_406117 ?auto_406118 ?auto_406119 ?auto_406120 ?auto_406121 ?auto_406122 ?auto_406123 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_406168 - BLOCK
      ?auto_406169 - BLOCK
      ?auto_406170 - BLOCK
      ?auto_406171 - BLOCK
      ?auto_406172 - BLOCK
      ?auto_406173 - BLOCK
      ?auto_406174 - BLOCK
      ?auto_406175 - BLOCK
      ?auto_406176 - BLOCK
      ?auto_406177 - BLOCK
      ?auto_406178 - BLOCK
      ?auto_406179 - BLOCK
      ?auto_406180 - BLOCK
      ?auto_406181 - BLOCK
    )
    :vars
    (
      ?auto_406182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_406181 ?auto_406182 ) ( ON-TABLE ?auto_406168 ) ( ON ?auto_406169 ?auto_406168 ) ( ON ?auto_406170 ?auto_406169 ) ( ON ?auto_406171 ?auto_406170 ) ( ON ?auto_406172 ?auto_406171 ) ( ON ?auto_406173 ?auto_406172 ) ( ON ?auto_406174 ?auto_406173 ) ( not ( = ?auto_406168 ?auto_406169 ) ) ( not ( = ?auto_406168 ?auto_406170 ) ) ( not ( = ?auto_406168 ?auto_406171 ) ) ( not ( = ?auto_406168 ?auto_406172 ) ) ( not ( = ?auto_406168 ?auto_406173 ) ) ( not ( = ?auto_406168 ?auto_406174 ) ) ( not ( = ?auto_406168 ?auto_406175 ) ) ( not ( = ?auto_406168 ?auto_406176 ) ) ( not ( = ?auto_406168 ?auto_406177 ) ) ( not ( = ?auto_406168 ?auto_406178 ) ) ( not ( = ?auto_406168 ?auto_406179 ) ) ( not ( = ?auto_406168 ?auto_406180 ) ) ( not ( = ?auto_406168 ?auto_406181 ) ) ( not ( = ?auto_406168 ?auto_406182 ) ) ( not ( = ?auto_406169 ?auto_406170 ) ) ( not ( = ?auto_406169 ?auto_406171 ) ) ( not ( = ?auto_406169 ?auto_406172 ) ) ( not ( = ?auto_406169 ?auto_406173 ) ) ( not ( = ?auto_406169 ?auto_406174 ) ) ( not ( = ?auto_406169 ?auto_406175 ) ) ( not ( = ?auto_406169 ?auto_406176 ) ) ( not ( = ?auto_406169 ?auto_406177 ) ) ( not ( = ?auto_406169 ?auto_406178 ) ) ( not ( = ?auto_406169 ?auto_406179 ) ) ( not ( = ?auto_406169 ?auto_406180 ) ) ( not ( = ?auto_406169 ?auto_406181 ) ) ( not ( = ?auto_406169 ?auto_406182 ) ) ( not ( = ?auto_406170 ?auto_406171 ) ) ( not ( = ?auto_406170 ?auto_406172 ) ) ( not ( = ?auto_406170 ?auto_406173 ) ) ( not ( = ?auto_406170 ?auto_406174 ) ) ( not ( = ?auto_406170 ?auto_406175 ) ) ( not ( = ?auto_406170 ?auto_406176 ) ) ( not ( = ?auto_406170 ?auto_406177 ) ) ( not ( = ?auto_406170 ?auto_406178 ) ) ( not ( = ?auto_406170 ?auto_406179 ) ) ( not ( = ?auto_406170 ?auto_406180 ) ) ( not ( = ?auto_406170 ?auto_406181 ) ) ( not ( = ?auto_406170 ?auto_406182 ) ) ( not ( = ?auto_406171 ?auto_406172 ) ) ( not ( = ?auto_406171 ?auto_406173 ) ) ( not ( = ?auto_406171 ?auto_406174 ) ) ( not ( = ?auto_406171 ?auto_406175 ) ) ( not ( = ?auto_406171 ?auto_406176 ) ) ( not ( = ?auto_406171 ?auto_406177 ) ) ( not ( = ?auto_406171 ?auto_406178 ) ) ( not ( = ?auto_406171 ?auto_406179 ) ) ( not ( = ?auto_406171 ?auto_406180 ) ) ( not ( = ?auto_406171 ?auto_406181 ) ) ( not ( = ?auto_406171 ?auto_406182 ) ) ( not ( = ?auto_406172 ?auto_406173 ) ) ( not ( = ?auto_406172 ?auto_406174 ) ) ( not ( = ?auto_406172 ?auto_406175 ) ) ( not ( = ?auto_406172 ?auto_406176 ) ) ( not ( = ?auto_406172 ?auto_406177 ) ) ( not ( = ?auto_406172 ?auto_406178 ) ) ( not ( = ?auto_406172 ?auto_406179 ) ) ( not ( = ?auto_406172 ?auto_406180 ) ) ( not ( = ?auto_406172 ?auto_406181 ) ) ( not ( = ?auto_406172 ?auto_406182 ) ) ( not ( = ?auto_406173 ?auto_406174 ) ) ( not ( = ?auto_406173 ?auto_406175 ) ) ( not ( = ?auto_406173 ?auto_406176 ) ) ( not ( = ?auto_406173 ?auto_406177 ) ) ( not ( = ?auto_406173 ?auto_406178 ) ) ( not ( = ?auto_406173 ?auto_406179 ) ) ( not ( = ?auto_406173 ?auto_406180 ) ) ( not ( = ?auto_406173 ?auto_406181 ) ) ( not ( = ?auto_406173 ?auto_406182 ) ) ( not ( = ?auto_406174 ?auto_406175 ) ) ( not ( = ?auto_406174 ?auto_406176 ) ) ( not ( = ?auto_406174 ?auto_406177 ) ) ( not ( = ?auto_406174 ?auto_406178 ) ) ( not ( = ?auto_406174 ?auto_406179 ) ) ( not ( = ?auto_406174 ?auto_406180 ) ) ( not ( = ?auto_406174 ?auto_406181 ) ) ( not ( = ?auto_406174 ?auto_406182 ) ) ( not ( = ?auto_406175 ?auto_406176 ) ) ( not ( = ?auto_406175 ?auto_406177 ) ) ( not ( = ?auto_406175 ?auto_406178 ) ) ( not ( = ?auto_406175 ?auto_406179 ) ) ( not ( = ?auto_406175 ?auto_406180 ) ) ( not ( = ?auto_406175 ?auto_406181 ) ) ( not ( = ?auto_406175 ?auto_406182 ) ) ( not ( = ?auto_406176 ?auto_406177 ) ) ( not ( = ?auto_406176 ?auto_406178 ) ) ( not ( = ?auto_406176 ?auto_406179 ) ) ( not ( = ?auto_406176 ?auto_406180 ) ) ( not ( = ?auto_406176 ?auto_406181 ) ) ( not ( = ?auto_406176 ?auto_406182 ) ) ( not ( = ?auto_406177 ?auto_406178 ) ) ( not ( = ?auto_406177 ?auto_406179 ) ) ( not ( = ?auto_406177 ?auto_406180 ) ) ( not ( = ?auto_406177 ?auto_406181 ) ) ( not ( = ?auto_406177 ?auto_406182 ) ) ( not ( = ?auto_406178 ?auto_406179 ) ) ( not ( = ?auto_406178 ?auto_406180 ) ) ( not ( = ?auto_406178 ?auto_406181 ) ) ( not ( = ?auto_406178 ?auto_406182 ) ) ( not ( = ?auto_406179 ?auto_406180 ) ) ( not ( = ?auto_406179 ?auto_406181 ) ) ( not ( = ?auto_406179 ?auto_406182 ) ) ( not ( = ?auto_406180 ?auto_406181 ) ) ( not ( = ?auto_406180 ?auto_406182 ) ) ( not ( = ?auto_406181 ?auto_406182 ) ) ( ON ?auto_406180 ?auto_406181 ) ( ON ?auto_406179 ?auto_406180 ) ( ON ?auto_406178 ?auto_406179 ) ( ON ?auto_406177 ?auto_406178 ) ( ON ?auto_406176 ?auto_406177 ) ( CLEAR ?auto_406174 ) ( ON ?auto_406175 ?auto_406176 ) ( CLEAR ?auto_406175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_406168 ?auto_406169 ?auto_406170 ?auto_406171 ?auto_406172 ?auto_406173 ?auto_406174 ?auto_406175 )
      ( MAKE-14PILE ?auto_406168 ?auto_406169 ?auto_406170 ?auto_406171 ?auto_406172 ?auto_406173 ?auto_406174 ?auto_406175 ?auto_406176 ?auto_406177 ?auto_406178 ?auto_406179 ?auto_406180 ?auto_406181 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_406226 - BLOCK
      ?auto_406227 - BLOCK
      ?auto_406228 - BLOCK
      ?auto_406229 - BLOCK
      ?auto_406230 - BLOCK
      ?auto_406231 - BLOCK
      ?auto_406232 - BLOCK
      ?auto_406233 - BLOCK
      ?auto_406234 - BLOCK
      ?auto_406235 - BLOCK
      ?auto_406236 - BLOCK
      ?auto_406237 - BLOCK
      ?auto_406238 - BLOCK
      ?auto_406239 - BLOCK
    )
    :vars
    (
      ?auto_406240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_406239 ?auto_406240 ) ( ON-TABLE ?auto_406226 ) ( ON ?auto_406227 ?auto_406226 ) ( ON ?auto_406228 ?auto_406227 ) ( ON ?auto_406229 ?auto_406228 ) ( ON ?auto_406230 ?auto_406229 ) ( ON ?auto_406231 ?auto_406230 ) ( not ( = ?auto_406226 ?auto_406227 ) ) ( not ( = ?auto_406226 ?auto_406228 ) ) ( not ( = ?auto_406226 ?auto_406229 ) ) ( not ( = ?auto_406226 ?auto_406230 ) ) ( not ( = ?auto_406226 ?auto_406231 ) ) ( not ( = ?auto_406226 ?auto_406232 ) ) ( not ( = ?auto_406226 ?auto_406233 ) ) ( not ( = ?auto_406226 ?auto_406234 ) ) ( not ( = ?auto_406226 ?auto_406235 ) ) ( not ( = ?auto_406226 ?auto_406236 ) ) ( not ( = ?auto_406226 ?auto_406237 ) ) ( not ( = ?auto_406226 ?auto_406238 ) ) ( not ( = ?auto_406226 ?auto_406239 ) ) ( not ( = ?auto_406226 ?auto_406240 ) ) ( not ( = ?auto_406227 ?auto_406228 ) ) ( not ( = ?auto_406227 ?auto_406229 ) ) ( not ( = ?auto_406227 ?auto_406230 ) ) ( not ( = ?auto_406227 ?auto_406231 ) ) ( not ( = ?auto_406227 ?auto_406232 ) ) ( not ( = ?auto_406227 ?auto_406233 ) ) ( not ( = ?auto_406227 ?auto_406234 ) ) ( not ( = ?auto_406227 ?auto_406235 ) ) ( not ( = ?auto_406227 ?auto_406236 ) ) ( not ( = ?auto_406227 ?auto_406237 ) ) ( not ( = ?auto_406227 ?auto_406238 ) ) ( not ( = ?auto_406227 ?auto_406239 ) ) ( not ( = ?auto_406227 ?auto_406240 ) ) ( not ( = ?auto_406228 ?auto_406229 ) ) ( not ( = ?auto_406228 ?auto_406230 ) ) ( not ( = ?auto_406228 ?auto_406231 ) ) ( not ( = ?auto_406228 ?auto_406232 ) ) ( not ( = ?auto_406228 ?auto_406233 ) ) ( not ( = ?auto_406228 ?auto_406234 ) ) ( not ( = ?auto_406228 ?auto_406235 ) ) ( not ( = ?auto_406228 ?auto_406236 ) ) ( not ( = ?auto_406228 ?auto_406237 ) ) ( not ( = ?auto_406228 ?auto_406238 ) ) ( not ( = ?auto_406228 ?auto_406239 ) ) ( not ( = ?auto_406228 ?auto_406240 ) ) ( not ( = ?auto_406229 ?auto_406230 ) ) ( not ( = ?auto_406229 ?auto_406231 ) ) ( not ( = ?auto_406229 ?auto_406232 ) ) ( not ( = ?auto_406229 ?auto_406233 ) ) ( not ( = ?auto_406229 ?auto_406234 ) ) ( not ( = ?auto_406229 ?auto_406235 ) ) ( not ( = ?auto_406229 ?auto_406236 ) ) ( not ( = ?auto_406229 ?auto_406237 ) ) ( not ( = ?auto_406229 ?auto_406238 ) ) ( not ( = ?auto_406229 ?auto_406239 ) ) ( not ( = ?auto_406229 ?auto_406240 ) ) ( not ( = ?auto_406230 ?auto_406231 ) ) ( not ( = ?auto_406230 ?auto_406232 ) ) ( not ( = ?auto_406230 ?auto_406233 ) ) ( not ( = ?auto_406230 ?auto_406234 ) ) ( not ( = ?auto_406230 ?auto_406235 ) ) ( not ( = ?auto_406230 ?auto_406236 ) ) ( not ( = ?auto_406230 ?auto_406237 ) ) ( not ( = ?auto_406230 ?auto_406238 ) ) ( not ( = ?auto_406230 ?auto_406239 ) ) ( not ( = ?auto_406230 ?auto_406240 ) ) ( not ( = ?auto_406231 ?auto_406232 ) ) ( not ( = ?auto_406231 ?auto_406233 ) ) ( not ( = ?auto_406231 ?auto_406234 ) ) ( not ( = ?auto_406231 ?auto_406235 ) ) ( not ( = ?auto_406231 ?auto_406236 ) ) ( not ( = ?auto_406231 ?auto_406237 ) ) ( not ( = ?auto_406231 ?auto_406238 ) ) ( not ( = ?auto_406231 ?auto_406239 ) ) ( not ( = ?auto_406231 ?auto_406240 ) ) ( not ( = ?auto_406232 ?auto_406233 ) ) ( not ( = ?auto_406232 ?auto_406234 ) ) ( not ( = ?auto_406232 ?auto_406235 ) ) ( not ( = ?auto_406232 ?auto_406236 ) ) ( not ( = ?auto_406232 ?auto_406237 ) ) ( not ( = ?auto_406232 ?auto_406238 ) ) ( not ( = ?auto_406232 ?auto_406239 ) ) ( not ( = ?auto_406232 ?auto_406240 ) ) ( not ( = ?auto_406233 ?auto_406234 ) ) ( not ( = ?auto_406233 ?auto_406235 ) ) ( not ( = ?auto_406233 ?auto_406236 ) ) ( not ( = ?auto_406233 ?auto_406237 ) ) ( not ( = ?auto_406233 ?auto_406238 ) ) ( not ( = ?auto_406233 ?auto_406239 ) ) ( not ( = ?auto_406233 ?auto_406240 ) ) ( not ( = ?auto_406234 ?auto_406235 ) ) ( not ( = ?auto_406234 ?auto_406236 ) ) ( not ( = ?auto_406234 ?auto_406237 ) ) ( not ( = ?auto_406234 ?auto_406238 ) ) ( not ( = ?auto_406234 ?auto_406239 ) ) ( not ( = ?auto_406234 ?auto_406240 ) ) ( not ( = ?auto_406235 ?auto_406236 ) ) ( not ( = ?auto_406235 ?auto_406237 ) ) ( not ( = ?auto_406235 ?auto_406238 ) ) ( not ( = ?auto_406235 ?auto_406239 ) ) ( not ( = ?auto_406235 ?auto_406240 ) ) ( not ( = ?auto_406236 ?auto_406237 ) ) ( not ( = ?auto_406236 ?auto_406238 ) ) ( not ( = ?auto_406236 ?auto_406239 ) ) ( not ( = ?auto_406236 ?auto_406240 ) ) ( not ( = ?auto_406237 ?auto_406238 ) ) ( not ( = ?auto_406237 ?auto_406239 ) ) ( not ( = ?auto_406237 ?auto_406240 ) ) ( not ( = ?auto_406238 ?auto_406239 ) ) ( not ( = ?auto_406238 ?auto_406240 ) ) ( not ( = ?auto_406239 ?auto_406240 ) ) ( ON ?auto_406238 ?auto_406239 ) ( ON ?auto_406237 ?auto_406238 ) ( ON ?auto_406236 ?auto_406237 ) ( ON ?auto_406235 ?auto_406236 ) ( ON ?auto_406234 ?auto_406235 ) ( ON ?auto_406233 ?auto_406234 ) ( CLEAR ?auto_406231 ) ( ON ?auto_406232 ?auto_406233 ) ( CLEAR ?auto_406232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_406226 ?auto_406227 ?auto_406228 ?auto_406229 ?auto_406230 ?auto_406231 ?auto_406232 )
      ( MAKE-14PILE ?auto_406226 ?auto_406227 ?auto_406228 ?auto_406229 ?auto_406230 ?auto_406231 ?auto_406232 ?auto_406233 ?auto_406234 ?auto_406235 ?auto_406236 ?auto_406237 ?auto_406238 ?auto_406239 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_406284 - BLOCK
      ?auto_406285 - BLOCK
      ?auto_406286 - BLOCK
      ?auto_406287 - BLOCK
      ?auto_406288 - BLOCK
      ?auto_406289 - BLOCK
      ?auto_406290 - BLOCK
      ?auto_406291 - BLOCK
      ?auto_406292 - BLOCK
      ?auto_406293 - BLOCK
      ?auto_406294 - BLOCK
      ?auto_406295 - BLOCK
      ?auto_406296 - BLOCK
      ?auto_406297 - BLOCK
    )
    :vars
    (
      ?auto_406298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_406297 ?auto_406298 ) ( ON-TABLE ?auto_406284 ) ( ON ?auto_406285 ?auto_406284 ) ( ON ?auto_406286 ?auto_406285 ) ( ON ?auto_406287 ?auto_406286 ) ( ON ?auto_406288 ?auto_406287 ) ( not ( = ?auto_406284 ?auto_406285 ) ) ( not ( = ?auto_406284 ?auto_406286 ) ) ( not ( = ?auto_406284 ?auto_406287 ) ) ( not ( = ?auto_406284 ?auto_406288 ) ) ( not ( = ?auto_406284 ?auto_406289 ) ) ( not ( = ?auto_406284 ?auto_406290 ) ) ( not ( = ?auto_406284 ?auto_406291 ) ) ( not ( = ?auto_406284 ?auto_406292 ) ) ( not ( = ?auto_406284 ?auto_406293 ) ) ( not ( = ?auto_406284 ?auto_406294 ) ) ( not ( = ?auto_406284 ?auto_406295 ) ) ( not ( = ?auto_406284 ?auto_406296 ) ) ( not ( = ?auto_406284 ?auto_406297 ) ) ( not ( = ?auto_406284 ?auto_406298 ) ) ( not ( = ?auto_406285 ?auto_406286 ) ) ( not ( = ?auto_406285 ?auto_406287 ) ) ( not ( = ?auto_406285 ?auto_406288 ) ) ( not ( = ?auto_406285 ?auto_406289 ) ) ( not ( = ?auto_406285 ?auto_406290 ) ) ( not ( = ?auto_406285 ?auto_406291 ) ) ( not ( = ?auto_406285 ?auto_406292 ) ) ( not ( = ?auto_406285 ?auto_406293 ) ) ( not ( = ?auto_406285 ?auto_406294 ) ) ( not ( = ?auto_406285 ?auto_406295 ) ) ( not ( = ?auto_406285 ?auto_406296 ) ) ( not ( = ?auto_406285 ?auto_406297 ) ) ( not ( = ?auto_406285 ?auto_406298 ) ) ( not ( = ?auto_406286 ?auto_406287 ) ) ( not ( = ?auto_406286 ?auto_406288 ) ) ( not ( = ?auto_406286 ?auto_406289 ) ) ( not ( = ?auto_406286 ?auto_406290 ) ) ( not ( = ?auto_406286 ?auto_406291 ) ) ( not ( = ?auto_406286 ?auto_406292 ) ) ( not ( = ?auto_406286 ?auto_406293 ) ) ( not ( = ?auto_406286 ?auto_406294 ) ) ( not ( = ?auto_406286 ?auto_406295 ) ) ( not ( = ?auto_406286 ?auto_406296 ) ) ( not ( = ?auto_406286 ?auto_406297 ) ) ( not ( = ?auto_406286 ?auto_406298 ) ) ( not ( = ?auto_406287 ?auto_406288 ) ) ( not ( = ?auto_406287 ?auto_406289 ) ) ( not ( = ?auto_406287 ?auto_406290 ) ) ( not ( = ?auto_406287 ?auto_406291 ) ) ( not ( = ?auto_406287 ?auto_406292 ) ) ( not ( = ?auto_406287 ?auto_406293 ) ) ( not ( = ?auto_406287 ?auto_406294 ) ) ( not ( = ?auto_406287 ?auto_406295 ) ) ( not ( = ?auto_406287 ?auto_406296 ) ) ( not ( = ?auto_406287 ?auto_406297 ) ) ( not ( = ?auto_406287 ?auto_406298 ) ) ( not ( = ?auto_406288 ?auto_406289 ) ) ( not ( = ?auto_406288 ?auto_406290 ) ) ( not ( = ?auto_406288 ?auto_406291 ) ) ( not ( = ?auto_406288 ?auto_406292 ) ) ( not ( = ?auto_406288 ?auto_406293 ) ) ( not ( = ?auto_406288 ?auto_406294 ) ) ( not ( = ?auto_406288 ?auto_406295 ) ) ( not ( = ?auto_406288 ?auto_406296 ) ) ( not ( = ?auto_406288 ?auto_406297 ) ) ( not ( = ?auto_406288 ?auto_406298 ) ) ( not ( = ?auto_406289 ?auto_406290 ) ) ( not ( = ?auto_406289 ?auto_406291 ) ) ( not ( = ?auto_406289 ?auto_406292 ) ) ( not ( = ?auto_406289 ?auto_406293 ) ) ( not ( = ?auto_406289 ?auto_406294 ) ) ( not ( = ?auto_406289 ?auto_406295 ) ) ( not ( = ?auto_406289 ?auto_406296 ) ) ( not ( = ?auto_406289 ?auto_406297 ) ) ( not ( = ?auto_406289 ?auto_406298 ) ) ( not ( = ?auto_406290 ?auto_406291 ) ) ( not ( = ?auto_406290 ?auto_406292 ) ) ( not ( = ?auto_406290 ?auto_406293 ) ) ( not ( = ?auto_406290 ?auto_406294 ) ) ( not ( = ?auto_406290 ?auto_406295 ) ) ( not ( = ?auto_406290 ?auto_406296 ) ) ( not ( = ?auto_406290 ?auto_406297 ) ) ( not ( = ?auto_406290 ?auto_406298 ) ) ( not ( = ?auto_406291 ?auto_406292 ) ) ( not ( = ?auto_406291 ?auto_406293 ) ) ( not ( = ?auto_406291 ?auto_406294 ) ) ( not ( = ?auto_406291 ?auto_406295 ) ) ( not ( = ?auto_406291 ?auto_406296 ) ) ( not ( = ?auto_406291 ?auto_406297 ) ) ( not ( = ?auto_406291 ?auto_406298 ) ) ( not ( = ?auto_406292 ?auto_406293 ) ) ( not ( = ?auto_406292 ?auto_406294 ) ) ( not ( = ?auto_406292 ?auto_406295 ) ) ( not ( = ?auto_406292 ?auto_406296 ) ) ( not ( = ?auto_406292 ?auto_406297 ) ) ( not ( = ?auto_406292 ?auto_406298 ) ) ( not ( = ?auto_406293 ?auto_406294 ) ) ( not ( = ?auto_406293 ?auto_406295 ) ) ( not ( = ?auto_406293 ?auto_406296 ) ) ( not ( = ?auto_406293 ?auto_406297 ) ) ( not ( = ?auto_406293 ?auto_406298 ) ) ( not ( = ?auto_406294 ?auto_406295 ) ) ( not ( = ?auto_406294 ?auto_406296 ) ) ( not ( = ?auto_406294 ?auto_406297 ) ) ( not ( = ?auto_406294 ?auto_406298 ) ) ( not ( = ?auto_406295 ?auto_406296 ) ) ( not ( = ?auto_406295 ?auto_406297 ) ) ( not ( = ?auto_406295 ?auto_406298 ) ) ( not ( = ?auto_406296 ?auto_406297 ) ) ( not ( = ?auto_406296 ?auto_406298 ) ) ( not ( = ?auto_406297 ?auto_406298 ) ) ( ON ?auto_406296 ?auto_406297 ) ( ON ?auto_406295 ?auto_406296 ) ( ON ?auto_406294 ?auto_406295 ) ( ON ?auto_406293 ?auto_406294 ) ( ON ?auto_406292 ?auto_406293 ) ( ON ?auto_406291 ?auto_406292 ) ( ON ?auto_406290 ?auto_406291 ) ( CLEAR ?auto_406288 ) ( ON ?auto_406289 ?auto_406290 ) ( CLEAR ?auto_406289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_406284 ?auto_406285 ?auto_406286 ?auto_406287 ?auto_406288 ?auto_406289 )
      ( MAKE-14PILE ?auto_406284 ?auto_406285 ?auto_406286 ?auto_406287 ?auto_406288 ?auto_406289 ?auto_406290 ?auto_406291 ?auto_406292 ?auto_406293 ?auto_406294 ?auto_406295 ?auto_406296 ?auto_406297 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_406342 - BLOCK
      ?auto_406343 - BLOCK
      ?auto_406344 - BLOCK
      ?auto_406345 - BLOCK
      ?auto_406346 - BLOCK
      ?auto_406347 - BLOCK
      ?auto_406348 - BLOCK
      ?auto_406349 - BLOCK
      ?auto_406350 - BLOCK
      ?auto_406351 - BLOCK
      ?auto_406352 - BLOCK
      ?auto_406353 - BLOCK
      ?auto_406354 - BLOCK
      ?auto_406355 - BLOCK
    )
    :vars
    (
      ?auto_406356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_406355 ?auto_406356 ) ( ON-TABLE ?auto_406342 ) ( ON ?auto_406343 ?auto_406342 ) ( ON ?auto_406344 ?auto_406343 ) ( ON ?auto_406345 ?auto_406344 ) ( not ( = ?auto_406342 ?auto_406343 ) ) ( not ( = ?auto_406342 ?auto_406344 ) ) ( not ( = ?auto_406342 ?auto_406345 ) ) ( not ( = ?auto_406342 ?auto_406346 ) ) ( not ( = ?auto_406342 ?auto_406347 ) ) ( not ( = ?auto_406342 ?auto_406348 ) ) ( not ( = ?auto_406342 ?auto_406349 ) ) ( not ( = ?auto_406342 ?auto_406350 ) ) ( not ( = ?auto_406342 ?auto_406351 ) ) ( not ( = ?auto_406342 ?auto_406352 ) ) ( not ( = ?auto_406342 ?auto_406353 ) ) ( not ( = ?auto_406342 ?auto_406354 ) ) ( not ( = ?auto_406342 ?auto_406355 ) ) ( not ( = ?auto_406342 ?auto_406356 ) ) ( not ( = ?auto_406343 ?auto_406344 ) ) ( not ( = ?auto_406343 ?auto_406345 ) ) ( not ( = ?auto_406343 ?auto_406346 ) ) ( not ( = ?auto_406343 ?auto_406347 ) ) ( not ( = ?auto_406343 ?auto_406348 ) ) ( not ( = ?auto_406343 ?auto_406349 ) ) ( not ( = ?auto_406343 ?auto_406350 ) ) ( not ( = ?auto_406343 ?auto_406351 ) ) ( not ( = ?auto_406343 ?auto_406352 ) ) ( not ( = ?auto_406343 ?auto_406353 ) ) ( not ( = ?auto_406343 ?auto_406354 ) ) ( not ( = ?auto_406343 ?auto_406355 ) ) ( not ( = ?auto_406343 ?auto_406356 ) ) ( not ( = ?auto_406344 ?auto_406345 ) ) ( not ( = ?auto_406344 ?auto_406346 ) ) ( not ( = ?auto_406344 ?auto_406347 ) ) ( not ( = ?auto_406344 ?auto_406348 ) ) ( not ( = ?auto_406344 ?auto_406349 ) ) ( not ( = ?auto_406344 ?auto_406350 ) ) ( not ( = ?auto_406344 ?auto_406351 ) ) ( not ( = ?auto_406344 ?auto_406352 ) ) ( not ( = ?auto_406344 ?auto_406353 ) ) ( not ( = ?auto_406344 ?auto_406354 ) ) ( not ( = ?auto_406344 ?auto_406355 ) ) ( not ( = ?auto_406344 ?auto_406356 ) ) ( not ( = ?auto_406345 ?auto_406346 ) ) ( not ( = ?auto_406345 ?auto_406347 ) ) ( not ( = ?auto_406345 ?auto_406348 ) ) ( not ( = ?auto_406345 ?auto_406349 ) ) ( not ( = ?auto_406345 ?auto_406350 ) ) ( not ( = ?auto_406345 ?auto_406351 ) ) ( not ( = ?auto_406345 ?auto_406352 ) ) ( not ( = ?auto_406345 ?auto_406353 ) ) ( not ( = ?auto_406345 ?auto_406354 ) ) ( not ( = ?auto_406345 ?auto_406355 ) ) ( not ( = ?auto_406345 ?auto_406356 ) ) ( not ( = ?auto_406346 ?auto_406347 ) ) ( not ( = ?auto_406346 ?auto_406348 ) ) ( not ( = ?auto_406346 ?auto_406349 ) ) ( not ( = ?auto_406346 ?auto_406350 ) ) ( not ( = ?auto_406346 ?auto_406351 ) ) ( not ( = ?auto_406346 ?auto_406352 ) ) ( not ( = ?auto_406346 ?auto_406353 ) ) ( not ( = ?auto_406346 ?auto_406354 ) ) ( not ( = ?auto_406346 ?auto_406355 ) ) ( not ( = ?auto_406346 ?auto_406356 ) ) ( not ( = ?auto_406347 ?auto_406348 ) ) ( not ( = ?auto_406347 ?auto_406349 ) ) ( not ( = ?auto_406347 ?auto_406350 ) ) ( not ( = ?auto_406347 ?auto_406351 ) ) ( not ( = ?auto_406347 ?auto_406352 ) ) ( not ( = ?auto_406347 ?auto_406353 ) ) ( not ( = ?auto_406347 ?auto_406354 ) ) ( not ( = ?auto_406347 ?auto_406355 ) ) ( not ( = ?auto_406347 ?auto_406356 ) ) ( not ( = ?auto_406348 ?auto_406349 ) ) ( not ( = ?auto_406348 ?auto_406350 ) ) ( not ( = ?auto_406348 ?auto_406351 ) ) ( not ( = ?auto_406348 ?auto_406352 ) ) ( not ( = ?auto_406348 ?auto_406353 ) ) ( not ( = ?auto_406348 ?auto_406354 ) ) ( not ( = ?auto_406348 ?auto_406355 ) ) ( not ( = ?auto_406348 ?auto_406356 ) ) ( not ( = ?auto_406349 ?auto_406350 ) ) ( not ( = ?auto_406349 ?auto_406351 ) ) ( not ( = ?auto_406349 ?auto_406352 ) ) ( not ( = ?auto_406349 ?auto_406353 ) ) ( not ( = ?auto_406349 ?auto_406354 ) ) ( not ( = ?auto_406349 ?auto_406355 ) ) ( not ( = ?auto_406349 ?auto_406356 ) ) ( not ( = ?auto_406350 ?auto_406351 ) ) ( not ( = ?auto_406350 ?auto_406352 ) ) ( not ( = ?auto_406350 ?auto_406353 ) ) ( not ( = ?auto_406350 ?auto_406354 ) ) ( not ( = ?auto_406350 ?auto_406355 ) ) ( not ( = ?auto_406350 ?auto_406356 ) ) ( not ( = ?auto_406351 ?auto_406352 ) ) ( not ( = ?auto_406351 ?auto_406353 ) ) ( not ( = ?auto_406351 ?auto_406354 ) ) ( not ( = ?auto_406351 ?auto_406355 ) ) ( not ( = ?auto_406351 ?auto_406356 ) ) ( not ( = ?auto_406352 ?auto_406353 ) ) ( not ( = ?auto_406352 ?auto_406354 ) ) ( not ( = ?auto_406352 ?auto_406355 ) ) ( not ( = ?auto_406352 ?auto_406356 ) ) ( not ( = ?auto_406353 ?auto_406354 ) ) ( not ( = ?auto_406353 ?auto_406355 ) ) ( not ( = ?auto_406353 ?auto_406356 ) ) ( not ( = ?auto_406354 ?auto_406355 ) ) ( not ( = ?auto_406354 ?auto_406356 ) ) ( not ( = ?auto_406355 ?auto_406356 ) ) ( ON ?auto_406354 ?auto_406355 ) ( ON ?auto_406353 ?auto_406354 ) ( ON ?auto_406352 ?auto_406353 ) ( ON ?auto_406351 ?auto_406352 ) ( ON ?auto_406350 ?auto_406351 ) ( ON ?auto_406349 ?auto_406350 ) ( ON ?auto_406348 ?auto_406349 ) ( ON ?auto_406347 ?auto_406348 ) ( CLEAR ?auto_406345 ) ( ON ?auto_406346 ?auto_406347 ) ( CLEAR ?auto_406346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_406342 ?auto_406343 ?auto_406344 ?auto_406345 ?auto_406346 )
      ( MAKE-14PILE ?auto_406342 ?auto_406343 ?auto_406344 ?auto_406345 ?auto_406346 ?auto_406347 ?auto_406348 ?auto_406349 ?auto_406350 ?auto_406351 ?auto_406352 ?auto_406353 ?auto_406354 ?auto_406355 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_406400 - BLOCK
      ?auto_406401 - BLOCK
      ?auto_406402 - BLOCK
      ?auto_406403 - BLOCK
      ?auto_406404 - BLOCK
      ?auto_406405 - BLOCK
      ?auto_406406 - BLOCK
      ?auto_406407 - BLOCK
      ?auto_406408 - BLOCK
      ?auto_406409 - BLOCK
      ?auto_406410 - BLOCK
      ?auto_406411 - BLOCK
      ?auto_406412 - BLOCK
      ?auto_406413 - BLOCK
    )
    :vars
    (
      ?auto_406414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_406413 ?auto_406414 ) ( ON-TABLE ?auto_406400 ) ( ON ?auto_406401 ?auto_406400 ) ( ON ?auto_406402 ?auto_406401 ) ( not ( = ?auto_406400 ?auto_406401 ) ) ( not ( = ?auto_406400 ?auto_406402 ) ) ( not ( = ?auto_406400 ?auto_406403 ) ) ( not ( = ?auto_406400 ?auto_406404 ) ) ( not ( = ?auto_406400 ?auto_406405 ) ) ( not ( = ?auto_406400 ?auto_406406 ) ) ( not ( = ?auto_406400 ?auto_406407 ) ) ( not ( = ?auto_406400 ?auto_406408 ) ) ( not ( = ?auto_406400 ?auto_406409 ) ) ( not ( = ?auto_406400 ?auto_406410 ) ) ( not ( = ?auto_406400 ?auto_406411 ) ) ( not ( = ?auto_406400 ?auto_406412 ) ) ( not ( = ?auto_406400 ?auto_406413 ) ) ( not ( = ?auto_406400 ?auto_406414 ) ) ( not ( = ?auto_406401 ?auto_406402 ) ) ( not ( = ?auto_406401 ?auto_406403 ) ) ( not ( = ?auto_406401 ?auto_406404 ) ) ( not ( = ?auto_406401 ?auto_406405 ) ) ( not ( = ?auto_406401 ?auto_406406 ) ) ( not ( = ?auto_406401 ?auto_406407 ) ) ( not ( = ?auto_406401 ?auto_406408 ) ) ( not ( = ?auto_406401 ?auto_406409 ) ) ( not ( = ?auto_406401 ?auto_406410 ) ) ( not ( = ?auto_406401 ?auto_406411 ) ) ( not ( = ?auto_406401 ?auto_406412 ) ) ( not ( = ?auto_406401 ?auto_406413 ) ) ( not ( = ?auto_406401 ?auto_406414 ) ) ( not ( = ?auto_406402 ?auto_406403 ) ) ( not ( = ?auto_406402 ?auto_406404 ) ) ( not ( = ?auto_406402 ?auto_406405 ) ) ( not ( = ?auto_406402 ?auto_406406 ) ) ( not ( = ?auto_406402 ?auto_406407 ) ) ( not ( = ?auto_406402 ?auto_406408 ) ) ( not ( = ?auto_406402 ?auto_406409 ) ) ( not ( = ?auto_406402 ?auto_406410 ) ) ( not ( = ?auto_406402 ?auto_406411 ) ) ( not ( = ?auto_406402 ?auto_406412 ) ) ( not ( = ?auto_406402 ?auto_406413 ) ) ( not ( = ?auto_406402 ?auto_406414 ) ) ( not ( = ?auto_406403 ?auto_406404 ) ) ( not ( = ?auto_406403 ?auto_406405 ) ) ( not ( = ?auto_406403 ?auto_406406 ) ) ( not ( = ?auto_406403 ?auto_406407 ) ) ( not ( = ?auto_406403 ?auto_406408 ) ) ( not ( = ?auto_406403 ?auto_406409 ) ) ( not ( = ?auto_406403 ?auto_406410 ) ) ( not ( = ?auto_406403 ?auto_406411 ) ) ( not ( = ?auto_406403 ?auto_406412 ) ) ( not ( = ?auto_406403 ?auto_406413 ) ) ( not ( = ?auto_406403 ?auto_406414 ) ) ( not ( = ?auto_406404 ?auto_406405 ) ) ( not ( = ?auto_406404 ?auto_406406 ) ) ( not ( = ?auto_406404 ?auto_406407 ) ) ( not ( = ?auto_406404 ?auto_406408 ) ) ( not ( = ?auto_406404 ?auto_406409 ) ) ( not ( = ?auto_406404 ?auto_406410 ) ) ( not ( = ?auto_406404 ?auto_406411 ) ) ( not ( = ?auto_406404 ?auto_406412 ) ) ( not ( = ?auto_406404 ?auto_406413 ) ) ( not ( = ?auto_406404 ?auto_406414 ) ) ( not ( = ?auto_406405 ?auto_406406 ) ) ( not ( = ?auto_406405 ?auto_406407 ) ) ( not ( = ?auto_406405 ?auto_406408 ) ) ( not ( = ?auto_406405 ?auto_406409 ) ) ( not ( = ?auto_406405 ?auto_406410 ) ) ( not ( = ?auto_406405 ?auto_406411 ) ) ( not ( = ?auto_406405 ?auto_406412 ) ) ( not ( = ?auto_406405 ?auto_406413 ) ) ( not ( = ?auto_406405 ?auto_406414 ) ) ( not ( = ?auto_406406 ?auto_406407 ) ) ( not ( = ?auto_406406 ?auto_406408 ) ) ( not ( = ?auto_406406 ?auto_406409 ) ) ( not ( = ?auto_406406 ?auto_406410 ) ) ( not ( = ?auto_406406 ?auto_406411 ) ) ( not ( = ?auto_406406 ?auto_406412 ) ) ( not ( = ?auto_406406 ?auto_406413 ) ) ( not ( = ?auto_406406 ?auto_406414 ) ) ( not ( = ?auto_406407 ?auto_406408 ) ) ( not ( = ?auto_406407 ?auto_406409 ) ) ( not ( = ?auto_406407 ?auto_406410 ) ) ( not ( = ?auto_406407 ?auto_406411 ) ) ( not ( = ?auto_406407 ?auto_406412 ) ) ( not ( = ?auto_406407 ?auto_406413 ) ) ( not ( = ?auto_406407 ?auto_406414 ) ) ( not ( = ?auto_406408 ?auto_406409 ) ) ( not ( = ?auto_406408 ?auto_406410 ) ) ( not ( = ?auto_406408 ?auto_406411 ) ) ( not ( = ?auto_406408 ?auto_406412 ) ) ( not ( = ?auto_406408 ?auto_406413 ) ) ( not ( = ?auto_406408 ?auto_406414 ) ) ( not ( = ?auto_406409 ?auto_406410 ) ) ( not ( = ?auto_406409 ?auto_406411 ) ) ( not ( = ?auto_406409 ?auto_406412 ) ) ( not ( = ?auto_406409 ?auto_406413 ) ) ( not ( = ?auto_406409 ?auto_406414 ) ) ( not ( = ?auto_406410 ?auto_406411 ) ) ( not ( = ?auto_406410 ?auto_406412 ) ) ( not ( = ?auto_406410 ?auto_406413 ) ) ( not ( = ?auto_406410 ?auto_406414 ) ) ( not ( = ?auto_406411 ?auto_406412 ) ) ( not ( = ?auto_406411 ?auto_406413 ) ) ( not ( = ?auto_406411 ?auto_406414 ) ) ( not ( = ?auto_406412 ?auto_406413 ) ) ( not ( = ?auto_406412 ?auto_406414 ) ) ( not ( = ?auto_406413 ?auto_406414 ) ) ( ON ?auto_406412 ?auto_406413 ) ( ON ?auto_406411 ?auto_406412 ) ( ON ?auto_406410 ?auto_406411 ) ( ON ?auto_406409 ?auto_406410 ) ( ON ?auto_406408 ?auto_406409 ) ( ON ?auto_406407 ?auto_406408 ) ( ON ?auto_406406 ?auto_406407 ) ( ON ?auto_406405 ?auto_406406 ) ( ON ?auto_406404 ?auto_406405 ) ( CLEAR ?auto_406402 ) ( ON ?auto_406403 ?auto_406404 ) ( CLEAR ?auto_406403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_406400 ?auto_406401 ?auto_406402 ?auto_406403 )
      ( MAKE-14PILE ?auto_406400 ?auto_406401 ?auto_406402 ?auto_406403 ?auto_406404 ?auto_406405 ?auto_406406 ?auto_406407 ?auto_406408 ?auto_406409 ?auto_406410 ?auto_406411 ?auto_406412 ?auto_406413 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_406458 - BLOCK
      ?auto_406459 - BLOCK
      ?auto_406460 - BLOCK
      ?auto_406461 - BLOCK
      ?auto_406462 - BLOCK
      ?auto_406463 - BLOCK
      ?auto_406464 - BLOCK
      ?auto_406465 - BLOCK
      ?auto_406466 - BLOCK
      ?auto_406467 - BLOCK
      ?auto_406468 - BLOCK
      ?auto_406469 - BLOCK
      ?auto_406470 - BLOCK
      ?auto_406471 - BLOCK
    )
    :vars
    (
      ?auto_406472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_406471 ?auto_406472 ) ( ON-TABLE ?auto_406458 ) ( ON ?auto_406459 ?auto_406458 ) ( not ( = ?auto_406458 ?auto_406459 ) ) ( not ( = ?auto_406458 ?auto_406460 ) ) ( not ( = ?auto_406458 ?auto_406461 ) ) ( not ( = ?auto_406458 ?auto_406462 ) ) ( not ( = ?auto_406458 ?auto_406463 ) ) ( not ( = ?auto_406458 ?auto_406464 ) ) ( not ( = ?auto_406458 ?auto_406465 ) ) ( not ( = ?auto_406458 ?auto_406466 ) ) ( not ( = ?auto_406458 ?auto_406467 ) ) ( not ( = ?auto_406458 ?auto_406468 ) ) ( not ( = ?auto_406458 ?auto_406469 ) ) ( not ( = ?auto_406458 ?auto_406470 ) ) ( not ( = ?auto_406458 ?auto_406471 ) ) ( not ( = ?auto_406458 ?auto_406472 ) ) ( not ( = ?auto_406459 ?auto_406460 ) ) ( not ( = ?auto_406459 ?auto_406461 ) ) ( not ( = ?auto_406459 ?auto_406462 ) ) ( not ( = ?auto_406459 ?auto_406463 ) ) ( not ( = ?auto_406459 ?auto_406464 ) ) ( not ( = ?auto_406459 ?auto_406465 ) ) ( not ( = ?auto_406459 ?auto_406466 ) ) ( not ( = ?auto_406459 ?auto_406467 ) ) ( not ( = ?auto_406459 ?auto_406468 ) ) ( not ( = ?auto_406459 ?auto_406469 ) ) ( not ( = ?auto_406459 ?auto_406470 ) ) ( not ( = ?auto_406459 ?auto_406471 ) ) ( not ( = ?auto_406459 ?auto_406472 ) ) ( not ( = ?auto_406460 ?auto_406461 ) ) ( not ( = ?auto_406460 ?auto_406462 ) ) ( not ( = ?auto_406460 ?auto_406463 ) ) ( not ( = ?auto_406460 ?auto_406464 ) ) ( not ( = ?auto_406460 ?auto_406465 ) ) ( not ( = ?auto_406460 ?auto_406466 ) ) ( not ( = ?auto_406460 ?auto_406467 ) ) ( not ( = ?auto_406460 ?auto_406468 ) ) ( not ( = ?auto_406460 ?auto_406469 ) ) ( not ( = ?auto_406460 ?auto_406470 ) ) ( not ( = ?auto_406460 ?auto_406471 ) ) ( not ( = ?auto_406460 ?auto_406472 ) ) ( not ( = ?auto_406461 ?auto_406462 ) ) ( not ( = ?auto_406461 ?auto_406463 ) ) ( not ( = ?auto_406461 ?auto_406464 ) ) ( not ( = ?auto_406461 ?auto_406465 ) ) ( not ( = ?auto_406461 ?auto_406466 ) ) ( not ( = ?auto_406461 ?auto_406467 ) ) ( not ( = ?auto_406461 ?auto_406468 ) ) ( not ( = ?auto_406461 ?auto_406469 ) ) ( not ( = ?auto_406461 ?auto_406470 ) ) ( not ( = ?auto_406461 ?auto_406471 ) ) ( not ( = ?auto_406461 ?auto_406472 ) ) ( not ( = ?auto_406462 ?auto_406463 ) ) ( not ( = ?auto_406462 ?auto_406464 ) ) ( not ( = ?auto_406462 ?auto_406465 ) ) ( not ( = ?auto_406462 ?auto_406466 ) ) ( not ( = ?auto_406462 ?auto_406467 ) ) ( not ( = ?auto_406462 ?auto_406468 ) ) ( not ( = ?auto_406462 ?auto_406469 ) ) ( not ( = ?auto_406462 ?auto_406470 ) ) ( not ( = ?auto_406462 ?auto_406471 ) ) ( not ( = ?auto_406462 ?auto_406472 ) ) ( not ( = ?auto_406463 ?auto_406464 ) ) ( not ( = ?auto_406463 ?auto_406465 ) ) ( not ( = ?auto_406463 ?auto_406466 ) ) ( not ( = ?auto_406463 ?auto_406467 ) ) ( not ( = ?auto_406463 ?auto_406468 ) ) ( not ( = ?auto_406463 ?auto_406469 ) ) ( not ( = ?auto_406463 ?auto_406470 ) ) ( not ( = ?auto_406463 ?auto_406471 ) ) ( not ( = ?auto_406463 ?auto_406472 ) ) ( not ( = ?auto_406464 ?auto_406465 ) ) ( not ( = ?auto_406464 ?auto_406466 ) ) ( not ( = ?auto_406464 ?auto_406467 ) ) ( not ( = ?auto_406464 ?auto_406468 ) ) ( not ( = ?auto_406464 ?auto_406469 ) ) ( not ( = ?auto_406464 ?auto_406470 ) ) ( not ( = ?auto_406464 ?auto_406471 ) ) ( not ( = ?auto_406464 ?auto_406472 ) ) ( not ( = ?auto_406465 ?auto_406466 ) ) ( not ( = ?auto_406465 ?auto_406467 ) ) ( not ( = ?auto_406465 ?auto_406468 ) ) ( not ( = ?auto_406465 ?auto_406469 ) ) ( not ( = ?auto_406465 ?auto_406470 ) ) ( not ( = ?auto_406465 ?auto_406471 ) ) ( not ( = ?auto_406465 ?auto_406472 ) ) ( not ( = ?auto_406466 ?auto_406467 ) ) ( not ( = ?auto_406466 ?auto_406468 ) ) ( not ( = ?auto_406466 ?auto_406469 ) ) ( not ( = ?auto_406466 ?auto_406470 ) ) ( not ( = ?auto_406466 ?auto_406471 ) ) ( not ( = ?auto_406466 ?auto_406472 ) ) ( not ( = ?auto_406467 ?auto_406468 ) ) ( not ( = ?auto_406467 ?auto_406469 ) ) ( not ( = ?auto_406467 ?auto_406470 ) ) ( not ( = ?auto_406467 ?auto_406471 ) ) ( not ( = ?auto_406467 ?auto_406472 ) ) ( not ( = ?auto_406468 ?auto_406469 ) ) ( not ( = ?auto_406468 ?auto_406470 ) ) ( not ( = ?auto_406468 ?auto_406471 ) ) ( not ( = ?auto_406468 ?auto_406472 ) ) ( not ( = ?auto_406469 ?auto_406470 ) ) ( not ( = ?auto_406469 ?auto_406471 ) ) ( not ( = ?auto_406469 ?auto_406472 ) ) ( not ( = ?auto_406470 ?auto_406471 ) ) ( not ( = ?auto_406470 ?auto_406472 ) ) ( not ( = ?auto_406471 ?auto_406472 ) ) ( ON ?auto_406470 ?auto_406471 ) ( ON ?auto_406469 ?auto_406470 ) ( ON ?auto_406468 ?auto_406469 ) ( ON ?auto_406467 ?auto_406468 ) ( ON ?auto_406466 ?auto_406467 ) ( ON ?auto_406465 ?auto_406466 ) ( ON ?auto_406464 ?auto_406465 ) ( ON ?auto_406463 ?auto_406464 ) ( ON ?auto_406462 ?auto_406463 ) ( ON ?auto_406461 ?auto_406462 ) ( CLEAR ?auto_406459 ) ( ON ?auto_406460 ?auto_406461 ) ( CLEAR ?auto_406460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_406458 ?auto_406459 ?auto_406460 )
      ( MAKE-14PILE ?auto_406458 ?auto_406459 ?auto_406460 ?auto_406461 ?auto_406462 ?auto_406463 ?auto_406464 ?auto_406465 ?auto_406466 ?auto_406467 ?auto_406468 ?auto_406469 ?auto_406470 ?auto_406471 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_406516 - BLOCK
      ?auto_406517 - BLOCK
      ?auto_406518 - BLOCK
      ?auto_406519 - BLOCK
      ?auto_406520 - BLOCK
      ?auto_406521 - BLOCK
      ?auto_406522 - BLOCK
      ?auto_406523 - BLOCK
      ?auto_406524 - BLOCK
      ?auto_406525 - BLOCK
      ?auto_406526 - BLOCK
      ?auto_406527 - BLOCK
      ?auto_406528 - BLOCK
      ?auto_406529 - BLOCK
    )
    :vars
    (
      ?auto_406530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_406529 ?auto_406530 ) ( ON-TABLE ?auto_406516 ) ( not ( = ?auto_406516 ?auto_406517 ) ) ( not ( = ?auto_406516 ?auto_406518 ) ) ( not ( = ?auto_406516 ?auto_406519 ) ) ( not ( = ?auto_406516 ?auto_406520 ) ) ( not ( = ?auto_406516 ?auto_406521 ) ) ( not ( = ?auto_406516 ?auto_406522 ) ) ( not ( = ?auto_406516 ?auto_406523 ) ) ( not ( = ?auto_406516 ?auto_406524 ) ) ( not ( = ?auto_406516 ?auto_406525 ) ) ( not ( = ?auto_406516 ?auto_406526 ) ) ( not ( = ?auto_406516 ?auto_406527 ) ) ( not ( = ?auto_406516 ?auto_406528 ) ) ( not ( = ?auto_406516 ?auto_406529 ) ) ( not ( = ?auto_406516 ?auto_406530 ) ) ( not ( = ?auto_406517 ?auto_406518 ) ) ( not ( = ?auto_406517 ?auto_406519 ) ) ( not ( = ?auto_406517 ?auto_406520 ) ) ( not ( = ?auto_406517 ?auto_406521 ) ) ( not ( = ?auto_406517 ?auto_406522 ) ) ( not ( = ?auto_406517 ?auto_406523 ) ) ( not ( = ?auto_406517 ?auto_406524 ) ) ( not ( = ?auto_406517 ?auto_406525 ) ) ( not ( = ?auto_406517 ?auto_406526 ) ) ( not ( = ?auto_406517 ?auto_406527 ) ) ( not ( = ?auto_406517 ?auto_406528 ) ) ( not ( = ?auto_406517 ?auto_406529 ) ) ( not ( = ?auto_406517 ?auto_406530 ) ) ( not ( = ?auto_406518 ?auto_406519 ) ) ( not ( = ?auto_406518 ?auto_406520 ) ) ( not ( = ?auto_406518 ?auto_406521 ) ) ( not ( = ?auto_406518 ?auto_406522 ) ) ( not ( = ?auto_406518 ?auto_406523 ) ) ( not ( = ?auto_406518 ?auto_406524 ) ) ( not ( = ?auto_406518 ?auto_406525 ) ) ( not ( = ?auto_406518 ?auto_406526 ) ) ( not ( = ?auto_406518 ?auto_406527 ) ) ( not ( = ?auto_406518 ?auto_406528 ) ) ( not ( = ?auto_406518 ?auto_406529 ) ) ( not ( = ?auto_406518 ?auto_406530 ) ) ( not ( = ?auto_406519 ?auto_406520 ) ) ( not ( = ?auto_406519 ?auto_406521 ) ) ( not ( = ?auto_406519 ?auto_406522 ) ) ( not ( = ?auto_406519 ?auto_406523 ) ) ( not ( = ?auto_406519 ?auto_406524 ) ) ( not ( = ?auto_406519 ?auto_406525 ) ) ( not ( = ?auto_406519 ?auto_406526 ) ) ( not ( = ?auto_406519 ?auto_406527 ) ) ( not ( = ?auto_406519 ?auto_406528 ) ) ( not ( = ?auto_406519 ?auto_406529 ) ) ( not ( = ?auto_406519 ?auto_406530 ) ) ( not ( = ?auto_406520 ?auto_406521 ) ) ( not ( = ?auto_406520 ?auto_406522 ) ) ( not ( = ?auto_406520 ?auto_406523 ) ) ( not ( = ?auto_406520 ?auto_406524 ) ) ( not ( = ?auto_406520 ?auto_406525 ) ) ( not ( = ?auto_406520 ?auto_406526 ) ) ( not ( = ?auto_406520 ?auto_406527 ) ) ( not ( = ?auto_406520 ?auto_406528 ) ) ( not ( = ?auto_406520 ?auto_406529 ) ) ( not ( = ?auto_406520 ?auto_406530 ) ) ( not ( = ?auto_406521 ?auto_406522 ) ) ( not ( = ?auto_406521 ?auto_406523 ) ) ( not ( = ?auto_406521 ?auto_406524 ) ) ( not ( = ?auto_406521 ?auto_406525 ) ) ( not ( = ?auto_406521 ?auto_406526 ) ) ( not ( = ?auto_406521 ?auto_406527 ) ) ( not ( = ?auto_406521 ?auto_406528 ) ) ( not ( = ?auto_406521 ?auto_406529 ) ) ( not ( = ?auto_406521 ?auto_406530 ) ) ( not ( = ?auto_406522 ?auto_406523 ) ) ( not ( = ?auto_406522 ?auto_406524 ) ) ( not ( = ?auto_406522 ?auto_406525 ) ) ( not ( = ?auto_406522 ?auto_406526 ) ) ( not ( = ?auto_406522 ?auto_406527 ) ) ( not ( = ?auto_406522 ?auto_406528 ) ) ( not ( = ?auto_406522 ?auto_406529 ) ) ( not ( = ?auto_406522 ?auto_406530 ) ) ( not ( = ?auto_406523 ?auto_406524 ) ) ( not ( = ?auto_406523 ?auto_406525 ) ) ( not ( = ?auto_406523 ?auto_406526 ) ) ( not ( = ?auto_406523 ?auto_406527 ) ) ( not ( = ?auto_406523 ?auto_406528 ) ) ( not ( = ?auto_406523 ?auto_406529 ) ) ( not ( = ?auto_406523 ?auto_406530 ) ) ( not ( = ?auto_406524 ?auto_406525 ) ) ( not ( = ?auto_406524 ?auto_406526 ) ) ( not ( = ?auto_406524 ?auto_406527 ) ) ( not ( = ?auto_406524 ?auto_406528 ) ) ( not ( = ?auto_406524 ?auto_406529 ) ) ( not ( = ?auto_406524 ?auto_406530 ) ) ( not ( = ?auto_406525 ?auto_406526 ) ) ( not ( = ?auto_406525 ?auto_406527 ) ) ( not ( = ?auto_406525 ?auto_406528 ) ) ( not ( = ?auto_406525 ?auto_406529 ) ) ( not ( = ?auto_406525 ?auto_406530 ) ) ( not ( = ?auto_406526 ?auto_406527 ) ) ( not ( = ?auto_406526 ?auto_406528 ) ) ( not ( = ?auto_406526 ?auto_406529 ) ) ( not ( = ?auto_406526 ?auto_406530 ) ) ( not ( = ?auto_406527 ?auto_406528 ) ) ( not ( = ?auto_406527 ?auto_406529 ) ) ( not ( = ?auto_406527 ?auto_406530 ) ) ( not ( = ?auto_406528 ?auto_406529 ) ) ( not ( = ?auto_406528 ?auto_406530 ) ) ( not ( = ?auto_406529 ?auto_406530 ) ) ( ON ?auto_406528 ?auto_406529 ) ( ON ?auto_406527 ?auto_406528 ) ( ON ?auto_406526 ?auto_406527 ) ( ON ?auto_406525 ?auto_406526 ) ( ON ?auto_406524 ?auto_406525 ) ( ON ?auto_406523 ?auto_406524 ) ( ON ?auto_406522 ?auto_406523 ) ( ON ?auto_406521 ?auto_406522 ) ( ON ?auto_406520 ?auto_406521 ) ( ON ?auto_406519 ?auto_406520 ) ( ON ?auto_406518 ?auto_406519 ) ( CLEAR ?auto_406516 ) ( ON ?auto_406517 ?auto_406518 ) ( CLEAR ?auto_406517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_406516 ?auto_406517 )
      ( MAKE-14PILE ?auto_406516 ?auto_406517 ?auto_406518 ?auto_406519 ?auto_406520 ?auto_406521 ?auto_406522 ?auto_406523 ?auto_406524 ?auto_406525 ?auto_406526 ?auto_406527 ?auto_406528 ?auto_406529 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_406574 - BLOCK
      ?auto_406575 - BLOCK
      ?auto_406576 - BLOCK
      ?auto_406577 - BLOCK
      ?auto_406578 - BLOCK
      ?auto_406579 - BLOCK
      ?auto_406580 - BLOCK
      ?auto_406581 - BLOCK
      ?auto_406582 - BLOCK
      ?auto_406583 - BLOCK
      ?auto_406584 - BLOCK
      ?auto_406585 - BLOCK
      ?auto_406586 - BLOCK
      ?auto_406587 - BLOCK
    )
    :vars
    (
      ?auto_406588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_406587 ?auto_406588 ) ( not ( = ?auto_406574 ?auto_406575 ) ) ( not ( = ?auto_406574 ?auto_406576 ) ) ( not ( = ?auto_406574 ?auto_406577 ) ) ( not ( = ?auto_406574 ?auto_406578 ) ) ( not ( = ?auto_406574 ?auto_406579 ) ) ( not ( = ?auto_406574 ?auto_406580 ) ) ( not ( = ?auto_406574 ?auto_406581 ) ) ( not ( = ?auto_406574 ?auto_406582 ) ) ( not ( = ?auto_406574 ?auto_406583 ) ) ( not ( = ?auto_406574 ?auto_406584 ) ) ( not ( = ?auto_406574 ?auto_406585 ) ) ( not ( = ?auto_406574 ?auto_406586 ) ) ( not ( = ?auto_406574 ?auto_406587 ) ) ( not ( = ?auto_406574 ?auto_406588 ) ) ( not ( = ?auto_406575 ?auto_406576 ) ) ( not ( = ?auto_406575 ?auto_406577 ) ) ( not ( = ?auto_406575 ?auto_406578 ) ) ( not ( = ?auto_406575 ?auto_406579 ) ) ( not ( = ?auto_406575 ?auto_406580 ) ) ( not ( = ?auto_406575 ?auto_406581 ) ) ( not ( = ?auto_406575 ?auto_406582 ) ) ( not ( = ?auto_406575 ?auto_406583 ) ) ( not ( = ?auto_406575 ?auto_406584 ) ) ( not ( = ?auto_406575 ?auto_406585 ) ) ( not ( = ?auto_406575 ?auto_406586 ) ) ( not ( = ?auto_406575 ?auto_406587 ) ) ( not ( = ?auto_406575 ?auto_406588 ) ) ( not ( = ?auto_406576 ?auto_406577 ) ) ( not ( = ?auto_406576 ?auto_406578 ) ) ( not ( = ?auto_406576 ?auto_406579 ) ) ( not ( = ?auto_406576 ?auto_406580 ) ) ( not ( = ?auto_406576 ?auto_406581 ) ) ( not ( = ?auto_406576 ?auto_406582 ) ) ( not ( = ?auto_406576 ?auto_406583 ) ) ( not ( = ?auto_406576 ?auto_406584 ) ) ( not ( = ?auto_406576 ?auto_406585 ) ) ( not ( = ?auto_406576 ?auto_406586 ) ) ( not ( = ?auto_406576 ?auto_406587 ) ) ( not ( = ?auto_406576 ?auto_406588 ) ) ( not ( = ?auto_406577 ?auto_406578 ) ) ( not ( = ?auto_406577 ?auto_406579 ) ) ( not ( = ?auto_406577 ?auto_406580 ) ) ( not ( = ?auto_406577 ?auto_406581 ) ) ( not ( = ?auto_406577 ?auto_406582 ) ) ( not ( = ?auto_406577 ?auto_406583 ) ) ( not ( = ?auto_406577 ?auto_406584 ) ) ( not ( = ?auto_406577 ?auto_406585 ) ) ( not ( = ?auto_406577 ?auto_406586 ) ) ( not ( = ?auto_406577 ?auto_406587 ) ) ( not ( = ?auto_406577 ?auto_406588 ) ) ( not ( = ?auto_406578 ?auto_406579 ) ) ( not ( = ?auto_406578 ?auto_406580 ) ) ( not ( = ?auto_406578 ?auto_406581 ) ) ( not ( = ?auto_406578 ?auto_406582 ) ) ( not ( = ?auto_406578 ?auto_406583 ) ) ( not ( = ?auto_406578 ?auto_406584 ) ) ( not ( = ?auto_406578 ?auto_406585 ) ) ( not ( = ?auto_406578 ?auto_406586 ) ) ( not ( = ?auto_406578 ?auto_406587 ) ) ( not ( = ?auto_406578 ?auto_406588 ) ) ( not ( = ?auto_406579 ?auto_406580 ) ) ( not ( = ?auto_406579 ?auto_406581 ) ) ( not ( = ?auto_406579 ?auto_406582 ) ) ( not ( = ?auto_406579 ?auto_406583 ) ) ( not ( = ?auto_406579 ?auto_406584 ) ) ( not ( = ?auto_406579 ?auto_406585 ) ) ( not ( = ?auto_406579 ?auto_406586 ) ) ( not ( = ?auto_406579 ?auto_406587 ) ) ( not ( = ?auto_406579 ?auto_406588 ) ) ( not ( = ?auto_406580 ?auto_406581 ) ) ( not ( = ?auto_406580 ?auto_406582 ) ) ( not ( = ?auto_406580 ?auto_406583 ) ) ( not ( = ?auto_406580 ?auto_406584 ) ) ( not ( = ?auto_406580 ?auto_406585 ) ) ( not ( = ?auto_406580 ?auto_406586 ) ) ( not ( = ?auto_406580 ?auto_406587 ) ) ( not ( = ?auto_406580 ?auto_406588 ) ) ( not ( = ?auto_406581 ?auto_406582 ) ) ( not ( = ?auto_406581 ?auto_406583 ) ) ( not ( = ?auto_406581 ?auto_406584 ) ) ( not ( = ?auto_406581 ?auto_406585 ) ) ( not ( = ?auto_406581 ?auto_406586 ) ) ( not ( = ?auto_406581 ?auto_406587 ) ) ( not ( = ?auto_406581 ?auto_406588 ) ) ( not ( = ?auto_406582 ?auto_406583 ) ) ( not ( = ?auto_406582 ?auto_406584 ) ) ( not ( = ?auto_406582 ?auto_406585 ) ) ( not ( = ?auto_406582 ?auto_406586 ) ) ( not ( = ?auto_406582 ?auto_406587 ) ) ( not ( = ?auto_406582 ?auto_406588 ) ) ( not ( = ?auto_406583 ?auto_406584 ) ) ( not ( = ?auto_406583 ?auto_406585 ) ) ( not ( = ?auto_406583 ?auto_406586 ) ) ( not ( = ?auto_406583 ?auto_406587 ) ) ( not ( = ?auto_406583 ?auto_406588 ) ) ( not ( = ?auto_406584 ?auto_406585 ) ) ( not ( = ?auto_406584 ?auto_406586 ) ) ( not ( = ?auto_406584 ?auto_406587 ) ) ( not ( = ?auto_406584 ?auto_406588 ) ) ( not ( = ?auto_406585 ?auto_406586 ) ) ( not ( = ?auto_406585 ?auto_406587 ) ) ( not ( = ?auto_406585 ?auto_406588 ) ) ( not ( = ?auto_406586 ?auto_406587 ) ) ( not ( = ?auto_406586 ?auto_406588 ) ) ( not ( = ?auto_406587 ?auto_406588 ) ) ( ON ?auto_406586 ?auto_406587 ) ( ON ?auto_406585 ?auto_406586 ) ( ON ?auto_406584 ?auto_406585 ) ( ON ?auto_406583 ?auto_406584 ) ( ON ?auto_406582 ?auto_406583 ) ( ON ?auto_406581 ?auto_406582 ) ( ON ?auto_406580 ?auto_406581 ) ( ON ?auto_406579 ?auto_406580 ) ( ON ?auto_406578 ?auto_406579 ) ( ON ?auto_406577 ?auto_406578 ) ( ON ?auto_406576 ?auto_406577 ) ( ON ?auto_406575 ?auto_406576 ) ( ON ?auto_406574 ?auto_406575 ) ( CLEAR ?auto_406574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_406574 )
      ( MAKE-14PILE ?auto_406574 ?auto_406575 ?auto_406576 ?auto_406577 ?auto_406578 ?auto_406579 ?auto_406580 ?auto_406581 ?auto_406582 ?auto_406583 ?auto_406584 ?auto_406585 ?auto_406586 ?auto_406587 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_406633 - BLOCK
      ?auto_406634 - BLOCK
      ?auto_406635 - BLOCK
      ?auto_406636 - BLOCK
      ?auto_406637 - BLOCK
      ?auto_406638 - BLOCK
      ?auto_406639 - BLOCK
      ?auto_406640 - BLOCK
      ?auto_406641 - BLOCK
      ?auto_406642 - BLOCK
      ?auto_406643 - BLOCK
      ?auto_406644 - BLOCK
      ?auto_406645 - BLOCK
      ?auto_406646 - BLOCK
      ?auto_406647 - BLOCK
    )
    :vars
    (
      ?auto_406648 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_406646 ) ( ON ?auto_406647 ?auto_406648 ) ( CLEAR ?auto_406647 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_406633 ) ( ON ?auto_406634 ?auto_406633 ) ( ON ?auto_406635 ?auto_406634 ) ( ON ?auto_406636 ?auto_406635 ) ( ON ?auto_406637 ?auto_406636 ) ( ON ?auto_406638 ?auto_406637 ) ( ON ?auto_406639 ?auto_406638 ) ( ON ?auto_406640 ?auto_406639 ) ( ON ?auto_406641 ?auto_406640 ) ( ON ?auto_406642 ?auto_406641 ) ( ON ?auto_406643 ?auto_406642 ) ( ON ?auto_406644 ?auto_406643 ) ( ON ?auto_406645 ?auto_406644 ) ( ON ?auto_406646 ?auto_406645 ) ( not ( = ?auto_406633 ?auto_406634 ) ) ( not ( = ?auto_406633 ?auto_406635 ) ) ( not ( = ?auto_406633 ?auto_406636 ) ) ( not ( = ?auto_406633 ?auto_406637 ) ) ( not ( = ?auto_406633 ?auto_406638 ) ) ( not ( = ?auto_406633 ?auto_406639 ) ) ( not ( = ?auto_406633 ?auto_406640 ) ) ( not ( = ?auto_406633 ?auto_406641 ) ) ( not ( = ?auto_406633 ?auto_406642 ) ) ( not ( = ?auto_406633 ?auto_406643 ) ) ( not ( = ?auto_406633 ?auto_406644 ) ) ( not ( = ?auto_406633 ?auto_406645 ) ) ( not ( = ?auto_406633 ?auto_406646 ) ) ( not ( = ?auto_406633 ?auto_406647 ) ) ( not ( = ?auto_406633 ?auto_406648 ) ) ( not ( = ?auto_406634 ?auto_406635 ) ) ( not ( = ?auto_406634 ?auto_406636 ) ) ( not ( = ?auto_406634 ?auto_406637 ) ) ( not ( = ?auto_406634 ?auto_406638 ) ) ( not ( = ?auto_406634 ?auto_406639 ) ) ( not ( = ?auto_406634 ?auto_406640 ) ) ( not ( = ?auto_406634 ?auto_406641 ) ) ( not ( = ?auto_406634 ?auto_406642 ) ) ( not ( = ?auto_406634 ?auto_406643 ) ) ( not ( = ?auto_406634 ?auto_406644 ) ) ( not ( = ?auto_406634 ?auto_406645 ) ) ( not ( = ?auto_406634 ?auto_406646 ) ) ( not ( = ?auto_406634 ?auto_406647 ) ) ( not ( = ?auto_406634 ?auto_406648 ) ) ( not ( = ?auto_406635 ?auto_406636 ) ) ( not ( = ?auto_406635 ?auto_406637 ) ) ( not ( = ?auto_406635 ?auto_406638 ) ) ( not ( = ?auto_406635 ?auto_406639 ) ) ( not ( = ?auto_406635 ?auto_406640 ) ) ( not ( = ?auto_406635 ?auto_406641 ) ) ( not ( = ?auto_406635 ?auto_406642 ) ) ( not ( = ?auto_406635 ?auto_406643 ) ) ( not ( = ?auto_406635 ?auto_406644 ) ) ( not ( = ?auto_406635 ?auto_406645 ) ) ( not ( = ?auto_406635 ?auto_406646 ) ) ( not ( = ?auto_406635 ?auto_406647 ) ) ( not ( = ?auto_406635 ?auto_406648 ) ) ( not ( = ?auto_406636 ?auto_406637 ) ) ( not ( = ?auto_406636 ?auto_406638 ) ) ( not ( = ?auto_406636 ?auto_406639 ) ) ( not ( = ?auto_406636 ?auto_406640 ) ) ( not ( = ?auto_406636 ?auto_406641 ) ) ( not ( = ?auto_406636 ?auto_406642 ) ) ( not ( = ?auto_406636 ?auto_406643 ) ) ( not ( = ?auto_406636 ?auto_406644 ) ) ( not ( = ?auto_406636 ?auto_406645 ) ) ( not ( = ?auto_406636 ?auto_406646 ) ) ( not ( = ?auto_406636 ?auto_406647 ) ) ( not ( = ?auto_406636 ?auto_406648 ) ) ( not ( = ?auto_406637 ?auto_406638 ) ) ( not ( = ?auto_406637 ?auto_406639 ) ) ( not ( = ?auto_406637 ?auto_406640 ) ) ( not ( = ?auto_406637 ?auto_406641 ) ) ( not ( = ?auto_406637 ?auto_406642 ) ) ( not ( = ?auto_406637 ?auto_406643 ) ) ( not ( = ?auto_406637 ?auto_406644 ) ) ( not ( = ?auto_406637 ?auto_406645 ) ) ( not ( = ?auto_406637 ?auto_406646 ) ) ( not ( = ?auto_406637 ?auto_406647 ) ) ( not ( = ?auto_406637 ?auto_406648 ) ) ( not ( = ?auto_406638 ?auto_406639 ) ) ( not ( = ?auto_406638 ?auto_406640 ) ) ( not ( = ?auto_406638 ?auto_406641 ) ) ( not ( = ?auto_406638 ?auto_406642 ) ) ( not ( = ?auto_406638 ?auto_406643 ) ) ( not ( = ?auto_406638 ?auto_406644 ) ) ( not ( = ?auto_406638 ?auto_406645 ) ) ( not ( = ?auto_406638 ?auto_406646 ) ) ( not ( = ?auto_406638 ?auto_406647 ) ) ( not ( = ?auto_406638 ?auto_406648 ) ) ( not ( = ?auto_406639 ?auto_406640 ) ) ( not ( = ?auto_406639 ?auto_406641 ) ) ( not ( = ?auto_406639 ?auto_406642 ) ) ( not ( = ?auto_406639 ?auto_406643 ) ) ( not ( = ?auto_406639 ?auto_406644 ) ) ( not ( = ?auto_406639 ?auto_406645 ) ) ( not ( = ?auto_406639 ?auto_406646 ) ) ( not ( = ?auto_406639 ?auto_406647 ) ) ( not ( = ?auto_406639 ?auto_406648 ) ) ( not ( = ?auto_406640 ?auto_406641 ) ) ( not ( = ?auto_406640 ?auto_406642 ) ) ( not ( = ?auto_406640 ?auto_406643 ) ) ( not ( = ?auto_406640 ?auto_406644 ) ) ( not ( = ?auto_406640 ?auto_406645 ) ) ( not ( = ?auto_406640 ?auto_406646 ) ) ( not ( = ?auto_406640 ?auto_406647 ) ) ( not ( = ?auto_406640 ?auto_406648 ) ) ( not ( = ?auto_406641 ?auto_406642 ) ) ( not ( = ?auto_406641 ?auto_406643 ) ) ( not ( = ?auto_406641 ?auto_406644 ) ) ( not ( = ?auto_406641 ?auto_406645 ) ) ( not ( = ?auto_406641 ?auto_406646 ) ) ( not ( = ?auto_406641 ?auto_406647 ) ) ( not ( = ?auto_406641 ?auto_406648 ) ) ( not ( = ?auto_406642 ?auto_406643 ) ) ( not ( = ?auto_406642 ?auto_406644 ) ) ( not ( = ?auto_406642 ?auto_406645 ) ) ( not ( = ?auto_406642 ?auto_406646 ) ) ( not ( = ?auto_406642 ?auto_406647 ) ) ( not ( = ?auto_406642 ?auto_406648 ) ) ( not ( = ?auto_406643 ?auto_406644 ) ) ( not ( = ?auto_406643 ?auto_406645 ) ) ( not ( = ?auto_406643 ?auto_406646 ) ) ( not ( = ?auto_406643 ?auto_406647 ) ) ( not ( = ?auto_406643 ?auto_406648 ) ) ( not ( = ?auto_406644 ?auto_406645 ) ) ( not ( = ?auto_406644 ?auto_406646 ) ) ( not ( = ?auto_406644 ?auto_406647 ) ) ( not ( = ?auto_406644 ?auto_406648 ) ) ( not ( = ?auto_406645 ?auto_406646 ) ) ( not ( = ?auto_406645 ?auto_406647 ) ) ( not ( = ?auto_406645 ?auto_406648 ) ) ( not ( = ?auto_406646 ?auto_406647 ) ) ( not ( = ?auto_406646 ?auto_406648 ) ) ( not ( = ?auto_406647 ?auto_406648 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_406647 ?auto_406648 )
      ( !STACK ?auto_406647 ?auto_406646 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_406664 - BLOCK
      ?auto_406665 - BLOCK
      ?auto_406666 - BLOCK
      ?auto_406667 - BLOCK
      ?auto_406668 - BLOCK
      ?auto_406669 - BLOCK
      ?auto_406670 - BLOCK
      ?auto_406671 - BLOCK
      ?auto_406672 - BLOCK
      ?auto_406673 - BLOCK
      ?auto_406674 - BLOCK
      ?auto_406675 - BLOCK
      ?auto_406676 - BLOCK
      ?auto_406677 - BLOCK
      ?auto_406678 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_406677 ) ( ON-TABLE ?auto_406678 ) ( CLEAR ?auto_406678 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_406664 ) ( ON ?auto_406665 ?auto_406664 ) ( ON ?auto_406666 ?auto_406665 ) ( ON ?auto_406667 ?auto_406666 ) ( ON ?auto_406668 ?auto_406667 ) ( ON ?auto_406669 ?auto_406668 ) ( ON ?auto_406670 ?auto_406669 ) ( ON ?auto_406671 ?auto_406670 ) ( ON ?auto_406672 ?auto_406671 ) ( ON ?auto_406673 ?auto_406672 ) ( ON ?auto_406674 ?auto_406673 ) ( ON ?auto_406675 ?auto_406674 ) ( ON ?auto_406676 ?auto_406675 ) ( ON ?auto_406677 ?auto_406676 ) ( not ( = ?auto_406664 ?auto_406665 ) ) ( not ( = ?auto_406664 ?auto_406666 ) ) ( not ( = ?auto_406664 ?auto_406667 ) ) ( not ( = ?auto_406664 ?auto_406668 ) ) ( not ( = ?auto_406664 ?auto_406669 ) ) ( not ( = ?auto_406664 ?auto_406670 ) ) ( not ( = ?auto_406664 ?auto_406671 ) ) ( not ( = ?auto_406664 ?auto_406672 ) ) ( not ( = ?auto_406664 ?auto_406673 ) ) ( not ( = ?auto_406664 ?auto_406674 ) ) ( not ( = ?auto_406664 ?auto_406675 ) ) ( not ( = ?auto_406664 ?auto_406676 ) ) ( not ( = ?auto_406664 ?auto_406677 ) ) ( not ( = ?auto_406664 ?auto_406678 ) ) ( not ( = ?auto_406665 ?auto_406666 ) ) ( not ( = ?auto_406665 ?auto_406667 ) ) ( not ( = ?auto_406665 ?auto_406668 ) ) ( not ( = ?auto_406665 ?auto_406669 ) ) ( not ( = ?auto_406665 ?auto_406670 ) ) ( not ( = ?auto_406665 ?auto_406671 ) ) ( not ( = ?auto_406665 ?auto_406672 ) ) ( not ( = ?auto_406665 ?auto_406673 ) ) ( not ( = ?auto_406665 ?auto_406674 ) ) ( not ( = ?auto_406665 ?auto_406675 ) ) ( not ( = ?auto_406665 ?auto_406676 ) ) ( not ( = ?auto_406665 ?auto_406677 ) ) ( not ( = ?auto_406665 ?auto_406678 ) ) ( not ( = ?auto_406666 ?auto_406667 ) ) ( not ( = ?auto_406666 ?auto_406668 ) ) ( not ( = ?auto_406666 ?auto_406669 ) ) ( not ( = ?auto_406666 ?auto_406670 ) ) ( not ( = ?auto_406666 ?auto_406671 ) ) ( not ( = ?auto_406666 ?auto_406672 ) ) ( not ( = ?auto_406666 ?auto_406673 ) ) ( not ( = ?auto_406666 ?auto_406674 ) ) ( not ( = ?auto_406666 ?auto_406675 ) ) ( not ( = ?auto_406666 ?auto_406676 ) ) ( not ( = ?auto_406666 ?auto_406677 ) ) ( not ( = ?auto_406666 ?auto_406678 ) ) ( not ( = ?auto_406667 ?auto_406668 ) ) ( not ( = ?auto_406667 ?auto_406669 ) ) ( not ( = ?auto_406667 ?auto_406670 ) ) ( not ( = ?auto_406667 ?auto_406671 ) ) ( not ( = ?auto_406667 ?auto_406672 ) ) ( not ( = ?auto_406667 ?auto_406673 ) ) ( not ( = ?auto_406667 ?auto_406674 ) ) ( not ( = ?auto_406667 ?auto_406675 ) ) ( not ( = ?auto_406667 ?auto_406676 ) ) ( not ( = ?auto_406667 ?auto_406677 ) ) ( not ( = ?auto_406667 ?auto_406678 ) ) ( not ( = ?auto_406668 ?auto_406669 ) ) ( not ( = ?auto_406668 ?auto_406670 ) ) ( not ( = ?auto_406668 ?auto_406671 ) ) ( not ( = ?auto_406668 ?auto_406672 ) ) ( not ( = ?auto_406668 ?auto_406673 ) ) ( not ( = ?auto_406668 ?auto_406674 ) ) ( not ( = ?auto_406668 ?auto_406675 ) ) ( not ( = ?auto_406668 ?auto_406676 ) ) ( not ( = ?auto_406668 ?auto_406677 ) ) ( not ( = ?auto_406668 ?auto_406678 ) ) ( not ( = ?auto_406669 ?auto_406670 ) ) ( not ( = ?auto_406669 ?auto_406671 ) ) ( not ( = ?auto_406669 ?auto_406672 ) ) ( not ( = ?auto_406669 ?auto_406673 ) ) ( not ( = ?auto_406669 ?auto_406674 ) ) ( not ( = ?auto_406669 ?auto_406675 ) ) ( not ( = ?auto_406669 ?auto_406676 ) ) ( not ( = ?auto_406669 ?auto_406677 ) ) ( not ( = ?auto_406669 ?auto_406678 ) ) ( not ( = ?auto_406670 ?auto_406671 ) ) ( not ( = ?auto_406670 ?auto_406672 ) ) ( not ( = ?auto_406670 ?auto_406673 ) ) ( not ( = ?auto_406670 ?auto_406674 ) ) ( not ( = ?auto_406670 ?auto_406675 ) ) ( not ( = ?auto_406670 ?auto_406676 ) ) ( not ( = ?auto_406670 ?auto_406677 ) ) ( not ( = ?auto_406670 ?auto_406678 ) ) ( not ( = ?auto_406671 ?auto_406672 ) ) ( not ( = ?auto_406671 ?auto_406673 ) ) ( not ( = ?auto_406671 ?auto_406674 ) ) ( not ( = ?auto_406671 ?auto_406675 ) ) ( not ( = ?auto_406671 ?auto_406676 ) ) ( not ( = ?auto_406671 ?auto_406677 ) ) ( not ( = ?auto_406671 ?auto_406678 ) ) ( not ( = ?auto_406672 ?auto_406673 ) ) ( not ( = ?auto_406672 ?auto_406674 ) ) ( not ( = ?auto_406672 ?auto_406675 ) ) ( not ( = ?auto_406672 ?auto_406676 ) ) ( not ( = ?auto_406672 ?auto_406677 ) ) ( not ( = ?auto_406672 ?auto_406678 ) ) ( not ( = ?auto_406673 ?auto_406674 ) ) ( not ( = ?auto_406673 ?auto_406675 ) ) ( not ( = ?auto_406673 ?auto_406676 ) ) ( not ( = ?auto_406673 ?auto_406677 ) ) ( not ( = ?auto_406673 ?auto_406678 ) ) ( not ( = ?auto_406674 ?auto_406675 ) ) ( not ( = ?auto_406674 ?auto_406676 ) ) ( not ( = ?auto_406674 ?auto_406677 ) ) ( not ( = ?auto_406674 ?auto_406678 ) ) ( not ( = ?auto_406675 ?auto_406676 ) ) ( not ( = ?auto_406675 ?auto_406677 ) ) ( not ( = ?auto_406675 ?auto_406678 ) ) ( not ( = ?auto_406676 ?auto_406677 ) ) ( not ( = ?auto_406676 ?auto_406678 ) ) ( not ( = ?auto_406677 ?auto_406678 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_406678 )
      ( !STACK ?auto_406678 ?auto_406677 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_406694 - BLOCK
      ?auto_406695 - BLOCK
      ?auto_406696 - BLOCK
      ?auto_406697 - BLOCK
      ?auto_406698 - BLOCK
      ?auto_406699 - BLOCK
      ?auto_406700 - BLOCK
      ?auto_406701 - BLOCK
      ?auto_406702 - BLOCK
      ?auto_406703 - BLOCK
      ?auto_406704 - BLOCK
      ?auto_406705 - BLOCK
      ?auto_406706 - BLOCK
      ?auto_406707 - BLOCK
      ?auto_406708 - BLOCK
    )
    :vars
    (
      ?auto_406709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_406708 ?auto_406709 ) ( ON-TABLE ?auto_406694 ) ( ON ?auto_406695 ?auto_406694 ) ( ON ?auto_406696 ?auto_406695 ) ( ON ?auto_406697 ?auto_406696 ) ( ON ?auto_406698 ?auto_406697 ) ( ON ?auto_406699 ?auto_406698 ) ( ON ?auto_406700 ?auto_406699 ) ( ON ?auto_406701 ?auto_406700 ) ( ON ?auto_406702 ?auto_406701 ) ( ON ?auto_406703 ?auto_406702 ) ( ON ?auto_406704 ?auto_406703 ) ( ON ?auto_406705 ?auto_406704 ) ( ON ?auto_406706 ?auto_406705 ) ( not ( = ?auto_406694 ?auto_406695 ) ) ( not ( = ?auto_406694 ?auto_406696 ) ) ( not ( = ?auto_406694 ?auto_406697 ) ) ( not ( = ?auto_406694 ?auto_406698 ) ) ( not ( = ?auto_406694 ?auto_406699 ) ) ( not ( = ?auto_406694 ?auto_406700 ) ) ( not ( = ?auto_406694 ?auto_406701 ) ) ( not ( = ?auto_406694 ?auto_406702 ) ) ( not ( = ?auto_406694 ?auto_406703 ) ) ( not ( = ?auto_406694 ?auto_406704 ) ) ( not ( = ?auto_406694 ?auto_406705 ) ) ( not ( = ?auto_406694 ?auto_406706 ) ) ( not ( = ?auto_406694 ?auto_406707 ) ) ( not ( = ?auto_406694 ?auto_406708 ) ) ( not ( = ?auto_406694 ?auto_406709 ) ) ( not ( = ?auto_406695 ?auto_406696 ) ) ( not ( = ?auto_406695 ?auto_406697 ) ) ( not ( = ?auto_406695 ?auto_406698 ) ) ( not ( = ?auto_406695 ?auto_406699 ) ) ( not ( = ?auto_406695 ?auto_406700 ) ) ( not ( = ?auto_406695 ?auto_406701 ) ) ( not ( = ?auto_406695 ?auto_406702 ) ) ( not ( = ?auto_406695 ?auto_406703 ) ) ( not ( = ?auto_406695 ?auto_406704 ) ) ( not ( = ?auto_406695 ?auto_406705 ) ) ( not ( = ?auto_406695 ?auto_406706 ) ) ( not ( = ?auto_406695 ?auto_406707 ) ) ( not ( = ?auto_406695 ?auto_406708 ) ) ( not ( = ?auto_406695 ?auto_406709 ) ) ( not ( = ?auto_406696 ?auto_406697 ) ) ( not ( = ?auto_406696 ?auto_406698 ) ) ( not ( = ?auto_406696 ?auto_406699 ) ) ( not ( = ?auto_406696 ?auto_406700 ) ) ( not ( = ?auto_406696 ?auto_406701 ) ) ( not ( = ?auto_406696 ?auto_406702 ) ) ( not ( = ?auto_406696 ?auto_406703 ) ) ( not ( = ?auto_406696 ?auto_406704 ) ) ( not ( = ?auto_406696 ?auto_406705 ) ) ( not ( = ?auto_406696 ?auto_406706 ) ) ( not ( = ?auto_406696 ?auto_406707 ) ) ( not ( = ?auto_406696 ?auto_406708 ) ) ( not ( = ?auto_406696 ?auto_406709 ) ) ( not ( = ?auto_406697 ?auto_406698 ) ) ( not ( = ?auto_406697 ?auto_406699 ) ) ( not ( = ?auto_406697 ?auto_406700 ) ) ( not ( = ?auto_406697 ?auto_406701 ) ) ( not ( = ?auto_406697 ?auto_406702 ) ) ( not ( = ?auto_406697 ?auto_406703 ) ) ( not ( = ?auto_406697 ?auto_406704 ) ) ( not ( = ?auto_406697 ?auto_406705 ) ) ( not ( = ?auto_406697 ?auto_406706 ) ) ( not ( = ?auto_406697 ?auto_406707 ) ) ( not ( = ?auto_406697 ?auto_406708 ) ) ( not ( = ?auto_406697 ?auto_406709 ) ) ( not ( = ?auto_406698 ?auto_406699 ) ) ( not ( = ?auto_406698 ?auto_406700 ) ) ( not ( = ?auto_406698 ?auto_406701 ) ) ( not ( = ?auto_406698 ?auto_406702 ) ) ( not ( = ?auto_406698 ?auto_406703 ) ) ( not ( = ?auto_406698 ?auto_406704 ) ) ( not ( = ?auto_406698 ?auto_406705 ) ) ( not ( = ?auto_406698 ?auto_406706 ) ) ( not ( = ?auto_406698 ?auto_406707 ) ) ( not ( = ?auto_406698 ?auto_406708 ) ) ( not ( = ?auto_406698 ?auto_406709 ) ) ( not ( = ?auto_406699 ?auto_406700 ) ) ( not ( = ?auto_406699 ?auto_406701 ) ) ( not ( = ?auto_406699 ?auto_406702 ) ) ( not ( = ?auto_406699 ?auto_406703 ) ) ( not ( = ?auto_406699 ?auto_406704 ) ) ( not ( = ?auto_406699 ?auto_406705 ) ) ( not ( = ?auto_406699 ?auto_406706 ) ) ( not ( = ?auto_406699 ?auto_406707 ) ) ( not ( = ?auto_406699 ?auto_406708 ) ) ( not ( = ?auto_406699 ?auto_406709 ) ) ( not ( = ?auto_406700 ?auto_406701 ) ) ( not ( = ?auto_406700 ?auto_406702 ) ) ( not ( = ?auto_406700 ?auto_406703 ) ) ( not ( = ?auto_406700 ?auto_406704 ) ) ( not ( = ?auto_406700 ?auto_406705 ) ) ( not ( = ?auto_406700 ?auto_406706 ) ) ( not ( = ?auto_406700 ?auto_406707 ) ) ( not ( = ?auto_406700 ?auto_406708 ) ) ( not ( = ?auto_406700 ?auto_406709 ) ) ( not ( = ?auto_406701 ?auto_406702 ) ) ( not ( = ?auto_406701 ?auto_406703 ) ) ( not ( = ?auto_406701 ?auto_406704 ) ) ( not ( = ?auto_406701 ?auto_406705 ) ) ( not ( = ?auto_406701 ?auto_406706 ) ) ( not ( = ?auto_406701 ?auto_406707 ) ) ( not ( = ?auto_406701 ?auto_406708 ) ) ( not ( = ?auto_406701 ?auto_406709 ) ) ( not ( = ?auto_406702 ?auto_406703 ) ) ( not ( = ?auto_406702 ?auto_406704 ) ) ( not ( = ?auto_406702 ?auto_406705 ) ) ( not ( = ?auto_406702 ?auto_406706 ) ) ( not ( = ?auto_406702 ?auto_406707 ) ) ( not ( = ?auto_406702 ?auto_406708 ) ) ( not ( = ?auto_406702 ?auto_406709 ) ) ( not ( = ?auto_406703 ?auto_406704 ) ) ( not ( = ?auto_406703 ?auto_406705 ) ) ( not ( = ?auto_406703 ?auto_406706 ) ) ( not ( = ?auto_406703 ?auto_406707 ) ) ( not ( = ?auto_406703 ?auto_406708 ) ) ( not ( = ?auto_406703 ?auto_406709 ) ) ( not ( = ?auto_406704 ?auto_406705 ) ) ( not ( = ?auto_406704 ?auto_406706 ) ) ( not ( = ?auto_406704 ?auto_406707 ) ) ( not ( = ?auto_406704 ?auto_406708 ) ) ( not ( = ?auto_406704 ?auto_406709 ) ) ( not ( = ?auto_406705 ?auto_406706 ) ) ( not ( = ?auto_406705 ?auto_406707 ) ) ( not ( = ?auto_406705 ?auto_406708 ) ) ( not ( = ?auto_406705 ?auto_406709 ) ) ( not ( = ?auto_406706 ?auto_406707 ) ) ( not ( = ?auto_406706 ?auto_406708 ) ) ( not ( = ?auto_406706 ?auto_406709 ) ) ( not ( = ?auto_406707 ?auto_406708 ) ) ( not ( = ?auto_406707 ?auto_406709 ) ) ( not ( = ?auto_406708 ?auto_406709 ) ) ( CLEAR ?auto_406706 ) ( ON ?auto_406707 ?auto_406708 ) ( CLEAR ?auto_406707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_406694 ?auto_406695 ?auto_406696 ?auto_406697 ?auto_406698 ?auto_406699 ?auto_406700 ?auto_406701 ?auto_406702 ?auto_406703 ?auto_406704 ?auto_406705 ?auto_406706 ?auto_406707 )
      ( MAKE-15PILE ?auto_406694 ?auto_406695 ?auto_406696 ?auto_406697 ?auto_406698 ?auto_406699 ?auto_406700 ?auto_406701 ?auto_406702 ?auto_406703 ?auto_406704 ?auto_406705 ?auto_406706 ?auto_406707 ?auto_406708 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_406725 - BLOCK
      ?auto_406726 - BLOCK
      ?auto_406727 - BLOCK
      ?auto_406728 - BLOCK
      ?auto_406729 - BLOCK
      ?auto_406730 - BLOCK
      ?auto_406731 - BLOCK
      ?auto_406732 - BLOCK
      ?auto_406733 - BLOCK
      ?auto_406734 - BLOCK
      ?auto_406735 - BLOCK
      ?auto_406736 - BLOCK
      ?auto_406737 - BLOCK
      ?auto_406738 - BLOCK
      ?auto_406739 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_406739 ) ( ON-TABLE ?auto_406725 ) ( ON ?auto_406726 ?auto_406725 ) ( ON ?auto_406727 ?auto_406726 ) ( ON ?auto_406728 ?auto_406727 ) ( ON ?auto_406729 ?auto_406728 ) ( ON ?auto_406730 ?auto_406729 ) ( ON ?auto_406731 ?auto_406730 ) ( ON ?auto_406732 ?auto_406731 ) ( ON ?auto_406733 ?auto_406732 ) ( ON ?auto_406734 ?auto_406733 ) ( ON ?auto_406735 ?auto_406734 ) ( ON ?auto_406736 ?auto_406735 ) ( ON ?auto_406737 ?auto_406736 ) ( not ( = ?auto_406725 ?auto_406726 ) ) ( not ( = ?auto_406725 ?auto_406727 ) ) ( not ( = ?auto_406725 ?auto_406728 ) ) ( not ( = ?auto_406725 ?auto_406729 ) ) ( not ( = ?auto_406725 ?auto_406730 ) ) ( not ( = ?auto_406725 ?auto_406731 ) ) ( not ( = ?auto_406725 ?auto_406732 ) ) ( not ( = ?auto_406725 ?auto_406733 ) ) ( not ( = ?auto_406725 ?auto_406734 ) ) ( not ( = ?auto_406725 ?auto_406735 ) ) ( not ( = ?auto_406725 ?auto_406736 ) ) ( not ( = ?auto_406725 ?auto_406737 ) ) ( not ( = ?auto_406725 ?auto_406738 ) ) ( not ( = ?auto_406725 ?auto_406739 ) ) ( not ( = ?auto_406726 ?auto_406727 ) ) ( not ( = ?auto_406726 ?auto_406728 ) ) ( not ( = ?auto_406726 ?auto_406729 ) ) ( not ( = ?auto_406726 ?auto_406730 ) ) ( not ( = ?auto_406726 ?auto_406731 ) ) ( not ( = ?auto_406726 ?auto_406732 ) ) ( not ( = ?auto_406726 ?auto_406733 ) ) ( not ( = ?auto_406726 ?auto_406734 ) ) ( not ( = ?auto_406726 ?auto_406735 ) ) ( not ( = ?auto_406726 ?auto_406736 ) ) ( not ( = ?auto_406726 ?auto_406737 ) ) ( not ( = ?auto_406726 ?auto_406738 ) ) ( not ( = ?auto_406726 ?auto_406739 ) ) ( not ( = ?auto_406727 ?auto_406728 ) ) ( not ( = ?auto_406727 ?auto_406729 ) ) ( not ( = ?auto_406727 ?auto_406730 ) ) ( not ( = ?auto_406727 ?auto_406731 ) ) ( not ( = ?auto_406727 ?auto_406732 ) ) ( not ( = ?auto_406727 ?auto_406733 ) ) ( not ( = ?auto_406727 ?auto_406734 ) ) ( not ( = ?auto_406727 ?auto_406735 ) ) ( not ( = ?auto_406727 ?auto_406736 ) ) ( not ( = ?auto_406727 ?auto_406737 ) ) ( not ( = ?auto_406727 ?auto_406738 ) ) ( not ( = ?auto_406727 ?auto_406739 ) ) ( not ( = ?auto_406728 ?auto_406729 ) ) ( not ( = ?auto_406728 ?auto_406730 ) ) ( not ( = ?auto_406728 ?auto_406731 ) ) ( not ( = ?auto_406728 ?auto_406732 ) ) ( not ( = ?auto_406728 ?auto_406733 ) ) ( not ( = ?auto_406728 ?auto_406734 ) ) ( not ( = ?auto_406728 ?auto_406735 ) ) ( not ( = ?auto_406728 ?auto_406736 ) ) ( not ( = ?auto_406728 ?auto_406737 ) ) ( not ( = ?auto_406728 ?auto_406738 ) ) ( not ( = ?auto_406728 ?auto_406739 ) ) ( not ( = ?auto_406729 ?auto_406730 ) ) ( not ( = ?auto_406729 ?auto_406731 ) ) ( not ( = ?auto_406729 ?auto_406732 ) ) ( not ( = ?auto_406729 ?auto_406733 ) ) ( not ( = ?auto_406729 ?auto_406734 ) ) ( not ( = ?auto_406729 ?auto_406735 ) ) ( not ( = ?auto_406729 ?auto_406736 ) ) ( not ( = ?auto_406729 ?auto_406737 ) ) ( not ( = ?auto_406729 ?auto_406738 ) ) ( not ( = ?auto_406729 ?auto_406739 ) ) ( not ( = ?auto_406730 ?auto_406731 ) ) ( not ( = ?auto_406730 ?auto_406732 ) ) ( not ( = ?auto_406730 ?auto_406733 ) ) ( not ( = ?auto_406730 ?auto_406734 ) ) ( not ( = ?auto_406730 ?auto_406735 ) ) ( not ( = ?auto_406730 ?auto_406736 ) ) ( not ( = ?auto_406730 ?auto_406737 ) ) ( not ( = ?auto_406730 ?auto_406738 ) ) ( not ( = ?auto_406730 ?auto_406739 ) ) ( not ( = ?auto_406731 ?auto_406732 ) ) ( not ( = ?auto_406731 ?auto_406733 ) ) ( not ( = ?auto_406731 ?auto_406734 ) ) ( not ( = ?auto_406731 ?auto_406735 ) ) ( not ( = ?auto_406731 ?auto_406736 ) ) ( not ( = ?auto_406731 ?auto_406737 ) ) ( not ( = ?auto_406731 ?auto_406738 ) ) ( not ( = ?auto_406731 ?auto_406739 ) ) ( not ( = ?auto_406732 ?auto_406733 ) ) ( not ( = ?auto_406732 ?auto_406734 ) ) ( not ( = ?auto_406732 ?auto_406735 ) ) ( not ( = ?auto_406732 ?auto_406736 ) ) ( not ( = ?auto_406732 ?auto_406737 ) ) ( not ( = ?auto_406732 ?auto_406738 ) ) ( not ( = ?auto_406732 ?auto_406739 ) ) ( not ( = ?auto_406733 ?auto_406734 ) ) ( not ( = ?auto_406733 ?auto_406735 ) ) ( not ( = ?auto_406733 ?auto_406736 ) ) ( not ( = ?auto_406733 ?auto_406737 ) ) ( not ( = ?auto_406733 ?auto_406738 ) ) ( not ( = ?auto_406733 ?auto_406739 ) ) ( not ( = ?auto_406734 ?auto_406735 ) ) ( not ( = ?auto_406734 ?auto_406736 ) ) ( not ( = ?auto_406734 ?auto_406737 ) ) ( not ( = ?auto_406734 ?auto_406738 ) ) ( not ( = ?auto_406734 ?auto_406739 ) ) ( not ( = ?auto_406735 ?auto_406736 ) ) ( not ( = ?auto_406735 ?auto_406737 ) ) ( not ( = ?auto_406735 ?auto_406738 ) ) ( not ( = ?auto_406735 ?auto_406739 ) ) ( not ( = ?auto_406736 ?auto_406737 ) ) ( not ( = ?auto_406736 ?auto_406738 ) ) ( not ( = ?auto_406736 ?auto_406739 ) ) ( not ( = ?auto_406737 ?auto_406738 ) ) ( not ( = ?auto_406737 ?auto_406739 ) ) ( not ( = ?auto_406738 ?auto_406739 ) ) ( CLEAR ?auto_406737 ) ( ON ?auto_406738 ?auto_406739 ) ( CLEAR ?auto_406738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_406725 ?auto_406726 ?auto_406727 ?auto_406728 ?auto_406729 ?auto_406730 ?auto_406731 ?auto_406732 ?auto_406733 ?auto_406734 ?auto_406735 ?auto_406736 ?auto_406737 ?auto_406738 )
      ( MAKE-15PILE ?auto_406725 ?auto_406726 ?auto_406727 ?auto_406728 ?auto_406729 ?auto_406730 ?auto_406731 ?auto_406732 ?auto_406733 ?auto_406734 ?auto_406735 ?auto_406736 ?auto_406737 ?auto_406738 ?auto_406739 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_406755 - BLOCK
      ?auto_406756 - BLOCK
      ?auto_406757 - BLOCK
      ?auto_406758 - BLOCK
      ?auto_406759 - BLOCK
      ?auto_406760 - BLOCK
      ?auto_406761 - BLOCK
      ?auto_406762 - BLOCK
      ?auto_406763 - BLOCK
      ?auto_406764 - BLOCK
      ?auto_406765 - BLOCK
      ?auto_406766 - BLOCK
      ?auto_406767 - BLOCK
      ?auto_406768 - BLOCK
      ?auto_406769 - BLOCK
    )
    :vars
    (
      ?auto_406770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_406769 ?auto_406770 ) ( ON-TABLE ?auto_406755 ) ( ON ?auto_406756 ?auto_406755 ) ( ON ?auto_406757 ?auto_406756 ) ( ON ?auto_406758 ?auto_406757 ) ( ON ?auto_406759 ?auto_406758 ) ( ON ?auto_406760 ?auto_406759 ) ( ON ?auto_406761 ?auto_406760 ) ( ON ?auto_406762 ?auto_406761 ) ( ON ?auto_406763 ?auto_406762 ) ( ON ?auto_406764 ?auto_406763 ) ( ON ?auto_406765 ?auto_406764 ) ( ON ?auto_406766 ?auto_406765 ) ( not ( = ?auto_406755 ?auto_406756 ) ) ( not ( = ?auto_406755 ?auto_406757 ) ) ( not ( = ?auto_406755 ?auto_406758 ) ) ( not ( = ?auto_406755 ?auto_406759 ) ) ( not ( = ?auto_406755 ?auto_406760 ) ) ( not ( = ?auto_406755 ?auto_406761 ) ) ( not ( = ?auto_406755 ?auto_406762 ) ) ( not ( = ?auto_406755 ?auto_406763 ) ) ( not ( = ?auto_406755 ?auto_406764 ) ) ( not ( = ?auto_406755 ?auto_406765 ) ) ( not ( = ?auto_406755 ?auto_406766 ) ) ( not ( = ?auto_406755 ?auto_406767 ) ) ( not ( = ?auto_406755 ?auto_406768 ) ) ( not ( = ?auto_406755 ?auto_406769 ) ) ( not ( = ?auto_406755 ?auto_406770 ) ) ( not ( = ?auto_406756 ?auto_406757 ) ) ( not ( = ?auto_406756 ?auto_406758 ) ) ( not ( = ?auto_406756 ?auto_406759 ) ) ( not ( = ?auto_406756 ?auto_406760 ) ) ( not ( = ?auto_406756 ?auto_406761 ) ) ( not ( = ?auto_406756 ?auto_406762 ) ) ( not ( = ?auto_406756 ?auto_406763 ) ) ( not ( = ?auto_406756 ?auto_406764 ) ) ( not ( = ?auto_406756 ?auto_406765 ) ) ( not ( = ?auto_406756 ?auto_406766 ) ) ( not ( = ?auto_406756 ?auto_406767 ) ) ( not ( = ?auto_406756 ?auto_406768 ) ) ( not ( = ?auto_406756 ?auto_406769 ) ) ( not ( = ?auto_406756 ?auto_406770 ) ) ( not ( = ?auto_406757 ?auto_406758 ) ) ( not ( = ?auto_406757 ?auto_406759 ) ) ( not ( = ?auto_406757 ?auto_406760 ) ) ( not ( = ?auto_406757 ?auto_406761 ) ) ( not ( = ?auto_406757 ?auto_406762 ) ) ( not ( = ?auto_406757 ?auto_406763 ) ) ( not ( = ?auto_406757 ?auto_406764 ) ) ( not ( = ?auto_406757 ?auto_406765 ) ) ( not ( = ?auto_406757 ?auto_406766 ) ) ( not ( = ?auto_406757 ?auto_406767 ) ) ( not ( = ?auto_406757 ?auto_406768 ) ) ( not ( = ?auto_406757 ?auto_406769 ) ) ( not ( = ?auto_406757 ?auto_406770 ) ) ( not ( = ?auto_406758 ?auto_406759 ) ) ( not ( = ?auto_406758 ?auto_406760 ) ) ( not ( = ?auto_406758 ?auto_406761 ) ) ( not ( = ?auto_406758 ?auto_406762 ) ) ( not ( = ?auto_406758 ?auto_406763 ) ) ( not ( = ?auto_406758 ?auto_406764 ) ) ( not ( = ?auto_406758 ?auto_406765 ) ) ( not ( = ?auto_406758 ?auto_406766 ) ) ( not ( = ?auto_406758 ?auto_406767 ) ) ( not ( = ?auto_406758 ?auto_406768 ) ) ( not ( = ?auto_406758 ?auto_406769 ) ) ( not ( = ?auto_406758 ?auto_406770 ) ) ( not ( = ?auto_406759 ?auto_406760 ) ) ( not ( = ?auto_406759 ?auto_406761 ) ) ( not ( = ?auto_406759 ?auto_406762 ) ) ( not ( = ?auto_406759 ?auto_406763 ) ) ( not ( = ?auto_406759 ?auto_406764 ) ) ( not ( = ?auto_406759 ?auto_406765 ) ) ( not ( = ?auto_406759 ?auto_406766 ) ) ( not ( = ?auto_406759 ?auto_406767 ) ) ( not ( = ?auto_406759 ?auto_406768 ) ) ( not ( = ?auto_406759 ?auto_406769 ) ) ( not ( = ?auto_406759 ?auto_406770 ) ) ( not ( = ?auto_406760 ?auto_406761 ) ) ( not ( = ?auto_406760 ?auto_406762 ) ) ( not ( = ?auto_406760 ?auto_406763 ) ) ( not ( = ?auto_406760 ?auto_406764 ) ) ( not ( = ?auto_406760 ?auto_406765 ) ) ( not ( = ?auto_406760 ?auto_406766 ) ) ( not ( = ?auto_406760 ?auto_406767 ) ) ( not ( = ?auto_406760 ?auto_406768 ) ) ( not ( = ?auto_406760 ?auto_406769 ) ) ( not ( = ?auto_406760 ?auto_406770 ) ) ( not ( = ?auto_406761 ?auto_406762 ) ) ( not ( = ?auto_406761 ?auto_406763 ) ) ( not ( = ?auto_406761 ?auto_406764 ) ) ( not ( = ?auto_406761 ?auto_406765 ) ) ( not ( = ?auto_406761 ?auto_406766 ) ) ( not ( = ?auto_406761 ?auto_406767 ) ) ( not ( = ?auto_406761 ?auto_406768 ) ) ( not ( = ?auto_406761 ?auto_406769 ) ) ( not ( = ?auto_406761 ?auto_406770 ) ) ( not ( = ?auto_406762 ?auto_406763 ) ) ( not ( = ?auto_406762 ?auto_406764 ) ) ( not ( = ?auto_406762 ?auto_406765 ) ) ( not ( = ?auto_406762 ?auto_406766 ) ) ( not ( = ?auto_406762 ?auto_406767 ) ) ( not ( = ?auto_406762 ?auto_406768 ) ) ( not ( = ?auto_406762 ?auto_406769 ) ) ( not ( = ?auto_406762 ?auto_406770 ) ) ( not ( = ?auto_406763 ?auto_406764 ) ) ( not ( = ?auto_406763 ?auto_406765 ) ) ( not ( = ?auto_406763 ?auto_406766 ) ) ( not ( = ?auto_406763 ?auto_406767 ) ) ( not ( = ?auto_406763 ?auto_406768 ) ) ( not ( = ?auto_406763 ?auto_406769 ) ) ( not ( = ?auto_406763 ?auto_406770 ) ) ( not ( = ?auto_406764 ?auto_406765 ) ) ( not ( = ?auto_406764 ?auto_406766 ) ) ( not ( = ?auto_406764 ?auto_406767 ) ) ( not ( = ?auto_406764 ?auto_406768 ) ) ( not ( = ?auto_406764 ?auto_406769 ) ) ( not ( = ?auto_406764 ?auto_406770 ) ) ( not ( = ?auto_406765 ?auto_406766 ) ) ( not ( = ?auto_406765 ?auto_406767 ) ) ( not ( = ?auto_406765 ?auto_406768 ) ) ( not ( = ?auto_406765 ?auto_406769 ) ) ( not ( = ?auto_406765 ?auto_406770 ) ) ( not ( = ?auto_406766 ?auto_406767 ) ) ( not ( = ?auto_406766 ?auto_406768 ) ) ( not ( = ?auto_406766 ?auto_406769 ) ) ( not ( = ?auto_406766 ?auto_406770 ) ) ( not ( = ?auto_406767 ?auto_406768 ) ) ( not ( = ?auto_406767 ?auto_406769 ) ) ( not ( = ?auto_406767 ?auto_406770 ) ) ( not ( = ?auto_406768 ?auto_406769 ) ) ( not ( = ?auto_406768 ?auto_406770 ) ) ( not ( = ?auto_406769 ?auto_406770 ) ) ( ON ?auto_406768 ?auto_406769 ) ( CLEAR ?auto_406766 ) ( ON ?auto_406767 ?auto_406768 ) ( CLEAR ?auto_406767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_406755 ?auto_406756 ?auto_406757 ?auto_406758 ?auto_406759 ?auto_406760 ?auto_406761 ?auto_406762 ?auto_406763 ?auto_406764 ?auto_406765 ?auto_406766 ?auto_406767 )
      ( MAKE-15PILE ?auto_406755 ?auto_406756 ?auto_406757 ?auto_406758 ?auto_406759 ?auto_406760 ?auto_406761 ?auto_406762 ?auto_406763 ?auto_406764 ?auto_406765 ?auto_406766 ?auto_406767 ?auto_406768 ?auto_406769 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_406786 - BLOCK
      ?auto_406787 - BLOCK
      ?auto_406788 - BLOCK
      ?auto_406789 - BLOCK
      ?auto_406790 - BLOCK
      ?auto_406791 - BLOCK
      ?auto_406792 - BLOCK
      ?auto_406793 - BLOCK
      ?auto_406794 - BLOCK
      ?auto_406795 - BLOCK
      ?auto_406796 - BLOCK
      ?auto_406797 - BLOCK
      ?auto_406798 - BLOCK
      ?auto_406799 - BLOCK
      ?auto_406800 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_406800 ) ( ON-TABLE ?auto_406786 ) ( ON ?auto_406787 ?auto_406786 ) ( ON ?auto_406788 ?auto_406787 ) ( ON ?auto_406789 ?auto_406788 ) ( ON ?auto_406790 ?auto_406789 ) ( ON ?auto_406791 ?auto_406790 ) ( ON ?auto_406792 ?auto_406791 ) ( ON ?auto_406793 ?auto_406792 ) ( ON ?auto_406794 ?auto_406793 ) ( ON ?auto_406795 ?auto_406794 ) ( ON ?auto_406796 ?auto_406795 ) ( ON ?auto_406797 ?auto_406796 ) ( not ( = ?auto_406786 ?auto_406787 ) ) ( not ( = ?auto_406786 ?auto_406788 ) ) ( not ( = ?auto_406786 ?auto_406789 ) ) ( not ( = ?auto_406786 ?auto_406790 ) ) ( not ( = ?auto_406786 ?auto_406791 ) ) ( not ( = ?auto_406786 ?auto_406792 ) ) ( not ( = ?auto_406786 ?auto_406793 ) ) ( not ( = ?auto_406786 ?auto_406794 ) ) ( not ( = ?auto_406786 ?auto_406795 ) ) ( not ( = ?auto_406786 ?auto_406796 ) ) ( not ( = ?auto_406786 ?auto_406797 ) ) ( not ( = ?auto_406786 ?auto_406798 ) ) ( not ( = ?auto_406786 ?auto_406799 ) ) ( not ( = ?auto_406786 ?auto_406800 ) ) ( not ( = ?auto_406787 ?auto_406788 ) ) ( not ( = ?auto_406787 ?auto_406789 ) ) ( not ( = ?auto_406787 ?auto_406790 ) ) ( not ( = ?auto_406787 ?auto_406791 ) ) ( not ( = ?auto_406787 ?auto_406792 ) ) ( not ( = ?auto_406787 ?auto_406793 ) ) ( not ( = ?auto_406787 ?auto_406794 ) ) ( not ( = ?auto_406787 ?auto_406795 ) ) ( not ( = ?auto_406787 ?auto_406796 ) ) ( not ( = ?auto_406787 ?auto_406797 ) ) ( not ( = ?auto_406787 ?auto_406798 ) ) ( not ( = ?auto_406787 ?auto_406799 ) ) ( not ( = ?auto_406787 ?auto_406800 ) ) ( not ( = ?auto_406788 ?auto_406789 ) ) ( not ( = ?auto_406788 ?auto_406790 ) ) ( not ( = ?auto_406788 ?auto_406791 ) ) ( not ( = ?auto_406788 ?auto_406792 ) ) ( not ( = ?auto_406788 ?auto_406793 ) ) ( not ( = ?auto_406788 ?auto_406794 ) ) ( not ( = ?auto_406788 ?auto_406795 ) ) ( not ( = ?auto_406788 ?auto_406796 ) ) ( not ( = ?auto_406788 ?auto_406797 ) ) ( not ( = ?auto_406788 ?auto_406798 ) ) ( not ( = ?auto_406788 ?auto_406799 ) ) ( not ( = ?auto_406788 ?auto_406800 ) ) ( not ( = ?auto_406789 ?auto_406790 ) ) ( not ( = ?auto_406789 ?auto_406791 ) ) ( not ( = ?auto_406789 ?auto_406792 ) ) ( not ( = ?auto_406789 ?auto_406793 ) ) ( not ( = ?auto_406789 ?auto_406794 ) ) ( not ( = ?auto_406789 ?auto_406795 ) ) ( not ( = ?auto_406789 ?auto_406796 ) ) ( not ( = ?auto_406789 ?auto_406797 ) ) ( not ( = ?auto_406789 ?auto_406798 ) ) ( not ( = ?auto_406789 ?auto_406799 ) ) ( not ( = ?auto_406789 ?auto_406800 ) ) ( not ( = ?auto_406790 ?auto_406791 ) ) ( not ( = ?auto_406790 ?auto_406792 ) ) ( not ( = ?auto_406790 ?auto_406793 ) ) ( not ( = ?auto_406790 ?auto_406794 ) ) ( not ( = ?auto_406790 ?auto_406795 ) ) ( not ( = ?auto_406790 ?auto_406796 ) ) ( not ( = ?auto_406790 ?auto_406797 ) ) ( not ( = ?auto_406790 ?auto_406798 ) ) ( not ( = ?auto_406790 ?auto_406799 ) ) ( not ( = ?auto_406790 ?auto_406800 ) ) ( not ( = ?auto_406791 ?auto_406792 ) ) ( not ( = ?auto_406791 ?auto_406793 ) ) ( not ( = ?auto_406791 ?auto_406794 ) ) ( not ( = ?auto_406791 ?auto_406795 ) ) ( not ( = ?auto_406791 ?auto_406796 ) ) ( not ( = ?auto_406791 ?auto_406797 ) ) ( not ( = ?auto_406791 ?auto_406798 ) ) ( not ( = ?auto_406791 ?auto_406799 ) ) ( not ( = ?auto_406791 ?auto_406800 ) ) ( not ( = ?auto_406792 ?auto_406793 ) ) ( not ( = ?auto_406792 ?auto_406794 ) ) ( not ( = ?auto_406792 ?auto_406795 ) ) ( not ( = ?auto_406792 ?auto_406796 ) ) ( not ( = ?auto_406792 ?auto_406797 ) ) ( not ( = ?auto_406792 ?auto_406798 ) ) ( not ( = ?auto_406792 ?auto_406799 ) ) ( not ( = ?auto_406792 ?auto_406800 ) ) ( not ( = ?auto_406793 ?auto_406794 ) ) ( not ( = ?auto_406793 ?auto_406795 ) ) ( not ( = ?auto_406793 ?auto_406796 ) ) ( not ( = ?auto_406793 ?auto_406797 ) ) ( not ( = ?auto_406793 ?auto_406798 ) ) ( not ( = ?auto_406793 ?auto_406799 ) ) ( not ( = ?auto_406793 ?auto_406800 ) ) ( not ( = ?auto_406794 ?auto_406795 ) ) ( not ( = ?auto_406794 ?auto_406796 ) ) ( not ( = ?auto_406794 ?auto_406797 ) ) ( not ( = ?auto_406794 ?auto_406798 ) ) ( not ( = ?auto_406794 ?auto_406799 ) ) ( not ( = ?auto_406794 ?auto_406800 ) ) ( not ( = ?auto_406795 ?auto_406796 ) ) ( not ( = ?auto_406795 ?auto_406797 ) ) ( not ( = ?auto_406795 ?auto_406798 ) ) ( not ( = ?auto_406795 ?auto_406799 ) ) ( not ( = ?auto_406795 ?auto_406800 ) ) ( not ( = ?auto_406796 ?auto_406797 ) ) ( not ( = ?auto_406796 ?auto_406798 ) ) ( not ( = ?auto_406796 ?auto_406799 ) ) ( not ( = ?auto_406796 ?auto_406800 ) ) ( not ( = ?auto_406797 ?auto_406798 ) ) ( not ( = ?auto_406797 ?auto_406799 ) ) ( not ( = ?auto_406797 ?auto_406800 ) ) ( not ( = ?auto_406798 ?auto_406799 ) ) ( not ( = ?auto_406798 ?auto_406800 ) ) ( not ( = ?auto_406799 ?auto_406800 ) ) ( ON ?auto_406799 ?auto_406800 ) ( CLEAR ?auto_406797 ) ( ON ?auto_406798 ?auto_406799 ) ( CLEAR ?auto_406798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_406786 ?auto_406787 ?auto_406788 ?auto_406789 ?auto_406790 ?auto_406791 ?auto_406792 ?auto_406793 ?auto_406794 ?auto_406795 ?auto_406796 ?auto_406797 ?auto_406798 )
      ( MAKE-15PILE ?auto_406786 ?auto_406787 ?auto_406788 ?auto_406789 ?auto_406790 ?auto_406791 ?auto_406792 ?auto_406793 ?auto_406794 ?auto_406795 ?auto_406796 ?auto_406797 ?auto_406798 ?auto_406799 ?auto_406800 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_406816 - BLOCK
      ?auto_406817 - BLOCK
      ?auto_406818 - BLOCK
      ?auto_406819 - BLOCK
      ?auto_406820 - BLOCK
      ?auto_406821 - BLOCK
      ?auto_406822 - BLOCK
      ?auto_406823 - BLOCK
      ?auto_406824 - BLOCK
      ?auto_406825 - BLOCK
      ?auto_406826 - BLOCK
      ?auto_406827 - BLOCK
      ?auto_406828 - BLOCK
      ?auto_406829 - BLOCK
      ?auto_406830 - BLOCK
    )
    :vars
    (
      ?auto_406831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_406830 ?auto_406831 ) ( ON-TABLE ?auto_406816 ) ( ON ?auto_406817 ?auto_406816 ) ( ON ?auto_406818 ?auto_406817 ) ( ON ?auto_406819 ?auto_406818 ) ( ON ?auto_406820 ?auto_406819 ) ( ON ?auto_406821 ?auto_406820 ) ( ON ?auto_406822 ?auto_406821 ) ( ON ?auto_406823 ?auto_406822 ) ( ON ?auto_406824 ?auto_406823 ) ( ON ?auto_406825 ?auto_406824 ) ( ON ?auto_406826 ?auto_406825 ) ( not ( = ?auto_406816 ?auto_406817 ) ) ( not ( = ?auto_406816 ?auto_406818 ) ) ( not ( = ?auto_406816 ?auto_406819 ) ) ( not ( = ?auto_406816 ?auto_406820 ) ) ( not ( = ?auto_406816 ?auto_406821 ) ) ( not ( = ?auto_406816 ?auto_406822 ) ) ( not ( = ?auto_406816 ?auto_406823 ) ) ( not ( = ?auto_406816 ?auto_406824 ) ) ( not ( = ?auto_406816 ?auto_406825 ) ) ( not ( = ?auto_406816 ?auto_406826 ) ) ( not ( = ?auto_406816 ?auto_406827 ) ) ( not ( = ?auto_406816 ?auto_406828 ) ) ( not ( = ?auto_406816 ?auto_406829 ) ) ( not ( = ?auto_406816 ?auto_406830 ) ) ( not ( = ?auto_406816 ?auto_406831 ) ) ( not ( = ?auto_406817 ?auto_406818 ) ) ( not ( = ?auto_406817 ?auto_406819 ) ) ( not ( = ?auto_406817 ?auto_406820 ) ) ( not ( = ?auto_406817 ?auto_406821 ) ) ( not ( = ?auto_406817 ?auto_406822 ) ) ( not ( = ?auto_406817 ?auto_406823 ) ) ( not ( = ?auto_406817 ?auto_406824 ) ) ( not ( = ?auto_406817 ?auto_406825 ) ) ( not ( = ?auto_406817 ?auto_406826 ) ) ( not ( = ?auto_406817 ?auto_406827 ) ) ( not ( = ?auto_406817 ?auto_406828 ) ) ( not ( = ?auto_406817 ?auto_406829 ) ) ( not ( = ?auto_406817 ?auto_406830 ) ) ( not ( = ?auto_406817 ?auto_406831 ) ) ( not ( = ?auto_406818 ?auto_406819 ) ) ( not ( = ?auto_406818 ?auto_406820 ) ) ( not ( = ?auto_406818 ?auto_406821 ) ) ( not ( = ?auto_406818 ?auto_406822 ) ) ( not ( = ?auto_406818 ?auto_406823 ) ) ( not ( = ?auto_406818 ?auto_406824 ) ) ( not ( = ?auto_406818 ?auto_406825 ) ) ( not ( = ?auto_406818 ?auto_406826 ) ) ( not ( = ?auto_406818 ?auto_406827 ) ) ( not ( = ?auto_406818 ?auto_406828 ) ) ( not ( = ?auto_406818 ?auto_406829 ) ) ( not ( = ?auto_406818 ?auto_406830 ) ) ( not ( = ?auto_406818 ?auto_406831 ) ) ( not ( = ?auto_406819 ?auto_406820 ) ) ( not ( = ?auto_406819 ?auto_406821 ) ) ( not ( = ?auto_406819 ?auto_406822 ) ) ( not ( = ?auto_406819 ?auto_406823 ) ) ( not ( = ?auto_406819 ?auto_406824 ) ) ( not ( = ?auto_406819 ?auto_406825 ) ) ( not ( = ?auto_406819 ?auto_406826 ) ) ( not ( = ?auto_406819 ?auto_406827 ) ) ( not ( = ?auto_406819 ?auto_406828 ) ) ( not ( = ?auto_406819 ?auto_406829 ) ) ( not ( = ?auto_406819 ?auto_406830 ) ) ( not ( = ?auto_406819 ?auto_406831 ) ) ( not ( = ?auto_406820 ?auto_406821 ) ) ( not ( = ?auto_406820 ?auto_406822 ) ) ( not ( = ?auto_406820 ?auto_406823 ) ) ( not ( = ?auto_406820 ?auto_406824 ) ) ( not ( = ?auto_406820 ?auto_406825 ) ) ( not ( = ?auto_406820 ?auto_406826 ) ) ( not ( = ?auto_406820 ?auto_406827 ) ) ( not ( = ?auto_406820 ?auto_406828 ) ) ( not ( = ?auto_406820 ?auto_406829 ) ) ( not ( = ?auto_406820 ?auto_406830 ) ) ( not ( = ?auto_406820 ?auto_406831 ) ) ( not ( = ?auto_406821 ?auto_406822 ) ) ( not ( = ?auto_406821 ?auto_406823 ) ) ( not ( = ?auto_406821 ?auto_406824 ) ) ( not ( = ?auto_406821 ?auto_406825 ) ) ( not ( = ?auto_406821 ?auto_406826 ) ) ( not ( = ?auto_406821 ?auto_406827 ) ) ( not ( = ?auto_406821 ?auto_406828 ) ) ( not ( = ?auto_406821 ?auto_406829 ) ) ( not ( = ?auto_406821 ?auto_406830 ) ) ( not ( = ?auto_406821 ?auto_406831 ) ) ( not ( = ?auto_406822 ?auto_406823 ) ) ( not ( = ?auto_406822 ?auto_406824 ) ) ( not ( = ?auto_406822 ?auto_406825 ) ) ( not ( = ?auto_406822 ?auto_406826 ) ) ( not ( = ?auto_406822 ?auto_406827 ) ) ( not ( = ?auto_406822 ?auto_406828 ) ) ( not ( = ?auto_406822 ?auto_406829 ) ) ( not ( = ?auto_406822 ?auto_406830 ) ) ( not ( = ?auto_406822 ?auto_406831 ) ) ( not ( = ?auto_406823 ?auto_406824 ) ) ( not ( = ?auto_406823 ?auto_406825 ) ) ( not ( = ?auto_406823 ?auto_406826 ) ) ( not ( = ?auto_406823 ?auto_406827 ) ) ( not ( = ?auto_406823 ?auto_406828 ) ) ( not ( = ?auto_406823 ?auto_406829 ) ) ( not ( = ?auto_406823 ?auto_406830 ) ) ( not ( = ?auto_406823 ?auto_406831 ) ) ( not ( = ?auto_406824 ?auto_406825 ) ) ( not ( = ?auto_406824 ?auto_406826 ) ) ( not ( = ?auto_406824 ?auto_406827 ) ) ( not ( = ?auto_406824 ?auto_406828 ) ) ( not ( = ?auto_406824 ?auto_406829 ) ) ( not ( = ?auto_406824 ?auto_406830 ) ) ( not ( = ?auto_406824 ?auto_406831 ) ) ( not ( = ?auto_406825 ?auto_406826 ) ) ( not ( = ?auto_406825 ?auto_406827 ) ) ( not ( = ?auto_406825 ?auto_406828 ) ) ( not ( = ?auto_406825 ?auto_406829 ) ) ( not ( = ?auto_406825 ?auto_406830 ) ) ( not ( = ?auto_406825 ?auto_406831 ) ) ( not ( = ?auto_406826 ?auto_406827 ) ) ( not ( = ?auto_406826 ?auto_406828 ) ) ( not ( = ?auto_406826 ?auto_406829 ) ) ( not ( = ?auto_406826 ?auto_406830 ) ) ( not ( = ?auto_406826 ?auto_406831 ) ) ( not ( = ?auto_406827 ?auto_406828 ) ) ( not ( = ?auto_406827 ?auto_406829 ) ) ( not ( = ?auto_406827 ?auto_406830 ) ) ( not ( = ?auto_406827 ?auto_406831 ) ) ( not ( = ?auto_406828 ?auto_406829 ) ) ( not ( = ?auto_406828 ?auto_406830 ) ) ( not ( = ?auto_406828 ?auto_406831 ) ) ( not ( = ?auto_406829 ?auto_406830 ) ) ( not ( = ?auto_406829 ?auto_406831 ) ) ( not ( = ?auto_406830 ?auto_406831 ) ) ( ON ?auto_406829 ?auto_406830 ) ( ON ?auto_406828 ?auto_406829 ) ( CLEAR ?auto_406826 ) ( ON ?auto_406827 ?auto_406828 ) ( CLEAR ?auto_406827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_406816 ?auto_406817 ?auto_406818 ?auto_406819 ?auto_406820 ?auto_406821 ?auto_406822 ?auto_406823 ?auto_406824 ?auto_406825 ?auto_406826 ?auto_406827 )
      ( MAKE-15PILE ?auto_406816 ?auto_406817 ?auto_406818 ?auto_406819 ?auto_406820 ?auto_406821 ?auto_406822 ?auto_406823 ?auto_406824 ?auto_406825 ?auto_406826 ?auto_406827 ?auto_406828 ?auto_406829 ?auto_406830 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_406847 - BLOCK
      ?auto_406848 - BLOCK
      ?auto_406849 - BLOCK
      ?auto_406850 - BLOCK
      ?auto_406851 - BLOCK
      ?auto_406852 - BLOCK
      ?auto_406853 - BLOCK
      ?auto_406854 - BLOCK
      ?auto_406855 - BLOCK
      ?auto_406856 - BLOCK
      ?auto_406857 - BLOCK
      ?auto_406858 - BLOCK
      ?auto_406859 - BLOCK
      ?auto_406860 - BLOCK
      ?auto_406861 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_406861 ) ( ON-TABLE ?auto_406847 ) ( ON ?auto_406848 ?auto_406847 ) ( ON ?auto_406849 ?auto_406848 ) ( ON ?auto_406850 ?auto_406849 ) ( ON ?auto_406851 ?auto_406850 ) ( ON ?auto_406852 ?auto_406851 ) ( ON ?auto_406853 ?auto_406852 ) ( ON ?auto_406854 ?auto_406853 ) ( ON ?auto_406855 ?auto_406854 ) ( ON ?auto_406856 ?auto_406855 ) ( ON ?auto_406857 ?auto_406856 ) ( not ( = ?auto_406847 ?auto_406848 ) ) ( not ( = ?auto_406847 ?auto_406849 ) ) ( not ( = ?auto_406847 ?auto_406850 ) ) ( not ( = ?auto_406847 ?auto_406851 ) ) ( not ( = ?auto_406847 ?auto_406852 ) ) ( not ( = ?auto_406847 ?auto_406853 ) ) ( not ( = ?auto_406847 ?auto_406854 ) ) ( not ( = ?auto_406847 ?auto_406855 ) ) ( not ( = ?auto_406847 ?auto_406856 ) ) ( not ( = ?auto_406847 ?auto_406857 ) ) ( not ( = ?auto_406847 ?auto_406858 ) ) ( not ( = ?auto_406847 ?auto_406859 ) ) ( not ( = ?auto_406847 ?auto_406860 ) ) ( not ( = ?auto_406847 ?auto_406861 ) ) ( not ( = ?auto_406848 ?auto_406849 ) ) ( not ( = ?auto_406848 ?auto_406850 ) ) ( not ( = ?auto_406848 ?auto_406851 ) ) ( not ( = ?auto_406848 ?auto_406852 ) ) ( not ( = ?auto_406848 ?auto_406853 ) ) ( not ( = ?auto_406848 ?auto_406854 ) ) ( not ( = ?auto_406848 ?auto_406855 ) ) ( not ( = ?auto_406848 ?auto_406856 ) ) ( not ( = ?auto_406848 ?auto_406857 ) ) ( not ( = ?auto_406848 ?auto_406858 ) ) ( not ( = ?auto_406848 ?auto_406859 ) ) ( not ( = ?auto_406848 ?auto_406860 ) ) ( not ( = ?auto_406848 ?auto_406861 ) ) ( not ( = ?auto_406849 ?auto_406850 ) ) ( not ( = ?auto_406849 ?auto_406851 ) ) ( not ( = ?auto_406849 ?auto_406852 ) ) ( not ( = ?auto_406849 ?auto_406853 ) ) ( not ( = ?auto_406849 ?auto_406854 ) ) ( not ( = ?auto_406849 ?auto_406855 ) ) ( not ( = ?auto_406849 ?auto_406856 ) ) ( not ( = ?auto_406849 ?auto_406857 ) ) ( not ( = ?auto_406849 ?auto_406858 ) ) ( not ( = ?auto_406849 ?auto_406859 ) ) ( not ( = ?auto_406849 ?auto_406860 ) ) ( not ( = ?auto_406849 ?auto_406861 ) ) ( not ( = ?auto_406850 ?auto_406851 ) ) ( not ( = ?auto_406850 ?auto_406852 ) ) ( not ( = ?auto_406850 ?auto_406853 ) ) ( not ( = ?auto_406850 ?auto_406854 ) ) ( not ( = ?auto_406850 ?auto_406855 ) ) ( not ( = ?auto_406850 ?auto_406856 ) ) ( not ( = ?auto_406850 ?auto_406857 ) ) ( not ( = ?auto_406850 ?auto_406858 ) ) ( not ( = ?auto_406850 ?auto_406859 ) ) ( not ( = ?auto_406850 ?auto_406860 ) ) ( not ( = ?auto_406850 ?auto_406861 ) ) ( not ( = ?auto_406851 ?auto_406852 ) ) ( not ( = ?auto_406851 ?auto_406853 ) ) ( not ( = ?auto_406851 ?auto_406854 ) ) ( not ( = ?auto_406851 ?auto_406855 ) ) ( not ( = ?auto_406851 ?auto_406856 ) ) ( not ( = ?auto_406851 ?auto_406857 ) ) ( not ( = ?auto_406851 ?auto_406858 ) ) ( not ( = ?auto_406851 ?auto_406859 ) ) ( not ( = ?auto_406851 ?auto_406860 ) ) ( not ( = ?auto_406851 ?auto_406861 ) ) ( not ( = ?auto_406852 ?auto_406853 ) ) ( not ( = ?auto_406852 ?auto_406854 ) ) ( not ( = ?auto_406852 ?auto_406855 ) ) ( not ( = ?auto_406852 ?auto_406856 ) ) ( not ( = ?auto_406852 ?auto_406857 ) ) ( not ( = ?auto_406852 ?auto_406858 ) ) ( not ( = ?auto_406852 ?auto_406859 ) ) ( not ( = ?auto_406852 ?auto_406860 ) ) ( not ( = ?auto_406852 ?auto_406861 ) ) ( not ( = ?auto_406853 ?auto_406854 ) ) ( not ( = ?auto_406853 ?auto_406855 ) ) ( not ( = ?auto_406853 ?auto_406856 ) ) ( not ( = ?auto_406853 ?auto_406857 ) ) ( not ( = ?auto_406853 ?auto_406858 ) ) ( not ( = ?auto_406853 ?auto_406859 ) ) ( not ( = ?auto_406853 ?auto_406860 ) ) ( not ( = ?auto_406853 ?auto_406861 ) ) ( not ( = ?auto_406854 ?auto_406855 ) ) ( not ( = ?auto_406854 ?auto_406856 ) ) ( not ( = ?auto_406854 ?auto_406857 ) ) ( not ( = ?auto_406854 ?auto_406858 ) ) ( not ( = ?auto_406854 ?auto_406859 ) ) ( not ( = ?auto_406854 ?auto_406860 ) ) ( not ( = ?auto_406854 ?auto_406861 ) ) ( not ( = ?auto_406855 ?auto_406856 ) ) ( not ( = ?auto_406855 ?auto_406857 ) ) ( not ( = ?auto_406855 ?auto_406858 ) ) ( not ( = ?auto_406855 ?auto_406859 ) ) ( not ( = ?auto_406855 ?auto_406860 ) ) ( not ( = ?auto_406855 ?auto_406861 ) ) ( not ( = ?auto_406856 ?auto_406857 ) ) ( not ( = ?auto_406856 ?auto_406858 ) ) ( not ( = ?auto_406856 ?auto_406859 ) ) ( not ( = ?auto_406856 ?auto_406860 ) ) ( not ( = ?auto_406856 ?auto_406861 ) ) ( not ( = ?auto_406857 ?auto_406858 ) ) ( not ( = ?auto_406857 ?auto_406859 ) ) ( not ( = ?auto_406857 ?auto_406860 ) ) ( not ( = ?auto_406857 ?auto_406861 ) ) ( not ( = ?auto_406858 ?auto_406859 ) ) ( not ( = ?auto_406858 ?auto_406860 ) ) ( not ( = ?auto_406858 ?auto_406861 ) ) ( not ( = ?auto_406859 ?auto_406860 ) ) ( not ( = ?auto_406859 ?auto_406861 ) ) ( not ( = ?auto_406860 ?auto_406861 ) ) ( ON ?auto_406860 ?auto_406861 ) ( ON ?auto_406859 ?auto_406860 ) ( CLEAR ?auto_406857 ) ( ON ?auto_406858 ?auto_406859 ) ( CLEAR ?auto_406858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_406847 ?auto_406848 ?auto_406849 ?auto_406850 ?auto_406851 ?auto_406852 ?auto_406853 ?auto_406854 ?auto_406855 ?auto_406856 ?auto_406857 ?auto_406858 )
      ( MAKE-15PILE ?auto_406847 ?auto_406848 ?auto_406849 ?auto_406850 ?auto_406851 ?auto_406852 ?auto_406853 ?auto_406854 ?auto_406855 ?auto_406856 ?auto_406857 ?auto_406858 ?auto_406859 ?auto_406860 ?auto_406861 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_406877 - BLOCK
      ?auto_406878 - BLOCK
      ?auto_406879 - BLOCK
      ?auto_406880 - BLOCK
      ?auto_406881 - BLOCK
      ?auto_406882 - BLOCK
      ?auto_406883 - BLOCK
      ?auto_406884 - BLOCK
      ?auto_406885 - BLOCK
      ?auto_406886 - BLOCK
      ?auto_406887 - BLOCK
      ?auto_406888 - BLOCK
      ?auto_406889 - BLOCK
      ?auto_406890 - BLOCK
      ?auto_406891 - BLOCK
    )
    :vars
    (
      ?auto_406892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_406891 ?auto_406892 ) ( ON-TABLE ?auto_406877 ) ( ON ?auto_406878 ?auto_406877 ) ( ON ?auto_406879 ?auto_406878 ) ( ON ?auto_406880 ?auto_406879 ) ( ON ?auto_406881 ?auto_406880 ) ( ON ?auto_406882 ?auto_406881 ) ( ON ?auto_406883 ?auto_406882 ) ( ON ?auto_406884 ?auto_406883 ) ( ON ?auto_406885 ?auto_406884 ) ( ON ?auto_406886 ?auto_406885 ) ( not ( = ?auto_406877 ?auto_406878 ) ) ( not ( = ?auto_406877 ?auto_406879 ) ) ( not ( = ?auto_406877 ?auto_406880 ) ) ( not ( = ?auto_406877 ?auto_406881 ) ) ( not ( = ?auto_406877 ?auto_406882 ) ) ( not ( = ?auto_406877 ?auto_406883 ) ) ( not ( = ?auto_406877 ?auto_406884 ) ) ( not ( = ?auto_406877 ?auto_406885 ) ) ( not ( = ?auto_406877 ?auto_406886 ) ) ( not ( = ?auto_406877 ?auto_406887 ) ) ( not ( = ?auto_406877 ?auto_406888 ) ) ( not ( = ?auto_406877 ?auto_406889 ) ) ( not ( = ?auto_406877 ?auto_406890 ) ) ( not ( = ?auto_406877 ?auto_406891 ) ) ( not ( = ?auto_406877 ?auto_406892 ) ) ( not ( = ?auto_406878 ?auto_406879 ) ) ( not ( = ?auto_406878 ?auto_406880 ) ) ( not ( = ?auto_406878 ?auto_406881 ) ) ( not ( = ?auto_406878 ?auto_406882 ) ) ( not ( = ?auto_406878 ?auto_406883 ) ) ( not ( = ?auto_406878 ?auto_406884 ) ) ( not ( = ?auto_406878 ?auto_406885 ) ) ( not ( = ?auto_406878 ?auto_406886 ) ) ( not ( = ?auto_406878 ?auto_406887 ) ) ( not ( = ?auto_406878 ?auto_406888 ) ) ( not ( = ?auto_406878 ?auto_406889 ) ) ( not ( = ?auto_406878 ?auto_406890 ) ) ( not ( = ?auto_406878 ?auto_406891 ) ) ( not ( = ?auto_406878 ?auto_406892 ) ) ( not ( = ?auto_406879 ?auto_406880 ) ) ( not ( = ?auto_406879 ?auto_406881 ) ) ( not ( = ?auto_406879 ?auto_406882 ) ) ( not ( = ?auto_406879 ?auto_406883 ) ) ( not ( = ?auto_406879 ?auto_406884 ) ) ( not ( = ?auto_406879 ?auto_406885 ) ) ( not ( = ?auto_406879 ?auto_406886 ) ) ( not ( = ?auto_406879 ?auto_406887 ) ) ( not ( = ?auto_406879 ?auto_406888 ) ) ( not ( = ?auto_406879 ?auto_406889 ) ) ( not ( = ?auto_406879 ?auto_406890 ) ) ( not ( = ?auto_406879 ?auto_406891 ) ) ( not ( = ?auto_406879 ?auto_406892 ) ) ( not ( = ?auto_406880 ?auto_406881 ) ) ( not ( = ?auto_406880 ?auto_406882 ) ) ( not ( = ?auto_406880 ?auto_406883 ) ) ( not ( = ?auto_406880 ?auto_406884 ) ) ( not ( = ?auto_406880 ?auto_406885 ) ) ( not ( = ?auto_406880 ?auto_406886 ) ) ( not ( = ?auto_406880 ?auto_406887 ) ) ( not ( = ?auto_406880 ?auto_406888 ) ) ( not ( = ?auto_406880 ?auto_406889 ) ) ( not ( = ?auto_406880 ?auto_406890 ) ) ( not ( = ?auto_406880 ?auto_406891 ) ) ( not ( = ?auto_406880 ?auto_406892 ) ) ( not ( = ?auto_406881 ?auto_406882 ) ) ( not ( = ?auto_406881 ?auto_406883 ) ) ( not ( = ?auto_406881 ?auto_406884 ) ) ( not ( = ?auto_406881 ?auto_406885 ) ) ( not ( = ?auto_406881 ?auto_406886 ) ) ( not ( = ?auto_406881 ?auto_406887 ) ) ( not ( = ?auto_406881 ?auto_406888 ) ) ( not ( = ?auto_406881 ?auto_406889 ) ) ( not ( = ?auto_406881 ?auto_406890 ) ) ( not ( = ?auto_406881 ?auto_406891 ) ) ( not ( = ?auto_406881 ?auto_406892 ) ) ( not ( = ?auto_406882 ?auto_406883 ) ) ( not ( = ?auto_406882 ?auto_406884 ) ) ( not ( = ?auto_406882 ?auto_406885 ) ) ( not ( = ?auto_406882 ?auto_406886 ) ) ( not ( = ?auto_406882 ?auto_406887 ) ) ( not ( = ?auto_406882 ?auto_406888 ) ) ( not ( = ?auto_406882 ?auto_406889 ) ) ( not ( = ?auto_406882 ?auto_406890 ) ) ( not ( = ?auto_406882 ?auto_406891 ) ) ( not ( = ?auto_406882 ?auto_406892 ) ) ( not ( = ?auto_406883 ?auto_406884 ) ) ( not ( = ?auto_406883 ?auto_406885 ) ) ( not ( = ?auto_406883 ?auto_406886 ) ) ( not ( = ?auto_406883 ?auto_406887 ) ) ( not ( = ?auto_406883 ?auto_406888 ) ) ( not ( = ?auto_406883 ?auto_406889 ) ) ( not ( = ?auto_406883 ?auto_406890 ) ) ( not ( = ?auto_406883 ?auto_406891 ) ) ( not ( = ?auto_406883 ?auto_406892 ) ) ( not ( = ?auto_406884 ?auto_406885 ) ) ( not ( = ?auto_406884 ?auto_406886 ) ) ( not ( = ?auto_406884 ?auto_406887 ) ) ( not ( = ?auto_406884 ?auto_406888 ) ) ( not ( = ?auto_406884 ?auto_406889 ) ) ( not ( = ?auto_406884 ?auto_406890 ) ) ( not ( = ?auto_406884 ?auto_406891 ) ) ( not ( = ?auto_406884 ?auto_406892 ) ) ( not ( = ?auto_406885 ?auto_406886 ) ) ( not ( = ?auto_406885 ?auto_406887 ) ) ( not ( = ?auto_406885 ?auto_406888 ) ) ( not ( = ?auto_406885 ?auto_406889 ) ) ( not ( = ?auto_406885 ?auto_406890 ) ) ( not ( = ?auto_406885 ?auto_406891 ) ) ( not ( = ?auto_406885 ?auto_406892 ) ) ( not ( = ?auto_406886 ?auto_406887 ) ) ( not ( = ?auto_406886 ?auto_406888 ) ) ( not ( = ?auto_406886 ?auto_406889 ) ) ( not ( = ?auto_406886 ?auto_406890 ) ) ( not ( = ?auto_406886 ?auto_406891 ) ) ( not ( = ?auto_406886 ?auto_406892 ) ) ( not ( = ?auto_406887 ?auto_406888 ) ) ( not ( = ?auto_406887 ?auto_406889 ) ) ( not ( = ?auto_406887 ?auto_406890 ) ) ( not ( = ?auto_406887 ?auto_406891 ) ) ( not ( = ?auto_406887 ?auto_406892 ) ) ( not ( = ?auto_406888 ?auto_406889 ) ) ( not ( = ?auto_406888 ?auto_406890 ) ) ( not ( = ?auto_406888 ?auto_406891 ) ) ( not ( = ?auto_406888 ?auto_406892 ) ) ( not ( = ?auto_406889 ?auto_406890 ) ) ( not ( = ?auto_406889 ?auto_406891 ) ) ( not ( = ?auto_406889 ?auto_406892 ) ) ( not ( = ?auto_406890 ?auto_406891 ) ) ( not ( = ?auto_406890 ?auto_406892 ) ) ( not ( = ?auto_406891 ?auto_406892 ) ) ( ON ?auto_406890 ?auto_406891 ) ( ON ?auto_406889 ?auto_406890 ) ( ON ?auto_406888 ?auto_406889 ) ( CLEAR ?auto_406886 ) ( ON ?auto_406887 ?auto_406888 ) ( CLEAR ?auto_406887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_406877 ?auto_406878 ?auto_406879 ?auto_406880 ?auto_406881 ?auto_406882 ?auto_406883 ?auto_406884 ?auto_406885 ?auto_406886 ?auto_406887 )
      ( MAKE-15PILE ?auto_406877 ?auto_406878 ?auto_406879 ?auto_406880 ?auto_406881 ?auto_406882 ?auto_406883 ?auto_406884 ?auto_406885 ?auto_406886 ?auto_406887 ?auto_406888 ?auto_406889 ?auto_406890 ?auto_406891 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_406908 - BLOCK
      ?auto_406909 - BLOCK
      ?auto_406910 - BLOCK
      ?auto_406911 - BLOCK
      ?auto_406912 - BLOCK
      ?auto_406913 - BLOCK
      ?auto_406914 - BLOCK
      ?auto_406915 - BLOCK
      ?auto_406916 - BLOCK
      ?auto_406917 - BLOCK
      ?auto_406918 - BLOCK
      ?auto_406919 - BLOCK
      ?auto_406920 - BLOCK
      ?auto_406921 - BLOCK
      ?auto_406922 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_406922 ) ( ON-TABLE ?auto_406908 ) ( ON ?auto_406909 ?auto_406908 ) ( ON ?auto_406910 ?auto_406909 ) ( ON ?auto_406911 ?auto_406910 ) ( ON ?auto_406912 ?auto_406911 ) ( ON ?auto_406913 ?auto_406912 ) ( ON ?auto_406914 ?auto_406913 ) ( ON ?auto_406915 ?auto_406914 ) ( ON ?auto_406916 ?auto_406915 ) ( ON ?auto_406917 ?auto_406916 ) ( not ( = ?auto_406908 ?auto_406909 ) ) ( not ( = ?auto_406908 ?auto_406910 ) ) ( not ( = ?auto_406908 ?auto_406911 ) ) ( not ( = ?auto_406908 ?auto_406912 ) ) ( not ( = ?auto_406908 ?auto_406913 ) ) ( not ( = ?auto_406908 ?auto_406914 ) ) ( not ( = ?auto_406908 ?auto_406915 ) ) ( not ( = ?auto_406908 ?auto_406916 ) ) ( not ( = ?auto_406908 ?auto_406917 ) ) ( not ( = ?auto_406908 ?auto_406918 ) ) ( not ( = ?auto_406908 ?auto_406919 ) ) ( not ( = ?auto_406908 ?auto_406920 ) ) ( not ( = ?auto_406908 ?auto_406921 ) ) ( not ( = ?auto_406908 ?auto_406922 ) ) ( not ( = ?auto_406909 ?auto_406910 ) ) ( not ( = ?auto_406909 ?auto_406911 ) ) ( not ( = ?auto_406909 ?auto_406912 ) ) ( not ( = ?auto_406909 ?auto_406913 ) ) ( not ( = ?auto_406909 ?auto_406914 ) ) ( not ( = ?auto_406909 ?auto_406915 ) ) ( not ( = ?auto_406909 ?auto_406916 ) ) ( not ( = ?auto_406909 ?auto_406917 ) ) ( not ( = ?auto_406909 ?auto_406918 ) ) ( not ( = ?auto_406909 ?auto_406919 ) ) ( not ( = ?auto_406909 ?auto_406920 ) ) ( not ( = ?auto_406909 ?auto_406921 ) ) ( not ( = ?auto_406909 ?auto_406922 ) ) ( not ( = ?auto_406910 ?auto_406911 ) ) ( not ( = ?auto_406910 ?auto_406912 ) ) ( not ( = ?auto_406910 ?auto_406913 ) ) ( not ( = ?auto_406910 ?auto_406914 ) ) ( not ( = ?auto_406910 ?auto_406915 ) ) ( not ( = ?auto_406910 ?auto_406916 ) ) ( not ( = ?auto_406910 ?auto_406917 ) ) ( not ( = ?auto_406910 ?auto_406918 ) ) ( not ( = ?auto_406910 ?auto_406919 ) ) ( not ( = ?auto_406910 ?auto_406920 ) ) ( not ( = ?auto_406910 ?auto_406921 ) ) ( not ( = ?auto_406910 ?auto_406922 ) ) ( not ( = ?auto_406911 ?auto_406912 ) ) ( not ( = ?auto_406911 ?auto_406913 ) ) ( not ( = ?auto_406911 ?auto_406914 ) ) ( not ( = ?auto_406911 ?auto_406915 ) ) ( not ( = ?auto_406911 ?auto_406916 ) ) ( not ( = ?auto_406911 ?auto_406917 ) ) ( not ( = ?auto_406911 ?auto_406918 ) ) ( not ( = ?auto_406911 ?auto_406919 ) ) ( not ( = ?auto_406911 ?auto_406920 ) ) ( not ( = ?auto_406911 ?auto_406921 ) ) ( not ( = ?auto_406911 ?auto_406922 ) ) ( not ( = ?auto_406912 ?auto_406913 ) ) ( not ( = ?auto_406912 ?auto_406914 ) ) ( not ( = ?auto_406912 ?auto_406915 ) ) ( not ( = ?auto_406912 ?auto_406916 ) ) ( not ( = ?auto_406912 ?auto_406917 ) ) ( not ( = ?auto_406912 ?auto_406918 ) ) ( not ( = ?auto_406912 ?auto_406919 ) ) ( not ( = ?auto_406912 ?auto_406920 ) ) ( not ( = ?auto_406912 ?auto_406921 ) ) ( not ( = ?auto_406912 ?auto_406922 ) ) ( not ( = ?auto_406913 ?auto_406914 ) ) ( not ( = ?auto_406913 ?auto_406915 ) ) ( not ( = ?auto_406913 ?auto_406916 ) ) ( not ( = ?auto_406913 ?auto_406917 ) ) ( not ( = ?auto_406913 ?auto_406918 ) ) ( not ( = ?auto_406913 ?auto_406919 ) ) ( not ( = ?auto_406913 ?auto_406920 ) ) ( not ( = ?auto_406913 ?auto_406921 ) ) ( not ( = ?auto_406913 ?auto_406922 ) ) ( not ( = ?auto_406914 ?auto_406915 ) ) ( not ( = ?auto_406914 ?auto_406916 ) ) ( not ( = ?auto_406914 ?auto_406917 ) ) ( not ( = ?auto_406914 ?auto_406918 ) ) ( not ( = ?auto_406914 ?auto_406919 ) ) ( not ( = ?auto_406914 ?auto_406920 ) ) ( not ( = ?auto_406914 ?auto_406921 ) ) ( not ( = ?auto_406914 ?auto_406922 ) ) ( not ( = ?auto_406915 ?auto_406916 ) ) ( not ( = ?auto_406915 ?auto_406917 ) ) ( not ( = ?auto_406915 ?auto_406918 ) ) ( not ( = ?auto_406915 ?auto_406919 ) ) ( not ( = ?auto_406915 ?auto_406920 ) ) ( not ( = ?auto_406915 ?auto_406921 ) ) ( not ( = ?auto_406915 ?auto_406922 ) ) ( not ( = ?auto_406916 ?auto_406917 ) ) ( not ( = ?auto_406916 ?auto_406918 ) ) ( not ( = ?auto_406916 ?auto_406919 ) ) ( not ( = ?auto_406916 ?auto_406920 ) ) ( not ( = ?auto_406916 ?auto_406921 ) ) ( not ( = ?auto_406916 ?auto_406922 ) ) ( not ( = ?auto_406917 ?auto_406918 ) ) ( not ( = ?auto_406917 ?auto_406919 ) ) ( not ( = ?auto_406917 ?auto_406920 ) ) ( not ( = ?auto_406917 ?auto_406921 ) ) ( not ( = ?auto_406917 ?auto_406922 ) ) ( not ( = ?auto_406918 ?auto_406919 ) ) ( not ( = ?auto_406918 ?auto_406920 ) ) ( not ( = ?auto_406918 ?auto_406921 ) ) ( not ( = ?auto_406918 ?auto_406922 ) ) ( not ( = ?auto_406919 ?auto_406920 ) ) ( not ( = ?auto_406919 ?auto_406921 ) ) ( not ( = ?auto_406919 ?auto_406922 ) ) ( not ( = ?auto_406920 ?auto_406921 ) ) ( not ( = ?auto_406920 ?auto_406922 ) ) ( not ( = ?auto_406921 ?auto_406922 ) ) ( ON ?auto_406921 ?auto_406922 ) ( ON ?auto_406920 ?auto_406921 ) ( ON ?auto_406919 ?auto_406920 ) ( CLEAR ?auto_406917 ) ( ON ?auto_406918 ?auto_406919 ) ( CLEAR ?auto_406918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_406908 ?auto_406909 ?auto_406910 ?auto_406911 ?auto_406912 ?auto_406913 ?auto_406914 ?auto_406915 ?auto_406916 ?auto_406917 ?auto_406918 )
      ( MAKE-15PILE ?auto_406908 ?auto_406909 ?auto_406910 ?auto_406911 ?auto_406912 ?auto_406913 ?auto_406914 ?auto_406915 ?auto_406916 ?auto_406917 ?auto_406918 ?auto_406919 ?auto_406920 ?auto_406921 ?auto_406922 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_406938 - BLOCK
      ?auto_406939 - BLOCK
      ?auto_406940 - BLOCK
      ?auto_406941 - BLOCK
      ?auto_406942 - BLOCK
      ?auto_406943 - BLOCK
      ?auto_406944 - BLOCK
      ?auto_406945 - BLOCK
      ?auto_406946 - BLOCK
      ?auto_406947 - BLOCK
      ?auto_406948 - BLOCK
      ?auto_406949 - BLOCK
      ?auto_406950 - BLOCK
      ?auto_406951 - BLOCK
      ?auto_406952 - BLOCK
    )
    :vars
    (
      ?auto_406953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_406952 ?auto_406953 ) ( ON-TABLE ?auto_406938 ) ( ON ?auto_406939 ?auto_406938 ) ( ON ?auto_406940 ?auto_406939 ) ( ON ?auto_406941 ?auto_406940 ) ( ON ?auto_406942 ?auto_406941 ) ( ON ?auto_406943 ?auto_406942 ) ( ON ?auto_406944 ?auto_406943 ) ( ON ?auto_406945 ?auto_406944 ) ( ON ?auto_406946 ?auto_406945 ) ( not ( = ?auto_406938 ?auto_406939 ) ) ( not ( = ?auto_406938 ?auto_406940 ) ) ( not ( = ?auto_406938 ?auto_406941 ) ) ( not ( = ?auto_406938 ?auto_406942 ) ) ( not ( = ?auto_406938 ?auto_406943 ) ) ( not ( = ?auto_406938 ?auto_406944 ) ) ( not ( = ?auto_406938 ?auto_406945 ) ) ( not ( = ?auto_406938 ?auto_406946 ) ) ( not ( = ?auto_406938 ?auto_406947 ) ) ( not ( = ?auto_406938 ?auto_406948 ) ) ( not ( = ?auto_406938 ?auto_406949 ) ) ( not ( = ?auto_406938 ?auto_406950 ) ) ( not ( = ?auto_406938 ?auto_406951 ) ) ( not ( = ?auto_406938 ?auto_406952 ) ) ( not ( = ?auto_406938 ?auto_406953 ) ) ( not ( = ?auto_406939 ?auto_406940 ) ) ( not ( = ?auto_406939 ?auto_406941 ) ) ( not ( = ?auto_406939 ?auto_406942 ) ) ( not ( = ?auto_406939 ?auto_406943 ) ) ( not ( = ?auto_406939 ?auto_406944 ) ) ( not ( = ?auto_406939 ?auto_406945 ) ) ( not ( = ?auto_406939 ?auto_406946 ) ) ( not ( = ?auto_406939 ?auto_406947 ) ) ( not ( = ?auto_406939 ?auto_406948 ) ) ( not ( = ?auto_406939 ?auto_406949 ) ) ( not ( = ?auto_406939 ?auto_406950 ) ) ( not ( = ?auto_406939 ?auto_406951 ) ) ( not ( = ?auto_406939 ?auto_406952 ) ) ( not ( = ?auto_406939 ?auto_406953 ) ) ( not ( = ?auto_406940 ?auto_406941 ) ) ( not ( = ?auto_406940 ?auto_406942 ) ) ( not ( = ?auto_406940 ?auto_406943 ) ) ( not ( = ?auto_406940 ?auto_406944 ) ) ( not ( = ?auto_406940 ?auto_406945 ) ) ( not ( = ?auto_406940 ?auto_406946 ) ) ( not ( = ?auto_406940 ?auto_406947 ) ) ( not ( = ?auto_406940 ?auto_406948 ) ) ( not ( = ?auto_406940 ?auto_406949 ) ) ( not ( = ?auto_406940 ?auto_406950 ) ) ( not ( = ?auto_406940 ?auto_406951 ) ) ( not ( = ?auto_406940 ?auto_406952 ) ) ( not ( = ?auto_406940 ?auto_406953 ) ) ( not ( = ?auto_406941 ?auto_406942 ) ) ( not ( = ?auto_406941 ?auto_406943 ) ) ( not ( = ?auto_406941 ?auto_406944 ) ) ( not ( = ?auto_406941 ?auto_406945 ) ) ( not ( = ?auto_406941 ?auto_406946 ) ) ( not ( = ?auto_406941 ?auto_406947 ) ) ( not ( = ?auto_406941 ?auto_406948 ) ) ( not ( = ?auto_406941 ?auto_406949 ) ) ( not ( = ?auto_406941 ?auto_406950 ) ) ( not ( = ?auto_406941 ?auto_406951 ) ) ( not ( = ?auto_406941 ?auto_406952 ) ) ( not ( = ?auto_406941 ?auto_406953 ) ) ( not ( = ?auto_406942 ?auto_406943 ) ) ( not ( = ?auto_406942 ?auto_406944 ) ) ( not ( = ?auto_406942 ?auto_406945 ) ) ( not ( = ?auto_406942 ?auto_406946 ) ) ( not ( = ?auto_406942 ?auto_406947 ) ) ( not ( = ?auto_406942 ?auto_406948 ) ) ( not ( = ?auto_406942 ?auto_406949 ) ) ( not ( = ?auto_406942 ?auto_406950 ) ) ( not ( = ?auto_406942 ?auto_406951 ) ) ( not ( = ?auto_406942 ?auto_406952 ) ) ( not ( = ?auto_406942 ?auto_406953 ) ) ( not ( = ?auto_406943 ?auto_406944 ) ) ( not ( = ?auto_406943 ?auto_406945 ) ) ( not ( = ?auto_406943 ?auto_406946 ) ) ( not ( = ?auto_406943 ?auto_406947 ) ) ( not ( = ?auto_406943 ?auto_406948 ) ) ( not ( = ?auto_406943 ?auto_406949 ) ) ( not ( = ?auto_406943 ?auto_406950 ) ) ( not ( = ?auto_406943 ?auto_406951 ) ) ( not ( = ?auto_406943 ?auto_406952 ) ) ( not ( = ?auto_406943 ?auto_406953 ) ) ( not ( = ?auto_406944 ?auto_406945 ) ) ( not ( = ?auto_406944 ?auto_406946 ) ) ( not ( = ?auto_406944 ?auto_406947 ) ) ( not ( = ?auto_406944 ?auto_406948 ) ) ( not ( = ?auto_406944 ?auto_406949 ) ) ( not ( = ?auto_406944 ?auto_406950 ) ) ( not ( = ?auto_406944 ?auto_406951 ) ) ( not ( = ?auto_406944 ?auto_406952 ) ) ( not ( = ?auto_406944 ?auto_406953 ) ) ( not ( = ?auto_406945 ?auto_406946 ) ) ( not ( = ?auto_406945 ?auto_406947 ) ) ( not ( = ?auto_406945 ?auto_406948 ) ) ( not ( = ?auto_406945 ?auto_406949 ) ) ( not ( = ?auto_406945 ?auto_406950 ) ) ( not ( = ?auto_406945 ?auto_406951 ) ) ( not ( = ?auto_406945 ?auto_406952 ) ) ( not ( = ?auto_406945 ?auto_406953 ) ) ( not ( = ?auto_406946 ?auto_406947 ) ) ( not ( = ?auto_406946 ?auto_406948 ) ) ( not ( = ?auto_406946 ?auto_406949 ) ) ( not ( = ?auto_406946 ?auto_406950 ) ) ( not ( = ?auto_406946 ?auto_406951 ) ) ( not ( = ?auto_406946 ?auto_406952 ) ) ( not ( = ?auto_406946 ?auto_406953 ) ) ( not ( = ?auto_406947 ?auto_406948 ) ) ( not ( = ?auto_406947 ?auto_406949 ) ) ( not ( = ?auto_406947 ?auto_406950 ) ) ( not ( = ?auto_406947 ?auto_406951 ) ) ( not ( = ?auto_406947 ?auto_406952 ) ) ( not ( = ?auto_406947 ?auto_406953 ) ) ( not ( = ?auto_406948 ?auto_406949 ) ) ( not ( = ?auto_406948 ?auto_406950 ) ) ( not ( = ?auto_406948 ?auto_406951 ) ) ( not ( = ?auto_406948 ?auto_406952 ) ) ( not ( = ?auto_406948 ?auto_406953 ) ) ( not ( = ?auto_406949 ?auto_406950 ) ) ( not ( = ?auto_406949 ?auto_406951 ) ) ( not ( = ?auto_406949 ?auto_406952 ) ) ( not ( = ?auto_406949 ?auto_406953 ) ) ( not ( = ?auto_406950 ?auto_406951 ) ) ( not ( = ?auto_406950 ?auto_406952 ) ) ( not ( = ?auto_406950 ?auto_406953 ) ) ( not ( = ?auto_406951 ?auto_406952 ) ) ( not ( = ?auto_406951 ?auto_406953 ) ) ( not ( = ?auto_406952 ?auto_406953 ) ) ( ON ?auto_406951 ?auto_406952 ) ( ON ?auto_406950 ?auto_406951 ) ( ON ?auto_406949 ?auto_406950 ) ( ON ?auto_406948 ?auto_406949 ) ( CLEAR ?auto_406946 ) ( ON ?auto_406947 ?auto_406948 ) ( CLEAR ?auto_406947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_406938 ?auto_406939 ?auto_406940 ?auto_406941 ?auto_406942 ?auto_406943 ?auto_406944 ?auto_406945 ?auto_406946 ?auto_406947 )
      ( MAKE-15PILE ?auto_406938 ?auto_406939 ?auto_406940 ?auto_406941 ?auto_406942 ?auto_406943 ?auto_406944 ?auto_406945 ?auto_406946 ?auto_406947 ?auto_406948 ?auto_406949 ?auto_406950 ?auto_406951 ?auto_406952 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_406969 - BLOCK
      ?auto_406970 - BLOCK
      ?auto_406971 - BLOCK
      ?auto_406972 - BLOCK
      ?auto_406973 - BLOCK
      ?auto_406974 - BLOCK
      ?auto_406975 - BLOCK
      ?auto_406976 - BLOCK
      ?auto_406977 - BLOCK
      ?auto_406978 - BLOCK
      ?auto_406979 - BLOCK
      ?auto_406980 - BLOCK
      ?auto_406981 - BLOCK
      ?auto_406982 - BLOCK
      ?auto_406983 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_406983 ) ( ON-TABLE ?auto_406969 ) ( ON ?auto_406970 ?auto_406969 ) ( ON ?auto_406971 ?auto_406970 ) ( ON ?auto_406972 ?auto_406971 ) ( ON ?auto_406973 ?auto_406972 ) ( ON ?auto_406974 ?auto_406973 ) ( ON ?auto_406975 ?auto_406974 ) ( ON ?auto_406976 ?auto_406975 ) ( ON ?auto_406977 ?auto_406976 ) ( not ( = ?auto_406969 ?auto_406970 ) ) ( not ( = ?auto_406969 ?auto_406971 ) ) ( not ( = ?auto_406969 ?auto_406972 ) ) ( not ( = ?auto_406969 ?auto_406973 ) ) ( not ( = ?auto_406969 ?auto_406974 ) ) ( not ( = ?auto_406969 ?auto_406975 ) ) ( not ( = ?auto_406969 ?auto_406976 ) ) ( not ( = ?auto_406969 ?auto_406977 ) ) ( not ( = ?auto_406969 ?auto_406978 ) ) ( not ( = ?auto_406969 ?auto_406979 ) ) ( not ( = ?auto_406969 ?auto_406980 ) ) ( not ( = ?auto_406969 ?auto_406981 ) ) ( not ( = ?auto_406969 ?auto_406982 ) ) ( not ( = ?auto_406969 ?auto_406983 ) ) ( not ( = ?auto_406970 ?auto_406971 ) ) ( not ( = ?auto_406970 ?auto_406972 ) ) ( not ( = ?auto_406970 ?auto_406973 ) ) ( not ( = ?auto_406970 ?auto_406974 ) ) ( not ( = ?auto_406970 ?auto_406975 ) ) ( not ( = ?auto_406970 ?auto_406976 ) ) ( not ( = ?auto_406970 ?auto_406977 ) ) ( not ( = ?auto_406970 ?auto_406978 ) ) ( not ( = ?auto_406970 ?auto_406979 ) ) ( not ( = ?auto_406970 ?auto_406980 ) ) ( not ( = ?auto_406970 ?auto_406981 ) ) ( not ( = ?auto_406970 ?auto_406982 ) ) ( not ( = ?auto_406970 ?auto_406983 ) ) ( not ( = ?auto_406971 ?auto_406972 ) ) ( not ( = ?auto_406971 ?auto_406973 ) ) ( not ( = ?auto_406971 ?auto_406974 ) ) ( not ( = ?auto_406971 ?auto_406975 ) ) ( not ( = ?auto_406971 ?auto_406976 ) ) ( not ( = ?auto_406971 ?auto_406977 ) ) ( not ( = ?auto_406971 ?auto_406978 ) ) ( not ( = ?auto_406971 ?auto_406979 ) ) ( not ( = ?auto_406971 ?auto_406980 ) ) ( not ( = ?auto_406971 ?auto_406981 ) ) ( not ( = ?auto_406971 ?auto_406982 ) ) ( not ( = ?auto_406971 ?auto_406983 ) ) ( not ( = ?auto_406972 ?auto_406973 ) ) ( not ( = ?auto_406972 ?auto_406974 ) ) ( not ( = ?auto_406972 ?auto_406975 ) ) ( not ( = ?auto_406972 ?auto_406976 ) ) ( not ( = ?auto_406972 ?auto_406977 ) ) ( not ( = ?auto_406972 ?auto_406978 ) ) ( not ( = ?auto_406972 ?auto_406979 ) ) ( not ( = ?auto_406972 ?auto_406980 ) ) ( not ( = ?auto_406972 ?auto_406981 ) ) ( not ( = ?auto_406972 ?auto_406982 ) ) ( not ( = ?auto_406972 ?auto_406983 ) ) ( not ( = ?auto_406973 ?auto_406974 ) ) ( not ( = ?auto_406973 ?auto_406975 ) ) ( not ( = ?auto_406973 ?auto_406976 ) ) ( not ( = ?auto_406973 ?auto_406977 ) ) ( not ( = ?auto_406973 ?auto_406978 ) ) ( not ( = ?auto_406973 ?auto_406979 ) ) ( not ( = ?auto_406973 ?auto_406980 ) ) ( not ( = ?auto_406973 ?auto_406981 ) ) ( not ( = ?auto_406973 ?auto_406982 ) ) ( not ( = ?auto_406973 ?auto_406983 ) ) ( not ( = ?auto_406974 ?auto_406975 ) ) ( not ( = ?auto_406974 ?auto_406976 ) ) ( not ( = ?auto_406974 ?auto_406977 ) ) ( not ( = ?auto_406974 ?auto_406978 ) ) ( not ( = ?auto_406974 ?auto_406979 ) ) ( not ( = ?auto_406974 ?auto_406980 ) ) ( not ( = ?auto_406974 ?auto_406981 ) ) ( not ( = ?auto_406974 ?auto_406982 ) ) ( not ( = ?auto_406974 ?auto_406983 ) ) ( not ( = ?auto_406975 ?auto_406976 ) ) ( not ( = ?auto_406975 ?auto_406977 ) ) ( not ( = ?auto_406975 ?auto_406978 ) ) ( not ( = ?auto_406975 ?auto_406979 ) ) ( not ( = ?auto_406975 ?auto_406980 ) ) ( not ( = ?auto_406975 ?auto_406981 ) ) ( not ( = ?auto_406975 ?auto_406982 ) ) ( not ( = ?auto_406975 ?auto_406983 ) ) ( not ( = ?auto_406976 ?auto_406977 ) ) ( not ( = ?auto_406976 ?auto_406978 ) ) ( not ( = ?auto_406976 ?auto_406979 ) ) ( not ( = ?auto_406976 ?auto_406980 ) ) ( not ( = ?auto_406976 ?auto_406981 ) ) ( not ( = ?auto_406976 ?auto_406982 ) ) ( not ( = ?auto_406976 ?auto_406983 ) ) ( not ( = ?auto_406977 ?auto_406978 ) ) ( not ( = ?auto_406977 ?auto_406979 ) ) ( not ( = ?auto_406977 ?auto_406980 ) ) ( not ( = ?auto_406977 ?auto_406981 ) ) ( not ( = ?auto_406977 ?auto_406982 ) ) ( not ( = ?auto_406977 ?auto_406983 ) ) ( not ( = ?auto_406978 ?auto_406979 ) ) ( not ( = ?auto_406978 ?auto_406980 ) ) ( not ( = ?auto_406978 ?auto_406981 ) ) ( not ( = ?auto_406978 ?auto_406982 ) ) ( not ( = ?auto_406978 ?auto_406983 ) ) ( not ( = ?auto_406979 ?auto_406980 ) ) ( not ( = ?auto_406979 ?auto_406981 ) ) ( not ( = ?auto_406979 ?auto_406982 ) ) ( not ( = ?auto_406979 ?auto_406983 ) ) ( not ( = ?auto_406980 ?auto_406981 ) ) ( not ( = ?auto_406980 ?auto_406982 ) ) ( not ( = ?auto_406980 ?auto_406983 ) ) ( not ( = ?auto_406981 ?auto_406982 ) ) ( not ( = ?auto_406981 ?auto_406983 ) ) ( not ( = ?auto_406982 ?auto_406983 ) ) ( ON ?auto_406982 ?auto_406983 ) ( ON ?auto_406981 ?auto_406982 ) ( ON ?auto_406980 ?auto_406981 ) ( ON ?auto_406979 ?auto_406980 ) ( CLEAR ?auto_406977 ) ( ON ?auto_406978 ?auto_406979 ) ( CLEAR ?auto_406978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_406969 ?auto_406970 ?auto_406971 ?auto_406972 ?auto_406973 ?auto_406974 ?auto_406975 ?auto_406976 ?auto_406977 ?auto_406978 )
      ( MAKE-15PILE ?auto_406969 ?auto_406970 ?auto_406971 ?auto_406972 ?auto_406973 ?auto_406974 ?auto_406975 ?auto_406976 ?auto_406977 ?auto_406978 ?auto_406979 ?auto_406980 ?auto_406981 ?auto_406982 ?auto_406983 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_406999 - BLOCK
      ?auto_407000 - BLOCK
      ?auto_407001 - BLOCK
      ?auto_407002 - BLOCK
      ?auto_407003 - BLOCK
      ?auto_407004 - BLOCK
      ?auto_407005 - BLOCK
      ?auto_407006 - BLOCK
      ?auto_407007 - BLOCK
      ?auto_407008 - BLOCK
      ?auto_407009 - BLOCK
      ?auto_407010 - BLOCK
      ?auto_407011 - BLOCK
      ?auto_407012 - BLOCK
      ?auto_407013 - BLOCK
    )
    :vars
    (
      ?auto_407014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407013 ?auto_407014 ) ( ON-TABLE ?auto_406999 ) ( ON ?auto_407000 ?auto_406999 ) ( ON ?auto_407001 ?auto_407000 ) ( ON ?auto_407002 ?auto_407001 ) ( ON ?auto_407003 ?auto_407002 ) ( ON ?auto_407004 ?auto_407003 ) ( ON ?auto_407005 ?auto_407004 ) ( ON ?auto_407006 ?auto_407005 ) ( not ( = ?auto_406999 ?auto_407000 ) ) ( not ( = ?auto_406999 ?auto_407001 ) ) ( not ( = ?auto_406999 ?auto_407002 ) ) ( not ( = ?auto_406999 ?auto_407003 ) ) ( not ( = ?auto_406999 ?auto_407004 ) ) ( not ( = ?auto_406999 ?auto_407005 ) ) ( not ( = ?auto_406999 ?auto_407006 ) ) ( not ( = ?auto_406999 ?auto_407007 ) ) ( not ( = ?auto_406999 ?auto_407008 ) ) ( not ( = ?auto_406999 ?auto_407009 ) ) ( not ( = ?auto_406999 ?auto_407010 ) ) ( not ( = ?auto_406999 ?auto_407011 ) ) ( not ( = ?auto_406999 ?auto_407012 ) ) ( not ( = ?auto_406999 ?auto_407013 ) ) ( not ( = ?auto_406999 ?auto_407014 ) ) ( not ( = ?auto_407000 ?auto_407001 ) ) ( not ( = ?auto_407000 ?auto_407002 ) ) ( not ( = ?auto_407000 ?auto_407003 ) ) ( not ( = ?auto_407000 ?auto_407004 ) ) ( not ( = ?auto_407000 ?auto_407005 ) ) ( not ( = ?auto_407000 ?auto_407006 ) ) ( not ( = ?auto_407000 ?auto_407007 ) ) ( not ( = ?auto_407000 ?auto_407008 ) ) ( not ( = ?auto_407000 ?auto_407009 ) ) ( not ( = ?auto_407000 ?auto_407010 ) ) ( not ( = ?auto_407000 ?auto_407011 ) ) ( not ( = ?auto_407000 ?auto_407012 ) ) ( not ( = ?auto_407000 ?auto_407013 ) ) ( not ( = ?auto_407000 ?auto_407014 ) ) ( not ( = ?auto_407001 ?auto_407002 ) ) ( not ( = ?auto_407001 ?auto_407003 ) ) ( not ( = ?auto_407001 ?auto_407004 ) ) ( not ( = ?auto_407001 ?auto_407005 ) ) ( not ( = ?auto_407001 ?auto_407006 ) ) ( not ( = ?auto_407001 ?auto_407007 ) ) ( not ( = ?auto_407001 ?auto_407008 ) ) ( not ( = ?auto_407001 ?auto_407009 ) ) ( not ( = ?auto_407001 ?auto_407010 ) ) ( not ( = ?auto_407001 ?auto_407011 ) ) ( not ( = ?auto_407001 ?auto_407012 ) ) ( not ( = ?auto_407001 ?auto_407013 ) ) ( not ( = ?auto_407001 ?auto_407014 ) ) ( not ( = ?auto_407002 ?auto_407003 ) ) ( not ( = ?auto_407002 ?auto_407004 ) ) ( not ( = ?auto_407002 ?auto_407005 ) ) ( not ( = ?auto_407002 ?auto_407006 ) ) ( not ( = ?auto_407002 ?auto_407007 ) ) ( not ( = ?auto_407002 ?auto_407008 ) ) ( not ( = ?auto_407002 ?auto_407009 ) ) ( not ( = ?auto_407002 ?auto_407010 ) ) ( not ( = ?auto_407002 ?auto_407011 ) ) ( not ( = ?auto_407002 ?auto_407012 ) ) ( not ( = ?auto_407002 ?auto_407013 ) ) ( not ( = ?auto_407002 ?auto_407014 ) ) ( not ( = ?auto_407003 ?auto_407004 ) ) ( not ( = ?auto_407003 ?auto_407005 ) ) ( not ( = ?auto_407003 ?auto_407006 ) ) ( not ( = ?auto_407003 ?auto_407007 ) ) ( not ( = ?auto_407003 ?auto_407008 ) ) ( not ( = ?auto_407003 ?auto_407009 ) ) ( not ( = ?auto_407003 ?auto_407010 ) ) ( not ( = ?auto_407003 ?auto_407011 ) ) ( not ( = ?auto_407003 ?auto_407012 ) ) ( not ( = ?auto_407003 ?auto_407013 ) ) ( not ( = ?auto_407003 ?auto_407014 ) ) ( not ( = ?auto_407004 ?auto_407005 ) ) ( not ( = ?auto_407004 ?auto_407006 ) ) ( not ( = ?auto_407004 ?auto_407007 ) ) ( not ( = ?auto_407004 ?auto_407008 ) ) ( not ( = ?auto_407004 ?auto_407009 ) ) ( not ( = ?auto_407004 ?auto_407010 ) ) ( not ( = ?auto_407004 ?auto_407011 ) ) ( not ( = ?auto_407004 ?auto_407012 ) ) ( not ( = ?auto_407004 ?auto_407013 ) ) ( not ( = ?auto_407004 ?auto_407014 ) ) ( not ( = ?auto_407005 ?auto_407006 ) ) ( not ( = ?auto_407005 ?auto_407007 ) ) ( not ( = ?auto_407005 ?auto_407008 ) ) ( not ( = ?auto_407005 ?auto_407009 ) ) ( not ( = ?auto_407005 ?auto_407010 ) ) ( not ( = ?auto_407005 ?auto_407011 ) ) ( not ( = ?auto_407005 ?auto_407012 ) ) ( not ( = ?auto_407005 ?auto_407013 ) ) ( not ( = ?auto_407005 ?auto_407014 ) ) ( not ( = ?auto_407006 ?auto_407007 ) ) ( not ( = ?auto_407006 ?auto_407008 ) ) ( not ( = ?auto_407006 ?auto_407009 ) ) ( not ( = ?auto_407006 ?auto_407010 ) ) ( not ( = ?auto_407006 ?auto_407011 ) ) ( not ( = ?auto_407006 ?auto_407012 ) ) ( not ( = ?auto_407006 ?auto_407013 ) ) ( not ( = ?auto_407006 ?auto_407014 ) ) ( not ( = ?auto_407007 ?auto_407008 ) ) ( not ( = ?auto_407007 ?auto_407009 ) ) ( not ( = ?auto_407007 ?auto_407010 ) ) ( not ( = ?auto_407007 ?auto_407011 ) ) ( not ( = ?auto_407007 ?auto_407012 ) ) ( not ( = ?auto_407007 ?auto_407013 ) ) ( not ( = ?auto_407007 ?auto_407014 ) ) ( not ( = ?auto_407008 ?auto_407009 ) ) ( not ( = ?auto_407008 ?auto_407010 ) ) ( not ( = ?auto_407008 ?auto_407011 ) ) ( not ( = ?auto_407008 ?auto_407012 ) ) ( not ( = ?auto_407008 ?auto_407013 ) ) ( not ( = ?auto_407008 ?auto_407014 ) ) ( not ( = ?auto_407009 ?auto_407010 ) ) ( not ( = ?auto_407009 ?auto_407011 ) ) ( not ( = ?auto_407009 ?auto_407012 ) ) ( not ( = ?auto_407009 ?auto_407013 ) ) ( not ( = ?auto_407009 ?auto_407014 ) ) ( not ( = ?auto_407010 ?auto_407011 ) ) ( not ( = ?auto_407010 ?auto_407012 ) ) ( not ( = ?auto_407010 ?auto_407013 ) ) ( not ( = ?auto_407010 ?auto_407014 ) ) ( not ( = ?auto_407011 ?auto_407012 ) ) ( not ( = ?auto_407011 ?auto_407013 ) ) ( not ( = ?auto_407011 ?auto_407014 ) ) ( not ( = ?auto_407012 ?auto_407013 ) ) ( not ( = ?auto_407012 ?auto_407014 ) ) ( not ( = ?auto_407013 ?auto_407014 ) ) ( ON ?auto_407012 ?auto_407013 ) ( ON ?auto_407011 ?auto_407012 ) ( ON ?auto_407010 ?auto_407011 ) ( ON ?auto_407009 ?auto_407010 ) ( ON ?auto_407008 ?auto_407009 ) ( CLEAR ?auto_407006 ) ( ON ?auto_407007 ?auto_407008 ) ( CLEAR ?auto_407007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_406999 ?auto_407000 ?auto_407001 ?auto_407002 ?auto_407003 ?auto_407004 ?auto_407005 ?auto_407006 ?auto_407007 )
      ( MAKE-15PILE ?auto_406999 ?auto_407000 ?auto_407001 ?auto_407002 ?auto_407003 ?auto_407004 ?auto_407005 ?auto_407006 ?auto_407007 ?auto_407008 ?auto_407009 ?auto_407010 ?auto_407011 ?auto_407012 ?auto_407013 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_407030 - BLOCK
      ?auto_407031 - BLOCK
      ?auto_407032 - BLOCK
      ?auto_407033 - BLOCK
      ?auto_407034 - BLOCK
      ?auto_407035 - BLOCK
      ?auto_407036 - BLOCK
      ?auto_407037 - BLOCK
      ?auto_407038 - BLOCK
      ?auto_407039 - BLOCK
      ?auto_407040 - BLOCK
      ?auto_407041 - BLOCK
      ?auto_407042 - BLOCK
      ?auto_407043 - BLOCK
      ?auto_407044 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_407044 ) ( ON-TABLE ?auto_407030 ) ( ON ?auto_407031 ?auto_407030 ) ( ON ?auto_407032 ?auto_407031 ) ( ON ?auto_407033 ?auto_407032 ) ( ON ?auto_407034 ?auto_407033 ) ( ON ?auto_407035 ?auto_407034 ) ( ON ?auto_407036 ?auto_407035 ) ( ON ?auto_407037 ?auto_407036 ) ( not ( = ?auto_407030 ?auto_407031 ) ) ( not ( = ?auto_407030 ?auto_407032 ) ) ( not ( = ?auto_407030 ?auto_407033 ) ) ( not ( = ?auto_407030 ?auto_407034 ) ) ( not ( = ?auto_407030 ?auto_407035 ) ) ( not ( = ?auto_407030 ?auto_407036 ) ) ( not ( = ?auto_407030 ?auto_407037 ) ) ( not ( = ?auto_407030 ?auto_407038 ) ) ( not ( = ?auto_407030 ?auto_407039 ) ) ( not ( = ?auto_407030 ?auto_407040 ) ) ( not ( = ?auto_407030 ?auto_407041 ) ) ( not ( = ?auto_407030 ?auto_407042 ) ) ( not ( = ?auto_407030 ?auto_407043 ) ) ( not ( = ?auto_407030 ?auto_407044 ) ) ( not ( = ?auto_407031 ?auto_407032 ) ) ( not ( = ?auto_407031 ?auto_407033 ) ) ( not ( = ?auto_407031 ?auto_407034 ) ) ( not ( = ?auto_407031 ?auto_407035 ) ) ( not ( = ?auto_407031 ?auto_407036 ) ) ( not ( = ?auto_407031 ?auto_407037 ) ) ( not ( = ?auto_407031 ?auto_407038 ) ) ( not ( = ?auto_407031 ?auto_407039 ) ) ( not ( = ?auto_407031 ?auto_407040 ) ) ( not ( = ?auto_407031 ?auto_407041 ) ) ( not ( = ?auto_407031 ?auto_407042 ) ) ( not ( = ?auto_407031 ?auto_407043 ) ) ( not ( = ?auto_407031 ?auto_407044 ) ) ( not ( = ?auto_407032 ?auto_407033 ) ) ( not ( = ?auto_407032 ?auto_407034 ) ) ( not ( = ?auto_407032 ?auto_407035 ) ) ( not ( = ?auto_407032 ?auto_407036 ) ) ( not ( = ?auto_407032 ?auto_407037 ) ) ( not ( = ?auto_407032 ?auto_407038 ) ) ( not ( = ?auto_407032 ?auto_407039 ) ) ( not ( = ?auto_407032 ?auto_407040 ) ) ( not ( = ?auto_407032 ?auto_407041 ) ) ( not ( = ?auto_407032 ?auto_407042 ) ) ( not ( = ?auto_407032 ?auto_407043 ) ) ( not ( = ?auto_407032 ?auto_407044 ) ) ( not ( = ?auto_407033 ?auto_407034 ) ) ( not ( = ?auto_407033 ?auto_407035 ) ) ( not ( = ?auto_407033 ?auto_407036 ) ) ( not ( = ?auto_407033 ?auto_407037 ) ) ( not ( = ?auto_407033 ?auto_407038 ) ) ( not ( = ?auto_407033 ?auto_407039 ) ) ( not ( = ?auto_407033 ?auto_407040 ) ) ( not ( = ?auto_407033 ?auto_407041 ) ) ( not ( = ?auto_407033 ?auto_407042 ) ) ( not ( = ?auto_407033 ?auto_407043 ) ) ( not ( = ?auto_407033 ?auto_407044 ) ) ( not ( = ?auto_407034 ?auto_407035 ) ) ( not ( = ?auto_407034 ?auto_407036 ) ) ( not ( = ?auto_407034 ?auto_407037 ) ) ( not ( = ?auto_407034 ?auto_407038 ) ) ( not ( = ?auto_407034 ?auto_407039 ) ) ( not ( = ?auto_407034 ?auto_407040 ) ) ( not ( = ?auto_407034 ?auto_407041 ) ) ( not ( = ?auto_407034 ?auto_407042 ) ) ( not ( = ?auto_407034 ?auto_407043 ) ) ( not ( = ?auto_407034 ?auto_407044 ) ) ( not ( = ?auto_407035 ?auto_407036 ) ) ( not ( = ?auto_407035 ?auto_407037 ) ) ( not ( = ?auto_407035 ?auto_407038 ) ) ( not ( = ?auto_407035 ?auto_407039 ) ) ( not ( = ?auto_407035 ?auto_407040 ) ) ( not ( = ?auto_407035 ?auto_407041 ) ) ( not ( = ?auto_407035 ?auto_407042 ) ) ( not ( = ?auto_407035 ?auto_407043 ) ) ( not ( = ?auto_407035 ?auto_407044 ) ) ( not ( = ?auto_407036 ?auto_407037 ) ) ( not ( = ?auto_407036 ?auto_407038 ) ) ( not ( = ?auto_407036 ?auto_407039 ) ) ( not ( = ?auto_407036 ?auto_407040 ) ) ( not ( = ?auto_407036 ?auto_407041 ) ) ( not ( = ?auto_407036 ?auto_407042 ) ) ( not ( = ?auto_407036 ?auto_407043 ) ) ( not ( = ?auto_407036 ?auto_407044 ) ) ( not ( = ?auto_407037 ?auto_407038 ) ) ( not ( = ?auto_407037 ?auto_407039 ) ) ( not ( = ?auto_407037 ?auto_407040 ) ) ( not ( = ?auto_407037 ?auto_407041 ) ) ( not ( = ?auto_407037 ?auto_407042 ) ) ( not ( = ?auto_407037 ?auto_407043 ) ) ( not ( = ?auto_407037 ?auto_407044 ) ) ( not ( = ?auto_407038 ?auto_407039 ) ) ( not ( = ?auto_407038 ?auto_407040 ) ) ( not ( = ?auto_407038 ?auto_407041 ) ) ( not ( = ?auto_407038 ?auto_407042 ) ) ( not ( = ?auto_407038 ?auto_407043 ) ) ( not ( = ?auto_407038 ?auto_407044 ) ) ( not ( = ?auto_407039 ?auto_407040 ) ) ( not ( = ?auto_407039 ?auto_407041 ) ) ( not ( = ?auto_407039 ?auto_407042 ) ) ( not ( = ?auto_407039 ?auto_407043 ) ) ( not ( = ?auto_407039 ?auto_407044 ) ) ( not ( = ?auto_407040 ?auto_407041 ) ) ( not ( = ?auto_407040 ?auto_407042 ) ) ( not ( = ?auto_407040 ?auto_407043 ) ) ( not ( = ?auto_407040 ?auto_407044 ) ) ( not ( = ?auto_407041 ?auto_407042 ) ) ( not ( = ?auto_407041 ?auto_407043 ) ) ( not ( = ?auto_407041 ?auto_407044 ) ) ( not ( = ?auto_407042 ?auto_407043 ) ) ( not ( = ?auto_407042 ?auto_407044 ) ) ( not ( = ?auto_407043 ?auto_407044 ) ) ( ON ?auto_407043 ?auto_407044 ) ( ON ?auto_407042 ?auto_407043 ) ( ON ?auto_407041 ?auto_407042 ) ( ON ?auto_407040 ?auto_407041 ) ( ON ?auto_407039 ?auto_407040 ) ( CLEAR ?auto_407037 ) ( ON ?auto_407038 ?auto_407039 ) ( CLEAR ?auto_407038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_407030 ?auto_407031 ?auto_407032 ?auto_407033 ?auto_407034 ?auto_407035 ?auto_407036 ?auto_407037 ?auto_407038 )
      ( MAKE-15PILE ?auto_407030 ?auto_407031 ?auto_407032 ?auto_407033 ?auto_407034 ?auto_407035 ?auto_407036 ?auto_407037 ?auto_407038 ?auto_407039 ?auto_407040 ?auto_407041 ?auto_407042 ?auto_407043 ?auto_407044 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_407060 - BLOCK
      ?auto_407061 - BLOCK
      ?auto_407062 - BLOCK
      ?auto_407063 - BLOCK
      ?auto_407064 - BLOCK
      ?auto_407065 - BLOCK
      ?auto_407066 - BLOCK
      ?auto_407067 - BLOCK
      ?auto_407068 - BLOCK
      ?auto_407069 - BLOCK
      ?auto_407070 - BLOCK
      ?auto_407071 - BLOCK
      ?auto_407072 - BLOCK
      ?auto_407073 - BLOCK
      ?auto_407074 - BLOCK
    )
    :vars
    (
      ?auto_407075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407074 ?auto_407075 ) ( ON-TABLE ?auto_407060 ) ( ON ?auto_407061 ?auto_407060 ) ( ON ?auto_407062 ?auto_407061 ) ( ON ?auto_407063 ?auto_407062 ) ( ON ?auto_407064 ?auto_407063 ) ( ON ?auto_407065 ?auto_407064 ) ( ON ?auto_407066 ?auto_407065 ) ( not ( = ?auto_407060 ?auto_407061 ) ) ( not ( = ?auto_407060 ?auto_407062 ) ) ( not ( = ?auto_407060 ?auto_407063 ) ) ( not ( = ?auto_407060 ?auto_407064 ) ) ( not ( = ?auto_407060 ?auto_407065 ) ) ( not ( = ?auto_407060 ?auto_407066 ) ) ( not ( = ?auto_407060 ?auto_407067 ) ) ( not ( = ?auto_407060 ?auto_407068 ) ) ( not ( = ?auto_407060 ?auto_407069 ) ) ( not ( = ?auto_407060 ?auto_407070 ) ) ( not ( = ?auto_407060 ?auto_407071 ) ) ( not ( = ?auto_407060 ?auto_407072 ) ) ( not ( = ?auto_407060 ?auto_407073 ) ) ( not ( = ?auto_407060 ?auto_407074 ) ) ( not ( = ?auto_407060 ?auto_407075 ) ) ( not ( = ?auto_407061 ?auto_407062 ) ) ( not ( = ?auto_407061 ?auto_407063 ) ) ( not ( = ?auto_407061 ?auto_407064 ) ) ( not ( = ?auto_407061 ?auto_407065 ) ) ( not ( = ?auto_407061 ?auto_407066 ) ) ( not ( = ?auto_407061 ?auto_407067 ) ) ( not ( = ?auto_407061 ?auto_407068 ) ) ( not ( = ?auto_407061 ?auto_407069 ) ) ( not ( = ?auto_407061 ?auto_407070 ) ) ( not ( = ?auto_407061 ?auto_407071 ) ) ( not ( = ?auto_407061 ?auto_407072 ) ) ( not ( = ?auto_407061 ?auto_407073 ) ) ( not ( = ?auto_407061 ?auto_407074 ) ) ( not ( = ?auto_407061 ?auto_407075 ) ) ( not ( = ?auto_407062 ?auto_407063 ) ) ( not ( = ?auto_407062 ?auto_407064 ) ) ( not ( = ?auto_407062 ?auto_407065 ) ) ( not ( = ?auto_407062 ?auto_407066 ) ) ( not ( = ?auto_407062 ?auto_407067 ) ) ( not ( = ?auto_407062 ?auto_407068 ) ) ( not ( = ?auto_407062 ?auto_407069 ) ) ( not ( = ?auto_407062 ?auto_407070 ) ) ( not ( = ?auto_407062 ?auto_407071 ) ) ( not ( = ?auto_407062 ?auto_407072 ) ) ( not ( = ?auto_407062 ?auto_407073 ) ) ( not ( = ?auto_407062 ?auto_407074 ) ) ( not ( = ?auto_407062 ?auto_407075 ) ) ( not ( = ?auto_407063 ?auto_407064 ) ) ( not ( = ?auto_407063 ?auto_407065 ) ) ( not ( = ?auto_407063 ?auto_407066 ) ) ( not ( = ?auto_407063 ?auto_407067 ) ) ( not ( = ?auto_407063 ?auto_407068 ) ) ( not ( = ?auto_407063 ?auto_407069 ) ) ( not ( = ?auto_407063 ?auto_407070 ) ) ( not ( = ?auto_407063 ?auto_407071 ) ) ( not ( = ?auto_407063 ?auto_407072 ) ) ( not ( = ?auto_407063 ?auto_407073 ) ) ( not ( = ?auto_407063 ?auto_407074 ) ) ( not ( = ?auto_407063 ?auto_407075 ) ) ( not ( = ?auto_407064 ?auto_407065 ) ) ( not ( = ?auto_407064 ?auto_407066 ) ) ( not ( = ?auto_407064 ?auto_407067 ) ) ( not ( = ?auto_407064 ?auto_407068 ) ) ( not ( = ?auto_407064 ?auto_407069 ) ) ( not ( = ?auto_407064 ?auto_407070 ) ) ( not ( = ?auto_407064 ?auto_407071 ) ) ( not ( = ?auto_407064 ?auto_407072 ) ) ( not ( = ?auto_407064 ?auto_407073 ) ) ( not ( = ?auto_407064 ?auto_407074 ) ) ( not ( = ?auto_407064 ?auto_407075 ) ) ( not ( = ?auto_407065 ?auto_407066 ) ) ( not ( = ?auto_407065 ?auto_407067 ) ) ( not ( = ?auto_407065 ?auto_407068 ) ) ( not ( = ?auto_407065 ?auto_407069 ) ) ( not ( = ?auto_407065 ?auto_407070 ) ) ( not ( = ?auto_407065 ?auto_407071 ) ) ( not ( = ?auto_407065 ?auto_407072 ) ) ( not ( = ?auto_407065 ?auto_407073 ) ) ( not ( = ?auto_407065 ?auto_407074 ) ) ( not ( = ?auto_407065 ?auto_407075 ) ) ( not ( = ?auto_407066 ?auto_407067 ) ) ( not ( = ?auto_407066 ?auto_407068 ) ) ( not ( = ?auto_407066 ?auto_407069 ) ) ( not ( = ?auto_407066 ?auto_407070 ) ) ( not ( = ?auto_407066 ?auto_407071 ) ) ( not ( = ?auto_407066 ?auto_407072 ) ) ( not ( = ?auto_407066 ?auto_407073 ) ) ( not ( = ?auto_407066 ?auto_407074 ) ) ( not ( = ?auto_407066 ?auto_407075 ) ) ( not ( = ?auto_407067 ?auto_407068 ) ) ( not ( = ?auto_407067 ?auto_407069 ) ) ( not ( = ?auto_407067 ?auto_407070 ) ) ( not ( = ?auto_407067 ?auto_407071 ) ) ( not ( = ?auto_407067 ?auto_407072 ) ) ( not ( = ?auto_407067 ?auto_407073 ) ) ( not ( = ?auto_407067 ?auto_407074 ) ) ( not ( = ?auto_407067 ?auto_407075 ) ) ( not ( = ?auto_407068 ?auto_407069 ) ) ( not ( = ?auto_407068 ?auto_407070 ) ) ( not ( = ?auto_407068 ?auto_407071 ) ) ( not ( = ?auto_407068 ?auto_407072 ) ) ( not ( = ?auto_407068 ?auto_407073 ) ) ( not ( = ?auto_407068 ?auto_407074 ) ) ( not ( = ?auto_407068 ?auto_407075 ) ) ( not ( = ?auto_407069 ?auto_407070 ) ) ( not ( = ?auto_407069 ?auto_407071 ) ) ( not ( = ?auto_407069 ?auto_407072 ) ) ( not ( = ?auto_407069 ?auto_407073 ) ) ( not ( = ?auto_407069 ?auto_407074 ) ) ( not ( = ?auto_407069 ?auto_407075 ) ) ( not ( = ?auto_407070 ?auto_407071 ) ) ( not ( = ?auto_407070 ?auto_407072 ) ) ( not ( = ?auto_407070 ?auto_407073 ) ) ( not ( = ?auto_407070 ?auto_407074 ) ) ( not ( = ?auto_407070 ?auto_407075 ) ) ( not ( = ?auto_407071 ?auto_407072 ) ) ( not ( = ?auto_407071 ?auto_407073 ) ) ( not ( = ?auto_407071 ?auto_407074 ) ) ( not ( = ?auto_407071 ?auto_407075 ) ) ( not ( = ?auto_407072 ?auto_407073 ) ) ( not ( = ?auto_407072 ?auto_407074 ) ) ( not ( = ?auto_407072 ?auto_407075 ) ) ( not ( = ?auto_407073 ?auto_407074 ) ) ( not ( = ?auto_407073 ?auto_407075 ) ) ( not ( = ?auto_407074 ?auto_407075 ) ) ( ON ?auto_407073 ?auto_407074 ) ( ON ?auto_407072 ?auto_407073 ) ( ON ?auto_407071 ?auto_407072 ) ( ON ?auto_407070 ?auto_407071 ) ( ON ?auto_407069 ?auto_407070 ) ( ON ?auto_407068 ?auto_407069 ) ( CLEAR ?auto_407066 ) ( ON ?auto_407067 ?auto_407068 ) ( CLEAR ?auto_407067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_407060 ?auto_407061 ?auto_407062 ?auto_407063 ?auto_407064 ?auto_407065 ?auto_407066 ?auto_407067 )
      ( MAKE-15PILE ?auto_407060 ?auto_407061 ?auto_407062 ?auto_407063 ?auto_407064 ?auto_407065 ?auto_407066 ?auto_407067 ?auto_407068 ?auto_407069 ?auto_407070 ?auto_407071 ?auto_407072 ?auto_407073 ?auto_407074 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_407091 - BLOCK
      ?auto_407092 - BLOCK
      ?auto_407093 - BLOCK
      ?auto_407094 - BLOCK
      ?auto_407095 - BLOCK
      ?auto_407096 - BLOCK
      ?auto_407097 - BLOCK
      ?auto_407098 - BLOCK
      ?auto_407099 - BLOCK
      ?auto_407100 - BLOCK
      ?auto_407101 - BLOCK
      ?auto_407102 - BLOCK
      ?auto_407103 - BLOCK
      ?auto_407104 - BLOCK
      ?auto_407105 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_407105 ) ( ON-TABLE ?auto_407091 ) ( ON ?auto_407092 ?auto_407091 ) ( ON ?auto_407093 ?auto_407092 ) ( ON ?auto_407094 ?auto_407093 ) ( ON ?auto_407095 ?auto_407094 ) ( ON ?auto_407096 ?auto_407095 ) ( ON ?auto_407097 ?auto_407096 ) ( not ( = ?auto_407091 ?auto_407092 ) ) ( not ( = ?auto_407091 ?auto_407093 ) ) ( not ( = ?auto_407091 ?auto_407094 ) ) ( not ( = ?auto_407091 ?auto_407095 ) ) ( not ( = ?auto_407091 ?auto_407096 ) ) ( not ( = ?auto_407091 ?auto_407097 ) ) ( not ( = ?auto_407091 ?auto_407098 ) ) ( not ( = ?auto_407091 ?auto_407099 ) ) ( not ( = ?auto_407091 ?auto_407100 ) ) ( not ( = ?auto_407091 ?auto_407101 ) ) ( not ( = ?auto_407091 ?auto_407102 ) ) ( not ( = ?auto_407091 ?auto_407103 ) ) ( not ( = ?auto_407091 ?auto_407104 ) ) ( not ( = ?auto_407091 ?auto_407105 ) ) ( not ( = ?auto_407092 ?auto_407093 ) ) ( not ( = ?auto_407092 ?auto_407094 ) ) ( not ( = ?auto_407092 ?auto_407095 ) ) ( not ( = ?auto_407092 ?auto_407096 ) ) ( not ( = ?auto_407092 ?auto_407097 ) ) ( not ( = ?auto_407092 ?auto_407098 ) ) ( not ( = ?auto_407092 ?auto_407099 ) ) ( not ( = ?auto_407092 ?auto_407100 ) ) ( not ( = ?auto_407092 ?auto_407101 ) ) ( not ( = ?auto_407092 ?auto_407102 ) ) ( not ( = ?auto_407092 ?auto_407103 ) ) ( not ( = ?auto_407092 ?auto_407104 ) ) ( not ( = ?auto_407092 ?auto_407105 ) ) ( not ( = ?auto_407093 ?auto_407094 ) ) ( not ( = ?auto_407093 ?auto_407095 ) ) ( not ( = ?auto_407093 ?auto_407096 ) ) ( not ( = ?auto_407093 ?auto_407097 ) ) ( not ( = ?auto_407093 ?auto_407098 ) ) ( not ( = ?auto_407093 ?auto_407099 ) ) ( not ( = ?auto_407093 ?auto_407100 ) ) ( not ( = ?auto_407093 ?auto_407101 ) ) ( not ( = ?auto_407093 ?auto_407102 ) ) ( not ( = ?auto_407093 ?auto_407103 ) ) ( not ( = ?auto_407093 ?auto_407104 ) ) ( not ( = ?auto_407093 ?auto_407105 ) ) ( not ( = ?auto_407094 ?auto_407095 ) ) ( not ( = ?auto_407094 ?auto_407096 ) ) ( not ( = ?auto_407094 ?auto_407097 ) ) ( not ( = ?auto_407094 ?auto_407098 ) ) ( not ( = ?auto_407094 ?auto_407099 ) ) ( not ( = ?auto_407094 ?auto_407100 ) ) ( not ( = ?auto_407094 ?auto_407101 ) ) ( not ( = ?auto_407094 ?auto_407102 ) ) ( not ( = ?auto_407094 ?auto_407103 ) ) ( not ( = ?auto_407094 ?auto_407104 ) ) ( not ( = ?auto_407094 ?auto_407105 ) ) ( not ( = ?auto_407095 ?auto_407096 ) ) ( not ( = ?auto_407095 ?auto_407097 ) ) ( not ( = ?auto_407095 ?auto_407098 ) ) ( not ( = ?auto_407095 ?auto_407099 ) ) ( not ( = ?auto_407095 ?auto_407100 ) ) ( not ( = ?auto_407095 ?auto_407101 ) ) ( not ( = ?auto_407095 ?auto_407102 ) ) ( not ( = ?auto_407095 ?auto_407103 ) ) ( not ( = ?auto_407095 ?auto_407104 ) ) ( not ( = ?auto_407095 ?auto_407105 ) ) ( not ( = ?auto_407096 ?auto_407097 ) ) ( not ( = ?auto_407096 ?auto_407098 ) ) ( not ( = ?auto_407096 ?auto_407099 ) ) ( not ( = ?auto_407096 ?auto_407100 ) ) ( not ( = ?auto_407096 ?auto_407101 ) ) ( not ( = ?auto_407096 ?auto_407102 ) ) ( not ( = ?auto_407096 ?auto_407103 ) ) ( not ( = ?auto_407096 ?auto_407104 ) ) ( not ( = ?auto_407096 ?auto_407105 ) ) ( not ( = ?auto_407097 ?auto_407098 ) ) ( not ( = ?auto_407097 ?auto_407099 ) ) ( not ( = ?auto_407097 ?auto_407100 ) ) ( not ( = ?auto_407097 ?auto_407101 ) ) ( not ( = ?auto_407097 ?auto_407102 ) ) ( not ( = ?auto_407097 ?auto_407103 ) ) ( not ( = ?auto_407097 ?auto_407104 ) ) ( not ( = ?auto_407097 ?auto_407105 ) ) ( not ( = ?auto_407098 ?auto_407099 ) ) ( not ( = ?auto_407098 ?auto_407100 ) ) ( not ( = ?auto_407098 ?auto_407101 ) ) ( not ( = ?auto_407098 ?auto_407102 ) ) ( not ( = ?auto_407098 ?auto_407103 ) ) ( not ( = ?auto_407098 ?auto_407104 ) ) ( not ( = ?auto_407098 ?auto_407105 ) ) ( not ( = ?auto_407099 ?auto_407100 ) ) ( not ( = ?auto_407099 ?auto_407101 ) ) ( not ( = ?auto_407099 ?auto_407102 ) ) ( not ( = ?auto_407099 ?auto_407103 ) ) ( not ( = ?auto_407099 ?auto_407104 ) ) ( not ( = ?auto_407099 ?auto_407105 ) ) ( not ( = ?auto_407100 ?auto_407101 ) ) ( not ( = ?auto_407100 ?auto_407102 ) ) ( not ( = ?auto_407100 ?auto_407103 ) ) ( not ( = ?auto_407100 ?auto_407104 ) ) ( not ( = ?auto_407100 ?auto_407105 ) ) ( not ( = ?auto_407101 ?auto_407102 ) ) ( not ( = ?auto_407101 ?auto_407103 ) ) ( not ( = ?auto_407101 ?auto_407104 ) ) ( not ( = ?auto_407101 ?auto_407105 ) ) ( not ( = ?auto_407102 ?auto_407103 ) ) ( not ( = ?auto_407102 ?auto_407104 ) ) ( not ( = ?auto_407102 ?auto_407105 ) ) ( not ( = ?auto_407103 ?auto_407104 ) ) ( not ( = ?auto_407103 ?auto_407105 ) ) ( not ( = ?auto_407104 ?auto_407105 ) ) ( ON ?auto_407104 ?auto_407105 ) ( ON ?auto_407103 ?auto_407104 ) ( ON ?auto_407102 ?auto_407103 ) ( ON ?auto_407101 ?auto_407102 ) ( ON ?auto_407100 ?auto_407101 ) ( ON ?auto_407099 ?auto_407100 ) ( CLEAR ?auto_407097 ) ( ON ?auto_407098 ?auto_407099 ) ( CLEAR ?auto_407098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_407091 ?auto_407092 ?auto_407093 ?auto_407094 ?auto_407095 ?auto_407096 ?auto_407097 ?auto_407098 )
      ( MAKE-15PILE ?auto_407091 ?auto_407092 ?auto_407093 ?auto_407094 ?auto_407095 ?auto_407096 ?auto_407097 ?auto_407098 ?auto_407099 ?auto_407100 ?auto_407101 ?auto_407102 ?auto_407103 ?auto_407104 ?auto_407105 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_407121 - BLOCK
      ?auto_407122 - BLOCK
      ?auto_407123 - BLOCK
      ?auto_407124 - BLOCK
      ?auto_407125 - BLOCK
      ?auto_407126 - BLOCK
      ?auto_407127 - BLOCK
      ?auto_407128 - BLOCK
      ?auto_407129 - BLOCK
      ?auto_407130 - BLOCK
      ?auto_407131 - BLOCK
      ?auto_407132 - BLOCK
      ?auto_407133 - BLOCK
      ?auto_407134 - BLOCK
      ?auto_407135 - BLOCK
    )
    :vars
    (
      ?auto_407136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407135 ?auto_407136 ) ( ON-TABLE ?auto_407121 ) ( ON ?auto_407122 ?auto_407121 ) ( ON ?auto_407123 ?auto_407122 ) ( ON ?auto_407124 ?auto_407123 ) ( ON ?auto_407125 ?auto_407124 ) ( ON ?auto_407126 ?auto_407125 ) ( not ( = ?auto_407121 ?auto_407122 ) ) ( not ( = ?auto_407121 ?auto_407123 ) ) ( not ( = ?auto_407121 ?auto_407124 ) ) ( not ( = ?auto_407121 ?auto_407125 ) ) ( not ( = ?auto_407121 ?auto_407126 ) ) ( not ( = ?auto_407121 ?auto_407127 ) ) ( not ( = ?auto_407121 ?auto_407128 ) ) ( not ( = ?auto_407121 ?auto_407129 ) ) ( not ( = ?auto_407121 ?auto_407130 ) ) ( not ( = ?auto_407121 ?auto_407131 ) ) ( not ( = ?auto_407121 ?auto_407132 ) ) ( not ( = ?auto_407121 ?auto_407133 ) ) ( not ( = ?auto_407121 ?auto_407134 ) ) ( not ( = ?auto_407121 ?auto_407135 ) ) ( not ( = ?auto_407121 ?auto_407136 ) ) ( not ( = ?auto_407122 ?auto_407123 ) ) ( not ( = ?auto_407122 ?auto_407124 ) ) ( not ( = ?auto_407122 ?auto_407125 ) ) ( not ( = ?auto_407122 ?auto_407126 ) ) ( not ( = ?auto_407122 ?auto_407127 ) ) ( not ( = ?auto_407122 ?auto_407128 ) ) ( not ( = ?auto_407122 ?auto_407129 ) ) ( not ( = ?auto_407122 ?auto_407130 ) ) ( not ( = ?auto_407122 ?auto_407131 ) ) ( not ( = ?auto_407122 ?auto_407132 ) ) ( not ( = ?auto_407122 ?auto_407133 ) ) ( not ( = ?auto_407122 ?auto_407134 ) ) ( not ( = ?auto_407122 ?auto_407135 ) ) ( not ( = ?auto_407122 ?auto_407136 ) ) ( not ( = ?auto_407123 ?auto_407124 ) ) ( not ( = ?auto_407123 ?auto_407125 ) ) ( not ( = ?auto_407123 ?auto_407126 ) ) ( not ( = ?auto_407123 ?auto_407127 ) ) ( not ( = ?auto_407123 ?auto_407128 ) ) ( not ( = ?auto_407123 ?auto_407129 ) ) ( not ( = ?auto_407123 ?auto_407130 ) ) ( not ( = ?auto_407123 ?auto_407131 ) ) ( not ( = ?auto_407123 ?auto_407132 ) ) ( not ( = ?auto_407123 ?auto_407133 ) ) ( not ( = ?auto_407123 ?auto_407134 ) ) ( not ( = ?auto_407123 ?auto_407135 ) ) ( not ( = ?auto_407123 ?auto_407136 ) ) ( not ( = ?auto_407124 ?auto_407125 ) ) ( not ( = ?auto_407124 ?auto_407126 ) ) ( not ( = ?auto_407124 ?auto_407127 ) ) ( not ( = ?auto_407124 ?auto_407128 ) ) ( not ( = ?auto_407124 ?auto_407129 ) ) ( not ( = ?auto_407124 ?auto_407130 ) ) ( not ( = ?auto_407124 ?auto_407131 ) ) ( not ( = ?auto_407124 ?auto_407132 ) ) ( not ( = ?auto_407124 ?auto_407133 ) ) ( not ( = ?auto_407124 ?auto_407134 ) ) ( not ( = ?auto_407124 ?auto_407135 ) ) ( not ( = ?auto_407124 ?auto_407136 ) ) ( not ( = ?auto_407125 ?auto_407126 ) ) ( not ( = ?auto_407125 ?auto_407127 ) ) ( not ( = ?auto_407125 ?auto_407128 ) ) ( not ( = ?auto_407125 ?auto_407129 ) ) ( not ( = ?auto_407125 ?auto_407130 ) ) ( not ( = ?auto_407125 ?auto_407131 ) ) ( not ( = ?auto_407125 ?auto_407132 ) ) ( not ( = ?auto_407125 ?auto_407133 ) ) ( not ( = ?auto_407125 ?auto_407134 ) ) ( not ( = ?auto_407125 ?auto_407135 ) ) ( not ( = ?auto_407125 ?auto_407136 ) ) ( not ( = ?auto_407126 ?auto_407127 ) ) ( not ( = ?auto_407126 ?auto_407128 ) ) ( not ( = ?auto_407126 ?auto_407129 ) ) ( not ( = ?auto_407126 ?auto_407130 ) ) ( not ( = ?auto_407126 ?auto_407131 ) ) ( not ( = ?auto_407126 ?auto_407132 ) ) ( not ( = ?auto_407126 ?auto_407133 ) ) ( not ( = ?auto_407126 ?auto_407134 ) ) ( not ( = ?auto_407126 ?auto_407135 ) ) ( not ( = ?auto_407126 ?auto_407136 ) ) ( not ( = ?auto_407127 ?auto_407128 ) ) ( not ( = ?auto_407127 ?auto_407129 ) ) ( not ( = ?auto_407127 ?auto_407130 ) ) ( not ( = ?auto_407127 ?auto_407131 ) ) ( not ( = ?auto_407127 ?auto_407132 ) ) ( not ( = ?auto_407127 ?auto_407133 ) ) ( not ( = ?auto_407127 ?auto_407134 ) ) ( not ( = ?auto_407127 ?auto_407135 ) ) ( not ( = ?auto_407127 ?auto_407136 ) ) ( not ( = ?auto_407128 ?auto_407129 ) ) ( not ( = ?auto_407128 ?auto_407130 ) ) ( not ( = ?auto_407128 ?auto_407131 ) ) ( not ( = ?auto_407128 ?auto_407132 ) ) ( not ( = ?auto_407128 ?auto_407133 ) ) ( not ( = ?auto_407128 ?auto_407134 ) ) ( not ( = ?auto_407128 ?auto_407135 ) ) ( not ( = ?auto_407128 ?auto_407136 ) ) ( not ( = ?auto_407129 ?auto_407130 ) ) ( not ( = ?auto_407129 ?auto_407131 ) ) ( not ( = ?auto_407129 ?auto_407132 ) ) ( not ( = ?auto_407129 ?auto_407133 ) ) ( not ( = ?auto_407129 ?auto_407134 ) ) ( not ( = ?auto_407129 ?auto_407135 ) ) ( not ( = ?auto_407129 ?auto_407136 ) ) ( not ( = ?auto_407130 ?auto_407131 ) ) ( not ( = ?auto_407130 ?auto_407132 ) ) ( not ( = ?auto_407130 ?auto_407133 ) ) ( not ( = ?auto_407130 ?auto_407134 ) ) ( not ( = ?auto_407130 ?auto_407135 ) ) ( not ( = ?auto_407130 ?auto_407136 ) ) ( not ( = ?auto_407131 ?auto_407132 ) ) ( not ( = ?auto_407131 ?auto_407133 ) ) ( not ( = ?auto_407131 ?auto_407134 ) ) ( not ( = ?auto_407131 ?auto_407135 ) ) ( not ( = ?auto_407131 ?auto_407136 ) ) ( not ( = ?auto_407132 ?auto_407133 ) ) ( not ( = ?auto_407132 ?auto_407134 ) ) ( not ( = ?auto_407132 ?auto_407135 ) ) ( not ( = ?auto_407132 ?auto_407136 ) ) ( not ( = ?auto_407133 ?auto_407134 ) ) ( not ( = ?auto_407133 ?auto_407135 ) ) ( not ( = ?auto_407133 ?auto_407136 ) ) ( not ( = ?auto_407134 ?auto_407135 ) ) ( not ( = ?auto_407134 ?auto_407136 ) ) ( not ( = ?auto_407135 ?auto_407136 ) ) ( ON ?auto_407134 ?auto_407135 ) ( ON ?auto_407133 ?auto_407134 ) ( ON ?auto_407132 ?auto_407133 ) ( ON ?auto_407131 ?auto_407132 ) ( ON ?auto_407130 ?auto_407131 ) ( ON ?auto_407129 ?auto_407130 ) ( ON ?auto_407128 ?auto_407129 ) ( CLEAR ?auto_407126 ) ( ON ?auto_407127 ?auto_407128 ) ( CLEAR ?auto_407127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_407121 ?auto_407122 ?auto_407123 ?auto_407124 ?auto_407125 ?auto_407126 ?auto_407127 )
      ( MAKE-15PILE ?auto_407121 ?auto_407122 ?auto_407123 ?auto_407124 ?auto_407125 ?auto_407126 ?auto_407127 ?auto_407128 ?auto_407129 ?auto_407130 ?auto_407131 ?auto_407132 ?auto_407133 ?auto_407134 ?auto_407135 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_407152 - BLOCK
      ?auto_407153 - BLOCK
      ?auto_407154 - BLOCK
      ?auto_407155 - BLOCK
      ?auto_407156 - BLOCK
      ?auto_407157 - BLOCK
      ?auto_407158 - BLOCK
      ?auto_407159 - BLOCK
      ?auto_407160 - BLOCK
      ?auto_407161 - BLOCK
      ?auto_407162 - BLOCK
      ?auto_407163 - BLOCK
      ?auto_407164 - BLOCK
      ?auto_407165 - BLOCK
      ?auto_407166 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_407166 ) ( ON-TABLE ?auto_407152 ) ( ON ?auto_407153 ?auto_407152 ) ( ON ?auto_407154 ?auto_407153 ) ( ON ?auto_407155 ?auto_407154 ) ( ON ?auto_407156 ?auto_407155 ) ( ON ?auto_407157 ?auto_407156 ) ( not ( = ?auto_407152 ?auto_407153 ) ) ( not ( = ?auto_407152 ?auto_407154 ) ) ( not ( = ?auto_407152 ?auto_407155 ) ) ( not ( = ?auto_407152 ?auto_407156 ) ) ( not ( = ?auto_407152 ?auto_407157 ) ) ( not ( = ?auto_407152 ?auto_407158 ) ) ( not ( = ?auto_407152 ?auto_407159 ) ) ( not ( = ?auto_407152 ?auto_407160 ) ) ( not ( = ?auto_407152 ?auto_407161 ) ) ( not ( = ?auto_407152 ?auto_407162 ) ) ( not ( = ?auto_407152 ?auto_407163 ) ) ( not ( = ?auto_407152 ?auto_407164 ) ) ( not ( = ?auto_407152 ?auto_407165 ) ) ( not ( = ?auto_407152 ?auto_407166 ) ) ( not ( = ?auto_407153 ?auto_407154 ) ) ( not ( = ?auto_407153 ?auto_407155 ) ) ( not ( = ?auto_407153 ?auto_407156 ) ) ( not ( = ?auto_407153 ?auto_407157 ) ) ( not ( = ?auto_407153 ?auto_407158 ) ) ( not ( = ?auto_407153 ?auto_407159 ) ) ( not ( = ?auto_407153 ?auto_407160 ) ) ( not ( = ?auto_407153 ?auto_407161 ) ) ( not ( = ?auto_407153 ?auto_407162 ) ) ( not ( = ?auto_407153 ?auto_407163 ) ) ( not ( = ?auto_407153 ?auto_407164 ) ) ( not ( = ?auto_407153 ?auto_407165 ) ) ( not ( = ?auto_407153 ?auto_407166 ) ) ( not ( = ?auto_407154 ?auto_407155 ) ) ( not ( = ?auto_407154 ?auto_407156 ) ) ( not ( = ?auto_407154 ?auto_407157 ) ) ( not ( = ?auto_407154 ?auto_407158 ) ) ( not ( = ?auto_407154 ?auto_407159 ) ) ( not ( = ?auto_407154 ?auto_407160 ) ) ( not ( = ?auto_407154 ?auto_407161 ) ) ( not ( = ?auto_407154 ?auto_407162 ) ) ( not ( = ?auto_407154 ?auto_407163 ) ) ( not ( = ?auto_407154 ?auto_407164 ) ) ( not ( = ?auto_407154 ?auto_407165 ) ) ( not ( = ?auto_407154 ?auto_407166 ) ) ( not ( = ?auto_407155 ?auto_407156 ) ) ( not ( = ?auto_407155 ?auto_407157 ) ) ( not ( = ?auto_407155 ?auto_407158 ) ) ( not ( = ?auto_407155 ?auto_407159 ) ) ( not ( = ?auto_407155 ?auto_407160 ) ) ( not ( = ?auto_407155 ?auto_407161 ) ) ( not ( = ?auto_407155 ?auto_407162 ) ) ( not ( = ?auto_407155 ?auto_407163 ) ) ( not ( = ?auto_407155 ?auto_407164 ) ) ( not ( = ?auto_407155 ?auto_407165 ) ) ( not ( = ?auto_407155 ?auto_407166 ) ) ( not ( = ?auto_407156 ?auto_407157 ) ) ( not ( = ?auto_407156 ?auto_407158 ) ) ( not ( = ?auto_407156 ?auto_407159 ) ) ( not ( = ?auto_407156 ?auto_407160 ) ) ( not ( = ?auto_407156 ?auto_407161 ) ) ( not ( = ?auto_407156 ?auto_407162 ) ) ( not ( = ?auto_407156 ?auto_407163 ) ) ( not ( = ?auto_407156 ?auto_407164 ) ) ( not ( = ?auto_407156 ?auto_407165 ) ) ( not ( = ?auto_407156 ?auto_407166 ) ) ( not ( = ?auto_407157 ?auto_407158 ) ) ( not ( = ?auto_407157 ?auto_407159 ) ) ( not ( = ?auto_407157 ?auto_407160 ) ) ( not ( = ?auto_407157 ?auto_407161 ) ) ( not ( = ?auto_407157 ?auto_407162 ) ) ( not ( = ?auto_407157 ?auto_407163 ) ) ( not ( = ?auto_407157 ?auto_407164 ) ) ( not ( = ?auto_407157 ?auto_407165 ) ) ( not ( = ?auto_407157 ?auto_407166 ) ) ( not ( = ?auto_407158 ?auto_407159 ) ) ( not ( = ?auto_407158 ?auto_407160 ) ) ( not ( = ?auto_407158 ?auto_407161 ) ) ( not ( = ?auto_407158 ?auto_407162 ) ) ( not ( = ?auto_407158 ?auto_407163 ) ) ( not ( = ?auto_407158 ?auto_407164 ) ) ( not ( = ?auto_407158 ?auto_407165 ) ) ( not ( = ?auto_407158 ?auto_407166 ) ) ( not ( = ?auto_407159 ?auto_407160 ) ) ( not ( = ?auto_407159 ?auto_407161 ) ) ( not ( = ?auto_407159 ?auto_407162 ) ) ( not ( = ?auto_407159 ?auto_407163 ) ) ( not ( = ?auto_407159 ?auto_407164 ) ) ( not ( = ?auto_407159 ?auto_407165 ) ) ( not ( = ?auto_407159 ?auto_407166 ) ) ( not ( = ?auto_407160 ?auto_407161 ) ) ( not ( = ?auto_407160 ?auto_407162 ) ) ( not ( = ?auto_407160 ?auto_407163 ) ) ( not ( = ?auto_407160 ?auto_407164 ) ) ( not ( = ?auto_407160 ?auto_407165 ) ) ( not ( = ?auto_407160 ?auto_407166 ) ) ( not ( = ?auto_407161 ?auto_407162 ) ) ( not ( = ?auto_407161 ?auto_407163 ) ) ( not ( = ?auto_407161 ?auto_407164 ) ) ( not ( = ?auto_407161 ?auto_407165 ) ) ( not ( = ?auto_407161 ?auto_407166 ) ) ( not ( = ?auto_407162 ?auto_407163 ) ) ( not ( = ?auto_407162 ?auto_407164 ) ) ( not ( = ?auto_407162 ?auto_407165 ) ) ( not ( = ?auto_407162 ?auto_407166 ) ) ( not ( = ?auto_407163 ?auto_407164 ) ) ( not ( = ?auto_407163 ?auto_407165 ) ) ( not ( = ?auto_407163 ?auto_407166 ) ) ( not ( = ?auto_407164 ?auto_407165 ) ) ( not ( = ?auto_407164 ?auto_407166 ) ) ( not ( = ?auto_407165 ?auto_407166 ) ) ( ON ?auto_407165 ?auto_407166 ) ( ON ?auto_407164 ?auto_407165 ) ( ON ?auto_407163 ?auto_407164 ) ( ON ?auto_407162 ?auto_407163 ) ( ON ?auto_407161 ?auto_407162 ) ( ON ?auto_407160 ?auto_407161 ) ( ON ?auto_407159 ?auto_407160 ) ( CLEAR ?auto_407157 ) ( ON ?auto_407158 ?auto_407159 ) ( CLEAR ?auto_407158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_407152 ?auto_407153 ?auto_407154 ?auto_407155 ?auto_407156 ?auto_407157 ?auto_407158 )
      ( MAKE-15PILE ?auto_407152 ?auto_407153 ?auto_407154 ?auto_407155 ?auto_407156 ?auto_407157 ?auto_407158 ?auto_407159 ?auto_407160 ?auto_407161 ?auto_407162 ?auto_407163 ?auto_407164 ?auto_407165 ?auto_407166 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_407182 - BLOCK
      ?auto_407183 - BLOCK
      ?auto_407184 - BLOCK
      ?auto_407185 - BLOCK
      ?auto_407186 - BLOCK
      ?auto_407187 - BLOCK
      ?auto_407188 - BLOCK
      ?auto_407189 - BLOCK
      ?auto_407190 - BLOCK
      ?auto_407191 - BLOCK
      ?auto_407192 - BLOCK
      ?auto_407193 - BLOCK
      ?auto_407194 - BLOCK
      ?auto_407195 - BLOCK
      ?auto_407196 - BLOCK
    )
    :vars
    (
      ?auto_407197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407196 ?auto_407197 ) ( ON-TABLE ?auto_407182 ) ( ON ?auto_407183 ?auto_407182 ) ( ON ?auto_407184 ?auto_407183 ) ( ON ?auto_407185 ?auto_407184 ) ( ON ?auto_407186 ?auto_407185 ) ( not ( = ?auto_407182 ?auto_407183 ) ) ( not ( = ?auto_407182 ?auto_407184 ) ) ( not ( = ?auto_407182 ?auto_407185 ) ) ( not ( = ?auto_407182 ?auto_407186 ) ) ( not ( = ?auto_407182 ?auto_407187 ) ) ( not ( = ?auto_407182 ?auto_407188 ) ) ( not ( = ?auto_407182 ?auto_407189 ) ) ( not ( = ?auto_407182 ?auto_407190 ) ) ( not ( = ?auto_407182 ?auto_407191 ) ) ( not ( = ?auto_407182 ?auto_407192 ) ) ( not ( = ?auto_407182 ?auto_407193 ) ) ( not ( = ?auto_407182 ?auto_407194 ) ) ( not ( = ?auto_407182 ?auto_407195 ) ) ( not ( = ?auto_407182 ?auto_407196 ) ) ( not ( = ?auto_407182 ?auto_407197 ) ) ( not ( = ?auto_407183 ?auto_407184 ) ) ( not ( = ?auto_407183 ?auto_407185 ) ) ( not ( = ?auto_407183 ?auto_407186 ) ) ( not ( = ?auto_407183 ?auto_407187 ) ) ( not ( = ?auto_407183 ?auto_407188 ) ) ( not ( = ?auto_407183 ?auto_407189 ) ) ( not ( = ?auto_407183 ?auto_407190 ) ) ( not ( = ?auto_407183 ?auto_407191 ) ) ( not ( = ?auto_407183 ?auto_407192 ) ) ( not ( = ?auto_407183 ?auto_407193 ) ) ( not ( = ?auto_407183 ?auto_407194 ) ) ( not ( = ?auto_407183 ?auto_407195 ) ) ( not ( = ?auto_407183 ?auto_407196 ) ) ( not ( = ?auto_407183 ?auto_407197 ) ) ( not ( = ?auto_407184 ?auto_407185 ) ) ( not ( = ?auto_407184 ?auto_407186 ) ) ( not ( = ?auto_407184 ?auto_407187 ) ) ( not ( = ?auto_407184 ?auto_407188 ) ) ( not ( = ?auto_407184 ?auto_407189 ) ) ( not ( = ?auto_407184 ?auto_407190 ) ) ( not ( = ?auto_407184 ?auto_407191 ) ) ( not ( = ?auto_407184 ?auto_407192 ) ) ( not ( = ?auto_407184 ?auto_407193 ) ) ( not ( = ?auto_407184 ?auto_407194 ) ) ( not ( = ?auto_407184 ?auto_407195 ) ) ( not ( = ?auto_407184 ?auto_407196 ) ) ( not ( = ?auto_407184 ?auto_407197 ) ) ( not ( = ?auto_407185 ?auto_407186 ) ) ( not ( = ?auto_407185 ?auto_407187 ) ) ( not ( = ?auto_407185 ?auto_407188 ) ) ( not ( = ?auto_407185 ?auto_407189 ) ) ( not ( = ?auto_407185 ?auto_407190 ) ) ( not ( = ?auto_407185 ?auto_407191 ) ) ( not ( = ?auto_407185 ?auto_407192 ) ) ( not ( = ?auto_407185 ?auto_407193 ) ) ( not ( = ?auto_407185 ?auto_407194 ) ) ( not ( = ?auto_407185 ?auto_407195 ) ) ( not ( = ?auto_407185 ?auto_407196 ) ) ( not ( = ?auto_407185 ?auto_407197 ) ) ( not ( = ?auto_407186 ?auto_407187 ) ) ( not ( = ?auto_407186 ?auto_407188 ) ) ( not ( = ?auto_407186 ?auto_407189 ) ) ( not ( = ?auto_407186 ?auto_407190 ) ) ( not ( = ?auto_407186 ?auto_407191 ) ) ( not ( = ?auto_407186 ?auto_407192 ) ) ( not ( = ?auto_407186 ?auto_407193 ) ) ( not ( = ?auto_407186 ?auto_407194 ) ) ( not ( = ?auto_407186 ?auto_407195 ) ) ( not ( = ?auto_407186 ?auto_407196 ) ) ( not ( = ?auto_407186 ?auto_407197 ) ) ( not ( = ?auto_407187 ?auto_407188 ) ) ( not ( = ?auto_407187 ?auto_407189 ) ) ( not ( = ?auto_407187 ?auto_407190 ) ) ( not ( = ?auto_407187 ?auto_407191 ) ) ( not ( = ?auto_407187 ?auto_407192 ) ) ( not ( = ?auto_407187 ?auto_407193 ) ) ( not ( = ?auto_407187 ?auto_407194 ) ) ( not ( = ?auto_407187 ?auto_407195 ) ) ( not ( = ?auto_407187 ?auto_407196 ) ) ( not ( = ?auto_407187 ?auto_407197 ) ) ( not ( = ?auto_407188 ?auto_407189 ) ) ( not ( = ?auto_407188 ?auto_407190 ) ) ( not ( = ?auto_407188 ?auto_407191 ) ) ( not ( = ?auto_407188 ?auto_407192 ) ) ( not ( = ?auto_407188 ?auto_407193 ) ) ( not ( = ?auto_407188 ?auto_407194 ) ) ( not ( = ?auto_407188 ?auto_407195 ) ) ( not ( = ?auto_407188 ?auto_407196 ) ) ( not ( = ?auto_407188 ?auto_407197 ) ) ( not ( = ?auto_407189 ?auto_407190 ) ) ( not ( = ?auto_407189 ?auto_407191 ) ) ( not ( = ?auto_407189 ?auto_407192 ) ) ( not ( = ?auto_407189 ?auto_407193 ) ) ( not ( = ?auto_407189 ?auto_407194 ) ) ( not ( = ?auto_407189 ?auto_407195 ) ) ( not ( = ?auto_407189 ?auto_407196 ) ) ( not ( = ?auto_407189 ?auto_407197 ) ) ( not ( = ?auto_407190 ?auto_407191 ) ) ( not ( = ?auto_407190 ?auto_407192 ) ) ( not ( = ?auto_407190 ?auto_407193 ) ) ( not ( = ?auto_407190 ?auto_407194 ) ) ( not ( = ?auto_407190 ?auto_407195 ) ) ( not ( = ?auto_407190 ?auto_407196 ) ) ( not ( = ?auto_407190 ?auto_407197 ) ) ( not ( = ?auto_407191 ?auto_407192 ) ) ( not ( = ?auto_407191 ?auto_407193 ) ) ( not ( = ?auto_407191 ?auto_407194 ) ) ( not ( = ?auto_407191 ?auto_407195 ) ) ( not ( = ?auto_407191 ?auto_407196 ) ) ( not ( = ?auto_407191 ?auto_407197 ) ) ( not ( = ?auto_407192 ?auto_407193 ) ) ( not ( = ?auto_407192 ?auto_407194 ) ) ( not ( = ?auto_407192 ?auto_407195 ) ) ( not ( = ?auto_407192 ?auto_407196 ) ) ( not ( = ?auto_407192 ?auto_407197 ) ) ( not ( = ?auto_407193 ?auto_407194 ) ) ( not ( = ?auto_407193 ?auto_407195 ) ) ( not ( = ?auto_407193 ?auto_407196 ) ) ( not ( = ?auto_407193 ?auto_407197 ) ) ( not ( = ?auto_407194 ?auto_407195 ) ) ( not ( = ?auto_407194 ?auto_407196 ) ) ( not ( = ?auto_407194 ?auto_407197 ) ) ( not ( = ?auto_407195 ?auto_407196 ) ) ( not ( = ?auto_407195 ?auto_407197 ) ) ( not ( = ?auto_407196 ?auto_407197 ) ) ( ON ?auto_407195 ?auto_407196 ) ( ON ?auto_407194 ?auto_407195 ) ( ON ?auto_407193 ?auto_407194 ) ( ON ?auto_407192 ?auto_407193 ) ( ON ?auto_407191 ?auto_407192 ) ( ON ?auto_407190 ?auto_407191 ) ( ON ?auto_407189 ?auto_407190 ) ( ON ?auto_407188 ?auto_407189 ) ( CLEAR ?auto_407186 ) ( ON ?auto_407187 ?auto_407188 ) ( CLEAR ?auto_407187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_407182 ?auto_407183 ?auto_407184 ?auto_407185 ?auto_407186 ?auto_407187 )
      ( MAKE-15PILE ?auto_407182 ?auto_407183 ?auto_407184 ?auto_407185 ?auto_407186 ?auto_407187 ?auto_407188 ?auto_407189 ?auto_407190 ?auto_407191 ?auto_407192 ?auto_407193 ?auto_407194 ?auto_407195 ?auto_407196 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_407213 - BLOCK
      ?auto_407214 - BLOCK
      ?auto_407215 - BLOCK
      ?auto_407216 - BLOCK
      ?auto_407217 - BLOCK
      ?auto_407218 - BLOCK
      ?auto_407219 - BLOCK
      ?auto_407220 - BLOCK
      ?auto_407221 - BLOCK
      ?auto_407222 - BLOCK
      ?auto_407223 - BLOCK
      ?auto_407224 - BLOCK
      ?auto_407225 - BLOCK
      ?auto_407226 - BLOCK
      ?auto_407227 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_407227 ) ( ON-TABLE ?auto_407213 ) ( ON ?auto_407214 ?auto_407213 ) ( ON ?auto_407215 ?auto_407214 ) ( ON ?auto_407216 ?auto_407215 ) ( ON ?auto_407217 ?auto_407216 ) ( not ( = ?auto_407213 ?auto_407214 ) ) ( not ( = ?auto_407213 ?auto_407215 ) ) ( not ( = ?auto_407213 ?auto_407216 ) ) ( not ( = ?auto_407213 ?auto_407217 ) ) ( not ( = ?auto_407213 ?auto_407218 ) ) ( not ( = ?auto_407213 ?auto_407219 ) ) ( not ( = ?auto_407213 ?auto_407220 ) ) ( not ( = ?auto_407213 ?auto_407221 ) ) ( not ( = ?auto_407213 ?auto_407222 ) ) ( not ( = ?auto_407213 ?auto_407223 ) ) ( not ( = ?auto_407213 ?auto_407224 ) ) ( not ( = ?auto_407213 ?auto_407225 ) ) ( not ( = ?auto_407213 ?auto_407226 ) ) ( not ( = ?auto_407213 ?auto_407227 ) ) ( not ( = ?auto_407214 ?auto_407215 ) ) ( not ( = ?auto_407214 ?auto_407216 ) ) ( not ( = ?auto_407214 ?auto_407217 ) ) ( not ( = ?auto_407214 ?auto_407218 ) ) ( not ( = ?auto_407214 ?auto_407219 ) ) ( not ( = ?auto_407214 ?auto_407220 ) ) ( not ( = ?auto_407214 ?auto_407221 ) ) ( not ( = ?auto_407214 ?auto_407222 ) ) ( not ( = ?auto_407214 ?auto_407223 ) ) ( not ( = ?auto_407214 ?auto_407224 ) ) ( not ( = ?auto_407214 ?auto_407225 ) ) ( not ( = ?auto_407214 ?auto_407226 ) ) ( not ( = ?auto_407214 ?auto_407227 ) ) ( not ( = ?auto_407215 ?auto_407216 ) ) ( not ( = ?auto_407215 ?auto_407217 ) ) ( not ( = ?auto_407215 ?auto_407218 ) ) ( not ( = ?auto_407215 ?auto_407219 ) ) ( not ( = ?auto_407215 ?auto_407220 ) ) ( not ( = ?auto_407215 ?auto_407221 ) ) ( not ( = ?auto_407215 ?auto_407222 ) ) ( not ( = ?auto_407215 ?auto_407223 ) ) ( not ( = ?auto_407215 ?auto_407224 ) ) ( not ( = ?auto_407215 ?auto_407225 ) ) ( not ( = ?auto_407215 ?auto_407226 ) ) ( not ( = ?auto_407215 ?auto_407227 ) ) ( not ( = ?auto_407216 ?auto_407217 ) ) ( not ( = ?auto_407216 ?auto_407218 ) ) ( not ( = ?auto_407216 ?auto_407219 ) ) ( not ( = ?auto_407216 ?auto_407220 ) ) ( not ( = ?auto_407216 ?auto_407221 ) ) ( not ( = ?auto_407216 ?auto_407222 ) ) ( not ( = ?auto_407216 ?auto_407223 ) ) ( not ( = ?auto_407216 ?auto_407224 ) ) ( not ( = ?auto_407216 ?auto_407225 ) ) ( not ( = ?auto_407216 ?auto_407226 ) ) ( not ( = ?auto_407216 ?auto_407227 ) ) ( not ( = ?auto_407217 ?auto_407218 ) ) ( not ( = ?auto_407217 ?auto_407219 ) ) ( not ( = ?auto_407217 ?auto_407220 ) ) ( not ( = ?auto_407217 ?auto_407221 ) ) ( not ( = ?auto_407217 ?auto_407222 ) ) ( not ( = ?auto_407217 ?auto_407223 ) ) ( not ( = ?auto_407217 ?auto_407224 ) ) ( not ( = ?auto_407217 ?auto_407225 ) ) ( not ( = ?auto_407217 ?auto_407226 ) ) ( not ( = ?auto_407217 ?auto_407227 ) ) ( not ( = ?auto_407218 ?auto_407219 ) ) ( not ( = ?auto_407218 ?auto_407220 ) ) ( not ( = ?auto_407218 ?auto_407221 ) ) ( not ( = ?auto_407218 ?auto_407222 ) ) ( not ( = ?auto_407218 ?auto_407223 ) ) ( not ( = ?auto_407218 ?auto_407224 ) ) ( not ( = ?auto_407218 ?auto_407225 ) ) ( not ( = ?auto_407218 ?auto_407226 ) ) ( not ( = ?auto_407218 ?auto_407227 ) ) ( not ( = ?auto_407219 ?auto_407220 ) ) ( not ( = ?auto_407219 ?auto_407221 ) ) ( not ( = ?auto_407219 ?auto_407222 ) ) ( not ( = ?auto_407219 ?auto_407223 ) ) ( not ( = ?auto_407219 ?auto_407224 ) ) ( not ( = ?auto_407219 ?auto_407225 ) ) ( not ( = ?auto_407219 ?auto_407226 ) ) ( not ( = ?auto_407219 ?auto_407227 ) ) ( not ( = ?auto_407220 ?auto_407221 ) ) ( not ( = ?auto_407220 ?auto_407222 ) ) ( not ( = ?auto_407220 ?auto_407223 ) ) ( not ( = ?auto_407220 ?auto_407224 ) ) ( not ( = ?auto_407220 ?auto_407225 ) ) ( not ( = ?auto_407220 ?auto_407226 ) ) ( not ( = ?auto_407220 ?auto_407227 ) ) ( not ( = ?auto_407221 ?auto_407222 ) ) ( not ( = ?auto_407221 ?auto_407223 ) ) ( not ( = ?auto_407221 ?auto_407224 ) ) ( not ( = ?auto_407221 ?auto_407225 ) ) ( not ( = ?auto_407221 ?auto_407226 ) ) ( not ( = ?auto_407221 ?auto_407227 ) ) ( not ( = ?auto_407222 ?auto_407223 ) ) ( not ( = ?auto_407222 ?auto_407224 ) ) ( not ( = ?auto_407222 ?auto_407225 ) ) ( not ( = ?auto_407222 ?auto_407226 ) ) ( not ( = ?auto_407222 ?auto_407227 ) ) ( not ( = ?auto_407223 ?auto_407224 ) ) ( not ( = ?auto_407223 ?auto_407225 ) ) ( not ( = ?auto_407223 ?auto_407226 ) ) ( not ( = ?auto_407223 ?auto_407227 ) ) ( not ( = ?auto_407224 ?auto_407225 ) ) ( not ( = ?auto_407224 ?auto_407226 ) ) ( not ( = ?auto_407224 ?auto_407227 ) ) ( not ( = ?auto_407225 ?auto_407226 ) ) ( not ( = ?auto_407225 ?auto_407227 ) ) ( not ( = ?auto_407226 ?auto_407227 ) ) ( ON ?auto_407226 ?auto_407227 ) ( ON ?auto_407225 ?auto_407226 ) ( ON ?auto_407224 ?auto_407225 ) ( ON ?auto_407223 ?auto_407224 ) ( ON ?auto_407222 ?auto_407223 ) ( ON ?auto_407221 ?auto_407222 ) ( ON ?auto_407220 ?auto_407221 ) ( ON ?auto_407219 ?auto_407220 ) ( CLEAR ?auto_407217 ) ( ON ?auto_407218 ?auto_407219 ) ( CLEAR ?auto_407218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_407213 ?auto_407214 ?auto_407215 ?auto_407216 ?auto_407217 ?auto_407218 )
      ( MAKE-15PILE ?auto_407213 ?auto_407214 ?auto_407215 ?auto_407216 ?auto_407217 ?auto_407218 ?auto_407219 ?auto_407220 ?auto_407221 ?auto_407222 ?auto_407223 ?auto_407224 ?auto_407225 ?auto_407226 ?auto_407227 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_407243 - BLOCK
      ?auto_407244 - BLOCK
      ?auto_407245 - BLOCK
      ?auto_407246 - BLOCK
      ?auto_407247 - BLOCK
      ?auto_407248 - BLOCK
      ?auto_407249 - BLOCK
      ?auto_407250 - BLOCK
      ?auto_407251 - BLOCK
      ?auto_407252 - BLOCK
      ?auto_407253 - BLOCK
      ?auto_407254 - BLOCK
      ?auto_407255 - BLOCK
      ?auto_407256 - BLOCK
      ?auto_407257 - BLOCK
    )
    :vars
    (
      ?auto_407258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407257 ?auto_407258 ) ( ON-TABLE ?auto_407243 ) ( ON ?auto_407244 ?auto_407243 ) ( ON ?auto_407245 ?auto_407244 ) ( ON ?auto_407246 ?auto_407245 ) ( not ( = ?auto_407243 ?auto_407244 ) ) ( not ( = ?auto_407243 ?auto_407245 ) ) ( not ( = ?auto_407243 ?auto_407246 ) ) ( not ( = ?auto_407243 ?auto_407247 ) ) ( not ( = ?auto_407243 ?auto_407248 ) ) ( not ( = ?auto_407243 ?auto_407249 ) ) ( not ( = ?auto_407243 ?auto_407250 ) ) ( not ( = ?auto_407243 ?auto_407251 ) ) ( not ( = ?auto_407243 ?auto_407252 ) ) ( not ( = ?auto_407243 ?auto_407253 ) ) ( not ( = ?auto_407243 ?auto_407254 ) ) ( not ( = ?auto_407243 ?auto_407255 ) ) ( not ( = ?auto_407243 ?auto_407256 ) ) ( not ( = ?auto_407243 ?auto_407257 ) ) ( not ( = ?auto_407243 ?auto_407258 ) ) ( not ( = ?auto_407244 ?auto_407245 ) ) ( not ( = ?auto_407244 ?auto_407246 ) ) ( not ( = ?auto_407244 ?auto_407247 ) ) ( not ( = ?auto_407244 ?auto_407248 ) ) ( not ( = ?auto_407244 ?auto_407249 ) ) ( not ( = ?auto_407244 ?auto_407250 ) ) ( not ( = ?auto_407244 ?auto_407251 ) ) ( not ( = ?auto_407244 ?auto_407252 ) ) ( not ( = ?auto_407244 ?auto_407253 ) ) ( not ( = ?auto_407244 ?auto_407254 ) ) ( not ( = ?auto_407244 ?auto_407255 ) ) ( not ( = ?auto_407244 ?auto_407256 ) ) ( not ( = ?auto_407244 ?auto_407257 ) ) ( not ( = ?auto_407244 ?auto_407258 ) ) ( not ( = ?auto_407245 ?auto_407246 ) ) ( not ( = ?auto_407245 ?auto_407247 ) ) ( not ( = ?auto_407245 ?auto_407248 ) ) ( not ( = ?auto_407245 ?auto_407249 ) ) ( not ( = ?auto_407245 ?auto_407250 ) ) ( not ( = ?auto_407245 ?auto_407251 ) ) ( not ( = ?auto_407245 ?auto_407252 ) ) ( not ( = ?auto_407245 ?auto_407253 ) ) ( not ( = ?auto_407245 ?auto_407254 ) ) ( not ( = ?auto_407245 ?auto_407255 ) ) ( not ( = ?auto_407245 ?auto_407256 ) ) ( not ( = ?auto_407245 ?auto_407257 ) ) ( not ( = ?auto_407245 ?auto_407258 ) ) ( not ( = ?auto_407246 ?auto_407247 ) ) ( not ( = ?auto_407246 ?auto_407248 ) ) ( not ( = ?auto_407246 ?auto_407249 ) ) ( not ( = ?auto_407246 ?auto_407250 ) ) ( not ( = ?auto_407246 ?auto_407251 ) ) ( not ( = ?auto_407246 ?auto_407252 ) ) ( not ( = ?auto_407246 ?auto_407253 ) ) ( not ( = ?auto_407246 ?auto_407254 ) ) ( not ( = ?auto_407246 ?auto_407255 ) ) ( not ( = ?auto_407246 ?auto_407256 ) ) ( not ( = ?auto_407246 ?auto_407257 ) ) ( not ( = ?auto_407246 ?auto_407258 ) ) ( not ( = ?auto_407247 ?auto_407248 ) ) ( not ( = ?auto_407247 ?auto_407249 ) ) ( not ( = ?auto_407247 ?auto_407250 ) ) ( not ( = ?auto_407247 ?auto_407251 ) ) ( not ( = ?auto_407247 ?auto_407252 ) ) ( not ( = ?auto_407247 ?auto_407253 ) ) ( not ( = ?auto_407247 ?auto_407254 ) ) ( not ( = ?auto_407247 ?auto_407255 ) ) ( not ( = ?auto_407247 ?auto_407256 ) ) ( not ( = ?auto_407247 ?auto_407257 ) ) ( not ( = ?auto_407247 ?auto_407258 ) ) ( not ( = ?auto_407248 ?auto_407249 ) ) ( not ( = ?auto_407248 ?auto_407250 ) ) ( not ( = ?auto_407248 ?auto_407251 ) ) ( not ( = ?auto_407248 ?auto_407252 ) ) ( not ( = ?auto_407248 ?auto_407253 ) ) ( not ( = ?auto_407248 ?auto_407254 ) ) ( not ( = ?auto_407248 ?auto_407255 ) ) ( not ( = ?auto_407248 ?auto_407256 ) ) ( not ( = ?auto_407248 ?auto_407257 ) ) ( not ( = ?auto_407248 ?auto_407258 ) ) ( not ( = ?auto_407249 ?auto_407250 ) ) ( not ( = ?auto_407249 ?auto_407251 ) ) ( not ( = ?auto_407249 ?auto_407252 ) ) ( not ( = ?auto_407249 ?auto_407253 ) ) ( not ( = ?auto_407249 ?auto_407254 ) ) ( not ( = ?auto_407249 ?auto_407255 ) ) ( not ( = ?auto_407249 ?auto_407256 ) ) ( not ( = ?auto_407249 ?auto_407257 ) ) ( not ( = ?auto_407249 ?auto_407258 ) ) ( not ( = ?auto_407250 ?auto_407251 ) ) ( not ( = ?auto_407250 ?auto_407252 ) ) ( not ( = ?auto_407250 ?auto_407253 ) ) ( not ( = ?auto_407250 ?auto_407254 ) ) ( not ( = ?auto_407250 ?auto_407255 ) ) ( not ( = ?auto_407250 ?auto_407256 ) ) ( not ( = ?auto_407250 ?auto_407257 ) ) ( not ( = ?auto_407250 ?auto_407258 ) ) ( not ( = ?auto_407251 ?auto_407252 ) ) ( not ( = ?auto_407251 ?auto_407253 ) ) ( not ( = ?auto_407251 ?auto_407254 ) ) ( not ( = ?auto_407251 ?auto_407255 ) ) ( not ( = ?auto_407251 ?auto_407256 ) ) ( not ( = ?auto_407251 ?auto_407257 ) ) ( not ( = ?auto_407251 ?auto_407258 ) ) ( not ( = ?auto_407252 ?auto_407253 ) ) ( not ( = ?auto_407252 ?auto_407254 ) ) ( not ( = ?auto_407252 ?auto_407255 ) ) ( not ( = ?auto_407252 ?auto_407256 ) ) ( not ( = ?auto_407252 ?auto_407257 ) ) ( not ( = ?auto_407252 ?auto_407258 ) ) ( not ( = ?auto_407253 ?auto_407254 ) ) ( not ( = ?auto_407253 ?auto_407255 ) ) ( not ( = ?auto_407253 ?auto_407256 ) ) ( not ( = ?auto_407253 ?auto_407257 ) ) ( not ( = ?auto_407253 ?auto_407258 ) ) ( not ( = ?auto_407254 ?auto_407255 ) ) ( not ( = ?auto_407254 ?auto_407256 ) ) ( not ( = ?auto_407254 ?auto_407257 ) ) ( not ( = ?auto_407254 ?auto_407258 ) ) ( not ( = ?auto_407255 ?auto_407256 ) ) ( not ( = ?auto_407255 ?auto_407257 ) ) ( not ( = ?auto_407255 ?auto_407258 ) ) ( not ( = ?auto_407256 ?auto_407257 ) ) ( not ( = ?auto_407256 ?auto_407258 ) ) ( not ( = ?auto_407257 ?auto_407258 ) ) ( ON ?auto_407256 ?auto_407257 ) ( ON ?auto_407255 ?auto_407256 ) ( ON ?auto_407254 ?auto_407255 ) ( ON ?auto_407253 ?auto_407254 ) ( ON ?auto_407252 ?auto_407253 ) ( ON ?auto_407251 ?auto_407252 ) ( ON ?auto_407250 ?auto_407251 ) ( ON ?auto_407249 ?auto_407250 ) ( ON ?auto_407248 ?auto_407249 ) ( CLEAR ?auto_407246 ) ( ON ?auto_407247 ?auto_407248 ) ( CLEAR ?auto_407247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_407243 ?auto_407244 ?auto_407245 ?auto_407246 ?auto_407247 )
      ( MAKE-15PILE ?auto_407243 ?auto_407244 ?auto_407245 ?auto_407246 ?auto_407247 ?auto_407248 ?auto_407249 ?auto_407250 ?auto_407251 ?auto_407252 ?auto_407253 ?auto_407254 ?auto_407255 ?auto_407256 ?auto_407257 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_407274 - BLOCK
      ?auto_407275 - BLOCK
      ?auto_407276 - BLOCK
      ?auto_407277 - BLOCK
      ?auto_407278 - BLOCK
      ?auto_407279 - BLOCK
      ?auto_407280 - BLOCK
      ?auto_407281 - BLOCK
      ?auto_407282 - BLOCK
      ?auto_407283 - BLOCK
      ?auto_407284 - BLOCK
      ?auto_407285 - BLOCK
      ?auto_407286 - BLOCK
      ?auto_407287 - BLOCK
      ?auto_407288 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_407288 ) ( ON-TABLE ?auto_407274 ) ( ON ?auto_407275 ?auto_407274 ) ( ON ?auto_407276 ?auto_407275 ) ( ON ?auto_407277 ?auto_407276 ) ( not ( = ?auto_407274 ?auto_407275 ) ) ( not ( = ?auto_407274 ?auto_407276 ) ) ( not ( = ?auto_407274 ?auto_407277 ) ) ( not ( = ?auto_407274 ?auto_407278 ) ) ( not ( = ?auto_407274 ?auto_407279 ) ) ( not ( = ?auto_407274 ?auto_407280 ) ) ( not ( = ?auto_407274 ?auto_407281 ) ) ( not ( = ?auto_407274 ?auto_407282 ) ) ( not ( = ?auto_407274 ?auto_407283 ) ) ( not ( = ?auto_407274 ?auto_407284 ) ) ( not ( = ?auto_407274 ?auto_407285 ) ) ( not ( = ?auto_407274 ?auto_407286 ) ) ( not ( = ?auto_407274 ?auto_407287 ) ) ( not ( = ?auto_407274 ?auto_407288 ) ) ( not ( = ?auto_407275 ?auto_407276 ) ) ( not ( = ?auto_407275 ?auto_407277 ) ) ( not ( = ?auto_407275 ?auto_407278 ) ) ( not ( = ?auto_407275 ?auto_407279 ) ) ( not ( = ?auto_407275 ?auto_407280 ) ) ( not ( = ?auto_407275 ?auto_407281 ) ) ( not ( = ?auto_407275 ?auto_407282 ) ) ( not ( = ?auto_407275 ?auto_407283 ) ) ( not ( = ?auto_407275 ?auto_407284 ) ) ( not ( = ?auto_407275 ?auto_407285 ) ) ( not ( = ?auto_407275 ?auto_407286 ) ) ( not ( = ?auto_407275 ?auto_407287 ) ) ( not ( = ?auto_407275 ?auto_407288 ) ) ( not ( = ?auto_407276 ?auto_407277 ) ) ( not ( = ?auto_407276 ?auto_407278 ) ) ( not ( = ?auto_407276 ?auto_407279 ) ) ( not ( = ?auto_407276 ?auto_407280 ) ) ( not ( = ?auto_407276 ?auto_407281 ) ) ( not ( = ?auto_407276 ?auto_407282 ) ) ( not ( = ?auto_407276 ?auto_407283 ) ) ( not ( = ?auto_407276 ?auto_407284 ) ) ( not ( = ?auto_407276 ?auto_407285 ) ) ( not ( = ?auto_407276 ?auto_407286 ) ) ( not ( = ?auto_407276 ?auto_407287 ) ) ( not ( = ?auto_407276 ?auto_407288 ) ) ( not ( = ?auto_407277 ?auto_407278 ) ) ( not ( = ?auto_407277 ?auto_407279 ) ) ( not ( = ?auto_407277 ?auto_407280 ) ) ( not ( = ?auto_407277 ?auto_407281 ) ) ( not ( = ?auto_407277 ?auto_407282 ) ) ( not ( = ?auto_407277 ?auto_407283 ) ) ( not ( = ?auto_407277 ?auto_407284 ) ) ( not ( = ?auto_407277 ?auto_407285 ) ) ( not ( = ?auto_407277 ?auto_407286 ) ) ( not ( = ?auto_407277 ?auto_407287 ) ) ( not ( = ?auto_407277 ?auto_407288 ) ) ( not ( = ?auto_407278 ?auto_407279 ) ) ( not ( = ?auto_407278 ?auto_407280 ) ) ( not ( = ?auto_407278 ?auto_407281 ) ) ( not ( = ?auto_407278 ?auto_407282 ) ) ( not ( = ?auto_407278 ?auto_407283 ) ) ( not ( = ?auto_407278 ?auto_407284 ) ) ( not ( = ?auto_407278 ?auto_407285 ) ) ( not ( = ?auto_407278 ?auto_407286 ) ) ( not ( = ?auto_407278 ?auto_407287 ) ) ( not ( = ?auto_407278 ?auto_407288 ) ) ( not ( = ?auto_407279 ?auto_407280 ) ) ( not ( = ?auto_407279 ?auto_407281 ) ) ( not ( = ?auto_407279 ?auto_407282 ) ) ( not ( = ?auto_407279 ?auto_407283 ) ) ( not ( = ?auto_407279 ?auto_407284 ) ) ( not ( = ?auto_407279 ?auto_407285 ) ) ( not ( = ?auto_407279 ?auto_407286 ) ) ( not ( = ?auto_407279 ?auto_407287 ) ) ( not ( = ?auto_407279 ?auto_407288 ) ) ( not ( = ?auto_407280 ?auto_407281 ) ) ( not ( = ?auto_407280 ?auto_407282 ) ) ( not ( = ?auto_407280 ?auto_407283 ) ) ( not ( = ?auto_407280 ?auto_407284 ) ) ( not ( = ?auto_407280 ?auto_407285 ) ) ( not ( = ?auto_407280 ?auto_407286 ) ) ( not ( = ?auto_407280 ?auto_407287 ) ) ( not ( = ?auto_407280 ?auto_407288 ) ) ( not ( = ?auto_407281 ?auto_407282 ) ) ( not ( = ?auto_407281 ?auto_407283 ) ) ( not ( = ?auto_407281 ?auto_407284 ) ) ( not ( = ?auto_407281 ?auto_407285 ) ) ( not ( = ?auto_407281 ?auto_407286 ) ) ( not ( = ?auto_407281 ?auto_407287 ) ) ( not ( = ?auto_407281 ?auto_407288 ) ) ( not ( = ?auto_407282 ?auto_407283 ) ) ( not ( = ?auto_407282 ?auto_407284 ) ) ( not ( = ?auto_407282 ?auto_407285 ) ) ( not ( = ?auto_407282 ?auto_407286 ) ) ( not ( = ?auto_407282 ?auto_407287 ) ) ( not ( = ?auto_407282 ?auto_407288 ) ) ( not ( = ?auto_407283 ?auto_407284 ) ) ( not ( = ?auto_407283 ?auto_407285 ) ) ( not ( = ?auto_407283 ?auto_407286 ) ) ( not ( = ?auto_407283 ?auto_407287 ) ) ( not ( = ?auto_407283 ?auto_407288 ) ) ( not ( = ?auto_407284 ?auto_407285 ) ) ( not ( = ?auto_407284 ?auto_407286 ) ) ( not ( = ?auto_407284 ?auto_407287 ) ) ( not ( = ?auto_407284 ?auto_407288 ) ) ( not ( = ?auto_407285 ?auto_407286 ) ) ( not ( = ?auto_407285 ?auto_407287 ) ) ( not ( = ?auto_407285 ?auto_407288 ) ) ( not ( = ?auto_407286 ?auto_407287 ) ) ( not ( = ?auto_407286 ?auto_407288 ) ) ( not ( = ?auto_407287 ?auto_407288 ) ) ( ON ?auto_407287 ?auto_407288 ) ( ON ?auto_407286 ?auto_407287 ) ( ON ?auto_407285 ?auto_407286 ) ( ON ?auto_407284 ?auto_407285 ) ( ON ?auto_407283 ?auto_407284 ) ( ON ?auto_407282 ?auto_407283 ) ( ON ?auto_407281 ?auto_407282 ) ( ON ?auto_407280 ?auto_407281 ) ( ON ?auto_407279 ?auto_407280 ) ( CLEAR ?auto_407277 ) ( ON ?auto_407278 ?auto_407279 ) ( CLEAR ?auto_407278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_407274 ?auto_407275 ?auto_407276 ?auto_407277 ?auto_407278 )
      ( MAKE-15PILE ?auto_407274 ?auto_407275 ?auto_407276 ?auto_407277 ?auto_407278 ?auto_407279 ?auto_407280 ?auto_407281 ?auto_407282 ?auto_407283 ?auto_407284 ?auto_407285 ?auto_407286 ?auto_407287 ?auto_407288 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_407304 - BLOCK
      ?auto_407305 - BLOCK
      ?auto_407306 - BLOCK
      ?auto_407307 - BLOCK
      ?auto_407308 - BLOCK
      ?auto_407309 - BLOCK
      ?auto_407310 - BLOCK
      ?auto_407311 - BLOCK
      ?auto_407312 - BLOCK
      ?auto_407313 - BLOCK
      ?auto_407314 - BLOCK
      ?auto_407315 - BLOCK
      ?auto_407316 - BLOCK
      ?auto_407317 - BLOCK
      ?auto_407318 - BLOCK
    )
    :vars
    (
      ?auto_407319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407318 ?auto_407319 ) ( ON-TABLE ?auto_407304 ) ( ON ?auto_407305 ?auto_407304 ) ( ON ?auto_407306 ?auto_407305 ) ( not ( = ?auto_407304 ?auto_407305 ) ) ( not ( = ?auto_407304 ?auto_407306 ) ) ( not ( = ?auto_407304 ?auto_407307 ) ) ( not ( = ?auto_407304 ?auto_407308 ) ) ( not ( = ?auto_407304 ?auto_407309 ) ) ( not ( = ?auto_407304 ?auto_407310 ) ) ( not ( = ?auto_407304 ?auto_407311 ) ) ( not ( = ?auto_407304 ?auto_407312 ) ) ( not ( = ?auto_407304 ?auto_407313 ) ) ( not ( = ?auto_407304 ?auto_407314 ) ) ( not ( = ?auto_407304 ?auto_407315 ) ) ( not ( = ?auto_407304 ?auto_407316 ) ) ( not ( = ?auto_407304 ?auto_407317 ) ) ( not ( = ?auto_407304 ?auto_407318 ) ) ( not ( = ?auto_407304 ?auto_407319 ) ) ( not ( = ?auto_407305 ?auto_407306 ) ) ( not ( = ?auto_407305 ?auto_407307 ) ) ( not ( = ?auto_407305 ?auto_407308 ) ) ( not ( = ?auto_407305 ?auto_407309 ) ) ( not ( = ?auto_407305 ?auto_407310 ) ) ( not ( = ?auto_407305 ?auto_407311 ) ) ( not ( = ?auto_407305 ?auto_407312 ) ) ( not ( = ?auto_407305 ?auto_407313 ) ) ( not ( = ?auto_407305 ?auto_407314 ) ) ( not ( = ?auto_407305 ?auto_407315 ) ) ( not ( = ?auto_407305 ?auto_407316 ) ) ( not ( = ?auto_407305 ?auto_407317 ) ) ( not ( = ?auto_407305 ?auto_407318 ) ) ( not ( = ?auto_407305 ?auto_407319 ) ) ( not ( = ?auto_407306 ?auto_407307 ) ) ( not ( = ?auto_407306 ?auto_407308 ) ) ( not ( = ?auto_407306 ?auto_407309 ) ) ( not ( = ?auto_407306 ?auto_407310 ) ) ( not ( = ?auto_407306 ?auto_407311 ) ) ( not ( = ?auto_407306 ?auto_407312 ) ) ( not ( = ?auto_407306 ?auto_407313 ) ) ( not ( = ?auto_407306 ?auto_407314 ) ) ( not ( = ?auto_407306 ?auto_407315 ) ) ( not ( = ?auto_407306 ?auto_407316 ) ) ( not ( = ?auto_407306 ?auto_407317 ) ) ( not ( = ?auto_407306 ?auto_407318 ) ) ( not ( = ?auto_407306 ?auto_407319 ) ) ( not ( = ?auto_407307 ?auto_407308 ) ) ( not ( = ?auto_407307 ?auto_407309 ) ) ( not ( = ?auto_407307 ?auto_407310 ) ) ( not ( = ?auto_407307 ?auto_407311 ) ) ( not ( = ?auto_407307 ?auto_407312 ) ) ( not ( = ?auto_407307 ?auto_407313 ) ) ( not ( = ?auto_407307 ?auto_407314 ) ) ( not ( = ?auto_407307 ?auto_407315 ) ) ( not ( = ?auto_407307 ?auto_407316 ) ) ( not ( = ?auto_407307 ?auto_407317 ) ) ( not ( = ?auto_407307 ?auto_407318 ) ) ( not ( = ?auto_407307 ?auto_407319 ) ) ( not ( = ?auto_407308 ?auto_407309 ) ) ( not ( = ?auto_407308 ?auto_407310 ) ) ( not ( = ?auto_407308 ?auto_407311 ) ) ( not ( = ?auto_407308 ?auto_407312 ) ) ( not ( = ?auto_407308 ?auto_407313 ) ) ( not ( = ?auto_407308 ?auto_407314 ) ) ( not ( = ?auto_407308 ?auto_407315 ) ) ( not ( = ?auto_407308 ?auto_407316 ) ) ( not ( = ?auto_407308 ?auto_407317 ) ) ( not ( = ?auto_407308 ?auto_407318 ) ) ( not ( = ?auto_407308 ?auto_407319 ) ) ( not ( = ?auto_407309 ?auto_407310 ) ) ( not ( = ?auto_407309 ?auto_407311 ) ) ( not ( = ?auto_407309 ?auto_407312 ) ) ( not ( = ?auto_407309 ?auto_407313 ) ) ( not ( = ?auto_407309 ?auto_407314 ) ) ( not ( = ?auto_407309 ?auto_407315 ) ) ( not ( = ?auto_407309 ?auto_407316 ) ) ( not ( = ?auto_407309 ?auto_407317 ) ) ( not ( = ?auto_407309 ?auto_407318 ) ) ( not ( = ?auto_407309 ?auto_407319 ) ) ( not ( = ?auto_407310 ?auto_407311 ) ) ( not ( = ?auto_407310 ?auto_407312 ) ) ( not ( = ?auto_407310 ?auto_407313 ) ) ( not ( = ?auto_407310 ?auto_407314 ) ) ( not ( = ?auto_407310 ?auto_407315 ) ) ( not ( = ?auto_407310 ?auto_407316 ) ) ( not ( = ?auto_407310 ?auto_407317 ) ) ( not ( = ?auto_407310 ?auto_407318 ) ) ( not ( = ?auto_407310 ?auto_407319 ) ) ( not ( = ?auto_407311 ?auto_407312 ) ) ( not ( = ?auto_407311 ?auto_407313 ) ) ( not ( = ?auto_407311 ?auto_407314 ) ) ( not ( = ?auto_407311 ?auto_407315 ) ) ( not ( = ?auto_407311 ?auto_407316 ) ) ( not ( = ?auto_407311 ?auto_407317 ) ) ( not ( = ?auto_407311 ?auto_407318 ) ) ( not ( = ?auto_407311 ?auto_407319 ) ) ( not ( = ?auto_407312 ?auto_407313 ) ) ( not ( = ?auto_407312 ?auto_407314 ) ) ( not ( = ?auto_407312 ?auto_407315 ) ) ( not ( = ?auto_407312 ?auto_407316 ) ) ( not ( = ?auto_407312 ?auto_407317 ) ) ( not ( = ?auto_407312 ?auto_407318 ) ) ( not ( = ?auto_407312 ?auto_407319 ) ) ( not ( = ?auto_407313 ?auto_407314 ) ) ( not ( = ?auto_407313 ?auto_407315 ) ) ( not ( = ?auto_407313 ?auto_407316 ) ) ( not ( = ?auto_407313 ?auto_407317 ) ) ( not ( = ?auto_407313 ?auto_407318 ) ) ( not ( = ?auto_407313 ?auto_407319 ) ) ( not ( = ?auto_407314 ?auto_407315 ) ) ( not ( = ?auto_407314 ?auto_407316 ) ) ( not ( = ?auto_407314 ?auto_407317 ) ) ( not ( = ?auto_407314 ?auto_407318 ) ) ( not ( = ?auto_407314 ?auto_407319 ) ) ( not ( = ?auto_407315 ?auto_407316 ) ) ( not ( = ?auto_407315 ?auto_407317 ) ) ( not ( = ?auto_407315 ?auto_407318 ) ) ( not ( = ?auto_407315 ?auto_407319 ) ) ( not ( = ?auto_407316 ?auto_407317 ) ) ( not ( = ?auto_407316 ?auto_407318 ) ) ( not ( = ?auto_407316 ?auto_407319 ) ) ( not ( = ?auto_407317 ?auto_407318 ) ) ( not ( = ?auto_407317 ?auto_407319 ) ) ( not ( = ?auto_407318 ?auto_407319 ) ) ( ON ?auto_407317 ?auto_407318 ) ( ON ?auto_407316 ?auto_407317 ) ( ON ?auto_407315 ?auto_407316 ) ( ON ?auto_407314 ?auto_407315 ) ( ON ?auto_407313 ?auto_407314 ) ( ON ?auto_407312 ?auto_407313 ) ( ON ?auto_407311 ?auto_407312 ) ( ON ?auto_407310 ?auto_407311 ) ( ON ?auto_407309 ?auto_407310 ) ( ON ?auto_407308 ?auto_407309 ) ( CLEAR ?auto_407306 ) ( ON ?auto_407307 ?auto_407308 ) ( CLEAR ?auto_407307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_407304 ?auto_407305 ?auto_407306 ?auto_407307 )
      ( MAKE-15PILE ?auto_407304 ?auto_407305 ?auto_407306 ?auto_407307 ?auto_407308 ?auto_407309 ?auto_407310 ?auto_407311 ?auto_407312 ?auto_407313 ?auto_407314 ?auto_407315 ?auto_407316 ?auto_407317 ?auto_407318 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_407335 - BLOCK
      ?auto_407336 - BLOCK
      ?auto_407337 - BLOCK
      ?auto_407338 - BLOCK
      ?auto_407339 - BLOCK
      ?auto_407340 - BLOCK
      ?auto_407341 - BLOCK
      ?auto_407342 - BLOCK
      ?auto_407343 - BLOCK
      ?auto_407344 - BLOCK
      ?auto_407345 - BLOCK
      ?auto_407346 - BLOCK
      ?auto_407347 - BLOCK
      ?auto_407348 - BLOCK
      ?auto_407349 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_407349 ) ( ON-TABLE ?auto_407335 ) ( ON ?auto_407336 ?auto_407335 ) ( ON ?auto_407337 ?auto_407336 ) ( not ( = ?auto_407335 ?auto_407336 ) ) ( not ( = ?auto_407335 ?auto_407337 ) ) ( not ( = ?auto_407335 ?auto_407338 ) ) ( not ( = ?auto_407335 ?auto_407339 ) ) ( not ( = ?auto_407335 ?auto_407340 ) ) ( not ( = ?auto_407335 ?auto_407341 ) ) ( not ( = ?auto_407335 ?auto_407342 ) ) ( not ( = ?auto_407335 ?auto_407343 ) ) ( not ( = ?auto_407335 ?auto_407344 ) ) ( not ( = ?auto_407335 ?auto_407345 ) ) ( not ( = ?auto_407335 ?auto_407346 ) ) ( not ( = ?auto_407335 ?auto_407347 ) ) ( not ( = ?auto_407335 ?auto_407348 ) ) ( not ( = ?auto_407335 ?auto_407349 ) ) ( not ( = ?auto_407336 ?auto_407337 ) ) ( not ( = ?auto_407336 ?auto_407338 ) ) ( not ( = ?auto_407336 ?auto_407339 ) ) ( not ( = ?auto_407336 ?auto_407340 ) ) ( not ( = ?auto_407336 ?auto_407341 ) ) ( not ( = ?auto_407336 ?auto_407342 ) ) ( not ( = ?auto_407336 ?auto_407343 ) ) ( not ( = ?auto_407336 ?auto_407344 ) ) ( not ( = ?auto_407336 ?auto_407345 ) ) ( not ( = ?auto_407336 ?auto_407346 ) ) ( not ( = ?auto_407336 ?auto_407347 ) ) ( not ( = ?auto_407336 ?auto_407348 ) ) ( not ( = ?auto_407336 ?auto_407349 ) ) ( not ( = ?auto_407337 ?auto_407338 ) ) ( not ( = ?auto_407337 ?auto_407339 ) ) ( not ( = ?auto_407337 ?auto_407340 ) ) ( not ( = ?auto_407337 ?auto_407341 ) ) ( not ( = ?auto_407337 ?auto_407342 ) ) ( not ( = ?auto_407337 ?auto_407343 ) ) ( not ( = ?auto_407337 ?auto_407344 ) ) ( not ( = ?auto_407337 ?auto_407345 ) ) ( not ( = ?auto_407337 ?auto_407346 ) ) ( not ( = ?auto_407337 ?auto_407347 ) ) ( not ( = ?auto_407337 ?auto_407348 ) ) ( not ( = ?auto_407337 ?auto_407349 ) ) ( not ( = ?auto_407338 ?auto_407339 ) ) ( not ( = ?auto_407338 ?auto_407340 ) ) ( not ( = ?auto_407338 ?auto_407341 ) ) ( not ( = ?auto_407338 ?auto_407342 ) ) ( not ( = ?auto_407338 ?auto_407343 ) ) ( not ( = ?auto_407338 ?auto_407344 ) ) ( not ( = ?auto_407338 ?auto_407345 ) ) ( not ( = ?auto_407338 ?auto_407346 ) ) ( not ( = ?auto_407338 ?auto_407347 ) ) ( not ( = ?auto_407338 ?auto_407348 ) ) ( not ( = ?auto_407338 ?auto_407349 ) ) ( not ( = ?auto_407339 ?auto_407340 ) ) ( not ( = ?auto_407339 ?auto_407341 ) ) ( not ( = ?auto_407339 ?auto_407342 ) ) ( not ( = ?auto_407339 ?auto_407343 ) ) ( not ( = ?auto_407339 ?auto_407344 ) ) ( not ( = ?auto_407339 ?auto_407345 ) ) ( not ( = ?auto_407339 ?auto_407346 ) ) ( not ( = ?auto_407339 ?auto_407347 ) ) ( not ( = ?auto_407339 ?auto_407348 ) ) ( not ( = ?auto_407339 ?auto_407349 ) ) ( not ( = ?auto_407340 ?auto_407341 ) ) ( not ( = ?auto_407340 ?auto_407342 ) ) ( not ( = ?auto_407340 ?auto_407343 ) ) ( not ( = ?auto_407340 ?auto_407344 ) ) ( not ( = ?auto_407340 ?auto_407345 ) ) ( not ( = ?auto_407340 ?auto_407346 ) ) ( not ( = ?auto_407340 ?auto_407347 ) ) ( not ( = ?auto_407340 ?auto_407348 ) ) ( not ( = ?auto_407340 ?auto_407349 ) ) ( not ( = ?auto_407341 ?auto_407342 ) ) ( not ( = ?auto_407341 ?auto_407343 ) ) ( not ( = ?auto_407341 ?auto_407344 ) ) ( not ( = ?auto_407341 ?auto_407345 ) ) ( not ( = ?auto_407341 ?auto_407346 ) ) ( not ( = ?auto_407341 ?auto_407347 ) ) ( not ( = ?auto_407341 ?auto_407348 ) ) ( not ( = ?auto_407341 ?auto_407349 ) ) ( not ( = ?auto_407342 ?auto_407343 ) ) ( not ( = ?auto_407342 ?auto_407344 ) ) ( not ( = ?auto_407342 ?auto_407345 ) ) ( not ( = ?auto_407342 ?auto_407346 ) ) ( not ( = ?auto_407342 ?auto_407347 ) ) ( not ( = ?auto_407342 ?auto_407348 ) ) ( not ( = ?auto_407342 ?auto_407349 ) ) ( not ( = ?auto_407343 ?auto_407344 ) ) ( not ( = ?auto_407343 ?auto_407345 ) ) ( not ( = ?auto_407343 ?auto_407346 ) ) ( not ( = ?auto_407343 ?auto_407347 ) ) ( not ( = ?auto_407343 ?auto_407348 ) ) ( not ( = ?auto_407343 ?auto_407349 ) ) ( not ( = ?auto_407344 ?auto_407345 ) ) ( not ( = ?auto_407344 ?auto_407346 ) ) ( not ( = ?auto_407344 ?auto_407347 ) ) ( not ( = ?auto_407344 ?auto_407348 ) ) ( not ( = ?auto_407344 ?auto_407349 ) ) ( not ( = ?auto_407345 ?auto_407346 ) ) ( not ( = ?auto_407345 ?auto_407347 ) ) ( not ( = ?auto_407345 ?auto_407348 ) ) ( not ( = ?auto_407345 ?auto_407349 ) ) ( not ( = ?auto_407346 ?auto_407347 ) ) ( not ( = ?auto_407346 ?auto_407348 ) ) ( not ( = ?auto_407346 ?auto_407349 ) ) ( not ( = ?auto_407347 ?auto_407348 ) ) ( not ( = ?auto_407347 ?auto_407349 ) ) ( not ( = ?auto_407348 ?auto_407349 ) ) ( ON ?auto_407348 ?auto_407349 ) ( ON ?auto_407347 ?auto_407348 ) ( ON ?auto_407346 ?auto_407347 ) ( ON ?auto_407345 ?auto_407346 ) ( ON ?auto_407344 ?auto_407345 ) ( ON ?auto_407343 ?auto_407344 ) ( ON ?auto_407342 ?auto_407343 ) ( ON ?auto_407341 ?auto_407342 ) ( ON ?auto_407340 ?auto_407341 ) ( ON ?auto_407339 ?auto_407340 ) ( CLEAR ?auto_407337 ) ( ON ?auto_407338 ?auto_407339 ) ( CLEAR ?auto_407338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_407335 ?auto_407336 ?auto_407337 ?auto_407338 )
      ( MAKE-15PILE ?auto_407335 ?auto_407336 ?auto_407337 ?auto_407338 ?auto_407339 ?auto_407340 ?auto_407341 ?auto_407342 ?auto_407343 ?auto_407344 ?auto_407345 ?auto_407346 ?auto_407347 ?auto_407348 ?auto_407349 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_407365 - BLOCK
      ?auto_407366 - BLOCK
      ?auto_407367 - BLOCK
      ?auto_407368 - BLOCK
      ?auto_407369 - BLOCK
      ?auto_407370 - BLOCK
      ?auto_407371 - BLOCK
      ?auto_407372 - BLOCK
      ?auto_407373 - BLOCK
      ?auto_407374 - BLOCK
      ?auto_407375 - BLOCK
      ?auto_407376 - BLOCK
      ?auto_407377 - BLOCK
      ?auto_407378 - BLOCK
      ?auto_407379 - BLOCK
    )
    :vars
    (
      ?auto_407380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407379 ?auto_407380 ) ( ON-TABLE ?auto_407365 ) ( ON ?auto_407366 ?auto_407365 ) ( not ( = ?auto_407365 ?auto_407366 ) ) ( not ( = ?auto_407365 ?auto_407367 ) ) ( not ( = ?auto_407365 ?auto_407368 ) ) ( not ( = ?auto_407365 ?auto_407369 ) ) ( not ( = ?auto_407365 ?auto_407370 ) ) ( not ( = ?auto_407365 ?auto_407371 ) ) ( not ( = ?auto_407365 ?auto_407372 ) ) ( not ( = ?auto_407365 ?auto_407373 ) ) ( not ( = ?auto_407365 ?auto_407374 ) ) ( not ( = ?auto_407365 ?auto_407375 ) ) ( not ( = ?auto_407365 ?auto_407376 ) ) ( not ( = ?auto_407365 ?auto_407377 ) ) ( not ( = ?auto_407365 ?auto_407378 ) ) ( not ( = ?auto_407365 ?auto_407379 ) ) ( not ( = ?auto_407365 ?auto_407380 ) ) ( not ( = ?auto_407366 ?auto_407367 ) ) ( not ( = ?auto_407366 ?auto_407368 ) ) ( not ( = ?auto_407366 ?auto_407369 ) ) ( not ( = ?auto_407366 ?auto_407370 ) ) ( not ( = ?auto_407366 ?auto_407371 ) ) ( not ( = ?auto_407366 ?auto_407372 ) ) ( not ( = ?auto_407366 ?auto_407373 ) ) ( not ( = ?auto_407366 ?auto_407374 ) ) ( not ( = ?auto_407366 ?auto_407375 ) ) ( not ( = ?auto_407366 ?auto_407376 ) ) ( not ( = ?auto_407366 ?auto_407377 ) ) ( not ( = ?auto_407366 ?auto_407378 ) ) ( not ( = ?auto_407366 ?auto_407379 ) ) ( not ( = ?auto_407366 ?auto_407380 ) ) ( not ( = ?auto_407367 ?auto_407368 ) ) ( not ( = ?auto_407367 ?auto_407369 ) ) ( not ( = ?auto_407367 ?auto_407370 ) ) ( not ( = ?auto_407367 ?auto_407371 ) ) ( not ( = ?auto_407367 ?auto_407372 ) ) ( not ( = ?auto_407367 ?auto_407373 ) ) ( not ( = ?auto_407367 ?auto_407374 ) ) ( not ( = ?auto_407367 ?auto_407375 ) ) ( not ( = ?auto_407367 ?auto_407376 ) ) ( not ( = ?auto_407367 ?auto_407377 ) ) ( not ( = ?auto_407367 ?auto_407378 ) ) ( not ( = ?auto_407367 ?auto_407379 ) ) ( not ( = ?auto_407367 ?auto_407380 ) ) ( not ( = ?auto_407368 ?auto_407369 ) ) ( not ( = ?auto_407368 ?auto_407370 ) ) ( not ( = ?auto_407368 ?auto_407371 ) ) ( not ( = ?auto_407368 ?auto_407372 ) ) ( not ( = ?auto_407368 ?auto_407373 ) ) ( not ( = ?auto_407368 ?auto_407374 ) ) ( not ( = ?auto_407368 ?auto_407375 ) ) ( not ( = ?auto_407368 ?auto_407376 ) ) ( not ( = ?auto_407368 ?auto_407377 ) ) ( not ( = ?auto_407368 ?auto_407378 ) ) ( not ( = ?auto_407368 ?auto_407379 ) ) ( not ( = ?auto_407368 ?auto_407380 ) ) ( not ( = ?auto_407369 ?auto_407370 ) ) ( not ( = ?auto_407369 ?auto_407371 ) ) ( not ( = ?auto_407369 ?auto_407372 ) ) ( not ( = ?auto_407369 ?auto_407373 ) ) ( not ( = ?auto_407369 ?auto_407374 ) ) ( not ( = ?auto_407369 ?auto_407375 ) ) ( not ( = ?auto_407369 ?auto_407376 ) ) ( not ( = ?auto_407369 ?auto_407377 ) ) ( not ( = ?auto_407369 ?auto_407378 ) ) ( not ( = ?auto_407369 ?auto_407379 ) ) ( not ( = ?auto_407369 ?auto_407380 ) ) ( not ( = ?auto_407370 ?auto_407371 ) ) ( not ( = ?auto_407370 ?auto_407372 ) ) ( not ( = ?auto_407370 ?auto_407373 ) ) ( not ( = ?auto_407370 ?auto_407374 ) ) ( not ( = ?auto_407370 ?auto_407375 ) ) ( not ( = ?auto_407370 ?auto_407376 ) ) ( not ( = ?auto_407370 ?auto_407377 ) ) ( not ( = ?auto_407370 ?auto_407378 ) ) ( not ( = ?auto_407370 ?auto_407379 ) ) ( not ( = ?auto_407370 ?auto_407380 ) ) ( not ( = ?auto_407371 ?auto_407372 ) ) ( not ( = ?auto_407371 ?auto_407373 ) ) ( not ( = ?auto_407371 ?auto_407374 ) ) ( not ( = ?auto_407371 ?auto_407375 ) ) ( not ( = ?auto_407371 ?auto_407376 ) ) ( not ( = ?auto_407371 ?auto_407377 ) ) ( not ( = ?auto_407371 ?auto_407378 ) ) ( not ( = ?auto_407371 ?auto_407379 ) ) ( not ( = ?auto_407371 ?auto_407380 ) ) ( not ( = ?auto_407372 ?auto_407373 ) ) ( not ( = ?auto_407372 ?auto_407374 ) ) ( not ( = ?auto_407372 ?auto_407375 ) ) ( not ( = ?auto_407372 ?auto_407376 ) ) ( not ( = ?auto_407372 ?auto_407377 ) ) ( not ( = ?auto_407372 ?auto_407378 ) ) ( not ( = ?auto_407372 ?auto_407379 ) ) ( not ( = ?auto_407372 ?auto_407380 ) ) ( not ( = ?auto_407373 ?auto_407374 ) ) ( not ( = ?auto_407373 ?auto_407375 ) ) ( not ( = ?auto_407373 ?auto_407376 ) ) ( not ( = ?auto_407373 ?auto_407377 ) ) ( not ( = ?auto_407373 ?auto_407378 ) ) ( not ( = ?auto_407373 ?auto_407379 ) ) ( not ( = ?auto_407373 ?auto_407380 ) ) ( not ( = ?auto_407374 ?auto_407375 ) ) ( not ( = ?auto_407374 ?auto_407376 ) ) ( not ( = ?auto_407374 ?auto_407377 ) ) ( not ( = ?auto_407374 ?auto_407378 ) ) ( not ( = ?auto_407374 ?auto_407379 ) ) ( not ( = ?auto_407374 ?auto_407380 ) ) ( not ( = ?auto_407375 ?auto_407376 ) ) ( not ( = ?auto_407375 ?auto_407377 ) ) ( not ( = ?auto_407375 ?auto_407378 ) ) ( not ( = ?auto_407375 ?auto_407379 ) ) ( not ( = ?auto_407375 ?auto_407380 ) ) ( not ( = ?auto_407376 ?auto_407377 ) ) ( not ( = ?auto_407376 ?auto_407378 ) ) ( not ( = ?auto_407376 ?auto_407379 ) ) ( not ( = ?auto_407376 ?auto_407380 ) ) ( not ( = ?auto_407377 ?auto_407378 ) ) ( not ( = ?auto_407377 ?auto_407379 ) ) ( not ( = ?auto_407377 ?auto_407380 ) ) ( not ( = ?auto_407378 ?auto_407379 ) ) ( not ( = ?auto_407378 ?auto_407380 ) ) ( not ( = ?auto_407379 ?auto_407380 ) ) ( ON ?auto_407378 ?auto_407379 ) ( ON ?auto_407377 ?auto_407378 ) ( ON ?auto_407376 ?auto_407377 ) ( ON ?auto_407375 ?auto_407376 ) ( ON ?auto_407374 ?auto_407375 ) ( ON ?auto_407373 ?auto_407374 ) ( ON ?auto_407372 ?auto_407373 ) ( ON ?auto_407371 ?auto_407372 ) ( ON ?auto_407370 ?auto_407371 ) ( ON ?auto_407369 ?auto_407370 ) ( ON ?auto_407368 ?auto_407369 ) ( CLEAR ?auto_407366 ) ( ON ?auto_407367 ?auto_407368 ) ( CLEAR ?auto_407367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_407365 ?auto_407366 ?auto_407367 )
      ( MAKE-15PILE ?auto_407365 ?auto_407366 ?auto_407367 ?auto_407368 ?auto_407369 ?auto_407370 ?auto_407371 ?auto_407372 ?auto_407373 ?auto_407374 ?auto_407375 ?auto_407376 ?auto_407377 ?auto_407378 ?auto_407379 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_407396 - BLOCK
      ?auto_407397 - BLOCK
      ?auto_407398 - BLOCK
      ?auto_407399 - BLOCK
      ?auto_407400 - BLOCK
      ?auto_407401 - BLOCK
      ?auto_407402 - BLOCK
      ?auto_407403 - BLOCK
      ?auto_407404 - BLOCK
      ?auto_407405 - BLOCK
      ?auto_407406 - BLOCK
      ?auto_407407 - BLOCK
      ?auto_407408 - BLOCK
      ?auto_407409 - BLOCK
      ?auto_407410 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_407410 ) ( ON-TABLE ?auto_407396 ) ( ON ?auto_407397 ?auto_407396 ) ( not ( = ?auto_407396 ?auto_407397 ) ) ( not ( = ?auto_407396 ?auto_407398 ) ) ( not ( = ?auto_407396 ?auto_407399 ) ) ( not ( = ?auto_407396 ?auto_407400 ) ) ( not ( = ?auto_407396 ?auto_407401 ) ) ( not ( = ?auto_407396 ?auto_407402 ) ) ( not ( = ?auto_407396 ?auto_407403 ) ) ( not ( = ?auto_407396 ?auto_407404 ) ) ( not ( = ?auto_407396 ?auto_407405 ) ) ( not ( = ?auto_407396 ?auto_407406 ) ) ( not ( = ?auto_407396 ?auto_407407 ) ) ( not ( = ?auto_407396 ?auto_407408 ) ) ( not ( = ?auto_407396 ?auto_407409 ) ) ( not ( = ?auto_407396 ?auto_407410 ) ) ( not ( = ?auto_407397 ?auto_407398 ) ) ( not ( = ?auto_407397 ?auto_407399 ) ) ( not ( = ?auto_407397 ?auto_407400 ) ) ( not ( = ?auto_407397 ?auto_407401 ) ) ( not ( = ?auto_407397 ?auto_407402 ) ) ( not ( = ?auto_407397 ?auto_407403 ) ) ( not ( = ?auto_407397 ?auto_407404 ) ) ( not ( = ?auto_407397 ?auto_407405 ) ) ( not ( = ?auto_407397 ?auto_407406 ) ) ( not ( = ?auto_407397 ?auto_407407 ) ) ( not ( = ?auto_407397 ?auto_407408 ) ) ( not ( = ?auto_407397 ?auto_407409 ) ) ( not ( = ?auto_407397 ?auto_407410 ) ) ( not ( = ?auto_407398 ?auto_407399 ) ) ( not ( = ?auto_407398 ?auto_407400 ) ) ( not ( = ?auto_407398 ?auto_407401 ) ) ( not ( = ?auto_407398 ?auto_407402 ) ) ( not ( = ?auto_407398 ?auto_407403 ) ) ( not ( = ?auto_407398 ?auto_407404 ) ) ( not ( = ?auto_407398 ?auto_407405 ) ) ( not ( = ?auto_407398 ?auto_407406 ) ) ( not ( = ?auto_407398 ?auto_407407 ) ) ( not ( = ?auto_407398 ?auto_407408 ) ) ( not ( = ?auto_407398 ?auto_407409 ) ) ( not ( = ?auto_407398 ?auto_407410 ) ) ( not ( = ?auto_407399 ?auto_407400 ) ) ( not ( = ?auto_407399 ?auto_407401 ) ) ( not ( = ?auto_407399 ?auto_407402 ) ) ( not ( = ?auto_407399 ?auto_407403 ) ) ( not ( = ?auto_407399 ?auto_407404 ) ) ( not ( = ?auto_407399 ?auto_407405 ) ) ( not ( = ?auto_407399 ?auto_407406 ) ) ( not ( = ?auto_407399 ?auto_407407 ) ) ( not ( = ?auto_407399 ?auto_407408 ) ) ( not ( = ?auto_407399 ?auto_407409 ) ) ( not ( = ?auto_407399 ?auto_407410 ) ) ( not ( = ?auto_407400 ?auto_407401 ) ) ( not ( = ?auto_407400 ?auto_407402 ) ) ( not ( = ?auto_407400 ?auto_407403 ) ) ( not ( = ?auto_407400 ?auto_407404 ) ) ( not ( = ?auto_407400 ?auto_407405 ) ) ( not ( = ?auto_407400 ?auto_407406 ) ) ( not ( = ?auto_407400 ?auto_407407 ) ) ( not ( = ?auto_407400 ?auto_407408 ) ) ( not ( = ?auto_407400 ?auto_407409 ) ) ( not ( = ?auto_407400 ?auto_407410 ) ) ( not ( = ?auto_407401 ?auto_407402 ) ) ( not ( = ?auto_407401 ?auto_407403 ) ) ( not ( = ?auto_407401 ?auto_407404 ) ) ( not ( = ?auto_407401 ?auto_407405 ) ) ( not ( = ?auto_407401 ?auto_407406 ) ) ( not ( = ?auto_407401 ?auto_407407 ) ) ( not ( = ?auto_407401 ?auto_407408 ) ) ( not ( = ?auto_407401 ?auto_407409 ) ) ( not ( = ?auto_407401 ?auto_407410 ) ) ( not ( = ?auto_407402 ?auto_407403 ) ) ( not ( = ?auto_407402 ?auto_407404 ) ) ( not ( = ?auto_407402 ?auto_407405 ) ) ( not ( = ?auto_407402 ?auto_407406 ) ) ( not ( = ?auto_407402 ?auto_407407 ) ) ( not ( = ?auto_407402 ?auto_407408 ) ) ( not ( = ?auto_407402 ?auto_407409 ) ) ( not ( = ?auto_407402 ?auto_407410 ) ) ( not ( = ?auto_407403 ?auto_407404 ) ) ( not ( = ?auto_407403 ?auto_407405 ) ) ( not ( = ?auto_407403 ?auto_407406 ) ) ( not ( = ?auto_407403 ?auto_407407 ) ) ( not ( = ?auto_407403 ?auto_407408 ) ) ( not ( = ?auto_407403 ?auto_407409 ) ) ( not ( = ?auto_407403 ?auto_407410 ) ) ( not ( = ?auto_407404 ?auto_407405 ) ) ( not ( = ?auto_407404 ?auto_407406 ) ) ( not ( = ?auto_407404 ?auto_407407 ) ) ( not ( = ?auto_407404 ?auto_407408 ) ) ( not ( = ?auto_407404 ?auto_407409 ) ) ( not ( = ?auto_407404 ?auto_407410 ) ) ( not ( = ?auto_407405 ?auto_407406 ) ) ( not ( = ?auto_407405 ?auto_407407 ) ) ( not ( = ?auto_407405 ?auto_407408 ) ) ( not ( = ?auto_407405 ?auto_407409 ) ) ( not ( = ?auto_407405 ?auto_407410 ) ) ( not ( = ?auto_407406 ?auto_407407 ) ) ( not ( = ?auto_407406 ?auto_407408 ) ) ( not ( = ?auto_407406 ?auto_407409 ) ) ( not ( = ?auto_407406 ?auto_407410 ) ) ( not ( = ?auto_407407 ?auto_407408 ) ) ( not ( = ?auto_407407 ?auto_407409 ) ) ( not ( = ?auto_407407 ?auto_407410 ) ) ( not ( = ?auto_407408 ?auto_407409 ) ) ( not ( = ?auto_407408 ?auto_407410 ) ) ( not ( = ?auto_407409 ?auto_407410 ) ) ( ON ?auto_407409 ?auto_407410 ) ( ON ?auto_407408 ?auto_407409 ) ( ON ?auto_407407 ?auto_407408 ) ( ON ?auto_407406 ?auto_407407 ) ( ON ?auto_407405 ?auto_407406 ) ( ON ?auto_407404 ?auto_407405 ) ( ON ?auto_407403 ?auto_407404 ) ( ON ?auto_407402 ?auto_407403 ) ( ON ?auto_407401 ?auto_407402 ) ( ON ?auto_407400 ?auto_407401 ) ( ON ?auto_407399 ?auto_407400 ) ( CLEAR ?auto_407397 ) ( ON ?auto_407398 ?auto_407399 ) ( CLEAR ?auto_407398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_407396 ?auto_407397 ?auto_407398 )
      ( MAKE-15PILE ?auto_407396 ?auto_407397 ?auto_407398 ?auto_407399 ?auto_407400 ?auto_407401 ?auto_407402 ?auto_407403 ?auto_407404 ?auto_407405 ?auto_407406 ?auto_407407 ?auto_407408 ?auto_407409 ?auto_407410 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_407426 - BLOCK
      ?auto_407427 - BLOCK
      ?auto_407428 - BLOCK
      ?auto_407429 - BLOCK
      ?auto_407430 - BLOCK
      ?auto_407431 - BLOCK
      ?auto_407432 - BLOCK
      ?auto_407433 - BLOCK
      ?auto_407434 - BLOCK
      ?auto_407435 - BLOCK
      ?auto_407436 - BLOCK
      ?auto_407437 - BLOCK
      ?auto_407438 - BLOCK
      ?auto_407439 - BLOCK
      ?auto_407440 - BLOCK
    )
    :vars
    (
      ?auto_407441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407440 ?auto_407441 ) ( ON-TABLE ?auto_407426 ) ( not ( = ?auto_407426 ?auto_407427 ) ) ( not ( = ?auto_407426 ?auto_407428 ) ) ( not ( = ?auto_407426 ?auto_407429 ) ) ( not ( = ?auto_407426 ?auto_407430 ) ) ( not ( = ?auto_407426 ?auto_407431 ) ) ( not ( = ?auto_407426 ?auto_407432 ) ) ( not ( = ?auto_407426 ?auto_407433 ) ) ( not ( = ?auto_407426 ?auto_407434 ) ) ( not ( = ?auto_407426 ?auto_407435 ) ) ( not ( = ?auto_407426 ?auto_407436 ) ) ( not ( = ?auto_407426 ?auto_407437 ) ) ( not ( = ?auto_407426 ?auto_407438 ) ) ( not ( = ?auto_407426 ?auto_407439 ) ) ( not ( = ?auto_407426 ?auto_407440 ) ) ( not ( = ?auto_407426 ?auto_407441 ) ) ( not ( = ?auto_407427 ?auto_407428 ) ) ( not ( = ?auto_407427 ?auto_407429 ) ) ( not ( = ?auto_407427 ?auto_407430 ) ) ( not ( = ?auto_407427 ?auto_407431 ) ) ( not ( = ?auto_407427 ?auto_407432 ) ) ( not ( = ?auto_407427 ?auto_407433 ) ) ( not ( = ?auto_407427 ?auto_407434 ) ) ( not ( = ?auto_407427 ?auto_407435 ) ) ( not ( = ?auto_407427 ?auto_407436 ) ) ( not ( = ?auto_407427 ?auto_407437 ) ) ( not ( = ?auto_407427 ?auto_407438 ) ) ( not ( = ?auto_407427 ?auto_407439 ) ) ( not ( = ?auto_407427 ?auto_407440 ) ) ( not ( = ?auto_407427 ?auto_407441 ) ) ( not ( = ?auto_407428 ?auto_407429 ) ) ( not ( = ?auto_407428 ?auto_407430 ) ) ( not ( = ?auto_407428 ?auto_407431 ) ) ( not ( = ?auto_407428 ?auto_407432 ) ) ( not ( = ?auto_407428 ?auto_407433 ) ) ( not ( = ?auto_407428 ?auto_407434 ) ) ( not ( = ?auto_407428 ?auto_407435 ) ) ( not ( = ?auto_407428 ?auto_407436 ) ) ( not ( = ?auto_407428 ?auto_407437 ) ) ( not ( = ?auto_407428 ?auto_407438 ) ) ( not ( = ?auto_407428 ?auto_407439 ) ) ( not ( = ?auto_407428 ?auto_407440 ) ) ( not ( = ?auto_407428 ?auto_407441 ) ) ( not ( = ?auto_407429 ?auto_407430 ) ) ( not ( = ?auto_407429 ?auto_407431 ) ) ( not ( = ?auto_407429 ?auto_407432 ) ) ( not ( = ?auto_407429 ?auto_407433 ) ) ( not ( = ?auto_407429 ?auto_407434 ) ) ( not ( = ?auto_407429 ?auto_407435 ) ) ( not ( = ?auto_407429 ?auto_407436 ) ) ( not ( = ?auto_407429 ?auto_407437 ) ) ( not ( = ?auto_407429 ?auto_407438 ) ) ( not ( = ?auto_407429 ?auto_407439 ) ) ( not ( = ?auto_407429 ?auto_407440 ) ) ( not ( = ?auto_407429 ?auto_407441 ) ) ( not ( = ?auto_407430 ?auto_407431 ) ) ( not ( = ?auto_407430 ?auto_407432 ) ) ( not ( = ?auto_407430 ?auto_407433 ) ) ( not ( = ?auto_407430 ?auto_407434 ) ) ( not ( = ?auto_407430 ?auto_407435 ) ) ( not ( = ?auto_407430 ?auto_407436 ) ) ( not ( = ?auto_407430 ?auto_407437 ) ) ( not ( = ?auto_407430 ?auto_407438 ) ) ( not ( = ?auto_407430 ?auto_407439 ) ) ( not ( = ?auto_407430 ?auto_407440 ) ) ( not ( = ?auto_407430 ?auto_407441 ) ) ( not ( = ?auto_407431 ?auto_407432 ) ) ( not ( = ?auto_407431 ?auto_407433 ) ) ( not ( = ?auto_407431 ?auto_407434 ) ) ( not ( = ?auto_407431 ?auto_407435 ) ) ( not ( = ?auto_407431 ?auto_407436 ) ) ( not ( = ?auto_407431 ?auto_407437 ) ) ( not ( = ?auto_407431 ?auto_407438 ) ) ( not ( = ?auto_407431 ?auto_407439 ) ) ( not ( = ?auto_407431 ?auto_407440 ) ) ( not ( = ?auto_407431 ?auto_407441 ) ) ( not ( = ?auto_407432 ?auto_407433 ) ) ( not ( = ?auto_407432 ?auto_407434 ) ) ( not ( = ?auto_407432 ?auto_407435 ) ) ( not ( = ?auto_407432 ?auto_407436 ) ) ( not ( = ?auto_407432 ?auto_407437 ) ) ( not ( = ?auto_407432 ?auto_407438 ) ) ( not ( = ?auto_407432 ?auto_407439 ) ) ( not ( = ?auto_407432 ?auto_407440 ) ) ( not ( = ?auto_407432 ?auto_407441 ) ) ( not ( = ?auto_407433 ?auto_407434 ) ) ( not ( = ?auto_407433 ?auto_407435 ) ) ( not ( = ?auto_407433 ?auto_407436 ) ) ( not ( = ?auto_407433 ?auto_407437 ) ) ( not ( = ?auto_407433 ?auto_407438 ) ) ( not ( = ?auto_407433 ?auto_407439 ) ) ( not ( = ?auto_407433 ?auto_407440 ) ) ( not ( = ?auto_407433 ?auto_407441 ) ) ( not ( = ?auto_407434 ?auto_407435 ) ) ( not ( = ?auto_407434 ?auto_407436 ) ) ( not ( = ?auto_407434 ?auto_407437 ) ) ( not ( = ?auto_407434 ?auto_407438 ) ) ( not ( = ?auto_407434 ?auto_407439 ) ) ( not ( = ?auto_407434 ?auto_407440 ) ) ( not ( = ?auto_407434 ?auto_407441 ) ) ( not ( = ?auto_407435 ?auto_407436 ) ) ( not ( = ?auto_407435 ?auto_407437 ) ) ( not ( = ?auto_407435 ?auto_407438 ) ) ( not ( = ?auto_407435 ?auto_407439 ) ) ( not ( = ?auto_407435 ?auto_407440 ) ) ( not ( = ?auto_407435 ?auto_407441 ) ) ( not ( = ?auto_407436 ?auto_407437 ) ) ( not ( = ?auto_407436 ?auto_407438 ) ) ( not ( = ?auto_407436 ?auto_407439 ) ) ( not ( = ?auto_407436 ?auto_407440 ) ) ( not ( = ?auto_407436 ?auto_407441 ) ) ( not ( = ?auto_407437 ?auto_407438 ) ) ( not ( = ?auto_407437 ?auto_407439 ) ) ( not ( = ?auto_407437 ?auto_407440 ) ) ( not ( = ?auto_407437 ?auto_407441 ) ) ( not ( = ?auto_407438 ?auto_407439 ) ) ( not ( = ?auto_407438 ?auto_407440 ) ) ( not ( = ?auto_407438 ?auto_407441 ) ) ( not ( = ?auto_407439 ?auto_407440 ) ) ( not ( = ?auto_407439 ?auto_407441 ) ) ( not ( = ?auto_407440 ?auto_407441 ) ) ( ON ?auto_407439 ?auto_407440 ) ( ON ?auto_407438 ?auto_407439 ) ( ON ?auto_407437 ?auto_407438 ) ( ON ?auto_407436 ?auto_407437 ) ( ON ?auto_407435 ?auto_407436 ) ( ON ?auto_407434 ?auto_407435 ) ( ON ?auto_407433 ?auto_407434 ) ( ON ?auto_407432 ?auto_407433 ) ( ON ?auto_407431 ?auto_407432 ) ( ON ?auto_407430 ?auto_407431 ) ( ON ?auto_407429 ?auto_407430 ) ( ON ?auto_407428 ?auto_407429 ) ( CLEAR ?auto_407426 ) ( ON ?auto_407427 ?auto_407428 ) ( CLEAR ?auto_407427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_407426 ?auto_407427 )
      ( MAKE-15PILE ?auto_407426 ?auto_407427 ?auto_407428 ?auto_407429 ?auto_407430 ?auto_407431 ?auto_407432 ?auto_407433 ?auto_407434 ?auto_407435 ?auto_407436 ?auto_407437 ?auto_407438 ?auto_407439 ?auto_407440 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_407457 - BLOCK
      ?auto_407458 - BLOCK
      ?auto_407459 - BLOCK
      ?auto_407460 - BLOCK
      ?auto_407461 - BLOCK
      ?auto_407462 - BLOCK
      ?auto_407463 - BLOCK
      ?auto_407464 - BLOCK
      ?auto_407465 - BLOCK
      ?auto_407466 - BLOCK
      ?auto_407467 - BLOCK
      ?auto_407468 - BLOCK
      ?auto_407469 - BLOCK
      ?auto_407470 - BLOCK
      ?auto_407471 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_407471 ) ( ON-TABLE ?auto_407457 ) ( not ( = ?auto_407457 ?auto_407458 ) ) ( not ( = ?auto_407457 ?auto_407459 ) ) ( not ( = ?auto_407457 ?auto_407460 ) ) ( not ( = ?auto_407457 ?auto_407461 ) ) ( not ( = ?auto_407457 ?auto_407462 ) ) ( not ( = ?auto_407457 ?auto_407463 ) ) ( not ( = ?auto_407457 ?auto_407464 ) ) ( not ( = ?auto_407457 ?auto_407465 ) ) ( not ( = ?auto_407457 ?auto_407466 ) ) ( not ( = ?auto_407457 ?auto_407467 ) ) ( not ( = ?auto_407457 ?auto_407468 ) ) ( not ( = ?auto_407457 ?auto_407469 ) ) ( not ( = ?auto_407457 ?auto_407470 ) ) ( not ( = ?auto_407457 ?auto_407471 ) ) ( not ( = ?auto_407458 ?auto_407459 ) ) ( not ( = ?auto_407458 ?auto_407460 ) ) ( not ( = ?auto_407458 ?auto_407461 ) ) ( not ( = ?auto_407458 ?auto_407462 ) ) ( not ( = ?auto_407458 ?auto_407463 ) ) ( not ( = ?auto_407458 ?auto_407464 ) ) ( not ( = ?auto_407458 ?auto_407465 ) ) ( not ( = ?auto_407458 ?auto_407466 ) ) ( not ( = ?auto_407458 ?auto_407467 ) ) ( not ( = ?auto_407458 ?auto_407468 ) ) ( not ( = ?auto_407458 ?auto_407469 ) ) ( not ( = ?auto_407458 ?auto_407470 ) ) ( not ( = ?auto_407458 ?auto_407471 ) ) ( not ( = ?auto_407459 ?auto_407460 ) ) ( not ( = ?auto_407459 ?auto_407461 ) ) ( not ( = ?auto_407459 ?auto_407462 ) ) ( not ( = ?auto_407459 ?auto_407463 ) ) ( not ( = ?auto_407459 ?auto_407464 ) ) ( not ( = ?auto_407459 ?auto_407465 ) ) ( not ( = ?auto_407459 ?auto_407466 ) ) ( not ( = ?auto_407459 ?auto_407467 ) ) ( not ( = ?auto_407459 ?auto_407468 ) ) ( not ( = ?auto_407459 ?auto_407469 ) ) ( not ( = ?auto_407459 ?auto_407470 ) ) ( not ( = ?auto_407459 ?auto_407471 ) ) ( not ( = ?auto_407460 ?auto_407461 ) ) ( not ( = ?auto_407460 ?auto_407462 ) ) ( not ( = ?auto_407460 ?auto_407463 ) ) ( not ( = ?auto_407460 ?auto_407464 ) ) ( not ( = ?auto_407460 ?auto_407465 ) ) ( not ( = ?auto_407460 ?auto_407466 ) ) ( not ( = ?auto_407460 ?auto_407467 ) ) ( not ( = ?auto_407460 ?auto_407468 ) ) ( not ( = ?auto_407460 ?auto_407469 ) ) ( not ( = ?auto_407460 ?auto_407470 ) ) ( not ( = ?auto_407460 ?auto_407471 ) ) ( not ( = ?auto_407461 ?auto_407462 ) ) ( not ( = ?auto_407461 ?auto_407463 ) ) ( not ( = ?auto_407461 ?auto_407464 ) ) ( not ( = ?auto_407461 ?auto_407465 ) ) ( not ( = ?auto_407461 ?auto_407466 ) ) ( not ( = ?auto_407461 ?auto_407467 ) ) ( not ( = ?auto_407461 ?auto_407468 ) ) ( not ( = ?auto_407461 ?auto_407469 ) ) ( not ( = ?auto_407461 ?auto_407470 ) ) ( not ( = ?auto_407461 ?auto_407471 ) ) ( not ( = ?auto_407462 ?auto_407463 ) ) ( not ( = ?auto_407462 ?auto_407464 ) ) ( not ( = ?auto_407462 ?auto_407465 ) ) ( not ( = ?auto_407462 ?auto_407466 ) ) ( not ( = ?auto_407462 ?auto_407467 ) ) ( not ( = ?auto_407462 ?auto_407468 ) ) ( not ( = ?auto_407462 ?auto_407469 ) ) ( not ( = ?auto_407462 ?auto_407470 ) ) ( not ( = ?auto_407462 ?auto_407471 ) ) ( not ( = ?auto_407463 ?auto_407464 ) ) ( not ( = ?auto_407463 ?auto_407465 ) ) ( not ( = ?auto_407463 ?auto_407466 ) ) ( not ( = ?auto_407463 ?auto_407467 ) ) ( not ( = ?auto_407463 ?auto_407468 ) ) ( not ( = ?auto_407463 ?auto_407469 ) ) ( not ( = ?auto_407463 ?auto_407470 ) ) ( not ( = ?auto_407463 ?auto_407471 ) ) ( not ( = ?auto_407464 ?auto_407465 ) ) ( not ( = ?auto_407464 ?auto_407466 ) ) ( not ( = ?auto_407464 ?auto_407467 ) ) ( not ( = ?auto_407464 ?auto_407468 ) ) ( not ( = ?auto_407464 ?auto_407469 ) ) ( not ( = ?auto_407464 ?auto_407470 ) ) ( not ( = ?auto_407464 ?auto_407471 ) ) ( not ( = ?auto_407465 ?auto_407466 ) ) ( not ( = ?auto_407465 ?auto_407467 ) ) ( not ( = ?auto_407465 ?auto_407468 ) ) ( not ( = ?auto_407465 ?auto_407469 ) ) ( not ( = ?auto_407465 ?auto_407470 ) ) ( not ( = ?auto_407465 ?auto_407471 ) ) ( not ( = ?auto_407466 ?auto_407467 ) ) ( not ( = ?auto_407466 ?auto_407468 ) ) ( not ( = ?auto_407466 ?auto_407469 ) ) ( not ( = ?auto_407466 ?auto_407470 ) ) ( not ( = ?auto_407466 ?auto_407471 ) ) ( not ( = ?auto_407467 ?auto_407468 ) ) ( not ( = ?auto_407467 ?auto_407469 ) ) ( not ( = ?auto_407467 ?auto_407470 ) ) ( not ( = ?auto_407467 ?auto_407471 ) ) ( not ( = ?auto_407468 ?auto_407469 ) ) ( not ( = ?auto_407468 ?auto_407470 ) ) ( not ( = ?auto_407468 ?auto_407471 ) ) ( not ( = ?auto_407469 ?auto_407470 ) ) ( not ( = ?auto_407469 ?auto_407471 ) ) ( not ( = ?auto_407470 ?auto_407471 ) ) ( ON ?auto_407470 ?auto_407471 ) ( ON ?auto_407469 ?auto_407470 ) ( ON ?auto_407468 ?auto_407469 ) ( ON ?auto_407467 ?auto_407468 ) ( ON ?auto_407466 ?auto_407467 ) ( ON ?auto_407465 ?auto_407466 ) ( ON ?auto_407464 ?auto_407465 ) ( ON ?auto_407463 ?auto_407464 ) ( ON ?auto_407462 ?auto_407463 ) ( ON ?auto_407461 ?auto_407462 ) ( ON ?auto_407460 ?auto_407461 ) ( ON ?auto_407459 ?auto_407460 ) ( CLEAR ?auto_407457 ) ( ON ?auto_407458 ?auto_407459 ) ( CLEAR ?auto_407458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_407457 ?auto_407458 )
      ( MAKE-15PILE ?auto_407457 ?auto_407458 ?auto_407459 ?auto_407460 ?auto_407461 ?auto_407462 ?auto_407463 ?auto_407464 ?auto_407465 ?auto_407466 ?auto_407467 ?auto_407468 ?auto_407469 ?auto_407470 ?auto_407471 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_407487 - BLOCK
      ?auto_407488 - BLOCK
      ?auto_407489 - BLOCK
      ?auto_407490 - BLOCK
      ?auto_407491 - BLOCK
      ?auto_407492 - BLOCK
      ?auto_407493 - BLOCK
      ?auto_407494 - BLOCK
      ?auto_407495 - BLOCK
      ?auto_407496 - BLOCK
      ?auto_407497 - BLOCK
      ?auto_407498 - BLOCK
      ?auto_407499 - BLOCK
      ?auto_407500 - BLOCK
      ?auto_407501 - BLOCK
    )
    :vars
    (
      ?auto_407502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407501 ?auto_407502 ) ( not ( = ?auto_407487 ?auto_407488 ) ) ( not ( = ?auto_407487 ?auto_407489 ) ) ( not ( = ?auto_407487 ?auto_407490 ) ) ( not ( = ?auto_407487 ?auto_407491 ) ) ( not ( = ?auto_407487 ?auto_407492 ) ) ( not ( = ?auto_407487 ?auto_407493 ) ) ( not ( = ?auto_407487 ?auto_407494 ) ) ( not ( = ?auto_407487 ?auto_407495 ) ) ( not ( = ?auto_407487 ?auto_407496 ) ) ( not ( = ?auto_407487 ?auto_407497 ) ) ( not ( = ?auto_407487 ?auto_407498 ) ) ( not ( = ?auto_407487 ?auto_407499 ) ) ( not ( = ?auto_407487 ?auto_407500 ) ) ( not ( = ?auto_407487 ?auto_407501 ) ) ( not ( = ?auto_407487 ?auto_407502 ) ) ( not ( = ?auto_407488 ?auto_407489 ) ) ( not ( = ?auto_407488 ?auto_407490 ) ) ( not ( = ?auto_407488 ?auto_407491 ) ) ( not ( = ?auto_407488 ?auto_407492 ) ) ( not ( = ?auto_407488 ?auto_407493 ) ) ( not ( = ?auto_407488 ?auto_407494 ) ) ( not ( = ?auto_407488 ?auto_407495 ) ) ( not ( = ?auto_407488 ?auto_407496 ) ) ( not ( = ?auto_407488 ?auto_407497 ) ) ( not ( = ?auto_407488 ?auto_407498 ) ) ( not ( = ?auto_407488 ?auto_407499 ) ) ( not ( = ?auto_407488 ?auto_407500 ) ) ( not ( = ?auto_407488 ?auto_407501 ) ) ( not ( = ?auto_407488 ?auto_407502 ) ) ( not ( = ?auto_407489 ?auto_407490 ) ) ( not ( = ?auto_407489 ?auto_407491 ) ) ( not ( = ?auto_407489 ?auto_407492 ) ) ( not ( = ?auto_407489 ?auto_407493 ) ) ( not ( = ?auto_407489 ?auto_407494 ) ) ( not ( = ?auto_407489 ?auto_407495 ) ) ( not ( = ?auto_407489 ?auto_407496 ) ) ( not ( = ?auto_407489 ?auto_407497 ) ) ( not ( = ?auto_407489 ?auto_407498 ) ) ( not ( = ?auto_407489 ?auto_407499 ) ) ( not ( = ?auto_407489 ?auto_407500 ) ) ( not ( = ?auto_407489 ?auto_407501 ) ) ( not ( = ?auto_407489 ?auto_407502 ) ) ( not ( = ?auto_407490 ?auto_407491 ) ) ( not ( = ?auto_407490 ?auto_407492 ) ) ( not ( = ?auto_407490 ?auto_407493 ) ) ( not ( = ?auto_407490 ?auto_407494 ) ) ( not ( = ?auto_407490 ?auto_407495 ) ) ( not ( = ?auto_407490 ?auto_407496 ) ) ( not ( = ?auto_407490 ?auto_407497 ) ) ( not ( = ?auto_407490 ?auto_407498 ) ) ( not ( = ?auto_407490 ?auto_407499 ) ) ( not ( = ?auto_407490 ?auto_407500 ) ) ( not ( = ?auto_407490 ?auto_407501 ) ) ( not ( = ?auto_407490 ?auto_407502 ) ) ( not ( = ?auto_407491 ?auto_407492 ) ) ( not ( = ?auto_407491 ?auto_407493 ) ) ( not ( = ?auto_407491 ?auto_407494 ) ) ( not ( = ?auto_407491 ?auto_407495 ) ) ( not ( = ?auto_407491 ?auto_407496 ) ) ( not ( = ?auto_407491 ?auto_407497 ) ) ( not ( = ?auto_407491 ?auto_407498 ) ) ( not ( = ?auto_407491 ?auto_407499 ) ) ( not ( = ?auto_407491 ?auto_407500 ) ) ( not ( = ?auto_407491 ?auto_407501 ) ) ( not ( = ?auto_407491 ?auto_407502 ) ) ( not ( = ?auto_407492 ?auto_407493 ) ) ( not ( = ?auto_407492 ?auto_407494 ) ) ( not ( = ?auto_407492 ?auto_407495 ) ) ( not ( = ?auto_407492 ?auto_407496 ) ) ( not ( = ?auto_407492 ?auto_407497 ) ) ( not ( = ?auto_407492 ?auto_407498 ) ) ( not ( = ?auto_407492 ?auto_407499 ) ) ( not ( = ?auto_407492 ?auto_407500 ) ) ( not ( = ?auto_407492 ?auto_407501 ) ) ( not ( = ?auto_407492 ?auto_407502 ) ) ( not ( = ?auto_407493 ?auto_407494 ) ) ( not ( = ?auto_407493 ?auto_407495 ) ) ( not ( = ?auto_407493 ?auto_407496 ) ) ( not ( = ?auto_407493 ?auto_407497 ) ) ( not ( = ?auto_407493 ?auto_407498 ) ) ( not ( = ?auto_407493 ?auto_407499 ) ) ( not ( = ?auto_407493 ?auto_407500 ) ) ( not ( = ?auto_407493 ?auto_407501 ) ) ( not ( = ?auto_407493 ?auto_407502 ) ) ( not ( = ?auto_407494 ?auto_407495 ) ) ( not ( = ?auto_407494 ?auto_407496 ) ) ( not ( = ?auto_407494 ?auto_407497 ) ) ( not ( = ?auto_407494 ?auto_407498 ) ) ( not ( = ?auto_407494 ?auto_407499 ) ) ( not ( = ?auto_407494 ?auto_407500 ) ) ( not ( = ?auto_407494 ?auto_407501 ) ) ( not ( = ?auto_407494 ?auto_407502 ) ) ( not ( = ?auto_407495 ?auto_407496 ) ) ( not ( = ?auto_407495 ?auto_407497 ) ) ( not ( = ?auto_407495 ?auto_407498 ) ) ( not ( = ?auto_407495 ?auto_407499 ) ) ( not ( = ?auto_407495 ?auto_407500 ) ) ( not ( = ?auto_407495 ?auto_407501 ) ) ( not ( = ?auto_407495 ?auto_407502 ) ) ( not ( = ?auto_407496 ?auto_407497 ) ) ( not ( = ?auto_407496 ?auto_407498 ) ) ( not ( = ?auto_407496 ?auto_407499 ) ) ( not ( = ?auto_407496 ?auto_407500 ) ) ( not ( = ?auto_407496 ?auto_407501 ) ) ( not ( = ?auto_407496 ?auto_407502 ) ) ( not ( = ?auto_407497 ?auto_407498 ) ) ( not ( = ?auto_407497 ?auto_407499 ) ) ( not ( = ?auto_407497 ?auto_407500 ) ) ( not ( = ?auto_407497 ?auto_407501 ) ) ( not ( = ?auto_407497 ?auto_407502 ) ) ( not ( = ?auto_407498 ?auto_407499 ) ) ( not ( = ?auto_407498 ?auto_407500 ) ) ( not ( = ?auto_407498 ?auto_407501 ) ) ( not ( = ?auto_407498 ?auto_407502 ) ) ( not ( = ?auto_407499 ?auto_407500 ) ) ( not ( = ?auto_407499 ?auto_407501 ) ) ( not ( = ?auto_407499 ?auto_407502 ) ) ( not ( = ?auto_407500 ?auto_407501 ) ) ( not ( = ?auto_407500 ?auto_407502 ) ) ( not ( = ?auto_407501 ?auto_407502 ) ) ( ON ?auto_407500 ?auto_407501 ) ( ON ?auto_407499 ?auto_407500 ) ( ON ?auto_407498 ?auto_407499 ) ( ON ?auto_407497 ?auto_407498 ) ( ON ?auto_407496 ?auto_407497 ) ( ON ?auto_407495 ?auto_407496 ) ( ON ?auto_407494 ?auto_407495 ) ( ON ?auto_407493 ?auto_407494 ) ( ON ?auto_407492 ?auto_407493 ) ( ON ?auto_407491 ?auto_407492 ) ( ON ?auto_407490 ?auto_407491 ) ( ON ?auto_407489 ?auto_407490 ) ( ON ?auto_407488 ?auto_407489 ) ( ON ?auto_407487 ?auto_407488 ) ( CLEAR ?auto_407487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_407487 )
      ( MAKE-15PILE ?auto_407487 ?auto_407488 ?auto_407489 ?auto_407490 ?auto_407491 ?auto_407492 ?auto_407493 ?auto_407494 ?auto_407495 ?auto_407496 ?auto_407497 ?auto_407498 ?auto_407499 ?auto_407500 ?auto_407501 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_407518 - BLOCK
      ?auto_407519 - BLOCK
      ?auto_407520 - BLOCK
      ?auto_407521 - BLOCK
      ?auto_407522 - BLOCK
      ?auto_407523 - BLOCK
      ?auto_407524 - BLOCK
      ?auto_407525 - BLOCK
      ?auto_407526 - BLOCK
      ?auto_407527 - BLOCK
      ?auto_407528 - BLOCK
      ?auto_407529 - BLOCK
      ?auto_407530 - BLOCK
      ?auto_407531 - BLOCK
      ?auto_407532 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_407532 ) ( not ( = ?auto_407518 ?auto_407519 ) ) ( not ( = ?auto_407518 ?auto_407520 ) ) ( not ( = ?auto_407518 ?auto_407521 ) ) ( not ( = ?auto_407518 ?auto_407522 ) ) ( not ( = ?auto_407518 ?auto_407523 ) ) ( not ( = ?auto_407518 ?auto_407524 ) ) ( not ( = ?auto_407518 ?auto_407525 ) ) ( not ( = ?auto_407518 ?auto_407526 ) ) ( not ( = ?auto_407518 ?auto_407527 ) ) ( not ( = ?auto_407518 ?auto_407528 ) ) ( not ( = ?auto_407518 ?auto_407529 ) ) ( not ( = ?auto_407518 ?auto_407530 ) ) ( not ( = ?auto_407518 ?auto_407531 ) ) ( not ( = ?auto_407518 ?auto_407532 ) ) ( not ( = ?auto_407519 ?auto_407520 ) ) ( not ( = ?auto_407519 ?auto_407521 ) ) ( not ( = ?auto_407519 ?auto_407522 ) ) ( not ( = ?auto_407519 ?auto_407523 ) ) ( not ( = ?auto_407519 ?auto_407524 ) ) ( not ( = ?auto_407519 ?auto_407525 ) ) ( not ( = ?auto_407519 ?auto_407526 ) ) ( not ( = ?auto_407519 ?auto_407527 ) ) ( not ( = ?auto_407519 ?auto_407528 ) ) ( not ( = ?auto_407519 ?auto_407529 ) ) ( not ( = ?auto_407519 ?auto_407530 ) ) ( not ( = ?auto_407519 ?auto_407531 ) ) ( not ( = ?auto_407519 ?auto_407532 ) ) ( not ( = ?auto_407520 ?auto_407521 ) ) ( not ( = ?auto_407520 ?auto_407522 ) ) ( not ( = ?auto_407520 ?auto_407523 ) ) ( not ( = ?auto_407520 ?auto_407524 ) ) ( not ( = ?auto_407520 ?auto_407525 ) ) ( not ( = ?auto_407520 ?auto_407526 ) ) ( not ( = ?auto_407520 ?auto_407527 ) ) ( not ( = ?auto_407520 ?auto_407528 ) ) ( not ( = ?auto_407520 ?auto_407529 ) ) ( not ( = ?auto_407520 ?auto_407530 ) ) ( not ( = ?auto_407520 ?auto_407531 ) ) ( not ( = ?auto_407520 ?auto_407532 ) ) ( not ( = ?auto_407521 ?auto_407522 ) ) ( not ( = ?auto_407521 ?auto_407523 ) ) ( not ( = ?auto_407521 ?auto_407524 ) ) ( not ( = ?auto_407521 ?auto_407525 ) ) ( not ( = ?auto_407521 ?auto_407526 ) ) ( not ( = ?auto_407521 ?auto_407527 ) ) ( not ( = ?auto_407521 ?auto_407528 ) ) ( not ( = ?auto_407521 ?auto_407529 ) ) ( not ( = ?auto_407521 ?auto_407530 ) ) ( not ( = ?auto_407521 ?auto_407531 ) ) ( not ( = ?auto_407521 ?auto_407532 ) ) ( not ( = ?auto_407522 ?auto_407523 ) ) ( not ( = ?auto_407522 ?auto_407524 ) ) ( not ( = ?auto_407522 ?auto_407525 ) ) ( not ( = ?auto_407522 ?auto_407526 ) ) ( not ( = ?auto_407522 ?auto_407527 ) ) ( not ( = ?auto_407522 ?auto_407528 ) ) ( not ( = ?auto_407522 ?auto_407529 ) ) ( not ( = ?auto_407522 ?auto_407530 ) ) ( not ( = ?auto_407522 ?auto_407531 ) ) ( not ( = ?auto_407522 ?auto_407532 ) ) ( not ( = ?auto_407523 ?auto_407524 ) ) ( not ( = ?auto_407523 ?auto_407525 ) ) ( not ( = ?auto_407523 ?auto_407526 ) ) ( not ( = ?auto_407523 ?auto_407527 ) ) ( not ( = ?auto_407523 ?auto_407528 ) ) ( not ( = ?auto_407523 ?auto_407529 ) ) ( not ( = ?auto_407523 ?auto_407530 ) ) ( not ( = ?auto_407523 ?auto_407531 ) ) ( not ( = ?auto_407523 ?auto_407532 ) ) ( not ( = ?auto_407524 ?auto_407525 ) ) ( not ( = ?auto_407524 ?auto_407526 ) ) ( not ( = ?auto_407524 ?auto_407527 ) ) ( not ( = ?auto_407524 ?auto_407528 ) ) ( not ( = ?auto_407524 ?auto_407529 ) ) ( not ( = ?auto_407524 ?auto_407530 ) ) ( not ( = ?auto_407524 ?auto_407531 ) ) ( not ( = ?auto_407524 ?auto_407532 ) ) ( not ( = ?auto_407525 ?auto_407526 ) ) ( not ( = ?auto_407525 ?auto_407527 ) ) ( not ( = ?auto_407525 ?auto_407528 ) ) ( not ( = ?auto_407525 ?auto_407529 ) ) ( not ( = ?auto_407525 ?auto_407530 ) ) ( not ( = ?auto_407525 ?auto_407531 ) ) ( not ( = ?auto_407525 ?auto_407532 ) ) ( not ( = ?auto_407526 ?auto_407527 ) ) ( not ( = ?auto_407526 ?auto_407528 ) ) ( not ( = ?auto_407526 ?auto_407529 ) ) ( not ( = ?auto_407526 ?auto_407530 ) ) ( not ( = ?auto_407526 ?auto_407531 ) ) ( not ( = ?auto_407526 ?auto_407532 ) ) ( not ( = ?auto_407527 ?auto_407528 ) ) ( not ( = ?auto_407527 ?auto_407529 ) ) ( not ( = ?auto_407527 ?auto_407530 ) ) ( not ( = ?auto_407527 ?auto_407531 ) ) ( not ( = ?auto_407527 ?auto_407532 ) ) ( not ( = ?auto_407528 ?auto_407529 ) ) ( not ( = ?auto_407528 ?auto_407530 ) ) ( not ( = ?auto_407528 ?auto_407531 ) ) ( not ( = ?auto_407528 ?auto_407532 ) ) ( not ( = ?auto_407529 ?auto_407530 ) ) ( not ( = ?auto_407529 ?auto_407531 ) ) ( not ( = ?auto_407529 ?auto_407532 ) ) ( not ( = ?auto_407530 ?auto_407531 ) ) ( not ( = ?auto_407530 ?auto_407532 ) ) ( not ( = ?auto_407531 ?auto_407532 ) ) ( ON ?auto_407531 ?auto_407532 ) ( ON ?auto_407530 ?auto_407531 ) ( ON ?auto_407529 ?auto_407530 ) ( ON ?auto_407528 ?auto_407529 ) ( ON ?auto_407527 ?auto_407528 ) ( ON ?auto_407526 ?auto_407527 ) ( ON ?auto_407525 ?auto_407526 ) ( ON ?auto_407524 ?auto_407525 ) ( ON ?auto_407523 ?auto_407524 ) ( ON ?auto_407522 ?auto_407523 ) ( ON ?auto_407521 ?auto_407522 ) ( ON ?auto_407520 ?auto_407521 ) ( ON ?auto_407519 ?auto_407520 ) ( ON ?auto_407518 ?auto_407519 ) ( CLEAR ?auto_407518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_407518 )
      ( MAKE-15PILE ?auto_407518 ?auto_407519 ?auto_407520 ?auto_407521 ?auto_407522 ?auto_407523 ?auto_407524 ?auto_407525 ?auto_407526 ?auto_407527 ?auto_407528 ?auto_407529 ?auto_407530 ?auto_407531 ?auto_407532 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_407548 - BLOCK
      ?auto_407549 - BLOCK
      ?auto_407550 - BLOCK
      ?auto_407551 - BLOCK
      ?auto_407552 - BLOCK
      ?auto_407553 - BLOCK
      ?auto_407554 - BLOCK
      ?auto_407555 - BLOCK
      ?auto_407556 - BLOCK
      ?auto_407557 - BLOCK
      ?auto_407558 - BLOCK
      ?auto_407559 - BLOCK
      ?auto_407560 - BLOCK
      ?auto_407561 - BLOCK
      ?auto_407562 - BLOCK
    )
    :vars
    (
      ?auto_407563 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_407548 ?auto_407549 ) ) ( not ( = ?auto_407548 ?auto_407550 ) ) ( not ( = ?auto_407548 ?auto_407551 ) ) ( not ( = ?auto_407548 ?auto_407552 ) ) ( not ( = ?auto_407548 ?auto_407553 ) ) ( not ( = ?auto_407548 ?auto_407554 ) ) ( not ( = ?auto_407548 ?auto_407555 ) ) ( not ( = ?auto_407548 ?auto_407556 ) ) ( not ( = ?auto_407548 ?auto_407557 ) ) ( not ( = ?auto_407548 ?auto_407558 ) ) ( not ( = ?auto_407548 ?auto_407559 ) ) ( not ( = ?auto_407548 ?auto_407560 ) ) ( not ( = ?auto_407548 ?auto_407561 ) ) ( not ( = ?auto_407548 ?auto_407562 ) ) ( not ( = ?auto_407549 ?auto_407550 ) ) ( not ( = ?auto_407549 ?auto_407551 ) ) ( not ( = ?auto_407549 ?auto_407552 ) ) ( not ( = ?auto_407549 ?auto_407553 ) ) ( not ( = ?auto_407549 ?auto_407554 ) ) ( not ( = ?auto_407549 ?auto_407555 ) ) ( not ( = ?auto_407549 ?auto_407556 ) ) ( not ( = ?auto_407549 ?auto_407557 ) ) ( not ( = ?auto_407549 ?auto_407558 ) ) ( not ( = ?auto_407549 ?auto_407559 ) ) ( not ( = ?auto_407549 ?auto_407560 ) ) ( not ( = ?auto_407549 ?auto_407561 ) ) ( not ( = ?auto_407549 ?auto_407562 ) ) ( not ( = ?auto_407550 ?auto_407551 ) ) ( not ( = ?auto_407550 ?auto_407552 ) ) ( not ( = ?auto_407550 ?auto_407553 ) ) ( not ( = ?auto_407550 ?auto_407554 ) ) ( not ( = ?auto_407550 ?auto_407555 ) ) ( not ( = ?auto_407550 ?auto_407556 ) ) ( not ( = ?auto_407550 ?auto_407557 ) ) ( not ( = ?auto_407550 ?auto_407558 ) ) ( not ( = ?auto_407550 ?auto_407559 ) ) ( not ( = ?auto_407550 ?auto_407560 ) ) ( not ( = ?auto_407550 ?auto_407561 ) ) ( not ( = ?auto_407550 ?auto_407562 ) ) ( not ( = ?auto_407551 ?auto_407552 ) ) ( not ( = ?auto_407551 ?auto_407553 ) ) ( not ( = ?auto_407551 ?auto_407554 ) ) ( not ( = ?auto_407551 ?auto_407555 ) ) ( not ( = ?auto_407551 ?auto_407556 ) ) ( not ( = ?auto_407551 ?auto_407557 ) ) ( not ( = ?auto_407551 ?auto_407558 ) ) ( not ( = ?auto_407551 ?auto_407559 ) ) ( not ( = ?auto_407551 ?auto_407560 ) ) ( not ( = ?auto_407551 ?auto_407561 ) ) ( not ( = ?auto_407551 ?auto_407562 ) ) ( not ( = ?auto_407552 ?auto_407553 ) ) ( not ( = ?auto_407552 ?auto_407554 ) ) ( not ( = ?auto_407552 ?auto_407555 ) ) ( not ( = ?auto_407552 ?auto_407556 ) ) ( not ( = ?auto_407552 ?auto_407557 ) ) ( not ( = ?auto_407552 ?auto_407558 ) ) ( not ( = ?auto_407552 ?auto_407559 ) ) ( not ( = ?auto_407552 ?auto_407560 ) ) ( not ( = ?auto_407552 ?auto_407561 ) ) ( not ( = ?auto_407552 ?auto_407562 ) ) ( not ( = ?auto_407553 ?auto_407554 ) ) ( not ( = ?auto_407553 ?auto_407555 ) ) ( not ( = ?auto_407553 ?auto_407556 ) ) ( not ( = ?auto_407553 ?auto_407557 ) ) ( not ( = ?auto_407553 ?auto_407558 ) ) ( not ( = ?auto_407553 ?auto_407559 ) ) ( not ( = ?auto_407553 ?auto_407560 ) ) ( not ( = ?auto_407553 ?auto_407561 ) ) ( not ( = ?auto_407553 ?auto_407562 ) ) ( not ( = ?auto_407554 ?auto_407555 ) ) ( not ( = ?auto_407554 ?auto_407556 ) ) ( not ( = ?auto_407554 ?auto_407557 ) ) ( not ( = ?auto_407554 ?auto_407558 ) ) ( not ( = ?auto_407554 ?auto_407559 ) ) ( not ( = ?auto_407554 ?auto_407560 ) ) ( not ( = ?auto_407554 ?auto_407561 ) ) ( not ( = ?auto_407554 ?auto_407562 ) ) ( not ( = ?auto_407555 ?auto_407556 ) ) ( not ( = ?auto_407555 ?auto_407557 ) ) ( not ( = ?auto_407555 ?auto_407558 ) ) ( not ( = ?auto_407555 ?auto_407559 ) ) ( not ( = ?auto_407555 ?auto_407560 ) ) ( not ( = ?auto_407555 ?auto_407561 ) ) ( not ( = ?auto_407555 ?auto_407562 ) ) ( not ( = ?auto_407556 ?auto_407557 ) ) ( not ( = ?auto_407556 ?auto_407558 ) ) ( not ( = ?auto_407556 ?auto_407559 ) ) ( not ( = ?auto_407556 ?auto_407560 ) ) ( not ( = ?auto_407556 ?auto_407561 ) ) ( not ( = ?auto_407556 ?auto_407562 ) ) ( not ( = ?auto_407557 ?auto_407558 ) ) ( not ( = ?auto_407557 ?auto_407559 ) ) ( not ( = ?auto_407557 ?auto_407560 ) ) ( not ( = ?auto_407557 ?auto_407561 ) ) ( not ( = ?auto_407557 ?auto_407562 ) ) ( not ( = ?auto_407558 ?auto_407559 ) ) ( not ( = ?auto_407558 ?auto_407560 ) ) ( not ( = ?auto_407558 ?auto_407561 ) ) ( not ( = ?auto_407558 ?auto_407562 ) ) ( not ( = ?auto_407559 ?auto_407560 ) ) ( not ( = ?auto_407559 ?auto_407561 ) ) ( not ( = ?auto_407559 ?auto_407562 ) ) ( not ( = ?auto_407560 ?auto_407561 ) ) ( not ( = ?auto_407560 ?auto_407562 ) ) ( not ( = ?auto_407561 ?auto_407562 ) ) ( ON ?auto_407548 ?auto_407563 ) ( not ( = ?auto_407562 ?auto_407563 ) ) ( not ( = ?auto_407561 ?auto_407563 ) ) ( not ( = ?auto_407560 ?auto_407563 ) ) ( not ( = ?auto_407559 ?auto_407563 ) ) ( not ( = ?auto_407558 ?auto_407563 ) ) ( not ( = ?auto_407557 ?auto_407563 ) ) ( not ( = ?auto_407556 ?auto_407563 ) ) ( not ( = ?auto_407555 ?auto_407563 ) ) ( not ( = ?auto_407554 ?auto_407563 ) ) ( not ( = ?auto_407553 ?auto_407563 ) ) ( not ( = ?auto_407552 ?auto_407563 ) ) ( not ( = ?auto_407551 ?auto_407563 ) ) ( not ( = ?auto_407550 ?auto_407563 ) ) ( not ( = ?auto_407549 ?auto_407563 ) ) ( not ( = ?auto_407548 ?auto_407563 ) ) ( ON ?auto_407549 ?auto_407548 ) ( ON ?auto_407550 ?auto_407549 ) ( ON ?auto_407551 ?auto_407550 ) ( ON ?auto_407552 ?auto_407551 ) ( ON ?auto_407553 ?auto_407552 ) ( ON ?auto_407554 ?auto_407553 ) ( ON ?auto_407555 ?auto_407554 ) ( ON ?auto_407556 ?auto_407555 ) ( ON ?auto_407557 ?auto_407556 ) ( ON ?auto_407558 ?auto_407557 ) ( ON ?auto_407559 ?auto_407558 ) ( ON ?auto_407560 ?auto_407559 ) ( ON ?auto_407561 ?auto_407560 ) ( ON ?auto_407562 ?auto_407561 ) ( CLEAR ?auto_407562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_407562 ?auto_407561 ?auto_407560 ?auto_407559 ?auto_407558 ?auto_407557 ?auto_407556 ?auto_407555 ?auto_407554 ?auto_407553 ?auto_407552 ?auto_407551 ?auto_407550 ?auto_407549 ?auto_407548 )
      ( MAKE-15PILE ?auto_407548 ?auto_407549 ?auto_407550 ?auto_407551 ?auto_407552 ?auto_407553 ?auto_407554 ?auto_407555 ?auto_407556 ?auto_407557 ?auto_407558 ?auto_407559 ?auto_407560 ?auto_407561 ?auto_407562 ) )
  )

)

