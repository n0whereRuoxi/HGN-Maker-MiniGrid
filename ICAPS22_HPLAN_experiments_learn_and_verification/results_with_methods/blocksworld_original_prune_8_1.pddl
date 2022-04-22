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

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120639 - BLOCK
      ?auto_120640 - BLOCK
      ?auto_120641 - BLOCK
      ?auto_120642 - BLOCK
      ?auto_120643 - BLOCK
      ?auto_120644 - BLOCK
      ?auto_120645 - BLOCK
      ?auto_120646 - BLOCK
    )
    :vars
    (
      ?auto_120647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120647 ?auto_120646 ) ( CLEAR ?auto_120647 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120639 ) ( ON ?auto_120640 ?auto_120639 ) ( ON ?auto_120641 ?auto_120640 ) ( ON ?auto_120642 ?auto_120641 ) ( ON ?auto_120643 ?auto_120642 ) ( ON ?auto_120644 ?auto_120643 ) ( ON ?auto_120645 ?auto_120644 ) ( ON ?auto_120646 ?auto_120645 ) ( not ( = ?auto_120639 ?auto_120640 ) ) ( not ( = ?auto_120639 ?auto_120641 ) ) ( not ( = ?auto_120639 ?auto_120642 ) ) ( not ( = ?auto_120639 ?auto_120643 ) ) ( not ( = ?auto_120639 ?auto_120644 ) ) ( not ( = ?auto_120639 ?auto_120645 ) ) ( not ( = ?auto_120639 ?auto_120646 ) ) ( not ( = ?auto_120639 ?auto_120647 ) ) ( not ( = ?auto_120640 ?auto_120641 ) ) ( not ( = ?auto_120640 ?auto_120642 ) ) ( not ( = ?auto_120640 ?auto_120643 ) ) ( not ( = ?auto_120640 ?auto_120644 ) ) ( not ( = ?auto_120640 ?auto_120645 ) ) ( not ( = ?auto_120640 ?auto_120646 ) ) ( not ( = ?auto_120640 ?auto_120647 ) ) ( not ( = ?auto_120641 ?auto_120642 ) ) ( not ( = ?auto_120641 ?auto_120643 ) ) ( not ( = ?auto_120641 ?auto_120644 ) ) ( not ( = ?auto_120641 ?auto_120645 ) ) ( not ( = ?auto_120641 ?auto_120646 ) ) ( not ( = ?auto_120641 ?auto_120647 ) ) ( not ( = ?auto_120642 ?auto_120643 ) ) ( not ( = ?auto_120642 ?auto_120644 ) ) ( not ( = ?auto_120642 ?auto_120645 ) ) ( not ( = ?auto_120642 ?auto_120646 ) ) ( not ( = ?auto_120642 ?auto_120647 ) ) ( not ( = ?auto_120643 ?auto_120644 ) ) ( not ( = ?auto_120643 ?auto_120645 ) ) ( not ( = ?auto_120643 ?auto_120646 ) ) ( not ( = ?auto_120643 ?auto_120647 ) ) ( not ( = ?auto_120644 ?auto_120645 ) ) ( not ( = ?auto_120644 ?auto_120646 ) ) ( not ( = ?auto_120644 ?auto_120647 ) ) ( not ( = ?auto_120645 ?auto_120646 ) ) ( not ( = ?auto_120645 ?auto_120647 ) ) ( not ( = ?auto_120646 ?auto_120647 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120647 ?auto_120646 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120649 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_120649 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_120649 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120650 - BLOCK
    )
    :vars
    (
      ?auto_120651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120650 ?auto_120651 ) ( CLEAR ?auto_120650 ) ( HAND-EMPTY ) ( not ( = ?auto_120650 ?auto_120651 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120650 ?auto_120651 )
      ( MAKE-1PILE ?auto_120650 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120659 - BLOCK
      ?auto_120660 - BLOCK
      ?auto_120661 - BLOCK
      ?auto_120662 - BLOCK
      ?auto_120663 - BLOCK
      ?auto_120664 - BLOCK
      ?auto_120665 - BLOCK
    )
    :vars
    (
      ?auto_120666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120666 ?auto_120665 ) ( CLEAR ?auto_120666 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120659 ) ( ON ?auto_120660 ?auto_120659 ) ( ON ?auto_120661 ?auto_120660 ) ( ON ?auto_120662 ?auto_120661 ) ( ON ?auto_120663 ?auto_120662 ) ( ON ?auto_120664 ?auto_120663 ) ( ON ?auto_120665 ?auto_120664 ) ( not ( = ?auto_120659 ?auto_120660 ) ) ( not ( = ?auto_120659 ?auto_120661 ) ) ( not ( = ?auto_120659 ?auto_120662 ) ) ( not ( = ?auto_120659 ?auto_120663 ) ) ( not ( = ?auto_120659 ?auto_120664 ) ) ( not ( = ?auto_120659 ?auto_120665 ) ) ( not ( = ?auto_120659 ?auto_120666 ) ) ( not ( = ?auto_120660 ?auto_120661 ) ) ( not ( = ?auto_120660 ?auto_120662 ) ) ( not ( = ?auto_120660 ?auto_120663 ) ) ( not ( = ?auto_120660 ?auto_120664 ) ) ( not ( = ?auto_120660 ?auto_120665 ) ) ( not ( = ?auto_120660 ?auto_120666 ) ) ( not ( = ?auto_120661 ?auto_120662 ) ) ( not ( = ?auto_120661 ?auto_120663 ) ) ( not ( = ?auto_120661 ?auto_120664 ) ) ( not ( = ?auto_120661 ?auto_120665 ) ) ( not ( = ?auto_120661 ?auto_120666 ) ) ( not ( = ?auto_120662 ?auto_120663 ) ) ( not ( = ?auto_120662 ?auto_120664 ) ) ( not ( = ?auto_120662 ?auto_120665 ) ) ( not ( = ?auto_120662 ?auto_120666 ) ) ( not ( = ?auto_120663 ?auto_120664 ) ) ( not ( = ?auto_120663 ?auto_120665 ) ) ( not ( = ?auto_120663 ?auto_120666 ) ) ( not ( = ?auto_120664 ?auto_120665 ) ) ( not ( = ?auto_120664 ?auto_120666 ) ) ( not ( = ?auto_120665 ?auto_120666 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120666 ?auto_120665 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120667 - BLOCK
      ?auto_120668 - BLOCK
      ?auto_120669 - BLOCK
      ?auto_120670 - BLOCK
      ?auto_120671 - BLOCK
      ?auto_120672 - BLOCK
      ?auto_120673 - BLOCK
    )
    :vars
    (
      ?auto_120674 - BLOCK
      ?auto_120675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120674 ?auto_120673 ) ( CLEAR ?auto_120674 ) ( ON-TABLE ?auto_120667 ) ( ON ?auto_120668 ?auto_120667 ) ( ON ?auto_120669 ?auto_120668 ) ( ON ?auto_120670 ?auto_120669 ) ( ON ?auto_120671 ?auto_120670 ) ( ON ?auto_120672 ?auto_120671 ) ( ON ?auto_120673 ?auto_120672 ) ( not ( = ?auto_120667 ?auto_120668 ) ) ( not ( = ?auto_120667 ?auto_120669 ) ) ( not ( = ?auto_120667 ?auto_120670 ) ) ( not ( = ?auto_120667 ?auto_120671 ) ) ( not ( = ?auto_120667 ?auto_120672 ) ) ( not ( = ?auto_120667 ?auto_120673 ) ) ( not ( = ?auto_120667 ?auto_120674 ) ) ( not ( = ?auto_120668 ?auto_120669 ) ) ( not ( = ?auto_120668 ?auto_120670 ) ) ( not ( = ?auto_120668 ?auto_120671 ) ) ( not ( = ?auto_120668 ?auto_120672 ) ) ( not ( = ?auto_120668 ?auto_120673 ) ) ( not ( = ?auto_120668 ?auto_120674 ) ) ( not ( = ?auto_120669 ?auto_120670 ) ) ( not ( = ?auto_120669 ?auto_120671 ) ) ( not ( = ?auto_120669 ?auto_120672 ) ) ( not ( = ?auto_120669 ?auto_120673 ) ) ( not ( = ?auto_120669 ?auto_120674 ) ) ( not ( = ?auto_120670 ?auto_120671 ) ) ( not ( = ?auto_120670 ?auto_120672 ) ) ( not ( = ?auto_120670 ?auto_120673 ) ) ( not ( = ?auto_120670 ?auto_120674 ) ) ( not ( = ?auto_120671 ?auto_120672 ) ) ( not ( = ?auto_120671 ?auto_120673 ) ) ( not ( = ?auto_120671 ?auto_120674 ) ) ( not ( = ?auto_120672 ?auto_120673 ) ) ( not ( = ?auto_120672 ?auto_120674 ) ) ( not ( = ?auto_120673 ?auto_120674 ) ) ( HOLDING ?auto_120675 ) ( not ( = ?auto_120667 ?auto_120675 ) ) ( not ( = ?auto_120668 ?auto_120675 ) ) ( not ( = ?auto_120669 ?auto_120675 ) ) ( not ( = ?auto_120670 ?auto_120675 ) ) ( not ( = ?auto_120671 ?auto_120675 ) ) ( not ( = ?auto_120672 ?auto_120675 ) ) ( not ( = ?auto_120673 ?auto_120675 ) ) ( not ( = ?auto_120674 ?auto_120675 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_120675 )
      ( MAKE-7PILE ?auto_120667 ?auto_120668 ?auto_120669 ?auto_120670 ?auto_120671 ?auto_120672 ?auto_120673 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120676 - BLOCK
      ?auto_120677 - BLOCK
      ?auto_120678 - BLOCK
      ?auto_120679 - BLOCK
      ?auto_120680 - BLOCK
      ?auto_120681 - BLOCK
      ?auto_120682 - BLOCK
    )
    :vars
    (
      ?auto_120684 - BLOCK
      ?auto_120683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120684 ?auto_120682 ) ( ON-TABLE ?auto_120676 ) ( ON ?auto_120677 ?auto_120676 ) ( ON ?auto_120678 ?auto_120677 ) ( ON ?auto_120679 ?auto_120678 ) ( ON ?auto_120680 ?auto_120679 ) ( ON ?auto_120681 ?auto_120680 ) ( ON ?auto_120682 ?auto_120681 ) ( not ( = ?auto_120676 ?auto_120677 ) ) ( not ( = ?auto_120676 ?auto_120678 ) ) ( not ( = ?auto_120676 ?auto_120679 ) ) ( not ( = ?auto_120676 ?auto_120680 ) ) ( not ( = ?auto_120676 ?auto_120681 ) ) ( not ( = ?auto_120676 ?auto_120682 ) ) ( not ( = ?auto_120676 ?auto_120684 ) ) ( not ( = ?auto_120677 ?auto_120678 ) ) ( not ( = ?auto_120677 ?auto_120679 ) ) ( not ( = ?auto_120677 ?auto_120680 ) ) ( not ( = ?auto_120677 ?auto_120681 ) ) ( not ( = ?auto_120677 ?auto_120682 ) ) ( not ( = ?auto_120677 ?auto_120684 ) ) ( not ( = ?auto_120678 ?auto_120679 ) ) ( not ( = ?auto_120678 ?auto_120680 ) ) ( not ( = ?auto_120678 ?auto_120681 ) ) ( not ( = ?auto_120678 ?auto_120682 ) ) ( not ( = ?auto_120678 ?auto_120684 ) ) ( not ( = ?auto_120679 ?auto_120680 ) ) ( not ( = ?auto_120679 ?auto_120681 ) ) ( not ( = ?auto_120679 ?auto_120682 ) ) ( not ( = ?auto_120679 ?auto_120684 ) ) ( not ( = ?auto_120680 ?auto_120681 ) ) ( not ( = ?auto_120680 ?auto_120682 ) ) ( not ( = ?auto_120680 ?auto_120684 ) ) ( not ( = ?auto_120681 ?auto_120682 ) ) ( not ( = ?auto_120681 ?auto_120684 ) ) ( not ( = ?auto_120682 ?auto_120684 ) ) ( not ( = ?auto_120676 ?auto_120683 ) ) ( not ( = ?auto_120677 ?auto_120683 ) ) ( not ( = ?auto_120678 ?auto_120683 ) ) ( not ( = ?auto_120679 ?auto_120683 ) ) ( not ( = ?auto_120680 ?auto_120683 ) ) ( not ( = ?auto_120681 ?auto_120683 ) ) ( not ( = ?auto_120682 ?auto_120683 ) ) ( not ( = ?auto_120684 ?auto_120683 ) ) ( ON ?auto_120683 ?auto_120684 ) ( CLEAR ?auto_120683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_120676 ?auto_120677 ?auto_120678 ?auto_120679 ?auto_120680 ?auto_120681 ?auto_120682 ?auto_120684 )
      ( MAKE-7PILE ?auto_120676 ?auto_120677 ?auto_120678 ?auto_120679 ?auto_120680 ?auto_120681 ?auto_120682 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_120687 - BLOCK
      ?auto_120688 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_120688 ) ( CLEAR ?auto_120687 ) ( ON-TABLE ?auto_120687 ) ( not ( = ?auto_120687 ?auto_120688 ) ) )
    :subtasks
    ( ( !STACK ?auto_120688 ?auto_120687 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_120689 - BLOCK
      ?auto_120690 - BLOCK
    )
    :vars
    (
      ?auto_120691 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_120689 ) ( ON-TABLE ?auto_120689 ) ( not ( = ?auto_120689 ?auto_120690 ) ) ( ON ?auto_120690 ?auto_120691 ) ( CLEAR ?auto_120690 ) ( HAND-EMPTY ) ( not ( = ?auto_120689 ?auto_120691 ) ) ( not ( = ?auto_120690 ?auto_120691 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120690 ?auto_120691 )
      ( MAKE-2PILE ?auto_120689 ?auto_120690 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_120692 - BLOCK
      ?auto_120693 - BLOCK
    )
    :vars
    (
      ?auto_120694 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120692 ?auto_120693 ) ) ( ON ?auto_120693 ?auto_120694 ) ( CLEAR ?auto_120693 ) ( not ( = ?auto_120692 ?auto_120694 ) ) ( not ( = ?auto_120693 ?auto_120694 ) ) ( HOLDING ?auto_120692 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120692 )
      ( MAKE-2PILE ?auto_120692 ?auto_120693 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_120695 - BLOCK
      ?auto_120696 - BLOCK
    )
    :vars
    (
      ?auto_120697 - BLOCK
      ?auto_120701 - BLOCK
      ?auto_120700 - BLOCK
      ?auto_120702 - BLOCK
      ?auto_120699 - BLOCK
      ?auto_120698 - BLOCK
      ?auto_120703 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120695 ?auto_120696 ) ) ( ON ?auto_120696 ?auto_120697 ) ( not ( = ?auto_120695 ?auto_120697 ) ) ( not ( = ?auto_120696 ?auto_120697 ) ) ( ON ?auto_120695 ?auto_120696 ) ( CLEAR ?auto_120695 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120701 ) ( ON ?auto_120700 ?auto_120701 ) ( ON ?auto_120702 ?auto_120700 ) ( ON ?auto_120699 ?auto_120702 ) ( ON ?auto_120698 ?auto_120699 ) ( ON ?auto_120703 ?auto_120698 ) ( ON ?auto_120697 ?auto_120703 ) ( not ( = ?auto_120701 ?auto_120700 ) ) ( not ( = ?auto_120701 ?auto_120702 ) ) ( not ( = ?auto_120701 ?auto_120699 ) ) ( not ( = ?auto_120701 ?auto_120698 ) ) ( not ( = ?auto_120701 ?auto_120703 ) ) ( not ( = ?auto_120701 ?auto_120697 ) ) ( not ( = ?auto_120701 ?auto_120696 ) ) ( not ( = ?auto_120701 ?auto_120695 ) ) ( not ( = ?auto_120700 ?auto_120702 ) ) ( not ( = ?auto_120700 ?auto_120699 ) ) ( not ( = ?auto_120700 ?auto_120698 ) ) ( not ( = ?auto_120700 ?auto_120703 ) ) ( not ( = ?auto_120700 ?auto_120697 ) ) ( not ( = ?auto_120700 ?auto_120696 ) ) ( not ( = ?auto_120700 ?auto_120695 ) ) ( not ( = ?auto_120702 ?auto_120699 ) ) ( not ( = ?auto_120702 ?auto_120698 ) ) ( not ( = ?auto_120702 ?auto_120703 ) ) ( not ( = ?auto_120702 ?auto_120697 ) ) ( not ( = ?auto_120702 ?auto_120696 ) ) ( not ( = ?auto_120702 ?auto_120695 ) ) ( not ( = ?auto_120699 ?auto_120698 ) ) ( not ( = ?auto_120699 ?auto_120703 ) ) ( not ( = ?auto_120699 ?auto_120697 ) ) ( not ( = ?auto_120699 ?auto_120696 ) ) ( not ( = ?auto_120699 ?auto_120695 ) ) ( not ( = ?auto_120698 ?auto_120703 ) ) ( not ( = ?auto_120698 ?auto_120697 ) ) ( not ( = ?auto_120698 ?auto_120696 ) ) ( not ( = ?auto_120698 ?auto_120695 ) ) ( not ( = ?auto_120703 ?auto_120697 ) ) ( not ( = ?auto_120703 ?auto_120696 ) ) ( not ( = ?auto_120703 ?auto_120695 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_120701 ?auto_120700 ?auto_120702 ?auto_120699 ?auto_120698 ?auto_120703 ?auto_120697 ?auto_120696 )
      ( MAKE-2PILE ?auto_120695 ?auto_120696 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_120710 - BLOCK
      ?auto_120711 - BLOCK
      ?auto_120712 - BLOCK
      ?auto_120713 - BLOCK
      ?auto_120714 - BLOCK
      ?auto_120715 - BLOCK
    )
    :vars
    (
      ?auto_120716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120716 ?auto_120715 ) ( CLEAR ?auto_120716 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120710 ) ( ON ?auto_120711 ?auto_120710 ) ( ON ?auto_120712 ?auto_120711 ) ( ON ?auto_120713 ?auto_120712 ) ( ON ?auto_120714 ?auto_120713 ) ( ON ?auto_120715 ?auto_120714 ) ( not ( = ?auto_120710 ?auto_120711 ) ) ( not ( = ?auto_120710 ?auto_120712 ) ) ( not ( = ?auto_120710 ?auto_120713 ) ) ( not ( = ?auto_120710 ?auto_120714 ) ) ( not ( = ?auto_120710 ?auto_120715 ) ) ( not ( = ?auto_120710 ?auto_120716 ) ) ( not ( = ?auto_120711 ?auto_120712 ) ) ( not ( = ?auto_120711 ?auto_120713 ) ) ( not ( = ?auto_120711 ?auto_120714 ) ) ( not ( = ?auto_120711 ?auto_120715 ) ) ( not ( = ?auto_120711 ?auto_120716 ) ) ( not ( = ?auto_120712 ?auto_120713 ) ) ( not ( = ?auto_120712 ?auto_120714 ) ) ( not ( = ?auto_120712 ?auto_120715 ) ) ( not ( = ?auto_120712 ?auto_120716 ) ) ( not ( = ?auto_120713 ?auto_120714 ) ) ( not ( = ?auto_120713 ?auto_120715 ) ) ( not ( = ?auto_120713 ?auto_120716 ) ) ( not ( = ?auto_120714 ?auto_120715 ) ) ( not ( = ?auto_120714 ?auto_120716 ) ) ( not ( = ?auto_120715 ?auto_120716 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120716 ?auto_120715 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_120717 - BLOCK
      ?auto_120718 - BLOCK
      ?auto_120719 - BLOCK
      ?auto_120720 - BLOCK
      ?auto_120721 - BLOCK
      ?auto_120722 - BLOCK
    )
    :vars
    (
      ?auto_120723 - BLOCK
      ?auto_120724 - BLOCK
      ?auto_120725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120723 ?auto_120722 ) ( CLEAR ?auto_120723 ) ( ON-TABLE ?auto_120717 ) ( ON ?auto_120718 ?auto_120717 ) ( ON ?auto_120719 ?auto_120718 ) ( ON ?auto_120720 ?auto_120719 ) ( ON ?auto_120721 ?auto_120720 ) ( ON ?auto_120722 ?auto_120721 ) ( not ( = ?auto_120717 ?auto_120718 ) ) ( not ( = ?auto_120717 ?auto_120719 ) ) ( not ( = ?auto_120717 ?auto_120720 ) ) ( not ( = ?auto_120717 ?auto_120721 ) ) ( not ( = ?auto_120717 ?auto_120722 ) ) ( not ( = ?auto_120717 ?auto_120723 ) ) ( not ( = ?auto_120718 ?auto_120719 ) ) ( not ( = ?auto_120718 ?auto_120720 ) ) ( not ( = ?auto_120718 ?auto_120721 ) ) ( not ( = ?auto_120718 ?auto_120722 ) ) ( not ( = ?auto_120718 ?auto_120723 ) ) ( not ( = ?auto_120719 ?auto_120720 ) ) ( not ( = ?auto_120719 ?auto_120721 ) ) ( not ( = ?auto_120719 ?auto_120722 ) ) ( not ( = ?auto_120719 ?auto_120723 ) ) ( not ( = ?auto_120720 ?auto_120721 ) ) ( not ( = ?auto_120720 ?auto_120722 ) ) ( not ( = ?auto_120720 ?auto_120723 ) ) ( not ( = ?auto_120721 ?auto_120722 ) ) ( not ( = ?auto_120721 ?auto_120723 ) ) ( not ( = ?auto_120722 ?auto_120723 ) ) ( HOLDING ?auto_120724 ) ( CLEAR ?auto_120725 ) ( not ( = ?auto_120717 ?auto_120724 ) ) ( not ( = ?auto_120717 ?auto_120725 ) ) ( not ( = ?auto_120718 ?auto_120724 ) ) ( not ( = ?auto_120718 ?auto_120725 ) ) ( not ( = ?auto_120719 ?auto_120724 ) ) ( not ( = ?auto_120719 ?auto_120725 ) ) ( not ( = ?auto_120720 ?auto_120724 ) ) ( not ( = ?auto_120720 ?auto_120725 ) ) ( not ( = ?auto_120721 ?auto_120724 ) ) ( not ( = ?auto_120721 ?auto_120725 ) ) ( not ( = ?auto_120722 ?auto_120724 ) ) ( not ( = ?auto_120722 ?auto_120725 ) ) ( not ( = ?auto_120723 ?auto_120724 ) ) ( not ( = ?auto_120723 ?auto_120725 ) ) ( not ( = ?auto_120724 ?auto_120725 ) ) )
    :subtasks
    ( ( !STACK ?auto_120724 ?auto_120725 )
      ( MAKE-6PILE ?auto_120717 ?auto_120718 ?auto_120719 ?auto_120720 ?auto_120721 ?auto_120722 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_122057 - BLOCK
      ?auto_122058 - BLOCK
      ?auto_122059 - BLOCK
      ?auto_122060 - BLOCK
      ?auto_122061 - BLOCK
      ?auto_122062 - BLOCK
    )
    :vars
    (
      ?auto_122064 - BLOCK
      ?auto_122063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122064 ?auto_122062 ) ( ON-TABLE ?auto_122057 ) ( ON ?auto_122058 ?auto_122057 ) ( ON ?auto_122059 ?auto_122058 ) ( ON ?auto_122060 ?auto_122059 ) ( ON ?auto_122061 ?auto_122060 ) ( ON ?auto_122062 ?auto_122061 ) ( not ( = ?auto_122057 ?auto_122058 ) ) ( not ( = ?auto_122057 ?auto_122059 ) ) ( not ( = ?auto_122057 ?auto_122060 ) ) ( not ( = ?auto_122057 ?auto_122061 ) ) ( not ( = ?auto_122057 ?auto_122062 ) ) ( not ( = ?auto_122057 ?auto_122064 ) ) ( not ( = ?auto_122058 ?auto_122059 ) ) ( not ( = ?auto_122058 ?auto_122060 ) ) ( not ( = ?auto_122058 ?auto_122061 ) ) ( not ( = ?auto_122058 ?auto_122062 ) ) ( not ( = ?auto_122058 ?auto_122064 ) ) ( not ( = ?auto_122059 ?auto_122060 ) ) ( not ( = ?auto_122059 ?auto_122061 ) ) ( not ( = ?auto_122059 ?auto_122062 ) ) ( not ( = ?auto_122059 ?auto_122064 ) ) ( not ( = ?auto_122060 ?auto_122061 ) ) ( not ( = ?auto_122060 ?auto_122062 ) ) ( not ( = ?auto_122060 ?auto_122064 ) ) ( not ( = ?auto_122061 ?auto_122062 ) ) ( not ( = ?auto_122061 ?auto_122064 ) ) ( not ( = ?auto_122062 ?auto_122064 ) ) ( not ( = ?auto_122057 ?auto_122063 ) ) ( not ( = ?auto_122058 ?auto_122063 ) ) ( not ( = ?auto_122059 ?auto_122063 ) ) ( not ( = ?auto_122060 ?auto_122063 ) ) ( not ( = ?auto_122061 ?auto_122063 ) ) ( not ( = ?auto_122062 ?auto_122063 ) ) ( not ( = ?auto_122064 ?auto_122063 ) ) ( ON ?auto_122063 ?auto_122064 ) ( CLEAR ?auto_122063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122057 ?auto_122058 ?auto_122059 ?auto_122060 ?auto_122061 ?auto_122062 ?auto_122064 )
      ( MAKE-6PILE ?auto_122057 ?auto_122058 ?auto_122059 ?auto_122060 ?auto_122061 ?auto_122062 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_120735 - BLOCK
      ?auto_120736 - BLOCK
      ?auto_120737 - BLOCK
      ?auto_120738 - BLOCK
      ?auto_120739 - BLOCK
      ?auto_120740 - BLOCK
    )
    :vars
    (
      ?auto_120741 - BLOCK
      ?auto_120743 - BLOCK
      ?auto_120742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120741 ?auto_120740 ) ( ON-TABLE ?auto_120735 ) ( ON ?auto_120736 ?auto_120735 ) ( ON ?auto_120737 ?auto_120736 ) ( ON ?auto_120738 ?auto_120737 ) ( ON ?auto_120739 ?auto_120738 ) ( ON ?auto_120740 ?auto_120739 ) ( not ( = ?auto_120735 ?auto_120736 ) ) ( not ( = ?auto_120735 ?auto_120737 ) ) ( not ( = ?auto_120735 ?auto_120738 ) ) ( not ( = ?auto_120735 ?auto_120739 ) ) ( not ( = ?auto_120735 ?auto_120740 ) ) ( not ( = ?auto_120735 ?auto_120741 ) ) ( not ( = ?auto_120736 ?auto_120737 ) ) ( not ( = ?auto_120736 ?auto_120738 ) ) ( not ( = ?auto_120736 ?auto_120739 ) ) ( not ( = ?auto_120736 ?auto_120740 ) ) ( not ( = ?auto_120736 ?auto_120741 ) ) ( not ( = ?auto_120737 ?auto_120738 ) ) ( not ( = ?auto_120737 ?auto_120739 ) ) ( not ( = ?auto_120737 ?auto_120740 ) ) ( not ( = ?auto_120737 ?auto_120741 ) ) ( not ( = ?auto_120738 ?auto_120739 ) ) ( not ( = ?auto_120738 ?auto_120740 ) ) ( not ( = ?auto_120738 ?auto_120741 ) ) ( not ( = ?auto_120739 ?auto_120740 ) ) ( not ( = ?auto_120739 ?auto_120741 ) ) ( not ( = ?auto_120740 ?auto_120741 ) ) ( not ( = ?auto_120735 ?auto_120743 ) ) ( not ( = ?auto_120735 ?auto_120742 ) ) ( not ( = ?auto_120736 ?auto_120743 ) ) ( not ( = ?auto_120736 ?auto_120742 ) ) ( not ( = ?auto_120737 ?auto_120743 ) ) ( not ( = ?auto_120737 ?auto_120742 ) ) ( not ( = ?auto_120738 ?auto_120743 ) ) ( not ( = ?auto_120738 ?auto_120742 ) ) ( not ( = ?auto_120739 ?auto_120743 ) ) ( not ( = ?auto_120739 ?auto_120742 ) ) ( not ( = ?auto_120740 ?auto_120743 ) ) ( not ( = ?auto_120740 ?auto_120742 ) ) ( not ( = ?auto_120741 ?auto_120743 ) ) ( not ( = ?auto_120741 ?auto_120742 ) ) ( not ( = ?auto_120743 ?auto_120742 ) ) ( ON ?auto_120743 ?auto_120741 ) ( CLEAR ?auto_120743 ) ( HOLDING ?auto_120742 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120742 )
      ( MAKE-6PILE ?auto_120735 ?auto_120736 ?auto_120737 ?auto_120738 ?auto_120739 ?auto_120740 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_120744 - BLOCK
      ?auto_120745 - BLOCK
      ?auto_120746 - BLOCK
      ?auto_120747 - BLOCK
      ?auto_120748 - BLOCK
      ?auto_120749 - BLOCK
    )
    :vars
    (
      ?auto_120752 - BLOCK
      ?auto_120751 - BLOCK
      ?auto_120750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120752 ?auto_120749 ) ( ON-TABLE ?auto_120744 ) ( ON ?auto_120745 ?auto_120744 ) ( ON ?auto_120746 ?auto_120745 ) ( ON ?auto_120747 ?auto_120746 ) ( ON ?auto_120748 ?auto_120747 ) ( ON ?auto_120749 ?auto_120748 ) ( not ( = ?auto_120744 ?auto_120745 ) ) ( not ( = ?auto_120744 ?auto_120746 ) ) ( not ( = ?auto_120744 ?auto_120747 ) ) ( not ( = ?auto_120744 ?auto_120748 ) ) ( not ( = ?auto_120744 ?auto_120749 ) ) ( not ( = ?auto_120744 ?auto_120752 ) ) ( not ( = ?auto_120745 ?auto_120746 ) ) ( not ( = ?auto_120745 ?auto_120747 ) ) ( not ( = ?auto_120745 ?auto_120748 ) ) ( not ( = ?auto_120745 ?auto_120749 ) ) ( not ( = ?auto_120745 ?auto_120752 ) ) ( not ( = ?auto_120746 ?auto_120747 ) ) ( not ( = ?auto_120746 ?auto_120748 ) ) ( not ( = ?auto_120746 ?auto_120749 ) ) ( not ( = ?auto_120746 ?auto_120752 ) ) ( not ( = ?auto_120747 ?auto_120748 ) ) ( not ( = ?auto_120747 ?auto_120749 ) ) ( not ( = ?auto_120747 ?auto_120752 ) ) ( not ( = ?auto_120748 ?auto_120749 ) ) ( not ( = ?auto_120748 ?auto_120752 ) ) ( not ( = ?auto_120749 ?auto_120752 ) ) ( not ( = ?auto_120744 ?auto_120751 ) ) ( not ( = ?auto_120744 ?auto_120750 ) ) ( not ( = ?auto_120745 ?auto_120751 ) ) ( not ( = ?auto_120745 ?auto_120750 ) ) ( not ( = ?auto_120746 ?auto_120751 ) ) ( not ( = ?auto_120746 ?auto_120750 ) ) ( not ( = ?auto_120747 ?auto_120751 ) ) ( not ( = ?auto_120747 ?auto_120750 ) ) ( not ( = ?auto_120748 ?auto_120751 ) ) ( not ( = ?auto_120748 ?auto_120750 ) ) ( not ( = ?auto_120749 ?auto_120751 ) ) ( not ( = ?auto_120749 ?auto_120750 ) ) ( not ( = ?auto_120752 ?auto_120751 ) ) ( not ( = ?auto_120752 ?auto_120750 ) ) ( not ( = ?auto_120751 ?auto_120750 ) ) ( ON ?auto_120751 ?auto_120752 ) ( ON ?auto_120750 ?auto_120751 ) ( CLEAR ?auto_120750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_120744 ?auto_120745 ?auto_120746 ?auto_120747 ?auto_120748 ?auto_120749 ?auto_120752 ?auto_120751 )
      ( MAKE-6PILE ?auto_120744 ?auto_120745 ?auto_120746 ?auto_120747 ?auto_120748 ?auto_120749 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120756 - BLOCK
      ?auto_120757 - BLOCK
      ?auto_120758 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_120758 ) ( CLEAR ?auto_120757 ) ( ON-TABLE ?auto_120756 ) ( ON ?auto_120757 ?auto_120756 ) ( not ( = ?auto_120756 ?auto_120757 ) ) ( not ( = ?auto_120756 ?auto_120758 ) ) ( not ( = ?auto_120757 ?auto_120758 ) ) )
    :subtasks
    ( ( !STACK ?auto_120758 ?auto_120757 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120759 - BLOCK
      ?auto_120760 - BLOCK
      ?auto_120761 - BLOCK
    )
    :vars
    (
      ?auto_120762 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_120760 ) ( ON-TABLE ?auto_120759 ) ( ON ?auto_120760 ?auto_120759 ) ( not ( = ?auto_120759 ?auto_120760 ) ) ( not ( = ?auto_120759 ?auto_120761 ) ) ( not ( = ?auto_120760 ?auto_120761 ) ) ( ON ?auto_120761 ?auto_120762 ) ( CLEAR ?auto_120761 ) ( HAND-EMPTY ) ( not ( = ?auto_120759 ?auto_120762 ) ) ( not ( = ?auto_120760 ?auto_120762 ) ) ( not ( = ?auto_120761 ?auto_120762 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120761 ?auto_120762 )
      ( MAKE-3PILE ?auto_120759 ?auto_120760 ?auto_120761 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120763 - BLOCK
      ?auto_120764 - BLOCK
      ?auto_120765 - BLOCK
    )
    :vars
    (
      ?auto_120766 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120763 ) ( not ( = ?auto_120763 ?auto_120764 ) ) ( not ( = ?auto_120763 ?auto_120765 ) ) ( not ( = ?auto_120764 ?auto_120765 ) ) ( ON ?auto_120765 ?auto_120766 ) ( CLEAR ?auto_120765 ) ( not ( = ?auto_120763 ?auto_120766 ) ) ( not ( = ?auto_120764 ?auto_120766 ) ) ( not ( = ?auto_120765 ?auto_120766 ) ) ( HOLDING ?auto_120764 ) ( CLEAR ?auto_120763 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120763 ?auto_120764 )
      ( MAKE-3PILE ?auto_120763 ?auto_120764 ?auto_120765 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120767 - BLOCK
      ?auto_120768 - BLOCK
      ?auto_120769 - BLOCK
    )
    :vars
    (
      ?auto_120770 - BLOCK
      ?auto_120773 - BLOCK
      ?auto_120775 - BLOCK
      ?auto_120772 - BLOCK
      ?auto_120771 - BLOCK
      ?auto_120774 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120767 ) ( not ( = ?auto_120767 ?auto_120768 ) ) ( not ( = ?auto_120767 ?auto_120769 ) ) ( not ( = ?auto_120768 ?auto_120769 ) ) ( ON ?auto_120769 ?auto_120770 ) ( not ( = ?auto_120767 ?auto_120770 ) ) ( not ( = ?auto_120768 ?auto_120770 ) ) ( not ( = ?auto_120769 ?auto_120770 ) ) ( CLEAR ?auto_120767 ) ( ON ?auto_120768 ?auto_120769 ) ( CLEAR ?auto_120768 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120773 ) ( ON ?auto_120775 ?auto_120773 ) ( ON ?auto_120772 ?auto_120775 ) ( ON ?auto_120771 ?auto_120772 ) ( ON ?auto_120774 ?auto_120771 ) ( ON ?auto_120770 ?auto_120774 ) ( not ( = ?auto_120773 ?auto_120775 ) ) ( not ( = ?auto_120773 ?auto_120772 ) ) ( not ( = ?auto_120773 ?auto_120771 ) ) ( not ( = ?auto_120773 ?auto_120774 ) ) ( not ( = ?auto_120773 ?auto_120770 ) ) ( not ( = ?auto_120773 ?auto_120769 ) ) ( not ( = ?auto_120773 ?auto_120768 ) ) ( not ( = ?auto_120775 ?auto_120772 ) ) ( not ( = ?auto_120775 ?auto_120771 ) ) ( not ( = ?auto_120775 ?auto_120774 ) ) ( not ( = ?auto_120775 ?auto_120770 ) ) ( not ( = ?auto_120775 ?auto_120769 ) ) ( not ( = ?auto_120775 ?auto_120768 ) ) ( not ( = ?auto_120772 ?auto_120771 ) ) ( not ( = ?auto_120772 ?auto_120774 ) ) ( not ( = ?auto_120772 ?auto_120770 ) ) ( not ( = ?auto_120772 ?auto_120769 ) ) ( not ( = ?auto_120772 ?auto_120768 ) ) ( not ( = ?auto_120771 ?auto_120774 ) ) ( not ( = ?auto_120771 ?auto_120770 ) ) ( not ( = ?auto_120771 ?auto_120769 ) ) ( not ( = ?auto_120771 ?auto_120768 ) ) ( not ( = ?auto_120774 ?auto_120770 ) ) ( not ( = ?auto_120774 ?auto_120769 ) ) ( not ( = ?auto_120774 ?auto_120768 ) ) ( not ( = ?auto_120767 ?auto_120773 ) ) ( not ( = ?auto_120767 ?auto_120775 ) ) ( not ( = ?auto_120767 ?auto_120772 ) ) ( not ( = ?auto_120767 ?auto_120771 ) ) ( not ( = ?auto_120767 ?auto_120774 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_120773 ?auto_120775 ?auto_120772 ?auto_120771 ?auto_120774 ?auto_120770 ?auto_120769 )
      ( MAKE-3PILE ?auto_120767 ?auto_120768 ?auto_120769 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120776 - BLOCK
      ?auto_120777 - BLOCK
      ?auto_120778 - BLOCK
    )
    :vars
    (
      ?auto_120781 - BLOCK
      ?auto_120779 - BLOCK
      ?auto_120784 - BLOCK
      ?auto_120780 - BLOCK
      ?auto_120782 - BLOCK
      ?auto_120783 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120776 ?auto_120777 ) ) ( not ( = ?auto_120776 ?auto_120778 ) ) ( not ( = ?auto_120777 ?auto_120778 ) ) ( ON ?auto_120778 ?auto_120781 ) ( not ( = ?auto_120776 ?auto_120781 ) ) ( not ( = ?auto_120777 ?auto_120781 ) ) ( not ( = ?auto_120778 ?auto_120781 ) ) ( ON ?auto_120777 ?auto_120778 ) ( CLEAR ?auto_120777 ) ( ON-TABLE ?auto_120779 ) ( ON ?auto_120784 ?auto_120779 ) ( ON ?auto_120780 ?auto_120784 ) ( ON ?auto_120782 ?auto_120780 ) ( ON ?auto_120783 ?auto_120782 ) ( ON ?auto_120781 ?auto_120783 ) ( not ( = ?auto_120779 ?auto_120784 ) ) ( not ( = ?auto_120779 ?auto_120780 ) ) ( not ( = ?auto_120779 ?auto_120782 ) ) ( not ( = ?auto_120779 ?auto_120783 ) ) ( not ( = ?auto_120779 ?auto_120781 ) ) ( not ( = ?auto_120779 ?auto_120778 ) ) ( not ( = ?auto_120779 ?auto_120777 ) ) ( not ( = ?auto_120784 ?auto_120780 ) ) ( not ( = ?auto_120784 ?auto_120782 ) ) ( not ( = ?auto_120784 ?auto_120783 ) ) ( not ( = ?auto_120784 ?auto_120781 ) ) ( not ( = ?auto_120784 ?auto_120778 ) ) ( not ( = ?auto_120784 ?auto_120777 ) ) ( not ( = ?auto_120780 ?auto_120782 ) ) ( not ( = ?auto_120780 ?auto_120783 ) ) ( not ( = ?auto_120780 ?auto_120781 ) ) ( not ( = ?auto_120780 ?auto_120778 ) ) ( not ( = ?auto_120780 ?auto_120777 ) ) ( not ( = ?auto_120782 ?auto_120783 ) ) ( not ( = ?auto_120782 ?auto_120781 ) ) ( not ( = ?auto_120782 ?auto_120778 ) ) ( not ( = ?auto_120782 ?auto_120777 ) ) ( not ( = ?auto_120783 ?auto_120781 ) ) ( not ( = ?auto_120783 ?auto_120778 ) ) ( not ( = ?auto_120783 ?auto_120777 ) ) ( not ( = ?auto_120776 ?auto_120779 ) ) ( not ( = ?auto_120776 ?auto_120784 ) ) ( not ( = ?auto_120776 ?auto_120780 ) ) ( not ( = ?auto_120776 ?auto_120782 ) ) ( not ( = ?auto_120776 ?auto_120783 ) ) ( HOLDING ?auto_120776 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120776 )
      ( MAKE-3PILE ?auto_120776 ?auto_120777 ?auto_120778 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120785 - BLOCK
      ?auto_120786 - BLOCK
      ?auto_120787 - BLOCK
    )
    :vars
    (
      ?auto_120788 - BLOCK
      ?auto_120790 - BLOCK
      ?auto_120793 - BLOCK
      ?auto_120792 - BLOCK
      ?auto_120791 - BLOCK
      ?auto_120789 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120785 ?auto_120786 ) ) ( not ( = ?auto_120785 ?auto_120787 ) ) ( not ( = ?auto_120786 ?auto_120787 ) ) ( ON ?auto_120787 ?auto_120788 ) ( not ( = ?auto_120785 ?auto_120788 ) ) ( not ( = ?auto_120786 ?auto_120788 ) ) ( not ( = ?auto_120787 ?auto_120788 ) ) ( ON ?auto_120786 ?auto_120787 ) ( ON-TABLE ?auto_120790 ) ( ON ?auto_120793 ?auto_120790 ) ( ON ?auto_120792 ?auto_120793 ) ( ON ?auto_120791 ?auto_120792 ) ( ON ?auto_120789 ?auto_120791 ) ( ON ?auto_120788 ?auto_120789 ) ( not ( = ?auto_120790 ?auto_120793 ) ) ( not ( = ?auto_120790 ?auto_120792 ) ) ( not ( = ?auto_120790 ?auto_120791 ) ) ( not ( = ?auto_120790 ?auto_120789 ) ) ( not ( = ?auto_120790 ?auto_120788 ) ) ( not ( = ?auto_120790 ?auto_120787 ) ) ( not ( = ?auto_120790 ?auto_120786 ) ) ( not ( = ?auto_120793 ?auto_120792 ) ) ( not ( = ?auto_120793 ?auto_120791 ) ) ( not ( = ?auto_120793 ?auto_120789 ) ) ( not ( = ?auto_120793 ?auto_120788 ) ) ( not ( = ?auto_120793 ?auto_120787 ) ) ( not ( = ?auto_120793 ?auto_120786 ) ) ( not ( = ?auto_120792 ?auto_120791 ) ) ( not ( = ?auto_120792 ?auto_120789 ) ) ( not ( = ?auto_120792 ?auto_120788 ) ) ( not ( = ?auto_120792 ?auto_120787 ) ) ( not ( = ?auto_120792 ?auto_120786 ) ) ( not ( = ?auto_120791 ?auto_120789 ) ) ( not ( = ?auto_120791 ?auto_120788 ) ) ( not ( = ?auto_120791 ?auto_120787 ) ) ( not ( = ?auto_120791 ?auto_120786 ) ) ( not ( = ?auto_120789 ?auto_120788 ) ) ( not ( = ?auto_120789 ?auto_120787 ) ) ( not ( = ?auto_120789 ?auto_120786 ) ) ( not ( = ?auto_120785 ?auto_120790 ) ) ( not ( = ?auto_120785 ?auto_120793 ) ) ( not ( = ?auto_120785 ?auto_120792 ) ) ( not ( = ?auto_120785 ?auto_120791 ) ) ( not ( = ?auto_120785 ?auto_120789 ) ) ( ON ?auto_120785 ?auto_120786 ) ( CLEAR ?auto_120785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_120790 ?auto_120793 ?auto_120792 ?auto_120791 ?auto_120789 ?auto_120788 ?auto_120787 ?auto_120786 )
      ( MAKE-3PILE ?auto_120785 ?auto_120786 ?auto_120787 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120799 - BLOCK
      ?auto_120800 - BLOCK
      ?auto_120801 - BLOCK
      ?auto_120802 - BLOCK
      ?auto_120803 - BLOCK
    )
    :vars
    (
      ?auto_120804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120804 ?auto_120803 ) ( CLEAR ?auto_120804 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120799 ) ( ON ?auto_120800 ?auto_120799 ) ( ON ?auto_120801 ?auto_120800 ) ( ON ?auto_120802 ?auto_120801 ) ( ON ?auto_120803 ?auto_120802 ) ( not ( = ?auto_120799 ?auto_120800 ) ) ( not ( = ?auto_120799 ?auto_120801 ) ) ( not ( = ?auto_120799 ?auto_120802 ) ) ( not ( = ?auto_120799 ?auto_120803 ) ) ( not ( = ?auto_120799 ?auto_120804 ) ) ( not ( = ?auto_120800 ?auto_120801 ) ) ( not ( = ?auto_120800 ?auto_120802 ) ) ( not ( = ?auto_120800 ?auto_120803 ) ) ( not ( = ?auto_120800 ?auto_120804 ) ) ( not ( = ?auto_120801 ?auto_120802 ) ) ( not ( = ?auto_120801 ?auto_120803 ) ) ( not ( = ?auto_120801 ?auto_120804 ) ) ( not ( = ?auto_120802 ?auto_120803 ) ) ( not ( = ?auto_120802 ?auto_120804 ) ) ( not ( = ?auto_120803 ?auto_120804 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120804 ?auto_120803 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120805 - BLOCK
      ?auto_120806 - BLOCK
      ?auto_120807 - BLOCK
      ?auto_120808 - BLOCK
      ?auto_120809 - BLOCK
    )
    :vars
    (
      ?auto_120810 - BLOCK
      ?auto_120811 - BLOCK
      ?auto_120812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120810 ?auto_120809 ) ( CLEAR ?auto_120810 ) ( ON-TABLE ?auto_120805 ) ( ON ?auto_120806 ?auto_120805 ) ( ON ?auto_120807 ?auto_120806 ) ( ON ?auto_120808 ?auto_120807 ) ( ON ?auto_120809 ?auto_120808 ) ( not ( = ?auto_120805 ?auto_120806 ) ) ( not ( = ?auto_120805 ?auto_120807 ) ) ( not ( = ?auto_120805 ?auto_120808 ) ) ( not ( = ?auto_120805 ?auto_120809 ) ) ( not ( = ?auto_120805 ?auto_120810 ) ) ( not ( = ?auto_120806 ?auto_120807 ) ) ( not ( = ?auto_120806 ?auto_120808 ) ) ( not ( = ?auto_120806 ?auto_120809 ) ) ( not ( = ?auto_120806 ?auto_120810 ) ) ( not ( = ?auto_120807 ?auto_120808 ) ) ( not ( = ?auto_120807 ?auto_120809 ) ) ( not ( = ?auto_120807 ?auto_120810 ) ) ( not ( = ?auto_120808 ?auto_120809 ) ) ( not ( = ?auto_120808 ?auto_120810 ) ) ( not ( = ?auto_120809 ?auto_120810 ) ) ( HOLDING ?auto_120811 ) ( CLEAR ?auto_120812 ) ( not ( = ?auto_120805 ?auto_120811 ) ) ( not ( = ?auto_120805 ?auto_120812 ) ) ( not ( = ?auto_120806 ?auto_120811 ) ) ( not ( = ?auto_120806 ?auto_120812 ) ) ( not ( = ?auto_120807 ?auto_120811 ) ) ( not ( = ?auto_120807 ?auto_120812 ) ) ( not ( = ?auto_120808 ?auto_120811 ) ) ( not ( = ?auto_120808 ?auto_120812 ) ) ( not ( = ?auto_120809 ?auto_120811 ) ) ( not ( = ?auto_120809 ?auto_120812 ) ) ( not ( = ?auto_120810 ?auto_120811 ) ) ( not ( = ?auto_120810 ?auto_120812 ) ) ( not ( = ?auto_120811 ?auto_120812 ) ) )
    :subtasks
    ( ( !STACK ?auto_120811 ?auto_120812 )
      ( MAKE-5PILE ?auto_120805 ?auto_120806 ?auto_120807 ?auto_120808 ?auto_120809 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120813 - BLOCK
      ?auto_120814 - BLOCK
      ?auto_120815 - BLOCK
      ?auto_120816 - BLOCK
      ?auto_120817 - BLOCK
    )
    :vars
    (
      ?auto_120818 - BLOCK
      ?auto_120819 - BLOCK
      ?auto_120820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120818 ?auto_120817 ) ( ON-TABLE ?auto_120813 ) ( ON ?auto_120814 ?auto_120813 ) ( ON ?auto_120815 ?auto_120814 ) ( ON ?auto_120816 ?auto_120815 ) ( ON ?auto_120817 ?auto_120816 ) ( not ( = ?auto_120813 ?auto_120814 ) ) ( not ( = ?auto_120813 ?auto_120815 ) ) ( not ( = ?auto_120813 ?auto_120816 ) ) ( not ( = ?auto_120813 ?auto_120817 ) ) ( not ( = ?auto_120813 ?auto_120818 ) ) ( not ( = ?auto_120814 ?auto_120815 ) ) ( not ( = ?auto_120814 ?auto_120816 ) ) ( not ( = ?auto_120814 ?auto_120817 ) ) ( not ( = ?auto_120814 ?auto_120818 ) ) ( not ( = ?auto_120815 ?auto_120816 ) ) ( not ( = ?auto_120815 ?auto_120817 ) ) ( not ( = ?auto_120815 ?auto_120818 ) ) ( not ( = ?auto_120816 ?auto_120817 ) ) ( not ( = ?auto_120816 ?auto_120818 ) ) ( not ( = ?auto_120817 ?auto_120818 ) ) ( CLEAR ?auto_120819 ) ( not ( = ?auto_120813 ?auto_120820 ) ) ( not ( = ?auto_120813 ?auto_120819 ) ) ( not ( = ?auto_120814 ?auto_120820 ) ) ( not ( = ?auto_120814 ?auto_120819 ) ) ( not ( = ?auto_120815 ?auto_120820 ) ) ( not ( = ?auto_120815 ?auto_120819 ) ) ( not ( = ?auto_120816 ?auto_120820 ) ) ( not ( = ?auto_120816 ?auto_120819 ) ) ( not ( = ?auto_120817 ?auto_120820 ) ) ( not ( = ?auto_120817 ?auto_120819 ) ) ( not ( = ?auto_120818 ?auto_120820 ) ) ( not ( = ?auto_120818 ?auto_120819 ) ) ( not ( = ?auto_120820 ?auto_120819 ) ) ( ON ?auto_120820 ?auto_120818 ) ( CLEAR ?auto_120820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120813 ?auto_120814 ?auto_120815 ?auto_120816 ?auto_120817 ?auto_120818 )
      ( MAKE-5PILE ?auto_120813 ?auto_120814 ?auto_120815 ?auto_120816 ?auto_120817 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120821 - BLOCK
      ?auto_120822 - BLOCK
      ?auto_120823 - BLOCK
      ?auto_120824 - BLOCK
      ?auto_120825 - BLOCK
    )
    :vars
    (
      ?auto_120828 - BLOCK
      ?auto_120827 - BLOCK
      ?auto_120826 - BLOCK
      ?auto_120829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120828 ?auto_120825 ) ( ON-TABLE ?auto_120821 ) ( ON ?auto_120822 ?auto_120821 ) ( ON ?auto_120823 ?auto_120822 ) ( ON ?auto_120824 ?auto_120823 ) ( ON ?auto_120825 ?auto_120824 ) ( not ( = ?auto_120821 ?auto_120822 ) ) ( not ( = ?auto_120821 ?auto_120823 ) ) ( not ( = ?auto_120821 ?auto_120824 ) ) ( not ( = ?auto_120821 ?auto_120825 ) ) ( not ( = ?auto_120821 ?auto_120828 ) ) ( not ( = ?auto_120822 ?auto_120823 ) ) ( not ( = ?auto_120822 ?auto_120824 ) ) ( not ( = ?auto_120822 ?auto_120825 ) ) ( not ( = ?auto_120822 ?auto_120828 ) ) ( not ( = ?auto_120823 ?auto_120824 ) ) ( not ( = ?auto_120823 ?auto_120825 ) ) ( not ( = ?auto_120823 ?auto_120828 ) ) ( not ( = ?auto_120824 ?auto_120825 ) ) ( not ( = ?auto_120824 ?auto_120828 ) ) ( not ( = ?auto_120825 ?auto_120828 ) ) ( not ( = ?auto_120821 ?auto_120827 ) ) ( not ( = ?auto_120821 ?auto_120826 ) ) ( not ( = ?auto_120822 ?auto_120827 ) ) ( not ( = ?auto_120822 ?auto_120826 ) ) ( not ( = ?auto_120823 ?auto_120827 ) ) ( not ( = ?auto_120823 ?auto_120826 ) ) ( not ( = ?auto_120824 ?auto_120827 ) ) ( not ( = ?auto_120824 ?auto_120826 ) ) ( not ( = ?auto_120825 ?auto_120827 ) ) ( not ( = ?auto_120825 ?auto_120826 ) ) ( not ( = ?auto_120828 ?auto_120827 ) ) ( not ( = ?auto_120828 ?auto_120826 ) ) ( not ( = ?auto_120827 ?auto_120826 ) ) ( ON ?auto_120827 ?auto_120828 ) ( CLEAR ?auto_120827 ) ( HOLDING ?auto_120826 ) ( CLEAR ?auto_120829 ) ( ON-TABLE ?auto_120829 ) ( not ( = ?auto_120829 ?auto_120826 ) ) ( not ( = ?auto_120821 ?auto_120829 ) ) ( not ( = ?auto_120822 ?auto_120829 ) ) ( not ( = ?auto_120823 ?auto_120829 ) ) ( not ( = ?auto_120824 ?auto_120829 ) ) ( not ( = ?auto_120825 ?auto_120829 ) ) ( not ( = ?auto_120828 ?auto_120829 ) ) ( not ( = ?auto_120827 ?auto_120829 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120829 ?auto_120826 )
      ( MAKE-5PILE ?auto_120821 ?auto_120822 ?auto_120823 ?auto_120824 ?auto_120825 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_122349 - BLOCK
      ?auto_122350 - BLOCK
      ?auto_122351 - BLOCK
      ?auto_122352 - BLOCK
      ?auto_122353 - BLOCK
    )
    :vars
    (
      ?auto_122354 - BLOCK
      ?auto_122356 - BLOCK
      ?auto_122355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122354 ?auto_122353 ) ( ON-TABLE ?auto_122349 ) ( ON ?auto_122350 ?auto_122349 ) ( ON ?auto_122351 ?auto_122350 ) ( ON ?auto_122352 ?auto_122351 ) ( ON ?auto_122353 ?auto_122352 ) ( not ( = ?auto_122349 ?auto_122350 ) ) ( not ( = ?auto_122349 ?auto_122351 ) ) ( not ( = ?auto_122349 ?auto_122352 ) ) ( not ( = ?auto_122349 ?auto_122353 ) ) ( not ( = ?auto_122349 ?auto_122354 ) ) ( not ( = ?auto_122350 ?auto_122351 ) ) ( not ( = ?auto_122350 ?auto_122352 ) ) ( not ( = ?auto_122350 ?auto_122353 ) ) ( not ( = ?auto_122350 ?auto_122354 ) ) ( not ( = ?auto_122351 ?auto_122352 ) ) ( not ( = ?auto_122351 ?auto_122353 ) ) ( not ( = ?auto_122351 ?auto_122354 ) ) ( not ( = ?auto_122352 ?auto_122353 ) ) ( not ( = ?auto_122352 ?auto_122354 ) ) ( not ( = ?auto_122353 ?auto_122354 ) ) ( not ( = ?auto_122349 ?auto_122356 ) ) ( not ( = ?auto_122349 ?auto_122355 ) ) ( not ( = ?auto_122350 ?auto_122356 ) ) ( not ( = ?auto_122350 ?auto_122355 ) ) ( not ( = ?auto_122351 ?auto_122356 ) ) ( not ( = ?auto_122351 ?auto_122355 ) ) ( not ( = ?auto_122352 ?auto_122356 ) ) ( not ( = ?auto_122352 ?auto_122355 ) ) ( not ( = ?auto_122353 ?auto_122356 ) ) ( not ( = ?auto_122353 ?auto_122355 ) ) ( not ( = ?auto_122354 ?auto_122356 ) ) ( not ( = ?auto_122354 ?auto_122355 ) ) ( not ( = ?auto_122356 ?auto_122355 ) ) ( ON ?auto_122356 ?auto_122354 ) ( ON ?auto_122355 ?auto_122356 ) ( CLEAR ?auto_122355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122349 ?auto_122350 ?auto_122351 ?auto_122352 ?auto_122353 ?auto_122354 ?auto_122356 )
      ( MAKE-5PILE ?auto_122349 ?auto_122350 ?auto_122351 ?auto_122352 ?auto_122353 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120839 - BLOCK
      ?auto_120840 - BLOCK
      ?auto_120841 - BLOCK
      ?auto_120842 - BLOCK
      ?auto_120843 - BLOCK
    )
    :vars
    (
      ?auto_120844 - BLOCK
      ?auto_120845 - BLOCK
      ?auto_120847 - BLOCK
      ?auto_120846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120844 ?auto_120843 ) ( ON-TABLE ?auto_120839 ) ( ON ?auto_120840 ?auto_120839 ) ( ON ?auto_120841 ?auto_120840 ) ( ON ?auto_120842 ?auto_120841 ) ( ON ?auto_120843 ?auto_120842 ) ( not ( = ?auto_120839 ?auto_120840 ) ) ( not ( = ?auto_120839 ?auto_120841 ) ) ( not ( = ?auto_120839 ?auto_120842 ) ) ( not ( = ?auto_120839 ?auto_120843 ) ) ( not ( = ?auto_120839 ?auto_120844 ) ) ( not ( = ?auto_120840 ?auto_120841 ) ) ( not ( = ?auto_120840 ?auto_120842 ) ) ( not ( = ?auto_120840 ?auto_120843 ) ) ( not ( = ?auto_120840 ?auto_120844 ) ) ( not ( = ?auto_120841 ?auto_120842 ) ) ( not ( = ?auto_120841 ?auto_120843 ) ) ( not ( = ?auto_120841 ?auto_120844 ) ) ( not ( = ?auto_120842 ?auto_120843 ) ) ( not ( = ?auto_120842 ?auto_120844 ) ) ( not ( = ?auto_120843 ?auto_120844 ) ) ( not ( = ?auto_120839 ?auto_120845 ) ) ( not ( = ?auto_120839 ?auto_120847 ) ) ( not ( = ?auto_120840 ?auto_120845 ) ) ( not ( = ?auto_120840 ?auto_120847 ) ) ( not ( = ?auto_120841 ?auto_120845 ) ) ( not ( = ?auto_120841 ?auto_120847 ) ) ( not ( = ?auto_120842 ?auto_120845 ) ) ( not ( = ?auto_120842 ?auto_120847 ) ) ( not ( = ?auto_120843 ?auto_120845 ) ) ( not ( = ?auto_120843 ?auto_120847 ) ) ( not ( = ?auto_120844 ?auto_120845 ) ) ( not ( = ?auto_120844 ?auto_120847 ) ) ( not ( = ?auto_120845 ?auto_120847 ) ) ( ON ?auto_120845 ?auto_120844 ) ( not ( = ?auto_120846 ?auto_120847 ) ) ( not ( = ?auto_120839 ?auto_120846 ) ) ( not ( = ?auto_120840 ?auto_120846 ) ) ( not ( = ?auto_120841 ?auto_120846 ) ) ( not ( = ?auto_120842 ?auto_120846 ) ) ( not ( = ?auto_120843 ?auto_120846 ) ) ( not ( = ?auto_120844 ?auto_120846 ) ) ( not ( = ?auto_120845 ?auto_120846 ) ) ( ON ?auto_120847 ?auto_120845 ) ( CLEAR ?auto_120847 ) ( HOLDING ?auto_120846 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120846 )
      ( MAKE-5PILE ?auto_120839 ?auto_120840 ?auto_120841 ?auto_120842 ?auto_120843 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120848 - BLOCK
      ?auto_120849 - BLOCK
      ?auto_120850 - BLOCK
      ?auto_120851 - BLOCK
      ?auto_120852 - BLOCK
    )
    :vars
    (
      ?auto_120854 - BLOCK
      ?auto_120855 - BLOCK
      ?auto_120856 - BLOCK
      ?auto_120853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120854 ?auto_120852 ) ( ON-TABLE ?auto_120848 ) ( ON ?auto_120849 ?auto_120848 ) ( ON ?auto_120850 ?auto_120849 ) ( ON ?auto_120851 ?auto_120850 ) ( ON ?auto_120852 ?auto_120851 ) ( not ( = ?auto_120848 ?auto_120849 ) ) ( not ( = ?auto_120848 ?auto_120850 ) ) ( not ( = ?auto_120848 ?auto_120851 ) ) ( not ( = ?auto_120848 ?auto_120852 ) ) ( not ( = ?auto_120848 ?auto_120854 ) ) ( not ( = ?auto_120849 ?auto_120850 ) ) ( not ( = ?auto_120849 ?auto_120851 ) ) ( not ( = ?auto_120849 ?auto_120852 ) ) ( not ( = ?auto_120849 ?auto_120854 ) ) ( not ( = ?auto_120850 ?auto_120851 ) ) ( not ( = ?auto_120850 ?auto_120852 ) ) ( not ( = ?auto_120850 ?auto_120854 ) ) ( not ( = ?auto_120851 ?auto_120852 ) ) ( not ( = ?auto_120851 ?auto_120854 ) ) ( not ( = ?auto_120852 ?auto_120854 ) ) ( not ( = ?auto_120848 ?auto_120855 ) ) ( not ( = ?auto_120848 ?auto_120856 ) ) ( not ( = ?auto_120849 ?auto_120855 ) ) ( not ( = ?auto_120849 ?auto_120856 ) ) ( not ( = ?auto_120850 ?auto_120855 ) ) ( not ( = ?auto_120850 ?auto_120856 ) ) ( not ( = ?auto_120851 ?auto_120855 ) ) ( not ( = ?auto_120851 ?auto_120856 ) ) ( not ( = ?auto_120852 ?auto_120855 ) ) ( not ( = ?auto_120852 ?auto_120856 ) ) ( not ( = ?auto_120854 ?auto_120855 ) ) ( not ( = ?auto_120854 ?auto_120856 ) ) ( not ( = ?auto_120855 ?auto_120856 ) ) ( ON ?auto_120855 ?auto_120854 ) ( not ( = ?auto_120853 ?auto_120856 ) ) ( not ( = ?auto_120848 ?auto_120853 ) ) ( not ( = ?auto_120849 ?auto_120853 ) ) ( not ( = ?auto_120850 ?auto_120853 ) ) ( not ( = ?auto_120851 ?auto_120853 ) ) ( not ( = ?auto_120852 ?auto_120853 ) ) ( not ( = ?auto_120854 ?auto_120853 ) ) ( not ( = ?auto_120855 ?auto_120853 ) ) ( ON ?auto_120856 ?auto_120855 ) ( ON ?auto_120853 ?auto_120856 ) ( CLEAR ?auto_120853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_120848 ?auto_120849 ?auto_120850 ?auto_120851 ?auto_120852 ?auto_120854 ?auto_120855 ?auto_120856 )
      ( MAKE-5PILE ?auto_120848 ?auto_120849 ?auto_120850 ?auto_120851 ?auto_120852 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120861 - BLOCK
      ?auto_120862 - BLOCK
      ?auto_120863 - BLOCK
      ?auto_120864 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_120864 ) ( CLEAR ?auto_120863 ) ( ON-TABLE ?auto_120861 ) ( ON ?auto_120862 ?auto_120861 ) ( ON ?auto_120863 ?auto_120862 ) ( not ( = ?auto_120861 ?auto_120862 ) ) ( not ( = ?auto_120861 ?auto_120863 ) ) ( not ( = ?auto_120861 ?auto_120864 ) ) ( not ( = ?auto_120862 ?auto_120863 ) ) ( not ( = ?auto_120862 ?auto_120864 ) ) ( not ( = ?auto_120863 ?auto_120864 ) ) )
    :subtasks
    ( ( !STACK ?auto_120864 ?auto_120863 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120865 - BLOCK
      ?auto_120866 - BLOCK
      ?auto_120867 - BLOCK
      ?auto_120868 - BLOCK
    )
    :vars
    (
      ?auto_120869 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_120867 ) ( ON-TABLE ?auto_120865 ) ( ON ?auto_120866 ?auto_120865 ) ( ON ?auto_120867 ?auto_120866 ) ( not ( = ?auto_120865 ?auto_120866 ) ) ( not ( = ?auto_120865 ?auto_120867 ) ) ( not ( = ?auto_120865 ?auto_120868 ) ) ( not ( = ?auto_120866 ?auto_120867 ) ) ( not ( = ?auto_120866 ?auto_120868 ) ) ( not ( = ?auto_120867 ?auto_120868 ) ) ( ON ?auto_120868 ?auto_120869 ) ( CLEAR ?auto_120868 ) ( HAND-EMPTY ) ( not ( = ?auto_120865 ?auto_120869 ) ) ( not ( = ?auto_120866 ?auto_120869 ) ) ( not ( = ?auto_120867 ?auto_120869 ) ) ( not ( = ?auto_120868 ?auto_120869 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120868 ?auto_120869 )
      ( MAKE-4PILE ?auto_120865 ?auto_120866 ?auto_120867 ?auto_120868 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120870 - BLOCK
      ?auto_120871 - BLOCK
      ?auto_120872 - BLOCK
      ?auto_120873 - BLOCK
    )
    :vars
    (
      ?auto_120874 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120870 ) ( ON ?auto_120871 ?auto_120870 ) ( not ( = ?auto_120870 ?auto_120871 ) ) ( not ( = ?auto_120870 ?auto_120872 ) ) ( not ( = ?auto_120870 ?auto_120873 ) ) ( not ( = ?auto_120871 ?auto_120872 ) ) ( not ( = ?auto_120871 ?auto_120873 ) ) ( not ( = ?auto_120872 ?auto_120873 ) ) ( ON ?auto_120873 ?auto_120874 ) ( CLEAR ?auto_120873 ) ( not ( = ?auto_120870 ?auto_120874 ) ) ( not ( = ?auto_120871 ?auto_120874 ) ) ( not ( = ?auto_120872 ?auto_120874 ) ) ( not ( = ?auto_120873 ?auto_120874 ) ) ( HOLDING ?auto_120872 ) ( CLEAR ?auto_120871 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120870 ?auto_120871 ?auto_120872 )
      ( MAKE-4PILE ?auto_120870 ?auto_120871 ?auto_120872 ?auto_120873 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120875 - BLOCK
      ?auto_120876 - BLOCK
      ?auto_120877 - BLOCK
      ?auto_120878 - BLOCK
    )
    :vars
    (
      ?auto_120879 - BLOCK
      ?auto_120883 - BLOCK
      ?auto_120882 - BLOCK
      ?auto_120880 - BLOCK
      ?auto_120881 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120875 ) ( ON ?auto_120876 ?auto_120875 ) ( not ( = ?auto_120875 ?auto_120876 ) ) ( not ( = ?auto_120875 ?auto_120877 ) ) ( not ( = ?auto_120875 ?auto_120878 ) ) ( not ( = ?auto_120876 ?auto_120877 ) ) ( not ( = ?auto_120876 ?auto_120878 ) ) ( not ( = ?auto_120877 ?auto_120878 ) ) ( ON ?auto_120878 ?auto_120879 ) ( not ( = ?auto_120875 ?auto_120879 ) ) ( not ( = ?auto_120876 ?auto_120879 ) ) ( not ( = ?auto_120877 ?auto_120879 ) ) ( not ( = ?auto_120878 ?auto_120879 ) ) ( CLEAR ?auto_120876 ) ( ON ?auto_120877 ?auto_120878 ) ( CLEAR ?auto_120877 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120883 ) ( ON ?auto_120882 ?auto_120883 ) ( ON ?auto_120880 ?auto_120882 ) ( ON ?auto_120881 ?auto_120880 ) ( ON ?auto_120879 ?auto_120881 ) ( not ( = ?auto_120883 ?auto_120882 ) ) ( not ( = ?auto_120883 ?auto_120880 ) ) ( not ( = ?auto_120883 ?auto_120881 ) ) ( not ( = ?auto_120883 ?auto_120879 ) ) ( not ( = ?auto_120883 ?auto_120878 ) ) ( not ( = ?auto_120883 ?auto_120877 ) ) ( not ( = ?auto_120882 ?auto_120880 ) ) ( not ( = ?auto_120882 ?auto_120881 ) ) ( not ( = ?auto_120882 ?auto_120879 ) ) ( not ( = ?auto_120882 ?auto_120878 ) ) ( not ( = ?auto_120882 ?auto_120877 ) ) ( not ( = ?auto_120880 ?auto_120881 ) ) ( not ( = ?auto_120880 ?auto_120879 ) ) ( not ( = ?auto_120880 ?auto_120878 ) ) ( not ( = ?auto_120880 ?auto_120877 ) ) ( not ( = ?auto_120881 ?auto_120879 ) ) ( not ( = ?auto_120881 ?auto_120878 ) ) ( not ( = ?auto_120881 ?auto_120877 ) ) ( not ( = ?auto_120875 ?auto_120883 ) ) ( not ( = ?auto_120875 ?auto_120882 ) ) ( not ( = ?auto_120875 ?auto_120880 ) ) ( not ( = ?auto_120875 ?auto_120881 ) ) ( not ( = ?auto_120876 ?auto_120883 ) ) ( not ( = ?auto_120876 ?auto_120882 ) ) ( not ( = ?auto_120876 ?auto_120880 ) ) ( not ( = ?auto_120876 ?auto_120881 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120883 ?auto_120882 ?auto_120880 ?auto_120881 ?auto_120879 ?auto_120878 )
      ( MAKE-4PILE ?auto_120875 ?auto_120876 ?auto_120877 ?auto_120878 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120884 - BLOCK
      ?auto_120885 - BLOCK
      ?auto_120886 - BLOCK
      ?auto_120887 - BLOCK
    )
    :vars
    (
      ?auto_120889 - BLOCK
      ?auto_120890 - BLOCK
      ?auto_120892 - BLOCK
      ?auto_120888 - BLOCK
      ?auto_120891 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120884 ) ( not ( = ?auto_120884 ?auto_120885 ) ) ( not ( = ?auto_120884 ?auto_120886 ) ) ( not ( = ?auto_120884 ?auto_120887 ) ) ( not ( = ?auto_120885 ?auto_120886 ) ) ( not ( = ?auto_120885 ?auto_120887 ) ) ( not ( = ?auto_120886 ?auto_120887 ) ) ( ON ?auto_120887 ?auto_120889 ) ( not ( = ?auto_120884 ?auto_120889 ) ) ( not ( = ?auto_120885 ?auto_120889 ) ) ( not ( = ?auto_120886 ?auto_120889 ) ) ( not ( = ?auto_120887 ?auto_120889 ) ) ( ON ?auto_120886 ?auto_120887 ) ( CLEAR ?auto_120886 ) ( ON-TABLE ?auto_120890 ) ( ON ?auto_120892 ?auto_120890 ) ( ON ?auto_120888 ?auto_120892 ) ( ON ?auto_120891 ?auto_120888 ) ( ON ?auto_120889 ?auto_120891 ) ( not ( = ?auto_120890 ?auto_120892 ) ) ( not ( = ?auto_120890 ?auto_120888 ) ) ( not ( = ?auto_120890 ?auto_120891 ) ) ( not ( = ?auto_120890 ?auto_120889 ) ) ( not ( = ?auto_120890 ?auto_120887 ) ) ( not ( = ?auto_120890 ?auto_120886 ) ) ( not ( = ?auto_120892 ?auto_120888 ) ) ( not ( = ?auto_120892 ?auto_120891 ) ) ( not ( = ?auto_120892 ?auto_120889 ) ) ( not ( = ?auto_120892 ?auto_120887 ) ) ( not ( = ?auto_120892 ?auto_120886 ) ) ( not ( = ?auto_120888 ?auto_120891 ) ) ( not ( = ?auto_120888 ?auto_120889 ) ) ( not ( = ?auto_120888 ?auto_120887 ) ) ( not ( = ?auto_120888 ?auto_120886 ) ) ( not ( = ?auto_120891 ?auto_120889 ) ) ( not ( = ?auto_120891 ?auto_120887 ) ) ( not ( = ?auto_120891 ?auto_120886 ) ) ( not ( = ?auto_120884 ?auto_120890 ) ) ( not ( = ?auto_120884 ?auto_120892 ) ) ( not ( = ?auto_120884 ?auto_120888 ) ) ( not ( = ?auto_120884 ?auto_120891 ) ) ( not ( = ?auto_120885 ?auto_120890 ) ) ( not ( = ?auto_120885 ?auto_120892 ) ) ( not ( = ?auto_120885 ?auto_120888 ) ) ( not ( = ?auto_120885 ?auto_120891 ) ) ( HOLDING ?auto_120885 ) ( CLEAR ?auto_120884 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120884 ?auto_120885 )
      ( MAKE-4PILE ?auto_120884 ?auto_120885 ?auto_120886 ?auto_120887 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120893 - BLOCK
      ?auto_120894 - BLOCK
      ?auto_120895 - BLOCK
      ?auto_120896 - BLOCK
    )
    :vars
    (
      ?auto_120897 - BLOCK
      ?auto_120901 - BLOCK
      ?auto_120899 - BLOCK
      ?auto_120898 - BLOCK
      ?auto_120900 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120893 ) ( not ( = ?auto_120893 ?auto_120894 ) ) ( not ( = ?auto_120893 ?auto_120895 ) ) ( not ( = ?auto_120893 ?auto_120896 ) ) ( not ( = ?auto_120894 ?auto_120895 ) ) ( not ( = ?auto_120894 ?auto_120896 ) ) ( not ( = ?auto_120895 ?auto_120896 ) ) ( ON ?auto_120896 ?auto_120897 ) ( not ( = ?auto_120893 ?auto_120897 ) ) ( not ( = ?auto_120894 ?auto_120897 ) ) ( not ( = ?auto_120895 ?auto_120897 ) ) ( not ( = ?auto_120896 ?auto_120897 ) ) ( ON ?auto_120895 ?auto_120896 ) ( ON-TABLE ?auto_120901 ) ( ON ?auto_120899 ?auto_120901 ) ( ON ?auto_120898 ?auto_120899 ) ( ON ?auto_120900 ?auto_120898 ) ( ON ?auto_120897 ?auto_120900 ) ( not ( = ?auto_120901 ?auto_120899 ) ) ( not ( = ?auto_120901 ?auto_120898 ) ) ( not ( = ?auto_120901 ?auto_120900 ) ) ( not ( = ?auto_120901 ?auto_120897 ) ) ( not ( = ?auto_120901 ?auto_120896 ) ) ( not ( = ?auto_120901 ?auto_120895 ) ) ( not ( = ?auto_120899 ?auto_120898 ) ) ( not ( = ?auto_120899 ?auto_120900 ) ) ( not ( = ?auto_120899 ?auto_120897 ) ) ( not ( = ?auto_120899 ?auto_120896 ) ) ( not ( = ?auto_120899 ?auto_120895 ) ) ( not ( = ?auto_120898 ?auto_120900 ) ) ( not ( = ?auto_120898 ?auto_120897 ) ) ( not ( = ?auto_120898 ?auto_120896 ) ) ( not ( = ?auto_120898 ?auto_120895 ) ) ( not ( = ?auto_120900 ?auto_120897 ) ) ( not ( = ?auto_120900 ?auto_120896 ) ) ( not ( = ?auto_120900 ?auto_120895 ) ) ( not ( = ?auto_120893 ?auto_120901 ) ) ( not ( = ?auto_120893 ?auto_120899 ) ) ( not ( = ?auto_120893 ?auto_120898 ) ) ( not ( = ?auto_120893 ?auto_120900 ) ) ( not ( = ?auto_120894 ?auto_120901 ) ) ( not ( = ?auto_120894 ?auto_120899 ) ) ( not ( = ?auto_120894 ?auto_120898 ) ) ( not ( = ?auto_120894 ?auto_120900 ) ) ( CLEAR ?auto_120893 ) ( ON ?auto_120894 ?auto_120895 ) ( CLEAR ?auto_120894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_120901 ?auto_120899 ?auto_120898 ?auto_120900 ?auto_120897 ?auto_120896 ?auto_120895 )
      ( MAKE-4PILE ?auto_120893 ?auto_120894 ?auto_120895 ?auto_120896 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120902 - BLOCK
      ?auto_120903 - BLOCK
      ?auto_120904 - BLOCK
      ?auto_120905 - BLOCK
    )
    :vars
    (
      ?auto_120910 - BLOCK
      ?auto_120908 - BLOCK
      ?auto_120906 - BLOCK
      ?auto_120907 - BLOCK
      ?auto_120909 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120902 ?auto_120903 ) ) ( not ( = ?auto_120902 ?auto_120904 ) ) ( not ( = ?auto_120902 ?auto_120905 ) ) ( not ( = ?auto_120903 ?auto_120904 ) ) ( not ( = ?auto_120903 ?auto_120905 ) ) ( not ( = ?auto_120904 ?auto_120905 ) ) ( ON ?auto_120905 ?auto_120910 ) ( not ( = ?auto_120902 ?auto_120910 ) ) ( not ( = ?auto_120903 ?auto_120910 ) ) ( not ( = ?auto_120904 ?auto_120910 ) ) ( not ( = ?auto_120905 ?auto_120910 ) ) ( ON ?auto_120904 ?auto_120905 ) ( ON-TABLE ?auto_120908 ) ( ON ?auto_120906 ?auto_120908 ) ( ON ?auto_120907 ?auto_120906 ) ( ON ?auto_120909 ?auto_120907 ) ( ON ?auto_120910 ?auto_120909 ) ( not ( = ?auto_120908 ?auto_120906 ) ) ( not ( = ?auto_120908 ?auto_120907 ) ) ( not ( = ?auto_120908 ?auto_120909 ) ) ( not ( = ?auto_120908 ?auto_120910 ) ) ( not ( = ?auto_120908 ?auto_120905 ) ) ( not ( = ?auto_120908 ?auto_120904 ) ) ( not ( = ?auto_120906 ?auto_120907 ) ) ( not ( = ?auto_120906 ?auto_120909 ) ) ( not ( = ?auto_120906 ?auto_120910 ) ) ( not ( = ?auto_120906 ?auto_120905 ) ) ( not ( = ?auto_120906 ?auto_120904 ) ) ( not ( = ?auto_120907 ?auto_120909 ) ) ( not ( = ?auto_120907 ?auto_120910 ) ) ( not ( = ?auto_120907 ?auto_120905 ) ) ( not ( = ?auto_120907 ?auto_120904 ) ) ( not ( = ?auto_120909 ?auto_120910 ) ) ( not ( = ?auto_120909 ?auto_120905 ) ) ( not ( = ?auto_120909 ?auto_120904 ) ) ( not ( = ?auto_120902 ?auto_120908 ) ) ( not ( = ?auto_120902 ?auto_120906 ) ) ( not ( = ?auto_120902 ?auto_120907 ) ) ( not ( = ?auto_120902 ?auto_120909 ) ) ( not ( = ?auto_120903 ?auto_120908 ) ) ( not ( = ?auto_120903 ?auto_120906 ) ) ( not ( = ?auto_120903 ?auto_120907 ) ) ( not ( = ?auto_120903 ?auto_120909 ) ) ( ON ?auto_120903 ?auto_120904 ) ( CLEAR ?auto_120903 ) ( HOLDING ?auto_120902 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120902 )
      ( MAKE-4PILE ?auto_120902 ?auto_120903 ?auto_120904 ?auto_120905 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120911 - BLOCK
      ?auto_120912 - BLOCK
      ?auto_120913 - BLOCK
      ?auto_120914 - BLOCK
    )
    :vars
    (
      ?auto_120915 - BLOCK
      ?auto_120916 - BLOCK
      ?auto_120919 - BLOCK
      ?auto_120918 - BLOCK
      ?auto_120917 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120911 ?auto_120912 ) ) ( not ( = ?auto_120911 ?auto_120913 ) ) ( not ( = ?auto_120911 ?auto_120914 ) ) ( not ( = ?auto_120912 ?auto_120913 ) ) ( not ( = ?auto_120912 ?auto_120914 ) ) ( not ( = ?auto_120913 ?auto_120914 ) ) ( ON ?auto_120914 ?auto_120915 ) ( not ( = ?auto_120911 ?auto_120915 ) ) ( not ( = ?auto_120912 ?auto_120915 ) ) ( not ( = ?auto_120913 ?auto_120915 ) ) ( not ( = ?auto_120914 ?auto_120915 ) ) ( ON ?auto_120913 ?auto_120914 ) ( ON-TABLE ?auto_120916 ) ( ON ?auto_120919 ?auto_120916 ) ( ON ?auto_120918 ?auto_120919 ) ( ON ?auto_120917 ?auto_120918 ) ( ON ?auto_120915 ?auto_120917 ) ( not ( = ?auto_120916 ?auto_120919 ) ) ( not ( = ?auto_120916 ?auto_120918 ) ) ( not ( = ?auto_120916 ?auto_120917 ) ) ( not ( = ?auto_120916 ?auto_120915 ) ) ( not ( = ?auto_120916 ?auto_120914 ) ) ( not ( = ?auto_120916 ?auto_120913 ) ) ( not ( = ?auto_120919 ?auto_120918 ) ) ( not ( = ?auto_120919 ?auto_120917 ) ) ( not ( = ?auto_120919 ?auto_120915 ) ) ( not ( = ?auto_120919 ?auto_120914 ) ) ( not ( = ?auto_120919 ?auto_120913 ) ) ( not ( = ?auto_120918 ?auto_120917 ) ) ( not ( = ?auto_120918 ?auto_120915 ) ) ( not ( = ?auto_120918 ?auto_120914 ) ) ( not ( = ?auto_120918 ?auto_120913 ) ) ( not ( = ?auto_120917 ?auto_120915 ) ) ( not ( = ?auto_120917 ?auto_120914 ) ) ( not ( = ?auto_120917 ?auto_120913 ) ) ( not ( = ?auto_120911 ?auto_120916 ) ) ( not ( = ?auto_120911 ?auto_120919 ) ) ( not ( = ?auto_120911 ?auto_120918 ) ) ( not ( = ?auto_120911 ?auto_120917 ) ) ( not ( = ?auto_120912 ?auto_120916 ) ) ( not ( = ?auto_120912 ?auto_120919 ) ) ( not ( = ?auto_120912 ?auto_120918 ) ) ( not ( = ?auto_120912 ?auto_120917 ) ) ( ON ?auto_120912 ?auto_120913 ) ( ON ?auto_120911 ?auto_120912 ) ( CLEAR ?auto_120911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_120916 ?auto_120919 ?auto_120918 ?auto_120917 ?auto_120915 ?auto_120914 ?auto_120913 ?auto_120912 )
      ( MAKE-4PILE ?auto_120911 ?auto_120912 ?auto_120913 ?auto_120914 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120924 - BLOCK
      ?auto_120925 - BLOCK
      ?auto_120926 - BLOCK
      ?auto_120927 - BLOCK
    )
    :vars
    (
      ?auto_120928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120928 ?auto_120927 ) ( CLEAR ?auto_120928 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120924 ) ( ON ?auto_120925 ?auto_120924 ) ( ON ?auto_120926 ?auto_120925 ) ( ON ?auto_120927 ?auto_120926 ) ( not ( = ?auto_120924 ?auto_120925 ) ) ( not ( = ?auto_120924 ?auto_120926 ) ) ( not ( = ?auto_120924 ?auto_120927 ) ) ( not ( = ?auto_120924 ?auto_120928 ) ) ( not ( = ?auto_120925 ?auto_120926 ) ) ( not ( = ?auto_120925 ?auto_120927 ) ) ( not ( = ?auto_120925 ?auto_120928 ) ) ( not ( = ?auto_120926 ?auto_120927 ) ) ( not ( = ?auto_120926 ?auto_120928 ) ) ( not ( = ?auto_120927 ?auto_120928 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120928 ?auto_120927 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120929 - BLOCK
      ?auto_120930 - BLOCK
      ?auto_120931 - BLOCK
      ?auto_120932 - BLOCK
    )
    :vars
    (
      ?auto_120933 - BLOCK
      ?auto_120934 - BLOCK
      ?auto_120935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120933 ?auto_120932 ) ( CLEAR ?auto_120933 ) ( ON-TABLE ?auto_120929 ) ( ON ?auto_120930 ?auto_120929 ) ( ON ?auto_120931 ?auto_120930 ) ( ON ?auto_120932 ?auto_120931 ) ( not ( = ?auto_120929 ?auto_120930 ) ) ( not ( = ?auto_120929 ?auto_120931 ) ) ( not ( = ?auto_120929 ?auto_120932 ) ) ( not ( = ?auto_120929 ?auto_120933 ) ) ( not ( = ?auto_120930 ?auto_120931 ) ) ( not ( = ?auto_120930 ?auto_120932 ) ) ( not ( = ?auto_120930 ?auto_120933 ) ) ( not ( = ?auto_120931 ?auto_120932 ) ) ( not ( = ?auto_120931 ?auto_120933 ) ) ( not ( = ?auto_120932 ?auto_120933 ) ) ( HOLDING ?auto_120934 ) ( CLEAR ?auto_120935 ) ( not ( = ?auto_120929 ?auto_120934 ) ) ( not ( = ?auto_120929 ?auto_120935 ) ) ( not ( = ?auto_120930 ?auto_120934 ) ) ( not ( = ?auto_120930 ?auto_120935 ) ) ( not ( = ?auto_120931 ?auto_120934 ) ) ( not ( = ?auto_120931 ?auto_120935 ) ) ( not ( = ?auto_120932 ?auto_120934 ) ) ( not ( = ?auto_120932 ?auto_120935 ) ) ( not ( = ?auto_120933 ?auto_120934 ) ) ( not ( = ?auto_120933 ?auto_120935 ) ) ( not ( = ?auto_120934 ?auto_120935 ) ) )
    :subtasks
    ( ( !STACK ?auto_120934 ?auto_120935 )
      ( MAKE-4PILE ?auto_120929 ?auto_120930 ?auto_120931 ?auto_120932 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120936 - BLOCK
      ?auto_120937 - BLOCK
      ?auto_120938 - BLOCK
      ?auto_120939 - BLOCK
    )
    :vars
    (
      ?auto_120942 - BLOCK
      ?auto_120940 - BLOCK
      ?auto_120941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120942 ?auto_120939 ) ( ON-TABLE ?auto_120936 ) ( ON ?auto_120937 ?auto_120936 ) ( ON ?auto_120938 ?auto_120937 ) ( ON ?auto_120939 ?auto_120938 ) ( not ( = ?auto_120936 ?auto_120937 ) ) ( not ( = ?auto_120936 ?auto_120938 ) ) ( not ( = ?auto_120936 ?auto_120939 ) ) ( not ( = ?auto_120936 ?auto_120942 ) ) ( not ( = ?auto_120937 ?auto_120938 ) ) ( not ( = ?auto_120937 ?auto_120939 ) ) ( not ( = ?auto_120937 ?auto_120942 ) ) ( not ( = ?auto_120938 ?auto_120939 ) ) ( not ( = ?auto_120938 ?auto_120942 ) ) ( not ( = ?auto_120939 ?auto_120942 ) ) ( CLEAR ?auto_120940 ) ( not ( = ?auto_120936 ?auto_120941 ) ) ( not ( = ?auto_120936 ?auto_120940 ) ) ( not ( = ?auto_120937 ?auto_120941 ) ) ( not ( = ?auto_120937 ?auto_120940 ) ) ( not ( = ?auto_120938 ?auto_120941 ) ) ( not ( = ?auto_120938 ?auto_120940 ) ) ( not ( = ?auto_120939 ?auto_120941 ) ) ( not ( = ?auto_120939 ?auto_120940 ) ) ( not ( = ?auto_120942 ?auto_120941 ) ) ( not ( = ?auto_120942 ?auto_120940 ) ) ( not ( = ?auto_120941 ?auto_120940 ) ) ( ON ?auto_120941 ?auto_120942 ) ( CLEAR ?auto_120941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120936 ?auto_120937 ?auto_120938 ?auto_120939 ?auto_120942 )
      ( MAKE-4PILE ?auto_120936 ?auto_120937 ?auto_120938 ?auto_120939 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120943 - BLOCK
      ?auto_120944 - BLOCK
      ?auto_120945 - BLOCK
      ?auto_120946 - BLOCK
    )
    :vars
    (
      ?auto_120947 - BLOCK
      ?auto_120948 - BLOCK
      ?auto_120949 - BLOCK
      ?auto_120950 - BLOCK
      ?auto_120951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120947 ?auto_120946 ) ( ON-TABLE ?auto_120943 ) ( ON ?auto_120944 ?auto_120943 ) ( ON ?auto_120945 ?auto_120944 ) ( ON ?auto_120946 ?auto_120945 ) ( not ( = ?auto_120943 ?auto_120944 ) ) ( not ( = ?auto_120943 ?auto_120945 ) ) ( not ( = ?auto_120943 ?auto_120946 ) ) ( not ( = ?auto_120943 ?auto_120947 ) ) ( not ( = ?auto_120944 ?auto_120945 ) ) ( not ( = ?auto_120944 ?auto_120946 ) ) ( not ( = ?auto_120944 ?auto_120947 ) ) ( not ( = ?auto_120945 ?auto_120946 ) ) ( not ( = ?auto_120945 ?auto_120947 ) ) ( not ( = ?auto_120946 ?auto_120947 ) ) ( not ( = ?auto_120943 ?auto_120948 ) ) ( not ( = ?auto_120943 ?auto_120949 ) ) ( not ( = ?auto_120944 ?auto_120948 ) ) ( not ( = ?auto_120944 ?auto_120949 ) ) ( not ( = ?auto_120945 ?auto_120948 ) ) ( not ( = ?auto_120945 ?auto_120949 ) ) ( not ( = ?auto_120946 ?auto_120948 ) ) ( not ( = ?auto_120946 ?auto_120949 ) ) ( not ( = ?auto_120947 ?auto_120948 ) ) ( not ( = ?auto_120947 ?auto_120949 ) ) ( not ( = ?auto_120948 ?auto_120949 ) ) ( ON ?auto_120948 ?auto_120947 ) ( CLEAR ?auto_120948 ) ( HOLDING ?auto_120949 ) ( CLEAR ?auto_120950 ) ( ON-TABLE ?auto_120951 ) ( ON ?auto_120950 ?auto_120951 ) ( not ( = ?auto_120951 ?auto_120950 ) ) ( not ( = ?auto_120951 ?auto_120949 ) ) ( not ( = ?auto_120950 ?auto_120949 ) ) ( not ( = ?auto_120943 ?auto_120950 ) ) ( not ( = ?auto_120943 ?auto_120951 ) ) ( not ( = ?auto_120944 ?auto_120950 ) ) ( not ( = ?auto_120944 ?auto_120951 ) ) ( not ( = ?auto_120945 ?auto_120950 ) ) ( not ( = ?auto_120945 ?auto_120951 ) ) ( not ( = ?auto_120946 ?auto_120950 ) ) ( not ( = ?auto_120946 ?auto_120951 ) ) ( not ( = ?auto_120947 ?auto_120950 ) ) ( not ( = ?auto_120947 ?auto_120951 ) ) ( not ( = ?auto_120948 ?auto_120950 ) ) ( not ( = ?auto_120948 ?auto_120951 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120951 ?auto_120950 ?auto_120949 )
      ( MAKE-4PILE ?auto_120943 ?auto_120944 ?auto_120945 ?auto_120946 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120952 - BLOCK
      ?auto_120953 - BLOCK
      ?auto_120954 - BLOCK
      ?auto_120955 - BLOCK
    )
    :vars
    (
      ?auto_120958 - BLOCK
      ?auto_120957 - BLOCK
      ?auto_120956 - BLOCK
      ?auto_120960 - BLOCK
      ?auto_120959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120958 ?auto_120955 ) ( ON-TABLE ?auto_120952 ) ( ON ?auto_120953 ?auto_120952 ) ( ON ?auto_120954 ?auto_120953 ) ( ON ?auto_120955 ?auto_120954 ) ( not ( = ?auto_120952 ?auto_120953 ) ) ( not ( = ?auto_120952 ?auto_120954 ) ) ( not ( = ?auto_120952 ?auto_120955 ) ) ( not ( = ?auto_120952 ?auto_120958 ) ) ( not ( = ?auto_120953 ?auto_120954 ) ) ( not ( = ?auto_120953 ?auto_120955 ) ) ( not ( = ?auto_120953 ?auto_120958 ) ) ( not ( = ?auto_120954 ?auto_120955 ) ) ( not ( = ?auto_120954 ?auto_120958 ) ) ( not ( = ?auto_120955 ?auto_120958 ) ) ( not ( = ?auto_120952 ?auto_120957 ) ) ( not ( = ?auto_120952 ?auto_120956 ) ) ( not ( = ?auto_120953 ?auto_120957 ) ) ( not ( = ?auto_120953 ?auto_120956 ) ) ( not ( = ?auto_120954 ?auto_120957 ) ) ( not ( = ?auto_120954 ?auto_120956 ) ) ( not ( = ?auto_120955 ?auto_120957 ) ) ( not ( = ?auto_120955 ?auto_120956 ) ) ( not ( = ?auto_120958 ?auto_120957 ) ) ( not ( = ?auto_120958 ?auto_120956 ) ) ( not ( = ?auto_120957 ?auto_120956 ) ) ( ON ?auto_120957 ?auto_120958 ) ( CLEAR ?auto_120960 ) ( ON-TABLE ?auto_120959 ) ( ON ?auto_120960 ?auto_120959 ) ( not ( = ?auto_120959 ?auto_120960 ) ) ( not ( = ?auto_120959 ?auto_120956 ) ) ( not ( = ?auto_120960 ?auto_120956 ) ) ( not ( = ?auto_120952 ?auto_120960 ) ) ( not ( = ?auto_120952 ?auto_120959 ) ) ( not ( = ?auto_120953 ?auto_120960 ) ) ( not ( = ?auto_120953 ?auto_120959 ) ) ( not ( = ?auto_120954 ?auto_120960 ) ) ( not ( = ?auto_120954 ?auto_120959 ) ) ( not ( = ?auto_120955 ?auto_120960 ) ) ( not ( = ?auto_120955 ?auto_120959 ) ) ( not ( = ?auto_120958 ?auto_120960 ) ) ( not ( = ?auto_120958 ?auto_120959 ) ) ( not ( = ?auto_120957 ?auto_120960 ) ) ( not ( = ?auto_120957 ?auto_120959 ) ) ( ON ?auto_120956 ?auto_120957 ) ( CLEAR ?auto_120956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120952 ?auto_120953 ?auto_120954 ?auto_120955 ?auto_120958 ?auto_120957 )
      ( MAKE-4PILE ?auto_120952 ?auto_120953 ?auto_120954 ?auto_120955 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120961 - BLOCK
      ?auto_120962 - BLOCK
      ?auto_120963 - BLOCK
      ?auto_120964 - BLOCK
    )
    :vars
    (
      ?auto_120965 - BLOCK
      ?auto_120968 - BLOCK
      ?auto_120967 - BLOCK
      ?auto_120966 - BLOCK
      ?auto_120969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120965 ?auto_120964 ) ( ON-TABLE ?auto_120961 ) ( ON ?auto_120962 ?auto_120961 ) ( ON ?auto_120963 ?auto_120962 ) ( ON ?auto_120964 ?auto_120963 ) ( not ( = ?auto_120961 ?auto_120962 ) ) ( not ( = ?auto_120961 ?auto_120963 ) ) ( not ( = ?auto_120961 ?auto_120964 ) ) ( not ( = ?auto_120961 ?auto_120965 ) ) ( not ( = ?auto_120962 ?auto_120963 ) ) ( not ( = ?auto_120962 ?auto_120964 ) ) ( not ( = ?auto_120962 ?auto_120965 ) ) ( not ( = ?auto_120963 ?auto_120964 ) ) ( not ( = ?auto_120963 ?auto_120965 ) ) ( not ( = ?auto_120964 ?auto_120965 ) ) ( not ( = ?auto_120961 ?auto_120968 ) ) ( not ( = ?auto_120961 ?auto_120967 ) ) ( not ( = ?auto_120962 ?auto_120968 ) ) ( not ( = ?auto_120962 ?auto_120967 ) ) ( not ( = ?auto_120963 ?auto_120968 ) ) ( not ( = ?auto_120963 ?auto_120967 ) ) ( not ( = ?auto_120964 ?auto_120968 ) ) ( not ( = ?auto_120964 ?auto_120967 ) ) ( not ( = ?auto_120965 ?auto_120968 ) ) ( not ( = ?auto_120965 ?auto_120967 ) ) ( not ( = ?auto_120968 ?auto_120967 ) ) ( ON ?auto_120968 ?auto_120965 ) ( ON-TABLE ?auto_120966 ) ( not ( = ?auto_120966 ?auto_120969 ) ) ( not ( = ?auto_120966 ?auto_120967 ) ) ( not ( = ?auto_120969 ?auto_120967 ) ) ( not ( = ?auto_120961 ?auto_120969 ) ) ( not ( = ?auto_120961 ?auto_120966 ) ) ( not ( = ?auto_120962 ?auto_120969 ) ) ( not ( = ?auto_120962 ?auto_120966 ) ) ( not ( = ?auto_120963 ?auto_120969 ) ) ( not ( = ?auto_120963 ?auto_120966 ) ) ( not ( = ?auto_120964 ?auto_120969 ) ) ( not ( = ?auto_120964 ?auto_120966 ) ) ( not ( = ?auto_120965 ?auto_120969 ) ) ( not ( = ?auto_120965 ?auto_120966 ) ) ( not ( = ?auto_120968 ?auto_120969 ) ) ( not ( = ?auto_120968 ?auto_120966 ) ) ( ON ?auto_120967 ?auto_120968 ) ( CLEAR ?auto_120967 ) ( HOLDING ?auto_120969 ) ( CLEAR ?auto_120966 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120966 ?auto_120969 )
      ( MAKE-4PILE ?auto_120961 ?auto_120962 ?auto_120963 ?auto_120964 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122663 - BLOCK
      ?auto_122664 - BLOCK
      ?auto_122665 - BLOCK
      ?auto_122666 - BLOCK
    )
    :vars
    (
      ?auto_122670 - BLOCK
      ?auto_122668 - BLOCK
      ?auto_122669 - BLOCK
      ?auto_122667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122670 ?auto_122666 ) ( ON-TABLE ?auto_122663 ) ( ON ?auto_122664 ?auto_122663 ) ( ON ?auto_122665 ?auto_122664 ) ( ON ?auto_122666 ?auto_122665 ) ( not ( = ?auto_122663 ?auto_122664 ) ) ( not ( = ?auto_122663 ?auto_122665 ) ) ( not ( = ?auto_122663 ?auto_122666 ) ) ( not ( = ?auto_122663 ?auto_122670 ) ) ( not ( = ?auto_122664 ?auto_122665 ) ) ( not ( = ?auto_122664 ?auto_122666 ) ) ( not ( = ?auto_122664 ?auto_122670 ) ) ( not ( = ?auto_122665 ?auto_122666 ) ) ( not ( = ?auto_122665 ?auto_122670 ) ) ( not ( = ?auto_122666 ?auto_122670 ) ) ( not ( = ?auto_122663 ?auto_122668 ) ) ( not ( = ?auto_122663 ?auto_122669 ) ) ( not ( = ?auto_122664 ?auto_122668 ) ) ( not ( = ?auto_122664 ?auto_122669 ) ) ( not ( = ?auto_122665 ?auto_122668 ) ) ( not ( = ?auto_122665 ?auto_122669 ) ) ( not ( = ?auto_122666 ?auto_122668 ) ) ( not ( = ?auto_122666 ?auto_122669 ) ) ( not ( = ?auto_122670 ?auto_122668 ) ) ( not ( = ?auto_122670 ?auto_122669 ) ) ( not ( = ?auto_122668 ?auto_122669 ) ) ( ON ?auto_122668 ?auto_122670 ) ( not ( = ?auto_122667 ?auto_122669 ) ) ( not ( = ?auto_122663 ?auto_122667 ) ) ( not ( = ?auto_122664 ?auto_122667 ) ) ( not ( = ?auto_122665 ?auto_122667 ) ) ( not ( = ?auto_122666 ?auto_122667 ) ) ( not ( = ?auto_122670 ?auto_122667 ) ) ( not ( = ?auto_122668 ?auto_122667 ) ) ( ON ?auto_122669 ?auto_122668 ) ( ON ?auto_122667 ?auto_122669 ) ( CLEAR ?auto_122667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122663 ?auto_122664 ?auto_122665 ?auto_122666 ?auto_122670 ?auto_122668 ?auto_122669 )
      ( MAKE-4PILE ?auto_122663 ?auto_122664 ?auto_122665 ?auto_122666 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120979 - BLOCK
      ?auto_120980 - BLOCK
      ?auto_120981 - BLOCK
      ?auto_120982 - BLOCK
    )
    :vars
    (
      ?auto_120987 - BLOCK
      ?auto_120983 - BLOCK
      ?auto_120985 - BLOCK
      ?auto_120984 - BLOCK
      ?auto_120986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120987 ?auto_120982 ) ( ON-TABLE ?auto_120979 ) ( ON ?auto_120980 ?auto_120979 ) ( ON ?auto_120981 ?auto_120980 ) ( ON ?auto_120982 ?auto_120981 ) ( not ( = ?auto_120979 ?auto_120980 ) ) ( not ( = ?auto_120979 ?auto_120981 ) ) ( not ( = ?auto_120979 ?auto_120982 ) ) ( not ( = ?auto_120979 ?auto_120987 ) ) ( not ( = ?auto_120980 ?auto_120981 ) ) ( not ( = ?auto_120980 ?auto_120982 ) ) ( not ( = ?auto_120980 ?auto_120987 ) ) ( not ( = ?auto_120981 ?auto_120982 ) ) ( not ( = ?auto_120981 ?auto_120987 ) ) ( not ( = ?auto_120982 ?auto_120987 ) ) ( not ( = ?auto_120979 ?auto_120983 ) ) ( not ( = ?auto_120979 ?auto_120985 ) ) ( not ( = ?auto_120980 ?auto_120983 ) ) ( not ( = ?auto_120980 ?auto_120985 ) ) ( not ( = ?auto_120981 ?auto_120983 ) ) ( not ( = ?auto_120981 ?auto_120985 ) ) ( not ( = ?auto_120982 ?auto_120983 ) ) ( not ( = ?auto_120982 ?auto_120985 ) ) ( not ( = ?auto_120987 ?auto_120983 ) ) ( not ( = ?auto_120987 ?auto_120985 ) ) ( not ( = ?auto_120983 ?auto_120985 ) ) ( ON ?auto_120983 ?auto_120987 ) ( not ( = ?auto_120984 ?auto_120986 ) ) ( not ( = ?auto_120984 ?auto_120985 ) ) ( not ( = ?auto_120986 ?auto_120985 ) ) ( not ( = ?auto_120979 ?auto_120986 ) ) ( not ( = ?auto_120979 ?auto_120984 ) ) ( not ( = ?auto_120980 ?auto_120986 ) ) ( not ( = ?auto_120980 ?auto_120984 ) ) ( not ( = ?auto_120981 ?auto_120986 ) ) ( not ( = ?auto_120981 ?auto_120984 ) ) ( not ( = ?auto_120982 ?auto_120986 ) ) ( not ( = ?auto_120982 ?auto_120984 ) ) ( not ( = ?auto_120987 ?auto_120986 ) ) ( not ( = ?auto_120987 ?auto_120984 ) ) ( not ( = ?auto_120983 ?auto_120986 ) ) ( not ( = ?auto_120983 ?auto_120984 ) ) ( ON ?auto_120985 ?auto_120983 ) ( ON ?auto_120986 ?auto_120985 ) ( CLEAR ?auto_120986 ) ( HOLDING ?auto_120984 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120984 )
      ( MAKE-4PILE ?auto_120979 ?auto_120980 ?auto_120981 ?auto_120982 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120988 - BLOCK
      ?auto_120989 - BLOCK
      ?auto_120990 - BLOCK
      ?auto_120991 - BLOCK
    )
    :vars
    (
      ?auto_120994 - BLOCK
      ?auto_120995 - BLOCK
      ?auto_120992 - BLOCK
      ?auto_120993 - BLOCK
      ?auto_120996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120994 ?auto_120991 ) ( ON-TABLE ?auto_120988 ) ( ON ?auto_120989 ?auto_120988 ) ( ON ?auto_120990 ?auto_120989 ) ( ON ?auto_120991 ?auto_120990 ) ( not ( = ?auto_120988 ?auto_120989 ) ) ( not ( = ?auto_120988 ?auto_120990 ) ) ( not ( = ?auto_120988 ?auto_120991 ) ) ( not ( = ?auto_120988 ?auto_120994 ) ) ( not ( = ?auto_120989 ?auto_120990 ) ) ( not ( = ?auto_120989 ?auto_120991 ) ) ( not ( = ?auto_120989 ?auto_120994 ) ) ( not ( = ?auto_120990 ?auto_120991 ) ) ( not ( = ?auto_120990 ?auto_120994 ) ) ( not ( = ?auto_120991 ?auto_120994 ) ) ( not ( = ?auto_120988 ?auto_120995 ) ) ( not ( = ?auto_120988 ?auto_120992 ) ) ( not ( = ?auto_120989 ?auto_120995 ) ) ( not ( = ?auto_120989 ?auto_120992 ) ) ( not ( = ?auto_120990 ?auto_120995 ) ) ( not ( = ?auto_120990 ?auto_120992 ) ) ( not ( = ?auto_120991 ?auto_120995 ) ) ( not ( = ?auto_120991 ?auto_120992 ) ) ( not ( = ?auto_120994 ?auto_120995 ) ) ( not ( = ?auto_120994 ?auto_120992 ) ) ( not ( = ?auto_120995 ?auto_120992 ) ) ( ON ?auto_120995 ?auto_120994 ) ( not ( = ?auto_120993 ?auto_120996 ) ) ( not ( = ?auto_120993 ?auto_120992 ) ) ( not ( = ?auto_120996 ?auto_120992 ) ) ( not ( = ?auto_120988 ?auto_120996 ) ) ( not ( = ?auto_120988 ?auto_120993 ) ) ( not ( = ?auto_120989 ?auto_120996 ) ) ( not ( = ?auto_120989 ?auto_120993 ) ) ( not ( = ?auto_120990 ?auto_120996 ) ) ( not ( = ?auto_120990 ?auto_120993 ) ) ( not ( = ?auto_120991 ?auto_120996 ) ) ( not ( = ?auto_120991 ?auto_120993 ) ) ( not ( = ?auto_120994 ?auto_120996 ) ) ( not ( = ?auto_120994 ?auto_120993 ) ) ( not ( = ?auto_120995 ?auto_120996 ) ) ( not ( = ?auto_120995 ?auto_120993 ) ) ( ON ?auto_120992 ?auto_120995 ) ( ON ?auto_120996 ?auto_120992 ) ( ON ?auto_120993 ?auto_120996 ) ( CLEAR ?auto_120993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_120988 ?auto_120989 ?auto_120990 ?auto_120991 ?auto_120994 ?auto_120995 ?auto_120992 ?auto_120996 )
      ( MAKE-4PILE ?auto_120988 ?auto_120989 ?auto_120990 ?auto_120991 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_121002 - BLOCK
      ?auto_121003 - BLOCK
      ?auto_121004 - BLOCK
      ?auto_121005 - BLOCK
      ?auto_121006 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_121006 ) ( CLEAR ?auto_121005 ) ( ON-TABLE ?auto_121002 ) ( ON ?auto_121003 ?auto_121002 ) ( ON ?auto_121004 ?auto_121003 ) ( ON ?auto_121005 ?auto_121004 ) ( not ( = ?auto_121002 ?auto_121003 ) ) ( not ( = ?auto_121002 ?auto_121004 ) ) ( not ( = ?auto_121002 ?auto_121005 ) ) ( not ( = ?auto_121002 ?auto_121006 ) ) ( not ( = ?auto_121003 ?auto_121004 ) ) ( not ( = ?auto_121003 ?auto_121005 ) ) ( not ( = ?auto_121003 ?auto_121006 ) ) ( not ( = ?auto_121004 ?auto_121005 ) ) ( not ( = ?auto_121004 ?auto_121006 ) ) ( not ( = ?auto_121005 ?auto_121006 ) ) )
    :subtasks
    ( ( !STACK ?auto_121006 ?auto_121005 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_121007 - BLOCK
      ?auto_121008 - BLOCK
      ?auto_121009 - BLOCK
      ?auto_121010 - BLOCK
      ?auto_121011 - BLOCK
    )
    :vars
    (
      ?auto_121012 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_121010 ) ( ON-TABLE ?auto_121007 ) ( ON ?auto_121008 ?auto_121007 ) ( ON ?auto_121009 ?auto_121008 ) ( ON ?auto_121010 ?auto_121009 ) ( not ( = ?auto_121007 ?auto_121008 ) ) ( not ( = ?auto_121007 ?auto_121009 ) ) ( not ( = ?auto_121007 ?auto_121010 ) ) ( not ( = ?auto_121007 ?auto_121011 ) ) ( not ( = ?auto_121008 ?auto_121009 ) ) ( not ( = ?auto_121008 ?auto_121010 ) ) ( not ( = ?auto_121008 ?auto_121011 ) ) ( not ( = ?auto_121009 ?auto_121010 ) ) ( not ( = ?auto_121009 ?auto_121011 ) ) ( not ( = ?auto_121010 ?auto_121011 ) ) ( ON ?auto_121011 ?auto_121012 ) ( CLEAR ?auto_121011 ) ( HAND-EMPTY ) ( not ( = ?auto_121007 ?auto_121012 ) ) ( not ( = ?auto_121008 ?auto_121012 ) ) ( not ( = ?auto_121009 ?auto_121012 ) ) ( not ( = ?auto_121010 ?auto_121012 ) ) ( not ( = ?auto_121011 ?auto_121012 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121011 ?auto_121012 )
      ( MAKE-5PILE ?auto_121007 ?auto_121008 ?auto_121009 ?auto_121010 ?auto_121011 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_121013 - BLOCK
      ?auto_121014 - BLOCK
      ?auto_121015 - BLOCK
      ?auto_121016 - BLOCK
      ?auto_121017 - BLOCK
    )
    :vars
    (
      ?auto_121018 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121013 ) ( ON ?auto_121014 ?auto_121013 ) ( ON ?auto_121015 ?auto_121014 ) ( not ( = ?auto_121013 ?auto_121014 ) ) ( not ( = ?auto_121013 ?auto_121015 ) ) ( not ( = ?auto_121013 ?auto_121016 ) ) ( not ( = ?auto_121013 ?auto_121017 ) ) ( not ( = ?auto_121014 ?auto_121015 ) ) ( not ( = ?auto_121014 ?auto_121016 ) ) ( not ( = ?auto_121014 ?auto_121017 ) ) ( not ( = ?auto_121015 ?auto_121016 ) ) ( not ( = ?auto_121015 ?auto_121017 ) ) ( not ( = ?auto_121016 ?auto_121017 ) ) ( ON ?auto_121017 ?auto_121018 ) ( CLEAR ?auto_121017 ) ( not ( = ?auto_121013 ?auto_121018 ) ) ( not ( = ?auto_121014 ?auto_121018 ) ) ( not ( = ?auto_121015 ?auto_121018 ) ) ( not ( = ?auto_121016 ?auto_121018 ) ) ( not ( = ?auto_121017 ?auto_121018 ) ) ( HOLDING ?auto_121016 ) ( CLEAR ?auto_121015 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121013 ?auto_121014 ?auto_121015 ?auto_121016 )
      ( MAKE-5PILE ?auto_121013 ?auto_121014 ?auto_121015 ?auto_121016 ?auto_121017 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_121019 - BLOCK
      ?auto_121020 - BLOCK
      ?auto_121021 - BLOCK
      ?auto_121022 - BLOCK
      ?auto_121023 - BLOCK
    )
    :vars
    (
      ?auto_121024 - BLOCK
      ?auto_121026 - BLOCK
      ?auto_121027 - BLOCK
      ?auto_121025 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121019 ) ( ON ?auto_121020 ?auto_121019 ) ( ON ?auto_121021 ?auto_121020 ) ( not ( = ?auto_121019 ?auto_121020 ) ) ( not ( = ?auto_121019 ?auto_121021 ) ) ( not ( = ?auto_121019 ?auto_121022 ) ) ( not ( = ?auto_121019 ?auto_121023 ) ) ( not ( = ?auto_121020 ?auto_121021 ) ) ( not ( = ?auto_121020 ?auto_121022 ) ) ( not ( = ?auto_121020 ?auto_121023 ) ) ( not ( = ?auto_121021 ?auto_121022 ) ) ( not ( = ?auto_121021 ?auto_121023 ) ) ( not ( = ?auto_121022 ?auto_121023 ) ) ( ON ?auto_121023 ?auto_121024 ) ( not ( = ?auto_121019 ?auto_121024 ) ) ( not ( = ?auto_121020 ?auto_121024 ) ) ( not ( = ?auto_121021 ?auto_121024 ) ) ( not ( = ?auto_121022 ?auto_121024 ) ) ( not ( = ?auto_121023 ?auto_121024 ) ) ( CLEAR ?auto_121021 ) ( ON ?auto_121022 ?auto_121023 ) ( CLEAR ?auto_121022 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121026 ) ( ON ?auto_121027 ?auto_121026 ) ( ON ?auto_121025 ?auto_121027 ) ( ON ?auto_121024 ?auto_121025 ) ( not ( = ?auto_121026 ?auto_121027 ) ) ( not ( = ?auto_121026 ?auto_121025 ) ) ( not ( = ?auto_121026 ?auto_121024 ) ) ( not ( = ?auto_121026 ?auto_121023 ) ) ( not ( = ?auto_121026 ?auto_121022 ) ) ( not ( = ?auto_121027 ?auto_121025 ) ) ( not ( = ?auto_121027 ?auto_121024 ) ) ( not ( = ?auto_121027 ?auto_121023 ) ) ( not ( = ?auto_121027 ?auto_121022 ) ) ( not ( = ?auto_121025 ?auto_121024 ) ) ( not ( = ?auto_121025 ?auto_121023 ) ) ( not ( = ?auto_121025 ?auto_121022 ) ) ( not ( = ?auto_121019 ?auto_121026 ) ) ( not ( = ?auto_121019 ?auto_121027 ) ) ( not ( = ?auto_121019 ?auto_121025 ) ) ( not ( = ?auto_121020 ?auto_121026 ) ) ( not ( = ?auto_121020 ?auto_121027 ) ) ( not ( = ?auto_121020 ?auto_121025 ) ) ( not ( = ?auto_121021 ?auto_121026 ) ) ( not ( = ?auto_121021 ?auto_121027 ) ) ( not ( = ?auto_121021 ?auto_121025 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121026 ?auto_121027 ?auto_121025 ?auto_121024 ?auto_121023 )
      ( MAKE-5PILE ?auto_121019 ?auto_121020 ?auto_121021 ?auto_121022 ?auto_121023 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_121028 - BLOCK
      ?auto_121029 - BLOCK
      ?auto_121030 - BLOCK
      ?auto_121031 - BLOCK
      ?auto_121032 - BLOCK
    )
    :vars
    (
      ?auto_121036 - BLOCK
      ?auto_121033 - BLOCK
      ?auto_121035 - BLOCK
      ?auto_121034 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121028 ) ( ON ?auto_121029 ?auto_121028 ) ( not ( = ?auto_121028 ?auto_121029 ) ) ( not ( = ?auto_121028 ?auto_121030 ) ) ( not ( = ?auto_121028 ?auto_121031 ) ) ( not ( = ?auto_121028 ?auto_121032 ) ) ( not ( = ?auto_121029 ?auto_121030 ) ) ( not ( = ?auto_121029 ?auto_121031 ) ) ( not ( = ?auto_121029 ?auto_121032 ) ) ( not ( = ?auto_121030 ?auto_121031 ) ) ( not ( = ?auto_121030 ?auto_121032 ) ) ( not ( = ?auto_121031 ?auto_121032 ) ) ( ON ?auto_121032 ?auto_121036 ) ( not ( = ?auto_121028 ?auto_121036 ) ) ( not ( = ?auto_121029 ?auto_121036 ) ) ( not ( = ?auto_121030 ?auto_121036 ) ) ( not ( = ?auto_121031 ?auto_121036 ) ) ( not ( = ?auto_121032 ?auto_121036 ) ) ( ON ?auto_121031 ?auto_121032 ) ( CLEAR ?auto_121031 ) ( ON-TABLE ?auto_121033 ) ( ON ?auto_121035 ?auto_121033 ) ( ON ?auto_121034 ?auto_121035 ) ( ON ?auto_121036 ?auto_121034 ) ( not ( = ?auto_121033 ?auto_121035 ) ) ( not ( = ?auto_121033 ?auto_121034 ) ) ( not ( = ?auto_121033 ?auto_121036 ) ) ( not ( = ?auto_121033 ?auto_121032 ) ) ( not ( = ?auto_121033 ?auto_121031 ) ) ( not ( = ?auto_121035 ?auto_121034 ) ) ( not ( = ?auto_121035 ?auto_121036 ) ) ( not ( = ?auto_121035 ?auto_121032 ) ) ( not ( = ?auto_121035 ?auto_121031 ) ) ( not ( = ?auto_121034 ?auto_121036 ) ) ( not ( = ?auto_121034 ?auto_121032 ) ) ( not ( = ?auto_121034 ?auto_121031 ) ) ( not ( = ?auto_121028 ?auto_121033 ) ) ( not ( = ?auto_121028 ?auto_121035 ) ) ( not ( = ?auto_121028 ?auto_121034 ) ) ( not ( = ?auto_121029 ?auto_121033 ) ) ( not ( = ?auto_121029 ?auto_121035 ) ) ( not ( = ?auto_121029 ?auto_121034 ) ) ( not ( = ?auto_121030 ?auto_121033 ) ) ( not ( = ?auto_121030 ?auto_121035 ) ) ( not ( = ?auto_121030 ?auto_121034 ) ) ( HOLDING ?auto_121030 ) ( CLEAR ?auto_121029 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121028 ?auto_121029 ?auto_121030 )
      ( MAKE-5PILE ?auto_121028 ?auto_121029 ?auto_121030 ?auto_121031 ?auto_121032 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_121037 - BLOCK
      ?auto_121038 - BLOCK
      ?auto_121039 - BLOCK
      ?auto_121040 - BLOCK
      ?auto_121041 - BLOCK
    )
    :vars
    (
      ?auto_121042 - BLOCK
      ?auto_121045 - BLOCK
      ?auto_121044 - BLOCK
      ?auto_121043 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121037 ) ( ON ?auto_121038 ?auto_121037 ) ( not ( = ?auto_121037 ?auto_121038 ) ) ( not ( = ?auto_121037 ?auto_121039 ) ) ( not ( = ?auto_121037 ?auto_121040 ) ) ( not ( = ?auto_121037 ?auto_121041 ) ) ( not ( = ?auto_121038 ?auto_121039 ) ) ( not ( = ?auto_121038 ?auto_121040 ) ) ( not ( = ?auto_121038 ?auto_121041 ) ) ( not ( = ?auto_121039 ?auto_121040 ) ) ( not ( = ?auto_121039 ?auto_121041 ) ) ( not ( = ?auto_121040 ?auto_121041 ) ) ( ON ?auto_121041 ?auto_121042 ) ( not ( = ?auto_121037 ?auto_121042 ) ) ( not ( = ?auto_121038 ?auto_121042 ) ) ( not ( = ?auto_121039 ?auto_121042 ) ) ( not ( = ?auto_121040 ?auto_121042 ) ) ( not ( = ?auto_121041 ?auto_121042 ) ) ( ON ?auto_121040 ?auto_121041 ) ( ON-TABLE ?auto_121045 ) ( ON ?auto_121044 ?auto_121045 ) ( ON ?auto_121043 ?auto_121044 ) ( ON ?auto_121042 ?auto_121043 ) ( not ( = ?auto_121045 ?auto_121044 ) ) ( not ( = ?auto_121045 ?auto_121043 ) ) ( not ( = ?auto_121045 ?auto_121042 ) ) ( not ( = ?auto_121045 ?auto_121041 ) ) ( not ( = ?auto_121045 ?auto_121040 ) ) ( not ( = ?auto_121044 ?auto_121043 ) ) ( not ( = ?auto_121044 ?auto_121042 ) ) ( not ( = ?auto_121044 ?auto_121041 ) ) ( not ( = ?auto_121044 ?auto_121040 ) ) ( not ( = ?auto_121043 ?auto_121042 ) ) ( not ( = ?auto_121043 ?auto_121041 ) ) ( not ( = ?auto_121043 ?auto_121040 ) ) ( not ( = ?auto_121037 ?auto_121045 ) ) ( not ( = ?auto_121037 ?auto_121044 ) ) ( not ( = ?auto_121037 ?auto_121043 ) ) ( not ( = ?auto_121038 ?auto_121045 ) ) ( not ( = ?auto_121038 ?auto_121044 ) ) ( not ( = ?auto_121038 ?auto_121043 ) ) ( not ( = ?auto_121039 ?auto_121045 ) ) ( not ( = ?auto_121039 ?auto_121044 ) ) ( not ( = ?auto_121039 ?auto_121043 ) ) ( CLEAR ?auto_121038 ) ( ON ?auto_121039 ?auto_121040 ) ( CLEAR ?auto_121039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121045 ?auto_121044 ?auto_121043 ?auto_121042 ?auto_121041 ?auto_121040 )
      ( MAKE-5PILE ?auto_121037 ?auto_121038 ?auto_121039 ?auto_121040 ?auto_121041 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_121046 - BLOCK
      ?auto_121047 - BLOCK
      ?auto_121048 - BLOCK
      ?auto_121049 - BLOCK
      ?auto_121050 - BLOCK
    )
    :vars
    (
      ?auto_121051 - BLOCK
      ?auto_121052 - BLOCK
      ?auto_121053 - BLOCK
      ?auto_121054 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121046 ) ( not ( = ?auto_121046 ?auto_121047 ) ) ( not ( = ?auto_121046 ?auto_121048 ) ) ( not ( = ?auto_121046 ?auto_121049 ) ) ( not ( = ?auto_121046 ?auto_121050 ) ) ( not ( = ?auto_121047 ?auto_121048 ) ) ( not ( = ?auto_121047 ?auto_121049 ) ) ( not ( = ?auto_121047 ?auto_121050 ) ) ( not ( = ?auto_121048 ?auto_121049 ) ) ( not ( = ?auto_121048 ?auto_121050 ) ) ( not ( = ?auto_121049 ?auto_121050 ) ) ( ON ?auto_121050 ?auto_121051 ) ( not ( = ?auto_121046 ?auto_121051 ) ) ( not ( = ?auto_121047 ?auto_121051 ) ) ( not ( = ?auto_121048 ?auto_121051 ) ) ( not ( = ?auto_121049 ?auto_121051 ) ) ( not ( = ?auto_121050 ?auto_121051 ) ) ( ON ?auto_121049 ?auto_121050 ) ( ON-TABLE ?auto_121052 ) ( ON ?auto_121053 ?auto_121052 ) ( ON ?auto_121054 ?auto_121053 ) ( ON ?auto_121051 ?auto_121054 ) ( not ( = ?auto_121052 ?auto_121053 ) ) ( not ( = ?auto_121052 ?auto_121054 ) ) ( not ( = ?auto_121052 ?auto_121051 ) ) ( not ( = ?auto_121052 ?auto_121050 ) ) ( not ( = ?auto_121052 ?auto_121049 ) ) ( not ( = ?auto_121053 ?auto_121054 ) ) ( not ( = ?auto_121053 ?auto_121051 ) ) ( not ( = ?auto_121053 ?auto_121050 ) ) ( not ( = ?auto_121053 ?auto_121049 ) ) ( not ( = ?auto_121054 ?auto_121051 ) ) ( not ( = ?auto_121054 ?auto_121050 ) ) ( not ( = ?auto_121054 ?auto_121049 ) ) ( not ( = ?auto_121046 ?auto_121052 ) ) ( not ( = ?auto_121046 ?auto_121053 ) ) ( not ( = ?auto_121046 ?auto_121054 ) ) ( not ( = ?auto_121047 ?auto_121052 ) ) ( not ( = ?auto_121047 ?auto_121053 ) ) ( not ( = ?auto_121047 ?auto_121054 ) ) ( not ( = ?auto_121048 ?auto_121052 ) ) ( not ( = ?auto_121048 ?auto_121053 ) ) ( not ( = ?auto_121048 ?auto_121054 ) ) ( ON ?auto_121048 ?auto_121049 ) ( CLEAR ?auto_121048 ) ( HOLDING ?auto_121047 ) ( CLEAR ?auto_121046 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121046 ?auto_121047 )
      ( MAKE-5PILE ?auto_121046 ?auto_121047 ?auto_121048 ?auto_121049 ?auto_121050 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_121055 - BLOCK
      ?auto_121056 - BLOCK
      ?auto_121057 - BLOCK
      ?auto_121058 - BLOCK
      ?auto_121059 - BLOCK
    )
    :vars
    (
      ?auto_121061 - BLOCK
      ?auto_121060 - BLOCK
      ?auto_121062 - BLOCK
      ?auto_121063 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121055 ) ( not ( = ?auto_121055 ?auto_121056 ) ) ( not ( = ?auto_121055 ?auto_121057 ) ) ( not ( = ?auto_121055 ?auto_121058 ) ) ( not ( = ?auto_121055 ?auto_121059 ) ) ( not ( = ?auto_121056 ?auto_121057 ) ) ( not ( = ?auto_121056 ?auto_121058 ) ) ( not ( = ?auto_121056 ?auto_121059 ) ) ( not ( = ?auto_121057 ?auto_121058 ) ) ( not ( = ?auto_121057 ?auto_121059 ) ) ( not ( = ?auto_121058 ?auto_121059 ) ) ( ON ?auto_121059 ?auto_121061 ) ( not ( = ?auto_121055 ?auto_121061 ) ) ( not ( = ?auto_121056 ?auto_121061 ) ) ( not ( = ?auto_121057 ?auto_121061 ) ) ( not ( = ?auto_121058 ?auto_121061 ) ) ( not ( = ?auto_121059 ?auto_121061 ) ) ( ON ?auto_121058 ?auto_121059 ) ( ON-TABLE ?auto_121060 ) ( ON ?auto_121062 ?auto_121060 ) ( ON ?auto_121063 ?auto_121062 ) ( ON ?auto_121061 ?auto_121063 ) ( not ( = ?auto_121060 ?auto_121062 ) ) ( not ( = ?auto_121060 ?auto_121063 ) ) ( not ( = ?auto_121060 ?auto_121061 ) ) ( not ( = ?auto_121060 ?auto_121059 ) ) ( not ( = ?auto_121060 ?auto_121058 ) ) ( not ( = ?auto_121062 ?auto_121063 ) ) ( not ( = ?auto_121062 ?auto_121061 ) ) ( not ( = ?auto_121062 ?auto_121059 ) ) ( not ( = ?auto_121062 ?auto_121058 ) ) ( not ( = ?auto_121063 ?auto_121061 ) ) ( not ( = ?auto_121063 ?auto_121059 ) ) ( not ( = ?auto_121063 ?auto_121058 ) ) ( not ( = ?auto_121055 ?auto_121060 ) ) ( not ( = ?auto_121055 ?auto_121062 ) ) ( not ( = ?auto_121055 ?auto_121063 ) ) ( not ( = ?auto_121056 ?auto_121060 ) ) ( not ( = ?auto_121056 ?auto_121062 ) ) ( not ( = ?auto_121056 ?auto_121063 ) ) ( not ( = ?auto_121057 ?auto_121060 ) ) ( not ( = ?auto_121057 ?auto_121062 ) ) ( not ( = ?auto_121057 ?auto_121063 ) ) ( ON ?auto_121057 ?auto_121058 ) ( CLEAR ?auto_121055 ) ( ON ?auto_121056 ?auto_121057 ) ( CLEAR ?auto_121056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_121060 ?auto_121062 ?auto_121063 ?auto_121061 ?auto_121059 ?auto_121058 ?auto_121057 )
      ( MAKE-5PILE ?auto_121055 ?auto_121056 ?auto_121057 ?auto_121058 ?auto_121059 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_121064 - BLOCK
      ?auto_121065 - BLOCK
      ?auto_121066 - BLOCK
      ?auto_121067 - BLOCK
      ?auto_121068 - BLOCK
    )
    :vars
    (
      ?auto_121069 - BLOCK
      ?auto_121071 - BLOCK
      ?auto_121072 - BLOCK
      ?auto_121070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121064 ?auto_121065 ) ) ( not ( = ?auto_121064 ?auto_121066 ) ) ( not ( = ?auto_121064 ?auto_121067 ) ) ( not ( = ?auto_121064 ?auto_121068 ) ) ( not ( = ?auto_121065 ?auto_121066 ) ) ( not ( = ?auto_121065 ?auto_121067 ) ) ( not ( = ?auto_121065 ?auto_121068 ) ) ( not ( = ?auto_121066 ?auto_121067 ) ) ( not ( = ?auto_121066 ?auto_121068 ) ) ( not ( = ?auto_121067 ?auto_121068 ) ) ( ON ?auto_121068 ?auto_121069 ) ( not ( = ?auto_121064 ?auto_121069 ) ) ( not ( = ?auto_121065 ?auto_121069 ) ) ( not ( = ?auto_121066 ?auto_121069 ) ) ( not ( = ?auto_121067 ?auto_121069 ) ) ( not ( = ?auto_121068 ?auto_121069 ) ) ( ON ?auto_121067 ?auto_121068 ) ( ON-TABLE ?auto_121071 ) ( ON ?auto_121072 ?auto_121071 ) ( ON ?auto_121070 ?auto_121072 ) ( ON ?auto_121069 ?auto_121070 ) ( not ( = ?auto_121071 ?auto_121072 ) ) ( not ( = ?auto_121071 ?auto_121070 ) ) ( not ( = ?auto_121071 ?auto_121069 ) ) ( not ( = ?auto_121071 ?auto_121068 ) ) ( not ( = ?auto_121071 ?auto_121067 ) ) ( not ( = ?auto_121072 ?auto_121070 ) ) ( not ( = ?auto_121072 ?auto_121069 ) ) ( not ( = ?auto_121072 ?auto_121068 ) ) ( not ( = ?auto_121072 ?auto_121067 ) ) ( not ( = ?auto_121070 ?auto_121069 ) ) ( not ( = ?auto_121070 ?auto_121068 ) ) ( not ( = ?auto_121070 ?auto_121067 ) ) ( not ( = ?auto_121064 ?auto_121071 ) ) ( not ( = ?auto_121064 ?auto_121072 ) ) ( not ( = ?auto_121064 ?auto_121070 ) ) ( not ( = ?auto_121065 ?auto_121071 ) ) ( not ( = ?auto_121065 ?auto_121072 ) ) ( not ( = ?auto_121065 ?auto_121070 ) ) ( not ( = ?auto_121066 ?auto_121071 ) ) ( not ( = ?auto_121066 ?auto_121072 ) ) ( not ( = ?auto_121066 ?auto_121070 ) ) ( ON ?auto_121066 ?auto_121067 ) ( ON ?auto_121065 ?auto_121066 ) ( CLEAR ?auto_121065 ) ( HOLDING ?auto_121064 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121064 )
      ( MAKE-5PILE ?auto_121064 ?auto_121065 ?auto_121066 ?auto_121067 ?auto_121068 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_121073 - BLOCK
      ?auto_121074 - BLOCK
      ?auto_121075 - BLOCK
      ?auto_121076 - BLOCK
      ?auto_121077 - BLOCK
    )
    :vars
    (
      ?auto_121081 - BLOCK
      ?auto_121078 - BLOCK
      ?auto_121079 - BLOCK
      ?auto_121080 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121073 ?auto_121074 ) ) ( not ( = ?auto_121073 ?auto_121075 ) ) ( not ( = ?auto_121073 ?auto_121076 ) ) ( not ( = ?auto_121073 ?auto_121077 ) ) ( not ( = ?auto_121074 ?auto_121075 ) ) ( not ( = ?auto_121074 ?auto_121076 ) ) ( not ( = ?auto_121074 ?auto_121077 ) ) ( not ( = ?auto_121075 ?auto_121076 ) ) ( not ( = ?auto_121075 ?auto_121077 ) ) ( not ( = ?auto_121076 ?auto_121077 ) ) ( ON ?auto_121077 ?auto_121081 ) ( not ( = ?auto_121073 ?auto_121081 ) ) ( not ( = ?auto_121074 ?auto_121081 ) ) ( not ( = ?auto_121075 ?auto_121081 ) ) ( not ( = ?auto_121076 ?auto_121081 ) ) ( not ( = ?auto_121077 ?auto_121081 ) ) ( ON ?auto_121076 ?auto_121077 ) ( ON-TABLE ?auto_121078 ) ( ON ?auto_121079 ?auto_121078 ) ( ON ?auto_121080 ?auto_121079 ) ( ON ?auto_121081 ?auto_121080 ) ( not ( = ?auto_121078 ?auto_121079 ) ) ( not ( = ?auto_121078 ?auto_121080 ) ) ( not ( = ?auto_121078 ?auto_121081 ) ) ( not ( = ?auto_121078 ?auto_121077 ) ) ( not ( = ?auto_121078 ?auto_121076 ) ) ( not ( = ?auto_121079 ?auto_121080 ) ) ( not ( = ?auto_121079 ?auto_121081 ) ) ( not ( = ?auto_121079 ?auto_121077 ) ) ( not ( = ?auto_121079 ?auto_121076 ) ) ( not ( = ?auto_121080 ?auto_121081 ) ) ( not ( = ?auto_121080 ?auto_121077 ) ) ( not ( = ?auto_121080 ?auto_121076 ) ) ( not ( = ?auto_121073 ?auto_121078 ) ) ( not ( = ?auto_121073 ?auto_121079 ) ) ( not ( = ?auto_121073 ?auto_121080 ) ) ( not ( = ?auto_121074 ?auto_121078 ) ) ( not ( = ?auto_121074 ?auto_121079 ) ) ( not ( = ?auto_121074 ?auto_121080 ) ) ( not ( = ?auto_121075 ?auto_121078 ) ) ( not ( = ?auto_121075 ?auto_121079 ) ) ( not ( = ?auto_121075 ?auto_121080 ) ) ( ON ?auto_121075 ?auto_121076 ) ( ON ?auto_121074 ?auto_121075 ) ( ON ?auto_121073 ?auto_121074 ) ( CLEAR ?auto_121073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_121078 ?auto_121079 ?auto_121080 ?auto_121081 ?auto_121077 ?auto_121076 ?auto_121075 ?auto_121074 )
      ( MAKE-5PILE ?auto_121073 ?auto_121074 ?auto_121075 ?auto_121076 ?auto_121077 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121085 - BLOCK
      ?auto_121086 - BLOCK
      ?auto_121087 - BLOCK
    )
    :vars
    (
      ?auto_121088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121088 ?auto_121087 ) ( CLEAR ?auto_121088 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121085 ) ( ON ?auto_121086 ?auto_121085 ) ( ON ?auto_121087 ?auto_121086 ) ( not ( = ?auto_121085 ?auto_121086 ) ) ( not ( = ?auto_121085 ?auto_121087 ) ) ( not ( = ?auto_121085 ?auto_121088 ) ) ( not ( = ?auto_121086 ?auto_121087 ) ) ( not ( = ?auto_121086 ?auto_121088 ) ) ( not ( = ?auto_121087 ?auto_121088 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121088 ?auto_121087 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121089 - BLOCK
      ?auto_121090 - BLOCK
      ?auto_121091 - BLOCK
    )
    :vars
    (
      ?auto_121092 - BLOCK
      ?auto_121093 - BLOCK
      ?auto_121094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121092 ?auto_121091 ) ( CLEAR ?auto_121092 ) ( ON-TABLE ?auto_121089 ) ( ON ?auto_121090 ?auto_121089 ) ( ON ?auto_121091 ?auto_121090 ) ( not ( = ?auto_121089 ?auto_121090 ) ) ( not ( = ?auto_121089 ?auto_121091 ) ) ( not ( = ?auto_121089 ?auto_121092 ) ) ( not ( = ?auto_121090 ?auto_121091 ) ) ( not ( = ?auto_121090 ?auto_121092 ) ) ( not ( = ?auto_121091 ?auto_121092 ) ) ( HOLDING ?auto_121093 ) ( CLEAR ?auto_121094 ) ( not ( = ?auto_121089 ?auto_121093 ) ) ( not ( = ?auto_121089 ?auto_121094 ) ) ( not ( = ?auto_121090 ?auto_121093 ) ) ( not ( = ?auto_121090 ?auto_121094 ) ) ( not ( = ?auto_121091 ?auto_121093 ) ) ( not ( = ?auto_121091 ?auto_121094 ) ) ( not ( = ?auto_121092 ?auto_121093 ) ) ( not ( = ?auto_121092 ?auto_121094 ) ) ( not ( = ?auto_121093 ?auto_121094 ) ) )
    :subtasks
    ( ( !STACK ?auto_121093 ?auto_121094 )
      ( MAKE-3PILE ?auto_121089 ?auto_121090 ?auto_121091 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121095 - BLOCK
      ?auto_121096 - BLOCK
      ?auto_121097 - BLOCK
    )
    :vars
    (
      ?auto_121100 - BLOCK
      ?auto_121099 - BLOCK
      ?auto_121098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121100 ?auto_121097 ) ( ON-TABLE ?auto_121095 ) ( ON ?auto_121096 ?auto_121095 ) ( ON ?auto_121097 ?auto_121096 ) ( not ( = ?auto_121095 ?auto_121096 ) ) ( not ( = ?auto_121095 ?auto_121097 ) ) ( not ( = ?auto_121095 ?auto_121100 ) ) ( not ( = ?auto_121096 ?auto_121097 ) ) ( not ( = ?auto_121096 ?auto_121100 ) ) ( not ( = ?auto_121097 ?auto_121100 ) ) ( CLEAR ?auto_121099 ) ( not ( = ?auto_121095 ?auto_121098 ) ) ( not ( = ?auto_121095 ?auto_121099 ) ) ( not ( = ?auto_121096 ?auto_121098 ) ) ( not ( = ?auto_121096 ?auto_121099 ) ) ( not ( = ?auto_121097 ?auto_121098 ) ) ( not ( = ?auto_121097 ?auto_121099 ) ) ( not ( = ?auto_121100 ?auto_121098 ) ) ( not ( = ?auto_121100 ?auto_121099 ) ) ( not ( = ?auto_121098 ?auto_121099 ) ) ( ON ?auto_121098 ?auto_121100 ) ( CLEAR ?auto_121098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121095 ?auto_121096 ?auto_121097 ?auto_121100 )
      ( MAKE-3PILE ?auto_121095 ?auto_121096 ?auto_121097 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121101 - BLOCK
      ?auto_121102 - BLOCK
      ?auto_121103 - BLOCK
    )
    :vars
    (
      ?auto_121106 - BLOCK
      ?auto_121104 - BLOCK
      ?auto_121105 - BLOCK
      ?auto_121108 - BLOCK
      ?auto_121109 - BLOCK
      ?auto_121107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121106 ?auto_121103 ) ( ON-TABLE ?auto_121101 ) ( ON ?auto_121102 ?auto_121101 ) ( ON ?auto_121103 ?auto_121102 ) ( not ( = ?auto_121101 ?auto_121102 ) ) ( not ( = ?auto_121101 ?auto_121103 ) ) ( not ( = ?auto_121101 ?auto_121106 ) ) ( not ( = ?auto_121102 ?auto_121103 ) ) ( not ( = ?auto_121102 ?auto_121106 ) ) ( not ( = ?auto_121103 ?auto_121106 ) ) ( not ( = ?auto_121101 ?auto_121104 ) ) ( not ( = ?auto_121101 ?auto_121105 ) ) ( not ( = ?auto_121102 ?auto_121104 ) ) ( not ( = ?auto_121102 ?auto_121105 ) ) ( not ( = ?auto_121103 ?auto_121104 ) ) ( not ( = ?auto_121103 ?auto_121105 ) ) ( not ( = ?auto_121106 ?auto_121104 ) ) ( not ( = ?auto_121106 ?auto_121105 ) ) ( not ( = ?auto_121104 ?auto_121105 ) ) ( ON ?auto_121104 ?auto_121106 ) ( CLEAR ?auto_121104 ) ( HOLDING ?auto_121105 ) ( CLEAR ?auto_121108 ) ( ON-TABLE ?auto_121109 ) ( ON ?auto_121107 ?auto_121109 ) ( ON ?auto_121108 ?auto_121107 ) ( not ( = ?auto_121109 ?auto_121107 ) ) ( not ( = ?auto_121109 ?auto_121108 ) ) ( not ( = ?auto_121109 ?auto_121105 ) ) ( not ( = ?auto_121107 ?auto_121108 ) ) ( not ( = ?auto_121107 ?auto_121105 ) ) ( not ( = ?auto_121108 ?auto_121105 ) ) ( not ( = ?auto_121101 ?auto_121108 ) ) ( not ( = ?auto_121101 ?auto_121109 ) ) ( not ( = ?auto_121101 ?auto_121107 ) ) ( not ( = ?auto_121102 ?auto_121108 ) ) ( not ( = ?auto_121102 ?auto_121109 ) ) ( not ( = ?auto_121102 ?auto_121107 ) ) ( not ( = ?auto_121103 ?auto_121108 ) ) ( not ( = ?auto_121103 ?auto_121109 ) ) ( not ( = ?auto_121103 ?auto_121107 ) ) ( not ( = ?auto_121106 ?auto_121108 ) ) ( not ( = ?auto_121106 ?auto_121109 ) ) ( not ( = ?auto_121106 ?auto_121107 ) ) ( not ( = ?auto_121104 ?auto_121108 ) ) ( not ( = ?auto_121104 ?auto_121109 ) ) ( not ( = ?auto_121104 ?auto_121107 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121109 ?auto_121107 ?auto_121108 ?auto_121105 )
      ( MAKE-3PILE ?auto_121101 ?auto_121102 ?auto_121103 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121110 - BLOCK
      ?auto_121111 - BLOCK
      ?auto_121112 - BLOCK
    )
    :vars
    (
      ?auto_121117 - BLOCK
      ?auto_121118 - BLOCK
      ?auto_121115 - BLOCK
      ?auto_121113 - BLOCK
      ?auto_121114 - BLOCK
      ?auto_121116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121117 ?auto_121112 ) ( ON-TABLE ?auto_121110 ) ( ON ?auto_121111 ?auto_121110 ) ( ON ?auto_121112 ?auto_121111 ) ( not ( = ?auto_121110 ?auto_121111 ) ) ( not ( = ?auto_121110 ?auto_121112 ) ) ( not ( = ?auto_121110 ?auto_121117 ) ) ( not ( = ?auto_121111 ?auto_121112 ) ) ( not ( = ?auto_121111 ?auto_121117 ) ) ( not ( = ?auto_121112 ?auto_121117 ) ) ( not ( = ?auto_121110 ?auto_121118 ) ) ( not ( = ?auto_121110 ?auto_121115 ) ) ( not ( = ?auto_121111 ?auto_121118 ) ) ( not ( = ?auto_121111 ?auto_121115 ) ) ( not ( = ?auto_121112 ?auto_121118 ) ) ( not ( = ?auto_121112 ?auto_121115 ) ) ( not ( = ?auto_121117 ?auto_121118 ) ) ( not ( = ?auto_121117 ?auto_121115 ) ) ( not ( = ?auto_121118 ?auto_121115 ) ) ( ON ?auto_121118 ?auto_121117 ) ( CLEAR ?auto_121113 ) ( ON-TABLE ?auto_121114 ) ( ON ?auto_121116 ?auto_121114 ) ( ON ?auto_121113 ?auto_121116 ) ( not ( = ?auto_121114 ?auto_121116 ) ) ( not ( = ?auto_121114 ?auto_121113 ) ) ( not ( = ?auto_121114 ?auto_121115 ) ) ( not ( = ?auto_121116 ?auto_121113 ) ) ( not ( = ?auto_121116 ?auto_121115 ) ) ( not ( = ?auto_121113 ?auto_121115 ) ) ( not ( = ?auto_121110 ?auto_121113 ) ) ( not ( = ?auto_121110 ?auto_121114 ) ) ( not ( = ?auto_121110 ?auto_121116 ) ) ( not ( = ?auto_121111 ?auto_121113 ) ) ( not ( = ?auto_121111 ?auto_121114 ) ) ( not ( = ?auto_121111 ?auto_121116 ) ) ( not ( = ?auto_121112 ?auto_121113 ) ) ( not ( = ?auto_121112 ?auto_121114 ) ) ( not ( = ?auto_121112 ?auto_121116 ) ) ( not ( = ?auto_121117 ?auto_121113 ) ) ( not ( = ?auto_121117 ?auto_121114 ) ) ( not ( = ?auto_121117 ?auto_121116 ) ) ( not ( = ?auto_121118 ?auto_121113 ) ) ( not ( = ?auto_121118 ?auto_121114 ) ) ( not ( = ?auto_121118 ?auto_121116 ) ) ( ON ?auto_121115 ?auto_121118 ) ( CLEAR ?auto_121115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121110 ?auto_121111 ?auto_121112 ?auto_121117 ?auto_121118 )
      ( MAKE-3PILE ?auto_121110 ?auto_121111 ?auto_121112 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121119 - BLOCK
      ?auto_121120 - BLOCK
      ?auto_121121 - BLOCK
    )
    :vars
    (
      ?auto_121125 - BLOCK
      ?auto_121127 - BLOCK
      ?auto_121126 - BLOCK
      ?auto_121123 - BLOCK
      ?auto_121124 - BLOCK
      ?auto_121122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121125 ?auto_121121 ) ( ON-TABLE ?auto_121119 ) ( ON ?auto_121120 ?auto_121119 ) ( ON ?auto_121121 ?auto_121120 ) ( not ( = ?auto_121119 ?auto_121120 ) ) ( not ( = ?auto_121119 ?auto_121121 ) ) ( not ( = ?auto_121119 ?auto_121125 ) ) ( not ( = ?auto_121120 ?auto_121121 ) ) ( not ( = ?auto_121120 ?auto_121125 ) ) ( not ( = ?auto_121121 ?auto_121125 ) ) ( not ( = ?auto_121119 ?auto_121127 ) ) ( not ( = ?auto_121119 ?auto_121126 ) ) ( not ( = ?auto_121120 ?auto_121127 ) ) ( not ( = ?auto_121120 ?auto_121126 ) ) ( not ( = ?auto_121121 ?auto_121127 ) ) ( not ( = ?auto_121121 ?auto_121126 ) ) ( not ( = ?auto_121125 ?auto_121127 ) ) ( not ( = ?auto_121125 ?auto_121126 ) ) ( not ( = ?auto_121127 ?auto_121126 ) ) ( ON ?auto_121127 ?auto_121125 ) ( ON-TABLE ?auto_121123 ) ( ON ?auto_121124 ?auto_121123 ) ( not ( = ?auto_121123 ?auto_121124 ) ) ( not ( = ?auto_121123 ?auto_121122 ) ) ( not ( = ?auto_121123 ?auto_121126 ) ) ( not ( = ?auto_121124 ?auto_121122 ) ) ( not ( = ?auto_121124 ?auto_121126 ) ) ( not ( = ?auto_121122 ?auto_121126 ) ) ( not ( = ?auto_121119 ?auto_121122 ) ) ( not ( = ?auto_121119 ?auto_121123 ) ) ( not ( = ?auto_121119 ?auto_121124 ) ) ( not ( = ?auto_121120 ?auto_121122 ) ) ( not ( = ?auto_121120 ?auto_121123 ) ) ( not ( = ?auto_121120 ?auto_121124 ) ) ( not ( = ?auto_121121 ?auto_121122 ) ) ( not ( = ?auto_121121 ?auto_121123 ) ) ( not ( = ?auto_121121 ?auto_121124 ) ) ( not ( = ?auto_121125 ?auto_121122 ) ) ( not ( = ?auto_121125 ?auto_121123 ) ) ( not ( = ?auto_121125 ?auto_121124 ) ) ( not ( = ?auto_121127 ?auto_121122 ) ) ( not ( = ?auto_121127 ?auto_121123 ) ) ( not ( = ?auto_121127 ?auto_121124 ) ) ( ON ?auto_121126 ?auto_121127 ) ( CLEAR ?auto_121126 ) ( HOLDING ?auto_121122 ) ( CLEAR ?auto_121124 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121123 ?auto_121124 ?auto_121122 )
      ( MAKE-3PILE ?auto_121119 ?auto_121120 ?auto_121121 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121128 - BLOCK
      ?auto_121129 - BLOCK
      ?auto_121130 - BLOCK
    )
    :vars
    (
      ?auto_121135 - BLOCK
      ?auto_121132 - BLOCK
      ?auto_121134 - BLOCK
      ?auto_121131 - BLOCK
      ?auto_121133 - BLOCK
      ?auto_121136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121135 ?auto_121130 ) ( ON-TABLE ?auto_121128 ) ( ON ?auto_121129 ?auto_121128 ) ( ON ?auto_121130 ?auto_121129 ) ( not ( = ?auto_121128 ?auto_121129 ) ) ( not ( = ?auto_121128 ?auto_121130 ) ) ( not ( = ?auto_121128 ?auto_121135 ) ) ( not ( = ?auto_121129 ?auto_121130 ) ) ( not ( = ?auto_121129 ?auto_121135 ) ) ( not ( = ?auto_121130 ?auto_121135 ) ) ( not ( = ?auto_121128 ?auto_121132 ) ) ( not ( = ?auto_121128 ?auto_121134 ) ) ( not ( = ?auto_121129 ?auto_121132 ) ) ( not ( = ?auto_121129 ?auto_121134 ) ) ( not ( = ?auto_121130 ?auto_121132 ) ) ( not ( = ?auto_121130 ?auto_121134 ) ) ( not ( = ?auto_121135 ?auto_121132 ) ) ( not ( = ?auto_121135 ?auto_121134 ) ) ( not ( = ?auto_121132 ?auto_121134 ) ) ( ON ?auto_121132 ?auto_121135 ) ( ON-TABLE ?auto_121131 ) ( ON ?auto_121133 ?auto_121131 ) ( not ( = ?auto_121131 ?auto_121133 ) ) ( not ( = ?auto_121131 ?auto_121136 ) ) ( not ( = ?auto_121131 ?auto_121134 ) ) ( not ( = ?auto_121133 ?auto_121136 ) ) ( not ( = ?auto_121133 ?auto_121134 ) ) ( not ( = ?auto_121136 ?auto_121134 ) ) ( not ( = ?auto_121128 ?auto_121136 ) ) ( not ( = ?auto_121128 ?auto_121131 ) ) ( not ( = ?auto_121128 ?auto_121133 ) ) ( not ( = ?auto_121129 ?auto_121136 ) ) ( not ( = ?auto_121129 ?auto_121131 ) ) ( not ( = ?auto_121129 ?auto_121133 ) ) ( not ( = ?auto_121130 ?auto_121136 ) ) ( not ( = ?auto_121130 ?auto_121131 ) ) ( not ( = ?auto_121130 ?auto_121133 ) ) ( not ( = ?auto_121135 ?auto_121136 ) ) ( not ( = ?auto_121135 ?auto_121131 ) ) ( not ( = ?auto_121135 ?auto_121133 ) ) ( not ( = ?auto_121132 ?auto_121136 ) ) ( not ( = ?auto_121132 ?auto_121131 ) ) ( not ( = ?auto_121132 ?auto_121133 ) ) ( ON ?auto_121134 ?auto_121132 ) ( CLEAR ?auto_121133 ) ( ON ?auto_121136 ?auto_121134 ) ( CLEAR ?auto_121136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121128 ?auto_121129 ?auto_121130 ?auto_121135 ?auto_121132 ?auto_121134 )
      ( MAKE-3PILE ?auto_121128 ?auto_121129 ?auto_121130 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121137 - BLOCK
      ?auto_121138 - BLOCK
      ?auto_121139 - BLOCK
    )
    :vars
    (
      ?auto_121144 - BLOCK
      ?auto_121143 - BLOCK
      ?auto_121142 - BLOCK
      ?auto_121145 - BLOCK
      ?auto_121141 - BLOCK
      ?auto_121140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121144 ?auto_121139 ) ( ON-TABLE ?auto_121137 ) ( ON ?auto_121138 ?auto_121137 ) ( ON ?auto_121139 ?auto_121138 ) ( not ( = ?auto_121137 ?auto_121138 ) ) ( not ( = ?auto_121137 ?auto_121139 ) ) ( not ( = ?auto_121137 ?auto_121144 ) ) ( not ( = ?auto_121138 ?auto_121139 ) ) ( not ( = ?auto_121138 ?auto_121144 ) ) ( not ( = ?auto_121139 ?auto_121144 ) ) ( not ( = ?auto_121137 ?auto_121143 ) ) ( not ( = ?auto_121137 ?auto_121142 ) ) ( not ( = ?auto_121138 ?auto_121143 ) ) ( not ( = ?auto_121138 ?auto_121142 ) ) ( not ( = ?auto_121139 ?auto_121143 ) ) ( not ( = ?auto_121139 ?auto_121142 ) ) ( not ( = ?auto_121144 ?auto_121143 ) ) ( not ( = ?auto_121144 ?auto_121142 ) ) ( not ( = ?auto_121143 ?auto_121142 ) ) ( ON ?auto_121143 ?auto_121144 ) ( ON-TABLE ?auto_121145 ) ( not ( = ?auto_121145 ?auto_121141 ) ) ( not ( = ?auto_121145 ?auto_121140 ) ) ( not ( = ?auto_121145 ?auto_121142 ) ) ( not ( = ?auto_121141 ?auto_121140 ) ) ( not ( = ?auto_121141 ?auto_121142 ) ) ( not ( = ?auto_121140 ?auto_121142 ) ) ( not ( = ?auto_121137 ?auto_121140 ) ) ( not ( = ?auto_121137 ?auto_121145 ) ) ( not ( = ?auto_121137 ?auto_121141 ) ) ( not ( = ?auto_121138 ?auto_121140 ) ) ( not ( = ?auto_121138 ?auto_121145 ) ) ( not ( = ?auto_121138 ?auto_121141 ) ) ( not ( = ?auto_121139 ?auto_121140 ) ) ( not ( = ?auto_121139 ?auto_121145 ) ) ( not ( = ?auto_121139 ?auto_121141 ) ) ( not ( = ?auto_121144 ?auto_121140 ) ) ( not ( = ?auto_121144 ?auto_121145 ) ) ( not ( = ?auto_121144 ?auto_121141 ) ) ( not ( = ?auto_121143 ?auto_121140 ) ) ( not ( = ?auto_121143 ?auto_121145 ) ) ( not ( = ?auto_121143 ?auto_121141 ) ) ( ON ?auto_121142 ?auto_121143 ) ( ON ?auto_121140 ?auto_121142 ) ( CLEAR ?auto_121140 ) ( HOLDING ?auto_121141 ) ( CLEAR ?auto_121145 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121145 ?auto_121141 )
      ( MAKE-3PILE ?auto_121137 ?auto_121138 ?auto_121139 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_123004 - BLOCK
      ?auto_123005 - BLOCK
      ?auto_123006 - BLOCK
    )
    :vars
    (
      ?auto_123011 - BLOCK
      ?auto_123009 - BLOCK
      ?auto_123010 - BLOCK
      ?auto_123008 - BLOCK
      ?auto_123007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123011 ?auto_123006 ) ( ON-TABLE ?auto_123004 ) ( ON ?auto_123005 ?auto_123004 ) ( ON ?auto_123006 ?auto_123005 ) ( not ( = ?auto_123004 ?auto_123005 ) ) ( not ( = ?auto_123004 ?auto_123006 ) ) ( not ( = ?auto_123004 ?auto_123011 ) ) ( not ( = ?auto_123005 ?auto_123006 ) ) ( not ( = ?auto_123005 ?auto_123011 ) ) ( not ( = ?auto_123006 ?auto_123011 ) ) ( not ( = ?auto_123004 ?auto_123009 ) ) ( not ( = ?auto_123004 ?auto_123010 ) ) ( not ( = ?auto_123005 ?auto_123009 ) ) ( not ( = ?auto_123005 ?auto_123010 ) ) ( not ( = ?auto_123006 ?auto_123009 ) ) ( not ( = ?auto_123006 ?auto_123010 ) ) ( not ( = ?auto_123011 ?auto_123009 ) ) ( not ( = ?auto_123011 ?auto_123010 ) ) ( not ( = ?auto_123009 ?auto_123010 ) ) ( ON ?auto_123009 ?auto_123011 ) ( not ( = ?auto_123008 ?auto_123007 ) ) ( not ( = ?auto_123008 ?auto_123010 ) ) ( not ( = ?auto_123007 ?auto_123010 ) ) ( not ( = ?auto_123004 ?auto_123007 ) ) ( not ( = ?auto_123004 ?auto_123008 ) ) ( not ( = ?auto_123005 ?auto_123007 ) ) ( not ( = ?auto_123005 ?auto_123008 ) ) ( not ( = ?auto_123006 ?auto_123007 ) ) ( not ( = ?auto_123006 ?auto_123008 ) ) ( not ( = ?auto_123011 ?auto_123007 ) ) ( not ( = ?auto_123011 ?auto_123008 ) ) ( not ( = ?auto_123009 ?auto_123007 ) ) ( not ( = ?auto_123009 ?auto_123008 ) ) ( ON ?auto_123010 ?auto_123009 ) ( ON ?auto_123007 ?auto_123010 ) ( ON ?auto_123008 ?auto_123007 ) ( CLEAR ?auto_123008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123004 ?auto_123005 ?auto_123006 ?auto_123011 ?auto_123009 ?auto_123010 ?auto_123007 )
      ( MAKE-3PILE ?auto_123004 ?auto_123005 ?auto_123006 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121155 - BLOCK
      ?auto_121156 - BLOCK
      ?auto_121157 - BLOCK
    )
    :vars
    (
      ?auto_121158 - BLOCK
      ?auto_121162 - BLOCK
      ?auto_121161 - BLOCK
      ?auto_121160 - BLOCK
      ?auto_121163 - BLOCK
      ?auto_121159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121158 ?auto_121157 ) ( ON-TABLE ?auto_121155 ) ( ON ?auto_121156 ?auto_121155 ) ( ON ?auto_121157 ?auto_121156 ) ( not ( = ?auto_121155 ?auto_121156 ) ) ( not ( = ?auto_121155 ?auto_121157 ) ) ( not ( = ?auto_121155 ?auto_121158 ) ) ( not ( = ?auto_121156 ?auto_121157 ) ) ( not ( = ?auto_121156 ?auto_121158 ) ) ( not ( = ?auto_121157 ?auto_121158 ) ) ( not ( = ?auto_121155 ?auto_121162 ) ) ( not ( = ?auto_121155 ?auto_121161 ) ) ( not ( = ?auto_121156 ?auto_121162 ) ) ( not ( = ?auto_121156 ?auto_121161 ) ) ( not ( = ?auto_121157 ?auto_121162 ) ) ( not ( = ?auto_121157 ?auto_121161 ) ) ( not ( = ?auto_121158 ?auto_121162 ) ) ( not ( = ?auto_121158 ?auto_121161 ) ) ( not ( = ?auto_121162 ?auto_121161 ) ) ( ON ?auto_121162 ?auto_121158 ) ( not ( = ?auto_121160 ?auto_121163 ) ) ( not ( = ?auto_121160 ?auto_121159 ) ) ( not ( = ?auto_121160 ?auto_121161 ) ) ( not ( = ?auto_121163 ?auto_121159 ) ) ( not ( = ?auto_121163 ?auto_121161 ) ) ( not ( = ?auto_121159 ?auto_121161 ) ) ( not ( = ?auto_121155 ?auto_121159 ) ) ( not ( = ?auto_121155 ?auto_121160 ) ) ( not ( = ?auto_121155 ?auto_121163 ) ) ( not ( = ?auto_121156 ?auto_121159 ) ) ( not ( = ?auto_121156 ?auto_121160 ) ) ( not ( = ?auto_121156 ?auto_121163 ) ) ( not ( = ?auto_121157 ?auto_121159 ) ) ( not ( = ?auto_121157 ?auto_121160 ) ) ( not ( = ?auto_121157 ?auto_121163 ) ) ( not ( = ?auto_121158 ?auto_121159 ) ) ( not ( = ?auto_121158 ?auto_121160 ) ) ( not ( = ?auto_121158 ?auto_121163 ) ) ( not ( = ?auto_121162 ?auto_121159 ) ) ( not ( = ?auto_121162 ?auto_121160 ) ) ( not ( = ?auto_121162 ?auto_121163 ) ) ( ON ?auto_121161 ?auto_121162 ) ( ON ?auto_121159 ?auto_121161 ) ( ON ?auto_121163 ?auto_121159 ) ( CLEAR ?auto_121163 ) ( HOLDING ?auto_121160 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121160 )
      ( MAKE-3PILE ?auto_121155 ?auto_121156 ?auto_121157 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121164 - BLOCK
      ?auto_121165 - BLOCK
      ?auto_121166 - BLOCK
    )
    :vars
    (
      ?auto_121167 - BLOCK
      ?auto_121169 - BLOCK
      ?auto_121168 - BLOCK
      ?auto_121170 - BLOCK
      ?auto_121171 - BLOCK
      ?auto_121172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121167 ?auto_121166 ) ( ON-TABLE ?auto_121164 ) ( ON ?auto_121165 ?auto_121164 ) ( ON ?auto_121166 ?auto_121165 ) ( not ( = ?auto_121164 ?auto_121165 ) ) ( not ( = ?auto_121164 ?auto_121166 ) ) ( not ( = ?auto_121164 ?auto_121167 ) ) ( not ( = ?auto_121165 ?auto_121166 ) ) ( not ( = ?auto_121165 ?auto_121167 ) ) ( not ( = ?auto_121166 ?auto_121167 ) ) ( not ( = ?auto_121164 ?auto_121169 ) ) ( not ( = ?auto_121164 ?auto_121168 ) ) ( not ( = ?auto_121165 ?auto_121169 ) ) ( not ( = ?auto_121165 ?auto_121168 ) ) ( not ( = ?auto_121166 ?auto_121169 ) ) ( not ( = ?auto_121166 ?auto_121168 ) ) ( not ( = ?auto_121167 ?auto_121169 ) ) ( not ( = ?auto_121167 ?auto_121168 ) ) ( not ( = ?auto_121169 ?auto_121168 ) ) ( ON ?auto_121169 ?auto_121167 ) ( not ( = ?auto_121170 ?auto_121171 ) ) ( not ( = ?auto_121170 ?auto_121172 ) ) ( not ( = ?auto_121170 ?auto_121168 ) ) ( not ( = ?auto_121171 ?auto_121172 ) ) ( not ( = ?auto_121171 ?auto_121168 ) ) ( not ( = ?auto_121172 ?auto_121168 ) ) ( not ( = ?auto_121164 ?auto_121172 ) ) ( not ( = ?auto_121164 ?auto_121170 ) ) ( not ( = ?auto_121164 ?auto_121171 ) ) ( not ( = ?auto_121165 ?auto_121172 ) ) ( not ( = ?auto_121165 ?auto_121170 ) ) ( not ( = ?auto_121165 ?auto_121171 ) ) ( not ( = ?auto_121166 ?auto_121172 ) ) ( not ( = ?auto_121166 ?auto_121170 ) ) ( not ( = ?auto_121166 ?auto_121171 ) ) ( not ( = ?auto_121167 ?auto_121172 ) ) ( not ( = ?auto_121167 ?auto_121170 ) ) ( not ( = ?auto_121167 ?auto_121171 ) ) ( not ( = ?auto_121169 ?auto_121172 ) ) ( not ( = ?auto_121169 ?auto_121170 ) ) ( not ( = ?auto_121169 ?auto_121171 ) ) ( ON ?auto_121168 ?auto_121169 ) ( ON ?auto_121172 ?auto_121168 ) ( ON ?auto_121171 ?auto_121172 ) ( ON ?auto_121170 ?auto_121171 ) ( CLEAR ?auto_121170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_121164 ?auto_121165 ?auto_121166 ?auto_121167 ?auto_121169 ?auto_121168 ?auto_121172 ?auto_121171 )
      ( MAKE-3PILE ?auto_121164 ?auto_121165 ?auto_121166 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121179 - BLOCK
      ?auto_121180 - BLOCK
      ?auto_121181 - BLOCK
      ?auto_121182 - BLOCK
      ?auto_121183 - BLOCK
      ?auto_121184 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_121184 ) ( CLEAR ?auto_121183 ) ( ON-TABLE ?auto_121179 ) ( ON ?auto_121180 ?auto_121179 ) ( ON ?auto_121181 ?auto_121180 ) ( ON ?auto_121182 ?auto_121181 ) ( ON ?auto_121183 ?auto_121182 ) ( not ( = ?auto_121179 ?auto_121180 ) ) ( not ( = ?auto_121179 ?auto_121181 ) ) ( not ( = ?auto_121179 ?auto_121182 ) ) ( not ( = ?auto_121179 ?auto_121183 ) ) ( not ( = ?auto_121179 ?auto_121184 ) ) ( not ( = ?auto_121180 ?auto_121181 ) ) ( not ( = ?auto_121180 ?auto_121182 ) ) ( not ( = ?auto_121180 ?auto_121183 ) ) ( not ( = ?auto_121180 ?auto_121184 ) ) ( not ( = ?auto_121181 ?auto_121182 ) ) ( not ( = ?auto_121181 ?auto_121183 ) ) ( not ( = ?auto_121181 ?auto_121184 ) ) ( not ( = ?auto_121182 ?auto_121183 ) ) ( not ( = ?auto_121182 ?auto_121184 ) ) ( not ( = ?auto_121183 ?auto_121184 ) ) )
    :subtasks
    ( ( !STACK ?auto_121184 ?auto_121183 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121185 - BLOCK
      ?auto_121186 - BLOCK
      ?auto_121187 - BLOCK
      ?auto_121188 - BLOCK
      ?auto_121189 - BLOCK
      ?auto_121190 - BLOCK
    )
    :vars
    (
      ?auto_121191 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_121189 ) ( ON-TABLE ?auto_121185 ) ( ON ?auto_121186 ?auto_121185 ) ( ON ?auto_121187 ?auto_121186 ) ( ON ?auto_121188 ?auto_121187 ) ( ON ?auto_121189 ?auto_121188 ) ( not ( = ?auto_121185 ?auto_121186 ) ) ( not ( = ?auto_121185 ?auto_121187 ) ) ( not ( = ?auto_121185 ?auto_121188 ) ) ( not ( = ?auto_121185 ?auto_121189 ) ) ( not ( = ?auto_121185 ?auto_121190 ) ) ( not ( = ?auto_121186 ?auto_121187 ) ) ( not ( = ?auto_121186 ?auto_121188 ) ) ( not ( = ?auto_121186 ?auto_121189 ) ) ( not ( = ?auto_121186 ?auto_121190 ) ) ( not ( = ?auto_121187 ?auto_121188 ) ) ( not ( = ?auto_121187 ?auto_121189 ) ) ( not ( = ?auto_121187 ?auto_121190 ) ) ( not ( = ?auto_121188 ?auto_121189 ) ) ( not ( = ?auto_121188 ?auto_121190 ) ) ( not ( = ?auto_121189 ?auto_121190 ) ) ( ON ?auto_121190 ?auto_121191 ) ( CLEAR ?auto_121190 ) ( HAND-EMPTY ) ( not ( = ?auto_121185 ?auto_121191 ) ) ( not ( = ?auto_121186 ?auto_121191 ) ) ( not ( = ?auto_121187 ?auto_121191 ) ) ( not ( = ?auto_121188 ?auto_121191 ) ) ( not ( = ?auto_121189 ?auto_121191 ) ) ( not ( = ?auto_121190 ?auto_121191 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121190 ?auto_121191 )
      ( MAKE-6PILE ?auto_121185 ?auto_121186 ?auto_121187 ?auto_121188 ?auto_121189 ?auto_121190 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121192 - BLOCK
      ?auto_121193 - BLOCK
      ?auto_121194 - BLOCK
      ?auto_121195 - BLOCK
      ?auto_121196 - BLOCK
      ?auto_121197 - BLOCK
    )
    :vars
    (
      ?auto_121198 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121192 ) ( ON ?auto_121193 ?auto_121192 ) ( ON ?auto_121194 ?auto_121193 ) ( ON ?auto_121195 ?auto_121194 ) ( not ( = ?auto_121192 ?auto_121193 ) ) ( not ( = ?auto_121192 ?auto_121194 ) ) ( not ( = ?auto_121192 ?auto_121195 ) ) ( not ( = ?auto_121192 ?auto_121196 ) ) ( not ( = ?auto_121192 ?auto_121197 ) ) ( not ( = ?auto_121193 ?auto_121194 ) ) ( not ( = ?auto_121193 ?auto_121195 ) ) ( not ( = ?auto_121193 ?auto_121196 ) ) ( not ( = ?auto_121193 ?auto_121197 ) ) ( not ( = ?auto_121194 ?auto_121195 ) ) ( not ( = ?auto_121194 ?auto_121196 ) ) ( not ( = ?auto_121194 ?auto_121197 ) ) ( not ( = ?auto_121195 ?auto_121196 ) ) ( not ( = ?auto_121195 ?auto_121197 ) ) ( not ( = ?auto_121196 ?auto_121197 ) ) ( ON ?auto_121197 ?auto_121198 ) ( CLEAR ?auto_121197 ) ( not ( = ?auto_121192 ?auto_121198 ) ) ( not ( = ?auto_121193 ?auto_121198 ) ) ( not ( = ?auto_121194 ?auto_121198 ) ) ( not ( = ?auto_121195 ?auto_121198 ) ) ( not ( = ?auto_121196 ?auto_121198 ) ) ( not ( = ?auto_121197 ?auto_121198 ) ) ( HOLDING ?auto_121196 ) ( CLEAR ?auto_121195 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121192 ?auto_121193 ?auto_121194 ?auto_121195 ?auto_121196 )
      ( MAKE-6PILE ?auto_121192 ?auto_121193 ?auto_121194 ?auto_121195 ?auto_121196 ?auto_121197 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121199 - BLOCK
      ?auto_121200 - BLOCK
      ?auto_121201 - BLOCK
      ?auto_121202 - BLOCK
      ?auto_121203 - BLOCK
      ?auto_121204 - BLOCK
    )
    :vars
    (
      ?auto_121205 - BLOCK
      ?auto_121206 - BLOCK
      ?auto_121207 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121199 ) ( ON ?auto_121200 ?auto_121199 ) ( ON ?auto_121201 ?auto_121200 ) ( ON ?auto_121202 ?auto_121201 ) ( not ( = ?auto_121199 ?auto_121200 ) ) ( not ( = ?auto_121199 ?auto_121201 ) ) ( not ( = ?auto_121199 ?auto_121202 ) ) ( not ( = ?auto_121199 ?auto_121203 ) ) ( not ( = ?auto_121199 ?auto_121204 ) ) ( not ( = ?auto_121200 ?auto_121201 ) ) ( not ( = ?auto_121200 ?auto_121202 ) ) ( not ( = ?auto_121200 ?auto_121203 ) ) ( not ( = ?auto_121200 ?auto_121204 ) ) ( not ( = ?auto_121201 ?auto_121202 ) ) ( not ( = ?auto_121201 ?auto_121203 ) ) ( not ( = ?auto_121201 ?auto_121204 ) ) ( not ( = ?auto_121202 ?auto_121203 ) ) ( not ( = ?auto_121202 ?auto_121204 ) ) ( not ( = ?auto_121203 ?auto_121204 ) ) ( ON ?auto_121204 ?auto_121205 ) ( not ( = ?auto_121199 ?auto_121205 ) ) ( not ( = ?auto_121200 ?auto_121205 ) ) ( not ( = ?auto_121201 ?auto_121205 ) ) ( not ( = ?auto_121202 ?auto_121205 ) ) ( not ( = ?auto_121203 ?auto_121205 ) ) ( not ( = ?auto_121204 ?auto_121205 ) ) ( CLEAR ?auto_121202 ) ( ON ?auto_121203 ?auto_121204 ) ( CLEAR ?auto_121203 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121206 ) ( ON ?auto_121207 ?auto_121206 ) ( ON ?auto_121205 ?auto_121207 ) ( not ( = ?auto_121206 ?auto_121207 ) ) ( not ( = ?auto_121206 ?auto_121205 ) ) ( not ( = ?auto_121206 ?auto_121204 ) ) ( not ( = ?auto_121206 ?auto_121203 ) ) ( not ( = ?auto_121207 ?auto_121205 ) ) ( not ( = ?auto_121207 ?auto_121204 ) ) ( not ( = ?auto_121207 ?auto_121203 ) ) ( not ( = ?auto_121199 ?auto_121206 ) ) ( not ( = ?auto_121199 ?auto_121207 ) ) ( not ( = ?auto_121200 ?auto_121206 ) ) ( not ( = ?auto_121200 ?auto_121207 ) ) ( not ( = ?auto_121201 ?auto_121206 ) ) ( not ( = ?auto_121201 ?auto_121207 ) ) ( not ( = ?auto_121202 ?auto_121206 ) ) ( not ( = ?auto_121202 ?auto_121207 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121206 ?auto_121207 ?auto_121205 ?auto_121204 )
      ( MAKE-6PILE ?auto_121199 ?auto_121200 ?auto_121201 ?auto_121202 ?auto_121203 ?auto_121204 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121208 - BLOCK
      ?auto_121209 - BLOCK
      ?auto_121210 - BLOCK
      ?auto_121211 - BLOCK
      ?auto_121212 - BLOCK
      ?auto_121213 - BLOCK
    )
    :vars
    (
      ?auto_121214 - BLOCK
      ?auto_121216 - BLOCK
      ?auto_121215 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121208 ) ( ON ?auto_121209 ?auto_121208 ) ( ON ?auto_121210 ?auto_121209 ) ( not ( = ?auto_121208 ?auto_121209 ) ) ( not ( = ?auto_121208 ?auto_121210 ) ) ( not ( = ?auto_121208 ?auto_121211 ) ) ( not ( = ?auto_121208 ?auto_121212 ) ) ( not ( = ?auto_121208 ?auto_121213 ) ) ( not ( = ?auto_121209 ?auto_121210 ) ) ( not ( = ?auto_121209 ?auto_121211 ) ) ( not ( = ?auto_121209 ?auto_121212 ) ) ( not ( = ?auto_121209 ?auto_121213 ) ) ( not ( = ?auto_121210 ?auto_121211 ) ) ( not ( = ?auto_121210 ?auto_121212 ) ) ( not ( = ?auto_121210 ?auto_121213 ) ) ( not ( = ?auto_121211 ?auto_121212 ) ) ( not ( = ?auto_121211 ?auto_121213 ) ) ( not ( = ?auto_121212 ?auto_121213 ) ) ( ON ?auto_121213 ?auto_121214 ) ( not ( = ?auto_121208 ?auto_121214 ) ) ( not ( = ?auto_121209 ?auto_121214 ) ) ( not ( = ?auto_121210 ?auto_121214 ) ) ( not ( = ?auto_121211 ?auto_121214 ) ) ( not ( = ?auto_121212 ?auto_121214 ) ) ( not ( = ?auto_121213 ?auto_121214 ) ) ( ON ?auto_121212 ?auto_121213 ) ( CLEAR ?auto_121212 ) ( ON-TABLE ?auto_121216 ) ( ON ?auto_121215 ?auto_121216 ) ( ON ?auto_121214 ?auto_121215 ) ( not ( = ?auto_121216 ?auto_121215 ) ) ( not ( = ?auto_121216 ?auto_121214 ) ) ( not ( = ?auto_121216 ?auto_121213 ) ) ( not ( = ?auto_121216 ?auto_121212 ) ) ( not ( = ?auto_121215 ?auto_121214 ) ) ( not ( = ?auto_121215 ?auto_121213 ) ) ( not ( = ?auto_121215 ?auto_121212 ) ) ( not ( = ?auto_121208 ?auto_121216 ) ) ( not ( = ?auto_121208 ?auto_121215 ) ) ( not ( = ?auto_121209 ?auto_121216 ) ) ( not ( = ?auto_121209 ?auto_121215 ) ) ( not ( = ?auto_121210 ?auto_121216 ) ) ( not ( = ?auto_121210 ?auto_121215 ) ) ( not ( = ?auto_121211 ?auto_121216 ) ) ( not ( = ?auto_121211 ?auto_121215 ) ) ( HOLDING ?auto_121211 ) ( CLEAR ?auto_121210 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121208 ?auto_121209 ?auto_121210 ?auto_121211 )
      ( MAKE-6PILE ?auto_121208 ?auto_121209 ?auto_121210 ?auto_121211 ?auto_121212 ?auto_121213 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121217 - BLOCK
      ?auto_121218 - BLOCK
      ?auto_121219 - BLOCK
      ?auto_121220 - BLOCK
      ?auto_121221 - BLOCK
      ?auto_121222 - BLOCK
    )
    :vars
    (
      ?auto_121223 - BLOCK
      ?auto_121225 - BLOCK
      ?auto_121224 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121217 ) ( ON ?auto_121218 ?auto_121217 ) ( ON ?auto_121219 ?auto_121218 ) ( not ( = ?auto_121217 ?auto_121218 ) ) ( not ( = ?auto_121217 ?auto_121219 ) ) ( not ( = ?auto_121217 ?auto_121220 ) ) ( not ( = ?auto_121217 ?auto_121221 ) ) ( not ( = ?auto_121217 ?auto_121222 ) ) ( not ( = ?auto_121218 ?auto_121219 ) ) ( not ( = ?auto_121218 ?auto_121220 ) ) ( not ( = ?auto_121218 ?auto_121221 ) ) ( not ( = ?auto_121218 ?auto_121222 ) ) ( not ( = ?auto_121219 ?auto_121220 ) ) ( not ( = ?auto_121219 ?auto_121221 ) ) ( not ( = ?auto_121219 ?auto_121222 ) ) ( not ( = ?auto_121220 ?auto_121221 ) ) ( not ( = ?auto_121220 ?auto_121222 ) ) ( not ( = ?auto_121221 ?auto_121222 ) ) ( ON ?auto_121222 ?auto_121223 ) ( not ( = ?auto_121217 ?auto_121223 ) ) ( not ( = ?auto_121218 ?auto_121223 ) ) ( not ( = ?auto_121219 ?auto_121223 ) ) ( not ( = ?auto_121220 ?auto_121223 ) ) ( not ( = ?auto_121221 ?auto_121223 ) ) ( not ( = ?auto_121222 ?auto_121223 ) ) ( ON ?auto_121221 ?auto_121222 ) ( ON-TABLE ?auto_121225 ) ( ON ?auto_121224 ?auto_121225 ) ( ON ?auto_121223 ?auto_121224 ) ( not ( = ?auto_121225 ?auto_121224 ) ) ( not ( = ?auto_121225 ?auto_121223 ) ) ( not ( = ?auto_121225 ?auto_121222 ) ) ( not ( = ?auto_121225 ?auto_121221 ) ) ( not ( = ?auto_121224 ?auto_121223 ) ) ( not ( = ?auto_121224 ?auto_121222 ) ) ( not ( = ?auto_121224 ?auto_121221 ) ) ( not ( = ?auto_121217 ?auto_121225 ) ) ( not ( = ?auto_121217 ?auto_121224 ) ) ( not ( = ?auto_121218 ?auto_121225 ) ) ( not ( = ?auto_121218 ?auto_121224 ) ) ( not ( = ?auto_121219 ?auto_121225 ) ) ( not ( = ?auto_121219 ?auto_121224 ) ) ( not ( = ?auto_121220 ?auto_121225 ) ) ( not ( = ?auto_121220 ?auto_121224 ) ) ( CLEAR ?auto_121219 ) ( ON ?auto_121220 ?auto_121221 ) ( CLEAR ?auto_121220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121225 ?auto_121224 ?auto_121223 ?auto_121222 ?auto_121221 )
      ( MAKE-6PILE ?auto_121217 ?auto_121218 ?auto_121219 ?auto_121220 ?auto_121221 ?auto_121222 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121226 - BLOCK
      ?auto_121227 - BLOCK
      ?auto_121228 - BLOCK
      ?auto_121229 - BLOCK
      ?auto_121230 - BLOCK
      ?auto_121231 - BLOCK
    )
    :vars
    (
      ?auto_121233 - BLOCK
      ?auto_121232 - BLOCK
      ?auto_121234 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121226 ) ( ON ?auto_121227 ?auto_121226 ) ( not ( = ?auto_121226 ?auto_121227 ) ) ( not ( = ?auto_121226 ?auto_121228 ) ) ( not ( = ?auto_121226 ?auto_121229 ) ) ( not ( = ?auto_121226 ?auto_121230 ) ) ( not ( = ?auto_121226 ?auto_121231 ) ) ( not ( = ?auto_121227 ?auto_121228 ) ) ( not ( = ?auto_121227 ?auto_121229 ) ) ( not ( = ?auto_121227 ?auto_121230 ) ) ( not ( = ?auto_121227 ?auto_121231 ) ) ( not ( = ?auto_121228 ?auto_121229 ) ) ( not ( = ?auto_121228 ?auto_121230 ) ) ( not ( = ?auto_121228 ?auto_121231 ) ) ( not ( = ?auto_121229 ?auto_121230 ) ) ( not ( = ?auto_121229 ?auto_121231 ) ) ( not ( = ?auto_121230 ?auto_121231 ) ) ( ON ?auto_121231 ?auto_121233 ) ( not ( = ?auto_121226 ?auto_121233 ) ) ( not ( = ?auto_121227 ?auto_121233 ) ) ( not ( = ?auto_121228 ?auto_121233 ) ) ( not ( = ?auto_121229 ?auto_121233 ) ) ( not ( = ?auto_121230 ?auto_121233 ) ) ( not ( = ?auto_121231 ?auto_121233 ) ) ( ON ?auto_121230 ?auto_121231 ) ( ON-TABLE ?auto_121232 ) ( ON ?auto_121234 ?auto_121232 ) ( ON ?auto_121233 ?auto_121234 ) ( not ( = ?auto_121232 ?auto_121234 ) ) ( not ( = ?auto_121232 ?auto_121233 ) ) ( not ( = ?auto_121232 ?auto_121231 ) ) ( not ( = ?auto_121232 ?auto_121230 ) ) ( not ( = ?auto_121234 ?auto_121233 ) ) ( not ( = ?auto_121234 ?auto_121231 ) ) ( not ( = ?auto_121234 ?auto_121230 ) ) ( not ( = ?auto_121226 ?auto_121232 ) ) ( not ( = ?auto_121226 ?auto_121234 ) ) ( not ( = ?auto_121227 ?auto_121232 ) ) ( not ( = ?auto_121227 ?auto_121234 ) ) ( not ( = ?auto_121228 ?auto_121232 ) ) ( not ( = ?auto_121228 ?auto_121234 ) ) ( not ( = ?auto_121229 ?auto_121232 ) ) ( not ( = ?auto_121229 ?auto_121234 ) ) ( ON ?auto_121229 ?auto_121230 ) ( CLEAR ?auto_121229 ) ( HOLDING ?auto_121228 ) ( CLEAR ?auto_121227 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121226 ?auto_121227 ?auto_121228 )
      ( MAKE-6PILE ?auto_121226 ?auto_121227 ?auto_121228 ?auto_121229 ?auto_121230 ?auto_121231 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121235 - BLOCK
      ?auto_121236 - BLOCK
      ?auto_121237 - BLOCK
      ?auto_121238 - BLOCK
      ?auto_121239 - BLOCK
      ?auto_121240 - BLOCK
    )
    :vars
    (
      ?auto_121241 - BLOCK
      ?auto_121243 - BLOCK
      ?auto_121242 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121235 ) ( ON ?auto_121236 ?auto_121235 ) ( not ( = ?auto_121235 ?auto_121236 ) ) ( not ( = ?auto_121235 ?auto_121237 ) ) ( not ( = ?auto_121235 ?auto_121238 ) ) ( not ( = ?auto_121235 ?auto_121239 ) ) ( not ( = ?auto_121235 ?auto_121240 ) ) ( not ( = ?auto_121236 ?auto_121237 ) ) ( not ( = ?auto_121236 ?auto_121238 ) ) ( not ( = ?auto_121236 ?auto_121239 ) ) ( not ( = ?auto_121236 ?auto_121240 ) ) ( not ( = ?auto_121237 ?auto_121238 ) ) ( not ( = ?auto_121237 ?auto_121239 ) ) ( not ( = ?auto_121237 ?auto_121240 ) ) ( not ( = ?auto_121238 ?auto_121239 ) ) ( not ( = ?auto_121238 ?auto_121240 ) ) ( not ( = ?auto_121239 ?auto_121240 ) ) ( ON ?auto_121240 ?auto_121241 ) ( not ( = ?auto_121235 ?auto_121241 ) ) ( not ( = ?auto_121236 ?auto_121241 ) ) ( not ( = ?auto_121237 ?auto_121241 ) ) ( not ( = ?auto_121238 ?auto_121241 ) ) ( not ( = ?auto_121239 ?auto_121241 ) ) ( not ( = ?auto_121240 ?auto_121241 ) ) ( ON ?auto_121239 ?auto_121240 ) ( ON-TABLE ?auto_121243 ) ( ON ?auto_121242 ?auto_121243 ) ( ON ?auto_121241 ?auto_121242 ) ( not ( = ?auto_121243 ?auto_121242 ) ) ( not ( = ?auto_121243 ?auto_121241 ) ) ( not ( = ?auto_121243 ?auto_121240 ) ) ( not ( = ?auto_121243 ?auto_121239 ) ) ( not ( = ?auto_121242 ?auto_121241 ) ) ( not ( = ?auto_121242 ?auto_121240 ) ) ( not ( = ?auto_121242 ?auto_121239 ) ) ( not ( = ?auto_121235 ?auto_121243 ) ) ( not ( = ?auto_121235 ?auto_121242 ) ) ( not ( = ?auto_121236 ?auto_121243 ) ) ( not ( = ?auto_121236 ?auto_121242 ) ) ( not ( = ?auto_121237 ?auto_121243 ) ) ( not ( = ?auto_121237 ?auto_121242 ) ) ( not ( = ?auto_121238 ?auto_121243 ) ) ( not ( = ?auto_121238 ?auto_121242 ) ) ( ON ?auto_121238 ?auto_121239 ) ( CLEAR ?auto_121236 ) ( ON ?auto_121237 ?auto_121238 ) ( CLEAR ?auto_121237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121243 ?auto_121242 ?auto_121241 ?auto_121240 ?auto_121239 ?auto_121238 )
      ( MAKE-6PILE ?auto_121235 ?auto_121236 ?auto_121237 ?auto_121238 ?auto_121239 ?auto_121240 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121244 - BLOCK
      ?auto_121245 - BLOCK
      ?auto_121246 - BLOCK
      ?auto_121247 - BLOCK
      ?auto_121248 - BLOCK
      ?auto_121249 - BLOCK
    )
    :vars
    (
      ?auto_121250 - BLOCK
      ?auto_121251 - BLOCK
      ?auto_121252 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121244 ) ( not ( = ?auto_121244 ?auto_121245 ) ) ( not ( = ?auto_121244 ?auto_121246 ) ) ( not ( = ?auto_121244 ?auto_121247 ) ) ( not ( = ?auto_121244 ?auto_121248 ) ) ( not ( = ?auto_121244 ?auto_121249 ) ) ( not ( = ?auto_121245 ?auto_121246 ) ) ( not ( = ?auto_121245 ?auto_121247 ) ) ( not ( = ?auto_121245 ?auto_121248 ) ) ( not ( = ?auto_121245 ?auto_121249 ) ) ( not ( = ?auto_121246 ?auto_121247 ) ) ( not ( = ?auto_121246 ?auto_121248 ) ) ( not ( = ?auto_121246 ?auto_121249 ) ) ( not ( = ?auto_121247 ?auto_121248 ) ) ( not ( = ?auto_121247 ?auto_121249 ) ) ( not ( = ?auto_121248 ?auto_121249 ) ) ( ON ?auto_121249 ?auto_121250 ) ( not ( = ?auto_121244 ?auto_121250 ) ) ( not ( = ?auto_121245 ?auto_121250 ) ) ( not ( = ?auto_121246 ?auto_121250 ) ) ( not ( = ?auto_121247 ?auto_121250 ) ) ( not ( = ?auto_121248 ?auto_121250 ) ) ( not ( = ?auto_121249 ?auto_121250 ) ) ( ON ?auto_121248 ?auto_121249 ) ( ON-TABLE ?auto_121251 ) ( ON ?auto_121252 ?auto_121251 ) ( ON ?auto_121250 ?auto_121252 ) ( not ( = ?auto_121251 ?auto_121252 ) ) ( not ( = ?auto_121251 ?auto_121250 ) ) ( not ( = ?auto_121251 ?auto_121249 ) ) ( not ( = ?auto_121251 ?auto_121248 ) ) ( not ( = ?auto_121252 ?auto_121250 ) ) ( not ( = ?auto_121252 ?auto_121249 ) ) ( not ( = ?auto_121252 ?auto_121248 ) ) ( not ( = ?auto_121244 ?auto_121251 ) ) ( not ( = ?auto_121244 ?auto_121252 ) ) ( not ( = ?auto_121245 ?auto_121251 ) ) ( not ( = ?auto_121245 ?auto_121252 ) ) ( not ( = ?auto_121246 ?auto_121251 ) ) ( not ( = ?auto_121246 ?auto_121252 ) ) ( not ( = ?auto_121247 ?auto_121251 ) ) ( not ( = ?auto_121247 ?auto_121252 ) ) ( ON ?auto_121247 ?auto_121248 ) ( ON ?auto_121246 ?auto_121247 ) ( CLEAR ?auto_121246 ) ( HOLDING ?auto_121245 ) ( CLEAR ?auto_121244 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121244 ?auto_121245 )
      ( MAKE-6PILE ?auto_121244 ?auto_121245 ?auto_121246 ?auto_121247 ?auto_121248 ?auto_121249 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121253 - BLOCK
      ?auto_121254 - BLOCK
      ?auto_121255 - BLOCK
      ?auto_121256 - BLOCK
      ?auto_121257 - BLOCK
      ?auto_121258 - BLOCK
    )
    :vars
    (
      ?auto_121261 - BLOCK
      ?auto_121259 - BLOCK
      ?auto_121260 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121253 ) ( not ( = ?auto_121253 ?auto_121254 ) ) ( not ( = ?auto_121253 ?auto_121255 ) ) ( not ( = ?auto_121253 ?auto_121256 ) ) ( not ( = ?auto_121253 ?auto_121257 ) ) ( not ( = ?auto_121253 ?auto_121258 ) ) ( not ( = ?auto_121254 ?auto_121255 ) ) ( not ( = ?auto_121254 ?auto_121256 ) ) ( not ( = ?auto_121254 ?auto_121257 ) ) ( not ( = ?auto_121254 ?auto_121258 ) ) ( not ( = ?auto_121255 ?auto_121256 ) ) ( not ( = ?auto_121255 ?auto_121257 ) ) ( not ( = ?auto_121255 ?auto_121258 ) ) ( not ( = ?auto_121256 ?auto_121257 ) ) ( not ( = ?auto_121256 ?auto_121258 ) ) ( not ( = ?auto_121257 ?auto_121258 ) ) ( ON ?auto_121258 ?auto_121261 ) ( not ( = ?auto_121253 ?auto_121261 ) ) ( not ( = ?auto_121254 ?auto_121261 ) ) ( not ( = ?auto_121255 ?auto_121261 ) ) ( not ( = ?auto_121256 ?auto_121261 ) ) ( not ( = ?auto_121257 ?auto_121261 ) ) ( not ( = ?auto_121258 ?auto_121261 ) ) ( ON ?auto_121257 ?auto_121258 ) ( ON-TABLE ?auto_121259 ) ( ON ?auto_121260 ?auto_121259 ) ( ON ?auto_121261 ?auto_121260 ) ( not ( = ?auto_121259 ?auto_121260 ) ) ( not ( = ?auto_121259 ?auto_121261 ) ) ( not ( = ?auto_121259 ?auto_121258 ) ) ( not ( = ?auto_121259 ?auto_121257 ) ) ( not ( = ?auto_121260 ?auto_121261 ) ) ( not ( = ?auto_121260 ?auto_121258 ) ) ( not ( = ?auto_121260 ?auto_121257 ) ) ( not ( = ?auto_121253 ?auto_121259 ) ) ( not ( = ?auto_121253 ?auto_121260 ) ) ( not ( = ?auto_121254 ?auto_121259 ) ) ( not ( = ?auto_121254 ?auto_121260 ) ) ( not ( = ?auto_121255 ?auto_121259 ) ) ( not ( = ?auto_121255 ?auto_121260 ) ) ( not ( = ?auto_121256 ?auto_121259 ) ) ( not ( = ?auto_121256 ?auto_121260 ) ) ( ON ?auto_121256 ?auto_121257 ) ( ON ?auto_121255 ?auto_121256 ) ( CLEAR ?auto_121253 ) ( ON ?auto_121254 ?auto_121255 ) ( CLEAR ?auto_121254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_121259 ?auto_121260 ?auto_121261 ?auto_121258 ?auto_121257 ?auto_121256 ?auto_121255 )
      ( MAKE-6PILE ?auto_121253 ?auto_121254 ?auto_121255 ?auto_121256 ?auto_121257 ?auto_121258 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121262 - BLOCK
      ?auto_121263 - BLOCK
      ?auto_121264 - BLOCK
      ?auto_121265 - BLOCK
      ?auto_121266 - BLOCK
      ?auto_121267 - BLOCK
    )
    :vars
    (
      ?auto_121269 - BLOCK
      ?auto_121270 - BLOCK
      ?auto_121268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121262 ?auto_121263 ) ) ( not ( = ?auto_121262 ?auto_121264 ) ) ( not ( = ?auto_121262 ?auto_121265 ) ) ( not ( = ?auto_121262 ?auto_121266 ) ) ( not ( = ?auto_121262 ?auto_121267 ) ) ( not ( = ?auto_121263 ?auto_121264 ) ) ( not ( = ?auto_121263 ?auto_121265 ) ) ( not ( = ?auto_121263 ?auto_121266 ) ) ( not ( = ?auto_121263 ?auto_121267 ) ) ( not ( = ?auto_121264 ?auto_121265 ) ) ( not ( = ?auto_121264 ?auto_121266 ) ) ( not ( = ?auto_121264 ?auto_121267 ) ) ( not ( = ?auto_121265 ?auto_121266 ) ) ( not ( = ?auto_121265 ?auto_121267 ) ) ( not ( = ?auto_121266 ?auto_121267 ) ) ( ON ?auto_121267 ?auto_121269 ) ( not ( = ?auto_121262 ?auto_121269 ) ) ( not ( = ?auto_121263 ?auto_121269 ) ) ( not ( = ?auto_121264 ?auto_121269 ) ) ( not ( = ?auto_121265 ?auto_121269 ) ) ( not ( = ?auto_121266 ?auto_121269 ) ) ( not ( = ?auto_121267 ?auto_121269 ) ) ( ON ?auto_121266 ?auto_121267 ) ( ON-TABLE ?auto_121270 ) ( ON ?auto_121268 ?auto_121270 ) ( ON ?auto_121269 ?auto_121268 ) ( not ( = ?auto_121270 ?auto_121268 ) ) ( not ( = ?auto_121270 ?auto_121269 ) ) ( not ( = ?auto_121270 ?auto_121267 ) ) ( not ( = ?auto_121270 ?auto_121266 ) ) ( not ( = ?auto_121268 ?auto_121269 ) ) ( not ( = ?auto_121268 ?auto_121267 ) ) ( not ( = ?auto_121268 ?auto_121266 ) ) ( not ( = ?auto_121262 ?auto_121270 ) ) ( not ( = ?auto_121262 ?auto_121268 ) ) ( not ( = ?auto_121263 ?auto_121270 ) ) ( not ( = ?auto_121263 ?auto_121268 ) ) ( not ( = ?auto_121264 ?auto_121270 ) ) ( not ( = ?auto_121264 ?auto_121268 ) ) ( not ( = ?auto_121265 ?auto_121270 ) ) ( not ( = ?auto_121265 ?auto_121268 ) ) ( ON ?auto_121265 ?auto_121266 ) ( ON ?auto_121264 ?auto_121265 ) ( ON ?auto_121263 ?auto_121264 ) ( CLEAR ?auto_121263 ) ( HOLDING ?auto_121262 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121262 )
      ( MAKE-6PILE ?auto_121262 ?auto_121263 ?auto_121264 ?auto_121265 ?auto_121266 ?auto_121267 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121271 - BLOCK
      ?auto_121272 - BLOCK
      ?auto_121273 - BLOCK
      ?auto_121274 - BLOCK
      ?auto_121275 - BLOCK
      ?auto_121276 - BLOCK
    )
    :vars
    (
      ?auto_121277 - BLOCK
      ?auto_121279 - BLOCK
      ?auto_121278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121271 ?auto_121272 ) ) ( not ( = ?auto_121271 ?auto_121273 ) ) ( not ( = ?auto_121271 ?auto_121274 ) ) ( not ( = ?auto_121271 ?auto_121275 ) ) ( not ( = ?auto_121271 ?auto_121276 ) ) ( not ( = ?auto_121272 ?auto_121273 ) ) ( not ( = ?auto_121272 ?auto_121274 ) ) ( not ( = ?auto_121272 ?auto_121275 ) ) ( not ( = ?auto_121272 ?auto_121276 ) ) ( not ( = ?auto_121273 ?auto_121274 ) ) ( not ( = ?auto_121273 ?auto_121275 ) ) ( not ( = ?auto_121273 ?auto_121276 ) ) ( not ( = ?auto_121274 ?auto_121275 ) ) ( not ( = ?auto_121274 ?auto_121276 ) ) ( not ( = ?auto_121275 ?auto_121276 ) ) ( ON ?auto_121276 ?auto_121277 ) ( not ( = ?auto_121271 ?auto_121277 ) ) ( not ( = ?auto_121272 ?auto_121277 ) ) ( not ( = ?auto_121273 ?auto_121277 ) ) ( not ( = ?auto_121274 ?auto_121277 ) ) ( not ( = ?auto_121275 ?auto_121277 ) ) ( not ( = ?auto_121276 ?auto_121277 ) ) ( ON ?auto_121275 ?auto_121276 ) ( ON-TABLE ?auto_121279 ) ( ON ?auto_121278 ?auto_121279 ) ( ON ?auto_121277 ?auto_121278 ) ( not ( = ?auto_121279 ?auto_121278 ) ) ( not ( = ?auto_121279 ?auto_121277 ) ) ( not ( = ?auto_121279 ?auto_121276 ) ) ( not ( = ?auto_121279 ?auto_121275 ) ) ( not ( = ?auto_121278 ?auto_121277 ) ) ( not ( = ?auto_121278 ?auto_121276 ) ) ( not ( = ?auto_121278 ?auto_121275 ) ) ( not ( = ?auto_121271 ?auto_121279 ) ) ( not ( = ?auto_121271 ?auto_121278 ) ) ( not ( = ?auto_121272 ?auto_121279 ) ) ( not ( = ?auto_121272 ?auto_121278 ) ) ( not ( = ?auto_121273 ?auto_121279 ) ) ( not ( = ?auto_121273 ?auto_121278 ) ) ( not ( = ?auto_121274 ?auto_121279 ) ) ( not ( = ?auto_121274 ?auto_121278 ) ) ( ON ?auto_121274 ?auto_121275 ) ( ON ?auto_121273 ?auto_121274 ) ( ON ?auto_121272 ?auto_121273 ) ( ON ?auto_121271 ?auto_121272 ) ( CLEAR ?auto_121271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_121279 ?auto_121278 ?auto_121277 ?auto_121276 ?auto_121275 ?auto_121274 ?auto_121273 ?auto_121272 )
      ( MAKE-6PILE ?auto_121271 ?auto_121272 ?auto_121273 ?auto_121274 ?auto_121275 ?auto_121276 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121282 - BLOCK
      ?auto_121283 - BLOCK
    )
    :vars
    (
      ?auto_121284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121284 ?auto_121283 ) ( CLEAR ?auto_121284 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121282 ) ( ON ?auto_121283 ?auto_121282 ) ( not ( = ?auto_121282 ?auto_121283 ) ) ( not ( = ?auto_121282 ?auto_121284 ) ) ( not ( = ?auto_121283 ?auto_121284 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121284 ?auto_121283 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121285 - BLOCK
      ?auto_121286 - BLOCK
    )
    :vars
    (
      ?auto_121287 - BLOCK
      ?auto_121288 - BLOCK
      ?auto_121289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121287 ?auto_121286 ) ( CLEAR ?auto_121287 ) ( ON-TABLE ?auto_121285 ) ( ON ?auto_121286 ?auto_121285 ) ( not ( = ?auto_121285 ?auto_121286 ) ) ( not ( = ?auto_121285 ?auto_121287 ) ) ( not ( = ?auto_121286 ?auto_121287 ) ) ( HOLDING ?auto_121288 ) ( CLEAR ?auto_121289 ) ( not ( = ?auto_121285 ?auto_121288 ) ) ( not ( = ?auto_121285 ?auto_121289 ) ) ( not ( = ?auto_121286 ?auto_121288 ) ) ( not ( = ?auto_121286 ?auto_121289 ) ) ( not ( = ?auto_121287 ?auto_121288 ) ) ( not ( = ?auto_121287 ?auto_121289 ) ) ( not ( = ?auto_121288 ?auto_121289 ) ) )
    :subtasks
    ( ( !STACK ?auto_121288 ?auto_121289 )
      ( MAKE-2PILE ?auto_121285 ?auto_121286 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121290 - BLOCK
      ?auto_121291 - BLOCK
    )
    :vars
    (
      ?auto_121292 - BLOCK
      ?auto_121294 - BLOCK
      ?auto_121293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121292 ?auto_121291 ) ( ON-TABLE ?auto_121290 ) ( ON ?auto_121291 ?auto_121290 ) ( not ( = ?auto_121290 ?auto_121291 ) ) ( not ( = ?auto_121290 ?auto_121292 ) ) ( not ( = ?auto_121291 ?auto_121292 ) ) ( CLEAR ?auto_121294 ) ( not ( = ?auto_121290 ?auto_121293 ) ) ( not ( = ?auto_121290 ?auto_121294 ) ) ( not ( = ?auto_121291 ?auto_121293 ) ) ( not ( = ?auto_121291 ?auto_121294 ) ) ( not ( = ?auto_121292 ?auto_121293 ) ) ( not ( = ?auto_121292 ?auto_121294 ) ) ( not ( = ?auto_121293 ?auto_121294 ) ) ( ON ?auto_121293 ?auto_121292 ) ( CLEAR ?auto_121293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121290 ?auto_121291 ?auto_121292 )
      ( MAKE-2PILE ?auto_121290 ?auto_121291 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121295 - BLOCK
      ?auto_121296 - BLOCK
    )
    :vars
    (
      ?auto_121298 - BLOCK
      ?auto_121299 - BLOCK
      ?auto_121297 - BLOCK
      ?auto_121303 - BLOCK
      ?auto_121301 - BLOCK
      ?auto_121302 - BLOCK
      ?auto_121300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121298 ?auto_121296 ) ( ON-TABLE ?auto_121295 ) ( ON ?auto_121296 ?auto_121295 ) ( not ( = ?auto_121295 ?auto_121296 ) ) ( not ( = ?auto_121295 ?auto_121298 ) ) ( not ( = ?auto_121296 ?auto_121298 ) ) ( not ( = ?auto_121295 ?auto_121299 ) ) ( not ( = ?auto_121295 ?auto_121297 ) ) ( not ( = ?auto_121296 ?auto_121299 ) ) ( not ( = ?auto_121296 ?auto_121297 ) ) ( not ( = ?auto_121298 ?auto_121299 ) ) ( not ( = ?auto_121298 ?auto_121297 ) ) ( not ( = ?auto_121299 ?auto_121297 ) ) ( ON ?auto_121299 ?auto_121298 ) ( CLEAR ?auto_121299 ) ( HOLDING ?auto_121297 ) ( CLEAR ?auto_121303 ) ( ON-TABLE ?auto_121301 ) ( ON ?auto_121302 ?auto_121301 ) ( ON ?auto_121300 ?auto_121302 ) ( ON ?auto_121303 ?auto_121300 ) ( not ( = ?auto_121301 ?auto_121302 ) ) ( not ( = ?auto_121301 ?auto_121300 ) ) ( not ( = ?auto_121301 ?auto_121303 ) ) ( not ( = ?auto_121301 ?auto_121297 ) ) ( not ( = ?auto_121302 ?auto_121300 ) ) ( not ( = ?auto_121302 ?auto_121303 ) ) ( not ( = ?auto_121302 ?auto_121297 ) ) ( not ( = ?auto_121300 ?auto_121303 ) ) ( not ( = ?auto_121300 ?auto_121297 ) ) ( not ( = ?auto_121303 ?auto_121297 ) ) ( not ( = ?auto_121295 ?auto_121303 ) ) ( not ( = ?auto_121295 ?auto_121301 ) ) ( not ( = ?auto_121295 ?auto_121302 ) ) ( not ( = ?auto_121295 ?auto_121300 ) ) ( not ( = ?auto_121296 ?auto_121303 ) ) ( not ( = ?auto_121296 ?auto_121301 ) ) ( not ( = ?auto_121296 ?auto_121302 ) ) ( not ( = ?auto_121296 ?auto_121300 ) ) ( not ( = ?auto_121298 ?auto_121303 ) ) ( not ( = ?auto_121298 ?auto_121301 ) ) ( not ( = ?auto_121298 ?auto_121302 ) ) ( not ( = ?auto_121298 ?auto_121300 ) ) ( not ( = ?auto_121299 ?auto_121303 ) ) ( not ( = ?auto_121299 ?auto_121301 ) ) ( not ( = ?auto_121299 ?auto_121302 ) ) ( not ( = ?auto_121299 ?auto_121300 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121301 ?auto_121302 ?auto_121300 ?auto_121303 ?auto_121297 )
      ( MAKE-2PILE ?auto_121295 ?auto_121296 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121304 - BLOCK
      ?auto_121305 - BLOCK
    )
    :vars
    (
      ?auto_121309 - BLOCK
      ?auto_121310 - BLOCK
      ?auto_121307 - BLOCK
      ?auto_121312 - BLOCK
      ?auto_121308 - BLOCK
      ?auto_121311 - BLOCK
      ?auto_121306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121309 ?auto_121305 ) ( ON-TABLE ?auto_121304 ) ( ON ?auto_121305 ?auto_121304 ) ( not ( = ?auto_121304 ?auto_121305 ) ) ( not ( = ?auto_121304 ?auto_121309 ) ) ( not ( = ?auto_121305 ?auto_121309 ) ) ( not ( = ?auto_121304 ?auto_121310 ) ) ( not ( = ?auto_121304 ?auto_121307 ) ) ( not ( = ?auto_121305 ?auto_121310 ) ) ( not ( = ?auto_121305 ?auto_121307 ) ) ( not ( = ?auto_121309 ?auto_121310 ) ) ( not ( = ?auto_121309 ?auto_121307 ) ) ( not ( = ?auto_121310 ?auto_121307 ) ) ( ON ?auto_121310 ?auto_121309 ) ( CLEAR ?auto_121312 ) ( ON-TABLE ?auto_121308 ) ( ON ?auto_121311 ?auto_121308 ) ( ON ?auto_121306 ?auto_121311 ) ( ON ?auto_121312 ?auto_121306 ) ( not ( = ?auto_121308 ?auto_121311 ) ) ( not ( = ?auto_121308 ?auto_121306 ) ) ( not ( = ?auto_121308 ?auto_121312 ) ) ( not ( = ?auto_121308 ?auto_121307 ) ) ( not ( = ?auto_121311 ?auto_121306 ) ) ( not ( = ?auto_121311 ?auto_121312 ) ) ( not ( = ?auto_121311 ?auto_121307 ) ) ( not ( = ?auto_121306 ?auto_121312 ) ) ( not ( = ?auto_121306 ?auto_121307 ) ) ( not ( = ?auto_121312 ?auto_121307 ) ) ( not ( = ?auto_121304 ?auto_121312 ) ) ( not ( = ?auto_121304 ?auto_121308 ) ) ( not ( = ?auto_121304 ?auto_121311 ) ) ( not ( = ?auto_121304 ?auto_121306 ) ) ( not ( = ?auto_121305 ?auto_121312 ) ) ( not ( = ?auto_121305 ?auto_121308 ) ) ( not ( = ?auto_121305 ?auto_121311 ) ) ( not ( = ?auto_121305 ?auto_121306 ) ) ( not ( = ?auto_121309 ?auto_121312 ) ) ( not ( = ?auto_121309 ?auto_121308 ) ) ( not ( = ?auto_121309 ?auto_121311 ) ) ( not ( = ?auto_121309 ?auto_121306 ) ) ( not ( = ?auto_121310 ?auto_121312 ) ) ( not ( = ?auto_121310 ?auto_121308 ) ) ( not ( = ?auto_121310 ?auto_121311 ) ) ( not ( = ?auto_121310 ?auto_121306 ) ) ( ON ?auto_121307 ?auto_121310 ) ( CLEAR ?auto_121307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121304 ?auto_121305 ?auto_121309 ?auto_121310 )
      ( MAKE-2PILE ?auto_121304 ?auto_121305 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121313 - BLOCK
      ?auto_121314 - BLOCK
    )
    :vars
    (
      ?auto_121315 - BLOCK
      ?auto_121321 - BLOCK
      ?auto_121320 - BLOCK
      ?auto_121318 - BLOCK
      ?auto_121317 - BLOCK
      ?auto_121319 - BLOCK
      ?auto_121316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121315 ?auto_121314 ) ( ON-TABLE ?auto_121313 ) ( ON ?auto_121314 ?auto_121313 ) ( not ( = ?auto_121313 ?auto_121314 ) ) ( not ( = ?auto_121313 ?auto_121315 ) ) ( not ( = ?auto_121314 ?auto_121315 ) ) ( not ( = ?auto_121313 ?auto_121321 ) ) ( not ( = ?auto_121313 ?auto_121320 ) ) ( not ( = ?auto_121314 ?auto_121321 ) ) ( not ( = ?auto_121314 ?auto_121320 ) ) ( not ( = ?auto_121315 ?auto_121321 ) ) ( not ( = ?auto_121315 ?auto_121320 ) ) ( not ( = ?auto_121321 ?auto_121320 ) ) ( ON ?auto_121321 ?auto_121315 ) ( ON-TABLE ?auto_121318 ) ( ON ?auto_121317 ?auto_121318 ) ( ON ?auto_121319 ?auto_121317 ) ( not ( = ?auto_121318 ?auto_121317 ) ) ( not ( = ?auto_121318 ?auto_121319 ) ) ( not ( = ?auto_121318 ?auto_121316 ) ) ( not ( = ?auto_121318 ?auto_121320 ) ) ( not ( = ?auto_121317 ?auto_121319 ) ) ( not ( = ?auto_121317 ?auto_121316 ) ) ( not ( = ?auto_121317 ?auto_121320 ) ) ( not ( = ?auto_121319 ?auto_121316 ) ) ( not ( = ?auto_121319 ?auto_121320 ) ) ( not ( = ?auto_121316 ?auto_121320 ) ) ( not ( = ?auto_121313 ?auto_121316 ) ) ( not ( = ?auto_121313 ?auto_121318 ) ) ( not ( = ?auto_121313 ?auto_121317 ) ) ( not ( = ?auto_121313 ?auto_121319 ) ) ( not ( = ?auto_121314 ?auto_121316 ) ) ( not ( = ?auto_121314 ?auto_121318 ) ) ( not ( = ?auto_121314 ?auto_121317 ) ) ( not ( = ?auto_121314 ?auto_121319 ) ) ( not ( = ?auto_121315 ?auto_121316 ) ) ( not ( = ?auto_121315 ?auto_121318 ) ) ( not ( = ?auto_121315 ?auto_121317 ) ) ( not ( = ?auto_121315 ?auto_121319 ) ) ( not ( = ?auto_121321 ?auto_121316 ) ) ( not ( = ?auto_121321 ?auto_121318 ) ) ( not ( = ?auto_121321 ?auto_121317 ) ) ( not ( = ?auto_121321 ?auto_121319 ) ) ( ON ?auto_121320 ?auto_121321 ) ( CLEAR ?auto_121320 ) ( HOLDING ?auto_121316 ) ( CLEAR ?auto_121319 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121318 ?auto_121317 ?auto_121319 ?auto_121316 )
      ( MAKE-2PILE ?auto_121313 ?auto_121314 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121322 - BLOCK
      ?auto_121323 - BLOCK
    )
    :vars
    (
      ?auto_121328 - BLOCK
      ?auto_121326 - BLOCK
      ?auto_121330 - BLOCK
      ?auto_121327 - BLOCK
      ?auto_121329 - BLOCK
      ?auto_121324 - BLOCK
      ?auto_121325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121328 ?auto_121323 ) ( ON-TABLE ?auto_121322 ) ( ON ?auto_121323 ?auto_121322 ) ( not ( = ?auto_121322 ?auto_121323 ) ) ( not ( = ?auto_121322 ?auto_121328 ) ) ( not ( = ?auto_121323 ?auto_121328 ) ) ( not ( = ?auto_121322 ?auto_121326 ) ) ( not ( = ?auto_121322 ?auto_121330 ) ) ( not ( = ?auto_121323 ?auto_121326 ) ) ( not ( = ?auto_121323 ?auto_121330 ) ) ( not ( = ?auto_121328 ?auto_121326 ) ) ( not ( = ?auto_121328 ?auto_121330 ) ) ( not ( = ?auto_121326 ?auto_121330 ) ) ( ON ?auto_121326 ?auto_121328 ) ( ON-TABLE ?auto_121327 ) ( ON ?auto_121329 ?auto_121327 ) ( ON ?auto_121324 ?auto_121329 ) ( not ( = ?auto_121327 ?auto_121329 ) ) ( not ( = ?auto_121327 ?auto_121324 ) ) ( not ( = ?auto_121327 ?auto_121325 ) ) ( not ( = ?auto_121327 ?auto_121330 ) ) ( not ( = ?auto_121329 ?auto_121324 ) ) ( not ( = ?auto_121329 ?auto_121325 ) ) ( not ( = ?auto_121329 ?auto_121330 ) ) ( not ( = ?auto_121324 ?auto_121325 ) ) ( not ( = ?auto_121324 ?auto_121330 ) ) ( not ( = ?auto_121325 ?auto_121330 ) ) ( not ( = ?auto_121322 ?auto_121325 ) ) ( not ( = ?auto_121322 ?auto_121327 ) ) ( not ( = ?auto_121322 ?auto_121329 ) ) ( not ( = ?auto_121322 ?auto_121324 ) ) ( not ( = ?auto_121323 ?auto_121325 ) ) ( not ( = ?auto_121323 ?auto_121327 ) ) ( not ( = ?auto_121323 ?auto_121329 ) ) ( not ( = ?auto_121323 ?auto_121324 ) ) ( not ( = ?auto_121328 ?auto_121325 ) ) ( not ( = ?auto_121328 ?auto_121327 ) ) ( not ( = ?auto_121328 ?auto_121329 ) ) ( not ( = ?auto_121328 ?auto_121324 ) ) ( not ( = ?auto_121326 ?auto_121325 ) ) ( not ( = ?auto_121326 ?auto_121327 ) ) ( not ( = ?auto_121326 ?auto_121329 ) ) ( not ( = ?auto_121326 ?auto_121324 ) ) ( ON ?auto_121330 ?auto_121326 ) ( CLEAR ?auto_121324 ) ( ON ?auto_121325 ?auto_121330 ) ( CLEAR ?auto_121325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121322 ?auto_121323 ?auto_121328 ?auto_121326 ?auto_121330 )
      ( MAKE-2PILE ?auto_121322 ?auto_121323 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121331 - BLOCK
      ?auto_121332 - BLOCK
    )
    :vars
    (
      ?auto_121336 - BLOCK
      ?auto_121338 - BLOCK
      ?auto_121337 - BLOCK
      ?auto_121333 - BLOCK
      ?auto_121339 - BLOCK
      ?auto_121334 - BLOCK
      ?auto_121335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121336 ?auto_121332 ) ( ON-TABLE ?auto_121331 ) ( ON ?auto_121332 ?auto_121331 ) ( not ( = ?auto_121331 ?auto_121332 ) ) ( not ( = ?auto_121331 ?auto_121336 ) ) ( not ( = ?auto_121332 ?auto_121336 ) ) ( not ( = ?auto_121331 ?auto_121338 ) ) ( not ( = ?auto_121331 ?auto_121337 ) ) ( not ( = ?auto_121332 ?auto_121338 ) ) ( not ( = ?auto_121332 ?auto_121337 ) ) ( not ( = ?auto_121336 ?auto_121338 ) ) ( not ( = ?auto_121336 ?auto_121337 ) ) ( not ( = ?auto_121338 ?auto_121337 ) ) ( ON ?auto_121338 ?auto_121336 ) ( ON-TABLE ?auto_121333 ) ( ON ?auto_121339 ?auto_121333 ) ( not ( = ?auto_121333 ?auto_121339 ) ) ( not ( = ?auto_121333 ?auto_121334 ) ) ( not ( = ?auto_121333 ?auto_121335 ) ) ( not ( = ?auto_121333 ?auto_121337 ) ) ( not ( = ?auto_121339 ?auto_121334 ) ) ( not ( = ?auto_121339 ?auto_121335 ) ) ( not ( = ?auto_121339 ?auto_121337 ) ) ( not ( = ?auto_121334 ?auto_121335 ) ) ( not ( = ?auto_121334 ?auto_121337 ) ) ( not ( = ?auto_121335 ?auto_121337 ) ) ( not ( = ?auto_121331 ?auto_121335 ) ) ( not ( = ?auto_121331 ?auto_121333 ) ) ( not ( = ?auto_121331 ?auto_121339 ) ) ( not ( = ?auto_121331 ?auto_121334 ) ) ( not ( = ?auto_121332 ?auto_121335 ) ) ( not ( = ?auto_121332 ?auto_121333 ) ) ( not ( = ?auto_121332 ?auto_121339 ) ) ( not ( = ?auto_121332 ?auto_121334 ) ) ( not ( = ?auto_121336 ?auto_121335 ) ) ( not ( = ?auto_121336 ?auto_121333 ) ) ( not ( = ?auto_121336 ?auto_121339 ) ) ( not ( = ?auto_121336 ?auto_121334 ) ) ( not ( = ?auto_121338 ?auto_121335 ) ) ( not ( = ?auto_121338 ?auto_121333 ) ) ( not ( = ?auto_121338 ?auto_121339 ) ) ( not ( = ?auto_121338 ?auto_121334 ) ) ( ON ?auto_121337 ?auto_121338 ) ( ON ?auto_121335 ?auto_121337 ) ( CLEAR ?auto_121335 ) ( HOLDING ?auto_121334 ) ( CLEAR ?auto_121339 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121333 ?auto_121339 ?auto_121334 )
      ( MAKE-2PILE ?auto_121331 ?auto_121332 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121340 - BLOCK
      ?auto_121341 - BLOCK
    )
    :vars
    (
      ?auto_121348 - BLOCK
      ?auto_121344 - BLOCK
      ?auto_121346 - BLOCK
      ?auto_121347 - BLOCK
      ?auto_121343 - BLOCK
      ?auto_121345 - BLOCK
      ?auto_121342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121348 ?auto_121341 ) ( ON-TABLE ?auto_121340 ) ( ON ?auto_121341 ?auto_121340 ) ( not ( = ?auto_121340 ?auto_121341 ) ) ( not ( = ?auto_121340 ?auto_121348 ) ) ( not ( = ?auto_121341 ?auto_121348 ) ) ( not ( = ?auto_121340 ?auto_121344 ) ) ( not ( = ?auto_121340 ?auto_121346 ) ) ( not ( = ?auto_121341 ?auto_121344 ) ) ( not ( = ?auto_121341 ?auto_121346 ) ) ( not ( = ?auto_121348 ?auto_121344 ) ) ( not ( = ?auto_121348 ?auto_121346 ) ) ( not ( = ?auto_121344 ?auto_121346 ) ) ( ON ?auto_121344 ?auto_121348 ) ( ON-TABLE ?auto_121347 ) ( ON ?auto_121343 ?auto_121347 ) ( not ( = ?auto_121347 ?auto_121343 ) ) ( not ( = ?auto_121347 ?auto_121345 ) ) ( not ( = ?auto_121347 ?auto_121342 ) ) ( not ( = ?auto_121347 ?auto_121346 ) ) ( not ( = ?auto_121343 ?auto_121345 ) ) ( not ( = ?auto_121343 ?auto_121342 ) ) ( not ( = ?auto_121343 ?auto_121346 ) ) ( not ( = ?auto_121345 ?auto_121342 ) ) ( not ( = ?auto_121345 ?auto_121346 ) ) ( not ( = ?auto_121342 ?auto_121346 ) ) ( not ( = ?auto_121340 ?auto_121342 ) ) ( not ( = ?auto_121340 ?auto_121347 ) ) ( not ( = ?auto_121340 ?auto_121343 ) ) ( not ( = ?auto_121340 ?auto_121345 ) ) ( not ( = ?auto_121341 ?auto_121342 ) ) ( not ( = ?auto_121341 ?auto_121347 ) ) ( not ( = ?auto_121341 ?auto_121343 ) ) ( not ( = ?auto_121341 ?auto_121345 ) ) ( not ( = ?auto_121348 ?auto_121342 ) ) ( not ( = ?auto_121348 ?auto_121347 ) ) ( not ( = ?auto_121348 ?auto_121343 ) ) ( not ( = ?auto_121348 ?auto_121345 ) ) ( not ( = ?auto_121344 ?auto_121342 ) ) ( not ( = ?auto_121344 ?auto_121347 ) ) ( not ( = ?auto_121344 ?auto_121343 ) ) ( not ( = ?auto_121344 ?auto_121345 ) ) ( ON ?auto_121346 ?auto_121344 ) ( ON ?auto_121342 ?auto_121346 ) ( CLEAR ?auto_121343 ) ( ON ?auto_121345 ?auto_121342 ) ( CLEAR ?auto_121345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121340 ?auto_121341 ?auto_121348 ?auto_121344 ?auto_121346 ?auto_121342 )
      ( MAKE-2PILE ?auto_121340 ?auto_121341 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121349 - BLOCK
      ?auto_121350 - BLOCK
    )
    :vars
    (
      ?auto_121355 - BLOCK
      ?auto_121353 - BLOCK
      ?auto_121354 - BLOCK
      ?auto_121352 - BLOCK
      ?auto_121356 - BLOCK
      ?auto_121351 - BLOCK
      ?auto_121357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121355 ?auto_121350 ) ( ON-TABLE ?auto_121349 ) ( ON ?auto_121350 ?auto_121349 ) ( not ( = ?auto_121349 ?auto_121350 ) ) ( not ( = ?auto_121349 ?auto_121355 ) ) ( not ( = ?auto_121350 ?auto_121355 ) ) ( not ( = ?auto_121349 ?auto_121353 ) ) ( not ( = ?auto_121349 ?auto_121354 ) ) ( not ( = ?auto_121350 ?auto_121353 ) ) ( not ( = ?auto_121350 ?auto_121354 ) ) ( not ( = ?auto_121355 ?auto_121353 ) ) ( not ( = ?auto_121355 ?auto_121354 ) ) ( not ( = ?auto_121353 ?auto_121354 ) ) ( ON ?auto_121353 ?auto_121355 ) ( ON-TABLE ?auto_121352 ) ( not ( = ?auto_121352 ?auto_121356 ) ) ( not ( = ?auto_121352 ?auto_121351 ) ) ( not ( = ?auto_121352 ?auto_121357 ) ) ( not ( = ?auto_121352 ?auto_121354 ) ) ( not ( = ?auto_121356 ?auto_121351 ) ) ( not ( = ?auto_121356 ?auto_121357 ) ) ( not ( = ?auto_121356 ?auto_121354 ) ) ( not ( = ?auto_121351 ?auto_121357 ) ) ( not ( = ?auto_121351 ?auto_121354 ) ) ( not ( = ?auto_121357 ?auto_121354 ) ) ( not ( = ?auto_121349 ?auto_121357 ) ) ( not ( = ?auto_121349 ?auto_121352 ) ) ( not ( = ?auto_121349 ?auto_121356 ) ) ( not ( = ?auto_121349 ?auto_121351 ) ) ( not ( = ?auto_121350 ?auto_121357 ) ) ( not ( = ?auto_121350 ?auto_121352 ) ) ( not ( = ?auto_121350 ?auto_121356 ) ) ( not ( = ?auto_121350 ?auto_121351 ) ) ( not ( = ?auto_121355 ?auto_121357 ) ) ( not ( = ?auto_121355 ?auto_121352 ) ) ( not ( = ?auto_121355 ?auto_121356 ) ) ( not ( = ?auto_121355 ?auto_121351 ) ) ( not ( = ?auto_121353 ?auto_121357 ) ) ( not ( = ?auto_121353 ?auto_121352 ) ) ( not ( = ?auto_121353 ?auto_121356 ) ) ( not ( = ?auto_121353 ?auto_121351 ) ) ( ON ?auto_121354 ?auto_121353 ) ( ON ?auto_121357 ?auto_121354 ) ( ON ?auto_121351 ?auto_121357 ) ( CLEAR ?auto_121351 ) ( HOLDING ?auto_121356 ) ( CLEAR ?auto_121352 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121352 ?auto_121356 )
      ( MAKE-2PILE ?auto_121349 ?auto_121350 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123376 - BLOCK
      ?auto_123377 - BLOCK
    )
    :vars
    (
      ?auto_123382 - BLOCK
      ?auto_123381 - BLOCK
      ?auto_123380 - BLOCK
      ?auto_123378 - BLOCK
      ?auto_123383 - BLOCK
      ?auto_123379 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123382 ?auto_123377 ) ( ON-TABLE ?auto_123376 ) ( ON ?auto_123377 ?auto_123376 ) ( not ( = ?auto_123376 ?auto_123377 ) ) ( not ( = ?auto_123376 ?auto_123382 ) ) ( not ( = ?auto_123377 ?auto_123382 ) ) ( not ( = ?auto_123376 ?auto_123381 ) ) ( not ( = ?auto_123376 ?auto_123380 ) ) ( not ( = ?auto_123377 ?auto_123381 ) ) ( not ( = ?auto_123377 ?auto_123380 ) ) ( not ( = ?auto_123382 ?auto_123381 ) ) ( not ( = ?auto_123382 ?auto_123380 ) ) ( not ( = ?auto_123381 ?auto_123380 ) ) ( ON ?auto_123381 ?auto_123382 ) ( not ( = ?auto_123378 ?auto_123383 ) ) ( not ( = ?auto_123378 ?auto_123379 ) ) ( not ( = ?auto_123378 ?auto_123380 ) ) ( not ( = ?auto_123383 ?auto_123379 ) ) ( not ( = ?auto_123383 ?auto_123380 ) ) ( not ( = ?auto_123379 ?auto_123380 ) ) ( not ( = ?auto_123376 ?auto_123379 ) ) ( not ( = ?auto_123376 ?auto_123378 ) ) ( not ( = ?auto_123376 ?auto_123383 ) ) ( not ( = ?auto_123377 ?auto_123379 ) ) ( not ( = ?auto_123377 ?auto_123378 ) ) ( not ( = ?auto_123377 ?auto_123383 ) ) ( not ( = ?auto_123382 ?auto_123379 ) ) ( not ( = ?auto_123382 ?auto_123378 ) ) ( not ( = ?auto_123382 ?auto_123383 ) ) ( not ( = ?auto_123381 ?auto_123379 ) ) ( not ( = ?auto_123381 ?auto_123378 ) ) ( not ( = ?auto_123381 ?auto_123383 ) ) ( ON ?auto_123380 ?auto_123381 ) ( ON ?auto_123379 ?auto_123380 ) ( ON ?auto_123383 ?auto_123379 ) ( ON ?auto_123378 ?auto_123383 ) ( CLEAR ?auto_123378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123376 ?auto_123377 ?auto_123382 ?auto_123381 ?auto_123380 ?auto_123379 ?auto_123383 )
      ( MAKE-2PILE ?auto_123376 ?auto_123377 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121367 - BLOCK
      ?auto_121368 - BLOCK
    )
    :vars
    (
      ?auto_121369 - BLOCK
      ?auto_121374 - BLOCK
      ?auto_121372 - BLOCK
      ?auto_121371 - BLOCK
      ?auto_121375 - BLOCK
      ?auto_121373 - BLOCK
      ?auto_121370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121369 ?auto_121368 ) ( ON-TABLE ?auto_121367 ) ( ON ?auto_121368 ?auto_121367 ) ( not ( = ?auto_121367 ?auto_121368 ) ) ( not ( = ?auto_121367 ?auto_121369 ) ) ( not ( = ?auto_121368 ?auto_121369 ) ) ( not ( = ?auto_121367 ?auto_121374 ) ) ( not ( = ?auto_121367 ?auto_121372 ) ) ( not ( = ?auto_121368 ?auto_121374 ) ) ( not ( = ?auto_121368 ?auto_121372 ) ) ( not ( = ?auto_121369 ?auto_121374 ) ) ( not ( = ?auto_121369 ?auto_121372 ) ) ( not ( = ?auto_121374 ?auto_121372 ) ) ( ON ?auto_121374 ?auto_121369 ) ( not ( = ?auto_121371 ?auto_121375 ) ) ( not ( = ?auto_121371 ?auto_121373 ) ) ( not ( = ?auto_121371 ?auto_121370 ) ) ( not ( = ?auto_121371 ?auto_121372 ) ) ( not ( = ?auto_121375 ?auto_121373 ) ) ( not ( = ?auto_121375 ?auto_121370 ) ) ( not ( = ?auto_121375 ?auto_121372 ) ) ( not ( = ?auto_121373 ?auto_121370 ) ) ( not ( = ?auto_121373 ?auto_121372 ) ) ( not ( = ?auto_121370 ?auto_121372 ) ) ( not ( = ?auto_121367 ?auto_121370 ) ) ( not ( = ?auto_121367 ?auto_121371 ) ) ( not ( = ?auto_121367 ?auto_121375 ) ) ( not ( = ?auto_121367 ?auto_121373 ) ) ( not ( = ?auto_121368 ?auto_121370 ) ) ( not ( = ?auto_121368 ?auto_121371 ) ) ( not ( = ?auto_121368 ?auto_121375 ) ) ( not ( = ?auto_121368 ?auto_121373 ) ) ( not ( = ?auto_121369 ?auto_121370 ) ) ( not ( = ?auto_121369 ?auto_121371 ) ) ( not ( = ?auto_121369 ?auto_121375 ) ) ( not ( = ?auto_121369 ?auto_121373 ) ) ( not ( = ?auto_121374 ?auto_121370 ) ) ( not ( = ?auto_121374 ?auto_121371 ) ) ( not ( = ?auto_121374 ?auto_121375 ) ) ( not ( = ?auto_121374 ?auto_121373 ) ) ( ON ?auto_121372 ?auto_121374 ) ( ON ?auto_121370 ?auto_121372 ) ( ON ?auto_121373 ?auto_121370 ) ( ON ?auto_121375 ?auto_121373 ) ( CLEAR ?auto_121375 ) ( HOLDING ?auto_121371 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121371 )
      ( MAKE-2PILE ?auto_121367 ?auto_121368 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121376 - BLOCK
      ?auto_121377 - BLOCK
    )
    :vars
    (
      ?auto_121380 - BLOCK
      ?auto_121379 - BLOCK
      ?auto_121378 - BLOCK
      ?auto_121383 - BLOCK
      ?auto_121381 - BLOCK
      ?auto_121384 - BLOCK
      ?auto_121382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121380 ?auto_121377 ) ( ON-TABLE ?auto_121376 ) ( ON ?auto_121377 ?auto_121376 ) ( not ( = ?auto_121376 ?auto_121377 ) ) ( not ( = ?auto_121376 ?auto_121380 ) ) ( not ( = ?auto_121377 ?auto_121380 ) ) ( not ( = ?auto_121376 ?auto_121379 ) ) ( not ( = ?auto_121376 ?auto_121378 ) ) ( not ( = ?auto_121377 ?auto_121379 ) ) ( not ( = ?auto_121377 ?auto_121378 ) ) ( not ( = ?auto_121380 ?auto_121379 ) ) ( not ( = ?auto_121380 ?auto_121378 ) ) ( not ( = ?auto_121379 ?auto_121378 ) ) ( ON ?auto_121379 ?auto_121380 ) ( not ( = ?auto_121383 ?auto_121381 ) ) ( not ( = ?auto_121383 ?auto_121384 ) ) ( not ( = ?auto_121383 ?auto_121382 ) ) ( not ( = ?auto_121383 ?auto_121378 ) ) ( not ( = ?auto_121381 ?auto_121384 ) ) ( not ( = ?auto_121381 ?auto_121382 ) ) ( not ( = ?auto_121381 ?auto_121378 ) ) ( not ( = ?auto_121384 ?auto_121382 ) ) ( not ( = ?auto_121384 ?auto_121378 ) ) ( not ( = ?auto_121382 ?auto_121378 ) ) ( not ( = ?auto_121376 ?auto_121382 ) ) ( not ( = ?auto_121376 ?auto_121383 ) ) ( not ( = ?auto_121376 ?auto_121381 ) ) ( not ( = ?auto_121376 ?auto_121384 ) ) ( not ( = ?auto_121377 ?auto_121382 ) ) ( not ( = ?auto_121377 ?auto_121383 ) ) ( not ( = ?auto_121377 ?auto_121381 ) ) ( not ( = ?auto_121377 ?auto_121384 ) ) ( not ( = ?auto_121380 ?auto_121382 ) ) ( not ( = ?auto_121380 ?auto_121383 ) ) ( not ( = ?auto_121380 ?auto_121381 ) ) ( not ( = ?auto_121380 ?auto_121384 ) ) ( not ( = ?auto_121379 ?auto_121382 ) ) ( not ( = ?auto_121379 ?auto_121383 ) ) ( not ( = ?auto_121379 ?auto_121381 ) ) ( not ( = ?auto_121379 ?auto_121384 ) ) ( ON ?auto_121378 ?auto_121379 ) ( ON ?auto_121382 ?auto_121378 ) ( ON ?auto_121384 ?auto_121382 ) ( ON ?auto_121381 ?auto_121384 ) ( ON ?auto_121383 ?auto_121381 ) ( CLEAR ?auto_121383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_121376 ?auto_121377 ?auto_121380 ?auto_121379 ?auto_121378 ?auto_121382 ?auto_121384 ?auto_121381 )
      ( MAKE-2PILE ?auto_121376 ?auto_121377 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121392 - BLOCK
      ?auto_121393 - BLOCK
      ?auto_121394 - BLOCK
      ?auto_121395 - BLOCK
      ?auto_121396 - BLOCK
      ?auto_121397 - BLOCK
      ?auto_121398 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_121398 ) ( CLEAR ?auto_121397 ) ( ON-TABLE ?auto_121392 ) ( ON ?auto_121393 ?auto_121392 ) ( ON ?auto_121394 ?auto_121393 ) ( ON ?auto_121395 ?auto_121394 ) ( ON ?auto_121396 ?auto_121395 ) ( ON ?auto_121397 ?auto_121396 ) ( not ( = ?auto_121392 ?auto_121393 ) ) ( not ( = ?auto_121392 ?auto_121394 ) ) ( not ( = ?auto_121392 ?auto_121395 ) ) ( not ( = ?auto_121392 ?auto_121396 ) ) ( not ( = ?auto_121392 ?auto_121397 ) ) ( not ( = ?auto_121392 ?auto_121398 ) ) ( not ( = ?auto_121393 ?auto_121394 ) ) ( not ( = ?auto_121393 ?auto_121395 ) ) ( not ( = ?auto_121393 ?auto_121396 ) ) ( not ( = ?auto_121393 ?auto_121397 ) ) ( not ( = ?auto_121393 ?auto_121398 ) ) ( not ( = ?auto_121394 ?auto_121395 ) ) ( not ( = ?auto_121394 ?auto_121396 ) ) ( not ( = ?auto_121394 ?auto_121397 ) ) ( not ( = ?auto_121394 ?auto_121398 ) ) ( not ( = ?auto_121395 ?auto_121396 ) ) ( not ( = ?auto_121395 ?auto_121397 ) ) ( not ( = ?auto_121395 ?auto_121398 ) ) ( not ( = ?auto_121396 ?auto_121397 ) ) ( not ( = ?auto_121396 ?auto_121398 ) ) ( not ( = ?auto_121397 ?auto_121398 ) ) )
    :subtasks
    ( ( !STACK ?auto_121398 ?auto_121397 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121399 - BLOCK
      ?auto_121400 - BLOCK
      ?auto_121401 - BLOCK
      ?auto_121402 - BLOCK
      ?auto_121403 - BLOCK
      ?auto_121404 - BLOCK
      ?auto_121405 - BLOCK
    )
    :vars
    (
      ?auto_121406 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_121404 ) ( ON-TABLE ?auto_121399 ) ( ON ?auto_121400 ?auto_121399 ) ( ON ?auto_121401 ?auto_121400 ) ( ON ?auto_121402 ?auto_121401 ) ( ON ?auto_121403 ?auto_121402 ) ( ON ?auto_121404 ?auto_121403 ) ( not ( = ?auto_121399 ?auto_121400 ) ) ( not ( = ?auto_121399 ?auto_121401 ) ) ( not ( = ?auto_121399 ?auto_121402 ) ) ( not ( = ?auto_121399 ?auto_121403 ) ) ( not ( = ?auto_121399 ?auto_121404 ) ) ( not ( = ?auto_121399 ?auto_121405 ) ) ( not ( = ?auto_121400 ?auto_121401 ) ) ( not ( = ?auto_121400 ?auto_121402 ) ) ( not ( = ?auto_121400 ?auto_121403 ) ) ( not ( = ?auto_121400 ?auto_121404 ) ) ( not ( = ?auto_121400 ?auto_121405 ) ) ( not ( = ?auto_121401 ?auto_121402 ) ) ( not ( = ?auto_121401 ?auto_121403 ) ) ( not ( = ?auto_121401 ?auto_121404 ) ) ( not ( = ?auto_121401 ?auto_121405 ) ) ( not ( = ?auto_121402 ?auto_121403 ) ) ( not ( = ?auto_121402 ?auto_121404 ) ) ( not ( = ?auto_121402 ?auto_121405 ) ) ( not ( = ?auto_121403 ?auto_121404 ) ) ( not ( = ?auto_121403 ?auto_121405 ) ) ( not ( = ?auto_121404 ?auto_121405 ) ) ( ON ?auto_121405 ?auto_121406 ) ( CLEAR ?auto_121405 ) ( HAND-EMPTY ) ( not ( = ?auto_121399 ?auto_121406 ) ) ( not ( = ?auto_121400 ?auto_121406 ) ) ( not ( = ?auto_121401 ?auto_121406 ) ) ( not ( = ?auto_121402 ?auto_121406 ) ) ( not ( = ?auto_121403 ?auto_121406 ) ) ( not ( = ?auto_121404 ?auto_121406 ) ) ( not ( = ?auto_121405 ?auto_121406 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121405 ?auto_121406 )
      ( MAKE-7PILE ?auto_121399 ?auto_121400 ?auto_121401 ?auto_121402 ?auto_121403 ?auto_121404 ?auto_121405 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121407 - BLOCK
      ?auto_121408 - BLOCK
      ?auto_121409 - BLOCK
      ?auto_121410 - BLOCK
      ?auto_121411 - BLOCK
      ?auto_121412 - BLOCK
      ?auto_121413 - BLOCK
    )
    :vars
    (
      ?auto_121414 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121407 ) ( ON ?auto_121408 ?auto_121407 ) ( ON ?auto_121409 ?auto_121408 ) ( ON ?auto_121410 ?auto_121409 ) ( ON ?auto_121411 ?auto_121410 ) ( not ( = ?auto_121407 ?auto_121408 ) ) ( not ( = ?auto_121407 ?auto_121409 ) ) ( not ( = ?auto_121407 ?auto_121410 ) ) ( not ( = ?auto_121407 ?auto_121411 ) ) ( not ( = ?auto_121407 ?auto_121412 ) ) ( not ( = ?auto_121407 ?auto_121413 ) ) ( not ( = ?auto_121408 ?auto_121409 ) ) ( not ( = ?auto_121408 ?auto_121410 ) ) ( not ( = ?auto_121408 ?auto_121411 ) ) ( not ( = ?auto_121408 ?auto_121412 ) ) ( not ( = ?auto_121408 ?auto_121413 ) ) ( not ( = ?auto_121409 ?auto_121410 ) ) ( not ( = ?auto_121409 ?auto_121411 ) ) ( not ( = ?auto_121409 ?auto_121412 ) ) ( not ( = ?auto_121409 ?auto_121413 ) ) ( not ( = ?auto_121410 ?auto_121411 ) ) ( not ( = ?auto_121410 ?auto_121412 ) ) ( not ( = ?auto_121410 ?auto_121413 ) ) ( not ( = ?auto_121411 ?auto_121412 ) ) ( not ( = ?auto_121411 ?auto_121413 ) ) ( not ( = ?auto_121412 ?auto_121413 ) ) ( ON ?auto_121413 ?auto_121414 ) ( CLEAR ?auto_121413 ) ( not ( = ?auto_121407 ?auto_121414 ) ) ( not ( = ?auto_121408 ?auto_121414 ) ) ( not ( = ?auto_121409 ?auto_121414 ) ) ( not ( = ?auto_121410 ?auto_121414 ) ) ( not ( = ?auto_121411 ?auto_121414 ) ) ( not ( = ?auto_121412 ?auto_121414 ) ) ( not ( = ?auto_121413 ?auto_121414 ) ) ( HOLDING ?auto_121412 ) ( CLEAR ?auto_121411 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121407 ?auto_121408 ?auto_121409 ?auto_121410 ?auto_121411 ?auto_121412 )
      ( MAKE-7PILE ?auto_121407 ?auto_121408 ?auto_121409 ?auto_121410 ?auto_121411 ?auto_121412 ?auto_121413 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121415 - BLOCK
      ?auto_121416 - BLOCK
      ?auto_121417 - BLOCK
      ?auto_121418 - BLOCK
      ?auto_121419 - BLOCK
      ?auto_121420 - BLOCK
      ?auto_121421 - BLOCK
    )
    :vars
    (
      ?auto_121422 - BLOCK
      ?auto_121423 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121415 ) ( ON ?auto_121416 ?auto_121415 ) ( ON ?auto_121417 ?auto_121416 ) ( ON ?auto_121418 ?auto_121417 ) ( ON ?auto_121419 ?auto_121418 ) ( not ( = ?auto_121415 ?auto_121416 ) ) ( not ( = ?auto_121415 ?auto_121417 ) ) ( not ( = ?auto_121415 ?auto_121418 ) ) ( not ( = ?auto_121415 ?auto_121419 ) ) ( not ( = ?auto_121415 ?auto_121420 ) ) ( not ( = ?auto_121415 ?auto_121421 ) ) ( not ( = ?auto_121416 ?auto_121417 ) ) ( not ( = ?auto_121416 ?auto_121418 ) ) ( not ( = ?auto_121416 ?auto_121419 ) ) ( not ( = ?auto_121416 ?auto_121420 ) ) ( not ( = ?auto_121416 ?auto_121421 ) ) ( not ( = ?auto_121417 ?auto_121418 ) ) ( not ( = ?auto_121417 ?auto_121419 ) ) ( not ( = ?auto_121417 ?auto_121420 ) ) ( not ( = ?auto_121417 ?auto_121421 ) ) ( not ( = ?auto_121418 ?auto_121419 ) ) ( not ( = ?auto_121418 ?auto_121420 ) ) ( not ( = ?auto_121418 ?auto_121421 ) ) ( not ( = ?auto_121419 ?auto_121420 ) ) ( not ( = ?auto_121419 ?auto_121421 ) ) ( not ( = ?auto_121420 ?auto_121421 ) ) ( ON ?auto_121421 ?auto_121422 ) ( not ( = ?auto_121415 ?auto_121422 ) ) ( not ( = ?auto_121416 ?auto_121422 ) ) ( not ( = ?auto_121417 ?auto_121422 ) ) ( not ( = ?auto_121418 ?auto_121422 ) ) ( not ( = ?auto_121419 ?auto_121422 ) ) ( not ( = ?auto_121420 ?auto_121422 ) ) ( not ( = ?auto_121421 ?auto_121422 ) ) ( CLEAR ?auto_121419 ) ( ON ?auto_121420 ?auto_121421 ) ( CLEAR ?auto_121420 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121423 ) ( ON ?auto_121422 ?auto_121423 ) ( not ( = ?auto_121423 ?auto_121422 ) ) ( not ( = ?auto_121423 ?auto_121421 ) ) ( not ( = ?auto_121423 ?auto_121420 ) ) ( not ( = ?auto_121415 ?auto_121423 ) ) ( not ( = ?auto_121416 ?auto_121423 ) ) ( not ( = ?auto_121417 ?auto_121423 ) ) ( not ( = ?auto_121418 ?auto_121423 ) ) ( not ( = ?auto_121419 ?auto_121423 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121423 ?auto_121422 ?auto_121421 )
      ( MAKE-7PILE ?auto_121415 ?auto_121416 ?auto_121417 ?auto_121418 ?auto_121419 ?auto_121420 ?auto_121421 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121424 - BLOCK
      ?auto_121425 - BLOCK
      ?auto_121426 - BLOCK
      ?auto_121427 - BLOCK
      ?auto_121428 - BLOCK
      ?auto_121429 - BLOCK
      ?auto_121430 - BLOCK
    )
    :vars
    (
      ?auto_121431 - BLOCK
      ?auto_121432 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121424 ) ( ON ?auto_121425 ?auto_121424 ) ( ON ?auto_121426 ?auto_121425 ) ( ON ?auto_121427 ?auto_121426 ) ( not ( = ?auto_121424 ?auto_121425 ) ) ( not ( = ?auto_121424 ?auto_121426 ) ) ( not ( = ?auto_121424 ?auto_121427 ) ) ( not ( = ?auto_121424 ?auto_121428 ) ) ( not ( = ?auto_121424 ?auto_121429 ) ) ( not ( = ?auto_121424 ?auto_121430 ) ) ( not ( = ?auto_121425 ?auto_121426 ) ) ( not ( = ?auto_121425 ?auto_121427 ) ) ( not ( = ?auto_121425 ?auto_121428 ) ) ( not ( = ?auto_121425 ?auto_121429 ) ) ( not ( = ?auto_121425 ?auto_121430 ) ) ( not ( = ?auto_121426 ?auto_121427 ) ) ( not ( = ?auto_121426 ?auto_121428 ) ) ( not ( = ?auto_121426 ?auto_121429 ) ) ( not ( = ?auto_121426 ?auto_121430 ) ) ( not ( = ?auto_121427 ?auto_121428 ) ) ( not ( = ?auto_121427 ?auto_121429 ) ) ( not ( = ?auto_121427 ?auto_121430 ) ) ( not ( = ?auto_121428 ?auto_121429 ) ) ( not ( = ?auto_121428 ?auto_121430 ) ) ( not ( = ?auto_121429 ?auto_121430 ) ) ( ON ?auto_121430 ?auto_121431 ) ( not ( = ?auto_121424 ?auto_121431 ) ) ( not ( = ?auto_121425 ?auto_121431 ) ) ( not ( = ?auto_121426 ?auto_121431 ) ) ( not ( = ?auto_121427 ?auto_121431 ) ) ( not ( = ?auto_121428 ?auto_121431 ) ) ( not ( = ?auto_121429 ?auto_121431 ) ) ( not ( = ?auto_121430 ?auto_121431 ) ) ( ON ?auto_121429 ?auto_121430 ) ( CLEAR ?auto_121429 ) ( ON-TABLE ?auto_121432 ) ( ON ?auto_121431 ?auto_121432 ) ( not ( = ?auto_121432 ?auto_121431 ) ) ( not ( = ?auto_121432 ?auto_121430 ) ) ( not ( = ?auto_121432 ?auto_121429 ) ) ( not ( = ?auto_121424 ?auto_121432 ) ) ( not ( = ?auto_121425 ?auto_121432 ) ) ( not ( = ?auto_121426 ?auto_121432 ) ) ( not ( = ?auto_121427 ?auto_121432 ) ) ( not ( = ?auto_121428 ?auto_121432 ) ) ( HOLDING ?auto_121428 ) ( CLEAR ?auto_121427 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121424 ?auto_121425 ?auto_121426 ?auto_121427 ?auto_121428 )
      ( MAKE-7PILE ?auto_121424 ?auto_121425 ?auto_121426 ?auto_121427 ?auto_121428 ?auto_121429 ?auto_121430 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121433 - BLOCK
      ?auto_121434 - BLOCK
      ?auto_121435 - BLOCK
      ?auto_121436 - BLOCK
      ?auto_121437 - BLOCK
      ?auto_121438 - BLOCK
      ?auto_121439 - BLOCK
    )
    :vars
    (
      ?auto_121440 - BLOCK
      ?auto_121441 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121433 ) ( ON ?auto_121434 ?auto_121433 ) ( ON ?auto_121435 ?auto_121434 ) ( ON ?auto_121436 ?auto_121435 ) ( not ( = ?auto_121433 ?auto_121434 ) ) ( not ( = ?auto_121433 ?auto_121435 ) ) ( not ( = ?auto_121433 ?auto_121436 ) ) ( not ( = ?auto_121433 ?auto_121437 ) ) ( not ( = ?auto_121433 ?auto_121438 ) ) ( not ( = ?auto_121433 ?auto_121439 ) ) ( not ( = ?auto_121434 ?auto_121435 ) ) ( not ( = ?auto_121434 ?auto_121436 ) ) ( not ( = ?auto_121434 ?auto_121437 ) ) ( not ( = ?auto_121434 ?auto_121438 ) ) ( not ( = ?auto_121434 ?auto_121439 ) ) ( not ( = ?auto_121435 ?auto_121436 ) ) ( not ( = ?auto_121435 ?auto_121437 ) ) ( not ( = ?auto_121435 ?auto_121438 ) ) ( not ( = ?auto_121435 ?auto_121439 ) ) ( not ( = ?auto_121436 ?auto_121437 ) ) ( not ( = ?auto_121436 ?auto_121438 ) ) ( not ( = ?auto_121436 ?auto_121439 ) ) ( not ( = ?auto_121437 ?auto_121438 ) ) ( not ( = ?auto_121437 ?auto_121439 ) ) ( not ( = ?auto_121438 ?auto_121439 ) ) ( ON ?auto_121439 ?auto_121440 ) ( not ( = ?auto_121433 ?auto_121440 ) ) ( not ( = ?auto_121434 ?auto_121440 ) ) ( not ( = ?auto_121435 ?auto_121440 ) ) ( not ( = ?auto_121436 ?auto_121440 ) ) ( not ( = ?auto_121437 ?auto_121440 ) ) ( not ( = ?auto_121438 ?auto_121440 ) ) ( not ( = ?auto_121439 ?auto_121440 ) ) ( ON ?auto_121438 ?auto_121439 ) ( ON-TABLE ?auto_121441 ) ( ON ?auto_121440 ?auto_121441 ) ( not ( = ?auto_121441 ?auto_121440 ) ) ( not ( = ?auto_121441 ?auto_121439 ) ) ( not ( = ?auto_121441 ?auto_121438 ) ) ( not ( = ?auto_121433 ?auto_121441 ) ) ( not ( = ?auto_121434 ?auto_121441 ) ) ( not ( = ?auto_121435 ?auto_121441 ) ) ( not ( = ?auto_121436 ?auto_121441 ) ) ( not ( = ?auto_121437 ?auto_121441 ) ) ( CLEAR ?auto_121436 ) ( ON ?auto_121437 ?auto_121438 ) ( CLEAR ?auto_121437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121441 ?auto_121440 ?auto_121439 ?auto_121438 )
      ( MAKE-7PILE ?auto_121433 ?auto_121434 ?auto_121435 ?auto_121436 ?auto_121437 ?auto_121438 ?auto_121439 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121442 - BLOCK
      ?auto_121443 - BLOCK
      ?auto_121444 - BLOCK
      ?auto_121445 - BLOCK
      ?auto_121446 - BLOCK
      ?auto_121447 - BLOCK
      ?auto_121448 - BLOCK
    )
    :vars
    (
      ?auto_121450 - BLOCK
      ?auto_121449 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121442 ) ( ON ?auto_121443 ?auto_121442 ) ( ON ?auto_121444 ?auto_121443 ) ( not ( = ?auto_121442 ?auto_121443 ) ) ( not ( = ?auto_121442 ?auto_121444 ) ) ( not ( = ?auto_121442 ?auto_121445 ) ) ( not ( = ?auto_121442 ?auto_121446 ) ) ( not ( = ?auto_121442 ?auto_121447 ) ) ( not ( = ?auto_121442 ?auto_121448 ) ) ( not ( = ?auto_121443 ?auto_121444 ) ) ( not ( = ?auto_121443 ?auto_121445 ) ) ( not ( = ?auto_121443 ?auto_121446 ) ) ( not ( = ?auto_121443 ?auto_121447 ) ) ( not ( = ?auto_121443 ?auto_121448 ) ) ( not ( = ?auto_121444 ?auto_121445 ) ) ( not ( = ?auto_121444 ?auto_121446 ) ) ( not ( = ?auto_121444 ?auto_121447 ) ) ( not ( = ?auto_121444 ?auto_121448 ) ) ( not ( = ?auto_121445 ?auto_121446 ) ) ( not ( = ?auto_121445 ?auto_121447 ) ) ( not ( = ?auto_121445 ?auto_121448 ) ) ( not ( = ?auto_121446 ?auto_121447 ) ) ( not ( = ?auto_121446 ?auto_121448 ) ) ( not ( = ?auto_121447 ?auto_121448 ) ) ( ON ?auto_121448 ?auto_121450 ) ( not ( = ?auto_121442 ?auto_121450 ) ) ( not ( = ?auto_121443 ?auto_121450 ) ) ( not ( = ?auto_121444 ?auto_121450 ) ) ( not ( = ?auto_121445 ?auto_121450 ) ) ( not ( = ?auto_121446 ?auto_121450 ) ) ( not ( = ?auto_121447 ?auto_121450 ) ) ( not ( = ?auto_121448 ?auto_121450 ) ) ( ON ?auto_121447 ?auto_121448 ) ( ON-TABLE ?auto_121449 ) ( ON ?auto_121450 ?auto_121449 ) ( not ( = ?auto_121449 ?auto_121450 ) ) ( not ( = ?auto_121449 ?auto_121448 ) ) ( not ( = ?auto_121449 ?auto_121447 ) ) ( not ( = ?auto_121442 ?auto_121449 ) ) ( not ( = ?auto_121443 ?auto_121449 ) ) ( not ( = ?auto_121444 ?auto_121449 ) ) ( not ( = ?auto_121445 ?auto_121449 ) ) ( not ( = ?auto_121446 ?auto_121449 ) ) ( ON ?auto_121446 ?auto_121447 ) ( CLEAR ?auto_121446 ) ( HOLDING ?auto_121445 ) ( CLEAR ?auto_121444 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121442 ?auto_121443 ?auto_121444 ?auto_121445 )
      ( MAKE-7PILE ?auto_121442 ?auto_121443 ?auto_121444 ?auto_121445 ?auto_121446 ?auto_121447 ?auto_121448 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121451 - BLOCK
      ?auto_121452 - BLOCK
      ?auto_121453 - BLOCK
      ?auto_121454 - BLOCK
      ?auto_121455 - BLOCK
      ?auto_121456 - BLOCK
      ?auto_121457 - BLOCK
    )
    :vars
    (
      ?auto_121459 - BLOCK
      ?auto_121458 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121451 ) ( ON ?auto_121452 ?auto_121451 ) ( ON ?auto_121453 ?auto_121452 ) ( not ( = ?auto_121451 ?auto_121452 ) ) ( not ( = ?auto_121451 ?auto_121453 ) ) ( not ( = ?auto_121451 ?auto_121454 ) ) ( not ( = ?auto_121451 ?auto_121455 ) ) ( not ( = ?auto_121451 ?auto_121456 ) ) ( not ( = ?auto_121451 ?auto_121457 ) ) ( not ( = ?auto_121452 ?auto_121453 ) ) ( not ( = ?auto_121452 ?auto_121454 ) ) ( not ( = ?auto_121452 ?auto_121455 ) ) ( not ( = ?auto_121452 ?auto_121456 ) ) ( not ( = ?auto_121452 ?auto_121457 ) ) ( not ( = ?auto_121453 ?auto_121454 ) ) ( not ( = ?auto_121453 ?auto_121455 ) ) ( not ( = ?auto_121453 ?auto_121456 ) ) ( not ( = ?auto_121453 ?auto_121457 ) ) ( not ( = ?auto_121454 ?auto_121455 ) ) ( not ( = ?auto_121454 ?auto_121456 ) ) ( not ( = ?auto_121454 ?auto_121457 ) ) ( not ( = ?auto_121455 ?auto_121456 ) ) ( not ( = ?auto_121455 ?auto_121457 ) ) ( not ( = ?auto_121456 ?auto_121457 ) ) ( ON ?auto_121457 ?auto_121459 ) ( not ( = ?auto_121451 ?auto_121459 ) ) ( not ( = ?auto_121452 ?auto_121459 ) ) ( not ( = ?auto_121453 ?auto_121459 ) ) ( not ( = ?auto_121454 ?auto_121459 ) ) ( not ( = ?auto_121455 ?auto_121459 ) ) ( not ( = ?auto_121456 ?auto_121459 ) ) ( not ( = ?auto_121457 ?auto_121459 ) ) ( ON ?auto_121456 ?auto_121457 ) ( ON-TABLE ?auto_121458 ) ( ON ?auto_121459 ?auto_121458 ) ( not ( = ?auto_121458 ?auto_121459 ) ) ( not ( = ?auto_121458 ?auto_121457 ) ) ( not ( = ?auto_121458 ?auto_121456 ) ) ( not ( = ?auto_121451 ?auto_121458 ) ) ( not ( = ?auto_121452 ?auto_121458 ) ) ( not ( = ?auto_121453 ?auto_121458 ) ) ( not ( = ?auto_121454 ?auto_121458 ) ) ( not ( = ?auto_121455 ?auto_121458 ) ) ( ON ?auto_121455 ?auto_121456 ) ( CLEAR ?auto_121453 ) ( ON ?auto_121454 ?auto_121455 ) ( CLEAR ?auto_121454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121458 ?auto_121459 ?auto_121457 ?auto_121456 ?auto_121455 )
      ( MAKE-7PILE ?auto_121451 ?auto_121452 ?auto_121453 ?auto_121454 ?auto_121455 ?auto_121456 ?auto_121457 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121460 - BLOCK
      ?auto_121461 - BLOCK
      ?auto_121462 - BLOCK
      ?auto_121463 - BLOCK
      ?auto_121464 - BLOCK
      ?auto_121465 - BLOCK
      ?auto_121466 - BLOCK
    )
    :vars
    (
      ?auto_121467 - BLOCK
      ?auto_121468 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121460 ) ( ON ?auto_121461 ?auto_121460 ) ( not ( = ?auto_121460 ?auto_121461 ) ) ( not ( = ?auto_121460 ?auto_121462 ) ) ( not ( = ?auto_121460 ?auto_121463 ) ) ( not ( = ?auto_121460 ?auto_121464 ) ) ( not ( = ?auto_121460 ?auto_121465 ) ) ( not ( = ?auto_121460 ?auto_121466 ) ) ( not ( = ?auto_121461 ?auto_121462 ) ) ( not ( = ?auto_121461 ?auto_121463 ) ) ( not ( = ?auto_121461 ?auto_121464 ) ) ( not ( = ?auto_121461 ?auto_121465 ) ) ( not ( = ?auto_121461 ?auto_121466 ) ) ( not ( = ?auto_121462 ?auto_121463 ) ) ( not ( = ?auto_121462 ?auto_121464 ) ) ( not ( = ?auto_121462 ?auto_121465 ) ) ( not ( = ?auto_121462 ?auto_121466 ) ) ( not ( = ?auto_121463 ?auto_121464 ) ) ( not ( = ?auto_121463 ?auto_121465 ) ) ( not ( = ?auto_121463 ?auto_121466 ) ) ( not ( = ?auto_121464 ?auto_121465 ) ) ( not ( = ?auto_121464 ?auto_121466 ) ) ( not ( = ?auto_121465 ?auto_121466 ) ) ( ON ?auto_121466 ?auto_121467 ) ( not ( = ?auto_121460 ?auto_121467 ) ) ( not ( = ?auto_121461 ?auto_121467 ) ) ( not ( = ?auto_121462 ?auto_121467 ) ) ( not ( = ?auto_121463 ?auto_121467 ) ) ( not ( = ?auto_121464 ?auto_121467 ) ) ( not ( = ?auto_121465 ?auto_121467 ) ) ( not ( = ?auto_121466 ?auto_121467 ) ) ( ON ?auto_121465 ?auto_121466 ) ( ON-TABLE ?auto_121468 ) ( ON ?auto_121467 ?auto_121468 ) ( not ( = ?auto_121468 ?auto_121467 ) ) ( not ( = ?auto_121468 ?auto_121466 ) ) ( not ( = ?auto_121468 ?auto_121465 ) ) ( not ( = ?auto_121460 ?auto_121468 ) ) ( not ( = ?auto_121461 ?auto_121468 ) ) ( not ( = ?auto_121462 ?auto_121468 ) ) ( not ( = ?auto_121463 ?auto_121468 ) ) ( not ( = ?auto_121464 ?auto_121468 ) ) ( ON ?auto_121464 ?auto_121465 ) ( ON ?auto_121463 ?auto_121464 ) ( CLEAR ?auto_121463 ) ( HOLDING ?auto_121462 ) ( CLEAR ?auto_121461 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121460 ?auto_121461 ?auto_121462 )
      ( MAKE-7PILE ?auto_121460 ?auto_121461 ?auto_121462 ?auto_121463 ?auto_121464 ?auto_121465 ?auto_121466 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121469 - BLOCK
      ?auto_121470 - BLOCK
      ?auto_121471 - BLOCK
      ?auto_121472 - BLOCK
      ?auto_121473 - BLOCK
      ?auto_121474 - BLOCK
      ?auto_121475 - BLOCK
    )
    :vars
    (
      ?auto_121476 - BLOCK
      ?auto_121477 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121469 ) ( ON ?auto_121470 ?auto_121469 ) ( not ( = ?auto_121469 ?auto_121470 ) ) ( not ( = ?auto_121469 ?auto_121471 ) ) ( not ( = ?auto_121469 ?auto_121472 ) ) ( not ( = ?auto_121469 ?auto_121473 ) ) ( not ( = ?auto_121469 ?auto_121474 ) ) ( not ( = ?auto_121469 ?auto_121475 ) ) ( not ( = ?auto_121470 ?auto_121471 ) ) ( not ( = ?auto_121470 ?auto_121472 ) ) ( not ( = ?auto_121470 ?auto_121473 ) ) ( not ( = ?auto_121470 ?auto_121474 ) ) ( not ( = ?auto_121470 ?auto_121475 ) ) ( not ( = ?auto_121471 ?auto_121472 ) ) ( not ( = ?auto_121471 ?auto_121473 ) ) ( not ( = ?auto_121471 ?auto_121474 ) ) ( not ( = ?auto_121471 ?auto_121475 ) ) ( not ( = ?auto_121472 ?auto_121473 ) ) ( not ( = ?auto_121472 ?auto_121474 ) ) ( not ( = ?auto_121472 ?auto_121475 ) ) ( not ( = ?auto_121473 ?auto_121474 ) ) ( not ( = ?auto_121473 ?auto_121475 ) ) ( not ( = ?auto_121474 ?auto_121475 ) ) ( ON ?auto_121475 ?auto_121476 ) ( not ( = ?auto_121469 ?auto_121476 ) ) ( not ( = ?auto_121470 ?auto_121476 ) ) ( not ( = ?auto_121471 ?auto_121476 ) ) ( not ( = ?auto_121472 ?auto_121476 ) ) ( not ( = ?auto_121473 ?auto_121476 ) ) ( not ( = ?auto_121474 ?auto_121476 ) ) ( not ( = ?auto_121475 ?auto_121476 ) ) ( ON ?auto_121474 ?auto_121475 ) ( ON-TABLE ?auto_121477 ) ( ON ?auto_121476 ?auto_121477 ) ( not ( = ?auto_121477 ?auto_121476 ) ) ( not ( = ?auto_121477 ?auto_121475 ) ) ( not ( = ?auto_121477 ?auto_121474 ) ) ( not ( = ?auto_121469 ?auto_121477 ) ) ( not ( = ?auto_121470 ?auto_121477 ) ) ( not ( = ?auto_121471 ?auto_121477 ) ) ( not ( = ?auto_121472 ?auto_121477 ) ) ( not ( = ?auto_121473 ?auto_121477 ) ) ( ON ?auto_121473 ?auto_121474 ) ( ON ?auto_121472 ?auto_121473 ) ( CLEAR ?auto_121470 ) ( ON ?auto_121471 ?auto_121472 ) ( CLEAR ?auto_121471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121477 ?auto_121476 ?auto_121475 ?auto_121474 ?auto_121473 ?auto_121472 )
      ( MAKE-7PILE ?auto_121469 ?auto_121470 ?auto_121471 ?auto_121472 ?auto_121473 ?auto_121474 ?auto_121475 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121478 - BLOCK
      ?auto_121479 - BLOCK
      ?auto_121480 - BLOCK
      ?auto_121481 - BLOCK
      ?auto_121482 - BLOCK
      ?auto_121483 - BLOCK
      ?auto_121484 - BLOCK
    )
    :vars
    (
      ?auto_121486 - BLOCK
      ?auto_121485 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121478 ) ( not ( = ?auto_121478 ?auto_121479 ) ) ( not ( = ?auto_121478 ?auto_121480 ) ) ( not ( = ?auto_121478 ?auto_121481 ) ) ( not ( = ?auto_121478 ?auto_121482 ) ) ( not ( = ?auto_121478 ?auto_121483 ) ) ( not ( = ?auto_121478 ?auto_121484 ) ) ( not ( = ?auto_121479 ?auto_121480 ) ) ( not ( = ?auto_121479 ?auto_121481 ) ) ( not ( = ?auto_121479 ?auto_121482 ) ) ( not ( = ?auto_121479 ?auto_121483 ) ) ( not ( = ?auto_121479 ?auto_121484 ) ) ( not ( = ?auto_121480 ?auto_121481 ) ) ( not ( = ?auto_121480 ?auto_121482 ) ) ( not ( = ?auto_121480 ?auto_121483 ) ) ( not ( = ?auto_121480 ?auto_121484 ) ) ( not ( = ?auto_121481 ?auto_121482 ) ) ( not ( = ?auto_121481 ?auto_121483 ) ) ( not ( = ?auto_121481 ?auto_121484 ) ) ( not ( = ?auto_121482 ?auto_121483 ) ) ( not ( = ?auto_121482 ?auto_121484 ) ) ( not ( = ?auto_121483 ?auto_121484 ) ) ( ON ?auto_121484 ?auto_121486 ) ( not ( = ?auto_121478 ?auto_121486 ) ) ( not ( = ?auto_121479 ?auto_121486 ) ) ( not ( = ?auto_121480 ?auto_121486 ) ) ( not ( = ?auto_121481 ?auto_121486 ) ) ( not ( = ?auto_121482 ?auto_121486 ) ) ( not ( = ?auto_121483 ?auto_121486 ) ) ( not ( = ?auto_121484 ?auto_121486 ) ) ( ON ?auto_121483 ?auto_121484 ) ( ON-TABLE ?auto_121485 ) ( ON ?auto_121486 ?auto_121485 ) ( not ( = ?auto_121485 ?auto_121486 ) ) ( not ( = ?auto_121485 ?auto_121484 ) ) ( not ( = ?auto_121485 ?auto_121483 ) ) ( not ( = ?auto_121478 ?auto_121485 ) ) ( not ( = ?auto_121479 ?auto_121485 ) ) ( not ( = ?auto_121480 ?auto_121485 ) ) ( not ( = ?auto_121481 ?auto_121485 ) ) ( not ( = ?auto_121482 ?auto_121485 ) ) ( ON ?auto_121482 ?auto_121483 ) ( ON ?auto_121481 ?auto_121482 ) ( ON ?auto_121480 ?auto_121481 ) ( CLEAR ?auto_121480 ) ( HOLDING ?auto_121479 ) ( CLEAR ?auto_121478 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121478 ?auto_121479 )
      ( MAKE-7PILE ?auto_121478 ?auto_121479 ?auto_121480 ?auto_121481 ?auto_121482 ?auto_121483 ?auto_121484 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121487 - BLOCK
      ?auto_121488 - BLOCK
      ?auto_121489 - BLOCK
      ?auto_121490 - BLOCK
      ?auto_121491 - BLOCK
      ?auto_121492 - BLOCK
      ?auto_121493 - BLOCK
    )
    :vars
    (
      ?auto_121495 - BLOCK
      ?auto_121494 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121487 ) ( not ( = ?auto_121487 ?auto_121488 ) ) ( not ( = ?auto_121487 ?auto_121489 ) ) ( not ( = ?auto_121487 ?auto_121490 ) ) ( not ( = ?auto_121487 ?auto_121491 ) ) ( not ( = ?auto_121487 ?auto_121492 ) ) ( not ( = ?auto_121487 ?auto_121493 ) ) ( not ( = ?auto_121488 ?auto_121489 ) ) ( not ( = ?auto_121488 ?auto_121490 ) ) ( not ( = ?auto_121488 ?auto_121491 ) ) ( not ( = ?auto_121488 ?auto_121492 ) ) ( not ( = ?auto_121488 ?auto_121493 ) ) ( not ( = ?auto_121489 ?auto_121490 ) ) ( not ( = ?auto_121489 ?auto_121491 ) ) ( not ( = ?auto_121489 ?auto_121492 ) ) ( not ( = ?auto_121489 ?auto_121493 ) ) ( not ( = ?auto_121490 ?auto_121491 ) ) ( not ( = ?auto_121490 ?auto_121492 ) ) ( not ( = ?auto_121490 ?auto_121493 ) ) ( not ( = ?auto_121491 ?auto_121492 ) ) ( not ( = ?auto_121491 ?auto_121493 ) ) ( not ( = ?auto_121492 ?auto_121493 ) ) ( ON ?auto_121493 ?auto_121495 ) ( not ( = ?auto_121487 ?auto_121495 ) ) ( not ( = ?auto_121488 ?auto_121495 ) ) ( not ( = ?auto_121489 ?auto_121495 ) ) ( not ( = ?auto_121490 ?auto_121495 ) ) ( not ( = ?auto_121491 ?auto_121495 ) ) ( not ( = ?auto_121492 ?auto_121495 ) ) ( not ( = ?auto_121493 ?auto_121495 ) ) ( ON ?auto_121492 ?auto_121493 ) ( ON-TABLE ?auto_121494 ) ( ON ?auto_121495 ?auto_121494 ) ( not ( = ?auto_121494 ?auto_121495 ) ) ( not ( = ?auto_121494 ?auto_121493 ) ) ( not ( = ?auto_121494 ?auto_121492 ) ) ( not ( = ?auto_121487 ?auto_121494 ) ) ( not ( = ?auto_121488 ?auto_121494 ) ) ( not ( = ?auto_121489 ?auto_121494 ) ) ( not ( = ?auto_121490 ?auto_121494 ) ) ( not ( = ?auto_121491 ?auto_121494 ) ) ( ON ?auto_121491 ?auto_121492 ) ( ON ?auto_121490 ?auto_121491 ) ( ON ?auto_121489 ?auto_121490 ) ( CLEAR ?auto_121487 ) ( ON ?auto_121488 ?auto_121489 ) ( CLEAR ?auto_121488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_121494 ?auto_121495 ?auto_121493 ?auto_121492 ?auto_121491 ?auto_121490 ?auto_121489 )
      ( MAKE-7PILE ?auto_121487 ?auto_121488 ?auto_121489 ?auto_121490 ?auto_121491 ?auto_121492 ?auto_121493 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121496 - BLOCK
      ?auto_121497 - BLOCK
      ?auto_121498 - BLOCK
      ?auto_121499 - BLOCK
      ?auto_121500 - BLOCK
      ?auto_121501 - BLOCK
      ?auto_121502 - BLOCK
    )
    :vars
    (
      ?auto_121503 - BLOCK
      ?auto_121504 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121496 ?auto_121497 ) ) ( not ( = ?auto_121496 ?auto_121498 ) ) ( not ( = ?auto_121496 ?auto_121499 ) ) ( not ( = ?auto_121496 ?auto_121500 ) ) ( not ( = ?auto_121496 ?auto_121501 ) ) ( not ( = ?auto_121496 ?auto_121502 ) ) ( not ( = ?auto_121497 ?auto_121498 ) ) ( not ( = ?auto_121497 ?auto_121499 ) ) ( not ( = ?auto_121497 ?auto_121500 ) ) ( not ( = ?auto_121497 ?auto_121501 ) ) ( not ( = ?auto_121497 ?auto_121502 ) ) ( not ( = ?auto_121498 ?auto_121499 ) ) ( not ( = ?auto_121498 ?auto_121500 ) ) ( not ( = ?auto_121498 ?auto_121501 ) ) ( not ( = ?auto_121498 ?auto_121502 ) ) ( not ( = ?auto_121499 ?auto_121500 ) ) ( not ( = ?auto_121499 ?auto_121501 ) ) ( not ( = ?auto_121499 ?auto_121502 ) ) ( not ( = ?auto_121500 ?auto_121501 ) ) ( not ( = ?auto_121500 ?auto_121502 ) ) ( not ( = ?auto_121501 ?auto_121502 ) ) ( ON ?auto_121502 ?auto_121503 ) ( not ( = ?auto_121496 ?auto_121503 ) ) ( not ( = ?auto_121497 ?auto_121503 ) ) ( not ( = ?auto_121498 ?auto_121503 ) ) ( not ( = ?auto_121499 ?auto_121503 ) ) ( not ( = ?auto_121500 ?auto_121503 ) ) ( not ( = ?auto_121501 ?auto_121503 ) ) ( not ( = ?auto_121502 ?auto_121503 ) ) ( ON ?auto_121501 ?auto_121502 ) ( ON-TABLE ?auto_121504 ) ( ON ?auto_121503 ?auto_121504 ) ( not ( = ?auto_121504 ?auto_121503 ) ) ( not ( = ?auto_121504 ?auto_121502 ) ) ( not ( = ?auto_121504 ?auto_121501 ) ) ( not ( = ?auto_121496 ?auto_121504 ) ) ( not ( = ?auto_121497 ?auto_121504 ) ) ( not ( = ?auto_121498 ?auto_121504 ) ) ( not ( = ?auto_121499 ?auto_121504 ) ) ( not ( = ?auto_121500 ?auto_121504 ) ) ( ON ?auto_121500 ?auto_121501 ) ( ON ?auto_121499 ?auto_121500 ) ( ON ?auto_121498 ?auto_121499 ) ( ON ?auto_121497 ?auto_121498 ) ( CLEAR ?auto_121497 ) ( HOLDING ?auto_121496 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121496 )
      ( MAKE-7PILE ?auto_121496 ?auto_121497 ?auto_121498 ?auto_121499 ?auto_121500 ?auto_121501 ?auto_121502 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121505 - BLOCK
      ?auto_121506 - BLOCK
      ?auto_121507 - BLOCK
      ?auto_121508 - BLOCK
      ?auto_121509 - BLOCK
      ?auto_121510 - BLOCK
      ?auto_121511 - BLOCK
    )
    :vars
    (
      ?auto_121512 - BLOCK
      ?auto_121513 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121505 ?auto_121506 ) ) ( not ( = ?auto_121505 ?auto_121507 ) ) ( not ( = ?auto_121505 ?auto_121508 ) ) ( not ( = ?auto_121505 ?auto_121509 ) ) ( not ( = ?auto_121505 ?auto_121510 ) ) ( not ( = ?auto_121505 ?auto_121511 ) ) ( not ( = ?auto_121506 ?auto_121507 ) ) ( not ( = ?auto_121506 ?auto_121508 ) ) ( not ( = ?auto_121506 ?auto_121509 ) ) ( not ( = ?auto_121506 ?auto_121510 ) ) ( not ( = ?auto_121506 ?auto_121511 ) ) ( not ( = ?auto_121507 ?auto_121508 ) ) ( not ( = ?auto_121507 ?auto_121509 ) ) ( not ( = ?auto_121507 ?auto_121510 ) ) ( not ( = ?auto_121507 ?auto_121511 ) ) ( not ( = ?auto_121508 ?auto_121509 ) ) ( not ( = ?auto_121508 ?auto_121510 ) ) ( not ( = ?auto_121508 ?auto_121511 ) ) ( not ( = ?auto_121509 ?auto_121510 ) ) ( not ( = ?auto_121509 ?auto_121511 ) ) ( not ( = ?auto_121510 ?auto_121511 ) ) ( ON ?auto_121511 ?auto_121512 ) ( not ( = ?auto_121505 ?auto_121512 ) ) ( not ( = ?auto_121506 ?auto_121512 ) ) ( not ( = ?auto_121507 ?auto_121512 ) ) ( not ( = ?auto_121508 ?auto_121512 ) ) ( not ( = ?auto_121509 ?auto_121512 ) ) ( not ( = ?auto_121510 ?auto_121512 ) ) ( not ( = ?auto_121511 ?auto_121512 ) ) ( ON ?auto_121510 ?auto_121511 ) ( ON-TABLE ?auto_121513 ) ( ON ?auto_121512 ?auto_121513 ) ( not ( = ?auto_121513 ?auto_121512 ) ) ( not ( = ?auto_121513 ?auto_121511 ) ) ( not ( = ?auto_121513 ?auto_121510 ) ) ( not ( = ?auto_121505 ?auto_121513 ) ) ( not ( = ?auto_121506 ?auto_121513 ) ) ( not ( = ?auto_121507 ?auto_121513 ) ) ( not ( = ?auto_121508 ?auto_121513 ) ) ( not ( = ?auto_121509 ?auto_121513 ) ) ( ON ?auto_121509 ?auto_121510 ) ( ON ?auto_121508 ?auto_121509 ) ( ON ?auto_121507 ?auto_121508 ) ( ON ?auto_121506 ?auto_121507 ) ( ON ?auto_121505 ?auto_121506 ) ( CLEAR ?auto_121505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_121513 ?auto_121512 ?auto_121511 ?auto_121510 ?auto_121509 ?auto_121508 ?auto_121507 ?auto_121506 )
      ( MAKE-7PILE ?auto_121505 ?auto_121506 ?auto_121507 ?auto_121508 ?auto_121509 ?auto_121510 ?auto_121511 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121515 - BLOCK
    )
    :vars
    (
      ?auto_121516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121516 ?auto_121515 ) ( CLEAR ?auto_121516 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121515 ) ( not ( = ?auto_121515 ?auto_121516 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121516 ?auto_121515 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121517 - BLOCK
    )
    :vars
    (
      ?auto_121518 - BLOCK
      ?auto_121519 - BLOCK
      ?auto_121520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121518 ?auto_121517 ) ( CLEAR ?auto_121518 ) ( ON-TABLE ?auto_121517 ) ( not ( = ?auto_121517 ?auto_121518 ) ) ( HOLDING ?auto_121519 ) ( CLEAR ?auto_121520 ) ( not ( = ?auto_121517 ?auto_121519 ) ) ( not ( = ?auto_121517 ?auto_121520 ) ) ( not ( = ?auto_121518 ?auto_121519 ) ) ( not ( = ?auto_121518 ?auto_121520 ) ) ( not ( = ?auto_121519 ?auto_121520 ) ) )
    :subtasks
    ( ( !STACK ?auto_121519 ?auto_121520 )
      ( MAKE-1PILE ?auto_121517 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121521 - BLOCK
    )
    :vars
    (
      ?auto_121523 - BLOCK
      ?auto_121522 - BLOCK
      ?auto_121524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121523 ?auto_121521 ) ( ON-TABLE ?auto_121521 ) ( not ( = ?auto_121521 ?auto_121523 ) ) ( CLEAR ?auto_121522 ) ( not ( = ?auto_121521 ?auto_121524 ) ) ( not ( = ?auto_121521 ?auto_121522 ) ) ( not ( = ?auto_121523 ?auto_121524 ) ) ( not ( = ?auto_121523 ?auto_121522 ) ) ( not ( = ?auto_121524 ?auto_121522 ) ) ( ON ?auto_121524 ?auto_121523 ) ( CLEAR ?auto_121524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121521 ?auto_121523 )
      ( MAKE-1PILE ?auto_121521 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121525 - BLOCK
    )
    :vars
    (
      ?auto_121526 - BLOCK
      ?auto_121528 - BLOCK
      ?auto_121527 - BLOCK
      ?auto_121531 - BLOCK
      ?auto_121532 - BLOCK
      ?auto_121533 - BLOCK
      ?auto_121530 - BLOCK
      ?auto_121529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121526 ?auto_121525 ) ( ON-TABLE ?auto_121525 ) ( not ( = ?auto_121525 ?auto_121526 ) ) ( not ( = ?auto_121525 ?auto_121528 ) ) ( not ( = ?auto_121525 ?auto_121527 ) ) ( not ( = ?auto_121526 ?auto_121528 ) ) ( not ( = ?auto_121526 ?auto_121527 ) ) ( not ( = ?auto_121528 ?auto_121527 ) ) ( ON ?auto_121528 ?auto_121526 ) ( CLEAR ?auto_121528 ) ( HOLDING ?auto_121527 ) ( CLEAR ?auto_121531 ) ( ON-TABLE ?auto_121532 ) ( ON ?auto_121533 ?auto_121532 ) ( ON ?auto_121530 ?auto_121533 ) ( ON ?auto_121529 ?auto_121530 ) ( ON ?auto_121531 ?auto_121529 ) ( not ( = ?auto_121532 ?auto_121533 ) ) ( not ( = ?auto_121532 ?auto_121530 ) ) ( not ( = ?auto_121532 ?auto_121529 ) ) ( not ( = ?auto_121532 ?auto_121531 ) ) ( not ( = ?auto_121532 ?auto_121527 ) ) ( not ( = ?auto_121533 ?auto_121530 ) ) ( not ( = ?auto_121533 ?auto_121529 ) ) ( not ( = ?auto_121533 ?auto_121531 ) ) ( not ( = ?auto_121533 ?auto_121527 ) ) ( not ( = ?auto_121530 ?auto_121529 ) ) ( not ( = ?auto_121530 ?auto_121531 ) ) ( not ( = ?auto_121530 ?auto_121527 ) ) ( not ( = ?auto_121529 ?auto_121531 ) ) ( not ( = ?auto_121529 ?auto_121527 ) ) ( not ( = ?auto_121531 ?auto_121527 ) ) ( not ( = ?auto_121525 ?auto_121531 ) ) ( not ( = ?auto_121525 ?auto_121532 ) ) ( not ( = ?auto_121525 ?auto_121533 ) ) ( not ( = ?auto_121525 ?auto_121530 ) ) ( not ( = ?auto_121525 ?auto_121529 ) ) ( not ( = ?auto_121526 ?auto_121531 ) ) ( not ( = ?auto_121526 ?auto_121532 ) ) ( not ( = ?auto_121526 ?auto_121533 ) ) ( not ( = ?auto_121526 ?auto_121530 ) ) ( not ( = ?auto_121526 ?auto_121529 ) ) ( not ( = ?auto_121528 ?auto_121531 ) ) ( not ( = ?auto_121528 ?auto_121532 ) ) ( not ( = ?auto_121528 ?auto_121533 ) ) ( not ( = ?auto_121528 ?auto_121530 ) ) ( not ( = ?auto_121528 ?auto_121529 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121532 ?auto_121533 ?auto_121530 ?auto_121529 ?auto_121531 ?auto_121527 )
      ( MAKE-1PILE ?auto_121525 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121534 - BLOCK
    )
    :vars
    (
      ?auto_121537 - BLOCK
      ?auto_121536 - BLOCK
      ?auto_121542 - BLOCK
      ?auto_121535 - BLOCK
      ?auto_121539 - BLOCK
      ?auto_121541 - BLOCK
      ?auto_121540 - BLOCK
      ?auto_121538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121537 ?auto_121534 ) ( ON-TABLE ?auto_121534 ) ( not ( = ?auto_121534 ?auto_121537 ) ) ( not ( = ?auto_121534 ?auto_121536 ) ) ( not ( = ?auto_121534 ?auto_121542 ) ) ( not ( = ?auto_121537 ?auto_121536 ) ) ( not ( = ?auto_121537 ?auto_121542 ) ) ( not ( = ?auto_121536 ?auto_121542 ) ) ( ON ?auto_121536 ?auto_121537 ) ( CLEAR ?auto_121535 ) ( ON-TABLE ?auto_121539 ) ( ON ?auto_121541 ?auto_121539 ) ( ON ?auto_121540 ?auto_121541 ) ( ON ?auto_121538 ?auto_121540 ) ( ON ?auto_121535 ?auto_121538 ) ( not ( = ?auto_121539 ?auto_121541 ) ) ( not ( = ?auto_121539 ?auto_121540 ) ) ( not ( = ?auto_121539 ?auto_121538 ) ) ( not ( = ?auto_121539 ?auto_121535 ) ) ( not ( = ?auto_121539 ?auto_121542 ) ) ( not ( = ?auto_121541 ?auto_121540 ) ) ( not ( = ?auto_121541 ?auto_121538 ) ) ( not ( = ?auto_121541 ?auto_121535 ) ) ( not ( = ?auto_121541 ?auto_121542 ) ) ( not ( = ?auto_121540 ?auto_121538 ) ) ( not ( = ?auto_121540 ?auto_121535 ) ) ( not ( = ?auto_121540 ?auto_121542 ) ) ( not ( = ?auto_121538 ?auto_121535 ) ) ( not ( = ?auto_121538 ?auto_121542 ) ) ( not ( = ?auto_121535 ?auto_121542 ) ) ( not ( = ?auto_121534 ?auto_121535 ) ) ( not ( = ?auto_121534 ?auto_121539 ) ) ( not ( = ?auto_121534 ?auto_121541 ) ) ( not ( = ?auto_121534 ?auto_121540 ) ) ( not ( = ?auto_121534 ?auto_121538 ) ) ( not ( = ?auto_121537 ?auto_121535 ) ) ( not ( = ?auto_121537 ?auto_121539 ) ) ( not ( = ?auto_121537 ?auto_121541 ) ) ( not ( = ?auto_121537 ?auto_121540 ) ) ( not ( = ?auto_121537 ?auto_121538 ) ) ( not ( = ?auto_121536 ?auto_121535 ) ) ( not ( = ?auto_121536 ?auto_121539 ) ) ( not ( = ?auto_121536 ?auto_121541 ) ) ( not ( = ?auto_121536 ?auto_121540 ) ) ( not ( = ?auto_121536 ?auto_121538 ) ) ( ON ?auto_121542 ?auto_121536 ) ( CLEAR ?auto_121542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121534 ?auto_121537 ?auto_121536 )
      ( MAKE-1PILE ?auto_121534 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121543 - BLOCK
    )
    :vars
    (
      ?auto_121548 - BLOCK
      ?auto_121546 - BLOCK
      ?auto_121549 - BLOCK
      ?auto_121545 - BLOCK
      ?auto_121547 - BLOCK
      ?auto_121544 - BLOCK
      ?auto_121551 - BLOCK
      ?auto_121550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121548 ?auto_121543 ) ( ON-TABLE ?auto_121543 ) ( not ( = ?auto_121543 ?auto_121548 ) ) ( not ( = ?auto_121543 ?auto_121546 ) ) ( not ( = ?auto_121543 ?auto_121549 ) ) ( not ( = ?auto_121548 ?auto_121546 ) ) ( not ( = ?auto_121548 ?auto_121549 ) ) ( not ( = ?auto_121546 ?auto_121549 ) ) ( ON ?auto_121546 ?auto_121548 ) ( ON-TABLE ?auto_121545 ) ( ON ?auto_121547 ?auto_121545 ) ( ON ?auto_121544 ?auto_121547 ) ( ON ?auto_121551 ?auto_121544 ) ( not ( = ?auto_121545 ?auto_121547 ) ) ( not ( = ?auto_121545 ?auto_121544 ) ) ( not ( = ?auto_121545 ?auto_121551 ) ) ( not ( = ?auto_121545 ?auto_121550 ) ) ( not ( = ?auto_121545 ?auto_121549 ) ) ( not ( = ?auto_121547 ?auto_121544 ) ) ( not ( = ?auto_121547 ?auto_121551 ) ) ( not ( = ?auto_121547 ?auto_121550 ) ) ( not ( = ?auto_121547 ?auto_121549 ) ) ( not ( = ?auto_121544 ?auto_121551 ) ) ( not ( = ?auto_121544 ?auto_121550 ) ) ( not ( = ?auto_121544 ?auto_121549 ) ) ( not ( = ?auto_121551 ?auto_121550 ) ) ( not ( = ?auto_121551 ?auto_121549 ) ) ( not ( = ?auto_121550 ?auto_121549 ) ) ( not ( = ?auto_121543 ?auto_121550 ) ) ( not ( = ?auto_121543 ?auto_121545 ) ) ( not ( = ?auto_121543 ?auto_121547 ) ) ( not ( = ?auto_121543 ?auto_121544 ) ) ( not ( = ?auto_121543 ?auto_121551 ) ) ( not ( = ?auto_121548 ?auto_121550 ) ) ( not ( = ?auto_121548 ?auto_121545 ) ) ( not ( = ?auto_121548 ?auto_121547 ) ) ( not ( = ?auto_121548 ?auto_121544 ) ) ( not ( = ?auto_121548 ?auto_121551 ) ) ( not ( = ?auto_121546 ?auto_121550 ) ) ( not ( = ?auto_121546 ?auto_121545 ) ) ( not ( = ?auto_121546 ?auto_121547 ) ) ( not ( = ?auto_121546 ?auto_121544 ) ) ( not ( = ?auto_121546 ?auto_121551 ) ) ( ON ?auto_121549 ?auto_121546 ) ( CLEAR ?auto_121549 ) ( HOLDING ?auto_121550 ) ( CLEAR ?auto_121551 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121545 ?auto_121547 ?auto_121544 ?auto_121551 ?auto_121550 )
      ( MAKE-1PILE ?auto_121543 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121552 - BLOCK
    )
    :vars
    (
      ?auto_121558 - BLOCK
      ?auto_121554 - BLOCK
      ?auto_121560 - BLOCK
      ?auto_121559 - BLOCK
      ?auto_121556 - BLOCK
      ?auto_121555 - BLOCK
      ?auto_121557 - BLOCK
      ?auto_121553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121558 ?auto_121552 ) ( ON-TABLE ?auto_121552 ) ( not ( = ?auto_121552 ?auto_121558 ) ) ( not ( = ?auto_121552 ?auto_121554 ) ) ( not ( = ?auto_121552 ?auto_121560 ) ) ( not ( = ?auto_121558 ?auto_121554 ) ) ( not ( = ?auto_121558 ?auto_121560 ) ) ( not ( = ?auto_121554 ?auto_121560 ) ) ( ON ?auto_121554 ?auto_121558 ) ( ON-TABLE ?auto_121559 ) ( ON ?auto_121556 ?auto_121559 ) ( ON ?auto_121555 ?auto_121556 ) ( ON ?auto_121557 ?auto_121555 ) ( not ( = ?auto_121559 ?auto_121556 ) ) ( not ( = ?auto_121559 ?auto_121555 ) ) ( not ( = ?auto_121559 ?auto_121557 ) ) ( not ( = ?auto_121559 ?auto_121553 ) ) ( not ( = ?auto_121559 ?auto_121560 ) ) ( not ( = ?auto_121556 ?auto_121555 ) ) ( not ( = ?auto_121556 ?auto_121557 ) ) ( not ( = ?auto_121556 ?auto_121553 ) ) ( not ( = ?auto_121556 ?auto_121560 ) ) ( not ( = ?auto_121555 ?auto_121557 ) ) ( not ( = ?auto_121555 ?auto_121553 ) ) ( not ( = ?auto_121555 ?auto_121560 ) ) ( not ( = ?auto_121557 ?auto_121553 ) ) ( not ( = ?auto_121557 ?auto_121560 ) ) ( not ( = ?auto_121553 ?auto_121560 ) ) ( not ( = ?auto_121552 ?auto_121553 ) ) ( not ( = ?auto_121552 ?auto_121559 ) ) ( not ( = ?auto_121552 ?auto_121556 ) ) ( not ( = ?auto_121552 ?auto_121555 ) ) ( not ( = ?auto_121552 ?auto_121557 ) ) ( not ( = ?auto_121558 ?auto_121553 ) ) ( not ( = ?auto_121558 ?auto_121559 ) ) ( not ( = ?auto_121558 ?auto_121556 ) ) ( not ( = ?auto_121558 ?auto_121555 ) ) ( not ( = ?auto_121558 ?auto_121557 ) ) ( not ( = ?auto_121554 ?auto_121553 ) ) ( not ( = ?auto_121554 ?auto_121559 ) ) ( not ( = ?auto_121554 ?auto_121556 ) ) ( not ( = ?auto_121554 ?auto_121555 ) ) ( not ( = ?auto_121554 ?auto_121557 ) ) ( ON ?auto_121560 ?auto_121554 ) ( CLEAR ?auto_121557 ) ( ON ?auto_121553 ?auto_121560 ) ( CLEAR ?auto_121553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121552 ?auto_121558 ?auto_121554 ?auto_121560 )
      ( MAKE-1PILE ?auto_121552 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121561 - BLOCK
    )
    :vars
    (
      ?auto_121562 - BLOCK
      ?auto_121563 - BLOCK
      ?auto_121564 - BLOCK
      ?auto_121567 - BLOCK
      ?auto_121569 - BLOCK
      ?auto_121565 - BLOCK
      ?auto_121568 - BLOCK
      ?auto_121566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121562 ?auto_121561 ) ( ON-TABLE ?auto_121561 ) ( not ( = ?auto_121561 ?auto_121562 ) ) ( not ( = ?auto_121561 ?auto_121563 ) ) ( not ( = ?auto_121561 ?auto_121564 ) ) ( not ( = ?auto_121562 ?auto_121563 ) ) ( not ( = ?auto_121562 ?auto_121564 ) ) ( not ( = ?auto_121563 ?auto_121564 ) ) ( ON ?auto_121563 ?auto_121562 ) ( ON-TABLE ?auto_121567 ) ( ON ?auto_121569 ?auto_121567 ) ( ON ?auto_121565 ?auto_121569 ) ( not ( = ?auto_121567 ?auto_121569 ) ) ( not ( = ?auto_121567 ?auto_121565 ) ) ( not ( = ?auto_121567 ?auto_121568 ) ) ( not ( = ?auto_121567 ?auto_121566 ) ) ( not ( = ?auto_121567 ?auto_121564 ) ) ( not ( = ?auto_121569 ?auto_121565 ) ) ( not ( = ?auto_121569 ?auto_121568 ) ) ( not ( = ?auto_121569 ?auto_121566 ) ) ( not ( = ?auto_121569 ?auto_121564 ) ) ( not ( = ?auto_121565 ?auto_121568 ) ) ( not ( = ?auto_121565 ?auto_121566 ) ) ( not ( = ?auto_121565 ?auto_121564 ) ) ( not ( = ?auto_121568 ?auto_121566 ) ) ( not ( = ?auto_121568 ?auto_121564 ) ) ( not ( = ?auto_121566 ?auto_121564 ) ) ( not ( = ?auto_121561 ?auto_121566 ) ) ( not ( = ?auto_121561 ?auto_121567 ) ) ( not ( = ?auto_121561 ?auto_121569 ) ) ( not ( = ?auto_121561 ?auto_121565 ) ) ( not ( = ?auto_121561 ?auto_121568 ) ) ( not ( = ?auto_121562 ?auto_121566 ) ) ( not ( = ?auto_121562 ?auto_121567 ) ) ( not ( = ?auto_121562 ?auto_121569 ) ) ( not ( = ?auto_121562 ?auto_121565 ) ) ( not ( = ?auto_121562 ?auto_121568 ) ) ( not ( = ?auto_121563 ?auto_121566 ) ) ( not ( = ?auto_121563 ?auto_121567 ) ) ( not ( = ?auto_121563 ?auto_121569 ) ) ( not ( = ?auto_121563 ?auto_121565 ) ) ( not ( = ?auto_121563 ?auto_121568 ) ) ( ON ?auto_121564 ?auto_121563 ) ( ON ?auto_121566 ?auto_121564 ) ( CLEAR ?auto_121566 ) ( HOLDING ?auto_121568 ) ( CLEAR ?auto_121565 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121567 ?auto_121569 ?auto_121565 ?auto_121568 )
      ( MAKE-1PILE ?auto_121561 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121570 - BLOCK
    )
    :vars
    (
      ?auto_121574 - BLOCK
      ?auto_121577 - BLOCK
      ?auto_121578 - BLOCK
      ?auto_121573 - BLOCK
      ?auto_121575 - BLOCK
      ?auto_121576 - BLOCK
      ?auto_121571 - BLOCK
      ?auto_121572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121574 ?auto_121570 ) ( ON-TABLE ?auto_121570 ) ( not ( = ?auto_121570 ?auto_121574 ) ) ( not ( = ?auto_121570 ?auto_121577 ) ) ( not ( = ?auto_121570 ?auto_121578 ) ) ( not ( = ?auto_121574 ?auto_121577 ) ) ( not ( = ?auto_121574 ?auto_121578 ) ) ( not ( = ?auto_121577 ?auto_121578 ) ) ( ON ?auto_121577 ?auto_121574 ) ( ON-TABLE ?auto_121573 ) ( ON ?auto_121575 ?auto_121573 ) ( ON ?auto_121576 ?auto_121575 ) ( not ( = ?auto_121573 ?auto_121575 ) ) ( not ( = ?auto_121573 ?auto_121576 ) ) ( not ( = ?auto_121573 ?auto_121571 ) ) ( not ( = ?auto_121573 ?auto_121572 ) ) ( not ( = ?auto_121573 ?auto_121578 ) ) ( not ( = ?auto_121575 ?auto_121576 ) ) ( not ( = ?auto_121575 ?auto_121571 ) ) ( not ( = ?auto_121575 ?auto_121572 ) ) ( not ( = ?auto_121575 ?auto_121578 ) ) ( not ( = ?auto_121576 ?auto_121571 ) ) ( not ( = ?auto_121576 ?auto_121572 ) ) ( not ( = ?auto_121576 ?auto_121578 ) ) ( not ( = ?auto_121571 ?auto_121572 ) ) ( not ( = ?auto_121571 ?auto_121578 ) ) ( not ( = ?auto_121572 ?auto_121578 ) ) ( not ( = ?auto_121570 ?auto_121572 ) ) ( not ( = ?auto_121570 ?auto_121573 ) ) ( not ( = ?auto_121570 ?auto_121575 ) ) ( not ( = ?auto_121570 ?auto_121576 ) ) ( not ( = ?auto_121570 ?auto_121571 ) ) ( not ( = ?auto_121574 ?auto_121572 ) ) ( not ( = ?auto_121574 ?auto_121573 ) ) ( not ( = ?auto_121574 ?auto_121575 ) ) ( not ( = ?auto_121574 ?auto_121576 ) ) ( not ( = ?auto_121574 ?auto_121571 ) ) ( not ( = ?auto_121577 ?auto_121572 ) ) ( not ( = ?auto_121577 ?auto_121573 ) ) ( not ( = ?auto_121577 ?auto_121575 ) ) ( not ( = ?auto_121577 ?auto_121576 ) ) ( not ( = ?auto_121577 ?auto_121571 ) ) ( ON ?auto_121578 ?auto_121577 ) ( ON ?auto_121572 ?auto_121578 ) ( CLEAR ?auto_121576 ) ( ON ?auto_121571 ?auto_121572 ) ( CLEAR ?auto_121571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121570 ?auto_121574 ?auto_121577 ?auto_121578 ?auto_121572 )
      ( MAKE-1PILE ?auto_121570 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121579 - BLOCK
    )
    :vars
    (
      ?auto_121582 - BLOCK
      ?auto_121581 - BLOCK
      ?auto_121584 - BLOCK
      ?auto_121580 - BLOCK
      ?auto_121583 - BLOCK
      ?auto_121587 - BLOCK
      ?auto_121585 - BLOCK
      ?auto_121586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121582 ?auto_121579 ) ( ON-TABLE ?auto_121579 ) ( not ( = ?auto_121579 ?auto_121582 ) ) ( not ( = ?auto_121579 ?auto_121581 ) ) ( not ( = ?auto_121579 ?auto_121584 ) ) ( not ( = ?auto_121582 ?auto_121581 ) ) ( not ( = ?auto_121582 ?auto_121584 ) ) ( not ( = ?auto_121581 ?auto_121584 ) ) ( ON ?auto_121581 ?auto_121582 ) ( ON-TABLE ?auto_121580 ) ( ON ?auto_121583 ?auto_121580 ) ( not ( = ?auto_121580 ?auto_121583 ) ) ( not ( = ?auto_121580 ?auto_121587 ) ) ( not ( = ?auto_121580 ?auto_121585 ) ) ( not ( = ?auto_121580 ?auto_121586 ) ) ( not ( = ?auto_121580 ?auto_121584 ) ) ( not ( = ?auto_121583 ?auto_121587 ) ) ( not ( = ?auto_121583 ?auto_121585 ) ) ( not ( = ?auto_121583 ?auto_121586 ) ) ( not ( = ?auto_121583 ?auto_121584 ) ) ( not ( = ?auto_121587 ?auto_121585 ) ) ( not ( = ?auto_121587 ?auto_121586 ) ) ( not ( = ?auto_121587 ?auto_121584 ) ) ( not ( = ?auto_121585 ?auto_121586 ) ) ( not ( = ?auto_121585 ?auto_121584 ) ) ( not ( = ?auto_121586 ?auto_121584 ) ) ( not ( = ?auto_121579 ?auto_121586 ) ) ( not ( = ?auto_121579 ?auto_121580 ) ) ( not ( = ?auto_121579 ?auto_121583 ) ) ( not ( = ?auto_121579 ?auto_121587 ) ) ( not ( = ?auto_121579 ?auto_121585 ) ) ( not ( = ?auto_121582 ?auto_121586 ) ) ( not ( = ?auto_121582 ?auto_121580 ) ) ( not ( = ?auto_121582 ?auto_121583 ) ) ( not ( = ?auto_121582 ?auto_121587 ) ) ( not ( = ?auto_121582 ?auto_121585 ) ) ( not ( = ?auto_121581 ?auto_121586 ) ) ( not ( = ?auto_121581 ?auto_121580 ) ) ( not ( = ?auto_121581 ?auto_121583 ) ) ( not ( = ?auto_121581 ?auto_121587 ) ) ( not ( = ?auto_121581 ?auto_121585 ) ) ( ON ?auto_121584 ?auto_121581 ) ( ON ?auto_121586 ?auto_121584 ) ( ON ?auto_121585 ?auto_121586 ) ( CLEAR ?auto_121585 ) ( HOLDING ?auto_121587 ) ( CLEAR ?auto_121583 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121580 ?auto_121583 ?auto_121587 )
      ( MAKE-1PILE ?auto_121579 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121588 - BLOCK
    )
    :vars
    (
      ?auto_121596 - BLOCK
      ?auto_121593 - BLOCK
      ?auto_121592 - BLOCK
      ?auto_121595 - BLOCK
      ?auto_121591 - BLOCK
      ?auto_121590 - BLOCK
      ?auto_121589 - BLOCK
      ?auto_121594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121596 ?auto_121588 ) ( ON-TABLE ?auto_121588 ) ( not ( = ?auto_121588 ?auto_121596 ) ) ( not ( = ?auto_121588 ?auto_121593 ) ) ( not ( = ?auto_121588 ?auto_121592 ) ) ( not ( = ?auto_121596 ?auto_121593 ) ) ( not ( = ?auto_121596 ?auto_121592 ) ) ( not ( = ?auto_121593 ?auto_121592 ) ) ( ON ?auto_121593 ?auto_121596 ) ( ON-TABLE ?auto_121595 ) ( ON ?auto_121591 ?auto_121595 ) ( not ( = ?auto_121595 ?auto_121591 ) ) ( not ( = ?auto_121595 ?auto_121590 ) ) ( not ( = ?auto_121595 ?auto_121589 ) ) ( not ( = ?auto_121595 ?auto_121594 ) ) ( not ( = ?auto_121595 ?auto_121592 ) ) ( not ( = ?auto_121591 ?auto_121590 ) ) ( not ( = ?auto_121591 ?auto_121589 ) ) ( not ( = ?auto_121591 ?auto_121594 ) ) ( not ( = ?auto_121591 ?auto_121592 ) ) ( not ( = ?auto_121590 ?auto_121589 ) ) ( not ( = ?auto_121590 ?auto_121594 ) ) ( not ( = ?auto_121590 ?auto_121592 ) ) ( not ( = ?auto_121589 ?auto_121594 ) ) ( not ( = ?auto_121589 ?auto_121592 ) ) ( not ( = ?auto_121594 ?auto_121592 ) ) ( not ( = ?auto_121588 ?auto_121594 ) ) ( not ( = ?auto_121588 ?auto_121595 ) ) ( not ( = ?auto_121588 ?auto_121591 ) ) ( not ( = ?auto_121588 ?auto_121590 ) ) ( not ( = ?auto_121588 ?auto_121589 ) ) ( not ( = ?auto_121596 ?auto_121594 ) ) ( not ( = ?auto_121596 ?auto_121595 ) ) ( not ( = ?auto_121596 ?auto_121591 ) ) ( not ( = ?auto_121596 ?auto_121590 ) ) ( not ( = ?auto_121596 ?auto_121589 ) ) ( not ( = ?auto_121593 ?auto_121594 ) ) ( not ( = ?auto_121593 ?auto_121595 ) ) ( not ( = ?auto_121593 ?auto_121591 ) ) ( not ( = ?auto_121593 ?auto_121590 ) ) ( not ( = ?auto_121593 ?auto_121589 ) ) ( ON ?auto_121592 ?auto_121593 ) ( ON ?auto_121594 ?auto_121592 ) ( ON ?auto_121589 ?auto_121594 ) ( CLEAR ?auto_121591 ) ( ON ?auto_121590 ?auto_121589 ) ( CLEAR ?auto_121590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121588 ?auto_121596 ?auto_121593 ?auto_121592 ?auto_121594 ?auto_121589 )
      ( MAKE-1PILE ?auto_121588 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121597 - BLOCK
    )
    :vars
    (
      ?auto_121605 - BLOCK
      ?auto_121602 - BLOCK
      ?auto_121599 - BLOCK
      ?auto_121603 - BLOCK
      ?auto_121601 - BLOCK
      ?auto_121604 - BLOCK
      ?auto_121600 - BLOCK
      ?auto_121598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121605 ?auto_121597 ) ( ON-TABLE ?auto_121597 ) ( not ( = ?auto_121597 ?auto_121605 ) ) ( not ( = ?auto_121597 ?auto_121602 ) ) ( not ( = ?auto_121597 ?auto_121599 ) ) ( not ( = ?auto_121605 ?auto_121602 ) ) ( not ( = ?auto_121605 ?auto_121599 ) ) ( not ( = ?auto_121602 ?auto_121599 ) ) ( ON ?auto_121602 ?auto_121605 ) ( ON-TABLE ?auto_121603 ) ( not ( = ?auto_121603 ?auto_121601 ) ) ( not ( = ?auto_121603 ?auto_121604 ) ) ( not ( = ?auto_121603 ?auto_121600 ) ) ( not ( = ?auto_121603 ?auto_121598 ) ) ( not ( = ?auto_121603 ?auto_121599 ) ) ( not ( = ?auto_121601 ?auto_121604 ) ) ( not ( = ?auto_121601 ?auto_121600 ) ) ( not ( = ?auto_121601 ?auto_121598 ) ) ( not ( = ?auto_121601 ?auto_121599 ) ) ( not ( = ?auto_121604 ?auto_121600 ) ) ( not ( = ?auto_121604 ?auto_121598 ) ) ( not ( = ?auto_121604 ?auto_121599 ) ) ( not ( = ?auto_121600 ?auto_121598 ) ) ( not ( = ?auto_121600 ?auto_121599 ) ) ( not ( = ?auto_121598 ?auto_121599 ) ) ( not ( = ?auto_121597 ?auto_121598 ) ) ( not ( = ?auto_121597 ?auto_121603 ) ) ( not ( = ?auto_121597 ?auto_121601 ) ) ( not ( = ?auto_121597 ?auto_121604 ) ) ( not ( = ?auto_121597 ?auto_121600 ) ) ( not ( = ?auto_121605 ?auto_121598 ) ) ( not ( = ?auto_121605 ?auto_121603 ) ) ( not ( = ?auto_121605 ?auto_121601 ) ) ( not ( = ?auto_121605 ?auto_121604 ) ) ( not ( = ?auto_121605 ?auto_121600 ) ) ( not ( = ?auto_121602 ?auto_121598 ) ) ( not ( = ?auto_121602 ?auto_121603 ) ) ( not ( = ?auto_121602 ?auto_121601 ) ) ( not ( = ?auto_121602 ?auto_121604 ) ) ( not ( = ?auto_121602 ?auto_121600 ) ) ( ON ?auto_121599 ?auto_121602 ) ( ON ?auto_121598 ?auto_121599 ) ( ON ?auto_121600 ?auto_121598 ) ( ON ?auto_121604 ?auto_121600 ) ( CLEAR ?auto_121604 ) ( HOLDING ?auto_121601 ) ( CLEAR ?auto_121603 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121603 ?auto_121601 )
      ( MAKE-1PILE ?auto_121597 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123776 - BLOCK
    )
    :vars
    (
      ?auto_123780 - BLOCK
      ?auto_123777 - BLOCK
      ?auto_123782 - BLOCK
      ?auto_123778 - BLOCK
      ?auto_123781 - BLOCK
      ?auto_123779 - BLOCK
      ?auto_123783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123780 ?auto_123776 ) ( ON-TABLE ?auto_123776 ) ( not ( = ?auto_123776 ?auto_123780 ) ) ( not ( = ?auto_123776 ?auto_123777 ) ) ( not ( = ?auto_123776 ?auto_123782 ) ) ( not ( = ?auto_123780 ?auto_123777 ) ) ( not ( = ?auto_123780 ?auto_123782 ) ) ( not ( = ?auto_123777 ?auto_123782 ) ) ( ON ?auto_123777 ?auto_123780 ) ( not ( = ?auto_123778 ?auto_123781 ) ) ( not ( = ?auto_123778 ?auto_123779 ) ) ( not ( = ?auto_123778 ?auto_123783 ) ) ( not ( = ?auto_123778 ?auto_123782 ) ) ( not ( = ?auto_123781 ?auto_123779 ) ) ( not ( = ?auto_123781 ?auto_123783 ) ) ( not ( = ?auto_123781 ?auto_123782 ) ) ( not ( = ?auto_123779 ?auto_123783 ) ) ( not ( = ?auto_123779 ?auto_123782 ) ) ( not ( = ?auto_123783 ?auto_123782 ) ) ( not ( = ?auto_123776 ?auto_123783 ) ) ( not ( = ?auto_123776 ?auto_123778 ) ) ( not ( = ?auto_123776 ?auto_123781 ) ) ( not ( = ?auto_123776 ?auto_123779 ) ) ( not ( = ?auto_123780 ?auto_123783 ) ) ( not ( = ?auto_123780 ?auto_123778 ) ) ( not ( = ?auto_123780 ?auto_123781 ) ) ( not ( = ?auto_123780 ?auto_123779 ) ) ( not ( = ?auto_123777 ?auto_123783 ) ) ( not ( = ?auto_123777 ?auto_123778 ) ) ( not ( = ?auto_123777 ?auto_123781 ) ) ( not ( = ?auto_123777 ?auto_123779 ) ) ( ON ?auto_123782 ?auto_123777 ) ( ON ?auto_123783 ?auto_123782 ) ( ON ?auto_123779 ?auto_123783 ) ( ON ?auto_123781 ?auto_123779 ) ( ON ?auto_123778 ?auto_123781 ) ( CLEAR ?auto_123778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123776 ?auto_123780 ?auto_123777 ?auto_123782 ?auto_123783 ?auto_123779 ?auto_123781 )
      ( MAKE-1PILE ?auto_123776 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121615 - BLOCK
    )
    :vars
    (
      ?auto_121621 - BLOCK
      ?auto_121616 - BLOCK
      ?auto_121620 - BLOCK
      ?auto_121623 - BLOCK
      ?auto_121622 - BLOCK
      ?auto_121619 - BLOCK
      ?auto_121618 - BLOCK
      ?auto_121617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121621 ?auto_121615 ) ( ON-TABLE ?auto_121615 ) ( not ( = ?auto_121615 ?auto_121621 ) ) ( not ( = ?auto_121615 ?auto_121616 ) ) ( not ( = ?auto_121615 ?auto_121620 ) ) ( not ( = ?auto_121621 ?auto_121616 ) ) ( not ( = ?auto_121621 ?auto_121620 ) ) ( not ( = ?auto_121616 ?auto_121620 ) ) ( ON ?auto_121616 ?auto_121621 ) ( not ( = ?auto_121623 ?auto_121622 ) ) ( not ( = ?auto_121623 ?auto_121619 ) ) ( not ( = ?auto_121623 ?auto_121618 ) ) ( not ( = ?auto_121623 ?auto_121617 ) ) ( not ( = ?auto_121623 ?auto_121620 ) ) ( not ( = ?auto_121622 ?auto_121619 ) ) ( not ( = ?auto_121622 ?auto_121618 ) ) ( not ( = ?auto_121622 ?auto_121617 ) ) ( not ( = ?auto_121622 ?auto_121620 ) ) ( not ( = ?auto_121619 ?auto_121618 ) ) ( not ( = ?auto_121619 ?auto_121617 ) ) ( not ( = ?auto_121619 ?auto_121620 ) ) ( not ( = ?auto_121618 ?auto_121617 ) ) ( not ( = ?auto_121618 ?auto_121620 ) ) ( not ( = ?auto_121617 ?auto_121620 ) ) ( not ( = ?auto_121615 ?auto_121617 ) ) ( not ( = ?auto_121615 ?auto_121623 ) ) ( not ( = ?auto_121615 ?auto_121622 ) ) ( not ( = ?auto_121615 ?auto_121619 ) ) ( not ( = ?auto_121615 ?auto_121618 ) ) ( not ( = ?auto_121621 ?auto_121617 ) ) ( not ( = ?auto_121621 ?auto_121623 ) ) ( not ( = ?auto_121621 ?auto_121622 ) ) ( not ( = ?auto_121621 ?auto_121619 ) ) ( not ( = ?auto_121621 ?auto_121618 ) ) ( not ( = ?auto_121616 ?auto_121617 ) ) ( not ( = ?auto_121616 ?auto_121623 ) ) ( not ( = ?auto_121616 ?auto_121622 ) ) ( not ( = ?auto_121616 ?auto_121619 ) ) ( not ( = ?auto_121616 ?auto_121618 ) ) ( ON ?auto_121620 ?auto_121616 ) ( ON ?auto_121617 ?auto_121620 ) ( ON ?auto_121618 ?auto_121617 ) ( ON ?auto_121619 ?auto_121618 ) ( ON ?auto_121622 ?auto_121619 ) ( CLEAR ?auto_121622 ) ( HOLDING ?auto_121623 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121623 )
      ( MAKE-1PILE ?auto_121615 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121624 - BLOCK
    )
    :vars
    (
      ?auto_121631 - BLOCK
      ?auto_121626 - BLOCK
      ?auto_121632 - BLOCK
      ?auto_121627 - BLOCK
      ?auto_121630 - BLOCK
      ?auto_121628 - BLOCK
      ?auto_121629 - BLOCK
      ?auto_121625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121631 ?auto_121624 ) ( ON-TABLE ?auto_121624 ) ( not ( = ?auto_121624 ?auto_121631 ) ) ( not ( = ?auto_121624 ?auto_121626 ) ) ( not ( = ?auto_121624 ?auto_121632 ) ) ( not ( = ?auto_121631 ?auto_121626 ) ) ( not ( = ?auto_121631 ?auto_121632 ) ) ( not ( = ?auto_121626 ?auto_121632 ) ) ( ON ?auto_121626 ?auto_121631 ) ( not ( = ?auto_121627 ?auto_121630 ) ) ( not ( = ?auto_121627 ?auto_121628 ) ) ( not ( = ?auto_121627 ?auto_121629 ) ) ( not ( = ?auto_121627 ?auto_121625 ) ) ( not ( = ?auto_121627 ?auto_121632 ) ) ( not ( = ?auto_121630 ?auto_121628 ) ) ( not ( = ?auto_121630 ?auto_121629 ) ) ( not ( = ?auto_121630 ?auto_121625 ) ) ( not ( = ?auto_121630 ?auto_121632 ) ) ( not ( = ?auto_121628 ?auto_121629 ) ) ( not ( = ?auto_121628 ?auto_121625 ) ) ( not ( = ?auto_121628 ?auto_121632 ) ) ( not ( = ?auto_121629 ?auto_121625 ) ) ( not ( = ?auto_121629 ?auto_121632 ) ) ( not ( = ?auto_121625 ?auto_121632 ) ) ( not ( = ?auto_121624 ?auto_121625 ) ) ( not ( = ?auto_121624 ?auto_121627 ) ) ( not ( = ?auto_121624 ?auto_121630 ) ) ( not ( = ?auto_121624 ?auto_121628 ) ) ( not ( = ?auto_121624 ?auto_121629 ) ) ( not ( = ?auto_121631 ?auto_121625 ) ) ( not ( = ?auto_121631 ?auto_121627 ) ) ( not ( = ?auto_121631 ?auto_121630 ) ) ( not ( = ?auto_121631 ?auto_121628 ) ) ( not ( = ?auto_121631 ?auto_121629 ) ) ( not ( = ?auto_121626 ?auto_121625 ) ) ( not ( = ?auto_121626 ?auto_121627 ) ) ( not ( = ?auto_121626 ?auto_121630 ) ) ( not ( = ?auto_121626 ?auto_121628 ) ) ( not ( = ?auto_121626 ?auto_121629 ) ) ( ON ?auto_121632 ?auto_121626 ) ( ON ?auto_121625 ?auto_121632 ) ( ON ?auto_121629 ?auto_121625 ) ( ON ?auto_121628 ?auto_121629 ) ( ON ?auto_121630 ?auto_121628 ) ( ON ?auto_121627 ?auto_121630 ) ( CLEAR ?auto_121627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_121624 ?auto_121631 ?auto_121626 ?auto_121632 ?auto_121625 ?auto_121629 ?auto_121628 ?auto_121630 )
      ( MAKE-1PILE ?auto_121624 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_121641 - BLOCK
      ?auto_121642 - BLOCK
      ?auto_121643 - BLOCK
      ?auto_121644 - BLOCK
      ?auto_121645 - BLOCK
      ?auto_121646 - BLOCK
      ?auto_121647 - BLOCK
      ?auto_121648 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_121648 ) ( CLEAR ?auto_121647 ) ( ON-TABLE ?auto_121641 ) ( ON ?auto_121642 ?auto_121641 ) ( ON ?auto_121643 ?auto_121642 ) ( ON ?auto_121644 ?auto_121643 ) ( ON ?auto_121645 ?auto_121644 ) ( ON ?auto_121646 ?auto_121645 ) ( ON ?auto_121647 ?auto_121646 ) ( not ( = ?auto_121641 ?auto_121642 ) ) ( not ( = ?auto_121641 ?auto_121643 ) ) ( not ( = ?auto_121641 ?auto_121644 ) ) ( not ( = ?auto_121641 ?auto_121645 ) ) ( not ( = ?auto_121641 ?auto_121646 ) ) ( not ( = ?auto_121641 ?auto_121647 ) ) ( not ( = ?auto_121641 ?auto_121648 ) ) ( not ( = ?auto_121642 ?auto_121643 ) ) ( not ( = ?auto_121642 ?auto_121644 ) ) ( not ( = ?auto_121642 ?auto_121645 ) ) ( not ( = ?auto_121642 ?auto_121646 ) ) ( not ( = ?auto_121642 ?auto_121647 ) ) ( not ( = ?auto_121642 ?auto_121648 ) ) ( not ( = ?auto_121643 ?auto_121644 ) ) ( not ( = ?auto_121643 ?auto_121645 ) ) ( not ( = ?auto_121643 ?auto_121646 ) ) ( not ( = ?auto_121643 ?auto_121647 ) ) ( not ( = ?auto_121643 ?auto_121648 ) ) ( not ( = ?auto_121644 ?auto_121645 ) ) ( not ( = ?auto_121644 ?auto_121646 ) ) ( not ( = ?auto_121644 ?auto_121647 ) ) ( not ( = ?auto_121644 ?auto_121648 ) ) ( not ( = ?auto_121645 ?auto_121646 ) ) ( not ( = ?auto_121645 ?auto_121647 ) ) ( not ( = ?auto_121645 ?auto_121648 ) ) ( not ( = ?auto_121646 ?auto_121647 ) ) ( not ( = ?auto_121646 ?auto_121648 ) ) ( not ( = ?auto_121647 ?auto_121648 ) ) )
    :subtasks
    ( ( !STACK ?auto_121648 ?auto_121647 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_121649 - BLOCK
      ?auto_121650 - BLOCK
      ?auto_121651 - BLOCK
      ?auto_121652 - BLOCK
      ?auto_121653 - BLOCK
      ?auto_121654 - BLOCK
      ?auto_121655 - BLOCK
      ?auto_121656 - BLOCK
    )
    :vars
    (
      ?auto_121657 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_121655 ) ( ON-TABLE ?auto_121649 ) ( ON ?auto_121650 ?auto_121649 ) ( ON ?auto_121651 ?auto_121650 ) ( ON ?auto_121652 ?auto_121651 ) ( ON ?auto_121653 ?auto_121652 ) ( ON ?auto_121654 ?auto_121653 ) ( ON ?auto_121655 ?auto_121654 ) ( not ( = ?auto_121649 ?auto_121650 ) ) ( not ( = ?auto_121649 ?auto_121651 ) ) ( not ( = ?auto_121649 ?auto_121652 ) ) ( not ( = ?auto_121649 ?auto_121653 ) ) ( not ( = ?auto_121649 ?auto_121654 ) ) ( not ( = ?auto_121649 ?auto_121655 ) ) ( not ( = ?auto_121649 ?auto_121656 ) ) ( not ( = ?auto_121650 ?auto_121651 ) ) ( not ( = ?auto_121650 ?auto_121652 ) ) ( not ( = ?auto_121650 ?auto_121653 ) ) ( not ( = ?auto_121650 ?auto_121654 ) ) ( not ( = ?auto_121650 ?auto_121655 ) ) ( not ( = ?auto_121650 ?auto_121656 ) ) ( not ( = ?auto_121651 ?auto_121652 ) ) ( not ( = ?auto_121651 ?auto_121653 ) ) ( not ( = ?auto_121651 ?auto_121654 ) ) ( not ( = ?auto_121651 ?auto_121655 ) ) ( not ( = ?auto_121651 ?auto_121656 ) ) ( not ( = ?auto_121652 ?auto_121653 ) ) ( not ( = ?auto_121652 ?auto_121654 ) ) ( not ( = ?auto_121652 ?auto_121655 ) ) ( not ( = ?auto_121652 ?auto_121656 ) ) ( not ( = ?auto_121653 ?auto_121654 ) ) ( not ( = ?auto_121653 ?auto_121655 ) ) ( not ( = ?auto_121653 ?auto_121656 ) ) ( not ( = ?auto_121654 ?auto_121655 ) ) ( not ( = ?auto_121654 ?auto_121656 ) ) ( not ( = ?auto_121655 ?auto_121656 ) ) ( ON ?auto_121656 ?auto_121657 ) ( CLEAR ?auto_121656 ) ( HAND-EMPTY ) ( not ( = ?auto_121649 ?auto_121657 ) ) ( not ( = ?auto_121650 ?auto_121657 ) ) ( not ( = ?auto_121651 ?auto_121657 ) ) ( not ( = ?auto_121652 ?auto_121657 ) ) ( not ( = ?auto_121653 ?auto_121657 ) ) ( not ( = ?auto_121654 ?auto_121657 ) ) ( not ( = ?auto_121655 ?auto_121657 ) ) ( not ( = ?auto_121656 ?auto_121657 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121656 ?auto_121657 )
      ( MAKE-8PILE ?auto_121649 ?auto_121650 ?auto_121651 ?auto_121652 ?auto_121653 ?auto_121654 ?auto_121655 ?auto_121656 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_121658 - BLOCK
      ?auto_121659 - BLOCK
      ?auto_121660 - BLOCK
      ?auto_121661 - BLOCK
      ?auto_121662 - BLOCK
      ?auto_121663 - BLOCK
      ?auto_121664 - BLOCK
      ?auto_121665 - BLOCK
    )
    :vars
    (
      ?auto_121666 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121658 ) ( ON ?auto_121659 ?auto_121658 ) ( ON ?auto_121660 ?auto_121659 ) ( ON ?auto_121661 ?auto_121660 ) ( ON ?auto_121662 ?auto_121661 ) ( ON ?auto_121663 ?auto_121662 ) ( not ( = ?auto_121658 ?auto_121659 ) ) ( not ( = ?auto_121658 ?auto_121660 ) ) ( not ( = ?auto_121658 ?auto_121661 ) ) ( not ( = ?auto_121658 ?auto_121662 ) ) ( not ( = ?auto_121658 ?auto_121663 ) ) ( not ( = ?auto_121658 ?auto_121664 ) ) ( not ( = ?auto_121658 ?auto_121665 ) ) ( not ( = ?auto_121659 ?auto_121660 ) ) ( not ( = ?auto_121659 ?auto_121661 ) ) ( not ( = ?auto_121659 ?auto_121662 ) ) ( not ( = ?auto_121659 ?auto_121663 ) ) ( not ( = ?auto_121659 ?auto_121664 ) ) ( not ( = ?auto_121659 ?auto_121665 ) ) ( not ( = ?auto_121660 ?auto_121661 ) ) ( not ( = ?auto_121660 ?auto_121662 ) ) ( not ( = ?auto_121660 ?auto_121663 ) ) ( not ( = ?auto_121660 ?auto_121664 ) ) ( not ( = ?auto_121660 ?auto_121665 ) ) ( not ( = ?auto_121661 ?auto_121662 ) ) ( not ( = ?auto_121661 ?auto_121663 ) ) ( not ( = ?auto_121661 ?auto_121664 ) ) ( not ( = ?auto_121661 ?auto_121665 ) ) ( not ( = ?auto_121662 ?auto_121663 ) ) ( not ( = ?auto_121662 ?auto_121664 ) ) ( not ( = ?auto_121662 ?auto_121665 ) ) ( not ( = ?auto_121663 ?auto_121664 ) ) ( not ( = ?auto_121663 ?auto_121665 ) ) ( not ( = ?auto_121664 ?auto_121665 ) ) ( ON ?auto_121665 ?auto_121666 ) ( CLEAR ?auto_121665 ) ( not ( = ?auto_121658 ?auto_121666 ) ) ( not ( = ?auto_121659 ?auto_121666 ) ) ( not ( = ?auto_121660 ?auto_121666 ) ) ( not ( = ?auto_121661 ?auto_121666 ) ) ( not ( = ?auto_121662 ?auto_121666 ) ) ( not ( = ?auto_121663 ?auto_121666 ) ) ( not ( = ?auto_121664 ?auto_121666 ) ) ( not ( = ?auto_121665 ?auto_121666 ) ) ( HOLDING ?auto_121664 ) ( CLEAR ?auto_121663 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_121658 ?auto_121659 ?auto_121660 ?auto_121661 ?auto_121662 ?auto_121663 ?auto_121664 )
      ( MAKE-8PILE ?auto_121658 ?auto_121659 ?auto_121660 ?auto_121661 ?auto_121662 ?auto_121663 ?auto_121664 ?auto_121665 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_121667 - BLOCK
      ?auto_121668 - BLOCK
      ?auto_121669 - BLOCK
      ?auto_121670 - BLOCK
      ?auto_121671 - BLOCK
      ?auto_121672 - BLOCK
      ?auto_121673 - BLOCK
      ?auto_121674 - BLOCK
    )
    :vars
    (
      ?auto_121675 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121667 ) ( ON ?auto_121668 ?auto_121667 ) ( ON ?auto_121669 ?auto_121668 ) ( ON ?auto_121670 ?auto_121669 ) ( ON ?auto_121671 ?auto_121670 ) ( ON ?auto_121672 ?auto_121671 ) ( not ( = ?auto_121667 ?auto_121668 ) ) ( not ( = ?auto_121667 ?auto_121669 ) ) ( not ( = ?auto_121667 ?auto_121670 ) ) ( not ( = ?auto_121667 ?auto_121671 ) ) ( not ( = ?auto_121667 ?auto_121672 ) ) ( not ( = ?auto_121667 ?auto_121673 ) ) ( not ( = ?auto_121667 ?auto_121674 ) ) ( not ( = ?auto_121668 ?auto_121669 ) ) ( not ( = ?auto_121668 ?auto_121670 ) ) ( not ( = ?auto_121668 ?auto_121671 ) ) ( not ( = ?auto_121668 ?auto_121672 ) ) ( not ( = ?auto_121668 ?auto_121673 ) ) ( not ( = ?auto_121668 ?auto_121674 ) ) ( not ( = ?auto_121669 ?auto_121670 ) ) ( not ( = ?auto_121669 ?auto_121671 ) ) ( not ( = ?auto_121669 ?auto_121672 ) ) ( not ( = ?auto_121669 ?auto_121673 ) ) ( not ( = ?auto_121669 ?auto_121674 ) ) ( not ( = ?auto_121670 ?auto_121671 ) ) ( not ( = ?auto_121670 ?auto_121672 ) ) ( not ( = ?auto_121670 ?auto_121673 ) ) ( not ( = ?auto_121670 ?auto_121674 ) ) ( not ( = ?auto_121671 ?auto_121672 ) ) ( not ( = ?auto_121671 ?auto_121673 ) ) ( not ( = ?auto_121671 ?auto_121674 ) ) ( not ( = ?auto_121672 ?auto_121673 ) ) ( not ( = ?auto_121672 ?auto_121674 ) ) ( not ( = ?auto_121673 ?auto_121674 ) ) ( ON ?auto_121674 ?auto_121675 ) ( not ( = ?auto_121667 ?auto_121675 ) ) ( not ( = ?auto_121668 ?auto_121675 ) ) ( not ( = ?auto_121669 ?auto_121675 ) ) ( not ( = ?auto_121670 ?auto_121675 ) ) ( not ( = ?auto_121671 ?auto_121675 ) ) ( not ( = ?auto_121672 ?auto_121675 ) ) ( not ( = ?auto_121673 ?auto_121675 ) ) ( not ( = ?auto_121674 ?auto_121675 ) ) ( CLEAR ?auto_121672 ) ( ON ?auto_121673 ?auto_121674 ) ( CLEAR ?auto_121673 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121675 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121675 ?auto_121674 )
      ( MAKE-8PILE ?auto_121667 ?auto_121668 ?auto_121669 ?auto_121670 ?auto_121671 ?auto_121672 ?auto_121673 ?auto_121674 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_121676 - BLOCK
      ?auto_121677 - BLOCK
      ?auto_121678 - BLOCK
      ?auto_121679 - BLOCK
      ?auto_121680 - BLOCK
      ?auto_121681 - BLOCK
      ?auto_121682 - BLOCK
      ?auto_121683 - BLOCK
    )
    :vars
    (
      ?auto_121684 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121676 ) ( ON ?auto_121677 ?auto_121676 ) ( ON ?auto_121678 ?auto_121677 ) ( ON ?auto_121679 ?auto_121678 ) ( ON ?auto_121680 ?auto_121679 ) ( not ( = ?auto_121676 ?auto_121677 ) ) ( not ( = ?auto_121676 ?auto_121678 ) ) ( not ( = ?auto_121676 ?auto_121679 ) ) ( not ( = ?auto_121676 ?auto_121680 ) ) ( not ( = ?auto_121676 ?auto_121681 ) ) ( not ( = ?auto_121676 ?auto_121682 ) ) ( not ( = ?auto_121676 ?auto_121683 ) ) ( not ( = ?auto_121677 ?auto_121678 ) ) ( not ( = ?auto_121677 ?auto_121679 ) ) ( not ( = ?auto_121677 ?auto_121680 ) ) ( not ( = ?auto_121677 ?auto_121681 ) ) ( not ( = ?auto_121677 ?auto_121682 ) ) ( not ( = ?auto_121677 ?auto_121683 ) ) ( not ( = ?auto_121678 ?auto_121679 ) ) ( not ( = ?auto_121678 ?auto_121680 ) ) ( not ( = ?auto_121678 ?auto_121681 ) ) ( not ( = ?auto_121678 ?auto_121682 ) ) ( not ( = ?auto_121678 ?auto_121683 ) ) ( not ( = ?auto_121679 ?auto_121680 ) ) ( not ( = ?auto_121679 ?auto_121681 ) ) ( not ( = ?auto_121679 ?auto_121682 ) ) ( not ( = ?auto_121679 ?auto_121683 ) ) ( not ( = ?auto_121680 ?auto_121681 ) ) ( not ( = ?auto_121680 ?auto_121682 ) ) ( not ( = ?auto_121680 ?auto_121683 ) ) ( not ( = ?auto_121681 ?auto_121682 ) ) ( not ( = ?auto_121681 ?auto_121683 ) ) ( not ( = ?auto_121682 ?auto_121683 ) ) ( ON ?auto_121683 ?auto_121684 ) ( not ( = ?auto_121676 ?auto_121684 ) ) ( not ( = ?auto_121677 ?auto_121684 ) ) ( not ( = ?auto_121678 ?auto_121684 ) ) ( not ( = ?auto_121679 ?auto_121684 ) ) ( not ( = ?auto_121680 ?auto_121684 ) ) ( not ( = ?auto_121681 ?auto_121684 ) ) ( not ( = ?auto_121682 ?auto_121684 ) ) ( not ( = ?auto_121683 ?auto_121684 ) ) ( ON ?auto_121682 ?auto_121683 ) ( CLEAR ?auto_121682 ) ( ON-TABLE ?auto_121684 ) ( HOLDING ?auto_121681 ) ( CLEAR ?auto_121680 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121676 ?auto_121677 ?auto_121678 ?auto_121679 ?auto_121680 ?auto_121681 )
      ( MAKE-8PILE ?auto_121676 ?auto_121677 ?auto_121678 ?auto_121679 ?auto_121680 ?auto_121681 ?auto_121682 ?auto_121683 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_121685 - BLOCK
      ?auto_121686 - BLOCK
      ?auto_121687 - BLOCK
      ?auto_121688 - BLOCK
      ?auto_121689 - BLOCK
      ?auto_121690 - BLOCK
      ?auto_121691 - BLOCK
      ?auto_121692 - BLOCK
    )
    :vars
    (
      ?auto_121693 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121685 ) ( ON ?auto_121686 ?auto_121685 ) ( ON ?auto_121687 ?auto_121686 ) ( ON ?auto_121688 ?auto_121687 ) ( ON ?auto_121689 ?auto_121688 ) ( not ( = ?auto_121685 ?auto_121686 ) ) ( not ( = ?auto_121685 ?auto_121687 ) ) ( not ( = ?auto_121685 ?auto_121688 ) ) ( not ( = ?auto_121685 ?auto_121689 ) ) ( not ( = ?auto_121685 ?auto_121690 ) ) ( not ( = ?auto_121685 ?auto_121691 ) ) ( not ( = ?auto_121685 ?auto_121692 ) ) ( not ( = ?auto_121686 ?auto_121687 ) ) ( not ( = ?auto_121686 ?auto_121688 ) ) ( not ( = ?auto_121686 ?auto_121689 ) ) ( not ( = ?auto_121686 ?auto_121690 ) ) ( not ( = ?auto_121686 ?auto_121691 ) ) ( not ( = ?auto_121686 ?auto_121692 ) ) ( not ( = ?auto_121687 ?auto_121688 ) ) ( not ( = ?auto_121687 ?auto_121689 ) ) ( not ( = ?auto_121687 ?auto_121690 ) ) ( not ( = ?auto_121687 ?auto_121691 ) ) ( not ( = ?auto_121687 ?auto_121692 ) ) ( not ( = ?auto_121688 ?auto_121689 ) ) ( not ( = ?auto_121688 ?auto_121690 ) ) ( not ( = ?auto_121688 ?auto_121691 ) ) ( not ( = ?auto_121688 ?auto_121692 ) ) ( not ( = ?auto_121689 ?auto_121690 ) ) ( not ( = ?auto_121689 ?auto_121691 ) ) ( not ( = ?auto_121689 ?auto_121692 ) ) ( not ( = ?auto_121690 ?auto_121691 ) ) ( not ( = ?auto_121690 ?auto_121692 ) ) ( not ( = ?auto_121691 ?auto_121692 ) ) ( ON ?auto_121692 ?auto_121693 ) ( not ( = ?auto_121685 ?auto_121693 ) ) ( not ( = ?auto_121686 ?auto_121693 ) ) ( not ( = ?auto_121687 ?auto_121693 ) ) ( not ( = ?auto_121688 ?auto_121693 ) ) ( not ( = ?auto_121689 ?auto_121693 ) ) ( not ( = ?auto_121690 ?auto_121693 ) ) ( not ( = ?auto_121691 ?auto_121693 ) ) ( not ( = ?auto_121692 ?auto_121693 ) ) ( ON ?auto_121691 ?auto_121692 ) ( ON-TABLE ?auto_121693 ) ( CLEAR ?auto_121689 ) ( ON ?auto_121690 ?auto_121691 ) ( CLEAR ?auto_121690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121693 ?auto_121692 ?auto_121691 )
      ( MAKE-8PILE ?auto_121685 ?auto_121686 ?auto_121687 ?auto_121688 ?auto_121689 ?auto_121690 ?auto_121691 ?auto_121692 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_121694 - BLOCK
      ?auto_121695 - BLOCK
      ?auto_121696 - BLOCK
      ?auto_121697 - BLOCK
      ?auto_121698 - BLOCK
      ?auto_121699 - BLOCK
      ?auto_121700 - BLOCK
      ?auto_121701 - BLOCK
    )
    :vars
    (
      ?auto_121702 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121694 ) ( ON ?auto_121695 ?auto_121694 ) ( ON ?auto_121696 ?auto_121695 ) ( ON ?auto_121697 ?auto_121696 ) ( not ( = ?auto_121694 ?auto_121695 ) ) ( not ( = ?auto_121694 ?auto_121696 ) ) ( not ( = ?auto_121694 ?auto_121697 ) ) ( not ( = ?auto_121694 ?auto_121698 ) ) ( not ( = ?auto_121694 ?auto_121699 ) ) ( not ( = ?auto_121694 ?auto_121700 ) ) ( not ( = ?auto_121694 ?auto_121701 ) ) ( not ( = ?auto_121695 ?auto_121696 ) ) ( not ( = ?auto_121695 ?auto_121697 ) ) ( not ( = ?auto_121695 ?auto_121698 ) ) ( not ( = ?auto_121695 ?auto_121699 ) ) ( not ( = ?auto_121695 ?auto_121700 ) ) ( not ( = ?auto_121695 ?auto_121701 ) ) ( not ( = ?auto_121696 ?auto_121697 ) ) ( not ( = ?auto_121696 ?auto_121698 ) ) ( not ( = ?auto_121696 ?auto_121699 ) ) ( not ( = ?auto_121696 ?auto_121700 ) ) ( not ( = ?auto_121696 ?auto_121701 ) ) ( not ( = ?auto_121697 ?auto_121698 ) ) ( not ( = ?auto_121697 ?auto_121699 ) ) ( not ( = ?auto_121697 ?auto_121700 ) ) ( not ( = ?auto_121697 ?auto_121701 ) ) ( not ( = ?auto_121698 ?auto_121699 ) ) ( not ( = ?auto_121698 ?auto_121700 ) ) ( not ( = ?auto_121698 ?auto_121701 ) ) ( not ( = ?auto_121699 ?auto_121700 ) ) ( not ( = ?auto_121699 ?auto_121701 ) ) ( not ( = ?auto_121700 ?auto_121701 ) ) ( ON ?auto_121701 ?auto_121702 ) ( not ( = ?auto_121694 ?auto_121702 ) ) ( not ( = ?auto_121695 ?auto_121702 ) ) ( not ( = ?auto_121696 ?auto_121702 ) ) ( not ( = ?auto_121697 ?auto_121702 ) ) ( not ( = ?auto_121698 ?auto_121702 ) ) ( not ( = ?auto_121699 ?auto_121702 ) ) ( not ( = ?auto_121700 ?auto_121702 ) ) ( not ( = ?auto_121701 ?auto_121702 ) ) ( ON ?auto_121700 ?auto_121701 ) ( ON-TABLE ?auto_121702 ) ( ON ?auto_121699 ?auto_121700 ) ( CLEAR ?auto_121699 ) ( HOLDING ?auto_121698 ) ( CLEAR ?auto_121697 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121694 ?auto_121695 ?auto_121696 ?auto_121697 ?auto_121698 )
      ( MAKE-8PILE ?auto_121694 ?auto_121695 ?auto_121696 ?auto_121697 ?auto_121698 ?auto_121699 ?auto_121700 ?auto_121701 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_121703 - BLOCK
      ?auto_121704 - BLOCK
      ?auto_121705 - BLOCK
      ?auto_121706 - BLOCK
      ?auto_121707 - BLOCK
      ?auto_121708 - BLOCK
      ?auto_121709 - BLOCK
      ?auto_121710 - BLOCK
    )
    :vars
    (
      ?auto_121711 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121703 ) ( ON ?auto_121704 ?auto_121703 ) ( ON ?auto_121705 ?auto_121704 ) ( ON ?auto_121706 ?auto_121705 ) ( not ( = ?auto_121703 ?auto_121704 ) ) ( not ( = ?auto_121703 ?auto_121705 ) ) ( not ( = ?auto_121703 ?auto_121706 ) ) ( not ( = ?auto_121703 ?auto_121707 ) ) ( not ( = ?auto_121703 ?auto_121708 ) ) ( not ( = ?auto_121703 ?auto_121709 ) ) ( not ( = ?auto_121703 ?auto_121710 ) ) ( not ( = ?auto_121704 ?auto_121705 ) ) ( not ( = ?auto_121704 ?auto_121706 ) ) ( not ( = ?auto_121704 ?auto_121707 ) ) ( not ( = ?auto_121704 ?auto_121708 ) ) ( not ( = ?auto_121704 ?auto_121709 ) ) ( not ( = ?auto_121704 ?auto_121710 ) ) ( not ( = ?auto_121705 ?auto_121706 ) ) ( not ( = ?auto_121705 ?auto_121707 ) ) ( not ( = ?auto_121705 ?auto_121708 ) ) ( not ( = ?auto_121705 ?auto_121709 ) ) ( not ( = ?auto_121705 ?auto_121710 ) ) ( not ( = ?auto_121706 ?auto_121707 ) ) ( not ( = ?auto_121706 ?auto_121708 ) ) ( not ( = ?auto_121706 ?auto_121709 ) ) ( not ( = ?auto_121706 ?auto_121710 ) ) ( not ( = ?auto_121707 ?auto_121708 ) ) ( not ( = ?auto_121707 ?auto_121709 ) ) ( not ( = ?auto_121707 ?auto_121710 ) ) ( not ( = ?auto_121708 ?auto_121709 ) ) ( not ( = ?auto_121708 ?auto_121710 ) ) ( not ( = ?auto_121709 ?auto_121710 ) ) ( ON ?auto_121710 ?auto_121711 ) ( not ( = ?auto_121703 ?auto_121711 ) ) ( not ( = ?auto_121704 ?auto_121711 ) ) ( not ( = ?auto_121705 ?auto_121711 ) ) ( not ( = ?auto_121706 ?auto_121711 ) ) ( not ( = ?auto_121707 ?auto_121711 ) ) ( not ( = ?auto_121708 ?auto_121711 ) ) ( not ( = ?auto_121709 ?auto_121711 ) ) ( not ( = ?auto_121710 ?auto_121711 ) ) ( ON ?auto_121709 ?auto_121710 ) ( ON-TABLE ?auto_121711 ) ( ON ?auto_121708 ?auto_121709 ) ( CLEAR ?auto_121706 ) ( ON ?auto_121707 ?auto_121708 ) ( CLEAR ?auto_121707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121711 ?auto_121710 ?auto_121709 ?auto_121708 )
      ( MAKE-8PILE ?auto_121703 ?auto_121704 ?auto_121705 ?auto_121706 ?auto_121707 ?auto_121708 ?auto_121709 ?auto_121710 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_121712 - BLOCK
      ?auto_121713 - BLOCK
      ?auto_121714 - BLOCK
      ?auto_121715 - BLOCK
      ?auto_121716 - BLOCK
      ?auto_121717 - BLOCK
      ?auto_121718 - BLOCK
      ?auto_121719 - BLOCK
    )
    :vars
    (
      ?auto_121720 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121712 ) ( ON ?auto_121713 ?auto_121712 ) ( ON ?auto_121714 ?auto_121713 ) ( not ( = ?auto_121712 ?auto_121713 ) ) ( not ( = ?auto_121712 ?auto_121714 ) ) ( not ( = ?auto_121712 ?auto_121715 ) ) ( not ( = ?auto_121712 ?auto_121716 ) ) ( not ( = ?auto_121712 ?auto_121717 ) ) ( not ( = ?auto_121712 ?auto_121718 ) ) ( not ( = ?auto_121712 ?auto_121719 ) ) ( not ( = ?auto_121713 ?auto_121714 ) ) ( not ( = ?auto_121713 ?auto_121715 ) ) ( not ( = ?auto_121713 ?auto_121716 ) ) ( not ( = ?auto_121713 ?auto_121717 ) ) ( not ( = ?auto_121713 ?auto_121718 ) ) ( not ( = ?auto_121713 ?auto_121719 ) ) ( not ( = ?auto_121714 ?auto_121715 ) ) ( not ( = ?auto_121714 ?auto_121716 ) ) ( not ( = ?auto_121714 ?auto_121717 ) ) ( not ( = ?auto_121714 ?auto_121718 ) ) ( not ( = ?auto_121714 ?auto_121719 ) ) ( not ( = ?auto_121715 ?auto_121716 ) ) ( not ( = ?auto_121715 ?auto_121717 ) ) ( not ( = ?auto_121715 ?auto_121718 ) ) ( not ( = ?auto_121715 ?auto_121719 ) ) ( not ( = ?auto_121716 ?auto_121717 ) ) ( not ( = ?auto_121716 ?auto_121718 ) ) ( not ( = ?auto_121716 ?auto_121719 ) ) ( not ( = ?auto_121717 ?auto_121718 ) ) ( not ( = ?auto_121717 ?auto_121719 ) ) ( not ( = ?auto_121718 ?auto_121719 ) ) ( ON ?auto_121719 ?auto_121720 ) ( not ( = ?auto_121712 ?auto_121720 ) ) ( not ( = ?auto_121713 ?auto_121720 ) ) ( not ( = ?auto_121714 ?auto_121720 ) ) ( not ( = ?auto_121715 ?auto_121720 ) ) ( not ( = ?auto_121716 ?auto_121720 ) ) ( not ( = ?auto_121717 ?auto_121720 ) ) ( not ( = ?auto_121718 ?auto_121720 ) ) ( not ( = ?auto_121719 ?auto_121720 ) ) ( ON ?auto_121718 ?auto_121719 ) ( ON-TABLE ?auto_121720 ) ( ON ?auto_121717 ?auto_121718 ) ( ON ?auto_121716 ?auto_121717 ) ( CLEAR ?auto_121716 ) ( HOLDING ?auto_121715 ) ( CLEAR ?auto_121714 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121712 ?auto_121713 ?auto_121714 ?auto_121715 )
      ( MAKE-8PILE ?auto_121712 ?auto_121713 ?auto_121714 ?auto_121715 ?auto_121716 ?auto_121717 ?auto_121718 ?auto_121719 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_121721 - BLOCK
      ?auto_121722 - BLOCK
      ?auto_121723 - BLOCK
      ?auto_121724 - BLOCK
      ?auto_121725 - BLOCK
      ?auto_121726 - BLOCK
      ?auto_121727 - BLOCK
      ?auto_121728 - BLOCK
    )
    :vars
    (
      ?auto_121729 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121721 ) ( ON ?auto_121722 ?auto_121721 ) ( ON ?auto_121723 ?auto_121722 ) ( not ( = ?auto_121721 ?auto_121722 ) ) ( not ( = ?auto_121721 ?auto_121723 ) ) ( not ( = ?auto_121721 ?auto_121724 ) ) ( not ( = ?auto_121721 ?auto_121725 ) ) ( not ( = ?auto_121721 ?auto_121726 ) ) ( not ( = ?auto_121721 ?auto_121727 ) ) ( not ( = ?auto_121721 ?auto_121728 ) ) ( not ( = ?auto_121722 ?auto_121723 ) ) ( not ( = ?auto_121722 ?auto_121724 ) ) ( not ( = ?auto_121722 ?auto_121725 ) ) ( not ( = ?auto_121722 ?auto_121726 ) ) ( not ( = ?auto_121722 ?auto_121727 ) ) ( not ( = ?auto_121722 ?auto_121728 ) ) ( not ( = ?auto_121723 ?auto_121724 ) ) ( not ( = ?auto_121723 ?auto_121725 ) ) ( not ( = ?auto_121723 ?auto_121726 ) ) ( not ( = ?auto_121723 ?auto_121727 ) ) ( not ( = ?auto_121723 ?auto_121728 ) ) ( not ( = ?auto_121724 ?auto_121725 ) ) ( not ( = ?auto_121724 ?auto_121726 ) ) ( not ( = ?auto_121724 ?auto_121727 ) ) ( not ( = ?auto_121724 ?auto_121728 ) ) ( not ( = ?auto_121725 ?auto_121726 ) ) ( not ( = ?auto_121725 ?auto_121727 ) ) ( not ( = ?auto_121725 ?auto_121728 ) ) ( not ( = ?auto_121726 ?auto_121727 ) ) ( not ( = ?auto_121726 ?auto_121728 ) ) ( not ( = ?auto_121727 ?auto_121728 ) ) ( ON ?auto_121728 ?auto_121729 ) ( not ( = ?auto_121721 ?auto_121729 ) ) ( not ( = ?auto_121722 ?auto_121729 ) ) ( not ( = ?auto_121723 ?auto_121729 ) ) ( not ( = ?auto_121724 ?auto_121729 ) ) ( not ( = ?auto_121725 ?auto_121729 ) ) ( not ( = ?auto_121726 ?auto_121729 ) ) ( not ( = ?auto_121727 ?auto_121729 ) ) ( not ( = ?auto_121728 ?auto_121729 ) ) ( ON ?auto_121727 ?auto_121728 ) ( ON-TABLE ?auto_121729 ) ( ON ?auto_121726 ?auto_121727 ) ( ON ?auto_121725 ?auto_121726 ) ( CLEAR ?auto_121723 ) ( ON ?auto_121724 ?auto_121725 ) ( CLEAR ?auto_121724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121729 ?auto_121728 ?auto_121727 ?auto_121726 ?auto_121725 )
      ( MAKE-8PILE ?auto_121721 ?auto_121722 ?auto_121723 ?auto_121724 ?auto_121725 ?auto_121726 ?auto_121727 ?auto_121728 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_121730 - BLOCK
      ?auto_121731 - BLOCK
      ?auto_121732 - BLOCK
      ?auto_121733 - BLOCK
      ?auto_121734 - BLOCK
      ?auto_121735 - BLOCK
      ?auto_121736 - BLOCK
      ?auto_121737 - BLOCK
    )
    :vars
    (
      ?auto_121738 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121730 ) ( ON ?auto_121731 ?auto_121730 ) ( not ( = ?auto_121730 ?auto_121731 ) ) ( not ( = ?auto_121730 ?auto_121732 ) ) ( not ( = ?auto_121730 ?auto_121733 ) ) ( not ( = ?auto_121730 ?auto_121734 ) ) ( not ( = ?auto_121730 ?auto_121735 ) ) ( not ( = ?auto_121730 ?auto_121736 ) ) ( not ( = ?auto_121730 ?auto_121737 ) ) ( not ( = ?auto_121731 ?auto_121732 ) ) ( not ( = ?auto_121731 ?auto_121733 ) ) ( not ( = ?auto_121731 ?auto_121734 ) ) ( not ( = ?auto_121731 ?auto_121735 ) ) ( not ( = ?auto_121731 ?auto_121736 ) ) ( not ( = ?auto_121731 ?auto_121737 ) ) ( not ( = ?auto_121732 ?auto_121733 ) ) ( not ( = ?auto_121732 ?auto_121734 ) ) ( not ( = ?auto_121732 ?auto_121735 ) ) ( not ( = ?auto_121732 ?auto_121736 ) ) ( not ( = ?auto_121732 ?auto_121737 ) ) ( not ( = ?auto_121733 ?auto_121734 ) ) ( not ( = ?auto_121733 ?auto_121735 ) ) ( not ( = ?auto_121733 ?auto_121736 ) ) ( not ( = ?auto_121733 ?auto_121737 ) ) ( not ( = ?auto_121734 ?auto_121735 ) ) ( not ( = ?auto_121734 ?auto_121736 ) ) ( not ( = ?auto_121734 ?auto_121737 ) ) ( not ( = ?auto_121735 ?auto_121736 ) ) ( not ( = ?auto_121735 ?auto_121737 ) ) ( not ( = ?auto_121736 ?auto_121737 ) ) ( ON ?auto_121737 ?auto_121738 ) ( not ( = ?auto_121730 ?auto_121738 ) ) ( not ( = ?auto_121731 ?auto_121738 ) ) ( not ( = ?auto_121732 ?auto_121738 ) ) ( not ( = ?auto_121733 ?auto_121738 ) ) ( not ( = ?auto_121734 ?auto_121738 ) ) ( not ( = ?auto_121735 ?auto_121738 ) ) ( not ( = ?auto_121736 ?auto_121738 ) ) ( not ( = ?auto_121737 ?auto_121738 ) ) ( ON ?auto_121736 ?auto_121737 ) ( ON-TABLE ?auto_121738 ) ( ON ?auto_121735 ?auto_121736 ) ( ON ?auto_121734 ?auto_121735 ) ( ON ?auto_121733 ?auto_121734 ) ( CLEAR ?auto_121733 ) ( HOLDING ?auto_121732 ) ( CLEAR ?auto_121731 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121730 ?auto_121731 ?auto_121732 )
      ( MAKE-8PILE ?auto_121730 ?auto_121731 ?auto_121732 ?auto_121733 ?auto_121734 ?auto_121735 ?auto_121736 ?auto_121737 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_121739 - BLOCK
      ?auto_121740 - BLOCK
      ?auto_121741 - BLOCK
      ?auto_121742 - BLOCK
      ?auto_121743 - BLOCK
      ?auto_121744 - BLOCK
      ?auto_121745 - BLOCK
      ?auto_121746 - BLOCK
    )
    :vars
    (
      ?auto_121747 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121739 ) ( ON ?auto_121740 ?auto_121739 ) ( not ( = ?auto_121739 ?auto_121740 ) ) ( not ( = ?auto_121739 ?auto_121741 ) ) ( not ( = ?auto_121739 ?auto_121742 ) ) ( not ( = ?auto_121739 ?auto_121743 ) ) ( not ( = ?auto_121739 ?auto_121744 ) ) ( not ( = ?auto_121739 ?auto_121745 ) ) ( not ( = ?auto_121739 ?auto_121746 ) ) ( not ( = ?auto_121740 ?auto_121741 ) ) ( not ( = ?auto_121740 ?auto_121742 ) ) ( not ( = ?auto_121740 ?auto_121743 ) ) ( not ( = ?auto_121740 ?auto_121744 ) ) ( not ( = ?auto_121740 ?auto_121745 ) ) ( not ( = ?auto_121740 ?auto_121746 ) ) ( not ( = ?auto_121741 ?auto_121742 ) ) ( not ( = ?auto_121741 ?auto_121743 ) ) ( not ( = ?auto_121741 ?auto_121744 ) ) ( not ( = ?auto_121741 ?auto_121745 ) ) ( not ( = ?auto_121741 ?auto_121746 ) ) ( not ( = ?auto_121742 ?auto_121743 ) ) ( not ( = ?auto_121742 ?auto_121744 ) ) ( not ( = ?auto_121742 ?auto_121745 ) ) ( not ( = ?auto_121742 ?auto_121746 ) ) ( not ( = ?auto_121743 ?auto_121744 ) ) ( not ( = ?auto_121743 ?auto_121745 ) ) ( not ( = ?auto_121743 ?auto_121746 ) ) ( not ( = ?auto_121744 ?auto_121745 ) ) ( not ( = ?auto_121744 ?auto_121746 ) ) ( not ( = ?auto_121745 ?auto_121746 ) ) ( ON ?auto_121746 ?auto_121747 ) ( not ( = ?auto_121739 ?auto_121747 ) ) ( not ( = ?auto_121740 ?auto_121747 ) ) ( not ( = ?auto_121741 ?auto_121747 ) ) ( not ( = ?auto_121742 ?auto_121747 ) ) ( not ( = ?auto_121743 ?auto_121747 ) ) ( not ( = ?auto_121744 ?auto_121747 ) ) ( not ( = ?auto_121745 ?auto_121747 ) ) ( not ( = ?auto_121746 ?auto_121747 ) ) ( ON ?auto_121745 ?auto_121746 ) ( ON-TABLE ?auto_121747 ) ( ON ?auto_121744 ?auto_121745 ) ( ON ?auto_121743 ?auto_121744 ) ( ON ?auto_121742 ?auto_121743 ) ( CLEAR ?auto_121740 ) ( ON ?auto_121741 ?auto_121742 ) ( CLEAR ?auto_121741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121747 ?auto_121746 ?auto_121745 ?auto_121744 ?auto_121743 ?auto_121742 )
      ( MAKE-8PILE ?auto_121739 ?auto_121740 ?auto_121741 ?auto_121742 ?auto_121743 ?auto_121744 ?auto_121745 ?auto_121746 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_121748 - BLOCK
      ?auto_121749 - BLOCK
      ?auto_121750 - BLOCK
      ?auto_121751 - BLOCK
      ?auto_121752 - BLOCK
      ?auto_121753 - BLOCK
      ?auto_121754 - BLOCK
      ?auto_121755 - BLOCK
    )
    :vars
    (
      ?auto_121756 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121748 ) ( not ( = ?auto_121748 ?auto_121749 ) ) ( not ( = ?auto_121748 ?auto_121750 ) ) ( not ( = ?auto_121748 ?auto_121751 ) ) ( not ( = ?auto_121748 ?auto_121752 ) ) ( not ( = ?auto_121748 ?auto_121753 ) ) ( not ( = ?auto_121748 ?auto_121754 ) ) ( not ( = ?auto_121748 ?auto_121755 ) ) ( not ( = ?auto_121749 ?auto_121750 ) ) ( not ( = ?auto_121749 ?auto_121751 ) ) ( not ( = ?auto_121749 ?auto_121752 ) ) ( not ( = ?auto_121749 ?auto_121753 ) ) ( not ( = ?auto_121749 ?auto_121754 ) ) ( not ( = ?auto_121749 ?auto_121755 ) ) ( not ( = ?auto_121750 ?auto_121751 ) ) ( not ( = ?auto_121750 ?auto_121752 ) ) ( not ( = ?auto_121750 ?auto_121753 ) ) ( not ( = ?auto_121750 ?auto_121754 ) ) ( not ( = ?auto_121750 ?auto_121755 ) ) ( not ( = ?auto_121751 ?auto_121752 ) ) ( not ( = ?auto_121751 ?auto_121753 ) ) ( not ( = ?auto_121751 ?auto_121754 ) ) ( not ( = ?auto_121751 ?auto_121755 ) ) ( not ( = ?auto_121752 ?auto_121753 ) ) ( not ( = ?auto_121752 ?auto_121754 ) ) ( not ( = ?auto_121752 ?auto_121755 ) ) ( not ( = ?auto_121753 ?auto_121754 ) ) ( not ( = ?auto_121753 ?auto_121755 ) ) ( not ( = ?auto_121754 ?auto_121755 ) ) ( ON ?auto_121755 ?auto_121756 ) ( not ( = ?auto_121748 ?auto_121756 ) ) ( not ( = ?auto_121749 ?auto_121756 ) ) ( not ( = ?auto_121750 ?auto_121756 ) ) ( not ( = ?auto_121751 ?auto_121756 ) ) ( not ( = ?auto_121752 ?auto_121756 ) ) ( not ( = ?auto_121753 ?auto_121756 ) ) ( not ( = ?auto_121754 ?auto_121756 ) ) ( not ( = ?auto_121755 ?auto_121756 ) ) ( ON ?auto_121754 ?auto_121755 ) ( ON-TABLE ?auto_121756 ) ( ON ?auto_121753 ?auto_121754 ) ( ON ?auto_121752 ?auto_121753 ) ( ON ?auto_121751 ?auto_121752 ) ( ON ?auto_121750 ?auto_121751 ) ( CLEAR ?auto_121750 ) ( HOLDING ?auto_121749 ) ( CLEAR ?auto_121748 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121748 ?auto_121749 )
      ( MAKE-8PILE ?auto_121748 ?auto_121749 ?auto_121750 ?auto_121751 ?auto_121752 ?auto_121753 ?auto_121754 ?auto_121755 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_121757 - BLOCK
      ?auto_121758 - BLOCK
      ?auto_121759 - BLOCK
      ?auto_121760 - BLOCK
      ?auto_121761 - BLOCK
      ?auto_121762 - BLOCK
      ?auto_121763 - BLOCK
      ?auto_121764 - BLOCK
    )
    :vars
    (
      ?auto_121765 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121757 ) ( not ( = ?auto_121757 ?auto_121758 ) ) ( not ( = ?auto_121757 ?auto_121759 ) ) ( not ( = ?auto_121757 ?auto_121760 ) ) ( not ( = ?auto_121757 ?auto_121761 ) ) ( not ( = ?auto_121757 ?auto_121762 ) ) ( not ( = ?auto_121757 ?auto_121763 ) ) ( not ( = ?auto_121757 ?auto_121764 ) ) ( not ( = ?auto_121758 ?auto_121759 ) ) ( not ( = ?auto_121758 ?auto_121760 ) ) ( not ( = ?auto_121758 ?auto_121761 ) ) ( not ( = ?auto_121758 ?auto_121762 ) ) ( not ( = ?auto_121758 ?auto_121763 ) ) ( not ( = ?auto_121758 ?auto_121764 ) ) ( not ( = ?auto_121759 ?auto_121760 ) ) ( not ( = ?auto_121759 ?auto_121761 ) ) ( not ( = ?auto_121759 ?auto_121762 ) ) ( not ( = ?auto_121759 ?auto_121763 ) ) ( not ( = ?auto_121759 ?auto_121764 ) ) ( not ( = ?auto_121760 ?auto_121761 ) ) ( not ( = ?auto_121760 ?auto_121762 ) ) ( not ( = ?auto_121760 ?auto_121763 ) ) ( not ( = ?auto_121760 ?auto_121764 ) ) ( not ( = ?auto_121761 ?auto_121762 ) ) ( not ( = ?auto_121761 ?auto_121763 ) ) ( not ( = ?auto_121761 ?auto_121764 ) ) ( not ( = ?auto_121762 ?auto_121763 ) ) ( not ( = ?auto_121762 ?auto_121764 ) ) ( not ( = ?auto_121763 ?auto_121764 ) ) ( ON ?auto_121764 ?auto_121765 ) ( not ( = ?auto_121757 ?auto_121765 ) ) ( not ( = ?auto_121758 ?auto_121765 ) ) ( not ( = ?auto_121759 ?auto_121765 ) ) ( not ( = ?auto_121760 ?auto_121765 ) ) ( not ( = ?auto_121761 ?auto_121765 ) ) ( not ( = ?auto_121762 ?auto_121765 ) ) ( not ( = ?auto_121763 ?auto_121765 ) ) ( not ( = ?auto_121764 ?auto_121765 ) ) ( ON ?auto_121763 ?auto_121764 ) ( ON-TABLE ?auto_121765 ) ( ON ?auto_121762 ?auto_121763 ) ( ON ?auto_121761 ?auto_121762 ) ( ON ?auto_121760 ?auto_121761 ) ( ON ?auto_121759 ?auto_121760 ) ( CLEAR ?auto_121757 ) ( ON ?auto_121758 ?auto_121759 ) ( CLEAR ?auto_121758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_121765 ?auto_121764 ?auto_121763 ?auto_121762 ?auto_121761 ?auto_121760 ?auto_121759 )
      ( MAKE-8PILE ?auto_121757 ?auto_121758 ?auto_121759 ?auto_121760 ?auto_121761 ?auto_121762 ?auto_121763 ?auto_121764 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_121766 - BLOCK
      ?auto_121767 - BLOCK
      ?auto_121768 - BLOCK
      ?auto_121769 - BLOCK
      ?auto_121770 - BLOCK
      ?auto_121771 - BLOCK
      ?auto_121772 - BLOCK
      ?auto_121773 - BLOCK
    )
    :vars
    (
      ?auto_121774 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121766 ?auto_121767 ) ) ( not ( = ?auto_121766 ?auto_121768 ) ) ( not ( = ?auto_121766 ?auto_121769 ) ) ( not ( = ?auto_121766 ?auto_121770 ) ) ( not ( = ?auto_121766 ?auto_121771 ) ) ( not ( = ?auto_121766 ?auto_121772 ) ) ( not ( = ?auto_121766 ?auto_121773 ) ) ( not ( = ?auto_121767 ?auto_121768 ) ) ( not ( = ?auto_121767 ?auto_121769 ) ) ( not ( = ?auto_121767 ?auto_121770 ) ) ( not ( = ?auto_121767 ?auto_121771 ) ) ( not ( = ?auto_121767 ?auto_121772 ) ) ( not ( = ?auto_121767 ?auto_121773 ) ) ( not ( = ?auto_121768 ?auto_121769 ) ) ( not ( = ?auto_121768 ?auto_121770 ) ) ( not ( = ?auto_121768 ?auto_121771 ) ) ( not ( = ?auto_121768 ?auto_121772 ) ) ( not ( = ?auto_121768 ?auto_121773 ) ) ( not ( = ?auto_121769 ?auto_121770 ) ) ( not ( = ?auto_121769 ?auto_121771 ) ) ( not ( = ?auto_121769 ?auto_121772 ) ) ( not ( = ?auto_121769 ?auto_121773 ) ) ( not ( = ?auto_121770 ?auto_121771 ) ) ( not ( = ?auto_121770 ?auto_121772 ) ) ( not ( = ?auto_121770 ?auto_121773 ) ) ( not ( = ?auto_121771 ?auto_121772 ) ) ( not ( = ?auto_121771 ?auto_121773 ) ) ( not ( = ?auto_121772 ?auto_121773 ) ) ( ON ?auto_121773 ?auto_121774 ) ( not ( = ?auto_121766 ?auto_121774 ) ) ( not ( = ?auto_121767 ?auto_121774 ) ) ( not ( = ?auto_121768 ?auto_121774 ) ) ( not ( = ?auto_121769 ?auto_121774 ) ) ( not ( = ?auto_121770 ?auto_121774 ) ) ( not ( = ?auto_121771 ?auto_121774 ) ) ( not ( = ?auto_121772 ?auto_121774 ) ) ( not ( = ?auto_121773 ?auto_121774 ) ) ( ON ?auto_121772 ?auto_121773 ) ( ON-TABLE ?auto_121774 ) ( ON ?auto_121771 ?auto_121772 ) ( ON ?auto_121770 ?auto_121771 ) ( ON ?auto_121769 ?auto_121770 ) ( ON ?auto_121768 ?auto_121769 ) ( ON ?auto_121767 ?auto_121768 ) ( CLEAR ?auto_121767 ) ( HOLDING ?auto_121766 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121766 )
      ( MAKE-8PILE ?auto_121766 ?auto_121767 ?auto_121768 ?auto_121769 ?auto_121770 ?auto_121771 ?auto_121772 ?auto_121773 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_121775 - BLOCK
      ?auto_121776 - BLOCK
      ?auto_121777 - BLOCK
      ?auto_121778 - BLOCK
      ?auto_121779 - BLOCK
      ?auto_121780 - BLOCK
      ?auto_121781 - BLOCK
      ?auto_121782 - BLOCK
    )
    :vars
    (
      ?auto_121783 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121775 ?auto_121776 ) ) ( not ( = ?auto_121775 ?auto_121777 ) ) ( not ( = ?auto_121775 ?auto_121778 ) ) ( not ( = ?auto_121775 ?auto_121779 ) ) ( not ( = ?auto_121775 ?auto_121780 ) ) ( not ( = ?auto_121775 ?auto_121781 ) ) ( not ( = ?auto_121775 ?auto_121782 ) ) ( not ( = ?auto_121776 ?auto_121777 ) ) ( not ( = ?auto_121776 ?auto_121778 ) ) ( not ( = ?auto_121776 ?auto_121779 ) ) ( not ( = ?auto_121776 ?auto_121780 ) ) ( not ( = ?auto_121776 ?auto_121781 ) ) ( not ( = ?auto_121776 ?auto_121782 ) ) ( not ( = ?auto_121777 ?auto_121778 ) ) ( not ( = ?auto_121777 ?auto_121779 ) ) ( not ( = ?auto_121777 ?auto_121780 ) ) ( not ( = ?auto_121777 ?auto_121781 ) ) ( not ( = ?auto_121777 ?auto_121782 ) ) ( not ( = ?auto_121778 ?auto_121779 ) ) ( not ( = ?auto_121778 ?auto_121780 ) ) ( not ( = ?auto_121778 ?auto_121781 ) ) ( not ( = ?auto_121778 ?auto_121782 ) ) ( not ( = ?auto_121779 ?auto_121780 ) ) ( not ( = ?auto_121779 ?auto_121781 ) ) ( not ( = ?auto_121779 ?auto_121782 ) ) ( not ( = ?auto_121780 ?auto_121781 ) ) ( not ( = ?auto_121780 ?auto_121782 ) ) ( not ( = ?auto_121781 ?auto_121782 ) ) ( ON ?auto_121782 ?auto_121783 ) ( not ( = ?auto_121775 ?auto_121783 ) ) ( not ( = ?auto_121776 ?auto_121783 ) ) ( not ( = ?auto_121777 ?auto_121783 ) ) ( not ( = ?auto_121778 ?auto_121783 ) ) ( not ( = ?auto_121779 ?auto_121783 ) ) ( not ( = ?auto_121780 ?auto_121783 ) ) ( not ( = ?auto_121781 ?auto_121783 ) ) ( not ( = ?auto_121782 ?auto_121783 ) ) ( ON ?auto_121781 ?auto_121782 ) ( ON-TABLE ?auto_121783 ) ( ON ?auto_121780 ?auto_121781 ) ( ON ?auto_121779 ?auto_121780 ) ( ON ?auto_121778 ?auto_121779 ) ( ON ?auto_121777 ?auto_121778 ) ( ON ?auto_121776 ?auto_121777 ) ( ON ?auto_121775 ?auto_121776 ) ( CLEAR ?auto_121775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_121783 ?auto_121782 ?auto_121781 ?auto_121780 ?auto_121779 ?auto_121778 ?auto_121777 ?auto_121776 )
      ( MAKE-8PILE ?auto_121775 ?auto_121776 ?auto_121777 ?auto_121778 ?auto_121779 ?auto_121780 ?auto_121781 ?auto_121782 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121920 - BLOCK
    )
    :vars
    (
      ?auto_121921 - BLOCK
      ?auto_121922 - BLOCK
      ?auto_121923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121920 ?auto_121921 ) ( CLEAR ?auto_121920 ) ( not ( = ?auto_121920 ?auto_121921 ) ) ( HOLDING ?auto_121922 ) ( CLEAR ?auto_121923 ) ( not ( = ?auto_121920 ?auto_121922 ) ) ( not ( = ?auto_121920 ?auto_121923 ) ) ( not ( = ?auto_121921 ?auto_121922 ) ) ( not ( = ?auto_121921 ?auto_121923 ) ) ( not ( = ?auto_121922 ?auto_121923 ) ) )
    :subtasks
    ( ( !STACK ?auto_121922 ?auto_121923 )
      ( MAKE-1PILE ?auto_121920 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121924 - BLOCK
    )
    :vars
    (
      ?auto_121925 - BLOCK
      ?auto_121927 - BLOCK
      ?auto_121926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121924 ?auto_121925 ) ( not ( = ?auto_121924 ?auto_121925 ) ) ( CLEAR ?auto_121927 ) ( not ( = ?auto_121924 ?auto_121926 ) ) ( not ( = ?auto_121924 ?auto_121927 ) ) ( not ( = ?auto_121925 ?auto_121926 ) ) ( not ( = ?auto_121925 ?auto_121927 ) ) ( not ( = ?auto_121926 ?auto_121927 ) ) ( ON ?auto_121926 ?auto_121924 ) ( CLEAR ?auto_121926 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121925 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121925 ?auto_121924 )
      ( MAKE-1PILE ?auto_121924 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121928 - BLOCK
    )
    :vars
    (
      ?auto_121929 - BLOCK
      ?auto_121931 - BLOCK
      ?auto_121930 - BLOCK
      ?auto_121934 - BLOCK
      ?auto_121935 - BLOCK
      ?auto_121936 - BLOCK
      ?auto_121933 - BLOCK
      ?auto_121932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121928 ?auto_121929 ) ( not ( = ?auto_121928 ?auto_121929 ) ) ( not ( = ?auto_121928 ?auto_121931 ) ) ( not ( = ?auto_121928 ?auto_121930 ) ) ( not ( = ?auto_121929 ?auto_121931 ) ) ( not ( = ?auto_121929 ?auto_121930 ) ) ( not ( = ?auto_121931 ?auto_121930 ) ) ( ON ?auto_121931 ?auto_121928 ) ( CLEAR ?auto_121931 ) ( ON-TABLE ?auto_121929 ) ( HOLDING ?auto_121930 ) ( CLEAR ?auto_121934 ) ( ON-TABLE ?auto_121935 ) ( ON ?auto_121936 ?auto_121935 ) ( ON ?auto_121933 ?auto_121936 ) ( ON ?auto_121932 ?auto_121933 ) ( ON ?auto_121934 ?auto_121932 ) ( not ( = ?auto_121935 ?auto_121936 ) ) ( not ( = ?auto_121935 ?auto_121933 ) ) ( not ( = ?auto_121935 ?auto_121932 ) ) ( not ( = ?auto_121935 ?auto_121934 ) ) ( not ( = ?auto_121935 ?auto_121930 ) ) ( not ( = ?auto_121936 ?auto_121933 ) ) ( not ( = ?auto_121936 ?auto_121932 ) ) ( not ( = ?auto_121936 ?auto_121934 ) ) ( not ( = ?auto_121936 ?auto_121930 ) ) ( not ( = ?auto_121933 ?auto_121932 ) ) ( not ( = ?auto_121933 ?auto_121934 ) ) ( not ( = ?auto_121933 ?auto_121930 ) ) ( not ( = ?auto_121932 ?auto_121934 ) ) ( not ( = ?auto_121932 ?auto_121930 ) ) ( not ( = ?auto_121934 ?auto_121930 ) ) ( not ( = ?auto_121928 ?auto_121934 ) ) ( not ( = ?auto_121928 ?auto_121935 ) ) ( not ( = ?auto_121928 ?auto_121936 ) ) ( not ( = ?auto_121928 ?auto_121933 ) ) ( not ( = ?auto_121928 ?auto_121932 ) ) ( not ( = ?auto_121929 ?auto_121934 ) ) ( not ( = ?auto_121929 ?auto_121935 ) ) ( not ( = ?auto_121929 ?auto_121936 ) ) ( not ( = ?auto_121929 ?auto_121933 ) ) ( not ( = ?auto_121929 ?auto_121932 ) ) ( not ( = ?auto_121931 ?auto_121934 ) ) ( not ( = ?auto_121931 ?auto_121935 ) ) ( not ( = ?auto_121931 ?auto_121936 ) ) ( not ( = ?auto_121931 ?auto_121933 ) ) ( not ( = ?auto_121931 ?auto_121932 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121935 ?auto_121936 ?auto_121933 ?auto_121932 ?auto_121934 ?auto_121930 )
      ( MAKE-1PILE ?auto_121928 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121937 - BLOCK
    )
    :vars
    (
      ?auto_121941 - BLOCK
      ?auto_121943 - BLOCK
      ?auto_121942 - BLOCK
      ?auto_121944 - BLOCK
      ?auto_121945 - BLOCK
      ?auto_121938 - BLOCK
      ?auto_121939 - BLOCK
      ?auto_121940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121937 ?auto_121941 ) ( not ( = ?auto_121937 ?auto_121941 ) ) ( not ( = ?auto_121937 ?auto_121943 ) ) ( not ( = ?auto_121937 ?auto_121942 ) ) ( not ( = ?auto_121941 ?auto_121943 ) ) ( not ( = ?auto_121941 ?auto_121942 ) ) ( not ( = ?auto_121943 ?auto_121942 ) ) ( ON ?auto_121943 ?auto_121937 ) ( ON-TABLE ?auto_121941 ) ( CLEAR ?auto_121944 ) ( ON-TABLE ?auto_121945 ) ( ON ?auto_121938 ?auto_121945 ) ( ON ?auto_121939 ?auto_121938 ) ( ON ?auto_121940 ?auto_121939 ) ( ON ?auto_121944 ?auto_121940 ) ( not ( = ?auto_121945 ?auto_121938 ) ) ( not ( = ?auto_121945 ?auto_121939 ) ) ( not ( = ?auto_121945 ?auto_121940 ) ) ( not ( = ?auto_121945 ?auto_121944 ) ) ( not ( = ?auto_121945 ?auto_121942 ) ) ( not ( = ?auto_121938 ?auto_121939 ) ) ( not ( = ?auto_121938 ?auto_121940 ) ) ( not ( = ?auto_121938 ?auto_121944 ) ) ( not ( = ?auto_121938 ?auto_121942 ) ) ( not ( = ?auto_121939 ?auto_121940 ) ) ( not ( = ?auto_121939 ?auto_121944 ) ) ( not ( = ?auto_121939 ?auto_121942 ) ) ( not ( = ?auto_121940 ?auto_121944 ) ) ( not ( = ?auto_121940 ?auto_121942 ) ) ( not ( = ?auto_121944 ?auto_121942 ) ) ( not ( = ?auto_121937 ?auto_121944 ) ) ( not ( = ?auto_121937 ?auto_121945 ) ) ( not ( = ?auto_121937 ?auto_121938 ) ) ( not ( = ?auto_121937 ?auto_121939 ) ) ( not ( = ?auto_121937 ?auto_121940 ) ) ( not ( = ?auto_121941 ?auto_121944 ) ) ( not ( = ?auto_121941 ?auto_121945 ) ) ( not ( = ?auto_121941 ?auto_121938 ) ) ( not ( = ?auto_121941 ?auto_121939 ) ) ( not ( = ?auto_121941 ?auto_121940 ) ) ( not ( = ?auto_121943 ?auto_121944 ) ) ( not ( = ?auto_121943 ?auto_121945 ) ) ( not ( = ?auto_121943 ?auto_121938 ) ) ( not ( = ?auto_121943 ?auto_121939 ) ) ( not ( = ?auto_121943 ?auto_121940 ) ) ( ON ?auto_121942 ?auto_121943 ) ( CLEAR ?auto_121942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121941 ?auto_121937 ?auto_121943 )
      ( MAKE-1PILE ?auto_121937 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121946 - BLOCK
    )
    :vars
    (
      ?auto_121951 - BLOCK
      ?auto_121952 - BLOCK
      ?auto_121948 - BLOCK
      ?auto_121954 - BLOCK
      ?auto_121953 - BLOCK
      ?auto_121949 - BLOCK
      ?auto_121950 - BLOCK
      ?auto_121947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121946 ?auto_121951 ) ( not ( = ?auto_121946 ?auto_121951 ) ) ( not ( = ?auto_121946 ?auto_121952 ) ) ( not ( = ?auto_121946 ?auto_121948 ) ) ( not ( = ?auto_121951 ?auto_121952 ) ) ( not ( = ?auto_121951 ?auto_121948 ) ) ( not ( = ?auto_121952 ?auto_121948 ) ) ( ON ?auto_121952 ?auto_121946 ) ( ON-TABLE ?auto_121951 ) ( ON-TABLE ?auto_121954 ) ( ON ?auto_121953 ?auto_121954 ) ( ON ?auto_121949 ?auto_121953 ) ( ON ?auto_121950 ?auto_121949 ) ( not ( = ?auto_121954 ?auto_121953 ) ) ( not ( = ?auto_121954 ?auto_121949 ) ) ( not ( = ?auto_121954 ?auto_121950 ) ) ( not ( = ?auto_121954 ?auto_121947 ) ) ( not ( = ?auto_121954 ?auto_121948 ) ) ( not ( = ?auto_121953 ?auto_121949 ) ) ( not ( = ?auto_121953 ?auto_121950 ) ) ( not ( = ?auto_121953 ?auto_121947 ) ) ( not ( = ?auto_121953 ?auto_121948 ) ) ( not ( = ?auto_121949 ?auto_121950 ) ) ( not ( = ?auto_121949 ?auto_121947 ) ) ( not ( = ?auto_121949 ?auto_121948 ) ) ( not ( = ?auto_121950 ?auto_121947 ) ) ( not ( = ?auto_121950 ?auto_121948 ) ) ( not ( = ?auto_121947 ?auto_121948 ) ) ( not ( = ?auto_121946 ?auto_121947 ) ) ( not ( = ?auto_121946 ?auto_121954 ) ) ( not ( = ?auto_121946 ?auto_121953 ) ) ( not ( = ?auto_121946 ?auto_121949 ) ) ( not ( = ?auto_121946 ?auto_121950 ) ) ( not ( = ?auto_121951 ?auto_121947 ) ) ( not ( = ?auto_121951 ?auto_121954 ) ) ( not ( = ?auto_121951 ?auto_121953 ) ) ( not ( = ?auto_121951 ?auto_121949 ) ) ( not ( = ?auto_121951 ?auto_121950 ) ) ( not ( = ?auto_121952 ?auto_121947 ) ) ( not ( = ?auto_121952 ?auto_121954 ) ) ( not ( = ?auto_121952 ?auto_121953 ) ) ( not ( = ?auto_121952 ?auto_121949 ) ) ( not ( = ?auto_121952 ?auto_121950 ) ) ( ON ?auto_121948 ?auto_121952 ) ( CLEAR ?auto_121948 ) ( HOLDING ?auto_121947 ) ( CLEAR ?auto_121950 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121954 ?auto_121953 ?auto_121949 ?auto_121950 ?auto_121947 )
      ( MAKE-1PILE ?auto_121946 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121955 - BLOCK
    )
    :vars
    (
      ?auto_121958 - BLOCK
      ?auto_121962 - BLOCK
      ?auto_121959 - BLOCK
      ?auto_121960 - BLOCK
      ?auto_121957 - BLOCK
      ?auto_121956 - BLOCK
      ?auto_121961 - BLOCK
      ?auto_121963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121955 ?auto_121958 ) ( not ( = ?auto_121955 ?auto_121958 ) ) ( not ( = ?auto_121955 ?auto_121962 ) ) ( not ( = ?auto_121955 ?auto_121959 ) ) ( not ( = ?auto_121958 ?auto_121962 ) ) ( not ( = ?auto_121958 ?auto_121959 ) ) ( not ( = ?auto_121962 ?auto_121959 ) ) ( ON ?auto_121962 ?auto_121955 ) ( ON-TABLE ?auto_121958 ) ( ON-TABLE ?auto_121960 ) ( ON ?auto_121957 ?auto_121960 ) ( ON ?auto_121956 ?auto_121957 ) ( ON ?auto_121961 ?auto_121956 ) ( not ( = ?auto_121960 ?auto_121957 ) ) ( not ( = ?auto_121960 ?auto_121956 ) ) ( not ( = ?auto_121960 ?auto_121961 ) ) ( not ( = ?auto_121960 ?auto_121963 ) ) ( not ( = ?auto_121960 ?auto_121959 ) ) ( not ( = ?auto_121957 ?auto_121956 ) ) ( not ( = ?auto_121957 ?auto_121961 ) ) ( not ( = ?auto_121957 ?auto_121963 ) ) ( not ( = ?auto_121957 ?auto_121959 ) ) ( not ( = ?auto_121956 ?auto_121961 ) ) ( not ( = ?auto_121956 ?auto_121963 ) ) ( not ( = ?auto_121956 ?auto_121959 ) ) ( not ( = ?auto_121961 ?auto_121963 ) ) ( not ( = ?auto_121961 ?auto_121959 ) ) ( not ( = ?auto_121963 ?auto_121959 ) ) ( not ( = ?auto_121955 ?auto_121963 ) ) ( not ( = ?auto_121955 ?auto_121960 ) ) ( not ( = ?auto_121955 ?auto_121957 ) ) ( not ( = ?auto_121955 ?auto_121956 ) ) ( not ( = ?auto_121955 ?auto_121961 ) ) ( not ( = ?auto_121958 ?auto_121963 ) ) ( not ( = ?auto_121958 ?auto_121960 ) ) ( not ( = ?auto_121958 ?auto_121957 ) ) ( not ( = ?auto_121958 ?auto_121956 ) ) ( not ( = ?auto_121958 ?auto_121961 ) ) ( not ( = ?auto_121962 ?auto_121963 ) ) ( not ( = ?auto_121962 ?auto_121960 ) ) ( not ( = ?auto_121962 ?auto_121957 ) ) ( not ( = ?auto_121962 ?auto_121956 ) ) ( not ( = ?auto_121962 ?auto_121961 ) ) ( ON ?auto_121959 ?auto_121962 ) ( CLEAR ?auto_121961 ) ( ON ?auto_121963 ?auto_121959 ) ( CLEAR ?auto_121963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121958 ?auto_121955 ?auto_121962 ?auto_121959 )
      ( MAKE-1PILE ?auto_121955 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121964 - BLOCK
    )
    :vars
    (
      ?auto_121967 - BLOCK
      ?auto_121966 - BLOCK
      ?auto_121968 - BLOCK
      ?auto_121971 - BLOCK
      ?auto_121972 - BLOCK
      ?auto_121970 - BLOCK
      ?auto_121969 - BLOCK
      ?auto_121965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121964 ?auto_121967 ) ( not ( = ?auto_121964 ?auto_121967 ) ) ( not ( = ?auto_121964 ?auto_121966 ) ) ( not ( = ?auto_121964 ?auto_121968 ) ) ( not ( = ?auto_121967 ?auto_121966 ) ) ( not ( = ?auto_121967 ?auto_121968 ) ) ( not ( = ?auto_121966 ?auto_121968 ) ) ( ON ?auto_121966 ?auto_121964 ) ( ON-TABLE ?auto_121967 ) ( ON-TABLE ?auto_121971 ) ( ON ?auto_121972 ?auto_121971 ) ( ON ?auto_121970 ?auto_121972 ) ( not ( = ?auto_121971 ?auto_121972 ) ) ( not ( = ?auto_121971 ?auto_121970 ) ) ( not ( = ?auto_121971 ?auto_121969 ) ) ( not ( = ?auto_121971 ?auto_121965 ) ) ( not ( = ?auto_121971 ?auto_121968 ) ) ( not ( = ?auto_121972 ?auto_121970 ) ) ( not ( = ?auto_121972 ?auto_121969 ) ) ( not ( = ?auto_121972 ?auto_121965 ) ) ( not ( = ?auto_121972 ?auto_121968 ) ) ( not ( = ?auto_121970 ?auto_121969 ) ) ( not ( = ?auto_121970 ?auto_121965 ) ) ( not ( = ?auto_121970 ?auto_121968 ) ) ( not ( = ?auto_121969 ?auto_121965 ) ) ( not ( = ?auto_121969 ?auto_121968 ) ) ( not ( = ?auto_121965 ?auto_121968 ) ) ( not ( = ?auto_121964 ?auto_121965 ) ) ( not ( = ?auto_121964 ?auto_121971 ) ) ( not ( = ?auto_121964 ?auto_121972 ) ) ( not ( = ?auto_121964 ?auto_121970 ) ) ( not ( = ?auto_121964 ?auto_121969 ) ) ( not ( = ?auto_121967 ?auto_121965 ) ) ( not ( = ?auto_121967 ?auto_121971 ) ) ( not ( = ?auto_121967 ?auto_121972 ) ) ( not ( = ?auto_121967 ?auto_121970 ) ) ( not ( = ?auto_121967 ?auto_121969 ) ) ( not ( = ?auto_121966 ?auto_121965 ) ) ( not ( = ?auto_121966 ?auto_121971 ) ) ( not ( = ?auto_121966 ?auto_121972 ) ) ( not ( = ?auto_121966 ?auto_121970 ) ) ( not ( = ?auto_121966 ?auto_121969 ) ) ( ON ?auto_121968 ?auto_121966 ) ( ON ?auto_121965 ?auto_121968 ) ( CLEAR ?auto_121965 ) ( HOLDING ?auto_121969 ) ( CLEAR ?auto_121970 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121971 ?auto_121972 ?auto_121970 ?auto_121969 )
      ( MAKE-1PILE ?auto_121964 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121973 - BLOCK
    )
    :vars
    (
      ?auto_121976 - BLOCK
      ?auto_121977 - BLOCK
      ?auto_121981 - BLOCK
      ?auto_121978 - BLOCK
      ?auto_121980 - BLOCK
      ?auto_121979 - BLOCK
      ?auto_121975 - BLOCK
      ?auto_121974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121973 ?auto_121976 ) ( not ( = ?auto_121973 ?auto_121976 ) ) ( not ( = ?auto_121973 ?auto_121977 ) ) ( not ( = ?auto_121973 ?auto_121981 ) ) ( not ( = ?auto_121976 ?auto_121977 ) ) ( not ( = ?auto_121976 ?auto_121981 ) ) ( not ( = ?auto_121977 ?auto_121981 ) ) ( ON ?auto_121977 ?auto_121973 ) ( ON-TABLE ?auto_121976 ) ( ON-TABLE ?auto_121978 ) ( ON ?auto_121980 ?auto_121978 ) ( ON ?auto_121979 ?auto_121980 ) ( not ( = ?auto_121978 ?auto_121980 ) ) ( not ( = ?auto_121978 ?auto_121979 ) ) ( not ( = ?auto_121978 ?auto_121975 ) ) ( not ( = ?auto_121978 ?auto_121974 ) ) ( not ( = ?auto_121978 ?auto_121981 ) ) ( not ( = ?auto_121980 ?auto_121979 ) ) ( not ( = ?auto_121980 ?auto_121975 ) ) ( not ( = ?auto_121980 ?auto_121974 ) ) ( not ( = ?auto_121980 ?auto_121981 ) ) ( not ( = ?auto_121979 ?auto_121975 ) ) ( not ( = ?auto_121979 ?auto_121974 ) ) ( not ( = ?auto_121979 ?auto_121981 ) ) ( not ( = ?auto_121975 ?auto_121974 ) ) ( not ( = ?auto_121975 ?auto_121981 ) ) ( not ( = ?auto_121974 ?auto_121981 ) ) ( not ( = ?auto_121973 ?auto_121974 ) ) ( not ( = ?auto_121973 ?auto_121978 ) ) ( not ( = ?auto_121973 ?auto_121980 ) ) ( not ( = ?auto_121973 ?auto_121979 ) ) ( not ( = ?auto_121973 ?auto_121975 ) ) ( not ( = ?auto_121976 ?auto_121974 ) ) ( not ( = ?auto_121976 ?auto_121978 ) ) ( not ( = ?auto_121976 ?auto_121980 ) ) ( not ( = ?auto_121976 ?auto_121979 ) ) ( not ( = ?auto_121976 ?auto_121975 ) ) ( not ( = ?auto_121977 ?auto_121974 ) ) ( not ( = ?auto_121977 ?auto_121978 ) ) ( not ( = ?auto_121977 ?auto_121980 ) ) ( not ( = ?auto_121977 ?auto_121979 ) ) ( not ( = ?auto_121977 ?auto_121975 ) ) ( ON ?auto_121981 ?auto_121977 ) ( ON ?auto_121974 ?auto_121981 ) ( CLEAR ?auto_121979 ) ( ON ?auto_121975 ?auto_121974 ) ( CLEAR ?auto_121975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121976 ?auto_121973 ?auto_121977 ?auto_121981 ?auto_121974 )
      ( MAKE-1PILE ?auto_121973 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121982 - BLOCK
    )
    :vars
    (
      ?auto_121990 - BLOCK
      ?auto_121983 - BLOCK
      ?auto_121984 - BLOCK
      ?auto_121985 - BLOCK
      ?auto_121986 - BLOCK
      ?auto_121989 - BLOCK
      ?auto_121988 - BLOCK
      ?auto_121987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121982 ?auto_121990 ) ( not ( = ?auto_121982 ?auto_121990 ) ) ( not ( = ?auto_121982 ?auto_121983 ) ) ( not ( = ?auto_121982 ?auto_121984 ) ) ( not ( = ?auto_121990 ?auto_121983 ) ) ( not ( = ?auto_121990 ?auto_121984 ) ) ( not ( = ?auto_121983 ?auto_121984 ) ) ( ON ?auto_121983 ?auto_121982 ) ( ON-TABLE ?auto_121990 ) ( ON-TABLE ?auto_121985 ) ( ON ?auto_121986 ?auto_121985 ) ( not ( = ?auto_121985 ?auto_121986 ) ) ( not ( = ?auto_121985 ?auto_121989 ) ) ( not ( = ?auto_121985 ?auto_121988 ) ) ( not ( = ?auto_121985 ?auto_121987 ) ) ( not ( = ?auto_121985 ?auto_121984 ) ) ( not ( = ?auto_121986 ?auto_121989 ) ) ( not ( = ?auto_121986 ?auto_121988 ) ) ( not ( = ?auto_121986 ?auto_121987 ) ) ( not ( = ?auto_121986 ?auto_121984 ) ) ( not ( = ?auto_121989 ?auto_121988 ) ) ( not ( = ?auto_121989 ?auto_121987 ) ) ( not ( = ?auto_121989 ?auto_121984 ) ) ( not ( = ?auto_121988 ?auto_121987 ) ) ( not ( = ?auto_121988 ?auto_121984 ) ) ( not ( = ?auto_121987 ?auto_121984 ) ) ( not ( = ?auto_121982 ?auto_121987 ) ) ( not ( = ?auto_121982 ?auto_121985 ) ) ( not ( = ?auto_121982 ?auto_121986 ) ) ( not ( = ?auto_121982 ?auto_121989 ) ) ( not ( = ?auto_121982 ?auto_121988 ) ) ( not ( = ?auto_121990 ?auto_121987 ) ) ( not ( = ?auto_121990 ?auto_121985 ) ) ( not ( = ?auto_121990 ?auto_121986 ) ) ( not ( = ?auto_121990 ?auto_121989 ) ) ( not ( = ?auto_121990 ?auto_121988 ) ) ( not ( = ?auto_121983 ?auto_121987 ) ) ( not ( = ?auto_121983 ?auto_121985 ) ) ( not ( = ?auto_121983 ?auto_121986 ) ) ( not ( = ?auto_121983 ?auto_121989 ) ) ( not ( = ?auto_121983 ?auto_121988 ) ) ( ON ?auto_121984 ?auto_121983 ) ( ON ?auto_121987 ?auto_121984 ) ( ON ?auto_121988 ?auto_121987 ) ( CLEAR ?auto_121988 ) ( HOLDING ?auto_121989 ) ( CLEAR ?auto_121986 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121985 ?auto_121986 ?auto_121989 )
      ( MAKE-1PILE ?auto_121982 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121991 - BLOCK
    )
    :vars
    (
      ?auto_121998 - BLOCK
      ?auto_121993 - BLOCK
      ?auto_121999 - BLOCK
      ?auto_121995 - BLOCK
      ?auto_121996 - BLOCK
      ?auto_121994 - BLOCK
      ?auto_121992 - BLOCK
      ?auto_121997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121991 ?auto_121998 ) ( not ( = ?auto_121991 ?auto_121998 ) ) ( not ( = ?auto_121991 ?auto_121993 ) ) ( not ( = ?auto_121991 ?auto_121999 ) ) ( not ( = ?auto_121998 ?auto_121993 ) ) ( not ( = ?auto_121998 ?auto_121999 ) ) ( not ( = ?auto_121993 ?auto_121999 ) ) ( ON ?auto_121993 ?auto_121991 ) ( ON-TABLE ?auto_121998 ) ( ON-TABLE ?auto_121995 ) ( ON ?auto_121996 ?auto_121995 ) ( not ( = ?auto_121995 ?auto_121996 ) ) ( not ( = ?auto_121995 ?auto_121994 ) ) ( not ( = ?auto_121995 ?auto_121992 ) ) ( not ( = ?auto_121995 ?auto_121997 ) ) ( not ( = ?auto_121995 ?auto_121999 ) ) ( not ( = ?auto_121996 ?auto_121994 ) ) ( not ( = ?auto_121996 ?auto_121992 ) ) ( not ( = ?auto_121996 ?auto_121997 ) ) ( not ( = ?auto_121996 ?auto_121999 ) ) ( not ( = ?auto_121994 ?auto_121992 ) ) ( not ( = ?auto_121994 ?auto_121997 ) ) ( not ( = ?auto_121994 ?auto_121999 ) ) ( not ( = ?auto_121992 ?auto_121997 ) ) ( not ( = ?auto_121992 ?auto_121999 ) ) ( not ( = ?auto_121997 ?auto_121999 ) ) ( not ( = ?auto_121991 ?auto_121997 ) ) ( not ( = ?auto_121991 ?auto_121995 ) ) ( not ( = ?auto_121991 ?auto_121996 ) ) ( not ( = ?auto_121991 ?auto_121994 ) ) ( not ( = ?auto_121991 ?auto_121992 ) ) ( not ( = ?auto_121998 ?auto_121997 ) ) ( not ( = ?auto_121998 ?auto_121995 ) ) ( not ( = ?auto_121998 ?auto_121996 ) ) ( not ( = ?auto_121998 ?auto_121994 ) ) ( not ( = ?auto_121998 ?auto_121992 ) ) ( not ( = ?auto_121993 ?auto_121997 ) ) ( not ( = ?auto_121993 ?auto_121995 ) ) ( not ( = ?auto_121993 ?auto_121996 ) ) ( not ( = ?auto_121993 ?auto_121994 ) ) ( not ( = ?auto_121993 ?auto_121992 ) ) ( ON ?auto_121999 ?auto_121993 ) ( ON ?auto_121997 ?auto_121999 ) ( ON ?auto_121992 ?auto_121997 ) ( CLEAR ?auto_121996 ) ( ON ?auto_121994 ?auto_121992 ) ( CLEAR ?auto_121994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121998 ?auto_121991 ?auto_121993 ?auto_121999 ?auto_121997 ?auto_121992 )
      ( MAKE-1PILE ?auto_121991 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122000 - BLOCK
    )
    :vars
    (
      ?auto_122005 - BLOCK
      ?auto_122008 - BLOCK
      ?auto_122004 - BLOCK
      ?auto_122006 - BLOCK
      ?auto_122002 - BLOCK
      ?auto_122003 - BLOCK
      ?auto_122007 - BLOCK
      ?auto_122001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122000 ?auto_122005 ) ( not ( = ?auto_122000 ?auto_122005 ) ) ( not ( = ?auto_122000 ?auto_122008 ) ) ( not ( = ?auto_122000 ?auto_122004 ) ) ( not ( = ?auto_122005 ?auto_122008 ) ) ( not ( = ?auto_122005 ?auto_122004 ) ) ( not ( = ?auto_122008 ?auto_122004 ) ) ( ON ?auto_122008 ?auto_122000 ) ( ON-TABLE ?auto_122005 ) ( ON-TABLE ?auto_122006 ) ( not ( = ?auto_122006 ?auto_122002 ) ) ( not ( = ?auto_122006 ?auto_122003 ) ) ( not ( = ?auto_122006 ?auto_122007 ) ) ( not ( = ?auto_122006 ?auto_122001 ) ) ( not ( = ?auto_122006 ?auto_122004 ) ) ( not ( = ?auto_122002 ?auto_122003 ) ) ( not ( = ?auto_122002 ?auto_122007 ) ) ( not ( = ?auto_122002 ?auto_122001 ) ) ( not ( = ?auto_122002 ?auto_122004 ) ) ( not ( = ?auto_122003 ?auto_122007 ) ) ( not ( = ?auto_122003 ?auto_122001 ) ) ( not ( = ?auto_122003 ?auto_122004 ) ) ( not ( = ?auto_122007 ?auto_122001 ) ) ( not ( = ?auto_122007 ?auto_122004 ) ) ( not ( = ?auto_122001 ?auto_122004 ) ) ( not ( = ?auto_122000 ?auto_122001 ) ) ( not ( = ?auto_122000 ?auto_122006 ) ) ( not ( = ?auto_122000 ?auto_122002 ) ) ( not ( = ?auto_122000 ?auto_122003 ) ) ( not ( = ?auto_122000 ?auto_122007 ) ) ( not ( = ?auto_122005 ?auto_122001 ) ) ( not ( = ?auto_122005 ?auto_122006 ) ) ( not ( = ?auto_122005 ?auto_122002 ) ) ( not ( = ?auto_122005 ?auto_122003 ) ) ( not ( = ?auto_122005 ?auto_122007 ) ) ( not ( = ?auto_122008 ?auto_122001 ) ) ( not ( = ?auto_122008 ?auto_122006 ) ) ( not ( = ?auto_122008 ?auto_122002 ) ) ( not ( = ?auto_122008 ?auto_122003 ) ) ( not ( = ?auto_122008 ?auto_122007 ) ) ( ON ?auto_122004 ?auto_122008 ) ( ON ?auto_122001 ?auto_122004 ) ( ON ?auto_122007 ?auto_122001 ) ( ON ?auto_122003 ?auto_122007 ) ( CLEAR ?auto_122003 ) ( HOLDING ?auto_122002 ) ( CLEAR ?auto_122006 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122006 ?auto_122002 )
      ( MAKE-1PILE ?auto_122000 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122009 - BLOCK
    )
    :vars
    (
      ?auto_122016 - BLOCK
      ?auto_122011 - BLOCK
      ?auto_122010 - BLOCK
      ?auto_122012 - BLOCK
      ?auto_122017 - BLOCK
      ?auto_122015 - BLOCK
      ?auto_122014 - BLOCK
      ?auto_122013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122009 ?auto_122016 ) ( not ( = ?auto_122009 ?auto_122016 ) ) ( not ( = ?auto_122009 ?auto_122011 ) ) ( not ( = ?auto_122009 ?auto_122010 ) ) ( not ( = ?auto_122016 ?auto_122011 ) ) ( not ( = ?auto_122016 ?auto_122010 ) ) ( not ( = ?auto_122011 ?auto_122010 ) ) ( ON ?auto_122011 ?auto_122009 ) ( ON-TABLE ?auto_122016 ) ( ON-TABLE ?auto_122012 ) ( not ( = ?auto_122012 ?auto_122017 ) ) ( not ( = ?auto_122012 ?auto_122015 ) ) ( not ( = ?auto_122012 ?auto_122014 ) ) ( not ( = ?auto_122012 ?auto_122013 ) ) ( not ( = ?auto_122012 ?auto_122010 ) ) ( not ( = ?auto_122017 ?auto_122015 ) ) ( not ( = ?auto_122017 ?auto_122014 ) ) ( not ( = ?auto_122017 ?auto_122013 ) ) ( not ( = ?auto_122017 ?auto_122010 ) ) ( not ( = ?auto_122015 ?auto_122014 ) ) ( not ( = ?auto_122015 ?auto_122013 ) ) ( not ( = ?auto_122015 ?auto_122010 ) ) ( not ( = ?auto_122014 ?auto_122013 ) ) ( not ( = ?auto_122014 ?auto_122010 ) ) ( not ( = ?auto_122013 ?auto_122010 ) ) ( not ( = ?auto_122009 ?auto_122013 ) ) ( not ( = ?auto_122009 ?auto_122012 ) ) ( not ( = ?auto_122009 ?auto_122017 ) ) ( not ( = ?auto_122009 ?auto_122015 ) ) ( not ( = ?auto_122009 ?auto_122014 ) ) ( not ( = ?auto_122016 ?auto_122013 ) ) ( not ( = ?auto_122016 ?auto_122012 ) ) ( not ( = ?auto_122016 ?auto_122017 ) ) ( not ( = ?auto_122016 ?auto_122015 ) ) ( not ( = ?auto_122016 ?auto_122014 ) ) ( not ( = ?auto_122011 ?auto_122013 ) ) ( not ( = ?auto_122011 ?auto_122012 ) ) ( not ( = ?auto_122011 ?auto_122017 ) ) ( not ( = ?auto_122011 ?auto_122015 ) ) ( not ( = ?auto_122011 ?auto_122014 ) ) ( ON ?auto_122010 ?auto_122011 ) ( ON ?auto_122013 ?auto_122010 ) ( ON ?auto_122014 ?auto_122013 ) ( ON ?auto_122015 ?auto_122014 ) ( CLEAR ?auto_122012 ) ( ON ?auto_122017 ?auto_122015 ) ( CLEAR ?auto_122017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122016 ?auto_122009 ?auto_122011 ?auto_122010 ?auto_122013 ?auto_122014 ?auto_122015 )
      ( MAKE-1PILE ?auto_122009 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122018 - BLOCK
    )
    :vars
    (
      ?auto_122023 - BLOCK
      ?auto_122021 - BLOCK
      ?auto_122020 - BLOCK
      ?auto_122019 - BLOCK
      ?auto_122022 - BLOCK
      ?auto_122025 - BLOCK
      ?auto_122026 - BLOCK
      ?auto_122024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122018 ?auto_122023 ) ( not ( = ?auto_122018 ?auto_122023 ) ) ( not ( = ?auto_122018 ?auto_122021 ) ) ( not ( = ?auto_122018 ?auto_122020 ) ) ( not ( = ?auto_122023 ?auto_122021 ) ) ( not ( = ?auto_122023 ?auto_122020 ) ) ( not ( = ?auto_122021 ?auto_122020 ) ) ( ON ?auto_122021 ?auto_122018 ) ( ON-TABLE ?auto_122023 ) ( not ( = ?auto_122019 ?auto_122022 ) ) ( not ( = ?auto_122019 ?auto_122025 ) ) ( not ( = ?auto_122019 ?auto_122026 ) ) ( not ( = ?auto_122019 ?auto_122024 ) ) ( not ( = ?auto_122019 ?auto_122020 ) ) ( not ( = ?auto_122022 ?auto_122025 ) ) ( not ( = ?auto_122022 ?auto_122026 ) ) ( not ( = ?auto_122022 ?auto_122024 ) ) ( not ( = ?auto_122022 ?auto_122020 ) ) ( not ( = ?auto_122025 ?auto_122026 ) ) ( not ( = ?auto_122025 ?auto_122024 ) ) ( not ( = ?auto_122025 ?auto_122020 ) ) ( not ( = ?auto_122026 ?auto_122024 ) ) ( not ( = ?auto_122026 ?auto_122020 ) ) ( not ( = ?auto_122024 ?auto_122020 ) ) ( not ( = ?auto_122018 ?auto_122024 ) ) ( not ( = ?auto_122018 ?auto_122019 ) ) ( not ( = ?auto_122018 ?auto_122022 ) ) ( not ( = ?auto_122018 ?auto_122025 ) ) ( not ( = ?auto_122018 ?auto_122026 ) ) ( not ( = ?auto_122023 ?auto_122024 ) ) ( not ( = ?auto_122023 ?auto_122019 ) ) ( not ( = ?auto_122023 ?auto_122022 ) ) ( not ( = ?auto_122023 ?auto_122025 ) ) ( not ( = ?auto_122023 ?auto_122026 ) ) ( not ( = ?auto_122021 ?auto_122024 ) ) ( not ( = ?auto_122021 ?auto_122019 ) ) ( not ( = ?auto_122021 ?auto_122022 ) ) ( not ( = ?auto_122021 ?auto_122025 ) ) ( not ( = ?auto_122021 ?auto_122026 ) ) ( ON ?auto_122020 ?auto_122021 ) ( ON ?auto_122024 ?auto_122020 ) ( ON ?auto_122026 ?auto_122024 ) ( ON ?auto_122025 ?auto_122026 ) ( ON ?auto_122022 ?auto_122025 ) ( CLEAR ?auto_122022 ) ( HOLDING ?auto_122019 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_122019 )
      ( MAKE-1PILE ?auto_122018 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122027 - BLOCK
    )
    :vars
    (
      ?auto_122034 - BLOCK
      ?auto_122030 - BLOCK
      ?auto_122028 - BLOCK
      ?auto_122033 - BLOCK
      ?auto_122032 - BLOCK
      ?auto_122035 - BLOCK
      ?auto_122031 - BLOCK
      ?auto_122029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122027 ?auto_122034 ) ( not ( = ?auto_122027 ?auto_122034 ) ) ( not ( = ?auto_122027 ?auto_122030 ) ) ( not ( = ?auto_122027 ?auto_122028 ) ) ( not ( = ?auto_122034 ?auto_122030 ) ) ( not ( = ?auto_122034 ?auto_122028 ) ) ( not ( = ?auto_122030 ?auto_122028 ) ) ( ON ?auto_122030 ?auto_122027 ) ( ON-TABLE ?auto_122034 ) ( not ( = ?auto_122033 ?auto_122032 ) ) ( not ( = ?auto_122033 ?auto_122035 ) ) ( not ( = ?auto_122033 ?auto_122031 ) ) ( not ( = ?auto_122033 ?auto_122029 ) ) ( not ( = ?auto_122033 ?auto_122028 ) ) ( not ( = ?auto_122032 ?auto_122035 ) ) ( not ( = ?auto_122032 ?auto_122031 ) ) ( not ( = ?auto_122032 ?auto_122029 ) ) ( not ( = ?auto_122032 ?auto_122028 ) ) ( not ( = ?auto_122035 ?auto_122031 ) ) ( not ( = ?auto_122035 ?auto_122029 ) ) ( not ( = ?auto_122035 ?auto_122028 ) ) ( not ( = ?auto_122031 ?auto_122029 ) ) ( not ( = ?auto_122031 ?auto_122028 ) ) ( not ( = ?auto_122029 ?auto_122028 ) ) ( not ( = ?auto_122027 ?auto_122029 ) ) ( not ( = ?auto_122027 ?auto_122033 ) ) ( not ( = ?auto_122027 ?auto_122032 ) ) ( not ( = ?auto_122027 ?auto_122035 ) ) ( not ( = ?auto_122027 ?auto_122031 ) ) ( not ( = ?auto_122034 ?auto_122029 ) ) ( not ( = ?auto_122034 ?auto_122033 ) ) ( not ( = ?auto_122034 ?auto_122032 ) ) ( not ( = ?auto_122034 ?auto_122035 ) ) ( not ( = ?auto_122034 ?auto_122031 ) ) ( not ( = ?auto_122030 ?auto_122029 ) ) ( not ( = ?auto_122030 ?auto_122033 ) ) ( not ( = ?auto_122030 ?auto_122032 ) ) ( not ( = ?auto_122030 ?auto_122035 ) ) ( not ( = ?auto_122030 ?auto_122031 ) ) ( ON ?auto_122028 ?auto_122030 ) ( ON ?auto_122029 ?auto_122028 ) ( ON ?auto_122031 ?auto_122029 ) ( ON ?auto_122035 ?auto_122031 ) ( ON ?auto_122032 ?auto_122035 ) ( ON ?auto_122033 ?auto_122032 ) ( CLEAR ?auto_122033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_122034 ?auto_122027 ?auto_122030 ?auto_122028 ?auto_122029 ?auto_122031 ?auto_122035 ?auto_122032 )
      ( MAKE-1PILE ?auto_122027 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_122049 - BLOCK
      ?auto_122050 - BLOCK
      ?auto_122051 - BLOCK
      ?auto_122052 - BLOCK
      ?auto_122053 - BLOCK
      ?auto_122054 - BLOCK
    )
    :vars
    (
      ?auto_122055 - BLOCK
      ?auto_122056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122055 ?auto_122054 ) ( CLEAR ?auto_122055 ) ( ON-TABLE ?auto_122049 ) ( ON ?auto_122050 ?auto_122049 ) ( ON ?auto_122051 ?auto_122050 ) ( ON ?auto_122052 ?auto_122051 ) ( ON ?auto_122053 ?auto_122052 ) ( ON ?auto_122054 ?auto_122053 ) ( not ( = ?auto_122049 ?auto_122050 ) ) ( not ( = ?auto_122049 ?auto_122051 ) ) ( not ( = ?auto_122049 ?auto_122052 ) ) ( not ( = ?auto_122049 ?auto_122053 ) ) ( not ( = ?auto_122049 ?auto_122054 ) ) ( not ( = ?auto_122049 ?auto_122055 ) ) ( not ( = ?auto_122050 ?auto_122051 ) ) ( not ( = ?auto_122050 ?auto_122052 ) ) ( not ( = ?auto_122050 ?auto_122053 ) ) ( not ( = ?auto_122050 ?auto_122054 ) ) ( not ( = ?auto_122050 ?auto_122055 ) ) ( not ( = ?auto_122051 ?auto_122052 ) ) ( not ( = ?auto_122051 ?auto_122053 ) ) ( not ( = ?auto_122051 ?auto_122054 ) ) ( not ( = ?auto_122051 ?auto_122055 ) ) ( not ( = ?auto_122052 ?auto_122053 ) ) ( not ( = ?auto_122052 ?auto_122054 ) ) ( not ( = ?auto_122052 ?auto_122055 ) ) ( not ( = ?auto_122053 ?auto_122054 ) ) ( not ( = ?auto_122053 ?auto_122055 ) ) ( not ( = ?auto_122054 ?auto_122055 ) ) ( HOLDING ?auto_122056 ) ( not ( = ?auto_122049 ?auto_122056 ) ) ( not ( = ?auto_122050 ?auto_122056 ) ) ( not ( = ?auto_122051 ?auto_122056 ) ) ( not ( = ?auto_122052 ?auto_122056 ) ) ( not ( = ?auto_122053 ?auto_122056 ) ) ( not ( = ?auto_122054 ?auto_122056 ) ) ( not ( = ?auto_122055 ?auto_122056 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_122056 )
      ( MAKE-6PILE ?auto_122049 ?auto_122050 ?auto_122051 ?auto_122052 ?auto_122053 ?auto_122054 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122174 - BLOCK
      ?auto_122175 - BLOCK
    )
    :vars
    (
      ?auto_122176 - BLOCK
      ?auto_122181 - BLOCK
      ?auto_122180 - BLOCK
      ?auto_122179 - BLOCK
      ?auto_122177 - BLOCK
      ?auto_122178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122174 ?auto_122175 ) ) ( ON ?auto_122175 ?auto_122176 ) ( not ( = ?auto_122174 ?auto_122176 ) ) ( not ( = ?auto_122175 ?auto_122176 ) ) ( ON ?auto_122174 ?auto_122175 ) ( CLEAR ?auto_122174 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_122181 ) ( ON ?auto_122180 ?auto_122181 ) ( ON ?auto_122179 ?auto_122180 ) ( ON ?auto_122177 ?auto_122179 ) ( ON ?auto_122178 ?auto_122177 ) ( ON ?auto_122176 ?auto_122178 ) ( not ( = ?auto_122181 ?auto_122180 ) ) ( not ( = ?auto_122181 ?auto_122179 ) ) ( not ( = ?auto_122181 ?auto_122177 ) ) ( not ( = ?auto_122181 ?auto_122178 ) ) ( not ( = ?auto_122181 ?auto_122176 ) ) ( not ( = ?auto_122181 ?auto_122175 ) ) ( not ( = ?auto_122181 ?auto_122174 ) ) ( not ( = ?auto_122180 ?auto_122179 ) ) ( not ( = ?auto_122180 ?auto_122177 ) ) ( not ( = ?auto_122180 ?auto_122178 ) ) ( not ( = ?auto_122180 ?auto_122176 ) ) ( not ( = ?auto_122180 ?auto_122175 ) ) ( not ( = ?auto_122180 ?auto_122174 ) ) ( not ( = ?auto_122179 ?auto_122177 ) ) ( not ( = ?auto_122179 ?auto_122178 ) ) ( not ( = ?auto_122179 ?auto_122176 ) ) ( not ( = ?auto_122179 ?auto_122175 ) ) ( not ( = ?auto_122179 ?auto_122174 ) ) ( not ( = ?auto_122177 ?auto_122178 ) ) ( not ( = ?auto_122177 ?auto_122176 ) ) ( not ( = ?auto_122177 ?auto_122175 ) ) ( not ( = ?auto_122177 ?auto_122174 ) ) ( not ( = ?auto_122178 ?auto_122176 ) ) ( not ( = ?auto_122178 ?auto_122175 ) ) ( not ( = ?auto_122178 ?auto_122174 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122181 ?auto_122180 ?auto_122179 ?auto_122177 ?auto_122178 ?auto_122176 ?auto_122175 )
      ( MAKE-2PILE ?auto_122174 ?auto_122175 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122184 - BLOCK
      ?auto_122185 - BLOCK
    )
    :vars
    (
      ?auto_122186 - BLOCK
      ?auto_122187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122184 ?auto_122185 ) ) ( ON ?auto_122185 ?auto_122186 ) ( CLEAR ?auto_122185 ) ( not ( = ?auto_122184 ?auto_122186 ) ) ( not ( = ?auto_122185 ?auto_122186 ) ) ( ON ?auto_122184 ?auto_122187 ) ( CLEAR ?auto_122184 ) ( HAND-EMPTY ) ( not ( = ?auto_122184 ?auto_122187 ) ) ( not ( = ?auto_122185 ?auto_122187 ) ) ( not ( = ?auto_122186 ?auto_122187 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_122184 ?auto_122187 )
      ( MAKE-2PILE ?auto_122184 ?auto_122185 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122188 - BLOCK
      ?auto_122189 - BLOCK
    )
    :vars
    (
      ?auto_122191 - BLOCK
      ?auto_122190 - BLOCK
      ?auto_122196 - BLOCK
      ?auto_122192 - BLOCK
      ?auto_122193 - BLOCK
      ?auto_122195 - BLOCK
      ?auto_122194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122188 ?auto_122189 ) ) ( not ( = ?auto_122188 ?auto_122191 ) ) ( not ( = ?auto_122189 ?auto_122191 ) ) ( ON ?auto_122188 ?auto_122190 ) ( CLEAR ?auto_122188 ) ( not ( = ?auto_122188 ?auto_122190 ) ) ( not ( = ?auto_122189 ?auto_122190 ) ) ( not ( = ?auto_122191 ?auto_122190 ) ) ( HOLDING ?auto_122189 ) ( CLEAR ?auto_122191 ) ( ON-TABLE ?auto_122196 ) ( ON ?auto_122192 ?auto_122196 ) ( ON ?auto_122193 ?auto_122192 ) ( ON ?auto_122195 ?auto_122193 ) ( ON ?auto_122194 ?auto_122195 ) ( ON ?auto_122191 ?auto_122194 ) ( not ( = ?auto_122196 ?auto_122192 ) ) ( not ( = ?auto_122196 ?auto_122193 ) ) ( not ( = ?auto_122196 ?auto_122195 ) ) ( not ( = ?auto_122196 ?auto_122194 ) ) ( not ( = ?auto_122196 ?auto_122191 ) ) ( not ( = ?auto_122196 ?auto_122189 ) ) ( not ( = ?auto_122192 ?auto_122193 ) ) ( not ( = ?auto_122192 ?auto_122195 ) ) ( not ( = ?auto_122192 ?auto_122194 ) ) ( not ( = ?auto_122192 ?auto_122191 ) ) ( not ( = ?auto_122192 ?auto_122189 ) ) ( not ( = ?auto_122193 ?auto_122195 ) ) ( not ( = ?auto_122193 ?auto_122194 ) ) ( not ( = ?auto_122193 ?auto_122191 ) ) ( not ( = ?auto_122193 ?auto_122189 ) ) ( not ( = ?auto_122195 ?auto_122194 ) ) ( not ( = ?auto_122195 ?auto_122191 ) ) ( not ( = ?auto_122195 ?auto_122189 ) ) ( not ( = ?auto_122194 ?auto_122191 ) ) ( not ( = ?auto_122194 ?auto_122189 ) ) ( not ( = ?auto_122188 ?auto_122196 ) ) ( not ( = ?auto_122188 ?auto_122192 ) ) ( not ( = ?auto_122188 ?auto_122193 ) ) ( not ( = ?auto_122188 ?auto_122195 ) ) ( not ( = ?auto_122188 ?auto_122194 ) ) ( not ( = ?auto_122190 ?auto_122196 ) ) ( not ( = ?auto_122190 ?auto_122192 ) ) ( not ( = ?auto_122190 ?auto_122193 ) ) ( not ( = ?auto_122190 ?auto_122195 ) ) ( not ( = ?auto_122190 ?auto_122194 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122196 ?auto_122192 ?auto_122193 ?auto_122195 ?auto_122194 ?auto_122191 ?auto_122189 )
      ( MAKE-2PILE ?auto_122188 ?auto_122189 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122197 - BLOCK
      ?auto_122198 - BLOCK
    )
    :vars
    (
      ?auto_122202 - BLOCK
      ?auto_122200 - BLOCK
      ?auto_122204 - BLOCK
      ?auto_122199 - BLOCK
      ?auto_122203 - BLOCK
      ?auto_122205 - BLOCK
      ?auto_122201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122197 ?auto_122198 ) ) ( not ( = ?auto_122197 ?auto_122202 ) ) ( not ( = ?auto_122198 ?auto_122202 ) ) ( ON ?auto_122197 ?auto_122200 ) ( not ( = ?auto_122197 ?auto_122200 ) ) ( not ( = ?auto_122198 ?auto_122200 ) ) ( not ( = ?auto_122202 ?auto_122200 ) ) ( CLEAR ?auto_122202 ) ( ON-TABLE ?auto_122204 ) ( ON ?auto_122199 ?auto_122204 ) ( ON ?auto_122203 ?auto_122199 ) ( ON ?auto_122205 ?auto_122203 ) ( ON ?auto_122201 ?auto_122205 ) ( ON ?auto_122202 ?auto_122201 ) ( not ( = ?auto_122204 ?auto_122199 ) ) ( not ( = ?auto_122204 ?auto_122203 ) ) ( not ( = ?auto_122204 ?auto_122205 ) ) ( not ( = ?auto_122204 ?auto_122201 ) ) ( not ( = ?auto_122204 ?auto_122202 ) ) ( not ( = ?auto_122204 ?auto_122198 ) ) ( not ( = ?auto_122199 ?auto_122203 ) ) ( not ( = ?auto_122199 ?auto_122205 ) ) ( not ( = ?auto_122199 ?auto_122201 ) ) ( not ( = ?auto_122199 ?auto_122202 ) ) ( not ( = ?auto_122199 ?auto_122198 ) ) ( not ( = ?auto_122203 ?auto_122205 ) ) ( not ( = ?auto_122203 ?auto_122201 ) ) ( not ( = ?auto_122203 ?auto_122202 ) ) ( not ( = ?auto_122203 ?auto_122198 ) ) ( not ( = ?auto_122205 ?auto_122201 ) ) ( not ( = ?auto_122205 ?auto_122202 ) ) ( not ( = ?auto_122205 ?auto_122198 ) ) ( not ( = ?auto_122201 ?auto_122202 ) ) ( not ( = ?auto_122201 ?auto_122198 ) ) ( not ( = ?auto_122197 ?auto_122204 ) ) ( not ( = ?auto_122197 ?auto_122199 ) ) ( not ( = ?auto_122197 ?auto_122203 ) ) ( not ( = ?auto_122197 ?auto_122205 ) ) ( not ( = ?auto_122197 ?auto_122201 ) ) ( not ( = ?auto_122200 ?auto_122204 ) ) ( not ( = ?auto_122200 ?auto_122199 ) ) ( not ( = ?auto_122200 ?auto_122203 ) ) ( not ( = ?auto_122200 ?auto_122205 ) ) ( not ( = ?auto_122200 ?auto_122201 ) ) ( ON ?auto_122198 ?auto_122197 ) ( CLEAR ?auto_122198 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_122200 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122200 ?auto_122197 )
      ( MAKE-2PILE ?auto_122197 ?auto_122198 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122206 - BLOCK
      ?auto_122207 - BLOCK
    )
    :vars
    (
      ?auto_122211 - BLOCK
      ?auto_122214 - BLOCK
      ?auto_122209 - BLOCK
      ?auto_122213 - BLOCK
      ?auto_122212 - BLOCK
      ?auto_122208 - BLOCK
      ?auto_122210 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122206 ?auto_122207 ) ) ( not ( = ?auto_122206 ?auto_122211 ) ) ( not ( = ?auto_122207 ?auto_122211 ) ) ( ON ?auto_122206 ?auto_122214 ) ( not ( = ?auto_122206 ?auto_122214 ) ) ( not ( = ?auto_122207 ?auto_122214 ) ) ( not ( = ?auto_122211 ?auto_122214 ) ) ( ON-TABLE ?auto_122209 ) ( ON ?auto_122213 ?auto_122209 ) ( ON ?auto_122212 ?auto_122213 ) ( ON ?auto_122208 ?auto_122212 ) ( ON ?auto_122210 ?auto_122208 ) ( not ( = ?auto_122209 ?auto_122213 ) ) ( not ( = ?auto_122209 ?auto_122212 ) ) ( not ( = ?auto_122209 ?auto_122208 ) ) ( not ( = ?auto_122209 ?auto_122210 ) ) ( not ( = ?auto_122209 ?auto_122211 ) ) ( not ( = ?auto_122209 ?auto_122207 ) ) ( not ( = ?auto_122213 ?auto_122212 ) ) ( not ( = ?auto_122213 ?auto_122208 ) ) ( not ( = ?auto_122213 ?auto_122210 ) ) ( not ( = ?auto_122213 ?auto_122211 ) ) ( not ( = ?auto_122213 ?auto_122207 ) ) ( not ( = ?auto_122212 ?auto_122208 ) ) ( not ( = ?auto_122212 ?auto_122210 ) ) ( not ( = ?auto_122212 ?auto_122211 ) ) ( not ( = ?auto_122212 ?auto_122207 ) ) ( not ( = ?auto_122208 ?auto_122210 ) ) ( not ( = ?auto_122208 ?auto_122211 ) ) ( not ( = ?auto_122208 ?auto_122207 ) ) ( not ( = ?auto_122210 ?auto_122211 ) ) ( not ( = ?auto_122210 ?auto_122207 ) ) ( not ( = ?auto_122206 ?auto_122209 ) ) ( not ( = ?auto_122206 ?auto_122213 ) ) ( not ( = ?auto_122206 ?auto_122212 ) ) ( not ( = ?auto_122206 ?auto_122208 ) ) ( not ( = ?auto_122206 ?auto_122210 ) ) ( not ( = ?auto_122214 ?auto_122209 ) ) ( not ( = ?auto_122214 ?auto_122213 ) ) ( not ( = ?auto_122214 ?auto_122212 ) ) ( not ( = ?auto_122214 ?auto_122208 ) ) ( not ( = ?auto_122214 ?auto_122210 ) ) ( ON ?auto_122207 ?auto_122206 ) ( CLEAR ?auto_122207 ) ( ON-TABLE ?auto_122214 ) ( HOLDING ?auto_122211 ) ( CLEAR ?auto_122210 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122209 ?auto_122213 ?auto_122212 ?auto_122208 ?auto_122210 ?auto_122211 )
      ( MAKE-2PILE ?auto_122206 ?auto_122207 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122215 - BLOCK
      ?auto_122216 - BLOCK
    )
    :vars
    (
      ?auto_122220 - BLOCK
      ?auto_122219 - BLOCK
      ?auto_122222 - BLOCK
      ?auto_122218 - BLOCK
      ?auto_122221 - BLOCK
      ?auto_122217 - BLOCK
      ?auto_122223 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122215 ?auto_122216 ) ) ( not ( = ?auto_122215 ?auto_122220 ) ) ( not ( = ?auto_122216 ?auto_122220 ) ) ( ON ?auto_122215 ?auto_122219 ) ( not ( = ?auto_122215 ?auto_122219 ) ) ( not ( = ?auto_122216 ?auto_122219 ) ) ( not ( = ?auto_122220 ?auto_122219 ) ) ( ON-TABLE ?auto_122222 ) ( ON ?auto_122218 ?auto_122222 ) ( ON ?auto_122221 ?auto_122218 ) ( ON ?auto_122217 ?auto_122221 ) ( ON ?auto_122223 ?auto_122217 ) ( not ( = ?auto_122222 ?auto_122218 ) ) ( not ( = ?auto_122222 ?auto_122221 ) ) ( not ( = ?auto_122222 ?auto_122217 ) ) ( not ( = ?auto_122222 ?auto_122223 ) ) ( not ( = ?auto_122222 ?auto_122220 ) ) ( not ( = ?auto_122222 ?auto_122216 ) ) ( not ( = ?auto_122218 ?auto_122221 ) ) ( not ( = ?auto_122218 ?auto_122217 ) ) ( not ( = ?auto_122218 ?auto_122223 ) ) ( not ( = ?auto_122218 ?auto_122220 ) ) ( not ( = ?auto_122218 ?auto_122216 ) ) ( not ( = ?auto_122221 ?auto_122217 ) ) ( not ( = ?auto_122221 ?auto_122223 ) ) ( not ( = ?auto_122221 ?auto_122220 ) ) ( not ( = ?auto_122221 ?auto_122216 ) ) ( not ( = ?auto_122217 ?auto_122223 ) ) ( not ( = ?auto_122217 ?auto_122220 ) ) ( not ( = ?auto_122217 ?auto_122216 ) ) ( not ( = ?auto_122223 ?auto_122220 ) ) ( not ( = ?auto_122223 ?auto_122216 ) ) ( not ( = ?auto_122215 ?auto_122222 ) ) ( not ( = ?auto_122215 ?auto_122218 ) ) ( not ( = ?auto_122215 ?auto_122221 ) ) ( not ( = ?auto_122215 ?auto_122217 ) ) ( not ( = ?auto_122215 ?auto_122223 ) ) ( not ( = ?auto_122219 ?auto_122222 ) ) ( not ( = ?auto_122219 ?auto_122218 ) ) ( not ( = ?auto_122219 ?auto_122221 ) ) ( not ( = ?auto_122219 ?auto_122217 ) ) ( not ( = ?auto_122219 ?auto_122223 ) ) ( ON ?auto_122216 ?auto_122215 ) ( ON-TABLE ?auto_122219 ) ( CLEAR ?auto_122223 ) ( ON ?auto_122220 ?auto_122216 ) ( CLEAR ?auto_122220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122219 ?auto_122215 ?auto_122216 )
      ( MAKE-2PILE ?auto_122215 ?auto_122216 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122224 - BLOCK
      ?auto_122225 - BLOCK
    )
    :vars
    (
      ?auto_122231 - BLOCK
      ?auto_122232 - BLOCK
      ?auto_122228 - BLOCK
      ?auto_122229 - BLOCK
      ?auto_122230 - BLOCK
      ?auto_122227 - BLOCK
      ?auto_122226 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122224 ?auto_122225 ) ) ( not ( = ?auto_122224 ?auto_122231 ) ) ( not ( = ?auto_122225 ?auto_122231 ) ) ( ON ?auto_122224 ?auto_122232 ) ( not ( = ?auto_122224 ?auto_122232 ) ) ( not ( = ?auto_122225 ?auto_122232 ) ) ( not ( = ?auto_122231 ?auto_122232 ) ) ( ON-TABLE ?auto_122228 ) ( ON ?auto_122229 ?auto_122228 ) ( ON ?auto_122230 ?auto_122229 ) ( ON ?auto_122227 ?auto_122230 ) ( not ( = ?auto_122228 ?auto_122229 ) ) ( not ( = ?auto_122228 ?auto_122230 ) ) ( not ( = ?auto_122228 ?auto_122227 ) ) ( not ( = ?auto_122228 ?auto_122226 ) ) ( not ( = ?auto_122228 ?auto_122231 ) ) ( not ( = ?auto_122228 ?auto_122225 ) ) ( not ( = ?auto_122229 ?auto_122230 ) ) ( not ( = ?auto_122229 ?auto_122227 ) ) ( not ( = ?auto_122229 ?auto_122226 ) ) ( not ( = ?auto_122229 ?auto_122231 ) ) ( not ( = ?auto_122229 ?auto_122225 ) ) ( not ( = ?auto_122230 ?auto_122227 ) ) ( not ( = ?auto_122230 ?auto_122226 ) ) ( not ( = ?auto_122230 ?auto_122231 ) ) ( not ( = ?auto_122230 ?auto_122225 ) ) ( not ( = ?auto_122227 ?auto_122226 ) ) ( not ( = ?auto_122227 ?auto_122231 ) ) ( not ( = ?auto_122227 ?auto_122225 ) ) ( not ( = ?auto_122226 ?auto_122231 ) ) ( not ( = ?auto_122226 ?auto_122225 ) ) ( not ( = ?auto_122224 ?auto_122228 ) ) ( not ( = ?auto_122224 ?auto_122229 ) ) ( not ( = ?auto_122224 ?auto_122230 ) ) ( not ( = ?auto_122224 ?auto_122227 ) ) ( not ( = ?auto_122224 ?auto_122226 ) ) ( not ( = ?auto_122232 ?auto_122228 ) ) ( not ( = ?auto_122232 ?auto_122229 ) ) ( not ( = ?auto_122232 ?auto_122230 ) ) ( not ( = ?auto_122232 ?auto_122227 ) ) ( not ( = ?auto_122232 ?auto_122226 ) ) ( ON ?auto_122225 ?auto_122224 ) ( ON-TABLE ?auto_122232 ) ( ON ?auto_122231 ?auto_122225 ) ( CLEAR ?auto_122231 ) ( HOLDING ?auto_122226 ) ( CLEAR ?auto_122227 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122228 ?auto_122229 ?auto_122230 ?auto_122227 ?auto_122226 )
      ( MAKE-2PILE ?auto_122224 ?auto_122225 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122233 - BLOCK
      ?auto_122234 - BLOCK
    )
    :vars
    (
      ?auto_122241 - BLOCK
      ?auto_122240 - BLOCK
      ?auto_122235 - BLOCK
      ?auto_122238 - BLOCK
      ?auto_122236 - BLOCK
      ?auto_122239 - BLOCK
      ?auto_122237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122233 ?auto_122234 ) ) ( not ( = ?auto_122233 ?auto_122241 ) ) ( not ( = ?auto_122234 ?auto_122241 ) ) ( ON ?auto_122233 ?auto_122240 ) ( not ( = ?auto_122233 ?auto_122240 ) ) ( not ( = ?auto_122234 ?auto_122240 ) ) ( not ( = ?auto_122241 ?auto_122240 ) ) ( ON-TABLE ?auto_122235 ) ( ON ?auto_122238 ?auto_122235 ) ( ON ?auto_122236 ?auto_122238 ) ( ON ?auto_122239 ?auto_122236 ) ( not ( = ?auto_122235 ?auto_122238 ) ) ( not ( = ?auto_122235 ?auto_122236 ) ) ( not ( = ?auto_122235 ?auto_122239 ) ) ( not ( = ?auto_122235 ?auto_122237 ) ) ( not ( = ?auto_122235 ?auto_122241 ) ) ( not ( = ?auto_122235 ?auto_122234 ) ) ( not ( = ?auto_122238 ?auto_122236 ) ) ( not ( = ?auto_122238 ?auto_122239 ) ) ( not ( = ?auto_122238 ?auto_122237 ) ) ( not ( = ?auto_122238 ?auto_122241 ) ) ( not ( = ?auto_122238 ?auto_122234 ) ) ( not ( = ?auto_122236 ?auto_122239 ) ) ( not ( = ?auto_122236 ?auto_122237 ) ) ( not ( = ?auto_122236 ?auto_122241 ) ) ( not ( = ?auto_122236 ?auto_122234 ) ) ( not ( = ?auto_122239 ?auto_122237 ) ) ( not ( = ?auto_122239 ?auto_122241 ) ) ( not ( = ?auto_122239 ?auto_122234 ) ) ( not ( = ?auto_122237 ?auto_122241 ) ) ( not ( = ?auto_122237 ?auto_122234 ) ) ( not ( = ?auto_122233 ?auto_122235 ) ) ( not ( = ?auto_122233 ?auto_122238 ) ) ( not ( = ?auto_122233 ?auto_122236 ) ) ( not ( = ?auto_122233 ?auto_122239 ) ) ( not ( = ?auto_122233 ?auto_122237 ) ) ( not ( = ?auto_122240 ?auto_122235 ) ) ( not ( = ?auto_122240 ?auto_122238 ) ) ( not ( = ?auto_122240 ?auto_122236 ) ) ( not ( = ?auto_122240 ?auto_122239 ) ) ( not ( = ?auto_122240 ?auto_122237 ) ) ( ON ?auto_122234 ?auto_122233 ) ( ON-TABLE ?auto_122240 ) ( ON ?auto_122241 ?auto_122234 ) ( CLEAR ?auto_122239 ) ( ON ?auto_122237 ?auto_122241 ) ( CLEAR ?auto_122237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_122240 ?auto_122233 ?auto_122234 ?auto_122241 )
      ( MAKE-2PILE ?auto_122233 ?auto_122234 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122242 - BLOCK
      ?auto_122243 - BLOCK
    )
    :vars
    (
      ?auto_122248 - BLOCK
      ?auto_122245 - BLOCK
      ?auto_122247 - BLOCK
      ?auto_122249 - BLOCK
      ?auto_122244 - BLOCK
      ?auto_122246 - BLOCK
      ?auto_122250 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122242 ?auto_122243 ) ) ( not ( = ?auto_122242 ?auto_122248 ) ) ( not ( = ?auto_122243 ?auto_122248 ) ) ( ON ?auto_122242 ?auto_122245 ) ( not ( = ?auto_122242 ?auto_122245 ) ) ( not ( = ?auto_122243 ?auto_122245 ) ) ( not ( = ?auto_122248 ?auto_122245 ) ) ( ON-TABLE ?auto_122247 ) ( ON ?auto_122249 ?auto_122247 ) ( ON ?auto_122244 ?auto_122249 ) ( not ( = ?auto_122247 ?auto_122249 ) ) ( not ( = ?auto_122247 ?auto_122244 ) ) ( not ( = ?auto_122247 ?auto_122246 ) ) ( not ( = ?auto_122247 ?auto_122250 ) ) ( not ( = ?auto_122247 ?auto_122248 ) ) ( not ( = ?auto_122247 ?auto_122243 ) ) ( not ( = ?auto_122249 ?auto_122244 ) ) ( not ( = ?auto_122249 ?auto_122246 ) ) ( not ( = ?auto_122249 ?auto_122250 ) ) ( not ( = ?auto_122249 ?auto_122248 ) ) ( not ( = ?auto_122249 ?auto_122243 ) ) ( not ( = ?auto_122244 ?auto_122246 ) ) ( not ( = ?auto_122244 ?auto_122250 ) ) ( not ( = ?auto_122244 ?auto_122248 ) ) ( not ( = ?auto_122244 ?auto_122243 ) ) ( not ( = ?auto_122246 ?auto_122250 ) ) ( not ( = ?auto_122246 ?auto_122248 ) ) ( not ( = ?auto_122246 ?auto_122243 ) ) ( not ( = ?auto_122250 ?auto_122248 ) ) ( not ( = ?auto_122250 ?auto_122243 ) ) ( not ( = ?auto_122242 ?auto_122247 ) ) ( not ( = ?auto_122242 ?auto_122249 ) ) ( not ( = ?auto_122242 ?auto_122244 ) ) ( not ( = ?auto_122242 ?auto_122246 ) ) ( not ( = ?auto_122242 ?auto_122250 ) ) ( not ( = ?auto_122245 ?auto_122247 ) ) ( not ( = ?auto_122245 ?auto_122249 ) ) ( not ( = ?auto_122245 ?auto_122244 ) ) ( not ( = ?auto_122245 ?auto_122246 ) ) ( not ( = ?auto_122245 ?auto_122250 ) ) ( ON ?auto_122243 ?auto_122242 ) ( ON-TABLE ?auto_122245 ) ( ON ?auto_122248 ?auto_122243 ) ( ON ?auto_122250 ?auto_122248 ) ( CLEAR ?auto_122250 ) ( HOLDING ?auto_122246 ) ( CLEAR ?auto_122244 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_122247 ?auto_122249 ?auto_122244 ?auto_122246 )
      ( MAKE-2PILE ?auto_122242 ?auto_122243 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122251 - BLOCK
      ?auto_122252 - BLOCK
    )
    :vars
    (
      ?auto_122256 - BLOCK
      ?auto_122257 - BLOCK
      ?auto_122258 - BLOCK
      ?auto_122254 - BLOCK
      ?auto_122253 - BLOCK
      ?auto_122259 - BLOCK
      ?auto_122255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122251 ?auto_122252 ) ) ( not ( = ?auto_122251 ?auto_122256 ) ) ( not ( = ?auto_122252 ?auto_122256 ) ) ( ON ?auto_122251 ?auto_122257 ) ( not ( = ?auto_122251 ?auto_122257 ) ) ( not ( = ?auto_122252 ?auto_122257 ) ) ( not ( = ?auto_122256 ?auto_122257 ) ) ( ON-TABLE ?auto_122258 ) ( ON ?auto_122254 ?auto_122258 ) ( ON ?auto_122253 ?auto_122254 ) ( not ( = ?auto_122258 ?auto_122254 ) ) ( not ( = ?auto_122258 ?auto_122253 ) ) ( not ( = ?auto_122258 ?auto_122259 ) ) ( not ( = ?auto_122258 ?auto_122255 ) ) ( not ( = ?auto_122258 ?auto_122256 ) ) ( not ( = ?auto_122258 ?auto_122252 ) ) ( not ( = ?auto_122254 ?auto_122253 ) ) ( not ( = ?auto_122254 ?auto_122259 ) ) ( not ( = ?auto_122254 ?auto_122255 ) ) ( not ( = ?auto_122254 ?auto_122256 ) ) ( not ( = ?auto_122254 ?auto_122252 ) ) ( not ( = ?auto_122253 ?auto_122259 ) ) ( not ( = ?auto_122253 ?auto_122255 ) ) ( not ( = ?auto_122253 ?auto_122256 ) ) ( not ( = ?auto_122253 ?auto_122252 ) ) ( not ( = ?auto_122259 ?auto_122255 ) ) ( not ( = ?auto_122259 ?auto_122256 ) ) ( not ( = ?auto_122259 ?auto_122252 ) ) ( not ( = ?auto_122255 ?auto_122256 ) ) ( not ( = ?auto_122255 ?auto_122252 ) ) ( not ( = ?auto_122251 ?auto_122258 ) ) ( not ( = ?auto_122251 ?auto_122254 ) ) ( not ( = ?auto_122251 ?auto_122253 ) ) ( not ( = ?auto_122251 ?auto_122259 ) ) ( not ( = ?auto_122251 ?auto_122255 ) ) ( not ( = ?auto_122257 ?auto_122258 ) ) ( not ( = ?auto_122257 ?auto_122254 ) ) ( not ( = ?auto_122257 ?auto_122253 ) ) ( not ( = ?auto_122257 ?auto_122259 ) ) ( not ( = ?auto_122257 ?auto_122255 ) ) ( ON ?auto_122252 ?auto_122251 ) ( ON-TABLE ?auto_122257 ) ( ON ?auto_122256 ?auto_122252 ) ( ON ?auto_122255 ?auto_122256 ) ( CLEAR ?auto_122253 ) ( ON ?auto_122259 ?auto_122255 ) ( CLEAR ?auto_122259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122257 ?auto_122251 ?auto_122252 ?auto_122256 ?auto_122255 )
      ( MAKE-2PILE ?auto_122251 ?auto_122252 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122260 - BLOCK
      ?auto_122261 - BLOCK
    )
    :vars
    (
      ?auto_122265 - BLOCK
      ?auto_122262 - BLOCK
      ?auto_122268 - BLOCK
      ?auto_122263 - BLOCK
      ?auto_122266 - BLOCK
      ?auto_122264 - BLOCK
      ?auto_122267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122260 ?auto_122261 ) ) ( not ( = ?auto_122260 ?auto_122265 ) ) ( not ( = ?auto_122261 ?auto_122265 ) ) ( ON ?auto_122260 ?auto_122262 ) ( not ( = ?auto_122260 ?auto_122262 ) ) ( not ( = ?auto_122261 ?auto_122262 ) ) ( not ( = ?auto_122265 ?auto_122262 ) ) ( ON-TABLE ?auto_122268 ) ( ON ?auto_122263 ?auto_122268 ) ( not ( = ?auto_122268 ?auto_122263 ) ) ( not ( = ?auto_122268 ?auto_122266 ) ) ( not ( = ?auto_122268 ?auto_122264 ) ) ( not ( = ?auto_122268 ?auto_122267 ) ) ( not ( = ?auto_122268 ?auto_122265 ) ) ( not ( = ?auto_122268 ?auto_122261 ) ) ( not ( = ?auto_122263 ?auto_122266 ) ) ( not ( = ?auto_122263 ?auto_122264 ) ) ( not ( = ?auto_122263 ?auto_122267 ) ) ( not ( = ?auto_122263 ?auto_122265 ) ) ( not ( = ?auto_122263 ?auto_122261 ) ) ( not ( = ?auto_122266 ?auto_122264 ) ) ( not ( = ?auto_122266 ?auto_122267 ) ) ( not ( = ?auto_122266 ?auto_122265 ) ) ( not ( = ?auto_122266 ?auto_122261 ) ) ( not ( = ?auto_122264 ?auto_122267 ) ) ( not ( = ?auto_122264 ?auto_122265 ) ) ( not ( = ?auto_122264 ?auto_122261 ) ) ( not ( = ?auto_122267 ?auto_122265 ) ) ( not ( = ?auto_122267 ?auto_122261 ) ) ( not ( = ?auto_122260 ?auto_122268 ) ) ( not ( = ?auto_122260 ?auto_122263 ) ) ( not ( = ?auto_122260 ?auto_122266 ) ) ( not ( = ?auto_122260 ?auto_122264 ) ) ( not ( = ?auto_122260 ?auto_122267 ) ) ( not ( = ?auto_122262 ?auto_122268 ) ) ( not ( = ?auto_122262 ?auto_122263 ) ) ( not ( = ?auto_122262 ?auto_122266 ) ) ( not ( = ?auto_122262 ?auto_122264 ) ) ( not ( = ?auto_122262 ?auto_122267 ) ) ( ON ?auto_122261 ?auto_122260 ) ( ON-TABLE ?auto_122262 ) ( ON ?auto_122265 ?auto_122261 ) ( ON ?auto_122267 ?auto_122265 ) ( ON ?auto_122264 ?auto_122267 ) ( CLEAR ?auto_122264 ) ( HOLDING ?auto_122266 ) ( CLEAR ?auto_122263 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122268 ?auto_122263 ?auto_122266 )
      ( MAKE-2PILE ?auto_122260 ?auto_122261 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122269 - BLOCK
      ?auto_122270 - BLOCK
    )
    :vars
    (
      ?auto_122271 - BLOCK
      ?auto_122274 - BLOCK
      ?auto_122275 - BLOCK
      ?auto_122272 - BLOCK
      ?auto_122276 - BLOCK
      ?auto_122273 - BLOCK
      ?auto_122277 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122269 ?auto_122270 ) ) ( not ( = ?auto_122269 ?auto_122271 ) ) ( not ( = ?auto_122270 ?auto_122271 ) ) ( ON ?auto_122269 ?auto_122274 ) ( not ( = ?auto_122269 ?auto_122274 ) ) ( not ( = ?auto_122270 ?auto_122274 ) ) ( not ( = ?auto_122271 ?auto_122274 ) ) ( ON-TABLE ?auto_122275 ) ( ON ?auto_122272 ?auto_122275 ) ( not ( = ?auto_122275 ?auto_122272 ) ) ( not ( = ?auto_122275 ?auto_122276 ) ) ( not ( = ?auto_122275 ?auto_122273 ) ) ( not ( = ?auto_122275 ?auto_122277 ) ) ( not ( = ?auto_122275 ?auto_122271 ) ) ( not ( = ?auto_122275 ?auto_122270 ) ) ( not ( = ?auto_122272 ?auto_122276 ) ) ( not ( = ?auto_122272 ?auto_122273 ) ) ( not ( = ?auto_122272 ?auto_122277 ) ) ( not ( = ?auto_122272 ?auto_122271 ) ) ( not ( = ?auto_122272 ?auto_122270 ) ) ( not ( = ?auto_122276 ?auto_122273 ) ) ( not ( = ?auto_122276 ?auto_122277 ) ) ( not ( = ?auto_122276 ?auto_122271 ) ) ( not ( = ?auto_122276 ?auto_122270 ) ) ( not ( = ?auto_122273 ?auto_122277 ) ) ( not ( = ?auto_122273 ?auto_122271 ) ) ( not ( = ?auto_122273 ?auto_122270 ) ) ( not ( = ?auto_122277 ?auto_122271 ) ) ( not ( = ?auto_122277 ?auto_122270 ) ) ( not ( = ?auto_122269 ?auto_122275 ) ) ( not ( = ?auto_122269 ?auto_122272 ) ) ( not ( = ?auto_122269 ?auto_122276 ) ) ( not ( = ?auto_122269 ?auto_122273 ) ) ( not ( = ?auto_122269 ?auto_122277 ) ) ( not ( = ?auto_122274 ?auto_122275 ) ) ( not ( = ?auto_122274 ?auto_122272 ) ) ( not ( = ?auto_122274 ?auto_122276 ) ) ( not ( = ?auto_122274 ?auto_122273 ) ) ( not ( = ?auto_122274 ?auto_122277 ) ) ( ON ?auto_122270 ?auto_122269 ) ( ON-TABLE ?auto_122274 ) ( ON ?auto_122271 ?auto_122270 ) ( ON ?auto_122277 ?auto_122271 ) ( ON ?auto_122273 ?auto_122277 ) ( CLEAR ?auto_122272 ) ( ON ?auto_122276 ?auto_122273 ) ( CLEAR ?auto_122276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122274 ?auto_122269 ?auto_122270 ?auto_122271 ?auto_122277 ?auto_122273 )
      ( MAKE-2PILE ?auto_122269 ?auto_122270 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122278 - BLOCK
      ?auto_122279 - BLOCK
    )
    :vars
    (
      ?auto_122282 - BLOCK
      ?auto_122284 - BLOCK
      ?auto_122283 - BLOCK
      ?auto_122286 - BLOCK
      ?auto_122281 - BLOCK
      ?auto_122285 - BLOCK
      ?auto_122280 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122278 ?auto_122279 ) ) ( not ( = ?auto_122278 ?auto_122282 ) ) ( not ( = ?auto_122279 ?auto_122282 ) ) ( ON ?auto_122278 ?auto_122284 ) ( not ( = ?auto_122278 ?auto_122284 ) ) ( not ( = ?auto_122279 ?auto_122284 ) ) ( not ( = ?auto_122282 ?auto_122284 ) ) ( ON-TABLE ?auto_122283 ) ( not ( = ?auto_122283 ?auto_122286 ) ) ( not ( = ?auto_122283 ?auto_122281 ) ) ( not ( = ?auto_122283 ?auto_122285 ) ) ( not ( = ?auto_122283 ?auto_122280 ) ) ( not ( = ?auto_122283 ?auto_122282 ) ) ( not ( = ?auto_122283 ?auto_122279 ) ) ( not ( = ?auto_122286 ?auto_122281 ) ) ( not ( = ?auto_122286 ?auto_122285 ) ) ( not ( = ?auto_122286 ?auto_122280 ) ) ( not ( = ?auto_122286 ?auto_122282 ) ) ( not ( = ?auto_122286 ?auto_122279 ) ) ( not ( = ?auto_122281 ?auto_122285 ) ) ( not ( = ?auto_122281 ?auto_122280 ) ) ( not ( = ?auto_122281 ?auto_122282 ) ) ( not ( = ?auto_122281 ?auto_122279 ) ) ( not ( = ?auto_122285 ?auto_122280 ) ) ( not ( = ?auto_122285 ?auto_122282 ) ) ( not ( = ?auto_122285 ?auto_122279 ) ) ( not ( = ?auto_122280 ?auto_122282 ) ) ( not ( = ?auto_122280 ?auto_122279 ) ) ( not ( = ?auto_122278 ?auto_122283 ) ) ( not ( = ?auto_122278 ?auto_122286 ) ) ( not ( = ?auto_122278 ?auto_122281 ) ) ( not ( = ?auto_122278 ?auto_122285 ) ) ( not ( = ?auto_122278 ?auto_122280 ) ) ( not ( = ?auto_122284 ?auto_122283 ) ) ( not ( = ?auto_122284 ?auto_122286 ) ) ( not ( = ?auto_122284 ?auto_122281 ) ) ( not ( = ?auto_122284 ?auto_122285 ) ) ( not ( = ?auto_122284 ?auto_122280 ) ) ( ON ?auto_122279 ?auto_122278 ) ( ON-TABLE ?auto_122284 ) ( ON ?auto_122282 ?auto_122279 ) ( ON ?auto_122280 ?auto_122282 ) ( ON ?auto_122285 ?auto_122280 ) ( ON ?auto_122281 ?auto_122285 ) ( CLEAR ?auto_122281 ) ( HOLDING ?auto_122286 ) ( CLEAR ?auto_122283 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122283 ?auto_122286 )
      ( MAKE-2PILE ?auto_122278 ?auto_122279 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122287 - BLOCK
      ?auto_122288 - BLOCK
    )
    :vars
    (
      ?auto_122293 - BLOCK
      ?auto_122289 - BLOCK
      ?auto_122295 - BLOCK
      ?auto_122290 - BLOCK
      ?auto_122294 - BLOCK
      ?auto_122292 - BLOCK
      ?auto_122291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122287 ?auto_122288 ) ) ( not ( = ?auto_122287 ?auto_122293 ) ) ( not ( = ?auto_122288 ?auto_122293 ) ) ( ON ?auto_122287 ?auto_122289 ) ( not ( = ?auto_122287 ?auto_122289 ) ) ( not ( = ?auto_122288 ?auto_122289 ) ) ( not ( = ?auto_122293 ?auto_122289 ) ) ( ON-TABLE ?auto_122295 ) ( not ( = ?auto_122295 ?auto_122290 ) ) ( not ( = ?auto_122295 ?auto_122294 ) ) ( not ( = ?auto_122295 ?auto_122292 ) ) ( not ( = ?auto_122295 ?auto_122291 ) ) ( not ( = ?auto_122295 ?auto_122293 ) ) ( not ( = ?auto_122295 ?auto_122288 ) ) ( not ( = ?auto_122290 ?auto_122294 ) ) ( not ( = ?auto_122290 ?auto_122292 ) ) ( not ( = ?auto_122290 ?auto_122291 ) ) ( not ( = ?auto_122290 ?auto_122293 ) ) ( not ( = ?auto_122290 ?auto_122288 ) ) ( not ( = ?auto_122294 ?auto_122292 ) ) ( not ( = ?auto_122294 ?auto_122291 ) ) ( not ( = ?auto_122294 ?auto_122293 ) ) ( not ( = ?auto_122294 ?auto_122288 ) ) ( not ( = ?auto_122292 ?auto_122291 ) ) ( not ( = ?auto_122292 ?auto_122293 ) ) ( not ( = ?auto_122292 ?auto_122288 ) ) ( not ( = ?auto_122291 ?auto_122293 ) ) ( not ( = ?auto_122291 ?auto_122288 ) ) ( not ( = ?auto_122287 ?auto_122295 ) ) ( not ( = ?auto_122287 ?auto_122290 ) ) ( not ( = ?auto_122287 ?auto_122294 ) ) ( not ( = ?auto_122287 ?auto_122292 ) ) ( not ( = ?auto_122287 ?auto_122291 ) ) ( not ( = ?auto_122289 ?auto_122295 ) ) ( not ( = ?auto_122289 ?auto_122290 ) ) ( not ( = ?auto_122289 ?auto_122294 ) ) ( not ( = ?auto_122289 ?auto_122292 ) ) ( not ( = ?auto_122289 ?auto_122291 ) ) ( ON ?auto_122288 ?auto_122287 ) ( ON-TABLE ?auto_122289 ) ( ON ?auto_122293 ?auto_122288 ) ( ON ?auto_122291 ?auto_122293 ) ( ON ?auto_122292 ?auto_122291 ) ( ON ?auto_122294 ?auto_122292 ) ( CLEAR ?auto_122295 ) ( ON ?auto_122290 ?auto_122294 ) ( CLEAR ?auto_122290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122289 ?auto_122287 ?auto_122288 ?auto_122293 ?auto_122291 ?auto_122292 ?auto_122294 )
      ( MAKE-2PILE ?auto_122287 ?auto_122288 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122296 - BLOCK
      ?auto_122297 - BLOCK
    )
    :vars
    (
      ?auto_122304 - BLOCK
      ?auto_122303 - BLOCK
      ?auto_122300 - BLOCK
      ?auto_122298 - BLOCK
      ?auto_122302 - BLOCK
      ?auto_122301 - BLOCK
      ?auto_122299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122296 ?auto_122297 ) ) ( not ( = ?auto_122296 ?auto_122304 ) ) ( not ( = ?auto_122297 ?auto_122304 ) ) ( ON ?auto_122296 ?auto_122303 ) ( not ( = ?auto_122296 ?auto_122303 ) ) ( not ( = ?auto_122297 ?auto_122303 ) ) ( not ( = ?auto_122304 ?auto_122303 ) ) ( not ( = ?auto_122300 ?auto_122298 ) ) ( not ( = ?auto_122300 ?auto_122302 ) ) ( not ( = ?auto_122300 ?auto_122301 ) ) ( not ( = ?auto_122300 ?auto_122299 ) ) ( not ( = ?auto_122300 ?auto_122304 ) ) ( not ( = ?auto_122300 ?auto_122297 ) ) ( not ( = ?auto_122298 ?auto_122302 ) ) ( not ( = ?auto_122298 ?auto_122301 ) ) ( not ( = ?auto_122298 ?auto_122299 ) ) ( not ( = ?auto_122298 ?auto_122304 ) ) ( not ( = ?auto_122298 ?auto_122297 ) ) ( not ( = ?auto_122302 ?auto_122301 ) ) ( not ( = ?auto_122302 ?auto_122299 ) ) ( not ( = ?auto_122302 ?auto_122304 ) ) ( not ( = ?auto_122302 ?auto_122297 ) ) ( not ( = ?auto_122301 ?auto_122299 ) ) ( not ( = ?auto_122301 ?auto_122304 ) ) ( not ( = ?auto_122301 ?auto_122297 ) ) ( not ( = ?auto_122299 ?auto_122304 ) ) ( not ( = ?auto_122299 ?auto_122297 ) ) ( not ( = ?auto_122296 ?auto_122300 ) ) ( not ( = ?auto_122296 ?auto_122298 ) ) ( not ( = ?auto_122296 ?auto_122302 ) ) ( not ( = ?auto_122296 ?auto_122301 ) ) ( not ( = ?auto_122296 ?auto_122299 ) ) ( not ( = ?auto_122303 ?auto_122300 ) ) ( not ( = ?auto_122303 ?auto_122298 ) ) ( not ( = ?auto_122303 ?auto_122302 ) ) ( not ( = ?auto_122303 ?auto_122301 ) ) ( not ( = ?auto_122303 ?auto_122299 ) ) ( ON ?auto_122297 ?auto_122296 ) ( ON-TABLE ?auto_122303 ) ( ON ?auto_122304 ?auto_122297 ) ( ON ?auto_122299 ?auto_122304 ) ( ON ?auto_122301 ?auto_122299 ) ( ON ?auto_122302 ?auto_122301 ) ( ON ?auto_122298 ?auto_122302 ) ( CLEAR ?auto_122298 ) ( HOLDING ?auto_122300 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_122300 )
      ( MAKE-2PILE ?auto_122296 ?auto_122297 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122305 - BLOCK
      ?auto_122306 - BLOCK
    )
    :vars
    (
      ?auto_122309 - BLOCK
      ?auto_122313 - BLOCK
      ?auto_122312 - BLOCK
      ?auto_122311 - BLOCK
      ?auto_122307 - BLOCK
      ?auto_122310 - BLOCK
      ?auto_122308 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122305 ?auto_122306 ) ) ( not ( = ?auto_122305 ?auto_122309 ) ) ( not ( = ?auto_122306 ?auto_122309 ) ) ( ON ?auto_122305 ?auto_122313 ) ( not ( = ?auto_122305 ?auto_122313 ) ) ( not ( = ?auto_122306 ?auto_122313 ) ) ( not ( = ?auto_122309 ?auto_122313 ) ) ( not ( = ?auto_122312 ?auto_122311 ) ) ( not ( = ?auto_122312 ?auto_122307 ) ) ( not ( = ?auto_122312 ?auto_122310 ) ) ( not ( = ?auto_122312 ?auto_122308 ) ) ( not ( = ?auto_122312 ?auto_122309 ) ) ( not ( = ?auto_122312 ?auto_122306 ) ) ( not ( = ?auto_122311 ?auto_122307 ) ) ( not ( = ?auto_122311 ?auto_122310 ) ) ( not ( = ?auto_122311 ?auto_122308 ) ) ( not ( = ?auto_122311 ?auto_122309 ) ) ( not ( = ?auto_122311 ?auto_122306 ) ) ( not ( = ?auto_122307 ?auto_122310 ) ) ( not ( = ?auto_122307 ?auto_122308 ) ) ( not ( = ?auto_122307 ?auto_122309 ) ) ( not ( = ?auto_122307 ?auto_122306 ) ) ( not ( = ?auto_122310 ?auto_122308 ) ) ( not ( = ?auto_122310 ?auto_122309 ) ) ( not ( = ?auto_122310 ?auto_122306 ) ) ( not ( = ?auto_122308 ?auto_122309 ) ) ( not ( = ?auto_122308 ?auto_122306 ) ) ( not ( = ?auto_122305 ?auto_122312 ) ) ( not ( = ?auto_122305 ?auto_122311 ) ) ( not ( = ?auto_122305 ?auto_122307 ) ) ( not ( = ?auto_122305 ?auto_122310 ) ) ( not ( = ?auto_122305 ?auto_122308 ) ) ( not ( = ?auto_122313 ?auto_122312 ) ) ( not ( = ?auto_122313 ?auto_122311 ) ) ( not ( = ?auto_122313 ?auto_122307 ) ) ( not ( = ?auto_122313 ?auto_122310 ) ) ( not ( = ?auto_122313 ?auto_122308 ) ) ( ON ?auto_122306 ?auto_122305 ) ( ON-TABLE ?auto_122313 ) ( ON ?auto_122309 ?auto_122306 ) ( ON ?auto_122308 ?auto_122309 ) ( ON ?auto_122310 ?auto_122308 ) ( ON ?auto_122307 ?auto_122310 ) ( ON ?auto_122311 ?auto_122307 ) ( ON ?auto_122312 ?auto_122311 ) ( CLEAR ?auto_122312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_122313 ?auto_122305 ?auto_122306 ?auto_122309 ?auto_122308 ?auto_122310 ?auto_122307 ?auto_122311 )
      ( MAKE-2PILE ?auto_122305 ?auto_122306 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_122341 - BLOCK
      ?auto_122342 - BLOCK
      ?auto_122343 - BLOCK
      ?auto_122344 - BLOCK
      ?auto_122345 - BLOCK
    )
    :vars
    (
      ?auto_122348 - BLOCK
      ?auto_122346 - BLOCK
      ?auto_122347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122348 ?auto_122345 ) ( ON-TABLE ?auto_122341 ) ( ON ?auto_122342 ?auto_122341 ) ( ON ?auto_122343 ?auto_122342 ) ( ON ?auto_122344 ?auto_122343 ) ( ON ?auto_122345 ?auto_122344 ) ( not ( = ?auto_122341 ?auto_122342 ) ) ( not ( = ?auto_122341 ?auto_122343 ) ) ( not ( = ?auto_122341 ?auto_122344 ) ) ( not ( = ?auto_122341 ?auto_122345 ) ) ( not ( = ?auto_122341 ?auto_122348 ) ) ( not ( = ?auto_122342 ?auto_122343 ) ) ( not ( = ?auto_122342 ?auto_122344 ) ) ( not ( = ?auto_122342 ?auto_122345 ) ) ( not ( = ?auto_122342 ?auto_122348 ) ) ( not ( = ?auto_122343 ?auto_122344 ) ) ( not ( = ?auto_122343 ?auto_122345 ) ) ( not ( = ?auto_122343 ?auto_122348 ) ) ( not ( = ?auto_122344 ?auto_122345 ) ) ( not ( = ?auto_122344 ?auto_122348 ) ) ( not ( = ?auto_122345 ?auto_122348 ) ) ( not ( = ?auto_122341 ?auto_122346 ) ) ( not ( = ?auto_122341 ?auto_122347 ) ) ( not ( = ?auto_122342 ?auto_122346 ) ) ( not ( = ?auto_122342 ?auto_122347 ) ) ( not ( = ?auto_122343 ?auto_122346 ) ) ( not ( = ?auto_122343 ?auto_122347 ) ) ( not ( = ?auto_122344 ?auto_122346 ) ) ( not ( = ?auto_122344 ?auto_122347 ) ) ( not ( = ?auto_122345 ?auto_122346 ) ) ( not ( = ?auto_122345 ?auto_122347 ) ) ( not ( = ?auto_122348 ?auto_122346 ) ) ( not ( = ?auto_122348 ?auto_122347 ) ) ( not ( = ?auto_122346 ?auto_122347 ) ) ( ON ?auto_122346 ?auto_122348 ) ( CLEAR ?auto_122346 ) ( HOLDING ?auto_122347 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_122347 )
      ( MAKE-5PILE ?auto_122341 ?auto_122342 ?auto_122343 ?auto_122344 ?auto_122345 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122454 - BLOCK
      ?auto_122455 - BLOCK
      ?auto_122456 - BLOCK
    )
    :vars
    (
      ?auto_122457 - BLOCK
      ?auto_122458 - BLOCK
      ?auto_122460 - BLOCK
      ?auto_122461 - BLOCK
      ?auto_122459 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122454 ) ( not ( = ?auto_122454 ?auto_122455 ) ) ( not ( = ?auto_122454 ?auto_122456 ) ) ( not ( = ?auto_122455 ?auto_122456 ) ) ( ON ?auto_122456 ?auto_122457 ) ( not ( = ?auto_122454 ?auto_122457 ) ) ( not ( = ?auto_122455 ?auto_122457 ) ) ( not ( = ?auto_122456 ?auto_122457 ) ) ( CLEAR ?auto_122454 ) ( ON ?auto_122455 ?auto_122456 ) ( CLEAR ?auto_122455 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_122458 ) ( ON ?auto_122460 ?auto_122458 ) ( ON ?auto_122461 ?auto_122460 ) ( ON ?auto_122459 ?auto_122461 ) ( ON ?auto_122457 ?auto_122459 ) ( not ( = ?auto_122458 ?auto_122460 ) ) ( not ( = ?auto_122458 ?auto_122461 ) ) ( not ( = ?auto_122458 ?auto_122459 ) ) ( not ( = ?auto_122458 ?auto_122457 ) ) ( not ( = ?auto_122458 ?auto_122456 ) ) ( not ( = ?auto_122458 ?auto_122455 ) ) ( not ( = ?auto_122460 ?auto_122461 ) ) ( not ( = ?auto_122460 ?auto_122459 ) ) ( not ( = ?auto_122460 ?auto_122457 ) ) ( not ( = ?auto_122460 ?auto_122456 ) ) ( not ( = ?auto_122460 ?auto_122455 ) ) ( not ( = ?auto_122461 ?auto_122459 ) ) ( not ( = ?auto_122461 ?auto_122457 ) ) ( not ( = ?auto_122461 ?auto_122456 ) ) ( not ( = ?auto_122461 ?auto_122455 ) ) ( not ( = ?auto_122459 ?auto_122457 ) ) ( not ( = ?auto_122459 ?auto_122456 ) ) ( not ( = ?auto_122459 ?auto_122455 ) ) ( not ( = ?auto_122454 ?auto_122458 ) ) ( not ( = ?auto_122454 ?auto_122460 ) ) ( not ( = ?auto_122454 ?auto_122461 ) ) ( not ( = ?auto_122454 ?auto_122459 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122458 ?auto_122460 ?auto_122461 ?auto_122459 ?auto_122457 ?auto_122456 )
      ( MAKE-3PILE ?auto_122454 ?auto_122455 ?auto_122456 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122462 - BLOCK
      ?auto_122463 - BLOCK
      ?auto_122464 - BLOCK
    )
    :vars
    (
      ?auto_122465 - BLOCK
      ?auto_122469 - BLOCK
      ?auto_122467 - BLOCK
      ?auto_122468 - BLOCK
      ?auto_122466 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122462 ?auto_122463 ) ) ( not ( = ?auto_122462 ?auto_122464 ) ) ( not ( = ?auto_122463 ?auto_122464 ) ) ( ON ?auto_122464 ?auto_122465 ) ( not ( = ?auto_122462 ?auto_122465 ) ) ( not ( = ?auto_122463 ?auto_122465 ) ) ( not ( = ?auto_122464 ?auto_122465 ) ) ( ON ?auto_122463 ?auto_122464 ) ( CLEAR ?auto_122463 ) ( ON-TABLE ?auto_122469 ) ( ON ?auto_122467 ?auto_122469 ) ( ON ?auto_122468 ?auto_122467 ) ( ON ?auto_122466 ?auto_122468 ) ( ON ?auto_122465 ?auto_122466 ) ( not ( = ?auto_122469 ?auto_122467 ) ) ( not ( = ?auto_122469 ?auto_122468 ) ) ( not ( = ?auto_122469 ?auto_122466 ) ) ( not ( = ?auto_122469 ?auto_122465 ) ) ( not ( = ?auto_122469 ?auto_122464 ) ) ( not ( = ?auto_122469 ?auto_122463 ) ) ( not ( = ?auto_122467 ?auto_122468 ) ) ( not ( = ?auto_122467 ?auto_122466 ) ) ( not ( = ?auto_122467 ?auto_122465 ) ) ( not ( = ?auto_122467 ?auto_122464 ) ) ( not ( = ?auto_122467 ?auto_122463 ) ) ( not ( = ?auto_122468 ?auto_122466 ) ) ( not ( = ?auto_122468 ?auto_122465 ) ) ( not ( = ?auto_122468 ?auto_122464 ) ) ( not ( = ?auto_122468 ?auto_122463 ) ) ( not ( = ?auto_122466 ?auto_122465 ) ) ( not ( = ?auto_122466 ?auto_122464 ) ) ( not ( = ?auto_122466 ?auto_122463 ) ) ( not ( = ?auto_122462 ?auto_122469 ) ) ( not ( = ?auto_122462 ?auto_122467 ) ) ( not ( = ?auto_122462 ?auto_122468 ) ) ( not ( = ?auto_122462 ?auto_122466 ) ) ( HOLDING ?auto_122462 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_122462 )
      ( MAKE-3PILE ?auto_122462 ?auto_122463 ?auto_122464 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122470 - BLOCK
      ?auto_122471 - BLOCK
      ?auto_122472 - BLOCK
    )
    :vars
    (
      ?auto_122474 - BLOCK
      ?auto_122477 - BLOCK
      ?auto_122473 - BLOCK
      ?auto_122476 - BLOCK
      ?auto_122475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122470 ?auto_122471 ) ) ( not ( = ?auto_122470 ?auto_122472 ) ) ( not ( = ?auto_122471 ?auto_122472 ) ) ( ON ?auto_122472 ?auto_122474 ) ( not ( = ?auto_122470 ?auto_122474 ) ) ( not ( = ?auto_122471 ?auto_122474 ) ) ( not ( = ?auto_122472 ?auto_122474 ) ) ( ON ?auto_122471 ?auto_122472 ) ( ON-TABLE ?auto_122477 ) ( ON ?auto_122473 ?auto_122477 ) ( ON ?auto_122476 ?auto_122473 ) ( ON ?auto_122475 ?auto_122476 ) ( ON ?auto_122474 ?auto_122475 ) ( not ( = ?auto_122477 ?auto_122473 ) ) ( not ( = ?auto_122477 ?auto_122476 ) ) ( not ( = ?auto_122477 ?auto_122475 ) ) ( not ( = ?auto_122477 ?auto_122474 ) ) ( not ( = ?auto_122477 ?auto_122472 ) ) ( not ( = ?auto_122477 ?auto_122471 ) ) ( not ( = ?auto_122473 ?auto_122476 ) ) ( not ( = ?auto_122473 ?auto_122475 ) ) ( not ( = ?auto_122473 ?auto_122474 ) ) ( not ( = ?auto_122473 ?auto_122472 ) ) ( not ( = ?auto_122473 ?auto_122471 ) ) ( not ( = ?auto_122476 ?auto_122475 ) ) ( not ( = ?auto_122476 ?auto_122474 ) ) ( not ( = ?auto_122476 ?auto_122472 ) ) ( not ( = ?auto_122476 ?auto_122471 ) ) ( not ( = ?auto_122475 ?auto_122474 ) ) ( not ( = ?auto_122475 ?auto_122472 ) ) ( not ( = ?auto_122475 ?auto_122471 ) ) ( not ( = ?auto_122470 ?auto_122477 ) ) ( not ( = ?auto_122470 ?auto_122473 ) ) ( not ( = ?auto_122470 ?auto_122476 ) ) ( not ( = ?auto_122470 ?auto_122475 ) ) ( ON ?auto_122470 ?auto_122471 ) ( CLEAR ?auto_122470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122477 ?auto_122473 ?auto_122476 ?auto_122475 ?auto_122474 ?auto_122472 ?auto_122471 )
      ( MAKE-3PILE ?auto_122470 ?auto_122471 ?auto_122472 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122481 - BLOCK
      ?auto_122482 - BLOCK
      ?auto_122483 - BLOCK
    )
    :vars
    (
      ?auto_122487 - BLOCK
      ?auto_122488 - BLOCK
      ?auto_122485 - BLOCK
      ?auto_122486 - BLOCK
      ?auto_122484 - BLOCK
      ?auto_122489 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122481 ?auto_122482 ) ) ( not ( = ?auto_122481 ?auto_122483 ) ) ( not ( = ?auto_122482 ?auto_122483 ) ) ( ON ?auto_122483 ?auto_122487 ) ( not ( = ?auto_122481 ?auto_122487 ) ) ( not ( = ?auto_122482 ?auto_122487 ) ) ( not ( = ?auto_122483 ?auto_122487 ) ) ( ON ?auto_122482 ?auto_122483 ) ( CLEAR ?auto_122482 ) ( ON-TABLE ?auto_122488 ) ( ON ?auto_122485 ?auto_122488 ) ( ON ?auto_122486 ?auto_122485 ) ( ON ?auto_122484 ?auto_122486 ) ( ON ?auto_122487 ?auto_122484 ) ( not ( = ?auto_122488 ?auto_122485 ) ) ( not ( = ?auto_122488 ?auto_122486 ) ) ( not ( = ?auto_122488 ?auto_122484 ) ) ( not ( = ?auto_122488 ?auto_122487 ) ) ( not ( = ?auto_122488 ?auto_122483 ) ) ( not ( = ?auto_122488 ?auto_122482 ) ) ( not ( = ?auto_122485 ?auto_122486 ) ) ( not ( = ?auto_122485 ?auto_122484 ) ) ( not ( = ?auto_122485 ?auto_122487 ) ) ( not ( = ?auto_122485 ?auto_122483 ) ) ( not ( = ?auto_122485 ?auto_122482 ) ) ( not ( = ?auto_122486 ?auto_122484 ) ) ( not ( = ?auto_122486 ?auto_122487 ) ) ( not ( = ?auto_122486 ?auto_122483 ) ) ( not ( = ?auto_122486 ?auto_122482 ) ) ( not ( = ?auto_122484 ?auto_122487 ) ) ( not ( = ?auto_122484 ?auto_122483 ) ) ( not ( = ?auto_122484 ?auto_122482 ) ) ( not ( = ?auto_122481 ?auto_122488 ) ) ( not ( = ?auto_122481 ?auto_122485 ) ) ( not ( = ?auto_122481 ?auto_122486 ) ) ( not ( = ?auto_122481 ?auto_122484 ) ) ( ON ?auto_122481 ?auto_122489 ) ( CLEAR ?auto_122481 ) ( HAND-EMPTY ) ( not ( = ?auto_122481 ?auto_122489 ) ) ( not ( = ?auto_122482 ?auto_122489 ) ) ( not ( = ?auto_122483 ?auto_122489 ) ) ( not ( = ?auto_122487 ?auto_122489 ) ) ( not ( = ?auto_122488 ?auto_122489 ) ) ( not ( = ?auto_122485 ?auto_122489 ) ) ( not ( = ?auto_122486 ?auto_122489 ) ) ( not ( = ?auto_122484 ?auto_122489 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_122481 ?auto_122489 )
      ( MAKE-3PILE ?auto_122481 ?auto_122482 ?auto_122483 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122490 - BLOCK
      ?auto_122491 - BLOCK
      ?auto_122492 - BLOCK
    )
    :vars
    (
      ?auto_122498 - BLOCK
      ?auto_122494 - BLOCK
      ?auto_122493 - BLOCK
      ?auto_122497 - BLOCK
      ?auto_122495 - BLOCK
      ?auto_122496 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122490 ?auto_122491 ) ) ( not ( = ?auto_122490 ?auto_122492 ) ) ( not ( = ?auto_122491 ?auto_122492 ) ) ( ON ?auto_122492 ?auto_122498 ) ( not ( = ?auto_122490 ?auto_122498 ) ) ( not ( = ?auto_122491 ?auto_122498 ) ) ( not ( = ?auto_122492 ?auto_122498 ) ) ( ON-TABLE ?auto_122494 ) ( ON ?auto_122493 ?auto_122494 ) ( ON ?auto_122497 ?auto_122493 ) ( ON ?auto_122495 ?auto_122497 ) ( ON ?auto_122498 ?auto_122495 ) ( not ( = ?auto_122494 ?auto_122493 ) ) ( not ( = ?auto_122494 ?auto_122497 ) ) ( not ( = ?auto_122494 ?auto_122495 ) ) ( not ( = ?auto_122494 ?auto_122498 ) ) ( not ( = ?auto_122494 ?auto_122492 ) ) ( not ( = ?auto_122494 ?auto_122491 ) ) ( not ( = ?auto_122493 ?auto_122497 ) ) ( not ( = ?auto_122493 ?auto_122495 ) ) ( not ( = ?auto_122493 ?auto_122498 ) ) ( not ( = ?auto_122493 ?auto_122492 ) ) ( not ( = ?auto_122493 ?auto_122491 ) ) ( not ( = ?auto_122497 ?auto_122495 ) ) ( not ( = ?auto_122497 ?auto_122498 ) ) ( not ( = ?auto_122497 ?auto_122492 ) ) ( not ( = ?auto_122497 ?auto_122491 ) ) ( not ( = ?auto_122495 ?auto_122498 ) ) ( not ( = ?auto_122495 ?auto_122492 ) ) ( not ( = ?auto_122495 ?auto_122491 ) ) ( not ( = ?auto_122490 ?auto_122494 ) ) ( not ( = ?auto_122490 ?auto_122493 ) ) ( not ( = ?auto_122490 ?auto_122497 ) ) ( not ( = ?auto_122490 ?auto_122495 ) ) ( ON ?auto_122490 ?auto_122496 ) ( CLEAR ?auto_122490 ) ( not ( = ?auto_122490 ?auto_122496 ) ) ( not ( = ?auto_122491 ?auto_122496 ) ) ( not ( = ?auto_122492 ?auto_122496 ) ) ( not ( = ?auto_122498 ?auto_122496 ) ) ( not ( = ?auto_122494 ?auto_122496 ) ) ( not ( = ?auto_122493 ?auto_122496 ) ) ( not ( = ?auto_122497 ?auto_122496 ) ) ( not ( = ?auto_122495 ?auto_122496 ) ) ( HOLDING ?auto_122491 ) ( CLEAR ?auto_122492 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122494 ?auto_122493 ?auto_122497 ?auto_122495 ?auto_122498 ?auto_122492 ?auto_122491 )
      ( MAKE-3PILE ?auto_122490 ?auto_122491 ?auto_122492 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122499 - BLOCK
      ?auto_122500 - BLOCK
      ?auto_122501 - BLOCK
    )
    :vars
    (
      ?auto_122505 - BLOCK
      ?auto_122504 - BLOCK
      ?auto_122503 - BLOCK
      ?auto_122506 - BLOCK
      ?auto_122502 - BLOCK
      ?auto_122507 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122499 ?auto_122500 ) ) ( not ( = ?auto_122499 ?auto_122501 ) ) ( not ( = ?auto_122500 ?auto_122501 ) ) ( ON ?auto_122501 ?auto_122505 ) ( not ( = ?auto_122499 ?auto_122505 ) ) ( not ( = ?auto_122500 ?auto_122505 ) ) ( not ( = ?auto_122501 ?auto_122505 ) ) ( ON-TABLE ?auto_122504 ) ( ON ?auto_122503 ?auto_122504 ) ( ON ?auto_122506 ?auto_122503 ) ( ON ?auto_122502 ?auto_122506 ) ( ON ?auto_122505 ?auto_122502 ) ( not ( = ?auto_122504 ?auto_122503 ) ) ( not ( = ?auto_122504 ?auto_122506 ) ) ( not ( = ?auto_122504 ?auto_122502 ) ) ( not ( = ?auto_122504 ?auto_122505 ) ) ( not ( = ?auto_122504 ?auto_122501 ) ) ( not ( = ?auto_122504 ?auto_122500 ) ) ( not ( = ?auto_122503 ?auto_122506 ) ) ( not ( = ?auto_122503 ?auto_122502 ) ) ( not ( = ?auto_122503 ?auto_122505 ) ) ( not ( = ?auto_122503 ?auto_122501 ) ) ( not ( = ?auto_122503 ?auto_122500 ) ) ( not ( = ?auto_122506 ?auto_122502 ) ) ( not ( = ?auto_122506 ?auto_122505 ) ) ( not ( = ?auto_122506 ?auto_122501 ) ) ( not ( = ?auto_122506 ?auto_122500 ) ) ( not ( = ?auto_122502 ?auto_122505 ) ) ( not ( = ?auto_122502 ?auto_122501 ) ) ( not ( = ?auto_122502 ?auto_122500 ) ) ( not ( = ?auto_122499 ?auto_122504 ) ) ( not ( = ?auto_122499 ?auto_122503 ) ) ( not ( = ?auto_122499 ?auto_122506 ) ) ( not ( = ?auto_122499 ?auto_122502 ) ) ( ON ?auto_122499 ?auto_122507 ) ( not ( = ?auto_122499 ?auto_122507 ) ) ( not ( = ?auto_122500 ?auto_122507 ) ) ( not ( = ?auto_122501 ?auto_122507 ) ) ( not ( = ?auto_122505 ?auto_122507 ) ) ( not ( = ?auto_122504 ?auto_122507 ) ) ( not ( = ?auto_122503 ?auto_122507 ) ) ( not ( = ?auto_122506 ?auto_122507 ) ) ( not ( = ?auto_122502 ?auto_122507 ) ) ( CLEAR ?auto_122501 ) ( ON ?auto_122500 ?auto_122499 ) ( CLEAR ?auto_122500 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_122507 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122507 ?auto_122499 )
      ( MAKE-3PILE ?auto_122499 ?auto_122500 ?auto_122501 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122508 - BLOCK
      ?auto_122509 - BLOCK
      ?auto_122510 - BLOCK
    )
    :vars
    (
      ?auto_122512 - BLOCK
      ?auto_122513 - BLOCK
      ?auto_122514 - BLOCK
      ?auto_122515 - BLOCK
      ?auto_122516 - BLOCK
      ?auto_122511 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122508 ?auto_122509 ) ) ( not ( = ?auto_122508 ?auto_122510 ) ) ( not ( = ?auto_122509 ?auto_122510 ) ) ( not ( = ?auto_122508 ?auto_122512 ) ) ( not ( = ?auto_122509 ?auto_122512 ) ) ( not ( = ?auto_122510 ?auto_122512 ) ) ( ON-TABLE ?auto_122513 ) ( ON ?auto_122514 ?auto_122513 ) ( ON ?auto_122515 ?auto_122514 ) ( ON ?auto_122516 ?auto_122515 ) ( ON ?auto_122512 ?auto_122516 ) ( not ( = ?auto_122513 ?auto_122514 ) ) ( not ( = ?auto_122513 ?auto_122515 ) ) ( not ( = ?auto_122513 ?auto_122516 ) ) ( not ( = ?auto_122513 ?auto_122512 ) ) ( not ( = ?auto_122513 ?auto_122510 ) ) ( not ( = ?auto_122513 ?auto_122509 ) ) ( not ( = ?auto_122514 ?auto_122515 ) ) ( not ( = ?auto_122514 ?auto_122516 ) ) ( not ( = ?auto_122514 ?auto_122512 ) ) ( not ( = ?auto_122514 ?auto_122510 ) ) ( not ( = ?auto_122514 ?auto_122509 ) ) ( not ( = ?auto_122515 ?auto_122516 ) ) ( not ( = ?auto_122515 ?auto_122512 ) ) ( not ( = ?auto_122515 ?auto_122510 ) ) ( not ( = ?auto_122515 ?auto_122509 ) ) ( not ( = ?auto_122516 ?auto_122512 ) ) ( not ( = ?auto_122516 ?auto_122510 ) ) ( not ( = ?auto_122516 ?auto_122509 ) ) ( not ( = ?auto_122508 ?auto_122513 ) ) ( not ( = ?auto_122508 ?auto_122514 ) ) ( not ( = ?auto_122508 ?auto_122515 ) ) ( not ( = ?auto_122508 ?auto_122516 ) ) ( ON ?auto_122508 ?auto_122511 ) ( not ( = ?auto_122508 ?auto_122511 ) ) ( not ( = ?auto_122509 ?auto_122511 ) ) ( not ( = ?auto_122510 ?auto_122511 ) ) ( not ( = ?auto_122512 ?auto_122511 ) ) ( not ( = ?auto_122513 ?auto_122511 ) ) ( not ( = ?auto_122514 ?auto_122511 ) ) ( not ( = ?auto_122515 ?auto_122511 ) ) ( not ( = ?auto_122516 ?auto_122511 ) ) ( ON ?auto_122509 ?auto_122508 ) ( CLEAR ?auto_122509 ) ( ON-TABLE ?auto_122511 ) ( HOLDING ?auto_122510 ) ( CLEAR ?auto_122512 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122513 ?auto_122514 ?auto_122515 ?auto_122516 ?auto_122512 ?auto_122510 )
      ( MAKE-3PILE ?auto_122508 ?auto_122509 ?auto_122510 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122517 - BLOCK
      ?auto_122518 - BLOCK
      ?auto_122519 - BLOCK
    )
    :vars
    (
      ?auto_122524 - BLOCK
      ?auto_122522 - BLOCK
      ?auto_122525 - BLOCK
      ?auto_122520 - BLOCK
      ?auto_122521 - BLOCK
      ?auto_122523 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122517 ?auto_122518 ) ) ( not ( = ?auto_122517 ?auto_122519 ) ) ( not ( = ?auto_122518 ?auto_122519 ) ) ( not ( = ?auto_122517 ?auto_122524 ) ) ( not ( = ?auto_122518 ?auto_122524 ) ) ( not ( = ?auto_122519 ?auto_122524 ) ) ( ON-TABLE ?auto_122522 ) ( ON ?auto_122525 ?auto_122522 ) ( ON ?auto_122520 ?auto_122525 ) ( ON ?auto_122521 ?auto_122520 ) ( ON ?auto_122524 ?auto_122521 ) ( not ( = ?auto_122522 ?auto_122525 ) ) ( not ( = ?auto_122522 ?auto_122520 ) ) ( not ( = ?auto_122522 ?auto_122521 ) ) ( not ( = ?auto_122522 ?auto_122524 ) ) ( not ( = ?auto_122522 ?auto_122519 ) ) ( not ( = ?auto_122522 ?auto_122518 ) ) ( not ( = ?auto_122525 ?auto_122520 ) ) ( not ( = ?auto_122525 ?auto_122521 ) ) ( not ( = ?auto_122525 ?auto_122524 ) ) ( not ( = ?auto_122525 ?auto_122519 ) ) ( not ( = ?auto_122525 ?auto_122518 ) ) ( not ( = ?auto_122520 ?auto_122521 ) ) ( not ( = ?auto_122520 ?auto_122524 ) ) ( not ( = ?auto_122520 ?auto_122519 ) ) ( not ( = ?auto_122520 ?auto_122518 ) ) ( not ( = ?auto_122521 ?auto_122524 ) ) ( not ( = ?auto_122521 ?auto_122519 ) ) ( not ( = ?auto_122521 ?auto_122518 ) ) ( not ( = ?auto_122517 ?auto_122522 ) ) ( not ( = ?auto_122517 ?auto_122525 ) ) ( not ( = ?auto_122517 ?auto_122520 ) ) ( not ( = ?auto_122517 ?auto_122521 ) ) ( ON ?auto_122517 ?auto_122523 ) ( not ( = ?auto_122517 ?auto_122523 ) ) ( not ( = ?auto_122518 ?auto_122523 ) ) ( not ( = ?auto_122519 ?auto_122523 ) ) ( not ( = ?auto_122524 ?auto_122523 ) ) ( not ( = ?auto_122522 ?auto_122523 ) ) ( not ( = ?auto_122525 ?auto_122523 ) ) ( not ( = ?auto_122520 ?auto_122523 ) ) ( not ( = ?auto_122521 ?auto_122523 ) ) ( ON ?auto_122518 ?auto_122517 ) ( ON-TABLE ?auto_122523 ) ( CLEAR ?auto_122524 ) ( ON ?auto_122519 ?auto_122518 ) ( CLEAR ?auto_122519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122523 ?auto_122517 ?auto_122518 )
      ( MAKE-3PILE ?auto_122517 ?auto_122518 ?auto_122519 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122526 - BLOCK
      ?auto_122527 - BLOCK
      ?auto_122528 - BLOCK
    )
    :vars
    (
      ?auto_122533 - BLOCK
      ?auto_122529 - BLOCK
      ?auto_122534 - BLOCK
      ?auto_122530 - BLOCK
      ?auto_122531 - BLOCK
      ?auto_122532 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122526 ?auto_122527 ) ) ( not ( = ?auto_122526 ?auto_122528 ) ) ( not ( = ?auto_122527 ?auto_122528 ) ) ( not ( = ?auto_122526 ?auto_122533 ) ) ( not ( = ?auto_122527 ?auto_122533 ) ) ( not ( = ?auto_122528 ?auto_122533 ) ) ( ON-TABLE ?auto_122529 ) ( ON ?auto_122534 ?auto_122529 ) ( ON ?auto_122530 ?auto_122534 ) ( ON ?auto_122531 ?auto_122530 ) ( not ( = ?auto_122529 ?auto_122534 ) ) ( not ( = ?auto_122529 ?auto_122530 ) ) ( not ( = ?auto_122529 ?auto_122531 ) ) ( not ( = ?auto_122529 ?auto_122533 ) ) ( not ( = ?auto_122529 ?auto_122528 ) ) ( not ( = ?auto_122529 ?auto_122527 ) ) ( not ( = ?auto_122534 ?auto_122530 ) ) ( not ( = ?auto_122534 ?auto_122531 ) ) ( not ( = ?auto_122534 ?auto_122533 ) ) ( not ( = ?auto_122534 ?auto_122528 ) ) ( not ( = ?auto_122534 ?auto_122527 ) ) ( not ( = ?auto_122530 ?auto_122531 ) ) ( not ( = ?auto_122530 ?auto_122533 ) ) ( not ( = ?auto_122530 ?auto_122528 ) ) ( not ( = ?auto_122530 ?auto_122527 ) ) ( not ( = ?auto_122531 ?auto_122533 ) ) ( not ( = ?auto_122531 ?auto_122528 ) ) ( not ( = ?auto_122531 ?auto_122527 ) ) ( not ( = ?auto_122526 ?auto_122529 ) ) ( not ( = ?auto_122526 ?auto_122534 ) ) ( not ( = ?auto_122526 ?auto_122530 ) ) ( not ( = ?auto_122526 ?auto_122531 ) ) ( ON ?auto_122526 ?auto_122532 ) ( not ( = ?auto_122526 ?auto_122532 ) ) ( not ( = ?auto_122527 ?auto_122532 ) ) ( not ( = ?auto_122528 ?auto_122532 ) ) ( not ( = ?auto_122533 ?auto_122532 ) ) ( not ( = ?auto_122529 ?auto_122532 ) ) ( not ( = ?auto_122534 ?auto_122532 ) ) ( not ( = ?auto_122530 ?auto_122532 ) ) ( not ( = ?auto_122531 ?auto_122532 ) ) ( ON ?auto_122527 ?auto_122526 ) ( ON-TABLE ?auto_122532 ) ( ON ?auto_122528 ?auto_122527 ) ( CLEAR ?auto_122528 ) ( HOLDING ?auto_122533 ) ( CLEAR ?auto_122531 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122529 ?auto_122534 ?auto_122530 ?auto_122531 ?auto_122533 )
      ( MAKE-3PILE ?auto_122526 ?auto_122527 ?auto_122528 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122535 - BLOCK
      ?auto_122536 - BLOCK
      ?auto_122537 - BLOCK
    )
    :vars
    (
      ?auto_122538 - BLOCK
      ?auto_122542 - BLOCK
      ?auto_122539 - BLOCK
      ?auto_122543 - BLOCK
      ?auto_122540 - BLOCK
      ?auto_122541 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122535 ?auto_122536 ) ) ( not ( = ?auto_122535 ?auto_122537 ) ) ( not ( = ?auto_122536 ?auto_122537 ) ) ( not ( = ?auto_122535 ?auto_122538 ) ) ( not ( = ?auto_122536 ?auto_122538 ) ) ( not ( = ?auto_122537 ?auto_122538 ) ) ( ON-TABLE ?auto_122542 ) ( ON ?auto_122539 ?auto_122542 ) ( ON ?auto_122543 ?auto_122539 ) ( ON ?auto_122540 ?auto_122543 ) ( not ( = ?auto_122542 ?auto_122539 ) ) ( not ( = ?auto_122542 ?auto_122543 ) ) ( not ( = ?auto_122542 ?auto_122540 ) ) ( not ( = ?auto_122542 ?auto_122538 ) ) ( not ( = ?auto_122542 ?auto_122537 ) ) ( not ( = ?auto_122542 ?auto_122536 ) ) ( not ( = ?auto_122539 ?auto_122543 ) ) ( not ( = ?auto_122539 ?auto_122540 ) ) ( not ( = ?auto_122539 ?auto_122538 ) ) ( not ( = ?auto_122539 ?auto_122537 ) ) ( not ( = ?auto_122539 ?auto_122536 ) ) ( not ( = ?auto_122543 ?auto_122540 ) ) ( not ( = ?auto_122543 ?auto_122538 ) ) ( not ( = ?auto_122543 ?auto_122537 ) ) ( not ( = ?auto_122543 ?auto_122536 ) ) ( not ( = ?auto_122540 ?auto_122538 ) ) ( not ( = ?auto_122540 ?auto_122537 ) ) ( not ( = ?auto_122540 ?auto_122536 ) ) ( not ( = ?auto_122535 ?auto_122542 ) ) ( not ( = ?auto_122535 ?auto_122539 ) ) ( not ( = ?auto_122535 ?auto_122543 ) ) ( not ( = ?auto_122535 ?auto_122540 ) ) ( ON ?auto_122535 ?auto_122541 ) ( not ( = ?auto_122535 ?auto_122541 ) ) ( not ( = ?auto_122536 ?auto_122541 ) ) ( not ( = ?auto_122537 ?auto_122541 ) ) ( not ( = ?auto_122538 ?auto_122541 ) ) ( not ( = ?auto_122542 ?auto_122541 ) ) ( not ( = ?auto_122539 ?auto_122541 ) ) ( not ( = ?auto_122543 ?auto_122541 ) ) ( not ( = ?auto_122540 ?auto_122541 ) ) ( ON ?auto_122536 ?auto_122535 ) ( ON-TABLE ?auto_122541 ) ( ON ?auto_122537 ?auto_122536 ) ( CLEAR ?auto_122540 ) ( ON ?auto_122538 ?auto_122537 ) ( CLEAR ?auto_122538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_122541 ?auto_122535 ?auto_122536 ?auto_122537 )
      ( MAKE-3PILE ?auto_122535 ?auto_122536 ?auto_122537 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122544 - BLOCK
      ?auto_122545 - BLOCK
      ?auto_122546 - BLOCK
    )
    :vars
    (
      ?auto_122551 - BLOCK
      ?auto_122549 - BLOCK
      ?auto_122552 - BLOCK
      ?auto_122550 - BLOCK
      ?auto_122548 - BLOCK
      ?auto_122547 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122544 ?auto_122545 ) ) ( not ( = ?auto_122544 ?auto_122546 ) ) ( not ( = ?auto_122545 ?auto_122546 ) ) ( not ( = ?auto_122544 ?auto_122551 ) ) ( not ( = ?auto_122545 ?auto_122551 ) ) ( not ( = ?auto_122546 ?auto_122551 ) ) ( ON-TABLE ?auto_122549 ) ( ON ?auto_122552 ?auto_122549 ) ( ON ?auto_122550 ?auto_122552 ) ( not ( = ?auto_122549 ?auto_122552 ) ) ( not ( = ?auto_122549 ?auto_122550 ) ) ( not ( = ?auto_122549 ?auto_122548 ) ) ( not ( = ?auto_122549 ?auto_122551 ) ) ( not ( = ?auto_122549 ?auto_122546 ) ) ( not ( = ?auto_122549 ?auto_122545 ) ) ( not ( = ?auto_122552 ?auto_122550 ) ) ( not ( = ?auto_122552 ?auto_122548 ) ) ( not ( = ?auto_122552 ?auto_122551 ) ) ( not ( = ?auto_122552 ?auto_122546 ) ) ( not ( = ?auto_122552 ?auto_122545 ) ) ( not ( = ?auto_122550 ?auto_122548 ) ) ( not ( = ?auto_122550 ?auto_122551 ) ) ( not ( = ?auto_122550 ?auto_122546 ) ) ( not ( = ?auto_122550 ?auto_122545 ) ) ( not ( = ?auto_122548 ?auto_122551 ) ) ( not ( = ?auto_122548 ?auto_122546 ) ) ( not ( = ?auto_122548 ?auto_122545 ) ) ( not ( = ?auto_122544 ?auto_122549 ) ) ( not ( = ?auto_122544 ?auto_122552 ) ) ( not ( = ?auto_122544 ?auto_122550 ) ) ( not ( = ?auto_122544 ?auto_122548 ) ) ( ON ?auto_122544 ?auto_122547 ) ( not ( = ?auto_122544 ?auto_122547 ) ) ( not ( = ?auto_122545 ?auto_122547 ) ) ( not ( = ?auto_122546 ?auto_122547 ) ) ( not ( = ?auto_122551 ?auto_122547 ) ) ( not ( = ?auto_122549 ?auto_122547 ) ) ( not ( = ?auto_122552 ?auto_122547 ) ) ( not ( = ?auto_122550 ?auto_122547 ) ) ( not ( = ?auto_122548 ?auto_122547 ) ) ( ON ?auto_122545 ?auto_122544 ) ( ON-TABLE ?auto_122547 ) ( ON ?auto_122546 ?auto_122545 ) ( ON ?auto_122551 ?auto_122546 ) ( CLEAR ?auto_122551 ) ( HOLDING ?auto_122548 ) ( CLEAR ?auto_122550 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_122549 ?auto_122552 ?auto_122550 ?auto_122548 )
      ( MAKE-3PILE ?auto_122544 ?auto_122545 ?auto_122546 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122553 - BLOCK
      ?auto_122554 - BLOCK
      ?auto_122555 - BLOCK
    )
    :vars
    (
      ?auto_122558 - BLOCK
      ?auto_122557 - BLOCK
      ?auto_122556 - BLOCK
      ?auto_122560 - BLOCK
      ?auto_122559 - BLOCK
      ?auto_122561 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122553 ?auto_122554 ) ) ( not ( = ?auto_122553 ?auto_122555 ) ) ( not ( = ?auto_122554 ?auto_122555 ) ) ( not ( = ?auto_122553 ?auto_122558 ) ) ( not ( = ?auto_122554 ?auto_122558 ) ) ( not ( = ?auto_122555 ?auto_122558 ) ) ( ON-TABLE ?auto_122557 ) ( ON ?auto_122556 ?auto_122557 ) ( ON ?auto_122560 ?auto_122556 ) ( not ( = ?auto_122557 ?auto_122556 ) ) ( not ( = ?auto_122557 ?auto_122560 ) ) ( not ( = ?auto_122557 ?auto_122559 ) ) ( not ( = ?auto_122557 ?auto_122558 ) ) ( not ( = ?auto_122557 ?auto_122555 ) ) ( not ( = ?auto_122557 ?auto_122554 ) ) ( not ( = ?auto_122556 ?auto_122560 ) ) ( not ( = ?auto_122556 ?auto_122559 ) ) ( not ( = ?auto_122556 ?auto_122558 ) ) ( not ( = ?auto_122556 ?auto_122555 ) ) ( not ( = ?auto_122556 ?auto_122554 ) ) ( not ( = ?auto_122560 ?auto_122559 ) ) ( not ( = ?auto_122560 ?auto_122558 ) ) ( not ( = ?auto_122560 ?auto_122555 ) ) ( not ( = ?auto_122560 ?auto_122554 ) ) ( not ( = ?auto_122559 ?auto_122558 ) ) ( not ( = ?auto_122559 ?auto_122555 ) ) ( not ( = ?auto_122559 ?auto_122554 ) ) ( not ( = ?auto_122553 ?auto_122557 ) ) ( not ( = ?auto_122553 ?auto_122556 ) ) ( not ( = ?auto_122553 ?auto_122560 ) ) ( not ( = ?auto_122553 ?auto_122559 ) ) ( ON ?auto_122553 ?auto_122561 ) ( not ( = ?auto_122553 ?auto_122561 ) ) ( not ( = ?auto_122554 ?auto_122561 ) ) ( not ( = ?auto_122555 ?auto_122561 ) ) ( not ( = ?auto_122558 ?auto_122561 ) ) ( not ( = ?auto_122557 ?auto_122561 ) ) ( not ( = ?auto_122556 ?auto_122561 ) ) ( not ( = ?auto_122560 ?auto_122561 ) ) ( not ( = ?auto_122559 ?auto_122561 ) ) ( ON ?auto_122554 ?auto_122553 ) ( ON-TABLE ?auto_122561 ) ( ON ?auto_122555 ?auto_122554 ) ( ON ?auto_122558 ?auto_122555 ) ( CLEAR ?auto_122560 ) ( ON ?auto_122559 ?auto_122558 ) ( CLEAR ?auto_122559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122561 ?auto_122553 ?auto_122554 ?auto_122555 ?auto_122558 )
      ( MAKE-3PILE ?auto_122553 ?auto_122554 ?auto_122555 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122562 - BLOCK
      ?auto_122563 - BLOCK
      ?auto_122564 - BLOCK
    )
    :vars
    (
      ?auto_122567 - BLOCK
      ?auto_122568 - BLOCK
      ?auto_122569 - BLOCK
      ?auto_122570 - BLOCK
      ?auto_122565 - BLOCK
      ?auto_122566 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122562 ?auto_122563 ) ) ( not ( = ?auto_122562 ?auto_122564 ) ) ( not ( = ?auto_122563 ?auto_122564 ) ) ( not ( = ?auto_122562 ?auto_122567 ) ) ( not ( = ?auto_122563 ?auto_122567 ) ) ( not ( = ?auto_122564 ?auto_122567 ) ) ( ON-TABLE ?auto_122568 ) ( ON ?auto_122569 ?auto_122568 ) ( not ( = ?auto_122568 ?auto_122569 ) ) ( not ( = ?auto_122568 ?auto_122570 ) ) ( not ( = ?auto_122568 ?auto_122565 ) ) ( not ( = ?auto_122568 ?auto_122567 ) ) ( not ( = ?auto_122568 ?auto_122564 ) ) ( not ( = ?auto_122568 ?auto_122563 ) ) ( not ( = ?auto_122569 ?auto_122570 ) ) ( not ( = ?auto_122569 ?auto_122565 ) ) ( not ( = ?auto_122569 ?auto_122567 ) ) ( not ( = ?auto_122569 ?auto_122564 ) ) ( not ( = ?auto_122569 ?auto_122563 ) ) ( not ( = ?auto_122570 ?auto_122565 ) ) ( not ( = ?auto_122570 ?auto_122567 ) ) ( not ( = ?auto_122570 ?auto_122564 ) ) ( not ( = ?auto_122570 ?auto_122563 ) ) ( not ( = ?auto_122565 ?auto_122567 ) ) ( not ( = ?auto_122565 ?auto_122564 ) ) ( not ( = ?auto_122565 ?auto_122563 ) ) ( not ( = ?auto_122562 ?auto_122568 ) ) ( not ( = ?auto_122562 ?auto_122569 ) ) ( not ( = ?auto_122562 ?auto_122570 ) ) ( not ( = ?auto_122562 ?auto_122565 ) ) ( ON ?auto_122562 ?auto_122566 ) ( not ( = ?auto_122562 ?auto_122566 ) ) ( not ( = ?auto_122563 ?auto_122566 ) ) ( not ( = ?auto_122564 ?auto_122566 ) ) ( not ( = ?auto_122567 ?auto_122566 ) ) ( not ( = ?auto_122568 ?auto_122566 ) ) ( not ( = ?auto_122569 ?auto_122566 ) ) ( not ( = ?auto_122570 ?auto_122566 ) ) ( not ( = ?auto_122565 ?auto_122566 ) ) ( ON ?auto_122563 ?auto_122562 ) ( ON-TABLE ?auto_122566 ) ( ON ?auto_122564 ?auto_122563 ) ( ON ?auto_122567 ?auto_122564 ) ( ON ?auto_122565 ?auto_122567 ) ( CLEAR ?auto_122565 ) ( HOLDING ?auto_122570 ) ( CLEAR ?auto_122569 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122568 ?auto_122569 ?auto_122570 )
      ( MAKE-3PILE ?auto_122562 ?auto_122563 ?auto_122564 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122571 - BLOCK
      ?auto_122572 - BLOCK
      ?auto_122573 - BLOCK
    )
    :vars
    (
      ?auto_122579 - BLOCK
      ?auto_122575 - BLOCK
      ?auto_122576 - BLOCK
      ?auto_122578 - BLOCK
      ?auto_122577 - BLOCK
      ?auto_122574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122571 ?auto_122572 ) ) ( not ( = ?auto_122571 ?auto_122573 ) ) ( not ( = ?auto_122572 ?auto_122573 ) ) ( not ( = ?auto_122571 ?auto_122579 ) ) ( not ( = ?auto_122572 ?auto_122579 ) ) ( not ( = ?auto_122573 ?auto_122579 ) ) ( ON-TABLE ?auto_122575 ) ( ON ?auto_122576 ?auto_122575 ) ( not ( = ?auto_122575 ?auto_122576 ) ) ( not ( = ?auto_122575 ?auto_122578 ) ) ( not ( = ?auto_122575 ?auto_122577 ) ) ( not ( = ?auto_122575 ?auto_122579 ) ) ( not ( = ?auto_122575 ?auto_122573 ) ) ( not ( = ?auto_122575 ?auto_122572 ) ) ( not ( = ?auto_122576 ?auto_122578 ) ) ( not ( = ?auto_122576 ?auto_122577 ) ) ( not ( = ?auto_122576 ?auto_122579 ) ) ( not ( = ?auto_122576 ?auto_122573 ) ) ( not ( = ?auto_122576 ?auto_122572 ) ) ( not ( = ?auto_122578 ?auto_122577 ) ) ( not ( = ?auto_122578 ?auto_122579 ) ) ( not ( = ?auto_122578 ?auto_122573 ) ) ( not ( = ?auto_122578 ?auto_122572 ) ) ( not ( = ?auto_122577 ?auto_122579 ) ) ( not ( = ?auto_122577 ?auto_122573 ) ) ( not ( = ?auto_122577 ?auto_122572 ) ) ( not ( = ?auto_122571 ?auto_122575 ) ) ( not ( = ?auto_122571 ?auto_122576 ) ) ( not ( = ?auto_122571 ?auto_122578 ) ) ( not ( = ?auto_122571 ?auto_122577 ) ) ( ON ?auto_122571 ?auto_122574 ) ( not ( = ?auto_122571 ?auto_122574 ) ) ( not ( = ?auto_122572 ?auto_122574 ) ) ( not ( = ?auto_122573 ?auto_122574 ) ) ( not ( = ?auto_122579 ?auto_122574 ) ) ( not ( = ?auto_122575 ?auto_122574 ) ) ( not ( = ?auto_122576 ?auto_122574 ) ) ( not ( = ?auto_122578 ?auto_122574 ) ) ( not ( = ?auto_122577 ?auto_122574 ) ) ( ON ?auto_122572 ?auto_122571 ) ( ON-TABLE ?auto_122574 ) ( ON ?auto_122573 ?auto_122572 ) ( ON ?auto_122579 ?auto_122573 ) ( ON ?auto_122577 ?auto_122579 ) ( CLEAR ?auto_122576 ) ( ON ?auto_122578 ?auto_122577 ) ( CLEAR ?auto_122578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122574 ?auto_122571 ?auto_122572 ?auto_122573 ?auto_122579 ?auto_122577 )
      ( MAKE-3PILE ?auto_122571 ?auto_122572 ?auto_122573 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122580 - BLOCK
      ?auto_122581 - BLOCK
      ?auto_122582 - BLOCK
    )
    :vars
    (
      ?auto_122584 - BLOCK
      ?auto_122588 - BLOCK
      ?auto_122585 - BLOCK
      ?auto_122586 - BLOCK
      ?auto_122583 - BLOCK
      ?auto_122587 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122580 ?auto_122581 ) ) ( not ( = ?auto_122580 ?auto_122582 ) ) ( not ( = ?auto_122581 ?auto_122582 ) ) ( not ( = ?auto_122580 ?auto_122584 ) ) ( not ( = ?auto_122581 ?auto_122584 ) ) ( not ( = ?auto_122582 ?auto_122584 ) ) ( ON-TABLE ?auto_122588 ) ( not ( = ?auto_122588 ?auto_122585 ) ) ( not ( = ?auto_122588 ?auto_122586 ) ) ( not ( = ?auto_122588 ?auto_122583 ) ) ( not ( = ?auto_122588 ?auto_122584 ) ) ( not ( = ?auto_122588 ?auto_122582 ) ) ( not ( = ?auto_122588 ?auto_122581 ) ) ( not ( = ?auto_122585 ?auto_122586 ) ) ( not ( = ?auto_122585 ?auto_122583 ) ) ( not ( = ?auto_122585 ?auto_122584 ) ) ( not ( = ?auto_122585 ?auto_122582 ) ) ( not ( = ?auto_122585 ?auto_122581 ) ) ( not ( = ?auto_122586 ?auto_122583 ) ) ( not ( = ?auto_122586 ?auto_122584 ) ) ( not ( = ?auto_122586 ?auto_122582 ) ) ( not ( = ?auto_122586 ?auto_122581 ) ) ( not ( = ?auto_122583 ?auto_122584 ) ) ( not ( = ?auto_122583 ?auto_122582 ) ) ( not ( = ?auto_122583 ?auto_122581 ) ) ( not ( = ?auto_122580 ?auto_122588 ) ) ( not ( = ?auto_122580 ?auto_122585 ) ) ( not ( = ?auto_122580 ?auto_122586 ) ) ( not ( = ?auto_122580 ?auto_122583 ) ) ( ON ?auto_122580 ?auto_122587 ) ( not ( = ?auto_122580 ?auto_122587 ) ) ( not ( = ?auto_122581 ?auto_122587 ) ) ( not ( = ?auto_122582 ?auto_122587 ) ) ( not ( = ?auto_122584 ?auto_122587 ) ) ( not ( = ?auto_122588 ?auto_122587 ) ) ( not ( = ?auto_122585 ?auto_122587 ) ) ( not ( = ?auto_122586 ?auto_122587 ) ) ( not ( = ?auto_122583 ?auto_122587 ) ) ( ON ?auto_122581 ?auto_122580 ) ( ON-TABLE ?auto_122587 ) ( ON ?auto_122582 ?auto_122581 ) ( ON ?auto_122584 ?auto_122582 ) ( ON ?auto_122583 ?auto_122584 ) ( ON ?auto_122586 ?auto_122583 ) ( CLEAR ?auto_122586 ) ( HOLDING ?auto_122585 ) ( CLEAR ?auto_122588 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122588 ?auto_122585 )
      ( MAKE-3PILE ?auto_122580 ?auto_122581 ?auto_122582 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122589 - BLOCK
      ?auto_122590 - BLOCK
      ?auto_122591 - BLOCK
    )
    :vars
    (
      ?auto_122595 - BLOCK
      ?auto_122593 - BLOCK
      ?auto_122594 - BLOCK
      ?auto_122597 - BLOCK
      ?auto_122596 - BLOCK
      ?auto_122592 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122589 ?auto_122590 ) ) ( not ( = ?auto_122589 ?auto_122591 ) ) ( not ( = ?auto_122590 ?auto_122591 ) ) ( not ( = ?auto_122589 ?auto_122595 ) ) ( not ( = ?auto_122590 ?auto_122595 ) ) ( not ( = ?auto_122591 ?auto_122595 ) ) ( ON-TABLE ?auto_122593 ) ( not ( = ?auto_122593 ?auto_122594 ) ) ( not ( = ?auto_122593 ?auto_122597 ) ) ( not ( = ?auto_122593 ?auto_122596 ) ) ( not ( = ?auto_122593 ?auto_122595 ) ) ( not ( = ?auto_122593 ?auto_122591 ) ) ( not ( = ?auto_122593 ?auto_122590 ) ) ( not ( = ?auto_122594 ?auto_122597 ) ) ( not ( = ?auto_122594 ?auto_122596 ) ) ( not ( = ?auto_122594 ?auto_122595 ) ) ( not ( = ?auto_122594 ?auto_122591 ) ) ( not ( = ?auto_122594 ?auto_122590 ) ) ( not ( = ?auto_122597 ?auto_122596 ) ) ( not ( = ?auto_122597 ?auto_122595 ) ) ( not ( = ?auto_122597 ?auto_122591 ) ) ( not ( = ?auto_122597 ?auto_122590 ) ) ( not ( = ?auto_122596 ?auto_122595 ) ) ( not ( = ?auto_122596 ?auto_122591 ) ) ( not ( = ?auto_122596 ?auto_122590 ) ) ( not ( = ?auto_122589 ?auto_122593 ) ) ( not ( = ?auto_122589 ?auto_122594 ) ) ( not ( = ?auto_122589 ?auto_122597 ) ) ( not ( = ?auto_122589 ?auto_122596 ) ) ( ON ?auto_122589 ?auto_122592 ) ( not ( = ?auto_122589 ?auto_122592 ) ) ( not ( = ?auto_122590 ?auto_122592 ) ) ( not ( = ?auto_122591 ?auto_122592 ) ) ( not ( = ?auto_122595 ?auto_122592 ) ) ( not ( = ?auto_122593 ?auto_122592 ) ) ( not ( = ?auto_122594 ?auto_122592 ) ) ( not ( = ?auto_122597 ?auto_122592 ) ) ( not ( = ?auto_122596 ?auto_122592 ) ) ( ON ?auto_122590 ?auto_122589 ) ( ON-TABLE ?auto_122592 ) ( ON ?auto_122591 ?auto_122590 ) ( ON ?auto_122595 ?auto_122591 ) ( ON ?auto_122596 ?auto_122595 ) ( ON ?auto_122597 ?auto_122596 ) ( CLEAR ?auto_122593 ) ( ON ?auto_122594 ?auto_122597 ) ( CLEAR ?auto_122594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122592 ?auto_122589 ?auto_122590 ?auto_122591 ?auto_122595 ?auto_122596 ?auto_122597 )
      ( MAKE-3PILE ?auto_122589 ?auto_122590 ?auto_122591 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122598 - BLOCK
      ?auto_122599 - BLOCK
      ?auto_122600 - BLOCK
    )
    :vars
    (
      ?auto_122603 - BLOCK
      ?auto_122605 - BLOCK
      ?auto_122606 - BLOCK
      ?auto_122601 - BLOCK
      ?auto_122602 - BLOCK
      ?auto_122604 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122598 ?auto_122599 ) ) ( not ( = ?auto_122598 ?auto_122600 ) ) ( not ( = ?auto_122599 ?auto_122600 ) ) ( not ( = ?auto_122598 ?auto_122603 ) ) ( not ( = ?auto_122599 ?auto_122603 ) ) ( not ( = ?auto_122600 ?auto_122603 ) ) ( not ( = ?auto_122605 ?auto_122606 ) ) ( not ( = ?auto_122605 ?auto_122601 ) ) ( not ( = ?auto_122605 ?auto_122602 ) ) ( not ( = ?auto_122605 ?auto_122603 ) ) ( not ( = ?auto_122605 ?auto_122600 ) ) ( not ( = ?auto_122605 ?auto_122599 ) ) ( not ( = ?auto_122606 ?auto_122601 ) ) ( not ( = ?auto_122606 ?auto_122602 ) ) ( not ( = ?auto_122606 ?auto_122603 ) ) ( not ( = ?auto_122606 ?auto_122600 ) ) ( not ( = ?auto_122606 ?auto_122599 ) ) ( not ( = ?auto_122601 ?auto_122602 ) ) ( not ( = ?auto_122601 ?auto_122603 ) ) ( not ( = ?auto_122601 ?auto_122600 ) ) ( not ( = ?auto_122601 ?auto_122599 ) ) ( not ( = ?auto_122602 ?auto_122603 ) ) ( not ( = ?auto_122602 ?auto_122600 ) ) ( not ( = ?auto_122602 ?auto_122599 ) ) ( not ( = ?auto_122598 ?auto_122605 ) ) ( not ( = ?auto_122598 ?auto_122606 ) ) ( not ( = ?auto_122598 ?auto_122601 ) ) ( not ( = ?auto_122598 ?auto_122602 ) ) ( ON ?auto_122598 ?auto_122604 ) ( not ( = ?auto_122598 ?auto_122604 ) ) ( not ( = ?auto_122599 ?auto_122604 ) ) ( not ( = ?auto_122600 ?auto_122604 ) ) ( not ( = ?auto_122603 ?auto_122604 ) ) ( not ( = ?auto_122605 ?auto_122604 ) ) ( not ( = ?auto_122606 ?auto_122604 ) ) ( not ( = ?auto_122601 ?auto_122604 ) ) ( not ( = ?auto_122602 ?auto_122604 ) ) ( ON ?auto_122599 ?auto_122598 ) ( ON-TABLE ?auto_122604 ) ( ON ?auto_122600 ?auto_122599 ) ( ON ?auto_122603 ?auto_122600 ) ( ON ?auto_122602 ?auto_122603 ) ( ON ?auto_122601 ?auto_122602 ) ( ON ?auto_122606 ?auto_122601 ) ( CLEAR ?auto_122606 ) ( HOLDING ?auto_122605 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_122605 )
      ( MAKE-3PILE ?auto_122598 ?auto_122599 ?auto_122600 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122607 - BLOCK
      ?auto_122608 - BLOCK
      ?auto_122609 - BLOCK
    )
    :vars
    (
      ?auto_122615 - BLOCK
      ?auto_122611 - BLOCK
      ?auto_122612 - BLOCK
      ?auto_122613 - BLOCK
      ?auto_122614 - BLOCK
      ?auto_122610 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122607 ?auto_122608 ) ) ( not ( = ?auto_122607 ?auto_122609 ) ) ( not ( = ?auto_122608 ?auto_122609 ) ) ( not ( = ?auto_122607 ?auto_122615 ) ) ( not ( = ?auto_122608 ?auto_122615 ) ) ( not ( = ?auto_122609 ?auto_122615 ) ) ( not ( = ?auto_122611 ?auto_122612 ) ) ( not ( = ?auto_122611 ?auto_122613 ) ) ( not ( = ?auto_122611 ?auto_122614 ) ) ( not ( = ?auto_122611 ?auto_122615 ) ) ( not ( = ?auto_122611 ?auto_122609 ) ) ( not ( = ?auto_122611 ?auto_122608 ) ) ( not ( = ?auto_122612 ?auto_122613 ) ) ( not ( = ?auto_122612 ?auto_122614 ) ) ( not ( = ?auto_122612 ?auto_122615 ) ) ( not ( = ?auto_122612 ?auto_122609 ) ) ( not ( = ?auto_122612 ?auto_122608 ) ) ( not ( = ?auto_122613 ?auto_122614 ) ) ( not ( = ?auto_122613 ?auto_122615 ) ) ( not ( = ?auto_122613 ?auto_122609 ) ) ( not ( = ?auto_122613 ?auto_122608 ) ) ( not ( = ?auto_122614 ?auto_122615 ) ) ( not ( = ?auto_122614 ?auto_122609 ) ) ( not ( = ?auto_122614 ?auto_122608 ) ) ( not ( = ?auto_122607 ?auto_122611 ) ) ( not ( = ?auto_122607 ?auto_122612 ) ) ( not ( = ?auto_122607 ?auto_122613 ) ) ( not ( = ?auto_122607 ?auto_122614 ) ) ( ON ?auto_122607 ?auto_122610 ) ( not ( = ?auto_122607 ?auto_122610 ) ) ( not ( = ?auto_122608 ?auto_122610 ) ) ( not ( = ?auto_122609 ?auto_122610 ) ) ( not ( = ?auto_122615 ?auto_122610 ) ) ( not ( = ?auto_122611 ?auto_122610 ) ) ( not ( = ?auto_122612 ?auto_122610 ) ) ( not ( = ?auto_122613 ?auto_122610 ) ) ( not ( = ?auto_122614 ?auto_122610 ) ) ( ON ?auto_122608 ?auto_122607 ) ( ON-TABLE ?auto_122610 ) ( ON ?auto_122609 ?auto_122608 ) ( ON ?auto_122615 ?auto_122609 ) ( ON ?auto_122614 ?auto_122615 ) ( ON ?auto_122613 ?auto_122614 ) ( ON ?auto_122612 ?auto_122613 ) ( ON ?auto_122611 ?auto_122612 ) ( CLEAR ?auto_122611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_122610 ?auto_122607 ?auto_122608 ?auto_122609 ?auto_122615 ?auto_122614 ?auto_122613 ?auto_122612 )
      ( MAKE-3PILE ?auto_122607 ?auto_122608 ?auto_122609 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122639 - BLOCK
      ?auto_122640 - BLOCK
      ?auto_122641 - BLOCK
      ?auto_122642 - BLOCK
    )
    :vars
    (
      ?auto_122644 - BLOCK
      ?auto_122645 - BLOCK
      ?auto_122643 - BLOCK
      ?auto_122646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122644 ?auto_122642 ) ( ON-TABLE ?auto_122639 ) ( ON ?auto_122640 ?auto_122639 ) ( ON ?auto_122641 ?auto_122640 ) ( ON ?auto_122642 ?auto_122641 ) ( not ( = ?auto_122639 ?auto_122640 ) ) ( not ( = ?auto_122639 ?auto_122641 ) ) ( not ( = ?auto_122639 ?auto_122642 ) ) ( not ( = ?auto_122639 ?auto_122644 ) ) ( not ( = ?auto_122640 ?auto_122641 ) ) ( not ( = ?auto_122640 ?auto_122642 ) ) ( not ( = ?auto_122640 ?auto_122644 ) ) ( not ( = ?auto_122641 ?auto_122642 ) ) ( not ( = ?auto_122641 ?auto_122644 ) ) ( not ( = ?auto_122642 ?auto_122644 ) ) ( not ( = ?auto_122639 ?auto_122645 ) ) ( not ( = ?auto_122639 ?auto_122643 ) ) ( not ( = ?auto_122640 ?auto_122645 ) ) ( not ( = ?auto_122640 ?auto_122643 ) ) ( not ( = ?auto_122641 ?auto_122645 ) ) ( not ( = ?auto_122641 ?auto_122643 ) ) ( not ( = ?auto_122642 ?auto_122645 ) ) ( not ( = ?auto_122642 ?auto_122643 ) ) ( not ( = ?auto_122644 ?auto_122645 ) ) ( not ( = ?auto_122644 ?auto_122643 ) ) ( not ( = ?auto_122645 ?auto_122643 ) ) ( ON ?auto_122645 ?auto_122644 ) ( CLEAR ?auto_122645 ) ( HOLDING ?auto_122643 ) ( CLEAR ?auto_122646 ) ( ON-TABLE ?auto_122646 ) ( not ( = ?auto_122646 ?auto_122643 ) ) ( not ( = ?auto_122639 ?auto_122646 ) ) ( not ( = ?auto_122640 ?auto_122646 ) ) ( not ( = ?auto_122641 ?auto_122646 ) ) ( not ( = ?auto_122642 ?auto_122646 ) ) ( not ( = ?auto_122644 ?auto_122646 ) ) ( not ( = ?auto_122645 ?auto_122646 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122646 ?auto_122643 )
      ( MAKE-4PILE ?auto_122639 ?auto_122640 ?auto_122641 ?auto_122642 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122647 - BLOCK
      ?auto_122648 - BLOCK
      ?auto_122649 - BLOCK
      ?auto_122650 - BLOCK
    )
    :vars
    (
      ?auto_122652 - BLOCK
      ?auto_122653 - BLOCK
      ?auto_122654 - BLOCK
      ?auto_122651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122652 ?auto_122650 ) ( ON-TABLE ?auto_122647 ) ( ON ?auto_122648 ?auto_122647 ) ( ON ?auto_122649 ?auto_122648 ) ( ON ?auto_122650 ?auto_122649 ) ( not ( = ?auto_122647 ?auto_122648 ) ) ( not ( = ?auto_122647 ?auto_122649 ) ) ( not ( = ?auto_122647 ?auto_122650 ) ) ( not ( = ?auto_122647 ?auto_122652 ) ) ( not ( = ?auto_122648 ?auto_122649 ) ) ( not ( = ?auto_122648 ?auto_122650 ) ) ( not ( = ?auto_122648 ?auto_122652 ) ) ( not ( = ?auto_122649 ?auto_122650 ) ) ( not ( = ?auto_122649 ?auto_122652 ) ) ( not ( = ?auto_122650 ?auto_122652 ) ) ( not ( = ?auto_122647 ?auto_122653 ) ) ( not ( = ?auto_122647 ?auto_122654 ) ) ( not ( = ?auto_122648 ?auto_122653 ) ) ( not ( = ?auto_122648 ?auto_122654 ) ) ( not ( = ?auto_122649 ?auto_122653 ) ) ( not ( = ?auto_122649 ?auto_122654 ) ) ( not ( = ?auto_122650 ?auto_122653 ) ) ( not ( = ?auto_122650 ?auto_122654 ) ) ( not ( = ?auto_122652 ?auto_122653 ) ) ( not ( = ?auto_122652 ?auto_122654 ) ) ( not ( = ?auto_122653 ?auto_122654 ) ) ( ON ?auto_122653 ?auto_122652 ) ( CLEAR ?auto_122651 ) ( ON-TABLE ?auto_122651 ) ( not ( = ?auto_122651 ?auto_122654 ) ) ( not ( = ?auto_122647 ?auto_122651 ) ) ( not ( = ?auto_122648 ?auto_122651 ) ) ( not ( = ?auto_122649 ?auto_122651 ) ) ( not ( = ?auto_122650 ?auto_122651 ) ) ( not ( = ?auto_122652 ?auto_122651 ) ) ( not ( = ?auto_122653 ?auto_122651 ) ) ( ON ?auto_122654 ?auto_122653 ) ( CLEAR ?auto_122654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122647 ?auto_122648 ?auto_122649 ?auto_122650 ?auto_122652 ?auto_122653 )
      ( MAKE-4PILE ?auto_122647 ?auto_122648 ?auto_122649 ?auto_122650 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122655 - BLOCK
      ?auto_122656 - BLOCK
      ?auto_122657 - BLOCK
      ?auto_122658 - BLOCK
    )
    :vars
    (
      ?auto_122659 - BLOCK
      ?auto_122660 - BLOCK
      ?auto_122662 - BLOCK
      ?auto_122661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122659 ?auto_122658 ) ( ON-TABLE ?auto_122655 ) ( ON ?auto_122656 ?auto_122655 ) ( ON ?auto_122657 ?auto_122656 ) ( ON ?auto_122658 ?auto_122657 ) ( not ( = ?auto_122655 ?auto_122656 ) ) ( not ( = ?auto_122655 ?auto_122657 ) ) ( not ( = ?auto_122655 ?auto_122658 ) ) ( not ( = ?auto_122655 ?auto_122659 ) ) ( not ( = ?auto_122656 ?auto_122657 ) ) ( not ( = ?auto_122656 ?auto_122658 ) ) ( not ( = ?auto_122656 ?auto_122659 ) ) ( not ( = ?auto_122657 ?auto_122658 ) ) ( not ( = ?auto_122657 ?auto_122659 ) ) ( not ( = ?auto_122658 ?auto_122659 ) ) ( not ( = ?auto_122655 ?auto_122660 ) ) ( not ( = ?auto_122655 ?auto_122662 ) ) ( not ( = ?auto_122656 ?auto_122660 ) ) ( not ( = ?auto_122656 ?auto_122662 ) ) ( not ( = ?auto_122657 ?auto_122660 ) ) ( not ( = ?auto_122657 ?auto_122662 ) ) ( not ( = ?auto_122658 ?auto_122660 ) ) ( not ( = ?auto_122658 ?auto_122662 ) ) ( not ( = ?auto_122659 ?auto_122660 ) ) ( not ( = ?auto_122659 ?auto_122662 ) ) ( not ( = ?auto_122660 ?auto_122662 ) ) ( ON ?auto_122660 ?auto_122659 ) ( not ( = ?auto_122661 ?auto_122662 ) ) ( not ( = ?auto_122655 ?auto_122661 ) ) ( not ( = ?auto_122656 ?auto_122661 ) ) ( not ( = ?auto_122657 ?auto_122661 ) ) ( not ( = ?auto_122658 ?auto_122661 ) ) ( not ( = ?auto_122659 ?auto_122661 ) ) ( not ( = ?auto_122660 ?auto_122661 ) ) ( ON ?auto_122662 ?auto_122660 ) ( CLEAR ?auto_122662 ) ( HOLDING ?auto_122661 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_122661 )
      ( MAKE-4PILE ?auto_122655 ?auto_122656 ?auto_122657 ?auto_122658 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122675 - BLOCK
      ?auto_122676 - BLOCK
      ?auto_122677 - BLOCK
      ?auto_122678 - BLOCK
    )
    :vars
    (
      ?auto_122681 - BLOCK
      ?auto_122679 - BLOCK
      ?auto_122680 - BLOCK
      ?auto_122682 - BLOCK
      ?auto_122683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122681 ?auto_122678 ) ( ON-TABLE ?auto_122675 ) ( ON ?auto_122676 ?auto_122675 ) ( ON ?auto_122677 ?auto_122676 ) ( ON ?auto_122678 ?auto_122677 ) ( not ( = ?auto_122675 ?auto_122676 ) ) ( not ( = ?auto_122675 ?auto_122677 ) ) ( not ( = ?auto_122675 ?auto_122678 ) ) ( not ( = ?auto_122675 ?auto_122681 ) ) ( not ( = ?auto_122676 ?auto_122677 ) ) ( not ( = ?auto_122676 ?auto_122678 ) ) ( not ( = ?auto_122676 ?auto_122681 ) ) ( not ( = ?auto_122677 ?auto_122678 ) ) ( not ( = ?auto_122677 ?auto_122681 ) ) ( not ( = ?auto_122678 ?auto_122681 ) ) ( not ( = ?auto_122675 ?auto_122679 ) ) ( not ( = ?auto_122675 ?auto_122680 ) ) ( not ( = ?auto_122676 ?auto_122679 ) ) ( not ( = ?auto_122676 ?auto_122680 ) ) ( not ( = ?auto_122677 ?auto_122679 ) ) ( not ( = ?auto_122677 ?auto_122680 ) ) ( not ( = ?auto_122678 ?auto_122679 ) ) ( not ( = ?auto_122678 ?auto_122680 ) ) ( not ( = ?auto_122681 ?auto_122679 ) ) ( not ( = ?auto_122681 ?auto_122680 ) ) ( not ( = ?auto_122679 ?auto_122680 ) ) ( ON ?auto_122679 ?auto_122681 ) ( not ( = ?auto_122682 ?auto_122680 ) ) ( not ( = ?auto_122675 ?auto_122682 ) ) ( not ( = ?auto_122676 ?auto_122682 ) ) ( not ( = ?auto_122677 ?auto_122682 ) ) ( not ( = ?auto_122678 ?auto_122682 ) ) ( not ( = ?auto_122681 ?auto_122682 ) ) ( not ( = ?auto_122679 ?auto_122682 ) ) ( ON ?auto_122680 ?auto_122679 ) ( CLEAR ?auto_122680 ) ( ON ?auto_122682 ?auto_122683 ) ( CLEAR ?auto_122682 ) ( HAND-EMPTY ) ( not ( = ?auto_122675 ?auto_122683 ) ) ( not ( = ?auto_122676 ?auto_122683 ) ) ( not ( = ?auto_122677 ?auto_122683 ) ) ( not ( = ?auto_122678 ?auto_122683 ) ) ( not ( = ?auto_122681 ?auto_122683 ) ) ( not ( = ?auto_122679 ?auto_122683 ) ) ( not ( = ?auto_122680 ?auto_122683 ) ) ( not ( = ?auto_122682 ?auto_122683 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_122682 ?auto_122683 )
      ( MAKE-4PILE ?auto_122675 ?auto_122676 ?auto_122677 ?auto_122678 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122684 - BLOCK
      ?auto_122685 - BLOCK
      ?auto_122686 - BLOCK
      ?auto_122687 - BLOCK
    )
    :vars
    (
      ?auto_122688 - BLOCK
      ?auto_122692 - BLOCK
      ?auto_122689 - BLOCK
      ?auto_122690 - BLOCK
      ?auto_122691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122688 ?auto_122687 ) ( ON-TABLE ?auto_122684 ) ( ON ?auto_122685 ?auto_122684 ) ( ON ?auto_122686 ?auto_122685 ) ( ON ?auto_122687 ?auto_122686 ) ( not ( = ?auto_122684 ?auto_122685 ) ) ( not ( = ?auto_122684 ?auto_122686 ) ) ( not ( = ?auto_122684 ?auto_122687 ) ) ( not ( = ?auto_122684 ?auto_122688 ) ) ( not ( = ?auto_122685 ?auto_122686 ) ) ( not ( = ?auto_122685 ?auto_122687 ) ) ( not ( = ?auto_122685 ?auto_122688 ) ) ( not ( = ?auto_122686 ?auto_122687 ) ) ( not ( = ?auto_122686 ?auto_122688 ) ) ( not ( = ?auto_122687 ?auto_122688 ) ) ( not ( = ?auto_122684 ?auto_122692 ) ) ( not ( = ?auto_122684 ?auto_122689 ) ) ( not ( = ?auto_122685 ?auto_122692 ) ) ( not ( = ?auto_122685 ?auto_122689 ) ) ( not ( = ?auto_122686 ?auto_122692 ) ) ( not ( = ?auto_122686 ?auto_122689 ) ) ( not ( = ?auto_122687 ?auto_122692 ) ) ( not ( = ?auto_122687 ?auto_122689 ) ) ( not ( = ?auto_122688 ?auto_122692 ) ) ( not ( = ?auto_122688 ?auto_122689 ) ) ( not ( = ?auto_122692 ?auto_122689 ) ) ( ON ?auto_122692 ?auto_122688 ) ( not ( = ?auto_122690 ?auto_122689 ) ) ( not ( = ?auto_122684 ?auto_122690 ) ) ( not ( = ?auto_122685 ?auto_122690 ) ) ( not ( = ?auto_122686 ?auto_122690 ) ) ( not ( = ?auto_122687 ?auto_122690 ) ) ( not ( = ?auto_122688 ?auto_122690 ) ) ( not ( = ?auto_122692 ?auto_122690 ) ) ( ON ?auto_122690 ?auto_122691 ) ( CLEAR ?auto_122690 ) ( not ( = ?auto_122684 ?auto_122691 ) ) ( not ( = ?auto_122685 ?auto_122691 ) ) ( not ( = ?auto_122686 ?auto_122691 ) ) ( not ( = ?auto_122687 ?auto_122691 ) ) ( not ( = ?auto_122688 ?auto_122691 ) ) ( not ( = ?auto_122692 ?auto_122691 ) ) ( not ( = ?auto_122689 ?auto_122691 ) ) ( not ( = ?auto_122690 ?auto_122691 ) ) ( HOLDING ?auto_122689 ) ( CLEAR ?auto_122692 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122684 ?auto_122685 ?auto_122686 ?auto_122687 ?auto_122688 ?auto_122692 ?auto_122689 )
      ( MAKE-4PILE ?auto_122684 ?auto_122685 ?auto_122686 ?auto_122687 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122766 - BLOCK
      ?auto_122767 - BLOCK
      ?auto_122768 - BLOCK
      ?auto_122769 - BLOCK
    )
    :vars
    (
      ?auto_122770 - BLOCK
      ?auto_122771 - BLOCK
      ?auto_122773 - BLOCK
      ?auto_122772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122766 ) ( ON ?auto_122767 ?auto_122766 ) ( not ( = ?auto_122766 ?auto_122767 ) ) ( not ( = ?auto_122766 ?auto_122768 ) ) ( not ( = ?auto_122766 ?auto_122769 ) ) ( not ( = ?auto_122767 ?auto_122768 ) ) ( not ( = ?auto_122767 ?auto_122769 ) ) ( not ( = ?auto_122768 ?auto_122769 ) ) ( ON ?auto_122769 ?auto_122770 ) ( not ( = ?auto_122766 ?auto_122770 ) ) ( not ( = ?auto_122767 ?auto_122770 ) ) ( not ( = ?auto_122768 ?auto_122770 ) ) ( not ( = ?auto_122769 ?auto_122770 ) ) ( CLEAR ?auto_122767 ) ( ON ?auto_122768 ?auto_122769 ) ( CLEAR ?auto_122768 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_122771 ) ( ON ?auto_122773 ?auto_122771 ) ( ON ?auto_122772 ?auto_122773 ) ( ON ?auto_122770 ?auto_122772 ) ( not ( = ?auto_122771 ?auto_122773 ) ) ( not ( = ?auto_122771 ?auto_122772 ) ) ( not ( = ?auto_122771 ?auto_122770 ) ) ( not ( = ?auto_122771 ?auto_122769 ) ) ( not ( = ?auto_122771 ?auto_122768 ) ) ( not ( = ?auto_122773 ?auto_122772 ) ) ( not ( = ?auto_122773 ?auto_122770 ) ) ( not ( = ?auto_122773 ?auto_122769 ) ) ( not ( = ?auto_122773 ?auto_122768 ) ) ( not ( = ?auto_122772 ?auto_122770 ) ) ( not ( = ?auto_122772 ?auto_122769 ) ) ( not ( = ?auto_122772 ?auto_122768 ) ) ( not ( = ?auto_122766 ?auto_122771 ) ) ( not ( = ?auto_122766 ?auto_122773 ) ) ( not ( = ?auto_122766 ?auto_122772 ) ) ( not ( = ?auto_122767 ?auto_122771 ) ) ( not ( = ?auto_122767 ?auto_122773 ) ) ( not ( = ?auto_122767 ?auto_122772 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122771 ?auto_122773 ?auto_122772 ?auto_122770 ?auto_122769 )
      ( MAKE-4PILE ?auto_122766 ?auto_122767 ?auto_122768 ?auto_122769 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122774 - BLOCK
      ?auto_122775 - BLOCK
      ?auto_122776 - BLOCK
      ?auto_122777 - BLOCK
    )
    :vars
    (
      ?auto_122779 - BLOCK
      ?auto_122778 - BLOCK
      ?auto_122781 - BLOCK
      ?auto_122780 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122774 ) ( not ( = ?auto_122774 ?auto_122775 ) ) ( not ( = ?auto_122774 ?auto_122776 ) ) ( not ( = ?auto_122774 ?auto_122777 ) ) ( not ( = ?auto_122775 ?auto_122776 ) ) ( not ( = ?auto_122775 ?auto_122777 ) ) ( not ( = ?auto_122776 ?auto_122777 ) ) ( ON ?auto_122777 ?auto_122779 ) ( not ( = ?auto_122774 ?auto_122779 ) ) ( not ( = ?auto_122775 ?auto_122779 ) ) ( not ( = ?auto_122776 ?auto_122779 ) ) ( not ( = ?auto_122777 ?auto_122779 ) ) ( ON ?auto_122776 ?auto_122777 ) ( CLEAR ?auto_122776 ) ( ON-TABLE ?auto_122778 ) ( ON ?auto_122781 ?auto_122778 ) ( ON ?auto_122780 ?auto_122781 ) ( ON ?auto_122779 ?auto_122780 ) ( not ( = ?auto_122778 ?auto_122781 ) ) ( not ( = ?auto_122778 ?auto_122780 ) ) ( not ( = ?auto_122778 ?auto_122779 ) ) ( not ( = ?auto_122778 ?auto_122777 ) ) ( not ( = ?auto_122778 ?auto_122776 ) ) ( not ( = ?auto_122781 ?auto_122780 ) ) ( not ( = ?auto_122781 ?auto_122779 ) ) ( not ( = ?auto_122781 ?auto_122777 ) ) ( not ( = ?auto_122781 ?auto_122776 ) ) ( not ( = ?auto_122780 ?auto_122779 ) ) ( not ( = ?auto_122780 ?auto_122777 ) ) ( not ( = ?auto_122780 ?auto_122776 ) ) ( not ( = ?auto_122774 ?auto_122778 ) ) ( not ( = ?auto_122774 ?auto_122781 ) ) ( not ( = ?auto_122774 ?auto_122780 ) ) ( not ( = ?auto_122775 ?auto_122778 ) ) ( not ( = ?auto_122775 ?auto_122781 ) ) ( not ( = ?auto_122775 ?auto_122780 ) ) ( HOLDING ?auto_122775 ) ( CLEAR ?auto_122774 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122774 ?auto_122775 )
      ( MAKE-4PILE ?auto_122774 ?auto_122775 ?auto_122776 ?auto_122777 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122782 - BLOCK
      ?auto_122783 - BLOCK
      ?auto_122784 - BLOCK
      ?auto_122785 - BLOCK
    )
    :vars
    (
      ?auto_122786 - BLOCK
      ?auto_122788 - BLOCK
      ?auto_122789 - BLOCK
      ?auto_122787 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122782 ) ( not ( = ?auto_122782 ?auto_122783 ) ) ( not ( = ?auto_122782 ?auto_122784 ) ) ( not ( = ?auto_122782 ?auto_122785 ) ) ( not ( = ?auto_122783 ?auto_122784 ) ) ( not ( = ?auto_122783 ?auto_122785 ) ) ( not ( = ?auto_122784 ?auto_122785 ) ) ( ON ?auto_122785 ?auto_122786 ) ( not ( = ?auto_122782 ?auto_122786 ) ) ( not ( = ?auto_122783 ?auto_122786 ) ) ( not ( = ?auto_122784 ?auto_122786 ) ) ( not ( = ?auto_122785 ?auto_122786 ) ) ( ON ?auto_122784 ?auto_122785 ) ( ON-TABLE ?auto_122788 ) ( ON ?auto_122789 ?auto_122788 ) ( ON ?auto_122787 ?auto_122789 ) ( ON ?auto_122786 ?auto_122787 ) ( not ( = ?auto_122788 ?auto_122789 ) ) ( not ( = ?auto_122788 ?auto_122787 ) ) ( not ( = ?auto_122788 ?auto_122786 ) ) ( not ( = ?auto_122788 ?auto_122785 ) ) ( not ( = ?auto_122788 ?auto_122784 ) ) ( not ( = ?auto_122789 ?auto_122787 ) ) ( not ( = ?auto_122789 ?auto_122786 ) ) ( not ( = ?auto_122789 ?auto_122785 ) ) ( not ( = ?auto_122789 ?auto_122784 ) ) ( not ( = ?auto_122787 ?auto_122786 ) ) ( not ( = ?auto_122787 ?auto_122785 ) ) ( not ( = ?auto_122787 ?auto_122784 ) ) ( not ( = ?auto_122782 ?auto_122788 ) ) ( not ( = ?auto_122782 ?auto_122789 ) ) ( not ( = ?auto_122782 ?auto_122787 ) ) ( not ( = ?auto_122783 ?auto_122788 ) ) ( not ( = ?auto_122783 ?auto_122789 ) ) ( not ( = ?auto_122783 ?auto_122787 ) ) ( CLEAR ?auto_122782 ) ( ON ?auto_122783 ?auto_122784 ) ( CLEAR ?auto_122783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122788 ?auto_122789 ?auto_122787 ?auto_122786 ?auto_122785 ?auto_122784 )
      ( MAKE-4PILE ?auto_122782 ?auto_122783 ?auto_122784 ?auto_122785 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122790 - BLOCK
      ?auto_122791 - BLOCK
      ?auto_122792 - BLOCK
      ?auto_122793 - BLOCK
    )
    :vars
    (
      ?auto_122796 - BLOCK
      ?auto_122797 - BLOCK
      ?auto_122795 - BLOCK
      ?auto_122794 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122790 ?auto_122791 ) ) ( not ( = ?auto_122790 ?auto_122792 ) ) ( not ( = ?auto_122790 ?auto_122793 ) ) ( not ( = ?auto_122791 ?auto_122792 ) ) ( not ( = ?auto_122791 ?auto_122793 ) ) ( not ( = ?auto_122792 ?auto_122793 ) ) ( ON ?auto_122793 ?auto_122796 ) ( not ( = ?auto_122790 ?auto_122796 ) ) ( not ( = ?auto_122791 ?auto_122796 ) ) ( not ( = ?auto_122792 ?auto_122796 ) ) ( not ( = ?auto_122793 ?auto_122796 ) ) ( ON ?auto_122792 ?auto_122793 ) ( ON-TABLE ?auto_122797 ) ( ON ?auto_122795 ?auto_122797 ) ( ON ?auto_122794 ?auto_122795 ) ( ON ?auto_122796 ?auto_122794 ) ( not ( = ?auto_122797 ?auto_122795 ) ) ( not ( = ?auto_122797 ?auto_122794 ) ) ( not ( = ?auto_122797 ?auto_122796 ) ) ( not ( = ?auto_122797 ?auto_122793 ) ) ( not ( = ?auto_122797 ?auto_122792 ) ) ( not ( = ?auto_122795 ?auto_122794 ) ) ( not ( = ?auto_122795 ?auto_122796 ) ) ( not ( = ?auto_122795 ?auto_122793 ) ) ( not ( = ?auto_122795 ?auto_122792 ) ) ( not ( = ?auto_122794 ?auto_122796 ) ) ( not ( = ?auto_122794 ?auto_122793 ) ) ( not ( = ?auto_122794 ?auto_122792 ) ) ( not ( = ?auto_122790 ?auto_122797 ) ) ( not ( = ?auto_122790 ?auto_122795 ) ) ( not ( = ?auto_122790 ?auto_122794 ) ) ( not ( = ?auto_122791 ?auto_122797 ) ) ( not ( = ?auto_122791 ?auto_122795 ) ) ( not ( = ?auto_122791 ?auto_122794 ) ) ( ON ?auto_122791 ?auto_122792 ) ( CLEAR ?auto_122791 ) ( HOLDING ?auto_122790 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_122790 )
      ( MAKE-4PILE ?auto_122790 ?auto_122791 ?auto_122792 ?auto_122793 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122798 - BLOCK
      ?auto_122799 - BLOCK
      ?auto_122800 - BLOCK
      ?auto_122801 - BLOCK
    )
    :vars
    (
      ?auto_122802 - BLOCK
      ?auto_122803 - BLOCK
      ?auto_122805 - BLOCK
      ?auto_122804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122798 ?auto_122799 ) ) ( not ( = ?auto_122798 ?auto_122800 ) ) ( not ( = ?auto_122798 ?auto_122801 ) ) ( not ( = ?auto_122799 ?auto_122800 ) ) ( not ( = ?auto_122799 ?auto_122801 ) ) ( not ( = ?auto_122800 ?auto_122801 ) ) ( ON ?auto_122801 ?auto_122802 ) ( not ( = ?auto_122798 ?auto_122802 ) ) ( not ( = ?auto_122799 ?auto_122802 ) ) ( not ( = ?auto_122800 ?auto_122802 ) ) ( not ( = ?auto_122801 ?auto_122802 ) ) ( ON ?auto_122800 ?auto_122801 ) ( ON-TABLE ?auto_122803 ) ( ON ?auto_122805 ?auto_122803 ) ( ON ?auto_122804 ?auto_122805 ) ( ON ?auto_122802 ?auto_122804 ) ( not ( = ?auto_122803 ?auto_122805 ) ) ( not ( = ?auto_122803 ?auto_122804 ) ) ( not ( = ?auto_122803 ?auto_122802 ) ) ( not ( = ?auto_122803 ?auto_122801 ) ) ( not ( = ?auto_122803 ?auto_122800 ) ) ( not ( = ?auto_122805 ?auto_122804 ) ) ( not ( = ?auto_122805 ?auto_122802 ) ) ( not ( = ?auto_122805 ?auto_122801 ) ) ( not ( = ?auto_122805 ?auto_122800 ) ) ( not ( = ?auto_122804 ?auto_122802 ) ) ( not ( = ?auto_122804 ?auto_122801 ) ) ( not ( = ?auto_122804 ?auto_122800 ) ) ( not ( = ?auto_122798 ?auto_122803 ) ) ( not ( = ?auto_122798 ?auto_122805 ) ) ( not ( = ?auto_122798 ?auto_122804 ) ) ( not ( = ?auto_122799 ?auto_122803 ) ) ( not ( = ?auto_122799 ?auto_122805 ) ) ( not ( = ?auto_122799 ?auto_122804 ) ) ( ON ?auto_122799 ?auto_122800 ) ( ON ?auto_122798 ?auto_122799 ) ( CLEAR ?auto_122798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122803 ?auto_122805 ?auto_122804 ?auto_122802 ?auto_122801 ?auto_122800 ?auto_122799 )
      ( MAKE-4PILE ?auto_122798 ?auto_122799 ?auto_122800 ?auto_122801 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122810 - BLOCK
      ?auto_122811 - BLOCK
      ?auto_122812 - BLOCK
      ?auto_122813 - BLOCK
    )
    :vars
    (
      ?auto_122816 - BLOCK
      ?auto_122817 - BLOCK
      ?auto_122814 - BLOCK
      ?auto_122815 - BLOCK
      ?auto_122818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122810 ?auto_122811 ) ) ( not ( = ?auto_122810 ?auto_122812 ) ) ( not ( = ?auto_122810 ?auto_122813 ) ) ( not ( = ?auto_122811 ?auto_122812 ) ) ( not ( = ?auto_122811 ?auto_122813 ) ) ( not ( = ?auto_122812 ?auto_122813 ) ) ( ON ?auto_122813 ?auto_122816 ) ( not ( = ?auto_122810 ?auto_122816 ) ) ( not ( = ?auto_122811 ?auto_122816 ) ) ( not ( = ?auto_122812 ?auto_122816 ) ) ( not ( = ?auto_122813 ?auto_122816 ) ) ( ON ?auto_122812 ?auto_122813 ) ( ON-TABLE ?auto_122817 ) ( ON ?auto_122814 ?auto_122817 ) ( ON ?auto_122815 ?auto_122814 ) ( ON ?auto_122816 ?auto_122815 ) ( not ( = ?auto_122817 ?auto_122814 ) ) ( not ( = ?auto_122817 ?auto_122815 ) ) ( not ( = ?auto_122817 ?auto_122816 ) ) ( not ( = ?auto_122817 ?auto_122813 ) ) ( not ( = ?auto_122817 ?auto_122812 ) ) ( not ( = ?auto_122814 ?auto_122815 ) ) ( not ( = ?auto_122814 ?auto_122816 ) ) ( not ( = ?auto_122814 ?auto_122813 ) ) ( not ( = ?auto_122814 ?auto_122812 ) ) ( not ( = ?auto_122815 ?auto_122816 ) ) ( not ( = ?auto_122815 ?auto_122813 ) ) ( not ( = ?auto_122815 ?auto_122812 ) ) ( not ( = ?auto_122810 ?auto_122817 ) ) ( not ( = ?auto_122810 ?auto_122814 ) ) ( not ( = ?auto_122810 ?auto_122815 ) ) ( not ( = ?auto_122811 ?auto_122817 ) ) ( not ( = ?auto_122811 ?auto_122814 ) ) ( not ( = ?auto_122811 ?auto_122815 ) ) ( ON ?auto_122811 ?auto_122812 ) ( CLEAR ?auto_122811 ) ( ON ?auto_122810 ?auto_122818 ) ( CLEAR ?auto_122810 ) ( HAND-EMPTY ) ( not ( = ?auto_122810 ?auto_122818 ) ) ( not ( = ?auto_122811 ?auto_122818 ) ) ( not ( = ?auto_122812 ?auto_122818 ) ) ( not ( = ?auto_122813 ?auto_122818 ) ) ( not ( = ?auto_122816 ?auto_122818 ) ) ( not ( = ?auto_122817 ?auto_122818 ) ) ( not ( = ?auto_122814 ?auto_122818 ) ) ( not ( = ?auto_122815 ?auto_122818 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_122810 ?auto_122818 )
      ( MAKE-4PILE ?auto_122810 ?auto_122811 ?auto_122812 ?auto_122813 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122819 - BLOCK
      ?auto_122820 - BLOCK
      ?auto_122821 - BLOCK
      ?auto_122822 - BLOCK
    )
    :vars
    (
      ?auto_122823 - BLOCK
      ?auto_122826 - BLOCK
      ?auto_122825 - BLOCK
      ?auto_122827 - BLOCK
      ?auto_122824 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122819 ?auto_122820 ) ) ( not ( = ?auto_122819 ?auto_122821 ) ) ( not ( = ?auto_122819 ?auto_122822 ) ) ( not ( = ?auto_122820 ?auto_122821 ) ) ( not ( = ?auto_122820 ?auto_122822 ) ) ( not ( = ?auto_122821 ?auto_122822 ) ) ( ON ?auto_122822 ?auto_122823 ) ( not ( = ?auto_122819 ?auto_122823 ) ) ( not ( = ?auto_122820 ?auto_122823 ) ) ( not ( = ?auto_122821 ?auto_122823 ) ) ( not ( = ?auto_122822 ?auto_122823 ) ) ( ON ?auto_122821 ?auto_122822 ) ( ON-TABLE ?auto_122826 ) ( ON ?auto_122825 ?auto_122826 ) ( ON ?auto_122827 ?auto_122825 ) ( ON ?auto_122823 ?auto_122827 ) ( not ( = ?auto_122826 ?auto_122825 ) ) ( not ( = ?auto_122826 ?auto_122827 ) ) ( not ( = ?auto_122826 ?auto_122823 ) ) ( not ( = ?auto_122826 ?auto_122822 ) ) ( not ( = ?auto_122826 ?auto_122821 ) ) ( not ( = ?auto_122825 ?auto_122827 ) ) ( not ( = ?auto_122825 ?auto_122823 ) ) ( not ( = ?auto_122825 ?auto_122822 ) ) ( not ( = ?auto_122825 ?auto_122821 ) ) ( not ( = ?auto_122827 ?auto_122823 ) ) ( not ( = ?auto_122827 ?auto_122822 ) ) ( not ( = ?auto_122827 ?auto_122821 ) ) ( not ( = ?auto_122819 ?auto_122826 ) ) ( not ( = ?auto_122819 ?auto_122825 ) ) ( not ( = ?auto_122819 ?auto_122827 ) ) ( not ( = ?auto_122820 ?auto_122826 ) ) ( not ( = ?auto_122820 ?auto_122825 ) ) ( not ( = ?auto_122820 ?auto_122827 ) ) ( ON ?auto_122819 ?auto_122824 ) ( CLEAR ?auto_122819 ) ( not ( = ?auto_122819 ?auto_122824 ) ) ( not ( = ?auto_122820 ?auto_122824 ) ) ( not ( = ?auto_122821 ?auto_122824 ) ) ( not ( = ?auto_122822 ?auto_122824 ) ) ( not ( = ?auto_122823 ?auto_122824 ) ) ( not ( = ?auto_122826 ?auto_122824 ) ) ( not ( = ?auto_122825 ?auto_122824 ) ) ( not ( = ?auto_122827 ?auto_122824 ) ) ( HOLDING ?auto_122820 ) ( CLEAR ?auto_122821 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122826 ?auto_122825 ?auto_122827 ?auto_122823 ?auto_122822 ?auto_122821 ?auto_122820 )
      ( MAKE-4PILE ?auto_122819 ?auto_122820 ?auto_122821 ?auto_122822 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122828 - BLOCK
      ?auto_122829 - BLOCK
      ?auto_122830 - BLOCK
      ?auto_122831 - BLOCK
    )
    :vars
    (
      ?auto_122833 - BLOCK
      ?auto_122832 - BLOCK
      ?auto_122834 - BLOCK
      ?auto_122835 - BLOCK
      ?auto_122836 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122828 ?auto_122829 ) ) ( not ( = ?auto_122828 ?auto_122830 ) ) ( not ( = ?auto_122828 ?auto_122831 ) ) ( not ( = ?auto_122829 ?auto_122830 ) ) ( not ( = ?auto_122829 ?auto_122831 ) ) ( not ( = ?auto_122830 ?auto_122831 ) ) ( ON ?auto_122831 ?auto_122833 ) ( not ( = ?auto_122828 ?auto_122833 ) ) ( not ( = ?auto_122829 ?auto_122833 ) ) ( not ( = ?auto_122830 ?auto_122833 ) ) ( not ( = ?auto_122831 ?auto_122833 ) ) ( ON ?auto_122830 ?auto_122831 ) ( ON-TABLE ?auto_122832 ) ( ON ?auto_122834 ?auto_122832 ) ( ON ?auto_122835 ?auto_122834 ) ( ON ?auto_122833 ?auto_122835 ) ( not ( = ?auto_122832 ?auto_122834 ) ) ( not ( = ?auto_122832 ?auto_122835 ) ) ( not ( = ?auto_122832 ?auto_122833 ) ) ( not ( = ?auto_122832 ?auto_122831 ) ) ( not ( = ?auto_122832 ?auto_122830 ) ) ( not ( = ?auto_122834 ?auto_122835 ) ) ( not ( = ?auto_122834 ?auto_122833 ) ) ( not ( = ?auto_122834 ?auto_122831 ) ) ( not ( = ?auto_122834 ?auto_122830 ) ) ( not ( = ?auto_122835 ?auto_122833 ) ) ( not ( = ?auto_122835 ?auto_122831 ) ) ( not ( = ?auto_122835 ?auto_122830 ) ) ( not ( = ?auto_122828 ?auto_122832 ) ) ( not ( = ?auto_122828 ?auto_122834 ) ) ( not ( = ?auto_122828 ?auto_122835 ) ) ( not ( = ?auto_122829 ?auto_122832 ) ) ( not ( = ?auto_122829 ?auto_122834 ) ) ( not ( = ?auto_122829 ?auto_122835 ) ) ( ON ?auto_122828 ?auto_122836 ) ( not ( = ?auto_122828 ?auto_122836 ) ) ( not ( = ?auto_122829 ?auto_122836 ) ) ( not ( = ?auto_122830 ?auto_122836 ) ) ( not ( = ?auto_122831 ?auto_122836 ) ) ( not ( = ?auto_122833 ?auto_122836 ) ) ( not ( = ?auto_122832 ?auto_122836 ) ) ( not ( = ?auto_122834 ?auto_122836 ) ) ( not ( = ?auto_122835 ?auto_122836 ) ) ( CLEAR ?auto_122830 ) ( ON ?auto_122829 ?auto_122828 ) ( CLEAR ?auto_122829 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_122836 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122836 ?auto_122828 )
      ( MAKE-4PILE ?auto_122828 ?auto_122829 ?auto_122830 ?auto_122831 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122837 - BLOCK
      ?auto_122838 - BLOCK
      ?auto_122839 - BLOCK
      ?auto_122840 - BLOCK
    )
    :vars
    (
      ?auto_122841 - BLOCK
      ?auto_122842 - BLOCK
      ?auto_122844 - BLOCK
      ?auto_122845 - BLOCK
      ?auto_122843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122837 ?auto_122838 ) ) ( not ( = ?auto_122837 ?auto_122839 ) ) ( not ( = ?auto_122837 ?auto_122840 ) ) ( not ( = ?auto_122838 ?auto_122839 ) ) ( not ( = ?auto_122838 ?auto_122840 ) ) ( not ( = ?auto_122839 ?auto_122840 ) ) ( ON ?auto_122840 ?auto_122841 ) ( not ( = ?auto_122837 ?auto_122841 ) ) ( not ( = ?auto_122838 ?auto_122841 ) ) ( not ( = ?auto_122839 ?auto_122841 ) ) ( not ( = ?auto_122840 ?auto_122841 ) ) ( ON-TABLE ?auto_122842 ) ( ON ?auto_122844 ?auto_122842 ) ( ON ?auto_122845 ?auto_122844 ) ( ON ?auto_122841 ?auto_122845 ) ( not ( = ?auto_122842 ?auto_122844 ) ) ( not ( = ?auto_122842 ?auto_122845 ) ) ( not ( = ?auto_122842 ?auto_122841 ) ) ( not ( = ?auto_122842 ?auto_122840 ) ) ( not ( = ?auto_122842 ?auto_122839 ) ) ( not ( = ?auto_122844 ?auto_122845 ) ) ( not ( = ?auto_122844 ?auto_122841 ) ) ( not ( = ?auto_122844 ?auto_122840 ) ) ( not ( = ?auto_122844 ?auto_122839 ) ) ( not ( = ?auto_122845 ?auto_122841 ) ) ( not ( = ?auto_122845 ?auto_122840 ) ) ( not ( = ?auto_122845 ?auto_122839 ) ) ( not ( = ?auto_122837 ?auto_122842 ) ) ( not ( = ?auto_122837 ?auto_122844 ) ) ( not ( = ?auto_122837 ?auto_122845 ) ) ( not ( = ?auto_122838 ?auto_122842 ) ) ( not ( = ?auto_122838 ?auto_122844 ) ) ( not ( = ?auto_122838 ?auto_122845 ) ) ( ON ?auto_122837 ?auto_122843 ) ( not ( = ?auto_122837 ?auto_122843 ) ) ( not ( = ?auto_122838 ?auto_122843 ) ) ( not ( = ?auto_122839 ?auto_122843 ) ) ( not ( = ?auto_122840 ?auto_122843 ) ) ( not ( = ?auto_122841 ?auto_122843 ) ) ( not ( = ?auto_122842 ?auto_122843 ) ) ( not ( = ?auto_122844 ?auto_122843 ) ) ( not ( = ?auto_122845 ?auto_122843 ) ) ( ON ?auto_122838 ?auto_122837 ) ( CLEAR ?auto_122838 ) ( ON-TABLE ?auto_122843 ) ( HOLDING ?auto_122839 ) ( CLEAR ?auto_122840 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122842 ?auto_122844 ?auto_122845 ?auto_122841 ?auto_122840 ?auto_122839 )
      ( MAKE-4PILE ?auto_122837 ?auto_122838 ?auto_122839 ?auto_122840 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122846 - BLOCK
      ?auto_122847 - BLOCK
      ?auto_122848 - BLOCK
      ?auto_122849 - BLOCK
    )
    :vars
    (
      ?auto_122854 - BLOCK
      ?auto_122851 - BLOCK
      ?auto_122853 - BLOCK
      ?auto_122852 - BLOCK
      ?auto_122850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122846 ?auto_122847 ) ) ( not ( = ?auto_122846 ?auto_122848 ) ) ( not ( = ?auto_122846 ?auto_122849 ) ) ( not ( = ?auto_122847 ?auto_122848 ) ) ( not ( = ?auto_122847 ?auto_122849 ) ) ( not ( = ?auto_122848 ?auto_122849 ) ) ( ON ?auto_122849 ?auto_122854 ) ( not ( = ?auto_122846 ?auto_122854 ) ) ( not ( = ?auto_122847 ?auto_122854 ) ) ( not ( = ?auto_122848 ?auto_122854 ) ) ( not ( = ?auto_122849 ?auto_122854 ) ) ( ON-TABLE ?auto_122851 ) ( ON ?auto_122853 ?auto_122851 ) ( ON ?auto_122852 ?auto_122853 ) ( ON ?auto_122854 ?auto_122852 ) ( not ( = ?auto_122851 ?auto_122853 ) ) ( not ( = ?auto_122851 ?auto_122852 ) ) ( not ( = ?auto_122851 ?auto_122854 ) ) ( not ( = ?auto_122851 ?auto_122849 ) ) ( not ( = ?auto_122851 ?auto_122848 ) ) ( not ( = ?auto_122853 ?auto_122852 ) ) ( not ( = ?auto_122853 ?auto_122854 ) ) ( not ( = ?auto_122853 ?auto_122849 ) ) ( not ( = ?auto_122853 ?auto_122848 ) ) ( not ( = ?auto_122852 ?auto_122854 ) ) ( not ( = ?auto_122852 ?auto_122849 ) ) ( not ( = ?auto_122852 ?auto_122848 ) ) ( not ( = ?auto_122846 ?auto_122851 ) ) ( not ( = ?auto_122846 ?auto_122853 ) ) ( not ( = ?auto_122846 ?auto_122852 ) ) ( not ( = ?auto_122847 ?auto_122851 ) ) ( not ( = ?auto_122847 ?auto_122853 ) ) ( not ( = ?auto_122847 ?auto_122852 ) ) ( ON ?auto_122846 ?auto_122850 ) ( not ( = ?auto_122846 ?auto_122850 ) ) ( not ( = ?auto_122847 ?auto_122850 ) ) ( not ( = ?auto_122848 ?auto_122850 ) ) ( not ( = ?auto_122849 ?auto_122850 ) ) ( not ( = ?auto_122854 ?auto_122850 ) ) ( not ( = ?auto_122851 ?auto_122850 ) ) ( not ( = ?auto_122853 ?auto_122850 ) ) ( not ( = ?auto_122852 ?auto_122850 ) ) ( ON ?auto_122847 ?auto_122846 ) ( ON-TABLE ?auto_122850 ) ( CLEAR ?auto_122849 ) ( ON ?auto_122848 ?auto_122847 ) ( CLEAR ?auto_122848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122850 ?auto_122846 ?auto_122847 )
      ( MAKE-4PILE ?auto_122846 ?auto_122847 ?auto_122848 ?auto_122849 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122855 - BLOCK
      ?auto_122856 - BLOCK
      ?auto_122857 - BLOCK
      ?auto_122858 - BLOCK
    )
    :vars
    (
      ?auto_122861 - BLOCK
      ?auto_122859 - BLOCK
      ?auto_122862 - BLOCK
      ?auto_122863 - BLOCK
      ?auto_122860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122855 ?auto_122856 ) ) ( not ( = ?auto_122855 ?auto_122857 ) ) ( not ( = ?auto_122855 ?auto_122858 ) ) ( not ( = ?auto_122856 ?auto_122857 ) ) ( not ( = ?auto_122856 ?auto_122858 ) ) ( not ( = ?auto_122857 ?auto_122858 ) ) ( not ( = ?auto_122855 ?auto_122861 ) ) ( not ( = ?auto_122856 ?auto_122861 ) ) ( not ( = ?auto_122857 ?auto_122861 ) ) ( not ( = ?auto_122858 ?auto_122861 ) ) ( ON-TABLE ?auto_122859 ) ( ON ?auto_122862 ?auto_122859 ) ( ON ?auto_122863 ?auto_122862 ) ( ON ?auto_122861 ?auto_122863 ) ( not ( = ?auto_122859 ?auto_122862 ) ) ( not ( = ?auto_122859 ?auto_122863 ) ) ( not ( = ?auto_122859 ?auto_122861 ) ) ( not ( = ?auto_122859 ?auto_122858 ) ) ( not ( = ?auto_122859 ?auto_122857 ) ) ( not ( = ?auto_122862 ?auto_122863 ) ) ( not ( = ?auto_122862 ?auto_122861 ) ) ( not ( = ?auto_122862 ?auto_122858 ) ) ( not ( = ?auto_122862 ?auto_122857 ) ) ( not ( = ?auto_122863 ?auto_122861 ) ) ( not ( = ?auto_122863 ?auto_122858 ) ) ( not ( = ?auto_122863 ?auto_122857 ) ) ( not ( = ?auto_122855 ?auto_122859 ) ) ( not ( = ?auto_122855 ?auto_122862 ) ) ( not ( = ?auto_122855 ?auto_122863 ) ) ( not ( = ?auto_122856 ?auto_122859 ) ) ( not ( = ?auto_122856 ?auto_122862 ) ) ( not ( = ?auto_122856 ?auto_122863 ) ) ( ON ?auto_122855 ?auto_122860 ) ( not ( = ?auto_122855 ?auto_122860 ) ) ( not ( = ?auto_122856 ?auto_122860 ) ) ( not ( = ?auto_122857 ?auto_122860 ) ) ( not ( = ?auto_122858 ?auto_122860 ) ) ( not ( = ?auto_122861 ?auto_122860 ) ) ( not ( = ?auto_122859 ?auto_122860 ) ) ( not ( = ?auto_122862 ?auto_122860 ) ) ( not ( = ?auto_122863 ?auto_122860 ) ) ( ON ?auto_122856 ?auto_122855 ) ( ON-TABLE ?auto_122860 ) ( ON ?auto_122857 ?auto_122856 ) ( CLEAR ?auto_122857 ) ( HOLDING ?auto_122858 ) ( CLEAR ?auto_122861 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122859 ?auto_122862 ?auto_122863 ?auto_122861 ?auto_122858 )
      ( MAKE-4PILE ?auto_122855 ?auto_122856 ?auto_122857 ?auto_122858 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122864 - BLOCK
      ?auto_122865 - BLOCK
      ?auto_122866 - BLOCK
      ?auto_122867 - BLOCK
    )
    :vars
    (
      ?auto_122870 - BLOCK
      ?auto_122869 - BLOCK
      ?auto_122871 - BLOCK
      ?auto_122868 - BLOCK
      ?auto_122872 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122864 ?auto_122865 ) ) ( not ( = ?auto_122864 ?auto_122866 ) ) ( not ( = ?auto_122864 ?auto_122867 ) ) ( not ( = ?auto_122865 ?auto_122866 ) ) ( not ( = ?auto_122865 ?auto_122867 ) ) ( not ( = ?auto_122866 ?auto_122867 ) ) ( not ( = ?auto_122864 ?auto_122870 ) ) ( not ( = ?auto_122865 ?auto_122870 ) ) ( not ( = ?auto_122866 ?auto_122870 ) ) ( not ( = ?auto_122867 ?auto_122870 ) ) ( ON-TABLE ?auto_122869 ) ( ON ?auto_122871 ?auto_122869 ) ( ON ?auto_122868 ?auto_122871 ) ( ON ?auto_122870 ?auto_122868 ) ( not ( = ?auto_122869 ?auto_122871 ) ) ( not ( = ?auto_122869 ?auto_122868 ) ) ( not ( = ?auto_122869 ?auto_122870 ) ) ( not ( = ?auto_122869 ?auto_122867 ) ) ( not ( = ?auto_122869 ?auto_122866 ) ) ( not ( = ?auto_122871 ?auto_122868 ) ) ( not ( = ?auto_122871 ?auto_122870 ) ) ( not ( = ?auto_122871 ?auto_122867 ) ) ( not ( = ?auto_122871 ?auto_122866 ) ) ( not ( = ?auto_122868 ?auto_122870 ) ) ( not ( = ?auto_122868 ?auto_122867 ) ) ( not ( = ?auto_122868 ?auto_122866 ) ) ( not ( = ?auto_122864 ?auto_122869 ) ) ( not ( = ?auto_122864 ?auto_122871 ) ) ( not ( = ?auto_122864 ?auto_122868 ) ) ( not ( = ?auto_122865 ?auto_122869 ) ) ( not ( = ?auto_122865 ?auto_122871 ) ) ( not ( = ?auto_122865 ?auto_122868 ) ) ( ON ?auto_122864 ?auto_122872 ) ( not ( = ?auto_122864 ?auto_122872 ) ) ( not ( = ?auto_122865 ?auto_122872 ) ) ( not ( = ?auto_122866 ?auto_122872 ) ) ( not ( = ?auto_122867 ?auto_122872 ) ) ( not ( = ?auto_122870 ?auto_122872 ) ) ( not ( = ?auto_122869 ?auto_122872 ) ) ( not ( = ?auto_122871 ?auto_122872 ) ) ( not ( = ?auto_122868 ?auto_122872 ) ) ( ON ?auto_122865 ?auto_122864 ) ( ON-TABLE ?auto_122872 ) ( ON ?auto_122866 ?auto_122865 ) ( CLEAR ?auto_122870 ) ( ON ?auto_122867 ?auto_122866 ) ( CLEAR ?auto_122867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_122872 ?auto_122864 ?auto_122865 ?auto_122866 )
      ( MAKE-4PILE ?auto_122864 ?auto_122865 ?auto_122866 ?auto_122867 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122873 - BLOCK
      ?auto_122874 - BLOCK
      ?auto_122875 - BLOCK
      ?auto_122876 - BLOCK
    )
    :vars
    (
      ?auto_122879 - BLOCK
      ?auto_122878 - BLOCK
      ?auto_122877 - BLOCK
      ?auto_122880 - BLOCK
      ?auto_122881 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122873 ?auto_122874 ) ) ( not ( = ?auto_122873 ?auto_122875 ) ) ( not ( = ?auto_122873 ?auto_122876 ) ) ( not ( = ?auto_122874 ?auto_122875 ) ) ( not ( = ?auto_122874 ?auto_122876 ) ) ( not ( = ?auto_122875 ?auto_122876 ) ) ( not ( = ?auto_122873 ?auto_122879 ) ) ( not ( = ?auto_122874 ?auto_122879 ) ) ( not ( = ?auto_122875 ?auto_122879 ) ) ( not ( = ?auto_122876 ?auto_122879 ) ) ( ON-TABLE ?auto_122878 ) ( ON ?auto_122877 ?auto_122878 ) ( ON ?auto_122880 ?auto_122877 ) ( not ( = ?auto_122878 ?auto_122877 ) ) ( not ( = ?auto_122878 ?auto_122880 ) ) ( not ( = ?auto_122878 ?auto_122879 ) ) ( not ( = ?auto_122878 ?auto_122876 ) ) ( not ( = ?auto_122878 ?auto_122875 ) ) ( not ( = ?auto_122877 ?auto_122880 ) ) ( not ( = ?auto_122877 ?auto_122879 ) ) ( not ( = ?auto_122877 ?auto_122876 ) ) ( not ( = ?auto_122877 ?auto_122875 ) ) ( not ( = ?auto_122880 ?auto_122879 ) ) ( not ( = ?auto_122880 ?auto_122876 ) ) ( not ( = ?auto_122880 ?auto_122875 ) ) ( not ( = ?auto_122873 ?auto_122878 ) ) ( not ( = ?auto_122873 ?auto_122877 ) ) ( not ( = ?auto_122873 ?auto_122880 ) ) ( not ( = ?auto_122874 ?auto_122878 ) ) ( not ( = ?auto_122874 ?auto_122877 ) ) ( not ( = ?auto_122874 ?auto_122880 ) ) ( ON ?auto_122873 ?auto_122881 ) ( not ( = ?auto_122873 ?auto_122881 ) ) ( not ( = ?auto_122874 ?auto_122881 ) ) ( not ( = ?auto_122875 ?auto_122881 ) ) ( not ( = ?auto_122876 ?auto_122881 ) ) ( not ( = ?auto_122879 ?auto_122881 ) ) ( not ( = ?auto_122878 ?auto_122881 ) ) ( not ( = ?auto_122877 ?auto_122881 ) ) ( not ( = ?auto_122880 ?auto_122881 ) ) ( ON ?auto_122874 ?auto_122873 ) ( ON-TABLE ?auto_122881 ) ( ON ?auto_122875 ?auto_122874 ) ( ON ?auto_122876 ?auto_122875 ) ( CLEAR ?auto_122876 ) ( HOLDING ?auto_122879 ) ( CLEAR ?auto_122880 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_122878 ?auto_122877 ?auto_122880 ?auto_122879 )
      ( MAKE-4PILE ?auto_122873 ?auto_122874 ?auto_122875 ?auto_122876 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122882 - BLOCK
      ?auto_122883 - BLOCK
      ?auto_122884 - BLOCK
      ?auto_122885 - BLOCK
    )
    :vars
    (
      ?auto_122888 - BLOCK
      ?auto_122887 - BLOCK
      ?auto_122890 - BLOCK
      ?auto_122886 - BLOCK
      ?auto_122889 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122882 ?auto_122883 ) ) ( not ( = ?auto_122882 ?auto_122884 ) ) ( not ( = ?auto_122882 ?auto_122885 ) ) ( not ( = ?auto_122883 ?auto_122884 ) ) ( not ( = ?auto_122883 ?auto_122885 ) ) ( not ( = ?auto_122884 ?auto_122885 ) ) ( not ( = ?auto_122882 ?auto_122888 ) ) ( not ( = ?auto_122883 ?auto_122888 ) ) ( not ( = ?auto_122884 ?auto_122888 ) ) ( not ( = ?auto_122885 ?auto_122888 ) ) ( ON-TABLE ?auto_122887 ) ( ON ?auto_122890 ?auto_122887 ) ( ON ?auto_122886 ?auto_122890 ) ( not ( = ?auto_122887 ?auto_122890 ) ) ( not ( = ?auto_122887 ?auto_122886 ) ) ( not ( = ?auto_122887 ?auto_122888 ) ) ( not ( = ?auto_122887 ?auto_122885 ) ) ( not ( = ?auto_122887 ?auto_122884 ) ) ( not ( = ?auto_122890 ?auto_122886 ) ) ( not ( = ?auto_122890 ?auto_122888 ) ) ( not ( = ?auto_122890 ?auto_122885 ) ) ( not ( = ?auto_122890 ?auto_122884 ) ) ( not ( = ?auto_122886 ?auto_122888 ) ) ( not ( = ?auto_122886 ?auto_122885 ) ) ( not ( = ?auto_122886 ?auto_122884 ) ) ( not ( = ?auto_122882 ?auto_122887 ) ) ( not ( = ?auto_122882 ?auto_122890 ) ) ( not ( = ?auto_122882 ?auto_122886 ) ) ( not ( = ?auto_122883 ?auto_122887 ) ) ( not ( = ?auto_122883 ?auto_122890 ) ) ( not ( = ?auto_122883 ?auto_122886 ) ) ( ON ?auto_122882 ?auto_122889 ) ( not ( = ?auto_122882 ?auto_122889 ) ) ( not ( = ?auto_122883 ?auto_122889 ) ) ( not ( = ?auto_122884 ?auto_122889 ) ) ( not ( = ?auto_122885 ?auto_122889 ) ) ( not ( = ?auto_122888 ?auto_122889 ) ) ( not ( = ?auto_122887 ?auto_122889 ) ) ( not ( = ?auto_122890 ?auto_122889 ) ) ( not ( = ?auto_122886 ?auto_122889 ) ) ( ON ?auto_122883 ?auto_122882 ) ( ON-TABLE ?auto_122889 ) ( ON ?auto_122884 ?auto_122883 ) ( ON ?auto_122885 ?auto_122884 ) ( CLEAR ?auto_122886 ) ( ON ?auto_122888 ?auto_122885 ) ( CLEAR ?auto_122888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122889 ?auto_122882 ?auto_122883 ?auto_122884 ?auto_122885 )
      ( MAKE-4PILE ?auto_122882 ?auto_122883 ?auto_122884 ?auto_122885 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122891 - BLOCK
      ?auto_122892 - BLOCK
      ?auto_122893 - BLOCK
      ?auto_122894 - BLOCK
    )
    :vars
    (
      ?auto_122897 - BLOCK
      ?auto_122898 - BLOCK
      ?auto_122896 - BLOCK
      ?auto_122899 - BLOCK
      ?auto_122895 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122891 ?auto_122892 ) ) ( not ( = ?auto_122891 ?auto_122893 ) ) ( not ( = ?auto_122891 ?auto_122894 ) ) ( not ( = ?auto_122892 ?auto_122893 ) ) ( not ( = ?auto_122892 ?auto_122894 ) ) ( not ( = ?auto_122893 ?auto_122894 ) ) ( not ( = ?auto_122891 ?auto_122897 ) ) ( not ( = ?auto_122892 ?auto_122897 ) ) ( not ( = ?auto_122893 ?auto_122897 ) ) ( not ( = ?auto_122894 ?auto_122897 ) ) ( ON-TABLE ?auto_122898 ) ( ON ?auto_122896 ?auto_122898 ) ( not ( = ?auto_122898 ?auto_122896 ) ) ( not ( = ?auto_122898 ?auto_122899 ) ) ( not ( = ?auto_122898 ?auto_122897 ) ) ( not ( = ?auto_122898 ?auto_122894 ) ) ( not ( = ?auto_122898 ?auto_122893 ) ) ( not ( = ?auto_122896 ?auto_122899 ) ) ( not ( = ?auto_122896 ?auto_122897 ) ) ( not ( = ?auto_122896 ?auto_122894 ) ) ( not ( = ?auto_122896 ?auto_122893 ) ) ( not ( = ?auto_122899 ?auto_122897 ) ) ( not ( = ?auto_122899 ?auto_122894 ) ) ( not ( = ?auto_122899 ?auto_122893 ) ) ( not ( = ?auto_122891 ?auto_122898 ) ) ( not ( = ?auto_122891 ?auto_122896 ) ) ( not ( = ?auto_122891 ?auto_122899 ) ) ( not ( = ?auto_122892 ?auto_122898 ) ) ( not ( = ?auto_122892 ?auto_122896 ) ) ( not ( = ?auto_122892 ?auto_122899 ) ) ( ON ?auto_122891 ?auto_122895 ) ( not ( = ?auto_122891 ?auto_122895 ) ) ( not ( = ?auto_122892 ?auto_122895 ) ) ( not ( = ?auto_122893 ?auto_122895 ) ) ( not ( = ?auto_122894 ?auto_122895 ) ) ( not ( = ?auto_122897 ?auto_122895 ) ) ( not ( = ?auto_122898 ?auto_122895 ) ) ( not ( = ?auto_122896 ?auto_122895 ) ) ( not ( = ?auto_122899 ?auto_122895 ) ) ( ON ?auto_122892 ?auto_122891 ) ( ON-TABLE ?auto_122895 ) ( ON ?auto_122893 ?auto_122892 ) ( ON ?auto_122894 ?auto_122893 ) ( ON ?auto_122897 ?auto_122894 ) ( CLEAR ?auto_122897 ) ( HOLDING ?auto_122899 ) ( CLEAR ?auto_122896 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122898 ?auto_122896 ?auto_122899 )
      ( MAKE-4PILE ?auto_122891 ?auto_122892 ?auto_122893 ?auto_122894 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122900 - BLOCK
      ?auto_122901 - BLOCK
      ?auto_122902 - BLOCK
      ?auto_122903 - BLOCK
    )
    :vars
    (
      ?auto_122906 - BLOCK
      ?auto_122908 - BLOCK
      ?auto_122904 - BLOCK
      ?auto_122907 - BLOCK
      ?auto_122905 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122900 ?auto_122901 ) ) ( not ( = ?auto_122900 ?auto_122902 ) ) ( not ( = ?auto_122900 ?auto_122903 ) ) ( not ( = ?auto_122901 ?auto_122902 ) ) ( not ( = ?auto_122901 ?auto_122903 ) ) ( not ( = ?auto_122902 ?auto_122903 ) ) ( not ( = ?auto_122900 ?auto_122906 ) ) ( not ( = ?auto_122901 ?auto_122906 ) ) ( not ( = ?auto_122902 ?auto_122906 ) ) ( not ( = ?auto_122903 ?auto_122906 ) ) ( ON-TABLE ?auto_122908 ) ( ON ?auto_122904 ?auto_122908 ) ( not ( = ?auto_122908 ?auto_122904 ) ) ( not ( = ?auto_122908 ?auto_122907 ) ) ( not ( = ?auto_122908 ?auto_122906 ) ) ( not ( = ?auto_122908 ?auto_122903 ) ) ( not ( = ?auto_122908 ?auto_122902 ) ) ( not ( = ?auto_122904 ?auto_122907 ) ) ( not ( = ?auto_122904 ?auto_122906 ) ) ( not ( = ?auto_122904 ?auto_122903 ) ) ( not ( = ?auto_122904 ?auto_122902 ) ) ( not ( = ?auto_122907 ?auto_122906 ) ) ( not ( = ?auto_122907 ?auto_122903 ) ) ( not ( = ?auto_122907 ?auto_122902 ) ) ( not ( = ?auto_122900 ?auto_122908 ) ) ( not ( = ?auto_122900 ?auto_122904 ) ) ( not ( = ?auto_122900 ?auto_122907 ) ) ( not ( = ?auto_122901 ?auto_122908 ) ) ( not ( = ?auto_122901 ?auto_122904 ) ) ( not ( = ?auto_122901 ?auto_122907 ) ) ( ON ?auto_122900 ?auto_122905 ) ( not ( = ?auto_122900 ?auto_122905 ) ) ( not ( = ?auto_122901 ?auto_122905 ) ) ( not ( = ?auto_122902 ?auto_122905 ) ) ( not ( = ?auto_122903 ?auto_122905 ) ) ( not ( = ?auto_122906 ?auto_122905 ) ) ( not ( = ?auto_122908 ?auto_122905 ) ) ( not ( = ?auto_122904 ?auto_122905 ) ) ( not ( = ?auto_122907 ?auto_122905 ) ) ( ON ?auto_122901 ?auto_122900 ) ( ON-TABLE ?auto_122905 ) ( ON ?auto_122902 ?auto_122901 ) ( ON ?auto_122903 ?auto_122902 ) ( ON ?auto_122906 ?auto_122903 ) ( CLEAR ?auto_122904 ) ( ON ?auto_122907 ?auto_122906 ) ( CLEAR ?auto_122907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122905 ?auto_122900 ?auto_122901 ?auto_122902 ?auto_122903 ?auto_122906 )
      ( MAKE-4PILE ?auto_122900 ?auto_122901 ?auto_122902 ?auto_122903 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122909 - BLOCK
      ?auto_122910 - BLOCK
      ?auto_122911 - BLOCK
      ?auto_122912 - BLOCK
    )
    :vars
    (
      ?auto_122913 - BLOCK
      ?auto_122914 - BLOCK
      ?auto_122916 - BLOCK
      ?auto_122917 - BLOCK
      ?auto_122915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122909 ?auto_122910 ) ) ( not ( = ?auto_122909 ?auto_122911 ) ) ( not ( = ?auto_122909 ?auto_122912 ) ) ( not ( = ?auto_122910 ?auto_122911 ) ) ( not ( = ?auto_122910 ?auto_122912 ) ) ( not ( = ?auto_122911 ?auto_122912 ) ) ( not ( = ?auto_122909 ?auto_122913 ) ) ( not ( = ?auto_122910 ?auto_122913 ) ) ( not ( = ?auto_122911 ?auto_122913 ) ) ( not ( = ?auto_122912 ?auto_122913 ) ) ( ON-TABLE ?auto_122914 ) ( not ( = ?auto_122914 ?auto_122916 ) ) ( not ( = ?auto_122914 ?auto_122917 ) ) ( not ( = ?auto_122914 ?auto_122913 ) ) ( not ( = ?auto_122914 ?auto_122912 ) ) ( not ( = ?auto_122914 ?auto_122911 ) ) ( not ( = ?auto_122916 ?auto_122917 ) ) ( not ( = ?auto_122916 ?auto_122913 ) ) ( not ( = ?auto_122916 ?auto_122912 ) ) ( not ( = ?auto_122916 ?auto_122911 ) ) ( not ( = ?auto_122917 ?auto_122913 ) ) ( not ( = ?auto_122917 ?auto_122912 ) ) ( not ( = ?auto_122917 ?auto_122911 ) ) ( not ( = ?auto_122909 ?auto_122914 ) ) ( not ( = ?auto_122909 ?auto_122916 ) ) ( not ( = ?auto_122909 ?auto_122917 ) ) ( not ( = ?auto_122910 ?auto_122914 ) ) ( not ( = ?auto_122910 ?auto_122916 ) ) ( not ( = ?auto_122910 ?auto_122917 ) ) ( ON ?auto_122909 ?auto_122915 ) ( not ( = ?auto_122909 ?auto_122915 ) ) ( not ( = ?auto_122910 ?auto_122915 ) ) ( not ( = ?auto_122911 ?auto_122915 ) ) ( not ( = ?auto_122912 ?auto_122915 ) ) ( not ( = ?auto_122913 ?auto_122915 ) ) ( not ( = ?auto_122914 ?auto_122915 ) ) ( not ( = ?auto_122916 ?auto_122915 ) ) ( not ( = ?auto_122917 ?auto_122915 ) ) ( ON ?auto_122910 ?auto_122909 ) ( ON-TABLE ?auto_122915 ) ( ON ?auto_122911 ?auto_122910 ) ( ON ?auto_122912 ?auto_122911 ) ( ON ?auto_122913 ?auto_122912 ) ( ON ?auto_122917 ?auto_122913 ) ( CLEAR ?auto_122917 ) ( HOLDING ?auto_122916 ) ( CLEAR ?auto_122914 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122914 ?auto_122916 )
      ( MAKE-4PILE ?auto_122909 ?auto_122910 ?auto_122911 ?auto_122912 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122918 - BLOCK
      ?auto_122919 - BLOCK
      ?auto_122920 - BLOCK
      ?auto_122921 - BLOCK
    )
    :vars
    (
      ?auto_122923 - BLOCK
      ?auto_122926 - BLOCK
      ?auto_122922 - BLOCK
      ?auto_122925 - BLOCK
      ?auto_122924 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122918 ?auto_122919 ) ) ( not ( = ?auto_122918 ?auto_122920 ) ) ( not ( = ?auto_122918 ?auto_122921 ) ) ( not ( = ?auto_122919 ?auto_122920 ) ) ( not ( = ?auto_122919 ?auto_122921 ) ) ( not ( = ?auto_122920 ?auto_122921 ) ) ( not ( = ?auto_122918 ?auto_122923 ) ) ( not ( = ?auto_122919 ?auto_122923 ) ) ( not ( = ?auto_122920 ?auto_122923 ) ) ( not ( = ?auto_122921 ?auto_122923 ) ) ( ON-TABLE ?auto_122926 ) ( not ( = ?auto_122926 ?auto_122922 ) ) ( not ( = ?auto_122926 ?auto_122925 ) ) ( not ( = ?auto_122926 ?auto_122923 ) ) ( not ( = ?auto_122926 ?auto_122921 ) ) ( not ( = ?auto_122926 ?auto_122920 ) ) ( not ( = ?auto_122922 ?auto_122925 ) ) ( not ( = ?auto_122922 ?auto_122923 ) ) ( not ( = ?auto_122922 ?auto_122921 ) ) ( not ( = ?auto_122922 ?auto_122920 ) ) ( not ( = ?auto_122925 ?auto_122923 ) ) ( not ( = ?auto_122925 ?auto_122921 ) ) ( not ( = ?auto_122925 ?auto_122920 ) ) ( not ( = ?auto_122918 ?auto_122926 ) ) ( not ( = ?auto_122918 ?auto_122922 ) ) ( not ( = ?auto_122918 ?auto_122925 ) ) ( not ( = ?auto_122919 ?auto_122926 ) ) ( not ( = ?auto_122919 ?auto_122922 ) ) ( not ( = ?auto_122919 ?auto_122925 ) ) ( ON ?auto_122918 ?auto_122924 ) ( not ( = ?auto_122918 ?auto_122924 ) ) ( not ( = ?auto_122919 ?auto_122924 ) ) ( not ( = ?auto_122920 ?auto_122924 ) ) ( not ( = ?auto_122921 ?auto_122924 ) ) ( not ( = ?auto_122923 ?auto_122924 ) ) ( not ( = ?auto_122926 ?auto_122924 ) ) ( not ( = ?auto_122922 ?auto_122924 ) ) ( not ( = ?auto_122925 ?auto_122924 ) ) ( ON ?auto_122919 ?auto_122918 ) ( ON-TABLE ?auto_122924 ) ( ON ?auto_122920 ?auto_122919 ) ( ON ?auto_122921 ?auto_122920 ) ( ON ?auto_122923 ?auto_122921 ) ( ON ?auto_122925 ?auto_122923 ) ( CLEAR ?auto_122926 ) ( ON ?auto_122922 ?auto_122925 ) ( CLEAR ?auto_122922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122924 ?auto_122918 ?auto_122919 ?auto_122920 ?auto_122921 ?auto_122923 ?auto_122925 )
      ( MAKE-4PILE ?auto_122918 ?auto_122919 ?auto_122920 ?auto_122921 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122927 - BLOCK
      ?auto_122928 - BLOCK
      ?auto_122929 - BLOCK
      ?auto_122930 - BLOCK
    )
    :vars
    (
      ?auto_122932 - BLOCK
      ?auto_122931 - BLOCK
      ?auto_122934 - BLOCK
      ?auto_122933 - BLOCK
      ?auto_122935 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122927 ?auto_122928 ) ) ( not ( = ?auto_122927 ?auto_122929 ) ) ( not ( = ?auto_122927 ?auto_122930 ) ) ( not ( = ?auto_122928 ?auto_122929 ) ) ( not ( = ?auto_122928 ?auto_122930 ) ) ( not ( = ?auto_122929 ?auto_122930 ) ) ( not ( = ?auto_122927 ?auto_122932 ) ) ( not ( = ?auto_122928 ?auto_122932 ) ) ( not ( = ?auto_122929 ?auto_122932 ) ) ( not ( = ?auto_122930 ?auto_122932 ) ) ( not ( = ?auto_122931 ?auto_122934 ) ) ( not ( = ?auto_122931 ?auto_122933 ) ) ( not ( = ?auto_122931 ?auto_122932 ) ) ( not ( = ?auto_122931 ?auto_122930 ) ) ( not ( = ?auto_122931 ?auto_122929 ) ) ( not ( = ?auto_122934 ?auto_122933 ) ) ( not ( = ?auto_122934 ?auto_122932 ) ) ( not ( = ?auto_122934 ?auto_122930 ) ) ( not ( = ?auto_122934 ?auto_122929 ) ) ( not ( = ?auto_122933 ?auto_122932 ) ) ( not ( = ?auto_122933 ?auto_122930 ) ) ( not ( = ?auto_122933 ?auto_122929 ) ) ( not ( = ?auto_122927 ?auto_122931 ) ) ( not ( = ?auto_122927 ?auto_122934 ) ) ( not ( = ?auto_122927 ?auto_122933 ) ) ( not ( = ?auto_122928 ?auto_122931 ) ) ( not ( = ?auto_122928 ?auto_122934 ) ) ( not ( = ?auto_122928 ?auto_122933 ) ) ( ON ?auto_122927 ?auto_122935 ) ( not ( = ?auto_122927 ?auto_122935 ) ) ( not ( = ?auto_122928 ?auto_122935 ) ) ( not ( = ?auto_122929 ?auto_122935 ) ) ( not ( = ?auto_122930 ?auto_122935 ) ) ( not ( = ?auto_122932 ?auto_122935 ) ) ( not ( = ?auto_122931 ?auto_122935 ) ) ( not ( = ?auto_122934 ?auto_122935 ) ) ( not ( = ?auto_122933 ?auto_122935 ) ) ( ON ?auto_122928 ?auto_122927 ) ( ON-TABLE ?auto_122935 ) ( ON ?auto_122929 ?auto_122928 ) ( ON ?auto_122930 ?auto_122929 ) ( ON ?auto_122932 ?auto_122930 ) ( ON ?auto_122933 ?auto_122932 ) ( ON ?auto_122934 ?auto_122933 ) ( CLEAR ?auto_122934 ) ( HOLDING ?auto_122931 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_122931 )
      ( MAKE-4PILE ?auto_122927 ?auto_122928 ?auto_122929 ?auto_122930 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122936 - BLOCK
      ?auto_122937 - BLOCK
      ?auto_122938 - BLOCK
      ?auto_122939 - BLOCK
    )
    :vars
    (
      ?auto_122942 - BLOCK
      ?auto_122944 - BLOCK
      ?auto_122943 - BLOCK
      ?auto_122941 - BLOCK
      ?auto_122940 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122936 ?auto_122937 ) ) ( not ( = ?auto_122936 ?auto_122938 ) ) ( not ( = ?auto_122936 ?auto_122939 ) ) ( not ( = ?auto_122937 ?auto_122938 ) ) ( not ( = ?auto_122937 ?auto_122939 ) ) ( not ( = ?auto_122938 ?auto_122939 ) ) ( not ( = ?auto_122936 ?auto_122942 ) ) ( not ( = ?auto_122937 ?auto_122942 ) ) ( not ( = ?auto_122938 ?auto_122942 ) ) ( not ( = ?auto_122939 ?auto_122942 ) ) ( not ( = ?auto_122944 ?auto_122943 ) ) ( not ( = ?auto_122944 ?auto_122941 ) ) ( not ( = ?auto_122944 ?auto_122942 ) ) ( not ( = ?auto_122944 ?auto_122939 ) ) ( not ( = ?auto_122944 ?auto_122938 ) ) ( not ( = ?auto_122943 ?auto_122941 ) ) ( not ( = ?auto_122943 ?auto_122942 ) ) ( not ( = ?auto_122943 ?auto_122939 ) ) ( not ( = ?auto_122943 ?auto_122938 ) ) ( not ( = ?auto_122941 ?auto_122942 ) ) ( not ( = ?auto_122941 ?auto_122939 ) ) ( not ( = ?auto_122941 ?auto_122938 ) ) ( not ( = ?auto_122936 ?auto_122944 ) ) ( not ( = ?auto_122936 ?auto_122943 ) ) ( not ( = ?auto_122936 ?auto_122941 ) ) ( not ( = ?auto_122937 ?auto_122944 ) ) ( not ( = ?auto_122937 ?auto_122943 ) ) ( not ( = ?auto_122937 ?auto_122941 ) ) ( ON ?auto_122936 ?auto_122940 ) ( not ( = ?auto_122936 ?auto_122940 ) ) ( not ( = ?auto_122937 ?auto_122940 ) ) ( not ( = ?auto_122938 ?auto_122940 ) ) ( not ( = ?auto_122939 ?auto_122940 ) ) ( not ( = ?auto_122942 ?auto_122940 ) ) ( not ( = ?auto_122944 ?auto_122940 ) ) ( not ( = ?auto_122943 ?auto_122940 ) ) ( not ( = ?auto_122941 ?auto_122940 ) ) ( ON ?auto_122937 ?auto_122936 ) ( ON-TABLE ?auto_122940 ) ( ON ?auto_122938 ?auto_122937 ) ( ON ?auto_122939 ?auto_122938 ) ( ON ?auto_122942 ?auto_122939 ) ( ON ?auto_122941 ?auto_122942 ) ( ON ?auto_122943 ?auto_122941 ) ( ON ?auto_122944 ?auto_122943 ) ( CLEAR ?auto_122944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_122940 ?auto_122936 ?auto_122937 ?auto_122938 ?auto_122939 ?auto_122942 ?auto_122941 ?auto_122943 )
      ( MAKE-4PILE ?auto_122936 ?auto_122937 ?auto_122938 ?auto_122939 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122964 - BLOCK
      ?auto_122965 - BLOCK
      ?auto_122966 - BLOCK
    )
    :vars
    (
      ?auto_122967 - BLOCK
      ?auto_122969 - BLOCK
      ?auto_122968 - BLOCK
      ?auto_122971 - BLOCK
      ?auto_122970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122967 ?auto_122966 ) ( ON-TABLE ?auto_122964 ) ( ON ?auto_122965 ?auto_122964 ) ( ON ?auto_122966 ?auto_122965 ) ( not ( = ?auto_122964 ?auto_122965 ) ) ( not ( = ?auto_122964 ?auto_122966 ) ) ( not ( = ?auto_122964 ?auto_122967 ) ) ( not ( = ?auto_122965 ?auto_122966 ) ) ( not ( = ?auto_122965 ?auto_122967 ) ) ( not ( = ?auto_122966 ?auto_122967 ) ) ( not ( = ?auto_122964 ?auto_122969 ) ) ( not ( = ?auto_122964 ?auto_122968 ) ) ( not ( = ?auto_122965 ?auto_122969 ) ) ( not ( = ?auto_122965 ?auto_122968 ) ) ( not ( = ?auto_122966 ?auto_122969 ) ) ( not ( = ?auto_122966 ?auto_122968 ) ) ( not ( = ?auto_122967 ?auto_122969 ) ) ( not ( = ?auto_122967 ?auto_122968 ) ) ( not ( = ?auto_122969 ?auto_122968 ) ) ( ON ?auto_122969 ?auto_122967 ) ( CLEAR ?auto_122969 ) ( HOLDING ?auto_122968 ) ( CLEAR ?auto_122971 ) ( ON-TABLE ?auto_122970 ) ( ON ?auto_122971 ?auto_122970 ) ( not ( = ?auto_122970 ?auto_122971 ) ) ( not ( = ?auto_122970 ?auto_122968 ) ) ( not ( = ?auto_122971 ?auto_122968 ) ) ( not ( = ?auto_122964 ?auto_122971 ) ) ( not ( = ?auto_122964 ?auto_122970 ) ) ( not ( = ?auto_122965 ?auto_122971 ) ) ( not ( = ?auto_122965 ?auto_122970 ) ) ( not ( = ?auto_122966 ?auto_122971 ) ) ( not ( = ?auto_122966 ?auto_122970 ) ) ( not ( = ?auto_122967 ?auto_122971 ) ) ( not ( = ?auto_122967 ?auto_122970 ) ) ( not ( = ?auto_122969 ?auto_122971 ) ) ( not ( = ?auto_122969 ?auto_122970 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122970 ?auto_122971 ?auto_122968 )
      ( MAKE-3PILE ?auto_122964 ?auto_122965 ?auto_122966 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122972 - BLOCK
      ?auto_122973 - BLOCK
      ?auto_122974 - BLOCK
    )
    :vars
    (
      ?auto_122976 - BLOCK
      ?auto_122978 - BLOCK
      ?auto_122979 - BLOCK
      ?auto_122975 - BLOCK
      ?auto_122977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122976 ?auto_122974 ) ( ON-TABLE ?auto_122972 ) ( ON ?auto_122973 ?auto_122972 ) ( ON ?auto_122974 ?auto_122973 ) ( not ( = ?auto_122972 ?auto_122973 ) ) ( not ( = ?auto_122972 ?auto_122974 ) ) ( not ( = ?auto_122972 ?auto_122976 ) ) ( not ( = ?auto_122973 ?auto_122974 ) ) ( not ( = ?auto_122973 ?auto_122976 ) ) ( not ( = ?auto_122974 ?auto_122976 ) ) ( not ( = ?auto_122972 ?auto_122978 ) ) ( not ( = ?auto_122972 ?auto_122979 ) ) ( not ( = ?auto_122973 ?auto_122978 ) ) ( not ( = ?auto_122973 ?auto_122979 ) ) ( not ( = ?auto_122974 ?auto_122978 ) ) ( not ( = ?auto_122974 ?auto_122979 ) ) ( not ( = ?auto_122976 ?auto_122978 ) ) ( not ( = ?auto_122976 ?auto_122979 ) ) ( not ( = ?auto_122978 ?auto_122979 ) ) ( ON ?auto_122978 ?auto_122976 ) ( CLEAR ?auto_122975 ) ( ON-TABLE ?auto_122977 ) ( ON ?auto_122975 ?auto_122977 ) ( not ( = ?auto_122977 ?auto_122975 ) ) ( not ( = ?auto_122977 ?auto_122979 ) ) ( not ( = ?auto_122975 ?auto_122979 ) ) ( not ( = ?auto_122972 ?auto_122975 ) ) ( not ( = ?auto_122972 ?auto_122977 ) ) ( not ( = ?auto_122973 ?auto_122975 ) ) ( not ( = ?auto_122973 ?auto_122977 ) ) ( not ( = ?auto_122974 ?auto_122975 ) ) ( not ( = ?auto_122974 ?auto_122977 ) ) ( not ( = ?auto_122976 ?auto_122975 ) ) ( not ( = ?auto_122976 ?auto_122977 ) ) ( not ( = ?auto_122978 ?auto_122975 ) ) ( not ( = ?auto_122978 ?auto_122977 ) ) ( ON ?auto_122979 ?auto_122978 ) ( CLEAR ?auto_122979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122972 ?auto_122973 ?auto_122974 ?auto_122976 ?auto_122978 )
      ( MAKE-3PILE ?auto_122972 ?auto_122973 ?auto_122974 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122980 - BLOCK
      ?auto_122981 - BLOCK
      ?auto_122982 - BLOCK
    )
    :vars
    (
      ?auto_122985 - BLOCK
      ?auto_122986 - BLOCK
      ?auto_122983 - BLOCK
      ?auto_122984 - BLOCK
      ?auto_122987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122985 ?auto_122982 ) ( ON-TABLE ?auto_122980 ) ( ON ?auto_122981 ?auto_122980 ) ( ON ?auto_122982 ?auto_122981 ) ( not ( = ?auto_122980 ?auto_122981 ) ) ( not ( = ?auto_122980 ?auto_122982 ) ) ( not ( = ?auto_122980 ?auto_122985 ) ) ( not ( = ?auto_122981 ?auto_122982 ) ) ( not ( = ?auto_122981 ?auto_122985 ) ) ( not ( = ?auto_122982 ?auto_122985 ) ) ( not ( = ?auto_122980 ?auto_122986 ) ) ( not ( = ?auto_122980 ?auto_122983 ) ) ( not ( = ?auto_122981 ?auto_122986 ) ) ( not ( = ?auto_122981 ?auto_122983 ) ) ( not ( = ?auto_122982 ?auto_122986 ) ) ( not ( = ?auto_122982 ?auto_122983 ) ) ( not ( = ?auto_122985 ?auto_122986 ) ) ( not ( = ?auto_122985 ?auto_122983 ) ) ( not ( = ?auto_122986 ?auto_122983 ) ) ( ON ?auto_122986 ?auto_122985 ) ( ON-TABLE ?auto_122984 ) ( not ( = ?auto_122984 ?auto_122987 ) ) ( not ( = ?auto_122984 ?auto_122983 ) ) ( not ( = ?auto_122987 ?auto_122983 ) ) ( not ( = ?auto_122980 ?auto_122987 ) ) ( not ( = ?auto_122980 ?auto_122984 ) ) ( not ( = ?auto_122981 ?auto_122987 ) ) ( not ( = ?auto_122981 ?auto_122984 ) ) ( not ( = ?auto_122982 ?auto_122987 ) ) ( not ( = ?auto_122982 ?auto_122984 ) ) ( not ( = ?auto_122985 ?auto_122987 ) ) ( not ( = ?auto_122985 ?auto_122984 ) ) ( not ( = ?auto_122986 ?auto_122987 ) ) ( not ( = ?auto_122986 ?auto_122984 ) ) ( ON ?auto_122983 ?auto_122986 ) ( CLEAR ?auto_122983 ) ( HOLDING ?auto_122987 ) ( CLEAR ?auto_122984 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122984 ?auto_122987 )
      ( MAKE-3PILE ?auto_122980 ?auto_122981 ?auto_122982 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122988 - BLOCK
      ?auto_122989 - BLOCK
      ?auto_122990 - BLOCK
    )
    :vars
    (
      ?auto_122991 - BLOCK
      ?auto_122993 - BLOCK
      ?auto_122994 - BLOCK
      ?auto_122995 - BLOCK
      ?auto_122992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122991 ?auto_122990 ) ( ON-TABLE ?auto_122988 ) ( ON ?auto_122989 ?auto_122988 ) ( ON ?auto_122990 ?auto_122989 ) ( not ( = ?auto_122988 ?auto_122989 ) ) ( not ( = ?auto_122988 ?auto_122990 ) ) ( not ( = ?auto_122988 ?auto_122991 ) ) ( not ( = ?auto_122989 ?auto_122990 ) ) ( not ( = ?auto_122989 ?auto_122991 ) ) ( not ( = ?auto_122990 ?auto_122991 ) ) ( not ( = ?auto_122988 ?auto_122993 ) ) ( not ( = ?auto_122988 ?auto_122994 ) ) ( not ( = ?auto_122989 ?auto_122993 ) ) ( not ( = ?auto_122989 ?auto_122994 ) ) ( not ( = ?auto_122990 ?auto_122993 ) ) ( not ( = ?auto_122990 ?auto_122994 ) ) ( not ( = ?auto_122991 ?auto_122993 ) ) ( not ( = ?auto_122991 ?auto_122994 ) ) ( not ( = ?auto_122993 ?auto_122994 ) ) ( ON ?auto_122993 ?auto_122991 ) ( ON-TABLE ?auto_122995 ) ( not ( = ?auto_122995 ?auto_122992 ) ) ( not ( = ?auto_122995 ?auto_122994 ) ) ( not ( = ?auto_122992 ?auto_122994 ) ) ( not ( = ?auto_122988 ?auto_122992 ) ) ( not ( = ?auto_122988 ?auto_122995 ) ) ( not ( = ?auto_122989 ?auto_122992 ) ) ( not ( = ?auto_122989 ?auto_122995 ) ) ( not ( = ?auto_122990 ?auto_122992 ) ) ( not ( = ?auto_122990 ?auto_122995 ) ) ( not ( = ?auto_122991 ?auto_122992 ) ) ( not ( = ?auto_122991 ?auto_122995 ) ) ( not ( = ?auto_122993 ?auto_122992 ) ) ( not ( = ?auto_122993 ?auto_122995 ) ) ( ON ?auto_122994 ?auto_122993 ) ( CLEAR ?auto_122995 ) ( ON ?auto_122992 ?auto_122994 ) ( CLEAR ?auto_122992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122988 ?auto_122989 ?auto_122990 ?auto_122991 ?auto_122993 ?auto_122994 )
      ( MAKE-3PILE ?auto_122988 ?auto_122989 ?auto_122990 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122996 - BLOCK
      ?auto_122997 - BLOCK
      ?auto_122998 - BLOCK
    )
    :vars
    (
      ?auto_123000 - BLOCK
      ?auto_122999 - BLOCK
      ?auto_123003 - BLOCK
      ?auto_123001 - BLOCK
      ?auto_123002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123000 ?auto_122998 ) ( ON-TABLE ?auto_122996 ) ( ON ?auto_122997 ?auto_122996 ) ( ON ?auto_122998 ?auto_122997 ) ( not ( = ?auto_122996 ?auto_122997 ) ) ( not ( = ?auto_122996 ?auto_122998 ) ) ( not ( = ?auto_122996 ?auto_123000 ) ) ( not ( = ?auto_122997 ?auto_122998 ) ) ( not ( = ?auto_122997 ?auto_123000 ) ) ( not ( = ?auto_122998 ?auto_123000 ) ) ( not ( = ?auto_122996 ?auto_122999 ) ) ( not ( = ?auto_122996 ?auto_123003 ) ) ( not ( = ?auto_122997 ?auto_122999 ) ) ( not ( = ?auto_122997 ?auto_123003 ) ) ( not ( = ?auto_122998 ?auto_122999 ) ) ( not ( = ?auto_122998 ?auto_123003 ) ) ( not ( = ?auto_123000 ?auto_122999 ) ) ( not ( = ?auto_123000 ?auto_123003 ) ) ( not ( = ?auto_122999 ?auto_123003 ) ) ( ON ?auto_122999 ?auto_123000 ) ( not ( = ?auto_123001 ?auto_123002 ) ) ( not ( = ?auto_123001 ?auto_123003 ) ) ( not ( = ?auto_123002 ?auto_123003 ) ) ( not ( = ?auto_122996 ?auto_123002 ) ) ( not ( = ?auto_122996 ?auto_123001 ) ) ( not ( = ?auto_122997 ?auto_123002 ) ) ( not ( = ?auto_122997 ?auto_123001 ) ) ( not ( = ?auto_122998 ?auto_123002 ) ) ( not ( = ?auto_122998 ?auto_123001 ) ) ( not ( = ?auto_123000 ?auto_123002 ) ) ( not ( = ?auto_123000 ?auto_123001 ) ) ( not ( = ?auto_122999 ?auto_123002 ) ) ( not ( = ?auto_122999 ?auto_123001 ) ) ( ON ?auto_123003 ?auto_122999 ) ( ON ?auto_123002 ?auto_123003 ) ( CLEAR ?auto_123002 ) ( HOLDING ?auto_123001 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_123001 )
      ( MAKE-3PILE ?auto_122996 ?auto_122997 ?auto_122998 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_123015 - BLOCK
      ?auto_123016 - BLOCK
      ?auto_123017 - BLOCK
    )
    :vars
    (
      ?auto_123018 - BLOCK
      ?auto_123020 - BLOCK
      ?auto_123021 - BLOCK
      ?auto_123019 - BLOCK
      ?auto_123022 - BLOCK
      ?auto_123023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123018 ?auto_123017 ) ( ON-TABLE ?auto_123015 ) ( ON ?auto_123016 ?auto_123015 ) ( ON ?auto_123017 ?auto_123016 ) ( not ( = ?auto_123015 ?auto_123016 ) ) ( not ( = ?auto_123015 ?auto_123017 ) ) ( not ( = ?auto_123015 ?auto_123018 ) ) ( not ( = ?auto_123016 ?auto_123017 ) ) ( not ( = ?auto_123016 ?auto_123018 ) ) ( not ( = ?auto_123017 ?auto_123018 ) ) ( not ( = ?auto_123015 ?auto_123020 ) ) ( not ( = ?auto_123015 ?auto_123021 ) ) ( not ( = ?auto_123016 ?auto_123020 ) ) ( not ( = ?auto_123016 ?auto_123021 ) ) ( not ( = ?auto_123017 ?auto_123020 ) ) ( not ( = ?auto_123017 ?auto_123021 ) ) ( not ( = ?auto_123018 ?auto_123020 ) ) ( not ( = ?auto_123018 ?auto_123021 ) ) ( not ( = ?auto_123020 ?auto_123021 ) ) ( ON ?auto_123020 ?auto_123018 ) ( not ( = ?auto_123019 ?auto_123022 ) ) ( not ( = ?auto_123019 ?auto_123021 ) ) ( not ( = ?auto_123022 ?auto_123021 ) ) ( not ( = ?auto_123015 ?auto_123022 ) ) ( not ( = ?auto_123015 ?auto_123019 ) ) ( not ( = ?auto_123016 ?auto_123022 ) ) ( not ( = ?auto_123016 ?auto_123019 ) ) ( not ( = ?auto_123017 ?auto_123022 ) ) ( not ( = ?auto_123017 ?auto_123019 ) ) ( not ( = ?auto_123018 ?auto_123022 ) ) ( not ( = ?auto_123018 ?auto_123019 ) ) ( not ( = ?auto_123020 ?auto_123022 ) ) ( not ( = ?auto_123020 ?auto_123019 ) ) ( ON ?auto_123021 ?auto_123020 ) ( ON ?auto_123022 ?auto_123021 ) ( CLEAR ?auto_123022 ) ( ON ?auto_123019 ?auto_123023 ) ( CLEAR ?auto_123019 ) ( HAND-EMPTY ) ( not ( = ?auto_123015 ?auto_123023 ) ) ( not ( = ?auto_123016 ?auto_123023 ) ) ( not ( = ?auto_123017 ?auto_123023 ) ) ( not ( = ?auto_123018 ?auto_123023 ) ) ( not ( = ?auto_123020 ?auto_123023 ) ) ( not ( = ?auto_123021 ?auto_123023 ) ) ( not ( = ?auto_123019 ?auto_123023 ) ) ( not ( = ?auto_123022 ?auto_123023 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_123019 ?auto_123023 )
      ( MAKE-3PILE ?auto_123015 ?auto_123016 ?auto_123017 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_123024 - BLOCK
      ?auto_123025 - BLOCK
      ?auto_123026 - BLOCK
    )
    :vars
    (
      ?auto_123030 - BLOCK
      ?auto_123028 - BLOCK
      ?auto_123031 - BLOCK
      ?auto_123027 - BLOCK
      ?auto_123029 - BLOCK
      ?auto_123032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123030 ?auto_123026 ) ( ON-TABLE ?auto_123024 ) ( ON ?auto_123025 ?auto_123024 ) ( ON ?auto_123026 ?auto_123025 ) ( not ( = ?auto_123024 ?auto_123025 ) ) ( not ( = ?auto_123024 ?auto_123026 ) ) ( not ( = ?auto_123024 ?auto_123030 ) ) ( not ( = ?auto_123025 ?auto_123026 ) ) ( not ( = ?auto_123025 ?auto_123030 ) ) ( not ( = ?auto_123026 ?auto_123030 ) ) ( not ( = ?auto_123024 ?auto_123028 ) ) ( not ( = ?auto_123024 ?auto_123031 ) ) ( not ( = ?auto_123025 ?auto_123028 ) ) ( not ( = ?auto_123025 ?auto_123031 ) ) ( not ( = ?auto_123026 ?auto_123028 ) ) ( not ( = ?auto_123026 ?auto_123031 ) ) ( not ( = ?auto_123030 ?auto_123028 ) ) ( not ( = ?auto_123030 ?auto_123031 ) ) ( not ( = ?auto_123028 ?auto_123031 ) ) ( ON ?auto_123028 ?auto_123030 ) ( not ( = ?auto_123027 ?auto_123029 ) ) ( not ( = ?auto_123027 ?auto_123031 ) ) ( not ( = ?auto_123029 ?auto_123031 ) ) ( not ( = ?auto_123024 ?auto_123029 ) ) ( not ( = ?auto_123024 ?auto_123027 ) ) ( not ( = ?auto_123025 ?auto_123029 ) ) ( not ( = ?auto_123025 ?auto_123027 ) ) ( not ( = ?auto_123026 ?auto_123029 ) ) ( not ( = ?auto_123026 ?auto_123027 ) ) ( not ( = ?auto_123030 ?auto_123029 ) ) ( not ( = ?auto_123030 ?auto_123027 ) ) ( not ( = ?auto_123028 ?auto_123029 ) ) ( not ( = ?auto_123028 ?auto_123027 ) ) ( ON ?auto_123031 ?auto_123028 ) ( ON ?auto_123027 ?auto_123032 ) ( CLEAR ?auto_123027 ) ( not ( = ?auto_123024 ?auto_123032 ) ) ( not ( = ?auto_123025 ?auto_123032 ) ) ( not ( = ?auto_123026 ?auto_123032 ) ) ( not ( = ?auto_123030 ?auto_123032 ) ) ( not ( = ?auto_123028 ?auto_123032 ) ) ( not ( = ?auto_123031 ?auto_123032 ) ) ( not ( = ?auto_123027 ?auto_123032 ) ) ( not ( = ?auto_123029 ?auto_123032 ) ) ( HOLDING ?auto_123029 ) ( CLEAR ?auto_123031 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123024 ?auto_123025 ?auto_123026 ?auto_123030 ?auto_123028 ?auto_123031 ?auto_123029 )
      ( MAKE-3PILE ?auto_123024 ?auto_123025 ?auto_123026 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_123033 - BLOCK
      ?auto_123034 - BLOCK
      ?auto_123035 - BLOCK
    )
    :vars
    (
      ?auto_123041 - BLOCK
      ?auto_123039 - BLOCK
      ?auto_123038 - BLOCK
      ?auto_123036 - BLOCK
      ?auto_123037 - BLOCK
      ?auto_123040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123041 ?auto_123035 ) ( ON-TABLE ?auto_123033 ) ( ON ?auto_123034 ?auto_123033 ) ( ON ?auto_123035 ?auto_123034 ) ( not ( = ?auto_123033 ?auto_123034 ) ) ( not ( = ?auto_123033 ?auto_123035 ) ) ( not ( = ?auto_123033 ?auto_123041 ) ) ( not ( = ?auto_123034 ?auto_123035 ) ) ( not ( = ?auto_123034 ?auto_123041 ) ) ( not ( = ?auto_123035 ?auto_123041 ) ) ( not ( = ?auto_123033 ?auto_123039 ) ) ( not ( = ?auto_123033 ?auto_123038 ) ) ( not ( = ?auto_123034 ?auto_123039 ) ) ( not ( = ?auto_123034 ?auto_123038 ) ) ( not ( = ?auto_123035 ?auto_123039 ) ) ( not ( = ?auto_123035 ?auto_123038 ) ) ( not ( = ?auto_123041 ?auto_123039 ) ) ( not ( = ?auto_123041 ?auto_123038 ) ) ( not ( = ?auto_123039 ?auto_123038 ) ) ( ON ?auto_123039 ?auto_123041 ) ( not ( = ?auto_123036 ?auto_123037 ) ) ( not ( = ?auto_123036 ?auto_123038 ) ) ( not ( = ?auto_123037 ?auto_123038 ) ) ( not ( = ?auto_123033 ?auto_123037 ) ) ( not ( = ?auto_123033 ?auto_123036 ) ) ( not ( = ?auto_123034 ?auto_123037 ) ) ( not ( = ?auto_123034 ?auto_123036 ) ) ( not ( = ?auto_123035 ?auto_123037 ) ) ( not ( = ?auto_123035 ?auto_123036 ) ) ( not ( = ?auto_123041 ?auto_123037 ) ) ( not ( = ?auto_123041 ?auto_123036 ) ) ( not ( = ?auto_123039 ?auto_123037 ) ) ( not ( = ?auto_123039 ?auto_123036 ) ) ( ON ?auto_123038 ?auto_123039 ) ( ON ?auto_123036 ?auto_123040 ) ( not ( = ?auto_123033 ?auto_123040 ) ) ( not ( = ?auto_123034 ?auto_123040 ) ) ( not ( = ?auto_123035 ?auto_123040 ) ) ( not ( = ?auto_123041 ?auto_123040 ) ) ( not ( = ?auto_123039 ?auto_123040 ) ) ( not ( = ?auto_123038 ?auto_123040 ) ) ( not ( = ?auto_123036 ?auto_123040 ) ) ( not ( = ?auto_123037 ?auto_123040 ) ) ( CLEAR ?auto_123038 ) ( ON ?auto_123037 ?auto_123036 ) ( CLEAR ?auto_123037 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_123040 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123040 ?auto_123036 )
      ( MAKE-3PILE ?auto_123033 ?auto_123034 ?auto_123035 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_123042 - BLOCK
      ?auto_123043 - BLOCK
      ?auto_123044 - BLOCK
    )
    :vars
    (
      ?auto_123045 - BLOCK
      ?auto_123049 - BLOCK
      ?auto_123048 - BLOCK
      ?auto_123047 - BLOCK
      ?auto_123046 - BLOCK
      ?auto_123050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123045 ?auto_123044 ) ( ON-TABLE ?auto_123042 ) ( ON ?auto_123043 ?auto_123042 ) ( ON ?auto_123044 ?auto_123043 ) ( not ( = ?auto_123042 ?auto_123043 ) ) ( not ( = ?auto_123042 ?auto_123044 ) ) ( not ( = ?auto_123042 ?auto_123045 ) ) ( not ( = ?auto_123043 ?auto_123044 ) ) ( not ( = ?auto_123043 ?auto_123045 ) ) ( not ( = ?auto_123044 ?auto_123045 ) ) ( not ( = ?auto_123042 ?auto_123049 ) ) ( not ( = ?auto_123042 ?auto_123048 ) ) ( not ( = ?auto_123043 ?auto_123049 ) ) ( not ( = ?auto_123043 ?auto_123048 ) ) ( not ( = ?auto_123044 ?auto_123049 ) ) ( not ( = ?auto_123044 ?auto_123048 ) ) ( not ( = ?auto_123045 ?auto_123049 ) ) ( not ( = ?auto_123045 ?auto_123048 ) ) ( not ( = ?auto_123049 ?auto_123048 ) ) ( ON ?auto_123049 ?auto_123045 ) ( not ( = ?auto_123047 ?auto_123046 ) ) ( not ( = ?auto_123047 ?auto_123048 ) ) ( not ( = ?auto_123046 ?auto_123048 ) ) ( not ( = ?auto_123042 ?auto_123046 ) ) ( not ( = ?auto_123042 ?auto_123047 ) ) ( not ( = ?auto_123043 ?auto_123046 ) ) ( not ( = ?auto_123043 ?auto_123047 ) ) ( not ( = ?auto_123044 ?auto_123046 ) ) ( not ( = ?auto_123044 ?auto_123047 ) ) ( not ( = ?auto_123045 ?auto_123046 ) ) ( not ( = ?auto_123045 ?auto_123047 ) ) ( not ( = ?auto_123049 ?auto_123046 ) ) ( not ( = ?auto_123049 ?auto_123047 ) ) ( ON ?auto_123047 ?auto_123050 ) ( not ( = ?auto_123042 ?auto_123050 ) ) ( not ( = ?auto_123043 ?auto_123050 ) ) ( not ( = ?auto_123044 ?auto_123050 ) ) ( not ( = ?auto_123045 ?auto_123050 ) ) ( not ( = ?auto_123049 ?auto_123050 ) ) ( not ( = ?auto_123048 ?auto_123050 ) ) ( not ( = ?auto_123047 ?auto_123050 ) ) ( not ( = ?auto_123046 ?auto_123050 ) ) ( ON ?auto_123046 ?auto_123047 ) ( CLEAR ?auto_123046 ) ( ON-TABLE ?auto_123050 ) ( HOLDING ?auto_123048 ) ( CLEAR ?auto_123049 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123042 ?auto_123043 ?auto_123044 ?auto_123045 ?auto_123049 ?auto_123048 )
      ( MAKE-3PILE ?auto_123042 ?auto_123043 ?auto_123044 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123109 - BLOCK
      ?auto_123110 - BLOCK
      ?auto_123111 - BLOCK
      ?auto_123112 - BLOCK
      ?auto_123113 - BLOCK
    )
    :vars
    (
      ?auto_123114 - BLOCK
      ?auto_123116 - BLOCK
      ?auto_123115 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123109 ) ( ON ?auto_123110 ?auto_123109 ) ( ON ?auto_123111 ?auto_123110 ) ( not ( = ?auto_123109 ?auto_123110 ) ) ( not ( = ?auto_123109 ?auto_123111 ) ) ( not ( = ?auto_123109 ?auto_123112 ) ) ( not ( = ?auto_123109 ?auto_123113 ) ) ( not ( = ?auto_123110 ?auto_123111 ) ) ( not ( = ?auto_123110 ?auto_123112 ) ) ( not ( = ?auto_123110 ?auto_123113 ) ) ( not ( = ?auto_123111 ?auto_123112 ) ) ( not ( = ?auto_123111 ?auto_123113 ) ) ( not ( = ?auto_123112 ?auto_123113 ) ) ( ON ?auto_123113 ?auto_123114 ) ( not ( = ?auto_123109 ?auto_123114 ) ) ( not ( = ?auto_123110 ?auto_123114 ) ) ( not ( = ?auto_123111 ?auto_123114 ) ) ( not ( = ?auto_123112 ?auto_123114 ) ) ( not ( = ?auto_123113 ?auto_123114 ) ) ( CLEAR ?auto_123111 ) ( ON ?auto_123112 ?auto_123113 ) ( CLEAR ?auto_123112 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_123116 ) ( ON ?auto_123115 ?auto_123116 ) ( ON ?auto_123114 ?auto_123115 ) ( not ( = ?auto_123116 ?auto_123115 ) ) ( not ( = ?auto_123116 ?auto_123114 ) ) ( not ( = ?auto_123116 ?auto_123113 ) ) ( not ( = ?auto_123116 ?auto_123112 ) ) ( not ( = ?auto_123115 ?auto_123114 ) ) ( not ( = ?auto_123115 ?auto_123113 ) ) ( not ( = ?auto_123115 ?auto_123112 ) ) ( not ( = ?auto_123109 ?auto_123116 ) ) ( not ( = ?auto_123109 ?auto_123115 ) ) ( not ( = ?auto_123110 ?auto_123116 ) ) ( not ( = ?auto_123110 ?auto_123115 ) ) ( not ( = ?auto_123111 ?auto_123116 ) ) ( not ( = ?auto_123111 ?auto_123115 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123116 ?auto_123115 ?auto_123114 ?auto_123113 )
      ( MAKE-5PILE ?auto_123109 ?auto_123110 ?auto_123111 ?auto_123112 ?auto_123113 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123117 - BLOCK
      ?auto_123118 - BLOCK
      ?auto_123119 - BLOCK
      ?auto_123120 - BLOCK
      ?auto_123121 - BLOCK
    )
    :vars
    (
      ?auto_123122 - BLOCK
      ?auto_123124 - BLOCK
      ?auto_123123 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123117 ) ( ON ?auto_123118 ?auto_123117 ) ( not ( = ?auto_123117 ?auto_123118 ) ) ( not ( = ?auto_123117 ?auto_123119 ) ) ( not ( = ?auto_123117 ?auto_123120 ) ) ( not ( = ?auto_123117 ?auto_123121 ) ) ( not ( = ?auto_123118 ?auto_123119 ) ) ( not ( = ?auto_123118 ?auto_123120 ) ) ( not ( = ?auto_123118 ?auto_123121 ) ) ( not ( = ?auto_123119 ?auto_123120 ) ) ( not ( = ?auto_123119 ?auto_123121 ) ) ( not ( = ?auto_123120 ?auto_123121 ) ) ( ON ?auto_123121 ?auto_123122 ) ( not ( = ?auto_123117 ?auto_123122 ) ) ( not ( = ?auto_123118 ?auto_123122 ) ) ( not ( = ?auto_123119 ?auto_123122 ) ) ( not ( = ?auto_123120 ?auto_123122 ) ) ( not ( = ?auto_123121 ?auto_123122 ) ) ( ON ?auto_123120 ?auto_123121 ) ( CLEAR ?auto_123120 ) ( ON-TABLE ?auto_123124 ) ( ON ?auto_123123 ?auto_123124 ) ( ON ?auto_123122 ?auto_123123 ) ( not ( = ?auto_123124 ?auto_123123 ) ) ( not ( = ?auto_123124 ?auto_123122 ) ) ( not ( = ?auto_123124 ?auto_123121 ) ) ( not ( = ?auto_123124 ?auto_123120 ) ) ( not ( = ?auto_123123 ?auto_123122 ) ) ( not ( = ?auto_123123 ?auto_123121 ) ) ( not ( = ?auto_123123 ?auto_123120 ) ) ( not ( = ?auto_123117 ?auto_123124 ) ) ( not ( = ?auto_123117 ?auto_123123 ) ) ( not ( = ?auto_123118 ?auto_123124 ) ) ( not ( = ?auto_123118 ?auto_123123 ) ) ( not ( = ?auto_123119 ?auto_123124 ) ) ( not ( = ?auto_123119 ?auto_123123 ) ) ( HOLDING ?auto_123119 ) ( CLEAR ?auto_123118 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123117 ?auto_123118 ?auto_123119 )
      ( MAKE-5PILE ?auto_123117 ?auto_123118 ?auto_123119 ?auto_123120 ?auto_123121 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123125 - BLOCK
      ?auto_123126 - BLOCK
      ?auto_123127 - BLOCK
      ?auto_123128 - BLOCK
      ?auto_123129 - BLOCK
    )
    :vars
    (
      ?auto_123131 - BLOCK
      ?auto_123130 - BLOCK
      ?auto_123132 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123125 ) ( ON ?auto_123126 ?auto_123125 ) ( not ( = ?auto_123125 ?auto_123126 ) ) ( not ( = ?auto_123125 ?auto_123127 ) ) ( not ( = ?auto_123125 ?auto_123128 ) ) ( not ( = ?auto_123125 ?auto_123129 ) ) ( not ( = ?auto_123126 ?auto_123127 ) ) ( not ( = ?auto_123126 ?auto_123128 ) ) ( not ( = ?auto_123126 ?auto_123129 ) ) ( not ( = ?auto_123127 ?auto_123128 ) ) ( not ( = ?auto_123127 ?auto_123129 ) ) ( not ( = ?auto_123128 ?auto_123129 ) ) ( ON ?auto_123129 ?auto_123131 ) ( not ( = ?auto_123125 ?auto_123131 ) ) ( not ( = ?auto_123126 ?auto_123131 ) ) ( not ( = ?auto_123127 ?auto_123131 ) ) ( not ( = ?auto_123128 ?auto_123131 ) ) ( not ( = ?auto_123129 ?auto_123131 ) ) ( ON ?auto_123128 ?auto_123129 ) ( ON-TABLE ?auto_123130 ) ( ON ?auto_123132 ?auto_123130 ) ( ON ?auto_123131 ?auto_123132 ) ( not ( = ?auto_123130 ?auto_123132 ) ) ( not ( = ?auto_123130 ?auto_123131 ) ) ( not ( = ?auto_123130 ?auto_123129 ) ) ( not ( = ?auto_123130 ?auto_123128 ) ) ( not ( = ?auto_123132 ?auto_123131 ) ) ( not ( = ?auto_123132 ?auto_123129 ) ) ( not ( = ?auto_123132 ?auto_123128 ) ) ( not ( = ?auto_123125 ?auto_123130 ) ) ( not ( = ?auto_123125 ?auto_123132 ) ) ( not ( = ?auto_123126 ?auto_123130 ) ) ( not ( = ?auto_123126 ?auto_123132 ) ) ( not ( = ?auto_123127 ?auto_123130 ) ) ( not ( = ?auto_123127 ?auto_123132 ) ) ( CLEAR ?auto_123126 ) ( ON ?auto_123127 ?auto_123128 ) ( CLEAR ?auto_123127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123130 ?auto_123132 ?auto_123131 ?auto_123129 ?auto_123128 )
      ( MAKE-5PILE ?auto_123125 ?auto_123126 ?auto_123127 ?auto_123128 ?auto_123129 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123133 - BLOCK
      ?auto_123134 - BLOCK
      ?auto_123135 - BLOCK
      ?auto_123136 - BLOCK
      ?auto_123137 - BLOCK
    )
    :vars
    (
      ?auto_123139 - BLOCK
      ?auto_123138 - BLOCK
      ?auto_123140 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123133 ) ( not ( = ?auto_123133 ?auto_123134 ) ) ( not ( = ?auto_123133 ?auto_123135 ) ) ( not ( = ?auto_123133 ?auto_123136 ) ) ( not ( = ?auto_123133 ?auto_123137 ) ) ( not ( = ?auto_123134 ?auto_123135 ) ) ( not ( = ?auto_123134 ?auto_123136 ) ) ( not ( = ?auto_123134 ?auto_123137 ) ) ( not ( = ?auto_123135 ?auto_123136 ) ) ( not ( = ?auto_123135 ?auto_123137 ) ) ( not ( = ?auto_123136 ?auto_123137 ) ) ( ON ?auto_123137 ?auto_123139 ) ( not ( = ?auto_123133 ?auto_123139 ) ) ( not ( = ?auto_123134 ?auto_123139 ) ) ( not ( = ?auto_123135 ?auto_123139 ) ) ( not ( = ?auto_123136 ?auto_123139 ) ) ( not ( = ?auto_123137 ?auto_123139 ) ) ( ON ?auto_123136 ?auto_123137 ) ( ON-TABLE ?auto_123138 ) ( ON ?auto_123140 ?auto_123138 ) ( ON ?auto_123139 ?auto_123140 ) ( not ( = ?auto_123138 ?auto_123140 ) ) ( not ( = ?auto_123138 ?auto_123139 ) ) ( not ( = ?auto_123138 ?auto_123137 ) ) ( not ( = ?auto_123138 ?auto_123136 ) ) ( not ( = ?auto_123140 ?auto_123139 ) ) ( not ( = ?auto_123140 ?auto_123137 ) ) ( not ( = ?auto_123140 ?auto_123136 ) ) ( not ( = ?auto_123133 ?auto_123138 ) ) ( not ( = ?auto_123133 ?auto_123140 ) ) ( not ( = ?auto_123134 ?auto_123138 ) ) ( not ( = ?auto_123134 ?auto_123140 ) ) ( not ( = ?auto_123135 ?auto_123138 ) ) ( not ( = ?auto_123135 ?auto_123140 ) ) ( ON ?auto_123135 ?auto_123136 ) ( CLEAR ?auto_123135 ) ( HOLDING ?auto_123134 ) ( CLEAR ?auto_123133 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123133 ?auto_123134 )
      ( MAKE-5PILE ?auto_123133 ?auto_123134 ?auto_123135 ?auto_123136 ?auto_123137 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123141 - BLOCK
      ?auto_123142 - BLOCK
      ?auto_123143 - BLOCK
      ?auto_123144 - BLOCK
      ?auto_123145 - BLOCK
    )
    :vars
    (
      ?auto_123147 - BLOCK
      ?auto_123148 - BLOCK
      ?auto_123146 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123141 ) ( not ( = ?auto_123141 ?auto_123142 ) ) ( not ( = ?auto_123141 ?auto_123143 ) ) ( not ( = ?auto_123141 ?auto_123144 ) ) ( not ( = ?auto_123141 ?auto_123145 ) ) ( not ( = ?auto_123142 ?auto_123143 ) ) ( not ( = ?auto_123142 ?auto_123144 ) ) ( not ( = ?auto_123142 ?auto_123145 ) ) ( not ( = ?auto_123143 ?auto_123144 ) ) ( not ( = ?auto_123143 ?auto_123145 ) ) ( not ( = ?auto_123144 ?auto_123145 ) ) ( ON ?auto_123145 ?auto_123147 ) ( not ( = ?auto_123141 ?auto_123147 ) ) ( not ( = ?auto_123142 ?auto_123147 ) ) ( not ( = ?auto_123143 ?auto_123147 ) ) ( not ( = ?auto_123144 ?auto_123147 ) ) ( not ( = ?auto_123145 ?auto_123147 ) ) ( ON ?auto_123144 ?auto_123145 ) ( ON-TABLE ?auto_123148 ) ( ON ?auto_123146 ?auto_123148 ) ( ON ?auto_123147 ?auto_123146 ) ( not ( = ?auto_123148 ?auto_123146 ) ) ( not ( = ?auto_123148 ?auto_123147 ) ) ( not ( = ?auto_123148 ?auto_123145 ) ) ( not ( = ?auto_123148 ?auto_123144 ) ) ( not ( = ?auto_123146 ?auto_123147 ) ) ( not ( = ?auto_123146 ?auto_123145 ) ) ( not ( = ?auto_123146 ?auto_123144 ) ) ( not ( = ?auto_123141 ?auto_123148 ) ) ( not ( = ?auto_123141 ?auto_123146 ) ) ( not ( = ?auto_123142 ?auto_123148 ) ) ( not ( = ?auto_123142 ?auto_123146 ) ) ( not ( = ?auto_123143 ?auto_123148 ) ) ( not ( = ?auto_123143 ?auto_123146 ) ) ( ON ?auto_123143 ?auto_123144 ) ( CLEAR ?auto_123141 ) ( ON ?auto_123142 ?auto_123143 ) ( CLEAR ?auto_123142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123148 ?auto_123146 ?auto_123147 ?auto_123145 ?auto_123144 ?auto_123143 )
      ( MAKE-5PILE ?auto_123141 ?auto_123142 ?auto_123143 ?auto_123144 ?auto_123145 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123149 - BLOCK
      ?auto_123150 - BLOCK
      ?auto_123151 - BLOCK
      ?auto_123152 - BLOCK
      ?auto_123153 - BLOCK
    )
    :vars
    (
      ?auto_123155 - BLOCK
      ?auto_123156 - BLOCK
      ?auto_123154 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123149 ?auto_123150 ) ) ( not ( = ?auto_123149 ?auto_123151 ) ) ( not ( = ?auto_123149 ?auto_123152 ) ) ( not ( = ?auto_123149 ?auto_123153 ) ) ( not ( = ?auto_123150 ?auto_123151 ) ) ( not ( = ?auto_123150 ?auto_123152 ) ) ( not ( = ?auto_123150 ?auto_123153 ) ) ( not ( = ?auto_123151 ?auto_123152 ) ) ( not ( = ?auto_123151 ?auto_123153 ) ) ( not ( = ?auto_123152 ?auto_123153 ) ) ( ON ?auto_123153 ?auto_123155 ) ( not ( = ?auto_123149 ?auto_123155 ) ) ( not ( = ?auto_123150 ?auto_123155 ) ) ( not ( = ?auto_123151 ?auto_123155 ) ) ( not ( = ?auto_123152 ?auto_123155 ) ) ( not ( = ?auto_123153 ?auto_123155 ) ) ( ON ?auto_123152 ?auto_123153 ) ( ON-TABLE ?auto_123156 ) ( ON ?auto_123154 ?auto_123156 ) ( ON ?auto_123155 ?auto_123154 ) ( not ( = ?auto_123156 ?auto_123154 ) ) ( not ( = ?auto_123156 ?auto_123155 ) ) ( not ( = ?auto_123156 ?auto_123153 ) ) ( not ( = ?auto_123156 ?auto_123152 ) ) ( not ( = ?auto_123154 ?auto_123155 ) ) ( not ( = ?auto_123154 ?auto_123153 ) ) ( not ( = ?auto_123154 ?auto_123152 ) ) ( not ( = ?auto_123149 ?auto_123156 ) ) ( not ( = ?auto_123149 ?auto_123154 ) ) ( not ( = ?auto_123150 ?auto_123156 ) ) ( not ( = ?auto_123150 ?auto_123154 ) ) ( not ( = ?auto_123151 ?auto_123156 ) ) ( not ( = ?auto_123151 ?auto_123154 ) ) ( ON ?auto_123151 ?auto_123152 ) ( ON ?auto_123150 ?auto_123151 ) ( CLEAR ?auto_123150 ) ( HOLDING ?auto_123149 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_123149 )
      ( MAKE-5PILE ?auto_123149 ?auto_123150 ?auto_123151 ?auto_123152 ?auto_123153 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123157 - BLOCK
      ?auto_123158 - BLOCK
      ?auto_123159 - BLOCK
      ?auto_123160 - BLOCK
      ?auto_123161 - BLOCK
    )
    :vars
    (
      ?auto_123163 - BLOCK
      ?auto_123164 - BLOCK
      ?auto_123162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123157 ?auto_123158 ) ) ( not ( = ?auto_123157 ?auto_123159 ) ) ( not ( = ?auto_123157 ?auto_123160 ) ) ( not ( = ?auto_123157 ?auto_123161 ) ) ( not ( = ?auto_123158 ?auto_123159 ) ) ( not ( = ?auto_123158 ?auto_123160 ) ) ( not ( = ?auto_123158 ?auto_123161 ) ) ( not ( = ?auto_123159 ?auto_123160 ) ) ( not ( = ?auto_123159 ?auto_123161 ) ) ( not ( = ?auto_123160 ?auto_123161 ) ) ( ON ?auto_123161 ?auto_123163 ) ( not ( = ?auto_123157 ?auto_123163 ) ) ( not ( = ?auto_123158 ?auto_123163 ) ) ( not ( = ?auto_123159 ?auto_123163 ) ) ( not ( = ?auto_123160 ?auto_123163 ) ) ( not ( = ?auto_123161 ?auto_123163 ) ) ( ON ?auto_123160 ?auto_123161 ) ( ON-TABLE ?auto_123164 ) ( ON ?auto_123162 ?auto_123164 ) ( ON ?auto_123163 ?auto_123162 ) ( not ( = ?auto_123164 ?auto_123162 ) ) ( not ( = ?auto_123164 ?auto_123163 ) ) ( not ( = ?auto_123164 ?auto_123161 ) ) ( not ( = ?auto_123164 ?auto_123160 ) ) ( not ( = ?auto_123162 ?auto_123163 ) ) ( not ( = ?auto_123162 ?auto_123161 ) ) ( not ( = ?auto_123162 ?auto_123160 ) ) ( not ( = ?auto_123157 ?auto_123164 ) ) ( not ( = ?auto_123157 ?auto_123162 ) ) ( not ( = ?auto_123158 ?auto_123164 ) ) ( not ( = ?auto_123158 ?auto_123162 ) ) ( not ( = ?auto_123159 ?auto_123164 ) ) ( not ( = ?auto_123159 ?auto_123162 ) ) ( ON ?auto_123159 ?auto_123160 ) ( ON ?auto_123158 ?auto_123159 ) ( ON ?auto_123157 ?auto_123158 ) ( CLEAR ?auto_123157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123164 ?auto_123162 ?auto_123163 ?auto_123161 ?auto_123160 ?auto_123159 ?auto_123158 )
      ( MAKE-5PILE ?auto_123157 ?auto_123158 ?auto_123159 ?auto_123160 ?auto_123161 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123170 - BLOCK
      ?auto_123171 - BLOCK
      ?auto_123172 - BLOCK
      ?auto_123173 - BLOCK
      ?auto_123174 - BLOCK
    )
    :vars
    (
      ?auto_123177 - BLOCK
      ?auto_123175 - BLOCK
      ?auto_123176 - BLOCK
      ?auto_123178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123170 ?auto_123171 ) ) ( not ( = ?auto_123170 ?auto_123172 ) ) ( not ( = ?auto_123170 ?auto_123173 ) ) ( not ( = ?auto_123170 ?auto_123174 ) ) ( not ( = ?auto_123171 ?auto_123172 ) ) ( not ( = ?auto_123171 ?auto_123173 ) ) ( not ( = ?auto_123171 ?auto_123174 ) ) ( not ( = ?auto_123172 ?auto_123173 ) ) ( not ( = ?auto_123172 ?auto_123174 ) ) ( not ( = ?auto_123173 ?auto_123174 ) ) ( ON ?auto_123174 ?auto_123177 ) ( not ( = ?auto_123170 ?auto_123177 ) ) ( not ( = ?auto_123171 ?auto_123177 ) ) ( not ( = ?auto_123172 ?auto_123177 ) ) ( not ( = ?auto_123173 ?auto_123177 ) ) ( not ( = ?auto_123174 ?auto_123177 ) ) ( ON ?auto_123173 ?auto_123174 ) ( ON-TABLE ?auto_123175 ) ( ON ?auto_123176 ?auto_123175 ) ( ON ?auto_123177 ?auto_123176 ) ( not ( = ?auto_123175 ?auto_123176 ) ) ( not ( = ?auto_123175 ?auto_123177 ) ) ( not ( = ?auto_123175 ?auto_123174 ) ) ( not ( = ?auto_123175 ?auto_123173 ) ) ( not ( = ?auto_123176 ?auto_123177 ) ) ( not ( = ?auto_123176 ?auto_123174 ) ) ( not ( = ?auto_123176 ?auto_123173 ) ) ( not ( = ?auto_123170 ?auto_123175 ) ) ( not ( = ?auto_123170 ?auto_123176 ) ) ( not ( = ?auto_123171 ?auto_123175 ) ) ( not ( = ?auto_123171 ?auto_123176 ) ) ( not ( = ?auto_123172 ?auto_123175 ) ) ( not ( = ?auto_123172 ?auto_123176 ) ) ( ON ?auto_123172 ?auto_123173 ) ( ON ?auto_123171 ?auto_123172 ) ( CLEAR ?auto_123171 ) ( ON ?auto_123170 ?auto_123178 ) ( CLEAR ?auto_123170 ) ( HAND-EMPTY ) ( not ( = ?auto_123170 ?auto_123178 ) ) ( not ( = ?auto_123171 ?auto_123178 ) ) ( not ( = ?auto_123172 ?auto_123178 ) ) ( not ( = ?auto_123173 ?auto_123178 ) ) ( not ( = ?auto_123174 ?auto_123178 ) ) ( not ( = ?auto_123177 ?auto_123178 ) ) ( not ( = ?auto_123175 ?auto_123178 ) ) ( not ( = ?auto_123176 ?auto_123178 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_123170 ?auto_123178 )
      ( MAKE-5PILE ?auto_123170 ?auto_123171 ?auto_123172 ?auto_123173 ?auto_123174 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123179 - BLOCK
      ?auto_123180 - BLOCK
      ?auto_123181 - BLOCK
      ?auto_123182 - BLOCK
      ?auto_123183 - BLOCK
    )
    :vars
    (
      ?auto_123185 - BLOCK
      ?auto_123186 - BLOCK
      ?auto_123184 - BLOCK
      ?auto_123187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123179 ?auto_123180 ) ) ( not ( = ?auto_123179 ?auto_123181 ) ) ( not ( = ?auto_123179 ?auto_123182 ) ) ( not ( = ?auto_123179 ?auto_123183 ) ) ( not ( = ?auto_123180 ?auto_123181 ) ) ( not ( = ?auto_123180 ?auto_123182 ) ) ( not ( = ?auto_123180 ?auto_123183 ) ) ( not ( = ?auto_123181 ?auto_123182 ) ) ( not ( = ?auto_123181 ?auto_123183 ) ) ( not ( = ?auto_123182 ?auto_123183 ) ) ( ON ?auto_123183 ?auto_123185 ) ( not ( = ?auto_123179 ?auto_123185 ) ) ( not ( = ?auto_123180 ?auto_123185 ) ) ( not ( = ?auto_123181 ?auto_123185 ) ) ( not ( = ?auto_123182 ?auto_123185 ) ) ( not ( = ?auto_123183 ?auto_123185 ) ) ( ON ?auto_123182 ?auto_123183 ) ( ON-TABLE ?auto_123186 ) ( ON ?auto_123184 ?auto_123186 ) ( ON ?auto_123185 ?auto_123184 ) ( not ( = ?auto_123186 ?auto_123184 ) ) ( not ( = ?auto_123186 ?auto_123185 ) ) ( not ( = ?auto_123186 ?auto_123183 ) ) ( not ( = ?auto_123186 ?auto_123182 ) ) ( not ( = ?auto_123184 ?auto_123185 ) ) ( not ( = ?auto_123184 ?auto_123183 ) ) ( not ( = ?auto_123184 ?auto_123182 ) ) ( not ( = ?auto_123179 ?auto_123186 ) ) ( not ( = ?auto_123179 ?auto_123184 ) ) ( not ( = ?auto_123180 ?auto_123186 ) ) ( not ( = ?auto_123180 ?auto_123184 ) ) ( not ( = ?auto_123181 ?auto_123186 ) ) ( not ( = ?auto_123181 ?auto_123184 ) ) ( ON ?auto_123181 ?auto_123182 ) ( ON ?auto_123179 ?auto_123187 ) ( CLEAR ?auto_123179 ) ( not ( = ?auto_123179 ?auto_123187 ) ) ( not ( = ?auto_123180 ?auto_123187 ) ) ( not ( = ?auto_123181 ?auto_123187 ) ) ( not ( = ?auto_123182 ?auto_123187 ) ) ( not ( = ?auto_123183 ?auto_123187 ) ) ( not ( = ?auto_123185 ?auto_123187 ) ) ( not ( = ?auto_123186 ?auto_123187 ) ) ( not ( = ?auto_123184 ?auto_123187 ) ) ( HOLDING ?auto_123180 ) ( CLEAR ?auto_123181 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123186 ?auto_123184 ?auto_123185 ?auto_123183 ?auto_123182 ?auto_123181 ?auto_123180 )
      ( MAKE-5PILE ?auto_123179 ?auto_123180 ?auto_123181 ?auto_123182 ?auto_123183 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123188 - BLOCK
      ?auto_123189 - BLOCK
      ?auto_123190 - BLOCK
      ?auto_123191 - BLOCK
      ?auto_123192 - BLOCK
    )
    :vars
    (
      ?auto_123195 - BLOCK
      ?auto_123193 - BLOCK
      ?auto_123194 - BLOCK
      ?auto_123196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123188 ?auto_123189 ) ) ( not ( = ?auto_123188 ?auto_123190 ) ) ( not ( = ?auto_123188 ?auto_123191 ) ) ( not ( = ?auto_123188 ?auto_123192 ) ) ( not ( = ?auto_123189 ?auto_123190 ) ) ( not ( = ?auto_123189 ?auto_123191 ) ) ( not ( = ?auto_123189 ?auto_123192 ) ) ( not ( = ?auto_123190 ?auto_123191 ) ) ( not ( = ?auto_123190 ?auto_123192 ) ) ( not ( = ?auto_123191 ?auto_123192 ) ) ( ON ?auto_123192 ?auto_123195 ) ( not ( = ?auto_123188 ?auto_123195 ) ) ( not ( = ?auto_123189 ?auto_123195 ) ) ( not ( = ?auto_123190 ?auto_123195 ) ) ( not ( = ?auto_123191 ?auto_123195 ) ) ( not ( = ?auto_123192 ?auto_123195 ) ) ( ON ?auto_123191 ?auto_123192 ) ( ON-TABLE ?auto_123193 ) ( ON ?auto_123194 ?auto_123193 ) ( ON ?auto_123195 ?auto_123194 ) ( not ( = ?auto_123193 ?auto_123194 ) ) ( not ( = ?auto_123193 ?auto_123195 ) ) ( not ( = ?auto_123193 ?auto_123192 ) ) ( not ( = ?auto_123193 ?auto_123191 ) ) ( not ( = ?auto_123194 ?auto_123195 ) ) ( not ( = ?auto_123194 ?auto_123192 ) ) ( not ( = ?auto_123194 ?auto_123191 ) ) ( not ( = ?auto_123188 ?auto_123193 ) ) ( not ( = ?auto_123188 ?auto_123194 ) ) ( not ( = ?auto_123189 ?auto_123193 ) ) ( not ( = ?auto_123189 ?auto_123194 ) ) ( not ( = ?auto_123190 ?auto_123193 ) ) ( not ( = ?auto_123190 ?auto_123194 ) ) ( ON ?auto_123190 ?auto_123191 ) ( ON ?auto_123188 ?auto_123196 ) ( not ( = ?auto_123188 ?auto_123196 ) ) ( not ( = ?auto_123189 ?auto_123196 ) ) ( not ( = ?auto_123190 ?auto_123196 ) ) ( not ( = ?auto_123191 ?auto_123196 ) ) ( not ( = ?auto_123192 ?auto_123196 ) ) ( not ( = ?auto_123195 ?auto_123196 ) ) ( not ( = ?auto_123193 ?auto_123196 ) ) ( not ( = ?auto_123194 ?auto_123196 ) ) ( CLEAR ?auto_123190 ) ( ON ?auto_123189 ?auto_123188 ) ( CLEAR ?auto_123189 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_123196 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123196 ?auto_123188 )
      ( MAKE-5PILE ?auto_123188 ?auto_123189 ?auto_123190 ?auto_123191 ?auto_123192 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123197 - BLOCK
      ?auto_123198 - BLOCK
      ?auto_123199 - BLOCK
      ?auto_123200 - BLOCK
      ?auto_123201 - BLOCK
    )
    :vars
    (
      ?auto_123203 - BLOCK
      ?auto_123202 - BLOCK
      ?auto_123205 - BLOCK
      ?auto_123204 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123197 ?auto_123198 ) ) ( not ( = ?auto_123197 ?auto_123199 ) ) ( not ( = ?auto_123197 ?auto_123200 ) ) ( not ( = ?auto_123197 ?auto_123201 ) ) ( not ( = ?auto_123198 ?auto_123199 ) ) ( not ( = ?auto_123198 ?auto_123200 ) ) ( not ( = ?auto_123198 ?auto_123201 ) ) ( not ( = ?auto_123199 ?auto_123200 ) ) ( not ( = ?auto_123199 ?auto_123201 ) ) ( not ( = ?auto_123200 ?auto_123201 ) ) ( ON ?auto_123201 ?auto_123203 ) ( not ( = ?auto_123197 ?auto_123203 ) ) ( not ( = ?auto_123198 ?auto_123203 ) ) ( not ( = ?auto_123199 ?auto_123203 ) ) ( not ( = ?auto_123200 ?auto_123203 ) ) ( not ( = ?auto_123201 ?auto_123203 ) ) ( ON ?auto_123200 ?auto_123201 ) ( ON-TABLE ?auto_123202 ) ( ON ?auto_123205 ?auto_123202 ) ( ON ?auto_123203 ?auto_123205 ) ( not ( = ?auto_123202 ?auto_123205 ) ) ( not ( = ?auto_123202 ?auto_123203 ) ) ( not ( = ?auto_123202 ?auto_123201 ) ) ( not ( = ?auto_123202 ?auto_123200 ) ) ( not ( = ?auto_123205 ?auto_123203 ) ) ( not ( = ?auto_123205 ?auto_123201 ) ) ( not ( = ?auto_123205 ?auto_123200 ) ) ( not ( = ?auto_123197 ?auto_123202 ) ) ( not ( = ?auto_123197 ?auto_123205 ) ) ( not ( = ?auto_123198 ?auto_123202 ) ) ( not ( = ?auto_123198 ?auto_123205 ) ) ( not ( = ?auto_123199 ?auto_123202 ) ) ( not ( = ?auto_123199 ?auto_123205 ) ) ( ON ?auto_123197 ?auto_123204 ) ( not ( = ?auto_123197 ?auto_123204 ) ) ( not ( = ?auto_123198 ?auto_123204 ) ) ( not ( = ?auto_123199 ?auto_123204 ) ) ( not ( = ?auto_123200 ?auto_123204 ) ) ( not ( = ?auto_123201 ?auto_123204 ) ) ( not ( = ?auto_123203 ?auto_123204 ) ) ( not ( = ?auto_123202 ?auto_123204 ) ) ( not ( = ?auto_123205 ?auto_123204 ) ) ( ON ?auto_123198 ?auto_123197 ) ( CLEAR ?auto_123198 ) ( ON-TABLE ?auto_123204 ) ( HOLDING ?auto_123199 ) ( CLEAR ?auto_123200 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123202 ?auto_123205 ?auto_123203 ?auto_123201 ?auto_123200 ?auto_123199 )
      ( MAKE-5PILE ?auto_123197 ?auto_123198 ?auto_123199 ?auto_123200 ?auto_123201 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123206 - BLOCK
      ?auto_123207 - BLOCK
      ?auto_123208 - BLOCK
      ?auto_123209 - BLOCK
      ?auto_123210 - BLOCK
    )
    :vars
    (
      ?auto_123213 - BLOCK
      ?auto_123212 - BLOCK
      ?auto_123211 - BLOCK
      ?auto_123214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123206 ?auto_123207 ) ) ( not ( = ?auto_123206 ?auto_123208 ) ) ( not ( = ?auto_123206 ?auto_123209 ) ) ( not ( = ?auto_123206 ?auto_123210 ) ) ( not ( = ?auto_123207 ?auto_123208 ) ) ( not ( = ?auto_123207 ?auto_123209 ) ) ( not ( = ?auto_123207 ?auto_123210 ) ) ( not ( = ?auto_123208 ?auto_123209 ) ) ( not ( = ?auto_123208 ?auto_123210 ) ) ( not ( = ?auto_123209 ?auto_123210 ) ) ( ON ?auto_123210 ?auto_123213 ) ( not ( = ?auto_123206 ?auto_123213 ) ) ( not ( = ?auto_123207 ?auto_123213 ) ) ( not ( = ?auto_123208 ?auto_123213 ) ) ( not ( = ?auto_123209 ?auto_123213 ) ) ( not ( = ?auto_123210 ?auto_123213 ) ) ( ON ?auto_123209 ?auto_123210 ) ( ON-TABLE ?auto_123212 ) ( ON ?auto_123211 ?auto_123212 ) ( ON ?auto_123213 ?auto_123211 ) ( not ( = ?auto_123212 ?auto_123211 ) ) ( not ( = ?auto_123212 ?auto_123213 ) ) ( not ( = ?auto_123212 ?auto_123210 ) ) ( not ( = ?auto_123212 ?auto_123209 ) ) ( not ( = ?auto_123211 ?auto_123213 ) ) ( not ( = ?auto_123211 ?auto_123210 ) ) ( not ( = ?auto_123211 ?auto_123209 ) ) ( not ( = ?auto_123206 ?auto_123212 ) ) ( not ( = ?auto_123206 ?auto_123211 ) ) ( not ( = ?auto_123207 ?auto_123212 ) ) ( not ( = ?auto_123207 ?auto_123211 ) ) ( not ( = ?auto_123208 ?auto_123212 ) ) ( not ( = ?auto_123208 ?auto_123211 ) ) ( ON ?auto_123206 ?auto_123214 ) ( not ( = ?auto_123206 ?auto_123214 ) ) ( not ( = ?auto_123207 ?auto_123214 ) ) ( not ( = ?auto_123208 ?auto_123214 ) ) ( not ( = ?auto_123209 ?auto_123214 ) ) ( not ( = ?auto_123210 ?auto_123214 ) ) ( not ( = ?auto_123213 ?auto_123214 ) ) ( not ( = ?auto_123212 ?auto_123214 ) ) ( not ( = ?auto_123211 ?auto_123214 ) ) ( ON ?auto_123207 ?auto_123206 ) ( ON-TABLE ?auto_123214 ) ( CLEAR ?auto_123209 ) ( ON ?auto_123208 ?auto_123207 ) ( CLEAR ?auto_123208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123214 ?auto_123206 ?auto_123207 )
      ( MAKE-5PILE ?auto_123206 ?auto_123207 ?auto_123208 ?auto_123209 ?auto_123210 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123215 - BLOCK
      ?auto_123216 - BLOCK
      ?auto_123217 - BLOCK
      ?auto_123218 - BLOCK
      ?auto_123219 - BLOCK
    )
    :vars
    (
      ?auto_123221 - BLOCK
      ?auto_123223 - BLOCK
      ?auto_123222 - BLOCK
      ?auto_123220 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123215 ?auto_123216 ) ) ( not ( = ?auto_123215 ?auto_123217 ) ) ( not ( = ?auto_123215 ?auto_123218 ) ) ( not ( = ?auto_123215 ?auto_123219 ) ) ( not ( = ?auto_123216 ?auto_123217 ) ) ( not ( = ?auto_123216 ?auto_123218 ) ) ( not ( = ?auto_123216 ?auto_123219 ) ) ( not ( = ?auto_123217 ?auto_123218 ) ) ( not ( = ?auto_123217 ?auto_123219 ) ) ( not ( = ?auto_123218 ?auto_123219 ) ) ( ON ?auto_123219 ?auto_123221 ) ( not ( = ?auto_123215 ?auto_123221 ) ) ( not ( = ?auto_123216 ?auto_123221 ) ) ( not ( = ?auto_123217 ?auto_123221 ) ) ( not ( = ?auto_123218 ?auto_123221 ) ) ( not ( = ?auto_123219 ?auto_123221 ) ) ( ON-TABLE ?auto_123223 ) ( ON ?auto_123222 ?auto_123223 ) ( ON ?auto_123221 ?auto_123222 ) ( not ( = ?auto_123223 ?auto_123222 ) ) ( not ( = ?auto_123223 ?auto_123221 ) ) ( not ( = ?auto_123223 ?auto_123219 ) ) ( not ( = ?auto_123223 ?auto_123218 ) ) ( not ( = ?auto_123222 ?auto_123221 ) ) ( not ( = ?auto_123222 ?auto_123219 ) ) ( not ( = ?auto_123222 ?auto_123218 ) ) ( not ( = ?auto_123215 ?auto_123223 ) ) ( not ( = ?auto_123215 ?auto_123222 ) ) ( not ( = ?auto_123216 ?auto_123223 ) ) ( not ( = ?auto_123216 ?auto_123222 ) ) ( not ( = ?auto_123217 ?auto_123223 ) ) ( not ( = ?auto_123217 ?auto_123222 ) ) ( ON ?auto_123215 ?auto_123220 ) ( not ( = ?auto_123215 ?auto_123220 ) ) ( not ( = ?auto_123216 ?auto_123220 ) ) ( not ( = ?auto_123217 ?auto_123220 ) ) ( not ( = ?auto_123218 ?auto_123220 ) ) ( not ( = ?auto_123219 ?auto_123220 ) ) ( not ( = ?auto_123221 ?auto_123220 ) ) ( not ( = ?auto_123223 ?auto_123220 ) ) ( not ( = ?auto_123222 ?auto_123220 ) ) ( ON ?auto_123216 ?auto_123215 ) ( ON-TABLE ?auto_123220 ) ( ON ?auto_123217 ?auto_123216 ) ( CLEAR ?auto_123217 ) ( HOLDING ?auto_123218 ) ( CLEAR ?auto_123219 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123223 ?auto_123222 ?auto_123221 ?auto_123219 ?auto_123218 )
      ( MAKE-5PILE ?auto_123215 ?auto_123216 ?auto_123217 ?auto_123218 ?auto_123219 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123224 - BLOCK
      ?auto_123225 - BLOCK
      ?auto_123226 - BLOCK
      ?auto_123227 - BLOCK
      ?auto_123228 - BLOCK
    )
    :vars
    (
      ?auto_123229 - BLOCK
      ?auto_123230 - BLOCK
      ?auto_123231 - BLOCK
      ?auto_123232 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123224 ?auto_123225 ) ) ( not ( = ?auto_123224 ?auto_123226 ) ) ( not ( = ?auto_123224 ?auto_123227 ) ) ( not ( = ?auto_123224 ?auto_123228 ) ) ( not ( = ?auto_123225 ?auto_123226 ) ) ( not ( = ?auto_123225 ?auto_123227 ) ) ( not ( = ?auto_123225 ?auto_123228 ) ) ( not ( = ?auto_123226 ?auto_123227 ) ) ( not ( = ?auto_123226 ?auto_123228 ) ) ( not ( = ?auto_123227 ?auto_123228 ) ) ( ON ?auto_123228 ?auto_123229 ) ( not ( = ?auto_123224 ?auto_123229 ) ) ( not ( = ?auto_123225 ?auto_123229 ) ) ( not ( = ?auto_123226 ?auto_123229 ) ) ( not ( = ?auto_123227 ?auto_123229 ) ) ( not ( = ?auto_123228 ?auto_123229 ) ) ( ON-TABLE ?auto_123230 ) ( ON ?auto_123231 ?auto_123230 ) ( ON ?auto_123229 ?auto_123231 ) ( not ( = ?auto_123230 ?auto_123231 ) ) ( not ( = ?auto_123230 ?auto_123229 ) ) ( not ( = ?auto_123230 ?auto_123228 ) ) ( not ( = ?auto_123230 ?auto_123227 ) ) ( not ( = ?auto_123231 ?auto_123229 ) ) ( not ( = ?auto_123231 ?auto_123228 ) ) ( not ( = ?auto_123231 ?auto_123227 ) ) ( not ( = ?auto_123224 ?auto_123230 ) ) ( not ( = ?auto_123224 ?auto_123231 ) ) ( not ( = ?auto_123225 ?auto_123230 ) ) ( not ( = ?auto_123225 ?auto_123231 ) ) ( not ( = ?auto_123226 ?auto_123230 ) ) ( not ( = ?auto_123226 ?auto_123231 ) ) ( ON ?auto_123224 ?auto_123232 ) ( not ( = ?auto_123224 ?auto_123232 ) ) ( not ( = ?auto_123225 ?auto_123232 ) ) ( not ( = ?auto_123226 ?auto_123232 ) ) ( not ( = ?auto_123227 ?auto_123232 ) ) ( not ( = ?auto_123228 ?auto_123232 ) ) ( not ( = ?auto_123229 ?auto_123232 ) ) ( not ( = ?auto_123230 ?auto_123232 ) ) ( not ( = ?auto_123231 ?auto_123232 ) ) ( ON ?auto_123225 ?auto_123224 ) ( ON-TABLE ?auto_123232 ) ( ON ?auto_123226 ?auto_123225 ) ( CLEAR ?auto_123228 ) ( ON ?auto_123227 ?auto_123226 ) ( CLEAR ?auto_123227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123232 ?auto_123224 ?auto_123225 ?auto_123226 )
      ( MAKE-5PILE ?auto_123224 ?auto_123225 ?auto_123226 ?auto_123227 ?auto_123228 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123233 - BLOCK
      ?auto_123234 - BLOCK
      ?auto_123235 - BLOCK
      ?auto_123236 - BLOCK
      ?auto_123237 - BLOCK
    )
    :vars
    (
      ?auto_123240 - BLOCK
      ?auto_123238 - BLOCK
      ?auto_123239 - BLOCK
      ?auto_123241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123233 ?auto_123234 ) ) ( not ( = ?auto_123233 ?auto_123235 ) ) ( not ( = ?auto_123233 ?auto_123236 ) ) ( not ( = ?auto_123233 ?auto_123237 ) ) ( not ( = ?auto_123234 ?auto_123235 ) ) ( not ( = ?auto_123234 ?auto_123236 ) ) ( not ( = ?auto_123234 ?auto_123237 ) ) ( not ( = ?auto_123235 ?auto_123236 ) ) ( not ( = ?auto_123235 ?auto_123237 ) ) ( not ( = ?auto_123236 ?auto_123237 ) ) ( not ( = ?auto_123233 ?auto_123240 ) ) ( not ( = ?auto_123234 ?auto_123240 ) ) ( not ( = ?auto_123235 ?auto_123240 ) ) ( not ( = ?auto_123236 ?auto_123240 ) ) ( not ( = ?auto_123237 ?auto_123240 ) ) ( ON-TABLE ?auto_123238 ) ( ON ?auto_123239 ?auto_123238 ) ( ON ?auto_123240 ?auto_123239 ) ( not ( = ?auto_123238 ?auto_123239 ) ) ( not ( = ?auto_123238 ?auto_123240 ) ) ( not ( = ?auto_123238 ?auto_123237 ) ) ( not ( = ?auto_123238 ?auto_123236 ) ) ( not ( = ?auto_123239 ?auto_123240 ) ) ( not ( = ?auto_123239 ?auto_123237 ) ) ( not ( = ?auto_123239 ?auto_123236 ) ) ( not ( = ?auto_123233 ?auto_123238 ) ) ( not ( = ?auto_123233 ?auto_123239 ) ) ( not ( = ?auto_123234 ?auto_123238 ) ) ( not ( = ?auto_123234 ?auto_123239 ) ) ( not ( = ?auto_123235 ?auto_123238 ) ) ( not ( = ?auto_123235 ?auto_123239 ) ) ( ON ?auto_123233 ?auto_123241 ) ( not ( = ?auto_123233 ?auto_123241 ) ) ( not ( = ?auto_123234 ?auto_123241 ) ) ( not ( = ?auto_123235 ?auto_123241 ) ) ( not ( = ?auto_123236 ?auto_123241 ) ) ( not ( = ?auto_123237 ?auto_123241 ) ) ( not ( = ?auto_123240 ?auto_123241 ) ) ( not ( = ?auto_123238 ?auto_123241 ) ) ( not ( = ?auto_123239 ?auto_123241 ) ) ( ON ?auto_123234 ?auto_123233 ) ( ON-TABLE ?auto_123241 ) ( ON ?auto_123235 ?auto_123234 ) ( ON ?auto_123236 ?auto_123235 ) ( CLEAR ?auto_123236 ) ( HOLDING ?auto_123237 ) ( CLEAR ?auto_123240 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123238 ?auto_123239 ?auto_123240 ?auto_123237 )
      ( MAKE-5PILE ?auto_123233 ?auto_123234 ?auto_123235 ?auto_123236 ?auto_123237 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123242 - BLOCK
      ?auto_123243 - BLOCK
      ?auto_123244 - BLOCK
      ?auto_123245 - BLOCK
      ?auto_123246 - BLOCK
    )
    :vars
    (
      ?auto_123247 - BLOCK
      ?auto_123248 - BLOCK
      ?auto_123249 - BLOCK
      ?auto_123250 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123242 ?auto_123243 ) ) ( not ( = ?auto_123242 ?auto_123244 ) ) ( not ( = ?auto_123242 ?auto_123245 ) ) ( not ( = ?auto_123242 ?auto_123246 ) ) ( not ( = ?auto_123243 ?auto_123244 ) ) ( not ( = ?auto_123243 ?auto_123245 ) ) ( not ( = ?auto_123243 ?auto_123246 ) ) ( not ( = ?auto_123244 ?auto_123245 ) ) ( not ( = ?auto_123244 ?auto_123246 ) ) ( not ( = ?auto_123245 ?auto_123246 ) ) ( not ( = ?auto_123242 ?auto_123247 ) ) ( not ( = ?auto_123243 ?auto_123247 ) ) ( not ( = ?auto_123244 ?auto_123247 ) ) ( not ( = ?auto_123245 ?auto_123247 ) ) ( not ( = ?auto_123246 ?auto_123247 ) ) ( ON-TABLE ?auto_123248 ) ( ON ?auto_123249 ?auto_123248 ) ( ON ?auto_123247 ?auto_123249 ) ( not ( = ?auto_123248 ?auto_123249 ) ) ( not ( = ?auto_123248 ?auto_123247 ) ) ( not ( = ?auto_123248 ?auto_123246 ) ) ( not ( = ?auto_123248 ?auto_123245 ) ) ( not ( = ?auto_123249 ?auto_123247 ) ) ( not ( = ?auto_123249 ?auto_123246 ) ) ( not ( = ?auto_123249 ?auto_123245 ) ) ( not ( = ?auto_123242 ?auto_123248 ) ) ( not ( = ?auto_123242 ?auto_123249 ) ) ( not ( = ?auto_123243 ?auto_123248 ) ) ( not ( = ?auto_123243 ?auto_123249 ) ) ( not ( = ?auto_123244 ?auto_123248 ) ) ( not ( = ?auto_123244 ?auto_123249 ) ) ( ON ?auto_123242 ?auto_123250 ) ( not ( = ?auto_123242 ?auto_123250 ) ) ( not ( = ?auto_123243 ?auto_123250 ) ) ( not ( = ?auto_123244 ?auto_123250 ) ) ( not ( = ?auto_123245 ?auto_123250 ) ) ( not ( = ?auto_123246 ?auto_123250 ) ) ( not ( = ?auto_123247 ?auto_123250 ) ) ( not ( = ?auto_123248 ?auto_123250 ) ) ( not ( = ?auto_123249 ?auto_123250 ) ) ( ON ?auto_123243 ?auto_123242 ) ( ON-TABLE ?auto_123250 ) ( ON ?auto_123244 ?auto_123243 ) ( ON ?auto_123245 ?auto_123244 ) ( CLEAR ?auto_123247 ) ( ON ?auto_123246 ?auto_123245 ) ( CLEAR ?auto_123246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123250 ?auto_123242 ?auto_123243 ?auto_123244 ?auto_123245 )
      ( MAKE-5PILE ?auto_123242 ?auto_123243 ?auto_123244 ?auto_123245 ?auto_123246 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123251 - BLOCK
      ?auto_123252 - BLOCK
      ?auto_123253 - BLOCK
      ?auto_123254 - BLOCK
      ?auto_123255 - BLOCK
    )
    :vars
    (
      ?auto_123256 - BLOCK
      ?auto_123259 - BLOCK
      ?auto_123258 - BLOCK
      ?auto_123257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123251 ?auto_123252 ) ) ( not ( = ?auto_123251 ?auto_123253 ) ) ( not ( = ?auto_123251 ?auto_123254 ) ) ( not ( = ?auto_123251 ?auto_123255 ) ) ( not ( = ?auto_123252 ?auto_123253 ) ) ( not ( = ?auto_123252 ?auto_123254 ) ) ( not ( = ?auto_123252 ?auto_123255 ) ) ( not ( = ?auto_123253 ?auto_123254 ) ) ( not ( = ?auto_123253 ?auto_123255 ) ) ( not ( = ?auto_123254 ?auto_123255 ) ) ( not ( = ?auto_123251 ?auto_123256 ) ) ( not ( = ?auto_123252 ?auto_123256 ) ) ( not ( = ?auto_123253 ?auto_123256 ) ) ( not ( = ?auto_123254 ?auto_123256 ) ) ( not ( = ?auto_123255 ?auto_123256 ) ) ( ON-TABLE ?auto_123259 ) ( ON ?auto_123258 ?auto_123259 ) ( not ( = ?auto_123259 ?auto_123258 ) ) ( not ( = ?auto_123259 ?auto_123256 ) ) ( not ( = ?auto_123259 ?auto_123255 ) ) ( not ( = ?auto_123259 ?auto_123254 ) ) ( not ( = ?auto_123258 ?auto_123256 ) ) ( not ( = ?auto_123258 ?auto_123255 ) ) ( not ( = ?auto_123258 ?auto_123254 ) ) ( not ( = ?auto_123251 ?auto_123259 ) ) ( not ( = ?auto_123251 ?auto_123258 ) ) ( not ( = ?auto_123252 ?auto_123259 ) ) ( not ( = ?auto_123252 ?auto_123258 ) ) ( not ( = ?auto_123253 ?auto_123259 ) ) ( not ( = ?auto_123253 ?auto_123258 ) ) ( ON ?auto_123251 ?auto_123257 ) ( not ( = ?auto_123251 ?auto_123257 ) ) ( not ( = ?auto_123252 ?auto_123257 ) ) ( not ( = ?auto_123253 ?auto_123257 ) ) ( not ( = ?auto_123254 ?auto_123257 ) ) ( not ( = ?auto_123255 ?auto_123257 ) ) ( not ( = ?auto_123256 ?auto_123257 ) ) ( not ( = ?auto_123259 ?auto_123257 ) ) ( not ( = ?auto_123258 ?auto_123257 ) ) ( ON ?auto_123252 ?auto_123251 ) ( ON-TABLE ?auto_123257 ) ( ON ?auto_123253 ?auto_123252 ) ( ON ?auto_123254 ?auto_123253 ) ( ON ?auto_123255 ?auto_123254 ) ( CLEAR ?auto_123255 ) ( HOLDING ?auto_123256 ) ( CLEAR ?auto_123258 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123259 ?auto_123258 ?auto_123256 )
      ( MAKE-5PILE ?auto_123251 ?auto_123252 ?auto_123253 ?auto_123254 ?auto_123255 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123260 - BLOCK
      ?auto_123261 - BLOCK
      ?auto_123262 - BLOCK
      ?auto_123263 - BLOCK
      ?auto_123264 - BLOCK
    )
    :vars
    (
      ?auto_123265 - BLOCK
      ?auto_123266 - BLOCK
      ?auto_123268 - BLOCK
      ?auto_123267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123260 ?auto_123261 ) ) ( not ( = ?auto_123260 ?auto_123262 ) ) ( not ( = ?auto_123260 ?auto_123263 ) ) ( not ( = ?auto_123260 ?auto_123264 ) ) ( not ( = ?auto_123261 ?auto_123262 ) ) ( not ( = ?auto_123261 ?auto_123263 ) ) ( not ( = ?auto_123261 ?auto_123264 ) ) ( not ( = ?auto_123262 ?auto_123263 ) ) ( not ( = ?auto_123262 ?auto_123264 ) ) ( not ( = ?auto_123263 ?auto_123264 ) ) ( not ( = ?auto_123260 ?auto_123265 ) ) ( not ( = ?auto_123261 ?auto_123265 ) ) ( not ( = ?auto_123262 ?auto_123265 ) ) ( not ( = ?auto_123263 ?auto_123265 ) ) ( not ( = ?auto_123264 ?auto_123265 ) ) ( ON-TABLE ?auto_123266 ) ( ON ?auto_123268 ?auto_123266 ) ( not ( = ?auto_123266 ?auto_123268 ) ) ( not ( = ?auto_123266 ?auto_123265 ) ) ( not ( = ?auto_123266 ?auto_123264 ) ) ( not ( = ?auto_123266 ?auto_123263 ) ) ( not ( = ?auto_123268 ?auto_123265 ) ) ( not ( = ?auto_123268 ?auto_123264 ) ) ( not ( = ?auto_123268 ?auto_123263 ) ) ( not ( = ?auto_123260 ?auto_123266 ) ) ( not ( = ?auto_123260 ?auto_123268 ) ) ( not ( = ?auto_123261 ?auto_123266 ) ) ( not ( = ?auto_123261 ?auto_123268 ) ) ( not ( = ?auto_123262 ?auto_123266 ) ) ( not ( = ?auto_123262 ?auto_123268 ) ) ( ON ?auto_123260 ?auto_123267 ) ( not ( = ?auto_123260 ?auto_123267 ) ) ( not ( = ?auto_123261 ?auto_123267 ) ) ( not ( = ?auto_123262 ?auto_123267 ) ) ( not ( = ?auto_123263 ?auto_123267 ) ) ( not ( = ?auto_123264 ?auto_123267 ) ) ( not ( = ?auto_123265 ?auto_123267 ) ) ( not ( = ?auto_123266 ?auto_123267 ) ) ( not ( = ?auto_123268 ?auto_123267 ) ) ( ON ?auto_123261 ?auto_123260 ) ( ON-TABLE ?auto_123267 ) ( ON ?auto_123262 ?auto_123261 ) ( ON ?auto_123263 ?auto_123262 ) ( ON ?auto_123264 ?auto_123263 ) ( CLEAR ?auto_123268 ) ( ON ?auto_123265 ?auto_123264 ) ( CLEAR ?auto_123265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123267 ?auto_123260 ?auto_123261 ?auto_123262 ?auto_123263 ?auto_123264 )
      ( MAKE-5PILE ?auto_123260 ?auto_123261 ?auto_123262 ?auto_123263 ?auto_123264 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123269 - BLOCK
      ?auto_123270 - BLOCK
      ?auto_123271 - BLOCK
      ?auto_123272 - BLOCK
      ?auto_123273 - BLOCK
    )
    :vars
    (
      ?auto_123275 - BLOCK
      ?auto_123277 - BLOCK
      ?auto_123276 - BLOCK
      ?auto_123274 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123269 ?auto_123270 ) ) ( not ( = ?auto_123269 ?auto_123271 ) ) ( not ( = ?auto_123269 ?auto_123272 ) ) ( not ( = ?auto_123269 ?auto_123273 ) ) ( not ( = ?auto_123270 ?auto_123271 ) ) ( not ( = ?auto_123270 ?auto_123272 ) ) ( not ( = ?auto_123270 ?auto_123273 ) ) ( not ( = ?auto_123271 ?auto_123272 ) ) ( not ( = ?auto_123271 ?auto_123273 ) ) ( not ( = ?auto_123272 ?auto_123273 ) ) ( not ( = ?auto_123269 ?auto_123275 ) ) ( not ( = ?auto_123270 ?auto_123275 ) ) ( not ( = ?auto_123271 ?auto_123275 ) ) ( not ( = ?auto_123272 ?auto_123275 ) ) ( not ( = ?auto_123273 ?auto_123275 ) ) ( ON-TABLE ?auto_123277 ) ( not ( = ?auto_123277 ?auto_123276 ) ) ( not ( = ?auto_123277 ?auto_123275 ) ) ( not ( = ?auto_123277 ?auto_123273 ) ) ( not ( = ?auto_123277 ?auto_123272 ) ) ( not ( = ?auto_123276 ?auto_123275 ) ) ( not ( = ?auto_123276 ?auto_123273 ) ) ( not ( = ?auto_123276 ?auto_123272 ) ) ( not ( = ?auto_123269 ?auto_123277 ) ) ( not ( = ?auto_123269 ?auto_123276 ) ) ( not ( = ?auto_123270 ?auto_123277 ) ) ( not ( = ?auto_123270 ?auto_123276 ) ) ( not ( = ?auto_123271 ?auto_123277 ) ) ( not ( = ?auto_123271 ?auto_123276 ) ) ( ON ?auto_123269 ?auto_123274 ) ( not ( = ?auto_123269 ?auto_123274 ) ) ( not ( = ?auto_123270 ?auto_123274 ) ) ( not ( = ?auto_123271 ?auto_123274 ) ) ( not ( = ?auto_123272 ?auto_123274 ) ) ( not ( = ?auto_123273 ?auto_123274 ) ) ( not ( = ?auto_123275 ?auto_123274 ) ) ( not ( = ?auto_123277 ?auto_123274 ) ) ( not ( = ?auto_123276 ?auto_123274 ) ) ( ON ?auto_123270 ?auto_123269 ) ( ON-TABLE ?auto_123274 ) ( ON ?auto_123271 ?auto_123270 ) ( ON ?auto_123272 ?auto_123271 ) ( ON ?auto_123273 ?auto_123272 ) ( ON ?auto_123275 ?auto_123273 ) ( CLEAR ?auto_123275 ) ( HOLDING ?auto_123276 ) ( CLEAR ?auto_123277 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123277 ?auto_123276 )
      ( MAKE-5PILE ?auto_123269 ?auto_123270 ?auto_123271 ?auto_123272 ?auto_123273 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123278 - BLOCK
      ?auto_123279 - BLOCK
      ?auto_123280 - BLOCK
      ?auto_123281 - BLOCK
      ?auto_123282 - BLOCK
    )
    :vars
    (
      ?auto_123286 - BLOCK
      ?auto_123284 - BLOCK
      ?auto_123283 - BLOCK
      ?auto_123285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123278 ?auto_123279 ) ) ( not ( = ?auto_123278 ?auto_123280 ) ) ( not ( = ?auto_123278 ?auto_123281 ) ) ( not ( = ?auto_123278 ?auto_123282 ) ) ( not ( = ?auto_123279 ?auto_123280 ) ) ( not ( = ?auto_123279 ?auto_123281 ) ) ( not ( = ?auto_123279 ?auto_123282 ) ) ( not ( = ?auto_123280 ?auto_123281 ) ) ( not ( = ?auto_123280 ?auto_123282 ) ) ( not ( = ?auto_123281 ?auto_123282 ) ) ( not ( = ?auto_123278 ?auto_123286 ) ) ( not ( = ?auto_123279 ?auto_123286 ) ) ( not ( = ?auto_123280 ?auto_123286 ) ) ( not ( = ?auto_123281 ?auto_123286 ) ) ( not ( = ?auto_123282 ?auto_123286 ) ) ( ON-TABLE ?auto_123284 ) ( not ( = ?auto_123284 ?auto_123283 ) ) ( not ( = ?auto_123284 ?auto_123286 ) ) ( not ( = ?auto_123284 ?auto_123282 ) ) ( not ( = ?auto_123284 ?auto_123281 ) ) ( not ( = ?auto_123283 ?auto_123286 ) ) ( not ( = ?auto_123283 ?auto_123282 ) ) ( not ( = ?auto_123283 ?auto_123281 ) ) ( not ( = ?auto_123278 ?auto_123284 ) ) ( not ( = ?auto_123278 ?auto_123283 ) ) ( not ( = ?auto_123279 ?auto_123284 ) ) ( not ( = ?auto_123279 ?auto_123283 ) ) ( not ( = ?auto_123280 ?auto_123284 ) ) ( not ( = ?auto_123280 ?auto_123283 ) ) ( ON ?auto_123278 ?auto_123285 ) ( not ( = ?auto_123278 ?auto_123285 ) ) ( not ( = ?auto_123279 ?auto_123285 ) ) ( not ( = ?auto_123280 ?auto_123285 ) ) ( not ( = ?auto_123281 ?auto_123285 ) ) ( not ( = ?auto_123282 ?auto_123285 ) ) ( not ( = ?auto_123286 ?auto_123285 ) ) ( not ( = ?auto_123284 ?auto_123285 ) ) ( not ( = ?auto_123283 ?auto_123285 ) ) ( ON ?auto_123279 ?auto_123278 ) ( ON-TABLE ?auto_123285 ) ( ON ?auto_123280 ?auto_123279 ) ( ON ?auto_123281 ?auto_123280 ) ( ON ?auto_123282 ?auto_123281 ) ( ON ?auto_123286 ?auto_123282 ) ( CLEAR ?auto_123284 ) ( ON ?auto_123283 ?auto_123286 ) ( CLEAR ?auto_123283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123285 ?auto_123278 ?auto_123279 ?auto_123280 ?auto_123281 ?auto_123282 ?auto_123286 )
      ( MAKE-5PILE ?auto_123278 ?auto_123279 ?auto_123280 ?auto_123281 ?auto_123282 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123287 - BLOCK
      ?auto_123288 - BLOCK
      ?auto_123289 - BLOCK
      ?auto_123290 - BLOCK
      ?auto_123291 - BLOCK
    )
    :vars
    (
      ?auto_123294 - BLOCK
      ?auto_123293 - BLOCK
      ?auto_123295 - BLOCK
      ?auto_123292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123287 ?auto_123288 ) ) ( not ( = ?auto_123287 ?auto_123289 ) ) ( not ( = ?auto_123287 ?auto_123290 ) ) ( not ( = ?auto_123287 ?auto_123291 ) ) ( not ( = ?auto_123288 ?auto_123289 ) ) ( not ( = ?auto_123288 ?auto_123290 ) ) ( not ( = ?auto_123288 ?auto_123291 ) ) ( not ( = ?auto_123289 ?auto_123290 ) ) ( not ( = ?auto_123289 ?auto_123291 ) ) ( not ( = ?auto_123290 ?auto_123291 ) ) ( not ( = ?auto_123287 ?auto_123294 ) ) ( not ( = ?auto_123288 ?auto_123294 ) ) ( not ( = ?auto_123289 ?auto_123294 ) ) ( not ( = ?auto_123290 ?auto_123294 ) ) ( not ( = ?auto_123291 ?auto_123294 ) ) ( not ( = ?auto_123293 ?auto_123295 ) ) ( not ( = ?auto_123293 ?auto_123294 ) ) ( not ( = ?auto_123293 ?auto_123291 ) ) ( not ( = ?auto_123293 ?auto_123290 ) ) ( not ( = ?auto_123295 ?auto_123294 ) ) ( not ( = ?auto_123295 ?auto_123291 ) ) ( not ( = ?auto_123295 ?auto_123290 ) ) ( not ( = ?auto_123287 ?auto_123293 ) ) ( not ( = ?auto_123287 ?auto_123295 ) ) ( not ( = ?auto_123288 ?auto_123293 ) ) ( not ( = ?auto_123288 ?auto_123295 ) ) ( not ( = ?auto_123289 ?auto_123293 ) ) ( not ( = ?auto_123289 ?auto_123295 ) ) ( ON ?auto_123287 ?auto_123292 ) ( not ( = ?auto_123287 ?auto_123292 ) ) ( not ( = ?auto_123288 ?auto_123292 ) ) ( not ( = ?auto_123289 ?auto_123292 ) ) ( not ( = ?auto_123290 ?auto_123292 ) ) ( not ( = ?auto_123291 ?auto_123292 ) ) ( not ( = ?auto_123294 ?auto_123292 ) ) ( not ( = ?auto_123293 ?auto_123292 ) ) ( not ( = ?auto_123295 ?auto_123292 ) ) ( ON ?auto_123288 ?auto_123287 ) ( ON-TABLE ?auto_123292 ) ( ON ?auto_123289 ?auto_123288 ) ( ON ?auto_123290 ?auto_123289 ) ( ON ?auto_123291 ?auto_123290 ) ( ON ?auto_123294 ?auto_123291 ) ( ON ?auto_123295 ?auto_123294 ) ( CLEAR ?auto_123295 ) ( HOLDING ?auto_123293 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_123293 )
      ( MAKE-5PILE ?auto_123287 ?auto_123288 ?auto_123289 ?auto_123290 ?auto_123291 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123296 - BLOCK
      ?auto_123297 - BLOCK
      ?auto_123298 - BLOCK
      ?auto_123299 - BLOCK
      ?auto_123300 - BLOCK
    )
    :vars
    (
      ?auto_123303 - BLOCK
      ?auto_123302 - BLOCK
      ?auto_123304 - BLOCK
      ?auto_123301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123296 ?auto_123297 ) ) ( not ( = ?auto_123296 ?auto_123298 ) ) ( not ( = ?auto_123296 ?auto_123299 ) ) ( not ( = ?auto_123296 ?auto_123300 ) ) ( not ( = ?auto_123297 ?auto_123298 ) ) ( not ( = ?auto_123297 ?auto_123299 ) ) ( not ( = ?auto_123297 ?auto_123300 ) ) ( not ( = ?auto_123298 ?auto_123299 ) ) ( not ( = ?auto_123298 ?auto_123300 ) ) ( not ( = ?auto_123299 ?auto_123300 ) ) ( not ( = ?auto_123296 ?auto_123303 ) ) ( not ( = ?auto_123297 ?auto_123303 ) ) ( not ( = ?auto_123298 ?auto_123303 ) ) ( not ( = ?auto_123299 ?auto_123303 ) ) ( not ( = ?auto_123300 ?auto_123303 ) ) ( not ( = ?auto_123302 ?auto_123304 ) ) ( not ( = ?auto_123302 ?auto_123303 ) ) ( not ( = ?auto_123302 ?auto_123300 ) ) ( not ( = ?auto_123302 ?auto_123299 ) ) ( not ( = ?auto_123304 ?auto_123303 ) ) ( not ( = ?auto_123304 ?auto_123300 ) ) ( not ( = ?auto_123304 ?auto_123299 ) ) ( not ( = ?auto_123296 ?auto_123302 ) ) ( not ( = ?auto_123296 ?auto_123304 ) ) ( not ( = ?auto_123297 ?auto_123302 ) ) ( not ( = ?auto_123297 ?auto_123304 ) ) ( not ( = ?auto_123298 ?auto_123302 ) ) ( not ( = ?auto_123298 ?auto_123304 ) ) ( ON ?auto_123296 ?auto_123301 ) ( not ( = ?auto_123296 ?auto_123301 ) ) ( not ( = ?auto_123297 ?auto_123301 ) ) ( not ( = ?auto_123298 ?auto_123301 ) ) ( not ( = ?auto_123299 ?auto_123301 ) ) ( not ( = ?auto_123300 ?auto_123301 ) ) ( not ( = ?auto_123303 ?auto_123301 ) ) ( not ( = ?auto_123302 ?auto_123301 ) ) ( not ( = ?auto_123304 ?auto_123301 ) ) ( ON ?auto_123297 ?auto_123296 ) ( ON-TABLE ?auto_123301 ) ( ON ?auto_123298 ?auto_123297 ) ( ON ?auto_123299 ?auto_123298 ) ( ON ?auto_123300 ?auto_123299 ) ( ON ?auto_123303 ?auto_123300 ) ( ON ?auto_123304 ?auto_123303 ) ( ON ?auto_123302 ?auto_123304 ) ( CLEAR ?auto_123302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_123301 ?auto_123296 ?auto_123297 ?auto_123298 ?auto_123299 ?auto_123300 ?auto_123303 ?auto_123304 )
      ( MAKE-5PILE ?auto_123296 ?auto_123297 ?auto_123298 ?auto_123299 ?auto_123300 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123320 - BLOCK
      ?auto_123321 - BLOCK
    )
    :vars
    (
      ?auto_123324 - BLOCK
      ?auto_123322 - BLOCK
      ?auto_123323 - BLOCK
      ?auto_123326 - BLOCK
      ?auto_123325 - BLOCK
      ?auto_123327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123324 ?auto_123321 ) ( ON-TABLE ?auto_123320 ) ( ON ?auto_123321 ?auto_123320 ) ( not ( = ?auto_123320 ?auto_123321 ) ) ( not ( = ?auto_123320 ?auto_123324 ) ) ( not ( = ?auto_123321 ?auto_123324 ) ) ( not ( = ?auto_123320 ?auto_123322 ) ) ( not ( = ?auto_123320 ?auto_123323 ) ) ( not ( = ?auto_123321 ?auto_123322 ) ) ( not ( = ?auto_123321 ?auto_123323 ) ) ( not ( = ?auto_123324 ?auto_123322 ) ) ( not ( = ?auto_123324 ?auto_123323 ) ) ( not ( = ?auto_123322 ?auto_123323 ) ) ( ON ?auto_123322 ?auto_123324 ) ( CLEAR ?auto_123322 ) ( HOLDING ?auto_123323 ) ( CLEAR ?auto_123326 ) ( ON-TABLE ?auto_123325 ) ( ON ?auto_123327 ?auto_123325 ) ( ON ?auto_123326 ?auto_123327 ) ( not ( = ?auto_123325 ?auto_123327 ) ) ( not ( = ?auto_123325 ?auto_123326 ) ) ( not ( = ?auto_123325 ?auto_123323 ) ) ( not ( = ?auto_123327 ?auto_123326 ) ) ( not ( = ?auto_123327 ?auto_123323 ) ) ( not ( = ?auto_123326 ?auto_123323 ) ) ( not ( = ?auto_123320 ?auto_123326 ) ) ( not ( = ?auto_123320 ?auto_123325 ) ) ( not ( = ?auto_123320 ?auto_123327 ) ) ( not ( = ?auto_123321 ?auto_123326 ) ) ( not ( = ?auto_123321 ?auto_123325 ) ) ( not ( = ?auto_123321 ?auto_123327 ) ) ( not ( = ?auto_123324 ?auto_123326 ) ) ( not ( = ?auto_123324 ?auto_123325 ) ) ( not ( = ?auto_123324 ?auto_123327 ) ) ( not ( = ?auto_123322 ?auto_123326 ) ) ( not ( = ?auto_123322 ?auto_123325 ) ) ( not ( = ?auto_123322 ?auto_123327 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123325 ?auto_123327 ?auto_123326 ?auto_123323 )
      ( MAKE-2PILE ?auto_123320 ?auto_123321 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123328 - BLOCK
      ?auto_123329 - BLOCK
    )
    :vars
    (
      ?auto_123334 - BLOCK
      ?auto_123332 - BLOCK
      ?auto_123331 - BLOCK
      ?auto_123333 - BLOCK
      ?auto_123330 - BLOCK
      ?auto_123335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123334 ?auto_123329 ) ( ON-TABLE ?auto_123328 ) ( ON ?auto_123329 ?auto_123328 ) ( not ( = ?auto_123328 ?auto_123329 ) ) ( not ( = ?auto_123328 ?auto_123334 ) ) ( not ( = ?auto_123329 ?auto_123334 ) ) ( not ( = ?auto_123328 ?auto_123332 ) ) ( not ( = ?auto_123328 ?auto_123331 ) ) ( not ( = ?auto_123329 ?auto_123332 ) ) ( not ( = ?auto_123329 ?auto_123331 ) ) ( not ( = ?auto_123334 ?auto_123332 ) ) ( not ( = ?auto_123334 ?auto_123331 ) ) ( not ( = ?auto_123332 ?auto_123331 ) ) ( ON ?auto_123332 ?auto_123334 ) ( CLEAR ?auto_123333 ) ( ON-TABLE ?auto_123330 ) ( ON ?auto_123335 ?auto_123330 ) ( ON ?auto_123333 ?auto_123335 ) ( not ( = ?auto_123330 ?auto_123335 ) ) ( not ( = ?auto_123330 ?auto_123333 ) ) ( not ( = ?auto_123330 ?auto_123331 ) ) ( not ( = ?auto_123335 ?auto_123333 ) ) ( not ( = ?auto_123335 ?auto_123331 ) ) ( not ( = ?auto_123333 ?auto_123331 ) ) ( not ( = ?auto_123328 ?auto_123333 ) ) ( not ( = ?auto_123328 ?auto_123330 ) ) ( not ( = ?auto_123328 ?auto_123335 ) ) ( not ( = ?auto_123329 ?auto_123333 ) ) ( not ( = ?auto_123329 ?auto_123330 ) ) ( not ( = ?auto_123329 ?auto_123335 ) ) ( not ( = ?auto_123334 ?auto_123333 ) ) ( not ( = ?auto_123334 ?auto_123330 ) ) ( not ( = ?auto_123334 ?auto_123335 ) ) ( not ( = ?auto_123332 ?auto_123333 ) ) ( not ( = ?auto_123332 ?auto_123330 ) ) ( not ( = ?auto_123332 ?auto_123335 ) ) ( ON ?auto_123331 ?auto_123332 ) ( CLEAR ?auto_123331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123328 ?auto_123329 ?auto_123334 ?auto_123332 )
      ( MAKE-2PILE ?auto_123328 ?auto_123329 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123336 - BLOCK
      ?auto_123337 - BLOCK
    )
    :vars
    (
      ?auto_123342 - BLOCK
      ?auto_123343 - BLOCK
      ?auto_123339 - BLOCK
      ?auto_123341 - BLOCK
      ?auto_123338 - BLOCK
      ?auto_123340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123342 ?auto_123337 ) ( ON-TABLE ?auto_123336 ) ( ON ?auto_123337 ?auto_123336 ) ( not ( = ?auto_123336 ?auto_123337 ) ) ( not ( = ?auto_123336 ?auto_123342 ) ) ( not ( = ?auto_123337 ?auto_123342 ) ) ( not ( = ?auto_123336 ?auto_123343 ) ) ( not ( = ?auto_123336 ?auto_123339 ) ) ( not ( = ?auto_123337 ?auto_123343 ) ) ( not ( = ?auto_123337 ?auto_123339 ) ) ( not ( = ?auto_123342 ?auto_123343 ) ) ( not ( = ?auto_123342 ?auto_123339 ) ) ( not ( = ?auto_123343 ?auto_123339 ) ) ( ON ?auto_123343 ?auto_123342 ) ( ON-TABLE ?auto_123341 ) ( ON ?auto_123338 ?auto_123341 ) ( not ( = ?auto_123341 ?auto_123338 ) ) ( not ( = ?auto_123341 ?auto_123340 ) ) ( not ( = ?auto_123341 ?auto_123339 ) ) ( not ( = ?auto_123338 ?auto_123340 ) ) ( not ( = ?auto_123338 ?auto_123339 ) ) ( not ( = ?auto_123340 ?auto_123339 ) ) ( not ( = ?auto_123336 ?auto_123340 ) ) ( not ( = ?auto_123336 ?auto_123341 ) ) ( not ( = ?auto_123336 ?auto_123338 ) ) ( not ( = ?auto_123337 ?auto_123340 ) ) ( not ( = ?auto_123337 ?auto_123341 ) ) ( not ( = ?auto_123337 ?auto_123338 ) ) ( not ( = ?auto_123342 ?auto_123340 ) ) ( not ( = ?auto_123342 ?auto_123341 ) ) ( not ( = ?auto_123342 ?auto_123338 ) ) ( not ( = ?auto_123343 ?auto_123340 ) ) ( not ( = ?auto_123343 ?auto_123341 ) ) ( not ( = ?auto_123343 ?auto_123338 ) ) ( ON ?auto_123339 ?auto_123343 ) ( CLEAR ?auto_123339 ) ( HOLDING ?auto_123340 ) ( CLEAR ?auto_123338 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123341 ?auto_123338 ?auto_123340 )
      ( MAKE-2PILE ?auto_123336 ?auto_123337 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123344 - BLOCK
      ?auto_123345 - BLOCK
    )
    :vars
    (
      ?auto_123349 - BLOCK
      ?auto_123348 - BLOCK
      ?auto_123350 - BLOCK
      ?auto_123347 - BLOCK
      ?auto_123351 - BLOCK
      ?auto_123346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123349 ?auto_123345 ) ( ON-TABLE ?auto_123344 ) ( ON ?auto_123345 ?auto_123344 ) ( not ( = ?auto_123344 ?auto_123345 ) ) ( not ( = ?auto_123344 ?auto_123349 ) ) ( not ( = ?auto_123345 ?auto_123349 ) ) ( not ( = ?auto_123344 ?auto_123348 ) ) ( not ( = ?auto_123344 ?auto_123350 ) ) ( not ( = ?auto_123345 ?auto_123348 ) ) ( not ( = ?auto_123345 ?auto_123350 ) ) ( not ( = ?auto_123349 ?auto_123348 ) ) ( not ( = ?auto_123349 ?auto_123350 ) ) ( not ( = ?auto_123348 ?auto_123350 ) ) ( ON ?auto_123348 ?auto_123349 ) ( ON-TABLE ?auto_123347 ) ( ON ?auto_123351 ?auto_123347 ) ( not ( = ?auto_123347 ?auto_123351 ) ) ( not ( = ?auto_123347 ?auto_123346 ) ) ( not ( = ?auto_123347 ?auto_123350 ) ) ( not ( = ?auto_123351 ?auto_123346 ) ) ( not ( = ?auto_123351 ?auto_123350 ) ) ( not ( = ?auto_123346 ?auto_123350 ) ) ( not ( = ?auto_123344 ?auto_123346 ) ) ( not ( = ?auto_123344 ?auto_123347 ) ) ( not ( = ?auto_123344 ?auto_123351 ) ) ( not ( = ?auto_123345 ?auto_123346 ) ) ( not ( = ?auto_123345 ?auto_123347 ) ) ( not ( = ?auto_123345 ?auto_123351 ) ) ( not ( = ?auto_123349 ?auto_123346 ) ) ( not ( = ?auto_123349 ?auto_123347 ) ) ( not ( = ?auto_123349 ?auto_123351 ) ) ( not ( = ?auto_123348 ?auto_123346 ) ) ( not ( = ?auto_123348 ?auto_123347 ) ) ( not ( = ?auto_123348 ?auto_123351 ) ) ( ON ?auto_123350 ?auto_123348 ) ( CLEAR ?auto_123351 ) ( ON ?auto_123346 ?auto_123350 ) ( CLEAR ?auto_123346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123344 ?auto_123345 ?auto_123349 ?auto_123348 ?auto_123350 )
      ( MAKE-2PILE ?auto_123344 ?auto_123345 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123352 - BLOCK
      ?auto_123353 - BLOCK
    )
    :vars
    (
      ?auto_123356 - BLOCK
      ?auto_123354 - BLOCK
      ?auto_123358 - BLOCK
      ?auto_123355 - BLOCK
      ?auto_123359 - BLOCK
      ?auto_123357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123356 ?auto_123353 ) ( ON-TABLE ?auto_123352 ) ( ON ?auto_123353 ?auto_123352 ) ( not ( = ?auto_123352 ?auto_123353 ) ) ( not ( = ?auto_123352 ?auto_123356 ) ) ( not ( = ?auto_123353 ?auto_123356 ) ) ( not ( = ?auto_123352 ?auto_123354 ) ) ( not ( = ?auto_123352 ?auto_123358 ) ) ( not ( = ?auto_123353 ?auto_123354 ) ) ( not ( = ?auto_123353 ?auto_123358 ) ) ( not ( = ?auto_123356 ?auto_123354 ) ) ( not ( = ?auto_123356 ?auto_123358 ) ) ( not ( = ?auto_123354 ?auto_123358 ) ) ( ON ?auto_123354 ?auto_123356 ) ( ON-TABLE ?auto_123355 ) ( not ( = ?auto_123355 ?auto_123359 ) ) ( not ( = ?auto_123355 ?auto_123357 ) ) ( not ( = ?auto_123355 ?auto_123358 ) ) ( not ( = ?auto_123359 ?auto_123357 ) ) ( not ( = ?auto_123359 ?auto_123358 ) ) ( not ( = ?auto_123357 ?auto_123358 ) ) ( not ( = ?auto_123352 ?auto_123357 ) ) ( not ( = ?auto_123352 ?auto_123355 ) ) ( not ( = ?auto_123352 ?auto_123359 ) ) ( not ( = ?auto_123353 ?auto_123357 ) ) ( not ( = ?auto_123353 ?auto_123355 ) ) ( not ( = ?auto_123353 ?auto_123359 ) ) ( not ( = ?auto_123356 ?auto_123357 ) ) ( not ( = ?auto_123356 ?auto_123355 ) ) ( not ( = ?auto_123356 ?auto_123359 ) ) ( not ( = ?auto_123354 ?auto_123357 ) ) ( not ( = ?auto_123354 ?auto_123355 ) ) ( not ( = ?auto_123354 ?auto_123359 ) ) ( ON ?auto_123358 ?auto_123354 ) ( ON ?auto_123357 ?auto_123358 ) ( CLEAR ?auto_123357 ) ( HOLDING ?auto_123359 ) ( CLEAR ?auto_123355 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123355 ?auto_123359 )
      ( MAKE-2PILE ?auto_123352 ?auto_123353 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123360 - BLOCK
      ?auto_123361 - BLOCK
    )
    :vars
    (
      ?auto_123363 - BLOCK
      ?auto_123367 - BLOCK
      ?auto_123365 - BLOCK
      ?auto_123366 - BLOCK
      ?auto_123364 - BLOCK
      ?auto_123362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123363 ?auto_123361 ) ( ON-TABLE ?auto_123360 ) ( ON ?auto_123361 ?auto_123360 ) ( not ( = ?auto_123360 ?auto_123361 ) ) ( not ( = ?auto_123360 ?auto_123363 ) ) ( not ( = ?auto_123361 ?auto_123363 ) ) ( not ( = ?auto_123360 ?auto_123367 ) ) ( not ( = ?auto_123360 ?auto_123365 ) ) ( not ( = ?auto_123361 ?auto_123367 ) ) ( not ( = ?auto_123361 ?auto_123365 ) ) ( not ( = ?auto_123363 ?auto_123367 ) ) ( not ( = ?auto_123363 ?auto_123365 ) ) ( not ( = ?auto_123367 ?auto_123365 ) ) ( ON ?auto_123367 ?auto_123363 ) ( ON-TABLE ?auto_123366 ) ( not ( = ?auto_123366 ?auto_123364 ) ) ( not ( = ?auto_123366 ?auto_123362 ) ) ( not ( = ?auto_123366 ?auto_123365 ) ) ( not ( = ?auto_123364 ?auto_123362 ) ) ( not ( = ?auto_123364 ?auto_123365 ) ) ( not ( = ?auto_123362 ?auto_123365 ) ) ( not ( = ?auto_123360 ?auto_123362 ) ) ( not ( = ?auto_123360 ?auto_123366 ) ) ( not ( = ?auto_123360 ?auto_123364 ) ) ( not ( = ?auto_123361 ?auto_123362 ) ) ( not ( = ?auto_123361 ?auto_123366 ) ) ( not ( = ?auto_123361 ?auto_123364 ) ) ( not ( = ?auto_123363 ?auto_123362 ) ) ( not ( = ?auto_123363 ?auto_123366 ) ) ( not ( = ?auto_123363 ?auto_123364 ) ) ( not ( = ?auto_123367 ?auto_123362 ) ) ( not ( = ?auto_123367 ?auto_123366 ) ) ( not ( = ?auto_123367 ?auto_123364 ) ) ( ON ?auto_123365 ?auto_123367 ) ( ON ?auto_123362 ?auto_123365 ) ( CLEAR ?auto_123366 ) ( ON ?auto_123364 ?auto_123362 ) ( CLEAR ?auto_123364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123360 ?auto_123361 ?auto_123363 ?auto_123367 ?auto_123365 ?auto_123362 )
      ( MAKE-2PILE ?auto_123360 ?auto_123361 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123368 - BLOCK
      ?auto_123369 - BLOCK
    )
    :vars
    (
      ?auto_123373 - BLOCK
      ?auto_123375 - BLOCK
      ?auto_123371 - BLOCK
      ?auto_123370 - BLOCK
      ?auto_123374 - BLOCK
      ?auto_123372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123373 ?auto_123369 ) ( ON-TABLE ?auto_123368 ) ( ON ?auto_123369 ?auto_123368 ) ( not ( = ?auto_123368 ?auto_123369 ) ) ( not ( = ?auto_123368 ?auto_123373 ) ) ( not ( = ?auto_123369 ?auto_123373 ) ) ( not ( = ?auto_123368 ?auto_123375 ) ) ( not ( = ?auto_123368 ?auto_123371 ) ) ( not ( = ?auto_123369 ?auto_123375 ) ) ( not ( = ?auto_123369 ?auto_123371 ) ) ( not ( = ?auto_123373 ?auto_123375 ) ) ( not ( = ?auto_123373 ?auto_123371 ) ) ( not ( = ?auto_123375 ?auto_123371 ) ) ( ON ?auto_123375 ?auto_123373 ) ( not ( = ?auto_123370 ?auto_123374 ) ) ( not ( = ?auto_123370 ?auto_123372 ) ) ( not ( = ?auto_123370 ?auto_123371 ) ) ( not ( = ?auto_123374 ?auto_123372 ) ) ( not ( = ?auto_123374 ?auto_123371 ) ) ( not ( = ?auto_123372 ?auto_123371 ) ) ( not ( = ?auto_123368 ?auto_123372 ) ) ( not ( = ?auto_123368 ?auto_123370 ) ) ( not ( = ?auto_123368 ?auto_123374 ) ) ( not ( = ?auto_123369 ?auto_123372 ) ) ( not ( = ?auto_123369 ?auto_123370 ) ) ( not ( = ?auto_123369 ?auto_123374 ) ) ( not ( = ?auto_123373 ?auto_123372 ) ) ( not ( = ?auto_123373 ?auto_123370 ) ) ( not ( = ?auto_123373 ?auto_123374 ) ) ( not ( = ?auto_123375 ?auto_123372 ) ) ( not ( = ?auto_123375 ?auto_123370 ) ) ( not ( = ?auto_123375 ?auto_123374 ) ) ( ON ?auto_123371 ?auto_123375 ) ( ON ?auto_123372 ?auto_123371 ) ( ON ?auto_123374 ?auto_123372 ) ( CLEAR ?auto_123374 ) ( HOLDING ?auto_123370 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_123370 )
      ( MAKE-2PILE ?auto_123368 ?auto_123369 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123386 - BLOCK
      ?auto_123387 - BLOCK
    )
    :vars
    (
      ?auto_123391 - BLOCK
      ?auto_123389 - BLOCK
      ?auto_123392 - BLOCK
      ?auto_123393 - BLOCK
      ?auto_123388 - BLOCK
      ?auto_123390 - BLOCK
      ?auto_123394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123391 ?auto_123387 ) ( ON-TABLE ?auto_123386 ) ( ON ?auto_123387 ?auto_123386 ) ( not ( = ?auto_123386 ?auto_123387 ) ) ( not ( = ?auto_123386 ?auto_123391 ) ) ( not ( = ?auto_123387 ?auto_123391 ) ) ( not ( = ?auto_123386 ?auto_123389 ) ) ( not ( = ?auto_123386 ?auto_123392 ) ) ( not ( = ?auto_123387 ?auto_123389 ) ) ( not ( = ?auto_123387 ?auto_123392 ) ) ( not ( = ?auto_123391 ?auto_123389 ) ) ( not ( = ?auto_123391 ?auto_123392 ) ) ( not ( = ?auto_123389 ?auto_123392 ) ) ( ON ?auto_123389 ?auto_123391 ) ( not ( = ?auto_123393 ?auto_123388 ) ) ( not ( = ?auto_123393 ?auto_123390 ) ) ( not ( = ?auto_123393 ?auto_123392 ) ) ( not ( = ?auto_123388 ?auto_123390 ) ) ( not ( = ?auto_123388 ?auto_123392 ) ) ( not ( = ?auto_123390 ?auto_123392 ) ) ( not ( = ?auto_123386 ?auto_123390 ) ) ( not ( = ?auto_123386 ?auto_123393 ) ) ( not ( = ?auto_123386 ?auto_123388 ) ) ( not ( = ?auto_123387 ?auto_123390 ) ) ( not ( = ?auto_123387 ?auto_123393 ) ) ( not ( = ?auto_123387 ?auto_123388 ) ) ( not ( = ?auto_123391 ?auto_123390 ) ) ( not ( = ?auto_123391 ?auto_123393 ) ) ( not ( = ?auto_123391 ?auto_123388 ) ) ( not ( = ?auto_123389 ?auto_123390 ) ) ( not ( = ?auto_123389 ?auto_123393 ) ) ( not ( = ?auto_123389 ?auto_123388 ) ) ( ON ?auto_123392 ?auto_123389 ) ( ON ?auto_123390 ?auto_123392 ) ( ON ?auto_123388 ?auto_123390 ) ( CLEAR ?auto_123388 ) ( ON ?auto_123393 ?auto_123394 ) ( CLEAR ?auto_123393 ) ( HAND-EMPTY ) ( not ( = ?auto_123386 ?auto_123394 ) ) ( not ( = ?auto_123387 ?auto_123394 ) ) ( not ( = ?auto_123391 ?auto_123394 ) ) ( not ( = ?auto_123389 ?auto_123394 ) ) ( not ( = ?auto_123392 ?auto_123394 ) ) ( not ( = ?auto_123393 ?auto_123394 ) ) ( not ( = ?auto_123388 ?auto_123394 ) ) ( not ( = ?auto_123390 ?auto_123394 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_123393 ?auto_123394 )
      ( MAKE-2PILE ?auto_123386 ?auto_123387 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123395 - BLOCK
      ?auto_123396 - BLOCK
    )
    :vars
    (
      ?auto_123400 - BLOCK
      ?auto_123399 - BLOCK
      ?auto_123403 - BLOCK
      ?auto_123401 - BLOCK
      ?auto_123398 - BLOCK
      ?auto_123402 - BLOCK
      ?auto_123397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123400 ?auto_123396 ) ( ON-TABLE ?auto_123395 ) ( ON ?auto_123396 ?auto_123395 ) ( not ( = ?auto_123395 ?auto_123396 ) ) ( not ( = ?auto_123395 ?auto_123400 ) ) ( not ( = ?auto_123396 ?auto_123400 ) ) ( not ( = ?auto_123395 ?auto_123399 ) ) ( not ( = ?auto_123395 ?auto_123403 ) ) ( not ( = ?auto_123396 ?auto_123399 ) ) ( not ( = ?auto_123396 ?auto_123403 ) ) ( not ( = ?auto_123400 ?auto_123399 ) ) ( not ( = ?auto_123400 ?auto_123403 ) ) ( not ( = ?auto_123399 ?auto_123403 ) ) ( ON ?auto_123399 ?auto_123400 ) ( not ( = ?auto_123401 ?auto_123398 ) ) ( not ( = ?auto_123401 ?auto_123402 ) ) ( not ( = ?auto_123401 ?auto_123403 ) ) ( not ( = ?auto_123398 ?auto_123402 ) ) ( not ( = ?auto_123398 ?auto_123403 ) ) ( not ( = ?auto_123402 ?auto_123403 ) ) ( not ( = ?auto_123395 ?auto_123402 ) ) ( not ( = ?auto_123395 ?auto_123401 ) ) ( not ( = ?auto_123395 ?auto_123398 ) ) ( not ( = ?auto_123396 ?auto_123402 ) ) ( not ( = ?auto_123396 ?auto_123401 ) ) ( not ( = ?auto_123396 ?auto_123398 ) ) ( not ( = ?auto_123400 ?auto_123402 ) ) ( not ( = ?auto_123400 ?auto_123401 ) ) ( not ( = ?auto_123400 ?auto_123398 ) ) ( not ( = ?auto_123399 ?auto_123402 ) ) ( not ( = ?auto_123399 ?auto_123401 ) ) ( not ( = ?auto_123399 ?auto_123398 ) ) ( ON ?auto_123403 ?auto_123399 ) ( ON ?auto_123402 ?auto_123403 ) ( ON ?auto_123401 ?auto_123397 ) ( CLEAR ?auto_123401 ) ( not ( = ?auto_123395 ?auto_123397 ) ) ( not ( = ?auto_123396 ?auto_123397 ) ) ( not ( = ?auto_123400 ?auto_123397 ) ) ( not ( = ?auto_123399 ?auto_123397 ) ) ( not ( = ?auto_123403 ?auto_123397 ) ) ( not ( = ?auto_123401 ?auto_123397 ) ) ( not ( = ?auto_123398 ?auto_123397 ) ) ( not ( = ?auto_123402 ?auto_123397 ) ) ( HOLDING ?auto_123398 ) ( CLEAR ?auto_123402 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123395 ?auto_123396 ?auto_123400 ?auto_123399 ?auto_123403 ?auto_123402 ?auto_123398 )
      ( MAKE-2PILE ?auto_123395 ?auto_123396 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123404 - BLOCK
      ?auto_123405 - BLOCK
    )
    :vars
    (
      ?auto_123408 - BLOCK
      ?auto_123407 - BLOCK
      ?auto_123411 - BLOCK
      ?auto_123409 - BLOCK
      ?auto_123406 - BLOCK
      ?auto_123410 - BLOCK
      ?auto_123412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123408 ?auto_123405 ) ( ON-TABLE ?auto_123404 ) ( ON ?auto_123405 ?auto_123404 ) ( not ( = ?auto_123404 ?auto_123405 ) ) ( not ( = ?auto_123404 ?auto_123408 ) ) ( not ( = ?auto_123405 ?auto_123408 ) ) ( not ( = ?auto_123404 ?auto_123407 ) ) ( not ( = ?auto_123404 ?auto_123411 ) ) ( not ( = ?auto_123405 ?auto_123407 ) ) ( not ( = ?auto_123405 ?auto_123411 ) ) ( not ( = ?auto_123408 ?auto_123407 ) ) ( not ( = ?auto_123408 ?auto_123411 ) ) ( not ( = ?auto_123407 ?auto_123411 ) ) ( ON ?auto_123407 ?auto_123408 ) ( not ( = ?auto_123409 ?auto_123406 ) ) ( not ( = ?auto_123409 ?auto_123410 ) ) ( not ( = ?auto_123409 ?auto_123411 ) ) ( not ( = ?auto_123406 ?auto_123410 ) ) ( not ( = ?auto_123406 ?auto_123411 ) ) ( not ( = ?auto_123410 ?auto_123411 ) ) ( not ( = ?auto_123404 ?auto_123410 ) ) ( not ( = ?auto_123404 ?auto_123409 ) ) ( not ( = ?auto_123404 ?auto_123406 ) ) ( not ( = ?auto_123405 ?auto_123410 ) ) ( not ( = ?auto_123405 ?auto_123409 ) ) ( not ( = ?auto_123405 ?auto_123406 ) ) ( not ( = ?auto_123408 ?auto_123410 ) ) ( not ( = ?auto_123408 ?auto_123409 ) ) ( not ( = ?auto_123408 ?auto_123406 ) ) ( not ( = ?auto_123407 ?auto_123410 ) ) ( not ( = ?auto_123407 ?auto_123409 ) ) ( not ( = ?auto_123407 ?auto_123406 ) ) ( ON ?auto_123411 ?auto_123407 ) ( ON ?auto_123410 ?auto_123411 ) ( ON ?auto_123409 ?auto_123412 ) ( not ( = ?auto_123404 ?auto_123412 ) ) ( not ( = ?auto_123405 ?auto_123412 ) ) ( not ( = ?auto_123408 ?auto_123412 ) ) ( not ( = ?auto_123407 ?auto_123412 ) ) ( not ( = ?auto_123411 ?auto_123412 ) ) ( not ( = ?auto_123409 ?auto_123412 ) ) ( not ( = ?auto_123406 ?auto_123412 ) ) ( not ( = ?auto_123410 ?auto_123412 ) ) ( CLEAR ?auto_123410 ) ( ON ?auto_123406 ?auto_123409 ) ( CLEAR ?auto_123406 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_123412 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123412 ?auto_123409 )
      ( MAKE-2PILE ?auto_123404 ?auto_123405 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123413 - BLOCK
      ?auto_123414 - BLOCK
    )
    :vars
    (
      ?auto_123415 - BLOCK
      ?auto_123419 - BLOCK
      ?auto_123420 - BLOCK
      ?auto_123417 - BLOCK
      ?auto_123418 - BLOCK
      ?auto_123421 - BLOCK
      ?auto_123416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123415 ?auto_123414 ) ( ON-TABLE ?auto_123413 ) ( ON ?auto_123414 ?auto_123413 ) ( not ( = ?auto_123413 ?auto_123414 ) ) ( not ( = ?auto_123413 ?auto_123415 ) ) ( not ( = ?auto_123414 ?auto_123415 ) ) ( not ( = ?auto_123413 ?auto_123419 ) ) ( not ( = ?auto_123413 ?auto_123420 ) ) ( not ( = ?auto_123414 ?auto_123419 ) ) ( not ( = ?auto_123414 ?auto_123420 ) ) ( not ( = ?auto_123415 ?auto_123419 ) ) ( not ( = ?auto_123415 ?auto_123420 ) ) ( not ( = ?auto_123419 ?auto_123420 ) ) ( ON ?auto_123419 ?auto_123415 ) ( not ( = ?auto_123417 ?auto_123418 ) ) ( not ( = ?auto_123417 ?auto_123421 ) ) ( not ( = ?auto_123417 ?auto_123420 ) ) ( not ( = ?auto_123418 ?auto_123421 ) ) ( not ( = ?auto_123418 ?auto_123420 ) ) ( not ( = ?auto_123421 ?auto_123420 ) ) ( not ( = ?auto_123413 ?auto_123421 ) ) ( not ( = ?auto_123413 ?auto_123417 ) ) ( not ( = ?auto_123413 ?auto_123418 ) ) ( not ( = ?auto_123414 ?auto_123421 ) ) ( not ( = ?auto_123414 ?auto_123417 ) ) ( not ( = ?auto_123414 ?auto_123418 ) ) ( not ( = ?auto_123415 ?auto_123421 ) ) ( not ( = ?auto_123415 ?auto_123417 ) ) ( not ( = ?auto_123415 ?auto_123418 ) ) ( not ( = ?auto_123419 ?auto_123421 ) ) ( not ( = ?auto_123419 ?auto_123417 ) ) ( not ( = ?auto_123419 ?auto_123418 ) ) ( ON ?auto_123420 ?auto_123419 ) ( ON ?auto_123417 ?auto_123416 ) ( not ( = ?auto_123413 ?auto_123416 ) ) ( not ( = ?auto_123414 ?auto_123416 ) ) ( not ( = ?auto_123415 ?auto_123416 ) ) ( not ( = ?auto_123419 ?auto_123416 ) ) ( not ( = ?auto_123420 ?auto_123416 ) ) ( not ( = ?auto_123417 ?auto_123416 ) ) ( not ( = ?auto_123418 ?auto_123416 ) ) ( not ( = ?auto_123421 ?auto_123416 ) ) ( ON ?auto_123418 ?auto_123417 ) ( CLEAR ?auto_123418 ) ( ON-TABLE ?auto_123416 ) ( HOLDING ?auto_123421 ) ( CLEAR ?auto_123420 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123413 ?auto_123414 ?auto_123415 ?auto_123419 ?auto_123420 ?auto_123421 )
      ( MAKE-2PILE ?auto_123413 ?auto_123414 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123422 - BLOCK
      ?auto_123423 - BLOCK
    )
    :vars
    (
      ?auto_123424 - BLOCK
      ?auto_123430 - BLOCK
      ?auto_123428 - BLOCK
      ?auto_123427 - BLOCK
      ?auto_123425 - BLOCK
      ?auto_123429 - BLOCK
      ?auto_123426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123424 ?auto_123423 ) ( ON-TABLE ?auto_123422 ) ( ON ?auto_123423 ?auto_123422 ) ( not ( = ?auto_123422 ?auto_123423 ) ) ( not ( = ?auto_123422 ?auto_123424 ) ) ( not ( = ?auto_123423 ?auto_123424 ) ) ( not ( = ?auto_123422 ?auto_123430 ) ) ( not ( = ?auto_123422 ?auto_123428 ) ) ( not ( = ?auto_123423 ?auto_123430 ) ) ( not ( = ?auto_123423 ?auto_123428 ) ) ( not ( = ?auto_123424 ?auto_123430 ) ) ( not ( = ?auto_123424 ?auto_123428 ) ) ( not ( = ?auto_123430 ?auto_123428 ) ) ( ON ?auto_123430 ?auto_123424 ) ( not ( = ?auto_123427 ?auto_123425 ) ) ( not ( = ?auto_123427 ?auto_123429 ) ) ( not ( = ?auto_123427 ?auto_123428 ) ) ( not ( = ?auto_123425 ?auto_123429 ) ) ( not ( = ?auto_123425 ?auto_123428 ) ) ( not ( = ?auto_123429 ?auto_123428 ) ) ( not ( = ?auto_123422 ?auto_123429 ) ) ( not ( = ?auto_123422 ?auto_123427 ) ) ( not ( = ?auto_123422 ?auto_123425 ) ) ( not ( = ?auto_123423 ?auto_123429 ) ) ( not ( = ?auto_123423 ?auto_123427 ) ) ( not ( = ?auto_123423 ?auto_123425 ) ) ( not ( = ?auto_123424 ?auto_123429 ) ) ( not ( = ?auto_123424 ?auto_123427 ) ) ( not ( = ?auto_123424 ?auto_123425 ) ) ( not ( = ?auto_123430 ?auto_123429 ) ) ( not ( = ?auto_123430 ?auto_123427 ) ) ( not ( = ?auto_123430 ?auto_123425 ) ) ( ON ?auto_123428 ?auto_123430 ) ( ON ?auto_123427 ?auto_123426 ) ( not ( = ?auto_123422 ?auto_123426 ) ) ( not ( = ?auto_123423 ?auto_123426 ) ) ( not ( = ?auto_123424 ?auto_123426 ) ) ( not ( = ?auto_123430 ?auto_123426 ) ) ( not ( = ?auto_123428 ?auto_123426 ) ) ( not ( = ?auto_123427 ?auto_123426 ) ) ( not ( = ?auto_123425 ?auto_123426 ) ) ( not ( = ?auto_123429 ?auto_123426 ) ) ( ON ?auto_123425 ?auto_123427 ) ( ON-TABLE ?auto_123426 ) ( CLEAR ?auto_123428 ) ( ON ?auto_123429 ?auto_123425 ) ( CLEAR ?auto_123429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123426 ?auto_123427 ?auto_123425 )
      ( MAKE-2PILE ?auto_123422 ?auto_123423 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123480 - BLOCK
      ?auto_123481 - BLOCK
      ?auto_123482 - BLOCK
      ?auto_123483 - BLOCK
      ?auto_123484 - BLOCK
      ?auto_123485 - BLOCK
    )
    :vars
    (
      ?auto_123486 - BLOCK
      ?auto_123487 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123480 ) ( ON ?auto_123481 ?auto_123480 ) ( ON ?auto_123482 ?auto_123481 ) ( ON ?auto_123483 ?auto_123482 ) ( not ( = ?auto_123480 ?auto_123481 ) ) ( not ( = ?auto_123480 ?auto_123482 ) ) ( not ( = ?auto_123480 ?auto_123483 ) ) ( not ( = ?auto_123480 ?auto_123484 ) ) ( not ( = ?auto_123480 ?auto_123485 ) ) ( not ( = ?auto_123481 ?auto_123482 ) ) ( not ( = ?auto_123481 ?auto_123483 ) ) ( not ( = ?auto_123481 ?auto_123484 ) ) ( not ( = ?auto_123481 ?auto_123485 ) ) ( not ( = ?auto_123482 ?auto_123483 ) ) ( not ( = ?auto_123482 ?auto_123484 ) ) ( not ( = ?auto_123482 ?auto_123485 ) ) ( not ( = ?auto_123483 ?auto_123484 ) ) ( not ( = ?auto_123483 ?auto_123485 ) ) ( not ( = ?auto_123484 ?auto_123485 ) ) ( ON ?auto_123485 ?auto_123486 ) ( not ( = ?auto_123480 ?auto_123486 ) ) ( not ( = ?auto_123481 ?auto_123486 ) ) ( not ( = ?auto_123482 ?auto_123486 ) ) ( not ( = ?auto_123483 ?auto_123486 ) ) ( not ( = ?auto_123484 ?auto_123486 ) ) ( not ( = ?auto_123485 ?auto_123486 ) ) ( CLEAR ?auto_123483 ) ( ON ?auto_123484 ?auto_123485 ) ( CLEAR ?auto_123484 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_123487 ) ( ON ?auto_123486 ?auto_123487 ) ( not ( = ?auto_123487 ?auto_123486 ) ) ( not ( = ?auto_123487 ?auto_123485 ) ) ( not ( = ?auto_123487 ?auto_123484 ) ) ( not ( = ?auto_123480 ?auto_123487 ) ) ( not ( = ?auto_123481 ?auto_123487 ) ) ( not ( = ?auto_123482 ?auto_123487 ) ) ( not ( = ?auto_123483 ?auto_123487 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123487 ?auto_123486 ?auto_123485 )
      ( MAKE-6PILE ?auto_123480 ?auto_123481 ?auto_123482 ?auto_123483 ?auto_123484 ?auto_123485 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123488 - BLOCK
      ?auto_123489 - BLOCK
      ?auto_123490 - BLOCK
      ?auto_123491 - BLOCK
      ?auto_123492 - BLOCK
      ?auto_123493 - BLOCK
    )
    :vars
    (
      ?auto_123494 - BLOCK
      ?auto_123495 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123488 ) ( ON ?auto_123489 ?auto_123488 ) ( ON ?auto_123490 ?auto_123489 ) ( not ( = ?auto_123488 ?auto_123489 ) ) ( not ( = ?auto_123488 ?auto_123490 ) ) ( not ( = ?auto_123488 ?auto_123491 ) ) ( not ( = ?auto_123488 ?auto_123492 ) ) ( not ( = ?auto_123488 ?auto_123493 ) ) ( not ( = ?auto_123489 ?auto_123490 ) ) ( not ( = ?auto_123489 ?auto_123491 ) ) ( not ( = ?auto_123489 ?auto_123492 ) ) ( not ( = ?auto_123489 ?auto_123493 ) ) ( not ( = ?auto_123490 ?auto_123491 ) ) ( not ( = ?auto_123490 ?auto_123492 ) ) ( not ( = ?auto_123490 ?auto_123493 ) ) ( not ( = ?auto_123491 ?auto_123492 ) ) ( not ( = ?auto_123491 ?auto_123493 ) ) ( not ( = ?auto_123492 ?auto_123493 ) ) ( ON ?auto_123493 ?auto_123494 ) ( not ( = ?auto_123488 ?auto_123494 ) ) ( not ( = ?auto_123489 ?auto_123494 ) ) ( not ( = ?auto_123490 ?auto_123494 ) ) ( not ( = ?auto_123491 ?auto_123494 ) ) ( not ( = ?auto_123492 ?auto_123494 ) ) ( not ( = ?auto_123493 ?auto_123494 ) ) ( ON ?auto_123492 ?auto_123493 ) ( CLEAR ?auto_123492 ) ( ON-TABLE ?auto_123495 ) ( ON ?auto_123494 ?auto_123495 ) ( not ( = ?auto_123495 ?auto_123494 ) ) ( not ( = ?auto_123495 ?auto_123493 ) ) ( not ( = ?auto_123495 ?auto_123492 ) ) ( not ( = ?auto_123488 ?auto_123495 ) ) ( not ( = ?auto_123489 ?auto_123495 ) ) ( not ( = ?auto_123490 ?auto_123495 ) ) ( not ( = ?auto_123491 ?auto_123495 ) ) ( HOLDING ?auto_123491 ) ( CLEAR ?auto_123490 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123488 ?auto_123489 ?auto_123490 ?auto_123491 )
      ( MAKE-6PILE ?auto_123488 ?auto_123489 ?auto_123490 ?auto_123491 ?auto_123492 ?auto_123493 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123496 - BLOCK
      ?auto_123497 - BLOCK
      ?auto_123498 - BLOCK
      ?auto_123499 - BLOCK
      ?auto_123500 - BLOCK
      ?auto_123501 - BLOCK
    )
    :vars
    (
      ?auto_123502 - BLOCK
      ?auto_123503 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123496 ) ( ON ?auto_123497 ?auto_123496 ) ( ON ?auto_123498 ?auto_123497 ) ( not ( = ?auto_123496 ?auto_123497 ) ) ( not ( = ?auto_123496 ?auto_123498 ) ) ( not ( = ?auto_123496 ?auto_123499 ) ) ( not ( = ?auto_123496 ?auto_123500 ) ) ( not ( = ?auto_123496 ?auto_123501 ) ) ( not ( = ?auto_123497 ?auto_123498 ) ) ( not ( = ?auto_123497 ?auto_123499 ) ) ( not ( = ?auto_123497 ?auto_123500 ) ) ( not ( = ?auto_123497 ?auto_123501 ) ) ( not ( = ?auto_123498 ?auto_123499 ) ) ( not ( = ?auto_123498 ?auto_123500 ) ) ( not ( = ?auto_123498 ?auto_123501 ) ) ( not ( = ?auto_123499 ?auto_123500 ) ) ( not ( = ?auto_123499 ?auto_123501 ) ) ( not ( = ?auto_123500 ?auto_123501 ) ) ( ON ?auto_123501 ?auto_123502 ) ( not ( = ?auto_123496 ?auto_123502 ) ) ( not ( = ?auto_123497 ?auto_123502 ) ) ( not ( = ?auto_123498 ?auto_123502 ) ) ( not ( = ?auto_123499 ?auto_123502 ) ) ( not ( = ?auto_123500 ?auto_123502 ) ) ( not ( = ?auto_123501 ?auto_123502 ) ) ( ON ?auto_123500 ?auto_123501 ) ( ON-TABLE ?auto_123503 ) ( ON ?auto_123502 ?auto_123503 ) ( not ( = ?auto_123503 ?auto_123502 ) ) ( not ( = ?auto_123503 ?auto_123501 ) ) ( not ( = ?auto_123503 ?auto_123500 ) ) ( not ( = ?auto_123496 ?auto_123503 ) ) ( not ( = ?auto_123497 ?auto_123503 ) ) ( not ( = ?auto_123498 ?auto_123503 ) ) ( not ( = ?auto_123499 ?auto_123503 ) ) ( CLEAR ?auto_123498 ) ( ON ?auto_123499 ?auto_123500 ) ( CLEAR ?auto_123499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123503 ?auto_123502 ?auto_123501 ?auto_123500 )
      ( MAKE-6PILE ?auto_123496 ?auto_123497 ?auto_123498 ?auto_123499 ?auto_123500 ?auto_123501 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123504 - BLOCK
      ?auto_123505 - BLOCK
      ?auto_123506 - BLOCK
      ?auto_123507 - BLOCK
      ?auto_123508 - BLOCK
      ?auto_123509 - BLOCK
    )
    :vars
    (
      ?auto_123511 - BLOCK
      ?auto_123510 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123504 ) ( ON ?auto_123505 ?auto_123504 ) ( not ( = ?auto_123504 ?auto_123505 ) ) ( not ( = ?auto_123504 ?auto_123506 ) ) ( not ( = ?auto_123504 ?auto_123507 ) ) ( not ( = ?auto_123504 ?auto_123508 ) ) ( not ( = ?auto_123504 ?auto_123509 ) ) ( not ( = ?auto_123505 ?auto_123506 ) ) ( not ( = ?auto_123505 ?auto_123507 ) ) ( not ( = ?auto_123505 ?auto_123508 ) ) ( not ( = ?auto_123505 ?auto_123509 ) ) ( not ( = ?auto_123506 ?auto_123507 ) ) ( not ( = ?auto_123506 ?auto_123508 ) ) ( not ( = ?auto_123506 ?auto_123509 ) ) ( not ( = ?auto_123507 ?auto_123508 ) ) ( not ( = ?auto_123507 ?auto_123509 ) ) ( not ( = ?auto_123508 ?auto_123509 ) ) ( ON ?auto_123509 ?auto_123511 ) ( not ( = ?auto_123504 ?auto_123511 ) ) ( not ( = ?auto_123505 ?auto_123511 ) ) ( not ( = ?auto_123506 ?auto_123511 ) ) ( not ( = ?auto_123507 ?auto_123511 ) ) ( not ( = ?auto_123508 ?auto_123511 ) ) ( not ( = ?auto_123509 ?auto_123511 ) ) ( ON ?auto_123508 ?auto_123509 ) ( ON-TABLE ?auto_123510 ) ( ON ?auto_123511 ?auto_123510 ) ( not ( = ?auto_123510 ?auto_123511 ) ) ( not ( = ?auto_123510 ?auto_123509 ) ) ( not ( = ?auto_123510 ?auto_123508 ) ) ( not ( = ?auto_123504 ?auto_123510 ) ) ( not ( = ?auto_123505 ?auto_123510 ) ) ( not ( = ?auto_123506 ?auto_123510 ) ) ( not ( = ?auto_123507 ?auto_123510 ) ) ( ON ?auto_123507 ?auto_123508 ) ( CLEAR ?auto_123507 ) ( HOLDING ?auto_123506 ) ( CLEAR ?auto_123505 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123504 ?auto_123505 ?auto_123506 )
      ( MAKE-6PILE ?auto_123504 ?auto_123505 ?auto_123506 ?auto_123507 ?auto_123508 ?auto_123509 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123512 - BLOCK
      ?auto_123513 - BLOCK
      ?auto_123514 - BLOCK
      ?auto_123515 - BLOCK
      ?auto_123516 - BLOCK
      ?auto_123517 - BLOCK
    )
    :vars
    (
      ?auto_123519 - BLOCK
      ?auto_123518 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123512 ) ( ON ?auto_123513 ?auto_123512 ) ( not ( = ?auto_123512 ?auto_123513 ) ) ( not ( = ?auto_123512 ?auto_123514 ) ) ( not ( = ?auto_123512 ?auto_123515 ) ) ( not ( = ?auto_123512 ?auto_123516 ) ) ( not ( = ?auto_123512 ?auto_123517 ) ) ( not ( = ?auto_123513 ?auto_123514 ) ) ( not ( = ?auto_123513 ?auto_123515 ) ) ( not ( = ?auto_123513 ?auto_123516 ) ) ( not ( = ?auto_123513 ?auto_123517 ) ) ( not ( = ?auto_123514 ?auto_123515 ) ) ( not ( = ?auto_123514 ?auto_123516 ) ) ( not ( = ?auto_123514 ?auto_123517 ) ) ( not ( = ?auto_123515 ?auto_123516 ) ) ( not ( = ?auto_123515 ?auto_123517 ) ) ( not ( = ?auto_123516 ?auto_123517 ) ) ( ON ?auto_123517 ?auto_123519 ) ( not ( = ?auto_123512 ?auto_123519 ) ) ( not ( = ?auto_123513 ?auto_123519 ) ) ( not ( = ?auto_123514 ?auto_123519 ) ) ( not ( = ?auto_123515 ?auto_123519 ) ) ( not ( = ?auto_123516 ?auto_123519 ) ) ( not ( = ?auto_123517 ?auto_123519 ) ) ( ON ?auto_123516 ?auto_123517 ) ( ON-TABLE ?auto_123518 ) ( ON ?auto_123519 ?auto_123518 ) ( not ( = ?auto_123518 ?auto_123519 ) ) ( not ( = ?auto_123518 ?auto_123517 ) ) ( not ( = ?auto_123518 ?auto_123516 ) ) ( not ( = ?auto_123512 ?auto_123518 ) ) ( not ( = ?auto_123513 ?auto_123518 ) ) ( not ( = ?auto_123514 ?auto_123518 ) ) ( not ( = ?auto_123515 ?auto_123518 ) ) ( ON ?auto_123515 ?auto_123516 ) ( CLEAR ?auto_123513 ) ( ON ?auto_123514 ?auto_123515 ) ( CLEAR ?auto_123514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123518 ?auto_123519 ?auto_123517 ?auto_123516 ?auto_123515 )
      ( MAKE-6PILE ?auto_123512 ?auto_123513 ?auto_123514 ?auto_123515 ?auto_123516 ?auto_123517 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123520 - BLOCK
      ?auto_123521 - BLOCK
      ?auto_123522 - BLOCK
      ?auto_123523 - BLOCK
      ?auto_123524 - BLOCK
      ?auto_123525 - BLOCK
    )
    :vars
    (
      ?auto_123527 - BLOCK
      ?auto_123526 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123520 ) ( not ( = ?auto_123520 ?auto_123521 ) ) ( not ( = ?auto_123520 ?auto_123522 ) ) ( not ( = ?auto_123520 ?auto_123523 ) ) ( not ( = ?auto_123520 ?auto_123524 ) ) ( not ( = ?auto_123520 ?auto_123525 ) ) ( not ( = ?auto_123521 ?auto_123522 ) ) ( not ( = ?auto_123521 ?auto_123523 ) ) ( not ( = ?auto_123521 ?auto_123524 ) ) ( not ( = ?auto_123521 ?auto_123525 ) ) ( not ( = ?auto_123522 ?auto_123523 ) ) ( not ( = ?auto_123522 ?auto_123524 ) ) ( not ( = ?auto_123522 ?auto_123525 ) ) ( not ( = ?auto_123523 ?auto_123524 ) ) ( not ( = ?auto_123523 ?auto_123525 ) ) ( not ( = ?auto_123524 ?auto_123525 ) ) ( ON ?auto_123525 ?auto_123527 ) ( not ( = ?auto_123520 ?auto_123527 ) ) ( not ( = ?auto_123521 ?auto_123527 ) ) ( not ( = ?auto_123522 ?auto_123527 ) ) ( not ( = ?auto_123523 ?auto_123527 ) ) ( not ( = ?auto_123524 ?auto_123527 ) ) ( not ( = ?auto_123525 ?auto_123527 ) ) ( ON ?auto_123524 ?auto_123525 ) ( ON-TABLE ?auto_123526 ) ( ON ?auto_123527 ?auto_123526 ) ( not ( = ?auto_123526 ?auto_123527 ) ) ( not ( = ?auto_123526 ?auto_123525 ) ) ( not ( = ?auto_123526 ?auto_123524 ) ) ( not ( = ?auto_123520 ?auto_123526 ) ) ( not ( = ?auto_123521 ?auto_123526 ) ) ( not ( = ?auto_123522 ?auto_123526 ) ) ( not ( = ?auto_123523 ?auto_123526 ) ) ( ON ?auto_123523 ?auto_123524 ) ( ON ?auto_123522 ?auto_123523 ) ( CLEAR ?auto_123522 ) ( HOLDING ?auto_123521 ) ( CLEAR ?auto_123520 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123520 ?auto_123521 )
      ( MAKE-6PILE ?auto_123520 ?auto_123521 ?auto_123522 ?auto_123523 ?auto_123524 ?auto_123525 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123528 - BLOCK
      ?auto_123529 - BLOCK
      ?auto_123530 - BLOCK
      ?auto_123531 - BLOCK
      ?auto_123532 - BLOCK
      ?auto_123533 - BLOCK
    )
    :vars
    (
      ?auto_123535 - BLOCK
      ?auto_123534 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123528 ) ( not ( = ?auto_123528 ?auto_123529 ) ) ( not ( = ?auto_123528 ?auto_123530 ) ) ( not ( = ?auto_123528 ?auto_123531 ) ) ( not ( = ?auto_123528 ?auto_123532 ) ) ( not ( = ?auto_123528 ?auto_123533 ) ) ( not ( = ?auto_123529 ?auto_123530 ) ) ( not ( = ?auto_123529 ?auto_123531 ) ) ( not ( = ?auto_123529 ?auto_123532 ) ) ( not ( = ?auto_123529 ?auto_123533 ) ) ( not ( = ?auto_123530 ?auto_123531 ) ) ( not ( = ?auto_123530 ?auto_123532 ) ) ( not ( = ?auto_123530 ?auto_123533 ) ) ( not ( = ?auto_123531 ?auto_123532 ) ) ( not ( = ?auto_123531 ?auto_123533 ) ) ( not ( = ?auto_123532 ?auto_123533 ) ) ( ON ?auto_123533 ?auto_123535 ) ( not ( = ?auto_123528 ?auto_123535 ) ) ( not ( = ?auto_123529 ?auto_123535 ) ) ( not ( = ?auto_123530 ?auto_123535 ) ) ( not ( = ?auto_123531 ?auto_123535 ) ) ( not ( = ?auto_123532 ?auto_123535 ) ) ( not ( = ?auto_123533 ?auto_123535 ) ) ( ON ?auto_123532 ?auto_123533 ) ( ON-TABLE ?auto_123534 ) ( ON ?auto_123535 ?auto_123534 ) ( not ( = ?auto_123534 ?auto_123535 ) ) ( not ( = ?auto_123534 ?auto_123533 ) ) ( not ( = ?auto_123534 ?auto_123532 ) ) ( not ( = ?auto_123528 ?auto_123534 ) ) ( not ( = ?auto_123529 ?auto_123534 ) ) ( not ( = ?auto_123530 ?auto_123534 ) ) ( not ( = ?auto_123531 ?auto_123534 ) ) ( ON ?auto_123531 ?auto_123532 ) ( ON ?auto_123530 ?auto_123531 ) ( CLEAR ?auto_123528 ) ( ON ?auto_123529 ?auto_123530 ) ( CLEAR ?auto_123529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123534 ?auto_123535 ?auto_123533 ?auto_123532 ?auto_123531 ?auto_123530 )
      ( MAKE-6PILE ?auto_123528 ?auto_123529 ?auto_123530 ?auto_123531 ?auto_123532 ?auto_123533 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123536 - BLOCK
      ?auto_123537 - BLOCK
      ?auto_123538 - BLOCK
      ?auto_123539 - BLOCK
      ?auto_123540 - BLOCK
      ?auto_123541 - BLOCK
    )
    :vars
    (
      ?auto_123542 - BLOCK
      ?auto_123543 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123536 ?auto_123537 ) ) ( not ( = ?auto_123536 ?auto_123538 ) ) ( not ( = ?auto_123536 ?auto_123539 ) ) ( not ( = ?auto_123536 ?auto_123540 ) ) ( not ( = ?auto_123536 ?auto_123541 ) ) ( not ( = ?auto_123537 ?auto_123538 ) ) ( not ( = ?auto_123537 ?auto_123539 ) ) ( not ( = ?auto_123537 ?auto_123540 ) ) ( not ( = ?auto_123537 ?auto_123541 ) ) ( not ( = ?auto_123538 ?auto_123539 ) ) ( not ( = ?auto_123538 ?auto_123540 ) ) ( not ( = ?auto_123538 ?auto_123541 ) ) ( not ( = ?auto_123539 ?auto_123540 ) ) ( not ( = ?auto_123539 ?auto_123541 ) ) ( not ( = ?auto_123540 ?auto_123541 ) ) ( ON ?auto_123541 ?auto_123542 ) ( not ( = ?auto_123536 ?auto_123542 ) ) ( not ( = ?auto_123537 ?auto_123542 ) ) ( not ( = ?auto_123538 ?auto_123542 ) ) ( not ( = ?auto_123539 ?auto_123542 ) ) ( not ( = ?auto_123540 ?auto_123542 ) ) ( not ( = ?auto_123541 ?auto_123542 ) ) ( ON ?auto_123540 ?auto_123541 ) ( ON-TABLE ?auto_123543 ) ( ON ?auto_123542 ?auto_123543 ) ( not ( = ?auto_123543 ?auto_123542 ) ) ( not ( = ?auto_123543 ?auto_123541 ) ) ( not ( = ?auto_123543 ?auto_123540 ) ) ( not ( = ?auto_123536 ?auto_123543 ) ) ( not ( = ?auto_123537 ?auto_123543 ) ) ( not ( = ?auto_123538 ?auto_123543 ) ) ( not ( = ?auto_123539 ?auto_123543 ) ) ( ON ?auto_123539 ?auto_123540 ) ( ON ?auto_123538 ?auto_123539 ) ( ON ?auto_123537 ?auto_123538 ) ( CLEAR ?auto_123537 ) ( HOLDING ?auto_123536 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_123536 )
      ( MAKE-6PILE ?auto_123536 ?auto_123537 ?auto_123538 ?auto_123539 ?auto_123540 ?auto_123541 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123544 - BLOCK
      ?auto_123545 - BLOCK
      ?auto_123546 - BLOCK
      ?auto_123547 - BLOCK
      ?auto_123548 - BLOCK
      ?auto_123549 - BLOCK
    )
    :vars
    (
      ?auto_123550 - BLOCK
      ?auto_123551 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123544 ?auto_123545 ) ) ( not ( = ?auto_123544 ?auto_123546 ) ) ( not ( = ?auto_123544 ?auto_123547 ) ) ( not ( = ?auto_123544 ?auto_123548 ) ) ( not ( = ?auto_123544 ?auto_123549 ) ) ( not ( = ?auto_123545 ?auto_123546 ) ) ( not ( = ?auto_123545 ?auto_123547 ) ) ( not ( = ?auto_123545 ?auto_123548 ) ) ( not ( = ?auto_123545 ?auto_123549 ) ) ( not ( = ?auto_123546 ?auto_123547 ) ) ( not ( = ?auto_123546 ?auto_123548 ) ) ( not ( = ?auto_123546 ?auto_123549 ) ) ( not ( = ?auto_123547 ?auto_123548 ) ) ( not ( = ?auto_123547 ?auto_123549 ) ) ( not ( = ?auto_123548 ?auto_123549 ) ) ( ON ?auto_123549 ?auto_123550 ) ( not ( = ?auto_123544 ?auto_123550 ) ) ( not ( = ?auto_123545 ?auto_123550 ) ) ( not ( = ?auto_123546 ?auto_123550 ) ) ( not ( = ?auto_123547 ?auto_123550 ) ) ( not ( = ?auto_123548 ?auto_123550 ) ) ( not ( = ?auto_123549 ?auto_123550 ) ) ( ON ?auto_123548 ?auto_123549 ) ( ON-TABLE ?auto_123551 ) ( ON ?auto_123550 ?auto_123551 ) ( not ( = ?auto_123551 ?auto_123550 ) ) ( not ( = ?auto_123551 ?auto_123549 ) ) ( not ( = ?auto_123551 ?auto_123548 ) ) ( not ( = ?auto_123544 ?auto_123551 ) ) ( not ( = ?auto_123545 ?auto_123551 ) ) ( not ( = ?auto_123546 ?auto_123551 ) ) ( not ( = ?auto_123547 ?auto_123551 ) ) ( ON ?auto_123547 ?auto_123548 ) ( ON ?auto_123546 ?auto_123547 ) ( ON ?auto_123545 ?auto_123546 ) ( ON ?auto_123544 ?auto_123545 ) ( CLEAR ?auto_123544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123551 ?auto_123550 ?auto_123549 ?auto_123548 ?auto_123547 ?auto_123546 ?auto_123545 )
      ( MAKE-6PILE ?auto_123544 ?auto_123545 ?auto_123546 ?auto_123547 ?auto_123548 ?auto_123549 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123558 - BLOCK
      ?auto_123559 - BLOCK
      ?auto_123560 - BLOCK
      ?auto_123561 - BLOCK
      ?auto_123562 - BLOCK
      ?auto_123563 - BLOCK
    )
    :vars
    (
      ?auto_123564 - BLOCK
      ?auto_123565 - BLOCK
      ?auto_123566 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123558 ?auto_123559 ) ) ( not ( = ?auto_123558 ?auto_123560 ) ) ( not ( = ?auto_123558 ?auto_123561 ) ) ( not ( = ?auto_123558 ?auto_123562 ) ) ( not ( = ?auto_123558 ?auto_123563 ) ) ( not ( = ?auto_123559 ?auto_123560 ) ) ( not ( = ?auto_123559 ?auto_123561 ) ) ( not ( = ?auto_123559 ?auto_123562 ) ) ( not ( = ?auto_123559 ?auto_123563 ) ) ( not ( = ?auto_123560 ?auto_123561 ) ) ( not ( = ?auto_123560 ?auto_123562 ) ) ( not ( = ?auto_123560 ?auto_123563 ) ) ( not ( = ?auto_123561 ?auto_123562 ) ) ( not ( = ?auto_123561 ?auto_123563 ) ) ( not ( = ?auto_123562 ?auto_123563 ) ) ( ON ?auto_123563 ?auto_123564 ) ( not ( = ?auto_123558 ?auto_123564 ) ) ( not ( = ?auto_123559 ?auto_123564 ) ) ( not ( = ?auto_123560 ?auto_123564 ) ) ( not ( = ?auto_123561 ?auto_123564 ) ) ( not ( = ?auto_123562 ?auto_123564 ) ) ( not ( = ?auto_123563 ?auto_123564 ) ) ( ON ?auto_123562 ?auto_123563 ) ( ON-TABLE ?auto_123565 ) ( ON ?auto_123564 ?auto_123565 ) ( not ( = ?auto_123565 ?auto_123564 ) ) ( not ( = ?auto_123565 ?auto_123563 ) ) ( not ( = ?auto_123565 ?auto_123562 ) ) ( not ( = ?auto_123558 ?auto_123565 ) ) ( not ( = ?auto_123559 ?auto_123565 ) ) ( not ( = ?auto_123560 ?auto_123565 ) ) ( not ( = ?auto_123561 ?auto_123565 ) ) ( ON ?auto_123561 ?auto_123562 ) ( ON ?auto_123560 ?auto_123561 ) ( ON ?auto_123559 ?auto_123560 ) ( CLEAR ?auto_123559 ) ( ON ?auto_123558 ?auto_123566 ) ( CLEAR ?auto_123558 ) ( HAND-EMPTY ) ( not ( = ?auto_123558 ?auto_123566 ) ) ( not ( = ?auto_123559 ?auto_123566 ) ) ( not ( = ?auto_123560 ?auto_123566 ) ) ( not ( = ?auto_123561 ?auto_123566 ) ) ( not ( = ?auto_123562 ?auto_123566 ) ) ( not ( = ?auto_123563 ?auto_123566 ) ) ( not ( = ?auto_123564 ?auto_123566 ) ) ( not ( = ?auto_123565 ?auto_123566 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_123558 ?auto_123566 )
      ( MAKE-6PILE ?auto_123558 ?auto_123559 ?auto_123560 ?auto_123561 ?auto_123562 ?auto_123563 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123567 - BLOCK
      ?auto_123568 - BLOCK
      ?auto_123569 - BLOCK
      ?auto_123570 - BLOCK
      ?auto_123571 - BLOCK
      ?auto_123572 - BLOCK
    )
    :vars
    (
      ?auto_123573 - BLOCK
      ?auto_123574 - BLOCK
      ?auto_123575 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123567 ?auto_123568 ) ) ( not ( = ?auto_123567 ?auto_123569 ) ) ( not ( = ?auto_123567 ?auto_123570 ) ) ( not ( = ?auto_123567 ?auto_123571 ) ) ( not ( = ?auto_123567 ?auto_123572 ) ) ( not ( = ?auto_123568 ?auto_123569 ) ) ( not ( = ?auto_123568 ?auto_123570 ) ) ( not ( = ?auto_123568 ?auto_123571 ) ) ( not ( = ?auto_123568 ?auto_123572 ) ) ( not ( = ?auto_123569 ?auto_123570 ) ) ( not ( = ?auto_123569 ?auto_123571 ) ) ( not ( = ?auto_123569 ?auto_123572 ) ) ( not ( = ?auto_123570 ?auto_123571 ) ) ( not ( = ?auto_123570 ?auto_123572 ) ) ( not ( = ?auto_123571 ?auto_123572 ) ) ( ON ?auto_123572 ?auto_123573 ) ( not ( = ?auto_123567 ?auto_123573 ) ) ( not ( = ?auto_123568 ?auto_123573 ) ) ( not ( = ?auto_123569 ?auto_123573 ) ) ( not ( = ?auto_123570 ?auto_123573 ) ) ( not ( = ?auto_123571 ?auto_123573 ) ) ( not ( = ?auto_123572 ?auto_123573 ) ) ( ON ?auto_123571 ?auto_123572 ) ( ON-TABLE ?auto_123574 ) ( ON ?auto_123573 ?auto_123574 ) ( not ( = ?auto_123574 ?auto_123573 ) ) ( not ( = ?auto_123574 ?auto_123572 ) ) ( not ( = ?auto_123574 ?auto_123571 ) ) ( not ( = ?auto_123567 ?auto_123574 ) ) ( not ( = ?auto_123568 ?auto_123574 ) ) ( not ( = ?auto_123569 ?auto_123574 ) ) ( not ( = ?auto_123570 ?auto_123574 ) ) ( ON ?auto_123570 ?auto_123571 ) ( ON ?auto_123569 ?auto_123570 ) ( ON ?auto_123567 ?auto_123575 ) ( CLEAR ?auto_123567 ) ( not ( = ?auto_123567 ?auto_123575 ) ) ( not ( = ?auto_123568 ?auto_123575 ) ) ( not ( = ?auto_123569 ?auto_123575 ) ) ( not ( = ?auto_123570 ?auto_123575 ) ) ( not ( = ?auto_123571 ?auto_123575 ) ) ( not ( = ?auto_123572 ?auto_123575 ) ) ( not ( = ?auto_123573 ?auto_123575 ) ) ( not ( = ?auto_123574 ?auto_123575 ) ) ( HOLDING ?auto_123568 ) ( CLEAR ?auto_123569 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123574 ?auto_123573 ?auto_123572 ?auto_123571 ?auto_123570 ?auto_123569 ?auto_123568 )
      ( MAKE-6PILE ?auto_123567 ?auto_123568 ?auto_123569 ?auto_123570 ?auto_123571 ?auto_123572 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123576 - BLOCK
      ?auto_123577 - BLOCK
      ?auto_123578 - BLOCK
      ?auto_123579 - BLOCK
      ?auto_123580 - BLOCK
      ?auto_123581 - BLOCK
    )
    :vars
    (
      ?auto_123584 - BLOCK
      ?auto_123583 - BLOCK
      ?auto_123582 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123576 ?auto_123577 ) ) ( not ( = ?auto_123576 ?auto_123578 ) ) ( not ( = ?auto_123576 ?auto_123579 ) ) ( not ( = ?auto_123576 ?auto_123580 ) ) ( not ( = ?auto_123576 ?auto_123581 ) ) ( not ( = ?auto_123577 ?auto_123578 ) ) ( not ( = ?auto_123577 ?auto_123579 ) ) ( not ( = ?auto_123577 ?auto_123580 ) ) ( not ( = ?auto_123577 ?auto_123581 ) ) ( not ( = ?auto_123578 ?auto_123579 ) ) ( not ( = ?auto_123578 ?auto_123580 ) ) ( not ( = ?auto_123578 ?auto_123581 ) ) ( not ( = ?auto_123579 ?auto_123580 ) ) ( not ( = ?auto_123579 ?auto_123581 ) ) ( not ( = ?auto_123580 ?auto_123581 ) ) ( ON ?auto_123581 ?auto_123584 ) ( not ( = ?auto_123576 ?auto_123584 ) ) ( not ( = ?auto_123577 ?auto_123584 ) ) ( not ( = ?auto_123578 ?auto_123584 ) ) ( not ( = ?auto_123579 ?auto_123584 ) ) ( not ( = ?auto_123580 ?auto_123584 ) ) ( not ( = ?auto_123581 ?auto_123584 ) ) ( ON ?auto_123580 ?auto_123581 ) ( ON-TABLE ?auto_123583 ) ( ON ?auto_123584 ?auto_123583 ) ( not ( = ?auto_123583 ?auto_123584 ) ) ( not ( = ?auto_123583 ?auto_123581 ) ) ( not ( = ?auto_123583 ?auto_123580 ) ) ( not ( = ?auto_123576 ?auto_123583 ) ) ( not ( = ?auto_123577 ?auto_123583 ) ) ( not ( = ?auto_123578 ?auto_123583 ) ) ( not ( = ?auto_123579 ?auto_123583 ) ) ( ON ?auto_123579 ?auto_123580 ) ( ON ?auto_123578 ?auto_123579 ) ( ON ?auto_123576 ?auto_123582 ) ( not ( = ?auto_123576 ?auto_123582 ) ) ( not ( = ?auto_123577 ?auto_123582 ) ) ( not ( = ?auto_123578 ?auto_123582 ) ) ( not ( = ?auto_123579 ?auto_123582 ) ) ( not ( = ?auto_123580 ?auto_123582 ) ) ( not ( = ?auto_123581 ?auto_123582 ) ) ( not ( = ?auto_123584 ?auto_123582 ) ) ( not ( = ?auto_123583 ?auto_123582 ) ) ( CLEAR ?auto_123578 ) ( ON ?auto_123577 ?auto_123576 ) ( CLEAR ?auto_123577 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_123582 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123582 ?auto_123576 )
      ( MAKE-6PILE ?auto_123576 ?auto_123577 ?auto_123578 ?auto_123579 ?auto_123580 ?auto_123581 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123585 - BLOCK
      ?auto_123586 - BLOCK
      ?auto_123587 - BLOCK
      ?auto_123588 - BLOCK
      ?auto_123589 - BLOCK
      ?auto_123590 - BLOCK
    )
    :vars
    (
      ?auto_123591 - BLOCK
      ?auto_123593 - BLOCK
      ?auto_123592 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123585 ?auto_123586 ) ) ( not ( = ?auto_123585 ?auto_123587 ) ) ( not ( = ?auto_123585 ?auto_123588 ) ) ( not ( = ?auto_123585 ?auto_123589 ) ) ( not ( = ?auto_123585 ?auto_123590 ) ) ( not ( = ?auto_123586 ?auto_123587 ) ) ( not ( = ?auto_123586 ?auto_123588 ) ) ( not ( = ?auto_123586 ?auto_123589 ) ) ( not ( = ?auto_123586 ?auto_123590 ) ) ( not ( = ?auto_123587 ?auto_123588 ) ) ( not ( = ?auto_123587 ?auto_123589 ) ) ( not ( = ?auto_123587 ?auto_123590 ) ) ( not ( = ?auto_123588 ?auto_123589 ) ) ( not ( = ?auto_123588 ?auto_123590 ) ) ( not ( = ?auto_123589 ?auto_123590 ) ) ( ON ?auto_123590 ?auto_123591 ) ( not ( = ?auto_123585 ?auto_123591 ) ) ( not ( = ?auto_123586 ?auto_123591 ) ) ( not ( = ?auto_123587 ?auto_123591 ) ) ( not ( = ?auto_123588 ?auto_123591 ) ) ( not ( = ?auto_123589 ?auto_123591 ) ) ( not ( = ?auto_123590 ?auto_123591 ) ) ( ON ?auto_123589 ?auto_123590 ) ( ON-TABLE ?auto_123593 ) ( ON ?auto_123591 ?auto_123593 ) ( not ( = ?auto_123593 ?auto_123591 ) ) ( not ( = ?auto_123593 ?auto_123590 ) ) ( not ( = ?auto_123593 ?auto_123589 ) ) ( not ( = ?auto_123585 ?auto_123593 ) ) ( not ( = ?auto_123586 ?auto_123593 ) ) ( not ( = ?auto_123587 ?auto_123593 ) ) ( not ( = ?auto_123588 ?auto_123593 ) ) ( ON ?auto_123588 ?auto_123589 ) ( ON ?auto_123585 ?auto_123592 ) ( not ( = ?auto_123585 ?auto_123592 ) ) ( not ( = ?auto_123586 ?auto_123592 ) ) ( not ( = ?auto_123587 ?auto_123592 ) ) ( not ( = ?auto_123588 ?auto_123592 ) ) ( not ( = ?auto_123589 ?auto_123592 ) ) ( not ( = ?auto_123590 ?auto_123592 ) ) ( not ( = ?auto_123591 ?auto_123592 ) ) ( not ( = ?auto_123593 ?auto_123592 ) ) ( ON ?auto_123586 ?auto_123585 ) ( CLEAR ?auto_123586 ) ( ON-TABLE ?auto_123592 ) ( HOLDING ?auto_123587 ) ( CLEAR ?auto_123588 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123593 ?auto_123591 ?auto_123590 ?auto_123589 ?auto_123588 ?auto_123587 )
      ( MAKE-6PILE ?auto_123585 ?auto_123586 ?auto_123587 ?auto_123588 ?auto_123589 ?auto_123590 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123594 - BLOCK
      ?auto_123595 - BLOCK
      ?auto_123596 - BLOCK
      ?auto_123597 - BLOCK
      ?auto_123598 - BLOCK
      ?auto_123599 - BLOCK
    )
    :vars
    (
      ?auto_123602 - BLOCK
      ?auto_123600 - BLOCK
      ?auto_123601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123594 ?auto_123595 ) ) ( not ( = ?auto_123594 ?auto_123596 ) ) ( not ( = ?auto_123594 ?auto_123597 ) ) ( not ( = ?auto_123594 ?auto_123598 ) ) ( not ( = ?auto_123594 ?auto_123599 ) ) ( not ( = ?auto_123595 ?auto_123596 ) ) ( not ( = ?auto_123595 ?auto_123597 ) ) ( not ( = ?auto_123595 ?auto_123598 ) ) ( not ( = ?auto_123595 ?auto_123599 ) ) ( not ( = ?auto_123596 ?auto_123597 ) ) ( not ( = ?auto_123596 ?auto_123598 ) ) ( not ( = ?auto_123596 ?auto_123599 ) ) ( not ( = ?auto_123597 ?auto_123598 ) ) ( not ( = ?auto_123597 ?auto_123599 ) ) ( not ( = ?auto_123598 ?auto_123599 ) ) ( ON ?auto_123599 ?auto_123602 ) ( not ( = ?auto_123594 ?auto_123602 ) ) ( not ( = ?auto_123595 ?auto_123602 ) ) ( not ( = ?auto_123596 ?auto_123602 ) ) ( not ( = ?auto_123597 ?auto_123602 ) ) ( not ( = ?auto_123598 ?auto_123602 ) ) ( not ( = ?auto_123599 ?auto_123602 ) ) ( ON ?auto_123598 ?auto_123599 ) ( ON-TABLE ?auto_123600 ) ( ON ?auto_123602 ?auto_123600 ) ( not ( = ?auto_123600 ?auto_123602 ) ) ( not ( = ?auto_123600 ?auto_123599 ) ) ( not ( = ?auto_123600 ?auto_123598 ) ) ( not ( = ?auto_123594 ?auto_123600 ) ) ( not ( = ?auto_123595 ?auto_123600 ) ) ( not ( = ?auto_123596 ?auto_123600 ) ) ( not ( = ?auto_123597 ?auto_123600 ) ) ( ON ?auto_123597 ?auto_123598 ) ( ON ?auto_123594 ?auto_123601 ) ( not ( = ?auto_123594 ?auto_123601 ) ) ( not ( = ?auto_123595 ?auto_123601 ) ) ( not ( = ?auto_123596 ?auto_123601 ) ) ( not ( = ?auto_123597 ?auto_123601 ) ) ( not ( = ?auto_123598 ?auto_123601 ) ) ( not ( = ?auto_123599 ?auto_123601 ) ) ( not ( = ?auto_123602 ?auto_123601 ) ) ( not ( = ?auto_123600 ?auto_123601 ) ) ( ON ?auto_123595 ?auto_123594 ) ( ON-TABLE ?auto_123601 ) ( CLEAR ?auto_123597 ) ( ON ?auto_123596 ?auto_123595 ) ( CLEAR ?auto_123596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123601 ?auto_123594 ?auto_123595 )
      ( MAKE-6PILE ?auto_123594 ?auto_123595 ?auto_123596 ?auto_123597 ?auto_123598 ?auto_123599 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123603 - BLOCK
      ?auto_123604 - BLOCK
      ?auto_123605 - BLOCK
      ?auto_123606 - BLOCK
      ?auto_123607 - BLOCK
      ?auto_123608 - BLOCK
    )
    :vars
    (
      ?auto_123610 - BLOCK
      ?auto_123611 - BLOCK
      ?auto_123609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123603 ?auto_123604 ) ) ( not ( = ?auto_123603 ?auto_123605 ) ) ( not ( = ?auto_123603 ?auto_123606 ) ) ( not ( = ?auto_123603 ?auto_123607 ) ) ( not ( = ?auto_123603 ?auto_123608 ) ) ( not ( = ?auto_123604 ?auto_123605 ) ) ( not ( = ?auto_123604 ?auto_123606 ) ) ( not ( = ?auto_123604 ?auto_123607 ) ) ( not ( = ?auto_123604 ?auto_123608 ) ) ( not ( = ?auto_123605 ?auto_123606 ) ) ( not ( = ?auto_123605 ?auto_123607 ) ) ( not ( = ?auto_123605 ?auto_123608 ) ) ( not ( = ?auto_123606 ?auto_123607 ) ) ( not ( = ?auto_123606 ?auto_123608 ) ) ( not ( = ?auto_123607 ?auto_123608 ) ) ( ON ?auto_123608 ?auto_123610 ) ( not ( = ?auto_123603 ?auto_123610 ) ) ( not ( = ?auto_123604 ?auto_123610 ) ) ( not ( = ?auto_123605 ?auto_123610 ) ) ( not ( = ?auto_123606 ?auto_123610 ) ) ( not ( = ?auto_123607 ?auto_123610 ) ) ( not ( = ?auto_123608 ?auto_123610 ) ) ( ON ?auto_123607 ?auto_123608 ) ( ON-TABLE ?auto_123611 ) ( ON ?auto_123610 ?auto_123611 ) ( not ( = ?auto_123611 ?auto_123610 ) ) ( not ( = ?auto_123611 ?auto_123608 ) ) ( not ( = ?auto_123611 ?auto_123607 ) ) ( not ( = ?auto_123603 ?auto_123611 ) ) ( not ( = ?auto_123604 ?auto_123611 ) ) ( not ( = ?auto_123605 ?auto_123611 ) ) ( not ( = ?auto_123606 ?auto_123611 ) ) ( ON ?auto_123603 ?auto_123609 ) ( not ( = ?auto_123603 ?auto_123609 ) ) ( not ( = ?auto_123604 ?auto_123609 ) ) ( not ( = ?auto_123605 ?auto_123609 ) ) ( not ( = ?auto_123606 ?auto_123609 ) ) ( not ( = ?auto_123607 ?auto_123609 ) ) ( not ( = ?auto_123608 ?auto_123609 ) ) ( not ( = ?auto_123610 ?auto_123609 ) ) ( not ( = ?auto_123611 ?auto_123609 ) ) ( ON ?auto_123604 ?auto_123603 ) ( ON-TABLE ?auto_123609 ) ( ON ?auto_123605 ?auto_123604 ) ( CLEAR ?auto_123605 ) ( HOLDING ?auto_123606 ) ( CLEAR ?auto_123607 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123611 ?auto_123610 ?auto_123608 ?auto_123607 ?auto_123606 )
      ( MAKE-6PILE ?auto_123603 ?auto_123604 ?auto_123605 ?auto_123606 ?auto_123607 ?auto_123608 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123612 - BLOCK
      ?auto_123613 - BLOCK
      ?auto_123614 - BLOCK
      ?auto_123615 - BLOCK
      ?auto_123616 - BLOCK
      ?auto_123617 - BLOCK
    )
    :vars
    (
      ?auto_123620 - BLOCK
      ?auto_123619 - BLOCK
      ?auto_123618 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123612 ?auto_123613 ) ) ( not ( = ?auto_123612 ?auto_123614 ) ) ( not ( = ?auto_123612 ?auto_123615 ) ) ( not ( = ?auto_123612 ?auto_123616 ) ) ( not ( = ?auto_123612 ?auto_123617 ) ) ( not ( = ?auto_123613 ?auto_123614 ) ) ( not ( = ?auto_123613 ?auto_123615 ) ) ( not ( = ?auto_123613 ?auto_123616 ) ) ( not ( = ?auto_123613 ?auto_123617 ) ) ( not ( = ?auto_123614 ?auto_123615 ) ) ( not ( = ?auto_123614 ?auto_123616 ) ) ( not ( = ?auto_123614 ?auto_123617 ) ) ( not ( = ?auto_123615 ?auto_123616 ) ) ( not ( = ?auto_123615 ?auto_123617 ) ) ( not ( = ?auto_123616 ?auto_123617 ) ) ( ON ?auto_123617 ?auto_123620 ) ( not ( = ?auto_123612 ?auto_123620 ) ) ( not ( = ?auto_123613 ?auto_123620 ) ) ( not ( = ?auto_123614 ?auto_123620 ) ) ( not ( = ?auto_123615 ?auto_123620 ) ) ( not ( = ?auto_123616 ?auto_123620 ) ) ( not ( = ?auto_123617 ?auto_123620 ) ) ( ON ?auto_123616 ?auto_123617 ) ( ON-TABLE ?auto_123619 ) ( ON ?auto_123620 ?auto_123619 ) ( not ( = ?auto_123619 ?auto_123620 ) ) ( not ( = ?auto_123619 ?auto_123617 ) ) ( not ( = ?auto_123619 ?auto_123616 ) ) ( not ( = ?auto_123612 ?auto_123619 ) ) ( not ( = ?auto_123613 ?auto_123619 ) ) ( not ( = ?auto_123614 ?auto_123619 ) ) ( not ( = ?auto_123615 ?auto_123619 ) ) ( ON ?auto_123612 ?auto_123618 ) ( not ( = ?auto_123612 ?auto_123618 ) ) ( not ( = ?auto_123613 ?auto_123618 ) ) ( not ( = ?auto_123614 ?auto_123618 ) ) ( not ( = ?auto_123615 ?auto_123618 ) ) ( not ( = ?auto_123616 ?auto_123618 ) ) ( not ( = ?auto_123617 ?auto_123618 ) ) ( not ( = ?auto_123620 ?auto_123618 ) ) ( not ( = ?auto_123619 ?auto_123618 ) ) ( ON ?auto_123613 ?auto_123612 ) ( ON-TABLE ?auto_123618 ) ( ON ?auto_123614 ?auto_123613 ) ( CLEAR ?auto_123616 ) ( ON ?auto_123615 ?auto_123614 ) ( CLEAR ?auto_123615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123618 ?auto_123612 ?auto_123613 ?auto_123614 )
      ( MAKE-6PILE ?auto_123612 ?auto_123613 ?auto_123614 ?auto_123615 ?auto_123616 ?auto_123617 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123621 - BLOCK
      ?auto_123622 - BLOCK
      ?auto_123623 - BLOCK
      ?auto_123624 - BLOCK
      ?auto_123625 - BLOCK
      ?auto_123626 - BLOCK
    )
    :vars
    (
      ?auto_123627 - BLOCK
      ?auto_123629 - BLOCK
      ?auto_123628 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123621 ?auto_123622 ) ) ( not ( = ?auto_123621 ?auto_123623 ) ) ( not ( = ?auto_123621 ?auto_123624 ) ) ( not ( = ?auto_123621 ?auto_123625 ) ) ( not ( = ?auto_123621 ?auto_123626 ) ) ( not ( = ?auto_123622 ?auto_123623 ) ) ( not ( = ?auto_123622 ?auto_123624 ) ) ( not ( = ?auto_123622 ?auto_123625 ) ) ( not ( = ?auto_123622 ?auto_123626 ) ) ( not ( = ?auto_123623 ?auto_123624 ) ) ( not ( = ?auto_123623 ?auto_123625 ) ) ( not ( = ?auto_123623 ?auto_123626 ) ) ( not ( = ?auto_123624 ?auto_123625 ) ) ( not ( = ?auto_123624 ?auto_123626 ) ) ( not ( = ?auto_123625 ?auto_123626 ) ) ( ON ?auto_123626 ?auto_123627 ) ( not ( = ?auto_123621 ?auto_123627 ) ) ( not ( = ?auto_123622 ?auto_123627 ) ) ( not ( = ?auto_123623 ?auto_123627 ) ) ( not ( = ?auto_123624 ?auto_123627 ) ) ( not ( = ?auto_123625 ?auto_123627 ) ) ( not ( = ?auto_123626 ?auto_123627 ) ) ( ON-TABLE ?auto_123629 ) ( ON ?auto_123627 ?auto_123629 ) ( not ( = ?auto_123629 ?auto_123627 ) ) ( not ( = ?auto_123629 ?auto_123626 ) ) ( not ( = ?auto_123629 ?auto_123625 ) ) ( not ( = ?auto_123621 ?auto_123629 ) ) ( not ( = ?auto_123622 ?auto_123629 ) ) ( not ( = ?auto_123623 ?auto_123629 ) ) ( not ( = ?auto_123624 ?auto_123629 ) ) ( ON ?auto_123621 ?auto_123628 ) ( not ( = ?auto_123621 ?auto_123628 ) ) ( not ( = ?auto_123622 ?auto_123628 ) ) ( not ( = ?auto_123623 ?auto_123628 ) ) ( not ( = ?auto_123624 ?auto_123628 ) ) ( not ( = ?auto_123625 ?auto_123628 ) ) ( not ( = ?auto_123626 ?auto_123628 ) ) ( not ( = ?auto_123627 ?auto_123628 ) ) ( not ( = ?auto_123629 ?auto_123628 ) ) ( ON ?auto_123622 ?auto_123621 ) ( ON-TABLE ?auto_123628 ) ( ON ?auto_123623 ?auto_123622 ) ( ON ?auto_123624 ?auto_123623 ) ( CLEAR ?auto_123624 ) ( HOLDING ?auto_123625 ) ( CLEAR ?auto_123626 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123629 ?auto_123627 ?auto_123626 ?auto_123625 )
      ( MAKE-6PILE ?auto_123621 ?auto_123622 ?auto_123623 ?auto_123624 ?auto_123625 ?auto_123626 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123630 - BLOCK
      ?auto_123631 - BLOCK
      ?auto_123632 - BLOCK
      ?auto_123633 - BLOCK
      ?auto_123634 - BLOCK
      ?auto_123635 - BLOCK
    )
    :vars
    (
      ?auto_123636 - BLOCK
      ?auto_123638 - BLOCK
      ?auto_123637 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123630 ?auto_123631 ) ) ( not ( = ?auto_123630 ?auto_123632 ) ) ( not ( = ?auto_123630 ?auto_123633 ) ) ( not ( = ?auto_123630 ?auto_123634 ) ) ( not ( = ?auto_123630 ?auto_123635 ) ) ( not ( = ?auto_123631 ?auto_123632 ) ) ( not ( = ?auto_123631 ?auto_123633 ) ) ( not ( = ?auto_123631 ?auto_123634 ) ) ( not ( = ?auto_123631 ?auto_123635 ) ) ( not ( = ?auto_123632 ?auto_123633 ) ) ( not ( = ?auto_123632 ?auto_123634 ) ) ( not ( = ?auto_123632 ?auto_123635 ) ) ( not ( = ?auto_123633 ?auto_123634 ) ) ( not ( = ?auto_123633 ?auto_123635 ) ) ( not ( = ?auto_123634 ?auto_123635 ) ) ( ON ?auto_123635 ?auto_123636 ) ( not ( = ?auto_123630 ?auto_123636 ) ) ( not ( = ?auto_123631 ?auto_123636 ) ) ( not ( = ?auto_123632 ?auto_123636 ) ) ( not ( = ?auto_123633 ?auto_123636 ) ) ( not ( = ?auto_123634 ?auto_123636 ) ) ( not ( = ?auto_123635 ?auto_123636 ) ) ( ON-TABLE ?auto_123638 ) ( ON ?auto_123636 ?auto_123638 ) ( not ( = ?auto_123638 ?auto_123636 ) ) ( not ( = ?auto_123638 ?auto_123635 ) ) ( not ( = ?auto_123638 ?auto_123634 ) ) ( not ( = ?auto_123630 ?auto_123638 ) ) ( not ( = ?auto_123631 ?auto_123638 ) ) ( not ( = ?auto_123632 ?auto_123638 ) ) ( not ( = ?auto_123633 ?auto_123638 ) ) ( ON ?auto_123630 ?auto_123637 ) ( not ( = ?auto_123630 ?auto_123637 ) ) ( not ( = ?auto_123631 ?auto_123637 ) ) ( not ( = ?auto_123632 ?auto_123637 ) ) ( not ( = ?auto_123633 ?auto_123637 ) ) ( not ( = ?auto_123634 ?auto_123637 ) ) ( not ( = ?auto_123635 ?auto_123637 ) ) ( not ( = ?auto_123636 ?auto_123637 ) ) ( not ( = ?auto_123638 ?auto_123637 ) ) ( ON ?auto_123631 ?auto_123630 ) ( ON-TABLE ?auto_123637 ) ( ON ?auto_123632 ?auto_123631 ) ( ON ?auto_123633 ?auto_123632 ) ( CLEAR ?auto_123635 ) ( ON ?auto_123634 ?auto_123633 ) ( CLEAR ?auto_123634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123637 ?auto_123630 ?auto_123631 ?auto_123632 ?auto_123633 )
      ( MAKE-6PILE ?auto_123630 ?auto_123631 ?auto_123632 ?auto_123633 ?auto_123634 ?auto_123635 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123639 - BLOCK
      ?auto_123640 - BLOCK
      ?auto_123641 - BLOCK
      ?auto_123642 - BLOCK
      ?auto_123643 - BLOCK
      ?auto_123644 - BLOCK
    )
    :vars
    (
      ?auto_123647 - BLOCK
      ?auto_123646 - BLOCK
      ?auto_123645 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123639 ?auto_123640 ) ) ( not ( = ?auto_123639 ?auto_123641 ) ) ( not ( = ?auto_123639 ?auto_123642 ) ) ( not ( = ?auto_123639 ?auto_123643 ) ) ( not ( = ?auto_123639 ?auto_123644 ) ) ( not ( = ?auto_123640 ?auto_123641 ) ) ( not ( = ?auto_123640 ?auto_123642 ) ) ( not ( = ?auto_123640 ?auto_123643 ) ) ( not ( = ?auto_123640 ?auto_123644 ) ) ( not ( = ?auto_123641 ?auto_123642 ) ) ( not ( = ?auto_123641 ?auto_123643 ) ) ( not ( = ?auto_123641 ?auto_123644 ) ) ( not ( = ?auto_123642 ?auto_123643 ) ) ( not ( = ?auto_123642 ?auto_123644 ) ) ( not ( = ?auto_123643 ?auto_123644 ) ) ( not ( = ?auto_123639 ?auto_123647 ) ) ( not ( = ?auto_123640 ?auto_123647 ) ) ( not ( = ?auto_123641 ?auto_123647 ) ) ( not ( = ?auto_123642 ?auto_123647 ) ) ( not ( = ?auto_123643 ?auto_123647 ) ) ( not ( = ?auto_123644 ?auto_123647 ) ) ( ON-TABLE ?auto_123646 ) ( ON ?auto_123647 ?auto_123646 ) ( not ( = ?auto_123646 ?auto_123647 ) ) ( not ( = ?auto_123646 ?auto_123644 ) ) ( not ( = ?auto_123646 ?auto_123643 ) ) ( not ( = ?auto_123639 ?auto_123646 ) ) ( not ( = ?auto_123640 ?auto_123646 ) ) ( not ( = ?auto_123641 ?auto_123646 ) ) ( not ( = ?auto_123642 ?auto_123646 ) ) ( ON ?auto_123639 ?auto_123645 ) ( not ( = ?auto_123639 ?auto_123645 ) ) ( not ( = ?auto_123640 ?auto_123645 ) ) ( not ( = ?auto_123641 ?auto_123645 ) ) ( not ( = ?auto_123642 ?auto_123645 ) ) ( not ( = ?auto_123643 ?auto_123645 ) ) ( not ( = ?auto_123644 ?auto_123645 ) ) ( not ( = ?auto_123647 ?auto_123645 ) ) ( not ( = ?auto_123646 ?auto_123645 ) ) ( ON ?auto_123640 ?auto_123639 ) ( ON-TABLE ?auto_123645 ) ( ON ?auto_123641 ?auto_123640 ) ( ON ?auto_123642 ?auto_123641 ) ( ON ?auto_123643 ?auto_123642 ) ( CLEAR ?auto_123643 ) ( HOLDING ?auto_123644 ) ( CLEAR ?auto_123647 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123646 ?auto_123647 ?auto_123644 )
      ( MAKE-6PILE ?auto_123639 ?auto_123640 ?auto_123641 ?auto_123642 ?auto_123643 ?auto_123644 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123648 - BLOCK
      ?auto_123649 - BLOCK
      ?auto_123650 - BLOCK
      ?auto_123651 - BLOCK
      ?auto_123652 - BLOCK
      ?auto_123653 - BLOCK
    )
    :vars
    (
      ?auto_123654 - BLOCK
      ?auto_123656 - BLOCK
      ?auto_123655 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123648 ?auto_123649 ) ) ( not ( = ?auto_123648 ?auto_123650 ) ) ( not ( = ?auto_123648 ?auto_123651 ) ) ( not ( = ?auto_123648 ?auto_123652 ) ) ( not ( = ?auto_123648 ?auto_123653 ) ) ( not ( = ?auto_123649 ?auto_123650 ) ) ( not ( = ?auto_123649 ?auto_123651 ) ) ( not ( = ?auto_123649 ?auto_123652 ) ) ( not ( = ?auto_123649 ?auto_123653 ) ) ( not ( = ?auto_123650 ?auto_123651 ) ) ( not ( = ?auto_123650 ?auto_123652 ) ) ( not ( = ?auto_123650 ?auto_123653 ) ) ( not ( = ?auto_123651 ?auto_123652 ) ) ( not ( = ?auto_123651 ?auto_123653 ) ) ( not ( = ?auto_123652 ?auto_123653 ) ) ( not ( = ?auto_123648 ?auto_123654 ) ) ( not ( = ?auto_123649 ?auto_123654 ) ) ( not ( = ?auto_123650 ?auto_123654 ) ) ( not ( = ?auto_123651 ?auto_123654 ) ) ( not ( = ?auto_123652 ?auto_123654 ) ) ( not ( = ?auto_123653 ?auto_123654 ) ) ( ON-TABLE ?auto_123656 ) ( ON ?auto_123654 ?auto_123656 ) ( not ( = ?auto_123656 ?auto_123654 ) ) ( not ( = ?auto_123656 ?auto_123653 ) ) ( not ( = ?auto_123656 ?auto_123652 ) ) ( not ( = ?auto_123648 ?auto_123656 ) ) ( not ( = ?auto_123649 ?auto_123656 ) ) ( not ( = ?auto_123650 ?auto_123656 ) ) ( not ( = ?auto_123651 ?auto_123656 ) ) ( ON ?auto_123648 ?auto_123655 ) ( not ( = ?auto_123648 ?auto_123655 ) ) ( not ( = ?auto_123649 ?auto_123655 ) ) ( not ( = ?auto_123650 ?auto_123655 ) ) ( not ( = ?auto_123651 ?auto_123655 ) ) ( not ( = ?auto_123652 ?auto_123655 ) ) ( not ( = ?auto_123653 ?auto_123655 ) ) ( not ( = ?auto_123654 ?auto_123655 ) ) ( not ( = ?auto_123656 ?auto_123655 ) ) ( ON ?auto_123649 ?auto_123648 ) ( ON-TABLE ?auto_123655 ) ( ON ?auto_123650 ?auto_123649 ) ( ON ?auto_123651 ?auto_123650 ) ( ON ?auto_123652 ?auto_123651 ) ( CLEAR ?auto_123654 ) ( ON ?auto_123653 ?auto_123652 ) ( CLEAR ?auto_123653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123655 ?auto_123648 ?auto_123649 ?auto_123650 ?auto_123651 ?auto_123652 )
      ( MAKE-6PILE ?auto_123648 ?auto_123649 ?auto_123650 ?auto_123651 ?auto_123652 ?auto_123653 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123657 - BLOCK
      ?auto_123658 - BLOCK
      ?auto_123659 - BLOCK
      ?auto_123660 - BLOCK
      ?auto_123661 - BLOCK
      ?auto_123662 - BLOCK
    )
    :vars
    (
      ?auto_123664 - BLOCK
      ?auto_123665 - BLOCK
      ?auto_123663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123657 ?auto_123658 ) ) ( not ( = ?auto_123657 ?auto_123659 ) ) ( not ( = ?auto_123657 ?auto_123660 ) ) ( not ( = ?auto_123657 ?auto_123661 ) ) ( not ( = ?auto_123657 ?auto_123662 ) ) ( not ( = ?auto_123658 ?auto_123659 ) ) ( not ( = ?auto_123658 ?auto_123660 ) ) ( not ( = ?auto_123658 ?auto_123661 ) ) ( not ( = ?auto_123658 ?auto_123662 ) ) ( not ( = ?auto_123659 ?auto_123660 ) ) ( not ( = ?auto_123659 ?auto_123661 ) ) ( not ( = ?auto_123659 ?auto_123662 ) ) ( not ( = ?auto_123660 ?auto_123661 ) ) ( not ( = ?auto_123660 ?auto_123662 ) ) ( not ( = ?auto_123661 ?auto_123662 ) ) ( not ( = ?auto_123657 ?auto_123664 ) ) ( not ( = ?auto_123658 ?auto_123664 ) ) ( not ( = ?auto_123659 ?auto_123664 ) ) ( not ( = ?auto_123660 ?auto_123664 ) ) ( not ( = ?auto_123661 ?auto_123664 ) ) ( not ( = ?auto_123662 ?auto_123664 ) ) ( ON-TABLE ?auto_123665 ) ( not ( = ?auto_123665 ?auto_123664 ) ) ( not ( = ?auto_123665 ?auto_123662 ) ) ( not ( = ?auto_123665 ?auto_123661 ) ) ( not ( = ?auto_123657 ?auto_123665 ) ) ( not ( = ?auto_123658 ?auto_123665 ) ) ( not ( = ?auto_123659 ?auto_123665 ) ) ( not ( = ?auto_123660 ?auto_123665 ) ) ( ON ?auto_123657 ?auto_123663 ) ( not ( = ?auto_123657 ?auto_123663 ) ) ( not ( = ?auto_123658 ?auto_123663 ) ) ( not ( = ?auto_123659 ?auto_123663 ) ) ( not ( = ?auto_123660 ?auto_123663 ) ) ( not ( = ?auto_123661 ?auto_123663 ) ) ( not ( = ?auto_123662 ?auto_123663 ) ) ( not ( = ?auto_123664 ?auto_123663 ) ) ( not ( = ?auto_123665 ?auto_123663 ) ) ( ON ?auto_123658 ?auto_123657 ) ( ON-TABLE ?auto_123663 ) ( ON ?auto_123659 ?auto_123658 ) ( ON ?auto_123660 ?auto_123659 ) ( ON ?auto_123661 ?auto_123660 ) ( ON ?auto_123662 ?auto_123661 ) ( CLEAR ?auto_123662 ) ( HOLDING ?auto_123664 ) ( CLEAR ?auto_123665 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123665 ?auto_123664 )
      ( MAKE-6PILE ?auto_123657 ?auto_123658 ?auto_123659 ?auto_123660 ?auto_123661 ?auto_123662 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123666 - BLOCK
      ?auto_123667 - BLOCK
      ?auto_123668 - BLOCK
      ?auto_123669 - BLOCK
      ?auto_123670 - BLOCK
      ?auto_123671 - BLOCK
    )
    :vars
    (
      ?auto_123674 - BLOCK
      ?auto_123673 - BLOCK
      ?auto_123672 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123666 ?auto_123667 ) ) ( not ( = ?auto_123666 ?auto_123668 ) ) ( not ( = ?auto_123666 ?auto_123669 ) ) ( not ( = ?auto_123666 ?auto_123670 ) ) ( not ( = ?auto_123666 ?auto_123671 ) ) ( not ( = ?auto_123667 ?auto_123668 ) ) ( not ( = ?auto_123667 ?auto_123669 ) ) ( not ( = ?auto_123667 ?auto_123670 ) ) ( not ( = ?auto_123667 ?auto_123671 ) ) ( not ( = ?auto_123668 ?auto_123669 ) ) ( not ( = ?auto_123668 ?auto_123670 ) ) ( not ( = ?auto_123668 ?auto_123671 ) ) ( not ( = ?auto_123669 ?auto_123670 ) ) ( not ( = ?auto_123669 ?auto_123671 ) ) ( not ( = ?auto_123670 ?auto_123671 ) ) ( not ( = ?auto_123666 ?auto_123674 ) ) ( not ( = ?auto_123667 ?auto_123674 ) ) ( not ( = ?auto_123668 ?auto_123674 ) ) ( not ( = ?auto_123669 ?auto_123674 ) ) ( not ( = ?auto_123670 ?auto_123674 ) ) ( not ( = ?auto_123671 ?auto_123674 ) ) ( ON-TABLE ?auto_123673 ) ( not ( = ?auto_123673 ?auto_123674 ) ) ( not ( = ?auto_123673 ?auto_123671 ) ) ( not ( = ?auto_123673 ?auto_123670 ) ) ( not ( = ?auto_123666 ?auto_123673 ) ) ( not ( = ?auto_123667 ?auto_123673 ) ) ( not ( = ?auto_123668 ?auto_123673 ) ) ( not ( = ?auto_123669 ?auto_123673 ) ) ( ON ?auto_123666 ?auto_123672 ) ( not ( = ?auto_123666 ?auto_123672 ) ) ( not ( = ?auto_123667 ?auto_123672 ) ) ( not ( = ?auto_123668 ?auto_123672 ) ) ( not ( = ?auto_123669 ?auto_123672 ) ) ( not ( = ?auto_123670 ?auto_123672 ) ) ( not ( = ?auto_123671 ?auto_123672 ) ) ( not ( = ?auto_123674 ?auto_123672 ) ) ( not ( = ?auto_123673 ?auto_123672 ) ) ( ON ?auto_123667 ?auto_123666 ) ( ON-TABLE ?auto_123672 ) ( ON ?auto_123668 ?auto_123667 ) ( ON ?auto_123669 ?auto_123668 ) ( ON ?auto_123670 ?auto_123669 ) ( ON ?auto_123671 ?auto_123670 ) ( CLEAR ?auto_123673 ) ( ON ?auto_123674 ?auto_123671 ) ( CLEAR ?auto_123674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123672 ?auto_123666 ?auto_123667 ?auto_123668 ?auto_123669 ?auto_123670 ?auto_123671 )
      ( MAKE-6PILE ?auto_123666 ?auto_123667 ?auto_123668 ?auto_123669 ?auto_123670 ?auto_123671 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123675 - BLOCK
      ?auto_123676 - BLOCK
      ?auto_123677 - BLOCK
      ?auto_123678 - BLOCK
      ?auto_123679 - BLOCK
      ?auto_123680 - BLOCK
    )
    :vars
    (
      ?auto_123681 - BLOCK
      ?auto_123682 - BLOCK
      ?auto_123683 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123675 ?auto_123676 ) ) ( not ( = ?auto_123675 ?auto_123677 ) ) ( not ( = ?auto_123675 ?auto_123678 ) ) ( not ( = ?auto_123675 ?auto_123679 ) ) ( not ( = ?auto_123675 ?auto_123680 ) ) ( not ( = ?auto_123676 ?auto_123677 ) ) ( not ( = ?auto_123676 ?auto_123678 ) ) ( not ( = ?auto_123676 ?auto_123679 ) ) ( not ( = ?auto_123676 ?auto_123680 ) ) ( not ( = ?auto_123677 ?auto_123678 ) ) ( not ( = ?auto_123677 ?auto_123679 ) ) ( not ( = ?auto_123677 ?auto_123680 ) ) ( not ( = ?auto_123678 ?auto_123679 ) ) ( not ( = ?auto_123678 ?auto_123680 ) ) ( not ( = ?auto_123679 ?auto_123680 ) ) ( not ( = ?auto_123675 ?auto_123681 ) ) ( not ( = ?auto_123676 ?auto_123681 ) ) ( not ( = ?auto_123677 ?auto_123681 ) ) ( not ( = ?auto_123678 ?auto_123681 ) ) ( not ( = ?auto_123679 ?auto_123681 ) ) ( not ( = ?auto_123680 ?auto_123681 ) ) ( not ( = ?auto_123682 ?auto_123681 ) ) ( not ( = ?auto_123682 ?auto_123680 ) ) ( not ( = ?auto_123682 ?auto_123679 ) ) ( not ( = ?auto_123675 ?auto_123682 ) ) ( not ( = ?auto_123676 ?auto_123682 ) ) ( not ( = ?auto_123677 ?auto_123682 ) ) ( not ( = ?auto_123678 ?auto_123682 ) ) ( ON ?auto_123675 ?auto_123683 ) ( not ( = ?auto_123675 ?auto_123683 ) ) ( not ( = ?auto_123676 ?auto_123683 ) ) ( not ( = ?auto_123677 ?auto_123683 ) ) ( not ( = ?auto_123678 ?auto_123683 ) ) ( not ( = ?auto_123679 ?auto_123683 ) ) ( not ( = ?auto_123680 ?auto_123683 ) ) ( not ( = ?auto_123681 ?auto_123683 ) ) ( not ( = ?auto_123682 ?auto_123683 ) ) ( ON ?auto_123676 ?auto_123675 ) ( ON-TABLE ?auto_123683 ) ( ON ?auto_123677 ?auto_123676 ) ( ON ?auto_123678 ?auto_123677 ) ( ON ?auto_123679 ?auto_123678 ) ( ON ?auto_123680 ?auto_123679 ) ( ON ?auto_123681 ?auto_123680 ) ( CLEAR ?auto_123681 ) ( HOLDING ?auto_123682 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_123682 )
      ( MAKE-6PILE ?auto_123675 ?auto_123676 ?auto_123677 ?auto_123678 ?auto_123679 ?auto_123680 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123684 - BLOCK
      ?auto_123685 - BLOCK
      ?auto_123686 - BLOCK
      ?auto_123687 - BLOCK
      ?auto_123688 - BLOCK
      ?auto_123689 - BLOCK
    )
    :vars
    (
      ?auto_123690 - BLOCK
      ?auto_123692 - BLOCK
      ?auto_123691 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123684 ?auto_123685 ) ) ( not ( = ?auto_123684 ?auto_123686 ) ) ( not ( = ?auto_123684 ?auto_123687 ) ) ( not ( = ?auto_123684 ?auto_123688 ) ) ( not ( = ?auto_123684 ?auto_123689 ) ) ( not ( = ?auto_123685 ?auto_123686 ) ) ( not ( = ?auto_123685 ?auto_123687 ) ) ( not ( = ?auto_123685 ?auto_123688 ) ) ( not ( = ?auto_123685 ?auto_123689 ) ) ( not ( = ?auto_123686 ?auto_123687 ) ) ( not ( = ?auto_123686 ?auto_123688 ) ) ( not ( = ?auto_123686 ?auto_123689 ) ) ( not ( = ?auto_123687 ?auto_123688 ) ) ( not ( = ?auto_123687 ?auto_123689 ) ) ( not ( = ?auto_123688 ?auto_123689 ) ) ( not ( = ?auto_123684 ?auto_123690 ) ) ( not ( = ?auto_123685 ?auto_123690 ) ) ( not ( = ?auto_123686 ?auto_123690 ) ) ( not ( = ?auto_123687 ?auto_123690 ) ) ( not ( = ?auto_123688 ?auto_123690 ) ) ( not ( = ?auto_123689 ?auto_123690 ) ) ( not ( = ?auto_123692 ?auto_123690 ) ) ( not ( = ?auto_123692 ?auto_123689 ) ) ( not ( = ?auto_123692 ?auto_123688 ) ) ( not ( = ?auto_123684 ?auto_123692 ) ) ( not ( = ?auto_123685 ?auto_123692 ) ) ( not ( = ?auto_123686 ?auto_123692 ) ) ( not ( = ?auto_123687 ?auto_123692 ) ) ( ON ?auto_123684 ?auto_123691 ) ( not ( = ?auto_123684 ?auto_123691 ) ) ( not ( = ?auto_123685 ?auto_123691 ) ) ( not ( = ?auto_123686 ?auto_123691 ) ) ( not ( = ?auto_123687 ?auto_123691 ) ) ( not ( = ?auto_123688 ?auto_123691 ) ) ( not ( = ?auto_123689 ?auto_123691 ) ) ( not ( = ?auto_123690 ?auto_123691 ) ) ( not ( = ?auto_123692 ?auto_123691 ) ) ( ON ?auto_123685 ?auto_123684 ) ( ON-TABLE ?auto_123691 ) ( ON ?auto_123686 ?auto_123685 ) ( ON ?auto_123687 ?auto_123686 ) ( ON ?auto_123688 ?auto_123687 ) ( ON ?auto_123689 ?auto_123688 ) ( ON ?auto_123690 ?auto_123689 ) ( ON ?auto_123692 ?auto_123690 ) ( CLEAR ?auto_123692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_123691 ?auto_123684 ?auto_123685 ?auto_123686 ?auto_123687 ?auto_123688 ?auto_123689 ?auto_123690 )
      ( MAKE-6PILE ?auto_123684 ?auto_123685 ?auto_123686 ?auto_123687 ?auto_123688 ?auto_123689 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123704 - BLOCK
    )
    :vars
    (
      ?auto_123705 - BLOCK
      ?auto_123707 - BLOCK
      ?auto_123706 - BLOCK
      ?auto_123710 - BLOCK
      ?auto_123711 - BLOCK
      ?auto_123708 - BLOCK
      ?auto_123709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123705 ?auto_123704 ) ( ON-TABLE ?auto_123704 ) ( not ( = ?auto_123704 ?auto_123705 ) ) ( not ( = ?auto_123704 ?auto_123707 ) ) ( not ( = ?auto_123704 ?auto_123706 ) ) ( not ( = ?auto_123705 ?auto_123707 ) ) ( not ( = ?auto_123705 ?auto_123706 ) ) ( not ( = ?auto_123707 ?auto_123706 ) ) ( ON ?auto_123707 ?auto_123705 ) ( CLEAR ?auto_123707 ) ( HOLDING ?auto_123706 ) ( CLEAR ?auto_123710 ) ( ON-TABLE ?auto_123711 ) ( ON ?auto_123708 ?auto_123711 ) ( ON ?auto_123709 ?auto_123708 ) ( ON ?auto_123710 ?auto_123709 ) ( not ( = ?auto_123711 ?auto_123708 ) ) ( not ( = ?auto_123711 ?auto_123709 ) ) ( not ( = ?auto_123711 ?auto_123710 ) ) ( not ( = ?auto_123711 ?auto_123706 ) ) ( not ( = ?auto_123708 ?auto_123709 ) ) ( not ( = ?auto_123708 ?auto_123710 ) ) ( not ( = ?auto_123708 ?auto_123706 ) ) ( not ( = ?auto_123709 ?auto_123710 ) ) ( not ( = ?auto_123709 ?auto_123706 ) ) ( not ( = ?auto_123710 ?auto_123706 ) ) ( not ( = ?auto_123704 ?auto_123710 ) ) ( not ( = ?auto_123704 ?auto_123711 ) ) ( not ( = ?auto_123704 ?auto_123708 ) ) ( not ( = ?auto_123704 ?auto_123709 ) ) ( not ( = ?auto_123705 ?auto_123710 ) ) ( not ( = ?auto_123705 ?auto_123711 ) ) ( not ( = ?auto_123705 ?auto_123708 ) ) ( not ( = ?auto_123705 ?auto_123709 ) ) ( not ( = ?auto_123707 ?auto_123710 ) ) ( not ( = ?auto_123707 ?auto_123711 ) ) ( not ( = ?auto_123707 ?auto_123708 ) ) ( not ( = ?auto_123707 ?auto_123709 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123711 ?auto_123708 ?auto_123709 ?auto_123710 ?auto_123706 )
      ( MAKE-1PILE ?auto_123704 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123712 - BLOCK
    )
    :vars
    (
      ?auto_123714 - BLOCK
      ?auto_123715 - BLOCK
      ?auto_123717 - BLOCK
      ?auto_123713 - BLOCK
      ?auto_123716 - BLOCK
      ?auto_123718 - BLOCK
      ?auto_123719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123714 ?auto_123712 ) ( ON-TABLE ?auto_123712 ) ( not ( = ?auto_123712 ?auto_123714 ) ) ( not ( = ?auto_123712 ?auto_123715 ) ) ( not ( = ?auto_123712 ?auto_123717 ) ) ( not ( = ?auto_123714 ?auto_123715 ) ) ( not ( = ?auto_123714 ?auto_123717 ) ) ( not ( = ?auto_123715 ?auto_123717 ) ) ( ON ?auto_123715 ?auto_123714 ) ( CLEAR ?auto_123713 ) ( ON-TABLE ?auto_123716 ) ( ON ?auto_123718 ?auto_123716 ) ( ON ?auto_123719 ?auto_123718 ) ( ON ?auto_123713 ?auto_123719 ) ( not ( = ?auto_123716 ?auto_123718 ) ) ( not ( = ?auto_123716 ?auto_123719 ) ) ( not ( = ?auto_123716 ?auto_123713 ) ) ( not ( = ?auto_123716 ?auto_123717 ) ) ( not ( = ?auto_123718 ?auto_123719 ) ) ( not ( = ?auto_123718 ?auto_123713 ) ) ( not ( = ?auto_123718 ?auto_123717 ) ) ( not ( = ?auto_123719 ?auto_123713 ) ) ( not ( = ?auto_123719 ?auto_123717 ) ) ( not ( = ?auto_123713 ?auto_123717 ) ) ( not ( = ?auto_123712 ?auto_123713 ) ) ( not ( = ?auto_123712 ?auto_123716 ) ) ( not ( = ?auto_123712 ?auto_123718 ) ) ( not ( = ?auto_123712 ?auto_123719 ) ) ( not ( = ?auto_123714 ?auto_123713 ) ) ( not ( = ?auto_123714 ?auto_123716 ) ) ( not ( = ?auto_123714 ?auto_123718 ) ) ( not ( = ?auto_123714 ?auto_123719 ) ) ( not ( = ?auto_123715 ?auto_123713 ) ) ( not ( = ?auto_123715 ?auto_123716 ) ) ( not ( = ?auto_123715 ?auto_123718 ) ) ( not ( = ?auto_123715 ?auto_123719 ) ) ( ON ?auto_123717 ?auto_123715 ) ( CLEAR ?auto_123717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123712 ?auto_123714 ?auto_123715 )
      ( MAKE-1PILE ?auto_123712 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123720 - BLOCK
    )
    :vars
    (
      ?auto_123727 - BLOCK
      ?auto_123722 - BLOCK
      ?auto_123724 - BLOCK
      ?auto_123723 - BLOCK
      ?auto_123726 - BLOCK
      ?auto_123721 - BLOCK
      ?auto_123725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123727 ?auto_123720 ) ( ON-TABLE ?auto_123720 ) ( not ( = ?auto_123720 ?auto_123727 ) ) ( not ( = ?auto_123720 ?auto_123722 ) ) ( not ( = ?auto_123720 ?auto_123724 ) ) ( not ( = ?auto_123727 ?auto_123722 ) ) ( not ( = ?auto_123727 ?auto_123724 ) ) ( not ( = ?auto_123722 ?auto_123724 ) ) ( ON ?auto_123722 ?auto_123727 ) ( ON-TABLE ?auto_123723 ) ( ON ?auto_123726 ?auto_123723 ) ( ON ?auto_123721 ?auto_123726 ) ( not ( = ?auto_123723 ?auto_123726 ) ) ( not ( = ?auto_123723 ?auto_123721 ) ) ( not ( = ?auto_123723 ?auto_123725 ) ) ( not ( = ?auto_123723 ?auto_123724 ) ) ( not ( = ?auto_123726 ?auto_123721 ) ) ( not ( = ?auto_123726 ?auto_123725 ) ) ( not ( = ?auto_123726 ?auto_123724 ) ) ( not ( = ?auto_123721 ?auto_123725 ) ) ( not ( = ?auto_123721 ?auto_123724 ) ) ( not ( = ?auto_123725 ?auto_123724 ) ) ( not ( = ?auto_123720 ?auto_123725 ) ) ( not ( = ?auto_123720 ?auto_123723 ) ) ( not ( = ?auto_123720 ?auto_123726 ) ) ( not ( = ?auto_123720 ?auto_123721 ) ) ( not ( = ?auto_123727 ?auto_123725 ) ) ( not ( = ?auto_123727 ?auto_123723 ) ) ( not ( = ?auto_123727 ?auto_123726 ) ) ( not ( = ?auto_123727 ?auto_123721 ) ) ( not ( = ?auto_123722 ?auto_123725 ) ) ( not ( = ?auto_123722 ?auto_123723 ) ) ( not ( = ?auto_123722 ?auto_123726 ) ) ( not ( = ?auto_123722 ?auto_123721 ) ) ( ON ?auto_123724 ?auto_123722 ) ( CLEAR ?auto_123724 ) ( HOLDING ?auto_123725 ) ( CLEAR ?auto_123721 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123723 ?auto_123726 ?auto_123721 ?auto_123725 )
      ( MAKE-1PILE ?auto_123720 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123728 - BLOCK
    )
    :vars
    (
      ?auto_123732 - BLOCK
      ?auto_123730 - BLOCK
      ?auto_123733 - BLOCK
      ?auto_123729 - BLOCK
      ?auto_123734 - BLOCK
      ?auto_123731 - BLOCK
      ?auto_123735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123732 ?auto_123728 ) ( ON-TABLE ?auto_123728 ) ( not ( = ?auto_123728 ?auto_123732 ) ) ( not ( = ?auto_123728 ?auto_123730 ) ) ( not ( = ?auto_123728 ?auto_123733 ) ) ( not ( = ?auto_123732 ?auto_123730 ) ) ( not ( = ?auto_123732 ?auto_123733 ) ) ( not ( = ?auto_123730 ?auto_123733 ) ) ( ON ?auto_123730 ?auto_123732 ) ( ON-TABLE ?auto_123729 ) ( ON ?auto_123734 ?auto_123729 ) ( ON ?auto_123731 ?auto_123734 ) ( not ( = ?auto_123729 ?auto_123734 ) ) ( not ( = ?auto_123729 ?auto_123731 ) ) ( not ( = ?auto_123729 ?auto_123735 ) ) ( not ( = ?auto_123729 ?auto_123733 ) ) ( not ( = ?auto_123734 ?auto_123731 ) ) ( not ( = ?auto_123734 ?auto_123735 ) ) ( not ( = ?auto_123734 ?auto_123733 ) ) ( not ( = ?auto_123731 ?auto_123735 ) ) ( not ( = ?auto_123731 ?auto_123733 ) ) ( not ( = ?auto_123735 ?auto_123733 ) ) ( not ( = ?auto_123728 ?auto_123735 ) ) ( not ( = ?auto_123728 ?auto_123729 ) ) ( not ( = ?auto_123728 ?auto_123734 ) ) ( not ( = ?auto_123728 ?auto_123731 ) ) ( not ( = ?auto_123732 ?auto_123735 ) ) ( not ( = ?auto_123732 ?auto_123729 ) ) ( not ( = ?auto_123732 ?auto_123734 ) ) ( not ( = ?auto_123732 ?auto_123731 ) ) ( not ( = ?auto_123730 ?auto_123735 ) ) ( not ( = ?auto_123730 ?auto_123729 ) ) ( not ( = ?auto_123730 ?auto_123734 ) ) ( not ( = ?auto_123730 ?auto_123731 ) ) ( ON ?auto_123733 ?auto_123730 ) ( CLEAR ?auto_123731 ) ( ON ?auto_123735 ?auto_123733 ) ( CLEAR ?auto_123735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123728 ?auto_123732 ?auto_123730 ?auto_123733 )
      ( MAKE-1PILE ?auto_123728 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123736 - BLOCK
    )
    :vars
    (
      ?auto_123742 - BLOCK
      ?auto_123739 - BLOCK
      ?auto_123743 - BLOCK
      ?auto_123740 - BLOCK
      ?auto_123738 - BLOCK
      ?auto_123741 - BLOCK
      ?auto_123737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123742 ?auto_123736 ) ( ON-TABLE ?auto_123736 ) ( not ( = ?auto_123736 ?auto_123742 ) ) ( not ( = ?auto_123736 ?auto_123739 ) ) ( not ( = ?auto_123736 ?auto_123743 ) ) ( not ( = ?auto_123742 ?auto_123739 ) ) ( not ( = ?auto_123742 ?auto_123743 ) ) ( not ( = ?auto_123739 ?auto_123743 ) ) ( ON ?auto_123739 ?auto_123742 ) ( ON-TABLE ?auto_123740 ) ( ON ?auto_123738 ?auto_123740 ) ( not ( = ?auto_123740 ?auto_123738 ) ) ( not ( = ?auto_123740 ?auto_123741 ) ) ( not ( = ?auto_123740 ?auto_123737 ) ) ( not ( = ?auto_123740 ?auto_123743 ) ) ( not ( = ?auto_123738 ?auto_123741 ) ) ( not ( = ?auto_123738 ?auto_123737 ) ) ( not ( = ?auto_123738 ?auto_123743 ) ) ( not ( = ?auto_123741 ?auto_123737 ) ) ( not ( = ?auto_123741 ?auto_123743 ) ) ( not ( = ?auto_123737 ?auto_123743 ) ) ( not ( = ?auto_123736 ?auto_123737 ) ) ( not ( = ?auto_123736 ?auto_123740 ) ) ( not ( = ?auto_123736 ?auto_123738 ) ) ( not ( = ?auto_123736 ?auto_123741 ) ) ( not ( = ?auto_123742 ?auto_123737 ) ) ( not ( = ?auto_123742 ?auto_123740 ) ) ( not ( = ?auto_123742 ?auto_123738 ) ) ( not ( = ?auto_123742 ?auto_123741 ) ) ( not ( = ?auto_123739 ?auto_123737 ) ) ( not ( = ?auto_123739 ?auto_123740 ) ) ( not ( = ?auto_123739 ?auto_123738 ) ) ( not ( = ?auto_123739 ?auto_123741 ) ) ( ON ?auto_123743 ?auto_123739 ) ( ON ?auto_123737 ?auto_123743 ) ( CLEAR ?auto_123737 ) ( HOLDING ?auto_123741 ) ( CLEAR ?auto_123738 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123740 ?auto_123738 ?auto_123741 )
      ( MAKE-1PILE ?auto_123736 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123744 - BLOCK
    )
    :vars
    (
      ?auto_123751 - BLOCK
      ?auto_123747 - BLOCK
      ?auto_123746 - BLOCK
      ?auto_123750 - BLOCK
      ?auto_123745 - BLOCK
      ?auto_123749 - BLOCK
      ?auto_123748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123751 ?auto_123744 ) ( ON-TABLE ?auto_123744 ) ( not ( = ?auto_123744 ?auto_123751 ) ) ( not ( = ?auto_123744 ?auto_123747 ) ) ( not ( = ?auto_123744 ?auto_123746 ) ) ( not ( = ?auto_123751 ?auto_123747 ) ) ( not ( = ?auto_123751 ?auto_123746 ) ) ( not ( = ?auto_123747 ?auto_123746 ) ) ( ON ?auto_123747 ?auto_123751 ) ( ON-TABLE ?auto_123750 ) ( ON ?auto_123745 ?auto_123750 ) ( not ( = ?auto_123750 ?auto_123745 ) ) ( not ( = ?auto_123750 ?auto_123749 ) ) ( not ( = ?auto_123750 ?auto_123748 ) ) ( not ( = ?auto_123750 ?auto_123746 ) ) ( not ( = ?auto_123745 ?auto_123749 ) ) ( not ( = ?auto_123745 ?auto_123748 ) ) ( not ( = ?auto_123745 ?auto_123746 ) ) ( not ( = ?auto_123749 ?auto_123748 ) ) ( not ( = ?auto_123749 ?auto_123746 ) ) ( not ( = ?auto_123748 ?auto_123746 ) ) ( not ( = ?auto_123744 ?auto_123748 ) ) ( not ( = ?auto_123744 ?auto_123750 ) ) ( not ( = ?auto_123744 ?auto_123745 ) ) ( not ( = ?auto_123744 ?auto_123749 ) ) ( not ( = ?auto_123751 ?auto_123748 ) ) ( not ( = ?auto_123751 ?auto_123750 ) ) ( not ( = ?auto_123751 ?auto_123745 ) ) ( not ( = ?auto_123751 ?auto_123749 ) ) ( not ( = ?auto_123747 ?auto_123748 ) ) ( not ( = ?auto_123747 ?auto_123750 ) ) ( not ( = ?auto_123747 ?auto_123745 ) ) ( not ( = ?auto_123747 ?auto_123749 ) ) ( ON ?auto_123746 ?auto_123747 ) ( ON ?auto_123748 ?auto_123746 ) ( CLEAR ?auto_123745 ) ( ON ?auto_123749 ?auto_123748 ) ( CLEAR ?auto_123749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123744 ?auto_123751 ?auto_123747 ?auto_123746 ?auto_123748 )
      ( MAKE-1PILE ?auto_123744 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123752 - BLOCK
    )
    :vars
    (
      ?auto_123756 - BLOCK
      ?auto_123753 - BLOCK
      ?auto_123754 - BLOCK
      ?auto_123757 - BLOCK
      ?auto_123758 - BLOCK
      ?auto_123755 - BLOCK
      ?auto_123759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123756 ?auto_123752 ) ( ON-TABLE ?auto_123752 ) ( not ( = ?auto_123752 ?auto_123756 ) ) ( not ( = ?auto_123752 ?auto_123753 ) ) ( not ( = ?auto_123752 ?auto_123754 ) ) ( not ( = ?auto_123756 ?auto_123753 ) ) ( not ( = ?auto_123756 ?auto_123754 ) ) ( not ( = ?auto_123753 ?auto_123754 ) ) ( ON ?auto_123753 ?auto_123756 ) ( ON-TABLE ?auto_123757 ) ( not ( = ?auto_123757 ?auto_123758 ) ) ( not ( = ?auto_123757 ?auto_123755 ) ) ( not ( = ?auto_123757 ?auto_123759 ) ) ( not ( = ?auto_123757 ?auto_123754 ) ) ( not ( = ?auto_123758 ?auto_123755 ) ) ( not ( = ?auto_123758 ?auto_123759 ) ) ( not ( = ?auto_123758 ?auto_123754 ) ) ( not ( = ?auto_123755 ?auto_123759 ) ) ( not ( = ?auto_123755 ?auto_123754 ) ) ( not ( = ?auto_123759 ?auto_123754 ) ) ( not ( = ?auto_123752 ?auto_123759 ) ) ( not ( = ?auto_123752 ?auto_123757 ) ) ( not ( = ?auto_123752 ?auto_123758 ) ) ( not ( = ?auto_123752 ?auto_123755 ) ) ( not ( = ?auto_123756 ?auto_123759 ) ) ( not ( = ?auto_123756 ?auto_123757 ) ) ( not ( = ?auto_123756 ?auto_123758 ) ) ( not ( = ?auto_123756 ?auto_123755 ) ) ( not ( = ?auto_123753 ?auto_123759 ) ) ( not ( = ?auto_123753 ?auto_123757 ) ) ( not ( = ?auto_123753 ?auto_123758 ) ) ( not ( = ?auto_123753 ?auto_123755 ) ) ( ON ?auto_123754 ?auto_123753 ) ( ON ?auto_123759 ?auto_123754 ) ( ON ?auto_123755 ?auto_123759 ) ( CLEAR ?auto_123755 ) ( HOLDING ?auto_123758 ) ( CLEAR ?auto_123757 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123757 ?auto_123758 )
      ( MAKE-1PILE ?auto_123752 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123760 - BLOCK
    )
    :vars
    (
      ?auto_123765 - BLOCK
      ?auto_123767 - BLOCK
      ?auto_123764 - BLOCK
      ?auto_123766 - BLOCK
      ?auto_123763 - BLOCK
      ?auto_123761 - BLOCK
      ?auto_123762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123765 ?auto_123760 ) ( ON-TABLE ?auto_123760 ) ( not ( = ?auto_123760 ?auto_123765 ) ) ( not ( = ?auto_123760 ?auto_123767 ) ) ( not ( = ?auto_123760 ?auto_123764 ) ) ( not ( = ?auto_123765 ?auto_123767 ) ) ( not ( = ?auto_123765 ?auto_123764 ) ) ( not ( = ?auto_123767 ?auto_123764 ) ) ( ON ?auto_123767 ?auto_123765 ) ( ON-TABLE ?auto_123766 ) ( not ( = ?auto_123766 ?auto_123763 ) ) ( not ( = ?auto_123766 ?auto_123761 ) ) ( not ( = ?auto_123766 ?auto_123762 ) ) ( not ( = ?auto_123766 ?auto_123764 ) ) ( not ( = ?auto_123763 ?auto_123761 ) ) ( not ( = ?auto_123763 ?auto_123762 ) ) ( not ( = ?auto_123763 ?auto_123764 ) ) ( not ( = ?auto_123761 ?auto_123762 ) ) ( not ( = ?auto_123761 ?auto_123764 ) ) ( not ( = ?auto_123762 ?auto_123764 ) ) ( not ( = ?auto_123760 ?auto_123762 ) ) ( not ( = ?auto_123760 ?auto_123766 ) ) ( not ( = ?auto_123760 ?auto_123763 ) ) ( not ( = ?auto_123760 ?auto_123761 ) ) ( not ( = ?auto_123765 ?auto_123762 ) ) ( not ( = ?auto_123765 ?auto_123766 ) ) ( not ( = ?auto_123765 ?auto_123763 ) ) ( not ( = ?auto_123765 ?auto_123761 ) ) ( not ( = ?auto_123767 ?auto_123762 ) ) ( not ( = ?auto_123767 ?auto_123766 ) ) ( not ( = ?auto_123767 ?auto_123763 ) ) ( not ( = ?auto_123767 ?auto_123761 ) ) ( ON ?auto_123764 ?auto_123767 ) ( ON ?auto_123762 ?auto_123764 ) ( ON ?auto_123761 ?auto_123762 ) ( CLEAR ?auto_123766 ) ( ON ?auto_123763 ?auto_123761 ) ( CLEAR ?auto_123763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123760 ?auto_123765 ?auto_123767 ?auto_123764 ?auto_123762 ?auto_123761 )
      ( MAKE-1PILE ?auto_123760 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123768 - BLOCK
    )
    :vars
    (
      ?auto_123773 - BLOCK
      ?auto_123775 - BLOCK
      ?auto_123769 - BLOCK
      ?auto_123771 - BLOCK
      ?auto_123774 - BLOCK
      ?auto_123772 - BLOCK
      ?auto_123770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123773 ?auto_123768 ) ( ON-TABLE ?auto_123768 ) ( not ( = ?auto_123768 ?auto_123773 ) ) ( not ( = ?auto_123768 ?auto_123775 ) ) ( not ( = ?auto_123768 ?auto_123769 ) ) ( not ( = ?auto_123773 ?auto_123775 ) ) ( not ( = ?auto_123773 ?auto_123769 ) ) ( not ( = ?auto_123775 ?auto_123769 ) ) ( ON ?auto_123775 ?auto_123773 ) ( not ( = ?auto_123771 ?auto_123774 ) ) ( not ( = ?auto_123771 ?auto_123772 ) ) ( not ( = ?auto_123771 ?auto_123770 ) ) ( not ( = ?auto_123771 ?auto_123769 ) ) ( not ( = ?auto_123774 ?auto_123772 ) ) ( not ( = ?auto_123774 ?auto_123770 ) ) ( not ( = ?auto_123774 ?auto_123769 ) ) ( not ( = ?auto_123772 ?auto_123770 ) ) ( not ( = ?auto_123772 ?auto_123769 ) ) ( not ( = ?auto_123770 ?auto_123769 ) ) ( not ( = ?auto_123768 ?auto_123770 ) ) ( not ( = ?auto_123768 ?auto_123771 ) ) ( not ( = ?auto_123768 ?auto_123774 ) ) ( not ( = ?auto_123768 ?auto_123772 ) ) ( not ( = ?auto_123773 ?auto_123770 ) ) ( not ( = ?auto_123773 ?auto_123771 ) ) ( not ( = ?auto_123773 ?auto_123774 ) ) ( not ( = ?auto_123773 ?auto_123772 ) ) ( not ( = ?auto_123775 ?auto_123770 ) ) ( not ( = ?auto_123775 ?auto_123771 ) ) ( not ( = ?auto_123775 ?auto_123774 ) ) ( not ( = ?auto_123775 ?auto_123772 ) ) ( ON ?auto_123769 ?auto_123775 ) ( ON ?auto_123770 ?auto_123769 ) ( ON ?auto_123772 ?auto_123770 ) ( ON ?auto_123774 ?auto_123772 ) ( CLEAR ?auto_123774 ) ( HOLDING ?auto_123771 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_123771 )
      ( MAKE-1PILE ?auto_123768 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123785 - BLOCK
    )
    :vars
    (
      ?auto_123790 - BLOCK
      ?auto_123787 - BLOCK
      ?auto_123788 - BLOCK
      ?auto_123791 - BLOCK
      ?auto_123789 - BLOCK
      ?auto_123792 - BLOCK
      ?auto_123786 - BLOCK
      ?auto_123793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123790 ?auto_123785 ) ( ON-TABLE ?auto_123785 ) ( not ( = ?auto_123785 ?auto_123790 ) ) ( not ( = ?auto_123785 ?auto_123787 ) ) ( not ( = ?auto_123785 ?auto_123788 ) ) ( not ( = ?auto_123790 ?auto_123787 ) ) ( not ( = ?auto_123790 ?auto_123788 ) ) ( not ( = ?auto_123787 ?auto_123788 ) ) ( ON ?auto_123787 ?auto_123790 ) ( not ( = ?auto_123791 ?auto_123789 ) ) ( not ( = ?auto_123791 ?auto_123792 ) ) ( not ( = ?auto_123791 ?auto_123786 ) ) ( not ( = ?auto_123791 ?auto_123788 ) ) ( not ( = ?auto_123789 ?auto_123792 ) ) ( not ( = ?auto_123789 ?auto_123786 ) ) ( not ( = ?auto_123789 ?auto_123788 ) ) ( not ( = ?auto_123792 ?auto_123786 ) ) ( not ( = ?auto_123792 ?auto_123788 ) ) ( not ( = ?auto_123786 ?auto_123788 ) ) ( not ( = ?auto_123785 ?auto_123786 ) ) ( not ( = ?auto_123785 ?auto_123791 ) ) ( not ( = ?auto_123785 ?auto_123789 ) ) ( not ( = ?auto_123785 ?auto_123792 ) ) ( not ( = ?auto_123790 ?auto_123786 ) ) ( not ( = ?auto_123790 ?auto_123791 ) ) ( not ( = ?auto_123790 ?auto_123789 ) ) ( not ( = ?auto_123790 ?auto_123792 ) ) ( not ( = ?auto_123787 ?auto_123786 ) ) ( not ( = ?auto_123787 ?auto_123791 ) ) ( not ( = ?auto_123787 ?auto_123789 ) ) ( not ( = ?auto_123787 ?auto_123792 ) ) ( ON ?auto_123788 ?auto_123787 ) ( ON ?auto_123786 ?auto_123788 ) ( ON ?auto_123792 ?auto_123786 ) ( ON ?auto_123789 ?auto_123792 ) ( CLEAR ?auto_123789 ) ( ON ?auto_123791 ?auto_123793 ) ( CLEAR ?auto_123791 ) ( HAND-EMPTY ) ( not ( = ?auto_123785 ?auto_123793 ) ) ( not ( = ?auto_123790 ?auto_123793 ) ) ( not ( = ?auto_123787 ?auto_123793 ) ) ( not ( = ?auto_123788 ?auto_123793 ) ) ( not ( = ?auto_123791 ?auto_123793 ) ) ( not ( = ?auto_123789 ?auto_123793 ) ) ( not ( = ?auto_123792 ?auto_123793 ) ) ( not ( = ?auto_123786 ?auto_123793 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_123791 ?auto_123793 )
      ( MAKE-1PILE ?auto_123785 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123794 - BLOCK
    )
    :vars
    (
      ?auto_123802 - BLOCK
      ?auto_123795 - BLOCK
      ?auto_123796 - BLOCK
      ?auto_123797 - BLOCK
      ?auto_123799 - BLOCK
      ?auto_123801 - BLOCK
      ?auto_123800 - BLOCK
      ?auto_123798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123802 ?auto_123794 ) ( ON-TABLE ?auto_123794 ) ( not ( = ?auto_123794 ?auto_123802 ) ) ( not ( = ?auto_123794 ?auto_123795 ) ) ( not ( = ?auto_123794 ?auto_123796 ) ) ( not ( = ?auto_123802 ?auto_123795 ) ) ( not ( = ?auto_123802 ?auto_123796 ) ) ( not ( = ?auto_123795 ?auto_123796 ) ) ( ON ?auto_123795 ?auto_123802 ) ( not ( = ?auto_123797 ?auto_123799 ) ) ( not ( = ?auto_123797 ?auto_123801 ) ) ( not ( = ?auto_123797 ?auto_123800 ) ) ( not ( = ?auto_123797 ?auto_123796 ) ) ( not ( = ?auto_123799 ?auto_123801 ) ) ( not ( = ?auto_123799 ?auto_123800 ) ) ( not ( = ?auto_123799 ?auto_123796 ) ) ( not ( = ?auto_123801 ?auto_123800 ) ) ( not ( = ?auto_123801 ?auto_123796 ) ) ( not ( = ?auto_123800 ?auto_123796 ) ) ( not ( = ?auto_123794 ?auto_123800 ) ) ( not ( = ?auto_123794 ?auto_123797 ) ) ( not ( = ?auto_123794 ?auto_123799 ) ) ( not ( = ?auto_123794 ?auto_123801 ) ) ( not ( = ?auto_123802 ?auto_123800 ) ) ( not ( = ?auto_123802 ?auto_123797 ) ) ( not ( = ?auto_123802 ?auto_123799 ) ) ( not ( = ?auto_123802 ?auto_123801 ) ) ( not ( = ?auto_123795 ?auto_123800 ) ) ( not ( = ?auto_123795 ?auto_123797 ) ) ( not ( = ?auto_123795 ?auto_123799 ) ) ( not ( = ?auto_123795 ?auto_123801 ) ) ( ON ?auto_123796 ?auto_123795 ) ( ON ?auto_123800 ?auto_123796 ) ( ON ?auto_123801 ?auto_123800 ) ( ON ?auto_123797 ?auto_123798 ) ( CLEAR ?auto_123797 ) ( not ( = ?auto_123794 ?auto_123798 ) ) ( not ( = ?auto_123802 ?auto_123798 ) ) ( not ( = ?auto_123795 ?auto_123798 ) ) ( not ( = ?auto_123796 ?auto_123798 ) ) ( not ( = ?auto_123797 ?auto_123798 ) ) ( not ( = ?auto_123799 ?auto_123798 ) ) ( not ( = ?auto_123801 ?auto_123798 ) ) ( not ( = ?auto_123800 ?auto_123798 ) ) ( HOLDING ?auto_123799 ) ( CLEAR ?auto_123801 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123794 ?auto_123802 ?auto_123795 ?auto_123796 ?auto_123800 ?auto_123801 ?auto_123799 )
      ( MAKE-1PILE ?auto_123794 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123803 - BLOCK
    )
    :vars
    (
      ?auto_123808 - BLOCK
      ?auto_123807 - BLOCK
      ?auto_123809 - BLOCK
      ?auto_123804 - BLOCK
      ?auto_123806 - BLOCK
      ?auto_123805 - BLOCK
      ?auto_123810 - BLOCK
      ?auto_123811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123808 ?auto_123803 ) ( ON-TABLE ?auto_123803 ) ( not ( = ?auto_123803 ?auto_123808 ) ) ( not ( = ?auto_123803 ?auto_123807 ) ) ( not ( = ?auto_123803 ?auto_123809 ) ) ( not ( = ?auto_123808 ?auto_123807 ) ) ( not ( = ?auto_123808 ?auto_123809 ) ) ( not ( = ?auto_123807 ?auto_123809 ) ) ( ON ?auto_123807 ?auto_123808 ) ( not ( = ?auto_123804 ?auto_123806 ) ) ( not ( = ?auto_123804 ?auto_123805 ) ) ( not ( = ?auto_123804 ?auto_123810 ) ) ( not ( = ?auto_123804 ?auto_123809 ) ) ( not ( = ?auto_123806 ?auto_123805 ) ) ( not ( = ?auto_123806 ?auto_123810 ) ) ( not ( = ?auto_123806 ?auto_123809 ) ) ( not ( = ?auto_123805 ?auto_123810 ) ) ( not ( = ?auto_123805 ?auto_123809 ) ) ( not ( = ?auto_123810 ?auto_123809 ) ) ( not ( = ?auto_123803 ?auto_123810 ) ) ( not ( = ?auto_123803 ?auto_123804 ) ) ( not ( = ?auto_123803 ?auto_123806 ) ) ( not ( = ?auto_123803 ?auto_123805 ) ) ( not ( = ?auto_123808 ?auto_123810 ) ) ( not ( = ?auto_123808 ?auto_123804 ) ) ( not ( = ?auto_123808 ?auto_123806 ) ) ( not ( = ?auto_123808 ?auto_123805 ) ) ( not ( = ?auto_123807 ?auto_123810 ) ) ( not ( = ?auto_123807 ?auto_123804 ) ) ( not ( = ?auto_123807 ?auto_123806 ) ) ( not ( = ?auto_123807 ?auto_123805 ) ) ( ON ?auto_123809 ?auto_123807 ) ( ON ?auto_123810 ?auto_123809 ) ( ON ?auto_123805 ?auto_123810 ) ( ON ?auto_123804 ?auto_123811 ) ( not ( = ?auto_123803 ?auto_123811 ) ) ( not ( = ?auto_123808 ?auto_123811 ) ) ( not ( = ?auto_123807 ?auto_123811 ) ) ( not ( = ?auto_123809 ?auto_123811 ) ) ( not ( = ?auto_123804 ?auto_123811 ) ) ( not ( = ?auto_123806 ?auto_123811 ) ) ( not ( = ?auto_123805 ?auto_123811 ) ) ( not ( = ?auto_123810 ?auto_123811 ) ) ( CLEAR ?auto_123805 ) ( ON ?auto_123806 ?auto_123804 ) ( CLEAR ?auto_123806 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_123811 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123811 ?auto_123804 )
      ( MAKE-1PILE ?auto_123803 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123812 - BLOCK
    )
    :vars
    (
      ?auto_123817 - BLOCK
      ?auto_123816 - BLOCK
      ?auto_123819 - BLOCK
      ?auto_123818 - BLOCK
      ?auto_123820 - BLOCK
      ?auto_123814 - BLOCK
      ?auto_123813 - BLOCK
      ?auto_123815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123817 ?auto_123812 ) ( ON-TABLE ?auto_123812 ) ( not ( = ?auto_123812 ?auto_123817 ) ) ( not ( = ?auto_123812 ?auto_123816 ) ) ( not ( = ?auto_123812 ?auto_123819 ) ) ( not ( = ?auto_123817 ?auto_123816 ) ) ( not ( = ?auto_123817 ?auto_123819 ) ) ( not ( = ?auto_123816 ?auto_123819 ) ) ( ON ?auto_123816 ?auto_123817 ) ( not ( = ?auto_123818 ?auto_123820 ) ) ( not ( = ?auto_123818 ?auto_123814 ) ) ( not ( = ?auto_123818 ?auto_123813 ) ) ( not ( = ?auto_123818 ?auto_123819 ) ) ( not ( = ?auto_123820 ?auto_123814 ) ) ( not ( = ?auto_123820 ?auto_123813 ) ) ( not ( = ?auto_123820 ?auto_123819 ) ) ( not ( = ?auto_123814 ?auto_123813 ) ) ( not ( = ?auto_123814 ?auto_123819 ) ) ( not ( = ?auto_123813 ?auto_123819 ) ) ( not ( = ?auto_123812 ?auto_123813 ) ) ( not ( = ?auto_123812 ?auto_123818 ) ) ( not ( = ?auto_123812 ?auto_123820 ) ) ( not ( = ?auto_123812 ?auto_123814 ) ) ( not ( = ?auto_123817 ?auto_123813 ) ) ( not ( = ?auto_123817 ?auto_123818 ) ) ( not ( = ?auto_123817 ?auto_123820 ) ) ( not ( = ?auto_123817 ?auto_123814 ) ) ( not ( = ?auto_123816 ?auto_123813 ) ) ( not ( = ?auto_123816 ?auto_123818 ) ) ( not ( = ?auto_123816 ?auto_123820 ) ) ( not ( = ?auto_123816 ?auto_123814 ) ) ( ON ?auto_123819 ?auto_123816 ) ( ON ?auto_123813 ?auto_123819 ) ( ON ?auto_123818 ?auto_123815 ) ( not ( = ?auto_123812 ?auto_123815 ) ) ( not ( = ?auto_123817 ?auto_123815 ) ) ( not ( = ?auto_123816 ?auto_123815 ) ) ( not ( = ?auto_123819 ?auto_123815 ) ) ( not ( = ?auto_123818 ?auto_123815 ) ) ( not ( = ?auto_123820 ?auto_123815 ) ) ( not ( = ?auto_123814 ?auto_123815 ) ) ( not ( = ?auto_123813 ?auto_123815 ) ) ( ON ?auto_123820 ?auto_123818 ) ( CLEAR ?auto_123820 ) ( ON-TABLE ?auto_123815 ) ( HOLDING ?auto_123814 ) ( CLEAR ?auto_123813 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123812 ?auto_123817 ?auto_123816 ?auto_123819 ?auto_123813 ?auto_123814 )
      ( MAKE-1PILE ?auto_123812 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123821 - BLOCK
    )
    :vars
    (
      ?auto_123827 - BLOCK
      ?auto_123822 - BLOCK
      ?auto_123826 - BLOCK
      ?auto_123823 - BLOCK
      ?auto_123828 - BLOCK
      ?auto_123829 - BLOCK
      ?auto_123824 - BLOCK
      ?auto_123825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123827 ?auto_123821 ) ( ON-TABLE ?auto_123821 ) ( not ( = ?auto_123821 ?auto_123827 ) ) ( not ( = ?auto_123821 ?auto_123822 ) ) ( not ( = ?auto_123821 ?auto_123826 ) ) ( not ( = ?auto_123827 ?auto_123822 ) ) ( not ( = ?auto_123827 ?auto_123826 ) ) ( not ( = ?auto_123822 ?auto_123826 ) ) ( ON ?auto_123822 ?auto_123827 ) ( not ( = ?auto_123823 ?auto_123828 ) ) ( not ( = ?auto_123823 ?auto_123829 ) ) ( not ( = ?auto_123823 ?auto_123824 ) ) ( not ( = ?auto_123823 ?auto_123826 ) ) ( not ( = ?auto_123828 ?auto_123829 ) ) ( not ( = ?auto_123828 ?auto_123824 ) ) ( not ( = ?auto_123828 ?auto_123826 ) ) ( not ( = ?auto_123829 ?auto_123824 ) ) ( not ( = ?auto_123829 ?auto_123826 ) ) ( not ( = ?auto_123824 ?auto_123826 ) ) ( not ( = ?auto_123821 ?auto_123824 ) ) ( not ( = ?auto_123821 ?auto_123823 ) ) ( not ( = ?auto_123821 ?auto_123828 ) ) ( not ( = ?auto_123821 ?auto_123829 ) ) ( not ( = ?auto_123827 ?auto_123824 ) ) ( not ( = ?auto_123827 ?auto_123823 ) ) ( not ( = ?auto_123827 ?auto_123828 ) ) ( not ( = ?auto_123827 ?auto_123829 ) ) ( not ( = ?auto_123822 ?auto_123824 ) ) ( not ( = ?auto_123822 ?auto_123823 ) ) ( not ( = ?auto_123822 ?auto_123828 ) ) ( not ( = ?auto_123822 ?auto_123829 ) ) ( ON ?auto_123826 ?auto_123822 ) ( ON ?auto_123824 ?auto_123826 ) ( ON ?auto_123823 ?auto_123825 ) ( not ( = ?auto_123821 ?auto_123825 ) ) ( not ( = ?auto_123827 ?auto_123825 ) ) ( not ( = ?auto_123822 ?auto_123825 ) ) ( not ( = ?auto_123826 ?auto_123825 ) ) ( not ( = ?auto_123823 ?auto_123825 ) ) ( not ( = ?auto_123828 ?auto_123825 ) ) ( not ( = ?auto_123829 ?auto_123825 ) ) ( not ( = ?auto_123824 ?auto_123825 ) ) ( ON ?auto_123828 ?auto_123823 ) ( ON-TABLE ?auto_123825 ) ( CLEAR ?auto_123824 ) ( ON ?auto_123829 ?auto_123828 ) ( CLEAR ?auto_123829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123825 ?auto_123823 ?auto_123828 )
      ( MAKE-1PILE ?auto_123821 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_123873 - BLOCK
      ?auto_123874 - BLOCK
      ?auto_123875 - BLOCK
      ?auto_123876 - BLOCK
      ?auto_123877 - BLOCK
      ?auto_123878 - BLOCK
      ?auto_123879 - BLOCK
    )
    :vars
    (
      ?auto_123880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123873 ) ( ON ?auto_123874 ?auto_123873 ) ( ON ?auto_123875 ?auto_123874 ) ( ON ?auto_123876 ?auto_123875 ) ( ON ?auto_123877 ?auto_123876 ) ( not ( = ?auto_123873 ?auto_123874 ) ) ( not ( = ?auto_123873 ?auto_123875 ) ) ( not ( = ?auto_123873 ?auto_123876 ) ) ( not ( = ?auto_123873 ?auto_123877 ) ) ( not ( = ?auto_123873 ?auto_123878 ) ) ( not ( = ?auto_123873 ?auto_123879 ) ) ( not ( = ?auto_123874 ?auto_123875 ) ) ( not ( = ?auto_123874 ?auto_123876 ) ) ( not ( = ?auto_123874 ?auto_123877 ) ) ( not ( = ?auto_123874 ?auto_123878 ) ) ( not ( = ?auto_123874 ?auto_123879 ) ) ( not ( = ?auto_123875 ?auto_123876 ) ) ( not ( = ?auto_123875 ?auto_123877 ) ) ( not ( = ?auto_123875 ?auto_123878 ) ) ( not ( = ?auto_123875 ?auto_123879 ) ) ( not ( = ?auto_123876 ?auto_123877 ) ) ( not ( = ?auto_123876 ?auto_123878 ) ) ( not ( = ?auto_123876 ?auto_123879 ) ) ( not ( = ?auto_123877 ?auto_123878 ) ) ( not ( = ?auto_123877 ?auto_123879 ) ) ( not ( = ?auto_123878 ?auto_123879 ) ) ( ON ?auto_123879 ?auto_123880 ) ( not ( = ?auto_123873 ?auto_123880 ) ) ( not ( = ?auto_123874 ?auto_123880 ) ) ( not ( = ?auto_123875 ?auto_123880 ) ) ( not ( = ?auto_123876 ?auto_123880 ) ) ( not ( = ?auto_123877 ?auto_123880 ) ) ( not ( = ?auto_123878 ?auto_123880 ) ) ( not ( = ?auto_123879 ?auto_123880 ) ) ( CLEAR ?auto_123877 ) ( ON ?auto_123878 ?auto_123879 ) ( CLEAR ?auto_123878 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_123880 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123880 ?auto_123879 )
      ( MAKE-7PILE ?auto_123873 ?auto_123874 ?auto_123875 ?auto_123876 ?auto_123877 ?auto_123878 ?auto_123879 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_123881 - BLOCK
      ?auto_123882 - BLOCK
      ?auto_123883 - BLOCK
      ?auto_123884 - BLOCK
      ?auto_123885 - BLOCK
      ?auto_123886 - BLOCK
      ?auto_123887 - BLOCK
    )
    :vars
    (
      ?auto_123888 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123881 ) ( ON ?auto_123882 ?auto_123881 ) ( ON ?auto_123883 ?auto_123882 ) ( ON ?auto_123884 ?auto_123883 ) ( not ( = ?auto_123881 ?auto_123882 ) ) ( not ( = ?auto_123881 ?auto_123883 ) ) ( not ( = ?auto_123881 ?auto_123884 ) ) ( not ( = ?auto_123881 ?auto_123885 ) ) ( not ( = ?auto_123881 ?auto_123886 ) ) ( not ( = ?auto_123881 ?auto_123887 ) ) ( not ( = ?auto_123882 ?auto_123883 ) ) ( not ( = ?auto_123882 ?auto_123884 ) ) ( not ( = ?auto_123882 ?auto_123885 ) ) ( not ( = ?auto_123882 ?auto_123886 ) ) ( not ( = ?auto_123882 ?auto_123887 ) ) ( not ( = ?auto_123883 ?auto_123884 ) ) ( not ( = ?auto_123883 ?auto_123885 ) ) ( not ( = ?auto_123883 ?auto_123886 ) ) ( not ( = ?auto_123883 ?auto_123887 ) ) ( not ( = ?auto_123884 ?auto_123885 ) ) ( not ( = ?auto_123884 ?auto_123886 ) ) ( not ( = ?auto_123884 ?auto_123887 ) ) ( not ( = ?auto_123885 ?auto_123886 ) ) ( not ( = ?auto_123885 ?auto_123887 ) ) ( not ( = ?auto_123886 ?auto_123887 ) ) ( ON ?auto_123887 ?auto_123888 ) ( not ( = ?auto_123881 ?auto_123888 ) ) ( not ( = ?auto_123882 ?auto_123888 ) ) ( not ( = ?auto_123883 ?auto_123888 ) ) ( not ( = ?auto_123884 ?auto_123888 ) ) ( not ( = ?auto_123885 ?auto_123888 ) ) ( not ( = ?auto_123886 ?auto_123888 ) ) ( not ( = ?auto_123887 ?auto_123888 ) ) ( ON ?auto_123886 ?auto_123887 ) ( CLEAR ?auto_123886 ) ( ON-TABLE ?auto_123888 ) ( HOLDING ?auto_123885 ) ( CLEAR ?auto_123884 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123881 ?auto_123882 ?auto_123883 ?auto_123884 ?auto_123885 )
      ( MAKE-7PILE ?auto_123881 ?auto_123882 ?auto_123883 ?auto_123884 ?auto_123885 ?auto_123886 ?auto_123887 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_123889 - BLOCK
      ?auto_123890 - BLOCK
      ?auto_123891 - BLOCK
      ?auto_123892 - BLOCK
      ?auto_123893 - BLOCK
      ?auto_123894 - BLOCK
      ?auto_123895 - BLOCK
    )
    :vars
    (
      ?auto_123896 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123889 ) ( ON ?auto_123890 ?auto_123889 ) ( ON ?auto_123891 ?auto_123890 ) ( ON ?auto_123892 ?auto_123891 ) ( not ( = ?auto_123889 ?auto_123890 ) ) ( not ( = ?auto_123889 ?auto_123891 ) ) ( not ( = ?auto_123889 ?auto_123892 ) ) ( not ( = ?auto_123889 ?auto_123893 ) ) ( not ( = ?auto_123889 ?auto_123894 ) ) ( not ( = ?auto_123889 ?auto_123895 ) ) ( not ( = ?auto_123890 ?auto_123891 ) ) ( not ( = ?auto_123890 ?auto_123892 ) ) ( not ( = ?auto_123890 ?auto_123893 ) ) ( not ( = ?auto_123890 ?auto_123894 ) ) ( not ( = ?auto_123890 ?auto_123895 ) ) ( not ( = ?auto_123891 ?auto_123892 ) ) ( not ( = ?auto_123891 ?auto_123893 ) ) ( not ( = ?auto_123891 ?auto_123894 ) ) ( not ( = ?auto_123891 ?auto_123895 ) ) ( not ( = ?auto_123892 ?auto_123893 ) ) ( not ( = ?auto_123892 ?auto_123894 ) ) ( not ( = ?auto_123892 ?auto_123895 ) ) ( not ( = ?auto_123893 ?auto_123894 ) ) ( not ( = ?auto_123893 ?auto_123895 ) ) ( not ( = ?auto_123894 ?auto_123895 ) ) ( ON ?auto_123895 ?auto_123896 ) ( not ( = ?auto_123889 ?auto_123896 ) ) ( not ( = ?auto_123890 ?auto_123896 ) ) ( not ( = ?auto_123891 ?auto_123896 ) ) ( not ( = ?auto_123892 ?auto_123896 ) ) ( not ( = ?auto_123893 ?auto_123896 ) ) ( not ( = ?auto_123894 ?auto_123896 ) ) ( not ( = ?auto_123895 ?auto_123896 ) ) ( ON ?auto_123894 ?auto_123895 ) ( ON-TABLE ?auto_123896 ) ( CLEAR ?auto_123892 ) ( ON ?auto_123893 ?auto_123894 ) ( CLEAR ?auto_123893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123896 ?auto_123895 ?auto_123894 )
      ( MAKE-7PILE ?auto_123889 ?auto_123890 ?auto_123891 ?auto_123892 ?auto_123893 ?auto_123894 ?auto_123895 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_123897 - BLOCK
      ?auto_123898 - BLOCK
      ?auto_123899 - BLOCK
      ?auto_123900 - BLOCK
      ?auto_123901 - BLOCK
      ?auto_123902 - BLOCK
      ?auto_123903 - BLOCK
    )
    :vars
    (
      ?auto_123904 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123897 ) ( ON ?auto_123898 ?auto_123897 ) ( ON ?auto_123899 ?auto_123898 ) ( not ( = ?auto_123897 ?auto_123898 ) ) ( not ( = ?auto_123897 ?auto_123899 ) ) ( not ( = ?auto_123897 ?auto_123900 ) ) ( not ( = ?auto_123897 ?auto_123901 ) ) ( not ( = ?auto_123897 ?auto_123902 ) ) ( not ( = ?auto_123897 ?auto_123903 ) ) ( not ( = ?auto_123898 ?auto_123899 ) ) ( not ( = ?auto_123898 ?auto_123900 ) ) ( not ( = ?auto_123898 ?auto_123901 ) ) ( not ( = ?auto_123898 ?auto_123902 ) ) ( not ( = ?auto_123898 ?auto_123903 ) ) ( not ( = ?auto_123899 ?auto_123900 ) ) ( not ( = ?auto_123899 ?auto_123901 ) ) ( not ( = ?auto_123899 ?auto_123902 ) ) ( not ( = ?auto_123899 ?auto_123903 ) ) ( not ( = ?auto_123900 ?auto_123901 ) ) ( not ( = ?auto_123900 ?auto_123902 ) ) ( not ( = ?auto_123900 ?auto_123903 ) ) ( not ( = ?auto_123901 ?auto_123902 ) ) ( not ( = ?auto_123901 ?auto_123903 ) ) ( not ( = ?auto_123902 ?auto_123903 ) ) ( ON ?auto_123903 ?auto_123904 ) ( not ( = ?auto_123897 ?auto_123904 ) ) ( not ( = ?auto_123898 ?auto_123904 ) ) ( not ( = ?auto_123899 ?auto_123904 ) ) ( not ( = ?auto_123900 ?auto_123904 ) ) ( not ( = ?auto_123901 ?auto_123904 ) ) ( not ( = ?auto_123902 ?auto_123904 ) ) ( not ( = ?auto_123903 ?auto_123904 ) ) ( ON ?auto_123902 ?auto_123903 ) ( ON-TABLE ?auto_123904 ) ( ON ?auto_123901 ?auto_123902 ) ( CLEAR ?auto_123901 ) ( HOLDING ?auto_123900 ) ( CLEAR ?auto_123899 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123897 ?auto_123898 ?auto_123899 ?auto_123900 )
      ( MAKE-7PILE ?auto_123897 ?auto_123898 ?auto_123899 ?auto_123900 ?auto_123901 ?auto_123902 ?auto_123903 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_123905 - BLOCK
      ?auto_123906 - BLOCK
      ?auto_123907 - BLOCK
      ?auto_123908 - BLOCK
      ?auto_123909 - BLOCK
      ?auto_123910 - BLOCK
      ?auto_123911 - BLOCK
    )
    :vars
    (
      ?auto_123912 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123905 ) ( ON ?auto_123906 ?auto_123905 ) ( ON ?auto_123907 ?auto_123906 ) ( not ( = ?auto_123905 ?auto_123906 ) ) ( not ( = ?auto_123905 ?auto_123907 ) ) ( not ( = ?auto_123905 ?auto_123908 ) ) ( not ( = ?auto_123905 ?auto_123909 ) ) ( not ( = ?auto_123905 ?auto_123910 ) ) ( not ( = ?auto_123905 ?auto_123911 ) ) ( not ( = ?auto_123906 ?auto_123907 ) ) ( not ( = ?auto_123906 ?auto_123908 ) ) ( not ( = ?auto_123906 ?auto_123909 ) ) ( not ( = ?auto_123906 ?auto_123910 ) ) ( not ( = ?auto_123906 ?auto_123911 ) ) ( not ( = ?auto_123907 ?auto_123908 ) ) ( not ( = ?auto_123907 ?auto_123909 ) ) ( not ( = ?auto_123907 ?auto_123910 ) ) ( not ( = ?auto_123907 ?auto_123911 ) ) ( not ( = ?auto_123908 ?auto_123909 ) ) ( not ( = ?auto_123908 ?auto_123910 ) ) ( not ( = ?auto_123908 ?auto_123911 ) ) ( not ( = ?auto_123909 ?auto_123910 ) ) ( not ( = ?auto_123909 ?auto_123911 ) ) ( not ( = ?auto_123910 ?auto_123911 ) ) ( ON ?auto_123911 ?auto_123912 ) ( not ( = ?auto_123905 ?auto_123912 ) ) ( not ( = ?auto_123906 ?auto_123912 ) ) ( not ( = ?auto_123907 ?auto_123912 ) ) ( not ( = ?auto_123908 ?auto_123912 ) ) ( not ( = ?auto_123909 ?auto_123912 ) ) ( not ( = ?auto_123910 ?auto_123912 ) ) ( not ( = ?auto_123911 ?auto_123912 ) ) ( ON ?auto_123910 ?auto_123911 ) ( ON-TABLE ?auto_123912 ) ( ON ?auto_123909 ?auto_123910 ) ( CLEAR ?auto_123907 ) ( ON ?auto_123908 ?auto_123909 ) ( CLEAR ?auto_123908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123912 ?auto_123911 ?auto_123910 ?auto_123909 )
      ( MAKE-7PILE ?auto_123905 ?auto_123906 ?auto_123907 ?auto_123908 ?auto_123909 ?auto_123910 ?auto_123911 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_123913 - BLOCK
      ?auto_123914 - BLOCK
      ?auto_123915 - BLOCK
      ?auto_123916 - BLOCK
      ?auto_123917 - BLOCK
      ?auto_123918 - BLOCK
      ?auto_123919 - BLOCK
    )
    :vars
    (
      ?auto_123920 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123913 ) ( ON ?auto_123914 ?auto_123913 ) ( not ( = ?auto_123913 ?auto_123914 ) ) ( not ( = ?auto_123913 ?auto_123915 ) ) ( not ( = ?auto_123913 ?auto_123916 ) ) ( not ( = ?auto_123913 ?auto_123917 ) ) ( not ( = ?auto_123913 ?auto_123918 ) ) ( not ( = ?auto_123913 ?auto_123919 ) ) ( not ( = ?auto_123914 ?auto_123915 ) ) ( not ( = ?auto_123914 ?auto_123916 ) ) ( not ( = ?auto_123914 ?auto_123917 ) ) ( not ( = ?auto_123914 ?auto_123918 ) ) ( not ( = ?auto_123914 ?auto_123919 ) ) ( not ( = ?auto_123915 ?auto_123916 ) ) ( not ( = ?auto_123915 ?auto_123917 ) ) ( not ( = ?auto_123915 ?auto_123918 ) ) ( not ( = ?auto_123915 ?auto_123919 ) ) ( not ( = ?auto_123916 ?auto_123917 ) ) ( not ( = ?auto_123916 ?auto_123918 ) ) ( not ( = ?auto_123916 ?auto_123919 ) ) ( not ( = ?auto_123917 ?auto_123918 ) ) ( not ( = ?auto_123917 ?auto_123919 ) ) ( not ( = ?auto_123918 ?auto_123919 ) ) ( ON ?auto_123919 ?auto_123920 ) ( not ( = ?auto_123913 ?auto_123920 ) ) ( not ( = ?auto_123914 ?auto_123920 ) ) ( not ( = ?auto_123915 ?auto_123920 ) ) ( not ( = ?auto_123916 ?auto_123920 ) ) ( not ( = ?auto_123917 ?auto_123920 ) ) ( not ( = ?auto_123918 ?auto_123920 ) ) ( not ( = ?auto_123919 ?auto_123920 ) ) ( ON ?auto_123918 ?auto_123919 ) ( ON-TABLE ?auto_123920 ) ( ON ?auto_123917 ?auto_123918 ) ( ON ?auto_123916 ?auto_123917 ) ( CLEAR ?auto_123916 ) ( HOLDING ?auto_123915 ) ( CLEAR ?auto_123914 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123913 ?auto_123914 ?auto_123915 )
      ( MAKE-7PILE ?auto_123913 ?auto_123914 ?auto_123915 ?auto_123916 ?auto_123917 ?auto_123918 ?auto_123919 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_123921 - BLOCK
      ?auto_123922 - BLOCK
      ?auto_123923 - BLOCK
      ?auto_123924 - BLOCK
      ?auto_123925 - BLOCK
      ?auto_123926 - BLOCK
      ?auto_123927 - BLOCK
    )
    :vars
    (
      ?auto_123928 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123921 ) ( ON ?auto_123922 ?auto_123921 ) ( not ( = ?auto_123921 ?auto_123922 ) ) ( not ( = ?auto_123921 ?auto_123923 ) ) ( not ( = ?auto_123921 ?auto_123924 ) ) ( not ( = ?auto_123921 ?auto_123925 ) ) ( not ( = ?auto_123921 ?auto_123926 ) ) ( not ( = ?auto_123921 ?auto_123927 ) ) ( not ( = ?auto_123922 ?auto_123923 ) ) ( not ( = ?auto_123922 ?auto_123924 ) ) ( not ( = ?auto_123922 ?auto_123925 ) ) ( not ( = ?auto_123922 ?auto_123926 ) ) ( not ( = ?auto_123922 ?auto_123927 ) ) ( not ( = ?auto_123923 ?auto_123924 ) ) ( not ( = ?auto_123923 ?auto_123925 ) ) ( not ( = ?auto_123923 ?auto_123926 ) ) ( not ( = ?auto_123923 ?auto_123927 ) ) ( not ( = ?auto_123924 ?auto_123925 ) ) ( not ( = ?auto_123924 ?auto_123926 ) ) ( not ( = ?auto_123924 ?auto_123927 ) ) ( not ( = ?auto_123925 ?auto_123926 ) ) ( not ( = ?auto_123925 ?auto_123927 ) ) ( not ( = ?auto_123926 ?auto_123927 ) ) ( ON ?auto_123927 ?auto_123928 ) ( not ( = ?auto_123921 ?auto_123928 ) ) ( not ( = ?auto_123922 ?auto_123928 ) ) ( not ( = ?auto_123923 ?auto_123928 ) ) ( not ( = ?auto_123924 ?auto_123928 ) ) ( not ( = ?auto_123925 ?auto_123928 ) ) ( not ( = ?auto_123926 ?auto_123928 ) ) ( not ( = ?auto_123927 ?auto_123928 ) ) ( ON ?auto_123926 ?auto_123927 ) ( ON-TABLE ?auto_123928 ) ( ON ?auto_123925 ?auto_123926 ) ( ON ?auto_123924 ?auto_123925 ) ( CLEAR ?auto_123922 ) ( ON ?auto_123923 ?auto_123924 ) ( CLEAR ?auto_123923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123928 ?auto_123927 ?auto_123926 ?auto_123925 ?auto_123924 )
      ( MAKE-7PILE ?auto_123921 ?auto_123922 ?auto_123923 ?auto_123924 ?auto_123925 ?auto_123926 ?auto_123927 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_123929 - BLOCK
      ?auto_123930 - BLOCK
      ?auto_123931 - BLOCK
      ?auto_123932 - BLOCK
      ?auto_123933 - BLOCK
      ?auto_123934 - BLOCK
      ?auto_123935 - BLOCK
    )
    :vars
    (
      ?auto_123936 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123929 ) ( not ( = ?auto_123929 ?auto_123930 ) ) ( not ( = ?auto_123929 ?auto_123931 ) ) ( not ( = ?auto_123929 ?auto_123932 ) ) ( not ( = ?auto_123929 ?auto_123933 ) ) ( not ( = ?auto_123929 ?auto_123934 ) ) ( not ( = ?auto_123929 ?auto_123935 ) ) ( not ( = ?auto_123930 ?auto_123931 ) ) ( not ( = ?auto_123930 ?auto_123932 ) ) ( not ( = ?auto_123930 ?auto_123933 ) ) ( not ( = ?auto_123930 ?auto_123934 ) ) ( not ( = ?auto_123930 ?auto_123935 ) ) ( not ( = ?auto_123931 ?auto_123932 ) ) ( not ( = ?auto_123931 ?auto_123933 ) ) ( not ( = ?auto_123931 ?auto_123934 ) ) ( not ( = ?auto_123931 ?auto_123935 ) ) ( not ( = ?auto_123932 ?auto_123933 ) ) ( not ( = ?auto_123932 ?auto_123934 ) ) ( not ( = ?auto_123932 ?auto_123935 ) ) ( not ( = ?auto_123933 ?auto_123934 ) ) ( not ( = ?auto_123933 ?auto_123935 ) ) ( not ( = ?auto_123934 ?auto_123935 ) ) ( ON ?auto_123935 ?auto_123936 ) ( not ( = ?auto_123929 ?auto_123936 ) ) ( not ( = ?auto_123930 ?auto_123936 ) ) ( not ( = ?auto_123931 ?auto_123936 ) ) ( not ( = ?auto_123932 ?auto_123936 ) ) ( not ( = ?auto_123933 ?auto_123936 ) ) ( not ( = ?auto_123934 ?auto_123936 ) ) ( not ( = ?auto_123935 ?auto_123936 ) ) ( ON ?auto_123934 ?auto_123935 ) ( ON-TABLE ?auto_123936 ) ( ON ?auto_123933 ?auto_123934 ) ( ON ?auto_123932 ?auto_123933 ) ( ON ?auto_123931 ?auto_123932 ) ( CLEAR ?auto_123931 ) ( HOLDING ?auto_123930 ) ( CLEAR ?auto_123929 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123929 ?auto_123930 )
      ( MAKE-7PILE ?auto_123929 ?auto_123930 ?auto_123931 ?auto_123932 ?auto_123933 ?auto_123934 ?auto_123935 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_123937 - BLOCK
      ?auto_123938 - BLOCK
      ?auto_123939 - BLOCK
      ?auto_123940 - BLOCK
      ?auto_123941 - BLOCK
      ?auto_123942 - BLOCK
      ?auto_123943 - BLOCK
    )
    :vars
    (
      ?auto_123944 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123937 ) ( not ( = ?auto_123937 ?auto_123938 ) ) ( not ( = ?auto_123937 ?auto_123939 ) ) ( not ( = ?auto_123937 ?auto_123940 ) ) ( not ( = ?auto_123937 ?auto_123941 ) ) ( not ( = ?auto_123937 ?auto_123942 ) ) ( not ( = ?auto_123937 ?auto_123943 ) ) ( not ( = ?auto_123938 ?auto_123939 ) ) ( not ( = ?auto_123938 ?auto_123940 ) ) ( not ( = ?auto_123938 ?auto_123941 ) ) ( not ( = ?auto_123938 ?auto_123942 ) ) ( not ( = ?auto_123938 ?auto_123943 ) ) ( not ( = ?auto_123939 ?auto_123940 ) ) ( not ( = ?auto_123939 ?auto_123941 ) ) ( not ( = ?auto_123939 ?auto_123942 ) ) ( not ( = ?auto_123939 ?auto_123943 ) ) ( not ( = ?auto_123940 ?auto_123941 ) ) ( not ( = ?auto_123940 ?auto_123942 ) ) ( not ( = ?auto_123940 ?auto_123943 ) ) ( not ( = ?auto_123941 ?auto_123942 ) ) ( not ( = ?auto_123941 ?auto_123943 ) ) ( not ( = ?auto_123942 ?auto_123943 ) ) ( ON ?auto_123943 ?auto_123944 ) ( not ( = ?auto_123937 ?auto_123944 ) ) ( not ( = ?auto_123938 ?auto_123944 ) ) ( not ( = ?auto_123939 ?auto_123944 ) ) ( not ( = ?auto_123940 ?auto_123944 ) ) ( not ( = ?auto_123941 ?auto_123944 ) ) ( not ( = ?auto_123942 ?auto_123944 ) ) ( not ( = ?auto_123943 ?auto_123944 ) ) ( ON ?auto_123942 ?auto_123943 ) ( ON-TABLE ?auto_123944 ) ( ON ?auto_123941 ?auto_123942 ) ( ON ?auto_123940 ?auto_123941 ) ( ON ?auto_123939 ?auto_123940 ) ( CLEAR ?auto_123937 ) ( ON ?auto_123938 ?auto_123939 ) ( CLEAR ?auto_123938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123944 ?auto_123943 ?auto_123942 ?auto_123941 ?auto_123940 ?auto_123939 )
      ( MAKE-7PILE ?auto_123937 ?auto_123938 ?auto_123939 ?auto_123940 ?auto_123941 ?auto_123942 ?auto_123943 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_123945 - BLOCK
      ?auto_123946 - BLOCK
      ?auto_123947 - BLOCK
      ?auto_123948 - BLOCK
      ?auto_123949 - BLOCK
      ?auto_123950 - BLOCK
      ?auto_123951 - BLOCK
    )
    :vars
    (
      ?auto_123952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123945 ?auto_123946 ) ) ( not ( = ?auto_123945 ?auto_123947 ) ) ( not ( = ?auto_123945 ?auto_123948 ) ) ( not ( = ?auto_123945 ?auto_123949 ) ) ( not ( = ?auto_123945 ?auto_123950 ) ) ( not ( = ?auto_123945 ?auto_123951 ) ) ( not ( = ?auto_123946 ?auto_123947 ) ) ( not ( = ?auto_123946 ?auto_123948 ) ) ( not ( = ?auto_123946 ?auto_123949 ) ) ( not ( = ?auto_123946 ?auto_123950 ) ) ( not ( = ?auto_123946 ?auto_123951 ) ) ( not ( = ?auto_123947 ?auto_123948 ) ) ( not ( = ?auto_123947 ?auto_123949 ) ) ( not ( = ?auto_123947 ?auto_123950 ) ) ( not ( = ?auto_123947 ?auto_123951 ) ) ( not ( = ?auto_123948 ?auto_123949 ) ) ( not ( = ?auto_123948 ?auto_123950 ) ) ( not ( = ?auto_123948 ?auto_123951 ) ) ( not ( = ?auto_123949 ?auto_123950 ) ) ( not ( = ?auto_123949 ?auto_123951 ) ) ( not ( = ?auto_123950 ?auto_123951 ) ) ( ON ?auto_123951 ?auto_123952 ) ( not ( = ?auto_123945 ?auto_123952 ) ) ( not ( = ?auto_123946 ?auto_123952 ) ) ( not ( = ?auto_123947 ?auto_123952 ) ) ( not ( = ?auto_123948 ?auto_123952 ) ) ( not ( = ?auto_123949 ?auto_123952 ) ) ( not ( = ?auto_123950 ?auto_123952 ) ) ( not ( = ?auto_123951 ?auto_123952 ) ) ( ON ?auto_123950 ?auto_123951 ) ( ON-TABLE ?auto_123952 ) ( ON ?auto_123949 ?auto_123950 ) ( ON ?auto_123948 ?auto_123949 ) ( ON ?auto_123947 ?auto_123948 ) ( ON ?auto_123946 ?auto_123947 ) ( CLEAR ?auto_123946 ) ( HOLDING ?auto_123945 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_123945 )
      ( MAKE-7PILE ?auto_123945 ?auto_123946 ?auto_123947 ?auto_123948 ?auto_123949 ?auto_123950 ?auto_123951 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_123953 - BLOCK
      ?auto_123954 - BLOCK
      ?auto_123955 - BLOCK
      ?auto_123956 - BLOCK
      ?auto_123957 - BLOCK
      ?auto_123958 - BLOCK
      ?auto_123959 - BLOCK
    )
    :vars
    (
      ?auto_123960 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123953 ?auto_123954 ) ) ( not ( = ?auto_123953 ?auto_123955 ) ) ( not ( = ?auto_123953 ?auto_123956 ) ) ( not ( = ?auto_123953 ?auto_123957 ) ) ( not ( = ?auto_123953 ?auto_123958 ) ) ( not ( = ?auto_123953 ?auto_123959 ) ) ( not ( = ?auto_123954 ?auto_123955 ) ) ( not ( = ?auto_123954 ?auto_123956 ) ) ( not ( = ?auto_123954 ?auto_123957 ) ) ( not ( = ?auto_123954 ?auto_123958 ) ) ( not ( = ?auto_123954 ?auto_123959 ) ) ( not ( = ?auto_123955 ?auto_123956 ) ) ( not ( = ?auto_123955 ?auto_123957 ) ) ( not ( = ?auto_123955 ?auto_123958 ) ) ( not ( = ?auto_123955 ?auto_123959 ) ) ( not ( = ?auto_123956 ?auto_123957 ) ) ( not ( = ?auto_123956 ?auto_123958 ) ) ( not ( = ?auto_123956 ?auto_123959 ) ) ( not ( = ?auto_123957 ?auto_123958 ) ) ( not ( = ?auto_123957 ?auto_123959 ) ) ( not ( = ?auto_123958 ?auto_123959 ) ) ( ON ?auto_123959 ?auto_123960 ) ( not ( = ?auto_123953 ?auto_123960 ) ) ( not ( = ?auto_123954 ?auto_123960 ) ) ( not ( = ?auto_123955 ?auto_123960 ) ) ( not ( = ?auto_123956 ?auto_123960 ) ) ( not ( = ?auto_123957 ?auto_123960 ) ) ( not ( = ?auto_123958 ?auto_123960 ) ) ( not ( = ?auto_123959 ?auto_123960 ) ) ( ON ?auto_123958 ?auto_123959 ) ( ON-TABLE ?auto_123960 ) ( ON ?auto_123957 ?auto_123958 ) ( ON ?auto_123956 ?auto_123957 ) ( ON ?auto_123955 ?auto_123956 ) ( ON ?auto_123954 ?auto_123955 ) ( ON ?auto_123953 ?auto_123954 ) ( CLEAR ?auto_123953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123960 ?auto_123959 ?auto_123958 ?auto_123957 ?auto_123956 ?auto_123955 ?auto_123954 )
      ( MAKE-7PILE ?auto_123953 ?auto_123954 ?auto_123955 ?auto_123956 ?auto_123957 ?auto_123958 ?auto_123959 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_123968 - BLOCK
      ?auto_123969 - BLOCK
      ?auto_123970 - BLOCK
      ?auto_123971 - BLOCK
      ?auto_123972 - BLOCK
      ?auto_123973 - BLOCK
      ?auto_123974 - BLOCK
    )
    :vars
    (
      ?auto_123975 - BLOCK
      ?auto_123976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123968 ?auto_123969 ) ) ( not ( = ?auto_123968 ?auto_123970 ) ) ( not ( = ?auto_123968 ?auto_123971 ) ) ( not ( = ?auto_123968 ?auto_123972 ) ) ( not ( = ?auto_123968 ?auto_123973 ) ) ( not ( = ?auto_123968 ?auto_123974 ) ) ( not ( = ?auto_123969 ?auto_123970 ) ) ( not ( = ?auto_123969 ?auto_123971 ) ) ( not ( = ?auto_123969 ?auto_123972 ) ) ( not ( = ?auto_123969 ?auto_123973 ) ) ( not ( = ?auto_123969 ?auto_123974 ) ) ( not ( = ?auto_123970 ?auto_123971 ) ) ( not ( = ?auto_123970 ?auto_123972 ) ) ( not ( = ?auto_123970 ?auto_123973 ) ) ( not ( = ?auto_123970 ?auto_123974 ) ) ( not ( = ?auto_123971 ?auto_123972 ) ) ( not ( = ?auto_123971 ?auto_123973 ) ) ( not ( = ?auto_123971 ?auto_123974 ) ) ( not ( = ?auto_123972 ?auto_123973 ) ) ( not ( = ?auto_123972 ?auto_123974 ) ) ( not ( = ?auto_123973 ?auto_123974 ) ) ( ON ?auto_123974 ?auto_123975 ) ( not ( = ?auto_123968 ?auto_123975 ) ) ( not ( = ?auto_123969 ?auto_123975 ) ) ( not ( = ?auto_123970 ?auto_123975 ) ) ( not ( = ?auto_123971 ?auto_123975 ) ) ( not ( = ?auto_123972 ?auto_123975 ) ) ( not ( = ?auto_123973 ?auto_123975 ) ) ( not ( = ?auto_123974 ?auto_123975 ) ) ( ON ?auto_123973 ?auto_123974 ) ( ON-TABLE ?auto_123975 ) ( ON ?auto_123972 ?auto_123973 ) ( ON ?auto_123971 ?auto_123972 ) ( ON ?auto_123970 ?auto_123971 ) ( ON ?auto_123969 ?auto_123970 ) ( CLEAR ?auto_123969 ) ( ON ?auto_123968 ?auto_123976 ) ( CLEAR ?auto_123968 ) ( HAND-EMPTY ) ( not ( = ?auto_123968 ?auto_123976 ) ) ( not ( = ?auto_123969 ?auto_123976 ) ) ( not ( = ?auto_123970 ?auto_123976 ) ) ( not ( = ?auto_123971 ?auto_123976 ) ) ( not ( = ?auto_123972 ?auto_123976 ) ) ( not ( = ?auto_123973 ?auto_123976 ) ) ( not ( = ?auto_123974 ?auto_123976 ) ) ( not ( = ?auto_123975 ?auto_123976 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_123968 ?auto_123976 )
      ( MAKE-7PILE ?auto_123968 ?auto_123969 ?auto_123970 ?auto_123971 ?auto_123972 ?auto_123973 ?auto_123974 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_123977 - BLOCK
      ?auto_123978 - BLOCK
      ?auto_123979 - BLOCK
      ?auto_123980 - BLOCK
      ?auto_123981 - BLOCK
      ?auto_123982 - BLOCK
      ?auto_123983 - BLOCK
    )
    :vars
    (
      ?auto_123984 - BLOCK
      ?auto_123985 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123977 ?auto_123978 ) ) ( not ( = ?auto_123977 ?auto_123979 ) ) ( not ( = ?auto_123977 ?auto_123980 ) ) ( not ( = ?auto_123977 ?auto_123981 ) ) ( not ( = ?auto_123977 ?auto_123982 ) ) ( not ( = ?auto_123977 ?auto_123983 ) ) ( not ( = ?auto_123978 ?auto_123979 ) ) ( not ( = ?auto_123978 ?auto_123980 ) ) ( not ( = ?auto_123978 ?auto_123981 ) ) ( not ( = ?auto_123978 ?auto_123982 ) ) ( not ( = ?auto_123978 ?auto_123983 ) ) ( not ( = ?auto_123979 ?auto_123980 ) ) ( not ( = ?auto_123979 ?auto_123981 ) ) ( not ( = ?auto_123979 ?auto_123982 ) ) ( not ( = ?auto_123979 ?auto_123983 ) ) ( not ( = ?auto_123980 ?auto_123981 ) ) ( not ( = ?auto_123980 ?auto_123982 ) ) ( not ( = ?auto_123980 ?auto_123983 ) ) ( not ( = ?auto_123981 ?auto_123982 ) ) ( not ( = ?auto_123981 ?auto_123983 ) ) ( not ( = ?auto_123982 ?auto_123983 ) ) ( ON ?auto_123983 ?auto_123984 ) ( not ( = ?auto_123977 ?auto_123984 ) ) ( not ( = ?auto_123978 ?auto_123984 ) ) ( not ( = ?auto_123979 ?auto_123984 ) ) ( not ( = ?auto_123980 ?auto_123984 ) ) ( not ( = ?auto_123981 ?auto_123984 ) ) ( not ( = ?auto_123982 ?auto_123984 ) ) ( not ( = ?auto_123983 ?auto_123984 ) ) ( ON ?auto_123982 ?auto_123983 ) ( ON-TABLE ?auto_123984 ) ( ON ?auto_123981 ?auto_123982 ) ( ON ?auto_123980 ?auto_123981 ) ( ON ?auto_123979 ?auto_123980 ) ( ON ?auto_123977 ?auto_123985 ) ( CLEAR ?auto_123977 ) ( not ( = ?auto_123977 ?auto_123985 ) ) ( not ( = ?auto_123978 ?auto_123985 ) ) ( not ( = ?auto_123979 ?auto_123985 ) ) ( not ( = ?auto_123980 ?auto_123985 ) ) ( not ( = ?auto_123981 ?auto_123985 ) ) ( not ( = ?auto_123982 ?auto_123985 ) ) ( not ( = ?auto_123983 ?auto_123985 ) ) ( not ( = ?auto_123984 ?auto_123985 ) ) ( HOLDING ?auto_123978 ) ( CLEAR ?auto_123979 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123984 ?auto_123983 ?auto_123982 ?auto_123981 ?auto_123980 ?auto_123979 ?auto_123978 )
      ( MAKE-7PILE ?auto_123977 ?auto_123978 ?auto_123979 ?auto_123980 ?auto_123981 ?auto_123982 ?auto_123983 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_123986 - BLOCK
      ?auto_123987 - BLOCK
      ?auto_123988 - BLOCK
      ?auto_123989 - BLOCK
      ?auto_123990 - BLOCK
      ?auto_123991 - BLOCK
      ?auto_123992 - BLOCK
    )
    :vars
    (
      ?auto_123993 - BLOCK
      ?auto_123994 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123986 ?auto_123987 ) ) ( not ( = ?auto_123986 ?auto_123988 ) ) ( not ( = ?auto_123986 ?auto_123989 ) ) ( not ( = ?auto_123986 ?auto_123990 ) ) ( not ( = ?auto_123986 ?auto_123991 ) ) ( not ( = ?auto_123986 ?auto_123992 ) ) ( not ( = ?auto_123987 ?auto_123988 ) ) ( not ( = ?auto_123987 ?auto_123989 ) ) ( not ( = ?auto_123987 ?auto_123990 ) ) ( not ( = ?auto_123987 ?auto_123991 ) ) ( not ( = ?auto_123987 ?auto_123992 ) ) ( not ( = ?auto_123988 ?auto_123989 ) ) ( not ( = ?auto_123988 ?auto_123990 ) ) ( not ( = ?auto_123988 ?auto_123991 ) ) ( not ( = ?auto_123988 ?auto_123992 ) ) ( not ( = ?auto_123989 ?auto_123990 ) ) ( not ( = ?auto_123989 ?auto_123991 ) ) ( not ( = ?auto_123989 ?auto_123992 ) ) ( not ( = ?auto_123990 ?auto_123991 ) ) ( not ( = ?auto_123990 ?auto_123992 ) ) ( not ( = ?auto_123991 ?auto_123992 ) ) ( ON ?auto_123992 ?auto_123993 ) ( not ( = ?auto_123986 ?auto_123993 ) ) ( not ( = ?auto_123987 ?auto_123993 ) ) ( not ( = ?auto_123988 ?auto_123993 ) ) ( not ( = ?auto_123989 ?auto_123993 ) ) ( not ( = ?auto_123990 ?auto_123993 ) ) ( not ( = ?auto_123991 ?auto_123993 ) ) ( not ( = ?auto_123992 ?auto_123993 ) ) ( ON ?auto_123991 ?auto_123992 ) ( ON-TABLE ?auto_123993 ) ( ON ?auto_123990 ?auto_123991 ) ( ON ?auto_123989 ?auto_123990 ) ( ON ?auto_123988 ?auto_123989 ) ( ON ?auto_123986 ?auto_123994 ) ( not ( = ?auto_123986 ?auto_123994 ) ) ( not ( = ?auto_123987 ?auto_123994 ) ) ( not ( = ?auto_123988 ?auto_123994 ) ) ( not ( = ?auto_123989 ?auto_123994 ) ) ( not ( = ?auto_123990 ?auto_123994 ) ) ( not ( = ?auto_123991 ?auto_123994 ) ) ( not ( = ?auto_123992 ?auto_123994 ) ) ( not ( = ?auto_123993 ?auto_123994 ) ) ( CLEAR ?auto_123988 ) ( ON ?auto_123987 ?auto_123986 ) ( CLEAR ?auto_123987 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_123994 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123994 ?auto_123986 )
      ( MAKE-7PILE ?auto_123986 ?auto_123987 ?auto_123988 ?auto_123989 ?auto_123990 ?auto_123991 ?auto_123992 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_123995 - BLOCK
      ?auto_123996 - BLOCK
      ?auto_123997 - BLOCK
      ?auto_123998 - BLOCK
      ?auto_123999 - BLOCK
      ?auto_124000 - BLOCK
      ?auto_124001 - BLOCK
    )
    :vars
    (
      ?auto_124002 - BLOCK
      ?auto_124003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123995 ?auto_123996 ) ) ( not ( = ?auto_123995 ?auto_123997 ) ) ( not ( = ?auto_123995 ?auto_123998 ) ) ( not ( = ?auto_123995 ?auto_123999 ) ) ( not ( = ?auto_123995 ?auto_124000 ) ) ( not ( = ?auto_123995 ?auto_124001 ) ) ( not ( = ?auto_123996 ?auto_123997 ) ) ( not ( = ?auto_123996 ?auto_123998 ) ) ( not ( = ?auto_123996 ?auto_123999 ) ) ( not ( = ?auto_123996 ?auto_124000 ) ) ( not ( = ?auto_123996 ?auto_124001 ) ) ( not ( = ?auto_123997 ?auto_123998 ) ) ( not ( = ?auto_123997 ?auto_123999 ) ) ( not ( = ?auto_123997 ?auto_124000 ) ) ( not ( = ?auto_123997 ?auto_124001 ) ) ( not ( = ?auto_123998 ?auto_123999 ) ) ( not ( = ?auto_123998 ?auto_124000 ) ) ( not ( = ?auto_123998 ?auto_124001 ) ) ( not ( = ?auto_123999 ?auto_124000 ) ) ( not ( = ?auto_123999 ?auto_124001 ) ) ( not ( = ?auto_124000 ?auto_124001 ) ) ( ON ?auto_124001 ?auto_124002 ) ( not ( = ?auto_123995 ?auto_124002 ) ) ( not ( = ?auto_123996 ?auto_124002 ) ) ( not ( = ?auto_123997 ?auto_124002 ) ) ( not ( = ?auto_123998 ?auto_124002 ) ) ( not ( = ?auto_123999 ?auto_124002 ) ) ( not ( = ?auto_124000 ?auto_124002 ) ) ( not ( = ?auto_124001 ?auto_124002 ) ) ( ON ?auto_124000 ?auto_124001 ) ( ON-TABLE ?auto_124002 ) ( ON ?auto_123999 ?auto_124000 ) ( ON ?auto_123998 ?auto_123999 ) ( ON ?auto_123995 ?auto_124003 ) ( not ( = ?auto_123995 ?auto_124003 ) ) ( not ( = ?auto_123996 ?auto_124003 ) ) ( not ( = ?auto_123997 ?auto_124003 ) ) ( not ( = ?auto_123998 ?auto_124003 ) ) ( not ( = ?auto_123999 ?auto_124003 ) ) ( not ( = ?auto_124000 ?auto_124003 ) ) ( not ( = ?auto_124001 ?auto_124003 ) ) ( not ( = ?auto_124002 ?auto_124003 ) ) ( ON ?auto_123996 ?auto_123995 ) ( CLEAR ?auto_123996 ) ( ON-TABLE ?auto_124003 ) ( HOLDING ?auto_123997 ) ( CLEAR ?auto_123998 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124002 ?auto_124001 ?auto_124000 ?auto_123999 ?auto_123998 ?auto_123997 )
      ( MAKE-7PILE ?auto_123995 ?auto_123996 ?auto_123997 ?auto_123998 ?auto_123999 ?auto_124000 ?auto_124001 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124004 - BLOCK
      ?auto_124005 - BLOCK
      ?auto_124006 - BLOCK
      ?auto_124007 - BLOCK
      ?auto_124008 - BLOCK
      ?auto_124009 - BLOCK
      ?auto_124010 - BLOCK
    )
    :vars
    (
      ?auto_124011 - BLOCK
      ?auto_124012 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124004 ?auto_124005 ) ) ( not ( = ?auto_124004 ?auto_124006 ) ) ( not ( = ?auto_124004 ?auto_124007 ) ) ( not ( = ?auto_124004 ?auto_124008 ) ) ( not ( = ?auto_124004 ?auto_124009 ) ) ( not ( = ?auto_124004 ?auto_124010 ) ) ( not ( = ?auto_124005 ?auto_124006 ) ) ( not ( = ?auto_124005 ?auto_124007 ) ) ( not ( = ?auto_124005 ?auto_124008 ) ) ( not ( = ?auto_124005 ?auto_124009 ) ) ( not ( = ?auto_124005 ?auto_124010 ) ) ( not ( = ?auto_124006 ?auto_124007 ) ) ( not ( = ?auto_124006 ?auto_124008 ) ) ( not ( = ?auto_124006 ?auto_124009 ) ) ( not ( = ?auto_124006 ?auto_124010 ) ) ( not ( = ?auto_124007 ?auto_124008 ) ) ( not ( = ?auto_124007 ?auto_124009 ) ) ( not ( = ?auto_124007 ?auto_124010 ) ) ( not ( = ?auto_124008 ?auto_124009 ) ) ( not ( = ?auto_124008 ?auto_124010 ) ) ( not ( = ?auto_124009 ?auto_124010 ) ) ( ON ?auto_124010 ?auto_124011 ) ( not ( = ?auto_124004 ?auto_124011 ) ) ( not ( = ?auto_124005 ?auto_124011 ) ) ( not ( = ?auto_124006 ?auto_124011 ) ) ( not ( = ?auto_124007 ?auto_124011 ) ) ( not ( = ?auto_124008 ?auto_124011 ) ) ( not ( = ?auto_124009 ?auto_124011 ) ) ( not ( = ?auto_124010 ?auto_124011 ) ) ( ON ?auto_124009 ?auto_124010 ) ( ON-TABLE ?auto_124011 ) ( ON ?auto_124008 ?auto_124009 ) ( ON ?auto_124007 ?auto_124008 ) ( ON ?auto_124004 ?auto_124012 ) ( not ( = ?auto_124004 ?auto_124012 ) ) ( not ( = ?auto_124005 ?auto_124012 ) ) ( not ( = ?auto_124006 ?auto_124012 ) ) ( not ( = ?auto_124007 ?auto_124012 ) ) ( not ( = ?auto_124008 ?auto_124012 ) ) ( not ( = ?auto_124009 ?auto_124012 ) ) ( not ( = ?auto_124010 ?auto_124012 ) ) ( not ( = ?auto_124011 ?auto_124012 ) ) ( ON ?auto_124005 ?auto_124004 ) ( ON-TABLE ?auto_124012 ) ( CLEAR ?auto_124007 ) ( ON ?auto_124006 ?auto_124005 ) ( CLEAR ?auto_124006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124012 ?auto_124004 ?auto_124005 )
      ( MAKE-7PILE ?auto_124004 ?auto_124005 ?auto_124006 ?auto_124007 ?auto_124008 ?auto_124009 ?auto_124010 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124013 - BLOCK
      ?auto_124014 - BLOCK
      ?auto_124015 - BLOCK
      ?auto_124016 - BLOCK
      ?auto_124017 - BLOCK
      ?auto_124018 - BLOCK
      ?auto_124019 - BLOCK
    )
    :vars
    (
      ?auto_124020 - BLOCK
      ?auto_124021 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124013 ?auto_124014 ) ) ( not ( = ?auto_124013 ?auto_124015 ) ) ( not ( = ?auto_124013 ?auto_124016 ) ) ( not ( = ?auto_124013 ?auto_124017 ) ) ( not ( = ?auto_124013 ?auto_124018 ) ) ( not ( = ?auto_124013 ?auto_124019 ) ) ( not ( = ?auto_124014 ?auto_124015 ) ) ( not ( = ?auto_124014 ?auto_124016 ) ) ( not ( = ?auto_124014 ?auto_124017 ) ) ( not ( = ?auto_124014 ?auto_124018 ) ) ( not ( = ?auto_124014 ?auto_124019 ) ) ( not ( = ?auto_124015 ?auto_124016 ) ) ( not ( = ?auto_124015 ?auto_124017 ) ) ( not ( = ?auto_124015 ?auto_124018 ) ) ( not ( = ?auto_124015 ?auto_124019 ) ) ( not ( = ?auto_124016 ?auto_124017 ) ) ( not ( = ?auto_124016 ?auto_124018 ) ) ( not ( = ?auto_124016 ?auto_124019 ) ) ( not ( = ?auto_124017 ?auto_124018 ) ) ( not ( = ?auto_124017 ?auto_124019 ) ) ( not ( = ?auto_124018 ?auto_124019 ) ) ( ON ?auto_124019 ?auto_124020 ) ( not ( = ?auto_124013 ?auto_124020 ) ) ( not ( = ?auto_124014 ?auto_124020 ) ) ( not ( = ?auto_124015 ?auto_124020 ) ) ( not ( = ?auto_124016 ?auto_124020 ) ) ( not ( = ?auto_124017 ?auto_124020 ) ) ( not ( = ?auto_124018 ?auto_124020 ) ) ( not ( = ?auto_124019 ?auto_124020 ) ) ( ON ?auto_124018 ?auto_124019 ) ( ON-TABLE ?auto_124020 ) ( ON ?auto_124017 ?auto_124018 ) ( ON ?auto_124013 ?auto_124021 ) ( not ( = ?auto_124013 ?auto_124021 ) ) ( not ( = ?auto_124014 ?auto_124021 ) ) ( not ( = ?auto_124015 ?auto_124021 ) ) ( not ( = ?auto_124016 ?auto_124021 ) ) ( not ( = ?auto_124017 ?auto_124021 ) ) ( not ( = ?auto_124018 ?auto_124021 ) ) ( not ( = ?auto_124019 ?auto_124021 ) ) ( not ( = ?auto_124020 ?auto_124021 ) ) ( ON ?auto_124014 ?auto_124013 ) ( ON-TABLE ?auto_124021 ) ( ON ?auto_124015 ?auto_124014 ) ( CLEAR ?auto_124015 ) ( HOLDING ?auto_124016 ) ( CLEAR ?auto_124017 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124020 ?auto_124019 ?auto_124018 ?auto_124017 ?auto_124016 )
      ( MAKE-7PILE ?auto_124013 ?auto_124014 ?auto_124015 ?auto_124016 ?auto_124017 ?auto_124018 ?auto_124019 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124022 - BLOCK
      ?auto_124023 - BLOCK
      ?auto_124024 - BLOCK
      ?auto_124025 - BLOCK
      ?auto_124026 - BLOCK
      ?auto_124027 - BLOCK
      ?auto_124028 - BLOCK
    )
    :vars
    (
      ?auto_124029 - BLOCK
      ?auto_124030 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124022 ?auto_124023 ) ) ( not ( = ?auto_124022 ?auto_124024 ) ) ( not ( = ?auto_124022 ?auto_124025 ) ) ( not ( = ?auto_124022 ?auto_124026 ) ) ( not ( = ?auto_124022 ?auto_124027 ) ) ( not ( = ?auto_124022 ?auto_124028 ) ) ( not ( = ?auto_124023 ?auto_124024 ) ) ( not ( = ?auto_124023 ?auto_124025 ) ) ( not ( = ?auto_124023 ?auto_124026 ) ) ( not ( = ?auto_124023 ?auto_124027 ) ) ( not ( = ?auto_124023 ?auto_124028 ) ) ( not ( = ?auto_124024 ?auto_124025 ) ) ( not ( = ?auto_124024 ?auto_124026 ) ) ( not ( = ?auto_124024 ?auto_124027 ) ) ( not ( = ?auto_124024 ?auto_124028 ) ) ( not ( = ?auto_124025 ?auto_124026 ) ) ( not ( = ?auto_124025 ?auto_124027 ) ) ( not ( = ?auto_124025 ?auto_124028 ) ) ( not ( = ?auto_124026 ?auto_124027 ) ) ( not ( = ?auto_124026 ?auto_124028 ) ) ( not ( = ?auto_124027 ?auto_124028 ) ) ( ON ?auto_124028 ?auto_124029 ) ( not ( = ?auto_124022 ?auto_124029 ) ) ( not ( = ?auto_124023 ?auto_124029 ) ) ( not ( = ?auto_124024 ?auto_124029 ) ) ( not ( = ?auto_124025 ?auto_124029 ) ) ( not ( = ?auto_124026 ?auto_124029 ) ) ( not ( = ?auto_124027 ?auto_124029 ) ) ( not ( = ?auto_124028 ?auto_124029 ) ) ( ON ?auto_124027 ?auto_124028 ) ( ON-TABLE ?auto_124029 ) ( ON ?auto_124026 ?auto_124027 ) ( ON ?auto_124022 ?auto_124030 ) ( not ( = ?auto_124022 ?auto_124030 ) ) ( not ( = ?auto_124023 ?auto_124030 ) ) ( not ( = ?auto_124024 ?auto_124030 ) ) ( not ( = ?auto_124025 ?auto_124030 ) ) ( not ( = ?auto_124026 ?auto_124030 ) ) ( not ( = ?auto_124027 ?auto_124030 ) ) ( not ( = ?auto_124028 ?auto_124030 ) ) ( not ( = ?auto_124029 ?auto_124030 ) ) ( ON ?auto_124023 ?auto_124022 ) ( ON-TABLE ?auto_124030 ) ( ON ?auto_124024 ?auto_124023 ) ( CLEAR ?auto_124026 ) ( ON ?auto_124025 ?auto_124024 ) ( CLEAR ?auto_124025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124030 ?auto_124022 ?auto_124023 ?auto_124024 )
      ( MAKE-7PILE ?auto_124022 ?auto_124023 ?auto_124024 ?auto_124025 ?auto_124026 ?auto_124027 ?auto_124028 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124031 - BLOCK
      ?auto_124032 - BLOCK
      ?auto_124033 - BLOCK
      ?auto_124034 - BLOCK
      ?auto_124035 - BLOCK
      ?auto_124036 - BLOCK
      ?auto_124037 - BLOCK
    )
    :vars
    (
      ?auto_124039 - BLOCK
      ?auto_124038 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124031 ?auto_124032 ) ) ( not ( = ?auto_124031 ?auto_124033 ) ) ( not ( = ?auto_124031 ?auto_124034 ) ) ( not ( = ?auto_124031 ?auto_124035 ) ) ( not ( = ?auto_124031 ?auto_124036 ) ) ( not ( = ?auto_124031 ?auto_124037 ) ) ( not ( = ?auto_124032 ?auto_124033 ) ) ( not ( = ?auto_124032 ?auto_124034 ) ) ( not ( = ?auto_124032 ?auto_124035 ) ) ( not ( = ?auto_124032 ?auto_124036 ) ) ( not ( = ?auto_124032 ?auto_124037 ) ) ( not ( = ?auto_124033 ?auto_124034 ) ) ( not ( = ?auto_124033 ?auto_124035 ) ) ( not ( = ?auto_124033 ?auto_124036 ) ) ( not ( = ?auto_124033 ?auto_124037 ) ) ( not ( = ?auto_124034 ?auto_124035 ) ) ( not ( = ?auto_124034 ?auto_124036 ) ) ( not ( = ?auto_124034 ?auto_124037 ) ) ( not ( = ?auto_124035 ?auto_124036 ) ) ( not ( = ?auto_124035 ?auto_124037 ) ) ( not ( = ?auto_124036 ?auto_124037 ) ) ( ON ?auto_124037 ?auto_124039 ) ( not ( = ?auto_124031 ?auto_124039 ) ) ( not ( = ?auto_124032 ?auto_124039 ) ) ( not ( = ?auto_124033 ?auto_124039 ) ) ( not ( = ?auto_124034 ?auto_124039 ) ) ( not ( = ?auto_124035 ?auto_124039 ) ) ( not ( = ?auto_124036 ?auto_124039 ) ) ( not ( = ?auto_124037 ?auto_124039 ) ) ( ON ?auto_124036 ?auto_124037 ) ( ON-TABLE ?auto_124039 ) ( ON ?auto_124031 ?auto_124038 ) ( not ( = ?auto_124031 ?auto_124038 ) ) ( not ( = ?auto_124032 ?auto_124038 ) ) ( not ( = ?auto_124033 ?auto_124038 ) ) ( not ( = ?auto_124034 ?auto_124038 ) ) ( not ( = ?auto_124035 ?auto_124038 ) ) ( not ( = ?auto_124036 ?auto_124038 ) ) ( not ( = ?auto_124037 ?auto_124038 ) ) ( not ( = ?auto_124039 ?auto_124038 ) ) ( ON ?auto_124032 ?auto_124031 ) ( ON-TABLE ?auto_124038 ) ( ON ?auto_124033 ?auto_124032 ) ( ON ?auto_124034 ?auto_124033 ) ( CLEAR ?auto_124034 ) ( HOLDING ?auto_124035 ) ( CLEAR ?auto_124036 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124039 ?auto_124037 ?auto_124036 ?auto_124035 )
      ( MAKE-7PILE ?auto_124031 ?auto_124032 ?auto_124033 ?auto_124034 ?auto_124035 ?auto_124036 ?auto_124037 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124040 - BLOCK
      ?auto_124041 - BLOCK
      ?auto_124042 - BLOCK
      ?auto_124043 - BLOCK
      ?auto_124044 - BLOCK
      ?auto_124045 - BLOCK
      ?auto_124046 - BLOCK
    )
    :vars
    (
      ?auto_124047 - BLOCK
      ?auto_124048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124040 ?auto_124041 ) ) ( not ( = ?auto_124040 ?auto_124042 ) ) ( not ( = ?auto_124040 ?auto_124043 ) ) ( not ( = ?auto_124040 ?auto_124044 ) ) ( not ( = ?auto_124040 ?auto_124045 ) ) ( not ( = ?auto_124040 ?auto_124046 ) ) ( not ( = ?auto_124041 ?auto_124042 ) ) ( not ( = ?auto_124041 ?auto_124043 ) ) ( not ( = ?auto_124041 ?auto_124044 ) ) ( not ( = ?auto_124041 ?auto_124045 ) ) ( not ( = ?auto_124041 ?auto_124046 ) ) ( not ( = ?auto_124042 ?auto_124043 ) ) ( not ( = ?auto_124042 ?auto_124044 ) ) ( not ( = ?auto_124042 ?auto_124045 ) ) ( not ( = ?auto_124042 ?auto_124046 ) ) ( not ( = ?auto_124043 ?auto_124044 ) ) ( not ( = ?auto_124043 ?auto_124045 ) ) ( not ( = ?auto_124043 ?auto_124046 ) ) ( not ( = ?auto_124044 ?auto_124045 ) ) ( not ( = ?auto_124044 ?auto_124046 ) ) ( not ( = ?auto_124045 ?auto_124046 ) ) ( ON ?auto_124046 ?auto_124047 ) ( not ( = ?auto_124040 ?auto_124047 ) ) ( not ( = ?auto_124041 ?auto_124047 ) ) ( not ( = ?auto_124042 ?auto_124047 ) ) ( not ( = ?auto_124043 ?auto_124047 ) ) ( not ( = ?auto_124044 ?auto_124047 ) ) ( not ( = ?auto_124045 ?auto_124047 ) ) ( not ( = ?auto_124046 ?auto_124047 ) ) ( ON ?auto_124045 ?auto_124046 ) ( ON-TABLE ?auto_124047 ) ( ON ?auto_124040 ?auto_124048 ) ( not ( = ?auto_124040 ?auto_124048 ) ) ( not ( = ?auto_124041 ?auto_124048 ) ) ( not ( = ?auto_124042 ?auto_124048 ) ) ( not ( = ?auto_124043 ?auto_124048 ) ) ( not ( = ?auto_124044 ?auto_124048 ) ) ( not ( = ?auto_124045 ?auto_124048 ) ) ( not ( = ?auto_124046 ?auto_124048 ) ) ( not ( = ?auto_124047 ?auto_124048 ) ) ( ON ?auto_124041 ?auto_124040 ) ( ON-TABLE ?auto_124048 ) ( ON ?auto_124042 ?auto_124041 ) ( ON ?auto_124043 ?auto_124042 ) ( CLEAR ?auto_124045 ) ( ON ?auto_124044 ?auto_124043 ) ( CLEAR ?auto_124044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124048 ?auto_124040 ?auto_124041 ?auto_124042 ?auto_124043 )
      ( MAKE-7PILE ?auto_124040 ?auto_124041 ?auto_124042 ?auto_124043 ?auto_124044 ?auto_124045 ?auto_124046 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124049 - BLOCK
      ?auto_124050 - BLOCK
      ?auto_124051 - BLOCK
      ?auto_124052 - BLOCK
      ?auto_124053 - BLOCK
      ?auto_124054 - BLOCK
      ?auto_124055 - BLOCK
    )
    :vars
    (
      ?auto_124057 - BLOCK
      ?auto_124056 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124049 ?auto_124050 ) ) ( not ( = ?auto_124049 ?auto_124051 ) ) ( not ( = ?auto_124049 ?auto_124052 ) ) ( not ( = ?auto_124049 ?auto_124053 ) ) ( not ( = ?auto_124049 ?auto_124054 ) ) ( not ( = ?auto_124049 ?auto_124055 ) ) ( not ( = ?auto_124050 ?auto_124051 ) ) ( not ( = ?auto_124050 ?auto_124052 ) ) ( not ( = ?auto_124050 ?auto_124053 ) ) ( not ( = ?auto_124050 ?auto_124054 ) ) ( not ( = ?auto_124050 ?auto_124055 ) ) ( not ( = ?auto_124051 ?auto_124052 ) ) ( not ( = ?auto_124051 ?auto_124053 ) ) ( not ( = ?auto_124051 ?auto_124054 ) ) ( not ( = ?auto_124051 ?auto_124055 ) ) ( not ( = ?auto_124052 ?auto_124053 ) ) ( not ( = ?auto_124052 ?auto_124054 ) ) ( not ( = ?auto_124052 ?auto_124055 ) ) ( not ( = ?auto_124053 ?auto_124054 ) ) ( not ( = ?auto_124053 ?auto_124055 ) ) ( not ( = ?auto_124054 ?auto_124055 ) ) ( ON ?auto_124055 ?auto_124057 ) ( not ( = ?auto_124049 ?auto_124057 ) ) ( not ( = ?auto_124050 ?auto_124057 ) ) ( not ( = ?auto_124051 ?auto_124057 ) ) ( not ( = ?auto_124052 ?auto_124057 ) ) ( not ( = ?auto_124053 ?auto_124057 ) ) ( not ( = ?auto_124054 ?auto_124057 ) ) ( not ( = ?auto_124055 ?auto_124057 ) ) ( ON-TABLE ?auto_124057 ) ( ON ?auto_124049 ?auto_124056 ) ( not ( = ?auto_124049 ?auto_124056 ) ) ( not ( = ?auto_124050 ?auto_124056 ) ) ( not ( = ?auto_124051 ?auto_124056 ) ) ( not ( = ?auto_124052 ?auto_124056 ) ) ( not ( = ?auto_124053 ?auto_124056 ) ) ( not ( = ?auto_124054 ?auto_124056 ) ) ( not ( = ?auto_124055 ?auto_124056 ) ) ( not ( = ?auto_124057 ?auto_124056 ) ) ( ON ?auto_124050 ?auto_124049 ) ( ON-TABLE ?auto_124056 ) ( ON ?auto_124051 ?auto_124050 ) ( ON ?auto_124052 ?auto_124051 ) ( ON ?auto_124053 ?auto_124052 ) ( CLEAR ?auto_124053 ) ( HOLDING ?auto_124054 ) ( CLEAR ?auto_124055 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124057 ?auto_124055 ?auto_124054 )
      ( MAKE-7PILE ?auto_124049 ?auto_124050 ?auto_124051 ?auto_124052 ?auto_124053 ?auto_124054 ?auto_124055 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124058 - BLOCK
      ?auto_124059 - BLOCK
      ?auto_124060 - BLOCK
      ?auto_124061 - BLOCK
      ?auto_124062 - BLOCK
      ?auto_124063 - BLOCK
      ?auto_124064 - BLOCK
    )
    :vars
    (
      ?auto_124065 - BLOCK
      ?auto_124066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124058 ?auto_124059 ) ) ( not ( = ?auto_124058 ?auto_124060 ) ) ( not ( = ?auto_124058 ?auto_124061 ) ) ( not ( = ?auto_124058 ?auto_124062 ) ) ( not ( = ?auto_124058 ?auto_124063 ) ) ( not ( = ?auto_124058 ?auto_124064 ) ) ( not ( = ?auto_124059 ?auto_124060 ) ) ( not ( = ?auto_124059 ?auto_124061 ) ) ( not ( = ?auto_124059 ?auto_124062 ) ) ( not ( = ?auto_124059 ?auto_124063 ) ) ( not ( = ?auto_124059 ?auto_124064 ) ) ( not ( = ?auto_124060 ?auto_124061 ) ) ( not ( = ?auto_124060 ?auto_124062 ) ) ( not ( = ?auto_124060 ?auto_124063 ) ) ( not ( = ?auto_124060 ?auto_124064 ) ) ( not ( = ?auto_124061 ?auto_124062 ) ) ( not ( = ?auto_124061 ?auto_124063 ) ) ( not ( = ?auto_124061 ?auto_124064 ) ) ( not ( = ?auto_124062 ?auto_124063 ) ) ( not ( = ?auto_124062 ?auto_124064 ) ) ( not ( = ?auto_124063 ?auto_124064 ) ) ( ON ?auto_124064 ?auto_124065 ) ( not ( = ?auto_124058 ?auto_124065 ) ) ( not ( = ?auto_124059 ?auto_124065 ) ) ( not ( = ?auto_124060 ?auto_124065 ) ) ( not ( = ?auto_124061 ?auto_124065 ) ) ( not ( = ?auto_124062 ?auto_124065 ) ) ( not ( = ?auto_124063 ?auto_124065 ) ) ( not ( = ?auto_124064 ?auto_124065 ) ) ( ON-TABLE ?auto_124065 ) ( ON ?auto_124058 ?auto_124066 ) ( not ( = ?auto_124058 ?auto_124066 ) ) ( not ( = ?auto_124059 ?auto_124066 ) ) ( not ( = ?auto_124060 ?auto_124066 ) ) ( not ( = ?auto_124061 ?auto_124066 ) ) ( not ( = ?auto_124062 ?auto_124066 ) ) ( not ( = ?auto_124063 ?auto_124066 ) ) ( not ( = ?auto_124064 ?auto_124066 ) ) ( not ( = ?auto_124065 ?auto_124066 ) ) ( ON ?auto_124059 ?auto_124058 ) ( ON-TABLE ?auto_124066 ) ( ON ?auto_124060 ?auto_124059 ) ( ON ?auto_124061 ?auto_124060 ) ( ON ?auto_124062 ?auto_124061 ) ( CLEAR ?auto_124064 ) ( ON ?auto_124063 ?auto_124062 ) ( CLEAR ?auto_124063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124066 ?auto_124058 ?auto_124059 ?auto_124060 ?auto_124061 ?auto_124062 )
      ( MAKE-7PILE ?auto_124058 ?auto_124059 ?auto_124060 ?auto_124061 ?auto_124062 ?auto_124063 ?auto_124064 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124067 - BLOCK
      ?auto_124068 - BLOCK
      ?auto_124069 - BLOCK
      ?auto_124070 - BLOCK
      ?auto_124071 - BLOCK
      ?auto_124072 - BLOCK
      ?auto_124073 - BLOCK
    )
    :vars
    (
      ?auto_124074 - BLOCK
      ?auto_124075 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124067 ?auto_124068 ) ) ( not ( = ?auto_124067 ?auto_124069 ) ) ( not ( = ?auto_124067 ?auto_124070 ) ) ( not ( = ?auto_124067 ?auto_124071 ) ) ( not ( = ?auto_124067 ?auto_124072 ) ) ( not ( = ?auto_124067 ?auto_124073 ) ) ( not ( = ?auto_124068 ?auto_124069 ) ) ( not ( = ?auto_124068 ?auto_124070 ) ) ( not ( = ?auto_124068 ?auto_124071 ) ) ( not ( = ?auto_124068 ?auto_124072 ) ) ( not ( = ?auto_124068 ?auto_124073 ) ) ( not ( = ?auto_124069 ?auto_124070 ) ) ( not ( = ?auto_124069 ?auto_124071 ) ) ( not ( = ?auto_124069 ?auto_124072 ) ) ( not ( = ?auto_124069 ?auto_124073 ) ) ( not ( = ?auto_124070 ?auto_124071 ) ) ( not ( = ?auto_124070 ?auto_124072 ) ) ( not ( = ?auto_124070 ?auto_124073 ) ) ( not ( = ?auto_124071 ?auto_124072 ) ) ( not ( = ?auto_124071 ?auto_124073 ) ) ( not ( = ?auto_124072 ?auto_124073 ) ) ( not ( = ?auto_124067 ?auto_124074 ) ) ( not ( = ?auto_124068 ?auto_124074 ) ) ( not ( = ?auto_124069 ?auto_124074 ) ) ( not ( = ?auto_124070 ?auto_124074 ) ) ( not ( = ?auto_124071 ?auto_124074 ) ) ( not ( = ?auto_124072 ?auto_124074 ) ) ( not ( = ?auto_124073 ?auto_124074 ) ) ( ON-TABLE ?auto_124074 ) ( ON ?auto_124067 ?auto_124075 ) ( not ( = ?auto_124067 ?auto_124075 ) ) ( not ( = ?auto_124068 ?auto_124075 ) ) ( not ( = ?auto_124069 ?auto_124075 ) ) ( not ( = ?auto_124070 ?auto_124075 ) ) ( not ( = ?auto_124071 ?auto_124075 ) ) ( not ( = ?auto_124072 ?auto_124075 ) ) ( not ( = ?auto_124073 ?auto_124075 ) ) ( not ( = ?auto_124074 ?auto_124075 ) ) ( ON ?auto_124068 ?auto_124067 ) ( ON-TABLE ?auto_124075 ) ( ON ?auto_124069 ?auto_124068 ) ( ON ?auto_124070 ?auto_124069 ) ( ON ?auto_124071 ?auto_124070 ) ( ON ?auto_124072 ?auto_124071 ) ( CLEAR ?auto_124072 ) ( HOLDING ?auto_124073 ) ( CLEAR ?auto_124074 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124074 ?auto_124073 )
      ( MAKE-7PILE ?auto_124067 ?auto_124068 ?auto_124069 ?auto_124070 ?auto_124071 ?auto_124072 ?auto_124073 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124076 - BLOCK
      ?auto_124077 - BLOCK
      ?auto_124078 - BLOCK
      ?auto_124079 - BLOCK
      ?auto_124080 - BLOCK
      ?auto_124081 - BLOCK
      ?auto_124082 - BLOCK
    )
    :vars
    (
      ?auto_124083 - BLOCK
      ?auto_124084 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124076 ?auto_124077 ) ) ( not ( = ?auto_124076 ?auto_124078 ) ) ( not ( = ?auto_124076 ?auto_124079 ) ) ( not ( = ?auto_124076 ?auto_124080 ) ) ( not ( = ?auto_124076 ?auto_124081 ) ) ( not ( = ?auto_124076 ?auto_124082 ) ) ( not ( = ?auto_124077 ?auto_124078 ) ) ( not ( = ?auto_124077 ?auto_124079 ) ) ( not ( = ?auto_124077 ?auto_124080 ) ) ( not ( = ?auto_124077 ?auto_124081 ) ) ( not ( = ?auto_124077 ?auto_124082 ) ) ( not ( = ?auto_124078 ?auto_124079 ) ) ( not ( = ?auto_124078 ?auto_124080 ) ) ( not ( = ?auto_124078 ?auto_124081 ) ) ( not ( = ?auto_124078 ?auto_124082 ) ) ( not ( = ?auto_124079 ?auto_124080 ) ) ( not ( = ?auto_124079 ?auto_124081 ) ) ( not ( = ?auto_124079 ?auto_124082 ) ) ( not ( = ?auto_124080 ?auto_124081 ) ) ( not ( = ?auto_124080 ?auto_124082 ) ) ( not ( = ?auto_124081 ?auto_124082 ) ) ( not ( = ?auto_124076 ?auto_124083 ) ) ( not ( = ?auto_124077 ?auto_124083 ) ) ( not ( = ?auto_124078 ?auto_124083 ) ) ( not ( = ?auto_124079 ?auto_124083 ) ) ( not ( = ?auto_124080 ?auto_124083 ) ) ( not ( = ?auto_124081 ?auto_124083 ) ) ( not ( = ?auto_124082 ?auto_124083 ) ) ( ON-TABLE ?auto_124083 ) ( ON ?auto_124076 ?auto_124084 ) ( not ( = ?auto_124076 ?auto_124084 ) ) ( not ( = ?auto_124077 ?auto_124084 ) ) ( not ( = ?auto_124078 ?auto_124084 ) ) ( not ( = ?auto_124079 ?auto_124084 ) ) ( not ( = ?auto_124080 ?auto_124084 ) ) ( not ( = ?auto_124081 ?auto_124084 ) ) ( not ( = ?auto_124082 ?auto_124084 ) ) ( not ( = ?auto_124083 ?auto_124084 ) ) ( ON ?auto_124077 ?auto_124076 ) ( ON-TABLE ?auto_124084 ) ( ON ?auto_124078 ?auto_124077 ) ( ON ?auto_124079 ?auto_124078 ) ( ON ?auto_124080 ?auto_124079 ) ( ON ?auto_124081 ?auto_124080 ) ( CLEAR ?auto_124083 ) ( ON ?auto_124082 ?auto_124081 ) ( CLEAR ?auto_124082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_124084 ?auto_124076 ?auto_124077 ?auto_124078 ?auto_124079 ?auto_124080 ?auto_124081 )
      ( MAKE-7PILE ?auto_124076 ?auto_124077 ?auto_124078 ?auto_124079 ?auto_124080 ?auto_124081 ?auto_124082 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124085 - BLOCK
      ?auto_124086 - BLOCK
      ?auto_124087 - BLOCK
      ?auto_124088 - BLOCK
      ?auto_124089 - BLOCK
      ?auto_124090 - BLOCK
      ?auto_124091 - BLOCK
    )
    :vars
    (
      ?auto_124093 - BLOCK
      ?auto_124092 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124085 ?auto_124086 ) ) ( not ( = ?auto_124085 ?auto_124087 ) ) ( not ( = ?auto_124085 ?auto_124088 ) ) ( not ( = ?auto_124085 ?auto_124089 ) ) ( not ( = ?auto_124085 ?auto_124090 ) ) ( not ( = ?auto_124085 ?auto_124091 ) ) ( not ( = ?auto_124086 ?auto_124087 ) ) ( not ( = ?auto_124086 ?auto_124088 ) ) ( not ( = ?auto_124086 ?auto_124089 ) ) ( not ( = ?auto_124086 ?auto_124090 ) ) ( not ( = ?auto_124086 ?auto_124091 ) ) ( not ( = ?auto_124087 ?auto_124088 ) ) ( not ( = ?auto_124087 ?auto_124089 ) ) ( not ( = ?auto_124087 ?auto_124090 ) ) ( not ( = ?auto_124087 ?auto_124091 ) ) ( not ( = ?auto_124088 ?auto_124089 ) ) ( not ( = ?auto_124088 ?auto_124090 ) ) ( not ( = ?auto_124088 ?auto_124091 ) ) ( not ( = ?auto_124089 ?auto_124090 ) ) ( not ( = ?auto_124089 ?auto_124091 ) ) ( not ( = ?auto_124090 ?auto_124091 ) ) ( not ( = ?auto_124085 ?auto_124093 ) ) ( not ( = ?auto_124086 ?auto_124093 ) ) ( not ( = ?auto_124087 ?auto_124093 ) ) ( not ( = ?auto_124088 ?auto_124093 ) ) ( not ( = ?auto_124089 ?auto_124093 ) ) ( not ( = ?auto_124090 ?auto_124093 ) ) ( not ( = ?auto_124091 ?auto_124093 ) ) ( ON ?auto_124085 ?auto_124092 ) ( not ( = ?auto_124085 ?auto_124092 ) ) ( not ( = ?auto_124086 ?auto_124092 ) ) ( not ( = ?auto_124087 ?auto_124092 ) ) ( not ( = ?auto_124088 ?auto_124092 ) ) ( not ( = ?auto_124089 ?auto_124092 ) ) ( not ( = ?auto_124090 ?auto_124092 ) ) ( not ( = ?auto_124091 ?auto_124092 ) ) ( not ( = ?auto_124093 ?auto_124092 ) ) ( ON ?auto_124086 ?auto_124085 ) ( ON-TABLE ?auto_124092 ) ( ON ?auto_124087 ?auto_124086 ) ( ON ?auto_124088 ?auto_124087 ) ( ON ?auto_124089 ?auto_124088 ) ( ON ?auto_124090 ?auto_124089 ) ( ON ?auto_124091 ?auto_124090 ) ( CLEAR ?auto_124091 ) ( HOLDING ?auto_124093 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124093 )
      ( MAKE-7PILE ?auto_124085 ?auto_124086 ?auto_124087 ?auto_124088 ?auto_124089 ?auto_124090 ?auto_124091 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124094 - BLOCK
      ?auto_124095 - BLOCK
      ?auto_124096 - BLOCK
      ?auto_124097 - BLOCK
      ?auto_124098 - BLOCK
      ?auto_124099 - BLOCK
      ?auto_124100 - BLOCK
    )
    :vars
    (
      ?auto_124102 - BLOCK
      ?auto_124101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124094 ?auto_124095 ) ) ( not ( = ?auto_124094 ?auto_124096 ) ) ( not ( = ?auto_124094 ?auto_124097 ) ) ( not ( = ?auto_124094 ?auto_124098 ) ) ( not ( = ?auto_124094 ?auto_124099 ) ) ( not ( = ?auto_124094 ?auto_124100 ) ) ( not ( = ?auto_124095 ?auto_124096 ) ) ( not ( = ?auto_124095 ?auto_124097 ) ) ( not ( = ?auto_124095 ?auto_124098 ) ) ( not ( = ?auto_124095 ?auto_124099 ) ) ( not ( = ?auto_124095 ?auto_124100 ) ) ( not ( = ?auto_124096 ?auto_124097 ) ) ( not ( = ?auto_124096 ?auto_124098 ) ) ( not ( = ?auto_124096 ?auto_124099 ) ) ( not ( = ?auto_124096 ?auto_124100 ) ) ( not ( = ?auto_124097 ?auto_124098 ) ) ( not ( = ?auto_124097 ?auto_124099 ) ) ( not ( = ?auto_124097 ?auto_124100 ) ) ( not ( = ?auto_124098 ?auto_124099 ) ) ( not ( = ?auto_124098 ?auto_124100 ) ) ( not ( = ?auto_124099 ?auto_124100 ) ) ( not ( = ?auto_124094 ?auto_124102 ) ) ( not ( = ?auto_124095 ?auto_124102 ) ) ( not ( = ?auto_124096 ?auto_124102 ) ) ( not ( = ?auto_124097 ?auto_124102 ) ) ( not ( = ?auto_124098 ?auto_124102 ) ) ( not ( = ?auto_124099 ?auto_124102 ) ) ( not ( = ?auto_124100 ?auto_124102 ) ) ( ON ?auto_124094 ?auto_124101 ) ( not ( = ?auto_124094 ?auto_124101 ) ) ( not ( = ?auto_124095 ?auto_124101 ) ) ( not ( = ?auto_124096 ?auto_124101 ) ) ( not ( = ?auto_124097 ?auto_124101 ) ) ( not ( = ?auto_124098 ?auto_124101 ) ) ( not ( = ?auto_124099 ?auto_124101 ) ) ( not ( = ?auto_124100 ?auto_124101 ) ) ( not ( = ?auto_124102 ?auto_124101 ) ) ( ON ?auto_124095 ?auto_124094 ) ( ON-TABLE ?auto_124101 ) ( ON ?auto_124096 ?auto_124095 ) ( ON ?auto_124097 ?auto_124096 ) ( ON ?auto_124098 ?auto_124097 ) ( ON ?auto_124099 ?auto_124098 ) ( ON ?auto_124100 ?auto_124099 ) ( ON ?auto_124102 ?auto_124100 ) ( CLEAR ?auto_124102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_124101 ?auto_124094 ?auto_124095 ?auto_124096 ?auto_124097 ?auto_124098 ?auto_124099 ?auto_124100 )
      ( MAKE-7PILE ?auto_124094 ?auto_124095 ?auto_124096 ?auto_124097 ?auto_124098 ?auto_124099 ?auto_124100 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124119 - BLOCK
      ?auto_124120 - BLOCK
      ?auto_124121 - BLOCK
      ?auto_124122 - BLOCK
      ?auto_124123 - BLOCK
      ?auto_124124 - BLOCK
      ?auto_124125 - BLOCK
      ?auto_124126 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_124125 ) ( ON-TABLE ?auto_124119 ) ( ON ?auto_124120 ?auto_124119 ) ( ON ?auto_124121 ?auto_124120 ) ( ON ?auto_124122 ?auto_124121 ) ( ON ?auto_124123 ?auto_124122 ) ( ON ?auto_124124 ?auto_124123 ) ( ON ?auto_124125 ?auto_124124 ) ( not ( = ?auto_124119 ?auto_124120 ) ) ( not ( = ?auto_124119 ?auto_124121 ) ) ( not ( = ?auto_124119 ?auto_124122 ) ) ( not ( = ?auto_124119 ?auto_124123 ) ) ( not ( = ?auto_124119 ?auto_124124 ) ) ( not ( = ?auto_124119 ?auto_124125 ) ) ( not ( = ?auto_124119 ?auto_124126 ) ) ( not ( = ?auto_124120 ?auto_124121 ) ) ( not ( = ?auto_124120 ?auto_124122 ) ) ( not ( = ?auto_124120 ?auto_124123 ) ) ( not ( = ?auto_124120 ?auto_124124 ) ) ( not ( = ?auto_124120 ?auto_124125 ) ) ( not ( = ?auto_124120 ?auto_124126 ) ) ( not ( = ?auto_124121 ?auto_124122 ) ) ( not ( = ?auto_124121 ?auto_124123 ) ) ( not ( = ?auto_124121 ?auto_124124 ) ) ( not ( = ?auto_124121 ?auto_124125 ) ) ( not ( = ?auto_124121 ?auto_124126 ) ) ( not ( = ?auto_124122 ?auto_124123 ) ) ( not ( = ?auto_124122 ?auto_124124 ) ) ( not ( = ?auto_124122 ?auto_124125 ) ) ( not ( = ?auto_124122 ?auto_124126 ) ) ( not ( = ?auto_124123 ?auto_124124 ) ) ( not ( = ?auto_124123 ?auto_124125 ) ) ( not ( = ?auto_124123 ?auto_124126 ) ) ( not ( = ?auto_124124 ?auto_124125 ) ) ( not ( = ?auto_124124 ?auto_124126 ) ) ( not ( = ?auto_124125 ?auto_124126 ) ) ( ON-TABLE ?auto_124126 ) ( CLEAR ?auto_124126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_124126 )
      ( MAKE-8PILE ?auto_124119 ?auto_124120 ?auto_124121 ?auto_124122 ?auto_124123 ?auto_124124 ?auto_124125 ?auto_124126 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124127 - BLOCK
      ?auto_124128 - BLOCK
      ?auto_124129 - BLOCK
      ?auto_124130 - BLOCK
      ?auto_124131 - BLOCK
      ?auto_124132 - BLOCK
      ?auto_124133 - BLOCK
      ?auto_124134 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124127 ) ( ON ?auto_124128 ?auto_124127 ) ( ON ?auto_124129 ?auto_124128 ) ( ON ?auto_124130 ?auto_124129 ) ( ON ?auto_124131 ?auto_124130 ) ( ON ?auto_124132 ?auto_124131 ) ( not ( = ?auto_124127 ?auto_124128 ) ) ( not ( = ?auto_124127 ?auto_124129 ) ) ( not ( = ?auto_124127 ?auto_124130 ) ) ( not ( = ?auto_124127 ?auto_124131 ) ) ( not ( = ?auto_124127 ?auto_124132 ) ) ( not ( = ?auto_124127 ?auto_124133 ) ) ( not ( = ?auto_124127 ?auto_124134 ) ) ( not ( = ?auto_124128 ?auto_124129 ) ) ( not ( = ?auto_124128 ?auto_124130 ) ) ( not ( = ?auto_124128 ?auto_124131 ) ) ( not ( = ?auto_124128 ?auto_124132 ) ) ( not ( = ?auto_124128 ?auto_124133 ) ) ( not ( = ?auto_124128 ?auto_124134 ) ) ( not ( = ?auto_124129 ?auto_124130 ) ) ( not ( = ?auto_124129 ?auto_124131 ) ) ( not ( = ?auto_124129 ?auto_124132 ) ) ( not ( = ?auto_124129 ?auto_124133 ) ) ( not ( = ?auto_124129 ?auto_124134 ) ) ( not ( = ?auto_124130 ?auto_124131 ) ) ( not ( = ?auto_124130 ?auto_124132 ) ) ( not ( = ?auto_124130 ?auto_124133 ) ) ( not ( = ?auto_124130 ?auto_124134 ) ) ( not ( = ?auto_124131 ?auto_124132 ) ) ( not ( = ?auto_124131 ?auto_124133 ) ) ( not ( = ?auto_124131 ?auto_124134 ) ) ( not ( = ?auto_124132 ?auto_124133 ) ) ( not ( = ?auto_124132 ?auto_124134 ) ) ( not ( = ?auto_124133 ?auto_124134 ) ) ( ON-TABLE ?auto_124134 ) ( CLEAR ?auto_124134 ) ( HOLDING ?auto_124133 ) ( CLEAR ?auto_124132 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_124127 ?auto_124128 ?auto_124129 ?auto_124130 ?auto_124131 ?auto_124132 ?auto_124133 )
      ( MAKE-8PILE ?auto_124127 ?auto_124128 ?auto_124129 ?auto_124130 ?auto_124131 ?auto_124132 ?auto_124133 ?auto_124134 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124135 - BLOCK
      ?auto_124136 - BLOCK
      ?auto_124137 - BLOCK
      ?auto_124138 - BLOCK
      ?auto_124139 - BLOCK
      ?auto_124140 - BLOCK
      ?auto_124141 - BLOCK
      ?auto_124142 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124135 ) ( ON ?auto_124136 ?auto_124135 ) ( ON ?auto_124137 ?auto_124136 ) ( ON ?auto_124138 ?auto_124137 ) ( ON ?auto_124139 ?auto_124138 ) ( ON ?auto_124140 ?auto_124139 ) ( not ( = ?auto_124135 ?auto_124136 ) ) ( not ( = ?auto_124135 ?auto_124137 ) ) ( not ( = ?auto_124135 ?auto_124138 ) ) ( not ( = ?auto_124135 ?auto_124139 ) ) ( not ( = ?auto_124135 ?auto_124140 ) ) ( not ( = ?auto_124135 ?auto_124141 ) ) ( not ( = ?auto_124135 ?auto_124142 ) ) ( not ( = ?auto_124136 ?auto_124137 ) ) ( not ( = ?auto_124136 ?auto_124138 ) ) ( not ( = ?auto_124136 ?auto_124139 ) ) ( not ( = ?auto_124136 ?auto_124140 ) ) ( not ( = ?auto_124136 ?auto_124141 ) ) ( not ( = ?auto_124136 ?auto_124142 ) ) ( not ( = ?auto_124137 ?auto_124138 ) ) ( not ( = ?auto_124137 ?auto_124139 ) ) ( not ( = ?auto_124137 ?auto_124140 ) ) ( not ( = ?auto_124137 ?auto_124141 ) ) ( not ( = ?auto_124137 ?auto_124142 ) ) ( not ( = ?auto_124138 ?auto_124139 ) ) ( not ( = ?auto_124138 ?auto_124140 ) ) ( not ( = ?auto_124138 ?auto_124141 ) ) ( not ( = ?auto_124138 ?auto_124142 ) ) ( not ( = ?auto_124139 ?auto_124140 ) ) ( not ( = ?auto_124139 ?auto_124141 ) ) ( not ( = ?auto_124139 ?auto_124142 ) ) ( not ( = ?auto_124140 ?auto_124141 ) ) ( not ( = ?auto_124140 ?auto_124142 ) ) ( not ( = ?auto_124141 ?auto_124142 ) ) ( ON-TABLE ?auto_124142 ) ( CLEAR ?auto_124140 ) ( ON ?auto_124141 ?auto_124142 ) ( CLEAR ?auto_124141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124142 )
      ( MAKE-8PILE ?auto_124135 ?auto_124136 ?auto_124137 ?auto_124138 ?auto_124139 ?auto_124140 ?auto_124141 ?auto_124142 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124143 - BLOCK
      ?auto_124144 - BLOCK
      ?auto_124145 - BLOCK
      ?auto_124146 - BLOCK
      ?auto_124147 - BLOCK
      ?auto_124148 - BLOCK
      ?auto_124149 - BLOCK
      ?auto_124150 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124143 ) ( ON ?auto_124144 ?auto_124143 ) ( ON ?auto_124145 ?auto_124144 ) ( ON ?auto_124146 ?auto_124145 ) ( ON ?auto_124147 ?auto_124146 ) ( not ( = ?auto_124143 ?auto_124144 ) ) ( not ( = ?auto_124143 ?auto_124145 ) ) ( not ( = ?auto_124143 ?auto_124146 ) ) ( not ( = ?auto_124143 ?auto_124147 ) ) ( not ( = ?auto_124143 ?auto_124148 ) ) ( not ( = ?auto_124143 ?auto_124149 ) ) ( not ( = ?auto_124143 ?auto_124150 ) ) ( not ( = ?auto_124144 ?auto_124145 ) ) ( not ( = ?auto_124144 ?auto_124146 ) ) ( not ( = ?auto_124144 ?auto_124147 ) ) ( not ( = ?auto_124144 ?auto_124148 ) ) ( not ( = ?auto_124144 ?auto_124149 ) ) ( not ( = ?auto_124144 ?auto_124150 ) ) ( not ( = ?auto_124145 ?auto_124146 ) ) ( not ( = ?auto_124145 ?auto_124147 ) ) ( not ( = ?auto_124145 ?auto_124148 ) ) ( not ( = ?auto_124145 ?auto_124149 ) ) ( not ( = ?auto_124145 ?auto_124150 ) ) ( not ( = ?auto_124146 ?auto_124147 ) ) ( not ( = ?auto_124146 ?auto_124148 ) ) ( not ( = ?auto_124146 ?auto_124149 ) ) ( not ( = ?auto_124146 ?auto_124150 ) ) ( not ( = ?auto_124147 ?auto_124148 ) ) ( not ( = ?auto_124147 ?auto_124149 ) ) ( not ( = ?auto_124147 ?auto_124150 ) ) ( not ( = ?auto_124148 ?auto_124149 ) ) ( not ( = ?auto_124148 ?auto_124150 ) ) ( not ( = ?auto_124149 ?auto_124150 ) ) ( ON-TABLE ?auto_124150 ) ( ON ?auto_124149 ?auto_124150 ) ( CLEAR ?auto_124149 ) ( HOLDING ?auto_124148 ) ( CLEAR ?auto_124147 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124143 ?auto_124144 ?auto_124145 ?auto_124146 ?auto_124147 ?auto_124148 )
      ( MAKE-8PILE ?auto_124143 ?auto_124144 ?auto_124145 ?auto_124146 ?auto_124147 ?auto_124148 ?auto_124149 ?auto_124150 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124151 - BLOCK
      ?auto_124152 - BLOCK
      ?auto_124153 - BLOCK
      ?auto_124154 - BLOCK
      ?auto_124155 - BLOCK
      ?auto_124156 - BLOCK
      ?auto_124157 - BLOCK
      ?auto_124158 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124151 ) ( ON ?auto_124152 ?auto_124151 ) ( ON ?auto_124153 ?auto_124152 ) ( ON ?auto_124154 ?auto_124153 ) ( ON ?auto_124155 ?auto_124154 ) ( not ( = ?auto_124151 ?auto_124152 ) ) ( not ( = ?auto_124151 ?auto_124153 ) ) ( not ( = ?auto_124151 ?auto_124154 ) ) ( not ( = ?auto_124151 ?auto_124155 ) ) ( not ( = ?auto_124151 ?auto_124156 ) ) ( not ( = ?auto_124151 ?auto_124157 ) ) ( not ( = ?auto_124151 ?auto_124158 ) ) ( not ( = ?auto_124152 ?auto_124153 ) ) ( not ( = ?auto_124152 ?auto_124154 ) ) ( not ( = ?auto_124152 ?auto_124155 ) ) ( not ( = ?auto_124152 ?auto_124156 ) ) ( not ( = ?auto_124152 ?auto_124157 ) ) ( not ( = ?auto_124152 ?auto_124158 ) ) ( not ( = ?auto_124153 ?auto_124154 ) ) ( not ( = ?auto_124153 ?auto_124155 ) ) ( not ( = ?auto_124153 ?auto_124156 ) ) ( not ( = ?auto_124153 ?auto_124157 ) ) ( not ( = ?auto_124153 ?auto_124158 ) ) ( not ( = ?auto_124154 ?auto_124155 ) ) ( not ( = ?auto_124154 ?auto_124156 ) ) ( not ( = ?auto_124154 ?auto_124157 ) ) ( not ( = ?auto_124154 ?auto_124158 ) ) ( not ( = ?auto_124155 ?auto_124156 ) ) ( not ( = ?auto_124155 ?auto_124157 ) ) ( not ( = ?auto_124155 ?auto_124158 ) ) ( not ( = ?auto_124156 ?auto_124157 ) ) ( not ( = ?auto_124156 ?auto_124158 ) ) ( not ( = ?auto_124157 ?auto_124158 ) ) ( ON-TABLE ?auto_124158 ) ( ON ?auto_124157 ?auto_124158 ) ( CLEAR ?auto_124155 ) ( ON ?auto_124156 ?auto_124157 ) ( CLEAR ?auto_124156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124158 ?auto_124157 )
      ( MAKE-8PILE ?auto_124151 ?auto_124152 ?auto_124153 ?auto_124154 ?auto_124155 ?auto_124156 ?auto_124157 ?auto_124158 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124159 - BLOCK
      ?auto_124160 - BLOCK
      ?auto_124161 - BLOCK
      ?auto_124162 - BLOCK
      ?auto_124163 - BLOCK
      ?auto_124164 - BLOCK
      ?auto_124165 - BLOCK
      ?auto_124166 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124159 ) ( ON ?auto_124160 ?auto_124159 ) ( ON ?auto_124161 ?auto_124160 ) ( ON ?auto_124162 ?auto_124161 ) ( not ( = ?auto_124159 ?auto_124160 ) ) ( not ( = ?auto_124159 ?auto_124161 ) ) ( not ( = ?auto_124159 ?auto_124162 ) ) ( not ( = ?auto_124159 ?auto_124163 ) ) ( not ( = ?auto_124159 ?auto_124164 ) ) ( not ( = ?auto_124159 ?auto_124165 ) ) ( not ( = ?auto_124159 ?auto_124166 ) ) ( not ( = ?auto_124160 ?auto_124161 ) ) ( not ( = ?auto_124160 ?auto_124162 ) ) ( not ( = ?auto_124160 ?auto_124163 ) ) ( not ( = ?auto_124160 ?auto_124164 ) ) ( not ( = ?auto_124160 ?auto_124165 ) ) ( not ( = ?auto_124160 ?auto_124166 ) ) ( not ( = ?auto_124161 ?auto_124162 ) ) ( not ( = ?auto_124161 ?auto_124163 ) ) ( not ( = ?auto_124161 ?auto_124164 ) ) ( not ( = ?auto_124161 ?auto_124165 ) ) ( not ( = ?auto_124161 ?auto_124166 ) ) ( not ( = ?auto_124162 ?auto_124163 ) ) ( not ( = ?auto_124162 ?auto_124164 ) ) ( not ( = ?auto_124162 ?auto_124165 ) ) ( not ( = ?auto_124162 ?auto_124166 ) ) ( not ( = ?auto_124163 ?auto_124164 ) ) ( not ( = ?auto_124163 ?auto_124165 ) ) ( not ( = ?auto_124163 ?auto_124166 ) ) ( not ( = ?auto_124164 ?auto_124165 ) ) ( not ( = ?auto_124164 ?auto_124166 ) ) ( not ( = ?auto_124165 ?auto_124166 ) ) ( ON-TABLE ?auto_124166 ) ( ON ?auto_124165 ?auto_124166 ) ( ON ?auto_124164 ?auto_124165 ) ( CLEAR ?auto_124164 ) ( HOLDING ?auto_124163 ) ( CLEAR ?auto_124162 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124159 ?auto_124160 ?auto_124161 ?auto_124162 ?auto_124163 )
      ( MAKE-8PILE ?auto_124159 ?auto_124160 ?auto_124161 ?auto_124162 ?auto_124163 ?auto_124164 ?auto_124165 ?auto_124166 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124167 - BLOCK
      ?auto_124168 - BLOCK
      ?auto_124169 - BLOCK
      ?auto_124170 - BLOCK
      ?auto_124171 - BLOCK
      ?auto_124172 - BLOCK
      ?auto_124173 - BLOCK
      ?auto_124174 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124167 ) ( ON ?auto_124168 ?auto_124167 ) ( ON ?auto_124169 ?auto_124168 ) ( ON ?auto_124170 ?auto_124169 ) ( not ( = ?auto_124167 ?auto_124168 ) ) ( not ( = ?auto_124167 ?auto_124169 ) ) ( not ( = ?auto_124167 ?auto_124170 ) ) ( not ( = ?auto_124167 ?auto_124171 ) ) ( not ( = ?auto_124167 ?auto_124172 ) ) ( not ( = ?auto_124167 ?auto_124173 ) ) ( not ( = ?auto_124167 ?auto_124174 ) ) ( not ( = ?auto_124168 ?auto_124169 ) ) ( not ( = ?auto_124168 ?auto_124170 ) ) ( not ( = ?auto_124168 ?auto_124171 ) ) ( not ( = ?auto_124168 ?auto_124172 ) ) ( not ( = ?auto_124168 ?auto_124173 ) ) ( not ( = ?auto_124168 ?auto_124174 ) ) ( not ( = ?auto_124169 ?auto_124170 ) ) ( not ( = ?auto_124169 ?auto_124171 ) ) ( not ( = ?auto_124169 ?auto_124172 ) ) ( not ( = ?auto_124169 ?auto_124173 ) ) ( not ( = ?auto_124169 ?auto_124174 ) ) ( not ( = ?auto_124170 ?auto_124171 ) ) ( not ( = ?auto_124170 ?auto_124172 ) ) ( not ( = ?auto_124170 ?auto_124173 ) ) ( not ( = ?auto_124170 ?auto_124174 ) ) ( not ( = ?auto_124171 ?auto_124172 ) ) ( not ( = ?auto_124171 ?auto_124173 ) ) ( not ( = ?auto_124171 ?auto_124174 ) ) ( not ( = ?auto_124172 ?auto_124173 ) ) ( not ( = ?auto_124172 ?auto_124174 ) ) ( not ( = ?auto_124173 ?auto_124174 ) ) ( ON-TABLE ?auto_124174 ) ( ON ?auto_124173 ?auto_124174 ) ( ON ?auto_124172 ?auto_124173 ) ( CLEAR ?auto_124170 ) ( ON ?auto_124171 ?auto_124172 ) ( CLEAR ?auto_124171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124174 ?auto_124173 ?auto_124172 )
      ( MAKE-8PILE ?auto_124167 ?auto_124168 ?auto_124169 ?auto_124170 ?auto_124171 ?auto_124172 ?auto_124173 ?auto_124174 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124175 - BLOCK
      ?auto_124176 - BLOCK
      ?auto_124177 - BLOCK
      ?auto_124178 - BLOCK
      ?auto_124179 - BLOCK
      ?auto_124180 - BLOCK
      ?auto_124181 - BLOCK
      ?auto_124182 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124175 ) ( ON ?auto_124176 ?auto_124175 ) ( ON ?auto_124177 ?auto_124176 ) ( not ( = ?auto_124175 ?auto_124176 ) ) ( not ( = ?auto_124175 ?auto_124177 ) ) ( not ( = ?auto_124175 ?auto_124178 ) ) ( not ( = ?auto_124175 ?auto_124179 ) ) ( not ( = ?auto_124175 ?auto_124180 ) ) ( not ( = ?auto_124175 ?auto_124181 ) ) ( not ( = ?auto_124175 ?auto_124182 ) ) ( not ( = ?auto_124176 ?auto_124177 ) ) ( not ( = ?auto_124176 ?auto_124178 ) ) ( not ( = ?auto_124176 ?auto_124179 ) ) ( not ( = ?auto_124176 ?auto_124180 ) ) ( not ( = ?auto_124176 ?auto_124181 ) ) ( not ( = ?auto_124176 ?auto_124182 ) ) ( not ( = ?auto_124177 ?auto_124178 ) ) ( not ( = ?auto_124177 ?auto_124179 ) ) ( not ( = ?auto_124177 ?auto_124180 ) ) ( not ( = ?auto_124177 ?auto_124181 ) ) ( not ( = ?auto_124177 ?auto_124182 ) ) ( not ( = ?auto_124178 ?auto_124179 ) ) ( not ( = ?auto_124178 ?auto_124180 ) ) ( not ( = ?auto_124178 ?auto_124181 ) ) ( not ( = ?auto_124178 ?auto_124182 ) ) ( not ( = ?auto_124179 ?auto_124180 ) ) ( not ( = ?auto_124179 ?auto_124181 ) ) ( not ( = ?auto_124179 ?auto_124182 ) ) ( not ( = ?auto_124180 ?auto_124181 ) ) ( not ( = ?auto_124180 ?auto_124182 ) ) ( not ( = ?auto_124181 ?auto_124182 ) ) ( ON-TABLE ?auto_124182 ) ( ON ?auto_124181 ?auto_124182 ) ( ON ?auto_124180 ?auto_124181 ) ( ON ?auto_124179 ?auto_124180 ) ( CLEAR ?auto_124179 ) ( HOLDING ?auto_124178 ) ( CLEAR ?auto_124177 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124175 ?auto_124176 ?auto_124177 ?auto_124178 )
      ( MAKE-8PILE ?auto_124175 ?auto_124176 ?auto_124177 ?auto_124178 ?auto_124179 ?auto_124180 ?auto_124181 ?auto_124182 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124183 - BLOCK
      ?auto_124184 - BLOCK
      ?auto_124185 - BLOCK
      ?auto_124186 - BLOCK
      ?auto_124187 - BLOCK
      ?auto_124188 - BLOCK
      ?auto_124189 - BLOCK
      ?auto_124190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124183 ) ( ON ?auto_124184 ?auto_124183 ) ( ON ?auto_124185 ?auto_124184 ) ( not ( = ?auto_124183 ?auto_124184 ) ) ( not ( = ?auto_124183 ?auto_124185 ) ) ( not ( = ?auto_124183 ?auto_124186 ) ) ( not ( = ?auto_124183 ?auto_124187 ) ) ( not ( = ?auto_124183 ?auto_124188 ) ) ( not ( = ?auto_124183 ?auto_124189 ) ) ( not ( = ?auto_124183 ?auto_124190 ) ) ( not ( = ?auto_124184 ?auto_124185 ) ) ( not ( = ?auto_124184 ?auto_124186 ) ) ( not ( = ?auto_124184 ?auto_124187 ) ) ( not ( = ?auto_124184 ?auto_124188 ) ) ( not ( = ?auto_124184 ?auto_124189 ) ) ( not ( = ?auto_124184 ?auto_124190 ) ) ( not ( = ?auto_124185 ?auto_124186 ) ) ( not ( = ?auto_124185 ?auto_124187 ) ) ( not ( = ?auto_124185 ?auto_124188 ) ) ( not ( = ?auto_124185 ?auto_124189 ) ) ( not ( = ?auto_124185 ?auto_124190 ) ) ( not ( = ?auto_124186 ?auto_124187 ) ) ( not ( = ?auto_124186 ?auto_124188 ) ) ( not ( = ?auto_124186 ?auto_124189 ) ) ( not ( = ?auto_124186 ?auto_124190 ) ) ( not ( = ?auto_124187 ?auto_124188 ) ) ( not ( = ?auto_124187 ?auto_124189 ) ) ( not ( = ?auto_124187 ?auto_124190 ) ) ( not ( = ?auto_124188 ?auto_124189 ) ) ( not ( = ?auto_124188 ?auto_124190 ) ) ( not ( = ?auto_124189 ?auto_124190 ) ) ( ON-TABLE ?auto_124190 ) ( ON ?auto_124189 ?auto_124190 ) ( ON ?auto_124188 ?auto_124189 ) ( ON ?auto_124187 ?auto_124188 ) ( CLEAR ?auto_124185 ) ( ON ?auto_124186 ?auto_124187 ) ( CLEAR ?auto_124186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124190 ?auto_124189 ?auto_124188 ?auto_124187 )
      ( MAKE-8PILE ?auto_124183 ?auto_124184 ?auto_124185 ?auto_124186 ?auto_124187 ?auto_124188 ?auto_124189 ?auto_124190 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124191 - BLOCK
      ?auto_124192 - BLOCK
      ?auto_124193 - BLOCK
      ?auto_124194 - BLOCK
      ?auto_124195 - BLOCK
      ?auto_124196 - BLOCK
      ?auto_124197 - BLOCK
      ?auto_124198 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124191 ) ( ON ?auto_124192 ?auto_124191 ) ( not ( = ?auto_124191 ?auto_124192 ) ) ( not ( = ?auto_124191 ?auto_124193 ) ) ( not ( = ?auto_124191 ?auto_124194 ) ) ( not ( = ?auto_124191 ?auto_124195 ) ) ( not ( = ?auto_124191 ?auto_124196 ) ) ( not ( = ?auto_124191 ?auto_124197 ) ) ( not ( = ?auto_124191 ?auto_124198 ) ) ( not ( = ?auto_124192 ?auto_124193 ) ) ( not ( = ?auto_124192 ?auto_124194 ) ) ( not ( = ?auto_124192 ?auto_124195 ) ) ( not ( = ?auto_124192 ?auto_124196 ) ) ( not ( = ?auto_124192 ?auto_124197 ) ) ( not ( = ?auto_124192 ?auto_124198 ) ) ( not ( = ?auto_124193 ?auto_124194 ) ) ( not ( = ?auto_124193 ?auto_124195 ) ) ( not ( = ?auto_124193 ?auto_124196 ) ) ( not ( = ?auto_124193 ?auto_124197 ) ) ( not ( = ?auto_124193 ?auto_124198 ) ) ( not ( = ?auto_124194 ?auto_124195 ) ) ( not ( = ?auto_124194 ?auto_124196 ) ) ( not ( = ?auto_124194 ?auto_124197 ) ) ( not ( = ?auto_124194 ?auto_124198 ) ) ( not ( = ?auto_124195 ?auto_124196 ) ) ( not ( = ?auto_124195 ?auto_124197 ) ) ( not ( = ?auto_124195 ?auto_124198 ) ) ( not ( = ?auto_124196 ?auto_124197 ) ) ( not ( = ?auto_124196 ?auto_124198 ) ) ( not ( = ?auto_124197 ?auto_124198 ) ) ( ON-TABLE ?auto_124198 ) ( ON ?auto_124197 ?auto_124198 ) ( ON ?auto_124196 ?auto_124197 ) ( ON ?auto_124195 ?auto_124196 ) ( ON ?auto_124194 ?auto_124195 ) ( CLEAR ?auto_124194 ) ( HOLDING ?auto_124193 ) ( CLEAR ?auto_124192 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124191 ?auto_124192 ?auto_124193 )
      ( MAKE-8PILE ?auto_124191 ?auto_124192 ?auto_124193 ?auto_124194 ?auto_124195 ?auto_124196 ?auto_124197 ?auto_124198 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124199 - BLOCK
      ?auto_124200 - BLOCK
      ?auto_124201 - BLOCK
      ?auto_124202 - BLOCK
      ?auto_124203 - BLOCK
      ?auto_124204 - BLOCK
      ?auto_124205 - BLOCK
      ?auto_124206 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124199 ) ( ON ?auto_124200 ?auto_124199 ) ( not ( = ?auto_124199 ?auto_124200 ) ) ( not ( = ?auto_124199 ?auto_124201 ) ) ( not ( = ?auto_124199 ?auto_124202 ) ) ( not ( = ?auto_124199 ?auto_124203 ) ) ( not ( = ?auto_124199 ?auto_124204 ) ) ( not ( = ?auto_124199 ?auto_124205 ) ) ( not ( = ?auto_124199 ?auto_124206 ) ) ( not ( = ?auto_124200 ?auto_124201 ) ) ( not ( = ?auto_124200 ?auto_124202 ) ) ( not ( = ?auto_124200 ?auto_124203 ) ) ( not ( = ?auto_124200 ?auto_124204 ) ) ( not ( = ?auto_124200 ?auto_124205 ) ) ( not ( = ?auto_124200 ?auto_124206 ) ) ( not ( = ?auto_124201 ?auto_124202 ) ) ( not ( = ?auto_124201 ?auto_124203 ) ) ( not ( = ?auto_124201 ?auto_124204 ) ) ( not ( = ?auto_124201 ?auto_124205 ) ) ( not ( = ?auto_124201 ?auto_124206 ) ) ( not ( = ?auto_124202 ?auto_124203 ) ) ( not ( = ?auto_124202 ?auto_124204 ) ) ( not ( = ?auto_124202 ?auto_124205 ) ) ( not ( = ?auto_124202 ?auto_124206 ) ) ( not ( = ?auto_124203 ?auto_124204 ) ) ( not ( = ?auto_124203 ?auto_124205 ) ) ( not ( = ?auto_124203 ?auto_124206 ) ) ( not ( = ?auto_124204 ?auto_124205 ) ) ( not ( = ?auto_124204 ?auto_124206 ) ) ( not ( = ?auto_124205 ?auto_124206 ) ) ( ON-TABLE ?auto_124206 ) ( ON ?auto_124205 ?auto_124206 ) ( ON ?auto_124204 ?auto_124205 ) ( ON ?auto_124203 ?auto_124204 ) ( ON ?auto_124202 ?auto_124203 ) ( CLEAR ?auto_124200 ) ( ON ?auto_124201 ?auto_124202 ) ( CLEAR ?auto_124201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124206 ?auto_124205 ?auto_124204 ?auto_124203 ?auto_124202 )
      ( MAKE-8PILE ?auto_124199 ?auto_124200 ?auto_124201 ?auto_124202 ?auto_124203 ?auto_124204 ?auto_124205 ?auto_124206 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124207 - BLOCK
      ?auto_124208 - BLOCK
      ?auto_124209 - BLOCK
      ?auto_124210 - BLOCK
      ?auto_124211 - BLOCK
      ?auto_124212 - BLOCK
      ?auto_124213 - BLOCK
      ?auto_124214 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124207 ) ( not ( = ?auto_124207 ?auto_124208 ) ) ( not ( = ?auto_124207 ?auto_124209 ) ) ( not ( = ?auto_124207 ?auto_124210 ) ) ( not ( = ?auto_124207 ?auto_124211 ) ) ( not ( = ?auto_124207 ?auto_124212 ) ) ( not ( = ?auto_124207 ?auto_124213 ) ) ( not ( = ?auto_124207 ?auto_124214 ) ) ( not ( = ?auto_124208 ?auto_124209 ) ) ( not ( = ?auto_124208 ?auto_124210 ) ) ( not ( = ?auto_124208 ?auto_124211 ) ) ( not ( = ?auto_124208 ?auto_124212 ) ) ( not ( = ?auto_124208 ?auto_124213 ) ) ( not ( = ?auto_124208 ?auto_124214 ) ) ( not ( = ?auto_124209 ?auto_124210 ) ) ( not ( = ?auto_124209 ?auto_124211 ) ) ( not ( = ?auto_124209 ?auto_124212 ) ) ( not ( = ?auto_124209 ?auto_124213 ) ) ( not ( = ?auto_124209 ?auto_124214 ) ) ( not ( = ?auto_124210 ?auto_124211 ) ) ( not ( = ?auto_124210 ?auto_124212 ) ) ( not ( = ?auto_124210 ?auto_124213 ) ) ( not ( = ?auto_124210 ?auto_124214 ) ) ( not ( = ?auto_124211 ?auto_124212 ) ) ( not ( = ?auto_124211 ?auto_124213 ) ) ( not ( = ?auto_124211 ?auto_124214 ) ) ( not ( = ?auto_124212 ?auto_124213 ) ) ( not ( = ?auto_124212 ?auto_124214 ) ) ( not ( = ?auto_124213 ?auto_124214 ) ) ( ON-TABLE ?auto_124214 ) ( ON ?auto_124213 ?auto_124214 ) ( ON ?auto_124212 ?auto_124213 ) ( ON ?auto_124211 ?auto_124212 ) ( ON ?auto_124210 ?auto_124211 ) ( ON ?auto_124209 ?auto_124210 ) ( CLEAR ?auto_124209 ) ( HOLDING ?auto_124208 ) ( CLEAR ?auto_124207 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124207 ?auto_124208 )
      ( MAKE-8PILE ?auto_124207 ?auto_124208 ?auto_124209 ?auto_124210 ?auto_124211 ?auto_124212 ?auto_124213 ?auto_124214 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124215 - BLOCK
      ?auto_124216 - BLOCK
      ?auto_124217 - BLOCK
      ?auto_124218 - BLOCK
      ?auto_124219 - BLOCK
      ?auto_124220 - BLOCK
      ?auto_124221 - BLOCK
      ?auto_124222 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124215 ) ( not ( = ?auto_124215 ?auto_124216 ) ) ( not ( = ?auto_124215 ?auto_124217 ) ) ( not ( = ?auto_124215 ?auto_124218 ) ) ( not ( = ?auto_124215 ?auto_124219 ) ) ( not ( = ?auto_124215 ?auto_124220 ) ) ( not ( = ?auto_124215 ?auto_124221 ) ) ( not ( = ?auto_124215 ?auto_124222 ) ) ( not ( = ?auto_124216 ?auto_124217 ) ) ( not ( = ?auto_124216 ?auto_124218 ) ) ( not ( = ?auto_124216 ?auto_124219 ) ) ( not ( = ?auto_124216 ?auto_124220 ) ) ( not ( = ?auto_124216 ?auto_124221 ) ) ( not ( = ?auto_124216 ?auto_124222 ) ) ( not ( = ?auto_124217 ?auto_124218 ) ) ( not ( = ?auto_124217 ?auto_124219 ) ) ( not ( = ?auto_124217 ?auto_124220 ) ) ( not ( = ?auto_124217 ?auto_124221 ) ) ( not ( = ?auto_124217 ?auto_124222 ) ) ( not ( = ?auto_124218 ?auto_124219 ) ) ( not ( = ?auto_124218 ?auto_124220 ) ) ( not ( = ?auto_124218 ?auto_124221 ) ) ( not ( = ?auto_124218 ?auto_124222 ) ) ( not ( = ?auto_124219 ?auto_124220 ) ) ( not ( = ?auto_124219 ?auto_124221 ) ) ( not ( = ?auto_124219 ?auto_124222 ) ) ( not ( = ?auto_124220 ?auto_124221 ) ) ( not ( = ?auto_124220 ?auto_124222 ) ) ( not ( = ?auto_124221 ?auto_124222 ) ) ( ON-TABLE ?auto_124222 ) ( ON ?auto_124221 ?auto_124222 ) ( ON ?auto_124220 ?auto_124221 ) ( ON ?auto_124219 ?auto_124220 ) ( ON ?auto_124218 ?auto_124219 ) ( ON ?auto_124217 ?auto_124218 ) ( CLEAR ?auto_124215 ) ( ON ?auto_124216 ?auto_124217 ) ( CLEAR ?auto_124216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124222 ?auto_124221 ?auto_124220 ?auto_124219 ?auto_124218 ?auto_124217 )
      ( MAKE-8PILE ?auto_124215 ?auto_124216 ?auto_124217 ?auto_124218 ?auto_124219 ?auto_124220 ?auto_124221 ?auto_124222 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124223 - BLOCK
      ?auto_124224 - BLOCK
      ?auto_124225 - BLOCK
      ?auto_124226 - BLOCK
      ?auto_124227 - BLOCK
      ?auto_124228 - BLOCK
      ?auto_124229 - BLOCK
      ?auto_124230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124223 ?auto_124224 ) ) ( not ( = ?auto_124223 ?auto_124225 ) ) ( not ( = ?auto_124223 ?auto_124226 ) ) ( not ( = ?auto_124223 ?auto_124227 ) ) ( not ( = ?auto_124223 ?auto_124228 ) ) ( not ( = ?auto_124223 ?auto_124229 ) ) ( not ( = ?auto_124223 ?auto_124230 ) ) ( not ( = ?auto_124224 ?auto_124225 ) ) ( not ( = ?auto_124224 ?auto_124226 ) ) ( not ( = ?auto_124224 ?auto_124227 ) ) ( not ( = ?auto_124224 ?auto_124228 ) ) ( not ( = ?auto_124224 ?auto_124229 ) ) ( not ( = ?auto_124224 ?auto_124230 ) ) ( not ( = ?auto_124225 ?auto_124226 ) ) ( not ( = ?auto_124225 ?auto_124227 ) ) ( not ( = ?auto_124225 ?auto_124228 ) ) ( not ( = ?auto_124225 ?auto_124229 ) ) ( not ( = ?auto_124225 ?auto_124230 ) ) ( not ( = ?auto_124226 ?auto_124227 ) ) ( not ( = ?auto_124226 ?auto_124228 ) ) ( not ( = ?auto_124226 ?auto_124229 ) ) ( not ( = ?auto_124226 ?auto_124230 ) ) ( not ( = ?auto_124227 ?auto_124228 ) ) ( not ( = ?auto_124227 ?auto_124229 ) ) ( not ( = ?auto_124227 ?auto_124230 ) ) ( not ( = ?auto_124228 ?auto_124229 ) ) ( not ( = ?auto_124228 ?auto_124230 ) ) ( not ( = ?auto_124229 ?auto_124230 ) ) ( ON-TABLE ?auto_124230 ) ( ON ?auto_124229 ?auto_124230 ) ( ON ?auto_124228 ?auto_124229 ) ( ON ?auto_124227 ?auto_124228 ) ( ON ?auto_124226 ?auto_124227 ) ( ON ?auto_124225 ?auto_124226 ) ( ON ?auto_124224 ?auto_124225 ) ( CLEAR ?auto_124224 ) ( HOLDING ?auto_124223 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124223 )
      ( MAKE-8PILE ?auto_124223 ?auto_124224 ?auto_124225 ?auto_124226 ?auto_124227 ?auto_124228 ?auto_124229 ?auto_124230 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124231 - BLOCK
      ?auto_124232 - BLOCK
      ?auto_124233 - BLOCK
      ?auto_124234 - BLOCK
      ?auto_124235 - BLOCK
      ?auto_124236 - BLOCK
      ?auto_124237 - BLOCK
      ?auto_124238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124231 ?auto_124232 ) ) ( not ( = ?auto_124231 ?auto_124233 ) ) ( not ( = ?auto_124231 ?auto_124234 ) ) ( not ( = ?auto_124231 ?auto_124235 ) ) ( not ( = ?auto_124231 ?auto_124236 ) ) ( not ( = ?auto_124231 ?auto_124237 ) ) ( not ( = ?auto_124231 ?auto_124238 ) ) ( not ( = ?auto_124232 ?auto_124233 ) ) ( not ( = ?auto_124232 ?auto_124234 ) ) ( not ( = ?auto_124232 ?auto_124235 ) ) ( not ( = ?auto_124232 ?auto_124236 ) ) ( not ( = ?auto_124232 ?auto_124237 ) ) ( not ( = ?auto_124232 ?auto_124238 ) ) ( not ( = ?auto_124233 ?auto_124234 ) ) ( not ( = ?auto_124233 ?auto_124235 ) ) ( not ( = ?auto_124233 ?auto_124236 ) ) ( not ( = ?auto_124233 ?auto_124237 ) ) ( not ( = ?auto_124233 ?auto_124238 ) ) ( not ( = ?auto_124234 ?auto_124235 ) ) ( not ( = ?auto_124234 ?auto_124236 ) ) ( not ( = ?auto_124234 ?auto_124237 ) ) ( not ( = ?auto_124234 ?auto_124238 ) ) ( not ( = ?auto_124235 ?auto_124236 ) ) ( not ( = ?auto_124235 ?auto_124237 ) ) ( not ( = ?auto_124235 ?auto_124238 ) ) ( not ( = ?auto_124236 ?auto_124237 ) ) ( not ( = ?auto_124236 ?auto_124238 ) ) ( not ( = ?auto_124237 ?auto_124238 ) ) ( ON-TABLE ?auto_124238 ) ( ON ?auto_124237 ?auto_124238 ) ( ON ?auto_124236 ?auto_124237 ) ( ON ?auto_124235 ?auto_124236 ) ( ON ?auto_124234 ?auto_124235 ) ( ON ?auto_124233 ?auto_124234 ) ( ON ?auto_124232 ?auto_124233 ) ( ON ?auto_124231 ?auto_124232 ) ( CLEAR ?auto_124231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_124238 ?auto_124237 ?auto_124236 ?auto_124235 ?auto_124234 ?auto_124233 ?auto_124232 )
      ( MAKE-8PILE ?auto_124231 ?auto_124232 ?auto_124233 ?auto_124234 ?auto_124235 ?auto_124236 ?auto_124237 ?auto_124238 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124247 - BLOCK
      ?auto_124248 - BLOCK
      ?auto_124249 - BLOCK
      ?auto_124250 - BLOCK
      ?auto_124251 - BLOCK
      ?auto_124252 - BLOCK
      ?auto_124253 - BLOCK
      ?auto_124254 - BLOCK
    )
    :vars
    (
      ?auto_124255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124247 ?auto_124248 ) ) ( not ( = ?auto_124247 ?auto_124249 ) ) ( not ( = ?auto_124247 ?auto_124250 ) ) ( not ( = ?auto_124247 ?auto_124251 ) ) ( not ( = ?auto_124247 ?auto_124252 ) ) ( not ( = ?auto_124247 ?auto_124253 ) ) ( not ( = ?auto_124247 ?auto_124254 ) ) ( not ( = ?auto_124248 ?auto_124249 ) ) ( not ( = ?auto_124248 ?auto_124250 ) ) ( not ( = ?auto_124248 ?auto_124251 ) ) ( not ( = ?auto_124248 ?auto_124252 ) ) ( not ( = ?auto_124248 ?auto_124253 ) ) ( not ( = ?auto_124248 ?auto_124254 ) ) ( not ( = ?auto_124249 ?auto_124250 ) ) ( not ( = ?auto_124249 ?auto_124251 ) ) ( not ( = ?auto_124249 ?auto_124252 ) ) ( not ( = ?auto_124249 ?auto_124253 ) ) ( not ( = ?auto_124249 ?auto_124254 ) ) ( not ( = ?auto_124250 ?auto_124251 ) ) ( not ( = ?auto_124250 ?auto_124252 ) ) ( not ( = ?auto_124250 ?auto_124253 ) ) ( not ( = ?auto_124250 ?auto_124254 ) ) ( not ( = ?auto_124251 ?auto_124252 ) ) ( not ( = ?auto_124251 ?auto_124253 ) ) ( not ( = ?auto_124251 ?auto_124254 ) ) ( not ( = ?auto_124252 ?auto_124253 ) ) ( not ( = ?auto_124252 ?auto_124254 ) ) ( not ( = ?auto_124253 ?auto_124254 ) ) ( ON-TABLE ?auto_124254 ) ( ON ?auto_124253 ?auto_124254 ) ( ON ?auto_124252 ?auto_124253 ) ( ON ?auto_124251 ?auto_124252 ) ( ON ?auto_124250 ?auto_124251 ) ( ON ?auto_124249 ?auto_124250 ) ( ON ?auto_124248 ?auto_124249 ) ( CLEAR ?auto_124248 ) ( ON ?auto_124247 ?auto_124255 ) ( CLEAR ?auto_124247 ) ( HAND-EMPTY ) ( not ( = ?auto_124247 ?auto_124255 ) ) ( not ( = ?auto_124248 ?auto_124255 ) ) ( not ( = ?auto_124249 ?auto_124255 ) ) ( not ( = ?auto_124250 ?auto_124255 ) ) ( not ( = ?auto_124251 ?auto_124255 ) ) ( not ( = ?auto_124252 ?auto_124255 ) ) ( not ( = ?auto_124253 ?auto_124255 ) ) ( not ( = ?auto_124254 ?auto_124255 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124247 ?auto_124255 )
      ( MAKE-8PILE ?auto_124247 ?auto_124248 ?auto_124249 ?auto_124250 ?auto_124251 ?auto_124252 ?auto_124253 ?auto_124254 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124256 - BLOCK
      ?auto_124257 - BLOCK
      ?auto_124258 - BLOCK
      ?auto_124259 - BLOCK
      ?auto_124260 - BLOCK
      ?auto_124261 - BLOCK
      ?auto_124262 - BLOCK
      ?auto_124263 - BLOCK
    )
    :vars
    (
      ?auto_124264 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124256 ?auto_124257 ) ) ( not ( = ?auto_124256 ?auto_124258 ) ) ( not ( = ?auto_124256 ?auto_124259 ) ) ( not ( = ?auto_124256 ?auto_124260 ) ) ( not ( = ?auto_124256 ?auto_124261 ) ) ( not ( = ?auto_124256 ?auto_124262 ) ) ( not ( = ?auto_124256 ?auto_124263 ) ) ( not ( = ?auto_124257 ?auto_124258 ) ) ( not ( = ?auto_124257 ?auto_124259 ) ) ( not ( = ?auto_124257 ?auto_124260 ) ) ( not ( = ?auto_124257 ?auto_124261 ) ) ( not ( = ?auto_124257 ?auto_124262 ) ) ( not ( = ?auto_124257 ?auto_124263 ) ) ( not ( = ?auto_124258 ?auto_124259 ) ) ( not ( = ?auto_124258 ?auto_124260 ) ) ( not ( = ?auto_124258 ?auto_124261 ) ) ( not ( = ?auto_124258 ?auto_124262 ) ) ( not ( = ?auto_124258 ?auto_124263 ) ) ( not ( = ?auto_124259 ?auto_124260 ) ) ( not ( = ?auto_124259 ?auto_124261 ) ) ( not ( = ?auto_124259 ?auto_124262 ) ) ( not ( = ?auto_124259 ?auto_124263 ) ) ( not ( = ?auto_124260 ?auto_124261 ) ) ( not ( = ?auto_124260 ?auto_124262 ) ) ( not ( = ?auto_124260 ?auto_124263 ) ) ( not ( = ?auto_124261 ?auto_124262 ) ) ( not ( = ?auto_124261 ?auto_124263 ) ) ( not ( = ?auto_124262 ?auto_124263 ) ) ( ON-TABLE ?auto_124263 ) ( ON ?auto_124262 ?auto_124263 ) ( ON ?auto_124261 ?auto_124262 ) ( ON ?auto_124260 ?auto_124261 ) ( ON ?auto_124259 ?auto_124260 ) ( ON ?auto_124258 ?auto_124259 ) ( ON ?auto_124256 ?auto_124264 ) ( CLEAR ?auto_124256 ) ( not ( = ?auto_124256 ?auto_124264 ) ) ( not ( = ?auto_124257 ?auto_124264 ) ) ( not ( = ?auto_124258 ?auto_124264 ) ) ( not ( = ?auto_124259 ?auto_124264 ) ) ( not ( = ?auto_124260 ?auto_124264 ) ) ( not ( = ?auto_124261 ?auto_124264 ) ) ( not ( = ?auto_124262 ?auto_124264 ) ) ( not ( = ?auto_124263 ?auto_124264 ) ) ( HOLDING ?auto_124257 ) ( CLEAR ?auto_124258 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_124263 ?auto_124262 ?auto_124261 ?auto_124260 ?auto_124259 ?auto_124258 ?auto_124257 )
      ( MAKE-8PILE ?auto_124256 ?auto_124257 ?auto_124258 ?auto_124259 ?auto_124260 ?auto_124261 ?auto_124262 ?auto_124263 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124265 - BLOCK
      ?auto_124266 - BLOCK
      ?auto_124267 - BLOCK
      ?auto_124268 - BLOCK
      ?auto_124269 - BLOCK
      ?auto_124270 - BLOCK
      ?auto_124271 - BLOCK
      ?auto_124272 - BLOCK
    )
    :vars
    (
      ?auto_124273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124265 ?auto_124266 ) ) ( not ( = ?auto_124265 ?auto_124267 ) ) ( not ( = ?auto_124265 ?auto_124268 ) ) ( not ( = ?auto_124265 ?auto_124269 ) ) ( not ( = ?auto_124265 ?auto_124270 ) ) ( not ( = ?auto_124265 ?auto_124271 ) ) ( not ( = ?auto_124265 ?auto_124272 ) ) ( not ( = ?auto_124266 ?auto_124267 ) ) ( not ( = ?auto_124266 ?auto_124268 ) ) ( not ( = ?auto_124266 ?auto_124269 ) ) ( not ( = ?auto_124266 ?auto_124270 ) ) ( not ( = ?auto_124266 ?auto_124271 ) ) ( not ( = ?auto_124266 ?auto_124272 ) ) ( not ( = ?auto_124267 ?auto_124268 ) ) ( not ( = ?auto_124267 ?auto_124269 ) ) ( not ( = ?auto_124267 ?auto_124270 ) ) ( not ( = ?auto_124267 ?auto_124271 ) ) ( not ( = ?auto_124267 ?auto_124272 ) ) ( not ( = ?auto_124268 ?auto_124269 ) ) ( not ( = ?auto_124268 ?auto_124270 ) ) ( not ( = ?auto_124268 ?auto_124271 ) ) ( not ( = ?auto_124268 ?auto_124272 ) ) ( not ( = ?auto_124269 ?auto_124270 ) ) ( not ( = ?auto_124269 ?auto_124271 ) ) ( not ( = ?auto_124269 ?auto_124272 ) ) ( not ( = ?auto_124270 ?auto_124271 ) ) ( not ( = ?auto_124270 ?auto_124272 ) ) ( not ( = ?auto_124271 ?auto_124272 ) ) ( ON-TABLE ?auto_124272 ) ( ON ?auto_124271 ?auto_124272 ) ( ON ?auto_124270 ?auto_124271 ) ( ON ?auto_124269 ?auto_124270 ) ( ON ?auto_124268 ?auto_124269 ) ( ON ?auto_124267 ?auto_124268 ) ( ON ?auto_124265 ?auto_124273 ) ( not ( = ?auto_124265 ?auto_124273 ) ) ( not ( = ?auto_124266 ?auto_124273 ) ) ( not ( = ?auto_124267 ?auto_124273 ) ) ( not ( = ?auto_124268 ?auto_124273 ) ) ( not ( = ?auto_124269 ?auto_124273 ) ) ( not ( = ?auto_124270 ?auto_124273 ) ) ( not ( = ?auto_124271 ?auto_124273 ) ) ( not ( = ?auto_124272 ?auto_124273 ) ) ( CLEAR ?auto_124267 ) ( ON ?auto_124266 ?auto_124265 ) ( CLEAR ?auto_124266 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124273 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124273 ?auto_124265 )
      ( MAKE-8PILE ?auto_124265 ?auto_124266 ?auto_124267 ?auto_124268 ?auto_124269 ?auto_124270 ?auto_124271 ?auto_124272 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124274 - BLOCK
      ?auto_124275 - BLOCK
      ?auto_124276 - BLOCK
      ?auto_124277 - BLOCK
      ?auto_124278 - BLOCK
      ?auto_124279 - BLOCK
      ?auto_124280 - BLOCK
      ?auto_124281 - BLOCK
    )
    :vars
    (
      ?auto_124282 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124274 ?auto_124275 ) ) ( not ( = ?auto_124274 ?auto_124276 ) ) ( not ( = ?auto_124274 ?auto_124277 ) ) ( not ( = ?auto_124274 ?auto_124278 ) ) ( not ( = ?auto_124274 ?auto_124279 ) ) ( not ( = ?auto_124274 ?auto_124280 ) ) ( not ( = ?auto_124274 ?auto_124281 ) ) ( not ( = ?auto_124275 ?auto_124276 ) ) ( not ( = ?auto_124275 ?auto_124277 ) ) ( not ( = ?auto_124275 ?auto_124278 ) ) ( not ( = ?auto_124275 ?auto_124279 ) ) ( not ( = ?auto_124275 ?auto_124280 ) ) ( not ( = ?auto_124275 ?auto_124281 ) ) ( not ( = ?auto_124276 ?auto_124277 ) ) ( not ( = ?auto_124276 ?auto_124278 ) ) ( not ( = ?auto_124276 ?auto_124279 ) ) ( not ( = ?auto_124276 ?auto_124280 ) ) ( not ( = ?auto_124276 ?auto_124281 ) ) ( not ( = ?auto_124277 ?auto_124278 ) ) ( not ( = ?auto_124277 ?auto_124279 ) ) ( not ( = ?auto_124277 ?auto_124280 ) ) ( not ( = ?auto_124277 ?auto_124281 ) ) ( not ( = ?auto_124278 ?auto_124279 ) ) ( not ( = ?auto_124278 ?auto_124280 ) ) ( not ( = ?auto_124278 ?auto_124281 ) ) ( not ( = ?auto_124279 ?auto_124280 ) ) ( not ( = ?auto_124279 ?auto_124281 ) ) ( not ( = ?auto_124280 ?auto_124281 ) ) ( ON-TABLE ?auto_124281 ) ( ON ?auto_124280 ?auto_124281 ) ( ON ?auto_124279 ?auto_124280 ) ( ON ?auto_124278 ?auto_124279 ) ( ON ?auto_124277 ?auto_124278 ) ( ON ?auto_124274 ?auto_124282 ) ( not ( = ?auto_124274 ?auto_124282 ) ) ( not ( = ?auto_124275 ?auto_124282 ) ) ( not ( = ?auto_124276 ?auto_124282 ) ) ( not ( = ?auto_124277 ?auto_124282 ) ) ( not ( = ?auto_124278 ?auto_124282 ) ) ( not ( = ?auto_124279 ?auto_124282 ) ) ( not ( = ?auto_124280 ?auto_124282 ) ) ( not ( = ?auto_124281 ?auto_124282 ) ) ( ON ?auto_124275 ?auto_124274 ) ( CLEAR ?auto_124275 ) ( ON-TABLE ?auto_124282 ) ( HOLDING ?auto_124276 ) ( CLEAR ?auto_124277 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124281 ?auto_124280 ?auto_124279 ?auto_124278 ?auto_124277 ?auto_124276 )
      ( MAKE-8PILE ?auto_124274 ?auto_124275 ?auto_124276 ?auto_124277 ?auto_124278 ?auto_124279 ?auto_124280 ?auto_124281 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124283 - BLOCK
      ?auto_124284 - BLOCK
      ?auto_124285 - BLOCK
      ?auto_124286 - BLOCK
      ?auto_124287 - BLOCK
      ?auto_124288 - BLOCK
      ?auto_124289 - BLOCK
      ?auto_124290 - BLOCK
    )
    :vars
    (
      ?auto_124291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124283 ?auto_124284 ) ) ( not ( = ?auto_124283 ?auto_124285 ) ) ( not ( = ?auto_124283 ?auto_124286 ) ) ( not ( = ?auto_124283 ?auto_124287 ) ) ( not ( = ?auto_124283 ?auto_124288 ) ) ( not ( = ?auto_124283 ?auto_124289 ) ) ( not ( = ?auto_124283 ?auto_124290 ) ) ( not ( = ?auto_124284 ?auto_124285 ) ) ( not ( = ?auto_124284 ?auto_124286 ) ) ( not ( = ?auto_124284 ?auto_124287 ) ) ( not ( = ?auto_124284 ?auto_124288 ) ) ( not ( = ?auto_124284 ?auto_124289 ) ) ( not ( = ?auto_124284 ?auto_124290 ) ) ( not ( = ?auto_124285 ?auto_124286 ) ) ( not ( = ?auto_124285 ?auto_124287 ) ) ( not ( = ?auto_124285 ?auto_124288 ) ) ( not ( = ?auto_124285 ?auto_124289 ) ) ( not ( = ?auto_124285 ?auto_124290 ) ) ( not ( = ?auto_124286 ?auto_124287 ) ) ( not ( = ?auto_124286 ?auto_124288 ) ) ( not ( = ?auto_124286 ?auto_124289 ) ) ( not ( = ?auto_124286 ?auto_124290 ) ) ( not ( = ?auto_124287 ?auto_124288 ) ) ( not ( = ?auto_124287 ?auto_124289 ) ) ( not ( = ?auto_124287 ?auto_124290 ) ) ( not ( = ?auto_124288 ?auto_124289 ) ) ( not ( = ?auto_124288 ?auto_124290 ) ) ( not ( = ?auto_124289 ?auto_124290 ) ) ( ON-TABLE ?auto_124290 ) ( ON ?auto_124289 ?auto_124290 ) ( ON ?auto_124288 ?auto_124289 ) ( ON ?auto_124287 ?auto_124288 ) ( ON ?auto_124286 ?auto_124287 ) ( ON ?auto_124283 ?auto_124291 ) ( not ( = ?auto_124283 ?auto_124291 ) ) ( not ( = ?auto_124284 ?auto_124291 ) ) ( not ( = ?auto_124285 ?auto_124291 ) ) ( not ( = ?auto_124286 ?auto_124291 ) ) ( not ( = ?auto_124287 ?auto_124291 ) ) ( not ( = ?auto_124288 ?auto_124291 ) ) ( not ( = ?auto_124289 ?auto_124291 ) ) ( not ( = ?auto_124290 ?auto_124291 ) ) ( ON ?auto_124284 ?auto_124283 ) ( ON-TABLE ?auto_124291 ) ( CLEAR ?auto_124286 ) ( ON ?auto_124285 ?auto_124284 ) ( CLEAR ?auto_124285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124291 ?auto_124283 ?auto_124284 )
      ( MAKE-8PILE ?auto_124283 ?auto_124284 ?auto_124285 ?auto_124286 ?auto_124287 ?auto_124288 ?auto_124289 ?auto_124290 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124292 - BLOCK
      ?auto_124293 - BLOCK
      ?auto_124294 - BLOCK
      ?auto_124295 - BLOCK
      ?auto_124296 - BLOCK
      ?auto_124297 - BLOCK
      ?auto_124298 - BLOCK
      ?auto_124299 - BLOCK
    )
    :vars
    (
      ?auto_124300 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124292 ?auto_124293 ) ) ( not ( = ?auto_124292 ?auto_124294 ) ) ( not ( = ?auto_124292 ?auto_124295 ) ) ( not ( = ?auto_124292 ?auto_124296 ) ) ( not ( = ?auto_124292 ?auto_124297 ) ) ( not ( = ?auto_124292 ?auto_124298 ) ) ( not ( = ?auto_124292 ?auto_124299 ) ) ( not ( = ?auto_124293 ?auto_124294 ) ) ( not ( = ?auto_124293 ?auto_124295 ) ) ( not ( = ?auto_124293 ?auto_124296 ) ) ( not ( = ?auto_124293 ?auto_124297 ) ) ( not ( = ?auto_124293 ?auto_124298 ) ) ( not ( = ?auto_124293 ?auto_124299 ) ) ( not ( = ?auto_124294 ?auto_124295 ) ) ( not ( = ?auto_124294 ?auto_124296 ) ) ( not ( = ?auto_124294 ?auto_124297 ) ) ( not ( = ?auto_124294 ?auto_124298 ) ) ( not ( = ?auto_124294 ?auto_124299 ) ) ( not ( = ?auto_124295 ?auto_124296 ) ) ( not ( = ?auto_124295 ?auto_124297 ) ) ( not ( = ?auto_124295 ?auto_124298 ) ) ( not ( = ?auto_124295 ?auto_124299 ) ) ( not ( = ?auto_124296 ?auto_124297 ) ) ( not ( = ?auto_124296 ?auto_124298 ) ) ( not ( = ?auto_124296 ?auto_124299 ) ) ( not ( = ?auto_124297 ?auto_124298 ) ) ( not ( = ?auto_124297 ?auto_124299 ) ) ( not ( = ?auto_124298 ?auto_124299 ) ) ( ON-TABLE ?auto_124299 ) ( ON ?auto_124298 ?auto_124299 ) ( ON ?auto_124297 ?auto_124298 ) ( ON ?auto_124296 ?auto_124297 ) ( ON ?auto_124292 ?auto_124300 ) ( not ( = ?auto_124292 ?auto_124300 ) ) ( not ( = ?auto_124293 ?auto_124300 ) ) ( not ( = ?auto_124294 ?auto_124300 ) ) ( not ( = ?auto_124295 ?auto_124300 ) ) ( not ( = ?auto_124296 ?auto_124300 ) ) ( not ( = ?auto_124297 ?auto_124300 ) ) ( not ( = ?auto_124298 ?auto_124300 ) ) ( not ( = ?auto_124299 ?auto_124300 ) ) ( ON ?auto_124293 ?auto_124292 ) ( ON-TABLE ?auto_124300 ) ( ON ?auto_124294 ?auto_124293 ) ( CLEAR ?auto_124294 ) ( HOLDING ?auto_124295 ) ( CLEAR ?auto_124296 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124299 ?auto_124298 ?auto_124297 ?auto_124296 ?auto_124295 )
      ( MAKE-8PILE ?auto_124292 ?auto_124293 ?auto_124294 ?auto_124295 ?auto_124296 ?auto_124297 ?auto_124298 ?auto_124299 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124301 - BLOCK
      ?auto_124302 - BLOCK
      ?auto_124303 - BLOCK
      ?auto_124304 - BLOCK
      ?auto_124305 - BLOCK
      ?auto_124306 - BLOCK
      ?auto_124307 - BLOCK
      ?auto_124308 - BLOCK
    )
    :vars
    (
      ?auto_124309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124301 ?auto_124302 ) ) ( not ( = ?auto_124301 ?auto_124303 ) ) ( not ( = ?auto_124301 ?auto_124304 ) ) ( not ( = ?auto_124301 ?auto_124305 ) ) ( not ( = ?auto_124301 ?auto_124306 ) ) ( not ( = ?auto_124301 ?auto_124307 ) ) ( not ( = ?auto_124301 ?auto_124308 ) ) ( not ( = ?auto_124302 ?auto_124303 ) ) ( not ( = ?auto_124302 ?auto_124304 ) ) ( not ( = ?auto_124302 ?auto_124305 ) ) ( not ( = ?auto_124302 ?auto_124306 ) ) ( not ( = ?auto_124302 ?auto_124307 ) ) ( not ( = ?auto_124302 ?auto_124308 ) ) ( not ( = ?auto_124303 ?auto_124304 ) ) ( not ( = ?auto_124303 ?auto_124305 ) ) ( not ( = ?auto_124303 ?auto_124306 ) ) ( not ( = ?auto_124303 ?auto_124307 ) ) ( not ( = ?auto_124303 ?auto_124308 ) ) ( not ( = ?auto_124304 ?auto_124305 ) ) ( not ( = ?auto_124304 ?auto_124306 ) ) ( not ( = ?auto_124304 ?auto_124307 ) ) ( not ( = ?auto_124304 ?auto_124308 ) ) ( not ( = ?auto_124305 ?auto_124306 ) ) ( not ( = ?auto_124305 ?auto_124307 ) ) ( not ( = ?auto_124305 ?auto_124308 ) ) ( not ( = ?auto_124306 ?auto_124307 ) ) ( not ( = ?auto_124306 ?auto_124308 ) ) ( not ( = ?auto_124307 ?auto_124308 ) ) ( ON-TABLE ?auto_124308 ) ( ON ?auto_124307 ?auto_124308 ) ( ON ?auto_124306 ?auto_124307 ) ( ON ?auto_124305 ?auto_124306 ) ( ON ?auto_124301 ?auto_124309 ) ( not ( = ?auto_124301 ?auto_124309 ) ) ( not ( = ?auto_124302 ?auto_124309 ) ) ( not ( = ?auto_124303 ?auto_124309 ) ) ( not ( = ?auto_124304 ?auto_124309 ) ) ( not ( = ?auto_124305 ?auto_124309 ) ) ( not ( = ?auto_124306 ?auto_124309 ) ) ( not ( = ?auto_124307 ?auto_124309 ) ) ( not ( = ?auto_124308 ?auto_124309 ) ) ( ON ?auto_124302 ?auto_124301 ) ( ON-TABLE ?auto_124309 ) ( ON ?auto_124303 ?auto_124302 ) ( CLEAR ?auto_124305 ) ( ON ?auto_124304 ?auto_124303 ) ( CLEAR ?auto_124304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124309 ?auto_124301 ?auto_124302 ?auto_124303 )
      ( MAKE-8PILE ?auto_124301 ?auto_124302 ?auto_124303 ?auto_124304 ?auto_124305 ?auto_124306 ?auto_124307 ?auto_124308 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124310 - BLOCK
      ?auto_124311 - BLOCK
      ?auto_124312 - BLOCK
      ?auto_124313 - BLOCK
      ?auto_124314 - BLOCK
      ?auto_124315 - BLOCK
      ?auto_124316 - BLOCK
      ?auto_124317 - BLOCK
    )
    :vars
    (
      ?auto_124318 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124310 ?auto_124311 ) ) ( not ( = ?auto_124310 ?auto_124312 ) ) ( not ( = ?auto_124310 ?auto_124313 ) ) ( not ( = ?auto_124310 ?auto_124314 ) ) ( not ( = ?auto_124310 ?auto_124315 ) ) ( not ( = ?auto_124310 ?auto_124316 ) ) ( not ( = ?auto_124310 ?auto_124317 ) ) ( not ( = ?auto_124311 ?auto_124312 ) ) ( not ( = ?auto_124311 ?auto_124313 ) ) ( not ( = ?auto_124311 ?auto_124314 ) ) ( not ( = ?auto_124311 ?auto_124315 ) ) ( not ( = ?auto_124311 ?auto_124316 ) ) ( not ( = ?auto_124311 ?auto_124317 ) ) ( not ( = ?auto_124312 ?auto_124313 ) ) ( not ( = ?auto_124312 ?auto_124314 ) ) ( not ( = ?auto_124312 ?auto_124315 ) ) ( not ( = ?auto_124312 ?auto_124316 ) ) ( not ( = ?auto_124312 ?auto_124317 ) ) ( not ( = ?auto_124313 ?auto_124314 ) ) ( not ( = ?auto_124313 ?auto_124315 ) ) ( not ( = ?auto_124313 ?auto_124316 ) ) ( not ( = ?auto_124313 ?auto_124317 ) ) ( not ( = ?auto_124314 ?auto_124315 ) ) ( not ( = ?auto_124314 ?auto_124316 ) ) ( not ( = ?auto_124314 ?auto_124317 ) ) ( not ( = ?auto_124315 ?auto_124316 ) ) ( not ( = ?auto_124315 ?auto_124317 ) ) ( not ( = ?auto_124316 ?auto_124317 ) ) ( ON-TABLE ?auto_124317 ) ( ON ?auto_124316 ?auto_124317 ) ( ON ?auto_124315 ?auto_124316 ) ( ON ?auto_124310 ?auto_124318 ) ( not ( = ?auto_124310 ?auto_124318 ) ) ( not ( = ?auto_124311 ?auto_124318 ) ) ( not ( = ?auto_124312 ?auto_124318 ) ) ( not ( = ?auto_124313 ?auto_124318 ) ) ( not ( = ?auto_124314 ?auto_124318 ) ) ( not ( = ?auto_124315 ?auto_124318 ) ) ( not ( = ?auto_124316 ?auto_124318 ) ) ( not ( = ?auto_124317 ?auto_124318 ) ) ( ON ?auto_124311 ?auto_124310 ) ( ON-TABLE ?auto_124318 ) ( ON ?auto_124312 ?auto_124311 ) ( ON ?auto_124313 ?auto_124312 ) ( CLEAR ?auto_124313 ) ( HOLDING ?auto_124314 ) ( CLEAR ?auto_124315 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124317 ?auto_124316 ?auto_124315 ?auto_124314 )
      ( MAKE-8PILE ?auto_124310 ?auto_124311 ?auto_124312 ?auto_124313 ?auto_124314 ?auto_124315 ?auto_124316 ?auto_124317 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124319 - BLOCK
      ?auto_124320 - BLOCK
      ?auto_124321 - BLOCK
      ?auto_124322 - BLOCK
      ?auto_124323 - BLOCK
      ?auto_124324 - BLOCK
      ?auto_124325 - BLOCK
      ?auto_124326 - BLOCK
    )
    :vars
    (
      ?auto_124327 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124319 ?auto_124320 ) ) ( not ( = ?auto_124319 ?auto_124321 ) ) ( not ( = ?auto_124319 ?auto_124322 ) ) ( not ( = ?auto_124319 ?auto_124323 ) ) ( not ( = ?auto_124319 ?auto_124324 ) ) ( not ( = ?auto_124319 ?auto_124325 ) ) ( not ( = ?auto_124319 ?auto_124326 ) ) ( not ( = ?auto_124320 ?auto_124321 ) ) ( not ( = ?auto_124320 ?auto_124322 ) ) ( not ( = ?auto_124320 ?auto_124323 ) ) ( not ( = ?auto_124320 ?auto_124324 ) ) ( not ( = ?auto_124320 ?auto_124325 ) ) ( not ( = ?auto_124320 ?auto_124326 ) ) ( not ( = ?auto_124321 ?auto_124322 ) ) ( not ( = ?auto_124321 ?auto_124323 ) ) ( not ( = ?auto_124321 ?auto_124324 ) ) ( not ( = ?auto_124321 ?auto_124325 ) ) ( not ( = ?auto_124321 ?auto_124326 ) ) ( not ( = ?auto_124322 ?auto_124323 ) ) ( not ( = ?auto_124322 ?auto_124324 ) ) ( not ( = ?auto_124322 ?auto_124325 ) ) ( not ( = ?auto_124322 ?auto_124326 ) ) ( not ( = ?auto_124323 ?auto_124324 ) ) ( not ( = ?auto_124323 ?auto_124325 ) ) ( not ( = ?auto_124323 ?auto_124326 ) ) ( not ( = ?auto_124324 ?auto_124325 ) ) ( not ( = ?auto_124324 ?auto_124326 ) ) ( not ( = ?auto_124325 ?auto_124326 ) ) ( ON-TABLE ?auto_124326 ) ( ON ?auto_124325 ?auto_124326 ) ( ON ?auto_124324 ?auto_124325 ) ( ON ?auto_124319 ?auto_124327 ) ( not ( = ?auto_124319 ?auto_124327 ) ) ( not ( = ?auto_124320 ?auto_124327 ) ) ( not ( = ?auto_124321 ?auto_124327 ) ) ( not ( = ?auto_124322 ?auto_124327 ) ) ( not ( = ?auto_124323 ?auto_124327 ) ) ( not ( = ?auto_124324 ?auto_124327 ) ) ( not ( = ?auto_124325 ?auto_124327 ) ) ( not ( = ?auto_124326 ?auto_124327 ) ) ( ON ?auto_124320 ?auto_124319 ) ( ON-TABLE ?auto_124327 ) ( ON ?auto_124321 ?auto_124320 ) ( ON ?auto_124322 ?auto_124321 ) ( CLEAR ?auto_124324 ) ( ON ?auto_124323 ?auto_124322 ) ( CLEAR ?auto_124323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124327 ?auto_124319 ?auto_124320 ?auto_124321 ?auto_124322 )
      ( MAKE-8PILE ?auto_124319 ?auto_124320 ?auto_124321 ?auto_124322 ?auto_124323 ?auto_124324 ?auto_124325 ?auto_124326 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124328 - BLOCK
      ?auto_124329 - BLOCK
      ?auto_124330 - BLOCK
      ?auto_124331 - BLOCK
      ?auto_124332 - BLOCK
      ?auto_124333 - BLOCK
      ?auto_124334 - BLOCK
      ?auto_124335 - BLOCK
    )
    :vars
    (
      ?auto_124336 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124328 ?auto_124329 ) ) ( not ( = ?auto_124328 ?auto_124330 ) ) ( not ( = ?auto_124328 ?auto_124331 ) ) ( not ( = ?auto_124328 ?auto_124332 ) ) ( not ( = ?auto_124328 ?auto_124333 ) ) ( not ( = ?auto_124328 ?auto_124334 ) ) ( not ( = ?auto_124328 ?auto_124335 ) ) ( not ( = ?auto_124329 ?auto_124330 ) ) ( not ( = ?auto_124329 ?auto_124331 ) ) ( not ( = ?auto_124329 ?auto_124332 ) ) ( not ( = ?auto_124329 ?auto_124333 ) ) ( not ( = ?auto_124329 ?auto_124334 ) ) ( not ( = ?auto_124329 ?auto_124335 ) ) ( not ( = ?auto_124330 ?auto_124331 ) ) ( not ( = ?auto_124330 ?auto_124332 ) ) ( not ( = ?auto_124330 ?auto_124333 ) ) ( not ( = ?auto_124330 ?auto_124334 ) ) ( not ( = ?auto_124330 ?auto_124335 ) ) ( not ( = ?auto_124331 ?auto_124332 ) ) ( not ( = ?auto_124331 ?auto_124333 ) ) ( not ( = ?auto_124331 ?auto_124334 ) ) ( not ( = ?auto_124331 ?auto_124335 ) ) ( not ( = ?auto_124332 ?auto_124333 ) ) ( not ( = ?auto_124332 ?auto_124334 ) ) ( not ( = ?auto_124332 ?auto_124335 ) ) ( not ( = ?auto_124333 ?auto_124334 ) ) ( not ( = ?auto_124333 ?auto_124335 ) ) ( not ( = ?auto_124334 ?auto_124335 ) ) ( ON-TABLE ?auto_124335 ) ( ON ?auto_124334 ?auto_124335 ) ( ON ?auto_124328 ?auto_124336 ) ( not ( = ?auto_124328 ?auto_124336 ) ) ( not ( = ?auto_124329 ?auto_124336 ) ) ( not ( = ?auto_124330 ?auto_124336 ) ) ( not ( = ?auto_124331 ?auto_124336 ) ) ( not ( = ?auto_124332 ?auto_124336 ) ) ( not ( = ?auto_124333 ?auto_124336 ) ) ( not ( = ?auto_124334 ?auto_124336 ) ) ( not ( = ?auto_124335 ?auto_124336 ) ) ( ON ?auto_124329 ?auto_124328 ) ( ON-TABLE ?auto_124336 ) ( ON ?auto_124330 ?auto_124329 ) ( ON ?auto_124331 ?auto_124330 ) ( ON ?auto_124332 ?auto_124331 ) ( CLEAR ?auto_124332 ) ( HOLDING ?auto_124333 ) ( CLEAR ?auto_124334 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124335 ?auto_124334 ?auto_124333 )
      ( MAKE-8PILE ?auto_124328 ?auto_124329 ?auto_124330 ?auto_124331 ?auto_124332 ?auto_124333 ?auto_124334 ?auto_124335 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124337 - BLOCK
      ?auto_124338 - BLOCK
      ?auto_124339 - BLOCK
      ?auto_124340 - BLOCK
      ?auto_124341 - BLOCK
      ?auto_124342 - BLOCK
      ?auto_124343 - BLOCK
      ?auto_124344 - BLOCK
    )
    :vars
    (
      ?auto_124345 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124337 ?auto_124338 ) ) ( not ( = ?auto_124337 ?auto_124339 ) ) ( not ( = ?auto_124337 ?auto_124340 ) ) ( not ( = ?auto_124337 ?auto_124341 ) ) ( not ( = ?auto_124337 ?auto_124342 ) ) ( not ( = ?auto_124337 ?auto_124343 ) ) ( not ( = ?auto_124337 ?auto_124344 ) ) ( not ( = ?auto_124338 ?auto_124339 ) ) ( not ( = ?auto_124338 ?auto_124340 ) ) ( not ( = ?auto_124338 ?auto_124341 ) ) ( not ( = ?auto_124338 ?auto_124342 ) ) ( not ( = ?auto_124338 ?auto_124343 ) ) ( not ( = ?auto_124338 ?auto_124344 ) ) ( not ( = ?auto_124339 ?auto_124340 ) ) ( not ( = ?auto_124339 ?auto_124341 ) ) ( not ( = ?auto_124339 ?auto_124342 ) ) ( not ( = ?auto_124339 ?auto_124343 ) ) ( not ( = ?auto_124339 ?auto_124344 ) ) ( not ( = ?auto_124340 ?auto_124341 ) ) ( not ( = ?auto_124340 ?auto_124342 ) ) ( not ( = ?auto_124340 ?auto_124343 ) ) ( not ( = ?auto_124340 ?auto_124344 ) ) ( not ( = ?auto_124341 ?auto_124342 ) ) ( not ( = ?auto_124341 ?auto_124343 ) ) ( not ( = ?auto_124341 ?auto_124344 ) ) ( not ( = ?auto_124342 ?auto_124343 ) ) ( not ( = ?auto_124342 ?auto_124344 ) ) ( not ( = ?auto_124343 ?auto_124344 ) ) ( ON-TABLE ?auto_124344 ) ( ON ?auto_124343 ?auto_124344 ) ( ON ?auto_124337 ?auto_124345 ) ( not ( = ?auto_124337 ?auto_124345 ) ) ( not ( = ?auto_124338 ?auto_124345 ) ) ( not ( = ?auto_124339 ?auto_124345 ) ) ( not ( = ?auto_124340 ?auto_124345 ) ) ( not ( = ?auto_124341 ?auto_124345 ) ) ( not ( = ?auto_124342 ?auto_124345 ) ) ( not ( = ?auto_124343 ?auto_124345 ) ) ( not ( = ?auto_124344 ?auto_124345 ) ) ( ON ?auto_124338 ?auto_124337 ) ( ON-TABLE ?auto_124345 ) ( ON ?auto_124339 ?auto_124338 ) ( ON ?auto_124340 ?auto_124339 ) ( ON ?auto_124341 ?auto_124340 ) ( CLEAR ?auto_124343 ) ( ON ?auto_124342 ?auto_124341 ) ( CLEAR ?auto_124342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124345 ?auto_124337 ?auto_124338 ?auto_124339 ?auto_124340 ?auto_124341 )
      ( MAKE-8PILE ?auto_124337 ?auto_124338 ?auto_124339 ?auto_124340 ?auto_124341 ?auto_124342 ?auto_124343 ?auto_124344 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124346 - BLOCK
      ?auto_124347 - BLOCK
      ?auto_124348 - BLOCK
      ?auto_124349 - BLOCK
      ?auto_124350 - BLOCK
      ?auto_124351 - BLOCK
      ?auto_124352 - BLOCK
      ?auto_124353 - BLOCK
    )
    :vars
    (
      ?auto_124354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124346 ?auto_124347 ) ) ( not ( = ?auto_124346 ?auto_124348 ) ) ( not ( = ?auto_124346 ?auto_124349 ) ) ( not ( = ?auto_124346 ?auto_124350 ) ) ( not ( = ?auto_124346 ?auto_124351 ) ) ( not ( = ?auto_124346 ?auto_124352 ) ) ( not ( = ?auto_124346 ?auto_124353 ) ) ( not ( = ?auto_124347 ?auto_124348 ) ) ( not ( = ?auto_124347 ?auto_124349 ) ) ( not ( = ?auto_124347 ?auto_124350 ) ) ( not ( = ?auto_124347 ?auto_124351 ) ) ( not ( = ?auto_124347 ?auto_124352 ) ) ( not ( = ?auto_124347 ?auto_124353 ) ) ( not ( = ?auto_124348 ?auto_124349 ) ) ( not ( = ?auto_124348 ?auto_124350 ) ) ( not ( = ?auto_124348 ?auto_124351 ) ) ( not ( = ?auto_124348 ?auto_124352 ) ) ( not ( = ?auto_124348 ?auto_124353 ) ) ( not ( = ?auto_124349 ?auto_124350 ) ) ( not ( = ?auto_124349 ?auto_124351 ) ) ( not ( = ?auto_124349 ?auto_124352 ) ) ( not ( = ?auto_124349 ?auto_124353 ) ) ( not ( = ?auto_124350 ?auto_124351 ) ) ( not ( = ?auto_124350 ?auto_124352 ) ) ( not ( = ?auto_124350 ?auto_124353 ) ) ( not ( = ?auto_124351 ?auto_124352 ) ) ( not ( = ?auto_124351 ?auto_124353 ) ) ( not ( = ?auto_124352 ?auto_124353 ) ) ( ON-TABLE ?auto_124353 ) ( ON ?auto_124346 ?auto_124354 ) ( not ( = ?auto_124346 ?auto_124354 ) ) ( not ( = ?auto_124347 ?auto_124354 ) ) ( not ( = ?auto_124348 ?auto_124354 ) ) ( not ( = ?auto_124349 ?auto_124354 ) ) ( not ( = ?auto_124350 ?auto_124354 ) ) ( not ( = ?auto_124351 ?auto_124354 ) ) ( not ( = ?auto_124352 ?auto_124354 ) ) ( not ( = ?auto_124353 ?auto_124354 ) ) ( ON ?auto_124347 ?auto_124346 ) ( ON-TABLE ?auto_124354 ) ( ON ?auto_124348 ?auto_124347 ) ( ON ?auto_124349 ?auto_124348 ) ( ON ?auto_124350 ?auto_124349 ) ( ON ?auto_124351 ?auto_124350 ) ( CLEAR ?auto_124351 ) ( HOLDING ?auto_124352 ) ( CLEAR ?auto_124353 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124353 ?auto_124352 )
      ( MAKE-8PILE ?auto_124346 ?auto_124347 ?auto_124348 ?auto_124349 ?auto_124350 ?auto_124351 ?auto_124352 ?auto_124353 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124355 - BLOCK
      ?auto_124356 - BLOCK
      ?auto_124357 - BLOCK
      ?auto_124358 - BLOCK
      ?auto_124359 - BLOCK
      ?auto_124360 - BLOCK
      ?auto_124361 - BLOCK
      ?auto_124362 - BLOCK
    )
    :vars
    (
      ?auto_124363 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124355 ?auto_124356 ) ) ( not ( = ?auto_124355 ?auto_124357 ) ) ( not ( = ?auto_124355 ?auto_124358 ) ) ( not ( = ?auto_124355 ?auto_124359 ) ) ( not ( = ?auto_124355 ?auto_124360 ) ) ( not ( = ?auto_124355 ?auto_124361 ) ) ( not ( = ?auto_124355 ?auto_124362 ) ) ( not ( = ?auto_124356 ?auto_124357 ) ) ( not ( = ?auto_124356 ?auto_124358 ) ) ( not ( = ?auto_124356 ?auto_124359 ) ) ( not ( = ?auto_124356 ?auto_124360 ) ) ( not ( = ?auto_124356 ?auto_124361 ) ) ( not ( = ?auto_124356 ?auto_124362 ) ) ( not ( = ?auto_124357 ?auto_124358 ) ) ( not ( = ?auto_124357 ?auto_124359 ) ) ( not ( = ?auto_124357 ?auto_124360 ) ) ( not ( = ?auto_124357 ?auto_124361 ) ) ( not ( = ?auto_124357 ?auto_124362 ) ) ( not ( = ?auto_124358 ?auto_124359 ) ) ( not ( = ?auto_124358 ?auto_124360 ) ) ( not ( = ?auto_124358 ?auto_124361 ) ) ( not ( = ?auto_124358 ?auto_124362 ) ) ( not ( = ?auto_124359 ?auto_124360 ) ) ( not ( = ?auto_124359 ?auto_124361 ) ) ( not ( = ?auto_124359 ?auto_124362 ) ) ( not ( = ?auto_124360 ?auto_124361 ) ) ( not ( = ?auto_124360 ?auto_124362 ) ) ( not ( = ?auto_124361 ?auto_124362 ) ) ( ON-TABLE ?auto_124362 ) ( ON ?auto_124355 ?auto_124363 ) ( not ( = ?auto_124355 ?auto_124363 ) ) ( not ( = ?auto_124356 ?auto_124363 ) ) ( not ( = ?auto_124357 ?auto_124363 ) ) ( not ( = ?auto_124358 ?auto_124363 ) ) ( not ( = ?auto_124359 ?auto_124363 ) ) ( not ( = ?auto_124360 ?auto_124363 ) ) ( not ( = ?auto_124361 ?auto_124363 ) ) ( not ( = ?auto_124362 ?auto_124363 ) ) ( ON ?auto_124356 ?auto_124355 ) ( ON-TABLE ?auto_124363 ) ( ON ?auto_124357 ?auto_124356 ) ( ON ?auto_124358 ?auto_124357 ) ( ON ?auto_124359 ?auto_124358 ) ( ON ?auto_124360 ?auto_124359 ) ( CLEAR ?auto_124362 ) ( ON ?auto_124361 ?auto_124360 ) ( CLEAR ?auto_124361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_124363 ?auto_124355 ?auto_124356 ?auto_124357 ?auto_124358 ?auto_124359 ?auto_124360 )
      ( MAKE-8PILE ?auto_124355 ?auto_124356 ?auto_124357 ?auto_124358 ?auto_124359 ?auto_124360 ?auto_124361 ?auto_124362 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124364 - BLOCK
      ?auto_124365 - BLOCK
      ?auto_124366 - BLOCK
      ?auto_124367 - BLOCK
      ?auto_124368 - BLOCK
      ?auto_124369 - BLOCK
      ?auto_124370 - BLOCK
      ?auto_124371 - BLOCK
    )
    :vars
    (
      ?auto_124372 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124364 ?auto_124365 ) ) ( not ( = ?auto_124364 ?auto_124366 ) ) ( not ( = ?auto_124364 ?auto_124367 ) ) ( not ( = ?auto_124364 ?auto_124368 ) ) ( not ( = ?auto_124364 ?auto_124369 ) ) ( not ( = ?auto_124364 ?auto_124370 ) ) ( not ( = ?auto_124364 ?auto_124371 ) ) ( not ( = ?auto_124365 ?auto_124366 ) ) ( not ( = ?auto_124365 ?auto_124367 ) ) ( not ( = ?auto_124365 ?auto_124368 ) ) ( not ( = ?auto_124365 ?auto_124369 ) ) ( not ( = ?auto_124365 ?auto_124370 ) ) ( not ( = ?auto_124365 ?auto_124371 ) ) ( not ( = ?auto_124366 ?auto_124367 ) ) ( not ( = ?auto_124366 ?auto_124368 ) ) ( not ( = ?auto_124366 ?auto_124369 ) ) ( not ( = ?auto_124366 ?auto_124370 ) ) ( not ( = ?auto_124366 ?auto_124371 ) ) ( not ( = ?auto_124367 ?auto_124368 ) ) ( not ( = ?auto_124367 ?auto_124369 ) ) ( not ( = ?auto_124367 ?auto_124370 ) ) ( not ( = ?auto_124367 ?auto_124371 ) ) ( not ( = ?auto_124368 ?auto_124369 ) ) ( not ( = ?auto_124368 ?auto_124370 ) ) ( not ( = ?auto_124368 ?auto_124371 ) ) ( not ( = ?auto_124369 ?auto_124370 ) ) ( not ( = ?auto_124369 ?auto_124371 ) ) ( not ( = ?auto_124370 ?auto_124371 ) ) ( ON ?auto_124364 ?auto_124372 ) ( not ( = ?auto_124364 ?auto_124372 ) ) ( not ( = ?auto_124365 ?auto_124372 ) ) ( not ( = ?auto_124366 ?auto_124372 ) ) ( not ( = ?auto_124367 ?auto_124372 ) ) ( not ( = ?auto_124368 ?auto_124372 ) ) ( not ( = ?auto_124369 ?auto_124372 ) ) ( not ( = ?auto_124370 ?auto_124372 ) ) ( not ( = ?auto_124371 ?auto_124372 ) ) ( ON ?auto_124365 ?auto_124364 ) ( ON-TABLE ?auto_124372 ) ( ON ?auto_124366 ?auto_124365 ) ( ON ?auto_124367 ?auto_124366 ) ( ON ?auto_124368 ?auto_124367 ) ( ON ?auto_124369 ?auto_124368 ) ( ON ?auto_124370 ?auto_124369 ) ( CLEAR ?auto_124370 ) ( HOLDING ?auto_124371 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124371 )
      ( MAKE-8PILE ?auto_124364 ?auto_124365 ?auto_124366 ?auto_124367 ?auto_124368 ?auto_124369 ?auto_124370 ?auto_124371 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124373 - BLOCK
      ?auto_124374 - BLOCK
      ?auto_124375 - BLOCK
      ?auto_124376 - BLOCK
      ?auto_124377 - BLOCK
      ?auto_124378 - BLOCK
      ?auto_124379 - BLOCK
      ?auto_124380 - BLOCK
    )
    :vars
    (
      ?auto_124381 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124373 ?auto_124374 ) ) ( not ( = ?auto_124373 ?auto_124375 ) ) ( not ( = ?auto_124373 ?auto_124376 ) ) ( not ( = ?auto_124373 ?auto_124377 ) ) ( not ( = ?auto_124373 ?auto_124378 ) ) ( not ( = ?auto_124373 ?auto_124379 ) ) ( not ( = ?auto_124373 ?auto_124380 ) ) ( not ( = ?auto_124374 ?auto_124375 ) ) ( not ( = ?auto_124374 ?auto_124376 ) ) ( not ( = ?auto_124374 ?auto_124377 ) ) ( not ( = ?auto_124374 ?auto_124378 ) ) ( not ( = ?auto_124374 ?auto_124379 ) ) ( not ( = ?auto_124374 ?auto_124380 ) ) ( not ( = ?auto_124375 ?auto_124376 ) ) ( not ( = ?auto_124375 ?auto_124377 ) ) ( not ( = ?auto_124375 ?auto_124378 ) ) ( not ( = ?auto_124375 ?auto_124379 ) ) ( not ( = ?auto_124375 ?auto_124380 ) ) ( not ( = ?auto_124376 ?auto_124377 ) ) ( not ( = ?auto_124376 ?auto_124378 ) ) ( not ( = ?auto_124376 ?auto_124379 ) ) ( not ( = ?auto_124376 ?auto_124380 ) ) ( not ( = ?auto_124377 ?auto_124378 ) ) ( not ( = ?auto_124377 ?auto_124379 ) ) ( not ( = ?auto_124377 ?auto_124380 ) ) ( not ( = ?auto_124378 ?auto_124379 ) ) ( not ( = ?auto_124378 ?auto_124380 ) ) ( not ( = ?auto_124379 ?auto_124380 ) ) ( ON ?auto_124373 ?auto_124381 ) ( not ( = ?auto_124373 ?auto_124381 ) ) ( not ( = ?auto_124374 ?auto_124381 ) ) ( not ( = ?auto_124375 ?auto_124381 ) ) ( not ( = ?auto_124376 ?auto_124381 ) ) ( not ( = ?auto_124377 ?auto_124381 ) ) ( not ( = ?auto_124378 ?auto_124381 ) ) ( not ( = ?auto_124379 ?auto_124381 ) ) ( not ( = ?auto_124380 ?auto_124381 ) ) ( ON ?auto_124374 ?auto_124373 ) ( ON-TABLE ?auto_124381 ) ( ON ?auto_124375 ?auto_124374 ) ( ON ?auto_124376 ?auto_124375 ) ( ON ?auto_124377 ?auto_124376 ) ( ON ?auto_124378 ?auto_124377 ) ( ON ?auto_124379 ?auto_124378 ) ( ON ?auto_124380 ?auto_124379 ) ( CLEAR ?auto_124380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_124381 ?auto_124373 ?auto_124374 ?auto_124375 ?auto_124376 ?auto_124377 ?auto_124378 ?auto_124379 )
      ( MAKE-8PILE ?auto_124373 ?auto_124374 ?auto_124375 ?auto_124376 ?auto_124377 ?auto_124378 ?auto_124379 ?auto_124380 ) )
  )

)

