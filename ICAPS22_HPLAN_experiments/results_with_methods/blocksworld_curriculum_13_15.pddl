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
      ?auto_257561 - BLOCK
    )
    :vars
    (
      ?auto_257562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257561 ?auto_257562 ) ( CLEAR ?auto_257561 ) ( HAND-EMPTY ) ( not ( = ?auto_257561 ?auto_257562 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_257561 ?auto_257562 )
      ( !PUTDOWN ?auto_257561 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_257564 - BLOCK
    )
    :vars
    (
      ?auto_257565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257564 ?auto_257565 ) ( CLEAR ?auto_257564 ) ( HAND-EMPTY ) ( not ( = ?auto_257564 ?auto_257565 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_257564 ?auto_257565 )
      ( !PUTDOWN ?auto_257564 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_257568 - BLOCK
      ?auto_257569 - BLOCK
    )
    :vars
    (
      ?auto_257570 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_257568 ) ( ON ?auto_257569 ?auto_257570 ) ( CLEAR ?auto_257569 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_257568 ) ( not ( = ?auto_257568 ?auto_257569 ) ) ( not ( = ?auto_257568 ?auto_257570 ) ) ( not ( = ?auto_257569 ?auto_257570 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_257569 ?auto_257570 )
      ( !STACK ?auto_257569 ?auto_257568 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_257573 - BLOCK
      ?auto_257574 - BLOCK
    )
    :vars
    (
      ?auto_257575 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_257573 ) ( ON ?auto_257574 ?auto_257575 ) ( CLEAR ?auto_257574 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_257573 ) ( not ( = ?auto_257573 ?auto_257574 ) ) ( not ( = ?auto_257573 ?auto_257575 ) ) ( not ( = ?auto_257574 ?auto_257575 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_257574 ?auto_257575 )
      ( !STACK ?auto_257574 ?auto_257573 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_257578 - BLOCK
      ?auto_257579 - BLOCK
    )
    :vars
    (
      ?auto_257580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257579 ?auto_257580 ) ( not ( = ?auto_257578 ?auto_257579 ) ) ( not ( = ?auto_257578 ?auto_257580 ) ) ( not ( = ?auto_257579 ?auto_257580 ) ) ( ON ?auto_257578 ?auto_257579 ) ( CLEAR ?auto_257578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_257578 )
      ( MAKE-2PILE ?auto_257578 ?auto_257579 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_257583 - BLOCK
      ?auto_257584 - BLOCK
    )
    :vars
    (
      ?auto_257585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257584 ?auto_257585 ) ( not ( = ?auto_257583 ?auto_257584 ) ) ( not ( = ?auto_257583 ?auto_257585 ) ) ( not ( = ?auto_257584 ?auto_257585 ) ) ( ON ?auto_257583 ?auto_257584 ) ( CLEAR ?auto_257583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_257583 )
      ( MAKE-2PILE ?auto_257583 ?auto_257584 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_257589 - BLOCK
      ?auto_257590 - BLOCK
      ?auto_257591 - BLOCK
    )
    :vars
    (
      ?auto_257592 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_257590 ) ( ON ?auto_257591 ?auto_257592 ) ( CLEAR ?auto_257591 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_257589 ) ( ON ?auto_257590 ?auto_257589 ) ( not ( = ?auto_257589 ?auto_257590 ) ) ( not ( = ?auto_257589 ?auto_257591 ) ) ( not ( = ?auto_257589 ?auto_257592 ) ) ( not ( = ?auto_257590 ?auto_257591 ) ) ( not ( = ?auto_257590 ?auto_257592 ) ) ( not ( = ?auto_257591 ?auto_257592 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_257591 ?auto_257592 )
      ( !STACK ?auto_257591 ?auto_257590 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_257596 - BLOCK
      ?auto_257597 - BLOCK
      ?auto_257598 - BLOCK
    )
    :vars
    (
      ?auto_257599 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_257597 ) ( ON ?auto_257598 ?auto_257599 ) ( CLEAR ?auto_257598 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_257596 ) ( ON ?auto_257597 ?auto_257596 ) ( not ( = ?auto_257596 ?auto_257597 ) ) ( not ( = ?auto_257596 ?auto_257598 ) ) ( not ( = ?auto_257596 ?auto_257599 ) ) ( not ( = ?auto_257597 ?auto_257598 ) ) ( not ( = ?auto_257597 ?auto_257599 ) ) ( not ( = ?auto_257598 ?auto_257599 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_257598 ?auto_257599 )
      ( !STACK ?auto_257598 ?auto_257597 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_257603 - BLOCK
      ?auto_257604 - BLOCK
      ?auto_257605 - BLOCK
    )
    :vars
    (
      ?auto_257606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257605 ?auto_257606 ) ( ON-TABLE ?auto_257603 ) ( not ( = ?auto_257603 ?auto_257604 ) ) ( not ( = ?auto_257603 ?auto_257605 ) ) ( not ( = ?auto_257603 ?auto_257606 ) ) ( not ( = ?auto_257604 ?auto_257605 ) ) ( not ( = ?auto_257604 ?auto_257606 ) ) ( not ( = ?auto_257605 ?auto_257606 ) ) ( CLEAR ?auto_257603 ) ( ON ?auto_257604 ?auto_257605 ) ( CLEAR ?auto_257604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_257603 ?auto_257604 )
      ( MAKE-3PILE ?auto_257603 ?auto_257604 ?auto_257605 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_257610 - BLOCK
      ?auto_257611 - BLOCK
      ?auto_257612 - BLOCK
    )
    :vars
    (
      ?auto_257613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257612 ?auto_257613 ) ( ON-TABLE ?auto_257610 ) ( not ( = ?auto_257610 ?auto_257611 ) ) ( not ( = ?auto_257610 ?auto_257612 ) ) ( not ( = ?auto_257610 ?auto_257613 ) ) ( not ( = ?auto_257611 ?auto_257612 ) ) ( not ( = ?auto_257611 ?auto_257613 ) ) ( not ( = ?auto_257612 ?auto_257613 ) ) ( CLEAR ?auto_257610 ) ( ON ?auto_257611 ?auto_257612 ) ( CLEAR ?auto_257611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_257610 ?auto_257611 )
      ( MAKE-3PILE ?auto_257610 ?auto_257611 ?auto_257612 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_257617 - BLOCK
      ?auto_257618 - BLOCK
      ?auto_257619 - BLOCK
    )
    :vars
    (
      ?auto_257620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257619 ?auto_257620 ) ( not ( = ?auto_257617 ?auto_257618 ) ) ( not ( = ?auto_257617 ?auto_257619 ) ) ( not ( = ?auto_257617 ?auto_257620 ) ) ( not ( = ?auto_257618 ?auto_257619 ) ) ( not ( = ?auto_257618 ?auto_257620 ) ) ( not ( = ?auto_257619 ?auto_257620 ) ) ( ON ?auto_257618 ?auto_257619 ) ( ON ?auto_257617 ?auto_257618 ) ( CLEAR ?auto_257617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_257617 )
      ( MAKE-3PILE ?auto_257617 ?auto_257618 ?auto_257619 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_257624 - BLOCK
      ?auto_257625 - BLOCK
      ?auto_257626 - BLOCK
    )
    :vars
    (
      ?auto_257627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257626 ?auto_257627 ) ( not ( = ?auto_257624 ?auto_257625 ) ) ( not ( = ?auto_257624 ?auto_257626 ) ) ( not ( = ?auto_257624 ?auto_257627 ) ) ( not ( = ?auto_257625 ?auto_257626 ) ) ( not ( = ?auto_257625 ?auto_257627 ) ) ( not ( = ?auto_257626 ?auto_257627 ) ) ( ON ?auto_257625 ?auto_257626 ) ( ON ?auto_257624 ?auto_257625 ) ( CLEAR ?auto_257624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_257624 )
      ( MAKE-3PILE ?auto_257624 ?auto_257625 ?auto_257626 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_257632 - BLOCK
      ?auto_257633 - BLOCK
      ?auto_257634 - BLOCK
      ?auto_257635 - BLOCK
    )
    :vars
    (
      ?auto_257636 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_257634 ) ( ON ?auto_257635 ?auto_257636 ) ( CLEAR ?auto_257635 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_257632 ) ( ON ?auto_257633 ?auto_257632 ) ( ON ?auto_257634 ?auto_257633 ) ( not ( = ?auto_257632 ?auto_257633 ) ) ( not ( = ?auto_257632 ?auto_257634 ) ) ( not ( = ?auto_257632 ?auto_257635 ) ) ( not ( = ?auto_257632 ?auto_257636 ) ) ( not ( = ?auto_257633 ?auto_257634 ) ) ( not ( = ?auto_257633 ?auto_257635 ) ) ( not ( = ?auto_257633 ?auto_257636 ) ) ( not ( = ?auto_257634 ?auto_257635 ) ) ( not ( = ?auto_257634 ?auto_257636 ) ) ( not ( = ?auto_257635 ?auto_257636 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_257635 ?auto_257636 )
      ( !STACK ?auto_257635 ?auto_257634 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_257641 - BLOCK
      ?auto_257642 - BLOCK
      ?auto_257643 - BLOCK
      ?auto_257644 - BLOCK
    )
    :vars
    (
      ?auto_257645 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_257643 ) ( ON ?auto_257644 ?auto_257645 ) ( CLEAR ?auto_257644 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_257641 ) ( ON ?auto_257642 ?auto_257641 ) ( ON ?auto_257643 ?auto_257642 ) ( not ( = ?auto_257641 ?auto_257642 ) ) ( not ( = ?auto_257641 ?auto_257643 ) ) ( not ( = ?auto_257641 ?auto_257644 ) ) ( not ( = ?auto_257641 ?auto_257645 ) ) ( not ( = ?auto_257642 ?auto_257643 ) ) ( not ( = ?auto_257642 ?auto_257644 ) ) ( not ( = ?auto_257642 ?auto_257645 ) ) ( not ( = ?auto_257643 ?auto_257644 ) ) ( not ( = ?auto_257643 ?auto_257645 ) ) ( not ( = ?auto_257644 ?auto_257645 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_257644 ?auto_257645 )
      ( !STACK ?auto_257644 ?auto_257643 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_257650 - BLOCK
      ?auto_257651 - BLOCK
      ?auto_257652 - BLOCK
      ?auto_257653 - BLOCK
    )
    :vars
    (
      ?auto_257654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257653 ?auto_257654 ) ( ON-TABLE ?auto_257650 ) ( ON ?auto_257651 ?auto_257650 ) ( not ( = ?auto_257650 ?auto_257651 ) ) ( not ( = ?auto_257650 ?auto_257652 ) ) ( not ( = ?auto_257650 ?auto_257653 ) ) ( not ( = ?auto_257650 ?auto_257654 ) ) ( not ( = ?auto_257651 ?auto_257652 ) ) ( not ( = ?auto_257651 ?auto_257653 ) ) ( not ( = ?auto_257651 ?auto_257654 ) ) ( not ( = ?auto_257652 ?auto_257653 ) ) ( not ( = ?auto_257652 ?auto_257654 ) ) ( not ( = ?auto_257653 ?auto_257654 ) ) ( CLEAR ?auto_257651 ) ( ON ?auto_257652 ?auto_257653 ) ( CLEAR ?auto_257652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_257650 ?auto_257651 ?auto_257652 )
      ( MAKE-4PILE ?auto_257650 ?auto_257651 ?auto_257652 ?auto_257653 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_257659 - BLOCK
      ?auto_257660 - BLOCK
      ?auto_257661 - BLOCK
      ?auto_257662 - BLOCK
    )
    :vars
    (
      ?auto_257663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257662 ?auto_257663 ) ( ON-TABLE ?auto_257659 ) ( ON ?auto_257660 ?auto_257659 ) ( not ( = ?auto_257659 ?auto_257660 ) ) ( not ( = ?auto_257659 ?auto_257661 ) ) ( not ( = ?auto_257659 ?auto_257662 ) ) ( not ( = ?auto_257659 ?auto_257663 ) ) ( not ( = ?auto_257660 ?auto_257661 ) ) ( not ( = ?auto_257660 ?auto_257662 ) ) ( not ( = ?auto_257660 ?auto_257663 ) ) ( not ( = ?auto_257661 ?auto_257662 ) ) ( not ( = ?auto_257661 ?auto_257663 ) ) ( not ( = ?auto_257662 ?auto_257663 ) ) ( CLEAR ?auto_257660 ) ( ON ?auto_257661 ?auto_257662 ) ( CLEAR ?auto_257661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_257659 ?auto_257660 ?auto_257661 )
      ( MAKE-4PILE ?auto_257659 ?auto_257660 ?auto_257661 ?auto_257662 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_257668 - BLOCK
      ?auto_257669 - BLOCK
      ?auto_257670 - BLOCK
      ?auto_257671 - BLOCK
    )
    :vars
    (
      ?auto_257672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257671 ?auto_257672 ) ( ON-TABLE ?auto_257668 ) ( not ( = ?auto_257668 ?auto_257669 ) ) ( not ( = ?auto_257668 ?auto_257670 ) ) ( not ( = ?auto_257668 ?auto_257671 ) ) ( not ( = ?auto_257668 ?auto_257672 ) ) ( not ( = ?auto_257669 ?auto_257670 ) ) ( not ( = ?auto_257669 ?auto_257671 ) ) ( not ( = ?auto_257669 ?auto_257672 ) ) ( not ( = ?auto_257670 ?auto_257671 ) ) ( not ( = ?auto_257670 ?auto_257672 ) ) ( not ( = ?auto_257671 ?auto_257672 ) ) ( ON ?auto_257670 ?auto_257671 ) ( CLEAR ?auto_257668 ) ( ON ?auto_257669 ?auto_257670 ) ( CLEAR ?auto_257669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_257668 ?auto_257669 )
      ( MAKE-4PILE ?auto_257668 ?auto_257669 ?auto_257670 ?auto_257671 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_257677 - BLOCK
      ?auto_257678 - BLOCK
      ?auto_257679 - BLOCK
      ?auto_257680 - BLOCK
    )
    :vars
    (
      ?auto_257681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257680 ?auto_257681 ) ( ON-TABLE ?auto_257677 ) ( not ( = ?auto_257677 ?auto_257678 ) ) ( not ( = ?auto_257677 ?auto_257679 ) ) ( not ( = ?auto_257677 ?auto_257680 ) ) ( not ( = ?auto_257677 ?auto_257681 ) ) ( not ( = ?auto_257678 ?auto_257679 ) ) ( not ( = ?auto_257678 ?auto_257680 ) ) ( not ( = ?auto_257678 ?auto_257681 ) ) ( not ( = ?auto_257679 ?auto_257680 ) ) ( not ( = ?auto_257679 ?auto_257681 ) ) ( not ( = ?auto_257680 ?auto_257681 ) ) ( ON ?auto_257679 ?auto_257680 ) ( CLEAR ?auto_257677 ) ( ON ?auto_257678 ?auto_257679 ) ( CLEAR ?auto_257678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_257677 ?auto_257678 )
      ( MAKE-4PILE ?auto_257677 ?auto_257678 ?auto_257679 ?auto_257680 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_257686 - BLOCK
      ?auto_257687 - BLOCK
      ?auto_257688 - BLOCK
      ?auto_257689 - BLOCK
    )
    :vars
    (
      ?auto_257690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257689 ?auto_257690 ) ( not ( = ?auto_257686 ?auto_257687 ) ) ( not ( = ?auto_257686 ?auto_257688 ) ) ( not ( = ?auto_257686 ?auto_257689 ) ) ( not ( = ?auto_257686 ?auto_257690 ) ) ( not ( = ?auto_257687 ?auto_257688 ) ) ( not ( = ?auto_257687 ?auto_257689 ) ) ( not ( = ?auto_257687 ?auto_257690 ) ) ( not ( = ?auto_257688 ?auto_257689 ) ) ( not ( = ?auto_257688 ?auto_257690 ) ) ( not ( = ?auto_257689 ?auto_257690 ) ) ( ON ?auto_257688 ?auto_257689 ) ( ON ?auto_257687 ?auto_257688 ) ( ON ?auto_257686 ?auto_257687 ) ( CLEAR ?auto_257686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_257686 )
      ( MAKE-4PILE ?auto_257686 ?auto_257687 ?auto_257688 ?auto_257689 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_257695 - BLOCK
      ?auto_257696 - BLOCK
      ?auto_257697 - BLOCK
      ?auto_257698 - BLOCK
    )
    :vars
    (
      ?auto_257699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257698 ?auto_257699 ) ( not ( = ?auto_257695 ?auto_257696 ) ) ( not ( = ?auto_257695 ?auto_257697 ) ) ( not ( = ?auto_257695 ?auto_257698 ) ) ( not ( = ?auto_257695 ?auto_257699 ) ) ( not ( = ?auto_257696 ?auto_257697 ) ) ( not ( = ?auto_257696 ?auto_257698 ) ) ( not ( = ?auto_257696 ?auto_257699 ) ) ( not ( = ?auto_257697 ?auto_257698 ) ) ( not ( = ?auto_257697 ?auto_257699 ) ) ( not ( = ?auto_257698 ?auto_257699 ) ) ( ON ?auto_257697 ?auto_257698 ) ( ON ?auto_257696 ?auto_257697 ) ( ON ?auto_257695 ?auto_257696 ) ( CLEAR ?auto_257695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_257695 )
      ( MAKE-4PILE ?auto_257695 ?auto_257696 ?auto_257697 ?auto_257698 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_257705 - BLOCK
      ?auto_257706 - BLOCK
      ?auto_257707 - BLOCK
      ?auto_257708 - BLOCK
      ?auto_257709 - BLOCK
    )
    :vars
    (
      ?auto_257710 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_257708 ) ( ON ?auto_257709 ?auto_257710 ) ( CLEAR ?auto_257709 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_257705 ) ( ON ?auto_257706 ?auto_257705 ) ( ON ?auto_257707 ?auto_257706 ) ( ON ?auto_257708 ?auto_257707 ) ( not ( = ?auto_257705 ?auto_257706 ) ) ( not ( = ?auto_257705 ?auto_257707 ) ) ( not ( = ?auto_257705 ?auto_257708 ) ) ( not ( = ?auto_257705 ?auto_257709 ) ) ( not ( = ?auto_257705 ?auto_257710 ) ) ( not ( = ?auto_257706 ?auto_257707 ) ) ( not ( = ?auto_257706 ?auto_257708 ) ) ( not ( = ?auto_257706 ?auto_257709 ) ) ( not ( = ?auto_257706 ?auto_257710 ) ) ( not ( = ?auto_257707 ?auto_257708 ) ) ( not ( = ?auto_257707 ?auto_257709 ) ) ( not ( = ?auto_257707 ?auto_257710 ) ) ( not ( = ?auto_257708 ?auto_257709 ) ) ( not ( = ?auto_257708 ?auto_257710 ) ) ( not ( = ?auto_257709 ?auto_257710 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_257709 ?auto_257710 )
      ( !STACK ?auto_257709 ?auto_257708 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_257716 - BLOCK
      ?auto_257717 - BLOCK
      ?auto_257718 - BLOCK
      ?auto_257719 - BLOCK
      ?auto_257720 - BLOCK
    )
    :vars
    (
      ?auto_257721 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_257719 ) ( ON ?auto_257720 ?auto_257721 ) ( CLEAR ?auto_257720 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_257716 ) ( ON ?auto_257717 ?auto_257716 ) ( ON ?auto_257718 ?auto_257717 ) ( ON ?auto_257719 ?auto_257718 ) ( not ( = ?auto_257716 ?auto_257717 ) ) ( not ( = ?auto_257716 ?auto_257718 ) ) ( not ( = ?auto_257716 ?auto_257719 ) ) ( not ( = ?auto_257716 ?auto_257720 ) ) ( not ( = ?auto_257716 ?auto_257721 ) ) ( not ( = ?auto_257717 ?auto_257718 ) ) ( not ( = ?auto_257717 ?auto_257719 ) ) ( not ( = ?auto_257717 ?auto_257720 ) ) ( not ( = ?auto_257717 ?auto_257721 ) ) ( not ( = ?auto_257718 ?auto_257719 ) ) ( not ( = ?auto_257718 ?auto_257720 ) ) ( not ( = ?auto_257718 ?auto_257721 ) ) ( not ( = ?auto_257719 ?auto_257720 ) ) ( not ( = ?auto_257719 ?auto_257721 ) ) ( not ( = ?auto_257720 ?auto_257721 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_257720 ?auto_257721 )
      ( !STACK ?auto_257720 ?auto_257719 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_257727 - BLOCK
      ?auto_257728 - BLOCK
      ?auto_257729 - BLOCK
      ?auto_257730 - BLOCK
      ?auto_257731 - BLOCK
    )
    :vars
    (
      ?auto_257732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257731 ?auto_257732 ) ( ON-TABLE ?auto_257727 ) ( ON ?auto_257728 ?auto_257727 ) ( ON ?auto_257729 ?auto_257728 ) ( not ( = ?auto_257727 ?auto_257728 ) ) ( not ( = ?auto_257727 ?auto_257729 ) ) ( not ( = ?auto_257727 ?auto_257730 ) ) ( not ( = ?auto_257727 ?auto_257731 ) ) ( not ( = ?auto_257727 ?auto_257732 ) ) ( not ( = ?auto_257728 ?auto_257729 ) ) ( not ( = ?auto_257728 ?auto_257730 ) ) ( not ( = ?auto_257728 ?auto_257731 ) ) ( not ( = ?auto_257728 ?auto_257732 ) ) ( not ( = ?auto_257729 ?auto_257730 ) ) ( not ( = ?auto_257729 ?auto_257731 ) ) ( not ( = ?auto_257729 ?auto_257732 ) ) ( not ( = ?auto_257730 ?auto_257731 ) ) ( not ( = ?auto_257730 ?auto_257732 ) ) ( not ( = ?auto_257731 ?auto_257732 ) ) ( CLEAR ?auto_257729 ) ( ON ?auto_257730 ?auto_257731 ) ( CLEAR ?auto_257730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_257727 ?auto_257728 ?auto_257729 ?auto_257730 )
      ( MAKE-5PILE ?auto_257727 ?auto_257728 ?auto_257729 ?auto_257730 ?auto_257731 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_257738 - BLOCK
      ?auto_257739 - BLOCK
      ?auto_257740 - BLOCK
      ?auto_257741 - BLOCK
      ?auto_257742 - BLOCK
    )
    :vars
    (
      ?auto_257743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257742 ?auto_257743 ) ( ON-TABLE ?auto_257738 ) ( ON ?auto_257739 ?auto_257738 ) ( ON ?auto_257740 ?auto_257739 ) ( not ( = ?auto_257738 ?auto_257739 ) ) ( not ( = ?auto_257738 ?auto_257740 ) ) ( not ( = ?auto_257738 ?auto_257741 ) ) ( not ( = ?auto_257738 ?auto_257742 ) ) ( not ( = ?auto_257738 ?auto_257743 ) ) ( not ( = ?auto_257739 ?auto_257740 ) ) ( not ( = ?auto_257739 ?auto_257741 ) ) ( not ( = ?auto_257739 ?auto_257742 ) ) ( not ( = ?auto_257739 ?auto_257743 ) ) ( not ( = ?auto_257740 ?auto_257741 ) ) ( not ( = ?auto_257740 ?auto_257742 ) ) ( not ( = ?auto_257740 ?auto_257743 ) ) ( not ( = ?auto_257741 ?auto_257742 ) ) ( not ( = ?auto_257741 ?auto_257743 ) ) ( not ( = ?auto_257742 ?auto_257743 ) ) ( CLEAR ?auto_257740 ) ( ON ?auto_257741 ?auto_257742 ) ( CLEAR ?auto_257741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_257738 ?auto_257739 ?auto_257740 ?auto_257741 )
      ( MAKE-5PILE ?auto_257738 ?auto_257739 ?auto_257740 ?auto_257741 ?auto_257742 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_257749 - BLOCK
      ?auto_257750 - BLOCK
      ?auto_257751 - BLOCK
      ?auto_257752 - BLOCK
      ?auto_257753 - BLOCK
    )
    :vars
    (
      ?auto_257754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257753 ?auto_257754 ) ( ON-TABLE ?auto_257749 ) ( ON ?auto_257750 ?auto_257749 ) ( not ( = ?auto_257749 ?auto_257750 ) ) ( not ( = ?auto_257749 ?auto_257751 ) ) ( not ( = ?auto_257749 ?auto_257752 ) ) ( not ( = ?auto_257749 ?auto_257753 ) ) ( not ( = ?auto_257749 ?auto_257754 ) ) ( not ( = ?auto_257750 ?auto_257751 ) ) ( not ( = ?auto_257750 ?auto_257752 ) ) ( not ( = ?auto_257750 ?auto_257753 ) ) ( not ( = ?auto_257750 ?auto_257754 ) ) ( not ( = ?auto_257751 ?auto_257752 ) ) ( not ( = ?auto_257751 ?auto_257753 ) ) ( not ( = ?auto_257751 ?auto_257754 ) ) ( not ( = ?auto_257752 ?auto_257753 ) ) ( not ( = ?auto_257752 ?auto_257754 ) ) ( not ( = ?auto_257753 ?auto_257754 ) ) ( ON ?auto_257752 ?auto_257753 ) ( CLEAR ?auto_257750 ) ( ON ?auto_257751 ?auto_257752 ) ( CLEAR ?auto_257751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_257749 ?auto_257750 ?auto_257751 )
      ( MAKE-5PILE ?auto_257749 ?auto_257750 ?auto_257751 ?auto_257752 ?auto_257753 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_257760 - BLOCK
      ?auto_257761 - BLOCK
      ?auto_257762 - BLOCK
      ?auto_257763 - BLOCK
      ?auto_257764 - BLOCK
    )
    :vars
    (
      ?auto_257765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257764 ?auto_257765 ) ( ON-TABLE ?auto_257760 ) ( ON ?auto_257761 ?auto_257760 ) ( not ( = ?auto_257760 ?auto_257761 ) ) ( not ( = ?auto_257760 ?auto_257762 ) ) ( not ( = ?auto_257760 ?auto_257763 ) ) ( not ( = ?auto_257760 ?auto_257764 ) ) ( not ( = ?auto_257760 ?auto_257765 ) ) ( not ( = ?auto_257761 ?auto_257762 ) ) ( not ( = ?auto_257761 ?auto_257763 ) ) ( not ( = ?auto_257761 ?auto_257764 ) ) ( not ( = ?auto_257761 ?auto_257765 ) ) ( not ( = ?auto_257762 ?auto_257763 ) ) ( not ( = ?auto_257762 ?auto_257764 ) ) ( not ( = ?auto_257762 ?auto_257765 ) ) ( not ( = ?auto_257763 ?auto_257764 ) ) ( not ( = ?auto_257763 ?auto_257765 ) ) ( not ( = ?auto_257764 ?auto_257765 ) ) ( ON ?auto_257763 ?auto_257764 ) ( CLEAR ?auto_257761 ) ( ON ?auto_257762 ?auto_257763 ) ( CLEAR ?auto_257762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_257760 ?auto_257761 ?auto_257762 )
      ( MAKE-5PILE ?auto_257760 ?auto_257761 ?auto_257762 ?auto_257763 ?auto_257764 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_257771 - BLOCK
      ?auto_257772 - BLOCK
      ?auto_257773 - BLOCK
      ?auto_257774 - BLOCK
      ?auto_257775 - BLOCK
    )
    :vars
    (
      ?auto_257776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257775 ?auto_257776 ) ( ON-TABLE ?auto_257771 ) ( not ( = ?auto_257771 ?auto_257772 ) ) ( not ( = ?auto_257771 ?auto_257773 ) ) ( not ( = ?auto_257771 ?auto_257774 ) ) ( not ( = ?auto_257771 ?auto_257775 ) ) ( not ( = ?auto_257771 ?auto_257776 ) ) ( not ( = ?auto_257772 ?auto_257773 ) ) ( not ( = ?auto_257772 ?auto_257774 ) ) ( not ( = ?auto_257772 ?auto_257775 ) ) ( not ( = ?auto_257772 ?auto_257776 ) ) ( not ( = ?auto_257773 ?auto_257774 ) ) ( not ( = ?auto_257773 ?auto_257775 ) ) ( not ( = ?auto_257773 ?auto_257776 ) ) ( not ( = ?auto_257774 ?auto_257775 ) ) ( not ( = ?auto_257774 ?auto_257776 ) ) ( not ( = ?auto_257775 ?auto_257776 ) ) ( ON ?auto_257774 ?auto_257775 ) ( ON ?auto_257773 ?auto_257774 ) ( CLEAR ?auto_257771 ) ( ON ?auto_257772 ?auto_257773 ) ( CLEAR ?auto_257772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_257771 ?auto_257772 )
      ( MAKE-5PILE ?auto_257771 ?auto_257772 ?auto_257773 ?auto_257774 ?auto_257775 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_257782 - BLOCK
      ?auto_257783 - BLOCK
      ?auto_257784 - BLOCK
      ?auto_257785 - BLOCK
      ?auto_257786 - BLOCK
    )
    :vars
    (
      ?auto_257787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257786 ?auto_257787 ) ( ON-TABLE ?auto_257782 ) ( not ( = ?auto_257782 ?auto_257783 ) ) ( not ( = ?auto_257782 ?auto_257784 ) ) ( not ( = ?auto_257782 ?auto_257785 ) ) ( not ( = ?auto_257782 ?auto_257786 ) ) ( not ( = ?auto_257782 ?auto_257787 ) ) ( not ( = ?auto_257783 ?auto_257784 ) ) ( not ( = ?auto_257783 ?auto_257785 ) ) ( not ( = ?auto_257783 ?auto_257786 ) ) ( not ( = ?auto_257783 ?auto_257787 ) ) ( not ( = ?auto_257784 ?auto_257785 ) ) ( not ( = ?auto_257784 ?auto_257786 ) ) ( not ( = ?auto_257784 ?auto_257787 ) ) ( not ( = ?auto_257785 ?auto_257786 ) ) ( not ( = ?auto_257785 ?auto_257787 ) ) ( not ( = ?auto_257786 ?auto_257787 ) ) ( ON ?auto_257785 ?auto_257786 ) ( ON ?auto_257784 ?auto_257785 ) ( CLEAR ?auto_257782 ) ( ON ?auto_257783 ?auto_257784 ) ( CLEAR ?auto_257783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_257782 ?auto_257783 )
      ( MAKE-5PILE ?auto_257782 ?auto_257783 ?auto_257784 ?auto_257785 ?auto_257786 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_257793 - BLOCK
      ?auto_257794 - BLOCK
      ?auto_257795 - BLOCK
      ?auto_257796 - BLOCK
      ?auto_257797 - BLOCK
    )
    :vars
    (
      ?auto_257798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257797 ?auto_257798 ) ( not ( = ?auto_257793 ?auto_257794 ) ) ( not ( = ?auto_257793 ?auto_257795 ) ) ( not ( = ?auto_257793 ?auto_257796 ) ) ( not ( = ?auto_257793 ?auto_257797 ) ) ( not ( = ?auto_257793 ?auto_257798 ) ) ( not ( = ?auto_257794 ?auto_257795 ) ) ( not ( = ?auto_257794 ?auto_257796 ) ) ( not ( = ?auto_257794 ?auto_257797 ) ) ( not ( = ?auto_257794 ?auto_257798 ) ) ( not ( = ?auto_257795 ?auto_257796 ) ) ( not ( = ?auto_257795 ?auto_257797 ) ) ( not ( = ?auto_257795 ?auto_257798 ) ) ( not ( = ?auto_257796 ?auto_257797 ) ) ( not ( = ?auto_257796 ?auto_257798 ) ) ( not ( = ?auto_257797 ?auto_257798 ) ) ( ON ?auto_257796 ?auto_257797 ) ( ON ?auto_257795 ?auto_257796 ) ( ON ?auto_257794 ?auto_257795 ) ( ON ?auto_257793 ?auto_257794 ) ( CLEAR ?auto_257793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_257793 )
      ( MAKE-5PILE ?auto_257793 ?auto_257794 ?auto_257795 ?auto_257796 ?auto_257797 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_257804 - BLOCK
      ?auto_257805 - BLOCK
      ?auto_257806 - BLOCK
      ?auto_257807 - BLOCK
      ?auto_257808 - BLOCK
    )
    :vars
    (
      ?auto_257809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257808 ?auto_257809 ) ( not ( = ?auto_257804 ?auto_257805 ) ) ( not ( = ?auto_257804 ?auto_257806 ) ) ( not ( = ?auto_257804 ?auto_257807 ) ) ( not ( = ?auto_257804 ?auto_257808 ) ) ( not ( = ?auto_257804 ?auto_257809 ) ) ( not ( = ?auto_257805 ?auto_257806 ) ) ( not ( = ?auto_257805 ?auto_257807 ) ) ( not ( = ?auto_257805 ?auto_257808 ) ) ( not ( = ?auto_257805 ?auto_257809 ) ) ( not ( = ?auto_257806 ?auto_257807 ) ) ( not ( = ?auto_257806 ?auto_257808 ) ) ( not ( = ?auto_257806 ?auto_257809 ) ) ( not ( = ?auto_257807 ?auto_257808 ) ) ( not ( = ?auto_257807 ?auto_257809 ) ) ( not ( = ?auto_257808 ?auto_257809 ) ) ( ON ?auto_257807 ?auto_257808 ) ( ON ?auto_257806 ?auto_257807 ) ( ON ?auto_257805 ?auto_257806 ) ( ON ?auto_257804 ?auto_257805 ) ( CLEAR ?auto_257804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_257804 )
      ( MAKE-5PILE ?auto_257804 ?auto_257805 ?auto_257806 ?auto_257807 ?auto_257808 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_257816 - BLOCK
      ?auto_257817 - BLOCK
      ?auto_257818 - BLOCK
      ?auto_257819 - BLOCK
      ?auto_257820 - BLOCK
      ?auto_257821 - BLOCK
    )
    :vars
    (
      ?auto_257822 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_257820 ) ( ON ?auto_257821 ?auto_257822 ) ( CLEAR ?auto_257821 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_257816 ) ( ON ?auto_257817 ?auto_257816 ) ( ON ?auto_257818 ?auto_257817 ) ( ON ?auto_257819 ?auto_257818 ) ( ON ?auto_257820 ?auto_257819 ) ( not ( = ?auto_257816 ?auto_257817 ) ) ( not ( = ?auto_257816 ?auto_257818 ) ) ( not ( = ?auto_257816 ?auto_257819 ) ) ( not ( = ?auto_257816 ?auto_257820 ) ) ( not ( = ?auto_257816 ?auto_257821 ) ) ( not ( = ?auto_257816 ?auto_257822 ) ) ( not ( = ?auto_257817 ?auto_257818 ) ) ( not ( = ?auto_257817 ?auto_257819 ) ) ( not ( = ?auto_257817 ?auto_257820 ) ) ( not ( = ?auto_257817 ?auto_257821 ) ) ( not ( = ?auto_257817 ?auto_257822 ) ) ( not ( = ?auto_257818 ?auto_257819 ) ) ( not ( = ?auto_257818 ?auto_257820 ) ) ( not ( = ?auto_257818 ?auto_257821 ) ) ( not ( = ?auto_257818 ?auto_257822 ) ) ( not ( = ?auto_257819 ?auto_257820 ) ) ( not ( = ?auto_257819 ?auto_257821 ) ) ( not ( = ?auto_257819 ?auto_257822 ) ) ( not ( = ?auto_257820 ?auto_257821 ) ) ( not ( = ?auto_257820 ?auto_257822 ) ) ( not ( = ?auto_257821 ?auto_257822 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_257821 ?auto_257822 )
      ( !STACK ?auto_257821 ?auto_257820 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_257829 - BLOCK
      ?auto_257830 - BLOCK
      ?auto_257831 - BLOCK
      ?auto_257832 - BLOCK
      ?auto_257833 - BLOCK
      ?auto_257834 - BLOCK
    )
    :vars
    (
      ?auto_257835 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_257833 ) ( ON ?auto_257834 ?auto_257835 ) ( CLEAR ?auto_257834 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_257829 ) ( ON ?auto_257830 ?auto_257829 ) ( ON ?auto_257831 ?auto_257830 ) ( ON ?auto_257832 ?auto_257831 ) ( ON ?auto_257833 ?auto_257832 ) ( not ( = ?auto_257829 ?auto_257830 ) ) ( not ( = ?auto_257829 ?auto_257831 ) ) ( not ( = ?auto_257829 ?auto_257832 ) ) ( not ( = ?auto_257829 ?auto_257833 ) ) ( not ( = ?auto_257829 ?auto_257834 ) ) ( not ( = ?auto_257829 ?auto_257835 ) ) ( not ( = ?auto_257830 ?auto_257831 ) ) ( not ( = ?auto_257830 ?auto_257832 ) ) ( not ( = ?auto_257830 ?auto_257833 ) ) ( not ( = ?auto_257830 ?auto_257834 ) ) ( not ( = ?auto_257830 ?auto_257835 ) ) ( not ( = ?auto_257831 ?auto_257832 ) ) ( not ( = ?auto_257831 ?auto_257833 ) ) ( not ( = ?auto_257831 ?auto_257834 ) ) ( not ( = ?auto_257831 ?auto_257835 ) ) ( not ( = ?auto_257832 ?auto_257833 ) ) ( not ( = ?auto_257832 ?auto_257834 ) ) ( not ( = ?auto_257832 ?auto_257835 ) ) ( not ( = ?auto_257833 ?auto_257834 ) ) ( not ( = ?auto_257833 ?auto_257835 ) ) ( not ( = ?auto_257834 ?auto_257835 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_257834 ?auto_257835 )
      ( !STACK ?auto_257834 ?auto_257833 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_257842 - BLOCK
      ?auto_257843 - BLOCK
      ?auto_257844 - BLOCK
      ?auto_257845 - BLOCK
      ?auto_257846 - BLOCK
      ?auto_257847 - BLOCK
    )
    :vars
    (
      ?auto_257848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257847 ?auto_257848 ) ( ON-TABLE ?auto_257842 ) ( ON ?auto_257843 ?auto_257842 ) ( ON ?auto_257844 ?auto_257843 ) ( ON ?auto_257845 ?auto_257844 ) ( not ( = ?auto_257842 ?auto_257843 ) ) ( not ( = ?auto_257842 ?auto_257844 ) ) ( not ( = ?auto_257842 ?auto_257845 ) ) ( not ( = ?auto_257842 ?auto_257846 ) ) ( not ( = ?auto_257842 ?auto_257847 ) ) ( not ( = ?auto_257842 ?auto_257848 ) ) ( not ( = ?auto_257843 ?auto_257844 ) ) ( not ( = ?auto_257843 ?auto_257845 ) ) ( not ( = ?auto_257843 ?auto_257846 ) ) ( not ( = ?auto_257843 ?auto_257847 ) ) ( not ( = ?auto_257843 ?auto_257848 ) ) ( not ( = ?auto_257844 ?auto_257845 ) ) ( not ( = ?auto_257844 ?auto_257846 ) ) ( not ( = ?auto_257844 ?auto_257847 ) ) ( not ( = ?auto_257844 ?auto_257848 ) ) ( not ( = ?auto_257845 ?auto_257846 ) ) ( not ( = ?auto_257845 ?auto_257847 ) ) ( not ( = ?auto_257845 ?auto_257848 ) ) ( not ( = ?auto_257846 ?auto_257847 ) ) ( not ( = ?auto_257846 ?auto_257848 ) ) ( not ( = ?auto_257847 ?auto_257848 ) ) ( CLEAR ?auto_257845 ) ( ON ?auto_257846 ?auto_257847 ) ( CLEAR ?auto_257846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_257842 ?auto_257843 ?auto_257844 ?auto_257845 ?auto_257846 )
      ( MAKE-6PILE ?auto_257842 ?auto_257843 ?auto_257844 ?auto_257845 ?auto_257846 ?auto_257847 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_257855 - BLOCK
      ?auto_257856 - BLOCK
      ?auto_257857 - BLOCK
      ?auto_257858 - BLOCK
      ?auto_257859 - BLOCK
      ?auto_257860 - BLOCK
    )
    :vars
    (
      ?auto_257861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257860 ?auto_257861 ) ( ON-TABLE ?auto_257855 ) ( ON ?auto_257856 ?auto_257855 ) ( ON ?auto_257857 ?auto_257856 ) ( ON ?auto_257858 ?auto_257857 ) ( not ( = ?auto_257855 ?auto_257856 ) ) ( not ( = ?auto_257855 ?auto_257857 ) ) ( not ( = ?auto_257855 ?auto_257858 ) ) ( not ( = ?auto_257855 ?auto_257859 ) ) ( not ( = ?auto_257855 ?auto_257860 ) ) ( not ( = ?auto_257855 ?auto_257861 ) ) ( not ( = ?auto_257856 ?auto_257857 ) ) ( not ( = ?auto_257856 ?auto_257858 ) ) ( not ( = ?auto_257856 ?auto_257859 ) ) ( not ( = ?auto_257856 ?auto_257860 ) ) ( not ( = ?auto_257856 ?auto_257861 ) ) ( not ( = ?auto_257857 ?auto_257858 ) ) ( not ( = ?auto_257857 ?auto_257859 ) ) ( not ( = ?auto_257857 ?auto_257860 ) ) ( not ( = ?auto_257857 ?auto_257861 ) ) ( not ( = ?auto_257858 ?auto_257859 ) ) ( not ( = ?auto_257858 ?auto_257860 ) ) ( not ( = ?auto_257858 ?auto_257861 ) ) ( not ( = ?auto_257859 ?auto_257860 ) ) ( not ( = ?auto_257859 ?auto_257861 ) ) ( not ( = ?auto_257860 ?auto_257861 ) ) ( CLEAR ?auto_257858 ) ( ON ?auto_257859 ?auto_257860 ) ( CLEAR ?auto_257859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_257855 ?auto_257856 ?auto_257857 ?auto_257858 ?auto_257859 )
      ( MAKE-6PILE ?auto_257855 ?auto_257856 ?auto_257857 ?auto_257858 ?auto_257859 ?auto_257860 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_257868 - BLOCK
      ?auto_257869 - BLOCK
      ?auto_257870 - BLOCK
      ?auto_257871 - BLOCK
      ?auto_257872 - BLOCK
      ?auto_257873 - BLOCK
    )
    :vars
    (
      ?auto_257874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257873 ?auto_257874 ) ( ON-TABLE ?auto_257868 ) ( ON ?auto_257869 ?auto_257868 ) ( ON ?auto_257870 ?auto_257869 ) ( not ( = ?auto_257868 ?auto_257869 ) ) ( not ( = ?auto_257868 ?auto_257870 ) ) ( not ( = ?auto_257868 ?auto_257871 ) ) ( not ( = ?auto_257868 ?auto_257872 ) ) ( not ( = ?auto_257868 ?auto_257873 ) ) ( not ( = ?auto_257868 ?auto_257874 ) ) ( not ( = ?auto_257869 ?auto_257870 ) ) ( not ( = ?auto_257869 ?auto_257871 ) ) ( not ( = ?auto_257869 ?auto_257872 ) ) ( not ( = ?auto_257869 ?auto_257873 ) ) ( not ( = ?auto_257869 ?auto_257874 ) ) ( not ( = ?auto_257870 ?auto_257871 ) ) ( not ( = ?auto_257870 ?auto_257872 ) ) ( not ( = ?auto_257870 ?auto_257873 ) ) ( not ( = ?auto_257870 ?auto_257874 ) ) ( not ( = ?auto_257871 ?auto_257872 ) ) ( not ( = ?auto_257871 ?auto_257873 ) ) ( not ( = ?auto_257871 ?auto_257874 ) ) ( not ( = ?auto_257872 ?auto_257873 ) ) ( not ( = ?auto_257872 ?auto_257874 ) ) ( not ( = ?auto_257873 ?auto_257874 ) ) ( ON ?auto_257872 ?auto_257873 ) ( CLEAR ?auto_257870 ) ( ON ?auto_257871 ?auto_257872 ) ( CLEAR ?auto_257871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_257868 ?auto_257869 ?auto_257870 ?auto_257871 )
      ( MAKE-6PILE ?auto_257868 ?auto_257869 ?auto_257870 ?auto_257871 ?auto_257872 ?auto_257873 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_257881 - BLOCK
      ?auto_257882 - BLOCK
      ?auto_257883 - BLOCK
      ?auto_257884 - BLOCK
      ?auto_257885 - BLOCK
      ?auto_257886 - BLOCK
    )
    :vars
    (
      ?auto_257887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257886 ?auto_257887 ) ( ON-TABLE ?auto_257881 ) ( ON ?auto_257882 ?auto_257881 ) ( ON ?auto_257883 ?auto_257882 ) ( not ( = ?auto_257881 ?auto_257882 ) ) ( not ( = ?auto_257881 ?auto_257883 ) ) ( not ( = ?auto_257881 ?auto_257884 ) ) ( not ( = ?auto_257881 ?auto_257885 ) ) ( not ( = ?auto_257881 ?auto_257886 ) ) ( not ( = ?auto_257881 ?auto_257887 ) ) ( not ( = ?auto_257882 ?auto_257883 ) ) ( not ( = ?auto_257882 ?auto_257884 ) ) ( not ( = ?auto_257882 ?auto_257885 ) ) ( not ( = ?auto_257882 ?auto_257886 ) ) ( not ( = ?auto_257882 ?auto_257887 ) ) ( not ( = ?auto_257883 ?auto_257884 ) ) ( not ( = ?auto_257883 ?auto_257885 ) ) ( not ( = ?auto_257883 ?auto_257886 ) ) ( not ( = ?auto_257883 ?auto_257887 ) ) ( not ( = ?auto_257884 ?auto_257885 ) ) ( not ( = ?auto_257884 ?auto_257886 ) ) ( not ( = ?auto_257884 ?auto_257887 ) ) ( not ( = ?auto_257885 ?auto_257886 ) ) ( not ( = ?auto_257885 ?auto_257887 ) ) ( not ( = ?auto_257886 ?auto_257887 ) ) ( ON ?auto_257885 ?auto_257886 ) ( CLEAR ?auto_257883 ) ( ON ?auto_257884 ?auto_257885 ) ( CLEAR ?auto_257884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_257881 ?auto_257882 ?auto_257883 ?auto_257884 )
      ( MAKE-6PILE ?auto_257881 ?auto_257882 ?auto_257883 ?auto_257884 ?auto_257885 ?auto_257886 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_257894 - BLOCK
      ?auto_257895 - BLOCK
      ?auto_257896 - BLOCK
      ?auto_257897 - BLOCK
      ?auto_257898 - BLOCK
      ?auto_257899 - BLOCK
    )
    :vars
    (
      ?auto_257900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257899 ?auto_257900 ) ( ON-TABLE ?auto_257894 ) ( ON ?auto_257895 ?auto_257894 ) ( not ( = ?auto_257894 ?auto_257895 ) ) ( not ( = ?auto_257894 ?auto_257896 ) ) ( not ( = ?auto_257894 ?auto_257897 ) ) ( not ( = ?auto_257894 ?auto_257898 ) ) ( not ( = ?auto_257894 ?auto_257899 ) ) ( not ( = ?auto_257894 ?auto_257900 ) ) ( not ( = ?auto_257895 ?auto_257896 ) ) ( not ( = ?auto_257895 ?auto_257897 ) ) ( not ( = ?auto_257895 ?auto_257898 ) ) ( not ( = ?auto_257895 ?auto_257899 ) ) ( not ( = ?auto_257895 ?auto_257900 ) ) ( not ( = ?auto_257896 ?auto_257897 ) ) ( not ( = ?auto_257896 ?auto_257898 ) ) ( not ( = ?auto_257896 ?auto_257899 ) ) ( not ( = ?auto_257896 ?auto_257900 ) ) ( not ( = ?auto_257897 ?auto_257898 ) ) ( not ( = ?auto_257897 ?auto_257899 ) ) ( not ( = ?auto_257897 ?auto_257900 ) ) ( not ( = ?auto_257898 ?auto_257899 ) ) ( not ( = ?auto_257898 ?auto_257900 ) ) ( not ( = ?auto_257899 ?auto_257900 ) ) ( ON ?auto_257898 ?auto_257899 ) ( ON ?auto_257897 ?auto_257898 ) ( CLEAR ?auto_257895 ) ( ON ?auto_257896 ?auto_257897 ) ( CLEAR ?auto_257896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_257894 ?auto_257895 ?auto_257896 )
      ( MAKE-6PILE ?auto_257894 ?auto_257895 ?auto_257896 ?auto_257897 ?auto_257898 ?auto_257899 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_257907 - BLOCK
      ?auto_257908 - BLOCK
      ?auto_257909 - BLOCK
      ?auto_257910 - BLOCK
      ?auto_257911 - BLOCK
      ?auto_257912 - BLOCK
    )
    :vars
    (
      ?auto_257913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257912 ?auto_257913 ) ( ON-TABLE ?auto_257907 ) ( ON ?auto_257908 ?auto_257907 ) ( not ( = ?auto_257907 ?auto_257908 ) ) ( not ( = ?auto_257907 ?auto_257909 ) ) ( not ( = ?auto_257907 ?auto_257910 ) ) ( not ( = ?auto_257907 ?auto_257911 ) ) ( not ( = ?auto_257907 ?auto_257912 ) ) ( not ( = ?auto_257907 ?auto_257913 ) ) ( not ( = ?auto_257908 ?auto_257909 ) ) ( not ( = ?auto_257908 ?auto_257910 ) ) ( not ( = ?auto_257908 ?auto_257911 ) ) ( not ( = ?auto_257908 ?auto_257912 ) ) ( not ( = ?auto_257908 ?auto_257913 ) ) ( not ( = ?auto_257909 ?auto_257910 ) ) ( not ( = ?auto_257909 ?auto_257911 ) ) ( not ( = ?auto_257909 ?auto_257912 ) ) ( not ( = ?auto_257909 ?auto_257913 ) ) ( not ( = ?auto_257910 ?auto_257911 ) ) ( not ( = ?auto_257910 ?auto_257912 ) ) ( not ( = ?auto_257910 ?auto_257913 ) ) ( not ( = ?auto_257911 ?auto_257912 ) ) ( not ( = ?auto_257911 ?auto_257913 ) ) ( not ( = ?auto_257912 ?auto_257913 ) ) ( ON ?auto_257911 ?auto_257912 ) ( ON ?auto_257910 ?auto_257911 ) ( CLEAR ?auto_257908 ) ( ON ?auto_257909 ?auto_257910 ) ( CLEAR ?auto_257909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_257907 ?auto_257908 ?auto_257909 )
      ( MAKE-6PILE ?auto_257907 ?auto_257908 ?auto_257909 ?auto_257910 ?auto_257911 ?auto_257912 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_257920 - BLOCK
      ?auto_257921 - BLOCK
      ?auto_257922 - BLOCK
      ?auto_257923 - BLOCK
      ?auto_257924 - BLOCK
      ?auto_257925 - BLOCK
    )
    :vars
    (
      ?auto_257926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257925 ?auto_257926 ) ( ON-TABLE ?auto_257920 ) ( not ( = ?auto_257920 ?auto_257921 ) ) ( not ( = ?auto_257920 ?auto_257922 ) ) ( not ( = ?auto_257920 ?auto_257923 ) ) ( not ( = ?auto_257920 ?auto_257924 ) ) ( not ( = ?auto_257920 ?auto_257925 ) ) ( not ( = ?auto_257920 ?auto_257926 ) ) ( not ( = ?auto_257921 ?auto_257922 ) ) ( not ( = ?auto_257921 ?auto_257923 ) ) ( not ( = ?auto_257921 ?auto_257924 ) ) ( not ( = ?auto_257921 ?auto_257925 ) ) ( not ( = ?auto_257921 ?auto_257926 ) ) ( not ( = ?auto_257922 ?auto_257923 ) ) ( not ( = ?auto_257922 ?auto_257924 ) ) ( not ( = ?auto_257922 ?auto_257925 ) ) ( not ( = ?auto_257922 ?auto_257926 ) ) ( not ( = ?auto_257923 ?auto_257924 ) ) ( not ( = ?auto_257923 ?auto_257925 ) ) ( not ( = ?auto_257923 ?auto_257926 ) ) ( not ( = ?auto_257924 ?auto_257925 ) ) ( not ( = ?auto_257924 ?auto_257926 ) ) ( not ( = ?auto_257925 ?auto_257926 ) ) ( ON ?auto_257924 ?auto_257925 ) ( ON ?auto_257923 ?auto_257924 ) ( ON ?auto_257922 ?auto_257923 ) ( CLEAR ?auto_257920 ) ( ON ?auto_257921 ?auto_257922 ) ( CLEAR ?auto_257921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_257920 ?auto_257921 )
      ( MAKE-6PILE ?auto_257920 ?auto_257921 ?auto_257922 ?auto_257923 ?auto_257924 ?auto_257925 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_257933 - BLOCK
      ?auto_257934 - BLOCK
      ?auto_257935 - BLOCK
      ?auto_257936 - BLOCK
      ?auto_257937 - BLOCK
      ?auto_257938 - BLOCK
    )
    :vars
    (
      ?auto_257939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257938 ?auto_257939 ) ( ON-TABLE ?auto_257933 ) ( not ( = ?auto_257933 ?auto_257934 ) ) ( not ( = ?auto_257933 ?auto_257935 ) ) ( not ( = ?auto_257933 ?auto_257936 ) ) ( not ( = ?auto_257933 ?auto_257937 ) ) ( not ( = ?auto_257933 ?auto_257938 ) ) ( not ( = ?auto_257933 ?auto_257939 ) ) ( not ( = ?auto_257934 ?auto_257935 ) ) ( not ( = ?auto_257934 ?auto_257936 ) ) ( not ( = ?auto_257934 ?auto_257937 ) ) ( not ( = ?auto_257934 ?auto_257938 ) ) ( not ( = ?auto_257934 ?auto_257939 ) ) ( not ( = ?auto_257935 ?auto_257936 ) ) ( not ( = ?auto_257935 ?auto_257937 ) ) ( not ( = ?auto_257935 ?auto_257938 ) ) ( not ( = ?auto_257935 ?auto_257939 ) ) ( not ( = ?auto_257936 ?auto_257937 ) ) ( not ( = ?auto_257936 ?auto_257938 ) ) ( not ( = ?auto_257936 ?auto_257939 ) ) ( not ( = ?auto_257937 ?auto_257938 ) ) ( not ( = ?auto_257937 ?auto_257939 ) ) ( not ( = ?auto_257938 ?auto_257939 ) ) ( ON ?auto_257937 ?auto_257938 ) ( ON ?auto_257936 ?auto_257937 ) ( ON ?auto_257935 ?auto_257936 ) ( CLEAR ?auto_257933 ) ( ON ?auto_257934 ?auto_257935 ) ( CLEAR ?auto_257934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_257933 ?auto_257934 )
      ( MAKE-6PILE ?auto_257933 ?auto_257934 ?auto_257935 ?auto_257936 ?auto_257937 ?auto_257938 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_257946 - BLOCK
      ?auto_257947 - BLOCK
      ?auto_257948 - BLOCK
      ?auto_257949 - BLOCK
      ?auto_257950 - BLOCK
      ?auto_257951 - BLOCK
    )
    :vars
    (
      ?auto_257952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257951 ?auto_257952 ) ( not ( = ?auto_257946 ?auto_257947 ) ) ( not ( = ?auto_257946 ?auto_257948 ) ) ( not ( = ?auto_257946 ?auto_257949 ) ) ( not ( = ?auto_257946 ?auto_257950 ) ) ( not ( = ?auto_257946 ?auto_257951 ) ) ( not ( = ?auto_257946 ?auto_257952 ) ) ( not ( = ?auto_257947 ?auto_257948 ) ) ( not ( = ?auto_257947 ?auto_257949 ) ) ( not ( = ?auto_257947 ?auto_257950 ) ) ( not ( = ?auto_257947 ?auto_257951 ) ) ( not ( = ?auto_257947 ?auto_257952 ) ) ( not ( = ?auto_257948 ?auto_257949 ) ) ( not ( = ?auto_257948 ?auto_257950 ) ) ( not ( = ?auto_257948 ?auto_257951 ) ) ( not ( = ?auto_257948 ?auto_257952 ) ) ( not ( = ?auto_257949 ?auto_257950 ) ) ( not ( = ?auto_257949 ?auto_257951 ) ) ( not ( = ?auto_257949 ?auto_257952 ) ) ( not ( = ?auto_257950 ?auto_257951 ) ) ( not ( = ?auto_257950 ?auto_257952 ) ) ( not ( = ?auto_257951 ?auto_257952 ) ) ( ON ?auto_257950 ?auto_257951 ) ( ON ?auto_257949 ?auto_257950 ) ( ON ?auto_257948 ?auto_257949 ) ( ON ?auto_257947 ?auto_257948 ) ( ON ?auto_257946 ?auto_257947 ) ( CLEAR ?auto_257946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_257946 )
      ( MAKE-6PILE ?auto_257946 ?auto_257947 ?auto_257948 ?auto_257949 ?auto_257950 ?auto_257951 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_257959 - BLOCK
      ?auto_257960 - BLOCK
      ?auto_257961 - BLOCK
      ?auto_257962 - BLOCK
      ?auto_257963 - BLOCK
      ?auto_257964 - BLOCK
    )
    :vars
    (
      ?auto_257965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257964 ?auto_257965 ) ( not ( = ?auto_257959 ?auto_257960 ) ) ( not ( = ?auto_257959 ?auto_257961 ) ) ( not ( = ?auto_257959 ?auto_257962 ) ) ( not ( = ?auto_257959 ?auto_257963 ) ) ( not ( = ?auto_257959 ?auto_257964 ) ) ( not ( = ?auto_257959 ?auto_257965 ) ) ( not ( = ?auto_257960 ?auto_257961 ) ) ( not ( = ?auto_257960 ?auto_257962 ) ) ( not ( = ?auto_257960 ?auto_257963 ) ) ( not ( = ?auto_257960 ?auto_257964 ) ) ( not ( = ?auto_257960 ?auto_257965 ) ) ( not ( = ?auto_257961 ?auto_257962 ) ) ( not ( = ?auto_257961 ?auto_257963 ) ) ( not ( = ?auto_257961 ?auto_257964 ) ) ( not ( = ?auto_257961 ?auto_257965 ) ) ( not ( = ?auto_257962 ?auto_257963 ) ) ( not ( = ?auto_257962 ?auto_257964 ) ) ( not ( = ?auto_257962 ?auto_257965 ) ) ( not ( = ?auto_257963 ?auto_257964 ) ) ( not ( = ?auto_257963 ?auto_257965 ) ) ( not ( = ?auto_257964 ?auto_257965 ) ) ( ON ?auto_257963 ?auto_257964 ) ( ON ?auto_257962 ?auto_257963 ) ( ON ?auto_257961 ?auto_257962 ) ( ON ?auto_257960 ?auto_257961 ) ( ON ?auto_257959 ?auto_257960 ) ( CLEAR ?auto_257959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_257959 )
      ( MAKE-6PILE ?auto_257959 ?auto_257960 ?auto_257961 ?auto_257962 ?auto_257963 ?auto_257964 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_257973 - BLOCK
      ?auto_257974 - BLOCK
      ?auto_257975 - BLOCK
      ?auto_257976 - BLOCK
      ?auto_257977 - BLOCK
      ?auto_257978 - BLOCK
      ?auto_257979 - BLOCK
    )
    :vars
    (
      ?auto_257980 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_257978 ) ( ON ?auto_257979 ?auto_257980 ) ( CLEAR ?auto_257979 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_257973 ) ( ON ?auto_257974 ?auto_257973 ) ( ON ?auto_257975 ?auto_257974 ) ( ON ?auto_257976 ?auto_257975 ) ( ON ?auto_257977 ?auto_257976 ) ( ON ?auto_257978 ?auto_257977 ) ( not ( = ?auto_257973 ?auto_257974 ) ) ( not ( = ?auto_257973 ?auto_257975 ) ) ( not ( = ?auto_257973 ?auto_257976 ) ) ( not ( = ?auto_257973 ?auto_257977 ) ) ( not ( = ?auto_257973 ?auto_257978 ) ) ( not ( = ?auto_257973 ?auto_257979 ) ) ( not ( = ?auto_257973 ?auto_257980 ) ) ( not ( = ?auto_257974 ?auto_257975 ) ) ( not ( = ?auto_257974 ?auto_257976 ) ) ( not ( = ?auto_257974 ?auto_257977 ) ) ( not ( = ?auto_257974 ?auto_257978 ) ) ( not ( = ?auto_257974 ?auto_257979 ) ) ( not ( = ?auto_257974 ?auto_257980 ) ) ( not ( = ?auto_257975 ?auto_257976 ) ) ( not ( = ?auto_257975 ?auto_257977 ) ) ( not ( = ?auto_257975 ?auto_257978 ) ) ( not ( = ?auto_257975 ?auto_257979 ) ) ( not ( = ?auto_257975 ?auto_257980 ) ) ( not ( = ?auto_257976 ?auto_257977 ) ) ( not ( = ?auto_257976 ?auto_257978 ) ) ( not ( = ?auto_257976 ?auto_257979 ) ) ( not ( = ?auto_257976 ?auto_257980 ) ) ( not ( = ?auto_257977 ?auto_257978 ) ) ( not ( = ?auto_257977 ?auto_257979 ) ) ( not ( = ?auto_257977 ?auto_257980 ) ) ( not ( = ?auto_257978 ?auto_257979 ) ) ( not ( = ?auto_257978 ?auto_257980 ) ) ( not ( = ?auto_257979 ?auto_257980 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_257979 ?auto_257980 )
      ( !STACK ?auto_257979 ?auto_257978 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_257988 - BLOCK
      ?auto_257989 - BLOCK
      ?auto_257990 - BLOCK
      ?auto_257991 - BLOCK
      ?auto_257992 - BLOCK
      ?auto_257993 - BLOCK
      ?auto_257994 - BLOCK
    )
    :vars
    (
      ?auto_257995 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_257993 ) ( ON ?auto_257994 ?auto_257995 ) ( CLEAR ?auto_257994 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_257988 ) ( ON ?auto_257989 ?auto_257988 ) ( ON ?auto_257990 ?auto_257989 ) ( ON ?auto_257991 ?auto_257990 ) ( ON ?auto_257992 ?auto_257991 ) ( ON ?auto_257993 ?auto_257992 ) ( not ( = ?auto_257988 ?auto_257989 ) ) ( not ( = ?auto_257988 ?auto_257990 ) ) ( not ( = ?auto_257988 ?auto_257991 ) ) ( not ( = ?auto_257988 ?auto_257992 ) ) ( not ( = ?auto_257988 ?auto_257993 ) ) ( not ( = ?auto_257988 ?auto_257994 ) ) ( not ( = ?auto_257988 ?auto_257995 ) ) ( not ( = ?auto_257989 ?auto_257990 ) ) ( not ( = ?auto_257989 ?auto_257991 ) ) ( not ( = ?auto_257989 ?auto_257992 ) ) ( not ( = ?auto_257989 ?auto_257993 ) ) ( not ( = ?auto_257989 ?auto_257994 ) ) ( not ( = ?auto_257989 ?auto_257995 ) ) ( not ( = ?auto_257990 ?auto_257991 ) ) ( not ( = ?auto_257990 ?auto_257992 ) ) ( not ( = ?auto_257990 ?auto_257993 ) ) ( not ( = ?auto_257990 ?auto_257994 ) ) ( not ( = ?auto_257990 ?auto_257995 ) ) ( not ( = ?auto_257991 ?auto_257992 ) ) ( not ( = ?auto_257991 ?auto_257993 ) ) ( not ( = ?auto_257991 ?auto_257994 ) ) ( not ( = ?auto_257991 ?auto_257995 ) ) ( not ( = ?auto_257992 ?auto_257993 ) ) ( not ( = ?auto_257992 ?auto_257994 ) ) ( not ( = ?auto_257992 ?auto_257995 ) ) ( not ( = ?auto_257993 ?auto_257994 ) ) ( not ( = ?auto_257993 ?auto_257995 ) ) ( not ( = ?auto_257994 ?auto_257995 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_257994 ?auto_257995 )
      ( !STACK ?auto_257994 ?auto_257993 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_258003 - BLOCK
      ?auto_258004 - BLOCK
      ?auto_258005 - BLOCK
      ?auto_258006 - BLOCK
      ?auto_258007 - BLOCK
      ?auto_258008 - BLOCK
      ?auto_258009 - BLOCK
    )
    :vars
    (
      ?auto_258010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258009 ?auto_258010 ) ( ON-TABLE ?auto_258003 ) ( ON ?auto_258004 ?auto_258003 ) ( ON ?auto_258005 ?auto_258004 ) ( ON ?auto_258006 ?auto_258005 ) ( ON ?auto_258007 ?auto_258006 ) ( not ( = ?auto_258003 ?auto_258004 ) ) ( not ( = ?auto_258003 ?auto_258005 ) ) ( not ( = ?auto_258003 ?auto_258006 ) ) ( not ( = ?auto_258003 ?auto_258007 ) ) ( not ( = ?auto_258003 ?auto_258008 ) ) ( not ( = ?auto_258003 ?auto_258009 ) ) ( not ( = ?auto_258003 ?auto_258010 ) ) ( not ( = ?auto_258004 ?auto_258005 ) ) ( not ( = ?auto_258004 ?auto_258006 ) ) ( not ( = ?auto_258004 ?auto_258007 ) ) ( not ( = ?auto_258004 ?auto_258008 ) ) ( not ( = ?auto_258004 ?auto_258009 ) ) ( not ( = ?auto_258004 ?auto_258010 ) ) ( not ( = ?auto_258005 ?auto_258006 ) ) ( not ( = ?auto_258005 ?auto_258007 ) ) ( not ( = ?auto_258005 ?auto_258008 ) ) ( not ( = ?auto_258005 ?auto_258009 ) ) ( not ( = ?auto_258005 ?auto_258010 ) ) ( not ( = ?auto_258006 ?auto_258007 ) ) ( not ( = ?auto_258006 ?auto_258008 ) ) ( not ( = ?auto_258006 ?auto_258009 ) ) ( not ( = ?auto_258006 ?auto_258010 ) ) ( not ( = ?auto_258007 ?auto_258008 ) ) ( not ( = ?auto_258007 ?auto_258009 ) ) ( not ( = ?auto_258007 ?auto_258010 ) ) ( not ( = ?auto_258008 ?auto_258009 ) ) ( not ( = ?auto_258008 ?auto_258010 ) ) ( not ( = ?auto_258009 ?auto_258010 ) ) ( CLEAR ?auto_258007 ) ( ON ?auto_258008 ?auto_258009 ) ( CLEAR ?auto_258008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_258003 ?auto_258004 ?auto_258005 ?auto_258006 ?auto_258007 ?auto_258008 )
      ( MAKE-7PILE ?auto_258003 ?auto_258004 ?auto_258005 ?auto_258006 ?auto_258007 ?auto_258008 ?auto_258009 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_258018 - BLOCK
      ?auto_258019 - BLOCK
      ?auto_258020 - BLOCK
      ?auto_258021 - BLOCK
      ?auto_258022 - BLOCK
      ?auto_258023 - BLOCK
      ?auto_258024 - BLOCK
    )
    :vars
    (
      ?auto_258025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258024 ?auto_258025 ) ( ON-TABLE ?auto_258018 ) ( ON ?auto_258019 ?auto_258018 ) ( ON ?auto_258020 ?auto_258019 ) ( ON ?auto_258021 ?auto_258020 ) ( ON ?auto_258022 ?auto_258021 ) ( not ( = ?auto_258018 ?auto_258019 ) ) ( not ( = ?auto_258018 ?auto_258020 ) ) ( not ( = ?auto_258018 ?auto_258021 ) ) ( not ( = ?auto_258018 ?auto_258022 ) ) ( not ( = ?auto_258018 ?auto_258023 ) ) ( not ( = ?auto_258018 ?auto_258024 ) ) ( not ( = ?auto_258018 ?auto_258025 ) ) ( not ( = ?auto_258019 ?auto_258020 ) ) ( not ( = ?auto_258019 ?auto_258021 ) ) ( not ( = ?auto_258019 ?auto_258022 ) ) ( not ( = ?auto_258019 ?auto_258023 ) ) ( not ( = ?auto_258019 ?auto_258024 ) ) ( not ( = ?auto_258019 ?auto_258025 ) ) ( not ( = ?auto_258020 ?auto_258021 ) ) ( not ( = ?auto_258020 ?auto_258022 ) ) ( not ( = ?auto_258020 ?auto_258023 ) ) ( not ( = ?auto_258020 ?auto_258024 ) ) ( not ( = ?auto_258020 ?auto_258025 ) ) ( not ( = ?auto_258021 ?auto_258022 ) ) ( not ( = ?auto_258021 ?auto_258023 ) ) ( not ( = ?auto_258021 ?auto_258024 ) ) ( not ( = ?auto_258021 ?auto_258025 ) ) ( not ( = ?auto_258022 ?auto_258023 ) ) ( not ( = ?auto_258022 ?auto_258024 ) ) ( not ( = ?auto_258022 ?auto_258025 ) ) ( not ( = ?auto_258023 ?auto_258024 ) ) ( not ( = ?auto_258023 ?auto_258025 ) ) ( not ( = ?auto_258024 ?auto_258025 ) ) ( CLEAR ?auto_258022 ) ( ON ?auto_258023 ?auto_258024 ) ( CLEAR ?auto_258023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_258018 ?auto_258019 ?auto_258020 ?auto_258021 ?auto_258022 ?auto_258023 )
      ( MAKE-7PILE ?auto_258018 ?auto_258019 ?auto_258020 ?auto_258021 ?auto_258022 ?auto_258023 ?auto_258024 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_258033 - BLOCK
      ?auto_258034 - BLOCK
      ?auto_258035 - BLOCK
      ?auto_258036 - BLOCK
      ?auto_258037 - BLOCK
      ?auto_258038 - BLOCK
      ?auto_258039 - BLOCK
    )
    :vars
    (
      ?auto_258040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258039 ?auto_258040 ) ( ON-TABLE ?auto_258033 ) ( ON ?auto_258034 ?auto_258033 ) ( ON ?auto_258035 ?auto_258034 ) ( ON ?auto_258036 ?auto_258035 ) ( not ( = ?auto_258033 ?auto_258034 ) ) ( not ( = ?auto_258033 ?auto_258035 ) ) ( not ( = ?auto_258033 ?auto_258036 ) ) ( not ( = ?auto_258033 ?auto_258037 ) ) ( not ( = ?auto_258033 ?auto_258038 ) ) ( not ( = ?auto_258033 ?auto_258039 ) ) ( not ( = ?auto_258033 ?auto_258040 ) ) ( not ( = ?auto_258034 ?auto_258035 ) ) ( not ( = ?auto_258034 ?auto_258036 ) ) ( not ( = ?auto_258034 ?auto_258037 ) ) ( not ( = ?auto_258034 ?auto_258038 ) ) ( not ( = ?auto_258034 ?auto_258039 ) ) ( not ( = ?auto_258034 ?auto_258040 ) ) ( not ( = ?auto_258035 ?auto_258036 ) ) ( not ( = ?auto_258035 ?auto_258037 ) ) ( not ( = ?auto_258035 ?auto_258038 ) ) ( not ( = ?auto_258035 ?auto_258039 ) ) ( not ( = ?auto_258035 ?auto_258040 ) ) ( not ( = ?auto_258036 ?auto_258037 ) ) ( not ( = ?auto_258036 ?auto_258038 ) ) ( not ( = ?auto_258036 ?auto_258039 ) ) ( not ( = ?auto_258036 ?auto_258040 ) ) ( not ( = ?auto_258037 ?auto_258038 ) ) ( not ( = ?auto_258037 ?auto_258039 ) ) ( not ( = ?auto_258037 ?auto_258040 ) ) ( not ( = ?auto_258038 ?auto_258039 ) ) ( not ( = ?auto_258038 ?auto_258040 ) ) ( not ( = ?auto_258039 ?auto_258040 ) ) ( ON ?auto_258038 ?auto_258039 ) ( CLEAR ?auto_258036 ) ( ON ?auto_258037 ?auto_258038 ) ( CLEAR ?auto_258037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_258033 ?auto_258034 ?auto_258035 ?auto_258036 ?auto_258037 )
      ( MAKE-7PILE ?auto_258033 ?auto_258034 ?auto_258035 ?auto_258036 ?auto_258037 ?auto_258038 ?auto_258039 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_258048 - BLOCK
      ?auto_258049 - BLOCK
      ?auto_258050 - BLOCK
      ?auto_258051 - BLOCK
      ?auto_258052 - BLOCK
      ?auto_258053 - BLOCK
      ?auto_258054 - BLOCK
    )
    :vars
    (
      ?auto_258055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258054 ?auto_258055 ) ( ON-TABLE ?auto_258048 ) ( ON ?auto_258049 ?auto_258048 ) ( ON ?auto_258050 ?auto_258049 ) ( ON ?auto_258051 ?auto_258050 ) ( not ( = ?auto_258048 ?auto_258049 ) ) ( not ( = ?auto_258048 ?auto_258050 ) ) ( not ( = ?auto_258048 ?auto_258051 ) ) ( not ( = ?auto_258048 ?auto_258052 ) ) ( not ( = ?auto_258048 ?auto_258053 ) ) ( not ( = ?auto_258048 ?auto_258054 ) ) ( not ( = ?auto_258048 ?auto_258055 ) ) ( not ( = ?auto_258049 ?auto_258050 ) ) ( not ( = ?auto_258049 ?auto_258051 ) ) ( not ( = ?auto_258049 ?auto_258052 ) ) ( not ( = ?auto_258049 ?auto_258053 ) ) ( not ( = ?auto_258049 ?auto_258054 ) ) ( not ( = ?auto_258049 ?auto_258055 ) ) ( not ( = ?auto_258050 ?auto_258051 ) ) ( not ( = ?auto_258050 ?auto_258052 ) ) ( not ( = ?auto_258050 ?auto_258053 ) ) ( not ( = ?auto_258050 ?auto_258054 ) ) ( not ( = ?auto_258050 ?auto_258055 ) ) ( not ( = ?auto_258051 ?auto_258052 ) ) ( not ( = ?auto_258051 ?auto_258053 ) ) ( not ( = ?auto_258051 ?auto_258054 ) ) ( not ( = ?auto_258051 ?auto_258055 ) ) ( not ( = ?auto_258052 ?auto_258053 ) ) ( not ( = ?auto_258052 ?auto_258054 ) ) ( not ( = ?auto_258052 ?auto_258055 ) ) ( not ( = ?auto_258053 ?auto_258054 ) ) ( not ( = ?auto_258053 ?auto_258055 ) ) ( not ( = ?auto_258054 ?auto_258055 ) ) ( ON ?auto_258053 ?auto_258054 ) ( CLEAR ?auto_258051 ) ( ON ?auto_258052 ?auto_258053 ) ( CLEAR ?auto_258052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_258048 ?auto_258049 ?auto_258050 ?auto_258051 ?auto_258052 )
      ( MAKE-7PILE ?auto_258048 ?auto_258049 ?auto_258050 ?auto_258051 ?auto_258052 ?auto_258053 ?auto_258054 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_258063 - BLOCK
      ?auto_258064 - BLOCK
      ?auto_258065 - BLOCK
      ?auto_258066 - BLOCK
      ?auto_258067 - BLOCK
      ?auto_258068 - BLOCK
      ?auto_258069 - BLOCK
    )
    :vars
    (
      ?auto_258070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258069 ?auto_258070 ) ( ON-TABLE ?auto_258063 ) ( ON ?auto_258064 ?auto_258063 ) ( ON ?auto_258065 ?auto_258064 ) ( not ( = ?auto_258063 ?auto_258064 ) ) ( not ( = ?auto_258063 ?auto_258065 ) ) ( not ( = ?auto_258063 ?auto_258066 ) ) ( not ( = ?auto_258063 ?auto_258067 ) ) ( not ( = ?auto_258063 ?auto_258068 ) ) ( not ( = ?auto_258063 ?auto_258069 ) ) ( not ( = ?auto_258063 ?auto_258070 ) ) ( not ( = ?auto_258064 ?auto_258065 ) ) ( not ( = ?auto_258064 ?auto_258066 ) ) ( not ( = ?auto_258064 ?auto_258067 ) ) ( not ( = ?auto_258064 ?auto_258068 ) ) ( not ( = ?auto_258064 ?auto_258069 ) ) ( not ( = ?auto_258064 ?auto_258070 ) ) ( not ( = ?auto_258065 ?auto_258066 ) ) ( not ( = ?auto_258065 ?auto_258067 ) ) ( not ( = ?auto_258065 ?auto_258068 ) ) ( not ( = ?auto_258065 ?auto_258069 ) ) ( not ( = ?auto_258065 ?auto_258070 ) ) ( not ( = ?auto_258066 ?auto_258067 ) ) ( not ( = ?auto_258066 ?auto_258068 ) ) ( not ( = ?auto_258066 ?auto_258069 ) ) ( not ( = ?auto_258066 ?auto_258070 ) ) ( not ( = ?auto_258067 ?auto_258068 ) ) ( not ( = ?auto_258067 ?auto_258069 ) ) ( not ( = ?auto_258067 ?auto_258070 ) ) ( not ( = ?auto_258068 ?auto_258069 ) ) ( not ( = ?auto_258068 ?auto_258070 ) ) ( not ( = ?auto_258069 ?auto_258070 ) ) ( ON ?auto_258068 ?auto_258069 ) ( ON ?auto_258067 ?auto_258068 ) ( CLEAR ?auto_258065 ) ( ON ?auto_258066 ?auto_258067 ) ( CLEAR ?auto_258066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_258063 ?auto_258064 ?auto_258065 ?auto_258066 )
      ( MAKE-7PILE ?auto_258063 ?auto_258064 ?auto_258065 ?auto_258066 ?auto_258067 ?auto_258068 ?auto_258069 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_258078 - BLOCK
      ?auto_258079 - BLOCK
      ?auto_258080 - BLOCK
      ?auto_258081 - BLOCK
      ?auto_258082 - BLOCK
      ?auto_258083 - BLOCK
      ?auto_258084 - BLOCK
    )
    :vars
    (
      ?auto_258085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258084 ?auto_258085 ) ( ON-TABLE ?auto_258078 ) ( ON ?auto_258079 ?auto_258078 ) ( ON ?auto_258080 ?auto_258079 ) ( not ( = ?auto_258078 ?auto_258079 ) ) ( not ( = ?auto_258078 ?auto_258080 ) ) ( not ( = ?auto_258078 ?auto_258081 ) ) ( not ( = ?auto_258078 ?auto_258082 ) ) ( not ( = ?auto_258078 ?auto_258083 ) ) ( not ( = ?auto_258078 ?auto_258084 ) ) ( not ( = ?auto_258078 ?auto_258085 ) ) ( not ( = ?auto_258079 ?auto_258080 ) ) ( not ( = ?auto_258079 ?auto_258081 ) ) ( not ( = ?auto_258079 ?auto_258082 ) ) ( not ( = ?auto_258079 ?auto_258083 ) ) ( not ( = ?auto_258079 ?auto_258084 ) ) ( not ( = ?auto_258079 ?auto_258085 ) ) ( not ( = ?auto_258080 ?auto_258081 ) ) ( not ( = ?auto_258080 ?auto_258082 ) ) ( not ( = ?auto_258080 ?auto_258083 ) ) ( not ( = ?auto_258080 ?auto_258084 ) ) ( not ( = ?auto_258080 ?auto_258085 ) ) ( not ( = ?auto_258081 ?auto_258082 ) ) ( not ( = ?auto_258081 ?auto_258083 ) ) ( not ( = ?auto_258081 ?auto_258084 ) ) ( not ( = ?auto_258081 ?auto_258085 ) ) ( not ( = ?auto_258082 ?auto_258083 ) ) ( not ( = ?auto_258082 ?auto_258084 ) ) ( not ( = ?auto_258082 ?auto_258085 ) ) ( not ( = ?auto_258083 ?auto_258084 ) ) ( not ( = ?auto_258083 ?auto_258085 ) ) ( not ( = ?auto_258084 ?auto_258085 ) ) ( ON ?auto_258083 ?auto_258084 ) ( ON ?auto_258082 ?auto_258083 ) ( CLEAR ?auto_258080 ) ( ON ?auto_258081 ?auto_258082 ) ( CLEAR ?auto_258081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_258078 ?auto_258079 ?auto_258080 ?auto_258081 )
      ( MAKE-7PILE ?auto_258078 ?auto_258079 ?auto_258080 ?auto_258081 ?auto_258082 ?auto_258083 ?auto_258084 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_258093 - BLOCK
      ?auto_258094 - BLOCK
      ?auto_258095 - BLOCK
      ?auto_258096 - BLOCK
      ?auto_258097 - BLOCK
      ?auto_258098 - BLOCK
      ?auto_258099 - BLOCK
    )
    :vars
    (
      ?auto_258100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258099 ?auto_258100 ) ( ON-TABLE ?auto_258093 ) ( ON ?auto_258094 ?auto_258093 ) ( not ( = ?auto_258093 ?auto_258094 ) ) ( not ( = ?auto_258093 ?auto_258095 ) ) ( not ( = ?auto_258093 ?auto_258096 ) ) ( not ( = ?auto_258093 ?auto_258097 ) ) ( not ( = ?auto_258093 ?auto_258098 ) ) ( not ( = ?auto_258093 ?auto_258099 ) ) ( not ( = ?auto_258093 ?auto_258100 ) ) ( not ( = ?auto_258094 ?auto_258095 ) ) ( not ( = ?auto_258094 ?auto_258096 ) ) ( not ( = ?auto_258094 ?auto_258097 ) ) ( not ( = ?auto_258094 ?auto_258098 ) ) ( not ( = ?auto_258094 ?auto_258099 ) ) ( not ( = ?auto_258094 ?auto_258100 ) ) ( not ( = ?auto_258095 ?auto_258096 ) ) ( not ( = ?auto_258095 ?auto_258097 ) ) ( not ( = ?auto_258095 ?auto_258098 ) ) ( not ( = ?auto_258095 ?auto_258099 ) ) ( not ( = ?auto_258095 ?auto_258100 ) ) ( not ( = ?auto_258096 ?auto_258097 ) ) ( not ( = ?auto_258096 ?auto_258098 ) ) ( not ( = ?auto_258096 ?auto_258099 ) ) ( not ( = ?auto_258096 ?auto_258100 ) ) ( not ( = ?auto_258097 ?auto_258098 ) ) ( not ( = ?auto_258097 ?auto_258099 ) ) ( not ( = ?auto_258097 ?auto_258100 ) ) ( not ( = ?auto_258098 ?auto_258099 ) ) ( not ( = ?auto_258098 ?auto_258100 ) ) ( not ( = ?auto_258099 ?auto_258100 ) ) ( ON ?auto_258098 ?auto_258099 ) ( ON ?auto_258097 ?auto_258098 ) ( ON ?auto_258096 ?auto_258097 ) ( CLEAR ?auto_258094 ) ( ON ?auto_258095 ?auto_258096 ) ( CLEAR ?auto_258095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_258093 ?auto_258094 ?auto_258095 )
      ( MAKE-7PILE ?auto_258093 ?auto_258094 ?auto_258095 ?auto_258096 ?auto_258097 ?auto_258098 ?auto_258099 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_258108 - BLOCK
      ?auto_258109 - BLOCK
      ?auto_258110 - BLOCK
      ?auto_258111 - BLOCK
      ?auto_258112 - BLOCK
      ?auto_258113 - BLOCK
      ?auto_258114 - BLOCK
    )
    :vars
    (
      ?auto_258115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258114 ?auto_258115 ) ( ON-TABLE ?auto_258108 ) ( ON ?auto_258109 ?auto_258108 ) ( not ( = ?auto_258108 ?auto_258109 ) ) ( not ( = ?auto_258108 ?auto_258110 ) ) ( not ( = ?auto_258108 ?auto_258111 ) ) ( not ( = ?auto_258108 ?auto_258112 ) ) ( not ( = ?auto_258108 ?auto_258113 ) ) ( not ( = ?auto_258108 ?auto_258114 ) ) ( not ( = ?auto_258108 ?auto_258115 ) ) ( not ( = ?auto_258109 ?auto_258110 ) ) ( not ( = ?auto_258109 ?auto_258111 ) ) ( not ( = ?auto_258109 ?auto_258112 ) ) ( not ( = ?auto_258109 ?auto_258113 ) ) ( not ( = ?auto_258109 ?auto_258114 ) ) ( not ( = ?auto_258109 ?auto_258115 ) ) ( not ( = ?auto_258110 ?auto_258111 ) ) ( not ( = ?auto_258110 ?auto_258112 ) ) ( not ( = ?auto_258110 ?auto_258113 ) ) ( not ( = ?auto_258110 ?auto_258114 ) ) ( not ( = ?auto_258110 ?auto_258115 ) ) ( not ( = ?auto_258111 ?auto_258112 ) ) ( not ( = ?auto_258111 ?auto_258113 ) ) ( not ( = ?auto_258111 ?auto_258114 ) ) ( not ( = ?auto_258111 ?auto_258115 ) ) ( not ( = ?auto_258112 ?auto_258113 ) ) ( not ( = ?auto_258112 ?auto_258114 ) ) ( not ( = ?auto_258112 ?auto_258115 ) ) ( not ( = ?auto_258113 ?auto_258114 ) ) ( not ( = ?auto_258113 ?auto_258115 ) ) ( not ( = ?auto_258114 ?auto_258115 ) ) ( ON ?auto_258113 ?auto_258114 ) ( ON ?auto_258112 ?auto_258113 ) ( ON ?auto_258111 ?auto_258112 ) ( CLEAR ?auto_258109 ) ( ON ?auto_258110 ?auto_258111 ) ( CLEAR ?auto_258110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_258108 ?auto_258109 ?auto_258110 )
      ( MAKE-7PILE ?auto_258108 ?auto_258109 ?auto_258110 ?auto_258111 ?auto_258112 ?auto_258113 ?auto_258114 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_258123 - BLOCK
      ?auto_258124 - BLOCK
      ?auto_258125 - BLOCK
      ?auto_258126 - BLOCK
      ?auto_258127 - BLOCK
      ?auto_258128 - BLOCK
      ?auto_258129 - BLOCK
    )
    :vars
    (
      ?auto_258130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258129 ?auto_258130 ) ( ON-TABLE ?auto_258123 ) ( not ( = ?auto_258123 ?auto_258124 ) ) ( not ( = ?auto_258123 ?auto_258125 ) ) ( not ( = ?auto_258123 ?auto_258126 ) ) ( not ( = ?auto_258123 ?auto_258127 ) ) ( not ( = ?auto_258123 ?auto_258128 ) ) ( not ( = ?auto_258123 ?auto_258129 ) ) ( not ( = ?auto_258123 ?auto_258130 ) ) ( not ( = ?auto_258124 ?auto_258125 ) ) ( not ( = ?auto_258124 ?auto_258126 ) ) ( not ( = ?auto_258124 ?auto_258127 ) ) ( not ( = ?auto_258124 ?auto_258128 ) ) ( not ( = ?auto_258124 ?auto_258129 ) ) ( not ( = ?auto_258124 ?auto_258130 ) ) ( not ( = ?auto_258125 ?auto_258126 ) ) ( not ( = ?auto_258125 ?auto_258127 ) ) ( not ( = ?auto_258125 ?auto_258128 ) ) ( not ( = ?auto_258125 ?auto_258129 ) ) ( not ( = ?auto_258125 ?auto_258130 ) ) ( not ( = ?auto_258126 ?auto_258127 ) ) ( not ( = ?auto_258126 ?auto_258128 ) ) ( not ( = ?auto_258126 ?auto_258129 ) ) ( not ( = ?auto_258126 ?auto_258130 ) ) ( not ( = ?auto_258127 ?auto_258128 ) ) ( not ( = ?auto_258127 ?auto_258129 ) ) ( not ( = ?auto_258127 ?auto_258130 ) ) ( not ( = ?auto_258128 ?auto_258129 ) ) ( not ( = ?auto_258128 ?auto_258130 ) ) ( not ( = ?auto_258129 ?auto_258130 ) ) ( ON ?auto_258128 ?auto_258129 ) ( ON ?auto_258127 ?auto_258128 ) ( ON ?auto_258126 ?auto_258127 ) ( ON ?auto_258125 ?auto_258126 ) ( CLEAR ?auto_258123 ) ( ON ?auto_258124 ?auto_258125 ) ( CLEAR ?auto_258124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_258123 ?auto_258124 )
      ( MAKE-7PILE ?auto_258123 ?auto_258124 ?auto_258125 ?auto_258126 ?auto_258127 ?auto_258128 ?auto_258129 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_258138 - BLOCK
      ?auto_258139 - BLOCK
      ?auto_258140 - BLOCK
      ?auto_258141 - BLOCK
      ?auto_258142 - BLOCK
      ?auto_258143 - BLOCK
      ?auto_258144 - BLOCK
    )
    :vars
    (
      ?auto_258145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258144 ?auto_258145 ) ( ON-TABLE ?auto_258138 ) ( not ( = ?auto_258138 ?auto_258139 ) ) ( not ( = ?auto_258138 ?auto_258140 ) ) ( not ( = ?auto_258138 ?auto_258141 ) ) ( not ( = ?auto_258138 ?auto_258142 ) ) ( not ( = ?auto_258138 ?auto_258143 ) ) ( not ( = ?auto_258138 ?auto_258144 ) ) ( not ( = ?auto_258138 ?auto_258145 ) ) ( not ( = ?auto_258139 ?auto_258140 ) ) ( not ( = ?auto_258139 ?auto_258141 ) ) ( not ( = ?auto_258139 ?auto_258142 ) ) ( not ( = ?auto_258139 ?auto_258143 ) ) ( not ( = ?auto_258139 ?auto_258144 ) ) ( not ( = ?auto_258139 ?auto_258145 ) ) ( not ( = ?auto_258140 ?auto_258141 ) ) ( not ( = ?auto_258140 ?auto_258142 ) ) ( not ( = ?auto_258140 ?auto_258143 ) ) ( not ( = ?auto_258140 ?auto_258144 ) ) ( not ( = ?auto_258140 ?auto_258145 ) ) ( not ( = ?auto_258141 ?auto_258142 ) ) ( not ( = ?auto_258141 ?auto_258143 ) ) ( not ( = ?auto_258141 ?auto_258144 ) ) ( not ( = ?auto_258141 ?auto_258145 ) ) ( not ( = ?auto_258142 ?auto_258143 ) ) ( not ( = ?auto_258142 ?auto_258144 ) ) ( not ( = ?auto_258142 ?auto_258145 ) ) ( not ( = ?auto_258143 ?auto_258144 ) ) ( not ( = ?auto_258143 ?auto_258145 ) ) ( not ( = ?auto_258144 ?auto_258145 ) ) ( ON ?auto_258143 ?auto_258144 ) ( ON ?auto_258142 ?auto_258143 ) ( ON ?auto_258141 ?auto_258142 ) ( ON ?auto_258140 ?auto_258141 ) ( CLEAR ?auto_258138 ) ( ON ?auto_258139 ?auto_258140 ) ( CLEAR ?auto_258139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_258138 ?auto_258139 )
      ( MAKE-7PILE ?auto_258138 ?auto_258139 ?auto_258140 ?auto_258141 ?auto_258142 ?auto_258143 ?auto_258144 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_258153 - BLOCK
      ?auto_258154 - BLOCK
      ?auto_258155 - BLOCK
      ?auto_258156 - BLOCK
      ?auto_258157 - BLOCK
      ?auto_258158 - BLOCK
      ?auto_258159 - BLOCK
    )
    :vars
    (
      ?auto_258160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258159 ?auto_258160 ) ( not ( = ?auto_258153 ?auto_258154 ) ) ( not ( = ?auto_258153 ?auto_258155 ) ) ( not ( = ?auto_258153 ?auto_258156 ) ) ( not ( = ?auto_258153 ?auto_258157 ) ) ( not ( = ?auto_258153 ?auto_258158 ) ) ( not ( = ?auto_258153 ?auto_258159 ) ) ( not ( = ?auto_258153 ?auto_258160 ) ) ( not ( = ?auto_258154 ?auto_258155 ) ) ( not ( = ?auto_258154 ?auto_258156 ) ) ( not ( = ?auto_258154 ?auto_258157 ) ) ( not ( = ?auto_258154 ?auto_258158 ) ) ( not ( = ?auto_258154 ?auto_258159 ) ) ( not ( = ?auto_258154 ?auto_258160 ) ) ( not ( = ?auto_258155 ?auto_258156 ) ) ( not ( = ?auto_258155 ?auto_258157 ) ) ( not ( = ?auto_258155 ?auto_258158 ) ) ( not ( = ?auto_258155 ?auto_258159 ) ) ( not ( = ?auto_258155 ?auto_258160 ) ) ( not ( = ?auto_258156 ?auto_258157 ) ) ( not ( = ?auto_258156 ?auto_258158 ) ) ( not ( = ?auto_258156 ?auto_258159 ) ) ( not ( = ?auto_258156 ?auto_258160 ) ) ( not ( = ?auto_258157 ?auto_258158 ) ) ( not ( = ?auto_258157 ?auto_258159 ) ) ( not ( = ?auto_258157 ?auto_258160 ) ) ( not ( = ?auto_258158 ?auto_258159 ) ) ( not ( = ?auto_258158 ?auto_258160 ) ) ( not ( = ?auto_258159 ?auto_258160 ) ) ( ON ?auto_258158 ?auto_258159 ) ( ON ?auto_258157 ?auto_258158 ) ( ON ?auto_258156 ?auto_258157 ) ( ON ?auto_258155 ?auto_258156 ) ( ON ?auto_258154 ?auto_258155 ) ( ON ?auto_258153 ?auto_258154 ) ( CLEAR ?auto_258153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_258153 )
      ( MAKE-7PILE ?auto_258153 ?auto_258154 ?auto_258155 ?auto_258156 ?auto_258157 ?auto_258158 ?auto_258159 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_258168 - BLOCK
      ?auto_258169 - BLOCK
      ?auto_258170 - BLOCK
      ?auto_258171 - BLOCK
      ?auto_258172 - BLOCK
      ?auto_258173 - BLOCK
      ?auto_258174 - BLOCK
    )
    :vars
    (
      ?auto_258175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258174 ?auto_258175 ) ( not ( = ?auto_258168 ?auto_258169 ) ) ( not ( = ?auto_258168 ?auto_258170 ) ) ( not ( = ?auto_258168 ?auto_258171 ) ) ( not ( = ?auto_258168 ?auto_258172 ) ) ( not ( = ?auto_258168 ?auto_258173 ) ) ( not ( = ?auto_258168 ?auto_258174 ) ) ( not ( = ?auto_258168 ?auto_258175 ) ) ( not ( = ?auto_258169 ?auto_258170 ) ) ( not ( = ?auto_258169 ?auto_258171 ) ) ( not ( = ?auto_258169 ?auto_258172 ) ) ( not ( = ?auto_258169 ?auto_258173 ) ) ( not ( = ?auto_258169 ?auto_258174 ) ) ( not ( = ?auto_258169 ?auto_258175 ) ) ( not ( = ?auto_258170 ?auto_258171 ) ) ( not ( = ?auto_258170 ?auto_258172 ) ) ( not ( = ?auto_258170 ?auto_258173 ) ) ( not ( = ?auto_258170 ?auto_258174 ) ) ( not ( = ?auto_258170 ?auto_258175 ) ) ( not ( = ?auto_258171 ?auto_258172 ) ) ( not ( = ?auto_258171 ?auto_258173 ) ) ( not ( = ?auto_258171 ?auto_258174 ) ) ( not ( = ?auto_258171 ?auto_258175 ) ) ( not ( = ?auto_258172 ?auto_258173 ) ) ( not ( = ?auto_258172 ?auto_258174 ) ) ( not ( = ?auto_258172 ?auto_258175 ) ) ( not ( = ?auto_258173 ?auto_258174 ) ) ( not ( = ?auto_258173 ?auto_258175 ) ) ( not ( = ?auto_258174 ?auto_258175 ) ) ( ON ?auto_258173 ?auto_258174 ) ( ON ?auto_258172 ?auto_258173 ) ( ON ?auto_258171 ?auto_258172 ) ( ON ?auto_258170 ?auto_258171 ) ( ON ?auto_258169 ?auto_258170 ) ( ON ?auto_258168 ?auto_258169 ) ( CLEAR ?auto_258168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_258168 )
      ( MAKE-7PILE ?auto_258168 ?auto_258169 ?auto_258170 ?auto_258171 ?auto_258172 ?auto_258173 ?auto_258174 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_258184 - BLOCK
      ?auto_258185 - BLOCK
      ?auto_258186 - BLOCK
      ?auto_258187 - BLOCK
      ?auto_258188 - BLOCK
      ?auto_258189 - BLOCK
      ?auto_258190 - BLOCK
      ?auto_258191 - BLOCK
    )
    :vars
    (
      ?auto_258192 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_258190 ) ( ON ?auto_258191 ?auto_258192 ) ( CLEAR ?auto_258191 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_258184 ) ( ON ?auto_258185 ?auto_258184 ) ( ON ?auto_258186 ?auto_258185 ) ( ON ?auto_258187 ?auto_258186 ) ( ON ?auto_258188 ?auto_258187 ) ( ON ?auto_258189 ?auto_258188 ) ( ON ?auto_258190 ?auto_258189 ) ( not ( = ?auto_258184 ?auto_258185 ) ) ( not ( = ?auto_258184 ?auto_258186 ) ) ( not ( = ?auto_258184 ?auto_258187 ) ) ( not ( = ?auto_258184 ?auto_258188 ) ) ( not ( = ?auto_258184 ?auto_258189 ) ) ( not ( = ?auto_258184 ?auto_258190 ) ) ( not ( = ?auto_258184 ?auto_258191 ) ) ( not ( = ?auto_258184 ?auto_258192 ) ) ( not ( = ?auto_258185 ?auto_258186 ) ) ( not ( = ?auto_258185 ?auto_258187 ) ) ( not ( = ?auto_258185 ?auto_258188 ) ) ( not ( = ?auto_258185 ?auto_258189 ) ) ( not ( = ?auto_258185 ?auto_258190 ) ) ( not ( = ?auto_258185 ?auto_258191 ) ) ( not ( = ?auto_258185 ?auto_258192 ) ) ( not ( = ?auto_258186 ?auto_258187 ) ) ( not ( = ?auto_258186 ?auto_258188 ) ) ( not ( = ?auto_258186 ?auto_258189 ) ) ( not ( = ?auto_258186 ?auto_258190 ) ) ( not ( = ?auto_258186 ?auto_258191 ) ) ( not ( = ?auto_258186 ?auto_258192 ) ) ( not ( = ?auto_258187 ?auto_258188 ) ) ( not ( = ?auto_258187 ?auto_258189 ) ) ( not ( = ?auto_258187 ?auto_258190 ) ) ( not ( = ?auto_258187 ?auto_258191 ) ) ( not ( = ?auto_258187 ?auto_258192 ) ) ( not ( = ?auto_258188 ?auto_258189 ) ) ( not ( = ?auto_258188 ?auto_258190 ) ) ( not ( = ?auto_258188 ?auto_258191 ) ) ( not ( = ?auto_258188 ?auto_258192 ) ) ( not ( = ?auto_258189 ?auto_258190 ) ) ( not ( = ?auto_258189 ?auto_258191 ) ) ( not ( = ?auto_258189 ?auto_258192 ) ) ( not ( = ?auto_258190 ?auto_258191 ) ) ( not ( = ?auto_258190 ?auto_258192 ) ) ( not ( = ?auto_258191 ?auto_258192 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_258191 ?auto_258192 )
      ( !STACK ?auto_258191 ?auto_258190 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_258201 - BLOCK
      ?auto_258202 - BLOCK
      ?auto_258203 - BLOCK
      ?auto_258204 - BLOCK
      ?auto_258205 - BLOCK
      ?auto_258206 - BLOCK
      ?auto_258207 - BLOCK
      ?auto_258208 - BLOCK
    )
    :vars
    (
      ?auto_258209 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_258207 ) ( ON ?auto_258208 ?auto_258209 ) ( CLEAR ?auto_258208 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_258201 ) ( ON ?auto_258202 ?auto_258201 ) ( ON ?auto_258203 ?auto_258202 ) ( ON ?auto_258204 ?auto_258203 ) ( ON ?auto_258205 ?auto_258204 ) ( ON ?auto_258206 ?auto_258205 ) ( ON ?auto_258207 ?auto_258206 ) ( not ( = ?auto_258201 ?auto_258202 ) ) ( not ( = ?auto_258201 ?auto_258203 ) ) ( not ( = ?auto_258201 ?auto_258204 ) ) ( not ( = ?auto_258201 ?auto_258205 ) ) ( not ( = ?auto_258201 ?auto_258206 ) ) ( not ( = ?auto_258201 ?auto_258207 ) ) ( not ( = ?auto_258201 ?auto_258208 ) ) ( not ( = ?auto_258201 ?auto_258209 ) ) ( not ( = ?auto_258202 ?auto_258203 ) ) ( not ( = ?auto_258202 ?auto_258204 ) ) ( not ( = ?auto_258202 ?auto_258205 ) ) ( not ( = ?auto_258202 ?auto_258206 ) ) ( not ( = ?auto_258202 ?auto_258207 ) ) ( not ( = ?auto_258202 ?auto_258208 ) ) ( not ( = ?auto_258202 ?auto_258209 ) ) ( not ( = ?auto_258203 ?auto_258204 ) ) ( not ( = ?auto_258203 ?auto_258205 ) ) ( not ( = ?auto_258203 ?auto_258206 ) ) ( not ( = ?auto_258203 ?auto_258207 ) ) ( not ( = ?auto_258203 ?auto_258208 ) ) ( not ( = ?auto_258203 ?auto_258209 ) ) ( not ( = ?auto_258204 ?auto_258205 ) ) ( not ( = ?auto_258204 ?auto_258206 ) ) ( not ( = ?auto_258204 ?auto_258207 ) ) ( not ( = ?auto_258204 ?auto_258208 ) ) ( not ( = ?auto_258204 ?auto_258209 ) ) ( not ( = ?auto_258205 ?auto_258206 ) ) ( not ( = ?auto_258205 ?auto_258207 ) ) ( not ( = ?auto_258205 ?auto_258208 ) ) ( not ( = ?auto_258205 ?auto_258209 ) ) ( not ( = ?auto_258206 ?auto_258207 ) ) ( not ( = ?auto_258206 ?auto_258208 ) ) ( not ( = ?auto_258206 ?auto_258209 ) ) ( not ( = ?auto_258207 ?auto_258208 ) ) ( not ( = ?auto_258207 ?auto_258209 ) ) ( not ( = ?auto_258208 ?auto_258209 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_258208 ?auto_258209 )
      ( !STACK ?auto_258208 ?auto_258207 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_258218 - BLOCK
      ?auto_258219 - BLOCK
      ?auto_258220 - BLOCK
      ?auto_258221 - BLOCK
      ?auto_258222 - BLOCK
      ?auto_258223 - BLOCK
      ?auto_258224 - BLOCK
      ?auto_258225 - BLOCK
    )
    :vars
    (
      ?auto_258226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258225 ?auto_258226 ) ( ON-TABLE ?auto_258218 ) ( ON ?auto_258219 ?auto_258218 ) ( ON ?auto_258220 ?auto_258219 ) ( ON ?auto_258221 ?auto_258220 ) ( ON ?auto_258222 ?auto_258221 ) ( ON ?auto_258223 ?auto_258222 ) ( not ( = ?auto_258218 ?auto_258219 ) ) ( not ( = ?auto_258218 ?auto_258220 ) ) ( not ( = ?auto_258218 ?auto_258221 ) ) ( not ( = ?auto_258218 ?auto_258222 ) ) ( not ( = ?auto_258218 ?auto_258223 ) ) ( not ( = ?auto_258218 ?auto_258224 ) ) ( not ( = ?auto_258218 ?auto_258225 ) ) ( not ( = ?auto_258218 ?auto_258226 ) ) ( not ( = ?auto_258219 ?auto_258220 ) ) ( not ( = ?auto_258219 ?auto_258221 ) ) ( not ( = ?auto_258219 ?auto_258222 ) ) ( not ( = ?auto_258219 ?auto_258223 ) ) ( not ( = ?auto_258219 ?auto_258224 ) ) ( not ( = ?auto_258219 ?auto_258225 ) ) ( not ( = ?auto_258219 ?auto_258226 ) ) ( not ( = ?auto_258220 ?auto_258221 ) ) ( not ( = ?auto_258220 ?auto_258222 ) ) ( not ( = ?auto_258220 ?auto_258223 ) ) ( not ( = ?auto_258220 ?auto_258224 ) ) ( not ( = ?auto_258220 ?auto_258225 ) ) ( not ( = ?auto_258220 ?auto_258226 ) ) ( not ( = ?auto_258221 ?auto_258222 ) ) ( not ( = ?auto_258221 ?auto_258223 ) ) ( not ( = ?auto_258221 ?auto_258224 ) ) ( not ( = ?auto_258221 ?auto_258225 ) ) ( not ( = ?auto_258221 ?auto_258226 ) ) ( not ( = ?auto_258222 ?auto_258223 ) ) ( not ( = ?auto_258222 ?auto_258224 ) ) ( not ( = ?auto_258222 ?auto_258225 ) ) ( not ( = ?auto_258222 ?auto_258226 ) ) ( not ( = ?auto_258223 ?auto_258224 ) ) ( not ( = ?auto_258223 ?auto_258225 ) ) ( not ( = ?auto_258223 ?auto_258226 ) ) ( not ( = ?auto_258224 ?auto_258225 ) ) ( not ( = ?auto_258224 ?auto_258226 ) ) ( not ( = ?auto_258225 ?auto_258226 ) ) ( CLEAR ?auto_258223 ) ( ON ?auto_258224 ?auto_258225 ) ( CLEAR ?auto_258224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_258218 ?auto_258219 ?auto_258220 ?auto_258221 ?auto_258222 ?auto_258223 ?auto_258224 )
      ( MAKE-8PILE ?auto_258218 ?auto_258219 ?auto_258220 ?auto_258221 ?auto_258222 ?auto_258223 ?auto_258224 ?auto_258225 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_258235 - BLOCK
      ?auto_258236 - BLOCK
      ?auto_258237 - BLOCK
      ?auto_258238 - BLOCK
      ?auto_258239 - BLOCK
      ?auto_258240 - BLOCK
      ?auto_258241 - BLOCK
      ?auto_258242 - BLOCK
    )
    :vars
    (
      ?auto_258243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258242 ?auto_258243 ) ( ON-TABLE ?auto_258235 ) ( ON ?auto_258236 ?auto_258235 ) ( ON ?auto_258237 ?auto_258236 ) ( ON ?auto_258238 ?auto_258237 ) ( ON ?auto_258239 ?auto_258238 ) ( ON ?auto_258240 ?auto_258239 ) ( not ( = ?auto_258235 ?auto_258236 ) ) ( not ( = ?auto_258235 ?auto_258237 ) ) ( not ( = ?auto_258235 ?auto_258238 ) ) ( not ( = ?auto_258235 ?auto_258239 ) ) ( not ( = ?auto_258235 ?auto_258240 ) ) ( not ( = ?auto_258235 ?auto_258241 ) ) ( not ( = ?auto_258235 ?auto_258242 ) ) ( not ( = ?auto_258235 ?auto_258243 ) ) ( not ( = ?auto_258236 ?auto_258237 ) ) ( not ( = ?auto_258236 ?auto_258238 ) ) ( not ( = ?auto_258236 ?auto_258239 ) ) ( not ( = ?auto_258236 ?auto_258240 ) ) ( not ( = ?auto_258236 ?auto_258241 ) ) ( not ( = ?auto_258236 ?auto_258242 ) ) ( not ( = ?auto_258236 ?auto_258243 ) ) ( not ( = ?auto_258237 ?auto_258238 ) ) ( not ( = ?auto_258237 ?auto_258239 ) ) ( not ( = ?auto_258237 ?auto_258240 ) ) ( not ( = ?auto_258237 ?auto_258241 ) ) ( not ( = ?auto_258237 ?auto_258242 ) ) ( not ( = ?auto_258237 ?auto_258243 ) ) ( not ( = ?auto_258238 ?auto_258239 ) ) ( not ( = ?auto_258238 ?auto_258240 ) ) ( not ( = ?auto_258238 ?auto_258241 ) ) ( not ( = ?auto_258238 ?auto_258242 ) ) ( not ( = ?auto_258238 ?auto_258243 ) ) ( not ( = ?auto_258239 ?auto_258240 ) ) ( not ( = ?auto_258239 ?auto_258241 ) ) ( not ( = ?auto_258239 ?auto_258242 ) ) ( not ( = ?auto_258239 ?auto_258243 ) ) ( not ( = ?auto_258240 ?auto_258241 ) ) ( not ( = ?auto_258240 ?auto_258242 ) ) ( not ( = ?auto_258240 ?auto_258243 ) ) ( not ( = ?auto_258241 ?auto_258242 ) ) ( not ( = ?auto_258241 ?auto_258243 ) ) ( not ( = ?auto_258242 ?auto_258243 ) ) ( CLEAR ?auto_258240 ) ( ON ?auto_258241 ?auto_258242 ) ( CLEAR ?auto_258241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_258235 ?auto_258236 ?auto_258237 ?auto_258238 ?auto_258239 ?auto_258240 ?auto_258241 )
      ( MAKE-8PILE ?auto_258235 ?auto_258236 ?auto_258237 ?auto_258238 ?auto_258239 ?auto_258240 ?auto_258241 ?auto_258242 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_258252 - BLOCK
      ?auto_258253 - BLOCK
      ?auto_258254 - BLOCK
      ?auto_258255 - BLOCK
      ?auto_258256 - BLOCK
      ?auto_258257 - BLOCK
      ?auto_258258 - BLOCK
      ?auto_258259 - BLOCK
    )
    :vars
    (
      ?auto_258260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258259 ?auto_258260 ) ( ON-TABLE ?auto_258252 ) ( ON ?auto_258253 ?auto_258252 ) ( ON ?auto_258254 ?auto_258253 ) ( ON ?auto_258255 ?auto_258254 ) ( ON ?auto_258256 ?auto_258255 ) ( not ( = ?auto_258252 ?auto_258253 ) ) ( not ( = ?auto_258252 ?auto_258254 ) ) ( not ( = ?auto_258252 ?auto_258255 ) ) ( not ( = ?auto_258252 ?auto_258256 ) ) ( not ( = ?auto_258252 ?auto_258257 ) ) ( not ( = ?auto_258252 ?auto_258258 ) ) ( not ( = ?auto_258252 ?auto_258259 ) ) ( not ( = ?auto_258252 ?auto_258260 ) ) ( not ( = ?auto_258253 ?auto_258254 ) ) ( not ( = ?auto_258253 ?auto_258255 ) ) ( not ( = ?auto_258253 ?auto_258256 ) ) ( not ( = ?auto_258253 ?auto_258257 ) ) ( not ( = ?auto_258253 ?auto_258258 ) ) ( not ( = ?auto_258253 ?auto_258259 ) ) ( not ( = ?auto_258253 ?auto_258260 ) ) ( not ( = ?auto_258254 ?auto_258255 ) ) ( not ( = ?auto_258254 ?auto_258256 ) ) ( not ( = ?auto_258254 ?auto_258257 ) ) ( not ( = ?auto_258254 ?auto_258258 ) ) ( not ( = ?auto_258254 ?auto_258259 ) ) ( not ( = ?auto_258254 ?auto_258260 ) ) ( not ( = ?auto_258255 ?auto_258256 ) ) ( not ( = ?auto_258255 ?auto_258257 ) ) ( not ( = ?auto_258255 ?auto_258258 ) ) ( not ( = ?auto_258255 ?auto_258259 ) ) ( not ( = ?auto_258255 ?auto_258260 ) ) ( not ( = ?auto_258256 ?auto_258257 ) ) ( not ( = ?auto_258256 ?auto_258258 ) ) ( not ( = ?auto_258256 ?auto_258259 ) ) ( not ( = ?auto_258256 ?auto_258260 ) ) ( not ( = ?auto_258257 ?auto_258258 ) ) ( not ( = ?auto_258257 ?auto_258259 ) ) ( not ( = ?auto_258257 ?auto_258260 ) ) ( not ( = ?auto_258258 ?auto_258259 ) ) ( not ( = ?auto_258258 ?auto_258260 ) ) ( not ( = ?auto_258259 ?auto_258260 ) ) ( ON ?auto_258258 ?auto_258259 ) ( CLEAR ?auto_258256 ) ( ON ?auto_258257 ?auto_258258 ) ( CLEAR ?auto_258257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_258252 ?auto_258253 ?auto_258254 ?auto_258255 ?auto_258256 ?auto_258257 )
      ( MAKE-8PILE ?auto_258252 ?auto_258253 ?auto_258254 ?auto_258255 ?auto_258256 ?auto_258257 ?auto_258258 ?auto_258259 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_258269 - BLOCK
      ?auto_258270 - BLOCK
      ?auto_258271 - BLOCK
      ?auto_258272 - BLOCK
      ?auto_258273 - BLOCK
      ?auto_258274 - BLOCK
      ?auto_258275 - BLOCK
      ?auto_258276 - BLOCK
    )
    :vars
    (
      ?auto_258277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258276 ?auto_258277 ) ( ON-TABLE ?auto_258269 ) ( ON ?auto_258270 ?auto_258269 ) ( ON ?auto_258271 ?auto_258270 ) ( ON ?auto_258272 ?auto_258271 ) ( ON ?auto_258273 ?auto_258272 ) ( not ( = ?auto_258269 ?auto_258270 ) ) ( not ( = ?auto_258269 ?auto_258271 ) ) ( not ( = ?auto_258269 ?auto_258272 ) ) ( not ( = ?auto_258269 ?auto_258273 ) ) ( not ( = ?auto_258269 ?auto_258274 ) ) ( not ( = ?auto_258269 ?auto_258275 ) ) ( not ( = ?auto_258269 ?auto_258276 ) ) ( not ( = ?auto_258269 ?auto_258277 ) ) ( not ( = ?auto_258270 ?auto_258271 ) ) ( not ( = ?auto_258270 ?auto_258272 ) ) ( not ( = ?auto_258270 ?auto_258273 ) ) ( not ( = ?auto_258270 ?auto_258274 ) ) ( not ( = ?auto_258270 ?auto_258275 ) ) ( not ( = ?auto_258270 ?auto_258276 ) ) ( not ( = ?auto_258270 ?auto_258277 ) ) ( not ( = ?auto_258271 ?auto_258272 ) ) ( not ( = ?auto_258271 ?auto_258273 ) ) ( not ( = ?auto_258271 ?auto_258274 ) ) ( not ( = ?auto_258271 ?auto_258275 ) ) ( not ( = ?auto_258271 ?auto_258276 ) ) ( not ( = ?auto_258271 ?auto_258277 ) ) ( not ( = ?auto_258272 ?auto_258273 ) ) ( not ( = ?auto_258272 ?auto_258274 ) ) ( not ( = ?auto_258272 ?auto_258275 ) ) ( not ( = ?auto_258272 ?auto_258276 ) ) ( not ( = ?auto_258272 ?auto_258277 ) ) ( not ( = ?auto_258273 ?auto_258274 ) ) ( not ( = ?auto_258273 ?auto_258275 ) ) ( not ( = ?auto_258273 ?auto_258276 ) ) ( not ( = ?auto_258273 ?auto_258277 ) ) ( not ( = ?auto_258274 ?auto_258275 ) ) ( not ( = ?auto_258274 ?auto_258276 ) ) ( not ( = ?auto_258274 ?auto_258277 ) ) ( not ( = ?auto_258275 ?auto_258276 ) ) ( not ( = ?auto_258275 ?auto_258277 ) ) ( not ( = ?auto_258276 ?auto_258277 ) ) ( ON ?auto_258275 ?auto_258276 ) ( CLEAR ?auto_258273 ) ( ON ?auto_258274 ?auto_258275 ) ( CLEAR ?auto_258274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_258269 ?auto_258270 ?auto_258271 ?auto_258272 ?auto_258273 ?auto_258274 )
      ( MAKE-8PILE ?auto_258269 ?auto_258270 ?auto_258271 ?auto_258272 ?auto_258273 ?auto_258274 ?auto_258275 ?auto_258276 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_258286 - BLOCK
      ?auto_258287 - BLOCK
      ?auto_258288 - BLOCK
      ?auto_258289 - BLOCK
      ?auto_258290 - BLOCK
      ?auto_258291 - BLOCK
      ?auto_258292 - BLOCK
      ?auto_258293 - BLOCK
    )
    :vars
    (
      ?auto_258294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258293 ?auto_258294 ) ( ON-TABLE ?auto_258286 ) ( ON ?auto_258287 ?auto_258286 ) ( ON ?auto_258288 ?auto_258287 ) ( ON ?auto_258289 ?auto_258288 ) ( not ( = ?auto_258286 ?auto_258287 ) ) ( not ( = ?auto_258286 ?auto_258288 ) ) ( not ( = ?auto_258286 ?auto_258289 ) ) ( not ( = ?auto_258286 ?auto_258290 ) ) ( not ( = ?auto_258286 ?auto_258291 ) ) ( not ( = ?auto_258286 ?auto_258292 ) ) ( not ( = ?auto_258286 ?auto_258293 ) ) ( not ( = ?auto_258286 ?auto_258294 ) ) ( not ( = ?auto_258287 ?auto_258288 ) ) ( not ( = ?auto_258287 ?auto_258289 ) ) ( not ( = ?auto_258287 ?auto_258290 ) ) ( not ( = ?auto_258287 ?auto_258291 ) ) ( not ( = ?auto_258287 ?auto_258292 ) ) ( not ( = ?auto_258287 ?auto_258293 ) ) ( not ( = ?auto_258287 ?auto_258294 ) ) ( not ( = ?auto_258288 ?auto_258289 ) ) ( not ( = ?auto_258288 ?auto_258290 ) ) ( not ( = ?auto_258288 ?auto_258291 ) ) ( not ( = ?auto_258288 ?auto_258292 ) ) ( not ( = ?auto_258288 ?auto_258293 ) ) ( not ( = ?auto_258288 ?auto_258294 ) ) ( not ( = ?auto_258289 ?auto_258290 ) ) ( not ( = ?auto_258289 ?auto_258291 ) ) ( not ( = ?auto_258289 ?auto_258292 ) ) ( not ( = ?auto_258289 ?auto_258293 ) ) ( not ( = ?auto_258289 ?auto_258294 ) ) ( not ( = ?auto_258290 ?auto_258291 ) ) ( not ( = ?auto_258290 ?auto_258292 ) ) ( not ( = ?auto_258290 ?auto_258293 ) ) ( not ( = ?auto_258290 ?auto_258294 ) ) ( not ( = ?auto_258291 ?auto_258292 ) ) ( not ( = ?auto_258291 ?auto_258293 ) ) ( not ( = ?auto_258291 ?auto_258294 ) ) ( not ( = ?auto_258292 ?auto_258293 ) ) ( not ( = ?auto_258292 ?auto_258294 ) ) ( not ( = ?auto_258293 ?auto_258294 ) ) ( ON ?auto_258292 ?auto_258293 ) ( ON ?auto_258291 ?auto_258292 ) ( CLEAR ?auto_258289 ) ( ON ?auto_258290 ?auto_258291 ) ( CLEAR ?auto_258290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_258286 ?auto_258287 ?auto_258288 ?auto_258289 ?auto_258290 )
      ( MAKE-8PILE ?auto_258286 ?auto_258287 ?auto_258288 ?auto_258289 ?auto_258290 ?auto_258291 ?auto_258292 ?auto_258293 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_258303 - BLOCK
      ?auto_258304 - BLOCK
      ?auto_258305 - BLOCK
      ?auto_258306 - BLOCK
      ?auto_258307 - BLOCK
      ?auto_258308 - BLOCK
      ?auto_258309 - BLOCK
      ?auto_258310 - BLOCK
    )
    :vars
    (
      ?auto_258311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258310 ?auto_258311 ) ( ON-TABLE ?auto_258303 ) ( ON ?auto_258304 ?auto_258303 ) ( ON ?auto_258305 ?auto_258304 ) ( ON ?auto_258306 ?auto_258305 ) ( not ( = ?auto_258303 ?auto_258304 ) ) ( not ( = ?auto_258303 ?auto_258305 ) ) ( not ( = ?auto_258303 ?auto_258306 ) ) ( not ( = ?auto_258303 ?auto_258307 ) ) ( not ( = ?auto_258303 ?auto_258308 ) ) ( not ( = ?auto_258303 ?auto_258309 ) ) ( not ( = ?auto_258303 ?auto_258310 ) ) ( not ( = ?auto_258303 ?auto_258311 ) ) ( not ( = ?auto_258304 ?auto_258305 ) ) ( not ( = ?auto_258304 ?auto_258306 ) ) ( not ( = ?auto_258304 ?auto_258307 ) ) ( not ( = ?auto_258304 ?auto_258308 ) ) ( not ( = ?auto_258304 ?auto_258309 ) ) ( not ( = ?auto_258304 ?auto_258310 ) ) ( not ( = ?auto_258304 ?auto_258311 ) ) ( not ( = ?auto_258305 ?auto_258306 ) ) ( not ( = ?auto_258305 ?auto_258307 ) ) ( not ( = ?auto_258305 ?auto_258308 ) ) ( not ( = ?auto_258305 ?auto_258309 ) ) ( not ( = ?auto_258305 ?auto_258310 ) ) ( not ( = ?auto_258305 ?auto_258311 ) ) ( not ( = ?auto_258306 ?auto_258307 ) ) ( not ( = ?auto_258306 ?auto_258308 ) ) ( not ( = ?auto_258306 ?auto_258309 ) ) ( not ( = ?auto_258306 ?auto_258310 ) ) ( not ( = ?auto_258306 ?auto_258311 ) ) ( not ( = ?auto_258307 ?auto_258308 ) ) ( not ( = ?auto_258307 ?auto_258309 ) ) ( not ( = ?auto_258307 ?auto_258310 ) ) ( not ( = ?auto_258307 ?auto_258311 ) ) ( not ( = ?auto_258308 ?auto_258309 ) ) ( not ( = ?auto_258308 ?auto_258310 ) ) ( not ( = ?auto_258308 ?auto_258311 ) ) ( not ( = ?auto_258309 ?auto_258310 ) ) ( not ( = ?auto_258309 ?auto_258311 ) ) ( not ( = ?auto_258310 ?auto_258311 ) ) ( ON ?auto_258309 ?auto_258310 ) ( ON ?auto_258308 ?auto_258309 ) ( CLEAR ?auto_258306 ) ( ON ?auto_258307 ?auto_258308 ) ( CLEAR ?auto_258307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_258303 ?auto_258304 ?auto_258305 ?auto_258306 ?auto_258307 )
      ( MAKE-8PILE ?auto_258303 ?auto_258304 ?auto_258305 ?auto_258306 ?auto_258307 ?auto_258308 ?auto_258309 ?auto_258310 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_258320 - BLOCK
      ?auto_258321 - BLOCK
      ?auto_258322 - BLOCK
      ?auto_258323 - BLOCK
      ?auto_258324 - BLOCK
      ?auto_258325 - BLOCK
      ?auto_258326 - BLOCK
      ?auto_258327 - BLOCK
    )
    :vars
    (
      ?auto_258328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258327 ?auto_258328 ) ( ON-TABLE ?auto_258320 ) ( ON ?auto_258321 ?auto_258320 ) ( ON ?auto_258322 ?auto_258321 ) ( not ( = ?auto_258320 ?auto_258321 ) ) ( not ( = ?auto_258320 ?auto_258322 ) ) ( not ( = ?auto_258320 ?auto_258323 ) ) ( not ( = ?auto_258320 ?auto_258324 ) ) ( not ( = ?auto_258320 ?auto_258325 ) ) ( not ( = ?auto_258320 ?auto_258326 ) ) ( not ( = ?auto_258320 ?auto_258327 ) ) ( not ( = ?auto_258320 ?auto_258328 ) ) ( not ( = ?auto_258321 ?auto_258322 ) ) ( not ( = ?auto_258321 ?auto_258323 ) ) ( not ( = ?auto_258321 ?auto_258324 ) ) ( not ( = ?auto_258321 ?auto_258325 ) ) ( not ( = ?auto_258321 ?auto_258326 ) ) ( not ( = ?auto_258321 ?auto_258327 ) ) ( not ( = ?auto_258321 ?auto_258328 ) ) ( not ( = ?auto_258322 ?auto_258323 ) ) ( not ( = ?auto_258322 ?auto_258324 ) ) ( not ( = ?auto_258322 ?auto_258325 ) ) ( not ( = ?auto_258322 ?auto_258326 ) ) ( not ( = ?auto_258322 ?auto_258327 ) ) ( not ( = ?auto_258322 ?auto_258328 ) ) ( not ( = ?auto_258323 ?auto_258324 ) ) ( not ( = ?auto_258323 ?auto_258325 ) ) ( not ( = ?auto_258323 ?auto_258326 ) ) ( not ( = ?auto_258323 ?auto_258327 ) ) ( not ( = ?auto_258323 ?auto_258328 ) ) ( not ( = ?auto_258324 ?auto_258325 ) ) ( not ( = ?auto_258324 ?auto_258326 ) ) ( not ( = ?auto_258324 ?auto_258327 ) ) ( not ( = ?auto_258324 ?auto_258328 ) ) ( not ( = ?auto_258325 ?auto_258326 ) ) ( not ( = ?auto_258325 ?auto_258327 ) ) ( not ( = ?auto_258325 ?auto_258328 ) ) ( not ( = ?auto_258326 ?auto_258327 ) ) ( not ( = ?auto_258326 ?auto_258328 ) ) ( not ( = ?auto_258327 ?auto_258328 ) ) ( ON ?auto_258326 ?auto_258327 ) ( ON ?auto_258325 ?auto_258326 ) ( ON ?auto_258324 ?auto_258325 ) ( CLEAR ?auto_258322 ) ( ON ?auto_258323 ?auto_258324 ) ( CLEAR ?auto_258323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_258320 ?auto_258321 ?auto_258322 ?auto_258323 )
      ( MAKE-8PILE ?auto_258320 ?auto_258321 ?auto_258322 ?auto_258323 ?auto_258324 ?auto_258325 ?auto_258326 ?auto_258327 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_258337 - BLOCK
      ?auto_258338 - BLOCK
      ?auto_258339 - BLOCK
      ?auto_258340 - BLOCK
      ?auto_258341 - BLOCK
      ?auto_258342 - BLOCK
      ?auto_258343 - BLOCK
      ?auto_258344 - BLOCK
    )
    :vars
    (
      ?auto_258345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258344 ?auto_258345 ) ( ON-TABLE ?auto_258337 ) ( ON ?auto_258338 ?auto_258337 ) ( ON ?auto_258339 ?auto_258338 ) ( not ( = ?auto_258337 ?auto_258338 ) ) ( not ( = ?auto_258337 ?auto_258339 ) ) ( not ( = ?auto_258337 ?auto_258340 ) ) ( not ( = ?auto_258337 ?auto_258341 ) ) ( not ( = ?auto_258337 ?auto_258342 ) ) ( not ( = ?auto_258337 ?auto_258343 ) ) ( not ( = ?auto_258337 ?auto_258344 ) ) ( not ( = ?auto_258337 ?auto_258345 ) ) ( not ( = ?auto_258338 ?auto_258339 ) ) ( not ( = ?auto_258338 ?auto_258340 ) ) ( not ( = ?auto_258338 ?auto_258341 ) ) ( not ( = ?auto_258338 ?auto_258342 ) ) ( not ( = ?auto_258338 ?auto_258343 ) ) ( not ( = ?auto_258338 ?auto_258344 ) ) ( not ( = ?auto_258338 ?auto_258345 ) ) ( not ( = ?auto_258339 ?auto_258340 ) ) ( not ( = ?auto_258339 ?auto_258341 ) ) ( not ( = ?auto_258339 ?auto_258342 ) ) ( not ( = ?auto_258339 ?auto_258343 ) ) ( not ( = ?auto_258339 ?auto_258344 ) ) ( not ( = ?auto_258339 ?auto_258345 ) ) ( not ( = ?auto_258340 ?auto_258341 ) ) ( not ( = ?auto_258340 ?auto_258342 ) ) ( not ( = ?auto_258340 ?auto_258343 ) ) ( not ( = ?auto_258340 ?auto_258344 ) ) ( not ( = ?auto_258340 ?auto_258345 ) ) ( not ( = ?auto_258341 ?auto_258342 ) ) ( not ( = ?auto_258341 ?auto_258343 ) ) ( not ( = ?auto_258341 ?auto_258344 ) ) ( not ( = ?auto_258341 ?auto_258345 ) ) ( not ( = ?auto_258342 ?auto_258343 ) ) ( not ( = ?auto_258342 ?auto_258344 ) ) ( not ( = ?auto_258342 ?auto_258345 ) ) ( not ( = ?auto_258343 ?auto_258344 ) ) ( not ( = ?auto_258343 ?auto_258345 ) ) ( not ( = ?auto_258344 ?auto_258345 ) ) ( ON ?auto_258343 ?auto_258344 ) ( ON ?auto_258342 ?auto_258343 ) ( ON ?auto_258341 ?auto_258342 ) ( CLEAR ?auto_258339 ) ( ON ?auto_258340 ?auto_258341 ) ( CLEAR ?auto_258340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_258337 ?auto_258338 ?auto_258339 ?auto_258340 )
      ( MAKE-8PILE ?auto_258337 ?auto_258338 ?auto_258339 ?auto_258340 ?auto_258341 ?auto_258342 ?auto_258343 ?auto_258344 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_258354 - BLOCK
      ?auto_258355 - BLOCK
      ?auto_258356 - BLOCK
      ?auto_258357 - BLOCK
      ?auto_258358 - BLOCK
      ?auto_258359 - BLOCK
      ?auto_258360 - BLOCK
      ?auto_258361 - BLOCK
    )
    :vars
    (
      ?auto_258362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258361 ?auto_258362 ) ( ON-TABLE ?auto_258354 ) ( ON ?auto_258355 ?auto_258354 ) ( not ( = ?auto_258354 ?auto_258355 ) ) ( not ( = ?auto_258354 ?auto_258356 ) ) ( not ( = ?auto_258354 ?auto_258357 ) ) ( not ( = ?auto_258354 ?auto_258358 ) ) ( not ( = ?auto_258354 ?auto_258359 ) ) ( not ( = ?auto_258354 ?auto_258360 ) ) ( not ( = ?auto_258354 ?auto_258361 ) ) ( not ( = ?auto_258354 ?auto_258362 ) ) ( not ( = ?auto_258355 ?auto_258356 ) ) ( not ( = ?auto_258355 ?auto_258357 ) ) ( not ( = ?auto_258355 ?auto_258358 ) ) ( not ( = ?auto_258355 ?auto_258359 ) ) ( not ( = ?auto_258355 ?auto_258360 ) ) ( not ( = ?auto_258355 ?auto_258361 ) ) ( not ( = ?auto_258355 ?auto_258362 ) ) ( not ( = ?auto_258356 ?auto_258357 ) ) ( not ( = ?auto_258356 ?auto_258358 ) ) ( not ( = ?auto_258356 ?auto_258359 ) ) ( not ( = ?auto_258356 ?auto_258360 ) ) ( not ( = ?auto_258356 ?auto_258361 ) ) ( not ( = ?auto_258356 ?auto_258362 ) ) ( not ( = ?auto_258357 ?auto_258358 ) ) ( not ( = ?auto_258357 ?auto_258359 ) ) ( not ( = ?auto_258357 ?auto_258360 ) ) ( not ( = ?auto_258357 ?auto_258361 ) ) ( not ( = ?auto_258357 ?auto_258362 ) ) ( not ( = ?auto_258358 ?auto_258359 ) ) ( not ( = ?auto_258358 ?auto_258360 ) ) ( not ( = ?auto_258358 ?auto_258361 ) ) ( not ( = ?auto_258358 ?auto_258362 ) ) ( not ( = ?auto_258359 ?auto_258360 ) ) ( not ( = ?auto_258359 ?auto_258361 ) ) ( not ( = ?auto_258359 ?auto_258362 ) ) ( not ( = ?auto_258360 ?auto_258361 ) ) ( not ( = ?auto_258360 ?auto_258362 ) ) ( not ( = ?auto_258361 ?auto_258362 ) ) ( ON ?auto_258360 ?auto_258361 ) ( ON ?auto_258359 ?auto_258360 ) ( ON ?auto_258358 ?auto_258359 ) ( ON ?auto_258357 ?auto_258358 ) ( CLEAR ?auto_258355 ) ( ON ?auto_258356 ?auto_258357 ) ( CLEAR ?auto_258356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_258354 ?auto_258355 ?auto_258356 )
      ( MAKE-8PILE ?auto_258354 ?auto_258355 ?auto_258356 ?auto_258357 ?auto_258358 ?auto_258359 ?auto_258360 ?auto_258361 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_258371 - BLOCK
      ?auto_258372 - BLOCK
      ?auto_258373 - BLOCK
      ?auto_258374 - BLOCK
      ?auto_258375 - BLOCK
      ?auto_258376 - BLOCK
      ?auto_258377 - BLOCK
      ?auto_258378 - BLOCK
    )
    :vars
    (
      ?auto_258379 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258378 ?auto_258379 ) ( ON-TABLE ?auto_258371 ) ( ON ?auto_258372 ?auto_258371 ) ( not ( = ?auto_258371 ?auto_258372 ) ) ( not ( = ?auto_258371 ?auto_258373 ) ) ( not ( = ?auto_258371 ?auto_258374 ) ) ( not ( = ?auto_258371 ?auto_258375 ) ) ( not ( = ?auto_258371 ?auto_258376 ) ) ( not ( = ?auto_258371 ?auto_258377 ) ) ( not ( = ?auto_258371 ?auto_258378 ) ) ( not ( = ?auto_258371 ?auto_258379 ) ) ( not ( = ?auto_258372 ?auto_258373 ) ) ( not ( = ?auto_258372 ?auto_258374 ) ) ( not ( = ?auto_258372 ?auto_258375 ) ) ( not ( = ?auto_258372 ?auto_258376 ) ) ( not ( = ?auto_258372 ?auto_258377 ) ) ( not ( = ?auto_258372 ?auto_258378 ) ) ( not ( = ?auto_258372 ?auto_258379 ) ) ( not ( = ?auto_258373 ?auto_258374 ) ) ( not ( = ?auto_258373 ?auto_258375 ) ) ( not ( = ?auto_258373 ?auto_258376 ) ) ( not ( = ?auto_258373 ?auto_258377 ) ) ( not ( = ?auto_258373 ?auto_258378 ) ) ( not ( = ?auto_258373 ?auto_258379 ) ) ( not ( = ?auto_258374 ?auto_258375 ) ) ( not ( = ?auto_258374 ?auto_258376 ) ) ( not ( = ?auto_258374 ?auto_258377 ) ) ( not ( = ?auto_258374 ?auto_258378 ) ) ( not ( = ?auto_258374 ?auto_258379 ) ) ( not ( = ?auto_258375 ?auto_258376 ) ) ( not ( = ?auto_258375 ?auto_258377 ) ) ( not ( = ?auto_258375 ?auto_258378 ) ) ( not ( = ?auto_258375 ?auto_258379 ) ) ( not ( = ?auto_258376 ?auto_258377 ) ) ( not ( = ?auto_258376 ?auto_258378 ) ) ( not ( = ?auto_258376 ?auto_258379 ) ) ( not ( = ?auto_258377 ?auto_258378 ) ) ( not ( = ?auto_258377 ?auto_258379 ) ) ( not ( = ?auto_258378 ?auto_258379 ) ) ( ON ?auto_258377 ?auto_258378 ) ( ON ?auto_258376 ?auto_258377 ) ( ON ?auto_258375 ?auto_258376 ) ( ON ?auto_258374 ?auto_258375 ) ( CLEAR ?auto_258372 ) ( ON ?auto_258373 ?auto_258374 ) ( CLEAR ?auto_258373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_258371 ?auto_258372 ?auto_258373 )
      ( MAKE-8PILE ?auto_258371 ?auto_258372 ?auto_258373 ?auto_258374 ?auto_258375 ?auto_258376 ?auto_258377 ?auto_258378 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_258388 - BLOCK
      ?auto_258389 - BLOCK
      ?auto_258390 - BLOCK
      ?auto_258391 - BLOCK
      ?auto_258392 - BLOCK
      ?auto_258393 - BLOCK
      ?auto_258394 - BLOCK
      ?auto_258395 - BLOCK
    )
    :vars
    (
      ?auto_258396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258395 ?auto_258396 ) ( ON-TABLE ?auto_258388 ) ( not ( = ?auto_258388 ?auto_258389 ) ) ( not ( = ?auto_258388 ?auto_258390 ) ) ( not ( = ?auto_258388 ?auto_258391 ) ) ( not ( = ?auto_258388 ?auto_258392 ) ) ( not ( = ?auto_258388 ?auto_258393 ) ) ( not ( = ?auto_258388 ?auto_258394 ) ) ( not ( = ?auto_258388 ?auto_258395 ) ) ( not ( = ?auto_258388 ?auto_258396 ) ) ( not ( = ?auto_258389 ?auto_258390 ) ) ( not ( = ?auto_258389 ?auto_258391 ) ) ( not ( = ?auto_258389 ?auto_258392 ) ) ( not ( = ?auto_258389 ?auto_258393 ) ) ( not ( = ?auto_258389 ?auto_258394 ) ) ( not ( = ?auto_258389 ?auto_258395 ) ) ( not ( = ?auto_258389 ?auto_258396 ) ) ( not ( = ?auto_258390 ?auto_258391 ) ) ( not ( = ?auto_258390 ?auto_258392 ) ) ( not ( = ?auto_258390 ?auto_258393 ) ) ( not ( = ?auto_258390 ?auto_258394 ) ) ( not ( = ?auto_258390 ?auto_258395 ) ) ( not ( = ?auto_258390 ?auto_258396 ) ) ( not ( = ?auto_258391 ?auto_258392 ) ) ( not ( = ?auto_258391 ?auto_258393 ) ) ( not ( = ?auto_258391 ?auto_258394 ) ) ( not ( = ?auto_258391 ?auto_258395 ) ) ( not ( = ?auto_258391 ?auto_258396 ) ) ( not ( = ?auto_258392 ?auto_258393 ) ) ( not ( = ?auto_258392 ?auto_258394 ) ) ( not ( = ?auto_258392 ?auto_258395 ) ) ( not ( = ?auto_258392 ?auto_258396 ) ) ( not ( = ?auto_258393 ?auto_258394 ) ) ( not ( = ?auto_258393 ?auto_258395 ) ) ( not ( = ?auto_258393 ?auto_258396 ) ) ( not ( = ?auto_258394 ?auto_258395 ) ) ( not ( = ?auto_258394 ?auto_258396 ) ) ( not ( = ?auto_258395 ?auto_258396 ) ) ( ON ?auto_258394 ?auto_258395 ) ( ON ?auto_258393 ?auto_258394 ) ( ON ?auto_258392 ?auto_258393 ) ( ON ?auto_258391 ?auto_258392 ) ( ON ?auto_258390 ?auto_258391 ) ( CLEAR ?auto_258388 ) ( ON ?auto_258389 ?auto_258390 ) ( CLEAR ?auto_258389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_258388 ?auto_258389 )
      ( MAKE-8PILE ?auto_258388 ?auto_258389 ?auto_258390 ?auto_258391 ?auto_258392 ?auto_258393 ?auto_258394 ?auto_258395 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_258405 - BLOCK
      ?auto_258406 - BLOCK
      ?auto_258407 - BLOCK
      ?auto_258408 - BLOCK
      ?auto_258409 - BLOCK
      ?auto_258410 - BLOCK
      ?auto_258411 - BLOCK
      ?auto_258412 - BLOCK
    )
    :vars
    (
      ?auto_258413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258412 ?auto_258413 ) ( ON-TABLE ?auto_258405 ) ( not ( = ?auto_258405 ?auto_258406 ) ) ( not ( = ?auto_258405 ?auto_258407 ) ) ( not ( = ?auto_258405 ?auto_258408 ) ) ( not ( = ?auto_258405 ?auto_258409 ) ) ( not ( = ?auto_258405 ?auto_258410 ) ) ( not ( = ?auto_258405 ?auto_258411 ) ) ( not ( = ?auto_258405 ?auto_258412 ) ) ( not ( = ?auto_258405 ?auto_258413 ) ) ( not ( = ?auto_258406 ?auto_258407 ) ) ( not ( = ?auto_258406 ?auto_258408 ) ) ( not ( = ?auto_258406 ?auto_258409 ) ) ( not ( = ?auto_258406 ?auto_258410 ) ) ( not ( = ?auto_258406 ?auto_258411 ) ) ( not ( = ?auto_258406 ?auto_258412 ) ) ( not ( = ?auto_258406 ?auto_258413 ) ) ( not ( = ?auto_258407 ?auto_258408 ) ) ( not ( = ?auto_258407 ?auto_258409 ) ) ( not ( = ?auto_258407 ?auto_258410 ) ) ( not ( = ?auto_258407 ?auto_258411 ) ) ( not ( = ?auto_258407 ?auto_258412 ) ) ( not ( = ?auto_258407 ?auto_258413 ) ) ( not ( = ?auto_258408 ?auto_258409 ) ) ( not ( = ?auto_258408 ?auto_258410 ) ) ( not ( = ?auto_258408 ?auto_258411 ) ) ( not ( = ?auto_258408 ?auto_258412 ) ) ( not ( = ?auto_258408 ?auto_258413 ) ) ( not ( = ?auto_258409 ?auto_258410 ) ) ( not ( = ?auto_258409 ?auto_258411 ) ) ( not ( = ?auto_258409 ?auto_258412 ) ) ( not ( = ?auto_258409 ?auto_258413 ) ) ( not ( = ?auto_258410 ?auto_258411 ) ) ( not ( = ?auto_258410 ?auto_258412 ) ) ( not ( = ?auto_258410 ?auto_258413 ) ) ( not ( = ?auto_258411 ?auto_258412 ) ) ( not ( = ?auto_258411 ?auto_258413 ) ) ( not ( = ?auto_258412 ?auto_258413 ) ) ( ON ?auto_258411 ?auto_258412 ) ( ON ?auto_258410 ?auto_258411 ) ( ON ?auto_258409 ?auto_258410 ) ( ON ?auto_258408 ?auto_258409 ) ( ON ?auto_258407 ?auto_258408 ) ( CLEAR ?auto_258405 ) ( ON ?auto_258406 ?auto_258407 ) ( CLEAR ?auto_258406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_258405 ?auto_258406 )
      ( MAKE-8PILE ?auto_258405 ?auto_258406 ?auto_258407 ?auto_258408 ?auto_258409 ?auto_258410 ?auto_258411 ?auto_258412 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_258422 - BLOCK
      ?auto_258423 - BLOCK
      ?auto_258424 - BLOCK
      ?auto_258425 - BLOCK
      ?auto_258426 - BLOCK
      ?auto_258427 - BLOCK
      ?auto_258428 - BLOCK
      ?auto_258429 - BLOCK
    )
    :vars
    (
      ?auto_258430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258429 ?auto_258430 ) ( not ( = ?auto_258422 ?auto_258423 ) ) ( not ( = ?auto_258422 ?auto_258424 ) ) ( not ( = ?auto_258422 ?auto_258425 ) ) ( not ( = ?auto_258422 ?auto_258426 ) ) ( not ( = ?auto_258422 ?auto_258427 ) ) ( not ( = ?auto_258422 ?auto_258428 ) ) ( not ( = ?auto_258422 ?auto_258429 ) ) ( not ( = ?auto_258422 ?auto_258430 ) ) ( not ( = ?auto_258423 ?auto_258424 ) ) ( not ( = ?auto_258423 ?auto_258425 ) ) ( not ( = ?auto_258423 ?auto_258426 ) ) ( not ( = ?auto_258423 ?auto_258427 ) ) ( not ( = ?auto_258423 ?auto_258428 ) ) ( not ( = ?auto_258423 ?auto_258429 ) ) ( not ( = ?auto_258423 ?auto_258430 ) ) ( not ( = ?auto_258424 ?auto_258425 ) ) ( not ( = ?auto_258424 ?auto_258426 ) ) ( not ( = ?auto_258424 ?auto_258427 ) ) ( not ( = ?auto_258424 ?auto_258428 ) ) ( not ( = ?auto_258424 ?auto_258429 ) ) ( not ( = ?auto_258424 ?auto_258430 ) ) ( not ( = ?auto_258425 ?auto_258426 ) ) ( not ( = ?auto_258425 ?auto_258427 ) ) ( not ( = ?auto_258425 ?auto_258428 ) ) ( not ( = ?auto_258425 ?auto_258429 ) ) ( not ( = ?auto_258425 ?auto_258430 ) ) ( not ( = ?auto_258426 ?auto_258427 ) ) ( not ( = ?auto_258426 ?auto_258428 ) ) ( not ( = ?auto_258426 ?auto_258429 ) ) ( not ( = ?auto_258426 ?auto_258430 ) ) ( not ( = ?auto_258427 ?auto_258428 ) ) ( not ( = ?auto_258427 ?auto_258429 ) ) ( not ( = ?auto_258427 ?auto_258430 ) ) ( not ( = ?auto_258428 ?auto_258429 ) ) ( not ( = ?auto_258428 ?auto_258430 ) ) ( not ( = ?auto_258429 ?auto_258430 ) ) ( ON ?auto_258428 ?auto_258429 ) ( ON ?auto_258427 ?auto_258428 ) ( ON ?auto_258426 ?auto_258427 ) ( ON ?auto_258425 ?auto_258426 ) ( ON ?auto_258424 ?auto_258425 ) ( ON ?auto_258423 ?auto_258424 ) ( ON ?auto_258422 ?auto_258423 ) ( CLEAR ?auto_258422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_258422 )
      ( MAKE-8PILE ?auto_258422 ?auto_258423 ?auto_258424 ?auto_258425 ?auto_258426 ?auto_258427 ?auto_258428 ?auto_258429 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_258439 - BLOCK
      ?auto_258440 - BLOCK
      ?auto_258441 - BLOCK
      ?auto_258442 - BLOCK
      ?auto_258443 - BLOCK
      ?auto_258444 - BLOCK
      ?auto_258445 - BLOCK
      ?auto_258446 - BLOCK
    )
    :vars
    (
      ?auto_258447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258446 ?auto_258447 ) ( not ( = ?auto_258439 ?auto_258440 ) ) ( not ( = ?auto_258439 ?auto_258441 ) ) ( not ( = ?auto_258439 ?auto_258442 ) ) ( not ( = ?auto_258439 ?auto_258443 ) ) ( not ( = ?auto_258439 ?auto_258444 ) ) ( not ( = ?auto_258439 ?auto_258445 ) ) ( not ( = ?auto_258439 ?auto_258446 ) ) ( not ( = ?auto_258439 ?auto_258447 ) ) ( not ( = ?auto_258440 ?auto_258441 ) ) ( not ( = ?auto_258440 ?auto_258442 ) ) ( not ( = ?auto_258440 ?auto_258443 ) ) ( not ( = ?auto_258440 ?auto_258444 ) ) ( not ( = ?auto_258440 ?auto_258445 ) ) ( not ( = ?auto_258440 ?auto_258446 ) ) ( not ( = ?auto_258440 ?auto_258447 ) ) ( not ( = ?auto_258441 ?auto_258442 ) ) ( not ( = ?auto_258441 ?auto_258443 ) ) ( not ( = ?auto_258441 ?auto_258444 ) ) ( not ( = ?auto_258441 ?auto_258445 ) ) ( not ( = ?auto_258441 ?auto_258446 ) ) ( not ( = ?auto_258441 ?auto_258447 ) ) ( not ( = ?auto_258442 ?auto_258443 ) ) ( not ( = ?auto_258442 ?auto_258444 ) ) ( not ( = ?auto_258442 ?auto_258445 ) ) ( not ( = ?auto_258442 ?auto_258446 ) ) ( not ( = ?auto_258442 ?auto_258447 ) ) ( not ( = ?auto_258443 ?auto_258444 ) ) ( not ( = ?auto_258443 ?auto_258445 ) ) ( not ( = ?auto_258443 ?auto_258446 ) ) ( not ( = ?auto_258443 ?auto_258447 ) ) ( not ( = ?auto_258444 ?auto_258445 ) ) ( not ( = ?auto_258444 ?auto_258446 ) ) ( not ( = ?auto_258444 ?auto_258447 ) ) ( not ( = ?auto_258445 ?auto_258446 ) ) ( not ( = ?auto_258445 ?auto_258447 ) ) ( not ( = ?auto_258446 ?auto_258447 ) ) ( ON ?auto_258445 ?auto_258446 ) ( ON ?auto_258444 ?auto_258445 ) ( ON ?auto_258443 ?auto_258444 ) ( ON ?auto_258442 ?auto_258443 ) ( ON ?auto_258441 ?auto_258442 ) ( ON ?auto_258440 ?auto_258441 ) ( ON ?auto_258439 ?auto_258440 ) ( CLEAR ?auto_258439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_258439 )
      ( MAKE-8PILE ?auto_258439 ?auto_258440 ?auto_258441 ?auto_258442 ?auto_258443 ?auto_258444 ?auto_258445 ?auto_258446 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258457 - BLOCK
      ?auto_258458 - BLOCK
      ?auto_258459 - BLOCK
      ?auto_258460 - BLOCK
      ?auto_258461 - BLOCK
      ?auto_258462 - BLOCK
      ?auto_258463 - BLOCK
      ?auto_258464 - BLOCK
      ?auto_258465 - BLOCK
    )
    :vars
    (
      ?auto_258466 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_258464 ) ( ON ?auto_258465 ?auto_258466 ) ( CLEAR ?auto_258465 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_258457 ) ( ON ?auto_258458 ?auto_258457 ) ( ON ?auto_258459 ?auto_258458 ) ( ON ?auto_258460 ?auto_258459 ) ( ON ?auto_258461 ?auto_258460 ) ( ON ?auto_258462 ?auto_258461 ) ( ON ?auto_258463 ?auto_258462 ) ( ON ?auto_258464 ?auto_258463 ) ( not ( = ?auto_258457 ?auto_258458 ) ) ( not ( = ?auto_258457 ?auto_258459 ) ) ( not ( = ?auto_258457 ?auto_258460 ) ) ( not ( = ?auto_258457 ?auto_258461 ) ) ( not ( = ?auto_258457 ?auto_258462 ) ) ( not ( = ?auto_258457 ?auto_258463 ) ) ( not ( = ?auto_258457 ?auto_258464 ) ) ( not ( = ?auto_258457 ?auto_258465 ) ) ( not ( = ?auto_258457 ?auto_258466 ) ) ( not ( = ?auto_258458 ?auto_258459 ) ) ( not ( = ?auto_258458 ?auto_258460 ) ) ( not ( = ?auto_258458 ?auto_258461 ) ) ( not ( = ?auto_258458 ?auto_258462 ) ) ( not ( = ?auto_258458 ?auto_258463 ) ) ( not ( = ?auto_258458 ?auto_258464 ) ) ( not ( = ?auto_258458 ?auto_258465 ) ) ( not ( = ?auto_258458 ?auto_258466 ) ) ( not ( = ?auto_258459 ?auto_258460 ) ) ( not ( = ?auto_258459 ?auto_258461 ) ) ( not ( = ?auto_258459 ?auto_258462 ) ) ( not ( = ?auto_258459 ?auto_258463 ) ) ( not ( = ?auto_258459 ?auto_258464 ) ) ( not ( = ?auto_258459 ?auto_258465 ) ) ( not ( = ?auto_258459 ?auto_258466 ) ) ( not ( = ?auto_258460 ?auto_258461 ) ) ( not ( = ?auto_258460 ?auto_258462 ) ) ( not ( = ?auto_258460 ?auto_258463 ) ) ( not ( = ?auto_258460 ?auto_258464 ) ) ( not ( = ?auto_258460 ?auto_258465 ) ) ( not ( = ?auto_258460 ?auto_258466 ) ) ( not ( = ?auto_258461 ?auto_258462 ) ) ( not ( = ?auto_258461 ?auto_258463 ) ) ( not ( = ?auto_258461 ?auto_258464 ) ) ( not ( = ?auto_258461 ?auto_258465 ) ) ( not ( = ?auto_258461 ?auto_258466 ) ) ( not ( = ?auto_258462 ?auto_258463 ) ) ( not ( = ?auto_258462 ?auto_258464 ) ) ( not ( = ?auto_258462 ?auto_258465 ) ) ( not ( = ?auto_258462 ?auto_258466 ) ) ( not ( = ?auto_258463 ?auto_258464 ) ) ( not ( = ?auto_258463 ?auto_258465 ) ) ( not ( = ?auto_258463 ?auto_258466 ) ) ( not ( = ?auto_258464 ?auto_258465 ) ) ( not ( = ?auto_258464 ?auto_258466 ) ) ( not ( = ?auto_258465 ?auto_258466 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_258465 ?auto_258466 )
      ( !STACK ?auto_258465 ?auto_258464 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258476 - BLOCK
      ?auto_258477 - BLOCK
      ?auto_258478 - BLOCK
      ?auto_258479 - BLOCK
      ?auto_258480 - BLOCK
      ?auto_258481 - BLOCK
      ?auto_258482 - BLOCK
      ?auto_258483 - BLOCK
      ?auto_258484 - BLOCK
    )
    :vars
    (
      ?auto_258485 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_258483 ) ( ON ?auto_258484 ?auto_258485 ) ( CLEAR ?auto_258484 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_258476 ) ( ON ?auto_258477 ?auto_258476 ) ( ON ?auto_258478 ?auto_258477 ) ( ON ?auto_258479 ?auto_258478 ) ( ON ?auto_258480 ?auto_258479 ) ( ON ?auto_258481 ?auto_258480 ) ( ON ?auto_258482 ?auto_258481 ) ( ON ?auto_258483 ?auto_258482 ) ( not ( = ?auto_258476 ?auto_258477 ) ) ( not ( = ?auto_258476 ?auto_258478 ) ) ( not ( = ?auto_258476 ?auto_258479 ) ) ( not ( = ?auto_258476 ?auto_258480 ) ) ( not ( = ?auto_258476 ?auto_258481 ) ) ( not ( = ?auto_258476 ?auto_258482 ) ) ( not ( = ?auto_258476 ?auto_258483 ) ) ( not ( = ?auto_258476 ?auto_258484 ) ) ( not ( = ?auto_258476 ?auto_258485 ) ) ( not ( = ?auto_258477 ?auto_258478 ) ) ( not ( = ?auto_258477 ?auto_258479 ) ) ( not ( = ?auto_258477 ?auto_258480 ) ) ( not ( = ?auto_258477 ?auto_258481 ) ) ( not ( = ?auto_258477 ?auto_258482 ) ) ( not ( = ?auto_258477 ?auto_258483 ) ) ( not ( = ?auto_258477 ?auto_258484 ) ) ( not ( = ?auto_258477 ?auto_258485 ) ) ( not ( = ?auto_258478 ?auto_258479 ) ) ( not ( = ?auto_258478 ?auto_258480 ) ) ( not ( = ?auto_258478 ?auto_258481 ) ) ( not ( = ?auto_258478 ?auto_258482 ) ) ( not ( = ?auto_258478 ?auto_258483 ) ) ( not ( = ?auto_258478 ?auto_258484 ) ) ( not ( = ?auto_258478 ?auto_258485 ) ) ( not ( = ?auto_258479 ?auto_258480 ) ) ( not ( = ?auto_258479 ?auto_258481 ) ) ( not ( = ?auto_258479 ?auto_258482 ) ) ( not ( = ?auto_258479 ?auto_258483 ) ) ( not ( = ?auto_258479 ?auto_258484 ) ) ( not ( = ?auto_258479 ?auto_258485 ) ) ( not ( = ?auto_258480 ?auto_258481 ) ) ( not ( = ?auto_258480 ?auto_258482 ) ) ( not ( = ?auto_258480 ?auto_258483 ) ) ( not ( = ?auto_258480 ?auto_258484 ) ) ( not ( = ?auto_258480 ?auto_258485 ) ) ( not ( = ?auto_258481 ?auto_258482 ) ) ( not ( = ?auto_258481 ?auto_258483 ) ) ( not ( = ?auto_258481 ?auto_258484 ) ) ( not ( = ?auto_258481 ?auto_258485 ) ) ( not ( = ?auto_258482 ?auto_258483 ) ) ( not ( = ?auto_258482 ?auto_258484 ) ) ( not ( = ?auto_258482 ?auto_258485 ) ) ( not ( = ?auto_258483 ?auto_258484 ) ) ( not ( = ?auto_258483 ?auto_258485 ) ) ( not ( = ?auto_258484 ?auto_258485 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_258484 ?auto_258485 )
      ( !STACK ?auto_258484 ?auto_258483 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258495 - BLOCK
      ?auto_258496 - BLOCK
      ?auto_258497 - BLOCK
      ?auto_258498 - BLOCK
      ?auto_258499 - BLOCK
      ?auto_258500 - BLOCK
      ?auto_258501 - BLOCK
      ?auto_258502 - BLOCK
      ?auto_258503 - BLOCK
    )
    :vars
    (
      ?auto_258504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258503 ?auto_258504 ) ( ON-TABLE ?auto_258495 ) ( ON ?auto_258496 ?auto_258495 ) ( ON ?auto_258497 ?auto_258496 ) ( ON ?auto_258498 ?auto_258497 ) ( ON ?auto_258499 ?auto_258498 ) ( ON ?auto_258500 ?auto_258499 ) ( ON ?auto_258501 ?auto_258500 ) ( not ( = ?auto_258495 ?auto_258496 ) ) ( not ( = ?auto_258495 ?auto_258497 ) ) ( not ( = ?auto_258495 ?auto_258498 ) ) ( not ( = ?auto_258495 ?auto_258499 ) ) ( not ( = ?auto_258495 ?auto_258500 ) ) ( not ( = ?auto_258495 ?auto_258501 ) ) ( not ( = ?auto_258495 ?auto_258502 ) ) ( not ( = ?auto_258495 ?auto_258503 ) ) ( not ( = ?auto_258495 ?auto_258504 ) ) ( not ( = ?auto_258496 ?auto_258497 ) ) ( not ( = ?auto_258496 ?auto_258498 ) ) ( not ( = ?auto_258496 ?auto_258499 ) ) ( not ( = ?auto_258496 ?auto_258500 ) ) ( not ( = ?auto_258496 ?auto_258501 ) ) ( not ( = ?auto_258496 ?auto_258502 ) ) ( not ( = ?auto_258496 ?auto_258503 ) ) ( not ( = ?auto_258496 ?auto_258504 ) ) ( not ( = ?auto_258497 ?auto_258498 ) ) ( not ( = ?auto_258497 ?auto_258499 ) ) ( not ( = ?auto_258497 ?auto_258500 ) ) ( not ( = ?auto_258497 ?auto_258501 ) ) ( not ( = ?auto_258497 ?auto_258502 ) ) ( not ( = ?auto_258497 ?auto_258503 ) ) ( not ( = ?auto_258497 ?auto_258504 ) ) ( not ( = ?auto_258498 ?auto_258499 ) ) ( not ( = ?auto_258498 ?auto_258500 ) ) ( not ( = ?auto_258498 ?auto_258501 ) ) ( not ( = ?auto_258498 ?auto_258502 ) ) ( not ( = ?auto_258498 ?auto_258503 ) ) ( not ( = ?auto_258498 ?auto_258504 ) ) ( not ( = ?auto_258499 ?auto_258500 ) ) ( not ( = ?auto_258499 ?auto_258501 ) ) ( not ( = ?auto_258499 ?auto_258502 ) ) ( not ( = ?auto_258499 ?auto_258503 ) ) ( not ( = ?auto_258499 ?auto_258504 ) ) ( not ( = ?auto_258500 ?auto_258501 ) ) ( not ( = ?auto_258500 ?auto_258502 ) ) ( not ( = ?auto_258500 ?auto_258503 ) ) ( not ( = ?auto_258500 ?auto_258504 ) ) ( not ( = ?auto_258501 ?auto_258502 ) ) ( not ( = ?auto_258501 ?auto_258503 ) ) ( not ( = ?auto_258501 ?auto_258504 ) ) ( not ( = ?auto_258502 ?auto_258503 ) ) ( not ( = ?auto_258502 ?auto_258504 ) ) ( not ( = ?auto_258503 ?auto_258504 ) ) ( CLEAR ?auto_258501 ) ( ON ?auto_258502 ?auto_258503 ) ( CLEAR ?auto_258502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_258495 ?auto_258496 ?auto_258497 ?auto_258498 ?auto_258499 ?auto_258500 ?auto_258501 ?auto_258502 )
      ( MAKE-9PILE ?auto_258495 ?auto_258496 ?auto_258497 ?auto_258498 ?auto_258499 ?auto_258500 ?auto_258501 ?auto_258502 ?auto_258503 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258514 - BLOCK
      ?auto_258515 - BLOCK
      ?auto_258516 - BLOCK
      ?auto_258517 - BLOCK
      ?auto_258518 - BLOCK
      ?auto_258519 - BLOCK
      ?auto_258520 - BLOCK
      ?auto_258521 - BLOCK
      ?auto_258522 - BLOCK
    )
    :vars
    (
      ?auto_258523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258522 ?auto_258523 ) ( ON-TABLE ?auto_258514 ) ( ON ?auto_258515 ?auto_258514 ) ( ON ?auto_258516 ?auto_258515 ) ( ON ?auto_258517 ?auto_258516 ) ( ON ?auto_258518 ?auto_258517 ) ( ON ?auto_258519 ?auto_258518 ) ( ON ?auto_258520 ?auto_258519 ) ( not ( = ?auto_258514 ?auto_258515 ) ) ( not ( = ?auto_258514 ?auto_258516 ) ) ( not ( = ?auto_258514 ?auto_258517 ) ) ( not ( = ?auto_258514 ?auto_258518 ) ) ( not ( = ?auto_258514 ?auto_258519 ) ) ( not ( = ?auto_258514 ?auto_258520 ) ) ( not ( = ?auto_258514 ?auto_258521 ) ) ( not ( = ?auto_258514 ?auto_258522 ) ) ( not ( = ?auto_258514 ?auto_258523 ) ) ( not ( = ?auto_258515 ?auto_258516 ) ) ( not ( = ?auto_258515 ?auto_258517 ) ) ( not ( = ?auto_258515 ?auto_258518 ) ) ( not ( = ?auto_258515 ?auto_258519 ) ) ( not ( = ?auto_258515 ?auto_258520 ) ) ( not ( = ?auto_258515 ?auto_258521 ) ) ( not ( = ?auto_258515 ?auto_258522 ) ) ( not ( = ?auto_258515 ?auto_258523 ) ) ( not ( = ?auto_258516 ?auto_258517 ) ) ( not ( = ?auto_258516 ?auto_258518 ) ) ( not ( = ?auto_258516 ?auto_258519 ) ) ( not ( = ?auto_258516 ?auto_258520 ) ) ( not ( = ?auto_258516 ?auto_258521 ) ) ( not ( = ?auto_258516 ?auto_258522 ) ) ( not ( = ?auto_258516 ?auto_258523 ) ) ( not ( = ?auto_258517 ?auto_258518 ) ) ( not ( = ?auto_258517 ?auto_258519 ) ) ( not ( = ?auto_258517 ?auto_258520 ) ) ( not ( = ?auto_258517 ?auto_258521 ) ) ( not ( = ?auto_258517 ?auto_258522 ) ) ( not ( = ?auto_258517 ?auto_258523 ) ) ( not ( = ?auto_258518 ?auto_258519 ) ) ( not ( = ?auto_258518 ?auto_258520 ) ) ( not ( = ?auto_258518 ?auto_258521 ) ) ( not ( = ?auto_258518 ?auto_258522 ) ) ( not ( = ?auto_258518 ?auto_258523 ) ) ( not ( = ?auto_258519 ?auto_258520 ) ) ( not ( = ?auto_258519 ?auto_258521 ) ) ( not ( = ?auto_258519 ?auto_258522 ) ) ( not ( = ?auto_258519 ?auto_258523 ) ) ( not ( = ?auto_258520 ?auto_258521 ) ) ( not ( = ?auto_258520 ?auto_258522 ) ) ( not ( = ?auto_258520 ?auto_258523 ) ) ( not ( = ?auto_258521 ?auto_258522 ) ) ( not ( = ?auto_258521 ?auto_258523 ) ) ( not ( = ?auto_258522 ?auto_258523 ) ) ( CLEAR ?auto_258520 ) ( ON ?auto_258521 ?auto_258522 ) ( CLEAR ?auto_258521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_258514 ?auto_258515 ?auto_258516 ?auto_258517 ?auto_258518 ?auto_258519 ?auto_258520 ?auto_258521 )
      ( MAKE-9PILE ?auto_258514 ?auto_258515 ?auto_258516 ?auto_258517 ?auto_258518 ?auto_258519 ?auto_258520 ?auto_258521 ?auto_258522 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258533 - BLOCK
      ?auto_258534 - BLOCK
      ?auto_258535 - BLOCK
      ?auto_258536 - BLOCK
      ?auto_258537 - BLOCK
      ?auto_258538 - BLOCK
      ?auto_258539 - BLOCK
      ?auto_258540 - BLOCK
      ?auto_258541 - BLOCK
    )
    :vars
    (
      ?auto_258542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258541 ?auto_258542 ) ( ON-TABLE ?auto_258533 ) ( ON ?auto_258534 ?auto_258533 ) ( ON ?auto_258535 ?auto_258534 ) ( ON ?auto_258536 ?auto_258535 ) ( ON ?auto_258537 ?auto_258536 ) ( ON ?auto_258538 ?auto_258537 ) ( not ( = ?auto_258533 ?auto_258534 ) ) ( not ( = ?auto_258533 ?auto_258535 ) ) ( not ( = ?auto_258533 ?auto_258536 ) ) ( not ( = ?auto_258533 ?auto_258537 ) ) ( not ( = ?auto_258533 ?auto_258538 ) ) ( not ( = ?auto_258533 ?auto_258539 ) ) ( not ( = ?auto_258533 ?auto_258540 ) ) ( not ( = ?auto_258533 ?auto_258541 ) ) ( not ( = ?auto_258533 ?auto_258542 ) ) ( not ( = ?auto_258534 ?auto_258535 ) ) ( not ( = ?auto_258534 ?auto_258536 ) ) ( not ( = ?auto_258534 ?auto_258537 ) ) ( not ( = ?auto_258534 ?auto_258538 ) ) ( not ( = ?auto_258534 ?auto_258539 ) ) ( not ( = ?auto_258534 ?auto_258540 ) ) ( not ( = ?auto_258534 ?auto_258541 ) ) ( not ( = ?auto_258534 ?auto_258542 ) ) ( not ( = ?auto_258535 ?auto_258536 ) ) ( not ( = ?auto_258535 ?auto_258537 ) ) ( not ( = ?auto_258535 ?auto_258538 ) ) ( not ( = ?auto_258535 ?auto_258539 ) ) ( not ( = ?auto_258535 ?auto_258540 ) ) ( not ( = ?auto_258535 ?auto_258541 ) ) ( not ( = ?auto_258535 ?auto_258542 ) ) ( not ( = ?auto_258536 ?auto_258537 ) ) ( not ( = ?auto_258536 ?auto_258538 ) ) ( not ( = ?auto_258536 ?auto_258539 ) ) ( not ( = ?auto_258536 ?auto_258540 ) ) ( not ( = ?auto_258536 ?auto_258541 ) ) ( not ( = ?auto_258536 ?auto_258542 ) ) ( not ( = ?auto_258537 ?auto_258538 ) ) ( not ( = ?auto_258537 ?auto_258539 ) ) ( not ( = ?auto_258537 ?auto_258540 ) ) ( not ( = ?auto_258537 ?auto_258541 ) ) ( not ( = ?auto_258537 ?auto_258542 ) ) ( not ( = ?auto_258538 ?auto_258539 ) ) ( not ( = ?auto_258538 ?auto_258540 ) ) ( not ( = ?auto_258538 ?auto_258541 ) ) ( not ( = ?auto_258538 ?auto_258542 ) ) ( not ( = ?auto_258539 ?auto_258540 ) ) ( not ( = ?auto_258539 ?auto_258541 ) ) ( not ( = ?auto_258539 ?auto_258542 ) ) ( not ( = ?auto_258540 ?auto_258541 ) ) ( not ( = ?auto_258540 ?auto_258542 ) ) ( not ( = ?auto_258541 ?auto_258542 ) ) ( ON ?auto_258540 ?auto_258541 ) ( CLEAR ?auto_258538 ) ( ON ?auto_258539 ?auto_258540 ) ( CLEAR ?auto_258539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_258533 ?auto_258534 ?auto_258535 ?auto_258536 ?auto_258537 ?auto_258538 ?auto_258539 )
      ( MAKE-9PILE ?auto_258533 ?auto_258534 ?auto_258535 ?auto_258536 ?auto_258537 ?auto_258538 ?auto_258539 ?auto_258540 ?auto_258541 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258552 - BLOCK
      ?auto_258553 - BLOCK
      ?auto_258554 - BLOCK
      ?auto_258555 - BLOCK
      ?auto_258556 - BLOCK
      ?auto_258557 - BLOCK
      ?auto_258558 - BLOCK
      ?auto_258559 - BLOCK
      ?auto_258560 - BLOCK
    )
    :vars
    (
      ?auto_258561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258560 ?auto_258561 ) ( ON-TABLE ?auto_258552 ) ( ON ?auto_258553 ?auto_258552 ) ( ON ?auto_258554 ?auto_258553 ) ( ON ?auto_258555 ?auto_258554 ) ( ON ?auto_258556 ?auto_258555 ) ( ON ?auto_258557 ?auto_258556 ) ( not ( = ?auto_258552 ?auto_258553 ) ) ( not ( = ?auto_258552 ?auto_258554 ) ) ( not ( = ?auto_258552 ?auto_258555 ) ) ( not ( = ?auto_258552 ?auto_258556 ) ) ( not ( = ?auto_258552 ?auto_258557 ) ) ( not ( = ?auto_258552 ?auto_258558 ) ) ( not ( = ?auto_258552 ?auto_258559 ) ) ( not ( = ?auto_258552 ?auto_258560 ) ) ( not ( = ?auto_258552 ?auto_258561 ) ) ( not ( = ?auto_258553 ?auto_258554 ) ) ( not ( = ?auto_258553 ?auto_258555 ) ) ( not ( = ?auto_258553 ?auto_258556 ) ) ( not ( = ?auto_258553 ?auto_258557 ) ) ( not ( = ?auto_258553 ?auto_258558 ) ) ( not ( = ?auto_258553 ?auto_258559 ) ) ( not ( = ?auto_258553 ?auto_258560 ) ) ( not ( = ?auto_258553 ?auto_258561 ) ) ( not ( = ?auto_258554 ?auto_258555 ) ) ( not ( = ?auto_258554 ?auto_258556 ) ) ( not ( = ?auto_258554 ?auto_258557 ) ) ( not ( = ?auto_258554 ?auto_258558 ) ) ( not ( = ?auto_258554 ?auto_258559 ) ) ( not ( = ?auto_258554 ?auto_258560 ) ) ( not ( = ?auto_258554 ?auto_258561 ) ) ( not ( = ?auto_258555 ?auto_258556 ) ) ( not ( = ?auto_258555 ?auto_258557 ) ) ( not ( = ?auto_258555 ?auto_258558 ) ) ( not ( = ?auto_258555 ?auto_258559 ) ) ( not ( = ?auto_258555 ?auto_258560 ) ) ( not ( = ?auto_258555 ?auto_258561 ) ) ( not ( = ?auto_258556 ?auto_258557 ) ) ( not ( = ?auto_258556 ?auto_258558 ) ) ( not ( = ?auto_258556 ?auto_258559 ) ) ( not ( = ?auto_258556 ?auto_258560 ) ) ( not ( = ?auto_258556 ?auto_258561 ) ) ( not ( = ?auto_258557 ?auto_258558 ) ) ( not ( = ?auto_258557 ?auto_258559 ) ) ( not ( = ?auto_258557 ?auto_258560 ) ) ( not ( = ?auto_258557 ?auto_258561 ) ) ( not ( = ?auto_258558 ?auto_258559 ) ) ( not ( = ?auto_258558 ?auto_258560 ) ) ( not ( = ?auto_258558 ?auto_258561 ) ) ( not ( = ?auto_258559 ?auto_258560 ) ) ( not ( = ?auto_258559 ?auto_258561 ) ) ( not ( = ?auto_258560 ?auto_258561 ) ) ( ON ?auto_258559 ?auto_258560 ) ( CLEAR ?auto_258557 ) ( ON ?auto_258558 ?auto_258559 ) ( CLEAR ?auto_258558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_258552 ?auto_258553 ?auto_258554 ?auto_258555 ?auto_258556 ?auto_258557 ?auto_258558 )
      ( MAKE-9PILE ?auto_258552 ?auto_258553 ?auto_258554 ?auto_258555 ?auto_258556 ?auto_258557 ?auto_258558 ?auto_258559 ?auto_258560 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258571 - BLOCK
      ?auto_258572 - BLOCK
      ?auto_258573 - BLOCK
      ?auto_258574 - BLOCK
      ?auto_258575 - BLOCK
      ?auto_258576 - BLOCK
      ?auto_258577 - BLOCK
      ?auto_258578 - BLOCK
      ?auto_258579 - BLOCK
    )
    :vars
    (
      ?auto_258580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258579 ?auto_258580 ) ( ON-TABLE ?auto_258571 ) ( ON ?auto_258572 ?auto_258571 ) ( ON ?auto_258573 ?auto_258572 ) ( ON ?auto_258574 ?auto_258573 ) ( ON ?auto_258575 ?auto_258574 ) ( not ( = ?auto_258571 ?auto_258572 ) ) ( not ( = ?auto_258571 ?auto_258573 ) ) ( not ( = ?auto_258571 ?auto_258574 ) ) ( not ( = ?auto_258571 ?auto_258575 ) ) ( not ( = ?auto_258571 ?auto_258576 ) ) ( not ( = ?auto_258571 ?auto_258577 ) ) ( not ( = ?auto_258571 ?auto_258578 ) ) ( not ( = ?auto_258571 ?auto_258579 ) ) ( not ( = ?auto_258571 ?auto_258580 ) ) ( not ( = ?auto_258572 ?auto_258573 ) ) ( not ( = ?auto_258572 ?auto_258574 ) ) ( not ( = ?auto_258572 ?auto_258575 ) ) ( not ( = ?auto_258572 ?auto_258576 ) ) ( not ( = ?auto_258572 ?auto_258577 ) ) ( not ( = ?auto_258572 ?auto_258578 ) ) ( not ( = ?auto_258572 ?auto_258579 ) ) ( not ( = ?auto_258572 ?auto_258580 ) ) ( not ( = ?auto_258573 ?auto_258574 ) ) ( not ( = ?auto_258573 ?auto_258575 ) ) ( not ( = ?auto_258573 ?auto_258576 ) ) ( not ( = ?auto_258573 ?auto_258577 ) ) ( not ( = ?auto_258573 ?auto_258578 ) ) ( not ( = ?auto_258573 ?auto_258579 ) ) ( not ( = ?auto_258573 ?auto_258580 ) ) ( not ( = ?auto_258574 ?auto_258575 ) ) ( not ( = ?auto_258574 ?auto_258576 ) ) ( not ( = ?auto_258574 ?auto_258577 ) ) ( not ( = ?auto_258574 ?auto_258578 ) ) ( not ( = ?auto_258574 ?auto_258579 ) ) ( not ( = ?auto_258574 ?auto_258580 ) ) ( not ( = ?auto_258575 ?auto_258576 ) ) ( not ( = ?auto_258575 ?auto_258577 ) ) ( not ( = ?auto_258575 ?auto_258578 ) ) ( not ( = ?auto_258575 ?auto_258579 ) ) ( not ( = ?auto_258575 ?auto_258580 ) ) ( not ( = ?auto_258576 ?auto_258577 ) ) ( not ( = ?auto_258576 ?auto_258578 ) ) ( not ( = ?auto_258576 ?auto_258579 ) ) ( not ( = ?auto_258576 ?auto_258580 ) ) ( not ( = ?auto_258577 ?auto_258578 ) ) ( not ( = ?auto_258577 ?auto_258579 ) ) ( not ( = ?auto_258577 ?auto_258580 ) ) ( not ( = ?auto_258578 ?auto_258579 ) ) ( not ( = ?auto_258578 ?auto_258580 ) ) ( not ( = ?auto_258579 ?auto_258580 ) ) ( ON ?auto_258578 ?auto_258579 ) ( ON ?auto_258577 ?auto_258578 ) ( CLEAR ?auto_258575 ) ( ON ?auto_258576 ?auto_258577 ) ( CLEAR ?auto_258576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_258571 ?auto_258572 ?auto_258573 ?auto_258574 ?auto_258575 ?auto_258576 )
      ( MAKE-9PILE ?auto_258571 ?auto_258572 ?auto_258573 ?auto_258574 ?auto_258575 ?auto_258576 ?auto_258577 ?auto_258578 ?auto_258579 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258590 - BLOCK
      ?auto_258591 - BLOCK
      ?auto_258592 - BLOCK
      ?auto_258593 - BLOCK
      ?auto_258594 - BLOCK
      ?auto_258595 - BLOCK
      ?auto_258596 - BLOCK
      ?auto_258597 - BLOCK
      ?auto_258598 - BLOCK
    )
    :vars
    (
      ?auto_258599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258598 ?auto_258599 ) ( ON-TABLE ?auto_258590 ) ( ON ?auto_258591 ?auto_258590 ) ( ON ?auto_258592 ?auto_258591 ) ( ON ?auto_258593 ?auto_258592 ) ( ON ?auto_258594 ?auto_258593 ) ( not ( = ?auto_258590 ?auto_258591 ) ) ( not ( = ?auto_258590 ?auto_258592 ) ) ( not ( = ?auto_258590 ?auto_258593 ) ) ( not ( = ?auto_258590 ?auto_258594 ) ) ( not ( = ?auto_258590 ?auto_258595 ) ) ( not ( = ?auto_258590 ?auto_258596 ) ) ( not ( = ?auto_258590 ?auto_258597 ) ) ( not ( = ?auto_258590 ?auto_258598 ) ) ( not ( = ?auto_258590 ?auto_258599 ) ) ( not ( = ?auto_258591 ?auto_258592 ) ) ( not ( = ?auto_258591 ?auto_258593 ) ) ( not ( = ?auto_258591 ?auto_258594 ) ) ( not ( = ?auto_258591 ?auto_258595 ) ) ( not ( = ?auto_258591 ?auto_258596 ) ) ( not ( = ?auto_258591 ?auto_258597 ) ) ( not ( = ?auto_258591 ?auto_258598 ) ) ( not ( = ?auto_258591 ?auto_258599 ) ) ( not ( = ?auto_258592 ?auto_258593 ) ) ( not ( = ?auto_258592 ?auto_258594 ) ) ( not ( = ?auto_258592 ?auto_258595 ) ) ( not ( = ?auto_258592 ?auto_258596 ) ) ( not ( = ?auto_258592 ?auto_258597 ) ) ( not ( = ?auto_258592 ?auto_258598 ) ) ( not ( = ?auto_258592 ?auto_258599 ) ) ( not ( = ?auto_258593 ?auto_258594 ) ) ( not ( = ?auto_258593 ?auto_258595 ) ) ( not ( = ?auto_258593 ?auto_258596 ) ) ( not ( = ?auto_258593 ?auto_258597 ) ) ( not ( = ?auto_258593 ?auto_258598 ) ) ( not ( = ?auto_258593 ?auto_258599 ) ) ( not ( = ?auto_258594 ?auto_258595 ) ) ( not ( = ?auto_258594 ?auto_258596 ) ) ( not ( = ?auto_258594 ?auto_258597 ) ) ( not ( = ?auto_258594 ?auto_258598 ) ) ( not ( = ?auto_258594 ?auto_258599 ) ) ( not ( = ?auto_258595 ?auto_258596 ) ) ( not ( = ?auto_258595 ?auto_258597 ) ) ( not ( = ?auto_258595 ?auto_258598 ) ) ( not ( = ?auto_258595 ?auto_258599 ) ) ( not ( = ?auto_258596 ?auto_258597 ) ) ( not ( = ?auto_258596 ?auto_258598 ) ) ( not ( = ?auto_258596 ?auto_258599 ) ) ( not ( = ?auto_258597 ?auto_258598 ) ) ( not ( = ?auto_258597 ?auto_258599 ) ) ( not ( = ?auto_258598 ?auto_258599 ) ) ( ON ?auto_258597 ?auto_258598 ) ( ON ?auto_258596 ?auto_258597 ) ( CLEAR ?auto_258594 ) ( ON ?auto_258595 ?auto_258596 ) ( CLEAR ?auto_258595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_258590 ?auto_258591 ?auto_258592 ?auto_258593 ?auto_258594 ?auto_258595 )
      ( MAKE-9PILE ?auto_258590 ?auto_258591 ?auto_258592 ?auto_258593 ?auto_258594 ?auto_258595 ?auto_258596 ?auto_258597 ?auto_258598 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258609 - BLOCK
      ?auto_258610 - BLOCK
      ?auto_258611 - BLOCK
      ?auto_258612 - BLOCK
      ?auto_258613 - BLOCK
      ?auto_258614 - BLOCK
      ?auto_258615 - BLOCK
      ?auto_258616 - BLOCK
      ?auto_258617 - BLOCK
    )
    :vars
    (
      ?auto_258618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258617 ?auto_258618 ) ( ON-TABLE ?auto_258609 ) ( ON ?auto_258610 ?auto_258609 ) ( ON ?auto_258611 ?auto_258610 ) ( ON ?auto_258612 ?auto_258611 ) ( not ( = ?auto_258609 ?auto_258610 ) ) ( not ( = ?auto_258609 ?auto_258611 ) ) ( not ( = ?auto_258609 ?auto_258612 ) ) ( not ( = ?auto_258609 ?auto_258613 ) ) ( not ( = ?auto_258609 ?auto_258614 ) ) ( not ( = ?auto_258609 ?auto_258615 ) ) ( not ( = ?auto_258609 ?auto_258616 ) ) ( not ( = ?auto_258609 ?auto_258617 ) ) ( not ( = ?auto_258609 ?auto_258618 ) ) ( not ( = ?auto_258610 ?auto_258611 ) ) ( not ( = ?auto_258610 ?auto_258612 ) ) ( not ( = ?auto_258610 ?auto_258613 ) ) ( not ( = ?auto_258610 ?auto_258614 ) ) ( not ( = ?auto_258610 ?auto_258615 ) ) ( not ( = ?auto_258610 ?auto_258616 ) ) ( not ( = ?auto_258610 ?auto_258617 ) ) ( not ( = ?auto_258610 ?auto_258618 ) ) ( not ( = ?auto_258611 ?auto_258612 ) ) ( not ( = ?auto_258611 ?auto_258613 ) ) ( not ( = ?auto_258611 ?auto_258614 ) ) ( not ( = ?auto_258611 ?auto_258615 ) ) ( not ( = ?auto_258611 ?auto_258616 ) ) ( not ( = ?auto_258611 ?auto_258617 ) ) ( not ( = ?auto_258611 ?auto_258618 ) ) ( not ( = ?auto_258612 ?auto_258613 ) ) ( not ( = ?auto_258612 ?auto_258614 ) ) ( not ( = ?auto_258612 ?auto_258615 ) ) ( not ( = ?auto_258612 ?auto_258616 ) ) ( not ( = ?auto_258612 ?auto_258617 ) ) ( not ( = ?auto_258612 ?auto_258618 ) ) ( not ( = ?auto_258613 ?auto_258614 ) ) ( not ( = ?auto_258613 ?auto_258615 ) ) ( not ( = ?auto_258613 ?auto_258616 ) ) ( not ( = ?auto_258613 ?auto_258617 ) ) ( not ( = ?auto_258613 ?auto_258618 ) ) ( not ( = ?auto_258614 ?auto_258615 ) ) ( not ( = ?auto_258614 ?auto_258616 ) ) ( not ( = ?auto_258614 ?auto_258617 ) ) ( not ( = ?auto_258614 ?auto_258618 ) ) ( not ( = ?auto_258615 ?auto_258616 ) ) ( not ( = ?auto_258615 ?auto_258617 ) ) ( not ( = ?auto_258615 ?auto_258618 ) ) ( not ( = ?auto_258616 ?auto_258617 ) ) ( not ( = ?auto_258616 ?auto_258618 ) ) ( not ( = ?auto_258617 ?auto_258618 ) ) ( ON ?auto_258616 ?auto_258617 ) ( ON ?auto_258615 ?auto_258616 ) ( ON ?auto_258614 ?auto_258615 ) ( CLEAR ?auto_258612 ) ( ON ?auto_258613 ?auto_258614 ) ( CLEAR ?auto_258613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_258609 ?auto_258610 ?auto_258611 ?auto_258612 ?auto_258613 )
      ( MAKE-9PILE ?auto_258609 ?auto_258610 ?auto_258611 ?auto_258612 ?auto_258613 ?auto_258614 ?auto_258615 ?auto_258616 ?auto_258617 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258628 - BLOCK
      ?auto_258629 - BLOCK
      ?auto_258630 - BLOCK
      ?auto_258631 - BLOCK
      ?auto_258632 - BLOCK
      ?auto_258633 - BLOCK
      ?auto_258634 - BLOCK
      ?auto_258635 - BLOCK
      ?auto_258636 - BLOCK
    )
    :vars
    (
      ?auto_258637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258636 ?auto_258637 ) ( ON-TABLE ?auto_258628 ) ( ON ?auto_258629 ?auto_258628 ) ( ON ?auto_258630 ?auto_258629 ) ( ON ?auto_258631 ?auto_258630 ) ( not ( = ?auto_258628 ?auto_258629 ) ) ( not ( = ?auto_258628 ?auto_258630 ) ) ( not ( = ?auto_258628 ?auto_258631 ) ) ( not ( = ?auto_258628 ?auto_258632 ) ) ( not ( = ?auto_258628 ?auto_258633 ) ) ( not ( = ?auto_258628 ?auto_258634 ) ) ( not ( = ?auto_258628 ?auto_258635 ) ) ( not ( = ?auto_258628 ?auto_258636 ) ) ( not ( = ?auto_258628 ?auto_258637 ) ) ( not ( = ?auto_258629 ?auto_258630 ) ) ( not ( = ?auto_258629 ?auto_258631 ) ) ( not ( = ?auto_258629 ?auto_258632 ) ) ( not ( = ?auto_258629 ?auto_258633 ) ) ( not ( = ?auto_258629 ?auto_258634 ) ) ( not ( = ?auto_258629 ?auto_258635 ) ) ( not ( = ?auto_258629 ?auto_258636 ) ) ( not ( = ?auto_258629 ?auto_258637 ) ) ( not ( = ?auto_258630 ?auto_258631 ) ) ( not ( = ?auto_258630 ?auto_258632 ) ) ( not ( = ?auto_258630 ?auto_258633 ) ) ( not ( = ?auto_258630 ?auto_258634 ) ) ( not ( = ?auto_258630 ?auto_258635 ) ) ( not ( = ?auto_258630 ?auto_258636 ) ) ( not ( = ?auto_258630 ?auto_258637 ) ) ( not ( = ?auto_258631 ?auto_258632 ) ) ( not ( = ?auto_258631 ?auto_258633 ) ) ( not ( = ?auto_258631 ?auto_258634 ) ) ( not ( = ?auto_258631 ?auto_258635 ) ) ( not ( = ?auto_258631 ?auto_258636 ) ) ( not ( = ?auto_258631 ?auto_258637 ) ) ( not ( = ?auto_258632 ?auto_258633 ) ) ( not ( = ?auto_258632 ?auto_258634 ) ) ( not ( = ?auto_258632 ?auto_258635 ) ) ( not ( = ?auto_258632 ?auto_258636 ) ) ( not ( = ?auto_258632 ?auto_258637 ) ) ( not ( = ?auto_258633 ?auto_258634 ) ) ( not ( = ?auto_258633 ?auto_258635 ) ) ( not ( = ?auto_258633 ?auto_258636 ) ) ( not ( = ?auto_258633 ?auto_258637 ) ) ( not ( = ?auto_258634 ?auto_258635 ) ) ( not ( = ?auto_258634 ?auto_258636 ) ) ( not ( = ?auto_258634 ?auto_258637 ) ) ( not ( = ?auto_258635 ?auto_258636 ) ) ( not ( = ?auto_258635 ?auto_258637 ) ) ( not ( = ?auto_258636 ?auto_258637 ) ) ( ON ?auto_258635 ?auto_258636 ) ( ON ?auto_258634 ?auto_258635 ) ( ON ?auto_258633 ?auto_258634 ) ( CLEAR ?auto_258631 ) ( ON ?auto_258632 ?auto_258633 ) ( CLEAR ?auto_258632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_258628 ?auto_258629 ?auto_258630 ?auto_258631 ?auto_258632 )
      ( MAKE-9PILE ?auto_258628 ?auto_258629 ?auto_258630 ?auto_258631 ?auto_258632 ?auto_258633 ?auto_258634 ?auto_258635 ?auto_258636 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258647 - BLOCK
      ?auto_258648 - BLOCK
      ?auto_258649 - BLOCK
      ?auto_258650 - BLOCK
      ?auto_258651 - BLOCK
      ?auto_258652 - BLOCK
      ?auto_258653 - BLOCK
      ?auto_258654 - BLOCK
      ?auto_258655 - BLOCK
    )
    :vars
    (
      ?auto_258656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258655 ?auto_258656 ) ( ON-TABLE ?auto_258647 ) ( ON ?auto_258648 ?auto_258647 ) ( ON ?auto_258649 ?auto_258648 ) ( not ( = ?auto_258647 ?auto_258648 ) ) ( not ( = ?auto_258647 ?auto_258649 ) ) ( not ( = ?auto_258647 ?auto_258650 ) ) ( not ( = ?auto_258647 ?auto_258651 ) ) ( not ( = ?auto_258647 ?auto_258652 ) ) ( not ( = ?auto_258647 ?auto_258653 ) ) ( not ( = ?auto_258647 ?auto_258654 ) ) ( not ( = ?auto_258647 ?auto_258655 ) ) ( not ( = ?auto_258647 ?auto_258656 ) ) ( not ( = ?auto_258648 ?auto_258649 ) ) ( not ( = ?auto_258648 ?auto_258650 ) ) ( not ( = ?auto_258648 ?auto_258651 ) ) ( not ( = ?auto_258648 ?auto_258652 ) ) ( not ( = ?auto_258648 ?auto_258653 ) ) ( not ( = ?auto_258648 ?auto_258654 ) ) ( not ( = ?auto_258648 ?auto_258655 ) ) ( not ( = ?auto_258648 ?auto_258656 ) ) ( not ( = ?auto_258649 ?auto_258650 ) ) ( not ( = ?auto_258649 ?auto_258651 ) ) ( not ( = ?auto_258649 ?auto_258652 ) ) ( not ( = ?auto_258649 ?auto_258653 ) ) ( not ( = ?auto_258649 ?auto_258654 ) ) ( not ( = ?auto_258649 ?auto_258655 ) ) ( not ( = ?auto_258649 ?auto_258656 ) ) ( not ( = ?auto_258650 ?auto_258651 ) ) ( not ( = ?auto_258650 ?auto_258652 ) ) ( not ( = ?auto_258650 ?auto_258653 ) ) ( not ( = ?auto_258650 ?auto_258654 ) ) ( not ( = ?auto_258650 ?auto_258655 ) ) ( not ( = ?auto_258650 ?auto_258656 ) ) ( not ( = ?auto_258651 ?auto_258652 ) ) ( not ( = ?auto_258651 ?auto_258653 ) ) ( not ( = ?auto_258651 ?auto_258654 ) ) ( not ( = ?auto_258651 ?auto_258655 ) ) ( not ( = ?auto_258651 ?auto_258656 ) ) ( not ( = ?auto_258652 ?auto_258653 ) ) ( not ( = ?auto_258652 ?auto_258654 ) ) ( not ( = ?auto_258652 ?auto_258655 ) ) ( not ( = ?auto_258652 ?auto_258656 ) ) ( not ( = ?auto_258653 ?auto_258654 ) ) ( not ( = ?auto_258653 ?auto_258655 ) ) ( not ( = ?auto_258653 ?auto_258656 ) ) ( not ( = ?auto_258654 ?auto_258655 ) ) ( not ( = ?auto_258654 ?auto_258656 ) ) ( not ( = ?auto_258655 ?auto_258656 ) ) ( ON ?auto_258654 ?auto_258655 ) ( ON ?auto_258653 ?auto_258654 ) ( ON ?auto_258652 ?auto_258653 ) ( ON ?auto_258651 ?auto_258652 ) ( CLEAR ?auto_258649 ) ( ON ?auto_258650 ?auto_258651 ) ( CLEAR ?auto_258650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_258647 ?auto_258648 ?auto_258649 ?auto_258650 )
      ( MAKE-9PILE ?auto_258647 ?auto_258648 ?auto_258649 ?auto_258650 ?auto_258651 ?auto_258652 ?auto_258653 ?auto_258654 ?auto_258655 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258666 - BLOCK
      ?auto_258667 - BLOCK
      ?auto_258668 - BLOCK
      ?auto_258669 - BLOCK
      ?auto_258670 - BLOCK
      ?auto_258671 - BLOCK
      ?auto_258672 - BLOCK
      ?auto_258673 - BLOCK
      ?auto_258674 - BLOCK
    )
    :vars
    (
      ?auto_258675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258674 ?auto_258675 ) ( ON-TABLE ?auto_258666 ) ( ON ?auto_258667 ?auto_258666 ) ( ON ?auto_258668 ?auto_258667 ) ( not ( = ?auto_258666 ?auto_258667 ) ) ( not ( = ?auto_258666 ?auto_258668 ) ) ( not ( = ?auto_258666 ?auto_258669 ) ) ( not ( = ?auto_258666 ?auto_258670 ) ) ( not ( = ?auto_258666 ?auto_258671 ) ) ( not ( = ?auto_258666 ?auto_258672 ) ) ( not ( = ?auto_258666 ?auto_258673 ) ) ( not ( = ?auto_258666 ?auto_258674 ) ) ( not ( = ?auto_258666 ?auto_258675 ) ) ( not ( = ?auto_258667 ?auto_258668 ) ) ( not ( = ?auto_258667 ?auto_258669 ) ) ( not ( = ?auto_258667 ?auto_258670 ) ) ( not ( = ?auto_258667 ?auto_258671 ) ) ( not ( = ?auto_258667 ?auto_258672 ) ) ( not ( = ?auto_258667 ?auto_258673 ) ) ( not ( = ?auto_258667 ?auto_258674 ) ) ( not ( = ?auto_258667 ?auto_258675 ) ) ( not ( = ?auto_258668 ?auto_258669 ) ) ( not ( = ?auto_258668 ?auto_258670 ) ) ( not ( = ?auto_258668 ?auto_258671 ) ) ( not ( = ?auto_258668 ?auto_258672 ) ) ( not ( = ?auto_258668 ?auto_258673 ) ) ( not ( = ?auto_258668 ?auto_258674 ) ) ( not ( = ?auto_258668 ?auto_258675 ) ) ( not ( = ?auto_258669 ?auto_258670 ) ) ( not ( = ?auto_258669 ?auto_258671 ) ) ( not ( = ?auto_258669 ?auto_258672 ) ) ( not ( = ?auto_258669 ?auto_258673 ) ) ( not ( = ?auto_258669 ?auto_258674 ) ) ( not ( = ?auto_258669 ?auto_258675 ) ) ( not ( = ?auto_258670 ?auto_258671 ) ) ( not ( = ?auto_258670 ?auto_258672 ) ) ( not ( = ?auto_258670 ?auto_258673 ) ) ( not ( = ?auto_258670 ?auto_258674 ) ) ( not ( = ?auto_258670 ?auto_258675 ) ) ( not ( = ?auto_258671 ?auto_258672 ) ) ( not ( = ?auto_258671 ?auto_258673 ) ) ( not ( = ?auto_258671 ?auto_258674 ) ) ( not ( = ?auto_258671 ?auto_258675 ) ) ( not ( = ?auto_258672 ?auto_258673 ) ) ( not ( = ?auto_258672 ?auto_258674 ) ) ( not ( = ?auto_258672 ?auto_258675 ) ) ( not ( = ?auto_258673 ?auto_258674 ) ) ( not ( = ?auto_258673 ?auto_258675 ) ) ( not ( = ?auto_258674 ?auto_258675 ) ) ( ON ?auto_258673 ?auto_258674 ) ( ON ?auto_258672 ?auto_258673 ) ( ON ?auto_258671 ?auto_258672 ) ( ON ?auto_258670 ?auto_258671 ) ( CLEAR ?auto_258668 ) ( ON ?auto_258669 ?auto_258670 ) ( CLEAR ?auto_258669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_258666 ?auto_258667 ?auto_258668 ?auto_258669 )
      ( MAKE-9PILE ?auto_258666 ?auto_258667 ?auto_258668 ?auto_258669 ?auto_258670 ?auto_258671 ?auto_258672 ?auto_258673 ?auto_258674 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258685 - BLOCK
      ?auto_258686 - BLOCK
      ?auto_258687 - BLOCK
      ?auto_258688 - BLOCK
      ?auto_258689 - BLOCK
      ?auto_258690 - BLOCK
      ?auto_258691 - BLOCK
      ?auto_258692 - BLOCK
      ?auto_258693 - BLOCK
    )
    :vars
    (
      ?auto_258694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258693 ?auto_258694 ) ( ON-TABLE ?auto_258685 ) ( ON ?auto_258686 ?auto_258685 ) ( not ( = ?auto_258685 ?auto_258686 ) ) ( not ( = ?auto_258685 ?auto_258687 ) ) ( not ( = ?auto_258685 ?auto_258688 ) ) ( not ( = ?auto_258685 ?auto_258689 ) ) ( not ( = ?auto_258685 ?auto_258690 ) ) ( not ( = ?auto_258685 ?auto_258691 ) ) ( not ( = ?auto_258685 ?auto_258692 ) ) ( not ( = ?auto_258685 ?auto_258693 ) ) ( not ( = ?auto_258685 ?auto_258694 ) ) ( not ( = ?auto_258686 ?auto_258687 ) ) ( not ( = ?auto_258686 ?auto_258688 ) ) ( not ( = ?auto_258686 ?auto_258689 ) ) ( not ( = ?auto_258686 ?auto_258690 ) ) ( not ( = ?auto_258686 ?auto_258691 ) ) ( not ( = ?auto_258686 ?auto_258692 ) ) ( not ( = ?auto_258686 ?auto_258693 ) ) ( not ( = ?auto_258686 ?auto_258694 ) ) ( not ( = ?auto_258687 ?auto_258688 ) ) ( not ( = ?auto_258687 ?auto_258689 ) ) ( not ( = ?auto_258687 ?auto_258690 ) ) ( not ( = ?auto_258687 ?auto_258691 ) ) ( not ( = ?auto_258687 ?auto_258692 ) ) ( not ( = ?auto_258687 ?auto_258693 ) ) ( not ( = ?auto_258687 ?auto_258694 ) ) ( not ( = ?auto_258688 ?auto_258689 ) ) ( not ( = ?auto_258688 ?auto_258690 ) ) ( not ( = ?auto_258688 ?auto_258691 ) ) ( not ( = ?auto_258688 ?auto_258692 ) ) ( not ( = ?auto_258688 ?auto_258693 ) ) ( not ( = ?auto_258688 ?auto_258694 ) ) ( not ( = ?auto_258689 ?auto_258690 ) ) ( not ( = ?auto_258689 ?auto_258691 ) ) ( not ( = ?auto_258689 ?auto_258692 ) ) ( not ( = ?auto_258689 ?auto_258693 ) ) ( not ( = ?auto_258689 ?auto_258694 ) ) ( not ( = ?auto_258690 ?auto_258691 ) ) ( not ( = ?auto_258690 ?auto_258692 ) ) ( not ( = ?auto_258690 ?auto_258693 ) ) ( not ( = ?auto_258690 ?auto_258694 ) ) ( not ( = ?auto_258691 ?auto_258692 ) ) ( not ( = ?auto_258691 ?auto_258693 ) ) ( not ( = ?auto_258691 ?auto_258694 ) ) ( not ( = ?auto_258692 ?auto_258693 ) ) ( not ( = ?auto_258692 ?auto_258694 ) ) ( not ( = ?auto_258693 ?auto_258694 ) ) ( ON ?auto_258692 ?auto_258693 ) ( ON ?auto_258691 ?auto_258692 ) ( ON ?auto_258690 ?auto_258691 ) ( ON ?auto_258689 ?auto_258690 ) ( ON ?auto_258688 ?auto_258689 ) ( CLEAR ?auto_258686 ) ( ON ?auto_258687 ?auto_258688 ) ( CLEAR ?auto_258687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_258685 ?auto_258686 ?auto_258687 )
      ( MAKE-9PILE ?auto_258685 ?auto_258686 ?auto_258687 ?auto_258688 ?auto_258689 ?auto_258690 ?auto_258691 ?auto_258692 ?auto_258693 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258704 - BLOCK
      ?auto_258705 - BLOCK
      ?auto_258706 - BLOCK
      ?auto_258707 - BLOCK
      ?auto_258708 - BLOCK
      ?auto_258709 - BLOCK
      ?auto_258710 - BLOCK
      ?auto_258711 - BLOCK
      ?auto_258712 - BLOCK
    )
    :vars
    (
      ?auto_258713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258712 ?auto_258713 ) ( ON-TABLE ?auto_258704 ) ( ON ?auto_258705 ?auto_258704 ) ( not ( = ?auto_258704 ?auto_258705 ) ) ( not ( = ?auto_258704 ?auto_258706 ) ) ( not ( = ?auto_258704 ?auto_258707 ) ) ( not ( = ?auto_258704 ?auto_258708 ) ) ( not ( = ?auto_258704 ?auto_258709 ) ) ( not ( = ?auto_258704 ?auto_258710 ) ) ( not ( = ?auto_258704 ?auto_258711 ) ) ( not ( = ?auto_258704 ?auto_258712 ) ) ( not ( = ?auto_258704 ?auto_258713 ) ) ( not ( = ?auto_258705 ?auto_258706 ) ) ( not ( = ?auto_258705 ?auto_258707 ) ) ( not ( = ?auto_258705 ?auto_258708 ) ) ( not ( = ?auto_258705 ?auto_258709 ) ) ( not ( = ?auto_258705 ?auto_258710 ) ) ( not ( = ?auto_258705 ?auto_258711 ) ) ( not ( = ?auto_258705 ?auto_258712 ) ) ( not ( = ?auto_258705 ?auto_258713 ) ) ( not ( = ?auto_258706 ?auto_258707 ) ) ( not ( = ?auto_258706 ?auto_258708 ) ) ( not ( = ?auto_258706 ?auto_258709 ) ) ( not ( = ?auto_258706 ?auto_258710 ) ) ( not ( = ?auto_258706 ?auto_258711 ) ) ( not ( = ?auto_258706 ?auto_258712 ) ) ( not ( = ?auto_258706 ?auto_258713 ) ) ( not ( = ?auto_258707 ?auto_258708 ) ) ( not ( = ?auto_258707 ?auto_258709 ) ) ( not ( = ?auto_258707 ?auto_258710 ) ) ( not ( = ?auto_258707 ?auto_258711 ) ) ( not ( = ?auto_258707 ?auto_258712 ) ) ( not ( = ?auto_258707 ?auto_258713 ) ) ( not ( = ?auto_258708 ?auto_258709 ) ) ( not ( = ?auto_258708 ?auto_258710 ) ) ( not ( = ?auto_258708 ?auto_258711 ) ) ( not ( = ?auto_258708 ?auto_258712 ) ) ( not ( = ?auto_258708 ?auto_258713 ) ) ( not ( = ?auto_258709 ?auto_258710 ) ) ( not ( = ?auto_258709 ?auto_258711 ) ) ( not ( = ?auto_258709 ?auto_258712 ) ) ( not ( = ?auto_258709 ?auto_258713 ) ) ( not ( = ?auto_258710 ?auto_258711 ) ) ( not ( = ?auto_258710 ?auto_258712 ) ) ( not ( = ?auto_258710 ?auto_258713 ) ) ( not ( = ?auto_258711 ?auto_258712 ) ) ( not ( = ?auto_258711 ?auto_258713 ) ) ( not ( = ?auto_258712 ?auto_258713 ) ) ( ON ?auto_258711 ?auto_258712 ) ( ON ?auto_258710 ?auto_258711 ) ( ON ?auto_258709 ?auto_258710 ) ( ON ?auto_258708 ?auto_258709 ) ( ON ?auto_258707 ?auto_258708 ) ( CLEAR ?auto_258705 ) ( ON ?auto_258706 ?auto_258707 ) ( CLEAR ?auto_258706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_258704 ?auto_258705 ?auto_258706 )
      ( MAKE-9PILE ?auto_258704 ?auto_258705 ?auto_258706 ?auto_258707 ?auto_258708 ?auto_258709 ?auto_258710 ?auto_258711 ?auto_258712 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258723 - BLOCK
      ?auto_258724 - BLOCK
      ?auto_258725 - BLOCK
      ?auto_258726 - BLOCK
      ?auto_258727 - BLOCK
      ?auto_258728 - BLOCK
      ?auto_258729 - BLOCK
      ?auto_258730 - BLOCK
      ?auto_258731 - BLOCK
    )
    :vars
    (
      ?auto_258732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258731 ?auto_258732 ) ( ON-TABLE ?auto_258723 ) ( not ( = ?auto_258723 ?auto_258724 ) ) ( not ( = ?auto_258723 ?auto_258725 ) ) ( not ( = ?auto_258723 ?auto_258726 ) ) ( not ( = ?auto_258723 ?auto_258727 ) ) ( not ( = ?auto_258723 ?auto_258728 ) ) ( not ( = ?auto_258723 ?auto_258729 ) ) ( not ( = ?auto_258723 ?auto_258730 ) ) ( not ( = ?auto_258723 ?auto_258731 ) ) ( not ( = ?auto_258723 ?auto_258732 ) ) ( not ( = ?auto_258724 ?auto_258725 ) ) ( not ( = ?auto_258724 ?auto_258726 ) ) ( not ( = ?auto_258724 ?auto_258727 ) ) ( not ( = ?auto_258724 ?auto_258728 ) ) ( not ( = ?auto_258724 ?auto_258729 ) ) ( not ( = ?auto_258724 ?auto_258730 ) ) ( not ( = ?auto_258724 ?auto_258731 ) ) ( not ( = ?auto_258724 ?auto_258732 ) ) ( not ( = ?auto_258725 ?auto_258726 ) ) ( not ( = ?auto_258725 ?auto_258727 ) ) ( not ( = ?auto_258725 ?auto_258728 ) ) ( not ( = ?auto_258725 ?auto_258729 ) ) ( not ( = ?auto_258725 ?auto_258730 ) ) ( not ( = ?auto_258725 ?auto_258731 ) ) ( not ( = ?auto_258725 ?auto_258732 ) ) ( not ( = ?auto_258726 ?auto_258727 ) ) ( not ( = ?auto_258726 ?auto_258728 ) ) ( not ( = ?auto_258726 ?auto_258729 ) ) ( not ( = ?auto_258726 ?auto_258730 ) ) ( not ( = ?auto_258726 ?auto_258731 ) ) ( not ( = ?auto_258726 ?auto_258732 ) ) ( not ( = ?auto_258727 ?auto_258728 ) ) ( not ( = ?auto_258727 ?auto_258729 ) ) ( not ( = ?auto_258727 ?auto_258730 ) ) ( not ( = ?auto_258727 ?auto_258731 ) ) ( not ( = ?auto_258727 ?auto_258732 ) ) ( not ( = ?auto_258728 ?auto_258729 ) ) ( not ( = ?auto_258728 ?auto_258730 ) ) ( not ( = ?auto_258728 ?auto_258731 ) ) ( not ( = ?auto_258728 ?auto_258732 ) ) ( not ( = ?auto_258729 ?auto_258730 ) ) ( not ( = ?auto_258729 ?auto_258731 ) ) ( not ( = ?auto_258729 ?auto_258732 ) ) ( not ( = ?auto_258730 ?auto_258731 ) ) ( not ( = ?auto_258730 ?auto_258732 ) ) ( not ( = ?auto_258731 ?auto_258732 ) ) ( ON ?auto_258730 ?auto_258731 ) ( ON ?auto_258729 ?auto_258730 ) ( ON ?auto_258728 ?auto_258729 ) ( ON ?auto_258727 ?auto_258728 ) ( ON ?auto_258726 ?auto_258727 ) ( ON ?auto_258725 ?auto_258726 ) ( CLEAR ?auto_258723 ) ( ON ?auto_258724 ?auto_258725 ) ( CLEAR ?auto_258724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_258723 ?auto_258724 )
      ( MAKE-9PILE ?auto_258723 ?auto_258724 ?auto_258725 ?auto_258726 ?auto_258727 ?auto_258728 ?auto_258729 ?auto_258730 ?auto_258731 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258742 - BLOCK
      ?auto_258743 - BLOCK
      ?auto_258744 - BLOCK
      ?auto_258745 - BLOCK
      ?auto_258746 - BLOCK
      ?auto_258747 - BLOCK
      ?auto_258748 - BLOCK
      ?auto_258749 - BLOCK
      ?auto_258750 - BLOCK
    )
    :vars
    (
      ?auto_258751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258750 ?auto_258751 ) ( ON-TABLE ?auto_258742 ) ( not ( = ?auto_258742 ?auto_258743 ) ) ( not ( = ?auto_258742 ?auto_258744 ) ) ( not ( = ?auto_258742 ?auto_258745 ) ) ( not ( = ?auto_258742 ?auto_258746 ) ) ( not ( = ?auto_258742 ?auto_258747 ) ) ( not ( = ?auto_258742 ?auto_258748 ) ) ( not ( = ?auto_258742 ?auto_258749 ) ) ( not ( = ?auto_258742 ?auto_258750 ) ) ( not ( = ?auto_258742 ?auto_258751 ) ) ( not ( = ?auto_258743 ?auto_258744 ) ) ( not ( = ?auto_258743 ?auto_258745 ) ) ( not ( = ?auto_258743 ?auto_258746 ) ) ( not ( = ?auto_258743 ?auto_258747 ) ) ( not ( = ?auto_258743 ?auto_258748 ) ) ( not ( = ?auto_258743 ?auto_258749 ) ) ( not ( = ?auto_258743 ?auto_258750 ) ) ( not ( = ?auto_258743 ?auto_258751 ) ) ( not ( = ?auto_258744 ?auto_258745 ) ) ( not ( = ?auto_258744 ?auto_258746 ) ) ( not ( = ?auto_258744 ?auto_258747 ) ) ( not ( = ?auto_258744 ?auto_258748 ) ) ( not ( = ?auto_258744 ?auto_258749 ) ) ( not ( = ?auto_258744 ?auto_258750 ) ) ( not ( = ?auto_258744 ?auto_258751 ) ) ( not ( = ?auto_258745 ?auto_258746 ) ) ( not ( = ?auto_258745 ?auto_258747 ) ) ( not ( = ?auto_258745 ?auto_258748 ) ) ( not ( = ?auto_258745 ?auto_258749 ) ) ( not ( = ?auto_258745 ?auto_258750 ) ) ( not ( = ?auto_258745 ?auto_258751 ) ) ( not ( = ?auto_258746 ?auto_258747 ) ) ( not ( = ?auto_258746 ?auto_258748 ) ) ( not ( = ?auto_258746 ?auto_258749 ) ) ( not ( = ?auto_258746 ?auto_258750 ) ) ( not ( = ?auto_258746 ?auto_258751 ) ) ( not ( = ?auto_258747 ?auto_258748 ) ) ( not ( = ?auto_258747 ?auto_258749 ) ) ( not ( = ?auto_258747 ?auto_258750 ) ) ( not ( = ?auto_258747 ?auto_258751 ) ) ( not ( = ?auto_258748 ?auto_258749 ) ) ( not ( = ?auto_258748 ?auto_258750 ) ) ( not ( = ?auto_258748 ?auto_258751 ) ) ( not ( = ?auto_258749 ?auto_258750 ) ) ( not ( = ?auto_258749 ?auto_258751 ) ) ( not ( = ?auto_258750 ?auto_258751 ) ) ( ON ?auto_258749 ?auto_258750 ) ( ON ?auto_258748 ?auto_258749 ) ( ON ?auto_258747 ?auto_258748 ) ( ON ?auto_258746 ?auto_258747 ) ( ON ?auto_258745 ?auto_258746 ) ( ON ?auto_258744 ?auto_258745 ) ( CLEAR ?auto_258742 ) ( ON ?auto_258743 ?auto_258744 ) ( CLEAR ?auto_258743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_258742 ?auto_258743 )
      ( MAKE-9PILE ?auto_258742 ?auto_258743 ?auto_258744 ?auto_258745 ?auto_258746 ?auto_258747 ?auto_258748 ?auto_258749 ?auto_258750 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258761 - BLOCK
      ?auto_258762 - BLOCK
      ?auto_258763 - BLOCK
      ?auto_258764 - BLOCK
      ?auto_258765 - BLOCK
      ?auto_258766 - BLOCK
      ?auto_258767 - BLOCK
      ?auto_258768 - BLOCK
      ?auto_258769 - BLOCK
    )
    :vars
    (
      ?auto_258770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258769 ?auto_258770 ) ( not ( = ?auto_258761 ?auto_258762 ) ) ( not ( = ?auto_258761 ?auto_258763 ) ) ( not ( = ?auto_258761 ?auto_258764 ) ) ( not ( = ?auto_258761 ?auto_258765 ) ) ( not ( = ?auto_258761 ?auto_258766 ) ) ( not ( = ?auto_258761 ?auto_258767 ) ) ( not ( = ?auto_258761 ?auto_258768 ) ) ( not ( = ?auto_258761 ?auto_258769 ) ) ( not ( = ?auto_258761 ?auto_258770 ) ) ( not ( = ?auto_258762 ?auto_258763 ) ) ( not ( = ?auto_258762 ?auto_258764 ) ) ( not ( = ?auto_258762 ?auto_258765 ) ) ( not ( = ?auto_258762 ?auto_258766 ) ) ( not ( = ?auto_258762 ?auto_258767 ) ) ( not ( = ?auto_258762 ?auto_258768 ) ) ( not ( = ?auto_258762 ?auto_258769 ) ) ( not ( = ?auto_258762 ?auto_258770 ) ) ( not ( = ?auto_258763 ?auto_258764 ) ) ( not ( = ?auto_258763 ?auto_258765 ) ) ( not ( = ?auto_258763 ?auto_258766 ) ) ( not ( = ?auto_258763 ?auto_258767 ) ) ( not ( = ?auto_258763 ?auto_258768 ) ) ( not ( = ?auto_258763 ?auto_258769 ) ) ( not ( = ?auto_258763 ?auto_258770 ) ) ( not ( = ?auto_258764 ?auto_258765 ) ) ( not ( = ?auto_258764 ?auto_258766 ) ) ( not ( = ?auto_258764 ?auto_258767 ) ) ( not ( = ?auto_258764 ?auto_258768 ) ) ( not ( = ?auto_258764 ?auto_258769 ) ) ( not ( = ?auto_258764 ?auto_258770 ) ) ( not ( = ?auto_258765 ?auto_258766 ) ) ( not ( = ?auto_258765 ?auto_258767 ) ) ( not ( = ?auto_258765 ?auto_258768 ) ) ( not ( = ?auto_258765 ?auto_258769 ) ) ( not ( = ?auto_258765 ?auto_258770 ) ) ( not ( = ?auto_258766 ?auto_258767 ) ) ( not ( = ?auto_258766 ?auto_258768 ) ) ( not ( = ?auto_258766 ?auto_258769 ) ) ( not ( = ?auto_258766 ?auto_258770 ) ) ( not ( = ?auto_258767 ?auto_258768 ) ) ( not ( = ?auto_258767 ?auto_258769 ) ) ( not ( = ?auto_258767 ?auto_258770 ) ) ( not ( = ?auto_258768 ?auto_258769 ) ) ( not ( = ?auto_258768 ?auto_258770 ) ) ( not ( = ?auto_258769 ?auto_258770 ) ) ( ON ?auto_258768 ?auto_258769 ) ( ON ?auto_258767 ?auto_258768 ) ( ON ?auto_258766 ?auto_258767 ) ( ON ?auto_258765 ?auto_258766 ) ( ON ?auto_258764 ?auto_258765 ) ( ON ?auto_258763 ?auto_258764 ) ( ON ?auto_258762 ?auto_258763 ) ( ON ?auto_258761 ?auto_258762 ) ( CLEAR ?auto_258761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_258761 )
      ( MAKE-9PILE ?auto_258761 ?auto_258762 ?auto_258763 ?auto_258764 ?auto_258765 ?auto_258766 ?auto_258767 ?auto_258768 ?auto_258769 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258780 - BLOCK
      ?auto_258781 - BLOCK
      ?auto_258782 - BLOCK
      ?auto_258783 - BLOCK
      ?auto_258784 - BLOCK
      ?auto_258785 - BLOCK
      ?auto_258786 - BLOCK
      ?auto_258787 - BLOCK
      ?auto_258788 - BLOCK
    )
    :vars
    (
      ?auto_258789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258788 ?auto_258789 ) ( not ( = ?auto_258780 ?auto_258781 ) ) ( not ( = ?auto_258780 ?auto_258782 ) ) ( not ( = ?auto_258780 ?auto_258783 ) ) ( not ( = ?auto_258780 ?auto_258784 ) ) ( not ( = ?auto_258780 ?auto_258785 ) ) ( not ( = ?auto_258780 ?auto_258786 ) ) ( not ( = ?auto_258780 ?auto_258787 ) ) ( not ( = ?auto_258780 ?auto_258788 ) ) ( not ( = ?auto_258780 ?auto_258789 ) ) ( not ( = ?auto_258781 ?auto_258782 ) ) ( not ( = ?auto_258781 ?auto_258783 ) ) ( not ( = ?auto_258781 ?auto_258784 ) ) ( not ( = ?auto_258781 ?auto_258785 ) ) ( not ( = ?auto_258781 ?auto_258786 ) ) ( not ( = ?auto_258781 ?auto_258787 ) ) ( not ( = ?auto_258781 ?auto_258788 ) ) ( not ( = ?auto_258781 ?auto_258789 ) ) ( not ( = ?auto_258782 ?auto_258783 ) ) ( not ( = ?auto_258782 ?auto_258784 ) ) ( not ( = ?auto_258782 ?auto_258785 ) ) ( not ( = ?auto_258782 ?auto_258786 ) ) ( not ( = ?auto_258782 ?auto_258787 ) ) ( not ( = ?auto_258782 ?auto_258788 ) ) ( not ( = ?auto_258782 ?auto_258789 ) ) ( not ( = ?auto_258783 ?auto_258784 ) ) ( not ( = ?auto_258783 ?auto_258785 ) ) ( not ( = ?auto_258783 ?auto_258786 ) ) ( not ( = ?auto_258783 ?auto_258787 ) ) ( not ( = ?auto_258783 ?auto_258788 ) ) ( not ( = ?auto_258783 ?auto_258789 ) ) ( not ( = ?auto_258784 ?auto_258785 ) ) ( not ( = ?auto_258784 ?auto_258786 ) ) ( not ( = ?auto_258784 ?auto_258787 ) ) ( not ( = ?auto_258784 ?auto_258788 ) ) ( not ( = ?auto_258784 ?auto_258789 ) ) ( not ( = ?auto_258785 ?auto_258786 ) ) ( not ( = ?auto_258785 ?auto_258787 ) ) ( not ( = ?auto_258785 ?auto_258788 ) ) ( not ( = ?auto_258785 ?auto_258789 ) ) ( not ( = ?auto_258786 ?auto_258787 ) ) ( not ( = ?auto_258786 ?auto_258788 ) ) ( not ( = ?auto_258786 ?auto_258789 ) ) ( not ( = ?auto_258787 ?auto_258788 ) ) ( not ( = ?auto_258787 ?auto_258789 ) ) ( not ( = ?auto_258788 ?auto_258789 ) ) ( ON ?auto_258787 ?auto_258788 ) ( ON ?auto_258786 ?auto_258787 ) ( ON ?auto_258785 ?auto_258786 ) ( ON ?auto_258784 ?auto_258785 ) ( ON ?auto_258783 ?auto_258784 ) ( ON ?auto_258782 ?auto_258783 ) ( ON ?auto_258781 ?auto_258782 ) ( ON ?auto_258780 ?auto_258781 ) ( CLEAR ?auto_258780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_258780 )
      ( MAKE-9PILE ?auto_258780 ?auto_258781 ?auto_258782 ?auto_258783 ?auto_258784 ?auto_258785 ?auto_258786 ?auto_258787 ?auto_258788 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_258800 - BLOCK
      ?auto_258801 - BLOCK
      ?auto_258802 - BLOCK
      ?auto_258803 - BLOCK
      ?auto_258804 - BLOCK
      ?auto_258805 - BLOCK
      ?auto_258806 - BLOCK
      ?auto_258807 - BLOCK
      ?auto_258808 - BLOCK
      ?auto_258809 - BLOCK
    )
    :vars
    (
      ?auto_258810 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_258808 ) ( ON ?auto_258809 ?auto_258810 ) ( CLEAR ?auto_258809 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_258800 ) ( ON ?auto_258801 ?auto_258800 ) ( ON ?auto_258802 ?auto_258801 ) ( ON ?auto_258803 ?auto_258802 ) ( ON ?auto_258804 ?auto_258803 ) ( ON ?auto_258805 ?auto_258804 ) ( ON ?auto_258806 ?auto_258805 ) ( ON ?auto_258807 ?auto_258806 ) ( ON ?auto_258808 ?auto_258807 ) ( not ( = ?auto_258800 ?auto_258801 ) ) ( not ( = ?auto_258800 ?auto_258802 ) ) ( not ( = ?auto_258800 ?auto_258803 ) ) ( not ( = ?auto_258800 ?auto_258804 ) ) ( not ( = ?auto_258800 ?auto_258805 ) ) ( not ( = ?auto_258800 ?auto_258806 ) ) ( not ( = ?auto_258800 ?auto_258807 ) ) ( not ( = ?auto_258800 ?auto_258808 ) ) ( not ( = ?auto_258800 ?auto_258809 ) ) ( not ( = ?auto_258800 ?auto_258810 ) ) ( not ( = ?auto_258801 ?auto_258802 ) ) ( not ( = ?auto_258801 ?auto_258803 ) ) ( not ( = ?auto_258801 ?auto_258804 ) ) ( not ( = ?auto_258801 ?auto_258805 ) ) ( not ( = ?auto_258801 ?auto_258806 ) ) ( not ( = ?auto_258801 ?auto_258807 ) ) ( not ( = ?auto_258801 ?auto_258808 ) ) ( not ( = ?auto_258801 ?auto_258809 ) ) ( not ( = ?auto_258801 ?auto_258810 ) ) ( not ( = ?auto_258802 ?auto_258803 ) ) ( not ( = ?auto_258802 ?auto_258804 ) ) ( not ( = ?auto_258802 ?auto_258805 ) ) ( not ( = ?auto_258802 ?auto_258806 ) ) ( not ( = ?auto_258802 ?auto_258807 ) ) ( not ( = ?auto_258802 ?auto_258808 ) ) ( not ( = ?auto_258802 ?auto_258809 ) ) ( not ( = ?auto_258802 ?auto_258810 ) ) ( not ( = ?auto_258803 ?auto_258804 ) ) ( not ( = ?auto_258803 ?auto_258805 ) ) ( not ( = ?auto_258803 ?auto_258806 ) ) ( not ( = ?auto_258803 ?auto_258807 ) ) ( not ( = ?auto_258803 ?auto_258808 ) ) ( not ( = ?auto_258803 ?auto_258809 ) ) ( not ( = ?auto_258803 ?auto_258810 ) ) ( not ( = ?auto_258804 ?auto_258805 ) ) ( not ( = ?auto_258804 ?auto_258806 ) ) ( not ( = ?auto_258804 ?auto_258807 ) ) ( not ( = ?auto_258804 ?auto_258808 ) ) ( not ( = ?auto_258804 ?auto_258809 ) ) ( not ( = ?auto_258804 ?auto_258810 ) ) ( not ( = ?auto_258805 ?auto_258806 ) ) ( not ( = ?auto_258805 ?auto_258807 ) ) ( not ( = ?auto_258805 ?auto_258808 ) ) ( not ( = ?auto_258805 ?auto_258809 ) ) ( not ( = ?auto_258805 ?auto_258810 ) ) ( not ( = ?auto_258806 ?auto_258807 ) ) ( not ( = ?auto_258806 ?auto_258808 ) ) ( not ( = ?auto_258806 ?auto_258809 ) ) ( not ( = ?auto_258806 ?auto_258810 ) ) ( not ( = ?auto_258807 ?auto_258808 ) ) ( not ( = ?auto_258807 ?auto_258809 ) ) ( not ( = ?auto_258807 ?auto_258810 ) ) ( not ( = ?auto_258808 ?auto_258809 ) ) ( not ( = ?auto_258808 ?auto_258810 ) ) ( not ( = ?auto_258809 ?auto_258810 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_258809 ?auto_258810 )
      ( !STACK ?auto_258809 ?auto_258808 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_258821 - BLOCK
      ?auto_258822 - BLOCK
      ?auto_258823 - BLOCK
      ?auto_258824 - BLOCK
      ?auto_258825 - BLOCK
      ?auto_258826 - BLOCK
      ?auto_258827 - BLOCK
      ?auto_258828 - BLOCK
      ?auto_258829 - BLOCK
      ?auto_258830 - BLOCK
    )
    :vars
    (
      ?auto_258831 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_258829 ) ( ON ?auto_258830 ?auto_258831 ) ( CLEAR ?auto_258830 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_258821 ) ( ON ?auto_258822 ?auto_258821 ) ( ON ?auto_258823 ?auto_258822 ) ( ON ?auto_258824 ?auto_258823 ) ( ON ?auto_258825 ?auto_258824 ) ( ON ?auto_258826 ?auto_258825 ) ( ON ?auto_258827 ?auto_258826 ) ( ON ?auto_258828 ?auto_258827 ) ( ON ?auto_258829 ?auto_258828 ) ( not ( = ?auto_258821 ?auto_258822 ) ) ( not ( = ?auto_258821 ?auto_258823 ) ) ( not ( = ?auto_258821 ?auto_258824 ) ) ( not ( = ?auto_258821 ?auto_258825 ) ) ( not ( = ?auto_258821 ?auto_258826 ) ) ( not ( = ?auto_258821 ?auto_258827 ) ) ( not ( = ?auto_258821 ?auto_258828 ) ) ( not ( = ?auto_258821 ?auto_258829 ) ) ( not ( = ?auto_258821 ?auto_258830 ) ) ( not ( = ?auto_258821 ?auto_258831 ) ) ( not ( = ?auto_258822 ?auto_258823 ) ) ( not ( = ?auto_258822 ?auto_258824 ) ) ( not ( = ?auto_258822 ?auto_258825 ) ) ( not ( = ?auto_258822 ?auto_258826 ) ) ( not ( = ?auto_258822 ?auto_258827 ) ) ( not ( = ?auto_258822 ?auto_258828 ) ) ( not ( = ?auto_258822 ?auto_258829 ) ) ( not ( = ?auto_258822 ?auto_258830 ) ) ( not ( = ?auto_258822 ?auto_258831 ) ) ( not ( = ?auto_258823 ?auto_258824 ) ) ( not ( = ?auto_258823 ?auto_258825 ) ) ( not ( = ?auto_258823 ?auto_258826 ) ) ( not ( = ?auto_258823 ?auto_258827 ) ) ( not ( = ?auto_258823 ?auto_258828 ) ) ( not ( = ?auto_258823 ?auto_258829 ) ) ( not ( = ?auto_258823 ?auto_258830 ) ) ( not ( = ?auto_258823 ?auto_258831 ) ) ( not ( = ?auto_258824 ?auto_258825 ) ) ( not ( = ?auto_258824 ?auto_258826 ) ) ( not ( = ?auto_258824 ?auto_258827 ) ) ( not ( = ?auto_258824 ?auto_258828 ) ) ( not ( = ?auto_258824 ?auto_258829 ) ) ( not ( = ?auto_258824 ?auto_258830 ) ) ( not ( = ?auto_258824 ?auto_258831 ) ) ( not ( = ?auto_258825 ?auto_258826 ) ) ( not ( = ?auto_258825 ?auto_258827 ) ) ( not ( = ?auto_258825 ?auto_258828 ) ) ( not ( = ?auto_258825 ?auto_258829 ) ) ( not ( = ?auto_258825 ?auto_258830 ) ) ( not ( = ?auto_258825 ?auto_258831 ) ) ( not ( = ?auto_258826 ?auto_258827 ) ) ( not ( = ?auto_258826 ?auto_258828 ) ) ( not ( = ?auto_258826 ?auto_258829 ) ) ( not ( = ?auto_258826 ?auto_258830 ) ) ( not ( = ?auto_258826 ?auto_258831 ) ) ( not ( = ?auto_258827 ?auto_258828 ) ) ( not ( = ?auto_258827 ?auto_258829 ) ) ( not ( = ?auto_258827 ?auto_258830 ) ) ( not ( = ?auto_258827 ?auto_258831 ) ) ( not ( = ?auto_258828 ?auto_258829 ) ) ( not ( = ?auto_258828 ?auto_258830 ) ) ( not ( = ?auto_258828 ?auto_258831 ) ) ( not ( = ?auto_258829 ?auto_258830 ) ) ( not ( = ?auto_258829 ?auto_258831 ) ) ( not ( = ?auto_258830 ?auto_258831 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_258830 ?auto_258831 )
      ( !STACK ?auto_258830 ?auto_258829 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_258842 - BLOCK
      ?auto_258843 - BLOCK
      ?auto_258844 - BLOCK
      ?auto_258845 - BLOCK
      ?auto_258846 - BLOCK
      ?auto_258847 - BLOCK
      ?auto_258848 - BLOCK
      ?auto_258849 - BLOCK
      ?auto_258850 - BLOCK
      ?auto_258851 - BLOCK
    )
    :vars
    (
      ?auto_258852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258851 ?auto_258852 ) ( ON-TABLE ?auto_258842 ) ( ON ?auto_258843 ?auto_258842 ) ( ON ?auto_258844 ?auto_258843 ) ( ON ?auto_258845 ?auto_258844 ) ( ON ?auto_258846 ?auto_258845 ) ( ON ?auto_258847 ?auto_258846 ) ( ON ?auto_258848 ?auto_258847 ) ( ON ?auto_258849 ?auto_258848 ) ( not ( = ?auto_258842 ?auto_258843 ) ) ( not ( = ?auto_258842 ?auto_258844 ) ) ( not ( = ?auto_258842 ?auto_258845 ) ) ( not ( = ?auto_258842 ?auto_258846 ) ) ( not ( = ?auto_258842 ?auto_258847 ) ) ( not ( = ?auto_258842 ?auto_258848 ) ) ( not ( = ?auto_258842 ?auto_258849 ) ) ( not ( = ?auto_258842 ?auto_258850 ) ) ( not ( = ?auto_258842 ?auto_258851 ) ) ( not ( = ?auto_258842 ?auto_258852 ) ) ( not ( = ?auto_258843 ?auto_258844 ) ) ( not ( = ?auto_258843 ?auto_258845 ) ) ( not ( = ?auto_258843 ?auto_258846 ) ) ( not ( = ?auto_258843 ?auto_258847 ) ) ( not ( = ?auto_258843 ?auto_258848 ) ) ( not ( = ?auto_258843 ?auto_258849 ) ) ( not ( = ?auto_258843 ?auto_258850 ) ) ( not ( = ?auto_258843 ?auto_258851 ) ) ( not ( = ?auto_258843 ?auto_258852 ) ) ( not ( = ?auto_258844 ?auto_258845 ) ) ( not ( = ?auto_258844 ?auto_258846 ) ) ( not ( = ?auto_258844 ?auto_258847 ) ) ( not ( = ?auto_258844 ?auto_258848 ) ) ( not ( = ?auto_258844 ?auto_258849 ) ) ( not ( = ?auto_258844 ?auto_258850 ) ) ( not ( = ?auto_258844 ?auto_258851 ) ) ( not ( = ?auto_258844 ?auto_258852 ) ) ( not ( = ?auto_258845 ?auto_258846 ) ) ( not ( = ?auto_258845 ?auto_258847 ) ) ( not ( = ?auto_258845 ?auto_258848 ) ) ( not ( = ?auto_258845 ?auto_258849 ) ) ( not ( = ?auto_258845 ?auto_258850 ) ) ( not ( = ?auto_258845 ?auto_258851 ) ) ( not ( = ?auto_258845 ?auto_258852 ) ) ( not ( = ?auto_258846 ?auto_258847 ) ) ( not ( = ?auto_258846 ?auto_258848 ) ) ( not ( = ?auto_258846 ?auto_258849 ) ) ( not ( = ?auto_258846 ?auto_258850 ) ) ( not ( = ?auto_258846 ?auto_258851 ) ) ( not ( = ?auto_258846 ?auto_258852 ) ) ( not ( = ?auto_258847 ?auto_258848 ) ) ( not ( = ?auto_258847 ?auto_258849 ) ) ( not ( = ?auto_258847 ?auto_258850 ) ) ( not ( = ?auto_258847 ?auto_258851 ) ) ( not ( = ?auto_258847 ?auto_258852 ) ) ( not ( = ?auto_258848 ?auto_258849 ) ) ( not ( = ?auto_258848 ?auto_258850 ) ) ( not ( = ?auto_258848 ?auto_258851 ) ) ( not ( = ?auto_258848 ?auto_258852 ) ) ( not ( = ?auto_258849 ?auto_258850 ) ) ( not ( = ?auto_258849 ?auto_258851 ) ) ( not ( = ?auto_258849 ?auto_258852 ) ) ( not ( = ?auto_258850 ?auto_258851 ) ) ( not ( = ?auto_258850 ?auto_258852 ) ) ( not ( = ?auto_258851 ?auto_258852 ) ) ( CLEAR ?auto_258849 ) ( ON ?auto_258850 ?auto_258851 ) ( CLEAR ?auto_258850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_258842 ?auto_258843 ?auto_258844 ?auto_258845 ?auto_258846 ?auto_258847 ?auto_258848 ?auto_258849 ?auto_258850 )
      ( MAKE-10PILE ?auto_258842 ?auto_258843 ?auto_258844 ?auto_258845 ?auto_258846 ?auto_258847 ?auto_258848 ?auto_258849 ?auto_258850 ?auto_258851 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_258863 - BLOCK
      ?auto_258864 - BLOCK
      ?auto_258865 - BLOCK
      ?auto_258866 - BLOCK
      ?auto_258867 - BLOCK
      ?auto_258868 - BLOCK
      ?auto_258869 - BLOCK
      ?auto_258870 - BLOCK
      ?auto_258871 - BLOCK
      ?auto_258872 - BLOCK
    )
    :vars
    (
      ?auto_258873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258872 ?auto_258873 ) ( ON-TABLE ?auto_258863 ) ( ON ?auto_258864 ?auto_258863 ) ( ON ?auto_258865 ?auto_258864 ) ( ON ?auto_258866 ?auto_258865 ) ( ON ?auto_258867 ?auto_258866 ) ( ON ?auto_258868 ?auto_258867 ) ( ON ?auto_258869 ?auto_258868 ) ( ON ?auto_258870 ?auto_258869 ) ( not ( = ?auto_258863 ?auto_258864 ) ) ( not ( = ?auto_258863 ?auto_258865 ) ) ( not ( = ?auto_258863 ?auto_258866 ) ) ( not ( = ?auto_258863 ?auto_258867 ) ) ( not ( = ?auto_258863 ?auto_258868 ) ) ( not ( = ?auto_258863 ?auto_258869 ) ) ( not ( = ?auto_258863 ?auto_258870 ) ) ( not ( = ?auto_258863 ?auto_258871 ) ) ( not ( = ?auto_258863 ?auto_258872 ) ) ( not ( = ?auto_258863 ?auto_258873 ) ) ( not ( = ?auto_258864 ?auto_258865 ) ) ( not ( = ?auto_258864 ?auto_258866 ) ) ( not ( = ?auto_258864 ?auto_258867 ) ) ( not ( = ?auto_258864 ?auto_258868 ) ) ( not ( = ?auto_258864 ?auto_258869 ) ) ( not ( = ?auto_258864 ?auto_258870 ) ) ( not ( = ?auto_258864 ?auto_258871 ) ) ( not ( = ?auto_258864 ?auto_258872 ) ) ( not ( = ?auto_258864 ?auto_258873 ) ) ( not ( = ?auto_258865 ?auto_258866 ) ) ( not ( = ?auto_258865 ?auto_258867 ) ) ( not ( = ?auto_258865 ?auto_258868 ) ) ( not ( = ?auto_258865 ?auto_258869 ) ) ( not ( = ?auto_258865 ?auto_258870 ) ) ( not ( = ?auto_258865 ?auto_258871 ) ) ( not ( = ?auto_258865 ?auto_258872 ) ) ( not ( = ?auto_258865 ?auto_258873 ) ) ( not ( = ?auto_258866 ?auto_258867 ) ) ( not ( = ?auto_258866 ?auto_258868 ) ) ( not ( = ?auto_258866 ?auto_258869 ) ) ( not ( = ?auto_258866 ?auto_258870 ) ) ( not ( = ?auto_258866 ?auto_258871 ) ) ( not ( = ?auto_258866 ?auto_258872 ) ) ( not ( = ?auto_258866 ?auto_258873 ) ) ( not ( = ?auto_258867 ?auto_258868 ) ) ( not ( = ?auto_258867 ?auto_258869 ) ) ( not ( = ?auto_258867 ?auto_258870 ) ) ( not ( = ?auto_258867 ?auto_258871 ) ) ( not ( = ?auto_258867 ?auto_258872 ) ) ( not ( = ?auto_258867 ?auto_258873 ) ) ( not ( = ?auto_258868 ?auto_258869 ) ) ( not ( = ?auto_258868 ?auto_258870 ) ) ( not ( = ?auto_258868 ?auto_258871 ) ) ( not ( = ?auto_258868 ?auto_258872 ) ) ( not ( = ?auto_258868 ?auto_258873 ) ) ( not ( = ?auto_258869 ?auto_258870 ) ) ( not ( = ?auto_258869 ?auto_258871 ) ) ( not ( = ?auto_258869 ?auto_258872 ) ) ( not ( = ?auto_258869 ?auto_258873 ) ) ( not ( = ?auto_258870 ?auto_258871 ) ) ( not ( = ?auto_258870 ?auto_258872 ) ) ( not ( = ?auto_258870 ?auto_258873 ) ) ( not ( = ?auto_258871 ?auto_258872 ) ) ( not ( = ?auto_258871 ?auto_258873 ) ) ( not ( = ?auto_258872 ?auto_258873 ) ) ( CLEAR ?auto_258870 ) ( ON ?auto_258871 ?auto_258872 ) ( CLEAR ?auto_258871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_258863 ?auto_258864 ?auto_258865 ?auto_258866 ?auto_258867 ?auto_258868 ?auto_258869 ?auto_258870 ?auto_258871 )
      ( MAKE-10PILE ?auto_258863 ?auto_258864 ?auto_258865 ?auto_258866 ?auto_258867 ?auto_258868 ?auto_258869 ?auto_258870 ?auto_258871 ?auto_258872 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_258884 - BLOCK
      ?auto_258885 - BLOCK
      ?auto_258886 - BLOCK
      ?auto_258887 - BLOCK
      ?auto_258888 - BLOCK
      ?auto_258889 - BLOCK
      ?auto_258890 - BLOCK
      ?auto_258891 - BLOCK
      ?auto_258892 - BLOCK
      ?auto_258893 - BLOCK
    )
    :vars
    (
      ?auto_258894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258893 ?auto_258894 ) ( ON-TABLE ?auto_258884 ) ( ON ?auto_258885 ?auto_258884 ) ( ON ?auto_258886 ?auto_258885 ) ( ON ?auto_258887 ?auto_258886 ) ( ON ?auto_258888 ?auto_258887 ) ( ON ?auto_258889 ?auto_258888 ) ( ON ?auto_258890 ?auto_258889 ) ( not ( = ?auto_258884 ?auto_258885 ) ) ( not ( = ?auto_258884 ?auto_258886 ) ) ( not ( = ?auto_258884 ?auto_258887 ) ) ( not ( = ?auto_258884 ?auto_258888 ) ) ( not ( = ?auto_258884 ?auto_258889 ) ) ( not ( = ?auto_258884 ?auto_258890 ) ) ( not ( = ?auto_258884 ?auto_258891 ) ) ( not ( = ?auto_258884 ?auto_258892 ) ) ( not ( = ?auto_258884 ?auto_258893 ) ) ( not ( = ?auto_258884 ?auto_258894 ) ) ( not ( = ?auto_258885 ?auto_258886 ) ) ( not ( = ?auto_258885 ?auto_258887 ) ) ( not ( = ?auto_258885 ?auto_258888 ) ) ( not ( = ?auto_258885 ?auto_258889 ) ) ( not ( = ?auto_258885 ?auto_258890 ) ) ( not ( = ?auto_258885 ?auto_258891 ) ) ( not ( = ?auto_258885 ?auto_258892 ) ) ( not ( = ?auto_258885 ?auto_258893 ) ) ( not ( = ?auto_258885 ?auto_258894 ) ) ( not ( = ?auto_258886 ?auto_258887 ) ) ( not ( = ?auto_258886 ?auto_258888 ) ) ( not ( = ?auto_258886 ?auto_258889 ) ) ( not ( = ?auto_258886 ?auto_258890 ) ) ( not ( = ?auto_258886 ?auto_258891 ) ) ( not ( = ?auto_258886 ?auto_258892 ) ) ( not ( = ?auto_258886 ?auto_258893 ) ) ( not ( = ?auto_258886 ?auto_258894 ) ) ( not ( = ?auto_258887 ?auto_258888 ) ) ( not ( = ?auto_258887 ?auto_258889 ) ) ( not ( = ?auto_258887 ?auto_258890 ) ) ( not ( = ?auto_258887 ?auto_258891 ) ) ( not ( = ?auto_258887 ?auto_258892 ) ) ( not ( = ?auto_258887 ?auto_258893 ) ) ( not ( = ?auto_258887 ?auto_258894 ) ) ( not ( = ?auto_258888 ?auto_258889 ) ) ( not ( = ?auto_258888 ?auto_258890 ) ) ( not ( = ?auto_258888 ?auto_258891 ) ) ( not ( = ?auto_258888 ?auto_258892 ) ) ( not ( = ?auto_258888 ?auto_258893 ) ) ( not ( = ?auto_258888 ?auto_258894 ) ) ( not ( = ?auto_258889 ?auto_258890 ) ) ( not ( = ?auto_258889 ?auto_258891 ) ) ( not ( = ?auto_258889 ?auto_258892 ) ) ( not ( = ?auto_258889 ?auto_258893 ) ) ( not ( = ?auto_258889 ?auto_258894 ) ) ( not ( = ?auto_258890 ?auto_258891 ) ) ( not ( = ?auto_258890 ?auto_258892 ) ) ( not ( = ?auto_258890 ?auto_258893 ) ) ( not ( = ?auto_258890 ?auto_258894 ) ) ( not ( = ?auto_258891 ?auto_258892 ) ) ( not ( = ?auto_258891 ?auto_258893 ) ) ( not ( = ?auto_258891 ?auto_258894 ) ) ( not ( = ?auto_258892 ?auto_258893 ) ) ( not ( = ?auto_258892 ?auto_258894 ) ) ( not ( = ?auto_258893 ?auto_258894 ) ) ( ON ?auto_258892 ?auto_258893 ) ( CLEAR ?auto_258890 ) ( ON ?auto_258891 ?auto_258892 ) ( CLEAR ?auto_258891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_258884 ?auto_258885 ?auto_258886 ?auto_258887 ?auto_258888 ?auto_258889 ?auto_258890 ?auto_258891 )
      ( MAKE-10PILE ?auto_258884 ?auto_258885 ?auto_258886 ?auto_258887 ?auto_258888 ?auto_258889 ?auto_258890 ?auto_258891 ?auto_258892 ?auto_258893 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_258905 - BLOCK
      ?auto_258906 - BLOCK
      ?auto_258907 - BLOCK
      ?auto_258908 - BLOCK
      ?auto_258909 - BLOCK
      ?auto_258910 - BLOCK
      ?auto_258911 - BLOCK
      ?auto_258912 - BLOCK
      ?auto_258913 - BLOCK
      ?auto_258914 - BLOCK
    )
    :vars
    (
      ?auto_258915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258914 ?auto_258915 ) ( ON-TABLE ?auto_258905 ) ( ON ?auto_258906 ?auto_258905 ) ( ON ?auto_258907 ?auto_258906 ) ( ON ?auto_258908 ?auto_258907 ) ( ON ?auto_258909 ?auto_258908 ) ( ON ?auto_258910 ?auto_258909 ) ( ON ?auto_258911 ?auto_258910 ) ( not ( = ?auto_258905 ?auto_258906 ) ) ( not ( = ?auto_258905 ?auto_258907 ) ) ( not ( = ?auto_258905 ?auto_258908 ) ) ( not ( = ?auto_258905 ?auto_258909 ) ) ( not ( = ?auto_258905 ?auto_258910 ) ) ( not ( = ?auto_258905 ?auto_258911 ) ) ( not ( = ?auto_258905 ?auto_258912 ) ) ( not ( = ?auto_258905 ?auto_258913 ) ) ( not ( = ?auto_258905 ?auto_258914 ) ) ( not ( = ?auto_258905 ?auto_258915 ) ) ( not ( = ?auto_258906 ?auto_258907 ) ) ( not ( = ?auto_258906 ?auto_258908 ) ) ( not ( = ?auto_258906 ?auto_258909 ) ) ( not ( = ?auto_258906 ?auto_258910 ) ) ( not ( = ?auto_258906 ?auto_258911 ) ) ( not ( = ?auto_258906 ?auto_258912 ) ) ( not ( = ?auto_258906 ?auto_258913 ) ) ( not ( = ?auto_258906 ?auto_258914 ) ) ( not ( = ?auto_258906 ?auto_258915 ) ) ( not ( = ?auto_258907 ?auto_258908 ) ) ( not ( = ?auto_258907 ?auto_258909 ) ) ( not ( = ?auto_258907 ?auto_258910 ) ) ( not ( = ?auto_258907 ?auto_258911 ) ) ( not ( = ?auto_258907 ?auto_258912 ) ) ( not ( = ?auto_258907 ?auto_258913 ) ) ( not ( = ?auto_258907 ?auto_258914 ) ) ( not ( = ?auto_258907 ?auto_258915 ) ) ( not ( = ?auto_258908 ?auto_258909 ) ) ( not ( = ?auto_258908 ?auto_258910 ) ) ( not ( = ?auto_258908 ?auto_258911 ) ) ( not ( = ?auto_258908 ?auto_258912 ) ) ( not ( = ?auto_258908 ?auto_258913 ) ) ( not ( = ?auto_258908 ?auto_258914 ) ) ( not ( = ?auto_258908 ?auto_258915 ) ) ( not ( = ?auto_258909 ?auto_258910 ) ) ( not ( = ?auto_258909 ?auto_258911 ) ) ( not ( = ?auto_258909 ?auto_258912 ) ) ( not ( = ?auto_258909 ?auto_258913 ) ) ( not ( = ?auto_258909 ?auto_258914 ) ) ( not ( = ?auto_258909 ?auto_258915 ) ) ( not ( = ?auto_258910 ?auto_258911 ) ) ( not ( = ?auto_258910 ?auto_258912 ) ) ( not ( = ?auto_258910 ?auto_258913 ) ) ( not ( = ?auto_258910 ?auto_258914 ) ) ( not ( = ?auto_258910 ?auto_258915 ) ) ( not ( = ?auto_258911 ?auto_258912 ) ) ( not ( = ?auto_258911 ?auto_258913 ) ) ( not ( = ?auto_258911 ?auto_258914 ) ) ( not ( = ?auto_258911 ?auto_258915 ) ) ( not ( = ?auto_258912 ?auto_258913 ) ) ( not ( = ?auto_258912 ?auto_258914 ) ) ( not ( = ?auto_258912 ?auto_258915 ) ) ( not ( = ?auto_258913 ?auto_258914 ) ) ( not ( = ?auto_258913 ?auto_258915 ) ) ( not ( = ?auto_258914 ?auto_258915 ) ) ( ON ?auto_258913 ?auto_258914 ) ( CLEAR ?auto_258911 ) ( ON ?auto_258912 ?auto_258913 ) ( CLEAR ?auto_258912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_258905 ?auto_258906 ?auto_258907 ?auto_258908 ?auto_258909 ?auto_258910 ?auto_258911 ?auto_258912 )
      ( MAKE-10PILE ?auto_258905 ?auto_258906 ?auto_258907 ?auto_258908 ?auto_258909 ?auto_258910 ?auto_258911 ?auto_258912 ?auto_258913 ?auto_258914 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_258926 - BLOCK
      ?auto_258927 - BLOCK
      ?auto_258928 - BLOCK
      ?auto_258929 - BLOCK
      ?auto_258930 - BLOCK
      ?auto_258931 - BLOCK
      ?auto_258932 - BLOCK
      ?auto_258933 - BLOCK
      ?auto_258934 - BLOCK
      ?auto_258935 - BLOCK
    )
    :vars
    (
      ?auto_258936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258935 ?auto_258936 ) ( ON-TABLE ?auto_258926 ) ( ON ?auto_258927 ?auto_258926 ) ( ON ?auto_258928 ?auto_258927 ) ( ON ?auto_258929 ?auto_258928 ) ( ON ?auto_258930 ?auto_258929 ) ( ON ?auto_258931 ?auto_258930 ) ( not ( = ?auto_258926 ?auto_258927 ) ) ( not ( = ?auto_258926 ?auto_258928 ) ) ( not ( = ?auto_258926 ?auto_258929 ) ) ( not ( = ?auto_258926 ?auto_258930 ) ) ( not ( = ?auto_258926 ?auto_258931 ) ) ( not ( = ?auto_258926 ?auto_258932 ) ) ( not ( = ?auto_258926 ?auto_258933 ) ) ( not ( = ?auto_258926 ?auto_258934 ) ) ( not ( = ?auto_258926 ?auto_258935 ) ) ( not ( = ?auto_258926 ?auto_258936 ) ) ( not ( = ?auto_258927 ?auto_258928 ) ) ( not ( = ?auto_258927 ?auto_258929 ) ) ( not ( = ?auto_258927 ?auto_258930 ) ) ( not ( = ?auto_258927 ?auto_258931 ) ) ( not ( = ?auto_258927 ?auto_258932 ) ) ( not ( = ?auto_258927 ?auto_258933 ) ) ( not ( = ?auto_258927 ?auto_258934 ) ) ( not ( = ?auto_258927 ?auto_258935 ) ) ( not ( = ?auto_258927 ?auto_258936 ) ) ( not ( = ?auto_258928 ?auto_258929 ) ) ( not ( = ?auto_258928 ?auto_258930 ) ) ( not ( = ?auto_258928 ?auto_258931 ) ) ( not ( = ?auto_258928 ?auto_258932 ) ) ( not ( = ?auto_258928 ?auto_258933 ) ) ( not ( = ?auto_258928 ?auto_258934 ) ) ( not ( = ?auto_258928 ?auto_258935 ) ) ( not ( = ?auto_258928 ?auto_258936 ) ) ( not ( = ?auto_258929 ?auto_258930 ) ) ( not ( = ?auto_258929 ?auto_258931 ) ) ( not ( = ?auto_258929 ?auto_258932 ) ) ( not ( = ?auto_258929 ?auto_258933 ) ) ( not ( = ?auto_258929 ?auto_258934 ) ) ( not ( = ?auto_258929 ?auto_258935 ) ) ( not ( = ?auto_258929 ?auto_258936 ) ) ( not ( = ?auto_258930 ?auto_258931 ) ) ( not ( = ?auto_258930 ?auto_258932 ) ) ( not ( = ?auto_258930 ?auto_258933 ) ) ( not ( = ?auto_258930 ?auto_258934 ) ) ( not ( = ?auto_258930 ?auto_258935 ) ) ( not ( = ?auto_258930 ?auto_258936 ) ) ( not ( = ?auto_258931 ?auto_258932 ) ) ( not ( = ?auto_258931 ?auto_258933 ) ) ( not ( = ?auto_258931 ?auto_258934 ) ) ( not ( = ?auto_258931 ?auto_258935 ) ) ( not ( = ?auto_258931 ?auto_258936 ) ) ( not ( = ?auto_258932 ?auto_258933 ) ) ( not ( = ?auto_258932 ?auto_258934 ) ) ( not ( = ?auto_258932 ?auto_258935 ) ) ( not ( = ?auto_258932 ?auto_258936 ) ) ( not ( = ?auto_258933 ?auto_258934 ) ) ( not ( = ?auto_258933 ?auto_258935 ) ) ( not ( = ?auto_258933 ?auto_258936 ) ) ( not ( = ?auto_258934 ?auto_258935 ) ) ( not ( = ?auto_258934 ?auto_258936 ) ) ( not ( = ?auto_258935 ?auto_258936 ) ) ( ON ?auto_258934 ?auto_258935 ) ( ON ?auto_258933 ?auto_258934 ) ( CLEAR ?auto_258931 ) ( ON ?auto_258932 ?auto_258933 ) ( CLEAR ?auto_258932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_258926 ?auto_258927 ?auto_258928 ?auto_258929 ?auto_258930 ?auto_258931 ?auto_258932 )
      ( MAKE-10PILE ?auto_258926 ?auto_258927 ?auto_258928 ?auto_258929 ?auto_258930 ?auto_258931 ?auto_258932 ?auto_258933 ?auto_258934 ?auto_258935 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_258947 - BLOCK
      ?auto_258948 - BLOCK
      ?auto_258949 - BLOCK
      ?auto_258950 - BLOCK
      ?auto_258951 - BLOCK
      ?auto_258952 - BLOCK
      ?auto_258953 - BLOCK
      ?auto_258954 - BLOCK
      ?auto_258955 - BLOCK
      ?auto_258956 - BLOCK
    )
    :vars
    (
      ?auto_258957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258956 ?auto_258957 ) ( ON-TABLE ?auto_258947 ) ( ON ?auto_258948 ?auto_258947 ) ( ON ?auto_258949 ?auto_258948 ) ( ON ?auto_258950 ?auto_258949 ) ( ON ?auto_258951 ?auto_258950 ) ( ON ?auto_258952 ?auto_258951 ) ( not ( = ?auto_258947 ?auto_258948 ) ) ( not ( = ?auto_258947 ?auto_258949 ) ) ( not ( = ?auto_258947 ?auto_258950 ) ) ( not ( = ?auto_258947 ?auto_258951 ) ) ( not ( = ?auto_258947 ?auto_258952 ) ) ( not ( = ?auto_258947 ?auto_258953 ) ) ( not ( = ?auto_258947 ?auto_258954 ) ) ( not ( = ?auto_258947 ?auto_258955 ) ) ( not ( = ?auto_258947 ?auto_258956 ) ) ( not ( = ?auto_258947 ?auto_258957 ) ) ( not ( = ?auto_258948 ?auto_258949 ) ) ( not ( = ?auto_258948 ?auto_258950 ) ) ( not ( = ?auto_258948 ?auto_258951 ) ) ( not ( = ?auto_258948 ?auto_258952 ) ) ( not ( = ?auto_258948 ?auto_258953 ) ) ( not ( = ?auto_258948 ?auto_258954 ) ) ( not ( = ?auto_258948 ?auto_258955 ) ) ( not ( = ?auto_258948 ?auto_258956 ) ) ( not ( = ?auto_258948 ?auto_258957 ) ) ( not ( = ?auto_258949 ?auto_258950 ) ) ( not ( = ?auto_258949 ?auto_258951 ) ) ( not ( = ?auto_258949 ?auto_258952 ) ) ( not ( = ?auto_258949 ?auto_258953 ) ) ( not ( = ?auto_258949 ?auto_258954 ) ) ( not ( = ?auto_258949 ?auto_258955 ) ) ( not ( = ?auto_258949 ?auto_258956 ) ) ( not ( = ?auto_258949 ?auto_258957 ) ) ( not ( = ?auto_258950 ?auto_258951 ) ) ( not ( = ?auto_258950 ?auto_258952 ) ) ( not ( = ?auto_258950 ?auto_258953 ) ) ( not ( = ?auto_258950 ?auto_258954 ) ) ( not ( = ?auto_258950 ?auto_258955 ) ) ( not ( = ?auto_258950 ?auto_258956 ) ) ( not ( = ?auto_258950 ?auto_258957 ) ) ( not ( = ?auto_258951 ?auto_258952 ) ) ( not ( = ?auto_258951 ?auto_258953 ) ) ( not ( = ?auto_258951 ?auto_258954 ) ) ( not ( = ?auto_258951 ?auto_258955 ) ) ( not ( = ?auto_258951 ?auto_258956 ) ) ( not ( = ?auto_258951 ?auto_258957 ) ) ( not ( = ?auto_258952 ?auto_258953 ) ) ( not ( = ?auto_258952 ?auto_258954 ) ) ( not ( = ?auto_258952 ?auto_258955 ) ) ( not ( = ?auto_258952 ?auto_258956 ) ) ( not ( = ?auto_258952 ?auto_258957 ) ) ( not ( = ?auto_258953 ?auto_258954 ) ) ( not ( = ?auto_258953 ?auto_258955 ) ) ( not ( = ?auto_258953 ?auto_258956 ) ) ( not ( = ?auto_258953 ?auto_258957 ) ) ( not ( = ?auto_258954 ?auto_258955 ) ) ( not ( = ?auto_258954 ?auto_258956 ) ) ( not ( = ?auto_258954 ?auto_258957 ) ) ( not ( = ?auto_258955 ?auto_258956 ) ) ( not ( = ?auto_258955 ?auto_258957 ) ) ( not ( = ?auto_258956 ?auto_258957 ) ) ( ON ?auto_258955 ?auto_258956 ) ( ON ?auto_258954 ?auto_258955 ) ( CLEAR ?auto_258952 ) ( ON ?auto_258953 ?auto_258954 ) ( CLEAR ?auto_258953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_258947 ?auto_258948 ?auto_258949 ?auto_258950 ?auto_258951 ?auto_258952 ?auto_258953 )
      ( MAKE-10PILE ?auto_258947 ?auto_258948 ?auto_258949 ?auto_258950 ?auto_258951 ?auto_258952 ?auto_258953 ?auto_258954 ?auto_258955 ?auto_258956 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_258968 - BLOCK
      ?auto_258969 - BLOCK
      ?auto_258970 - BLOCK
      ?auto_258971 - BLOCK
      ?auto_258972 - BLOCK
      ?auto_258973 - BLOCK
      ?auto_258974 - BLOCK
      ?auto_258975 - BLOCK
      ?auto_258976 - BLOCK
      ?auto_258977 - BLOCK
    )
    :vars
    (
      ?auto_258978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258977 ?auto_258978 ) ( ON-TABLE ?auto_258968 ) ( ON ?auto_258969 ?auto_258968 ) ( ON ?auto_258970 ?auto_258969 ) ( ON ?auto_258971 ?auto_258970 ) ( ON ?auto_258972 ?auto_258971 ) ( not ( = ?auto_258968 ?auto_258969 ) ) ( not ( = ?auto_258968 ?auto_258970 ) ) ( not ( = ?auto_258968 ?auto_258971 ) ) ( not ( = ?auto_258968 ?auto_258972 ) ) ( not ( = ?auto_258968 ?auto_258973 ) ) ( not ( = ?auto_258968 ?auto_258974 ) ) ( not ( = ?auto_258968 ?auto_258975 ) ) ( not ( = ?auto_258968 ?auto_258976 ) ) ( not ( = ?auto_258968 ?auto_258977 ) ) ( not ( = ?auto_258968 ?auto_258978 ) ) ( not ( = ?auto_258969 ?auto_258970 ) ) ( not ( = ?auto_258969 ?auto_258971 ) ) ( not ( = ?auto_258969 ?auto_258972 ) ) ( not ( = ?auto_258969 ?auto_258973 ) ) ( not ( = ?auto_258969 ?auto_258974 ) ) ( not ( = ?auto_258969 ?auto_258975 ) ) ( not ( = ?auto_258969 ?auto_258976 ) ) ( not ( = ?auto_258969 ?auto_258977 ) ) ( not ( = ?auto_258969 ?auto_258978 ) ) ( not ( = ?auto_258970 ?auto_258971 ) ) ( not ( = ?auto_258970 ?auto_258972 ) ) ( not ( = ?auto_258970 ?auto_258973 ) ) ( not ( = ?auto_258970 ?auto_258974 ) ) ( not ( = ?auto_258970 ?auto_258975 ) ) ( not ( = ?auto_258970 ?auto_258976 ) ) ( not ( = ?auto_258970 ?auto_258977 ) ) ( not ( = ?auto_258970 ?auto_258978 ) ) ( not ( = ?auto_258971 ?auto_258972 ) ) ( not ( = ?auto_258971 ?auto_258973 ) ) ( not ( = ?auto_258971 ?auto_258974 ) ) ( not ( = ?auto_258971 ?auto_258975 ) ) ( not ( = ?auto_258971 ?auto_258976 ) ) ( not ( = ?auto_258971 ?auto_258977 ) ) ( not ( = ?auto_258971 ?auto_258978 ) ) ( not ( = ?auto_258972 ?auto_258973 ) ) ( not ( = ?auto_258972 ?auto_258974 ) ) ( not ( = ?auto_258972 ?auto_258975 ) ) ( not ( = ?auto_258972 ?auto_258976 ) ) ( not ( = ?auto_258972 ?auto_258977 ) ) ( not ( = ?auto_258972 ?auto_258978 ) ) ( not ( = ?auto_258973 ?auto_258974 ) ) ( not ( = ?auto_258973 ?auto_258975 ) ) ( not ( = ?auto_258973 ?auto_258976 ) ) ( not ( = ?auto_258973 ?auto_258977 ) ) ( not ( = ?auto_258973 ?auto_258978 ) ) ( not ( = ?auto_258974 ?auto_258975 ) ) ( not ( = ?auto_258974 ?auto_258976 ) ) ( not ( = ?auto_258974 ?auto_258977 ) ) ( not ( = ?auto_258974 ?auto_258978 ) ) ( not ( = ?auto_258975 ?auto_258976 ) ) ( not ( = ?auto_258975 ?auto_258977 ) ) ( not ( = ?auto_258975 ?auto_258978 ) ) ( not ( = ?auto_258976 ?auto_258977 ) ) ( not ( = ?auto_258976 ?auto_258978 ) ) ( not ( = ?auto_258977 ?auto_258978 ) ) ( ON ?auto_258976 ?auto_258977 ) ( ON ?auto_258975 ?auto_258976 ) ( ON ?auto_258974 ?auto_258975 ) ( CLEAR ?auto_258972 ) ( ON ?auto_258973 ?auto_258974 ) ( CLEAR ?auto_258973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_258968 ?auto_258969 ?auto_258970 ?auto_258971 ?auto_258972 ?auto_258973 )
      ( MAKE-10PILE ?auto_258968 ?auto_258969 ?auto_258970 ?auto_258971 ?auto_258972 ?auto_258973 ?auto_258974 ?auto_258975 ?auto_258976 ?auto_258977 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_258989 - BLOCK
      ?auto_258990 - BLOCK
      ?auto_258991 - BLOCK
      ?auto_258992 - BLOCK
      ?auto_258993 - BLOCK
      ?auto_258994 - BLOCK
      ?auto_258995 - BLOCK
      ?auto_258996 - BLOCK
      ?auto_258997 - BLOCK
      ?auto_258998 - BLOCK
    )
    :vars
    (
      ?auto_258999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258998 ?auto_258999 ) ( ON-TABLE ?auto_258989 ) ( ON ?auto_258990 ?auto_258989 ) ( ON ?auto_258991 ?auto_258990 ) ( ON ?auto_258992 ?auto_258991 ) ( ON ?auto_258993 ?auto_258992 ) ( not ( = ?auto_258989 ?auto_258990 ) ) ( not ( = ?auto_258989 ?auto_258991 ) ) ( not ( = ?auto_258989 ?auto_258992 ) ) ( not ( = ?auto_258989 ?auto_258993 ) ) ( not ( = ?auto_258989 ?auto_258994 ) ) ( not ( = ?auto_258989 ?auto_258995 ) ) ( not ( = ?auto_258989 ?auto_258996 ) ) ( not ( = ?auto_258989 ?auto_258997 ) ) ( not ( = ?auto_258989 ?auto_258998 ) ) ( not ( = ?auto_258989 ?auto_258999 ) ) ( not ( = ?auto_258990 ?auto_258991 ) ) ( not ( = ?auto_258990 ?auto_258992 ) ) ( not ( = ?auto_258990 ?auto_258993 ) ) ( not ( = ?auto_258990 ?auto_258994 ) ) ( not ( = ?auto_258990 ?auto_258995 ) ) ( not ( = ?auto_258990 ?auto_258996 ) ) ( not ( = ?auto_258990 ?auto_258997 ) ) ( not ( = ?auto_258990 ?auto_258998 ) ) ( not ( = ?auto_258990 ?auto_258999 ) ) ( not ( = ?auto_258991 ?auto_258992 ) ) ( not ( = ?auto_258991 ?auto_258993 ) ) ( not ( = ?auto_258991 ?auto_258994 ) ) ( not ( = ?auto_258991 ?auto_258995 ) ) ( not ( = ?auto_258991 ?auto_258996 ) ) ( not ( = ?auto_258991 ?auto_258997 ) ) ( not ( = ?auto_258991 ?auto_258998 ) ) ( not ( = ?auto_258991 ?auto_258999 ) ) ( not ( = ?auto_258992 ?auto_258993 ) ) ( not ( = ?auto_258992 ?auto_258994 ) ) ( not ( = ?auto_258992 ?auto_258995 ) ) ( not ( = ?auto_258992 ?auto_258996 ) ) ( not ( = ?auto_258992 ?auto_258997 ) ) ( not ( = ?auto_258992 ?auto_258998 ) ) ( not ( = ?auto_258992 ?auto_258999 ) ) ( not ( = ?auto_258993 ?auto_258994 ) ) ( not ( = ?auto_258993 ?auto_258995 ) ) ( not ( = ?auto_258993 ?auto_258996 ) ) ( not ( = ?auto_258993 ?auto_258997 ) ) ( not ( = ?auto_258993 ?auto_258998 ) ) ( not ( = ?auto_258993 ?auto_258999 ) ) ( not ( = ?auto_258994 ?auto_258995 ) ) ( not ( = ?auto_258994 ?auto_258996 ) ) ( not ( = ?auto_258994 ?auto_258997 ) ) ( not ( = ?auto_258994 ?auto_258998 ) ) ( not ( = ?auto_258994 ?auto_258999 ) ) ( not ( = ?auto_258995 ?auto_258996 ) ) ( not ( = ?auto_258995 ?auto_258997 ) ) ( not ( = ?auto_258995 ?auto_258998 ) ) ( not ( = ?auto_258995 ?auto_258999 ) ) ( not ( = ?auto_258996 ?auto_258997 ) ) ( not ( = ?auto_258996 ?auto_258998 ) ) ( not ( = ?auto_258996 ?auto_258999 ) ) ( not ( = ?auto_258997 ?auto_258998 ) ) ( not ( = ?auto_258997 ?auto_258999 ) ) ( not ( = ?auto_258998 ?auto_258999 ) ) ( ON ?auto_258997 ?auto_258998 ) ( ON ?auto_258996 ?auto_258997 ) ( ON ?auto_258995 ?auto_258996 ) ( CLEAR ?auto_258993 ) ( ON ?auto_258994 ?auto_258995 ) ( CLEAR ?auto_258994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_258989 ?auto_258990 ?auto_258991 ?auto_258992 ?auto_258993 ?auto_258994 )
      ( MAKE-10PILE ?auto_258989 ?auto_258990 ?auto_258991 ?auto_258992 ?auto_258993 ?auto_258994 ?auto_258995 ?auto_258996 ?auto_258997 ?auto_258998 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_259010 - BLOCK
      ?auto_259011 - BLOCK
      ?auto_259012 - BLOCK
      ?auto_259013 - BLOCK
      ?auto_259014 - BLOCK
      ?auto_259015 - BLOCK
      ?auto_259016 - BLOCK
      ?auto_259017 - BLOCK
      ?auto_259018 - BLOCK
      ?auto_259019 - BLOCK
    )
    :vars
    (
      ?auto_259020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259019 ?auto_259020 ) ( ON-TABLE ?auto_259010 ) ( ON ?auto_259011 ?auto_259010 ) ( ON ?auto_259012 ?auto_259011 ) ( ON ?auto_259013 ?auto_259012 ) ( not ( = ?auto_259010 ?auto_259011 ) ) ( not ( = ?auto_259010 ?auto_259012 ) ) ( not ( = ?auto_259010 ?auto_259013 ) ) ( not ( = ?auto_259010 ?auto_259014 ) ) ( not ( = ?auto_259010 ?auto_259015 ) ) ( not ( = ?auto_259010 ?auto_259016 ) ) ( not ( = ?auto_259010 ?auto_259017 ) ) ( not ( = ?auto_259010 ?auto_259018 ) ) ( not ( = ?auto_259010 ?auto_259019 ) ) ( not ( = ?auto_259010 ?auto_259020 ) ) ( not ( = ?auto_259011 ?auto_259012 ) ) ( not ( = ?auto_259011 ?auto_259013 ) ) ( not ( = ?auto_259011 ?auto_259014 ) ) ( not ( = ?auto_259011 ?auto_259015 ) ) ( not ( = ?auto_259011 ?auto_259016 ) ) ( not ( = ?auto_259011 ?auto_259017 ) ) ( not ( = ?auto_259011 ?auto_259018 ) ) ( not ( = ?auto_259011 ?auto_259019 ) ) ( not ( = ?auto_259011 ?auto_259020 ) ) ( not ( = ?auto_259012 ?auto_259013 ) ) ( not ( = ?auto_259012 ?auto_259014 ) ) ( not ( = ?auto_259012 ?auto_259015 ) ) ( not ( = ?auto_259012 ?auto_259016 ) ) ( not ( = ?auto_259012 ?auto_259017 ) ) ( not ( = ?auto_259012 ?auto_259018 ) ) ( not ( = ?auto_259012 ?auto_259019 ) ) ( not ( = ?auto_259012 ?auto_259020 ) ) ( not ( = ?auto_259013 ?auto_259014 ) ) ( not ( = ?auto_259013 ?auto_259015 ) ) ( not ( = ?auto_259013 ?auto_259016 ) ) ( not ( = ?auto_259013 ?auto_259017 ) ) ( not ( = ?auto_259013 ?auto_259018 ) ) ( not ( = ?auto_259013 ?auto_259019 ) ) ( not ( = ?auto_259013 ?auto_259020 ) ) ( not ( = ?auto_259014 ?auto_259015 ) ) ( not ( = ?auto_259014 ?auto_259016 ) ) ( not ( = ?auto_259014 ?auto_259017 ) ) ( not ( = ?auto_259014 ?auto_259018 ) ) ( not ( = ?auto_259014 ?auto_259019 ) ) ( not ( = ?auto_259014 ?auto_259020 ) ) ( not ( = ?auto_259015 ?auto_259016 ) ) ( not ( = ?auto_259015 ?auto_259017 ) ) ( not ( = ?auto_259015 ?auto_259018 ) ) ( not ( = ?auto_259015 ?auto_259019 ) ) ( not ( = ?auto_259015 ?auto_259020 ) ) ( not ( = ?auto_259016 ?auto_259017 ) ) ( not ( = ?auto_259016 ?auto_259018 ) ) ( not ( = ?auto_259016 ?auto_259019 ) ) ( not ( = ?auto_259016 ?auto_259020 ) ) ( not ( = ?auto_259017 ?auto_259018 ) ) ( not ( = ?auto_259017 ?auto_259019 ) ) ( not ( = ?auto_259017 ?auto_259020 ) ) ( not ( = ?auto_259018 ?auto_259019 ) ) ( not ( = ?auto_259018 ?auto_259020 ) ) ( not ( = ?auto_259019 ?auto_259020 ) ) ( ON ?auto_259018 ?auto_259019 ) ( ON ?auto_259017 ?auto_259018 ) ( ON ?auto_259016 ?auto_259017 ) ( ON ?auto_259015 ?auto_259016 ) ( CLEAR ?auto_259013 ) ( ON ?auto_259014 ?auto_259015 ) ( CLEAR ?auto_259014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_259010 ?auto_259011 ?auto_259012 ?auto_259013 ?auto_259014 )
      ( MAKE-10PILE ?auto_259010 ?auto_259011 ?auto_259012 ?auto_259013 ?auto_259014 ?auto_259015 ?auto_259016 ?auto_259017 ?auto_259018 ?auto_259019 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_259031 - BLOCK
      ?auto_259032 - BLOCK
      ?auto_259033 - BLOCK
      ?auto_259034 - BLOCK
      ?auto_259035 - BLOCK
      ?auto_259036 - BLOCK
      ?auto_259037 - BLOCK
      ?auto_259038 - BLOCK
      ?auto_259039 - BLOCK
      ?auto_259040 - BLOCK
    )
    :vars
    (
      ?auto_259041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259040 ?auto_259041 ) ( ON-TABLE ?auto_259031 ) ( ON ?auto_259032 ?auto_259031 ) ( ON ?auto_259033 ?auto_259032 ) ( ON ?auto_259034 ?auto_259033 ) ( not ( = ?auto_259031 ?auto_259032 ) ) ( not ( = ?auto_259031 ?auto_259033 ) ) ( not ( = ?auto_259031 ?auto_259034 ) ) ( not ( = ?auto_259031 ?auto_259035 ) ) ( not ( = ?auto_259031 ?auto_259036 ) ) ( not ( = ?auto_259031 ?auto_259037 ) ) ( not ( = ?auto_259031 ?auto_259038 ) ) ( not ( = ?auto_259031 ?auto_259039 ) ) ( not ( = ?auto_259031 ?auto_259040 ) ) ( not ( = ?auto_259031 ?auto_259041 ) ) ( not ( = ?auto_259032 ?auto_259033 ) ) ( not ( = ?auto_259032 ?auto_259034 ) ) ( not ( = ?auto_259032 ?auto_259035 ) ) ( not ( = ?auto_259032 ?auto_259036 ) ) ( not ( = ?auto_259032 ?auto_259037 ) ) ( not ( = ?auto_259032 ?auto_259038 ) ) ( not ( = ?auto_259032 ?auto_259039 ) ) ( not ( = ?auto_259032 ?auto_259040 ) ) ( not ( = ?auto_259032 ?auto_259041 ) ) ( not ( = ?auto_259033 ?auto_259034 ) ) ( not ( = ?auto_259033 ?auto_259035 ) ) ( not ( = ?auto_259033 ?auto_259036 ) ) ( not ( = ?auto_259033 ?auto_259037 ) ) ( not ( = ?auto_259033 ?auto_259038 ) ) ( not ( = ?auto_259033 ?auto_259039 ) ) ( not ( = ?auto_259033 ?auto_259040 ) ) ( not ( = ?auto_259033 ?auto_259041 ) ) ( not ( = ?auto_259034 ?auto_259035 ) ) ( not ( = ?auto_259034 ?auto_259036 ) ) ( not ( = ?auto_259034 ?auto_259037 ) ) ( not ( = ?auto_259034 ?auto_259038 ) ) ( not ( = ?auto_259034 ?auto_259039 ) ) ( not ( = ?auto_259034 ?auto_259040 ) ) ( not ( = ?auto_259034 ?auto_259041 ) ) ( not ( = ?auto_259035 ?auto_259036 ) ) ( not ( = ?auto_259035 ?auto_259037 ) ) ( not ( = ?auto_259035 ?auto_259038 ) ) ( not ( = ?auto_259035 ?auto_259039 ) ) ( not ( = ?auto_259035 ?auto_259040 ) ) ( not ( = ?auto_259035 ?auto_259041 ) ) ( not ( = ?auto_259036 ?auto_259037 ) ) ( not ( = ?auto_259036 ?auto_259038 ) ) ( not ( = ?auto_259036 ?auto_259039 ) ) ( not ( = ?auto_259036 ?auto_259040 ) ) ( not ( = ?auto_259036 ?auto_259041 ) ) ( not ( = ?auto_259037 ?auto_259038 ) ) ( not ( = ?auto_259037 ?auto_259039 ) ) ( not ( = ?auto_259037 ?auto_259040 ) ) ( not ( = ?auto_259037 ?auto_259041 ) ) ( not ( = ?auto_259038 ?auto_259039 ) ) ( not ( = ?auto_259038 ?auto_259040 ) ) ( not ( = ?auto_259038 ?auto_259041 ) ) ( not ( = ?auto_259039 ?auto_259040 ) ) ( not ( = ?auto_259039 ?auto_259041 ) ) ( not ( = ?auto_259040 ?auto_259041 ) ) ( ON ?auto_259039 ?auto_259040 ) ( ON ?auto_259038 ?auto_259039 ) ( ON ?auto_259037 ?auto_259038 ) ( ON ?auto_259036 ?auto_259037 ) ( CLEAR ?auto_259034 ) ( ON ?auto_259035 ?auto_259036 ) ( CLEAR ?auto_259035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_259031 ?auto_259032 ?auto_259033 ?auto_259034 ?auto_259035 )
      ( MAKE-10PILE ?auto_259031 ?auto_259032 ?auto_259033 ?auto_259034 ?auto_259035 ?auto_259036 ?auto_259037 ?auto_259038 ?auto_259039 ?auto_259040 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_259052 - BLOCK
      ?auto_259053 - BLOCK
      ?auto_259054 - BLOCK
      ?auto_259055 - BLOCK
      ?auto_259056 - BLOCK
      ?auto_259057 - BLOCK
      ?auto_259058 - BLOCK
      ?auto_259059 - BLOCK
      ?auto_259060 - BLOCK
      ?auto_259061 - BLOCK
    )
    :vars
    (
      ?auto_259062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259061 ?auto_259062 ) ( ON-TABLE ?auto_259052 ) ( ON ?auto_259053 ?auto_259052 ) ( ON ?auto_259054 ?auto_259053 ) ( not ( = ?auto_259052 ?auto_259053 ) ) ( not ( = ?auto_259052 ?auto_259054 ) ) ( not ( = ?auto_259052 ?auto_259055 ) ) ( not ( = ?auto_259052 ?auto_259056 ) ) ( not ( = ?auto_259052 ?auto_259057 ) ) ( not ( = ?auto_259052 ?auto_259058 ) ) ( not ( = ?auto_259052 ?auto_259059 ) ) ( not ( = ?auto_259052 ?auto_259060 ) ) ( not ( = ?auto_259052 ?auto_259061 ) ) ( not ( = ?auto_259052 ?auto_259062 ) ) ( not ( = ?auto_259053 ?auto_259054 ) ) ( not ( = ?auto_259053 ?auto_259055 ) ) ( not ( = ?auto_259053 ?auto_259056 ) ) ( not ( = ?auto_259053 ?auto_259057 ) ) ( not ( = ?auto_259053 ?auto_259058 ) ) ( not ( = ?auto_259053 ?auto_259059 ) ) ( not ( = ?auto_259053 ?auto_259060 ) ) ( not ( = ?auto_259053 ?auto_259061 ) ) ( not ( = ?auto_259053 ?auto_259062 ) ) ( not ( = ?auto_259054 ?auto_259055 ) ) ( not ( = ?auto_259054 ?auto_259056 ) ) ( not ( = ?auto_259054 ?auto_259057 ) ) ( not ( = ?auto_259054 ?auto_259058 ) ) ( not ( = ?auto_259054 ?auto_259059 ) ) ( not ( = ?auto_259054 ?auto_259060 ) ) ( not ( = ?auto_259054 ?auto_259061 ) ) ( not ( = ?auto_259054 ?auto_259062 ) ) ( not ( = ?auto_259055 ?auto_259056 ) ) ( not ( = ?auto_259055 ?auto_259057 ) ) ( not ( = ?auto_259055 ?auto_259058 ) ) ( not ( = ?auto_259055 ?auto_259059 ) ) ( not ( = ?auto_259055 ?auto_259060 ) ) ( not ( = ?auto_259055 ?auto_259061 ) ) ( not ( = ?auto_259055 ?auto_259062 ) ) ( not ( = ?auto_259056 ?auto_259057 ) ) ( not ( = ?auto_259056 ?auto_259058 ) ) ( not ( = ?auto_259056 ?auto_259059 ) ) ( not ( = ?auto_259056 ?auto_259060 ) ) ( not ( = ?auto_259056 ?auto_259061 ) ) ( not ( = ?auto_259056 ?auto_259062 ) ) ( not ( = ?auto_259057 ?auto_259058 ) ) ( not ( = ?auto_259057 ?auto_259059 ) ) ( not ( = ?auto_259057 ?auto_259060 ) ) ( not ( = ?auto_259057 ?auto_259061 ) ) ( not ( = ?auto_259057 ?auto_259062 ) ) ( not ( = ?auto_259058 ?auto_259059 ) ) ( not ( = ?auto_259058 ?auto_259060 ) ) ( not ( = ?auto_259058 ?auto_259061 ) ) ( not ( = ?auto_259058 ?auto_259062 ) ) ( not ( = ?auto_259059 ?auto_259060 ) ) ( not ( = ?auto_259059 ?auto_259061 ) ) ( not ( = ?auto_259059 ?auto_259062 ) ) ( not ( = ?auto_259060 ?auto_259061 ) ) ( not ( = ?auto_259060 ?auto_259062 ) ) ( not ( = ?auto_259061 ?auto_259062 ) ) ( ON ?auto_259060 ?auto_259061 ) ( ON ?auto_259059 ?auto_259060 ) ( ON ?auto_259058 ?auto_259059 ) ( ON ?auto_259057 ?auto_259058 ) ( ON ?auto_259056 ?auto_259057 ) ( CLEAR ?auto_259054 ) ( ON ?auto_259055 ?auto_259056 ) ( CLEAR ?auto_259055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_259052 ?auto_259053 ?auto_259054 ?auto_259055 )
      ( MAKE-10PILE ?auto_259052 ?auto_259053 ?auto_259054 ?auto_259055 ?auto_259056 ?auto_259057 ?auto_259058 ?auto_259059 ?auto_259060 ?auto_259061 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_259073 - BLOCK
      ?auto_259074 - BLOCK
      ?auto_259075 - BLOCK
      ?auto_259076 - BLOCK
      ?auto_259077 - BLOCK
      ?auto_259078 - BLOCK
      ?auto_259079 - BLOCK
      ?auto_259080 - BLOCK
      ?auto_259081 - BLOCK
      ?auto_259082 - BLOCK
    )
    :vars
    (
      ?auto_259083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259082 ?auto_259083 ) ( ON-TABLE ?auto_259073 ) ( ON ?auto_259074 ?auto_259073 ) ( ON ?auto_259075 ?auto_259074 ) ( not ( = ?auto_259073 ?auto_259074 ) ) ( not ( = ?auto_259073 ?auto_259075 ) ) ( not ( = ?auto_259073 ?auto_259076 ) ) ( not ( = ?auto_259073 ?auto_259077 ) ) ( not ( = ?auto_259073 ?auto_259078 ) ) ( not ( = ?auto_259073 ?auto_259079 ) ) ( not ( = ?auto_259073 ?auto_259080 ) ) ( not ( = ?auto_259073 ?auto_259081 ) ) ( not ( = ?auto_259073 ?auto_259082 ) ) ( not ( = ?auto_259073 ?auto_259083 ) ) ( not ( = ?auto_259074 ?auto_259075 ) ) ( not ( = ?auto_259074 ?auto_259076 ) ) ( not ( = ?auto_259074 ?auto_259077 ) ) ( not ( = ?auto_259074 ?auto_259078 ) ) ( not ( = ?auto_259074 ?auto_259079 ) ) ( not ( = ?auto_259074 ?auto_259080 ) ) ( not ( = ?auto_259074 ?auto_259081 ) ) ( not ( = ?auto_259074 ?auto_259082 ) ) ( not ( = ?auto_259074 ?auto_259083 ) ) ( not ( = ?auto_259075 ?auto_259076 ) ) ( not ( = ?auto_259075 ?auto_259077 ) ) ( not ( = ?auto_259075 ?auto_259078 ) ) ( not ( = ?auto_259075 ?auto_259079 ) ) ( not ( = ?auto_259075 ?auto_259080 ) ) ( not ( = ?auto_259075 ?auto_259081 ) ) ( not ( = ?auto_259075 ?auto_259082 ) ) ( not ( = ?auto_259075 ?auto_259083 ) ) ( not ( = ?auto_259076 ?auto_259077 ) ) ( not ( = ?auto_259076 ?auto_259078 ) ) ( not ( = ?auto_259076 ?auto_259079 ) ) ( not ( = ?auto_259076 ?auto_259080 ) ) ( not ( = ?auto_259076 ?auto_259081 ) ) ( not ( = ?auto_259076 ?auto_259082 ) ) ( not ( = ?auto_259076 ?auto_259083 ) ) ( not ( = ?auto_259077 ?auto_259078 ) ) ( not ( = ?auto_259077 ?auto_259079 ) ) ( not ( = ?auto_259077 ?auto_259080 ) ) ( not ( = ?auto_259077 ?auto_259081 ) ) ( not ( = ?auto_259077 ?auto_259082 ) ) ( not ( = ?auto_259077 ?auto_259083 ) ) ( not ( = ?auto_259078 ?auto_259079 ) ) ( not ( = ?auto_259078 ?auto_259080 ) ) ( not ( = ?auto_259078 ?auto_259081 ) ) ( not ( = ?auto_259078 ?auto_259082 ) ) ( not ( = ?auto_259078 ?auto_259083 ) ) ( not ( = ?auto_259079 ?auto_259080 ) ) ( not ( = ?auto_259079 ?auto_259081 ) ) ( not ( = ?auto_259079 ?auto_259082 ) ) ( not ( = ?auto_259079 ?auto_259083 ) ) ( not ( = ?auto_259080 ?auto_259081 ) ) ( not ( = ?auto_259080 ?auto_259082 ) ) ( not ( = ?auto_259080 ?auto_259083 ) ) ( not ( = ?auto_259081 ?auto_259082 ) ) ( not ( = ?auto_259081 ?auto_259083 ) ) ( not ( = ?auto_259082 ?auto_259083 ) ) ( ON ?auto_259081 ?auto_259082 ) ( ON ?auto_259080 ?auto_259081 ) ( ON ?auto_259079 ?auto_259080 ) ( ON ?auto_259078 ?auto_259079 ) ( ON ?auto_259077 ?auto_259078 ) ( CLEAR ?auto_259075 ) ( ON ?auto_259076 ?auto_259077 ) ( CLEAR ?auto_259076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_259073 ?auto_259074 ?auto_259075 ?auto_259076 )
      ( MAKE-10PILE ?auto_259073 ?auto_259074 ?auto_259075 ?auto_259076 ?auto_259077 ?auto_259078 ?auto_259079 ?auto_259080 ?auto_259081 ?auto_259082 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_259094 - BLOCK
      ?auto_259095 - BLOCK
      ?auto_259096 - BLOCK
      ?auto_259097 - BLOCK
      ?auto_259098 - BLOCK
      ?auto_259099 - BLOCK
      ?auto_259100 - BLOCK
      ?auto_259101 - BLOCK
      ?auto_259102 - BLOCK
      ?auto_259103 - BLOCK
    )
    :vars
    (
      ?auto_259104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259103 ?auto_259104 ) ( ON-TABLE ?auto_259094 ) ( ON ?auto_259095 ?auto_259094 ) ( not ( = ?auto_259094 ?auto_259095 ) ) ( not ( = ?auto_259094 ?auto_259096 ) ) ( not ( = ?auto_259094 ?auto_259097 ) ) ( not ( = ?auto_259094 ?auto_259098 ) ) ( not ( = ?auto_259094 ?auto_259099 ) ) ( not ( = ?auto_259094 ?auto_259100 ) ) ( not ( = ?auto_259094 ?auto_259101 ) ) ( not ( = ?auto_259094 ?auto_259102 ) ) ( not ( = ?auto_259094 ?auto_259103 ) ) ( not ( = ?auto_259094 ?auto_259104 ) ) ( not ( = ?auto_259095 ?auto_259096 ) ) ( not ( = ?auto_259095 ?auto_259097 ) ) ( not ( = ?auto_259095 ?auto_259098 ) ) ( not ( = ?auto_259095 ?auto_259099 ) ) ( not ( = ?auto_259095 ?auto_259100 ) ) ( not ( = ?auto_259095 ?auto_259101 ) ) ( not ( = ?auto_259095 ?auto_259102 ) ) ( not ( = ?auto_259095 ?auto_259103 ) ) ( not ( = ?auto_259095 ?auto_259104 ) ) ( not ( = ?auto_259096 ?auto_259097 ) ) ( not ( = ?auto_259096 ?auto_259098 ) ) ( not ( = ?auto_259096 ?auto_259099 ) ) ( not ( = ?auto_259096 ?auto_259100 ) ) ( not ( = ?auto_259096 ?auto_259101 ) ) ( not ( = ?auto_259096 ?auto_259102 ) ) ( not ( = ?auto_259096 ?auto_259103 ) ) ( not ( = ?auto_259096 ?auto_259104 ) ) ( not ( = ?auto_259097 ?auto_259098 ) ) ( not ( = ?auto_259097 ?auto_259099 ) ) ( not ( = ?auto_259097 ?auto_259100 ) ) ( not ( = ?auto_259097 ?auto_259101 ) ) ( not ( = ?auto_259097 ?auto_259102 ) ) ( not ( = ?auto_259097 ?auto_259103 ) ) ( not ( = ?auto_259097 ?auto_259104 ) ) ( not ( = ?auto_259098 ?auto_259099 ) ) ( not ( = ?auto_259098 ?auto_259100 ) ) ( not ( = ?auto_259098 ?auto_259101 ) ) ( not ( = ?auto_259098 ?auto_259102 ) ) ( not ( = ?auto_259098 ?auto_259103 ) ) ( not ( = ?auto_259098 ?auto_259104 ) ) ( not ( = ?auto_259099 ?auto_259100 ) ) ( not ( = ?auto_259099 ?auto_259101 ) ) ( not ( = ?auto_259099 ?auto_259102 ) ) ( not ( = ?auto_259099 ?auto_259103 ) ) ( not ( = ?auto_259099 ?auto_259104 ) ) ( not ( = ?auto_259100 ?auto_259101 ) ) ( not ( = ?auto_259100 ?auto_259102 ) ) ( not ( = ?auto_259100 ?auto_259103 ) ) ( not ( = ?auto_259100 ?auto_259104 ) ) ( not ( = ?auto_259101 ?auto_259102 ) ) ( not ( = ?auto_259101 ?auto_259103 ) ) ( not ( = ?auto_259101 ?auto_259104 ) ) ( not ( = ?auto_259102 ?auto_259103 ) ) ( not ( = ?auto_259102 ?auto_259104 ) ) ( not ( = ?auto_259103 ?auto_259104 ) ) ( ON ?auto_259102 ?auto_259103 ) ( ON ?auto_259101 ?auto_259102 ) ( ON ?auto_259100 ?auto_259101 ) ( ON ?auto_259099 ?auto_259100 ) ( ON ?auto_259098 ?auto_259099 ) ( ON ?auto_259097 ?auto_259098 ) ( CLEAR ?auto_259095 ) ( ON ?auto_259096 ?auto_259097 ) ( CLEAR ?auto_259096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_259094 ?auto_259095 ?auto_259096 )
      ( MAKE-10PILE ?auto_259094 ?auto_259095 ?auto_259096 ?auto_259097 ?auto_259098 ?auto_259099 ?auto_259100 ?auto_259101 ?auto_259102 ?auto_259103 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_259115 - BLOCK
      ?auto_259116 - BLOCK
      ?auto_259117 - BLOCK
      ?auto_259118 - BLOCK
      ?auto_259119 - BLOCK
      ?auto_259120 - BLOCK
      ?auto_259121 - BLOCK
      ?auto_259122 - BLOCK
      ?auto_259123 - BLOCK
      ?auto_259124 - BLOCK
    )
    :vars
    (
      ?auto_259125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259124 ?auto_259125 ) ( ON-TABLE ?auto_259115 ) ( ON ?auto_259116 ?auto_259115 ) ( not ( = ?auto_259115 ?auto_259116 ) ) ( not ( = ?auto_259115 ?auto_259117 ) ) ( not ( = ?auto_259115 ?auto_259118 ) ) ( not ( = ?auto_259115 ?auto_259119 ) ) ( not ( = ?auto_259115 ?auto_259120 ) ) ( not ( = ?auto_259115 ?auto_259121 ) ) ( not ( = ?auto_259115 ?auto_259122 ) ) ( not ( = ?auto_259115 ?auto_259123 ) ) ( not ( = ?auto_259115 ?auto_259124 ) ) ( not ( = ?auto_259115 ?auto_259125 ) ) ( not ( = ?auto_259116 ?auto_259117 ) ) ( not ( = ?auto_259116 ?auto_259118 ) ) ( not ( = ?auto_259116 ?auto_259119 ) ) ( not ( = ?auto_259116 ?auto_259120 ) ) ( not ( = ?auto_259116 ?auto_259121 ) ) ( not ( = ?auto_259116 ?auto_259122 ) ) ( not ( = ?auto_259116 ?auto_259123 ) ) ( not ( = ?auto_259116 ?auto_259124 ) ) ( not ( = ?auto_259116 ?auto_259125 ) ) ( not ( = ?auto_259117 ?auto_259118 ) ) ( not ( = ?auto_259117 ?auto_259119 ) ) ( not ( = ?auto_259117 ?auto_259120 ) ) ( not ( = ?auto_259117 ?auto_259121 ) ) ( not ( = ?auto_259117 ?auto_259122 ) ) ( not ( = ?auto_259117 ?auto_259123 ) ) ( not ( = ?auto_259117 ?auto_259124 ) ) ( not ( = ?auto_259117 ?auto_259125 ) ) ( not ( = ?auto_259118 ?auto_259119 ) ) ( not ( = ?auto_259118 ?auto_259120 ) ) ( not ( = ?auto_259118 ?auto_259121 ) ) ( not ( = ?auto_259118 ?auto_259122 ) ) ( not ( = ?auto_259118 ?auto_259123 ) ) ( not ( = ?auto_259118 ?auto_259124 ) ) ( not ( = ?auto_259118 ?auto_259125 ) ) ( not ( = ?auto_259119 ?auto_259120 ) ) ( not ( = ?auto_259119 ?auto_259121 ) ) ( not ( = ?auto_259119 ?auto_259122 ) ) ( not ( = ?auto_259119 ?auto_259123 ) ) ( not ( = ?auto_259119 ?auto_259124 ) ) ( not ( = ?auto_259119 ?auto_259125 ) ) ( not ( = ?auto_259120 ?auto_259121 ) ) ( not ( = ?auto_259120 ?auto_259122 ) ) ( not ( = ?auto_259120 ?auto_259123 ) ) ( not ( = ?auto_259120 ?auto_259124 ) ) ( not ( = ?auto_259120 ?auto_259125 ) ) ( not ( = ?auto_259121 ?auto_259122 ) ) ( not ( = ?auto_259121 ?auto_259123 ) ) ( not ( = ?auto_259121 ?auto_259124 ) ) ( not ( = ?auto_259121 ?auto_259125 ) ) ( not ( = ?auto_259122 ?auto_259123 ) ) ( not ( = ?auto_259122 ?auto_259124 ) ) ( not ( = ?auto_259122 ?auto_259125 ) ) ( not ( = ?auto_259123 ?auto_259124 ) ) ( not ( = ?auto_259123 ?auto_259125 ) ) ( not ( = ?auto_259124 ?auto_259125 ) ) ( ON ?auto_259123 ?auto_259124 ) ( ON ?auto_259122 ?auto_259123 ) ( ON ?auto_259121 ?auto_259122 ) ( ON ?auto_259120 ?auto_259121 ) ( ON ?auto_259119 ?auto_259120 ) ( ON ?auto_259118 ?auto_259119 ) ( CLEAR ?auto_259116 ) ( ON ?auto_259117 ?auto_259118 ) ( CLEAR ?auto_259117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_259115 ?auto_259116 ?auto_259117 )
      ( MAKE-10PILE ?auto_259115 ?auto_259116 ?auto_259117 ?auto_259118 ?auto_259119 ?auto_259120 ?auto_259121 ?auto_259122 ?auto_259123 ?auto_259124 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_259136 - BLOCK
      ?auto_259137 - BLOCK
      ?auto_259138 - BLOCK
      ?auto_259139 - BLOCK
      ?auto_259140 - BLOCK
      ?auto_259141 - BLOCK
      ?auto_259142 - BLOCK
      ?auto_259143 - BLOCK
      ?auto_259144 - BLOCK
      ?auto_259145 - BLOCK
    )
    :vars
    (
      ?auto_259146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259145 ?auto_259146 ) ( ON-TABLE ?auto_259136 ) ( not ( = ?auto_259136 ?auto_259137 ) ) ( not ( = ?auto_259136 ?auto_259138 ) ) ( not ( = ?auto_259136 ?auto_259139 ) ) ( not ( = ?auto_259136 ?auto_259140 ) ) ( not ( = ?auto_259136 ?auto_259141 ) ) ( not ( = ?auto_259136 ?auto_259142 ) ) ( not ( = ?auto_259136 ?auto_259143 ) ) ( not ( = ?auto_259136 ?auto_259144 ) ) ( not ( = ?auto_259136 ?auto_259145 ) ) ( not ( = ?auto_259136 ?auto_259146 ) ) ( not ( = ?auto_259137 ?auto_259138 ) ) ( not ( = ?auto_259137 ?auto_259139 ) ) ( not ( = ?auto_259137 ?auto_259140 ) ) ( not ( = ?auto_259137 ?auto_259141 ) ) ( not ( = ?auto_259137 ?auto_259142 ) ) ( not ( = ?auto_259137 ?auto_259143 ) ) ( not ( = ?auto_259137 ?auto_259144 ) ) ( not ( = ?auto_259137 ?auto_259145 ) ) ( not ( = ?auto_259137 ?auto_259146 ) ) ( not ( = ?auto_259138 ?auto_259139 ) ) ( not ( = ?auto_259138 ?auto_259140 ) ) ( not ( = ?auto_259138 ?auto_259141 ) ) ( not ( = ?auto_259138 ?auto_259142 ) ) ( not ( = ?auto_259138 ?auto_259143 ) ) ( not ( = ?auto_259138 ?auto_259144 ) ) ( not ( = ?auto_259138 ?auto_259145 ) ) ( not ( = ?auto_259138 ?auto_259146 ) ) ( not ( = ?auto_259139 ?auto_259140 ) ) ( not ( = ?auto_259139 ?auto_259141 ) ) ( not ( = ?auto_259139 ?auto_259142 ) ) ( not ( = ?auto_259139 ?auto_259143 ) ) ( not ( = ?auto_259139 ?auto_259144 ) ) ( not ( = ?auto_259139 ?auto_259145 ) ) ( not ( = ?auto_259139 ?auto_259146 ) ) ( not ( = ?auto_259140 ?auto_259141 ) ) ( not ( = ?auto_259140 ?auto_259142 ) ) ( not ( = ?auto_259140 ?auto_259143 ) ) ( not ( = ?auto_259140 ?auto_259144 ) ) ( not ( = ?auto_259140 ?auto_259145 ) ) ( not ( = ?auto_259140 ?auto_259146 ) ) ( not ( = ?auto_259141 ?auto_259142 ) ) ( not ( = ?auto_259141 ?auto_259143 ) ) ( not ( = ?auto_259141 ?auto_259144 ) ) ( not ( = ?auto_259141 ?auto_259145 ) ) ( not ( = ?auto_259141 ?auto_259146 ) ) ( not ( = ?auto_259142 ?auto_259143 ) ) ( not ( = ?auto_259142 ?auto_259144 ) ) ( not ( = ?auto_259142 ?auto_259145 ) ) ( not ( = ?auto_259142 ?auto_259146 ) ) ( not ( = ?auto_259143 ?auto_259144 ) ) ( not ( = ?auto_259143 ?auto_259145 ) ) ( not ( = ?auto_259143 ?auto_259146 ) ) ( not ( = ?auto_259144 ?auto_259145 ) ) ( not ( = ?auto_259144 ?auto_259146 ) ) ( not ( = ?auto_259145 ?auto_259146 ) ) ( ON ?auto_259144 ?auto_259145 ) ( ON ?auto_259143 ?auto_259144 ) ( ON ?auto_259142 ?auto_259143 ) ( ON ?auto_259141 ?auto_259142 ) ( ON ?auto_259140 ?auto_259141 ) ( ON ?auto_259139 ?auto_259140 ) ( ON ?auto_259138 ?auto_259139 ) ( CLEAR ?auto_259136 ) ( ON ?auto_259137 ?auto_259138 ) ( CLEAR ?auto_259137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_259136 ?auto_259137 )
      ( MAKE-10PILE ?auto_259136 ?auto_259137 ?auto_259138 ?auto_259139 ?auto_259140 ?auto_259141 ?auto_259142 ?auto_259143 ?auto_259144 ?auto_259145 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_259157 - BLOCK
      ?auto_259158 - BLOCK
      ?auto_259159 - BLOCK
      ?auto_259160 - BLOCK
      ?auto_259161 - BLOCK
      ?auto_259162 - BLOCK
      ?auto_259163 - BLOCK
      ?auto_259164 - BLOCK
      ?auto_259165 - BLOCK
      ?auto_259166 - BLOCK
    )
    :vars
    (
      ?auto_259167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259166 ?auto_259167 ) ( ON-TABLE ?auto_259157 ) ( not ( = ?auto_259157 ?auto_259158 ) ) ( not ( = ?auto_259157 ?auto_259159 ) ) ( not ( = ?auto_259157 ?auto_259160 ) ) ( not ( = ?auto_259157 ?auto_259161 ) ) ( not ( = ?auto_259157 ?auto_259162 ) ) ( not ( = ?auto_259157 ?auto_259163 ) ) ( not ( = ?auto_259157 ?auto_259164 ) ) ( not ( = ?auto_259157 ?auto_259165 ) ) ( not ( = ?auto_259157 ?auto_259166 ) ) ( not ( = ?auto_259157 ?auto_259167 ) ) ( not ( = ?auto_259158 ?auto_259159 ) ) ( not ( = ?auto_259158 ?auto_259160 ) ) ( not ( = ?auto_259158 ?auto_259161 ) ) ( not ( = ?auto_259158 ?auto_259162 ) ) ( not ( = ?auto_259158 ?auto_259163 ) ) ( not ( = ?auto_259158 ?auto_259164 ) ) ( not ( = ?auto_259158 ?auto_259165 ) ) ( not ( = ?auto_259158 ?auto_259166 ) ) ( not ( = ?auto_259158 ?auto_259167 ) ) ( not ( = ?auto_259159 ?auto_259160 ) ) ( not ( = ?auto_259159 ?auto_259161 ) ) ( not ( = ?auto_259159 ?auto_259162 ) ) ( not ( = ?auto_259159 ?auto_259163 ) ) ( not ( = ?auto_259159 ?auto_259164 ) ) ( not ( = ?auto_259159 ?auto_259165 ) ) ( not ( = ?auto_259159 ?auto_259166 ) ) ( not ( = ?auto_259159 ?auto_259167 ) ) ( not ( = ?auto_259160 ?auto_259161 ) ) ( not ( = ?auto_259160 ?auto_259162 ) ) ( not ( = ?auto_259160 ?auto_259163 ) ) ( not ( = ?auto_259160 ?auto_259164 ) ) ( not ( = ?auto_259160 ?auto_259165 ) ) ( not ( = ?auto_259160 ?auto_259166 ) ) ( not ( = ?auto_259160 ?auto_259167 ) ) ( not ( = ?auto_259161 ?auto_259162 ) ) ( not ( = ?auto_259161 ?auto_259163 ) ) ( not ( = ?auto_259161 ?auto_259164 ) ) ( not ( = ?auto_259161 ?auto_259165 ) ) ( not ( = ?auto_259161 ?auto_259166 ) ) ( not ( = ?auto_259161 ?auto_259167 ) ) ( not ( = ?auto_259162 ?auto_259163 ) ) ( not ( = ?auto_259162 ?auto_259164 ) ) ( not ( = ?auto_259162 ?auto_259165 ) ) ( not ( = ?auto_259162 ?auto_259166 ) ) ( not ( = ?auto_259162 ?auto_259167 ) ) ( not ( = ?auto_259163 ?auto_259164 ) ) ( not ( = ?auto_259163 ?auto_259165 ) ) ( not ( = ?auto_259163 ?auto_259166 ) ) ( not ( = ?auto_259163 ?auto_259167 ) ) ( not ( = ?auto_259164 ?auto_259165 ) ) ( not ( = ?auto_259164 ?auto_259166 ) ) ( not ( = ?auto_259164 ?auto_259167 ) ) ( not ( = ?auto_259165 ?auto_259166 ) ) ( not ( = ?auto_259165 ?auto_259167 ) ) ( not ( = ?auto_259166 ?auto_259167 ) ) ( ON ?auto_259165 ?auto_259166 ) ( ON ?auto_259164 ?auto_259165 ) ( ON ?auto_259163 ?auto_259164 ) ( ON ?auto_259162 ?auto_259163 ) ( ON ?auto_259161 ?auto_259162 ) ( ON ?auto_259160 ?auto_259161 ) ( ON ?auto_259159 ?auto_259160 ) ( CLEAR ?auto_259157 ) ( ON ?auto_259158 ?auto_259159 ) ( CLEAR ?auto_259158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_259157 ?auto_259158 )
      ( MAKE-10PILE ?auto_259157 ?auto_259158 ?auto_259159 ?auto_259160 ?auto_259161 ?auto_259162 ?auto_259163 ?auto_259164 ?auto_259165 ?auto_259166 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_259178 - BLOCK
      ?auto_259179 - BLOCK
      ?auto_259180 - BLOCK
      ?auto_259181 - BLOCK
      ?auto_259182 - BLOCK
      ?auto_259183 - BLOCK
      ?auto_259184 - BLOCK
      ?auto_259185 - BLOCK
      ?auto_259186 - BLOCK
      ?auto_259187 - BLOCK
    )
    :vars
    (
      ?auto_259188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259187 ?auto_259188 ) ( not ( = ?auto_259178 ?auto_259179 ) ) ( not ( = ?auto_259178 ?auto_259180 ) ) ( not ( = ?auto_259178 ?auto_259181 ) ) ( not ( = ?auto_259178 ?auto_259182 ) ) ( not ( = ?auto_259178 ?auto_259183 ) ) ( not ( = ?auto_259178 ?auto_259184 ) ) ( not ( = ?auto_259178 ?auto_259185 ) ) ( not ( = ?auto_259178 ?auto_259186 ) ) ( not ( = ?auto_259178 ?auto_259187 ) ) ( not ( = ?auto_259178 ?auto_259188 ) ) ( not ( = ?auto_259179 ?auto_259180 ) ) ( not ( = ?auto_259179 ?auto_259181 ) ) ( not ( = ?auto_259179 ?auto_259182 ) ) ( not ( = ?auto_259179 ?auto_259183 ) ) ( not ( = ?auto_259179 ?auto_259184 ) ) ( not ( = ?auto_259179 ?auto_259185 ) ) ( not ( = ?auto_259179 ?auto_259186 ) ) ( not ( = ?auto_259179 ?auto_259187 ) ) ( not ( = ?auto_259179 ?auto_259188 ) ) ( not ( = ?auto_259180 ?auto_259181 ) ) ( not ( = ?auto_259180 ?auto_259182 ) ) ( not ( = ?auto_259180 ?auto_259183 ) ) ( not ( = ?auto_259180 ?auto_259184 ) ) ( not ( = ?auto_259180 ?auto_259185 ) ) ( not ( = ?auto_259180 ?auto_259186 ) ) ( not ( = ?auto_259180 ?auto_259187 ) ) ( not ( = ?auto_259180 ?auto_259188 ) ) ( not ( = ?auto_259181 ?auto_259182 ) ) ( not ( = ?auto_259181 ?auto_259183 ) ) ( not ( = ?auto_259181 ?auto_259184 ) ) ( not ( = ?auto_259181 ?auto_259185 ) ) ( not ( = ?auto_259181 ?auto_259186 ) ) ( not ( = ?auto_259181 ?auto_259187 ) ) ( not ( = ?auto_259181 ?auto_259188 ) ) ( not ( = ?auto_259182 ?auto_259183 ) ) ( not ( = ?auto_259182 ?auto_259184 ) ) ( not ( = ?auto_259182 ?auto_259185 ) ) ( not ( = ?auto_259182 ?auto_259186 ) ) ( not ( = ?auto_259182 ?auto_259187 ) ) ( not ( = ?auto_259182 ?auto_259188 ) ) ( not ( = ?auto_259183 ?auto_259184 ) ) ( not ( = ?auto_259183 ?auto_259185 ) ) ( not ( = ?auto_259183 ?auto_259186 ) ) ( not ( = ?auto_259183 ?auto_259187 ) ) ( not ( = ?auto_259183 ?auto_259188 ) ) ( not ( = ?auto_259184 ?auto_259185 ) ) ( not ( = ?auto_259184 ?auto_259186 ) ) ( not ( = ?auto_259184 ?auto_259187 ) ) ( not ( = ?auto_259184 ?auto_259188 ) ) ( not ( = ?auto_259185 ?auto_259186 ) ) ( not ( = ?auto_259185 ?auto_259187 ) ) ( not ( = ?auto_259185 ?auto_259188 ) ) ( not ( = ?auto_259186 ?auto_259187 ) ) ( not ( = ?auto_259186 ?auto_259188 ) ) ( not ( = ?auto_259187 ?auto_259188 ) ) ( ON ?auto_259186 ?auto_259187 ) ( ON ?auto_259185 ?auto_259186 ) ( ON ?auto_259184 ?auto_259185 ) ( ON ?auto_259183 ?auto_259184 ) ( ON ?auto_259182 ?auto_259183 ) ( ON ?auto_259181 ?auto_259182 ) ( ON ?auto_259180 ?auto_259181 ) ( ON ?auto_259179 ?auto_259180 ) ( ON ?auto_259178 ?auto_259179 ) ( CLEAR ?auto_259178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_259178 )
      ( MAKE-10PILE ?auto_259178 ?auto_259179 ?auto_259180 ?auto_259181 ?auto_259182 ?auto_259183 ?auto_259184 ?auto_259185 ?auto_259186 ?auto_259187 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_259199 - BLOCK
      ?auto_259200 - BLOCK
      ?auto_259201 - BLOCK
      ?auto_259202 - BLOCK
      ?auto_259203 - BLOCK
      ?auto_259204 - BLOCK
      ?auto_259205 - BLOCK
      ?auto_259206 - BLOCK
      ?auto_259207 - BLOCK
      ?auto_259208 - BLOCK
    )
    :vars
    (
      ?auto_259209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259208 ?auto_259209 ) ( not ( = ?auto_259199 ?auto_259200 ) ) ( not ( = ?auto_259199 ?auto_259201 ) ) ( not ( = ?auto_259199 ?auto_259202 ) ) ( not ( = ?auto_259199 ?auto_259203 ) ) ( not ( = ?auto_259199 ?auto_259204 ) ) ( not ( = ?auto_259199 ?auto_259205 ) ) ( not ( = ?auto_259199 ?auto_259206 ) ) ( not ( = ?auto_259199 ?auto_259207 ) ) ( not ( = ?auto_259199 ?auto_259208 ) ) ( not ( = ?auto_259199 ?auto_259209 ) ) ( not ( = ?auto_259200 ?auto_259201 ) ) ( not ( = ?auto_259200 ?auto_259202 ) ) ( not ( = ?auto_259200 ?auto_259203 ) ) ( not ( = ?auto_259200 ?auto_259204 ) ) ( not ( = ?auto_259200 ?auto_259205 ) ) ( not ( = ?auto_259200 ?auto_259206 ) ) ( not ( = ?auto_259200 ?auto_259207 ) ) ( not ( = ?auto_259200 ?auto_259208 ) ) ( not ( = ?auto_259200 ?auto_259209 ) ) ( not ( = ?auto_259201 ?auto_259202 ) ) ( not ( = ?auto_259201 ?auto_259203 ) ) ( not ( = ?auto_259201 ?auto_259204 ) ) ( not ( = ?auto_259201 ?auto_259205 ) ) ( not ( = ?auto_259201 ?auto_259206 ) ) ( not ( = ?auto_259201 ?auto_259207 ) ) ( not ( = ?auto_259201 ?auto_259208 ) ) ( not ( = ?auto_259201 ?auto_259209 ) ) ( not ( = ?auto_259202 ?auto_259203 ) ) ( not ( = ?auto_259202 ?auto_259204 ) ) ( not ( = ?auto_259202 ?auto_259205 ) ) ( not ( = ?auto_259202 ?auto_259206 ) ) ( not ( = ?auto_259202 ?auto_259207 ) ) ( not ( = ?auto_259202 ?auto_259208 ) ) ( not ( = ?auto_259202 ?auto_259209 ) ) ( not ( = ?auto_259203 ?auto_259204 ) ) ( not ( = ?auto_259203 ?auto_259205 ) ) ( not ( = ?auto_259203 ?auto_259206 ) ) ( not ( = ?auto_259203 ?auto_259207 ) ) ( not ( = ?auto_259203 ?auto_259208 ) ) ( not ( = ?auto_259203 ?auto_259209 ) ) ( not ( = ?auto_259204 ?auto_259205 ) ) ( not ( = ?auto_259204 ?auto_259206 ) ) ( not ( = ?auto_259204 ?auto_259207 ) ) ( not ( = ?auto_259204 ?auto_259208 ) ) ( not ( = ?auto_259204 ?auto_259209 ) ) ( not ( = ?auto_259205 ?auto_259206 ) ) ( not ( = ?auto_259205 ?auto_259207 ) ) ( not ( = ?auto_259205 ?auto_259208 ) ) ( not ( = ?auto_259205 ?auto_259209 ) ) ( not ( = ?auto_259206 ?auto_259207 ) ) ( not ( = ?auto_259206 ?auto_259208 ) ) ( not ( = ?auto_259206 ?auto_259209 ) ) ( not ( = ?auto_259207 ?auto_259208 ) ) ( not ( = ?auto_259207 ?auto_259209 ) ) ( not ( = ?auto_259208 ?auto_259209 ) ) ( ON ?auto_259207 ?auto_259208 ) ( ON ?auto_259206 ?auto_259207 ) ( ON ?auto_259205 ?auto_259206 ) ( ON ?auto_259204 ?auto_259205 ) ( ON ?auto_259203 ?auto_259204 ) ( ON ?auto_259202 ?auto_259203 ) ( ON ?auto_259201 ?auto_259202 ) ( ON ?auto_259200 ?auto_259201 ) ( ON ?auto_259199 ?auto_259200 ) ( CLEAR ?auto_259199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_259199 )
      ( MAKE-10PILE ?auto_259199 ?auto_259200 ?auto_259201 ?auto_259202 ?auto_259203 ?auto_259204 ?auto_259205 ?auto_259206 ?auto_259207 ?auto_259208 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259221 - BLOCK
      ?auto_259222 - BLOCK
      ?auto_259223 - BLOCK
      ?auto_259224 - BLOCK
      ?auto_259225 - BLOCK
      ?auto_259226 - BLOCK
      ?auto_259227 - BLOCK
      ?auto_259228 - BLOCK
      ?auto_259229 - BLOCK
      ?auto_259230 - BLOCK
      ?auto_259231 - BLOCK
    )
    :vars
    (
      ?auto_259232 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_259230 ) ( ON ?auto_259231 ?auto_259232 ) ( CLEAR ?auto_259231 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_259221 ) ( ON ?auto_259222 ?auto_259221 ) ( ON ?auto_259223 ?auto_259222 ) ( ON ?auto_259224 ?auto_259223 ) ( ON ?auto_259225 ?auto_259224 ) ( ON ?auto_259226 ?auto_259225 ) ( ON ?auto_259227 ?auto_259226 ) ( ON ?auto_259228 ?auto_259227 ) ( ON ?auto_259229 ?auto_259228 ) ( ON ?auto_259230 ?auto_259229 ) ( not ( = ?auto_259221 ?auto_259222 ) ) ( not ( = ?auto_259221 ?auto_259223 ) ) ( not ( = ?auto_259221 ?auto_259224 ) ) ( not ( = ?auto_259221 ?auto_259225 ) ) ( not ( = ?auto_259221 ?auto_259226 ) ) ( not ( = ?auto_259221 ?auto_259227 ) ) ( not ( = ?auto_259221 ?auto_259228 ) ) ( not ( = ?auto_259221 ?auto_259229 ) ) ( not ( = ?auto_259221 ?auto_259230 ) ) ( not ( = ?auto_259221 ?auto_259231 ) ) ( not ( = ?auto_259221 ?auto_259232 ) ) ( not ( = ?auto_259222 ?auto_259223 ) ) ( not ( = ?auto_259222 ?auto_259224 ) ) ( not ( = ?auto_259222 ?auto_259225 ) ) ( not ( = ?auto_259222 ?auto_259226 ) ) ( not ( = ?auto_259222 ?auto_259227 ) ) ( not ( = ?auto_259222 ?auto_259228 ) ) ( not ( = ?auto_259222 ?auto_259229 ) ) ( not ( = ?auto_259222 ?auto_259230 ) ) ( not ( = ?auto_259222 ?auto_259231 ) ) ( not ( = ?auto_259222 ?auto_259232 ) ) ( not ( = ?auto_259223 ?auto_259224 ) ) ( not ( = ?auto_259223 ?auto_259225 ) ) ( not ( = ?auto_259223 ?auto_259226 ) ) ( not ( = ?auto_259223 ?auto_259227 ) ) ( not ( = ?auto_259223 ?auto_259228 ) ) ( not ( = ?auto_259223 ?auto_259229 ) ) ( not ( = ?auto_259223 ?auto_259230 ) ) ( not ( = ?auto_259223 ?auto_259231 ) ) ( not ( = ?auto_259223 ?auto_259232 ) ) ( not ( = ?auto_259224 ?auto_259225 ) ) ( not ( = ?auto_259224 ?auto_259226 ) ) ( not ( = ?auto_259224 ?auto_259227 ) ) ( not ( = ?auto_259224 ?auto_259228 ) ) ( not ( = ?auto_259224 ?auto_259229 ) ) ( not ( = ?auto_259224 ?auto_259230 ) ) ( not ( = ?auto_259224 ?auto_259231 ) ) ( not ( = ?auto_259224 ?auto_259232 ) ) ( not ( = ?auto_259225 ?auto_259226 ) ) ( not ( = ?auto_259225 ?auto_259227 ) ) ( not ( = ?auto_259225 ?auto_259228 ) ) ( not ( = ?auto_259225 ?auto_259229 ) ) ( not ( = ?auto_259225 ?auto_259230 ) ) ( not ( = ?auto_259225 ?auto_259231 ) ) ( not ( = ?auto_259225 ?auto_259232 ) ) ( not ( = ?auto_259226 ?auto_259227 ) ) ( not ( = ?auto_259226 ?auto_259228 ) ) ( not ( = ?auto_259226 ?auto_259229 ) ) ( not ( = ?auto_259226 ?auto_259230 ) ) ( not ( = ?auto_259226 ?auto_259231 ) ) ( not ( = ?auto_259226 ?auto_259232 ) ) ( not ( = ?auto_259227 ?auto_259228 ) ) ( not ( = ?auto_259227 ?auto_259229 ) ) ( not ( = ?auto_259227 ?auto_259230 ) ) ( not ( = ?auto_259227 ?auto_259231 ) ) ( not ( = ?auto_259227 ?auto_259232 ) ) ( not ( = ?auto_259228 ?auto_259229 ) ) ( not ( = ?auto_259228 ?auto_259230 ) ) ( not ( = ?auto_259228 ?auto_259231 ) ) ( not ( = ?auto_259228 ?auto_259232 ) ) ( not ( = ?auto_259229 ?auto_259230 ) ) ( not ( = ?auto_259229 ?auto_259231 ) ) ( not ( = ?auto_259229 ?auto_259232 ) ) ( not ( = ?auto_259230 ?auto_259231 ) ) ( not ( = ?auto_259230 ?auto_259232 ) ) ( not ( = ?auto_259231 ?auto_259232 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_259231 ?auto_259232 )
      ( !STACK ?auto_259231 ?auto_259230 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259244 - BLOCK
      ?auto_259245 - BLOCK
      ?auto_259246 - BLOCK
      ?auto_259247 - BLOCK
      ?auto_259248 - BLOCK
      ?auto_259249 - BLOCK
      ?auto_259250 - BLOCK
      ?auto_259251 - BLOCK
      ?auto_259252 - BLOCK
      ?auto_259253 - BLOCK
      ?auto_259254 - BLOCK
    )
    :vars
    (
      ?auto_259255 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_259253 ) ( ON ?auto_259254 ?auto_259255 ) ( CLEAR ?auto_259254 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_259244 ) ( ON ?auto_259245 ?auto_259244 ) ( ON ?auto_259246 ?auto_259245 ) ( ON ?auto_259247 ?auto_259246 ) ( ON ?auto_259248 ?auto_259247 ) ( ON ?auto_259249 ?auto_259248 ) ( ON ?auto_259250 ?auto_259249 ) ( ON ?auto_259251 ?auto_259250 ) ( ON ?auto_259252 ?auto_259251 ) ( ON ?auto_259253 ?auto_259252 ) ( not ( = ?auto_259244 ?auto_259245 ) ) ( not ( = ?auto_259244 ?auto_259246 ) ) ( not ( = ?auto_259244 ?auto_259247 ) ) ( not ( = ?auto_259244 ?auto_259248 ) ) ( not ( = ?auto_259244 ?auto_259249 ) ) ( not ( = ?auto_259244 ?auto_259250 ) ) ( not ( = ?auto_259244 ?auto_259251 ) ) ( not ( = ?auto_259244 ?auto_259252 ) ) ( not ( = ?auto_259244 ?auto_259253 ) ) ( not ( = ?auto_259244 ?auto_259254 ) ) ( not ( = ?auto_259244 ?auto_259255 ) ) ( not ( = ?auto_259245 ?auto_259246 ) ) ( not ( = ?auto_259245 ?auto_259247 ) ) ( not ( = ?auto_259245 ?auto_259248 ) ) ( not ( = ?auto_259245 ?auto_259249 ) ) ( not ( = ?auto_259245 ?auto_259250 ) ) ( not ( = ?auto_259245 ?auto_259251 ) ) ( not ( = ?auto_259245 ?auto_259252 ) ) ( not ( = ?auto_259245 ?auto_259253 ) ) ( not ( = ?auto_259245 ?auto_259254 ) ) ( not ( = ?auto_259245 ?auto_259255 ) ) ( not ( = ?auto_259246 ?auto_259247 ) ) ( not ( = ?auto_259246 ?auto_259248 ) ) ( not ( = ?auto_259246 ?auto_259249 ) ) ( not ( = ?auto_259246 ?auto_259250 ) ) ( not ( = ?auto_259246 ?auto_259251 ) ) ( not ( = ?auto_259246 ?auto_259252 ) ) ( not ( = ?auto_259246 ?auto_259253 ) ) ( not ( = ?auto_259246 ?auto_259254 ) ) ( not ( = ?auto_259246 ?auto_259255 ) ) ( not ( = ?auto_259247 ?auto_259248 ) ) ( not ( = ?auto_259247 ?auto_259249 ) ) ( not ( = ?auto_259247 ?auto_259250 ) ) ( not ( = ?auto_259247 ?auto_259251 ) ) ( not ( = ?auto_259247 ?auto_259252 ) ) ( not ( = ?auto_259247 ?auto_259253 ) ) ( not ( = ?auto_259247 ?auto_259254 ) ) ( not ( = ?auto_259247 ?auto_259255 ) ) ( not ( = ?auto_259248 ?auto_259249 ) ) ( not ( = ?auto_259248 ?auto_259250 ) ) ( not ( = ?auto_259248 ?auto_259251 ) ) ( not ( = ?auto_259248 ?auto_259252 ) ) ( not ( = ?auto_259248 ?auto_259253 ) ) ( not ( = ?auto_259248 ?auto_259254 ) ) ( not ( = ?auto_259248 ?auto_259255 ) ) ( not ( = ?auto_259249 ?auto_259250 ) ) ( not ( = ?auto_259249 ?auto_259251 ) ) ( not ( = ?auto_259249 ?auto_259252 ) ) ( not ( = ?auto_259249 ?auto_259253 ) ) ( not ( = ?auto_259249 ?auto_259254 ) ) ( not ( = ?auto_259249 ?auto_259255 ) ) ( not ( = ?auto_259250 ?auto_259251 ) ) ( not ( = ?auto_259250 ?auto_259252 ) ) ( not ( = ?auto_259250 ?auto_259253 ) ) ( not ( = ?auto_259250 ?auto_259254 ) ) ( not ( = ?auto_259250 ?auto_259255 ) ) ( not ( = ?auto_259251 ?auto_259252 ) ) ( not ( = ?auto_259251 ?auto_259253 ) ) ( not ( = ?auto_259251 ?auto_259254 ) ) ( not ( = ?auto_259251 ?auto_259255 ) ) ( not ( = ?auto_259252 ?auto_259253 ) ) ( not ( = ?auto_259252 ?auto_259254 ) ) ( not ( = ?auto_259252 ?auto_259255 ) ) ( not ( = ?auto_259253 ?auto_259254 ) ) ( not ( = ?auto_259253 ?auto_259255 ) ) ( not ( = ?auto_259254 ?auto_259255 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_259254 ?auto_259255 )
      ( !STACK ?auto_259254 ?auto_259253 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259267 - BLOCK
      ?auto_259268 - BLOCK
      ?auto_259269 - BLOCK
      ?auto_259270 - BLOCK
      ?auto_259271 - BLOCK
      ?auto_259272 - BLOCK
      ?auto_259273 - BLOCK
      ?auto_259274 - BLOCK
      ?auto_259275 - BLOCK
      ?auto_259276 - BLOCK
      ?auto_259277 - BLOCK
    )
    :vars
    (
      ?auto_259278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259277 ?auto_259278 ) ( ON-TABLE ?auto_259267 ) ( ON ?auto_259268 ?auto_259267 ) ( ON ?auto_259269 ?auto_259268 ) ( ON ?auto_259270 ?auto_259269 ) ( ON ?auto_259271 ?auto_259270 ) ( ON ?auto_259272 ?auto_259271 ) ( ON ?auto_259273 ?auto_259272 ) ( ON ?auto_259274 ?auto_259273 ) ( ON ?auto_259275 ?auto_259274 ) ( not ( = ?auto_259267 ?auto_259268 ) ) ( not ( = ?auto_259267 ?auto_259269 ) ) ( not ( = ?auto_259267 ?auto_259270 ) ) ( not ( = ?auto_259267 ?auto_259271 ) ) ( not ( = ?auto_259267 ?auto_259272 ) ) ( not ( = ?auto_259267 ?auto_259273 ) ) ( not ( = ?auto_259267 ?auto_259274 ) ) ( not ( = ?auto_259267 ?auto_259275 ) ) ( not ( = ?auto_259267 ?auto_259276 ) ) ( not ( = ?auto_259267 ?auto_259277 ) ) ( not ( = ?auto_259267 ?auto_259278 ) ) ( not ( = ?auto_259268 ?auto_259269 ) ) ( not ( = ?auto_259268 ?auto_259270 ) ) ( not ( = ?auto_259268 ?auto_259271 ) ) ( not ( = ?auto_259268 ?auto_259272 ) ) ( not ( = ?auto_259268 ?auto_259273 ) ) ( not ( = ?auto_259268 ?auto_259274 ) ) ( not ( = ?auto_259268 ?auto_259275 ) ) ( not ( = ?auto_259268 ?auto_259276 ) ) ( not ( = ?auto_259268 ?auto_259277 ) ) ( not ( = ?auto_259268 ?auto_259278 ) ) ( not ( = ?auto_259269 ?auto_259270 ) ) ( not ( = ?auto_259269 ?auto_259271 ) ) ( not ( = ?auto_259269 ?auto_259272 ) ) ( not ( = ?auto_259269 ?auto_259273 ) ) ( not ( = ?auto_259269 ?auto_259274 ) ) ( not ( = ?auto_259269 ?auto_259275 ) ) ( not ( = ?auto_259269 ?auto_259276 ) ) ( not ( = ?auto_259269 ?auto_259277 ) ) ( not ( = ?auto_259269 ?auto_259278 ) ) ( not ( = ?auto_259270 ?auto_259271 ) ) ( not ( = ?auto_259270 ?auto_259272 ) ) ( not ( = ?auto_259270 ?auto_259273 ) ) ( not ( = ?auto_259270 ?auto_259274 ) ) ( not ( = ?auto_259270 ?auto_259275 ) ) ( not ( = ?auto_259270 ?auto_259276 ) ) ( not ( = ?auto_259270 ?auto_259277 ) ) ( not ( = ?auto_259270 ?auto_259278 ) ) ( not ( = ?auto_259271 ?auto_259272 ) ) ( not ( = ?auto_259271 ?auto_259273 ) ) ( not ( = ?auto_259271 ?auto_259274 ) ) ( not ( = ?auto_259271 ?auto_259275 ) ) ( not ( = ?auto_259271 ?auto_259276 ) ) ( not ( = ?auto_259271 ?auto_259277 ) ) ( not ( = ?auto_259271 ?auto_259278 ) ) ( not ( = ?auto_259272 ?auto_259273 ) ) ( not ( = ?auto_259272 ?auto_259274 ) ) ( not ( = ?auto_259272 ?auto_259275 ) ) ( not ( = ?auto_259272 ?auto_259276 ) ) ( not ( = ?auto_259272 ?auto_259277 ) ) ( not ( = ?auto_259272 ?auto_259278 ) ) ( not ( = ?auto_259273 ?auto_259274 ) ) ( not ( = ?auto_259273 ?auto_259275 ) ) ( not ( = ?auto_259273 ?auto_259276 ) ) ( not ( = ?auto_259273 ?auto_259277 ) ) ( not ( = ?auto_259273 ?auto_259278 ) ) ( not ( = ?auto_259274 ?auto_259275 ) ) ( not ( = ?auto_259274 ?auto_259276 ) ) ( not ( = ?auto_259274 ?auto_259277 ) ) ( not ( = ?auto_259274 ?auto_259278 ) ) ( not ( = ?auto_259275 ?auto_259276 ) ) ( not ( = ?auto_259275 ?auto_259277 ) ) ( not ( = ?auto_259275 ?auto_259278 ) ) ( not ( = ?auto_259276 ?auto_259277 ) ) ( not ( = ?auto_259276 ?auto_259278 ) ) ( not ( = ?auto_259277 ?auto_259278 ) ) ( CLEAR ?auto_259275 ) ( ON ?auto_259276 ?auto_259277 ) ( CLEAR ?auto_259276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_259267 ?auto_259268 ?auto_259269 ?auto_259270 ?auto_259271 ?auto_259272 ?auto_259273 ?auto_259274 ?auto_259275 ?auto_259276 )
      ( MAKE-11PILE ?auto_259267 ?auto_259268 ?auto_259269 ?auto_259270 ?auto_259271 ?auto_259272 ?auto_259273 ?auto_259274 ?auto_259275 ?auto_259276 ?auto_259277 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259290 - BLOCK
      ?auto_259291 - BLOCK
      ?auto_259292 - BLOCK
      ?auto_259293 - BLOCK
      ?auto_259294 - BLOCK
      ?auto_259295 - BLOCK
      ?auto_259296 - BLOCK
      ?auto_259297 - BLOCK
      ?auto_259298 - BLOCK
      ?auto_259299 - BLOCK
      ?auto_259300 - BLOCK
    )
    :vars
    (
      ?auto_259301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259300 ?auto_259301 ) ( ON-TABLE ?auto_259290 ) ( ON ?auto_259291 ?auto_259290 ) ( ON ?auto_259292 ?auto_259291 ) ( ON ?auto_259293 ?auto_259292 ) ( ON ?auto_259294 ?auto_259293 ) ( ON ?auto_259295 ?auto_259294 ) ( ON ?auto_259296 ?auto_259295 ) ( ON ?auto_259297 ?auto_259296 ) ( ON ?auto_259298 ?auto_259297 ) ( not ( = ?auto_259290 ?auto_259291 ) ) ( not ( = ?auto_259290 ?auto_259292 ) ) ( not ( = ?auto_259290 ?auto_259293 ) ) ( not ( = ?auto_259290 ?auto_259294 ) ) ( not ( = ?auto_259290 ?auto_259295 ) ) ( not ( = ?auto_259290 ?auto_259296 ) ) ( not ( = ?auto_259290 ?auto_259297 ) ) ( not ( = ?auto_259290 ?auto_259298 ) ) ( not ( = ?auto_259290 ?auto_259299 ) ) ( not ( = ?auto_259290 ?auto_259300 ) ) ( not ( = ?auto_259290 ?auto_259301 ) ) ( not ( = ?auto_259291 ?auto_259292 ) ) ( not ( = ?auto_259291 ?auto_259293 ) ) ( not ( = ?auto_259291 ?auto_259294 ) ) ( not ( = ?auto_259291 ?auto_259295 ) ) ( not ( = ?auto_259291 ?auto_259296 ) ) ( not ( = ?auto_259291 ?auto_259297 ) ) ( not ( = ?auto_259291 ?auto_259298 ) ) ( not ( = ?auto_259291 ?auto_259299 ) ) ( not ( = ?auto_259291 ?auto_259300 ) ) ( not ( = ?auto_259291 ?auto_259301 ) ) ( not ( = ?auto_259292 ?auto_259293 ) ) ( not ( = ?auto_259292 ?auto_259294 ) ) ( not ( = ?auto_259292 ?auto_259295 ) ) ( not ( = ?auto_259292 ?auto_259296 ) ) ( not ( = ?auto_259292 ?auto_259297 ) ) ( not ( = ?auto_259292 ?auto_259298 ) ) ( not ( = ?auto_259292 ?auto_259299 ) ) ( not ( = ?auto_259292 ?auto_259300 ) ) ( not ( = ?auto_259292 ?auto_259301 ) ) ( not ( = ?auto_259293 ?auto_259294 ) ) ( not ( = ?auto_259293 ?auto_259295 ) ) ( not ( = ?auto_259293 ?auto_259296 ) ) ( not ( = ?auto_259293 ?auto_259297 ) ) ( not ( = ?auto_259293 ?auto_259298 ) ) ( not ( = ?auto_259293 ?auto_259299 ) ) ( not ( = ?auto_259293 ?auto_259300 ) ) ( not ( = ?auto_259293 ?auto_259301 ) ) ( not ( = ?auto_259294 ?auto_259295 ) ) ( not ( = ?auto_259294 ?auto_259296 ) ) ( not ( = ?auto_259294 ?auto_259297 ) ) ( not ( = ?auto_259294 ?auto_259298 ) ) ( not ( = ?auto_259294 ?auto_259299 ) ) ( not ( = ?auto_259294 ?auto_259300 ) ) ( not ( = ?auto_259294 ?auto_259301 ) ) ( not ( = ?auto_259295 ?auto_259296 ) ) ( not ( = ?auto_259295 ?auto_259297 ) ) ( not ( = ?auto_259295 ?auto_259298 ) ) ( not ( = ?auto_259295 ?auto_259299 ) ) ( not ( = ?auto_259295 ?auto_259300 ) ) ( not ( = ?auto_259295 ?auto_259301 ) ) ( not ( = ?auto_259296 ?auto_259297 ) ) ( not ( = ?auto_259296 ?auto_259298 ) ) ( not ( = ?auto_259296 ?auto_259299 ) ) ( not ( = ?auto_259296 ?auto_259300 ) ) ( not ( = ?auto_259296 ?auto_259301 ) ) ( not ( = ?auto_259297 ?auto_259298 ) ) ( not ( = ?auto_259297 ?auto_259299 ) ) ( not ( = ?auto_259297 ?auto_259300 ) ) ( not ( = ?auto_259297 ?auto_259301 ) ) ( not ( = ?auto_259298 ?auto_259299 ) ) ( not ( = ?auto_259298 ?auto_259300 ) ) ( not ( = ?auto_259298 ?auto_259301 ) ) ( not ( = ?auto_259299 ?auto_259300 ) ) ( not ( = ?auto_259299 ?auto_259301 ) ) ( not ( = ?auto_259300 ?auto_259301 ) ) ( CLEAR ?auto_259298 ) ( ON ?auto_259299 ?auto_259300 ) ( CLEAR ?auto_259299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_259290 ?auto_259291 ?auto_259292 ?auto_259293 ?auto_259294 ?auto_259295 ?auto_259296 ?auto_259297 ?auto_259298 ?auto_259299 )
      ( MAKE-11PILE ?auto_259290 ?auto_259291 ?auto_259292 ?auto_259293 ?auto_259294 ?auto_259295 ?auto_259296 ?auto_259297 ?auto_259298 ?auto_259299 ?auto_259300 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259313 - BLOCK
      ?auto_259314 - BLOCK
      ?auto_259315 - BLOCK
      ?auto_259316 - BLOCK
      ?auto_259317 - BLOCK
      ?auto_259318 - BLOCK
      ?auto_259319 - BLOCK
      ?auto_259320 - BLOCK
      ?auto_259321 - BLOCK
      ?auto_259322 - BLOCK
      ?auto_259323 - BLOCK
    )
    :vars
    (
      ?auto_259324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259323 ?auto_259324 ) ( ON-TABLE ?auto_259313 ) ( ON ?auto_259314 ?auto_259313 ) ( ON ?auto_259315 ?auto_259314 ) ( ON ?auto_259316 ?auto_259315 ) ( ON ?auto_259317 ?auto_259316 ) ( ON ?auto_259318 ?auto_259317 ) ( ON ?auto_259319 ?auto_259318 ) ( ON ?auto_259320 ?auto_259319 ) ( not ( = ?auto_259313 ?auto_259314 ) ) ( not ( = ?auto_259313 ?auto_259315 ) ) ( not ( = ?auto_259313 ?auto_259316 ) ) ( not ( = ?auto_259313 ?auto_259317 ) ) ( not ( = ?auto_259313 ?auto_259318 ) ) ( not ( = ?auto_259313 ?auto_259319 ) ) ( not ( = ?auto_259313 ?auto_259320 ) ) ( not ( = ?auto_259313 ?auto_259321 ) ) ( not ( = ?auto_259313 ?auto_259322 ) ) ( not ( = ?auto_259313 ?auto_259323 ) ) ( not ( = ?auto_259313 ?auto_259324 ) ) ( not ( = ?auto_259314 ?auto_259315 ) ) ( not ( = ?auto_259314 ?auto_259316 ) ) ( not ( = ?auto_259314 ?auto_259317 ) ) ( not ( = ?auto_259314 ?auto_259318 ) ) ( not ( = ?auto_259314 ?auto_259319 ) ) ( not ( = ?auto_259314 ?auto_259320 ) ) ( not ( = ?auto_259314 ?auto_259321 ) ) ( not ( = ?auto_259314 ?auto_259322 ) ) ( not ( = ?auto_259314 ?auto_259323 ) ) ( not ( = ?auto_259314 ?auto_259324 ) ) ( not ( = ?auto_259315 ?auto_259316 ) ) ( not ( = ?auto_259315 ?auto_259317 ) ) ( not ( = ?auto_259315 ?auto_259318 ) ) ( not ( = ?auto_259315 ?auto_259319 ) ) ( not ( = ?auto_259315 ?auto_259320 ) ) ( not ( = ?auto_259315 ?auto_259321 ) ) ( not ( = ?auto_259315 ?auto_259322 ) ) ( not ( = ?auto_259315 ?auto_259323 ) ) ( not ( = ?auto_259315 ?auto_259324 ) ) ( not ( = ?auto_259316 ?auto_259317 ) ) ( not ( = ?auto_259316 ?auto_259318 ) ) ( not ( = ?auto_259316 ?auto_259319 ) ) ( not ( = ?auto_259316 ?auto_259320 ) ) ( not ( = ?auto_259316 ?auto_259321 ) ) ( not ( = ?auto_259316 ?auto_259322 ) ) ( not ( = ?auto_259316 ?auto_259323 ) ) ( not ( = ?auto_259316 ?auto_259324 ) ) ( not ( = ?auto_259317 ?auto_259318 ) ) ( not ( = ?auto_259317 ?auto_259319 ) ) ( not ( = ?auto_259317 ?auto_259320 ) ) ( not ( = ?auto_259317 ?auto_259321 ) ) ( not ( = ?auto_259317 ?auto_259322 ) ) ( not ( = ?auto_259317 ?auto_259323 ) ) ( not ( = ?auto_259317 ?auto_259324 ) ) ( not ( = ?auto_259318 ?auto_259319 ) ) ( not ( = ?auto_259318 ?auto_259320 ) ) ( not ( = ?auto_259318 ?auto_259321 ) ) ( not ( = ?auto_259318 ?auto_259322 ) ) ( not ( = ?auto_259318 ?auto_259323 ) ) ( not ( = ?auto_259318 ?auto_259324 ) ) ( not ( = ?auto_259319 ?auto_259320 ) ) ( not ( = ?auto_259319 ?auto_259321 ) ) ( not ( = ?auto_259319 ?auto_259322 ) ) ( not ( = ?auto_259319 ?auto_259323 ) ) ( not ( = ?auto_259319 ?auto_259324 ) ) ( not ( = ?auto_259320 ?auto_259321 ) ) ( not ( = ?auto_259320 ?auto_259322 ) ) ( not ( = ?auto_259320 ?auto_259323 ) ) ( not ( = ?auto_259320 ?auto_259324 ) ) ( not ( = ?auto_259321 ?auto_259322 ) ) ( not ( = ?auto_259321 ?auto_259323 ) ) ( not ( = ?auto_259321 ?auto_259324 ) ) ( not ( = ?auto_259322 ?auto_259323 ) ) ( not ( = ?auto_259322 ?auto_259324 ) ) ( not ( = ?auto_259323 ?auto_259324 ) ) ( ON ?auto_259322 ?auto_259323 ) ( CLEAR ?auto_259320 ) ( ON ?auto_259321 ?auto_259322 ) ( CLEAR ?auto_259321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_259313 ?auto_259314 ?auto_259315 ?auto_259316 ?auto_259317 ?auto_259318 ?auto_259319 ?auto_259320 ?auto_259321 )
      ( MAKE-11PILE ?auto_259313 ?auto_259314 ?auto_259315 ?auto_259316 ?auto_259317 ?auto_259318 ?auto_259319 ?auto_259320 ?auto_259321 ?auto_259322 ?auto_259323 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259336 - BLOCK
      ?auto_259337 - BLOCK
      ?auto_259338 - BLOCK
      ?auto_259339 - BLOCK
      ?auto_259340 - BLOCK
      ?auto_259341 - BLOCK
      ?auto_259342 - BLOCK
      ?auto_259343 - BLOCK
      ?auto_259344 - BLOCK
      ?auto_259345 - BLOCK
      ?auto_259346 - BLOCK
    )
    :vars
    (
      ?auto_259347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259346 ?auto_259347 ) ( ON-TABLE ?auto_259336 ) ( ON ?auto_259337 ?auto_259336 ) ( ON ?auto_259338 ?auto_259337 ) ( ON ?auto_259339 ?auto_259338 ) ( ON ?auto_259340 ?auto_259339 ) ( ON ?auto_259341 ?auto_259340 ) ( ON ?auto_259342 ?auto_259341 ) ( ON ?auto_259343 ?auto_259342 ) ( not ( = ?auto_259336 ?auto_259337 ) ) ( not ( = ?auto_259336 ?auto_259338 ) ) ( not ( = ?auto_259336 ?auto_259339 ) ) ( not ( = ?auto_259336 ?auto_259340 ) ) ( not ( = ?auto_259336 ?auto_259341 ) ) ( not ( = ?auto_259336 ?auto_259342 ) ) ( not ( = ?auto_259336 ?auto_259343 ) ) ( not ( = ?auto_259336 ?auto_259344 ) ) ( not ( = ?auto_259336 ?auto_259345 ) ) ( not ( = ?auto_259336 ?auto_259346 ) ) ( not ( = ?auto_259336 ?auto_259347 ) ) ( not ( = ?auto_259337 ?auto_259338 ) ) ( not ( = ?auto_259337 ?auto_259339 ) ) ( not ( = ?auto_259337 ?auto_259340 ) ) ( not ( = ?auto_259337 ?auto_259341 ) ) ( not ( = ?auto_259337 ?auto_259342 ) ) ( not ( = ?auto_259337 ?auto_259343 ) ) ( not ( = ?auto_259337 ?auto_259344 ) ) ( not ( = ?auto_259337 ?auto_259345 ) ) ( not ( = ?auto_259337 ?auto_259346 ) ) ( not ( = ?auto_259337 ?auto_259347 ) ) ( not ( = ?auto_259338 ?auto_259339 ) ) ( not ( = ?auto_259338 ?auto_259340 ) ) ( not ( = ?auto_259338 ?auto_259341 ) ) ( not ( = ?auto_259338 ?auto_259342 ) ) ( not ( = ?auto_259338 ?auto_259343 ) ) ( not ( = ?auto_259338 ?auto_259344 ) ) ( not ( = ?auto_259338 ?auto_259345 ) ) ( not ( = ?auto_259338 ?auto_259346 ) ) ( not ( = ?auto_259338 ?auto_259347 ) ) ( not ( = ?auto_259339 ?auto_259340 ) ) ( not ( = ?auto_259339 ?auto_259341 ) ) ( not ( = ?auto_259339 ?auto_259342 ) ) ( not ( = ?auto_259339 ?auto_259343 ) ) ( not ( = ?auto_259339 ?auto_259344 ) ) ( not ( = ?auto_259339 ?auto_259345 ) ) ( not ( = ?auto_259339 ?auto_259346 ) ) ( not ( = ?auto_259339 ?auto_259347 ) ) ( not ( = ?auto_259340 ?auto_259341 ) ) ( not ( = ?auto_259340 ?auto_259342 ) ) ( not ( = ?auto_259340 ?auto_259343 ) ) ( not ( = ?auto_259340 ?auto_259344 ) ) ( not ( = ?auto_259340 ?auto_259345 ) ) ( not ( = ?auto_259340 ?auto_259346 ) ) ( not ( = ?auto_259340 ?auto_259347 ) ) ( not ( = ?auto_259341 ?auto_259342 ) ) ( not ( = ?auto_259341 ?auto_259343 ) ) ( not ( = ?auto_259341 ?auto_259344 ) ) ( not ( = ?auto_259341 ?auto_259345 ) ) ( not ( = ?auto_259341 ?auto_259346 ) ) ( not ( = ?auto_259341 ?auto_259347 ) ) ( not ( = ?auto_259342 ?auto_259343 ) ) ( not ( = ?auto_259342 ?auto_259344 ) ) ( not ( = ?auto_259342 ?auto_259345 ) ) ( not ( = ?auto_259342 ?auto_259346 ) ) ( not ( = ?auto_259342 ?auto_259347 ) ) ( not ( = ?auto_259343 ?auto_259344 ) ) ( not ( = ?auto_259343 ?auto_259345 ) ) ( not ( = ?auto_259343 ?auto_259346 ) ) ( not ( = ?auto_259343 ?auto_259347 ) ) ( not ( = ?auto_259344 ?auto_259345 ) ) ( not ( = ?auto_259344 ?auto_259346 ) ) ( not ( = ?auto_259344 ?auto_259347 ) ) ( not ( = ?auto_259345 ?auto_259346 ) ) ( not ( = ?auto_259345 ?auto_259347 ) ) ( not ( = ?auto_259346 ?auto_259347 ) ) ( ON ?auto_259345 ?auto_259346 ) ( CLEAR ?auto_259343 ) ( ON ?auto_259344 ?auto_259345 ) ( CLEAR ?auto_259344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_259336 ?auto_259337 ?auto_259338 ?auto_259339 ?auto_259340 ?auto_259341 ?auto_259342 ?auto_259343 ?auto_259344 )
      ( MAKE-11PILE ?auto_259336 ?auto_259337 ?auto_259338 ?auto_259339 ?auto_259340 ?auto_259341 ?auto_259342 ?auto_259343 ?auto_259344 ?auto_259345 ?auto_259346 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259359 - BLOCK
      ?auto_259360 - BLOCK
      ?auto_259361 - BLOCK
      ?auto_259362 - BLOCK
      ?auto_259363 - BLOCK
      ?auto_259364 - BLOCK
      ?auto_259365 - BLOCK
      ?auto_259366 - BLOCK
      ?auto_259367 - BLOCK
      ?auto_259368 - BLOCK
      ?auto_259369 - BLOCK
    )
    :vars
    (
      ?auto_259370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259369 ?auto_259370 ) ( ON-TABLE ?auto_259359 ) ( ON ?auto_259360 ?auto_259359 ) ( ON ?auto_259361 ?auto_259360 ) ( ON ?auto_259362 ?auto_259361 ) ( ON ?auto_259363 ?auto_259362 ) ( ON ?auto_259364 ?auto_259363 ) ( ON ?auto_259365 ?auto_259364 ) ( not ( = ?auto_259359 ?auto_259360 ) ) ( not ( = ?auto_259359 ?auto_259361 ) ) ( not ( = ?auto_259359 ?auto_259362 ) ) ( not ( = ?auto_259359 ?auto_259363 ) ) ( not ( = ?auto_259359 ?auto_259364 ) ) ( not ( = ?auto_259359 ?auto_259365 ) ) ( not ( = ?auto_259359 ?auto_259366 ) ) ( not ( = ?auto_259359 ?auto_259367 ) ) ( not ( = ?auto_259359 ?auto_259368 ) ) ( not ( = ?auto_259359 ?auto_259369 ) ) ( not ( = ?auto_259359 ?auto_259370 ) ) ( not ( = ?auto_259360 ?auto_259361 ) ) ( not ( = ?auto_259360 ?auto_259362 ) ) ( not ( = ?auto_259360 ?auto_259363 ) ) ( not ( = ?auto_259360 ?auto_259364 ) ) ( not ( = ?auto_259360 ?auto_259365 ) ) ( not ( = ?auto_259360 ?auto_259366 ) ) ( not ( = ?auto_259360 ?auto_259367 ) ) ( not ( = ?auto_259360 ?auto_259368 ) ) ( not ( = ?auto_259360 ?auto_259369 ) ) ( not ( = ?auto_259360 ?auto_259370 ) ) ( not ( = ?auto_259361 ?auto_259362 ) ) ( not ( = ?auto_259361 ?auto_259363 ) ) ( not ( = ?auto_259361 ?auto_259364 ) ) ( not ( = ?auto_259361 ?auto_259365 ) ) ( not ( = ?auto_259361 ?auto_259366 ) ) ( not ( = ?auto_259361 ?auto_259367 ) ) ( not ( = ?auto_259361 ?auto_259368 ) ) ( not ( = ?auto_259361 ?auto_259369 ) ) ( not ( = ?auto_259361 ?auto_259370 ) ) ( not ( = ?auto_259362 ?auto_259363 ) ) ( not ( = ?auto_259362 ?auto_259364 ) ) ( not ( = ?auto_259362 ?auto_259365 ) ) ( not ( = ?auto_259362 ?auto_259366 ) ) ( not ( = ?auto_259362 ?auto_259367 ) ) ( not ( = ?auto_259362 ?auto_259368 ) ) ( not ( = ?auto_259362 ?auto_259369 ) ) ( not ( = ?auto_259362 ?auto_259370 ) ) ( not ( = ?auto_259363 ?auto_259364 ) ) ( not ( = ?auto_259363 ?auto_259365 ) ) ( not ( = ?auto_259363 ?auto_259366 ) ) ( not ( = ?auto_259363 ?auto_259367 ) ) ( not ( = ?auto_259363 ?auto_259368 ) ) ( not ( = ?auto_259363 ?auto_259369 ) ) ( not ( = ?auto_259363 ?auto_259370 ) ) ( not ( = ?auto_259364 ?auto_259365 ) ) ( not ( = ?auto_259364 ?auto_259366 ) ) ( not ( = ?auto_259364 ?auto_259367 ) ) ( not ( = ?auto_259364 ?auto_259368 ) ) ( not ( = ?auto_259364 ?auto_259369 ) ) ( not ( = ?auto_259364 ?auto_259370 ) ) ( not ( = ?auto_259365 ?auto_259366 ) ) ( not ( = ?auto_259365 ?auto_259367 ) ) ( not ( = ?auto_259365 ?auto_259368 ) ) ( not ( = ?auto_259365 ?auto_259369 ) ) ( not ( = ?auto_259365 ?auto_259370 ) ) ( not ( = ?auto_259366 ?auto_259367 ) ) ( not ( = ?auto_259366 ?auto_259368 ) ) ( not ( = ?auto_259366 ?auto_259369 ) ) ( not ( = ?auto_259366 ?auto_259370 ) ) ( not ( = ?auto_259367 ?auto_259368 ) ) ( not ( = ?auto_259367 ?auto_259369 ) ) ( not ( = ?auto_259367 ?auto_259370 ) ) ( not ( = ?auto_259368 ?auto_259369 ) ) ( not ( = ?auto_259368 ?auto_259370 ) ) ( not ( = ?auto_259369 ?auto_259370 ) ) ( ON ?auto_259368 ?auto_259369 ) ( ON ?auto_259367 ?auto_259368 ) ( CLEAR ?auto_259365 ) ( ON ?auto_259366 ?auto_259367 ) ( CLEAR ?auto_259366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_259359 ?auto_259360 ?auto_259361 ?auto_259362 ?auto_259363 ?auto_259364 ?auto_259365 ?auto_259366 )
      ( MAKE-11PILE ?auto_259359 ?auto_259360 ?auto_259361 ?auto_259362 ?auto_259363 ?auto_259364 ?auto_259365 ?auto_259366 ?auto_259367 ?auto_259368 ?auto_259369 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259382 - BLOCK
      ?auto_259383 - BLOCK
      ?auto_259384 - BLOCK
      ?auto_259385 - BLOCK
      ?auto_259386 - BLOCK
      ?auto_259387 - BLOCK
      ?auto_259388 - BLOCK
      ?auto_259389 - BLOCK
      ?auto_259390 - BLOCK
      ?auto_259391 - BLOCK
      ?auto_259392 - BLOCK
    )
    :vars
    (
      ?auto_259393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259392 ?auto_259393 ) ( ON-TABLE ?auto_259382 ) ( ON ?auto_259383 ?auto_259382 ) ( ON ?auto_259384 ?auto_259383 ) ( ON ?auto_259385 ?auto_259384 ) ( ON ?auto_259386 ?auto_259385 ) ( ON ?auto_259387 ?auto_259386 ) ( ON ?auto_259388 ?auto_259387 ) ( not ( = ?auto_259382 ?auto_259383 ) ) ( not ( = ?auto_259382 ?auto_259384 ) ) ( not ( = ?auto_259382 ?auto_259385 ) ) ( not ( = ?auto_259382 ?auto_259386 ) ) ( not ( = ?auto_259382 ?auto_259387 ) ) ( not ( = ?auto_259382 ?auto_259388 ) ) ( not ( = ?auto_259382 ?auto_259389 ) ) ( not ( = ?auto_259382 ?auto_259390 ) ) ( not ( = ?auto_259382 ?auto_259391 ) ) ( not ( = ?auto_259382 ?auto_259392 ) ) ( not ( = ?auto_259382 ?auto_259393 ) ) ( not ( = ?auto_259383 ?auto_259384 ) ) ( not ( = ?auto_259383 ?auto_259385 ) ) ( not ( = ?auto_259383 ?auto_259386 ) ) ( not ( = ?auto_259383 ?auto_259387 ) ) ( not ( = ?auto_259383 ?auto_259388 ) ) ( not ( = ?auto_259383 ?auto_259389 ) ) ( not ( = ?auto_259383 ?auto_259390 ) ) ( not ( = ?auto_259383 ?auto_259391 ) ) ( not ( = ?auto_259383 ?auto_259392 ) ) ( not ( = ?auto_259383 ?auto_259393 ) ) ( not ( = ?auto_259384 ?auto_259385 ) ) ( not ( = ?auto_259384 ?auto_259386 ) ) ( not ( = ?auto_259384 ?auto_259387 ) ) ( not ( = ?auto_259384 ?auto_259388 ) ) ( not ( = ?auto_259384 ?auto_259389 ) ) ( not ( = ?auto_259384 ?auto_259390 ) ) ( not ( = ?auto_259384 ?auto_259391 ) ) ( not ( = ?auto_259384 ?auto_259392 ) ) ( not ( = ?auto_259384 ?auto_259393 ) ) ( not ( = ?auto_259385 ?auto_259386 ) ) ( not ( = ?auto_259385 ?auto_259387 ) ) ( not ( = ?auto_259385 ?auto_259388 ) ) ( not ( = ?auto_259385 ?auto_259389 ) ) ( not ( = ?auto_259385 ?auto_259390 ) ) ( not ( = ?auto_259385 ?auto_259391 ) ) ( not ( = ?auto_259385 ?auto_259392 ) ) ( not ( = ?auto_259385 ?auto_259393 ) ) ( not ( = ?auto_259386 ?auto_259387 ) ) ( not ( = ?auto_259386 ?auto_259388 ) ) ( not ( = ?auto_259386 ?auto_259389 ) ) ( not ( = ?auto_259386 ?auto_259390 ) ) ( not ( = ?auto_259386 ?auto_259391 ) ) ( not ( = ?auto_259386 ?auto_259392 ) ) ( not ( = ?auto_259386 ?auto_259393 ) ) ( not ( = ?auto_259387 ?auto_259388 ) ) ( not ( = ?auto_259387 ?auto_259389 ) ) ( not ( = ?auto_259387 ?auto_259390 ) ) ( not ( = ?auto_259387 ?auto_259391 ) ) ( not ( = ?auto_259387 ?auto_259392 ) ) ( not ( = ?auto_259387 ?auto_259393 ) ) ( not ( = ?auto_259388 ?auto_259389 ) ) ( not ( = ?auto_259388 ?auto_259390 ) ) ( not ( = ?auto_259388 ?auto_259391 ) ) ( not ( = ?auto_259388 ?auto_259392 ) ) ( not ( = ?auto_259388 ?auto_259393 ) ) ( not ( = ?auto_259389 ?auto_259390 ) ) ( not ( = ?auto_259389 ?auto_259391 ) ) ( not ( = ?auto_259389 ?auto_259392 ) ) ( not ( = ?auto_259389 ?auto_259393 ) ) ( not ( = ?auto_259390 ?auto_259391 ) ) ( not ( = ?auto_259390 ?auto_259392 ) ) ( not ( = ?auto_259390 ?auto_259393 ) ) ( not ( = ?auto_259391 ?auto_259392 ) ) ( not ( = ?auto_259391 ?auto_259393 ) ) ( not ( = ?auto_259392 ?auto_259393 ) ) ( ON ?auto_259391 ?auto_259392 ) ( ON ?auto_259390 ?auto_259391 ) ( CLEAR ?auto_259388 ) ( ON ?auto_259389 ?auto_259390 ) ( CLEAR ?auto_259389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_259382 ?auto_259383 ?auto_259384 ?auto_259385 ?auto_259386 ?auto_259387 ?auto_259388 ?auto_259389 )
      ( MAKE-11PILE ?auto_259382 ?auto_259383 ?auto_259384 ?auto_259385 ?auto_259386 ?auto_259387 ?auto_259388 ?auto_259389 ?auto_259390 ?auto_259391 ?auto_259392 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259405 - BLOCK
      ?auto_259406 - BLOCK
      ?auto_259407 - BLOCK
      ?auto_259408 - BLOCK
      ?auto_259409 - BLOCK
      ?auto_259410 - BLOCK
      ?auto_259411 - BLOCK
      ?auto_259412 - BLOCK
      ?auto_259413 - BLOCK
      ?auto_259414 - BLOCK
      ?auto_259415 - BLOCK
    )
    :vars
    (
      ?auto_259416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259415 ?auto_259416 ) ( ON-TABLE ?auto_259405 ) ( ON ?auto_259406 ?auto_259405 ) ( ON ?auto_259407 ?auto_259406 ) ( ON ?auto_259408 ?auto_259407 ) ( ON ?auto_259409 ?auto_259408 ) ( ON ?auto_259410 ?auto_259409 ) ( not ( = ?auto_259405 ?auto_259406 ) ) ( not ( = ?auto_259405 ?auto_259407 ) ) ( not ( = ?auto_259405 ?auto_259408 ) ) ( not ( = ?auto_259405 ?auto_259409 ) ) ( not ( = ?auto_259405 ?auto_259410 ) ) ( not ( = ?auto_259405 ?auto_259411 ) ) ( not ( = ?auto_259405 ?auto_259412 ) ) ( not ( = ?auto_259405 ?auto_259413 ) ) ( not ( = ?auto_259405 ?auto_259414 ) ) ( not ( = ?auto_259405 ?auto_259415 ) ) ( not ( = ?auto_259405 ?auto_259416 ) ) ( not ( = ?auto_259406 ?auto_259407 ) ) ( not ( = ?auto_259406 ?auto_259408 ) ) ( not ( = ?auto_259406 ?auto_259409 ) ) ( not ( = ?auto_259406 ?auto_259410 ) ) ( not ( = ?auto_259406 ?auto_259411 ) ) ( not ( = ?auto_259406 ?auto_259412 ) ) ( not ( = ?auto_259406 ?auto_259413 ) ) ( not ( = ?auto_259406 ?auto_259414 ) ) ( not ( = ?auto_259406 ?auto_259415 ) ) ( not ( = ?auto_259406 ?auto_259416 ) ) ( not ( = ?auto_259407 ?auto_259408 ) ) ( not ( = ?auto_259407 ?auto_259409 ) ) ( not ( = ?auto_259407 ?auto_259410 ) ) ( not ( = ?auto_259407 ?auto_259411 ) ) ( not ( = ?auto_259407 ?auto_259412 ) ) ( not ( = ?auto_259407 ?auto_259413 ) ) ( not ( = ?auto_259407 ?auto_259414 ) ) ( not ( = ?auto_259407 ?auto_259415 ) ) ( not ( = ?auto_259407 ?auto_259416 ) ) ( not ( = ?auto_259408 ?auto_259409 ) ) ( not ( = ?auto_259408 ?auto_259410 ) ) ( not ( = ?auto_259408 ?auto_259411 ) ) ( not ( = ?auto_259408 ?auto_259412 ) ) ( not ( = ?auto_259408 ?auto_259413 ) ) ( not ( = ?auto_259408 ?auto_259414 ) ) ( not ( = ?auto_259408 ?auto_259415 ) ) ( not ( = ?auto_259408 ?auto_259416 ) ) ( not ( = ?auto_259409 ?auto_259410 ) ) ( not ( = ?auto_259409 ?auto_259411 ) ) ( not ( = ?auto_259409 ?auto_259412 ) ) ( not ( = ?auto_259409 ?auto_259413 ) ) ( not ( = ?auto_259409 ?auto_259414 ) ) ( not ( = ?auto_259409 ?auto_259415 ) ) ( not ( = ?auto_259409 ?auto_259416 ) ) ( not ( = ?auto_259410 ?auto_259411 ) ) ( not ( = ?auto_259410 ?auto_259412 ) ) ( not ( = ?auto_259410 ?auto_259413 ) ) ( not ( = ?auto_259410 ?auto_259414 ) ) ( not ( = ?auto_259410 ?auto_259415 ) ) ( not ( = ?auto_259410 ?auto_259416 ) ) ( not ( = ?auto_259411 ?auto_259412 ) ) ( not ( = ?auto_259411 ?auto_259413 ) ) ( not ( = ?auto_259411 ?auto_259414 ) ) ( not ( = ?auto_259411 ?auto_259415 ) ) ( not ( = ?auto_259411 ?auto_259416 ) ) ( not ( = ?auto_259412 ?auto_259413 ) ) ( not ( = ?auto_259412 ?auto_259414 ) ) ( not ( = ?auto_259412 ?auto_259415 ) ) ( not ( = ?auto_259412 ?auto_259416 ) ) ( not ( = ?auto_259413 ?auto_259414 ) ) ( not ( = ?auto_259413 ?auto_259415 ) ) ( not ( = ?auto_259413 ?auto_259416 ) ) ( not ( = ?auto_259414 ?auto_259415 ) ) ( not ( = ?auto_259414 ?auto_259416 ) ) ( not ( = ?auto_259415 ?auto_259416 ) ) ( ON ?auto_259414 ?auto_259415 ) ( ON ?auto_259413 ?auto_259414 ) ( ON ?auto_259412 ?auto_259413 ) ( CLEAR ?auto_259410 ) ( ON ?auto_259411 ?auto_259412 ) ( CLEAR ?auto_259411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_259405 ?auto_259406 ?auto_259407 ?auto_259408 ?auto_259409 ?auto_259410 ?auto_259411 )
      ( MAKE-11PILE ?auto_259405 ?auto_259406 ?auto_259407 ?auto_259408 ?auto_259409 ?auto_259410 ?auto_259411 ?auto_259412 ?auto_259413 ?auto_259414 ?auto_259415 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259428 - BLOCK
      ?auto_259429 - BLOCK
      ?auto_259430 - BLOCK
      ?auto_259431 - BLOCK
      ?auto_259432 - BLOCK
      ?auto_259433 - BLOCK
      ?auto_259434 - BLOCK
      ?auto_259435 - BLOCK
      ?auto_259436 - BLOCK
      ?auto_259437 - BLOCK
      ?auto_259438 - BLOCK
    )
    :vars
    (
      ?auto_259439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259438 ?auto_259439 ) ( ON-TABLE ?auto_259428 ) ( ON ?auto_259429 ?auto_259428 ) ( ON ?auto_259430 ?auto_259429 ) ( ON ?auto_259431 ?auto_259430 ) ( ON ?auto_259432 ?auto_259431 ) ( ON ?auto_259433 ?auto_259432 ) ( not ( = ?auto_259428 ?auto_259429 ) ) ( not ( = ?auto_259428 ?auto_259430 ) ) ( not ( = ?auto_259428 ?auto_259431 ) ) ( not ( = ?auto_259428 ?auto_259432 ) ) ( not ( = ?auto_259428 ?auto_259433 ) ) ( not ( = ?auto_259428 ?auto_259434 ) ) ( not ( = ?auto_259428 ?auto_259435 ) ) ( not ( = ?auto_259428 ?auto_259436 ) ) ( not ( = ?auto_259428 ?auto_259437 ) ) ( not ( = ?auto_259428 ?auto_259438 ) ) ( not ( = ?auto_259428 ?auto_259439 ) ) ( not ( = ?auto_259429 ?auto_259430 ) ) ( not ( = ?auto_259429 ?auto_259431 ) ) ( not ( = ?auto_259429 ?auto_259432 ) ) ( not ( = ?auto_259429 ?auto_259433 ) ) ( not ( = ?auto_259429 ?auto_259434 ) ) ( not ( = ?auto_259429 ?auto_259435 ) ) ( not ( = ?auto_259429 ?auto_259436 ) ) ( not ( = ?auto_259429 ?auto_259437 ) ) ( not ( = ?auto_259429 ?auto_259438 ) ) ( not ( = ?auto_259429 ?auto_259439 ) ) ( not ( = ?auto_259430 ?auto_259431 ) ) ( not ( = ?auto_259430 ?auto_259432 ) ) ( not ( = ?auto_259430 ?auto_259433 ) ) ( not ( = ?auto_259430 ?auto_259434 ) ) ( not ( = ?auto_259430 ?auto_259435 ) ) ( not ( = ?auto_259430 ?auto_259436 ) ) ( not ( = ?auto_259430 ?auto_259437 ) ) ( not ( = ?auto_259430 ?auto_259438 ) ) ( not ( = ?auto_259430 ?auto_259439 ) ) ( not ( = ?auto_259431 ?auto_259432 ) ) ( not ( = ?auto_259431 ?auto_259433 ) ) ( not ( = ?auto_259431 ?auto_259434 ) ) ( not ( = ?auto_259431 ?auto_259435 ) ) ( not ( = ?auto_259431 ?auto_259436 ) ) ( not ( = ?auto_259431 ?auto_259437 ) ) ( not ( = ?auto_259431 ?auto_259438 ) ) ( not ( = ?auto_259431 ?auto_259439 ) ) ( not ( = ?auto_259432 ?auto_259433 ) ) ( not ( = ?auto_259432 ?auto_259434 ) ) ( not ( = ?auto_259432 ?auto_259435 ) ) ( not ( = ?auto_259432 ?auto_259436 ) ) ( not ( = ?auto_259432 ?auto_259437 ) ) ( not ( = ?auto_259432 ?auto_259438 ) ) ( not ( = ?auto_259432 ?auto_259439 ) ) ( not ( = ?auto_259433 ?auto_259434 ) ) ( not ( = ?auto_259433 ?auto_259435 ) ) ( not ( = ?auto_259433 ?auto_259436 ) ) ( not ( = ?auto_259433 ?auto_259437 ) ) ( not ( = ?auto_259433 ?auto_259438 ) ) ( not ( = ?auto_259433 ?auto_259439 ) ) ( not ( = ?auto_259434 ?auto_259435 ) ) ( not ( = ?auto_259434 ?auto_259436 ) ) ( not ( = ?auto_259434 ?auto_259437 ) ) ( not ( = ?auto_259434 ?auto_259438 ) ) ( not ( = ?auto_259434 ?auto_259439 ) ) ( not ( = ?auto_259435 ?auto_259436 ) ) ( not ( = ?auto_259435 ?auto_259437 ) ) ( not ( = ?auto_259435 ?auto_259438 ) ) ( not ( = ?auto_259435 ?auto_259439 ) ) ( not ( = ?auto_259436 ?auto_259437 ) ) ( not ( = ?auto_259436 ?auto_259438 ) ) ( not ( = ?auto_259436 ?auto_259439 ) ) ( not ( = ?auto_259437 ?auto_259438 ) ) ( not ( = ?auto_259437 ?auto_259439 ) ) ( not ( = ?auto_259438 ?auto_259439 ) ) ( ON ?auto_259437 ?auto_259438 ) ( ON ?auto_259436 ?auto_259437 ) ( ON ?auto_259435 ?auto_259436 ) ( CLEAR ?auto_259433 ) ( ON ?auto_259434 ?auto_259435 ) ( CLEAR ?auto_259434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_259428 ?auto_259429 ?auto_259430 ?auto_259431 ?auto_259432 ?auto_259433 ?auto_259434 )
      ( MAKE-11PILE ?auto_259428 ?auto_259429 ?auto_259430 ?auto_259431 ?auto_259432 ?auto_259433 ?auto_259434 ?auto_259435 ?auto_259436 ?auto_259437 ?auto_259438 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259451 - BLOCK
      ?auto_259452 - BLOCK
      ?auto_259453 - BLOCK
      ?auto_259454 - BLOCK
      ?auto_259455 - BLOCK
      ?auto_259456 - BLOCK
      ?auto_259457 - BLOCK
      ?auto_259458 - BLOCK
      ?auto_259459 - BLOCK
      ?auto_259460 - BLOCK
      ?auto_259461 - BLOCK
    )
    :vars
    (
      ?auto_259462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259461 ?auto_259462 ) ( ON-TABLE ?auto_259451 ) ( ON ?auto_259452 ?auto_259451 ) ( ON ?auto_259453 ?auto_259452 ) ( ON ?auto_259454 ?auto_259453 ) ( ON ?auto_259455 ?auto_259454 ) ( not ( = ?auto_259451 ?auto_259452 ) ) ( not ( = ?auto_259451 ?auto_259453 ) ) ( not ( = ?auto_259451 ?auto_259454 ) ) ( not ( = ?auto_259451 ?auto_259455 ) ) ( not ( = ?auto_259451 ?auto_259456 ) ) ( not ( = ?auto_259451 ?auto_259457 ) ) ( not ( = ?auto_259451 ?auto_259458 ) ) ( not ( = ?auto_259451 ?auto_259459 ) ) ( not ( = ?auto_259451 ?auto_259460 ) ) ( not ( = ?auto_259451 ?auto_259461 ) ) ( not ( = ?auto_259451 ?auto_259462 ) ) ( not ( = ?auto_259452 ?auto_259453 ) ) ( not ( = ?auto_259452 ?auto_259454 ) ) ( not ( = ?auto_259452 ?auto_259455 ) ) ( not ( = ?auto_259452 ?auto_259456 ) ) ( not ( = ?auto_259452 ?auto_259457 ) ) ( not ( = ?auto_259452 ?auto_259458 ) ) ( not ( = ?auto_259452 ?auto_259459 ) ) ( not ( = ?auto_259452 ?auto_259460 ) ) ( not ( = ?auto_259452 ?auto_259461 ) ) ( not ( = ?auto_259452 ?auto_259462 ) ) ( not ( = ?auto_259453 ?auto_259454 ) ) ( not ( = ?auto_259453 ?auto_259455 ) ) ( not ( = ?auto_259453 ?auto_259456 ) ) ( not ( = ?auto_259453 ?auto_259457 ) ) ( not ( = ?auto_259453 ?auto_259458 ) ) ( not ( = ?auto_259453 ?auto_259459 ) ) ( not ( = ?auto_259453 ?auto_259460 ) ) ( not ( = ?auto_259453 ?auto_259461 ) ) ( not ( = ?auto_259453 ?auto_259462 ) ) ( not ( = ?auto_259454 ?auto_259455 ) ) ( not ( = ?auto_259454 ?auto_259456 ) ) ( not ( = ?auto_259454 ?auto_259457 ) ) ( not ( = ?auto_259454 ?auto_259458 ) ) ( not ( = ?auto_259454 ?auto_259459 ) ) ( not ( = ?auto_259454 ?auto_259460 ) ) ( not ( = ?auto_259454 ?auto_259461 ) ) ( not ( = ?auto_259454 ?auto_259462 ) ) ( not ( = ?auto_259455 ?auto_259456 ) ) ( not ( = ?auto_259455 ?auto_259457 ) ) ( not ( = ?auto_259455 ?auto_259458 ) ) ( not ( = ?auto_259455 ?auto_259459 ) ) ( not ( = ?auto_259455 ?auto_259460 ) ) ( not ( = ?auto_259455 ?auto_259461 ) ) ( not ( = ?auto_259455 ?auto_259462 ) ) ( not ( = ?auto_259456 ?auto_259457 ) ) ( not ( = ?auto_259456 ?auto_259458 ) ) ( not ( = ?auto_259456 ?auto_259459 ) ) ( not ( = ?auto_259456 ?auto_259460 ) ) ( not ( = ?auto_259456 ?auto_259461 ) ) ( not ( = ?auto_259456 ?auto_259462 ) ) ( not ( = ?auto_259457 ?auto_259458 ) ) ( not ( = ?auto_259457 ?auto_259459 ) ) ( not ( = ?auto_259457 ?auto_259460 ) ) ( not ( = ?auto_259457 ?auto_259461 ) ) ( not ( = ?auto_259457 ?auto_259462 ) ) ( not ( = ?auto_259458 ?auto_259459 ) ) ( not ( = ?auto_259458 ?auto_259460 ) ) ( not ( = ?auto_259458 ?auto_259461 ) ) ( not ( = ?auto_259458 ?auto_259462 ) ) ( not ( = ?auto_259459 ?auto_259460 ) ) ( not ( = ?auto_259459 ?auto_259461 ) ) ( not ( = ?auto_259459 ?auto_259462 ) ) ( not ( = ?auto_259460 ?auto_259461 ) ) ( not ( = ?auto_259460 ?auto_259462 ) ) ( not ( = ?auto_259461 ?auto_259462 ) ) ( ON ?auto_259460 ?auto_259461 ) ( ON ?auto_259459 ?auto_259460 ) ( ON ?auto_259458 ?auto_259459 ) ( ON ?auto_259457 ?auto_259458 ) ( CLEAR ?auto_259455 ) ( ON ?auto_259456 ?auto_259457 ) ( CLEAR ?auto_259456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_259451 ?auto_259452 ?auto_259453 ?auto_259454 ?auto_259455 ?auto_259456 )
      ( MAKE-11PILE ?auto_259451 ?auto_259452 ?auto_259453 ?auto_259454 ?auto_259455 ?auto_259456 ?auto_259457 ?auto_259458 ?auto_259459 ?auto_259460 ?auto_259461 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259474 - BLOCK
      ?auto_259475 - BLOCK
      ?auto_259476 - BLOCK
      ?auto_259477 - BLOCK
      ?auto_259478 - BLOCK
      ?auto_259479 - BLOCK
      ?auto_259480 - BLOCK
      ?auto_259481 - BLOCK
      ?auto_259482 - BLOCK
      ?auto_259483 - BLOCK
      ?auto_259484 - BLOCK
    )
    :vars
    (
      ?auto_259485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259484 ?auto_259485 ) ( ON-TABLE ?auto_259474 ) ( ON ?auto_259475 ?auto_259474 ) ( ON ?auto_259476 ?auto_259475 ) ( ON ?auto_259477 ?auto_259476 ) ( ON ?auto_259478 ?auto_259477 ) ( not ( = ?auto_259474 ?auto_259475 ) ) ( not ( = ?auto_259474 ?auto_259476 ) ) ( not ( = ?auto_259474 ?auto_259477 ) ) ( not ( = ?auto_259474 ?auto_259478 ) ) ( not ( = ?auto_259474 ?auto_259479 ) ) ( not ( = ?auto_259474 ?auto_259480 ) ) ( not ( = ?auto_259474 ?auto_259481 ) ) ( not ( = ?auto_259474 ?auto_259482 ) ) ( not ( = ?auto_259474 ?auto_259483 ) ) ( not ( = ?auto_259474 ?auto_259484 ) ) ( not ( = ?auto_259474 ?auto_259485 ) ) ( not ( = ?auto_259475 ?auto_259476 ) ) ( not ( = ?auto_259475 ?auto_259477 ) ) ( not ( = ?auto_259475 ?auto_259478 ) ) ( not ( = ?auto_259475 ?auto_259479 ) ) ( not ( = ?auto_259475 ?auto_259480 ) ) ( not ( = ?auto_259475 ?auto_259481 ) ) ( not ( = ?auto_259475 ?auto_259482 ) ) ( not ( = ?auto_259475 ?auto_259483 ) ) ( not ( = ?auto_259475 ?auto_259484 ) ) ( not ( = ?auto_259475 ?auto_259485 ) ) ( not ( = ?auto_259476 ?auto_259477 ) ) ( not ( = ?auto_259476 ?auto_259478 ) ) ( not ( = ?auto_259476 ?auto_259479 ) ) ( not ( = ?auto_259476 ?auto_259480 ) ) ( not ( = ?auto_259476 ?auto_259481 ) ) ( not ( = ?auto_259476 ?auto_259482 ) ) ( not ( = ?auto_259476 ?auto_259483 ) ) ( not ( = ?auto_259476 ?auto_259484 ) ) ( not ( = ?auto_259476 ?auto_259485 ) ) ( not ( = ?auto_259477 ?auto_259478 ) ) ( not ( = ?auto_259477 ?auto_259479 ) ) ( not ( = ?auto_259477 ?auto_259480 ) ) ( not ( = ?auto_259477 ?auto_259481 ) ) ( not ( = ?auto_259477 ?auto_259482 ) ) ( not ( = ?auto_259477 ?auto_259483 ) ) ( not ( = ?auto_259477 ?auto_259484 ) ) ( not ( = ?auto_259477 ?auto_259485 ) ) ( not ( = ?auto_259478 ?auto_259479 ) ) ( not ( = ?auto_259478 ?auto_259480 ) ) ( not ( = ?auto_259478 ?auto_259481 ) ) ( not ( = ?auto_259478 ?auto_259482 ) ) ( not ( = ?auto_259478 ?auto_259483 ) ) ( not ( = ?auto_259478 ?auto_259484 ) ) ( not ( = ?auto_259478 ?auto_259485 ) ) ( not ( = ?auto_259479 ?auto_259480 ) ) ( not ( = ?auto_259479 ?auto_259481 ) ) ( not ( = ?auto_259479 ?auto_259482 ) ) ( not ( = ?auto_259479 ?auto_259483 ) ) ( not ( = ?auto_259479 ?auto_259484 ) ) ( not ( = ?auto_259479 ?auto_259485 ) ) ( not ( = ?auto_259480 ?auto_259481 ) ) ( not ( = ?auto_259480 ?auto_259482 ) ) ( not ( = ?auto_259480 ?auto_259483 ) ) ( not ( = ?auto_259480 ?auto_259484 ) ) ( not ( = ?auto_259480 ?auto_259485 ) ) ( not ( = ?auto_259481 ?auto_259482 ) ) ( not ( = ?auto_259481 ?auto_259483 ) ) ( not ( = ?auto_259481 ?auto_259484 ) ) ( not ( = ?auto_259481 ?auto_259485 ) ) ( not ( = ?auto_259482 ?auto_259483 ) ) ( not ( = ?auto_259482 ?auto_259484 ) ) ( not ( = ?auto_259482 ?auto_259485 ) ) ( not ( = ?auto_259483 ?auto_259484 ) ) ( not ( = ?auto_259483 ?auto_259485 ) ) ( not ( = ?auto_259484 ?auto_259485 ) ) ( ON ?auto_259483 ?auto_259484 ) ( ON ?auto_259482 ?auto_259483 ) ( ON ?auto_259481 ?auto_259482 ) ( ON ?auto_259480 ?auto_259481 ) ( CLEAR ?auto_259478 ) ( ON ?auto_259479 ?auto_259480 ) ( CLEAR ?auto_259479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_259474 ?auto_259475 ?auto_259476 ?auto_259477 ?auto_259478 ?auto_259479 )
      ( MAKE-11PILE ?auto_259474 ?auto_259475 ?auto_259476 ?auto_259477 ?auto_259478 ?auto_259479 ?auto_259480 ?auto_259481 ?auto_259482 ?auto_259483 ?auto_259484 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259497 - BLOCK
      ?auto_259498 - BLOCK
      ?auto_259499 - BLOCK
      ?auto_259500 - BLOCK
      ?auto_259501 - BLOCK
      ?auto_259502 - BLOCK
      ?auto_259503 - BLOCK
      ?auto_259504 - BLOCK
      ?auto_259505 - BLOCK
      ?auto_259506 - BLOCK
      ?auto_259507 - BLOCK
    )
    :vars
    (
      ?auto_259508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259507 ?auto_259508 ) ( ON-TABLE ?auto_259497 ) ( ON ?auto_259498 ?auto_259497 ) ( ON ?auto_259499 ?auto_259498 ) ( ON ?auto_259500 ?auto_259499 ) ( not ( = ?auto_259497 ?auto_259498 ) ) ( not ( = ?auto_259497 ?auto_259499 ) ) ( not ( = ?auto_259497 ?auto_259500 ) ) ( not ( = ?auto_259497 ?auto_259501 ) ) ( not ( = ?auto_259497 ?auto_259502 ) ) ( not ( = ?auto_259497 ?auto_259503 ) ) ( not ( = ?auto_259497 ?auto_259504 ) ) ( not ( = ?auto_259497 ?auto_259505 ) ) ( not ( = ?auto_259497 ?auto_259506 ) ) ( not ( = ?auto_259497 ?auto_259507 ) ) ( not ( = ?auto_259497 ?auto_259508 ) ) ( not ( = ?auto_259498 ?auto_259499 ) ) ( not ( = ?auto_259498 ?auto_259500 ) ) ( not ( = ?auto_259498 ?auto_259501 ) ) ( not ( = ?auto_259498 ?auto_259502 ) ) ( not ( = ?auto_259498 ?auto_259503 ) ) ( not ( = ?auto_259498 ?auto_259504 ) ) ( not ( = ?auto_259498 ?auto_259505 ) ) ( not ( = ?auto_259498 ?auto_259506 ) ) ( not ( = ?auto_259498 ?auto_259507 ) ) ( not ( = ?auto_259498 ?auto_259508 ) ) ( not ( = ?auto_259499 ?auto_259500 ) ) ( not ( = ?auto_259499 ?auto_259501 ) ) ( not ( = ?auto_259499 ?auto_259502 ) ) ( not ( = ?auto_259499 ?auto_259503 ) ) ( not ( = ?auto_259499 ?auto_259504 ) ) ( not ( = ?auto_259499 ?auto_259505 ) ) ( not ( = ?auto_259499 ?auto_259506 ) ) ( not ( = ?auto_259499 ?auto_259507 ) ) ( not ( = ?auto_259499 ?auto_259508 ) ) ( not ( = ?auto_259500 ?auto_259501 ) ) ( not ( = ?auto_259500 ?auto_259502 ) ) ( not ( = ?auto_259500 ?auto_259503 ) ) ( not ( = ?auto_259500 ?auto_259504 ) ) ( not ( = ?auto_259500 ?auto_259505 ) ) ( not ( = ?auto_259500 ?auto_259506 ) ) ( not ( = ?auto_259500 ?auto_259507 ) ) ( not ( = ?auto_259500 ?auto_259508 ) ) ( not ( = ?auto_259501 ?auto_259502 ) ) ( not ( = ?auto_259501 ?auto_259503 ) ) ( not ( = ?auto_259501 ?auto_259504 ) ) ( not ( = ?auto_259501 ?auto_259505 ) ) ( not ( = ?auto_259501 ?auto_259506 ) ) ( not ( = ?auto_259501 ?auto_259507 ) ) ( not ( = ?auto_259501 ?auto_259508 ) ) ( not ( = ?auto_259502 ?auto_259503 ) ) ( not ( = ?auto_259502 ?auto_259504 ) ) ( not ( = ?auto_259502 ?auto_259505 ) ) ( not ( = ?auto_259502 ?auto_259506 ) ) ( not ( = ?auto_259502 ?auto_259507 ) ) ( not ( = ?auto_259502 ?auto_259508 ) ) ( not ( = ?auto_259503 ?auto_259504 ) ) ( not ( = ?auto_259503 ?auto_259505 ) ) ( not ( = ?auto_259503 ?auto_259506 ) ) ( not ( = ?auto_259503 ?auto_259507 ) ) ( not ( = ?auto_259503 ?auto_259508 ) ) ( not ( = ?auto_259504 ?auto_259505 ) ) ( not ( = ?auto_259504 ?auto_259506 ) ) ( not ( = ?auto_259504 ?auto_259507 ) ) ( not ( = ?auto_259504 ?auto_259508 ) ) ( not ( = ?auto_259505 ?auto_259506 ) ) ( not ( = ?auto_259505 ?auto_259507 ) ) ( not ( = ?auto_259505 ?auto_259508 ) ) ( not ( = ?auto_259506 ?auto_259507 ) ) ( not ( = ?auto_259506 ?auto_259508 ) ) ( not ( = ?auto_259507 ?auto_259508 ) ) ( ON ?auto_259506 ?auto_259507 ) ( ON ?auto_259505 ?auto_259506 ) ( ON ?auto_259504 ?auto_259505 ) ( ON ?auto_259503 ?auto_259504 ) ( ON ?auto_259502 ?auto_259503 ) ( CLEAR ?auto_259500 ) ( ON ?auto_259501 ?auto_259502 ) ( CLEAR ?auto_259501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_259497 ?auto_259498 ?auto_259499 ?auto_259500 ?auto_259501 )
      ( MAKE-11PILE ?auto_259497 ?auto_259498 ?auto_259499 ?auto_259500 ?auto_259501 ?auto_259502 ?auto_259503 ?auto_259504 ?auto_259505 ?auto_259506 ?auto_259507 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259520 - BLOCK
      ?auto_259521 - BLOCK
      ?auto_259522 - BLOCK
      ?auto_259523 - BLOCK
      ?auto_259524 - BLOCK
      ?auto_259525 - BLOCK
      ?auto_259526 - BLOCK
      ?auto_259527 - BLOCK
      ?auto_259528 - BLOCK
      ?auto_259529 - BLOCK
      ?auto_259530 - BLOCK
    )
    :vars
    (
      ?auto_259531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259530 ?auto_259531 ) ( ON-TABLE ?auto_259520 ) ( ON ?auto_259521 ?auto_259520 ) ( ON ?auto_259522 ?auto_259521 ) ( ON ?auto_259523 ?auto_259522 ) ( not ( = ?auto_259520 ?auto_259521 ) ) ( not ( = ?auto_259520 ?auto_259522 ) ) ( not ( = ?auto_259520 ?auto_259523 ) ) ( not ( = ?auto_259520 ?auto_259524 ) ) ( not ( = ?auto_259520 ?auto_259525 ) ) ( not ( = ?auto_259520 ?auto_259526 ) ) ( not ( = ?auto_259520 ?auto_259527 ) ) ( not ( = ?auto_259520 ?auto_259528 ) ) ( not ( = ?auto_259520 ?auto_259529 ) ) ( not ( = ?auto_259520 ?auto_259530 ) ) ( not ( = ?auto_259520 ?auto_259531 ) ) ( not ( = ?auto_259521 ?auto_259522 ) ) ( not ( = ?auto_259521 ?auto_259523 ) ) ( not ( = ?auto_259521 ?auto_259524 ) ) ( not ( = ?auto_259521 ?auto_259525 ) ) ( not ( = ?auto_259521 ?auto_259526 ) ) ( not ( = ?auto_259521 ?auto_259527 ) ) ( not ( = ?auto_259521 ?auto_259528 ) ) ( not ( = ?auto_259521 ?auto_259529 ) ) ( not ( = ?auto_259521 ?auto_259530 ) ) ( not ( = ?auto_259521 ?auto_259531 ) ) ( not ( = ?auto_259522 ?auto_259523 ) ) ( not ( = ?auto_259522 ?auto_259524 ) ) ( not ( = ?auto_259522 ?auto_259525 ) ) ( not ( = ?auto_259522 ?auto_259526 ) ) ( not ( = ?auto_259522 ?auto_259527 ) ) ( not ( = ?auto_259522 ?auto_259528 ) ) ( not ( = ?auto_259522 ?auto_259529 ) ) ( not ( = ?auto_259522 ?auto_259530 ) ) ( not ( = ?auto_259522 ?auto_259531 ) ) ( not ( = ?auto_259523 ?auto_259524 ) ) ( not ( = ?auto_259523 ?auto_259525 ) ) ( not ( = ?auto_259523 ?auto_259526 ) ) ( not ( = ?auto_259523 ?auto_259527 ) ) ( not ( = ?auto_259523 ?auto_259528 ) ) ( not ( = ?auto_259523 ?auto_259529 ) ) ( not ( = ?auto_259523 ?auto_259530 ) ) ( not ( = ?auto_259523 ?auto_259531 ) ) ( not ( = ?auto_259524 ?auto_259525 ) ) ( not ( = ?auto_259524 ?auto_259526 ) ) ( not ( = ?auto_259524 ?auto_259527 ) ) ( not ( = ?auto_259524 ?auto_259528 ) ) ( not ( = ?auto_259524 ?auto_259529 ) ) ( not ( = ?auto_259524 ?auto_259530 ) ) ( not ( = ?auto_259524 ?auto_259531 ) ) ( not ( = ?auto_259525 ?auto_259526 ) ) ( not ( = ?auto_259525 ?auto_259527 ) ) ( not ( = ?auto_259525 ?auto_259528 ) ) ( not ( = ?auto_259525 ?auto_259529 ) ) ( not ( = ?auto_259525 ?auto_259530 ) ) ( not ( = ?auto_259525 ?auto_259531 ) ) ( not ( = ?auto_259526 ?auto_259527 ) ) ( not ( = ?auto_259526 ?auto_259528 ) ) ( not ( = ?auto_259526 ?auto_259529 ) ) ( not ( = ?auto_259526 ?auto_259530 ) ) ( not ( = ?auto_259526 ?auto_259531 ) ) ( not ( = ?auto_259527 ?auto_259528 ) ) ( not ( = ?auto_259527 ?auto_259529 ) ) ( not ( = ?auto_259527 ?auto_259530 ) ) ( not ( = ?auto_259527 ?auto_259531 ) ) ( not ( = ?auto_259528 ?auto_259529 ) ) ( not ( = ?auto_259528 ?auto_259530 ) ) ( not ( = ?auto_259528 ?auto_259531 ) ) ( not ( = ?auto_259529 ?auto_259530 ) ) ( not ( = ?auto_259529 ?auto_259531 ) ) ( not ( = ?auto_259530 ?auto_259531 ) ) ( ON ?auto_259529 ?auto_259530 ) ( ON ?auto_259528 ?auto_259529 ) ( ON ?auto_259527 ?auto_259528 ) ( ON ?auto_259526 ?auto_259527 ) ( ON ?auto_259525 ?auto_259526 ) ( CLEAR ?auto_259523 ) ( ON ?auto_259524 ?auto_259525 ) ( CLEAR ?auto_259524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_259520 ?auto_259521 ?auto_259522 ?auto_259523 ?auto_259524 )
      ( MAKE-11PILE ?auto_259520 ?auto_259521 ?auto_259522 ?auto_259523 ?auto_259524 ?auto_259525 ?auto_259526 ?auto_259527 ?auto_259528 ?auto_259529 ?auto_259530 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259543 - BLOCK
      ?auto_259544 - BLOCK
      ?auto_259545 - BLOCK
      ?auto_259546 - BLOCK
      ?auto_259547 - BLOCK
      ?auto_259548 - BLOCK
      ?auto_259549 - BLOCK
      ?auto_259550 - BLOCK
      ?auto_259551 - BLOCK
      ?auto_259552 - BLOCK
      ?auto_259553 - BLOCK
    )
    :vars
    (
      ?auto_259554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259553 ?auto_259554 ) ( ON-TABLE ?auto_259543 ) ( ON ?auto_259544 ?auto_259543 ) ( ON ?auto_259545 ?auto_259544 ) ( not ( = ?auto_259543 ?auto_259544 ) ) ( not ( = ?auto_259543 ?auto_259545 ) ) ( not ( = ?auto_259543 ?auto_259546 ) ) ( not ( = ?auto_259543 ?auto_259547 ) ) ( not ( = ?auto_259543 ?auto_259548 ) ) ( not ( = ?auto_259543 ?auto_259549 ) ) ( not ( = ?auto_259543 ?auto_259550 ) ) ( not ( = ?auto_259543 ?auto_259551 ) ) ( not ( = ?auto_259543 ?auto_259552 ) ) ( not ( = ?auto_259543 ?auto_259553 ) ) ( not ( = ?auto_259543 ?auto_259554 ) ) ( not ( = ?auto_259544 ?auto_259545 ) ) ( not ( = ?auto_259544 ?auto_259546 ) ) ( not ( = ?auto_259544 ?auto_259547 ) ) ( not ( = ?auto_259544 ?auto_259548 ) ) ( not ( = ?auto_259544 ?auto_259549 ) ) ( not ( = ?auto_259544 ?auto_259550 ) ) ( not ( = ?auto_259544 ?auto_259551 ) ) ( not ( = ?auto_259544 ?auto_259552 ) ) ( not ( = ?auto_259544 ?auto_259553 ) ) ( not ( = ?auto_259544 ?auto_259554 ) ) ( not ( = ?auto_259545 ?auto_259546 ) ) ( not ( = ?auto_259545 ?auto_259547 ) ) ( not ( = ?auto_259545 ?auto_259548 ) ) ( not ( = ?auto_259545 ?auto_259549 ) ) ( not ( = ?auto_259545 ?auto_259550 ) ) ( not ( = ?auto_259545 ?auto_259551 ) ) ( not ( = ?auto_259545 ?auto_259552 ) ) ( not ( = ?auto_259545 ?auto_259553 ) ) ( not ( = ?auto_259545 ?auto_259554 ) ) ( not ( = ?auto_259546 ?auto_259547 ) ) ( not ( = ?auto_259546 ?auto_259548 ) ) ( not ( = ?auto_259546 ?auto_259549 ) ) ( not ( = ?auto_259546 ?auto_259550 ) ) ( not ( = ?auto_259546 ?auto_259551 ) ) ( not ( = ?auto_259546 ?auto_259552 ) ) ( not ( = ?auto_259546 ?auto_259553 ) ) ( not ( = ?auto_259546 ?auto_259554 ) ) ( not ( = ?auto_259547 ?auto_259548 ) ) ( not ( = ?auto_259547 ?auto_259549 ) ) ( not ( = ?auto_259547 ?auto_259550 ) ) ( not ( = ?auto_259547 ?auto_259551 ) ) ( not ( = ?auto_259547 ?auto_259552 ) ) ( not ( = ?auto_259547 ?auto_259553 ) ) ( not ( = ?auto_259547 ?auto_259554 ) ) ( not ( = ?auto_259548 ?auto_259549 ) ) ( not ( = ?auto_259548 ?auto_259550 ) ) ( not ( = ?auto_259548 ?auto_259551 ) ) ( not ( = ?auto_259548 ?auto_259552 ) ) ( not ( = ?auto_259548 ?auto_259553 ) ) ( not ( = ?auto_259548 ?auto_259554 ) ) ( not ( = ?auto_259549 ?auto_259550 ) ) ( not ( = ?auto_259549 ?auto_259551 ) ) ( not ( = ?auto_259549 ?auto_259552 ) ) ( not ( = ?auto_259549 ?auto_259553 ) ) ( not ( = ?auto_259549 ?auto_259554 ) ) ( not ( = ?auto_259550 ?auto_259551 ) ) ( not ( = ?auto_259550 ?auto_259552 ) ) ( not ( = ?auto_259550 ?auto_259553 ) ) ( not ( = ?auto_259550 ?auto_259554 ) ) ( not ( = ?auto_259551 ?auto_259552 ) ) ( not ( = ?auto_259551 ?auto_259553 ) ) ( not ( = ?auto_259551 ?auto_259554 ) ) ( not ( = ?auto_259552 ?auto_259553 ) ) ( not ( = ?auto_259552 ?auto_259554 ) ) ( not ( = ?auto_259553 ?auto_259554 ) ) ( ON ?auto_259552 ?auto_259553 ) ( ON ?auto_259551 ?auto_259552 ) ( ON ?auto_259550 ?auto_259551 ) ( ON ?auto_259549 ?auto_259550 ) ( ON ?auto_259548 ?auto_259549 ) ( ON ?auto_259547 ?auto_259548 ) ( CLEAR ?auto_259545 ) ( ON ?auto_259546 ?auto_259547 ) ( CLEAR ?auto_259546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_259543 ?auto_259544 ?auto_259545 ?auto_259546 )
      ( MAKE-11PILE ?auto_259543 ?auto_259544 ?auto_259545 ?auto_259546 ?auto_259547 ?auto_259548 ?auto_259549 ?auto_259550 ?auto_259551 ?auto_259552 ?auto_259553 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259566 - BLOCK
      ?auto_259567 - BLOCK
      ?auto_259568 - BLOCK
      ?auto_259569 - BLOCK
      ?auto_259570 - BLOCK
      ?auto_259571 - BLOCK
      ?auto_259572 - BLOCK
      ?auto_259573 - BLOCK
      ?auto_259574 - BLOCK
      ?auto_259575 - BLOCK
      ?auto_259576 - BLOCK
    )
    :vars
    (
      ?auto_259577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259576 ?auto_259577 ) ( ON-TABLE ?auto_259566 ) ( ON ?auto_259567 ?auto_259566 ) ( ON ?auto_259568 ?auto_259567 ) ( not ( = ?auto_259566 ?auto_259567 ) ) ( not ( = ?auto_259566 ?auto_259568 ) ) ( not ( = ?auto_259566 ?auto_259569 ) ) ( not ( = ?auto_259566 ?auto_259570 ) ) ( not ( = ?auto_259566 ?auto_259571 ) ) ( not ( = ?auto_259566 ?auto_259572 ) ) ( not ( = ?auto_259566 ?auto_259573 ) ) ( not ( = ?auto_259566 ?auto_259574 ) ) ( not ( = ?auto_259566 ?auto_259575 ) ) ( not ( = ?auto_259566 ?auto_259576 ) ) ( not ( = ?auto_259566 ?auto_259577 ) ) ( not ( = ?auto_259567 ?auto_259568 ) ) ( not ( = ?auto_259567 ?auto_259569 ) ) ( not ( = ?auto_259567 ?auto_259570 ) ) ( not ( = ?auto_259567 ?auto_259571 ) ) ( not ( = ?auto_259567 ?auto_259572 ) ) ( not ( = ?auto_259567 ?auto_259573 ) ) ( not ( = ?auto_259567 ?auto_259574 ) ) ( not ( = ?auto_259567 ?auto_259575 ) ) ( not ( = ?auto_259567 ?auto_259576 ) ) ( not ( = ?auto_259567 ?auto_259577 ) ) ( not ( = ?auto_259568 ?auto_259569 ) ) ( not ( = ?auto_259568 ?auto_259570 ) ) ( not ( = ?auto_259568 ?auto_259571 ) ) ( not ( = ?auto_259568 ?auto_259572 ) ) ( not ( = ?auto_259568 ?auto_259573 ) ) ( not ( = ?auto_259568 ?auto_259574 ) ) ( not ( = ?auto_259568 ?auto_259575 ) ) ( not ( = ?auto_259568 ?auto_259576 ) ) ( not ( = ?auto_259568 ?auto_259577 ) ) ( not ( = ?auto_259569 ?auto_259570 ) ) ( not ( = ?auto_259569 ?auto_259571 ) ) ( not ( = ?auto_259569 ?auto_259572 ) ) ( not ( = ?auto_259569 ?auto_259573 ) ) ( not ( = ?auto_259569 ?auto_259574 ) ) ( not ( = ?auto_259569 ?auto_259575 ) ) ( not ( = ?auto_259569 ?auto_259576 ) ) ( not ( = ?auto_259569 ?auto_259577 ) ) ( not ( = ?auto_259570 ?auto_259571 ) ) ( not ( = ?auto_259570 ?auto_259572 ) ) ( not ( = ?auto_259570 ?auto_259573 ) ) ( not ( = ?auto_259570 ?auto_259574 ) ) ( not ( = ?auto_259570 ?auto_259575 ) ) ( not ( = ?auto_259570 ?auto_259576 ) ) ( not ( = ?auto_259570 ?auto_259577 ) ) ( not ( = ?auto_259571 ?auto_259572 ) ) ( not ( = ?auto_259571 ?auto_259573 ) ) ( not ( = ?auto_259571 ?auto_259574 ) ) ( not ( = ?auto_259571 ?auto_259575 ) ) ( not ( = ?auto_259571 ?auto_259576 ) ) ( not ( = ?auto_259571 ?auto_259577 ) ) ( not ( = ?auto_259572 ?auto_259573 ) ) ( not ( = ?auto_259572 ?auto_259574 ) ) ( not ( = ?auto_259572 ?auto_259575 ) ) ( not ( = ?auto_259572 ?auto_259576 ) ) ( not ( = ?auto_259572 ?auto_259577 ) ) ( not ( = ?auto_259573 ?auto_259574 ) ) ( not ( = ?auto_259573 ?auto_259575 ) ) ( not ( = ?auto_259573 ?auto_259576 ) ) ( not ( = ?auto_259573 ?auto_259577 ) ) ( not ( = ?auto_259574 ?auto_259575 ) ) ( not ( = ?auto_259574 ?auto_259576 ) ) ( not ( = ?auto_259574 ?auto_259577 ) ) ( not ( = ?auto_259575 ?auto_259576 ) ) ( not ( = ?auto_259575 ?auto_259577 ) ) ( not ( = ?auto_259576 ?auto_259577 ) ) ( ON ?auto_259575 ?auto_259576 ) ( ON ?auto_259574 ?auto_259575 ) ( ON ?auto_259573 ?auto_259574 ) ( ON ?auto_259572 ?auto_259573 ) ( ON ?auto_259571 ?auto_259572 ) ( ON ?auto_259570 ?auto_259571 ) ( CLEAR ?auto_259568 ) ( ON ?auto_259569 ?auto_259570 ) ( CLEAR ?auto_259569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_259566 ?auto_259567 ?auto_259568 ?auto_259569 )
      ( MAKE-11PILE ?auto_259566 ?auto_259567 ?auto_259568 ?auto_259569 ?auto_259570 ?auto_259571 ?auto_259572 ?auto_259573 ?auto_259574 ?auto_259575 ?auto_259576 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259589 - BLOCK
      ?auto_259590 - BLOCK
      ?auto_259591 - BLOCK
      ?auto_259592 - BLOCK
      ?auto_259593 - BLOCK
      ?auto_259594 - BLOCK
      ?auto_259595 - BLOCK
      ?auto_259596 - BLOCK
      ?auto_259597 - BLOCK
      ?auto_259598 - BLOCK
      ?auto_259599 - BLOCK
    )
    :vars
    (
      ?auto_259600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259599 ?auto_259600 ) ( ON-TABLE ?auto_259589 ) ( ON ?auto_259590 ?auto_259589 ) ( not ( = ?auto_259589 ?auto_259590 ) ) ( not ( = ?auto_259589 ?auto_259591 ) ) ( not ( = ?auto_259589 ?auto_259592 ) ) ( not ( = ?auto_259589 ?auto_259593 ) ) ( not ( = ?auto_259589 ?auto_259594 ) ) ( not ( = ?auto_259589 ?auto_259595 ) ) ( not ( = ?auto_259589 ?auto_259596 ) ) ( not ( = ?auto_259589 ?auto_259597 ) ) ( not ( = ?auto_259589 ?auto_259598 ) ) ( not ( = ?auto_259589 ?auto_259599 ) ) ( not ( = ?auto_259589 ?auto_259600 ) ) ( not ( = ?auto_259590 ?auto_259591 ) ) ( not ( = ?auto_259590 ?auto_259592 ) ) ( not ( = ?auto_259590 ?auto_259593 ) ) ( not ( = ?auto_259590 ?auto_259594 ) ) ( not ( = ?auto_259590 ?auto_259595 ) ) ( not ( = ?auto_259590 ?auto_259596 ) ) ( not ( = ?auto_259590 ?auto_259597 ) ) ( not ( = ?auto_259590 ?auto_259598 ) ) ( not ( = ?auto_259590 ?auto_259599 ) ) ( not ( = ?auto_259590 ?auto_259600 ) ) ( not ( = ?auto_259591 ?auto_259592 ) ) ( not ( = ?auto_259591 ?auto_259593 ) ) ( not ( = ?auto_259591 ?auto_259594 ) ) ( not ( = ?auto_259591 ?auto_259595 ) ) ( not ( = ?auto_259591 ?auto_259596 ) ) ( not ( = ?auto_259591 ?auto_259597 ) ) ( not ( = ?auto_259591 ?auto_259598 ) ) ( not ( = ?auto_259591 ?auto_259599 ) ) ( not ( = ?auto_259591 ?auto_259600 ) ) ( not ( = ?auto_259592 ?auto_259593 ) ) ( not ( = ?auto_259592 ?auto_259594 ) ) ( not ( = ?auto_259592 ?auto_259595 ) ) ( not ( = ?auto_259592 ?auto_259596 ) ) ( not ( = ?auto_259592 ?auto_259597 ) ) ( not ( = ?auto_259592 ?auto_259598 ) ) ( not ( = ?auto_259592 ?auto_259599 ) ) ( not ( = ?auto_259592 ?auto_259600 ) ) ( not ( = ?auto_259593 ?auto_259594 ) ) ( not ( = ?auto_259593 ?auto_259595 ) ) ( not ( = ?auto_259593 ?auto_259596 ) ) ( not ( = ?auto_259593 ?auto_259597 ) ) ( not ( = ?auto_259593 ?auto_259598 ) ) ( not ( = ?auto_259593 ?auto_259599 ) ) ( not ( = ?auto_259593 ?auto_259600 ) ) ( not ( = ?auto_259594 ?auto_259595 ) ) ( not ( = ?auto_259594 ?auto_259596 ) ) ( not ( = ?auto_259594 ?auto_259597 ) ) ( not ( = ?auto_259594 ?auto_259598 ) ) ( not ( = ?auto_259594 ?auto_259599 ) ) ( not ( = ?auto_259594 ?auto_259600 ) ) ( not ( = ?auto_259595 ?auto_259596 ) ) ( not ( = ?auto_259595 ?auto_259597 ) ) ( not ( = ?auto_259595 ?auto_259598 ) ) ( not ( = ?auto_259595 ?auto_259599 ) ) ( not ( = ?auto_259595 ?auto_259600 ) ) ( not ( = ?auto_259596 ?auto_259597 ) ) ( not ( = ?auto_259596 ?auto_259598 ) ) ( not ( = ?auto_259596 ?auto_259599 ) ) ( not ( = ?auto_259596 ?auto_259600 ) ) ( not ( = ?auto_259597 ?auto_259598 ) ) ( not ( = ?auto_259597 ?auto_259599 ) ) ( not ( = ?auto_259597 ?auto_259600 ) ) ( not ( = ?auto_259598 ?auto_259599 ) ) ( not ( = ?auto_259598 ?auto_259600 ) ) ( not ( = ?auto_259599 ?auto_259600 ) ) ( ON ?auto_259598 ?auto_259599 ) ( ON ?auto_259597 ?auto_259598 ) ( ON ?auto_259596 ?auto_259597 ) ( ON ?auto_259595 ?auto_259596 ) ( ON ?auto_259594 ?auto_259595 ) ( ON ?auto_259593 ?auto_259594 ) ( ON ?auto_259592 ?auto_259593 ) ( CLEAR ?auto_259590 ) ( ON ?auto_259591 ?auto_259592 ) ( CLEAR ?auto_259591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_259589 ?auto_259590 ?auto_259591 )
      ( MAKE-11PILE ?auto_259589 ?auto_259590 ?auto_259591 ?auto_259592 ?auto_259593 ?auto_259594 ?auto_259595 ?auto_259596 ?auto_259597 ?auto_259598 ?auto_259599 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259612 - BLOCK
      ?auto_259613 - BLOCK
      ?auto_259614 - BLOCK
      ?auto_259615 - BLOCK
      ?auto_259616 - BLOCK
      ?auto_259617 - BLOCK
      ?auto_259618 - BLOCK
      ?auto_259619 - BLOCK
      ?auto_259620 - BLOCK
      ?auto_259621 - BLOCK
      ?auto_259622 - BLOCK
    )
    :vars
    (
      ?auto_259623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259622 ?auto_259623 ) ( ON-TABLE ?auto_259612 ) ( ON ?auto_259613 ?auto_259612 ) ( not ( = ?auto_259612 ?auto_259613 ) ) ( not ( = ?auto_259612 ?auto_259614 ) ) ( not ( = ?auto_259612 ?auto_259615 ) ) ( not ( = ?auto_259612 ?auto_259616 ) ) ( not ( = ?auto_259612 ?auto_259617 ) ) ( not ( = ?auto_259612 ?auto_259618 ) ) ( not ( = ?auto_259612 ?auto_259619 ) ) ( not ( = ?auto_259612 ?auto_259620 ) ) ( not ( = ?auto_259612 ?auto_259621 ) ) ( not ( = ?auto_259612 ?auto_259622 ) ) ( not ( = ?auto_259612 ?auto_259623 ) ) ( not ( = ?auto_259613 ?auto_259614 ) ) ( not ( = ?auto_259613 ?auto_259615 ) ) ( not ( = ?auto_259613 ?auto_259616 ) ) ( not ( = ?auto_259613 ?auto_259617 ) ) ( not ( = ?auto_259613 ?auto_259618 ) ) ( not ( = ?auto_259613 ?auto_259619 ) ) ( not ( = ?auto_259613 ?auto_259620 ) ) ( not ( = ?auto_259613 ?auto_259621 ) ) ( not ( = ?auto_259613 ?auto_259622 ) ) ( not ( = ?auto_259613 ?auto_259623 ) ) ( not ( = ?auto_259614 ?auto_259615 ) ) ( not ( = ?auto_259614 ?auto_259616 ) ) ( not ( = ?auto_259614 ?auto_259617 ) ) ( not ( = ?auto_259614 ?auto_259618 ) ) ( not ( = ?auto_259614 ?auto_259619 ) ) ( not ( = ?auto_259614 ?auto_259620 ) ) ( not ( = ?auto_259614 ?auto_259621 ) ) ( not ( = ?auto_259614 ?auto_259622 ) ) ( not ( = ?auto_259614 ?auto_259623 ) ) ( not ( = ?auto_259615 ?auto_259616 ) ) ( not ( = ?auto_259615 ?auto_259617 ) ) ( not ( = ?auto_259615 ?auto_259618 ) ) ( not ( = ?auto_259615 ?auto_259619 ) ) ( not ( = ?auto_259615 ?auto_259620 ) ) ( not ( = ?auto_259615 ?auto_259621 ) ) ( not ( = ?auto_259615 ?auto_259622 ) ) ( not ( = ?auto_259615 ?auto_259623 ) ) ( not ( = ?auto_259616 ?auto_259617 ) ) ( not ( = ?auto_259616 ?auto_259618 ) ) ( not ( = ?auto_259616 ?auto_259619 ) ) ( not ( = ?auto_259616 ?auto_259620 ) ) ( not ( = ?auto_259616 ?auto_259621 ) ) ( not ( = ?auto_259616 ?auto_259622 ) ) ( not ( = ?auto_259616 ?auto_259623 ) ) ( not ( = ?auto_259617 ?auto_259618 ) ) ( not ( = ?auto_259617 ?auto_259619 ) ) ( not ( = ?auto_259617 ?auto_259620 ) ) ( not ( = ?auto_259617 ?auto_259621 ) ) ( not ( = ?auto_259617 ?auto_259622 ) ) ( not ( = ?auto_259617 ?auto_259623 ) ) ( not ( = ?auto_259618 ?auto_259619 ) ) ( not ( = ?auto_259618 ?auto_259620 ) ) ( not ( = ?auto_259618 ?auto_259621 ) ) ( not ( = ?auto_259618 ?auto_259622 ) ) ( not ( = ?auto_259618 ?auto_259623 ) ) ( not ( = ?auto_259619 ?auto_259620 ) ) ( not ( = ?auto_259619 ?auto_259621 ) ) ( not ( = ?auto_259619 ?auto_259622 ) ) ( not ( = ?auto_259619 ?auto_259623 ) ) ( not ( = ?auto_259620 ?auto_259621 ) ) ( not ( = ?auto_259620 ?auto_259622 ) ) ( not ( = ?auto_259620 ?auto_259623 ) ) ( not ( = ?auto_259621 ?auto_259622 ) ) ( not ( = ?auto_259621 ?auto_259623 ) ) ( not ( = ?auto_259622 ?auto_259623 ) ) ( ON ?auto_259621 ?auto_259622 ) ( ON ?auto_259620 ?auto_259621 ) ( ON ?auto_259619 ?auto_259620 ) ( ON ?auto_259618 ?auto_259619 ) ( ON ?auto_259617 ?auto_259618 ) ( ON ?auto_259616 ?auto_259617 ) ( ON ?auto_259615 ?auto_259616 ) ( CLEAR ?auto_259613 ) ( ON ?auto_259614 ?auto_259615 ) ( CLEAR ?auto_259614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_259612 ?auto_259613 ?auto_259614 )
      ( MAKE-11PILE ?auto_259612 ?auto_259613 ?auto_259614 ?auto_259615 ?auto_259616 ?auto_259617 ?auto_259618 ?auto_259619 ?auto_259620 ?auto_259621 ?auto_259622 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259635 - BLOCK
      ?auto_259636 - BLOCK
      ?auto_259637 - BLOCK
      ?auto_259638 - BLOCK
      ?auto_259639 - BLOCK
      ?auto_259640 - BLOCK
      ?auto_259641 - BLOCK
      ?auto_259642 - BLOCK
      ?auto_259643 - BLOCK
      ?auto_259644 - BLOCK
      ?auto_259645 - BLOCK
    )
    :vars
    (
      ?auto_259646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259645 ?auto_259646 ) ( ON-TABLE ?auto_259635 ) ( not ( = ?auto_259635 ?auto_259636 ) ) ( not ( = ?auto_259635 ?auto_259637 ) ) ( not ( = ?auto_259635 ?auto_259638 ) ) ( not ( = ?auto_259635 ?auto_259639 ) ) ( not ( = ?auto_259635 ?auto_259640 ) ) ( not ( = ?auto_259635 ?auto_259641 ) ) ( not ( = ?auto_259635 ?auto_259642 ) ) ( not ( = ?auto_259635 ?auto_259643 ) ) ( not ( = ?auto_259635 ?auto_259644 ) ) ( not ( = ?auto_259635 ?auto_259645 ) ) ( not ( = ?auto_259635 ?auto_259646 ) ) ( not ( = ?auto_259636 ?auto_259637 ) ) ( not ( = ?auto_259636 ?auto_259638 ) ) ( not ( = ?auto_259636 ?auto_259639 ) ) ( not ( = ?auto_259636 ?auto_259640 ) ) ( not ( = ?auto_259636 ?auto_259641 ) ) ( not ( = ?auto_259636 ?auto_259642 ) ) ( not ( = ?auto_259636 ?auto_259643 ) ) ( not ( = ?auto_259636 ?auto_259644 ) ) ( not ( = ?auto_259636 ?auto_259645 ) ) ( not ( = ?auto_259636 ?auto_259646 ) ) ( not ( = ?auto_259637 ?auto_259638 ) ) ( not ( = ?auto_259637 ?auto_259639 ) ) ( not ( = ?auto_259637 ?auto_259640 ) ) ( not ( = ?auto_259637 ?auto_259641 ) ) ( not ( = ?auto_259637 ?auto_259642 ) ) ( not ( = ?auto_259637 ?auto_259643 ) ) ( not ( = ?auto_259637 ?auto_259644 ) ) ( not ( = ?auto_259637 ?auto_259645 ) ) ( not ( = ?auto_259637 ?auto_259646 ) ) ( not ( = ?auto_259638 ?auto_259639 ) ) ( not ( = ?auto_259638 ?auto_259640 ) ) ( not ( = ?auto_259638 ?auto_259641 ) ) ( not ( = ?auto_259638 ?auto_259642 ) ) ( not ( = ?auto_259638 ?auto_259643 ) ) ( not ( = ?auto_259638 ?auto_259644 ) ) ( not ( = ?auto_259638 ?auto_259645 ) ) ( not ( = ?auto_259638 ?auto_259646 ) ) ( not ( = ?auto_259639 ?auto_259640 ) ) ( not ( = ?auto_259639 ?auto_259641 ) ) ( not ( = ?auto_259639 ?auto_259642 ) ) ( not ( = ?auto_259639 ?auto_259643 ) ) ( not ( = ?auto_259639 ?auto_259644 ) ) ( not ( = ?auto_259639 ?auto_259645 ) ) ( not ( = ?auto_259639 ?auto_259646 ) ) ( not ( = ?auto_259640 ?auto_259641 ) ) ( not ( = ?auto_259640 ?auto_259642 ) ) ( not ( = ?auto_259640 ?auto_259643 ) ) ( not ( = ?auto_259640 ?auto_259644 ) ) ( not ( = ?auto_259640 ?auto_259645 ) ) ( not ( = ?auto_259640 ?auto_259646 ) ) ( not ( = ?auto_259641 ?auto_259642 ) ) ( not ( = ?auto_259641 ?auto_259643 ) ) ( not ( = ?auto_259641 ?auto_259644 ) ) ( not ( = ?auto_259641 ?auto_259645 ) ) ( not ( = ?auto_259641 ?auto_259646 ) ) ( not ( = ?auto_259642 ?auto_259643 ) ) ( not ( = ?auto_259642 ?auto_259644 ) ) ( not ( = ?auto_259642 ?auto_259645 ) ) ( not ( = ?auto_259642 ?auto_259646 ) ) ( not ( = ?auto_259643 ?auto_259644 ) ) ( not ( = ?auto_259643 ?auto_259645 ) ) ( not ( = ?auto_259643 ?auto_259646 ) ) ( not ( = ?auto_259644 ?auto_259645 ) ) ( not ( = ?auto_259644 ?auto_259646 ) ) ( not ( = ?auto_259645 ?auto_259646 ) ) ( ON ?auto_259644 ?auto_259645 ) ( ON ?auto_259643 ?auto_259644 ) ( ON ?auto_259642 ?auto_259643 ) ( ON ?auto_259641 ?auto_259642 ) ( ON ?auto_259640 ?auto_259641 ) ( ON ?auto_259639 ?auto_259640 ) ( ON ?auto_259638 ?auto_259639 ) ( ON ?auto_259637 ?auto_259638 ) ( CLEAR ?auto_259635 ) ( ON ?auto_259636 ?auto_259637 ) ( CLEAR ?auto_259636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_259635 ?auto_259636 )
      ( MAKE-11PILE ?auto_259635 ?auto_259636 ?auto_259637 ?auto_259638 ?auto_259639 ?auto_259640 ?auto_259641 ?auto_259642 ?auto_259643 ?auto_259644 ?auto_259645 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259658 - BLOCK
      ?auto_259659 - BLOCK
      ?auto_259660 - BLOCK
      ?auto_259661 - BLOCK
      ?auto_259662 - BLOCK
      ?auto_259663 - BLOCK
      ?auto_259664 - BLOCK
      ?auto_259665 - BLOCK
      ?auto_259666 - BLOCK
      ?auto_259667 - BLOCK
      ?auto_259668 - BLOCK
    )
    :vars
    (
      ?auto_259669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259668 ?auto_259669 ) ( ON-TABLE ?auto_259658 ) ( not ( = ?auto_259658 ?auto_259659 ) ) ( not ( = ?auto_259658 ?auto_259660 ) ) ( not ( = ?auto_259658 ?auto_259661 ) ) ( not ( = ?auto_259658 ?auto_259662 ) ) ( not ( = ?auto_259658 ?auto_259663 ) ) ( not ( = ?auto_259658 ?auto_259664 ) ) ( not ( = ?auto_259658 ?auto_259665 ) ) ( not ( = ?auto_259658 ?auto_259666 ) ) ( not ( = ?auto_259658 ?auto_259667 ) ) ( not ( = ?auto_259658 ?auto_259668 ) ) ( not ( = ?auto_259658 ?auto_259669 ) ) ( not ( = ?auto_259659 ?auto_259660 ) ) ( not ( = ?auto_259659 ?auto_259661 ) ) ( not ( = ?auto_259659 ?auto_259662 ) ) ( not ( = ?auto_259659 ?auto_259663 ) ) ( not ( = ?auto_259659 ?auto_259664 ) ) ( not ( = ?auto_259659 ?auto_259665 ) ) ( not ( = ?auto_259659 ?auto_259666 ) ) ( not ( = ?auto_259659 ?auto_259667 ) ) ( not ( = ?auto_259659 ?auto_259668 ) ) ( not ( = ?auto_259659 ?auto_259669 ) ) ( not ( = ?auto_259660 ?auto_259661 ) ) ( not ( = ?auto_259660 ?auto_259662 ) ) ( not ( = ?auto_259660 ?auto_259663 ) ) ( not ( = ?auto_259660 ?auto_259664 ) ) ( not ( = ?auto_259660 ?auto_259665 ) ) ( not ( = ?auto_259660 ?auto_259666 ) ) ( not ( = ?auto_259660 ?auto_259667 ) ) ( not ( = ?auto_259660 ?auto_259668 ) ) ( not ( = ?auto_259660 ?auto_259669 ) ) ( not ( = ?auto_259661 ?auto_259662 ) ) ( not ( = ?auto_259661 ?auto_259663 ) ) ( not ( = ?auto_259661 ?auto_259664 ) ) ( not ( = ?auto_259661 ?auto_259665 ) ) ( not ( = ?auto_259661 ?auto_259666 ) ) ( not ( = ?auto_259661 ?auto_259667 ) ) ( not ( = ?auto_259661 ?auto_259668 ) ) ( not ( = ?auto_259661 ?auto_259669 ) ) ( not ( = ?auto_259662 ?auto_259663 ) ) ( not ( = ?auto_259662 ?auto_259664 ) ) ( not ( = ?auto_259662 ?auto_259665 ) ) ( not ( = ?auto_259662 ?auto_259666 ) ) ( not ( = ?auto_259662 ?auto_259667 ) ) ( not ( = ?auto_259662 ?auto_259668 ) ) ( not ( = ?auto_259662 ?auto_259669 ) ) ( not ( = ?auto_259663 ?auto_259664 ) ) ( not ( = ?auto_259663 ?auto_259665 ) ) ( not ( = ?auto_259663 ?auto_259666 ) ) ( not ( = ?auto_259663 ?auto_259667 ) ) ( not ( = ?auto_259663 ?auto_259668 ) ) ( not ( = ?auto_259663 ?auto_259669 ) ) ( not ( = ?auto_259664 ?auto_259665 ) ) ( not ( = ?auto_259664 ?auto_259666 ) ) ( not ( = ?auto_259664 ?auto_259667 ) ) ( not ( = ?auto_259664 ?auto_259668 ) ) ( not ( = ?auto_259664 ?auto_259669 ) ) ( not ( = ?auto_259665 ?auto_259666 ) ) ( not ( = ?auto_259665 ?auto_259667 ) ) ( not ( = ?auto_259665 ?auto_259668 ) ) ( not ( = ?auto_259665 ?auto_259669 ) ) ( not ( = ?auto_259666 ?auto_259667 ) ) ( not ( = ?auto_259666 ?auto_259668 ) ) ( not ( = ?auto_259666 ?auto_259669 ) ) ( not ( = ?auto_259667 ?auto_259668 ) ) ( not ( = ?auto_259667 ?auto_259669 ) ) ( not ( = ?auto_259668 ?auto_259669 ) ) ( ON ?auto_259667 ?auto_259668 ) ( ON ?auto_259666 ?auto_259667 ) ( ON ?auto_259665 ?auto_259666 ) ( ON ?auto_259664 ?auto_259665 ) ( ON ?auto_259663 ?auto_259664 ) ( ON ?auto_259662 ?auto_259663 ) ( ON ?auto_259661 ?auto_259662 ) ( ON ?auto_259660 ?auto_259661 ) ( CLEAR ?auto_259658 ) ( ON ?auto_259659 ?auto_259660 ) ( CLEAR ?auto_259659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_259658 ?auto_259659 )
      ( MAKE-11PILE ?auto_259658 ?auto_259659 ?auto_259660 ?auto_259661 ?auto_259662 ?auto_259663 ?auto_259664 ?auto_259665 ?auto_259666 ?auto_259667 ?auto_259668 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259681 - BLOCK
      ?auto_259682 - BLOCK
      ?auto_259683 - BLOCK
      ?auto_259684 - BLOCK
      ?auto_259685 - BLOCK
      ?auto_259686 - BLOCK
      ?auto_259687 - BLOCK
      ?auto_259688 - BLOCK
      ?auto_259689 - BLOCK
      ?auto_259690 - BLOCK
      ?auto_259691 - BLOCK
    )
    :vars
    (
      ?auto_259692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259691 ?auto_259692 ) ( not ( = ?auto_259681 ?auto_259682 ) ) ( not ( = ?auto_259681 ?auto_259683 ) ) ( not ( = ?auto_259681 ?auto_259684 ) ) ( not ( = ?auto_259681 ?auto_259685 ) ) ( not ( = ?auto_259681 ?auto_259686 ) ) ( not ( = ?auto_259681 ?auto_259687 ) ) ( not ( = ?auto_259681 ?auto_259688 ) ) ( not ( = ?auto_259681 ?auto_259689 ) ) ( not ( = ?auto_259681 ?auto_259690 ) ) ( not ( = ?auto_259681 ?auto_259691 ) ) ( not ( = ?auto_259681 ?auto_259692 ) ) ( not ( = ?auto_259682 ?auto_259683 ) ) ( not ( = ?auto_259682 ?auto_259684 ) ) ( not ( = ?auto_259682 ?auto_259685 ) ) ( not ( = ?auto_259682 ?auto_259686 ) ) ( not ( = ?auto_259682 ?auto_259687 ) ) ( not ( = ?auto_259682 ?auto_259688 ) ) ( not ( = ?auto_259682 ?auto_259689 ) ) ( not ( = ?auto_259682 ?auto_259690 ) ) ( not ( = ?auto_259682 ?auto_259691 ) ) ( not ( = ?auto_259682 ?auto_259692 ) ) ( not ( = ?auto_259683 ?auto_259684 ) ) ( not ( = ?auto_259683 ?auto_259685 ) ) ( not ( = ?auto_259683 ?auto_259686 ) ) ( not ( = ?auto_259683 ?auto_259687 ) ) ( not ( = ?auto_259683 ?auto_259688 ) ) ( not ( = ?auto_259683 ?auto_259689 ) ) ( not ( = ?auto_259683 ?auto_259690 ) ) ( not ( = ?auto_259683 ?auto_259691 ) ) ( not ( = ?auto_259683 ?auto_259692 ) ) ( not ( = ?auto_259684 ?auto_259685 ) ) ( not ( = ?auto_259684 ?auto_259686 ) ) ( not ( = ?auto_259684 ?auto_259687 ) ) ( not ( = ?auto_259684 ?auto_259688 ) ) ( not ( = ?auto_259684 ?auto_259689 ) ) ( not ( = ?auto_259684 ?auto_259690 ) ) ( not ( = ?auto_259684 ?auto_259691 ) ) ( not ( = ?auto_259684 ?auto_259692 ) ) ( not ( = ?auto_259685 ?auto_259686 ) ) ( not ( = ?auto_259685 ?auto_259687 ) ) ( not ( = ?auto_259685 ?auto_259688 ) ) ( not ( = ?auto_259685 ?auto_259689 ) ) ( not ( = ?auto_259685 ?auto_259690 ) ) ( not ( = ?auto_259685 ?auto_259691 ) ) ( not ( = ?auto_259685 ?auto_259692 ) ) ( not ( = ?auto_259686 ?auto_259687 ) ) ( not ( = ?auto_259686 ?auto_259688 ) ) ( not ( = ?auto_259686 ?auto_259689 ) ) ( not ( = ?auto_259686 ?auto_259690 ) ) ( not ( = ?auto_259686 ?auto_259691 ) ) ( not ( = ?auto_259686 ?auto_259692 ) ) ( not ( = ?auto_259687 ?auto_259688 ) ) ( not ( = ?auto_259687 ?auto_259689 ) ) ( not ( = ?auto_259687 ?auto_259690 ) ) ( not ( = ?auto_259687 ?auto_259691 ) ) ( not ( = ?auto_259687 ?auto_259692 ) ) ( not ( = ?auto_259688 ?auto_259689 ) ) ( not ( = ?auto_259688 ?auto_259690 ) ) ( not ( = ?auto_259688 ?auto_259691 ) ) ( not ( = ?auto_259688 ?auto_259692 ) ) ( not ( = ?auto_259689 ?auto_259690 ) ) ( not ( = ?auto_259689 ?auto_259691 ) ) ( not ( = ?auto_259689 ?auto_259692 ) ) ( not ( = ?auto_259690 ?auto_259691 ) ) ( not ( = ?auto_259690 ?auto_259692 ) ) ( not ( = ?auto_259691 ?auto_259692 ) ) ( ON ?auto_259690 ?auto_259691 ) ( ON ?auto_259689 ?auto_259690 ) ( ON ?auto_259688 ?auto_259689 ) ( ON ?auto_259687 ?auto_259688 ) ( ON ?auto_259686 ?auto_259687 ) ( ON ?auto_259685 ?auto_259686 ) ( ON ?auto_259684 ?auto_259685 ) ( ON ?auto_259683 ?auto_259684 ) ( ON ?auto_259682 ?auto_259683 ) ( ON ?auto_259681 ?auto_259682 ) ( CLEAR ?auto_259681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_259681 )
      ( MAKE-11PILE ?auto_259681 ?auto_259682 ?auto_259683 ?auto_259684 ?auto_259685 ?auto_259686 ?auto_259687 ?auto_259688 ?auto_259689 ?auto_259690 ?auto_259691 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259704 - BLOCK
      ?auto_259705 - BLOCK
      ?auto_259706 - BLOCK
      ?auto_259707 - BLOCK
      ?auto_259708 - BLOCK
      ?auto_259709 - BLOCK
      ?auto_259710 - BLOCK
      ?auto_259711 - BLOCK
      ?auto_259712 - BLOCK
      ?auto_259713 - BLOCK
      ?auto_259714 - BLOCK
    )
    :vars
    (
      ?auto_259715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259714 ?auto_259715 ) ( not ( = ?auto_259704 ?auto_259705 ) ) ( not ( = ?auto_259704 ?auto_259706 ) ) ( not ( = ?auto_259704 ?auto_259707 ) ) ( not ( = ?auto_259704 ?auto_259708 ) ) ( not ( = ?auto_259704 ?auto_259709 ) ) ( not ( = ?auto_259704 ?auto_259710 ) ) ( not ( = ?auto_259704 ?auto_259711 ) ) ( not ( = ?auto_259704 ?auto_259712 ) ) ( not ( = ?auto_259704 ?auto_259713 ) ) ( not ( = ?auto_259704 ?auto_259714 ) ) ( not ( = ?auto_259704 ?auto_259715 ) ) ( not ( = ?auto_259705 ?auto_259706 ) ) ( not ( = ?auto_259705 ?auto_259707 ) ) ( not ( = ?auto_259705 ?auto_259708 ) ) ( not ( = ?auto_259705 ?auto_259709 ) ) ( not ( = ?auto_259705 ?auto_259710 ) ) ( not ( = ?auto_259705 ?auto_259711 ) ) ( not ( = ?auto_259705 ?auto_259712 ) ) ( not ( = ?auto_259705 ?auto_259713 ) ) ( not ( = ?auto_259705 ?auto_259714 ) ) ( not ( = ?auto_259705 ?auto_259715 ) ) ( not ( = ?auto_259706 ?auto_259707 ) ) ( not ( = ?auto_259706 ?auto_259708 ) ) ( not ( = ?auto_259706 ?auto_259709 ) ) ( not ( = ?auto_259706 ?auto_259710 ) ) ( not ( = ?auto_259706 ?auto_259711 ) ) ( not ( = ?auto_259706 ?auto_259712 ) ) ( not ( = ?auto_259706 ?auto_259713 ) ) ( not ( = ?auto_259706 ?auto_259714 ) ) ( not ( = ?auto_259706 ?auto_259715 ) ) ( not ( = ?auto_259707 ?auto_259708 ) ) ( not ( = ?auto_259707 ?auto_259709 ) ) ( not ( = ?auto_259707 ?auto_259710 ) ) ( not ( = ?auto_259707 ?auto_259711 ) ) ( not ( = ?auto_259707 ?auto_259712 ) ) ( not ( = ?auto_259707 ?auto_259713 ) ) ( not ( = ?auto_259707 ?auto_259714 ) ) ( not ( = ?auto_259707 ?auto_259715 ) ) ( not ( = ?auto_259708 ?auto_259709 ) ) ( not ( = ?auto_259708 ?auto_259710 ) ) ( not ( = ?auto_259708 ?auto_259711 ) ) ( not ( = ?auto_259708 ?auto_259712 ) ) ( not ( = ?auto_259708 ?auto_259713 ) ) ( not ( = ?auto_259708 ?auto_259714 ) ) ( not ( = ?auto_259708 ?auto_259715 ) ) ( not ( = ?auto_259709 ?auto_259710 ) ) ( not ( = ?auto_259709 ?auto_259711 ) ) ( not ( = ?auto_259709 ?auto_259712 ) ) ( not ( = ?auto_259709 ?auto_259713 ) ) ( not ( = ?auto_259709 ?auto_259714 ) ) ( not ( = ?auto_259709 ?auto_259715 ) ) ( not ( = ?auto_259710 ?auto_259711 ) ) ( not ( = ?auto_259710 ?auto_259712 ) ) ( not ( = ?auto_259710 ?auto_259713 ) ) ( not ( = ?auto_259710 ?auto_259714 ) ) ( not ( = ?auto_259710 ?auto_259715 ) ) ( not ( = ?auto_259711 ?auto_259712 ) ) ( not ( = ?auto_259711 ?auto_259713 ) ) ( not ( = ?auto_259711 ?auto_259714 ) ) ( not ( = ?auto_259711 ?auto_259715 ) ) ( not ( = ?auto_259712 ?auto_259713 ) ) ( not ( = ?auto_259712 ?auto_259714 ) ) ( not ( = ?auto_259712 ?auto_259715 ) ) ( not ( = ?auto_259713 ?auto_259714 ) ) ( not ( = ?auto_259713 ?auto_259715 ) ) ( not ( = ?auto_259714 ?auto_259715 ) ) ( ON ?auto_259713 ?auto_259714 ) ( ON ?auto_259712 ?auto_259713 ) ( ON ?auto_259711 ?auto_259712 ) ( ON ?auto_259710 ?auto_259711 ) ( ON ?auto_259709 ?auto_259710 ) ( ON ?auto_259708 ?auto_259709 ) ( ON ?auto_259707 ?auto_259708 ) ( ON ?auto_259706 ?auto_259707 ) ( ON ?auto_259705 ?auto_259706 ) ( ON ?auto_259704 ?auto_259705 ) ( CLEAR ?auto_259704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_259704 )
      ( MAKE-11PILE ?auto_259704 ?auto_259705 ?auto_259706 ?auto_259707 ?auto_259708 ?auto_259709 ?auto_259710 ?auto_259711 ?auto_259712 ?auto_259713 ?auto_259714 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_259728 - BLOCK
      ?auto_259729 - BLOCK
      ?auto_259730 - BLOCK
      ?auto_259731 - BLOCK
      ?auto_259732 - BLOCK
      ?auto_259733 - BLOCK
      ?auto_259734 - BLOCK
      ?auto_259735 - BLOCK
      ?auto_259736 - BLOCK
      ?auto_259737 - BLOCK
      ?auto_259738 - BLOCK
      ?auto_259739 - BLOCK
    )
    :vars
    (
      ?auto_259740 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_259738 ) ( ON ?auto_259739 ?auto_259740 ) ( CLEAR ?auto_259739 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_259728 ) ( ON ?auto_259729 ?auto_259728 ) ( ON ?auto_259730 ?auto_259729 ) ( ON ?auto_259731 ?auto_259730 ) ( ON ?auto_259732 ?auto_259731 ) ( ON ?auto_259733 ?auto_259732 ) ( ON ?auto_259734 ?auto_259733 ) ( ON ?auto_259735 ?auto_259734 ) ( ON ?auto_259736 ?auto_259735 ) ( ON ?auto_259737 ?auto_259736 ) ( ON ?auto_259738 ?auto_259737 ) ( not ( = ?auto_259728 ?auto_259729 ) ) ( not ( = ?auto_259728 ?auto_259730 ) ) ( not ( = ?auto_259728 ?auto_259731 ) ) ( not ( = ?auto_259728 ?auto_259732 ) ) ( not ( = ?auto_259728 ?auto_259733 ) ) ( not ( = ?auto_259728 ?auto_259734 ) ) ( not ( = ?auto_259728 ?auto_259735 ) ) ( not ( = ?auto_259728 ?auto_259736 ) ) ( not ( = ?auto_259728 ?auto_259737 ) ) ( not ( = ?auto_259728 ?auto_259738 ) ) ( not ( = ?auto_259728 ?auto_259739 ) ) ( not ( = ?auto_259728 ?auto_259740 ) ) ( not ( = ?auto_259729 ?auto_259730 ) ) ( not ( = ?auto_259729 ?auto_259731 ) ) ( not ( = ?auto_259729 ?auto_259732 ) ) ( not ( = ?auto_259729 ?auto_259733 ) ) ( not ( = ?auto_259729 ?auto_259734 ) ) ( not ( = ?auto_259729 ?auto_259735 ) ) ( not ( = ?auto_259729 ?auto_259736 ) ) ( not ( = ?auto_259729 ?auto_259737 ) ) ( not ( = ?auto_259729 ?auto_259738 ) ) ( not ( = ?auto_259729 ?auto_259739 ) ) ( not ( = ?auto_259729 ?auto_259740 ) ) ( not ( = ?auto_259730 ?auto_259731 ) ) ( not ( = ?auto_259730 ?auto_259732 ) ) ( not ( = ?auto_259730 ?auto_259733 ) ) ( not ( = ?auto_259730 ?auto_259734 ) ) ( not ( = ?auto_259730 ?auto_259735 ) ) ( not ( = ?auto_259730 ?auto_259736 ) ) ( not ( = ?auto_259730 ?auto_259737 ) ) ( not ( = ?auto_259730 ?auto_259738 ) ) ( not ( = ?auto_259730 ?auto_259739 ) ) ( not ( = ?auto_259730 ?auto_259740 ) ) ( not ( = ?auto_259731 ?auto_259732 ) ) ( not ( = ?auto_259731 ?auto_259733 ) ) ( not ( = ?auto_259731 ?auto_259734 ) ) ( not ( = ?auto_259731 ?auto_259735 ) ) ( not ( = ?auto_259731 ?auto_259736 ) ) ( not ( = ?auto_259731 ?auto_259737 ) ) ( not ( = ?auto_259731 ?auto_259738 ) ) ( not ( = ?auto_259731 ?auto_259739 ) ) ( not ( = ?auto_259731 ?auto_259740 ) ) ( not ( = ?auto_259732 ?auto_259733 ) ) ( not ( = ?auto_259732 ?auto_259734 ) ) ( not ( = ?auto_259732 ?auto_259735 ) ) ( not ( = ?auto_259732 ?auto_259736 ) ) ( not ( = ?auto_259732 ?auto_259737 ) ) ( not ( = ?auto_259732 ?auto_259738 ) ) ( not ( = ?auto_259732 ?auto_259739 ) ) ( not ( = ?auto_259732 ?auto_259740 ) ) ( not ( = ?auto_259733 ?auto_259734 ) ) ( not ( = ?auto_259733 ?auto_259735 ) ) ( not ( = ?auto_259733 ?auto_259736 ) ) ( not ( = ?auto_259733 ?auto_259737 ) ) ( not ( = ?auto_259733 ?auto_259738 ) ) ( not ( = ?auto_259733 ?auto_259739 ) ) ( not ( = ?auto_259733 ?auto_259740 ) ) ( not ( = ?auto_259734 ?auto_259735 ) ) ( not ( = ?auto_259734 ?auto_259736 ) ) ( not ( = ?auto_259734 ?auto_259737 ) ) ( not ( = ?auto_259734 ?auto_259738 ) ) ( not ( = ?auto_259734 ?auto_259739 ) ) ( not ( = ?auto_259734 ?auto_259740 ) ) ( not ( = ?auto_259735 ?auto_259736 ) ) ( not ( = ?auto_259735 ?auto_259737 ) ) ( not ( = ?auto_259735 ?auto_259738 ) ) ( not ( = ?auto_259735 ?auto_259739 ) ) ( not ( = ?auto_259735 ?auto_259740 ) ) ( not ( = ?auto_259736 ?auto_259737 ) ) ( not ( = ?auto_259736 ?auto_259738 ) ) ( not ( = ?auto_259736 ?auto_259739 ) ) ( not ( = ?auto_259736 ?auto_259740 ) ) ( not ( = ?auto_259737 ?auto_259738 ) ) ( not ( = ?auto_259737 ?auto_259739 ) ) ( not ( = ?auto_259737 ?auto_259740 ) ) ( not ( = ?auto_259738 ?auto_259739 ) ) ( not ( = ?auto_259738 ?auto_259740 ) ) ( not ( = ?auto_259739 ?auto_259740 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_259739 ?auto_259740 )
      ( !STACK ?auto_259739 ?auto_259738 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_259753 - BLOCK
      ?auto_259754 - BLOCK
      ?auto_259755 - BLOCK
      ?auto_259756 - BLOCK
      ?auto_259757 - BLOCK
      ?auto_259758 - BLOCK
      ?auto_259759 - BLOCK
      ?auto_259760 - BLOCK
      ?auto_259761 - BLOCK
      ?auto_259762 - BLOCK
      ?auto_259763 - BLOCK
      ?auto_259764 - BLOCK
    )
    :vars
    (
      ?auto_259765 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_259763 ) ( ON ?auto_259764 ?auto_259765 ) ( CLEAR ?auto_259764 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_259753 ) ( ON ?auto_259754 ?auto_259753 ) ( ON ?auto_259755 ?auto_259754 ) ( ON ?auto_259756 ?auto_259755 ) ( ON ?auto_259757 ?auto_259756 ) ( ON ?auto_259758 ?auto_259757 ) ( ON ?auto_259759 ?auto_259758 ) ( ON ?auto_259760 ?auto_259759 ) ( ON ?auto_259761 ?auto_259760 ) ( ON ?auto_259762 ?auto_259761 ) ( ON ?auto_259763 ?auto_259762 ) ( not ( = ?auto_259753 ?auto_259754 ) ) ( not ( = ?auto_259753 ?auto_259755 ) ) ( not ( = ?auto_259753 ?auto_259756 ) ) ( not ( = ?auto_259753 ?auto_259757 ) ) ( not ( = ?auto_259753 ?auto_259758 ) ) ( not ( = ?auto_259753 ?auto_259759 ) ) ( not ( = ?auto_259753 ?auto_259760 ) ) ( not ( = ?auto_259753 ?auto_259761 ) ) ( not ( = ?auto_259753 ?auto_259762 ) ) ( not ( = ?auto_259753 ?auto_259763 ) ) ( not ( = ?auto_259753 ?auto_259764 ) ) ( not ( = ?auto_259753 ?auto_259765 ) ) ( not ( = ?auto_259754 ?auto_259755 ) ) ( not ( = ?auto_259754 ?auto_259756 ) ) ( not ( = ?auto_259754 ?auto_259757 ) ) ( not ( = ?auto_259754 ?auto_259758 ) ) ( not ( = ?auto_259754 ?auto_259759 ) ) ( not ( = ?auto_259754 ?auto_259760 ) ) ( not ( = ?auto_259754 ?auto_259761 ) ) ( not ( = ?auto_259754 ?auto_259762 ) ) ( not ( = ?auto_259754 ?auto_259763 ) ) ( not ( = ?auto_259754 ?auto_259764 ) ) ( not ( = ?auto_259754 ?auto_259765 ) ) ( not ( = ?auto_259755 ?auto_259756 ) ) ( not ( = ?auto_259755 ?auto_259757 ) ) ( not ( = ?auto_259755 ?auto_259758 ) ) ( not ( = ?auto_259755 ?auto_259759 ) ) ( not ( = ?auto_259755 ?auto_259760 ) ) ( not ( = ?auto_259755 ?auto_259761 ) ) ( not ( = ?auto_259755 ?auto_259762 ) ) ( not ( = ?auto_259755 ?auto_259763 ) ) ( not ( = ?auto_259755 ?auto_259764 ) ) ( not ( = ?auto_259755 ?auto_259765 ) ) ( not ( = ?auto_259756 ?auto_259757 ) ) ( not ( = ?auto_259756 ?auto_259758 ) ) ( not ( = ?auto_259756 ?auto_259759 ) ) ( not ( = ?auto_259756 ?auto_259760 ) ) ( not ( = ?auto_259756 ?auto_259761 ) ) ( not ( = ?auto_259756 ?auto_259762 ) ) ( not ( = ?auto_259756 ?auto_259763 ) ) ( not ( = ?auto_259756 ?auto_259764 ) ) ( not ( = ?auto_259756 ?auto_259765 ) ) ( not ( = ?auto_259757 ?auto_259758 ) ) ( not ( = ?auto_259757 ?auto_259759 ) ) ( not ( = ?auto_259757 ?auto_259760 ) ) ( not ( = ?auto_259757 ?auto_259761 ) ) ( not ( = ?auto_259757 ?auto_259762 ) ) ( not ( = ?auto_259757 ?auto_259763 ) ) ( not ( = ?auto_259757 ?auto_259764 ) ) ( not ( = ?auto_259757 ?auto_259765 ) ) ( not ( = ?auto_259758 ?auto_259759 ) ) ( not ( = ?auto_259758 ?auto_259760 ) ) ( not ( = ?auto_259758 ?auto_259761 ) ) ( not ( = ?auto_259758 ?auto_259762 ) ) ( not ( = ?auto_259758 ?auto_259763 ) ) ( not ( = ?auto_259758 ?auto_259764 ) ) ( not ( = ?auto_259758 ?auto_259765 ) ) ( not ( = ?auto_259759 ?auto_259760 ) ) ( not ( = ?auto_259759 ?auto_259761 ) ) ( not ( = ?auto_259759 ?auto_259762 ) ) ( not ( = ?auto_259759 ?auto_259763 ) ) ( not ( = ?auto_259759 ?auto_259764 ) ) ( not ( = ?auto_259759 ?auto_259765 ) ) ( not ( = ?auto_259760 ?auto_259761 ) ) ( not ( = ?auto_259760 ?auto_259762 ) ) ( not ( = ?auto_259760 ?auto_259763 ) ) ( not ( = ?auto_259760 ?auto_259764 ) ) ( not ( = ?auto_259760 ?auto_259765 ) ) ( not ( = ?auto_259761 ?auto_259762 ) ) ( not ( = ?auto_259761 ?auto_259763 ) ) ( not ( = ?auto_259761 ?auto_259764 ) ) ( not ( = ?auto_259761 ?auto_259765 ) ) ( not ( = ?auto_259762 ?auto_259763 ) ) ( not ( = ?auto_259762 ?auto_259764 ) ) ( not ( = ?auto_259762 ?auto_259765 ) ) ( not ( = ?auto_259763 ?auto_259764 ) ) ( not ( = ?auto_259763 ?auto_259765 ) ) ( not ( = ?auto_259764 ?auto_259765 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_259764 ?auto_259765 )
      ( !STACK ?auto_259764 ?auto_259763 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_259778 - BLOCK
      ?auto_259779 - BLOCK
      ?auto_259780 - BLOCK
      ?auto_259781 - BLOCK
      ?auto_259782 - BLOCK
      ?auto_259783 - BLOCK
      ?auto_259784 - BLOCK
      ?auto_259785 - BLOCK
      ?auto_259786 - BLOCK
      ?auto_259787 - BLOCK
      ?auto_259788 - BLOCK
      ?auto_259789 - BLOCK
    )
    :vars
    (
      ?auto_259790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259789 ?auto_259790 ) ( ON-TABLE ?auto_259778 ) ( ON ?auto_259779 ?auto_259778 ) ( ON ?auto_259780 ?auto_259779 ) ( ON ?auto_259781 ?auto_259780 ) ( ON ?auto_259782 ?auto_259781 ) ( ON ?auto_259783 ?auto_259782 ) ( ON ?auto_259784 ?auto_259783 ) ( ON ?auto_259785 ?auto_259784 ) ( ON ?auto_259786 ?auto_259785 ) ( ON ?auto_259787 ?auto_259786 ) ( not ( = ?auto_259778 ?auto_259779 ) ) ( not ( = ?auto_259778 ?auto_259780 ) ) ( not ( = ?auto_259778 ?auto_259781 ) ) ( not ( = ?auto_259778 ?auto_259782 ) ) ( not ( = ?auto_259778 ?auto_259783 ) ) ( not ( = ?auto_259778 ?auto_259784 ) ) ( not ( = ?auto_259778 ?auto_259785 ) ) ( not ( = ?auto_259778 ?auto_259786 ) ) ( not ( = ?auto_259778 ?auto_259787 ) ) ( not ( = ?auto_259778 ?auto_259788 ) ) ( not ( = ?auto_259778 ?auto_259789 ) ) ( not ( = ?auto_259778 ?auto_259790 ) ) ( not ( = ?auto_259779 ?auto_259780 ) ) ( not ( = ?auto_259779 ?auto_259781 ) ) ( not ( = ?auto_259779 ?auto_259782 ) ) ( not ( = ?auto_259779 ?auto_259783 ) ) ( not ( = ?auto_259779 ?auto_259784 ) ) ( not ( = ?auto_259779 ?auto_259785 ) ) ( not ( = ?auto_259779 ?auto_259786 ) ) ( not ( = ?auto_259779 ?auto_259787 ) ) ( not ( = ?auto_259779 ?auto_259788 ) ) ( not ( = ?auto_259779 ?auto_259789 ) ) ( not ( = ?auto_259779 ?auto_259790 ) ) ( not ( = ?auto_259780 ?auto_259781 ) ) ( not ( = ?auto_259780 ?auto_259782 ) ) ( not ( = ?auto_259780 ?auto_259783 ) ) ( not ( = ?auto_259780 ?auto_259784 ) ) ( not ( = ?auto_259780 ?auto_259785 ) ) ( not ( = ?auto_259780 ?auto_259786 ) ) ( not ( = ?auto_259780 ?auto_259787 ) ) ( not ( = ?auto_259780 ?auto_259788 ) ) ( not ( = ?auto_259780 ?auto_259789 ) ) ( not ( = ?auto_259780 ?auto_259790 ) ) ( not ( = ?auto_259781 ?auto_259782 ) ) ( not ( = ?auto_259781 ?auto_259783 ) ) ( not ( = ?auto_259781 ?auto_259784 ) ) ( not ( = ?auto_259781 ?auto_259785 ) ) ( not ( = ?auto_259781 ?auto_259786 ) ) ( not ( = ?auto_259781 ?auto_259787 ) ) ( not ( = ?auto_259781 ?auto_259788 ) ) ( not ( = ?auto_259781 ?auto_259789 ) ) ( not ( = ?auto_259781 ?auto_259790 ) ) ( not ( = ?auto_259782 ?auto_259783 ) ) ( not ( = ?auto_259782 ?auto_259784 ) ) ( not ( = ?auto_259782 ?auto_259785 ) ) ( not ( = ?auto_259782 ?auto_259786 ) ) ( not ( = ?auto_259782 ?auto_259787 ) ) ( not ( = ?auto_259782 ?auto_259788 ) ) ( not ( = ?auto_259782 ?auto_259789 ) ) ( not ( = ?auto_259782 ?auto_259790 ) ) ( not ( = ?auto_259783 ?auto_259784 ) ) ( not ( = ?auto_259783 ?auto_259785 ) ) ( not ( = ?auto_259783 ?auto_259786 ) ) ( not ( = ?auto_259783 ?auto_259787 ) ) ( not ( = ?auto_259783 ?auto_259788 ) ) ( not ( = ?auto_259783 ?auto_259789 ) ) ( not ( = ?auto_259783 ?auto_259790 ) ) ( not ( = ?auto_259784 ?auto_259785 ) ) ( not ( = ?auto_259784 ?auto_259786 ) ) ( not ( = ?auto_259784 ?auto_259787 ) ) ( not ( = ?auto_259784 ?auto_259788 ) ) ( not ( = ?auto_259784 ?auto_259789 ) ) ( not ( = ?auto_259784 ?auto_259790 ) ) ( not ( = ?auto_259785 ?auto_259786 ) ) ( not ( = ?auto_259785 ?auto_259787 ) ) ( not ( = ?auto_259785 ?auto_259788 ) ) ( not ( = ?auto_259785 ?auto_259789 ) ) ( not ( = ?auto_259785 ?auto_259790 ) ) ( not ( = ?auto_259786 ?auto_259787 ) ) ( not ( = ?auto_259786 ?auto_259788 ) ) ( not ( = ?auto_259786 ?auto_259789 ) ) ( not ( = ?auto_259786 ?auto_259790 ) ) ( not ( = ?auto_259787 ?auto_259788 ) ) ( not ( = ?auto_259787 ?auto_259789 ) ) ( not ( = ?auto_259787 ?auto_259790 ) ) ( not ( = ?auto_259788 ?auto_259789 ) ) ( not ( = ?auto_259788 ?auto_259790 ) ) ( not ( = ?auto_259789 ?auto_259790 ) ) ( CLEAR ?auto_259787 ) ( ON ?auto_259788 ?auto_259789 ) ( CLEAR ?auto_259788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_259778 ?auto_259779 ?auto_259780 ?auto_259781 ?auto_259782 ?auto_259783 ?auto_259784 ?auto_259785 ?auto_259786 ?auto_259787 ?auto_259788 )
      ( MAKE-12PILE ?auto_259778 ?auto_259779 ?auto_259780 ?auto_259781 ?auto_259782 ?auto_259783 ?auto_259784 ?auto_259785 ?auto_259786 ?auto_259787 ?auto_259788 ?auto_259789 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_259803 - BLOCK
      ?auto_259804 - BLOCK
      ?auto_259805 - BLOCK
      ?auto_259806 - BLOCK
      ?auto_259807 - BLOCK
      ?auto_259808 - BLOCK
      ?auto_259809 - BLOCK
      ?auto_259810 - BLOCK
      ?auto_259811 - BLOCK
      ?auto_259812 - BLOCK
      ?auto_259813 - BLOCK
      ?auto_259814 - BLOCK
    )
    :vars
    (
      ?auto_259815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259814 ?auto_259815 ) ( ON-TABLE ?auto_259803 ) ( ON ?auto_259804 ?auto_259803 ) ( ON ?auto_259805 ?auto_259804 ) ( ON ?auto_259806 ?auto_259805 ) ( ON ?auto_259807 ?auto_259806 ) ( ON ?auto_259808 ?auto_259807 ) ( ON ?auto_259809 ?auto_259808 ) ( ON ?auto_259810 ?auto_259809 ) ( ON ?auto_259811 ?auto_259810 ) ( ON ?auto_259812 ?auto_259811 ) ( not ( = ?auto_259803 ?auto_259804 ) ) ( not ( = ?auto_259803 ?auto_259805 ) ) ( not ( = ?auto_259803 ?auto_259806 ) ) ( not ( = ?auto_259803 ?auto_259807 ) ) ( not ( = ?auto_259803 ?auto_259808 ) ) ( not ( = ?auto_259803 ?auto_259809 ) ) ( not ( = ?auto_259803 ?auto_259810 ) ) ( not ( = ?auto_259803 ?auto_259811 ) ) ( not ( = ?auto_259803 ?auto_259812 ) ) ( not ( = ?auto_259803 ?auto_259813 ) ) ( not ( = ?auto_259803 ?auto_259814 ) ) ( not ( = ?auto_259803 ?auto_259815 ) ) ( not ( = ?auto_259804 ?auto_259805 ) ) ( not ( = ?auto_259804 ?auto_259806 ) ) ( not ( = ?auto_259804 ?auto_259807 ) ) ( not ( = ?auto_259804 ?auto_259808 ) ) ( not ( = ?auto_259804 ?auto_259809 ) ) ( not ( = ?auto_259804 ?auto_259810 ) ) ( not ( = ?auto_259804 ?auto_259811 ) ) ( not ( = ?auto_259804 ?auto_259812 ) ) ( not ( = ?auto_259804 ?auto_259813 ) ) ( not ( = ?auto_259804 ?auto_259814 ) ) ( not ( = ?auto_259804 ?auto_259815 ) ) ( not ( = ?auto_259805 ?auto_259806 ) ) ( not ( = ?auto_259805 ?auto_259807 ) ) ( not ( = ?auto_259805 ?auto_259808 ) ) ( not ( = ?auto_259805 ?auto_259809 ) ) ( not ( = ?auto_259805 ?auto_259810 ) ) ( not ( = ?auto_259805 ?auto_259811 ) ) ( not ( = ?auto_259805 ?auto_259812 ) ) ( not ( = ?auto_259805 ?auto_259813 ) ) ( not ( = ?auto_259805 ?auto_259814 ) ) ( not ( = ?auto_259805 ?auto_259815 ) ) ( not ( = ?auto_259806 ?auto_259807 ) ) ( not ( = ?auto_259806 ?auto_259808 ) ) ( not ( = ?auto_259806 ?auto_259809 ) ) ( not ( = ?auto_259806 ?auto_259810 ) ) ( not ( = ?auto_259806 ?auto_259811 ) ) ( not ( = ?auto_259806 ?auto_259812 ) ) ( not ( = ?auto_259806 ?auto_259813 ) ) ( not ( = ?auto_259806 ?auto_259814 ) ) ( not ( = ?auto_259806 ?auto_259815 ) ) ( not ( = ?auto_259807 ?auto_259808 ) ) ( not ( = ?auto_259807 ?auto_259809 ) ) ( not ( = ?auto_259807 ?auto_259810 ) ) ( not ( = ?auto_259807 ?auto_259811 ) ) ( not ( = ?auto_259807 ?auto_259812 ) ) ( not ( = ?auto_259807 ?auto_259813 ) ) ( not ( = ?auto_259807 ?auto_259814 ) ) ( not ( = ?auto_259807 ?auto_259815 ) ) ( not ( = ?auto_259808 ?auto_259809 ) ) ( not ( = ?auto_259808 ?auto_259810 ) ) ( not ( = ?auto_259808 ?auto_259811 ) ) ( not ( = ?auto_259808 ?auto_259812 ) ) ( not ( = ?auto_259808 ?auto_259813 ) ) ( not ( = ?auto_259808 ?auto_259814 ) ) ( not ( = ?auto_259808 ?auto_259815 ) ) ( not ( = ?auto_259809 ?auto_259810 ) ) ( not ( = ?auto_259809 ?auto_259811 ) ) ( not ( = ?auto_259809 ?auto_259812 ) ) ( not ( = ?auto_259809 ?auto_259813 ) ) ( not ( = ?auto_259809 ?auto_259814 ) ) ( not ( = ?auto_259809 ?auto_259815 ) ) ( not ( = ?auto_259810 ?auto_259811 ) ) ( not ( = ?auto_259810 ?auto_259812 ) ) ( not ( = ?auto_259810 ?auto_259813 ) ) ( not ( = ?auto_259810 ?auto_259814 ) ) ( not ( = ?auto_259810 ?auto_259815 ) ) ( not ( = ?auto_259811 ?auto_259812 ) ) ( not ( = ?auto_259811 ?auto_259813 ) ) ( not ( = ?auto_259811 ?auto_259814 ) ) ( not ( = ?auto_259811 ?auto_259815 ) ) ( not ( = ?auto_259812 ?auto_259813 ) ) ( not ( = ?auto_259812 ?auto_259814 ) ) ( not ( = ?auto_259812 ?auto_259815 ) ) ( not ( = ?auto_259813 ?auto_259814 ) ) ( not ( = ?auto_259813 ?auto_259815 ) ) ( not ( = ?auto_259814 ?auto_259815 ) ) ( CLEAR ?auto_259812 ) ( ON ?auto_259813 ?auto_259814 ) ( CLEAR ?auto_259813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_259803 ?auto_259804 ?auto_259805 ?auto_259806 ?auto_259807 ?auto_259808 ?auto_259809 ?auto_259810 ?auto_259811 ?auto_259812 ?auto_259813 )
      ( MAKE-12PILE ?auto_259803 ?auto_259804 ?auto_259805 ?auto_259806 ?auto_259807 ?auto_259808 ?auto_259809 ?auto_259810 ?auto_259811 ?auto_259812 ?auto_259813 ?auto_259814 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_259828 - BLOCK
      ?auto_259829 - BLOCK
      ?auto_259830 - BLOCK
      ?auto_259831 - BLOCK
      ?auto_259832 - BLOCK
      ?auto_259833 - BLOCK
      ?auto_259834 - BLOCK
      ?auto_259835 - BLOCK
      ?auto_259836 - BLOCK
      ?auto_259837 - BLOCK
      ?auto_259838 - BLOCK
      ?auto_259839 - BLOCK
    )
    :vars
    (
      ?auto_259840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259839 ?auto_259840 ) ( ON-TABLE ?auto_259828 ) ( ON ?auto_259829 ?auto_259828 ) ( ON ?auto_259830 ?auto_259829 ) ( ON ?auto_259831 ?auto_259830 ) ( ON ?auto_259832 ?auto_259831 ) ( ON ?auto_259833 ?auto_259832 ) ( ON ?auto_259834 ?auto_259833 ) ( ON ?auto_259835 ?auto_259834 ) ( ON ?auto_259836 ?auto_259835 ) ( not ( = ?auto_259828 ?auto_259829 ) ) ( not ( = ?auto_259828 ?auto_259830 ) ) ( not ( = ?auto_259828 ?auto_259831 ) ) ( not ( = ?auto_259828 ?auto_259832 ) ) ( not ( = ?auto_259828 ?auto_259833 ) ) ( not ( = ?auto_259828 ?auto_259834 ) ) ( not ( = ?auto_259828 ?auto_259835 ) ) ( not ( = ?auto_259828 ?auto_259836 ) ) ( not ( = ?auto_259828 ?auto_259837 ) ) ( not ( = ?auto_259828 ?auto_259838 ) ) ( not ( = ?auto_259828 ?auto_259839 ) ) ( not ( = ?auto_259828 ?auto_259840 ) ) ( not ( = ?auto_259829 ?auto_259830 ) ) ( not ( = ?auto_259829 ?auto_259831 ) ) ( not ( = ?auto_259829 ?auto_259832 ) ) ( not ( = ?auto_259829 ?auto_259833 ) ) ( not ( = ?auto_259829 ?auto_259834 ) ) ( not ( = ?auto_259829 ?auto_259835 ) ) ( not ( = ?auto_259829 ?auto_259836 ) ) ( not ( = ?auto_259829 ?auto_259837 ) ) ( not ( = ?auto_259829 ?auto_259838 ) ) ( not ( = ?auto_259829 ?auto_259839 ) ) ( not ( = ?auto_259829 ?auto_259840 ) ) ( not ( = ?auto_259830 ?auto_259831 ) ) ( not ( = ?auto_259830 ?auto_259832 ) ) ( not ( = ?auto_259830 ?auto_259833 ) ) ( not ( = ?auto_259830 ?auto_259834 ) ) ( not ( = ?auto_259830 ?auto_259835 ) ) ( not ( = ?auto_259830 ?auto_259836 ) ) ( not ( = ?auto_259830 ?auto_259837 ) ) ( not ( = ?auto_259830 ?auto_259838 ) ) ( not ( = ?auto_259830 ?auto_259839 ) ) ( not ( = ?auto_259830 ?auto_259840 ) ) ( not ( = ?auto_259831 ?auto_259832 ) ) ( not ( = ?auto_259831 ?auto_259833 ) ) ( not ( = ?auto_259831 ?auto_259834 ) ) ( not ( = ?auto_259831 ?auto_259835 ) ) ( not ( = ?auto_259831 ?auto_259836 ) ) ( not ( = ?auto_259831 ?auto_259837 ) ) ( not ( = ?auto_259831 ?auto_259838 ) ) ( not ( = ?auto_259831 ?auto_259839 ) ) ( not ( = ?auto_259831 ?auto_259840 ) ) ( not ( = ?auto_259832 ?auto_259833 ) ) ( not ( = ?auto_259832 ?auto_259834 ) ) ( not ( = ?auto_259832 ?auto_259835 ) ) ( not ( = ?auto_259832 ?auto_259836 ) ) ( not ( = ?auto_259832 ?auto_259837 ) ) ( not ( = ?auto_259832 ?auto_259838 ) ) ( not ( = ?auto_259832 ?auto_259839 ) ) ( not ( = ?auto_259832 ?auto_259840 ) ) ( not ( = ?auto_259833 ?auto_259834 ) ) ( not ( = ?auto_259833 ?auto_259835 ) ) ( not ( = ?auto_259833 ?auto_259836 ) ) ( not ( = ?auto_259833 ?auto_259837 ) ) ( not ( = ?auto_259833 ?auto_259838 ) ) ( not ( = ?auto_259833 ?auto_259839 ) ) ( not ( = ?auto_259833 ?auto_259840 ) ) ( not ( = ?auto_259834 ?auto_259835 ) ) ( not ( = ?auto_259834 ?auto_259836 ) ) ( not ( = ?auto_259834 ?auto_259837 ) ) ( not ( = ?auto_259834 ?auto_259838 ) ) ( not ( = ?auto_259834 ?auto_259839 ) ) ( not ( = ?auto_259834 ?auto_259840 ) ) ( not ( = ?auto_259835 ?auto_259836 ) ) ( not ( = ?auto_259835 ?auto_259837 ) ) ( not ( = ?auto_259835 ?auto_259838 ) ) ( not ( = ?auto_259835 ?auto_259839 ) ) ( not ( = ?auto_259835 ?auto_259840 ) ) ( not ( = ?auto_259836 ?auto_259837 ) ) ( not ( = ?auto_259836 ?auto_259838 ) ) ( not ( = ?auto_259836 ?auto_259839 ) ) ( not ( = ?auto_259836 ?auto_259840 ) ) ( not ( = ?auto_259837 ?auto_259838 ) ) ( not ( = ?auto_259837 ?auto_259839 ) ) ( not ( = ?auto_259837 ?auto_259840 ) ) ( not ( = ?auto_259838 ?auto_259839 ) ) ( not ( = ?auto_259838 ?auto_259840 ) ) ( not ( = ?auto_259839 ?auto_259840 ) ) ( ON ?auto_259838 ?auto_259839 ) ( CLEAR ?auto_259836 ) ( ON ?auto_259837 ?auto_259838 ) ( CLEAR ?auto_259837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_259828 ?auto_259829 ?auto_259830 ?auto_259831 ?auto_259832 ?auto_259833 ?auto_259834 ?auto_259835 ?auto_259836 ?auto_259837 )
      ( MAKE-12PILE ?auto_259828 ?auto_259829 ?auto_259830 ?auto_259831 ?auto_259832 ?auto_259833 ?auto_259834 ?auto_259835 ?auto_259836 ?auto_259837 ?auto_259838 ?auto_259839 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_259853 - BLOCK
      ?auto_259854 - BLOCK
      ?auto_259855 - BLOCK
      ?auto_259856 - BLOCK
      ?auto_259857 - BLOCK
      ?auto_259858 - BLOCK
      ?auto_259859 - BLOCK
      ?auto_259860 - BLOCK
      ?auto_259861 - BLOCK
      ?auto_259862 - BLOCK
      ?auto_259863 - BLOCK
      ?auto_259864 - BLOCK
    )
    :vars
    (
      ?auto_259865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259864 ?auto_259865 ) ( ON-TABLE ?auto_259853 ) ( ON ?auto_259854 ?auto_259853 ) ( ON ?auto_259855 ?auto_259854 ) ( ON ?auto_259856 ?auto_259855 ) ( ON ?auto_259857 ?auto_259856 ) ( ON ?auto_259858 ?auto_259857 ) ( ON ?auto_259859 ?auto_259858 ) ( ON ?auto_259860 ?auto_259859 ) ( ON ?auto_259861 ?auto_259860 ) ( not ( = ?auto_259853 ?auto_259854 ) ) ( not ( = ?auto_259853 ?auto_259855 ) ) ( not ( = ?auto_259853 ?auto_259856 ) ) ( not ( = ?auto_259853 ?auto_259857 ) ) ( not ( = ?auto_259853 ?auto_259858 ) ) ( not ( = ?auto_259853 ?auto_259859 ) ) ( not ( = ?auto_259853 ?auto_259860 ) ) ( not ( = ?auto_259853 ?auto_259861 ) ) ( not ( = ?auto_259853 ?auto_259862 ) ) ( not ( = ?auto_259853 ?auto_259863 ) ) ( not ( = ?auto_259853 ?auto_259864 ) ) ( not ( = ?auto_259853 ?auto_259865 ) ) ( not ( = ?auto_259854 ?auto_259855 ) ) ( not ( = ?auto_259854 ?auto_259856 ) ) ( not ( = ?auto_259854 ?auto_259857 ) ) ( not ( = ?auto_259854 ?auto_259858 ) ) ( not ( = ?auto_259854 ?auto_259859 ) ) ( not ( = ?auto_259854 ?auto_259860 ) ) ( not ( = ?auto_259854 ?auto_259861 ) ) ( not ( = ?auto_259854 ?auto_259862 ) ) ( not ( = ?auto_259854 ?auto_259863 ) ) ( not ( = ?auto_259854 ?auto_259864 ) ) ( not ( = ?auto_259854 ?auto_259865 ) ) ( not ( = ?auto_259855 ?auto_259856 ) ) ( not ( = ?auto_259855 ?auto_259857 ) ) ( not ( = ?auto_259855 ?auto_259858 ) ) ( not ( = ?auto_259855 ?auto_259859 ) ) ( not ( = ?auto_259855 ?auto_259860 ) ) ( not ( = ?auto_259855 ?auto_259861 ) ) ( not ( = ?auto_259855 ?auto_259862 ) ) ( not ( = ?auto_259855 ?auto_259863 ) ) ( not ( = ?auto_259855 ?auto_259864 ) ) ( not ( = ?auto_259855 ?auto_259865 ) ) ( not ( = ?auto_259856 ?auto_259857 ) ) ( not ( = ?auto_259856 ?auto_259858 ) ) ( not ( = ?auto_259856 ?auto_259859 ) ) ( not ( = ?auto_259856 ?auto_259860 ) ) ( not ( = ?auto_259856 ?auto_259861 ) ) ( not ( = ?auto_259856 ?auto_259862 ) ) ( not ( = ?auto_259856 ?auto_259863 ) ) ( not ( = ?auto_259856 ?auto_259864 ) ) ( not ( = ?auto_259856 ?auto_259865 ) ) ( not ( = ?auto_259857 ?auto_259858 ) ) ( not ( = ?auto_259857 ?auto_259859 ) ) ( not ( = ?auto_259857 ?auto_259860 ) ) ( not ( = ?auto_259857 ?auto_259861 ) ) ( not ( = ?auto_259857 ?auto_259862 ) ) ( not ( = ?auto_259857 ?auto_259863 ) ) ( not ( = ?auto_259857 ?auto_259864 ) ) ( not ( = ?auto_259857 ?auto_259865 ) ) ( not ( = ?auto_259858 ?auto_259859 ) ) ( not ( = ?auto_259858 ?auto_259860 ) ) ( not ( = ?auto_259858 ?auto_259861 ) ) ( not ( = ?auto_259858 ?auto_259862 ) ) ( not ( = ?auto_259858 ?auto_259863 ) ) ( not ( = ?auto_259858 ?auto_259864 ) ) ( not ( = ?auto_259858 ?auto_259865 ) ) ( not ( = ?auto_259859 ?auto_259860 ) ) ( not ( = ?auto_259859 ?auto_259861 ) ) ( not ( = ?auto_259859 ?auto_259862 ) ) ( not ( = ?auto_259859 ?auto_259863 ) ) ( not ( = ?auto_259859 ?auto_259864 ) ) ( not ( = ?auto_259859 ?auto_259865 ) ) ( not ( = ?auto_259860 ?auto_259861 ) ) ( not ( = ?auto_259860 ?auto_259862 ) ) ( not ( = ?auto_259860 ?auto_259863 ) ) ( not ( = ?auto_259860 ?auto_259864 ) ) ( not ( = ?auto_259860 ?auto_259865 ) ) ( not ( = ?auto_259861 ?auto_259862 ) ) ( not ( = ?auto_259861 ?auto_259863 ) ) ( not ( = ?auto_259861 ?auto_259864 ) ) ( not ( = ?auto_259861 ?auto_259865 ) ) ( not ( = ?auto_259862 ?auto_259863 ) ) ( not ( = ?auto_259862 ?auto_259864 ) ) ( not ( = ?auto_259862 ?auto_259865 ) ) ( not ( = ?auto_259863 ?auto_259864 ) ) ( not ( = ?auto_259863 ?auto_259865 ) ) ( not ( = ?auto_259864 ?auto_259865 ) ) ( ON ?auto_259863 ?auto_259864 ) ( CLEAR ?auto_259861 ) ( ON ?auto_259862 ?auto_259863 ) ( CLEAR ?auto_259862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_259853 ?auto_259854 ?auto_259855 ?auto_259856 ?auto_259857 ?auto_259858 ?auto_259859 ?auto_259860 ?auto_259861 ?auto_259862 )
      ( MAKE-12PILE ?auto_259853 ?auto_259854 ?auto_259855 ?auto_259856 ?auto_259857 ?auto_259858 ?auto_259859 ?auto_259860 ?auto_259861 ?auto_259862 ?auto_259863 ?auto_259864 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_259878 - BLOCK
      ?auto_259879 - BLOCK
      ?auto_259880 - BLOCK
      ?auto_259881 - BLOCK
      ?auto_259882 - BLOCK
      ?auto_259883 - BLOCK
      ?auto_259884 - BLOCK
      ?auto_259885 - BLOCK
      ?auto_259886 - BLOCK
      ?auto_259887 - BLOCK
      ?auto_259888 - BLOCK
      ?auto_259889 - BLOCK
    )
    :vars
    (
      ?auto_259890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259889 ?auto_259890 ) ( ON-TABLE ?auto_259878 ) ( ON ?auto_259879 ?auto_259878 ) ( ON ?auto_259880 ?auto_259879 ) ( ON ?auto_259881 ?auto_259880 ) ( ON ?auto_259882 ?auto_259881 ) ( ON ?auto_259883 ?auto_259882 ) ( ON ?auto_259884 ?auto_259883 ) ( ON ?auto_259885 ?auto_259884 ) ( not ( = ?auto_259878 ?auto_259879 ) ) ( not ( = ?auto_259878 ?auto_259880 ) ) ( not ( = ?auto_259878 ?auto_259881 ) ) ( not ( = ?auto_259878 ?auto_259882 ) ) ( not ( = ?auto_259878 ?auto_259883 ) ) ( not ( = ?auto_259878 ?auto_259884 ) ) ( not ( = ?auto_259878 ?auto_259885 ) ) ( not ( = ?auto_259878 ?auto_259886 ) ) ( not ( = ?auto_259878 ?auto_259887 ) ) ( not ( = ?auto_259878 ?auto_259888 ) ) ( not ( = ?auto_259878 ?auto_259889 ) ) ( not ( = ?auto_259878 ?auto_259890 ) ) ( not ( = ?auto_259879 ?auto_259880 ) ) ( not ( = ?auto_259879 ?auto_259881 ) ) ( not ( = ?auto_259879 ?auto_259882 ) ) ( not ( = ?auto_259879 ?auto_259883 ) ) ( not ( = ?auto_259879 ?auto_259884 ) ) ( not ( = ?auto_259879 ?auto_259885 ) ) ( not ( = ?auto_259879 ?auto_259886 ) ) ( not ( = ?auto_259879 ?auto_259887 ) ) ( not ( = ?auto_259879 ?auto_259888 ) ) ( not ( = ?auto_259879 ?auto_259889 ) ) ( not ( = ?auto_259879 ?auto_259890 ) ) ( not ( = ?auto_259880 ?auto_259881 ) ) ( not ( = ?auto_259880 ?auto_259882 ) ) ( not ( = ?auto_259880 ?auto_259883 ) ) ( not ( = ?auto_259880 ?auto_259884 ) ) ( not ( = ?auto_259880 ?auto_259885 ) ) ( not ( = ?auto_259880 ?auto_259886 ) ) ( not ( = ?auto_259880 ?auto_259887 ) ) ( not ( = ?auto_259880 ?auto_259888 ) ) ( not ( = ?auto_259880 ?auto_259889 ) ) ( not ( = ?auto_259880 ?auto_259890 ) ) ( not ( = ?auto_259881 ?auto_259882 ) ) ( not ( = ?auto_259881 ?auto_259883 ) ) ( not ( = ?auto_259881 ?auto_259884 ) ) ( not ( = ?auto_259881 ?auto_259885 ) ) ( not ( = ?auto_259881 ?auto_259886 ) ) ( not ( = ?auto_259881 ?auto_259887 ) ) ( not ( = ?auto_259881 ?auto_259888 ) ) ( not ( = ?auto_259881 ?auto_259889 ) ) ( not ( = ?auto_259881 ?auto_259890 ) ) ( not ( = ?auto_259882 ?auto_259883 ) ) ( not ( = ?auto_259882 ?auto_259884 ) ) ( not ( = ?auto_259882 ?auto_259885 ) ) ( not ( = ?auto_259882 ?auto_259886 ) ) ( not ( = ?auto_259882 ?auto_259887 ) ) ( not ( = ?auto_259882 ?auto_259888 ) ) ( not ( = ?auto_259882 ?auto_259889 ) ) ( not ( = ?auto_259882 ?auto_259890 ) ) ( not ( = ?auto_259883 ?auto_259884 ) ) ( not ( = ?auto_259883 ?auto_259885 ) ) ( not ( = ?auto_259883 ?auto_259886 ) ) ( not ( = ?auto_259883 ?auto_259887 ) ) ( not ( = ?auto_259883 ?auto_259888 ) ) ( not ( = ?auto_259883 ?auto_259889 ) ) ( not ( = ?auto_259883 ?auto_259890 ) ) ( not ( = ?auto_259884 ?auto_259885 ) ) ( not ( = ?auto_259884 ?auto_259886 ) ) ( not ( = ?auto_259884 ?auto_259887 ) ) ( not ( = ?auto_259884 ?auto_259888 ) ) ( not ( = ?auto_259884 ?auto_259889 ) ) ( not ( = ?auto_259884 ?auto_259890 ) ) ( not ( = ?auto_259885 ?auto_259886 ) ) ( not ( = ?auto_259885 ?auto_259887 ) ) ( not ( = ?auto_259885 ?auto_259888 ) ) ( not ( = ?auto_259885 ?auto_259889 ) ) ( not ( = ?auto_259885 ?auto_259890 ) ) ( not ( = ?auto_259886 ?auto_259887 ) ) ( not ( = ?auto_259886 ?auto_259888 ) ) ( not ( = ?auto_259886 ?auto_259889 ) ) ( not ( = ?auto_259886 ?auto_259890 ) ) ( not ( = ?auto_259887 ?auto_259888 ) ) ( not ( = ?auto_259887 ?auto_259889 ) ) ( not ( = ?auto_259887 ?auto_259890 ) ) ( not ( = ?auto_259888 ?auto_259889 ) ) ( not ( = ?auto_259888 ?auto_259890 ) ) ( not ( = ?auto_259889 ?auto_259890 ) ) ( ON ?auto_259888 ?auto_259889 ) ( ON ?auto_259887 ?auto_259888 ) ( CLEAR ?auto_259885 ) ( ON ?auto_259886 ?auto_259887 ) ( CLEAR ?auto_259886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_259878 ?auto_259879 ?auto_259880 ?auto_259881 ?auto_259882 ?auto_259883 ?auto_259884 ?auto_259885 ?auto_259886 )
      ( MAKE-12PILE ?auto_259878 ?auto_259879 ?auto_259880 ?auto_259881 ?auto_259882 ?auto_259883 ?auto_259884 ?auto_259885 ?auto_259886 ?auto_259887 ?auto_259888 ?auto_259889 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_259903 - BLOCK
      ?auto_259904 - BLOCK
      ?auto_259905 - BLOCK
      ?auto_259906 - BLOCK
      ?auto_259907 - BLOCK
      ?auto_259908 - BLOCK
      ?auto_259909 - BLOCK
      ?auto_259910 - BLOCK
      ?auto_259911 - BLOCK
      ?auto_259912 - BLOCK
      ?auto_259913 - BLOCK
      ?auto_259914 - BLOCK
    )
    :vars
    (
      ?auto_259915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259914 ?auto_259915 ) ( ON-TABLE ?auto_259903 ) ( ON ?auto_259904 ?auto_259903 ) ( ON ?auto_259905 ?auto_259904 ) ( ON ?auto_259906 ?auto_259905 ) ( ON ?auto_259907 ?auto_259906 ) ( ON ?auto_259908 ?auto_259907 ) ( ON ?auto_259909 ?auto_259908 ) ( ON ?auto_259910 ?auto_259909 ) ( not ( = ?auto_259903 ?auto_259904 ) ) ( not ( = ?auto_259903 ?auto_259905 ) ) ( not ( = ?auto_259903 ?auto_259906 ) ) ( not ( = ?auto_259903 ?auto_259907 ) ) ( not ( = ?auto_259903 ?auto_259908 ) ) ( not ( = ?auto_259903 ?auto_259909 ) ) ( not ( = ?auto_259903 ?auto_259910 ) ) ( not ( = ?auto_259903 ?auto_259911 ) ) ( not ( = ?auto_259903 ?auto_259912 ) ) ( not ( = ?auto_259903 ?auto_259913 ) ) ( not ( = ?auto_259903 ?auto_259914 ) ) ( not ( = ?auto_259903 ?auto_259915 ) ) ( not ( = ?auto_259904 ?auto_259905 ) ) ( not ( = ?auto_259904 ?auto_259906 ) ) ( not ( = ?auto_259904 ?auto_259907 ) ) ( not ( = ?auto_259904 ?auto_259908 ) ) ( not ( = ?auto_259904 ?auto_259909 ) ) ( not ( = ?auto_259904 ?auto_259910 ) ) ( not ( = ?auto_259904 ?auto_259911 ) ) ( not ( = ?auto_259904 ?auto_259912 ) ) ( not ( = ?auto_259904 ?auto_259913 ) ) ( not ( = ?auto_259904 ?auto_259914 ) ) ( not ( = ?auto_259904 ?auto_259915 ) ) ( not ( = ?auto_259905 ?auto_259906 ) ) ( not ( = ?auto_259905 ?auto_259907 ) ) ( not ( = ?auto_259905 ?auto_259908 ) ) ( not ( = ?auto_259905 ?auto_259909 ) ) ( not ( = ?auto_259905 ?auto_259910 ) ) ( not ( = ?auto_259905 ?auto_259911 ) ) ( not ( = ?auto_259905 ?auto_259912 ) ) ( not ( = ?auto_259905 ?auto_259913 ) ) ( not ( = ?auto_259905 ?auto_259914 ) ) ( not ( = ?auto_259905 ?auto_259915 ) ) ( not ( = ?auto_259906 ?auto_259907 ) ) ( not ( = ?auto_259906 ?auto_259908 ) ) ( not ( = ?auto_259906 ?auto_259909 ) ) ( not ( = ?auto_259906 ?auto_259910 ) ) ( not ( = ?auto_259906 ?auto_259911 ) ) ( not ( = ?auto_259906 ?auto_259912 ) ) ( not ( = ?auto_259906 ?auto_259913 ) ) ( not ( = ?auto_259906 ?auto_259914 ) ) ( not ( = ?auto_259906 ?auto_259915 ) ) ( not ( = ?auto_259907 ?auto_259908 ) ) ( not ( = ?auto_259907 ?auto_259909 ) ) ( not ( = ?auto_259907 ?auto_259910 ) ) ( not ( = ?auto_259907 ?auto_259911 ) ) ( not ( = ?auto_259907 ?auto_259912 ) ) ( not ( = ?auto_259907 ?auto_259913 ) ) ( not ( = ?auto_259907 ?auto_259914 ) ) ( not ( = ?auto_259907 ?auto_259915 ) ) ( not ( = ?auto_259908 ?auto_259909 ) ) ( not ( = ?auto_259908 ?auto_259910 ) ) ( not ( = ?auto_259908 ?auto_259911 ) ) ( not ( = ?auto_259908 ?auto_259912 ) ) ( not ( = ?auto_259908 ?auto_259913 ) ) ( not ( = ?auto_259908 ?auto_259914 ) ) ( not ( = ?auto_259908 ?auto_259915 ) ) ( not ( = ?auto_259909 ?auto_259910 ) ) ( not ( = ?auto_259909 ?auto_259911 ) ) ( not ( = ?auto_259909 ?auto_259912 ) ) ( not ( = ?auto_259909 ?auto_259913 ) ) ( not ( = ?auto_259909 ?auto_259914 ) ) ( not ( = ?auto_259909 ?auto_259915 ) ) ( not ( = ?auto_259910 ?auto_259911 ) ) ( not ( = ?auto_259910 ?auto_259912 ) ) ( not ( = ?auto_259910 ?auto_259913 ) ) ( not ( = ?auto_259910 ?auto_259914 ) ) ( not ( = ?auto_259910 ?auto_259915 ) ) ( not ( = ?auto_259911 ?auto_259912 ) ) ( not ( = ?auto_259911 ?auto_259913 ) ) ( not ( = ?auto_259911 ?auto_259914 ) ) ( not ( = ?auto_259911 ?auto_259915 ) ) ( not ( = ?auto_259912 ?auto_259913 ) ) ( not ( = ?auto_259912 ?auto_259914 ) ) ( not ( = ?auto_259912 ?auto_259915 ) ) ( not ( = ?auto_259913 ?auto_259914 ) ) ( not ( = ?auto_259913 ?auto_259915 ) ) ( not ( = ?auto_259914 ?auto_259915 ) ) ( ON ?auto_259913 ?auto_259914 ) ( ON ?auto_259912 ?auto_259913 ) ( CLEAR ?auto_259910 ) ( ON ?auto_259911 ?auto_259912 ) ( CLEAR ?auto_259911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_259903 ?auto_259904 ?auto_259905 ?auto_259906 ?auto_259907 ?auto_259908 ?auto_259909 ?auto_259910 ?auto_259911 )
      ( MAKE-12PILE ?auto_259903 ?auto_259904 ?auto_259905 ?auto_259906 ?auto_259907 ?auto_259908 ?auto_259909 ?auto_259910 ?auto_259911 ?auto_259912 ?auto_259913 ?auto_259914 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_259928 - BLOCK
      ?auto_259929 - BLOCK
      ?auto_259930 - BLOCK
      ?auto_259931 - BLOCK
      ?auto_259932 - BLOCK
      ?auto_259933 - BLOCK
      ?auto_259934 - BLOCK
      ?auto_259935 - BLOCK
      ?auto_259936 - BLOCK
      ?auto_259937 - BLOCK
      ?auto_259938 - BLOCK
      ?auto_259939 - BLOCK
    )
    :vars
    (
      ?auto_259940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259939 ?auto_259940 ) ( ON-TABLE ?auto_259928 ) ( ON ?auto_259929 ?auto_259928 ) ( ON ?auto_259930 ?auto_259929 ) ( ON ?auto_259931 ?auto_259930 ) ( ON ?auto_259932 ?auto_259931 ) ( ON ?auto_259933 ?auto_259932 ) ( ON ?auto_259934 ?auto_259933 ) ( not ( = ?auto_259928 ?auto_259929 ) ) ( not ( = ?auto_259928 ?auto_259930 ) ) ( not ( = ?auto_259928 ?auto_259931 ) ) ( not ( = ?auto_259928 ?auto_259932 ) ) ( not ( = ?auto_259928 ?auto_259933 ) ) ( not ( = ?auto_259928 ?auto_259934 ) ) ( not ( = ?auto_259928 ?auto_259935 ) ) ( not ( = ?auto_259928 ?auto_259936 ) ) ( not ( = ?auto_259928 ?auto_259937 ) ) ( not ( = ?auto_259928 ?auto_259938 ) ) ( not ( = ?auto_259928 ?auto_259939 ) ) ( not ( = ?auto_259928 ?auto_259940 ) ) ( not ( = ?auto_259929 ?auto_259930 ) ) ( not ( = ?auto_259929 ?auto_259931 ) ) ( not ( = ?auto_259929 ?auto_259932 ) ) ( not ( = ?auto_259929 ?auto_259933 ) ) ( not ( = ?auto_259929 ?auto_259934 ) ) ( not ( = ?auto_259929 ?auto_259935 ) ) ( not ( = ?auto_259929 ?auto_259936 ) ) ( not ( = ?auto_259929 ?auto_259937 ) ) ( not ( = ?auto_259929 ?auto_259938 ) ) ( not ( = ?auto_259929 ?auto_259939 ) ) ( not ( = ?auto_259929 ?auto_259940 ) ) ( not ( = ?auto_259930 ?auto_259931 ) ) ( not ( = ?auto_259930 ?auto_259932 ) ) ( not ( = ?auto_259930 ?auto_259933 ) ) ( not ( = ?auto_259930 ?auto_259934 ) ) ( not ( = ?auto_259930 ?auto_259935 ) ) ( not ( = ?auto_259930 ?auto_259936 ) ) ( not ( = ?auto_259930 ?auto_259937 ) ) ( not ( = ?auto_259930 ?auto_259938 ) ) ( not ( = ?auto_259930 ?auto_259939 ) ) ( not ( = ?auto_259930 ?auto_259940 ) ) ( not ( = ?auto_259931 ?auto_259932 ) ) ( not ( = ?auto_259931 ?auto_259933 ) ) ( not ( = ?auto_259931 ?auto_259934 ) ) ( not ( = ?auto_259931 ?auto_259935 ) ) ( not ( = ?auto_259931 ?auto_259936 ) ) ( not ( = ?auto_259931 ?auto_259937 ) ) ( not ( = ?auto_259931 ?auto_259938 ) ) ( not ( = ?auto_259931 ?auto_259939 ) ) ( not ( = ?auto_259931 ?auto_259940 ) ) ( not ( = ?auto_259932 ?auto_259933 ) ) ( not ( = ?auto_259932 ?auto_259934 ) ) ( not ( = ?auto_259932 ?auto_259935 ) ) ( not ( = ?auto_259932 ?auto_259936 ) ) ( not ( = ?auto_259932 ?auto_259937 ) ) ( not ( = ?auto_259932 ?auto_259938 ) ) ( not ( = ?auto_259932 ?auto_259939 ) ) ( not ( = ?auto_259932 ?auto_259940 ) ) ( not ( = ?auto_259933 ?auto_259934 ) ) ( not ( = ?auto_259933 ?auto_259935 ) ) ( not ( = ?auto_259933 ?auto_259936 ) ) ( not ( = ?auto_259933 ?auto_259937 ) ) ( not ( = ?auto_259933 ?auto_259938 ) ) ( not ( = ?auto_259933 ?auto_259939 ) ) ( not ( = ?auto_259933 ?auto_259940 ) ) ( not ( = ?auto_259934 ?auto_259935 ) ) ( not ( = ?auto_259934 ?auto_259936 ) ) ( not ( = ?auto_259934 ?auto_259937 ) ) ( not ( = ?auto_259934 ?auto_259938 ) ) ( not ( = ?auto_259934 ?auto_259939 ) ) ( not ( = ?auto_259934 ?auto_259940 ) ) ( not ( = ?auto_259935 ?auto_259936 ) ) ( not ( = ?auto_259935 ?auto_259937 ) ) ( not ( = ?auto_259935 ?auto_259938 ) ) ( not ( = ?auto_259935 ?auto_259939 ) ) ( not ( = ?auto_259935 ?auto_259940 ) ) ( not ( = ?auto_259936 ?auto_259937 ) ) ( not ( = ?auto_259936 ?auto_259938 ) ) ( not ( = ?auto_259936 ?auto_259939 ) ) ( not ( = ?auto_259936 ?auto_259940 ) ) ( not ( = ?auto_259937 ?auto_259938 ) ) ( not ( = ?auto_259937 ?auto_259939 ) ) ( not ( = ?auto_259937 ?auto_259940 ) ) ( not ( = ?auto_259938 ?auto_259939 ) ) ( not ( = ?auto_259938 ?auto_259940 ) ) ( not ( = ?auto_259939 ?auto_259940 ) ) ( ON ?auto_259938 ?auto_259939 ) ( ON ?auto_259937 ?auto_259938 ) ( ON ?auto_259936 ?auto_259937 ) ( CLEAR ?auto_259934 ) ( ON ?auto_259935 ?auto_259936 ) ( CLEAR ?auto_259935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_259928 ?auto_259929 ?auto_259930 ?auto_259931 ?auto_259932 ?auto_259933 ?auto_259934 ?auto_259935 )
      ( MAKE-12PILE ?auto_259928 ?auto_259929 ?auto_259930 ?auto_259931 ?auto_259932 ?auto_259933 ?auto_259934 ?auto_259935 ?auto_259936 ?auto_259937 ?auto_259938 ?auto_259939 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_259953 - BLOCK
      ?auto_259954 - BLOCK
      ?auto_259955 - BLOCK
      ?auto_259956 - BLOCK
      ?auto_259957 - BLOCK
      ?auto_259958 - BLOCK
      ?auto_259959 - BLOCK
      ?auto_259960 - BLOCK
      ?auto_259961 - BLOCK
      ?auto_259962 - BLOCK
      ?auto_259963 - BLOCK
      ?auto_259964 - BLOCK
    )
    :vars
    (
      ?auto_259965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259964 ?auto_259965 ) ( ON-TABLE ?auto_259953 ) ( ON ?auto_259954 ?auto_259953 ) ( ON ?auto_259955 ?auto_259954 ) ( ON ?auto_259956 ?auto_259955 ) ( ON ?auto_259957 ?auto_259956 ) ( ON ?auto_259958 ?auto_259957 ) ( ON ?auto_259959 ?auto_259958 ) ( not ( = ?auto_259953 ?auto_259954 ) ) ( not ( = ?auto_259953 ?auto_259955 ) ) ( not ( = ?auto_259953 ?auto_259956 ) ) ( not ( = ?auto_259953 ?auto_259957 ) ) ( not ( = ?auto_259953 ?auto_259958 ) ) ( not ( = ?auto_259953 ?auto_259959 ) ) ( not ( = ?auto_259953 ?auto_259960 ) ) ( not ( = ?auto_259953 ?auto_259961 ) ) ( not ( = ?auto_259953 ?auto_259962 ) ) ( not ( = ?auto_259953 ?auto_259963 ) ) ( not ( = ?auto_259953 ?auto_259964 ) ) ( not ( = ?auto_259953 ?auto_259965 ) ) ( not ( = ?auto_259954 ?auto_259955 ) ) ( not ( = ?auto_259954 ?auto_259956 ) ) ( not ( = ?auto_259954 ?auto_259957 ) ) ( not ( = ?auto_259954 ?auto_259958 ) ) ( not ( = ?auto_259954 ?auto_259959 ) ) ( not ( = ?auto_259954 ?auto_259960 ) ) ( not ( = ?auto_259954 ?auto_259961 ) ) ( not ( = ?auto_259954 ?auto_259962 ) ) ( not ( = ?auto_259954 ?auto_259963 ) ) ( not ( = ?auto_259954 ?auto_259964 ) ) ( not ( = ?auto_259954 ?auto_259965 ) ) ( not ( = ?auto_259955 ?auto_259956 ) ) ( not ( = ?auto_259955 ?auto_259957 ) ) ( not ( = ?auto_259955 ?auto_259958 ) ) ( not ( = ?auto_259955 ?auto_259959 ) ) ( not ( = ?auto_259955 ?auto_259960 ) ) ( not ( = ?auto_259955 ?auto_259961 ) ) ( not ( = ?auto_259955 ?auto_259962 ) ) ( not ( = ?auto_259955 ?auto_259963 ) ) ( not ( = ?auto_259955 ?auto_259964 ) ) ( not ( = ?auto_259955 ?auto_259965 ) ) ( not ( = ?auto_259956 ?auto_259957 ) ) ( not ( = ?auto_259956 ?auto_259958 ) ) ( not ( = ?auto_259956 ?auto_259959 ) ) ( not ( = ?auto_259956 ?auto_259960 ) ) ( not ( = ?auto_259956 ?auto_259961 ) ) ( not ( = ?auto_259956 ?auto_259962 ) ) ( not ( = ?auto_259956 ?auto_259963 ) ) ( not ( = ?auto_259956 ?auto_259964 ) ) ( not ( = ?auto_259956 ?auto_259965 ) ) ( not ( = ?auto_259957 ?auto_259958 ) ) ( not ( = ?auto_259957 ?auto_259959 ) ) ( not ( = ?auto_259957 ?auto_259960 ) ) ( not ( = ?auto_259957 ?auto_259961 ) ) ( not ( = ?auto_259957 ?auto_259962 ) ) ( not ( = ?auto_259957 ?auto_259963 ) ) ( not ( = ?auto_259957 ?auto_259964 ) ) ( not ( = ?auto_259957 ?auto_259965 ) ) ( not ( = ?auto_259958 ?auto_259959 ) ) ( not ( = ?auto_259958 ?auto_259960 ) ) ( not ( = ?auto_259958 ?auto_259961 ) ) ( not ( = ?auto_259958 ?auto_259962 ) ) ( not ( = ?auto_259958 ?auto_259963 ) ) ( not ( = ?auto_259958 ?auto_259964 ) ) ( not ( = ?auto_259958 ?auto_259965 ) ) ( not ( = ?auto_259959 ?auto_259960 ) ) ( not ( = ?auto_259959 ?auto_259961 ) ) ( not ( = ?auto_259959 ?auto_259962 ) ) ( not ( = ?auto_259959 ?auto_259963 ) ) ( not ( = ?auto_259959 ?auto_259964 ) ) ( not ( = ?auto_259959 ?auto_259965 ) ) ( not ( = ?auto_259960 ?auto_259961 ) ) ( not ( = ?auto_259960 ?auto_259962 ) ) ( not ( = ?auto_259960 ?auto_259963 ) ) ( not ( = ?auto_259960 ?auto_259964 ) ) ( not ( = ?auto_259960 ?auto_259965 ) ) ( not ( = ?auto_259961 ?auto_259962 ) ) ( not ( = ?auto_259961 ?auto_259963 ) ) ( not ( = ?auto_259961 ?auto_259964 ) ) ( not ( = ?auto_259961 ?auto_259965 ) ) ( not ( = ?auto_259962 ?auto_259963 ) ) ( not ( = ?auto_259962 ?auto_259964 ) ) ( not ( = ?auto_259962 ?auto_259965 ) ) ( not ( = ?auto_259963 ?auto_259964 ) ) ( not ( = ?auto_259963 ?auto_259965 ) ) ( not ( = ?auto_259964 ?auto_259965 ) ) ( ON ?auto_259963 ?auto_259964 ) ( ON ?auto_259962 ?auto_259963 ) ( ON ?auto_259961 ?auto_259962 ) ( CLEAR ?auto_259959 ) ( ON ?auto_259960 ?auto_259961 ) ( CLEAR ?auto_259960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_259953 ?auto_259954 ?auto_259955 ?auto_259956 ?auto_259957 ?auto_259958 ?auto_259959 ?auto_259960 )
      ( MAKE-12PILE ?auto_259953 ?auto_259954 ?auto_259955 ?auto_259956 ?auto_259957 ?auto_259958 ?auto_259959 ?auto_259960 ?auto_259961 ?auto_259962 ?auto_259963 ?auto_259964 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_259978 - BLOCK
      ?auto_259979 - BLOCK
      ?auto_259980 - BLOCK
      ?auto_259981 - BLOCK
      ?auto_259982 - BLOCK
      ?auto_259983 - BLOCK
      ?auto_259984 - BLOCK
      ?auto_259985 - BLOCK
      ?auto_259986 - BLOCK
      ?auto_259987 - BLOCK
      ?auto_259988 - BLOCK
      ?auto_259989 - BLOCK
    )
    :vars
    (
      ?auto_259990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259989 ?auto_259990 ) ( ON-TABLE ?auto_259978 ) ( ON ?auto_259979 ?auto_259978 ) ( ON ?auto_259980 ?auto_259979 ) ( ON ?auto_259981 ?auto_259980 ) ( ON ?auto_259982 ?auto_259981 ) ( ON ?auto_259983 ?auto_259982 ) ( not ( = ?auto_259978 ?auto_259979 ) ) ( not ( = ?auto_259978 ?auto_259980 ) ) ( not ( = ?auto_259978 ?auto_259981 ) ) ( not ( = ?auto_259978 ?auto_259982 ) ) ( not ( = ?auto_259978 ?auto_259983 ) ) ( not ( = ?auto_259978 ?auto_259984 ) ) ( not ( = ?auto_259978 ?auto_259985 ) ) ( not ( = ?auto_259978 ?auto_259986 ) ) ( not ( = ?auto_259978 ?auto_259987 ) ) ( not ( = ?auto_259978 ?auto_259988 ) ) ( not ( = ?auto_259978 ?auto_259989 ) ) ( not ( = ?auto_259978 ?auto_259990 ) ) ( not ( = ?auto_259979 ?auto_259980 ) ) ( not ( = ?auto_259979 ?auto_259981 ) ) ( not ( = ?auto_259979 ?auto_259982 ) ) ( not ( = ?auto_259979 ?auto_259983 ) ) ( not ( = ?auto_259979 ?auto_259984 ) ) ( not ( = ?auto_259979 ?auto_259985 ) ) ( not ( = ?auto_259979 ?auto_259986 ) ) ( not ( = ?auto_259979 ?auto_259987 ) ) ( not ( = ?auto_259979 ?auto_259988 ) ) ( not ( = ?auto_259979 ?auto_259989 ) ) ( not ( = ?auto_259979 ?auto_259990 ) ) ( not ( = ?auto_259980 ?auto_259981 ) ) ( not ( = ?auto_259980 ?auto_259982 ) ) ( not ( = ?auto_259980 ?auto_259983 ) ) ( not ( = ?auto_259980 ?auto_259984 ) ) ( not ( = ?auto_259980 ?auto_259985 ) ) ( not ( = ?auto_259980 ?auto_259986 ) ) ( not ( = ?auto_259980 ?auto_259987 ) ) ( not ( = ?auto_259980 ?auto_259988 ) ) ( not ( = ?auto_259980 ?auto_259989 ) ) ( not ( = ?auto_259980 ?auto_259990 ) ) ( not ( = ?auto_259981 ?auto_259982 ) ) ( not ( = ?auto_259981 ?auto_259983 ) ) ( not ( = ?auto_259981 ?auto_259984 ) ) ( not ( = ?auto_259981 ?auto_259985 ) ) ( not ( = ?auto_259981 ?auto_259986 ) ) ( not ( = ?auto_259981 ?auto_259987 ) ) ( not ( = ?auto_259981 ?auto_259988 ) ) ( not ( = ?auto_259981 ?auto_259989 ) ) ( not ( = ?auto_259981 ?auto_259990 ) ) ( not ( = ?auto_259982 ?auto_259983 ) ) ( not ( = ?auto_259982 ?auto_259984 ) ) ( not ( = ?auto_259982 ?auto_259985 ) ) ( not ( = ?auto_259982 ?auto_259986 ) ) ( not ( = ?auto_259982 ?auto_259987 ) ) ( not ( = ?auto_259982 ?auto_259988 ) ) ( not ( = ?auto_259982 ?auto_259989 ) ) ( not ( = ?auto_259982 ?auto_259990 ) ) ( not ( = ?auto_259983 ?auto_259984 ) ) ( not ( = ?auto_259983 ?auto_259985 ) ) ( not ( = ?auto_259983 ?auto_259986 ) ) ( not ( = ?auto_259983 ?auto_259987 ) ) ( not ( = ?auto_259983 ?auto_259988 ) ) ( not ( = ?auto_259983 ?auto_259989 ) ) ( not ( = ?auto_259983 ?auto_259990 ) ) ( not ( = ?auto_259984 ?auto_259985 ) ) ( not ( = ?auto_259984 ?auto_259986 ) ) ( not ( = ?auto_259984 ?auto_259987 ) ) ( not ( = ?auto_259984 ?auto_259988 ) ) ( not ( = ?auto_259984 ?auto_259989 ) ) ( not ( = ?auto_259984 ?auto_259990 ) ) ( not ( = ?auto_259985 ?auto_259986 ) ) ( not ( = ?auto_259985 ?auto_259987 ) ) ( not ( = ?auto_259985 ?auto_259988 ) ) ( not ( = ?auto_259985 ?auto_259989 ) ) ( not ( = ?auto_259985 ?auto_259990 ) ) ( not ( = ?auto_259986 ?auto_259987 ) ) ( not ( = ?auto_259986 ?auto_259988 ) ) ( not ( = ?auto_259986 ?auto_259989 ) ) ( not ( = ?auto_259986 ?auto_259990 ) ) ( not ( = ?auto_259987 ?auto_259988 ) ) ( not ( = ?auto_259987 ?auto_259989 ) ) ( not ( = ?auto_259987 ?auto_259990 ) ) ( not ( = ?auto_259988 ?auto_259989 ) ) ( not ( = ?auto_259988 ?auto_259990 ) ) ( not ( = ?auto_259989 ?auto_259990 ) ) ( ON ?auto_259988 ?auto_259989 ) ( ON ?auto_259987 ?auto_259988 ) ( ON ?auto_259986 ?auto_259987 ) ( ON ?auto_259985 ?auto_259986 ) ( CLEAR ?auto_259983 ) ( ON ?auto_259984 ?auto_259985 ) ( CLEAR ?auto_259984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_259978 ?auto_259979 ?auto_259980 ?auto_259981 ?auto_259982 ?auto_259983 ?auto_259984 )
      ( MAKE-12PILE ?auto_259978 ?auto_259979 ?auto_259980 ?auto_259981 ?auto_259982 ?auto_259983 ?auto_259984 ?auto_259985 ?auto_259986 ?auto_259987 ?auto_259988 ?auto_259989 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_260003 - BLOCK
      ?auto_260004 - BLOCK
      ?auto_260005 - BLOCK
      ?auto_260006 - BLOCK
      ?auto_260007 - BLOCK
      ?auto_260008 - BLOCK
      ?auto_260009 - BLOCK
      ?auto_260010 - BLOCK
      ?auto_260011 - BLOCK
      ?auto_260012 - BLOCK
      ?auto_260013 - BLOCK
      ?auto_260014 - BLOCK
    )
    :vars
    (
      ?auto_260015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260014 ?auto_260015 ) ( ON-TABLE ?auto_260003 ) ( ON ?auto_260004 ?auto_260003 ) ( ON ?auto_260005 ?auto_260004 ) ( ON ?auto_260006 ?auto_260005 ) ( ON ?auto_260007 ?auto_260006 ) ( ON ?auto_260008 ?auto_260007 ) ( not ( = ?auto_260003 ?auto_260004 ) ) ( not ( = ?auto_260003 ?auto_260005 ) ) ( not ( = ?auto_260003 ?auto_260006 ) ) ( not ( = ?auto_260003 ?auto_260007 ) ) ( not ( = ?auto_260003 ?auto_260008 ) ) ( not ( = ?auto_260003 ?auto_260009 ) ) ( not ( = ?auto_260003 ?auto_260010 ) ) ( not ( = ?auto_260003 ?auto_260011 ) ) ( not ( = ?auto_260003 ?auto_260012 ) ) ( not ( = ?auto_260003 ?auto_260013 ) ) ( not ( = ?auto_260003 ?auto_260014 ) ) ( not ( = ?auto_260003 ?auto_260015 ) ) ( not ( = ?auto_260004 ?auto_260005 ) ) ( not ( = ?auto_260004 ?auto_260006 ) ) ( not ( = ?auto_260004 ?auto_260007 ) ) ( not ( = ?auto_260004 ?auto_260008 ) ) ( not ( = ?auto_260004 ?auto_260009 ) ) ( not ( = ?auto_260004 ?auto_260010 ) ) ( not ( = ?auto_260004 ?auto_260011 ) ) ( not ( = ?auto_260004 ?auto_260012 ) ) ( not ( = ?auto_260004 ?auto_260013 ) ) ( not ( = ?auto_260004 ?auto_260014 ) ) ( not ( = ?auto_260004 ?auto_260015 ) ) ( not ( = ?auto_260005 ?auto_260006 ) ) ( not ( = ?auto_260005 ?auto_260007 ) ) ( not ( = ?auto_260005 ?auto_260008 ) ) ( not ( = ?auto_260005 ?auto_260009 ) ) ( not ( = ?auto_260005 ?auto_260010 ) ) ( not ( = ?auto_260005 ?auto_260011 ) ) ( not ( = ?auto_260005 ?auto_260012 ) ) ( not ( = ?auto_260005 ?auto_260013 ) ) ( not ( = ?auto_260005 ?auto_260014 ) ) ( not ( = ?auto_260005 ?auto_260015 ) ) ( not ( = ?auto_260006 ?auto_260007 ) ) ( not ( = ?auto_260006 ?auto_260008 ) ) ( not ( = ?auto_260006 ?auto_260009 ) ) ( not ( = ?auto_260006 ?auto_260010 ) ) ( not ( = ?auto_260006 ?auto_260011 ) ) ( not ( = ?auto_260006 ?auto_260012 ) ) ( not ( = ?auto_260006 ?auto_260013 ) ) ( not ( = ?auto_260006 ?auto_260014 ) ) ( not ( = ?auto_260006 ?auto_260015 ) ) ( not ( = ?auto_260007 ?auto_260008 ) ) ( not ( = ?auto_260007 ?auto_260009 ) ) ( not ( = ?auto_260007 ?auto_260010 ) ) ( not ( = ?auto_260007 ?auto_260011 ) ) ( not ( = ?auto_260007 ?auto_260012 ) ) ( not ( = ?auto_260007 ?auto_260013 ) ) ( not ( = ?auto_260007 ?auto_260014 ) ) ( not ( = ?auto_260007 ?auto_260015 ) ) ( not ( = ?auto_260008 ?auto_260009 ) ) ( not ( = ?auto_260008 ?auto_260010 ) ) ( not ( = ?auto_260008 ?auto_260011 ) ) ( not ( = ?auto_260008 ?auto_260012 ) ) ( not ( = ?auto_260008 ?auto_260013 ) ) ( not ( = ?auto_260008 ?auto_260014 ) ) ( not ( = ?auto_260008 ?auto_260015 ) ) ( not ( = ?auto_260009 ?auto_260010 ) ) ( not ( = ?auto_260009 ?auto_260011 ) ) ( not ( = ?auto_260009 ?auto_260012 ) ) ( not ( = ?auto_260009 ?auto_260013 ) ) ( not ( = ?auto_260009 ?auto_260014 ) ) ( not ( = ?auto_260009 ?auto_260015 ) ) ( not ( = ?auto_260010 ?auto_260011 ) ) ( not ( = ?auto_260010 ?auto_260012 ) ) ( not ( = ?auto_260010 ?auto_260013 ) ) ( not ( = ?auto_260010 ?auto_260014 ) ) ( not ( = ?auto_260010 ?auto_260015 ) ) ( not ( = ?auto_260011 ?auto_260012 ) ) ( not ( = ?auto_260011 ?auto_260013 ) ) ( not ( = ?auto_260011 ?auto_260014 ) ) ( not ( = ?auto_260011 ?auto_260015 ) ) ( not ( = ?auto_260012 ?auto_260013 ) ) ( not ( = ?auto_260012 ?auto_260014 ) ) ( not ( = ?auto_260012 ?auto_260015 ) ) ( not ( = ?auto_260013 ?auto_260014 ) ) ( not ( = ?auto_260013 ?auto_260015 ) ) ( not ( = ?auto_260014 ?auto_260015 ) ) ( ON ?auto_260013 ?auto_260014 ) ( ON ?auto_260012 ?auto_260013 ) ( ON ?auto_260011 ?auto_260012 ) ( ON ?auto_260010 ?auto_260011 ) ( CLEAR ?auto_260008 ) ( ON ?auto_260009 ?auto_260010 ) ( CLEAR ?auto_260009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_260003 ?auto_260004 ?auto_260005 ?auto_260006 ?auto_260007 ?auto_260008 ?auto_260009 )
      ( MAKE-12PILE ?auto_260003 ?auto_260004 ?auto_260005 ?auto_260006 ?auto_260007 ?auto_260008 ?auto_260009 ?auto_260010 ?auto_260011 ?auto_260012 ?auto_260013 ?auto_260014 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_260028 - BLOCK
      ?auto_260029 - BLOCK
      ?auto_260030 - BLOCK
      ?auto_260031 - BLOCK
      ?auto_260032 - BLOCK
      ?auto_260033 - BLOCK
      ?auto_260034 - BLOCK
      ?auto_260035 - BLOCK
      ?auto_260036 - BLOCK
      ?auto_260037 - BLOCK
      ?auto_260038 - BLOCK
      ?auto_260039 - BLOCK
    )
    :vars
    (
      ?auto_260040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260039 ?auto_260040 ) ( ON-TABLE ?auto_260028 ) ( ON ?auto_260029 ?auto_260028 ) ( ON ?auto_260030 ?auto_260029 ) ( ON ?auto_260031 ?auto_260030 ) ( ON ?auto_260032 ?auto_260031 ) ( not ( = ?auto_260028 ?auto_260029 ) ) ( not ( = ?auto_260028 ?auto_260030 ) ) ( not ( = ?auto_260028 ?auto_260031 ) ) ( not ( = ?auto_260028 ?auto_260032 ) ) ( not ( = ?auto_260028 ?auto_260033 ) ) ( not ( = ?auto_260028 ?auto_260034 ) ) ( not ( = ?auto_260028 ?auto_260035 ) ) ( not ( = ?auto_260028 ?auto_260036 ) ) ( not ( = ?auto_260028 ?auto_260037 ) ) ( not ( = ?auto_260028 ?auto_260038 ) ) ( not ( = ?auto_260028 ?auto_260039 ) ) ( not ( = ?auto_260028 ?auto_260040 ) ) ( not ( = ?auto_260029 ?auto_260030 ) ) ( not ( = ?auto_260029 ?auto_260031 ) ) ( not ( = ?auto_260029 ?auto_260032 ) ) ( not ( = ?auto_260029 ?auto_260033 ) ) ( not ( = ?auto_260029 ?auto_260034 ) ) ( not ( = ?auto_260029 ?auto_260035 ) ) ( not ( = ?auto_260029 ?auto_260036 ) ) ( not ( = ?auto_260029 ?auto_260037 ) ) ( not ( = ?auto_260029 ?auto_260038 ) ) ( not ( = ?auto_260029 ?auto_260039 ) ) ( not ( = ?auto_260029 ?auto_260040 ) ) ( not ( = ?auto_260030 ?auto_260031 ) ) ( not ( = ?auto_260030 ?auto_260032 ) ) ( not ( = ?auto_260030 ?auto_260033 ) ) ( not ( = ?auto_260030 ?auto_260034 ) ) ( not ( = ?auto_260030 ?auto_260035 ) ) ( not ( = ?auto_260030 ?auto_260036 ) ) ( not ( = ?auto_260030 ?auto_260037 ) ) ( not ( = ?auto_260030 ?auto_260038 ) ) ( not ( = ?auto_260030 ?auto_260039 ) ) ( not ( = ?auto_260030 ?auto_260040 ) ) ( not ( = ?auto_260031 ?auto_260032 ) ) ( not ( = ?auto_260031 ?auto_260033 ) ) ( not ( = ?auto_260031 ?auto_260034 ) ) ( not ( = ?auto_260031 ?auto_260035 ) ) ( not ( = ?auto_260031 ?auto_260036 ) ) ( not ( = ?auto_260031 ?auto_260037 ) ) ( not ( = ?auto_260031 ?auto_260038 ) ) ( not ( = ?auto_260031 ?auto_260039 ) ) ( not ( = ?auto_260031 ?auto_260040 ) ) ( not ( = ?auto_260032 ?auto_260033 ) ) ( not ( = ?auto_260032 ?auto_260034 ) ) ( not ( = ?auto_260032 ?auto_260035 ) ) ( not ( = ?auto_260032 ?auto_260036 ) ) ( not ( = ?auto_260032 ?auto_260037 ) ) ( not ( = ?auto_260032 ?auto_260038 ) ) ( not ( = ?auto_260032 ?auto_260039 ) ) ( not ( = ?auto_260032 ?auto_260040 ) ) ( not ( = ?auto_260033 ?auto_260034 ) ) ( not ( = ?auto_260033 ?auto_260035 ) ) ( not ( = ?auto_260033 ?auto_260036 ) ) ( not ( = ?auto_260033 ?auto_260037 ) ) ( not ( = ?auto_260033 ?auto_260038 ) ) ( not ( = ?auto_260033 ?auto_260039 ) ) ( not ( = ?auto_260033 ?auto_260040 ) ) ( not ( = ?auto_260034 ?auto_260035 ) ) ( not ( = ?auto_260034 ?auto_260036 ) ) ( not ( = ?auto_260034 ?auto_260037 ) ) ( not ( = ?auto_260034 ?auto_260038 ) ) ( not ( = ?auto_260034 ?auto_260039 ) ) ( not ( = ?auto_260034 ?auto_260040 ) ) ( not ( = ?auto_260035 ?auto_260036 ) ) ( not ( = ?auto_260035 ?auto_260037 ) ) ( not ( = ?auto_260035 ?auto_260038 ) ) ( not ( = ?auto_260035 ?auto_260039 ) ) ( not ( = ?auto_260035 ?auto_260040 ) ) ( not ( = ?auto_260036 ?auto_260037 ) ) ( not ( = ?auto_260036 ?auto_260038 ) ) ( not ( = ?auto_260036 ?auto_260039 ) ) ( not ( = ?auto_260036 ?auto_260040 ) ) ( not ( = ?auto_260037 ?auto_260038 ) ) ( not ( = ?auto_260037 ?auto_260039 ) ) ( not ( = ?auto_260037 ?auto_260040 ) ) ( not ( = ?auto_260038 ?auto_260039 ) ) ( not ( = ?auto_260038 ?auto_260040 ) ) ( not ( = ?auto_260039 ?auto_260040 ) ) ( ON ?auto_260038 ?auto_260039 ) ( ON ?auto_260037 ?auto_260038 ) ( ON ?auto_260036 ?auto_260037 ) ( ON ?auto_260035 ?auto_260036 ) ( ON ?auto_260034 ?auto_260035 ) ( CLEAR ?auto_260032 ) ( ON ?auto_260033 ?auto_260034 ) ( CLEAR ?auto_260033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_260028 ?auto_260029 ?auto_260030 ?auto_260031 ?auto_260032 ?auto_260033 )
      ( MAKE-12PILE ?auto_260028 ?auto_260029 ?auto_260030 ?auto_260031 ?auto_260032 ?auto_260033 ?auto_260034 ?auto_260035 ?auto_260036 ?auto_260037 ?auto_260038 ?auto_260039 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_260053 - BLOCK
      ?auto_260054 - BLOCK
      ?auto_260055 - BLOCK
      ?auto_260056 - BLOCK
      ?auto_260057 - BLOCK
      ?auto_260058 - BLOCK
      ?auto_260059 - BLOCK
      ?auto_260060 - BLOCK
      ?auto_260061 - BLOCK
      ?auto_260062 - BLOCK
      ?auto_260063 - BLOCK
      ?auto_260064 - BLOCK
    )
    :vars
    (
      ?auto_260065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260064 ?auto_260065 ) ( ON-TABLE ?auto_260053 ) ( ON ?auto_260054 ?auto_260053 ) ( ON ?auto_260055 ?auto_260054 ) ( ON ?auto_260056 ?auto_260055 ) ( ON ?auto_260057 ?auto_260056 ) ( not ( = ?auto_260053 ?auto_260054 ) ) ( not ( = ?auto_260053 ?auto_260055 ) ) ( not ( = ?auto_260053 ?auto_260056 ) ) ( not ( = ?auto_260053 ?auto_260057 ) ) ( not ( = ?auto_260053 ?auto_260058 ) ) ( not ( = ?auto_260053 ?auto_260059 ) ) ( not ( = ?auto_260053 ?auto_260060 ) ) ( not ( = ?auto_260053 ?auto_260061 ) ) ( not ( = ?auto_260053 ?auto_260062 ) ) ( not ( = ?auto_260053 ?auto_260063 ) ) ( not ( = ?auto_260053 ?auto_260064 ) ) ( not ( = ?auto_260053 ?auto_260065 ) ) ( not ( = ?auto_260054 ?auto_260055 ) ) ( not ( = ?auto_260054 ?auto_260056 ) ) ( not ( = ?auto_260054 ?auto_260057 ) ) ( not ( = ?auto_260054 ?auto_260058 ) ) ( not ( = ?auto_260054 ?auto_260059 ) ) ( not ( = ?auto_260054 ?auto_260060 ) ) ( not ( = ?auto_260054 ?auto_260061 ) ) ( not ( = ?auto_260054 ?auto_260062 ) ) ( not ( = ?auto_260054 ?auto_260063 ) ) ( not ( = ?auto_260054 ?auto_260064 ) ) ( not ( = ?auto_260054 ?auto_260065 ) ) ( not ( = ?auto_260055 ?auto_260056 ) ) ( not ( = ?auto_260055 ?auto_260057 ) ) ( not ( = ?auto_260055 ?auto_260058 ) ) ( not ( = ?auto_260055 ?auto_260059 ) ) ( not ( = ?auto_260055 ?auto_260060 ) ) ( not ( = ?auto_260055 ?auto_260061 ) ) ( not ( = ?auto_260055 ?auto_260062 ) ) ( not ( = ?auto_260055 ?auto_260063 ) ) ( not ( = ?auto_260055 ?auto_260064 ) ) ( not ( = ?auto_260055 ?auto_260065 ) ) ( not ( = ?auto_260056 ?auto_260057 ) ) ( not ( = ?auto_260056 ?auto_260058 ) ) ( not ( = ?auto_260056 ?auto_260059 ) ) ( not ( = ?auto_260056 ?auto_260060 ) ) ( not ( = ?auto_260056 ?auto_260061 ) ) ( not ( = ?auto_260056 ?auto_260062 ) ) ( not ( = ?auto_260056 ?auto_260063 ) ) ( not ( = ?auto_260056 ?auto_260064 ) ) ( not ( = ?auto_260056 ?auto_260065 ) ) ( not ( = ?auto_260057 ?auto_260058 ) ) ( not ( = ?auto_260057 ?auto_260059 ) ) ( not ( = ?auto_260057 ?auto_260060 ) ) ( not ( = ?auto_260057 ?auto_260061 ) ) ( not ( = ?auto_260057 ?auto_260062 ) ) ( not ( = ?auto_260057 ?auto_260063 ) ) ( not ( = ?auto_260057 ?auto_260064 ) ) ( not ( = ?auto_260057 ?auto_260065 ) ) ( not ( = ?auto_260058 ?auto_260059 ) ) ( not ( = ?auto_260058 ?auto_260060 ) ) ( not ( = ?auto_260058 ?auto_260061 ) ) ( not ( = ?auto_260058 ?auto_260062 ) ) ( not ( = ?auto_260058 ?auto_260063 ) ) ( not ( = ?auto_260058 ?auto_260064 ) ) ( not ( = ?auto_260058 ?auto_260065 ) ) ( not ( = ?auto_260059 ?auto_260060 ) ) ( not ( = ?auto_260059 ?auto_260061 ) ) ( not ( = ?auto_260059 ?auto_260062 ) ) ( not ( = ?auto_260059 ?auto_260063 ) ) ( not ( = ?auto_260059 ?auto_260064 ) ) ( not ( = ?auto_260059 ?auto_260065 ) ) ( not ( = ?auto_260060 ?auto_260061 ) ) ( not ( = ?auto_260060 ?auto_260062 ) ) ( not ( = ?auto_260060 ?auto_260063 ) ) ( not ( = ?auto_260060 ?auto_260064 ) ) ( not ( = ?auto_260060 ?auto_260065 ) ) ( not ( = ?auto_260061 ?auto_260062 ) ) ( not ( = ?auto_260061 ?auto_260063 ) ) ( not ( = ?auto_260061 ?auto_260064 ) ) ( not ( = ?auto_260061 ?auto_260065 ) ) ( not ( = ?auto_260062 ?auto_260063 ) ) ( not ( = ?auto_260062 ?auto_260064 ) ) ( not ( = ?auto_260062 ?auto_260065 ) ) ( not ( = ?auto_260063 ?auto_260064 ) ) ( not ( = ?auto_260063 ?auto_260065 ) ) ( not ( = ?auto_260064 ?auto_260065 ) ) ( ON ?auto_260063 ?auto_260064 ) ( ON ?auto_260062 ?auto_260063 ) ( ON ?auto_260061 ?auto_260062 ) ( ON ?auto_260060 ?auto_260061 ) ( ON ?auto_260059 ?auto_260060 ) ( CLEAR ?auto_260057 ) ( ON ?auto_260058 ?auto_260059 ) ( CLEAR ?auto_260058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_260053 ?auto_260054 ?auto_260055 ?auto_260056 ?auto_260057 ?auto_260058 )
      ( MAKE-12PILE ?auto_260053 ?auto_260054 ?auto_260055 ?auto_260056 ?auto_260057 ?auto_260058 ?auto_260059 ?auto_260060 ?auto_260061 ?auto_260062 ?auto_260063 ?auto_260064 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_260078 - BLOCK
      ?auto_260079 - BLOCK
      ?auto_260080 - BLOCK
      ?auto_260081 - BLOCK
      ?auto_260082 - BLOCK
      ?auto_260083 - BLOCK
      ?auto_260084 - BLOCK
      ?auto_260085 - BLOCK
      ?auto_260086 - BLOCK
      ?auto_260087 - BLOCK
      ?auto_260088 - BLOCK
      ?auto_260089 - BLOCK
    )
    :vars
    (
      ?auto_260090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260089 ?auto_260090 ) ( ON-TABLE ?auto_260078 ) ( ON ?auto_260079 ?auto_260078 ) ( ON ?auto_260080 ?auto_260079 ) ( ON ?auto_260081 ?auto_260080 ) ( not ( = ?auto_260078 ?auto_260079 ) ) ( not ( = ?auto_260078 ?auto_260080 ) ) ( not ( = ?auto_260078 ?auto_260081 ) ) ( not ( = ?auto_260078 ?auto_260082 ) ) ( not ( = ?auto_260078 ?auto_260083 ) ) ( not ( = ?auto_260078 ?auto_260084 ) ) ( not ( = ?auto_260078 ?auto_260085 ) ) ( not ( = ?auto_260078 ?auto_260086 ) ) ( not ( = ?auto_260078 ?auto_260087 ) ) ( not ( = ?auto_260078 ?auto_260088 ) ) ( not ( = ?auto_260078 ?auto_260089 ) ) ( not ( = ?auto_260078 ?auto_260090 ) ) ( not ( = ?auto_260079 ?auto_260080 ) ) ( not ( = ?auto_260079 ?auto_260081 ) ) ( not ( = ?auto_260079 ?auto_260082 ) ) ( not ( = ?auto_260079 ?auto_260083 ) ) ( not ( = ?auto_260079 ?auto_260084 ) ) ( not ( = ?auto_260079 ?auto_260085 ) ) ( not ( = ?auto_260079 ?auto_260086 ) ) ( not ( = ?auto_260079 ?auto_260087 ) ) ( not ( = ?auto_260079 ?auto_260088 ) ) ( not ( = ?auto_260079 ?auto_260089 ) ) ( not ( = ?auto_260079 ?auto_260090 ) ) ( not ( = ?auto_260080 ?auto_260081 ) ) ( not ( = ?auto_260080 ?auto_260082 ) ) ( not ( = ?auto_260080 ?auto_260083 ) ) ( not ( = ?auto_260080 ?auto_260084 ) ) ( not ( = ?auto_260080 ?auto_260085 ) ) ( not ( = ?auto_260080 ?auto_260086 ) ) ( not ( = ?auto_260080 ?auto_260087 ) ) ( not ( = ?auto_260080 ?auto_260088 ) ) ( not ( = ?auto_260080 ?auto_260089 ) ) ( not ( = ?auto_260080 ?auto_260090 ) ) ( not ( = ?auto_260081 ?auto_260082 ) ) ( not ( = ?auto_260081 ?auto_260083 ) ) ( not ( = ?auto_260081 ?auto_260084 ) ) ( not ( = ?auto_260081 ?auto_260085 ) ) ( not ( = ?auto_260081 ?auto_260086 ) ) ( not ( = ?auto_260081 ?auto_260087 ) ) ( not ( = ?auto_260081 ?auto_260088 ) ) ( not ( = ?auto_260081 ?auto_260089 ) ) ( not ( = ?auto_260081 ?auto_260090 ) ) ( not ( = ?auto_260082 ?auto_260083 ) ) ( not ( = ?auto_260082 ?auto_260084 ) ) ( not ( = ?auto_260082 ?auto_260085 ) ) ( not ( = ?auto_260082 ?auto_260086 ) ) ( not ( = ?auto_260082 ?auto_260087 ) ) ( not ( = ?auto_260082 ?auto_260088 ) ) ( not ( = ?auto_260082 ?auto_260089 ) ) ( not ( = ?auto_260082 ?auto_260090 ) ) ( not ( = ?auto_260083 ?auto_260084 ) ) ( not ( = ?auto_260083 ?auto_260085 ) ) ( not ( = ?auto_260083 ?auto_260086 ) ) ( not ( = ?auto_260083 ?auto_260087 ) ) ( not ( = ?auto_260083 ?auto_260088 ) ) ( not ( = ?auto_260083 ?auto_260089 ) ) ( not ( = ?auto_260083 ?auto_260090 ) ) ( not ( = ?auto_260084 ?auto_260085 ) ) ( not ( = ?auto_260084 ?auto_260086 ) ) ( not ( = ?auto_260084 ?auto_260087 ) ) ( not ( = ?auto_260084 ?auto_260088 ) ) ( not ( = ?auto_260084 ?auto_260089 ) ) ( not ( = ?auto_260084 ?auto_260090 ) ) ( not ( = ?auto_260085 ?auto_260086 ) ) ( not ( = ?auto_260085 ?auto_260087 ) ) ( not ( = ?auto_260085 ?auto_260088 ) ) ( not ( = ?auto_260085 ?auto_260089 ) ) ( not ( = ?auto_260085 ?auto_260090 ) ) ( not ( = ?auto_260086 ?auto_260087 ) ) ( not ( = ?auto_260086 ?auto_260088 ) ) ( not ( = ?auto_260086 ?auto_260089 ) ) ( not ( = ?auto_260086 ?auto_260090 ) ) ( not ( = ?auto_260087 ?auto_260088 ) ) ( not ( = ?auto_260087 ?auto_260089 ) ) ( not ( = ?auto_260087 ?auto_260090 ) ) ( not ( = ?auto_260088 ?auto_260089 ) ) ( not ( = ?auto_260088 ?auto_260090 ) ) ( not ( = ?auto_260089 ?auto_260090 ) ) ( ON ?auto_260088 ?auto_260089 ) ( ON ?auto_260087 ?auto_260088 ) ( ON ?auto_260086 ?auto_260087 ) ( ON ?auto_260085 ?auto_260086 ) ( ON ?auto_260084 ?auto_260085 ) ( ON ?auto_260083 ?auto_260084 ) ( CLEAR ?auto_260081 ) ( ON ?auto_260082 ?auto_260083 ) ( CLEAR ?auto_260082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_260078 ?auto_260079 ?auto_260080 ?auto_260081 ?auto_260082 )
      ( MAKE-12PILE ?auto_260078 ?auto_260079 ?auto_260080 ?auto_260081 ?auto_260082 ?auto_260083 ?auto_260084 ?auto_260085 ?auto_260086 ?auto_260087 ?auto_260088 ?auto_260089 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_260103 - BLOCK
      ?auto_260104 - BLOCK
      ?auto_260105 - BLOCK
      ?auto_260106 - BLOCK
      ?auto_260107 - BLOCK
      ?auto_260108 - BLOCK
      ?auto_260109 - BLOCK
      ?auto_260110 - BLOCK
      ?auto_260111 - BLOCK
      ?auto_260112 - BLOCK
      ?auto_260113 - BLOCK
      ?auto_260114 - BLOCK
    )
    :vars
    (
      ?auto_260115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260114 ?auto_260115 ) ( ON-TABLE ?auto_260103 ) ( ON ?auto_260104 ?auto_260103 ) ( ON ?auto_260105 ?auto_260104 ) ( ON ?auto_260106 ?auto_260105 ) ( not ( = ?auto_260103 ?auto_260104 ) ) ( not ( = ?auto_260103 ?auto_260105 ) ) ( not ( = ?auto_260103 ?auto_260106 ) ) ( not ( = ?auto_260103 ?auto_260107 ) ) ( not ( = ?auto_260103 ?auto_260108 ) ) ( not ( = ?auto_260103 ?auto_260109 ) ) ( not ( = ?auto_260103 ?auto_260110 ) ) ( not ( = ?auto_260103 ?auto_260111 ) ) ( not ( = ?auto_260103 ?auto_260112 ) ) ( not ( = ?auto_260103 ?auto_260113 ) ) ( not ( = ?auto_260103 ?auto_260114 ) ) ( not ( = ?auto_260103 ?auto_260115 ) ) ( not ( = ?auto_260104 ?auto_260105 ) ) ( not ( = ?auto_260104 ?auto_260106 ) ) ( not ( = ?auto_260104 ?auto_260107 ) ) ( not ( = ?auto_260104 ?auto_260108 ) ) ( not ( = ?auto_260104 ?auto_260109 ) ) ( not ( = ?auto_260104 ?auto_260110 ) ) ( not ( = ?auto_260104 ?auto_260111 ) ) ( not ( = ?auto_260104 ?auto_260112 ) ) ( not ( = ?auto_260104 ?auto_260113 ) ) ( not ( = ?auto_260104 ?auto_260114 ) ) ( not ( = ?auto_260104 ?auto_260115 ) ) ( not ( = ?auto_260105 ?auto_260106 ) ) ( not ( = ?auto_260105 ?auto_260107 ) ) ( not ( = ?auto_260105 ?auto_260108 ) ) ( not ( = ?auto_260105 ?auto_260109 ) ) ( not ( = ?auto_260105 ?auto_260110 ) ) ( not ( = ?auto_260105 ?auto_260111 ) ) ( not ( = ?auto_260105 ?auto_260112 ) ) ( not ( = ?auto_260105 ?auto_260113 ) ) ( not ( = ?auto_260105 ?auto_260114 ) ) ( not ( = ?auto_260105 ?auto_260115 ) ) ( not ( = ?auto_260106 ?auto_260107 ) ) ( not ( = ?auto_260106 ?auto_260108 ) ) ( not ( = ?auto_260106 ?auto_260109 ) ) ( not ( = ?auto_260106 ?auto_260110 ) ) ( not ( = ?auto_260106 ?auto_260111 ) ) ( not ( = ?auto_260106 ?auto_260112 ) ) ( not ( = ?auto_260106 ?auto_260113 ) ) ( not ( = ?auto_260106 ?auto_260114 ) ) ( not ( = ?auto_260106 ?auto_260115 ) ) ( not ( = ?auto_260107 ?auto_260108 ) ) ( not ( = ?auto_260107 ?auto_260109 ) ) ( not ( = ?auto_260107 ?auto_260110 ) ) ( not ( = ?auto_260107 ?auto_260111 ) ) ( not ( = ?auto_260107 ?auto_260112 ) ) ( not ( = ?auto_260107 ?auto_260113 ) ) ( not ( = ?auto_260107 ?auto_260114 ) ) ( not ( = ?auto_260107 ?auto_260115 ) ) ( not ( = ?auto_260108 ?auto_260109 ) ) ( not ( = ?auto_260108 ?auto_260110 ) ) ( not ( = ?auto_260108 ?auto_260111 ) ) ( not ( = ?auto_260108 ?auto_260112 ) ) ( not ( = ?auto_260108 ?auto_260113 ) ) ( not ( = ?auto_260108 ?auto_260114 ) ) ( not ( = ?auto_260108 ?auto_260115 ) ) ( not ( = ?auto_260109 ?auto_260110 ) ) ( not ( = ?auto_260109 ?auto_260111 ) ) ( not ( = ?auto_260109 ?auto_260112 ) ) ( not ( = ?auto_260109 ?auto_260113 ) ) ( not ( = ?auto_260109 ?auto_260114 ) ) ( not ( = ?auto_260109 ?auto_260115 ) ) ( not ( = ?auto_260110 ?auto_260111 ) ) ( not ( = ?auto_260110 ?auto_260112 ) ) ( not ( = ?auto_260110 ?auto_260113 ) ) ( not ( = ?auto_260110 ?auto_260114 ) ) ( not ( = ?auto_260110 ?auto_260115 ) ) ( not ( = ?auto_260111 ?auto_260112 ) ) ( not ( = ?auto_260111 ?auto_260113 ) ) ( not ( = ?auto_260111 ?auto_260114 ) ) ( not ( = ?auto_260111 ?auto_260115 ) ) ( not ( = ?auto_260112 ?auto_260113 ) ) ( not ( = ?auto_260112 ?auto_260114 ) ) ( not ( = ?auto_260112 ?auto_260115 ) ) ( not ( = ?auto_260113 ?auto_260114 ) ) ( not ( = ?auto_260113 ?auto_260115 ) ) ( not ( = ?auto_260114 ?auto_260115 ) ) ( ON ?auto_260113 ?auto_260114 ) ( ON ?auto_260112 ?auto_260113 ) ( ON ?auto_260111 ?auto_260112 ) ( ON ?auto_260110 ?auto_260111 ) ( ON ?auto_260109 ?auto_260110 ) ( ON ?auto_260108 ?auto_260109 ) ( CLEAR ?auto_260106 ) ( ON ?auto_260107 ?auto_260108 ) ( CLEAR ?auto_260107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_260103 ?auto_260104 ?auto_260105 ?auto_260106 ?auto_260107 )
      ( MAKE-12PILE ?auto_260103 ?auto_260104 ?auto_260105 ?auto_260106 ?auto_260107 ?auto_260108 ?auto_260109 ?auto_260110 ?auto_260111 ?auto_260112 ?auto_260113 ?auto_260114 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_260128 - BLOCK
      ?auto_260129 - BLOCK
      ?auto_260130 - BLOCK
      ?auto_260131 - BLOCK
      ?auto_260132 - BLOCK
      ?auto_260133 - BLOCK
      ?auto_260134 - BLOCK
      ?auto_260135 - BLOCK
      ?auto_260136 - BLOCK
      ?auto_260137 - BLOCK
      ?auto_260138 - BLOCK
      ?auto_260139 - BLOCK
    )
    :vars
    (
      ?auto_260140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260139 ?auto_260140 ) ( ON-TABLE ?auto_260128 ) ( ON ?auto_260129 ?auto_260128 ) ( ON ?auto_260130 ?auto_260129 ) ( not ( = ?auto_260128 ?auto_260129 ) ) ( not ( = ?auto_260128 ?auto_260130 ) ) ( not ( = ?auto_260128 ?auto_260131 ) ) ( not ( = ?auto_260128 ?auto_260132 ) ) ( not ( = ?auto_260128 ?auto_260133 ) ) ( not ( = ?auto_260128 ?auto_260134 ) ) ( not ( = ?auto_260128 ?auto_260135 ) ) ( not ( = ?auto_260128 ?auto_260136 ) ) ( not ( = ?auto_260128 ?auto_260137 ) ) ( not ( = ?auto_260128 ?auto_260138 ) ) ( not ( = ?auto_260128 ?auto_260139 ) ) ( not ( = ?auto_260128 ?auto_260140 ) ) ( not ( = ?auto_260129 ?auto_260130 ) ) ( not ( = ?auto_260129 ?auto_260131 ) ) ( not ( = ?auto_260129 ?auto_260132 ) ) ( not ( = ?auto_260129 ?auto_260133 ) ) ( not ( = ?auto_260129 ?auto_260134 ) ) ( not ( = ?auto_260129 ?auto_260135 ) ) ( not ( = ?auto_260129 ?auto_260136 ) ) ( not ( = ?auto_260129 ?auto_260137 ) ) ( not ( = ?auto_260129 ?auto_260138 ) ) ( not ( = ?auto_260129 ?auto_260139 ) ) ( not ( = ?auto_260129 ?auto_260140 ) ) ( not ( = ?auto_260130 ?auto_260131 ) ) ( not ( = ?auto_260130 ?auto_260132 ) ) ( not ( = ?auto_260130 ?auto_260133 ) ) ( not ( = ?auto_260130 ?auto_260134 ) ) ( not ( = ?auto_260130 ?auto_260135 ) ) ( not ( = ?auto_260130 ?auto_260136 ) ) ( not ( = ?auto_260130 ?auto_260137 ) ) ( not ( = ?auto_260130 ?auto_260138 ) ) ( not ( = ?auto_260130 ?auto_260139 ) ) ( not ( = ?auto_260130 ?auto_260140 ) ) ( not ( = ?auto_260131 ?auto_260132 ) ) ( not ( = ?auto_260131 ?auto_260133 ) ) ( not ( = ?auto_260131 ?auto_260134 ) ) ( not ( = ?auto_260131 ?auto_260135 ) ) ( not ( = ?auto_260131 ?auto_260136 ) ) ( not ( = ?auto_260131 ?auto_260137 ) ) ( not ( = ?auto_260131 ?auto_260138 ) ) ( not ( = ?auto_260131 ?auto_260139 ) ) ( not ( = ?auto_260131 ?auto_260140 ) ) ( not ( = ?auto_260132 ?auto_260133 ) ) ( not ( = ?auto_260132 ?auto_260134 ) ) ( not ( = ?auto_260132 ?auto_260135 ) ) ( not ( = ?auto_260132 ?auto_260136 ) ) ( not ( = ?auto_260132 ?auto_260137 ) ) ( not ( = ?auto_260132 ?auto_260138 ) ) ( not ( = ?auto_260132 ?auto_260139 ) ) ( not ( = ?auto_260132 ?auto_260140 ) ) ( not ( = ?auto_260133 ?auto_260134 ) ) ( not ( = ?auto_260133 ?auto_260135 ) ) ( not ( = ?auto_260133 ?auto_260136 ) ) ( not ( = ?auto_260133 ?auto_260137 ) ) ( not ( = ?auto_260133 ?auto_260138 ) ) ( not ( = ?auto_260133 ?auto_260139 ) ) ( not ( = ?auto_260133 ?auto_260140 ) ) ( not ( = ?auto_260134 ?auto_260135 ) ) ( not ( = ?auto_260134 ?auto_260136 ) ) ( not ( = ?auto_260134 ?auto_260137 ) ) ( not ( = ?auto_260134 ?auto_260138 ) ) ( not ( = ?auto_260134 ?auto_260139 ) ) ( not ( = ?auto_260134 ?auto_260140 ) ) ( not ( = ?auto_260135 ?auto_260136 ) ) ( not ( = ?auto_260135 ?auto_260137 ) ) ( not ( = ?auto_260135 ?auto_260138 ) ) ( not ( = ?auto_260135 ?auto_260139 ) ) ( not ( = ?auto_260135 ?auto_260140 ) ) ( not ( = ?auto_260136 ?auto_260137 ) ) ( not ( = ?auto_260136 ?auto_260138 ) ) ( not ( = ?auto_260136 ?auto_260139 ) ) ( not ( = ?auto_260136 ?auto_260140 ) ) ( not ( = ?auto_260137 ?auto_260138 ) ) ( not ( = ?auto_260137 ?auto_260139 ) ) ( not ( = ?auto_260137 ?auto_260140 ) ) ( not ( = ?auto_260138 ?auto_260139 ) ) ( not ( = ?auto_260138 ?auto_260140 ) ) ( not ( = ?auto_260139 ?auto_260140 ) ) ( ON ?auto_260138 ?auto_260139 ) ( ON ?auto_260137 ?auto_260138 ) ( ON ?auto_260136 ?auto_260137 ) ( ON ?auto_260135 ?auto_260136 ) ( ON ?auto_260134 ?auto_260135 ) ( ON ?auto_260133 ?auto_260134 ) ( ON ?auto_260132 ?auto_260133 ) ( CLEAR ?auto_260130 ) ( ON ?auto_260131 ?auto_260132 ) ( CLEAR ?auto_260131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_260128 ?auto_260129 ?auto_260130 ?auto_260131 )
      ( MAKE-12PILE ?auto_260128 ?auto_260129 ?auto_260130 ?auto_260131 ?auto_260132 ?auto_260133 ?auto_260134 ?auto_260135 ?auto_260136 ?auto_260137 ?auto_260138 ?auto_260139 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_260153 - BLOCK
      ?auto_260154 - BLOCK
      ?auto_260155 - BLOCK
      ?auto_260156 - BLOCK
      ?auto_260157 - BLOCK
      ?auto_260158 - BLOCK
      ?auto_260159 - BLOCK
      ?auto_260160 - BLOCK
      ?auto_260161 - BLOCK
      ?auto_260162 - BLOCK
      ?auto_260163 - BLOCK
      ?auto_260164 - BLOCK
    )
    :vars
    (
      ?auto_260165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260164 ?auto_260165 ) ( ON-TABLE ?auto_260153 ) ( ON ?auto_260154 ?auto_260153 ) ( ON ?auto_260155 ?auto_260154 ) ( not ( = ?auto_260153 ?auto_260154 ) ) ( not ( = ?auto_260153 ?auto_260155 ) ) ( not ( = ?auto_260153 ?auto_260156 ) ) ( not ( = ?auto_260153 ?auto_260157 ) ) ( not ( = ?auto_260153 ?auto_260158 ) ) ( not ( = ?auto_260153 ?auto_260159 ) ) ( not ( = ?auto_260153 ?auto_260160 ) ) ( not ( = ?auto_260153 ?auto_260161 ) ) ( not ( = ?auto_260153 ?auto_260162 ) ) ( not ( = ?auto_260153 ?auto_260163 ) ) ( not ( = ?auto_260153 ?auto_260164 ) ) ( not ( = ?auto_260153 ?auto_260165 ) ) ( not ( = ?auto_260154 ?auto_260155 ) ) ( not ( = ?auto_260154 ?auto_260156 ) ) ( not ( = ?auto_260154 ?auto_260157 ) ) ( not ( = ?auto_260154 ?auto_260158 ) ) ( not ( = ?auto_260154 ?auto_260159 ) ) ( not ( = ?auto_260154 ?auto_260160 ) ) ( not ( = ?auto_260154 ?auto_260161 ) ) ( not ( = ?auto_260154 ?auto_260162 ) ) ( not ( = ?auto_260154 ?auto_260163 ) ) ( not ( = ?auto_260154 ?auto_260164 ) ) ( not ( = ?auto_260154 ?auto_260165 ) ) ( not ( = ?auto_260155 ?auto_260156 ) ) ( not ( = ?auto_260155 ?auto_260157 ) ) ( not ( = ?auto_260155 ?auto_260158 ) ) ( not ( = ?auto_260155 ?auto_260159 ) ) ( not ( = ?auto_260155 ?auto_260160 ) ) ( not ( = ?auto_260155 ?auto_260161 ) ) ( not ( = ?auto_260155 ?auto_260162 ) ) ( not ( = ?auto_260155 ?auto_260163 ) ) ( not ( = ?auto_260155 ?auto_260164 ) ) ( not ( = ?auto_260155 ?auto_260165 ) ) ( not ( = ?auto_260156 ?auto_260157 ) ) ( not ( = ?auto_260156 ?auto_260158 ) ) ( not ( = ?auto_260156 ?auto_260159 ) ) ( not ( = ?auto_260156 ?auto_260160 ) ) ( not ( = ?auto_260156 ?auto_260161 ) ) ( not ( = ?auto_260156 ?auto_260162 ) ) ( not ( = ?auto_260156 ?auto_260163 ) ) ( not ( = ?auto_260156 ?auto_260164 ) ) ( not ( = ?auto_260156 ?auto_260165 ) ) ( not ( = ?auto_260157 ?auto_260158 ) ) ( not ( = ?auto_260157 ?auto_260159 ) ) ( not ( = ?auto_260157 ?auto_260160 ) ) ( not ( = ?auto_260157 ?auto_260161 ) ) ( not ( = ?auto_260157 ?auto_260162 ) ) ( not ( = ?auto_260157 ?auto_260163 ) ) ( not ( = ?auto_260157 ?auto_260164 ) ) ( not ( = ?auto_260157 ?auto_260165 ) ) ( not ( = ?auto_260158 ?auto_260159 ) ) ( not ( = ?auto_260158 ?auto_260160 ) ) ( not ( = ?auto_260158 ?auto_260161 ) ) ( not ( = ?auto_260158 ?auto_260162 ) ) ( not ( = ?auto_260158 ?auto_260163 ) ) ( not ( = ?auto_260158 ?auto_260164 ) ) ( not ( = ?auto_260158 ?auto_260165 ) ) ( not ( = ?auto_260159 ?auto_260160 ) ) ( not ( = ?auto_260159 ?auto_260161 ) ) ( not ( = ?auto_260159 ?auto_260162 ) ) ( not ( = ?auto_260159 ?auto_260163 ) ) ( not ( = ?auto_260159 ?auto_260164 ) ) ( not ( = ?auto_260159 ?auto_260165 ) ) ( not ( = ?auto_260160 ?auto_260161 ) ) ( not ( = ?auto_260160 ?auto_260162 ) ) ( not ( = ?auto_260160 ?auto_260163 ) ) ( not ( = ?auto_260160 ?auto_260164 ) ) ( not ( = ?auto_260160 ?auto_260165 ) ) ( not ( = ?auto_260161 ?auto_260162 ) ) ( not ( = ?auto_260161 ?auto_260163 ) ) ( not ( = ?auto_260161 ?auto_260164 ) ) ( not ( = ?auto_260161 ?auto_260165 ) ) ( not ( = ?auto_260162 ?auto_260163 ) ) ( not ( = ?auto_260162 ?auto_260164 ) ) ( not ( = ?auto_260162 ?auto_260165 ) ) ( not ( = ?auto_260163 ?auto_260164 ) ) ( not ( = ?auto_260163 ?auto_260165 ) ) ( not ( = ?auto_260164 ?auto_260165 ) ) ( ON ?auto_260163 ?auto_260164 ) ( ON ?auto_260162 ?auto_260163 ) ( ON ?auto_260161 ?auto_260162 ) ( ON ?auto_260160 ?auto_260161 ) ( ON ?auto_260159 ?auto_260160 ) ( ON ?auto_260158 ?auto_260159 ) ( ON ?auto_260157 ?auto_260158 ) ( CLEAR ?auto_260155 ) ( ON ?auto_260156 ?auto_260157 ) ( CLEAR ?auto_260156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_260153 ?auto_260154 ?auto_260155 ?auto_260156 )
      ( MAKE-12PILE ?auto_260153 ?auto_260154 ?auto_260155 ?auto_260156 ?auto_260157 ?auto_260158 ?auto_260159 ?auto_260160 ?auto_260161 ?auto_260162 ?auto_260163 ?auto_260164 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_260178 - BLOCK
      ?auto_260179 - BLOCK
      ?auto_260180 - BLOCK
      ?auto_260181 - BLOCK
      ?auto_260182 - BLOCK
      ?auto_260183 - BLOCK
      ?auto_260184 - BLOCK
      ?auto_260185 - BLOCK
      ?auto_260186 - BLOCK
      ?auto_260187 - BLOCK
      ?auto_260188 - BLOCK
      ?auto_260189 - BLOCK
    )
    :vars
    (
      ?auto_260190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260189 ?auto_260190 ) ( ON-TABLE ?auto_260178 ) ( ON ?auto_260179 ?auto_260178 ) ( not ( = ?auto_260178 ?auto_260179 ) ) ( not ( = ?auto_260178 ?auto_260180 ) ) ( not ( = ?auto_260178 ?auto_260181 ) ) ( not ( = ?auto_260178 ?auto_260182 ) ) ( not ( = ?auto_260178 ?auto_260183 ) ) ( not ( = ?auto_260178 ?auto_260184 ) ) ( not ( = ?auto_260178 ?auto_260185 ) ) ( not ( = ?auto_260178 ?auto_260186 ) ) ( not ( = ?auto_260178 ?auto_260187 ) ) ( not ( = ?auto_260178 ?auto_260188 ) ) ( not ( = ?auto_260178 ?auto_260189 ) ) ( not ( = ?auto_260178 ?auto_260190 ) ) ( not ( = ?auto_260179 ?auto_260180 ) ) ( not ( = ?auto_260179 ?auto_260181 ) ) ( not ( = ?auto_260179 ?auto_260182 ) ) ( not ( = ?auto_260179 ?auto_260183 ) ) ( not ( = ?auto_260179 ?auto_260184 ) ) ( not ( = ?auto_260179 ?auto_260185 ) ) ( not ( = ?auto_260179 ?auto_260186 ) ) ( not ( = ?auto_260179 ?auto_260187 ) ) ( not ( = ?auto_260179 ?auto_260188 ) ) ( not ( = ?auto_260179 ?auto_260189 ) ) ( not ( = ?auto_260179 ?auto_260190 ) ) ( not ( = ?auto_260180 ?auto_260181 ) ) ( not ( = ?auto_260180 ?auto_260182 ) ) ( not ( = ?auto_260180 ?auto_260183 ) ) ( not ( = ?auto_260180 ?auto_260184 ) ) ( not ( = ?auto_260180 ?auto_260185 ) ) ( not ( = ?auto_260180 ?auto_260186 ) ) ( not ( = ?auto_260180 ?auto_260187 ) ) ( not ( = ?auto_260180 ?auto_260188 ) ) ( not ( = ?auto_260180 ?auto_260189 ) ) ( not ( = ?auto_260180 ?auto_260190 ) ) ( not ( = ?auto_260181 ?auto_260182 ) ) ( not ( = ?auto_260181 ?auto_260183 ) ) ( not ( = ?auto_260181 ?auto_260184 ) ) ( not ( = ?auto_260181 ?auto_260185 ) ) ( not ( = ?auto_260181 ?auto_260186 ) ) ( not ( = ?auto_260181 ?auto_260187 ) ) ( not ( = ?auto_260181 ?auto_260188 ) ) ( not ( = ?auto_260181 ?auto_260189 ) ) ( not ( = ?auto_260181 ?auto_260190 ) ) ( not ( = ?auto_260182 ?auto_260183 ) ) ( not ( = ?auto_260182 ?auto_260184 ) ) ( not ( = ?auto_260182 ?auto_260185 ) ) ( not ( = ?auto_260182 ?auto_260186 ) ) ( not ( = ?auto_260182 ?auto_260187 ) ) ( not ( = ?auto_260182 ?auto_260188 ) ) ( not ( = ?auto_260182 ?auto_260189 ) ) ( not ( = ?auto_260182 ?auto_260190 ) ) ( not ( = ?auto_260183 ?auto_260184 ) ) ( not ( = ?auto_260183 ?auto_260185 ) ) ( not ( = ?auto_260183 ?auto_260186 ) ) ( not ( = ?auto_260183 ?auto_260187 ) ) ( not ( = ?auto_260183 ?auto_260188 ) ) ( not ( = ?auto_260183 ?auto_260189 ) ) ( not ( = ?auto_260183 ?auto_260190 ) ) ( not ( = ?auto_260184 ?auto_260185 ) ) ( not ( = ?auto_260184 ?auto_260186 ) ) ( not ( = ?auto_260184 ?auto_260187 ) ) ( not ( = ?auto_260184 ?auto_260188 ) ) ( not ( = ?auto_260184 ?auto_260189 ) ) ( not ( = ?auto_260184 ?auto_260190 ) ) ( not ( = ?auto_260185 ?auto_260186 ) ) ( not ( = ?auto_260185 ?auto_260187 ) ) ( not ( = ?auto_260185 ?auto_260188 ) ) ( not ( = ?auto_260185 ?auto_260189 ) ) ( not ( = ?auto_260185 ?auto_260190 ) ) ( not ( = ?auto_260186 ?auto_260187 ) ) ( not ( = ?auto_260186 ?auto_260188 ) ) ( not ( = ?auto_260186 ?auto_260189 ) ) ( not ( = ?auto_260186 ?auto_260190 ) ) ( not ( = ?auto_260187 ?auto_260188 ) ) ( not ( = ?auto_260187 ?auto_260189 ) ) ( not ( = ?auto_260187 ?auto_260190 ) ) ( not ( = ?auto_260188 ?auto_260189 ) ) ( not ( = ?auto_260188 ?auto_260190 ) ) ( not ( = ?auto_260189 ?auto_260190 ) ) ( ON ?auto_260188 ?auto_260189 ) ( ON ?auto_260187 ?auto_260188 ) ( ON ?auto_260186 ?auto_260187 ) ( ON ?auto_260185 ?auto_260186 ) ( ON ?auto_260184 ?auto_260185 ) ( ON ?auto_260183 ?auto_260184 ) ( ON ?auto_260182 ?auto_260183 ) ( ON ?auto_260181 ?auto_260182 ) ( CLEAR ?auto_260179 ) ( ON ?auto_260180 ?auto_260181 ) ( CLEAR ?auto_260180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_260178 ?auto_260179 ?auto_260180 )
      ( MAKE-12PILE ?auto_260178 ?auto_260179 ?auto_260180 ?auto_260181 ?auto_260182 ?auto_260183 ?auto_260184 ?auto_260185 ?auto_260186 ?auto_260187 ?auto_260188 ?auto_260189 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_260203 - BLOCK
      ?auto_260204 - BLOCK
      ?auto_260205 - BLOCK
      ?auto_260206 - BLOCK
      ?auto_260207 - BLOCK
      ?auto_260208 - BLOCK
      ?auto_260209 - BLOCK
      ?auto_260210 - BLOCK
      ?auto_260211 - BLOCK
      ?auto_260212 - BLOCK
      ?auto_260213 - BLOCK
      ?auto_260214 - BLOCK
    )
    :vars
    (
      ?auto_260215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260214 ?auto_260215 ) ( ON-TABLE ?auto_260203 ) ( ON ?auto_260204 ?auto_260203 ) ( not ( = ?auto_260203 ?auto_260204 ) ) ( not ( = ?auto_260203 ?auto_260205 ) ) ( not ( = ?auto_260203 ?auto_260206 ) ) ( not ( = ?auto_260203 ?auto_260207 ) ) ( not ( = ?auto_260203 ?auto_260208 ) ) ( not ( = ?auto_260203 ?auto_260209 ) ) ( not ( = ?auto_260203 ?auto_260210 ) ) ( not ( = ?auto_260203 ?auto_260211 ) ) ( not ( = ?auto_260203 ?auto_260212 ) ) ( not ( = ?auto_260203 ?auto_260213 ) ) ( not ( = ?auto_260203 ?auto_260214 ) ) ( not ( = ?auto_260203 ?auto_260215 ) ) ( not ( = ?auto_260204 ?auto_260205 ) ) ( not ( = ?auto_260204 ?auto_260206 ) ) ( not ( = ?auto_260204 ?auto_260207 ) ) ( not ( = ?auto_260204 ?auto_260208 ) ) ( not ( = ?auto_260204 ?auto_260209 ) ) ( not ( = ?auto_260204 ?auto_260210 ) ) ( not ( = ?auto_260204 ?auto_260211 ) ) ( not ( = ?auto_260204 ?auto_260212 ) ) ( not ( = ?auto_260204 ?auto_260213 ) ) ( not ( = ?auto_260204 ?auto_260214 ) ) ( not ( = ?auto_260204 ?auto_260215 ) ) ( not ( = ?auto_260205 ?auto_260206 ) ) ( not ( = ?auto_260205 ?auto_260207 ) ) ( not ( = ?auto_260205 ?auto_260208 ) ) ( not ( = ?auto_260205 ?auto_260209 ) ) ( not ( = ?auto_260205 ?auto_260210 ) ) ( not ( = ?auto_260205 ?auto_260211 ) ) ( not ( = ?auto_260205 ?auto_260212 ) ) ( not ( = ?auto_260205 ?auto_260213 ) ) ( not ( = ?auto_260205 ?auto_260214 ) ) ( not ( = ?auto_260205 ?auto_260215 ) ) ( not ( = ?auto_260206 ?auto_260207 ) ) ( not ( = ?auto_260206 ?auto_260208 ) ) ( not ( = ?auto_260206 ?auto_260209 ) ) ( not ( = ?auto_260206 ?auto_260210 ) ) ( not ( = ?auto_260206 ?auto_260211 ) ) ( not ( = ?auto_260206 ?auto_260212 ) ) ( not ( = ?auto_260206 ?auto_260213 ) ) ( not ( = ?auto_260206 ?auto_260214 ) ) ( not ( = ?auto_260206 ?auto_260215 ) ) ( not ( = ?auto_260207 ?auto_260208 ) ) ( not ( = ?auto_260207 ?auto_260209 ) ) ( not ( = ?auto_260207 ?auto_260210 ) ) ( not ( = ?auto_260207 ?auto_260211 ) ) ( not ( = ?auto_260207 ?auto_260212 ) ) ( not ( = ?auto_260207 ?auto_260213 ) ) ( not ( = ?auto_260207 ?auto_260214 ) ) ( not ( = ?auto_260207 ?auto_260215 ) ) ( not ( = ?auto_260208 ?auto_260209 ) ) ( not ( = ?auto_260208 ?auto_260210 ) ) ( not ( = ?auto_260208 ?auto_260211 ) ) ( not ( = ?auto_260208 ?auto_260212 ) ) ( not ( = ?auto_260208 ?auto_260213 ) ) ( not ( = ?auto_260208 ?auto_260214 ) ) ( not ( = ?auto_260208 ?auto_260215 ) ) ( not ( = ?auto_260209 ?auto_260210 ) ) ( not ( = ?auto_260209 ?auto_260211 ) ) ( not ( = ?auto_260209 ?auto_260212 ) ) ( not ( = ?auto_260209 ?auto_260213 ) ) ( not ( = ?auto_260209 ?auto_260214 ) ) ( not ( = ?auto_260209 ?auto_260215 ) ) ( not ( = ?auto_260210 ?auto_260211 ) ) ( not ( = ?auto_260210 ?auto_260212 ) ) ( not ( = ?auto_260210 ?auto_260213 ) ) ( not ( = ?auto_260210 ?auto_260214 ) ) ( not ( = ?auto_260210 ?auto_260215 ) ) ( not ( = ?auto_260211 ?auto_260212 ) ) ( not ( = ?auto_260211 ?auto_260213 ) ) ( not ( = ?auto_260211 ?auto_260214 ) ) ( not ( = ?auto_260211 ?auto_260215 ) ) ( not ( = ?auto_260212 ?auto_260213 ) ) ( not ( = ?auto_260212 ?auto_260214 ) ) ( not ( = ?auto_260212 ?auto_260215 ) ) ( not ( = ?auto_260213 ?auto_260214 ) ) ( not ( = ?auto_260213 ?auto_260215 ) ) ( not ( = ?auto_260214 ?auto_260215 ) ) ( ON ?auto_260213 ?auto_260214 ) ( ON ?auto_260212 ?auto_260213 ) ( ON ?auto_260211 ?auto_260212 ) ( ON ?auto_260210 ?auto_260211 ) ( ON ?auto_260209 ?auto_260210 ) ( ON ?auto_260208 ?auto_260209 ) ( ON ?auto_260207 ?auto_260208 ) ( ON ?auto_260206 ?auto_260207 ) ( CLEAR ?auto_260204 ) ( ON ?auto_260205 ?auto_260206 ) ( CLEAR ?auto_260205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_260203 ?auto_260204 ?auto_260205 )
      ( MAKE-12PILE ?auto_260203 ?auto_260204 ?auto_260205 ?auto_260206 ?auto_260207 ?auto_260208 ?auto_260209 ?auto_260210 ?auto_260211 ?auto_260212 ?auto_260213 ?auto_260214 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_260228 - BLOCK
      ?auto_260229 - BLOCK
      ?auto_260230 - BLOCK
      ?auto_260231 - BLOCK
      ?auto_260232 - BLOCK
      ?auto_260233 - BLOCK
      ?auto_260234 - BLOCK
      ?auto_260235 - BLOCK
      ?auto_260236 - BLOCK
      ?auto_260237 - BLOCK
      ?auto_260238 - BLOCK
      ?auto_260239 - BLOCK
    )
    :vars
    (
      ?auto_260240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260239 ?auto_260240 ) ( ON-TABLE ?auto_260228 ) ( not ( = ?auto_260228 ?auto_260229 ) ) ( not ( = ?auto_260228 ?auto_260230 ) ) ( not ( = ?auto_260228 ?auto_260231 ) ) ( not ( = ?auto_260228 ?auto_260232 ) ) ( not ( = ?auto_260228 ?auto_260233 ) ) ( not ( = ?auto_260228 ?auto_260234 ) ) ( not ( = ?auto_260228 ?auto_260235 ) ) ( not ( = ?auto_260228 ?auto_260236 ) ) ( not ( = ?auto_260228 ?auto_260237 ) ) ( not ( = ?auto_260228 ?auto_260238 ) ) ( not ( = ?auto_260228 ?auto_260239 ) ) ( not ( = ?auto_260228 ?auto_260240 ) ) ( not ( = ?auto_260229 ?auto_260230 ) ) ( not ( = ?auto_260229 ?auto_260231 ) ) ( not ( = ?auto_260229 ?auto_260232 ) ) ( not ( = ?auto_260229 ?auto_260233 ) ) ( not ( = ?auto_260229 ?auto_260234 ) ) ( not ( = ?auto_260229 ?auto_260235 ) ) ( not ( = ?auto_260229 ?auto_260236 ) ) ( not ( = ?auto_260229 ?auto_260237 ) ) ( not ( = ?auto_260229 ?auto_260238 ) ) ( not ( = ?auto_260229 ?auto_260239 ) ) ( not ( = ?auto_260229 ?auto_260240 ) ) ( not ( = ?auto_260230 ?auto_260231 ) ) ( not ( = ?auto_260230 ?auto_260232 ) ) ( not ( = ?auto_260230 ?auto_260233 ) ) ( not ( = ?auto_260230 ?auto_260234 ) ) ( not ( = ?auto_260230 ?auto_260235 ) ) ( not ( = ?auto_260230 ?auto_260236 ) ) ( not ( = ?auto_260230 ?auto_260237 ) ) ( not ( = ?auto_260230 ?auto_260238 ) ) ( not ( = ?auto_260230 ?auto_260239 ) ) ( not ( = ?auto_260230 ?auto_260240 ) ) ( not ( = ?auto_260231 ?auto_260232 ) ) ( not ( = ?auto_260231 ?auto_260233 ) ) ( not ( = ?auto_260231 ?auto_260234 ) ) ( not ( = ?auto_260231 ?auto_260235 ) ) ( not ( = ?auto_260231 ?auto_260236 ) ) ( not ( = ?auto_260231 ?auto_260237 ) ) ( not ( = ?auto_260231 ?auto_260238 ) ) ( not ( = ?auto_260231 ?auto_260239 ) ) ( not ( = ?auto_260231 ?auto_260240 ) ) ( not ( = ?auto_260232 ?auto_260233 ) ) ( not ( = ?auto_260232 ?auto_260234 ) ) ( not ( = ?auto_260232 ?auto_260235 ) ) ( not ( = ?auto_260232 ?auto_260236 ) ) ( not ( = ?auto_260232 ?auto_260237 ) ) ( not ( = ?auto_260232 ?auto_260238 ) ) ( not ( = ?auto_260232 ?auto_260239 ) ) ( not ( = ?auto_260232 ?auto_260240 ) ) ( not ( = ?auto_260233 ?auto_260234 ) ) ( not ( = ?auto_260233 ?auto_260235 ) ) ( not ( = ?auto_260233 ?auto_260236 ) ) ( not ( = ?auto_260233 ?auto_260237 ) ) ( not ( = ?auto_260233 ?auto_260238 ) ) ( not ( = ?auto_260233 ?auto_260239 ) ) ( not ( = ?auto_260233 ?auto_260240 ) ) ( not ( = ?auto_260234 ?auto_260235 ) ) ( not ( = ?auto_260234 ?auto_260236 ) ) ( not ( = ?auto_260234 ?auto_260237 ) ) ( not ( = ?auto_260234 ?auto_260238 ) ) ( not ( = ?auto_260234 ?auto_260239 ) ) ( not ( = ?auto_260234 ?auto_260240 ) ) ( not ( = ?auto_260235 ?auto_260236 ) ) ( not ( = ?auto_260235 ?auto_260237 ) ) ( not ( = ?auto_260235 ?auto_260238 ) ) ( not ( = ?auto_260235 ?auto_260239 ) ) ( not ( = ?auto_260235 ?auto_260240 ) ) ( not ( = ?auto_260236 ?auto_260237 ) ) ( not ( = ?auto_260236 ?auto_260238 ) ) ( not ( = ?auto_260236 ?auto_260239 ) ) ( not ( = ?auto_260236 ?auto_260240 ) ) ( not ( = ?auto_260237 ?auto_260238 ) ) ( not ( = ?auto_260237 ?auto_260239 ) ) ( not ( = ?auto_260237 ?auto_260240 ) ) ( not ( = ?auto_260238 ?auto_260239 ) ) ( not ( = ?auto_260238 ?auto_260240 ) ) ( not ( = ?auto_260239 ?auto_260240 ) ) ( ON ?auto_260238 ?auto_260239 ) ( ON ?auto_260237 ?auto_260238 ) ( ON ?auto_260236 ?auto_260237 ) ( ON ?auto_260235 ?auto_260236 ) ( ON ?auto_260234 ?auto_260235 ) ( ON ?auto_260233 ?auto_260234 ) ( ON ?auto_260232 ?auto_260233 ) ( ON ?auto_260231 ?auto_260232 ) ( ON ?auto_260230 ?auto_260231 ) ( CLEAR ?auto_260228 ) ( ON ?auto_260229 ?auto_260230 ) ( CLEAR ?auto_260229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_260228 ?auto_260229 )
      ( MAKE-12PILE ?auto_260228 ?auto_260229 ?auto_260230 ?auto_260231 ?auto_260232 ?auto_260233 ?auto_260234 ?auto_260235 ?auto_260236 ?auto_260237 ?auto_260238 ?auto_260239 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_260253 - BLOCK
      ?auto_260254 - BLOCK
      ?auto_260255 - BLOCK
      ?auto_260256 - BLOCK
      ?auto_260257 - BLOCK
      ?auto_260258 - BLOCK
      ?auto_260259 - BLOCK
      ?auto_260260 - BLOCK
      ?auto_260261 - BLOCK
      ?auto_260262 - BLOCK
      ?auto_260263 - BLOCK
      ?auto_260264 - BLOCK
    )
    :vars
    (
      ?auto_260265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260264 ?auto_260265 ) ( ON-TABLE ?auto_260253 ) ( not ( = ?auto_260253 ?auto_260254 ) ) ( not ( = ?auto_260253 ?auto_260255 ) ) ( not ( = ?auto_260253 ?auto_260256 ) ) ( not ( = ?auto_260253 ?auto_260257 ) ) ( not ( = ?auto_260253 ?auto_260258 ) ) ( not ( = ?auto_260253 ?auto_260259 ) ) ( not ( = ?auto_260253 ?auto_260260 ) ) ( not ( = ?auto_260253 ?auto_260261 ) ) ( not ( = ?auto_260253 ?auto_260262 ) ) ( not ( = ?auto_260253 ?auto_260263 ) ) ( not ( = ?auto_260253 ?auto_260264 ) ) ( not ( = ?auto_260253 ?auto_260265 ) ) ( not ( = ?auto_260254 ?auto_260255 ) ) ( not ( = ?auto_260254 ?auto_260256 ) ) ( not ( = ?auto_260254 ?auto_260257 ) ) ( not ( = ?auto_260254 ?auto_260258 ) ) ( not ( = ?auto_260254 ?auto_260259 ) ) ( not ( = ?auto_260254 ?auto_260260 ) ) ( not ( = ?auto_260254 ?auto_260261 ) ) ( not ( = ?auto_260254 ?auto_260262 ) ) ( not ( = ?auto_260254 ?auto_260263 ) ) ( not ( = ?auto_260254 ?auto_260264 ) ) ( not ( = ?auto_260254 ?auto_260265 ) ) ( not ( = ?auto_260255 ?auto_260256 ) ) ( not ( = ?auto_260255 ?auto_260257 ) ) ( not ( = ?auto_260255 ?auto_260258 ) ) ( not ( = ?auto_260255 ?auto_260259 ) ) ( not ( = ?auto_260255 ?auto_260260 ) ) ( not ( = ?auto_260255 ?auto_260261 ) ) ( not ( = ?auto_260255 ?auto_260262 ) ) ( not ( = ?auto_260255 ?auto_260263 ) ) ( not ( = ?auto_260255 ?auto_260264 ) ) ( not ( = ?auto_260255 ?auto_260265 ) ) ( not ( = ?auto_260256 ?auto_260257 ) ) ( not ( = ?auto_260256 ?auto_260258 ) ) ( not ( = ?auto_260256 ?auto_260259 ) ) ( not ( = ?auto_260256 ?auto_260260 ) ) ( not ( = ?auto_260256 ?auto_260261 ) ) ( not ( = ?auto_260256 ?auto_260262 ) ) ( not ( = ?auto_260256 ?auto_260263 ) ) ( not ( = ?auto_260256 ?auto_260264 ) ) ( not ( = ?auto_260256 ?auto_260265 ) ) ( not ( = ?auto_260257 ?auto_260258 ) ) ( not ( = ?auto_260257 ?auto_260259 ) ) ( not ( = ?auto_260257 ?auto_260260 ) ) ( not ( = ?auto_260257 ?auto_260261 ) ) ( not ( = ?auto_260257 ?auto_260262 ) ) ( not ( = ?auto_260257 ?auto_260263 ) ) ( not ( = ?auto_260257 ?auto_260264 ) ) ( not ( = ?auto_260257 ?auto_260265 ) ) ( not ( = ?auto_260258 ?auto_260259 ) ) ( not ( = ?auto_260258 ?auto_260260 ) ) ( not ( = ?auto_260258 ?auto_260261 ) ) ( not ( = ?auto_260258 ?auto_260262 ) ) ( not ( = ?auto_260258 ?auto_260263 ) ) ( not ( = ?auto_260258 ?auto_260264 ) ) ( not ( = ?auto_260258 ?auto_260265 ) ) ( not ( = ?auto_260259 ?auto_260260 ) ) ( not ( = ?auto_260259 ?auto_260261 ) ) ( not ( = ?auto_260259 ?auto_260262 ) ) ( not ( = ?auto_260259 ?auto_260263 ) ) ( not ( = ?auto_260259 ?auto_260264 ) ) ( not ( = ?auto_260259 ?auto_260265 ) ) ( not ( = ?auto_260260 ?auto_260261 ) ) ( not ( = ?auto_260260 ?auto_260262 ) ) ( not ( = ?auto_260260 ?auto_260263 ) ) ( not ( = ?auto_260260 ?auto_260264 ) ) ( not ( = ?auto_260260 ?auto_260265 ) ) ( not ( = ?auto_260261 ?auto_260262 ) ) ( not ( = ?auto_260261 ?auto_260263 ) ) ( not ( = ?auto_260261 ?auto_260264 ) ) ( not ( = ?auto_260261 ?auto_260265 ) ) ( not ( = ?auto_260262 ?auto_260263 ) ) ( not ( = ?auto_260262 ?auto_260264 ) ) ( not ( = ?auto_260262 ?auto_260265 ) ) ( not ( = ?auto_260263 ?auto_260264 ) ) ( not ( = ?auto_260263 ?auto_260265 ) ) ( not ( = ?auto_260264 ?auto_260265 ) ) ( ON ?auto_260263 ?auto_260264 ) ( ON ?auto_260262 ?auto_260263 ) ( ON ?auto_260261 ?auto_260262 ) ( ON ?auto_260260 ?auto_260261 ) ( ON ?auto_260259 ?auto_260260 ) ( ON ?auto_260258 ?auto_260259 ) ( ON ?auto_260257 ?auto_260258 ) ( ON ?auto_260256 ?auto_260257 ) ( ON ?auto_260255 ?auto_260256 ) ( CLEAR ?auto_260253 ) ( ON ?auto_260254 ?auto_260255 ) ( CLEAR ?auto_260254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_260253 ?auto_260254 )
      ( MAKE-12PILE ?auto_260253 ?auto_260254 ?auto_260255 ?auto_260256 ?auto_260257 ?auto_260258 ?auto_260259 ?auto_260260 ?auto_260261 ?auto_260262 ?auto_260263 ?auto_260264 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_260278 - BLOCK
      ?auto_260279 - BLOCK
      ?auto_260280 - BLOCK
      ?auto_260281 - BLOCK
      ?auto_260282 - BLOCK
      ?auto_260283 - BLOCK
      ?auto_260284 - BLOCK
      ?auto_260285 - BLOCK
      ?auto_260286 - BLOCK
      ?auto_260287 - BLOCK
      ?auto_260288 - BLOCK
      ?auto_260289 - BLOCK
    )
    :vars
    (
      ?auto_260290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260289 ?auto_260290 ) ( not ( = ?auto_260278 ?auto_260279 ) ) ( not ( = ?auto_260278 ?auto_260280 ) ) ( not ( = ?auto_260278 ?auto_260281 ) ) ( not ( = ?auto_260278 ?auto_260282 ) ) ( not ( = ?auto_260278 ?auto_260283 ) ) ( not ( = ?auto_260278 ?auto_260284 ) ) ( not ( = ?auto_260278 ?auto_260285 ) ) ( not ( = ?auto_260278 ?auto_260286 ) ) ( not ( = ?auto_260278 ?auto_260287 ) ) ( not ( = ?auto_260278 ?auto_260288 ) ) ( not ( = ?auto_260278 ?auto_260289 ) ) ( not ( = ?auto_260278 ?auto_260290 ) ) ( not ( = ?auto_260279 ?auto_260280 ) ) ( not ( = ?auto_260279 ?auto_260281 ) ) ( not ( = ?auto_260279 ?auto_260282 ) ) ( not ( = ?auto_260279 ?auto_260283 ) ) ( not ( = ?auto_260279 ?auto_260284 ) ) ( not ( = ?auto_260279 ?auto_260285 ) ) ( not ( = ?auto_260279 ?auto_260286 ) ) ( not ( = ?auto_260279 ?auto_260287 ) ) ( not ( = ?auto_260279 ?auto_260288 ) ) ( not ( = ?auto_260279 ?auto_260289 ) ) ( not ( = ?auto_260279 ?auto_260290 ) ) ( not ( = ?auto_260280 ?auto_260281 ) ) ( not ( = ?auto_260280 ?auto_260282 ) ) ( not ( = ?auto_260280 ?auto_260283 ) ) ( not ( = ?auto_260280 ?auto_260284 ) ) ( not ( = ?auto_260280 ?auto_260285 ) ) ( not ( = ?auto_260280 ?auto_260286 ) ) ( not ( = ?auto_260280 ?auto_260287 ) ) ( not ( = ?auto_260280 ?auto_260288 ) ) ( not ( = ?auto_260280 ?auto_260289 ) ) ( not ( = ?auto_260280 ?auto_260290 ) ) ( not ( = ?auto_260281 ?auto_260282 ) ) ( not ( = ?auto_260281 ?auto_260283 ) ) ( not ( = ?auto_260281 ?auto_260284 ) ) ( not ( = ?auto_260281 ?auto_260285 ) ) ( not ( = ?auto_260281 ?auto_260286 ) ) ( not ( = ?auto_260281 ?auto_260287 ) ) ( not ( = ?auto_260281 ?auto_260288 ) ) ( not ( = ?auto_260281 ?auto_260289 ) ) ( not ( = ?auto_260281 ?auto_260290 ) ) ( not ( = ?auto_260282 ?auto_260283 ) ) ( not ( = ?auto_260282 ?auto_260284 ) ) ( not ( = ?auto_260282 ?auto_260285 ) ) ( not ( = ?auto_260282 ?auto_260286 ) ) ( not ( = ?auto_260282 ?auto_260287 ) ) ( not ( = ?auto_260282 ?auto_260288 ) ) ( not ( = ?auto_260282 ?auto_260289 ) ) ( not ( = ?auto_260282 ?auto_260290 ) ) ( not ( = ?auto_260283 ?auto_260284 ) ) ( not ( = ?auto_260283 ?auto_260285 ) ) ( not ( = ?auto_260283 ?auto_260286 ) ) ( not ( = ?auto_260283 ?auto_260287 ) ) ( not ( = ?auto_260283 ?auto_260288 ) ) ( not ( = ?auto_260283 ?auto_260289 ) ) ( not ( = ?auto_260283 ?auto_260290 ) ) ( not ( = ?auto_260284 ?auto_260285 ) ) ( not ( = ?auto_260284 ?auto_260286 ) ) ( not ( = ?auto_260284 ?auto_260287 ) ) ( not ( = ?auto_260284 ?auto_260288 ) ) ( not ( = ?auto_260284 ?auto_260289 ) ) ( not ( = ?auto_260284 ?auto_260290 ) ) ( not ( = ?auto_260285 ?auto_260286 ) ) ( not ( = ?auto_260285 ?auto_260287 ) ) ( not ( = ?auto_260285 ?auto_260288 ) ) ( not ( = ?auto_260285 ?auto_260289 ) ) ( not ( = ?auto_260285 ?auto_260290 ) ) ( not ( = ?auto_260286 ?auto_260287 ) ) ( not ( = ?auto_260286 ?auto_260288 ) ) ( not ( = ?auto_260286 ?auto_260289 ) ) ( not ( = ?auto_260286 ?auto_260290 ) ) ( not ( = ?auto_260287 ?auto_260288 ) ) ( not ( = ?auto_260287 ?auto_260289 ) ) ( not ( = ?auto_260287 ?auto_260290 ) ) ( not ( = ?auto_260288 ?auto_260289 ) ) ( not ( = ?auto_260288 ?auto_260290 ) ) ( not ( = ?auto_260289 ?auto_260290 ) ) ( ON ?auto_260288 ?auto_260289 ) ( ON ?auto_260287 ?auto_260288 ) ( ON ?auto_260286 ?auto_260287 ) ( ON ?auto_260285 ?auto_260286 ) ( ON ?auto_260284 ?auto_260285 ) ( ON ?auto_260283 ?auto_260284 ) ( ON ?auto_260282 ?auto_260283 ) ( ON ?auto_260281 ?auto_260282 ) ( ON ?auto_260280 ?auto_260281 ) ( ON ?auto_260279 ?auto_260280 ) ( ON ?auto_260278 ?auto_260279 ) ( CLEAR ?auto_260278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_260278 )
      ( MAKE-12PILE ?auto_260278 ?auto_260279 ?auto_260280 ?auto_260281 ?auto_260282 ?auto_260283 ?auto_260284 ?auto_260285 ?auto_260286 ?auto_260287 ?auto_260288 ?auto_260289 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_260303 - BLOCK
      ?auto_260304 - BLOCK
      ?auto_260305 - BLOCK
      ?auto_260306 - BLOCK
      ?auto_260307 - BLOCK
      ?auto_260308 - BLOCK
      ?auto_260309 - BLOCK
      ?auto_260310 - BLOCK
      ?auto_260311 - BLOCK
      ?auto_260312 - BLOCK
      ?auto_260313 - BLOCK
      ?auto_260314 - BLOCK
    )
    :vars
    (
      ?auto_260315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260314 ?auto_260315 ) ( not ( = ?auto_260303 ?auto_260304 ) ) ( not ( = ?auto_260303 ?auto_260305 ) ) ( not ( = ?auto_260303 ?auto_260306 ) ) ( not ( = ?auto_260303 ?auto_260307 ) ) ( not ( = ?auto_260303 ?auto_260308 ) ) ( not ( = ?auto_260303 ?auto_260309 ) ) ( not ( = ?auto_260303 ?auto_260310 ) ) ( not ( = ?auto_260303 ?auto_260311 ) ) ( not ( = ?auto_260303 ?auto_260312 ) ) ( not ( = ?auto_260303 ?auto_260313 ) ) ( not ( = ?auto_260303 ?auto_260314 ) ) ( not ( = ?auto_260303 ?auto_260315 ) ) ( not ( = ?auto_260304 ?auto_260305 ) ) ( not ( = ?auto_260304 ?auto_260306 ) ) ( not ( = ?auto_260304 ?auto_260307 ) ) ( not ( = ?auto_260304 ?auto_260308 ) ) ( not ( = ?auto_260304 ?auto_260309 ) ) ( not ( = ?auto_260304 ?auto_260310 ) ) ( not ( = ?auto_260304 ?auto_260311 ) ) ( not ( = ?auto_260304 ?auto_260312 ) ) ( not ( = ?auto_260304 ?auto_260313 ) ) ( not ( = ?auto_260304 ?auto_260314 ) ) ( not ( = ?auto_260304 ?auto_260315 ) ) ( not ( = ?auto_260305 ?auto_260306 ) ) ( not ( = ?auto_260305 ?auto_260307 ) ) ( not ( = ?auto_260305 ?auto_260308 ) ) ( not ( = ?auto_260305 ?auto_260309 ) ) ( not ( = ?auto_260305 ?auto_260310 ) ) ( not ( = ?auto_260305 ?auto_260311 ) ) ( not ( = ?auto_260305 ?auto_260312 ) ) ( not ( = ?auto_260305 ?auto_260313 ) ) ( not ( = ?auto_260305 ?auto_260314 ) ) ( not ( = ?auto_260305 ?auto_260315 ) ) ( not ( = ?auto_260306 ?auto_260307 ) ) ( not ( = ?auto_260306 ?auto_260308 ) ) ( not ( = ?auto_260306 ?auto_260309 ) ) ( not ( = ?auto_260306 ?auto_260310 ) ) ( not ( = ?auto_260306 ?auto_260311 ) ) ( not ( = ?auto_260306 ?auto_260312 ) ) ( not ( = ?auto_260306 ?auto_260313 ) ) ( not ( = ?auto_260306 ?auto_260314 ) ) ( not ( = ?auto_260306 ?auto_260315 ) ) ( not ( = ?auto_260307 ?auto_260308 ) ) ( not ( = ?auto_260307 ?auto_260309 ) ) ( not ( = ?auto_260307 ?auto_260310 ) ) ( not ( = ?auto_260307 ?auto_260311 ) ) ( not ( = ?auto_260307 ?auto_260312 ) ) ( not ( = ?auto_260307 ?auto_260313 ) ) ( not ( = ?auto_260307 ?auto_260314 ) ) ( not ( = ?auto_260307 ?auto_260315 ) ) ( not ( = ?auto_260308 ?auto_260309 ) ) ( not ( = ?auto_260308 ?auto_260310 ) ) ( not ( = ?auto_260308 ?auto_260311 ) ) ( not ( = ?auto_260308 ?auto_260312 ) ) ( not ( = ?auto_260308 ?auto_260313 ) ) ( not ( = ?auto_260308 ?auto_260314 ) ) ( not ( = ?auto_260308 ?auto_260315 ) ) ( not ( = ?auto_260309 ?auto_260310 ) ) ( not ( = ?auto_260309 ?auto_260311 ) ) ( not ( = ?auto_260309 ?auto_260312 ) ) ( not ( = ?auto_260309 ?auto_260313 ) ) ( not ( = ?auto_260309 ?auto_260314 ) ) ( not ( = ?auto_260309 ?auto_260315 ) ) ( not ( = ?auto_260310 ?auto_260311 ) ) ( not ( = ?auto_260310 ?auto_260312 ) ) ( not ( = ?auto_260310 ?auto_260313 ) ) ( not ( = ?auto_260310 ?auto_260314 ) ) ( not ( = ?auto_260310 ?auto_260315 ) ) ( not ( = ?auto_260311 ?auto_260312 ) ) ( not ( = ?auto_260311 ?auto_260313 ) ) ( not ( = ?auto_260311 ?auto_260314 ) ) ( not ( = ?auto_260311 ?auto_260315 ) ) ( not ( = ?auto_260312 ?auto_260313 ) ) ( not ( = ?auto_260312 ?auto_260314 ) ) ( not ( = ?auto_260312 ?auto_260315 ) ) ( not ( = ?auto_260313 ?auto_260314 ) ) ( not ( = ?auto_260313 ?auto_260315 ) ) ( not ( = ?auto_260314 ?auto_260315 ) ) ( ON ?auto_260313 ?auto_260314 ) ( ON ?auto_260312 ?auto_260313 ) ( ON ?auto_260311 ?auto_260312 ) ( ON ?auto_260310 ?auto_260311 ) ( ON ?auto_260309 ?auto_260310 ) ( ON ?auto_260308 ?auto_260309 ) ( ON ?auto_260307 ?auto_260308 ) ( ON ?auto_260306 ?auto_260307 ) ( ON ?auto_260305 ?auto_260306 ) ( ON ?auto_260304 ?auto_260305 ) ( ON ?auto_260303 ?auto_260304 ) ( CLEAR ?auto_260303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_260303 )
      ( MAKE-12PILE ?auto_260303 ?auto_260304 ?auto_260305 ?auto_260306 ?auto_260307 ?auto_260308 ?auto_260309 ?auto_260310 ?auto_260311 ?auto_260312 ?auto_260313 ?auto_260314 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260329 - BLOCK
      ?auto_260330 - BLOCK
      ?auto_260331 - BLOCK
      ?auto_260332 - BLOCK
      ?auto_260333 - BLOCK
      ?auto_260334 - BLOCK
      ?auto_260335 - BLOCK
      ?auto_260336 - BLOCK
      ?auto_260337 - BLOCK
      ?auto_260338 - BLOCK
      ?auto_260339 - BLOCK
      ?auto_260340 - BLOCK
      ?auto_260341 - BLOCK
    )
    :vars
    (
      ?auto_260342 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_260340 ) ( ON ?auto_260341 ?auto_260342 ) ( CLEAR ?auto_260341 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_260329 ) ( ON ?auto_260330 ?auto_260329 ) ( ON ?auto_260331 ?auto_260330 ) ( ON ?auto_260332 ?auto_260331 ) ( ON ?auto_260333 ?auto_260332 ) ( ON ?auto_260334 ?auto_260333 ) ( ON ?auto_260335 ?auto_260334 ) ( ON ?auto_260336 ?auto_260335 ) ( ON ?auto_260337 ?auto_260336 ) ( ON ?auto_260338 ?auto_260337 ) ( ON ?auto_260339 ?auto_260338 ) ( ON ?auto_260340 ?auto_260339 ) ( not ( = ?auto_260329 ?auto_260330 ) ) ( not ( = ?auto_260329 ?auto_260331 ) ) ( not ( = ?auto_260329 ?auto_260332 ) ) ( not ( = ?auto_260329 ?auto_260333 ) ) ( not ( = ?auto_260329 ?auto_260334 ) ) ( not ( = ?auto_260329 ?auto_260335 ) ) ( not ( = ?auto_260329 ?auto_260336 ) ) ( not ( = ?auto_260329 ?auto_260337 ) ) ( not ( = ?auto_260329 ?auto_260338 ) ) ( not ( = ?auto_260329 ?auto_260339 ) ) ( not ( = ?auto_260329 ?auto_260340 ) ) ( not ( = ?auto_260329 ?auto_260341 ) ) ( not ( = ?auto_260329 ?auto_260342 ) ) ( not ( = ?auto_260330 ?auto_260331 ) ) ( not ( = ?auto_260330 ?auto_260332 ) ) ( not ( = ?auto_260330 ?auto_260333 ) ) ( not ( = ?auto_260330 ?auto_260334 ) ) ( not ( = ?auto_260330 ?auto_260335 ) ) ( not ( = ?auto_260330 ?auto_260336 ) ) ( not ( = ?auto_260330 ?auto_260337 ) ) ( not ( = ?auto_260330 ?auto_260338 ) ) ( not ( = ?auto_260330 ?auto_260339 ) ) ( not ( = ?auto_260330 ?auto_260340 ) ) ( not ( = ?auto_260330 ?auto_260341 ) ) ( not ( = ?auto_260330 ?auto_260342 ) ) ( not ( = ?auto_260331 ?auto_260332 ) ) ( not ( = ?auto_260331 ?auto_260333 ) ) ( not ( = ?auto_260331 ?auto_260334 ) ) ( not ( = ?auto_260331 ?auto_260335 ) ) ( not ( = ?auto_260331 ?auto_260336 ) ) ( not ( = ?auto_260331 ?auto_260337 ) ) ( not ( = ?auto_260331 ?auto_260338 ) ) ( not ( = ?auto_260331 ?auto_260339 ) ) ( not ( = ?auto_260331 ?auto_260340 ) ) ( not ( = ?auto_260331 ?auto_260341 ) ) ( not ( = ?auto_260331 ?auto_260342 ) ) ( not ( = ?auto_260332 ?auto_260333 ) ) ( not ( = ?auto_260332 ?auto_260334 ) ) ( not ( = ?auto_260332 ?auto_260335 ) ) ( not ( = ?auto_260332 ?auto_260336 ) ) ( not ( = ?auto_260332 ?auto_260337 ) ) ( not ( = ?auto_260332 ?auto_260338 ) ) ( not ( = ?auto_260332 ?auto_260339 ) ) ( not ( = ?auto_260332 ?auto_260340 ) ) ( not ( = ?auto_260332 ?auto_260341 ) ) ( not ( = ?auto_260332 ?auto_260342 ) ) ( not ( = ?auto_260333 ?auto_260334 ) ) ( not ( = ?auto_260333 ?auto_260335 ) ) ( not ( = ?auto_260333 ?auto_260336 ) ) ( not ( = ?auto_260333 ?auto_260337 ) ) ( not ( = ?auto_260333 ?auto_260338 ) ) ( not ( = ?auto_260333 ?auto_260339 ) ) ( not ( = ?auto_260333 ?auto_260340 ) ) ( not ( = ?auto_260333 ?auto_260341 ) ) ( not ( = ?auto_260333 ?auto_260342 ) ) ( not ( = ?auto_260334 ?auto_260335 ) ) ( not ( = ?auto_260334 ?auto_260336 ) ) ( not ( = ?auto_260334 ?auto_260337 ) ) ( not ( = ?auto_260334 ?auto_260338 ) ) ( not ( = ?auto_260334 ?auto_260339 ) ) ( not ( = ?auto_260334 ?auto_260340 ) ) ( not ( = ?auto_260334 ?auto_260341 ) ) ( not ( = ?auto_260334 ?auto_260342 ) ) ( not ( = ?auto_260335 ?auto_260336 ) ) ( not ( = ?auto_260335 ?auto_260337 ) ) ( not ( = ?auto_260335 ?auto_260338 ) ) ( not ( = ?auto_260335 ?auto_260339 ) ) ( not ( = ?auto_260335 ?auto_260340 ) ) ( not ( = ?auto_260335 ?auto_260341 ) ) ( not ( = ?auto_260335 ?auto_260342 ) ) ( not ( = ?auto_260336 ?auto_260337 ) ) ( not ( = ?auto_260336 ?auto_260338 ) ) ( not ( = ?auto_260336 ?auto_260339 ) ) ( not ( = ?auto_260336 ?auto_260340 ) ) ( not ( = ?auto_260336 ?auto_260341 ) ) ( not ( = ?auto_260336 ?auto_260342 ) ) ( not ( = ?auto_260337 ?auto_260338 ) ) ( not ( = ?auto_260337 ?auto_260339 ) ) ( not ( = ?auto_260337 ?auto_260340 ) ) ( not ( = ?auto_260337 ?auto_260341 ) ) ( not ( = ?auto_260337 ?auto_260342 ) ) ( not ( = ?auto_260338 ?auto_260339 ) ) ( not ( = ?auto_260338 ?auto_260340 ) ) ( not ( = ?auto_260338 ?auto_260341 ) ) ( not ( = ?auto_260338 ?auto_260342 ) ) ( not ( = ?auto_260339 ?auto_260340 ) ) ( not ( = ?auto_260339 ?auto_260341 ) ) ( not ( = ?auto_260339 ?auto_260342 ) ) ( not ( = ?auto_260340 ?auto_260341 ) ) ( not ( = ?auto_260340 ?auto_260342 ) ) ( not ( = ?auto_260341 ?auto_260342 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_260341 ?auto_260342 )
      ( !STACK ?auto_260341 ?auto_260340 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260356 - BLOCK
      ?auto_260357 - BLOCK
      ?auto_260358 - BLOCK
      ?auto_260359 - BLOCK
      ?auto_260360 - BLOCK
      ?auto_260361 - BLOCK
      ?auto_260362 - BLOCK
      ?auto_260363 - BLOCK
      ?auto_260364 - BLOCK
      ?auto_260365 - BLOCK
      ?auto_260366 - BLOCK
      ?auto_260367 - BLOCK
      ?auto_260368 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_260367 ) ( ON-TABLE ?auto_260368 ) ( CLEAR ?auto_260368 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_260356 ) ( ON ?auto_260357 ?auto_260356 ) ( ON ?auto_260358 ?auto_260357 ) ( ON ?auto_260359 ?auto_260358 ) ( ON ?auto_260360 ?auto_260359 ) ( ON ?auto_260361 ?auto_260360 ) ( ON ?auto_260362 ?auto_260361 ) ( ON ?auto_260363 ?auto_260362 ) ( ON ?auto_260364 ?auto_260363 ) ( ON ?auto_260365 ?auto_260364 ) ( ON ?auto_260366 ?auto_260365 ) ( ON ?auto_260367 ?auto_260366 ) ( not ( = ?auto_260356 ?auto_260357 ) ) ( not ( = ?auto_260356 ?auto_260358 ) ) ( not ( = ?auto_260356 ?auto_260359 ) ) ( not ( = ?auto_260356 ?auto_260360 ) ) ( not ( = ?auto_260356 ?auto_260361 ) ) ( not ( = ?auto_260356 ?auto_260362 ) ) ( not ( = ?auto_260356 ?auto_260363 ) ) ( not ( = ?auto_260356 ?auto_260364 ) ) ( not ( = ?auto_260356 ?auto_260365 ) ) ( not ( = ?auto_260356 ?auto_260366 ) ) ( not ( = ?auto_260356 ?auto_260367 ) ) ( not ( = ?auto_260356 ?auto_260368 ) ) ( not ( = ?auto_260357 ?auto_260358 ) ) ( not ( = ?auto_260357 ?auto_260359 ) ) ( not ( = ?auto_260357 ?auto_260360 ) ) ( not ( = ?auto_260357 ?auto_260361 ) ) ( not ( = ?auto_260357 ?auto_260362 ) ) ( not ( = ?auto_260357 ?auto_260363 ) ) ( not ( = ?auto_260357 ?auto_260364 ) ) ( not ( = ?auto_260357 ?auto_260365 ) ) ( not ( = ?auto_260357 ?auto_260366 ) ) ( not ( = ?auto_260357 ?auto_260367 ) ) ( not ( = ?auto_260357 ?auto_260368 ) ) ( not ( = ?auto_260358 ?auto_260359 ) ) ( not ( = ?auto_260358 ?auto_260360 ) ) ( not ( = ?auto_260358 ?auto_260361 ) ) ( not ( = ?auto_260358 ?auto_260362 ) ) ( not ( = ?auto_260358 ?auto_260363 ) ) ( not ( = ?auto_260358 ?auto_260364 ) ) ( not ( = ?auto_260358 ?auto_260365 ) ) ( not ( = ?auto_260358 ?auto_260366 ) ) ( not ( = ?auto_260358 ?auto_260367 ) ) ( not ( = ?auto_260358 ?auto_260368 ) ) ( not ( = ?auto_260359 ?auto_260360 ) ) ( not ( = ?auto_260359 ?auto_260361 ) ) ( not ( = ?auto_260359 ?auto_260362 ) ) ( not ( = ?auto_260359 ?auto_260363 ) ) ( not ( = ?auto_260359 ?auto_260364 ) ) ( not ( = ?auto_260359 ?auto_260365 ) ) ( not ( = ?auto_260359 ?auto_260366 ) ) ( not ( = ?auto_260359 ?auto_260367 ) ) ( not ( = ?auto_260359 ?auto_260368 ) ) ( not ( = ?auto_260360 ?auto_260361 ) ) ( not ( = ?auto_260360 ?auto_260362 ) ) ( not ( = ?auto_260360 ?auto_260363 ) ) ( not ( = ?auto_260360 ?auto_260364 ) ) ( not ( = ?auto_260360 ?auto_260365 ) ) ( not ( = ?auto_260360 ?auto_260366 ) ) ( not ( = ?auto_260360 ?auto_260367 ) ) ( not ( = ?auto_260360 ?auto_260368 ) ) ( not ( = ?auto_260361 ?auto_260362 ) ) ( not ( = ?auto_260361 ?auto_260363 ) ) ( not ( = ?auto_260361 ?auto_260364 ) ) ( not ( = ?auto_260361 ?auto_260365 ) ) ( not ( = ?auto_260361 ?auto_260366 ) ) ( not ( = ?auto_260361 ?auto_260367 ) ) ( not ( = ?auto_260361 ?auto_260368 ) ) ( not ( = ?auto_260362 ?auto_260363 ) ) ( not ( = ?auto_260362 ?auto_260364 ) ) ( not ( = ?auto_260362 ?auto_260365 ) ) ( not ( = ?auto_260362 ?auto_260366 ) ) ( not ( = ?auto_260362 ?auto_260367 ) ) ( not ( = ?auto_260362 ?auto_260368 ) ) ( not ( = ?auto_260363 ?auto_260364 ) ) ( not ( = ?auto_260363 ?auto_260365 ) ) ( not ( = ?auto_260363 ?auto_260366 ) ) ( not ( = ?auto_260363 ?auto_260367 ) ) ( not ( = ?auto_260363 ?auto_260368 ) ) ( not ( = ?auto_260364 ?auto_260365 ) ) ( not ( = ?auto_260364 ?auto_260366 ) ) ( not ( = ?auto_260364 ?auto_260367 ) ) ( not ( = ?auto_260364 ?auto_260368 ) ) ( not ( = ?auto_260365 ?auto_260366 ) ) ( not ( = ?auto_260365 ?auto_260367 ) ) ( not ( = ?auto_260365 ?auto_260368 ) ) ( not ( = ?auto_260366 ?auto_260367 ) ) ( not ( = ?auto_260366 ?auto_260368 ) ) ( not ( = ?auto_260367 ?auto_260368 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_260368 )
      ( !STACK ?auto_260368 ?auto_260367 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260382 - BLOCK
      ?auto_260383 - BLOCK
      ?auto_260384 - BLOCK
      ?auto_260385 - BLOCK
      ?auto_260386 - BLOCK
      ?auto_260387 - BLOCK
      ?auto_260388 - BLOCK
      ?auto_260389 - BLOCK
      ?auto_260390 - BLOCK
      ?auto_260391 - BLOCK
      ?auto_260392 - BLOCK
      ?auto_260393 - BLOCK
      ?auto_260394 - BLOCK
    )
    :vars
    (
      ?auto_260395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260394 ?auto_260395 ) ( ON-TABLE ?auto_260382 ) ( ON ?auto_260383 ?auto_260382 ) ( ON ?auto_260384 ?auto_260383 ) ( ON ?auto_260385 ?auto_260384 ) ( ON ?auto_260386 ?auto_260385 ) ( ON ?auto_260387 ?auto_260386 ) ( ON ?auto_260388 ?auto_260387 ) ( ON ?auto_260389 ?auto_260388 ) ( ON ?auto_260390 ?auto_260389 ) ( ON ?auto_260391 ?auto_260390 ) ( ON ?auto_260392 ?auto_260391 ) ( not ( = ?auto_260382 ?auto_260383 ) ) ( not ( = ?auto_260382 ?auto_260384 ) ) ( not ( = ?auto_260382 ?auto_260385 ) ) ( not ( = ?auto_260382 ?auto_260386 ) ) ( not ( = ?auto_260382 ?auto_260387 ) ) ( not ( = ?auto_260382 ?auto_260388 ) ) ( not ( = ?auto_260382 ?auto_260389 ) ) ( not ( = ?auto_260382 ?auto_260390 ) ) ( not ( = ?auto_260382 ?auto_260391 ) ) ( not ( = ?auto_260382 ?auto_260392 ) ) ( not ( = ?auto_260382 ?auto_260393 ) ) ( not ( = ?auto_260382 ?auto_260394 ) ) ( not ( = ?auto_260382 ?auto_260395 ) ) ( not ( = ?auto_260383 ?auto_260384 ) ) ( not ( = ?auto_260383 ?auto_260385 ) ) ( not ( = ?auto_260383 ?auto_260386 ) ) ( not ( = ?auto_260383 ?auto_260387 ) ) ( not ( = ?auto_260383 ?auto_260388 ) ) ( not ( = ?auto_260383 ?auto_260389 ) ) ( not ( = ?auto_260383 ?auto_260390 ) ) ( not ( = ?auto_260383 ?auto_260391 ) ) ( not ( = ?auto_260383 ?auto_260392 ) ) ( not ( = ?auto_260383 ?auto_260393 ) ) ( not ( = ?auto_260383 ?auto_260394 ) ) ( not ( = ?auto_260383 ?auto_260395 ) ) ( not ( = ?auto_260384 ?auto_260385 ) ) ( not ( = ?auto_260384 ?auto_260386 ) ) ( not ( = ?auto_260384 ?auto_260387 ) ) ( not ( = ?auto_260384 ?auto_260388 ) ) ( not ( = ?auto_260384 ?auto_260389 ) ) ( not ( = ?auto_260384 ?auto_260390 ) ) ( not ( = ?auto_260384 ?auto_260391 ) ) ( not ( = ?auto_260384 ?auto_260392 ) ) ( not ( = ?auto_260384 ?auto_260393 ) ) ( not ( = ?auto_260384 ?auto_260394 ) ) ( not ( = ?auto_260384 ?auto_260395 ) ) ( not ( = ?auto_260385 ?auto_260386 ) ) ( not ( = ?auto_260385 ?auto_260387 ) ) ( not ( = ?auto_260385 ?auto_260388 ) ) ( not ( = ?auto_260385 ?auto_260389 ) ) ( not ( = ?auto_260385 ?auto_260390 ) ) ( not ( = ?auto_260385 ?auto_260391 ) ) ( not ( = ?auto_260385 ?auto_260392 ) ) ( not ( = ?auto_260385 ?auto_260393 ) ) ( not ( = ?auto_260385 ?auto_260394 ) ) ( not ( = ?auto_260385 ?auto_260395 ) ) ( not ( = ?auto_260386 ?auto_260387 ) ) ( not ( = ?auto_260386 ?auto_260388 ) ) ( not ( = ?auto_260386 ?auto_260389 ) ) ( not ( = ?auto_260386 ?auto_260390 ) ) ( not ( = ?auto_260386 ?auto_260391 ) ) ( not ( = ?auto_260386 ?auto_260392 ) ) ( not ( = ?auto_260386 ?auto_260393 ) ) ( not ( = ?auto_260386 ?auto_260394 ) ) ( not ( = ?auto_260386 ?auto_260395 ) ) ( not ( = ?auto_260387 ?auto_260388 ) ) ( not ( = ?auto_260387 ?auto_260389 ) ) ( not ( = ?auto_260387 ?auto_260390 ) ) ( not ( = ?auto_260387 ?auto_260391 ) ) ( not ( = ?auto_260387 ?auto_260392 ) ) ( not ( = ?auto_260387 ?auto_260393 ) ) ( not ( = ?auto_260387 ?auto_260394 ) ) ( not ( = ?auto_260387 ?auto_260395 ) ) ( not ( = ?auto_260388 ?auto_260389 ) ) ( not ( = ?auto_260388 ?auto_260390 ) ) ( not ( = ?auto_260388 ?auto_260391 ) ) ( not ( = ?auto_260388 ?auto_260392 ) ) ( not ( = ?auto_260388 ?auto_260393 ) ) ( not ( = ?auto_260388 ?auto_260394 ) ) ( not ( = ?auto_260388 ?auto_260395 ) ) ( not ( = ?auto_260389 ?auto_260390 ) ) ( not ( = ?auto_260389 ?auto_260391 ) ) ( not ( = ?auto_260389 ?auto_260392 ) ) ( not ( = ?auto_260389 ?auto_260393 ) ) ( not ( = ?auto_260389 ?auto_260394 ) ) ( not ( = ?auto_260389 ?auto_260395 ) ) ( not ( = ?auto_260390 ?auto_260391 ) ) ( not ( = ?auto_260390 ?auto_260392 ) ) ( not ( = ?auto_260390 ?auto_260393 ) ) ( not ( = ?auto_260390 ?auto_260394 ) ) ( not ( = ?auto_260390 ?auto_260395 ) ) ( not ( = ?auto_260391 ?auto_260392 ) ) ( not ( = ?auto_260391 ?auto_260393 ) ) ( not ( = ?auto_260391 ?auto_260394 ) ) ( not ( = ?auto_260391 ?auto_260395 ) ) ( not ( = ?auto_260392 ?auto_260393 ) ) ( not ( = ?auto_260392 ?auto_260394 ) ) ( not ( = ?auto_260392 ?auto_260395 ) ) ( not ( = ?auto_260393 ?auto_260394 ) ) ( not ( = ?auto_260393 ?auto_260395 ) ) ( not ( = ?auto_260394 ?auto_260395 ) ) ( CLEAR ?auto_260392 ) ( ON ?auto_260393 ?auto_260394 ) ( CLEAR ?auto_260393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_260382 ?auto_260383 ?auto_260384 ?auto_260385 ?auto_260386 ?auto_260387 ?auto_260388 ?auto_260389 ?auto_260390 ?auto_260391 ?auto_260392 ?auto_260393 )
      ( MAKE-13PILE ?auto_260382 ?auto_260383 ?auto_260384 ?auto_260385 ?auto_260386 ?auto_260387 ?auto_260388 ?auto_260389 ?auto_260390 ?auto_260391 ?auto_260392 ?auto_260393 ?auto_260394 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260409 - BLOCK
      ?auto_260410 - BLOCK
      ?auto_260411 - BLOCK
      ?auto_260412 - BLOCK
      ?auto_260413 - BLOCK
      ?auto_260414 - BLOCK
      ?auto_260415 - BLOCK
      ?auto_260416 - BLOCK
      ?auto_260417 - BLOCK
      ?auto_260418 - BLOCK
      ?auto_260419 - BLOCK
      ?auto_260420 - BLOCK
      ?auto_260421 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_260421 ) ( ON-TABLE ?auto_260409 ) ( ON ?auto_260410 ?auto_260409 ) ( ON ?auto_260411 ?auto_260410 ) ( ON ?auto_260412 ?auto_260411 ) ( ON ?auto_260413 ?auto_260412 ) ( ON ?auto_260414 ?auto_260413 ) ( ON ?auto_260415 ?auto_260414 ) ( ON ?auto_260416 ?auto_260415 ) ( ON ?auto_260417 ?auto_260416 ) ( ON ?auto_260418 ?auto_260417 ) ( ON ?auto_260419 ?auto_260418 ) ( not ( = ?auto_260409 ?auto_260410 ) ) ( not ( = ?auto_260409 ?auto_260411 ) ) ( not ( = ?auto_260409 ?auto_260412 ) ) ( not ( = ?auto_260409 ?auto_260413 ) ) ( not ( = ?auto_260409 ?auto_260414 ) ) ( not ( = ?auto_260409 ?auto_260415 ) ) ( not ( = ?auto_260409 ?auto_260416 ) ) ( not ( = ?auto_260409 ?auto_260417 ) ) ( not ( = ?auto_260409 ?auto_260418 ) ) ( not ( = ?auto_260409 ?auto_260419 ) ) ( not ( = ?auto_260409 ?auto_260420 ) ) ( not ( = ?auto_260409 ?auto_260421 ) ) ( not ( = ?auto_260410 ?auto_260411 ) ) ( not ( = ?auto_260410 ?auto_260412 ) ) ( not ( = ?auto_260410 ?auto_260413 ) ) ( not ( = ?auto_260410 ?auto_260414 ) ) ( not ( = ?auto_260410 ?auto_260415 ) ) ( not ( = ?auto_260410 ?auto_260416 ) ) ( not ( = ?auto_260410 ?auto_260417 ) ) ( not ( = ?auto_260410 ?auto_260418 ) ) ( not ( = ?auto_260410 ?auto_260419 ) ) ( not ( = ?auto_260410 ?auto_260420 ) ) ( not ( = ?auto_260410 ?auto_260421 ) ) ( not ( = ?auto_260411 ?auto_260412 ) ) ( not ( = ?auto_260411 ?auto_260413 ) ) ( not ( = ?auto_260411 ?auto_260414 ) ) ( not ( = ?auto_260411 ?auto_260415 ) ) ( not ( = ?auto_260411 ?auto_260416 ) ) ( not ( = ?auto_260411 ?auto_260417 ) ) ( not ( = ?auto_260411 ?auto_260418 ) ) ( not ( = ?auto_260411 ?auto_260419 ) ) ( not ( = ?auto_260411 ?auto_260420 ) ) ( not ( = ?auto_260411 ?auto_260421 ) ) ( not ( = ?auto_260412 ?auto_260413 ) ) ( not ( = ?auto_260412 ?auto_260414 ) ) ( not ( = ?auto_260412 ?auto_260415 ) ) ( not ( = ?auto_260412 ?auto_260416 ) ) ( not ( = ?auto_260412 ?auto_260417 ) ) ( not ( = ?auto_260412 ?auto_260418 ) ) ( not ( = ?auto_260412 ?auto_260419 ) ) ( not ( = ?auto_260412 ?auto_260420 ) ) ( not ( = ?auto_260412 ?auto_260421 ) ) ( not ( = ?auto_260413 ?auto_260414 ) ) ( not ( = ?auto_260413 ?auto_260415 ) ) ( not ( = ?auto_260413 ?auto_260416 ) ) ( not ( = ?auto_260413 ?auto_260417 ) ) ( not ( = ?auto_260413 ?auto_260418 ) ) ( not ( = ?auto_260413 ?auto_260419 ) ) ( not ( = ?auto_260413 ?auto_260420 ) ) ( not ( = ?auto_260413 ?auto_260421 ) ) ( not ( = ?auto_260414 ?auto_260415 ) ) ( not ( = ?auto_260414 ?auto_260416 ) ) ( not ( = ?auto_260414 ?auto_260417 ) ) ( not ( = ?auto_260414 ?auto_260418 ) ) ( not ( = ?auto_260414 ?auto_260419 ) ) ( not ( = ?auto_260414 ?auto_260420 ) ) ( not ( = ?auto_260414 ?auto_260421 ) ) ( not ( = ?auto_260415 ?auto_260416 ) ) ( not ( = ?auto_260415 ?auto_260417 ) ) ( not ( = ?auto_260415 ?auto_260418 ) ) ( not ( = ?auto_260415 ?auto_260419 ) ) ( not ( = ?auto_260415 ?auto_260420 ) ) ( not ( = ?auto_260415 ?auto_260421 ) ) ( not ( = ?auto_260416 ?auto_260417 ) ) ( not ( = ?auto_260416 ?auto_260418 ) ) ( not ( = ?auto_260416 ?auto_260419 ) ) ( not ( = ?auto_260416 ?auto_260420 ) ) ( not ( = ?auto_260416 ?auto_260421 ) ) ( not ( = ?auto_260417 ?auto_260418 ) ) ( not ( = ?auto_260417 ?auto_260419 ) ) ( not ( = ?auto_260417 ?auto_260420 ) ) ( not ( = ?auto_260417 ?auto_260421 ) ) ( not ( = ?auto_260418 ?auto_260419 ) ) ( not ( = ?auto_260418 ?auto_260420 ) ) ( not ( = ?auto_260418 ?auto_260421 ) ) ( not ( = ?auto_260419 ?auto_260420 ) ) ( not ( = ?auto_260419 ?auto_260421 ) ) ( not ( = ?auto_260420 ?auto_260421 ) ) ( CLEAR ?auto_260419 ) ( ON ?auto_260420 ?auto_260421 ) ( CLEAR ?auto_260420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_260409 ?auto_260410 ?auto_260411 ?auto_260412 ?auto_260413 ?auto_260414 ?auto_260415 ?auto_260416 ?auto_260417 ?auto_260418 ?auto_260419 ?auto_260420 )
      ( MAKE-13PILE ?auto_260409 ?auto_260410 ?auto_260411 ?auto_260412 ?auto_260413 ?auto_260414 ?auto_260415 ?auto_260416 ?auto_260417 ?auto_260418 ?auto_260419 ?auto_260420 ?auto_260421 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260435 - BLOCK
      ?auto_260436 - BLOCK
      ?auto_260437 - BLOCK
      ?auto_260438 - BLOCK
      ?auto_260439 - BLOCK
      ?auto_260440 - BLOCK
      ?auto_260441 - BLOCK
      ?auto_260442 - BLOCK
      ?auto_260443 - BLOCK
      ?auto_260444 - BLOCK
      ?auto_260445 - BLOCK
      ?auto_260446 - BLOCK
      ?auto_260447 - BLOCK
    )
    :vars
    (
      ?auto_260448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260447 ?auto_260448 ) ( ON-TABLE ?auto_260435 ) ( ON ?auto_260436 ?auto_260435 ) ( ON ?auto_260437 ?auto_260436 ) ( ON ?auto_260438 ?auto_260437 ) ( ON ?auto_260439 ?auto_260438 ) ( ON ?auto_260440 ?auto_260439 ) ( ON ?auto_260441 ?auto_260440 ) ( ON ?auto_260442 ?auto_260441 ) ( ON ?auto_260443 ?auto_260442 ) ( ON ?auto_260444 ?auto_260443 ) ( not ( = ?auto_260435 ?auto_260436 ) ) ( not ( = ?auto_260435 ?auto_260437 ) ) ( not ( = ?auto_260435 ?auto_260438 ) ) ( not ( = ?auto_260435 ?auto_260439 ) ) ( not ( = ?auto_260435 ?auto_260440 ) ) ( not ( = ?auto_260435 ?auto_260441 ) ) ( not ( = ?auto_260435 ?auto_260442 ) ) ( not ( = ?auto_260435 ?auto_260443 ) ) ( not ( = ?auto_260435 ?auto_260444 ) ) ( not ( = ?auto_260435 ?auto_260445 ) ) ( not ( = ?auto_260435 ?auto_260446 ) ) ( not ( = ?auto_260435 ?auto_260447 ) ) ( not ( = ?auto_260435 ?auto_260448 ) ) ( not ( = ?auto_260436 ?auto_260437 ) ) ( not ( = ?auto_260436 ?auto_260438 ) ) ( not ( = ?auto_260436 ?auto_260439 ) ) ( not ( = ?auto_260436 ?auto_260440 ) ) ( not ( = ?auto_260436 ?auto_260441 ) ) ( not ( = ?auto_260436 ?auto_260442 ) ) ( not ( = ?auto_260436 ?auto_260443 ) ) ( not ( = ?auto_260436 ?auto_260444 ) ) ( not ( = ?auto_260436 ?auto_260445 ) ) ( not ( = ?auto_260436 ?auto_260446 ) ) ( not ( = ?auto_260436 ?auto_260447 ) ) ( not ( = ?auto_260436 ?auto_260448 ) ) ( not ( = ?auto_260437 ?auto_260438 ) ) ( not ( = ?auto_260437 ?auto_260439 ) ) ( not ( = ?auto_260437 ?auto_260440 ) ) ( not ( = ?auto_260437 ?auto_260441 ) ) ( not ( = ?auto_260437 ?auto_260442 ) ) ( not ( = ?auto_260437 ?auto_260443 ) ) ( not ( = ?auto_260437 ?auto_260444 ) ) ( not ( = ?auto_260437 ?auto_260445 ) ) ( not ( = ?auto_260437 ?auto_260446 ) ) ( not ( = ?auto_260437 ?auto_260447 ) ) ( not ( = ?auto_260437 ?auto_260448 ) ) ( not ( = ?auto_260438 ?auto_260439 ) ) ( not ( = ?auto_260438 ?auto_260440 ) ) ( not ( = ?auto_260438 ?auto_260441 ) ) ( not ( = ?auto_260438 ?auto_260442 ) ) ( not ( = ?auto_260438 ?auto_260443 ) ) ( not ( = ?auto_260438 ?auto_260444 ) ) ( not ( = ?auto_260438 ?auto_260445 ) ) ( not ( = ?auto_260438 ?auto_260446 ) ) ( not ( = ?auto_260438 ?auto_260447 ) ) ( not ( = ?auto_260438 ?auto_260448 ) ) ( not ( = ?auto_260439 ?auto_260440 ) ) ( not ( = ?auto_260439 ?auto_260441 ) ) ( not ( = ?auto_260439 ?auto_260442 ) ) ( not ( = ?auto_260439 ?auto_260443 ) ) ( not ( = ?auto_260439 ?auto_260444 ) ) ( not ( = ?auto_260439 ?auto_260445 ) ) ( not ( = ?auto_260439 ?auto_260446 ) ) ( not ( = ?auto_260439 ?auto_260447 ) ) ( not ( = ?auto_260439 ?auto_260448 ) ) ( not ( = ?auto_260440 ?auto_260441 ) ) ( not ( = ?auto_260440 ?auto_260442 ) ) ( not ( = ?auto_260440 ?auto_260443 ) ) ( not ( = ?auto_260440 ?auto_260444 ) ) ( not ( = ?auto_260440 ?auto_260445 ) ) ( not ( = ?auto_260440 ?auto_260446 ) ) ( not ( = ?auto_260440 ?auto_260447 ) ) ( not ( = ?auto_260440 ?auto_260448 ) ) ( not ( = ?auto_260441 ?auto_260442 ) ) ( not ( = ?auto_260441 ?auto_260443 ) ) ( not ( = ?auto_260441 ?auto_260444 ) ) ( not ( = ?auto_260441 ?auto_260445 ) ) ( not ( = ?auto_260441 ?auto_260446 ) ) ( not ( = ?auto_260441 ?auto_260447 ) ) ( not ( = ?auto_260441 ?auto_260448 ) ) ( not ( = ?auto_260442 ?auto_260443 ) ) ( not ( = ?auto_260442 ?auto_260444 ) ) ( not ( = ?auto_260442 ?auto_260445 ) ) ( not ( = ?auto_260442 ?auto_260446 ) ) ( not ( = ?auto_260442 ?auto_260447 ) ) ( not ( = ?auto_260442 ?auto_260448 ) ) ( not ( = ?auto_260443 ?auto_260444 ) ) ( not ( = ?auto_260443 ?auto_260445 ) ) ( not ( = ?auto_260443 ?auto_260446 ) ) ( not ( = ?auto_260443 ?auto_260447 ) ) ( not ( = ?auto_260443 ?auto_260448 ) ) ( not ( = ?auto_260444 ?auto_260445 ) ) ( not ( = ?auto_260444 ?auto_260446 ) ) ( not ( = ?auto_260444 ?auto_260447 ) ) ( not ( = ?auto_260444 ?auto_260448 ) ) ( not ( = ?auto_260445 ?auto_260446 ) ) ( not ( = ?auto_260445 ?auto_260447 ) ) ( not ( = ?auto_260445 ?auto_260448 ) ) ( not ( = ?auto_260446 ?auto_260447 ) ) ( not ( = ?auto_260446 ?auto_260448 ) ) ( not ( = ?auto_260447 ?auto_260448 ) ) ( ON ?auto_260446 ?auto_260447 ) ( CLEAR ?auto_260444 ) ( ON ?auto_260445 ?auto_260446 ) ( CLEAR ?auto_260445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_260435 ?auto_260436 ?auto_260437 ?auto_260438 ?auto_260439 ?auto_260440 ?auto_260441 ?auto_260442 ?auto_260443 ?auto_260444 ?auto_260445 )
      ( MAKE-13PILE ?auto_260435 ?auto_260436 ?auto_260437 ?auto_260438 ?auto_260439 ?auto_260440 ?auto_260441 ?auto_260442 ?auto_260443 ?auto_260444 ?auto_260445 ?auto_260446 ?auto_260447 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260462 - BLOCK
      ?auto_260463 - BLOCK
      ?auto_260464 - BLOCK
      ?auto_260465 - BLOCK
      ?auto_260466 - BLOCK
      ?auto_260467 - BLOCK
      ?auto_260468 - BLOCK
      ?auto_260469 - BLOCK
      ?auto_260470 - BLOCK
      ?auto_260471 - BLOCK
      ?auto_260472 - BLOCK
      ?auto_260473 - BLOCK
      ?auto_260474 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_260474 ) ( ON-TABLE ?auto_260462 ) ( ON ?auto_260463 ?auto_260462 ) ( ON ?auto_260464 ?auto_260463 ) ( ON ?auto_260465 ?auto_260464 ) ( ON ?auto_260466 ?auto_260465 ) ( ON ?auto_260467 ?auto_260466 ) ( ON ?auto_260468 ?auto_260467 ) ( ON ?auto_260469 ?auto_260468 ) ( ON ?auto_260470 ?auto_260469 ) ( ON ?auto_260471 ?auto_260470 ) ( not ( = ?auto_260462 ?auto_260463 ) ) ( not ( = ?auto_260462 ?auto_260464 ) ) ( not ( = ?auto_260462 ?auto_260465 ) ) ( not ( = ?auto_260462 ?auto_260466 ) ) ( not ( = ?auto_260462 ?auto_260467 ) ) ( not ( = ?auto_260462 ?auto_260468 ) ) ( not ( = ?auto_260462 ?auto_260469 ) ) ( not ( = ?auto_260462 ?auto_260470 ) ) ( not ( = ?auto_260462 ?auto_260471 ) ) ( not ( = ?auto_260462 ?auto_260472 ) ) ( not ( = ?auto_260462 ?auto_260473 ) ) ( not ( = ?auto_260462 ?auto_260474 ) ) ( not ( = ?auto_260463 ?auto_260464 ) ) ( not ( = ?auto_260463 ?auto_260465 ) ) ( not ( = ?auto_260463 ?auto_260466 ) ) ( not ( = ?auto_260463 ?auto_260467 ) ) ( not ( = ?auto_260463 ?auto_260468 ) ) ( not ( = ?auto_260463 ?auto_260469 ) ) ( not ( = ?auto_260463 ?auto_260470 ) ) ( not ( = ?auto_260463 ?auto_260471 ) ) ( not ( = ?auto_260463 ?auto_260472 ) ) ( not ( = ?auto_260463 ?auto_260473 ) ) ( not ( = ?auto_260463 ?auto_260474 ) ) ( not ( = ?auto_260464 ?auto_260465 ) ) ( not ( = ?auto_260464 ?auto_260466 ) ) ( not ( = ?auto_260464 ?auto_260467 ) ) ( not ( = ?auto_260464 ?auto_260468 ) ) ( not ( = ?auto_260464 ?auto_260469 ) ) ( not ( = ?auto_260464 ?auto_260470 ) ) ( not ( = ?auto_260464 ?auto_260471 ) ) ( not ( = ?auto_260464 ?auto_260472 ) ) ( not ( = ?auto_260464 ?auto_260473 ) ) ( not ( = ?auto_260464 ?auto_260474 ) ) ( not ( = ?auto_260465 ?auto_260466 ) ) ( not ( = ?auto_260465 ?auto_260467 ) ) ( not ( = ?auto_260465 ?auto_260468 ) ) ( not ( = ?auto_260465 ?auto_260469 ) ) ( not ( = ?auto_260465 ?auto_260470 ) ) ( not ( = ?auto_260465 ?auto_260471 ) ) ( not ( = ?auto_260465 ?auto_260472 ) ) ( not ( = ?auto_260465 ?auto_260473 ) ) ( not ( = ?auto_260465 ?auto_260474 ) ) ( not ( = ?auto_260466 ?auto_260467 ) ) ( not ( = ?auto_260466 ?auto_260468 ) ) ( not ( = ?auto_260466 ?auto_260469 ) ) ( not ( = ?auto_260466 ?auto_260470 ) ) ( not ( = ?auto_260466 ?auto_260471 ) ) ( not ( = ?auto_260466 ?auto_260472 ) ) ( not ( = ?auto_260466 ?auto_260473 ) ) ( not ( = ?auto_260466 ?auto_260474 ) ) ( not ( = ?auto_260467 ?auto_260468 ) ) ( not ( = ?auto_260467 ?auto_260469 ) ) ( not ( = ?auto_260467 ?auto_260470 ) ) ( not ( = ?auto_260467 ?auto_260471 ) ) ( not ( = ?auto_260467 ?auto_260472 ) ) ( not ( = ?auto_260467 ?auto_260473 ) ) ( not ( = ?auto_260467 ?auto_260474 ) ) ( not ( = ?auto_260468 ?auto_260469 ) ) ( not ( = ?auto_260468 ?auto_260470 ) ) ( not ( = ?auto_260468 ?auto_260471 ) ) ( not ( = ?auto_260468 ?auto_260472 ) ) ( not ( = ?auto_260468 ?auto_260473 ) ) ( not ( = ?auto_260468 ?auto_260474 ) ) ( not ( = ?auto_260469 ?auto_260470 ) ) ( not ( = ?auto_260469 ?auto_260471 ) ) ( not ( = ?auto_260469 ?auto_260472 ) ) ( not ( = ?auto_260469 ?auto_260473 ) ) ( not ( = ?auto_260469 ?auto_260474 ) ) ( not ( = ?auto_260470 ?auto_260471 ) ) ( not ( = ?auto_260470 ?auto_260472 ) ) ( not ( = ?auto_260470 ?auto_260473 ) ) ( not ( = ?auto_260470 ?auto_260474 ) ) ( not ( = ?auto_260471 ?auto_260472 ) ) ( not ( = ?auto_260471 ?auto_260473 ) ) ( not ( = ?auto_260471 ?auto_260474 ) ) ( not ( = ?auto_260472 ?auto_260473 ) ) ( not ( = ?auto_260472 ?auto_260474 ) ) ( not ( = ?auto_260473 ?auto_260474 ) ) ( ON ?auto_260473 ?auto_260474 ) ( CLEAR ?auto_260471 ) ( ON ?auto_260472 ?auto_260473 ) ( CLEAR ?auto_260472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_260462 ?auto_260463 ?auto_260464 ?auto_260465 ?auto_260466 ?auto_260467 ?auto_260468 ?auto_260469 ?auto_260470 ?auto_260471 ?auto_260472 )
      ( MAKE-13PILE ?auto_260462 ?auto_260463 ?auto_260464 ?auto_260465 ?auto_260466 ?auto_260467 ?auto_260468 ?auto_260469 ?auto_260470 ?auto_260471 ?auto_260472 ?auto_260473 ?auto_260474 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260488 - BLOCK
      ?auto_260489 - BLOCK
      ?auto_260490 - BLOCK
      ?auto_260491 - BLOCK
      ?auto_260492 - BLOCK
      ?auto_260493 - BLOCK
      ?auto_260494 - BLOCK
      ?auto_260495 - BLOCK
      ?auto_260496 - BLOCK
      ?auto_260497 - BLOCK
      ?auto_260498 - BLOCK
      ?auto_260499 - BLOCK
      ?auto_260500 - BLOCK
    )
    :vars
    (
      ?auto_260501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260500 ?auto_260501 ) ( ON-TABLE ?auto_260488 ) ( ON ?auto_260489 ?auto_260488 ) ( ON ?auto_260490 ?auto_260489 ) ( ON ?auto_260491 ?auto_260490 ) ( ON ?auto_260492 ?auto_260491 ) ( ON ?auto_260493 ?auto_260492 ) ( ON ?auto_260494 ?auto_260493 ) ( ON ?auto_260495 ?auto_260494 ) ( ON ?auto_260496 ?auto_260495 ) ( not ( = ?auto_260488 ?auto_260489 ) ) ( not ( = ?auto_260488 ?auto_260490 ) ) ( not ( = ?auto_260488 ?auto_260491 ) ) ( not ( = ?auto_260488 ?auto_260492 ) ) ( not ( = ?auto_260488 ?auto_260493 ) ) ( not ( = ?auto_260488 ?auto_260494 ) ) ( not ( = ?auto_260488 ?auto_260495 ) ) ( not ( = ?auto_260488 ?auto_260496 ) ) ( not ( = ?auto_260488 ?auto_260497 ) ) ( not ( = ?auto_260488 ?auto_260498 ) ) ( not ( = ?auto_260488 ?auto_260499 ) ) ( not ( = ?auto_260488 ?auto_260500 ) ) ( not ( = ?auto_260488 ?auto_260501 ) ) ( not ( = ?auto_260489 ?auto_260490 ) ) ( not ( = ?auto_260489 ?auto_260491 ) ) ( not ( = ?auto_260489 ?auto_260492 ) ) ( not ( = ?auto_260489 ?auto_260493 ) ) ( not ( = ?auto_260489 ?auto_260494 ) ) ( not ( = ?auto_260489 ?auto_260495 ) ) ( not ( = ?auto_260489 ?auto_260496 ) ) ( not ( = ?auto_260489 ?auto_260497 ) ) ( not ( = ?auto_260489 ?auto_260498 ) ) ( not ( = ?auto_260489 ?auto_260499 ) ) ( not ( = ?auto_260489 ?auto_260500 ) ) ( not ( = ?auto_260489 ?auto_260501 ) ) ( not ( = ?auto_260490 ?auto_260491 ) ) ( not ( = ?auto_260490 ?auto_260492 ) ) ( not ( = ?auto_260490 ?auto_260493 ) ) ( not ( = ?auto_260490 ?auto_260494 ) ) ( not ( = ?auto_260490 ?auto_260495 ) ) ( not ( = ?auto_260490 ?auto_260496 ) ) ( not ( = ?auto_260490 ?auto_260497 ) ) ( not ( = ?auto_260490 ?auto_260498 ) ) ( not ( = ?auto_260490 ?auto_260499 ) ) ( not ( = ?auto_260490 ?auto_260500 ) ) ( not ( = ?auto_260490 ?auto_260501 ) ) ( not ( = ?auto_260491 ?auto_260492 ) ) ( not ( = ?auto_260491 ?auto_260493 ) ) ( not ( = ?auto_260491 ?auto_260494 ) ) ( not ( = ?auto_260491 ?auto_260495 ) ) ( not ( = ?auto_260491 ?auto_260496 ) ) ( not ( = ?auto_260491 ?auto_260497 ) ) ( not ( = ?auto_260491 ?auto_260498 ) ) ( not ( = ?auto_260491 ?auto_260499 ) ) ( not ( = ?auto_260491 ?auto_260500 ) ) ( not ( = ?auto_260491 ?auto_260501 ) ) ( not ( = ?auto_260492 ?auto_260493 ) ) ( not ( = ?auto_260492 ?auto_260494 ) ) ( not ( = ?auto_260492 ?auto_260495 ) ) ( not ( = ?auto_260492 ?auto_260496 ) ) ( not ( = ?auto_260492 ?auto_260497 ) ) ( not ( = ?auto_260492 ?auto_260498 ) ) ( not ( = ?auto_260492 ?auto_260499 ) ) ( not ( = ?auto_260492 ?auto_260500 ) ) ( not ( = ?auto_260492 ?auto_260501 ) ) ( not ( = ?auto_260493 ?auto_260494 ) ) ( not ( = ?auto_260493 ?auto_260495 ) ) ( not ( = ?auto_260493 ?auto_260496 ) ) ( not ( = ?auto_260493 ?auto_260497 ) ) ( not ( = ?auto_260493 ?auto_260498 ) ) ( not ( = ?auto_260493 ?auto_260499 ) ) ( not ( = ?auto_260493 ?auto_260500 ) ) ( not ( = ?auto_260493 ?auto_260501 ) ) ( not ( = ?auto_260494 ?auto_260495 ) ) ( not ( = ?auto_260494 ?auto_260496 ) ) ( not ( = ?auto_260494 ?auto_260497 ) ) ( not ( = ?auto_260494 ?auto_260498 ) ) ( not ( = ?auto_260494 ?auto_260499 ) ) ( not ( = ?auto_260494 ?auto_260500 ) ) ( not ( = ?auto_260494 ?auto_260501 ) ) ( not ( = ?auto_260495 ?auto_260496 ) ) ( not ( = ?auto_260495 ?auto_260497 ) ) ( not ( = ?auto_260495 ?auto_260498 ) ) ( not ( = ?auto_260495 ?auto_260499 ) ) ( not ( = ?auto_260495 ?auto_260500 ) ) ( not ( = ?auto_260495 ?auto_260501 ) ) ( not ( = ?auto_260496 ?auto_260497 ) ) ( not ( = ?auto_260496 ?auto_260498 ) ) ( not ( = ?auto_260496 ?auto_260499 ) ) ( not ( = ?auto_260496 ?auto_260500 ) ) ( not ( = ?auto_260496 ?auto_260501 ) ) ( not ( = ?auto_260497 ?auto_260498 ) ) ( not ( = ?auto_260497 ?auto_260499 ) ) ( not ( = ?auto_260497 ?auto_260500 ) ) ( not ( = ?auto_260497 ?auto_260501 ) ) ( not ( = ?auto_260498 ?auto_260499 ) ) ( not ( = ?auto_260498 ?auto_260500 ) ) ( not ( = ?auto_260498 ?auto_260501 ) ) ( not ( = ?auto_260499 ?auto_260500 ) ) ( not ( = ?auto_260499 ?auto_260501 ) ) ( not ( = ?auto_260500 ?auto_260501 ) ) ( ON ?auto_260499 ?auto_260500 ) ( ON ?auto_260498 ?auto_260499 ) ( CLEAR ?auto_260496 ) ( ON ?auto_260497 ?auto_260498 ) ( CLEAR ?auto_260497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_260488 ?auto_260489 ?auto_260490 ?auto_260491 ?auto_260492 ?auto_260493 ?auto_260494 ?auto_260495 ?auto_260496 ?auto_260497 )
      ( MAKE-13PILE ?auto_260488 ?auto_260489 ?auto_260490 ?auto_260491 ?auto_260492 ?auto_260493 ?auto_260494 ?auto_260495 ?auto_260496 ?auto_260497 ?auto_260498 ?auto_260499 ?auto_260500 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260515 - BLOCK
      ?auto_260516 - BLOCK
      ?auto_260517 - BLOCK
      ?auto_260518 - BLOCK
      ?auto_260519 - BLOCK
      ?auto_260520 - BLOCK
      ?auto_260521 - BLOCK
      ?auto_260522 - BLOCK
      ?auto_260523 - BLOCK
      ?auto_260524 - BLOCK
      ?auto_260525 - BLOCK
      ?auto_260526 - BLOCK
      ?auto_260527 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_260527 ) ( ON-TABLE ?auto_260515 ) ( ON ?auto_260516 ?auto_260515 ) ( ON ?auto_260517 ?auto_260516 ) ( ON ?auto_260518 ?auto_260517 ) ( ON ?auto_260519 ?auto_260518 ) ( ON ?auto_260520 ?auto_260519 ) ( ON ?auto_260521 ?auto_260520 ) ( ON ?auto_260522 ?auto_260521 ) ( ON ?auto_260523 ?auto_260522 ) ( not ( = ?auto_260515 ?auto_260516 ) ) ( not ( = ?auto_260515 ?auto_260517 ) ) ( not ( = ?auto_260515 ?auto_260518 ) ) ( not ( = ?auto_260515 ?auto_260519 ) ) ( not ( = ?auto_260515 ?auto_260520 ) ) ( not ( = ?auto_260515 ?auto_260521 ) ) ( not ( = ?auto_260515 ?auto_260522 ) ) ( not ( = ?auto_260515 ?auto_260523 ) ) ( not ( = ?auto_260515 ?auto_260524 ) ) ( not ( = ?auto_260515 ?auto_260525 ) ) ( not ( = ?auto_260515 ?auto_260526 ) ) ( not ( = ?auto_260515 ?auto_260527 ) ) ( not ( = ?auto_260516 ?auto_260517 ) ) ( not ( = ?auto_260516 ?auto_260518 ) ) ( not ( = ?auto_260516 ?auto_260519 ) ) ( not ( = ?auto_260516 ?auto_260520 ) ) ( not ( = ?auto_260516 ?auto_260521 ) ) ( not ( = ?auto_260516 ?auto_260522 ) ) ( not ( = ?auto_260516 ?auto_260523 ) ) ( not ( = ?auto_260516 ?auto_260524 ) ) ( not ( = ?auto_260516 ?auto_260525 ) ) ( not ( = ?auto_260516 ?auto_260526 ) ) ( not ( = ?auto_260516 ?auto_260527 ) ) ( not ( = ?auto_260517 ?auto_260518 ) ) ( not ( = ?auto_260517 ?auto_260519 ) ) ( not ( = ?auto_260517 ?auto_260520 ) ) ( not ( = ?auto_260517 ?auto_260521 ) ) ( not ( = ?auto_260517 ?auto_260522 ) ) ( not ( = ?auto_260517 ?auto_260523 ) ) ( not ( = ?auto_260517 ?auto_260524 ) ) ( not ( = ?auto_260517 ?auto_260525 ) ) ( not ( = ?auto_260517 ?auto_260526 ) ) ( not ( = ?auto_260517 ?auto_260527 ) ) ( not ( = ?auto_260518 ?auto_260519 ) ) ( not ( = ?auto_260518 ?auto_260520 ) ) ( not ( = ?auto_260518 ?auto_260521 ) ) ( not ( = ?auto_260518 ?auto_260522 ) ) ( not ( = ?auto_260518 ?auto_260523 ) ) ( not ( = ?auto_260518 ?auto_260524 ) ) ( not ( = ?auto_260518 ?auto_260525 ) ) ( not ( = ?auto_260518 ?auto_260526 ) ) ( not ( = ?auto_260518 ?auto_260527 ) ) ( not ( = ?auto_260519 ?auto_260520 ) ) ( not ( = ?auto_260519 ?auto_260521 ) ) ( not ( = ?auto_260519 ?auto_260522 ) ) ( not ( = ?auto_260519 ?auto_260523 ) ) ( not ( = ?auto_260519 ?auto_260524 ) ) ( not ( = ?auto_260519 ?auto_260525 ) ) ( not ( = ?auto_260519 ?auto_260526 ) ) ( not ( = ?auto_260519 ?auto_260527 ) ) ( not ( = ?auto_260520 ?auto_260521 ) ) ( not ( = ?auto_260520 ?auto_260522 ) ) ( not ( = ?auto_260520 ?auto_260523 ) ) ( not ( = ?auto_260520 ?auto_260524 ) ) ( not ( = ?auto_260520 ?auto_260525 ) ) ( not ( = ?auto_260520 ?auto_260526 ) ) ( not ( = ?auto_260520 ?auto_260527 ) ) ( not ( = ?auto_260521 ?auto_260522 ) ) ( not ( = ?auto_260521 ?auto_260523 ) ) ( not ( = ?auto_260521 ?auto_260524 ) ) ( not ( = ?auto_260521 ?auto_260525 ) ) ( not ( = ?auto_260521 ?auto_260526 ) ) ( not ( = ?auto_260521 ?auto_260527 ) ) ( not ( = ?auto_260522 ?auto_260523 ) ) ( not ( = ?auto_260522 ?auto_260524 ) ) ( not ( = ?auto_260522 ?auto_260525 ) ) ( not ( = ?auto_260522 ?auto_260526 ) ) ( not ( = ?auto_260522 ?auto_260527 ) ) ( not ( = ?auto_260523 ?auto_260524 ) ) ( not ( = ?auto_260523 ?auto_260525 ) ) ( not ( = ?auto_260523 ?auto_260526 ) ) ( not ( = ?auto_260523 ?auto_260527 ) ) ( not ( = ?auto_260524 ?auto_260525 ) ) ( not ( = ?auto_260524 ?auto_260526 ) ) ( not ( = ?auto_260524 ?auto_260527 ) ) ( not ( = ?auto_260525 ?auto_260526 ) ) ( not ( = ?auto_260525 ?auto_260527 ) ) ( not ( = ?auto_260526 ?auto_260527 ) ) ( ON ?auto_260526 ?auto_260527 ) ( ON ?auto_260525 ?auto_260526 ) ( CLEAR ?auto_260523 ) ( ON ?auto_260524 ?auto_260525 ) ( CLEAR ?auto_260524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_260515 ?auto_260516 ?auto_260517 ?auto_260518 ?auto_260519 ?auto_260520 ?auto_260521 ?auto_260522 ?auto_260523 ?auto_260524 )
      ( MAKE-13PILE ?auto_260515 ?auto_260516 ?auto_260517 ?auto_260518 ?auto_260519 ?auto_260520 ?auto_260521 ?auto_260522 ?auto_260523 ?auto_260524 ?auto_260525 ?auto_260526 ?auto_260527 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260541 - BLOCK
      ?auto_260542 - BLOCK
      ?auto_260543 - BLOCK
      ?auto_260544 - BLOCK
      ?auto_260545 - BLOCK
      ?auto_260546 - BLOCK
      ?auto_260547 - BLOCK
      ?auto_260548 - BLOCK
      ?auto_260549 - BLOCK
      ?auto_260550 - BLOCK
      ?auto_260551 - BLOCK
      ?auto_260552 - BLOCK
      ?auto_260553 - BLOCK
    )
    :vars
    (
      ?auto_260554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260553 ?auto_260554 ) ( ON-TABLE ?auto_260541 ) ( ON ?auto_260542 ?auto_260541 ) ( ON ?auto_260543 ?auto_260542 ) ( ON ?auto_260544 ?auto_260543 ) ( ON ?auto_260545 ?auto_260544 ) ( ON ?auto_260546 ?auto_260545 ) ( ON ?auto_260547 ?auto_260546 ) ( ON ?auto_260548 ?auto_260547 ) ( not ( = ?auto_260541 ?auto_260542 ) ) ( not ( = ?auto_260541 ?auto_260543 ) ) ( not ( = ?auto_260541 ?auto_260544 ) ) ( not ( = ?auto_260541 ?auto_260545 ) ) ( not ( = ?auto_260541 ?auto_260546 ) ) ( not ( = ?auto_260541 ?auto_260547 ) ) ( not ( = ?auto_260541 ?auto_260548 ) ) ( not ( = ?auto_260541 ?auto_260549 ) ) ( not ( = ?auto_260541 ?auto_260550 ) ) ( not ( = ?auto_260541 ?auto_260551 ) ) ( not ( = ?auto_260541 ?auto_260552 ) ) ( not ( = ?auto_260541 ?auto_260553 ) ) ( not ( = ?auto_260541 ?auto_260554 ) ) ( not ( = ?auto_260542 ?auto_260543 ) ) ( not ( = ?auto_260542 ?auto_260544 ) ) ( not ( = ?auto_260542 ?auto_260545 ) ) ( not ( = ?auto_260542 ?auto_260546 ) ) ( not ( = ?auto_260542 ?auto_260547 ) ) ( not ( = ?auto_260542 ?auto_260548 ) ) ( not ( = ?auto_260542 ?auto_260549 ) ) ( not ( = ?auto_260542 ?auto_260550 ) ) ( not ( = ?auto_260542 ?auto_260551 ) ) ( not ( = ?auto_260542 ?auto_260552 ) ) ( not ( = ?auto_260542 ?auto_260553 ) ) ( not ( = ?auto_260542 ?auto_260554 ) ) ( not ( = ?auto_260543 ?auto_260544 ) ) ( not ( = ?auto_260543 ?auto_260545 ) ) ( not ( = ?auto_260543 ?auto_260546 ) ) ( not ( = ?auto_260543 ?auto_260547 ) ) ( not ( = ?auto_260543 ?auto_260548 ) ) ( not ( = ?auto_260543 ?auto_260549 ) ) ( not ( = ?auto_260543 ?auto_260550 ) ) ( not ( = ?auto_260543 ?auto_260551 ) ) ( not ( = ?auto_260543 ?auto_260552 ) ) ( not ( = ?auto_260543 ?auto_260553 ) ) ( not ( = ?auto_260543 ?auto_260554 ) ) ( not ( = ?auto_260544 ?auto_260545 ) ) ( not ( = ?auto_260544 ?auto_260546 ) ) ( not ( = ?auto_260544 ?auto_260547 ) ) ( not ( = ?auto_260544 ?auto_260548 ) ) ( not ( = ?auto_260544 ?auto_260549 ) ) ( not ( = ?auto_260544 ?auto_260550 ) ) ( not ( = ?auto_260544 ?auto_260551 ) ) ( not ( = ?auto_260544 ?auto_260552 ) ) ( not ( = ?auto_260544 ?auto_260553 ) ) ( not ( = ?auto_260544 ?auto_260554 ) ) ( not ( = ?auto_260545 ?auto_260546 ) ) ( not ( = ?auto_260545 ?auto_260547 ) ) ( not ( = ?auto_260545 ?auto_260548 ) ) ( not ( = ?auto_260545 ?auto_260549 ) ) ( not ( = ?auto_260545 ?auto_260550 ) ) ( not ( = ?auto_260545 ?auto_260551 ) ) ( not ( = ?auto_260545 ?auto_260552 ) ) ( not ( = ?auto_260545 ?auto_260553 ) ) ( not ( = ?auto_260545 ?auto_260554 ) ) ( not ( = ?auto_260546 ?auto_260547 ) ) ( not ( = ?auto_260546 ?auto_260548 ) ) ( not ( = ?auto_260546 ?auto_260549 ) ) ( not ( = ?auto_260546 ?auto_260550 ) ) ( not ( = ?auto_260546 ?auto_260551 ) ) ( not ( = ?auto_260546 ?auto_260552 ) ) ( not ( = ?auto_260546 ?auto_260553 ) ) ( not ( = ?auto_260546 ?auto_260554 ) ) ( not ( = ?auto_260547 ?auto_260548 ) ) ( not ( = ?auto_260547 ?auto_260549 ) ) ( not ( = ?auto_260547 ?auto_260550 ) ) ( not ( = ?auto_260547 ?auto_260551 ) ) ( not ( = ?auto_260547 ?auto_260552 ) ) ( not ( = ?auto_260547 ?auto_260553 ) ) ( not ( = ?auto_260547 ?auto_260554 ) ) ( not ( = ?auto_260548 ?auto_260549 ) ) ( not ( = ?auto_260548 ?auto_260550 ) ) ( not ( = ?auto_260548 ?auto_260551 ) ) ( not ( = ?auto_260548 ?auto_260552 ) ) ( not ( = ?auto_260548 ?auto_260553 ) ) ( not ( = ?auto_260548 ?auto_260554 ) ) ( not ( = ?auto_260549 ?auto_260550 ) ) ( not ( = ?auto_260549 ?auto_260551 ) ) ( not ( = ?auto_260549 ?auto_260552 ) ) ( not ( = ?auto_260549 ?auto_260553 ) ) ( not ( = ?auto_260549 ?auto_260554 ) ) ( not ( = ?auto_260550 ?auto_260551 ) ) ( not ( = ?auto_260550 ?auto_260552 ) ) ( not ( = ?auto_260550 ?auto_260553 ) ) ( not ( = ?auto_260550 ?auto_260554 ) ) ( not ( = ?auto_260551 ?auto_260552 ) ) ( not ( = ?auto_260551 ?auto_260553 ) ) ( not ( = ?auto_260551 ?auto_260554 ) ) ( not ( = ?auto_260552 ?auto_260553 ) ) ( not ( = ?auto_260552 ?auto_260554 ) ) ( not ( = ?auto_260553 ?auto_260554 ) ) ( ON ?auto_260552 ?auto_260553 ) ( ON ?auto_260551 ?auto_260552 ) ( ON ?auto_260550 ?auto_260551 ) ( CLEAR ?auto_260548 ) ( ON ?auto_260549 ?auto_260550 ) ( CLEAR ?auto_260549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_260541 ?auto_260542 ?auto_260543 ?auto_260544 ?auto_260545 ?auto_260546 ?auto_260547 ?auto_260548 ?auto_260549 )
      ( MAKE-13PILE ?auto_260541 ?auto_260542 ?auto_260543 ?auto_260544 ?auto_260545 ?auto_260546 ?auto_260547 ?auto_260548 ?auto_260549 ?auto_260550 ?auto_260551 ?auto_260552 ?auto_260553 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260568 - BLOCK
      ?auto_260569 - BLOCK
      ?auto_260570 - BLOCK
      ?auto_260571 - BLOCK
      ?auto_260572 - BLOCK
      ?auto_260573 - BLOCK
      ?auto_260574 - BLOCK
      ?auto_260575 - BLOCK
      ?auto_260576 - BLOCK
      ?auto_260577 - BLOCK
      ?auto_260578 - BLOCK
      ?auto_260579 - BLOCK
      ?auto_260580 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_260580 ) ( ON-TABLE ?auto_260568 ) ( ON ?auto_260569 ?auto_260568 ) ( ON ?auto_260570 ?auto_260569 ) ( ON ?auto_260571 ?auto_260570 ) ( ON ?auto_260572 ?auto_260571 ) ( ON ?auto_260573 ?auto_260572 ) ( ON ?auto_260574 ?auto_260573 ) ( ON ?auto_260575 ?auto_260574 ) ( not ( = ?auto_260568 ?auto_260569 ) ) ( not ( = ?auto_260568 ?auto_260570 ) ) ( not ( = ?auto_260568 ?auto_260571 ) ) ( not ( = ?auto_260568 ?auto_260572 ) ) ( not ( = ?auto_260568 ?auto_260573 ) ) ( not ( = ?auto_260568 ?auto_260574 ) ) ( not ( = ?auto_260568 ?auto_260575 ) ) ( not ( = ?auto_260568 ?auto_260576 ) ) ( not ( = ?auto_260568 ?auto_260577 ) ) ( not ( = ?auto_260568 ?auto_260578 ) ) ( not ( = ?auto_260568 ?auto_260579 ) ) ( not ( = ?auto_260568 ?auto_260580 ) ) ( not ( = ?auto_260569 ?auto_260570 ) ) ( not ( = ?auto_260569 ?auto_260571 ) ) ( not ( = ?auto_260569 ?auto_260572 ) ) ( not ( = ?auto_260569 ?auto_260573 ) ) ( not ( = ?auto_260569 ?auto_260574 ) ) ( not ( = ?auto_260569 ?auto_260575 ) ) ( not ( = ?auto_260569 ?auto_260576 ) ) ( not ( = ?auto_260569 ?auto_260577 ) ) ( not ( = ?auto_260569 ?auto_260578 ) ) ( not ( = ?auto_260569 ?auto_260579 ) ) ( not ( = ?auto_260569 ?auto_260580 ) ) ( not ( = ?auto_260570 ?auto_260571 ) ) ( not ( = ?auto_260570 ?auto_260572 ) ) ( not ( = ?auto_260570 ?auto_260573 ) ) ( not ( = ?auto_260570 ?auto_260574 ) ) ( not ( = ?auto_260570 ?auto_260575 ) ) ( not ( = ?auto_260570 ?auto_260576 ) ) ( not ( = ?auto_260570 ?auto_260577 ) ) ( not ( = ?auto_260570 ?auto_260578 ) ) ( not ( = ?auto_260570 ?auto_260579 ) ) ( not ( = ?auto_260570 ?auto_260580 ) ) ( not ( = ?auto_260571 ?auto_260572 ) ) ( not ( = ?auto_260571 ?auto_260573 ) ) ( not ( = ?auto_260571 ?auto_260574 ) ) ( not ( = ?auto_260571 ?auto_260575 ) ) ( not ( = ?auto_260571 ?auto_260576 ) ) ( not ( = ?auto_260571 ?auto_260577 ) ) ( not ( = ?auto_260571 ?auto_260578 ) ) ( not ( = ?auto_260571 ?auto_260579 ) ) ( not ( = ?auto_260571 ?auto_260580 ) ) ( not ( = ?auto_260572 ?auto_260573 ) ) ( not ( = ?auto_260572 ?auto_260574 ) ) ( not ( = ?auto_260572 ?auto_260575 ) ) ( not ( = ?auto_260572 ?auto_260576 ) ) ( not ( = ?auto_260572 ?auto_260577 ) ) ( not ( = ?auto_260572 ?auto_260578 ) ) ( not ( = ?auto_260572 ?auto_260579 ) ) ( not ( = ?auto_260572 ?auto_260580 ) ) ( not ( = ?auto_260573 ?auto_260574 ) ) ( not ( = ?auto_260573 ?auto_260575 ) ) ( not ( = ?auto_260573 ?auto_260576 ) ) ( not ( = ?auto_260573 ?auto_260577 ) ) ( not ( = ?auto_260573 ?auto_260578 ) ) ( not ( = ?auto_260573 ?auto_260579 ) ) ( not ( = ?auto_260573 ?auto_260580 ) ) ( not ( = ?auto_260574 ?auto_260575 ) ) ( not ( = ?auto_260574 ?auto_260576 ) ) ( not ( = ?auto_260574 ?auto_260577 ) ) ( not ( = ?auto_260574 ?auto_260578 ) ) ( not ( = ?auto_260574 ?auto_260579 ) ) ( not ( = ?auto_260574 ?auto_260580 ) ) ( not ( = ?auto_260575 ?auto_260576 ) ) ( not ( = ?auto_260575 ?auto_260577 ) ) ( not ( = ?auto_260575 ?auto_260578 ) ) ( not ( = ?auto_260575 ?auto_260579 ) ) ( not ( = ?auto_260575 ?auto_260580 ) ) ( not ( = ?auto_260576 ?auto_260577 ) ) ( not ( = ?auto_260576 ?auto_260578 ) ) ( not ( = ?auto_260576 ?auto_260579 ) ) ( not ( = ?auto_260576 ?auto_260580 ) ) ( not ( = ?auto_260577 ?auto_260578 ) ) ( not ( = ?auto_260577 ?auto_260579 ) ) ( not ( = ?auto_260577 ?auto_260580 ) ) ( not ( = ?auto_260578 ?auto_260579 ) ) ( not ( = ?auto_260578 ?auto_260580 ) ) ( not ( = ?auto_260579 ?auto_260580 ) ) ( ON ?auto_260579 ?auto_260580 ) ( ON ?auto_260578 ?auto_260579 ) ( ON ?auto_260577 ?auto_260578 ) ( CLEAR ?auto_260575 ) ( ON ?auto_260576 ?auto_260577 ) ( CLEAR ?auto_260576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_260568 ?auto_260569 ?auto_260570 ?auto_260571 ?auto_260572 ?auto_260573 ?auto_260574 ?auto_260575 ?auto_260576 )
      ( MAKE-13PILE ?auto_260568 ?auto_260569 ?auto_260570 ?auto_260571 ?auto_260572 ?auto_260573 ?auto_260574 ?auto_260575 ?auto_260576 ?auto_260577 ?auto_260578 ?auto_260579 ?auto_260580 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260594 - BLOCK
      ?auto_260595 - BLOCK
      ?auto_260596 - BLOCK
      ?auto_260597 - BLOCK
      ?auto_260598 - BLOCK
      ?auto_260599 - BLOCK
      ?auto_260600 - BLOCK
      ?auto_260601 - BLOCK
      ?auto_260602 - BLOCK
      ?auto_260603 - BLOCK
      ?auto_260604 - BLOCK
      ?auto_260605 - BLOCK
      ?auto_260606 - BLOCK
    )
    :vars
    (
      ?auto_260607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260606 ?auto_260607 ) ( ON-TABLE ?auto_260594 ) ( ON ?auto_260595 ?auto_260594 ) ( ON ?auto_260596 ?auto_260595 ) ( ON ?auto_260597 ?auto_260596 ) ( ON ?auto_260598 ?auto_260597 ) ( ON ?auto_260599 ?auto_260598 ) ( ON ?auto_260600 ?auto_260599 ) ( not ( = ?auto_260594 ?auto_260595 ) ) ( not ( = ?auto_260594 ?auto_260596 ) ) ( not ( = ?auto_260594 ?auto_260597 ) ) ( not ( = ?auto_260594 ?auto_260598 ) ) ( not ( = ?auto_260594 ?auto_260599 ) ) ( not ( = ?auto_260594 ?auto_260600 ) ) ( not ( = ?auto_260594 ?auto_260601 ) ) ( not ( = ?auto_260594 ?auto_260602 ) ) ( not ( = ?auto_260594 ?auto_260603 ) ) ( not ( = ?auto_260594 ?auto_260604 ) ) ( not ( = ?auto_260594 ?auto_260605 ) ) ( not ( = ?auto_260594 ?auto_260606 ) ) ( not ( = ?auto_260594 ?auto_260607 ) ) ( not ( = ?auto_260595 ?auto_260596 ) ) ( not ( = ?auto_260595 ?auto_260597 ) ) ( not ( = ?auto_260595 ?auto_260598 ) ) ( not ( = ?auto_260595 ?auto_260599 ) ) ( not ( = ?auto_260595 ?auto_260600 ) ) ( not ( = ?auto_260595 ?auto_260601 ) ) ( not ( = ?auto_260595 ?auto_260602 ) ) ( not ( = ?auto_260595 ?auto_260603 ) ) ( not ( = ?auto_260595 ?auto_260604 ) ) ( not ( = ?auto_260595 ?auto_260605 ) ) ( not ( = ?auto_260595 ?auto_260606 ) ) ( not ( = ?auto_260595 ?auto_260607 ) ) ( not ( = ?auto_260596 ?auto_260597 ) ) ( not ( = ?auto_260596 ?auto_260598 ) ) ( not ( = ?auto_260596 ?auto_260599 ) ) ( not ( = ?auto_260596 ?auto_260600 ) ) ( not ( = ?auto_260596 ?auto_260601 ) ) ( not ( = ?auto_260596 ?auto_260602 ) ) ( not ( = ?auto_260596 ?auto_260603 ) ) ( not ( = ?auto_260596 ?auto_260604 ) ) ( not ( = ?auto_260596 ?auto_260605 ) ) ( not ( = ?auto_260596 ?auto_260606 ) ) ( not ( = ?auto_260596 ?auto_260607 ) ) ( not ( = ?auto_260597 ?auto_260598 ) ) ( not ( = ?auto_260597 ?auto_260599 ) ) ( not ( = ?auto_260597 ?auto_260600 ) ) ( not ( = ?auto_260597 ?auto_260601 ) ) ( not ( = ?auto_260597 ?auto_260602 ) ) ( not ( = ?auto_260597 ?auto_260603 ) ) ( not ( = ?auto_260597 ?auto_260604 ) ) ( not ( = ?auto_260597 ?auto_260605 ) ) ( not ( = ?auto_260597 ?auto_260606 ) ) ( not ( = ?auto_260597 ?auto_260607 ) ) ( not ( = ?auto_260598 ?auto_260599 ) ) ( not ( = ?auto_260598 ?auto_260600 ) ) ( not ( = ?auto_260598 ?auto_260601 ) ) ( not ( = ?auto_260598 ?auto_260602 ) ) ( not ( = ?auto_260598 ?auto_260603 ) ) ( not ( = ?auto_260598 ?auto_260604 ) ) ( not ( = ?auto_260598 ?auto_260605 ) ) ( not ( = ?auto_260598 ?auto_260606 ) ) ( not ( = ?auto_260598 ?auto_260607 ) ) ( not ( = ?auto_260599 ?auto_260600 ) ) ( not ( = ?auto_260599 ?auto_260601 ) ) ( not ( = ?auto_260599 ?auto_260602 ) ) ( not ( = ?auto_260599 ?auto_260603 ) ) ( not ( = ?auto_260599 ?auto_260604 ) ) ( not ( = ?auto_260599 ?auto_260605 ) ) ( not ( = ?auto_260599 ?auto_260606 ) ) ( not ( = ?auto_260599 ?auto_260607 ) ) ( not ( = ?auto_260600 ?auto_260601 ) ) ( not ( = ?auto_260600 ?auto_260602 ) ) ( not ( = ?auto_260600 ?auto_260603 ) ) ( not ( = ?auto_260600 ?auto_260604 ) ) ( not ( = ?auto_260600 ?auto_260605 ) ) ( not ( = ?auto_260600 ?auto_260606 ) ) ( not ( = ?auto_260600 ?auto_260607 ) ) ( not ( = ?auto_260601 ?auto_260602 ) ) ( not ( = ?auto_260601 ?auto_260603 ) ) ( not ( = ?auto_260601 ?auto_260604 ) ) ( not ( = ?auto_260601 ?auto_260605 ) ) ( not ( = ?auto_260601 ?auto_260606 ) ) ( not ( = ?auto_260601 ?auto_260607 ) ) ( not ( = ?auto_260602 ?auto_260603 ) ) ( not ( = ?auto_260602 ?auto_260604 ) ) ( not ( = ?auto_260602 ?auto_260605 ) ) ( not ( = ?auto_260602 ?auto_260606 ) ) ( not ( = ?auto_260602 ?auto_260607 ) ) ( not ( = ?auto_260603 ?auto_260604 ) ) ( not ( = ?auto_260603 ?auto_260605 ) ) ( not ( = ?auto_260603 ?auto_260606 ) ) ( not ( = ?auto_260603 ?auto_260607 ) ) ( not ( = ?auto_260604 ?auto_260605 ) ) ( not ( = ?auto_260604 ?auto_260606 ) ) ( not ( = ?auto_260604 ?auto_260607 ) ) ( not ( = ?auto_260605 ?auto_260606 ) ) ( not ( = ?auto_260605 ?auto_260607 ) ) ( not ( = ?auto_260606 ?auto_260607 ) ) ( ON ?auto_260605 ?auto_260606 ) ( ON ?auto_260604 ?auto_260605 ) ( ON ?auto_260603 ?auto_260604 ) ( ON ?auto_260602 ?auto_260603 ) ( CLEAR ?auto_260600 ) ( ON ?auto_260601 ?auto_260602 ) ( CLEAR ?auto_260601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_260594 ?auto_260595 ?auto_260596 ?auto_260597 ?auto_260598 ?auto_260599 ?auto_260600 ?auto_260601 )
      ( MAKE-13PILE ?auto_260594 ?auto_260595 ?auto_260596 ?auto_260597 ?auto_260598 ?auto_260599 ?auto_260600 ?auto_260601 ?auto_260602 ?auto_260603 ?auto_260604 ?auto_260605 ?auto_260606 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260621 - BLOCK
      ?auto_260622 - BLOCK
      ?auto_260623 - BLOCK
      ?auto_260624 - BLOCK
      ?auto_260625 - BLOCK
      ?auto_260626 - BLOCK
      ?auto_260627 - BLOCK
      ?auto_260628 - BLOCK
      ?auto_260629 - BLOCK
      ?auto_260630 - BLOCK
      ?auto_260631 - BLOCK
      ?auto_260632 - BLOCK
      ?auto_260633 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_260633 ) ( ON-TABLE ?auto_260621 ) ( ON ?auto_260622 ?auto_260621 ) ( ON ?auto_260623 ?auto_260622 ) ( ON ?auto_260624 ?auto_260623 ) ( ON ?auto_260625 ?auto_260624 ) ( ON ?auto_260626 ?auto_260625 ) ( ON ?auto_260627 ?auto_260626 ) ( not ( = ?auto_260621 ?auto_260622 ) ) ( not ( = ?auto_260621 ?auto_260623 ) ) ( not ( = ?auto_260621 ?auto_260624 ) ) ( not ( = ?auto_260621 ?auto_260625 ) ) ( not ( = ?auto_260621 ?auto_260626 ) ) ( not ( = ?auto_260621 ?auto_260627 ) ) ( not ( = ?auto_260621 ?auto_260628 ) ) ( not ( = ?auto_260621 ?auto_260629 ) ) ( not ( = ?auto_260621 ?auto_260630 ) ) ( not ( = ?auto_260621 ?auto_260631 ) ) ( not ( = ?auto_260621 ?auto_260632 ) ) ( not ( = ?auto_260621 ?auto_260633 ) ) ( not ( = ?auto_260622 ?auto_260623 ) ) ( not ( = ?auto_260622 ?auto_260624 ) ) ( not ( = ?auto_260622 ?auto_260625 ) ) ( not ( = ?auto_260622 ?auto_260626 ) ) ( not ( = ?auto_260622 ?auto_260627 ) ) ( not ( = ?auto_260622 ?auto_260628 ) ) ( not ( = ?auto_260622 ?auto_260629 ) ) ( not ( = ?auto_260622 ?auto_260630 ) ) ( not ( = ?auto_260622 ?auto_260631 ) ) ( not ( = ?auto_260622 ?auto_260632 ) ) ( not ( = ?auto_260622 ?auto_260633 ) ) ( not ( = ?auto_260623 ?auto_260624 ) ) ( not ( = ?auto_260623 ?auto_260625 ) ) ( not ( = ?auto_260623 ?auto_260626 ) ) ( not ( = ?auto_260623 ?auto_260627 ) ) ( not ( = ?auto_260623 ?auto_260628 ) ) ( not ( = ?auto_260623 ?auto_260629 ) ) ( not ( = ?auto_260623 ?auto_260630 ) ) ( not ( = ?auto_260623 ?auto_260631 ) ) ( not ( = ?auto_260623 ?auto_260632 ) ) ( not ( = ?auto_260623 ?auto_260633 ) ) ( not ( = ?auto_260624 ?auto_260625 ) ) ( not ( = ?auto_260624 ?auto_260626 ) ) ( not ( = ?auto_260624 ?auto_260627 ) ) ( not ( = ?auto_260624 ?auto_260628 ) ) ( not ( = ?auto_260624 ?auto_260629 ) ) ( not ( = ?auto_260624 ?auto_260630 ) ) ( not ( = ?auto_260624 ?auto_260631 ) ) ( not ( = ?auto_260624 ?auto_260632 ) ) ( not ( = ?auto_260624 ?auto_260633 ) ) ( not ( = ?auto_260625 ?auto_260626 ) ) ( not ( = ?auto_260625 ?auto_260627 ) ) ( not ( = ?auto_260625 ?auto_260628 ) ) ( not ( = ?auto_260625 ?auto_260629 ) ) ( not ( = ?auto_260625 ?auto_260630 ) ) ( not ( = ?auto_260625 ?auto_260631 ) ) ( not ( = ?auto_260625 ?auto_260632 ) ) ( not ( = ?auto_260625 ?auto_260633 ) ) ( not ( = ?auto_260626 ?auto_260627 ) ) ( not ( = ?auto_260626 ?auto_260628 ) ) ( not ( = ?auto_260626 ?auto_260629 ) ) ( not ( = ?auto_260626 ?auto_260630 ) ) ( not ( = ?auto_260626 ?auto_260631 ) ) ( not ( = ?auto_260626 ?auto_260632 ) ) ( not ( = ?auto_260626 ?auto_260633 ) ) ( not ( = ?auto_260627 ?auto_260628 ) ) ( not ( = ?auto_260627 ?auto_260629 ) ) ( not ( = ?auto_260627 ?auto_260630 ) ) ( not ( = ?auto_260627 ?auto_260631 ) ) ( not ( = ?auto_260627 ?auto_260632 ) ) ( not ( = ?auto_260627 ?auto_260633 ) ) ( not ( = ?auto_260628 ?auto_260629 ) ) ( not ( = ?auto_260628 ?auto_260630 ) ) ( not ( = ?auto_260628 ?auto_260631 ) ) ( not ( = ?auto_260628 ?auto_260632 ) ) ( not ( = ?auto_260628 ?auto_260633 ) ) ( not ( = ?auto_260629 ?auto_260630 ) ) ( not ( = ?auto_260629 ?auto_260631 ) ) ( not ( = ?auto_260629 ?auto_260632 ) ) ( not ( = ?auto_260629 ?auto_260633 ) ) ( not ( = ?auto_260630 ?auto_260631 ) ) ( not ( = ?auto_260630 ?auto_260632 ) ) ( not ( = ?auto_260630 ?auto_260633 ) ) ( not ( = ?auto_260631 ?auto_260632 ) ) ( not ( = ?auto_260631 ?auto_260633 ) ) ( not ( = ?auto_260632 ?auto_260633 ) ) ( ON ?auto_260632 ?auto_260633 ) ( ON ?auto_260631 ?auto_260632 ) ( ON ?auto_260630 ?auto_260631 ) ( ON ?auto_260629 ?auto_260630 ) ( CLEAR ?auto_260627 ) ( ON ?auto_260628 ?auto_260629 ) ( CLEAR ?auto_260628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_260621 ?auto_260622 ?auto_260623 ?auto_260624 ?auto_260625 ?auto_260626 ?auto_260627 ?auto_260628 )
      ( MAKE-13PILE ?auto_260621 ?auto_260622 ?auto_260623 ?auto_260624 ?auto_260625 ?auto_260626 ?auto_260627 ?auto_260628 ?auto_260629 ?auto_260630 ?auto_260631 ?auto_260632 ?auto_260633 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260647 - BLOCK
      ?auto_260648 - BLOCK
      ?auto_260649 - BLOCK
      ?auto_260650 - BLOCK
      ?auto_260651 - BLOCK
      ?auto_260652 - BLOCK
      ?auto_260653 - BLOCK
      ?auto_260654 - BLOCK
      ?auto_260655 - BLOCK
      ?auto_260656 - BLOCK
      ?auto_260657 - BLOCK
      ?auto_260658 - BLOCK
      ?auto_260659 - BLOCK
    )
    :vars
    (
      ?auto_260660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260659 ?auto_260660 ) ( ON-TABLE ?auto_260647 ) ( ON ?auto_260648 ?auto_260647 ) ( ON ?auto_260649 ?auto_260648 ) ( ON ?auto_260650 ?auto_260649 ) ( ON ?auto_260651 ?auto_260650 ) ( ON ?auto_260652 ?auto_260651 ) ( not ( = ?auto_260647 ?auto_260648 ) ) ( not ( = ?auto_260647 ?auto_260649 ) ) ( not ( = ?auto_260647 ?auto_260650 ) ) ( not ( = ?auto_260647 ?auto_260651 ) ) ( not ( = ?auto_260647 ?auto_260652 ) ) ( not ( = ?auto_260647 ?auto_260653 ) ) ( not ( = ?auto_260647 ?auto_260654 ) ) ( not ( = ?auto_260647 ?auto_260655 ) ) ( not ( = ?auto_260647 ?auto_260656 ) ) ( not ( = ?auto_260647 ?auto_260657 ) ) ( not ( = ?auto_260647 ?auto_260658 ) ) ( not ( = ?auto_260647 ?auto_260659 ) ) ( not ( = ?auto_260647 ?auto_260660 ) ) ( not ( = ?auto_260648 ?auto_260649 ) ) ( not ( = ?auto_260648 ?auto_260650 ) ) ( not ( = ?auto_260648 ?auto_260651 ) ) ( not ( = ?auto_260648 ?auto_260652 ) ) ( not ( = ?auto_260648 ?auto_260653 ) ) ( not ( = ?auto_260648 ?auto_260654 ) ) ( not ( = ?auto_260648 ?auto_260655 ) ) ( not ( = ?auto_260648 ?auto_260656 ) ) ( not ( = ?auto_260648 ?auto_260657 ) ) ( not ( = ?auto_260648 ?auto_260658 ) ) ( not ( = ?auto_260648 ?auto_260659 ) ) ( not ( = ?auto_260648 ?auto_260660 ) ) ( not ( = ?auto_260649 ?auto_260650 ) ) ( not ( = ?auto_260649 ?auto_260651 ) ) ( not ( = ?auto_260649 ?auto_260652 ) ) ( not ( = ?auto_260649 ?auto_260653 ) ) ( not ( = ?auto_260649 ?auto_260654 ) ) ( not ( = ?auto_260649 ?auto_260655 ) ) ( not ( = ?auto_260649 ?auto_260656 ) ) ( not ( = ?auto_260649 ?auto_260657 ) ) ( not ( = ?auto_260649 ?auto_260658 ) ) ( not ( = ?auto_260649 ?auto_260659 ) ) ( not ( = ?auto_260649 ?auto_260660 ) ) ( not ( = ?auto_260650 ?auto_260651 ) ) ( not ( = ?auto_260650 ?auto_260652 ) ) ( not ( = ?auto_260650 ?auto_260653 ) ) ( not ( = ?auto_260650 ?auto_260654 ) ) ( not ( = ?auto_260650 ?auto_260655 ) ) ( not ( = ?auto_260650 ?auto_260656 ) ) ( not ( = ?auto_260650 ?auto_260657 ) ) ( not ( = ?auto_260650 ?auto_260658 ) ) ( not ( = ?auto_260650 ?auto_260659 ) ) ( not ( = ?auto_260650 ?auto_260660 ) ) ( not ( = ?auto_260651 ?auto_260652 ) ) ( not ( = ?auto_260651 ?auto_260653 ) ) ( not ( = ?auto_260651 ?auto_260654 ) ) ( not ( = ?auto_260651 ?auto_260655 ) ) ( not ( = ?auto_260651 ?auto_260656 ) ) ( not ( = ?auto_260651 ?auto_260657 ) ) ( not ( = ?auto_260651 ?auto_260658 ) ) ( not ( = ?auto_260651 ?auto_260659 ) ) ( not ( = ?auto_260651 ?auto_260660 ) ) ( not ( = ?auto_260652 ?auto_260653 ) ) ( not ( = ?auto_260652 ?auto_260654 ) ) ( not ( = ?auto_260652 ?auto_260655 ) ) ( not ( = ?auto_260652 ?auto_260656 ) ) ( not ( = ?auto_260652 ?auto_260657 ) ) ( not ( = ?auto_260652 ?auto_260658 ) ) ( not ( = ?auto_260652 ?auto_260659 ) ) ( not ( = ?auto_260652 ?auto_260660 ) ) ( not ( = ?auto_260653 ?auto_260654 ) ) ( not ( = ?auto_260653 ?auto_260655 ) ) ( not ( = ?auto_260653 ?auto_260656 ) ) ( not ( = ?auto_260653 ?auto_260657 ) ) ( not ( = ?auto_260653 ?auto_260658 ) ) ( not ( = ?auto_260653 ?auto_260659 ) ) ( not ( = ?auto_260653 ?auto_260660 ) ) ( not ( = ?auto_260654 ?auto_260655 ) ) ( not ( = ?auto_260654 ?auto_260656 ) ) ( not ( = ?auto_260654 ?auto_260657 ) ) ( not ( = ?auto_260654 ?auto_260658 ) ) ( not ( = ?auto_260654 ?auto_260659 ) ) ( not ( = ?auto_260654 ?auto_260660 ) ) ( not ( = ?auto_260655 ?auto_260656 ) ) ( not ( = ?auto_260655 ?auto_260657 ) ) ( not ( = ?auto_260655 ?auto_260658 ) ) ( not ( = ?auto_260655 ?auto_260659 ) ) ( not ( = ?auto_260655 ?auto_260660 ) ) ( not ( = ?auto_260656 ?auto_260657 ) ) ( not ( = ?auto_260656 ?auto_260658 ) ) ( not ( = ?auto_260656 ?auto_260659 ) ) ( not ( = ?auto_260656 ?auto_260660 ) ) ( not ( = ?auto_260657 ?auto_260658 ) ) ( not ( = ?auto_260657 ?auto_260659 ) ) ( not ( = ?auto_260657 ?auto_260660 ) ) ( not ( = ?auto_260658 ?auto_260659 ) ) ( not ( = ?auto_260658 ?auto_260660 ) ) ( not ( = ?auto_260659 ?auto_260660 ) ) ( ON ?auto_260658 ?auto_260659 ) ( ON ?auto_260657 ?auto_260658 ) ( ON ?auto_260656 ?auto_260657 ) ( ON ?auto_260655 ?auto_260656 ) ( ON ?auto_260654 ?auto_260655 ) ( CLEAR ?auto_260652 ) ( ON ?auto_260653 ?auto_260654 ) ( CLEAR ?auto_260653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_260647 ?auto_260648 ?auto_260649 ?auto_260650 ?auto_260651 ?auto_260652 ?auto_260653 )
      ( MAKE-13PILE ?auto_260647 ?auto_260648 ?auto_260649 ?auto_260650 ?auto_260651 ?auto_260652 ?auto_260653 ?auto_260654 ?auto_260655 ?auto_260656 ?auto_260657 ?auto_260658 ?auto_260659 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260674 - BLOCK
      ?auto_260675 - BLOCK
      ?auto_260676 - BLOCK
      ?auto_260677 - BLOCK
      ?auto_260678 - BLOCK
      ?auto_260679 - BLOCK
      ?auto_260680 - BLOCK
      ?auto_260681 - BLOCK
      ?auto_260682 - BLOCK
      ?auto_260683 - BLOCK
      ?auto_260684 - BLOCK
      ?auto_260685 - BLOCK
      ?auto_260686 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_260686 ) ( ON-TABLE ?auto_260674 ) ( ON ?auto_260675 ?auto_260674 ) ( ON ?auto_260676 ?auto_260675 ) ( ON ?auto_260677 ?auto_260676 ) ( ON ?auto_260678 ?auto_260677 ) ( ON ?auto_260679 ?auto_260678 ) ( not ( = ?auto_260674 ?auto_260675 ) ) ( not ( = ?auto_260674 ?auto_260676 ) ) ( not ( = ?auto_260674 ?auto_260677 ) ) ( not ( = ?auto_260674 ?auto_260678 ) ) ( not ( = ?auto_260674 ?auto_260679 ) ) ( not ( = ?auto_260674 ?auto_260680 ) ) ( not ( = ?auto_260674 ?auto_260681 ) ) ( not ( = ?auto_260674 ?auto_260682 ) ) ( not ( = ?auto_260674 ?auto_260683 ) ) ( not ( = ?auto_260674 ?auto_260684 ) ) ( not ( = ?auto_260674 ?auto_260685 ) ) ( not ( = ?auto_260674 ?auto_260686 ) ) ( not ( = ?auto_260675 ?auto_260676 ) ) ( not ( = ?auto_260675 ?auto_260677 ) ) ( not ( = ?auto_260675 ?auto_260678 ) ) ( not ( = ?auto_260675 ?auto_260679 ) ) ( not ( = ?auto_260675 ?auto_260680 ) ) ( not ( = ?auto_260675 ?auto_260681 ) ) ( not ( = ?auto_260675 ?auto_260682 ) ) ( not ( = ?auto_260675 ?auto_260683 ) ) ( not ( = ?auto_260675 ?auto_260684 ) ) ( not ( = ?auto_260675 ?auto_260685 ) ) ( not ( = ?auto_260675 ?auto_260686 ) ) ( not ( = ?auto_260676 ?auto_260677 ) ) ( not ( = ?auto_260676 ?auto_260678 ) ) ( not ( = ?auto_260676 ?auto_260679 ) ) ( not ( = ?auto_260676 ?auto_260680 ) ) ( not ( = ?auto_260676 ?auto_260681 ) ) ( not ( = ?auto_260676 ?auto_260682 ) ) ( not ( = ?auto_260676 ?auto_260683 ) ) ( not ( = ?auto_260676 ?auto_260684 ) ) ( not ( = ?auto_260676 ?auto_260685 ) ) ( not ( = ?auto_260676 ?auto_260686 ) ) ( not ( = ?auto_260677 ?auto_260678 ) ) ( not ( = ?auto_260677 ?auto_260679 ) ) ( not ( = ?auto_260677 ?auto_260680 ) ) ( not ( = ?auto_260677 ?auto_260681 ) ) ( not ( = ?auto_260677 ?auto_260682 ) ) ( not ( = ?auto_260677 ?auto_260683 ) ) ( not ( = ?auto_260677 ?auto_260684 ) ) ( not ( = ?auto_260677 ?auto_260685 ) ) ( not ( = ?auto_260677 ?auto_260686 ) ) ( not ( = ?auto_260678 ?auto_260679 ) ) ( not ( = ?auto_260678 ?auto_260680 ) ) ( not ( = ?auto_260678 ?auto_260681 ) ) ( not ( = ?auto_260678 ?auto_260682 ) ) ( not ( = ?auto_260678 ?auto_260683 ) ) ( not ( = ?auto_260678 ?auto_260684 ) ) ( not ( = ?auto_260678 ?auto_260685 ) ) ( not ( = ?auto_260678 ?auto_260686 ) ) ( not ( = ?auto_260679 ?auto_260680 ) ) ( not ( = ?auto_260679 ?auto_260681 ) ) ( not ( = ?auto_260679 ?auto_260682 ) ) ( not ( = ?auto_260679 ?auto_260683 ) ) ( not ( = ?auto_260679 ?auto_260684 ) ) ( not ( = ?auto_260679 ?auto_260685 ) ) ( not ( = ?auto_260679 ?auto_260686 ) ) ( not ( = ?auto_260680 ?auto_260681 ) ) ( not ( = ?auto_260680 ?auto_260682 ) ) ( not ( = ?auto_260680 ?auto_260683 ) ) ( not ( = ?auto_260680 ?auto_260684 ) ) ( not ( = ?auto_260680 ?auto_260685 ) ) ( not ( = ?auto_260680 ?auto_260686 ) ) ( not ( = ?auto_260681 ?auto_260682 ) ) ( not ( = ?auto_260681 ?auto_260683 ) ) ( not ( = ?auto_260681 ?auto_260684 ) ) ( not ( = ?auto_260681 ?auto_260685 ) ) ( not ( = ?auto_260681 ?auto_260686 ) ) ( not ( = ?auto_260682 ?auto_260683 ) ) ( not ( = ?auto_260682 ?auto_260684 ) ) ( not ( = ?auto_260682 ?auto_260685 ) ) ( not ( = ?auto_260682 ?auto_260686 ) ) ( not ( = ?auto_260683 ?auto_260684 ) ) ( not ( = ?auto_260683 ?auto_260685 ) ) ( not ( = ?auto_260683 ?auto_260686 ) ) ( not ( = ?auto_260684 ?auto_260685 ) ) ( not ( = ?auto_260684 ?auto_260686 ) ) ( not ( = ?auto_260685 ?auto_260686 ) ) ( ON ?auto_260685 ?auto_260686 ) ( ON ?auto_260684 ?auto_260685 ) ( ON ?auto_260683 ?auto_260684 ) ( ON ?auto_260682 ?auto_260683 ) ( ON ?auto_260681 ?auto_260682 ) ( CLEAR ?auto_260679 ) ( ON ?auto_260680 ?auto_260681 ) ( CLEAR ?auto_260680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_260674 ?auto_260675 ?auto_260676 ?auto_260677 ?auto_260678 ?auto_260679 ?auto_260680 )
      ( MAKE-13PILE ?auto_260674 ?auto_260675 ?auto_260676 ?auto_260677 ?auto_260678 ?auto_260679 ?auto_260680 ?auto_260681 ?auto_260682 ?auto_260683 ?auto_260684 ?auto_260685 ?auto_260686 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260700 - BLOCK
      ?auto_260701 - BLOCK
      ?auto_260702 - BLOCK
      ?auto_260703 - BLOCK
      ?auto_260704 - BLOCK
      ?auto_260705 - BLOCK
      ?auto_260706 - BLOCK
      ?auto_260707 - BLOCK
      ?auto_260708 - BLOCK
      ?auto_260709 - BLOCK
      ?auto_260710 - BLOCK
      ?auto_260711 - BLOCK
      ?auto_260712 - BLOCK
    )
    :vars
    (
      ?auto_260713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260712 ?auto_260713 ) ( ON-TABLE ?auto_260700 ) ( ON ?auto_260701 ?auto_260700 ) ( ON ?auto_260702 ?auto_260701 ) ( ON ?auto_260703 ?auto_260702 ) ( ON ?auto_260704 ?auto_260703 ) ( not ( = ?auto_260700 ?auto_260701 ) ) ( not ( = ?auto_260700 ?auto_260702 ) ) ( not ( = ?auto_260700 ?auto_260703 ) ) ( not ( = ?auto_260700 ?auto_260704 ) ) ( not ( = ?auto_260700 ?auto_260705 ) ) ( not ( = ?auto_260700 ?auto_260706 ) ) ( not ( = ?auto_260700 ?auto_260707 ) ) ( not ( = ?auto_260700 ?auto_260708 ) ) ( not ( = ?auto_260700 ?auto_260709 ) ) ( not ( = ?auto_260700 ?auto_260710 ) ) ( not ( = ?auto_260700 ?auto_260711 ) ) ( not ( = ?auto_260700 ?auto_260712 ) ) ( not ( = ?auto_260700 ?auto_260713 ) ) ( not ( = ?auto_260701 ?auto_260702 ) ) ( not ( = ?auto_260701 ?auto_260703 ) ) ( not ( = ?auto_260701 ?auto_260704 ) ) ( not ( = ?auto_260701 ?auto_260705 ) ) ( not ( = ?auto_260701 ?auto_260706 ) ) ( not ( = ?auto_260701 ?auto_260707 ) ) ( not ( = ?auto_260701 ?auto_260708 ) ) ( not ( = ?auto_260701 ?auto_260709 ) ) ( not ( = ?auto_260701 ?auto_260710 ) ) ( not ( = ?auto_260701 ?auto_260711 ) ) ( not ( = ?auto_260701 ?auto_260712 ) ) ( not ( = ?auto_260701 ?auto_260713 ) ) ( not ( = ?auto_260702 ?auto_260703 ) ) ( not ( = ?auto_260702 ?auto_260704 ) ) ( not ( = ?auto_260702 ?auto_260705 ) ) ( not ( = ?auto_260702 ?auto_260706 ) ) ( not ( = ?auto_260702 ?auto_260707 ) ) ( not ( = ?auto_260702 ?auto_260708 ) ) ( not ( = ?auto_260702 ?auto_260709 ) ) ( not ( = ?auto_260702 ?auto_260710 ) ) ( not ( = ?auto_260702 ?auto_260711 ) ) ( not ( = ?auto_260702 ?auto_260712 ) ) ( not ( = ?auto_260702 ?auto_260713 ) ) ( not ( = ?auto_260703 ?auto_260704 ) ) ( not ( = ?auto_260703 ?auto_260705 ) ) ( not ( = ?auto_260703 ?auto_260706 ) ) ( not ( = ?auto_260703 ?auto_260707 ) ) ( not ( = ?auto_260703 ?auto_260708 ) ) ( not ( = ?auto_260703 ?auto_260709 ) ) ( not ( = ?auto_260703 ?auto_260710 ) ) ( not ( = ?auto_260703 ?auto_260711 ) ) ( not ( = ?auto_260703 ?auto_260712 ) ) ( not ( = ?auto_260703 ?auto_260713 ) ) ( not ( = ?auto_260704 ?auto_260705 ) ) ( not ( = ?auto_260704 ?auto_260706 ) ) ( not ( = ?auto_260704 ?auto_260707 ) ) ( not ( = ?auto_260704 ?auto_260708 ) ) ( not ( = ?auto_260704 ?auto_260709 ) ) ( not ( = ?auto_260704 ?auto_260710 ) ) ( not ( = ?auto_260704 ?auto_260711 ) ) ( not ( = ?auto_260704 ?auto_260712 ) ) ( not ( = ?auto_260704 ?auto_260713 ) ) ( not ( = ?auto_260705 ?auto_260706 ) ) ( not ( = ?auto_260705 ?auto_260707 ) ) ( not ( = ?auto_260705 ?auto_260708 ) ) ( not ( = ?auto_260705 ?auto_260709 ) ) ( not ( = ?auto_260705 ?auto_260710 ) ) ( not ( = ?auto_260705 ?auto_260711 ) ) ( not ( = ?auto_260705 ?auto_260712 ) ) ( not ( = ?auto_260705 ?auto_260713 ) ) ( not ( = ?auto_260706 ?auto_260707 ) ) ( not ( = ?auto_260706 ?auto_260708 ) ) ( not ( = ?auto_260706 ?auto_260709 ) ) ( not ( = ?auto_260706 ?auto_260710 ) ) ( not ( = ?auto_260706 ?auto_260711 ) ) ( not ( = ?auto_260706 ?auto_260712 ) ) ( not ( = ?auto_260706 ?auto_260713 ) ) ( not ( = ?auto_260707 ?auto_260708 ) ) ( not ( = ?auto_260707 ?auto_260709 ) ) ( not ( = ?auto_260707 ?auto_260710 ) ) ( not ( = ?auto_260707 ?auto_260711 ) ) ( not ( = ?auto_260707 ?auto_260712 ) ) ( not ( = ?auto_260707 ?auto_260713 ) ) ( not ( = ?auto_260708 ?auto_260709 ) ) ( not ( = ?auto_260708 ?auto_260710 ) ) ( not ( = ?auto_260708 ?auto_260711 ) ) ( not ( = ?auto_260708 ?auto_260712 ) ) ( not ( = ?auto_260708 ?auto_260713 ) ) ( not ( = ?auto_260709 ?auto_260710 ) ) ( not ( = ?auto_260709 ?auto_260711 ) ) ( not ( = ?auto_260709 ?auto_260712 ) ) ( not ( = ?auto_260709 ?auto_260713 ) ) ( not ( = ?auto_260710 ?auto_260711 ) ) ( not ( = ?auto_260710 ?auto_260712 ) ) ( not ( = ?auto_260710 ?auto_260713 ) ) ( not ( = ?auto_260711 ?auto_260712 ) ) ( not ( = ?auto_260711 ?auto_260713 ) ) ( not ( = ?auto_260712 ?auto_260713 ) ) ( ON ?auto_260711 ?auto_260712 ) ( ON ?auto_260710 ?auto_260711 ) ( ON ?auto_260709 ?auto_260710 ) ( ON ?auto_260708 ?auto_260709 ) ( ON ?auto_260707 ?auto_260708 ) ( ON ?auto_260706 ?auto_260707 ) ( CLEAR ?auto_260704 ) ( ON ?auto_260705 ?auto_260706 ) ( CLEAR ?auto_260705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_260700 ?auto_260701 ?auto_260702 ?auto_260703 ?auto_260704 ?auto_260705 )
      ( MAKE-13PILE ?auto_260700 ?auto_260701 ?auto_260702 ?auto_260703 ?auto_260704 ?auto_260705 ?auto_260706 ?auto_260707 ?auto_260708 ?auto_260709 ?auto_260710 ?auto_260711 ?auto_260712 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260727 - BLOCK
      ?auto_260728 - BLOCK
      ?auto_260729 - BLOCK
      ?auto_260730 - BLOCK
      ?auto_260731 - BLOCK
      ?auto_260732 - BLOCK
      ?auto_260733 - BLOCK
      ?auto_260734 - BLOCK
      ?auto_260735 - BLOCK
      ?auto_260736 - BLOCK
      ?auto_260737 - BLOCK
      ?auto_260738 - BLOCK
      ?auto_260739 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_260739 ) ( ON-TABLE ?auto_260727 ) ( ON ?auto_260728 ?auto_260727 ) ( ON ?auto_260729 ?auto_260728 ) ( ON ?auto_260730 ?auto_260729 ) ( ON ?auto_260731 ?auto_260730 ) ( not ( = ?auto_260727 ?auto_260728 ) ) ( not ( = ?auto_260727 ?auto_260729 ) ) ( not ( = ?auto_260727 ?auto_260730 ) ) ( not ( = ?auto_260727 ?auto_260731 ) ) ( not ( = ?auto_260727 ?auto_260732 ) ) ( not ( = ?auto_260727 ?auto_260733 ) ) ( not ( = ?auto_260727 ?auto_260734 ) ) ( not ( = ?auto_260727 ?auto_260735 ) ) ( not ( = ?auto_260727 ?auto_260736 ) ) ( not ( = ?auto_260727 ?auto_260737 ) ) ( not ( = ?auto_260727 ?auto_260738 ) ) ( not ( = ?auto_260727 ?auto_260739 ) ) ( not ( = ?auto_260728 ?auto_260729 ) ) ( not ( = ?auto_260728 ?auto_260730 ) ) ( not ( = ?auto_260728 ?auto_260731 ) ) ( not ( = ?auto_260728 ?auto_260732 ) ) ( not ( = ?auto_260728 ?auto_260733 ) ) ( not ( = ?auto_260728 ?auto_260734 ) ) ( not ( = ?auto_260728 ?auto_260735 ) ) ( not ( = ?auto_260728 ?auto_260736 ) ) ( not ( = ?auto_260728 ?auto_260737 ) ) ( not ( = ?auto_260728 ?auto_260738 ) ) ( not ( = ?auto_260728 ?auto_260739 ) ) ( not ( = ?auto_260729 ?auto_260730 ) ) ( not ( = ?auto_260729 ?auto_260731 ) ) ( not ( = ?auto_260729 ?auto_260732 ) ) ( not ( = ?auto_260729 ?auto_260733 ) ) ( not ( = ?auto_260729 ?auto_260734 ) ) ( not ( = ?auto_260729 ?auto_260735 ) ) ( not ( = ?auto_260729 ?auto_260736 ) ) ( not ( = ?auto_260729 ?auto_260737 ) ) ( not ( = ?auto_260729 ?auto_260738 ) ) ( not ( = ?auto_260729 ?auto_260739 ) ) ( not ( = ?auto_260730 ?auto_260731 ) ) ( not ( = ?auto_260730 ?auto_260732 ) ) ( not ( = ?auto_260730 ?auto_260733 ) ) ( not ( = ?auto_260730 ?auto_260734 ) ) ( not ( = ?auto_260730 ?auto_260735 ) ) ( not ( = ?auto_260730 ?auto_260736 ) ) ( not ( = ?auto_260730 ?auto_260737 ) ) ( not ( = ?auto_260730 ?auto_260738 ) ) ( not ( = ?auto_260730 ?auto_260739 ) ) ( not ( = ?auto_260731 ?auto_260732 ) ) ( not ( = ?auto_260731 ?auto_260733 ) ) ( not ( = ?auto_260731 ?auto_260734 ) ) ( not ( = ?auto_260731 ?auto_260735 ) ) ( not ( = ?auto_260731 ?auto_260736 ) ) ( not ( = ?auto_260731 ?auto_260737 ) ) ( not ( = ?auto_260731 ?auto_260738 ) ) ( not ( = ?auto_260731 ?auto_260739 ) ) ( not ( = ?auto_260732 ?auto_260733 ) ) ( not ( = ?auto_260732 ?auto_260734 ) ) ( not ( = ?auto_260732 ?auto_260735 ) ) ( not ( = ?auto_260732 ?auto_260736 ) ) ( not ( = ?auto_260732 ?auto_260737 ) ) ( not ( = ?auto_260732 ?auto_260738 ) ) ( not ( = ?auto_260732 ?auto_260739 ) ) ( not ( = ?auto_260733 ?auto_260734 ) ) ( not ( = ?auto_260733 ?auto_260735 ) ) ( not ( = ?auto_260733 ?auto_260736 ) ) ( not ( = ?auto_260733 ?auto_260737 ) ) ( not ( = ?auto_260733 ?auto_260738 ) ) ( not ( = ?auto_260733 ?auto_260739 ) ) ( not ( = ?auto_260734 ?auto_260735 ) ) ( not ( = ?auto_260734 ?auto_260736 ) ) ( not ( = ?auto_260734 ?auto_260737 ) ) ( not ( = ?auto_260734 ?auto_260738 ) ) ( not ( = ?auto_260734 ?auto_260739 ) ) ( not ( = ?auto_260735 ?auto_260736 ) ) ( not ( = ?auto_260735 ?auto_260737 ) ) ( not ( = ?auto_260735 ?auto_260738 ) ) ( not ( = ?auto_260735 ?auto_260739 ) ) ( not ( = ?auto_260736 ?auto_260737 ) ) ( not ( = ?auto_260736 ?auto_260738 ) ) ( not ( = ?auto_260736 ?auto_260739 ) ) ( not ( = ?auto_260737 ?auto_260738 ) ) ( not ( = ?auto_260737 ?auto_260739 ) ) ( not ( = ?auto_260738 ?auto_260739 ) ) ( ON ?auto_260738 ?auto_260739 ) ( ON ?auto_260737 ?auto_260738 ) ( ON ?auto_260736 ?auto_260737 ) ( ON ?auto_260735 ?auto_260736 ) ( ON ?auto_260734 ?auto_260735 ) ( ON ?auto_260733 ?auto_260734 ) ( CLEAR ?auto_260731 ) ( ON ?auto_260732 ?auto_260733 ) ( CLEAR ?auto_260732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_260727 ?auto_260728 ?auto_260729 ?auto_260730 ?auto_260731 ?auto_260732 )
      ( MAKE-13PILE ?auto_260727 ?auto_260728 ?auto_260729 ?auto_260730 ?auto_260731 ?auto_260732 ?auto_260733 ?auto_260734 ?auto_260735 ?auto_260736 ?auto_260737 ?auto_260738 ?auto_260739 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260753 - BLOCK
      ?auto_260754 - BLOCK
      ?auto_260755 - BLOCK
      ?auto_260756 - BLOCK
      ?auto_260757 - BLOCK
      ?auto_260758 - BLOCK
      ?auto_260759 - BLOCK
      ?auto_260760 - BLOCK
      ?auto_260761 - BLOCK
      ?auto_260762 - BLOCK
      ?auto_260763 - BLOCK
      ?auto_260764 - BLOCK
      ?auto_260765 - BLOCK
    )
    :vars
    (
      ?auto_260766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260765 ?auto_260766 ) ( ON-TABLE ?auto_260753 ) ( ON ?auto_260754 ?auto_260753 ) ( ON ?auto_260755 ?auto_260754 ) ( ON ?auto_260756 ?auto_260755 ) ( not ( = ?auto_260753 ?auto_260754 ) ) ( not ( = ?auto_260753 ?auto_260755 ) ) ( not ( = ?auto_260753 ?auto_260756 ) ) ( not ( = ?auto_260753 ?auto_260757 ) ) ( not ( = ?auto_260753 ?auto_260758 ) ) ( not ( = ?auto_260753 ?auto_260759 ) ) ( not ( = ?auto_260753 ?auto_260760 ) ) ( not ( = ?auto_260753 ?auto_260761 ) ) ( not ( = ?auto_260753 ?auto_260762 ) ) ( not ( = ?auto_260753 ?auto_260763 ) ) ( not ( = ?auto_260753 ?auto_260764 ) ) ( not ( = ?auto_260753 ?auto_260765 ) ) ( not ( = ?auto_260753 ?auto_260766 ) ) ( not ( = ?auto_260754 ?auto_260755 ) ) ( not ( = ?auto_260754 ?auto_260756 ) ) ( not ( = ?auto_260754 ?auto_260757 ) ) ( not ( = ?auto_260754 ?auto_260758 ) ) ( not ( = ?auto_260754 ?auto_260759 ) ) ( not ( = ?auto_260754 ?auto_260760 ) ) ( not ( = ?auto_260754 ?auto_260761 ) ) ( not ( = ?auto_260754 ?auto_260762 ) ) ( not ( = ?auto_260754 ?auto_260763 ) ) ( not ( = ?auto_260754 ?auto_260764 ) ) ( not ( = ?auto_260754 ?auto_260765 ) ) ( not ( = ?auto_260754 ?auto_260766 ) ) ( not ( = ?auto_260755 ?auto_260756 ) ) ( not ( = ?auto_260755 ?auto_260757 ) ) ( not ( = ?auto_260755 ?auto_260758 ) ) ( not ( = ?auto_260755 ?auto_260759 ) ) ( not ( = ?auto_260755 ?auto_260760 ) ) ( not ( = ?auto_260755 ?auto_260761 ) ) ( not ( = ?auto_260755 ?auto_260762 ) ) ( not ( = ?auto_260755 ?auto_260763 ) ) ( not ( = ?auto_260755 ?auto_260764 ) ) ( not ( = ?auto_260755 ?auto_260765 ) ) ( not ( = ?auto_260755 ?auto_260766 ) ) ( not ( = ?auto_260756 ?auto_260757 ) ) ( not ( = ?auto_260756 ?auto_260758 ) ) ( not ( = ?auto_260756 ?auto_260759 ) ) ( not ( = ?auto_260756 ?auto_260760 ) ) ( not ( = ?auto_260756 ?auto_260761 ) ) ( not ( = ?auto_260756 ?auto_260762 ) ) ( not ( = ?auto_260756 ?auto_260763 ) ) ( not ( = ?auto_260756 ?auto_260764 ) ) ( not ( = ?auto_260756 ?auto_260765 ) ) ( not ( = ?auto_260756 ?auto_260766 ) ) ( not ( = ?auto_260757 ?auto_260758 ) ) ( not ( = ?auto_260757 ?auto_260759 ) ) ( not ( = ?auto_260757 ?auto_260760 ) ) ( not ( = ?auto_260757 ?auto_260761 ) ) ( not ( = ?auto_260757 ?auto_260762 ) ) ( not ( = ?auto_260757 ?auto_260763 ) ) ( not ( = ?auto_260757 ?auto_260764 ) ) ( not ( = ?auto_260757 ?auto_260765 ) ) ( not ( = ?auto_260757 ?auto_260766 ) ) ( not ( = ?auto_260758 ?auto_260759 ) ) ( not ( = ?auto_260758 ?auto_260760 ) ) ( not ( = ?auto_260758 ?auto_260761 ) ) ( not ( = ?auto_260758 ?auto_260762 ) ) ( not ( = ?auto_260758 ?auto_260763 ) ) ( not ( = ?auto_260758 ?auto_260764 ) ) ( not ( = ?auto_260758 ?auto_260765 ) ) ( not ( = ?auto_260758 ?auto_260766 ) ) ( not ( = ?auto_260759 ?auto_260760 ) ) ( not ( = ?auto_260759 ?auto_260761 ) ) ( not ( = ?auto_260759 ?auto_260762 ) ) ( not ( = ?auto_260759 ?auto_260763 ) ) ( not ( = ?auto_260759 ?auto_260764 ) ) ( not ( = ?auto_260759 ?auto_260765 ) ) ( not ( = ?auto_260759 ?auto_260766 ) ) ( not ( = ?auto_260760 ?auto_260761 ) ) ( not ( = ?auto_260760 ?auto_260762 ) ) ( not ( = ?auto_260760 ?auto_260763 ) ) ( not ( = ?auto_260760 ?auto_260764 ) ) ( not ( = ?auto_260760 ?auto_260765 ) ) ( not ( = ?auto_260760 ?auto_260766 ) ) ( not ( = ?auto_260761 ?auto_260762 ) ) ( not ( = ?auto_260761 ?auto_260763 ) ) ( not ( = ?auto_260761 ?auto_260764 ) ) ( not ( = ?auto_260761 ?auto_260765 ) ) ( not ( = ?auto_260761 ?auto_260766 ) ) ( not ( = ?auto_260762 ?auto_260763 ) ) ( not ( = ?auto_260762 ?auto_260764 ) ) ( not ( = ?auto_260762 ?auto_260765 ) ) ( not ( = ?auto_260762 ?auto_260766 ) ) ( not ( = ?auto_260763 ?auto_260764 ) ) ( not ( = ?auto_260763 ?auto_260765 ) ) ( not ( = ?auto_260763 ?auto_260766 ) ) ( not ( = ?auto_260764 ?auto_260765 ) ) ( not ( = ?auto_260764 ?auto_260766 ) ) ( not ( = ?auto_260765 ?auto_260766 ) ) ( ON ?auto_260764 ?auto_260765 ) ( ON ?auto_260763 ?auto_260764 ) ( ON ?auto_260762 ?auto_260763 ) ( ON ?auto_260761 ?auto_260762 ) ( ON ?auto_260760 ?auto_260761 ) ( ON ?auto_260759 ?auto_260760 ) ( ON ?auto_260758 ?auto_260759 ) ( CLEAR ?auto_260756 ) ( ON ?auto_260757 ?auto_260758 ) ( CLEAR ?auto_260757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_260753 ?auto_260754 ?auto_260755 ?auto_260756 ?auto_260757 )
      ( MAKE-13PILE ?auto_260753 ?auto_260754 ?auto_260755 ?auto_260756 ?auto_260757 ?auto_260758 ?auto_260759 ?auto_260760 ?auto_260761 ?auto_260762 ?auto_260763 ?auto_260764 ?auto_260765 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260780 - BLOCK
      ?auto_260781 - BLOCK
      ?auto_260782 - BLOCK
      ?auto_260783 - BLOCK
      ?auto_260784 - BLOCK
      ?auto_260785 - BLOCK
      ?auto_260786 - BLOCK
      ?auto_260787 - BLOCK
      ?auto_260788 - BLOCK
      ?auto_260789 - BLOCK
      ?auto_260790 - BLOCK
      ?auto_260791 - BLOCK
      ?auto_260792 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_260792 ) ( ON-TABLE ?auto_260780 ) ( ON ?auto_260781 ?auto_260780 ) ( ON ?auto_260782 ?auto_260781 ) ( ON ?auto_260783 ?auto_260782 ) ( not ( = ?auto_260780 ?auto_260781 ) ) ( not ( = ?auto_260780 ?auto_260782 ) ) ( not ( = ?auto_260780 ?auto_260783 ) ) ( not ( = ?auto_260780 ?auto_260784 ) ) ( not ( = ?auto_260780 ?auto_260785 ) ) ( not ( = ?auto_260780 ?auto_260786 ) ) ( not ( = ?auto_260780 ?auto_260787 ) ) ( not ( = ?auto_260780 ?auto_260788 ) ) ( not ( = ?auto_260780 ?auto_260789 ) ) ( not ( = ?auto_260780 ?auto_260790 ) ) ( not ( = ?auto_260780 ?auto_260791 ) ) ( not ( = ?auto_260780 ?auto_260792 ) ) ( not ( = ?auto_260781 ?auto_260782 ) ) ( not ( = ?auto_260781 ?auto_260783 ) ) ( not ( = ?auto_260781 ?auto_260784 ) ) ( not ( = ?auto_260781 ?auto_260785 ) ) ( not ( = ?auto_260781 ?auto_260786 ) ) ( not ( = ?auto_260781 ?auto_260787 ) ) ( not ( = ?auto_260781 ?auto_260788 ) ) ( not ( = ?auto_260781 ?auto_260789 ) ) ( not ( = ?auto_260781 ?auto_260790 ) ) ( not ( = ?auto_260781 ?auto_260791 ) ) ( not ( = ?auto_260781 ?auto_260792 ) ) ( not ( = ?auto_260782 ?auto_260783 ) ) ( not ( = ?auto_260782 ?auto_260784 ) ) ( not ( = ?auto_260782 ?auto_260785 ) ) ( not ( = ?auto_260782 ?auto_260786 ) ) ( not ( = ?auto_260782 ?auto_260787 ) ) ( not ( = ?auto_260782 ?auto_260788 ) ) ( not ( = ?auto_260782 ?auto_260789 ) ) ( not ( = ?auto_260782 ?auto_260790 ) ) ( not ( = ?auto_260782 ?auto_260791 ) ) ( not ( = ?auto_260782 ?auto_260792 ) ) ( not ( = ?auto_260783 ?auto_260784 ) ) ( not ( = ?auto_260783 ?auto_260785 ) ) ( not ( = ?auto_260783 ?auto_260786 ) ) ( not ( = ?auto_260783 ?auto_260787 ) ) ( not ( = ?auto_260783 ?auto_260788 ) ) ( not ( = ?auto_260783 ?auto_260789 ) ) ( not ( = ?auto_260783 ?auto_260790 ) ) ( not ( = ?auto_260783 ?auto_260791 ) ) ( not ( = ?auto_260783 ?auto_260792 ) ) ( not ( = ?auto_260784 ?auto_260785 ) ) ( not ( = ?auto_260784 ?auto_260786 ) ) ( not ( = ?auto_260784 ?auto_260787 ) ) ( not ( = ?auto_260784 ?auto_260788 ) ) ( not ( = ?auto_260784 ?auto_260789 ) ) ( not ( = ?auto_260784 ?auto_260790 ) ) ( not ( = ?auto_260784 ?auto_260791 ) ) ( not ( = ?auto_260784 ?auto_260792 ) ) ( not ( = ?auto_260785 ?auto_260786 ) ) ( not ( = ?auto_260785 ?auto_260787 ) ) ( not ( = ?auto_260785 ?auto_260788 ) ) ( not ( = ?auto_260785 ?auto_260789 ) ) ( not ( = ?auto_260785 ?auto_260790 ) ) ( not ( = ?auto_260785 ?auto_260791 ) ) ( not ( = ?auto_260785 ?auto_260792 ) ) ( not ( = ?auto_260786 ?auto_260787 ) ) ( not ( = ?auto_260786 ?auto_260788 ) ) ( not ( = ?auto_260786 ?auto_260789 ) ) ( not ( = ?auto_260786 ?auto_260790 ) ) ( not ( = ?auto_260786 ?auto_260791 ) ) ( not ( = ?auto_260786 ?auto_260792 ) ) ( not ( = ?auto_260787 ?auto_260788 ) ) ( not ( = ?auto_260787 ?auto_260789 ) ) ( not ( = ?auto_260787 ?auto_260790 ) ) ( not ( = ?auto_260787 ?auto_260791 ) ) ( not ( = ?auto_260787 ?auto_260792 ) ) ( not ( = ?auto_260788 ?auto_260789 ) ) ( not ( = ?auto_260788 ?auto_260790 ) ) ( not ( = ?auto_260788 ?auto_260791 ) ) ( not ( = ?auto_260788 ?auto_260792 ) ) ( not ( = ?auto_260789 ?auto_260790 ) ) ( not ( = ?auto_260789 ?auto_260791 ) ) ( not ( = ?auto_260789 ?auto_260792 ) ) ( not ( = ?auto_260790 ?auto_260791 ) ) ( not ( = ?auto_260790 ?auto_260792 ) ) ( not ( = ?auto_260791 ?auto_260792 ) ) ( ON ?auto_260791 ?auto_260792 ) ( ON ?auto_260790 ?auto_260791 ) ( ON ?auto_260789 ?auto_260790 ) ( ON ?auto_260788 ?auto_260789 ) ( ON ?auto_260787 ?auto_260788 ) ( ON ?auto_260786 ?auto_260787 ) ( ON ?auto_260785 ?auto_260786 ) ( CLEAR ?auto_260783 ) ( ON ?auto_260784 ?auto_260785 ) ( CLEAR ?auto_260784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_260780 ?auto_260781 ?auto_260782 ?auto_260783 ?auto_260784 )
      ( MAKE-13PILE ?auto_260780 ?auto_260781 ?auto_260782 ?auto_260783 ?auto_260784 ?auto_260785 ?auto_260786 ?auto_260787 ?auto_260788 ?auto_260789 ?auto_260790 ?auto_260791 ?auto_260792 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260806 - BLOCK
      ?auto_260807 - BLOCK
      ?auto_260808 - BLOCK
      ?auto_260809 - BLOCK
      ?auto_260810 - BLOCK
      ?auto_260811 - BLOCK
      ?auto_260812 - BLOCK
      ?auto_260813 - BLOCK
      ?auto_260814 - BLOCK
      ?auto_260815 - BLOCK
      ?auto_260816 - BLOCK
      ?auto_260817 - BLOCK
      ?auto_260818 - BLOCK
    )
    :vars
    (
      ?auto_260819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260818 ?auto_260819 ) ( ON-TABLE ?auto_260806 ) ( ON ?auto_260807 ?auto_260806 ) ( ON ?auto_260808 ?auto_260807 ) ( not ( = ?auto_260806 ?auto_260807 ) ) ( not ( = ?auto_260806 ?auto_260808 ) ) ( not ( = ?auto_260806 ?auto_260809 ) ) ( not ( = ?auto_260806 ?auto_260810 ) ) ( not ( = ?auto_260806 ?auto_260811 ) ) ( not ( = ?auto_260806 ?auto_260812 ) ) ( not ( = ?auto_260806 ?auto_260813 ) ) ( not ( = ?auto_260806 ?auto_260814 ) ) ( not ( = ?auto_260806 ?auto_260815 ) ) ( not ( = ?auto_260806 ?auto_260816 ) ) ( not ( = ?auto_260806 ?auto_260817 ) ) ( not ( = ?auto_260806 ?auto_260818 ) ) ( not ( = ?auto_260806 ?auto_260819 ) ) ( not ( = ?auto_260807 ?auto_260808 ) ) ( not ( = ?auto_260807 ?auto_260809 ) ) ( not ( = ?auto_260807 ?auto_260810 ) ) ( not ( = ?auto_260807 ?auto_260811 ) ) ( not ( = ?auto_260807 ?auto_260812 ) ) ( not ( = ?auto_260807 ?auto_260813 ) ) ( not ( = ?auto_260807 ?auto_260814 ) ) ( not ( = ?auto_260807 ?auto_260815 ) ) ( not ( = ?auto_260807 ?auto_260816 ) ) ( not ( = ?auto_260807 ?auto_260817 ) ) ( not ( = ?auto_260807 ?auto_260818 ) ) ( not ( = ?auto_260807 ?auto_260819 ) ) ( not ( = ?auto_260808 ?auto_260809 ) ) ( not ( = ?auto_260808 ?auto_260810 ) ) ( not ( = ?auto_260808 ?auto_260811 ) ) ( not ( = ?auto_260808 ?auto_260812 ) ) ( not ( = ?auto_260808 ?auto_260813 ) ) ( not ( = ?auto_260808 ?auto_260814 ) ) ( not ( = ?auto_260808 ?auto_260815 ) ) ( not ( = ?auto_260808 ?auto_260816 ) ) ( not ( = ?auto_260808 ?auto_260817 ) ) ( not ( = ?auto_260808 ?auto_260818 ) ) ( not ( = ?auto_260808 ?auto_260819 ) ) ( not ( = ?auto_260809 ?auto_260810 ) ) ( not ( = ?auto_260809 ?auto_260811 ) ) ( not ( = ?auto_260809 ?auto_260812 ) ) ( not ( = ?auto_260809 ?auto_260813 ) ) ( not ( = ?auto_260809 ?auto_260814 ) ) ( not ( = ?auto_260809 ?auto_260815 ) ) ( not ( = ?auto_260809 ?auto_260816 ) ) ( not ( = ?auto_260809 ?auto_260817 ) ) ( not ( = ?auto_260809 ?auto_260818 ) ) ( not ( = ?auto_260809 ?auto_260819 ) ) ( not ( = ?auto_260810 ?auto_260811 ) ) ( not ( = ?auto_260810 ?auto_260812 ) ) ( not ( = ?auto_260810 ?auto_260813 ) ) ( not ( = ?auto_260810 ?auto_260814 ) ) ( not ( = ?auto_260810 ?auto_260815 ) ) ( not ( = ?auto_260810 ?auto_260816 ) ) ( not ( = ?auto_260810 ?auto_260817 ) ) ( not ( = ?auto_260810 ?auto_260818 ) ) ( not ( = ?auto_260810 ?auto_260819 ) ) ( not ( = ?auto_260811 ?auto_260812 ) ) ( not ( = ?auto_260811 ?auto_260813 ) ) ( not ( = ?auto_260811 ?auto_260814 ) ) ( not ( = ?auto_260811 ?auto_260815 ) ) ( not ( = ?auto_260811 ?auto_260816 ) ) ( not ( = ?auto_260811 ?auto_260817 ) ) ( not ( = ?auto_260811 ?auto_260818 ) ) ( not ( = ?auto_260811 ?auto_260819 ) ) ( not ( = ?auto_260812 ?auto_260813 ) ) ( not ( = ?auto_260812 ?auto_260814 ) ) ( not ( = ?auto_260812 ?auto_260815 ) ) ( not ( = ?auto_260812 ?auto_260816 ) ) ( not ( = ?auto_260812 ?auto_260817 ) ) ( not ( = ?auto_260812 ?auto_260818 ) ) ( not ( = ?auto_260812 ?auto_260819 ) ) ( not ( = ?auto_260813 ?auto_260814 ) ) ( not ( = ?auto_260813 ?auto_260815 ) ) ( not ( = ?auto_260813 ?auto_260816 ) ) ( not ( = ?auto_260813 ?auto_260817 ) ) ( not ( = ?auto_260813 ?auto_260818 ) ) ( not ( = ?auto_260813 ?auto_260819 ) ) ( not ( = ?auto_260814 ?auto_260815 ) ) ( not ( = ?auto_260814 ?auto_260816 ) ) ( not ( = ?auto_260814 ?auto_260817 ) ) ( not ( = ?auto_260814 ?auto_260818 ) ) ( not ( = ?auto_260814 ?auto_260819 ) ) ( not ( = ?auto_260815 ?auto_260816 ) ) ( not ( = ?auto_260815 ?auto_260817 ) ) ( not ( = ?auto_260815 ?auto_260818 ) ) ( not ( = ?auto_260815 ?auto_260819 ) ) ( not ( = ?auto_260816 ?auto_260817 ) ) ( not ( = ?auto_260816 ?auto_260818 ) ) ( not ( = ?auto_260816 ?auto_260819 ) ) ( not ( = ?auto_260817 ?auto_260818 ) ) ( not ( = ?auto_260817 ?auto_260819 ) ) ( not ( = ?auto_260818 ?auto_260819 ) ) ( ON ?auto_260817 ?auto_260818 ) ( ON ?auto_260816 ?auto_260817 ) ( ON ?auto_260815 ?auto_260816 ) ( ON ?auto_260814 ?auto_260815 ) ( ON ?auto_260813 ?auto_260814 ) ( ON ?auto_260812 ?auto_260813 ) ( ON ?auto_260811 ?auto_260812 ) ( ON ?auto_260810 ?auto_260811 ) ( CLEAR ?auto_260808 ) ( ON ?auto_260809 ?auto_260810 ) ( CLEAR ?auto_260809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_260806 ?auto_260807 ?auto_260808 ?auto_260809 )
      ( MAKE-13PILE ?auto_260806 ?auto_260807 ?auto_260808 ?auto_260809 ?auto_260810 ?auto_260811 ?auto_260812 ?auto_260813 ?auto_260814 ?auto_260815 ?auto_260816 ?auto_260817 ?auto_260818 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260833 - BLOCK
      ?auto_260834 - BLOCK
      ?auto_260835 - BLOCK
      ?auto_260836 - BLOCK
      ?auto_260837 - BLOCK
      ?auto_260838 - BLOCK
      ?auto_260839 - BLOCK
      ?auto_260840 - BLOCK
      ?auto_260841 - BLOCK
      ?auto_260842 - BLOCK
      ?auto_260843 - BLOCK
      ?auto_260844 - BLOCK
      ?auto_260845 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_260845 ) ( ON-TABLE ?auto_260833 ) ( ON ?auto_260834 ?auto_260833 ) ( ON ?auto_260835 ?auto_260834 ) ( not ( = ?auto_260833 ?auto_260834 ) ) ( not ( = ?auto_260833 ?auto_260835 ) ) ( not ( = ?auto_260833 ?auto_260836 ) ) ( not ( = ?auto_260833 ?auto_260837 ) ) ( not ( = ?auto_260833 ?auto_260838 ) ) ( not ( = ?auto_260833 ?auto_260839 ) ) ( not ( = ?auto_260833 ?auto_260840 ) ) ( not ( = ?auto_260833 ?auto_260841 ) ) ( not ( = ?auto_260833 ?auto_260842 ) ) ( not ( = ?auto_260833 ?auto_260843 ) ) ( not ( = ?auto_260833 ?auto_260844 ) ) ( not ( = ?auto_260833 ?auto_260845 ) ) ( not ( = ?auto_260834 ?auto_260835 ) ) ( not ( = ?auto_260834 ?auto_260836 ) ) ( not ( = ?auto_260834 ?auto_260837 ) ) ( not ( = ?auto_260834 ?auto_260838 ) ) ( not ( = ?auto_260834 ?auto_260839 ) ) ( not ( = ?auto_260834 ?auto_260840 ) ) ( not ( = ?auto_260834 ?auto_260841 ) ) ( not ( = ?auto_260834 ?auto_260842 ) ) ( not ( = ?auto_260834 ?auto_260843 ) ) ( not ( = ?auto_260834 ?auto_260844 ) ) ( not ( = ?auto_260834 ?auto_260845 ) ) ( not ( = ?auto_260835 ?auto_260836 ) ) ( not ( = ?auto_260835 ?auto_260837 ) ) ( not ( = ?auto_260835 ?auto_260838 ) ) ( not ( = ?auto_260835 ?auto_260839 ) ) ( not ( = ?auto_260835 ?auto_260840 ) ) ( not ( = ?auto_260835 ?auto_260841 ) ) ( not ( = ?auto_260835 ?auto_260842 ) ) ( not ( = ?auto_260835 ?auto_260843 ) ) ( not ( = ?auto_260835 ?auto_260844 ) ) ( not ( = ?auto_260835 ?auto_260845 ) ) ( not ( = ?auto_260836 ?auto_260837 ) ) ( not ( = ?auto_260836 ?auto_260838 ) ) ( not ( = ?auto_260836 ?auto_260839 ) ) ( not ( = ?auto_260836 ?auto_260840 ) ) ( not ( = ?auto_260836 ?auto_260841 ) ) ( not ( = ?auto_260836 ?auto_260842 ) ) ( not ( = ?auto_260836 ?auto_260843 ) ) ( not ( = ?auto_260836 ?auto_260844 ) ) ( not ( = ?auto_260836 ?auto_260845 ) ) ( not ( = ?auto_260837 ?auto_260838 ) ) ( not ( = ?auto_260837 ?auto_260839 ) ) ( not ( = ?auto_260837 ?auto_260840 ) ) ( not ( = ?auto_260837 ?auto_260841 ) ) ( not ( = ?auto_260837 ?auto_260842 ) ) ( not ( = ?auto_260837 ?auto_260843 ) ) ( not ( = ?auto_260837 ?auto_260844 ) ) ( not ( = ?auto_260837 ?auto_260845 ) ) ( not ( = ?auto_260838 ?auto_260839 ) ) ( not ( = ?auto_260838 ?auto_260840 ) ) ( not ( = ?auto_260838 ?auto_260841 ) ) ( not ( = ?auto_260838 ?auto_260842 ) ) ( not ( = ?auto_260838 ?auto_260843 ) ) ( not ( = ?auto_260838 ?auto_260844 ) ) ( not ( = ?auto_260838 ?auto_260845 ) ) ( not ( = ?auto_260839 ?auto_260840 ) ) ( not ( = ?auto_260839 ?auto_260841 ) ) ( not ( = ?auto_260839 ?auto_260842 ) ) ( not ( = ?auto_260839 ?auto_260843 ) ) ( not ( = ?auto_260839 ?auto_260844 ) ) ( not ( = ?auto_260839 ?auto_260845 ) ) ( not ( = ?auto_260840 ?auto_260841 ) ) ( not ( = ?auto_260840 ?auto_260842 ) ) ( not ( = ?auto_260840 ?auto_260843 ) ) ( not ( = ?auto_260840 ?auto_260844 ) ) ( not ( = ?auto_260840 ?auto_260845 ) ) ( not ( = ?auto_260841 ?auto_260842 ) ) ( not ( = ?auto_260841 ?auto_260843 ) ) ( not ( = ?auto_260841 ?auto_260844 ) ) ( not ( = ?auto_260841 ?auto_260845 ) ) ( not ( = ?auto_260842 ?auto_260843 ) ) ( not ( = ?auto_260842 ?auto_260844 ) ) ( not ( = ?auto_260842 ?auto_260845 ) ) ( not ( = ?auto_260843 ?auto_260844 ) ) ( not ( = ?auto_260843 ?auto_260845 ) ) ( not ( = ?auto_260844 ?auto_260845 ) ) ( ON ?auto_260844 ?auto_260845 ) ( ON ?auto_260843 ?auto_260844 ) ( ON ?auto_260842 ?auto_260843 ) ( ON ?auto_260841 ?auto_260842 ) ( ON ?auto_260840 ?auto_260841 ) ( ON ?auto_260839 ?auto_260840 ) ( ON ?auto_260838 ?auto_260839 ) ( ON ?auto_260837 ?auto_260838 ) ( CLEAR ?auto_260835 ) ( ON ?auto_260836 ?auto_260837 ) ( CLEAR ?auto_260836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_260833 ?auto_260834 ?auto_260835 ?auto_260836 )
      ( MAKE-13PILE ?auto_260833 ?auto_260834 ?auto_260835 ?auto_260836 ?auto_260837 ?auto_260838 ?auto_260839 ?auto_260840 ?auto_260841 ?auto_260842 ?auto_260843 ?auto_260844 ?auto_260845 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260859 - BLOCK
      ?auto_260860 - BLOCK
      ?auto_260861 - BLOCK
      ?auto_260862 - BLOCK
      ?auto_260863 - BLOCK
      ?auto_260864 - BLOCK
      ?auto_260865 - BLOCK
      ?auto_260866 - BLOCK
      ?auto_260867 - BLOCK
      ?auto_260868 - BLOCK
      ?auto_260869 - BLOCK
      ?auto_260870 - BLOCK
      ?auto_260871 - BLOCK
    )
    :vars
    (
      ?auto_260872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260871 ?auto_260872 ) ( ON-TABLE ?auto_260859 ) ( ON ?auto_260860 ?auto_260859 ) ( not ( = ?auto_260859 ?auto_260860 ) ) ( not ( = ?auto_260859 ?auto_260861 ) ) ( not ( = ?auto_260859 ?auto_260862 ) ) ( not ( = ?auto_260859 ?auto_260863 ) ) ( not ( = ?auto_260859 ?auto_260864 ) ) ( not ( = ?auto_260859 ?auto_260865 ) ) ( not ( = ?auto_260859 ?auto_260866 ) ) ( not ( = ?auto_260859 ?auto_260867 ) ) ( not ( = ?auto_260859 ?auto_260868 ) ) ( not ( = ?auto_260859 ?auto_260869 ) ) ( not ( = ?auto_260859 ?auto_260870 ) ) ( not ( = ?auto_260859 ?auto_260871 ) ) ( not ( = ?auto_260859 ?auto_260872 ) ) ( not ( = ?auto_260860 ?auto_260861 ) ) ( not ( = ?auto_260860 ?auto_260862 ) ) ( not ( = ?auto_260860 ?auto_260863 ) ) ( not ( = ?auto_260860 ?auto_260864 ) ) ( not ( = ?auto_260860 ?auto_260865 ) ) ( not ( = ?auto_260860 ?auto_260866 ) ) ( not ( = ?auto_260860 ?auto_260867 ) ) ( not ( = ?auto_260860 ?auto_260868 ) ) ( not ( = ?auto_260860 ?auto_260869 ) ) ( not ( = ?auto_260860 ?auto_260870 ) ) ( not ( = ?auto_260860 ?auto_260871 ) ) ( not ( = ?auto_260860 ?auto_260872 ) ) ( not ( = ?auto_260861 ?auto_260862 ) ) ( not ( = ?auto_260861 ?auto_260863 ) ) ( not ( = ?auto_260861 ?auto_260864 ) ) ( not ( = ?auto_260861 ?auto_260865 ) ) ( not ( = ?auto_260861 ?auto_260866 ) ) ( not ( = ?auto_260861 ?auto_260867 ) ) ( not ( = ?auto_260861 ?auto_260868 ) ) ( not ( = ?auto_260861 ?auto_260869 ) ) ( not ( = ?auto_260861 ?auto_260870 ) ) ( not ( = ?auto_260861 ?auto_260871 ) ) ( not ( = ?auto_260861 ?auto_260872 ) ) ( not ( = ?auto_260862 ?auto_260863 ) ) ( not ( = ?auto_260862 ?auto_260864 ) ) ( not ( = ?auto_260862 ?auto_260865 ) ) ( not ( = ?auto_260862 ?auto_260866 ) ) ( not ( = ?auto_260862 ?auto_260867 ) ) ( not ( = ?auto_260862 ?auto_260868 ) ) ( not ( = ?auto_260862 ?auto_260869 ) ) ( not ( = ?auto_260862 ?auto_260870 ) ) ( not ( = ?auto_260862 ?auto_260871 ) ) ( not ( = ?auto_260862 ?auto_260872 ) ) ( not ( = ?auto_260863 ?auto_260864 ) ) ( not ( = ?auto_260863 ?auto_260865 ) ) ( not ( = ?auto_260863 ?auto_260866 ) ) ( not ( = ?auto_260863 ?auto_260867 ) ) ( not ( = ?auto_260863 ?auto_260868 ) ) ( not ( = ?auto_260863 ?auto_260869 ) ) ( not ( = ?auto_260863 ?auto_260870 ) ) ( not ( = ?auto_260863 ?auto_260871 ) ) ( not ( = ?auto_260863 ?auto_260872 ) ) ( not ( = ?auto_260864 ?auto_260865 ) ) ( not ( = ?auto_260864 ?auto_260866 ) ) ( not ( = ?auto_260864 ?auto_260867 ) ) ( not ( = ?auto_260864 ?auto_260868 ) ) ( not ( = ?auto_260864 ?auto_260869 ) ) ( not ( = ?auto_260864 ?auto_260870 ) ) ( not ( = ?auto_260864 ?auto_260871 ) ) ( not ( = ?auto_260864 ?auto_260872 ) ) ( not ( = ?auto_260865 ?auto_260866 ) ) ( not ( = ?auto_260865 ?auto_260867 ) ) ( not ( = ?auto_260865 ?auto_260868 ) ) ( not ( = ?auto_260865 ?auto_260869 ) ) ( not ( = ?auto_260865 ?auto_260870 ) ) ( not ( = ?auto_260865 ?auto_260871 ) ) ( not ( = ?auto_260865 ?auto_260872 ) ) ( not ( = ?auto_260866 ?auto_260867 ) ) ( not ( = ?auto_260866 ?auto_260868 ) ) ( not ( = ?auto_260866 ?auto_260869 ) ) ( not ( = ?auto_260866 ?auto_260870 ) ) ( not ( = ?auto_260866 ?auto_260871 ) ) ( not ( = ?auto_260866 ?auto_260872 ) ) ( not ( = ?auto_260867 ?auto_260868 ) ) ( not ( = ?auto_260867 ?auto_260869 ) ) ( not ( = ?auto_260867 ?auto_260870 ) ) ( not ( = ?auto_260867 ?auto_260871 ) ) ( not ( = ?auto_260867 ?auto_260872 ) ) ( not ( = ?auto_260868 ?auto_260869 ) ) ( not ( = ?auto_260868 ?auto_260870 ) ) ( not ( = ?auto_260868 ?auto_260871 ) ) ( not ( = ?auto_260868 ?auto_260872 ) ) ( not ( = ?auto_260869 ?auto_260870 ) ) ( not ( = ?auto_260869 ?auto_260871 ) ) ( not ( = ?auto_260869 ?auto_260872 ) ) ( not ( = ?auto_260870 ?auto_260871 ) ) ( not ( = ?auto_260870 ?auto_260872 ) ) ( not ( = ?auto_260871 ?auto_260872 ) ) ( ON ?auto_260870 ?auto_260871 ) ( ON ?auto_260869 ?auto_260870 ) ( ON ?auto_260868 ?auto_260869 ) ( ON ?auto_260867 ?auto_260868 ) ( ON ?auto_260866 ?auto_260867 ) ( ON ?auto_260865 ?auto_260866 ) ( ON ?auto_260864 ?auto_260865 ) ( ON ?auto_260863 ?auto_260864 ) ( ON ?auto_260862 ?auto_260863 ) ( CLEAR ?auto_260860 ) ( ON ?auto_260861 ?auto_260862 ) ( CLEAR ?auto_260861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_260859 ?auto_260860 ?auto_260861 )
      ( MAKE-13PILE ?auto_260859 ?auto_260860 ?auto_260861 ?auto_260862 ?auto_260863 ?auto_260864 ?auto_260865 ?auto_260866 ?auto_260867 ?auto_260868 ?auto_260869 ?auto_260870 ?auto_260871 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260886 - BLOCK
      ?auto_260887 - BLOCK
      ?auto_260888 - BLOCK
      ?auto_260889 - BLOCK
      ?auto_260890 - BLOCK
      ?auto_260891 - BLOCK
      ?auto_260892 - BLOCK
      ?auto_260893 - BLOCK
      ?auto_260894 - BLOCK
      ?auto_260895 - BLOCK
      ?auto_260896 - BLOCK
      ?auto_260897 - BLOCK
      ?auto_260898 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_260898 ) ( ON-TABLE ?auto_260886 ) ( ON ?auto_260887 ?auto_260886 ) ( not ( = ?auto_260886 ?auto_260887 ) ) ( not ( = ?auto_260886 ?auto_260888 ) ) ( not ( = ?auto_260886 ?auto_260889 ) ) ( not ( = ?auto_260886 ?auto_260890 ) ) ( not ( = ?auto_260886 ?auto_260891 ) ) ( not ( = ?auto_260886 ?auto_260892 ) ) ( not ( = ?auto_260886 ?auto_260893 ) ) ( not ( = ?auto_260886 ?auto_260894 ) ) ( not ( = ?auto_260886 ?auto_260895 ) ) ( not ( = ?auto_260886 ?auto_260896 ) ) ( not ( = ?auto_260886 ?auto_260897 ) ) ( not ( = ?auto_260886 ?auto_260898 ) ) ( not ( = ?auto_260887 ?auto_260888 ) ) ( not ( = ?auto_260887 ?auto_260889 ) ) ( not ( = ?auto_260887 ?auto_260890 ) ) ( not ( = ?auto_260887 ?auto_260891 ) ) ( not ( = ?auto_260887 ?auto_260892 ) ) ( not ( = ?auto_260887 ?auto_260893 ) ) ( not ( = ?auto_260887 ?auto_260894 ) ) ( not ( = ?auto_260887 ?auto_260895 ) ) ( not ( = ?auto_260887 ?auto_260896 ) ) ( not ( = ?auto_260887 ?auto_260897 ) ) ( not ( = ?auto_260887 ?auto_260898 ) ) ( not ( = ?auto_260888 ?auto_260889 ) ) ( not ( = ?auto_260888 ?auto_260890 ) ) ( not ( = ?auto_260888 ?auto_260891 ) ) ( not ( = ?auto_260888 ?auto_260892 ) ) ( not ( = ?auto_260888 ?auto_260893 ) ) ( not ( = ?auto_260888 ?auto_260894 ) ) ( not ( = ?auto_260888 ?auto_260895 ) ) ( not ( = ?auto_260888 ?auto_260896 ) ) ( not ( = ?auto_260888 ?auto_260897 ) ) ( not ( = ?auto_260888 ?auto_260898 ) ) ( not ( = ?auto_260889 ?auto_260890 ) ) ( not ( = ?auto_260889 ?auto_260891 ) ) ( not ( = ?auto_260889 ?auto_260892 ) ) ( not ( = ?auto_260889 ?auto_260893 ) ) ( not ( = ?auto_260889 ?auto_260894 ) ) ( not ( = ?auto_260889 ?auto_260895 ) ) ( not ( = ?auto_260889 ?auto_260896 ) ) ( not ( = ?auto_260889 ?auto_260897 ) ) ( not ( = ?auto_260889 ?auto_260898 ) ) ( not ( = ?auto_260890 ?auto_260891 ) ) ( not ( = ?auto_260890 ?auto_260892 ) ) ( not ( = ?auto_260890 ?auto_260893 ) ) ( not ( = ?auto_260890 ?auto_260894 ) ) ( not ( = ?auto_260890 ?auto_260895 ) ) ( not ( = ?auto_260890 ?auto_260896 ) ) ( not ( = ?auto_260890 ?auto_260897 ) ) ( not ( = ?auto_260890 ?auto_260898 ) ) ( not ( = ?auto_260891 ?auto_260892 ) ) ( not ( = ?auto_260891 ?auto_260893 ) ) ( not ( = ?auto_260891 ?auto_260894 ) ) ( not ( = ?auto_260891 ?auto_260895 ) ) ( not ( = ?auto_260891 ?auto_260896 ) ) ( not ( = ?auto_260891 ?auto_260897 ) ) ( not ( = ?auto_260891 ?auto_260898 ) ) ( not ( = ?auto_260892 ?auto_260893 ) ) ( not ( = ?auto_260892 ?auto_260894 ) ) ( not ( = ?auto_260892 ?auto_260895 ) ) ( not ( = ?auto_260892 ?auto_260896 ) ) ( not ( = ?auto_260892 ?auto_260897 ) ) ( not ( = ?auto_260892 ?auto_260898 ) ) ( not ( = ?auto_260893 ?auto_260894 ) ) ( not ( = ?auto_260893 ?auto_260895 ) ) ( not ( = ?auto_260893 ?auto_260896 ) ) ( not ( = ?auto_260893 ?auto_260897 ) ) ( not ( = ?auto_260893 ?auto_260898 ) ) ( not ( = ?auto_260894 ?auto_260895 ) ) ( not ( = ?auto_260894 ?auto_260896 ) ) ( not ( = ?auto_260894 ?auto_260897 ) ) ( not ( = ?auto_260894 ?auto_260898 ) ) ( not ( = ?auto_260895 ?auto_260896 ) ) ( not ( = ?auto_260895 ?auto_260897 ) ) ( not ( = ?auto_260895 ?auto_260898 ) ) ( not ( = ?auto_260896 ?auto_260897 ) ) ( not ( = ?auto_260896 ?auto_260898 ) ) ( not ( = ?auto_260897 ?auto_260898 ) ) ( ON ?auto_260897 ?auto_260898 ) ( ON ?auto_260896 ?auto_260897 ) ( ON ?auto_260895 ?auto_260896 ) ( ON ?auto_260894 ?auto_260895 ) ( ON ?auto_260893 ?auto_260894 ) ( ON ?auto_260892 ?auto_260893 ) ( ON ?auto_260891 ?auto_260892 ) ( ON ?auto_260890 ?auto_260891 ) ( ON ?auto_260889 ?auto_260890 ) ( CLEAR ?auto_260887 ) ( ON ?auto_260888 ?auto_260889 ) ( CLEAR ?auto_260888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_260886 ?auto_260887 ?auto_260888 )
      ( MAKE-13PILE ?auto_260886 ?auto_260887 ?auto_260888 ?auto_260889 ?auto_260890 ?auto_260891 ?auto_260892 ?auto_260893 ?auto_260894 ?auto_260895 ?auto_260896 ?auto_260897 ?auto_260898 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260912 - BLOCK
      ?auto_260913 - BLOCK
      ?auto_260914 - BLOCK
      ?auto_260915 - BLOCK
      ?auto_260916 - BLOCK
      ?auto_260917 - BLOCK
      ?auto_260918 - BLOCK
      ?auto_260919 - BLOCK
      ?auto_260920 - BLOCK
      ?auto_260921 - BLOCK
      ?auto_260922 - BLOCK
      ?auto_260923 - BLOCK
      ?auto_260924 - BLOCK
    )
    :vars
    (
      ?auto_260925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260924 ?auto_260925 ) ( ON-TABLE ?auto_260912 ) ( not ( = ?auto_260912 ?auto_260913 ) ) ( not ( = ?auto_260912 ?auto_260914 ) ) ( not ( = ?auto_260912 ?auto_260915 ) ) ( not ( = ?auto_260912 ?auto_260916 ) ) ( not ( = ?auto_260912 ?auto_260917 ) ) ( not ( = ?auto_260912 ?auto_260918 ) ) ( not ( = ?auto_260912 ?auto_260919 ) ) ( not ( = ?auto_260912 ?auto_260920 ) ) ( not ( = ?auto_260912 ?auto_260921 ) ) ( not ( = ?auto_260912 ?auto_260922 ) ) ( not ( = ?auto_260912 ?auto_260923 ) ) ( not ( = ?auto_260912 ?auto_260924 ) ) ( not ( = ?auto_260912 ?auto_260925 ) ) ( not ( = ?auto_260913 ?auto_260914 ) ) ( not ( = ?auto_260913 ?auto_260915 ) ) ( not ( = ?auto_260913 ?auto_260916 ) ) ( not ( = ?auto_260913 ?auto_260917 ) ) ( not ( = ?auto_260913 ?auto_260918 ) ) ( not ( = ?auto_260913 ?auto_260919 ) ) ( not ( = ?auto_260913 ?auto_260920 ) ) ( not ( = ?auto_260913 ?auto_260921 ) ) ( not ( = ?auto_260913 ?auto_260922 ) ) ( not ( = ?auto_260913 ?auto_260923 ) ) ( not ( = ?auto_260913 ?auto_260924 ) ) ( not ( = ?auto_260913 ?auto_260925 ) ) ( not ( = ?auto_260914 ?auto_260915 ) ) ( not ( = ?auto_260914 ?auto_260916 ) ) ( not ( = ?auto_260914 ?auto_260917 ) ) ( not ( = ?auto_260914 ?auto_260918 ) ) ( not ( = ?auto_260914 ?auto_260919 ) ) ( not ( = ?auto_260914 ?auto_260920 ) ) ( not ( = ?auto_260914 ?auto_260921 ) ) ( not ( = ?auto_260914 ?auto_260922 ) ) ( not ( = ?auto_260914 ?auto_260923 ) ) ( not ( = ?auto_260914 ?auto_260924 ) ) ( not ( = ?auto_260914 ?auto_260925 ) ) ( not ( = ?auto_260915 ?auto_260916 ) ) ( not ( = ?auto_260915 ?auto_260917 ) ) ( not ( = ?auto_260915 ?auto_260918 ) ) ( not ( = ?auto_260915 ?auto_260919 ) ) ( not ( = ?auto_260915 ?auto_260920 ) ) ( not ( = ?auto_260915 ?auto_260921 ) ) ( not ( = ?auto_260915 ?auto_260922 ) ) ( not ( = ?auto_260915 ?auto_260923 ) ) ( not ( = ?auto_260915 ?auto_260924 ) ) ( not ( = ?auto_260915 ?auto_260925 ) ) ( not ( = ?auto_260916 ?auto_260917 ) ) ( not ( = ?auto_260916 ?auto_260918 ) ) ( not ( = ?auto_260916 ?auto_260919 ) ) ( not ( = ?auto_260916 ?auto_260920 ) ) ( not ( = ?auto_260916 ?auto_260921 ) ) ( not ( = ?auto_260916 ?auto_260922 ) ) ( not ( = ?auto_260916 ?auto_260923 ) ) ( not ( = ?auto_260916 ?auto_260924 ) ) ( not ( = ?auto_260916 ?auto_260925 ) ) ( not ( = ?auto_260917 ?auto_260918 ) ) ( not ( = ?auto_260917 ?auto_260919 ) ) ( not ( = ?auto_260917 ?auto_260920 ) ) ( not ( = ?auto_260917 ?auto_260921 ) ) ( not ( = ?auto_260917 ?auto_260922 ) ) ( not ( = ?auto_260917 ?auto_260923 ) ) ( not ( = ?auto_260917 ?auto_260924 ) ) ( not ( = ?auto_260917 ?auto_260925 ) ) ( not ( = ?auto_260918 ?auto_260919 ) ) ( not ( = ?auto_260918 ?auto_260920 ) ) ( not ( = ?auto_260918 ?auto_260921 ) ) ( not ( = ?auto_260918 ?auto_260922 ) ) ( not ( = ?auto_260918 ?auto_260923 ) ) ( not ( = ?auto_260918 ?auto_260924 ) ) ( not ( = ?auto_260918 ?auto_260925 ) ) ( not ( = ?auto_260919 ?auto_260920 ) ) ( not ( = ?auto_260919 ?auto_260921 ) ) ( not ( = ?auto_260919 ?auto_260922 ) ) ( not ( = ?auto_260919 ?auto_260923 ) ) ( not ( = ?auto_260919 ?auto_260924 ) ) ( not ( = ?auto_260919 ?auto_260925 ) ) ( not ( = ?auto_260920 ?auto_260921 ) ) ( not ( = ?auto_260920 ?auto_260922 ) ) ( not ( = ?auto_260920 ?auto_260923 ) ) ( not ( = ?auto_260920 ?auto_260924 ) ) ( not ( = ?auto_260920 ?auto_260925 ) ) ( not ( = ?auto_260921 ?auto_260922 ) ) ( not ( = ?auto_260921 ?auto_260923 ) ) ( not ( = ?auto_260921 ?auto_260924 ) ) ( not ( = ?auto_260921 ?auto_260925 ) ) ( not ( = ?auto_260922 ?auto_260923 ) ) ( not ( = ?auto_260922 ?auto_260924 ) ) ( not ( = ?auto_260922 ?auto_260925 ) ) ( not ( = ?auto_260923 ?auto_260924 ) ) ( not ( = ?auto_260923 ?auto_260925 ) ) ( not ( = ?auto_260924 ?auto_260925 ) ) ( ON ?auto_260923 ?auto_260924 ) ( ON ?auto_260922 ?auto_260923 ) ( ON ?auto_260921 ?auto_260922 ) ( ON ?auto_260920 ?auto_260921 ) ( ON ?auto_260919 ?auto_260920 ) ( ON ?auto_260918 ?auto_260919 ) ( ON ?auto_260917 ?auto_260918 ) ( ON ?auto_260916 ?auto_260917 ) ( ON ?auto_260915 ?auto_260916 ) ( ON ?auto_260914 ?auto_260915 ) ( CLEAR ?auto_260912 ) ( ON ?auto_260913 ?auto_260914 ) ( CLEAR ?auto_260913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_260912 ?auto_260913 )
      ( MAKE-13PILE ?auto_260912 ?auto_260913 ?auto_260914 ?auto_260915 ?auto_260916 ?auto_260917 ?auto_260918 ?auto_260919 ?auto_260920 ?auto_260921 ?auto_260922 ?auto_260923 ?auto_260924 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260939 - BLOCK
      ?auto_260940 - BLOCK
      ?auto_260941 - BLOCK
      ?auto_260942 - BLOCK
      ?auto_260943 - BLOCK
      ?auto_260944 - BLOCK
      ?auto_260945 - BLOCK
      ?auto_260946 - BLOCK
      ?auto_260947 - BLOCK
      ?auto_260948 - BLOCK
      ?auto_260949 - BLOCK
      ?auto_260950 - BLOCK
      ?auto_260951 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_260951 ) ( ON-TABLE ?auto_260939 ) ( not ( = ?auto_260939 ?auto_260940 ) ) ( not ( = ?auto_260939 ?auto_260941 ) ) ( not ( = ?auto_260939 ?auto_260942 ) ) ( not ( = ?auto_260939 ?auto_260943 ) ) ( not ( = ?auto_260939 ?auto_260944 ) ) ( not ( = ?auto_260939 ?auto_260945 ) ) ( not ( = ?auto_260939 ?auto_260946 ) ) ( not ( = ?auto_260939 ?auto_260947 ) ) ( not ( = ?auto_260939 ?auto_260948 ) ) ( not ( = ?auto_260939 ?auto_260949 ) ) ( not ( = ?auto_260939 ?auto_260950 ) ) ( not ( = ?auto_260939 ?auto_260951 ) ) ( not ( = ?auto_260940 ?auto_260941 ) ) ( not ( = ?auto_260940 ?auto_260942 ) ) ( not ( = ?auto_260940 ?auto_260943 ) ) ( not ( = ?auto_260940 ?auto_260944 ) ) ( not ( = ?auto_260940 ?auto_260945 ) ) ( not ( = ?auto_260940 ?auto_260946 ) ) ( not ( = ?auto_260940 ?auto_260947 ) ) ( not ( = ?auto_260940 ?auto_260948 ) ) ( not ( = ?auto_260940 ?auto_260949 ) ) ( not ( = ?auto_260940 ?auto_260950 ) ) ( not ( = ?auto_260940 ?auto_260951 ) ) ( not ( = ?auto_260941 ?auto_260942 ) ) ( not ( = ?auto_260941 ?auto_260943 ) ) ( not ( = ?auto_260941 ?auto_260944 ) ) ( not ( = ?auto_260941 ?auto_260945 ) ) ( not ( = ?auto_260941 ?auto_260946 ) ) ( not ( = ?auto_260941 ?auto_260947 ) ) ( not ( = ?auto_260941 ?auto_260948 ) ) ( not ( = ?auto_260941 ?auto_260949 ) ) ( not ( = ?auto_260941 ?auto_260950 ) ) ( not ( = ?auto_260941 ?auto_260951 ) ) ( not ( = ?auto_260942 ?auto_260943 ) ) ( not ( = ?auto_260942 ?auto_260944 ) ) ( not ( = ?auto_260942 ?auto_260945 ) ) ( not ( = ?auto_260942 ?auto_260946 ) ) ( not ( = ?auto_260942 ?auto_260947 ) ) ( not ( = ?auto_260942 ?auto_260948 ) ) ( not ( = ?auto_260942 ?auto_260949 ) ) ( not ( = ?auto_260942 ?auto_260950 ) ) ( not ( = ?auto_260942 ?auto_260951 ) ) ( not ( = ?auto_260943 ?auto_260944 ) ) ( not ( = ?auto_260943 ?auto_260945 ) ) ( not ( = ?auto_260943 ?auto_260946 ) ) ( not ( = ?auto_260943 ?auto_260947 ) ) ( not ( = ?auto_260943 ?auto_260948 ) ) ( not ( = ?auto_260943 ?auto_260949 ) ) ( not ( = ?auto_260943 ?auto_260950 ) ) ( not ( = ?auto_260943 ?auto_260951 ) ) ( not ( = ?auto_260944 ?auto_260945 ) ) ( not ( = ?auto_260944 ?auto_260946 ) ) ( not ( = ?auto_260944 ?auto_260947 ) ) ( not ( = ?auto_260944 ?auto_260948 ) ) ( not ( = ?auto_260944 ?auto_260949 ) ) ( not ( = ?auto_260944 ?auto_260950 ) ) ( not ( = ?auto_260944 ?auto_260951 ) ) ( not ( = ?auto_260945 ?auto_260946 ) ) ( not ( = ?auto_260945 ?auto_260947 ) ) ( not ( = ?auto_260945 ?auto_260948 ) ) ( not ( = ?auto_260945 ?auto_260949 ) ) ( not ( = ?auto_260945 ?auto_260950 ) ) ( not ( = ?auto_260945 ?auto_260951 ) ) ( not ( = ?auto_260946 ?auto_260947 ) ) ( not ( = ?auto_260946 ?auto_260948 ) ) ( not ( = ?auto_260946 ?auto_260949 ) ) ( not ( = ?auto_260946 ?auto_260950 ) ) ( not ( = ?auto_260946 ?auto_260951 ) ) ( not ( = ?auto_260947 ?auto_260948 ) ) ( not ( = ?auto_260947 ?auto_260949 ) ) ( not ( = ?auto_260947 ?auto_260950 ) ) ( not ( = ?auto_260947 ?auto_260951 ) ) ( not ( = ?auto_260948 ?auto_260949 ) ) ( not ( = ?auto_260948 ?auto_260950 ) ) ( not ( = ?auto_260948 ?auto_260951 ) ) ( not ( = ?auto_260949 ?auto_260950 ) ) ( not ( = ?auto_260949 ?auto_260951 ) ) ( not ( = ?auto_260950 ?auto_260951 ) ) ( ON ?auto_260950 ?auto_260951 ) ( ON ?auto_260949 ?auto_260950 ) ( ON ?auto_260948 ?auto_260949 ) ( ON ?auto_260947 ?auto_260948 ) ( ON ?auto_260946 ?auto_260947 ) ( ON ?auto_260945 ?auto_260946 ) ( ON ?auto_260944 ?auto_260945 ) ( ON ?auto_260943 ?auto_260944 ) ( ON ?auto_260942 ?auto_260943 ) ( ON ?auto_260941 ?auto_260942 ) ( CLEAR ?auto_260939 ) ( ON ?auto_260940 ?auto_260941 ) ( CLEAR ?auto_260940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_260939 ?auto_260940 )
      ( MAKE-13PILE ?auto_260939 ?auto_260940 ?auto_260941 ?auto_260942 ?auto_260943 ?auto_260944 ?auto_260945 ?auto_260946 ?auto_260947 ?auto_260948 ?auto_260949 ?auto_260950 ?auto_260951 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260965 - BLOCK
      ?auto_260966 - BLOCK
      ?auto_260967 - BLOCK
      ?auto_260968 - BLOCK
      ?auto_260969 - BLOCK
      ?auto_260970 - BLOCK
      ?auto_260971 - BLOCK
      ?auto_260972 - BLOCK
      ?auto_260973 - BLOCK
      ?auto_260974 - BLOCK
      ?auto_260975 - BLOCK
      ?auto_260976 - BLOCK
      ?auto_260977 - BLOCK
    )
    :vars
    (
      ?auto_260978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260977 ?auto_260978 ) ( not ( = ?auto_260965 ?auto_260966 ) ) ( not ( = ?auto_260965 ?auto_260967 ) ) ( not ( = ?auto_260965 ?auto_260968 ) ) ( not ( = ?auto_260965 ?auto_260969 ) ) ( not ( = ?auto_260965 ?auto_260970 ) ) ( not ( = ?auto_260965 ?auto_260971 ) ) ( not ( = ?auto_260965 ?auto_260972 ) ) ( not ( = ?auto_260965 ?auto_260973 ) ) ( not ( = ?auto_260965 ?auto_260974 ) ) ( not ( = ?auto_260965 ?auto_260975 ) ) ( not ( = ?auto_260965 ?auto_260976 ) ) ( not ( = ?auto_260965 ?auto_260977 ) ) ( not ( = ?auto_260965 ?auto_260978 ) ) ( not ( = ?auto_260966 ?auto_260967 ) ) ( not ( = ?auto_260966 ?auto_260968 ) ) ( not ( = ?auto_260966 ?auto_260969 ) ) ( not ( = ?auto_260966 ?auto_260970 ) ) ( not ( = ?auto_260966 ?auto_260971 ) ) ( not ( = ?auto_260966 ?auto_260972 ) ) ( not ( = ?auto_260966 ?auto_260973 ) ) ( not ( = ?auto_260966 ?auto_260974 ) ) ( not ( = ?auto_260966 ?auto_260975 ) ) ( not ( = ?auto_260966 ?auto_260976 ) ) ( not ( = ?auto_260966 ?auto_260977 ) ) ( not ( = ?auto_260966 ?auto_260978 ) ) ( not ( = ?auto_260967 ?auto_260968 ) ) ( not ( = ?auto_260967 ?auto_260969 ) ) ( not ( = ?auto_260967 ?auto_260970 ) ) ( not ( = ?auto_260967 ?auto_260971 ) ) ( not ( = ?auto_260967 ?auto_260972 ) ) ( not ( = ?auto_260967 ?auto_260973 ) ) ( not ( = ?auto_260967 ?auto_260974 ) ) ( not ( = ?auto_260967 ?auto_260975 ) ) ( not ( = ?auto_260967 ?auto_260976 ) ) ( not ( = ?auto_260967 ?auto_260977 ) ) ( not ( = ?auto_260967 ?auto_260978 ) ) ( not ( = ?auto_260968 ?auto_260969 ) ) ( not ( = ?auto_260968 ?auto_260970 ) ) ( not ( = ?auto_260968 ?auto_260971 ) ) ( not ( = ?auto_260968 ?auto_260972 ) ) ( not ( = ?auto_260968 ?auto_260973 ) ) ( not ( = ?auto_260968 ?auto_260974 ) ) ( not ( = ?auto_260968 ?auto_260975 ) ) ( not ( = ?auto_260968 ?auto_260976 ) ) ( not ( = ?auto_260968 ?auto_260977 ) ) ( not ( = ?auto_260968 ?auto_260978 ) ) ( not ( = ?auto_260969 ?auto_260970 ) ) ( not ( = ?auto_260969 ?auto_260971 ) ) ( not ( = ?auto_260969 ?auto_260972 ) ) ( not ( = ?auto_260969 ?auto_260973 ) ) ( not ( = ?auto_260969 ?auto_260974 ) ) ( not ( = ?auto_260969 ?auto_260975 ) ) ( not ( = ?auto_260969 ?auto_260976 ) ) ( not ( = ?auto_260969 ?auto_260977 ) ) ( not ( = ?auto_260969 ?auto_260978 ) ) ( not ( = ?auto_260970 ?auto_260971 ) ) ( not ( = ?auto_260970 ?auto_260972 ) ) ( not ( = ?auto_260970 ?auto_260973 ) ) ( not ( = ?auto_260970 ?auto_260974 ) ) ( not ( = ?auto_260970 ?auto_260975 ) ) ( not ( = ?auto_260970 ?auto_260976 ) ) ( not ( = ?auto_260970 ?auto_260977 ) ) ( not ( = ?auto_260970 ?auto_260978 ) ) ( not ( = ?auto_260971 ?auto_260972 ) ) ( not ( = ?auto_260971 ?auto_260973 ) ) ( not ( = ?auto_260971 ?auto_260974 ) ) ( not ( = ?auto_260971 ?auto_260975 ) ) ( not ( = ?auto_260971 ?auto_260976 ) ) ( not ( = ?auto_260971 ?auto_260977 ) ) ( not ( = ?auto_260971 ?auto_260978 ) ) ( not ( = ?auto_260972 ?auto_260973 ) ) ( not ( = ?auto_260972 ?auto_260974 ) ) ( not ( = ?auto_260972 ?auto_260975 ) ) ( not ( = ?auto_260972 ?auto_260976 ) ) ( not ( = ?auto_260972 ?auto_260977 ) ) ( not ( = ?auto_260972 ?auto_260978 ) ) ( not ( = ?auto_260973 ?auto_260974 ) ) ( not ( = ?auto_260973 ?auto_260975 ) ) ( not ( = ?auto_260973 ?auto_260976 ) ) ( not ( = ?auto_260973 ?auto_260977 ) ) ( not ( = ?auto_260973 ?auto_260978 ) ) ( not ( = ?auto_260974 ?auto_260975 ) ) ( not ( = ?auto_260974 ?auto_260976 ) ) ( not ( = ?auto_260974 ?auto_260977 ) ) ( not ( = ?auto_260974 ?auto_260978 ) ) ( not ( = ?auto_260975 ?auto_260976 ) ) ( not ( = ?auto_260975 ?auto_260977 ) ) ( not ( = ?auto_260975 ?auto_260978 ) ) ( not ( = ?auto_260976 ?auto_260977 ) ) ( not ( = ?auto_260976 ?auto_260978 ) ) ( not ( = ?auto_260977 ?auto_260978 ) ) ( ON ?auto_260976 ?auto_260977 ) ( ON ?auto_260975 ?auto_260976 ) ( ON ?auto_260974 ?auto_260975 ) ( ON ?auto_260973 ?auto_260974 ) ( ON ?auto_260972 ?auto_260973 ) ( ON ?auto_260971 ?auto_260972 ) ( ON ?auto_260970 ?auto_260971 ) ( ON ?auto_260969 ?auto_260970 ) ( ON ?auto_260968 ?auto_260969 ) ( ON ?auto_260967 ?auto_260968 ) ( ON ?auto_260966 ?auto_260967 ) ( ON ?auto_260965 ?auto_260966 ) ( CLEAR ?auto_260965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_260965 )
      ( MAKE-13PILE ?auto_260965 ?auto_260966 ?auto_260967 ?auto_260968 ?auto_260969 ?auto_260970 ?auto_260971 ?auto_260972 ?auto_260973 ?auto_260974 ?auto_260975 ?auto_260976 ?auto_260977 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260992 - BLOCK
      ?auto_260993 - BLOCK
      ?auto_260994 - BLOCK
      ?auto_260995 - BLOCK
      ?auto_260996 - BLOCK
      ?auto_260997 - BLOCK
      ?auto_260998 - BLOCK
      ?auto_260999 - BLOCK
      ?auto_261000 - BLOCK
      ?auto_261001 - BLOCK
      ?auto_261002 - BLOCK
      ?auto_261003 - BLOCK
      ?auto_261004 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_261004 ) ( not ( = ?auto_260992 ?auto_260993 ) ) ( not ( = ?auto_260992 ?auto_260994 ) ) ( not ( = ?auto_260992 ?auto_260995 ) ) ( not ( = ?auto_260992 ?auto_260996 ) ) ( not ( = ?auto_260992 ?auto_260997 ) ) ( not ( = ?auto_260992 ?auto_260998 ) ) ( not ( = ?auto_260992 ?auto_260999 ) ) ( not ( = ?auto_260992 ?auto_261000 ) ) ( not ( = ?auto_260992 ?auto_261001 ) ) ( not ( = ?auto_260992 ?auto_261002 ) ) ( not ( = ?auto_260992 ?auto_261003 ) ) ( not ( = ?auto_260992 ?auto_261004 ) ) ( not ( = ?auto_260993 ?auto_260994 ) ) ( not ( = ?auto_260993 ?auto_260995 ) ) ( not ( = ?auto_260993 ?auto_260996 ) ) ( not ( = ?auto_260993 ?auto_260997 ) ) ( not ( = ?auto_260993 ?auto_260998 ) ) ( not ( = ?auto_260993 ?auto_260999 ) ) ( not ( = ?auto_260993 ?auto_261000 ) ) ( not ( = ?auto_260993 ?auto_261001 ) ) ( not ( = ?auto_260993 ?auto_261002 ) ) ( not ( = ?auto_260993 ?auto_261003 ) ) ( not ( = ?auto_260993 ?auto_261004 ) ) ( not ( = ?auto_260994 ?auto_260995 ) ) ( not ( = ?auto_260994 ?auto_260996 ) ) ( not ( = ?auto_260994 ?auto_260997 ) ) ( not ( = ?auto_260994 ?auto_260998 ) ) ( not ( = ?auto_260994 ?auto_260999 ) ) ( not ( = ?auto_260994 ?auto_261000 ) ) ( not ( = ?auto_260994 ?auto_261001 ) ) ( not ( = ?auto_260994 ?auto_261002 ) ) ( not ( = ?auto_260994 ?auto_261003 ) ) ( not ( = ?auto_260994 ?auto_261004 ) ) ( not ( = ?auto_260995 ?auto_260996 ) ) ( not ( = ?auto_260995 ?auto_260997 ) ) ( not ( = ?auto_260995 ?auto_260998 ) ) ( not ( = ?auto_260995 ?auto_260999 ) ) ( not ( = ?auto_260995 ?auto_261000 ) ) ( not ( = ?auto_260995 ?auto_261001 ) ) ( not ( = ?auto_260995 ?auto_261002 ) ) ( not ( = ?auto_260995 ?auto_261003 ) ) ( not ( = ?auto_260995 ?auto_261004 ) ) ( not ( = ?auto_260996 ?auto_260997 ) ) ( not ( = ?auto_260996 ?auto_260998 ) ) ( not ( = ?auto_260996 ?auto_260999 ) ) ( not ( = ?auto_260996 ?auto_261000 ) ) ( not ( = ?auto_260996 ?auto_261001 ) ) ( not ( = ?auto_260996 ?auto_261002 ) ) ( not ( = ?auto_260996 ?auto_261003 ) ) ( not ( = ?auto_260996 ?auto_261004 ) ) ( not ( = ?auto_260997 ?auto_260998 ) ) ( not ( = ?auto_260997 ?auto_260999 ) ) ( not ( = ?auto_260997 ?auto_261000 ) ) ( not ( = ?auto_260997 ?auto_261001 ) ) ( not ( = ?auto_260997 ?auto_261002 ) ) ( not ( = ?auto_260997 ?auto_261003 ) ) ( not ( = ?auto_260997 ?auto_261004 ) ) ( not ( = ?auto_260998 ?auto_260999 ) ) ( not ( = ?auto_260998 ?auto_261000 ) ) ( not ( = ?auto_260998 ?auto_261001 ) ) ( not ( = ?auto_260998 ?auto_261002 ) ) ( not ( = ?auto_260998 ?auto_261003 ) ) ( not ( = ?auto_260998 ?auto_261004 ) ) ( not ( = ?auto_260999 ?auto_261000 ) ) ( not ( = ?auto_260999 ?auto_261001 ) ) ( not ( = ?auto_260999 ?auto_261002 ) ) ( not ( = ?auto_260999 ?auto_261003 ) ) ( not ( = ?auto_260999 ?auto_261004 ) ) ( not ( = ?auto_261000 ?auto_261001 ) ) ( not ( = ?auto_261000 ?auto_261002 ) ) ( not ( = ?auto_261000 ?auto_261003 ) ) ( not ( = ?auto_261000 ?auto_261004 ) ) ( not ( = ?auto_261001 ?auto_261002 ) ) ( not ( = ?auto_261001 ?auto_261003 ) ) ( not ( = ?auto_261001 ?auto_261004 ) ) ( not ( = ?auto_261002 ?auto_261003 ) ) ( not ( = ?auto_261002 ?auto_261004 ) ) ( not ( = ?auto_261003 ?auto_261004 ) ) ( ON ?auto_261003 ?auto_261004 ) ( ON ?auto_261002 ?auto_261003 ) ( ON ?auto_261001 ?auto_261002 ) ( ON ?auto_261000 ?auto_261001 ) ( ON ?auto_260999 ?auto_261000 ) ( ON ?auto_260998 ?auto_260999 ) ( ON ?auto_260997 ?auto_260998 ) ( ON ?auto_260996 ?auto_260997 ) ( ON ?auto_260995 ?auto_260996 ) ( ON ?auto_260994 ?auto_260995 ) ( ON ?auto_260993 ?auto_260994 ) ( ON ?auto_260992 ?auto_260993 ) ( CLEAR ?auto_260992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_260992 )
      ( MAKE-13PILE ?auto_260992 ?auto_260993 ?auto_260994 ?auto_260995 ?auto_260996 ?auto_260997 ?auto_260998 ?auto_260999 ?auto_261000 ?auto_261001 ?auto_261002 ?auto_261003 ?auto_261004 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_261018 - BLOCK
      ?auto_261019 - BLOCK
      ?auto_261020 - BLOCK
      ?auto_261021 - BLOCK
      ?auto_261022 - BLOCK
      ?auto_261023 - BLOCK
      ?auto_261024 - BLOCK
      ?auto_261025 - BLOCK
      ?auto_261026 - BLOCK
      ?auto_261027 - BLOCK
      ?auto_261028 - BLOCK
      ?auto_261029 - BLOCK
      ?auto_261030 - BLOCK
    )
    :vars
    (
      ?auto_261031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_261018 ?auto_261019 ) ) ( not ( = ?auto_261018 ?auto_261020 ) ) ( not ( = ?auto_261018 ?auto_261021 ) ) ( not ( = ?auto_261018 ?auto_261022 ) ) ( not ( = ?auto_261018 ?auto_261023 ) ) ( not ( = ?auto_261018 ?auto_261024 ) ) ( not ( = ?auto_261018 ?auto_261025 ) ) ( not ( = ?auto_261018 ?auto_261026 ) ) ( not ( = ?auto_261018 ?auto_261027 ) ) ( not ( = ?auto_261018 ?auto_261028 ) ) ( not ( = ?auto_261018 ?auto_261029 ) ) ( not ( = ?auto_261018 ?auto_261030 ) ) ( not ( = ?auto_261019 ?auto_261020 ) ) ( not ( = ?auto_261019 ?auto_261021 ) ) ( not ( = ?auto_261019 ?auto_261022 ) ) ( not ( = ?auto_261019 ?auto_261023 ) ) ( not ( = ?auto_261019 ?auto_261024 ) ) ( not ( = ?auto_261019 ?auto_261025 ) ) ( not ( = ?auto_261019 ?auto_261026 ) ) ( not ( = ?auto_261019 ?auto_261027 ) ) ( not ( = ?auto_261019 ?auto_261028 ) ) ( not ( = ?auto_261019 ?auto_261029 ) ) ( not ( = ?auto_261019 ?auto_261030 ) ) ( not ( = ?auto_261020 ?auto_261021 ) ) ( not ( = ?auto_261020 ?auto_261022 ) ) ( not ( = ?auto_261020 ?auto_261023 ) ) ( not ( = ?auto_261020 ?auto_261024 ) ) ( not ( = ?auto_261020 ?auto_261025 ) ) ( not ( = ?auto_261020 ?auto_261026 ) ) ( not ( = ?auto_261020 ?auto_261027 ) ) ( not ( = ?auto_261020 ?auto_261028 ) ) ( not ( = ?auto_261020 ?auto_261029 ) ) ( not ( = ?auto_261020 ?auto_261030 ) ) ( not ( = ?auto_261021 ?auto_261022 ) ) ( not ( = ?auto_261021 ?auto_261023 ) ) ( not ( = ?auto_261021 ?auto_261024 ) ) ( not ( = ?auto_261021 ?auto_261025 ) ) ( not ( = ?auto_261021 ?auto_261026 ) ) ( not ( = ?auto_261021 ?auto_261027 ) ) ( not ( = ?auto_261021 ?auto_261028 ) ) ( not ( = ?auto_261021 ?auto_261029 ) ) ( not ( = ?auto_261021 ?auto_261030 ) ) ( not ( = ?auto_261022 ?auto_261023 ) ) ( not ( = ?auto_261022 ?auto_261024 ) ) ( not ( = ?auto_261022 ?auto_261025 ) ) ( not ( = ?auto_261022 ?auto_261026 ) ) ( not ( = ?auto_261022 ?auto_261027 ) ) ( not ( = ?auto_261022 ?auto_261028 ) ) ( not ( = ?auto_261022 ?auto_261029 ) ) ( not ( = ?auto_261022 ?auto_261030 ) ) ( not ( = ?auto_261023 ?auto_261024 ) ) ( not ( = ?auto_261023 ?auto_261025 ) ) ( not ( = ?auto_261023 ?auto_261026 ) ) ( not ( = ?auto_261023 ?auto_261027 ) ) ( not ( = ?auto_261023 ?auto_261028 ) ) ( not ( = ?auto_261023 ?auto_261029 ) ) ( not ( = ?auto_261023 ?auto_261030 ) ) ( not ( = ?auto_261024 ?auto_261025 ) ) ( not ( = ?auto_261024 ?auto_261026 ) ) ( not ( = ?auto_261024 ?auto_261027 ) ) ( not ( = ?auto_261024 ?auto_261028 ) ) ( not ( = ?auto_261024 ?auto_261029 ) ) ( not ( = ?auto_261024 ?auto_261030 ) ) ( not ( = ?auto_261025 ?auto_261026 ) ) ( not ( = ?auto_261025 ?auto_261027 ) ) ( not ( = ?auto_261025 ?auto_261028 ) ) ( not ( = ?auto_261025 ?auto_261029 ) ) ( not ( = ?auto_261025 ?auto_261030 ) ) ( not ( = ?auto_261026 ?auto_261027 ) ) ( not ( = ?auto_261026 ?auto_261028 ) ) ( not ( = ?auto_261026 ?auto_261029 ) ) ( not ( = ?auto_261026 ?auto_261030 ) ) ( not ( = ?auto_261027 ?auto_261028 ) ) ( not ( = ?auto_261027 ?auto_261029 ) ) ( not ( = ?auto_261027 ?auto_261030 ) ) ( not ( = ?auto_261028 ?auto_261029 ) ) ( not ( = ?auto_261028 ?auto_261030 ) ) ( not ( = ?auto_261029 ?auto_261030 ) ) ( ON ?auto_261018 ?auto_261031 ) ( not ( = ?auto_261030 ?auto_261031 ) ) ( not ( = ?auto_261029 ?auto_261031 ) ) ( not ( = ?auto_261028 ?auto_261031 ) ) ( not ( = ?auto_261027 ?auto_261031 ) ) ( not ( = ?auto_261026 ?auto_261031 ) ) ( not ( = ?auto_261025 ?auto_261031 ) ) ( not ( = ?auto_261024 ?auto_261031 ) ) ( not ( = ?auto_261023 ?auto_261031 ) ) ( not ( = ?auto_261022 ?auto_261031 ) ) ( not ( = ?auto_261021 ?auto_261031 ) ) ( not ( = ?auto_261020 ?auto_261031 ) ) ( not ( = ?auto_261019 ?auto_261031 ) ) ( not ( = ?auto_261018 ?auto_261031 ) ) ( ON ?auto_261019 ?auto_261018 ) ( ON ?auto_261020 ?auto_261019 ) ( ON ?auto_261021 ?auto_261020 ) ( ON ?auto_261022 ?auto_261021 ) ( ON ?auto_261023 ?auto_261022 ) ( ON ?auto_261024 ?auto_261023 ) ( ON ?auto_261025 ?auto_261024 ) ( ON ?auto_261026 ?auto_261025 ) ( ON ?auto_261027 ?auto_261026 ) ( ON ?auto_261028 ?auto_261027 ) ( ON ?auto_261029 ?auto_261028 ) ( ON ?auto_261030 ?auto_261029 ) ( CLEAR ?auto_261030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_261030 ?auto_261029 ?auto_261028 ?auto_261027 ?auto_261026 ?auto_261025 ?auto_261024 ?auto_261023 ?auto_261022 ?auto_261021 ?auto_261020 ?auto_261019 ?auto_261018 )
      ( MAKE-13PILE ?auto_261018 ?auto_261019 ?auto_261020 ?auto_261021 ?auto_261022 ?auto_261023 ?auto_261024 ?auto_261025 ?auto_261026 ?auto_261027 ?auto_261028 ?auto_261029 ?auto_261030 ) )
  )

)

