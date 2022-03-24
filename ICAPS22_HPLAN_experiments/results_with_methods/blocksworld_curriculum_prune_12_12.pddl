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
      ?auto_183329 - BLOCK
    )
    :vars
    (
      ?auto_183330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183329 ?auto_183330 ) ( CLEAR ?auto_183329 ) ( HAND-EMPTY ) ( not ( = ?auto_183329 ?auto_183330 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183329 ?auto_183330 )
      ( !PUTDOWN ?auto_183329 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_183336 - BLOCK
      ?auto_183337 - BLOCK
    )
    :vars
    (
      ?auto_183338 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_183336 ) ( ON ?auto_183337 ?auto_183338 ) ( CLEAR ?auto_183337 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183336 ) ( not ( = ?auto_183336 ?auto_183337 ) ) ( not ( = ?auto_183336 ?auto_183338 ) ) ( not ( = ?auto_183337 ?auto_183338 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183337 ?auto_183338 )
      ( !STACK ?auto_183337 ?auto_183336 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_183346 - BLOCK
      ?auto_183347 - BLOCK
    )
    :vars
    (
      ?auto_183348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183347 ?auto_183348 ) ( not ( = ?auto_183346 ?auto_183347 ) ) ( not ( = ?auto_183346 ?auto_183348 ) ) ( not ( = ?auto_183347 ?auto_183348 ) ) ( ON ?auto_183346 ?auto_183347 ) ( CLEAR ?auto_183346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183346 )
      ( MAKE-2PILE ?auto_183346 ?auto_183347 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_183357 - BLOCK
      ?auto_183358 - BLOCK
      ?auto_183359 - BLOCK
    )
    :vars
    (
      ?auto_183360 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_183358 ) ( ON ?auto_183359 ?auto_183360 ) ( CLEAR ?auto_183359 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183357 ) ( ON ?auto_183358 ?auto_183357 ) ( not ( = ?auto_183357 ?auto_183358 ) ) ( not ( = ?auto_183357 ?auto_183359 ) ) ( not ( = ?auto_183357 ?auto_183360 ) ) ( not ( = ?auto_183358 ?auto_183359 ) ) ( not ( = ?auto_183358 ?auto_183360 ) ) ( not ( = ?auto_183359 ?auto_183360 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183359 ?auto_183360 )
      ( !STACK ?auto_183359 ?auto_183358 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_183371 - BLOCK
      ?auto_183372 - BLOCK
      ?auto_183373 - BLOCK
    )
    :vars
    (
      ?auto_183374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183373 ?auto_183374 ) ( ON-TABLE ?auto_183371 ) ( not ( = ?auto_183371 ?auto_183372 ) ) ( not ( = ?auto_183371 ?auto_183373 ) ) ( not ( = ?auto_183371 ?auto_183374 ) ) ( not ( = ?auto_183372 ?auto_183373 ) ) ( not ( = ?auto_183372 ?auto_183374 ) ) ( not ( = ?auto_183373 ?auto_183374 ) ) ( CLEAR ?auto_183371 ) ( ON ?auto_183372 ?auto_183373 ) ( CLEAR ?auto_183372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183371 ?auto_183372 )
      ( MAKE-3PILE ?auto_183371 ?auto_183372 ?auto_183373 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_183385 - BLOCK
      ?auto_183386 - BLOCK
      ?auto_183387 - BLOCK
    )
    :vars
    (
      ?auto_183388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183387 ?auto_183388 ) ( not ( = ?auto_183385 ?auto_183386 ) ) ( not ( = ?auto_183385 ?auto_183387 ) ) ( not ( = ?auto_183385 ?auto_183388 ) ) ( not ( = ?auto_183386 ?auto_183387 ) ) ( not ( = ?auto_183386 ?auto_183388 ) ) ( not ( = ?auto_183387 ?auto_183388 ) ) ( ON ?auto_183386 ?auto_183387 ) ( ON ?auto_183385 ?auto_183386 ) ( CLEAR ?auto_183385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183385 )
      ( MAKE-3PILE ?auto_183385 ?auto_183386 ?auto_183387 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_183400 - BLOCK
      ?auto_183401 - BLOCK
      ?auto_183402 - BLOCK
      ?auto_183403 - BLOCK
    )
    :vars
    (
      ?auto_183404 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_183402 ) ( ON ?auto_183403 ?auto_183404 ) ( CLEAR ?auto_183403 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183400 ) ( ON ?auto_183401 ?auto_183400 ) ( ON ?auto_183402 ?auto_183401 ) ( not ( = ?auto_183400 ?auto_183401 ) ) ( not ( = ?auto_183400 ?auto_183402 ) ) ( not ( = ?auto_183400 ?auto_183403 ) ) ( not ( = ?auto_183400 ?auto_183404 ) ) ( not ( = ?auto_183401 ?auto_183402 ) ) ( not ( = ?auto_183401 ?auto_183403 ) ) ( not ( = ?auto_183401 ?auto_183404 ) ) ( not ( = ?auto_183402 ?auto_183403 ) ) ( not ( = ?auto_183402 ?auto_183404 ) ) ( not ( = ?auto_183403 ?auto_183404 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183403 ?auto_183404 )
      ( !STACK ?auto_183403 ?auto_183402 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_183418 - BLOCK
      ?auto_183419 - BLOCK
      ?auto_183420 - BLOCK
      ?auto_183421 - BLOCK
    )
    :vars
    (
      ?auto_183422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183421 ?auto_183422 ) ( ON-TABLE ?auto_183418 ) ( ON ?auto_183419 ?auto_183418 ) ( not ( = ?auto_183418 ?auto_183419 ) ) ( not ( = ?auto_183418 ?auto_183420 ) ) ( not ( = ?auto_183418 ?auto_183421 ) ) ( not ( = ?auto_183418 ?auto_183422 ) ) ( not ( = ?auto_183419 ?auto_183420 ) ) ( not ( = ?auto_183419 ?auto_183421 ) ) ( not ( = ?auto_183419 ?auto_183422 ) ) ( not ( = ?auto_183420 ?auto_183421 ) ) ( not ( = ?auto_183420 ?auto_183422 ) ) ( not ( = ?auto_183421 ?auto_183422 ) ) ( CLEAR ?auto_183419 ) ( ON ?auto_183420 ?auto_183421 ) ( CLEAR ?auto_183420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183418 ?auto_183419 ?auto_183420 )
      ( MAKE-4PILE ?auto_183418 ?auto_183419 ?auto_183420 ?auto_183421 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_183436 - BLOCK
      ?auto_183437 - BLOCK
      ?auto_183438 - BLOCK
      ?auto_183439 - BLOCK
    )
    :vars
    (
      ?auto_183440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183439 ?auto_183440 ) ( ON-TABLE ?auto_183436 ) ( not ( = ?auto_183436 ?auto_183437 ) ) ( not ( = ?auto_183436 ?auto_183438 ) ) ( not ( = ?auto_183436 ?auto_183439 ) ) ( not ( = ?auto_183436 ?auto_183440 ) ) ( not ( = ?auto_183437 ?auto_183438 ) ) ( not ( = ?auto_183437 ?auto_183439 ) ) ( not ( = ?auto_183437 ?auto_183440 ) ) ( not ( = ?auto_183438 ?auto_183439 ) ) ( not ( = ?auto_183438 ?auto_183440 ) ) ( not ( = ?auto_183439 ?auto_183440 ) ) ( ON ?auto_183438 ?auto_183439 ) ( CLEAR ?auto_183436 ) ( ON ?auto_183437 ?auto_183438 ) ( CLEAR ?auto_183437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183436 ?auto_183437 )
      ( MAKE-4PILE ?auto_183436 ?auto_183437 ?auto_183438 ?auto_183439 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_183454 - BLOCK
      ?auto_183455 - BLOCK
      ?auto_183456 - BLOCK
      ?auto_183457 - BLOCK
    )
    :vars
    (
      ?auto_183458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183457 ?auto_183458 ) ( not ( = ?auto_183454 ?auto_183455 ) ) ( not ( = ?auto_183454 ?auto_183456 ) ) ( not ( = ?auto_183454 ?auto_183457 ) ) ( not ( = ?auto_183454 ?auto_183458 ) ) ( not ( = ?auto_183455 ?auto_183456 ) ) ( not ( = ?auto_183455 ?auto_183457 ) ) ( not ( = ?auto_183455 ?auto_183458 ) ) ( not ( = ?auto_183456 ?auto_183457 ) ) ( not ( = ?auto_183456 ?auto_183458 ) ) ( not ( = ?auto_183457 ?auto_183458 ) ) ( ON ?auto_183456 ?auto_183457 ) ( ON ?auto_183455 ?auto_183456 ) ( ON ?auto_183454 ?auto_183455 ) ( CLEAR ?auto_183454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183454 )
      ( MAKE-4PILE ?auto_183454 ?auto_183455 ?auto_183456 ?auto_183457 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183473 - BLOCK
      ?auto_183474 - BLOCK
      ?auto_183475 - BLOCK
      ?auto_183476 - BLOCK
      ?auto_183477 - BLOCK
    )
    :vars
    (
      ?auto_183478 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_183476 ) ( ON ?auto_183477 ?auto_183478 ) ( CLEAR ?auto_183477 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183473 ) ( ON ?auto_183474 ?auto_183473 ) ( ON ?auto_183475 ?auto_183474 ) ( ON ?auto_183476 ?auto_183475 ) ( not ( = ?auto_183473 ?auto_183474 ) ) ( not ( = ?auto_183473 ?auto_183475 ) ) ( not ( = ?auto_183473 ?auto_183476 ) ) ( not ( = ?auto_183473 ?auto_183477 ) ) ( not ( = ?auto_183473 ?auto_183478 ) ) ( not ( = ?auto_183474 ?auto_183475 ) ) ( not ( = ?auto_183474 ?auto_183476 ) ) ( not ( = ?auto_183474 ?auto_183477 ) ) ( not ( = ?auto_183474 ?auto_183478 ) ) ( not ( = ?auto_183475 ?auto_183476 ) ) ( not ( = ?auto_183475 ?auto_183477 ) ) ( not ( = ?auto_183475 ?auto_183478 ) ) ( not ( = ?auto_183476 ?auto_183477 ) ) ( not ( = ?auto_183476 ?auto_183478 ) ) ( not ( = ?auto_183477 ?auto_183478 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183477 ?auto_183478 )
      ( !STACK ?auto_183477 ?auto_183476 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183495 - BLOCK
      ?auto_183496 - BLOCK
      ?auto_183497 - BLOCK
      ?auto_183498 - BLOCK
      ?auto_183499 - BLOCK
    )
    :vars
    (
      ?auto_183500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183499 ?auto_183500 ) ( ON-TABLE ?auto_183495 ) ( ON ?auto_183496 ?auto_183495 ) ( ON ?auto_183497 ?auto_183496 ) ( not ( = ?auto_183495 ?auto_183496 ) ) ( not ( = ?auto_183495 ?auto_183497 ) ) ( not ( = ?auto_183495 ?auto_183498 ) ) ( not ( = ?auto_183495 ?auto_183499 ) ) ( not ( = ?auto_183495 ?auto_183500 ) ) ( not ( = ?auto_183496 ?auto_183497 ) ) ( not ( = ?auto_183496 ?auto_183498 ) ) ( not ( = ?auto_183496 ?auto_183499 ) ) ( not ( = ?auto_183496 ?auto_183500 ) ) ( not ( = ?auto_183497 ?auto_183498 ) ) ( not ( = ?auto_183497 ?auto_183499 ) ) ( not ( = ?auto_183497 ?auto_183500 ) ) ( not ( = ?auto_183498 ?auto_183499 ) ) ( not ( = ?auto_183498 ?auto_183500 ) ) ( not ( = ?auto_183499 ?auto_183500 ) ) ( CLEAR ?auto_183497 ) ( ON ?auto_183498 ?auto_183499 ) ( CLEAR ?auto_183498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183495 ?auto_183496 ?auto_183497 ?auto_183498 )
      ( MAKE-5PILE ?auto_183495 ?auto_183496 ?auto_183497 ?auto_183498 ?auto_183499 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183517 - BLOCK
      ?auto_183518 - BLOCK
      ?auto_183519 - BLOCK
      ?auto_183520 - BLOCK
      ?auto_183521 - BLOCK
    )
    :vars
    (
      ?auto_183522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183521 ?auto_183522 ) ( ON-TABLE ?auto_183517 ) ( ON ?auto_183518 ?auto_183517 ) ( not ( = ?auto_183517 ?auto_183518 ) ) ( not ( = ?auto_183517 ?auto_183519 ) ) ( not ( = ?auto_183517 ?auto_183520 ) ) ( not ( = ?auto_183517 ?auto_183521 ) ) ( not ( = ?auto_183517 ?auto_183522 ) ) ( not ( = ?auto_183518 ?auto_183519 ) ) ( not ( = ?auto_183518 ?auto_183520 ) ) ( not ( = ?auto_183518 ?auto_183521 ) ) ( not ( = ?auto_183518 ?auto_183522 ) ) ( not ( = ?auto_183519 ?auto_183520 ) ) ( not ( = ?auto_183519 ?auto_183521 ) ) ( not ( = ?auto_183519 ?auto_183522 ) ) ( not ( = ?auto_183520 ?auto_183521 ) ) ( not ( = ?auto_183520 ?auto_183522 ) ) ( not ( = ?auto_183521 ?auto_183522 ) ) ( ON ?auto_183520 ?auto_183521 ) ( CLEAR ?auto_183518 ) ( ON ?auto_183519 ?auto_183520 ) ( CLEAR ?auto_183519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183517 ?auto_183518 ?auto_183519 )
      ( MAKE-5PILE ?auto_183517 ?auto_183518 ?auto_183519 ?auto_183520 ?auto_183521 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183539 - BLOCK
      ?auto_183540 - BLOCK
      ?auto_183541 - BLOCK
      ?auto_183542 - BLOCK
      ?auto_183543 - BLOCK
    )
    :vars
    (
      ?auto_183544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183543 ?auto_183544 ) ( ON-TABLE ?auto_183539 ) ( not ( = ?auto_183539 ?auto_183540 ) ) ( not ( = ?auto_183539 ?auto_183541 ) ) ( not ( = ?auto_183539 ?auto_183542 ) ) ( not ( = ?auto_183539 ?auto_183543 ) ) ( not ( = ?auto_183539 ?auto_183544 ) ) ( not ( = ?auto_183540 ?auto_183541 ) ) ( not ( = ?auto_183540 ?auto_183542 ) ) ( not ( = ?auto_183540 ?auto_183543 ) ) ( not ( = ?auto_183540 ?auto_183544 ) ) ( not ( = ?auto_183541 ?auto_183542 ) ) ( not ( = ?auto_183541 ?auto_183543 ) ) ( not ( = ?auto_183541 ?auto_183544 ) ) ( not ( = ?auto_183542 ?auto_183543 ) ) ( not ( = ?auto_183542 ?auto_183544 ) ) ( not ( = ?auto_183543 ?auto_183544 ) ) ( ON ?auto_183542 ?auto_183543 ) ( ON ?auto_183541 ?auto_183542 ) ( CLEAR ?auto_183539 ) ( ON ?auto_183540 ?auto_183541 ) ( CLEAR ?auto_183540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183539 ?auto_183540 )
      ( MAKE-5PILE ?auto_183539 ?auto_183540 ?auto_183541 ?auto_183542 ?auto_183543 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183561 - BLOCK
      ?auto_183562 - BLOCK
      ?auto_183563 - BLOCK
      ?auto_183564 - BLOCK
      ?auto_183565 - BLOCK
    )
    :vars
    (
      ?auto_183566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183565 ?auto_183566 ) ( not ( = ?auto_183561 ?auto_183562 ) ) ( not ( = ?auto_183561 ?auto_183563 ) ) ( not ( = ?auto_183561 ?auto_183564 ) ) ( not ( = ?auto_183561 ?auto_183565 ) ) ( not ( = ?auto_183561 ?auto_183566 ) ) ( not ( = ?auto_183562 ?auto_183563 ) ) ( not ( = ?auto_183562 ?auto_183564 ) ) ( not ( = ?auto_183562 ?auto_183565 ) ) ( not ( = ?auto_183562 ?auto_183566 ) ) ( not ( = ?auto_183563 ?auto_183564 ) ) ( not ( = ?auto_183563 ?auto_183565 ) ) ( not ( = ?auto_183563 ?auto_183566 ) ) ( not ( = ?auto_183564 ?auto_183565 ) ) ( not ( = ?auto_183564 ?auto_183566 ) ) ( not ( = ?auto_183565 ?auto_183566 ) ) ( ON ?auto_183564 ?auto_183565 ) ( ON ?auto_183563 ?auto_183564 ) ( ON ?auto_183562 ?auto_183563 ) ( ON ?auto_183561 ?auto_183562 ) ( CLEAR ?auto_183561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183561 )
      ( MAKE-5PILE ?auto_183561 ?auto_183562 ?auto_183563 ?auto_183564 ?auto_183565 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183584 - BLOCK
      ?auto_183585 - BLOCK
      ?auto_183586 - BLOCK
      ?auto_183587 - BLOCK
      ?auto_183588 - BLOCK
      ?auto_183589 - BLOCK
    )
    :vars
    (
      ?auto_183590 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_183588 ) ( ON ?auto_183589 ?auto_183590 ) ( CLEAR ?auto_183589 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183584 ) ( ON ?auto_183585 ?auto_183584 ) ( ON ?auto_183586 ?auto_183585 ) ( ON ?auto_183587 ?auto_183586 ) ( ON ?auto_183588 ?auto_183587 ) ( not ( = ?auto_183584 ?auto_183585 ) ) ( not ( = ?auto_183584 ?auto_183586 ) ) ( not ( = ?auto_183584 ?auto_183587 ) ) ( not ( = ?auto_183584 ?auto_183588 ) ) ( not ( = ?auto_183584 ?auto_183589 ) ) ( not ( = ?auto_183584 ?auto_183590 ) ) ( not ( = ?auto_183585 ?auto_183586 ) ) ( not ( = ?auto_183585 ?auto_183587 ) ) ( not ( = ?auto_183585 ?auto_183588 ) ) ( not ( = ?auto_183585 ?auto_183589 ) ) ( not ( = ?auto_183585 ?auto_183590 ) ) ( not ( = ?auto_183586 ?auto_183587 ) ) ( not ( = ?auto_183586 ?auto_183588 ) ) ( not ( = ?auto_183586 ?auto_183589 ) ) ( not ( = ?auto_183586 ?auto_183590 ) ) ( not ( = ?auto_183587 ?auto_183588 ) ) ( not ( = ?auto_183587 ?auto_183589 ) ) ( not ( = ?auto_183587 ?auto_183590 ) ) ( not ( = ?auto_183588 ?auto_183589 ) ) ( not ( = ?auto_183588 ?auto_183590 ) ) ( not ( = ?auto_183589 ?auto_183590 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183589 ?auto_183590 )
      ( !STACK ?auto_183589 ?auto_183588 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183610 - BLOCK
      ?auto_183611 - BLOCK
      ?auto_183612 - BLOCK
      ?auto_183613 - BLOCK
      ?auto_183614 - BLOCK
      ?auto_183615 - BLOCK
    )
    :vars
    (
      ?auto_183616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183615 ?auto_183616 ) ( ON-TABLE ?auto_183610 ) ( ON ?auto_183611 ?auto_183610 ) ( ON ?auto_183612 ?auto_183611 ) ( ON ?auto_183613 ?auto_183612 ) ( not ( = ?auto_183610 ?auto_183611 ) ) ( not ( = ?auto_183610 ?auto_183612 ) ) ( not ( = ?auto_183610 ?auto_183613 ) ) ( not ( = ?auto_183610 ?auto_183614 ) ) ( not ( = ?auto_183610 ?auto_183615 ) ) ( not ( = ?auto_183610 ?auto_183616 ) ) ( not ( = ?auto_183611 ?auto_183612 ) ) ( not ( = ?auto_183611 ?auto_183613 ) ) ( not ( = ?auto_183611 ?auto_183614 ) ) ( not ( = ?auto_183611 ?auto_183615 ) ) ( not ( = ?auto_183611 ?auto_183616 ) ) ( not ( = ?auto_183612 ?auto_183613 ) ) ( not ( = ?auto_183612 ?auto_183614 ) ) ( not ( = ?auto_183612 ?auto_183615 ) ) ( not ( = ?auto_183612 ?auto_183616 ) ) ( not ( = ?auto_183613 ?auto_183614 ) ) ( not ( = ?auto_183613 ?auto_183615 ) ) ( not ( = ?auto_183613 ?auto_183616 ) ) ( not ( = ?auto_183614 ?auto_183615 ) ) ( not ( = ?auto_183614 ?auto_183616 ) ) ( not ( = ?auto_183615 ?auto_183616 ) ) ( CLEAR ?auto_183613 ) ( ON ?auto_183614 ?auto_183615 ) ( CLEAR ?auto_183614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183610 ?auto_183611 ?auto_183612 ?auto_183613 ?auto_183614 )
      ( MAKE-6PILE ?auto_183610 ?auto_183611 ?auto_183612 ?auto_183613 ?auto_183614 ?auto_183615 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183636 - BLOCK
      ?auto_183637 - BLOCK
      ?auto_183638 - BLOCK
      ?auto_183639 - BLOCK
      ?auto_183640 - BLOCK
      ?auto_183641 - BLOCK
    )
    :vars
    (
      ?auto_183642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183641 ?auto_183642 ) ( ON-TABLE ?auto_183636 ) ( ON ?auto_183637 ?auto_183636 ) ( ON ?auto_183638 ?auto_183637 ) ( not ( = ?auto_183636 ?auto_183637 ) ) ( not ( = ?auto_183636 ?auto_183638 ) ) ( not ( = ?auto_183636 ?auto_183639 ) ) ( not ( = ?auto_183636 ?auto_183640 ) ) ( not ( = ?auto_183636 ?auto_183641 ) ) ( not ( = ?auto_183636 ?auto_183642 ) ) ( not ( = ?auto_183637 ?auto_183638 ) ) ( not ( = ?auto_183637 ?auto_183639 ) ) ( not ( = ?auto_183637 ?auto_183640 ) ) ( not ( = ?auto_183637 ?auto_183641 ) ) ( not ( = ?auto_183637 ?auto_183642 ) ) ( not ( = ?auto_183638 ?auto_183639 ) ) ( not ( = ?auto_183638 ?auto_183640 ) ) ( not ( = ?auto_183638 ?auto_183641 ) ) ( not ( = ?auto_183638 ?auto_183642 ) ) ( not ( = ?auto_183639 ?auto_183640 ) ) ( not ( = ?auto_183639 ?auto_183641 ) ) ( not ( = ?auto_183639 ?auto_183642 ) ) ( not ( = ?auto_183640 ?auto_183641 ) ) ( not ( = ?auto_183640 ?auto_183642 ) ) ( not ( = ?auto_183641 ?auto_183642 ) ) ( ON ?auto_183640 ?auto_183641 ) ( CLEAR ?auto_183638 ) ( ON ?auto_183639 ?auto_183640 ) ( CLEAR ?auto_183639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183636 ?auto_183637 ?auto_183638 ?auto_183639 )
      ( MAKE-6PILE ?auto_183636 ?auto_183637 ?auto_183638 ?auto_183639 ?auto_183640 ?auto_183641 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183662 - BLOCK
      ?auto_183663 - BLOCK
      ?auto_183664 - BLOCK
      ?auto_183665 - BLOCK
      ?auto_183666 - BLOCK
      ?auto_183667 - BLOCK
    )
    :vars
    (
      ?auto_183668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183667 ?auto_183668 ) ( ON-TABLE ?auto_183662 ) ( ON ?auto_183663 ?auto_183662 ) ( not ( = ?auto_183662 ?auto_183663 ) ) ( not ( = ?auto_183662 ?auto_183664 ) ) ( not ( = ?auto_183662 ?auto_183665 ) ) ( not ( = ?auto_183662 ?auto_183666 ) ) ( not ( = ?auto_183662 ?auto_183667 ) ) ( not ( = ?auto_183662 ?auto_183668 ) ) ( not ( = ?auto_183663 ?auto_183664 ) ) ( not ( = ?auto_183663 ?auto_183665 ) ) ( not ( = ?auto_183663 ?auto_183666 ) ) ( not ( = ?auto_183663 ?auto_183667 ) ) ( not ( = ?auto_183663 ?auto_183668 ) ) ( not ( = ?auto_183664 ?auto_183665 ) ) ( not ( = ?auto_183664 ?auto_183666 ) ) ( not ( = ?auto_183664 ?auto_183667 ) ) ( not ( = ?auto_183664 ?auto_183668 ) ) ( not ( = ?auto_183665 ?auto_183666 ) ) ( not ( = ?auto_183665 ?auto_183667 ) ) ( not ( = ?auto_183665 ?auto_183668 ) ) ( not ( = ?auto_183666 ?auto_183667 ) ) ( not ( = ?auto_183666 ?auto_183668 ) ) ( not ( = ?auto_183667 ?auto_183668 ) ) ( ON ?auto_183666 ?auto_183667 ) ( ON ?auto_183665 ?auto_183666 ) ( CLEAR ?auto_183663 ) ( ON ?auto_183664 ?auto_183665 ) ( CLEAR ?auto_183664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183662 ?auto_183663 ?auto_183664 )
      ( MAKE-6PILE ?auto_183662 ?auto_183663 ?auto_183664 ?auto_183665 ?auto_183666 ?auto_183667 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183688 - BLOCK
      ?auto_183689 - BLOCK
      ?auto_183690 - BLOCK
      ?auto_183691 - BLOCK
      ?auto_183692 - BLOCK
      ?auto_183693 - BLOCK
    )
    :vars
    (
      ?auto_183694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183693 ?auto_183694 ) ( ON-TABLE ?auto_183688 ) ( not ( = ?auto_183688 ?auto_183689 ) ) ( not ( = ?auto_183688 ?auto_183690 ) ) ( not ( = ?auto_183688 ?auto_183691 ) ) ( not ( = ?auto_183688 ?auto_183692 ) ) ( not ( = ?auto_183688 ?auto_183693 ) ) ( not ( = ?auto_183688 ?auto_183694 ) ) ( not ( = ?auto_183689 ?auto_183690 ) ) ( not ( = ?auto_183689 ?auto_183691 ) ) ( not ( = ?auto_183689 ?auto_183692 ) ) ( not ( = ?auto_183689 ?auto_183693 ) ) ( not ( = ?auto_183689 ?auto_183694 ) ) ( not ( = ?auto_183690 ?auto_183691 ) ) ( not ( = ?auto_183690 ?auto_183692 ) ) ( not ( = ?auto_183690 ?auto_183693 ) ) ( not ( = ?auto_183690 ?auto_183694 ) ) ( not ( = ?auto_183691 ?auto_183692 ) ) ( not ( = ?auto_183691 ?auto_183693 ) ) ( not ( = ?auto_183691 ?auto_183694 ) ) ( not ( = ?auto_183692 ?auto_183693 ) ) ( not ( = ?auto_183692 ?auto_183694 ) ) ( not ( = ?auto_183693 ?auto_183694 ) ) ( ON ?auto_183692 ?auto_183693 ) ( ON ?auto_183691 ?auto_183692 ) ( ON ?auto_183690 ?auto_183691 ) ( CLEAR ?auto_183688 ) ( ON ?auto_183689 ?auto_183690 ) ( CLEAR ?auto_183689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183688 ?auto_183689 )
      ( MAKE-6PILE ?auto_183688 ?auto_183689 ?auto_183690 ?auto_183691 ?auto_183692 ?auto_183693 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183714 - BLOCK
      ?auto_183715 - BLOCK
      ?auto_183716 - BLOCK
      ?auto_183717 - BLOCK
      ?auto_183718 - BLOCK
      ?auto_183719 - BLOCK
    )
    :vars
    (
      ?auto_183720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183719 ?auto_183720 ) ( not ( = ?auto_183714 ?auto_183715 ) ) ( not ( = ?auto_183714 ?auto_183716 ) ) ( not ( = ?auto_183714 ?auto_183717 ) ) ( not ( = ?auto_183714 ?auto_183718 ) ) ( not ( = ?auto_183714 ?auto_183719 ) ) ( not ( = ?auto_183714 ?auto_183720 ) ) ( not ( = ?auto_183715 ?auto_183716 ) ) ( not ( = ?auto_183715 ?auto_183717 ) ) ( not ( = ?auto_183715 ?auto_183718 ) ) ( not ( = ?auto_183715 ?auto_183719 ) ) ( not ( = ?auto_183715 ?auto_183720 ) ) ( not ( = ?auto_183716 ?auto_183717 ) ) ( not ( = ?auto_183716 ?auto_183718 ) ) ( not ( = ?auto_183716 ?auto_183719 ) ) ( not ( = ?auto_183716 ?auto_183720 ) ) ( not ( = ?auto_183717 ?auto_183718 ) ) ( not ( = ?auto_183717 ?auto_183719 ) ) ( not ( = ?auto_183717 ?auto_183720 ) ) ( not ( = ?auto_183718 ?auto_183719 ) ) ( not ( = ?auto_183718 ?auto_183720 ) ) ( not ( = ?auto_183719 ?auto_183720 ) ) ( ON ?auto_183718 ?auto_183719 ) ( ON ?auto_183717 ?auto_183718 ) ( ON ?auto_183716 ?auto_183717 ) ( ON ?auto_183715 ?auto_183716 ) ( ON ?auto_183714 ?auto_183715 ) ( CLEAR ?auto_183714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183714 )
      ( MAKE-6PILE ?auto_183714 ?auto_183715 ?auto_183716 ?auto_183717 ?auto_183718 ?auto_183719 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183741 - BLOCK
      ?auto_183742 - BLOCK
      ?auto_183743 - BLOCK
      ?auto_183744 - BLOCK
      ?auto_183745 - BLOCK
      ?auto_183746 - BLOCK
      ?auto_183747 - BLOCK
    )
    :vars
    (
      ?auto_183748 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_183746 ) ( ON ?auto_183747 ?auto_183748 ) ( CLEAR ?auto_183747 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183741 ) ( ON ?auto_183742 ?auto_183741 ) ( ON ?auto_183743 ?auto_183742 ) ( ON ?auto_183744 ?auto_183743 ) ( ON ?auto_183745 ?auto_183744 ) ( ON ?auto_183746 ?auto_183745 ) ( not ( = ?auto_183741 ?auto_183742 ) ) ( not ( = ?auto_183741 ?auto_183743 ) ) ( not ( = ?auto_183741 ?auto_183744 ) ) ( not ( = ?auto_183741 ?auto_183745 ) ) ( not ( = ?auto_183741 ?auto_183746 ) ) ( not ( = ?auto_183741 ?auto_183747 ) ) ( not ( = ?auto_183741 ?auto_183748 ) ) ( not ( = ?auto_183742 ?auto_183743 ) ) ( not ( = ?auto_183742 ?auto_183744 ) ) ( not ( = ?auto_183742 ?auto_183745 ) ) ( not ( = ?auto_183742 ?auto_183746 ) ) ( not ( = ?auto_183742 ?auto_183747 ) ) ( not ( = ?auto_183742 ?auto_183748 ) ) ( not ( = ?auto_183743 ?auto_183744 ) ) ( not ( = ?auto_183743 ?auto_183745 ) ) ( not ( = ?auto_183743 ?auto_183746 ) ) ( not ( = ?auto_183743 ?auto_183747 ) ) ( not ( = ?auto_183743 ?auto_183748 ) ) ( not ( = ?auto_183744 ?auto_183745 ) ) ( not ( = ?auto_183744 ?auto_183746 ) ) ( not ( = ?auto_183744 ?auto_183747 ) ) ( not ( = ?auto_183744 ?auto_183748 ) ) ( not ( = ?auto_183745 ?auto_183746 ) ) ( not ( = ?auto_183745 ?auto_183747 ) ) ( not ( = ?auto_183745 ?auto_183748 ) ) ( not ( = ?auto_183746 ?auto_183747 ) ) ( not ( = ?auto_183746 ?auto_183748 ) ) ( not ( = ?auto_183747 ?auto_183748 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183747 ?auto_183748 )
      ( !STACK ?auto_183747 ?auto_183746 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183771 - BLOCK
      ?auto_183772 - BLOCK
      ?auto_183773 - BLOCK
      ?auto_183774 - BLOCK
      ?auto_183775 - BLOCK
      ?auto_183776 - BLOCK
      ?auto_183777 - BLOCK
    )
    :vars
    (
      ?auto_183778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183777 ?auto_183778 ) ( ON-TABLE ?auto_183771 ) ( ON ?auto_183772 ?auto_183771 ) ( ON ?auto_183773 ?auto_183772 ) ( ON ?auto_183774 ?auto_183773 ) ( ON ?auto_183775 ?auto_183774 ) ( not ( = ?auto_183771 ?auto_183772 ) ) ( not ( = ?auto_183771 ?auto_183773 ) ) ( not ( = ?auto_183771 ?auto_183774 ) ) ( not ( = ?auto_183771 ?auto_183775 ) ) ( not ( = ?auto_183771 ?auto_183776 ) ) ( not ( = ?auto_183771 ?auto_183777 ) ) ( not ( = ?auto_183771 ?auto_183778 ) ) ( not ( = ?auto_183772 ?auto_183773 ) ) ( not ( = ?auto_183772 ?auto_183774 ) ) ( not ( = ?auto_183772 ?auto_183775 ) ) ( not ( = ?auto_183772 ?auto_183776 ) ) ( not ( = ?auto_183772 ?auto_183777 ) ) ( not ( = ?auto_183772 ?auto_183778 ) ) ( not ( = ?auto_183773 ?auto_183774 ) ) ( not ( = ?auto_183773 ?auto_183775 ) ) ( not ( = ?auto_183773 ?auto_183776 ) ) ( not ( = ?auto_183773 ?auto_183777 ) ) ( not ( = ?auto_183773 ?auto_183778 ) ) ( not ( = ?auto_183774 ?auto_183775 ) ) ( not ( = ?auto_183774 ?auto_183776 ) ) ( not ( = ?auto_183774 ?auto_183777 ) ) ( not ( = ?auto_183774 ?auto_183778 ) ) ( not ( = ?auto_183775 ?auto_183776 ) ) ( not ( = ?auto_183775 ?auto_183777 ) ) ( not ( = ?auto_183775 ?auto_183778 ) ) ( not ( = ?auto_183776 ?auto_183777 ) ) ( not ( = ?auto_183776 ?auto_183778 ) ) ( not ( = ?auto_183777 ?auto_183778 ) ) ( CLEAR ?auto_183775 ) ( ON ?auto_183776 ?auto_183777 ) ( CLEAR ?auto_183776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183771 ?auto_183772 ?auto_183773 ?auto_183774 ?auto_183775 ?auto_183776 )
      ( MAKE-7PILE ?auto_183771 ?auto_183772 ?auto_183773 ?auto_183774 ?auto_183775 ?auto_183776 ?auto_183777 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183801 - BLOCK
      ?auto_183802 - BLOCK
      ?auto_183803 - BLOCK
      ?auto_183804 - BLOCK
      ?auto_183805 - BLOCK
      ?auto_183806 - BLOCK
      ?auto_183807 - BLOCK
    )
    :vars
    (
      ?auto_183808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183807 ?auto_183808 ) ( ON-TABLE ?auto_183801 ) ( ON ?auto_183802 ?auto_183801 ) ( ON ?auto_183803 ?auto_183802 ) ( ON ?auto_183804 ?auto_183803 ) ( not ( = ?auto_183801 ?auto_183802 ) ) ( not ( = ?auto_183801 ?auto_183803 ) ) ( not ( = ?auto_183801 ?auto_183804 ) ) ( not ( = ?auto_183801 ?auto_183805 ) ) ( not ( = ?auto_183801 ?auto_183806 ) ) ( not ( = ?auto_183801 ?auto_183807 ) ) ( not ( = ?auto_183801 ?auto_183808 ) ) ( not ( = ?auto_183802 ?auto_183803 ) ) ( not ( = ?auto_183802 ?auto_183804 ) ) ( not ( = ?auto_183802 ?auto_183805 ) ) ( not ( = ?auto_183802 ?auto_183806 ) ) ( not ( = ?auto_183802 ?auto_183807 ) ) ( not ( = ?auto_183802 ?auto_183808 ) ) ( not ( = ?auto_183803 ?auto_183804 ) ) ( not ( = ?auto_183803 ?auto_183805 ) ) ( not ( = ?auto_183803 ?auto_183806 ) ) ( not ( = ?auto_183803 ?auto_183807 ) ) ( not ( = ?auto_183803 ?auto_183808 ) ) ( not ( = ?auto_183804 ?auto_183805 ) ) ( not ( = ?auto_183804 ?auto_183806 ) ) ( not ( = ?auto_183804 ?auto_183807 ) ) ( not ( = ?auto_183804 ?auto_183808 ) ) ( not ( = ?auto_183805 ?auto_183806 ) ) ( not ( = ?auto_183805 ?auto_183807 ) ) ( not ( = ?auto_183805 ?auto_183808 ) ) ( not ( = ?auto_183806 ?auto_183807 ) ) ( not ( = ?auto_183806 ?auto_183808 ) ) ( not ( = ?auto_183807 ?auto_183808 ) ) ( ON ?auto_183806 ?auto_183807 ) ( CLEAR ?auto_183804 ) ( ON ?auto_183805 ?auto_183806 ) ( CLEAR ?auto_183805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183801 ?auto_183802 ?auto_183803 ?auto_183804 ?auto_183805 )
      ( MAKE-7PILE ?auto_183801 ?auto_183802 ?auto_183803 ?auto_183804 ?auto_183805 ?auto_183806 ?auto_183807 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183831 - BLOCK
      ?auto_183832 - BLOCK
      ?auto_183833 - BLOCK
      ?auto_183834 - BLOCK
      ?auto_183835 - BLOCK
      ?auto_183836 - BLOCK
      ?auto_183837 - BLOCK
    )
    :vars
    (
      ?auto_183838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183837 ?auto_183838 ) ( ON-TABLE ?auto_183831 ) ( ON ?auto_183832 ?auto_183831 ) ( ON ?auto_183833 ?auto_183832 ) ( not ( = ?auto_183831 ?auto_183832 ) ) ( not ( = ?auto_183831 ?auto_183833 ) ) ( not ( = ?auto_183831 ?auto_183834 ) ) ( not ( = ?auto_183831 ?auto_183835 ) ) ( not ( = ?auto_183831 ?auto_183836 ) ) ( not ( = ?auto_183831 ?auto_183837 ) ) ( not ( = ?auto_183831 ?auto_183838 ) ) ( not ( = ?auto_183832 ?auto_183833 ) ) ( not ( = ?auto_183832 ?auto_183834 ) ) ( not ( = ?auto_183832 ?auto_183835 ) ) ( not ( = ?auto_183832 ?auto_183836 ) ) ( not ( = ?auto_183832 ?auto_183837 ) ) ( not ( = ?auto_183832 ?auto_183838 ) ) ( not ( = ?auto_183833 ?auto_183834 ) ) ( not ( = ?auto_183833 ?auto_183835 ) ) ( not ( = ?auto_183833 ?auto_183836 ) ) ( not ( = ?auto_183833 ?auto_183837 ) ) ( not ( = ?auto_183833 ?auto_183838 ) ) ( not ( = ?auto_183834 ?auto_183835 ) ) ( not ( = ?auto_183834 ?auto_183836 ) ) ( not ( = ?auto_183834 ?auto_183837 ) ) ( not ( = ?auto_183834 ?auto_183838 ) ) ( not ( = ?auto_183835 ?auto_183836 ) ) ( not ( = ?auto_183835 ?auto_183837 ) ) ( not ( = ?auto_183835 ?auto_183838 ) ) ( not ( = ?auto_183836 ?auto_183837 ) ) ( not ( = ?auto_183836 ?auto_183838 ) ) ( not ( = ?auto_183837 ?auto_183838 ) ) ( ON ?auto_183836 ?auto_183837 ) ( ON ?auto_183835 ?auto_183836 ) ( CLEAR ?auto_183833 ) ( ON ?auto_183834 ?auto_183835 ) ( CLEAR ?auto_183834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183831 ?auto_183832 ?auto_183833 ?auto_183834 )
      ( MAKE-7PILE ?auto_183831 ?auto_183832 ?auto_183833 ?auto_183834 ?auto_183835 ?auto_183836 ?auto_183837 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183861 - BLOCK
      ?auto_183862 - BLOCK
      ?auto_183863 - BLOCK
      ?auto_183864 - BLOCK
      ?auto_183865 - BLOCK
      ?auto_183866 - BLOCK
      ?auto_183867 - BLOCK
    )
    :vars
    (
      ?auto_183868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183867 ?auto_183868 ) ( ON-TABLE ?auto_183861 ) ( ON ?auto_183862 ?auto_183861 ) ( not ( = ?auto_183861 ?auto_183862 ) ) ( not ( = ?auto_183861 ?auto_183863 ) ) ( not ( = ?auto_183861 ?auto_183864 ) ) ( not ( = ?auto_183861 ?auto_183865 ) ) ( not ( = ?auto_183861 ?auto_183866 ) ) ( not ( = ?auto_183861 ?auto_183867 ) ) ( not ( = ?auto_183861 ?auto_183868 ) ) ( not ( = ?auto_183862 ?auto_183863 ) ) ( not ( = ?auto_183862 ?auto_183864 ) ) ( not ( = ?auto_183862 ?auto_183865 ) ) ( not ( = ?auto_183862 ?auto_183866 ) ) ( not ( = ?auto_183862 ?auto_183867 ) ) ( not ( = ?auto_183862 ?auto_183868 ) ) ( not ( = ?auto_183863 ?auto_183864 ) ) ( not ( = ?auto_183863 ?auto_183865 ) ) ( not ( = ?auto_183863 ?auto_183866 ) ) ( not ( = ?auto_183863 ?auto_183867 ) ) ( not ( = ?auto_183863 ?auto_183868 ) ) ( not ( = ?auto_183864 ?auto_183865 ) ) ( not ( = ?auto_183864 ?auto_183866 ) ) ( not ( = ?auto_183864 ?auto_183867 ) ) ( not ( = ?auto_183864 ?auto_183868 ) ) ( not ( = ?auto_183865 ?auto_183866 ) ) ( not ( = ?auto_183865 ?auto_183867 ) ) ( not ( = ?auto_183865 ?auto_183868 ) ) ( not ( = ?auto_183866 ?auto_183867 ) ) ( not ( = ?auto_183866 ?auto_183868 ) ) ( not ( = ?auto_183867 ?auto_183868 ) ) ( ON ?auto_183866 ?auto_183867 ) ( ON ?auto_183865 ?auto_183866 ) ( ON ?auto_183864 ?auto_183865 ) ( CLEAR ?auto_183862 ) ( ON ?auto_183863 ?auto_183864 ) ( CLEAR ?auto_183863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183861 ?auto_183862 ?auto_183863 )
      ( MAKE-7PILE ?auto_183861 ?auto_183862 ?auto_183863 ?auto_183864 ?auto_183865 ?auto_183866 ?auto_183867 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183891 - BLOCK
      ?auto_183892 - BLOCK
      ?auto_183893 - BLOCK
      ?auto_183894 - BLOCK
      ?auto_183895 - BLOCK
      ?auto_183896 - BLOCK
      ?auto_183897 - BLOCK
    )
    :vars
    (
      ?auto_183898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183897 ?auto_183898 ) ( ON-TABLE ?auto_183891 ) ( not ( = ?auto_183891 ?auto_183892 ) ) ( not ( = ?auto_183891 ?auto_183893 ) ) ( not ( = ?auto_183891 ?auto_183894 ) ) ( not ( = ?auto_183891 ?auto_183895 ) ) ( not ( = ?auto_183891 ?auto_183896 ) ) ( not ( = ?auto_183891 ?auto_183897 ) ) ( not ( = ?auto_183891 ?auto_183898 ) ) ( not ( = ?auto_183892 ?auto_183893 ) ) ( not ( = ?auto_183892 ?auto_183894 ) ) ( not ( = ?auto_183892 ?auto_183895 ) ) ( not ( = ?auto_183892 ?auto_183896 ) ) ( not ( = ?auto_183892 ?auto_183897 ) ) ( not ( = ?auto_183892 ?auto_183898 ) ) ( not ( = ?auto_183893 ?auto_183894 ) ) ( not ( = ?auto_183893 ?auto_183895 ) ) ( not ( = ?auto_183893 ?auto_183896 ) ) ( not ( = ?auto_183893 ?auto_183897 ) ) ( not ( = ?auto_183893 ?auto_183898 ) ) ( not ( = ?auto_183894 ?auto_183895 ) ) ( not ( = ?auto_183894 ?auto_183896 ) ) ( not ( = ?auto_183894 ?auto_183897 ) ) ( not ( = ?auto_183894 ?auto_183898 ) ) ( not ( = ?auto_183895 ?auto_183896 ) ) ( not ( = ?auto_183895 ?auto_183897 ) ) ( not ( = ?auto_183895 ?auto_183898 ) ) ( not ( = ?auto_183896 ?auto_183897 ) ) ( not ( = ?auto_183896 ?auto_183898 ) ) ( not ( = ?auto_183897 ?auto_183898 ) ) ( ON ?auto_183896 ?auto_183897 ) ( ON ?auto_183895 ?auto_183896 ) ( ON ?auto_183894 ?auto_183895 ) ( ON ?auto_183893 ?auto_183894 ) ( CLEAR ?auto_183891 ) ( ON ?auto_183892 ?auto_183893 ) ( CLEAR ?auto_183892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183891 ?auto_183892 )
      ( MAKE-7PILE ?auto_183891 ?auto_183892 ?auto_183893 ?auto_183894 ?auto_183895 ?auto_183896 ?auto_183897 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183921 - BLOCK
      ?auto_183922 - BLOCK
      ?auto_183923 - BLOCK
      ?auto_183924 - BLOCK
      ?auto_183925 - BLOCK
      ?auto_183926 - BLOCK
      ?auto_183927 - BLOCK
    )
    :vars
    (
      ?auto_183928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183927 ?auto_183928 ) ( not ( = ?auto_183921 ?auto_183922 ) ) ( not ( = ?auto_183921 ?auto_183923 ) ) ( not ( = ?auto_183921 ?auto_183924 ) ) ( not ( = ?auto_183921 ?auto_183925 ) ) ( not ( = ?auto_183921 ?auto_183926 ) ) ( not ( = ?auto_183921 ?auto_183927 ) ) ( not ( = ?auto_183921 ?auto_183928 ) ) ( not ( = ?auto_183922 ?auto_183923 ) ) ( not ( = ?auto_183922 ?auto_183924 ) ) ( not ( = ?auto_183922 ?auto_183925 ) ) ( not ( = ?auto_183922 ?auto_183926 ) ) ( not ( = ?auto_183922 ?auto_183927 ) ) ( not ( = ?auto_183922 ?auto_183928 ) ) ( not ( = ?auto_183923 ?auto_183924 ) ) ( not ( = ?auto_183923 ?auto_183925 ) ) ( not ( = ?auto_183923 ?auto_183926 ) ) ( not ( = ?auto_183923 ?auto_183927 ) ) ( not ( = ?auto_183923 ?auto_183928 ) ) ( not ( = ?auto_183924 ?auto_183925 ) ) ( not ( = ?auto_183924 ?auto_183926 ) ) ( not ( = ?auto_183924 ?auto_183927 ) ) ( not ( = ?auto_183924 ?auto_183928 ) ) ( not ( = ?auto_183925 ?auto_183926 ) ) ( not ( = ?auto_183925 ?auto_183927 ) ) ( not ( = ?auto_183925 ?auto_183928 ) ) ( not ( = ?auto_183926 ?auto_183927 ) ) ( not ( = ?auto_183926 ?auto_183928 ) ) ( not ( = ?auto_183927 ?auto_183928 ) ) ( ON ?auto_183926 ?auto_183927 ) ( ON ?auto_183925 ?auto_183926 ) ( ON ?auto_183924 ?auto_183925 ) ( ON ?auto_183923 ?auto_183924 ) ( ON ?auto_183922 ?auto_183923 ) ( ON ?auto_183921 ?auto_183922 ) ( CLEAR ?auto_183921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183921 )
      ( MAKE-7PILE ?auto_183921 ?auto_183922 ?auto_183923 ?auto_183924 ?auto_183925 ?auto_183926 ?auto_183927 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183952 - BLOCK
      ?auto_183953 - BLOCK
      ?auto_183954 - BLOCK
      ?auto_183955 - BLOCK
      ?auto_183956 - BLOCK
      ?auto_183957 - BLOCK
      ?auto_183958 - BLOCK
      ?auto_183959 - BLOCK
    )
    :vars
    (
      ?auto_183960 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_183958 ) ( ON ?auto_183959 ?auto_183960 ) ( CLEAR ?auto_183959 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183952 ) ( ON ?auto_183953 ?auto_183952 ) ( ON ?auto_183954 ?auto_183953 ) ( ON ?auto_183955 ?auto_183954 ) ( ON ?auto_183956 ?auto_183955 ) ( ON ?auto_183957 ?auto_183956 ) ( ON ?auto_183958 ?auto_183957 ) ( not ( = ?auto_183952 ?auto_183953 ) ) ( not ( = ?auto_183952 ?auto_183954 ) ) ( not ( = ?auto_183952 ?auto_183955 ) ) ( not ( = ?auto_183952 ?auto_183956 ) ) ( not ( = ?auto_183952 ?auto_183957 ) ) ( not ( = ?auto_183952 ?auto_183958 ) ) ( not ( = ?auto_183952 ?auto_183959 ) ) ( not ( = ?auto_183952 ?auto_183960 ) ) ( not ( = ?auto_183953 ?auto_183954 ) ) ( not ( = ?auto_183953 ?auto_183955 ) ) ( not ( = ?auto_183953 ?auto_183956 ) ) ( not ( = ?auto_183953 ?auto_183957 ) ) ( not ( = ?auto_183953 ?auto_183958 ) ) ( not ( = ?auto_183953 ?auto_183959 ) ) ( not ( = ?auto_183953 ?auto_183960 ) ) ( not ( = ?auto_183954 ?auto_183955 ) ) ( not ( = ?auto_183954 ?auto_183956 ) ) ( not ( = ?auto_183954 ?auto_183957 ) ) ( not ( = ?auto_183954 ?auto_183958 ) ) ( not ( = ?auto_183954 ?auto_183959 ) ) ( not ( = ?auto_183954 ?auto_183960 ) ) ( not ( = ?auto_183955 ?auto_183956 ) ) ( not ( = ?auto_183955 ?auto_183957 ) ) ( not ( = ?auto_183955 ?auto_183958 ) ) ( not ( = ?auto_183955 ?auto_183959 ) ) ( not ( = ?auto_183955 ?auto_183960 ) ) ( not ( = ?auto_183956 ?auto_183957 ) ) ( not ( = ?auto_183956 ?auto_183958 ) ) ( not ( = ?auto_183956 ?auto_183959 ) ) ( not ( = ?auto_183956 ?auto_183960 ) ) ( not ( = ?auto_183957 ?auto_183958 ) ) ( not ( = ?auto_183957 ?auto_183959 ) ) ( not ( = ?auto_183957 ?auto_183960 ) ) ( not ( = ?auto_183958 ?auto_183959 ) ) ( not ( = ?auto_183958 ?auto_183960 ) ) ( not ( = ?auto_183959 ?auto_183960 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183959 ?auto_183960 )
      ( !STACK ?auto_183959 ?auto_183958 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_183986 - BLOCK
      ?auto_183987 - BLOCK
      ?auto_183988 - BLOCK
      ?auto_183989 - BLOCK
      ?auto_183990 - BLOCK
      ?auto_183991 - BLOCK
      ?auto_183992 - BLOCK
      ?auto_183993 - BLOCK
    )
    :vars
    (
      ?auto_183994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183993 ?auto_183994 ) ( ON-TABLE ?auto_183986 ) ( ON ?auto_183987 ?auto_183986 ) ( ON ?auto_183988 ?auto_183987 ) ( ON ?auto_183989 ?auto_183988 ) ( ON ?auto_183990 ?auto_183989 ) ( ON ?auto_183991 ?auto_183990 ) ( not ( = ?auto_183986 ?auto_183987 ) ) ( not ( = ?auto_183986 ?auto_183988 ) ) ( not ( = ?auto_183986 ?auto_183989 ) ) ( not ( = ?auto_183986 ?auto_183990 ) ) ( not ( = ?auto_183986 ?auto_183991 ) ) ( not ( = ?auto_183986 ?auto_183992 ) ) ( not ( = ?auto_183986 ?auto_183993 ) ) ( not ( = ?auto_183986 ?auto_183994 ) ) ( not ( = ?auto_183987 ?auto_183988 ) ) ( not ( = ?auto_183987 ?auto_183989 ) ) ( not ( = ?auto_183987 ?auto_183990 ) ) ( not ( = ?auto_183987 ?auto_183991 ) ) ( not ( = ?auto_183987 ?auto_183992 ) ) ( not ( = ?auto_183987 ?auto_183993 ) ) ( not ( = ?auto_183987 ?auto_183994 ) ) ( not ( = ?auto_183988 ?auto_183989 ) ) ( not ( = ?auto_183988 ?auto_183990 ) ) ( not ( = ?auto_183988 ?auto_183991 ) ) ( not ( = ?auto_183988 ?auto_183992 ) ) ( not ( = ?auto_183988 ?auto_183993 ) ) ( not ( = ?auto_183988 ?auto_183994 ) ) ( not ( = ?auto_183989 ?auto_183990 ) ) ( not ( = ?auto_183989 ?auto_183991 ) ) ( not ( = ?auto_183989 ?auto_183992 ) ) ( not ( = ?auto_183989 ?auto_183993 ) ) ( not ( = ?auto_183989 ?auto_183994 ) ) ( not ( = ?auto_183990 ?auto_183991 ) ) ( not ( = ?auto_183990 ?auto_183992 ) ) ( not ( = ?auto_183990 ?auto_183993 ) ) ( not ( = ?auto_183990 ?auto_183994 ) ) ( not ( = ?auto_183991 ?auto_183992 ) ) ( not ( = ?auto_183991 ?auto_183993 ) ) ( not ( = ?auto_183991 ?auto_183994 ) ) ( not ( = ?auto_183992 ?auto_183993 ) ) ( not ( = ?auto_183992 ?auto_183994 ) ) ( not ( = ?auto_183993 ?auto_183994 ) ) ( CLEAR ?auto_183991 ) ( ON ?auto_183992 ?auto_183993 ) ( CLEAR ?auto_183992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183986 ?auto_183987 ?auto_183988 ?auto_183989 ?auto_183990 ?auto_183991 ?auto_183992 )
      ( MAKE-8PILE ?auto_183986 ?auto_183987 ?auto_183988 ?auto_183989 ?auto_183990 ?auto_183991 ?auto_183992 ?auto_183993 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184020 - BLOCK
      ?auto_184021 - BLOCK
      ?auto_184022 - BLOCK
      ?auto_184023 - BLOCK
      ?auto_184024 - BLOCK
      ?auto_184025 - BLOCK
      ?auto_184026 - BLOCK
      ?auto_184027 - BLOCK
    )
    :vars
    (
      ?auto_184028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184027 ?auto_184028 ) ( ON-TABLE ?auto_184020 ) ( ON ?auto_184021 ?auto_184020 ) ( ON ?auto_184022 ?auto_184021 ) ( ON ?auto_184023 ?auto_184022 ) ( ON ?auto_184024 ?auto_184023 ) ( not ( = ?auto_184020 ?auto_184021 ) ) ( not ( = ?auto_184020 ?auto_184022 ) ) ( not ( = ?auto_184020 ?auto_184023 ) ) ( not ( = ?auto_184020 ?auto_184024 ) ) ( not ( = ?auto_184020 ?auto_184025 ) ) ( not ( = ?auto_184020 ?auto_184026 ) ) ( not ( = ?auto_184020 ?auto_184027 ) ) ( not ( = ?auto_184020 ?auto_184028 ) ) ( not ( = ?auto_184021 ?auto_184022 ) ) ( not ( = ?auto_184021 ?auto_184023 ) ) ( not ( = ?auto_184021 ?auto_184024 ) ) ( not ( = ?auto_184021 ?auto_184025 ) ) ( not ( = ?auto_184021 ?auto_184026 ) ) ( not ( = ?auto_184021 ?auto_184027 ) ) ( not ( = ?auto_184021 ?auto_184028 ) ) ( not ( = ?auto_184022 ?auto_184023 ) ) ( not ( = ?auto_184022 ?auto_184024 ) ) ( not ( = ?auto_184022 ?auto_184025 ) ) ( not ( = ?auto_184022 ?auto_184026 ) ) ( not ( = ?auto_184022 ?auto_184027 ) ) ( not ( = ?auto_184022 ?auto_184028 ) ) ( not ( = ?auto_184023 ?auto_184024 ) ) ( not ( = ?auto_184023 ?auto_184025 ) ) ( not ( = ?auto_184023 ?auto_184026 ) ) ( not ( = ?auto_184023 ?auto_184027 ) ) ( not ( = ?auto_184023 ?auto_184028 ) ) ( not ( = ?auto_184024 ?auto_184025 ) ) ( not ( = ?auto_184024 ?auto_184026 ) ) ( not ( = ?auto_184024 ?auto_184027 ) ) ( not ( = ?auto_184024 ?auto_184028 ) ) ( not ( = ?auto_184025 ?auto_184026 ) ) ( not ( = ?auto_184025 ?auto_184027 ) ) ( not ( = ?auto_184025 ?auto_184028 ) ) ( not ( = ?auto_184026 ?auto_184027 ) ) ( not ( = ?auto_184026 ?auto_184028 ) ) ( not ( = ?auto_184027 ?auto_184028 ) ) ( ON ?auto_184026 ?auto_184027 ) ( CLEAR ?auto_184024 ) ( ON ?auto_184025 ?auto_184026 ) ( CLEAR ?auto_184025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184020 ?auto_184021 ?auto_184022 ?auto_184023 ?auto_184024 ?auto_184025 )
      ( MAKE-8PILE ?auto_184020 ?auto_184021 ?auto_184022 ?auto_184023 ?auto_184024 ?auto_184025 ?auto_184026 ?auto_184027 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184054 - BLOCK
      ?auto_184055 - BLOCK
      ?auto_184056 - BLOCK
      ?auto_184057 - BLOCK
      ?auto_184058 - BLOCK
      ?auto_184059 - BLOCK
      ?auto_184060 - BLOCK
      ?auto_184061 - BLOCK
    )
    :vars
    (
      ?auto_184062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184061 ?auto_184062 ) ( ON-TABLE ?auto_184054 ) ( ON ?auto_184055 ?auto_184054 ) ( ON ?auto_184056 ?auto_184055 ) ( ON ?auto_184057 ?auto_184056 ) ( not ( = ?auto_184054 ?auto_184055 ) ) ( not ( = ?auto_184054 ?auto_184056 ) ) ( not ( = ?auto_184054 ?auto_184057 ) ) ( not ( = ?auto_184054 ?auto_184058 ) ) ( not ( = ?auto_184054 ?auto_184059 ) ) ( not ( = ?auto_184054 ?auto_184060 ) ) ( not ( = ?auto_184054 ?auto_184061 ) ) ( not ( = ?auto_184054 ?auto_184062 ) ) ( not ( = ?auto_184055 ?auto_184056 ) ) ( not ( = ?auto_184055 ?auto_184057 ) ) ( not ( = ?auto_184055 ?auto_184058 ) ) ( not ( = ?auto_184055 ?auto_184059 ) ) ( not ( = ?auto_184055 ?auto_184060 ) ) ( not ( = ?auto_184055 ?auto_184061 ) ) ( not ( = ?auto_184055 ?auto_184062 ) ) ( not ( = ?auto_184056 ?auto_184057 ) ) ( not ( = ?auto_184056 ?auto_184058 ) ) ( not ( = ?auto_184056 ?auto_184059 ) ) ( not ( = ?auto_184056 ?auto_184060 ) ) ( not ( = ?auto_184056 ?auto_184061 ) ) ( not ( = ?auto_184056 ?auto_184062 ) ) ( not ( = ?auto_184057 ?auto_184058 ) ) ( not ( = ?auto_184057 ?auto_184059 ) ) ( not ( = ?auto_184057 ?auto_184060 ) ) ( not ( = ?auto_184057 ?auto_184061 ) ) ( not ( = ?auto_184057 ?auto_184062 ) ) ( not ( = ?auto_184058 ?auto_184059 ) ) ( not ( = ?auto_184058 ?auto_184060 ) ) ( not ( = ?auto_184058 ?auto_184061 ) ) ( not ( = ?auto_184058 ?auto_184062 ) ) ( not ( = ?auto_184059 ?auto_184060 ) ) ( not ( = ?auto_184059 ?auto_184061 ) ) ( not ( = ?auto_184059 ?auto_184062 ) ) ( not ( = ?auto_184060 ?auto_184061 ) ) ( not ( = ?auto_184060 ?auto_184062 ) ) ( not ( = ?auto_184061 ?auto_184062 ) ) ( ON ?auto_184060 ?auto_184061 ) ( ON ?auto_184059 ?auto_184060 ) ( CLEAR ?auto_184057 ) ( ON ?auto_184058 ?auto_184059 ) ( CLEAR ?auto_184058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184054 ?auto_184055 ?auto_184056 ?auto_184057 ?auto_184058 )
      ( MAKE-8PILE ?auto_184054 ?auto_184055 ?auto_184056 ?auto_184057 ?auto_184058 ?auto_184059 ?auto_184060 ?auto_184061 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184088 - BLOCK
      ?auto_184089 - BLOCK
      ?auto_184090 - BLOCK
      ?auto_184091 - BLOCK
      ?auto_184092 - BLOCK
      ?auto_184093 - BLOCK
      ?auto_184094 - BLOCK
      ?auto_184095 - BLOCK
    )
    :vars
    (
      ?auto_184096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184095 ?auto_184096 ) ( ON-TABLE ?auto_184088 ) ( ON ?auto_184089 ?auto_184088 ) ( ON ?auto_184090 ?auto_184089 ) ( not ( = ?auto_184088 ?auto_184089 ) ) ( not ( = ?auto_184088 ?auto_184090 ) ) ( not ( = ?auto_184088 ?auto_184091 ) ) ( not ( = ?auto_184088 ?auto_184092 ) ) ( not ( = ?auto_184088 ?auto_184093 ) ) ( not ( = ?auto_184088 ?auto_184094 ) ) ( not ( = ?auto_184088 ?auto_184095 ) ) ( not ( = ?auto_184088 ?auto_184096 ) ) ( not ( = ?auto_184089 ?auto_184090 ) ) ( not ( = ?auto_184089 ?auto_184091 ) ) ( not ( = ?auto_184089 ?auto_184092 ) ) ( not ( = ?auto_184089 ?auto_184093 ) ) ( not ( = ?auto_184089 ?auto_184094 ) ) ( not ( = ?auto_184089 ?auto_184095 ) ) ( not ( = ?auto_184089 ?auto_184096 ) ) ( not ( = ?auto_184090 ?auto_184091 ) ) ( not ( = ?auto_184090 ?auto_184092 ) ) ( not ( = ?auto_184090 ?auto_184093 ) ) ( not ( = ?auto_184090 ?auto_184094 ) ) ( not ( = ?auto_184090 ?auto_184095 ) ) ( not ( = ?auto_184090 ?auto_184096 ) ) ( not ( = ?auto_184091 ?auto_184092 ) ) ( not ( = ?auto_184091 ?auto_184093 ) ) ( not ( = ?auto_184091 ?auto_184094 ) ) ( not ( = ?auto_184091 ?auto_184095 ) ) ( not ( = ?auto_184091 ?auto_184096 ) ) ( not ( = ?auto_184092 ?auto_184093 ) ) ( not ( = ?auto_184092 ?auto_184094 ) ) ( not ( = ?auto_184092 ?auto_184095 ) ) ( not ( = ?auto_184092 ?auto_184096 ) ) ( not ( = ?auto_184093 ?auto_184094 ) ) ( not ( = ?auto_184093 ?auto_184095 ) ) ( not ( = ?auto_184093 ?auto_184096 ) ) ( not ( = ?auto_184094 ?auto_184095 ) ) ( not ( = ?auto_184094 ?auto_184096 ) ) ( not ( = ?auto_184095 ?auto_184096 ) ) ( ON ?auto_184094 ?auto_184095 ) ( ON ?auto_184093 ?auto_184094 ) ( ON ?auto_184092 ?auto_184093 ) ( CLEAR ?auto_184090 ) ( ON ?auto_184091 ?auto_184092 ) ( CLEAR ?auto_184091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184088 ?auto_184089 ?auto_184090 ?auto_184091 )
      ( MAKE-8PILE ?auto_184088 ?auto_184089 ?auto_184090 ?auto_184091 ?auto_184092 ?auto_184093 ?auto_184094 ?auto_184095 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184122 - BLOCK
      ?auto_184123 - BLOCK
      ?auto_184124 - BLOCK
      ?auto_184125 - BLOCK
      ?auto_184126 - BLOCK
      ?auto_184127 - BLOCK
      ?auto_184128 - BLOCK
      ?auto_184129 - BLOCK
    )
    :vars
    (
      ?auto_184130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184129 ?auto_184130 ) ( ON-TABLE ?auto_184122 ) ( ON ?auto_184123 ?auto_184122 ) ( not ( = ?auto_184122 ?auto_184123 ) ) ( not ( = ?auto_184122 ?auto_184124 ) ) ( not ( = ?auto_184122 ?auto_184125 ) ) ( not ( = ?auto_184122 ?auto_184126 ) ) ( not ( = ?auto_184122 ?auto_184127 ) ) ( not ( = ?auto_184122 ?auto_184128 ) ) ( not ( = ?auto_184122 ?auto_184129 ) ) ( not ( = ?auto_184122 ?auto_184130 ) ) ( not ( = ?auto_184123 ?auto_184124 ) ) ( not ( = ?auto_184123 ?auto_184125 ) ) ( not ( = ?auto_184123 ?auto_184126 ) ) ( not ( = ?auto_184123 ?auto_184127 ) ) ( not ( = ?auto_184123 ?auto_184128 ) ) ( not ( = ?auto_184123 ?auto_184129 ) ) ( not ( = ?auto_184123 ?auto_184130 ) ) ( not ( = ?auto_184124 ?auto_184125 ) ) ( not ( = ?auto_184124 ?auto_184126 ) ) ( not ( = ?auto_184124 ?auto_184127 ) ) ( not ( = ?auto_184124 ?auto_184128 ) ) ( not ( = ?auto_184124 ?auto_184129 ) ) ( not ( = ?auto_184124 ?auto_184130 ) ) ( not ( = ?auto_184125 ?auto_184126 ) ) ( not ( = ?auto_184125 ?auto_184127 ) ) ( not ( = ?auto_184125 ?auto_184128 ) ) ( not ( = ?auto_184125 ?auto_184129 ) ) ( not ( = ?auto_184125 ?auto_184130 ) ) ( not ( = ?auto_184126 ?auto_184127 ) ) ( not ( = ?auto_184126 ?auto_184128 ) ) ( not ( = ?auto_184126 ?auto_184129 ) ) ( not ( = ?auto_184126 ?auto_184130 ) ) ( not ( = ?auto_184127 ?auto_184128 ) ) ( not ( = ?auto_184127 ?auto_184129 ) ) ( not ( = ?auto_184127 ?auto_184130 ) ) ( not ( = ?auto_184128 ?auto_184129 ) ) ( not ( = ?auto_184128 ?auto_184130 ) ) ( not ( = ?auto_184129 ?auto_184130 ) ) ( ON ?auto_184128 ?auto_184129 ) ( ON ?auto_184127 ?auto_184128 ) ( ON ?auto_184126 ?auto_184127 ) ( ON ?auto_184125 ?auto_184126 ) ( CLEAR ?auto_184123 ) ( ON ?auto_184124 ?auto_184125 ) ( CLEAR ?auto_184124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184122 ?auto_184123 ?auto_184124 )
      ( MAKE-8PILE ?auto_184122 ?auto_184123 ?auto_184124 ?auto_184125 ?auto_184126 ?auto_184127 ?auto_184128 ?auto_184129 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184156 - BLOCK
      ?auto_184157 - BLOCK
      ?auto_184158 - BLOCK
      ?auto_184159 - BLOCK
      ?auto_184160 - BLOCK
      ?auto_184161 - BLOCK
      ?auto_184162 - BLOCK
      ?auto_184163 - BLOCK
    )
    :vars
    (
      ?auto_184164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184163 ?auto_184164 ) ( ON-TABLE ?auto_184156 ) ( not ( = ?auto_184156 ?auto_184157 ) ) ( not ( = ?auto_184156 ?auto_184158 ) ) ( not ( = ?auto_184156 ?auto_184159 ) ) ( not ( = ?auto_184156 ?auto_184160 ) ) ( not ( = ?auto_184156 ?auto_184161 ) ) ( not ( = ?auto_184156 ?auto_184162 ) ) ( not ( = ?auto_184156 ?auto_184163 ) ) ( not ( = ?auto_184156 ?auto_184164 ) ) ( not ( = ?auto_184157 ?auto_184158 ) ) ( not ( = ?auto_184157 ?auto_184159 ) ) ( not ( = ?auto_184157 ?auto_184160 ) ) ( not ( = ?auto_184157 ?auto_184161 ) ) ( not ( = ?auto_184157 ?auto_184162 ) ) ( not ( = ?auto_184157 ?auto_184163 ) ) ( not ( = ?auto_184157 ?auto_184164 ) ) ( not ( = ?auto_184158 ?auto_184159 ) ) ( not ( = ?auto_184158 ?auto_184160 ) ) ( not ( = ?auto_184158 ?auto_184161 ) ) ( not ( = ?auto_184158 ?auto_184162 ) ) ( not ( = ?auto_184158 ?auto_184163 ) ) ( not ( = ?auto_184158 ?auto_184164 ) ) ( not ( = ?auto_184159 ?auto_184160 ) ) ( not ( = ?auto_184159 ?auto_184161 ) ) ( not ( = ?auto_184159 ?auto_184162 ) ) ( not ( = ?auto_184159 ?auto_184163 ) ) ( not ( = ?auto_184159 ?auto_184164 ) ) ( not ( = ?auto_184160 ?auto_184161 ) ) ( not ( = ?auto_184160 ?auto_184162 ) ) ( not ( = ?auto_184160 ?auto_184163 ) ) ( not ( = ?auto_184160 ?auto_184164 ) ) ( not ( = ?auto_184161 ?auto_184162 ) ) ( not ( = ?auto_184161 ?auto_184163 ) ) ( not ( = ?auto_184161 ?auto_184164 ) ) ( not ( = ?auto_184162 ?auto_184163 ) ) ( not ( = ?auto_184162 ?auto_184164 ) ) ( not ( = ?auto_184163 ?auto_184164 ) ) ( ON ?auto_184162 ?auto_184163 ) ( ON ?auto_184161 ?auto_184162 ) ( ON ?auto_184160 ?auto_184161 ) ( ON ?auto_184159 ?auto_184160 ) ( ON ?auto_184158 ?auto_184159 ) ( CLEAR ?auto_184156 ) ( ON ?auto_184157 ?auto_184158 ) ( CLEAR ?auto_184157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184156 ?auto_184157 )
      ( MAKE-8PILE ?auto_184156 ?auto_184157 ?auto_184158 ?auto_184159 ?auto_184160 ?auto_184161 ?auto_184162 ?auto_184163 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184190 - BLOCK
      ?auto_184191 - BLOCK
      ?auto_184192 - BLOCK
      ?auto_184193 - BLOCK
      ?auto_184194 - BLOCK
      ?auto_184195 - BLOCK
      ?auto_184196 - BLOCK
      ?auto_184197 - BLOCK
    )
    :vars
    (
      ?auto_184198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184197 ?auto_184198 ) ( not ( = ?auto_184190 ?auto_184191 ) ) ( not ( = ?auto_184190 ?auto_184192 ) ) ( not ( = ?auto_184190 ?auto_184193 ) ) ( not ( = ?auto_184190 ?auto_184194 ) ) ( not ( = ?auto_184190 ?auto_184195 ) ) ( not ( = ?auto_184190 ?auto_184196 ) ) ( not ( = ?auto_184190 ?auto_184197 ) ) ( not ( = ?auto_184190 ?auto_184198 ) ) ( not ( = ?auto_184191 ?auto_184192 ) ) ( not ( = ?auto_184191 ?auto_184193 ) ) ( not ( = ?auto_184191 ?auto_184194 ) ) ( not ( = ?auto_184191 ?auto_184195 ) ) ( not ( = ?auto_184191 ?auto_184196 ) ) ( not ( = ?auto_184191 ?auto_184197 ) ) ( not ( = ?auto_184191 ?auto_184198 ) ) ( not ( = ?auto_184192 ?auto_184193 ) ) ( not ( = ?auto_184192 ?auto_184194 ) ) ( not ( = ?auto_184192 ?auto_184195 ) ) ( not ( = ?auto_184192 ?auto_184196 ) ) ( not ( = ?auto_184192 ?auto_184197 ) ) ( not ( = ?auto_184192 ?auto_184198 ) ) ( not ( = ?auto_184193 ?auto_184194 ) ) ( not ( = ?auto_184193 ?auto_184195 ) ) ( not ( = ?auto_184193 ?auto_184196 ) ) ( not ( = ?auto_184193 ?auto_184197 ) ) ( not ( = ?auto_184193 ?auto_184198 ) ) ( not ( = ?auto_184194 ?auto_184195 ) ) ( not ( = ?auto_184194 ?auto_184196 ) ) ( not ( = ?auto_184194 ?auto_184197 ) ) ( not ( = ?auto_184194 ?auto_184198 ) ) ( not ( = ?auto_184195 ?auto_184196 ) ) ( not ( = ?auto_184195 ?auto_184197 ) ) ( not ( = ?auto_184195 ?auto_184198 ) ) ( not ( = ?auto_184196 ?auto_184197 ) ) ( not ( = ?auto_184196 ?auto_184198 ) ) ( not ( = ?auto_184197 ?auto_184198 ) ) ( ON ?auto_184196 ?auto_184197 ) ( ON ?auto_184195 ?auto_184196 ) ( ON ?auto_184194 ?auto_184195 ) ( ON ?auto_184193 ?auto_184194 ) ( ON ?auto_184192 ?auto_184193 ) ( ON ?auto_184191 ?auto_184192 ) ( ON ?auto_184190 ?auto_184191 ) ( CLEAR ?auto_184190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_184190 )
      ( MAKE-8PILE ?auto_184190 ?auto_184191 ?auto_184192 ?auto_184193 ?auto_184194 ?auto_184195 ?auto_184196 ?auto_184197 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_184225 - BLOCK
      ?auto_184226 - BLOCK
      ?auto_184227 - BLOCK
      ?auto_184228 - BLOCK
      ?auto_184229 - BLOCK
      ?auto_184230 - BLOCK
      ?auto_184231 - BLOCK
      ?auto_184232 - BLOCK
      ?auto_184233 - BLOCK
    )
    :vars
    (
      ?auto_184234 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_184232 ) ( ON ?auto_184233 ?auto_184234 ) ( CLEAR ?auto_184233 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_184225 ) ( ON ?auto_184226 ?auto_184225 ) ( ON ?auto_184227 ?auto_184226 ) ( ON ?auto_184228 ?auto_184227 ) ( ON ?auto_184229 ?auto_184228 ) ( ON ?auto_184230 ?auto_184229 ) ( ON ?auto_184231 ?auto_184230 ) ( ON ?auto_184232 ?auto_184231 ) ( not ( = ?auto_184225 ?auto_184226 ) ) ( not ( = ?auto_184225 ?auto_184227 ) ) ( not ( = ?auto_184225 ?auto_184228 ) ) ( not ( = ?auto_184225 ?auto_184229 ) ) ( not ( = ?auto_184225 ?auto_184230 ) ) ( not ( = ?auto_184225 ?auto_184231 ) ) ( not ( = ?auto_184225 ?auto_184232 ) ) ( not ( = ?auto_184225 ?auto_184233 ) ) ( not ( = ?auto_184225 ?auto_184234 ) ) ( not ( = ?auto_184226 ?auto_184227 ) ) ( not ( = ?auto_184226 ?auto_184228 ) ) ( not ( = ?auto_184226 ?auto_184229 ) ) ( not ( = ?auto_184226 ?auto_184230 ) ) ( not ( = ?auto_184226 ?auto_184231 ) ) ( not ( = ?auto_184226 ?auto_184232 ) ) ( not ( = ?auto_184226 ?auto_184233 ) ) ( not ( = ?auto_184226 ?auto_184234 ) ) ( not ( = ?auto_184227 ?auto_184228 ) ) ( not ( = ?auto_184227 ?auto_184229 ) ) ( not ( = ?auto_184227 ?auto_184230 ) ) ( not ( = ?auto_184227 ?auto_184231 ) ) ( not ( = ?auto_184227 ?auto_184232 ) ) ( not ( = ?auto_184227 ?auto_184233 ) ) ( not ( = ?auto_184227 ?auto_184234 ) ) ( not ( = ?auto_184228 ?auto_184229 ) ) ( not ( = ?auto_184228 ?auto_184230 ) ) ( not ( = ?auto_184228 ?auto_184231 ) ) ( not ( = ?auto_184228 ?auto_184232 ) ) ( not ( = ?auto_184228 ?auto_184233 ) ) ( not ( = ?auto_184228 ?auto_184234 ) ) ( not ( = ?auto_184229 ?auto_184230 ) ) ( not ( = ?auto_184229 ?auto_184231 ) ) ( not ( = ?auto_184229 ?auto_184232 ) ) ( not ( = ?auto_184229 ?auto_184233 ) ) ( not ( = ?auto_184229 ?auto_184234 ) ) ( not ( = ?auto_184230 ?auto_184231 ) ) ( not ( = ?auto_184230 ?auto_184232 ) ) ( not ( = ?auto_184230 ?auto_184233 ) ) ( not ( = ?auto_184230 ?auto_184234 ) ) ( not ( = ?auto_184231 ?auto_184232 ) ) ( not ( = ?auto_184231 ?auto_184233 ) ) ( not ( = ?auto_184231 ?auto_184234 ) ) ( not ( = ?auto_184232 ?auto_184233 ) ) ( not ( = ?auto_184232 ?auto_184234 ) ) ( not ( = ?auto_184233 ?auto_184234 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_184233 ?auto_184234 )
      ( !STACK ?auto_184233 ?auto_184232 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_184263 - BLOCK
      ?auto_184264 - BLOCK
      ?auto_184265 - BLOCK
      ?auto_184266 - BLOCK
      ?auto_184267 - BLOCK
      ?auto_184268 - BLOCK
      ?auto_184269 - BLOCK
      ?auto_184270 - BLOCK
      ?auto_184271 - BLOCK
    )
    :vars
    (
      ?auto_184272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184271 ?auto_184272 ) ( ON-TABLE ?auto_184263 ) ( ON ?auto_184264 ?auto_184263 ) ( ON ?auto_184265 ?auto_184264 ) ( ON ?auto_184266 ?auto_184265 ) ( ON ?auto_184267 ?auto_184266 ) ( ON ?auto_184268 ?auto_184267 ) ( ON ?auto_184269 ?auto_184268 ) ( not ( = ?auto_184263 ?auto_184264 ) ) ( not ( = ?auto_184263 ?auto_184265 ) ) ( not ( = ?auto_184263 ?auto_184266 ) ) ( not ( = ?auto_184263 ?auto_184267 ) ) ( not ( = ?auto_184263 ?auto_184268 ) ) ( not ( = ?auto_184263 ?auto_184269 ) ) ( not ( = ?auto_184263 ?auto_184270 ) ) ( not ( = ?auto_184263 ?auto_184271 ) ) ( not ( = ?auto_184263 ?auto_184272 ) ) ( not ( = ?auto_184264 ?auto_184265 ) ) ( not ( = ?auto_184264 ?auto_184266 ) ) ( not ( = ?auto_184264 ?auto_184267 ) ) ( not ( = ?auto_184264 ?auto_184268 ) ) ( not ( = ?auto_184264 ?auto_184269 ) ) ( not ( = ?auto_184264 ?auto_184270 ) ) ( not ( = ?auto_184264 ?auto_184271 ) ) ( not ( = ?auto_184264 ?auto_184272 ) ) ( not ( = ?auto_184265 ?auto_184266 ) ) ( not ( = ?auto_184265 ?auto_184267 ) ) ( not ( = ?auto_184265 ?auto_184268 ) ) ( not ( = ?auto_184265 ?auto_184269 ) ) ( not ( = ?auto_184265 ?auto_184270 ) ) ( not ( = ?auto_184265 ?auto_184271 ) ) ( not ( = ?auto_184265 ?auto_184272 ) ) ( not ( = ?auto_184266 ?auto_184267 ) ) ( not ( = ?auto_184266 ?auto_184268 ) ) ( not ( = ?auto_184266 ?auto_184269 ) ) ( not ( = ?auto_184266 ?auto_184270 ) ) ( not ( = ?auto_184266 ?auto_184271 ) ) ( not ( = ?auto_184266 ?auto_184272 ) ) ( not ( = ?auto_184267 ?auto_184268 ) ) ( not ( = ?auto_184267 ?auto_184269 ) ) ( not ( = ?auto_184267 ?auto_184270 ) ) ( not ( = ?auto_184267 ?auto_184271 ) ) ( not ( = ?auto_184267 ?auto_184272 ) ) ( not ( = ?auto_184268 ?auto_184269 ) ) ( not ( = ?auto_184268 ?auto_184270 ) ) ( not ( = ?auto_184268 ?auto_184271 ) ) ( not ( = ?auto_184268 ?auto_184272 ) ) ( not ( = ?auto_184269 ?auto_184270 ) ) ( not ( = ?auto_184269 ?auto_184271 ) ) ( not ( = ?auto_184269 ?auto_184272 ) ) ( not ( = ?auto_184270 ?auto_184271 ) ) ( not ( = ?auto_184270 ?auto_184272 ) ) ( not ( = ?auto_184271 ?auto_184272 ) ) ( CLEAR ?auto_184269 ) ( ON ?auto_184270 ?auto_184271 ) ( CLEAR ?auto_184270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_184263 ?auto_184264 ?auto_184265 ?auto_184266 ?auto_184267 ?auto_184268 ?auto_184269 ?auto_184270 )
      ( MAKE-9PILE ?auto_184263 ?auto_184264 ?auto_184265 ?auto_184266 ?auto_184267 ?auto_184268 ?auto_184269 ?auto_184270 ?auto_184271 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_184301 - BLOCK
      ?auto_184302 - BLOCK
      ?auto_184303 - BLOCK
      ?auto_184304 - BLOCK
      ?auto_184305 - BLOCK
      ?auto_184306 - BLOCK
      ?auto_184307 - BLOCK
      ?auto_184308 - BLOCK
      ?auto_184309 - BLOCK
    )
    :vars
    (
      ?auto_184310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184309 ?auto_184310 ) ( ON-TABLE ?auto_184301 ) ( ON ?auto_184302 ?auto_184301 ) ( ON ?auto_184303 ?auto_184302 ) ( ON ?auto_184304 ?auto_184303 ) ( ON ?auto_184305 ?auto_184304 ) ( ON ?auto_184306 ?auto_184305 ) ( not ( = ?auto_184301 ?auto_184302 ) ) ( not ( = ?auto_184301 ?auto_184303 ) ) ( not ( = ?auto_184301 ?auto_184304 ) ) ( not ( = ?auto_184301 ?auto_184305 ) ) ( not ( = ?auto_184301 ?auto_184306 ) ) ( not ( = ?auto_184301 ?auto_184307 ) ) ( not ( = ?auto_184301 ?auto_184308 ) ) ( not ( = ?auto_184301 ?auto_184309 ) ) ( not ( = ?auto_184301 ?auto_184310 ) ) ( not ( = ?auto_184302 ?auto_184303 ) ) ( not ( = ?auto_184302 ?auto_184304 ) ) ( not ( = ?auto_184302 ?auto_184305 ) ) ( not ( = ?auto_184302 ?auto_184306 ) ) ( not ( = ?auto_184302 ?auto_184307 ) ) ( not ( = ?auto_184302 ?auto_184308 ) ) ( not ( = ?auto_184302 ?auto_184309 ) ) ( not ( = ?auto_184302 ?auto_184310 ) ) ( not ( = ?auto_184303 ?auto_184304 ) ) ( not ( = ?auto_184303 ?auto_184305 ) ) ( not ( = ?auto_184303 ?auto_184306 ) ) ( not ( = ?auto_184303 ?auto_184307 ) ) ( not ( = ?auto_184303 ?auto_184308 ) ) ( not ( = ?auto_184303 ?auto_184309 ) ) ( not ( = ?auto_184303 ?auto_184310 ) ) ( not ( = ?auto_184304 ?auto_184305 ) ) ( not ( = ?auto_184304 ?auto_184306 ) ) ( not ( = ?auto_184304 ?auto_184307 ) ) ( not ( = ?auto_184304 ?auto_184308 ) ) ( not ( = ?auto_184304 ?auto_184309 ) ) ( not ( = ?auto_184304 ?auto_184310 ) ) ( not ( = ?auto_184305 ?auto_184306 ) ) ( not ( = ?auto_184305 ?auto_184307 ) ) ( not ( = ?auto_184305 ?auto_184308 ) ) ( not ( = ?auto_184305 ?auto_184309 ) ) ( not ( = ?auto_184305 ?auto_184310 ) ) ( not ( = ?auto_184306 ?auto_184307 ) ) ( not ( = ?auto_184306 ?auto_184308 ) ) ( not ( = ?auto_184306 ?auto_184309 ) ) ( not ( = ?auto_184306 ?auto_184310 ) ) ( not ( = ?auto_184307 ?auto_184308 ) ) ( not ( = ?auto_184307 ?auto_184309 ) ) ( not ( = ?auto_184307 ?auto_184310 ) ) ( not ( = ?auto_184308 ?auto_184309 ) ) ( not ( = ?auto_184308 ?auto_184310 ) ) ( not ( = ?auto_184309 ?auto_184310 ) ) ( ON ?auto_184308 ?auto_184309 ) ( CLEAR ?auto_184306 ) ( ON ?auto_184307 ?auto_184308 ) ( CLEAR ?auto_184307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_184301 ?auto_184302 ?auto_184303 ?auto_184304 ?auto_184305 ?auto_184306 ?auto_184307 )
      ( MAKE-9PILE ?auto_184301 ?auto_184302 ?auto_184303 ?auto_184304 ?auto_184305 ?auto_184306 ?auto_184307 ?auto_184308 ?auto_184309 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_184339 - BLOCK
      ?auto_184340 - BLOCK
      ?auto_184341 - BLOCK
      ?auto_184342 - BLOCK
      ?auto_184343 - BLOCK
      ?auto_184344 - BLOCK
      ?auto_184345 - BLOCK
      ?auto_184346 - BLOCK
      ?auto_184347 - BLOCK
    )
    :vars
    (
      ?auto_184348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184347 ?auto_184348 ) ( ON-TABLE ?auto_184339 ) ( ON ?auto_184340 ?auto_184339 ) ( ON ?auto_184341 ?auto_184340 ) ( ON ?auto_184342 ?auto_184341 ) ( ON ?auto_184343 ?auto_184342 ) ( not ( = ?auto_184339 ?auto_184340 ) ) ( not ( = ?auto_184339 ?auto_184341 ) ) ( not ( = ?auto_184339 ?auto_184342 ) ) ( not ( = ?auto_184339 ?auto_184343 ) ) ( not ( = ?auto_184339 ?auto_184344 ) ) ( not ( = ?auto_184339 ?auto_184345 ) ) ( not ( = ?auto_184339 ?auto_184346 ) ) ( not ( = ?auto_184339 ?auto_184347 ) ) ( not ( = ?auto_184339 ?auto_184348 ) ) ( not ( = ?auto_184340 ?auto_184341 ) ) ( not ( = ?auto_184340 ?auto_184342 ) ) ( not ( = ?auto_184340 ?auto_184343 ) ) ( not ( = ?auto_184340 ?auto_184344 ) ) ( not ( = ?auto_184340 ?auto_184345 ) ) ( not ( = ?auto_184340 ?auto_184346 ) ) ( not ( = ?auto_184340 ?auto_184347 ) ) ( not ( = ?auto_184340 ?auto_184348 ) ) ( not ( = ?auto_184341 ?auto_184342 ) ) ( not ( = ?auto_184341 ?auto_184343 ) ) ( not ( = ?auto_184341 ?auto_184344 ) ) ( not ( = ?auto_184341 ?auto_184345 ) ) ( not ( = ?auto_184341 ?auto_184346 ) ) ( not ( = ?auto_184341 ?auto_184347 ) ) ( not ( = ?auto_184341 ?auto_184348 ) ) ( not ( = ?auto_184342 ?auto_184343 ) ) ( not ( = ?auto_184342 ?auto_184344 ) ) ( not ( = ?auto_184342 ?auto_184345 ) ) ( not ( = ?auto_184342 ?auto_184346 ) ) ( not ( = ?auto_184342 ?auto_184347 ) ) ( not ( = ?auto_184342 ?auto_184348 ) ) ( not ( = ?auto_184343 ?auto_184344 ) ) ( not ( = ?auto_184343 ?auto_184345 ) ) ( not ( = ?auto_184343 ?auto_184346 ) ) ( not ( = ?auto_184343 ?auto_184347 ) ) ( not ( = ?auto_184343 ?auto_184348 ) ) ( not ( = ?auto_184344 ?auto_184345 ) ) ( not ( = ?auto_184344 ?auto_184346 ) ) ( not ( = ?auto_184344 ?auto_184347 ) ) ( not ( = ?auto_184344 ?auto_184348 ) ) ( not ( = ?auto_184345 ?auto_184346 ) ) ( not ( = ?auto_184345 ?auto_184347 ) ) ( not ( = ?auto_184345 ?auto_184348 ) ) ( not ( = ?auto_184346 ?auto_184347 ) ) ( not ( = ?auto_184346 ?auto_184348 ) ) ( not ( = ?auto_184347 ?auto_184348 ) ) ( ON ?auto_184346 ?auto_184347 ) ( ON ?auto_184345 ?auto_184346 ) ( CLEAR ?auto_184343 ) ( ON ?auto_184344 ?auto_184345 ) ( CLEAR ?auto_184344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184339 ?auto_184340 ?auto_184341 ?auto_184342 ?auto_184343 ?auto_184344 )
      ( MAKE-9PILE ?auto_184339 ?auto_184340 ?auto_184341 ?auto_184342 ?auto_184343 ?auto_184344 ?auto_184345 ?auto_184346 ?auto_184347 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_184377 - BLOCK
      ?auto_184378 - BLOCK
      ?auto_184379 - BLOCK
      ?auto_184380 - BLOCK
      ?auto_184381 - BLOCK
      ?auto_184382 - BLOCK
      ?auto_184383 - BLOCK
      ?auto_184384 - BLOCK
      ?auto_184385 - BLOCK
    )
    :vars
    (
      ?auto_184386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184385 ?auto_184386 ) ( ON-TABLE ?auto_184377 ) ( ON ?auto_184378 ?auto_184377 ) ( ON ?auto_184379 ?auto_184378 ) ( ON ?auto_184380 ?auto_184379 ) ( not ( = ?auto_184377 ?auto_184378 ) ) ( not ( = ?auto_184377 ?auto_184379 ) ) ( not ( = ?auto_184377 ?auto_184380 ) ) ( not ( = ?auto_184377 ?auto_184381 ) ) ( not ( = ?auto_184377 ?auto_184382 ) ) ( not ( = ?auto_184377 ?auto_184383 ) ) ( not ( = ?auto_184377 ?auto_184384 ) ) ( not ( = ?auto_184377 ?auto_184385 ) ) ( not ( = ?auto_184377 ?auto_184386 ) ) ( not ( = ?auto_184378 ?auto_184379 ) ) ( not ( = ?auto_184378 ?auto_184380 ) ) ( not ( = ?auto_184378 ?auto_184381 ) ) ( not ( = ?auto_184378 ?auto_184382 ) ) ( not ( = ?auto_184378 ?auto_184383 ) ) ( not ( = ?auto_184378 ?auto_184384 ) ) ( not ( = ?auto_184378 ?auto_184385 ) ) ( not ( = ?auto_184378 ?auto_184386 ) ) ( not ( = ?auto_184379 ?auto_184380 ) ) ( not ( = ?auto_184379 ?auto_184381 ) ) ( not ( = ?auto_184379 ?auto_184382 ) ) ( not ( = ?auto_184379 ?auto_184383 ) ) ( not ( = ?auto_184379 ?auto_184384 ) ) ( not ( = ?auto_184379 ?auto_184385 ) ) ( not ( = ?auto_184379 ?auto_184386 ) ) ( not ( = ?auto_184380 ?auto_184381 ) ) ( not ( = ?auto_184380 ?auto_184382 ) ) ( not ( = ?auto_184380 ?auto_184383 ) ) ( not ( = ?auto_184380 ?auto_184384 ) ) ( not ( = ?auto_184380 ?auto_184385 ) ) ( not ( = ?auto_184380 ?auto_184386 ) ) ( not ( = ?auto_184381 ?auto_184382 ) ) ( not ( = ?auto_184381 ?auto_184383 ) ) ( not ( = ?auto_184381 ?auto_184384 ) ) ( not ( = ?auto_184381 ?auto_184385 ) ) ( not ( = ?auto_184381 ?auto_184386 ) ) ( not ( = ?auto_184382 ?auto_184383 ) ) ( not ( = ?auto_184382 ?auto_184384 ) ) ( not ( = ?auto_184382 ?auto_184385 ) ) ( not ( = ?auto_184382 ?auto_184386 ) ) ( not ( = ?auto_184383 ?auto_184384 ) ) ( not ( = ?auto_184383 ?auto_184385 ) ) ( not ( = ?auto_184383 ?auto_184386 ) ) ( not ( = ?auto_184384 ?auto_184385 ) ) ( not ( = ?auto_184384 ?auto_184386 ) ) ( not ( = ?auto_184385 ?auto_184386 ) ) ( ON ?auto_184384 ?auto_184385 ) ( ON ?auto_184383 ?auto_184384 ) ( ON ?auto_184382 ?auto_184383 ) ( CLEAR ?auto_184380 ) ( ON ?auto_184381 ?auto_184382 ) ( CLEAR ?auto_184381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184377 ?auto_184378 ?auto_184379 ?auto_184380 ?auto_184381 )
      ( MAKE-9PILE ?auto_184377 ?auto_184378 ?auto_184379 ?auto_184380 ?auto_184381 ?auto_184382 ?auto_184383 ?auto_184384 ?auto_184385 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_184415 - BLOCK
      ?auto_184416 - BLOCK
      ?auto_184417 - BLOCK
      ?auto_184418 - BLOCK
      ?auto_184419 - BLOCK
      ?auto_184420 - BLOCK
      ?auto_184421 - BLOCK
      ?auto_184422 - BLOCK
      ?auto_184423 - BLOCK
    )
    :vars
    (
      ?auto_184424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184423 ?auto_184424 ) ( ON-TABLE ?auto_184415 ) ( ON ?auto_184416 ?auto_184415 ) ( ON ?auto_184417 ?auto_184416 ) ( not ( = ?auto_184415 ?auto_184416 ) ) ( not ( = ?auto_184415 ?auto_184417 ) ) ( not ( = ?auto_184415 ?auto_184418 ) ) ( not ( = ?auto_184415 ?auto_184419 ) ) ( not ( = ?auto_184415 ?auto_184420 ) ) ( not ( = ?auto_184415 ?auto_184421 ) ) ( not ( = ?auto_184415 ?auto_184422 ) ) ( not ( = ?auto_184415 ?auto_184423 ) ) ( not ( = ?auto_184415 ?auto_184424 ) ) ( not ( = ?auto_184416 ?auto_184417 ) ) ( not ( = ?auto_184416 ?auto_184418 ) ) ( not ( = ?auto_184416 ?auto_184419 ) ) ( not ( = ?auto_184416 ?auto_184420 ) ) ( not ( = ?auto_184416 ?auto_184421 ) ) ( not ( = ?auto_184416 ?auto_184422 ) ) ( not ( = ?auto_184416 ?auto_184423 ) ) ( not ( = ?auto_184416 ?auto_184424 ) ) ( not ( = ?auto_184417 ?auto_184418 ) ) ( not ( = ?auto_184417 ?auto_184419 ) ) ( not ( = ?auto_184417 ?auto_184420 ) ) ( not ( = ?auto_184417 ?auto_184421 ) ) ( not ( = ?auto_184417 ?auto_184422 ) ) ( not ( = ?auto_184417 ?auto_184423 ) ) ( not ( = ?auto_184417 ?auto_184424 ) ) ( not ( = ?auto_184418 ?auto_184419 ) ) ( not ( = ?auto_184418 ?auto_184420 ) ) ( not ( = ?auto_184418 ?auto_184421 ) ) ( not ( = ?auto_184418 ?auto_184422 ) ) ( not ( = ?auto_184418 ?auto_184423 ) ) ( not ( = ?auto_184418 ?auto_184424 ) ) ( not ( = ?auto_184419 ?auto_184420 ) ) ( not ( = ?auto_184419 ?auto_184421 ) ) ( not ( = ?auto_184419 ?auto_184422 ) ) ( not ( = ?auto_184419 ?auto_184423 ) ) ( not ( = ?auto_184419 ?auto_184424 ) ) ( not ( = ?auto_184420 ?auto_184421 ) ) ( not ( = ?auto_184420 ?auto_184422 ) ) ( not ( = ?auto_184420 ?auto_184423 ) ) ( not ( = ?auto_184420 ?auto_184424 ) ) ( not ( = ?auto_184421 ?auto_184422 ) ) ( not ( = ?auto_184421 ?auto_184423 ) ) ( not ( = ?auto_184421 ?auto_184424 ) ) ( not ( = ?auto_184422 ?auto_184423 ) ) ( not ( = ?auto_184422 ?auto_184424 ) ) ( not ( = ?auto_184423 ?auto_184424 ) ) ( ON ?auto_184422 ?auto_184423 ) ( ON ?auto_184421 ?auto_184422 ) ( ON ?auto_184420 ?auto_184421 ) ( ON ?auto_184419 ?auto_184420 ) ( CLEAR ?auto_184417 ) ( ON ?auto_184418 ?auto_184419 ) ( CLEAR ?auto_184418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184415 ?auto_184416 ?auto_184417 ?auto_184418 )
      ( MAKE-9PILE ?auto_184415 ?auto_184416 ?auto_184417 ?auto_184418 ?auto_184419 ?auto_184420 ?auto_184421 ?auto_184422 ?auto_184423 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_184453 - BLOCK
      ?auto_184454 - BLOCK
      ?auto_184455 - BLOCK
      ?auto_184456 - BLOCK
      ?auto_184457 - BLOCK
      ?auto_184458 - BLOCK
      ?auto_184459 - BLOCK
      ?auto_184460 - BLOCK
      ?auto_184461 - BLOCK
    )
    :vars
    (
      ?auto_184462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184461 ?auto_184462 ) ( ON-TABLE ?auto_184453 ) ( ON ?auto_184454 ?auto_184453 ) ( not ( = ?auto_184453 ?auto_184454 ) ) ( not ( = ?auto_184453 ?auto_184455 ) ) ( not ( = ?auto_184453 ?auto_184456 ) ) ( not ( = ?auto_184453 ?auto_184457 ) ) ( not ( = ?auto_184453 ?auto_184458 ) ) ( not ( = ?auto_184453 ?auto_184459 ) ) ( not ( = ?auto_184453 ?auto_184460 ) ) ( not ( = ?auto_184453 ?auto_184461 ) ) ( not ( = ?auto_184453 ?auto_184462 ) ) ( not ( = ?auto_184454 ?auto_184455 ) ) ( not ( = ?auto_184454 ?auto_184456 ) ) ( not ( = ?auto_184454 ?auto_184457 ) ) ( not ( = ?auto_184454 ?auto_184458 ) ) ( not ( = ?auto_184454 ?auto_184459 ) ) ( not ( = ?auto_184454 ?auto_184460 ) ) ( not ( = ?auto_184454 ?auto_184461 ) ) ( not ( = ?auto_184454 ?auto_184462 ) ) ( not ( = ?auto_184455 ?auto_184456 ) ) ( not ( = ?auto_184455 ?auto_184457 ) ) ( not ( = ?auto_184455 ?auto_184458 ) ) ( not ( = ?auto_184455 ?auto_184459 ) ) ( not ( = ?auto_184455 ?auto_184460 ) ) ( not ( = ?auto_184455 ?auto_184461 ) ) ( not ( = ?auto_184455 ?auto_184462 ) ) ( not ( = ?auto_184456 ?auto_184457 ) ) ( not ( = ?auto_184456 ?auto_184458 ) ) ( not ( = ?auto_184456 ?auto_184459 ) ) ( not ( = ?auto_184456 ?auto_184460 ) ) ( not ( = ?auto_184456 ?auto_184461 ) ) ( not ( = ?auto_184456 ?auto_184462 ) ) ( not ( = ?auto_184457 ?auto_184458 ) ) ( not ( = ?auto_184457 ?auto_184459 ) ) ( not ( = ?auto_184457 ?auto_184460 ) ) ( not ( = ?auto_184457 ?auto_184461 ) ) ( not ( = ?auto_184457 ?auto_184462 ) ) ( not ( = ?auto_184458 ?auto_184459 ) ) ( not ( = ?auto_184458 ?auto_184460 ) ) ( not ( = ?auto_184458 ?auto_184461 ) ) ( not ( = ?auto_184458 ?auto_184462 ) ) ( not ( = ?auto_184459 ?auto_184460 ) ) ( not ( = ?auto_184459 ?auto_184461 ) ) ( not ( = ?auto_184459 ?auto_184462 ) ) ( not ( = ?auto_184460 ?auto_184461 ) ) ( not ( = ?auto_184460 ?auto_184462 ) ) ( not ( = ?auto_184461 ?auto_184462 ) ) ( ON ?auto_184460 ?auto_184461 ) ( ON ?auto_184459 ?auto_184460 ) ( ON ?auto_184458 ?auto_184459 ) ( ON ?auto_184457 ?auto_184458 ) ( ON ?auto_184456 ?auto_184457 ) ( CLEAR ?auto_184454 ) ( ON ?auto_184455 ?auto_184456 ) ( CLEAR ?auto_184455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184453 ?auto_184454 ?auto_184455 )
      ( MAKE-9PILE ?auto_184453 ?auto_184454 ?auto_184455 ?auto_184456 ?auto_184457 ?auto_184458 ?auto_184459 ?auto_184460 ?auto_184461 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_184491 - BLOCK
      ?auto_184492 - BLOCK
      ?auto_184493 - BLOCK
      ?auto_184494 - BLOCK
      ?auto_184495 - BLOCK
      ?auto_184496 - BLOCK
      ?auto_184497 - BLOCK
      ?auto_184498 - BLOCK
      ?auto_184499 - BLOCK
    )
    :vars
    (
      ?auto_184500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184499 ?auto_184500 ) ( ON-TABLE ?auto_184491 ) ( not ( = ?auto_184491 ?auto_184492 ) ) ( not ( = ?auto_184491 ?auto_184493 ) ) ( not ( = ?auto_184491 ?auto_184494 ) ) ( not ( = ?auto_184491 ?auto_184495 ) ) ( not ( = ?auto_184491 ?auto_184496 ) ) ( not ( = ?auto_184491 ?auto_184497 ) ) ( not ( = ?auto_184491 ?auto_184498 ) ) ( not ( = ?auto_184491 ?auto_184499 ) ) ( not ( = ?auto_184491 ?auto_184500 ) ) ( not ( = ?auto_184492 ?auto_184493 ) ) ( not ( = ?auto_184492 ?auto_184494 ) ) ( not ( = ?auto_184492 ?auto_184495 ) ) ( not ( = ?auto_184492 ?auto_184496 ) ) ( not ( = ?auto_184492 ?auto_184497 ) ) ( not ( = ?auto_184492 ?auto_184498 ) ) ( not ( = ?auto_184492 ?auto_184499 ) ) ( not ( = ?auto_184492 ?auto_184500 ) ) ( not ( = ?auto_184493 ?auto_184494 ) ) ( not ( = ?auto_184493 ?auto_184495 ) ) ( not ( = ?auto_184493 ?auto_184496 ) ) ( not ( = ?auto_184493 ?auto_184497 ) ) ( not ( = ?auto_184493 ?auto_184498 ) ) ( not ( = ?auto_184493 ?auto_184499 ) ) ( not ( = ?auto_184493 ?auto_184500 ) ) ( not ( = ?auto_184494 ?auto_184495 ) ) ( not ( = ?auto_184494 ?auto_184496 ) ) ( not ( = ?auto_184494 ?auto_184497 ) ) ( not ( = ?auto_184494 ?auto_184498 ) ) ( not ( = ?auto_184494 ?auto_184499 ) ) ( not ( = ?auto_184494 ?auto_184500 ) ) ( not ( = ?auto_184495 ?auto_184496 ) ) ( not ( = ?auto_184495 ?auto_184497 ) ) ( not ( = ?auto_184495 ?auto_184498 ) ) ( not ( = ?auto_184495 ?auto_184499 ) ) ( not ( = ?auto_184495 ?auto_184500 ) ) ( not ( = ?auto_184496 ?auto_184497 ) ) ( not ( = ?auto_184496 ?auto_184498 ) ) ( not ( = ?auto_184496 ?auto_184499 ) ) ( not ( = ?auto_184496 ?auto_184500 ) ) ( not ( = ?auto_184497 ?auto_184498 ) ) ( not ( = ?auto_184497 ?auto_184499 ) ) ( not ( = ?auto_184497 ?auto_184500 ) ) ( not ( = ?auto_184498 ?auto_184499 ) ) ( not ( = ?auto_184498 ?auto_184500 ) ) ( not ( = ?auto_184499 ?auto_184500 ) ) ( ON ?auto_184498 ?auto_184499 ) ( ON ?auto_184497 ?auto_184498 ) ( ON ?auto_184496 ?auto_184497 ) ( ON ?auto_184495 ?auto_184496 ) ( ON ?auto_184494 ?auto_184495 ) ( ON ?auto_184493 ?auto_184494 ) ( CLEAR ?auto_184491 ) ( ON ?auto_184492 ?auto_184493 ) ( CLEAR ?auto_184492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184491 ?auto_184492 )
      ( MAKE-9PILE ?auto_184491 ?auto_184492 ?auto_184493 ?auto_184494 ?auto_184495 ?auto_184496 ?auto_184497 ?auto_184498 ?auto_184499 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_184529 - BLOCK
      ?auto_184530 - BLOCK
      ?auto_184531 - BLOCK
      ?auto_184532 - BLOCK
      ?auto_184533 - BLOCK
      ?auto_184534 - BLOCK
      ?auto_184535 - BLOCK
      ?auto_184536 - BLOCK
      ?auto_184537 - BLOCK
    )
    :vars
    (
      ?auto_184538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184537 ?auto_184538 ) ( not ( = ?auto_184529 ?auto_184530 ) ) ( not ( = ?auto_184529 ?auto_184531 ) ) ( not ( = ?auto_184529 ?auto_184532 ) ) ( not ( = ?auto_184529 ?auto_184533 ) ) ( not ( = ?auto_184529 ?auto_184534 ) ) ( not ( = ?auto_184529 ?auto_184535 ) ) ( not ( = ?auto_184529 ?auto_184536 ) ) ( not ( = ?auto_184529 ?auto_184537 ) ) ( not ( = ?auto_184529 ?auto_184538 ) ) ( not ( = ?auto_184530 ?auto_184531 ) ) ( not ( = ?auto_184530 ?auto_184532 ) ) ( not ( = ?auto_184530 ?auto_184533 ) ) ( not ( = ?auto_184530 ?auto_184534 ) ) ( not ( = ?auto_184530 ?auto_184535 ) ) ( not ( = ?auto_184530 ?auto_184536 ) ) ( not ( = ?auto_184530 ?auto_184537 ) ) ( not ( = ?auto_184530 ?auto_184538 ) ) ( not ( = ?auto_184531 ?auto_184532 ) ) ( not ( = ?auto_184531 ?auto_184533 ) ) ( not ( = ?auto_184531 ?auto_184534 ) ) ( not ( = ?auto_184531 ?auto_184535 ) ) ( not ( = ?auto_184531 ?auto_184536 ) ) ( not ( = ?auto_184531 ?auto_184537 ) ) ( not ( = ?auto_184531 ?auto_184538 ) ) ( not ( = ?auto_184532 ?auto_184533 ) ) ( not ( = ?auto_184532 ?auto_184534 ) ) ( not ( = ?auto_184532 ?auto_184535 ) ) ( not ( = ?auto_184532 ?auto_184536 ) ) ( not ( = ?auto_184532 ?auto_184537 ) ) ( not ( = ?auto_184532 ?auto_184538 ) ) ( not ( = ?auto_184533 ?auto_184534 ) ) ( not ( = ?auto_184533 ?auto_184535 ) ) ( not ( = ?auto_184533 ?auto_184536 ) ) ( not ( = ?auto_184533 ?auto_184537 ) ) ( not ( = ?auto_184533 ?auto_184538 ) ) ( not ( = ?auto_184534 ?auto_184535 ) ) ( not ( = ?auto_184534 ?auto_184536 ) ) ( not ( = ?auto_184534 ?auto_184537 ) ) ( not ( = ?auto_184534 ?auto_184538 ) ) ( not ( = ?auto_184535 ?auto_184536 ) ) ( not ( = ?auto_184535 ?auto_184537 ) ) ( not ( = ?auto_184535 ?auto_184538 ) ) ( not ( = ?auto_184536 ?auto_184537 ) ) ( not ( = ?auto_184536 ?auto_184538 ) ) ( not ( = ?auto_184537 ?auto_184538 ) ) ( ON ?auto_184536 ?auto_184537 ) ( ON ?auto_184535 ?auto_184536 ) ( ON ?auto_184534 ?auto_184535 ) ( ON ?auto_184533 ?auto_184534 ) ( ON ?auto_184532 ?auto_184533 ) ( ON ?auto_184531 ?auto_184532 ) ( ON ?auto_184530 ?auto_184531 ) ( ON ?auto_184529 ?auto_184530 ) ( CLEAR ?auto_184529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_184529 )
      ( MAKE-9PILE ?auto_184529 ?auto_184530 ?auto_184531 ?auto_184532 ?auto_184533 ?auto_184534 ?auto_184535 ?auto_184536 ?auto_184537 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_184568 - BLOCK
      ?auto_184569 - BLOCK
      ?auto_184570 - BLOCK
      ?auto_184571 - BLOCK
      ?auto_184572 - BLOCK
      ?auto_184573 - BLOCK
      ?auto_184574 - BLOCK
      ?auto_184575 - BLOCK
      ?auto_184576 - BLOCK
      ?auto_184577 - BLOCK
    )
    :vars
    (
      ?auto_184578 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_184576 ) ( ON ?auto_184577 ?auto_184578 ) ( CLEAR ?auto_184577 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_184568 ) ( ON ?auto_184569 ?auto_184568 ) ( ON ?auto_184570 ?auto_184569 ) ( ON ?auto_184571 ?auto_184570 ) ( ON ?auto_184572 ?auto_184571 ) ( ON ?auto_184573 ?auto_184572 ) ( ON ?auto_184574 ?auto_184573 ) ( ON ?auto_184575 ?auto_184574 ) ( ON ?auto_184576 ?auto_184575 ) ( not ( = ?auto_184568 ?auto_184569 ) ) ( not ( = ?auto_184568 ?auto_184570 ) ) ( not ( = ?auto_184568 ?auto_184571 ) ) ( not ( = ?auto_184568 ?auto_184572 ) ) ( not ( = ?auto_184568 ?auto_184573 ) ) ( not ( = ?auto_184568 ?auto_184574 ) ) ( not ( = ?auto_184568 ?auto_184575 ) ) ( not ( = ?auto_184568 ?auto_184576 ) ) ( not ( = ?auto_184568 ?auto_184577 ) ) ( not ( = ?auto_184568 ?auto_184578 ) ) ( not ( = ?auto_184569 ?auto_184570 ) ) ( not ( = ?auto_184569 ?auto_184571 ) ) ( not ( = ?auto_184569 ?auto_184572 ) ) ( not ( = ?auto_184569 ?auto_184573 ) ) ( not ( = ?auto_184569 ?auto_184574 ) ) ( not ( = ?auto_184569 ?auto_184575 ) ) ( not ( = ?auto_184569 ?auto_184576 ) ) ( not ( = ?auto_184569 ?auto_184577 ) ) ( not ( = ?auto_184569 ?auto_184578 ) ) ( not ( = ?auto_184570 ?auto_184571 ) ) ( not ( = ?auto_184570 ?auto_184572 ) ) ( not ( = ?auto_184570 ?auto_184573 ) ) ( not ( = ?auto_184570 ?auto_184574 ) ) ( not ( = ?auto_184570 ?auto_184575 ) ) ( not ( = ?auto_184570 ?auto_184576 ) ) ( not ( = ?auto_184570 ?auto_184577 ) ) ( not ( = ?auto_184570 ?auto_184578 ) ) ( not ( = ?auto_184571 ?auto_184572 ) ) ( not ( = ?auto_184571 ?auto_184573 ) ) ( not ( = ?auto_184571 ?auto_184574 ) ) ( not ( = ?auto_184571 ?auto_184575 ) ) ( not ( = ?auto_184571 ?auto_184576 ) ) ( not ( = ?auto_184571 ?auto_184577 ) ) ( not ( = ?auto_184571 ?auto_184578 ) ) ( not ( = ?auto_184572 ?auto_184573 ) ) ( not ( = ?auto_184572 ?auto_184574 ) ) ( not ( = ?auto_184572 ?auto_184575 ) ) ( not ( = ?auto_184572 ?auto_184576 ) ) ( not ( = ?auto_184572 ?auto_184577 ) ) ( not ( = ?auto_184572 ?auto_184578 ) ) ( not ( = ?auto_184573 ?auto_184574 ) ) ( not ( = ?auto_184573 ?auto_184575 ) ) ( not ( = ?auto_184573 ?auto_184576 ) ) ( not ( = ?auto_184573 ?auto_184577 ) ) ( not ( = ?auto_184573 ?auto_184578 ) ) ( not ( = ?auto_184574 ?auto_184575 ) ) ( not ( = ?auto_184574 ?auto_184576 ) ) ( not ( = ?auto_184574 ?auto_184577 ) ) ( not ( = ?auto_184574 ?auto_184578 ) ) ( not ( = ?auto_184575 ?auto_184576 ) ) ( not ( = ?auto_184575 ?auto_184577 ) ) ( not ( = ?auto_184575 ?auto_184578 ) ) ( not ( = ?auto_184576 ?auto_184577 ) ) ( not ( = ?auto_184576 ?auto_184578 ) ) ( not ( = ?auto_184577 ?auto_184578 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_184577 ?auto_184578 )
      ( !STACK ?auto_184577 ?auto_184576 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_184610 - BLOCK
      ?auto_184611 - BLOCK
      ?auto_184612 - BLOCK
      ?auto_184613 - BLOCK
      ?auto_184614 - BLOCK
      ?auto_184615 - BLOCK
      ?auto_184616 - BLOCK
      ?auto_184617 - BLOCK
      ?auto_184618 - BLOCK
      ?auto_184619 - BLOCK
    )
    :vars
    (
      ?auto_184620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184619 ?auto_184620 ) ( ON-TABLE ?auto_184610 ) ( ON ?auto_184611 ?auto_184610 ) ( ON ?auto_184612 ?auto_184611 ) ( ON ?auto_184613 ?auto_184612 ) ( ON ?auto_184614 ?auto_184613 ) ( ON ?auto_184615 ?auto_184614 ) ( ON ?auto_184616 ?auto_184615 ) ( ON ?auto_184617 ?auto_184616 ) ( not ( = ?auto_184610 ?auto_184611 ) ) ( not ( = ?auto_184610 ?auto_184612 ) ) ( not ( = ?auto_184610 ?auto_184613 ) ) ( not ( = ?auto_184610 ?auto_184614 ) ) ( not ( = ?auto_184610 ?auto_184615 ) ) ( not ( = ?auto_184610 ?auto_184616 ) ) ( not ( = ?auto_184610 ?auto_184617 ) ) ( not ( = ?auto_184610 ?auto_184618 ) ) ( not ( = ?auto_184610 ?auto_184619 ) ) ( not ( = ?auto_184610 ?auto_184620 ) ) ( not ( = ?auto_184611 ?auto_184612 ) ) ( not ( = ?auto_184611 ?auto_184613 ) ) ( not ( = ?auto_184611 ?auto_184614 ) ) ( not ( = ?auto_184611 ?auto_184615 ) ) ( not ( = ?auto_184611 ?auto_184616 ) ) ( not ( = ?auto_184611 ?auto_184617 ) ) ( not ( = ?auto_184611 ?auto_184618 ) ) ( not ( = ?auto_184611 ?auto_184619 ) ) ( not ( = ?auto_184611 ?auto_184620 ) ) ( not ( = ?auto_184612 ?auto_184613 ) ) ( not ( = ?auto_184612 ?auto_184614 ) ) ( not ( = ?auto_184612 ?auto_184615 ) ) ( not ( = ?auto_184612 ?auto_184616 ) ) ( not ( = ?auto_184612 ?auto_184617 ) ) ( not ( = ?auto_184612 ?auto_184618 ) ) ( not ( = ?auto_184612 ?auto_184619 ) ) ( not ( = ?auto_184612 ?auto_184620 ) ) ( not ( = ?auto_184613 ?auto_184614 ) ) ( not ( = ?auto_184613 ?auto_184615 ) ) ( not ( = ?auto_184613 ?auto_184616 ) ) ( not ( = ?auto_184613 ?auto_184617 ) ) ( not ( = ?auto_184613 ?auto_184618 ) ) ( not ( = ?auto_184613 ?auto_184619 ) ) ( not ( = ?auto_184613 ?auto_184620 ) ) ( not ( = ?auto_184614 ?auto_184615 ) ) ( not ( = ?auto_184614 ?auto_184616 ) ) ( not ( = ?auto_184614 ?auto_184617 ) ) ( not ( = ?auto_184614 ?auto_184618 ) ) ( not ( = ?auto_184614 ?auto_184619 ) ) ( not ( = ?auto_184614 ?auto_184620 ) ) ( not ( = ?auto_184615 ?auto_184616 ) ) ( not ( = ?auto_184615 ?auto_184617 ) ) ( not ( = ?auto_184615 ?auto_184618 ) ) ( not ( = ?auto_184615 ?auto_184619 ) ) ( not ( = ?auto_184615 ?auto_184620 ) ) ( not ( = ?auto_184616 ?auto_184617 ) ) ( not ( = ?auto_184616 ?auto_184618 ) ) ( not ( = ?auto_184616 ?auto_184619 ) ) ( not ( = ?auto_184616 ?auto_184620 ) ) ( not ( = ?auto_184617 ?auto_184618 ) ) ( not ( = ?auto_184617 ?auto_184619 ) ) ( not ( = ?auto_184617 ?auto_184620 ) ) ( not ( = ?auto_184618 ?auto_184619 ) ) ( not ( = ?auto_184618 ?auto_184620 ) ) ( not ( = ?auto_184619 ?auto_184620 ) ) ( CLEAR ?auto_184617 ) ( ON ?auto_184618 ?auto_184619 ) ( CLEAR ?auto_184618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_184610 ?auto_184611 ?auto_184612 ?auto_184613 ?auto_184614 ?auto_184615 ?auto_184616 ?auto_184617 ?auto_184618 )
      ( MAKE-10PILE ?auto_184610 ?auto_184611 ?auto_184612 ?auto_184613 ?auto_184614 ?auto_184615 ?auto_184616 ?auto_184617 ?auto_184618 ?auto_184619 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_184652 - BLOCK
      ?auto_184653 - BLOCK
      ?auto_184654 - BLOCK
      ?auto_184655 - BLOCK
      ?auto_184656 - BLOCK
      ?auto_184657 - BLOCK
      ?auto_184658 - BLOCK
      ?auto_184659 - BLOCK
      ?auto_184660 - BLOCK
      ?auto_184661 - BLOCK
    )
    :vars
    (
      ?auto_184662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184661 ?auto_184662 ) ( ON-TABLE ?auto_184652 ) ( ON ?auto_184653 ?auto_184652 ) ( ON ?auto_184654 ?auto_184653 ) ( ON ?auto_184655 ?auto_184654 ) ( ON ?auto_184656 ?auto_184655 ) ( ON ?auto_184657 ?auto_184656 ) ( ON ?auto_184658 ?auto_184657 ) ( not ( = ?auto_184652 ?auto_184653 ) ) ( not ( = ?auto_184652 ?auto_184654 ) ) ( not ( = ?auto_184652 ?auto_184655 ) ) ( not ( = ?auto_184652 ?auto_184656 ) ) ( not ( = ?auto_184652 ?auto_184657 ) ) ( not ( = ?auto_184652 ?auto_184658 ) ) ( not ( = ?auto_184652 ?auto_184659 ) ) ( not ( = ?auto_184652 ?auto_184660 ) ) ( not ( = ?auto_184652 ?auto_184661 ) ) ( not ( = ?auto_184652 ?auto_184662 ) ) ( not ( = ?auto_184653 ?auto_184654 ) ) ( not ( = ?auto_184653 ?auto_184655 ) ) ( not ( = ?auto_184653 ?auto_184656 ) ) ( not ( = ?auto_184653 ?auto_184657 ) ) ( not ( = ?auto_184653 ?auto_184658 ) ) ( not ( = ?auto_184653 ?auto_184659 ) ) ( not ( = ?auto_184653 ?auto_184660 ) ) ( not ( = ?auto_184653 ?auto_184661 ) ) ( not ( = ?auto_184653 ?auto_184662 ) ) ( not ( = ?auto_184654 ?auto_184655 ) ) ( not ( = ?auto_184654 ?auto_184656 ) ) ( not ( = ?auto_184654 ?auto_184657 ) ) ( not ( = ?auto_184654 ?auto_184658 ) ) ( not ( = ?auto_184654 ?auto_184659 ) ) ( not ( = ?auto_184654 ?auto_184660 ) ) ( not ( = ?auto_184654 ?auto_184661 ) ) ( not ( = ?auto_184654 ?auto_184662 ) ) ( not ( = ?auto_184655 ?auto_184656 ) ) ( not ( = ?auto_184655 ?auto_184657 ) ) ( not ( = ?auto_184655 ?auto_184658 ) ) ( not ( = ?auto_184655 ?auto_184659 ) ) ( not ( = ?auto_184655 ?auto_184660 ) ) ( not ( = ?auto_184655 ?auto_184661 ) ) ( not ( = ?auto_184655 ?auto_184662 ) ) ( not ( = ?auto_184656 ?auto_184657 ) ) ( not ( = ?auto_184656 ?auto_184658 ) ) ( not ( = ?auto_184656 ?auto_184659 ) ) ( not ( = ?auto_184656 ?auto_184660 ) ) ( not ( = ?auto_184656 ?auto_184661 ) ) ( not ( = ?auto_184656 ?auto_184662 ) ) ( not ( = ?auto_184657 ?auto_184658 ) ) ( not ( = ?auto_184657 ?auto_184659 ) ) ( not ( = ?auto_184657 ?auto_184660 ) ) ( not ( = ?auto_184657 ?auto_184661 ) ) ( not ( = ?auto_184657 ?auto_184662 ) ) ( not ( = ?auto_184658 ?auto_184659 ) ) ( not ( = ?auto_184658 ?auto_184660 ) ) ( not ( = ?auto_184658 ?auto_184661 ) ) ( not ( = ?auto_184658 ?auto_184662 ) ) ( not ( = ?auto_184659 ?auto_184660 ) ) ( not ( = ?auto_184659 ?auto_184661 ) ) ( not ( = ?auto_184659 ?auto_184662 ) ) ( not ( = ?auto_184660 ?auto_184661 ) ) ( not ( = ?auto_184660 ?auto_184662 ) ) ( not ( = ?auto_184661 ?auto_184662 ) ) ( ON ?auto_184660 ?auto_184661 ) ( CLEAR ?auto_184658 ) ( ON ?auto_184659 ?auto_184660 ) ( CLEAR ?auto_184659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_184652 ?auto_184653 ?auto_184654 ?auto_184655 ?auto_184656 ?auto_184657 ?auto_184658 ?auto_184659 )
      ( MAKE-10PILE ?auto_184652 ?auto_184653 ?auto_184654 ?auto_184655 ?auto_184656 ?auto_184657 ?auto_184658 ?auto_184659 ?auto_184660 ?auto_184661 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_184694 - BLOCK
      ?auto_184695 - BLOCK
      ?auto_184696 - BLOCK
      ?auto_184697 - BLOCK
      ?auto_184698 - BLOCK
      ?auto_184699 - BLOCK
      ?auto_184700 - BLOCK
      ?auto_184701 - BLOCK
      ?auto_184702 - BLOCK
      ?auto_184703 - BLOCK
    )
    :vars
    (
      ?auto_184704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184703 ?auto_184704 ) ( ON-TABLE ?auto_184694 ) ( ON ?auto_184695 ?auto_184694 ) ( ON ?auto_184696 ?auto_184695 ) ( ON ?auto_184697 ?auto_184696 ) ( ON ?auto_184698 ?auto_184697 ) ( ON ?auto_184699 ?auto_184698 ) ( not ( = ?auto_184694 ?auto_184695 ) ) ( not ( = ?auto_184694 ?auto_184696 ) ) ( not ( = ?auto_184694 ?auto_184697 ) ) ( not ( = ?auto_184694 ?auto_184698 ) ) ( not ( = ?auto_184694 ?auto_184699 ) ) ( not ( = ?auto_184694 ?auto_184700 ) ) ( not ( = ?auto_184694 ?auto_184701 ) ) ( not ( = ?auto_184694 ?auto_184702 ) ) ( not ( = ?auto_184694 ?auto_184703 ) ) ( not ( = ?auto_184694 ?auto_184704 ) ) ( not ( = ?auto_184695 ?auto_184696 ) ) ( not ( = ?auto_184695 ?auto_184697 ) ) ( not ( = ?auto_184695 ?auto_184698 ) ) ( not ( = ?auto_184695 ?auto_184699 ) ) ( not ( = ?auto_184695 ?auto_184700 ) ) ( not ( = ?auto_184695 ?auto_184701 ) ) ( not ( = ?auto_184695 ?auto_184702 ) ) ( not ( = ?auto_184695 ?auto_184703 ) ) ( not ( = ?auto_184695 ?auto_184704 ) ) ( not ( = ?auto_184696 ?auto_184697 ) ) ( not ( = ?auto_184696 ?auto_184698 ) ) ( not ( = ?auto_184696 ?auto_184699 ) ) ( not ( = ?auto_184696 ?auto_184700 ) ) ( not ( = ?auto_184696 ?auto_184701 ) ) ( not ( = ?auto_184696 ?auto_184702 ) ) ( not ( = ?auto_184696 ?auto_184703 ) ) ( not ( = ?auto_184696 ?auto_184704 ) ) ( not ( = ?auto_184697 ?auto_184698 ) ) ( not ( = ?auto_184697 ?auto_184699 ) ) ( not ( = ?auto_184697 ?auto_184700 ) ) ( not ( = ?auto_184697 ?auto_184701 ) ) ( not ( = ?auto_184697 ?auto_184702 ) ) ( not ( = ?auto_184697 ?auto_184703 ) ) ( not ( = ?auto_184697 ?auto_184704 ) ) ( not ( = ?auto_184698 ?auto_184699 ) ) ( not ( = ?auto_184698 ?auto_184700 ) ) ( not ( = ?auto_184698 ?auto_184701 ) ) ( not ( = ?auto_184698 ?auto_184702 ) ) ( not ( = ?auto_184698 ?auto_184703 ) ) ( not ( = ?auto_184698 ?auto_184704 ) ) ( not ( = ?auto_184699 ?auto_184700 ) ) ( not ( = ?auto_184699 ?auto_184701 ) ) ( not ( = ?auto_184699 ?auto_184702 ) ) ( not ( = ?auto_184699 ?auto_184703 ) ) ( not ( = ?auto_184699 ?auto_184704 ) ) ( not ( = ?auto_184700 ?auto_184701 ) ) ( not ( = ?auto_184700 ?auto_184702 ) ) ( not ( = ?auto_184700 ?auto_184703 ) ) ( not ( = ?auto_184700 ?auto_184704 ) ) ( not ( = ?auto_184701 ?auto_184702 ) ) ( not ( = ?auto_184701 ?auto_184703 ) ) ( not ( = ?auto_184701 ?auto_184704 ) ) ( not ( = ?auto_184702 ?auto_184703 ) ) ( not ( = ?auto_184702 ?auto_184704 ) ) ( not ( = ?auto_184703 ?auto_184704 ) ) ( ON ?auto_184702 ?auto_184703 ) ( ON ?auto_184701 ?auto_184702 ) ( CLEAR ?auto_184699 ) ( ON ?auto_184700 ?auto_184701 ) ( CLEAR ?auto_184700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_184694 ?auto_184695 ?auto_184696 ?auto_184697 ?auto_184698 ?auto_184699 ?auto_184700 )
      ( MAKE-10PILE ?auto_184694 ?auto_184695 ?auto_184696 ?auto_184697 ?auto_184698 ?auto_184699 ?auto_184700 ?auto_184701 ?auto_184702 ?auto_184703 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_184736 - BLOCK
      ?auto_184737 - BLOCK
      ?auto_184738 - BLOCK
      ?auto_184739 - BLOCK
      ?auto_184740 - BLOCK
      ?auto_184741 - BLOCK
      ?auto_184742 - BLOCK
      ?auto_184743 - BLOCK
      ?auto_184744 - BLOCK
      ?auto_184745 - BLOCK
    )
    :vars
    (
      ?auto_184746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184745 ?auto_184746 ) ( ON-TABLE ?auto_184736 ) ( ON ?auto_184737 ?auto_184736 ) ( ON ?auto_184738 ?auto_184737 ) ( ON ?auto_184739 ?auto_184738 ) ( ON ?auto_184740 ?auto_184739 ) ( not ( = ?auto_184736 ?auto_184737 ) ) ( not ( = ?auto_184736 ?auto_184738 ) ) ( not ( = ?auto_184736 ?auto_184739 ) ) ( not ( = ?auto_184736 ?auto_184740 ) ) ( not ( = ?auto_184736 ?auto_184741 ) ) ( not ( = ?auto_184736 ?auto_184742 ) ) ( not ( = ?auto_184736 ?auto_184743 ) ) ( not ( = ?auto_184736 ?auto_184744 ) ) ( not ( = ?auto_184736 ?auto_184745 ) ) ( not ( = ?auto_184736 ?auto_184746 ) ) ( not ( = ?auto_184737 ?auto_184738 ) ) ( not ( = ?auto_184737 ?auto_184739 ) ) ( not ( = ?auto_184737 ?auto_184740 ) ) ( not ( = ?auto_184737 ?auto_184741 ) ) ( not ( = ?auto_184737 ?auto_184742 ) ) ( not ( = ?auto_184737 ?auto_184743 ) ) ( not ( = ?auto_184737 ?auto_184744 ) ) ( not ( = ?auto_184737 ?auto_184745 ) ) ( not ( = ?auto_184737 ?auto_184746 ) ) ( not ( = ?auto_184738 ?auto_184739 ) ) ( not ( = ?auto_184738 ?auto_184740 ) ) ( not ( = ?auto_184738 ?auto_184741 ) ) ( not ( = ?auto_184738 ?auto_184742 ) ) ( not ( = ?auto_184738 ?auto_184743 ) ) ( not ( = ?auto_184738 ?auto_184744 ) ) ( not ( = ?auto_184738 ?auto_184745 ) ) ( not ( = ?auto_184738 ?auto_184746 ) ) ( not ( = ?auto_184739 ?auto_184740 ) ) ( not ( = ?auto_184739 ?auto_184741 ) ) ( not ( = ?auto_184739 ?auto_184742 ) ) ( not ( = ?auto_184739 ?auto_184743 ) ) ( not ( = ?auto_184739 ?auto_184744 ) ) ( not ( = ?auto_184739 ?auto_184745 ) ) ( not ( = ?auto_184739 ?auto_184746 ) ) ( not ( = ?auto_184740 ?auto_184741 ) ) ( not ( = ?auto_184740 ?auto_184742 ) ) ( not ( = ?auto_184740 ?auto_184743 ) ) ( not ( = ?auto_184740 ?auto_184744 ) ) ( not ( = ?auto_184740 ?auto_184745 ) ) ( not ( = ?auto_184740 ?auto_184746 ) ) ( not ( = ?auto_184741 ?auto_184742 ) ) ( not ( = ?auto_184741 ?auto_184743 ) ) ( not ( = ?auto_184741 ?auto_184744 ) ) ( not ( = ?auto_184741 ?auto_184745 ) ) ( not ( = ?auto_184741 ?auto_184746 ) ) ( not ( = ?auto_184742 ?auto_184743 ) ) ( not ( = ?auto_184742 ?auto_184744 ) ) ( not ( = ?auto_184742 ?auto_184745 ) ) ( not ( = ?auto_184742 ?auto_184746 ) ) ( not ( = ?auto_184743 ?auto_184744 ) ) ( not ( = ?auto_184743 ?auto_184745 ) ) ( not ( = ?auto_184743 ?auto_184746 ) ) ( not ( = ?auto_184744 ?auto_184745 ) ) ( not ( = ?auto_184744 ?auto_184746 ) ) ( not ( = ?auto_184745 ?auto_184746 ) ) ( ON ?auto_184744 ?auto_184745 ) ( ON ?auto_184743 ?auto_184744 ) ( ON ?auto_184742 ?auto_184743 ) ( CLEAR ?auto_184740 ) ( ON ?auto_184741 ?auto_184742 ) ( CLEAR ?auto_184741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184736 ?auto_184737 ?auto_184738 ?auto_184739 ?auto_184740 ?auto_184741 )
      ( MAKE-10PILE ?auto_184736 ?auto_184737 ?auto_184738 ?auto_184739 ?auto_184740 ?auto_184741 ?auto_184742 ?auto_184743 ?auto_184744 ?auto_184745 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_184778 - BLOCK
      ?auto_184779 - BLOCK
      ?auto_184780 - BLOCK
      ?auto_184781 - BLOCK
      ?auto_184782 - BLOCK
      ?auto_184783 - BLOCK
      ?auto_184784 - BLOCK
      ?auto_184785 - BLOCK
      ?auto_184786 - BLOCK
      ?auto_184787 - BLOCK
    )
    :vars
    (
      ?auto_184788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184787 ?auto_184788 ) ( ON-TABLE ?auto_184778 ) ( ON ?auto_184779 ?auto_184778 ) ( ON ?auto_184780 ?auto_184779 ) ( ON ?auto_184781 ?auto_184780 ) ( not ( = ?auto_184778 ?auto_184779 ) ) ( not ( = ?auto_184778 ?auto_184780 ) ) ( not ( = ?auto_184778 ?auto_184781 ) ) ( not ( = ?auto_184778 ?auto_184782 ) ) ( not ( = ?auto_184778 ?auto_184783 ) ) ( not ( = ?auto_184778 ?auto_184784 ) ) ( not ( = ?auto_184778 ?auto_184785 ) ) ( not ( = ?auto_184778 ?auto_184786 ) ) ( not ( = ?auto_184778 ?auto_184787 ) ) ( not ( = ?auto_184778 ?auto_184788 ) ) ( not ( = ?auto_184779 ?auto_184780 ) ) ( not ( = ?auto_184779 ?auto_184781 ) ) ( not ( = ?auto_184779 ?auto_184782 ) ) ( not ( = ?auto_184779 ?auto_184783 ) ) ( not ( = ?auto_184779 ?auto_184784 ) ) ( not ( = ?auto_184779 ?auto_184785 ) ) ( not ( = ?auto_184779 ?auto_184786 ) ) ( not ( = ?auto_184779 ?auto_184787 ) ) ( not ( = ?auto_184779 ?auto_184788 ) ) ( not ( = ?auto_184780 ?auto_184781 ) ) ( not ( = ?auto_184780 ?auto_184782 ) ) ( not ( = ?auto_184780 ?auto_184783 ) ) ( not ( = ?auto_184780 ?auto_184784 ) ) ( not ( = ?auto_184780 ?auto_184785 ) ) ( not ( = ?auto_184780 ?auto_184786 ) ) ( not ( = ?auto_184780 ?auto_184787 ) ) ( not ( = ?auto_184780 ?auto_184788 ) ) ( not ( = ?auto_184781 ?auto_184782 ) ) ( not ( = ?auto_184781 ?auto_184783 ) ) ( not ( = ?auto_184781 ?auto_184784 ) ) ( not ( = ?auto_184781 ?auto_184785 ) ) ( not ( = ?auto_184781 ?auto_184786 ) ) ( not ( = ?auto_184781 ?auto_184787 ) ) ( not ( = ?auto_184781 ?auto_184788 ) ) ( not ( = ?auto_184782 ?auto_184783 ) ) ( not ( = ?auto_184782 ?auto_184784 ) ) ( not ( = ?auto_184782 ?auto_184785 ) ) ( not ( = ?auto_184782 ?auto_184786 ) ) ( not ( = ?auto_184782 ?auto_184787 ) ) ( not ( = ?auto_184782 ?auto_184788 ) ) ( not ( = ?auto_184783 ?auto_184784 ) ) ( not ( = ?auto_184783 ?auto_184785 ) ) ( not ( = ?auto_184783 ?auto_184786 ) ) ( not ( = ?auto_184783 ?auto_184787 ) ) ( not ( = ?auto_184783 ?auto_184788 ) ) ( not ( = ?auto_184784 ?auto_184785 ) ) ( not ( = ?auto_184784 ?auto_184786 ) ) ( not ( = ?auto_184784 ?auto_184787 ) ) ( not ( = ?auto_184784 ?auto_184788 ) ) ( not ( = ?auto_184785 ?auto_184786 ) ) ( not ( = ?auto_184785 ?auto_184787 ) ) ( not ( = ?auto_184785 ?auto_184788 ) ) ( not ( = ?auto_184786 ?auto_184787 ) ) ( not ( = ?auto_184786 ?auto_184788 ) ) ( not ( = ?auto_184787 ?auto_184788 ) ) ( ON ?auto_184786 ?auto_184787 ) ( ON ?auto_184785 ?auto_184786 ) ( ON ?auto_184784 ?auto_184785 ) ( ON ?auto_184783 ?auto_184784 ) ( CLEAR ?auto_184781 ) ( ON ?auto_184782 ?auto_184783 ) ( CLEAR ?auto_184782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184778 ?auto_184779 ?auto_184780 ?auto_184781 ?auto_184782 )
      ( MAKE-10PILE ?auto_184778 ?auto_184779 ?auto_184780 ?auto_184781 ?auto_184782 ?auto_184783 ?auto_184784 ?auto_184785 ?auto_184786 ?auto_184787 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_184820 - BLOCK
      ?auto_184821 - BLOCK
      ?auto_184822 - BLOCK
      ?auto_184823 - BLOCK
      ?auto_184824 - BLOCK
      ?auto_184825 - BLOCK
      ?auto_184826 - BLOCK
      ?auto_184827 - BLOCK
      ?auto_184828 - BLOCK
      ?auto_184829 - BLOCK
    )
    :vars
    (
      ?auto_184830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184829 ?auto_184830 ) ( ON-TABLE ?auto_184820 ) ( ON ?auto_184821 ?auto_184820 ) ( ON ?auto_184822 ?auto_184821 ) ( not ( = ?auto_184820 ?auto_184821 ) ) ( not ( = ?auto_184820 ?auto_184822 ) ) ( not ( = ?auto_184820 ?auto_184823 ) ) ( not ( = ?auto_184820 ?auto_184824 ) ) ( not ( = ?auto_184820 ?auto_184825 ) ) ( not ( = ?auto_184820 ?auto_184826 ) ) ( not ( = ?auto_184820 ?auto_184827 ) ) ( not ( = ?auto_184820 ?auto_184828 ) ) ( not ( = ?auto_184820 ?auto_184829 ) ) ( not ( = ?auto_184820 ?auto_184830 ) ) ( not ( = ?auto_184821 ?auto_184822 ) ) ( not ( = ?auto_184821 ?auto_184823 ) ) ( not ( = ?auto_184821 ?auto_184824 ) ) ( not ( = ?auto_184821 ?auto_184825 ) ) ( not ( = ?auto_184821 ?auto_184826 ) ) ( not ( = ?auto_184821 ?auto_184827 ) ) ( not ( = ?auto_184821 ?auto_184828 ) ) ( not ( = ?auto_184821 ?auto_184829 ) ) ( not ( = ?auto_184821 ?auto_184830 ) ) ( not ( = ?auto_184822 ?auto_184823 ) ) ( not ( = ?auto_184822 ?auto_184824 ) ) ( not ( = ?auto_184822 ?auto_184825 ) ) ( not ( = ?auto_184822 ?auto_184826 ) ) ( not ( = ?auto_184822 ?auto_184827 ) ) ( not ( = ?auto_184822 ?auto_184828 ) ) ( not ( = ?auto_184822 ?auto_184829 ) ) ( not ( = ?auto_184822 ?auto_184830 ) ) ( not ( = ?auto_184823 ?auto_184824 ) ) ( not ( = ?auto_184823 ?auto_184825 ) ) ( not ( = ?auto_184823 ?auto_184826 ) ) ( not ( = ?auto_184823 ?auto_184827 ) ) ( not ( = ?auto_184823 ?auto_184828 ) ) ( not ( = ?auto_184823 ?auto_184829 ) ) ( not ( = ?auto_184823 ?auto_184830 ) ) ( not ( = ?auto_184824 ?auto_184825 ) ) ( not ( = ?auto_184824 ?auto_184826 ) ) ( not ( = ?auto_184824 ?auto_184827 ) ) ( not ( = ?auto_184824 ?auto_184828 ) ) ( not ( = ?auto_184824 ?auto_184829 ) ) ( not ( = ?auto_184824 ?auto_184830 ) ) ( not ( = ?auto_184825 ?auto_184826 ) ) ( not ( = ?auto_184825 ?auto_184827 ) ) ( not ( = ?auto_184825 ?auto_184828 ) ) ( not ( = ?auto_184825 ?auto_184829 ) ) ( not ( = ?auto_184825 ?auto_184830 ) ) ( not ( = ?auto_184826 ?auto_184827 ) ) ( not ( = ?auto_184826 ?auto_184828 ) ) ( not ( = ?auto_184826 ?auto_184829 ) ) ( not ( = ?auto_184826 ?auto_184830 ) ) ( not ( = ?auto_184827 ?auto_184828 ) ) ( not ( = ?auto_184827 ?auto_184829 ) ) ( not ( = ?auto_184827 ?auto_184830 ) ) ( not ( = ?auto_184828 ?auto_184829 ) ) ( not ( = ?auto_184828 ?auto_184830 ) ) ( not ( = ?auto_184829 ?auto_184830 ) ) ( ON ?auto_184828 ?auto_184829 ) ( ON ?auto_184827 ?auto_184828 ) ( ON ?auto_184826 ?auto_184827 ) ( ON ?auto_184825 ?auto_184826 ) ( ON ?auto_184824 ?auto_184825 ) ( CLEAR ?auto_184822 ) ( ON ?auto_184823 ?auto_184824 ) ( CLEAR ?auto_184823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184820 ?auto_184821 ?auto_184822 ?auto_184823 )
      ( MAKE-10PILE ?auto_184820 ?auto_184821 ?auto_184822 ?auto_184823 ?auto_184824 ?auto_184825 ?auto_184826 ?auto_184827 ?auto_184828 ?auto_184829 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_184862 - BLOCK
      ?auto_184863 - BLOCK
      ?auto_184864 - BLOCK
      ?auto_184865 - BLOCK
      ?auto_184866 - BLOCK
      ?auto_184867 - BLOCK
      ?auto_184868 - BLOCK
      ?auto_184869 - BLOCK
      ?auto_184870 - BLOCK
      ?auto_184871 - BLOCK
    )
    :vars
    (
      ?auto_184872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184871 ?auto_184872 ) ( ON-TABLE ?auto_184862 ) ( ON ?auto_184863 ?auto_184862 ) ( not ( = ?auto_184862 ?auto_184863 ) ) ( not ( = ?auto_184862 ?auto_184864 ) ) ( not ( = ?auto_184862 ?auto_184865 ) ) ( not ( = ?auto_184862 ?auto_184866 ) ) ( not ( = ?auto_184862 ?auto_184867 ) ) ( not ( = ?auto_184862 ?auto_184868 ) ) ( not ( = ?auto_184862 ?auto_184869 ) ) ( not ( = ?auto_184862 ?auto_184870 ) ) ( not ( = ?auto_184862 ?auto_184871 ) ) ( not ( = ?auto_184862 ?auto_184872 ) ) ( not ( = ?auto_184863 ?auto_184864 ) ) ( not ( = ?auto_184863 ?auto_184865 ) ) ( not ( = ?auto_184863 ?auto_184866 ) ) ( not ( = ?auto_184863 ?auto_184867 ) ) ( not ( = ?auto_184863 ?auto_184868 ) ) ( not ( = ?auto_184863 ?auto_184869 ) ) ( not ( = ?auto_184863 ?auto_184870 ) ) ( not ( = ?auto_184863 ?auto_184871 ) ) ( not ( = ?auto_184863 ?auto_184872 ) ) ( not ( = ?auto_184864 ?auto_184865 ) ) ( not ( = ?auto_184864 ?auto_184866 ) ) ( not ( = ?auto_184864 ?auto_184867 ) ) ( not ( = ?auto_184864 ?auto_184868 ) ) ( not ( = ?auto_184864 ?auto_184869 ) ) ( not ( = ?auto_184864 ?auto_184870 ) ) ( not ( = ?auto_184864 ?auto_184871 ) ) ( not ( = ?auto_184864 ?auto_184872 ) ) ( not ( = ?auto_184865 ?auto_184866 ) ) ( not ( = ?auto_184865 ?auto_184867 ) ) ( not ( = ?auto_184865 ?auto_184868 ) ) ( not ( = ?auto_184865 ?auto_184869 ) ) ( not ( = ?auto_184865 ?auto_184870 ) ) ( not ( = ?auto_184865 ?auto_184871 ) ) ( not ( = ?auto_184865 ?auto_184872 ) ) ( not ( = ?auto_184866 ?auto_184867 ) ) ( not ( = ?auto_184866 ?auto_184868 ) ) ( not ( = ?auto_184866 ?auto_184869 ) ) ( not ( = ?auto_184866 ?auto_184870 ) ) ( not ( = ?auto_184866 ?auto_184871 ) ) ( not ( = ?auto_184866 ?auto_184872 ) ) ( not ( = ?auto_184867 ?auto_184868 ) ) ( not ( = ?auto_184867 ?auto_184869 ) ) ( not ( = ?auto_184867 ?auto_184870 ) ) ( not ( = ?auto_184867 ?auto_184871 ) ) ( not ( = ?auto_184867 ?auto_184872 ) ) ( not ( = ?auto_184868 ?auto_184869 ) ) ( not ( = ?auto_184868 ?auto_184870 ) ) ( not ( = ?auto_184868 ?auto_184871 ) ) ( not ( = ?auto_184868 ?auto_184872 ) ) ( not ( = ?auto_184869 ?auto_184870 ) ) ( not ( = ?auto_184869 ?auto_184871 ) ) ( not ( = ?auto_184869 ?auto_184872 ) ) ( not ( = ?auto_184870 ?auto_184871 ) ) ( not ( = ?auto_184870 ?auto_184872 ) ) ( not ( = ?auto_184871 ?auto_184872 ) ) ( ON ?auto_184870 ?auto_184871 ) ( ON ?auto_184869 ?auto_184870 ) ( ON ?auto_184868 ?auto_184869 ) ( ON ?auto_184867 ?auto_184868 ) ( ON ?auto_184866 ?auto_184867 ) ( ON ?auto_184865 ?auto_184866 ) ( CLEAR ?auto_184863 ) ( ON ?auto_184864 ?auto_184865 ) ( CLEAR ?auto_184864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184862 ?auto_184863 ?auto_184864 )
      ( MAKE-10PILE ?auto_184862 ?auto_184863 ?auto_184864 ?auto_184865 ?auto_184866 ?auto_184867 ?auto_184868 ?auto_184869 ?auto_184870 ?auto_184871 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_184904 - BLOCK
      ?auto_184905 - BLOCK
      ?auto_184906 - BLOCK
      ?auto_184907 - BLOCK
      ?auto_184908 - BLOCK
      ?auto_184909 - BLOCK
      ?auto_184910 - BLOCK
      ?auto_184911 - BLOCK
      ?auto_184912 - BLOCK
      ?auto_184913 - BLOCK
    )
    :vars
    (
      ?auto_184914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184913 ?auto_184914 ) ( ON-TABLE ?auto_184904 ) ( not ( = ?auto_184904 ?auto_184905 ) ) ( not ( = ?auto_184904 ?auto_184906 ) ) ( not ( = ?auto_184904 ?auto_184907 ) ) ( not ( = ?auto_184904 ?auto_184908 ) ) ( not ( = ?auto_184904 ?auto_184909 ) ) ( not ( = ?auto_184904 ?auto_184910 ) ) ( not ( = ?auto_184904 ?auto_184911 ) ) ( not ( = ?auto_184904 ?auto_184912 ) ) ( not ( = ?auto_184904 ?auto_184913 ) ) ( not ( = ?auto_184904 ?auto_184914 ) ) ( not ( = ?auto_184905 ?auto_184906 ) ) ( not ( = ?auto_184905 ?auto_184907 ) ) ( not ( = ?auto_184905 ?auto_184908 ) ) ( not ( = ?auto_184905 ?auto_184909 ) ) ( not ( = ?auto_184905 ?auto_184910 ) ) ( not ( = ?auto_184905 ?auto_184911 ) ) ( not ( = ?auto_184905 ?auto_184912 ) ) ( not ( = ?auto_184905 ?auto_184913 ) ) ( not ( = ?auto_184905 ?auto_184914 ) ) ( not ( = ?auto_184906 ?auto_184907 ) ) ( not ( = ?auto_184906 ?auto_184908 ) ) ( not ( = ?auto_184906 ?auto_184909 ) ) ( not ( = ?auto_184906 ?auto_184910 ) ) ( not ( = ?auto_184906 ?auto_184911 ) ) ( not ( = ?auto_184906 ?auto_184912 ) ) ( not ( = ?auto_184906 ?auto_184913 ) ) ( not ( = ?auto_184906 ?auto_184914 ) ) ( not ( = ?auto_184907 ?auto_184908 ) ) ( not ( = ?auto_184907 ?auto_184909 ) ) ( not ( = ?auto_184907 ?auto_184910 ) ) ( not ( = ?auto_184907 ?auto_184911 ) ) ( not ( = ?auto_184907 ?auto_184912 ) ) ( not ( = ?auto_184907 ?auto_184913 ) ) ( not ( = ?auto_184907 ?auto_184914 ) ) ( not ( = ?auto_184908 ?auto_184909 ) ) ( not ( = ?auto_184908 ?auto_184910 ) ) ( not ( = ?auto_184908 ?auto_184911 ) ) ( not ( = ?auto_184908 ?auto_184912 ) ) ( not ( = ?auto_184908 ?auto_184913 ) ) ( not ( = ?auto_184908 ?auto_184914 ) ) ( not ( = ?auto_184909 ?auto_184910 ) ) ( not ( = ?auto_184909 ?auto_184911 ) ) ( not ( = ?auto_184909 ?auto_184912 ) ) ( not ( = ?auto_184909 ?auto_184913 ) ) ( not ( = ?auto_184909 ?auto_184914 ) ) ( not ( = ?auto_184910 ?auto_184911 ) ) ( not ( = ?auto_184910 ?auto_184912 ) ) ( not ( = ?auto_184910 ?auto_184913 ) ) ( not ( = ?auto_184910 ?auto_184914 ) ) ( not ( = ?auto_184911 ?auto_184912 ) ) ( not ( = ?auto_184911 ?auto_184913 ) ) ( not ( = ?auto_184911 ?auto_184914 ) ) ( not ( = ?auto_184912 ?auto_184913 ) ) ( not ( = ?auto_184912 ?auto_184914 ) ) ( not ( = ?auto_184913 ?auto_184914 ) ) ( ON ?auto_184912 ?auto_184913 ) ( ON ?auto_184911 ?auto_184912 ) ( ON ?auto_184910 ?auto_184911 ) ( ON ?auto_184909 ?auto_184910 ) ( ON ?auto_184908 ?auto_184909 ) ( ON ?auto_184907 ?auto_184908 ) ( ON ?auto_184906 ?auto_184907 ) ( CLEAR ?auto_184904 ) ( ON ?auto_184905 ?auto_184906 ) ( CLEAR ?auto_184905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184904 ?auto_184905 )
      ( MAKE-10PILE ?auto_184904 ?auto_184905 ?auto_184906 ?auto_184907 ?auto_184908 ?auto_184909 ?auto_184910 ?auto_184911 ?auto_184912 ?auto_184913 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_184946 - BLOCK
      ?auto_184947 - BLOCK
      ?auto_184948 - BLOCK
      ?auto_184949 - BLOCK
      ?auto_184950 - BLOCK
      ?auto_184951 - BLOCK
      ?auto_184952 - BLOCK
      ?auto_184953 - BLOCK
      ?auto_184954 - BLOCK
      ?auto_184955 - BLOCK
    )
    :vars
    (
      ?auto_184956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184955 ?auto_184956 ) ( not ( = ?auto_184946 ?auto_184947 ) ) ( not ( = ?auto_184946 ?auto_184948 ) ) ( not ( = ?auto_184946 ?auto_184949 ) ) ( not ( = ?auto_184946 ?auto_184950 ) ) ( not ( = ?auto_184946 ?auto_184951 ) ) ( not ( = ?auto_184946 ?auto_184952 ) ) ( not ( = ?auto_184946 ?auto_184953 ) ) ( not ( = ?auto_184946 ?auto_184954 ) ) ( not ( = ?auto_184946 ?auto_184955 ) ) ( not ( = ?auto_184946 ?auto_184956 ) ) ( not ( = ?auto_184947 ?auto_184948 ) ) ( not ( = ?auto_184947 ?auto_184949 ) ) ( not ( = ?auto_184947 ?auto_184950 ) ) ( not ( = ?auto_184947 ?auto_184951 ) ) ( not ( = ?auto_184947 ?auto_184952 ) ) ( not ( = ?auto_184947 ?auto_184953 ) ) ( not ( = ?auto_184947 ?auto_184954 ) ) ( not ( = ?auto_184947 ?auto_184955 ) ) ( not ( = ?auto_184947 ?auto_184956 ) ) ( not ( = ?auto_184948 ?auto_184949 ) ) ( not ( = ?auto_184948 ?auto_184950 ) ) ( not ( = ?auto_184948 ?auto_184951 ) ) ( not ( = ?auto_184948 ?auto_184952 ) ) ( not ( = ?auto_184948 ?auto_184953 ) ) ( not ( = ?auto_184948 ?auto_184954 ) ) ( not ( = ?auto_184948 ?auto_184955 ) ) ( not ( = ?auto_184948 ?auto_184956 ) ) ( not ( = ?auto_184949 ?auto_184950 ) ) ( not ( = ?auto_184949 ?auto_184951 ) ) ( not ( = ?auto_184949 ?auto_184952 ) ) ( not ( = ?auto_184949 ?auto_184953 ) ) ( not ( = ?auto_184949 ?auto_184954 ) ) ( not ( = ?auto_184949 ?auto_184955 ) ) ( not ( = ?auto_184949 ?auto_184956 ) ) ( not ( = ?auto_184950 ?auto_184951 ) ) ( not ( = ?auto_184950 ?auto_184952 ) ) ( not ( = ?auto_184950 ?auto_184953 ) ) ( not ( = ?auto_184950 ?auto_184954 ) ) ( not ( = ?auto_184950 ?auto_184955 ) ) ( not ( = ?auto_184950 ?auto_184956 ) ) ( not ( = ?auto_184951 ?auto_184952 ) ) ( not ( = ?auto_184951 ?auto_184953 ) ) ( not ( = ?auto_184951 ?auto_184954 ) ) ( not ( = ?auto_184951 ?auto_184955 ) ) ( not ( = ?auto_184951 ?auto_184956 ) ) ( not ( = ?auto_184952 ?auto_184953 ) ) ( not ( = ?auto_184952 ?auto_184954 ) ) ( not ( = ?auto_184952 ?auto_184955 ) ) ( not ( = ?auto_184952 ?auto_184956 ) ) ( not ( = ?auto_184953 ?auto_184954 ) ) ( not ( = ?auto_184953 ?auto_184955 ) ) ( not ( = ?auto_184953 ?auto_184956 ) ) ( not ( = ?auto_184954 ?auto_184955 ) ) ( not ( = ?auto_184954 ?auto_184956 ) ) ( not ( = ?auto_184955 ?auto_184956 ) ) ( ON ?auto_184954 ?auto_184955 ) ( ON ?auto_184953 ?auto_184954 ) ( ON ?auto_184952 ?auto_184953 ) ( ON ?auto_184951 ?auto_184952 ) ( ON ?auto_184950 ?auto_184951 ) ( ON ?auto_184949 ?auto_184950 ) ( ON ?auto_184948 ?auto_184949 ) ( ON ?auto_184947 ?auto_184948 ) ( ON ?auto_184946 ?auto_184947 ) ( CLEAR ?auto_184946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_184946 )
      ( MAKE-10PILE ?auto_184946 ?auto_184947 ?auto_184948 ?auto_184949 ?auto_184950 ?auto_184951 ?auto_184952 ?auto_184953 ?auto_184954 ?auto_184955 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_184989 - BLOCK
      ?auto_184990 - BLOCK
      ?auto_184991 - BLOCK
      ?auto_184992 - BLOCK
      ?auto_184993 - BLOCK
      ?auto_184994 - BLOCK
      ?auto_184995 - BLOCK
      ?auto_184996 - BLOCK
      ?auto_184997 - BLOCK
      ?auto_184998 - BLOCK
      ?auto_184999 - BLOCK
    )
    :vars
    (
      ?auto_185000 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_184998 ) ( ON ?auto_184999 ?auto_185000 ) ( CLEAR ?auto_184999 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_184989 ) ( ON ?auto_184990 ?auto_184989 ) ( ON ?auto_184991 ?auto_184990 ) ( ON ?auto_184992 ?auto_184991 ) ( ON ?auto_184993 ?auto_184992 ) ( ON ?auto_184994 ?auto_184993 ) ( ON ?auto_184995 ?auto_184994 ) ( ON ?auto_184996 ?auto_184995 ) ( ON ?auto_184997 ?auto_184996 ) ( ON ?auto_184998 ?auto_184997 ) ( not ( = ?auto_184989 ?auto_184990 ) ) ( not ( = ?auto_184989 ?auto_184991 ) ) ( not ( = ?auto_184989 ?auto_184992 ) ) ( not ( = ?auto_184989 ?auto_184993 ) ) ( not ( = ?auto_184989 ?auto_184994 ) ) ( not ( = ?auto_184989 ?auto_184995 ) ) ( not ( = ?auto_184989 ?auto_184996 ) ) ( not ( = ?auto_184989 ?auto_184997 ) ) ( not ( = ?auto_184989 ?auto_184998 ) ) ( not ( = ?auto_184989 ?auto_184999 ) ) ( not ( = ?auto_184989 ?auto_185000 ) ) ( not ( = ?auto_184990 ?auto_184991 ) ) ( not ( = ?auto_184990 ?auto_184992 ) ) ( not ( = ?auto_184990 ?auto_184993 ) ) ( not ( = ?auto_184990 ?auto_184994 ) ) ( not ( = ?auto_184990 ?auto_184995 ) ) ( not ( = ?auto_184990 ?auto_184996 ) ) ( not ( = ?auto_184990 ?auto_184997 ) ) ( not ( = ?auto_184990 ?auto_184998 ) ) ( not ( = ?auto_184990 ?auto_184999 ) ) ( not ( = ?auto_184990 ?auto_185000 ) ) ( not ( = ?auto_184991 ?auto_184992 ) ) ( not ( = ?auto_184991 ?auto_184993 ) ) ( not ( = ?auto_184991 ?auto_184994 ) ) ( not ( = ?auto_184991 ?auto_184995 ) ) ( not ( = ?auto_184991 ?auto_184996 ) ) ( not ( = ?auto_184991 ?auto_184997 ) ) ( not ( = ?auto_184991 ?auto_184998 ) ) ( not ( = ?auto_184991 ?auto_184999 ) ) ( not ( = ?auto_184991 ?auto_185000 ) ) ( not ( = ?auto_184992 ?auto_184993 ) ) ( not ( = ?auto_184992 ?auto_184994 ) ) ( not ( = ?auto_184992 ?auto_184995 ) ) ( not ( = ?auto_184992 ?auto_184996 ) ) ( not ( = ?auto_184992 ?auto_184997 ) ) ( not ( = ?auto_184992 ?auto_184998 ) ) ( not ( = ?auto_184992 ?auto_184999 ) ) ( not ( = ?auto_184992 ?auto_185000 ) ) ( not ( = ?auto_184993 ?auto_184994 ) ) ( not ( = ?auto_184993 ?auto_184995 ) ) ( not ( = ?auto_184993 ?auto_184996 ) ) ( not ( = ?auto_184993 ?auto_184997 ) ) ( not ( = ?auto_184993 ?auto_184998 ) ) ( not ( = ?auto_184993 ?auto_184999 ) ) ( not ( = ?auto_184993 ?auto_185000 ) ) ( not ( = ?auto_184994 ?auto_184995 ) ) ( not ( = ?auto_184994 ?auto_184996 ) ) ( not ( = ?auto_184994 ?auto_184997 ) ) ( not ( = ?auto_184994 ?auto_184998 ) ) ( not ( = ?auto_184994 ?auto_184999 ) ) ( not ( = ?auto_184994 ?auto_185000 ) ) ( not ( = ?auto_184995 ?auto_184996 ) ) ( not ( = ?auto_184995 ?auto_184997 ) ) ( not ( = ?auto_184995 ?auto_184998 ) ) ( not ( = ?auto_184995 ?auto_184999 ) ) ( not ( = ?auto_184995 ?auto_185000 ) ) ( not ( = ?auto_184996 ?auto_184997 ) ) ( not ( = ?auto_184996 ?auto_184998 ) ) ( not ( = ?auto_184996 ?auto_184999 ) ) ( not ( = ?auto_184996 ?auto_185000 ) ) ( not ( = ?auto_184997 ?auto_184998 ) ) ( not ( = ?auto_184997 ?auto_184999 ) ) ( not ( = ?auto_184997 ?auto_185000 ) ) ( not ( = ?auto_184998 ?auto_184999 ) ) ( not ( = ?auto_184998 ?auto_185000 ) ) ( not ( = ?auto_184999 ?auto_185000 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_184999 ?auto_185000 )
      ( !STACK ?auto_184999 ?auto_184998 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_185035 - BLOCK
      ?auto_185036 - BLOCK
      ?auto_185037 - BLOCK
      ?auto_185038 - BLOCK
      ?auto_185039 - BLOCK
      ?auto_185040 - BLOCK
      ?auto_185041 - BLOCK
      ?auto_185042 - BLOCK
      ?auto_185043 - BLOCK
      ?auto_185044 - BLOCK
      ?auto_185045 - BLOCK
    )
    :vars
    (
      ?auto_185046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185045 ?auto_185046 ) ( ON-TABLE ?auto_185035 ) ( ON ?auto_185036 ?auto_185035 ) ( ON ?auto_185037 ?auto_185036 ) ( ON ?auto_185038 ?auto_185037 ) ( ON ?auto_185039 ?auto_185038 ) ( ON ?auto_185040 ?auto_185039 ) ( ON ?auto_185041 ?auto_185040 ) ( ON ?auto_185042 ?auto_185041 ) ( ON ?auto_185043 ?auto_185042 ) ( not ( = ?auto_185035 ?auto_185036 ) ) ( not ( = ?auto_185035 ?auto_185037 ) ) ( not ( = ?auto_185035 ?auto_185038 ) ) ( not ( = ?auto_185035 ?auto_185039 ) ) ( not ( = ?auto_185035 ?auto_185040 ) ) ( not ( = ?auto_185035 ?auto_185041 ) ) ( not ( = ?auto_185035 ?auto_185042 ) ) ( not ( = ?auto_185035 ?auto_185043 ) ) ( not ( = ?auto_185035 ?auto_185044 ) ) ( not ( = ?auto_185035 ?auto_185045 ) ) ( not ( = ?auto_185035 ?auto_185046 ) ) ( not ( = ?auto_185036 ?auto_185037 ) ) ( not ( = ?auto_185036 ?auto_185038 ) ) ( not ( = ?auto_185036 ?auto_185039 ) ) ( not ( = ?auto_185036 ?auto_185040 ) ) ( not ( = ?auto_185036 ?auto_185041 ) ) ( not ( = ?auto_185036 ?auto_185042 ) ) ( not ( = ?auto_185036 ?auto_185043 ) ) ( not ( = ?auto_185036 ?auto_185044 ) ) ( not ( = ?auto_185036 ?auto_185045 ) ) ( not ( = ?auto_185036 ?auto_185046 ) ) ( not ( = ?auto_185037 ?auto_185038 ) ) ( not ( = ?auto_185037 ?auto_185039 ) ) ( not ( = ?auto_185037 ?auto_185040 ) ) ( not ( = ?auto_185037 ?auto_185041 ) ) ( not ( = ?auto_185037 ?auto_185042 ) ) ( not ( = ?auto_185037 ?auto_185043 ) ) ( not ( = ?auto_185037 ?auto_185044 ) ) ( not ( = ?auto_185037 ?auto_185045 ) ) ( not ( = ?auto_185037 ?auto_185046 ) ) ( not ( = ?auto_185038 ?auto_185039 ) ) ( not ( = ?auto_185038 ?auto_185040 ) ) ( not ( = ?auto_185038 ?auto_185041 ) ) ( not ( = ?auto_185038 ?auto_185042 ) ) ( not ( = ?auto_185038 ?auto_185043 ) ) ( not ( = ?auto_185038 ?auto_185044 ) ) ( not ( = ?auto_185038 ?auto_185045 ) ) ( not ( = ?auto_185038 ?auto_185046 ) ) ( not ( = ?auto_185039 ?auto_185040 ) ) ( not ( = ?auto_185039 ?auto_185041 ) ) ( not ( = ?auto_185039 ?auto_185042 ) ) ( not ( = ?auto_185039 ?auto_185043 ) ) ( not ( = ?auto_185039 ?auto_185044 ) ) ( not ( = ?auto_185039 ?auto_185045 ) ) ( not ( = ?auto_185039 ?auto_185046 ) ) ( not ( = ?auto_185040 ?auto_185041 ) ) ( not ( = ?auto_185040 ?auto_185042 ) ) ( not ( = ?auto_185040 ?auto_185043 ) ) ( not ( = ?auto_185040 ?auto_185044 ) ) ( not ( = ?auto_185040 ?auto_185045 ) ) ( not ( = ?auto_185040 ?auto_185046 ) ) ( not ( = ?auto_185041 ?auto_185042 ) ) ( not ( = ?auto_185041 ?auto_185043 ) ) ( not ( = ?auto_185041 ?auto_185044 ) ) ( not ( = ?auto_185041 ?auto_185045 ) ) ( not ( = ?auto_185041 ?auto_185046 ) ) ( not ( = ?auto_185042 ?auto_185043 ) ) ( not ( = ?auto_185042 ?auto_185044 ) ) ( not ( = ?auto_185042 ?auto_185045 ) ) ( not ( = ?auto_185042 ?auto_185046 ) ) ( not ( = ?auto_185043 ?auto_185044 ) ) ( not ( = ?auto_185043 ?auto_185045 ) ) ( not ( = ?auto_185043 ?auto_185046 ) ) ( not ( = ?auto_185044 ?auto_185045 ) ) ( not ( = ?auto_185044 ?auto_185046 ) ) ( not ( = ?auto_185045 ?auto_185046 ) ) ( CLEAR ?auto_185043 ) ( ON ?auto_185044 ?auto_185045 ) ( CLEAR ?auto_185044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_185035 ?auto_185036 ?auto_185037 ?auto_185038 ?auto_185039 ?auto_185040 ?auto_185041 ?auto_185042 ?auto_185043 ?auto_185044 )
      ( MAKE-11PILE ?auto_185035 ?auto_185036 ?auto_185037 ?auto_185038 ?auto_185039 ?auto_185040 ?auto_185041 ?auto_185042 ?auto_185043 ?auto_185044 ?auto_185045 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_185081 - BLOCK
      ?auto_185082 - BLOCK
      ?auto_185083 - BLOCK
      ?auto_185084 - BLOCK
      ?auto_185085 - BLOCK
      ?auto_185086 - BLOCK
      ?auto_185087 - BLOCK
      ?auto_185088 - BLOCK
      ?auto_185089 - BLOCK
      ?auto_185090 - BLOCK
      ?auto_185091 - BLOCK
    )
    :vars
    (
      ?auto_185092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185091 ?auto_185092 ) ( ON-TABLE ?auto_185081 ) ( ON ?auto_185082 ?auto_185081 ) ( ON ?auto_185083 ?auto_185082 ) ( ON ?auto_185084 ?auto_185083 ) ( ON ?auto_185085 ?auto_185084 ) ( ON ?auto_185086 ?auto_185085 ) ( ON ?auto_185087 ?auto_185086 ) ( ON ?auto_185088 ?auto_185087 ) ( not ( = ?auto_185081 ?auto_185082 ) ) ( not ( = ?auto_185081 ?auto_185083 ) ) ( not ( = ?auto_185081 ?auto_185084 ) ) ( not ( = ?auto_185081 ?auto_185085 ) ) ( not ( = ?auto_185081 ?auto_185086 ) ) ( not ( = ?auto_185081 ?auto_185087 ) ) ( not ( = ?auto_185081 ?auto_185088 ) ) ( not ( = ?auto_185081 ?auto_185089 ) ) ( not ( = ?auto_185081 ?auto_185090 ) ) ( not ( = ?auto_185081 ?auto_185091 ) ) ( not ( = ?auto_185081 ?auto_185092 ) ) ( not ( = ?auto_185082 ?auto_185083 ) ) ( not ( = ?auto_185082 ?auto_185084 ) ) ( not ( = ?auto_185082 ?auto_185085 ) ) ( not ( = ?auto_185082 ?auto_185086 ) ) ( not ( = ?auto_185082 ?auto_185087 ) ) ( not ( = ?auto_185082 ?auto_185088 ) ) ( not ( = ?auto_185082 ?auto_185089 ) ) ( not ( = ?auto_185082 ?auto_185090 ) ) ( not ( = ?auto_185082 ?auto_185091 ) ) ( not ( = ?auto_185082 ?auto_185092 ) ) ( not ( = ?auto_185083 ?auto_185084 ) ) ( not ( = ?auto_185083 ?auto_185085 ) ) ( not ( = ?auto_185083 ?auto_185086 ) ) ( not ( = ?auto_185083 ?auto_185087 ) ) ( not ( = ?auto_185083 ?auto_185088 ) ) ( not ( = ?auto_185083 ?auto_185089 ) ) ( not ( = ?auto_185083 ?auto_185090 ) ) ( not ( = ?auto_185083 ?auto_185091 ) ) ( not ( = ?auto_185083 ?auto_185092 ) ) ( not ( = ?auto_185084 ?auto_185085 ) ) ( not ( = ?auto_185084 ?auto_185086 ) ) ( not ( = ?auto_185084 ?auto_185087 ) ) ( not ( = ?auto_185084 ?auto_185088 ) ) ( not ( = ?auto_185084 ?auto_185089 ) ) ( not ( = ?auto_185084 ?auto_185090 ) ) ( not ( = ?auto_185084 ?auto_185091 ) ) ( not ( = ?auto_185084 ?auto_185092 ) ) ( not ( = ?auto_185085 ?auto_185086 ) ) ( not ( = ?auto_185085 ?auto_185087 ) ) ( not ( = ?auto_185085 ?auto_185088 ) ) ( not ( = ?auto_185085 ?auto_185089 ) ) ( not ( = ?auto_185085 ?auto_185090 ) ) ( not ( = ?auto_185085 ?auto_185091 ) ) ( not ( = ?auto_185085 ?auto_185092 ) ) ( not ( = ?auto_185086 ?auto_185087 ) ) ( not ( = ?auto_185086 ?auto_185088 ) ) ( not ( = ?auto_185086 ?auto_185089 ) ) ( not ( = ?auto_185086 ?auto_185090 ) ) ( not ( = ?auto_185086 ?auto_185091 ) ) ( not ( = ?auto_185086 ?auto_185092 ) ) ( not ( = ?auto_185087 ?auto_185088 ) ) ( not ( = ?auto_185087 ?auto_185089 ) ) ( not ( = ?auto_185087 ?auto_185090 ) ) ( not ( = ?auto_185087 ?auto_185091 ) ) ( not ( = ?auto_185087 ?auto_185092 ) ) ( not ( = ?auto_185088 ?auto_185089 ) ) ( not ( = ?auto_185088 ?auto_185090 ) ) ( not ( = ?auto_185088 ?auto_185091 ) ) ( not ( = ?auto_185088 ?auto_185092 ) ) ( not ( = ?auto_185089 ?auto_185090 ) ) ( not ( = ?auto_185089 ?auto_185091 ) ) ( not ( = ?auto_185089 ?auto_185092 ) ) ( not ( = ?auto_185090 ?auto_185091 ) ) ( not ( = ?auto_185090 ?auto_185092 ) ) ( not ( = ?auto_185091 ?auto_185092 ) ) ( ON ?auto_185090 ?auto_185091 ) ( CLEAR ?auto_185088 ) ( ON ?auto_185089 ?auto_185090 ) ( CLEAR ?auto_185089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_185081 ?auto_185082 ?auto_185083 ?auto_185084 ?auto_185085 ?auto_185086 ?auto_185087 ?auto_185088 ?auto_185089 )
      ( MAKE-11PILE ?auto_185081 ?auto_185082 ?auto_185083 ?auto_185084 ?auto_185085 ?auto_185086 ?auto_185087 ?auto_185088 ?auto_185089 ?auto_185090 ?auto_185091 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_185127 - BLOCK
      ?auto_185128 - BLOCK
      ?auto_185129 - BLOCK
      ?auto_185130 - BLOCK
      ?auto_185131 - BLOCK
      ?auto_185132 - BLOCK
      ?auto_185133 - BLOCK
      ?auto_185134 - BLOCK
      ?auto_185135 - BLOCK
      ?auto_185136 - BLOCK
      ?auto_185137 - BLOCK
    )
    :vars
    (
      ?auto_185138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185137 ?auto_185138 ) ( ON-TABLE ?auto_185127 ) ( ON ?auto_185128 ?auto_185127 ) ( ON ?auto_185129 ?auto_185128 ) ( ON ?auto_185130 ?auto_185129 ) ( ON ?auto_185131 ?auto_185130 ) ( ON ?auto_185132 ?auto_185131 ) ( ON ?auto_185133 ?auto_185132 ) ( not ( = ?auto_185127 ?auto_185128 ) ) ( not ( = ?auto_185127 ?auto_185129 ) ) ( not ( = ?auto_185127 ?auto_185130 ) ) ( not ( = ?auto_185127 ?auto_185131 ) ) ( not ( = ?auto_185127 ?auto_185132 ) ) ( not ( = ?auto_185127 ?auto_185133 ) ) ( not ( = ?auto_185127 ?auto_185134 ) ) ( not ( = ?auto_185127 ?auto_185135 ) ) ( not ( = ?auto_185127 ?auto_185136 ) ) ( not ( = ?auto_185127 ?auto_185137 ) ) ( not ( = ?auto_185127 ?auto_185138 ) ) ( not ( = ?auto_185128 ?auto_185129 ) ) ( not ( = ?auto_185128 ?auto_185130 ) ) ( not ( = ?auto_185128 ?auto_185131 ) ) ( not ( = ?auto_185128 ?auto_185132 ) ) ( not ( = ?auto_185128 ?auto_185133 ) ) ( not ( = ?auto_185128 ?auto_185134 ) ) ( not ( = ?auto_185128 ?auto_185135 ) ) ( not ( = ?auto_185128 ?auto_185136 ) ) ( not ( = ?auto_185128 ?auto_185137 ) ) ( not ( = ?auto_185128 ?auto_185138 ) ) ( not ( = ?auto_185129 ?auto_185130 ) ) ( not ( = ?auto_185129 ?auto_185131 ) ) ( not ( = ?auto_185129 ?auto_185132 ) ) ( not ( = ?auto_185129 ?auto_185133 ) ) ( not ( = ?auto_185129 ?auto_185134 ) ) ( not ( = ?auto_185129 ?auto_185135 ) ) ( not ( = ?auto_185129 ?auto_185136 ) ) ( not ( = ?auto_185129 ?auto_185137 ) ) ( not ( = ?auto_185129 ?auto_185138 ) ) ( not ( = ?auto_185130 ?auto_185131 ) ) ( not ( = ?auto_185130 ?auto_185132 ) ) ( not ( = ?auto_185130 ?auto_185133 ) ) ( not ( = ?auto_185130 ?auto_185134 ) ) ( not ( = ?auto_185130 ?auto_185135 ) ) ( not ( = ?auto_185130 ?auto_185136 ) ) ( not ( = ?auto_185130 ?auto_185137 ) ) ( not ( = ?auto_185130 ?auto_185138 ) ) ( not ( = ?auto_185131 ?auto_185132 ) ) ( not ( = ?auto_185131 ?auto_185133 ) ) ( not ( = ?auto_185131 ?auto_185134 ) ) ( not ( = ?auto_185131 ?auto_185135 ) ) ( not ( = ?auto_185131 ?auto_185136 ) ) ( not ( = ?auto_185131 ?auto_185137 ) ) ( not ( = ?auto_185131 ?auto_185138 ) ) ( not ( = ?auto_185132 ?auto_185133 ) ) ( not ( = ?auto_185132 ?auto_185134 ) ) ( not ( = ?auto_185132 ?auto_185135 ) ) ( not ( = ?auto_185132 ?auto_185136 ) ) ( not ( = ?auto_185132 ?auto_185137 ) ) ( not ( = ?auto_185132 ?auto_185138 ) ) ( not ( = ?auto_185133 ?auto_185134 ) ) ( not ( = ?auto_185133 ?auto_185135 ) ) ( not ( = ?auto_185133 ?auto_185136 ) ) ( not ( = ?auto_185133 ?auto_185137 ) ) ( not ( = ?auto_185133 ?auto_185138 ) ) ( not ( = ?auto_185134 ?auto_185135 ) ) ( not ( = ?auto_185134 ?auto_185136 ) ) ( not ( = ?auto_185134 ?auto_185137 ) ) ( not ( = ?auto_185134 ?auto_185138 ) ) ( not ( = ?auto_185135 ?auto_185136 ) ) ( not ( = ?auto_185135 ?auto_185137 ) ) ( not ( = ?auto_185135 ?auto_185138 ) ) ( not ( = ?auto_185136 ?auto_185137 ) ) ( not ( = ?auto_185136 ?auto_185138 ) ) ( not ( = ?auto_185137 ?auto_185138 ) ) ( ON ?auto_185136 ?auto_185137 ) ( ON ?auto_185135 ?auto_185136 ) ( CLEAR ?auto_185133 ) ( ON ?auto_185134 ?auto_185135 ) ( CLEAR ?auto_185134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_185127 ?auto_185128 ?auto_185129 ?auto_185130 ?auto_185131 ?auto_185132 ?auto_185133 ?auto_185134 )
      ( MAKE-11PILE ?auto_185127 ?auto_185128 ?auto_185129 ?auto_185130 ?auto_185131 ?auto_185132 ?auto_185133 ?auto_185134 ?auto_185135 ?auto_185136 ?auto_185137 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_185173 - BLOCK
      ?auto_185174 - BLOCK
      ?auto_185175 - BLOCK
      ?auto_185176 - BLOCK
      ?auto_185177 - BLOCK
      ?auto_185178 - BLOCK
      ?auto_185179 - BLOCK
      ?auto_185180 - BLOCK
      ?auto_185181 - BLOCK
      ?auto_185182 - BLOCK
      ?auto_185183 - BLOCK
    )
    :vars
    (
      ?auto_185184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185183 ?auto_185184 ) ( ON-TABLE ?auto_185173 ) ( ON ?auto_185174 ?auto_185173 ) ( ON ?auto_185175 ?auto_185174 ) ( ON ?auto_185176 ?auto_185175 ) ( ON ?auto_185177 ?auto_185176 ) ( ON ?auto_185178 ?auto_185177 ) ( not ( = ?auto_185173 ?auto_185174 ) ) ( not ( = ?auto_185173 ?auto_185175 ) ) ( not ( = ?auto_185173 ?auto_185176 ) ) ( not ( = ?auto_185173 ?auto_185177 ) ) ( not ( = ?auto_185173 ?auto_185178 ) ) ( not ( = ?auto_185173 ?auto_185179 ) ) ( not ( = ?auto_185173 ?auto_185180 ) ) ( not ( = ?auto_185173 ?auto_185181 ) ) ( not ( = ?auto_185173 ?auto_185182 ) ) ( not ( = ?auto_185173 ?auto_185183 ) ) ( not ( = ?auto_185173 ?auto_185184 ) ) ( not ( = ?auto_185174 ?auto_185175 ) ) ( not ( = ?auto_185174 ?auto_185176 ) ) ( not ( = ?auto_185174 ?auto_185177 ) ) ( not ( = ?auto_185174 ?auto_185178 ) ) ( not ( = ?auto_185174 ?auto_185179 ) ) ( not ( = ?auto_185174 ?auto_185180 ) ) ( not ( = ?auto_185174 ?auto_185181 ) ) ( not ( = ?auto_185174 ?auto_185182 ) ) ( not ( = ?auto_185174 ?auto_185183 ) ) ( not ( = ?auto_185174 ?auto_185184 ) ) ( not ( = ?auto_185175 ?auto_185176 ) ) ( not ( = ?auto_185175 ?auto_185177 ) ) ( not ( = ?auto_185175 ?auto_185178 ) ) ( not ( = ?auto_185175 ?auto_185179 ) ) ( not ( = ?auto_185175 ?auto_185180 ) ) ( not ( = ?auto_185175 ?auto_185181 ) ) ( not ( = ?auto_185175 ?auto_185182 ) ) ( not ( = ?auto_185175 ?auto_185183 ) ) ( not ( = ?auto_185175 ?auto_185184 ) ) ( not ( = ?auto_185176 ?auto_185177 ) ) ( not ( = ?auto_185176 ?auto_185178 ) ) ( not ( = ?auto_185176 ?auto_185179 ) ) ( not ( = ?auto_185176 ?auto_185180 ) ) ( not ( = ?auto_185176 ?auto_185181 ) ) ( not ( = ?auto_185176 ?auto_185182 ) ) ( not ( = ?auto_185176 ?auto_185183 ) ) ( not ( = ?auto_185176 ?auto_185184 ) ) ( not ( = ?auto_185177 ?auto_185178 ) ) ( not ( = ?auto_185177 ?auto_185179 ) ) ( not ( = ?auto_185177 ?auto_185180 ) ) ( not ( = ?auto_185177 ?auto_185181 ) ) ( not ( = ?auto_185177 ?auto_185182 ) ) ( not ( = ?auto_185177 ?auto_185183 ) ) ( not ( = ?auto_185177 ?auto_185184 ) ) ( not ( = ?auto_185178 ?auto_185179 ) ) ( not ( = ?auto_185178 ?auto_185180 ) ) ( not ( = ?auto_185178 ?auto_185181 ) ) ( not ( = ?auto_185178 ?auto_185182 ) ) ( not ( = ?auto_185178 ?auto_185183 ) ) ( not ( = ?auto_185178 ?auto_185184 ) ) ( not ( = ?auto_185179 ?auto_185180 ) ) ( not ( = ?auto_185179 ?auto_185181 ) ) ( not ( = ?auto_185179 ?auto_185182 ) ) ( not ( = ?auto_185179 ?auto_185183 ) ) ( not ( = ?auto_185179 ?auto_185184 ) ) ( not ( = ?auto_185180 ?auto_185181 ) ) ( not ( = ?auto_185180 ?auto_185182 ) ) ( not ( = ?auto_185180 ?auto_185183 ) ) ( not ( = ?auto_185180 ?auto_185184 ) ) ( not ( = ?auto_185181 ?auto_185182 ) ) ( not ( = ?auto_185181 ?auto_185183 ) ) ( not ( = ?auto_185181 ?auto_185184 ) ) ( not ( = ?auto_185182 ?auto_185183 ) ) ( not ( = ?auto_185182 ?auto_185184 ) ) ( not ( = ?auto_185183 ?auto_185184 ) ) ( ON ?auto_185182 ?auto_185183 ) ( ON ?auto_185181 ?auto_185182 ) ( ON ?auto_185180 ?auto_185181 ) ( CLEAR ?auto_185178 ) ( ON ?auto_185179 ?auto_185180 ) ( CLEAR ?auto_185179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185173 ?auto_185174 ?auto_185175 ?auto_185176 ?auto_185177 ?auto_185178 ?auto_185179 )
      ( MAKE-11PILE ?auto_185173 ?auto_185174 ?auto_185175 ?auto_185176 ?auto_185177 ?auto_185178 ?auto_185179 ?auto_185180 ?auto_185181 ?auto_185182 ?auto_185183 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_185219 - BLOCK
      ?auto_185220 - BLOCK
      ?auto_185221 - BLOCK
      ?auto_185222 - BLOCK
      ?auto_185223 - BLOCK
      ?auto_185224 - BLOCK
      ?auto_185225 - BLOCK
      ?auto_185226 - BLOCK
      ?auto_185227 - BLOCK
      ?auto_185228 - BLOCK
      ?auto_185229 - BLOCK
    )
    :vars
    (
      ?auto_185230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185229 ?auto_185230 ) ( ON-TABLE ?auto_185219 ) ( ON ?auto_185220 ?auto_185219 ) ( ON ?auto_185221 ?auto_185220 ) ( ON ?auto_185222 ?auto_185221 ) ( ON ?auto_185223 ?auto_185222 ) ( not ( = ?auto_185219 ?auto_185220 ) ) ( not ( = ?auto_185219 ?auto_185221 ) ) ( not ( = ?auto_185219 ?auto_185222 ) ) ( not ( = ?auto_185219 ?auto_185223 ) ) ( not ( = ?auto_185219 ?auto_185224 ) ) ( not ( = ?auto_185219 ?auto_185225 ) ) ( not ( = ?auto_185219 ?auto_185226 ) ) ( not ( = ?auto_185219 ?auto_185227 ) ) ( not ( = ?auto_185219 ?auto_185228 ) ) ( not ( = ?auto_185219 ?auto_185229 ) ) ( not ( = ?auto_185219 ?auto_185230 ) ) ( not ( = ?auto_185220 ?auto_185221 ) ) ( not ( = ?auto_185220 ?auto_185222 ) ) ( not ( = ?auto_185220 ?auto_185223 ) ) ( not ( = ?auto_185220 ?auto_185224 ) ) ( not ( = ?auto_185220 ?auto_185225 ) ) ( not ( = ?auto_185220 ?auto_185226 ) ) ( not ( = ?auto_185220 ?auto_185227 ) ) ( not ( = ?auto_185220 ?auto_185228 ) ) ( not ( = ?auto_185220 ?auto_185229 ) ) ( not ( = ?auto_185220 ?auto_185230 ) ) ( not ( = ?auto_185221 ?auto_185222 ) ) ( not ( = ?auto_185221 ?auto_185223 ) ) ( not ( = ?auto_185221 ?auto_185224 ) ) ( not ( = ?auto_185221 ?auto_185225 ) ) ( not ( = ?auto_185221 ?auto_185226 ) ) ( not ( = ?auto_185221 ?auto_185227 ) ) ( not ( = ?auto_185221 ?auto_185228 ) ) ( not ( = ?auto_185221 ?auto_185229 ) ) ( not ( = ?auto_185221 ?auto_185230 ) ) ( not ( = ?auto_185222 ?auto_185223 ) ) ( not ( = ?auto_185222 ?auto_185224 ) ) ( not ( = ?auto_185222 ?auto_185225 ) ) ( not ( = ?auto_185222 ?auto_185226 ) ) ( not ( = ?auto_185222 ?auto_185227 ) ) ( not ( = ?auto_185222 ?auto_185228 ) ) ( not ( = ?auto_185222 ?auto_185229 ) ) ( not ( = ?auto_185222 ?auto_185230 ) ) ( not ( = ?auto_185223 ?auto_185224 ) ) ( not ( = ?auto_185223 ?auto_185225 ) ) ( not ( = ?auto_185223 ?auto_185226 ) ) ( not ( = ?auto_185223 ?auto_185227 ) ) ( not ( = ?auto_185223 ?auto_185228 ) ) ( not ( = ?auto_185223 ?auto_185229 ) ) ( not ( = ?auto_185223 ?auto_185230 ) ) ( not ( = ?auto_185224 ?auto_185225 ) ) ( not ( = ?auto_185224 ?auto_185226 ) ) ( not ( = ?auto_185224 ?auto_185227 ) ) ( not ( = ?auto_185224 ?auto_185228 ) ) ( not ( = ?auto_185224 ?auto_185229 ) ) ( not ( = ?auto_185224 ?auto_185230 ) ) ( not ( = ?auto_185225 ?auto_185226 ) ) ( not ( = ?auto_185225 ?auto_185227 ) ) ( not ( = ?auto_185225 ?auto_185228 ) ) ( not ( = ?auto_185225 ?auto_185229 ) ) ( not ( = ?auto_185225 ?auto_185230 ) ) ( not ( = ?auto_185226 ?auto_185227 ) ) ( not ( = ?auto_185226 ?auto_185228 ) ) ( not ( = ?auto_185226 ?auto_185229 ) ) ( not ( = ?auto_185226 ?auto_185230 ) ) ( not ( = ?auto_185227 ?auto_185228 ) ) ( not ( = ?auto_185227 ?auto_185229 ) ) ( not ( = ?auto_185227 ?auto_185230 ) ) ( not ( = ?auto_185228 ?auto_185229 ) ) ( not ( = ?auto_185228 ?auto_185230 ) ) ( not ( = ?auto_185229 ?auto_185230 ) ) ( ON ?auto_185228 ?auto_185229 ) ( ON ?auto_185227 ?auto_185228 ) ( ON ?auto_185226 ?auto_185227 ) ( ON ?auto_185225 ?auto_185226 ) ( CLEAR ?auto_185223 ) ( ON ?auto_185224 ?auto_185225 ) ( CLEAR ?auto_185224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185219 ?auto_185220 ?auto_185221 ?auto_185222 ?auto_185223 ?auto_185224 )
      ( MAKE-11PILE ?auto_185219 ?auto_185220 ?auto_185221 ?auto_185222 ?auto_185223 ?auto_185224 ?auto_185225 ?auto_185226 ?auto_185227 ?auto_185228 ?auto_185229 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_185265 - BLOCK
      ?auto_185266 - BLOCK
      ?auto_185267 - BLOCK
      ?auto_185268 - BLOCK
      ?auto_185269 - BLOCK
      ?auto_185270 - BLOCK
      ?auto_185271 - BLOCK
      ?auto_185272 - BLOCK
      ?auto_185273 - BLOCK
      ?auto_185274 - BLOCK
      ?auto_185275 - BLOCK
    )
    :vars
    (
      ?auto_185276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185275 ?auto_185276 ) ( ON-TABLE ?auto_185265 ) ( ON ?auto_185266 ?auto_185265 ) ( ON ?auto_185267 ?auto_185266 ) ( ON ?auto_185268 ?auto_185267 ) ( not ( = ?auto_185265 ?auto_185266 ) ) ( not ( = ?auto_185265 ?auto_185267 ) ) ( not ( = ?auto_185265 ?auto_185268 ) ) ( not ( = ?auto_185265 ?auto_185269 ) ) ( not ( = ?auto_185265 ?auto_185270 ) ) ( not ( = ?auto_185265 ?auto_185271 ) ) ( not ( = ?auto_185265 ?auto_185272 ) ) ( not ( = ?auto_185265 ?auto_185273 ) ) ( not ( = ?auto_185265 ?auto_185274 ) ) ( not ( = ?auto_185265 ?auto_185275 ) ) ( not ( = ?auto_185265 ?auto_185276 ) ) ( not ( = ?auto_185266 ?auto_185267 ) ) ( not ( = ?auto_185266 ?auto_185268 ) ) ( not ( = ?auto_185266 ?auto_185269 ) ) ( not ( = ?auto_185266 ?auto_185270 ) ) ( not ( = ?auto_185266 ?auto_185271 ) ) ( not ( = ?auto_185266 ?auto_185272 ) ) ( not ( = ?auto_185266 ?auto_185273 ) ) ( not ( = ?auto_185266 ?auto_185274 ) ) ( not ( = ?auto_185266 ?auto_185275 ) ) ( not ( = ?auto_185266 ?auto_185276 ) ) ( not ( = ?auto_185267 ?auto_185268 ) ) ( not ( = ?auto_185267 ?auto_185269 ) ) ( not ( = ?auto_185267 ?auto_185270 ) ) ( not ( = ?auto_185267 ?auto_185271 ) ) ( not ( = ?auto_185267 ?auto_185272 ) ) ( not ( = ?auto_185267 ?auto_185273 ) ) ( not ( = ?auto_185267 ?auto_185274 ) ) ( not ( = ?auto_185267 ?auto_185275 ) ) ( not ( = ?auto_185267 ?auto_185276 ) ) ( not ( = ?auto_185268 ?auto_185269 ) ) ( not ( = ?auto_185268 ?auto_185270 ) ) ( not ( = ?auto_185268 ?auto_185271 ) ) ( not ( = ?auto_185268 ?auto_185272 ) ) ( not ( = ?auto_185268 ?auto_185273 ) ) ( not ( = ?auto_185268 ?auto_185274 ) ) ( not ( = ?auto_185268 ?auto_185275 ) ) ( not ( = ?auto_185268 ?auto_185276 ) ) ( not ( = ?auto_185269 ?auto_185270 ) ) ( not ( = ?auto_185269 ?auto_185271 ) ) ( not ( = ?auto_185269 ?auto_185272 ) ) ( not ( = ?auto_185269 ?auto_185273 ) ) ( not ( = ?auto_185269 ?auto_185274 ) ) ( not ( = ?auto_185269 ?auto_185275 ) ) ( not ( = ?auto_185269 ?auto_185276 ) ) ( not ( = ?auto_185270 ?auto_185271 ) ) ( not ( = ?auto_185270 ?auto_185272 ) ) ( not ( = ?auto_185270 ?auto_185273 ) ) ( not ( = ?auto_185270 ?auto_185274 ) ) ( not ( = ?auto_185270 ?auto_185275 ) ) ( not ( = ?auto_185270 ?auto_185276 ) ) ( not ( = ?auto_185271 ?auto_185272 ) ) ( not ( = ?auto_185271 ?auto_185273 ) ) ( not ( = ?auto_185271 ?auto_185274 ) ) ( not ( = ?auto_185271 ?auto_185275 ) ) ( not ( = ?auto_185271 ?auto_185276 ) ) ( not ( = ?auto_185272 ?auto_185273 ) ) ( not ( = ?auto_185272 ?auto_185274 ) ) ( not ( = ?auto_185272 ?auto_185275 ) ) ( not ( = ?auto_185272 ?auto_185276 ) ) ( not ( = ?auto_185273 ?auto_185274 ) ) ( not ( = ?auto_185273 ?auto_185275 ) ) ( not ( = ?auto_185273 ?auto_185276 ) ) ( not ( = ?auto_185274 ?auto_185275 ) ) ( not ( = ?auto_185274 ?auto_185276 ) ) ( not ( = ?auto_185275 ?auto_185276 ) ) ( ON ?auto_185274 ?auto_185275 ) ( ON ?auto_185273 ?auto_185274 ) ( ON ?auto_185272 ?auto_185273 ) ( ON ?auto_185271 ?auto_185272 ) ( ON ?auto_185270 ?auto_185271 ) ( CLEAR ?auto_185268 ) ( ON ?auto_185269 ?auto_185270 ) ( CLEAR ?auto_185269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185265 ?auto_185266 ?auto_185267 ?auto_185268 ?auto_185269 )
      ( MAKE-11PILE ?auto_185265 ?auto_185266 ?auto_185267 ?auto_185268 ?auto_185269 ?auto_185270 ?auto_185271 ?auto_185272 ?auto_185273 ?auto_185274 ?auto_185275 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_185311 - BLOCK
      ?auto_185312 - BLOCK
      ?auto_185313 - BLOCK
      ?auto_185314 - BLOCK
      ?auto_185315 - BLOCK
      ?auto_185316 - BLOCK
      ?auto_185317 - BLOCK
      ?auto_185318 - BLOCK
      ?auto_185319 - BLOCK
      ?auto_185320 - BLOCK
      ?auto_185321 - BLOCK
    )
    :vars
    (
      ?auto_185322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185321 ?auto_185322 ) ( ON-TABLE ?auto_185311 ) ( ON ?auto_185312 ?auto_185311 ) ( ON ?auto_185313 ?auto_185312 ) ( not ( = ?auto_185311 ?auto_185312 ) ) ( not ( = ?auto_185311 ?auto_185313 ) ) ( not ( = ?auto_185311 ?auto_185314 ) ) ( not ( = ?auto_185311 ?auto_185315 ) ) ( not ( = ?auto_185311 ?auto_185316 ) ) ( not ( = ?auto_185311 ?auto_185317 ) ) ( not ( = ?auto_185311 ?auto_185318 ) ) ( not ( = ?auto_185311 ?auto_185319 ) ) ( not ( = ?auto_185311 ?auto_185320 ) ) ( not ( = ?auto_185311 ?auto_185321 ) ) ( not ( = ?auto_185311 ?auto_185322 ) ) ( not ( = ?auto_185312 ?auto_185313 ) ) ( not ( = ?auto_185312 ?auto_185314 ) ) ( not ( = ?auto_185312 ?auto_185315 ) ) ( not ( = ?auto_185312 ?auto_185316 ) ) ( not ( = ?auto_185312 ?auto_185317 ) ) ( not ( = ?auto_185312 ?auto_185318 ) ) ( not ( = ?auto_185312 ?auto_185319 ) ) ( not ( = ?auto_185312 ?auto_185320 ) ) ( not ( = ?auto_185312 ?auto_185321 ) ) ( not ( = ?auto_185312 ?auto_185322 ) ) ( not ( = ?auto_185313 ?auto_185314 ) ) ( not ( = ?auto_185313 ?auto_185315 ) ) ( not ( = ?auto_185313 ?auto_185316 ) ) ( not ( = ?auto_185313 ?auto_185317 ) ) ( not ( = ?auto_185313 ?auto_185318 ) ) ( not ( = ?auto_185313 ?auto_185319 ) ) ( not ( = ?auto_185313 ?auto_185320 ) ) ( not ( = ?auto_185313 ?auto_185321 ) ) ( not ( = ?auto_185313 ?auto_185322 ) ) ( not ( = ?auto_185314 ?auto_185315 ) ) ( not ( = ?auto_185314 ?auto_185316 ) ) ( not ( = ?auto_185314 ?auto_185317 ) ) ( not ( = ?auto_185314 ?auto_185318 ) ) ( not ( = ?auto_185314 ?auto_185319 ) ) ( not ( = ?auto_185314 ?auto_185320 ) ) ( not ( = ?auto_185314 ?auto_185321 ) ) ( not ( = ?auto_185314 ?auto_185322 ) ) ( not ( = ?auto_185315 ?auto_185316 ) ) ( not ( = ?auto_185315 ?auto_185317 ) ) ( not ( = ?auto_185315 ?auto_185318 ) ) ( not ( = ?auto_185315 ?auto_185319 ) ) ( not ( = ?auto_185315 ?auto_185320 ) ) ( not ( = ?auto_185315 ?auto_185321 ) ) ( not ( = ?auto_185315 ?auto_185322 ) ) ( not ( = ?auto_185316 ?auto_185317 ) ) ( not ( = ?auto_185316 ?auto_185318 ) ) ( not ( = ?auto_185316 ?auto_185319 ) ) ( not ( = ?auto_185316 ?auto_185320 ) ) ( not ( = ?auto_185316 ?auto_185321 ) ) ( not ( = ?auto_185316 ?auto_185322 ) ) ( not ( = ?auto_185317 ?auto_185318 ) ) ( not ( = ?auto_185317 ?auto_185319 ) ) ( not ( = ?auto_185317 ?auto_185320 ) ) ( not ( = ?auto_185317 ?auto_185321 ) ) ( not ( = ?auto_185317 ?auto_185322 ) ) ( not ( = ?auto_185318 ?auto_185319 ) ) ( not ( = ?auto_185318 ?auto_185320 ) ) ( not ( = ?auto_185318 ?auto_185321 ) ) ( not ( = ?auto_185318 ?auto_185322 ) ) ( not ( = ?auto_185319 ?auto_185320 ) ) ( not ( = ?auto_185319 ?auto_185321 ) ) ( not ( = ?auto_185319 ?auto_185322 ) ) ( not ( = ?auto_185320 ?auto_185321 ) ) ( not ( = ?auto_185320 ?auto_185322 ) ) ( not ( = ?auto_185321 ?auto_185322 ) ) ( ON ?auto_185320 ?auto_185321 ) ( ON ?auto_185319 ?auto_185320 ) ( ON ?auto_185318 ?auto_185319 ) ( ON ?auto_185317 ?auto_185318 ) ( ON ?auto_185316 ?auto_185317 ) ( ON ?auto_185315 ?auto_185316 ) ( CLEAR ?auto_185313 ) ( ON ?auto_185314 ?auto_185315 ) ( CLEAR ?auto_185314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_185311 ?auto_185312 ?auto_185313 ?auto_185314 )
      ( MAKE-11PILE ?auto_185311 ?auto_185312 ?auto_185313 ?auto_185314 ?auto_185315 ?auto_185316 ?auto_185317 ?auto_185318 ?auto_185319 ?auto_185320 ?auto_185321 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_185357 - BLOCK
      ?auto_185358 - BLOCK
      ?auto_185359 - BLOCK
      ?auto_185360 - BLOCK
      ?auto_185361 - BLOCK
      ?auto_185362 - BLOCK
      ?auto_185363 - BLOCK
      ?auto_185364 - BLOCK
      ?auto_185365 - BLOCK
      ?auto_185366 - BLOCK
      ?auto_185367 - BLOCK
    )
    :vars
    (
      ?auto_185368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185367 ?auto_185368 ) ( ON-TABLE ?auto_185357 ) ( ON ?auto_185358 ?auto_185357 ) ( not ( = ?auto_185357 ?auto_185358 ) ) ( not ( = ?auto_185357 ?auto_185359 ) ) ( not ( = ?auto_185357 ?auto_185360 ) ) ( not ( = ?auto_185357 ?auto_185361 ) ) ( not ( = ?auto_185357 ?auto_185362 ) ) ( not ( = ?auto_185357 ?auto_185363 ) ) ( not ( = ?auto_185357 ?auto_185364 ) ) ( not ( = ?auto_185357 ?auto_185365 ) ) ( not ( = ?auto_185357 ?auto_185366 ) ) ( not ( = ?auto_185357 ?auto_185367 ) ) ( not ( = ?auto_185357 ?auto_185368 ) ) ( not ( = ?auto_185358 ?auto_185359 ) ) ( not ( = ?auto_185358 ?auto_185360 ) ) ( not ( = ?auto_185358 ?auto_185361 ) ) ( not ( = ?auto_185358 ?auto_185362 ) ) ( not ( = ?auto_185358 ?auto_185363 ) ) ( not ( = ?auto_185358 ?auto_185364 ) ) ( not ( = ?auto_185358 ?auto_185365 ) ) ( not ( = ?auto_185358 ?auto_185366 ) ) ( not ( = ?auto_185358 ?auto_185367 ) ) ( not ( = ?auto_185358 ?auto_185368 ) ) ( not ( = ?auto_185359 ?auto_185360 ) ) ( not ( = ?auto_185359 ?auto_185361 ) ) ( not ( = ?auto_185359 ?auto_185362 ) ) ( not ( = ?auto_185359 ?auto_185363 ) ) ( not ( = ?auto_185359 ?auto_185364 ) ) ( not ( = ?auto_185359 ?auto_185365 ) ) ( not ( = ?auto_185359 ?auto_185366 ) ) ( not ( = ?auto_185359 ?auto_185367 ) ) ( not ( = ?auto_185359 ?auto_185368 ) ) ( not ( = ?auto_185360 ?auto_185361 ) ) ( not ( = ?auto_185360 ?auto_185362 ) ) ( not ( = ?auto_185360 ?auto_185363 ) ) ( not ( = ?auto_185360 ?auto_185364 ) ) ( not ( = ?auto_185360 ?auto_185365 ) ) ( not ( = ?auto_185360 ?auto_185366 ) ) ( not ( = ?auto_185360 ?auto_185367 ) ) ( not ( = ?auto_185360 ?auto_185368 ) ) ( not ( = ?auto_185361 ?auto_185362 ) ) ( not ( = ?auto_185361 ?auto_185363 ) ) ( not ( = ?auto_185361 ?auto_185364 ) ) ( not ( = ?auto_185361 ?auto_185365 ) ) ( not ( = ?auto_185361 ?auto_185366 ) ) ( not ( = ?auto_185361 ?auto_185367 ) ) ( not ( = ?auto_185361 ?auto_185368 ) ) ( not ( = ?auto_185362 ?auto_185363 ) ) ( not ( = ?auto_185362 ?auto_185364 ) ) ( not ( = ?auto_185362 ?auto_185365 ) ) ( not ( = ?auto_185362 ?auto_185366 ) ) ( not ( = ?auto_185362 ?auto_185367 ) ) ( not ( = ?auto_185362 ?auto_185368 ) ) ( not ( = ?auto_185363 ?auto_185364 ) ) ( not ( = ?auto_185363 ?auto_185365 ) ) ( not ( = ?auto_185363 ?auto_185366 ) ) ( not ( = ?auto_185363 ?auto_185367 ) ) ( not ( = ?auto_185363 ?auto_185368 ) ) ( not ( = ?auto_185364 ?auto_185365 ) ) ( not ( = ?auto_185364 ?auto_185366 ) ) ( not ( = ?auto_185364 ?auto_185367 ) ) ( not ( = ?auto_185364 ?auto_185368 ) ) ( not ( = ?auto_185365 ?auto_185366 ) ) ( not ( = ?auto_185365 ?auto_185367 ) ) ( not ( = ?auto_185365 ?auto_185368 ) ) ( not ( = ?auto_185366 ?auto_185367 ) ) ( not ( = ?auto_185366 ?auto_185368 ) ) ( not ( = ?auto_185367 ?auto_185368 ) ) ( ON ?auto_185366 ?auto_185367 ) ( ON ?auto_185365 ?auto_185366 ) ( ON ?auto_185364 ?auto_185365 ) ( ON ?auto_185363 ?auto_185364 ) ( ON ?auto_185362 ?auto_185363 ) ( ON ?auto_185361 ?auto_185362 ) ( ON ?auto_185360 ?auto_185361 ) ( CLEAR ?auto_185358 ) ( ON ?auto_185359 ?auto_185360 ) ( CLEAR ?auto_185359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_185357 ?auto_185358 ?auto_185359 )
      ( MAKE-11PILE ?auto_185357 ?auto_185358 ?auto_185359 ?auto_185360 ?auto_185361 ?auto_185362 ?auto_185363 ?auto_185364 ?auto_185365 ?auto_185366 ?auto_185367 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_185403 - BLOCK
      ?auto_185404 - BLOCK
      ?auto_185405 - BLOCK
      ?auto_185406 - BLOCK
      ?auto_185407 - BLOCK
      ?auto_185408 - BLOCK
      ?auto_185409 - BLOCK
      ?auto_185410 - BLOCK
      ?auto_185411 - BLOCK
      ?auto_185412 - BLOCK
      ?auto_185413 - BLOCK
    )
    :vars
    (
      ?auto_185414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185413 ?auto_185414 ) ( ON-TABLE ?auto_185403 ) ( not ( = ?auto_185403 ?auto_185404 ) ) ( not ( = ?auto_185403 ?auto_185405 ) ) ( not ( = ?auto_185403 ?auto_185406 ) ) ( not ( = ?auto_185403 ?auto_185407 ) ) ( not ( = ?auto_185403 ?auto_185408 ) ) ( not ( = ?auto_185403 ?auto_185409 ) ) ( not ( = ?auto_185403 ?auto_185410 ) ) ( not ( = ?auto_185403 ?auto_185411 ) ) ( not ( = ?auto_185403 ?auto_185412 ) ) ( not ( = ?auto_185403 ?auto_185413 ) ) ( not ( = ?auto_185403 ?auto_185414 ) ) ( not ( = ?auto_185404 ?auto_185405 ) ) ( not ( = ?auto_185404 ?auto_185406 ) ) ( not ( = ?auto_185404 ?auto_185407 ) ) ( not ( = ?auto_185404 ?auto_185408 ) ) ( not ( = ?auto_185404 ?auto_185409 ) ) ( not ( = ?auto_185404 ?auto_185410 ) ) ( not ( = ?auto_185404 ?auto_185411 ) ) ( not ( = ?auto_185404 ?auto_185412 ) ) ( not ( = ?auto_185404 ?auto_185413 ) ) ( not ( = ?auto_185404 ?auto_185414 ) ) ( not ( = ?auto_185405 ?auto_185406 ) ) ( not ( = ?auto_185405 ?auto_185407 ) ) ( not ( = ?auto_185405 ?auto_185408 ) ) ( not ( = ?auto_185405 ?auto_185409 ) ) ( not ( = ?auto_185405 ?auto_185410 ) ) ( not ( = ?auto_185405 ?auto_185411 ) ) ( not ( = ?auto_185405 ?auto_185412 ) ) ( not ( = ?auto_185405 ?auto_185413 ) ) ( not ( = ?auto_185405 ?auto_185414 ) ) ( not ( = ?auto_185406 ?auto_185407 ) ) ( not ( = ?auto_185406 ?auto_185408 ) ) ( not ( = ?auto_185406 ?auto_185409 ) ) ( not ( = ?auto_185406 ?auto_185410 ) ) ( not ( = ?auto_185406 ?auto_185411 ) ) ( not ( = ?auto_185406 ?auto_185412 ) ) ( not ( = ?auto_185406 ?auto_185413 ) ) ( not ( = ?auto_185406 ?auto_185414 ) ) ( not ( = ?auto_185407 ?auto_185408 ) ) ( not ( = ?auto_185407 ?auto_185409 ) ) ( not ( = ?auto_185407 ?auto_185410 ) ) ( not ( = ?auto_185407 ?auto_185411 ) ) ( not ( = ?auto_185407 ?auto_185412 ) ) ( not ( = ?auto_185407 ?auto_185413 ) ) ( not ( = ?auto_185407 ?auto_185414 ) ) ( not ( = ?auto_185408 ?auto_185409 ) ) ( not ( = ?auto_185408 ?auto_185410 ) ) ( not ( = ?auto_185408 ?auto_185411 ) ) ( not ( = ?auto_185408 ?auto_185412 ) ) ( not ( = ?auto_185408 ?auto_185413 ) ) ( not ( = ?auto_185408 ?auto_185414 ) ) ( not ( = ?auto_185409 ?auto_185410 ) ) ( not ( = ?auto_185409 ?auto_185411 ) ) ( not ( = ?auto_185409 ?auto_185412 ) ) ( not ( = ?auto_185409 ?auto_185413 ) ) ( not ( = ?auto_185409 ?auto_185414 ) ) ( not ( = ?auto_185410 ?auto_185411 ) ) ( not ( = ?auto_185410 ?auto_185412 ) ) ( not ( = ?auto_185410 ?auto_185413 ) ) ( not ( = ?auto_185410 ?auto_185414 ) ) ( not ( = ?auto_185411 ?auto_185412 ) ) ( not ( = ?auto_185411 ?auto_185413 ) ) ( not ( = ?auto_185411 ?auto_185414 ) ) ( not ( = ?auto_185412 ?auto_185413 ) ) ( not ( = ?auto_185412 ?auto_185414 ) ) ( not ( = ?auto_185413 ?auto_185414 ) ) ( ON ?auto_185412 ?auto_185413 ) ( ON ?auto_185411 ?auto_185412 ) ( ON ?auto_185410 ?auto_185411 ) ( ON ?auto_185409 ?auto_185410 ) ( ON ?auto_185408 ?auto_185409 ) ( ON ?auto_185407 ?auto_185408 ) ( ON ?auto_185406 ?auto_185407 ) ( ON ?auto_185405 ?auto_185406 ) ( CLEAR ?auto_185403 ) ( ON ?auto_185404 ?auto_185405 ) ( CLEAR ?auto_185404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_185403 ?auto_185404 )
      ( MAKE-11PILE ?auto_185403 ?auto_185404 ?auto_185405 ?auto_185406 ?auto_185407 ?auto_185408 ?auto_185409 ?auto_185410 ?auto_185411 ?auto_185412 ?auto_185413 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_185449 - BLOCK
      ?auto_185450 - BLOCK
      ?auto_185451 - BLOCK
      ?auto_185452 - BLOCK
      ?auto_185453 - BLOCK
      ?auto_185454 - BLOCK
      ?auto_185455 - BLOCK
      ?auto_185456 - BLOCK
      ?auto_185457 - BLOCK
      ?auto_185458 - BLOCK
      ?auto_185459 - BLOCK
    )
    :vars
    (
      ?auto_185460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185459 ?auto_185460 ) ( not ( = ?auto_185449 ?auto_185450 ) ) ( not ( = ?auto_185449 ?auto_185451 ) ) ( not ( = ?auto_185449 ?auto_185452 ) ) ( not ( = ?auto_185449 ?auto_185453 ) ) ( not ( = ?auto_185449 ?auto_185454 ) ) ( not ( = ?auto_185449 ?auto_185455 ) ) ( not ( = ?auto_185449 ?auto_185456 ) ) ( not ( = ?auto_185449 ?auto_185457 ) ) ( not ( = ?auto_185449 ?auto_185458 ) ) ( not ( = ?auto_185449 ?auto_185459 ) ) ( not ( = ?auto_185449 ?auto_185460 ) ) ( not ( = ?auto_185450 ?auto_185451 ) ) ( not ( = ?auto_185450 ?auto_185452 ) ) ( not ( = ?auto_185450 ?auto_185453 ) ) ( not ( = ?auto_185450 ?auto_185454 ) ) ( not ( = ?auto_185450 ?auto_185455 ) ) ( not ( = ?auto_185450 ?auto_185456 ) ) ( not ( = ?auto_185450 ?auto_185457 ) ) ( not ( = ?auto_185450 ?auto_185458 ) ) ( not ( = ?auto_185450 ?auto_185459 ) ) ( not ( = ?auto_185450 ?auto_185460 ) ) ( not ( = ?auto_185451 ?auto_185452 ) ) ( not ( = ?auto_185451 ?auto_185453 ) ) ( not ( = ?auto_185451 ?auto_185454 ) ) ( not ( = ?auto_185451 ?auto_185455 ) ) ( not ( = ?auto_185451 ?auto_185456 ) ) ( not ( = ?auto_185451 ?auto_185457 ) ) ( not ( = ?auto_185451 ?auto_185458 ) ) ( not ( = ?auto_185451 ?auto_185459 ) ) ( not ( = ?auto_185451 ?auto_185460 ) ) ( not ( = ?auto_185452 ?auto_185453 ) ) ( not ( = ?auto_185452 ?auto_185454 ) ) ( not ( = ?auto_185452 ?auto_185455 ) ) ( not ( = ?auto_185452 ?auto_185456 ) ) ( not ( = ?auto_185452 ?auto_185457 ) ) ( not ( = ?auto_185452 ?auto_185458 ) ) ( not ( = ?auto_185452 ?auto_185459 ) ) ( not ( = ?auto_185452 ?auto_185460 ) ) ( not ( = ?auto_185453 ?auto_185454 ) ) ( not ( = ?auto_185453 ?auto_185455 ) ) ( not ( = ?auto_185453 ?auto_185456 ) ) ( not ( = ?auto_185453 ?auto_185457 ) ) ( not ( = ?auto_185453 ?auto_185458 ) ) ( not ( = ?auto_185453 ?auto_185459 ) ) ( not ( = ?auto_185453 ?auto_185460 ) ) ( not ( = ?auto_185454 ?auto_185455 ) ) ( not ( = ?auto_185454 ?auto_185456 ) ) ( not ( = ?auto_185454 ?auto_185457 ) ) ( not ( = ?auto_185454 ?auto_185458 ) ) ( not ( = ?auto_185454 ?auto_185459 ) ) ( not ( = ?auto_185454 ?auto_185460 ) ) ( not ( = ?auto_185455 ?auto_185456 ) ) ( not ( = ?auto_185455 ?auto_185457 ) ) ( not ( = ?auto_185455 ?auto_185458 ) ) ( not ( = ?auto_185455 ?auto_185459 ) ) ( not ( = ?auto_185455 ?auto_185460 ) ) ( not ( = ?auto_185456 ?auto_185457 ) ) ( not ( = ?auto_185456 ?auto_185458 ) ) ( not ( = ?auto_185456 ?auto_185459 ) ) ( not ( = ?auto_185456 ?auto_185460 ) ) ( not ( = ?auto_185457 ?auto_185458 ) ) ( not ( = ?auto_185457 ?auto_185459 ) ) ( not ( = ?auto_185457 ?auto_185460 ) ) ( not ( = ?auto_185458 ?auto_185459 ) ) ( not ( = ?auto_185458 ?auto_185460 ) ) ( not ( = ?auto_185459 ?auto_185460 ) ) ( ON ?auto_185458 ?auto_185459 ) ( ON ?auto_185457 ?auto_185458 ) ( ON ?auto_185456 ?auto_185457 ) ( ON ?auto_185455 ?auto_185456 ) ( ON ?auto_185454 ?auto_185455 ) ( ON ?auto_185453 ?auto_185454 ) ( ON ?auto_185452 ?auto_185453 ) ( ON ?auto_185451 ?auto_185452 ) ( ON ?auto_185450 ?auto_185451 ) ( ON ?auto_185449 ?auto_185450 ) ( CLEAR ?auto_185449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_185449 )
      ( MAKE-11PILE ?auto_185449 ?auto_185450 ?auto_185451 ?auto_185452 ?auto_185453 ?auto_185454 ?auto_185455 ?auto_185456 ?auto_185457 ?auto_185458 ?auto_185459 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_185496 - BLOCK
      ?auto_185497 - BLOCK
      ?auto_185498 - BLOCK
      ?auto_185499 - BLOCK
      ?auto_185500 - BLOCK
      ?auto_185501 - BLOCK
      ?auto_185502 - BLOCK
      ?auto_185503 - BLOCK
      ?auto_185504 - BLOCK
      ?auto_185505 - BLOCK
      ?auto_185506 - BLOCK
      ?auto_185507 - BLOCK
    )
    :vars
    (
      ?auto_185508 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_185506 ) ( ON ?auto_185507 ?auto_185508 ) ( CLEAR ?auto_185507 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_185496 ) ( ON ?auto_185497 ?auto_185496 ) ( ON ?auto_185498 ?auto_185497 ) ( ON ?auto_185499 ?auto_185498 ) ( ON ?auto_185500 ?auto_185499 ) ( ON ?auto_185501 ?auto_185500 ) ( ON ?auto_185502 ?auto_185501 ) ( ON ?auto_185503 ?auto_185502 ) ( ON ?auto_185504 ?auto_185503 ) ( ON ?auto_185505 ?auto_185504 ) ( ON ?auto_185506 ?auto_185505 ) ( not ( = ?auto_185496 ?auto_185497 ) ) ( not ( = ?auto_185496 ?auto_185498 ) ) ( not ( = ?auto_185496 ?auto_185499 ) ) ( not ( = ?auto_185496 ?auto_185500 ) ) ( not ( = ?auto_185496 ?auto_185501 ) ) ( not ( = ?auto_185496 ?auto_185502 ) ) ( not ( = ?auto_185496 ?auto_185503 ) ) ( not ( = ?auto_185496 ?auto_185504 ) ) ( not ( = ?auto_185496 ?auto_185505 ) ) ( not ( = ?auto_185496 ?auto_185506 ) ) ( not ( = ?auto_185496 ?auto_185507 ) ) ( not ( = ?auto_185496 ?auto_185508 ) ) ( not ( = ?auto_185497 ?auto_185498 ) ) ( not ( = ?auto_185497 ?auto_185499 ) ) ( not ( = ?auto_185497 ?auto_185500 ) ) ( not ( = ?auto_185497 ?auto_185501 ) ) ( not ( = ?auto_185497 ?auto_185502 ) ) ( not ( = ?auto_185497 ?auto_185503 ) ) ( not ( = ?auto_185497 ?auto_185504 ) ) ( not ( = ?auto_185497 ?auto_185505 ) ) ( not ( = ?auto_185497 ?auto_185506 ) ) ( not ( = ?auto_185497 ?auto_185507 ) ) ( not ( = ?auto_185497 ?auto_185508 ) ) ( not ( = ?auto_185498 ?auto_185499 ) ) ( not ( = ?auto_185498 ?auto_185500 ) ) ( not ( = ?auto_185498 ?auto_185501 ) ) ( not ( = ?auto_185498 ?auto_185502 ) ) ( not ( = ?auto_185498 ?auto_185503 ) ) ( not ( = ?auto_185498 ?auto_185504 ) ) ( not ( = ?auto_185498 ?auto_185505 ) ) ( not ( = ?auto_185498 ?auto_185506 ) ) ( not ( = ?auto_185498 ?auto_185507 ) ) ( not ( = ?auto_185498 ?auto_185508 ) ) ( not ( = ?auto_185499 ?auto_185500 ) ) ( not ( = ?auto_185499 ?auto_185501 ) ) ( not ( = ?auto_185499 ?auto_185502 ) ) ( not ( = ?auto_185499 ?auto_185503 ) ) ( not ( = ?auto_185499 ?auto_185504 ) ) ( not ( = ?auto_185499 ?auto_185505 ) ) ( not ( = ?auto_185499 ?auto_185506 ) ) ( not ( = ?auto_185499 ?auto_185507 ) ) ( not ( = ?auto_185499 ?auto_185508 ) ) ( not ( = ?auto_185500 ?auto_185501 ) ) ( not ( = ?auto_185500 ?auto_185502 ) ) ( not ( = ?auto_185500 ?auto_185503 ) ) ( not ( = ?auto_185500 ?auto_185504 ) ) ( not ( = ?auto_185500 ?auto_185505 ) ) ( not ( = ?auto_185500 ?auto_185506 ) ) ( not ( = ?auto_185500 ?auto_185507 ) ) ( not ( = ?auto_185500 ?auto_185508 ) ) ( not ( = ?auto_185501 ?auto_185502 ) ) ( not ( = ?auto_185501 ?auto_185503 ) ) ( not ( = ?auto_185501 ?auto_185504 ) ) ( not ( = ?auto_185501 ?auto_185505 ) ) ( not ( = ?auto_185501 ?auto_185506 ) ) ( not ( = ?auto_185501 ?auto_185507 ) ) ( not ( = ?auto_185501 ?auto_185508 ) ) ( not ( = ?auto_185502 ?auto_185503 ) ) ( not ( = ?auto_185502 ?auto_185504 ) ) ( not ( = ?auto_185502 ?auto_185505 ) ) ( not ( = ?auto_185502 ?auto_185506 ) ) ( not ( = ?auto_185502 ?auto_185507 ) ) ( not ( = ?auto_185502 ?auto_185508 ) ) ( not ( = ?auto_185503 ?auto_185504 ) ) ( not ( = ?auto_185503 ?auto_185505 ) ) ( not ( = ?auto_185503 ?auto_185506 ) ) ( not ( = ?auto_185503 ?auto_185507 ) ) ( not ( = ?auto_185503 ?auto_185508 ) ) ( not ( = ?auto_185504 ?auto_185505 ) ) ( not ( = ?auto_185504 ?auto_185506 ) ) ( not ( = ?auto_185504 ?auto_185507 ) ) ( not ( = ?auto_185504 ?auto_185508 ) ) ( not ( = ?auto_185505 ?auto_185506 ) ) ( not ( = ?auto_185505 ?auto_185507 ) ) ( not ( = ?auto_185505 ?auto_185508 ) ) ( not ( = ?auto_185506 ?auto_185507 ) ) ( not ( = ?auto_185506 ?auto_185508 ) ) ( not ( = ?auto_185507 ?auto_185508 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_185507 ?auto_185508 )
      ( !STACK ?auto_185507 ?auto_185506 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_185521 - BLOCK
      ?auto_185522 - BLOCK
      ?auto_185523 - BLOCK
      ?auto_185524 - BLOCK
      ?auto_185525 - BLOCK
      ?auto_185526 - BLOCK
      ?auto_185527 - BLOCK
      ?auto_185528 - BLOCK
      ?auto_185529 - BLOCK
      ?auto_185530 - BLOCK
      ?auto_185531 - BLOCK
      ?auto_185532 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_185531 ) ( ON-TABLE ?auto_185532 ) ( CLEAR ?auto_185532 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_185521 ) ( ON ?auto_185522 ?auto_185521 ) ( ON ?auto_185523 ?auto_185522 ) ( ON ?auto_185524 ?auto_185523 ) ( ON ?auto_185525 ?auto_185524 ) ( ON ?auto_185526 ?auto_185525 ) ( ON ?auto_185527 ?auto_185526 ) ( ON ?auto_185528 ?auto_185527 ) ( ON ?auto_185529 ?auto_185528 ) ( ON ?auto_185530 ?auto_185529 ) ( ON ?auto_185531 ?auto_185530 ) ( not ( = ?auto_185521 ?auto_185522 ) ) ( not ( = ?auto_185521 ?auto_185523 ) ) ( not ( = ?auto_185521 ?auto_185524 ) ) ( not ( = ?auto_185521 ?auto_185525 ) ) ( not ( = ?auto_185521 ?auto_185526 ) ) ( not ( = ?auto_185521 ?auto_185527 ) ) ( not ( = ?auto_185521 ?auto_185528 ) ) ( not ( = ?auto_185521 ?auto_185529 ) ) ( not ( = ?auto_185521 ?auto_185530 ) ) ( not ( = ?auto_185521 ?auto_185531 ) ) ( not ( = ?auto_185521 ?auto_185532 ) ) ( not ( = ?auto_185522 ?auto_185523 ) ) ( not ( = ?auto_185522 ?auto_185524 ) ) ( not ( = ?auto_185522 ?auto_185525 ) ) ( not ( = ?auto_185522 ?auto_185526 ) ) ( not ( = ?auto_185522 ?auto_185527 ) ) ( not ( = ?auto_185522 ?auto_185528 ) ) ( not ( = ?auto_185522 ?auto_185529 ) ) ( not ( = ?auto_185522 ?auto_185530 ) ) ( not ( = ?auto_185522 ?auto_185531 ) ) ( not ( = ?auto_185522 ?auto_185532 ) ) ( not ( = ?auto_185523 ?auto_185524 ) ) ( not ( = ?auto_185523 ?auto_185525 ) ) ( not ( = ?auto_185523 ?auto_185526 ) ) ( not ( = ?auto_185523 ?auto_185527 ) ) ( not ( = ?auto_185523 ?auto_185528 ) ) ( not ( = ?auto_185523 ?auto_185529 ) ) ( not ( = ?auto_185523 ?auto_185530 ) ) ( not ( = ?auto_185523 ?auto_185531 ) ) ( not ( = ?auto_185523 ?auto_185532 ) ) ( not ( = ?auto_185524 ?auto_185525 ) ) ( not ( = ?auto_185524 ?auto_185526 ) ) ( not ( = ?auto_185524 ?auto_185527 ) ) ( not ( = ?auto_185524 ?auto_185528 ) ) ( not ( = ?auto_185524 ?auto_185529 ) ) ( not ( = ?auto_185524 ?auto_185530 ) ) ( not ( = ?auto_185524 ?auto_185531 ) ) ( not ( = ?auto_185524 ?auto_185532 ) ) ( not ( = ?auto_185525 ?auto_185526 ) ) ( not ( = ?auto_185525 ?auto_185527 ) ) ( not ( = ?auto_185525 ?auto_185528 ) ) ( not ( = ?auto_185525 ?auto_185529 ) ) ( not ( = ?auto_185525 ?auto_185530 ) ) ( not ( = ?auto_185525 ?auto_185531 ) ) ( not ( = ?auto_185525 ?auto_185532 ) ) ( not ( = ?auto_185526 ?auto_185527 ) ) ( not ( = ?auto_185526 ?auto_185528 ) ) ( not ( = ?auto_185526 ?auto_185529 ) ) ( not ( = ?auto_185526 ?auto_185530 ) ) ( not ( = ?auto_185526 ?auto_185531 ) ) ( not ( = ?auto_185526 ?auto_185532 ) ) ( not ( = ?auto_185527 ?auto_185528 ) ) ( not ( = ?auto_185527 ?auto_185529 ) ) ( not ( = ?auto_185527 ?auto_185530 ) ) ( not ( = ?auto_185527 ?auto_185531 ) ) ( not ( = ?auto_185527 ?auto_185532 ) ) ( not ( = ?auto_185528 ?auto_185529 ) ) ( not ( = ?auto_185528 ?auto_185530 ) ) ( not ( = ?auto_185528 ?auto_185531 ) ) ( not ( = ?auto_185528 ?auto_185532 ) ) ( not ( = ?auto_185529 ?auto_185530 ) ) ( not ( = ?auto_185529 ?auto_185531 ) ) ( not ( = ?auto_185529 ?auto_185532 ) ) ( not ( = ?auto_185530 ?auto_185531 ) ) ( not ( = ?auto_185530 ?auto_185532 ) ) ( not ( = ?auto_185531 ?auto_185532 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_185532 )
      ( !STACK ?auto_185532 ?auto_185531 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_185545 - BLOCK
      ?auto_185546 - BLOCK
      ?auto_185547 - BLOCK
      ?auto_185548 - BLOCK
      ?auto_185549 - BLOCK
      ?auto_185550 - BLOCK
      ?auto_185551 - BLOCK
      ?auto_185552 - BLOCK
      ?auto_185553 - BLOCK
      ?auto_185554 - BLOCK
      ?auto_185555 - BLOCK
      ?auto_185556 - BLOCK
    )
    :vars
    (
      ?auto_185557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185556 ?auto_185557 ) ( ON-TABLE ?auto_185545 ) ( ON ?auto_185546 ?auto_185545 ) ( ON ?auto_185547 ?auto_185546 ) ( ON ?auto_185548 ?auto_185547 ) ( ON ?auto_185549 ?auto_185548 ) ( ON ?auto_185550 ?auto_185549 ) ( ON ?auto_185551 ?auto_185550 ) ( ON ?auto_185552 ?auto_185551 ) ( ON ?auto_185553 ?auto_185552 ) ( ON ?auto_185554 ?auto_185553 ) ( not ( = ?auto_185545 ?auto_185546 ) ) ( not ( = ?auto_185545 ?auto_185547 ) ) ( not ( = ?auto_185545 ?auto_185548 ) ) ( not ( = ?auto_185545 ?auto_185549 ) ) ( not ( = ?auto_185545 ?auto_185550 ) ) ( not ( = ?auto_185545 ?auto_185551 ) ) ( not ( = ?auto_185545 ?auto_185552 ) ) ( not ( = ?auto_185545 ?auto_185553 ) ) ( not ( = ?auto_185545 ?auto_185554 ) ) ( not ( = ?auto_185545 ?auto_185555 ) ) ( not ( = ?auto_185545 ?auto_185556 ) ) ( not ( = ?auto_185545 ?auto_185557 ) ) ( not ( = ?auto_185546 ?auto_185547 ) ) ( not ( = ?auto_185546 ?auto_185548 ) ) ( not ( = ?auto_185546 ?auto_185549 ) ) ( not ( = ?auto_185546 ?auto_185550 ) ) ( not ( = ?auto_185546 ?auto_185551 ) ) ( not ( = ?auto_185546 ?auto_185552 ) ) ( not ( = ?auto_185546 ?auto_185553 ) ) ( not ( = ?auto_185546 ?auto_185554 ) ) ( not ( = ?auto_185546 ?auto_185555 ) ) ( not ( = ?auto_185546 ?auto_185556 ) ) ( not ( = ?auto_185546 ?auto_185557 ) ) ( not ( = ?auto_185547 ?auto_185548 ) ) ( not ( = ?auto_185547 ?auto_185549 ) ) ( not ( = ?auto_185547 ?auto_185550 ) ) ( not ( = ?auto_185547 ?auto_185551 ) ) ( not ( = ?auto_185547 ?auto_185552 ) ) ( not ( = ?auto_185547 ?auto_185553 ) ) ( not ( = ?auto_185547 ?auto_185554 ) ) ( not ( = ?auto_185547 ?auto_185555 ) ) ( not ( = ?auto_185547 ?auto_185556 ) ) ( not ( = ?auto_185547 ?auto_185557 ) ) ( not ( = ?auto_185548 ?auto_185549 ) ) ( not ( = ?auto_185548 ?auto_185550 ) ) ( not ( = ?auto_185548 ?auto_185551 ) ) ( not ( = ?auto_185548 ?auto_185552 ) ) ( not ( = ?auto_185548 ?auto_185553 ) ) ( not ( = ?auto_185548 ?auto_185554 ) ) ( not ( = ?auto_185548 ?auto_185555 ) ) ( not ( = ?auto_185548 ?auto_185556 ) ) ( not ( = ?auto_185548 ?auto_185557 ) ) ( not ( = ?auto_185549 ?auto_185550 ) ) ( not ( = ?auto_185549 ?auto_185551 ) ) ( not ( = ?auto_185549 ?auto_185552 ) ) ( not ( = ?auto_185549 ?auto_185553 ) ) ( not ( = ?auto_185549 ?auto_185554 ) ) ( not ( = ?auto_185549 ?auto_185555 ) ) ( not ( = ?auto_185549 ?auto_185556 ) ) ( not ( = ?auto_185549 ?auto_185557 ) ) ( not ( = ?auto_185550 ?auto_185551 ) ) ( not ( = ?auto_185550 ?auto_185552 ) ) ( not ( = ?auto_185550 ?auto_185553 ) ) ( not ( = ?auto_185550 ?auto_185554 ) ) ( not ( = ?auto_185550 ?auto_185555 ) ) ( not ( = ?auto_185550 ?auto_185556 ) ) ( not ( = ?auto_185550 ?auto_185557 ) ) ( not ( = ?auto_185551 ?auto_185552 ) ) ( not ( = ?auto_185551 ?auto_185553 ) ) ( not ( = ?auto_185551 ?auto_185554 ) ) ( not ( = ?auto_185551 ?auto_185555 ) ) ( not ( = ?auto_185551 ?auto_185556 ) ) ( not ( = ?auto_185551 ?auto_185557 ) ) ( not ( = ?auto_185552 ?auto_185553 ) ) ( not ( = ?auto_185552 ?auto_185554 ) ) ( not ( = ?auto_185552 ?auto_185555 ) ) ( not ( = ?auto_185552 ?auto_185556 ) ) ( not ( = ?auto_185552 ?auto_185557 ) ) ( not ( = ?auto_185553 ?auto_185554 ) ) ( not ( = ?auto_185553 ?auto_185555 ) ) ( not ( = ?auto_185553 ?auto_185556 ) ) ( not ( = ?auto_185553 ?auto_185557 ) ) ( not ( = ?auto_185554 ?auto_185555 ) ) ( not ( = ?auto_185554 ?auto_185556 ) ) ( not ( = ?auto_185554 ?auto_185557 ) ) ( not ( = ?auto_185555 ?auto_185556 ) ) ( not ( = ?auto_185555 ?auto_185557 ) ) ( not ( = ?auto_185556 ?auto_185557 ) ) ( CLEAR ?auto_185554 ) ( ON ?auto_185555 ?auto_185556 ) ( CLEAR ?auto_185555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_185545 ?auto_185546 ?auto_185547 ?auto_185548 ?auto_185549 ?auto_185550 ?auto_185551 ?auto_185552 ?auto_185553 ?auto_185554 ?auto_185555 )
      ( MAKE-12PILE ?auto_185545 ?auto_185546 ?auto_185547 ?auto_185548 ?auto_185549 ?auto_185550 ?auto_185551 ?auto_185552 ?auto_185553 ?auto_185554 ?auto_185555 ?auto_185556 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_185570 - BLOCK
      ?auto_185571 - BLOCK
      ?auto_185572 - BLOCK
      ?auto_185573 - BLOCK
      ?auto_185574 - BLOCK
      ?auto_185575 - BLOCK
      ?auto_185576 - BLOCK
      ?auto_185577 - BLOCK
      ?auto_185578 - BLOCK
      ?auto_185579 - BLOCK
      ?auto_185580 - BLOCK
      ?auto_185581 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185581 ) ( ON-TABLE ?auto_185570 ) ( ON ?auto_185571 ?auto_185570 ) ( ON ?auto_185572 ?auto_185571 ) ( ON ?auto_185573 ?auto_185572 ) ( ON ?auto_185574 ?auto_185573 ) ( ON ?auto_185575 ?auto_185574 ) ( ON ?auto_185576 ?auto_185575 ) ( ON ?auto_185577 ?auto_185576 ) ( ON ?auto_185578 ?auto_185577 ) ( ON ?auto_185579 ?auto_185578 ) ( not ( = ?auto_185570 ?auto_185571 ) ) ( not ( = ?auto_185570 ?auto_185572 ) ) ( not ( = ?auto_185570 ?auto_185573 ) ) ( not ( = ?auto_185570 ?auto_185574 ) ) ( not ( = ?auto_185570 ?auto_185575 ) ) ( not ( = ?auto_185570 ?auto_185576 ) ) ( not ( = ?auto_185570 ?auto_185577 ) ) ( not ( = ?auto_185570 ?auto_185578 ) ) ( not ( = ?auto_185570 ?auto_185579 ) ) ( not ( = ?auto_185570 ?auto_185580 ) ) ( not ( = ?auto_185570 ?auto_185581 ) ) ( not ( = ?auto_185571 ?auto_185572 ) ) ( not ( = ?auto_185571 ?auto_185573 ) ) ( not ( = ?auto_185571 ?auto_185574 ) ) ( not ( = ?auto_185571 ?auto_185575 ) ) ( not ( = ?auto_185571 ?auto_185576 ) ) ( not ( = ?auto_185571 ?auto_185577 ) ) ( not ( = ?auto_185571 ?auto_185578 ) ) ( not ( = ?auto_185571 ?auto_185579 ) ) ( not ( = ?auto_185571 ?auto_185580 ) ) ( not ( = ?auto_185571 ?auto_185581 ) ) ( not ( = ?auto_185572 ?auto_185573 ) ) ( not ( = ?auto_185572 ?auto_185574 ) ) ( not ( = ?auto_185572 ?auto_185575 ) ) ( not ( = ?auto_185572 ?auto_185576 ) ) ( not ( = ?auto_185572 ?auto_185577 ) ) ( not ( = ?auto_185572 ?auto_185578 ) ) ( not ( = ?auto_185572 ?auto_185579 ) ) ( not ( = ?auto_185572 ?auto_185580 ) ) ( not ( = ?auto_185572 ?auto_185581 ) ) ( not ( = ?auto_185573 ?auto_185574 ) ) ( not ( = ?auto_185573 ?auto_185575 ) ) ( not ( = ?auto_185573 ?auto_185576 ) ) ( not ( = ?auto_185573 ?auto_185577 ) ) ( not ( = ?auto_185573 ?auto_185578 ) ) ( not ( = ?auto_185573 ?auto_185579 ) ) ( not ( = ?auto_185573 ?auto_185580 ) ) ( not ( = ?auto_185573 ?auto_185581 ) ) ( not ( = ?auto_185574 ?auto_185575 ) ) ( not ( = ?auto_185574 ?auto_185576 ) ) ( not ( = ?auto_185574 ?auto_185577 ) ) ( not ( = ?auto_185574 ?auto_185578 ) ) ( not ( = ?auto_185574 ?auto_185579 ) ) ( not ( = ?auto_185574 ?auto_185580 ) ) ( not ( = ?auto_185574 ?auto_185581 ) ) ( not ( = ?auto_185575 ?auto_185576 ) ) ( not ( = ?auto_185575 ?auto_185577 ) ) ( not ( = ?auto_185575 ?auto_185578 ) ) ( not ( = ?auto_185575 ?auto_185579 ) ) ( not ( = ?auto_185575 ?auto_185580 ) ) ( not ( = ?auto_185575 ?auto_185581 ) ) ( not ( = ?auto_185576 ?auto_185577 ) ) ( not ( = ?auto_185576 ?auto_185578 ) ) ( not ( = ?auto_185576 ?auto_185579 ) ) ( not ( = ?auto_185576 ?auto_185580 ) ) ( not ( = ?auto_185576 ?auto_185581 ) ) ( not ( = ?auto_185577 ?auto_185578 ) ) ( not ( = ?auto_185577 ?auto_185579 ) ) ( not ( = ?auto_185577 ?auto_185580 ) ) ( not ( = ?auto_185577 ?auto_185581 ) ) ( not ( = ?auto_185578 ?auto_185579 ) ) ( not ( = ?auto_185578 ?auto_185580 ) ) ( not ( = ?auto_185578 ?auto_185581 ) ) ( not ( = ?auto_185579 ?auto_185580 ) ) ( not ( = ?auto_185579 ?auto_185581 ) ) ( not ( = ?auto_185580 ?auto_185581 ) ) ( CLEAR ?auto_185579 ) ( ON ?auto_185580 ?auto_185581 ) ( CLEAR ?auto_185580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_185570 ?auto_185571 ?auto_185572 ?auto_185573 ?auto_185574 ?auto_185575 ?auto_185576 ?auto_185577 ?auto_185578 ?auto_185579 ?auto_185580 )
      ( MAKE-12PILE ?auto_185570 ?auto_185571 ?auto_185572 ?auto_185573 ?auto_185574 ?auto_185575 ?auto_185576 ?auto_185577 ?auto_185578 ?auto_185579 ?auto_185580 ?auto_185581 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_185594 - BLOCK
      ?auto_185595 - BLOCK
      ?auto_185596 - BLOCK
      ?auto_185597 - BLOCK
      ?auto_185598 - BLOCK
      ?auto_185599 - BLOCK
      ?auto_185600 - BLOCK
      ?auto_185601 - BLOCK
      ?auto_185602 - BLOCK
      ?auto_185603 - BLOCK
      ?auto_185604 - BLOCK
      ?auto_185605 - BLOCK
    )
    :vars
    (
      ?auto_185606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185605 ?auto_185606 ) ( ON-TABLE ?auto_185594 ) ( ON ?auto_185595 ?auto_185594 ) ( ON ?auto_185596 ?auto_185595 ) ( ON ?auto_185597 ?auto_185596 ) ( ON ?auto_185598 ?auto_185597 ) ( ON ?auto_185599 ?auto_185598 ) ( ON ?auto_185600 ?auto_185599 ) ( ON ?auto_185601 ?auto_185600 ) ( ON ?auto_185602 ?auto_185601 ) ( not ( = ?auto_185594 ?auto_185595 ) ) ( not ( = ?auto_185594 ?auto_185596 ) ) ( not ( = ?auto_185594 ?auto_185597 ) ) ( not ( = ?auto_185594 ?auto_185598 ) ) ( not ( = ?auto_185594 ?auto_185599 ) ) ( not ( = ?auto_185594 ?auto_185600 ) ) ( not ( = ?auto_185594 ?auto_185601 ) ) ( not ( = ?auto_185594 ?auto_185602 ) ) ( not ( = ?auto_185594 ?auto_185603 ) ) ( not ( = ?auto_185594 ?auto_185604 ) ) ( not ( = ?auto_185594 ?auto_185605 ) ) ( not ( = ?auto_185594 ?auto_185606 ) ) ( not ( = ?auto_185595 ?auto_185596 ) ) ( not ( = ?auto_185595 ?auto_185597 ) ) ( not ( = ?auto_185595 ?auto_185598 ) ) ( not ( = ?auto_185595 ?auto_185599 ) ) ( not ( = ?auto_185595 ?auto_185600 ) ) ( not ( = ?auto_185595 ?auto_185601 ) ) ( not ( = ?auto_185595 ?auto_185602 ) ) ( not ( = ?auto_185595 ?auto_185603 ) ) ( not ( = ?auto_185595 ?auto_185604 ) ) ( not ( = ?auto_185595 ?auto_185605 ) ) ( not ( = ?auto_185595 ?auto_185606 ) ) ( not ( = ?auto_185596 ?auto_185597 ) ) ( not ( = ?auto_185596 ?auto_185598 ) ) ( not ( = ?auto_185596 ?auto_185599 ) ) ( not ( = ?auto_185596 ?auto_185600 ) ) ( not ( = ?auto_185596 ?auto_185601 ) ) ( not ( = ?auto_185596 ?auto_185602 ) ) ( not ( = ?auto_185596 ?auto_185603 ) ) ( not ( = ?auto_185596 ?auto_185604 ) ) ( not ( = ?auto_185596 ?auto_185605 ) ) ( not ( = ?auto_185596 ?auto_185606 ) ) ( not ( = ?auto_185597 ?auto_185598 ) ) ( not ( = ?auto_185597 ?auto_185599 ) ) ( not ( = ?auto_185597 ?auto_185600 ) ) ( not ( = ?auto_185597 ?auto_185601 ) ) ( not ( = ?auto_185597 ?auto_185602 ) ) ( not ( = ?auto_185597 ?auto_185603 ) ) ( not ( = ?auto_185597 ?auto_185604 ) ) ( not ( = ?auto_185597 ?auto_185605 ) ) ( not ( = ?auto_185597 ?auto_185606 ) ) ( not ( = ?auto_185598 ?auto_185599 ) ) ( not ( = ?auto_185598 ?auto_185600 ) ) ( not ( = ?auto_185598 ?auto_185601 ) ) ( not ( = ?auto_185598 ?auto_185602 ) ) ( not ( = ?auto_185598 ?auto_185603 ) ) ( not ( = ?auto_185598 ?auto_185604 ) ) ( not ( = ?auto_185598 ?auto_185605 ) ) ( not ( = ?auto_185598 ?auto_185606 ) ) ( not ( = ?auto_185599 ?auto_185600 ) ) ( not ( = ?auto_185599 ?auto_185601 ) ) ( not ( = ?auto_185599 ?auto_185602 ) ) ( not ( = ?auto_185599 ?auto_185603 ) ) ( not ( = ?auto_185599 ?auto_185604 ) ) ( not ( = ?auto_185599 ?auto_185605 ) ) ( not ( = ?auto_185599 ?auto_185606 ) ) ( not ( = ?auto_185600 ?auto_185601 ) ) ( not ( = ?auto_185600 ?auto_185602 ) ) ( not ( = ?auto_185600 ?auto_185603 ) ) ( not ( = ?auto_185600 ?auto_185604 ) ) ( not ( = ?auto_185600 ?auto_185605 ) ) ( not ( = ?auto_185600 ?auto_185606 ) ) ( not ( = ?auto_185601 ?auto_185602 ) ) ( not ( = ?auto_185601 ?auto_185603 ) ) ( not ( = ?auto_185601 ?auto_185604 ) ) ( not ( = ?auto_185601 ?auto_185605 ) ) ( not ( = ?auto_185601 ?auto_185606 ) ) ( not ( = ?auto_185602 ?auto_185603 ) ) ( not ( = ?auto_185602 ?auto_185604 ) ) ( not ( = ?auto_185602 ?auto_185605 ) ) ( not ( = ?auto_185602 ?auto_185606 ) ) ( not ( = ?auto_185603 ?auto_185604 ) ) ( not ( = ?auto_185603 ?auto_185605 ) ) ( not ( = ?auto_185603 ?auto_185606 ) ) ( not ( = ?auto_185604 ?auto_185605 ) ) ( not ( = ?auto_185604 ?auto_185606 ) ) ( not ( = ?auto_185605 ?auto_185606 ) ) ( ON ?auto_185604 ?auto_185605 ) ( CLEAR ?auto_185602 ) ( ON ?auto_185603 ?auto_185604 ) ( CLEAR ?auto_185603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_185594 ?auto_185595 ?auto_185596 ?auto_185597 ?auto_185598 ?auto_185599 ?auto_185600 ?auto_185601 ?auto_185602 ?auto_185603 )
      ( MAKE-12PILE ?auto_185594 ?auto_185595 ?auto_185596 ?auto_185597 ?auto_185598 ?auto_185599 ?auto_185600 ?auto_185601 ?auto_185602 ?auto_185603 ?auto_185604 ?auto_185605 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_185619 - BLOCK
      ?auto_185620 - BLOCK
      ?auto_185621 - BLOCK
      ?auto_185622 - BLOCK
      ?auto_185623 - BLOCK
      ?auto_185624 - BLOCK
      ?auto_185625 - BLOCK
      ?auto_185626 - BLOCK
      ?auto_185627 - BLOCK
      ?auto_185628 - BLOCK
      ?auto_185629 - BLOCK
      ?auto_185630 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185630 ) ( ON-TABLE ?auto_185619 ) ( ON ?auto_185620 ?auto_185619 ) ( ON ?auto_185621 ?auto_185620 ) ( ON ?auto_185622 ?auto_185621 ) ( ON ?auto_185623 ?auto_185622 ) ( ON ?auto_185624 ?auto_185623 ) ( ON ?auto_185625 ?auto_185624 ) ( ON ?auto_185626 ?auto_185625 ) ( ON ?auto_185627 ?auto_185626 ) ( not ( = ?auto_185619 ?auto_185620 ) ) ( not ( = ?auto_185619 ?auto_185621 ) ) ( not ( = ?auto_185619 ?auto_185622 ) ) ( not ( = ?auto_185619 ?auto_185623 ) ) ( not ( = ?auto_185619 ?auto_185624 ) ) ( not ( = ?auto_185619 ?auto_185625 ) ) ( not ( = ?auto_185619 ?auto_185626 ) ) ( not ( = ?auto_185619 ?auto_185627 ) ) ( not ( = ?auto_185619 ?auto_185628 ) ) ( not ( = ?auto_185619 ?auto_185629 ) ) ( not ( = ?auto_185619 ?auto_185630 ) ) ( not ( = ?auto_185620 ?auto_185621 ) ) ( not ( = ?auto_185620 ?auto_185622 ) ) ( not ( = ?auto_185620 ?auto_185623 ) ) ( not ( = ?auto_185620 ?auto_185624 ) ) ( not ( = ?auto_185620 ?auto_185625 ) ) ( not ( = ?auto_185620 ?auto_185626 ) ) ( not ( = ?auto_185620 ?auto_185627 ) ) ( not ( = ?auto_185620 ?auto_185628 ) ) ( not ( = ?auto_185620 ?auto_185629 ) ) ( not ( = ?auto_185620 ?auto_185630 ) ) ( not ( = ?auto_185621 ?auto_185622 ) ) ( not ( = ?auto_185621 ?auto_185623 ) ) ( not ( = ?auto_185621 ?auto_185624 ) ) ( not ( = ?auto_185621 ?auto_185625 ) ) ( not ( = ?auto_185621 ?auto_185626 ) ) ( not ( = ?auto_185621 ?auto_185627 ) ) ( not ( = ?auto_185621 ?auto_185628 ) ) ( not ( = ?auto_185621 ?auto_185629 ) ) ( not ( = ?auto_185621 ?auto_185630 ) ) ( not ( = ?auto_185622 ?auto_185623 ) ) ( not ( = ?auto_185622 ?auto_185624 ) ) ( not ( = ?auto_185622 ?auto_185625 ) ) ( not ( = ?auto_185622 ?auto_185626 ) ) ( not ( = ?auto_185622 ?auto_185627 ) ) ( not ( = ?auto_185622 ?auto_185628 ) ) ( not ( = ?auto_185622 ?auto_185629 ) ) ( not ( = ?auto_185622 ?auto_185630 ) ) ( not ( = ?auto_185623 ?auto_185624 ) ) ( not ( = ?auto_185623 ?auto_185625 ) ) ( not ( = ?auto_185623 ?auto_185626 ) ) ( not ( = ?auto_185623 ?auto_185627 ) ) ( not ( = ?auto_185623 ?auto_185628 ) ) ( not ( = ?auto_185623 ?auto_185629 ) ) ( not ( = ?auto_185623 ?auto_185630 ) ) ( not ( = ?auto_185624 ?auto_185625 ) ) ( not ( = ?auto_185624 ?auto_185626 ) ) ( not ( = ?auto_185624 ?auto_185627 ) ) ( not ( = ?auto_185624 ?auto_185628 ) ) ( not ( = ?auto_185624 ?auto_185629 ) ) ( not ( = ?auto_185624 ?auto_185630 ) ) ( not ( = ?auto_185625 ?auto_185626 ) ) ( not ( = ?auto_185625 ?auto_185627 ) ) ( not ( = ?auto_185625 ?auto_185628 ) ) ( not ( = ?auto_185625 ?auto_185629 ) ) ( not ( = ?auto_185625 ?auto_185630 ) ) ( not ( = ?auto_185626 ?auto_185627 ) ) ( not ( = ?auto_185626 ?auto_185628 ) ) ( not ( = ?auto_185626 ?auto_185629 ) ) ( not ( = ?auto_185626 ?auto_185630 ) ) ( not ( = ?auto_185627 ?auto_185628 ) ) ( not ( = ?auto_185627 ?auto_185629 ) ) ( not ( = ?auto_185627 ?auto_185630 ) ) ( not ( = ?auto_185628 ?auto_185629 ) ) ( not ( = ?auto_185628 ?auto_185630 ) ) ( not ( = ?auto_185629 ?auto_185630 ) ) ( ON ?auto_185629 ?auto_185630 ) ( CLEAR ?auto_185627 ) ( ON ?auto_185628 ?auto_185629 ) ( CLEAR ?auto_185628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_185619 ?auto_185620 ?auto_185621 ?auto_185622 ?auto_185623 ?auto_185624 ?auto_185625 ?auto_185626 ?auto_185627 ?auto_185628 )
      ( MAKE-12PILE ?auto_185619 ?auto_185620 ?auto_185621 ?auto_185622 ?auto_185623 ?auto_185624 ?auto_185625 ?auto_185626 ?auto_185627 ?auto_185628 ?auto_185629 ?auto_185630 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_185643 - BLOCK
      ?auto_185644 - BLOCK
      ?auto_185645 - BLOCK
      ?auto_185646 - BLOCK
      ?auto_185647 - BLOCK
      ?auto_185648 - BLOCK
      ?auto_185649 - BLOCK
      ?auto_185650 - BLOCK
      ?auto_185651 - BLOCK
      ?auto_185652 - BLOCK
      ?auto_185653 - BLOCK
      ?auto_185654 - BLOCK
    )
    :vars
    (
      ?auto_185655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185654 ?auto_185655 ) ( ON-TABLE ?auto_185643 ) ( ON ?auto_185644 ?auto_185643 ) ( ON ?auto_185645 ?auto_185644 ) ( ON ?auto_185646 ?auto_185645 ) ( ON ?auto_185647 ?auto_185646 ) ( ON ?auto_185648 ?auto_185647 ) ( ON ?auto_185649 ?auto_185648 ) ( ON ?auto_185650 ?auto_185649 ) ( not ( = ?auto_185643 ?auto_185644 ) ) ( not ( = ?auto_185643 ?auto_185645 ) ) ( not ( = ?auto_185643 ?auto_185646 ) ) ( not ( = ?auto_185643 ?auto_185647 ) ) ( not ( = ?auto_185643 ?auto_185648 ) ) ( not ( = ?auto_185643 ?auto_185649 ) ) ( not ( = ?auto_185643 ?auto_185650 ) ) ( not ( = ?auto_185643 ?auto_185651 ) ) ( not ( = ?auto_185643 ?auto_185652 ) ) ( not ( = ?auto_185643 ?auto_185653 ) ) ( not ( = ?auto_185643 ?auto_185654 ) ) ( not ( = ?auto_185643 ?auto_185655 ) ) ( not ( = ?auto_185644 ?auto_185645 ) ) ( not ( = ?auto_185644 ?auto_185646 ) ) ( not ( = ?auto_185644 ?auto_185647 ) ) ( not ( = ?auto_185644 ?auto_185648 ) ) ( not ( = ?auto_185644 ?auto_185649 ) ) ( not ( = ?auto_185644 ?auto_185650 ) ) ( not ( = ?auto_185644 ?auto_185651 ) ) ( not ( = ?auto_185644 ?auto_185652 ) ) ( not ( = ?auto_185644 ?auto_185653 ) ) ( not ( = ?auto_185644 ?auto_185654 ) ) ( not ( = ?auto_185644 ?auto_185655 ) ) ( not ( = ?auto_185645 ?auto_185646 ) ) ( not ( = ?auto_185645 ?auto_185647 ) ) ( not ( = ?auto_185645 ?auto_185648 ) ) ( not ( = ?auto_185645 ?auto_185649 ) ) ( not ( = ?auto_185645 ?auto_185650 ) ) ( not ( = ?auto_185645 ?auto_185651 ) ) ( not ( = ?auto_185645 ?auto_185652 ) ) ( not ( = ?auto_185645 ?auto_185653 ) ) ( not ( = ?auto_185645 ?auto_185654 ) ) ( not ( = ?auto_185645 ?auto_185655 ) ) ( not ( = ?auto_185646 ?auto_185647 ) ) ( not ( = ?auto_185646 ?auto_185648 ) ) ( not ( = ?auto_185646 ?auto_185649 ) ) ( not ( = ?auto_185646 ?auto_185650 ) ) ( not ( = ?auto_185646 ?auto_185651 ) ) ( not ( = ?auto_185646 ?auto_185652 ) ) ( not ( = ?auto_185646 ?auto_185653 ) ) ( not ( = ?auto_185646 ?auto_185654 ) ) ( not ( = ?auto_185646 ?auto_185655 ) ) ( not ( = ?auto_185647 ?auto_185648 ) ) ( not ( = ?auto_185647 ?auto_185649 ) ) ( not ( = ?auto_185647 ?auto_185650 ) ) ( not ( = ?auto_185647 ?auto_185651 ) ) ( not ( = ?auto_185647 ?auto_185652 ) ) ( not ( = ?auto_185647 ?auto_185653 ) ) ( not ( = ?auto_185647 ?auto_185654 ) ) ( not ( = ?auto_185647 ?auto_185655 ) ) ( not ( = ?auto_185648 ?auto_185649 ) ) ( not ( = ?auto_185648 ?auto_185650 ) ) ( not ( = ?auto_185648 ?auto_185651 ) ) ( not ( = ?auto_185648 ?auto_185652 ) ) ( not ( = ?auto_185648 ?auto_185653 ) ) ( not ( = ?auto_185648 ?auto_185654 ) ) ( not ( = ?auto_185648 ?auto_185655 ) ) ( not ( = ?auto_185649 ?auto_185650 ) ) ( not ( = ?auto_185649 ?auto_185651 ) ) ( not ( = ?auto_185649 ?auto_185652 ) ) ( not ( = ?auto_185649 ?auto_185653 ) ) ( not ( = ?auto_185649 ?auto_185654 ) ) ( not ( = ?auto_185649 ?auto_185655 ) ) ( not ( = ?auto_185650 ?auto_185651 ) ) ( not ( = ?auto_185650 ?auto_185652 ) ) ( not ( = ?auto_185650 ?auto_185653 ) ) ( not ( = ?auto_185650 ?auto_185654 ) ) ( not ( = ?auto_185650 ?auto_185655 ) ) ( not ( = ?auto_185651 ?auto_185652 ) ) ( not ( = ?auto_185651 ?auto_185653 ) ) ( not ( = ?auto_185651 ?auto_185654 ) ) ( not ( = ?auto_185651 ?auto_185655 ) ) ( not ( = ?auto_185652 ?auto_185653 ) ) ( not ( = ?auto_185652 ?auto_185654 ) ) ( not ( = ?auto_185652 ?auto_185655 ) ) ( not ( = ?auto_185653 ?auto_185654 ) ) ( not ( = ?auto_185653 ?auto_185655 ) ) ( not ( = ?auto_185654 ?auto_185655 ) ) ( ON ?auto_185653 ?auto_185654 ) ( ON ?auto_185652 ?auto_185653 ) ( CLEAR ?auto_185650 ) ( ON ?auto_185651 ?auto_185652 ) ( CLEAR ?auto_185651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_185643 ?auto_185644 ?auto_185645 ?auto_185646 ?auto_185647 ?auto_185648 ?auto_185649 ?auto_185650 ?auto_185651 )
      ( MAKE-12PILE ?auto_185643 ?auto_185644 ?auto_185645 ?auto_185646 ?auto_185647 ?auto_185648 ?auto_185649 ?auto_185650 ?auto_185651 ?auto_185652 ?auto_185653 ?auto_185654 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_185668 - BLOCK
      ?auto_185669 - BLOCK
      ?auto_185670 - BLOCK
      ?auto_185671 - BLOCK
      ?auto_185672 - BLOCK
      ?auto_185673 - BLOCK
      ?auto_185674 - BLOCK
      ?auto_185675 - BLOCK
      ?auto_185676 - BLOCK
      ?auto_185677 - BLOCK
      ?auto_185678 - BLOCK
      ?auto_185679 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185679 ) ( ON-TABLE ?auto_185668 ) ( ON ?auto_185669 ?auto_185668 ) ( ON ?auto_185670 ?auto_185669 ) ( ON ?auto_185671 ?auto_185670 ) ( ON ?auto_185672 ?auto_185671 ) ( ON ?auto_185673 ?auto_185672 ) ( ON ?auto_185674 ?auto_185673 ) ( ON ?auto_185675 ?auto_185674 ) ( not ( = ?auto_185668 ?auto_185669 ) ) ( not ( = ?auto_185668 ?auto_185670 ) ) ( not ( = ?auto_185668 ?auto_185671 ) ) ( not ( = ?auto_185668 ?auto_185672 ) ) ( not ( = ?auto_185668 ?auto_185673 ) ) ( not ( = ?auto_185668 ?auto_185674 ) ) ( not ( = ?auto_185668 ?auto_185675 ) ) ( not ( = ?auto_185668 ?auto_185676 ) ) ( not ( = ?auto_185668 ?auto_185677 ) ) ( not ( = ?auto_185668 ?auto_185678 ) ) ( not ( = ?auto_185668 ?auto_185679 ) ) ( not ( = ?auto_185669 ?auto_185670 ) ) ( not ( = ?auto_185669 ?auto_185671 ) ) ( not ( = ?auto_185669 ?auto_185672 ) ) ( not ( = ?auto_185669 ?auto_185673 ) ) ( not ( = ?auto_185669 ?auto_185674 ) ) ( not ( = ?auto_185669 ?auto_185675 ) ) ( not ( = ?auto_185669 ?auto_185676 ) ) ( not ( = ?auto_185669 ?auto_185677 ) ) ( not ( = ?auto_185669 ?auto_185678 ) ) ( not ( = ?auto_185669 ?auto_185679 ) ) ( not ( = ?auto_185670 ?auto_185671 ) ) ( not ( = ?auto_185670 ?auto_185672 ) ) ( not ( = ?auto_185670 ?auto_185673 ) ) ( not ( = ?auto_185670 ?auto_185674 ) ) ( not ( = ?auto_185670 ?auto_185675 ) ) ( not ( = ?auto_185670 ?auto_185676 ) ) ( not ( = ?auto_185670 ?auto_185677 ) ) ( not ( = ?auto_185670 ?auto_185678 ) ) ( not ( = ?auto_185670 ?auto_185679 ) ) ( not ( = ?auto_185671 ?auto_185672 ) ) ( not ( = ?auto_185671 ?auto_185673 ) ) ( not ( = ?auto_185671 ?auto_185674 ) ) ( not ( = ?auto_185671 ?auto_185675 ) ) ( not ( = ?auto_185671 ?auto_185676 ) ) ( not ( = ?auto_185671 ?auto_185677 ) ) ( not ( = ?auto_185671 ?auto_185678 ) ) ( not ( = ?auto_185671 ?auto_185679 ) ) ( not ( = ?auto_185672 ?auto_185673 ) ) ( not ( = ?auto_185672 ?auto_185674 ) ) ( not ( = ?auto_185672 ?auto_185675 ) ) ( not ( = ?auto_185672 ?auto_185676 ) ) ( not ( = ?auto_185672 ?auto_185677 ) ) ( not ( = ?auto_185672 ?auto_185678 ) ) ( not ( = ?auto_185672 ?auto_185679 ) ) ( not ( = ?auto_185673 ?auto_185674 ) ) ( not ( = ?auto_185673 ?auto_185675 ) ) ( not ( = ?auto_185673 ?auto_185676 ) ) ( not ( = ?auto_185673 ?auto_185677 ) ) ( not ( = ?auto_185673 ?auto_185678 ) ) ( not ( = ?auto_185673 ?auto_185679 ) ) ( not ( = ?auto_185674 ?auto_185675 ) ) ( not ( = ?auto_185674 ?auto_185676 ) ) ( not ( = ?auto_185674 ?auto_185677 ) ) ( not ( = ?auto_185674 ?auto_185678 ) ) ( not ( = ?auto_185674 ?auto_185679 ) ) ( not ( = ?auto_185675 ?auto_185676 ) ) ( not ( = ?auto_185675 ?auto_185677 ) ) ( not ( = ?auto_185675 ?auto_185678 ) ) ( not ( = ?auto_185675 ?auto_185679 ) ) ( not ( = ?auto_185676 ?auto_185677 ) ) ( not ( = ?auto_185676 ?auto_185678 ) ) ( not ( = ?auto_185676 ?auto_185679 ) ) ( not ( = ?auto_185677 ?auto_185678 ) ) ( not ( = ?auto_185677 ?auto_185679 ) ) ( not ( = ?auto_185678 ?auto_185679 ) ) ( ON ?auto_185678 ?auto_185679 ) ( ON ?auto_185677 ?auto_185678 ) ( CLEAR ?auto_185675 ) ( ON ?auto_185676 ?auto_185677 ) ( CLEAR ?auto_185676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_185668 ?auto_185669 ?auto_185670 ?auto_185671 ?auto_185672 ?auto_185673 ?auto_185674 ?auto_185675 ?auto_185676 )
      ( MAKE-12PILE ?auto_185668 ?auto_185669 ?auto_185670 ?auto_185671 ?auto_185672 ?auto_185673 ?auto_185674 ?auto_185675 ?auto_185676 ?auto_185677 ?auto_185678 ?auto_185679 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_185692 - BLOCK
      ?auto_185693 - BLOCK
      ?auto_185694 - BLOCK
      ?auto_185695 - BLOCK
      ?auto_185696 - BLOCK
      ?auto_185697 - BLOCK
      ?auto_185698 - BLOCK
      ?auto_185699 - BLOCK
      ?auto_185700 - BLOCK
      ?auto_185701 - BLOCK
      ?auto_185702 - BLOCK
      ?auto_185703 - BLOCK
    )
    :vars
    (
      ?auto_185704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185703 ?auto_185704 ) ( ON-TABLE ?auto_185692 ) ( ON ?auto_185693 ?auto_185692 ) ( ON ?auto_185694 ?auto_185693 ) ( ON ?auto_185695 ?auto_185694 ) ( ON ?auto_185696 ?auto_185695 ) ( ON ?auto_185697 ?auto_185696 ) ( ON ?auto_185698 ?auto_185697 ) ( not ( = ?auto_185692 ?auto_185693 ) ) ( not ( = ?auto_185692 ?auto_185694 ) ) ( not ( = ?auto_185692 ?auto_185695 ) ) ( not ( = ?auto_185692 ?auto_185696 ) ) ( not ( = ?auto_185692 ?auto_185697 ) ) ( not ( = ?auto_185692 ?auto_185698 ) ) ( not ( = ?auto_185692 ?auto_185699 ) ) ( not ( = ?auto_185692 ?auto_185700 ) ) ( not ( = ?auto_185692 ?auto_185701 ) ) ( not ( = ?auto_185692 ?auto_185702 ) ) ( not ( = ?auto_185692 ?auto_185703 ) ) ( not ( = ?auto_185692 ?auto_185704 ) ) ( not ( = ?auto_185693 ?auto_185694 ) ) ( not ( = ?auto_185693 ?auto_185695 ) ) ( not ( = ?auto_185693 ?auto_185696 ) ) ( not ( = ?auto_185693 ?auto_185697 ) ) ( not ( = ?auto_185693 ?auto_185698 ) ) ( not ( = ?auto_185693 ?auto_185699 ) ) ( not ( = ?auto_185693 ?auto_185700 ) ) ( not ( = ?auto_185693 ?auto_185701 ) ) ( not ( = ?auto_185693 ?auto_185702 ) ) ( not ( = ?auto_185693 ?auto_185703 ) ) ( not ( = ?auto_185693 ?auto_185704 ) ) ( not ( = ?auto_185694 ?auto_185695 ) ) ( not ( = ?auto_185694 ?auto_185696 ) ) ( not ( = ?auto_185694 ?auto_185697 ) ) ( not ( = ?auto_185694 ?auto_185698 ) ) ( not ( = ?auto_185694 ?auto_185699 ) ) ( not ( = ?auto_185694 ?auto_185700 ) ) ( not ( = ?auto_185694 ?auto_185701 ) ) ( not ( = ?auto_185694 ?auto_185702 ) ) ( not ( = ?auto_185694 ?auto_185703 ) ) ( not ( = ?auto_185694 ?auto_185704 ) ) ( not ( = ?auto_185695 ?auto_185696 ) ) ( not ( = ?auto_185695 ?auto_185697 ) ) ( not ( = ?auto_185695 ?auto_185698 ) ) ( not ( = ?auto_185695 ?auto_185699 ) ) ( not ( = ?auto_185695 ?auto_185700 ) ) ( not ( = ?auto_185695 ?auto_185701 ) ) ( not ( = ?auto_185695 ?auto_185702 ) ) ( not ( = ?auto_185695 ?auto_185703 ) ) ( not ( = ?auto_185695 ?auto_185704 ) ) ( not ( = ?auto_185696 ?auto_185697 ) ) ( not ( = ?auto_185696 ?auto_185698 ) ) ( not ( = ?auto_185696 ?auto_185699 ) ) ( not ( = ?auto_185696 ?auto_185700 ) ) ( not ( = ?auto_185696 ?auto_185701 ) ) ( not ( = ?auto_185696 ?auto_185702 ) ) ( not ( = ?auto_185696 ?auto_185703 ) ) ( not ( = ?auto_185696 ?auto_185704 ) ) ( not ( = ?auto_185697 ?auto_185698 ) ) ( not ( = ?auto_185697 ?auto_185699 ) ) ( not ( = ?auto_185697 ?auto_185700 ) ) ( not ( = ?auto_185697 ?auto_185701 ) ) ( not ( = ?auto_185697 ?auto_185702 ) ) ( not ( = ?auto_185697 ?auto_185703 ) ) ( not ( = ?auto_185697 ?auto_185704 ) ) ( not ( = ?auto_185698 ?auto_185699 ) ) ( not ( = ?auto_185698 ?auto_185700 ) ) ( not ( = ?auto_185698 ?auto_185701 ) ) ( not ( = ?auto_185698 ?auto_185702 ) ) ( not ( = ?auto_185698 ?auto_185703 ) ) ( not ( = ?auto_185698 ?auto_185704 ) ) ( not ( = ?auto_185699 ?auto_185700 ) ) ( not ( = ?auto_185699 ?auto_185701 ) ) ( not ( = ?auto_185699 ?auto_185702 ) ) ( not ( = ?auto_185699 ?auto_185703 ) ) ( not ( = ?auto_185699 ?auto_185704 ) ) ( not ( = ?auto_185700 ?auto_185701 ) ) ( not ( = ?auto_185700 ?auto_185702 ) ) ( not ( = ?auto_185700 ?auto_185703 ) ) ( not ( = ?auto_185700 ?auto_185704 ) ) ( not ( = ?auto_185701 ?auto_185702 ) ) ( not ( = ?auto_185701 ?auto_185703 ) ) ( not ( = ?auto_185701 ?auto_185704 ) ) ( not ( = ?auto_185702 ?auto_185703 ) ) ( not ( = ?auto_185702 ?auto_185704 ) ) ( not ( = ?auto_185703 ?auto_185704 ) ) ( ON ?auto_185702 ?auto_185703 ) ( ON ?auto_185701 ?auto_185702 ) ( ON ?auto_185700 ?auto_185701 ) ( CLEAR ?auto_185698 ) ( ON ?auto_185699 ?auto_185700 ) ( CLEAR ?auto_185699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_185692 ?auto_185693 ?auto_185694 ?auto_185695 ?auto_185696 ?auto_185697 ?auto_185698 ?auto_185699 )
      ( MAKE-12PILE ?auto_185692 ?auto_185693 ?auto_185694 ?auto_185695 ?auto_185696 ?auto_185697 ?auto_185698 ?auto_185699 ?auto_185700 ?auto_185701 ?auto_185702 ?auto_185703 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_185717 - BLOCK
      ?auto_185718 - BLOCK
      ?auto_185719 - BLOCK
      ?auto_185720 - BLOCK
      ?auto_185721 - BLOCK
      ?auto_185722 - BLOCK
      ?auto_185723 - BLOCK
      ?auto_185724 - BLOCK
      ?auto_185725 - BLOCK
      ?auto_185726 - BLOCK
      ?auto_185727 - BLOCK
      ?auto_185728 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185728 ) ( ON-TABLE ?auto_185717 ) ( ON ?auto_185718 ?auto_185717 ) ( ON ?auto_185719 ?auto_185718 ) ( ON ?auto_185720 ?auto_185719 ) ( ON ?auto_185721 ?auto_185720 ) ( ON ?auto_185722 ?auto_185721 ) ( ON ?auto_185723 ?auto_185722 ) ( not ( = ?auto_185717 ?auto_185718 ) ) ( not ( = ?auto_185717 ?auto_185719 ) ) ( not ( = ?auto_185717 ?auto_185720 ) ) ( not ( = ?auto_185717 ?auto_185721 ) ) ( not ( = ?auto_185717 ?auto_185722 ) ) ( not ( = ?auto_185717 ?auto_185723 ) ) ( not ( = ?auto_185717 ?auto_185724 ) ) ( not ( = ?auto_185717 ?auto_185725 ) ) ( not ( = ?auto_185717 ?auto_185726 ) ) ( not ( = ?auto_185717 ?auto_185727 ) ) ( not ( = ?auto_185717 ?auto_185728 ) ) ( not ( = ?auto_185718 ?auto_185719 ) ) ( not ( = ?auto_185718 ?auto_185720 ) ) ( not ( = ?auto_185718 ?auto_185721 ) ) ( not ( = ?auto_185718 ?auto_185722 ) ) ( not ( = ?auto_185718 ?auto_185723 ) ) ( not ( = ?auto_185718 ?auto_185724 ) ) ( not ( = ?auto_185718 ?auto_185725 ) ) ( not ( = ?auto_185718 ?auto_185726 ) ) ( not ( = ?auto_185718 ?auto_185727 ) ) ( not ( = ?auto_185718 ?auto_185728 ) ) ( not ( = ?auto_185719 ?auto_185720 ) ) ( not ( = ?auto_185719 ?auto_185721 ) ) ( not ( = ?auto_185719 ?auto_185722 ) ) ( not ( = ?auto_185719 ?auto_185723 ) ) ( not ( = ?auto_185719 ?auto_185724 ) ) ( not ( = ?auto_185719 ?auto_185725 ) ) ( not ( = ?auto_185719 ?auto_185726 ) ) ( not ( = ?auto_185719 ?auto_185727 ) ) ( not ( = ?auto_185719 ?auto_185728 ) ) ( not ( = ?auto_185720 ?auto_185721 ) ) ( not ( = ?auto_185720 ?auto_185722 ) ) ( not ( = ?auto_185720 ?auto_185723 ) ) ( not ( = ?auto_185720 ?auto_185724 ) ) ( not ( = ?auto_185720 ?auto_185725 ) ) ( not ( = ?auto_185720 ?auto_185726 ) ) ( not ( = ?auto_185720 ?auto_185727 ) ) ( not ( = ?auto_185720 ?auto_185728 ) ) ( not ( = ?auto_185721 ?auto_185722 ) ) ( not ( = ?auto_185721 ?auto_185723 ) ) ( not ( = ?auto_185721 ?auto_185724 ) ) ( not ( = ?auto_185721 ?auto_185725 ) ) ( not ( = ?auto_185721 ?auto_185726 ) ) ( not ( = ?auto_185721 ?auto_185727 ) ) ( not ( = ?auto_185721 ?auto_185728 ) ) ( not ( = ?auto_185722 ?auto_185723 ) ) ( not ( = ?auto_185722 ?auto_185724 ) ) ( not ( = ?auto_185722 ?auto_185725 ) ) ( not ( = ?auto_185722 ?auto_185726 ) ) ( not ( = ?auto_185722 ?auto_185727 ) ) ( not ( = ?auto_185722 ?auto_185728 ) ) ( not ( = ?auto_185723 ?auto_185724 ) ) ( not ( = ?auto_185723 ?auto_185725 ) ) ( not ( = ?auto_185723 ?auto_185726 ) ) ( not ( = ?auto_185723 ?auto_185727 ) ) ( not ( = ?auto_185723 ?auto_185728 ) ) ( not ( = ?auto_185724 ?auto_185725 ) ) ( not ( = ?auto_185724 ?auto_185726 ) ) ( not ( = ?auto_185724 ?auto_185727 ) ) ( not ( = ?auto_185724 ?auto_185728 ) ) ( not ( = ?auto_185725 ?auto_185726 ) ) ( not ( = ?auto_185725 ?auto_185727 ) ) ( not ( = ?auto_185725 ?auto_185728 ) ) ( not ( = ?auto_185726 ?auto_185727 ) ) ( not ( = ?auto_185726 ?auto_185728 ) ) ( not ( = ?auto_185727 ?auto_185728 ) ) ( ON ?auto_185727 ?auto_185728 ) ( ON ?auto_185726 ?auto_185727 ) ( ON ?auto_185725 ?auto_185726 ) ( CLEAR ?auto_185723 ) ( ON ?auto_185724 ?auto_185725 ) ( CLEAR ?auto_185724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_185717 ?auto_185718 ?auto_185719 ?auto_185720 ?auto_185721 ?auto_185722 ?auto_185723 ?auto_185724 )
      ( MAKE-12PILE ?auto_185717 ?auto_185718 ?auto_185719 ?auto_185720 ?auto_185721 ?auto_185722 ?auto_185723 ?auto_185724 ?auto_185725 ?auto_185726 ?auto_185727 ?auto_185728 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_185741 - BLOCK
      ?auto_185742 - BLOCK
      ?auto_185743 - BLOCK
      ?auto_185744 - BLOCK
      ?auto_185745 - BLOCK
      ?auto_185746 - BLOCK
      ?auto_185747 - BLOCK
      ?auto_185748 - BLOCK
      ?auto_185749 - BLOCK
      ?auto_185750 - BLOCK
      ?auto_185751 - BLOCK
      ?auto_185752 - BLOCK
    )
    :vars
    (
      ?auto_185753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185752 ?auto_185753 ) ( ON-TABLE ?auto_185741 ) ( ON ?auto_185742 ?auto_185741 ) ( ON ?auto_185743 ?auto_185742 ) ( ON ?auto_185744 ?auto_185743 ) ( ON ?auto_185745 ?auto_185744 ) ( ON ?auto_185746 ?auto_185745 ) ( not ( = ?auto_185741 ?auto_185742 ) ) ( not ( = ?auto_185741 ?auto_185743 ) ) ( not ( = ?auto_185741 ?auto_185744 ) ) ( not ( = ?auto_185741 ?auto_185745 ) ) ( not ( = ?auto_185741 ?auto_185746 ) ) ( not ( = ?auto_185741 ?auto_185747 ) ) ( not ( = ?auto_185741 ?auto_185748 ) ) ( not ( = ?auto_185741 ?auto_185749 ) ) ( not ( = ?auto_185741 ?auto_185750 ) ) ( not ( = ?auto_185741 ?auto_185751 ) ) ( not ( = ?auto_185741 ?auto_185752 ) ) ( not ( = ?auto_185741 ?auto_185753 ) ) ( not ( = ?auto_185742 ?auto_185743 ) ) ( not ( = ?auto_185742 ?auto_185744 ) ) ( not ( = ?auto_185742 ?auto_185745 ) ) ( not ( = ?auto_185742 ?auto_185746 ) ) ( not ( = ?auto_185742 ?auto_185747 ) ) ( not ( = ?auto_185742 ?auto_185748 ) ) ( not ( = ?auto_185742 ?auto_185749 ) ) ( not ( = ?auto_185742 ?auto_185750 ) ) ( not ( = ?auto_185742 ?auto_185751 ) ) ( not ( = ?auto_185742 ?auto_185752 ) ) ( not ( = ?auto_185742 ?auto_185753 ) ) ( not ( = ?auto_185743 ?auto_185744 ) ) ( not ( = ?auto_185743 ?auto_185745 ) ) ( not ( = ?auto_185743 ?auto_185746 ) ) ( not ( = ?auto_185743 ?auto_185747 ) ) ( not ( = ?auto_185743 ?auto_185748 ) ) ( not ( = ?auto_185743 ?auto_185749 ) ) ( not ( = ?auto_185743 ?auto_185750 ) ) ( not ( = ?auto_185743 ?auto_185751 ) ) ( not ( = ?auto_185743 ?auto_185752 ) ) ( not ( = ?auto_185743 ?auto_185753 ) ) ( not ( = ?auto_185744 ?auto_185745 ) ) ( not ( = ?auto_185744 ?auto_185746 ) ) ( not ( = ?auto_185744 ?auto_185747 ) ) ( not ( = ?auto_185744 ?auto_185748 ) ) ( not ( = ?auto_185744 ?auto_185749 ) ) ( not ( = ?auto_185744 ?auto_185750 ) ) ( not ( = ?auto_185744 ?auto_185751 ) ) ( not ( = ?auto_185744 ?auto_185752 ) ) ( not ( = ?auto_185744 ?auto_185753 ) ) ( not ( = ?auto_185745 ?auto_185746 ) ) ( not ( = ?auto_185745 ?auto_185747 ) ) ( not ( = ?auto_185745 ?auto_185748 ) ) ( not ( = ?auto_185745 ?auto_185749 ) ) ( not ( = ?auto_185745 ?auto_185750 ) ) ( not ( = ?auto_185745 ?auto_185751 ) ) ( not ( = ?auto_185745 ?auto_185752 ) ) ( not ( = ?auto_185745 ?auto_185753 ) ) ( not ( = ?auto_185746 ?auto_185747 ) ) ( not ( = ?auto_185746 ?auto_185748 ) ) ( not ( = ?auto_185746 ?auto_185749 ) ) ( not ( = ?auto_185746 ?auto_185750 ) ) ( not ( = ?auto_185746 ?auto_185751 ) ) ( not ( = ?auto_185746 ?auto_185752 ) ) ( not ( = ?auto_185746 ?auto_185753 ) ) ( not ( = ?auto_185747 ?auto_185748 ) ) ( not ( = ?auto_185747 ?auto_185749 ) ) ( not ( = ?auto_185747 ?auto_185750 ) ) ( not ( = ?auto_185747 ?auto_185751 ) ) ( not ( = ?auto_185747 ?auto_185752 ) ) ( not ( = ?auto_185747 ?auto_185753 ) ) ( not ( = ?auto_185748 ?auto_185749 ) ) ( not ( = ?auto_185748 ?auto_185750 ) ) ( not ( = ?auto_185748 ?auto_185751 ) ) ( not ( = ?auto_185748 ?auto_185752 ) ) ( not ( = ?auto_185748 ?auto_185753 ) ) ( not ( = ?auto_185749 ?auto_185750 ) ) ( not ( = ?auto_185749 ?auto_185751 ) ) ( not ( = ?auto_185749 ?auto_185752 ) ) ( not ( = ?auto_185749 ?auto_185753 ) ) ( not ( = ?auto_185750 ?auto_185751 ) ) ( not ( = ?auto_185750 ?auto_185752 ) ) ( not ( = ?auto_185750 ?auto_185753 ) ) ( not ( = ?auto_185751 ?auto_185752 ) ) ( not ( = ?auto_185751 ?auto_185753 ) ) ( not ( = ?auto_185752 ?auto_185753 ) ) ( ON ?auto_185751 ?auto_185752 ) ( ON ?auto_185750 ?auto_185751 ) ( ON ?auto_185749 ?auto_185750 ) ( ON ?auto_185748 ?auto_185749 ) ( CLEAR ?auto_185746 ) ( ON ?auto_185747 ?auto_185748 ) ( CLEAR ?auto_185747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185741 ?auto_185742 ?auto_185743 ?auto_185744 ?auto_185745 ?auto_185746 ?auto_185747 )
      ( MAKE-12PILE ?auto_185741 ?auto_185742 ?auto_185743 ?auto_185744 ?auto_185745 ?auto_185746 ?auto_185747 ?auto_185748 ?auto_185749 ?auto_185750 ?auto_185751 ?auto_185752 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_185766 - BLOCK
      ?auto_185767 - BLOCK
      ?auto_185768 - BLOCK
      ?auto_185769 - BLOCK
      ?auto_185770 - BLOCK
      ?auto_185771 - BLOCK
      ?auto_185772 - BLOCK
      ?auto_185773 - BLOCK
      ?auto_185774 - BLOCK
      ?auto_185775 - BLOCK
      ?auto_185776 - BLOCK
      ?auto_185777 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185777 ) ( ON-TABLE ?auto_185766 ) ( ON ?auto_185767 ?auto_185766 ) ( ON ?auto_185768 ?auto_185767 ) ( ON ?auto_185769 ?auto_185768 ) ( ON ?auto_185770 ?auto_185769 ) ( ON ?auto_185771 ?auto_185770 ) ( not ( = ?auto_185766 ?auto_185767 ) ) ( not ( = ?auto_185766 ?auto_185768 ) ) ( not ( = ?auto_185766 ?auto_185769 ) ) ( not ( = ?auto_185766 ?auto_185770 ) ) ( not ( = ?auto_185766 ?auto_185771 ) ) ( not ( = ?auto_185766 ?auto_185772 ) ) ( not ( = ?auto_185766 ?auto_185773 ) ) ( not ( = ?auto_185766 ?auto_185774 ) ) ( not ( = ?auto_185766 ?auto_185775 ) ) ( not ( = ?auto_185766 ?auto_185776 ) ) ( not ( = ?auto_185766 ?auto_185777 ) ) ( not ( = ?auto_185767 ?auto_185768 ) ) ( not ( = ?auto_185767 ?auto_185769 ) ) ( not ( = ?auto_185767 ?auto_185770 ) ) ( not ( = ?auto_185767 ?auto_185771 ) ) ( not ( = ?auto_185767 ?auto_185772 ) ) ( not ( = ?auto_185767 ?auto_185773 ) ) ( not ( = ?auto_185767 ?auto_185774 ) ) ( not ( = ?auto_185767 ?auto_185775 ) ) ( not ( = ?auto_185767 ?auto_185776 ) ) ( not ( = ?auto_185767 ?auto_185777 ) ) ( not ( = ?auto_185768 ?auto_185769 ) ) ( not ( = ?auto_185768 ?auto_185770 ) ) ( not ( = ?auto_185768 ?auto_185771 ) ) ( not ( = ?auto_185768 ?auto_185772 ) ) ( not ( = ?auto_185768 ?auto_185773 ) ) ( not ( = ?auto_185768 ?auto_185774 ) ) ( not ( = ?auto_185768 ?auto_185775 ) ) ( not ( = ?auto_185768 ?auto_185776 ) ) ( not ( = ?auto_185768 ?auto_185777 ) ) ( not ( = ?auto_185769 ?auto_185770 ) ) ( not ( = ?auto_185769 ?auto_185771 ) ) ( not ( = ?auto_185769 ?auto_185772 ) ) ( not ( = ?auto_185769 ?auto_185773 ) ) ( not ( = ?auto_185769 ?auto_185774 ) ) ( not ( = ?auto_185769 ?auto_185775 ) ) ( not ( = ?auto_185769 ?auto_185776 ) ) ( not ( = ?auto_185769 ?auto_185777 ) ) ( not ( = ?auto_185770 ?auto_185771 ) ) ( not ( = ?auto_185770 ?auto_185772 ) ) ( not ( = ?auto_185770 ?auto_185773 ) ) ( not ( = ?auto_185770 ?auto_185774 ) ) ( not ( = ?auto_185770 ?auto_185775 ) ) ( not ( = ?auto_185770 ?auto_185776 ) ) ( not ( = ?auto_185770 ?auto_185777 ) ) ( not ( = ?auto_185771 ?auto_185772 ) ) ( not ( = ?auto_185771 ?auto_185773 ) ) ( not ( = ?auto_185771 ?auto_185774 ) ) ( not ( = ?auto_185771 ?auto_185775 ) ) ( not ( = ?auto_185771 ?auto_185776 ) ) ( not ( = ?auto_185771 ?auto_185777 ) ) ( not ( = ?auto_185772 ?auto_185773 ) ) ( not ( = ?auto_185772 ?auto_185774 ) ) ( not ( = ?auto_185772 ?auto_185775 ) ) ( not ( = ?auto_185772 ?auto_185776 ) ) ( not ( = ?auto_185772 ?auto_185777 ) ) ( not ( = ?auto_185773 ?auto_185774 ) ) ( not ( = ?auto_185773 ?auto_185775 ) ) ( not ( = ?auto_185773 ?auto_185776 ) ) ( not ( = ?auto_185773 ?auto_185777 ) ) ( not ( = ?auto_185774 ?auto_185775 ) ) ( not ( = ?auto_185774 ?auto_185776 ) ) ( not ( = ?auto_185774 ?auto_185777 ) ) ( not ( = ?auto_185775 ?auto_185776 ) ) ( not ( = ?auto_185775 ?auto_185777 ) ) ( not ( = ?auto_185776 ?auto_185777 ) ) ( ON ?auto_185776 ?auto_185777 ) ( ON ?auto_185775 ?auto_185776 ) ( ON ?auto_185774 ?auto_185775 ) ( ON ?auto_185773 ?auto_185774 ) ( CLEAR ?auto_185771 ) ( ON ?auto_185772 ?auto_185773 ) ( CLEAR ?auto_185772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185766 ?auto_185767 ?auto_185768 ?auto_185769 ?auto_185770 ?auto_185771 ?auto_185772 )
      ( MAKE-12PILE ?auto_185766 ?auto_185767 ?auto_185768 ?auto_185769 ?auto_185770 ?auto_185771 ?auto_185772 ?auto_185773 ?auto_185774 ?auto_185775 ?auto_185776 ?auto_185777 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_185790 - BLOCK
      ?auto_185791 - BLOCK
      ?auto_185792 - BLOCK
      ?auto_185793 - BLOCK
      ?auto_185794 - BLOCK
      ?auto_185795 - BLOCK
      ?auto_185796 - BLOCK
      ?auto_185797 - BLOCK
      ?auto_185798 - BLOCK
      ?auto_185799 - BLOCK
      ?auto_185800 - BLOCK
      ?auto_185801 - BLOCK
    )
    :vars
    (
      ?auto_185802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185801 ?auto_185802 ) ( ON-TABLE ?auto_185790 ) ( ON ?auto_185791 ?auto_185790 ) ( ON ?auto_185792 ?auto_185791 ) ( ON ?auto_185793 ?auto_185792 ) ( ON ?auto_185794 ?auto_185793 ) ( not ( = ?auto_185790 ?auto_185791 ) ) ( not ( = ?auto_185790 ?auto_185792 ) ) ( not ( = ?auto_185790 ?auto_185793 ) ) ( not ( = ?auto_185790 ?auto_185794 ) ) ( not ( = ?auto_185790 ?auto_185795 ) ) ( not ( = ?auto_185790 ?auto_185796 ) ) ( not ( = ?auto_185790 ?auto_185797 ) ) ( not ( = ?auto_185790 ?auto_185798 ) ) ( not ( = ?auto_185790 ?auto_185799 ) ) ( not ( = ?auto_185790 ?auto_185800 ) ) ( not ( = ?auto_185790 ?auto_185801 ) ) ( not ( = ?auto_185790 ?auto_185802 ) ) ( not ( = ?auto_185791 ?auto_185792 ) ) ( not ( = ?auto_185791 ?auto_185793 ) ) ( not ( = ?auto_185791 ?auto_185794 ) ) ( not ( = ?auto_185791 ?auto_185795 ) ) ( not ( = ?auto_185791 ?auto_185796 ) ) ( not ( = ?auto_185791 ?auto_185797 ) ) ( not ( = ?auto_185791 ?auto_185798 ) ) ( not ( = ?auto_185791 ?auto_185799 ) ) ( not ( = ?auto_185791 ?auto_185800 ) ) ( not ( = ?auto_185791 ?auto_185801 ) ) ( not ( = ?auto_185791 ?auto_185802 ) ) ( not ( = ?auto_185792 ?auto_185793 ) ) ( not ( = ?auto_185792 ?auto_185794 ) ) ( not ( = ?auto_185792 ?auto_185795 ) ) ( not ( = ?auto_185792 ?auto_185796 ) ) ( not ( = ?auto_185792 ?auto_185797 ) ) ( not ( = ?auto_185792 ?auto_185798 ) ) ( not ( = ?auto_185792 ?auto_185799 ) ) ( not ( = ?auto_185792 ?auto_185800 ) ) ( not ( = ?auto_185792 ?auto_185801 ) ) ( not ( = ?auto_185792 ?auto_185802 ) ) ( not ( = ?auto_185793 ?auto_185794 ) ) ( not ( = ?auto_185793 ?auto_185795 ) ) ( not ( = ?auto_185793 ?auto_185796 ) ) ( not ( = ?auto_185793 ?auto_185797 ) ) ( not ( = ?auto_185793 ?auto_185798 ) ) ( not ( = ?auto_185793 ?auto_185799 ) ) ( not ( = ?auto_185793 ?auto_185800 ) ) ( not ( = ?auto_185793 ?auto_185801 ) ) ( not ( = ?auto_185793 ?auto_185802 ) ) ( not ( = ?auto_185794 ?auto_185795 ) ) ( not ( = ?auto_185794 ?auto_185796 ) ) ( not ( = ?auto_185794 ?auto_185797 ) ) ( not ( = ?auto_185794 ?auto_185798 ) ) ( not ( = ?auto_185794 ?auto_185799 ) ) ( not ( = ?auto_185794 ?auto_185800 ) ) ( not ( = ?auto_185794 ?auto_185801 ) ) ( not ( = ?auto_185794 ?auto_185802 ) ) ( not ( = ?auto_185795 ?auto_185796 ) ) ( not ( = ?auto_185795 ?auto_185797 ) ) ( not ( = ?auto_185795 ?auto_185798 ) ) ( not ( = ?auto_185795 ?auto_185799 ) ) ( not ( = ?auto_185795 ?auto_185800 ) ) ( not ( = ?auto_185795 ?auto_185801 ) ) ( not ( = ?auto_185795 ?auto_185802 ) ) ( not ( = ?auto_185796 ?auto_185797 ) ) ( not ( = ?auto_185796 ?auto_185798 ) ) ( not ( = ?auto_185796 ?auto_185799 ) ) ( not ( = ?auto_185796 ?auto_185800 ) ) ( not ( = ?auto_185796 ?auto_185801 ) ) ( not ( = ?auto_185796 ?auto_185802 ) ) ( not ( = ?auto_185797 ?auto_185798 ) ) ( not ( = ?auto_185797 ?auto_185799 ) ) ( not ( = ?auto_185797 ?auto_185800 ) ) ( not ( = ?auto_185797 ?auto_185801 ) ) ( not ( = ?auto_185797 ?auto_185802 ) ) ( not ( = ?auto_185798 ?auto_185799 ) ) ( not ( = ?auto_185798 ?auto_185800 ) ) ( not ( = ?auto_185798 ?auto_185801 ) ) ( not ( = ?auto_185798 ?auto_185802 ) ) ( not ( = ?auto_185799 ?auto_185800 ) ) ( not ( = ?auto_185799 ?auto_185801 ) ) ( not ( = ?auto_185799 ?auto_185802 ) ) ( not ( = ?auto_185800 ?auto_185801 ) ) ( not ( = ?auto_185800 ?auto_185802 ) ) ( not ( = ?auto_185801 ?auto_185802 ) ) ( ON ?auto_185800 ?auto_185801 ) ( ON ?auto_185799 ?auto_185800 ) ( ON ?auto_185798 ?auto_185799 ) ( ON ?auto_185797 ?auto_185798 ) ( ON ?auto_185796 ?auto_185797 ) ( CLEAR ?auto_185794 ) ( ON ?auto_185795 ?auto_185796 ) ( CLEAR ?auto_185795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185790 ?auto_185791 ?auto_185792 ?auto_185793 ?auto_185794 ?auto_185795 )
      ( MAKE-12PILE ?auto_185790 ?auto_185791 ?auto_185792 ?auto_185793 ?auto_185794 ?auto_185795 ?auto_185796 ?auto_185797 ?auto_185798 ?auto_185799 ?auto_185800 ?auto_185801 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_185815 - BLOCK
      ?auto_185816 - BLOCK
      ?auto_185817 - BLOCK
      ?auto_185818 - BLOCK
      ?auto_185819 - BLOCK
      ?auto_185820 - BLOCK
      ?auto_185821 - BLOCK
      ?auto_185822 - BLOCK
      ?auto_185823 - BLOCK
      ?auto_185824 - BLOCK
      ?auto_185825 - BLOCK
      ?auto_185826 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185826 ) ( ON-TABLE ?auto_185815 ) ( ON ?auto_185816 ?auto_185815 ) ( ON ?auto_185817 ?auto_185816 ) ( ON ?auto_185818 ?auto_185817 ) ( ON ?auto_185819 ?auto_185818 ) ( not ( = ?auto_185815 ?auto_185816 ) ) ( not ( = ?auto_185815 ?auto_185817 ) ) ( not ( = ?auto_185815 ?auto_185818 ) ) ( not ( = ?auto_185815 ?auto_185819 ) ) ( not ( = ?auto_185815 ?auto_185820 ) ) ( not ( = ?auto_185815 ?auto_185821 ) ) ( not ( = ?auto_185815 ?auto_185822 ) ) ( not ( = ?auto_185815 ?auto_185823 ) ) ( not ( = ?auto_185815 ?auto_185824 ) ) ( not ( = ?auto_185815 ?auto_185825 ) ) ( not ( = ?auto_185815 ?auto_185826 ) ) ( not ( = ?auto_185816 ?auto_185817 ) ) ( not ( = ?auto_185816 ?auto_185818 ) ) ( not ( = ?auto_185816 ?auto_185819 ) ) ( not ( = ?auto_185816 ?auto_185820 ) ) ( not ( = ?auto_185816 ?auto_185821 ) ) ( not ( = ?auto_185816 ?auto_185822 ) ) ( not ( = ?auto_185816 ?auto_185823 ) ) ( not ( = ?auto_185816 ?auto_185824 ) ) ( not ( = ?auto_185816 ?auto_185825 ) ) ( not ( = ?auto_185816 ?auto_185826 ) ) ( not ( = ?auto_185817 ?auto_185818 ) ) ( not ( = ?auto_185817 ?auto_185819 ) ) ( not ( = ?auto_185817 ?auto_185820 ) ) ( not ( = ?auto_185817 ?auto_185821 ) ) ( not ( = ?auto_185817 ?auto_185822 ) ) ( not ( = ?auto_185817 ?auto_185823 ) ) ( not ( = ?auto_185817 ?auto_185824 ) ) ( not ( = ?auto_185817 ?auto_185825 ) ) ( not ( = ?auto_185817 ?auto_185826 ) ) ( not ( = ?auto_185818 ?auto_185819 ) ) ( not ( = ?auto_185818 ?auto_185820 ) ) ( not ( = ?auto_185818 ?auto_185821 ) ) ( not ( = ?auto_185818 ?auto_185822 ) ) ( not ( = ?auto_185818 ?auto_185823 ) ) ( not ( = ?auto_185818 ?auto_185824 ) ) ( not ( = ?auto_185818 ?auto_185825 ) ) ( not ( = ?auto_185818 ?auto_185826 ) ) ( not ( = ?auto_185819 ?auto_185820 ) ) ( not ( = ?auto_185819 ?auto_185821 ) ) ( not ( = ?auto_185819 ?auto_185822 ) ) ( not ( = ?auto_185819 ?auto_185823 ) ) ( not ( = ?auto_185819 ?auto_185824 ) ) ( not ( = ?auto_185819 ?auto_185825 ) ) ( not ( = ?auto_185819 ?auto_185826 ) ) ( not ( = ?auto_185820 ?auto_185821 ) ) ( not ( = ?auto_185820 ?auto_185822 ) ) ( not ( = ?auto_185820 ?auto_185823 ) ) ( not ( = ?auto_185820 ?auto_185824 ) ) ( not ( = ?auto_185820 ?auto_185825 ) ) ( not ( = ?auto_185820 ?auto_185826 ) ) ( not ( = ?auto_185821 ?auto_185822 ) ) ( not ( = ?auto_185821 ?auto_185823 ) ) ( not ( = ?auto_185821 ?auto_185824 ) ) ( not ( = ?auto_185821 ?auto_185825 ) ) ( not ( = ?auto_185821 ?auto_185826 ) ) ( not ( = ?auto_185822 ?auto_185823 ) ) ( not ( = ?auto_185822 ?auto_185824 ) ) ( not ( = ?auto_185822 ?auto_185825 ) ) ( not ( = ?auto_185822 ?auto_185826 ) ) ( not ( = ?auto_185823 ?auto_185824 ) ) ( not ( = ?auto_185823 ?auto_185825 ) ) ( not ( = ?auto_185823 ?auto_185826 ) ) ( not ( = ?auto_185824 ?auto_185825 ) ) ( not ( = ?auto_185824 ?auto_185826 ) ) ( not ( = ?auto_185825 ?auto_185826 ) ) ( ON ?auto_185825 ?auto_185826 ) ( ON ?auto_185824 ?auto_185825 ) ( ON ?auto_185823 ?auto_185824 ) ( ON ?auto_185822 ?auto_185823 ) ( ON ?auto_185821 ?auto_185822 ) ( CLEAR ?auto_185819 ) ( ON ?auto_185820 ?auto_185821 ) ( CLEAR ?auto_185820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185815 ?auto_185816 ?auto_185817 ?auto_185818 ?auto_185819 ?auto_185820 )
      ( MAKE-12PILE ?auto_185815 ?auto_185816 ?auto_185817 ?auto_185818 ?auto_185819 ?auto_185820 ?auto_185821 ?auto_185822 ?auto_185823 ?auto_185824 ?auto_185825 ?auto_185826 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_185839 - BLOCK
      ?auto_185840 - BLOCK
      ?auto_185841 - BLOCK
      ?auto_185842 - BLOCK
      ?auto_185843 - BLOCK
      ?auto_185844 - BLOCK
      ?auto_185845 - BLOCK
      ?auto_185846 - BLOCK
      ?auto_185847 - BLOCK
      ?auto_185848 - BLOCK
      ?auto_185849 - BLOCK
      ?auto_185850 - BLOCK
    )
    :vars
    (
      ?auto_185851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185850 ?auto_185851 ) ( ON-TABLE ?auto_185839 ) ( ON ?auto_185840 ?auto_185839 ) ( ON ?auto_185841 ?auto_185840 ) ( ON ?auto_185842 ?auto_185841 ) ( not ( = ?auto_185839 ?auto_185840 ) ) ( not ( = ?auto_185839 ?auto_185841 ) ) ( not ( = ?auto_185839 ?auto_185842 ) ) ( not ( = ?auto_185839 ?auto_185843 ) ) ( not ( = ?auto_185839 ?auto_185844 ) ) ( not ( = ?auto_185839 ?auto_185845 ) ) ( not ( = ?auto_185839 ?auto_185846 ) ) ( not ( = ?auto_185839 ?auto_185847 ) ) ( not ( = ?auto_185839 ?auto_185848 ) ) ( not ( = ?auto_185839 ?auto_185849 ) ) ( not ( = ?auto_185839 ?auto_185850 ) ) ( not ( = ?auto_185839 ?auto_185851 ) ) ( not ( = ?auto_185840 ?auto_185841 ) ) ( not ( = ?auto_185840 ?auto_185842 ) ) ( not ( = ?auto_185840 ?auto_185843 ) ) ( not ( = ?auto_185840 ?auto_185844 ) ) ( not ( = ?auto_185840 ?auto_185845 ) ) ( not ( = ?auto_185840 ?auto_185846 ) ) ( not ( = ?auto_185840 ?auto_185847 ) ) ( not ( = ?auto_185840 ?auto_185848 ) ) ( not ( = ?auto_185840 ?auto_185849 ) ) ( not ( = ?auto_185840 ?auto_185850 ) ) ( not ( = ?auto_185840 ?auto_185851 ) ) ( not ( = ?auto_185841 ?auto_185842 ) ) ( not ( = ?auto_185841 ?auto_185843 ) ) ( not ( = ?auto_185841 ?auto_185844 ) ) ( not ( = ?auto_185841 ?auto_185845 ) ) ( not ( = ?auto_185841 ?auto_185846 ) ) ( not ( = ?auto_185841 ?auto_185847 ) ) ( not ( = ?auto_185841 ?auto_185848 ) ) ( not ( = ?auto_185841 ?auto_185849 ) ) ( not ( = ?auto_185841 ?auto_185850 ) ) ( not ( = ?auto_185841 ?auto_185851 ) ) ( not ( = ?auto_185842 ?auto_185843 ) ) ( not ( = ?auto_185842 ?auto_185844 ) ) ( not ( = ?auto_185842 ?auto_185845 ) ) ( not ( = ?auto_185842 ?auto_185846 ) ) ( not ( = ?auto_185842 ?auto_185847 ) ) ( not ( = ?auto_185842 ?auto_185848 ) ) ( not ( = ?auto_185842 ?auto_185849 ) ) ( not ( = ?auto_185842 ?auto_185850 ) ) ( not ( = ?auto_185842 ?auto_185851 ) ) ( not ( = ?auto_185843 ?auto_185844 ) ) ( not ( = ?auto_185843 ?auto_185845 ) ) ( not ( = ?auto_185843 ?auto_185846 ) ) ( not ( = ?auto_185843 ?auto_185847 ) ) ( not ( = ?auto_185843 ?auto_185848 ) ) ( not ( = ?auto_185843 ?auto_185849 ) ) ( not ( = ?auto_185843 ?auto_185850 ) ) ( not ( = ?auto_185843 ?auto_185851 ) ) ( not ( = ?auto_185844 ?auto_185845 ) ) ( not ( = ?auto_185844 ?auto_185846 ) ) ( not ( = ?auto_185844 ?auto_185847 ) ) ( not ( = ?auto_185844 ?auto_185848 ) ) ( not ( = ?auto_185844 ?auto_185849 ) ) ( not ( = ?auto_185844 ?auto_185850 ) ) ( not ( = ?auto_185844 ?auto_185851 ) ) ( not ( = ?auto_185845 ?auto_185846 ) ) ( not ( = ?auto_185845 ?auto_185847 ) ) ( not ( = ?auto_185845 ?auto_185848 ) ) ( not ( = ?auto_185845 ?auto_185849 ) ) ( not ( = ?auto_185845 ?auto_185850 ) ) ( not ( = ?auto_185845 ?auto_185851 ) ) ( not ( = ?auto_185846 ?auto_185847 ) ) ( not ( = ?auto_185846 ?auto_185848 ) ) ( not ( = ?auto_185846 ?auto_185849 ) ) ( not ( = ?auto_185846 ?auto_185850 ) ) ( not ( = ?auto_185846 ?auto_185851 ) ) ( not ( = ?auto_185847 ?auto_185848 ) ) ( not ( = ?auto_185847 ?auto_185849 ) ) ( not ( = ?auto_185847 ?auto_185850 ) ) ( not ( = ?auto_185847 ?auto_185851 ) ) ( not ( = ?auto_185848 ?auto_185849 ) ) ( not ( = ?auto_185848 ?auto_185850 ) ) ( not ( = ?auto_185848 ?auto_185851 ) ) ( not ( = ?auto_185849 ?auto_185850 ) ) ( not ( = ?auto_185849 ?auto_185851 ) ) ( not ( = ?auto_185850 ?auto_185851 ) ) ( ON ?auto_185849 ?auto_185850 ) ( ON ?auto_185848 ?auto_185849 ) ( ON ?auto_185847 ?auto_185848 ) ( ON ?auto_185846 ?auto_185847 ) ( ON ?auto_185845 ?auto_185846 ) ( ON ?auto_185844 ?auto_185845 ) ( CLEAR ?auto_185842 ) ( ON ?auto_185843 ?auto_185844 ) ( CLEAR ?auto_185843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185839 ?auto_185840 ?auto_185841 ?auto_185842 ?auto_185843 )
      ( MAKE-12PILE ?auto_185839 ?auto_185840 ?auto_185841 ?auto_185842 ?auto_185843 ?auto_185844 ?auto_185845 ?auto_185846 ?auto_185847 ?auto_185848 ?auto_185849 ?auto_185850 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_185864 - BLOCK
      ?auto_185865 - BLOCK
      ?auto_185866 - BLOCK
      ?auto_185867 - BLOCK
      ?auto_185868 - BLOCK
      ?auto_185869 - BLOCK
      ?auto_185870 - BLOCK
      ?auto_185871 - BLOCK
      ?auto_185872 - BLOCK
      ?auto_185873 - BLOCK
      ?auto_185874 - BLOCK
      ?auto_185875 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185875 ) ( ON-TABLE ?auto_185864 ) ( ON ?auto_185865 ?auto_185864 ) ( ON ?auto_185866 ?auto_185865 ) ( ON ?auto_185867 ?auto_185866 ) ( not ( = ?auto_185864 ?auto_185865 ) ) ( not ( = ?auto_185864 ?auto_185866 ) ) ( not ( = ?auto_185864 ?auto_185867 ) ) ( not ( = ?auto_185864 ?auto_185868 ) ) ( not ( = ?auto_185864 ?auto_185869 ) ) ( not ( = ?auto_185864 ?auto_185870 ) ) ( not ( = ?auto_185864 ?auto_185871 ) ) ( not ( = ?auto_185864 ?auto_185872 ) ) ( not ( = ?auto_185864 ?auto_185873 ) ) ( not ( = ?auto_185864 ?auto_185874 ) ) ( not ( = ?auto_185864 ?auto_185875 ) ) ( not ( = ?auto_185865 ?auto_185866 ) ) ( not ( = ?auto_185865 ?auto_185867 ) ) ( not ( = ?auto_185865 ?auto_185868 ) ) ( not ( = ?auto_185865 ?auto_185869 ) ) ( not ( = ?auto_185865 ?auto_185870 ) ) ( not ( = ?auto_185865 ?auto_185871 ) ) ( not ( = ?auto_185865 ?auto_185872 ) ) ( not ( = ?auto_185865 ?auto_185873 ) ) ( not ( = ?auto_185865 ?auto_185874 ) ) ( not ( = ?auto_185865 ?auto_185875 ) ) ( not ( = ?auto_185866 ?auto_185867 ) ) ( not ( = ?auto_185866 ?auto_185868 ) ) ( not ( = ?auto_185866 ?auto_185869 ) ) ( not ( = ?auto_185866 ?auto_185870 ) ) ( not ( = ?auto_185866 ?auto_185871 ) ) ( not ( = ?auto_185866 ?auto_185872 ) ) ( not ( = ?auto_185866 ?auto_185873 ) ) ( not ( = ?auto_185866 ?auto_185874 ) ) ( not ( = ?auto_185866 ?auto_185875 ) ) ( not ( = ?auto_185867 ?auto_185868 ) ) ( not ( = ?auto_185867 ?auto_185869 ) ) ( not ( = ?auto_185867 ?auto_185870 ) ) ( not ( = ?auto_185867 ?auto_185871 ) ) ( not ( = ?auto_185867 ?auto_185872 ) ) ( not ( = ?auto_185867 ?auto_185873 ) ) ( not ( = ?auto_185867 ?auto_185874 ) ) ( not ( = ?auto_185867 ?auto_185875 ) ) ( not ( = ?auto_185868 ?auto_185869 ) ) ( not ( = ?auto_185868 ?auto_185870 ) ) ( not ( = ?auto_185868 ?auto_185871 ) ) ( not ( = ?auto_185868 ?auto_185872 ) ) ( not ( = ?auto_185868 ?auto_185873 ) ) ( not ( = ?auto_185868 ?auto_185874 ) ) ( not ( = ?auto_185868 ?auto_185875 ) ) ( not ( = ?auto_185869 ?auto_185870 ) ) ( not ( = ?auto_185869 ?auto_185871 ) ) ( not ( = ?auto_185869 ?auto_185872 ) ) ( not ( = ?auto_185869 ?auto_185873 ) ) ( not ( = ?auto_185869 ?auto_185874 ) ) ( not ( = ?auto_185869 ?auto_185875 ) ) ( not ( = ?auto_185870 ?auto_185871 ) ) ( not ( = ?auto_185870 ?auto_185872 ) ) ( not ( = ?auto_185870 ?auto_185873 ) ) ( not ( = ?auto_185870 ?auto_185874 ) ) ( not ( = ?auto_185870 ?auto_185875 ) ) ( not ( = ?auto_185871 ?auto_185872 ) ) ( not ( = ?auto_185871 ?auto_185873 ) ) ( not ( = ?auto_185871 ?auto_185874 ) ) ( not ( = ?auto_185871 ?auto_185875 ) ) ( not ( = ?auto_185872 ?auto_185873 ) ) ( not ( = ?auto_185872 ?auto_185874 ) ) ( not ( = ?auto_185872 ?auto_185875 ) ) ( not ( = ?auto_185873 ?auto_185874 ) ) ( not ( = ?auto_185873 ?auto_185875 ) ) ( not ( = ?auto_185874 ?auto_185875 ) ) ( ON ?auto_185874 ?auto_185875 ) ( ON ?auto_185873 ?auto_185874 ) ( ON ?auto_185872 ?auto_185873 ) ( ON ?auto_185871 ?auto_185872 ) ( ON ?auto_185870 ?auto_185871 ) ( ON ?auto_185869 ?auto_185870 ) ( CLEAR ?auto_185867 ) ( ON ?auto_185868 ?auto_185869 ) ( CLEAR ?auto_185868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185864 ?auto_185865 ?auto_185866 ?auto_185867 ?auto_185868 )
      ( MAKE-12PILE ?auto_185864 ?auto_185865 ?auto_185866 ?auto_185867 ?auto_185868 ?auto_185869 ?auto_185870 ?auto_185871 ?auto_185872 ?auto_185873 ?auto_185874 ?auto_185875 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_185888 - BLOCK
      ?auto_185889 - BLOCK
      ?auto_185890 - BLOCK
      ?auto_185891 - BLOCK
      ?auto_185892 - BLOCK
      ?auto_185893 - BLOCK
      ?auto_185894 - BLOCK
      ?auto_185895 - BLOCK
      ?auto_185896 - BLOCK
      ?auto_185897 - BLOCK
      ?auto_185898 - BLOCK
      ?auto_185899 - BLOCK
    )
    :vars
    (
      ?auto_185900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185899 ?auto_185900 ) ( ON-TABLE ?auto_185888 ) ( ON ?auto_185889 ?auto_185888 ) ( ON ?auto_185890 ?auto_185889 ) ( not ( = ?auto_185888 ?auto_185889 ) ) ( not ( = ?auto_185888 ?auto_185890 ) ) ( not ( = ?auto_185888 ?auto_185891 ) ) ( not ( = ?auto_185888 ?auto_185892 ) ) ( not ( = ?auto_185888 ?auto_185893 ) ) ( not ( = ?auto_185888 ?auto_185894 ) ) ( not ( = ?auto_185888 ?auto_185895 ) ) ( not ( = ?auto_185888 ?auto_185896 ) ) ( not ( = ?auto_185888 ?auto_185897 ) ) ( not ( = ?auto_185888 ?auto_185898 ) ) ( not ( = ?auto_185888 ?auto_185899 ) ) ( not ( = ?auto_185888 ?auto_185900 ) ) ( not ( = ?auto_185889 ?auto_185890 ) ) ( not ( = ?auto_185889 ?auto_185891 ) ) ( not ( = ?auto_185889 ?auto_185892 ) ) ( not ( = ?auto_185889 ?auto_185893 ) ) ( not ( = ?auto_185889 ?auto_185894 ) ) ( not ( = ?auto_185889 ?auto_185895 ) ) ( not ( = ?auto_185889 ?auto_185896 ) ) ( not ( = ?auto_185889 ?auto_185897 ) ) ( not ( = ?auto_185889 ?auto_185898 ) ) ( not ( = ?auto_185889 ?auto_185899 ) ) ( not ( = ?auto_185889 ?auto_185900 ) ) ( not ( = ?auto_185890 ?auto_185891 ) ) ( not ( = ?auto_185890 ?auto_185892 ) ) ( not ( = ?auto_185890 ?auto_185893 ) ) ( not ( = ?auto_185890 ?auto_185894 ) ) ( not ( = ?auto_185890 ?auto_185895 ) ) ( not ( = ?auto_185890 ?auto_185896 ) ) ( not ( = ?auto_185890 ?auto_185897 ) ) ( not ( = ?auto_185890 ?auto_185898 ) ) ( not ( = ?auto_185890 ?auto_185899 ) ) ( not ( = ?auto_185890 ?auto_185900 ) ) ( not ( = ?auto_185891 ?auto_185892 ) ) ( not ( = ?auto_185891 ?auto_185893 ) ) ( not ( = ?auto_185891 ?auto_185894 ) ) ( not ( = ?auto_185891 ?auto_185895 ) ) ( not ( = ?auto_185891 ?auto_185896 ) ) ( not ( = ?auto_185891 ?auto_185897 ) ) ( not ( = ?auto_185891 ?auto_185898 ) ) ( not ( = ?auto_185891 ?auto_185899 ) ) ( not ( = ?auto_185891 ?auto_185900 ) ) ( not ( = ?auto_185892 ?auto_185893 ) ) ( not ( = ?auto_185892 ?auto_185894 ) ) ( not ( = ?auto_185892 ?auto_185895 ) ) ( not ( = ?auto_185892 ?auto_185896 ) ) ( not ( = ?auto_185892 ?auto_185897 ) ) ( not ( = ?auto_185892 ?auto_185898 ) ) ( not ( = ?auto_185892 ?auto_185899 ) ) ( not ( = ?auto_185892 ?auto_185900 ) ) ( not ( = ?auto_185893 ?auto_185894 ) ) ( not ( = ?auto_185893 ?auto_185895 ) ) ( not ( = ?auto_185893 ?auto_185896 ) ) ( not ( = ?auto_185893 ?auto_185897 ) ) ( not ( = ?auto_185893 ?auto_185898 ) ) ( not ( = ?auto_185893 ?auto_185899 ) ) ( not ( = ?auto_185893 ?auto_185900 ) ) ( not ( = ?auto_185894 ?auto_185895 ) ) ( not ( = ?auto_185894 ?auto_185896 ) ) ( not ( = ?auto_185894 ?auto_185897 ) ) ( not ( = ?auto_185894 ?auto_185898 ) ) ( not ( = ?auto_185894 ?auto_185899 ) ) ( not ( = ?auto_185894 ?auto_185900 ) ) ( not ( = ?auto_185895 ?auto_185896 ) ) ( not ( = ?auto_185895 ?auto_185897 ) ) ( not ( = ?auto_185895 ?auto_185898 ) ) ( not ( = ?auto_185895 ?auto_185899 ) ) ( not ( = ?auto_185895 ?auto_185900 ) ) ( not ( = ?auto_185896 ?auto_185897 ) ) ( not ( = ?auto_185896 ?auto_185898 ) ) ( not ( = ?auto_185896 ?auto_185899 ) ) ( not ( = ?auto_185896 ?auto_185900 ) ) ( not ( = ?auto_185897 ?auto_185898 ) ) ( not ( = ?auto_185897 ?auto_185899 ) ) ( not ( = ?auto_185897 ?auto_185900 ) ) ( not ( = ?auto_185898 ?auto_185899 ) ) ( not ( = ?auto_185898 ?auto_185900 ) ) ( not ( = ?auto_185899 ?auto_185900 ) ) ( ON ?auto_185898 ?auto_185899 ) ( ON ?auto_185897 ?auto_185898 ) ( ON ?auto_185896 ?auto_185897 ) ( ON ?auto_185895 ?auto_185896 ) ( ON ?auto_185894 ?auto_185895 ) ( ON ?auto_185893 ?auto_185894 ) ( ON ?auto_185892 ?auto_185893 ) ( CLEAR ?auto_185890 ) ( ON ?auto_185891 ?auto_185892 ) ( CLEAR ?auto_185891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_185888 ?auto_185889 ?auto_185890 ?auto_185891 )
      ( MAKE-12PILE ?auto_185888 ?auto_185889 ?auto_185890 ?auto_185891 ?auto_185892 ?auto_185893 ?auto_185894 ?auto_185895 ?auto_185896 ?auto_185897 ?auto_185898 ?auto_185899 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_185913 - BLOCK
      ?auto_185914 - BLOCK
      ?auto_185915 - BLOCK
      ?auto_185916 - BLOCK
      ?auto_185917 - BLOCK
      ?auto_185918 - BLOCK
      ?auto_185919 - BLOCK
      ?auto_185920 - BLOCK
      ?auto_185921 - BLOCK
      ?auto_185922 - BLOCK
      ?auto_185923 - BLOCK
      ?auto_185924 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185924 ) ( ON-TABLE ?auto_185913 ) ( ON ?auto_185914 ?auto_185913 ) ( ON ?auto_185915 ?auto_185914 ) ( not ( = ?auto_185913 ?auto_185914 ) ) ( not ( = ?auto_185913 ?auto_185915 ) ) ( not ( = ?auto_185913 ?auto_185916 ) ) ( not ( = ?auto_185913 ?auto_185917 ) ) ( not ( = ?auto_185913 ?auto_185918 ) ) ( not ( = ?auto_185913 ?auto_185919 ) ) ( not ( = ?auto_185913 ?auto_185920 ) ) ( not ( = ?auto_185913 ?auto_185921 ) ) ( not ( = ?auto_185913 ?auto_185922 ) ) ( not ( = ?auto_185913 ?auto_185923 ) ) ( not ( = ?auto_185913 ?auto_185924 ) ) ( not ( = ?auto_185914 ?auto_185915 ) ) ( not ( = ?auto_185914 ?auto_185916 ) ) ( not ( = ?auto_185914 ?auto_185917 ) ) ( not ( = ?auto_185914 ?auto_185918 ) ) ( not ( = ?auto_185914 ?auto_185919 ) ) ( not ( = ?auto_185914 ?auto_185920 ) ) ( not ( = ?auto_185914 ?auto_185921 ) ) ( not ( = ?auto_185914 ?auto_185922 ) ) ( not ( = ?auto_185914 ?auto_185923 ) ) ( not ( = ?auto_185914 ?auto_185924 ) ) ( not ( = ?auto_185915 ?auto_185916 ) ) ( not ( = ?auto_185915 ?auto_185917 ) ) ( not ( = ?auto_185915 ?auto_185918 ) ) ( not ( = ?auto_185915 ?auto_185919 ) ) ( not ( = ?auto_185915 ?auto_185920 ) ) ( not ( = ?auto_185915 ?auto_185921 ) ) ( not ( = ?auto_185915 ?auto_185922 ) ) ( not ( = ?auto_185915 ?auto_185923 ) ) ( not ( = ?auto_185915 ?auto_185924 ) ) ( not ( = ?auto_185916 ?auto_185917 ) ) ( not ( = ?auto_185916 ?auto_185918 ) ) ( not ( = ?auto_185916 ?auto_185919 ) ) ( not ( = ?auto_185916 ?auto_185920 ) ) ( not ( = ?auto_185916 ?auto_185921 ) ) ( not ( = ?auto_185916 ?auto_185922 ) ) ( not ( = ?auto_185916 ?auto_185923 ) ) ( not ( = ?auto_185916 ?auto_185924 ) ) ( not ( = ?auto_185917 ?auto_185918 ) ) ( not ( = ?auto_185917 ?auto_185919 ) ) ( not ( = ?auto_185917 ?auto_185920 ) ) ( not ( = ?auto_185917 ?auto_185921 ) ) ( not ( = ?auto_185917 ?auto_185922 ) ) ( not ( = ?auto_185917 ?auto_185923 ) ) ( not ( = ?auto_185917 ?auto_185924 ) ) ( not ( = ?auto_185918 ?auto_185919 ) ) ( not ( = ?auto_185918 ?auto_185920 ) ) ( not ( = ?auto_185918 ?auto_185921 ) ) ( not ( = ?auto_185918 ?auto_185922 ) ) ( not ( = ?auto_185918 ?auto_185923 ) ) ( not ( = ?auto_185918 ?auto_185924 ) ) ( not ( = ?auto_185919 ?auto_185920 ) ) ( not ( = ?auto_185919 ?auto_185921 ) ) ( not ( = ?auto_185919 ?auto_185922 ) ) ( not ( = ?auto_185919 ?auto_185923 ) ) ( not ( = ?auto_185919 ?auto_185924 ) ) ( not ( = ?auto_185920 ?auto_185921 ) ) ( not ( = ?auto_185920 ?auto_185922 ) ) ( not ( = ?auto_185920 ?auto_185923 ) ) ( not ( = ?auto_185920 ?auto_185924 ) ) ( not ( = ?auto_185921 ?auto_185922 ) ) ( not ( = ?auto_185921 ?auto_185923 ) ) ( not ( = ?auto_185921 ?auto_185924 ) ) ( not ( = ?auto_185922 ?auto_185923 ) ) ( not ( = ?auto_185922 ?auto_185924 ) ) ( not ( = ?auto_185923 ?auto_185924 ) ) ( ON ?auto_185923 ?auto_185924 ) ( ON ?auto_185922 ?auto_185923 ) ( ON ?auto_185921 ?auto_185922 ) ( ON ?auto_185920 ?auto_185921 ) ( ON ?auto_185919 ?auto_185920 ) ( ON ?auto_185918 ?auto_185919 ) ( ON ?auto_185917 ?auto_185918 ) ( CLEAR ?auto_185915 ) ( ON ?auto_185916 ?auto_185917 ) ( CLEAR ?auto_185916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_185913 ?auto_185914 ?auto_185915 ?auto_185916 )
      ( MAKE-12PILE ?auto_185913 ?auto_185914 ?auto_185915 ?auto_185916 ?auto_185917 ?auto_185918 ?auto_185919 ?auto_185920 ?auto_185921 ?auto_185922 ?auto_185923 ?auto_185924 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_185937 - BLOCK
      ?auto_185938 - BLOCK
      ?auto_185939 - BLOCK
      ?auto_185940 - BLOCK
      ?auto_185941 - BLOCK
      ?auto_185942 - BLOCK
      ?auto_185943 - BLOCK
      ?auto_185944 - BLOCK
      ?auto_185945 - BLOCK
      ?auto_185946 - BLOCK
      ?auto_185947 - BLOCK
      ?auto_185948 - BLOCK
    )
    :vars
    (
      ?auto_185949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185948 ?auto_185949 ) ( ON-TABLE ?auto_185937 ) ( ON ?auto_185938 ?auto_185937 ) ( not ( = ?auto_185937 ?auto_185938 ) ) ( not ( = ?auto_185937 ?auto_185939 ) ) ( not ( = ?auto_185937 ?auto_185940 ) ) ( not ( = ?auto_185937 ?auto_185941 ) ) ( not ( = ?auto_185937 ?auto_185942 ) ) ( not ( = ?auto_185937 ?auto_185943 ) ) ( not ( = ?auto_185937 ?auto_185944 ) ) ( not ( = ?auto_185937 ?auto_185945 ) ) ( not ( = ?auto_185937 ?auto_185946 ) ) ( not ( = ?auto_185937 ?auto_185947 ) ) ( not ( = ?auto_185937 ?auto_185948 ) ) ( not ( = ?auto_185937 ?auto_185949 ) ) ( not ( = ?auto_185938 ?auto_185939 ) ) ( not ( = ?auto_185938 ?auto_185940 ) ) ( not ( = ?auto_185938 ?auto_185941 ) ) ( not ( = ?auto_185938 ?auto_185942 ) ) ( not ( = ?auto_185938 ?auto_185943 ) ) ( not ( = ?auto_185938 ?auto_185944 ) ) ( not ( = ?auto_185938 ?auto_185945 ) ) ( not ( = ?auto_185938 ?auto_185946 ) ) ( not ( = ?auto_185938 ?auto_185947 ) ) ( not ( = ?auto_185938 ?auto_185948 ) ) ( not ( = ?auto_185938 ?auto_185949 ) ) ( not ( = ?auto_185939 ?auto_185940 ) ) ( not ( = ?auto_185939 ?auto_185941 ) ) ( not ( = ?auto_185939 ?auto_185942 ) ) ( not ( = ?auto_185939 ?auto_185943 ) ) ( not ( = ?auto_185939 ?auto_185944 ) ) ( not ( = ?auto_185939 ?auto_185945 ) ) ( not ( = ?auto_185939 ?auto_185946 ) ) ( not ( = ?auto_185939 ?auto_185947 ) ) ( not ( = ?auto_185939 ?auto_185948 ) ) ( not ( = ?auto_185939 ?auto_185949 ) ) ( not ( = ?auto_185940 ?auto_185941 ) ) ( not ( = ?auto_185940 ?auto_185942 ) ) ( not ( = ?auto_185940 ?auto_185943 ) ) ( not ( = ?auto_185940 ?auto_185944 ) ) ( not ( = ?auto_185940 ?auto_185945 ) ) ( not ( = ?auto_185940 ?auto_185946 ) ) ( not ( = ?auto_185940 ?auto_185947 ) ) ( not ( = ?auto_185940 ?auto_185948 ) ) ( not ( = ?auto_185940 ?auto_185949 ) ) ( not ( = ?auto_185941 ?auto_185942 ) ) ( not ( = ?auto_185941 ?auto_185943 ) ) ( not ( = ?auto_185941 ?auto_185944 ) ) ( not ( = ?auto_185941 ?auto_185945 ) ) ( not ( = ?auto_185941 ?auto_185946 ) ) ( not ( = ?auto_185941 ?auto_185947 ) ) ( not ( = ?auto_185941 ?auto_185948 ) ) ( not ( = ?auto_185941 ?auto_185949 ) ) ( not ( = ?auto_185942 ?auto_185943 ) ) ( not ( = ?auto_185942 ?auto_185944 ) ) ( not ( = ?auto_185942 ?auto_185945 ) ) ( not ( = ?auto_185942 ?auto_185946 ) ) ( not ( = ?auto_185942 ?auto_185947 ) ) ( not ( = ?auto_185942 ?auto_185948 ) ) ( not ( = ?auto_185942 ?auto_185949 ) ) ( not ( = ?auto_185943 ?auto_185944 ) ) ( not ( = ?auto_185943 ?auto_185945 ) ) ( not ( = ?auto_185943 ?auto_185946 ) ) ( not ( = ?auto_185943 ?auto_185947 ) ) ( not ( = ?auto_185943 ?auto_185948 ) ) ( not ( = ?auto_185943 ?auto_185949 ) ) ( not ( = ?auto_185944 ?auto_185945 ) ) ( not ( = ?auto_185944 ?auto_185946 ) ) ( not ( = ?auto_185944 ?auto_185947 ) ) ( not ( = ?auto_185944 ?auto_185948 ) ) ( not ( = ?auto_185944 ?auto_185949 ) ) ( not ( = ?auto_185945 ?auto_185946 ) ) ( not ( = ?auto_185945 ?auto_185947 ) ) ( not ( = ?auto_185945 ?auto_185948 ) ) ( not ( = ?auto_185945 ?auto_185949 ) ) ( not ( = ?auto_185946 ?auto_185947 ) ) ( not ( = ?auto_185946 ?auto_185948 ) ) ( not ( = ?auto_185946 ?auto_185949 ) ) ( not ( = ?auto_185947 ?auto_185948 ) ) ( not ( = ?auto_185947 ?auto_185949 ) ) ( not ( = ?auto_185948 ?auto_185949 ) ) ( ON ?auto_185947 ?auto_185948 ) ( ON ?auto_185946 ?auto_185947 ) ( ON ?auto_185945 ?auto_185946 ) ( ON ?auto_185944 ?auto_185945 ) ( ON ?auto_185943 ?auto_185944 ) ( ON ?auto_185942 ?auto_185943 ) ( ON ?auto_185941 ?auto_185942 ) ( ON ?auto_185940 ?auto_185941 ) ( CLEAR ?auto_185938 ) ( ON ?auto_185939 ?auto_185940 ) ( CLEAR ?auto_185939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_185937 ?auto_185938 ?auto_185939 )
      ( MAKE-12PILE ?auto_185937 ?auto_185938 ?auto_185939 ?auto_185940 ?auto_185941 ?auto_185942 ?auto_185943 ?auto_185944 ?auto_185945 ?auto_185946 ?auto_185947 ?auto_185948 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_185962 - BLOCK
      ?auto_185963 - BLOCK
      ?auto_185964 - BLOCK
      ?auto_185965 - BLOCK
      ?auto_185966 - BLOCK
      ?auto_185967 - BLOCK
      ?auto_185968 - BLOCK
      ?auto_185969 - BLOCK
      ?auto_185970 - BLOCK
      ?auto_185971 - BLOCK
      ?auto_185972 - BLOCK
      ?auto_185973 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185973 ) ( ON-TABLE ?auto_185962 ) ( ON ?auto_185963 ?auto_185962 ) ( not ( = ?auto_185962 ?auto_185963 ) ) ( not ( = ?auto_185962 ?auto_185964 ) ) ( not ( = ?auto_185962 ?auto_185965 ) ) ( not ( = ?auto_185962 ?auto_185966 ) ) ( not ( = ?auto_185962 ?auto_185967 ) ) ( not ( = ?auto_185962 ?auto_185968 ) ) ( not ( = ?auto_185962 ?auto_185969 ) ) ( not ( = ?auto_185962 ?auto_185970 ) ) ( not ( = ?auto_185962 ?auto_185971 ) ) ( not ( = ?auto_185962 ?auto_185972 ) ) ( not ( = ?auto_185962 ?auto_185973 ) ) ( not ( = ?auto_185963 ?auto_185964 ) ) ( not ( = ?auto_185963 ?auto_185965 ) ) ( not ( = ?auto_185963 ?auto_185966 ) ) ( not ( = ?auto_185963 ?auto_185967 ) ) ( not ( = ?auto_185963 ?auto_185968 ) ) ( not ( = ?auto_185963 ?auto_185969 ) ) ( not ( = ?auto_185963 ?auto_185970 ) ) ( not ( = ?auto_185963 ?auto_185971 ) ) ( not ( = ?auto_185963 ?auto_185972 ) ) ( not ( = ?auto_185963 ?auto_185973 ) ) ( not ( = ?auto_185964 ?auto_185965 ) ) ( not ( = ?auto_185964 ?auto_185966 ) ) ( not ( = ?auto_185964 ?auto_185967 ) ) ( not ( = ?auto_185964 ?auto_185968 ) ) ( not ( = ?auto_185964 ?auto_185969 ) ) ( not ( = ?auto_185964 ?auto_185970 ) ) ( not ( = ?auto_185964 ?auto_185971 ) ) ( not ( = ?auto_185964 ?auto_185972 ) ) ( not ( = ?auto_185964 ?auto_185973 ) ) ( not ( = ?auto_185965 ?auto_185966 ) ) ( not ( = ?auto_185965 ?auto_185967 ) ) ( not ( = ?auto_185965 ?auto_185968 ) ) ( not ( = ?auto_185965 ?auto_185969 ) ) ( not ( = ?auto_185965 ?auto_185970 ) ) ( not ( = ?auto_185965 ?auto_185971 ) ) ( not ( = ?auto_185965 ?auto_185972 ) ) ( not ( = ?auto_185965 ?auto_185973 ) ) ( not ( = ?auto_185966 ?auto_185967 ) ) ( not ( = ?auto_185966 ?auto_185968 ) ) ( not ( = ?auto_185966 ?auto_185969 ) ) ( not ( = ?auto_185966 ?auto_185970 ) ) ( not ( = ?auto_185966 ?auto_185971 ) ) ( not ( = ?auto_185966 ?auto_185972 ) ) ( not ( = ?auto_185966 ?auto_185973 ) ) ( not ( = ?auto_185967 ?auto_185968 ) ) ( not ( = ?auto_185967 ?auto_185969 ) ) ( not ( = ?auto_185967 ?auto_185970 ) ) ( not ( = ?auto_185967 ?auto_185971 ) ) ( not ( = ?auto_185967 ?auto_185972 ) ) ( not ( = ?auto_185967 ?auto_185973 ) ) ( not ( = ?auto_185968 ?auto_185969 ) ) ( not ( = ?auto_185968 ?auto_185970 ) ) ( not ( = ?auto_185968 ?auto_185971 ) ) ( not ( = ?auto_185968 ?auto_185972 ) ) ( not ( = ?auto_185968 ?auto_185973 ) ) ( not ( = ?auto_185969 ?auto_185970 ) ) ( not ( = ?auto_185969 ?auto_185971 ) ) ( not ( = ?auto_185969 ?auto_185972 ) ) ( not ( = ?auto_185969 ?auto_185973 ) ) ( not ( = ?auto_185970 ?auto_185971 ) ) ( not ( = ?auto_185970 ?auto_185972 ) ) ( not ( = ?auto_185970 ?auto_185973 ) ) ( not ( = ?auto_185971 ?auto_185972 ) ) ( not ( = ?auto_185971 ?auto_185973 ) ) ( not ( = ?auto_185972 ?auto_185973 ) ) ( ON ?auto_185972 ?auto_185973 ) ( ON ?auto_185971 ?auto_185972 ) ( ON ?auto_185970 ?auto_185971 ) ( ON ?auto_185969 ?auto_185970 ) ( ON ?auto_185968 ?auto_185969 ) ( ON ?auto_185967 ?auto_185968 ) ( ON ?auto_185966 ?auto_185967 ) ( ON ?auto_185965 ?auto_185966 ) ( CLEAR ?auto_185963 ) ( ON ?auto_185964 ?auto_185965 ) ( CLEAR ?auto_185964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_185962 ?auto_185963 ?auto_185964 )
      ( MAKE-12PILE ?auto_185962 ?auto_185963 ?auto_185964 ?auto_185965 ?auto_185966 ?auto_185967 ?auto_185968 ?auto_185969 ?auto_185970 ?auto_185971 ?auto_185972 ?auto_185973 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_185986 - BLOCK
      ?auto_185987 - BLOCK
      ?auto_185988 - BLOCK
      ?auto_185989 - BLOCK
      ?auto_185990 - BLOCK
      ?auto_185991 - BLOCK
      ?auto_185992 - BLOCK
      ?auto_185993 - BLOCK
      ?auto_185994 - BLOCK
      ?auto_185995 - BLOCK
      ?auto_185996 - BLOCK
      ?auto_185997 - BLOCK
    )
    :vars
    (
      ?auto_185998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185997 ?auto_185998 ) ( ON-TABLE ?auto_185986 ) ( not ( = ?auto_185986 ?auto_185987 ) ) ( not ( = ?auto_185986 ?auto_185988 ) ) ( not ( = ?auto_185986 ?auto_185989 ) ) ( not ( = ?auto_185986 ?auto_185990 ) ) ( not ( = ?auto_185986 ?auto_185991 ) ) ( not ( = ?auto_185986 ?auto_185992 ) ) ( not ( = ?auto_185986 ?auto_185993 ) ) ( not ( = ?auto_185986 ?auto_185994 ) ) ( not ( = ?auto_185986 ?auto_185995 ) ) ( not ( = ?auto_185986 ?auto_185996 ) ) ( not ( = ?auto_185986 ?auto_185997 ) ) ( not ( = ?auto_185986 ?auto_185998 ) ) ( not ( = ?auto_185987 ?auto_185988 ) ) ( not ( = ?auto_185987 ?auto_185989 ) ) ( not ( = ?auto_185987 ?auto_185990 ) ) ( not ( = ?auto_185987 ?auto_185991 ) ) ( not ( = ?auto_185987 ?auto_185992 ) ) ( not ( = ?auto_185987 ?auto_185993 ) ) ( not ( = ?auto_185987 ?auto_185994 ) ) ( not ( = ?auto_185987 ?auto_185995 ) ) ( not ( = ?auto_185987 ?auto_185996 ) ) ( not ( = ?auto_185987 ?auto_185997 ) ) ( not ( = ?auto_185987 ?auto_185998 ) ) ( not ( = ?auto_185988 ?auto_185989 ) ) ( not ( = ?auto_185988 ?auto_185990 ) ) ( not ( = ?auto_185988 ?auto_185991 ) ) ( not ( = ?auto_185988 ?auto_185992 ) ) ( not ( = ?auto_185988 ?auto_185993 ) ) ( not ( = ?auto_185988 ?auto_185994 ) ) ( not ( = ?auto_185988 ?auto_185995 ) ) ( not ( = ?auto_185988 ?auto_185996 ) ) ( not ( = ?auto_185988 ?auto_185997 ) ) ( not ( = ?auto_185988 ?auto_185998 ) ) ( not ( = ?auto_185989 ?auto_185990 ) ) ( not ( = ?auto_185989 ?auto_185991 ) ) ( not ( = ?auto_185989 ?auto_185992 ) ) ( not ( = ?auto_185989 ?auto_185993 ) ) ( not ( = ?auto_185989 ?auto_185994 ) ) ( not ( = ?auto_185989 ?auto_185995 ) ) ( not ( = ?auto_185989 ?auto_185996 ) ) ( not ( = ?auto_185989 ?auto_185997 ) ) ( not ( = ?auto_185989 ?auto_185998 ) ) ( not ( = ?auto_185990 ?auto_185991 ) ) ( not ( = ?auto_185990 ?auto_185992 ) ) ( not ( = ?auto_185990 ?auto_185993 ) ) ( not ( = ?auto_185990 ?auto_185994 ) ) ( not ( = ?auto_185990 ?auto_185995 ) ) ( not ( = ?auto_185990 ?auto_185996 ) ) ( not ( = ?auto_185990 ?auto_185997 ) ) ( not ( = ?auto_185990 ?auto_185998 ) ) ( not ( = ?auto_185991 ?auto_185992 ) ) ( not ( = ?auto_185991 ?auto_185993 ) ) ( not ( = ?auto_185991 ?auto_185994 ) ) ( not ( = ?auto_185991 ?auto_185995 ) ) ( not ( = ?auto_185991 ?auto_185996 ) ) ( not ( = ?auto_185991 ?auto_185997 ) ) ( not ( = ?auto_185991 ?auto_185998 ) ) ( not ( = ?auto_185992 ?auto_185993 ) ) ( not ( = ?auto_185992 ?auto_185994 ) ) ( not ( = ?auto_185992 ?auto_185995 ) ) ( not ( = ?auto_185992 ?auto_185996 ) ) ( not ( = ?auto_185992 ?auto_185997 ) ) ( not ( = ?auto_185992 ?auto_185998 ) ) ( not ( = ?auto_185993 ?auto_185994 ) ) ( not ( = ?auto_185993 ?auto_185995 ) ) ( not ( = ?auto_185993 ?auto_185996 ) ) ( not ( = ?auto_185993 ?auto_185997 ) ) ( not ( = ?auto_185993 ?auto_185998 ) ) ( not ( = ?auto_185994 ?auto_185995 ) ) ( not ( = ?auto_185994 ?auto_185996 ) ) ( not ( = ?auto_185994 ?auto_185997 ) ) ( not ( = ?auto_185994 ?auto_185998 ) ) ( not ( = ?auto_185995 ?auto_185996 ) ) ( not ( = ?auto_185995 ?auto_185997 ) ) ( not ( = ?auto_185995 ?auto_185998 ) ) ( not ( = ?auto_185996 ?auto_185997 ) ) ( not ( = ?auto_185996 ?auto_185998 ) ) ( not ( = ?auto_185997 ?auto_185998 ) ) ( ON ?auto_185996 ?auto_185997 ) ( ON ?auto_185995 ?auto_185996 ) ( ON ?auto_185994 ?auto_185995 ) ( ON ?auto_185993 ?auto_185994 ) ( ON ?auto_185992 ?auto_185993 ) ( ON ?auto_185991 ?auto_185992 ) ( ON ?auto_185990 ?auto_185991 ) ( ON ?auto_185989 ?auto_185990 ) ( ON ?auto_185988 ?auto_185989 ) ( CLEAR ?auto_185986 ) ( ON ?auto_185987 ?auto_185988 ) ( CLEAR ?auto_185987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_185986 ?auto_185987 )
      ( MAKE-12PILE ?auto_185986 ?auto_185987 ?auto_185988 ?auto_185989 ?auto_185990 ?auto_185991 ?auto_185992 ?auto_185993 ?auto_185994 ?auto_185995 ?auto_185996 ?auto_185997 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_186011 - BLOCK
      ?auto_186012 - BLOCK
      ?auto_186013 - BLOCK
      ?auto_186014 - BLOCK
      ?auto_186015 - BLOCK
      ?auto_186016 - BLOCK
      ?auto_186017 - BLOCK
      ?auto_186018 - BLOCK
      ?auto_186019 - BLOCK
      ?auto_186020 - BLOCK
      ?auto_186021 - BLOCK
      ?auto_186022 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186022 ) ( ON-TABLE ?auto_186011 ) ( not ( = ?auto_186011 ?auto_186012 ) ) ( not ( = ?auto_186011 ?auto_186013 ) ) ( not ( = ?auto_186011 ?auto_186014 ) ) ( not ( = ?auto_186011 ?auto_186015 ) ) ( not ( = ?auto_186011 ?auto_186016 ) ) ( not ( = ?auto_186011 ?auto_186017 ) ) ( not ( = ?auto_186011 ?auto_186018 ) ) ( not ( = ?auto_186011 ?auto_186019 ) ) ( not ( = ?auto_186011 ?auto_186020 ) ) ( not ( = ?auto_186011 ?auto_186021 ) ) ( not ( = ?auto_186011 ?auto_186022 ) ) ( not ( = ?auto_186012 ?auto_186013 ) ) ( not ( = ?auto_186012 ?auto_186014 ) ) ( not ( = ?auto_186012 ?auto_186015 ) ) ( not ( = ?auto_186012 ?auto_186016 ) ) ( not ( = ?auto_186012 ?auto_186017 ) ) ( not ( = ?auto_186012 ?auto_186018 ) ) ( not ( = ?auto_186012 ?auto_186019 ) ) ( not ( = ?auto_186012 ?auto_186020 ) ) ( not ( = ?auto_186012 ?auto_186021 ) ) ( not ( = ?auto_186012 ?auto_186022 ) ) ( not ( = ?auto_186013 ?auto_186014 ) ) ( not ( = ?auto_186013 ?auto_186015 ) ) ( not ( = ?auto_186013 ?auto_186016 ) ) ( not ( = ?auto_186013 ?auto_186017 ) ) ( not ( = ?auto_186013 ?auto_186018 ) ) ( not ( = ?auto_186013 ?auto_186019 ) ) ( not ( = ?auto_186013 ?auto_186020 ) ) ( not ( = ?auto_186013 ?auto_186021 ) ) ( not ( = ?auto_186013 ?auto_186022 ) ) ( not ( = ?auto_186014 ?auto_186015 ) ) ( not ( = ?auto_186014 ?auto_186016 ) ) ( not ( = ?auto_186014 ?auto_186017 ) ) ( not ( = ?auto_186014 ?auto_186018 ) ) ( not ( = ?auto_186014 ?auto_186019 ) ) ( not ( = ?auto_186014 ?auto_186020 ) ) ( not ( = ?auto_186014 ?auto_186021 ) ) ( not ( = ?auto_186014 ?auto_186022 ) ) ( not ( = ?auto_186015 ?auto_186016 ) ) ( not ( = ?auto_186015 ?auto_186017 ) ) ( not ( = ?auto_186015 ?auto_186018 ) ) ( not ( = ?auto_186015 ?auto_186019 ) ) ( not ( = ?auto_186015 ?auto_186020 ) ) ( not ( = ?auto_186015 ?auto_186021 ) ) ( not ( = ?auto_186015 ?auto_186022 ) ) ( not ( = ?auto_186016 ?auto_186017 ) ) ( not ( = ?auto_186016 ?auto_186018 ) ) ( not ( = ?auto_186016 ?auto_186019 ) ) ( not ( = ?auto_186016 ?auto_186020 ) ) ( not ( = ?auto_186016 ?auto_186021 ) ) ( not ( = ?auto_186016 ?auto_186022 ) ) ( not ( = ?auto_186017 ?auto_186018 ) ) ( not ( = ?auto_186017 ?auto_186019 ) ) ( not ( = ?auto_186017 ?auto_186020 ) ) ( not ( = ?auto_186017 ?auto_186021 ) ) ( not ( = ?auto_186017 ?auto_186022 ) ) ( not ( = ?auto_186018 ?auto_186019 ) ) ( not ( = ?auto_186018 ?auto_186020 ) ) ( not ( = ?auto_186018 ?auto_186021 ) ) ( not ( = ?auto_186018 ?auto_186022 ) ) ( not ( = ?auto_186019 ?auto_186020 ) ) ( not ( = ?auto_186019 ?auto_186021 ) ) ( not ( = ?auto_186019 ?auto_186022 ) ) ( not ( = ?auto_186020 ?auto_186021 ) ) ( not ( = ?auto_186020 ?auto_186022 ) ) ( not ( = ?auto_186021 ?auto_186022 ) ) ( ON ?auto_186021 ?auto_186022 ) ( ON ?auto_186020 ?auto_186021 ) ( ON ?auto_186019 ?auto_186020 ) ( ON ?auto_186018 ?auto_186019 ) ( ON ?auto_186017 ?auto_186018 ) ( ON ?auto_186016 ?auto_186017 ) ( ON ?auto_186015 ?auto_186016 ) ( ON ?auto_186014 ?auto_186015 ) ( ON ?auto_186013 ?auto_186014 ) ( CLEAR ?auto_186011 ) ( ON ?auto_186012 ?auto_186013 ) ( CLEAR ?auto_186012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186011 ?auto_186012 )
      ( MAKE-12PILE ?auto_186011 ?auto_186012 ?auto_186013 ?auto_186014 ?auto_186015 ?auto_186016 ?auto_186017 ?auto_186018 ?auto_186019 ?auto_186020 ?auto_186021 ?auto_186022 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_186035 - BLOCK
      ?auto_186036 - BLOCK
      ?auto_186037 - BLOCK
      ?auto_186038 - BLOCK
      ?auto_186039 - BLOCK
      ?auto_186040 - BLOCK
      ?auto_186041 - BLOCK
      ?auto_186042 - BLOCK
      ?auto_186043 - BLOCK
      ?auto_186044 - BLOCK
      ?auto_186045 - BLOCK
      ?auto_186046 - BLOCK
    )
    :vars
    (
      ?auto_186047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186046 ?auto_186047 ) ( not ( = ?auto_186035 ?auto_186036 ) ) ( not ( = ?auto_186035 ?auto_186037 ) ) ( not ( = ?auto_186035 ?auto_186038 ) ) ( not ( = ?auto_186035 ?auto_186039 ) ) ( not ( = ?auto_186035 ?auto_186040 ) ) ( not ( = ?auto_186035 ?auto_186041 ) ) ( not ( = ?auto_186035 ?auto_186042 ) ) ( not ( = ?auto_186035 ?auto_186043 ) ) ( not ( = ?auto_186035 ?auto_186044 ) ) ( not ( = ?auto_186035 ?auto_186045 ) ) ( not ( = ?auto_186035 ?auto_186046 ) ) ( not ( = ?auto_186035 ?auto_186047 ) ) ( not ( = ?auto_186036 ?auto_186037 ) ) ( not ( = ?auto_186036 ?auto_186038 ) ) ( not ( = ?auto_186036 ?auto_186039 ) ) ( not ( = ?auto_186036 ?auto_186040 ) ) ( not ( = ?auto_186036 ?auto_186041 ) ) ( not ( = ?auto_186036 ?auto_186042 ) ) ( not ( = ?auto_186036 ?auto_186043 ) ) ( not ( = ?auto_186036 ?auto_186044 ) ) ( not ( = ?auto_186036 ?auto_186045 ) ) ( not ( = ?auto_186036 ?auto_186046 ) ) ( not ( = ?auto_186036 ?auto_186047 ) ) ( not ( = ?auto_186037 ?auto_186038 ) ) ( not ( = ?auto_186037 ?auto_186039 ) ) ( not ( = ?auto_186037 ?auto_186040 ) ) ( not ( = ?auto_186037 ?auto_186041 ) ) ( not ( = ?auto_186037 ?auto_186042 ) ) ( not ( = ?auto_186037 ?auto_186043 ) ) ( not ( = ?auto_186037 ?auto_186044 ) ) ( not ( = ?auto_186037 ?auto_186045 ) ) ( not ( = ?auto_186037 ?auto_186046 ) ) ( not ( = ?auto_186037 ?auto_186047 ) ) ( not ( = ?auto_186038 ?auto_186039 ) ) ( not ( = ?auto_186038 ?auto_186040 ) ) ( not ( = ?auto_186038 ?auto_186041 ) ) ( not ( = ?auto_186038 ?auto_186042 ) ) ( not ( = ?auto_186038 ?auto_186043 ) ) ( not ( = ?auto_186038 ?auto_186044 ) ) ( not ( = ?auto_186038 ?auto_186045 ) ) ( not ( = ?auto_186038 ?auto_186046 ) ) ( not ( = ?auto_186038 ?auto_186047 ) ) ( not ( = ?auto_186039 ?auto_186040 ) ) ( not ( = ?auto_186039 ?auto_186041 ) ) ( not ( = ?auto_186039 ?auto_186042 ) ) ( not ( = ?auto_186039 ?auto_186043 ) ) ( not ( = ?auto_186039 ?auto_186044 ) ) ( not ( = ?auto_186039 ?auto_186045 ) ) ( not ( = ?auto_186039 ?auto_186046 ) ) ( not ( = ?auto_186039 ?auto_186047 ) ) ( not ( = ?auto_186040 ?auto_186041 ) ) ( not ( = ?auto_186040 ?auto_186042 ) ) ( not ( = ?auto_186040 ?auto_186043 ) ) ( not ( = ?auto_186040 ?auto_186044 ) ) ( not ( = ?auto_186040 ?auto_186045 ) ) ( not ( = ?auto_186040 ?auto_186046 ) ) ( not ( = ?auto_186040 ?auto_186047 ) ) ( not ( = ?auto_186041 ?auto_186042 ) ) ( not ( = ?auto_186041 ?auto_186043 ) ) ( not ( = ?auto_186041 ?auto_186044 ) ) ( not ( = ?auto_186041 ?auto_186045 ) ) ( not ( = ?auto_186041 ?auto_186046 ) ) ( not ( = ?auto_186041 ?auto_186047 ) ) ( not ( = ?auto_186042 ?auto_186043 ) ) ( not ( = ?auto_186042 ?auto_186044 ) ) ( not ( = ?auto_186042 ?auto_186045 ) ) ( not ( = ?auto_186042 ?auto_186046 ) ) ( not ( = ?auto_186042 ?auto_186047 ) ) ( not ( = ?auto_186043 ?auto_186044 ) ) ( not ( = ?auto_186043 ?auto_186045 ) ) ( not ( = ?auto_186043 ?auto_186046 ) ) ( not ( = ?auto_186043 ?auto_186047 ) ) ( not ( = ?auto_186044 ?auto_186045 ) ) ( not ( = ?auto_186044 ?auto_186046 ) ) ( not ( = ?auto_186044 ?auto_186047 ) ) ( not ( = ?auto_186045 ?auto_186046 ) ) ( not ( = ?auto_186045 ?auto_186047 ) ) ( not ( = ?auto_186046 ?auto_186047 ) ) ( ON ?auto_186045 ?auto_186046 ) ( ON ?auto_186044 ?auto_186045 ) ( ON ?auto_186043 ?auto_186044 ) ( ON ?auto_186042 ?auto_186043 ) ( ON ?auto_186041 ?auto_186042 ) ( ON ?auto_186040 ?auto_186041 ) ( ON ?auto_186039 ?auto_186040 ) ( ON ?auto_186038 ?auto_186039 ) ( ON ?auto_186037 ?auto_186038 ) ( ON ?auto_186036 ?auto_186037 ) ( ON ?auto_186035 ?auto_186036 ) ( CLEAR ?auto_186035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186035 )
      ( MAKE-12PILE ?auto_186035 ?auto_186036 ?auto_186037 ?auto_186038 ?auto_186039 ?auto_186040 ?auto_186041 ?auto_186042 ?auto_186043 ?auto_186044 ?auto_186045 ?auto_186046 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_186060 - BLOCK
      ?auto_186061 - BLOCK
      ?auto_186062 - BLOCK
      ?auto_186063 - BLOCK
      ?auto_186064 - BLOCK
      ?auto_186065 - BLOCK
      ?auto_186066 - BLOCK
      ?auto_186067 - BLOCK
      ?auto_186068 - BLOCK
      ?auto_186069 - BLOCK
      ?auto_186070 - BLOCK
      ?auto_186071 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186071 ) ( not ( = ?auto_186060 ?auto_186061 ) ) ( not ( = ?auto_186060 ?auto_186062 ) ) ( not ( = ?auto_186060 ?auto_186063 ) ) ( not ( = ?auto_186060 ?auto_186064 ) ) ( not ( = ?auto_186060 ?auto_186065 ) ) ( not ( = ?auto_186060 ?auto_186066 ) ) ( not ( = ?auto_186060 ?auto_186067 ) ) ( not ( = ?auto_186060 ?auto_186068 ) ) ( not ( = ?auto_186060 ?auto_186069 ) ) ( not ( = ?auto_186060 ?auto_186070 ) ) ( not ( = ?auto_186060 ?auto_186071 ) ) ( not ( = ?auto_186061 ?auto_186062 ) ) ( not ( = ?auto_186061 ?auto_186063 ) ) ( not ( = ?auto_186061 ?auto_186064 ) ) ( not ( = ?auto_186061 ?auto_186065 ) ) ( not ( = ?auto_186061 ?auto_186066 ) ) ( not ( = ?auto_186061 ?auto_186067 ) ) ( not ( = ?auto_186061 ?auto_186068 ) ) ( not ( = ?auto_186061 ?auto_186069 ) ) ( not ( = ?auto_186061 ?auto_186070 ) ) ( not ( = ?auto_186061 ?auto_186071 ) ) ( not ( = ?auto_186062 ?auto_186063 ) ) ( not ( = ?auto_186062 ?auto_186064 ) ) ( not ( = ?auto_186062 ?auto_186065 ) ) ( not ( = ?auto_186062 ?auto_186066 ) ) ( not ( = ?auto_186062 ?auto_186067 ) ) ( not ( = ?auto_186062 ?auto_186068 ) ) ( not ( = ?auto_186062 ?auto_186069 ) ) ( not ( = ?auto_186062 ?auto_186070 ) ) ( not ( = ?auto_186062 ?auto_186071 ) ) ( not ( = ?auto_186063 ?auto_186064 ) ) ( not ( = ?auto_186063 ?auto_186065 ) ) ( not ( = ?auto_186063 ?auto_186066 ) ) ( not ( = ?auto_186063 ?auto_186067 ) ) ( not ( = ?auto_186063 ?auto_186068 ) ) ( not ( = ?auto_186063 ?auto_186069 ) ) ( not ( = ?auto_186063 ?auto_186070 ) ) ( not ( = ?auto_186063 ?auto_186071 ) ) ( not ( = ?auto_186064 ?auto_186065 ) ) ( not ( = ?auto_186064 ?auto_186066 ) ) ( not ( = ?auto_186064 ?auto_186067 ) ) ( not ( = ?auto_186064 ?auto_186068 ) ) ( not ( = ?auto_186064 ?auto_186069 ) ) ( not ( = ?auto_186064 ?auto_186070 ) ) ( not ( = ?auto_186064 ?auto_186071 ) ) ( not ( = ?auto_186065 ?auto_186066 ) ) ( not ( = ?auto_186065 ?auto_186067 ) ) ( not ( = ?auto_186065 ?auto_186068 ) ) ( not ( = ?auto_186065 ?auto_186069 ) ) ( not ( = ?auto_186065 ?auto_186070 ) ) ( not ( = ?auto_186065 ?auto_186071 ) ) ( not ( = ?auto_186066 ?auto_186067 ) ) ( not ( = ?auto_186066 ?auto_186068 ) ) ( not ( = ?auto_186066 ?auto_186069 ) ) ( not ( = ?auto_186066 ?auto_186070 ) ) ( not ( = ?auto_186066 ?auto_186071 ) ) ( not ( = ?auto_186067 ?auto_186068 ) ) ( not ( = ?auto_186067 ?auto_186069 ) ) ( not ( = ?auto_186067 ?auto_186070 ) ) ( not ( = ?auto_186067 ?auto_186071 ) ) ( not ( = ?auto_186068 ?auto_186069 ) ) ( not ( = ?auto_186068 ?auto_186070 ) ) ( not ( = ?auto_186068 ?auto_186071 ) ) ( not ( = ?auto_186069 ?auto_186070 ) ) ( not ( = ?auto_186069 ?auto_186071 ) ) ( not ( = ?auto_186070 ?auto_186071 ) ) ( ON ?auto_186070 ?auto_186071 ) ( ON ?auto_186069 ?auto_186070 ) ( ON ?auto_186068 ?auto_186069 ) ( ON ?auto_186067 ?auto_186068 ) ( ON ?auto_186066 ?auto_186067 ) ( ON ?auto_186065 ?auto_186066 ) ( ON ?auto_186064 ?auto_186065 ) ( ON ?auto_186063 ?auto_186064 ) ( ON ?auto_186062 ?auto_186063 ) ( ON ?auto_186061 ?auto_186062 ) ( ON ?auto_186060 ?auto_186061 ) ( CLEAR ?auto_186060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186060 )
      ( MAKE-12PILE ?auto_186060 ?auto_186061 ?auto_186062 ?auto_186063 ?auto_186064 ?auto_186065 ?auto_186066 ?auto_186067 ?auto_186068 ?auto_186069 ?auto_186070 ?auto_186071 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_186084 - BLOCK
      ?auto_186085 - BLOCK
      ?auto_186086 - BLOCK
      ?auto_186087 - BLOCK
      ?auto_186088 - BLOCK
      ?auto_186089 - BLOCK
      ?auto_186090 - BLOCK
      ?auto_186091 - BLOCK
      ?auto_186092 - BLOCK
      ?auto_186093 - BLOCK
      ?auto_186094 - BLOCK
      ?auto_186095 - BLOCK
    )
    :vars
    (
      ?auto_186096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186084 ?auto_186085 ) ) ( not ( = ?auto_186084 ?auto_186086 ) ) ( not ( = ?auto_186084 ?auto_186087 ) ) ( not ( = ?auto_186084 ?auto_186088 ) ) ( not ( = ?auto_186084 ?auto_186089 ) ) ( not ( = ?auto_186084 ?auto_186090 ) ) ( not ( = ?auto_186084 ?auto_186091 ) ) ( not ( = ?auto_186084 ?auto_186092 ) ) ( not ( = ?auto_186084 ?auto_186093 ) ) ( not ( = ?auto_186084 ?auto_186094 ) ) ( not ( = ?auto_186084 ?auto_186095 ) ) ( not ( = ?auto_186085 ?auto_186086 ) ) ( not ( = ?auto_186085 ?auto_186087 ) ) ( not ( = ?auto_186085 ?auto_186088 ) ) ( not ( = ?auto_186085 ?auto_186089 ) ) ( not ( = ?auto_186085 ?auto_186090 ) ) ( not ( = ?auto_186085 ?auto_186091 ) ) ( not ( = ?auto_186085 ?auto_186092 ) ) ( not ( = ?auto_186085 ?auto_186093 ) ) ( not ( = ?auto_186085 ?auto_186094 ) ) ( not ( = ?auto_186085 ?auto_186095 ) ) ( not ( = ?auto_186086 ?auto_186087 ) ) ( not ( = ?auto_186086 ?auto_186088 ) ) ( not ( = ?auto_186086 ?auto_186089 ) ) ( not ( = ?auto_186086 ?auto_186090 ) ) ( not ( = ?auto_186086 ?auto_186091 ) ) ( not ( = ?auto_186086 ?auto_186092 ) ) ( not ( = ?auto_186086 ?auto_186093 ) ) ( not ( = ?auto_186086 ?auto_186094 ) ) ( not ( = ?auto_186086 ?auto_186095 ) ) ( not ( = ?auto_186087 ?auto_186088 ) ) ( not ( = ?auto_186087 ?auto_186089 ) ) ( not ( = ?auto_186087 ?auto_186090 ) ) ( not ( = ?auto_186087 ?auto_186091 ) ) ( not ( = ?auto_186087 ?auto_186092 ) ) ( not ( = ?auto_186087 ?auto_186093 ) ) ( not ( = ?auto_186087 ?auto_186094 ) ) ( not ( = ?auto_186087 ?auto_186095 ) ) ( not ( = ?auto_186088 ?auto_186089 ) ) ( not ( = ?auto_186088 ?auto_186090 ) ) ( not ( = ?auto_186088 ?auto_186091 ) ) ( not ( = ?auto_186088 ?auto_186092 ) ) ( not ( = ?auto_186088 ?auto_186093 ) ) ( not ( = ?auto_186088 ?auto_186094 ) ) ( not ( = ?auto_186088 ?auto_186095 ) ) ( not ( = ?auto_186089 ?auto_186090 ) ) ( not ( = ?auto_186089 ?auto_186091 ) ) ( not ( = ?auto_186089 ?auto_186092 ) ) ( not ( = ?auto_186089 ?auto_186093 ) ) ( not ( = ?auto_186089 ?auto_186094 ) ) ( not ( = ?auto_186089 ?auto_186095 ) ) ( not ( = ?auto_186090 ?auto_186091 ) ) ( not ( = ?auto_186090 ?auto_186092 ) ) ( not ( = ?auto_186090 ?auto_186093 ) ) ( not ( = ?auto_186090 ?auto_186094 ) ) ( not ( = ?auto_186090 ?auto_186095 ) ) ( not ( = ?auto_186091 ?auto_186092 ) ) ( not ( = ?auto_186091 ?auto_186093 ) ) ( not ( = ?auto_186091 ?auto_186094 ) ) ( not ( = ?auto_186091 ?auto_186095 ) ) ( not ( = ?auto_186092 ?auto_186093 ) ) ( not ( = ?auto_186092 ?auto_186094 ) ) ( not ( = ?auto_186092 ?auto_186095 ) ) ( not ( = ?auto_186093 ?auto_186094 ) ) ( not ( = ?auto_186093 ?auto_186095 ) ) ( not ( = ?auto_186094 ?auto_186095 ) ) ( ON ?auto_186084 ?auto_186096 ) ( not ( = ?auto_186095 ?auto_186096 ) ) ( not ( = ?auto_186094 ?auto_186096 ) ) ( not ( = ?auto_186093 ?auto_186096 ) ) ( not ( = ?auto_186092 ?auto_186096 ) ) ( not ( = ?auto_186091 ?auto_186096 ) ) ( not ( = ?auto_186090 ?auto_186096 ) ) ( not ( = ?auto_186089 ?auto_186096 ) ) ( not ( = ?auto_186088 ?auto_186096 ) ) ( not ( = ?auto_186087 ?auto_186096 ) ) ( not ( = ?auto_186086 ?auto_186096 ) ) ( not ( = ?auto_186085 ?auto_186096 ) ) ( not ( = ?auto_186084 ?auto_186096 ) ) ( ON ?auto_186085 ?auto_186084 ) ( ON ?auto_186086 ?auto_186085 ) ( ON ?auto_186087 ?auto_186086 ) ( ON ?auto_186088 ?auto_186087 ) ( ON ?auto_186089 ?auto_186088 ) ( ON ?auto_186090 ?auto_186089 ) ( ON ?auto_186091 ?auto_186090 ) ( ON ?auto_186092 ?auto_186091 ) ( ON ?auto_186093 ?auto_186092 ) ( ON ?auto_186094 ?auto_186093 ) ( ON ?auto_186095 ?auto_186094 ) ( CLEAR ?auto_186095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_186095 ?auto_186094 ?auto_186093 ?auto_186092 ?auto_186091 ?auto_186090 ?auto_186089 ?auto_186088 ?auto_186087 ?auto_186086 ?auto_186085 ?auto_186084 )
      ( MAKE-12PILE ?auto_186084 ?auto_186085 ?auto_186086 ?auto_186087 ?auto_186088 ?auto_186089 ?auto_186090 ?auto_186091 ?auto_186092 ?auto_186093 ?auto_186094 ?auto_186095 ) )
  )

)

