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
      ?auto_3481 - BLOCK
      ?auto_3482 - BLOCK
      ?auto_3483 - BLOCK
    )
    :vars
    (
      ?auto_3484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3484 ?auto_3483 ) ( CLEAR ?auto_3484 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3481 ) ( ON ?auto_3482 ?auto_3481 ) ( ON ?auto_3483 ?auto_3482 ) ( not ( = ?auto_3481 ?auto_3482 ) ) ( not ( = ?auto_3481 ?auto_3483 ) ) ( not ( = ?auto_3481 ?auto_3484 ) ) ( not ( = ?auto_3482 ?auto_3483 ) ) ( not ( = ?auto_3482 ?auto_3484 ) ) ( not ( = ?auto_3483 ?auto_3484 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3484 ?auto_3483 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3486 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3486 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3486 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3487 - BLOCK
    )
    :vars
    (
      ?auto_3488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3487 ?auto_3488 ) ( CLEAR ?auto_3487 ) ( HAND-EMPTY ) ( not ( = ?auto_3487 ?auto_3488 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3487 ?auto_3488 )
      ( MAKE-1PILE ?auto_3487 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3491 - BLOCK
      ?auto_3492 - BLOCK
    )
    :vars
    (
      ?auto_3493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3493 ?auto_3492 ) ( CLEAR ?auto_3493 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3491 ) ( ON ?auto_3492 ?auto_3491 ) ( not ( = ?auto_3491 ?auto_3492 ) ) ( not ( = ?auto_3491 ?auto_3493 ) ) ( not ( = ?auto_3492 ?auto_3493 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3493 ?auto_3492 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3494 - BLOCK
      ?auto_3495 - BLOCK
    )
    :vars
    (
      ?auto_3496 - BLOCK
      ?auto_3497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3496 ?auto_3495 ) ( CLEAR ?auto_3496 ) ( ON-TABLE ?auto_3494 ) ( ON ?auto_3495 ?auto_3494 ) ( not ( = ?auto_3494 ?auto_3495 ) ) ( not ( = ?auto_3494 ?auto_3496 ) ) ( not ( = ?auto_3495 ?auto_3496 ) ) ( HOLDING ?auto_3497 ) ( not ( = ?auto_3494 ?auto_3497 ) ) ( not ( = ?auto_3495 ?auto_3497 ) ) ( not ( = ?auto_3496 ?auto_3497 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3497 )
      ( MAKE-2PILE ?auto_3494 ?auto_3495 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3498 - BLOCK
      ?auto_3499 - BLOCK
    )
    :vars
    (
      ?auto_3501 - BLOCK
      ?auto_3500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3501 ?auto_3499 ) ( ON-TABLE ?auto_3498 ) ( ON ?auto_3499 ?auto_3498 ) ( not ( = ?auto_3498 ?auto_3499 ) ) ( not ( = ?auto_3498 ?auto_3501 ) ) ( not ( = ?auto_3499 ?auto_3501 ) ) ( not ( = ?auto_3498 ?auto_3500 ) ) ( not ( = ?auto_3499 ?auto_3500 ) ) ( not ( = ?auto_3501 ?auto_3500 ) ) ( ON ?auto_3500 ?auto_3501 ) ( CLEAR ?auto_3500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3498 ?auto_3499 ?auto_3501 )
      ( MAKE-2PILE ?auto_3498 ?auto_3499 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3504 - BLOCK
      ?auto_3505 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3505 ) ( CLEAR ?auto_3504 ) ( ON-TABLE ?auto_3504 ) ( not ( = ?auto_3504 ?auto_3505 ) ) )
    :subtasks
    ( ( !STACK ?auto_3505 ?auto_3504 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3506 - BLOCK
      ?auto_3507 - BLOCK
    )
    :vars
    (
      ?auto_3508 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3506 ) ( ON-TABLE ?auto_3506 ) ( not ( = ?auto_3506 ?auto_3507 ) ) ( ON ?auto_3507 ?auto_3508 ) ( CLEAR ?auto_3507 ) ( HAND-EMPTY ) ( not ( = ?auto_3506 ?auto_3508 ) ) ( not ( = ?auto_3507 ?auto_3508 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3507 ?auto_3508 )
      ( MAKE-2PILE ?auto_3506 ?auto_3507 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3509 - BLOCK
      ?auto_3510 - BLOCK
    )
    :vars
    (
      ?auto_3511 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3509 ?auto_3510 ) ) ( ON ?auto_3510 ?auto_3511 ) ( CLEAR ?auto_3510 ) ( not ( = ?auto_3509 ?auto_3511 ) ) ( not ( = ?auto_3510 ?auto_3511 ) ) ( HOLDING ?auto_3509 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3509 )
      ( MAKE-2PILE ?auto_3509 ?auto_3510 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3512 - BLOCK
      ?auto_3513 - BLOCK
    )
    :vars
    (
      ?auto_3514 - BLOCK
      ?auto_3515 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3512 ?auto_3513 ) ) ( ON ?auto_3513 ?auto_3514 ) ( not ( = ?auto_3512 ?auto_3514 ) ) ( not ( = ?auto_3513 ?auto_3514 ) ) ( ON ?auto_3512 ?auto_3513 ) ( CLEAR ?auto_3512 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3515 ) ( ON ?auto_3514 ?auto_3515 ) ( not ( = ?auto_3515 ?auto_3514 ) ) ( not ( = ?auto_3515 ?auto_3513 ) ) ( not ( = ?auto_3515 ?auto_3512 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3515 ?auto_3514 ?auto_3513 )
      ( MAKE-2PILE ?auto_3512 ?auto_3513 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3517 - BLOCK
    )
    :vars
    (
      ?auto_3518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3518 ?auto_3517 ) ( CLEAR ?auto_3518 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3517 ) ( not ( = ?auto_3517 ?auto_3518 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3518 ?auto_3517 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3519 - BLOCK
    )
    :vars
    (
      ?auto_3520 - BLOCK
      ?auto_3521 - BLOCK
      ?auto_3522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3520 ?auto_3519 ) ( CLEAR ?auto_3520 ) ( ON-TABLE ?auto_3519 ) ( not ( = ?auto_3519 ?auto_3520 ) ) ( HOLDING ?auto_3521 ) ( CLEAR ?auto_3522 ) ( not ( = ?auto_3519 ?auto_3521 ) ) ( not ( = ?auto_3519 ?auto_3522 ) ) ( not ( = ?auto_3520 ?auto_3521 ) ) ( not ( = ?auto_3520 ?auto_3522 ) ) ( not ( = ?auto_3521 ?auto_3522 ) ) )
    :subtasks
    ( ( !STACK ?auto_3521 ?auto_3522 )
      ( MAKE-1PILE ?auto_3519 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3609 - BLOCK
    )
    :vars
    (
      ?auto_3611 - BLOCK
      ?auto_3610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3611 ?auto_3609 ) ( ON-TABLE ?auto_3609 ) ( not ( = ?auto_3609 ?auto_3611 ) ) ( not ( = ?auto_3609 ?auto_3610 ) ) ( not ( = ?auto_3611 ?auto_3610 ) ) ( ON ?auto_3610 ?auto_3611 ) ( CLEAR ?auto_3610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3609 ?auto_3611 )
      ( MAKE-1PILE ?auto_3609 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3527 - BLOCK
    )
    :vars
    (
      ?auto_3530 - BLOCK
      ?auto_3529 - BLOCK
      ?auto_3528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3530 ?auto_3527 ) ( ON-TABLE ?auto_3527 ) ( not ( = ?auto_3527 ?auto_3530 ) ) ( not ( = ?auto_3527 ?auto_3529 ) ) ( not ( = ?auto_3527 ?auto_3528 ) ) ( not ( = ?auto_3530 ?auto_3529 ) ) ( not ( = ?auto_3530 ?auto_3528 ) ) ( not ( = ?auto_3529 ?auto_3528 ) ) ( ON ?auto_3529 ?auto_3530 ) ( CLEAR ?auto_3529 ) ( HOLDING ?auto_3528 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3528 )
      ( MAKE-1PILE ?auto_3527 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3531 - BLOCK
    )
    :vars
    (
      ?auto_3533 - BLOCK
      ?auto_3532 - BLOCK
      ?auto_3534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3533 ?auto_3531 ) ( ON-TABLE ?auto_3531 ) ( not ( = ?auto_3531 ?auto_3533 ) ) ( not ( = ?auto_3531 ?auto_3532 ) ) ( not ( = ?auto_3531 ?auto_3534 ) ) ( not ( = ?auto_3533 ?auto_3532 ) ) ( not ( = ?auto_3533 ?auto_3534 ) ) ( not ( = ?auto_3532 ?auto_3534 ) ) ( ON ?auto_3532 ?auto_3533 ) ( ON ?auto_3534 ?auto_3532 ) ( CLEAR ?auto_3534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3531 ?auto_3533 ?auto_3532 )
      ( MAKE-1PILE ?auto_3531 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3538 - BLOCK
      ?auto_3539 - BLOCK
      ?auto_3540 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3540 ) ( CLEAR ?auto_3539 ) ( ON-TABLE ?auto_3538 ) ( ON ?auto_3539 ?auto_3538 ) ( not ( = ?auto_3538 ?auto_3539 ) ) ( not ( = ?auto_3538 ?auto_3540 ) ) ( not ( = ?auto_3539 ?auto_3540 ) ) )
    :subtasks
    ( ( !STACK ?auto_3540 ?auto_3539 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3541 - BLOCK
      ?auto_3542 - BLOCK
      ?auto_3543 - BLOCK
    )
    :vars
    (
      ?auto_3544 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3542 ) ( ON-TABLE ?auto_3541 ) ( ON ?auto_3542 ?auto_3541 ) ( not ( = ?auto_3541 ?auto_3542 ) ) ( not ( = ?auto_3541 ?auto_3543 ) ) ( not ( = ?auto_3542 ?auto_3543 ) ) ( ON ?auto_3543 ?auto_3544 ) ( CLEAR ?auto_3543 ) ( HAND-EMPTY ) ( not ( = ?auto_3541 ?auto_3544 ) ) ( not ( = ?auto_3542 ?auto_3544 ) ) ( not ( = ?auto_3543 ?auto_3544 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3543 ?auto_3544 )
      ( MAKE-3PILE ?auto_3541 ?auto_3542 ?auto_3543 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3545 - BLOCK
      ?auto_3546 - BLOCK
      ?auto_3547 - BLOCK
    )
    :vars
    (
      ?auto_3548 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3545 ) ( not ( = ?auto_3545 ?auto_3546 ) ) ( not ( = ?auto_3545 ?auto_3547 ) ) ( not ( = ?auto_3546 ?auto_3547 ) ) ( ON ?auto_3547 ?auto_3548 ) ( CLEAR ?auto_3547 ) ( not ( = ?auto_3545 ?auto_3548 ) ) ( not ( = ?auto_3546 ?auto_3548 ) ) ( not ( = ?auto_3547 ?auto_3548 ) ) ( HOLDING ?auto_3546 ) ( CLEAR ?auto_3545 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3545 ?auto_3546 )
      ( MAKE-3PILE ?auto_3545 ?auto_3546 ?auto_3547 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3549 - BLOCK
      ?auto_3550 - BLOCK
      ?auto_3551 - BLOCK
    )
    :vars
    (
      ?auto_3552 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3549 ) ( not ( = ?auto_3549 ?auto_3550 ) ) ( not ( = ?auto_3549 ?auto_3551 ) ) ( not ( = ?auto_3550 ?auto_3551 ) ) ( ON ?auto_3551 ?auto_3552 ) ( not ( = ?auto_3549 ?auto_3552 ) ) ( not ( = ?auto_3550 ?auto_3552 ) ) ( not ( = ?auto_3551 ?auto_3552 ) ) ( CLEAR ?auto_3549 ) ( ON ?auto_3550 ?auto_3551 ) ( CLEAR ?auto_3550 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3552 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3552 ?auto_3551 )
      ( MAKE-3PILE ?auto_3549 ?auto_3550 ?auto_3551 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3553 - BLOCK
      ?auto_3554 - BLOCK
      ?auto_3555 - BLOCK
    )
    :vars
    (
      ?auto_3556 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3553 ?auto_3554 ) ) ( not ( = ?auto_3553 ?auto_3555 ) ) ( not ( = ?auto_3554 ?auto_3555 ) ) ( ON ?auto_3555 ?auto_3556 ) ( not ( = ?auto_3553 ?auto_3556 ) ) ( not ( = ?auto_3554 ?auto_3556 ) ) ( not ( = ?auto_3555 ?auto_3556 ) ) ( ON ?auto_3554 ?auto_3555 ) ( CLEAR ?auto_3554 ) ( ON-TABLE ?auto_3556 ) ( HOLDING ?auto_3553 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3553 )
      ( MAKE-3PILE ?auto_3553 ?auto_3554 ?auto_3555 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3557 - BLOCK
      ?auto_3558 - BLOCK
      ?auto_3559 - BLOCK
    )
    :vars
    (
      ?auto_3560 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3557 ?auto_3558 ) ) ( not ( = ?auto_3557 ?auto_3559 ) ) ( not ( = ?auto_3558 ?auto_3559 ) ) ( ON ?auto_3559 ?auto_3560 ) ( not ( = ?auto_3557 ?auto_3560 ) ) ( not ( = ?auto_3558 ?auto_3560 ) ) ( not ( = ?auto_3559 ?auto_3560 ) ) ( ON ?auto_3558 ?auto_3559 ) ( ON-TABLE ?auto_3560 ) ( ON ?auto_3557 ?auto_3558 ) ( CLEAR ?auto_3557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3560 ?auto_3559 ?auto_3558 )
      ( MAKE-3PILE ?auto_3557 ?auto_3558 ?auto_3559 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3587 - BLOCK
    )
    :vars
    (
      ?auto_3588 - BLOCK
      ?auto_3589 - BLOCK
      ?auto_3590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3587 ?auto_3588 ) ( CLEAR ?auto_3587 ) ( not ( = ?auto_3587 ?auto_3588 ) ) ( HOLDING ?auto_3589 ) ( CLEAR ?auto_3590 ) ( not ( = ?auto_3587 ?auto_3589 ) ) ( not ( = ?auto_3587 ?auto_3590 ) ) ( not ( = ?auto_3588 ?auto_3589 ) ) ( not ( = ?auto_3588 ?auto_3590 ) ) ( not ( = ?auto_3589 ?auto_3590 ) ) )
    :subtasks
    ( ( !STACK ?auto_3589 ?auto_3590 )
      ( MAKE-1PILE ?auto_3587 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3591 - BLOCK
    )
    :vars
    (
      ?auto_3593 - BLOCK
      ?auto_3594 - BLOCK
      ?auto_3592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3591 ?auto_3593 ) ( not ( = ?auto_3591 ?auto_3593 ) ) ( CLEAR ?auto_3594 ) ( not ( = ?auto_3591 ?auto_3592 ) ) ( not ( = ?auto_3591 ?auto_3594 ) ) ( not ( = ?auto_3593 ?auto_3592 ) ) ( not ( = ?auto_3593 ?auto_3594 ) ) ( not ( = ?auto_3592 ?auto_3594 ) ) ( ON ?auto_3592 ?auto_3591 ) ( CLEAR ?auto_3592 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3593 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3593 ?auto_3591 )
      ( MAKE-1PILE ?auto_3591 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3595 - BLOCK
    )
    :vars
    (
      ?auto_3596 - BLOCK
      ?auto_3598 - BLOCK
      ?auto_3597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3595 ?auto_3596 ) ( not ( = ?auto_3595 ?auto_3596 ) ) ( not ( = ?auto_3595 ?auto_3598 ) ) ( not ( = ?auto_3595 ?auto_3597 ) ) ( not ( = ?auto_3596 ?auto_3598 ) ) ( not ( = ?auto_3596 ?auto_3597 ) ) ( not ( = ?auto_3598 ?auto_3597 ) ) ( ON ?auto_3598 ?auto_3595 ) ( CLEAR ?auto_3598 ) ( ON-TABLE ?auto_3596 ) ( HOLDING ?auto_3597 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3597 )
      ( MAKE-1PILE ?auto_3595 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3599 - BLOCK
    )
    :vars
    (
      ?auto_3601 - BLOCK
      ?auto_3600 - BLOCK
      ?auto_3602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3599 ?auto_3601 ) ( not ( = ?auto_3599 ?auto_3601 ) ) ( not ( = ?auto_3599 ?auto_3600 ) ) ( not ( = ?auto_3599 ?auto_3602 ) ) ( not ( = ?auto_3601 ?auto_3600 ) ) ( not ( = ?auto_3601 ?auto_3602 ) ) ( not ( = ?auto_3600 ?auto_3602 ) ) ( ON ?auto_3600 ?auto_3599 ) ( ON-TABLE ?auto_3601 ) ( ON ?auto_3602 ?auto_3600 ) ( CLEAR ?auto_3602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3601 ?auto_3599 ?auto_3600 )
      ( MAKE-1PILE ?auto_3599 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3606 - BLOCK
    )
    :vars
    (
      ?auto_3607 - BLOCK
      ?auto_3608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3607 ?auto_3606 ) ( CLEAR ?auto_3607 ) ( ON-TABLE ?auto_3606 ) ( not ( = ?auto_3606 ?auto_3607 ) ) ( HOLDING ?auto_3608 ) ( not ( = ?auto_3606 ?auto_3608 ) ) ( not ( = ?auto_3607 ?auto_3608 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3608 )
      ( MAKE-1PILE ?auto_3606 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3631 - BLOCK
      ?auto_3632 - BLOCK
    )
    :vars
    (
      ?auto_3633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3631 ?auto_3632 ) ) ( ON ?auto_3632 ?auto_3633 ) ( not ( = ?auto_3631 ?auto_3633 ) ) ( not ( = ?auto_3632 ?auto_3633 ) ) ( ON ?auto_3631 ?auto_3632 ) ( CLEAR ?auto_3631 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3633 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3633 ?auto_3632 )
      ( MAKE-2PILE ?auto_3631 ?auto_3632 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3636 - BLOCK
      ?auto_3637 - BLOCK
    )
    :vars
    (
      ?auto_3638 - BLOCK
      ?auto_3639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3636 ?auto_3637 ) ) ( ON ?auto_3637 ?auto_3638 ) ( CLEAR ?auto_3637 ) ( not ( = ?auto_3636 ?auto_3638 ) ) ( not ( = ?auto_3637 ?auto_3638 ) ) ( ON ?auto_3636 ?auto_3639 ) ( CLEAR ?auto_3636 ) ( HAND-EMPTY ) ( not ( = ?auto_3636 ?auto_3639 ) ) ( not ( = ?auto_3637 ?auto_3639 ) ) ( not ( = ?auto_3638 ?auto_3639 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3636 ?auto_3639 )
      ( MAKE-2PILE ?auto_3636 ?auto_3637 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3640 - BLOCK
      ?auto_3641 - BLOCK
    )
    :vars
    (
      ?auto_3643 - BLOCK
      ?auto_3642 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3640 ?auto_3641 ) ) ( not ( = ?auto_3640 ?auto_3643 ) ) ( not ( = ?auto_3641 ?auto_3643 ) ) ( ON ?auto_3640 ?auto_3642 ) ( CLEAR ?auto_3640 ) ( not ( = ?auto_3640 ?auto_3642 ) ) ( not ( = ?auto_3641 ?auto_3642 ) ) ( not ( = ?auto_3643 ?auto_3642 ) ) ( HOLDING ?auto_3641 ) ( CLEAR ?auto_3643 ) ( ON-TABLE ?auto_3643 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3643 ?auto_3641 )
      ( MAKE-2PILE ?auto_3640 ?auto_3641 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3644 - BLOCK
      ?auto_3645 - BLOCK
    )
    :vars
    (
      ?auto_3646 - BLOCK
      ?auto_3647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3644 ?auto_3645 ) ) ( not ( = ?auto_3644 ?auto_3646 ) ) ( not ( = ?auto_3645 ?auto_3646 ) ) ( ON ?auto_3644 ?auto_3647 ) ( not ( = ?auto_3644 ?auto_3647 ) ) ( not ( = ?auto_3645 ?auto_3647 ) ) ( not ( = ?auto_3646 ?auto_3647 ) ) ( CLEAR ?auto_3646 ) ( ON-TABLE ?auto_3646 ) ( ON ?auto_3645 ?auto_3644 ) ( CLEAR ?auto_3645 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3647 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3647 ?auto_3644 )
      ( MAKE-2PILE ?auto_3644 ?auto_3645 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3648 - BLOCK
      ?auto_3649 - BLOCK
    )
    :vars
    (
      ?auto_3651 - BLOCK
      ?auto_3650 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3648 ?auto_3649 ) ) ( not ( = ?auto_3648 ?auto_3651 ) ) ( not ( = ?auto_3649 ?auto_3651 ) ) ( ON ?auto_3648 ?auto_3650 ) ( not ( = ?auto_3648 ?auto_3650 ) ) ( not ( = ?auto_3649 ?auto_3650 ) ) ( not ( = ?auto_3651 ?auto_3650 ) ) ( ON ?auto_3649 ?auto_3648 ) ( CLEAR ?auto_3649 ) ( ON-TABLE ?auto_3650 ) ( HOLDING ?auto_3651 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3651 )
      ( MAKE-2PILE ?auto_3648 ?auto_3649 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3652 - BLOCK
      ?auto_3653 - BLOCK
    )
    :vars
    (
      ?auto_3655 - BLOCK
      ?auto_3654 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3652 ?auto_3653 ) ) ( not ( = ?auto_3652 ?auto_3655 ) ) ( not ( = ?auto_3653 ?auto_3655 ) ) ( ON ?auto_3652 ?auto_3654 ) ( not ( = ?auto_3652 ?auto_3654 ) ) ( not ( = ?auto_3653 ?auto_3654 ) ) ( not ( = ?auto_3655 ?auto_3654 ) ) ( ON ?auto_3653 ?auto_3652 ) ( ON-TABLE ?auto_3654 ) ( ON ?auto_3655 ?auto_3653 ) ( CLEAR ?auto_3655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3654 ?auto_3652 ?auto_3653 )
      ( MAKE-2PILE ?auto_3652 ?auto_3653 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3662 - BLOCK
      ?auto_3663 - BLOCK
      ?auto_3664 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3663 ) ( ON-TABLE ?auto_3662 ) ( ON ?auto_3663 ?auto_3662 ) ( not ( = ?auto_3662 ?auto_3663 ) ) ( not ( = ?auto_3662 ?auto_3664 ) ) ( not ( = ?auto_3663 ?auto_3664 ) ) ( ON-TABLE ?auto_3664 ) ( CLEAR ?auto_3664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_3664 )
      ( MAKE-3PILE ?auto_3662 ?auto_3663 ?auto_3664 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3665 - BLOCK
      ?auto_3666 - BLOCK
      ?auto_3667 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3665 ) ( not ( = ?auto_3665 ?auto_3666 ) ) ( not ( = ?auto_3665 ?auto_3667 ) ) ( not ( = ?auto_3666 ?auto_3667 ) ) ( ON-TABLE ?auto_3667 ) ( CLEAR ?auto_3667 ) ( HOLDING ?auto_3666 ) ( CLEAR ?auto_3665 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3665 ?auto_3666 )
      ( MAKE-3PILE ?auto_3665 ?auto_3666 ?auto_3667 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3668 - BLOCK
      ?auto_3669 - BLOCK
      ?auto_3670 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3668 ) ( not ( = ?auto_3668 ?auto_3669 ) ) ( not ( = ?auto_3668 ?auto_3670 ) ) ( not ( = ?auto_3669 ?auto_3670 ) ) ( ON-TABLE ?auto_3670 ) ( CLEAR ?auto_3668 ) ( ON ?auto_3669 ?auto_3670 ) ( CLEAR ?auto_3669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3670 )
      ( MAKE-3PILE ?auto_3668 ?auto_3669 ?auto_3670 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3671 - BLOCK
      ?auto_3672 - BLOCK
      ?auto_3673 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3671 ?auto_3672 ) ) ( not ( = ?auto_3671 ?auto_3673 ) ) ( not ( = ?auto_3672 ?auto_3673 ) ) ( ON-TABLE ?auto_3673 ) ( ON ?auto_3672 ?auto_3673 ) ( CLEAR ?auto_3672 ) ( HOLDING ?auto_3671 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3671 )
      ( MAKE-3PILE ?auto_3671 ?auto_3672 ?auto_3673 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3674 - BLOCK
      ?auto_3675 - BLOCK
      ?auto_3676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3674 ?auto_3675 ) ) ( not ( = ?auto_3674 ?auto_3676 ) ) ( not ( = ?auto_3675 ?auto_3676 ) ) ( ON-TABLE ?auto_3676 ) ( ON ?auto_3675 ?auto_3676 ) ( ON ?auto_3674 ?auto_3675 ) ( CLEAR ?auto_3674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3676 ?auto_3675 )
      ( MAKE-3PILE ?auto_3674 ?auto_3675 ?auto_3676 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3680 - BLOCK
      ?auto_3681 - BLOCK
      ?auto_3682 - BLOCK
    )
    :vars
    (
      ?auto_3683 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3680 ?auto_3681 ) ) ( not ( = ?auto_3680 ?auto_3682 ) ) ( not ( = ?auto_3681 ?auto_3682 ) ) ( ON-TABLE ?auto_3682 ) ( ON ?auto_3681 ?auto_3682 ) ( CLEAR ?auto_3681 ) ( ON ?auto_3680 ?auto_3683 ) ( CLEAR ?auto_3680 ) ( HAND-EMPTY ) ( not ( = ?auto_3680 ?auto_3683 ) ) ( not ( = ?auto_3681 ?auto_3683 ) ) ( not ( = ?auto_3682 ?auto_3683 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3680 ?auto_3683 )
      ( MAKE-3PILE ?auto_3680 ?auto_3681 ?auto_3682 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3684 - BLOCK
      ?auto_3685 - BLOCK
      ?auto_3686 - BLOCK
    )
    :vars
    (
      ?auto_3687 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3684 ?auto_3685 ) ) ( not ( = ?auto_3684 ?auto_3686 ) ) ( not ( = ?auto_3685 ?auto_3686 ) ) ( ON-TABLE ?auto_3686 ) ( ON ?auto_3684 ?auto_3687 ) ( CLEAR ?auto_3684 ) ( not ( = ?auto_3684 ?auto_3687 ) ) ( not ( = ?auto_3685 ?auto_3687 ) ) ( not ( = ?auto_3686 ?auto_3687 ) ) ( HOLDING ?auto_3685 ) ( CLEAR ?auto_3686 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3686 ?auto_3685 )
      ( MAKE-3PILE ?auto_3684 ?auto_3685 ?auto_3686 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3688 - BLOCK
      ?auto_3689 - BLOCK
      ?auto_3690 - BLOCK
    )
    :vars
    (
      ?auto_3691 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3688 ?auto_3689 ) ) ( not ( = ?auto_3688 ?auto_3690 ) ) ( not ( = ?auto_3689 ?auto_3690 ) ) ( ON-TABLE ?auto_3690 ) ( ON ?auto_3688 ?auto_3691 ) ( not ( = ?auto_3688 ?auto_3691 ) ) ( not ( = ?auto_3689 ?auto_3691 ) ) ( not ( = ?auto_3690 ?auto_3691 ) ) ( CLEAR ?auto_3690 ) ( ON ?auto_3689 ?auto_3688 ) ( CLEAR ?auto_3689 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3691 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3691 ?auto_3688 )
      ( MAKE-3PILE ?auto_3688 ?auto_3689 ?auto_3690 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3692 - BLOCK
      ?auto_3693 - BLOCK
      ?auto_3694 - BLOCK
    )
    :vars
    (
      ?auto_3695 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3692 ?auto_3693 ) ) ( not ( = ?auto_3692 ?auto_3694 ) ) ( not ( = ?auto_3693 ?auto_3694 ) ) ( ON ?auto_3692 ?auto_3695 ) ( not ( = ?auto_3692 ?auto_3695 ) ) ( not ( = ?auto_3693 ?auto_3695 ) ) ( not ( = ?auto_3694 ?auto_3695 ) ) ( ON ?auto_3693 ?auto_3692 ) ( CLEAR ?auto_3693 ) ( ON-TABLE ?auto_3695 ) ( HOLDING ?auto_3694 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3694 )
      ( MAKE-3PILE ?auto_3692 ?auto_3693 ?auto_3694 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3696 - BLOCK
      ?auto_3697 - BLOCK
      ?auto_3698 - BLOCK
    )
    :vars
    (
      ?auto_3699 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3696 ?auto_3697 ) ) ( not ( = ?auto_3696 ?auto_3698 ) ) ( not ( = ?auto_3697 ?auto_3698 ) ) ( ON ?auto_3696 ?auto_3699 ) ( not ( = ?auto_3696 ?auto_3699 ) ) ( not ( = ?auto_3697 ?auto_3699 ) ) ( not ( = ?auto_3698 ?auto_3699 ) ) ( ON ?auto_3697 ?auto_3696 ) ( ON-TABLE ?auto_3699 ) ( ON ?auto_3698 ?auto_3697 ) ( CLEAR ?auto_3698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3699 ?auto_3696 ?auto_3697 )
      ( MAKE-3PILE ?auto_3696 ?auto_3697 ?auto_3698 ) )
  )

)

