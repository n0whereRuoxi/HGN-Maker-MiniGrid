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
      ?auto_5433 - BLOCK
    )
    :vars
    (
      ?auto_5434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5433 ?auto_5434 ) ( CLEAR ?auto_5433 ) ( HAND-EMPTY ) ( not ( = ?auto_5433 ?auto_5434 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5433 ?auto_5434 )
      ( !PUTDOWN ?auto_5433 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5440 - BLOCK
      ?auto_5441 - BLOCK
    )
    :vars
    (
      ?auto_5442 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5440 ) ( ON ?auto_5441 ?auto_5442 ) ( CLEAR ?auto_5441 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5440 ) ( not ( = ?auto_5440 ?auto_5441 ) ) ( not ( = ?auto_5440 ?auto_5442 ) ) ( not ( = ?auto_5441 ?auto_5442 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5441 ?auto_5442 )
      ( !STACK ?auto_5441 ?auto_5440 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5450 - BLOCK
      ?auto_5451 - BLOCK
    )
    :vars
    (
      ?auto_5452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5451 ?auto_5452 ) ( not ( = ?auto_5450 ?auto_5451 ) ) ( not ( = ?auto_5450 ?auto_5452 ) ) ( not ( = ?auto_5451 ?auto_5452 ) ) ( ON ?auto_5450 ?auto_5451 ) ( CLEAR ?auto_5450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5450 )
      ( MAKE-2PILE ?auto_5450 ?auto_5451 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5461 - BLOCK
      ?auto_5462 - BLOCK
      ?auto_5463 - BLOCK
    )
    :vars
    (
      ?auto_5464 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5462 ) ( ON ?auto_5463 ?auto_5464 ) ( CLEAR ?auto_5463 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5461 ) ( ON ?auto_5462 ?auto_5461 ) ( not ( = ?auto_5461 ?auto_5462 ) ) ( not ( = ?auto_5461 ?auto_5463 ) ) ( not ( = ?auto_5461 ?auto_5464 ) ) ( not ( = ?auto_5462 ?auto_5463 ) ) ( not ( = ?auto_5462 ?auto_5464 ) ) ( not ( = ?auto_5463 ?auto_5464 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5463 ?auto_5464 )
      ( !STACK ?auto_5463 ?auto_5462 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5475 - BLOCK
      ?auto_5476 - BLOCK
      ?auto_5477 - BLOCK
    )
    :vars
    (
      ?auto_5478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5477 ?auto_5478 ) ( ON-TABLE ?auto_5475 ) ( not ( = ?auto_5475 ?auto_5476 ) ) ( not ( = ?auto_5475 ?auto_5477 ) ) ( not ( = ?auto_5475 ?auto_5478 ) ) ( not ( = ?auto_5476 ?auto_5477 ) ) ( not ( = ?auto_5476 ?auto_5478 ) ) ( not ( = ?auto_5477 ?auto_5478 ) ) ( CLEAR ?auto_5475 ) ( ON ?auto_5476 ?auto_5477 ) ( CLEAR ?auto_5476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5475 ?auto_5476 )
      ( MAKE-3PILE ?auto_5475 ?auto_5476 ?auto_5477 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5489 - BLOCK
      ?auto_5490 - BLOCK
      ?auto_5491 - BLOCK
    )
    :vars
    (
      ?auto_5492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5491 ?auto_5492 ) ( not ( = ?auto_5489 ?auto_5490 ) ) ( not ( = ?auto_5489 ?auto_5491 ) ) ( not ( = ?auto_5489 ?auto_5492 ) ) ( not ( = ?auto_5490 ?auto_5491 ) ) ( not ( = ?auto_5490 ?auto_5492 ) ) ( not ( = ?auto_5491 ?auto_5492 ) ) ( ON ?auto_5490 ?auto_5491 ) ( ON ?auto_5489 ?auto_5490 ) ( CLEAR ?auto_5489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5489 )
      ( MAKE-3PILE ?auto_5489 ?auto_5490 ?auto_5491 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_5504 - BLOCK
      ?auto_5505 - BLOCK
      ?auto_5506 - BLOCK
      ?auto_5507 - BLOCK
    )
    :vars
    (
      ?auto_5508 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5506 ) ( ON ?auto_5507 ?auto_5508 ) ( CLEAR ?auto_5507 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5504 ) ( ON ?auto_5505 ?auto_5504 ) ( ON ?auto_5506 ?auto_5505 ) ( not ( = ?auto_5504 ?auto_5505 ) ) ( not ( = ?auto_5504 ?auto_5506 ) ) ( not ( = ?auto_5504 ?auto_5507 ) ) ( not ( = ?auto_5504 ?auto_5508 ) ) ( not ( = ?auto_5505 ?auto_5506 ) ) ( not ( = ?auto_5505 ?auto_5507 ) ) ( not ( = ?auto_5505 ?auto_5508 ) ) ( not ( = ?auto_5506 ?auto_5507 ) ) ( not ( = ?auto_5506 ?auto_5508 ) ) ( not ( = ?auto_5507 ?auto_5508 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5507 ?auto_5508 )
      ( !STACK ?auto_5507 ?auto_5506 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_5522 - BLOCK
      ?auto_5523 - BLOCK
      ?auto_5524 - BLOCK
      ?auto_5525 - BLOCK
    )
    :vars
    (
      ?auto_5526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5525 ?auto_5526 ) ( ON-TABLE ?auto_5522 ) ( ON ?auto_5523 ?auto_5522 ) ( not ( = ?auto_5522 ?auto_5523 ) ) ( not ( = ?auto_5522 ?auto_5524 ) ) ( not ( = ?auto_5522 ?auto_5525 ) ) ( not ( = ?auto_5522 ?auto_5526 ) ) ( not ( = ?auto_5523 ?auto_5524 ) ) ( not ( = ?auto_5523 ?auto_5525 ) ) ( not ( = ?auto_5523 ?auto_5526 ) ) ( not ( = ?auto_5524 ?auto_5525 ) ) ( not ( = ?auto_5524 ?auto_5526 ) ) ( not ( = ?auto_5525 ?auto_5526 ) ) ( CLEAR ?auto_5523 ) ( ON ?auto_5524 ?auto_5525 ) ( CLEAR ?auto_5524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5522 ?auto_5523 ?auto_5524 )
      ( MAKE-4PILE ?auto_5522 ?auto_5523 ?auto_5524 ?auto_5525 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_5540 - BLOCK
      ?auto_5541 - BLOCK
      ?auto_5542 - BLOCK
      ?auto_5543 - BLOCK
    )
    :vars
    (
      ?auto_5544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5543 ?auto_5544 ) ( ON-TABLE ?auto_5540 ) ( not ( = ?auto_5540 ?auto_5541 ) ) ( not ( = ?auto_5540 ?auto_5542 ) ) ( not ( = ?auto_5540 ?auto_5543 ) ) ( not ( = ?auto_5540 ?auto_5544 ) ) ( not ( = ?auto_5541 ?auto_5542 ) ) ( not ( = ?auto_5541 ?auto_5543 ) ) ( not ( = ?auto_5541 ?auto_5544 ) ) ( not ( = ?auto_5542 ?auto_5543 ) ) ( not ( = ?auto_5542 ?auto_5544 ) ) ( not ( = ?auto_5543 ?auto_5544 ) ) ( ON ?auto_5542 ?auto_5543 ) ( CLEAR ?auto_5540 ) ( ON ?auto_5541 ?auto_5542 ) ( CLEAR ?auto_5541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5540 ?auto_5541 )
      ( MAKE-4PILE ?auto_5540 ?auto_5541 ?auto_5542 ?auto_5543 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_5558 - BLOCK
      ?auto_5559 - BLOCK
      ?auto_5560 - BLOCK
      ?auto_5561 - BLOCK
    )
    :vars
    (
      ?auto_5562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5561 ?auto_5562 ) ( not ( = ?auto_5558 ?auto_5559 ) ) ( not ( = ?auto_5558 ?auto_5560 ) ) ( not ( = ?auto_5558 ?auto_5561 ) ) ( not ( = ?auto_5558 ?auto_5562 ) ) ( not ( = ?auto_5559 ?auto_5560 ) ) ( not ( = ?auto_5559 ?auto_5561 ) ) ( not ( = ?auto_5559 ?auto_5562 ) ) ( not ( = ?auto_5560 ?auto_5561 ) ) ( not ( = ?auto_5560 ?auto_5562 ) ) ( not ( = ?auto_5561 ?auto_5562 ) ) ( ON ?auto_5560 ?auto_5561 ) ( ON ?auto_5559 ?auto_5560 ) ( ON ?auto_5558 ?auto_5559 ) ( CLEAR ?auto_5558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5558 )
      ( MAKE-4PILE ?auto_5558 ?auto_5559 ?auto_5560 ?auto_5561 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5577 - BLOCK
      ?auto_5578 - BLOCK
      ?auto_5579 - BLOCK
      ?auto_5580 - BLOCK
      ?auto_5581 - BLOCK
    )
    :vars
    (
      ?auto_5582 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5580 ) ( ON ?auto_5581 ?auto_5582 ) ( CLEAR ?auto_5581 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5577 ) ( ON ?auto_5578 ?auto_5577 ) ( ON ?auto_5579 ?auto_5578 ) ( ON ?auto_5580 ?auto_5579 ) ( not ( = ?auto_5577 ?auto_5578 ) ) ( not ( = ?auto_5577 ?auto_5579 ) ) ( not ( = ?auto_5577 ?auto_5580 ) ) ( not ( = ?auto_5577 ?auto_5581 ) ) ( not ( = ?auto_5577 ?auto_5582 ) ) ( not ( = ?auto_5578 ?auto_5579 ) ) ( not ( = ?auto_5578 ?auto_5580 ) ) ( not ( = ?auto_5578 ?auto_5581 ) ) ( not ( = ?auto_5578 ?auto_5582 ) ) ( not ( = ?auto_5579 ?auto_5580 ) ) ( not ( = ?auto_5579 ?auto_5581 ) ) ( not ( = ?auto_5579 ?auto_5582 ) ) ( not ( = ?auto_5580 ?auto_5581 ) ) ( not ( = ?auto_5580 ?auto_5582 ) ) ( not ( = ?auto_5581 ?auto_5582 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5581 ?auto_5582 )
      ( !STACK ?auto_5581 ?auto_5580 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5588 - BLOCK
      ?auto_5589 - BLOCK
      ?auto_5590 - BLOCK
      ?auto_5591 - BLOCK
      ?auto_5592 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5591 ) ( ON-TABLE ?auto_5592 ) ( CLEAR ?auto_5592 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5588 ) ( ON ?auto_5589 ?auto_5588 ) ( ON ?auto_5590 ?auto_5589 ) ( ON ?auto_5591 ?auto_5590 ) ( not ( = ?auto_5588 ?auto_5589 ) ) ( not ( = ?auto_5588 ?auto_5590 ) ) ( not ( = ?auto_5588 ?auto_5591 ) ) ( not ( = ?auto_5588 ?auto_5592 ) ) ( not ( = ?auto_5589 ?auto_5590 ) ) ( not ( = ?auto_5589 ?auto_5591 ) ) ( not ( = ?auto_5589 ?auto_5592 ) ) ( not ( = ?auto_5590 ?auto_5591 ) ) ( not ( = ?auto_5590 ?auto_5592 ) ) ( not ( = ?auto_5591 ?auto_5592 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_5592 )
      ( !STACK ?auto_5592 ?auto_5591 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5598 - BLOCK
      ?auto_5599 - BLOCK
      ?auto_5600 - BLOCK
      ?auto_5601 - BLOCK
      ?auto_5602 - BLOCK
    )
    :vars
    (
      ?auto_5603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5602 ?auto_5603 ) ( ON-TABLE ?auto_5598 ) ( ON ?auto_5599 ?auto_5598 ) ( ON ?auto_5600 ?auto_5599 ) ( not ( = ?auto_5598 ?auto_5599 ) ) ( not ( = ?auto_5598 ?auto_5600 ) ) ( not ( = ?auto_5598 ?auto_5601 ) ) ( not ( = ?auto_5598 ?auto_5602 ) ) ( not ( = ?auto_5598 ?auto_5603 ) ) ( not ( = ?auto_5599 ?auto_5600 ) ) ( not ( = ?auto_5599 ?auto_5601 ) ) ( not ( = ?auto_5599 ?auto_5602 ) ) ( not ( = ?auto_5599 ?auto_5603 ) ) ( not ( = ?auto_5600 ?auto_5601 ) ) ( not ( = ?auto_5600 ?auto_5602 ) ) ( not ( = ?auto_5600 ?auto_5603 ) ) ( not ( = ?auto_5601 ?auto_5602 ) ) ( not ( = ?auto_5601 ?auto_5603 ) ) ( not ( = ?auto_5602 ?auto_5603 ) ) ( CLEAR ?auto_5600 ) ( ON ?auto_5601 ?auto_5602 ) ( CLEAR ?auto_5601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_5598 ?auto_5599 ?auto_5600 ?auto_5601 )
      ( MAKE-5PILE ?auto_5598 ?auto_5599 ?auto_5600 ?auto_5601 ?auto_5602 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5609 - BLOCK
      ?auto_5610 - BLOCK
      ?auto_5611 - BLOCK
      ?auto_5612 - BLOCK
      ?auto_5613 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5613 ) ( ON-TABLE ?auto_5609 ) ( ON ?auto_5610 ?auto_5609 ) ( ON ?auto_5611 ?auto_5610 ) ( not ( = ?auto_5609 ?auto_5610 ) ) ( not ( = ?auto_5609 ?auto_5611 ) ) ( not ( = ?auto_5609 ?auto_5612 ) ) ( not ( = ?auto_5609 ?auto_5613 ) ) ( not ( = ?auto_5610 ?auto_5611 ) ) ( not ( = ?auto_5610 ?auto_5612 ) ) ( not ( = ?auto_5610 ?auto_5613 ) ) ( not ( = ?auto_5611 ?auto_5612 ) ) ( not ( = ?auto_5611 ?auto_5613 ) ) ( not ( = ?auto_5612 ?auto_5613 ) ) ( CLEAR ?auto_5611 ) ( ON ?auto_5612 ?auto_5613 ) ( CLEAR ?auto_5612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_5609 ?auto_5610 ?auto_5611 ?auto_5612 )
      ( MAKE-5PILE ?auto_5609 ?auto_5610 ?auto_5611 ?auto_5612 ?auto_5613 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5619 - BLOCK
      ?auto_5620 - BLOCK
      ?auto_5621 - BLOCK
      ?auto_5622 - BLOCK
      ?auto_5623 - BLOCK
    )
    :vars
    (
      ?auto_5624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5623 ?auto_5624 ) ( ON-TABLE ?auto_5619 ) ( ON ?auto_5620 ?auto_5619 ) ( not ( = ?auto_5619 ?auto_5620 ) ) ( not ( = ?auto_5619 ?auto_5621 ) ) ( not ( = ?auto_5619 ?auto_5622 ) ) ( not ( = ?auto_5619 ?auto_5623 ) ) ( not ( = ?auto_5619 ?auto_5624 ) ) ( not ( = ?auto_5620 ?auto_5621 ) ) ( not ( = ?auto_5620 ?auto_5622 ) ) ( not ( = ?auto_5620 ?auto_5623 ) ) ( not ( = ?auto_5620 ?auto_5624 ) ) ( not ( = ?auto_5621 ?auto_5622 ) ) ( not ( = ?auto_5621 ?auto_5623 ) ) ( not ( = ?auto_5621 ?auto_5624 ) ) ( not ( = ?auto_5622 ?auto_5623 ) ) ( not ( = ?auto_5622 ?auto_5624 ) ) ( not ( = ?auto_5623 ?auto_5624 ) ) ( ON ?auto_5622 ?auto_5623 ) ( CLEAR ?auto_5620 ) ( ON ?auto_5621 ?auto_5622 ) ( CLEAR ?auto_5621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5619 ?auto_5620 ?auto_5621 )
      ( MAKE-5PILE ?auto_5619 ?auto_5620 ?auto_5621 ?auto_5622 ?auto_5623 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5630 - BLOCK
      ?auto_5631 - BLOCK
      ?auto_5632 - BLOCK
      ?auto_5633 - BLOCK
      ?auto_5634 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5634 ) ( ON-TABLE ?auto_5630 ) ( ON ?auto_5631 ?auto_5630 ) ( not ( = ?auto_5630 ?auto_5631 ) ) ( not ( = ?auto_5630 ?auto_5632 ) ) ( not ( = ?auto_5630 ?auto_5633 ) ) ( not ( = ?auto_5630 ?auto_5634 ) ) ( not ( = ?auto_5631 ?auto_5632 ) ) ( not ( = ?auto_5631 ?auto_5633 ) ) ( not ( = ?auto_5631 ?auto_5634 ) ) ( not ( = ?auto_5632 ?auto_5633 ) ) ( not ( = ?auto_5632 ?auto_5634 ) ) ( not ( = ?auto_5633 ?auto_5634 ) ) ( ON ?auto_5633 ?auto_5634 ) ( CLEAR ?auto_5631 ) ( ON ?auto_5632 ?auto_5633 ) ( CLEAR ?auto_5632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5630 ?auto_5631 ?auto_5632 )
      ( MAKE-5PILE ?auto_5630 ?auto_5631 ?auto_5632 ?auto_5633 ?auto_5634 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5640 - BLOCK
      ?auto_5641 - BLOCK
      ?auto_5642 - BLOCK
      ?auto_5643 - BLOCK
      ?auto_5644 - BLOCK
    )
    :vars
    (
      ?auto_5645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5644 ?auto_5645 ) ( ON-TABLE ?auto_5640 ) ( not ( = ?auto_5640 ?auto_5641 ) ) ( not ( = ?auto_5640 ?auto_5642 ) ) ( not ( = ?auto_5640 ?auto_5643 ) ) ( not ( = ?auto_5640 ?auto_5644 ) ) ( not ( = ?auto_5640 ?auto_5645 ) ) ( not ( = ?auto_5641 ?auto_5642 ) ) ( not ( = ?auto_5641 ?auto_5643 ) ) ( not ( = ?auto_5641 ?auto_5644 ) ) ( not ( = ?auto_5641 ?auto_5645 ) ) ( not ( = ?auto_5642 ?auto_5643 ) ) ( not ( = ?auto_5642 ?auto_5644 ) ) ( not ( = ?auto_5642 ?auto_5645 ) ) ( not ( = ?auto_5643 ?auto_5644 ) ) ( not ( = ?auto_5643 ?auto_5645 ) ) ( not ( = ?auto_5644 ?auto_5645 ) ) ( ON ?auto_5643 ?auto_5644 ) ( ON ?auto_5642 ?auto_5643 ) ( CLEAR ?auto_5640 ) ( ON ?auto_5641 ?auto_5642 ) ( CLEAR ?auto_5641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5640 ?auto_5641 )
      ( MAKE-5PILE ?auto_5640 ?auto_5641 ?auto_5642 ?auto_5643 ?auto_5644 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5651 - BLOCK
      ?auto_5652 - BLOCK
      ?auto_5653 - BLOCK
      ?auto_5654 - BLOCK
      ?auto_5655 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5655 ) ( ON-TABLE ?auto_5651 ) ( not ( = ?auto_5651 ?auto_5652 ) ) ( not ( = ?auto_5651 ?auto_5653 ) ) ( not ( = ?auto_5651 ?auto_5654 ) ) ( not ( = ?auto_5651 ?auto_5655 ) ) ( not ( = ?auto_5652 ?auto_5653 ) ) ( not ( = ?auto_5652 ?auto_5654 ) ) ( not ( = ?auto_5652 ?auto_5655 ) ) ( not ( = ?auto_5653 ?auto_5654 ) ) ( not ( = ?auto_5653 ?auto_5655 ) ) ( not ( = ?auto_5654 ?auto_5655 ) ) ( ON ?auto_5654 ?auto_5655 ) ( ON ?auto_5653 ?auto_5654 ) ( CLEAR ?auto_5651 ) ( ON ?auto_5652 ?auto_5653 ) ( CLEAR ?auto_5652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5651 ?auto_5652 )
      ( MAKE-5PILE ?auto_5651 ?auto_5652 ?auto_5653 ?auto_5654 ?auto_5655 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5661 - BLOCK
      ?auto_5662 - BLOCK
      ?auto_5663 - BLOCK
      ?auto_5664 - BLOCK
      ?auto_5665 - BLOCK
    )
    :vars
    (
      ?auto_5666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5665 ?auto_5666 ) ( not ( = ?auto_5661 ?auto_5662 ) ) ( not ( = ?auto_5661 ?auto_5663 ) ) ( not ( = ?auto_5661 ?auto_5664 ) ) ( not ( = ?auto_5661 ?auto_5665 ) ) ( not ( = ?auto_5661 ?auto_5666 ) ) ( not ( = ?auto_5662 ?auto_5663 ) ) ( not ( = ?auto_5662 ?auto_5664 ) ) ( not ( = ?auto_5662 ?auto_5665 ) ) ( not ( = ?auto_5662 ?auto_5666 ) ) ( not ( = ?auto_5663 ?auto_5664 ) ) ( not ( = ?auto_5663 ?auto_5665 ) ) ( not ( = ?auto_5663 ?auto_5666 ) ) ( not ( = ?auto_5664 ?auto_5665 ) ) ( not ( = ?auto_5664 ?auto_5666 ) ) ( not ( = ?auto_5665 ?auto_5666 ) ) ( ON ?auto_5664 ?auto_5665 ) ( ON ?auto_5663 ?auto_5664 ) ( ON ?auto_5662 ?auto_5663 ) ( ON ?auto_5661 ?auto_5662 ) ( CLEAR ?auto_5661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5661 )
      ( MAKE-5PILE ?auto_5661 ?auto_5662 ?auto_5663 ?auto_5664 ?auto_5665 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5672 - BLOCK
      ?auto_5673 - BLOCK
      ?auto_5674 - BLOCK
      ?auto_5675 - BLOCK
      ?auto_5676 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5676 ) ( not ( = ?auto_5672 ?auto_5673 ) ) ( not ( = ?auto_5672 ?auto_5674 ) ) ( not ( = ?auto_5672 ?auto_5675 ) ) ( not ( = ?auto_5672 ?auto_5676 ) ) ( not ( = ?auto_5673 ?auto_5674 ) ) ( not ( = ?auto_5673 ?auto_5675 ) ) ( not ( = ?auto_5673 ?auto_5676 ) ) ( not ( = ?auto_5674 ?auto_5675 ) ) ( not ( = ?auto_5674 ?auto_5676 ) ) ( not ( = ?auto_5675 ?auto_5676 ) ) ( ON ?auto_5675 ?auto_5676 ) ( ON ?auto_5674 ?auto_5675 ) ( ON ?auto_5673 ?auto_5674 ) ( ON ?auto_5672 ?auto_5673 ) ( CLEAR ?auto_5672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5672 )
      ( MAKE-5PILE ?auto_5672 ?auto_5673 ?auto_5674 ?auto_5675 ?auto_5676 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5682 - BLOCK
      ?auto_5683 - BLOCK
      ?auto_5684 - BLOCK
      ?auto_5685 - BLOCK
      ?auto_5686 - BLOCK
    )
    :vars
    (
      ?auto_5687 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5682 ?auto_5683 ) ) ( not ( = ?auto_5682 ?auto_5684 ) ) ( not ( = ?auto_5682 ?auto_5685 ) ) ( not ( = ?auto_5682 ?auto_5686 ) ) ( not ( = ?auto_5683 ?auto_5684 ) ) ( not ( = ?auto_5683 ?auto_5685 ) ) ( not ( = ?auto_5683 ?auto_5686 ) ) ( not ( = ?auto_5684 ?auto_5685 ) ) ( not ( = ?auto_5684 ?auto_5686 ) ) ( not ( = ?auto_5685 ?auto_5686 ) ) ( ON ?auto_5682 ?auto_5687 ) ( not ( = ?auto_5686 ?auto_5687 ) ) ( not ( = ?auto_5685 ?auto_5687 ) ) ( not ( = ?auto_5684 ?auto_5687 ) ) ( not ( = ?auto_5683 ?auto_5687 ) ) ( not ( = ?auto_5682 ?auto_5687 ) ) ( ON ?auto_5683 ?auto_5682 ) ( ON ?auto_5684 ?auto_5683 ) ( ON ?auto_5685 ?auto_5684 ) ( ON ?auto_5686 ?auto_5685 ) ( CLEAR ?auto_5686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_5686 ?auto_5685 ?auto_5684 ?auto_5683 ?auto_5682 )
      ( MAKE-5PILE ?auto_5682 ?auto_5683 ?auto_5684 ?auto_5685 ?auto_5686 ) )
  )

)

