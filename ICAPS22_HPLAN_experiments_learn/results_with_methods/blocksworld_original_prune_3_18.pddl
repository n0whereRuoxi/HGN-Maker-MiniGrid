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

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5479 - BLOCK
      ?auto_5480 - BLOCK
      ?auto_5481 - BLOCK
    )
    :vars
    (
      ?auto_5482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5482 ?auto_5481 ) ( CLEAR ?auto_5482 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5479 ) ( ON ?auto_5480 ?auto_5479 ) ( ON ?auto_5481 ?auto_5480 ) ( not ( = ?auto_5479 ?auto_5480 ) ) ( not ( = ?auto_5479 ?auto_5481 ) ) ( not ( = ?auto_5479 ?auto_5482 ) ) ( not ( = ?auto_5480 ?auto_5481 ) ) ( not ( = ?auto_5480 ?auto_5482 ) ) ( not ( = ?auto_5481 ?auto_5482 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5482 ?auto_5481 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5484 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5484 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5484 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5485 - BLOCK
    )
    :vars
    (
      ?auto_5486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5485 ?auto_5486 ) ( CLEAR ?auto_5485 ) ( HAND-EMPTY ) ( not ( = ?auto_5485 ?auto_5486 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5485 ?auto_5486 )
      ( MAKE-1PILE ?auto_5485 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5489 - BLOCK
      ?auto_5490 - BLOCK
    )
    :vars
    (
      ?auto_5491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5491 ?auto_5490 ) ( CLEAR ?auto_5491 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5489 ) ( ON ?auto_5490 ?auto_5489 ) ( not ( = ?auto_5489 ?auto_5490 ) ) ( not ( = ?auto_5489 ?auto_5491 ) ) ( not ( = ?auto_5490 ?auto_5491 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5491 ?auto_5490 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5492 - BLOCK
      ?auto_5493 - BLOCK
    )
    :vars
    (
      ?auto_5494 - BLOCK
      ?auto_5495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5494 ?auto_5493 ) ( CLEAR ?auto_5494 ) ( ON-TABLE ?auto_5492 ) ( ON ?auto_5493 ?auto_5492 ) ( not ( = ?auto_5492 ?auto_5493 ) ) ( not ( = ?auto_5492 ?auto_5494 ) ) ( not ( = ?auto_5493 ?auto_5494 ) ) ( HOLDING ?auto_5495 ) ( not ( = ?auto_5492 ?auto_5495 ) ) ( not ( = ?auto_5493 ?auto_5495 ) ) ( not ( = ?auto_5494 ?auto_5495 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5495 )
      ( MAKE-2PILE ?auto_5492 ?auto_5493 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5496 - BLOCK
      ?auto_5497 - BLOCK
    )
    :vars
    (
      ?auto_5499 - BLOCK
      ?auto_5498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5499 ?auto_5497 ) ( ON-TABLE ?auto_5496 ) ( ON ?auto_5497 ?auto_5496 ) ( not ( = ?auto_5496 ?auto_5497 ) ) ( not ( = ?auto_5496 ?auto_5499 ) ) ( not ( = ?auto_5497 ?auto_5499 ) ) ( not ( = ?auto_5496 ?auto_5498 ) ) ( not ( = ?auto_5497 ?auto_5498 ) ) ( not ( = ?auto_5499 ?auto_5498 ) ) ( ON ?auto_5498 ?auto_5499 ) ( CLEAR ?auto_5498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5496 ?auto_5497 ?auto_5499 )
      ( MAKE-2PILE ?auto_5496 ?auto_5497 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5502 - BLOCK
      ?auto_5503 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5503 ) ( CLEAR ?auto_5502 ) ( ON-TABLE ?auto_5502 ) ( not ( = ?auto_5502 ?auto_5503 ) ) )
    :subtasks
    ( ( !STACK ?auto_5503 ?auto_5502 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5504 - BLOCK
      ?auto_5505 - BLOCK
    )
    :vars
    (
      ?auto_5506 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5504 ) ( ON-TABLE ?auto_5504 ) ( not ( = ?auto_5504 ?auto_5505 ) ) ( ON ?auto_5505 ?auto_5506 ) ( CLEAR ?auto_5505 ) ( HAND-EMPTY ) ( not ( = ?auto_5504 ?auto_5506 ) ) ( not ( = ?auto_5505 ?auto_5506 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5505 ?auto_5506 )
      ( MAKE-2PILE ?auto_5504 ?auto_5505 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5507 - BLOCK
      ?auto_5508 - BLOCK
    )
    :vars
    (
      ?auto_5509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5507 ?auto_5508 ) ) ( ON ?auto_5508 ?auto_5509 ) ( CLEAR ?auto_5508 ) ( not ( = ?auto_5507 ?auto_5509 ) ) ( not ( = ?auto_5508 ?auto_5509 ) ) ( HOLDING ?auto_5507 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5507 )
      ( MAKE-2PILE ?auto_5507 ?auto_5508 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5510 - BLOCK
      ?auto_5511 - BLOCK
    )
    :vars
    (
      ?auto_5512 - BLOCK
      ?auto_5513 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5510 ?auto_5511 ) ) ( ON ?auto_5511 ?auto_5512 ) ( not ( = ?auto_5510 ?auto_5512 ) ) ( not ( = ?auto_5511 ?auto_5512 ) ) ( ON ?auto_5510 ?auto_5511 ) ( CLEAR ?auto_5510 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5513 ) ( ON ?auto_5512 ?auto_5513 ) ( not ( = ?auto_5513 ?auto_5512 ) ) ( not ( = ?auto_5513 ?auto_5511 ) ) ( not ( = ?auto_5513 ?auto_5510 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5513 ?auto_5512 ?auto_5511 )
      ( MAKE-2PILE ?auto_5510 ?auto_5511 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5515 - BLOCK
    )
    :vars
    (
      ?auto_5516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5516 ?auto_5515 ) ( CLEAR ?auto_5516 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5515 ) ( not ( = ?auto_5515 ?auto_5516 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5516 ?auto_5515 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5517 - BLOCK
    )
    :vars
    (
      ?auto_5518 - BLOCK
      ?auto_5519 - BLOCK
      ?auto_5520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5518 ?auto_5517 ) ( CLEAR ?auto_5518 ) ( ON-TABLE ?auto_5517 ) ( not ( = ?auto_5517 ?auto_5518 ) ) ( HOLDING ?auto_5519 ) ( CLEAR ?auto_5520 ) ( not ( = ?auto_5517 ?auto_5519 ) ) ( not ( = ?auto_5517 ?auto_5520 ) ) ( not ( = ?auto_5518 ?auto_5519 ) ) ( not ( = ?auto_5518 ?auto_5520 ) ) ( not ( = ?auto_5519 ?auto_5520 ) ) )
    :subtasks
    ( ( !STACK ?auto_5519 ?auto_5520 )
      ( MAKE-1PILE ?auto_5517 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5607 - BLOCK
    )
    :vars
    (
      ?auto_5609 - BLOCK
      ?auto_5608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5609 ?auto_5607 ) ( ON-TABLE ?auto_5607 ) ( not ( = ?auto_5607 ?auto_5609 ) ) ( not ( = ?auto_5607 ?auto_5608 ) ) ( not ( = ?auto_5609 ?auto_5608 ) ) ( ON ?auto_5608 ?auto_5609 ) ( CLEAR ?auto_5608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5607 ?auto_5609 )
      ( MAKE-1PILE ?auto_5607 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5525 - BLOCK
    )
    :vars
    (
      ?auto_5526 - BLOCK
      ?auto_5528 - BLOCK
      ?auto_5527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5526 ?auto_5525 ) ( ON-TABLE ?auto_5525 ) ( not ( = ?auto_5525 ?auto_5526 ) ) ( not ( = ?auto_5525 ?auto_5528 ) ) ( not ( = ?auto_5525 ?auto_5527 ) ) ( not ( = ?auto_5526 ?auto_5528 ) ) ( not ( = ?auto_5526 ?auto_5527 ) ) ( not ( = ?auto_5528 ?auto_5527 ) ) ( ON ?auto_5528 ?auto_5526 ) ( CLEAR ?auto_5528 ) ( HOLDING ?auto_5527 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5527 )
      ( MAKE-1PILE ?auto_5525 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5529 - BLOCK
    )
    :vars
    (
      ?auto_5530 - BLOCK
      ?auto_5532 - BLOCK
      ?auto_5531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5530 ?auto_5529 ) ( ON-TABLE ?auto_5529 ) ( not ( = ?auto_5529 ?auto_5530 ) ) ( not ( = ?auto_5529 ?auto_5532 ) ) ( not ( = ?auto_5529 ?auto_5531 ) ) ( not ( = ?auto_5530 ?auto_5532 ) ) ( not ( = ?auto_5530 ?auto_5531 ) ) ( not ( = ?auto_5532 ?auto_5531 ) ) ( ON ?auto_5532 ?auto_5530 ) ( ON ?auto_5531 ?auto_5532 ) ( CLEAR ?auto_5531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5529 ?auto_5530 ?auto_5532 )
      ( MAKE-1PILE ?auto_5529 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5536 - BLOCK
      ?auto_5537 - BLOCK
      ?auto_5538 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5538 ) ( CLEAR ?auto_5537 ) ( ON-TABLE ?auto_5536 ) ( ON ?auto_5537 ?auto_5536 ) ( not ( = ?auto_5536 ?auto_5537 ) ) ( not ( = ?auto_5536 ?auto_5538 ) ) ( not ( = ?auto_5537 ?auto_5538 ) ) )
    :subtasks
    ( ( !STACK ?auto_5538 ?auto_5537 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5539 - BLOCK
      ?auto_5540 - BLOCK
      ?auto_5541 - BLOCK
    )
    :vars
    (
      ?auto_5542 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5540 ) ( ON-TABLE ?auto_5539 ) ( ON ?auto_5540 ?auto_5539 ) ( not ( = ?auto_5539 ?auto_5540 ) ) ( not ( = ?auto_5539 ?auto_5541 ) ) ( not ( = ?auto_5540 ?auto_5541 ) ) ( ON ?auto_5541 ?auto_5542 ) ( CLEAR ?auto_5541 ) ( HAND-EMPTY ) ( not ( = ?auto_5539 ?auto_5542 ) ) ( not ( = ?auto_5540 ?auto_5542 ) ) ( not ( = ?auto_5541 ?auto_5542 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5541 ?auto_5542 )
      ( MAKE-3PILE ?auto_5539 ?auto_5540 ?auto_5541 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5543 - BLOCK
      ?auto_5544 - BLOCK
      ?auto_5545 - BLOCK
    )
    :vars
    (
      ?auto_5546 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5543 ) ( not ( = ?auto_5543 ?auto_5544 ) ) ( not ( = ?auto_5543 ?auto_5545 ) ) ( not ( = ?auto_5544 ?auto_5545 ) ) ( ON ?auto_5545 ?auto_5546 ) ( CLEAR ?auto_5545 ) ( not ( = ?auto_5543 ?auto_5546 ) ) ( not ( = ?auto_5544 ?auto_5546 ) ) ( not ( = ?auto_5545 ?auto_5546 ) ) ( HOLDING ?auto_5544 ) ( CLEAR ?auto_5543 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5543 ?auto_5544 )
      ( MAKE-3PILE ?auto_5543 ?auto_5544 ?auto_5545 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5547 - BLOCK
      ?auto_5548 - BLOCK
      ?auto_5549 - BLOCK
    )
    :vars
    (
      ?auto_5550 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5547 ) ( not ( = ?auto_5547 ?auto_5548 ) ) ( not ( = ?auto_5547 ?auto_5549 ) ) ( not ( = ?auto_5548 ?auto_5549 ) ) ( ON ?auto_5549 ?auto_5550 ) ( not ( = ?auto_5547 ?auto_5550 ) ) ( not ( = ?auto_5548 ?auto_5550 ) ) ( not ( = ?auto_5549 ?auto_5550 ) ) ( CLEAR ?auto_5547 ) ( ON ?auto_5548 ?auto_5549 ) ( CLEAR ?auto_5548 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5550 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5550 ?auto_5549 )
      ( MAKE-3PILE ?auto_5547 ?auto_5548 ?auto_5549 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5551 - BLOCK
      ?auto_5552 - BLOCK
      ?auto_5553 - BLOCK
    )
    :vars
    (
      ?auto_5554 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5551 ?auto_5552 ) ) ( not ( = ?auto_5551 ?auto_5553 ) ) ( not ( = ?auto_5552 ?auto_5553 ) ) ( ON ?auto_5553 ?auto_5554 ) ( not ( = ?auto_5551 ?auto_5554 ) ) ( not ( = ?auto_5552 ?auto_5554 ) ) ( not ( = ?auto_5553 ?auto_5554 ) ) ( ON ?auto_5552 ?auto_5553 ) ( CLEAR ?auto_5552 ) ( ON-TABLE ?auto_5554 ) ( HOLDING ?auto_5551 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5551 )
      ( MAKE-3PILE ?auto_5551 ?auto_5552 ?auto_5553 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5555 - BLOCK
      ?auto_5556 - BLOCK
      ?auto_5557 - BLOCK
    )
    :vars
    (
      ?auto_5558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5555 ?auto_5556 ) ) ( not ( = ?auto_5555 ?auto_5557 ) ) ( not ( = ?auto_5556 ?auto_5557 ) ) ( ON ?auto_5557 ?auto_5558 ) ( not ( = ?auto_5555 ?auto_5558 ) ) ( not ( = ?auto_5556 ?auto_5558 ) ) ( not ( = ?auto_5557 ?auto_5558 ) ) ( ON ?auto_5556 ?auto_5557 ) ( ON-TABLE ?auto_5558 ) ( ON ?auto_5555 ?auto_5556 ) ( CLEAR ?auto_5555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5558 ?auto_5557 ?auto_5556 )
      ( MAKE-3PILE ?auto_5555 ?auto_5556 ?auto_5557 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5585 - BLOCK
    )
    :vars
    (
      ?auto_5586 - BLOCK
      ?auto_5587 - BLOCK
      ?auto_5588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5585 ?auto_5586 ) ( CLEAR ?auto_5585 ) ( not ( = ?auto_5585 ?auto_5586 ) ) ( HOLDING ?auto_5587 ) ( CLEAR ?auto_5588 ) ( not ( = ?auto_5585 ?auto_5587 ) ) ( not ( = ?auto_5585 ?auto_5588 ) ) ( not ( = ?auto_5586 ?auto_5587 ) ) ( not ( = ?auto_5586 ?auto_5588 ) ) ( not ( = ?auto_5587 ?auto_5588 ) ) )
    :subtasks
    ( ( !STACK ?auto_5587 ?auto_5588 )
      ( MAKE-1PILE ?auto_5585 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5589 - BLOCK
    )
    :vars
    (
      ?auto_5592 - BLOCK
      ?auto_5590 - BLOCK
      ?auto_5591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5589 ?auto_5592 ) ( not ( = ?auto_5589 ?auto_5592 ) ) ( CLEAR ?auto_5590 ) ( not ( = ?auto_5589 ?auto_5591 ) ) ( not ( = ?auto_5589 ?auto_5590 ) ) ( not ( = ?auto_5592 ?auto_5591 ) ) ( not ( = ?auto_5592 ?auto_5590 ) ) ( not ( = ?auto_5591 ?auto_5590 ) ) ( ON ?auto_5591 ?auto_5589 ) ( CLEAR ?auto_5591 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5592 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5592 ?auto_5589 )
      ( MAKE-1PILE ?auto_5589 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5593 - BLOCK
    )
    :vars
    (
      ?auto_5594 - BLOCK
      ?auto_5595 - BLOCK
      ?auto_5596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5593 ?auto_5594 ) ( not ( = ?auto_5593 ?auto_5594 ) ) ( not ( = ?auto_5593 ?auto_5595 ) ) ( not ( = ?auto_5593 ?auto_5596 ) ) ( not ( = ?auto_5594 ?auto_5595 ) ) ( not ( = ?auto_5594 ?auto_5596 ) ) ( not ( = ?auto_5595 ?auto_5596 ) ) ( ON ?auto_5595 ?auto_5593 ) ( CLEAR ?auto_5595 ) ( ON-TABLE ?auto_5594 ) ( HOLDING ?auto_5596 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5596 )
      ( MAKE-1PILE ?auto_5593 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5597 - BLOCK
    )
    :vars
    (
      ?auto_5600 - BLOCK
      ?auto_5598 - BLOCK
      ?auto_5599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5597 ?auto_5600 ) ( not ( = ?auto_5597 ?auto_5600 ) ) ( not ( = ?auto_5597 ?auto_5598 ) ) ( not ( = ?auto_5597 ?auto_5599 ) ) ( not ( = ?auto_5600 ?auto_5598 ) ) ( not ( = ?auto_5600 ?auto_5599 ) ) ( not ( = ?auto_5598 ?auto_5599 ) ) ( ON ?auto_5598 ?auto_5597 ) ( ON-TABLE ?auto_5600 ) ( ON ?auto_5599 ?auto_5598 ) ( CLEAR ?auto_5599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5600 ?auto_5597 ?auto_5598 )
      ( MAKE-1PILE ?auto_5597 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5604 - BLOCK
    )
    :vars
    (
      ?auto_5605 - BLOCK
      ?auto_5606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5605 ?auto_5604 ) ( CLEAR ?auto_5605 ) ( ON-TABLE ?auto_5604 ) ( not ( = ?auto_5604 ?auto_5605 ) ) ( HOLDING ?auto_5606 ) ( not ( = ?auto_5604 ?auto_5606 ) ) ( not ( = ?auto_5605 ?auto_5606 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5606 )
      ( MAKE-1PILE ?auto_5604 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5629 - BLOCK
      ?auto_5630 - BLOCK
    )
    :vars
    (
      ?auto_5631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5629 ?auto_5630 ) ) ( ON ?auto_5630 ?auto_5631 ) ( not ( = ?auto_5629 ?auto_5631 ) ) ( not ( = ?auto_5630 ?auto_5631 ) ) ( ON ?auto_5629 ?auto_5630 ) ( CLEAR ?auto_5629 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5631 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5631 ?auto_5630 )
      ( MAKE-2PILE ?auto_5629 ?auto_5630 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5634 - BLOCK
      ?auto_5635 - BLOCK
    )
    :vars
    (
      ?auto_5636 - BLOCK
      ?auto_5637 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5634 ?auto_5635 ) ) ( ON ?auto_5635 ?auto_5636 ) ( CLEAR ?auto_5635 ) ( not ( = ?auto_5634 ?auto_5636 ) ) ( not ( = ?auto_5635 ?auto_5636 ) ) ( ON ?auto_5634 ?auto_5637 ) ( CLEAR ?auto_5634 ) ( HAND-EMPTY ) ( not ( = ?auto_5634 ?auto_5637 ) ) ( not ( = ?auto_5635 ?auto_5637 ) ) ( not ( = ?auto_5636 ?auto_5637 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5634 ?auto_5637 )
      ( MAKE-2PILE ?auto_5634 ?auto_5635 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5638 - BLOCK
      ?auto_5639 - BLOCK
    )
    :vars
    (
      ?auto_5641 - BLOCK
      ?auto_5640 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5638 ?auto_5639 ) ) ( not ( = ?auto_5638 ?auto_5641 ) ) ( not ( = ?auto_5639 ?auto_5641 ) ) ( ON ?auto_5638 ?auto_5640 ) ( CLEAR ?auto_5638 ) ( not ( = ?auto_5638 ?auto_5640 ) ) ( not ( = ?auto_5639 ?auto_5640 ) ) ( not ( = ?auto_5641 ?auto_5640 ) ) ( HOLDING ?auto_5639 ) ( CLEAR ?auto_5641 ) ( ON-TABLE ?auto_5641 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5641 ?auto_5639 )
      ( MAKE-2PILE ?auto_5638 ?auto_5639 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5642 - BLOCK
      ?auto_5643 - BLOCK
    )
    :vars
    (
      ?auto_5644 - BLOCK
      ?auto_5645 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5642 ?auto_5643 ) ) ( not ( = ?auto_5642 ?auto_5644 ) ) ( not ( = ?auto_5643 ?auto_5644 ) ) ( ON ?auto_5642 ?auto_5645 ) ( not ( = ?auto_5642 ?auto_5645 ) ) ( not ( = ?auto_5643 ?auto_5645 ) ) ( not ( = ?auto_5644 ?auto_5645 ) ) ( CLEAR ?auto_5644 ) ( ON-TABLE ?auto_5644 ) ( ON ?auto_5643 ?auto_5642 ) ( CLEAR ?auto_5643 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5645 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5645 ?auto_5642 )
      ( MAKE-2PILE ?auto_5642 ?auto_5643 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5646 - BLOCK
      ?auto_5647 - BLOCK
    )
    :vars
    (
      ?auto_5649 - BLOCK
      ?auto_5648 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5646 ?auto_5647 ) ) ( not ( = ?auto_5646 ?auto_5649 ) ) ( not ( = ?auto_5647 ?auto_5649 ) ) ( ON ?auto_5646 ?auto_5648 ) ( not ( = ?auto_5646 ?auto_5648 ) ) ( not ( = ?auto_5647 ?auto_5648 ) ) ( not ( = ?auto_5649 ?auto_5648 ) ) ( ON ?auto_5647 ?auto_5646 ) ( CLEAR ?auto_5647 ) ( ON-TABLE ?auto_5648 ) ( HOLDING ?auto_5649 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5649 )
      ( MAKE-2PILE ?auto_5646 ?auto_5647 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5650 - BLOCK
      ?auto_5651 - BLOCK
    )
    :vars
    (
      ?auto_5653 - BLOCK
      ?auto_5652 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5650 ?auto_5651 ) ) ( not ( = ?auto_5650 ?auto_5653 ) ) ( not ( = ?auto_5651 ?auto_5653 ) ) ( ON ?auto_5650 ?auto_5652 ) ( not ( = ?auto_5650 ?auto_5652 ) ) ( not ( = ?auto_5651 ?auto_5652 ) ) ( not ( = ?auto_5653 ?auto_5652 ) ) ( ON ?auto_5651 ?auto_5650 ) ( ON-TABLE ?auto_5652 ) ( ON ?auto_5653 ?auto_5651 ) ( CLEAR ?auto_5653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5652 ?auto_5650 ?auto_5651 )
      ( MAKE-2PILE ?auto_5650 ?auto_5651 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5660 - BLOCK
      ?auto_5661 - BLOCK
      ?auto_5662 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5661 ) ( ON-TABLE ?auto_5660 ) ( ON ?auto_5661 ?auto_5660 ) ( not ( = ?auto_5660 ?auto_5661 ) ) ( not ( = ?auto_5660 ?auto_5662 ) ) ( not ( = ?auto_5661 ?auto_5662 ) ) ( ON-TABLE ?auto_5662 ) ( CLEAR ?auto_5662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_5662 )
      ( MAKE-3PILE ?auto_5660 ?auto_5661 ?auto_5662 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5663 - BLOCK
      ?auto_5664 - BLOCK
      ?auto_5665 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5663 ) ( not ( = ?auto_5663 ?auto_5664 ) ) ( not ( = ?auto_5663 ?auto_5665 ) ) ( not ( = ?auto_5664 ?auto_5665 ) ) ( ON-TABLE ?auto_5665 ) ( CLEAR ?auto_5665 ) ( HOLDING ?auto_5664 ) ( CLEAR ?auto_5663 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5663 ?auto_5664 )
      ( MAKE-3PILE ?auto_5663 ?auto_5664 ?auto_5665 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5666 - BLOCK
      ?auto_5667 - BLOCK
      ?auto_5668 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5666 ) ( not ( = ?auto_5666 ?auto_5667 ) ) ( not ( = ?auto_5666 ?auto_5668 ) ) ( not ( = ?auto_5667 ?auto_5668 ) ) ( ON-TABLE ?auto_5668 ) ( CLEAR ?auto_5666 ) ( ON ?auto_5667 ?auto_5668 ) ( CLEAR ?auto_5667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5668 )
      ( MAKE-3PILE ?auto_5666 ?auto_5667 ?auto_5668 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5669 - BLOCK
      ?auto_5670 - BLOCK
      ?auto_5671 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5669 ?auto_5670 ) ) ( not ( = ?auto_5669 ?auto_5671 ) ) ( not ( = ?auto_5670 ?auto_5671 ) ) ( ON-TABLE ?auto_5671 ) ( ON ?auto_5670 ?auto_5671 ) ( CLEAR ?auto_5670 ) ( HOLDING ?auto_5669 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5669 )
      ( MAKE-3PILE ?auto_5669 ?auto_5670 ?auto_5671 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5672 - BLOCK
      ?auto_5673 - BLOCK
      ?auto_5674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5672 ?auto_5673 ) ) ( not ( = ?auto_5672 ?auto_5674 ) ) ( not ( = ?auto_5673 ?auto_5674 ) ) ( ON-TABLE ?auto_5674 ) ( ON ?auto_5673 ?auto_5674 ) ( ON ?auto_5672 ?auto_5673 ) ( CLEAR ?auto_5672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5674 ?auto_5673 )
      ( MAKE-3PILE ?auto_5672 ?auto_5673 ?auto_5674 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5678 - BLOCK
      ?auto_5679 - BLOCK
      ?auto_5680 - BLOCK
    )
    :vars
    (
      ?auto_5681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5678 ?auto_5679 ) ) ( not ( = ?auto_5678 ?auto_5680 ) ) ( not ( = ?auto_5679 ?auto_5680 ) ) ( ON-TABLE ?auto_5680 ) ( ON ?auto_5679 ?auto_5680 ) ( CLEAR ?auto_5679 ) ( ON ?auto_5678 ?auto_5681 ) ( CLEAR ?auto_5678 ) ( HAND-EMPTY ) ( not ( = ?auto_5678 ?auto_5681 ) ) ( not ( = ?auto_5679 ?auto_5681 ) ) ( not ( = ?auto_5680 ?auto_5681 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5678 ?auto_5681 )
      ( MAKE-3PILE ?auto_5678 ?auto_5679 ?auto_5680 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5682 - BLOCK
      ?auto_5683 - BLOCK
      ?auto_5684 - BLOCK
    )
    :vars
    (
      ?auto_5685 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5682 ?auto_5683 ) ) ( not ( = ?auto_5682 ?auto_5684 ) ) ( not ( = ?auto_5683 ?auto_5684 ) ) ( ON-TABLE ?auto_5684 ) ( ON ?auto_5682 ?auto_5685 ) ( CLEAR ?auto_5682 ) ( not ( = ?auto_5682 ?auto_5685 ) ) ( not ( = ?auto_5683 ?auto_5685 ) ) ( not ( = ?auto_5684 ?auto_5685 ) ) ( HOLDING ?auto_5683 ) ( CLEAR ?auto_5684 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5684 ?auto_5683 )
      ( MAKE-3PILE ?auto_5682 ?auto_5683 ?auto_5684 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5686 - BLOCK
      ?auto_5687 - BLOCK
      ?auto_5688 - BLOCK
    )
    :vars
    (
      ?auto_5689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5686 ?auto_5687 ) ) ( not ( = ?auto_5686 ?auto_5688 ) ) ( not ( = ?auto_5687 ?auto_5688 ) ) ( ON-TABLE ?auto_5688 ) ( ON ?auto_5686 ?auto_5689 ) ( not ( = ?auto_5686 ?auto_5689 ) ) ( not ( = ?auto_5687 ?auto_5689 ) ) ( not ( = ?auto_5688 ?auto_5689 ) ) ( CLEAR ?auto_5688 ) ( ON ?auto_5687 ?auto_5686 ) ( CLEAR ?auto_5687 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5689 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5689 ?auto_5686 )
      ( MAKE-3PILE ?auto_5686 ?auto_5687 ?auto_5688 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5690 - BLOCK
      ?auto_5691 - BLOCK
      ?auto_5692 - BLOCK
    )
    :vars
    (
      ?auto_5693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5690 ?auto_5691 ) ) ( not ( = ?auto_5690 ?auto_5692 ) ) ( not ( = ?auto_5691 ?auto_5692 ) ) ( ON ?auto_5690 ?auto_5693 ) ( not ( = ?auto_5690 ?auto_5693 ) ) ( not ( = ?auto_5691 ?auto_5693 ) ) ( not ( = ?auto_5692 ?auto_5693 ) ) ( ON ?auto_5691 ?auto_5690 ) ( CLEAR ?auto_5691 ) ( ON-TABLE ?auto_5693 ) ( HOLDING ?auto_5692 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5692 )
      ( MAKE-3PILE ?auto_5690 ?auto_5691 ?auto_5692 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5694 - BLOCK
      ?auto_5695 - BLOCK
      ?auto_5696 - BLOCK
    )
    :vars
    (
      ?auto_5697 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5694 ?auto_5695 ) ) ( not ( = ?auto_5694 ?auto_5696 ) ) ( not ( = ?auto_5695 ?auto_5696 ) ) ( ON ?auto_5694 ?auto_5697 ) ( not ( = ?auto_5694 ?auto_5697 ) ) ( not ( = ?auto_5695 ?auto_5697 ) ) ( not ( = ?auto_5696 ?auto_5697 ) ) ( ON ?auto_5695 ?auto_5694 ) ( ON-TABLE ?auto_5697 ) ( ON ?auto_5696 ?auto_5695 ) ( CLEAR ?auto_5696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5697 ?auto_5694 ?auto_5695 )
      ( MAKE-3PILE ?auto_5694 ?auto_5695 ?auto_5696 ) )
  )

)

