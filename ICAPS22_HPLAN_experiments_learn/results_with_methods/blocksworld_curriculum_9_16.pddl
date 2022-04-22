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
      ?auto_68561 - BLOCK
    )
    :vars
    (
      ?auto_68562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68561 ?auto_68562 ) ( CLEAR ?auto_68561 ) ( HAND-EMPTY ) ( not ( = ?auto_68561 ?auto_68562 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68561 ?auto_68562 )
      ( !PUTDOWN ?auto_68561 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68564 - BLOCK
    )
    :vars
    (
      ?auto_68565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68564 ?auto_68565 ) ( CLEAR ?auto_68564 ) ( HAND-EMPTY ) ( not ( = ?auto_68564 ?auto_68565 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68564 ?auto_68565 )
      ( !PUTDOWN ?auto_68564 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68568 - BLOCK
      ?auto_68569 - BLOCK
    )
    :vars
    (
      ?auto_68570 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_68568 ) ( ON ?auto_68569 ?auto_68570 ) ( CLEAR ?auto_68569 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68568 ) ( not ( = ?auto_68568 ?auto_68569 ) ) ( not ( = ?auto_68568 ?auto_68570 ) ) ( not ( = ?auto_68569 ?auto_68570 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68569 ?auto_68570 )
      ( !STACK ?auto_68569 ?auto_68568 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68573 - BLOCK
      ?auto_68574 - BLOCK
    )
    :vars
    (
      ?auto_68575 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_68573 ) ( ON ?auto_68574 ?auto_68575 ) ( CLEAR ?auto_68574 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68573 ) ( not ( = ?auto_68573 ?auto_68574 ) ) ( not ( = ?auto_68573 ?auto_68575 ) ) ( not ( = ?auto_68574 ?auto_68575 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68574 ?auto_68575 )
      ( !STACK ?auto_68574 ?auto_68573 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68578 - BLOCK
      ?auto_68579 - BLOCK
    )
    :vars
    (
      ?auto_68580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68579 ?auto_68580 ) ( not ( = ?auto_68578 ?auto_68579 ) ) ( not ( = ?auto_68578 ?auto_68580 ) ) ( not ( = ?auto_68579 ?auto_68580 ) ) ( ON ?auto_68578 ?auto_68579 ) ( CLEAR ?auto_68578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68578 )
      ( MAKE-2PILE ?auto_68578 ?auto_68579 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68583 - BLOCK
      ?auto_68584 - BLOCK
    )
    :vars
    (
      ?auto_68585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68584 ?auto_68585 ) ( not ( = ?auto_68583 ?auto_68584 ) ) ( not ( = ?auto_68583 ?auto_68585 ) ) ( not ( = ?auto_68584 ?auto_68585 ) ) ( ON ?auto_68583 ?auto_68584 ) ( CLEAR ?auto_68583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68583 )
      ( MAKE-2PILE ?auto_68583 ?auto_68584 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_68589 - BLOCK
      ?auto_68590 - BLOCK
      ?auto_68591 - BLOCK
    )
    :vars
    (
      ?auto_68592 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_68590 ) ( ON ?auto_68591 ?auto_68592 ) ( CLEAR ?auto_68591 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68589 ) ( ON ?auto_68590 ?auto_68589 ) ( not ( = ?auto_68589 ?auto_68590 ) ) ( not ( = ?auto_68589 ?auto_68591 ) ) ( not ( = ?auto_68589 ?auto_68592 ) ) ( not ( = ?auto_68590 ?auto_68591 ) ) ( not ( = ?auto_68590 ?auto_68592 ) ) ( not ( = ?auto_68591 ?auto_68592 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68591 ?auto_68592 )
      ( !STACK ?auto_68591 ?auto_68590 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_68596 - BLOCK
      ?auto_68597 - BLOCK
      ?auto_68598 - BLOCK
    )
    :vars
    (
      ?auto_68599 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_68597 ) ( ON ?auto_68598 ?auto_68599 ) ( CLEAR ?auto_68598 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68596 ) ( ON ?auto_68597 ?auto_68596 ) ( not ( = ?auto_68596 ?auto_68597 ) ) ( not ( = ?auto_68596 ?auto_68598 ) ) ( not ( = ?auto_68596 ?auto_68599 ) ) ( not ( = ?auto_68597 ?auto_68598 ) ) ( not ( = ?auto_68597 ?auto_68599 ) ) ( not ( = ?auto_68598 ?auto_68599 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68598 ?auto_68599 )
      ( !STACK ?auto_68598 ?auto_68597 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_68603 - BLOCK
      ?auto_68604 - BLOCK
      ?auto_68605 - BLOCK
    )
    :vars
    (
      ?auto_68606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68605 ?auto_68606 ) ( ON-TABLE ?auto_68603 ) ( not ( = ?auto_68603 ?auto_68604 ) ) ( not ( = ?auto_68603 ?auto_68605 ) ) ( not ( = ?auto_68603 ?auto_68606 ) ) ( not ( = ?auto_68604 ?auto_68605 ) ) ( not ( = ?auto_68604 ?auto_68606 ) ) ( not ( = ?auto_68605 ?auto_68606 ) ) ( CLEAR ?auto_68603 ) ( ON ?auto_68604 ?auto_68605 ) ( CLEAR ?auto_68604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68603 ?auto_68604 )
      ( MAKE-3PILE ?auto_68603 ?auto_68604 ?auto_68605 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_68610 - BLOCK
      ?auto_68611 - BLOCK
      ?auto_68612 - BLOCK
    )
    :vars
    (
      ?auto_68613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68612 ?auto_68613 ) ( ON-TABLE ?auto_68610 ) ( not ( = ?auto_68610 ?auto_68611 ) ) ( not ( = ?auto_68610 ?auto_68612 ) ) ( not ( = ?auto_68610 ?auto_68613 ) ) ( not ( = ?auto_68611 ?auto_68612 ) ) ( not ( = ?auto_68611 ?auto_68613 ) ) ( not ( = ?auto_68612 ?auto_68613 ) ) ( CLEAR ?auto_68610 ) ( ON ?auto_68611 ?auto_68612 ) ( CLEAR ?auto_68611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68610 ?auto_68611 )
      ( MAKE-3PILE ?auto_68610 ?auto_68611 ?auto_68612 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_68617 - BLOCK
      ?auto_68618 - BLOCK
      ?auto_68619 - BLOCK
    )
    :vars
    (
      ?auto_68620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68619 ?auto_68620 ) ( not ( = ?auto_68617 ?auto_68618 ) ) ( not ( = ?auto_68617 ?auto_68619 ) ) ( not ( = ?auto_68617 ?auto_68620 ) ) ( not ( = ?auto_68618 ?auto_68619 ) ) ( not ( = ?auto_68618 ?auto_68620 ) ) ( not ( = ?auto_68619 ?auto_68620 ) ) ( ON ?auto_68618 ?auto_68619 ) ( ON ?auto_68617 ?auto_68618 ) ( CLEAR ?auto_68617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68617 )
      ( MAKE-3PILE ?auto_68617 ?auto_68618 ?auto_68619 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_68624 - BLOCK
      ?auto_68625 - BLOCK
      ?auto_68626 - BLOCK
    )
    :vars
    (
      ?auto_68627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68626 ?auto_68627 ) ( not ( = ?auto_68624 ?auto_68625 ) ) ( not ( = ?auto_68624 ?auto_68626 ) ) ( not ( = ?auto_68624 ?auto_68627 ) ) ( not ( = ?auto_68625 ?auto_68626 ) ) ( not ( = ?auto_68625 ?auto_68627 ) ) ( not ( = ?auto_68626 ?auto_68627 ) ) ( ON ?auto_68625 ?auto_68626 ) ( ON ?auto_68624 ?auto_68625 ) ( CLEAR ?auto_68624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68624 )
      ( MAKE-3PILE ?auto_68624 ?auto_68625 ?auto_68626 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68632 - BLOCK
      ?auto_68633 - BLOCK
      ?auto_68634 - BLOCK
      ?auto_68635 - BLOCK
    )
    :vars
    (
      ?auto_68636 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_68634 ) ( ON ?auto_68635 ?auto_68636 ) ( CLEAR ?auto_68635 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68632 ) ( ON ?auto_68633 ?auto_68632 ) ( ON ?auto_68634 ?auto_68633 ) ( not ( = ?auto_68632 ?auto_68633 ) ) ( not ( = ?auto_68632 ?auto_68634 ) ) ( not ( = ?auto_68632 ?auto_68635 ) ) ( not ( = ?auto_68632 ?auto_68636 ) ) ( not ( = ?auto_68633 ?auto_68634 ) ) ( not ( = ?auto_68633 ?auto_68635 ) ) ( not ( = ?auto_68633 ?auto_68636 ) ) ( not ( = ?auto_68634 ?auto_68635 ) ) ( not ( = ?auto_68634 ?auto_68636 ) ) ( not ( = ?auto_68635 ?auto_68636 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68635 ?auto_68636 )
      ( !STACK ?auto_68635 ?auto_68634 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68641 - BLOCK
      ?auto_68642 - BLOCK
      ?auto_68643 - BLOCK
      ?auto_68644 - BLOCK
    )
    :vars
    (
      ?auto_68645 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_68643 ) ( ON ?auto_68644 ?auto_68645 ) ( CLEAR ?auto_68644 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68641 ) ( ON ?auto_68642 ?auto_68641 ) ( ON ?auto_68643 ?auto_68642 ) ( not ( = ?auto_68641 ?auto_68642 ) ) ( not ( = ?auto_68641 ?auto_68643 ) ) ( not ( = ?auto_68641 ?auto_68644 ) ) ( not ( = ?auto_68641 ?auto_68645 ) ) ( not ( = ?auto_68642 ?auto_68643 ) ) ( not ( = ?auto_68642 ?auto_68644 ) ) ( not ( = ?auto_68642 ?auto_68645 ) ) ( not ( = ?auto_68643 ?auto_68644 ) ) ( not ( = ?auto_68643 ?auto_68645 ) ) ( not ( = ?auto_68644 ?auto_68645 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68644 ?auto_68645 )
      ( !STACK ?auto_68644 ?auto_68643 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68650 - BLOCK
      ?auto_68651 - BLOCK
      ?auto_68652 - BLOCK
      ?auto_68653 - BLOCK
    )
    :vars
    (
      ?auto_68654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68653 ?auto_68654 ) ( ON-TABLE ?auto_68650 ) ( ON ?auto_68651 ?auto_68650 ) ( not ( = ?auto_68650 ?auto_68651 ) ) ( not ( = ?auto_68650 ?auto_68652 ) ) ( not ( = ?auto_68650 ?auto_68653 ) ) ( not ( = ?auto_68650 ?auto_68654 ) ) ( not ( = ?auto_68651 ?auto_68652 ) ) ( not ( = ?auto_68651 ?auto_68653 ) ) ( not ( = ?auto_68651 ?auto_68654 ) ) ( not ( = ?auto_68652 ?auto_68653 ) ) ( not ( = ?auto_68652 ?auto_68654 ) ) ( not ( = ?auto_68653 ?auto_68654 ) ) ( CLEAR ?auto_68651 ) ( ON ?auto_68652 ?auto_68653 ) ( CLEAR ?auto_68652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68650 ?auto_68651 ?auto_68652 )
      ( MAKE-4PILE ?auto_68650 ?auto_68651 ?auto_68652 ?auto_68653 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68659 - BLOCK
      ?auto_68660 - BLOCK
      ?auto_68661 - BLOCK
      ?auto_68662 - BLOCK
    )
    :vars
    (
      ?auto_68663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68662 ?auto_68663 ) ( ON-TABLE ?auto_68659 ) ( ON ?auto_68660 ?auto_68659 ) ( not ( = ?auto_68659 ?auto_68660 ) ) ( not ( = ?auto_68659 ?auto_68661 ) ) ( not ( = ?auto_68659 ?auto_68662 ) ) ( not ( = ?auto_68659 ?auto_68663 ) ) ( not ( = ?auto_68660 ?auto_68661 ) ) ( not ( = ?auto_68660 ?auto_68662 ) ) ( not ( = ?auto_68660 ?auto_68663 ) ) ( not ( = ?auto_68661 ?auto_68662 ) ) ( not ( = ?auto_68661 ?auto_68663 ) ) ( not ( = ?auto_68662 ?auto_68663 ) ) ( CLEAR ?auto_68660 ) ( ON ?auto_68661 ?auto_68662 ) ( CLEAR ?auto_68661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68659 ?auto_68660 ?auto_68661 )
      ( MAKE-4PILE ?auto_68659 ?auto_68660 ?auto_68661 ?auto_68662 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68668 - BLOCK
      ?auto_68669 - BLOCK
      ?auto_68670 - BLOCK
      ?auto_68671 - BLOCK
    )
    :vars
    (
      ?auto_68672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68671 ?auto_68672 ) ( ON-TABLE ?auto_68668 ) ( not ( = ?auto_68668 ?auto_68669 ) ) ( not ( = ?auto_68668 ?auto_68670 ) ) ( not ( = ?auto_68668 ?auto_68671 ) ) ( not ( = ?auto_68668 ?auto_68672 ) ) ( not ( = ?auto_68669 ?auto_68670 ) ) ( not ( = ?auto_68669 ?auto_68671 ) ) ( not ( = ?auto_68669 ?auto_68672 ) ) ( not ( = ?auto_68670 ?auto_68671 ) ) ( not ( = ?auto_68670 ?auto_68672 ) ) ( not ( = ?auto_68671 ?auto_68672 ) ) ( ON ?auto_68670 ?auto_68671 ) ( CLEAR ?auto_68668 ) ( ON ?auto_68669 ?auto_68670 ) ( CLEAR ?auto_68669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68668 ?auto_68669 )
      ( MAKE-4PILE ?auto_68668 ?auto_68669 ?auto_68670 ?auto_68671 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68677 - BLOCK
      ?auto_68678 - BLOCK
      ?auto_68679 - BLOCK
      ?auto_68680 - BLOCK
    )
    :vars
    (
      ?auto_68681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68680 ?auto_68681 ) ( ON-TABLE ?auto_68677 ) ( not ( = ?auto_68677 ?auto_68678 ) ) ( not ( = ?auto_68677 ?auto_68679 ) ) ( not ( = ?auto_68677 ?auto_68680 ) ) ( not ( = ?auto_68677 ?auto_68681 ) ) ( not ( = ?auto_68678 ?auto_68679 ) ) ( not ( = ?auto_68678 ?auto_68680 ) ) ( not ( = ?auto_68678 ?auto_68681 ) ) ( not ( = ?auto_68679 ?auto_68680 ) ) ( not ( = ?auto_68679 ?auto_68681 ) ) ( not ( = ?auto_68680 ?auto_68681 ) ) ( ON ?auto_68679 ?auto_68680 ) ( CLEAR ?auto_68677 ) ( ON ?auto_68678 ?auto_68679 ) ( CLEAR ?auto_68678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68677 ?auto_68678 )
      ( MAKE-4PILE ?auto_68677 ?auto_68678 ?auto_68679 ?auto_68680 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68686 - BLOCK
      ?auto_68687 - BLOCK
      ?auto_68688 - BLOCK
      ?auto_68689 - BLOCK
    )
    :vars
    (
      ?auto_68690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68689 ?auto_68690 ) ( not ( = ?auto_68686 ?auto_68687 ) ) ( not ( = ?auto_68686 ?auto_68688 ) ) ( not ( = ?auto_68686 ?auto_68689 ) ) ( not ( = ?auto_68686 ?auto_68690 ) ) ( not ( = ?auto_68687 ?auto_68688 ) ) ( not ( = ?auto_68687 ?auto_68689 ) ) ( not ( = ?auto_68687 ?auto_68690 ) ) ( not ( = ?auto_68688 ?auto_68689 ) ) ( not ( = ?auto_68688 ?auto_68690 ) ) ( not ( = ?auto_68689 ?auto_68690 ) ) ( ON ?auto_68688 ?auto_68689 ) ( ON ?auto_68687 ?auto_68688 ) ( ON ?auto_68686 ?auto_68687 ) ( CLEAR ?auto_68686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68686 )
      ( MAKE-4PILE ?auto_68686 ?auto_68687 ?auto_68688 ?auto_68689 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68695 - BLOCK
      ?auto_68696 - BLOCK
      ?auto_68697 - BLOCK
      ?auto_68698 - BLOCK
    )
    :vars
    (
      ?auto_68699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68698 ?auto_68699 ) ( not ( = ?auto_68695 ?auto_68696 ) ) ( not ( = ?auto_68695 ?auto_68697 ) ) ( not ( = ?auto_68695 ?auto_68698 ) ) ( not ( = ?auto_68695 ?auto_68699 ) ) ( not ( = ?auto_68696 ?auto_68697 ) ) ( not ( = ?auto_68696 ?auto_68698 ) ) ( not ( = ?auto_68696 ?auto_68699 ) ) ( not ( = ?auto_68697 ?auto_68698 ) ) ( not ( = ?auto_68697 ?auto_68699 ) ) ( not ( = ?auto_68698 ?auto_68699 ) ) ( ON ?auto_68697 ?auto_68698 ) ( ON ?auto_68696 ?auto_68697 ) ( ON ?auto_68695 ?auto_68696 ) ( CLEAR ?auto_68695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68695 )
      ( MAKE-4PILE ?auto_68695 ?auto_68696 ?auto_68697 ?auto_68698 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68705 - BLOCK
      ?auto_68706 - BLOCK
      ?auto_68707 - BLOCK
      ?auto_68708 - BLOCK
      ?auto_68709 - BLOCK
    )
    :vars
    (
      ?auto_68710 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_68708 ) ( ON ?auto_68709 ?auto_68710 ) ( CLEAR ?auto_68709 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68705 ) ( ON ?auto_68706 ?auto_68705 ) ( ON ?auto_68707 ?auto_68706 ) ( ON ?auto_68708 ?auto_68707 ) ( not ( = ?auto_68705 ?auto_68706 ) ) ( not ( = ?auto_68705 ?auto_68707 ) ) ( not ( = ?auto_68705 ?auto_68708 ) ) ( not ( = ?auto_68705 ?auto_68709 ) ) ( not ( = ?auto_68705 ?auto_68710 ) ) ( not ( = ?auto_68706 ?auto_68707 ) ) ( not ( = ?auto_68706 ?auto_68708 ) ) ( not ( = ?auto_68706 ?auto_68709 ) ) ( not ( = ?auto_68706 ?auto_68710 ) ) ( not ( = ?auto_68707 ?auto_68708 ) ) ( not ( = ?auto_68707 ?auto_68709 ) ) ( not ( = ?auto_68707 ?auto_68710 ) ) ( not ( = ?auto_68708 ?auto_68709 ) ) ( not ( = ?auto_68708 ?auto_68710 ) ) ( not ( = ?auto_68709 ?auto_68710 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68709 ?auto_68710 )
      ( !STACK ?auto_68709 ?auto_68708 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68716 - BLOCK
      ?auto_68717 - BLOCK
      ?auto_68718 - BLOCK
      ?auto_68719 - BLOCK
      ?auto_68720 - BLOCK
    )
    :vars
    (
      ?auto_68721 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_68719 ) ( ON ?auto_68720 ?auto_68721 ) ( CLEAR ?auto_68720 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68716 ) ( ON ?auto_68717 ?auto_68716 ) ( ON ?auto_68718 ?auto_68717 ) ( ON ?auto_68719 ?auto_68718 ) ( not ( = ?auto_68716 ?auto_68717 ) ) ( not ( = ?auto_68716 ?auto_68718 ) ) ( not ( = ?auto_68716 ?auto_68719 ) ) ( not ( = ?auto_68716 ?auto_68720 ) ) ( not ( = ?auto_68716 ?auto_68721 ) ) ( not ( = ?auto_68717 ?auto_68718 ) ) ( not ( = ?auto_68717 ?auto_68719 ) ) ( not ( = ?auto_68717 ?auto_68720 ) ) ( not ( = ?auto_68717 ?auto_68721 ) ) ( not ( = ?auto_68718 ?auto_68719 ) ) ( not ( = ?auto_68718 ?auto_68720 ) ) ( not ( = ?auto_68718 ?auto_68721 ) ) ( not ( = ?auto_68719 ?auto_68720 ) ) ( not ( = ?auto_68719 ?auto_68721 ) ) ( not ( = ?auto_68720 ?auto_68721 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68720 ?auto_68721 )
      ( !STACK ?auto_68720 ?auto_68719 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68727 - BLOCK
      ?auto_68728 - BLOCK
      ?auto_68729 - BLOCK
      ?auto_68730 - BLOCK
      ?auto_68731 - BLOCK
    )
    :vars
    (
      ?auto_68732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68731 ?auto_68732 ) ( ON-TABLE ?auto_68727 ) ( ON ?auto_68728 ?auto_68727 ) ( ON ?auto_68729 ?auto_68728 ) ( not ( = ?auto_68727 ?auto_68728 ) ) ( not ( = ?auto_68727 ?auto_68729 ) ) ( not ( = ?auto_68727 ?auto_68730 ) ) ( not ( = ?auto_68727 ?auto_68731 ) ) ( not ( = ?auto_68727 ?auto_68732 ) ) ( not ( = ?auto_68728 ?auto_68729 ) ) ( not ( = ?auto_68728 ?auto_68730 ) ) ( not ( = ?auto_68728 ?auto_68731 ) ) ( not ( = ?auto_68728 ?auto_68732 ) ) ( not ( = ?auto_68729 ?auto_68730 ) ) ( not ( = ?auto_68729 ?auto_68731 ) ) ( not ( = ?auto_68729 ?auto_68732 ) ) ( not ( = ?auto_68730 ?auto_68731 ) ) ( not ( = ?auto_68730 ?auto_68732 ) ) ( not ( = ?auto_68731 ?auto_68732 ) ) ( CLEAR ?auto_68729 ) ( ON ?auto_68730 ?auto_68731 ) ( CLEAR ?auto_68730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68727 ?auto_68728 ?auto_68729 ?auto_68730 )
      ( MAKE-5PILE ?auto_68727 ?auto_68728 ?auto_68729 ?auto_68730 ?auto_68731 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68738 - BLOCK
      ?auto_68739 - BLOCK
      ?auto_68740 - BLOCK
      ?auto_68741 - BLOCK
      ?auto_68742 - BLOCK
    )
    :vars
    (
      ?auto_68743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68742 ?auto_68743 ) ( ON-TABLE ?auto_68738 ) ( ON ?auto_68739 ?auto_68738 ) ( ON ?auto_68740 ?auto_68739 ) ( not ( = ?auto_68738 ?auto_68739 ) ) ( not ( = ?auto_68738 ?auto_68740 ) ) ( not ( = ?auto_68738 ?auto_68741 ) ) ( not ( = ?auto_68738 ?auto_68742 ) ) ( not ( = ?auto_68738 ?auto_68743 ) ) ( not ( = ?auto_68739 ?auto_68740 ) ) ( not ( = ?auto_68739 ?auto_68741 ) ) ( not ( = ?auto_68739 ?auto_68742 ) ) ( not ( = ?auto_68739 ?auto_68743 ) ) ( not ( = ?auto_68740 ?auto_68741 ) ) ( not ( = ?auto_68740 ?auto_68742 ) ) ( not ( = ?auto_68740 ?auto_68743 ) ) ( not ( = ?auto_68741 ?auto_68742 ) ) ( not ( = ?auto_68741 ?auto_68743 ) ) ( not ( = ?auto_68742 ?auto_68743 ) ) ( CLEAR ?auto_68740 ) ( ON ?auto_68741 ?auto_68742 ) ( CLEAR ?auto_68741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68738 ?auto_68739 ?auto_68740 ?auto_68741 )
      ( MAKE-5PILE ?auto_68738 ?auto_68739 ?auto_68740 ?auto_68741 ?auto_68742 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68749 - BLOCK
      ?auto_68750 - BLOCK
      ?auto_68751 - BLOCK
      ?auto_68752 - BLOCK
      ?auto_68753 - BLOCK
    )
    :vars
    (
      ?auto_68754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68753 ?auto_68754 ) ( ON-TABLE ?auto_68749 ) ( ON ?auto_68750 ?auto_68749 ) ( not ( = ?auto_68749 ?auto_68750 ) ) ( not ( = ?auto_68749 ?auto_68751 ) ) ( not ( = ?auto_68749 ?auto_68752 ) ) ( not ( = ?auto_68749 ?auto_68753 ) ) ( not ( = ?auto_68749 ?auto_68754 ) ) ( not ( = ?auto_68750 ?auto_68751 ) ) ( not ( = ?auto_68750 ?auto_68752 ) ) ( not ( = ?auto_68750 ?auto_68753 ) ) ( not ( = ?auto_68750 ?auto_68754 ) ) ( not ( = ?auto_68751 ?auto_68752 ) ) ( not ( = ?auto_68751 ?auto_68753 ) ) ( not ( = ?auto_68751 ?auto_68754 ) ) ( not ( = ?auto_68752 ?auto_68753 ) ) ( not ( = ?auto_68752 ?auto_68754 ) ) ( not ( = ?auto_68753 ?auto_68754 ) ) ( ON ?auto_68752 ?auto_68753 ) ( CLEAR ?auto_68750 ) ( ON ?auto_68751 ?auto_68752 ) ( CLEAR ?auto_68751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68749 ?auto_68750 ?auto_68751 )
      ( MAKE-5PILE ?auto_68749 ?auto_68750 ?auto_68751 ?auto_68752 ?auto_68753 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68760 - BLOCK
      ?auto_68761 - BLOCK
      ?auto_68762 - BLOCK
      ?auto_68763 - BLOCK
      ?auto_68764 - BLOCK
    )
    :vars
    (
      ?auto_68765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68764 ?auto_68765 ) ( ON-TABLE ?auto_68760 ) ( ON ?auto_68761 ?auto_68760 ) ( not ( = ?auto_68760 ?auto_68761 ) ) ( not ( = ?auto_68760 ?auto_68762 ) ) ( not ( = ?auto_68760 ?auto_68763 ) ) ( not ( = ?auto_68760 ?auto_68764 ) ) ( not ( = ?auto_68760 ?auto_68765 ) ) ( not ( = ?auto_68761 ?auto_68762 ) ) ( not ( = ?auto_68761 ?auto_68763 ) ) ( not ( = ?auto_68761 ?auto_68764 ) ) ( not ( = ?auto_68761 ?auto_68765 ) ) ( not ( = ?auto_68762 ?auto_68763 ) ) ( not ( = ?auto_68762 ?auto_68764 ) ) ( not ( = ?auto_68762 ?auto_68765 ) ) ( not ( = ?auto_68763 ?auto_68764 ) ) ( not ( = ?auto_68763 ?auto_68765 ) ) ( not ( = ?auto_68764 ?auto_68765 ) ) ( ON ?auto_68763 ?auto_68764 ) ( CLEAR ?auto_68761 ) ( ON ?auto_68762 ?auto_68763 ) ( CLEAR ?auto_68762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68760 ?auto_68761 ?auto_68762 )
      ( MAKE-5PILE ?auto_68760 ?auto_68761 ?auto_68762 ?auto_68763 ?auto_68764 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68771 - BLOCK
      ?auto_68772 - BLOCK
      ?auto_68773 - BLOCK
      ?auto_68774 - BLOCK
      ?auto_68775 - BLOCK
    )
    :vars
    (
      ?auto_68776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68775 ?auto_68776 ) ( ON-TABLE ?auto_68771 ) ( not ( = ?auto_68771 ?auto_68772 ) ) ( not ( = ?auto_68771 ?auto_68773 ) ) ( not ( = ?auto_68771 ?auto_68774 ) ) ( not ( = ?auto_68771 ?auto_68775 ) ) ( not ( = ?auto_68771 ?auto_68776 ) ) ( not ( = ?auto_68772 ?auto_68773 ) ) ( not ( = ?auto_68772 ?auto_68774 ) ) ( not ( = ?auto_68772 ?auto_68775 ) ) ( not ( = ?auto_68772 ?auto_68776 ) ) ( not ( = ?auto_68773 ?auto_68774 ) ) ( not ( = ?auto_68773 ?auto_68775 ) ) ( not ( = ?auto_68773 ?auto_68776 ) ) ( not ( = ?auto_68774 ?auto_68775 ) ) ( not ( = ?auto_68774 ?auto_68776 ) ) ( not ( = ?auto_68775 ?auto_68776 ) ) ( ON ?auto_68774 ?auto_68775 ) ( ON ?auto_68773 ?auto_68774 ) ( CLEAR ?auto_68771 ) ( ON ?auto_68772 ?auto_68773 ) ( CLEAR ?auto_68772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68771 ?auto_68772 )
      ( MAKE-5PILE ?auto_68771 ?auto_68772 ?auto_68773 ?auto_68774 ?auto_68775 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68782 - BLOCK
      ?auto_68783 - BLOCK
      ?auto_68784 - BLOCK
      ?auto_68785 - BLOCK
      ?auto_68786 - BLOCK
    )
    :vars
    (
      ?auto_68787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68786 ?auto_68787 ) ( ON-TABLE ?auto_68782 ) ( not ( = ?auto_68782 ?auto_68783 ) ) ( not ( = ?auto_68782 ?auto_68784 ) ) ( not ( = ?auto_68782 ?auto_68785 ) ) ( not ( = ?auto_68782 ?auto_68786 ) ) ( not ( = ?auto_68782 ?auto_68787 ) ) ( not ( = ?auto_68783 ?auto_68784 ) ) ( not ( = ?auto_68783 ?auto_68785 ) ) ( not ( = ?auto_68783 ?auto_68786 ) ) ( not ( = ?auto_68783 ?auto_68787 ) ) ( not ( = ?auto_68784 ?auto_68785 ) ) ( not ( = ?auto_68784 ?auto_68786 ) ) ( not ( = ?auto_68784 ?auto_68787 ) ) ( not ( = ?auto_68785 ?auto_68786 ) ) ( not ( = ?auto_68785 ?auto_68787 ) ) ( not ( = ?auto_68786 ?auto_68787 ) ) ( ON ?auto_68785 ?auto_68786 ) ( ON ?auto_68784 ?auto_68785 ) ( CLEAR ?auto_68782 ) ( ON ?auto_68783 ?auto_68784 ) ( CLEAR ?auto_68783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68782 ?auto_68783 )
      ( MAKE-5PILE ?auto_68782 ?auto_68783 ?auto_68784 ?auto_68785 ?auto_68786 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68793 - BLOCK
      ?auto_68794 - BLOCK
      ?auto_68795 - BLOCK
      ?auto_68796 - BLOCK
      ?auto_68797 - BLOCK
    )
    :vars
    (
      ?auto_68798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68797 ?auto_68798 ) ( not ( = ?auto_68793 ?auto_68794 ) ) ( not ( = ?auto_68793 ?auto_68795 ) ) ( not ( = ?auto_68793 ?auto_68796 ) ) ( not ( = ?auto_68793 ?auto_68797 ) ) ( not ( = ?auto_68793 ?auto_68798 ) ) ( not ( = ?auto_68794 ?auto_68795 ) ) ( not ( = ?auto_68794 ?auto_68796 ) ) ( not ( = ?auto_68794 ?auto_68797 ) ) ( not ( = ?auto_68794 ?auto_68798 ) ) ( not ( = ?auto_68795 ?auto_68796 ) ) ( not ( = ?auto_68795 ?auto_68797 ) ) ( not ( = ?auto_68795 ?auto_68798 ) ) ( not ( = ?auto_68796 ?auto_68797 ) ) ( not ( = ?auto_68796 ?auto_68798 ) ) ( not ( = ?auto_68797 ?auto_68798 ) ) ( ON ?auto_68796 ?auto_68797 ) ( ON ?auto_68795 ?auto_68796 ) ( ON ?auto_68794 ?auto_68795 ) ( ON ?auto_68793 ?auto_68794 ) ( CLEAR ?auto_68793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68793 )
      ( MAKE-5PILE ?auto_68793 ?auto_68794 ?auto_68795 ?auto_68796 ?auto_68797 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68804 - BLOCK
      ?auto_68805 - BLOCK
      ?auto_68806 - BLOCK
      ?auto_68807 - BLOCK
      ?auto_68808 - BLOCK
    )
    :vars
    (
      ?auto_68809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68808 ?auto_68809 ) ( not ( = ?auto_68804 ?auto_68805 ) ) ( not ( = ?auto_68804 ?auto_68806 ) ) ( not ( = ?auto_68804 ?auto_68807 ) ) ( not ( = ?auto_68804 ?auto_68808 ) ) ( not ( = ?auto_68804 ?auto_68809 ) ) ( not ( = ?auto_68805 ?auto_68806 ) ) ( not ( = ?auto_68805 ?auto_68807 ) ) ( not ( = ?auto_68805 ?auto_68808 ) ) ( not ( = ?auto_68805 ?auto_68809 ) ) ( not ( = ?auto_68806 ?auto_68807 ) ) ( not ( = ?auto_68806 ?auto_68808 ) ) ( not ( = ?auto_68806 ?auto_68809 ) ) ( not ( = ?auto_68807 ?auto_68808 ) ) ( not ( = ?auto_68807 ?auto_68809 ) ) ( not ( = ?auto_68808 ?auto_68809 ) ) ( ON ?auto_68807 ?auto_68808 ) ( ON ?auto_68806 ?auto_68807 ) ( ON ?auto_68805 ?auto_68806 ) ( ON ?auto_68804 ?auto_68805 ) ( CLEAR ?auto_68804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68804 )
      ( MAKE-5PILE ?auto_68804 ?auto_68805 ?auto_68806 ?auto_68807 ?auto_68808 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68816 - BLOCK
      ?auto_68817 - BLOCK
      ?auto_68818 - BLOCK
      ?auto_68819 - BLOCK
      ?auto_68820 - BLOCK
      ?auto_68821 - BLOCK
    )
    :vars
    (
      ?auto_68822 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_68820 ) ( ON ?auto_68821 ?auto_68822 ) ( CLEAR ?auto_68821 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68816 ) ( ON ?auto_68817 ?auto_68816 ) ( ON ?auto_68818 ?auto_68817 ) ( ON ?auto_68819 ?auto_68818 ) ( ON ?auto_68820 ?auto_68819 ) ( not ( = ?auto_68816 ?auto_68817 ) ) ( not ( = ?auto_68816 ?auto_68818 ) ) ( not ( = ?auto_68816 ?auto_68819 ) ) ( not ( = ?auto_68816 ?auto_68820 ) ) ( not ( = ?auto_68816 ?auto_68821 ) ) ( not ( = ?auto_68816 ?auto_68822 ) ) ( not ( = ?auto_68817 ?auto_68818 ) ) ( not ( = ?auto_68817 ?auto_68819 ) ) ( not ( = ?auto_68817 ?auto_68820 ) ) ( not ( = ?auto_68817 ?auto_68821 ) ) ( not ( = ?auto_68817 ?auto_68822 ) ) ( not ( = ?auto_68818 ?auto_68819 ) ) ( not ( = ?auto_68818 ?auto_68820 ) ) ( not ( = ?auto_68818 ?auto_68821 ) ) ( not ( = ?auto_68818 ?auto_68822 ) ) ( not ( = ?auto_68819 ?auto_68820 ) ) ( not ( = ?auto_68819 ?auto_68821 ) ) ( not ( = ?auto_68819 ?auto_68822 ) ) ( not ( = ?auto_68820 ?auto_68821 ) ) ( not ( = ?auto_68820 ?auto_68822 ) ) ( not ( = ?auto_68821 ?auto_68822 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68821 ?auto_68822 )
      ( !STACK ?auto_68821 ?auto_68820 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68829 - BLOCK
      ?auto_68830 - BLOCK
      ?auto_68831 - BLOCK
      ?auto_68832 - BLOCK
      ?auto_68833 - BLOCK
      ?auto_68834 - BLOCK
    )
    :vars
    (
      ?auto_68835 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_68833 ) ( ON ?auto_68834 ?auto_68835 ) ( CLEAR ?auto_68834 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68829 ) ( ON ?auto_68830 ?auto_68829 ) ( ON ?auto_68831 ?auto_68830 ) ( ON ?auto_68832 ?auto_68831 ) ( ON ?auto_68833 ?auto_68832 ) ( not ( = ?auto_68829 ?auto_68830 ) ) ( not ( = ?auto_68829 ?auto_68831 ) ) ( not ( = ?auto_68829 ?auto_68832 ) ) ( not ( = ?auto_68829 ?auto_68833 ) ) ( not ( = ?auto_68829 ?auto_68834 ) ) ( not ( = ?auto_68829 ?auto_68835 ) ) ( not ( = ?auto_68830 ?auto_68831 ) ) ( not ( = ?auto_68830 ?auto_68832 ) ) ( not ( = ?auto_68830 ?auto_68833 ) ) ( not ( = ?auto_68830 ?auto_68834 ) ) ( not ( = ?auto_68830 ?auto_68835 ) ) ( not ( = ?auto_68831 ?auto_68832 ) ) ( not ( = ?auto_68831 ?auto_68833 ) ) ( not ( = ?auto_68831 ?auto_68834 ) ) ( not ( = ?auto_68831 ?auto_68835 ) ) ( not ( = ?auto_68832 ?auto_68833 ) ) ( not ( = ?auto_68832 ?auto_68834 ) ) ( not ( = ?auto_68832 ?auto_68835 ) ) ( not ( = ?auto_68833 ?auto_68834 ) ) ( not ( = ?auto_68833 ?auto_68835 ) ) ( not ( = ?auto_68834 ?auto_68835 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68834 ?auto_68835 )
      ( !STACK ?auto_68834 ?auto_68833 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68842 - BLOCK
      ?auto_68843 - BLOCK
      ?auto_68844 - BLOCK
      ?auto_68845 - BLOCK
      ?auto_68846 - BLOCK
      ?auto_68847 - BLOCK
    )
    :vars
    (
      ?auto_68848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68847 ?auto_68848 ) ( ON-TABLE ?auto_68842 ) ( ON ?auto_68843 ?auto_68842 ) ( ON ?auto_68844 ?auto_68843 ) ( ON ?auto_68845 ?auto_68844 ) ( not ( = ?auto_68842 ?auto_68843 ) ) ( not ( = ?auto_68842 ?auto_68844 ) ) ( not ( = ?auto_68842 ?auto_68845 ) ) ( not ( = ?auto_68842 ?auto_68846 ) ) ( not ( = ?auto_68842 ?auto_68847 ) ) ( not ( = ?auto_68842 ?auto_68848 ) ) ( not ( = ?auto_68843 ?auto_68844 ) ) ( not ( = ?auto_68843 ?auto_68845 ) ) ( not ( = ?auto_68843 ?auto_68846 ) ) ( not ( = ?auto_68843 ?auto_68847 ) ) ( not ( = ?auto_68843 ?auto_68848 ) ) ( not ( = ?auto_68844 ?auto_68845 ) ) ( not ( = ?auto_68844 ?auto_68846 ) ) ( not ( = ?auto_68844 ?auto_68847 ) ) ( not ( = ?auto_68844 ?auto_68848 ) ) ( not ( = ?auto_68845 ?auto_68846 ) ) ( not ( = ?auto_68845 ?auto_68847 ) ) ( not ( = ?auto_68845 ?auto_68848 ) ) ( not ( = ?auto_68846 ?auto_68847 ) ) ( not ( = ?auto_68846 ?auto_68848 ) ) ( not ( = ?auto_68847 ?auto_68848 ) ) ( CLEAR ?auto_68845 ) ( ON ?auto_68846 ?auto_68847 ) ( CLEAR ?auto_68846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68842 ?auto_68843 ?auto_68844 ?auto_68845 ?auto_68846 )
      ( MAKE-6PILE ?auto_68842 ?auto_68843 ?auto_68844 ?auto_68845 ?auto_68846 ?auto_68847 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68855 - BLOCK
      ?auto_68856 - BLOCK
      ?auto_68857 - BLOCK
      ?auto_68858 - BLOCK
      ?auto_68859 - BLOCK
      ?auto_68860 - BLOCK
    )
    :vars
    (
      ?auto_68861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68860 ?auto_68861 ) ( ON-TABLE ?auto_68855 ) ( ON ?auto_68856 ?auto_68855 ) ( ON ?auto_68857 ?auto_68856 ) ( ON ?auto_68858 ?auto_68857 ) ( not ( = ?auto_68855 ?auto_68856 ) ) ( not ( = ?auto_68855 ?auto_68857 ) ) ( not ( = ?auto_68855 ?auto_68858 ) ) ( not ( = ?auto_68855 ?auto_68859 ) ) ( not ( = ?auto_68855 ?auto_68860 ) ) ( not ( = ?auto_68855 ?auto_68861 ) ) ( not ( = ?auto_68856 ?auto_68857 ) ) ( not ( = ?auto_68856 ?auto_68858 ) ) ( not ( = ?auto_68856 ?auto_68859 ) ) ( not ( = ?auto_68856 ?auto_68860 ) ) ( not ( = ?auto_68856 ?auto_68861 ) ) ( not ( = ?auto_68857 ?auto_68858 ) ) ( not ( = ?auto_68857 ?auto_68859 ) ) ( not ( = ?auto_68857 ?auto_68860 ) ) ( not ( = ?auto_68857 ?auto_68861 ) ) ( not ( = ?auto_68858 ?auto_68859 ) ) ( not ( = ?auto_68858 ?auto_68860 ) ) ( not ( = ?auto_68858 ?auto_68861 ) ) ( not ( = ?auto_68859 ?auto_68860 ) ) ( not ( = ?auto_68859 ?auto_68861 ) ) ( not ( = ?auto_68860 ?auto_68861 ) ) ( CLEAR ?auto_68858 ) ( ON ?auto_68859 ?auto_68860 ) ( CLEAR ?auto_68859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68855 ?auto_68856 ?auto_68857 ?auto_68858 ?auto_68859 )
      ( MAKE-6PILE ?auto_68855 ?auto_68856 ?auto_68857 ?auto_68858 ?auto_68859 ?auto_68860 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68868 - BLOCK
      ?auto_68869 - BLOCK
      ?auto_68870 - BLOCK
      ?auto_68871 - BLOCK
      ?auto_68872 - BLOCK
      ?auto_68873 - BLOCK
    )
    :vars
    (
      ?auto_68874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68873 ?auto_68874 ) ( ON-TABLE ?auto_68868 ) ( ON ?auto_68869 ?auto_68868 ) ( ON ?auto_68870 ?auto_68869 ) ( not ( = ?auto_68868 ?auto_68869 ) ) ( not ( = ?auto_68868 ?auto_68870 ) ) ( not ( = ?auto_68868 ?auto_68871 ) ) ( not ( = ?auto_68868 ?auto_68872 ) ) ( not ( = ?auto_68868 ?auto_68873 ) ) ( not ( = ?auto_68868 ?auto_68874 ) ) ( not ( = ?auto_68869 ?auto_68870 ) ) ( not ( = ?auto_68869 ?auto_68871 ) ) ( not ( = ?auto_68869 ?auto_68872 ) ) ( not ( = ?auto_68869 ?auto_68873 ) ) ( not ( = ?auto_68869 ?auto_68874 ) ) ( not ( = ?auto_68870 ?auto_68871 ) ) ( not ( = ?auto_68870 ?auto_68872 ) ) ( not ( = ?auto_68870 ?auto_68873 ) ) ( not ( = ?auto_68870 ?auto_68874 ) ) ( not ( = ?auto_68871 ?auto_68872 ) ) ( not ( = ?auto_68871 ?auto_68873 ) ) ( not ( = ?auto_68871 ?auto_68874 ) ) ( not ( = ?auto_68872 ?auto_68873 ) ) ( not ( = ?auto_68872 ?auto_68874 ) ) ( not ( = ?auto_68873 ?auto_68874 ) ) ( ON ?auto_68872 ?auto_68873 ) ( CLEAR ?auto_68870 ) ( ON ?auto_68871 ?auto_68872 ) ( CLEAR ?auto_68871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68868 ?auto_68869 ?auto_68870 ?auto_68871 )
      ( MAKE-6PILE ?auto_68868 ?auto_68869 ?auto_68870 ?auto_68871 ?auto_68872 ?auto_68873 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68881 - BLOCK
      ?auto_68882 - BLOCK
      ?auto_68883 - BLOCK
      ?auto_68884 - BLOCK
      ?auto_68885 - BLOCK
      ?auto_68886 - BLOCK
    )
    :vars
    (
      ?auto_68887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68886 ?auto_68887 ) ( ON-TABLE ?auto_68881 ) ( ON ?auto_68882 ?auto_68881 ) ( ON ?auto_68883 ?auto_68882 ) ( not ( = ?auto_68881 ?auto_68882 ) ) ( not ( = ?auto_68881 ?auto_68883 ) ) ( not ( = ?auto_68881 ?auto_68884 ) ) ( not ( = ?auto_68881 ?auto_68885 ) ) ( not ( = ?auto_68881 ?auto_68886 ) ) ( not ( = ?auto_68881 ?auto_68887 ) ) ( not ( = ?auto_68882 ?auto_68883 ) ) ( not ( = ?auto_68882 ?auto_68884 ) ) ( not ( = ?auto_68882 ?auto_68885 ) ) ( not ( = ?auto_68882 ?auto_68886 ) ) ( not ( = ?auto_68882 ?auto_68887 ) ) ( not ( = ?auto_68883 ?auto_68884 ) ) ( not ( = ?auto_68883 ?auto_68885 ) ) ( not ( = ?auto_68883 ?auto_68886 ) ) ( not ( = ?auto_68883 ?auto_68887 ) ) ( not ( = ?auto_68884 ?auto_68885 ) ) ( not ( = ?auto_68884 ?auto_68886 ) ) ( not ( = ?auto_68884 ?auto_68887 ) ) ( not ( = ?auto_68885 ?auto_68886 ) ) ( not ( = ?auto_68885 ?auto_68887 ) ) ( not ( = ?auto_68886 ?auto_68887 ) ) ( ON ?auto_68885 ?auto_68886 ) ( CLEAR ?auto_68883 ) ( ON ?auto_68884 ?auto_68885 ) ( CLEAR ?auto_68884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68881 ?auto_68882 ?auto_68883 ?auto_68884 )
      ( MAKE-6PILE ?auto_68881 ?auto_68882 ?auto_68883 ?auto_68884 ?auto_68885 ?auto_68886 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68894 - BLOCK
      ?auto_68895 - BLOCK
      ?auto_68896 - BLOCK
      ?auto_68897 - BLOCK
      ?auto_68898 - BLOCK
      ?auto_68899 - BLOCK
    )
    :vars
    (
      ?auto_68900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68899 ?auto_68900 ) ( ON-TABLE ?auto_68894 ) ( ON ?auto_68895 ?auto_68894 ) ( not ( = ?auto_68894 ?auto_68895 ) ) ( not ( = ?auto_68894 ?auto_68896 ) ) ( not ( = ?auto_68894 ?auto_68897 ) ) ( not ( = ?auto_68894 ?auto_68898 ) ) ( not ( = ?auto_68894 ?auto_68899 ) ) ( not ( = ?auto_68894 ?auto_68900 ) ) ( not ( = ?auto_68895 ?auto_68896 ) ) ( not ( = ?auto_68895 ?auto_68897 ) ) ( not ( = ?auto_68895 ?auto_68898 ) ) ( not ( = ?auto_68895 ?auto_68899 ) ) ( not ( = ?auto_68895 ?auto_68900 ) ) ( not ( = ?auto_68896 ?auto_68897 ) ) ( not ( = ?auto_68896 ?auto_68898 ) ) ( not ( = ?auto_68896 ?auto_68899 ) ) ( not ( = ?auto_68896 ?auto_68900 ) ) ( not ( = ?auto_68897 ?auto_68898 ) ) ( not ( = ?auto_68897 ?auto_68899 ) ) ( not ( = ?auto_68897 ?auto_68900 ) ) ( not ( = ?auto_68898 ?auto_68899 ) ) ( not ( = ?auto_68898 ?auto_68900 ) ) ( not ( = ?auto_68899 ?auto_68900 ) ) ( ON ?auto_68898 ?auto_68899 ) ( ON ?auto_68897 ?auto_68898 ) ( CLEAR ?auto_68895 ) ( ON ?auto_68896 ?auto_68897 ) ( CLEAR ?auto_68896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68894 ?auto_68895 ?auto_68896 )
      ( MAKE-6PILE ?auto_68894 ?auto_68895 ?auto_68896 ?auto_68897 ?auto_68898 ?auto_68899 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68907 - BLOCK
      ?auto_68908 - BLOCK
      ?auto_68909 - BLOCK
      ?auto_68910 - BLOCK
      ?auto_68911 - BLOCK
      ?auto_68912 - BLOCK
    )
    :vars
    (
      ?auto_68913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68912 ?auto_68913 ) ( ON-TABLE ?auto_68907 ) ( ON ?auto_68908 ?auto_68907 ) ( not ( = ?auto_68907 ?auto_68908 ) ) ( not ( = ?auto_68907 ?auto_68909 ) ) ( not ( = ?auto_68907 ?auto_68910 ) ) ( not ( = ?auto_68907 ?auto_68911 ) ) ( not ( = ?auto_68907 ?auto_68912 ) ) ( not ( = ?auto_68907 ?auto_68913 ) ) ( not ( = ?auto_68908 ?auto_68909 ) ) ( not ( = ?auto_68908 ?auto_68910 ) ) ( not ( = ?auto_68908 ?auto_68911 ) ) ( not ( = ?auto_68908 ?auto_68912 ) ) ( not ( = ?auto_68908 ?auto_68913 ) ) ( not ( = ?auto_68909 ?auto_68910 ) ) ( not ( = ?auto_68909 ?auto_68911 ) ) ( not ( = ?auto_68909 ?auto_68912 ) ) ( not ( = ?auto_68909 ?auto_68913 ) ) ( not ( = ?auto_68910 ?auto_68911 ) ) ( not ( = ?auto_68910 ?auto_68912 ) ) ( not ( = ?auto_68910 ?auto_68913 ) ) ( not ( = ?auto_68911 ?auto_68912 ) ) ( not ( = ?auto_68911 ?auto_68913 ) ) ( not ( = ?auto_68912 ?auto_68913 ) ) ( ON ?auto_68911 ?auto_68912 ) ( ON ?auto_68910 ?auto_68911 ) ( CLEAR ?auto_68908 ) ( ON ?auto_68909 ?auto_68910 ) ( CLEAR ?auto_68909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68907 ?auto_68908 ?auto_68909 )
      ( MAKE-6PILE ?auto_68907 ?auto_68908 ?auto_68909 ?auto_68910 ?auto_68911 ?auto_68912 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68920 - BLOCK
      ?auto_68921 - BLOCK
      ?auto_68922 - BLOCK
      ?auto_68923 - BLOCK
      ?auto_68924 - BLOCK
      ?auto_68925 - BLOCK
    )
    :vars
    (
      ?auto_68926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68925 ?auto_68926 ) ( ON-TABLE ?auto_68920 ) ( not ( = ?auto_68920 ?auto_68921 ) ) ( not ( = ?auto_68920 ?auto_68922 ) ) ( not ( = ?auto_68920 ?auto_68923 ) ) ( not ( = ?auto_68920 ?auto_68924 ) ) ( not ( = ?auto_68920 ?auto_68925 ) ) ( not ( = ?auto_68920 ?auto_68926 ) ) ( not ( = ?auto_68921 ?auto_68922 ) ) ( not ( = ?auto_68921 ?auto_68923 ) ) ( not ( = ?auto_68921 ?auto_68924 ) ) ( not ( = ?auto_68921 ?auto_68925 ) ) ( not ( = ?auto_68921 ?auto_68926 ) ) ( not ( = ?auto_68922 ?auto_68923 ) ) ( not ( = ?auto_68922 ?auto_68924 ) ) ( not ( = ?auto_68922 ?auto_68925 ) ) ( not ( = ?auto_68922 ?auto_68926 ) ) ( not ( = ?auto_68923 ?auto_68924 ) ) ( not ( = ?auto_68923 ?auto_68925 ) ) ( not ( = ?auto_68923 ?auto_68926 ) ) ( not ( = ?auto_68924 ?auto_68925 ) ) ( not ( = ?auto_68924 ?auto_68926 ) ) ( not ( = ?auto_68925 ?auto_68926 ) ) ( ON ?auto_68924 ?auto_68925 ) ( ON ?auto_68923 ?auto_68924 ) ( ON ?auto_68922 ?auto_68923 ) ( CLEAR ?auto_68920 ) ( ON ?auto_68921 ?auto_68922 ) ( CLEAR ?auto_68921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68920 ?auto_68921 )
      ( MAKE-6PILE ?auto_68920 ?auto_68921 ?auto_68922 ?auto_68923 ?auto_68924 ?auto_68925 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68933 - BLOCK
      ?auto_68934 - BLOCK
      ?auto_68935 - BLOCK
      ?auto_68936 - BLOCK
      ?auto_68937 - BLOCK
      ?auto_68938 - BLOCK
    )
    :vars
    (
      ?auto_68939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68938 ?auto_68939 ) ( ON-TABLE ?auto_68933 ) ( not ( = ?auto_68933 ?auto_68934 ) ) ( not ( = ?auto_68933 ?auto_68935 ) ) ( not ( = ?auto_68933 ?auto_68936 ) ) ( not ( = ?auto_68933 ?auto_68937 ) ) ( not ( = ?auto_68933 ?auto_68938 ) ) ( not ( = ?auto_68933 ?auto_68939 ) ) ( not ( = ?auto_68934 ?auto_68935 ) ) ( not ( = ?auto_68934 ?auto_68936 ) ) ( not ( = ?auto_68934 ?auto_68937 ) ) ( not ( = ?auto_68934 ?auto_68938 ) ) ( not ( = ?auto_68934 ?auto_68939 ) ) ( not ( = ?auto_68935 ?auto_68936 ) ) ( not ( = ?auto_68935 ?auto_68937 ) ) ( not ( = ?auto_68935 ?auto_68938 ) ) ( not ( = ?auto_68935 ?auto_68939 ) ) ( not ( = ?auto_68936 ?auto_68937 ) ) ( not ( = ?auto_68936 ?auto_68938 ) ) ( not ( = ?auto_68936 ?auto_68939 ) ) ( not ( = ?auto_68937 ?auto_68938 ) ) ( not ( = ?auto_68937 ?auto_68939 ) ) ( not ( = ?auto_68938 ?auto_68939 ) ) ( ON ?auto_68937 ?auto_68938 ) ( ON ?auto_68936 ?auto_68937 ) ( ON ?auto_68935 ?auto_68936 ) ( CLEAR ?auto_68933 ) ( ON ?auto_68934 ?auto_68935 ) ( CLEAR ?auto_68934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68933 ?auto_68934 )
      ( MAKE-6PILE ?auto_68933 ?auto_68934 ?auto_68935 ?auto_68936 ?auto_68937 ?auto_68938 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68946 - BLOCK
      ?auto_68947 - BLOCK
      ?auto_68948 - BLOCK
      ?auto_68949 - BLOCK
      ?auto_68950 - BLOCK
      ?auto_68951 - BLOCK
    )
    :vars
    (
      ?auto_68952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68951 ?auto_68952 ) ( not ( = ?auto_68946 ?auto_68947 ) ) ( not ( = ?auto_68946 ?auto_68948 ) ) ( not ( = ?auto_68946 ?auto_68949 ) ) ( not ( = ?auto_68946 ?auto_68950 ) ) ( not ( = ?auto_68946 ?auto_68951 ) ) ( not ( = ?auto_68946 ?auto_68952 ) ) ( not ( = ?auto_68947 ?auto_68948 ) ) ( not ( = ?auto_68947 ?auto_68949 ) ) ( not ( = ?auto_68947 ?auto_68950 ) ) ( not ( = ?auto_68947 ?auto_68951 ) ) ( not ( = ?auto_68947 ?auto_68952 ) ) ( not ( = ?auto_68948 ?auto_68949 ) ) ( not ( = ?auto_68948 ?auto_68950 ) ) ( not ( = ?auto_68948 ?auto_68951 ) ) ( not ( = ?auto_68948 ?auto_68952 ) ) ( not ( = ?auto_68949 ?auto_68950 ) ) ( not ( = ?auto_68949 ?auto_68951 ) ) ( not ( = ?auto_68949 ?auto_68952 ) ) ( not ( = ?auto_68950 ?auto_68951 ) ) ( not ( = ?auto_68950 ?auto_68952 ) ) ( not ( = ?auto_68951 ?auto_68952 ) ) ( ON ?auto_68950 ?auto_68951 ) ( ON ?auto_68949 ?auto_68950 ) ( ON ?auto_68948 ?auto_68949 ) ( ON ?auto_68947 ?auto_68948 ) ( ON ?auto_68946 ?auto_68947 ) ( CLEAR ?auto_68946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68946 )
      ( MAKE-6PILE ?auto_68946 ?auto_68947 ?auto_68948 ?auto_68949 ?auto_68950 ?auto_68951 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68959 - BLOCK
      ?auto_68960 - BLOCK
      ?auto_68961 - BLOCK
      ?auto_68962 - BLOCK
      ?auto_68963 - BLOCK
      ?auto_68964 - BLOCK
    )
    :vars
    (
      ?auto_68965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68964 ?auto_68965 ) ( not ( = ?auto_68959 ?auto_68960 ) ) ( not ( = ?auto_68959 ?auto_68961 ) ) ( not ( = ?auto_68959 ?auto_68962 ) ) ( not ( = ?auto_68959 ?auto_68963 ) ) ( not ( = ?auto_68959 ?auto_68964 ) ) ( not ( = ?auto_68959 ?auto_68965 ) ) ( not ( = ?auto_68960 ?auto_68961 ) ) ( not ( = ?auto_68960 ?auto_68962 ) ) ( not ( = ?auto_68960 ?auto_68963 ) ) ( not ( = ?auto_68960 ?auto_68964 ) ) ( not ( = ?auto_68960 ?auto_68965 ) ) ( not ( = ?auto_68961 ?auto_68962 ) ) ( not ( = ?auto_68961 ?auto_68963 ) ) ( not ( = ?auto_68961 ?auto_68964 ) ) ( not ( = ?auto_68961 ?auto_68965 ) ) ( not ( = ?auto_68962 ?auto_68963 ) ) ( not ( = ?auto_68962 ?auto_68964 ) ) ( not ( = ?auto_68962 ?auto_68965 ) ) ( not ( = ?auto_68963 ?auto_68964 ) ) ( not ( = ?auto_68963 ?auto_68965 ) ) ( not ( = ?auto_68964 ?auto_68965 ) ) ( ON ?auto_68963 ?auto_68964 ) ( ON ?auto_68962 ?auto_68963 ) ( ON ?auto_68961 ?auto_68962 ) ( ON ?auto_68960 ?auto_68961 ) ( ON ?auto_68959 ?auto_68960 ) ( CLEAR ?auto_68959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68959 )
      ( MAKE-6PILE ?auto_68959 ?auto_68960 ?auto_68961 ?auto_68962 ?auto_68963 ?auto_68964 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68973 - BLOCK
      ?auto_68974 - BLOCK
      ?auto_68975 - BLOCK
      ?auto_68976 - BLOCK
      ?auto_68977 - BLOCK
      ?auto_68978 - BLOCK
      ?auto_68979 - BLOCK
    )
    :vars
    (
      ?auto_68980 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_68978 ) ( ON ?auto_68979 ?auto_68980 ) ( CLEAR ?auto_68979 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68973 ) ( ON ?auto_68974 ?auto_68973 ) ( ON ?auto_68975 ?auto_68974 ) ( ON ?auto_68976 ?auto_68975 ) ( ON ?auto_68977 ?auto_68976 ) ( ON ?auto_68978 ?auto_68977 ) ( not ( = ?auto_68973 ?auto_68974 ) ) ( not ( = ?auto_68973 ?auto_68975 ) ) ( not ( = ?auto_68973 ?auto_68976 ) ) ( not ( = ?auto_68973 ?auto_68977 ) ) ( not ( = ?auto_68973 ?auto_68978 ) ) ( not ( = ?auto_68973 ?auto_68979 ) ) ( not ( = ?auto_68973 ?auto_68980 ) ) ( not ( = ?auto_68974 ?auto_68975 ) ) ( not ( = ?auto_68974 ?auto_68976 ) ) ( not ( = ?auto_68974 ?auto_68977 ) ) ( not ( = ?auto_68974 ?auto_68978 ) ) ( not ( = ?auto_68974 ?auto_68979 ) ) ( not ( = ?auto_68974 ?auto_68980 ) ) ( not ( = ?auto_68975 ?auto_68976 ) ) ( not ( = ?auto_68975 ?auto_68977 ) ) ( not ( = ?auto_68975 ?auto_68978 ) ) ( not ( = ?auto_68975 ?auto_68979 ) ) ( not ( = ?auto_68975 ?auto_68980 ) ) ( not ( = ?auto_68976 ?auto_68977 ) ) ( not ( = ?auto_68976 ?auto_68978 ) ) ( not ( = ?auto_68976 ?auto_68979 ) ) ( not ( = ?auto_68976 ?auto_68980 ) ) ( not ( = ?auto_68977 ?auto_68978 ) ) ( not ( = ?auto_68977 ?auto_68979 ) ) ( not ( = ?auto_68977 ?auto_68980 ) ) ( not ( = ?auto_68978 ?auto_68979 ) ) ( not ( = ?auto_68978 ?auto_68980 ) ) ( not ( = ?auto_68979 ?auto_68980 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68979 ?auto_68980 )
      ( !STACK ?auto_68979 ?auto_68978 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68988 - BLOCK
      ?auto_68989 - BLOCK
      ?auto_68990 - BLOCK
      ?auto_68991 - BLOCK
      ?auto_68992 - BLOCK
      ?auto_68993 - BLOCK
      ?auto_68994 - BLOCK
    )
    :vars
    (
      ?auto_68995 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_68993 ) ( ON ?auto_68994 ?auto_68995 ) ( CLEAR ?auto_68994 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68988 ) ( ON ?auto_68989 ?auto_68988 ) ( ON ?auto_68990 ?auto_68989 ) ( ON ?auto_68991 ?auto_68990 ) ( ON ?auto_68992 ?auto_68991 ) ( ON ?auto_68993 ?auto_68992 ) ( not ( = ?auto_68988 ?auto_68989 ) ) ( not ( = ?auto_68988 ?auto_68990 ) ) ( not ( = ?auto_68988 ?auto_68991 ) ) ( not ( = ?auto_68988 ?auto_68992 ) ) ( not ( = ?auto_68988 ?auto_68993 ) ) ( not ( = ?auto_68988 ?auto_68994 ) ) ( not ( = ?auto_68988 ?auto_68995 ) ) ( not ( = ?auto_68989 ?auto_68990 ) ) ( not ( = ?auto_68989 ?auto_68991 ) ) ( not ( = ?auto_68989 ?auto_68992 ) ) ( not ( = ?auto_68989 ?auto_68993 ) ) ( not ( = ?auto_68989 ?auto_68994 ) ) ( not ( = ?auto_68989 ?auto_68995 ) ) ( not ( = ?auto_68990 ?auto_68991 ) ) ( not ( = ?auto_68990 ?auto_68992 ) ) ( not ( = ?auto_68990 ?auto_68993 ) ) ( not ( = ?auto_68990 ?auto_68994 ) ) ( not ( = ?auto_68990 ?auto_68995 ) ) ( not ( = ?auto_68991 ?auto_68992 ) ) ( not ( = ?auto_68991 ?auto_68993 ) ) ( not ( = ?auto_68991 ?auto_68994 ) ) ( not ( = ?auto_68991 ?auto_68995 ) ) ( not ( = ?auto_68992 ?auto_68993 ) ) ( not ( = ?auto_68992 ?auto_68994 ) ) ( not ( = ?auto_68992 ?auto_68995 ) ) ( not ( = ?auto_68993 ?auto_68994 ) ) ( not ( = ?auto_68993 ?auto_68995 ) ) ( not ( = ?auto_68994 ?auto_68995 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68994 ?auto_68995 )
      ( !STACK ?auto_68994 ?auto_68993 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69003 - BLOCK
      ?auto_69004 - BLOCK
      ?auto_69005 - BLOCK
      ?auto_69006 - BLOCK
      ?auto_69007 - BLOCK
      ?auto_69008 - BLOCK
      ?auto_69009 - BLOCK
    )
    :vars
    (
      ?auto_69010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69009 ?auto_69010 ) ( ON-TABLE ?auto_69003 ) ( ON ?auto_69004 ?auto_69003 ) ( ON ?auto_69005 ?auto_69004 ) ( ON ?auto_69006 ?auto_69005 ) ( ON ?auto_69007 ?auto_69006 ) ( not ( = ?auto_69003 ?auto_69004 ) ) ( not ( = ?auto_69003 ?auto_69005 ) ) ( not ( = ?auto_69003 ?auto_69006 ) ) ( not ( = ?auto_69003 ?auto_69007 ) ) ( not ( = ?auto_69003 ?auto_69008 ) ) ( not ( = ?auto_69003 ?auto_69009 ) ) ( not ( = ?auto_69003 ?auto_69010 ) ) ( not ( = ?auto_69004 ?auto_69005 ) ) ( not ( = ?auto_69004 ?auto_69006 ) ) ( not ( = ?auto_69004 ?auto_69007 ) ) ( not ( = ?auto_69004 ?auto_69008 ) ) ( not ( = ?auto_69004 ?auto_69009 ) ) ( not ( = ?auto_69004 ?auto_69010 ) ) ( not ( = ?auto_69005 ?auto_69006 ) ) ( not ( = ?auto_69005 ?auto_69007 ) ) ( not ( = ?auto_69005 ?auto_69008 ) ) ( not ( = ?auto_69005 ?auto_69009 ) ) ( not ( = ?auto_69005 ?auto_69010 ) ) ( not ( = ?auto_69006 ?auto_69007 ) ) ( not ( = ?auto_69006 ?auto_69008 ) ) ( not ( = ?auto_69006 ?auto_69009 ) ) ( not ( = ?auto_69006 ?auto_69010 ) ) ( not ( = ?auto_69007 ?auto_69008 ) ) ( not ( = ?auto_69007 ?auto_69009 ) ) ( not ( = ?auto_69007 ?auto_69010 ) ) ( not ( = ?auto_69008 ?auto_69009 ) ) ( not ( = ?auto_69008 ?auto_69010 ) ) ( not ( = ?auto_69009 ?auto_69010 ) ) ( CLEAR ?auto_69007 ) ( ON ?auto_69008 ?auto_69009 ) ( CLEAR ?auto_69008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69003 ?auto_69004 ?auto_69005 ?auto_69006 ?auto_69007 ?auto_69008 )
      ( MAKE-7PILE ?auto_69003 ?auto_69004 ?auto_69005 ?auto_69006 ?auto_69007 ?auto_69008 ?auto_69009 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69018 - BLOCK
      ?auto_69019 - BLOCK
      ?auto_69020 - BLOCK
      ?auto_69021 - BLOCK
      ?auto_69022 - BLOCK
      ?auto_69023 - BLOCK
      ?auto_69024 - BLOCK
    )
    :vars
    (
      ?auto_69025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69024 ?auto_69025 ) ( ON-TABLE ?auto_69018 ) ( ON ?auto_69019 ?auto_69018 ) ( ON ?auto_69020 ?auto_69019 ) ( ON ?auto_69021 ?auto_69020 ) ( ON ?auto_69022 ?auto_69021 ) ( not ( = ?auto_69018 ?auto_69019 ) ) ( not ( = ?auto_69018 ?auto_69020 ) ) ( not ( = ?auto_69018 ?auto_69021 ) ) ( not ( = ?auto_69018 ?auto_69022 ) ) ( not ( = ?auto_69018 ?auto_69023 ) ) ( not ( = ?auto_69018 ?auto_69024 ) ) ( not ( = ?auto_69018 ?auto_69025 ) ) ( not ( = ?auto_69019 ?auto_69020 ) ) ( not ( = ?auto_69019 ?auto_69021 ) ) ( not ( = ?auto_69019 ?auto_69022 ) ) ( not ( = ?auto_69019 ?auto_69023 ) ) ( not ( = ?auto_69019 ?auto_69024 ) ) ( not ( = ?auto_69019 ?auto_69025 ) ) ( not ( = ?auto_69020 ?auto_69021 ) ) ( not ( = ?auto_69020 ?auto_69022 ) ) ( not ( = ?auto_69020 ?auto_69023 ) ) ( not ( = ?auto_69020 ?auto_69024 ) ) ( not ( = ?auto_69020 ?auto_69025 ) ) ( not ( = ?auto_69021 ?auto_69022 ) ) ( not ( = ?auto_69021 ?auto_69023 ) ) ( not ( = ?auto_69021 ?auto_69024 ) ) ( not ( = ?auto_69021 ?auto_69025 ) ) ( not ( = ?auto_69022 ?auto_69023 ) ) ( not ( = ?auto_69022 ?auto_69024 ) ) ( not ( = ?auto_69022 ?auto_69025 ) ) ( not ( = ?auto_69023 ?auto_69024 ) ) ( not ( = ?auto_69023 ?auto_69025 ) ) ( not ( = ?auto_69024 ?auto_69025 ) ) ( CLEAR ?auto_69022 ) ( ON ?auto_69023 ?auto_69024 ) ( CLEAR ?auto_69023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69018 ?auto_69019 ?auto_69020 ?auto_69021 ?auto_69022 ?auto_69023 )
      ( MAKE-7PILE ?auto_69018 ?auto_69019 ?auto_69020 ?auto_69021 ?auto_69022 ?auto_69023 ?auto_69024 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69033 - BLOCK
      ?auto_69034 - BLOCK
      ?auto_69035 - BLOCK
      ?auto_69036 - BLOCK
      ?auto_69037 - BLOCK
      ?auto_69038 - BLOCK
      ?auto_69039 - BLOCK
    )
    :vars
    (
      ?auto_69040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69039 ?auto_69040 ) ( ON-TABLE ?auto_69033 ) ( ON ?auto_69034 ?auto_69033 ) ( ON ?auto_69035 ?auto_69034 ) ( ON ?auto_69036 ?auto_69035 ) ( not ( = ?auto_69033 ?auto_69034 ) ) ( not ( = ?auto_69033 ?auto_69035 ) ) ( not ( = ?auto_69033 ?auto_69036 ) ) ( not ( = ?auto_69033 ?auto_69037 ) ) ( not ( = ?auto_69033 ?auto_69038 ) ) ( not ( = ?auto_69033 ?auto_69039 ) ) ( not ( = ?auto_69033 ?auto_69040 ) ) ( not ( = ?auto_69034 ?auto_69035 ) ) ( not ( = ?auto_69034 ?auto_69036 ) ) ( not ( = ?auto_69034 ?auto_69037 ) ) ( not ( = ?auto_69034 ?auto_69038 ) ) ( not ( = ?auto_69034 ?auto_69039 ) ) ( not ( = ?auto_69034 ?auto_69040 ) ) ( not ( = ?auto_69035 ?auto_69036 ) ) ( not ( = ?auto_69035 ?auto_69037 ) ) ( not ( = ?auto_69035 ?auto_69038 ) ) ( not ( = ?auto_69035 ?auto_69039 ) ) ( not ( = ?auto_69035 ?auto_69040 ) ) ( not ( = ?auto_69036 ?auto_69037 ) ) ( not ( = ?auto_69036 ?auto_69038 ) ) ( not ( = ?auto_69036 ?auto_69039 ) ) ( not ( = ?auto_69036 ?auto_69040 ) ) ( not ( = ?auto_69037 ?auto_69038 ) ) ( not ( = ?auto_69037 ?auto_69039 ) ) ( not ( = ?auto_69037 ?auto_69040 ) ) ( not ( = ?auto_69038 ?auto_69039 ) ) ( not ( = ?auto_69038 ?auto_69040 ) ) ( not ( = ?auto_69039 ?auto_69040 ) ) ( ON ?auto_69038 ?auto_69039 ) ( CLEAR ?auto_69036 ) ( ON ?auto_69037 ?auto_69038 ) ( CLEAR ?auto_69037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69033 ?auto_69034 ?auto_69035 ?auto_69036 ?auto_69037 )
      ( MAKE-7PILE ?auto_69033 ?auto_69034 ?auto_69035 ?auto_69036 ?auto_69037 ?auto_69038 ?auto_69039 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69048 - BLOCK
      ?auto_69049 - BLOCK
      ?auto_69050 - BLOCK
      ?auto_69051 - BLOCK
      ?auto_69052 - BLOCK
      ?auto_69053 - BLOCK
      ?auto_69054 - BLOCK
    )
    :vars
    (
      ?auto_69055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69054 ?auto_69055 ) ( ON-TABLE ?auto_69048 ) ( ON ?auto_69049 ?auto_69048 ) ( ON ?auto_69050 ?auto_69049 ) ( ON ?auto_69051 ?auto_69050 ) ( not ( = ?auto_69048 ?auto_69049 ) ) ( not ( = ?auto_69048 ?auto_69050 ) ) ( not ( = ?auto_69048 ?auto_69051 ) ) ( not ( = ?auto_69048 ?auto_69052 ) ) ( not ( = ?auto_69048 ?auto_69053 ) ) ( not ( = ?auto_69048 ?auto_69054 ) ) ( not ( = ?auto_69048 ?auto_69055 ) ) ( not ( = ?auto_69049 ?auto_69050 ) ) ( not ( = ?auto_69049 ?auto_69051 ) ) ( not ( = ?auto_69049 ?auto_69052 ) ) ( not ( = ?auto_69049 ?auto_69053 ) ) ( not ( = ?auto_69049 ?auto_69054 ) ) ( not ( = ?auto_69049 ?auto_69055 ) ) ( not ( = ?auto_69050 ?auto_69051 ) ) ( not ( = ?auto_69050 ?auto_69052 ) ) ( not ( = ?auto_69050 ?auto_69053 ) ) ( not ( = ?auto_69050 ?auto_69054 ) ) ( not ( = ?auto_69050 ?auto_69055 ) ) ( not ( = ?auto_69051 ?auto_69052 ) ) ( not ( = ?auto_69051 ?auto_69053 ) ) ( not ( = ?auto_69051 ?auto_69054 ) ) ( not ( = ?auto_69051 ?auto_69055 ) ) ( not ( = ?auto_69052 ?auto_69053 ) ) ( not ( = ?auto_69052 ?auto_69054 ) ) ( not ( = ?auto_69052 ?auto_69055 ) ) ( not ( = ?auto_69053 ?auto_69054 ) ) ( not ( = ?auto_69053 ?auto_69055 ) ) ( not ( = ?auto_69054 ?auto_69055 ) ) ( ON ?auto_69053 ?auto_69054 ) ( CLEAR ?auto_69051 ) ( ON ?auto_69052 ?auto_69053 ) ( CLEAR ?auto_69052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69048 ?auto_69049 ?auto_69050 ?auto_69051 ?auto_69052 )
      ( MAKE-7PILE ?auto_69048 ?auto_69049 ?auto_69050 ?auto_69051 ?auto_69052 ?auto_69053 ?auto_69054 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69063 - BLOCK
      ?auto_69064 - BLOCK
      ?auto_69065 - BLOCK
      ?auto_69066 - BLOCK
      ?auto_69067 - BLOCK
      ?auto_69068 - BLOCK
      ?auto_69069 - BLOCK
    )
    :vars
    (
      ?auto_69070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69069 ?auto_69070 ) ( ON-TABLE ?auto_69063 ) ( ON ?auto_69064 ?auto_69063 ) ( ON ?auto_69065 ?auto_69064 ) ( not ( = ?auto_69063 ?auto_69064 ) ) ( not ( = ?auto_69063 ?auto_69065 ) ) ( not ( = ?auto_69063 ?auto_69066 ) ) ( not ( = ?auto_69063 ?auto_69067 ) ) ( not ( = ?auto_69063 ?auto_69068 ) ) ( not ( = ?auto_69063 ?auto_69069 ) ) ( not ( = ?auto_69063 ?auto_69070 ) ) ( not ( = ?auto_69064 ?auto_69065 ) ) ( not ( = ?auto_69064 ?auto_69066 ) ) ( not ( = ?auto_69064 ?auto_69067 ) ) ( not ( = ?auto_69064 ?auto_69068 ) ) ( not ( = ?auto_69064 ?auto_69069 ) ) ( not ( = ?auto_69064 ?auto_69070 ) ) ( not ( = ?auto_69065 ?auto_69066 ) ) ( not ( = ?auto_69065 ?auto_69067 ) ) ( not ( = ?auto_69065 ?auto_69068 ) ) ( not ( = ?auto_69065 ?auto_69069 ) ) ( not ( = ?auto_69065 ?auto_69070 ) ) ( not ( = ?auto_69066 ?auto_69067 ) ) ( not ( = ?auto_69066 ?auto_69068 ) ) ( not ( = ?auto_69066 ?auto_69069 ) ) ( not ( = ?auto_69066 ?auto_69070 ) ) ( not ( = ?auto_69067 ?auto_69068 ) ) ( not ( = ?auto_69067 ?auto_69069 ) ) ( not ( = ?auto_69067 ?auto_69070 ) ) ( not ( = ?auto_69068 ?auto_69069 ) ) ( not ( = ?auto_69068 ?auto_69070 ) ) ( not ( = ?auto_69069 ?auto_69070 ) ) ( ON ?auto_69068 ?auto_69069 ) ( ON ?auto_69067 ?auto_69068 ) ( CLEAR ?auto_69065 ) ( ON ?auto_69066 ?auto_69067 ) ( CLEAR ?auto_69066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69063 ?auto_69064 ?auto_69065 ?auto_69066 )
      ( MAKE-7PILE ?auto_69063 ?auto_69064 ?auto_69065 ?auto_69066 ?auto_69067 ?auto_69068 ?auto_69069 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69078 - BLOCK
      ?auto_69079 - BLOCK
      ?auto_69080 - BLOCK
      ?auto_69081 - BLOCK
      ?auto_69082 - BLOCK
      ?auto_69083 - BLOCK
      ?auto_69084 - BLOCK
    )
    :vars
    (
      ?auto_69085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69084 ?auto_69085 ) ( ON-TABLE ?auto_69078 ) ( ON ?auto_69079 ?auto_69078 ) ( ON ?auto_69080 ?auto_69079 ) ( not ( = ?auto_69078 ?auto_69079 ) ) ( not ( = ?auto_69078 ?auto_69080 ) ) ( not ( = ?auto_69078 ?auto_69081 ) ) ( not ( = ?auto_69078 ?auto_69082 ) ) ( not ( = ?auto_69078 ?auto_69083 ) ) ( not ( = ?auto_69078 ?auto_69084 ) ) ( not ( = ?auto_69078 ?auto_69085 ) ) ( not ( = ?auto_69079 ?auto_69080 ) ) ( not ( = ?auto_69079 ?auto_69081 ) ) ( not ( = ?auto_69079 ?auto_69082 ) ) ( not ( = ?auto_69079 ?auto_69083 ) ) ( not ( = ?auto_69079 ?auto_69084 ) ) ( not ( = ?auto_69079 ?auto_69085 ) ) ( not ( = ?auto_69080 ?auto_69081 ) ) ( not ( = ?auto_69080 ?auto_69082 ) ) ( not ( = ?auto_69080 ?auto_69083 ) ) ( not ( = ?auto_69080 ?auto_69084 ) ) ( not ( = ?auto_69080 ?auto_69085 ) ) ( not ( = ?auto_69081 ?auto_69082 ) ) ( not ( = ?auto_69081 ?auto_69083 ) ) ( not ( = ?auto_69081 ?auto_69084 ) ) ( not ( = ?auto_69081 ?auto_69085 ) ) ( not ( = ?auto_69082 ?auto_69083 ) ) ( not ( = ?auto_69082 ?auto_69084 ) ) ( not ( = ?auto_69082 ?auto_69085 ) ) ( not ( = ?auto_69083 ?auto_69084 ) ) ( not ( = ?auto_69083 ?auto_69085 ) ) ( not ( = ?auto_69084 ?auto_69085 ) ) ( ON ?auto_69083 ?auto_69084 ) ( ON ?auto_69082 ?auto_69083 ) ( CLEAR ?auto_69080 ) ( ON ?auto_69081 ?auto_69082 ) ( CLEAR ?auto_69081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69078 ?auto_69079 ?auto_69080 ?auto_69081 )
      ( MAKE-7PILE ?auto_69078 ?auto_69079 ?auto_69080 ?auto_69081 ?auto_69082 ?auto_69083 ?auto_69084 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69093 - BLOCK
      ?auto_69094 - BLOCK
      ?auto_69095 - BLOCK
      ?auto_69096 - BLOCK
      ?auto_69097 - BLOCK
      ?auto_69098 - BLOCK
      ?auto_69099 - BLOCK
    )
    :vars
    (
      ?auto_69100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69099 ?auto_69100 ) ( ON-TABLE ?auto_69093 ) ( ON ?auto_69094 ?auto_69093 ) ( not ( = ?auto_69093 ?auto_69094 ) ) ( not ( = ?auto_69093 ?auto_69095 ) ) ( not ( = ?auto_69093 ?auto_69096 ) ) ( not ( = ?auto_69093 ?auto_69097 ) ) ( not ( = ?auto_69093 ?auto_69098 ) ) ( not ( = ?auto_69093 ?auto_69099 ) ) ( not ( = ?auto_69093 ?auto_69100 ) ) ( not ( = ?auto_69094 ?auto_69095 ) ) ( not ( = ?auto_69094 ?auto_69096 ) ) ( not ( = ?auto_69094 ?auto_69097 ) ) ( not ( = ?auto_69094 ?auto_69098 ) ) ( not ( = ?auto_69094 ?auto_69099 ) ) ( not ( = ?auto_69094 ?auto_69100 ) ) ( not ( = ?auto_69095 ?auto_69096 ) ) ( not ( = ?auto_69095 ?auto_69097 ) ) ( not ( = ?auto_69095 ?auto_69098 ) ) ( not ( = ?auto_69095 ?auto_69099 ) ) ( not ( = ?auto_69095 ?auto_69100 ) ) ( not ( = ?auto_69096 ?auto_69097 ) ) ( not ( = ?auto_69096 ?auto_69098 ) ) ( not ( = ?auto_69096 ?auto_69099 ) ) ( not ( = ?auto_69096 ?auto_69100 ) ) ( not ( = ?auto_69097 ?auto_69098 ) ) ( not ( = ?auto_69097 ?auto_69099 ) ) ( not ( = ?auto_69097 ?auto_69100 ) ) ( not ( = ?auto_69098 ?auto_69099 ) ) ( not ( = ?auto_69098 ?auto_69100 ) ) ( not ( = ?auto_69099 ?auto_69100 ) ) ( ON ?auto_69098 ?auto_69099 ) ( ON ?auto_69097 ?auto_69098 ) ( ON ?auto_69096 ?auto_69097 ) ( CLEAR ?auto_69094 ) ( ON ?auto_69095 ?auto_69096 ) ( CLEAR ?auto_69095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69093 ?auto_69094 ?auto_69095 )
      ( MAKE-7PILE ?auto_69093 ?auto_69094 ?auto_69095 ?auto_69096 ?auto_69097 ?auto_69098 ?auto_69099 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69108 - BLOCK
      ?auto_69109 - BLOCK
      ?auto_69110 - BLOCK
      ?auto_69111 - BLOCK
      ?auto_69112 - BLOCK
      ?auto_69113 - BLOCK
      ?auto_69114 - BLOCK
    )
    :vars
    (
      ?auto_69115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69114 ?auto_69115 ) ( ON-TABLE ?auto_69108 ) ( ON ?auto_69109 ?auto_69108 ) ( not ( = ?auto_69108 ?auto_69109 ) ) ( not ( = ?auto_69108 ?auto_69110 ) ) ( not ( = ?auto_69108 ?auto_69111 ) ) ( not ( = ?auto_69108 ?auto_69112 ) ) ( not ( = ?auto_69108 ?auto_69113 ) ) ( not ( = ?auto_69108 ?auto_69114 ) ) ( not ( = ?auto_69108 ?auto_69115 ) ) ( not ( = ?auto_69109 ?auto_69110 ) ) ( not ( = ?auto_69109 ?auto_69111 ) ) ( not ( = ?auto_69109 ?auto_69112 ) ) ( not ( = ?auto_69109 ?auto_69113 ) ) ( not ( = ?auto_69109 ?auto_69114 ) ) ( not ( = ?auto_69109 ?auto_69115 ) ) ( not ( = ?auto_69110 ?auto_69111 ) ) ( not ( = ?auto_69110 ?auto_69112 ) ) ( not ( = ?auto_69110 ?auto_69113 ) ) ( not ( = ?auto_69110 ?auto_69114 ) ) ( not ( = ?auto_69110 ?auto_69115 ) ) ( not ( = ?auto_69111 ?auto_69112 ) ) ( not ( = ?auto_69111 ?auto_69113 ) ) ( not ( = ?auto_69111 ?auto_69114 ) ) ( not ( = ?auto_69111 ?auto_69115 ) ) ( not ( = ?auto_69112 ?auto_69113 ) ) ( not ( = ?auto_69112 ?auto_69114 ) ) ( not ( = ?auto_69112 ?auto_69115 ) ) ( not ( = ?auto_69113 ?auto_69114 ) ) ( not ( = ?auto_69113 ?auto_69115 ) ) ( not ( = ?auto_69114 ?auto_69115 ) ) ( ON ?auto_69113 ?auto_69114 ) ( ON ?auto_69112 ?auto_69113 ) ( ON ?auto_69111 ?auto_69112 ) ( CLEAR ?auto_69109 ) ( ON ?auto_69110 ?auto_69111 ) ( CLEAR ?auto_69110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69108 ?auto_69109 ?auto_69110 )
      ( MAKE-7PILE ?auto_69108 ?auto_69109 ?auto_69110 ?auto_69111 ?auto_69112 ?auto_69113 ?auto_69114 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69123 - BLOCK
      ?auto_69124 - BLOCK
      ?auto_69125 - BLOCK
      ?auto_69126 - BLOCK
      ?auto_69127 - BLOCK
      ?auto_69128 - BLOCK
      ?auto_69129 - BLOCK
    )
    :vars
    (
      ?auto_69130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69129 ?auto_69130 ) ( ON-TABLE ?auto_69123 ) ( not ( = ?auto_69123 ?auto_69124 ) ) ( not ( = ?auto_69123 ?auto_69125 ) ) ( not ( = ?auto_69123 ?auto_69126 ) ) ( not ( = ?auto_69123 ?auto_69127 ) ) ( not ( = ?auto_69123 ?auto_69128 ) ) ( not ( = ?auto_69123 ?auto_69129 ) ) ( not ( = ?auto_69123 ?auto_69130 ) ) ( not ( = ?auto_69124 ?auto_69125 ) ) ( not ( = ?auto_69124 ?auto_69126 ) ) ( not ( = ?auto_69124 ?auto_69127 ) ) ( not ( = ?auto_69124 ?auto_69128 ) ) ( not ( = ?auto_69124 ?auto_69129 ) ) ( not ( = ?auto_69124 ?auto_69130 ) ) ( not ( = ?auto_69125 ?auto_69126 ) ) ( not ( = ?auto_69125 ?auto_69127 ) ) ( not ( = ?auto_69125 ?auto_69128 ) ) ( not ( = ?auto_69125 ?auto_69129 ) ) ( not ( = ?auto_69125 ?auto_69130 ) ) ( not ( = ?auto_69126 ?auto_69127 ) ) ( not ( = ?auto_69126 ?auto_69128 ) ) ( not ( = ?auto_69126 ?auto_69129 ) ) ( not ( = ?auto_69126 ?auto_69130 ) ) ( not ( = ?auto_69127 ?auto_69128 ) ) ( not ( = ?auto_69127 ?auto_69129 ) ) ( not ( = ?auto_69127 ?auto_69130 ) ) ( not ( = ?auto_69128 ?auto_69129 ) ) ( not ( = ?auto_69128 ?auto_69130 ) ) ( not ( = ?auto_69129 ?auto_69130 ) ) ( ON ?auto_69128 ?auto_69129 ) ( ON ?auto_69127 ?auto_69128 ) ( ON ?auto_69126 ?auto_69127 ) ( ON ?auto_69125 ?auto_69126 ) ( CLEAR ?auto_69123 ) ( ON ?auto_69124 ?auto_69125 ) ( CLEAR ?auto_69124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69123 ?auto_69124 )
      ( MAKE-7PILE ?auto_69123 ?auto_69124 ?auto_69125 ?auto_69126 ?auto_69127 ?auto_69128 ?auto_69129 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69138 - BLOCK
      ?auto_69139 - BLOCK
      ?auto_69140 - BLOCK
      ?auto_69141 - BLOCK
      ?auto_69142 - BLOCK
      ?auto_69143 - BLOCK
      ?auto_69144 - BLOCK
    )
    :vars
    (
      ?auto_69145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69144 ?auto_69145 ) ( ON-TABLE ?auto_69138 ) ( not ( = ?auto_69138 ?auto_69139 ) ) ( not ( = ?auto_69138 ?auto_69140 ) ) ( not ( = ?auto_69138 ?auto_69141 ) ) ( not ( = ?auto_69138 ?auto_69142 ) ) ( not ( = ?auto_69138 ?auto_69143 ) ) ( not ( = ?auto_69138 ?auto_69144 ) ) ( not ( = ?auto_69138 ?auto_69145 ) ) ( not ( = ?auto_69139 ?auto_69140 ) ) ( not ( = ?auto_69139 ?auto_69141 ) ) ( not ( = ?auto_69139 ?auto_69142 ) ) ( not ( = ?auto_69139 ?auto_69143 ) ) ( not ( = ?auto_69139 ?auto_69144 ) ) ( not ( = ?auto_69139 ?auto_69145 ) ) ( not ( = ?auto_69140 ?auto_69141 ) ) ( not ( = ?auto_69140 ?auto_69142 ) ) ( not ( = ?auto_69140 ?auto_69143 ) ) ( not ( = ?auto_69140 ?auto_69144 ) ) ( not ( = ?auto_69140 ?auto_69145 ) ) ( not ( = ?auto_69141 ?auto_69142 ) ) ( not ( = ?auto_69141 ?auto_69143 ) ) ( not ( = ?auto_69141 ?auto_69144 ) ) ( not ( = ?auto_69141 ?auto_69145 ) ) ( not ( = ?auto_69142 ?auto_69143 ) ) ( not ( = ?auto_69142 ?auto_69144 ) ) ( not ( = ?auto_69142 ?auto_69145 ) ) ( not ( = ?auto_69143 ?auto_69144 ) ) ( not ( = ?auto_69143 ?auto_69145 ) ) ( not ( = ?auto_69144 ?auto_69145 ) ) ( ON ?auto_69143 ?auto_69144 ) ( ON ?auto_69142 ?auto_69143 ) ( ON ?auto_69141 ?auto_69142 ) ( ON ?auto_69140 ?auto_69141 ) ( CLEAR ?auto_69138 ) ( ON ?auto_69139 ?auto_69140 ) ( CLEAR ?auto_69139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69138 ?auto_69139 )
      ( MAKE-7PILE ?auto_69138 ?auto_69139 ?auto_69140 ?auto_69141 ?auto_69142 ?auto_69143 ?auto_69144 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69153 - BLOCK
      ?auto_69154 - BLOCK
      ?auto_69155 - BLOCK
      ?auto_69156 - BLOCK
      ?auto_69157 - BLOCK
      ?auto_69158 - BLOCK
      ?auto_69159 - BLOCK
    )
    :vars
    (
      ?auto_69160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69159 ?auto_69160 ) ( not ( = ?auto_69153 ?auto_69154 ) ) ( not ( = ?auto_69153 ?auto_69155 ) ) ( not ( = ?auto_69153 ?auto_69156 ) ) ( not ( = ?auto_69153 ?auto_69157 ) ) ( not ( = ?auto_69153 ?auto_69158 ) ) ( not ( = ?auto_69153 ?auto_69159 ) ) ( not ( = ?auto_69153 ?auto_69160 ) ) ( not ( = ?auto_69154 ?auto_69155 ) ) ( not ( = ?auto_69154 ?auto_69156 ) ) ( not ( = ?auto_69154 ?auto_69157 ) ) ( not ( = ?auto_69154 ?auto_69158 ) ) ( not ( = ?auto_69154 ?auto_69159 ) ) ( not ( = ?auto_69154 ?auto_69160 ) ) ( not ( = ?auto_69155 ?auto_69156 ) ) ( not ( = ?auto_69155 ?auto_69157 ) ) ( not ( = ?auto_69155 ?auto_69158 ) ) ( not ( = ?auto_69155 ?auto_69159 ) ) ( not ( = ?auto_69155 ?auto_69160 ) ) ( not ( = ?auto_69156 ?auto_69157 ) ) ( not ( = ?auto_69156 ?auto_69158 ) ) ( not ( = ?auto_69156 ?auto_69159 ) ) ( not ( = ?auto_69156 ?auto_69160 ) ) ( not ( = ?auto_69157 ?auto_69158 ) ) ( not ( = ?auto_69157 ?auto_69159 ) ) ( not ( = ?auto_69157 ?auto_69160 ) ) ( not ( = ?auto_69158 ?auto_69159 ) ) ( not ( = ?auto_69158 ?auto_69160 ) ) ( not ( = ?auto_69159 ?auto_69160 ) ) ( ON ?auto_69158 ?auto_69159 ) ( ON ?auto_69157 ?auto_69158 ) ( ON ?auto_69156 ?auto_69157 ) ( ON ?auto_69155 ?auto_69156 ) ( ON ?auto_69154 ?auto_69155 ) ( ON ?auto_69153 ?auto_69154 ) ( CLEAR ?auto_69153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69153 )
      ( MAKE-7PILE ?auto_69153 ?auto_69154 ?auto_69155 ?auto_69156 ?auto_69157 ?auto_69158 ?auto_69159 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69168 - BLOCK
      ?auto_69169 - BLOCK
      ?auto_69170 - BLOCK
      ?auto_69171 - BLOCK
      ?auto_69172 - BLOCK
      ?auto_69173 - BLOCK
      ?auto_69174 - BLOCK
    )
    :vars
    (
      ?auto_69175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69174 ?auto_69175 ) ( not ( = ?auto_69168 ?auto_69169 ) ) ( not ( = ?auto_69168 ?auto_69170 ) ) ( not ( = ?auto_69168 ?auto_69171 ) ) ( not ( = ?auto_69168 ?auto_69172 ) ) ( not ( = ?auto_69168 ?auto_69173 ) ) ( not ( = ?auto_69168 ?auto_69174 ) ) ( not ( = ?auto_69168 ?auto_69175 ) ) ( not ( = ?auto_69169 ?auto_69170 ) ) ( not ( = ?auto_69169 ?auto_69171 ) ) ( not ( = ?auto_69169 ?auto_69172 ) ) ( not ( = ?auto_69169 ?auto_69173 ) ) ( not ( = ?auto_69169 ?auto_69174 ) ) ( not ( = ?auto_69169 ?auto_69175 ) ) ( not ( = ?auto_69170 ?auto_69171 ) ) ( not ( = ?auto_69170 ?auto_69172 ) ) ( not ( = ?auto_69170 ?auto_69173 ) ) ( not ( = ?auto_69170 ?auto_69174 ) ) ( not ( = ?auto_69170 ?auto_69175 ) ) ( not ( = ?auto_69171 ?auto_69172 ) ) ( not ( = ?auto_69171 ?auto_69173 ) ) ( not ( = ?auto_69171 ?auto_69174 ) ) ( not ( = ?auto_69171 ?auto_69175 ) ) ( not ( = ?auto_69172 ?auto_69173 ) ) ( not ( = ?auto_69172 ?auto_69174 ) ) ( not ( = ?auto_69172 ?auto_69175 ) ) ( not ( = ?auto_69173 ?auto_69174 ) ) ( not ( = ?auto_69173 ?auto_69175 ) ) ( not ( = ?auto_69174 ?auto_69175 ) ) ( ON ?auto_69173 ?auto_69174 ) ( ON ?auto_69172 ?auto_69173 ) ( ON ?auto_69171 ?auto_69172 ) ( ON ?auto_69170 ?auto_69171 ) ( ON ?auto_69169 ?auto_69170 ) ( ON ?auto_69168 ?auto_69169 ) ( CLEAR ?auto_69168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69168 )
      ( MAKE-7PILE ?auto_69168 ?auto_69169 ?auto_69170 ?auto_69171 ?auto_69172 ?auto_69173 ?auto_69174 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_69184 - BLOCK
      ?auto_69185 - BLOCK
      ?auto_69186 - BLOCK
      ?auto_69187 - BLOCK
      ?auto_69188 - BLOCK
      ?auto_69189 - BLOCK
      ?auto_69190 - BLOCK
      ?auto_69191 - BLOCK
    )
    :vars
    (
      ?auto_69192 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_69190 ) ( ON ?auto_69191 ?auto_69192 ) ( CLEAR ?auto_69191 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69184 ) ( ON ?auto_69185 ?auto_69184 ) ( ON ?auto_69186 ?auto_69185 ) ( ON ?auto_69187 ?auto_69186 ) ( ON ?auto_69188 ?auto_69187 ) ( ON ?auto_69189 ?auto_69188 ) ( ON ?auto_69190 ?auto_69189 ) ( not ( = ?auto_69184 ?auto_69185 ) ) ( not ( = ?auto_69184 ?auto_69186 ) ) ( not ( = ?auto_69184 ?auto_69187 ) ) ( not ( = ?auto_69184 ?auto_69188 ) ) ( not ( = ?auto_69184 ?auto_69189 ) ) ( not ( = ?auto_69184 ?auto_69190 ) ) ( not ( = ?auto_69184 ?auto_69191 ) ) ( not ( = ?auto_69184 ?auto_69192 ) ) ( not ( = ?auto_69185 ?auto_69186 ) ) ( not ( = ?auto_69185 ?auto_69187 ) ) ( not ( = ?auto_69185 ?auto_69188 ) ) ( not ( = ?auto_69185 ?auto_69189 ) ) ( not ( = ?auto_69185 ?auto_69190 ) ) ( not ( = ?auto_69185 ?auto_69191 ) ) ( not ( = ?auto_69185 ?auto_69192 ) ) ( not ( = ?auto_69186 ?auto_69187 ) ) ( not ( = ?auto_69186 ?auto_69188 ) ) ( not ( = ?auto_69186 ?auto_69189 ) ) ( not ( = ?auto_69186 ?auto_69190 ) ) ( not ( = ?auto_69186 ?auto_69191 ) ) ( not ( = ?auto_69186 ?auto_69192 ) ) ( not ( = ?auto_69187 ?auto_69188 ) ) ( not ( = ?auto_69187 ?auto_69189 ) ) ( not ( = ?auto_69187 ?auto_69190 ) ) ( not ( = ?auto_69187 ?auto_69191 ) ) ( not ( = ?auto_69187 ?auto_69192 ) ) ( not ( = ?auto_69188 ?auto_69189 ) ) ( not ( = ?auto_69188 ?auto_69190 ) ) ( not ( = ?auto_69188 ?auto_69191 ) ) ( not ( = ?auto_69188 ?auto_69192 ) ) ( not ( = ?auto_69189 ?auto_69190 ) ) ( not ( = ?auto_69189 ?auto_69191 ) ) ( not ( = ?auto_69189 ?auto_69192 ) ) ( not ( = ?auto_69190 ?auto_69191 ) ) ( not ( = ?auto_69190 ?auto_69192 ) ) ( not ( = ?auto_69191 ?auto_69192 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69191 ?auto_69192 )
      ( !STACK ?auto_69191 ?auto_69190 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_69201 - BLOCK
      ?auto_69202 - BLOCK
      ?auto_69203 - BLOCK
      ?auto_69204 - BLOCK
      ?auto_69205 - BLOCK
      ?auto_69206 - BLOCK
      ?auto_69207 - BLOCK
      ?auto_69208 - BLOCK
    )
    :vars
    (
      ?auto_69209 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_69207 ) ( ON ?auto_69208 ?auto_69209 ) ( CLEAR ?auto_69208 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69201 ) ( ON ?auto_69202 ?auto_69201 ) ( ON ?auto_69203 ?auto_69202 ) ( ON ?auto_69204 ?auto_69203 ) ( ON ?auto_69205 ?auto_69204 ) ( ON ?auto_69206 ?auto_69205 ) ( ON ?auto_69207 ?auto_69206 ) ( not ( = ?auto_69201 ?auto_69202 ) ) ( not ( = ?auto_69201 ?auto_69203 ) ) ( not ( = ?auto_69201 ?auto_69204 ) ) ( not ( = ?auto_69201 ?auto_69205 ) ) ( not ( = ?auto_69201 ?auto_69206 ) ) ( not ( = ?auto_69201 ?auto_69207 ) ) ( not ( = ?auto_69201 ?auto_69208 ) ) ( not ( = ?auto_69201 ?auto_69209 ) ) ( not ( = ?auto_69202 ?auto_69203 ) ) ( not ( = ?auto_69202 ?auto_69204 ) ) ( not ( = ?auto_69202 ?auto_69205 ) ) ( not ( = ?auto_69202 ?auto_69206 ) ) ( not ( = ?auto_69202 ?auto_69207 ) ) ( not ( = ?auto_69202 ?auto_69208 ) ) ( not ( = ?auto_69202 ?auto_69209 ) ) ( not ( = ?auto_69203 ?auto_69204 ) ) ( not ( = ?auto_69203 ?auto_69205 ) ) ( not ( = ?auto_69203 ?auto_69206 ) ) ( not ( = ?auto_69203 ?auto_69207 ) ) ( not ( = ?auto_69203 ?auto_69208 ) ) ( not ( = ?auto_69203 ?auto_69209 ) ) ( not ( = ?auto_69204 ?auto_69205 ) ) ( not ( = ?auto_69204 ?auto_69206 ) ) ( not ( = ?auto_69204 ?auto_69207 ) ) ( not ( = ?auto_69204 ?auto_69208 ) ) ( not ( = ?auto_69204 ?auto_69209 ) ) ( not ( = ?auto_69205 ?auto_69206 ) ) ( not ( = ?auto_69205 ?auto_69207 ) ) ( not ( = ?auto_69205 ?auto_69208 ) ) ( not ( = ?auto_69205 ?auto_69209 ) ) ( not ( = ?auto_69206 ?auto_69207 ) ) ( not ( = ?auto_69206 ?auto_69208 ) ) ( not ( = ?auto_69206 ?auto_69209 ) ) ( not ( = ?auto_69207 ?auto_69208 ) ) ( not ( = ?auto_69207 ?auto_69209 ) ) ( not ( = ?auto_69208 ?auto_69209 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69208 ?auto_69209 )
      ( !STACK ?auto_69208 ?auto_69207 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_69218 - BLOCK
      ?auto_69219 - BLOCK
      ?auto_69220 - BLOCK
      ?auto_69221 - BLOCK
      ?auto_69222 - BLOCK
      ?auto_69223 - BLOCK
      ?auto_69224 - BLOCK
      ?auto_69225 - BLOCK
    )
    :vars
    (
      ?auto_69226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69225 ?auto_69226 ) ( ON-TABLE ?auto_69218 ) ( ON ?auto_69219 ?auto_69218 ) ( ON ?auto_69220 ?auto_69219 ) ( ON ?auto_69221 ?auto_69220 ) ( ON ?auto_69222 ?auto_69221 ) ( ON ?auto_69223 ?auto_69222 ) ( not ( = ?auto_69218 ?auto_69219 ) ) ( not ( = ?auto_69218 ?auto_69220 ) ) ( not ( = ?auto_69218 ?auto_69221 ) ) ( not ( = ?auto_69218 ?auto_69222 ) ) ( not ( = ?auto_69218 ?auto_69223 ) ) ( not ( = ?auto_69218 ?auto_69224 ) ) ( not ( = ?auto_69218 ?auto_69225 ) ) ( not ( = ?auto_69218 ?auto_69226 ) ) ( not ( = ?auto_69219 ?auto_69220 ) ) ( not ( = ?auto_69219 ?auto_69221 ) ) ( not ( = ?auto_69219 ?auto_69222 ) ) ( not ( = ?auto_69219 ?auto_69223 ) ) ( not ( = ?auto_69219 ?auto_69224 ) ) ( not ( = ?auto_69219 ?auto_69225 ) ) ( not ( = ?auto_69219 ?auto_69226 ) ) ( not ( = ?auto_69220 ?auto_69221 ) ) ( not ( = ?auto_69220 ?auto_69222 ) ) ( not ( = ?auto_69220 ?auto_69223 ) ) ( not ( = ?auto_69220 ?auto_69224 ) ) ( not ( = ?auto_69220 ?auto_69225 ) ) ( not ( = ?auto_69220 ?auto_69226 ) ) ( not ( = ?auto_69221 ?auto_69222 ) ) ( not ( = ?auto_69221 ?auto_69223 ) ) ( not ( = ?auto_69221 ?auto_69224 ) ) ( not ( = ?auto_69221 ?auto_69225 ) ) ( not ( = ?auto_69221 ?auto_69226 ) ) ( not ( = ?auto_69222 ?auto_69223 ) ) ( not ( = ?auto_69222 ?auto_69224 ) ) ( not ( = ?auto_69222 ?auto_69225 ) ) ( not ( = ?auto_69222 ?auto_69226 ) ) ( not ( = ?auto_69223 ?auto_69224 ) ) ( not ( = ?auto_69223 ?auto_69225 ) ) ( not ( = ?auto_69223 ?auto_69226 ) ) ( not ( = ?auto_69224 ?auto_69225 ) ) ( not ( = ?auto_69224 ?auto_69226 ) ) ( not ( = ?auto_69225 ?auto_69226 ) ) ( CLEAR ?auto_69223 ) ( ON ?auto_69224 ?auto_69225 ) ( CLEAR ?auto_69224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_69218 ?auto_69219 ?auto_69220 ?auto_69221 ?auto_69222 ?auto_69223 ?auto_69224 )
      ( MAKE-8PILE ?auto_69218 ?auto_69219 ?auto_69220 ?auto_69221 ?auto_69222 ?auto_69223 ?auto_69224 ?auto_69225 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_69235 - BLOCK
      ?auto_69236 - BLOCK
      ?auto_69237 - BLOCK
      ?auto_69238 - BLOCK
      ?auto_69239 - BLOCK
      ?auto_69240 - BLOCK
      ?auto_69241 - BLOCK
      ?auto_69242 - BLOCK
    )
    :vars
    (
      ?auto_69243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69242 ?auto_69243 ) ( ON-TABLE ?auto_69235 ) ( ON ?auto_69236 ?auto_69235 ) ( ON ?auto_69237 ?auto_69236 ) ( ON ?auto_69238 ?auto_69237 ) ( ON ?auto_69239 ?auto_69238 ) ( ON ?auto_69240 ?auto_69239 ) ( not ( = ?auto_69235 ?auto_69236 ) ) ( not ( = ?auto_69235 ?auto_69237 ) ) ( not ( = ?auto_69235 ?auto_69238 ) ) ( not ( = ?auto_69235 ?auto_69239 ) ) ( not ( = ?auto_69235 ?auto_69240 ) ) ( not ( = ?auto_69235 ?auto_69241 ) ) ( not ( = ?auto_69235 ?auto_69242 ) ) ( not ( = ?auto_69235 ?auto_69243 ) ) ( not ( = ?auto_69236 ?auto_69237 ) ) ( not ( = ?auto_69236 ?auto_69238 ) ) ( not ( = ?auto_69236 ?auto_69239 ) ) ( not ( = ?auto_69236 ?auto_69240 ) ) ( not ( = ?auto_69236 ?auto_69241 ) ) ( not ( = ?auto_69236 ?auto_69242 ) ) ( not ( = ?auto_69236 ?auto_69243 ) ) ( not ( = ?auto_69237 ?auto_69238 ) ) ( not ( = ?auto_69237 ?auto_69239 ) ) ( not ( = ?auto_69237 ?auto_69240 ) ) ( not ( = ?auto_69237 ?auto_69241 ) ) ( not ( = ?auto_69237 ?auto_69242 ) ) ( not ( = ?auto_69237 ?auto_69243 ) ) ( not ( = ?auto_69238 ?auto_69239 ) ) ( not ( = ?auto_69238 ?auto_69240 ) ) ( not ( = ?auto_69238 ?auto_69241 ) ) ( not ( = ?auto_69238 ?auto_69242 ) ) ( not ( = ?auto_69238 ?auto_69243 ) ) ( not ( = ?auto_69239 ?auto_69240 ) ) ( not ( = ?auto_69239 ?auto_69241 ) ) ( not ( = ?auto_69239 ?auto_69242 ) ) ( not ( = ?auto_69239 ?auto_69243 ) ) ( not ( = ?auto_69240 ?auto_69241 ) ) ( not ( = ?auto_69240 ?auto_69242 ) ) ( not ( = ?auto_69240 ?auto_69243 ) ) ( not ( = ?auto_69241 ?auto_69242 ) ) ( not ( = ?auto_69241 ?auto_69243 ) ) ( not ( = ?auto_69242 ?auto_69243 ) ) ( CLEAR ?auto_69240 ) ( ON ?auto_69241 ?auto_69242 ) ( CLEAR ?auto_69241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_69235 ?auto_69236 ?auto_69237 ?auto_69238 ?auto_69239 ?auto_69240 ?auto_69241 )
      ( MAKE-8PILE ?auto_69235 ?auto_69236 ?auto_69237 ?auto_69238 ?auto_69239 ?auto_69240 ?auto_69241 ?auto_69242 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_69252 - BLOCK
      ?auto_69253 - BLOCK
      ?auto_69254 - BLOCK
      ?auto_69255 - BLOCK
      ?auto_69256 - BLOCK
      ?auto_69257 - BLOCK
      ?auto_69258 - BLOCK
      ?auto_69259 - BLOCK
    )
    :vars
    (
      ?auto_69260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69259 ?auto_69260 ) ( ON-TABLE ?auto_69252 ) ( ON ?auto_69253 ?auto_69252 ) ( ON ?auto_69254 ?auto_69253 ) ( ON ?auto_69255 ?auto_69254 ) ( ON ?auto_69256 ?auto_69255 ) ( not ( = ?auto_69252 ?auto_69253 ) ) ( not ( = ?auto_69252 ?auto_69254 ) ) ( not ( = ?auto_69252 ?auto_69255 ) ) ( not ( = ?auto_69252 ?auto_69256 ) ) ( not ( = ?auto_69252 ?auto_69257 ) ) ( not ( = ?auto_69252 ?auto_69258 ) ) ( not ( = ?auto_69252 ?auto_69259 ) ) ( not ( = ?auto_69252 ?auto_69260 ) ) ( not ( = ?auto_69253 ?auto_69254 ) ) ( not ( = ?auto_69253 ?auto_69255 ) ) ( not ( = ?auto_69253 ?auto_69256 ) ) ( not ( = ?auto_69253 ?auto_69257 ) ) ( not ( = ?auto_69253 ?auto_69258 ) ) ( not ( = ?auto_69253 ?auto_69259 ) ) ( not ( = ?auto_69253 ?auto_69260 ) ) ( not ( = ?auto_69254 ?auto_69255 ) ) ( not ( = ?auto_69254 ?auto_69256 ) ) ( not ( = ?auto_69254 ?auto_69257 ) ) ( not ( = ?auto_69254 ?auto_69258 ) ) ( not ( = ?auto_69254 ?auto_69259 ) ) ( not ( = ?auto_69254 ?auto_69260 ) ) ( not ( = ?auto_69255 ?auto_69256 ) ) ( not ( = ?auto_69255 ?auto_69257 ) ) ( not ( = ?auto_69255 ?auto_69258 ) ) ( not ( = ?auto_69255 ?auto_69259 ) ) ( not ( = ?auto_69255 ?auto_69260 ) ) ( not ( = ?auto_69256 ?auto_69257 ) ) ( not ( = ?auto_69256 ?auto_69258 ) ) ( not ( = ?auto_69256 ?auto_69259 ) ) ( not ( = ?auto_69256 ?auto_69260 ) ) ( not ( = ?auto_69257 ?auto_69258 ) ) ( not ( = ?auto_69257 ?auto_69259 ) ) ( not ( = ?auto_69257 ?auto_69260 ) ) ( not ( = ?auto_69258 ?auto_69259 ) ) ( not ( = ?auto_69258 ?auto_69260 ) ) ( not ( = ?auto_69259 ?auto_69260 ) ) ( ON ?auto_69258 ?auto_69259 ) ( CLEAR ?auto_69256 ) ( ON ?auto_69257 ?auto_69258 ) ( CLEAR ?auto_69257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69252 ?auto_69253 ?auto_69254 ?auto_69255 ?auto_69256 ?auto_69257 )
      ( MAKE-8PILE ?auto_69252 ?auto_69253 ?auto_69254 ?auto_69255 ?auto_69256 ?auto_69257 ?auto_69258 ?auto_69259 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_69269 - BLOCK
      ?auto_69270 - BLOCK
      ?auto_69271 - BLOCK
      ?auto_69272 - BLOCK
      ?auto_69273 - BLOCK
      ?auto_69274 - BLOCK
      ?auto_69275 - BLOCK
      ?auto_69276 - BLOCK
    )
    :vars
    (
      ?auto_69277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69276 ?auto_69277 ) ( ON-TABLE ?auto_69269 ) ( ON ?auto_69270 ?auto_69269 ) ( ON ?auto_69271 ?auto_69270 ) ( ON ?auto_69272 ?auto_69271 ) ( ON ?auto_69273 ?auto_69272 ) ( not ( = ?auto_69269 ?auto_69270 ) ) ( not ( = ?auto_69269 ?auto_69271 ) ) ( not ( = ?auto_69269 ?auto_69272 ) ) ( not ( = ?auto_69269 ?auto_69273 ) ) ( not ( = ?auto_69269 ?auto_69274 ) ) ( not ( = ?auto_69269 ?auto_69275 ) ) ( not ( = ?auto_69269 ?auto_69276 ) ) ( not ( = ?auto_69269 ?auto_69277 ) ) ( not ( = ?auto_69270 ?auto_69271 ) ) ( not ( = ?auto_69270 ?auto_69272 ) ) ( not ( = ?auto_69270 ?auto_69273 ) ) ( not ( = ?auto_69270 ?auto_69274 ) ) ( not ( = ?auto_69270 ?auto_69275 ) ) ( not ( = ?auto_69270 ?auto_69276 ) ) ( not ( = ?auto_69270 ?auto_69277 ) ) ( not ( = ?auto_69271 ?auto_69272 ) ) ( not ( = ?auto_69271 ?auto_69273 ) ) ( not ( = ?auto_69271 ?auto_69274 ) ) ( not ( = ?auto_69271 ?auto_69275 ) ) ( not ( = ?auto_69271 ?auto_69276 ) ) ( not ( = ?auto_69271 ?auto_69277 ) ) ( not ( = ?auto_69272 ?auto_69273 ) ) ( not ( = ?auto_69272 ?auto_69274 ) ) ( not ( = ?auto_69272 ?auto_69275 ) ) ( not ( = ?auto_69272 ?auto_69276 ) ) ( not ( = ?auto_69272 ?auto_69277 ) ) ( not ( = ?auto_69273 ?auto_69274 ) ) ( not ( = ?auto_69273 ?auto_69275 ) ) ( not ( = ?auto_69273 ?auto_69276 ) ) ( not ( = ?auto_69273 ?auto_69277 ) ) ( not ( = ?auto_69274 ?auto_69275 ) ) ( not ( = ?auto_69274 ?auto_69276 ) ) ( not ( = ?auto_69274 ?auto_69277 ) ) ( not ( = ?auto_69275 ?auto_69276 ) ) ( not ( = ?auto_69275 ?auto_69277 ) ) ( not ( = ?auto_69276 ?auto_69277 ) ) ( ON ?auto_69275 ?auto_69276 ) ( CLEAR ?auto_69273 ) ( ON ?auto_69274 ?auto_69275 ) ( CLEAR ?auto_69274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69269 ?auto_69270 ?auto_69271 ?auto_69272 ?auto_69273 ?auto_69274 )
      ( MAKE-8PILE ?auto_69269 ?auto_69270 ?auto_69271 ?auto_69272 ?auto_69273 ?auto_69274 ?auto_69275 ?auto_69276 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_69286 - BLOCK
      ?auto_69287 - BLOCK
      ?auto_69288 - BLOCK
      ?auto_69289 - BLOCK
      ?auto_69290 - BLOCK
      ?auto_69291 - BLOCK
      ?auto_69292 - BLOCK
      ?auto_69293 - BLOCK
    )
    :vars
    (
      ?auto_69294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69293 ?auto_69294 ) ( ON-TABLE ?auto_69286 ) ( ON ?auto_69287 ?auto_69286 ) ( ON ?auto_69288 ?auto_69287 ) ( ON ?auto_69289 ?auto_69288 ) ( not ( = ?auto_69286 ?auto_69287 ) ) ( not ( = ?auto_69286 ?auto_69288 ) ) ( not ( = ?auto_69286 ?auto_69289 ) ) ( not ( = ?auto_69286 ?auto_69290 ) ) ( not ( = ?auto_69286 ?auto_69291 ) ) ( not ( = ?auto_69286 ?auto_69292 ) ) ( not ( = ?auto_69286 ?auto_69293 ) ) ( not ( = ?auto_69286 ?auto_69294 ) ) ( not ( = ?auto_69287 ?auto_69288 ) ) ( not ( = ?auto_69287 ?auto_69289 ) ) ( not ( = ?auto_69287 ?auto_69290 ) ) ( not ( = ?auto_69287 ?auto_69291 ) ) ( not ( = ?auto_69287 ?auto_69292 ) ) ( not ( = ?auto_69287 ?auto_69293 ) ) ( not ( = ?auto_69287 ?auto_69294 ) ) ( not ( = ?auto_69288 ?auto_69289 ) ) ( not ( = ?auto_69288 ?auto_69290 ) ) ( not ( = ?auto_69288 ?auto_69291 ) ) ( not ( = ?auto_69288 ?auto_69292 ) ) ( not ( = ?auto_69288 ?auto_69293 ) ) ( not ( = ?auto_69288 ?auto_69294 ) ) ( not ( = ?auto_69289 ?auto_69290 ) ) ( not ( = ?auto_69289 ?auto_69291 ) ) ( not ( = ?auto_69289 ?auto_69292 ) ) ( not ( = ?auto_69289 ?auto_69293 ) ) ( not ( = ?auto_69289 ?auto_69294 ) ) ( not ( = ?auto_69290 ?auto_69291 ) ) ( not ( = ?auto_69290 ?auto_69292 ) ) ( not ( = ?auto_69290 ?auto_69293 ) ) ( not ( = ?auto_69290 ?auto_69294 ) ) ( not ( = ?auto_69291 ?auto_69292 ) ) ( not ( = ?auto_69291 ?auto_69293 ) ) ( not ( = ?auto_69291 ?auto_69294 ) ) ( not ( = ?auto_69292 ?auto_69293 ) ) ( not ( = ?auto_69292 ?auto_69294 ) ) ( not ( = ?auto_69293 ?auto_69294 ) ) ( ON ?auto_69292 ?auto_69293 ) ( ON ?auto_69291 ?auto_69292 ) ( CLEAR ?auto_69289 ) ( ON ?auto_69290 ?auto_69291 ) ( CLEAR ?auto_69290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69286 ?auto_69287 ?auto_69288 ?auto_69289 ?auto_69290 )
      ( MAKE-8PILE ?auto_69286 ?auto_69287 ?auto_69288 ?auto_69289 ?auto_69290 ?auto_69291 ?auto_69292 ?auto_69293 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_69303 - BLOCK
      ?auto_69304 - BLOCK
      ?auto_69305 - BLOCK
      ?auto_69306 - BLOCK
      ?auto_69307 - BLOCK
      ?auto_69308 - BLOCK
      ?auto_69309 - BLOCK
      ?auto_69310 - BLOCK
    )
    :vars
    (
      ?auto_69311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69310 ?auto_69311 ) ( ON-TABLE ?auto_69303 ) ( ON ?auto_69304 ?auto_69303 ) ( ON ?auto_69305 ?auto_69304 ) ( ON ?auto_69306 ?auto_69305 ) ( not ( = ?auto_69303 ?auto_69304 ) ) ( not ( = ?auto_69303 ?auto_69305 ) ) ( not ( = ?auto_69303 ?auto_69306 ) ) ( not ( = ?auto_69303 ?auto_69307 ) ) ( not ( = ?auto_69303 ?auto_69308 ) ) ( not ( = ?auto_69303 ?auto_69309 ) ) ( not ( = ?auto_69303 ?auto_69310 ) ) ( not ( = ?auto_69303 ?auto_69311 ) ) ( not ( = ?auto_69304 ?auto_69305 ) ) ( not ( = ?auto_69304 ?auto_69306 ) ) ( not ( = ?auto_69304 ?auto_69307 ) ) ( not ( = ?auto_69304 ?auto_69308 ) ) ( not ( = ?auto_69304 ?auto_69309 ) ) ( not ( = ?auto_69304 ?auto_69310 ) ) ( not ( = ?auto_69304 ?auto_69311 ) ) ( not ( = ?auto_69305 ?auto_69306 ) ) ( not ( = ?auto_69305 ?auto_69307 ) ) ( not ( = ?auto_69305 ?auto_69308 ) ) ( not ( = ?auto_69305 ?auto_69309 ) ) ( not ( = ?auto_69305 ?auto_69310 ) ) ( not ( = ?auto_69305 ?auto_69311 ) ) ( not ( = ?auto_69306 ?auto_69307 ) ) ( not ( = ?auto_69306 ?auto_69308 ) ) ( not ( = ?auto_69306 ?auto_69309 ) ) ( not ( = ?auto_69306 ?auto_69310 ) ) ( not ( = ?auto_69306 ?auto_69311 ) ) ( not ( = ?auto_69307 ?auto_69308 ) ) ( not ( = ?auto_69307 ?auto_69309 ) ) ( not ( = ?auto_69307 ?auto_69310 ) ) ( not ( = ?auto_69307 ?auto_69311 ) ) ( not ( = ?auto_69308 ?auto_69309 ) ) ( not ( = ?auto_69308 ?auto_69310 ) ) ( not ( = ?auto_69308 ?auto_69311 ) ) ( not ( = ?auto_69309 ?auto_69310 ) ) ( not ( = ?auto_69309 ?auto_69311 ) ) ( not ( = ?auto_69310 ?auto_69311 ) ) ( ON ?auto_69309 ?auto_69310 ) ( ON ?auto_69308 ?auto_69309 ) ( CLEAR ?auto_69306 ) ( ON ?auto_69307 ?auto_69308 ) ( CLEAR ?auto_69307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69303 ?auto_69304 ?auto_69305 ?auto_69306 ?auto_69307 )
      ( MAKE-8PILE ?auto_69303 ?auto_69304 ?auto_69305 ?auto_69306 ?auto_69307 ?auto_69308 ?auto_69309 ?auto_69310 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_69320 - BLOCK
      ?auto_69321 - BLOCK
      ?auto_69322 - BLOCK
      ?auto_69323 - BLOCK
      ?auto_69324 - BLOCK
      ?auto_69325 - BLOCK
      ?auto_69326 - BLOCK
      ?auto_69327 - BLOCK
    )
    :vars
    (
      ?auto_69328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69327 ?auto_69328 ) ( ON-TABLE ?auto_69320 ) ( ON ?auto_69321 ?auto_69320 ) ( ON ?auto_69322 ?auto_69321 ) ( not ( = ?auto_69320 ?auto_69321 ) ) ( not ( = ?auto_69320 ?auto_69322 ) ) ( not ( = ?auto_69320 ?auto_69323 ) ) ( not ( = ?auto_69320 ?auto_69324 ) ) ( not ( = ?auto_69320 ?auto_69325 ) ) ( not ( = ?auto_69320 ?auto_69326 ) ) ( not ( = ?auto_69320 ?auto_69327 ) ) ( not ( = ?auto_69320 ?auto_69328 ) ) ( not ( = ?auto_69321 ?auto_69322 ) ) ( not ( = ?auto_69321 ?auto_69323 ) ) ( not ( = ?auto_69321 ?auto_69324 ) ) ( not ( = ?auto_69321 ?auto_69325 ) ) ( not ( = ?auto_69321 ?auto_69326 ) ) ( not ( = ?auto_69321 ?auto_69327 ) ) ( not ( = ?auto_69321 ?auto_69328 ) ) ( not ( = ?auto_69322 ?auto_69323 ) ) ( not ( = ?auto_69322 ?auto_69324 ) ) ( not ( = ?auto_69322 ?auto_69325 ) ) ( not ( = ?auto_69322 ?auto_69326 ) ) ( not ( = ?auto_69322 ?auto_69327 ) ) ( not ( = ?auto_69322 ?auto_69328 ) ) ( not ( = ?auto_69323 ?auto_69324 ) ) ( not ( = ?auto_69323 ?auto_69325 ) ) ( not ( = ?auto_69323 ?auto_69326 ) ) ( not ( = ?auto_69323 ?auto_69327 ) ) ( not ( = ?auto_69323 ?auto_69328 ) ) ( not ( = ?auto_69324 ?auto_69325 ) ) ( not ( = ?auto_69324 ?auto_69326 ) ) ( not ( = ?auto_69324 ?auto_69327 ) ) ( not ( = ?auto_69324 ?auto_69328 ) ) ( not ( = ?auto_69325 ?auto_69326 ) ) ( not ( = ?auto_69325 ?auto_69327 ) ) ( not ( = ?auto_69325 ?auto_69328 ) ) ( not ( = ?auto_69326 ?auto_69327 ) ) ( not ( = ?auto_69326 ?auto_69328 ) ) ( not ( = ?auto_69327 ?auto_69328 ) ) ( ON ?auto_69326 ?auto_69327 ) ( ON ?auto_69325 ?auto_69326 ) ( ON ?auto_69324 ?auto_69325 ) ( CLEAR ?auto_69322 ) ( ON ?auto_69323 ?auto_69324 ) ( CLEAR ?auto_69323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69320 ?auto_69321 ?auto_69322 ?auto_69323 )
      ( MAKE-8PILE ?auto_69320 ?auto_69321 ?auto_69322 ?auto_69323 ?auto_69324 ?auto_69325 ?auto_69326 ?auto_69327 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_69337 - BLOCK
      ?auto_69338 - BLOCK
      ?auto_69339 - BLOCK
      ?auto_69340 - BLOCK
      ?auto_69341 - BLOCK
      ?auto_69342 - BLOCK
      ?auto_69343 - BLOCK
      ?auto_69344 - BLOCK
    )
    :vars
    (
      ?auto_69345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69344 ?auto_69345 ) ( ON-TABLE ?auto_69337 ) ( ON ?auto_69338 ?auto_69337 ) ( ON ?auto_69339 ?auto_69338 ) ( not ( = ?auto_69337 ?auto_69338 ) ) ( not ( = ?auto_69337 ?auto_69339 ) ) ( not ( = ?auto_69337 ?auto_69340 ) ) ( not ( = ?auto_69337 ?auto_69341 ) ) ( not ( = ?auto_69337 ?auto_69342 ) ) ( not ( = ?auto_69337 ?auto_69343 ) ) ( not ( = ?auto_69337 ?auto_69344 ) ) ( not ( = ?auto_69337 ?auto_69345 ) ) ( not ( = ?auto_69338 ?auto_69339 ) ) ( not ( = ?auto_69338 ?auto_69340 ) ) ( not ( = ?auto_69338 ?auto_69341 ) ) ( not ( = ?auto_69338 ?auto_69342 ) ) ( not ( = ?auto_69338 ?auto_69343 ) ) ( not ( = ?auto_69338 ?auto_69344 ) ) ( not ( = ?auto_69338 ?auto_69345 ) ) ( not ( = ?auto_69339 ?auto_69340 ) ) ( not ( = ?auto_69339 ?auto_69341 ) ) ( not ( = ?auto_69339 ?auto_69342 ) ) ( not ( = ?auto_69339 ?auto_69343 ) ) ( not ( = ?auto_69339 ?auto_69344 ) ) ( not ( = ?auto_69339 ?auto_69345 ) ) ( not ( = ?auto_69340 ?auto_69341 ) ) ( not ( = ?auto_69340 ?auto_69342 ) ) ( not ( = ?auto_69340 ?auto_69343 ) ) ( not ( = ?auto_69340 ?auto_69344 ) ) ( not ( = ?auto_69340 ?auto_69345 ) ) ( not ( = ?auto_69341 ?auto_69342 ) ) ( not ( = ?auto_69341 ?auto_69343 ) ) ( not ( = ?auto_69341 ?auto_69344 ) ) ( not ( = ?auto_69341 ?auto_69345 ) ) ( not ( = ?auto_69342 ?auto_69343 ) ) ( not ( = ?auto_69342 ?auto_69344 ) ) ( not ( = ?auto_69342 ?auto_69345 ) ) ( not ( = ?auto_69343 ?auto_69344 ) ) ( not ( = ?auto_69343 ?auto_69345 ) ) ( not ( = ?auto_69344 ?auto_69345 ) ) ( ON ?auto_69343 ?auto_69344 ) ( ON ?auto_69342 ?auto_69343 ) ( ON ?auto_69341 ?auto_69342 ) ( CLEAR ?auto_69339 ) ( ON ?auto_69340 ?auto_69341 ) ( CLEAR ?auto_69340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69337 ?auto_69338 ?auto_69339 ?auto_69340 )
      ( MAKE-8PILE ?auto_69337 ?auto_69338 ?auto_69339 ?auto_69340 ?auto_69341 ?auto_69342 ?auto_69343 ?auto_69344 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_69354 - BLOCK
      ?auto_69355 - BLOCK
      ?auto_69356 - BLOCK
      ?auto_69357 - BLOCK
      ?auto_69358 - BLOCK
      ?auto_69359 - BLOCK
      ?auto_69360 - BLOCK
      ?auto_69361 - BLOCK
    )
    :vars
    (
      ?auto_69362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69361 ?auto_69362 ) ( ON-TABLE ?auto_69354 ) ( ON ?auto_69355 ?auto_69354 ) ( not ( = ?auto_69354 ?auto_69355 ) ) ( not ( = ?auto_69354 ?auto_69356 ) ) ( not ( = ?auto_69354 ?auto_69357 ) ) ( not ( = ?auto_69354 ?auto_69358 ) ) ( not ( = ?auto_69354 ?auto_69359 ) ) ( not ( = ?auto_69354 ?auto_69360 ) ) ( not ( = ?auto_69354 ?auto_69361 ) ) ( not ( = ?auto_69354 ?auto_69362 ) ) ( not ( = ?auto_69355 ?auto_69356 ) ) ( not ( = ?auto_69355 ?auto_69357 ) ) ( not ( = ?auto_69355 ?auto_69358 ) ) ( not ( = ?auto_69355 ?auto_69359 ) ) ( not ( = ?auto_69355 ?auto_69360 ) ) ( not ( = ?auto_69355 ?auto_69361 ) ) ( not ( = ?auto_69355 ?auto_69362 ) ) ( not ( = ?auto_69356 ?auto_69357 ) ) ( not ( = ?auto_69356 ?auto_69358 ) ) ( not ( = ?auto_69356 ?auto_69359 ) ) ( not ( = ?auto_69356 ?auto_69360 ) ) ( not ( = ?auto_69356 ?auto_69361 ) ) ( not ( = ?auto_69356 ?auto_69362 ) ) ( not ( = ?auto_69357 ?auto_69358 ) ) ( not ( = ?auto_69357 ?auto_69359 ) ) ( not ( = ?auto_69357 ?auto_69360 ) ) ( not ( = ?auto_69357 ?auto_69361 ) ) ( not ( = ?auto_69357 ?auto_69362 ) ) ( not ( = ?auto_69358 ?auto_69359 ) ) ( not ( = ?auto_69358 ?auto_69360 ) ) ( not ( = ?auto_69358 ?auto_69361 ) ) ( not ( = ?auto_69358 ?auto_69362 ) ) ( not ( = ?auto_69359 ?auto_69360 ) ) ( not ( = ?auto_69359 ?auto_69361 ) ) ( not ( = ?auto_69359 ?auto_69362 ) ) ( not ( = ?auto_69360 ?auto_69361 ) ) ( not ( = ?auto_69360 ?auto_69362 ) ) ( not ( = ?auto_69361 ?auto_69362 ) ) ( ON ?auto_69360 ?auto_69361 ) ( ON ?auto_69359 ?auto_69360 ) ( ON ?auto_69358 ?auto_69359 ) ( ON ?auto_69357 ?auto_69358 ) ( CLEAR ?auto_69355 ) ( ON ?auto_69356 ?auto_69357 ) ( CLEAR ?auto_69356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69354 ?auto_69355 ?auto_69356 )
      ( MAKE-8PILE ?auto_69354 ?auto_69355 ?auto_69356 ?auto_69357 ?auto_69358 ?auto_69359 ?auto_69360 ?auto_69361 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_69371 - BLOCK
      ?auto_69372 - BLOCK
      ?auto_69373 - BLOCK
      ?auto_69374 - BLOCK
      ?auto_69375 - BLOCK
      ?auto_69376 - BLOCK
      ?auto_69377 - BLOCK
      ?auto_69378 - BLOCK
    )
    :vars
    (
      ?auto_69379 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69378 ?auto_69379 ) ( ON-TABLE ?auto_69371 ) ( ON ?auto_69372 ?auto_69371 ) ( not ( = ?auto_69371 ?auto_69372 ) ) ( not ( = ?auto_69371 ?auto_69373 ) ) ( not ( = ?auto_69371 ?auto_69374 ) ) ( not ( = ?auto_69371 ?auto_69375 ) ) ( not ( = ?auto_69371 ?auto_69376 ) ) ( not ( = ?auto_69371 ?auto_69377 ) ) ( not ( = ?auto_69371 ?auto_69378 ) ) ( not ( = ?auto_69371 ?auto_69379 ) ) ( not ( = ?auto_69372 ?auto_69373 ) ) ( not ( = ?auto_69372 ?auto_69374 ) ) ( not ( = ?auto_69372 ?auto_69375 ) ) ( not ( = ?auto_69372 ?auto_69376 ) ) ( not ( = ?auto_69372 ?auto_69377 ) ) ( not ( = ?auto_69372 ?auto_69378 ) ) ( not ( = ?auto_69372 ?auto_69379 ) ) ( not ( = ?auto_69373 ?auto_69374 ) ) ( not ( = ?auto_69373 ?auto_69375 ) ) ( not ( = ?auto_69373 ?auto_69376 ) ) ( not ( = ?auto_69373 ?auto_69377 ) ) ( not ( = ?auto_69373 ?auto_69378 ) ) ( not ( = ?auto_69373 ?auto_69379 ) ) ( not ( = ?auto_69374 ?auto_69375 ) ) ( not ( = ?auto_69374 ?auto_69376 ) ) ( not ( = ?auto_69374 ?auto_69377 ) ) ( not ( = ?auto_69374 ?auto_69378 ) ) ( not ( = ?auto_69374 ?auto_69379 ) ) ( not ( = ?auto_69375 ?auto_69376 ) ) ( not ( = ?auto_69375 ?auto_69377 ) ) ( not ( = ?auto_69375 ?auto_69378 ) ) ( not ( = ?auto_69375 ?auto_69379 ) ) ( not ( = ?auto_69376 ?auto_69377 ) ) ( not ( = ?auto_69376 ?auto_69378 ) ) ( not ( = ?auto_69376 ?auto_69379 ) ) ( not ( = ?auto_69377 ?auto_69378 ) ) ( not ( = ?auto_69377 ?auto_69379 ) ) ( not ( = ?auto_69378 ?auto_69379 ) ) ( ON ?auto_69377 ?auto_69378 ) ( ON ?auto_69376 ?auto_69377 ) ( ON ?auto_69375 ?auto_69376 ) ( ON ?auto_69374 ?auto_69375 ) ( CLEAR ?auto_69372 ) ( ON ?auto_69373 ?auto_69374 ) ( CLEAR ?auto_69373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69371 ?auto_69372 ?auto_69373 )
      ( MAKE-8PILE ?auto_69371 ?auto_69372 ?auto_69373 ?auto_69374 ?auto_69375 ?auto_69376 ?auto_69377 ?auto_69378 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_69388 - BLOCK
      ?auto_69389 - BLOCK
      ?auto_69390 - BLOCK
      ?auto_69391 - BLOCK
      ?auto_69392 - BLOCK
      ?auto_69393 - BLOCK
      ?auto_69394 - BLOCK
      ?auto_69395 - BLOCK
    )
    :vars
    (
      ?auto_69396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69395 ?auto_69396 ) ( ON-TABLE ?auto_69388 ) ( not ( = ?auto_69388 ?auto_69389 ) ) ( not ( = ?auto_69388 ?auto_69390 ) ) ( not ( = ?auto_69388 ?auto_69391 ) ) ( not ( = ?auto_69388 ?auto_69392 ) ) ( not ( = ?auto_69388 ?auto_69393 ) ) ( not ( = ?auto_69388 ?auto_69394 ) ) ( not ( = ?auto_69388 ?auto_69395 ) ) ( not ( = ?auto_69388 ?auto_69396 ) ) ( not ( = ?auto_69389 ?auto_69390 ) ) ( not ( = ?auto_69389 ?auto_69391 ) ) ( not ( = ?auto_69389 ?auto_69392 ) ) ( not ( = ?auto_69389 ?auto_69393 ) ) ( not ( = ?auto_69389 ?auto_69394 ) ) ( not ( = ?auto_69389 ?auto_69395 ) ) ( not ( = ?auto_69389 ?auto_69396 ) ) ( not ( = ?auto_69390 ?auto_69391 ) ) ( not ( = ?auto_69390 ?auto_69392 ) ) ( not ( = ?auto_69390 ?auto_69393 ) ) ( not ( = ?auto_69390 ?auto_69394 ) ) ( not ( = ?auto_69390 ?auto_69395 ) ) ( not ( = ?auto_69390 ?auto_69396 ) ) ( not ( = ?auto_69391 ?auto_69392 ) ) ( not ( = ?auto_69391 ?auto_69393 ) ) ( not ( = ?auto_69391 ?auto_69394 ) ) ( not ( = ?auto_69391 ?auto_69395 ) ) ( not ( = ?auto_69391 ?auto_69396 ) ) ( not ( = ?auto_69392 ?auto_69393 ) ) ( not ( = ?auto_69392 ?auto_69394 ) ) ( not ( = ?auto_69392 ?auto_69395 ) ) ( not ( = ?auto_69392 ?auto_69396 ) ) ( not ( = ?auto_69393 ?auto_69394 ) ) ( not ( = ?auto_69393 ?auto_69395 ) ) ( not ( = ?auto_69393 ?auto_69396 ) ) ( not ( = ?auto_69394 ?auto_69395 ) ) ( not ( = ?auto_69394 ?auto_69396 ) ) ( not ( = ?auto_69395 ?auto_69396 ) ) ( ON ?auto_69394 ?auto_69395 ) ( ON ?auto_69393 ?auto_69394 ) ( ON ?auto_69392 ?auto_69393 ) ( ON ?auto_69391 ?auto_69392 ) ( ON ?auto_69390 ?auto_69391 ) ( CLEAR ?auto_69388 ) ( ON ?auto_69389 ?auto_69390 ) ( CLEAR ?auto_69389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69388 ?auto_69389 )
      ( MAKE-8PILE ?auto_69388 ?auto_69389 ?auto_69390 ?auto_69391 ?auto_69392 ?auto_69393 ?auto_69394 ?auto_69395 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_69405 - BLOCK
      ?auto_69406 - BLOCK
      ?auto_69407 - BLOCK
      ?auto_69408 - BLOCK
      ?auto_69409 - BLOCK
      ?auto_69410 - BLOCK
      ?auto_69411 - BLOCK
      ?auto_69412 - BLOCK
    )
    :vars
    (
      ?auto_69413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69412 ?auto_69413 ) ( ON-TABLE ?auto_69405 ) ( not ( = ?auto_69405 ?auto_69406 ) ) ( not ( = ?auto_69405 ?auto_69407 ) ) ( not ( = ?auto_69405 ?auto_69408 ) ) ( not ( = ?auto_69405 ?auto_69409 ) ) ( not ( = ?auto_69405 ?auto_69410 ) ) ( not ( = ?auto_69405 ?auto_69411 ) ) ( not ( = ?auto_69405 ?auto_69412 ) ) ( not ( = ?auto_69405 ?auto_69413 ) ) ( not ( = ?auto_69406 ?auto_69407 ) ) ( not ( = ?auto_69406 ?auto_69408 ) ) ( not ( = ?auto_69406 ?auto_69409 ) ) ( not ( = ?auto_69406 ?auto_69410 ) ) ( not ( = ?auto_69406 ?auto_69411 ) ) ( not ( = ?auto_69406 ?auto_69412 ) ) ( not ( = ?auto_69406 ?auto_69413 ) ) ( not ( = ?auto_69407 ?auto_69408 ) ) ( not ( = ?auto_69407 ?auto_69409 ) ) ( not ( = ?auto_69407 ?auto_69410 ) ) ( not ( = ?auto_69407 ?auto_69411 ) ) ( not ( = ?auto_69407 ?auto_69412 ) ) ( not ( = ?auto_69407 ?auto_69413 ) ) ( not ( = ?auto_69408 ?auto_69409 ) ) ( not ( = ?auto_69408 ?auto_69410 ) ) ( not ( = ?auto_69408 ?auto_69411 ) ) ( not ( = ?auto_69408 ?auto_69412 ) ) ( not ( = ?auto_69408 ?auto_69413 ) ) ( not ( = ?auto_69409 ?auto_69410 ) ) ( not ( = ?auto_69409 ?auto_69411 ) ) ( not ( = ?auto_69409 ?auto_69412 ) ) ( not ( = ?auto_69409 ?auto_69413 ) ) ( not ( = ?auto_69410 ?auto_69411 ) ) ( not ( = ?auto_69410 ?auto_69412 ) ) ( not ( = ?auto_69410 ?auto_69413 ) ) ( not ( = ?auto_69411 ?auto_69412 ) ) ( not ( = ?auto_69411 ?auto_69413 ) ) ( not ( = ?auto_69412 ?auto_69413 ) ) ( ON ?auto_69411 ?auto_69412 ) ( ON ?auto_69410 ?auto_69411 ) ( ON ?auto_69409 ?auto_69410 ) ( ON ?auto_69408 ?auto_69409 ) ( ON ?auto_69407 ?auto_69408 ) ( CLEAR ?auto_69405 ) ( ON ?auto_69406 ?auto_69407 ) ( CLEAR ?auto_69406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69405 ?auto_69406 )
      ( MAKE-8PILE ?auto_69405 ?auto_69406 ?auto_69407 ?auto_69408 ?auto_69409 ?auto_69410 ?auto_69411 ?auto_69412 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_69422 - BLOCK
      ?auto_69423 - BLOCK
      ?auto_69424 - BLOCK
      ?auto_69425 - BLOCK
      ?auto_69426 - BLOCK
      ?auto_69427 - BLOCK
      ?auto_69428 - BLOCK
      ?auto_69429 - BLOCK
    )
    :vars
    (
      ?auto_69430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69429 ?auto_69430 ) ( not ( = ?auto_69422 ?auto_69423 ) ) ( not ( = ?auto_69422 ?auto_69424 ) ) ( not ( = ?auto_69422 ?auto_69425 ) ) ( not ( = ?auto_69422 ?auto_69426 ) ) ( not ( = ?auto_69422 ?auto_69427 ) ) ( not ( = ?auto_69422 ?auto_69428 ) ) ( not ( = ?auto_69422 ?auto_69429 ) ) ( not ( = ?auto_69422 ?auto_69430 ) ) ( not ( = ?auto_69423 ?auto_69424 ) ) ( not ( = ?auto_69423 ?auto_69425 ) ) ( not ( = ?auto_69423 ?auto_69426 ) ) ( not ( = ?auto_69423 ?auto_69427 ) ) ( not ( = ?auto_69423 ?auto_69428 ) ) ( not ( = ?auto_69423 ?auto_69429 ) ) ( not ( = ?auto_69423 ?auto_69430 ) ) ( not ( = ?auto_69424 ?auto_69425 ) ) ( not ( = ?auto_69424 ?auto_69426 ) ) ( not ( = ?auto_69424 ?auto_69427 ) ) ( not ( = ?auto_69424 ?auto_69428 ) ) ( not ( = ?auto_69424 ?auto_69429 ) ) ( not ( = ?auto_69424 ?auto_69430 ) ) ( not ( = ?auto_69425 ?auto_69426 ) ) ( not ( = ?auto_69425 ?auto_69427 ) ) ( not ( = ?auto_69425 ?auto_69428 ) ) ( not ( = ?auto_69425 ?auto_69429 ) ) ( not ( = ?auto_69425 ?auto_69430 ) ) ( not ( = ?auto_69426 ?auto_69427 ) ) ( not ( = ?auto_69426 ?auto_69428 ) ) ( not ( = ?auto_69426 ?auto_69429 ) ) ( not ( = ?auto_69426 ?auto_69430 ) ) ( not ( = ?auto_69427 ?auto_69428 ) ) ( not ( = ?auto_69427 ?auto_69429 ) ) ( not ( = ?auto_69427 ?auto_69430 ) ) ( not ( = ?auto_69428 ?auto_69429 ) ) ( not ( = ?auto_69428 ?auto_69430 ) ) ( not ( = ?auto_69429 ?auto_69430 ) ) ( ON ?auto_69428 ?auto_69429 ) ( ON ?auto_69427 ?auto_69428 ) ( ON ?auto_69426 ?auto_69427 ) ( ON ?auto_69425 ?auto_69426 ) ( ON ?auto_69424 ?auto_69425 ) ( ON ?auto_69423 ?auto_69424 ) ( ON ?auto_69422 ?auto_69423 ) ( CLEAR ?auto_69422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69422 )
      ( MAKE-8PILE ?auto_69422 ?auto_69423 ?auto_69424 ?auto_69425 ?auto_69426 ?auto_69427 ?auto_69428 ?auto_69429 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_69439 - BLOCK
      ?auto_69440 - BLOCK
      ?auto_69441 - BLOCK
      ?auto_69442 - BLOCK
      ?auto_69443 - BLOCK
      ?auto_69444 - BLOCK
      ?auto_69445 - BLOCK
      ?auto_69446 - BLOCK
    )
    :vars
    (
      ?auto_69447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69446 ?auto_69447 ) ( not ( = ?auto_69439 ?auto_69440 ) ) ( not ( = ?auto_69439 ?auto_69441 ) ) ( not ( = ?auto_69439 ?auto_69442 ) ) ( not ( = ?auto_69439 ?auto_69443 ) ) ( not ( = ?auto_69439 ?auto_69444 ) ) ( not ( = ?auto_69439 ?auto_69445 ) ) ( not ( = ?auto_69439 ?auto_69446 ) ) ( not ( = ?auto_69439 ?auto_69447 ) ) ( not ( = ?auto_69440 ?auto_69441 ) ) ( not ( = ?auto_69440 ?auto_69442 ) ) ( not ( = ?auto_69440 ?auto_69443 ) ) ( not ( = ?auto_69440 ?auto_69444 ) ) ( not ( = ?auto_69440 ?auto_69445 ) ) ( not ( = ?auto_69440 ?auto_69446 ) ) ( not ( = ?auto_69440 ?auto_69447 ) ) ( not ( = ?auto_69441 ?auto_69442 ) ) ( not ( = ?auto_69441 ?auto_69443 ) ) ( not ( = ?auto_69441 ?auto_69444 ) ) ( not ( = ?auto_69441 ?auto_69445 ) ) ( not ( = ?auto_69441 ?auto_69446 ) ) ( not ( = ?auto_69441 ?auto_69447 ) ) ( not ( = ?auto_69442 ?auto_69443 ) ) ( not ( = ?auto_69442 ?auto_69444 ) ) ( not ( = ?auto_69442 ?auto_69445 ) ) ( not ( = ?auto_69442 ?auto_69446 ) ) ( not ( = ?auto_69442 ?auto_69447 ) ) ( not ( = ?auto_69443 ?auto_69444 ) ) ( not ( = ?auto_69443 ?auto_69445 ) ) ( not ( = ?auto_69443 ?auto_69446 ) ) ( not ( = ?auto_69443 ?auto_69447 ) ) ( not ( = ?auto_69444 ?auto_69445 ) ) ( not ( = ?auto_69444 ?auto_69446 ) ) ( not ( = ?auto_69444 ?auto_69447 ) ) ( not ( = ?auto_69445 ?auto_69446 ) ) ( not ( = ?auto_69445 ?auto_69447 ) ) ( not ( = ?auto_69446 ?auto_69447 ) ) ( ON ?auto_69445 ?auto_69446 ) ( ON ?auto_69444 ?auto_69445 ) ( ON ?auto_69443 ?auto_69444 ) ( ON ?auto_69442 ?auto_69443 ) ( ON ?auto_69441 ?auto_69442 ) ( ON ?auto_69440 ?auto_69441 ) ( ON ?auto_69439 ?auto_69440 ) ( CLEAR ?auto_69439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69439 )
      ( MAKE-8PILE ?auto_69439 ?auto_69440 ?auto_69441 ?auto_69442 ?auto_69443 ?auto_69444 ?auto_69445 ?auto_69446 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_69457 - BLOCK
      ?auto_69458 - BLOCK
      ?auto_69459 - BLOCK
      ?auto_69460 - BLOCK
      ?auto_69461 - BLOCK
      ?auto_69462 - BLOCK
      ?auto_69463 - BLOCK
      ?auto_69464 - BLOCK
      ?auto_69465 - BLOCK
    )
    :vars
    (
      ?auto_69466 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_69464 ) ( ON ?auto_69465 ?auto_69466 ) ( CLEAR ?auto_69465 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69457 ) ( ON ?auto_69458 ?auto_69457 ) ( ON ?auto_69459 ?auto_69458 ) ( ON ?auto_69460 ?auto_69459 ) ( ON ?auto_69461 ?auto_69460 ) ( ON ?auto_69462 ?auto_69461 ) ( ON ?auto_69463 ?auto_69462 ) ( ON ?auto_69464 ?auto_69463 ) ( not ( = ?auto_69457 ?auto_69458 ) ) ( not ( = ?auto_69457 ?auto_69459 ) ) ( not ( = ?auto_69457 ?auto_69460 ) ) ( not ( = ?auto_69457 ?auto_69461 ) ) ( not ( = ?auto_69457 ?auto_69462 ) ) ( not ( = ?auto_69457 ?auto_69463 ) ) ( not ( = ?auto_69457 ?auto_69464 ) ) ( not ( = ?auto_69457 ?auto_69465 ) ) ( not ( = ?auto_69457 ?auto_69466 ) ) ( not ( = ?auto_69458 ?auto_69459 ) ) ( not ( = ?auto_69458 ?auto_69460 ) ) ( not ( = ?auto_69458 ?auto_69461 ) ) ( not ( = ?auto_69458 ?auto_69462 ) ) ( not ( = ?auto_69458 ?auto_69463 ) ) ( not ( = ?auto_69458 ?auto_69464 ) ) ( not ( = ?auto_69458 ?auto_69465 ) ) ( not ( = ?auto_69458 ?auto_69466 ) ) ( not ( = ?auto_69459 ?auto_69460 ) ) ( not ( = ?auto_69459 ?auto_69461 ) ) ( not ( = ?auto_69459 ?auto_69462 ) ) ( not ( = ?auto_69459 ?auto_69463 ) ) ( not ( = ?auto_69459 ?auto_69464 ) ) ( not ( = ?auto_69459 ?auto_69465 ) ) ( not ( = ?auto_69459 ?auto_69466 ) ) ( not ( = ?auto_69460 ?auto_69461 ) ) ( not ( = ?auto_69460 ?auto_69462 ) ) ( not ( = ?auto_69460 ?auto_69463 ) ) ( not ( = ?auto_69460 ?auto_69464 ) ) ( not ( = ?auto_69460 ?auto_69465 ) ) ( not ( = ?auto_69460 ?auto_69466 ) ) ( not ( = ?auto_69461 ?auto_69462 ) ) ( not ( = ?auto_69461 ?auto_69463 ) ) ( not ( = ?auto_69461 ?auto_69464 ) ) ( not ( = ?auto_69461 ?auto_69465 ) ) ( not ( = ?auto_69461 ?auto_69466 ) ) ( not ( = ?auto_69462 ?auto_69463 ) ) ( not ( = ?auto_69462 ?auto_69464 ) ) ( not ( = ?auto_69462 ?auto_69465 ) ) ( not ( = ?auto_69462 ?auto_69466 ) ) ( not ( = ?auto_69463 ?auto_69464 ) ) ( not ( = ?auto_69463 ?auto_69465 ) ) ( not ( = ?auto_69463 ?auto_69466 ) ) ( not ( = ?auto_69464 ?auto_69465 ) ) ( not ( = ?auto_69464 ?auto_69466 ) ) ( not ( = ?auto_69465 ?auto_69466 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69465 ?auto_69466 )
      ( !STACK ?auto_69465 ?auto_69464 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_69476 - BLOCK
      ?auto_69477 - BLOCK
      ?auto_69478 - BLOCK
      ?auto_69479 - BLOCK
      ?auto_69480 - BLOCK
      ?auto_69481 - BLOCK
      ?auto_69482 - BLOCK
      ?auto_69483 - BLOCK
      ?auto_69484 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_69483 ) ( ON-TABLE ?auto_69484 ) ( CLEAR ?auto_69484 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69476 ) ( ON ?auto_69477 ?auto_69476 ) ( ON ?auto_69478 ?auto_69477 ) ( ON ?auto_69479 ?auto_69478 ) ( ON ?auto_69480 ?auto_69479 ) ( ON ?auto_69481 ?auto_69480 ) ( ON ?auto_69482 ?auto_69481 ) ( ON ?auto_69483 ?auto_69482 ) ( not ( = ?auto_69476 ?auto_69477 ) ) ( not ( = ?auto_69476 ?auto_69478 ) ) ( not ( = ?auto_69476 ?auto_69479 ) ) ( not ( = ?auto_69476 ?auto_69480 ) ) ( not ( = ?auto_69476 ?auto_69481 ) ) ( not ( = ?auto_69476 ?auto_69482 ) ) ( not ( = ?auto_69476 ?auto_69483 ) ) ( not ( = ?auto_69476 ?auto_69484 ) ) ( not ( = ?auto_69477 ?auto_69478 ) ) ( not ( = ?auto_69477 ?auto_69479 ) ) ( not ( = ?auto_69477 ?auto_69480 ) ) ( not ( = ?auto_69477 ?auto_69481 ) ) ( not ( = ?auto_69477 ?auto_69482 ) ) ( not ( = ?auto_69477 ?auto_69483 ) ) ( not ( = ?auto_69477 ?auto_69484 ) ) ( not ( = ?auto_69478 ?auto_69479 ) ) ( not ( = ?auto_69478 ?auto_69480 ) ) ( not ( = ?auto_69478 ?auto_69481 ) ) ( not ( = ?auto_69478 ?auto_69482 ) ) ( not ( = ?auto_69478 ?auto_69483 ) ) ( not ( = ?auto_69478 ?auto_69484 ) ) ( not ( = ?auto_69479 ?auto_69480 ) ) ( not ( = ?auto_69479 ?auto_69481 ) ) ( not ( = ?auto_69479 ?auto_69482 ) ) ( not ( = ?auto_69479 ?auto_69483 ) ) ( not ( = ?auto_69479 ?auto_69484 ) ) ( not ( = ?auto_69480 ?auto_69481 ) ) ( not ( = ?auto_69480 ?auto_69482 ) ) ( not ( = ?auto_69480 ?auto_69483 ) ) ( not ( = ?auto_69480 ?auto_69484 ) ) ( not ( = ?auto_69481 ?auto_69482 ) ) ( not ( = ?auto_69481 ?auto_69483 ) ) ( not ( = ?auto_69481 ?auto_69484 ) ) ( not ( = ?auto_69482 ?auto_69483 ) ) ( not ( = ?auto_69482 ?auto_69484 ) ) ( not ( = ?auto_69483 ?auto_69484 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_69484 )
      ( !STACK ?auto_69484 ?auto_69483 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_69494 - BLOCK
      ?auto_69495 - BLOCK
      ?auto_69496 - BLOCK
      ?auto_69497 - BLOCK
      ?auto_69498 - BLOCK
      ?auto_69499 - BLOCK
      ?auto_69500 - BLOCK
      ?auto_69501 - BLOCK
      ?auto_69502 - BLOCK
    )
    :vars
    (
      ?auto_69503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69502 ?auto_69503 ) ( ON-TABLE ?auto_69494 ) ( ON ?auto_69495 ?auto_69494 ) ( ON ?auto_69496 ?auto_69495 ) ( ON ?auto_69497 ?auto_69496 ) ( ON ?auto_69498 ?auto_69497 ) ( ON ?auto_69499 ?auto_69498 ) ( ON ?auto_69500 ?auto_69499 ) ( not ( = ?auto_69494 ?auto_69495 ) ) ( not ( = ?auto_69494 ?auto_69496 ) ) ( not ( = ?auto_69494 ?auto_69497 ) ) ( not ( = ?auto_69494 ?auto_69498 ) ) ( not ( = ?auto_69494 ?auto_69499 ) ) ( not ( = ?auto_69494 ?auto_69500 ) ) ( not ( = ?auto_69494 ?auto_69501 ) ) ( not ( = ?auto_69494 ?auto_69502 ) ) ( not ( = ?auto_69494 ?auto_69503 ) ) ( not ( = ?auto_69495 ?auto_69496 ) ) ( not ( = ?auto_69495 ?auto_69497 ) ) ( not ( = ?auto_69495 ?auto_69498 ) ) ( not ( = ?auto_69495 ?auto_69499 ) ) ( not ( = ?auto_69495 ?auto_69500 ) ) ( not ( = ?auto_69495 ?auto_69501 ) ) ( not ( = ?auto_69495 ?auto_69502 ) ) ( not ( = ?auto_69495 ?auto_69503 ) ) ( not ( = ?auto_69496 ?auto_69497 ) ) ( not ( = ?auto_69496 ?auto_69498 ) ) ( not ( = ?auto_69496 ?auto_69499 ) ) ( not ( = ?auto_69496 ?auto_69500 ) ) ( not ( = ?auto_69496 ?auto_69501 ) ) ( not ( = ?auto_69496 ?auto_69502 ) ) ( not ( = ?auto_69496 ?auto_69503 ) ) ( not ( = ?auto_69497 ?auto_69498 ) ) ( not ( = ?auto_69497 ?auto_69499 ) ) ( not ( = ?auto_69497 ?auto_69500 ) ) ( not ( = ?auto_69497 ?auto_69501 ) ) ( not ( = ?auto_69497 ?auto_69502 ) ) ( not ( = ?auto_69497 ?auto_69503 ) ) ( not ( = ?auto_69498 ?auto_69499 ) ) ( not ( = ?auto_69498 ?auto_69500 ) ) ( not ( = ?auto_69498 ?auto_69501 ) ) ( not ( = ?auto_69498 ?auto_69502 ) ) ( not ( = ?auto_69498 ?auto_69503 ) ) ( not ( = ?auto_69499 ?auto_69500 ) ) ( not ( = ?auto_69499 ?auto_69501 ) ) ( not ( = ?auto_69499 ?auto_69502 ) ) ( not ( = ?auto_69499 ?auto_69503 ) ) ( not ( = ?auto_69500 ?auto_69501 ) ) ( not ( = ?auto_69500 ?auto_69502 ) ) ( not ( = ?auto_69500 ?auto_69503 ) ) ( not ( = ?auto_69501 ?auto_69502 ) ) ( not ( = ?auto_69501 ?auto_69503 ) ) ( not ( = ?auto_69502 ?auto_69503 ) ) ( CLEAR ?auto_69500 ) ( ON ?auto_69501 ?auto_69502 ) ( CLEAR ?auto_69501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_69494 ?auto_69495 ?auto_69496 ?auto_69497 ?auto_69498 ?auto_69499 ?auto_69500 ?auto_69501 )
      ( MAKE-9PILE ?auto_69494 ?auto_69495 ?auto_69496 ?auto_69497 ?auto_69498 ?auto_69499 ?auto_69500 ?auto_69501 ?auto_69502 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_69513 - BLOCK
      ?auto_69514 - BLOCK
      ?auto_69515 - BLOCK
      ?auto_69516 - BLOCK
      ?auto_69517 - BLOCK
      ?auto_69518 - BLOCK
      ?auto_69519 - BLOCK
      ?auto_69520 - BLOCK
      ?auto_69521 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69521 ) ( ON-TABLE ?auto_69513 ) ( ON ?auto_69514 ?auto_69513 ) ( ON ?auto_69515 ?auto_69514 ) ( ON ?auto_69516 ?auto_69515 ) ( ON ?auto_69517 ?auto_69516 ) ( ON ?auto_69518 ?auto_69517 ) ( ON ?auto_69519 ?auto_69518 ) ( not ( = ?auto_69513 ?auto_69514 ) ) ( not ( = ?auto_69513 ?auto_69515 ) ) ( not ( = ?auto_69513 ?auto_69516 ) ) ( not ( = ?auto_69513 ?auto_69517 ) ) ( not ( = ?auto_69513 ?auto_69518 ) ) ( not ( = ?auto_69513 ?auto_69519 ) ) ( not ( = ?auto_69513 ?auto_69520 ) ) ( not ( = ?auto_69513 ?auto_69521 ) ) ( not ( = ?auto_69514 ?auto_69515 ) ) ( not ( = ?auto_69514 ?auto_69516 ) ) ( not ( = ?auto_69514 ?auto_69517 ) ) ( not ( = ?auto_69514 ?auto_69518 ) ) ( not ( = ?auto_69514 ?auto_69519 ) ) ( not ( = ?auto_69514 ?auto_69520 ) ) ( not ( = ?auto_69514 ?auto_69521 ) ) ( not ( = ?auto_69515 ?auto_69516 ) ) ( not ( = ?auto_69515 ?auto_69517 ) ) ( not ( = ?auto_69515 ?auto_69518 ) ) ( not ( = ?auto_69515 ?auto_69519 ) ) ( not ( = ?auto_69515 ?auto_69520 ) ) ( not ( = ?auto_69515 ?auto_69521 ) ) ( not ( = ?auto_69516 ?auto_69517 ) ) ( not ( = ?auto_69516 ?auto_69518 ) ) ( not ( = ?auto_69516 ?auto_69519 ) ) ( not ( = ?auto_69516 ?auto_69520 ) ) ( not ( = ?auto_69516 ?auto_69521 ) ) ( not ( = ?auto_69517 ?auto_69518 ) ) ( not ( = ?auto_69517 ?auto_69519 ) ) ( not ( = ?auto_69517 ?auto_69520 ) ) ( not ( = ?auto_69517 ?auto_69521 ) ) ( not ( = ?auto_69518 ?auto_69519 ) ) ( not ( = ?auto_69518 ?auto_69520 ) ) ( not ( = ?auto_69518 ?auto_69521 ) ) ( not ( = ?auto_69519 ?auto_69520 ) ) ( not ( = ?auto_69519 ?auto_69521 ) ) ( not ( = ?auto_69520 ?auto_69521 ) ) ( CLEAR ?auto_69519 ) ( ON ?auto_69520 ?auto_69521 ) ( CLEAR ?auto_69520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_69513 ?auto_69514 ?auto_69515 ?auto_69516 ?auto_69517 ?auto_69518 ?auto_69519 ?auto_69520 )
      ( MAKE-9PILE ?auto_69513 ?auto_69514 ?auto_69515 ?auto_69516 ?auto_69517 ?auto_69518 ?auto_69519 ?auto_69520 ?auto_69521 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_69531 - BLOCK
      ?auto_69532 - BLOCK
      ?auto_69533 - BLOCK
      ?auto_69534 - BLOCK
      ?auto_69535 - BLOCK
      ?auto_69536 - BLOCK
      ?auto_69537 - BLOCK
      ?auto_69538 - BLOCK
      ?auto_69539 - BLOCK
    )
    :vars
    (
      ?auto_69540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69539 ?auto_69540 ) ( ON-TABLE ?auto_69531 ) ( ON ?auto_69532 ?auto_69531 ) ( ON ?auto_69533 ?auto_69532 ) ( ON ?auto_69534 ?auto_69533 ) ( ON ?auto_69535 ?auto_69534 ) ( ON ?auto_69536 ?auto_69535 ) ( not ( = ?auto_69531 ?auto_69532 ) ) ( not ( = ?auto_69531 ?auto_69533 ) ) ( not ( = ?auto_69531 ?auto_69534 ) ) ( not ( = ?auto_69531 ?auto_69535 ) ) ( not ( = ?auto_69531 ?auto_69536 ) ) ( not ( = ?auto_69531 ?auto_69537 ) ) ( not ( = ?auto_69531 ?auto_69538 ) ) ( not ( = ?auto_69531 ?auto_69539 ) ) ( not ( = ?auto_69531 ?auto_69540 ) ) ( not ( = ?auto_69532 ?auto_69533 ) ) ( not ( = ?auto_69532 ?auto_69534 ) ) ( not ( = ?auto_69532 ?auto_69535 ) ) ( not ( = ?auto_69532 ?auto_69536 ) ) ( not ( = ?auto_69532 ?auto_69537 ) ) ( not ( = ?auto_69532 ?auto_69538 ) ) ( not ( = ?auto_69532 ?auto_69539 ) ) ( not ( = ?auto_69532 ?auto_69540 ) ) ( not ( = ?auto_69533 ?auto_69534 ) ) ( not ( = ?auto_69533 ?auto_69535 ) ) ( not ( = ?auto_69533 ?auto_69536 ) ) ( not ( = ?auto_69533 ?auto_69537 ) ) ( not ( = ?auto_69533 ?auto_69538 ) ) ( not ( = ?auto_69533 ?auto_69539 ) ) ( not ( = ?auto_69533 ?auto_69540 ) ) ( not ( = ?auto_69534 ?auto_69535 ) ) ( not ( = ?auto_69534 ?auto_69536 ) ) ( not ( = ?auto_69534 ?auto_69537 ) ) ( not ( = ?auto_69534 ?auto_69538 ) ) ( not ( = ?auto_69534 ?auto_69539 ) ) ( not ( = ?auto_69534 ?auto_69540 ) ) ( not ( = ?auto_69535 ?auto_69536 ) ) ( not ( = ?auto_69535 ?auto_69537 ) ) ( not ( = ?auto_69535 ?auto_69538 ) ) ( not ( = ?auto_69535 ?auto_69539 ) ) ( not ( = ?auto_69535 ?auto_69540 ) ) ( not ( = ?auto_69536 ?auto_69537 ) ) ( not ( = ?auto_69536 ?auto_69538 ) ) ( not ( = ?auto_69536 ?auto_69539 ) ) ( not ( = ?auto_69536 ?auto_69540 ) ) ( not ( = ?auto_69537 ?auto_69538 ) ) ( not ( = ?auto_69537 ?auto_69539 ) ) ( not ( = ?auto_69537 ?auto_69540 ) ) ( not ( = ?auto_69538 ?auto_69539 ) ) ( not ( = ?auto_69538 ?auto_69540 ) ) ( not ( = ?auto_69539 ?auto_69540 ) ) ( ON ?auto_69538 ?auto_69539 ) ( CLEAR ?auto_69536 ) ( ON ?auto_69537 ?auto_69538 ) ( CLEAR ?auto_69537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_69531 ?auto_69532 ?auto_69533 ?auto_69534 ?auto_69535 ?auto_69536 ?auto_69537 )
      ( MAKE-9PILE ?auto_69531 ?auto_69532 ?auto_69533 ?auto_69534 ?auto_69535 ?auto_69536 ?auto_69537 ?auto_69538 ?auto_69539 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_69550 - BLOCK
      ?auto_69551 - BLOCK
      ?auto_69552 - BLOCK
      ?auto_69553 - BLOCK
      ?auto_69554 - BLOCK
      ?auto_69555 - BLOCK
      ?auto_69556 - BLOCK
      ?auto_69557 - BLOCK
      ?auto_69558 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69558 ) ( ON-TABLE ?auto_69550 ) ( ON ?auto_69551 ?auto_69550 ) ( ON ?auto_69552 ?auto_69551 ) ( ON ?auto_69553 ?auto_69552 ) ( ON ?auto_69554 ?auto_69553 ) ( ON ?auto_69555 ?auto_69554 ) ( not ( = ?auto_69550 ?auto_69551 ) ) ( not ( = ?auto_69550 ?auto_69552 ) ) ( not ( = ?auto_69550 ?auto_69553 ) ) ( not ( = ?auto_69550 ?auto_69554 ) ) ( not ( = ?auto_69550 ?auto_69555 ) ) ( not ( = ?auto_69550 ?auto_69556 ) ) ( not ( = ?auto_69550 ?auto_69557 ) ) ( not ( = ?auto_69550 ?auto_69558 ) ) ( not ( = ?auto_69551 ?auto_69552 ) ) ( not ( = ?auto_69551 ?auto_69553 ) ) ( not ( = ?auto_69551 ?auto_69554 ) ) ( not ( = ?auto_69551 ?auto_69555 ) ) ( not ( = ?auto_69551 ?auto_69556 ) ) ( not ( = ?auto_69551 ?auto_69557 ) ) ( not ( = ?auto_69551 ?auto_69558 ) ) ( not ( = ?auto_69552 ?auto_69553 ) ) ( not ( = ?auto_69552 ?auto_69554 ) ) ( not ( = ?auto_69552 ?auto_69555 ) ) ( not ( = ?auto_69552 ?auto_69556 ) ) ( not ( = ?auto_69552 ?auto_69557 ) ) ( not ( = ?auto_69552 ?auto_69558 ) ) ( not ( = ?auto_69553 ?auto_69554 ) ) ( not ( = ?auto_69553 ?auto_69555 ) ) ( not ( = ?auto_69553 ?auto_69556 ) ) ( not ( = ?auto_69553 ?auto_69557 ) ) ( not ( = ?auto_69553 ?auto_69558 ) ) ( not ( = ?auto_69554 ?auto_69555 ) ) ( not ( = ?auto_69554 ?auto_69556 ) ) ( not ( = ?auto_69554 ?auto_69557 ) ) ( not ( = ?auto_69554 ?auto_69558 ) ) ( not ( = ?auto_69555 ?auto_69556 ) ) ( not ( = ?auto_69555 ?auto_69557 ) ) ( not ( = ?auto_69555 ?auto_69558 ) ) ( not ( = ?auto_69556 ?auto_69557 ) ) ( not ( = ?auto_69556 ?auto_69558 ) ) ( not ( = ?auto_69557 ?auto_69558 ) ) ( ON ?auto_69557 ?auto_69558 ) ( CLEAR ?auto_69555 ) ( ON ?auto_69556 ?auto_69557 ) ( CLEAR ?auto_69556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_69550 ?auto_69551 ?auto_69552 ?auto_69553 ?auto_69554 ?auto_69555 ?auto_69556 )
      ( MAKE-9PILE ?auto_69550 ?auto_69551 ?auto_69552 ?auto_69553 ?auto_69554 ?auto_69555 ?auto_69556 ?auto_69557 ?auto_69558 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_69568 - BLOCK
      ?auto_69569 - BLOCK
      ?auto_69570 - BLOCK
      ?auto_69571 - BLOCK
      ?auto_69572 - BLOCK
      ?auto_69573 - BLOCK
      ?auto_69574 - BLOCK
      ?auto_69575 - BLOCK
      ?auto_69576 - BLOCK
    )
    :vars
    (
      ?auto_69577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69576 ?auto_69577 ) ( ON-TABLE ?auto_69568 ) ( ON ?auto_69569 ?auto_69568 ) ( ON ?auto_69570 ?auto_69569 ) ( ON ?auto_69571 ?auto_69570 ) ( ON ?auto_69572 ?auto_69571 ) ( not ( = ?auto_69568 ?auto_69569 ) ) ( not ( = ?auto_69568 ?auto_69570 ) ) ( not ( = ?auto_69568 ?auto_69571 ) ) ( not ( = ?auto_69568 ?auto_69572 ) ) ( not ( = ?auto_69568 ?auto_69573 ) ) ( not ( = ?auto_69568 ?auto_69574 ) ) ( not ( = ?auto_69568 ?auto_69575 ) ) ( not ( = ?auto_69568 ?auto_69576 ) ) ( not ( = ?auto_69568 ?auto_69577 ) ) ( not ( = ?auto_69569 ?auto_69570 ) ) ( not ( = ?auto_69569 ?auto_69571 ) ) ( not ( = ?auto_69569 ?auto_69572 ) ) ( not ( = ?auto_69569 ?auto_69573 ) ) ( not ( = ?auto_69569 ?auto_69574 ) ) ( not ( = ?auto_69569 ?auto_69575 ) ) ( not ( = ?auto_69569 ?auto_69576 ) ) ( not ( = ?auto_69569 ?auto_69577 ) ) ( not ( = ?auto_69570 ?auto_69571 ) ) ( not ( = ?auto_69570 ?auto_69572 ) ) ( not ( = ?auto_69570 ?auto_69573 ) ) ( not ( = ?auto_69570 ?auto_69574 ) ) ( not ( = ?auto_69570 ?auto_69575 ) ) ( not ( = ?auto_69570 ?auto_69576 ) ) ( not ( = ?auto_69570 ?auto_69577 ) ) ( not ( = ?auto_69571 ?auto_69572 ) ) ( not ( = ?auto_69571 ?auto_69573 ) ) ( not ( = ?auto_69571 ?auto_69574 ) ) ( not ( = ?auto_69571 ?auto_69575 ) ) ( not ( = ?auto_69571 ?auto_69576 ) ) ( not ( = ?auto_69571 ?auto_69577 ) ) ( not ( = ?auto_69572 ?auto_69573 ) ) ( not ( = ?auto_69572 ?auto_69574 ) ) ( not ( = ?auto_69572 ?auto_69575 ) ) ( not ( = ?auto_69572 ?auto_69576 ) ) ( not ( = ?auto_69572 ?auto_69577 ) ) ( not ( = ?auto_69573 ?auto_69574 ) ) ( not ( = ?auto_69573 ?auto_69575 ) ) ( not ( = ?auto_69573 ?auto_69576 ) ) ( not ( = ?auto_69573 ?auto_69577 ) ) ( not ( = ?auto_69574 ?auto_69575 ) ) ( not ( = ?auto_69574 ?auto_69576 ) ) ( not ( = ?auto_69574 ?auto_69577 ) ) ( not ( = ?auto_69575 ?auto_69576 ) ) ( not ( = ?auto_69575 ?auto_69577 ) ) ( not ( = ?auto_69576 ?auto_69577 ) ) ( ON ?auto_69575 ?auto_69576 ) ( ON ?auto_69574 ?auto_69575 ) ( CLEAR ?auto_69572 ) ( ON ?auto_69573 ?auto_69574 ) ( CLEAR ?auto_69573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69568 ?auto_69569 ?auto_69570 ?auto_69571 ?auto_69572 ?auto_69573 )
      ( MAKE-9PILE ?auto_69568 ?auto_69569 ?auto_69570 ?auto_69571 ?auto_69572 ?auto_69573 ?auto_69574 ?auto_69575 ?auto_69576 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_69587 - BLOCK
      ?auto_69588 - BLOCK
      ?auto_69589 - BLOCK
      ?auto_69590 - BLOCK
      ?auto_69591 - BLOCK
      ?auto_69592 - BLOCK
      ?auto_69593 - BLOCK
      ?auto_69594 - BLOCK
      ?auto_69595 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69595 ) ( ON-TABLE ?auto_69587 ) ( ON ?auto_69588 ?auto_69587 ) ( ON ?auto_69589 ?auto_69588 ) ( ON ?auto_69590 ?auto_69589 ) ( ON ?auto_69591 ?auto_69590 ) ( not ( = ?auto_69587 ?auto_69588 ) ) ( not ( = ?auto_69587 ?auto_69589 ) ) ( not ( = ?auto_69587 ?auto_69590 ) ) ( not ( = ?auto_69587 ?auto_69591 ) ) ( not ( = ?auto_69587 ?auto_69592 ) ) ( not ( = ?auto_69587 ?auto_69593 ) ) ( not ( = ?auto_69587 ?auto_69594 ) ) ( not ( = ?auto_69587 ?auto_69595 ) ) ( not ( = ?auto_69588 ?auto_69589 ) ) ( not ( = ?auto_69588 ?auto_69590 ) ) ( not ( = ?auto_69588 ?auto_69591 ) ) ( not ( = ?auto_69588 ?auto_69592 ) ) ( not ( = ?auto_69588 ?auto_69593 ) ) ( not ( = ?auto_69588 ?auto_69594 ) ) ( not ( = ?auto_69588 ?auto_69595 ) ) ( not ( = ?auto_69589 ?auto_69590 ) ) ( not ( = ?auto_69589 ?auto_69591 ) ) ( not ( = ?auto_69589 ?auto_69592 ) ) ( not ( = ?auto_69589 ?auto_69593 ) ) ( not ( = ?auto_69589 ?auto_69594 ) ) ( not ( = ?auto_69589 ?auto_69595 ) ) ( not ( = ?auto_69590 ?auto_69591 ) ) ( not ( = ?auto_69590 ?auto_69592 ) ) ( not ( = ?auto_69590 ?auto_69593 ) ) ( not ( = ?auto_69590 ?auto_69594 ) ) ( not ( = ?auto_69590 ?auto_69595 ) ) ( not ( = ?auto_69591 ?auto_69592 ) ) ( not ( = ?auto_69591 ?auto_69593 ) ) ( not ( = ?auto_69591 ?auto_69594 ) ) ( not ( = ?auto_69591 ?auto_69595 ) ) ( not ( = ?auto_69592 ?auto_69593 ) ) ( not ( = ?auto_69592 ?auto_69594 ) ) ( not ( = ?auto_69592 ?auto_69595 ) ) ( not ( = ?auto_69593 ?auto_69594 ) ) ( not ( = ?auto_69593 ?auto_69595 ) ) ( not ( = ?auto_69594 ?auto_69595 ) ) ( ON ?auto_69594 ?auto_69595 ) ( ON ?auto_69593 ?auto_69594 ) ( CLEAR ?auto_69591 ) ( ON ?auto_69592 ?auto_69593 ) ( CLEAR ?auto_69592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69587 ?auto_69588 ?auto_69589 ?auto_69590 ?auto_69591 ?auto_69592 )
      ( MAKE-9PILE ?auto_69587 ?auto_69588 ?auto_69589 ?auto_69590 ?auto_69591 ?auto_69592 ?auto_69593 ?auto_69594 ?auto_69595 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_69605 - BLOCK
      ?auto_69606 - BLOCK
      ?auto_69607 - BLOCK
      ?auto_69608 - BLOCK
      ?auto_69609 - BLOCK
      ?auto_69610 - BLOCK
      ?auto_69611 - BLOCK
      ?auto_69612 - BLOCK
      ?auto_69613 - BLOCK
    )
    :vars
    (
      ?auto_69614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69613 ?auto_69614 ) ( ON-TABLE ?auto_69605 ) ( ON ?auto_69606 ?auto_69605 ) ( ON ?auto_69607 ?auto_69606 ) ( ON ?auto_69608 ?auto_69607 ) ( not ( = ?auto_69605 ?auto_69606 ) ) ( not ( = ?auto_69605 ?auto_69607 ) ) ( not ( = ?auto_69605 ?auto_69608 ) ) ( not ( = ?auto_69605 ?auto_69609 ) ) ( not ( = ?auto_69605 ?auto_69610 ) ) ( not ( = ?auto_69605 ?auto_69611 ) ) ( not ( = ?auto_69605 ?auto_69612 ) ) ( not ( = ?auto_69605 ?auto_69613 ) ) ( not ( = ?auto_69605 ?auto_69614 ) ) ( not ( = ?auto_69606 ?auto_69607 ) ) ( not ( = ?auto_69606 ?auto_69608 ) ) ( not ( = ?auto_69606 ?auto_69609 ) ) ( not ( = ?auto_69606 ?auto_69610 ) ) ( not ( = ?auto_69606 ?auto_69611 ) ) ( not ( = ?auto_69606 ?auto_69612 ) ) ( not ( = ?auto_69606 ?auto_69613 ) ) ( not ( = ?auto_69606 ?auto_69614 ) ) ( not ( = ?auto_69607 ?auto_69608 ) ) ( not ( = ?auto_69607 ?auto_69609 ) ) ( not ( = ?auto_69607 ?auto_69610 ) ) ( not ( = ?auto_69607 ?auto_69611 ) ) ( not ( = ?auto_69607 ?auto_69612 ) ) ( not ( = ?auto_69607 ?auto_69613 ) ) ( not ( = ?auto_69607 ?auto_69614 ) ) ( not ( = ?auto_69608 ?auto_69609 ) ) ( not ( = ?auto_69608 ?auto_69610 ) ) ( not ( = ?auto_69608 ?auto_69611 ) ) ( not ( = ?auto_69608 ?auto_69612 ) ) ( not ( = ?auto_69608 ?auto_69613 ) ) ( not ( = ?auto_69608 ?auto_69614 ) ) ( not ( = ?auto_69609 ?auto_69610 ) ) ( not ( = ?auto_69609 ?auto_69611 ) ) ( not ( = ?auto_69609 ?auto_69612 ) ) ( not ( = ?auto_69609 ?auto_69613 ) ) ( not ( = ?auto_69609 ?auto_69614 ) ) ( not ( = ?auto_69610 ?auto_69611 ) ) ( not ( = ?auto_69610 ?auto_69612 ) ) ( not ( = ?auto_69610 ?auto_69613 ) ) ( not ( = ?auto_69610 ?auto_69614 ) ) ( not ( = ?auto_69611 ?auto_69612 ) ) ( not ( = ?auto_69611 ?auto_69613 ) ) ( not ( = ?auto_69611 ?auto_69614 ) ) ( not ( = ?auto_69612 ?auto_69613 ) ) ( not ( = ?auto_69612 ?auto_69614 ) ) ( not ( = ?auto_69613 ?auto_69614 ) ) ( ON ?auto_69612 ?auto_69613 ) ( ON ?auto_69611 ?auto_69612 ) ( ON ?auto_69610 ?auto_69611 ) ( CLEAR ?auto_69608 ) ( ON ?auto_69609 ?auto_69610 ) ( CLEAR ?auto_69609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69605 ?auto_69606 ?auto_69607 ?auto_69608 ?auto_69609 )
      ( MAKE-9PILE ?auto_69605 ?auto_69606 ?auto_69607 ?auto_69608 ?auto_69609 ?auto_69610 ?auto_69611 ?auto_69612 ?auto_69613 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_69624 - BLOCK
      ?auto_69625 - BLOCK
      ?auto_69626 - BLOCK
      ?auto_69627 - BLOCK
      ?auto_69628 - BLOCK
      ?auto_69629 - BLOCK
      ?auto_69630 - BLOCK
      ?auto_69631 - BLOCK
      ?auto_69632 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69632 ) ( ON-TABLE ?auto_69624 ) ( ON ?auto_69625 ?auto_69624 ) ( ON ?auto_69626 ?auto_69625 ) ( ON ?auto_69627 ?auto_69626 ) ( not ( = ?auto_69624 ?auto_69625 ) ) ( not ( = ?auto_69624 ?auto_69626 ) ) ( not ( = ?auto_69624 ?auto_69627 ) ) ( not ( = ?auto_69624 ?auto_69628 ) ) ( not ( = ?auto_69624 ?auto_69629 ) ) ( not ( = ?auto_69624 ?auto_69630 ) ) ( not ( = ?auto_69624 ?auto_69631 ) ) ( not ( = ?auto_69624 ?auto_69632 ) ) ( not ( = ?auto_69625 ?auto_69626 ) ) ( not ( = ?auto_69625 ?auto_69627 ) ) ( not ( = ?auto_69625 ?auto_69628 ) ) ( not ( = ?auto_69625 ?auto_69629 ) ) ( not ( = ?auto_69625 ?auto_69630 ) ) ( not ( = ?auto_69625 ?auto_69631 ) ) ( not ( = ?auto_69625 ?auto_69632 ) ) ( not ( = ?auto_69626 ?auto_69627 ) ) ( not ( = ?auto_69626 ?auto_69628 ) ) ( not ( = ?auto_69626 ?auto_69629 ) ) ( not ( = ?auto_69626 ?auto_69630 ) ) ( not ( = ?auto_69626 ?auto_69631 ) ) ( not ( = ?auto_69626 ?auto_69632 ) ) ( not ( = ?auto_69627 ?auto_69628 ) ) ( not ( = ?auto_69627 ?auto_69629 ) ) ( not ( = ?auto_69627 ?auto_69630 ) ) ( not ( = ?auto_69627 ?auto_69631 ) ) ( not ( = ?auto_69627 ?auto_69632 ) ) ( not ( = ?auto_69628 ?auto_69629 ) ) ( not ( = ?auto_69628 ?auto_69630 ) ) ( not ( = ?auto_69628 ?auto_69631 ) ) ( not ( = ?auto_69628 ?auto_69632 ) ) ( not ( = ?auto_69629 ?auto_69630 ) ) ( not ( = ?auto_69629 ?auto_69631 ) ) ( not ( = ?auto_69629 ?auto_69632 ) ) ( not ( = ?auto_69630 ?auto_69631 ) ) ( not ( = ?auto_69630 ?auto_69632 ) ) ( not ( = ?auto_69631 ?auto_69632 ) ) ( ON ?auto_69631 ?auto_69632 ) ( ON ?auto_69630 ?auto_69631 ) ( ON ?auto_69629 ?auto_69630 ) ( CLEAR ?auto_69627 ) ( ON ?auto_69628 ?auto_69629 ) ( CLEAR ?auto_69628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69624 ?auto_69625 ?auto_69626 ?auto_69627 ?auto_69628 )
      ( MAKE-9PILE ?auto_69624 ?auto_69625 ?auto_69626 ?auto_69627 ?auto_69628 ?auto_69629 ?auto_69630 ?auto_69631 ?auto_69632 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_69642 - BLOCK
      ?auto_69643 - BLOCK
      ?auto_69644 - BLOCK
      ?auto_69645 - BLOCK
      ?auto_69646 - BLOCK
      ?auto_69647 - BLOCK
      ?auto_69648 - BLOCK
      ?auto_69649 - BLOCK
      ?auto_69650 - BLOCK
    )
    :vars
    (
      ?auto_69651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69650 ?auto_69651 ) ( ON-TABLE ?auto_69642 ) ( ON ?auto_69643 ?auto_69642 ) ( ON ?auto_69644 ?auto_69643 ) ( not ( = ?auto_69642 ?auto_69643 ) ) ( not ( = ?auto_69642 ?auto_69644 ) ) ( not ( = ?auto_69642 ?auto_69645 ) ) ( not ( = ?auto_69642 ?auto_69646 ) ) ( not ( = ?auto_69642 ?auto_69647 ) ) ( not ( = ?auto_69642 ?auto_69648 ) ) ( not ( = ?auto_69642 ?auto_69649 ) ) ( not ( = ?auto_69642 ?auto_69650 ) ) ( not ( = ?auto_69642 ?auto_69651 ) ) ( not ( = ?auto_69643 ?auto_69644 ) ) ( not ( = ?auto_69643 ?auto_69645 ) ) ( not ( = ?auto_69643 ?auto_69646 ) ) ( not ( = ?auto_69643 ?auto_69647 ) ) ( not ( = ?auto_69643 ?auto_69648 ) ) ( not ( = ?auto_69643 ?auto_69649 ) ) ( not ( = ?auto_69643 ?auto_69650 ) ) ( not ( = ?auto_69643 ?auto_69651 ) ) ( not ( = ?auto_69644 ?auto_69645 ) ) ( not ( = ?auto_69644 ?auto_69646 ) ) ( not ( = ?auto_69644 ?auto_69647 ) ) ( not ( = ?auto_69644 ?auto_69648 ) ) ( not ( = ?auto_69644 ?auto_69649 ) ) ( not ( = ?auto_69644 ?auto_69650 ) ) ( not ( = ?auto_69644 ?auto_69651 ) ) ( not ( = ?auto_69645 ?auto_69646 ) ) ( not ( = ?auto_69645 ?auto_69647 ) ) ( not ( = ?auto_69645 ?auto_69648 ) ) ( not ( = ?auto_69645 ?auto_69649 ) ) ( not ( = ?auto_69645 ?auto_69650 ) ) ( not ( = ?auto_69645 ?auto_69651 ) ) ( not ( = ?auto_69646 ?auto_69647 ) ) ( not ( = ?auto_69646 ?auto_69648 ) ) ( not ( = ?auto_69646 ?auto_69649 ) ) ( not ( = ?auto_69646 ?auto_69650 ) ) ( not ( = ?auto_69646 ?auto_69651 ) ) ( not ( = ?auto_69647 ?auto_69648 ) ) ( not ( = ?auto_69647 ?auto_69649 ) ) ( not ( = ?auto_69647 ?auto_69650 ) ) ( not ( = ?auto_69647 ?auto_69651 ) ) ( not ( = ?auto_69648 ?auto_69649 ) ) ( not ( = ?auto_69648 ?auto_69650 ) ) ( not ( = ?auto_69648 ?auto_69651 ) ) ( not ( = ?auto_69649 ?auto_69650 ) ) ( not ( = ?auto_69649 ?auto_69651 ) ) ( not ( = ?auto_69650 ?auto_69651 ) ) ( ON ?auto_69649 ?auto_69650 ) ( ON ?auto_69648 ?auto_69649 ) ( ON ?auto_69647 ?auto_69648 ) ( ON ?auto_69646 ?auto_69647 ) ( CLEAR ?auto_69644 ) ( ON ?auto_69645 ?auto_69646 ) ( CLEAR ?auto_69645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69642 ?auto_69643 ?auto_69644 ?auto_69645 )
      ( MAKE-9PILE ?auto_69642 ?auto_69643 ?auto_69644 ?auto_69645 ?auto_69646 ?auto_69647 ?auto_69648 ?auto_69649 ?auto_69650 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_69661 - BLOCK
      ?auto_69662 - BLOCK
      ?auto_69663 - BLOCK
      ?auto_69664 - BLOCK
      ?auto_69665 - BLOCK
      ?auto_69666 - BLOCK
      ?auto_69667 - BLOCK
      ?auto_69668 - BLOCK
      ?auto_69669 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69669 ) ( ON-TABLE ?auto_69661 ) ( ON ?auto_69662 ?auto_69661 ) ( ON ?auto_69663 ?auto_69662 ) ( not ( = ?auto_69661 ?auto_69662 ) ) ( not ( = ?auto_69661 ?auto_69663 ) ) ( not ( = ?auto_69661 ?auto_69664 ) ) ( not ( = ?auto_69661 ?auto_69665 ) ) ( not ( = ?auto_69661 ?auto_69666 ) ) ( not ( = ?auto_69661 ?auto_69667 ) ) ( not ( = ?auto_69661 ?auto_69668 ) ) ( not ( = ?auto_69661 ?auto_69669 ) ) ( not ( = ?auto_69662 ?auto_69663 ) ) ( not ( = ?auto_69662 ?auto_69664 ) ) ( not ( = ?auto_69662 ?auto_69665 ) ) ( not ( = ?auto_69662 ?auto_69666 ) ) ( not ( = ?auto_69662 ?auto_69667 ) ) ( not ( = ?auto_69662 ?auto_69668 ) ) ( not ( = ?auto_69662 ?auto_69669 ) ) ( not ( = ?auto_69663 ?auto_69664 ) ) ( not ( = ?auto_69663 ?auto_69665 ) ) ( not ( = ?auto_69663 ?auto_69666 ) ) ( not ( = ?auto_69663 ?auto_69667 ) ) ( not ( = ?auto_69663 ?auto_69668 ) ) ( not ( = ?auto_69663 ?auto_69669 ) ) ( not ( = ?auto_69664 ?auto_69665 ) ) ( not ( = ?auto_69664 ?auto_69666 ) ) ( not ( = ?auto_69664 ?auto_69667 ) ) ( not ( = ?auto_69664 ?auto_69668 ) ) ( not ( = ?auto_69664 ?auto_69669 ) ) ( not ( = ?auto_69665 ?auto_69666 ) ) ( not ( = ?auto_69665 ?auto_69667 ) ) ( not ( = ?auto_69665 ?auto_69668 ) ) ( not ( = ?auto_69665 ?auto_69669 ) ) ( not ( = ?auto_69666 ?auto_69667 ) ) ( not ( = ?auto_69666 ?auto_69668 ) ) ( not ( = ?auto_69666 ?auto_69669 ) ) ( not ( = ?auto_69667 ?auto_69668 ) ) ( not ( = ?auto_69667 ?auto_69669 ) ) ( not ( = ?auto_69668 ?auto_69669 ) ) ( ON ?auto_69668 ?auto_69669 ) ( ON ?auto_69667 ?auto_69668 ) ( ON ?auto_69666 ?auto_69667 ) ( ON ?auto_69665 ?auto_69666 ) ( CLEAR ?auto_69663 ) ( ON ?auto_69664 ?auto_69665 ) ( CLEAR ?auto_69664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69661 ?auto_69662 ?auto_69663 ?auto_69664 )
      ( MAKE-9PILE ?auto_69661 ?auto_69662 ?auto_69663 ?auto_69664 ?auto_69665 ?auto_69666 ?auto_69667 ?auto_69668 ?auto_69669 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_69679 - BLOCK
      ?auto_69680 - BLOCK
      ?auto_69681 - BLOCK
      ?auto_69682 - BLOCK
      ?auto_69683 - BLOCK
      ?auto_69684 - BLOCK
      ?auto_69685 - BLOCK
      ?auto_69686 - BLOCK
      ?auto_69687 - BLOCK
    )
    :vars
    (
      ?auto_69688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69687 ?auto_69688 ) ( ON-TABLE ?auto_69679 ) ( ON ?auto_69680 ?auto_69679 ) ( not ( = ?auto_69679 ?auto_69680 ) ) ( not ( = ?auto_69679 ?auto_69681 ) ) ( not ( = ?auto_69679 ?auto_69682 ) ) ( not ( = ?auto_69679 ?auto_69683 ) ) ( not ( = ?auto_69679 ?auto_69684 ) ) ( not ( = ?auto_69679 ?auto_69685 ) ) ( not ( = ?auto_69679 ?auto_69686 ) ) ( not ( = ?auto_69679 ?auto_69687 ) ) ( not ( = ?auto_69679 ?auto_69688 ) ) ( not ( = ?auto_69680 ?auto_69681 ) ) ( not ( = ?auto_69680 ?auto_69682 ) ) ( not ( = ?auto_69680 ?auto_69683 ) ) ( not ( = ?auto_69680 ?auto_69684 ) ) ( not ( = ?auto_69680 ?auto_69685 ) ) ( not ( = ?auto_69680 ?auto_69686 ) ) ( not ( = ?auto_69680 ?auto_69687 ) ) ( not ( = ?auto_69680 ?auto_69688 ) ) ( not ( = ?auto_69681 ?auto_69682 ) ) ( not ( = ?auto_69681 ?auto_69683 ) ) ( not ( = ?auto_69681 ?auto_69684 ) ) ( not ( = ?auto_69681 ?auto_69685 ) ) ( not ( = ?auto_69681 ?auto_69686 ) ) ( not ( = ?auto_69681 ?auto_69687 ) ) ( not ( = ?auto_69681 ?auto_69688 ) ) ( not ( = ?auto_69682 ?auto_69683 ) ) ( not ( = ?auto_69682 ?auto_69684 ) ) ( not ( = ?auto_69682 ?auto_69685 ) ) ( not ( = ?auto_69682 ?auto_69686 ) ) ( not ( = ?auto_69682 ?auto_69687 ) ) ( not ( = ?auto_69682 ?auto_69688 ) ) ( not ( = ?auto_69683 ?auto_69684 ) ) ( not ( = ?auto_69683 ?auto_69685 ) ) ( not ( = ?auto_69683 ?auto_69686 ) ) ( not ( = ?auto_69683 ?auto_69687 ) ) ( not ( = ?auto_69683 ?auto_69688 ) ) ( not ( = ?auto_69684 ?auto_69685 ) ) ( not ( = ?auto_69684 ?auto_69686 ) ) ( not ( = ?auto_69684 ?auto_69687 ) ) ( not ( = ?auto_69684 ?auto_69688 ) ) ( not ( = ?auto_69685 ?auto_69686 ) ) ( not ( = ?auto_69685 ?auto_69687 ) ) ( not ( = ?auto_69685 ?auto_69688 ) ) ( not ( = ?auto_69686 ?auto_69687 ) ) ( not ( = ?auto_69686 ?auto_69688 ) ) ( not ( = ?auto_69687 ?auto_69688 ) ) ( ON ?auto_69686 ?auto_69687 ) ( ON ?auto_69685 ?auto_69686 ) ( ON ?auto_69684 ?auto_69685 ) ( ON ?auto_69683 ?auto_69684 ) ( ON ?auto_69682 ?auto_69683 ) ( CLEAR ?auto_69680 ) ( ON ?auto_69681 ?auto_69682 ) ( CLEAR ?auto_69681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69679 ?auto_69680 ?auto_69681 )
      ( MAKE-9PILE ?auto_69679 ?auto_69680 ?auto_69681 ?auto_69682 ?auto_69683 ?auto_69684 ?auto_69685 ?auto_69686 ?auto_69687 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_69698 - BLOCK
      ?auto_69699 - BLOCK
      ?auto_69700 - BLOCK
      ?auto_69701 - BLOCK
      ?auto_69702 - BLOCK
      ?auto_69703 - BLOCK
      ?auto_69704 - BLOCK
      ?auto_69705 - BLOCK
      ?auto_69706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69706 ) ( ON-TABLE ?auto_69698 ) ( ON ?auto_69699 ?auto_69698 ) ( not ( = ?auto_69698 ?auto_69699 ) ) ( not ( = ?auto_69698 ?auto_69700 ) ) ( not ( = ?auto_69698 ?auto_69701 ) ) ( not ( = ?auto_69698 ?auto_69702 ) ) ( not ( = ?auto_69698 ?auto_69703 ) ) ( not ( = ?auto_69698 ?auto_69704 ) ) ( not ( = ?auto_69698 ?auto_69705 ) ) ( not ( = ?auto_69698 ?auto_69706 ) ) ( not ( = ?auto_69699 ?auto_69700 ) ) ( not ( = ?auto_69699 ?auto_69701 ) ) ( not ( = ?auto_69699 ?auto_69702 ) ) ( not ( = ?auto_69699 ?auto_69703 ) ) ( not ( = ?auto_69699 ?auto_69704 ) ) ( not ( = ?auto_69699 ?auto_69705 ) ) ( not ( = ?auto_69699 ?auto_69706 ) ) ( not ( = ?auto_69700 ?auto_69701 ) ) ( not ( = ?auto_69700 ?auto_69702 ) ) ( not ( = ?auto_69700 ?auto_69703 ) ) ( not ( = ?auto_69700 ?auto_69704 ) ) ( not ( = ?auto_69700 ?auto_69705 ) ) ( not ( = ?auto_69700 ?auto_69706 ) ) ( not ( = ?auto_69701 ?auto_69702 ) ) ( not ( = ?auto_69701 ?auto_69703 ) ) ( not ( = ?auto_69701 ?auto_69704 ) ) ( not ( = ?auto_69701 ?auto_69705 ) ) ( not ( = ?auto_69701 ?auto_69706 ) ) ( not ( = ?auto_69702 ?auto_69703 ) ) ( not ( = ?auto_69702 ?auto_69704 ) ) ( not ( = ?auto_69702 ?auto_69705 ) ) ( not ( = ?auto_69702 ?auto_69706 ) ) ( not ( = ?auto_69703 ?auto_69704 ) ) ( not ( = ?auto_69703 ?auto_69705 ) ) ( not ( = ?auto_69703 ?auto_69706 ) ) ( not ( = ?auto_69704 ?auto_69705 ) ) ( not ( = ?auto_69704 ?auto_69706 ) ) ( not ( = ?auto_69705 ?auto_69706 ) ) ( ON ?auto_69705 ?auto_69706 ) ( ON ?auto_69704 ?auto_69705 ) ( ON ?auto_69703 ?auto_69704 ) ( ON ?auto_69702 ?auto_69703 ) ( ON ?auto_69701 ?auto_69702 ) ( CLEAR ?auto_69699 ) ( ON ?auto_69700 ?auto_69701 ) ( CLEAR ?auto_69700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69698 ?auto_69699 ?auto_69700 )
      ( MAKE-9PILE ?auto_69698 ?auto_69699 ?auto_69700 ?auto_69701 ?auto_69702 ?auto_69703 ?auto_69704 ?auto_69705 ?auto_69706 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_69716 - BLOCK
      ?auto_69717 - BLOCK
      ?auto_69718 - BLOCK
      ?auto_69719 - BLOCK
      ?auto_69720 - BLOCK
      ?auto_69721 - BLOCK
      ?auto_69722 - BLOCK
      ?auto_69723 - BLOCK
      ?auto_69724 - BLOCK
    )
    :vars
    (
      ?auto_69725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69724 ?auto_69725 ) ( ON-TABLE ?auto_69716 ) ( not ( = ?auto_69716 ?auto_69717 ) ) ( not ( = ?auto_69716 ?auto_69718 ) ) ( not ( = ?auto_69716 ?auto_69719 ) ) ( not ( = ?auto_69716 ?auto_69720 ) ) ( not ( = ?auto_69716 ?auto_69721 ) ) ( not ( = ?auto_69716 ?auto_69722 ) ) ( not ( = ?auto_69716 ?auto_69723 ) ) ( not ( = ?auto_69716 ?auto_69724 ) ) ( not ( = ?auto_69716 ?auto_69725 ) ) ( not ( = ?auto_69717 ?auto_69718 ) ) ( not ( = ?auto_69717 ?auto_69719 ) ) ( not ( = ?auto_69717 ?auto_69720 ) ) ( not ( = ?auto_69717 ?auto_69721 ) ) ( not ( = ?auto_69717 ?auto_69722 ) ) ( not ( = ?auto_69717 ?auto_69723 ) ) ( not ( = ?auto_69717 ?auto_69724 ) ) ( not ( = ?auto_69717 ?auto_69725 ) ) ( not ( = ?auto_69718 ?auto_69719 ) ) ( not ( = ?auto_69718 ?auto_69720 ) ) ( not ( = ?auto_69718 ?auto_69721 ) ) ( not ( = ?auto_69718 ?auto_69722 ) ) ( not ( = ?auto_69718 ?auto_69723 ) ) ( not ( = ?auto_69718 ?auto_69724 ) ) ( not ( = ?auto_69718 ?auto_69725 ) ) ( not ( = ?auto_69719 ?auto_69720 ) ) ( not ( = ?auto_69719 ?auto_69721 ) ) ( not ( = ?auto_69719 ?auto_69722 ) ) ( not ( = ?auto_69719 ?auto_69723 ) ) ( not ( = ?auto_69719 ?auto_69724 ) ) ( not ( = ?auto_69719 ?auto_69725 ) ) ( not ( = ?auto_69720 ?auto_69721 ) ) ( not ( = ?auto_69720 ?auto_69722 ) ) ( not ( = ?auto_69720 ?auto_69723 ) ) ( not ( = ?auto_69720 ?auto_69724 ) ) ( not ( = ?auto_69720 ?auto_69725 ) ) ( not ( = ?auto_69721 ?auto_69722 ) ) ( not ( = ?auto_69721 ?auto_69723 ) ) ( not ( = ?auto_69721 ?auto_69724 ) ) ( not ( = ?auto_69721 ?auto_69725 ) ) ( not ( = ?auto_69722 ?auto_69723 ) ) ( not ( = ?auto_69722 ?auto_69724 ) ) ( not ( = ?auto_69722 ?auto_69725 ) ) ( not ( = ?auto_69723 ?auto_69724 ) ) ( not ( = ?auto_69723 ?auto_69725 ) ) ( not ( = ?auto_69724 ?auto_69725 ) ) ( ON ?auto_69723 ?auto_69724 ) ( ON ?auto_69722 ?auto_69723 ) ( ON ?auto_69721 ?auto_69722 ) ( ON ?auto_69720 ?auto_69721 ) ( ON ?auto_69719 ?auto_69720 ) ( ON ?auto_69718 ?auto_69719 ) ( CLEAR ?auto_69716 ) ( ON ?auto_69717 ?auto_69718 ) ( CLEAR ?auto_69717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69716 ?auto_69717 )
      ( MAKE-9PILE ?auto_69716 ?auto_69717 ?auto_69718 ?auto_69719 ?auto_69720 ?auto_69721 ?auto_69722 ?auto_69723 ?auto_69724 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_69735 - BLOCK
      ?auto_69736 - BLOCK
      ?auto_69737 - BLOCK
      ?auto_69738 - BLOCK
      ?auto_69739 - BLOCK
      ?auto_69740 - BLOCK
      ?auto_69741 - BLOCK
      ?auto_69742 - BLOCK
      ?auto_69743 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69743 ) ( ON-TABLE ?auto_69735 ) ( not ( = ?auto_69735 ?auto_69736 ) ) ( not ( = ?auto_69735 ?auto_69737 ) ) ( not ( = ?auto_69735 ?auto_69738 ) ) ( not ( = ?auto_69735 ?auto_69739 ) ) ( not ( = ?auto_69735 ?auto_69740 ) ) ( not ( = ?auto_69735 ?auto_69741 ) ) ( not ( = ?auto_69735 ?auto_69742 ) ) ( not ( = ?auto_69735 ?auto_69743 ) ) ( not ( = ?auto_69736 ?auto_69737 ) ) ( not ( = ?auto_69736 ?auto_69738 ) ) ( not ( = ?auto_69736 ?auto_69739 ) ) ( not ( = ?auto_69736 ?auto_69740 ) ) ( not ( = ?auto_69736 ?auto_69741 ) ) ( not ( = ?auto_69736 ?auto_69742 ) ) ( not ( = ?auto_69736 ?auto_69743 ) ) ( not ( = ?auto_69737 ?auto_69738 ) ) ( not ( = ?auto_69737 ?auto_69739 ) ) ( not ( = ?auto_69737 ?auto_69740 ) ) ( not ( = ?auto_69737 ?auto_69741 ) ) ( not ( = ?auto_69737 ?auto_69742 ) ) ( not ( = ?auto_69737 ?auto_69743 ) ) ( not ( = ?auto_69738 ?auto_69739 ) ) ( not ( = ?auto_69738 ?auto_69740 ) ) ( not ( = ?auto_69738 ?auto_69741 ) ) ( not ( = ?auto_69738 ?auto_69742 ) ) ( not ( = ?auto_69738 ?auto_69743 ) ) ( not ( = ?auto_69739 ?auto_69740 ) ) ( not ( = ?auto_69739 ?auto_69741 ) ) ( not ( = ?auto_69739 ?auto_69742 ) ) ( not ( = ?auto_69739 ?auto_69743 ) ) ( not ( = ?auto_69740 ?auto_69741 ) ) ( not ( = ?auto_69740 ?auto_69742 ) ) ( not ( = ?auto_69740 ?auto_69743 ) ) ( not ( = ?auto_69741 ?auto_69742 ) ) ( not ( = ?auto_69741 ?auto_69743 ) ) ( not ( = ?auto_69742 ?auto_69743 ) ) ( ON ?auto_69742 ?auto_69743 ) ( ON ?auto_69741 ?auto_69742 ) ( ON ?auto_69740 ?auto_69741 ) ( ON ?auto_69739 ?auto_69740 ) ( ON ?auto_69738 ?auto_69739 ) ( ON ?auto_69737 ?auto_69738 ) ( CLEAR ?auto_69735 ) ( ON ?auto_69736 ?auto_69737 ) ( CLEAR ?auto_69736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69735 ?auto_69736 )
      ( MAKE-9PILE ?auto_69735 ?auto_69736 ?auto_69737 ?auto_69738 ?auto_69739 ?auto_69740 ?auto_69741 ?auto_69742 ?auto_69743 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_69753 - BLOCK
      ?auto_69754 - BLOCK
      ?auto_69755 - BLOCK
      ?auto_69756 - BLOCK
      ?auto_69757 - BLOCK
      ?auto_69758 - BLOCK
      ?auto_69759 - BLOCK
      ?auto_69760 - BLOCK
      ?auto_69761 - BLOCK
    )
    :vars
    (
      ?auto_69762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69761 ?auto_69762 ) ( not ( = ?auto_69753 ?auto_69754 ) ) ( not ( = ?auto_69753 ?auto_69755 ) ) ( not ( = ?auto_69753 ?auto_69756 ) ) ( not ( = ?auto_69753 ?auto_69757 ) ) ( not ( = ?auto_69753 ?auto_69758 ) ) ( not ( = ?auto_69753 ?auto_69759 ) ) ( not ( = ?auto_69753 ?auto_69760 ) ) ( not ( = ?auto_69753 ?auto_69761 ) ) ( not ( = ?auto_69753 ?auto_69762 ) ) ( not ( = ?auto_69754 ?auto_69755 ) ) ( not ( = ?auto_69754 ?auto_69756 ) ) ( not ( = ?auto_69754 ?auto_69757 ) ) ( not ( = ?auto_69754 ?auto_69758 ) ) ( not ( = ?auto_69754 ?auto_69759 ) ) ( not ( = ?auto_69754 ?auto_69760 ) ) ( not ( = ?auto_69754 ?auto_69761 ) ) ( not ( = ?auto_69754 ?auto_69762 ) ) ( not ( = ?auto_69755 ?auto_69756 ) ) ( not ( = ?auto_69755 ?auto_69757 ) ) ( not ( = ?auto_69755 ?auto_69758 ) ) ( not ( = ?auto_69755 ?auto_69759 ) ) ( not ( = ?auto_69755 ?auto_69760 ) ) ( not ( = ?auto_69755 ?auto_69761 ) ) ( not ( = ?auto_69755 ?auto_69762 ) ) ( not ( = ?auto_69756 ?auto_69757 ) ) ( not ( = ?auto_69756 ?auto_69758 ) ) ( not ( = ?auto_69756 ?auto_69759 ) ) ( not ( = ?auto_69756 ?auto_69760 ) ) ( not ( = ?auto_69756 ?auto_69761 ) ) ( not ( = ?auto_69756 ?auto_69762 ) ) ( not ( = ?auto_69757 ?auto_69758 ) ) ( not ( = ?auto_69757 ?auto_69759 ) ) ( not ( = ?auto_69757 ?auto_69760 ) ) ( not ( = ?auto_69757 ?auto_69761 ) ) ( not ( = ?auto_69757 ?auto_69762 ) ) ( not ( = ?auto_69758 ?auto_69759 ) ) ( not ( = ?auto_69758 ?auto_69760 ) ) ( not ( = ?auto_69758 ?auto_69761 ) ) ( not ( = ?auto_69758 ?auto_69762 ) ) ( not ( = ?auto_69759 ?auto_69760 ) ) ( not ( = ?auto_69759 ?auto_69761 ) ) ( not ( = ?auto_69759 ?auto_69762 ) ) ( not ( = ?auto_69760 ?auto_69761 ) ) ( not ( = ?auto_69760 ?auto_69762 ) ) ( not ( = ?auto_69761 ?auto_69762 ) ) ( ON ?auto_69760 ?auto_69761 ) ( ON ?auto_69759 ?auto_69760 ) ( ON ?auto_69758 ?auto_69759 ) ( ON ?auto_69757 ?auto_69758 ) ( ON ?auto_69756 ?auto_69757 ) ( ON ?auto_69755 ?auto_69756 ) ( ON ?auto_69754 ?auto_69755 ) ( ON ?auto_69753 ?auto_69754 ) ( CLEAR ?auto_69753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69753 )
      ( MAKE-9PILE ?auto_69753 ?auto_69754 ?auto_69755 ?auto_69756 ?auto_69757 ?auto_69758 ?auto_69759 ?auto_69760 ?auto_69761 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_69772 - BLOCK
      ?auto_69773 - BLOCK
      ?auto_69774 - BLOCK
      ?auto_69775 - BLOCK
      ?auto_69776 - BLOCK
      ?auto_69777 - BLOCK
      ?auto_69778 - BLOCK
      ?auto_69779 - BLOCK
      ?auto_69780 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69780 ) ( not ( = ?auto_69772 ?auto_69773 ) ) ( not ( = ?auto_69772 ?auto_69774 ) ) ( not ( = ?auto_69772 ?auto_69775 ) ) ( not ( = ?auto_69772 ?auto_69776 ) ) ( not ( = ?auto_69772 ?auto_69777 ) ) ( not ( = ?auto_69772 ?auto_69778 ) ) ( not ( = ?auto_69772 ?auto_69779 ) ) ( not ( = ?auto_69772 ?auto_69780 ) ) ( not ( = ?auto_69773 ?auto_69774 ) ) ( not ( = ?auto_69773 ?auto_69775 ) ) ( not ( = ?auto_69773 ?auto_69776 ) ) ( not ( = ?auto_69773 ?auto_69777 ) ) ( not ( = ?auto_69773 ?auto_69778 ) ) ( not ( = ?auto_69773 ?auto_69779 ) ) ( not ( = ?auto_69773 ?auto_69780 ) ) ( not ( = ?auto_69774 ?auto_69775 ) ) ( not ( = ?auto_69774 ?auto_69776 ) ) ( not ( = ?auto_69774 ?auto_69777 ) ) ( not ( = ?auto_69774 ?auto_69778 ) ) ( not ( = ?auto_69774 ?auto_69779 ) ) ( not ( = ?auto_69774 ?auto_69780 ) ) ( not ( = ?auto_69775 ?auto_69776 ) ) ( not ( = ?auto_69775 ?auto_69777 ) ) ( not ( = ?auto_69775 ?auto_69778 ) ) ( not ( = ?auto_69775 ?auto_69779 ) ) ( not ( = ?auto_69775 ?auto_69780 ) ) ( not ( = ?auto_69776 ?auto_69777 ) ) ( not ( = ?auto_69776 ?auto_69778 ) ) ( not ( = ?auto_69776 ?auto_69779 ) ) ( not ( = ?auto_69776 ?auto_69780 ) ) ( not ( = ?auto_69777 ?auto_69778 ) ) ( not ( = ?auto_69777 ?auto_69779 ) ) ( not ( = ?auto_69777 ?auto_69780 ) ) ( not ( = ?auto_69778 ?auto_69779 ) ) ( not ( = ?auto_69778 ?auto_69780 ) ) ( not ( = ?auto_69779 ?auto_69780 ) ) ( ON ?auto_69779 ?auto_69780 ) ( ON ?auto_69778 ?auto_69779 ) ( ON ?auto_69777 ?auto_69778 ) ( ON ?auto_69776 ?auto_69777 ) ( ON ?auto_69775 ?auto_69776 ) ( ON ?auto_69774 ?auto_69775 ) ( ON ?auto_69773 ?auto_69774 ) ( ON ?auto_69772 ?auto_69773 ) ( CLEAR ?auto_69772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69772 )
      ( MAKE-9PILE ?auto_69772 ?auto_69773 ?auto_69774 ?auto_69775 ?auto_69776 ?auto_69777 ?auto_69778 ?auto_69779 ?auto_69780 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_69790 - BLOCK
      ?auto_69791 - BLOCK
      ?auto_69792 - BLOCK
      ?auto_69793 - BLOCK
      ?auto_69794 - BLOCK
      ?auto_69795 - BLOCK
      ?auto_69796 - BLOCK
      ?auto_69797 - BLOCK
      ?auto_69798 - BLOCK
    )
    :vars
    (
      ?auto_69799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69790 ?auto_69791 ) ) ( not ( = ?auto_69790 ?auto_69792 ) ) ( not ( = ?auto_69790 ?auto_69793 ) ) ( not ( = ?auto_69790 ?auto_69794 ) ) ( not ( = ?auto_69790 ?auto_69795 ) ) ( not ( = ?auto_69790 ?auto_69796 ) ) ( not ( = ?auto_69790 ?auto_69797 ) ) ( not ( = ?auto_69790 ?auto_69798 ) ) ( not ( = ?auto_69791 ?auto_69792 ) ) ( not ( = ?auto_69791 ?auto_69793 ) ) ( not ( = ?auto_69791 ?auto_69794 ) ) ( not ( = ?auto_69791 ?auto_69795 ) ) ( not ( = ?auto_69791 ?auto_69796 ) ) ( not ( = ?auto_69791 ?auto_69797 ) ) ( not ( = ?auto_69791 ?auto_69798 ) ) ( not ( = ?auto_69792 ?auto_69793 ) ) ( not ( = ?auto_69792 ?auto_69794 ) ) ( not ( = ?auto_69792 ?auto_69795 ) ) ( not ( = ?auto_69792 ?auto_69796 ) ) ( not ( = ?auto_69792 ?auto_69797 ) ) ( not ( = ?auto_69792 ?auto_69798 ) ) ( not ( = ?auto_69793 ?auto_69794 ) ) ( not ( = ?auto_69793 ?auto_69795 ) ) ( not ( = ?auto_69793 ?auto_69796 ) ) ( not ( = ?auto_69793 ?auto_69797 ) ) ( not ( = ?auto_69793 ?auto_69798 ) ) ( not ( = ?auto_69794 ?auto_69795 ) ) ( not ( = ?auto_69794 ?auto_69796 ) ) ( not ( = ?auto_69794 ?auto_69797 ) ) ( not ( = ?auto_69794 ?auto_69798 ) ) ( not ( = ?auto_69795 ?auto_69796 ) ) ( not ( = ?auto_69795 ?auto_69797 ) ) ( not ( = ?auto_69795 ?auto_69798 ) ) ( not ( = ?auto_69796 ?auto_69797 ) ) ( not ( = ?auto_69796 ?auto_69798 ) ) ( not ( = ?auto_69797 ?auto_69798 ) ) ( ON ?auto_69790 ?auto_69799 ) ( not ( = ?auto_69798 ?auto_69799 ) ) ( not ( = ?auto_69797 ?auto_69799 ) ) ( not ( = ?auto_69796 ?auto_69799 ) ) ( not ( = ?auto_69795 ?auto_69799 ) ) ( not ( = ?auto_69794 ?auto_69799 ) ) ( not ( = ?auto_69793 ?auto_69799 ) ) ( not ( = ?auto_69792 ?auto_69799 ) ) ( not ( = ?auto_69791 ?auto_69799 ) ) ( not ( = ?auto_69790 ?auto_69799 ) ) ( ON ?auto_69791 ?auto_69790 ) ( ON ?auto_69792 ?auto_69791 ) ( ON ?auto_69793 ?auto_69792 ) ( ON ?auto_69794 ?auto_69793 ) ( ON ?auto_69795 ?auto_69794 ) ( ON ?auto_69796 ?auto_69795 ) ( ON ?auto_69797 ?auto_69796 ) ( ON ?auto_69798 ?auto_69797 ) ( CLEAR ?auto_69798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_69798 ?auto_69797 ?auto_69796 ?auto_69795 ?auto_69794 ?auto_69793 ?auto_69792 ?auto_69791 ?auto_69790 )
      ( MAKE-9PILE ?auto_69790 ?auto_69791 ?auto_69792 ?auto_69793 ?auto_69794 ?auto_69795 ?auto_69796 ?auto_69797 ?auto_69798 ) )
  )

)

