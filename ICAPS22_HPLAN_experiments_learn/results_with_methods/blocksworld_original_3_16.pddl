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
      ?auto_5623 - BLOCK
      ?auto_5624 - BLOCK
      ?auto_5625 - BLOCK
    )
    :vars
    (
      ?auto_5626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5626 ?auto_5625 ) ( CLEAR ?auto_5626 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5623 ) ( ON ?auto_5624 ?auto_5623 ) ( ON ?auto_5625 ?auto_5624 ) ( not ( = ?auto_5623 ?auto_5624 ) ) ( not ( = ?auto_5623 ?auto_5625 ) ) ( not ( = ?auto_5623 ?auto_5626 ) ) ( not ( = ?auto_5624 ?auto_5625 ) ) ( not ( = ?auto_5624 ?auto_5626 ) ) ( not ( = ?auto_5625 ?auto_5626 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5626 ?auto_5625 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5628 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5628 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5628 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5629 - BLOCK
    )
    :vars
    (
      ?auto_5630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5629 ?auto_5630 ) ( CLEAR ?auto_5629 ) ( HAND-EMPTY ) ( not ( = ?auto_5629 ?auto_5630 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5629 ?auto_5630 )
      ( MAKE-1PILE ?auto_5629 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5633 - BLOCK
      ?auto_5634 - BLOCK
    )
    :vars
    (
      ?auto_5635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5635 ?auto_5634 ) ( CLEAR ?auto_5635 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5633 ) ( ON ?auto_5634 ?auto_5633 ) ( not ( = ?auto_5633 ?auto_5634 ) ) ( not ( = ?auto_5633 ?auto_5635 ) ) ( not ( = ?auto_5634 ?auto_5635 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5635 ?auto_5634 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5636 - BLOCK
      ?auto_5637 - BLOCK
    )
    :vars
    (
      ?auto_5638 - BLOCK
      ?auto_5639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5638 ?auto_5637 ) ( CLEAR ?auto_5638 ) ( ON-TABLE ?auto_5636 ) ( ON ?auto_5637 ?auto_5636 ) ( not ( = ?auto_5636 ?auto_5637 ) ) ( not ( = ?auto_5636 ?auto_5638 ) ) ( not ( = ?auto_5637 ?auto_5638 ) ) ( HOLDING ?auto_5639 ) ( not ( = ?auto_5636 ?auto_5639 ) ) ( not ( = ?auto_5637 ?auto_5639 ) ) ( not ( = ?auto_5638 ?auto_5639 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5639 )
      ( MAKE-2PILE ?auto_5636 ?auto_5637 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5640 - BLOCK
      ?auto_5641 - BLOCK
    )
    :vars
    (
      ?auto_5643 - BLOCK
      ?auto_5642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5643 ?auto_5641 ) ( ON-TABLE ?auto_5640 ) ( ON ?auto_5641 ?auto_5640 ) ( not ( = ?auto_5640 ?auto_5641 ) ) ( not ( = ?auto_5640 ?auto_5643 ) ) ( not ( = ?auto_5641 ?auto_5643 ) ) ( not ( = ?auto_5640 ?auto_5642 ) ) ( not ( = ?auto_5641 ?auto_5642 ) ) ( not ( = ?auto_5643 ?auto_5642 ) ) ( ON ?auto_5642 ?auto_5643 ) ( CLEAR ?auto_5642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5640 ?auto_5641 ?auto_5643 )
      ( MAKE-2PILE ?auto_5640 ?auto_5641 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5646 - BLOCK
      ?auto_5647 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5647 ) ( CLEAR ?auto_5646 ) ( ON-TABLE ?auto_5646 ) ( not ( = ?auto_5646 ?auto_5647 ) ) )
    :subtasks
    ( ( !STACK ?auto_5647 ?auto_5646 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5648 - BLOCK
      ?auto_5649 - BLOCK
    )
    :vars
    (
      ?auto_5650 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5648 ) ( ON-TABLE ?auto_5648 ) ( not ( = ?auto_5648 ?auto_5649 ) ) ( ON ?auto_5649 ?auto_5650 ) ( CLEAR ?auto_5649 ) ( HAND-EMPTY ) ( not ( = ?auto_5648 ?auto_5650 ) ) ( not ( = ?auto_5649 ?auto_5650 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5649 ?auto_5650 )
      ( MAKE-2PILE ?auto_5648 ?auto_5649 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5651 - BLOCK
      ?auto_5652 - BLOCK
    )
    :vars
    (
      ?auto_5653 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5651 ?auto_5652 ) ) ( ON ?auto_5652 ?auto_5653 ) ( CLEAR ?auto_5652 ) ( not ( = ?auto_5651 ?auto_5653 ) ) ( not ( = ?auto_5652 ?auto_5653 ) ) ( HOLDING ?auto_5651 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5651 )
      ( MAKE-2PILE ?auto_5651 ?auto_5652 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5654 - BLOCK
      ?auto_5655 - BLOCK
    )
    :vars
    (
      ?auto_5656 - BLOCK
      ?auto_5657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5654 ?auto_5655 ) ) ( ON ?auto_5655 ?auto_5656 ) ( not ( = ?auto_5654 ?auto_5656 ) ) ( not ( = ?auto_5655 ?auto_5656 ) ) ( ON ?auto_5654 ?auto_5655 ) ( CLEAR ?auto_5654 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5657 ) ( ON ?auto_5656 ?auto_5657 ) ( not ( = ?auto_5657 ?auto_5656 ) ) ( not ( = ?auto_5657 ?auto_5655 ) ) ( not ( = ?auto_5657 ?auto_5654 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5657 ?auto_5656 ?auto_5655 )
      ( MAKE-2PILE ?auto_5654 ?auto_5655 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5659 - BLOCK
    )
    :vars
    (
      ?auto_5660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5660 ?auto_5659 ) ( CLEAR ?auto_5660 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5659 ) ( not ( = ?auto_5659 ?auto_5660 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5660 ?auto_5659 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5661 - BLOCK
    )
    :vars
    (
      ?auto_5662 - BLOCK
      ?auto_5663 - BLOCK
      ?auto_5664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5662 ?auto_5661 ) ( CLEAR ?auto_5662 ) ( ON-TABLE ?auto_5661 ) ( not ( = ?auto_5661 ?auto_5662 ) ) ( HOLDING ?auto_5663 ) ( CLEAR ?auto_5664 ) ( not ( = ?auto_5661 ?auto_5663 ) ) ( not ( = ?auto_5661 ?auto_5664 ) ) ( not ( = ?auto_5662 ?auto_5663 ) ) ( not ( = ?auto_5662 ?auto_5664 ) ) ( not ( = ?auto_5663 ?auto_5664 ) ) )
    :subtasks
    ( ( !STACK ?auto_5663 ?auto_5664 )
      ( MAKE-1PILE ?auto_5661 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5665 - BLOCK
    )
    :vars
    (
      ?auto_5668 - BLOCK
      ?auto_5666 - BLOCK
      ?auto_5667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5668 ?auto_5665 ) ( ON-TABLE ?auto_5665 ) ( not ( = ?auto_5665 ?auto_5668 ) ) ( CLEAR ?auto_5666 ) ( not ( = ?auto_5665 ?auto_5667 ) ) ( not ( = ?auto_5665 ?auto_5666 ) ) ( not ( = ?auto_5668 ?auto_5667 ) ) ( not ( = ?auto_5668 ?auto_5666 ) ) ( not ( = ?auto_5667 ?auto_5666 ) ) ( ON ?auto_5667 ?auto_5668 ) ( CLEAR ?auto_5667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5665 ?auto_5668 )
      ( MAKE-1PILE ?auto_5665 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5669 - BLOCK
    )
    :vars
    (
      ?auto_5670 - BLOCK
      ?auto_5672 - BLOCK
      ?auto_5671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5670 ?auto_5669 ) ( ON-TABLE ?auto_5669 ) ( not ( = ?auto_5669 ?auto_5670 ) ) ( not ( = ?auto_5669 ?auto_5672 ) ) ( not ( = ?auto_5669 ?auto_5671 ) ) ( not ( = ?auto_5670 ?auto_5672 ) ) ( not ( = ?auto_5670 ?auto_5671 ) ) ( not ( = ?auto_5672 ?auto_5671 ) ) ( ON ?auto_5672 ?auto_5670 ) ( CLEAR ?auto_5672 ) ( HOLDING ?auto_5671 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5671 )
      ( MAKE-1PILE ?auto_5669 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5673 - BLOCK
    )
    :vars
    (
      ?auto_5676 - BLOCK
      ?auto_5674 - BLOCK
      ?auto_5675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5676 ?auto_5673 ) ( ON-TABLE ?auto_5673 ) ( not ( = ?auto_5673 ?auto_5676 ) ) ( not ( = ?auto_5673 ?auto_5674 ) ) ( not ( = ?auto_5673 ?auto_5675 ) ) ( not ( = ?auto_5676 ?auto_5674 ) ) ( not ( = ?auto_5676 ?auto_5675 ) ) ( not ( = ?auto_5674 ?auto_5675 ) ) ( ON ?auto_5674 ?auto_5676 ) ( ON ?auto_5675 ?auto_5674 ) ( CLEAR ?auto_5675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5673 ?auto_5676 ?auto_5674 )
      ( MAKE-1PILE ?auto_5673 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5680 - BLOCK
      ?auto_5681 - BLOCK
      ?auto_5682 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5682 ) ( CLEAR ?auto_5681 ) ( ON-TABLE ?auto_5680 ) ( ON ?auto_5681 ?auto_5680 ) ( not ( = ?auto_5680 ?auto_5681 ) ) ( not ( = ?auto_5680 ?auto_5682 ) ) ( not ( = ?auto_5681 ?auto_5682 ) ) )
    :subtasks
    ( ( !STACK ?auto_5682 ?auto_5681 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5683 - BLOCK
      ?auto_5684 - BLOCK
      ?auto_5685 - BLOCK
    )
    :vars
    (
      ?auto_5686 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5684 ) ( ON-TABLE ?auto_5683 ) ( ON ?auto_5684 ?auto_5683 ) ( not ( = ?auto_5683 ?auto_5684 ) ) ( not ( = ?auto_5683 ?auto_5685 ) ) ( not ( = ?auto_5684 ?auto_5685 ) ) ( ON ?auto_5685 ?auto_5686 ) ( CLEAR ?auto_5685 ) ( HAND-EMPTY ) ( not ( = ?auto_5683 ?auto_5686 ) ) ( not ( = ?auto_5684 ?auto_5686 ) ) ( not ( = ?auto_5685 ?auto_5686 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5685 ?auto_5686 )
      ( MAKE-3PILE ?auto_5683 ?auto_5684 ?auto_5685 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5687 - BLOCK
      ?auto_5688 - BLOCK
      ?auto_5689 - BLOCK
    )
    :vars
    (
      ?auto_5690 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5687 ) ( not ( = ?auto_5687 ?auto_5688 ) ) ( not ( = ?auto_5687 ?auto_5689 ) ) ( not ( = ?auto_5688 ?auto_5689 ) ) ( ON ?auto_5689 ?auto_5690 ) ( CLEAR ?auto_5689 ) ( not ( = ?auto_5687 ?auto_5690 ) ) ( not ( = ?auto_5688 ?auto_5690 ) ) ( not ( = ?auto_5689 ?auto_5690 ) ) ( HOLDING ?auto_5688 ) ( CLEAR ?auto_5687 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5687 ?auto_5688 )
      ( MAKE-3PILE ?auto_5687 ?auto_5688 ?auto_5689 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5691 - BLOCK
      ?auto_5692 - BLOCK
      ?auto_5693 - BLOCK
    )
    :vars
    (
      ?auto_5694 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5691 ) ( not ( = ?auto_5691 ?auto_5692 ) ) ( not ( = ?auto_5691 ?auto_5693 ) ) ( not ( = ?auto_5692 ?auto_5693 ) ) ( ON ?auto_5693 ?auto_5694 ) ( not ( = ?auto_5691 ?auto_5694 ) ) ( not ( = ?auto_5692 ?auto_5694 ) ) ( not ( = ?auto_5693 ?auto_5694 ) ) ( CLEAR ?auto_5691 ) ( ON ?auto_5692 ?auto_5693 ) ( CLEAR ?auto_5692 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5694 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5694 ?auto_5693 )
      ( MAKE-3PILE ?auto_5691 ?auto_5692 ?auto_5693 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5695 - BLOCK
      ?auto_5696 - BLOCK
      ?auto_5697 - BLOCK
    )
    :vars
    (
      ?auto_5698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5695 ?auto_5696 ) ) ( not ( = ?auto_5695 ?auto_5697 ) ) ( not ( = ?auto_5696 ?auto_5697 ) ) ( ON ?auto_5697 ?auto_5698 ) ( not ( = ?auto_5695 ?auto_5698 ) ) ( not ( = ?auto_5696 ?auto_5698 ) ) ( not ( = ?auto_5697 ?auto_5698 ) ) ( ON ?auto_5696 ?auto_5697 ) ( CLEAR ?auto_5696 ) ( ON-TABLE ?auto_5698 ) ( HOLDING ?auto_5695 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5695 )
      ( MAKE-3PILE ?auto_5695 ?auto_5696 ?auto_5697 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5699 - BLOCK
      ?auto_5700 - BLOCK
      ?auto_5701 - BLOCK
    )
    :vars
    (
      ?auto_5702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5699 ?auto_5700 ) ) ( not ( = ?auto_5699 ?auto_5701 ) ) ( not ( = ?auto_5700 ?auto_5701 ) ) ( ON ?auto_5701 ?auto_5702 ) ( not ( = ?auto_5699 ?auto_5702 ) ) ( not ( = ?auto_5700 ?auto_5702 ) ) ( not ( = ?auto_5701 ?auto_5702 ) ) ( ON ?auto_5700 ?auto_5701 ) ( ON-TABLE ?auto_5702 ) ( ON ?auto_5699 ?auto_5700 ) ( CLEAR ?auto_5699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5702 ?auto_5701 ?auto_5700 )
      ( MAKE-3PILE ?auto_5699 ?auto_5700 ?auto_5701 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5705 - BLOCK
      ?auto_5706 - BLOCK
    )
    :vars
    (
      ?auto_5707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5707 ?auto_5706 ) ( CLEAR ?auto_5707 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5705 ) ( ON ?auto_5706 ?auto_5705 ) ( not ( = ?auto_5705 ?auto_5706 ) ) ( not ( = ?auto_5705 ?auto_5707 ) ) ( not ( = ?auto_5706 ?auto_5707 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5707 ?auto_5706 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5715 - BLOCK
      ?auto_5716 - BLOCK
    )
    :vars
    (
      ?auto_5717 - BLOCK
      ?auto_5718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5715 ) ( not ( = ?auto_5715 ?auto_5716 ) ) ( not ( = ?auto_5715 ?auto_5717 ) ) ( not ( = ?auto_5716 ?auto_5717 ) ) ( ON ?auto_5717 ?auto_5718 ) ( CLEAR ?auto_5717 ) ( not ( = ?auto_5715 ?auto_5718 ) ) ( not ( = ?auto_5716 ?auto_5718 ) ) ( not ( = ?auto_5717 ?auto_5718 ) ) ( HOLDING ?auto_5716 ) ( CLEAR ?auto_5715 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5715 ?auto_5716 ?auto_5717 )
      ( MAKE-2PILE ?auto_5715 ?auto_5716 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5719 - BLOCK
      ?auto_5720 - BLOCK
    )
    :vars
    (
      ?auto_5722 - BLOCK
      ?auto_5721 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5719 ) ( not ( = ?auto_5719 ?auto_5720 ) ) ( not ( = ?auto_5719 ?auto_5722 ) ) ( not ( = ?auto_5720 ?auto_5722 ) ) ( ON ?auto_5722 ?auto_5721 ) ( not ( = ?auto_5719 ?auto_5721 ) ) ( not ( = ?auto_5720 ?auto_5721 ) ) ( not ( = ?auto_5722 ?auto_5721 ) ) ( CLEAR ?auto_5719 ) ( ON ?auto_5720 ?auto_5722 ) ( CLEAR ?auto_5720 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5721 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5721 ?auto_5722 )
      ( MAKE-2PILE ?auto_5719 ?auto_5720 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5723 - BLOCK
      ?auto_5724 - BLOCK
    )
    :vars
    (
      ?auto_5726 - BLOCK
      ?auto_5725 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5723 ?auto_5724 ) ) ( not ( = ?auto_5723 ?auto_5726 ) ) ( not ( = ?auto_5724 ?auto_5726 ) ) ( ON ?auto_5726 ?auto_5725 ) ( not ( = ?auto_5723 ?auto_5725 ) ) ( not ( = ?auto_5724 ?auto_5725 ) ) ( not ( = ?auto_5726 ?auto_5725 ) ) ( ON ?auto_5724 ?auto_5726 ) ( CLEAR ?auto_5724 ) ( ON-TABLE ?auto_5725 ) ( HOLDING ?auto_5723 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5723 )
      ( MAKE-2PILE ?auto_5723 ?auto_5724 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5727 - BLOCK
      ?auto_5728 - BLOCK
    )
    :vars
    (
      ?auto_5729 - BLOCK
      ?auto_5730 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5727 ?auto_5728 ) ) ( not ( = ?auto_5727 ?auto_5729 ) ) ( not ( = ?auto_5728 ?auto_5729 ) ) ( ON ?auto_5729 ?auto_5730 ) ( not ( = ?auto_5727 ?auto_5730 ) ) ( not ( = ?auto_5728 ?auto_5730 ) ) ( not ( = ?auto_5729 ?auto_5730 ) ) ( ON ?auto_5728 ?auto_5729 ) ( ON-TABLE ?auto_5730 ) ( ON ?auto_5727 ?auto_5728 ) ( CLEAR ?auto_5727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5730 ?auto_5729 ?auto_5728 )
      ( MAKE-2PILE ?auto_5727 ?auto_5728 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5732 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5732 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5732 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5733 - BLOCK
    )
    :vars
    (
      ?auto_5734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5733 ?auto_5734 ) ( CLEAR ?auto_5733 ) ( HAND-EMPTY ) ( not ( = ?auto_5733 ?auto_5734 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5733 ?auto_5734 )
      ( MAKE-1PILE ?auto_5733 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5735 - BLOCK
    )
    :vars
    (
      ?auto_5736 - BLOCK
      ?auto_5737 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5735 ?auto_5736 ) ) ( HOLDING ?auto_5735 ) ( CLEAR ?auto_5736 ) ( ON-TABLE ?auto_5737 ) ( ON ?auto_5736 ?auto_5737 ) ( not ( = ?auto_5737 ?auto_5736 ) ) ( not ( = ?auto_5737 ?auto_5735 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5737 ?auto_5736 ?auto_5735 )
      ( MAKE-1PILE ?auto_5735 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5738 - BLOCK
    )
    :vars
    (
      ?auto_5739 - BLOCK
      ?auto_5740 - BLOCK
      ?auto_5741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5738 ?auto_5739 ) ) ( CLEAR ?auto_5739 ) ( ON-TABLE ?auto_5740 ) ( ON ?auto_5739 ?auto_5740 ) ( not ( = ?auto_5740 ?auto_5739 ) ) ( not ( = ?auto_5740 ?auto_5738 ) ) ( ON ?auto_5738 ?auto_5741 ) ( CLEAR ?auto_5738 ) ( HAND-EMPTY ) ( not ( = ?auto_5738 ?auto_5741 ) ) ( not ( = ?auto_5739 ?auto_5741 ) ) ( not ( = ?auto_5740 ?auto_5741 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5738 ?auto_5741 )
      ( MAKE-1PILE ?auto_5738 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5742 - BLOCK
    )
    :vars
    (
      ?auto_5745 - BLOCK
      ?auto_5743 - BLOCK
      ?auto_5744 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5742 ?auto_5745 ) ) ( ON-TABLE ?auto_5743 ) ( not ( = ?auto_5743 ?auto_5745 ) ) ( not ( = ?auto_5743 ?auto_5742 ) ) ( ON ?auto_5742 ?auto_5744 ) ( CLEAR ?auto_5742 ) ( not ( = ?auto_5742 ?auto_5744 ) ) ( not ( = ?auto_5745 ?auto_5744 ) ) ( not ( = ?auto_5743 ?auto_5744 ) ) ( HOLDING ?auto_5745 ) ( CLEAR ?auto_5743 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5743 ?auto_5745 )
      ( MAKE-1PILE ?auto_5742 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5746 - BLOCK
    )
    :vars
    (
      ?auto_5749 - BLOCK
      ?auto_5747 - BLOCK
      ?auto_5748 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5746 ?auto_5749 ) ) ( ON-TABLE ?auto_5747 ) ( not ( = ?auto_5747 ?auto_5749 ) ) ( not ( = ?auto_5747 ?auto_5746 ) ) ( ON ?auto_5746 ?auto_5748 ) ( not ( = ?auto_5746 ?auto_5748 ) ) ( not ( = ?auto_5749 ?auto_5748 ) ) ( not ( = ?auto_5747 ?auto_5748 ) ) ( CLEAR ?auto_5747 ) ( ON ?auto_5749 ?auto_5746 ) ( CLEAR ?auto_5749 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5748 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5748 ?auto_5746 )
      ( MAKE-1PILE ?auto_5746 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5750 - BLOCK
    )
    :vars
    (
      ?auto_5751 - BLOCK
      ?auto_5753 - BLOCK
      ?auto_5752 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5750 ?auto_5751 ) ) ( not ( = ?auto_5753 ?auto_5751 ) ) ( not ( = ?auto_5753 ?auto_5750 ) ) ( ON ?auto_5750 ?auto_5752 ) ( not ( = ?auto_5750 ?auto_5752 ) ) ( not ( = ?auto_5751 ?auto_5752 ) ) ( not ( = ?auto_5753 ?auto_5752 ) ) ( ON ?auto_5751 ?auto_5750 ) ( CLEAR ?auto_5751 ) ( ON-TABLE ?auto_5752 ) ( HOLDING ?auto_5753 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5753 )
      ( MAKE-1PILE ?auto_5750 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5754 - BLOCK
    )
    :vars
    (
      ?auto_5757 - BLOCK
      ?auto_5756 - BLOCK
      ?auto_5755 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5754 ?auto_5757 ) ) ( not ( = ?auto_5756 ?auto_5757 ) ) ( not ( = ?auto_5756 ?auto_5754 ) ) ( ON ?auto_5754 ?auto_5755 ) ( not ( = ?auto_5754 ?auto_5755 ) ) ( not ( = ?auto_5757 ?auto_5755 ) ) ( not ( = ?auto_5756 ?auto_5755 ) ) ( ON ?auto_5757 ?auto_5754 ) ( ON-TABLE ?auto_5755 ) ( ON ?auto_5756 ?auto_5757 ) ( CLEAR ?auto_5756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5755 ?auto_5754 ?auto_5757 )
      ( MAKE-1PILE ?auto_5754 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5759 - BLOCK
    )
    :vars
    (
      ?auto_5760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5760 ?auto_5759 ) ( CLEAR ?auto_5760 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5759 ) ( not ( = ?auto_5759 ?auto_5760 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5760 ?auto_5759 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5761 - BLOCK
    )
    :vars
    (
      ?auto_5762 - BLOCK
      ?auto_5763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5762 ?auto_5761 ) ( CLEAR ?auto_5762 ) ( ON-TABLE ?auto_5761 ) ( not ( = ?auto_5761 ?auto_5762 ) ) ( HOLDING ?auto_5763 ) ( not ( = ?auto_5761 ?auto_5763 ) ) ( not ( = ?auto_5762 ?auto_5763 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5763 )
      ( MAKE-1PILE ?auto_5761 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5764 - BLOCK
    )
    :vars
    (
      ?auto_5766 - BLOCK
      ?auto_5765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5766 ?auto_5764 ) ( ON-TABLE ?auto_5764 ) ( not ( = ?auto_5764 ?auto_5766 ) ) ( not ( = ?auto_5764 ?auto_5765 ) ) ( not ( = ?auto_5766 ?auto_5765 ) ) ( ON ?auto_5765 ?auto_5766 ) ( CLEAR ?auto_5765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5764 ?auto_5766 )
      ( MAKE-1PILE ?auto_5764 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5767 - BLOCK
    )
    :vars
    (
      ?auto_5769 - BLOCK
      ?auto_5768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5769 ?auto_5767 ) ( ON-TABLE ?auto_5767 ) ( not ( = ?auto_5767 ?auto_5769 ) ) ( not ( = ?auto_5767 ?auto_5768 ) ) ( not ( = ?auto_5769 ?auto_5768 ) ) ( HOLDING ?auto_5768 ) ( CLEAR ?auto_5769 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5767 ?auto_5769 ?auto_5768 )
      ( MAKE-1PILE ?auto_5767 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5770 - BLOCK
    )
    :vars
    (
      ?auto_5771 - BLOCK
      ?auto_5772 - BLOCK
      ?auto_5773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5771 ?auto_5770 ) ( ON-TABLE ?auto_5770 ) ( not ( = ?auto_5770 ?auto_5771 ) ) ( not ( = ?auto_5770 ?auto_5772 ) ) ( not ( = ?auto_5771 ?auto_5772 ) ) ( CLEAR ?auto_5771 ) ( ON ?auto_5772 ?auto_5773 ) ( CLEAR ?auto_5772 ) ( HAND-EMPTY ) ( not ( = ?auto_5770 ?auto_5773 ) ) ( not ( = ?auto_5771 ?auto_5773 ) ) ( not ( = ?auto_5772 ?auto_5773 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5772 ?auto_5773 )
      ( MAKE-1PILE ?auto_5770 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5782 - BLOCK
    )
    :vars
    (
      ?auto_5783 - BLOCK
      ?auto_5785 - BLOCK
      ?auto_5784 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5782 ?auto_5783 ) ) ( not ( = ?auto_5782 ?auto_5785 ) ) ( not ( = ?auto_5783 ?auto_5785 ) ) ( ON ?auto_5785 ?auto_5784 ) ( not ( = ?auto_5782 ?auto_5784 ) ) ( not ( = ?auto_5783 ?auto_5784 ) ) ( not ( = ?auto_5785 ?auto_5784 ) ) ( ON ?auto_5783 ?auto_5785 ) ( CLEAR ?auto_5783 ) ( HOLDING ?auto_5782 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5782 ?auto_5783 )
      ( MAKE-1PILE ?auto_5782 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5786 - BLOCK
    )
    :vars
    (
      ?auto_5787 - BLOCK
      ?auto_5788 - BLOCK
      ?auto_5789 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5786 ?auto_5787 ) ) ( not ( = ?auto_5786 ?auto_5788 ) ) ( not ( = ?auto_5787 ?auto_5788 ) ) ( ON ?auto_5788 ?auto_5789 ) ( not ( = ?auto_5786 ?auto_5789 ) ) ( not ( = ?auto_5787 ?auto_5789 ) ) ( not ( = ?auto_5788 ?auto_5789 ) ) ( ON ?auto_5787 ?auto_5788 ) ( ON ?auto_5786 ?auto_5787 ) ( CLEAR ?auto_5786 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5789 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5789 ?auto_5788 ?auto_5787 )
      ( MAKE-1PILE ?auto_5786 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5792 - BLOCK
      ?auto_5793 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5793 ) ( CLEAR ?auto_5792 ) ( ON-TABLE ?auto_5792 ) ( not ( = ?auto_5792 ?auto_5793 ) ) )
    :subtasks
    ( ( !STACK ?auto_5793 ?auto_5792 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5794 - BLOCK
      ?auto_5795 - BLOCK
    )
    :vars
    (
      ?auto_5796 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5794 ) ( ON-TABLE ?auto_5794 ) ( not ( = ?auto_5794 ?auto_5795 ) ) ( ON ?auto_5795 ?auto_5796 ) ( CLEAR ?auto_5795 ) ( HAND-EMPTY ) ( not ( = ?auto_5794 ?auto_5796 ) ) ( not ( = ?auto_5795 ?auto_5796 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5795 ?auto_5796 )
      ( MAKE-2PILE ?auto_5794 ?auto_5795 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5797 - BLOCK
      ?auto_5798 - BLOCK
    )
    :vars
    (
      ?auto_5799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5797 ?auto_5798 ) ) ( ON ?auto_5798 ?auto_5799 ) ( CLEAR ?auto_5798 ) ( not ( = ?auto_5797 ?auto_5799 ) ) ( not ( = ?auto_5798 ?auto_5799 ) ) ( HOLDING ?auto_5797 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5797 )
      ( MAKE-2PILE ?auto_5797 ?auto_5798 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5800 - BLOCK
      ?auto_5801 - BLOCK
    )
    :vars
    (
      ?auto_5802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5800 ?auto_5801 ) ) ( ON ?auto_5801 ?auto_5802 ) ( not ( = ?auto_5800 ?auto_5802 ) ) ( not ( = ?auto_5801 ?auto_5802 ) ) ( ON ?auto_5800 ?auto_5801 ) ( CLEAR ?auto_5800 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5802 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5802 ?auto_5801 )
      ( MAKE-2PILE ?auto_5800 ?auto_5801 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5803 - BLOCK
      ?auto_5804 - BLOCK
    )
    :vars
    (
      ?auto_5805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5803 ?auto_5804 ) ) ( ON ?auto_5804 ?auto_5805 ) ( not ( = ?auto_5803 ?auto_5805 ) ) ( not ( = ?auto_5804 ?auto_5805 ) ) ( ON-TABLE ?auto_5805 ) ( HOLDING ?auto_5803 ) ( CLEAR ?auto_5804 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5805 ?auto_5804 ?auto_5803 )
      ( MAKE-2PILE ?auto_5803 ?auto_5804 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5806 - BLOCK
      ?auto_5807 - BLOCK
    )
    :vars
    (
      ?auto_5808 - BLOCK
      ?auto_5809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5806 ?auto_5807 ) ) ( ON ?auto_5807 ?auto_5808 ) ( not ( = ?auto_5806 ?auto_5808 ) ) ( not ( = ?auto_5807 ?auto_5808 ) ) ( ON-TABLE ?auto_5808 ) ( CLEAR ?auto_5807 ) ( ON ?auto_5806 ?auto_5809 ) ( CLEAR ?auto_5806 ) ( HAND-EMPTY ) ( not ( = ?auto_5806 ?auto_5809 ) ) ( not ( = ?auto_5807 ?auto_5809 ) ) ( not ( = ?auto_5808 ?auto_5809 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5806 ?auto_5809 )
      ( MAKE-2PILE ?auto_5806 ?auto_5807 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5810 - BLOCK
      ?auto_5811 - BLOCK
    )
    :vars
    (
      ?auto_5813 - BLOCK
      ?auto_5812 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5810 ?auto_5811 ) ) ( not ( = ?auto_5810 ?auto_5813 ) ) ( not ( = ?auto_5811 ?auto_5813 ) ) ( ON-TABLE ?auto_5813 ) ( ON ?auto_5810 ?auto_5812 ) ( CLEAR ?auto_5810 ) ( not ( = ?auto_5810 ?auto_5812 ) ) ( not ( = ?auto_5811 ?auto_5812 ) ) ( not ( = ?auto_5813 ?auto_5812 ) ) ( HOLDING ?auto_5811 ) ( CLEAR ?auto_5813 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5813 ?auto_5811 )
      ( MAKE-2PILE ?auto_5810 ?auto_5811 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5814 - BLOCK
      ?auto_5815 - BLOCK
    )
    :vars
    (
      ?auto_5816 - BLOCK
      ?auto_5817 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5814 ?auto_5815 ) ) ( not ( = ?auto_5814 ?auto_5816 ) ) ( not ( = ?auto_5815 ?auto_5816 ) ) ( ON-TABLE ?auto_5816 ) ( ON ?auto_5814 ?auto_5817 ) ( not ( = ?auto_5814 ?auto_5817 ) ) ( not ( = ?auto_5815 ?auto_5817 ) ) ( not ( = ?auto_5816 ?auto_5817 ) ) ( CLEAR ?auto_5816 ) ( ON ?auto_5815 ?auto_5814 ) ( CLEAR ?auto_5815 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5817 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5817 ?auto_5814 )
      ( MAKE-2PILE ?auto_5814 ?auto_5815 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5818 - BLOCK
      ?auto_5819 - BLOCK
    )
    :vars
    (
      ?auto_5820 - BLOCK
      ?auto_5821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5818 ?auto_5819 ) ) ( not ( = ?auto_5818 ?auto_5820 ) ) ( not ( = ?auto_5819 ?auto_5820 ) ) ( ON ?auto_5818 ?auto_5821 ) ( not ( = ?auto_5818 ?auto_5821 ) ) ( not ( = ?auto_5819 ?auto_5821 ) ) ( not ( = ?auto_5820 ?auto_5821 ) ) ( ON ?auto_5819 ?auto_5818 ) ( CLEAR ?auto_5819 ) ( ON-TABLE ?auto_5821 ) ( HOLDING ?auto_5820 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5820 )
      ( MAKE-2PILE ?auto_5818 ?auto_5819 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5822 - BLOCK
      ?auto_5823 - BLOCK
    )
    :vars
    (
      ?auto_5825 - BLOCK
      ?auto_5824 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5822 ?auto_5823 ) ) ( not ( = ?auto_5822 ?auto_5825 ) ) ( not ( = ?auto_5823 ?auto_5825 ) ) ( ON ?auto_5822 ?auto_5824 ) ( not ( = ?auto_5822 ?auto_5824 ) ) ( not ( = ?auto_5823 ?auto_5824 ) ) ( not ( = ?auto_5825 ?auto_5824 ) ) ( ON ?auto_5823 ?auto_5822 ) ( ON-TABLE ?auto_5824 ) ( ON ?auto_5825 ?auto_5823 ) ( CLEAR ?auto_5825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5824 ?auto_5822 ?auto_5823 )
      ( MAKE-2PILE ?auto_5822 ?auto_5823 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5829 - BLOCK
      ?auto_5830 - BLOCK
      ?auto_5831 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5831 ) ( CLEAR ?auto_5830 ) ( ON-TABLE ?auto_5829 ) ( ON ?auto_5830 ?auto_5829 ) ( not ( = ?auto_5829 ?auto_5830 ) ) ( not ( = ?auto_5829 ?auto_5831 ) ) ( not ( = ?auto_5830 ?auto_5831 ) ) )
    :subtasks
    ( ( !STACK ?auto_5831 ?auto_5830 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5832 - BLOCK
      ?auto_5833 - BLOCK
      ?auto_5834 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5833 ) ( ON-TABLE ?auto_5832 ) ( ON ?auto_5833 ?auto_5832 ) ( not ( = ?auto_5832 ?auto_5833 ) ) ( not ( = ?auto_5832 ?auto_5834 ) ) ( not ( = ?auto_5833 ?auto_5834 ) ) ( ON-TABLE ?auto_5834 ) ( CLEAR ?auto_5834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_5834 )
      ( MAKE-3PILE ?auto_5832 ?auto_5833 ?auto_5834 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5835 - BLOCK
      ?auto_5836 - BLOCK
      ?auto_5837 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5835 ) ( not ( = ?auto_5835 ?auto_5836 ) ) ( not ( = ?auto_5835 ?auto_5837 ) ) ( not ( = ?auto_5836 ?auto_5837 ) ) ( ON-TABLE ?auto_5837 ) ( CLEAR ?auto_5837 ) ( HOLDING ?auto_5836 ) ( CLEAR ?auto_5835 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5835 ?auto_5836 )
      ( MAKE-3PILE ?auto_5835 ?auto_5836 ?auto_5837 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5838 - BLOCK
      ?auto_5839 - BLOCK
      ?auto_5840 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5838 ) ( not ( = ?auto_5838 ?auto_5839 ) ) ( not ( = ?auto_5838 ?auto_5840 ) ) ( not ( = ?auto_5839 ?auto_5840 ) ) ( ON-TABLE ?auto_5840 ) ( CLEAR ?auto_5838 ) ( ON ?auto_5839 ?auto_5840 ) ( CLEAR ?auto_5839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5840 )
      ( MAKE-3PILE ?auto_5838 ?auto_5839 ?auto_5840 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5841 - BLOCK
      ?auto_5842 - BLOCK
      ?auto_5843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5841 ?auto_5842 ) ) ( not ( = ?auto_5841 ?auto_5843 ) ) ( not ( = ?auto_5842 ?auto_5843 ) ) ( ON-TABLE ?auto_5843 ) ( ON ?auto_5842 ?auto_5843 ) ( CLEAR ?auto_5842 ) ( HOLDING ?auto_5841 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5841 )
      ( MAKE-3PILE ?auto_5841 ?auto_5842 ?auto_5843 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5844 - BLOCK
      ?auto_5845 - BLOCK
      ?auto_5846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5844 ?auto_5845 ) ) ( not ( = ?auto_5844 ?auto_5846 ) ) ( not ( = ?auto_5845 ?auto_5846 ) ) ( ON-TABLE ?auto_5846 ) ( ON ?auto_5845 ?auto_5846 ) ( ON ?auto_5844 ?auto_5845 ) ( CLEAR ?auto_5844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5846 ?auto_5845 )
      ( MAKE-3PILE ?auto_5844 ?auto_5845 ?auto_5846 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5847 - BLOCK
      ?auto_5848 - BLOCK
      ?auto_5849 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5847 ?auto_5848 ) ) ( not ( = ?auto_5847 ?auto_5849 ) ) ( not ( = ?auto_5848 ?auto_5849 ) ) ( ON-TABLE ?auto_5849 ) ( ON ?auto_5848 ?auto_5849 ) ( HOLDING ?auto_5847 ) ( CLEAR ?auto_5848 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5849 ?auto_5848 ?auto_5847 )
      ( MAKE-3PILE ?auto_5847 ?auto_5848 ?auto_5849 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5850 - BLOCK
      ?auto_5851 - BLOCK
      ?auto_5852 - BLOCK
    )
    :vars
    (
      ?auto_5853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5850 ?auto_5851 ) ) ( not ( = ?auto_5850 ?auto_5852 ) ) ( not ( = ?auto_5851 ?auto_5852 ) ) ( ON-TABLE ?auto_5852 ) ( ON ?auto_5851 ?auto_5852 ) ( CLEAR ?auto_5851 ) ( ON ?auto_5850 ?auto_5853 ) ( CLEAR ?auto_5850 ) ( HAND-EMPTY ) ( not ( = ?auto_5850 ?auto_5853 ) ) ( not ( = ?auto_5851 ?auto_5853 ) ) ( not ( = ?auto_5852 ?auto_5853 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5850 ?auto_5853 )
      ( MAKE-3PILE ?auto_5850 ?auto_5851 ?auto_5852 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5854 - BLOCK
      ?auto_5855 - BLOCK
      ?auto_5856 - BLOCK
    )
    :vars
    (
      ?auto_5857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5854 ?auto_5855 ) ) ( not ( = ?auto_5854 ?auto_5856 ) ) ( not ( = ?auto_5855 ?auto_5856 ) ) ( ON-TABLE ?auto_5856 ) ( ON ?auto_5854 ?auto_5857 ) ( CLEAR ?auto_5854 ) ( not ( = ?auto_5854 ?auto_5857 ) ) ( not ( = ?auto_5855 ?auto_5857 ) ) ( not ( = ?auto_5856 ?auto_5857 ) ) ( HOLDING ?auto_5855 ) ( CLEAR ?auto_5856 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5856 ?auto_5855 )
      ( MAKE-3PILE ?auto_5854 ?auto_5855 ?auto_5856 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5858 - BLOCK
      ?auto_5859 - BLOCK
      ?auto_5860 - BLOCK
    )
    :vars
    (
      ?auto_5861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5858 ?auto_5859 ) ) ( not ( = ?auto_5858 ?auto_5860 ) ) ( not ( = ?auto_5859 ?auto_5860 ) ) ( ON-TABLE ?auto_5860 ) ( ON ?auto_5858 ?auto_5861 ) ( not ( = ?auto_5858 ?auto_5861 ) ) ( not ( = ?auto_5859 ?auto_5861 ) ) ( not ( = ?auto_5860 ?auto_5861 ) ) ( CLEAR ?auto_5860 ) ( ON ?auto_5859 ?auto_5858 ) ( CLEAR ?auto_5859 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5861 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5861 ?auto_5858 )
      ( MAKE-3PILE ?auto_5858 ?auto_5859 ?auto_5860 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5862 - BLOCK
      ?auto_5863 - BLOCK
      ?auto_5864 - BLOCK
    )
    :vars
    (
      ?auto_5865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5862 ?auto_5863 ) ) ( not ( = ?auto_5862 ?auto_5864 ) ) ( not ( = ?auto_5863 ?auto_5864 ) ) ( ON ?auto_5862 ?auto_5865 ) ( not ( = ?auto_5862 ?auto_5865 ) ) ( not ( = ?auto_5863 ?auto_5865 ) ) ( not ( = ?auto_5864 ?auto_5865 ) ) ( ON ?auto_5863 ?auto_5862 ) ( CLEAR ?auto_5863 ) ( ON-TABLE ?auto_5865 ) ( HOLDING ?auto_5864 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5864 )
      ( MAKE-3PILE ?auto_5862 ?auto_5863 ?auto_5864 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5866 - BLOCK
      ?auto_5867 - BLOCK
      ?auto_5868 - BLOCK
    )
    :vars
    (
      ?auto_5869 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5866 ?auto_5867 ) ) ( not ( = ?auto_5866 ?auto_5868 ) ) ( not ( = ?auto_5867 ?auto_5868 ) ) ( ON ?auto_5866 ?auto_5869 ) ( not ( = ?auto_5866 ?auto_5869 ) ) ( not ( = ?auto_5867 ?auto_5869 ) ) ( not ( = ?auto_5868 ?auto_5869 ) ) ( ON ?auto_5867 ?auto_5866 ) ( ON-TABLE ?auto_5869 ) ( ON ?auto_5868 ?auto_5867 ) ( CLEAR ?auto_5868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5869 ?auto_5866 ?auto_5867 )
      ( MAKE-3PILE ?auto_5866 ?auto_5867 ?auto_5868 ) )
  )

)

