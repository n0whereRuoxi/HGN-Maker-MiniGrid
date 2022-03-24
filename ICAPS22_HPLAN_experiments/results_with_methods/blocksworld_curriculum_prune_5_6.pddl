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
      ?auto_6457 - BLOCK
    )
    :vars
    (
      ?auto_6458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6457 ?auto_6458 ) ( CLEAR ?auto_6457 ) ( HAND-EMPTY ) ( not ( = ?auto_6457 ?auto_6458 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6457 ?auto_6458 )
      ( !PUTDOWN ?auto_6457 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6464 - BLOCK
      ?auto_6465 - BLOCK
    )
    :vars
    (
      ?auto_6466 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6464 ) ( ON ?auto_6465 ?auto_6466 ) ( CLEAR ?auto_6465 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6464 ) ( not ( = ?auto_6464 ?auto_6465 ) ) ( not ( = ?auto_6464 ?auto_6466 ) ) ( not ( = ?auto_6465 ?auto_6466 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6465 ?auto_6466 )
      ( !STACK ?auto_6465 ?auto_6464 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6474 - BLOCK
      ?auto_6475 - BLOCK
    )
    :vars
    (
      ?auto_6476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6475 ?auto_6476 ) ( not ( = ?auto_6474 ?auto_6475 ) ) ( not ( = ?auto_6474 ?auto_6476 ) ) ( not ( = ?auto_6475 ?auto_6476 ) ) ( ON ?auto_6474 ?auto_6475 ) ( CLEAR ?auto_6474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6474 )
      ( MAKE-2PILE ?auto_6474 ?auto_6475 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6485 - BLOCK
      ?auto_6486 - BLOCK
      ?auto_6487 - BLOCK
    )
    :vars
    (
      ?auto_6488 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6486 ) ( ON ?auto_6487 ?auto_6488 ) ( CLEAR ?auto_6487 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6485 ) ( ON ?auto_6486 ?auto_6485 ) ( not ( = ?auto_6485 ?auto_6486 ) ) ( not ( = ?auto_6485 ?auto_6487 ) ) ( not ( = ?auto_6485 ?auto_6488 ) ) ( not ( = ?auto_6486 ?auto_6487 ) ) ( not ( = ?auto_6486 ?auto_6488 ) ) ( not ( = ?auto_6487 ?auto_6488 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6487 ?auto_6488 )
      ( !STACK ?auto_6487 ?auto_6486 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6499 - BLOCK
      ?auto_6500 - BLOCK
      ?auto_6501 - BLOCK
    )
    :vars
    (
      ?auto_6502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6501 ?auto_6502 ) ( ON-TABLE ?auto_6499 ) ( not ( = ?auto_6499 ?auto_6500 ) ) ( not ( = ?auto_6499 ?auto_6501 ) ) ( not ( = ?auto_6499 ?auto_6502 ) ) ( not ( = ?auto_6500 ?auto_6501 ) ) ( not ( = ?auto_6500 ?auto_6502 ) ) ( not ( = ?auto_6501 ?auto_6502 ) ) ( CLEAR ?auto_6499 ) ( ON ?auto_6500 ?auto_6501 ) ( CLEAR ?auto_6500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6499 ?auto_6500 )
      ( MAKE-3PILE ?auto_6499 ?auto_6500 ?auto_6501 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6513 - BLOCK
      ?auto_6514 - BLOCK
      ?auto_6515 - BLOCK
    )
    :vars
    (
      ?auto_6516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6515 ?auto_6516 ) ( not ( = ?auto_6513 ?auto_6514 ) ) ( not ( = ?auto_6513 ?auto_6515 ) ) ( not ( = ?auto_6513 ?auto_6516 ) ) ( not ( = ?auto_6514 ?auto_6515 ) ) ( not ( = ?auto_6514 ?auto_6516 ) ) ( not ( = ?auto_6515 ?auto_6516 ) ) ( ON ?auto_6514 ?auto_6515 ) ( ON ?auto_6513 ?auto_6514 ) ( CLEAR ?auto_6513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6513 )
      ( MAKE-3PILE ?auto_6513 ?auto_6514 ?auto_6515 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6528 - BLOCK
      ?auto_6529 - BLOCK
      ?auto_6530 - BLOCK
      ?auto_6531 - BLOCK
    )
    :vars
    (
      ?auto_6532 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6530 ) ( ON ?auto_6531 ?auto_6532 ) ( CLEAR ?auto_6531 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6528 ) ( ON ?auto_6529 ?auto_6528 ) ( ON ?auto_6530 ?auto_6529 ) ( not ( = ?auto_6528 ?auto_6529 ) ) ( not ( = ?auto_6528 ?auto_6530 ) ) ( not ( = ?auto_6528 ?auto_6531 ) ) ( not ( = ?auto_6528 ?auto_6532 ) ) ( not ( = ?auto_6529 ?auto_6530 ) ) ( not ( = ?auto_6529 ?auto_6531 ) ) ( not ( = ?auto_6529 ?auto_6532 ) ) ( not ( = ?auto_6530 ?auto_6531 ) ) ( not ( = ?auto_6530 ?auto_6532 ) ) ( not ( = ?auto_6531 ?auto_6532 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6531 ?auto_6532 )
      ( !STACK ?auto_6531 ?auto_6530 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6546 - BLOCK
      ?auto_6547 - BLOCK
      ?auto_6548 - BLOCK
      ?auto_6549 - BLOCK
    )
    :vars
    (
      ?auto_6550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6549 ?auto_6550 ) ( ON-TABLE ?auto_6546 ) ( ON ?auto_6547 ?auto_6546 ) ( not ( = ?auto_6546 ?auto_6547 ) ) ( not ( = ?auto_6546 ?auto_6548 ) ) ( not ( = ?auto_6546 ?auto_6549 ) ) ( not ( = ?auto_6546 ?auto_6550 ) ) ( not ( = ?auto_6547 ?auto_6548 ) ) ( not ( = ?auto_6547 ?auto_6549 ) ) ( not ( = ?auto_6547 ?auto_6550 ) ) ( not ( = ?auto_6548 ?auto_6549 ) ) ( not ( = ?auto_6548 ?auto_6550 ) ) ( not ( = ?auto_6549 ?auto_6550 ) ) ( CLEAR ?auto_6547 ) ( ON ?auto_6548 ?auto_6549 ) ( CLEAR ?auto_6548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6546 ?auto_6547 ?auto_6548 )
      ( MAKE-4PILE ?auto_6546 ?auto_6547 ?auto_6548 ?auto_6549 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6564 - BLOCK
      ?auto_6565 - BLOCK
      ?auto_6566 - BLOCK
      ?auto_6567 - BLOCK
    )
    :vars
    (
      ?auto_6568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6567 ?auto_6568 ) ( ON-TABLE ?auto_6564 ) ( not ( = ?auto_6564 ?auto_6565 ) ) ( not ( = ?auto_6564 ?auto_6566 ) ) ( not ( = ?auto_6564 ?auto_6567 ) ) ( not ( = ?auto_6564 ?auto_6568 ) ) ( not ( = ?auto_6565 ?auto_6566 ) ) ( not ( = ?auto_6565 ?auto_6567 ) ) ( not ( = ?auto_6565 ?auto_6568 ) ) ( not ( = ?auto_6566 ?auto_6567 ) ) ( not ( = ?auto_6566 ?auto_6568 ) ) ( not ( = ?auto_6567 ?auto_6568 ) ) ( ON ?auto_6566 ?auto_6567 ) ( CLEAR ?auto_6564 ) ( ON ?auto_6565 ?auto_6566 ) ( CLEAR ?auto_6565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6564 ?auto_6565 )
      ( MAKE-4PILE ?auto_6564 ?auto_6565 ?auto_6566 ?auto_6567 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6582 - BLOCK
      ?auto_6583 - BLOCK
      ?auto_6584 - BLOCK
      ?auto_6585 - BLOCK
    )
    :vars
    (
      ?auto_6586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6585 ?auto_6586 ) ( not ( = ?auto_6582 ?auto_6583 ) ) ( not ( = ?auto_6582 ?auto_6584 ) ) ( not ( = ?auto_6582 ?auto_6585 ) ) ( not ( = ?auto_6582 ?auto_6586 ) ) ( not ( = ?auto_6583 ?auto_6584 ) ) ( not ( = ?auto_6583 ?auto_6585 ) ) ( not ( = ?auto_6583 ?auto_6586 ) ) ( not ( = ?auto_6584 ?auto_6585 ) ) ( not ( = ?auto_6584 ?auto_6586 ) ) ( not ( = ?auto_6585 ?auto_6586 ) ) ( ON ?auto_6584 ?auto_6585 ) ( ON ?auto_6583 ?auto_6584 ) ( ON ?auto_6582 ?auto_6583 ) ( CLEAR ?auto_6582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6582 )
      ( MAKE-4PILE ?auto_6582 ?auto_6583 ?auto_6584 ?auto_6585 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6601 - BLOCK
      ?auto_6602 - BLOCK
      ?auto_6603 - BLOCK
      ?auto_6604 - BLOCK
      ?auto_6605 - BLOCK
    )
    :vars
    (
      ?auto_6606 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6604 ) ( ON ?auto_6605 ?auto_6606 ) ( CLEAR ?auto_6605 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6601 ) ( ON ?auto_6602 ?auto_6601 ) ( ON ?auto_6603 ?auto_6602 ) ( ON ?auto_6604 ?auto_6603 ) ( not ( = ?auto_6601 ?auto_6602 ) ) ( not ( = ?auto_6601 ?auto_6603 ) ) ( not ( = ?auto_6601 ?auto_6604 ) ) ( not ( = ?auto_6601 ?auto_6605 ) ) ( not ( = ?auto_6601 ?auto_6606 ) ) ( not ( = ?auto_6602 ?auto_6603 ) ) ( not ( = ?auto_6602 ?auto_6604 ) ) ( not ( = ?auto_6602 ?auto_6605 ) ) ( not ( = ?auto_6602 ?auto_6606 ) ) ( not ( = ?auto_6603 ?auto_6604 ) ) ( not ( = ?auto_6603 ?auto_6605 ) ) ( not ( = ?auto_6603 ?auto_6606 ) ) ( not ( = ?auto_6604 ?auto_6605 ) ) ( not ( = ?auto_6604 ?auto_6606 ) ) ( not ( = ?auto_6605 ?auto_6606 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6605 ?auto_6606 )
      ( !STACK ?auto_6605 ?auto_6604 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6612 - BLOCK
      ?auto_6613 - BLOCK
      ?auto_6614 - BLOCK
      ?auto_6615 - BLOCK
      ?auto_6616 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6615 ) ( ON-TABLE ?auto_6616 ) ( CLEAR ?auto_6616 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6612 ) ( ON ?auto_6613 ?auto_6612 ) ( ON ?auto_6614 ?auto_6613 ) ( ON ?auto_6615 ?auto_6614 ) ( not ( = ?auto_6612 ?auto_6613 ) ) ( not ( = ?auto_6612 ?auto_6614 ) ) ( not ( = ?auto_6612 ?auto_6615 ) ) ( not ( = ?auto_6612 ?auto_6616 ) ) ( not ( = ?auto_6613 ?auto_6614 ) ) ( not ( = ?auto_6613 ?auto_6615 ) ) ( not ( = ?auto_6613 ?auto_6616 ) ) ( not ( = ?auto_6614 ?auto_6615 ) ) ( not ( = ?auto_6614 ?auto_6616 ) ) ( not ( = ?auto_6615 ?auto_6616 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_6616 )
      ( !STACK ?auto_6616 ?auto_6615 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6622 - BLOCK
      ?auto_6623 - BLOCK
      ?auto_6624 - BLOCK
      ?auto_6625 - BLOCK
      ?auto_6626 - BLOCK
    )
    :vars
    (
      ?auto_6627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6626 ?auto_6627 ) ( ON-TABLE ?auto_6622 ) ( ON ?auto_6623 ?auto_6622 ) ( ON ?auto_6624 ?auto_6623 ) ( not ( = ?auto_6622 ?auto_6623 ) ) ( not ( = ?auto_6622 ?auto_6624 ) ) ( not ( = ?auto_6622 ?auto_6625 ) ) ( not ( = ?auto_6622 ?auto_6626 ) ) ( not ( = ?auto_6622 ?auto_6627 ) ) ( not ( = ?auto_6623 ?auto_6624 ) ) ( not ( = ?auto_6623 ?auto_6625 ) ) ( not ( = ?auto_6623 ?auto_6626 ) ) ( not ( = ?auto_6623 ?auto_6627 ) ) ( not ( = ?auto_6624 ?auto_6625 ) ) ( not ( = ?auto_6624 ?auto_6626 ) ) ( not ( = ?auto_6624 ?auto_6627 ) ) ( not ( = ?auto_6625 ?auto_6626 ) ) ( not ( = ?auto_6625 ?auto_6627 ) ) ( not ( = ?auto_6626 ?auto_6627 ) ) ( CLEAR ?auto_6624 ) ( ON ?auto_6625 ?auto_6626 ) ( CLEAR ?auto_6625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6622 ?auto_6623 ?auto_6624 ?auto_6625 )
      ( MAKE-5PILE ?auto_6622 ?auto_6623 ?auto_6624 ?auto_6625 ?auto_6626 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6633 - BLOCK
      ?auto_6634 - BLOCK
      ?auto_6635 - BLOCK
      ?auto_6636 - BLOCK
      ?auto_6637 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6637 ) ( ON-TABLE ?auto_6633 ) ( ON ?auto_6634 ?auto_6633 ) ( ON ?auto_6635 ?auto_6634 ) ( not ( = ?auto_6633 ?auto_6634 ) ) ( not ( = ?auto_6633 ?auto_6635 ) ) ( not ( = ?auto_6633 ?auto_6636 ) ) ( not ( = ?auto_6633 ?auto_6637 ) ) ( not ( = ?auto_6634 ?auto_6635 ) ) ( not ( = ?auto_6634 ?auto_6636 ) ) ( not ( = ?auto_6634 ?auto_6637 ) ) ( not ( = ?auto_6635 ?auto_6636 ) ) ( not ( = ?auto_6635 ?auto_6637 ) ) ( not ( = ?auto_6636 ?auto_6637 ) ) ( CLEAR ?auto_6635 ) ( ON ?auto_6636 ?auto_6637 ) ( CLEAR ?auto_6636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6633 ?auto_6634 ?auto_6635 ?auto_6636 )
      ( MAKE-5PILE ?auto_6633 ?auto_6634 ?auto_6635 ?auto_6636 ?auto_6637 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6643 - BLOCK
      ?auto_6644 - BLOCK
      ?auto_6645 - BLOCK
      ?auto_6646 - BLOCK
      ?auto_6647 - BLOCK
    )
    :vars
    (
      ?auto_6648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6647 ?auto_6648 ) ( ON-TABLE ?auto_6643 ) ( ON ?auto_6644 ?auto_6643 ) ( not ( = ?auto_6643 ?auto_6644 ) ) ( not ( = ?auto_6643 ?auto_6645 ) ) ( not ( = ?auto_6643 ?auto_6646 ) ) ( not ( = ?auto_6643 ?auto_6647 ) ) ( not ( = ?auto_6643 ?auto_6648 ) ) ( not ( = ?auto_6644 ?auto_6645 ) ) ( not ( = ?auto_6644 ?auto_6646 ) ) ( not ( = ?auto_6644 ?auto_6647 ) ) ( not ( = ?auto_6644 ?auto_6648 ) ) ( not ( = ?auto_6645 ?auto_6646 ) ) ( not ( = ?auto_6645 ?auto_6647 ) ) ( not ( = ?auto_6645 ?auto_6648 ) ) ( not ( = ?auto_6646 ?auto_6647 ) ) ( not ( = ?auto_6646 ?auto_6648 ) ) ( not ( = ?auto_6647 ?auto_6648 ) ) ( ON ?auto_6646 ?auto_6647 ) ( CLEAR ?auto_6644 ) ( ON ?auto_6645 ?auto_6646 ) ( CLEAR ?auto_6645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6643 ?auto_6644 ?auto_6645 )
      ( MAKE-5PILE ?auto_6643 ?auto_6644 ?auto_6645 ?auto_6646 ?auto_6647 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6654 - BLOCK
      ?auto_6655 - BLOCK
      ?auto_6656 - BLOCK
      ?auto_6657 - BLOCK
      ?auto_6658 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6658 ) ( ON-TABLE ?auto_6654 ) ( ON ?auto_6655 ?auto_6654 ) ( not ( = ?auto_6654 ?auto_6655 ) ) ( not ( = ?auto_6654 ?auto_6656 ) ) ( not ( = ?auto_6654 ?auto_6657 ) ) ( not ( = ?auto_6654 ?auto_6658 ) ) ( not ( = ?auto_6655 ?auto_6656 ) ) ( not ( = ?auto_6655 ?auto_6657 ) ) ( not ( = ?auto_6655 ?auto_6658 ) ) ( not ( = ?auto_6656 ?auto_6657 ) ) ( not ( = ?auto_6656 ?auto_6658 ) ) ( not ( = ?auto_6657 ?auto_6658 ) ) ( ON ?auto_6657 ?auto_6658 ) ( CLEAR ?auto_6655 ) ( ON ?auto_6656 ?auto_6657 ) ( CLEAR ?auto_6656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6654 ?auto_6655 ?auto_6656 )
      ( MAKE-5PILE ?auto_6654 ?auto_6655 ?auto_6656 ?auto_6657 ?auto_6658 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6664 - BLOCK
      ?auto_6665 - BLOCK
      ?auto_6666 - BLOCK
      ?auto_6667 - BLOCK
      ?auto_6668 - BLOCK
    )
    :vars
    (
      ?auto_6669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6668 ?auto_6669 ) ( ON-TABLE ?auto_6664 ) ( not ( = ?auto_6664 ?auto_6665 ) ) ( not ( = ?auto_6664 ?auto_6666 ) ) ( not ( = ?auto_6664 ?auto_6667 ) ) ( not ( = ?auto_6664 ?auto_6668 ) ) ( not ( = ?auto_6664 ?auto_6669 ) ) ( not ( = ?auto_6665 ?auto_6666 ) ) ( not ( = ?auto_6665 ?auto_6667 ) ) ( not ( = ?auto_6665 ?auto_6668 ) ) ( not ( = ?auto_6665 ?auto_6669 ) ) ( not ( = ?auto_6666 ?auto_6667 ) ) ( not ( = ?auto_6666 ?auto_6668 ) ) ( not ( = ?auto_6666 ?auto_6669 ) ) ( not ( = ?auto_6667 ?auto_6668 ) ) ( not ( = ?auto_6667 ?auto_6669 ) ) ( not ( = ?auto_6668 ?auto_6669 ) ) ( ON ?auto_6667 ?auto_6668 ) ( ON ?auto_6666 ?auto_6667 ) ( CLEAR ?auto_6664 ) ( ON ?auto_6665 ?auto_6666 ) ( CLEAR ?auto_6665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6664 ?auto_6665 )
      ( MAKE-5PILE ?auto_6664 ?auto_6665 ?auto_6666 ?auto_6667 ?auto_6668 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6675 - BLOCK
      ?auto_6676 - BLOCK
      ?auto_6677 - BLOCK
      ?auto_6678 - BLOCK
      ?auto_6679 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6679 ) ( ON-TABLE ?auto_6675 ) ( not ( = ?auto_6675 ?auto_6676 ) ) ( not ( = ?auto_6675 ?auto_6677 ) ) ( not ( = ?auto_6675 ?auto_6678 ) ) ( not ( = ?auto_6675 ?auto_6679 ) ) ( not ( = ?auto_6676 ?auto_6677 ) ) ( not ( = ?auto_6676 ?auto_6678 ) ) ( not ( = ?auto_6676 ?auto_6679 ) ) ( not ( = ?auto_6677 ?auto_6678 ) ) ( not ( = ?auto_6677 ?auto_6679 ) ) ( not ( = ?auto_6678 ?auto_6679 ) ) ( ON ?auto_6678 ?auto_6679 ) ( ON ?auto_6677 ?auto_6678 ) ( CLEAR ?auto_6675 ) ( ON ?auto_6676 ?auto_6677 ) ( CLEAR ?auto_6676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6675 ?auto_6676 )
      ( MAKE-5PILE ?auto_6675 ?auto_6676 ?auto_6677 ?auto_6678 ?auto_6679 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6685 - BLOCK
      ?auto_6686 - BLOCK
      ?auto_6687 - BLOCK
      ?auto_6688 - BLOCK
      ?auto_6689 - BLOCK
    )
    :vars
    (
      ?auto_6690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6689 ?auto_6690 ) ( not ( = ?auto_6685 ?auto_6686 ) ) ( not ( = ?auto_6685 ?auto_6687 ) ) ( not ( = ?auto_6685 ?auto_6688 ) ) ( not ( = ?auto_6685 ?auto_6689 ) ) ( not ( = ?auto_6685 ?auto_6690 ) ) ( not ( = ?auto_6686 ?auto_6687 ) ) ( not ( = ?auto_6686 ?auto_6688 ) ) ( not ( = ?auto_6686 ?auto_6689 ) ) ( not ( = ?auto_6686 ?auto_6690 ) ) ( not ( = ?auto_6687 ?auto_6688 ) ) ( not ( = ?auto_6687 ?auto_6689 ) ) ( not ( = ?auto_6687 ?auto_6690 ) ) ( not ( = ?auto_6688 ?auto_6689 ) ) ( not ( = ?auto_6688 ?auto_6690 ) ) ( not ( = ?auto_6689 ?auto_6690 ) ) ( ON ?auto_6688 ?auto_6689 ) ( ON ?auto_6687 ?auto_6688 ) ( ON ?auto_6686 ?auto_6687 ) ( ON ?auto_6685 ?auto_6686 ) ( CLEAR ?auto_6685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6685 )
      ( MAKE-5PILE ?auto_6685 ?auto_6686 ?auto_6687 ?auto_6688 ?auto_6689 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6696 - BLOCK
      ?auto_6697 - BLOCK
      ?auto_6698 - BLOCK
      ?auto_6699 - BLOCK
      ?auto_6700 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6700 ) ( not ( = ?auto_6696 ?auto_6697 ) ) ( not ( = ?auto_6696 ?auto_6698 ) ) ( not ( = ?auto_6696 ?auto_6699 ) ) ( not ( = ?auto_6696 ?auto_6700 ) ) ( not ( = ?auto_6697 ?auto_6698 ) ) ( not ( = ?auto_6697 ?auto_6699 ) ) ( not ( = ?auto_6697 ?auto_6700 ) ) ( not ( = ?auto_6698 ?auto_6699 ) ) ( not ( = ?auto_6698 ?auto_6700 ) ) ( not ( = ?auto_6699 ?auto_6700 ) ) ( ON ?auto_6699 ?auto_6700 ) ( ON ?auto_6698 ?auto_6699 ) ( ON ?auto_6697 ?auto_6698 ) ( ON ?auto_6696 ?auto_6697 ) ( CLEAR ?auto_6696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6696 )
      ( MAKE-5PILE ?auto_6696 ?auto_6697 ?auto_6698 ?auto_6699 ?auto_6700 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6706 - BLOCK
      ?auto_6707 - BLOCK
      ?auto_6708 - BLOCK
      ?auto_6709 - BLOCK
      ?auto_6710 - BLOCK
    )
    :vars
    (
      ?auto_6711 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6706 ?auto_6707 ) ) ( not ( = ?auto_6706 ?auto_6708 ) ) ( not ( = ?auto_6706 ?auto_6709 ) ) ( not ( = ?auto_6706 ?auto_6710 ) ) ( not ( = ?auto_6707 ?auto_6708 ) ) ( not ( = ?auto_6707 ?auto_6709 ) ) ( not ( = ?auto_6707 ?auto_6710 ) ) ( not ( = ?auto_6708 ?auto_6709 ) ) ( not ( = ?auto_6708 ?auto_6710 ) ) ( not ( = ?auto_6709 ?auto_6710 ) ) ( ON ?auto_6706 ?auto_6711 ) ( not ( = ?auto_6710 ?auto_6711 ) ) ( not ( = ?auto_6709 ?auto_6711 ) ) ( not ( = ?auto_6708 ?auto_6711 ) ) ( not ( = ?auto_6707 ?auto_6711 ) ) ( not ( = ?auto_6706 ?auto_6711 ) ) ( ON ?auto_6707 ?auto_6706 ) ( ON ?auto_6708 ?auto_6707 ) ( ON ?auto_6709 ?auto_6708 ) ( ON ?auto_6710 ?auto_6709 ) ( CLEAR ?auto_6710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_6710 ?auto_6709 ?auto_6708 ?auto_6707 ?auto_6706 )
      ( MAKE-5PILE ?auto_6706 ?auto_6707 ?auto_6708 ?auto_6709 ?auto_6710 ) )
  )

)

