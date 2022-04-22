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
      ?auto_3471 - BLOCK
    )
    :vars
    (
      ?auto_3472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3471 ?auto_3472 ) ( CLEAR ?auto_3471 ) ( HAND-EMPTY ) ( not ( = ?auto_3471 ?auto_3472 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3471 ?auto_3472 )
      ( !PUTDOWN ?auto_3471 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3474 - BLOCK
    )
    :vars
    (
      ?auto_3475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3474 ?auto_3475 ) ( CLEAR ?auto_3474 ) ( HAND-EMPTY ) ( not ( = ?auto_3474 ?auto_3475 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3474 ?auto_3475 )
      ( !PUTDOWN ?auto_3474 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3478 - BLOCK
      ?auto_3479 - BLOCK
    )
    :vars
    (
      ?auto_3480 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3478 ) ( ON ?auto_3479 ?auto_3480 ) ( CLEAR ?auto_3479 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3478 ) ( not ( = ?auto_3478 ?auto_3479 ) ) ( not ( = ?auto_3478 ?auto_3480 ) ) ( not ( = ?auto_3479 ?auto_3480 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3479 ?auto_3480 )
      ( !STACK ?auto_3479 ?auto_3478 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3483 - BLOCK
      ?auto_3484 - BLOCK
    )
    :vars
    (
      ?auto_3485 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3483 ) ( ON ?auto_3484 ?auto_3485 ) ( CLEAR ?auto_3484 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3483 ) ( not ( = ?auto_3483 ?auto_3484 ) ) ( not ( = ?auto_3483 ?auto_3485 ) ) ( not ( = ?auto_3484 ?auto_3485 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3484 ?auto_3485 )
      ( !STACK ?auto_3484 ?auto_3483 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3488 - BLOCK
      ?auto_3489 - BLOCK
    )
    :vars
    (
      ?auto_3490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3489 ?auto_3490 ) ( not ( = ?auto_3488 ?auto_3489 ) ) ( not ( = ?auto_3488 ?auto_3490 ) ) ( not ( = ?auto_3489 ?auto_3490 ) ) ( ON ?auto_3488 ?auto_3489 ) ( CLEAR ?auto_3488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3488 )
      ( MAKE-2PILE ?auto_3488 ?auto_3489 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3493 - BLOCK
      ?auto_3494 - BLOCK
    )
    :vars
    (
      ?auto_3495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3494 ?auto_3495 ) ( not ( = ?auto_3493 ?auto_3494 ) ) ( not ( = ?auto_3493 ?auto_3495 ) ) ( not ( = ?auto_3494 ?auto_3495 ) ) ( ON ?auto_3493 ?auto_3494 ) ( CLEAR ?auto_3493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3493 )
      ( MAKE-2PILE ?auto_3493 ?auto_3494 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3499 - BLOCK
      ?auto_3500 - BLOCK
      ?auto_3501 - BLOCK
    )
    :vars
    (
      ?auto_3502 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3500 ) ( ON ?auto_3501 ?auto_3502 ) ( CLEAR ?auto_3501 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3499 ) ( ON ?auto_3500 ?auto_3499 ) ( not ( = ?auto_3499 ?auto_3500 ) ) ( not ( = ?auto_3499 ?auto_3501 ) ) ( not ( = ?auto_3499 ?auto_3502 ) ) ( not ( = ?auto_3500 ?auto_3501 ) ) ( not ( = ?auto_3500 ?auto_3502 ) ) ( not ( = ?auto_3501 ?auto_3502 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3501 ?auto_3502 )
      ( !STACK ?auto_3501 ?auto_3500 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3506 - BLOCK
      ?auto_3507 - BLOCK
      ?auto_3508 - BLOCK
    )
    :vars
    (
      ?auto_3509 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3507 ) ( ON ?auto_3508 ?auto_3509 ) ( CLEAR ?auto_3508 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3506 ) ( ON ?auto_3507 ?auto_3506 ) ( not ( = ?auto_3506 ?auto_3507 ) ) ( not ( = ?auto_3506 ?auto_3508 ) ) ( not ( = ?auto_3506 ?auto_3509 ) ) ( not ( = ?auto_3507 ?auto_3508 ) ) ( not ( = ?auto_3507 ?auto_3509 ) ) ( not ( = ?auto_3508 ?auto_3509 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3508 ?auto_3509 )
      ( !STACK ?auto_3508 ?auto_3507 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3513 - BLOCK
      ?auto_3514 - BLOCK
      ?auto_3515 - BLOCK
    )
    :vars
    (
      ?auto_3516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3515 ?auto_3516 ) ( ON-TABLE ?auto_3513 ) ( not ( = ?auto_3513 ?auto_3514 ) ) ( not ( = ?auto_3513 ?auto_3515 ) ) ( not ( = ?auto_3513 ?auto_3516 ) ) ( not ( = ?auto_3514 ?auto_3515 ) ) ( not ( = ?auto_3514 ?auto_3516 ) ) ( not ( = ?auto_3515 ?auto_3516 ) ) ( CLEAR ?auto_3513 ) ( ON ?auto_3514 ?auto_3515 ) ( CLEAR ?auto_3514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3513 ?auto_3514 )
      ( MAKE-3PILE ?auto_3513 ?auto_3514 ?auto_3515 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3520 - BLOCK
      ?auto_3521 - BLOCK
      ?auto_3522 - BLOCK
    )
    :vars
    (
      ?auto_3523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3522 ?auto_3523 ) ( ON-TABLE ?auto_3520 ) ( not ( = ?auto_3520 ?auto_3521 ) ) ( not ( = ?auto_3520 ?auto_3522 ) ) ( not ( = ?auto_3520 ?auto_3523 ) ) ( not ( = ?auto_3521 ?auto_3522 ) ) ( not ( = ?auto_3521 ?auto_3523 ) ) ( not ( = ?auto_3522 ?auto_3523 ) ) ( CLEAR ?auto_3520 ) ( ON ?auto_3521 ?auto_3522 ) ( CLEAR ?auto_3521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3520 ?auto_3521 )
      ( MAKE-3PILE ?auto_3520 ?auto_3521 ?auto_3522 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3527 - BLOCK
      ?auto_3528 - BLOCK
      ?auto_3529 - BLOCK
    )
    :vars
    (
      ?auto_3530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3529 ?auto_3530 ) ( not ( = ?auto_3527 ?auto_3528 ) ) ( not ( = ?auto_3527 ?auto_3529 ) ) ( not ( = ?auto_3527 ?auto_3530 ) ) ( not ( = ?auto_3528 ?auto_3529 ) ) ( not ( = ?auto_3528 ?auto_3530 ) ) ( not ( = ?auto_3529 ?auto_3530 ) ) ( ON ?auto_3528 ?auto_3529 ) ( ON ?auto_3527 ?auto_3528 ) ( CLEAR ?auto_3527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3527 )
      ( MAKE-3PILE ?auto_3527 ?auto_3528 ?auto_3529 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3534 - BLOCK
      ?auto_3535 - BLOCK
      ?auto_3536 - BLOCK
    )
    :vars
    (
      ?auto_3537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3536 ?auto_3537 ) ( not ( = ?auto_3534 ?auto_3535 ) ) ( not ( = ?auto_3534 ?auto_3536 ) ) ( not ( = ?auto_3534 ?auto_3537 ) ) ( not ( = ?auto_3535 ?auto_3536 ) ) ( not ( = ?auto_3535 ?auto_3537 ) ) ( not ( = ?auto_3536 ?auto_3537 ) ) ( ON ?auto_3535 ?auto_3536 ) ( ON ?auto_3534 ?auto_3535 ) ( CLEAR ?auto_3534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3534 )
      ( MAKE-3PILE ?auto_3534 ?auto_3535 ?auto_3536 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3542 - BLOCK
      ?auto_3543 - BLOCK
      ?auto_3544 - BLOCK
      ?auto_3545 - BLOCK
    )
    :vars
    (
      ?auto_3546 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3544 ) ( ON ?auto_3545 ?auto_3546 ) ( CLEAR ?auto_3545 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3542 ) ( ON ?auto_3543 ?auto_3542 ) ( ON ?auto_3544 ?auto_3543 ) ( not ( = ?auto_3542 ?auto_3543 ) ) ( not ( = ?auto_3542 ?auto_3544 ) ) ( not ( = ?auto_3542 ?auto_3545 ) ) ( not ( = ?auto_3542 ?auto_3546 ) ) ( not ( = ?auto_3543 ?auto_3544 ) ) ( not ( = ?auto_3543 ?auto_3545 ) ) ( not ( = ?auto_3543 ?auto_3546 ) ) ( not ( = ?auto_3544 ?auto_3545 ) ) ( not ( = ?auto_3544 ?auto_3546 ) ) ( not ( = ?auto_3545 ?auto_3546 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3545 ?auto_3546 )
      ( !STACK ?auto_3545 ?auto_3544 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3551 - BLOCK
      ?auto_3552 - BLOCK
      ?auto_3553 - BLOCK
      ?auto_3554 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3553 ) ( ON-TABLE ?auto_3554 ) ( CLEAR ?auto_3554 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3551 ) ( ON ?auto_3552 ?auto_3551 ) ( ON ?auto_3553 ?auto_3552 ) ( not ( = ?auto_3551 ?auto_3552 ) ) ( not ( = ?auto_3551 ?auto_3553 ) ) ( not ( = ?auto_3551 ?auto_3554 ) ) ( not ( = ?auto_3552 ?auto_3553 ) ) ( not ( = ?auto_3552 ?auto_3554 ) ) ( not ( = ?auto_3553 ?auto_3554 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_3554 )
      ( !STACK ?auto_3554 ?auto_3553 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3559 - BLOCK
      ?auto_3560 - BLOCK
      ?auto_3561 - BLOCK
      ?auto_3562 - BLOCK
    )
    :vars
    (
      ?auto_3563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3562 ?auto_3563 ) ( ON-TABLE ?auto_3559 ) ( ON ?auto_3560 ?auto_3559 ) ( not ( = ?auto_3559 ?auto_3560 ) ) ( not ( = ?auto_3559 ?auto_3561 ) ) ( not ( = ?auto_3559 ?auto_3562 ) ) ( not ( = ?auto_3559 ?auto_3563 ) ) ( not ( = ?auto_3560 ?auto_3561 ) ) ( not ( = ?auto_3560 ?auto_3562 ) ) ( not ( = ?auto_3560 ?auto_3563 ) ) ( not ( = ?auto_3561 ?auto_3562 ) ) ( not ( = ?auto_3561 ?auto_3563 ) ) ( not ( = ?auto_3562 ?auto_3563 ) ) ( CLEAR ?auto_3560 ) ( ON ?auto_3561 ?auto_3562 ) ( CLEAR ?auto_3561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3559 ?auto_3560 ?auto_3561 )
      ( MAKE-4PILE ?auto_3559 ?auto_3560 ?auto_3561 ?auto_3562 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3568 - BLOCK
      ?auto_3569 - BLOCK
      ?auto_3570 - BLOCK
      ?auto_3571 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3571 ) ( ON-TABLE ?auto_3568 ) ( ON ?auto_3569 ?auto_3568 ) ( not ( = ?auto_3568 ?auto_3569 ) ) ( not ( = ?auto_3568 ?auto_3570 ) ) ( not ( = ?auto_3568 ?auto_3571 ) ) ( not ( = ?auto_3569 ?auto_3570 ) ) ( not ( = ?auto_3569 ?auto_3571 ) ) ( not ( = ?auto_3570 ?auto_3571 ) ) ( CLEAR ?auto_3569 ) ( ON ?auto_3570 ?auto_3571 ) ( CLEAR ?auto_3570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3568 ?auto_3569 ?auto_3570 )
      ( MAKE-4PILE ?auto_3568 ?auto_3569 ?auto_3570 ?auto_3571 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3576 - BLOCK
      ?auto_3577 - BLOCK
      ?auto_3578 - BLOCK
      ?auto_3579 - BLOCK
    )
    :vars
    (
      ?auto_3580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3579 ?auto_3580 ) ( ON-TABLE ?auto_3576 ) ( not ( = ?auto_3576 ?auto_3577 ) ) ( not ( = ?auto_3576 ?auto_3578 ) ) ( not ( = ?auto_3576 ?auto_3579 ) ) ( not ( = ?auto_3576 ?auto_3580 ) ) ( not ( = ?auto_3577 ?auto_3578 ) ) ( not ( = ?auto_3577 ?auto_3579 ) ) ( not ( = ?auto_3577 ?auto_3580 ) ) ( not ( = ?auto_3578 ?auto_3579 ) ) ( not ( = ?auto_3578 ?auto_3580 ) ) ( not ( = ?auto_3579 ?auto_3580 ) ) ( ON ?auto_3578 ?auto_3579 ) ( CLEAR ?auto_3576 ) ( ON ?auto_3577 ?auto_3578 ) ( CLEAR ?auto_3577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3576 ?auto_3577 )
      ( MAKE-4PILE ?auto_3576 ?auto_3577 ?auto_3578 ?auto_3579 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3585 - BLOCK
      ?auto_3586 - BLOCK
      ?auto_3587 - BLOCK
      ?auto_3588 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3588 ) ( ON-TABLE ?auto_3585 ) ( not ( = ?auto_3585 ?auto_3586 ) ) ( not ( = ?auto_3585 ?auto_3587 ) ) ( not ( = ?auto_3585 ?auto_3588 ) ) ( not ( = ?auto_3586 ?auto_3587 ) ) ( not ( = ?auto_3586 ?auto_3588 ) ) ( not ( = ?auto_3587 ?auto_3588 ) ) ( ON ?auto_3587 ?auto_3588 ) ( CLEAR ?auto_3585 ) ( ON ?auto_3586 ?auto_3587 ) ( CLEAR ?auto_3586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3585 ?auto_3586 )
      ( MAKE-4PILE ?auto_3585 ?auto_3586 ?auto_3587 ?auto_3588 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3593 - BLOCK
      ?auto_3594 - BLOCK
      ?auto_3595 - BLOCK
      ?auto_3596 - BLOCK
    )
    :vars
    (
      ?auto_3597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3596 ?auto_3597 ) ( not ( = ?auto_3593 ?auto_3594 ) ) ( not ( = ?auto_3593 ?auto_3595 ) ) ( not ( = ?auto_3593 ?auto_3596 ) ) ( not ( = ?auto_3593 ?auto_3597 ) ) ( not ( = ?auto_3594 ?auto_3595 ) ) ( not ( = ?auto_3594 ?auto_3596 ) ) ( not ( = ?auto_3594 ?auto_3597 ) ) ( not ( = ?auto_3595 ?auto_3596 ) ) ( not ( = ?auto_3595 ?auto_3597 ) ) ( not ( = ?auto_3596 ?auto_3597 ) ) ( ON ?auto_3595 ?auto_3596 ) ( ON ?auto_3594 ?auto_3595 ) ( ON ?auto_3593 ?auto_3594 ) ( CLEAR ?auto_3593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3593 )
      ( MAKE-4PILE ?auto_3593 ?auto_3594 ?auto_3595 ?auto_3596 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3602 - BLOCK
      ?auto_3603 - BLOCK
      ?auto_3604 - BLOCK
      ?auto_3605 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3605 ) ( not ( = ?auto_3602 ?auto_3603 ) ) ( not ( = ?auto_3602 ?auto_3604 ) ) ( not ( = ?auto_3602 ?auto_3605 ) ) ( not ( = ?auto_3603 ?auto_3604 ) ) ( not ( = ?auto_3603 ?auto_3605 ) ) ( not ( = ?auto_3604 ?auto_3605 ) ) ( ON ?auto_3604 ?auto_3605 ) ( ON ?auto_3603 ?auto_3604 ) ( ON ?auto_3602 ?auto_3603 ) ( CLEAR ?auto_3602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3602 )
      ( MAKE-4PILE ?auto_3602 ?auto_3603 ?auto_3604 ?auto_3605 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3610 - BLOCK
      ?auto_3611 - BLOCK
      ?auto_3612 - BLOCK
      ?auto_3613 - BLOCK
    )
    :vars
    (
      ?auto_3614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3610 ?auto_3611 ) ) ( not ( = ?auto_3610 ?auto_3612 ) ) ( not ( = ?auto_3610 ?auto_3613 ) ) ( not ( = ?auto_3611 ?auto_3612 ) ) ( not ( = ?auto_3611 ?auto_3613 ) ) ( not ( = ?auto_3612 ?auto_3613 ) ) ( ON ?auto_3610 ?auto_3614 ) ( not ( = ?auto_3613 ?auto_3614 ) ) ( not ( = ?auto_3612 ?auto_3614 ) ) ( not ( = ?auto_3611 ?auto_3614 ) ) ( not ( = ?auto_3610 ?auto_3614 ) ) ( ON ?auto_3611 ?auto_3610 ) ( ON ?auto_3612 ?auto_3611 ) ( ON ?auto_3613 ?auto_3612 ) ( CLEAR ?auto_3613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_3613 ?auto_3612 ?auto_3611 ?auto_3610 )
      ( MAKE-4PILE ?auto_3610 ?auto_3611 ?auto_3612 ?auto_3613 ) )
  )

)

