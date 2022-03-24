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

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6624 - BLOCK
      ?auto_6625 - BLOCK
      ?auto_6626 - BLOCK
      ?auto_6627 - BLOCK
    )
    :vars
    (
      ?auto_6628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6628 ?auto_6627 ) ( CLEAR ?auto_6628 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6624 ) ( ON ?auto_6625 ?auto_6624 ) ( ON ?auto_6626 ?auto_6625 ) ( ON ?auto_6627 ?auto_6626 ) ( not ( = ?auto_6624 ?auto_6625 ) ) ( not ( = ?auto_6624 ?auto_6626 ) ) ( not ( = ?auto_6624 ?auto_6627 ) ) ( not ( = ?auto_6624 ?auto_6628 ) ) ( not ( = ?auto_6625 ?auto_6626 ) ) ( not ( = ?auto_6625 ?auto_6627 ) ) ( not ( = ?auto_6625 ?auto_6628 ) ) ( not ( = ?auto_6626 ?auto_6627 ) ) ( not ( = ?auto_6626 ?auto_6628 ) ) ( not ( = ?auto_6627 ?auto_6628 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6628 ?auto_6627 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6630 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6630 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_6630 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6631 - BLOCK
    )
    :vars
    (
      ?auto_6632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6631 ?auto_6632 ) ( CLEAR ?auto_6631 ) ( HAND-EMPTY ) ( not ( = ?auto_6631 ?auto_6632 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6631 ?auto_6632 )
      ( MAKE-1PILE ?auto_6631 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6636 - BLOCK
      ?auto_6637 - BLOCK
      ?auto_6638 - BLOCK
    )
    :vars
    (
      ?auto_6639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6639 ?auto_6638 ) ( CLEAR ?auto_6639 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6636 ) ( ON ?auto_6637 ?auto_6636 ) ( ON ?auto_6638 ?auto_6637 ) ( not ( = ?auto_6636 ?auto_6637 ) ) ( not ( = ?auto_6636 ?auto_6638 ) ) ( not ( = ?auto_6636 ?auto_6639 ) ) ( not ( = ?auto_6637 ?auto_6638 ) ) ( not ( = ?auto_6637 ?auto_6639 ) ) ( not ( = ?auto_6638 ?auto_6639 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6639 ?auto_6638 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6640 - BLOCK
      ?auto_6641 - BLOCK
      ?auto_6642 - BLOCK
    )
    :vars
    (
      ?auto_6643 - BLOCK
      ?auto_6644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6643 ?auto_6642 ) ( CLEAR ?auto_6643 ) ( ON-TABLE ?auto_6640 ) ( ON ?auto_6641 ?auto_6640 ) ( ON ?auto_6642 ?auto_6641 ) ( not ( = ?auto_6640 ?auto_6641 ) ) ( not ( = ?auto_6640 ?auto_6642 ) ) ( not ( = ?auto_6640 ?auto_6643 ) ) ( not ( = ?auto_6641 ?auto_6642 ) ) ( not ( = ?auto_6641 ?auto_6643 ) ) ( not ( = ?auto_6642 ?auto_6643 ) ) ( HOLDING ?auto_6644 ) ( not ( = ?auto_6640 ?auto_6644 ) ) ( not ( = ?auto_6641 ?auto_6644 ) ) ( not ( = ?auto_6642 ?auto_6644 ) ) ( not ( = ?auto_6643 ?auto_6644 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_6644 )
      ( MAKE-3PILE ?auto_6640 ?auto_6641 ?auto_6642 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6645 - BLOCK
      ?auto_6646 - BLOCK
      ?auto_6647 - BLOCK
    )
    :vars
    (
      ?auto_6648 - BLOCK
      ?auto_6649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6648 ?auto_6647 ) ( ON-TABLE ?auto_6645 ) ( ON ?auto_6646 ?auto_6645 ) ( ON ?auto_6647 ?auto_6646 ) ( not ( = ?auto_6645 ?auto_6646 ) ) ( not ( = ?auto_6645 ?auto_6647 ) ) ( not ( = ?auto_6645 ?auto_6648 ) ) ( not ( = ?auto_6646 ?auto_6647 ) ) ( not ( = ?auto_6646 ?auto_6648 ) ) ( not ( = ?auto_6647 ?auto_6648 ) ) ( not ( = ?auto_6645 ?auto_6649 ) ) ( not ( = ?auto_6646 ?auto_6649 ) ) ( not ( = ?auto_6647 ?auto_6649 ) ) ( not ( = ?auto_6648 ?auto_6649 ) ) ( ON ?auto_6649 ?auto_6648 ) ( CLEAR ?auto_6649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6645 ?auto_6646 ?auto_6647 ?auto_6648 )
      ( MAKE-3PILE ?auto_6645 ?auto_6646 ?auto_6647 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6652 - BLOCK
      ?auto_6653 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6653 ) ( CLEAR ?auto_6652 ) ( ON-TABLE ?auto_6652 ) ( not ( = ?auto_6652 ?auto_6653 ) ) )
    :subtasks
    ( ( !STACK ?auto_6653 ?auto_6652 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6654 - BLOCK
      ?auto_6655 - BLOCK
    )
    :vars
    (
      ?auto_6656 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6654 ) ( ON-TABLE ?auto_6654 ) ( not ( = ?auto_6654 ?auto_6655 ) ) ( ON ?auto_6655 ?auto_6656 ) ( CLEAR ?auto_6655 ) ( HAND-EMPTY ) ( not ( = ?auto_6654 ?auto_6656 ) ) ( not ( = ?auto_6655 ?auto_6656 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6655 ?auto_6656 )
      ( MAKE-2PILE ?auto_6654 ?auto_6655 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6657 - BLOCK
      ?auto_6658 - BLOCK
    )
    :vars
    (
      ?auto_6659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6657 ?auto_6658 ) ) ( ON ?auto_6658 ?auto_6659 ) ( CLEAR ?auto_6658 ) ( not ( = ?auto_6657 ?auto_6659 ) ) ( not ( = ?auto_6658 ?auto_6659 ) ) ( HOLDING ?auto_6657 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6657 )
      ( MAKE-2PILE ?auto_6657 ?auto_6658 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6660 - BLOCK
      ?auto_6661 - BLOCK
    )
    :vars
    (
      ?auto_6662 - BLOCK
      ?auto_6664 - BLOCK
      ?auto_6663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6660 ?auto_6661 ) ) ( ON ?auto_6661 ?auto_6662 ) ( not ( = ?auto_6660 ?auto_6662 ) ) ( not ( = ?auto_6661 ?auto_6662 ) ) ( ON ?auto_6660 ?auto_6661 ) ( CLEAR ?auto_6660 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6664 ) ( ON ?auto_6663 ?auto_6664 ) ( ON ?auto_6662 ?auto_6663 ) ( not ( = ?auto_6664 ?auto_6663 ) ) ( not ( = ?auto_6664 ?auto_6662 ) ) ( not ( = ?auto_6664 ?auto_6661 ) ) ( not ( = ?auto_6664 ?auto_6660 ) ) ( not ( = ?auto_6663 ?auto_6662 ) ) ( not ( = ?auto_6663 ?auto_6661 ) ) ( not ( = ?auto_6663 ?auto_6660 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6664 ?auto_6663 ?auto_6662 ?auto_6661 )
      ( MAKE-2PILE ?auto_6660 ?auto_6661 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6667 - BLOCK
      ?auto_6668 - BLOCK
    )
    :vars
    (
      ?auto_6669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6669 ?auto_6668 ) ( CLEAR ?auto_6669 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6667 ) ( ON ?auto_6668 ?auto_6667 ) ( not ( = ?auto_6667 ?auto_6668 ) ) ( not ( = ?auto_6667 ?auto_6669 ) ) ( not ( = ?auto_6668 ?auto_6669 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6669 ?auto_6668 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6670 - BLOCK
      ?auto_6671 - BLOCK
    )
    :vars
    (
      ?auto_6672 - BLOCK
      ?auto_6673 - BLOCK
      ?auto_6674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6672 ?auto_6671 ) ( CLEAR ?auto_6672 ) ( ON-TABLE ?auto_6670 ) ( ON ?auto_6671 ?auto_6670 ) ( not ( = ?auto_6670 ?auto_6671 ) ) ( not ( = ?auto_6670 ?auto_6672 ) ) ( not ( = ?auto_6671 ?auto_6672 ) ) ( HOLDING ?auto_6673 ) ( CLEAR ?auto_6674 ) ( not ( = ?auto_6670 ?auto_6673 ) ) ( not ( = ?auto_6670 ?auto_6674 ) ) ( not ( = ?auto_6671 ?auto_6673 ) ) ( not ( = ?auto_6671 ?auto_6674 ) ) ( not ( = ?auto_6672 ?auto_6673 ) ) ( not ( = ?auto_6672 ?auto_6674 ) ) ( not ( = ?auto_6673 ?auto_6674 ) ) )
    :subtasks
    ( ( !STACK ?auto_6673 ?auto_6674 )
      ( MAKE-2PILE ?auto_6670 ?auto_6671 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6675 - BLOCK
      ?auto_6676 - BLOCK
    )
    :vars
    (
      ?auto_6677 - BLOCK
      ?auto_6679 - BLOCK
      ?auto_6678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6677 ?auto_6676 ) ( ON-TABLE ?auto_6675 ) ( ON ?auto_6676 ?auto_6675 ) ( not ( = ?auto_6675 ?auto_6676 ) ) ( not ( = ?auto_6675 ?auto_6677 ) ) ( not ( = ?auto_6676 ?auto_6677 ) ) ( CLEAR ?auto_6679 ) ( not ( = ?auto_6675 ?auto_6678 ) ) ( not ( = ?auto_6675 ?auto_6679 ) ) ( not ( = ?auto_6676 ?auto_6678 ) ) ( not ( = ?auto_6676 ?auto_6679 ) ) ( not ( = ?auto_6677 ?auto_6678 ) ) ( not ( = ?auto_6677 ?auto_6679 ) ) ( not ( = ?auto_6678 ?auto_6679 ) ) ( ON ?auto_6678 ?auto_6677 ) ( CLEAR ?auto_6678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6675 ?auto_6676 ?auto_6677 )
      ( MAKE-2PILE ?auto_6675 ?auto_6676 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6680 - BLOCK
      ?auto_6681 - BLOCK
    )
    :vars
    (
      ?auto_6683 - BLOCK
      ?auto_6684 - BLOCK
      ?auto_6682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6683 ?auto_6681 ) ( ON-TABLE ?auto_6680 ) ( ON ?auto_6681 ?auto_6680 ) ( not ( = ?auto_6680 ?auto_6681 ) ) ( not ( = ?auto_6680 ?auto_6683 ) ) ( not ( = ?auto_6681 ?auto_6683 ) ) ( not ( = ?auto_6680 ?auto_6684 ) ) ( not ( = ?auto_6680 ?auto_6682 ) ) ( not ( = ?auto_6681 ?auto_6684 ) ) ( not ( = ?auto_6681 ?auto_6682 ) ) ( not ( = ?auto_6683 ?auto_6684 ) ) ( not ( = ?auto_6683 ?auto_6682 ) ) ( not ( = ?auto_6684 ?auto_6682 ) ) ( ON ?auto_6684 ?auto_6683 ) ( CLEAR ?auto_6684 ) ( HOLDING ?auto_6682 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6682 )
      ( MAKE-2PILE ?auto_6680 ?auto_6681 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6685 - BLOCK
      ?auto_6686 - BLOCK
    )
    :vars
    (
      ?auto_6688 - BLOCK
      ?auto_6687 - BLOCK
      ?auto_6689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6688 ?auto_6686 ) ( ON-TABLE ?auto_6685 ) ( ON ?auto_6686 ?auto_6685 ) ( not ( = ?auto_6685 ?auto_6686 ) ) ( not ( = ?auto_6685 ?auto_6688 ) ) ( not ( = ?auto_6686 ?auto_6688 ) ) ( not ( = ?auto_6685 ?auto_6687 ) ) ( not ( = ?auto_6685 ?auto_6689 ) ) ( not ( = ?auto_6686 ?auto_6687 ) ) ( not ( = ?auto_6686 ?auto_6689 ) ) ( not ( = ?auto_6688 ?auto_6687 ) ) ( not ( = ?auto_6688 ?auto_6689 ) ) ( not ( = ?auto_6687 ?auto_6689 ) ) ( ON ?auto_6687 ?auto_6688 ) ( ON ?auto_6689 ?auto_6687 ) ( CLEAR ?auto_6689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6685 ?auto_6686 ?auto_6688 ?auto_6687 )
      ( MAKE-2PILE ?auto_6685 ?auto_6686 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6693 - BLOCK
      ?auto_6694 - BLOCK
      ?auto_6695 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6695 ) ( CLEAR ?auto_6694 ) ( ON-TABLE ?auto_6693 ) ( ON ?auto_6694 ?auto_6693 ) ( not ( = ?auto_6693 ?auto_6694 ) ) ( not ( = ?auto_6693 ?auto_6695 ) ) ( not ( = ?auto_6694 ?auto_6695 ) ) )
    :subtasks
    ( ( !STACK ?auto_6695 ?auto_6694 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6696 - BLOCK
      ?auto_6697 - BLOCK
      ?auto_6698 - BLOCK
    )
    :vars
    (
      ?auto_6699 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6697 ) ( ON-TABLE ?auto_6696 ) ( ON ?auto_6697 ?auto_6696 ) ( not ( = ?auto_6696 ?auto_6697 ) ) ( not ( = ?auto_6696 ?auto_6698 ) ) ( not ( = ?auto_6697 ?auto_6698 ) ) ( ON ?auto_6698 ?auto_6699 ) ( CLEAR ?auto_6698 ) ( HAND-EMPTY ) ( not ( = ?auto_6696 ?auto_6699 ) ) ( not ( = ?auto_6697 ?auto_6699 ) ) ( not ( = ?auto_6698 ?auto_6699 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6698 ?auto_6699 )
      ( MAKE-3PILE ?auto_6696 ?auto_6697 ?auto_6698 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6700 - BLOCK
      ?auto_6701 - BLOCK
      ?auto_6702 - BLOCK
    )
    :vars
    (
      ?auto_6703 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6700 ) ( not ( = ?auto_6700 ?auto_6701 ) ) ( not ( = ?auto_6700 ?auto_6702 ) ) ( not ( = ?auto_6701 ?auto_6702 ) ) ( ON ?auto_6702 ?auto_6703 ) ( CLEAR ?auto_6702 ) ( not ( = ?auto_6700 ?auto_6703 ) ) ( not ( = ?auto_6701 ?auto_6703 ) ) ( not ( = ?auto_6702 ?auto_6703 ) ) ( HOLDING ?auto_6701 ) ( CLEAR ?auto_6700 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6700 ?auto_6701 )
      ( MAKE-3PILE ?auto_6700 ?auto_6701 ?auto_6702 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6704 - BLOCK
      ?auto_6705 - BLOCK
      ?auto_6706 - BLOCK
    )
    :vars
    (
      ?auto_6707 - BLOCK
      ?auto_6708 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6704 ) ( not ( = ?auto_6704 ?auto_6705 ) ) ( not ( = ?auto_6704 ?auto_6706 ) ) ( not ( = ?auto_6705 ?auto_6706 ) ) ( ON ?auto_6706 ?auto_6707 ) ( not ( = ?auto_6704 ?auto_6707 ) ) ( not ( = ?auto_6705 ?auto_6707 ) ) ( not ( = ?auto_6706 ?auto_6707 ) ) ( CLEAR ?auto_6704 ) ( ON ?auto_6705 ?auto_6706 ) ( CLEAR ?auto_6705 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6708 ) ( ON ?auto_6707 ?auto_6708 ) ( not ( = ?auto_6708 ?auto_6707 ) ) ( not ( = ?auto_6708 ?auto_6706 ) ) ( not ( = ?auto_6708 ?auto_6705 ) ) ( not ( = ?auto_6704 ?auto_6708 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6708 ?auto_6707 ?auto_6706 )
      ( MAKE-3PILE ?auto_6704 ?auto_6705 ?auto_6706 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6709 - BLOCK
      ?auto_6710 - BLOCK
      ?auto_6711 - BLOCK
    )
    :vars
    (
      ?auto_6712 - BLOCK
      ?auto_6713 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6709 ?auto_6710 ) ) ( not ( = ?auto_6709 ?auto_6711 ) ) ( not ( = ?auto_6710 ?auto_6711 ) ) ( ON ?auto_6711 ?auto_6712 ) ( not ( = ?auto_6709 ?auto_6712 ) ) ( not ( = ?auto_6710 ?auto_6712 ) ) ( not ( = ?auto_6711 ?auto_6712 ) ) ( ON ?auto_6710 ?auto_6711 ) ( CLEAR ?auto_6710 ) ( ON-TABLE ?auto_6713 ) ( ON ?auto_6712 ?auto_6713 ) ( not ( = ?auto_6713 ?auto_6712 ) ) ( not ( = ?auto_6713 ?auto_6711 ) ) ( not ( = ?auto_6713 ?auto_6710 ) ) ( not ( = ?auto_6709 ?auto_6713 ) ) ( HOLDING ?auto_6709 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6709 )
      ( MAKE-3PILE ?auto_6709 ?auto_6710 ?auto_6711 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6714 - BLOCK
      ?auto_6715 - BLOCK
      ?auto_6716 - BLOCK
    )
    :vars
    (
      ?auto_6718 - BLOCK
      ?auto_6717 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6714 ?auto_6715 ) ) ( not ( = ?auto_6714 ?auto_6716 ) ) ( not ( = ?auto_6715 ?auto_6716 ) ) ( ON ?auto_6716 ?auto_6718 ) ( not ( = ?auto_6714 ?auto_6718 ) ) ( not ( = ?auto_6715 ?auto_6718 ) ) ( not ( = ?auto_6716 ?auto_6718 ) ) ( ON ?auto_6715 ?auto_6716 ) ( ON-TABLE ?auto_6717 ) ( ON ?auto_6718 ?auto_6717 ) ( not ( = ?auto_6717 ?auto_6718 ) ) ( not ( = ?auto_6717 ?auto_6716 ) ) ( not ( = ?auto_6717 ?auto_6715 ) ) ( not ( = ?auto_6714 ?auto_6717 ) ) ( ON ?auto_6714 ?auto_6715 ) ( CLEAR ?auto_6714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6717 ?auto_6718 ?auto_6716 ?auto_6715 )
      ( MAKE-3PILE ?auto_6714 ?auto_6715 ?auto_6716 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6720 - BLOCK
    )
    :vars
    (
      ?auto_6721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6721 ?auto_6720 ) ( CLEAR ?auto_6721 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6720 ) ( not ( = ?auto_6720 ?auto_6721 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6721 ?auto_6720 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6722 - BLOCK
    )
    :vars
    (
      ?auto_6723 - BLOCK
      ?auto_6724 - BLOCK
      ?auto_6725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6723 ?auto_6722 ) ( CLEAR ?auto_6723 ) ( ON-TABLE ?auto_6722 ) ( not ( = ?auto_6722 ?auto_6723 ) ) ( HOLDING ?auto_6724 ) ( CLEAR ?auto_6725 ) ( not ( = ?auto_6722 ?auto_6724 ) ) ( not ( = ?auto_6722 ?auto_6725 ) ) ( not ( = ?auto_6723 ?auto_6724 ) ) ( not ( = ?auto_6723 ?auto_6725 ) ) ( not ( = ?auto_6724 ?auto_6725 ) ) )
    :subtasks
    ( ( !STACK ?auto_6724 ?auto_6725 )
      ( MAKE-1PILE ?auto_6722 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6726 - BLOCK
    )
    :vars
    (
      ?auto_6727 - BLOCK
      ?auto_6729 - BLOCK
      ?auto_6728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6727 ?auto_6726 ) ( ON-TABLE ?auto_6726 ) ( not ( = ?auto_6726 ?auto_6727 ) ) ( CLEAR ?auto_6729 ) ( not ( = ?auto_6726 ?auto_6728 ) ) ( not ( = ?auto_6726 ?auto_6729 ) ) ( not ( = ?auto_6727 ?auto_6728 ) ) ( not ( = ?auto_6727 ?auto_6729 ) ) ( not ( = ?auto_6728 ?auto_6729 ) ) ( ON ?auto_6728 ?auto_6727 ) ( CLEAR ?auto_6728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6726 ?auto_6727 )
      ( MAKE-1PILE ?auto_6726 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6730 - BLOCK
    )
    :vars
    (
      ?auto_6731 - BLOCK
      ?auto_6733 - BLOCK
      ?auto_6732 - BLOCK
      ?auto_6734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6731 ?auto_6730 ) ( ON-TABLE ?auto_6730 ) ( not ( = ?auto_6730 ?auto_6731 ) ) ( not ( = ?auto_6730 ?auto_6733 ) ) ( not ( = ?auto_6730 ?auto_6732 ) ) ( not ( = ?auto_6731 ?auto_6733 ) ) ( not ( = ?auto_6731 ?auto_6732 ) ) ( not ( = ?auto_6733 ?auto_6732 ) ) ( ON ?auto_6733 ?auto_6731 ) ( CLEAR ?auto_6733 ) ( HOLDING ?auto_6732 ) ( CLEAR ?auto_6734 ) ( ON-TABLE ?auto_6734 ) ( not ( = ?auto_6734 ?auto_6732 ) ) ( not ( = ?auto_6730 ?auto_6734 ) ) ( not ( = ?auto_6731 ?auto_6734 ) ) ( not ( = ?auto_6733 ?auto_6734 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6734 ?auto_6732 )
      ( MAKE-1PILE ?auto_6730 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6735 - BLOCK
    )
    :vars
    (
      ?auto_6739 - BLOCK
      ?auto_6736 - BLOCK
      ?auto_6737 - BLOCK
      ?auto_6738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6739 ?auto_6735 ) ( ON-TABLE ?auto_6735 ) ( not ( = ?auto_6735 ?auto_6739 ) ) ( not ( = ?auto_6735 ?auto_6736 ) ) ( not ( = ?auto_6735 ?auto_6737 ) ) ( not ( = ?auto_6739 ?auto_6736 ) ) ( not ( = ?auto_6739 ?auto_6737 ) ) ( not ( = ?auto_6736 ?auto_6737 ) ) ( ON ?auto_6736 ?auto_6739 ) ( CLEAR ?auto_6738 ) ( ON-TABLE ?auto_6738 ) ( not ( = ?auto_6738 ?auto_6737 ) ) ( not ( = ?auto_6735 ?auto_6738 ) ) ( not ( = ?auto_6739 ?auto_6738 ) ) ( not ( = ?auto_6736 ?auto_6738 ) ) ( ON ?auto_6737 ?auto_6736 ) ( CLEAR ?auto_6737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6735 ?auto_6739 ?auto_6736 )
      ( MAKE-1PILE ?auto_6735 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6740 - BLOCK
    )
    :vars
    (
      ?auto_6743 - BLOCK
      ?auto_6744 - BLOCK
      ?auto_6742 - BLOCK
      ?auto_6741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6743 ?auto_6740 ) ( ON-TABLE ?auto_6740 ) ( not ( = ?auto_6740 ?auto_6743 ) ) ( not ( = ?auto_6740 ?auto_6744 ) ) ( not ( = ?auto_6740 ?auto_6742 ) ) ( not ( = ?auto_6743 ?auto_6744 ) ) ( not ( = ?auto_6743 ?auto_6742 ) ) ( not ( = ?auto_6744 ?auto_6742 ) ) ( ON ?auto_6744 ?auto_6743 ) ( not ( = ?auto_6741 ?auto_6742 ) ) ( not ( = ?auto_6740 ?auto_6741 ) ) ( not ( = ?auto_6743 ?auto_6741 ) ) ( not ( = ?auto_6744 ?auto_6741 ) ) ( ON ?auto_6742 ?auto_6744 ) ( CLEAR ?auto_6742 ) ( HOLDING ?auto_6741 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6741 )
      ( MAKE-1PILE ?auto_6740 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6745 - BLOCK
    )
    :vars
    (
      ?auto_6748 - BLOCK
      ?auto_6749 - BLOCK
      ?auto_6747 - BLOCK
      ?auto_6746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6748 ?auto_6745 ) ( ON-TABLE ?auto_6745 ) ( not ( = ?auto_6745 ?auto_6748 ) ) ( not ( = ?auto_6745 ?auto_6749 ) ) ( not ( = ?auto_6745 ?auto_6747 ) ) ( not ( = ?auto_6748 ?auto_6749 ) ) ( not ( = ?auto_6748 ?auto_6747 ) ) ( not ( = ?auto_6749 ?auto_6747 ) ) ( ON ?auto_6749 ?auto_6748 ) ( not ( = ?auto_6746 ?auto_6747 ) ) ( not ( = ?auto_6745 ?auto_6746 ) ) ( not ( = ?auto_6748 ?auto_6746 ) ) ( not ( = ?auto_6749 ?auto_6746 ) ) ( ON ?auto_6747 ?auto_6749 ) ( ON ?auto_6746 ?auto_6747 ) ( CLEAR ?auto_6746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6745 ?auto_6748 ?auto_6749 ?auto_6747 )
      ( MAKE-1PILE ?auto_6745 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6754 - BLOCK
      ?auto_6755 - BLOCK
      ?auto_6756 - BLOCK
      ?auto_6757 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6757 ) ( CLEAR ?auto_6756 ) ( ON-TABLE ?auto_6754 ) ( ON ?auto_6755 ?auto_6754 ) ( ON ?auto_6756 ?auto_6755 ) ( not ( = ?auto_6754 ?auto_6755 ) ) ( not ( = ?auto_6754 ?auto_6756 ) ) ( not ( = ?auto_6754 ?auto_6757 ) ) ( not ( = ?auto_6755 ?auto_6756 ) ) ( not ( = ?auto_6755 ?auto_6757 ) ) ( not ( = ?auto_6756 ?auto_6757 ) ) )
    :subtasks
    ( ( !STACK ?auto_6757 ?auto_6756 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6758 - BLOCK
      ?auto_6759 - BLOCK
      ?auto_6760 - BLOCK
      ?auto_6761 - BLOCK
    )
    :vars
    (
      ?auto_6762 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6760 ) ( ON-TABLE ?auto_6758 ) ( ON ?auto_6759 ?auto_6758 ) ( ON ?auto_6760 ?auto_6759 ) ( not ( = ?auto_6758 ?auto_6759 ) ) ( not ( = ?auto_6758 ?auto_6760 ) ) ( not ( = ?auto_6758 ?auto_6761 ) ) ( not ( = ?auto_6759 ?auto_6760 ) ) ( not ( = ?auto_6759 ?auto_6761 ) ) ( not ( = ?auto_6760 ?auto_6761 ) ) ( ON ?auto_6761 ?auto_6762 ) ( CLEAR ?auto_6761 ) ( HAND-EMPTY ) ( not ( = ?auto_6758 ?auto_6762 ) ) ( not ( = ?auto_6759 ?auto_6762 ) ) ( not ( = ?auto_6760 ?auto_6762 ) ) ( not ( = ?auto_6761 ?auto_6762 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6761 ?auto_6762 )
      ( MAKE-4PILE ?auto_6758 ?auto_6759 ?auto_6760 ?auto_6761 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6763 - BLOCK
      ?auto_6764 - BLOCK
      ?auto_6765 - BLOCK
      ?auto_6766 - BLOCK
    )
    :vars
    (
      ?auto_6767 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6763 ) ( ON ?auto_6764 ?auto_6763 ) ( not ( = ?auto_6763 ?auto_6764 ) ) ( not ( = ?auto_6763 ?auto_6765 ) ) ( not ( = ?auto_6763 ?auto_6766 ) ) ( not ( = ?auto_6764 ?auto_6765 ) ) ( not ( = ?auto_6764 ?auto_6766 ) ) ( not ( = ?auto_6765 ?auto_6766 ) ) ( ON ?auto_6766 ?auto_6767 ) ( CLEAR ?auto_6766 ) ( not ( = ?auto_6763 ?auto_6767 ) ) ( not ( = ?auto_6764 ?auto_6767 ) ) ( not ( = ?auto_6765 ?auto_6767 ) ) ( not ( = ?auto_6766 ?auto_6767 ) ) ( HOLDING ?auto_6765 ) ( CLEAR ?auto_6764 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6763 ?auto_6764 ?auto_6765 )
      ( MAKE-4PILE ?auto_6763 ?auto_6764 ?auto_6765 ?auto_6766 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6768 - BLOCK
      ?auto_6769 - BLOCK
      ?auto_6770 - BLOCK
      ?auto_6771 - BLOCK
    )
    :vars
    (
      ?auto_6772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6768 ) ( ON ?auto_6769 ?auto_6768 ) ( not ( = ?auto_6768 ?auto_6769 ) ) ( not ( = ?auto_6768 ?auto_6770 ) ) ( not ( = ?auto_6768 ?auto_6771 ) ) ( not ( = ?auto_6769 ?auto_6770 ) ) ( not ( = ?auto_6769 ?auto_6771 ) ) ( not ( = ?auto_6770 ?auto_6771 ) ) ( ON ?auto_6771 ?auto_6772 ) ( not ( = ?auto_6768 ?auto_6772 ) ) ( not ( = ?auto_6769 ?auto_6772 ) ) ( not ( = ?auto_6770 ?auto_6772 ) ) ( not ( = ?auto_6771 ?auto_6772 ) ) ( CLEAR ?auto_6769 ) ( ON ?auto_6770 ?auto_6771 ) ( CLEAR ?auto_6770 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6772 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6772 ?auto_6771 )
      ( MAKE-4PILE ?auto_6768 ?auto_6769 ?auto_6770 ?auto_6771 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6773 - BLOCK
      ?auto_6774 - BLOCK
      ?auto_6775 - BLOCK
      ?auto_6776 - BLOCK
    )
    :vars
    (
      ?auto_6777 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6773 ) ( not ( = ?auto_6773 ?auto_6774 ) ) ( not ( = ?auto_6773 ?auto_6775 ) ) ( not ( = ?auto_6773 ?auto_6776 ) ) ( not ( = ?auto_6774 ?auto_6775 ) ) ( not ( = ?auto_6774 ?auto_6776 ) ) ( not ( = ?auto_6775 ?auto_6776 ) ) ( ON ?auto_6776 ?auto_6777 ) ( not ( = ?auto_6773 ?auto_6777 ) ) ( not ( = ?auto_6774 ?auto_6777 ) ) ( not ( = ?auto_6775 ?auto_6777 ) ) ( not ( = ?auto_6776 ?auto_6777 ) ) ( ON ?auto_6775 ?auto_6776 ) ( CLEAR ?auto_6775 ) ( ON-TABLE ?auto_6777 ) ( HOLDING ?auto_6774 ) ( CLEAR ?auto_6773 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6773 ?auto_6774 )
      ( MAKE-4PILE ?auto_6773 ?auto_6774 ?auto_6775 ?auto_6776 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6778 - BLOCK
      ?auto_6779 - BLOCK
      ?auto_6780 - BLOCK
      ?auto_6781 - BLOCK
    )
    :vars
    (
      ?auto_6782 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6778 ) ( not ( = ?auto_6778 ?auto_6779 ) ) ( not ( = ?auto_6778 ?auto_6780 ) ) ( not ( = ?auto_6778 ?auto_6781 ) ) ( not ( = ?auto_6779 ?auto_6780 ) ) ( not ( = ?auto_6779 ?auto_6781 ) ) ( not ( = ?auto_6780 ?auto_6781 ) ) ( ON ?auto_6781 ?auto_6782 ) ( not ( = ?auto_6778 ?auto_6782 ) ) ( not ( = ?auto_6779 ?auto_6782 ) ) ( not ( = ?auto_6780 ?auto_6782 ) ) ( not ( = ?auto_6781 ?auto_6782 ) ) ( ON ?auto_6780 ?auto_6781 ) ( ON-TABLE ?auto_6782 ) ( CLEAR ?auto_6778 ) ( ON ?auto_6779 ?auto_6780 ) ( CLEAR ?auto_6779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6782 ?auto_6781 ?auto_6780 )
      ( MAKE-4PILE ?auto_6778 ?auto_6779 ?auto_6780 ?auto_6781 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6783 - BLOCK
      ?auto_6784 - BLOCK
      ?auto_6785 - BLOCK
      ?auto_6786 - BLOCK
    )
    :vars
    (
      ?auto_6787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6783 ?auto_6784 ) ) ( not ( = ?auto_6783 ?auto_6785 ) ) ( not ( = ?auto_6783 ?auto_6786 ) ) ( not ( = ?auto_6784 ?auto_6785 ) ) ( not ( = ?auto_6784 ?auto_6786 ) ) ( not ( = ?auto_6785 ?auto_6786 ) ) ( ON ?auto_6786 ?auto_6787 ) ( not ( = ?auto_6783 ?auto_6787 ) ) ( not ( = ?auto_6784 ?auto_6787 ) ) ( not ( = ?auto_6785 ?auto_6787 ) ) ( not ( = ?auto_6786 ?auto_6787 ) ) ( ON ?auto_6785 ?auto_6786 ) ( ON-TABLE ?auto_6787 ) ( ON ?auto_6784 ?auto_6785 ) ( CLEAR ?auto_6784 ) ( HOLDING ?auto_6783 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6783 )
      ( MAKE-4PILE ?auto_6783 ?auto_6784 ?auto_6785 ?auto_6786 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6788 - BLOCK
      ?auto_6789 - BLOCK
      ?auto_6790 - BLOCK
      ?auto_6791 - BLOCK
    )
    :vars
    (
      ?auto_6792 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6788 ?auto_6789 ) ) ( not ( = ?auto_6788 ?auto_6790 ) ) ( not ( = ?auto_6788 ?auto_6791 ) ) ( not ( = ?auto_6789 ?auto_6790 ) ) ( not ( = ?auto_6789 ?auto_6791 ) ) ( not ( = ?auto_6790 ?auto_6791 ) ) ( ON ?auto_6791 ?auto_6792 ) ( not ( = ?auto_6788 ?auto_6792 ) ) ( not ( = ?auto_6789 ?auto_6792 ) ) ( not ( = ?auto_6790 ?auto_6792 ) ) ( not ( = ?auto_6791 ?auto_6792 ) ) ( ON ?auto_6790 ?auto_6791 ) ( ON-TABLE ?auto_6792 ) ( ON ?auto_6789 ?auto_6790 ) ( ON ?auto_6788 ?auto_6789 ) ( CLEAR ?auto_6788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6792 ?auto_6791 ?auto_6790 ?auto_6789 )
      ( MAKE-4PILE ?auto_6788 ?auto_6789 ?auto_6790 ?auto_6791 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6796 - BLOCK
      ?auto_6797 - BLOCK
      ?auto_6798 - BLOCK
    )
    :vars
    (
      ?auto_6799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6799 ?auto_6798 ) ( CLEAR ?auto_6799 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6796 ) ( ON ?auto_6797 ?auto_6796 ) ( ON ?auto_6798 ?auto_6797 ) ( not ( = ?auto_6796 ?auto_6797 ) ) ( not ( = ?auto_6796 ?auto_6798 ) ) ( not ( = ?auto_6796 ?auto_6799 ) ) ( not ( = ?auto_6797 ?auto_6798 ) ) ( not ( = ?auto_6797 ?auto_6799 ) ) ( not ( = ?auto_6798 ?auto_6799 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6799 ?auto_6798 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6809 - BLOCK
      ?auto_6810 - BLOCK
      ?auto_6811 - BLOCK
    )
    :vars
    (
      ?auto_6812 - BLOCK
      ?auto_6813 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6809 ) ( ON ?auto_6810 ?auto_6809 ) ( not ( = ?auto_6809 ?auto_6810 ) ) ( not ( = ?auto_6809 ?auto_6811 ) ) ( not ( = ?auto_6809 ?auto_6812 ) ) ( not ( = ?auto_6810 ?auto_6811 ) ) ( not ( = ?auto_6810 ?auto_6812 ) ) ( not ( = ?auto_6811 ?auto_6812 ) ) ( ON ?auto_6812 ?auto_6813 ) ( CLEAR ?auto_6812 ) ( not ( = ?auto_6809 ?auto_6813 ) ) ( not ( = ?auto_6810 ?auto_6813 ) ) ( not ( = ?auto_6811 ?auto_6813 ) ) ( not ( = ?auto_6812 ?auto_6813 ) ) ( HOLDING ?auto_6811 ) ( CLEAR ?auto_6810 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6809 ?auto_6810 ?auto_6811 ?auto_6812 )
      ( MAKE-3PILE ?auto_6809 ?auto_6810 ?auto_6811 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6814 - BLOCK
      ?auto_6815 - BLOCK
      ?auto_6816 - BLOCK
    )
    :vars
    (
      ?auto_6817 - BLOCK
      ?auto_6818 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6814 ) ( ON ?auto_6815 ?auto_6814 ) ( not ( = ?auto_6814 ?auto_6815 ) ) ( not ( = ?auto_6814 ?auto_6816 ) ) ( not ( = ?auto_6814 ?auto_6817 ) ) ( not ( = ?auto_6815 ?auto_6816 ) ) ( not ( = ?auto_6815 ?auto_6817 ) ) ( not ( = ?auto_6816 ?auto_6817 ) ) ( ON ?auto_6817 ?auto_6818 ) ( not ( = ?auto_6814 ?auto_6818 ) ) ( not ( = ?auto_6815 ?auto_6818 ) ) ( not ( = ?auto_6816 ?auto_6818 ) ) ( not ( = ?auto_6817 ?auto_6818 ) ) ( CLEAR ?auto_6815 ) ( ON ?auto_6816 ?auto_6817 ) ( CLEAR ?auto_6816 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6818 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6818 ?auto_6817 )
      ( MAKE-3PILE ?auto_6814 ?auto_6815 ?auto_6816 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6819 - BLOCK
      ?auto_6820 - BLOCK
      ?auto_6821 - BLOCK
    )
    :vars
    (
      ?auto_6822 - BLOCK
      ?auto_6823 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6819 ) ( not ( = ?auto_6819 ?auto_6820 ) ) ( not ( = ?auto_6819 ?auto_6821 ) ) ( not ( = ?auto_6819 ?auto_6822 ) ) ( not ( = ?auto_6820 ?auto_6821 ) ) ( not ( = ?auto_6820 ?auto_6822 ) ) ( not ( = ?auto_6821 ?auto_6822 ) ) ( ON ?auto_6822 ?auto_6823 ) ( not ( = ?auto_6819 ?auto_6823 ) ) ( not ( = ?auto_6820 ?auto_6823 ) ) ( not ( = ?auto_6821 ?auto_6823 ) ) ( not ( = ?auto_6822 ?auto_6823 ) ) ( ON ?auto_6821 ?auto_6822 ) ( CLEAR ?auto_6821 ) ( ON-TABLE ?auto_6823 ) ( HOLDING ?auto_6820 ) ( CLEAR ?auto_6819 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6819 ?auto_6820 )
      ( MAKE-3PILE ?auto_6819 ?auto_6820 ?auto_6821 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6824 - BLOCK
      ?auto_6825 - BLOCK
      ?auto_6826 - BLOCK
    )
    :vars
    (
      ?auto_6828 - BLOCK
      ?auto_6827 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6824 ) ( not ( = ?auto_6824 ?auto_6825 ) ) ( not ( = ?auto_6824 ?auto_6826 ) ) ( not ( = ?auto_6824 ?auto_6828 ) ) ( not ( = ?auto_6825 ?auto_6826 ) ) ( not ( = ?auto_6825 ?auto_6828 ) ) ( not ( = ?auto_6826 ?auto_6828 ) ) ( ON ?auto_6828 ?auto_6827 ) ( not ( = ?auto_6824 ?auto_6827 ) ) ( not ( = ?auto_6825 ?auto_6827 ) ) ( not ( = ?auto_6826 ?auto_6827 ) ) ( not ( = ?auto_6828 ?auto_6827 ) ) ( ON ?auto_6826 ?auto_6828 ) ( ON-TABLE ?auto_6827 ) ( CLEAR ?auto_6824 ) ( ON ?auto_6825 ?auto_6826 ) ( CLEAR ?auto_6825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6827 ?auto_6828 ?auto_6826 )
      ( MAKE-3PILE ?auto_6824 ?auto_6825 ?auto_6826 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6829 - BLOCK
      ?auto_6830 - BLOCK
      ?auto_6831 - BLOCK
    )
    :vars
    (
      ?auto_6833 - BLOCK
      ?auto_6832 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6829 ?auto_6830 ) ) ( not ( = ?auto_6829 ?auto_6831 ) ) ( not ( = ?auto_6829 ?auto_6833 ) ) ( not ( = ?auto_6830 ?auto_6831 ) ) ( not ( = ?auto_6830 ?auto_6833 ) ) ( not ( = ?auto_6831 ?auto_6833 ) ) ( ON ?auto_6833 ?auto_6832 ) ( not ( = ?auto_6829 ?auto_6832 ) ) ( not ( = ?auto_6830 ?auto_6832 ) ) ( not ( = ?auto_6831 ?auto_6832 ) ) ( not ( = ?auto_6833 ?auto_6832 ) ) ( ON ?auto_6831 ?auto_6833 ) ( ON-TABLE ?auto_6832 ) ( ON ?auto_6830 ?auto_6831 ) ( CLEAR ?auto_6830 ) ( HOLDING ?auto_6829 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6829 )
      ( MAKE-3PILE ?auto_6829 ?auto_6830 ?auto_6831 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6834 - BLOCK
      ?auto_6835 - BLOCK
      ?auto_6836 - BLOCK
    )
    :vars
    (
      ?auto_6837 - BLOCK
      ?auto_6838 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6834 ?auto_6835 ) ) ( not ( = ?auto_6834 ?auto_6836 ) ) ( not ( = ?auto_6834 ?auto_6837 ) ) ( not ( = ?auto_6835 ?auto_6836 ) ) ( not ( = ?auto_6835 ?auto_6837 ) ) ( not ( = ?auto_6836 ?auto_6837 ) ) ( ON ?auto_6837 ?auto_6838 ) ( not ( = ?auto_6834 ?auto_6838 ) ) ( not ( = ?auto_6835 ?auto_6838 ) ) ( not ( = ?auto_6836 ?auto_6838 ) ) ( not ( = ?auto_6837 ?auto_6838 ) ) ( ON ?auto_6836 ?auto_6837 ) ( ON-TABLE ?auto_6838 ) ( ON ?auto_6835 ?auto_6836 ) ( ON ?auto_6834 ?auto_6835 ) ( CLEAR ?auto_6834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6838 ?auto_6837 ?auto_6836 ?auto_6835 )
      ( MAKE-3PILE ?auto_6834 ?auto_6835 ?auto_6836 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6840 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6840 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_6840 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6841 - BLOCK
    )
    :vars
    (
      ?auto_6842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6841 ?auto_6842 ) ( CLEAR ?auto_6841 ) ( HAND-EMPTY ) ( not ( = ?auto_6841 ?auto_6842 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6841 ?auto_6842 )
      ( MAKE-1PILE ?auto_6841 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6843 - BLOCK
    )
    :vars
    (
      ?auto_6844 - BLOCK
      ?auto_6846 - BLOCK
      ?auto_6845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6843 ?auto_6844 ) ) ( HOLDING ?auto_6843 ) ( CLEAR ?auto_6844 ) ( ON-TABLE ?auto_6846 ) ( ON ?auto_6845 ?auto_6846 ) ( ON ?auto_6844 ?auto_6845 ) ( not ( = ?auto_6846 ?auto_6845 ) ) ( not ( = ?auto_6846 ?auto_6844 ) ) ( not ( = ?auto_6846 ?auto_6843 ) ) ( not ( = ?auto_6845 ?auto_6844 ) ) ( not ( = ?auto_6845 ?auto_6843 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6846 ?auto_6845 ?auto_6844 ?auto_6843 )
      ( MAKE-1PILE ?auto_6843 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6847 - BLOCK
    )
    :vars
    (
      ?auto_6848 - BLOCK
      ?auto_6850 - BLOCK
      ?auto_6849 - BLOCK
      ?auto_6851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6847 ?auto_6848 ) ) ( CLEAR ?auto_6848 ) ( ON-TABLE ?auto_6850 ) ( ON ?auto_6849 ?auto_6850 ) ( ON ?auto_6848 ?auto_6849 ) ( not ( = ?auto_6850 ?auto_6849 ) ) ( not ( = ?auto_6850 ?auto_6848 ) ) ( not ( = ?auto_6850 ?auto_6847 ) ) ( not ( = ?auto_6849 ?auto_6848 ) ) ( not ( = ?auto_6849 ?auto_6847 ) ) ( ON ?auto_6847 ?auto_6851 ) ( CLEAR ?auto_6847 ) ( HAND-EMPTY ) ( not ( = ?auto_6847 ?auto_6851 ) ) ( not ( = ?auto_6848 ?auto_6851 ) ) ( not ( = ?auto_6850 ?auto_6851 ) ) ( not ( = ?auto_6849 ?auto_6851 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6847 ?auto_6851 )
      ( MAKE-1PILE ?auto_6847 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6852 - BLOCK
    )
    :vars
    (
      ?auto_6854 - BLOCK
      ?auto_6856 - BLOCK
      ?auto_6855 - BLOCK
      ?auto_6853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6852 ?auto_6854 ) ) ( ON-TABLE ?auto_6856 ) ( ON ?auto_6855 ?auto_6856 ) ( not ( = ?auto_6856 ?auto_6855 ) ) ( not ( = ?auto_6856 ?auto_6854 ) ) ( not ( = ?auto_6856 ?auto_6852 ) ) ( not ( = ?auto_6855 ?auto_6854 ) ) ( not ( = ?auto_6855 ?auto_6852 ) ) ( ON ?auto_6852 ?auto_6853 ) ( CLEAR ?auto_6852 ) ( not ( = ?auto_6852 ?auto_6853 ) ) ( not ( = ?auto_6854 ?auto_6853 ) ) ( not ( = ?auto_6856 ?auto_6853 ) ) ( not ( = ?auto_6855 ?auto_6853 ) ) ( HOLDING ?auto_6854 ) ( CLEAR ?auto_6855 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6856 ?auto_6855 ?auto_6854 )
      ( MAKE-1PILE ?auto_6852 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6857 - BLOCK
    )
    :vars
    (
      ?auto_6859 - BLOCK
      ?auto_6860 - BLOCK
      ?auto_6861 - BLOCK
      ?auto_6858 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6857 ?auto_6859 ) ) ( ON-TABLE ?auto_6860 ) ( ON ?auto_6861 ?auto_6860 ) ( not ( = ?auto_6860 ?auto_6861 ) ) ( not ( = ?auto_6860 ?auto_6859 ) ) ( not ( = ?auto_6860 ?auto_6857 ) ) ( not ( = ?auto_6861 ?auto_6859 ) ) ( not ( = ?auto_6861 ?auto_6857 ) ) ( ON ?auto_6857 ?auto_6858 ) ( not ( = ?auto_6857 ?auto_6858 ) ) ( not ( = ?auto_6859 ?auto_6858 ) ) ( not ( = ?auto_6860 ?auto_6858 ) ) ( not ( = ?auto_6861 ?auto_6858 ) ) ( CLEAR ?auto_6861 ) ( ON ?auto_6859 ?auto_6857 ) ( CLEAR ?auto_6859 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6858 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6858 ?auto_6857 )
      ( MAKE-1PILE ?auto_6857 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6862 - BLOCK
    )
    :vars
    (
      ?auto_6865 - BLOCK
      ?auto_6866 - BLOCK
      ?auto_6864 - BLOCK
      ?auto_6863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6862 ?auto_6865 ) ) ( ON-TABLE ?auto_6866 ) ( not ( = ?auto_6866 ?auto_6864 ) ) ( not ( = ?auto_6866 ?auto_6865 ) ) ( not ( = ?auto_6866 ?auto_6862 ) ) ( not ( = ?auto_6864 ?auto_6865 ) ) ( not ( = ?auto_6864 ?auto_6862 ) ) ( ON ?auto_6862 ?auto_6863 ) ( not ( = ?auto_6862 ?auto_6863 ) ) ( not ( = ?auto_6865 ?auto_6863 ) ) ( not ( = ?auto_6866 ?auto_6863 ) ) ( not ( = ?auto_6864 ?auto_6863 ) ) ( ON ?auto_6865 ?auto_6862 ) ( CLEAR ?auto_6865 ) ( ON-TABLE ?auto_6863 ) ( HOLDING ?auto_6864 ) ( CLEAR ?auto_6866 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6866 ?auto_6864 )
      ( MAKE-1PILE ?auto_6862 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6867 - BLOCK
    )
    :vars
    (
      ?auto_6870 - BLOCK
      ?auto_6868 - BLOCK
      ?auto_6871 - BLOCK
      ?auto_6869 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6867 ?auto_6870 ) ) ( ON-TABLE ?auto_6868 ) ( not ( = ?auto_6868 ?auto_6871 ) ) ( not ( = ?auto_6868 ?auto_6870 ) ) ( not ( = ?auto_6868 ?auto_6867 ) ) ( not ( = ?auto_6871 ?auto_6870 ) ) ( not ( = ?auto_6871 ?auto_6867 ) ) ( ON ?auto_6867 ?auto_6869 ) ( not ( = ?auto_6867 ?auto_6869 ) ) ( not ( = ?auto_6870 ?auto_6869 ) ) ( not ( = ?auto_6868 ?auto_6869 ) ) ( not ( = ?auto_6871 ?auto_6869 ) ) ( ON ?auto_6870 ?auto_6867 ) ( ON-TABLE ?auto_6869 ) ( CLEAR ?auto_6868 ) ( ON ?auto_6871 ?auto_6870 ) ( CLEAR ?auto_6871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6869 ?auto_6867 ?auto_6870 )
      ( MAKE-1PILE ?auto_6867 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6872 - BLOCK
    )
    :vars
    (
      ?auto_6874 - BLOCK
      ?auto_6876 - BLOCK
      ?auto_6873 - BLOCK
      ?auto_6875 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6872 ?auto_6874 ) ) ( not ( = ?auto_6876 ?auto_6873 ) ) ( not ( = ?auto_6876 ?auto_6874 ) ) ( not ( = ?auto_6876 ?auto_6872 ) ) ( not ( = ?auto_6873 ?auto_6874 ) ) ( not ( = ?auto_6873 ?auto_6872 ) ) ( ON ?auto_6872 ?auto_6875 ) ( not ( = ?auto_6872 ?auto_6875 ) ) ( not ( = ?auto_6874 ?auto_6875 ) ) ( not ( = ?auto_6876 ?auto_6875 ) ) ( not ( = ?auto_6873 ?auto_6875 ) ) ( ON ?auto_6874 ?auto_6872 ) ( ON-TABLE ?auto_6875 ) ( ON ?auto_6873 ?auto_6874 ) ( CLEAR ?auto_6873 ) ( HOLDING ?auto_6876 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6876 )
      ( MAKE-1PILE ?auto_6872 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6877 - BLOCK
    )
    :vars
    (
      ?auto_6881 - BLOCK
      ?auto_6879 - BLOCK
      ?auto_6878 - BLOCK
      ?auto_6880 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6877 ?auto_6881 ) ) ( not ( = ?auto_6879 ?auto_6878 ) ) ( not ( = ?auto_6879 ?auto_6881 ) ) ( not ( = ?auto_6879 ?auto_6877 ) ) ( not ( = ?auto_6878 ?auto_6881 ) ) ( not ( = ?auto_6878 ?auto_6877 ) ) ( ON ?auto_6877 ?auto_6880 ) ( not ( = ?auto_6877 ?auto_6880 ) ) ( not ( = ?auto_6881 ?auto_6880 ) ) ( not ( = ?auto_6879 ?auto_6880 ) ) ( not ( = ?auto_6878 ?auto_6880 ) ) ( ON ?auto_6881 ?auto_6877 ) ( ON-TABLE ?auto_6880 ) ( ON ?auto_6878 ?auto_6881 ) ( ON ?auto_6879 ?auto_6878 ) ( CLEAR ?auto_6879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6880 ?auto_6877 ?auto_6881 ?auto_6878 )
      ( MAKE-1PILE ?auto_6877 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6884 - BLOCK
      ?auto_6885 - BLOCK
    )
    :vars
    (
      ?auto_6886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6886 ?auto_6885 ) ( CLEAR ?auto_6886 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6884 ) ( ON ?auto_6885 ?auto_6884 ) ( not ( = ?auto_6884 ?auto_6885 ) ) ( not ( = ?auto_6884 ?auto_6886 ) ) ( not ( = ?auto_6885 ?auto_6886 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6886 ?auto_6885 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6887 - BLOCK
      ?auto_6888 - BLOCK
    )
    :vars
    (
      ?auto_6889 - BLOCK
      ?auto_6890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6889 ?auto_6888 ) ( CLEAR ?auto_6889 ) ( ON-TABLE ?auto_6887 ) ( ON ?auto_6888 ?auto_6887 ) ( not ( = ?auto_6887 ?auto_6888 ) ) ( not ( = ?auto_6887 ?auto_6889 ) ) ( not ( = ?auto_6888 ?auto_6889 ) ) ( HOLDING ?auto_6890 ) ( not ( = ?auto_6887 ?auto_6890 ) ) ( not ( = ?auto_6888 ?auto_6890 ) ) ( not ( = ?auto_6889 ?auto_6890 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_6890 )
      ( MAKE-2PILE ?auto_6887 ?auto_6888 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6891 - BLOCK
      ?auto_6892 - BLOCK
    )
    :vars
    (
      ?auto_6894 - BLOCK
      ?auto_6893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6894 ?auto_6892 ) ( ON-TABLE ?auto_6891 ) ( ON ?auto_6892 ?auto_6891 ) ( not ( = ?auto_6891 ?auto_6892 ) ) ( not ( = ?auto_6891 ?auto_6894 ) ) ( not ( = ?auto_6892 ?auto_6894 ) ) ( not ( = ?auto_6891 ?auto_6893 ) ) ( not ( = ?auto_6892 ?auto_6893 ) ) ( not ( = ?auto_6894 ?auto_6893 ) ) ( ON ?auto_6893 ?auto_6894 ) ( CLEAR ?auto_6893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6891 ?auto_6892 ?auto_6894 )
      ( MAKE-2PILE ?auto_6891 ?auto_6892 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6895 - BLOCK
      ?auto_6896 - BLOCK
    )
    :vars
    (
      ?auto_6897 - BLOCK
      ?auto_6898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6897 ?auto_6896 ) ( ON-TABLE ?auto_6895 ) ( ON ?auto_6896 ?auto_6895 ) ( not ( = ?auto_6895 ?auto_6896 ) ) ( not ( = ?auto_6895 ?auto_6897 ) ) ( not ( = ?auto_6896 ?auto_6897 ) ) ( not ( = ?auto_6895 ?auto_6898 ) ) ( not ( = ?auto_6896 ?auto_6898 ) ) ( not ( = ?auto_6897 ?auto_6898 ) ) ( HOLDING ?auto_6898 ) ( CLEAR ?auto_6897 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6895 ?auto_6896 ?auto_6897 ?auto_6898 )
      ( MAKE-2PILE ?auto_6895 ?auto_6896 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6899 - BLOCK
      ?auto_6900 - BLOCK
    )
    :vars
    (
      ?auto_6901 - BLOCK
      ?auto_6902 - BLOCK
      ?auto_6903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6901 ?auto_6900 ) ( ON-TABLE ?auto_6899 ) ( ON ?auto_6900 ?auto_6899 ) ( not ( = ?auto_6899 ?auto_6900 ) ) ( not ( = ?auto_6899 ?auto_6901 ) ) ( not ( = ?auto_6900 ?auto_6901 ) ) ( not ( = ?auto_6899 ?auto_6902 ) ) ( not ( = ?auto_6900 ?auto_6902 ) ) ( not ( = ?auto_6901 ?auto_6902 ) ) ( CLEAR ?auto_6901 ) ( ON ?auto_6902 ?auto_6903 ) ( CLEAR ?auto_6902 ) ( HAND-EMPTY ) ( not ( = ?auto_6899 ?auto_6903 ) ) ( not ( = ?auto_6900 ?auto_6903 ) ) ( not ( = ?auto_6901 ?auto_6903 ) ) ( not ( = ?auto_6902 ?auto_6903 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6902 ?auto_6903 )
      ( MAKE-2PILE ?auto_6899 ?auto_6900 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6914 - BLOCK
      ?auto_6915 - BLOCK
    )
    :vars
    (
      ?auto_6918 - BLOCK
      ?auto_6917 - BLOCK
      ?auto_6916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6914 ) ( not ( = ?auto_6914 ?auto_6915 ) ) ( not ( = ?auto_6914 ?auto_6918 ) ) ( not ( = ?auto_6915 ?auto_6918 ) ) ( not ( = ?auto_6914 ?auto_6917 ) ) ( not ( = ?auto_6915 ?auto_6917 ) ) ( not ( = ?auto_6918 ?auto_6917 ) ) ( ON ?auto_6917 ?auto_6916 ) ( not ( = ?auto_6914 ?auto_6916 ) ) ( not ( = ?auto_6915 ?auto_6916 ) ) ( not ( = ?auto_6918 ?auto_6916 ) ) ( not ( = ?auto_6917 ?auto_6916 ) ) ( ON ?auto_6918 ?auto_6917 ) ( CLEAR ?auto_6918 ) ( HOLDING ?auto_6915 ) ( CLEAR ?auto_6914 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6914 ?auto_6915 ?auto_6918 )
      ( MAKE-2PILE ?auto_6914 ?auto_6915 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6919 - BLOCK
      ?auto_6920 - BLOCK
    )
    :vars
    (
      ?auto_6921 - BLOCK
      ?auto_6923 - BLOCK
      ?auto_6922 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6919 ) ( not ( = ?auto_6919 ?auto_6920 ) ) ( not ( = ?auto_6919 ?auto_6921 ) ) ( not ( = ?auto_6920 ?auto_6921 ) ) ( not ( = ?auto_6919 ?auto_6923 ) ) ( not ( = ?auto_6920 ?auto_6923 ) ) ( not ( = ?auto_6921 ?auto_6923 ) ) ( ON ?auto_6923 ?auto_6922 ) ( not ( = ?auto_6919 ?auto_6922 ) ) ( not ( = ?auto_6920 ?auto_6922 ) ) ( not ( = ?auto_6921 ?auto_6922 ) ) ( not ( = ?auto_6923 ?auto_6922 ) ) ( ON ?auto_6921 ?auto_6923 ) ( CLEAR ?auto_6919 ) ( ON ?auto_6920 ?auto_6921 ) ( CLEAR ?auto_6920 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6922 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6922 ?auto_6923 ?auto_6921 )
      ( MAKE-2PILE ?auto_6919 ?auto_6920 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6924 - BLOCK
      ?auto_6925 - BLOCK
    )
    :vars
    (
      ?auto_6928 - BLOCK
      ?auto_6926 - BLOCK
      ?auto_6927 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6924 ?auto_6925 ) ) ( not ( = ?auto_6924 ?auto_6928 ) ) ( not ( = ?auto_6925 ?auto_6928 ) ) ( not ( = ?auto_6924 ?auto_6926 ) ) ( not ( = ?auto_6925 ?auto_6926 ) ) ( not ( = ?auto_6928 ?auto_6926 ) ) ( ON ?auto_6926 ?auto_6927 ) ( not ( = ?auto_6924 ?auto_6927 ) ) ( not ( = ?auto_6925 ?auto_6927 ) ) ( not ( = ?auto_6928 ?auto_6927 ) ) ( not ( = ?auto_6926 ?auto_6927 ) ) ( ON ?auto_6928 ?auto_6926 ) ( ON ?auto_6925 ?auto_6928 ) ( CLEAR ?auto_6925 ) ( ON-TABLE ?auto_6927 ) ( HOLDING ?auto_6924 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6924 )
      ( MAKE-2PILE ?auto_6924 ?auto_6925 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6929 - BLOCK
      ?auto_6930 - BLOCK
    )
    :vars
    (
      ?auto_6931 - BLOCK
      ?auto_6933 - BLOCK
      ?auto_6932 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6929 ?auto_6930 ) ) ( not ( = ?auto_6929 ?auto_6931 ) ) ( not ( = ?auto_6930 ?auto_6931 ) ) ( not ( = ?auto_6929 ?auto_6933 ) ) ( not ( = ?auto_6930 ?auto_6933 ) ) ( not ( = ?auto_6931 ?auto_6933 ) ) ( ON ?auto_6933 ?auto_6932 ) ( not ( = ?auto_6929 ?auto_6932 ) ) ( not ( = ?auto_6930 ?auto_6932 ) ) ( not ( = ?auto_6931 ?auto_6932 ) ) ( not ( = ?auto_6933 ?auto_6932 ) ) ( ON ?auto_6931 ?auto_6933 ) ( ON ?auto_6930 ?auto_6931 ) ( ON-TABLE ?auto_6932 ) ( ON ?auto_6929 ?auto_6930 ) ( CLEAR ?auto_6929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6932 ?auto_6933 ?auto_6931 ?auto_6930 )
      ( MAKE-2PILE ?auto_6929 ?auto_6930 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6936 - BLOCK
      ?auto_6937 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6937 ) ( CLEAR ?auto_6936 ) ( ON-TABLE ?auto_6936 ) ( not ( = ?auto_6936 ?auto_6937 ) ) )
    :subtasks
    ( ( !STACK ?auto_6937 ?auto_6936 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6938 - BLOCK
      ?auto_6939 - BLOCK
    )
    :vars
    (
      ?auto_6940 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6938 ) ( ON-TABLE ?auto_6938 ) ( not ( = ?auto_6938 ?auto_6939 ) ) ( ON ?auto_6939 ?auto_6940 ) ( CLEAR ?auto_6939 ) ( HAND-EMPTY ) ( not ( = ?auto_6938 ?auto_6940 ) ) ( not ( = ?auto_6939 ?auto_6940 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6939 ?auto_6940 )
      ( MAKE-2PILE ?auto_6938 ?auto_6939 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6941 - BLOCK
      ?auto_6942 - BLOCK
    )
    :vars
    (
      ?auto_6943 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6941 ?auto_6942 ) ) ( ON ?auto_6942 ?auto_6943 ) ( CLEAR ?auto_6942 ) ( not ( = ?auto_6941 ?auto_6943 ) ) ( not ( = ?auto_6942 ?auto_6943 ) ) ( HOLDING ?auto_6941 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6941 )
      ( MAKE-2PILE ?auto_6941 ?auto_6942 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6944 - BLOCK
      ?auto_6945 - BLOCK
    )
    :vars
    (
      ?auto_6946 - BLOCK
      ?auto_6947 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6944 ?auto_6945 ) ) ( ON ?auto_6945 ?auto_6946 ) ( not ( = ?auto_6944 ?auto_6946 ) ) ( not ( = ?auto_6945 ?auto_6946 ) ) ( ON ?auto_6944 ?auto_6945 ) ( CLEAR ?auto_6944 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6947 ) ( ON ?auto_6946 ?auto_6947 ) ( not ( = ?auto_6947 ?auto_6946 ) ) ( not ( = ?auto_6947 ?auto_6945 ) ) ( not ( = ?auto_6947 ?auto_6944 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6947 ?auto_6946 ?auto_6945 )
      ( MAKE-2PILE ?auto_6944 ?auto_6945 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6948 - BLOCK
      ?auto_6949 - BLOCK
    )
    :vars
    (
      ?auto_6951 - BLOCK
      ?auto_6950 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6948 ?auto_6949 ) ) ( ON ?auto_6949 ?auto_6951 ) ( not ( = ?auto_6948 ?auto_6951 ) ) ( not ( = ?auto_6949 ?auto_6951 ) ) ( ON-TABLE ?auto_6950 ) ( ON ?auto_6951 ?auto_6950 ) ( not ( = ?auto_6950 ?auto_6951 ) ) ( not ( = ?auto_6950 ?auto_6949 ) ) ( not ( = ?auto_6950 ?auto_6948 ) ) ( HOLDING ?auto_6948 ) ( CLEAR ?auto_6949 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6950 ?auto_6951 ?auto_6949 ?auto_6948 )
      ( MAKE-2PILE ?auto_6948 ?auto_6949 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6952 - BLOCK
      ?auto_6953 - BLOCK
    )
    :vars
    (
      ?auto_6954 - BLOCK
      ?auto_6955 - BLOCK
      ?auto_6956 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6952 ?auto_6953 ) ) ( ON ?auto_6953 ?auto_6954 ) ( not ( = ?auto_6952 ?auto_6954 ) ) ( not ( = ?auto_6953 ?auto_6954 ) ) ( ON-TABLE ?auto_6955 ) ( ON ?auto_6954 ?auto_6955 ) ( not ( = ?auto_6955 ?auto_6954 ) ) ( not ( = ?auto_6955 ?auto_6953 ) ) ( not ( = ?auto_6955 ?auto_6952 ) ) ( CLEAR ?auto_6953 ) ( ON ?auto_6952 ?auto_6956 ) ( CLEAR ?auto_6952 ) ( HAND-EMPTY ) ( not ( = ?auto_6952 ?auto_6956 ) ) ( not ( = ?auto_6953 ?auto_6956 ) ) ( not ( = ?auto_6954 ?auto_6956 ) ) ( not ( = ?auto_6955 ?auto_6956 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6952 ?auto_6956 )
      ( MAKE-2PILE ?auto_6952 ?auto_6953 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6957 - BLOCK
      ?auto_6958 - BLOCK
    )
    :vars
    (
      ?auto_6961 - BLOCK
      ?auto_6960 - BLOCK
      ?auto_6959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6957 ?auto_6958 ) ) ( not ( = ?auto_6957 ?auto_6961 ) ) ( not ( = ?auto_6958 ?auto_6961 ) ) ( ON-TABLE ?auto_6960 ) ( ON ?auto_6961 ?auto_6960 ) ( not ( = ?auto_6960 ?auto_6961 ) ) ( not ( = ?auto_6960 ?auto_6958 ) ) ( not ( = ?auto_6960 ?auto_6957 ) ) ( ON ?auto_6957 ?auto_6959 ) ( CLEAR ?auto_6957 ) ( not ( = ?auto_6957 ?auto_6959 ) ) ( not ( = ?auto_6958 ?auto_6959 ) ) ( not ( = ?auto_6961 ?auto_6959 ) ) ( not ( = ?auto_6960 ?auto_6959 ) ) ( HOLDING ?auto_6958 ) ( CLEAR ?auto_6961 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6960 ?auto_6961 ?auto_6958 )
      ( MAKE-2PILE ?auto_6957 ?auto_6958 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6962 - BLOCK
      ?auto_6963 - BLOCK
    )
    :vars
    (
      ?auto_6965 - BLOCK
      ?auto_6964 - BLOCK
      ?auto_6966 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6962 ?auto_6963 ) ) ( not ( = ?auto_6962 ?auto_6965 ) ) ( not ( = ?auto_6963 ?auto_6965 ) ) ( ON-TABLE ?auto_6964 ) ( ON ?auto_6965 ?auto_6964 ) ( not ( = ?auto_6964 ?auto_6965 ) ) ( not ( = ?auto_6964 ?auto_6963 ) ) ( not ( = ?auto_6964 ?auto_6962 ) ) ( ON ?auto_6962 ?auto_6966 ) ( not ( = ?auto_6962 ?auto_6966 ) ) ( not ( = ?auto_6963 ?auto_6966 ) ) ( not ( = ?auto_6965 ?auto_6966 ) ) ( not ( = ?auto_6964 ?auto_6966 ) ) ( CLEAR ?auto_6965 ) ( ON ?auto_6963 ?auto_6962 ) ( CLEAR ?auto_6963 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6966 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6966 ?auto_6962 )
      ( MAKE-2PILE ?auto_6962 ?auto_6963 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6967 - BLOCK
      ?auto_6968 - BLOCK
    )
    :vars
    (
      ?auto_6970 - BLOCK
      ?auto_6971 - BLOCK
      ?auto_6969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6967 ?auto_6968 ) ) ( not ( = ?auto_6967 ?auto_6970 ) ) ( not ( = ?auto_6968 ?auto_6970 ) ) ( ON-TABLE ?auto_6971 ) ( not ( = ?auto_6971 ?auto_6970 ) ) ( not ( = ?auto_6971 ?auto_6968 ) ) ( not ( = ?auto_6971 ?auto_6967 ) ) ( ON ?auto_6967 ?auto_6969 ) ( not ( = ?auto_6967 ?auto_6969 ) ) ( not ( = ?auto_6968 ?auto_6969 ) ) ( not ( = ?auto_6970 ?auto_6969 ) ) ( not ( = ?auto_6971 ?auto_6969 ) ) ( ON ?auto_6968 ?auto_6967 ) ( CLEAR ?auto_6968 ) ( ON-TABLE ?auto_6969 ) ( HOLDING ?auto_6970 ) ( CLEAR ?auto_6971 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6971 ?auto_6970 )
      ( MAKE-2PILE ?auto_6967 ?auto_6968 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6972 - BLOCK
      ?auto_6973 - BLOCK
    )
    :vars
    (
      ?auto_6975 - BLOCK
      ?auto_6974 - BLOCK
      ?auto_6976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6972 ?auto_6973 ) ) ( not ( = ?auto_6972 ?auto_6975 ) ) ( not ( = ?auto_6973 ?auto_6975 ) ) ( ON-TABLE ?auto_6974 ) ( not ( = ?auto_6974 ?auto_6975 ) ) ( not ( = ?auto_6974 ?auto_6973 ) ) ( not ( = ?auto_6974 ?auto_6972 ) ) ( ON ?auto_6972 ?auto_6976 ) ( not ( = ?auto_6972 ?auto_6976 ) ) ( not ( = ?auto_6973 ?auto_6976 ) ) ( not ( = ?auto_6975 ?auto_6976 ) ) ( not ( = ?auto_6974 ?auto_6976 ) ) ( ON ?auto_6973 ?auto_6972 ) ( ON-TABLE ?auto_6976 ) ( CLEAR ?auto_6974 ) ( ON ?auto_6975 ?auto_6973 ) ( CLEAR ?auto_6975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6976 ?auto_6972 ?auto_6973 )
      ( MAKE-2PILE ?auto_6972 ?auto_6973 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6977 - BLOCK
      ?auto_6978 - BLOCK
    )
    :vars
    (
      ?auto_6981 - BLOCK
      ?auto_6980 - BLOCK
      ?auto_6979 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6977 ?auto_6978 ) ) ( not ( = ?auto_6977 ?auto_6981 ) ) ( not ( = ?auto_6978 ?auto_6981 ) ) ( not ( = ?auto_6980 ?auto_6981 ) ) ( not ( = ?auto_6980 ?auto_6978 ) ) ( not ( = ?auto_6980 ?auto_6977 ) ) ( ON ?auto_6977 ?auto_6979 ) ( not ( = ?auto_6977 ?auto_6979 ) ) ( not ( = ?auto_6978 ?auto_6979 ) ) ( not ( = ?auto_6981 ?auto_6979 ) ) ( not ( = ?auto_6980 ?auto_6979 ) ) ( ON ?auto_6978 ?auto_6977 ) ( ON-TABLE ?auto_6979 ) ( ON ?auto_6981 ?auto_6978 ) ( CLEAR ?auto_6981 ) ( HOLDING ?auto_6980 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6980 )
      ( MAKE-2PILE ?auto_6977 ?auto_6978 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6982 - BLOCK
      ?auto_6983 - BLOCK
    )
    :vars
    (
      ?auto_6984 - BLOCK
      ?auto_6986 - BLOCK
      ?auto_6985 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6982 ?auto_6983 ) ) ( not ( = ?auto_6982 ?auto_6984 ) ) ( not ( = ?auto_6983 ?auto_6984 ) ) ( not ( = ?auto_6986 ?auto_6984 ) ) ( not ( = ?auto_6986 ?auto_6983 ) ) ( not ( = ?auto_6986 ?auto_6982 ) ) ( ON ?auto_6982 ?auto_6985 ) ( not ( = ?auto_6982 ?auto_6985 ) ) ( not ( = ?auto_6983 ?auto_6985 ) ) ( not ( = ?auto_6984 ?auto_6985 ) ) ( not ( = ?auto_6986 ?auto_6985 ) ) ( ON ?auto_6983 ?auto_6982 ) ( ON-TABLE ?auto_6985 ) ( ON ?auto_6984 ?auto_6983 ) ( ON ?auto_6986 ?auto_6984 ) ( CLEAR ?auto_6986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6985 ?auto_6982 ?auto_6983 ?auto_6984 )
      ( MAKE-2PILE ?auto_6982 ?auto_6983 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6988 - BLOCK
    )
    :vars
    (
      ?auto_6989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6989 ?auto_6988 ) ( CLEAR ?auto_6989 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6988 ) ( not ( = ?auto_6988 ?auto_6989 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6989 ?auto_6988 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6990 - BLOCK
    )
    :vars
    (
      ?auto_6991 - BLOCK
      ?auto_6992 - BLOCK
      ?auto_6993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6991 ?auto_6990 ) ( CLEAR ?auto_6991 ) ( ON-TABLE ?auto_6990 ) ( not ( = ?auto_6990 ?auto_6991 ) ) ( HOLDING ?auto_6992 ) ( CLEAR ?auto_6993 ) ( not ( = ?auto_6990 ?auto_6992 ) ) ( not ( = ?auto_6990 ?auto_6993 ) ) ( not ( = ?auto_6991 ?auto_6992 ) ) ( not ( = ?auto_6991 ?auto_6993 ) ) ( not ( = ?auto_6992 ?auto_6993 ) ) )
    :subtasks
    ( ( !STACK ?auto_6992 ?auto_6993 )
      ( MAKE-1PILE ?auto_6990 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6994 - BLOCK
    )
    :vars
    (
      ?auto_6997 - BLOCK
      ?auto_6995 - BLOCK
      ?auto_6996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6997 ?auto_6994 ) ( ON-TABLE ?auto_6994 ) ( not ( = ?auto_6994 ?auto_6997 ) ) ( CLEAR ?auto_6995 ) ( not ( = ?auto_6994 ?auto_6996 ) ) ( not ( = ?auto_6994 ?auto_6995 ) ) ( not ( = ?auto_6997 ?auto_6996 ) ) ( not ( = ?auto_6997 ?auto_6995 ) ) ( not ( = ?auto_6996 ?auto_6995 ) ) ( ON ?auto_6996 ?auto_6997 ) ( CLEAR ?auto_6996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6994 ?auto_6997 )
      ( MAKE-1PILE ?auto_6994 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6998 - BLOCK
    )
    :vars
    (
      ?auto_6999 - BLOCK
      ?auto_7000 - BLOCK
      ?auto_7001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6999 ?auto_6998 ) ( ON-TABLE ?auto_6998 ) ( not ( = ?auto_6998 ?auto_6999 ) ) ( not ( = ?auto_6998 ?auto_7000 ) ) ( not ( = ?auto_6998 ?auto_7001 ) ) ( not ( = ?auto_6999 ?auto_7000 ) ) ( not ( = ?auto_6999 ?auto_7001 ) ) ( not ( = ?auto_7000 ?auto_7001 ) ) ( ON ?auto_7000 ?auto_6999 ) ( CLEAR ?auto_7000 ) ( HOLDING ?auto_7001 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7001 )
      ( MAKE-1PILE ?auto_6998 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7002 - BLOCK
    )
    :vars
    (
      ?auto_7005 - BLOCK
      ?auto_7003 - BLOCK
      ?auto_7004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7005 ?auto_7002 ) ( ON-TABLE ?auto_7002 ) ( not ( = ?auto_7002 ?auto_7005 ) ) ( not ( = ?auto_7002 ?auto_7003 ) ) ( not ( = ?auto_7002 ?auto_7004 ) ) ( not ( = ?auto_7005 ?auto_7003 ) ) ( not ( = ?auto_7005 ?auto_7004 ) ) ( not ( = ?auto_7003 ?auto_7004 ) ) ( ON ?auto_7003 ?auto_7005 ) ( ON ?auto_7004 ?auto_7003 ) ( CLEAR ?auto_7004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7002 ?auto_7005 ?auto_7003 )
      ( MAKE-1PILE ?auto_7002 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7006 - BLOCK
    )
    :vars
    (
      ?auto_7008 - BLOCK
      ?auto_7007 - BLOCK
      ?auto_7009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7008 ?auto_7006 ) ( ON-TABLE ?auto_7006 ) ( not ( = ?auto_7006 ?auto_7008 ) ) ( not ( = ?auto_7006 ?auto_7007 ) ) ( not ( = ?auto_7006 ?auto_7009 ) ) ( not ( = ?auto_7008 ?auto_7007 ) ) ( not ( = ?auto_7008 ?auto_7009 ) ) ( not ( = ?auto_7007 ?auto_7009 ) ) ( ON ?auto_7007 ?auto_7008 ) ( HOLDING ?auto_7009 ) ( CLEAR ?auto_7007 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7006 ?auto_7008 ?auto_7007 ?auto_7009 )
      ( MAKE-1PILE ?auto_7006 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7010 - BLOCK
    )
    :vars
    (
      ?auto_7012 - BLOCK
      ?auto_7011 - BLOCK
      ?auto_7013 - BLOCK
      ?auto_7014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7012 ?auto_7010 ) ( ON-TABLE ?auto_7010 ) ( not ( = ?auto_7010 ?auto_7012 ) ) ( not ( = ?auto_7010 ?auto_7011 ) ) ( not ( = ?auto_7010 ?auto_7013 ) ) ( not ( = ?auto_7012 ?auto_7011 ) ) ( not ( = ?auto_7012 ?auto_7013 ) ) ( not ( = ?auto_7011 ?auto_7013 ) ) ( ON ?auto_7011 ?auto_7012 ) ( CLEAR ?auto_7011 ) ( ON ?auto_7013 ?auto_7014 ) ( CLEAR ?auto_7013 ) ( HAND-EMPTY ) ( not ( = ?auto_7010 ?auto_7014 ) ) ( not ( = ?auto_7012 ?auto_7014 ) ) ( not ( = ?auto_7011 ?auto_7014 ) ) ( not ( = ?auto_7013 ?auto_7014 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7013 ?auto_7014 )
      ( MAKE-1PILE ?auto_7010 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7015 - BLOCK
    )
    :vars
    (
      ?auto_7018 - BLOCK
      ?auto_7017 - BLOCK
      ?auto_7019 - BLOCK
      ?auto_7016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7018 ?auto_7015 ) ( ON-TABLE ?auto_7015 ) ( not ( = ?auto_7015 ?auto_7018 ) ) ( not ( = ?auto_7015 ?auto_7017 ) ) ( not ( = ?auto_7015 ?auto_7019 ) ) ( not ( = ?auto_7018 ?auto_7017 ) ) ( not ( = ?auto_7018 ?auto_7019 ) ) ( not ( = ?auto_7017 ?auto_7019 ) ) ( ON ?auto_7019 ?auto_7016 ) ( CLEAR ?auto_7019 ) ( not ( = ?auto_7015 ?auto_7016 ) ) ( not ( = ?auto_7018 ?auto_7016 ) ) ( not ( = ?auto_7017 ?auto_7016 ) ) ( not ( = ?auto_7019 ?auto_7016 ) ) ( HOLDING ?auto_7017 ) ( CLEAR ?auto_7018 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7015 ?auto_7018 ?auto_7017 )
      ( MAKE-1PILE ?auto_7015 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7020 - BLOCK
    )
    :vars
    (
      ?auto_7023 - BLOCK
      ?auto_7022 - BLOCK
      ?auto_7024 - BLOCK
      ?auto_7021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7023 ?auto_7020 ) ( ON-TABLE ?auto_7020 ) ( not ( = ?auto_7020 ?auto_7023 ) ) ( not ( = ?auto_7020 ?auto_7022 ) ) ( not ( = ?auto_7020 ?auto_7024 ) ) ( not ( = ?auto_7023 ?auto_7022 ) ) ( not ( = ?auto_7023 ?auto_7024 ) ) ( not ( = ?auto_7022 ?auto_7024 ) ) ( ON ?auto_7024 ?auto_7021 ) ( not ( = ?auto_7020 ?auto_7021 ) ) ( not ( = ?auto_7023 ?auto_7021 ) ) ( not ( = ?auto_7022 ?auto_7021 ) ) ( not ( = ?auto_7024 ?auto_7021 ) ) ( CLEAR ?auto_7023 ) ( ON ?auto_7022 ?auto_7024 ) ( CLEAR ?auto_7022 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7021 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7021 ?auto_7024 )
      ( MAKE-1PILE ?auto_7020 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7035 - BLOCK
    )
    :vars
    (
      ?auto_7037 - BLOCK
      ?auto_7038 - BLOCK
      ?auto_7039 - BLOCK
      ?auto_7036 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7035 ?auto_7037 ) ) ( not ( = ?auto_7035 ?auto_7038 ) ) ( not ( = ?auto_7035 ?auto_7039 ) ) ( not ( = ?auto_7037 ?auto_7038 ) ) ( not ( = ?auto_7037 ?auto_7039 ) ) ( not ( = ?auto_7038 ?auto_7039 ) ) ( ON ?auto_7039 ?auto_7036 ) ( not ( = ?auto_7035 ?auto_7036 ) ) ( not ( = ?auto_7037 ?auto_7036 ) ) ( not ( = ?auto_7038 ?auto_7036 ) ) ( not ( = ?auto_7039 ?auto_7036 ) ) ( ON ?auto_7038 ?auto_7039 ) ( ON-TABLE ?auto_7036 ) ( ON ?auto_7037 ?auto_7038 ) ( CLEAR ?auto_7037 ) ( HOLDING ?auto_7035 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7035 ?auto_7037 )
      ( MAKE-1PILE ?auto_7035 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7040 - BLOCK
    )
    :vars
    (
      ?auto_7041 - BLOCK
      ?auto_7042 - BLOCK
      ?auto_7043 - BLOCK
      ?auto_7044 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7040 ?auto_7041 ) ) ( not ( = ?auto_7040 ?auto_7042 ) ) ( not ( = ?auto_7040 ?auto_7043 ) ) ( not ( = ?auto_7041 ?auto_7042 ) ) ( not ( = ?auto_7041 ?auto_7043 ) ) ( not ( = ?auto_7042 ?auto_7043 ) ) ( ON ?auto_7043 ?auto_7044 ) ( not ( = ?auto_7040 ?auto_7044 ) ) ( not ( = ?auto_7041 ?auto_7044 ) ) ( not ( = ?auto_7042 ?auto_7044 ) ) ( not ( = ?auto_7043 ?auto_7044 ) ) ( ON ?auto_7042 ?auto_7043 ) ( ON-TABLE ?auto_7044 ) ( ON ?auto_7041 ?auto_7042 ) ( ON ?auto_7040 ?auto_7041 ) ( CLEAR ?auto_7040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7044 ?auto_7043 ?auto_7042 ?auto_7041 )
      ( MAKE-1PILE ?auto_7040 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7048 - BLOCK
      ?auto_7049 - BLOCK
      ?auto_7050 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_7050 ) ( CLEAR ?auto_7049 ) ( ON-TABLE ?auto_7048 ) ( ON ?auto_7049 ?auto_7048 ) ( not ( = ?auto_7048 ?auto_7049 ) ) ( not ( = ?auto_7048 ?auto_7050 ) ) ( not ( = ?auto_7049 ?auto_7050 ) ) )
    :subtasks
    ( ( !STACK ?auto_7050 ?auto_7049 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7051 - BLOCK
      ?auto_7052 - BLOCK
      ?auto_7053 - BLOCK
    )
    :vars
    (
      ?auto_7054 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7052 ) ( ON-TABLE ?auto_7051 ) ( ON ?auto_7052 ?auto_7051 ) ( not ( = ?auto_7051 ?auto_7052 ) ) ( not ( = ?auto_7051 ?auto_7053 ) ) ( not ( = ?auto_7052 ?auto_7053 ) ) ( ON ?auto_7053 ?auto_7054 ) ( CLEAR ?auto_7053 ) ( HAND-EMPTY ) ( not ( = ?auto_7051 ?auto_7054 ) ) ( not ( = ?auto_7052 ?auto_7054 ) ) ( not ( = ?auto_7053 ?auto_7054 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7053 ?auto_7054 )
      ( MAKE-3PILE ?auto_7051 ?auto_7052 ?auto_7053 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7055 - BLOCK
      ?auto_7056 - BLOCK
      ?auto_7057 - BLOCK
    )
    :vars
    (
      ?auto_7058 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7055 ) ( not ( = ?auto_7055 ?auto_7056 ) ) ( not ( = ?auto_7055 ?auto_7057 ) ) ( not ( = ?auto_7056 ?auto_7057 ) ) ( ON ?auto_7057 ?auto_7058 ) ( CLEAR ?auto_7057 ) ( not ( = ?auto_7055 ?auto_7058 ) ) ( not ( = ?auto_7056 ?auto_7058 ) ) ( not ( = ?auto_7057 ?auto_7058 ) ) ( HOLDING ?auto_7056 ) ( CLEAR ?auto_7055 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7055 ?auto_7056 )
      ( MAKE-3PILE ?auto_7055 ?auto_7056 ?auto_7057 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7059 - BLOCK
      ?auto_7060 - BLOCK
      ?auto_7061 - BLOCK
    )
    :vars
    (
      ?auto_7062 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7059 ) ( not ( = ?auto_7059 ?auto_7060 ) ) ( not ( = ?auto_7059 ?auto_7061 ) ) ( not ( = ?auto_7060 ?auto_7061 ) ) ( ON ?auto_7061 ?auto_7062 ) ( not ( = ?auto_7059 ?auto_7062 ) ) ( not ( = ?auto_7060 ?auto_7062 ) ) ( not ( = ?auto_7061 ?auto_7062 ) ) ( CLEAR ?auto_7059 ) ( ON ?auto_7060 ?auto_7061 ) ( CLEAR ?auto_7060 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7062 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7062 ?auto_7061 )
      ( MAKE-3PILE ?auto_7059 ?auto_7060 ?auto_7061 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7063 - BLOCK
      ?auto_7064 - BLOCK
      ?auto_7065 - BLOCK
    )
    :vars
    (
      ?auto_7066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7063 ?auto_7064 ) ) ( not ( = ?auto_7063 ?auto_7065 ) ) ( not ( = ?auto_7064 ?auto_7065 ) ) ( ON ?auto_7065 ?auto_7066 ) ( not ( = ?auto_7063 ?auto_7066 ) ) ( not ( = ?auto_7064 ?auto_7066 ) ) ( not ( = ?auto_7065 ?auto_7066 ) ) ( ON ?auto_7064 ?auto_7065 ) ( CLEAR ?auto_7064 ) ( ON-TABLE ?auto_7066 ) ( HOLDING ?auto_7063 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7063 )
      ( MAKE-3PILE ?auto_7063 ?auto_7064 ?auto_7065 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7067 - BLOCK
      ?auto_7068 - BLOCK
      ?auto_7069 - BLOCK
    )
    :vars
    (
      ?auto_7070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7067 ?auto_7068 ) ) ( not ( = ?auto_7067 ?auto_7069 ) ) ( not ( = ?auto_7068 ?auto_7069 ) ) ( ON ?auto_7069 ?auto_7070 ) ( not ( = ?auto_7067 ?auto_7070 ) ) ( not ( = ?auto_7068 ?auto_7070 ) ) ( not ( = ?auto_7069 ?auto_7070 ) ) ( ON ?auto_7068 ?auto_7069 ) ( ON-TABLE ?auto_7070 ) ( ON ?auto_7067 ?auto_7068 ) ( CLEAR ?auto_7067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7070 ?auto_7069 ?auto_7068 )
      ( MAKE-3PILE ?auto_7067 ?auto_7068 ?auto_7069 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7071 - BLOCK
      ?auto_7072 - BLOCK
      ?auto_7073 - BLOCK
    )
    :vars
    (
      ?auto_7074 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7071 ?auto_7072 ) ) ( not ( = ?auto_7071 ?auto_7073 ) ) ( not ( = ?auto_7072 ?auto_7073 ) ) ( ON ?auto_7073 ?auto_7074 ) ( not ( = ?auto_7071 ?auto_7074 ) ) ( not ( = ?auto_7072 ?auto_7074 ) ) ( not ( = ?auto_7073 ?auto_7074 ) ) ( ON ?auto_7072 ?auto_7073 ) ( ON-TABLE ?auto_7074 ) ( HOLDING ?auto_7071 ) ( CLEAR ?auto_7072 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7074 ?auto_7073 ?auto_7072 ?auto_7071 )
      ( MAKE-3PILE ?auto_7071 ?auto_7072 ?auto_7073 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7075 - BLOCK
      ?auto_7076 - BLOCK
      ?auto_7077 - BLOCK
    )
    :vars
    (
      ?auto_7078 - BLOCK
      ?auto_7079 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7075 ?auto_7076 ) ) ( not ( = ?auto_7075 ?auto_7077 ) ) ( not ( = ?auto_7076 ?auto_7077 ) ) ( ON ?auto_7077 ?auto_7078 ) ( not ( = ?auto_7075 ?auto_7078 ) ) ( not ( = ?auto_7076 ?auto_7078 ) ) ( not ( = ?auto_7077 ?auto_7078 ) ) ( ON ?auto_7076 ?auto_7077 ) ( ON-TABLE ?auto_7078 ) ( CLEAR ?auto_7076 ) ( ON ?auto_7075 ?auto_7079 ) ( CLEAR ?auto_7075 ) ( HAND-EMPTY ) ( not ( = ?auto_7075 ?auto_7079 ) ) ( not ( = ?auto_7076 ?auto_7079 ) ) ( not ( = ?auto_7077 ?auto_7079 ) ) ( not ( = ?auto_7078 ?auto_7079 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7075 ?auto_7079 )
      ( MAKE-3PILE ?auto_7075 ?auto_7076 ?auto_7077 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7080 - BLOCK
      ?auto_7081 - BLOCK
      ?auto_7082 - BLOCK
    )
    :vars
    (
      ?auto_7084 - BLOCK
      ?auto_7083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7080 ?auto_7081 ) ) ( not ( = ?auto_7080 ?auto_7082 ) ) ( not ( = ?auto_7081 ?auto_7082 ) ) ( ON ?auto_7082 ?auto_7084 ) ( not ( = ?auto_7080 ?auto_7084 ) ) ( not ( = ?auto_7081 ?auto_7084 ) ) ( not ( = ?auto_7082 ?auto_7084 ) ) ( ON-TABLE ?auto_7084 ) ( ON ?auto_7080 ?auto_7083 ) ( CLEAR ?auto_7080 ) ( not ( = ?auto_7080 ?auto_7083 ) ) ( not ( = ?auto_7081 ?auto_7083 ) ) ( not ( = ?auto_7082 ?auto_7083 ) ) ( not ( = ?auto_7084 ?auto_7083 ) ) ( HOLDING ?auto_7081 ) ( CLEAR ?auto_7082 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7084 ?auto_7082 ?auto_7081 )
      ( MAKE-3PILE ?auto_7080 ?auto_7081 ?auto_7082 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7085 - BLOCK
      ?auto_7086 - BLOCK
      ?auto_7087 - BLOCK
    )
    :vars
    (
      ?auto_7088 - BLOCK
      ?auto_7089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7085 ?auto_7086 ) ) ( not ( = ?auto_7085 ?auto_7087 ) ) ( not ( = ?auto_7086 ?auto_7087 ) ) ( ON ?auto_7087 ?auto_7088 ) ( not ( = ?auto_7085 ?auto_7088 ) ) ( not ( = ?auto_7086 ?auto_7088 ) ) ( not ( = ?auto_7087 ?auto_7088 ) ) ( ON-TABLE ?auto_7088 ) ( ON ?auto_7085 ?auto_7089 ) ( not ( = ?auto_7085 ?auto_7089 ) ) ( not ( = ?auto_7086 ?auto_7089 ) ) ( not ( = ?auto_7087 ?auto_7089 ) ) ( not ( = ?auto_7088 ?auto_7089 ) ) ( CLEAR ?auto_7087 ) ( ON ?auto_7086 ?auto_7085 ) ( CLEAR ?auto_7086 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7089 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7089 ?auto_7085 )
      ( MAKE-3PILE ?auto_7085 ?auto_7086 ?auto_7087 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7090 - BLOCK
      ?auto_7091 - BLOCK
      ?auto_7092 - BLOCK
    )
    :vars
    (
      ?auto_7093 - BLOCK
      ?auto_7094 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7090 ?auto_7091 ) ) ( not ( = ?auto_7090 ?auto_7092 ) ) ( not ( = ?auto_7091 ?auto_7092 ) ) ( not ( = ?auto_7090 ?auto_7093 ) ) ( not ( = ?auto_7091 ?auto_7093 ) ) ( not ( = ?auto_7092 ?auto_7093 ) ) ( ON-TABLE ?auto_7093 ) ( ON ?auto_7090 ?auto_7094 ) ( not ( = ?auto_7090 ?auto_7094 ) ) ( not ( = ?auto_7091 ?auto_7094 ) ) ( not ( = ?auto_7092 ?auto_7094 ) ) ( not ( = ?auto_7093 ?auto_7094 ) ) ( ON ?auto_7091 ?auto_7090 ) ( CLEAR ?auto_7091 ) ( ON-TABLE ?auto_7094 ) ( HOLDING ?auto_7092 ) ( CLEAR ?auto_7093 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7093 ?auto_7092 )
      ( MAKE-3PILE ?auto_7090 ?auto_7091 ?auto_7092 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7095 - BLOCK
      ?auto_7096 - BLOCK
      ?auto_7097 - BLOCK
    )
    :vars
    (
      ?auto_7099 - BLOCK
      ?auto_7098 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7095 ?auto_7096 ) ) ( not ( = ?auto_7095 ?auto_7097 ) ) ( not ( = ?auto_7096 ?auto_7097 ) ) ( not ( = ?auto_7095 ?auto_7099 ) ) ( not ( = ?auto_7096 ?auto_7099 ) ) ( not ( = ?auto_7097 ?auto_7099 ) ) ( ON-TABLE ?auto_7099 ) ( ON ?auto_7095 ?auto_7098 ) ( not ( = ?auto_7095 ?auto_7098 ) ) ( not ( = ?auto_7096 ?auto_7098 ) ) ( not ( = ?auto_7097 ?auto_7098 ) ) ( not ( = ?auto_7099 ?auto_7098 ) ) ( ON ?auto_7096 ?auto_7095 ) ( ON-TABLE ?auto_7098 ) ( CLEAR ?auto_7099 ) ( ON ?auto_7097 ?auto_7096 ) ( CLEAR ?auto_7097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7098 ?auto_7095 ?auto_7096 )
      ( MAKE-3PILE ?auto_7095 ?auto_7096 ?auto_7097 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7100 - BLOCK
      ?auto_7101 - BLOCK
      ?auto_7102 - BLOCK
    )
    :vars
    (
      ?auto_7104 - BLOCK
      ?auto_7103 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7100 ?auto_7101 ) ) ( not ( = ?auto_7100 ?auto_7102 ) ) ( not ( = ?auto_7101 ?auto_7102 ) ) ( not ( = ?auto_7100 ?auto_7104 ) ) ( not ( = ?auto_7101 ?auto_7104 ) ) ( not ( = ?auto_7102 ?auto_7104 ) ) ( ON ?auto_7100 ?auto_7103 ) ( not ( = ?auto_7100 ?auto_7103 ) ) ( not ( = ?auto_7101 ?auto_7103 ) ) ( not ( = ?auto_7102 ?auto_7103 ) ) ( not ( = ?auto_7104 ?auto_7103 ) ) ( ON ?auto_7101 ?auto_7100 ) ( ON-TABLE ?auto_7103 ) ( ON ?auto_7102 ?auto_7101 ) ( CLEAR ?auto_7102 ) ( HOLDING ?auto_7104 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7104 )
      ( MAKE-3PILE ?auto_7100 ?auto_7101 ?auto_7102 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7105 - BLOCK
      ?auto_7106 - BLOCK
      ?auto_7107 - BLOCK
    )
    :vars
    (
      ?auto_7108 - BLOCK
      ?auto_7109 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7105 ?auto_7106 ) ) ( not ( = ?auto_7105 ?auto_7107 ) ) ( not ( = ?auto_7106 ?auto_7107 ) ) ( not ( = ?auto_7105 ?auto_7108 ) ) ( not ( = ?auto_7106 ?auto_7108 ) ) ( not ( = ?auto_7107 ?auto_7108 ) ) ( ON ?auto_7105 ?auto_7109 ) ( not ( = ?auto_7105 ?auto_7109 ) ) ( not ( = ?auto_7106 ?auto_7109 ) ) ( not ( = ?auto_7107 ?auto_7109 ) ) ( not ( = ?auto_7108 ?auto_7109 ) ) ( ON ?auto_7106 ?auto_7105 ) ( ON-TABLE ?auto_7109 ) ( ON ?auto_7107 ?auto_7106 ) ( ON ?auto_7108 ?auto_7107 ) ( CLEAR ?auto_7108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7109 ?auto_7105 ?auto_7106 ?auto_7107 )
      ( MAKE-3PILE ?auto_7105 ?auto_7106 ?auto_7107 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7114 - BLOCK
      ?auto_7115 - BLOCK
      ?auto_7116 - BLOCK
      ?auto_7117 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_7117 ) ( CLEAR ?auto_7116 ) ( ON-TABLE ?auto_7114 ) ( ON ?auto_7115 ?auto_7114 ) ( ON ?auto_7116 ?auto_7115 ) ( not ( = ?auto_7114 ?auto_7115 ) ) ( not ( = ?auto_7114 ?auto_7116 ) ) ( not ( = ?auto_7114 ?auto_7117 ) ) ( not ( = ?auto_7115 ?auto_7116 ) ) ( not ( = ?auto_7115 ?auto_7117 ) ) ( not ( = ?auto_7116 ?auto_7117 ) ) )
    :subtasks
    ( ( !STACK ?auto_7117 ?auto_7116 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7118 - BLOCK
      ?auto_7119 - BLOCK
      ?auto_7120 - BLOCK
      ?auto_7121 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7120 ) ( ON-TABLE ?auto_7118 ) ( ON ?auto_7119 ?auto_7118 ) ( ON ?auto_7120 ?auto_7119 ) ( not ( = ?auto_7118 ?auto_7119 ) ) ( not ( = ?auto_7118 ?auto_7120 ) ) ( not ( = ?auto_7118 ?auto_7121 ) ) ( not ( = ?auto_7119 ?auto_7120 ) ) ( not ( = ?auto_7119 ?auto_7121 ) ) ( not ( = ?auto_7120 ?auto_7121 ) ) ( ON-TABLE ?auto_7121 ) ( CLEAR ?auto_7121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_7121 )
      ( MAKE-4PILE ?auto_7118 ?auto_7119 ?auto_7120 ?auto_7121 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7122 - BLOCK
      ?auto_7123 - BLOCK
      ?auto_7124 - BLOCK
      ?auto_7125 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7122 ) ( ON ?auto_7123 ?auto_7122 ) ( not ( = ?auto_7122 ?auto_7123 ) ) ( not ( = ?auto_7122 ?auto_7124 ) ) ( not ( = ?auto_7122 ?auto_7125 ) ) ( not ( = ?auto_7123 ?auto_7124 ) ) ( not ( = ?auto_7123 ?auto_7125 ) ) ( not ( = ?auto_7124 ?auto_7125 ) ) ( ON-TABLE ?auto_7125 ) ( CLEAR ?auto_7125 ) ( HOLDING ?auto_7124 ) ( CLEAR ?auto_7123 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7122 ?auto_7123 ?auto_7124 )
      ( MAKE-4PILE ?auto_7122 ?auto_7123 ?auto_7124 ?auto_7125 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7126 - BLOCK
      ?auto_7127 - BLOCK
      ?auto_7128 - BLOCK
      ?auto_7129 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7126 ) ( ON ?auto_7127 ?auto_7126 ) ( not ( = ?auto_7126 ?auto_7127 ) ) ( not ( = ?auto_7126 ?auto_7128 ) ) ( not ( = ?auto_7126 ?auto_7129 ) ) ( not ( = ?auto_7127 ?auto_7128 ) ) ( not ( = ?auto_7127 ?auto_7129 ) ) ( not ( = ?auto_7128 ?auto_7129 ) ) ( ON-TABLE ?auto_7129 ) ( CLEAR ?auto_7127 ) ( ON ?auto_7128 ?auto_7129 ) ( CLEAR ?auto_7128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7129 )
      ( MAKE-4PILE ?auto_7126 ?auto_7127 ?auto_7128 ?auto_7129 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7130 - BLOCK
      ?auto_7131 - BLOCK
      ?auto_7132 - BLOCK
      ?auto_7133 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7130 ) ( not ( = ?auto_7130 ?auto_7131 ) ) ( not ( = ?auto_7130 ?auto_7132 ) ) ( not ( = ?auto_7130 ?auto_7133 ) ) ( not ( = ?auto_7131 ?auto_7132 ) ) ( not ( = ?auto_7131 ?auto_7133 ) ) ( not ( = ?auto_7132 ?auto_7133 ) ) ( ON-TABLE ?auto_7133 ) ( ON ?auto_7132 ?auto_7133 ) ( CLEAR ?auto_7132 ) ( HOLDING ?auto_7131 ) ( CLEAR ?auto_7130 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7130 ?auto_7131 )
      ( MAKE-4PILE ?auto_7130 ?auto_7131 ?auto_7132 ?auto_7133 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7134 - BLOCK
      ?auto_7135 - BLOCK
      ?auto_7136 - BLOCK
      ?auto_7137 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7134 ) ( not ( = ?auto_7134 ?auto_7135 ) ) ( not ( = ?auto_7134 ?auto_7136 ) ) ( not ( = ?auto_7134 ?auto_7137 ) ) ( not ( = ?auto_7135 ?auto_7136 ) ) ( not ( = ?auto_7135 ?auto_7137 ) ) ( not ( = ?auto_7136 ?auto_7137 ) ) ( ON-TABLE ?auto_7137 ) ( ON ?auto_7136 ?auto_7137 ) ( CLEAR ?auto_7134 ) ( ON ?auto_7135 ?auto_7136 ) ( CLEAR ?auto_7135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7137 ?auto_7136 )
      ( MAKE-4PILE ?auto_7134 ?auto_7135 ?auto_7136 ?auto_7137 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7138 - BLOCK
      ?auto_7139 - BLOCK
      ?auto_7140 - BLOCK
      ?auto_7141 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7138 ?auto_7139 ) ) ( not ( = ?auto_7138 ?auto_7140 ) ) ( not ( = ?auto_7138 ?auto_7141 ) ) ( not ( = ?auto_7139 ?auto_7140 ) ) ( not ( = ?auto_7139 ?auto_7141 ) ) ( not ( = ?auto_7140 ?auto_7141 ) ) ( ON-TABLE ?auto_7141 ) ( ON ?auto_7140 ?auto_7141 ) ( ON ?auto_7139 ?auto_7140 ) ( CLEAR ?auto_7139 ) ( HOLDING ?auto_7138 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7138 )
      ( MAKE-4PILE ?auto_7138 ?auto_7139 ?auto_7140 ?auto_7141 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7142 - BLOCK
      ?auto_7143 - BLOCK
      ?auto_7144 - BLOCK
      ?auto_7145 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7142 ?auto_7143 ) ) ( not ( = ?auto_7142 ?auto_7144 ) ) ( not ( = ?auto_7142 ?auto_7145 ) ) ( not ( = ?auto_7143 ?auto_7144 ) ) ( not ( = ?auto_7143 ?auto_7145 ) ) ( not ( = ?auto_7144 ?auto_7145 ) ) ( ON-TABLE ?auto_7145 ) ( ON ?auto_7144 ?auto_7145 ) ( ON ?auto_7143 ?auto_7144 ) ( ON ?auto_7142 ?auto_7143 ) ( CLEAR ?auto_7142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7145 ?auto_7144 ?auto_7143 )
      ( MAKE-4PILE ?auto_7142 ?auto_7143 ?auto_7144 ?auto_7145 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7146 - BLOCK
      ?auto_7147 - BLOCK
      ?auto_7148 - BLOCK
      ?auto_7149 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7146 ?auto_7147 ) ) ( not ( = ?auto_7146 ?auto_7148 ) ) ( not ( = ?auto_7146 ?auto_7149 ) ) ( not ( = ?auto_7147 ?auto_7148 ) ) ( not ( = ?auto_7147 ?auto_7149 ) ) ( not ( = ?auto_7148 ?auto_7149 ) ) ( ON-TABLE ?auto_7149 ) ( ON ?auto_7148 ?auto_7149 ) ( ON ?auto_7147 ?auto_7148 ) ( HOLDING ?auto_7146 ) ( CLEAR ?auto_7147 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7149 ?auto_7148 ?auto_7147 ?auto_7146 )
      ( MAKE-4PILE ?auto_7146 ?auto_7147 ?auto_7148 ?auto_7149 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7150 - BLOCK
      ?auto_7151 - BLOCK
      ?auto_7152 - BLOCK
      ?auto_7153 - BLOCK
    )
    :vars
    (
      ?auto_7154 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7150 ?auto_7151 ) ) ( not ( = ?auto_7150 ?auto_7152 ) ) ( not ( = ?auto_7150 ?auto_7153 ) ) ( not ( = ?auto_7151 ?auto_7152 ) ) ( not ( = ?auto_7151 ?auto_7153 ) ) ( not ( = ?auto_7152 ?auto_7153 ) ) ( ON-TABLE ?auto_7153 ) ( ON ?auto_7152 ?auto_7153 ) ( ON ?auto_7151 ?auto_7152 ) ( CLEAR ?auto_7151 ) ( ON ?auto_7150 ?auto_7154 ) ( CLEAR ?auto_7150 ) ( HAND-EMPTY ) ( not ( = ?auto_7150 ?auto_7154 ) ) ( not ( = ?auto_7151 ?auto_7154 ) ) ( not ( = ?auto_7152 ?auto_7154 ) ) ( not ( = ?auto_7153 ?auto_7154 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7150 ?auto_7154 )
      ( MAKE-4PILE ?auto_7150 ?auto_7151 ?auto_7152 ?auto_7153 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7155 - BLOCK
      ?auto_7156 - BLOCK
      ?auto_7157 - BLOCK
      ?auto_7158 - BLOCK
    )
    :vars
    (
      ?auto_7159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7155 ?auto_7156 ) ) ( not ( = ?auto_7155 ?auto_7157 ) ) ( not ( = ?auto_7155 ?auto_7158 ) ) ( not ( = ?auto_7156 ?auto_7157 ) ) ( not ( = ?auto_7156 ?auto_7158 ) ) ( not ( = ?auto_7157 ?auto_7158 ) ) ( ON-TABLE ?auto_7158 ) ( ON ?auto_7157 ?auto_7158 ) ( ON ?auto_7155 ?auto_7159 ) ( CLEAR ?auto_7155 ) ( not ( = ?auto_7155 ?auto_7159 ) ) ( not ( = ?auto_7156 ?auto_7159 ) ) ( not ( = ?auto_7157 ?auto_7159 ) ) ( not ( = ?auto_7158 ?auto_7159 ) ) ( HOLDING ?auto_7156 ) ( CLEAR ?auto_7157 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7158 ?auto_7157 ?auto_7156 )
      ( MAKE-4PILE ?auto_7155 ?auto_7156 ?auto_7157 ?auto_7158 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7160 - BLOCK
      ?auto_7161 - BLOCK
      ?auto_7162 - BLOCK
      ?auto_7163 - BLOCK
    )
    :vars
    (
      ?auto_7164 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7160 ?auto_7161 ) ) ( not ( = ?auto_7160 ?auto_7162 ) ) ( not ( = ?auto_7160 ?auto_7163 ) ) ( not ( = ?auto_7161 ?auto_7162 ) ) ( not ( = ?auto_7161 ?auto_7163 ) ) ( not ( = ?auto_7162 ?auto_7163 ) ) ( ON-TABLE ?auto_7163 ) ( ON ?auto_7162 ?auto_7163 ) ( ON ?auto_7160 ?auto_7164 ) ( not ( = ?auto_7160 ?auto_7164 ) ) ( not ( = ?auto_7161 ?auto_7164 ) ) ( not ( = ?auto_7162 ?auto_7164 ) ) ( not ( = ?auto_7163 ?auto_7164 ) ) ( CLEAR ?auto_7162 ) ( ON ?auto_7161 ?auto_7160 ) ( CLEAR ?auto_7161 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7164 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7164 ?auto_7160 )
      ( MAKE-4PILE ?auto_7160 ?auto_7161 ?auto_7162 ?auto_7163 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7165 - BLOCK
      ?auto_7166 - BLOCK
      ?auto_7167 - BLOCK
      ?auto_7168 - BLOCK
    )
    :vars
    (
      ?auto_7169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7165 ?auto_7166 ) ) ( not ( = ?auto_7165 ?auto_7167 ) ) ( not ( = ?auto_7165 ?auto_7168 ) ) ( not ( = ?auto_7166 ?auto_7167 ) ) ( not ( = ?auto_7166 ?auto_7168 ) ) ( not ( = ?auto_7167 ?auto_7168 ) ) ( ON-TABLE ?auto_7168 ) ( ON ?auto_7165 ?auto_7169 ) ( not ( = ?auto_7165 ?auto_7169 ) ) ( not ( = ?auto_7166 ?auto_7169 ) ) ( not ( = ?auto_7167 ?auto_7169 ) ) ( not ( = ?auto_7168 ?auto_7169 ) ) ( ON ?auto_7166 ?auto_7165 ) ( CLEAR ?auto_7166 ) ( ON-TABLE ?auto_7169 ) ( HOLDING ?auto_7167 ) ( CLEAR ?auto_7168 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7168 ?auto_7167 )
      ( MAKE-4PILE ?auto_7165 ?auto_7166 ?auto_7167 ?auto_7168 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7170 - BLOCK
      ?auto_7171 - BLOCK
      ?auto_7172 - BLOCK
      ?auto_7173 - BLOCK
    )
    :vars
    (
      ?auto_7174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7170 ?auto_7171 ) ) ( not ( = ?auto_7170 ?auto_7172 ) ) ( not ( = ?auto_7170 ?auto_7173 ) ) ( not ( = ?auto_7171 ?auto_7172 ) ) ( not ( = ?auto_7171 ?auto_7173 ) ) ( not ( = ?auto_7172 ?auto_7173 ) ) ( ON-TABLE ?auto_7173 ) ( ON ?auto_7170 ?auto_7174 ) ( not ( = ?auto_7170 ?auto_7174 ) ) ( not ( = ?auto_7171 ?auto_7174 ) ) ( not ( = ?auto_7172 ?auto_7174 ) ) ( not ( = ?auto_7173 ?auto_7174 ) ) ( ON ?auto_7171 ?auto_7170 ) ( ON-TABLE ?auto_7174 ) ( CLEAR ?auto_7173 ) ( ON ?auto_7172 ?auto_7171 ) ( CLEAR ?auto_7172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7174 ?auto_7170 ?auto_7171 )
      ( MAKE-4PILE ?auto_7170 ?auto_7171 ?auto_7172 ?auto_7173 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7175 - BLOCK
      ?auto_7176 - BLOCK
      ?auto_7177 - BLOCK
      ?auto_7178 - BLOCK
    )
    :vars
    (
      ?auto_7179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7175 ?auto_7176 ) ) ( not ( = ?auto_7175 ?auto_7177 ) ) ( not ( = ?auto_7175 ?auto_7178 ) ) ( not ( = ?auto_7176 ?auto_7177 ) ) ( not ( = ?auto_7176 ?auto_7178 ) ) ( not ( = ?auto_7177 ?auto_7178 ) ) ( ON ?auto_7175 ?auto_7179 ) ( not ( = ?auto_7175 ?auto_7179 ) ) ( not ( = ?auto_7176 ?auto_7179 ) ) ( not ( = ?auto_7177 ?auto_7179 ) ) ( not ( = ?auto_7178 ?auto_7179 ) ) ( ON ?auto_7176 ?auto_7175 ) ( ON-TABLE ?auto_7179 ) ( ON ?auto_7177 ?auto_7176 ) ( CLEAR ?auto_7177 ) ( HOLDING ?auto_7178 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7178 )
      ( MAKE-4PILE ?auto_7175 ?auto_7176 ?auto_7177 ?auto_7178 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7180 - BLOCK
      ?auto_7181 - BLOCK
      ?auto_7182 - BLOCK
      ?auto_7183 - BLOCK
    )
    :vars
    (
      ?auto_7184 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7180 ?auto_7181 ) ) ( not ( = ?auto_7180 ?auto_7182 ) ) ( not ( = ?auto_7180 ?auto_7183 ) ) ( not ( = ?auto_7181 ?auto_7182 ) ) ( not ( = ?auto_7181 ?auto_7183 ) ) ( not ( = ?auto_7182 ?auto_7183 ) ) ( ON ?auto_7180 ?auto_7184 ) ( not ( = ?auto_7180 ?auto_7184 ) ) ( not ( = ?auto_7181 ?auto_7184 ) ) ( not ( = ?auto_7182 ?auto_7184 ) ) ( not ( = ?auto_7183 ?auto_7184 ) ) ( ON ?auto_7181 ?auto_7180 ) ( ON-TABLE ?auto_7184 ) ( ON ?auto_7182 ?auto_7181 ) ( ON ?auto_7183 ?auto_7182 ) ( CLEAR ?auto_7183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7184 ?auto_7180 ?auto_7181 ?auto_7182 )
      ( MAKE-4PILE ?auto_7180 ?auto_7181 ?auto_7182 ?auto_7183 ) )
  )

)

