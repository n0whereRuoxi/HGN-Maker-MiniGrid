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
      ?auto_143597 - BLOCK
    )
    :vars
    (
      ?auto_143598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143597 ?auto_143598 ) ( CLEAR ?auto_143597 ) ( HAND-EMPTY ) ( not ( = ?auto_143597 ?auto_143598 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143597 ?auto_143598 )
      ( !PUTDOWN ?auto_143597 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_143600 - BLOCK
    )
    :vars
    (
      ?auto_143601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143600 ?auto_143601 ) ( CLEAR ?auto_143600 ) ( HAND-EMPTY ) ( not ( = ?auto_143600 ?auto_143601 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143600 ?auto_143601 )
      ( !PUTDOWN ?auto_143600 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143604 - BLOCK
      ?auto_143605 - BLOCK
    )
    :vars
    (
      ?auto_143606 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_143604 ) ( ON ?auto_143605 ?auto_143606 ) ( CLEAR ?auto_143605 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143604 ) ( not ( = ?auto_143604 ?auto_143605 ) ) ( not ( = ?auto_143604 ?auto_143606 ) ) ( not ( = ?auto_143605 ?auto_143606 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143605 ?auto_143606 )
      ( !STACK ?auto_143605 ?auto_143604 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143609 - BLOCK
      ?auto_143610 - BLOCK
    )
    :vars
    (
      ?auto_143611 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_143609 ) ( ON ?auto_143610 ?auto_143611 ) ( CLEAR ?auto_143610 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143609 ) ( not ( = ?auto_143609 ?auto_143610 ) ) ( not ( = ?auto_143609 ?auto_143611 ) ) ( not ( = ?auto_143610 ?auto_143611 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143610 ?auto_143611 )
      ( !STACK ?auto_143610 ?auto_143609 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143614 - BLOCK
      ?auto_143615 - BLOCK
    )
    :vars
    (
      ?auto_143616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143615 ?auto_143616 ) ( not ( = ?auto_143614 ?auto_143615 ) ) ( not ( = ?auto_143614 ?auto_143616 ) ) ( not ( = ?auto_143615 ?auto_143616 ) ) ( ON ?auto_143614 ?auto_143615 ) ( CLEAR ?auto_143614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143614 )
      ( MAKE-2PILE ?auto_143614 ?auto_143615 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_143619 - BLOCK
      ?auto_143620 - BLOCK
    )
    :vars
    (
      ?auto_143621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143620 ?auto_143621 ) ( not ( = ?auto_143619 ?auto_143620 ) ) ( not ( = ?auto_143619 ?auto_143621 ) ) ( not ( = ?auto_143620 ?auto_143621 ) ) ( ON ?auto_143619 ?auto_143620 ) ( CLEAR ?auto_143619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143619 )
      ( MAKE-2PILE ?auto_143619 ?auto_143620 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143625 - BLOCK
      ?auto_143626 - BLOCK
      ?auto_143627 - BLOCK
    )
    :vars
    (
      ?auto_143628 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_143626 ) ( ON ?auto_143627 ?auto_143628 ) ( CLEAR ?auto_143627 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143625 ) ( ON ?auto_143626 ?auto_143625 ) ( not ( = ?auto_143625 ?auto_143626 ) ) ( not ( = ?auto_143625 ?auto_143627 ) ) ( not ( = ?auto_143625 ?auto_143628 ) ) ( not ( = ?auto_143626 ?auto_143627 ) ) ( not ( = ?auto_143626 ?auto_143628 ) ) ( not ( = ?auto_143627 ?auto_143628 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143627 ?auto_143628 )
      ( !STACK ?auto_143627 ?auto_143626 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143632 - BLOCK
      ?auto_143633 - BLOCK
      ?auto_143634 - BLOCK
    )
    :vars
    (
      ?auto_143635 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_143633 ) ( ON ?auto_143634 ?auto_143635 ) ( CLEAR ?auto_143634 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143632 ) ( ON ?auto_143633 ?auto_143632 ) ( not ( = ?auto_143632 ?auto_143633 ) ) ( not ( = ?auto_143632 ?auto_143634 ) ) ( not ( = ?auto_143632 ?auto_143635 ) ) ( not ( = ?auto_143633 ?auto_143634 ) ) ( not ( = ?auto_143633 ?auto_143635 ) ) ( not ( = ?auto_143634 ?auto_143635 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143634 ?auto_143635 )
      ( !STACK ?auto_143634 ?auto_143633 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143639 - BLOCK
      ?auto_143640 - BLOCK
      ?auto_143641 - BLOCK
    )
    :vars
    (
      ?auto_143642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143641 ?auto_143642 ) ( ON-TABLE ?auto_143639 ) ( not ( = ?auto_143639 ?auto_143640 ) ) ( not ( = ?auto_143639 ?auto_143641 ) ) ( not ( = ?auto_143639 ?auto_143642 ) ) ( not ( = ?auto_143640 ?auto_143641 ) ) ( not ( = ?auto_143640 ?auto_143642 ) ) ( not ( = ?auto_143641 ?auto_143642 ) ) ( CLEAR ?auto_143639 ) ( ON ?auto_143640 ?auto_143641 ) ( CLEAR ?auto_143640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143639 ?auto_143640 )
      ( MAKE-3PILE ?auto_143639 ?auto_143640 ?auto_143641 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143646 - BLOCK
      ?auto_143647 - BLOCK
      ?auto_143648 - BLOCK
    )
    :vars
    (
      ?auto_143649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143648 ?auto_143649 ) ( ON-TABLE ?auto_143646 ) ( not ( = ?auto_143646 ?auto_143647 ) ) ( not ( = ?auto_143646 ?auto_143648 ) ) ( not ( = ?auto_143646 ?auto_143649 ) ) ( not ( = ?auto_143647 ?auto_143648 ) ) ( not ( = ?auto_143647 ?auto_143649 ) ) ( not ( = ?auto_143648 ?auto_143649 ) ) ( CLEAR ?auto_143646 ) ( ON ?auto_143647 ?auto_143648 ) ( CLEAR ?auto_143647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143646 ?auto_143647 )
      ( MAKE-3PILE ?auto_143646 ?auto_143647 ?auto_143648 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143653 - BLOCK
      ?auto_143654 - BLOCK
      ?auto_143655 - BLOCK
    )
    :vars
    (
      ?auto_143656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143655 ?auto_143656 ) ( not ( = ?auto_143653 ?auto_143654 ) ) ( not ( = ?auto_143653 ?auto_143655 ) ) ( not ( = ?auto_143653 ?auto_143656 ) ) ( not ( = ?auto_143654 ?auto_143655 ) ) ( not ( = ?auto_143654 ?auto_143656 ) ) ( not ( = ?auto_143655 ?auto_143656 ) ) ( ON ?auto_143654 ?auto_143655 ) ( ON ?auto_143653 ?auto_143654 ) ( CLEAR ?auto_143653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143653 )
      ( MAKE-3PILE ?auto_143653 ?auto_143654 ?auto_143655 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_143660 - BLOCK
      ?auto_143661 - BLOCK
      ?auto_143662 - BLOCK
    )
    :vars
    (
      ?auto_143663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143662 ?auto_143663 ) ( not ( = ?auto_143660 ?auto_143661 ) ) ( not ( = ?auto_143660 ?auto_143662 ) ) ( not ( = ?auto_143660 ?auto_143663 ) ) ( not ( = ?auto_143661 ?auto_143662 ) ) ( not ( = ?auto_143661 ?auto_143663 ) ) ( not ( = ?auto_143662 ?auto_143663 ) ) ( ON ?auto_143661 ?auto_143662 ) ( ON ?auto_143660 ?auto_143661 ) ( CLEAR ?auto_143660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143660 )
      ( MAKE-3PILE ?auto_143660 ?auto_143661 ?auto_143662 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143668 - BLOCK
      ?auto_143669 - BLOCK
      ?auto_143670 - BLOCK
      ?auto_143671 - BLOCK
    )
    :vars
    (
      ?auto_143672 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_143670 ) ( ON ?auto_143671 ?auto_143672 ) ( CLEAR ?auto_143671 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143668 ) ( ON ?auto_143669 ?auto_143668 ) ( ON ?auto_143670 ?auto_143669 ) ( not ( = ?auto_143668 ?auto_143669 ) ) ( not ( = ?auto_143668 ?auto_143670 ) ) ( not ( = ?auto_143668 ?auto_143671 ) ) ( not ( = ?auto_143668 ?auto_143672 ) ) ( not ( = ?auto_143669 ?auto_143670 ) ) ( not ( = ?auto_143669 ?auto_143671 ) ) ( not ( = ?auto_143669 ?auto_143672 ) ) ( not ( = ?auto_143670 ?auto_143671 ) ) ( not ( = ?auto_143670 ?auto_143672 ) ) ( not ( = ?auto_143671 ?auto_143672 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143671 ?auto_143672 )
      ( !STACK ?auto_143671 ?auto_143670 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143677 - BLOCK
      ?auto_143678 - BLOCK
      ?auto_143679 - BLOCK
      ?auto_143680 - BLOCK
    )
    :vars
    (
      ?auto_143681 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_143679 ) ( ON ?auto_143680 ?auto_143681 ) ( CLEAR ?auto_143680 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143677 ) ( ON ?auto_143678 ?auto_143677 ) ( ON ?auto_143679 ?auto_143678 ) ( not ( = ?auto_143677 ?auto_143678 ) ) ( not ( = ?auto_143677 ?auto_143679 ) ) ( not ( = ?auto_143677 ?auto_143680 ) ) ( not ( = ?auto_143677 ?auto_143681 ) ) ( not ( = ?auto_143678 ?auto_143679 ) ) ( not ( = ?auto_143678 ?auto_143680 ) ) ( not ( = ?auto_143678 ?auto_143681 ) ) ( not ( = ?auto_143679 ?auto_143680 ) ) ( not ( = ?auto_143679 ?auto_143681 ) ) ( not ( = ?auto_143680 ?auto_143681 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143680 ?auto_143681 )
      ( !STACK ?auto_143680 ?auto_143679 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143686 - BLOCK
      ?auto_143687 - BLOCK
      ?auto_143688 - BLOCK
      ?auto_143689 - BLOCK
    )
    :vars
    (
      ?auto_143690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143689 ?auto_143690 ) ( ON-TABLE ?auto_143686 ) ( ON ?auto_143687 ?auto_143686 ) ( not ( = ?auto_143686 ?auto_143687 ) ) ( not ( = ?auto_143686 ?auto_143688 ) ) ( not ( = ?auto_143686 ?auto_143689 ) ) ( not ( = ?auto_143686 ?auto_143690 ) ) ( not ( = ?auto_143687 ?auto_143688 ) ) ( not ( = ?auto_143687 ?auto_143689 ) ) ( not ( = ?auto_143687 ?auto_143690 ) ) ( not ( = ?auto_143688 ?auto_143689 ) ) ( not ( = ?auto_143688 ?auto_143690 ) ) ( not ( = ?auto_143689 ?auto_143690 ) ) ( CLEAR ?auto_143687 ) ( ON ?auto_143688 ?auto_143689 ) ( CLEAR ?auto_143688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143686 ?auto_143687 ?auto_143688 )
      ( MAKE-4PILE ?auto_143686 ?auto_143687 ?auto_143688 ?auto_143689 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143695 - BLOCK
      ?auto_143696 - BLOCK
      ?auto_143697 - BLOCK
      ?auto_143698 - BLOCK
    )
    :vars
    (
      ?auto_143699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143698 ?auto_143699 ) ( ON-TABLE ?auto_143695 ) ( ON ?auto_143696 ?auto_143695 ) ( not ( = ?auto_143695 ?auto_143696 ) ) ( not ( = ?auto_143695 ?auto_143697 ) ) ( not ( = ?auto_143695 ?auto_143698 ) ) ( not ( = ?auto_143695 ?auto_143699 ) ) ( not ( = ?auto_143696 ?auto_143697 ) ) ( not ( = ?auto_143696 ?auto_143698 ) ) ( not ( = ?auto_143696 ?auto_143699 ) ) ( not ( = ?auto_143697 ?auto_143698 ) ) ( not ( = ?auto_143697 ?auto_143699 ) ) ( not ( = ?auto_143698 ?auto_143699 ) ) ( CLEAR ?auto_143696 ) ( ON ?auto_143697 ?auto_143698 ) ( CLEAR ?auto_143697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143695 ?auto_143696 ?auto_143697 )
      ( MAKE-4PILE ?auto_143695 ?auto_143696 ?auto_143697 ?auto_143698 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143704 - BLOCK
      ?auto_143705 - BLOCK
      ?auto_143706 - BLOCK
      ?auto_143707 - BLOCK
    )
    :vars
    (
      ?auto_143708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143707 ?auto_143708 ) ( ON-TABLE ?auto_143704 ) ( not ( = ?auto_143704 ?auto_143705 ) ) ( not ( = ?auto_143704 ?auto_143706 ) ) ( not ( = ?auto_143704 ?auto_143707 ) ) ( not ( = ?auto_143704 ?auto_143708 ) ) ( not ( = ?auto_143705 ?auto_143706 ) ) ( not ( = ?auto_143705 ?auto_143707 ) ) ( not ( = ?auto_143705 ?auto_143708 ) ) ( not ( = ?auto_143706 ?auto_143707 ) ) ( not ( = ?auto_143706 ?auto_143708 ) ) ( not ( = ?auto_143707 ?auto_143708 ) ) ( ON ?auto_143706 ?auto_143707 ) ( CLEAR ?auto_143704 ) ( ON ?auto_143705 ?auto_143706 ) ( CLEAR ?auto_143705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143704 ?auto_143705 )
      ( MAKE-4PILE ?auto_143704 ?auto_143705 ?auto_143706 ?auto_143707 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143713 - BLOCK
      ?auto_143714 - BLOCK
      ?auto_143715 - BLOCK
      ?auto_143716 - BLOCK
    )
    :vars
    (
      ?auto_143717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143716 ?auto_143717 ) ( ON-TABLE ?auto_143713 ) ( not ( = ?auto_143713 ?auto_143714 ) ) ( not ( = ?auto_143713 ?auto_143715 ) ) ( not ( = ?auto_143713 ?auto_143716 ) ) ( not ( = ?auto_143713 ?auto_143717 ) ) ( not ( = ?auto_143714 ?auto_143715 ) ) ( not ( = ?auto_143714 ?auto_143716 ) ) ( not ( = ?auto_143714 ?auto_143717 ) ) ( not ( = ?auto_143715 ?auto_143716 ) ) ( not ( = ?auto_143715 ?auto_143717 ) ) ( not ( = ?auto_143716 ?auto_143717 ) ) ( ON ?auto_143715 ?auto_143716 ) ( CLEAR ?auto_143713 ) ( ON ?auto_143714 ?auto_143715 ) ( CLEAR ?auto_143714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143713 ?auto_143714 )
      ( MAKE-4PILE ?auto_143713 ?auto_143714 ?auto_143715 ?auto_143716 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143722 - BLOCK
      ?auto_143723 - BLOCK
      ?auto_143724 - BLOCK
      ?auto_143725 - BLOCK
    )
    :vars
    (
      ?auto_143726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143725 ?auto_143726 ) ( not ( = ?auto_143722 ?auto_143723 ) ) ( not ( = ?auto_143722 ?auto_143724 ) ) ( not ( = ?auto_143722 ?auto_143725 ) ) ( not ( = ?auto_143722 ?auto_143726 ) ) ( not ( = ?auto_143723 ?auto_143724 ) ) ( not ( = ?auto_143723 ?auto_143725 ) ) ( not ( = ?auto_143723 ?auto_143726 ) ) ( not ( = ?auto_143724 ?auto_143725 ) ) ( not ( = ?auto_143724 ?auto_143726 ) ) ( not ( = ?auto_143725 ?auto_143726 ) ) ( ON ?auto_143724 ?auto_143725 ) ( ON ?auto_143723 ?auto_143724 ) ( ON ?auto_143722 ?auto_143723 ) ( CLEAR ?auto_143722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143722 )
      ( MAKE-4PILE ?auto_143722 ?auto_143723 ?auto_143724 ?auto_143725 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_143731 - BLOCK
      ?auto_143732 - BLOCK
      ?auto_143733 - BLOCK
      ?auto_143734 - BLOCK
    )
    :vars
    (
      ?auto_143735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143734 ?auto_143735 ) ( not ( = ?auto_143731 ?auto_143732 ) ) ( not ( = ?auto_143731 ?auto_143733 ) ) ( not ( = ?auto_143731 ?auto_143734 ) ) ( not ( = ?auto_143731 ?auto_143735 ) ) ( not ( = ?auto_143732 ?auto_143733 ) ) ( not ( = ?auto_143732 ?auto_143734 ) ) ( not ( = ?auto_143732 ?auto_143735 ) ) ( not ( = ?auto_143733 ?auto_143734 ) ) ( not ( = ?auto_143733 ?auto_143735 ) ) ( not ( = ?auto_143734 ?auto_143735 ) ) ( ON ?auto_143733 ?auto_143734 ) ( ON ?auto_143732 ?auto_143733 ) ( ON ?auto_143731 ?auto_143732 ) ( CLEAR ?auto_143731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143731 )
      ( MAKE-4PILE ?auto_143731 ?auto_143732 ?auto_143733 ?auto_143734 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143741 - BLOCK
      ?auto_143742 - BLOCK
      ?auto_143743 - BLOCK
      ?auto_143744 - BLOCK
      ?auto_143745 - BLOCK
    )
    :vars
    (
      ?auto_143746 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_143744 ) ( ON ?auto_143745 ?auto_143746 ) ( CLEAR ?auto_143745 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143741 ) ( ON ?auto_143742 ?auto_143741 ) ( ON ?auto_143743 ?auto_143742 ) ( ON ?auto_143744 ?auto_143743 ) ( not ( = ?auto_143741 ?auto_143742 ) ) ( not ( = ?auto_143741 ?auto_143743 ) ) ( not ( = ?auto_143741 ?auto_143744 ) ) ( not ( = ?auto_143741 ?auto_143745 ) ) ( not ( = ?auto_143741 ?auto_143746 ) ) ( not ( = ?auto_143742 ?auto_143743 ) ) ( not ( = ?auto_143742 ?auto_143744 ) ) ( not ( = ?auto_143742 ?auto_143745 ) ) ( not ( = ?auto_143742 ?auto_143746 ) ) ( not ( = ?auto_143743 ?auto_143744 ) ) ( not ( = ?auto_143743 ?auto_143745 ) ) ( not ( = ?auto_143743 ?auto_143746 ) ) ( not ( = ?auto_143744 ?auto_143745 ) ) ( not ( = ?auto_143744 ?auto_143746 ) ) ( not ( = ?auto_143745 ?auto_143746 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143745 ?auto_143746 )
      ( !STACK ?auto_143745 ?auto_143744 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143752 - BLOCK
      ?auto_143753 - BLOCK
      ?auto_143754 - BLOCK
      ?auto_143755 - BLOCK
      ?auto_143756 - BLOCK
    )
    :vars
    (
      ?auto_143757 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_143755 ) ( ON ?auto_143756 ?auto_143757 ) ( CLEAR ?auto_143756 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143752 ) ( ON ?auto_143753 ?auto_143752 ) ( ON ?auto_143754 ?auto_143753 ) ( ON ?auto_143755 ?auto_143754 ) ( not ( = ?auto_143752 ?auto_143753 ) ) ( not ( = ?auto_143752 ?auto_143754 ) ) ( not ( = ?auto_143752 ?auto_143755 ) ) ( not ( = ?auto_143752 ?auto_143756 ) ) ( not ( = ?auto_143752 ?auto_143757 ) ) ( not ( = ?auto_143753 ?auto_143754 ) ) ( not ( = ?auto_143753 ?auto_143755 ) ) ( not ( = ?auto_143753 ?auto_143756 ) ) ( not ( = ?auto_143753 ?auto_143757 ) ) ( not ( = ?auto_143754 ?auto_143755 ) ) ( not ( = ?auto_143754 ?auto_143756 ) ) ( not ( = ?auto_143754 ?auto_143757 ) ) ( not ( = ?auto_143755 ?auto_143756 ) ) ( not ( = ?auto_143755 ?auto_143757 ) ) ( not ( = ?auto_143756 ?auto_143757 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143756 ?auto_143757 )
      ( !STACK ?auto_143756 ?auto_143755 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143763 - BLOCK
      ?auto_143764 - BLOCK
      ?auto_143765 - BLOCK
      ?auto_143766 - BLOCK
      ?auto_143767 - BLOCK
    )
    :vars
    (
      ?auto_143768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143767 ?auto_143768 ) ( ON-TABLE ?auto_143763 ) ( ON ?auto_143764 ?auto_143763 ) ( ON ?auto_143765 ?auto_143764 ) ( not ( = ?auto_143763 ?auto_143764 ) ) ( not ( = ?auto_143763 ?auto_143765 ) ) ( not ( = ?auto_143763 ?auto_143766 ) ) ( not ( = ?auto_143763 ?auto_143767 ) ) ( not ( = ?auto_143763 ?auto_143768 ) ) ( not ( = ?auto_143764 ?auto_143765 ) ) ( not ( = ?auto_143764 ?auto_143766 ) ) ( not ( = ?auto_143764 ?auto_143767 ) ) ( not ( = ?auto_143764 ?auto_143768 ) ) ( not ( = ?auto_143765 ?auto_143766 ) ) ( not ( = ?auto_143765 ?auto_143767 ) ) ( not ( = ?auto_143765 ?auto_143768 ) ) ( not ( = ?auto_143766 ?auto_143767 ) ) ( not ( = ?auto_143766 ?auto_143768 ) ) ( not ( = ?auto_143767 ?auto_143768 ) ) ( CLEAR ?auto_143765 ) ( ON ?auto_143766 ?auto_143767 ) ( CLEAR ?auto_143766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143763 ?auto_143764 ?auto_143765 ?auto_143766 )
      ( MAKE-5PILE ?auto_143763 ?auto_143764 ?auto_143765 ?auto_143766 ?auto_143767 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143774 - BLOCK
      ?auto_143775 - BLOCK
      ?auto_143776 - BLOCK
      ?auto_143777 - BLOCK
      ?auto_143778 - BLOCK
    )
    :vars
    (
      ?auto_143779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143778 ?auto_143779 ) ( ON-TABLE ?auto_143774 ) ( ON ?auto_143775 ?auto_143774 ) ( ON ?auto_143776 ?auto_143775 ) ( not ( = ?auto_143774 ?auto_143775 ) ) ( not ( = ?auto_143774 ?auto_143776 ) ) ( not ( = ?auto_143774 ?auto_143777 ) ) ( not ( = ?auto_143774 ?auto_143778 ) ) ( not ( = ?auto_143774 ?auto_143779 ) ) ( not ( = ?auto_143775 ?auto_143776 ) ) ( not ( = ?auto_143775 ?auto_143777 ) ) ( not ( = ?auto_143775 ?auto_143778 ) ) ( not ( = ?auto_143775 ?auto_143779 ) ) ( not ( = ?auto_143776 ?auto_143777 ) ) ( not ( = ?auto_143776 ?auto_143778 ) ) ( not ( = ?auto_143776 ?auto_143779 ) ) ( not ( = ?auto_143777 ?auto_143778 ) ) ( not ( = ?auto_143777 ?auto_143779 ) ) ( not ( = ?auto_143778 ?auto_143779 ) ) ( CLEAR ?auto_143776 ) ( ON ?auto_143777 ?auto_143778 ) ( CLEAR ?auto_143777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143774 ?auto_143775 ?auto_143776 ?auto_143777 )
      ( MAKE-5PILE ?auto_143774 ?auto_143775 ?auto_143776 ?auto_143777 ?auto_143778 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143785 - BLOCK
      ?auto_143786 - BLOCK
      ?auto_143787 - BLOCK
      ?auto_143788 - BLOCK
      ?auto_143789 - BLOCK
    )
    :vars
    (
      ?auto_143790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143789 ?auto_143790 ) ( ON-TABLE ?auto_143785 ) ( ON ?auto_143786 ?auto_143785 ) ( not ( = ?auto_143785 ?auto_143786 ) ) ( not ( = ?auto_143785 ?auto_143787 ) ) ( not ( = ?auto_143785 ?auto_143788 ) ) ( not ( = ?auto_143785 ?auto_143789 ) ) ( not ( = ?auto_143785 ?auto_143790 ) ) ( not ( = ?auto_143786 ?auto_143787 ) ) ( not ( = ?auto_143786 ?auto_143788 ) ) ( not ( = ?auto_143786 ?auto_143789 ) ) ( not ( = ?auto_143786 ?auto_143790 ) ) ( not ( = ?auto_143787 ?auto_143788 ) ) ( not ( = ?auto_143787 ?auto_143789 ) ) ( not ( = ?auto_143787 ?auto_143790 ) ) ( not ( = ?auto_143788 ?auto_143789 ) ) ( not ( = ?auto_143788 ?auto_143790 ) ) ( not ( = ?auto_143789 ?auto_143790 ) ) ( ON ?auto_143788 ?auto_143789 ) ( CLEAR ?auto_143786 ) ( ON ?auto_143787 ?auto_143788 ) ( CLEAR ?auto_143787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143785 ?auto_143786 ?auto_143787 )
      ( MAKE-5PILE ?auto_143785 ?auto_143786 ?auto_143787 ?auto_143788 ?auto_143789 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143796 - BLOCK
      ?auto_143797 - BLOCK
      ?auto_143798 - BLOCK
      ?auto_143799 - BLOCK
      ?auto_143800 - BLOCK
    )
    :vars
    (
      ?auto_143801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143800 ?auto_143801 ) ( ON-TABLE ?auto_143796 ) ( ON ?auto_143797 ?auto_143796 ) ( not ( = ?auto_143796 ?auto_143797 ) ) ( not ( = ?auto_143796 ?auto_143798 ) ) ( not ( = ?auto_143796 ?auto_143799 ) ) ( not ( = ?auto_143796 ?auto_143800 ) ) ( not ( = ?auto_143796 ?auto_143801 ) ) ( not ( = ?auto_143797 ?auto_143798 ) ) ( not ( = ?auto_143797 ?auto_143799 ) ) ( not ( = ?auto_143797 ?auto_143800 ) ) ( not ( = ?auto_143797 ?auto_143801 ) ) ( not ( = ?auto_143798 ?auto_143799 ) ) ( not ( = ?auto_143798 ?auto_143800 ) ) ( not ( = ?auto_143798 ?auto_143801 ) ) ( not ( = ?auto_143799 ?auto_143800 ) ) ( not ( = ?auto_143799 ?auto_143801 ) ) ( not ( = ?auto_143800 ?auto_143801 ) ) ( ON ?auto_143799 ?auto_143800 ) ( CLEAR ?auto_143797 ) ( ON ?auto_143798 ?auto_143799 ) ( CLEAR ?auto_143798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143796 ?auto_143797 ?auto_143798 )
      ( MAKE-5PILE ?auto_143796 ?auto_143797 ?auto_143798 ?auto_143799 ?auto_143800 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143807 - BLOCK
      ?auto_143808 - BLOCK
      ?auto_143809 - BLOCK
      ?auto_143810 - BLOCK
      ?auto_143811 - BLOCK
    )
    :vars
    (
      ?auto_143812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143811 ?auto_143812 ) ( ON-TABLE ?auto_143807 ) ( not ( = ?auto_143807 ?auto_143808 ) ) ( not ( = ?auto_143807 ?auto_143809 ) ) ( not ( = ?auto_143807 ?auto_143810 ) ) ( not ( = ?auto_143807 ?auto_143811 ) ) ( not ( = ?auto_143807 ?auto_143812 ) ) ( not ( = ?auto_143808 ?auto_143809 ) ) ( not ( = ?auto_143808 ?auto_143810 ) ) ( not ( = ?auto_143808 ?auto_143811 ) ) ( not ( = ?auto_143808 ?auto_143812 ) ) ( not ( = ?auto_143809 ?auto_143810 ) ) ( not ( = ?auto_143809 ?auto_143811 ) ) ( not ( = ?auto_143809 ?auto_143812 ) ) ( not ( = ?auto_143810 ?auto_143811 ) ) ( not ( = ?auto_143810 ?auto_143812 ) ) ( not ( = ?auto_143811 ?auto_143812 ) ) ( ON ?auto_143810 ?auto_143811 ) ( ON ?auto_143809 ?auto_143810 ) ( CLEAR ?auto_143807 ) ( ON ?auto_143808 ?auto_143809 ) ( CLEAR ?auto_143808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143807 ?auto_143808 )
      ( MAKE-5PILE ?auto_143807 ?auto_143808 ?auto_143809 ?auto_143810 ?auto_143811 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143818 - BLOCK
      ?auto_143819 - BLOCK
      ?auto_143820 - BLOCK
      ?auto_143821 - BLOCK
      ?auto_143822 - BLOCK
    )
    :vars
    (
      ?auto_143823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143822 ?auto_143823 ) ( ON-TABLE ?auto_143818 ) ( not ( = ?auto_143818 ?auto_143819 ) ) ( not ( = ?auto_143818 ?auto_143820 ) ) ( not ( = ?auto_143818 ?auto_143821 ) ) ( not ( = ?auto_143818 ?auto_143822 ) ) ( not ( = ?auto_143818 ?auto_143823 ) ) ( not ( = ?auto_143819 ?auto_143820 ) ) ( not ( = ?auto_143819 ?auto_143821 ) ) ( not ( = ?auto_143819 ?auto_143822 ) ) ( not ( = ?auto_143819 ?auto_143823 ) ) ( not ( = ?auto_143820 ?auto_143821 ) ) ( not ( = ?auto_143820 ?auto_143822 ) ) ( not ( = ?auto_143820 ?auto_143823 ) ) ( not ( = ?auto_143821 ?auto_143822 ) ) ( not ( = ?auto_143821 ?auto_143823 ) ) ( not ( = ?auto_143822 ?auto_143823 ) ) ( ON ?auto_143821 ?auto_143822 ) ( ON ?auto_143820 ?auto_143821 ) ( CLEAR ?auto_143818 ) ( ON ?auto_143819 ?auto_143820 ) ( CLEAR ?auto_143819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143818 ?auto_143819 )
      ( MAKE-5PILE ?auto_143818 ?auto_143819 ?auto_143820 ?auto_143821 ?auto_143822 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143829 - BLOCK
      ?auto_143830 - BLOCK
      ?auto_143831 - BLOCK
      ?auto_143832 - BLOCK
      ?auto_143833 - BLOCK
    )
    :vars
    (
      ?auto_143834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143833 ?auto_143834 ) ( not ( = ?auto_143829 ?auto_143830 ) ) ( not ( = ?auto_143829 ?auto_143831 ) ) ( not ( = ?auto_143829 ?auto_143832 ) ) ( not ( = ?auto_143829 ?auto_143833 ) ) ( not ( = ?auto_143829 ?auto_143834 ) ) ( not ( = ?auto_143830 ?auto_143831 ) ) ( not ( = ?auto_143830 ?auto_143832 ) ) ( not ( = ?auto_143830 ?auto_143833 ) ) ( not ( = ?auto_143830 ?auto_143834 ) ) ( not ( = ?auto_143831 ?auto_143832 ) ) ( not ( = ?auto_143831 ?auto_143833 ) ) ( not ( = ?auto_143831 ?auto_143834 ) ) ( not ( = ?auto_143832 ?auto_143833 ) ) ( not ( = ?auto_143832 ?auto_143834 ) ) ( not ( = ?auto_143833 ?auto_143834 ) ) ( ON ?auto_143832 ?auto_143833 ) ( ON ?auto_143831 ?auto_143832 ) ( ON ?auto_143830 ?auto_143831 ) ( ON ?auto_143829 ?auto_143830 ) ( CLEAR ?auto_143829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143829 )
      ( MAKE-5PILE ?auto_143829 ?auto_143830 ?auto_143831 ?auto_143832 ?auto_143833 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_143840 - BLOCK
      ?auto_143841 - BLOCK
      ?auto_143842 - BLOCK
      ?auto_143843 - BLOCK
      ?auto_143844 - BLOCK
    )
    :vars
    (
      ?auto_143845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143844 ?auto_143845 ) ( not ( = ?auto_143840 ?auto_143841 ) ) ( not ( = ?auto_143840 ?auto_143842 ) ) ( not ( = ?auto_143840 ?auto_143843 ) ) ( not ( = ?auto_143840 ?auto_143844 ) ) ( not ( = ?auto_143840 ?auto_143845 ) ) ( not ( = ?auto_143841 ?auto_143842 ) ) ( not ( = ?auto_143841 ?auto_143843 ) ) ( not ( = ?auto_143841 ?auto_143844 ) ) ( not ( = ?auto_143841 ?auto_143845 ) ) ( not ( = ?auto_143842 ?auto_143843 ) ) ( not ( = ?auto_143842 ?auto_143844 ) ) ( not ( = ?auto_143842 ?auto_143845 ) ) ( not ( = ?auto_143843 ?auto_143844 ) ) ( not ( = ?auto_143843 ?auto_143845 ) ) ( not ( = ?auto_143844 ?auto_143845 ) ) ( ON ?auto_143843 ?auto_143844 ) ( ON ?auto_143842 ?auto_143843 ) ( ON ?auto_143841 ?auto_143842 ) ( ON ?auto_143840 ?auto_143841 ) ( CLEAR ?auto_143840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143840 )
      ( MAKE-5PILE ?auto_143840 ?auto_143841 ?auto_143842 ?auto_143843 ?auto_143844 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143852 - BLOCK
      ?auto_143853 - BLOCK
      ?auto_143854 - BLOCK
      ?auto_143855 - BLOCK
      ?auto_143856 - BLOCK
      ?auto_143857 - BLOCK
    )
    :vars
    (
      ?auto_143858 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_143856 ) ( ON ?auto_143857 ?auto_143858 ) ( CLEAR ?auto_143857 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143852 ) ( ON ?auto_143853 ?auto_143852 ) ( ON ?auto_143854 ?auto_143853 ) ( ON ?auto_143855 ?auto_143854 ) ( ON ?auto_143856 ?auto_143855 ) ( not ( = ?auto_143852 ?auto_143853 ) ) ( not ( = ?auto_143852 ?auto_143854 ) ) ( not ( = ?auto_143852 ?auto_143855 ) ) ( not ( = ?auto_143852 ?auto_143856 ) ) ( not ( = ?auto_143852 ?auto_143857 ) ) ( not ( = ?auto_143852 ?auto_143858 ) ) ( not ( = ?auto_143853 ?auto_143854 ) ) ( not ( = ?auto_143853 ?auto_143855 ) ) ( not ( = ?auto_143853 ?auto_143856 ) ) ( not ( = ?auto_143853 ?auto_143857 ) ) ( not ( = ?auto_143853 ?auto_143858 ) ) ( not ( = ?auto_143854 ?auto_143855 ) ) ( not ( = ?auto_143854 ?auto_143856 ) ) ( not ( = ?auto_143854 ?auto_143857 ) ) ( not ( = ?auto_143854 ?auto_143858 ) ) ( not ( = ?auto_143855 ?auto_143856 ) ) ( not ( = ?auto_143855 ?auto_143857 ) ) ( not ( = ?auto_143855 ?auto_143858 ) ) ( not ( = ?auto_143856 ?auto_143857 ) ) ( not ( = ?auto_143856 ?auto_143858 ) ) ( not ( = ?auto_143857 ?auto_143858 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143857 ?auto_143858 )
      ( !STACK ?auto_143857 ?auto_143856 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143865 - BLOCK
      ?auto_143866 - BLOCK
      ?auto_143867 - BLOCK
      ?auto_143868 - BLOCK
      ?auto_143869 - BLOCK
      ?auto_143870 - BLOCK
    )
    :vars
    (
      ?auto_143871 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_143869 ) ( ON ?auto_143870 ?auto_143871 ) ( CLEAR ?auto_143870 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143865 ) ( ON ?auto_143866 ?auto_143865 ) ( ON ?auto_143867 ?auto_143866 ) ( ON ?auto_143868 ?auto_143867 ) ( ON ?auto_143869 ?auto_143868 ) ( not ( = ?auto_143865 ?auto_143866 ) ) ( not ( = ?auto_143865 ?auto_143867 ) ) ( not ( = ?auto_143865 ?auto_143868 ) ) ( not ( = ?auto_143865 ?auto_143869 ) ) ( not ( = ?auto_143865 ?auto_143870 ) ) ( not ( = ?auto_143865 ?auto_143871 ) ) ( not ( = ?auto_143866 ?auto_143867 ) ) ( not ( = ?auto_143866 ?auto_143868 ) ) ( not ( = ?auto_143866 ?auto_143869 ) ) ( not ( = ?auto_143866 ?auto_143870 ) ) ( not ( = ?auto_143866 ?auto_143871 ) ) ( not ( = ?auto_143867 ?auto_143868 ) ) ( not ( = ?auto_143867 ?auto_143869 ) ) ( not ( = ?auto_143867 ?auto_143870 ) ) ( not ( = ?auto_143867 ?auto_143871 ) ) ( not ( = ?auto_143868 ?auto_143869 ) ) ( not ( = ?auto_143868 ?auto_143870 ) ) ( not ( = ?auto_143868 ?auto_143871 ) ) ( not ( = ?auto_143869 ?auto_143870 ) ) ( not ( = ?auto_143869 ?auto_143871 ) ) ( not ( = ?auto_143870 ?auto_143871 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143870 ?auto_143871 )
      ( !STACK ?auto_143870 ?auto_143869 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143878 - BLOCK
      ?auto_143879 - BLOCK
      ?auto_143880 - BLOCK
      ?auto_143881 - BLOCK
      ?auto_143882 - BLOCK
      ?auto_143883 - BLOCK
    )
    :vars
    (
      ?auto_143884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143883 ?auto_143884 ) ( ON-TABLE ?auto_143878 ) ( ON ?auto_143879 ?auto_143878 ) ( ON ?auto_143880 ?auto_143879 ) ( ON ?auto_143881 ?auto_143880 ) ( not ( = ?auto_143878 ?auto_143879 ) ) ( not ( = ?auto_143878 ?auto_143880 ) ) ( not ( = ?auto_143878 ?auto_143881 ) ) ( not ( = ?auto_143878 ?auto_143882 ) ) ( not ( = ?auto_143878 ?auto_143883 ) ) ( not ( = ?auto_143878 ?auto_143884 ) ) ( not ( = ?auto_143879 ?auto_143880 ) ) ( not ( = ?auto_143879 ?auto_143881 ) ) ( not ( = ?auto_143879 ?auto_143882 ) ) ( not ( = ?auto_143879 ?auto_143883 ) ) ( not ( = ?auto_143879 ?auto_143884 ) ) ( not ( = ?auto_143880 ?auto_143881 ) ) ( not ( = ?auto_143880 ?auto_143882 ) ) ( not ( = ?auto_143880 ?auto_143883 ) ) ( not ( = ?auto_143880 ?auto_143884 ) ) ( not ( = ?auto_143881 ?auto_143882 ) ) ( not ( = ?auto_143881 ?auto_143883 ) ) ( not ( = ?auto_143881 ?auto_143884 ) ) ( not ( = ?auto_143882 ?auto_143883 ) ) ( not ( = ?auto_143882 ?auto_143884 ) ) ( not ( = ?auto_143883 ?auto_143884 ) ) ( CLEAR ?auto_143881 ) ( ON ?auto_143882 ?auto_143883 ) ( CLEAR ?auto_143882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143878 ?auto_143879 ?auto_143880 ?auto_143881 ?auto_143882 )
      ( MAKE-6PILE ?auto_143878 ?auto_143879 ?auto_143880 ?auto_143881 ?auto_143882 ?auto_143883 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143891 - BLOCK
      ?auto_143892 - BLOCK
      ?auto_143893 - BLOCK
      ?auto_143894 - BLOCK
      ?auto_143895 - BLOCK
      ?auto_143896 - BLOCK
    )
    :vars
    (
      ?auto_143897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143896 ?auto_143897 ) ( ON-TABLE ?auto_143891 ) ( ON ?auto_143892 ?auto_143891 ) ( ON ?auto_143893 ?auto_143892 ) ( ON ?auto_143894 ?auto_143893 ) ( not ( = ?auto_143891 ?auto_143892 ) ) ( not ( = ?auto_143891 ?auto_143893 ) ) ( not ( = ?auto_143891 ?auto_143894 ) ) ( not ( = ?auto_143891 ?auto_143895 ) ) ( not ( = ?auto_143891 ?auto_143896 ) ) ( not ( = ?auto_143891 ?auto_143897 ) ) ( not ( = ?auto_143892 ?auto_143893 ) ) ( not ( = ?auto_143892 ?auto_143894 ) ) ( not ( = ?auto_143892 ?auto_143895 ) ) ( not ( = ?auto_143892 ?auto_143896 ) ) ( not ( = ?auto_143892 ?auto_143897 ) ) ( not ( = ?auto_143893 ?auto_143894 ) ) ( not ( = ?auto_143893 ?auto_143895 ) ) ( not ( = ?auto_143893 ?auto_143896 ) ) ( not ( = ?auto_143893 ?auto_143897 ) ) ( not ( = ?auto_143894 ?auto_143895 ) ) ( not ( = ?auto_143894 ?auto_143896 ) ) ( not ( = ?auto_143894 ?auto_143897 ) ) ( not ( = ?auto_143895 ?auto_143896 ) ) ( not ( = ?auto_143895 ?auto_143897 ) ) ( not ( = ?auto_143896 ?auto_143897 ) ) ( CLEAR ?auto_143894 ) ( ON ?auto_143895 ?auto_143896 ) ( CLEAR ?auto_143895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143891 ?auto_143892 ?auto_143893 ?auto_143894 ?auto_143895 )
      ( MAKE-6PILE ?auto_143891 ?auto_143892 ?auto_143893 ?auto_143894 ?auto_143895 ?auto_143896 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143904 - BLOCK
      ?auto_143905 - BLOCK
      ?auto_143906 - BLOCK
      ?auto_143907 - BLOCK
      ?auto_143908 - BLOCK
      ?auto_143909 - BLOCK
    )
    :vars
    (
      ?auto_143910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143909 ?auto_143910 ) ( ON-TABLE ?auto_143904 ) ( ON ?auto_143905 ?auto_143904 ) ( ON ?auto_143906 ?auto_143905 ) ( not ( = ?auto_143904 ?auto_143905 ) ) ( not ( = ?auto_143904 ?auto_143906 ) ) ( not ( = ?auto_143904 ?auto_143907 ) ) ( not ( = ?auto_143904 ?auto_143908 ) ) ( not ( = ?auto_143904 ?auto_143909 ) ) ( not ( = ?auto_143904 ?auto_143910 ) ) ( not ( = ?auto_143905 ?auto_143906 ) ) ( not ( = ?auto_143905 ?auto_143907 ) ) ( not ( = ?auto_143905 ?auto_143908 ) ) ( not ( = ?auto_143905 ?auto_143909 ) ) ( not ( = ?auto_143905 ?auto_143910 ) ) ( not ( = ?auto_143906 ?auto_143907 ) ) ( not ( = ?auto_143906 ?auto_143908 ) ) ( not ( = ?auto_143906 ?auto_143909 ) ) ( not ( = ?auto_143906 ?auto_143910 ) ) ( not ( = ?auto_143907 ?auto_143908 ) ) ( not ( = ?auto_143907 ?auto_143909 ) ) ( not ( = ?auto_143907 ?auto_143910 ) ) ( not ( = ?auto_143908 ?auto_143909 ) ) ( not ( = ?auto_143908 ?auto_143910 ) ) ( not ( = ?auto_143909 ?auto_143910 ) ) ( ON ?auto_143908 ?auto_143909 ) ( CLEAR ?auto_143906 ) ( ON ?auto_143907 ?auto_143908 ) ( CLEAR ?auto_143907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143904 ?auto_143905 ?auto_143906 ?auto_143907 )
      ( MAKE-6PILE ?auto_143904 ?auto_143905 ?auto_143906 ?auto_143907 ?auto_143908 ?auto_143909 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143917 - BLOCK
      ?auto_143918 - BLOCK
      ?auto_143919 - BLOCK
      ?auto_143920 - BLOCK
      ?auto_143921 - BLOCK
      ?auto_143922 - BLOCK
    )
    :vars
    (
      ?auto_143923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143922 ?auto_143923 ) ( ON-TABLE ?auto_143917 ) ( ON ?auto_143918 ?auto_143917 ) ( ON ?auto_143919 ?auto_143918 ) ( not ( = ?auto_143917 ?auto_143918 ) ) ( not ( = ?auto_143917 ?auto_143919 ) ) ( not ( = ?auto_143917 ?auto_143920 ) ) ( not ( = ?auto_143917 ?auto_143921 ) ) ( not ( = ?auto_143917 ?auto_143922 ) ) ( not ( = ?auto_143917 ?auto_143923 ) ) ( not ( = ?auto_143918 ?auto_143919 ) ) ( not ( = ?auto_143918 ?auto_143920 ) ) ( not ( = ?auto_143918 ?auto_143921 ) ) ( not ( = ?auto_143918 ?auto_143922 ) ) ( not ( = ?auto_143918 ?auto_143923 ) ) ( not ( = ?auto_143919 ?auto_143920 ) ) ( not ( = ?auto_143919 ?auto_143921 ) ) ( not ( = ?auto_143919 ?auto_143922 ) ) ( not ( = ?auto_143919 ?auto_143923 ) ) ( not ( = ?auto_143920 ?auto_143921 ) ) ( not ( = ?auto_143920 ?auto_143922 ) ) ( not ( = ?auto_143920 ?auto_143923 ) ) ( not ( = ?auto_143921 ?auto_143922 ) ) ( not ( = ?auto_143921 ?auto_143923 ) ) ( not ( = ?auto_143922 ?auto_143923 ) ) ( ON ?auto_143921 ?auto_143922 ) ( CLEAR ?auto_143919 ) ( ON ?auto_143920 ?auto_143921 ) ( CLEAR ?auto_143920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143917 ?auto_143918 ?auto_143919 ?auto_143920 )
      ( MAKE-6PILE ?auto_143917 ?auto_143918 ?auto_143919 ?auto_143920 ?auto_143921 ?auto_143922 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143930 - BLOCK
      ?auto_143931 - BLOCK
      ?auto_143932 - BLOCK
      ?auto_143933 - BLOCK
      ?auto_143934 - BLOCK
      ?auto_143935 - BLOCK
    )
    :vars
    (
      ?auto_143936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143935 ?auto_143936 ) ( ON-TABLE ?auto_143930 ) ( ON ?auto_143931 ?auto_143930 ) ( not ( = ?auto_143930 ?auto_143931 ) ) ( not ( = ?auto_143930 ?auto_143932 ) ) ( not ( = ?auto_143930 ?auto_143933 ) ) ( not ( = ?auto_143930 ?auto_143934 ) ) ( not ( = ?auto_143930 ?auto_143935 ) ) ( not ( = ?auto_143930 ?auto_143936 ) ) ( not ( = ?auto_143931 ?auto_143932 ) ) ( not ( = ?auto_143931 ?auto_143933 ) ) ( not ( = ?auto_143931 ?auto_143934 ) ) ( not ( = ?auto_143931 ?auto_143935 ) ) ( not ( = ?auto_143931 ?auto_143936 ) ) ( not ( = ?auto_143932 ?auto_143933 ) ) ( not ( = ?auto_143932 ?auto_143934 ) ) ( not ( = ?auto_143932 ?auto_143935 ) ) ( not ( = ?auto_143932 ?auto_143936 ) ) ( not ( = ?auto_143933 ?auto_143934 ) ) ( not ( = ?auto_143933 ?auto_143935 ) ) ( not ( = ?auto_143933 ?auto_143936 ) ) ( not ( = ?auto_143934 ?auto_143935 ) ) ( not ( = ?auto_143934 ?auto_143936 ) ) ( not ( = ?auto_143935 ?auto_143936 ) ) ( ON ?auto_143934 ?auto_143935 ) ( ON ?auto_143933 ?auto_143934 ) ( CLEAR ?auto_143931 ) ( ON ?auto_143932 ?auto_143933 ) ( CLEAR ?auto_143932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143930 ?auto_143931 ?auto_143932 )
      ( MAKE-6PILE ?auto_143930 ?auto_143931 ?auto_143932 ?auto_143933 ?auto_143934 ?auto_143935 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143943 - BLOCK
      ?auto_143944 - BLOCK
      ?auto_143945 - BLOCK
      ?auto_143946 - BLOCK
      ?auto_143947 - BLOCK
      ?auto_143948 - BLOCK
    )
    :vars
    (
      ?auto_143949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143948 ?auto_143949 ) ( ON-TABLE ?auto_143943 ) ( ON ?auto_143944 ?auto_143943 ) ( not ( = ?auto_143943 ?auto_143944 ) ) ( not ( = ?auto_143943 ?auto_143945 ) ) ( not ( = ?auto_143943 ?auto_143946 ) ) ( not ( = ?auto_143943 ?auto_143947 ) ) ( not ( = ?auto_143943 ?auto_143948 ) ) ( not ( = ?auto_143943 ?auto_143949 ) ) ( not ( = ?auto_143944 ?auto_143945 ) ) ( not ( = ?auto_143944 ?auto_143946 ) ) ( not ( = ?auto_143944 ?auto_143947 ) ) ( not ( = ?auto_143944 ?auto_143948 ) ) ( not ( = ?auto_143944 ?auto_143949 ) ) ( not ( = ?auto_143945 ?auto_143946 ) ) ( not ( = ?auto_143945 ?auto_143947 ) ) ( not ( = ?auto_143945 ?auto_143948 ) ) ( not ( = ?auto_143945 ?auto_143949 ) ) ( not ( = ?auto_143946 ?auto_143947 ) ) ( not ( = ?auto_143946 ?auto_143948 ) ) ( not ( = ?auto_143946 ?auto_143949 ) ) ( not ( = ?auto_143947 ?auto_143948 ) ) ( not ( = ?auto_143947 ?auto_143949 ) ) ( not ( = ?auto_143948 ?auto_143949 ) ) ( ON ?auto_143947 ?auto_143948 ) ( ON ?auto_143946 ?auto_143947 ) ( CLEAR ?auto_143944 ) ( ON ?auto_143945 ?auto_143946 ) ( CLEAR ?auto_143945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143943 ?auto_143944 ?auto_143945 )
      ( MAKE-6PILE ?auto_143943 ?auto_143944 ?auto_143945 ?auto_143946 ?auto_143947 ?auto_143948 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143956 - BLOCK
      ?auto_143957 - BLOCK
      ?auto_143958 - BLOCK
      ?auto_143959 - BLOCK
      ?auto_143960 - BLOCK
      ?auto_143961 - BLOCK
    )
    :vars
    (
      ?auto_143962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143961 ?auto_143962 ) ( ON-TABLE ?auto_143956 ) ( not ( = ?auto_143956 ?auto_143957 ) ) ( not ( = ?auto_143956 ?auto_143958 ) ) ( not ( = ?auto_143956 ?auto_143959 ) ) ( not ( = ?auto_143956 ?auto_143960 ) ) ( not ( = ?auto_143956 ?auto_143961 ) ) ( not ( = ?auto_143956 ?auto_143962 ) ) ( not ( = ?auto_143957 ?auto_143958 ) ) ( not ( = ?auto_143957 ?auto_143959 ) ) ( not ( = ?auto_143957 ?auto_143960 ) ) ( not ( = ?auto_143957 ?auto_143961 ) ) ( not ( = ?auto_143957 ?auto_143962 ) ) ( not ( = ?auto_143958 ?auto_143959 ) ) ( not ( = ?auto_143958 ?auto_143960 ) ) ( not ( = ?auto_143958 ?auto_143961 ) ) ( not ( = ?auto_143958 ?auto_143962 ) ) ( not ( = ?auto_143959 ?auto_143960 ) ) ( not ( = ?auto_143959 ?auto_143961 ) ) ( not ( = ?auto_143959 ?auto_143962 ) ) ( not ( = ?auto_143960 ?auto_143961 ) ) ( not ( = ?auto_143960 ?auto_143962 ) ) ( not ( = ?auto_143961 ?auto_143962 ) ) ( ON ?auto_143960 ?auto_143961 ) ( ON ?auto_143959 ?auto_143960 ) ( ON ?auto_143958 ?auto_143959 ) ( CLEAR ?auto_143956 ) ( ON ?auto_143957 ?auto_143958 ) ( CLEAR ?auto_143957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143956 ?auto_143957 )
      ( MAKE-6PILE ?auto_143956 ?auto_143957 ?auto_143958 ?auto_143959 ?auto_143960 ?auto_143961 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143969 - BLOCK
      ?auto_143970 - BLOCK
      ?auto_143971 - BLOCK
      ?auto_143972 - BLOCK
      ?auto_143973 - BLOCK
      ?auto_143974 - BLOCK
    )
    :vars
    (
      ?auto_143975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143974 ?auto_143975 ) ( ON-TABLE ?auto_143969 ) ( not ( = ?auto_143969 ?auto_143970 ) ) ( not ( = ?auto_143969 ?auto_143971 ) ) ( not ( = ?auto_143969 ?auto_143972 ) ) ( not ( = ?auto_143969 ?auto_143973 ) ) ( not ( = ?auto_143969 ?auto_143974 ) ) ( not ( = ?auto_143969 ?auto_143975 ) ) ( not ( = ?auto_143970 ?auto_143971 ) ) ( not ( = ?auto_143970 ?auto_143972 ) ) ( not ( = ?auto_143970 ?auto_143973 ) ) ( not ( = ?auto_143970 ?auto_143974 ) ) ( not ( = ?auto_143970 ?auto_143975 ) ) ( not ( = ?auto_143971 ?auto_143972 ) ) ( not ( = ?auto_143971 ?auto_143973 ) ) ( not ( = ?auto_143971 ?auto_143974 ) ) ( not ( = ?auto_143971 ?auto_143975 ) ) ( not ( = ?auto_143972 ?auto_143973 ) ) ( not ( = ?auto_143972 ?auto_143974 ) ) ( not ( = ?auto_143972 ?auto_143975 ) ) ( not ( = ?auto_143973 ?auto_143974 ) ) ( not ( = ?auto_143973 ?auto_143975 ) ) ( not ( = ?auto_143974 ?auto_143975 ) ) ( ON ?auto_143973 ?auto_143974 ) ( ON ?auto_143972 ?auto_143973 ) ( ON ?auto_143971 ?auto_143972 ) ( CLEAR ?auto_143969 ) ( ON ?auto_143970 ?auto_143971 ) ( CLEAR ?auto_143970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143969 ?auto_143970 )
      ( MAKE-6PILE ?auto_143969 ?auto_143970 ?auto_143971 ?auto_143972 ?auto_143973 ?auto_143974 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143982 - BLOCK
      ?auto_143983 - BLOCK
      ?auto_143984 - BLOCK
      ?auto_143985 - BLOCK
      ?auto_143986 - BLOCK
      ?auto_143987 - BLOCK
    )
    :vars
    (
      ?auto_143988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_143987 ?auto_143988 ) ( not ( = ?auto_143982 ?auto_143983 ) ) ( not ( = ?auto_143982 ?auto_143984 ) ) ( not ( = ?auto_143982 ?auto_143985 ) ) ( not ( = ?auto_143982 ?auto_143986 ) ) ( not ( = ?auto_143982 ?auto_143987 ) ) ( not ( = ?auto_143982 ?auto_143988 ) ) ( not ( = ?auto_143983 ?auto_143984 ) ) ( not ( = ?auto_143983 ?auto_143985 ) ) ( not ( = ?auto_143983 ?auto_143986 ) ) ( not ( = ?auto_143983 ?auto_143987 ) ) ( not ( = ?auto_143983 ?auto_143988 ) ) ( not ( = ?auto_143984 ?auto_143985 ) ) ( not ( = ?auto_143984 ?auto_143986 ) ) ( not ( = ?auto_143984 ?auto_143987 ) ) ( not ( = ?auto_143984 ?auto_143988 ) ) ( not ( = ?auto_143985 ?auto_143986 ) ) ( not ( = ?auto_143985 ?auto_143987 ) ) ( not ( = ?auto_143985 ?auto_143988 ) ) ( not ( = ?auto_143986 ?auto_143987 ) ) ( not ( = ?auto_143986 ?auto_143988 ) ) ( not ( = ?auto_143987 ?auto_143988 ) ) ( ON ?auto_143986 ?auto_143987 ) ( ON ?auto_143985 ?auto_143986 ) ( ON ?auto_143984 ?auto_143985 ) ( ON ?auto_143983 ?auto_143984 ) ( ON ?auto_143982 ?auto_143983 ) ( CLEAR ?auto_143982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143982 )
      ( MAKE-6PILE ?auto_143982 ?auto_143983 ?auto_143984 ?auto_143985 ?auto_143986 ?auto_143987 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_143995 - BLOCK
      ?auto_143996 - BLOCK
      ?auto_143997 - BLOCK
      ?auto_143998 - BLOCK
      ?auto_143999 - BLOCK
      ?auto_144000 - BLOCK
    )
    :vars
    (
      ?auto_144001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144000 ?auto_144001 ) ( not ( = ?auto_143995 ?auto_143996 ) ) ( not ( = ?auto_143995 ?auto_143997 ) ) ( not ( = ?auto_143995 ?auto_143998 ) ) ( not ( = ?auto_143995 ?auto_143999 ) ) ( not ( = ?auto_143995 ?auto_144000 ) ) ( not ( = ?auto_143995 ?auto_144001 ) ) ( not ( = ?auto_143996 ?auto_143997 ) ) ( not ( = ?auto_143996 ?auto_143998 ) ) ( not ( = ?auto_143996 ?auto_143999 ) ) ( not ( = ?auto_143996 ?auto_144000 ) ) ( not ( = ?auto_143996 ?auto_144001 ) ) ( not ( = ?auto_143997 ?auto_143998 ) ) ( not ( = ?auto_143997 ?auto_143999 ) ) ( not ( = ?auto_143997 ?auto_144000 ) ) ( not ( = ?auto_143997 ?auto_144001 ) ) ( not ( = ?auto_143998 ?auto_143999 ) ) ( not ( = ?auto_143998 ?auto_144000 ) ) ( not ( = ?auto_143998 ?auto_144001 ) ) ( not ( = ?auto_143999 ?auto_144000 ) ) ( not ( = ?auto_143999 ?auto_144001 ) ) ( not ( = ?auto_144000 ?auto_144001 ) ) ( ON ?auto_143999 ?auto_144000 ) ( ON ?auto_143998 ?auto_143999 ) ( ON ?auto_143997 ?auto_143998 ) ( ON ?auto_143996 ?auto_143997 ) ( ON ?auto_143995 ?auto_143996 ) ( CLEAR ?auto_143995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143995 )
      ( MAKE-6PILE ?auto_143995 ?auto_143996 ?auto_143997 ?auto_143998 ?auto_143999 ?auto_144000 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_144009 - BLOCK
      ?auto_144010 - BLOCK
      ?auto_144011 - BLOCK
      ?auto_144012 - BLOCK
      ?auto_144013 - BLOCK
      ?auto_144014 - BLOCK
      ?auto_144015 - BLOCK
    )
    :vars
    (
      ?auto_144016 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_144014 ) ( ON ?auto_144015 ?auto_144016 ) ( CLEAR ?auto_144015 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_144009 ) ( ON ?auto_144010 ?auto_144009 ) ( ON ?auto_144011 ?auto_144010 ) ( ON ?auto_144012 ?auto_144011 ) ( ON ?auto_144013 ?auto_144012 ) ( ON ?auto_144014 ?auto_144013 ) ( not ( = ?auto_144009 ?auto_144010 ) ) ( not ( = ?auto_144009 ?auto_144011 ) ) ( not ( = ?auto_144009 ?auto_144012 ) ) ( not ( = ?auto_144009 ?auto_144013 ) ) ( not ( = ?auto_144009 ?auto_144014 ) ) ( not ( = ?auto_144009 ?auto_144015 ) ) ( not ( = ?auto_144009 ?auto_144016 ) ) ( not ( = ?auto_144010 ?auto_144011 ) ) ( not ( = ?auto_144010 ?auto_144012 ) ) ( not ( = ?auto_144010 ?auto_144013 ) ) ( not ( = ?auto_144010 ?auto_144014 ) ) ( not ( = ?auto_144010 ?auto_144015 ) ) ( not ( = ?auto_144010 ?auto_144016 ) ) ( not ( = ?auto_144011 ?auto_144012 ) ) ( not ( = ?auto_144011 ?auto_144013 ) ) ( not ( = ?auto_144011 ?auto_144014 ) ) ( not ( = ?auto_144011 ?auto_144015 ) ) ( not ( = ?auto_144011 ?auto_144016 ) ) ( not ( = ?auto_144012 ?auto_144013 ) ) ( not ( = ?auto_144012 ?auto_144014 ) ) ( not ( = ?auto_144012 ?auto_144015 ) ) ( not ( = ?auto_144012 ?auto_144016 ) ) ( not ( = ?auto_144013 ?auto_144014 ) ) ( not ( = ?auto_144013 ?auto_144015 ) ) ( not ( = ?auto_144013 ?auto_144016 ) ) ( not ( = ?auto_144014 ?auto_144015 ) ) ( not ( = ?auto_144014 ?auto_144016 ) ) ( not ( = ?auto_144015 ?auto_144016 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_144015 ?auto_144016 )
      ( !STACK ?auto_144015 ?auto_144014 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_144024 - BLOCK
      ?auto_144025 - BLOCK
      ?auto_144026 - BLOCK
      ?auto_144027 - BLOCK
      ?auto_144028 - BLOCK
      ?auto_144029 - BLOCK
      ?auto_144030 - BLOCK
    )
    :vars
    (
      ?auto_144031 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_144029 ) ( ON ?auto_144030 ?auto_144031 ) ( CLEAR ?auto_144030 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_144024 ) ( ON ?auto_144025 ?auto_144024 ) ( ON ?auto_144026 ?auto_144025 ) ( ON ?auto_144027 ?auto_144026 ) ( ON ?auto_144028 ?auto_144027 ) ( ON ?auto_144029 ?auto_144028 ) ( not ( = ?auto_144024 ?auto_144025 ) ) ( not ( = ?auto_144024 ?auto_144026 ) ) ( not ( = ?auto_144024 ?auto_144027 ) ) ( not ( = ?auto_144024 ?auto_144028 ) ) ( not ( = ?auto_144024 ?auto_144029 ) ) ( not ( = ?auto_144024 ?auto_144030 ) ) ( not ( = ?auto_144024 ?auto_144031 ) ) ( not ( = ?auto_144025 ?auto_144026 ) ) ( not ( = ?auto_144025 ?auto_144027 ) ) ( not ( = ?auto_144025 ?auto_144028 ) ) ( not ( = ?auto_144025 ?auto_144029 ) ) ( not ( = ?auto_144025 ?auto_144030 ) ) ( not ( = ?auto_144025 ?auto_144031 ) ) ( not ( = ?auto_144026 ?auto_144027 ) ) ( not ( = ?auto_144026 ?auto_144028 ) ) ( not ( = ?auto_144026 ?auto_144029 ) ) ( not ( = ?auto_144026 ?auto_144030 ) ) ( not ( = ?auto_144026 ?auto_144031 ) ) ( not ( = ?auto_144027 ?auto_144028 ) ) ( not ( = ?auto_144027 ?auto_144029 ) ) ( not ( = ?auto_144027 ?auto_144030 ) ) ( not ( = ?auto_144027 ?auto_144031 ) ) ( not ( = ?auto_144028 ?auto_144029 ) ) ( not ( = ?auto_144028 ?auto_144030 ) ) ( not ( = ?auto_144028 ?auto_144031 ) ) ( not ( = ?auto_144029 ?auto_144030 ) ) ( not ( = ?auto_144029 ?auto_144031 ) ) ( not ( = ?auto_144030 ?auto_144031 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_144030 ?auto_144031 )
      ( !STACK ?auto_144030 ?auto_144029 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_144039 - BLOCK
      ?auto_144040 - BLOCK
      ?auto_144041 - BLOCK
      ?auto_144042 - BLOCK
      ?auto_144043 - BLOCK
      ?auto_144044 - BLOCK
      ?auto_144045 - BLOCK
    )
    :vars
    (
      ?auto_144046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144045 ?auto_144046 ) ( ON-TABLE ?auto_144039 ) ( ON ?auto_144040 ?auto_144039 ) ( ON ?auto_144041 ?auto_144040 ) ( ON ?auto_144042 ?auto_144041 ) ( ON ?auto_144043 ?auto_144042 ) ( not ( = ?auto_144039 ?auto_144040 ) ) ( not ( = ?auto_144039 ?auto_144041 ) ) ( not ( = ?auto_144039 ?auto_144042 ) ) ( not ( = ?auto_144039 ?auto_144043 ) ) ( not ( = ?auto_144039 ?auto_144044 ) ) ( not ( = ?auto_144039 ?auto_144045 ) ) ( not ( = ?auto_144039 ?auto_144046 ) ) ( not ( = ?auto_144040 ?auto_144041 ) ) ( not ( = ?auto_144040 ?auto_144042 ) ) ( not ( = ?auto_144040 ?auto_144043 ) ) ( not ( = ?auto_144040 ?auto_144044 ) ) ( not ( = ?auto_144040 ?auto_144045 ) ) ( not ( = ?auto_144040 ?auto_144046 ) ) ( not ( = ?auto_144041 ?auto_144042 ) ) ( not ( = ?auto_144041 ?auto_144043 ) ) ( not ( = ?auto_144041 ?auto_144044 ) ) ( not ( = ?auto_144041 ?auto_144045 ) ) ( not ( = ?auto_144041 ?auto_144046 ) ) ( not ( = ?auto_144042 ?auto_144043 ) ) ( not ( = ?auto_144042 ?auto_144044 ) ) ( not ( = ?auto_144042 ?auto_144045 ) ) ( not ( = ?auto_144042 ?auto_144046 ) ) ( not ( = ?auto_144043 ?auto_144044 ) ) ( not ( = ?auto_144043 ?auto_144045 ) ) ( not ( = ?auto_144043 ?auto_144046 ) ) ( not ( = ?auto_144044 ?auto_144045 ) ) ( not ( = ?auto_144044 ?auto_144046 ) ) ( not ( = ?auto_144045 ?auto_144046 ) ) ( CLEAR ?auto_144043 ) ( ON ?auto_144044 ?auto_144045 ) ( CLEAR ?auto_144044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144039 ?auto_144040 ?auto_144041 ?auto_144042 ?auto_144043 ?auto_144044 )
      ( MAKE-7PILE ?auto_144039 ?auto_144040 ?auto_144041 ?auto_144042 ?auto_144043 ?auto_144044 ?auto_144045 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_144054 - BLOCK
      ?auto_144055 - BLOCK
      ?auto_144056 - BLOCK
      ?auto_144057 - BLOCK
      ?auto_144058 - BLOCK
      ?auto_144059 - BLOCK
      ?auto_144060 - BLOCK
    )
    :vars
    (
      ?auto_144061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144060 ?auto_144061 ) ( ON-TABLE ?auto_144054 ) ( ON ?auto_144055 ?auto_144054 ) ( ON ?auto_144056 ?auto_144055 ) ( ON ?auto_144057 ?auto_144056 ) ( ON ?auto_144058 ?auto_144057 ) ( not ( = ?auto_144054 ?auto_144055 ) ) ( not ( = ?auto_144054 ?auto_144056 ) ) ( not ( = ?auto_144054 ?auto_144057 ) ) ( not ( = ?auto_144054 ?auto_144058 ) ) ( not ( = ?auto_144054 ?auto_144059 ) ) ( not ( = ?auto_144054 ?auto_144060 ) ) ( not ( = ?auto_144054 ?auto_144061 ) ) ( not ( = ?auto_144055 ?auto_144056 ) ) ( not ( = ?auto_144055 ?auto_144057 ) ) ( not ( = ?auto_144055 ?auto_144058 ) ) ( not ( = ?auto_144055 ?auto_144059 ) ) ( not ( = ?auto_144055 ?auto_144060 ) ) ( not ( = ?auto_144055 ?auto_144061 ) ) ( not ( = ?auto_144056 ?auto_144057 ) ) ( not ( = ?auto_144056 ?auto_144058 ) ) ( not ( = ?auto_144056 ?auto_144059 ) ) ( not ( = ?auto_144056 ?auto_144060 ) ) ( not ( = ?auto_144056 ?auto_144061 ) ) ( not ( = ?auto_144057 ?auto_144058 ) ) ( not ( = ?auto_144057 ?auto_144059 ) ) ( not ( = ?auto_144057 ?auto_144060 ) ) ( not ( = ?auto_144057 ?auto_144061 ) ) ( not ( = ?auto_144058 ?auto_144059 ) ) ( not ( = ?auto_144058 ?auto_144060 ) ) ( not ( = ?auto_144058 ?auto_144061 ) ) ( not ( = ?auto_144059 ?auto_144060 ) ) ( not ( = ?auto_144059 ?auto_144061 ) ) ( not ( = ?auto_144060 ?auto_144061 ) ) ( CLEAR ?auto_144058 ) ( ON ?auto_144059 ?auto_144060 ) ( CLEAR ?auto_144059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144054 ?auto_144055 ?auto_144056 ?auto_144057 ?auto_144058 ?auto_144059 )
      ( MAKE-7PILE ?auto_144054 ?auto_144055 ?auto_144056 ?auto_144057 ?auto_144058 ?auto_144059 ?auto_144060 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_144069 - BLOCK
      ?auto_144070 - BLOCK
      ?auto_144071 - BLOCK
      ?auto_144072 - BLOCK
      ?auto_144073 - BLOCK
      ?auto_144074 - BLOCK
      ?auto_144075 - BLOCK
    )
    :vars
    (
      ?auto_144076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144075 ?auto_144076 ) ( ON-TABLE ?auto_144069 ) ( ON ?auto_144070 ?auto_144069 ) ( ON ?auto_144071 ?auto_144070 ) ( ON ?auto_144072 ?auto_144071 ) ( not ( = ?auto_144069 ?auto_144070 ) ) ( not ( = ?auto_144069 ?auto_144071 ) ) ( not ( = ?auto_144069 ?auto_144072 ) ) ( not ( = ?auto_144069 ?auto_144073 ) ) ( not ( = ?auto_144069 ?auto_144074 ) ) ( not ( = ?auto_144069 ?auto_144075 ) ) ( not ( = ?auto_144069 ?auto_144076 ) ) ( not ( = ?auto_144070 ?auto_144071 ) ) ( not ( = ?auto_144070 ?auto_144072 ) ) ( not ( = ?auto_144070 ?auto_144073 ) ) ( not ( = ?auto_144070 ?auto_144074 ) ) ( not ( = ?auto_144070 ?auto_144075 ) ) ( not ( = ?auto_144070 ?auto_144076 ) ) ( not ( = ?auto_144071 ?auto_144072 ) ) ( not ( = ?auto_144071 ?auto_144073 ) ) ( not ( = ?auto_144071 ?auto_144074 ) ) ( not ( = ?auto_144071 ?auto_144075 ) ) ( not ( = ?auto_144071 ?auto_144076 ) ) ( not ( = ?auto_144072 ?auto_144073 ) ) ( not ( = ?auto_144072 ?auto_144074 ) ) ( not ( = ?auto_144072 ?auto_144075 ) ) ( not ( = ?auto_144072 ?auto_144076 ) ) ( not ( = ?auto_144073 ?auto_144074 ) ) ( not ( = ?auto_144073 ?auto_144075 ) ) ( not ( = ?auto_144073 ?auto_144076 ) ) ( not ( = ?auto_144074 ?auto_144075 ) ) ( not ( = ?auto_144074 ?auto_144076 ) ) ( not ( = ?auto_144075 ?auto_144076 ) ) ( ON ?auto_144074 ?auto_144075 ) ( CLEAR ?auto_144072 ) ( ON ?auto_144073 ?auto_144074 ) ( CLEAR ?auto_144073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144069 ?auto_144070 ?auto_144071 ?auto_144072 ?auto_144073 )
      ( MAKE-7PILE ?auto_144069 ?auto_144070 ?auto_144071 ?auto_144072 ?auto_144073 ?auto_144074 ?auto_144075 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_144084 - BLOCK
      ?auto_144085 - BLOCK
      ?auto_144086 - BLOCK
      ?auto_144087 - BLOCK
      ?auto_144088 - BLOCK
      ?auto_144089 - BLOCK
      ?auto_144090 - BLOCK
    )
    :vars
    (
      ?auto_144091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144090 ?auto_144091 ) ( ON-TABLE ?auto_144084 ) ( ON ?auto_144085 ?auto_144084 ) ( ON ?auto_144086 ?auto_144085 ) ( ON ?auto_144087 ?auto_144086 ) ( not ( = ?auto_144084 ?auto_144085 ) ) ( not ( = ?auto_144084 ?auto_144086 ) ) ( not ( = ?auto_144084 ?auto_144087 ) ) ( not ( = ?auto_144084 ?auto_144088 ) ) ( not ( = ?auto_144084 ?auto_144089 ) ) ( not ( = ?auto_144084 ?auto_144090 ) ) ( not ( = ?auto_144084 ?auto_144091 ) ) ( not ( = ?auto_144085 ?auto_144086 ) ) ( not ( = ?auto_144085 ?auto_144087 ) ) ( not ( = ?auto_144085 ?auto_144088 ) ) ( not ( = ?auto_144085 ?auto_144089 ) ) ( not ( = ?auto_144085 ?auto_144090 ) ) ( not ( = ?auto_144085 ?auto_144091 ) ) ( not ( = ?auto_144086 ?auto_144087 ) ) ( not ( = ?auto_144086 ?auto_144088 ) ) ( not ( = ?auto_144086 ?auto_144089 ) ) ( not ( = ?auto_144086 ?auto_144090 ) ) ( not ( = ?auto_144086 ?auto_144091 ) ) ( not ( = ?auto_144087 ?auto_144088 ) ) ( not ( = ?auto_144087 ?auto_144089 ) ) ( not ( = ?auto_144087 ?auto_144090 ) ) ( not ( = ?auto_144087 ?auto_144091 ) ) ( not ( = ?auto_144088 ?auto_144089 ) ) ( not ( = ?auto_144088 ?auto_144090 ) ) ( not ( = ?auto_144088 ?auto_144091 ) ) ( not ( = ?auto_144089 ?auto_144090 ) ) ( not ( = ?auto_144089 ?auto_144091 ) ) ( not ( = ?auto_144090 ?auto_144091 ) ) ( ON ?auto_144089 ?auto_144090 ) ( CLEAR ?auto_144087 ) ( ON ?auto_144088 ?auto_144089 ) ( CLEAR ?auto_144088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144084 ?auto_144085 ?auto_144086 ?auto_144087 ?auto_144088 )
      ( MAKE-7PILE ?auto_144084 ?auto_144085 ?auto_144086 ?auto_144087 ?auto_144088 ?auto_144089 ?auto_144090 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_144099 - BLOCK
      ?auto_144100 - BLOCK
      ?auto_144101 - BLOCK
      ?auto_144102 - BLOCK
      ?auto_144103 - BLOCK
      ?auto_144104 - BLOCK
      ?auto_144105 - BLOCK
    )
    :vars
    (
      ?auto_144106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144105 ?auto_144106 ) ( ON-TABLE ?auto_144099 ) ( ON ?auto_144100 ?auto_144099 ) ( ON ?auto_144101 ?auto_144100 ) ( not ( = ?auto_144099 ?auto_144100 ) ) ( not ( = ?auto_144099 ?auto_144101 ) ) ( not ( = ?auto_144099 ?auto_144102 ) ) ( not ( = ?auto_144099 ?auto_144103 ) ) ( not ( = ?auto_144099 ?auto_144104 ) ) ( not ( = ?auto_144099 ?auto_144105 ) ) ( not ( = ?auto_144099 ?auto_144106 ) ) ( not ( = ?auto_144100 ?auto_144101 ) ) ( not ( = ?auto_144100 ?auto_144102 ) ) ( not ( = ?auto_144100 ?auto_144103 ) ) ( not ( = ?auto_144100 ?auto_144104 ) ) ( not ( = ?auto_144100 ?auto_144105 ) ) ( not ( = ?auto_144100 ?auto_144106 ) ) ( not ( = ?auto_144101 ?auto_144102 ) ) ( not ( = ?auto_144101 ?auto_144103 ) ) ( not ( = ?auto_144101 ?auto_144104 ) ) ( not ( = ?auto_144101 ?auto_144105 ) ) ( not ( = ?auto_144101 ?auto_144106 ) ) ( not ( = ?auto_144102 ?auto_144103 ) ) ( not ( = ?auto_144102 ?auto_144104 ) ) ( not ( = ?auto_144102 ?auto_144105 ) ) ( not ( = ?auto_144102 ?auto_144106 ) ) ( not ( = ?auto_144103 ?auto_144104 ) ) ( not ( = ?auto_144103 ?auto_144105 ) ) ( not ( = ?auto_144103 ?auto_144106 ) ) ( not ( = ?auto_144104 ?auto_144105 ) ) ( not ( = ?auto_144104 ?auto_144106 ) ) ( not ( = ?auto_144105 ?auto_144106 ) ) ( ON ?auto_144104 ?auto_144105 ) ( ON ?auto_144103 ?auto_144104 ) ( CLEAR ?auto_144101 ) ( ON ?auto_144102 ?auto_144103 ) ( CLEAR ?auto_144102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144099 ?auto_144100 ?auto_144101 ?auto_144102 )
      ( MAKE-7PILE ?auto_144099 ?auto_144100 ?auto_144101 ?auto_144102 ?auto_144103 ?auto_144104 ?auto_144105 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_144114 - BLOCK
      ?auto_144115 - BLOCK
      ?auto_144116 - BLOCK
      ?auto_144117 - BLOCK
      ?auto_144118 - BLOCK
      ?auto_144119 - BLOCK
      ?auto_144120 - BLOCK
    )
    :vars
    (
      ?auto_144121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144120 ?auto_144121 ) ( ON-TABLE ?auto_144114 ) ( ON ?auto_144115 ?auto_144114 ) ( ON ?auto_144116 ?auto_144115 ) ( not ( = ?auto_144114 ?auto_144115 ) ) ( not ( = ?auto_144114 ?auto_144116 ) ) ( not ( = ?auto_144114 ?auto_144117 ) ) ( not ( = ?auto_144114 ?auto_144118 ) ) ( not ( = ?auto_144114 ?auto_144119 ) ) ( not ( = ?auto_144114 ?auto_144120 ) ) ( not ( = ?auto_144114 ?auto_144121 ) ) ( not ( = ?auto_144115 ?auto_144116 ) ) ( not ( = ?auto_144115 ?auto_144117 ) ) ( not ( = ?auto_144115 ?auto_144118 ) ) ( not ( = ?auto_144115 ?auto_144119 ) ) ( not ( = ?auto_144115 ?auto_144120 ) ) ( not ( = ?auto_144115 ?auto_144121 ) ) ( not ( = ?auto_144116 ?auto_144117 ) ) ( not ( = ?auto_144116 ?auto_144118 ) ) ( not ( = ?auto_144116 ?auto_144119 ) ) ( not ( = ?auto_144116 ?auto_144120 ) ) ( not ( = ?auto_144116 ?auto_144121 ) ) ( not ( = ?auto_144117 ?auto_144118 ) ) ( not ( = ?auto_144117 ?auto_144119 ) ) ( not ( = ?auto_144117 ?auto_144120 ) ) ( not ( = ?auto_144117 ?auto_144121 ) ) ( not ( = ?auto_144118 ?auto_144119 ) ) ( not ( = ?auto_144118 ?auto_144120 ) ) ( not ( = ?auto_144118 ?auto_144121 ) ) ( not ( = ?auto_144119 ?auto_144120 ) ) ( not ( = ?auto_144119 ?auto_144121 ) ) ( not ( = ?auto_144120 ?auto_144121 ) ) ( ON ?auto_144119 ?auto_144120 ) ( ON ?auto_144118 ?auto_144119 ) ( CLEAR ?auto_144116 ) ( ON ?auto_144117 ?auto_144118 ) ( CLEAR ?auto_144117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144114 ?auto_144115 ?auto_144116 ?auto_144117 )
      ( MAKE-7PILE ?auto_144114 ?auto_144115 ?auto_144116 ?auto_144117 ?auto_144118 ?auto_144119 ?auto_144120 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_144129 - BLOCK
      ?auto_144130 - BLOCK
      ?auto_144131 - BLOCK
      ?auto_144132 - BLOCK
      ?auto_144133 - BLOCK
      ?auto_144134 - BLOCK
      ?auto_144135 - BLOCK
    )
    :vars
    (
      ?auto_144136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144135 ?auto_144136 ) ( ON-TABLE ?auto_144129 ) ( ON ?auto_144130 ?auto_144129 ) ( not ( = ?auto_144129 ?auto_144130 ) ) ( not ( = ?auto_144129 ?auto_144131 ) ) ( not ( = ?auto_144129 ?auto_144132 ) ) ( not ( = ?auto_144129 ?auto_144133 ) ) ( not ( = ?auto_144129 ?auto_144134 ) ) ( not ( = ?auto_144129 ?auto_144135 ) ) ( not ( = ?auto_144129 ?auto_144136 ) ) ( not ( = ?auto_144130 ?auto_144131 ) ) ( not ( = ?auto_144130 ?auto_144132 ) ) ( not ( = ?auto_144130 ?auto_144133 ) ) ( not ( = ?auto_144130 ?auto_144134 ) ) ( not ( = ?auto_144130 ?auto_144135 ) ) ( not ( = ?auto_144130 ?auto_144136 ) ) ( not ( = ?auto_144131 ?auto_144132 ) ) ( not ( = ?auto_144131 ?auto_144133 ) ) ( not ( = ?auto_144131 ?auto_144134 ) ) ( not ( = ?auto_144131 ?auto_144135 ) ) ( not ( = ?auto_144131 ?auto_144136 ) ) ( not ( = ?auto_144132 ?auto_144133 ) ) ( not ( = ?auto_144132 ?auto_144134 ) ) ( not ( = ?auto_144132 ?auto_144135 ) ) ( not ( = ?auto_144132 ?auto_144136 ) ) ( not ( = ?auto_144133 ?auto_144134 ) ) ( not ( = ?auto_144133 ?auto_144135 ) ) ( not ( = ?auto_144133 ?auto_144136 ) ) ( not ( = ?auto_144134 ?auto_144135 ) ) ( not ( = ?auto_144134 ?auto_144136 ) ) ( not ( = ?auto_144135 ?auto_144136 ) ) ( ON ?auto_144134 ?auto_144135 ) ( ON ?auto_144133 ?auto_144134 ) ( ON ?auto_144132 ?auto_144133 ) ( CLEAR ?auto_144130 ) ( ON ?auto_144131 ?auto_144132 ) ( CLEAR ?auto_144131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144129 ?auto_144130 ?auto_144131 )
      ( MAKE-7PILE ?auto_144129 ?auto_144130 ?auto_144131 ?auto_144132 ?auto_144133 ?auto_144134 ?auto_144135 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_144144 - BLOCK
      ?auto_144145 - BLOCK
      ?auto_144146 - BLOCK
      ?auto_144147 - BLOCK
      ?auto_144148 - BLOCK
      ?auto_144149 - BLOCK
      ?auto_144150 - BLOCK
    )
    :vars
    (
      ?auto_144151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144150 ?auto_144151 ) ( ON-TABLE ?auto_144144 ) ( ON ?auto_144145 ?auto_144144 ) ( not ( = ?auto_144144 ?auto_144145 ) ) ( not ( = ?auto_144144 ?auto_144146 ) ) ( not ( = ?auto_144144 ?auto_144147 ) ) ( not ( = ?auto_144144 ?auto_144148 ) ) ( not ( = ?auto_144144 ?auto_144149 ) ) ( not ( = ?auto_144144 ?auto_144150 ) ) ( not ( = ?auto_144144 ?auto_144151 ) ) ( not ( = ?auto_144145 ?auto_144146 ) ) ( not ( = ?auto_144145 ?auto_144147 ) ) ( not ( = ?auto_144145 ?auto_144148 ) ) ( not ( = ?auto_144145 ?auto_144149 ) ) ( not ( = ?auto_144145 ?auto_144150 ) ) ( not ( = ?auto_144145 ?auto_144151 ) ) ( not ( = ?auto_144146 ?auto_144147 ) ) ( not ( = ?auto_144146 ?auto_144148 ) ) ( not ( = ?auto_144146 ?auto_144149 ) ) ( not ( = ?auto_144146 ?auto_144150 ) ) ( not ( = ?auto_144146 ?auto_144151 ) ) ( not ( = ?auto_144147 ?auto_144148 ) ) ( not ( = ?auto_144147 ?auto_144149 ) ) ( not ( = ?auto_144147 ?auto_144150 ) ) ( not ( = ?auto_144147 ?auto_144151 ) ) ( not ( = ?auto_144148 ?auto_144149 ) ) ( not ( = ?auto_144148 ?auto_144150 ) ) ( not ( = ?auto_144148 ?auto_144151 ) ) ( not ( = ?auto_144149 ?auto_144150 ) ) ( not ( = ?auto_144149 ?auto_144151 ) ) ( not ( = ?auto_144150 ?auto_144151 ) ) ( ON ?auto_144149 ?auto_144150 ) ( ON ?auto_144148 ?auto_144149 ) ( ON ?auto_144147 ?auto_144148 ) ( CLEAR ?auto_144145 ) ( ON ?auto_144146 ?auto_144147 ) ( CLEAR ?auto_144146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144144 ?auto_144145 ?auto_144146 )
      ( MAKE-7PILE ?auto_144144 ?auto_144145 ?auto_144146 ?auto_144147 ?auto_144148 ?auto_144149 ?auto_144150 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_144159 - BLOCK
      ?auto_144160 - BLOCK
      ?auto_144161 - BLOCK
      ?auto_144162 - BLOCK
      ?auto_144163 - BLOCK
      ?auto_144164 - BLOCK
      ?auto_144165 - BLOCK
    )
    :vars
    (
      ?auto_144166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144165 ?auto_144166 ) ( ON-TABLE ?auto_144159 ) ( not ( = ?auto_144159 ?auto_144160 ) ) ( not ( = ?auto_144159 ?auto_144161 ) ) ( not ( = ?auto_144159 ?auto_144162 ) ) ( not ( = ?auto_144159 ?auto_144163 ) ) ( not ( = ?auto_144159 ?auto_144164 ) ) ( not ( = ?auto_144159 ?auto_144165 ) ) ( not ( = ?auto_144159 ?auto_144166 ) ) ( not ( = ?auto_144160 ?auto_144161 ) ) ( not ( = ?auto_144160 ?auto_144162 ) ) ( not ( = ?auto_144160 ?auto_144163 ) ) ( not ( = ?auto_144160 ?auto_144164 ) ) ( not ( = ?auto_144160 ?auto_144165 ) ) ( not ( = ?auto_144160 ?auto_144166 ) ) ( not ( = ?auto_144161 ?auto_144162 ) ) ( not ( = ?auto_144161 ?auto_144163 ) ) ( not ( = ?auto_144161 ?auto_144164 ) ) ( not ( = ?auto_144161 ?auto_144165 ) ) ( not ( = ?auto_144161 ?auto_144166 ) ) ( not ( = ?auto_144162 ?auto_144163 ) ) ( not ( = ?auto_144162 ?auto_144164 ) ) ( not ( = ?auto_144162 ?auto_144165 ) ) ( not ( = ?auto_144162 ?auto_144166 ) ) ( not ( = ?auto_144163 ?auto_144164 ) ) ( not ( = ?auto_144163 ?auto_144165 ) ) ( not ( = ?auto_144163 ?auto_144166 ) ) ( not ( = ?auto_144164 ?auto_144165 ) ) ( not ( = ?auto_144164 ?auto_144166 ) ) ( not ( = ?auto_144165 ?auto_144166 ) ) ( ON ?auto_144164 ?auto_144165 ) ( ON ?auto_144163 ?auto_144164 ) ( ON ?auto_144162 ?auto_144163 ) ( ON ?auto_144161 ?auto_144162 ) ( CLEAR ?auto_144159 ) ( ON ?auto_144160 ?auto_144161 ) ( CLEAR ?auto_144160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144159 ?auto_144160 )
      ( MAKE-7PILE ?auto_144159 ?auto_144160 ?auto_144161 ?auto_144162 ?auto_144163 ?auto_144164 ?auto_144165 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_144174 - BLOCK
      ?auto_144175 - BLOCK
      ?auto_144176 - BLOCK
      ?auto_144177 - BLOCK
      ?auto_144178 - BLOCK
      ?auto_144179 - BLOCK
      ?auto_144180 - BLOCK
    )
    :vars
    (
      ?auto_144181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144180 ?auto_144181 ) ( ON-TABLE ?auto_144174 ) ( not ( = ?auto_144174 ?auto_144175 ) ) ( not ( = ?auto_144174 ?auto_144176 ) ) ( not ( = ?auto_144174 ?auto_144177 ) ) ( not ( = ?auto_144174 ?auto_144178 ) ) ( not ( = ?auto_144174 ?auto_144179 ) ) ( not ( = ?auto_144174 ?auto_144180 ) ) ( not ( = ?auto_144174 ?auto_144181 ) ) ( not ( = ?auto_144175 ?auto_144176 ) ) ( not ( = ?auto_144175 ?auto_144177 ) ) ( not ( = ?auto_144175 ?auto_144178 ) ) ( not ( = ?auto_144175 ?auto_144179 ) ) ( not ( = ?auto_144175 ?auto_144180 ) ) ( not ( = ?auto_144175 ?auto_144181 ) ) ( not ( = ?auto_144176 ?auto_144177 ) ) ( not ( = ?auto_144176 ?auto_144178 ) ) ( not ( = ?auto_144176 ?auto_144179 ) ) ( not ( = ?auto_144176 ?auto_144180 ) ) ( not ( = ?auto_144176 ?auto_144181 ) ) ( not ( = ?auto_144177 ?auto_144178 ) ) ( not ( = ?auto_144177 ?auto_144179 ) ) ( not ( = ?auto_144177 ?auto_144180 ) ) ( not ( = ?auto_144177 ?auto_144181 ) ) ( not ( = ?auto_144178 ?auto_144179 ) ) ( not ( = ?auto_144178 ?auto_144180 ) ) ( not ( = ?auto_144178 ?auto_144181 ) ) ( not ( = ?auto_144179 ?auto_144180 ) ) ( not ( = ?auto_144179 ?auto_144181 ) ) ( not ( = ?auto_144180 ?auto_144181 ) ) ( ON ?auto_144179 ?auto_144180 ) ( ON ?auto_144178 ?auto_144179 ) ( ON ?auto_144177 ?auto_144178 ) ( ON ?auto_144176 ?auto_144177 ) ( CLEAR ?auto_144174 ) ( ON ?auto_144175 ?auto_144176 ) ( CLEAR ?auto_144175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144174 ?auto_144175 )
      ( MAKE-7PILE ?auto_144174 ?auto_144175 ?auto_144176 ?auto_144177 ?auto_144178 ?auto_144179 ?auto_144180 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_144189 - BLOCK
      ?auto_144190 - BLOCK
      ?auto_144191 - BLOCK
      ?auto_144192 - BLOCK
      ?auto_144193 - BLOCK
      ?auto_144194 - BLOCK
      ?auto_144195 - BLOCK
    )
    :vars
    (
      ?auto_144196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144195 ?auto_144196 ) ( not ( = ?auto_144189 ?auto_144190 ) ) ( not ( = ?auto_144189 ?auto_144191 ) ) ( not ( = ?auto_144189 ?auto_144192 ) ) ( not ( = ?auto_144189 ?auto_144193 ) ) ( not ( = ?auto_144189 ?auto_144194 ) ) ( not ( = ?auto_144189 ?auto_144195 ) ) ( not ( = ?auto_144189 ?auto_144196 ) ) ( not ( = ?auto_144190 ?auto_144191 ) ) ( not ( = ?auto_144190 ?auto_144192 ) ) ( not ( = ?auto_144190 ?auto_144193 ) ) ( not ( = ?auto_144190 ?auto_144194 ) ) ( not ( = ?auto_144190 ?auto_144195 ) ) ( not ( = ?auto_144190 ?auto_144196 ) ) ( not ( = ?auto_144191 ?auto_144192 ) ) ( not ( = ?auto_144191 ?auto_144193 ) ) ( not ( = ?auto_144191 ?auto_144194 ) ) ( not ( = ?auto_144191 ?auto_144195 ) ) ( not ( = ?auto_144191 ?auto_144196 ) ) ( not ( = ?auto_144192 ?auto_144193 ) ) ( not ( = ?auto_144192 ?auto_144194 ) ) ( not ( = ?auto_144192 ?auto_144195 ) ) ( not ( = ?auto_144192 ?auto_144196 ) ) ( not ( = ?auto_144193 ?auto_144194 ) ) ( not ( = ?auto_144193 ?auto_144195 ) ) ( not ( = ?auto_144193 ?auto_144196 ) ) ( not ( = ?auto_144194 ?auto_144195 ) ) ( not ( = ?auto_144194 ?auto_144196 ) ) ( not ( = ?auto_144195 ?auto_144196 ) ) ( ON ?auto_144194 ?auto_144195 ) ( ON ?auto_144193 ?auto_144194 ) ( ON ?auto_144192 ?auto_144193 ) ( ON ?auto_144191 ?auto_144192 ) ( ON ?auto_144190 ?auto_144191 ) ( ON ?auto_144189 ?auto_144190 ) ( CLEAR ?auto_144189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_144189 )
      ( MAKE-7PILE ?auto_144189 ?auto_144190 ?auto_144191 ?auto_144192 ?auto_144193 ?auto_144194 ?auto_144195 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_144204 - BLOCK
      ?auto_144205 - BLOCK
      ?auto_144206 - BLOCK
      ?auto_144207 - BLOCK
      ?auto_144208 - BLOCK
      ?auto_144209 - BLOCK
      ?auto_144210 - BLOCK
    )
    :vars
    (
      ?auto_144211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144210 ?auto_144211 ) ( not ( = ?auto_144204 ?auto_144205 ) ) ( not ( = ?auto_144204 ?auto_144206 ) ) ( not ( = ?auto_144204 ?auto_144207 ) ) ( not ( = ?auto_144204 ?auto_144208 ) ) ( not ( = ?auto_144204 ?auto_144209 ) ) ( not ( = ?auto_144204 ?auto_144210 ) ) ( not ( = ?auto_144204 ?auto_144211 ) ) ( not ( = ?auto_144205 ?auto_144206 ) ) ( not ( = ?auto_144205 ?auto_144207 ) ) ( not ( = ?auto_144205 ?auto_144208 ) ) ( not ( = ?auto_144205 ?auto_144209 ) ) ( not ( = ?auto_144205 ?auto_144210 ) ) ( not ( = ?auto_144205 ?auto_144211 ) ) ( not ( = ?auto_144206 ?auto_144207 ) ) ( not ( = ?auto_144206 ?auto_144208 ) ) ( not ( = ?auto_144206 ?auto_144209 ) ) ( not ( = ?auto_144206 ?auto_144210 ) ) ( not ( = ?auto_144206 ?auto_144211 ) ) ( not ( = ?auto_144207 ?auto_144208 ) ) ( not ( = ?auto_144207 ?auto_144209 ) ) ( not ( = ?auto_144207 ?auto_144210 ) ) ( not ( = ?auto_144207 ?auto_144211 ) ) ( not ( = ?auto_144208 ?auto_144209 ) ) ( not ( = ?auto_144208 ?auto_144210 ) ) ( not ( = ?auto_144208 ?auto_144211 ) ) ( not ( = ?auto_144209 ?auto_144210 ) ) ( not ( = ?auto_144209 ?auto_144211 ) ) ( not ( = ?auto_144210 ?auto_144211 ) ) ( ON ?auto_144209 ?auto_144210 ) ( ON ?auto_144208 ?auto_144209 ) ( ON ?auto_144207 ?auto_144208 ) ( ON ?auto_144206 ?auto_144207 ) ( ON ?auto_144205 ?auto_144206 ) ( ON ?auto_144204 ?auto_144205 ) ( CLEAR ?auto_144204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_144204 )
      ( MAKE-7PILE ?auto_144204 ?auto_144205 ?auto_144206 ?auto_144207 ?auto_144208 ?auto_144209 ?auto_144210 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144220 - BLOCK
      ?auto_144221 - BLOCK
      ?auto_144222 - BLOCK
      ?auto_144223 - BLOCK
      ?auto_144224 - BLOCK
      ?auto_144225 - BLOCK
      ?auto_144226 - BLOCK
      ?auto_144227 - BLOCK
    )
    :vars
    (
      ?auto_144228 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_144226 ) ( ON ?auto_144227 ?auto_144228 ) ( CLEAR ?auto_144227 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_144220 ) ( ON ?auto_144221 ?auto_144220 ) ( ON ?auto_144222 ?auto_144221 ) ( ON ?auto_144223 ?auto_144222 ) ( ON ?auto_144224 ?auto_144223 ) ( ON ?auto_144225 ?auto_144224 ) ( ON ?auto_144226 ?auto_144225 ) ( not ( = ?auto_144220 ?auto_144221 ) ) ( not ( = ?auto_144220 ?auto_144222 ) ) ( not ( = ?auto_144220 ?auto_144223 ) ) ( not ( = ?auto_144220 ?auto_144224 ) ) ( not ( = ?auto_144220 ?auto_144225 ) ) ( not ( = ?auto_144220 ?auto_144226 ) ) ( not ( = ?auto_144220 ?auto_144227 ) ) ( not ( = ?auto_144220 ?auto_144228 ) ) ( not ( = ?auto_144221 ?auto_144222 ) ) ( not ( = ?auto_144221 ?auto_144223 ) ) ( not ( = ?auto_144221 ?auto_144224 ) ) ( not ( = ?auto_144221 ?auto_144225 ) ) ( not ( = ?auto_144221 ?auto_144226 ) ) ( not ( = ?auto_144221 ?auto_144227 ) ) ( not ( = ?auto_144221 ?auto_144228 ) ) ( not ( = ?auto_144222 ?auto_144223 ) ) ( not ( = ?auto_144222 ?auto_144224 ) ) ( not ( = ?auto_144222 ?auto_144225 ) ) ( not ( = ?auto_144222 ?auto_144226 ) ) ( not ( = ?auto_144222 ?auto_144227 ) ) ( not ( = ?auto_144222 ?auto_144228 ) ) ( not ( = ?auto_144223 ?auto_144224 ) ) ( not ( = ?auto_144223 ?auto_144225 ) ) ( not ( = ?auto_144223 ?auto_144226 ) ) ( not ( = ?auto_144223 ?auto_144227 ) ) ( not ( = ?auto_144223 ?auto_144228 ) ) ( not ( = ?auto_144224 ?auto_144225 ) ) ( not ( = ?auto_144224 ?auto_144226 ) ) ( not ( = ?auto_144224 ?auto_144227 ) ) ( not ( = ?auto_144224 ?auto_144228 ) ) ( not ( = ?auto_144225 ?auto_144226 ) ) ( not ( = ?auto_144225 ?auto_144227 ) ) ( not ( = ?auto_144225 ?auto_144228 ) ) ( not ( = ?auto_144226 ?auto_144227 ) ) ( not ( = ?auto_144226 ?auto_144228 ) ) ( not ( = ?auto_144227 ?auto_144228 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_144227 ?auto_144228 )
      ( !STACK ?auto_144227 ?auto_144226 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144237 - BLOCK
      ?auto_144238 - BLOCK
      ?auto_144239 - BLOCK
      ?auto_144240 - BLOCK
      ?auto_144241 - BLOCK
      ?auto_144242 - BLOCK
      ?auto_144243 - BLOCK
      ?auto_144244 - BLOCK
    )
    :vars
    (
      ?auto_144245 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_144243 ) ( ON ?auto_144244 ?auto_144245 ) ( CLEAR ?auto_144244 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_144237 ) ( ON ?auto_144238 ?auto_144237 ) ( ON ?auto_144239 ?auto_144238 ) ( ON ?auto_144240 ?auto_144239 ) ( ON ?auto_144241 ?auto_144240 ) ( ON ?auto_144242 ?auto_144241 ) ( ON ?auto_144243 ?auto_144242 ) ( not ( = ?auto_144237 ?auto_144238 ) ) ( not ( = ?auto_144237 ?auto_144239 ) ) ( not ( = ?auto_144237 ?auto_144240 ) ) ( not ( = ?auto_144237 ?auto_144241 ) ) ( not ( = ?auto_144237 ?auto_144242 ) ) ( not ( = ?auto_144237 ?auto_144243 ) ) ( not ( = ?auto_144237 ?auto_144244 ) ) ( not ( = ?auto_144237 ?auto_144245 ) ) ( not ( = ?auto_144238 ?auto_144239 ) ) ( not ( = ?auto_144238 ?auto_144240 ) ) ( not ( = ?auto_144238 ?auto_144241 ) ) ( not ( = ?auto_144238 ?auto_144242 ) ) ( not ( = ?auto_144238 ?auto_144243 ) ) ( not ( = ?auto_144238 ?auto_144244 ) ) ( not ( = ?auto_144238 ?auto_144245 ) ) ( not ( = ?auto_144239 ?auto_144240 ) ) ( not ( = ?auto_144239 ?auto_144241 ) ) ( not ( = ?auto_144239 ?auto_144242 ) ) ( not ( = ?auto_144239 ?auto_144243 ) ) ( not ( = ?auto_144239 ?auto_144244 ) ) ( not ( = ?auto_144239 ?auto_144245 ) ) ( not ( = ?auto_144240 ?auto_144241 ) ) ( not ( = ?auto_144240 ?auto_144242 ) ) ( not ( = ?auto_144240 ?auto_144243 ) ) ( not ( = ?auto_144240 ?auto_144244 ) ) ( not ( = ?auto_144240 ?auto_144245 ) ) ( not ( = ?auto_144241 ?auto_144242 ) ) ( not ( = ?auto_144241 ?auto_144243 ) ) ( not ( = ?auto_144241 ?auto_144244 ) ) ( not ( = ?auto_144241 ?auto_144245 ) ) ( not ( = ?auto_144242 ?auto_144243 ) ) ( not ( = ?auto_144242 ?auto_144244 ) ) ( not ( = ?auto_144242 ?auto_144245 ) ) ( not ( = ?auto_144243 ?auto_144244 ) ) ( not ( = ?auto_144243 ?auto_144245 ) ) ( not ( = ?auto_144244 ?auto_144245 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_144244 ?auto_144245 )
      ( !STACK ?auto_144244 ?auto_144243 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144254 - BLOCK
      ?auto_144255 - BLOCK
      ?auto_144256 - BLOCK
      ?auto_144257 - BLOCK
      ?auto_144258 - BLOCK
      ?auto_144259 - BLOCK
      ?auto_144260 - BLOCK
      ?auto_144261 - BLOCK
    )
    :vars
    (
      ?auto_144262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144261 ?auto_144262 ) ( ON-TABLE ?auto_144254 ) ( ON ?auto_144255 ?auto_144254 ) ( ON ?auto_144256 ?auto_144255 ) ( ON ?auto_144257 ?auto_144256 ) ( ON ?auto_144258 ?auto_144257 ) ( ON ?auto_144259 ?auto_144258 ) ( not ( = ?auto_144254 ?auto_144255 ) ) ( not ( = ?auto_144254 ?auto_144256 ) ) ( not ( = ?auto_144254 ?auto_144257 ) ) ( not ( = ?auto_144254 ?auto_144258 ) ) ( not ( = ?auto_144254 ?auto_144259 ) ) ( not ( = ?auto_144254 ?auto_144260 ) ) ( not ( = ?auto_144254 ?auto_144261 ) ) ( not ( = ?auto_144254 ?auto_144262 ) ) ( not ( = ?auto_144255 ?auto_144256 ) ) ( not ( = ?auto_144255 ?auto_144257 ) ) ( not ( = ?auto_144255 ?auto_144258 ) ) ( not ( = ?auto_144255 ?auto_144259 ) ) ( not ( = ?auto_144255 ?auto_144260 ) ) ( not ( = ?auto_144255 ?auto_144261 ) ) ( not ( = ?auto_144255 ?auto_144262 ) ) ( not ( = ?auto_144256 ?auto_144257 ) ) ( not ( = ?auto_144256 ?auto_144258 ) ) ( not ( = ?auto_144256 ?auto_144259 ) ) ( not ( = ?auto_144256 ?auto_144260 ) ) ( not ( = ?auto_144256 ?auto_144261 ) ) ( not ( = ?auto_144256 ?auto_144262 ) ) ( not ( = ?auto_144257 ?auto_144258 ) ) ( not ( = ?auto_144257 ?auto_144259 ) ) ( not ( = ?auto_144257 ?auto_144260 ) ) ( not ( = ?auto_144257 ?auto_144261 ) ) ( not ( = ?auto_144257 ?auto_144262 ) ) ( not ( = ?auto_144258 ?auto_144259 ) ) ( not ( = ?auto_144258 ?auto_144260 ) ) ( not ( = ?auto_144258 ?auto_144261 ) ) ( not ( = ?auto_144258 ?auto_144262 ) ) ( not ( = ?auto_144259 ?auto_144260 ) ) ( not ( = ?auto_144259 ?auto_144261 ) ) ( not ( = ?auto_144259 ?auto_144262 ) ) ( not ( = ?auto_144260 ?auto_144261 ) ) ( not ( = ?auto_144260 ?auto_144262 ) ) ( not ( = ?auto_144261 ?auto_144262 ) ) ( CLEAR ?auto_144259 ) ( ON ?auto_144260 ?auto_144261 ) ( CLEAR ?auto_144260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144254 ?auto_144255 ?auto_144256 ?auto_144257 ?auto_144258 ?auto_144259 ?auto_144260 )
      ( MAKE-8PILE ?auto_144254 ?auto_144255 ?auto_144256 ?auto_144257 ?auto_144258 ?auto_144259 ?auto_144260 ?auto_144261 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144271 - BLOCK
      ?auto_144272 - BLOCK
      ?auto_144273 - BLOCK
      ?auto_144274 - BLOCK
      ?auto_144275 - BLOCK
      ?auto_144276 - BLOCK
      ?auto_144277 - BLOCK
      ?auto_144278 - BLOCK
    )
    :vars
    (
      ?auto_144279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144278 ?auto_144279 ) ( ON-TABLE ?auto_144271 ) ( ON ?auto_144272 ?auto_144271 ) ( ON ?auto_144273 ?auto_144272 ) ( ON ?auto_144274 ?auto_144273 ) ( ON ?auto_144275 ?auto_144274 ) ( ON ?auto_144276 ?auto_144275 ) ( not ( = ?auto_144271 ?auto_144272 ) ) ( not ( = ?auto_144271 ?auto_144273 ) ) ( not ( = ?auto_144271 ?auto_144274 ) ) ( not ( = ?auto_144271 ?auto_144275 ) ) ( not ( = ?auto_144271 ?auto_144276 ) ) ( not ( = ?auto_144271 ?auto_144277 ) ) ( not ( = ?auto_144271 ?auto_144278 ) ) ( not ( = ?auto_144271 ?auto_144279 ) ) ( not ( = ?auto_144272 ?auto_144273 ) ) ( not ( = ?auto_144272 ?auto_144274 ) ) ( not ( = ?auto_144272 ?auto_144275 ) ) ( not ( = ?auto_144272 ?auto_144276 ) ) ( not ( = ?auto_144272 ?auto_144277 ) ) ( not ( = ?auto_144272 ?auto_144278 ) ) ( not ( = ?auto_144272 ?auto_144279 ) ) ( not ( = ?auto_144273 ?auto_144274 ) ) ( not ( = ?auto_144273 ?auto_144275 ) ) ( not ( = ?auto_144273 ?auto_144276 ) ) ( not ( = ?auto_144273 ?auto_144277 ) ) ( not ( = ?auto_144273 ?auto_144278 ) ) ( not ( = ?auto_144273 ?auto_144279 ) ) ( not ( = ?auto_144274 ?auto_144275 ) ) ( not ( = ?auto_144274 ?auto_144276 ) ) ( not ( = ?auto_144274 ?auto_144277 ) ) ( not ( = ?auto_144274 ?auto_144278 ) ) ( not ( = ?auto_144274 ?auto_144279 ) ) ( not ( = ?auto_144275 ?auto_144276 ) ) ( not ( = ?auto_144275 ?auto_144277 ) ) ( not ( = ?auto_144275 ?auto_144278 ) ) ( not ( = ?auto_144275 ?auto_144279 ) ) ( not ( = ?auto_144276 ?auto_144277 ) ) ( not ( = ?auto_144276 ?auto_144278 ) ) ( not ( = ?auto_144276 ?auto_144279 ) ) ( not ( = ?auto_144277 ?auto_144278 ) ) ( not ( = ?auto_144277 ?auto_144279 ) ) ( not ( = ?auto_144278 ?auto_144279 ) ) ( CLEAR ?auto_144276 ) ( ON ?auto_144277 ?auto_144278 ) ( CLEAR ?auto_144277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144271 ?auto_144272 ?auto_144273 ?auto_144274 ?auto_144275 ?auto_144276 ?auto_144277 )
      ( MAKE-8PILE ?auto_144271 ?auto_144272 ?auto_144273 ?auto_144274 ?auto_144275 ?auto_144276 ?auto_144277 ?auto_144278 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144288 - BLOCK
      ?auto_144289 - BLOCK
      ?auto_144290 - BLOCK
      ?auto_144291 - BLOCK
      ?auto_144292 - BLOCK
      ?auto_144293 - BLOCK
      ?auto_144294 - BLOCK
      ?auto_144295 - BLOCK
    )
    :vars
    (
      ?auto_144296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144295 ?auto_144296 ) ( ON-TABLE ?auto_144288 ) ( ON ?auto_144289 ?auto_144288 ) ( ON ?auto_144290 ?auto_144289 ) ( ON ?auto_144291 ?auto_144290 ) ( ON ?auto_144292 ?auto_144291 ) ( not ( = ?auto_144288 ?auto_144289 ) ) ( not ( = ?auto_144288 ?auto_144290 ) ) ( not ( = ?auto_144288 ?auto_144291 ) ) ( not ( = ?auto_144288 ?auto_144292 ) ) ( not ( = ?auto_144288 ?auto_144293 ) ) ( not ( = ?auto_144288 ?auto_144294 ) ) ( not ( = ?auto_144288 ?auto_144295 ) ) ( not ( = ?auto_144288 ?auto_144296 ) ) ( not ( = ?auto_144289 ?auto_144290 ) ) ( not ( = ?auto_144289 ?auto_144291 ) ) ( not ( = ?auto_144289 ?auto_144292 ) ) ( not ( = ?auto_144289 ?auto_144293 ) ) ( not ( = ?auto_144289 ?auto_144294 ) ) ( not ( = ?auto_144289 ?auto_144295 ) ) ( not ( = ?auto_144289 ?auto_144296 ) ) ( not ( = ?auto_144290 ?auto_144291 ) ) ( not ( = ?auto_144290 ?auto_144292 ) ) ( not ( = ?auto_144290 ?auto_144293 ) ) ( not ( = ?auto_144290 ?auto_144294 ) ) ( not ( = ?auto_144290 ?auto_144295 ) ) ( not ( = ?auto_144290 ?auto_144296 ) ) ( not ( = ?auto_144291 ?auto_144292 ) ) ( not ( = ?auto_144291 ?auto_144293 ) ) ( not ( = ?auto_144291 ?auto_144294 ) ) ( not ( = ?auto_144291 ?auto_144295 ) ) ( not ( = ?auto_144291 ?auto_144296 ) ) ( not ( = ?auto_144292 ?auto_144293 ) ) ( not ( = ?auto_144292 ?auto_144294 ) ) ( not ( = ?auto_144292 ?auto_144295 ) ) ( not ( = ?auto_144292 ?auto_144296 ) ) ( not ( = ?auto_144293 ?auto_144294 ) ) ( not ( = ?auto_144293 ?auto_144295 ) ) ( not ( = ?auto_144293 ?auto_144296 ) ) ( not ( = ?auto_144294 ?auto_144295 ) ) ( not ( = ?auto_144294 ?auto_144296 ) ) ( not ( = ?auto_144295 ?auto_144296 ) ) ( ON ?auto_144294 ?auto_144295 ) ( CLEAR ?auto_144292 ) ( ON ?auto_144293 ?auto_144294 ) ( CLEAR ?auto_144293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144288 ?auto_144289 ?auto_144290 ?auto_144291 ?auto_144292 ?auto_144293 )
      ( MAKE-8PILE ?auto_144288 ?auto_144289 ?auto_144290 ?auto_144291 ?auto_144292 ?auto_144293 ?auto_144294 ?auto_144295 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144305 - BLOCK
      ?auto_144306 - BLOCK
      ?auto_144307 - BLOCK
      ?auto_144308 - BLOCK
      ?auto_144309 - BLOCK
      ?auto_144310 - BLOCK
      ?auto_144311 - BLOCK
      ?auto_144312 - BLOCK
    )
    :vars
    (
      ?auto_144313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144312 ?auto_144313 ) ( ON-TABLE ?auto_144305 ) ( ON ?auto_144306 ?auto_144305 ) ( ON ?auto_144307 ?auto_144306 ) ( ON ?auto_144308 ?auto_144307 ) ( ON ?auto_144309 ?auto_144308 ) ( not ( = ?auto_144305 ?auto_144306 ) ) ( not ( = ?auto_144305 ?auto_144307 ) ) ( not ( = ?auto_144305 ?auto_144308 ) ) ( not ( = ?auto_144305 ?auto_144309 ) ) ( not ( = ?auto_144305 ?auto_144310 ) ) ( not ( = ?auto_144305 ?auto_144311 ) ) ( not ( = ?auto_144305 ?auto_144312 ) ) ( not ( = ?auto_144305 ?auto_144313 ) ) ( not ( = ?auto_144306 ?auto_144307 ) ) ( not ( = ?auto_144306 ?auto_144308 ) ) ( not ( = ?auto_144306 ?auto_144309 ) ) ( not ( = ?auto_144306 ?auto_144310 ) ) ( not ( = ?auto_144306 ?auto_144311 ) ) ( not ( = ?auto_144306 ?auto_144312 ) ) ( not ( = ?auto_144306 ?auto_144313 ) ) ( not ( = ?auto_144307 ?auto_144308 ) ) ( not ( = ?auto_144307 ?auto_144309 ) ) ( not ( = ?auto_144307 ?auto_144310 ) ) ( not ( = ?auto_144307 ?auto_144311 ) ) ( not ( = ?auto_144307 ?auto_144312 ) ) ( not ( = ?auto_144307 ?auto_144313 ) ) ( not ( = ?auto_144308 ?auto_144309 ) ) ( not ( = ?auto_144308 ?auto_144310 ) ) ( not ( = ?auto_144308 ?auto_144311 ) ) ( not ( = ?auto_144308 ?auto_144312 ) ) ( not ( = ?auto_144308 ?auto_144313 ) ) ( not ( = ?auto_144309 ?auto_144310 ) ) ( not ( = ?auto_144309 ?auto_144311 ) ) ( not ( = ?auto_144309 ?auto_144312 ) ) ( not ( = ?auto_144309 ?auto_144313 ) ) ( not ( = ?auto_144310 ?auto_144311 ) ) ( not ( = ?auto_144310 ?auto_144312 ) ) ( not ( = ?auto_144310 ?auto_144313 ) ) ( not ( = ?auto_144311 ?auto_144312 ) ) ( not ( = ?auto_144311 ?auto_144313 ) ) ( not ( = ?auto_144312 ?auto_144313 ) ) ( ON ?auto_144311 ?auto_144312 ) ( CLEAR ?auto_144309 ) ( ON ?auto_144310 ?auto_144311 ) ( CLEAR ?auto_144310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144305 ?auto_144306 ?auto_144307 ?auto_144308 ?auto_144309 ?auto_144310 )
      ( MAKE-8PILE ?auto_144305 ?auto_144306 ?auto_144307 ?auto_144308 ?auto_144309 ?auto_144310 ?auto_144311 ?auto_144312 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144322 - BLOCK
      ?auto_144323 - BLOCK
      ?auto_144324 - BLOCK
      ?auto_144325 - BLOCK
      ?auto_144326 - BLOCK
      ?auto_144327 - BLOCK
      ?auto_144328 - BLOCK
      ?auto_144329 - BLOCK
    )
    :vars
    (
      ?auto_144330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144329 ?auto_144330 ) ( ON-TABLE ?auto_144322 ) ( ON ?auto_144323 ?auto_144322 ) ( ON ?auto_144324 ?auto_144323 ) ( ON ?auto_144325 ?auto_144324 ) ( not ( = ?auto_144322 ?auto_144323 ) ) ( not ( = ?auto_144322 ?auto_144324 ) ) ( not ( = ?auto_144322 ?auto_144325 ) ) ( not ( = ?auto_144322 ?auto_144326 ) ) ( not ( = ?auto_144322 ?auto_144327 ) ) ( not ( = ?auto_144322 ?auto_144328 ) ) ( not ( = ?auto_144322 ?auto_144329 ) ) ( not ( = ?auto_144322 ?auto_144330 ) ) ( not ( = ?auto_144323 ?auto_144324 ) ) ( not ( = ?auto_144323 ?auto_144325 ) ) ( not ( = ?auto_144323 ?auto_144326 ) ) ( not ( = ?auto_144323 ?auto_144327 ) ) ( not ( = ?auto_144323 ?auto_144328 ) ) ( not ( = ?auto_144323 ?auto_144329 ) ) ( not ( = ?auto_144323 ?auto_144330 ) ) ( not ( = ?auto_144324 ?auto_144325 ) ) ( not ( = ?auto_144324 ?auto_144326 ) ) ( not ( = ?auto_144324 ?auto_144327 ) ) ( not ( = ?auto_144324 ?auto_144328 ) ) ( not ( = ?auto_144324 ?auto_144329 ) ) ( not ( = ?auto_144324 ?auto_144330 ) ) ( not ( = ?auto_144325 ?auto_144326 ) ) ( not ( = ?auto_144325 ?auto_144327 ) ) ( not ( = ?auto_144325 ?auto_144328 ) ) ( not ( = ?auto_144325 ?auto_144329 ) ) ( not ( = ?auto_144325 ?auto_144330 ) ) ( not ( = ?auto_144326 ?auto_144327 ) ) ( not ( = ?auto_144326 ?auto_144328 ) ) ( not ( = ?auto_144326 ?auto_144329 ) ) ( not ( = ?auto_144326 ?auto_144330 ) ) ( not ( = ?auto_144327 ?auto_144328 ) ) ( not ( = ?auto_144327 ?auto_144329 ) ) ( not ( = ?auto_144327 ?auto_144330 ) ) ( not ( = ?auto_144328 ?auto_144329 ) ) ( not ( = ?auto_144328 ?auto_144330 ) ) ( not ( = ?auto_144329 ?auto_144330 ) ) ( ON ?auto_144328 ?auto_144329 ) ( ON ?auto_144327 ?auto_144328 ) ( CLEAR ?auto_144325 ) ( ON ?auto_144326 ?auto_144327 ) ( CLEAR ?auto_144326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144322 ?auto_144323 ?auto_144324 ?auto_144325 ?auto_144326 )
      ( MAKE-8PILE ?auto_144322 ?auto_144323 ?auto_144324 ?auto_144325 ?auto_144326 ?auto_144327 ?auto_144328 ?auto_144329 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144339 - BLOCK
      ?auto_144340 - BLOCK
      ?auto_144341 - BLOCK
      ?auto_144342 - BLOCK
      ?auto_144343 - BLOCK
      ?auto_144344 - BLOCK
      ?auto_144345 - BLOCK
      ?auto_144346 - BLOCK
    )
    :vars
    (
      ?auto_144347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144346 ?auto_144347 ) ( ON-TABLE ?auto_144339 ) ( ON ?auto_144340 ?auto_144339 ) ( ON ?auto_144341 ?auto_144340 ) ( ON ?auto_144342 ?auto_144341 ) ( not ( = ?auto_144339 ?auto_144340 ) ) ( not ( = ?auto_144339 ?auto_144341 ) ) ( not ( = ?auto_144339 ?auto_144342 ) ) ( not ( = ?auto_144339 ?auto_144343 ) ) ( not ( = ?auto_144339 ?auto_144344 ) ) ( not ( = ?auto_144339 ?auto_144345 ) ) ( not ( = ?auto_144339 ?auto_144346 ) ) ( not ( = ?auto_144339 ?auto_144347 ) ) ( not ( = ?auto_144340 ?auto_144341 ) ) ( not ( = ?auto_144340 ?auto_144342 ) ) ( not ( = ?auto_144340 ?auto_144343 ) ) ( not ( = ?auto_144340 ?auto_144344 ) ) ( not ( = ?auto_144340 ?auto_144345 ) ) ( not ( = ?auto_144340 ?auto_144346 ) ) ( not ( = ?auto_144340 ?auto_144347 ) ) ( not ( = ?auto_144341 ?auto_144342 ) ) ( not ( = ?auto_144341 ?auto_144343 ) ) ( not ( = ?auto_144341 ?auto_144344 ) ) ( not ( = ?auto_144341 ?auto_144345 ) ) ( not ( = ?auto_144341 ?auto_144346 ) ) ( not ( = ?auto_144341 ?auto_144347 ) ) ( not ( = ?auto_144342 ?auto_144343 ) ) ( not ( = ?auto_144342 ?auto_144344 ) ) ( not ( = ?auto_144342 ?auto_144345 ) ) ( not ( = ?auto_144342 ?auto_144346 ) ) ( not ( = ?auto_144342 ?auto_144347 ) ) ( not ( = ?auto_144343 ?auto_144344 ) ) ( not ( = ?auto_144343 ?auto_144345 ) ) ( not ( = ?auto_144343 ?auto_144346 ) ) ( not ( = ?auto_144343 ?auto_144347 ) ) ( not ( = ?auto_144344 ?auto_144345 ) ) ( not ( = ?auto_144344 ?auto_144346 ) ) ( not ( = ?auto_144344 ?auto_144347 ) ) ( not ( = ?auto_144345 ?auto_144346 ) ) ( not ( = ?auto_144345 ?auto_144347 ) ) ( not ( = ?auto_144346 ?auto_144347 ) ) ( ON ?auto_144345 ?auto_144346 ) ( ON ?auto_144344 ?auto_144345 ) ( CLEAR ?auto_144342 ) ( ON ?auto_144343 ?auto_144344 ) ( CLEAR ?auto_144343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144339 ?auto_144340 ?auto_144341 ?auto_144342 ?auto_144343 )
      ( MAKE-8PILE ?auto_144339 ?auto_144340 ?auto_144341 ?auto_144342 ?auto_144343 ?auto_144344 ?auto_144345 ?auto_144346 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144356 - BLOCK
      ?auto_144357 - BLOCK
      ?auto_144358 - BLOCK
      ?auto_144359 - BLOCK
      ?auto_144360 - BLOCK
      ?auto_144361 - BLOCK
      ?auto_144362 - BLOCK
      ?auto_144363 - BLOCK
    )
    :vars
    (
      ?auto_144364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144363 ?auto_144364 ) ( ON-TABLE ?auto_144356 ) ( ON ?auto_144357 ?auto_144356 ) ( ON ?auto_144358 ?auto_144357 ) ( not ( = ?auto_144356 ?auto_144357 ) ) ( not ( = ?auto_144356 ?auto_144358 ) ) ( not ( = ?auto_144356 ?auto_144359 ) ) ( not ( = ?auto_144356 ?auto_144360 ) ) ( not ( = ?auto_144356 ?auto_144361 ) ) ( not ( = ?auto_144356 ?auto_144362 ) ) ( not ( = ?auto_144356 ?auto_144363 ) ) ( not ( = ?auto_144356 ?auto_144364 ) ) ( not ( = ?auto_144357 ?auto_144358 ) ) ( not ( = ?auto_144357 ?auto_144359 ) ) ( not ( = ?auto_144357 ?auto_144360 ) ) ( not ( = ?auto_144357 ?auto_144361 ) ) ( not ( = ?auto_144357 ?auto_144362 ) ) ( not ( = ?auto_144357 ?auto_144363 ) ) ( not ( = ?auto_144357 ?auto_144364 ) ) ( not ( = ?auto_144358 ?auto_144359 ) ) ( not ( = ?auto_144358 ?auto_144360 ) ) ( not ( = ?auto_144358 ?auto_144361 ) ) ( not ( = ?auto_144358 ?auto_144362 ) ) ( not ( = ?auto_144358 ?auto_144363 ) ) ( not ( = ?auto_144358 ?auto_144364 ) ) ( not ( = ?auto_144359 ?auto_144360 ) ) ( not ( = ?auto_144359 ?auto_144361 ) ) ( not ( = ?auto_144359 ?auto_144362 ) ) ( not ( = ?auto_144359 ?auto_144363 ) ) ( not ( = ?auto_144359 ?auto_144364 ) ) ( not ( = ?auto_144360 ?auto_144361 ) ) ( not ( = ?auto_144360 ?auto_144362 ) ) ( not ( = ?auto_144360 ?auto_144363 ) ) ( not ( = ?auto_144360 ?auto_144364 ) ) ( not ( = ?auto_144361 ?auto_144362 ) ) ( not ( = ?auto_144361 ?auto_144363 ) ) ( not ( = ?auto_144361 ?auto_144364 ) ) ( not ( = ?auto_144362 ?auto_144363 ) ) ( not ( = ?auto_144362 ?auto_144364 ) ) ( not ( = ?auto_144363 ?auto_144364 ) ) ( ON ?auto_144362 ?auto_144363 ) ( ON ?auto_144361 ?auto_144362 ) ( ON ?auto_144360 ?auto_144361 ) ( CLEAR ?auto_144358 ) ( ON ?auto_144359 ?auto_144360 ) ( CLEAR ?auto_144359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144356 ?auto_144357 ?auto_144358 ?auto_144359 )
      ( MAKE-8PILE ?auto_144356 ?auto_144357 ?auto_144358 ?auto_144359 ?auto_144360 ?auto_144361 ?auto_144362 ?auto_144363 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144373 - BLOCK
      ?auto_144374 - BLOCK
      ?auto_144375 - BLOCK
      ?auto_144376 - BLOCK
      ?auto_144377 - BLOCK
      ?auto_144378 - BLOCK
      ?auto_144379 - BLOCK
      ?auto_144380 - BLOCK
    )
    :vars
    (
      ?auto_144381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144380 ?auto_144381 ) ( ON-TABLE ?auto_144373 ) ( ON ?auto_144374 ?auto_144373 ) ( ON ?auto_144375 ?auto_144374 ) ( not ( = ?auto_144373 ?auto_144374 ) ) ( not ( = ?auto_144373 ?auto_144375 ) ) ( not ( = ?auto_144373 ?auto_144376 ) ) ( not ( = ?auto_144373 ?auto_144377 ) ) ( not ( = ?auto_144373 ?auto_144378 ) ) ( not ( = ?auto_144373 ?auto_144379 ) ) ( not ( = ?auto_144373 ?auto_144380 ) ) ( not ( = ?auto_144373 ?auto_144381 ) ) ( not ( = ?auto_144374 ?auto_144375 ) ) ( not ( = ?auto_144374 ?auto_144376 ) ) ( not ( = ?auto_144374 ?auto_144377 ) ) ( not ( = ?auto_144374 ?auto_144378 ) ) ( not ( = ?auto_144374 ?auto_144379 ) ) ( not ( = ?auto_144374 ?auto_144380 ) ) ( not ( = ?auto_144374 ?auto_144381 ) ) ( not ( = ?auto_144375 ?auto_144376 ) ) ( not ( = ?auto_144375 ?auto_144377 ) ) ( not ( = ?auto_144375 ?auto_144378 ) ) ( not ( = ?auto_144375 ?auto_144379 ) ) ( not ( = ?auto_144375 ?auto_144380 ) ) ( not ( = ?auto_144375 ?auto_144381 ) ) ( not ( = ?auto_144376 ?auto_144377 ) ) ( not ( = ?auto_144376 ?auto_144378 ) ) ( not ( = ?auto_144376 ?auto_144379 ) ) ( not ( = ?auto_144376 ?auto_144380 ) ) ( not ( = ?auto_144376 ?auto_144381 ) ) ( not ( = ?auto_144377 ?auto_144378 ) ) ( not ( = ?auto_144377 ?auto_144379 ) ) ( not ( = ?auto_144377 ?auto_144380 ) ) ( not ( = ?auto_144377 ?auto_144381 ) ) ( not ( = ?auto_144378 ?auto_144379 ) ) ( not ( = ?auto_144378 ?auto_144380 ) ) ( not ( = ?auto_144378 ?auto_144381 ) ) ( not ( = ?auto_144379 ?auto_144380 ) ) ( not ( = ?auto_144379 ?auto_144381 ) ) ( not ( = ?auto_144380 ?auto_144381 ) ) ( ON ?auto_144379 ?auto_144380 ) ( ON ?auto_144378 ?auto_144379 ) ( ON ?auto_144377 ?auto_144378 ) ( CLEAR ?auto_144375 ) ( ON ?auto_144376 ?auto_144377 ) ( CLEAR ?auto_144376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144373 ?auto_144374 ?auto_144375 ?auto_144376 )
      ( MAKE-8PILE ?auto_144373 ?auto_144374 ?auto_144375 ?auto_144376 ?auto_144377 ?auto_144378 ?auto_144379 ?auto_144380 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144390 - BLOCK
      ?auto_144391 - BLOCK
      ?auto_144392 - BLOCK
      ?auto_144393 - BLOCK
      ?auto_144394 - BLOCK
      ?auto_144395 - BLOCK
      ?auto_144396 - BLOCK
      ?auto_144397 - BLOCK
    )
    :vars
    (
      ?auto_144398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144397 ?auto_144398 ) ( ON-TABLE ?auto_144390 ) ( ON ?auto_144391 ?auto_144390 ) ( not ( = ?auto_144390 ?auto_144391 ) ) ( not ( = ?auto_144390 ?auto_144392 ) ) ( not ( = ?auto_144390 ?auto_144393 ) ) ( not ( = ?auto_144390 ?auto_144394 ) ) ( not ( = ?auto_144390 ?auto_144395 ) ) ( not ( = ?auto_144390 ?auto_144396 ) ) ( not ( = ?auto_144390 ?auto_144397 ) ) ( not ( = ?auto_144390 ?auto_144398 ) ) ( not ( = ?auto_144391 ?auto_144392 ) ) ( not ( = ?auto_144391 ?auto_144393 ) ) ( not ( = ?auto_144391 ?auto_144394 ) ) ( not ( = ?auto_144391 ?auto_144395 ) ) ( not ( = ?auto_144391 ?auto_144396 ) ) ( not ( = ?auto_144391 ?auto_144397 ) ) ( not ( = ?auto_144391 ?auto_144398 ) ) ( not ( = ?auto_144392 ?auto_144393 ) ) ( not ( = ?auto_144392 ?auto_144394 ) ) ( not ( = ?auto_144392 ?auto_144395 ) ) ( not ( = ?auto_144392 ?auto_144396 ) ) ( not ( = ?auto_144392 ?auto_144397 ) ) ( not ( = ?auto_144392 ?auto_144398 ) ) ( not ( = ?auto_144393 ?auto_144394 ) ) ( not ( = ?auto_144393 ?auto_144395 ) ) ( not ( = ?auto_144393 ?auto_144396 ) ) ( not ( = ?auto_144393 ?auto_144397 ) ) ( not ( = ?auto_144393 ?auto_144398 ) ) ( not ( = ?auto_144394 ?auto_144395 ) ) ( not ( = ?auto_144394 ?auto_144396 ) ) ( not ( = ?auto_144394 ?auto_144397 ) ) ( not ( = ?auto_144394 ?auto_144398 ) ) ( not ( = ?auto_144395 ?auto_144396 ) ) ( not ( = ?auto_144395 ?auto_144397 ) ) ( not ( = ?auto_144395 ?auto_144398 ) ) ( not ( = ?auto_144396 ?auto_144397 ) ) ( not ( = ?auto_144396 ?auto_144398 ) ) ( not ( = ?auto_144397 ?auto_144398 ) ) ( ON ?auto_144396 ?auto_144397 ) ( ON ?auto_144395 ?auto_144396 ) ( ON ?auto_144394 ?auto_144395 ) ( ON ?auto_144393 ?auto_144394 ) ( CLEAR ?auto_144391 ) ( ON ?auto_144392 ?auto_144393 ) ( CLEAR ?auto_144392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144390 ?auto_144391 ?auto_144392 )
      ( MAKE-8PILE ?auto_144390 ?auto_144391 ?auto_144392 ?auto_144393 ?auto_144394 ?auto_144395 ?auto_144396 ?auto_144397 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144407 - BLOCK
      ?auto_144408 - BLOCK
      ?auto_144409 - BLOCK
      ?auto_144410 - BLOCK
      ?auto_144411 - BLOCK
      ?auto_144412 - BLOCK
      ?auto_144413 - BLOCK
      ?auto_144414 - BLOCK
    )
    :vars
    (
      ?auto_144415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144414 ?auto_144415 ) ( ON-TABLE ?auto_144407 ) ( ON ?auto_144408 ?auto_144407 ) ( not ( = ?auto_144407 ?auto_144408 ) ) ( not ( = ?auto_144407 ?auto_144409 ) ) ( not ( = ?auto_144407 ?auto_144410 ) ) ( not ( = ?auto_144407 ?auto_144411 ) ) ( not ( = ?auto_144407 ?auto_144412 ) ) ( not ( = ?auto_144407 ?auto_144413 ) ) ( not ( = ?auto_144407 ?auto_144414 ) ) ( not ( = ?auto_144407 ?auto_144415 ) ) ( not ( = ?auto_144408 ?auto_144409 ) ) ( not ( = ?auto_144408 ?auto_144410 ) ) ( not ( = ?auto_144408 ?auto_144411 ) ) ( not ( = ?auto_144408 ?auto_144412 ) ) ( not ( = ?auto_144408 ?auto_144413 ) ) ( not ( = ?auto_144408 ?auto_144414 ) ) ( not ( = ?auto_144408 ?auto_144415 ) ) ( not ( = ?auto_144409 ?auto_144410 ) ) ( not ( = ?auto_144409 ?auto_144411 ) ) ( not ( = ?auto_144409 ?auto_144412 ) ) ( not ( = ?auto_144409 ?auto_144413 ) ) ( not ( = ?auto_144409 ?auto_144414 ) ) ( not ( = ?auto_144409 ?auto_144415 ) ) ( not ( = ?auto_144410 ?auto_144411 ) ) ( not ( = ?auto_144410 ?auto_144412 ) ) ( not ( = ?auto_144410 ?auto_144413 ) ) ( not ( = ?auto_144410 ?auto_144414 ) ) ( not ( = ?auto_144410 ?auto_144415 ) ) ( not ( = ?auto_144411 ?auto_144412 ) ) ( not ( = ?auto_144411 ?auto_144413 ) ) ( not ( = ?auto_144411 ?auto_144414 ) ) ( not ( = ?auto_144411 ?auto_144415 ) ) ( not ( = ?auto_144412 ?auto_144413 ) ) ( not ( = ?auto_144412 ?auto_144414 ) ) ( not ( = ?auto_144412 ?auto_144415 ) ) ( not ( = ?auto_144413 ?auto_144414 ) ) ( not ( = ?auto_144413 ?auto_144415 ) ) ( not ( = ?auto_144414 ?auto_144415 ) ) ( ON ?auto_144413 ?auto_144414 ) ( ON ?auto_144412 ?auto_144413 ) ( ON ?auto_144411 ?auto_144412 ) ( ON ?auto_144410 ?auto_144411 ) ( CLEAR ?auto_144408 ) ( ON ?auto_144409 ?auto_144410 ) ( CLEAR ?auto_144409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144407 ?auto_144408 ?auto_144409 )
      ( MAKE-8PILE ?auto_144407 ?auto_144408 ?auto_144409 ?auto_144410 ?auto_144411 ?auto_144412 ?auto_144413 ?auto_144414 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144424 - BLOCK
      ?auto_144425 - BLOCK
      ?auto_144426 - BLOCK
      ?auto_144427 - BLOCK
      ?auto_144428 - BLOCK
      ?auto_144429 - BLOCK
      ?auto_144430 - BLOCK
      ?auto_144431 - BLOCK
    )
    :vars
    (
      ?auto_144432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144431 ?auto_144432 ) ( ON-TABLE ?auto_144424 ) ( not ( = ?auto_144424 ?auto_144425 ) ) ( not ( = ?auto_144424 ?auto_144426 ) ) ( not ( = ?auto_144424 ?auto_144427 ) ) ( not ( = ?auto_144424 ?auto_144428 ) ) ( not ( = ?auto_144424 ?auto_144429 ) ) ( not ( = ?auto_144424 ?auto_144430 ) ) ( not ( = ?auto_144424 ?auto_144431 ) ) ( not ( = ?auto_144424 ?auto_144432 ) ) ( not ( = ?auto_144425 ?auto_144426 ) ) ( not ( = ?auto_144425 ?auto_144427 ) ) ( not ( = ?auto_144425 ?auto_144428 ) ) ( not ( = ?auto_144425 ?auto_144429 ) ) ( not ( = ?auto_144425 ?auto_144430 ) ) ( not ( = ?auto_144425 ?auto_144431 ) ) ( not ( = ?auto_144425 ?auto_144432 ) ) ( not ( = ?auto_144426 ?auto_144427 ) ) ( not ( = ?auto_144426 ?auto_144428 ) ) ( not ( = ?auto_144426 ?auto_144429 ) ) ( not ( = ?auto_144426 ?auto_144430 ) ) ( not ( = ?auto_144426 ?auto_144431 ) ) ( not ( = ?auto_144426 ?auto_144432 ) ) ( not ( = ?auto_144427 ?auto_144428 ) ) ( not ( = ?auto_144427 ?auto_144429 ) ) ( not ( = ?auto_144427 ?auto_144430 ) ) ( not ( = ?auto_144427 ?auto_144431 ) ) ( not ( = ?auto_144427 ?auto_144432 ) ) ( not ( = ?auto_144428 ?auto_144429 ) ) ( not ( = ?auto_144428 ?auto_144430 ) ) ( not ( = ?auto_144428 ?auto_144431 ) ) ( not ( = ?auto_144428 ?auto_144432 ) ) ( not ( = ?auto_144429 ?auto_144430 ) ) ( not ( = ?auto_144429 ?auto_144431 ) ) ( not ( = ?auto_144429 ?auto_144432 ) ) ( not ( = ?auto_144430 ?auto_144431 ) ) ( not ( = ?auto_144430 ?auto_144432 ) ) ( not ( = ?auto_144431 ?auto_144432 ) ) ( ON ?auto_144430 ?auto_144431 ) ( ON ?auto_144429 ?auto_144430 ) ( ON ?auto_144428 ?auto_144429 ) ( ON ?auto_144427 ?auto_144428 ) ( ON ?auto_144426 ?auto_144427 ) ( CLEAR ?auto_144424 ) ( ON ?auto_144425 ?auto_144426 ) ( CLEAR ?auto_144425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144424 ?auto_144425 )
      ( MAKE-8PILE ?auto_144424 ?auto_144425 ?auto_144426 ?auto_144427 ?auto_144428 ?auto_144429 ?auto_144430 ?auto_144431 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144441 - BLOCK
      ?auto_144442 - BLOCK
      ?auto_144443 - BLOCK
      ?auto_144444 - BLOCK
      ?auto_144445 - BLOCK
      ?auto_144446 - BLOCK
      ?auto_144447 - BLOCK
      ?auto_144448 - BLOCK
    )
    :vars
    (
      ?auto_144449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144448 ?auto_144449 ) ( ON-TABLE ?auto_144441 ) ( not ( = ?auto_144441 ?auto_144442 ) ) ( not ( = ?auto_144441 ?auto_144443 ) ) ( not ( = ?auto_144441 ?auto_144444 ) ) ( not ( = ?auto_144441 ?auto_144445 ) ) ( not ( = ?auto_144441 ?auto_144446 ) ) ( not ( = ?auto_144441 ?auto_144447 ) ) ( not ( = ?auto_144441 ?auto_144448 ) ) ( not ( = ?auto_144441 ?auto_144449 ) ) ( not ( = ?auto_144442 ?auto_144443 ) ) ( not ( = ?auto_144442 ?auto_144444 ) ) ( not ( = ?auto_144442 ?auto_144445 ) ) ( not ( = ?auto_144442 ?auto_144446 ) ) ( not ( = ?auto_144442 ?auto_144447 ) ) ( not ( = ?auto_144442 ?auto_144448 ) ) ( not ( = ?auto_144442 ?auto_144449 ) ) ( not ( = ?auto_144443 ?auto_144444 ) ) ( not ( = ?auto_144443 ?auto_144445 ) ) ( not ( = ?auto_144443 ?auto_144446 ) ) ( not ( = ?auto_144443 ?auto_144447 ) ) ( not ( = ?auto_144443 ?auto_144448 ) ) ( not ( = ?auto_144443 ?auto_144449 ) ) ( not ( = ?auto_144444 ?auto_144445 ) ) ( not ( = ?auto_144444 ?auto_144446 ) ) ( not ( = ?auto_144444 ?auto_144447 ) ) ( not ( = ?auto_144444 ?auto_144448 ) ) ( not ( = ?auto_144444 ?auto_144449 ) ) ( not ( = ?auto_144445 ?auto_144446 ) ) ( not ( = ?auto_144445 ?auto_144447 ) ) ( not ( = ?auto_144445 ?auto_144448 ) ) ( not ( = ?auto_144445 ?auto_144449 ) ) ( not ( = ?auto_144446 ?auto_144447 ) ) ( not ( = ?auto_144446 ?auto_144448 ) ) ( not ( = ?auto_144446 ?auto_144449 ) ) ( not ( = ?auto_144447 ?auto_144448 ) ) ( not ( = ?auto_144447 ?auto_144449 ) ) ( not ( = ?auto_144448 ?auto_144449 ) ) ( ON ?auto_144447 ?auto_144448 ) ( ON ?auto_144446 ?auto_144447 ) ( ON ?auto_144445 ?auto_144446 ) ( ON ?auto_144444 ?auto_144445 ) ( ON ?auto_144443 ?auto_144444 ) ( CLEAR ?auto_144441 ) ( ON ?auto_144442 ?auto_144443 ) ( CLEAR ?auto_144442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144441 ?auto_144442 )
      ( MAKE-8PILE ?auto_144441 ?auto_144442 ?auto_144443 ?auto_144444 ?auto_144445 ?auto_144446 ?auto_144447 ?auto_144448 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144458 - BLOCK
      ?auto_144459 - BLOCK
      ?auto_144460 - BLOCK
      ?auto_144461 - BLOCK
      ?auto_144462 - BLOCK
      ?auto_144463 - BLOCK
      ?auto_144464 - BLOCK
      ?auto_144465 - BLOCK
    )
    :vars
    (
      ?auto_144466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144465 ?auto_144466 ) ( not ( = ?auto_144458 ?auto_144459 ) ) ( not ( = ?auto_144458 ?auto_144460 ) ) ( not ( = ?auto_144458 ?auto_144461 ) ) ( not ( = ?auto_144458 ?auto_144462 ) ) ( not ( = ?auto_144458 ?auto_144463 ) ) ( not ( = ?auto_144458 ?auto_144464 ) ) ( not ( = ?auto_144458 ?auto_144465 ) ) ( not ( = ?auto_144458 ?auto_144466 ) ) ( not ( = ?auto_144459 ?auto_144460 ) ) ( not ( = ?auto_144459 ?auto_144461 ) ) ( not ( = ?auto_144459 ?auto_144462 ) ) ( not ( = ?auto_144459 ?auto_144463 ) ) ( not ( = ?auto_144459 ?auto_144464 ) ) ( not ( = ?auto_144459 ?auto_144465 ) ) ( not ( = ?auto_144459 ?auto_144466 ) ) ( not ( = ?auto_144460 ?auto_144461 ) ) ( not ( = ?auto_144460 ?auto_144462 ) ) ( not ( = ?auto_144460 ?auto_144463 ) ) ( not ( = ?auto_144460 ?auto_144464 ) ) ( not ( = ?auto_144460 ?auto_144465 ) ) ( not ( = ?auto_144460 ?auto_144466 ) ) ( not ( = ?auto_144461 ?auto_144462 ) ) ( not ( = ?auto_144461 ?auto_144463 ) ) ( not ( = ?auto_144461 ?auto_144464 ) ) ( not ( = ?auto_144461 ?auto_144465 ) ) ( not ( = ?auto_144461 ?auto_144466 ) ) ( not ( = ?auto_144462 ?auto_144463 ) ) ( not ( = ?auto_144462 ?auto_144464 ) ) ( not ( = ?auto_144462 ?auto_144465 ) ) ( not ( = ?auto_144462 ?auto_144466 ) ) ( not ( = ?auto_144463 ?auto_144464 ) ) ( not ( = ?auto_144463 ?auto_144465 ) ) ( not ( = ?auto_144463 ?auto_144466 ) ) ( not ( = ?auto_144464 ?auto_144465 ) ) ( not ( = ?auto_144464 ?auto_144466 ) ) ( not ( = ?auto_144465 ?auto_144466 ) ) ( ON ?auto_144464 ?auto_144465 ) ( ON ?auto_144463 ?auto_144464 ) ( ON ?auto_144462 ?auto_144463 ) ( ON ?auto_144461 ?auto_144462 ) ( ON ?auto_144460 ?auto_144461 ) ( ON ?auto_144459 ?auto_144460 ) ( ON ?auto_144458 ?auto_144459 ) ( CLEAR ?auto_144458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_144458 )
      ( MAKE-8PILE ?auto_144458 ?auto_144459 ?auto_144460 ?auto_144461 ?auto_144462 ?auto_144463 ?auto_144464 ?auto_144465 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_144475 - BLOCK
      ?auto_144476 - BLOCK
      ?auto_144477 - BLOCK
      ?auto_144478 - BLOCK
      ?auto_144479 - BLOCK
      ?auto_144480 - BLOCK
      ?auto_144481 - BLOCK
      ?auto_144482 - BLOCK
    )
    :vars
    (
      ?auto_144483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144482 ?auto_144483 ) ( not ( = ?auto_144475 ?auto_144476 ) ) ( not ( = ?auto_144475 ?auto_144477 ) ) ( not ( = ?auto_144475 ?auto_144478 ) ) ( not ( = ?auto_144475 ?auto_144479 ) ) ( not ( = ?auto_144475 ?auto_144480 ) ) ( not ( = ?auto_144475 ?auto_144481 ) ) ( not ( = ?auto_144475 ?auto_144482 ) ) ( not ( = ?auto_144475 ?auto_144483 ) ) ( not ( = ?auto_144476 ?auto_144477 ) ) ( not ( = ?auto_144476 ?auto_144478 ) ) ( not ( = ?auto_144476 ?auto_144479 ) ) ( not ( = ?auto_144476 ?auto_144480 ) ) ( not ( = ?auto_144476 ?auto_144481 ) ) ( not ( = ?auto_144476 ?auto_144482 ) ) ( not ( = ?auto_144476 ?auto_144483 ) ) ( not ( = ?auto_144477 ?auto_144478 ) ) ( not ( = ?auto_144477 ?auto_144479 ) ) ( not ( = ?auto_144477 ?auto_144480 ) ) ( not ( = ?auto_144477 ?auto_144481 ) ) ( not ( = ?auto_144477 ?auto_144482 ) ) ( not ( = ?auto_144477 ?auto_144483 ) ) ( not ( = ?auto_144478 ?auto_144479 ) ) ( not ( = ?auto_144478 ?auto_144480 ) ) ( not ( = ?auto_144478 ?auto_144481 ) ) ( not ( = ?auto_144478 ?auto_144482 ) ) ( not ( = ?auto_144478 ?auto_144483 ) ) ( not ( = ?auto_144479 ?auto_144480 ) ) ( not ( = ?auto_144479 ?auto_144481 ) ) ( not ( = ?auto_144479 ?auto_144482 ) ) ( not ( = ?auto_144479 ?auto_144483 ) ) ( not ( = ?auto_144480 ?auto_144481 ) ) ( not ( = ?auto_144480 ?auto_144482 ) ) ( not ( = ?auto_144480 ?auto_144483 ) ) ( not ( = ?auto_144481 ?auto_144482 ) ) ( not ( = ?auto_144481 ?auto_144483 ) ) ( not ( = ?auto_144482 ?auto_144483 ) ) ( ON ?auto_144481 ?auto_144482 ) ( ON ?auto_144480 ?auto_144481 ) ( ON ?auto_144479 ?auto_144480 ) ( ON ?auto_144478 ?auto_144479 ) ( ON ?auto_144477 ?auto_144478 ) ( ON ?auto_144476 ?auto_144477 ) ( ON ?auto_144475 ?auto_144476 ) ( CLEAR ?auto_144475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_144475 )
      ( MAKE-8PILE ?auto_144475 ?auto_144476 ?auto_144477 ?auto_144478 ?auto_144479 ?auto_144480 ?auto_144481 ?auto_144482 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_144493 - BLOCK
      ?auto_144494 - BLOCK
      ?auto_144495 - BLOCK
      ?auto_144496 - BLOCK
      ?auto_144497 - BLOCK
      ?auto_144498 - BLOCK
      ?auto_144499 - BLOCK
      ?auto_144500 - BLOCK
      ?auto_144501 - BLOCK
    )
    :vars
    (
      ?auto_144502 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_144500 ) ( ON ?auto_144501 ?auto_144502 ) ( CLEAR ?auto_144501 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_144493 ) ( ON ?auto_144494 ?auto_144493 ) ( ON ?auto_144495 ?auto_144494 ) ( ON ?auto_144496 ?auto_144495 ) ( ON ?auto_144497 ?auto_144496 ) ( ON ?auto_144498 ?auto_144497 ) ( ON ?auto_144499 ?auto_144498 ) ( ON ?auto_144500 ?auto_144499 ) ( not ( = ?auto_144493 ?auto_144494 ) ) ( not ( = ?auto_144493 ?auto_144495 ) ) ( not ( = ?auto_144493 ?auto_144496 ) ) ( not ( = ?auto_144493 ?auto_144497 ) ) ( not ( = ?auto_144493 ?auto_144498 ) ) ( not ( = ?auto_144493 ?auto_144499 ) ) ( not ( = ?auto_144493 ?auto_144500 ) ) ( not ( = ?auto_144493 ?auto_144501 ) ) ( not ( = ?auto_144493 ?auto_144502 ) ) ( not ( = ?auto_144494 ?auto_144495 ) ) ( not ( = ?auto_144494 ?auto_144496 ) ) ( not ( = ?auto_144494 ?auto_144497 ) ) ( not ( = ?auto_144494 ?auto_144498 ) ) ( not ( = ?auto_144494 ?auto_144499 ) ) ( not ( = ?auto_144494 ?auto_144500 ) ) ( not ( = ?auto_144494 ?auto_144501 ) ) ( not ( = ?auto_144494 ?auto_144502 ) ) ( not ( = ?auto_144495 ?auto_144496 ) ) ( not ( = ?auto_144495 ?auto_144497 ) ) ( not ( = ?auto_144495 ?auto_144498 ) ) ( not ( = ?auto_144495 ?auto_144499 ) ) ( not ( = ?auto_144495 ?auto_144500 ) ) ( not ( = ?auto_144495 ?auto_144501 ) ) ( not ( = ?auto_144495 ?auto_144502 ) ) ( not ( = ?auto_144496 ?auto_144497 ) ) ( not ( = ?auto_144496 ?auto_144498 ) ) ( not ( = ?auto_144496 ?auto_144499 ) ) ( not ( = ?auto_144496 ?auto_144500 ) ) ( not ( = ?auto_144496 ?auto_144501 ) ) ( not ( = ?auto_144496 ?auto_144502 ) ) ( not ( = ?auto_144497 ?auto_144498 ) ) ( not ( = ?auto_144497 ?auto_144499 ) ) ( not ( = ?auto_144497 ?auto_144500 ) ) ( not ( = ?auto_144497 ?auto_144501 ) ) ( not ( = ?auto_144497 ?auto_144502 ) ) ( not ( = ?auto_144498 ?auto_144499 ) ) ( not ( = ?auto_144498 ?auto_144500 ) ) ( not ( = ?auto_144498 ?auto_144501 ) ) ( not ( = ?auto_144498 ?auto_144502 ) ) ( not ( = ?auto_144499 ?auto_144500 ) ) ( not ( = ?auto_144499 ?auto_144501 ) ) ( not ( = ?auto_144499 ?auto_144502 ) ) ( not ( = ?auto_144500 ?auto_144501 ) ) ( not ( = ?auto_144500 ?auto_144502 ) ) ( not ( = ?auto_144501 ?auto_144502 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_144501 ?auto_144502 )
      ( !STACK ?auto_144501 ?auto_144500 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_144512 - BLOCK
      ?auto_144513 - BLOCK
      ?auto_144514 - BLOCK
      ?auto_144515 - BLOCK
      ?auto_144516 - BLOCK
      ?auto_144517 - BLOCK
      ?auto_144518 - BLOCK
      ?auto_144519 - BLOCK
      ?auto_144520 - BLOCK
    )
    :vars
    (
      ?auto_144521 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_144519 ) ( ON ?auto_144520 ?auto_144521 ) ( CLEAR ?auto_144520 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_144512 ) ( ON ?auto_144513 ?auto_144512 ) ( ON ?auto_144514 ?auto_144513 ) ( ON ?auto_144515 ?auto_144514 ) ( ON ?auto_144516 ?auto_144515 ) ( ON ?auto_144517 ?auto_144516 ) ( ON ?auto_144518 ?auto_144517 ) ( ON ?auto_144519 ?auto_144518 ) ( not ( = ?auto_144512 ?auto_144513 ) ) ( not ( = ?auto_144512 ?auto_144514 ) ) ( not ( = ?auto_144512 ?auto_144515 ) ) ( not ( = ?auto_144512 ?auto_144516 ) ) ( not ( = ?auto_144512 ?auto_144517 ) ) ( not ( = ?auto_144512 ?auto_144518 ) ) ( not ( = ?auto_144512 ?auto_144519 ) ) ( not ( = ?auto_144512 ?auto_144520 ) ) ( not ( = ?auto_144512 ?auto_144521 ) ) ( not ( = ?auto_144513 ?auto_144514 ) ) ( not ( = ?auto_144513 ?auto_144515 ) ) ( not ( = ?auto_144513 ?auto_144516 ) ) ( not ( = ?auto_144513 ?auto_144517 ) ) ( not ( = ?auto_144513 ?auto_144518 ) ) ( not ( = ?auto_144513 ?auto_144519 ) ) ( not ( = ?auto_144513 ?auto_144520 ) ) ( not ( = ?auto_144513 ?auto_144521 ) ) ( not ( = ?auto_144514 ?auto_144515 ) ) ( not ( = ?auto_144514 ?auto_144516 ) ) ( not ( = ?auto_144514 ?auto_144517 ) ) ( not ( = ?auto_144514 ?auto_144518 ) ) ( not ( = ?auto_144514 ?auto_144519 ) ) ( not ( = ?auto_144514 ?auto_144520 ) ) ( not ( = ?auto_144514 ?auto_144521 ) ) ( not ( = ?auto_144515 ?auto_144516 ) ) ( not ( = ?auto_144515 ?auto_144517 ) ) ( not ( = ?auto_144515 ?auto_144518 ) ) ( not ( = ?auto_144515 ?auto_144519 ) ) ( not ( = ?auto_144515 ?auto_144520 ) ) ( not ( = ?auto_144515 ?auto_144521 ) ) ( not ( = ?auto_144516 ?auto_144517 ) ) ( not ( = ?auto_144516 ?auto_144518 ) ) ( not ( = ?auto_144516 ?auto_144519 ) ) ( not ( = ?auto_144516 ?auto_144520 ) ) ( not ( = ?auto_144516 ?auto_144521 ) ) ( not ( = ?auto_144517 ?auto_144518 ) ) ( not ( = ?auto_144517 ?auto_144519 ) ) ( not ( = ?auto_144517 ?auto_144520 ) ) ( not ( = ?auto_144517 ?auto_144521 ) ) ( not ( = ?auto_144518 ?auto_144519 ) ) ( not ( = ?auto_144518 ?auto_144520 ) ) ( not ( = ?auto_144518 ?auto_144521 ) ) ( not ( = ?auto_144519 ?auto_144520 ) ) ( not ( = ?auto_144519 ?auto_144521 ) ) ( not ( = ?auto_144520 ?auto_144521 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_144520 ?auto_144521 )
      ( !STACK ?auto_144520 ?auto_144519 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_144531 - BLOCK
      ?auto_144532 - BLOCK
      ?auto_144533 - BLOCK
      ?auto_144534 - BLOCK
      ?auto_144535 - BLOCK
      ?auto_144536 - BLOCK
      ?auto_144537 - BLOCK
      ?auto_144538 - BLOCK
      ?auto_144539 - BLOCK
    )
    :vars
    (
      ?auto_144540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144539 ?auto_144540 ) ( ON-TABLE ?auto_144531 ) ( ON ?auto_144532 ?auto_144531 ) ( ON ?auto_144533 ?auto_144532 ) ( ON ?auto_144534 ?auto_144533 ) ( ON ?auto_144535 ?auto_144534 ) ( ON ?auto_144536 ?auto_144535 ) ( ON ?auto_144537 ?auto_144536 ) ( not ( = ?auto_144531 ?auto_144532 ) ) ( not ( = ?auto_144531 ?auto_144533 ) ) ( not ( = ?auto_144531 ?auto_144534 ) ) ( not ( = ?auto_144531 ?auto_144535 ) ) ( not ( = ?auto_144531 ?auto_144536 ) ) ( not ( = ?auto_144531 ?auto_144537 ) ) ( not ( = ?auto_144531 ?auto_144538 ) ) ( not ( = ?auto_144531 ?auto_144539 ) ) ( not ( = ?auto_144531 ?auto_144540 ) ) ( not ( = ?auto_144532 ?auto_144533 ) ) ( not ( = ?auto_144532 ?auto_144534 ) ) ( not ( = ?auto_144532 ?auto_144535 ) ) ( not ( = ?auto_144532 ?auto_144536 ) ) ( not ( = ?auto_144532 ?auto_144537 ) ) ( not ( = ?auto_144532 ?auto_144538 ) ) ( not ( = ?auto_144532 ?auto_144539 ) ) ( not ( = ?auto_144532 ?auto_144540 ) ) ( not ( = ?auto_144533 ?auto_144534 ) ) ( not ( = ?auto_144533 ?auto_144535 ) ) ( not ( = ?auto_144533 ?auto_144536 ) ) ( not ( = ?auto_144533 ?auto_144537 ) ) ( not ( = ?auto_144533 ?auto_144538 ) ) ( not ( = ?auto_144533 ?auto_144539 ) ) ( not ( = ?auto_144533 ?auto_144540 ) ) ( not ( = ?auto_144534 ?auto_144535 ) ) ( not ( = ?auto_144534 ?auto_144536 ) ) ( not ( = ?auto_144534 ?auto_144537 ) ) ( not ( = ?auto_144534 ?auto_144538 ) ) ( not ( = ?auto_144534 ?auto_144539 ) ) ( not ( = ?auto_144534 ?auto_144540 ) ) ( not ( = ?auto_144535 ?auto_144536 ) ) ( not ( = ?auto_144535 ?auto_144537 ) ) ( not ( = ?auto_144535 ?auto_144538 ) ) ( not ( = ?auto_144535 ?auto_144539 ) ) ( not ( = ?auto_144535 ?auto_144540 ) ) ( not ( = ?auto_144536 ?auto_144537 ) ) ( not ( = ?auto_144536 ?auto_144538 ) ) ( not ( = ?auto_144536 ?auto_144539 ) ) ( not ( = ?auto_144536 ?auto_144540 ) ) ( not ( = ?auto_144537 ?auto_144538 ) ) ( not ( = ?auto_144537 ?auto_144539 ) ) ( not ( = ?auto_144537 ?auto_144540 ) ) ( not ( = ?auto_144538 ?auto_144539 ) ) ( not ( = ?auto_144538 ?auto_144540 ) ) ( not ( = ?auto_144539 ?auto_144540 ) ) ( CLEAR ?auto_144537 ) ( ON ?auto_144538 ?auto_144539 ) ( CLEAR ?auto_144538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_144531 ?auto_144532 ?auto_144533 ?auto_144534 ?auto_144535 ?auto_144536 ?auto_144537 ?auto_144538 )
      ( MAKE-9PILE ?auto_144531 ?auto_144532 ?auto_144533 ?auto_144534 ?auto_144535 ?auto_144536 ?auto_144537 ?auto_144538 ?auto_144539 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_144550 - BLOCK
      ?auto_144551 - BLOCK
      ?auto_144552 - BLOCK
      ?auto_144553 - BLOCK
      ?auto_144554 - BLOCK
      ?auto_144555 - BLOCK
      ?auto_144556 - BLOCK
      ?auto_144557 - BLOCK
      ?auto_144558 - BLOCK
    )
    :vars
    (
      ?auto_144559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144558 ?auto_144559 ) ( ON-TABLE ?auto_144550 ) ( ON ?auto_144551 ?auto_144550 ) ( ON ?auto_144552 ?auto_144551 ) ( ON ?auto_144553 ?auto_144552 ) ( ON ?auto_144554 ?auto_144553 ) ( ON ?auto_144555 ?auto_144554 ) ( ON ?auto_144556 ?auto_144555 ) ( not ( = ?auto_144550 ?auto_144551 ) ) ( not ( = ?auto_144550 ?auto_144552 ) ) ( not ( = ?auto_144550 ?auto_144553 ) ) ( not ( = ?auto_144550 ?auto_144554 ) ) ( not ( = ?auto_144550 ?auto_144555 ) ) ( not ( = ?auto_144550 ?auto_144556 ) ) ( not ( = ?auto_144550 ?auto_144557 ) ) ( not ( = ?auto_144550 ?auto_144558 ) ) ( not ( = ?auto_144550 ?auto_144559 ) ) ( not ( = ?auto_144551 ?auto_144552 ) ) ( not ( = ?auto_144551 ?auto_144553 ) ) ( not ( = ?auto_144551 ?auto_144554 ) ) ( not ( = ?auto_144551 ?auto_144555 ) ) ( not ( = ?auto_144551 ?auto_144556 ) ) ( not ( = ?auto_144551 ?auto_144557 ) ) ( not ( = ?auto_144551 ?auto_144558 ) ) ( not ( = ?auto_144551 ?auto_144559 ) ) ( not ( = ?auto_144552 ?auto_144553 ) ) ( not ( = ?auto_144552 ?auto_144554 ) ) ( not ( = ?auto_144552 ?auto_144555 ) ) ( not ( = ?auto_144552 ?auto_144556 ) ) ( not ( = ?auto_144552 ?auto_144557 ) ) ( not ( = ?auto_144552 ?auto_144558 ) ) ( not ( = ?auto_144552 ?auto_144559 ) ) ( not ( = ?auto_144553 ?auto_144554 ) ) ( not ( = ?auto_144553 ?auto_144555 ) ) ( not ( = ?auto_144553 ?auto_144556 ) ) ( not ( = ?auto_144553 ?auto_144557 ) ) ( not ( = ?auto_144553 ?auto_144558 ) ) ( not ( = ?auto_144553 ?auto_144559 ) ) ( not ( = ?auto_144554 ?auto_144555 ) ) ( not ( = ?auto_144554 ?auto_144556 ) ) ( not ( = ?auto_144554 ?auto_144557 ) ) ( not ( = ?auto_144554 ?auto_144558 ) ) ( not ( = ?auto_144554 ?auto_144559 ) ) ( not ( = ?auto_144555 ?auto_144556 ) ) ( not ( = ?auto_144555 ?auto_144557 ) ) ( not ( = ?auto_144555 ?auto_144558 ) ) ( not ( = ?auto_144555 ?auto_144559 ) ) ( not ( = ?auto_144556 ?auto_144557 ) ) ( not ( = ?auto_144556 ?auto_144558 ) ) ( not ( = ?auto_144556 ?auto_144559 ) ) ( not ( = ?auto_144557 ?auto_144558 ) ) ( not ( = ?auto_144557 ?auto_144559 ) ) ( not ( = ?auto_144558 ?auto_144559 ) ) ( CLEAR ?auto_144556 ) ( ON ?auto_144557 ?auto_144558 ) ( CLEAR ?auto_144557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_144550 ?auto_144551 ?auto_144552 ?auto_144553 ?auto_144554 ?auto_144555 ?auto_144556 ?auto_144557 )
      ( MAKE-9PILE ?auto_144550 ?auto_144551 ?auto_144552 ?auto_144553 ?auto_144554 ?auto_144555 ?auto_144556 ?auto_144557 ?auto_144558 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_144569 - BLOCK
      ?auto_144570 - BLOCK
      ?auto_144571 - BLOCK
      ?auto_144572 - BLOCK
      ?auto_144573 - BLOCK
      ?auto_144574 - BLOCK
      ?auto_144575 - BLOCK
      ?auto_144576 - BLOCK
      ?auto_144577 - BLOCK
    )
    :vars
    (
      ?auto_144578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144577 ?auto_144578 ) ( ON-TABLE ?auto_144569 ) ( ON ?auto_144570 ?auto_144569 ) ( ON ?auto_144571 ?auto_144570 ) ( ON ?auto_144572 ?auto_144571 ) ( ON ?auto_144573 ?auto_144572 ) ( ON ?auto_144574 ?auto_144573 ) ( not ( = ?auto_144569 ?auto_144570 ) ) ( not ( = ?auto_144569 ?auto_144571 ) ) ( not ( = ?auto_144569 ?auto_144572 ) ) ( not ( = ?auto_144569 ?auto_144573 ) ) ( not ( = ?auto_144569 ?auto_144574 ) ) ( not ( = ?auto_144569 ?auto_144575 ) ) ( not ( = ?auto_144569 ?auto_144576 ) ) ( not ( = ?auto_144569 ?auto_144577 ) ) ( not ( = ?auto_144569 ?auto_144578 ) ) ( not ( = ?auto_144570 ?auto_144571 ) ) ( not ( = ?auto_144570 ?auto_144572 ) ) ( not ( = ?auto_144570 ?auto_144573 ) ) ( not ( = ?auto_144570 ?auto_144574 ) ) ( not ( = ?auto_144570 ?auto_144575 ) ) ( not ( = ?auto_144570 ?auto_144576 ) ) ( not ( = ?auto_144570 ?auto_144577 ) ) ( not ( = ?auto_144570 ?auto_144578 ) ) ( not ( = ?auto_144571 ?auto_144572 ) ) ( not ( = ?auto_144571 ?auto_144573 ) ) ( not ( = ?auto_144571 ?auto_144574 ) ) ( not ( = ?auto_144571 ?auto_144575 ) ) ( not ( = ?auto_144571 ?auto_144576 ) ) ( not ( = ?auto_144571 ?auto_144577 ) ) ( not ( = ?auto_144571 ?auto_144578 ) ) ( not ( = ?auto_144572 ?auto_144573 ) ) ( not ( = ?auto_144572 ?auto_144574 ) ) ( not ( = ?auto_144572 ?auto_144575 ) ) ( not ( = ?auto_144572 ?auto_144576 ) ) ( not ( = ?auto_144572 ?auto_144577 ) ) ( not ( = ?auto_144572 ?auto_144578 ) ) ( not ( = ?auto_144573 ?auto_144574 ) ) ( not ( = ?auto_144573 ?auto_144575 ) ) ( not ( = ?auto_144573 ?auto_144576 ) ) ( not ( = ?auto_144573 ?auto_144577 ) ) ( not ( = ?auto_144573 ?auto_144578 ) ) ( not ( = ?auto_144574 ?auto_144575 ) ) ( not ( = ?auto_144574 ?auto_144576 ) ) ( not ( = ?auto_144574 ?auto_144577 ) ) ( not ( = ?auto_144574 ?auto_144578 ) ) ( not ( = ?auto_144575 ?auto_144576 ) ) ( not ( = ?auto_144575 ?auto_144577 ) ) ( not ( = ?auto_144575 ?auto_144578 ) ) ( not ( = ?auto_144576 ?auto_144577 ) ) ( not ( = ?auto_144576 ?auto_144578 ) ) ( not ( = ?auto_144577 ?auto_144578 ) ) ( ON ?auto_144576 ?auto_144577 ) ( CLEAR ?auto_144574 ) ( ON ?auto_144575 ?auto_144576 ) ( CLEAR ?auto_144575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144569 ?auto_144570 ?auto_144571 ?auto_144572 ?auto_144573 ?auto_144574 ?auto_144575 )
      ( MAKE-9PILE ?auto_144569 ?auto_144570 ?auto_144571 ?auto_144572 ?auto_144573 ?auto_144574 ?auto_144575 ?auto_144576 ?auto_144577 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_144588 - BLOCK
      ?auto_144589 - BLOCK
      ?auto_144590 - BLOCK
      ?auto_144591 - BLOCK
      ?auto_144592 - BLOCK
      ?auto_144593 - BLOCK
      ?auto_144594 - BLOCK
      ?auto_144595 - BLOCK
      ?auto_144596 - BLOCK
    )
    :vars
    (
      ?auto_144597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144596 ?auto_144597 ) ( ON-TABLE ?auto_144588 ) ( ON ?auto_144589 ?auto_144588 ) ( ON ?auto_144590 ?auto_144589 ) ( ON ?auto_144591 ?auto_144590 ) ( ON ?auto_144592 ?auto_144591 ) ( ON ?auto_144593 ?auto_144592 ) ( not ( = ?auto_144588 ?auto_144589 ) ) ( not ( = ?auto_144588 ?auto_144590 ) ) ( not ( = ?auto_144588 ?auto_144591 ) ) ( not ( = ?auto_144588 ?auto_144592 ) ) ( not ( = ?auto_144588 ?auto_144593 ) ) ( not ( = ?auto_144588 ?auto_144594 ) ) ( not ( = ?auto_144588 ?auto_144595 ) ) ( not ( = ?auto_144588 ?auto_144596 ) ) ( not ( = ?auto_144588 ?auto_144597 ) ) ( not ( = ?auto_144589 ?auto_144590 ) ) ( not ( = ?auto_144589 ?auto_144591 ) ) ( not ( = ?auto_144589 ?auto_144592 ) ) ( not ( = ?auto_144589 ?auto_144593 ) ) ( not ( = ?auto_144589 ?auto_144594 ) ) ( not ( = ?auto_144589 ?auto_144595 ) ) ( not ( = ?auto_144589 ?auto_144596 ) ) ( not ( = ?auto_144589 ?auto_144597 ) ) ( not ( = ?auto_144590 ?auto_144591 ) ) ( not ( = ?auto_144590 ?auto_144592 ) ) ( not ( = ?auto_144590 ?auto_144593 ) ) ( not ( = ?auto_144590 ?auto_144594 ) ) ( not ( = ?auto_144590 ?auto_144595 ) ) ( not ( = ?auto_144590 ?auto_144596 ) ) ( not ( = ?auto_144590 ?auto_144597 ) ) ( not ( = ?auto_144591 ?auto_144592 ) ) ( not ( = ?auto_144591 ?auto_144593 ) ) ( not ( = ?auto_144591 ?auto_144594 ) ) ( not ( = ?auto_144591 ?auto_144595 ) ) ( not ( = ?auto_144591 ?auto_144596 ) ) ( not ( = ?auto_144591 ?auto_144597 ) ) ( not ( = ?auto_144592 ?auto_144593 ) ) ( not ( = ?auto_144592 ?auto_144594 ) ) ( not ( = ?auto_144592 ?auto_144595 ) ) ( not ( = ?auto_144592 ?auto_144596 ) ) ( not ( = ?auto_144592 ?auto_144597 ) ) ( not ( = ?auto_144593 ?auto_144594 ) ) ( not ( = ?auto_144593 ?auto_144595 ) ) ( not ( = ?auto_144593 ?auto_144596 ) ) ( not ( = ?auto_144593 ?auto_144597 ) ) ( not ( = ?auto_144594 ?auto_144595 ) ) ( not ( = ?auto_144594 ?auto_144596 ) ) ( not ( = ?auto_144594 ?auto_144597 ) ) ( not ( = ?auto_144595 ?auto_144596 ) ) ( not ( = ?auto_144595 ?auto_144597 ) ) ( not ( = ?auto_144596 ?auto_144597 ) ) ( ON ?auto_144595 ?auto_144596 ) ( CLEAR ?auto_144593 ) ( ON ?auto_144594 ?auto_144595 ) ( CLEAR ?auto_144594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144588 ?auto_144589 ?auto_144590 ?auto_144591 ?auto_144592 ?auto_144593 ?auto_144594 )
      ( MAKE-9PILE ?auto_144588 ?auto_144589 ?auto_144590 ?auto_144591 ?auto_144592 ?auto_144593 ?auto_144594 ?auto_144595 ?auto_144596 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_144607 - BLOCK
      ?auto_144608 - BLOCK
      ?auto_144609 - BLOCK
      ?auto_144610 - BLOCK
      ?auto_144611 - BLOCK
      ?auto_144612 - BLOCK
      ?auto_144613 - BLOCK
      ?auto_144614 - BLOCK
      ?auto_144615 - BLOCK
    )
    :vars
    (
      ?auto_144616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144615 ?auto_144616 ) ( ON-TABLE ?auto_144607 ) ( ON ?auto_144608 ?auto_144607 ) ( ON ?auto_144609 ?auto_144608 ) ( ON ?auto_144610 ?auto_144609 ) ( ON ?auto_144611 ?auto_144610 ) ( not ( = ?auto_144607 ?auto_144608 ) ) ( not ( = ?auto_144607 ?auto_144609 ) ) ( not ( = ?auto_144607 ?auto_144610 ) ) ( not ( = ?auto_144607 ?auto_144611 ) ) ( not ( = ?auto_144607 ?auto_144612 ) ) ( not ( = ?auto_144607 ?auto_144613 ) ) ( not ( = ?auto_144607 ?auto_144614 ) ) ( not ( = ?auto_144607 ?auto_144615 ) ) ( not ( = ?auto_144607 ?auto_144616 ) ) ( not ( = ?auto_144608 ?auto_144609 ) ) ( not ( = ?auto_144608 ?auto_144610 ) ) ( not ( = ?auto_144608 ?auto_144611 ) ) ( not ( = ?auto_144608 ?auto_144612 ) ) ( not ( = ?auto_144608 ?auto_144613 ) ) ( not ( = ?auto_144608 ?auto_144614 ) ) ( not ( = ?auto_144608 ?auto_144615 ) ) ( not ( = ?auto_144608 ?auto_144616 ) ) ( not ( = ?auto_144609 ?auto_144610 ) ) ( not ( = ?auto_144609 ?auto_144611 ) ) ( not ( = ?auto_144609 ?auto_144612 ) ) ( not ( = ?auto_144609 ?auto_144613 ) ) ( not ( = ?auto_144609 ?auto_144614 ) ) ( not ( = ?auto_144609 ?auto_144615 ) ) ( not ( = ?auto_144609 ?auto_144616 ) ) ( not ( = ?auto_144610 ?auto_144611 ) ) ( not ( = ?auto_144610 ?auto_144612 ) ) ( not ( = ?auto_144610 ?auto_144613 ) ) ( not ( = ?auto_144610 ?auto_144614 ) ) ( not ( = ?auto_144610 ?auto_144615 ) ) ( not ( = ?auto_144610 ?auto_144616 ) ) ( not ( = ?auto_144611 ?auto_144612 ) ) ( not ( = ?auto_144611 ?auto_144613 ) ) ( not ( = ?auto_144611 ?auto_144614 ) ) ( not ( = ?auto_144611 ?auto_144615 ) ) ( not ( = ?auto_144611 ?auto_144616 ) ) ( not ( = ?auto_144612 ?auto_144613 ) ) ( not ( = ?auto_144612 ?auto_144614 ) ) ( not ( = ?auto_144612 ?auto_144615 ) ) ( not ( = ?auto_144612 ?auto_144616 ) ) ( not ( = ?auto_144613 ?auto_144614 ) ) ( not ( = ?auto_144613 ?auto_144615 ) ) ( not ( = ?auto_144613 ?auto_144616 ) ) ( not ( = ?auto_144614 ?auto_144615 ) ) ( not ( = ?auto_144614 ?auto_144616 ) ) ( not ( = ?auto_144615 ?auto_144616 ) ) ( ON ?auto_144614 ?auto_144615 ) ( ON ?auto_144613 ?auto_144614 ) ( CLEAR ?auto_144611 ) ( ON ?auto_144612 ?auto_144613 ) ( CLEAR ?auto_144612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144607 ?auto_144608 ?auto_144609 ?auto_144610 ?auto_144611 ?auto_144612 )
      ( MAKE-9PILE ?auto_144607 ?auto_144608 ?auto_144609 ?auto_144610 ?auto_144611 ?auto_144612 ?auto_144613 ?auto_144614 ?auto_144615 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_144626 - BLOCK
      ?auto_144627 - BLOCK
      ?auto_144628 - BLOCK
      ?auto_144629 - BLOCK
      ?auto_144630 - BLOCK
      ?auto_144631 - BLOCK
      ?auto_144632 - BLOCK
      ?auto_144633 - BLOCK
      ?auto_144634 - BLOCK
    )
    :vars
    (
      ?auto_144635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144634 ?auto_144635 ) ( ON-TABLE ?auto_144626 ) ( ON ?auto_144627 ?auto_144626 ) ( ON ?auto_144628 ?auto_144627 ) ( ON ?auto_144629 ?auto_144628 ) ( ON ?auto_144630 ?auto_144629 ) ( not ( = ?auto_144626 ?auto_144627 ) ) ( not ( = ?auto_144626 ?auto_144628 ) ) ( not ( = ?auto_144626 ?auto_144629 ) ) ( not ( = ?auto_144626 ?auto_144630 ) ) ( not ( = ?auto_144626 ?auto_144631 ) ) ( not ( = ?auto_144626 ?auto_144632 ) ) ( not ( = ?auto_144626 ?auto_144633 ) ) ( not ( = ?auto_144626 ?auto_144634 ) ) ( not ( = ?auto_144626 ?auto_144635 ) ) ( not ( = ?auto_144627 ?auto_144628 ) ) ( not ( = ?auto_144627 ?auto_144629 ) ) ( not ( = ?auto_144627 ?auto_144630 ) ) ( not ( = ?auto_144627 ?auto_144631 ) ) ( not ( = ?auto_144627 ?auto_144632 ) ) ( not ( = ?auto_144627 ?auto_144633 ) ) ( not ( = ?auto_144627 ?auto_144634 ) ) ( not ( = ?auto_144627 ?auto_144635 ) ) ( not ( = ?auto_144628 ?auto_144629 ) ) ( not ( = ?auto_144628 ?auto_144630 ) ) ( not ( = ?auto_144628 ?auto_144631 ) ) ( not ( = ?auto_144628 ?auto_144632 ) ) ( not ( = ?auto_144628 ?auto_144633 ) ) ( not ( = ?auto_144628 ?auto_144634 ) ) ( not ( = ?auto_144628 ?auto_144635 ) ) ( not ( = ?auto_144629 ?auto_144630 ) ) ( not ( = ?auto_144629 ?auto_144631 ) ) ( not ( = ?auto_144629 ?auto_144632 ) ) ( not ( = ?auto_144629 ?auto_144633 ) ) ( not ( = ?auto_144629 ?auto_144634 ) ) ( not ( = ?auto_144629 ?auto_144635 ) ) ( not ( = ?auto_144630 ?auto_144631 ) ) ( not ( = ?auto_144630 ?auto_144632 ) ) ( not ( = ?auto_144630 ?auto_144633 ) ) ( not ( = ?auto_144630 ?auto_144634 ) ) ( not ( = ?auto_144630 ?auto_144635 ) ) ( not ( = ?auto_144631 ?auto_144632 ) ) ( not ( = ?auto_144631 ?auto_144633 ) ) ( not ( = ?auto_144631 ?auto_144634 ) ) ( not ( = ?auto_144631 ?auto_144635 ) ) ( not ( = ?auto_144632 ?auto_144633 ) ) ( not ( = ?auto_144632 ?auto_144634 ) ) ( not ( = ?auto_144632 ?auto_144635 ) ) ( not ( = ?auto_144633 ?auto_144634 ) ) ( not ( = ?auto_144633 ?auto_144635 ) ) ( not ( = ?auto_144634 ?auto_144635 ) ) ( ON ?auto_144633 ?auto_144634 ) ( ON ?auto_144632 ?auto_144633 ) ( CLEAR ?auto_144630 ) ( ON ?auto_144631 ?auto_144632 ) ( CLEAR ?auto_144631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_144626 ?auto_144627 ?auto_144628 ?auto_144629 ?auto_144630 ?auto_144631 )
      ( MAKE-9PILE ?auto_144626 ?auto_144627 ?auto_144628 ?auto_144629 ?auto_144630 ?auto_144631 ?auto_144632 ?auto_144633 ?auto_144634 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_144645 - BLOCK
      ?auto_144646 - BLOCK
      ?auto_144647 - BLOCK
      ?auto_144648 - BLOCK
      ?auto_144649 - BLOCK
      ?auto_144650 - BLOCK
      ?auto_144651 - BLOCK
      ?auto_144652 - BLOCK
      ?auto_144653 - BLOCK
    )
    :vars
    (
      ?auto_144654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144653 ?auto_144654 ) ( ON-TABLE ?auto_144645 ) ( ON ?auto_144646 ?auto_144645 ) ( ON ?auto_144647 ?auto_144646 ) ( ON ?auto_144648 ?auto_144647 ) ( not ( = ?auto_144645 ?auto_144646 ) ) ( not ( = ?auto_144645 ?auto_144647 ) ) ( not ( = ?auto_144645 ?auto_144648 ) ) ( not ( = ?auto_144645 ?auto_144649 ) ) ( not ( = ?auto_144645 ?auto_144650 ) ) ( not ( = ?auto_144645 ?auto_144651 ) ) ( not ( = ?auto_144645 ?auto_144652 ) ) ( not ( = ?auto_144645 ?auto_144653 ) ) ( not ( = ?auto_144645 ?auto_144654 ) ) ( not ( = ?auto_144646 ?auto_144647 ) ) ( not ( = ?auto_144646 ?auto_144648 ) ) ( not ( = ?auto_144646 ?auto_144649 ) ) ( not ( = ?auto_144646 ?auto_144650 ) ) ( not ( = ?auto_144646 ?auto_144651 ) ) ( not ( = ?auto_144646 ?auto_144652 ) ) ( not ( = ?auto_144646 ?auto_144653 ) ) ( not ( = ?auto_144646 ?auto_144654 ) ) ( not ( = ?auto_144647 ?auto_144648 ) ) ( not ( = ?auto_144647 ?auto_144649 ) ) ( not ( = ?auto_144647 ?auto_144650 ) ) ( not ( = ?auto_144647 ?auto_144651 ) ) ( not ( = ?auto_144647 ?auto_144652 ) ) ( not ( = ?auto_144647 ?auto_144653 ) ) ( not ( = ?auto_144647 ?auto_144654 ) ) ( not ( = ?auto_144648 ?auto_144649 ) ) ( not ( = ?auto_144648 ?auto_144650 ) ) ( not ( = ?auto_144648 ?auto_144651 ) ) ( not ( = ?auto_144648 ?auto_144652 ) ) ( not ( = ?auto_144648 ?auto_144653 ) ) ( not ( = ?auto_144648 ?auto_144654 ) ) ( not ( = ?auto_144649 ?auto_144650 ) ) ( not ( = ?auto_144649 ?auto_144651 ) ) ( not ( = ?auto_144649 ?auto_144652 ) ) ( not ( = ?auto_144649 ?auto_144653 ) ) ( not ( = ?auto_144649 ?auto_144654 ) ) ( not ( = ?auto_144650 ?auto_144651 ) ) ( not ( = ?auto_144650 ?auto_144652 ) ) ( not ( = ?auto_144650 ?auto_144653 ) ) ( not ( = ?auto_144650 ?auto_144654 ) ) ( not ( = ?auto_144651 ?auto_144652 ) ) ( not ( = ?auto_144651 ?auto_144653 ) ) ( not ( = ?auto_144651 ?auto_144654 ) ) ( not ( = ?auto_144652 ?auto_144653 ) ) ( not ( = ?auto_144652 ?auto_144654 ) ) ( not ( = ?auto_144653 ?auto_144654 ) ) ( ON ?auto_144652 ?auto_144653 ) ( ON ?auto_144651 ?auto_144652 ) ( ON ?auto_144650 ?auto_144651 ) ( CLEAR ?auto_144648 ) ( ON ?auto_144649 ?auto_144650 ) ( CLEAR ?auto_144649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144645 ?auto_144646 ?auto_144647 ?auto_144648 ?auto_144649 )
      ( MAKE-9PILE ?auto_144645 ?auto_144646 ?auto_144647 ?auto_144648 ?auto_144649 ?auto_144650 ?auto_144651 ?auto_144652 ?auto_144653 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_144664 - BLOCK
      ?auto_144665 - BLOCK
      ?auto_144666 - BLOCK
      ?auto_144667 - BLOCK
      ?auto_144668 - BLOCK
      ?auto_144669 - BLOCK
      ?auto_144670 - BLOCK
      ?auto_144671 - BLOCK
      ?auto_144672 - BLOCK
    )
    :vars
    (
      ?auto_144673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144672 ?auto_144673 ) ( ON-TABLE ?auto_144664 ) ( ON ?auto_144665 ?auto_144664 ) ( ON ?auto_144666 ?auto_144665 ) ( ON ?auto_144667 ?auto_144666 ) ( not ( = ?auto_144664 ?auto_144665 ) ) ( not ( = ?auto_144664 ?auto_144666 ) ) ( not ( = ?auto_144664 ?auto_144667 ) ) ( not ( = ?auto_144664 ?auto_144668 ) ) ( not ( = ?auto_144664 ?auto_144669 ) ) ( not ( = ?auto_144664 ?auto_144670 ) ) ( not ( = ?auto_144664 ?auto_144671 ) ) ( not ( = ?auto_144664 ?auto_144672 ) ) ( not ( = ?auto_144664 ?auto_144673 ) ) ( not ( = ?auto_144665 ?auto_144666 ) ) ( not ( = ?auto_144665 ?auto_144667 ) ) ( not ( = ?auto_144665 ?auto_144668 ) ) ( not ( = ?auto_144665 ?auto_144669 ) ) ( not ( = ?auto_144665 ?auto_144670 ) ) ( not ( = ?auto_144665 ?auto_144671 ) ) ( not ( = ?auto_144665 ?auto_144672 ) ) ( not ( = ?auto_144665 ?auto_144673 ) ) ( not ( = ?auto_144666 ?auto_144667 ) ) ( not ( = ?auto_144666 ?auto_144668 ) ) ( not ( = ?auto_144666 ?auto_144669 ) ) ( not ( = ?auto_144666 ?auto_144670 ) ) ( not ( = ?auto_144666 ?auto_144671 ) ) ( not ( = ?auto_144666 ?auto_144672 ) ) ( not ( = ?auto_144666 ?auto_144673 ) ) ( not ( = ?auto_144667 ?auto_144668 ) ) ( not ( = ?auto_144667 ?auto_144669 ) ) ( not ( = ?auto_144667 ?auto_144670 ) ) ( not ( = ?auto_144667 ?auto_144671 ) ) ( not ( = ?auto_144667 ?auto_144672 ) ) ( not ( = ?auto_144667 ?auto_144673 ) ) ( not ( = ?auto_144668 ?auto_144669 ) ) ( not ( = ?auto_144668 ?auto_144670 ) ) ( not ( = ?auto_144668 ?auto_144671 ) ) ( not ( = ?auto_144668 ?auto_144672 ) ) ( not ( = ?auto_144668 ?auto_144673 ) ) ( not ( = ?auto_144669 ?auto_144670 ) ) ( not ( = ?auto_144669 ?auto_144671 ) ) ( not ( = ?auto_144669 ?auto_144672 ) ) ( not ( = ?auto_144669 ?auto_144673 ) ) ( not ( = ?auto_144670 ?auto_144671 ) ) ( not ( = ?auto_144670 ?auto_144672 ) ) ( not ( = ?auto_144670 ?auto_144673 ) ) ( not ( = ?auto_144671 ?auto_144672 ) ) ( not ( = ?auto_144671 ?auto_144673 ) ) ( not ( = ?auto_144672 ?auto_144673 ) ) ( ON ?auto_144671 ?auto_144672 ) ( ON ?auto_144670 ?auto_144671 ) ( ON ?auto_144669 ?auto_144670 ) ( CLEAR ?auto_144667 ) ( ON ?auto_144668 ?auto_144669 ) ( CLEAR ?auto_144668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_144664 ?auto_144665 ?auto_144666 ?auto_144667 ?auto_144668 )
      ( MAKE-9PILE ?auto_144664 ?auto_144665 ?auto_144666 ?auto_144667 ?auto_144668 ?auto_144669 ?auto_144670 ?auto_144671 ?auto_144672 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_144683 - BLOCK
      ?auto_144684 - BLOCK
      ?auto_144685 - BLOCK
      ?auto_144686 - BLOCK
      ?auto_144687 - BLOCK
      ?auto_144688 - BLOCK
      ?auto_144689 - BLOCK
      ?auto_144690 - BLOCK
      ?auto_144691 - BLOCK
    )
    :vars
    (
      ?auto_144692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144691 ?auto_144692 ) ( ON-TABLE ?auto_144683 ) ( ON ?auto_144684 ?auto_144683 ) ( ON ?auto_144685 ?auto_144684 ) ( not ( = ?auto_144683 ?auto_144684 ) ) ( not ( = ?auto_144683 ?auto_144685 ) ) ( not ( = ?auto_144683 ?auto_144686 ) ) ( not ( = ?auto_144683 ?auto_144687 ) ) ( not ( = ?auto_144683 ?auto_144688 ) ) ( not ( = ?auto_144683 ?auto_144689 ) ) ( not ( = ?auto_144683 ?auto_144690 ) ) ( not ( = ?auto_144683 ?auto_144691 ) ) ( not ( = ?auto_144683 ?auto_144692 ) ) ( not ( = ?auto_144684 ?auto_144685 ) ) ( not ( = ?auto_144684 ?auto_144686 ) ) ( not ( = ?auto_144684 ?auto_144687 ) ) ( not ( = ?auto_144684 ?auto_144688 ) ) ( not ( = ?auto_144684 ?auto_144689 ) ) ( not ( = ?auto_144684 ?auto_144690 ) ) ( not ( = ?auto_144684 ?auto_144691 ) ) ( not ( = ?auto_144684 ?auto_144692 ) ) ( not ( = ?auto_144685 ?auto_144686 ) ) ( not ( = ?auto_144685 ?auto_144687 ) ) ( not ( = ?auto_144685 ?auto_144688 ) ) ( not ( = ?auto_144685 ?auto_144689 ) ) ( not ( = ?auto_144685 ?auto_144690 ) ) ( not ( = ?auto_144685 ?auto_144691 ) ) ( not ( = ?auto_144685 ?auto_144692 ) ) ( not ( = ?auto_144686 ?auto_144687 ) ) ( not ( = ?auto_144686 ?auto_144688 ) ) ( not ( = ?auto_144686 ?auto_144689 ) ) ( not ( = ?auto_144686 ?auto_144690 ) ) ( not ( = ?auto_144686 ?auto_144691 ) ) ( not ( = ?auto_144686 ?auto_144692 ) ) ( not ( = ?auto_144687 ?auto_144688 ) ) ( not ( = ?auto_144687 ?auto_144689 ) ) ( not ( = ?auto_144687 ?auto_144690 ) ) ( not ( = ?auto_144687 ?auto_144691 ) ) ( not ( = ?auto_144687 ?auto_144692 ) ) ( not ( = ?auto_144688 ?auto_144689 ) ) ( not ( = ?auto_144688 ?auto_144690 ) ) ( not ( = ?auto_144688 ?auto_144691 ) ) ( not ( = ?auto_144688 ?auto_144692 ) ) ( not ( = ?auto_144689 ?auto_144690 ) ) ( not ( = ?auto_144689 ?auto_144691 ) ) ( not ( = ?auto_144689 ?auto_144692 ) ) ( not ( = ?auto_144690 ?auto_144691 ) ) ( not ( = ?auto_144690 ?auto_144692 ) ) ( not ( = ?auto_144691 ?auto_144692 ) ) ( ON ?auto_144690 ?auto_144691 ) ( ON ?auto_144689 ?auto_144690 ) ( ON ?auto_144688 ?auto_144689 ) ( ON ?auto_144687 ?auto_144688 ) ( CLEAR ?auto_144685 ) ( ON ?auto_144686 ?auto_144687 ) ( CLEAR ?auto_144686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144683 ?auto_144684 ?auto_144685 ?auto_144686 )
      ( MAKE-9PILE ?auto_144683 ?auto_144684 ?auto_144685 ?auto_144686 ?auto_144687 ?auto_144688 ?auto_144689 ?auto_144690 ?auto_144691 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_144702 - BLOCK
      ?auto_144703 - BLOCK
      ?auto_144704 - BLOCK
      ?auto_144705 - BLOCK
      ?auto_144706 - BLOCK
      ?auto_144707 - BLOCK
      ?auto_144708 - BLOCK
      ?auto_144709 - BLOCK
      ?auto_144710 - BLOCK
    )
    :vars
    (
      ?auto_144711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144710 ?auto_144711 ) ( ON-TABLE ?auto_144702 ) ( ON ?auto_144703 ?auto_144702 ) ( ON ?auto_144704 ?auto_144703 ) ( not ( = ?auto_144702 ?auto_144703 ) ) ( not ( = ?auto_144702 ?auto_144704 ) ) ( not ( = ?auto_144702 ?auto_144705 ) ) ( not ( = ?auto_144702 ?auto_144706 ) ) ( not ( = ?auto_144702 ?auto_144707 ) ) ( not ( = ?auto_144702 ?auto_144708 ) ) ( not ( = ?auto_144702 ?auto_144709 ) ) ( not ( = ?auto_144702 ?auto_144710 ) ) ( not ( = ?auto_144702 ?auto_144711 ) ) ( not ( = ?auto_144703 ?auto_144704 ) ) ( not ( = ?auto_144703 ?auto_144705 ) ) ( not ( = ?auto_144703 ?auto_144706 ) ) ( not ( = ?auto_144703 ?auto_144707 ) ) ( not ( = ?auto_144703 ?auto_144708 ) ) ( not ( = ?auto_144703 ?auto_144709 ) ) ( not ( = ?auto_144703 ?auto_144710 ) ) ( not ( = ?auto_144703 ?auto_144711 ) ) ( not ( = ?auto_144704 ?auto_144705 ) ) ( not ( = ?auto_144704 ?auto_144706 ) ) ( not ( = ?auto_144704 ?auto_144707 ) ) ( not ( = ?auto_144704 ?auto_144708 ) ) ( not ( = ?auto_144704 ?auto_144709 ) ) ( not ( = ?auto_144704 ?auto_144710 ) ) ( not ( = ?auto_144704 ?auto_144711 ) ) ( not ( = ?auto_144705 ?auto_144706 ) ) ( not ( = ?auto_144705 ?auto_144707 ) ) ( not ( = ?auto_144705 ?auto_144708 ) ) ( not ( = ?auto_144705 ?auto_144709 ) ) ( not ( = ?auto_144705 ?auto_144710 ) ) ( not ( = ?auto_144705 ?auto_144711 ) ) ( not ( = ?auto_144706 ?auto_144707 ) ) ( not ( = ?auto_144706 ?auto_144708 ) ) ( not ( = ?auto_144706 ?auto_144709 ) ) ( not ( = ?auto_144706 ?auto_144710 ) ) ( not ( = ?auto_144706 ?auto_144711 ) ) ( not ( = ?auto_144707 ?auto_144708 ) ) ( not ( = ?auto_144707 ?auto_144709 ) ) ( not ( = ?auto_144707 ?auto_144710 ) ) ( not ( = ?auto_144707 ?auto_144711 ) ) ( not ( = ?auto_144708 ?auto_144709 ) ) ( not ( = ?auto_144708 ?auto_144710 ) ) ( not ( = ?auto_144708 ?auto_144711 ) ) ( not ( = ?auto_144709 ?auto_144710 ) ) ( not ( = ?auto_144709 ?auto_144711 ) ) ( not ( = ?auto_144710 ?auto_144711 ) ) ( ON ?auto_144709 ?auto_144710 ) ( ON ?auto_144708 ?auto_144709 ) ( ON ?auto_144707 ?auto_144708 ) ( ON ?auto_144706 ?auto_144707 ) ( CLEAR ?auto_144704 ) ( ON ?auto_144705 ?auto_144706 ) ( CLEAR ?auto_144705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_144702 ?auto_144703 ?auto_144704 ?auto_144705 )
      ( MAKE-9PILE ?auto_144702 ?auto_144703 ?auto_144704 ?auto_144705 ?auto_144706 ?auto_144707 ?auto_144708 ?auto_144709 ?auto_144710 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_144721 - BLOCK
      ?auto_144722 - BLOCK
      ?auto_144723 - BLOCK
      ?auto_144724 - BLOCK
      ?auto_144725 - BLOCK
      ?auto_144726 - BLOCK
      ?auto_144727 - BLOCK
      ?auto_144728 - BLOCK
      ?auto_144729 - BLOCK
    )
    :vars
    (
      ?auto_144730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144729 ?auto_144730 ) ( ON-TABLE ?auto_144721 ) ( ON ?auto_144722 ?auto_144721 ) ( not ( = ?auto_144721 ?auto_144722 ) ) ( not ( = ?auto_144721 ?auto_144723 ) ) ( not ( = ?auto_144721 ?auto_144724 ) ) ( not ( = ?auto_144721 ?auto_144725 ) ) ( not ( = ?auto_144721 ?auto_144726 ) ) ( not ( = ?auto_144721 ?auto_144727 ) ) ( not ( = ?auto_144721 ?auto_144728 ) ) ( not ( = ?auto_144721 ?auto_144729 ) ) ( not ( = ?auto_144721 ?auto_144730 ) ) ( not ( = ?auto_144722 ?auto_144723 ) ) ( not ( = ?auto_144722 ?auto_144724 ) ) ( not ( = ?auto_144722 ?auto_144725 ) ) ( not ( = ?auto_144722 ?auto_144726 ) ) ( not ( = ?auto_144722 ?auto_144727 ) ) ( not ( = ?auto_144722 ?auto_144728 ) ) ( not ( = ?auto_144722 ?auto_144729 ) ) ( not ( = ?auto_144722 ?auto_144730 ) ) ( not ( = ?auto_144723 ?auto_144724 ) ) ( not ( = ?auto_144723 ?auto_144725 ) ) ( not ( = ?auto_144723 ?auto_144726 ) ) ( not ( = ?auto_144723 ?auto_144727 ) ) ( not ( = ?auto_144723 ?auto_144728 ) ) ( not ( = ?auto_144723 ?auto_144729 ) ) ( not ( = ?auto_144723 ?auto_144730 ) ) ( not ( = ?auto_144724 ?auto_144725 ) ) ( not ( = ?auto_144724 ?auto_144726 ) ) ( not ( = ?auto_144724 ?auto_144727 ) ) ( not ( = ?auto_144724 ?auto_144728 ) ) ( not ( = ?auto_144724 ?auto_144729 ) ) ( not ( = ?auto_144724 ?auto_144730 ) ) ( not ( = ?auto_144725 ?auto_144726 ) ) ( not ( = ?auto_144725 ?auto_144727 ) ) ( not ( = ?auto_144725 ?auto_144728 ) ) ( not ( = ?auto_144725 ?auto_144729 ) ) ( not ( = ?auto_144725 ?auto_144730 ) ) ( not ( = ?auto_144726 ?auto_144727 ) ) ( not ( = ?auto_144726 ?auto_144728 ) ) ( not ( = ?auto_144726 ?auto_144729 ) ) ( not ( = ?auto_144726 ?auto_144730 ) ) ( not ( = ?auto_144727 ?auto_144728 ) ) ( not ( = ?auto_144727 ?auto_144729 ) ) ( not ( = ?auto_144727 ?auto_144730 ) ) ( not ( = ?auto_144728 ?auto_144729 ) ) ( not ( = ?auto_144728 ?auto_144730 ) ) ( not ( = ?auto_144729 ?auto_144730 ) ) ( ON ?auto_144728 ?auto_144729 ) ( ON ?auto_144727 ?auto_144728 ) ( ON ?auto_144726 ?auto_144727 ) ( ON ?auto_144725 ?auto_144726 ) ( ON ?auto_144724 ?auto_144725 ) ( CLEAR ?auto_144722 ) ( ON ?auto_144723 ?auto_144724 ) ( CLEAR ?auto_144723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144721 ?auto_144722 ?auto_144723 )
      ( MAKE-9PILE ?auto_144721 ?auto_144722 ?auto_144723 ?auto_144724 ?auto_144725 ?auto_144726 ?auto_144727 ?auto_144728 ?auto_144729 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_144740 - BLOCK
      ?auto_144741 - BLOCK
      ?auto_144742 - BLOCK
      ?auto_144743 - BLOCK
      ?auto_144744 - BLOCK
      ?auto_144745 - BLOCK
      ?auto_144746 - BLOCK
      ?auto_144747 - BLOCK
      ?auto_144748 - BLOCK
    )
    :vars
    (
      ?auto_144749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144748 ?auto_144749 ) ( ON-TABLE ?auto_144740 ) ( ON ?auto_144741 ?auto_144740 ) ( not ( = ?auto_144740 ?auto_144741 ) ) ( not ( = ?auto_144740 ?auto_144742 ) ) ( not ( = ?auto_144740 ?auto_144743 ) ) ( not ( = ?auto_144740 ?auto_144744 ) ) ( not ( = ?auto_144740 ?auto_144745 ) ) ( not ( = ?auto_144740 ?auto_144746 ) ) ( not ( = ?auto_144740 ?auto_144747 ) ) ( not ( = ?auto_144740 ?auto_144748 ) ) ( not ( = ?auto_144740 ?auto_144749 ) ) ( not ( = ?auto_144741 ?auto_144742 ) ) ( not ( = ?auto_144741 ?auto_144743 ) ) ( not ( = ?auto_144741 ?auto_144744 ) ) ( not ( = ?auto_144741 ?auto_144745 ) ) ( not ( = ?auto_144741 ?auto_144746 ) ) ( not ( = ?auto_144741 ?auto_144747 ) ) ( not ( = ?auto_144741 ?auto_144748 ) ) ( not ( = ?auto_144741 ?auto_144749 ) ) ( not ( = ?auto_144742 ?auto_144743 ) ) ( not ( = ?auto_144742 ?auto_144744 ) ) ( not ( = ?auto_144742 ?auto_144745 ) ) ( not ( = ?auto_144742 ?auto_144746 ) ) ( not ( = ?auto_144742 ?auto_144747 ) ) ( not ( = ?auto_144742 ?auto_144748 ) ) ( not ( = ?auto_144742 ?auto_144749 ) ) ( not ( = ?auto_144743 ?auto_144744 ) ) ( not ( = ?auto_144743 ?auto_144745 ) ) ( not ( = ?auto_144743 ?auto_144746 ) ) ( not ( = ?auto_144743 ?auto_144747 ) ) ( not ( = ?auto_144743 ?auto_144748 ) ) ( not ( = ?auto_144743 ?auto_144749 ) ) ( not ( = ?auto_144744 ?auto_144745 ) ) ( not ( = ?auto_144744 ?auto_144746 ) ) ( not ( = ?auto_144744 ?auto_144747 ) ) ( not ( = ?auto_144744 ?auto_144748 ) ) ( not ( = ?auto_144744 ?auto_144749 ) ) ( not ( = ?auto_144745 ?auto_144746 ) ) ( not ( = ?auto_144745 ?auto_144747 ) ) ( not ( = ?auto_144745 ?auto_144748 ) ) ( not ( = ?auto_144745 ?auto_144749 ) ) ( not ( = ?auto_144746 ?auto_144747 ) ) ( not ( = ?auto_144746 ?auto_144748 ) ) ( not ( = ?auto_144746 ?auto_144749 ) ) ( not ( = ?auto_144747 ?auto_144748 ) ) ( not ( = ?auto_144747 ?auto_144749 ) ) ( not ( = ?auto_144748 ?auto_144749 ) ) ( ON ?auto_144747 ?auto_144748 ) ( ON ?auto_144746 ?auto_144747 ) ( ON ?auto_144745 ?auto_144746 ) ( ON ?auto_144744 ?auto_144745 ) ( ON ?auto_144743 ?auto_144744 ) ( CLEAR ?auto_144741 ) ( ON ?auto_144742 ?auto_144743 ) ( CLEAR ?auto_144742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_144740 ?auto_144741 ?auto_144742 )
      ( MAKE-9PILE ?auto_144740 ?auto_144741 ?auto_144742 ?auto_144743 ?auto_144744 ?auto_144745 ?auto_144746 ?auto_144747 ?auto_144748 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_144759 - BLOCK
      ?auto_144760 - BLOCK
      ?auto_144761 - BLOCK
      ?auto_144762 - BLOCK
      ?auto_144763 - BLOCK
      ?auto_144764 - BLOCK
      ?auto_144765 - BLOCK
      ?auto_144766 - BLOCK
      ?auto_144767 - BLOCK
    )
    :vars
    (
      ?auto_144768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144767 ?auto_144768 ) ( ON-TABLE ?auto_144759 ) ( not ( = ?auto_144759 ?auto_144760 ) ) ( not ( = ?auto_144759 ?auto_144761 ) ) ( not ( = ?auto_144759 ?auto_144762 ) ) ( not ( = ?auto_144759 ?auto_144763 ) ) ( not ( = ?auto_144759 ?auto_144764 ) ) ( not ( = ?auto_144759 ?auto_144765 ) ) ( not ( = ?auto_144759 ?auto_144766 ) ) ( not ( = ?auto_144759 ?auto_144767 ) ) ( not ( = ?auto_144759 ?auto_144768 ) ) ( not ( = ?auto_144760 ?auto_144761 ) ) ( not ( = ?auto_144760 ?auto_144762 ) ) ( not ( = ?auto_144760 ?auto_144763 ) ) ( not ( = ?auto_144760 ?auto_144764 ) ) ( not ( = ?auto_144760 ?auto_144765 ) ) ( not ( = ?auto_144760 ?auto_144766 ) ) ( not ( = ?auto_144760 ?auto_144767 ) ) ( not ( = ?auto_144760 ?auto_144768 ) ) ( not ( = ?auto_144761 ?auto_144762 ) ) ( not ( = ?auto_144761 ?auto_144763 ) ) ( not ( = ?auto_144761 ?auto_144764 ) ) ( not ( = ?auto_144761 ?auto_144765 ) ) ( not ( = ?auto_144761 ?auto_144766 ) ) ( not ( = ?auto_144761 ?auto_144767 ) ) ( not ( = ?auto_144761 ?auto_144768 ) ) ( not ( = ?auto_144762 ?auto_144763 ) ) ( not ( = ?auto_144762 ?auto_144764 ) ) ( not ( = ?auto_144762 ?auto_144765 ) ) ( not ( = ?auto_144762 ?auto_144766 ) ) ( not ( = ?auto_144762 ?auto_144767 ) ) ( not ( = ?auto_144762 ?auto_144768 ) ) ( not ( = ?auto_144763 ?auto_144764 ) ) ( not ( = ?auto_144763 ?auto_144765 ) ) ( not ( = ?auto_144763 ?auto_144766 ) ) ( not ( = ?auto_144763 ?auto_144767 ) ) ( not ( = ?auto_144763 ?auto_144768 ) ) ( not ( = ?auto_144764 ?auto_144765 ) ) ( not ( = ?auto_144764 ?auto_144766 ) ) ( not ( = ?auto_144764 ?auto_144767 ) ) ( not ( = ?auto_144764 ?auto_144768 ) ) ( not ( = ?auto_144765 ?auto_144766 ) ) ( not ( = ?auto_144765 ?auto_144767 ) ) ( not ( = ?auto_144765 ?auto_144768 ) ) ( not ( = ?auto_144766 ?auto_144767 ) ) ( not ( = ?auto_144766 ?auto_144768 ) ) ( not ( = ?auto_144767 ?auto_144768 ) ) ( ON ?auto_144766 ?auto_144767 ) ( ON ?auto_144765 ?auto_144766 ) ( ON ?auto_144764 ?auto_144765 ) ( ON ?auto_144763 ?auto_144764 ) ( ON ?auto_144762 ?auto_144763 ) ( ON ?auto_144761 ?auto_144762 ) ( CLEAR ?auto_144759 ) ( ON ?auto_144760 ?auto_144761 ) ( CLEAR ?auto_144760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144759 ?auto_144760 )
      ( MAKE-9PILE ?auto_144759 ?auto_144760 ?auto_144761 ?auto_144762 ?auto_144763 ?auto_144764 ?auto_144765 ?auto_144766 ?auto_144767 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_144778 - BLOCK
      ?auto_144779 - BLOCK
      ?auto_144780 - BLOCK
      ?auto_144781 - BLOCK
      ?auto_144782 - BLOCK
      ?auto_144783 - BLOCK
      ?auto_144784 - BLOCK
      ?auto_144785 - BLOCK
      ?auto_144786 - BLOCK
    )
    :vars
    (
      ?auto_144787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144786 ?auto_144787 ) ( ON-TABLE ?auto_144778 ) ( not ( = ?auto_144778 ?auto_144779 ) ) ( not ( = ?auto_144778 ?auto_144780 ) ) ( not ( = ?auto_144778 ?auto_144781 ) ) ( not ( = ?auto_144778 ?auto_144782 ) ) ( not ( = ?auto_144778 ?auto_144783 ) ) ( not ( = ?auto_144778 ?auto_144784 ) ) ( not ( = ?auto_144778 ?auto_144785 ) ) ( not ( = ?auto_144778 ?auto_144786 ) ) ( not ( = ?auto_144778 ?auto_144787 ) ) ( not ( = ?auto_144779 ?auto_144780 ) ) ( not ( = ?auto_144779 ?auto_144781 ) ) ( not ( = ?auto_144779 ?auto_144782 ) ) ( not ( = ?auto_144779 ?auto_144783 ) ) ( not ( = ?auto_144779 ?auto_144784 ) ) ( not ( = ?auto_144779 ?auto_144785 ) ) ( not ( = ?auto_144779 ?auto_144786 ) ) ( not ( = ?auto_144779 ?auto_144787 ) ) ( not ( = ?auto_144780 ?auto_144781 ) ) ( not ( = ?auto_144780 ?auto_144782 ) ) ( not ( = ?auto_144780 ?auto_144783 ) ) ( not ( = ?auto_144780 ?auto_144784 ) ) ( not ( = ?auto_144780 ?auto_144785 ) ) ( not ( = ?auto_144780 ?auto_144786 ) ) ( not ( = ?auto_144780 ?auto_144787 ) ) ( not ( = ?auto_144781 ?auto_144782 ) ) ( not ( = ?auto_144781 ?auto_144783 ) ) ( not ( = ?auto_144781 ?auto_144784 ) ) ( not ( = ?auto_144781 ?auto_144785 ) ) ( not ( = ?auto_144781 ?auto_144786 ) ) ( not ( = ?auto_144781 ?auto_144787 ) ) ( not ( = ?auto_144782 ?auto_144783 ) ) ( not ( = ?auto_144782 ?auto_144784 ) ) ( not ( = ?auto_144782 ?auto_144785 ) ) ( not ( = ?auto_144782 ?auto_144786 ) ) ( not ( = ?auto_144782 ?auto_144787 ) ) ( not ( = ?auto_144783 ?auto_144784 ) ) ( not ( = ?auto_144783 ?auto_144785 ) ) ( not ( = ?auto_144783 ?auto_144786 ) ) ( not ( = ?auto_144783 ?auto_144787 ) ) ( not ( = ?auto_144784 ?auto_144785 ) ) ( not ( = ?auto_144784 ?auto_144786 ) ) ( not ( = ?auto_144784 ?auto_144787 ) ) ( not ( = ?auto_144785 ?auto_144786 ) ) ( not ( = ?auto_144785 ?auto_144787 ) ) ( not ( = ?auto_144786 ?auto_144787 ) ) ( ON ?auto_144785 ?auto_144786 ) ( ON ?auto_144784 ?auto_144785 ) ( ON ?auto_144783 ?auto_144784 ) ( ON ?auto_144782 ?auto_144783 ) ( ON ?auto_144781 ?auto_144782 ) ( ON ?auto_144780 ?auto_144781 ) ( CLEAR ?auto_144778 ) ( ON ?auto_144779 ?auto_144780 ) ( CLEAR ?auto_144779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_144778 ?auto_144779 )
      ( MAKE-9PILE ?auto_144778 ?auto_144779 ?auto_144780 ?auto_144781 ?auto_144782 ?auto_144783 ?auto_144784 ?auto_144785 ?auto_144786 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_144797 - BLOCK
      ?auto_144798 - BLOCK
      ?auto_144799 - BLOCK
      ?auto_144800 - BLOCK
      ?auto_144801 - BLOCK
      ?auto_144802 - BLOCK
      ?auto_144803 - BLOCK
      ?auto_144804 - BLOCK
      ?auto_144805 - BLOCK
    )
    :vars
    (
      ?auto_144806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144805 ?auto_144806 ) ( not ( = ?auto_144797 ?auto_144798 ) ) ( not ( = ?auto_144797 ?auto_144799 ) ) ( not ( = ?auto_144797 ?auto_144800 ) ) ( not ( = ?auto_144797 ?auto_144801 ) ) ( not ( = ?auto_144797 ?auto_144802 ) ) ( not ( = ?auto_144797 ?auto_144803 ) ) ( not ( = ?auto_144797 ?auto_144804 ) ) ( not ( = ?auto_144797 ?auto_144805 ) ) ( not ( = ?auto_144797 ?auto_144806 ) ) ( not ( = ?auto_144798 ?auto_144799 ) ) ( not ( = ?auto_144798 ?auto_144800 ) ) ( not ( = ?auto_144798 ?auto_144801 ) ) ( not ( = ?auto_144798 ?auto_144802 ) ) ( not ( = ?auto_144798 ?auto_144803 ) ) ( not ( = ?auto_144798 ?auto_144804 ) ) ( not ( = ?auto_144798 ?auto_144805 ) ) ( not ( = ?auto_144798 ?auto_144806 ) ) ( not ( = ?auto_144799 ?auto_144800 ) ) ( not ( = ?auto_144799 ?auto_144801 ) ) ( not ( = ?auto_144799 ?auto_144802 ) ) ( not ( = ?auto_144799 ?auto_144803 ) ) ( not ( = ?auto_144799 ?auto_144804 ) ) ( not ( = ?auto_144799 ?auto_144805 ) ) ( not ( = ?auto_144799 ?auto_144806 ) ) ( not ( = ?auto_144800 ?auto_144801 ) ) ( not ( = ?auto_144800 ?auto_144802 ) ) ( not ( = ?auto_144800 ?auto_144803 ) ) ( not ( = ?auto_144800 ?auto_144804 ) ) ( not ( = ?auto_144800 ?auto_144805 ) ) ( not ( = ?auto_144800 ?auto_144806 ) ) ( not ( = ?auto_144801 ?auto_144802 ) ) ( not ( = ?auto_144801 ?auto_144803 ) ) ( not ( = ?auto_144801 ?auto_144804 ) ) ( not ( = ?auto_144801 ?auto_144805 ) ) ( not ( = ?auto_144801 ?auto_144806 ) ) ( not ( = ?auto_144802 ?auto_144803 ) ) ( not ( = ?auto_144802 ?auto_144804 ) ) ( not ( = ?auto_144802 ?auto_144805 ) ) ( not ( = ?auto_144802 ?auto_144806 ) ) ( not ( = ?auto_144803 ?auto_144804 ) ) ( not ( = ?auto_144803 ?auto_144805 ) ) ( not ( = ?auto_144803 ?auto_144806 ) ) ( not ( = ?auto_144804 ?auto_144805 ) ) ( not ( = ?auto_144804 ?auto_144806 ) ) ( not ( = ?auto_144805 ?auto_144806 ) ) ( ON ?auto_144804 ?auto_144805 ) ( ON ?auto_144803 ?auto_144804 ) ( ON ?auto_144802 ?auto_144803 ) ( ON ?auto_144801 ?auto_144802 ) ( ON ?auto_144800 ?auto_144801 ) ( ON ?auto_144799 ?auto_144800 ) ( ON ?auto_144798 ?auto_144799 ) ( ON ?auto_144797 ?auto_144798 ) ( CLEAR ?auto_144797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_144797 )
      ( MAKE-9PILE ?auto_144797 ?auto_144798 ?auto_144799 ?auto_144800 ?auto_144801 ?auto_144802 ?auto_144803 ?auto_144804 ?auto_144805 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_144816 - BLOCK
      ?auto_144817 - BLOCK
      ?auto_144818 - BLOCK
      ?auto_144819 - BLOCK
      ?auto_144820 - BLOCK
      ?auto_144821 - BLOCK
      ?auto_144822 - BLOCK
      ?auto_144823 - BLOCK
      ?auto_144824 - BLOCK
    )
    :vars
    (
      ?auto_144825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144824 ?auto_144825 ) ( not ( = ?auto_144816 ?auto_144817 ) ) ( not ( = ?auto_144816 ?auto_144818 ) ) ( not ( = ?auto_144816 ?auto_144819 ) ) ( not ( = ?auto_144816 ?auto_144820 ) ) ( not ( = ?auto_144816 ?auto_144821 ) ) ( not ( = ?auto_144816 ?auto_144822 ) ) ( not ( = ?auto_144816 ?auto_144823 ) ) ( not ( = ?auto_144816 ?auto_144824 ) ) ( not ( = ?auto_144816 ?auto_144825 ) ) ( not ( = ?auto_144817 ?auto_144818 ) ) ( not ( = ?auto_144817 ?auto_144819 ) ) ( not ( = ?auto_144817 ?auto_144820 ) ) ( not ( = ?auto_144817 ?auto_144821 ) ) ( not ( = ?auto_144817 ?auto_144822 ) ) ( not ( = ?auto_144817 ?auto_144823 ) ) ( not ( = ?auto_144817 ?auto_144824 ) ) ( not ( = ?auto_144817 ?auto_144825 ) ) ( not ( = ?auto_144818 ?auto_144819 ) ) ( not ( = ?auto_144818 ?auto_144820 ) ) ( not ( = ?auto_144818 ?auto_144821 ) ) ( not ( = ?auto_144818 ?auto_144822 ) ) ( not ( = ?auto_144818 ?auto_144823 ) ) ( not ( = ?auto_144818 ?auto_144824 ) ) ( not ( = ?auto_144818 ?auto_144825 ) ) ( not ( = ?auto_144819 ?auto_144820 ) ) ( not ( = ?auto_144819 ?auto_144821 ) ) ( not ( = ?auto_144819 ?auto_144822 ) ) ( not ( = ?auto_144819 ?auto_144823 ) ) ( not ( = ?auto_144819 ?auto_144824 ) ) ( not ( = ?auto_144819 ?auto_144825 ) ) ( not ( = ?auto_144820 ?auto_144821 ) ) ( not ( = ?auto_144820 ?auto_144822 ) ) ( not ( = ?auto_144820 ?auto_144823 ) ) ( not ( = ?auto_144820 ?auto_144824 ) ) ( not ( = ?auto_144820 ?auto_144825 ) ) ( not ( = ?auto_144821 ?auto_144822 ) ) ( not ( = ?auto_144821 ?auto_144823 ) ) ( not ( = ?auto_144821 ?auto_144824 ) ) ( not ( = ?auto_144821 ?auto_144825 ) ) ( not ( = ?auto_144822 ?auto_144823 ) ) ( not ( = ?auto_144822 ?auto_144824 ) ) ( not ( = ?auto_144822 ?auto_144825 ) ) ( not ( = ?auto_144823 ?auto_144824 ) ) ( not ( = ?auto_144823 ?auto_144825 ) ) ( not ( = ?auto_144824 ?auto_144825 ) ) ( ON ?auto_144823 ?auto_144824 ) ( ON ?auto_144822 ?auto_144823 ) ( ON ?auto_144821 ?auto_144822 ) ( ON ?auto_144820 ?auto_144821 ) ( ON ?auto_144819 ?auto_144820 ) ( ON ?auto_144818 ?auto_144819 ) ( ON ?auto_144817 ?auto_144818 ) ( ON ?auto_144816 ?auto_144817 ) ( CLEAR ?auto_144816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_144816 )
      ( MAKE-9PILE ?auto_144816 ?auto_144817 ?auto_144818 ?auto_144819 ?auto_144820 ?auto_144821 ?auto_144822 ?auto_144823 ?auto_144824 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_144836 - BLOCK
      ?auto_144837 - BLOCK
      ?auto_144838 - BLOCK
      ?auto_144839 - BLOCK
      ?auto_144840 - BLOCK
      ?auto_144841 - BLOCK
      ?auto_144842 - BLOCK
      ?auto_144843 - BLOCK
      ?auto_144844 - BLOCK
      ?auto_144845 - BLOCK
    )
    :vars
    (
      ?auto_144846 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_144844 ) ( ON ?auto_144845 ?auto_144846 ) ( CLEAR ?auto_144845 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_144836 ) ( ON ?auto_144837 ?auto_144836 ) ( ON ?auto_144838 ?auto_144837 ) ( ON ?auto_144839 ?auto_144838 ) ( ON ?auto_144840 ?auto_144839 ) ( ON ?auto_144841 ?auto_144840 ) ( ON ?auto_144842 ?auto_144841 ) ( ON ?auto_144843 ?auto_144842 ) ( ON ?auto_144844 ?auto_144843 ) ( not ( = ?auto_144836 ?auto_144837 ) ) ( not ( = ?auto_144836 ?auto_144838 ) ) ( not ( = ?auto_144836 ?auto_144839 ) ) ( not ( = ?auto_144836 ?auto_144840 ) ) ( not ( = ?auto_144836 ?auto_144841 ) ) ( not ( = ?auto_144836 ?auto_144842 ) ) ( not ( = ?auto_144836 ?auto_144843 ) ) ( not ( = ?auto_144836 ?auto_144844 ) ) ( not ( = ?auto_144836 ?auto_144845 ) ) ( not ( = ?auto_144836 ?auto_144846 ) ) ( not ( = ?auto_144837 ?auto_144838 ) ) ( not ( = ?auto_144837 ?auto_144839 ) ) ( not ( = ?auto_144837 ?auto_144840 ) ) ( not ( = ?auto_144837 ?auto_144841 ) ) ( not ( = ?auto_144837 ?auto_144842 ) ) ( not ( = ?auto_144837 ?auto_144843 ) ) ( not ( = ?auto_144837 ?auto_144844 ) ) ( not ( = ?auto_144837 ?auto_144845 ) ) ( not ( = ?auto_144837 ?auto_144846 ) ) ( not ( = ?auto_144838 ?auto_144839 ) ) ( not ( = ?auto_144838 ?auto_144840 ) ) ( not ( = ?auto_144838 ?auto_144841 ) ) ( not ( = ?auto_144838 ?auto_144842 ) ) ( not ( = ?auto_144838 ?auto_144843 ) ) ( not ( = ?auto_144838 ?auto_144844 ) ) ( not ( = ?auto_144838 ?auto_144845 ) ) ( not ( = ?auto_144838 ?auto_144846 ) ) ( not ( = ?auto_144839 ?auto_144840 ) ) ( not ( = ?auto_144839 ?auto_144841 ) ) ( not ( = ?auto_144839 ?auto_144842 ) ) ( not ( = ?auto_144839 ?auto_144843 ) ) ( not ( = ?auto_144839 ?auto_144844 ) ) ( not ( = ?auto_144839 ?auto_144845 ) ) ( not ( = ?auto_144839 ?auto_144846 ) ) ( not ( = ?auto_144840 ?auto_144841 ) ) ( not ( = ?auto_144840 ?auto_144842 ) ) ( not ( = ?auto_144840 ?auto_144843 ) ) ( not ( = ?auto_144840 ?auto_144844 ) ) ( not ( = ?auto_144840 ?auto_144845 ) ) ( not ( = ?auto_144840 ?auto_144846 ) ) ( not ( = ?auto_144841 ?auto_144842 ) ) ( not ( = ?auto_144841 ?auto_144843 ) ) ( not ( = ?auto_144841 ?auto_144844 ) ) ( not ( = ?auto_144841 ?auto_144845 ) ) ( not ( = ?auto_144841 ?auto_144846 ) ) ( not ( = ?auto_144842 ?auto_144843 ) ) ( not ( = ?auto_144842 ?auto_144844 ) ) ( not ( = ?auto_144842 ?auto_144845 ) ) ( not ( = ?auto_144842 ?auto_144846 ) ) ( not ( = ?auto_144843 ?auto_144844 ) ) ( not ( = ?auto_144843 ?auto_144845 ) ) ( not ( = ?auto_144843 ?auto_144846 ) ) ( not ( = ?auto_144844 ?auto_144845 ) ) ( not ( = ?auto_144844 ?auto_144846 ) ) ( not ( = ?auto_144845 ?auto_144846 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_144845 ?auto_144846 )
      ( !STACK ?auto_144845 ?auto_144844 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_144857 - BLOCK
      ?auto_144858 - BLOCK
      ?auto_144859 - BLOCK
      ?auto_144860 - BLOCK
      ?auto_144861 - BLOCK
      ?auto_144862 - BLOCK
      ?auto_144863 - BLOCK
      ?auto_144864 - BLOCK
      ?auto_144865 - BLOCK
      ?auto_144866 - BLOCK
    )
    :vars
    (
      ?auto_144867 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_144865 ) ( ON ?auto_144866 ?auto_144867 ) ( CLEAR ?auto_144866 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_144857 ) ( ON ?auto_144858 ?auto_144857 ) ( ON ?auto_144859 ?auto_144858 ) ( ON ?auto_144860 ?auto_144859 ) ( ON ?auto_144861 ?auto_144860 ) ( ON ?auto_144862 ?auto_144861 ) ( ON ?auto_144863 ?auto_144862 ) ( ON ?auto_144864 ?auto_144863 ) ( ON ?auto_144865 ?auto_144864 ) ( not ( = ?auto_144857 ?auto_144858 ) ) ( not ( = ?auto_144857 ?auto_144859 ) ) ( not ( = ?auto_144857 ?auto_144860 ) ) ( not ( = ?auto_144857 ?auto_144861 ) ) ( not ( = ?auto_144857 ?auto_144862 ) ) ( not ( = ?auto_144857 ?auto_144863 ) ) ( not ( = ?auto_144857 ?auto_144864 ) ) ( not ( = ?auto_144857 ?auto_144865 ) ) ( not ( = ?auto_144857 ?auto_144866 ) ) ( not ( = ?auto_144857 ?auto_144867 ) ) ( not ( = ?auto_144858 ?auto_144859 ) ) ( not ( = ?auto_144858 ?auto_144860 ) ) ( not ( = ?auto_144858 ?auto_144861 ) ) ( not ( = ?auto_144858 ?auto_144862 ) ) ( not ( = ?auto_144858 ?auto_144863 ) ) ( not ( = ?auto_144858 ?auto_144864 ) ) ( not ( = ?auto_144858 ?auto_144865 ) ) ( not ( = ?auto_144858 ?auto_144866 ) ) ( not ( = ?auto_144858 ?auto_144867 ) ) ( not ( = ?auto_144859 ?auto_144860 ) ) ( not ( = ?auto_144859 ?auto_144861 ) ) ( not ( = ?auto_144859 ?auto_144862 ) ) ( not ( = ?auto_144859 ?auto_144863 ) ) ( not ( = ?auto_144859 ?auto_144864 ) ) ( not ( = ?auto_144859 ?auto_144865 ) ) ( not ( = ?auto_144859 ?auto_144866 ) ) ( not ( = ?auto_144859 ?auto_144867 ) ) ( not ( = ?auto_144860 ?auto_144861 ) ) ( not ( = ?auto_144860 ?auto_144862 ) ) ( not ( = ?auto_144860 ?auto_144863 ) ) ( not ( = ?auto_144860 ?auto_144864 ) ) ( not ( = ?auto_144860 ?auto_144865 ) ) ( not ( = ?auto_144860 ?auto_144866 ) ) ( not ( = ?auto_144860 ?auto_144867 ) ) ( not ( = ?auto_144861 ?auto_144862 ) ) ( not ( = ?auto_144861 ?auto_144863 ) ) ( not ( = ?auto_144861 ?auto_144864 ) ) ( not ( = ?auto_144861 ?auto_144865 ) ) ( not ( = ?auto_144861 ?auto_144866 ) ) ( not ( = ?auto_144861 ?auto_144867 ) ) ( not ( = ?auto_144862 ?auto_144863 ) ) ( not ( = ?auto_144862 ?auto_144864 ) ) ( not ( = ?auto_144862 ?auto_144865 ) ) ( not ( = ?auto_144862 ?auto_144866 ) ) ( not ( = ?auto_144862 ?auto_144867 ) ) ( not ( = ?auto_144863 ?auto_144864 ) ) ( not ( = ?auto_144863 ?auto_144865 ) ) ( not ( = ?auto_144863 ?auto_144866 ) ) ( not ( = ?auto_144863 ?auto_144867 ) ) ( not ( = ?auto_144864 ?auto_144865 ) ) ( not ( = ?auto_144864 ?auto_144866 ) ) ( not ( = ?auto_144864 ?auto_144867 ) ) ( not ( = ?auto_144865 ?auto_144866 ) ) ( not ( = ?auto_144865 ?auto_144867 ) ) ( not ( = ?auto_144866 ?auto_144867 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_144866 ?auto_144867 )
      ( !STACK ?auto_144866 ?auto_144865 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_144878 - BLOCK
      ?auto_144879 - BLOCK
      ?auto_144880 - BLOCK
      ?auto_144881 - BLOCK
      ?auto_144882 - BLOCK
      ?auto_144883 - BLOCK
      ?auto_144884 - BLOCK
      ?auto_144885 - BLOCK
      ?auto_144886 - BLOCK
      ?auto_144887 - BLOCK
    )
    :vars
    (
      ?auto_144888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144887 ?auto_144888 ) ( ON-TABLE ?auto_144878 ) ( ON ?auto_144879 ?auto_144878 ) ( ON ?auto_144880 ?auto_144879 ) ( ON ?auto_144881 ?auto_144880 ) ( ON ?auto_144882 ?auto_144881 ) ( ON ?auto_144883 ?auto_144882 ) ( ON ?auto_144884 ?auto_144883 ) ( ON ?auto_144885 ?auto_144884 ) ( not ( = ?auto_144878 ?auto_144879 ) ) ( not ( = ?auto_144878 ?auto_144880 ) ) ( not ( = ?auto_144878 ?auto_144881 ) ) ( not ( = ?auto_144878 ?auto_144882 ) ) ( not ( = ?auto_144878 ?auto_144883 ) ) ( not ( = ?auto_144878 ?auto_144884 ) ) ( not ( = ?auto_144878 ?auto_144885 ) ) ( not ( = ?auto_144878 ?auto_144886 ) ) ( not ( = ?auto_144878 ?auto_144887 ) ) ( not ( = ?auto_144878 ?auto_144888 ) ) ( not ( = ?auto_144879 ?auto_144880 ) ) ( not ( = ?auto_144879 ?auto_144881 ) ) ( not ( = ?auto_144879 ?auto_144882 ) ) ( not ( = ?auto_144879 ?auto_144883 ) ) ( not ( = ?auto_144879 ?auto_144884 ) ) ( not ( = ?auto_144879 ?auto_144885 ) ) ( not ( = ?auto_144879 ?auto_144886 ) ) ( not ( = ?auto_144879 ?auto_144887 ) ) ( not ( = ?auto_144879 ?auto_144888 ) ) ( not ( = ?auto_144880 ?auto_144881 ) ) ( not ( = ?auto_144880 ?auto_144882 ) ) ( not ( = ?auto_144880 ?auto_144883 ) ) ( not ( = ?auto_144880 ?auto_144884 ) ) ( not ( = ?auto_144880 ?auto_144885 ) ) ( not ( = ?auto_144880 ?auto_144886 ) ) ( not ( = ?auto_144880 ?auto_144887 ) ) ( not ( = ?auto_144880 ?auto_144888 ) ) ( not ( = ?auto_144881 ?auto_144882 ) ) ( not ( = ?auto_144881 ?auto_144883 ) ) ( not ( = ?auto_144881 ?auto_144884 ) ) ( not ( = ?auto_144881 ?auto_144885 ) ) ( not ( = ?auto_144881 ?auto_144886 ) ) ( not ( = ?auto_144881 ?auto_144887 ) ) ( not ( = ?auto_144881 ?auto_144888 ) ) ( not ( = ?auto_144882 ?auto_144883 ) ) ( not ( = ?auto_144882 ?auto_144884 ) ) ( not ( = ?auto_144882 ?auto_144885 ) ) ( not ( = ?auto_144882 ?auto_144886 ) ) ( not ( = ?auto_144882 ?auto_144887 ) ) ( not ( = ?auto_144882 ?auto_144888 ) ) ( not ( = ?auto_144883 ?auto_144884 ) ) ( not ( = ?auto_144883 ?auto_144885 ) ) ( not ( = ?auto_144883 ?auto_144886 ) ) ( not ( = ?auto_144883 ?auto_144887 ) ) ( not ( = ?auto_144883 ?auto_144888 ) ) ( not ( = ?auto_144884 ?auto_144885 ) ) ( not ( = ?auto_144884 ?auto_144886 ) ) ( not ( = ?auto_144884 ?auto_144887 ) ) ( not ( = ?auto_144884 ?auto_144888 ) ) ( not ( = ?auto_144885 ?auto_144886 ) ) ( not ( = ?auto_144885 ?auto_144887 ) ) ( not ( = ?auto_144885 ?auto_144888 ) ) ( not ( = ?auto_144886 ?auto_144887 ) ) ( not ( = ?auto_144886 ?auto_144888 ) ) ( not ( = ?auto_144887 ?auto_144888 ) ) ( CLEAR ?auto_144885 ) ( ON ?auto_144886 ?auto_144887 ) ( CLEAR ?auto_144886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_144878 ?auto_144879 ?auto_144880 ?auto_144881 ?auto_144882 ?auto_144883 ?auto_144884 ?auto_144885 ?auto_144886 )
      ( MAKE-10PILE ?auto_144878 ?auto_144879 ?auto_144880 ?auto_144881 ?auto_144882 ?auto_144883 ?auto_144884 ?auto_144885 ?auto_144886 ?auto_144887 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_144899 - BLOCK
      ?auto_144900 - BLOCK
      ?auto_144901 - BLOCK
      ?auto_144902 - BLOCK
      ?auto_144903 - BLOCK
      ?auto_144904 - BLOCK
      ?auto_144905 - BLOCK
      ?auto_144906 - BLOCK
      ?auto_144907 - BLOCK
      ?auto_144908 - BLOCK
    )
    :vars
    (
      ?auto_144909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144908 ?auto_144909 ) ( ON-TABLE ?auto_144899 ) ( ON ?auto_144900 ?auto_144899 ) ( ON ?auto_144901 ?auto_144900 ) ( ON ?auto_144902 ?auto_144901 ) ( ON ?auto_144903 ?auto_144902 ) ( ON ?auto_144904 ?auto_144903 ) ( ON ?auto_144905 ?auto_144904 ) ( ON ?auto_144906 ?auto_144905 ) ( not ( = ?auto_144899 ?auto_144900 ) ) ( not ( = ?auto_144899 ?auto_144901 ) ) ( not ( = ?auto_144899 ?auto_144902 ) ) ( not ( = ?auto_144899 ?auto_144903 ) ) ( not ( = ?auto_144899 ?auto_144904 ) ) ( not ( = ?auto_144899 ?auto_144905 ) ) ( not ( = ?auto_144899 ?auto_144906 ) ) ( not ( = ?auto_144899 ?auto_144907 ) ) ( not ( = ?auto_144899 ?auto_144908 ) ) ( not ( = ?auto_144899 ?auto_144909 ) ) ( not ( = ?auto_144900 ?auto_144901 ) ) ( not ( = ?auto_144900 ?auto_144902 ) ) ( not ( = ?auto_144900 ?auto_144903 ) ) ( not ( = ?auto_144900 ?auto_144904 ) ) ( not ( = ?auto_144900 ?auto_144905 ) ) ( not ( = ?auto_144900 ?auto_144906 ) ) ( not ( = ?auto_144900 ?auto_144907 ) ) ( not ( = ?auto_144900 ?auto_144908 ) ) ( not ( = ?auto_144900 ?auto_144909 ) ) ( not ( = ?auto_144901 ?auto_144902 ) ) ( not ( = ?auto_144901 ?auto_144903 ) ) ( not ( = ?auto_144901 ?auto_144904 ) ) ( not ( = ?auto_144901 ?auto_144905 ) ) ( not ( = ?auto_144901 ?auto_144906 ) ) ( not ( = ?auto_144901 ?auto_144907 ) ) ( not ( = ?auto_144901 ?auto_144908 ) ) ( not ( = ?auto_144901 ?auto_144909 ) ) ( not ( = ?auto_144902 ?auto_144903 ) ) ( not ( = ?auto_144902 ?auto_144904 ) ) ( not ( = ?auto_144902 ?auto_144905 ) ) ( not ( = ?auto_144902 ?auto_144906 ) ) ( not ( = ?auto_144902 ?auto_144907 ) ) ( not ( = ?auto_144902 ?auto_144908 ) ) ( not ( = ?auto_144902 ?auto_144909 ) ) ( not ( = ?auto_144903 ?auto_144904 ) ) ( not ( = ?auto_144903 ?auto_144905 ) ) ( not ( = ?auto_144903 ?auto_144906 ) ) ( not ( = ?auto_144903 ?auto_144907 ) ) ( not ( = ?auto_144903 ?auto_144908 ) ) ( not ( = ?auto_144903 ?auto_144909 ) ) ( not ( = ?auto_144904 ?auto_144905 ) ) ( not ( = ?auto_144904 ?auto_144906 ) ) ( not ( = ?auto_144904 ?auto_144907 ) ) ( not ( = ?auto_144904 ?auto_144908 ) ) ( not ( = ?auto_144904 ?auto_144909 ) ) ( not ( = ?auto_144905 ?auto_144906 ) ) ( not ( = ?auto_144905 ?auto_144907 ) ) ( not ( = ?auto_144905 ?auto_144908 ) ) ( not ( = ?auto_144905 ?auto_144909 ) ) ( not ( = ?auto_144906 ?auto_144907 ) ) ( not ( = ?auto_144906 ?auto_144908 ) ) ( not ( = ?auto_144906 ?auto_144909 ) ) ( not ( = ?auto_144907 ?auto_144908 ) ) ( not ( = ?auto_144907 ?auto_144909 ) ) ( not ( = ?auto_144908 ?auto_144909 ) ) ( CLEAR ?auto_144906 ) ( ON ?auto_144907 ?auto_144908 ) ( CLEAR ?auto_144907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_144899 ?auto_144900 ?auto_144901 ?auto_144902 ?auto_144903 ?auto_144904 ?auto_144905 ?auto_144906 ?auto_144907 )
      ( MAKE-10PILE ?auto_144899 ?auto_144900 ?auto_144901 ?auto_144902 ?auto_144903 ?auto_144904 ?auto_144905 ?auto_144906 ?auto_144907 ?auto_144908 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_144920 - BLOCK
      ?auto_144921 - BLOCK
      ?auto_144922 - BLOCK
      ?auto_144923 - BLOCK
      ?auto_144924 - BLOCK
      ?auto_144925 - BLOCK
      ?auto_144926 - BLOCK
      ?auto_144927 - BLOCK
      ?auto_144928 - BLOCK
      ?auto_144929 - BLOCK
    )
    :vars
    (
      ?auto_144930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144929 ?auto_144930 ) ( ON-TABLE ?auto_144920 ) ( ON ?auto_144921 ?auto_144920 ) ( ON ?auto_144922 ?auto_144921 ) ( ON ?auto_144923 ?auto_144922 ) ( ON ?auto_144924 ?auto_144923 ) ( ON ?auto_144925 ?auto_144924 ) ( ON ?auto_144926 ?auto_144925 ) ( not ( = ?auto_144920 ?auto_144921 ) ) ( not ( = ?auto_144920 ?auto_144922 ) ) ( not ( = ?auto_144920 ?auto_144923 ) ) ( not ( = ?auto_144920 ?auto_144924 ) ) ( not ( = ?auto_144920 ?auto_144925 ) ) ( not ( = ?auto_144920 ?auto_144926 ) ) ( not ( = ?auto_144920 ?auto_144927 ) ) ( not ( = ?auto_144920 ?auto_144928 ) ) ( not ( = ?auto_144920 ?auto_144929 ) ) ( not ( = ?auto_144920 ?auto_144930 ) ) ( not ( = ?auto_144921 ?auto_144922 ) ) ( not ( = ?auto_144921 ?auto_144923 ) ) ( not ( = ?auto_144921 ?auto_144924 ) ) ( not ( = ?auto_144921 ?auto_144925 ) ) ( not ( = ?auto_144921 ?auto_144926 ) ) ( not ( = ?auto_144921 ?auto_144927 ) ) ( not ( = ?auto_144921 ?auto_144928 ) ) ( not ( = ?auto_144921 ?auto_144929 ) ) ( not ( = ?auto_144921 ?auto_144930 ) ) ( not ( = ?auto_144922 ?auto_144923 ) ) ( not ( = ?auto_144922 ?auto_144924 ) ) ( not ( = ?auto_144922 ?auto_144925 ) ) ( not ( = ?auto_144922 ?auto_144926 ) ) ( not ( = ?auto_144922 ?auto_144927 ) ) ( not ( = ?auto_144922 ?auto_144928 ) ) ( not ( = ?auto_144922 ?auto_144929 ) ) ( not ( = ?auto_144922 ?auto_144930 ) ) ( not ( = ?auto_144923 ?auto_144924 ) ) ( not ( = ?auto_144923 ?auto_144925 ) ) ( not ( = ?auto_144923 ?auto_144926 ) ) ( not ( = ?auto_144923 ?auto_144927 ) ) ( not ( = ?auto_144923 ?auto_144928 ) ) ( not ( = ?auto_144923 ?auto_144929 ) ) ( not ( = ?auto_144923 ?auto_144930 ) ) ( not ( = ?auto_144924 ?auto_144925 ) ) ( not ( = ?auto_144924 ?auto_144926 ) ) ( not ( = ?auto_144924 ?auto_144927 ) ) ( not ( = ?auto_144924 ?auto_144928 ) ) ( not ( = ?auto_144924 ?auto_144929 ) ) ( not ( = ?auto_144924 ?auto_144930 ) ) ( not ( = ?auto_144925 ?auto_144926 ) ) ( not ( = ?auto_144925 ?auto_144927 ) ) ( not ( = ?auto_144925 ?auto_144928 ) ) ( not ( = ?auto_144925 ?auto_144929 ) ) ( not ( = ?auto_144925 ?auto_144930 ) ) ( not ( = ?auto_144926 ?auto_144927 ) ) ( not ( = ?auto_144926 ?auto_144928 ) ) ( not ( = ?auto_144926 ?auto_144929 ) ) ( not ( = ?auto_144926 ?auto_144930 ) ) ( not ( = ?auto_144927 ?auto_144928 ) ) ( not ( = ?auto_144927 ?auto_144929 ) ) ( not ( = ?auto_144927 ?auto_144930 ) ) ( not ( = ?auto_144928 ?auto_144929 ) ) ( not ( = ?auto_144928 ?auto_144930 ) ) ( not ( = ?auto_144929 ?auto_144930 ) ) ( ON ?auto_144928 ?auto_144929 ) ( CLEAR ?auto_144926 ) ( ON ?auto_144927 ?auto_144928 ) ( CLEAR ?auto_144927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_144920 ?auto_144921 ?auto_144922 ?auto_144923 ?auto_144924 ?auto_144925 ?auto_144926 ?auto_144927 )
      ( MAKE-10PILE ?auto_144920 ?auto_144921 ?auto_144922 ?auto_144923 ?auto_144924 ?auto_144925 ?auto_144926 ?auto_144927 ?auto_144928 ?auto_144929 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_144941 - BLOCK
      ?auto_144942 - BLOCK
      ?auto_144943 - BLOCK
      ?auto_144944 - BLOCK
      ?auto_144945 - BLOCK
      ?auto_144946 - BLOCK
      ?auto_144947 - BLOCK
      ?auto_144948 - BLOCK
      ?auto_144949 - BLOCK
      ?auto_144950 - BLOCK
    )
    :vars
    (
      ?auto_144951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144950 ?auto_144951 ) ( ON-TABLE ?auto_144941 ) ( ON ?auto_144942 ?auto_144941 ) ( ON ?auto_144943 ?auto_144942 ) ( ON ?auto_144944 ?auto_144943 ) ( ON ?auto_144945 ?auto_144944 ) ( ON ?auto_144946 ?auto_144945 ) ( ON ?auto_144947 ?auto_144946 ) ( not ( = ?auto_144941 ?auto_144942 ) ) ( not ( = ?auto_144941 ?auto_144943 ) ) ( not ( = ?auto_144941 ?auto_144944 ) ) ( not ( = ?auto_144941 ?auto_144945 ) ) ( not ( = ?auto_144941 ?auto_144946 ) ) ( not ( = ?auto_144941 ?auto_144947 ) ) ( not ( = ?auto_144941 ?auto_144948 ) ) ( not ( = ?auto_144941 ?auto_144949 ) ) ( not ( = ?auto_144941 ?auto_144950 ) ) ( not ( = ?auto_144941 ?auto_144951 ) ) ( not ( = ?auto_144942 ?auto_144943 ) ) ( not ( = ?auto_144942 ?auto_144944 ) ) ( not ( = ?auto_144942 ?auto_144945 ) ) ( not ( = ?auto_144942 ?auto_144946 ) ) ( not ( = ?auto_144942 ?auto_144947 ) ) ( not ( = ?auto_144942 ?auto_144948 ) ) ( not ( = ?auto_144942 ?auto_144949 ) ) ( not ( = ?auto_144942 ?auto_144950 ) ) ( not ( = ?auto_144942 ?auto_144951 ) ) ( not ( = ?auto_144943 ?auto_144944 ) ) ( not ( = ?auto_144943 ?auto_144945 ) ) ( not ( = ?auto_144943 ?auto_144946 ) ) ( not ( = ?auto_144943 ?auto_144947 ) ) ( not ( = ?auto_144943 ?auto_144948 ) ) ( not ( = ?auto_144943 ?auto_144949 ) ) ( not ( = ?auto_144943 ?auto_144950 ) ) ( not ( = ?auto_144943 ?auto_144951 ) ) ( not ( = ?auto_144944 ?auto_144945 ) ) ( not ( = ?auto_144944 ?auto_144946 ) ) ( not ( = ?auto_144944 ?auto_144947 ) ) ( not ( = ?auto_144944 ?auto_144948 ) ) ( not ( = ?auto_144944 ?auto_144949 ) ) ( not ( = ?auto_144944 ?auto_144950 ) ) ( not ( = ?auto_144944 ?auto_144951 ) ) ( not ( = ?auto_144945 ?auto_144946 ) ) ( not ( = ?auto_144945 ?auto_144947 ) ) ( not ( = ?auto_144945 ?auto_144948 ) ) ( not ( = ?auto_144945 ?auto_144949 ) ) ( not ( = ?auto_144945 ?auto_144950 ) ) ( not ( = ?auto_144945 ?auto_144951 ) ) ( not ( = ?auto_144946 ?auto_144947 ) ) ( not ( = ?auto_144946 ?auto_144948 ) ) ( not ( = ?auto_144946 ?auto_144949 ) ) ( not ( = ?auto_144946 ?auto_144950 ) ) ( not ( = ?auto_144946 ?auto_144951 ) ) ( not ( = ?auto_144947 ?auto_144948 ) ) ( not ( = ?auto_144947 ?auto_144949 ) ) ( not ( = ?auto_144947 ?auto_144950 ) ) ( not ( = ?auto_144947 ?auto_144951 ) ) ( not ( = ?auto_144948 ?auto_144949 ) ) ( not ( = ?auto_144948 ?auto_144950 ) ) ( not ( = ?auto_144948 ?auto_144951 ) ) ( not ( = ?auto_144949 ?auto_144950 ) ) ( not ( = ?auto_144949 ?auto_144951 ) ) ( not ( = ?auto_144950 ?auto_144951 ) ) ( ON ?auto_144949 ?auto_144950 ) ( CLEAR ?auto_144947 ) ( ON ?auto_144948 ?auto_144949 ) ( CLEAR ?auto_144948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_144941 ?auto_144942 ?auto_144943 ?auto_144944 ?auto_144945 ?auto_144946 ?auto_144947 ?auto_144948 )
      ( MAKE-10PILE ?auto_144941 ?auto_144942 ?auto_144943 ?auto_144944 ?auto_144945 ?auto_144946 ?auto_144947 ?auto_144948 ?auto_144949 ?auto_144950 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_144962 - BLOCK
      ?auto_144963 - BLOCK
      ?auto_144964 - BLOCK
      ?auto_144965 - BLOCK
      ?auto_144966 - BLOCK
      ?auto_144967 - BLOCK
      ?auto_144968 - BLOCK
      ?auto_144969 - BLOCK
      ?auto_144970 - BLOCK
      ?auto_144971 - BLOCK
    )
    :vars
    (
      ?auto_144972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144971 ?auto_144972 ) ( ON-TABLE ?auto_144962 ) ( ON ?auto_144963 ?auto_144962 ) ( ON ?auto_144964 ?auto_144963 ) ( ON ?auto_144965 ?auto_144964 ) ( ON ?auto_144966 ?auto_144965 ) ( ON ?auto_144967 ?auto_144966 ) ( not ( = ?auto_144962 ?auto_144963 ) ) ( not ( = ?auto_144962 ?auto_144964 ) ) ( not ( = ?auto_144962 ?auto_144965 ) ) ( not ( = ?auto_144962 ?auto_144966 ) ) ( not ( = ?auto_144962 ?auto_144967 ) ) ( not ( = ?auto_144962 ?auto_144968 ) ) ( not ( = ?auto_144962 ?auto_144969 ) ) ( not ( = ?auto_144962 ?auto_144970 ) ) ( not ( = ?auto_144962 ?auto_144971 ) ) ( not ( = ?auto_144962 ?auto_144972 ) ) ( not ( = ?auto_144963 ?auto_144964 ) ) ( not ( = ?auto_144963 ?auto_144965 ) ) ( not ( = ?auto_144963 ?auto_144966 ) ) ( not ( = ?auto_144963 ?auto_144967 ) ) ( not ( = ?auto_144963 ?auto_144968 ) ) ( not ( = ?auto_144963 ?auto_144969 ) ) ( not ( = ?auto_144963 ?auto_144970 ) ) ( not ( = ?auto_144963 ?auto_144971 ) ) ( not ( = ?auto_144963 ?auto_144972 ) ) ( not ( = ?auto_144964 ?auto_144965 ) ) ( not ( = ?auto_144964 ?auto_144966 ) ) ( not ( = ?auto_144964 ?auto_144967 ) ) ( not ( = ?auto_144964 ?auto_144968 ) ) ( not ( = ?auto_144964 ?auto_144969 ) ) ( not ( = ?auto_144964 ?auto_144970 ) ) ( not ( = ?auto_144964 ?auto_144971 ) ) ( not ( = ?auto_144964 ?auto_144972 ) ) ( not ( = ?auto_144965 ?auto_144966 ) ) ( not ( = ?auto_144965 ?auto_144967 ) ) ( not ( = ?auto_144965 ?auto_144968 ) ) ( not ( = ?auto_144965 ?auto_144969 ) ) ( not ( = ?auto_144965 ?auto_144970 ) ) ( not ( = ?auto_144965 ?auto_144971 ) ) ( not ( = ?auto_144965 ?auto_144972 ) ) ( not ( = ?auto_144966 ?auto_144967 ) ) ( not ( = ?auto_144966 ?auto_144968 ) ) ( not ( = ?auto_144966 ?auto_144969 ) ) ( not ( = ?auto_144966 ?auto_144970 ) ) ( not ( = ?auto_144966 ?auto_144971 ) ) ( not ( = ?auto_144966 ?auto_144972 ) ) ( not ( = ?auto_144967 ?auto_144968 ) ) ( not ( = ?auto_144967 ?auto_144969 ) ) ( not ( = ?auto_144967 ?auto_144970 ) ) ( not ( = ?auto_144967 ?auto_144971 ) ) ( not ( = ?auto_144967 ?auto_144972 ) ) ( not ( = ?auto_144968 ?auto_144969 ) ) ( not ( = ?auto_144968 ?auto_144970 ) ) ( not ( = ?auto_144968 ?auto_144971 ) ) ( not ( = ?auto_144968 ?auto_144972 ) ) ( not ( = ?auto_144969 ?auto_144970 ) ) ( not ( = ?auto_144969 ?auto_144971 ) ) ( not ( = ?auto_144969 ?auto_144972 ) ) ( not ( = ?auto_144970 ?auto_144971 ) ) ( not ( = ?auto_144970 ?auto_144972 ) ) ( not ( = ?auto_144971 ?auto_144972 ) ) ( ON ?auto_144970 ?auto_144971 ) ( ON ?auto_144969 ?auto_144970 ) ( CLEAR ?auto_144967 ) ( ON ?auto_144968 ?auto_144969 ) ( CLEAR ?auto_144968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144962 ?auto_144963 ?auto_144964 ?auto_144965 ?auto_144966 ?auto_144967 ?auto_144968 )
      ( MAKE-10PILE ?auto_144962 ?auto_144963 ?auto_144964 ?auto_144965 ?auto_144966 ?auto_144967 ?auto_144968 ?auto_144969 ?auto_144970 ?auto_144971 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_144983 - BLOCK
      ?auto_144984 - BLOCK
      ?auto_144985 - BLOCK
      ?auto_144986 - BLOCK
      ?auto_144987 - BLOCK
      ?auto_144988 - BLOCK
      ?auto_144989 - BLOCK
      ?auto_144990 - BLOCK
      ?auto_144991 - BLOCK
      ?auto_144992 - BLOCK
    )
    :vars
    (
      ?auto_144993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_144992 ?auto_144993 ) ( ON-TABLE ?auto_144983 ) ( ON ?auto_144984 ?auto_144983 ) ( ON ?auto_144985 ?auto_144984 ) ( ON ?auto_144986 ?auto_144985 ) ( ON ?auto_144987 ?auto_144986 ) ( ON ?auto_144988 ?auto_144987 ) ( not ( = ?auto_144983 ?auto_144984 ) ) ( not ( = ?auto_144983 ?auto_144985 ) ) ( not ( = ?auto_144983 ?auto_144986 ) ) ( not ( = ?auto_144983 ?auto_144987 ) ) ( not ( = ?auto_144983 ?auto_144988 ) ) ( not ( = ?auto_144983 ?auto_144989 ) ) ( not ( = ?auto_144983 ?auto_144990 ) ) ( not ( = ?auto_144983 ?auto_144991 ) ) ( not ( = ?auto_144983 ?auto_144992 ) ) ( not ( = ?auto_144983 ?auto_144993 ) ) ( not ( = ?auto_144984 ?auto_144985 ) ) ( not ( = ?auto_144984 ?auto_144986 ) ) ( not ( = ?auto_144984 ?auto_144987 ) ) ( not ( = ?auto_144984 ?auto_144988 ) ) ( not ( = ?auto_144984 ?auto_144989 ) ) ( not ( = ?auto_144984 ?auto_144990 ) ) ( not ( = ?auto_144984 ?auto_144991 ) ) ( not ( = ?auto_144984 ?auto_144992 ) ) ( not ( = ?auto_144984 ?auto_144993 ) ) ( not ( = ?auto_144985 ?auto_144986 ) ) ( not ( = ?auto_144985 ?auto_144987 ) ) ( not ( = ?auto_144985 ?auto_144988 ) ) ( not ( = ?auto_144985 ?auto_144989 ) ) ( not ( = ?auto_144985 ?auto_144990 ) ) ( not ( = ?auto_144985 ?auto_144991 ) ) ( not ( = ?auto_144985 ?auto_144992 ) ) ( not ( = ?auto_144985 ?auto_144993 ) ) ( not ( = ?auto_144986 ?auto_144987 ) ) ( not ( = ?auto_144986 ?auto_144988 ) ) ( not ( = ?auto_144986 ?auto_144989 ) ) ( not ( = ?auto_144986 ?auto_144990 ) ) ( not ( = ?auto_144986 ?auto_144991 ) ) ( not ( = ?auto_144986 ?auto_144992 ) ) ( not ( = ?auto_144986 ?auto_144993 ) ) ( not ( = ?auto_144987 ?auto_144988 ) ) ( not ( = ?auto_144987 ?auto_144989 ) ) ( not ( = ?auto_144987 ?auto_144990 ) ) ( not ( = ?auto_144987 ?auto_144991 ) ) ( not ( = ?auto_144987 ?auto_144992 ) ) ( not ( = ?auto_144987 ?auto_144993 ) ) ( not ( = ?auto_144988 ?auto_144989 ) ) ( not ( = ?auto_144988 ?auto_144990 ) ) ( not ( = ?auto_144988 ?auto_144991 ) ) ( not ( = ?auto_144988 ?auto_144992 ) ) ( not ( = ?auto_144988 ?auto_144993 ) ) ( not ( = ?auto_144989 ?auto_144990 ) ) ( not ( = ?auto_144989 ?auto_144991 ) ) ( not ( = ?auto_144989 ?auto_144992 ) ) ( not ( = ?auto_144989 ?auto_144993 ) ) ( not ( = ?auto_144990 ?auto_144991 ) ) ( not ( = ?auto_144990 ?auto_144992 ) ) ( not ( = ?auto_144990 ?auto_144993 ) ) ( not ( = ?auto_144991 ?auto_144992 ) ) ( not ( = ?auto_144991 ?auto_144993 ) ) ( not ( = ?auto_144992 ?auto_144993 ) ) ( ON ?auto_144991 ?auto_144992 ) ( ON ?auto_144990 ?auto_144991 ) ( CLEAR ?auto_144988 ) ( ON ?auto_144989 ?auto_144990 ) ( CLEAR ?auto_144989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_144983 ?auto_144984 ?auto_144985 ?auto_144986 ?auto_144987 ?auto_144988 ?auto_144989 )
      ( MAKE-10PILE ?auto_144983 ?auto_144984 ?auto_144985 ?auto_144986 ?auto_144987 ?auto_144988 ?auto_144989 ?auto_144990 ?auto_144991 ?auto_144992 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_145004 - BLOCK
      ?auto_145005 - BLOCK
      ?auto_145006 - BLOCK
      ?auto_145007 - BLOCK
      ?auto_145008 - BLOCK
      ?auto_145009 - BLOCK
      ?auto_145010 - BLOCK
      ?auto_145011 - BLOCK
      ?auto_145012 - BLOCK
      ?auto_145013 - BLOCK
    )
    :vars
    (
      ?auto_145014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145013 ?auto_145014 ) ( ON-TABLE ?auto_145004 ) ( ON ?auto_145005 ?auto_145004 ) ( ON ?auto_145006 ?auto_145005 ) ( ON ?auto_145007 ?auto_145006 ) ( ON ?auto_145008 ?auto_145007 ) ( not ( = ?auto_145004 ?auto_145005 ) ) ( not ( = ?auto_145004 ?auto_145006 ) ) ( not ( = ?auto_145004 ?auto_145007 ) ) ( not ( = ?auto_145004 ?auto_145008 ) ) ( not ( = ?auto_145004 ?auto_145009 ) ) ( not ( = ?auto_145004 ?auto_145010 ) ) ( not ( = ?auto_145004 ?auto_145011 ) ) ( not ( = ?auto_145004 ?auto_145012 ) ) ( not ( = ?auto_145004 ?auto_145013 ) ) ( not ( = ?auto_145004 ?auto_145014 ) ) ( not ( = ?auto_145005 ?auto_145006 ) ) ( not ( = ?auto_145005 ?auto_145007 ) ) ( not ( = ?auto_145005 ?auto_145008 ) ) ( not ( = ?auto_145005 ?auto_145009 ) ) ( not ( = ?auto_145005 ?auto_145010 ) ) ( not ( = ?auto_145005 ?auto_145011 ) ) ( not ( = ?auto_145005 ?auto_145012 ) ) ( not ( = ?auto_145005 ?auto_145013 ) ) ( not ( = ?auto_145005 ?auto_145014 ) ) ( not ( = ?auto_145006 ?auto_145007 ) ) ( not ( = ?auto_145006 ?auto_145008 ) ) ( not ( = ?auto_145006 ?auto_145009 ) ) ( not ( = ?auto_145006 ?auto_145010 ) ) ( not ( = ?auto_145006 ?auto_145011 ) ) ( not ( = ?auto_145006 ?auto_145012 ) ) ( not ( = ?auto_145006 ?auto_145013 ) ) ( not ( = ?auto_145006 ?auto_145014 ) ) ( not ( = ?auto_145007 ?auto_145008 ) ) ( not ( = ?auto_145007 ?auto_145009 ) ) ( not ( = ?auto_145007 ?auto_145010 ) ) ( not ( = ?auto_145007 ?auto_145011 ) ) ( not ( = ?auto_145007 ?auto_145012 ) ) ( not ( = ?auto_145007 ?auto_145013 ) ) ( not ( = ?auto_145007 ?auto_145014 ) ) ( not ( = ?auto_145008 ?auto_145009 ) ) ( not ( = ?auto_145008 ?auto_145010 ) ) ( not ( = ?auto_145008 ?auto_145011 ) ) ( not ( = ?auto_145008 ?auto_145012 ) ) ( not ( = ?auto_145008 ?auto_145013 ) ) ( not ( = ?auto_145008 ?auto_145014 ) ) ( not ( = ?auto_145009 ?auto_145010 ) ) ( not ( = ?auto_145009 ?auto_145011 ) ) ( not ( = ?auto_145009 ?auto_145012 ) ) ( not ( = ?auto_145009 ?auto_145013 ) ) ( not ( = ?auto_145009 ?auto_145014 ) ) ( not ( = ?auto_145010 ?auto_145011 ) ) ( not ( = ?auto_145010 ?auto_145012 ) ) ( not ( = ?auto_145010 ?auto_145013 ) ) ( not ( = ?auto_145010 ?auto_145014 ) ) ( not ( = ?auto_145011 ?auto_145012 ) ) ( not ( = ?auto_145011 ?auto_145013 ) ) ( not ( = ?auto_145011 ?auto_145014 ) ) ( not ( = ?auto_145012 ?auto_145013 ) ) ( not ( = ?auto_145012 ?auto_145014 ) ) ( not ( = ?auto_145013 ?auto_145014 ) ) ( ON ?auto_145012 ?auto_145013 ) ( ON ?auto_145011 ?auto_145012 ) ( ON ?auto_145010 ?auto_145011 ) ( CLEAR ?auto_145008 ) ( ON ?auto_145009 ?auto_145010 ) ( CLEAR ?auto_145009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145004 ?auto_145005 ?auto_145006 ?auto_145007 ?auto_145008 ?auto_145009 )
      ( MAKE-10PILE ?auto_145004 ?auto_145005 ?auto_145006 ?auto_145007 ?auto_145008 ?auto_145009 ?auto_145010 ?auto_145011 ?auto_145012 ?auto_145013 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_145025 - BLOCK
      ?auto_145026 - BLOCK
      ?auto_145027 - BLOCK
      ?auto_145028 - BLOCK
      ?auto_145029 - BLOCK
      ?auto_145030 - BLOCK
      ?auto_145031 - BLOCK
      ?auto_145032 - BLOCK
      ?auto_145033 - BLOCK
      ?auto_145034 - BLOCK
    )
    :vars
    (
      ?auto_145035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145034 ?auto_145035 ) ( ON-TABLE ?auto_145025 ) ( ON ?auto_145026 ?auto_145025 ) ( ON ?auto_145027 ?auto_145026 ) ( ON ?auto_145028 ?auto_145027 ) ( ON ?auto_145029 ?auto_145028 ) ( not ( = ?auto_145025 ?auto_145026 ) ) ( not ( = ?auto_145025 ?auto_145027 ) ) ( not ( = ?auto_145025 ?auto_145028 ) ) ( not ( = ?auto_145025 ?auto_145029 ) ) ( not ( = ?auto_145025 ?auto_145030 ) ) ( not ( = ?auto_145025 ?auto_145031 ) ) ( not ( = ?auto_145025 ?auto_145032 ) ) ( not ( = ?auto_145025 ?auto_145033 ) ) ( not ( = ?auto_145025 ?auto_145034 ) ) ( not ( = ?auto_145025 ?auto_145035 ) ) ( not ( = ?auto_145026 ?auto_145027 ) ) ( not ( = ?auto_145026 ?auto_145028 ) ) ( not ( = ?auto_145026 ?auto_145029 ) ) ( not ( = ?auto_145026 ?auto_145030 ) ) ( not ( = ?auto_145026 ?auto_145031 ) ) ( not ( = ?auto_145026 ?auto_145032 ) ) ( not ( = ?auto_145026 ?auto_145033 ) ) ( not ( = ?auto_145026 ?auto_145034 ) ) ( not ( = ?auto_145026 ?auto_145035 ) ) ( not ( = ?auto_145027 ?auto_145028 ) ) ( not ( = ?auto_145027 ?auto_145029 ) ) ( not ( = ?auto_145027 ?auto_145030 ) ) ( not ( = ?auto_145027 ?auto_145031 ) ) ( not ( = ?auto_145027 ?auto_145032 ) ) ( not ( = ?auto_145027 ?auto_145033 ) ) ( not ( = ?auto_145027 ?auto_145034 ) ) ( not ( = ?auto_145027 ?auto_145035 ) ) ( not ( = ?auto_145028 ?auto_145029 ) ) ( not ( = ?auto_145028 ?auto_145030 ) ) ( not ( = ?auto_145028 ?auto_145031 ) ) ( not ( = ?auto_145028 ?auto_145032 ) ) ( not ( = ?auto_145028 ?auto_145033 ) ) ( not ( = ?auto_145028 ?auto_145034 ) ) ( not ( = ?auto_145028 ?auto_145035 ) ) ( not ( = ?auto_145029 ?auto_145030 ) ) ( not ( = ?auto_145029 ?auto_145031 ) ) ( not ( = ?auto_145029 ?auto_145032 ) ) ( not ( = ?auto_145029 ?auto_145033 ) ) ( not ( = ?auto_145029 ?auto_145034 ) ) ( not ( = ?auto_145029 ?auto_145035 ) ) ( not ( = ?auto_145030 ?auto_145031 ) ) ( not ( = ?auto_145030 ?auto_145032 ) ) ( not ( = ?auto_145030 ?auto_145033 ) ) ( not ( = ?auto_145030 ?auto_145034 ) ) ( not ( = ?auto_145030 ?auto_145035 ) ) ( not ( = ?auto_145031 ?auto_145032 ) ) ( not ( = ?auto_145031 ?auto_145033 ) ) ( not ( = ?auto_145031 ?auto_145034 ) ) ( not ( = ?auto_145031 ?auto_145035 ) ) ( not ( = ?auto_145032 ?auto_145033 ) ) ( not ( = ?auto_145032 ?auto_145034 ) ) ( not ( = ?auto_145032 ?auto_145035 ) ) ( not ( = ?auto_145033 ?auto_145034 ) ) ( not ( = ?auto_145033 ?auto_145035 ) ) ( not ( = ?auto_145034 ?auto_145035 ) ) ( ON ?auto_145033 ?auto_145034 ) ( ON ?auto_145032 ?auto_145033 ) ( ON ?auto_145031 ?auto_145032 ) ( CLEAR ?auto_145029 ) ( ON ?auto_145030 ?auto_145031 ) ( CLEAR ?auto_145030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145025 ?auto_145026 ?auto_145027 ?auto_145028 ?auto_145029 ?auto_145030 )
      ( MAKE-10PILE ?auto_145025 ?auto_145026 ?auto_145027 ?auto_145028 ?auto_145029 ?auto_145030 ?auto_145031 ?auto_145032 ?auto_145033 ?auto_145034 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_145046 - BLOCK
      ?auto_145047 - BLOCK
      ?auto_145048 - BLOCK
      ?auto_145049 - BLOCK
      ?auto_145050 - BLOCK
      ?auto_145051 - BLOCK
      ?auto_145052 - BLOCK
      ?auto_145053 - BLOCK
      ?auto_145054 - BLOCK
      ?auto_145055 - BLOCK
    )
    :vars
    (
      ?auto_145056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145055 ?auto_145056 ) ( ON-TABLE ?auto_145046 ) ( ON ?auto_145047 ?auto_145046 ) ( ON ?auto_145048 ?auto_145047 ) ( ON ?auto_145049 ?auto_145048 ) ( not ( = ?auto_145046 ?auto_145047 ) ) ( not ( = ?auto_145046 ?auto_145048 ) ) ( not ( = ?auto_145046 ?auto_145049 ) ) ( not ( = ?auto_145046 ?auto_145050 ) ) ( not ( = ?auto_145046 ?auto_145051 ) ) ( not ( = ?auto_145046 ?auto_145052 ) ) ( not ( = ?auto_145046 ?auto_145053 ) ) ( not ( = ?auto_145046 ?auto_145054 ) ) ( not ( = ?auto_145046 ?auto_145055 ) ) ( not ( = ?auto_145046 ?auto_145056 ) ) ( not ( = ?auto_145047 ?auto_145048 ) ) ( not ( = ?auto_145047 ?auto_145049 ) ) ( not ( = ?auto_145047 ?auto_145050 ) ) ( not ( = ?auto_145047 ?auto_145051 ) ) ( not ( = ?auto_145047 ?auto_145052 ) ) ( not ( = ?auto_145047 ?auto_145053 ) ) ( not ( = ?auto_145047 ?auto_145054 ) ) ( not ( = ?auto_145047 ?auto_145055 ) ) ( not ( = ?auto_145047 ?auto_145056 ) ) ( not ( = ?auto_145048 ?auto_145049 ) ) ( not ( = ?auto_145048 ?auto_145050 ) ) ( not ( = ?auto_145048 ?auto_145051 ) ) ( not ( = ?auto_145048 ?auto_145052 ) ) ( not ( = ?auto_145048 ?auto_145053 ) ) ( not ( = ?auto_145048 ?auto_145054 ) ) ( not ( = ?auto_145048 ?auto_145055 ) ) ( not ( = ?auto_145048 ?auto_145056 ) ) ( not ( = ?auto_145049 ?auto_145050 ) ) ( not ( = ?auto_145049 ?auto_145051 ) ) ( not ( = ?auto_145049 ?auto_145052 ) ) ( not ( = ?auto_145049 ?auto_145053 ) ) ( not ( = ?auto_145049 ?auto_145054 ) ) ( not ( = ?auto_145049 ?auto_145055 ) ) ( not ( = ?auto_145049 ?auto_145056 ) ) ( not ( = ?auto_145050 ?auto_145051 ) ) ( not ( = ?auto_145050 ?auto_145052 ) ) ( not ( = ?auto_145050 ?auto_145053 ) ) ( not ( = ?auto_145050 ?auto_145054 ) ) ( not ( = ?auto_145050 ?auto_145055 ) ) ( not ( = ?auto_145050 ?auto_145056 ) ) ( not ( = ?auto_145051 ?auto_145052 ) ) ( not ( = ?auto_145051 ?auto_145053 ) ) ( not ( = ?auto_145051 ?auto_145054 ) ) ( not ( = ?auto_145051 ?auto_145055 ) ) ( not ( = ?auto_145051 ?auto_145056 ) ) ( not ( = ?auto_145052 ?auto_145053 ) ) ( not ( = ?auto_145052 ?auto_145054 ) ) ( not ( = ?auto_145052 ?auto_145055 ) ) ( not ( = ?auto_145052 ?auto_145056 ) ) ( not ( = ?auto_145053 ?auto_145054 ) ) ( not ( = ?auto_145053 ?auto_145055 ) ) ( not ( = ?auto_145053 ?auto_145056 ) ) ( not ( = ?auto_145054 ?auto_145055 ) ) ( not ( = ?auto_145054 ?auto_145056 ) ) ( not ( = ?auto_145055 ?auto_145056 ) ) ( ON ?auto_145054 ?auto_145055 ) ( ON ?auto_145053 ?auto_145054 ) ( ON ?auto_145052 ?auto_145053 ) ( ON ?auto_145051 ?auto_145052 ) ( CLEAR ?auto_145049 ) ( ON ?auto_145050 ?auto_145051 ) ( CLEAR ?auto_145050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_145046 ?auto_145047 ?auto_145048 ?auto_145049 ?auto_145050 )
      ( MAKE-10PILE ?auto_145046 ?auto_145047 ?auto_145048 ?auto_145049 ?auto_145050 ?auto_145051 ?auto_145052 ?auto_145053 ?auto_145054 ?auto_145055 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_145067 - BLOCK
      ?auto_145068 - BLOCK
      ?auto_145069 - BLOCK
      ?auto_145070 - BLOCK
      ?auto_145071 - BLOCK
      ?auto_145072 - BLOCK
      ?auto_145073 - BLOCK
      ?auto_145074 - BLOCK
      ?auto_145075 - BLOCK
      ?auto_145076 - BLOCK
    )
    :vars
    (
      ?auto_145077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145076 ?auto_145077 ) ( ON-TABLE ?auto_145067 ) ( ON ?auto_145068 ?auto_145067 ) ( ON ?auto_145069 ?auto_145068 ) ( ON ?auto_145070 ?auto_145069 ) ( not ( = ?auto_145067 ?auto_145068 ) ) ( not ( = ?auto_145067 ?auto_145069 ) ) ( not ( = ?auto_145067 ?auto_145070 ) ) ( not ( = ?auto_145067 ?auto_145071 ) ) ( not ( = ?auto_145067 ?auto_145072 ) ) ( not ( = ?auto_145067 ?auto_145073 ) ) ( not ( = ?auto_145067 ?auto_145074 ) ) ( not ( = ?auto_145067 ?auto_145075 ) ) ( not ( = ?auto_145067 ?auto_145076 ) ) ( not ( = ?auto_145067 ?auto_145077 ) ) ( not ( = ?auto_145068 ?auto_145069 ) ) ( not ( = ?auto_145068 ?auto_145070 ) ) ( not ( = ?auto_145068 ?auto_145071 ) ) ( not ( = ?auto_145068 ?auto_145072 ) ) ( not ( = ?auto_145068 ?auto_145073 ) ) ( not ( = ?auto_145068 ?auto_145074 ) ) ( not ( = ?auto_145068 ?auto_145075 ) ) ( not ( = ?auto_145068 ?auto_145076 ) ) ( not ( = ?auto_145068 ?auto_145077 ) ) ( not ( = ?auto_145069 ?auto_145070 ) ) ( not ( = ?auto_145069 ?auto_145071 ) ) ( not ( = ?auto_145069 ?auto_145072 ) ) ( not ( = ?auto_145069 ?auto_145073 ) ) ( not ( = ?auto_145069 ?auto_145074 ) ) ( not ( = ?auto_145069 ?auto_145075 ) ) ( not ( = ?auto_145069 ?auto_145076 ) ) ( not ( = ?auto_145069 ?auto_145077 ) ) ( not ( = ?auto_145070 ?auto_145071 ) ) ( not ( = ?auto_145070 ?auto_145072 ) ) ( not ( = ?auto_145070 ?auto_145073 ) ) ( not ( = ?auto_145070 ?auto_145074 ) ) ( not ( = ?auto_145070 ?auto_145075 ) ) ( not ( = ?auto_145070 ?auto_145076 ) ) ( not ( = ?auto_145070 ?auto_145077 ) ) ( not ( = ?auto_145071 ?auto_145072 ) ) ( not ( = ?auto_145071 ?auto_145073 ) ) ( not ( = ?auto_145071 ?auto_145074 ) ) ( not ( = ?auto_145071 ?auto_145075 ) ) ( not ( = ?auto_145071 ?auto_145076 ) ) ( not ( = ?auto_145071 ?auto_145077 ) ) ( not ( = ?auto_145072 ?auto_145073 ) ) ( not ( = ?auto_145072 ?auto_145074 ) ) ( not ( = ?auto_145072 ?auto_145075 ) ) ( not ( = ?auto_145072 ?auto_145076 ) ) ( not ( = ?auto_145072 ?auto_145077 ) ) ( not ( = ?auto_145073 ?auto_145074 ) ) ( not ( = ?auto_145073 ?auto_145075 ) ) ( not ( = ?auto_145073 ?auto_145076 ) ) ( not ( = ?auto_145073 ?auto_145077 ) ) ( not ( = ?auto_145074 ?auto_145075 ) ) ( not ( = ?auto_145074 ?auto_145076 ) ) ( not ( = ?auto_145074 ?auto_145077 ) ) ( not ( = ?auto_145075 ?auto_145076 ) ) ( not ( = ?auto_145075 ?auto_145077 ) ) ( not ( = ?auto_145076 ?auto_145077 ) ) ( ON ?auto_145075 ?auto_145076 ) ( ON ?auto_145074 ?auto_145075 ) ( ON ?auto_145073 ?auto_145074 ) ( ON ?auto_145072 ?auto_145073 ) ( CLEAR ?auto_145070 ) ( ON ?auto_145071 ?auto_145072 ) ( CLEAR ?auto_145071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_145067 ?auto_145068 ?auto_145069 ?auto_145070 ?auto_145071 )
      ( MAKE-10PILE ?auto_145067 ?auto_145068 ?auto_145069 ?auto_145070 ?auto_145071 ?auto_145072 ?auto_145073 ?auto_145074 ?auto_145075 ?auto_145076 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_145088 - BLOCK
      ?auto_145089 - BLOCK
      ?auto_145090 - BLOCK
      ?auto_145091 - BLOCK
      ?auto_145092 - BLOCK
      ?auto_145093 - BLOCK
      ?auto_145094 - BLOCK
      ?auto_145095 - BLOCK
      ?auto_145096 - BLOCK
      ?auto_145097 - BLOCK
    )
    :vars
    (
      ?auto_145098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145097 ?auto_145098 ) ( ON-TABLE ?auto_145088 ) ( ON ?auto_145089 ?auto_145088 ) ( ON ?auto_145090 ?auto_145089 ) ( not ( = ?auto_145088 ?auto_145089 ) ) ( not ( = ?auto_145088 ?auto_145090 ) ) ( not ( = ?auto_145088 ?auto_145091 ) ) ( not ( = ?auto_145088 ?auto_145092 ) ) ( not ( = ?auto_145088 ?auto_145093 ) ) ( not ( = ?auto_145088 ?auto_145094 ) ) ( not ( = ?auto_145088 ?auto_145095 ) ) ( not ( = ?auto_145088 ?auto_145096 ) ) ( not ( = ?auto_145088 ?auto_145097 ) ) ( not ( = ?auto_145088 ?auto_145098 ) ) ( not ( = ?auto_145089 ?auto_145090 ) ) ( not ( = ?auto_145089 ?auto_145091 ) ) ( not ( = ?auto_145089 ?auto_145092 ) ) ( not ( = ?auto_145089 ?auto_145093 ) ) ( not ( = ?auto_145089 ?auto_145094 ) ) ( not ( = ?auto_145089 ?auto_145095 ) ) ( not ( = ?auto_145089 ?auto_145096 ) ) ( not ( = ?auto_145089 ?auto_145097 ) ) ( not ( = ?auto_145089 ?auto_145098 ) ) ( not ( = ?auto_145090 ?auto_145091 ) ) ( not ( = ?auto_145090 ?auto_145092 ) ) ( not ( = ?auto_145090 ?auto_145093 ) ) ( not ( = ?auto_145090 ?auto_145094 ) ) ( not ( = ?auto_145090 ?auto_145095 ) ) ( not ( = ?auto_145090 ?auto_145096 ) ) ( not ( = ?auto_145090 ?auto_145097 ) ) ( not ( = ?auto_145090 ?auto_145098 ) ) ( not ( = ?auto_145091 ?auto_145092 ) ) ( not ( = ?auto_145091 ?auto_145093 ) ) ( not ( = ?auto_145091 ?auto_145094 ) ) ( not ( = ?auto_145091 ?auto_145095 ) ) ( not ( = ?auto_145091 ?auto_145096 ) ) ( not ( = ?auto_145091 ?auto_145097 ) ) ( not ( = ?auto_145091 ?auto_145098 ) ) ( not ( = ?auto_145092 ?auto_145093 ) ) ( not ( = ?auto_145092 ?auto_145094 ) ) ( not ( = ?auto_145092 ?auto_145095 ) ) ( not ( = ?auto_145092 ?auto_145096 ) ) ( not ( = ?auto_145092 ?auto_145097 ) ) ( not ( = ?auto_145092 ?auto_145098 ) ) ( not ( = ?auto_145093 ?auto_145094 ) ) ( not ( = ?auto_145093 ?auto_145095 ) ) ( not ( = ?auto_145093 ?auto_145096 ) ) ( not ( = ?auto_145093 ?auto_145097 ) ) ( not ( = ?auto_145093 ?auto_145098 ) ) ( not ( = ?auto_145094 ?auto_145095 ) ) ( not ( = ?auto_145094 ?auto_145096 ) ) ( not ( = ?auto_145094 ?auto_145097 ) ) ( not ( = ?auto_145094 ?auto_145098 ) ) ( not ( = ?auto_145095 ?auto_145096 ) ) ( not ( = ?auto_145095 ?auto_145097 ) ) ( not ( = ?auto_145095 ?auto_145098 ) ) ( not ( = ?auto_145096 ?auto_145097 ) ) ( not ( = ?auto_145096 ?auto_145098 ) ) ( not ( = ?auto_145097 ?auto_145098 ) ) ( ON ?auto_145096 ?auto_145097 ) ( ON ?auto_145095 ?auto_145096 ) ( ON ?auto_145094 ?auto_145095 ) ( ON ?auto_145093 ?auto_145094 ) ( ON ?auto_145092 ?auto_145093 ) ( CLEAR ?auto_145090 ) ( ON ?auto_145091 ?auto_145092 ) ( CLEAR ?auto_145091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145088 ?auto_145089 ?auto_145090 ?auto_145091 )
      ( MAKE-10PILE ?auto_145088 ?auto_145089 ?auto_145090 ?auto_145091 ?auto_145092 ?auto_145093 ?auto_145094 ?auto_145095 ?auto_145096 ?auto_145097 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_145109 - BLOCK
      ?auto_145110 - BLOCK
      ?auto_145111 - BLOCK
      ?auto_145112 - BLOCK
      ?auto_145113 - BLOCK
      ?auto_145114 - BLOCK
      ?auto_145115 - BLOCK
      ?auto_145116 - BLOCK
      ?auto_145117 - BLOCK
      ?auto_145118 - BLOCK
    )
    :vars
    (
      ?auto_145119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145118 ?auto_145119 ) ( ON-TABLE ?auto_145109 ) ( ON ?auto_145110 ?auto_145109 ) ( ON ?auto_145111 ?auto_145110 ) ( not ( = ?auto_145109 ?auto_145110 ) ) ( not ( = ?auto_145109 ?auto_145111 ) ) ( not ( = ?auto_145109 ?auto_145112 ) ) ( not ( = ?auto_145109 ?auto_145113 ) ) ( not ( = ?auto_145109 ?auto_145114 ) ) ( not ( = ?auto_145109 ?auto_145115 ) ) ( not ( = ?auto_145109 ?auto_145116 ) ) ( not ( = ?auto_145109 ?auto_145117 ) ) ( not ( = ?auto_145109 ?auto_145118 ) ) ( not ( = ?auto_145109 ?auto_145119 ) ) ( not ( = ?auto_145110 ?auto_145111 ) ) ( not ( = ?auto_145110 ?auto_145112 ) ) ( not ( = ?auto_145110 ?auto_145113 ) ) ( not ( = ?auto_145110 ?auto_145114 ) ) ( not ( = ?auto_145110 ?auto_145115 ) ) ( not ( = ?auto_145110 ?auto_145116 ) ) ( not ( = ?auto_145110 ?auto_145117 ) ) ( not ( = ?auto_145110 ?auto_145118 ) ) ( not ( = ?auto_145110 ?auto_145119 ) ) ( not ( = ?auto_145111 ?auto_145112 ) ) ( not ( = ?auto_145111 ?auto_145113 ) ) ( not ( = ?auto_145111 ?auto_145114 ) ) ( not ( = ?auto_145111 ?auto_145115 ) ) ( not ( = ?auto_145111 ?auto_145116 ) ) ( not ( = ?auto_145111 ?auto_145117 ) ) ( not ( = ?auto_145111 ?auto_145118 ) ) ( not ( = ?auto_145111 ?auto_145119 ) ) ( not ( = ?auto_145112 ?auto_145113 ) ) ( not ( = ?auto_145112 ?auto_145114 ) ) ( not ( = ?auto_145112 ?auto_145115 ) ) ( not ( = ?auto_145112 ?auto_145116 ) ) ( not ( = ?auto_145112 ?auto_145117 ) ) ( not ( = ?auto_145112 ?auto_145118 ) ) ( not ( = ?auto_145112 ?auto_145119 ) ) ( not ( = ?auto_145113 ?auto_145114 ) ) ( not ( = ?auto_145113 ?auto_145115 ) ) ( not ( = ?auto_145113 ?auto_145116 ) ) ( not ( = ?auto_145113 ?auto_145117 ) ) ( not ( = ?auto_145113 ?auto_145118 ) ) ( not ( = ?auto_145113 ?auto_145119 ) ) ( not ( = ?auto_145114 ?auto_145115 ) ) ( not ( = ?auto_145114 ?auto_145116 ) ) ( not ( = ?auto_145114 ?auto_145117 ) ) ( not ( = ?auto_145114 ?auto_145118 ) ) ( not ( = ?auto_145114 ?auto_145119 ) ) ( not ( = ?auto_145115 ?auto_145116 ) ) ( not ( = ?auto_145115 ?auto_145117 ) ) ( not ( = ?auto_145115 ?auto_145118 ) ) ( not ( = ?auto_145115 ?auto_145119 ) ) ( not ( = ?auto_145116 ?auto_145117 ) ) ( not ( = ?auto_145116 ?auto_145118 ) ) ( not ( = ?auto_145116 ?auto_145119 ) ) ( not ( = ?auto_145117 ?auto_145118 ) ) ( not ( = ?auto_145117 ?auto_145119 ) ) ( not ( = ?auto_145118 ?auto_145119 ) ) ( ON ?auto_145117 ?auto_145118 ) ( ON ?auto_145116 ?auto_145117 ) ( ON ?auto_145115 ?auto_145116 ) ( ON ?auto_145114 ?auto_145115 ) ( ON ?auto_145113 ?auto_145114 ) ( CLEAR ?auto_145111 ) ( ON ?auto_145112 ?auto_145113 ) ( CLEAR ?auto_145112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145109 ?auto_145110 ?auto_145111 ?auto_145112 )
      ( MAKE-10PILE ?auto_145109 ?auto_145110 ?auto_145111 ?auto_145112 ?auto_145113 ?auto_145114 ?auto_145115 ?auto_145116 ?auto_145117 ?auto_145118 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_145130 - BLOCK
      ?auto_145131 - BLOCK
      ?auto_145132 - BLOCK
      ?auto_145133 - BLOCK
      ?auto_145134 - BLOCK
      ?auto_145135 - BLOCK
      ?auto_145136 - BLOCK
      ?auto_145137 - BLOCK
      ?auto_145138 - BLOCK
      ?auto_145139 - BLOCK
    )
    :vars
    (
      ?auto_145140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145139 ?auto_145140 ) ( ON-TABLE ?auto_145130 ) ( ON ?auto_145131 ?auto_145130 ) ( not ( = ?auto_145130 ?auto_145131 ) ) ( not ( = ?auto_145130 ?auto_145132 ) ) ( not ( = ?auto_145130 ?auto_145133 ) ) ( not ( = ?auto_145130 ?auto_145134 ) ) ( not ( = ?auto_145130 ?auto_145135 ) ) ( not ( = ?auto_145130 ?auto_145136 ) ) ( not ( = ?auto_145130 ?auto_145137 ) ) ( not ( = ?auto_145130 ?auto_145138 ) ) ( not ( = ?auto_145130 ?auto_145139 ) ) ( not ( = ?auto_145130 ?auto_145140 ) ) ( not ( = ?auto_145131 ?auto_145132 ) ) ( not ( = ?auto_145131 ?auto_145133 ) ) ( not ( = ?auto_145131 ?auto_145134 ) ) ( not ( = ?auto_145131 ?auto_145135 ) ) ( not ( = ?auto_145131 ?auto_145136 ) ) ( not ( = ?auto_145131 ?auto_145137 ) ) ( not ( = ?auto_145131 ?auto_145138 ) ) ( not ( = ?auto_145131 ?auto_145139 ) ) ( not ( = ?auto_145131 ?auto_145140 ) ) ( not ( = ?auto_145132 ?auto_145133 ) ) ( not ( = ?auto_145132 ?auto_145134 ) ) ( not ( = ?auto_145132 ?auto_145135 ) ) ( not ( = ?auto_145132 ?auto_145136 ) ) ( not ( = ?auto_145132 ?auto_145137 ) ) ( not ( = ?auto_145132 ?auto_145138 ) ) ( not ( = ?auto_145132 ?auto_145139 ) ) ( not ( = ?auto_145132 ?auto_145140 ) ) ( not ( = ?auto_145133 ?auto_145134 ) ) ( not ( = ?auto_145133 ?auto_145135 ) ) ( not ( = ?auto_145133 ?auto_145136 ) ) ( not ( = ?auto_145133 ?auto_145137 ) ) ( not ( = ?auto_145133 ?auto_145138 ) ) ( not ( = ?auto_145133 ?auto_145139 ) ) ( not ( = ?auto_145133 ?auto_145140 ) ) ( not ( = ?auto_145134 ?auto_145135 ) ) ( not ( = ?auto_145134 ?auto_145136 ) ) ( not ( = ?auto_145134 ?auto_145137 ) ) ( not ( = ?auto_145134 ?auto_145138 ) ) ( not ( = ?auto_145134 ?auto_145139 ) ) ( not ( = ?auto_145134 ?auto_145140 ) ) ( not ( = ?auto_145135 ?auto_145136 ) ) ( not ( = ?auto_145135 ?auto_145137 ) ) ( not ( = ?auto_145135 ?auto_145138 ) ) ( not ( = ?auto_145135 ?auto_145139 ) ) ( not ( = ?auto_145135 ?auto_145140 ) ) ( not ( = ?auto_145136 ?auto_145137 ) ) ( not ( = ?auto_145136 ?auto_145138 ) ) ( not ( = ?auto_145136 ?auto_145139 ) ) ( not ( = ?auto_145136 ?auto_145140 ) ) ( not ( = ?auto_145137 ?auto_145138 ) ) ( not ( = ?auto_145137 ?auto_145139 ) ) ( not ( = ?auto_145137 ?auto_145140 ) ) ( not ( = ?auto_145138 ?auto_145139 ) ) ( not ( = ?auto_145138 ?auto_145140 ) ) ( not ( = ?auto_145139 ?auto_145140 ) ) ( ON ?auto_145138 ?auto_145139 ) ( ON ?auto_145137 ?auto_145138 ) ( ON ?auto_145136 ?auto_145137 ) ( ON ?auto_145135 ?auto_145136 ) ( ON ?auto_145134 ?auto_145135 ) ( ON ?auto_145133 ?auto_145134 ) ( CLEAR ?auto_145131 ) ( ON ?auto_145132 ?auto_145133 ) ( CLEAR ?auto_145132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145130 ?auto_145131 ?auto_145132 )
      ( MAKE-10PILE ?auto_145130 ?auto_145131 ?auto_145132 ?auto_145133 ?auto_145134 ?auto_145135 ?auto_145136 ?auto_145137 ?auto_145138 ?auto_145139 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_145151 - BLOCK
      ?auto_145152 - BLOCK
      ?auto_145153 - BLOCK
      ?auto_145154 - BLOCK
      ?auto_145155 - BLOCK
      ?auto_145156 - BLOCK
      ?auto_145157 - BLOCK
      ?auto_145158 - BLOCK
      ?auto_145159 - BLOCK
      ?auto_145160 - BLOCK
    )
    :vars
    (
      ?auto_145161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145160 ?auto_145161 ) ( ON-TABLE ?auto_145151 ) ( ON ?auto_145152 ?auto_145151 ) ( not ( = ?auto_145151 ?auto_145152 ) ) ( not ( = ?auto_145151 ?auto_145153 ) ) ( not ( = ?auto_145151 ?auto_145154 ) ) ( not ( = ?auto_145151 ?auto_145155 ) ) ( not ( = ?auto_145151 ?auto_145156 ) ) ( not ( = ?auto_145151 ?auto_145157 ) ) ( not ( = ?auto_145151 ?auto_145158 ) ) ( not ( = ?auto_145151 ?auto_145159 ) ) ( not ( = ?auto_145151 ?auto_145160 ) ) ( not ( = ?auto_145151 ?auto_145161 ) ) ( not ( = ?auto_145152 ?auto_145153 ) ) ( not ( = ?auto_145152 ?auto_145154 ) ) ( not ( = ?auto_145152 ?auto_145155 ) ) ( not ( = ?auto_145152 ?auto_145156 ) ) ( not ( = ?auto_145152 ?auto_145157 ) ) ( not ( = ?auto_145152 ?auto_145158 ) ) ( not ( = ?auto_145152 ?auto_145159 ) ) ( not ( = ?auto_145152 ?auto_145160 ) ) ( not ( = ?auto_145152 ?auto_145161 ) ) ( not ( = ?auto_145153 ?auto_145154 ) ) ( not ( = ?auto_145153 ?auto_145155 ) ) ( not ( = ?auto_145153 ?auto_145156 ) ) ( not ( = ?auto_145153 ?auto_145157 ) ) ( not ( = ?auto_145153 ?auto_145158 ) ) ( not ( = ?auto_145153 ?auto_145159 ) ) ( not ( = ?auto_145153 ?auto_145160 ) ) ( not ( = ?auto_145153 ?auto_145161 ) ) ( not ( = ?auto_145154 ?auto_145155 ) ) ( not ( = ?auto_145154 ?auto_145156 ) ) ( not ( = ?auto_145154 ?auto_145157 ) ) ( not ( = ?auto_145154 ?auto_145158 ) ) ( not ( = ?auto_145154 ?auto_145159 ) ) ( not ( = ?auto_145154 ?auto_145160 ) ) ( not ( = ?auto_145154 ?auto_145161 ) ) ( not ( = ?auto_145155 ?auto_145156 ) ) ( not ( = ?auto_145155 ?auto_145157 ) ) ( not ( = ?auto_145155 ?auto_145158 ) ) ( not ( = ?auto_145155 ?auto_145159 ) ) ( not ( = ?auto_145155 ?auto_145160 ) ) ( not ( = ?auto_145155 ?auto_145161 ) ) ( not ( = ?auto_145156 ?auto_145157 ) ) ( not ( = ?auto_145156 ?auto_145158 ) ) ( not ( = ?auto_145156 ?auto_145159 ) ) ( not ( = ?auto_145156 ?auto_145160 ) ) ( not ( = ?auto_145156 ?auto_145161 ) ) ( not ( = ?auto_145157 ?auto_145158 ) ) ( not ( = ?auto_145157 ?auto_145159 ) ) ( not ( = ?auto_145157 ?auto_145160 ) ) ( not ( = ?auto_145157 ?auto_145161 ) ) ( not ( = ?auto_145158 ?auto_145159 ) ) ( not ( = ?auto_145158 ?auto_145160 ) ) ( not ( = ?auto_145158 ?auto_145161 ) ) ( not ( = ?auto_145159 ?auto_145160 ) ) ( not ( = ?auto_145159 ?auto_145161 ) ) ( not ( = ?auto_145160 ?auto_145161 ) ) ( ON ?auto_145159 ?auto_145160 ) ( ON ?auto_145158 ?auto_145159 ) ( ON ?auto_145157 ?auto_145158 ) ( ON ?auto_145156 ?auto_145157 ) ( ON ?auto_145155 ?auto_145156 ) ( ON ?auto_145154 ?auto_145155 ) ( CLEAR ?auto_145152 ) ( ON ?auto_145153 ?auto_145154 ) ( CLEAR ?auto_145153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145151 ?auto_145152 ?auto_145153 )
      ( MAKE-10PILE ?auto_145151 ?auto_145152 ?auto_145153 ?auto_145154 ?auto_145155 ?auto_145156 ?auto_145157 ?auto_145158 ?auto_145159 ?auto_145160 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_145172 - BLOCK
      ?auto_145173 - BLOCK
      ?auto_145174 - BLOCK
      ?auto_145175 - BLOCK
      ?auto_145176 - BLOCK
      ?auto_145177 - BLOCK
      ?auto_145178 - BLOCK
      ?auto_145179 - BLOCK
      ?auto_145180 - BLOCK
      ?auto_145181 - BLOCK
    )
    :vars
    (
      ?auto_145182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145181 ?auto_145182 ) ( ON-TABLE ?auto_145172 ) ( not ( = ?auto_145172 ?auto_145173 ) ) ( not ( = ?auto_145172 ?auto_145174 ) ) ( not ( = ?auto_145172 ?auto_145175 ) ) ( not ( = ?auto_145172 ?auto_145176 ) ) ( not ( = ?auto_145172 ?auto_145177 ) ) ( not ( = ?auto_145172 ?auto_145178 ) ) ( not ( = ?auto_145172 ?auto_145179 ) ) ( not ( = ?auto_145172 ?auto_145180 ) ) ( not ( = ?auto_145172 ?auto_145181 ) ) ( not ( = ?auto_145172 ?auto_145182 ) ) ( not ( = ?auto_145173 ?auto_145174 ) ) ( not ( = ?auto_145173 ?auto_145175 ) ) ( not ( = ?auto_145173 ?auto_145176 ) ) ( not ( = ?auto_145173 ?auto_145177 ) ) ( not ( = ?auto_145173 ?auto_145178 ) ) ( not ( = ?auto_145173 ?auto_145179 ) ) ( not ( = ?auto_145173 ?auto_145180 ) ) ( not ( = ?auto_145173 ?auto_145181 ) ) ( not ( = ?auto_145173 ?auto_145182 ) ) ( not ( = ?auto_145174 ?auto_145175 ) ) ( not ( = ?auto_145174 ?auto_145176 ) ) ( not ( = ?auto_145174 ?auto_145177 ) ) ( not ( = ?auto_145174 ?auto_145178 ) ) ( not ( = ?auto_145174 ?auto_145179 ) ) ( not ( = ?auto_145174 ?auto_145180 ) ) ( not ( = ?auto_145174 ?auto_145181 ) ) ( not ( = ?auto_145174 ?auto_145182 ) ) ( not ( = ?auto_145175 ?auto_145176 ) ) ( not ( = ?auto_145175 ?auto_145177 ) ) ( not ( = ?auto_145175 ?auto_145178 ) ) ( not ( = ?auto_145175 ?auto_145179 ) ) ( not ( = ?auto_145175 ?auto_145180 ) ) ( not ( = ?auto_145175 ?auto_145181 ) ) ( not ( = ?auto_145175 ?auto_145182 ) ) ( not ( = ?auto_145176 ?auto_145177 ) ) ( not ( = ?auto_145176 ?auto_145178 ) ) ( not ( = ?auto_145176 ?auto_145179 ) ) ( not ( = ?auto_145176 ?auto_145180 ) ) ( not ( = ?auto_145176 ?auto_145181 ) ) ( not ( = ?auto_145176 ?auto_145182 ) ) ( not ( = ?auto_145177 ?auto_145178 ) ) ( not ( = ?auto_145177 ?auto_145179 ) ) ( not ( = ?auto_145177 ?auto_145180 ) ) ( not ( = ?auto_145177 ?auto_145181 ) ) ( not ( = ?auto_145177 ?auto_145182 ) ) ( not ( = ?auto_145178 ?auto_145179 ) ) ( not ( = ?auto_145178 ?auto_145180 ) ) ( not ( = ?auto_145178 ?auto_145181 ) ) ( not ( = ?auto_145178 ?auto_145182 ) ) ( not ( = ?auto_145179 ?auto_145180 ) ) ( not ( = ?auto_145179 ?auto_145181 ) ) ( not ( = ?auto_145179 ?auto_145182 ) ) ( not ( = ?auto_145180 ?auto_145181 ) ) ( not ( = ?auto_145180 ?auto_145182 ) ) ( not ( = ?auto_145181 ?auto_145182 ) ) ( ON ?auto_145180 ?auto_145181 ) ( ON ?auto_145179 ?auto_145180 ) ( ON ?auto_145178 ?auto_145179 ) ( ON ?auto_145177 ?auto_145178 ) ( ON ?auto_145176 ?auto_145177 ) ( ON ?auto_145175 ?auto_145176 ) ( ON ?auto_145174 ?auto_145175 ) ( CLEAR ?auto_145172 ) ( ON ?auto_145173 ?auto_145174 ) ( CLEAR ?auto_145173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145172 ?auto_145173 )
      ( MAKE-10PILE ?auto_145172 ?auto_145173 ?auto_145174 ?auto_145175 ?auto_145176 ?auto_145177 ?auto_145178 ?auto_145179 ?auto_145180 ?auto_145181 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_145193 - BLOCK
      ?auto_145194 - BLOCK
      ?auto_145195 - BLOCK
      ?auto_145196 - BLOCK
      ?auto_145197 - BLOCK
      ?auto_145198 - BLOCK
      ?auto_145199 - BLOCK
      ?auto_145200 - BLOCK
      ?auto_145201 - BLOCK
      ?auto_145202 - BLOCK
    )
    :vars
    (
      ?auto_145203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145202 ?auto_145203 ) ( ON-TABLE ?auto_145193 ) ( not ( = ?auto_145193 ?auto_145194 ) ) ( not ( = ?auto_145193 ?auto_145195 ) ) ( not ( = ?auto_145193 ?auto_145196 ) ) ( not ( = ?auto_145193 ?auto_145197 ) ) ( not ( = ?auto_145193 ?auto_145198 ) ) ( not ( = ?auto_145193 ?auto_145199 ) ) ( not ( = ?auto_145193 ?auto_145200 ) ) ( not ( = ?auto_145193 ?auto_145201 ) ) ( not ( = ?auto_145193 ?auto_145202 ) ) ( not ( = ?auto_145193 ?auto_145203 ) ) ( not ( = ?auto_145194 ?auto_145195 ) ) ( not ( = ?auto_145194 ?auto_145196 ) ) ( not ( = ?auto_145194 ?auto_145197 ) ) ( not ( = ?auto_145194 ?auto_145198 ) ) ( not ( = ?auto_145194 ?auto_145199 ) ) ( not ( = ?auto_145194 ?auto_145200 ) ) ( not ( = ?auto_145194 ?auto_145201 ) ) ( not ( = ?auto_145194 ?auto_145202 ) ) ( not ( = ?auto_145194 ?auto_145203 ) ) ( not ( = ?auto_145195 ?auto_145196 ) ) ( not ( = ?auto_145195 ?auto_145197 ) ) ( not ( = ?auto_145195 ?auto_145198 ) ) ( not ( = ?auto_145195 ?auto_145199 ) ) ( not ( = ?auto_145195 ?auto_145200 ) ) ( not ( = ?auto_145195 ?auto_145201 ) ) ( not ( = ?auto_145195 ?auto_145202 ) ) ( not ( = ?auto_145195 ?auto_145203 ) ) ( not ( = ?auto_145196 ?auto_145197 ) ) ( not ( = ?auto_145196 ?auto_145198 ) ) ( not ( = ?auto_145196 ?auto_145199 ) ) ( not ( = ?auto_145196 ?auto_145200 ) ) ( not ( = ?auto_145196 ?auto_145201 ) ) ( not ( = ?auto_145196 ?auto_145202 ) ) ( not ( = ?auto_145196 ?auto_145203 ) ) ( not ( = ?auto_145197 ?auto_145198 ) ) ( not ( = ?auto_145197 ?auto_145199 ) ) ( not ( = ?auto_145197 ?auto_145200 ) ) ( not ( = ?auto_145197 ?auto_145201 ) ) ( not ( = ?auto_145197 ?auto_145202 ) ) ( not ( = ?auto_145197 ?auto_145203 ) ) ( not ( = ?auto_145198 ?auto_145199 ) ) ( not ( = ?auto_145198 ?auto_145200 ) ) ( not ( = ?auto_145198 ?auto_145201 ) ) ( not ( = ?auto_145198 ?auto_145202 ) ) ( not ( = ?auto_145198 ?auto_145203 ) ) ( not ( = ?auto_145199 ?auto_145200 ) ) ( not ( = ?auto_145199 ?auto_145201 ) ) ( not ( = ?auto_145199 ?auto_145202 ) ) ( not ( = ?auto_145199 ?auto_145203 ) ) ( not ( = ?auto_145200 ?auto_145201 ) ) ( not ( = ?auto_145200 ?auto_145202 ) ) ( not ( = ?auto_145200 ?auto_145203 ) ) ( not ( = ?auto_145201 ?auto_145202 ) ) ( not ( = ?auto_145201 ?auto_145203 ) ) ( not ( = ?auto_145202 ?auto_145203 ) ) ( ON ?auto_145201 ?auto_145202 ) ( ON ?auto_145200 ?auto_145201 ) ( ON ?auto_145199 ?auto_145200 ) ( ON ?auto_145198 ?auto_145199 ) ( ON ?auto_145197 ?auto_145198 ) ( ON ?auto_145196 ?auto_145197 ) ( ON ?auto_145195 ?auto_145196 ) ( CLEAR ?auto_145193 ) ( ON ?auto_145194 ?auto_145195 ) ( CLEAR ?auto_145194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145193 ?auto_145194 )
      ( MAKE-10PILE ?auto_145193 ?auto_145194 ?auto_145195 ?auto_145196 ?auto_145197 ?auto_145198 ?auto_145199 ?auto_145200 ?auto_145201 ?auto_145202 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_145214 - BLOCK
      ?auto_145215 - BLOCK
      ?auto_145216 - BLOCK
      ?auto_145217 - BLOCK
      ?auto_145218 - BLOCK
      ?auto_145219 - BLOCK
      ?auto_145220 - BLOCK
      ?auto_145221 - BLOCK
      ?auto_145222 - BLOCK
      ?auto_145223 - BLOCK
    )
    :vars
    (
      ?auto_145224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145223 ?auto_145224 ) ( not ( = ?auto_145214 ?auto_145215 ) ) ( not ( = ?auto_145214 ?auto_145216 ) ) ( not ( = ?auto_145214 ?auto_145217 ) ) ( not ( = ?auto_145214 ?auto_145218 ) ) ( not ( = ?auto_145214 ?auto_145219 ) ) ( not ( = ?auto_145214 ?auto_145220 ) ) ( not ( = ?auto_145214 ?auto_145221 ) ) ( not ( = ?auto_145214 ?auto_145222 ) ) ( not ( = ?auto_145214 ?auto_145223 ) ) ( not ( = ?auto_145214 ?auto_145224 ) ) ( not ( = ?auto_145215 ?auto_145216 ) ) ( not ( = ?auto_145215 ?auto_145217 ) ) ( not ( = ?auto_145215 ?auto_145218 ) ) ( not ( = ?auto_145215 ?auto_145219 ) ) ( not ( = ?auto_145215 ?auto_145220 ) ) ( not ( = ?auto_145215 ?auto_145221 ) ) ( not ( = ?auto_145215 ?auto_145222 ) ) ( not ( = ?auto_145215 ?auto_145223 ) ) ( not ( = ?auto_145215 ?auto_145224 ) ) ( not ( = ?auto_145216 ?auto_145217 ) ) ( not ( = ?auto_145216 ?auto_145218 ) ) ( not ( = ?auto_145216 ?auto_145219 ) ) ( not ( = ?auto_145216 ?auto_145220 ) ) ( not ( = ?auto_145216 ?auto_145221 ) ) ( not ( = ?auto_145216 ?auto_145222 ) ) ( not ( = ?auto_145216 ?auto_145223 ) ) ( not ( = ?auto_145216 ?auto_145224 ) ) ( not ( = ?auto_145217 ?auto_145218 ) ) ( not ( = ?auto_145217 ?auto_145219 ) ) ( not ( = ?auto_145217 ?auto_145220 ) ) ( not ( = ?auto_145217 ?auto_145221 ) ) ( not ( = ?auto_145217 ?auto_145222 ) ) ( not ( = ?auto_145217 ?auto_145223 ) ) ( not ( = ?auto_145217 ?auto_145224 ) ) ( not ( = ?auto_145218 ?auto_145219 ) ) ( not ( = ?auto_145218 ?auto_145220 ) ) ( not ( = ?auto_145218 ?auto_145221 ) ) ( not ( = ?auto_145218 ?auto_145222 ) ) ( not ( = ?auto_145218 ?auto_145223 ) ) ( not ( = ?auto_145218 ?auto_145224 ) ) ( not ( = ?auto_145219 ?auto_145220 ) ) ( not ( = ?auto_145219 ?auto_145221 ) ) ( not ( = ?auto_145219 ?auto_145222 ) ) ( not ( = ?auto_145219 ?auto_145223 ) ) ( not ( = ?auto_145219 ?auto_145224 ) ) ( not ( = ?auto_145220 ?auto_145221 ) ) ( not ( = ?auto_145220 ?auto_145222 ) ) ( not ( = ?auto_145220 ?auto_145223 ) ) ( not ( = ?auto_145220 ?auto_145224 ) ) ( not ( = ?auto_145221 ?auto_145222 ) ) ( not ( = ?auto_145221 ?auto_145223 ) ) ( not ( = ?auto_145221 ?auto_145224 ) ) ( not ( = ?auto_145222 ?auto_145223 ) ) ( not ( = ?auto_145222 ?auto_145224 ) ) ( not ( = ?auto_145223 ?auto_145224 ) ) ( ON ?auto_145222 ?auto_145223 ) ( ON ?auto_145221 ?auto_145222 ) ( ON ?auto_145220 ?auto_145221 ) ( ON ?auto_145219 ?auto_145220 ) ( ON ?auto_145218 ?auto_145219 ) ( ON ?auto_145217 ?auto_145218 ) ( ON ?auto_145216 ?auto_145217 ) ( ON ?auto_145215 ?auto_145216 ) ( ON ?auto_145214 ?auto_145215 ) ( CLEAR ?auto_145214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145214 )
      ( MAKE-10PILE ?auto_145214 ?auto_145215 ?auto_145216 ?auto_145217 ?auto_145218 ?auto_145219 ?auto_145220 ?auto_145221 ?auto_145222 ?auto_145223 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_145235 - BLOCK
      ?auto_145236 - BLOCK
      ?auto_145237 - BLOCK
      ?auto_145238 - BLOCK
      ?auto_145239 - BLOCK
      ?auto_145240 - BLOCK
      ?auto_145241 - BLOCK
      ?auto_145242 - BLOCK
      ?auto_145243 - BLOCK
      ?auto_145244 - BLOCK
    )
    :vars
    (
      ?auto_145245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145244 ?auto_145245 ) ( not ( = ?auto_145235 ?auto_145236 ) ) ( not ( = ?auto_145235 ?auto_145237 ) ) ( not ( = ?auto_145235 ?auto_145238 ) ) ( not ( = ?auto_145235 ?auto_145239 ) ) ( not ( = ?auto_145235 ?auto_145240 ) ) ( not ( = ?auto_145235 ?auto_145241 ) ) ( not ( = ?auto_145235 ?auto_145242 ) ) ( not ( = ?auto_145235 ?auto_145243 ) ) ( not ( = ?auto_145235 ?auto_145244 ) ) ( not ( = ?auto_145235 ?auto_145245 ) ) ( not ( = ?auto_145236 ?auto_145237 ) ) ( not ( = ?auto_145236 ?auto_145238 ) ) ( not ( = ?auto_145236 ?auto_145239 ) ) ( not ( = ?auto_145236 ?auto_145240 ) ) ( not ( = ?auto_145236 ?auto_145241 ) ) ( not ( = ?auto_145236 ?auto_145242 ) ) ( not ( = ?auto_145236 ?auto_145243 ) ) ( not ( = ?auto_145236 ?auto_145244 ) ) ( not ( = ?auto_145236 ?auto_145245 ) ) ( not ( = ?auto_145237 ?auto_145238 ) ) ( not ( = ?auto_145237 ?auto_145239 ) ) ( not ( = ?auto_145237 ?auto_145240 ) ) ( not ( = ?auto_145237 ?auto_145241 ) ) ( not ( = ?auto_145237 ?auto_145242 ) ) ( not ( = ?auto_145237 ?auto_145243 ) ) ( not ( = ?auto_145237 ?auto_145244 ) ) ( not ( = ?auto_145237 ?auto_145245 ) ) ( not ( = ?auto_145238 ?auto_145239 ) ) ( not ( = ?auto_145238 ?auto_145240 ) ) ( not ( = ?auto_145238 ?auto_145241 ) ) ( not ( = ?auto_145238 ?auto_145242 ) ) ( not ( = ?auto_145238 ?auto_145243 ) ) ( not ( = ?auto_145238 ?auto_145244 ) ) ( not ( = ?auto_145238 ?auto_145245 ) ) ( not ( = ?auto_145239 ?auto_145240 ) ) ( not ( = ?auto_145239 ?auto_145241 ) ) ( not ( = ?auto_145239 ?auto_145242 ) ) ( not ( = ?auto_145239 ?auto_145243 ) ) ( not ( = ?auto_145239 ?auto_145244 ) ) ( not ( = ?auto_145239 ?auto_145245 ) ) ( not ( = ?auto_145240 ?auto_145241 ) ) ( not ( = ?auto_145240 ?auto_145242 ) ) ( not ( = ?auto_145240 ?auto_145243 ) ) ( not ( = ?auto_145240 ?auto_145244 ) ) ( not ( = ?auto_145240 ?auto_145245 ) ) ( not ( = ?auto_145241 ?auto_145242 ) ) ( not ( = ?auto_145241 ?auto_145243 ) ) ( not ( = ?auto_145241 ?auto_145244 ) ) ( not ( = ?auto_145241 ?auto_145245 ) ) ( not ( = ?auto_145242 ?auto_145243 ) ) ( not ( = ?auto_145242 ?auto_145244 ) ) ( not ( = ?auto_145242 ?auto_145245 ) ) ( not ( = ?auto_145243 ?auto_145244 ) ) ( not ( = ?auto_145243 ?auto_145245 ) ) ( not ( = ?auto_145244 ?auto_145245 ) ) ( ON ?auto_145243 ?auto_145244 ) ( ON ?auto_145242 ?auto_145243 ) ( ON ?auto_145241 ?auto_145242 ) ( ON ?auto_145240 ?auto_145241 ) ( ON ?auto_145239 ?auto_145240 ) ( ON ?auto_145238 ?auto_145239 ) ( ON ?auto_145237 ?auto_145238 ) ( ON ?auto_145236 ?auto_145237 ) ( ON ?auto_145235 ?auto_145236 ) ( CLEAR ?auto_145235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145235 )
      ( MAKE-10PILE ?auto_145235 ?auto_145236 ?auto_145237 ?auto_145238 ?auto_145239 ?auto_145240 ?auto_145241 ?auto_145242 ?auto_145243 ?auto_145244 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_145257 - BLOCK
      ?auto_145258 - BLOCK
      ?auto_145259 - BLOCK
      ?auto_145260 - BLOCK
      ?auto_145261 - BLOCK
      ?auto_145262 - BLOCK
      ?auto_145263 - BLOCK
      ?auto_145264 - BLOCK
      ?auto_145265 - BLOCK
      ?auto_145266 - BLOCK
      ?auto_145267 - BLOCK
    )
    :vars
    (
      ?auto_145268 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_145266 ) ( ON ?auto_145267 ?auto_145268 ) ( CLEAR ?auto_145267 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145257 ) ( ON ?auto_145258 ?auto_145257 ) ( ON ?auto_145259 ?auto_145258 ) ( ON ?auto_145260 ?auto_145259 ) ( ON ?auto_145261 ?auto_145260 ) ( ON ?auto_145262 ?auto_145261 ) ( ON ?auto_145263 ?auto_145262 ) ( ON ?auto_145264 ?auto_145263 ) ( ON ?auto_145265 ?auto_145264 ) ( ON ?auto_145266 ?auto_145265 ) ( not ( = ?auto_145257 ?auto_145258 ) ) ( not ( = ?auto_145257 ?auto_145259 ) ) ( not ( = ?auto_145257 ?auto_145260 ) ) ( not ( = ?auto_145257 ?auto_145261 ) ) ( not ( = ?auto_145257 ?auto_145262 ) ) ( not ( = ?auto_145257 ?auto_145263 ) ) ( not ( = ?auto_145257 ?auto_145264 ) ) ( not ( = ?auto_145257 ?auto_145265 ) ) ( not ( = ?auto_145257 ?auto_145266 ) ) ( not ( = ?auto_145257 ?auto_145267 ) ) ( not ( = ?auto_145257 ?auto_145268 ) ) ( not ( = ?auto_145258 ?auto_145259 ) ) ( not ( = ?auto_145258 ?auto_145260 ) ) ( not ( = ?auto_145258 ?auto_145261 ) ) ( not ( = ?auto_145258 ?auto_145262 ) ) ( not ( = ?auto_145258 ?auto_145263 ) ) ( not ( = ?auto_145258 ?auto_145264 ) ) ( not ( = ?auto_145258 ?auto_145265 ) ) ( not ( = ?auto_145258 ?auto_145266 ) ) ( not ( = ?auto_145258 ?auto_145267 ) ) ( not ( = ?auto_145258 ?auto_145268 ) ) ( not ( = ?auto_145259 ?auto_145260 ) ) ( not ( = ?auto_145259 ?auto_145261 ) ) ( not ( = ?auto_145259 ?auto_145262 ) ) ( not ( = ?auto_145259 ?auto_145263 ) ) ( not ( = ?auto_145259 ?auto_145264 ) ) ( not ( = ?auto_145259 ?auto_145265 ) ) ( not ( = ?auto_145259 ?auto_145266 ) ) ( not ( = ?auto_145259 ?auto_145267 ) ) ( not ( = ?auto_145259 ?auto_145268 ) ) ( not ( = ?auto_145260 ?auto_145261 ) ) ( not ( = ?auto_145260 ?auto_145262 ) ) ( not ( = ?auto_145260 ?auto_145263 ) ) ( not ( = ?auto_145260 ?auto_145264 ) ) ( not ( = ?auto_145260 ?auto_145265 ) ) ( not ( = ?auto_145260 ?auto_145266 ) ) ( not ( = ?auto_145260 ?auto_145267 ) ) ( not ( = ?auto_145260 ?auto_145268 ) ) ( not ( = ?auto_145261 ?auto_145262 ) ) ( not ( = ?auto_145261 ?auto_145263 ) ) ( not ( = ?auto_145261 ?auto_145264 ) ) ( not ( = ?auto_145261 ?auto_145265 ) ) ( not ( = ?auto_145261 ?auto_145266 ) ) ( not ( = ?auto_145261 ?auto_145267 ) ) ( not ( = ?auto_145261 ?auto_145268 ) ) ( not ( = ?auto_145262 ?auto_145263 ) ) ( not ( = ?auto_145262 ?auto_145264 ) ) ( not ( = ?auto_145262 ?auto_145265 ) ) ( not ( = ?auto_145262 ?auto_145266 ) ) ( not ( = ?auto_145262 ?auto_145267 ) ) ( not ( = ?auto_145262 ?auto_145268 ) ) ( not ( = ?auto_145263 ?auto_145264 ) ) ( not ( = ?auto_145263 ?auto_145265 ) ) ( not ( = ?auto_145263 ?auto_145266 ) ) ( not ( = ?auto_145263 ?auto_145267 ) ) ( not ( = ?auto_145263 ?auto_145268 ) ) ( not ( = ?auto_145264 ?auto_145265 ) ) ( not ( = ?auto_145264 ?auto_145266 ) ) ( not ( = ?auto_145264 ?auto_145267 ) ) ( not ( = ?auto_145264 ?auto_145268 ) ) ( not ( = ?auto_145265 ?auto_145266 ) ) ( not ( = ?auto_145265 ?auto_145267 ) ) ( not ( = ?auto_145265 ?auto_145268 ) ) ( not ( = ?auto_145266 ?auto_145267 ) ) ( not ( = ?auto_145266 ?auto_145268 ) ) ( not ( = ?auto_145267 ?auto_145268 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145267 ?auto_145268 )
      ( !STACK ?auto_145267 ?auto_145266 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_145280 - BLOCK
      ?auto_145281 - BLOCK
      ?auto_145282 - BLOCK
      ?auto_145283 - BLOCK
      ?auto_145284 - BLOCK
      ?auto_145285 - BLOCK
      ?auto_145286 - BLOCK
      ?auto_145287 - BLOCK
      ?auto_145288 - BLOCK
      ?auto_145289 - BLOCK
      ?auto_145290 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_145289 ) ( ON-TABLE ?auto_145290 ) ( CLEAR ?auto_145290 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145280 ) ( ON ?auto_145281 ?auto_145280 ) ( ON ?auto_145282 ?auto_145281 ) ( ON ?auto_145283 ?auto_145282 ) ( ON ?auto_145284 ?auto_145283 ) ( ON ?auto_145285 ?auto_145284 ) ( ON ?auto_145286 ?auto_145285 ) ( ON ?auto_145287 ?auto_145286 ) ( ON ?auto_145288 ?auto_145287 ) ( ON ?auto_145289 ?auto_145288 ) ( not ( = ?auto_145280 ?auto_145281 ) ) ( not ( = ?auto_145280 ?auto_145282 ) ) ( not ( = ?auto_145280 ?auto_145283 ) ) ( not ( = ?auto_145280 ?auto_145284 ) ) ( not ( = ?auto_145280 ?auto_145285 ) ) ( not ( = ?auto_145280 ?auto_145286 ) ) ( not ( = ?auto_145280 ?auto_145287 ) ) ( not ( = ?auto_145280 ?auto_145288 ) ) ( not ( = ?auto_145280 ?auto_145289 ) ) ( not ( = ?auto_145280 ?auto_145290 ) ) ( not ( = ?auto_145281 ?auto_145282 ) ) ( not ( = ?auto_145281 ?auto_145283 ) ) ( not ( = ?auto_145281 ?auto_145284 ) ) ( not ( = ?auto_145281 ?auto_145285 ) ) ( not ( = ?auto_145281 ?auto_145286 ) ) ( not ( = ?auto_145281 ?auto_145287 ) ) ( not ( = ?auto_145281 ?auto_145288 ) ) ( not ( = ?auto_145281 ?auto_145289 ) ) ( not ( = ?auto_145281 ?auto_145290 ) ) ( not ( = ?auto_145282 ?auto_145283 ) ) ( not ( = ?auto_145282 ?auto_145284 ) ) ( not ( = ?auto_145282 ?auto_145285 ) ) ( not ( = ?auto_145282 ?auto_145286 ) ) ( not ( = ?auto_145282 ?auto_145287 ) ) ( not ( = ?auto_145282 ?auto_145288 ) ) ( not ( = ?auto_145282 ?auto_145289 ) ) ( not ( = ?auto_145282 ?auto_145290 ) ) ( not ( = ?auto_145283 ?auto_145284 ) ) ( not ( = ?auto_145283 ?auto_145285 ) ) ( not ( = ?auto_145283 ?auto_145286 ) ) ( not ( = ?auto_145283 ?auto_145287 ) ) ( not ( = ?auto_145283 ?auto_145288 ) ) ( not ( = ?auto_145283 ?auto_145289 ) ) ( not ( = ?auto_145283 ?auto_145290 ) ) ( not ( = ?auto_145284 ?auto_145285 ) ) ( not ( = ?auto_145284 ?auto_145286 ) ) ( not ( = ?auto_145284 ?auto_145287 ) ) ( not ( = ?auto_145284 ?auto_145288 ) ) ( not ( = ?auto_145284 ?auto_145289 ) ) ( not ( = ?auto_145284 ?auto_145290 ) ) ( not ( = ?auto_145285 ?auto_145286 ) ) ( not ( = ?auto_145285 ?auto_145287 ) ) ( not ( = ?auto_145285 ?auto_145288 ) ) ( not ( = ?auto_145285 ?auto_145289 ) ) ( not ( = ?auto_145285 ?auto_145290 ) ) ( not ( = ?auto_145286 ?auto_145287 ) ) ( not ( = ?auto_145286 ?auto_145288 ) ) ( not ( = ?auto_145286 ?auto_145289 ) ) ( not ( = ?auto_145286 ?auto_145290 ) ) ( not ( = ?auto_145287 ?auto_145288 ) ) ( not ( = ?auto_145287 ?auto_145289 ) ) ( not ( = ?auto_145287 ?auto_145290 ) ) ( not ( = ?auto_145288 ?auto_145289 ) ) ( not ( = ?auto_145288 ?auto_145290 ) ) ( not ( = ?auto_145289 ?auto_145290 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_145290 )
      ( !STACK ?auto_145290 ?auto_145289 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_145302 - BLOCK
      ?auto_145303 - BLOCK
      ?auto_145304 - BLOCK
      ?auto_145305 - BLOCK
      ?auto_145306 - BLOCK
      ?auto_145307 - BLOCK
      ?auto_145308 - BLOCK
      ?auto_145309 - BLOCK
      ?auto_145310 - BLOCK
      ?auto_145311 - BLOCK
      ?auto_145312 - BLOCK
    )
    :vars
    (
      ?auto_145313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145312 ?auto_145313 ) ( ON-TABLE ?auto_145302 ) ( ON ?auto_145303 ?auto_145302 ) ( ON ?auto_145304 ?auto_145303 ) ( ON ?auto_145305 ?auto_145304 ) ( ON ?auto_145306 ?auto_145305 ) ( ON ?auto_145307 ?auto_145306 ) ( ON ?auto_145308 ?auto_145307 ) ( ON ?auto_145309 ?auto_145308 ) ( ON ?auto_145310 ?auto_145309 ) ( not ( = ?auto_145302 ?auto_145303 ) ) ( not ( = ?auto_145302 ?auto_145304 ) ) ( not ( = ?auto_145302 ?auto_145305 ) ) ( not ( = ?auto_145302 ?auto_145306 ) ) ( not ( = ?auto_145302 ?auto_145307 ) ) ( not ( = ?auto_145302 ?auto_145308 ) ) ( not ( = ?auto_145302 ?auto_145309 ) ) ( not ( = ?auto_145302 ?auto_145310 ) ) ( not ( = ?auto_145302 ?auto_145311 ) ) ( not ( = ?auto_145302 ?auto_145312 ) ) ( not ( = ?auto_145302 ?auto_145313 ) ) ( not ( = ?auto_145303 ?auto_145304 ) ) ( not ( = ?auto_145303 ?auto_145305 ) ) ( not ( = ?auto_145303 ?auto_145306 ) ) ( not ( = ?auto_145303 ?auto_145307 ) ) ( not ( = ?auto_145303 ?auto_145308 ) ) ( not ( = ?auto_145303 ?auto_145309 ) ) ( not ( = ?auto_145303 ?auto_145310 ) ) ( not ( = ?auto_145303 ?auto_145311 ) ) ( not ( = ?auto_145303 ?auto_145312 ) ) ( not ( = ?auto_145303 ?auto_145313 ) ) ( not ( = ?auto_145304 ?auto_145305 ) ) ( not ( = ?auto_145304 ?auto_145306 ) ) ( not ( = ?auto_145304 ?auto_145307 ) ) ( not ( = ?auto_145304 ?auto_145308 ) ) ( not ( = ?auto_145304 ?auto_145309 ) ) ( not ( = ?auto_145304 ?auto_145310 ) ) ( not ( = ?auto_145304 ?auto_145311 ) ) ( not ( = ?auto_145304 ?auto_145312 ) ) ( not ( = ?auto_145304 ?auto_145313 ) ) ( not ( = ?auto_145305 ?auto_145306 ) ) ( not ( = ?auto_145305 ?auto_145307 ) ) ( not ( = ?auto_145305 ?auto_145308 ) ) ( not ( = ?auto_145305 ?auto_145309 ) ) ( not ( = ?auto_145305 ?auto_145310 ) ) ( not ( = ?auto_145305 ?auto_145311 ) ) ( not ( = ?auto_145305 ?auto_145312 ) ) ( not ( = ?auto_145305 ?auto_145313 ) ) ( not ( = ?auto_145306 ?auto_145307 ) ) ( not ( = ?auto_145306 ?auto_145308 ) ) ( not ( = ?auto_145306 ?auto_145309 ) ) ( not ( = ?auto_145306 ?auto_145310 ) ) ( not ( = ?auto_145306 ?auto_145311 ) ) ( not ( = ?auto_145306 ?auto_145312 ) ) ( not ( = ?auto_145306 ?auto_145313 ) ) ( not ( = ?auto_145307 ?auto_145308 ) ) ( not ( = ?auto_145307 ?auto_145309 ) ) ( not ( = ?auto_145307 ?auto_145310 ) ) ( not ( = ?auto_145307 ?auto_145311 ) ) ( not ( = ?auto_145307 ?auto_145312 ) ) ( not ( = ?auto_145307 ?auto_145313 ) ) ( not ( = ?auto_145308 ?auto_145309 ) ) ( not ( = ?auto_145308 ?auto_145310 ) ) ( not ( = ?auto_145308 ?auto_145311 ) ) ( not ( = ?auto_145308 ?auto_145312 ) ) ( not ( = ?auto_145308 ?auto_145313 ) ) ( not ( = ?auto_145309 ?auto_145310 ) ) ( not ( = ?auto_145309 ?auto_145311 ) ) ( not ( = ?auto_145309 ?auto_145312 ) ) ( not ( = ?auto_145309 ?auto_145313 ) ) ( not ( = ?auto_145310 ?auto_145311 ) ) ( not ( = ?auto_145310 ?auto_145312 ) ) ( not ( = ?auto_145310 ?auto_145313 ) ) ( not ( = ?auto_145311 ?auto_145312 ) ) ( not ( = ?auto_145311 ?auto_145313 ) ) ( not ( = ?auto_145312 ?auto_145313 ) ) ( CLEAR ?auto_145310 ) ( ON ?auto_145311 ?auto_145312 ) ( CLEAR ?auto_145311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_145302 ?auto_145303 ?auto_145304 ?auto_145305 ?auto_145306 ?auto_145307 ?auto_145308 ?auto_145309 ?auto_145310 ?auto_145311 )
      ( MAKE-11PILE ?auto_145302 ?auto_145303 ?auto_145304 ?auto_145305 ?auto_145306 ?auto_145307 ?auto_145308 ?auto_145309 ?auto_145310 ?auto_145311 ?auto_145312 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_145325 - BLOCK
      ?auto_145326 - BLOCK
      ?auto_145327 - BLOCK
      ?auto_145328 - BLOCK
      ?auto_145329 - BLOCK
      ?auto_145330 - BLOCK
      ?auto_145331 - BLOCK
      ?auto_145332 - BLOCK
      ?auto_145333 - BLOCK
      ?auto_145334 - BLOCK
      ?auto_145335 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145335 ) ( ON-TABLE ?auto_145325 ) ( ON ?auto_145326 ?auto_145325 ) ( ON ?auto_145327 ?auto_145326 ) ( ON ?auto_145328 ?auto_145327 ) ( ON ?auto_145329 ?auto_145328 ) ( ON ?auto_145330 ?auto_145329 ) ( ON ?auto_145331 ?auto_145330 ) ( ON ?auto_145332 ?auto_145331 ) ( ON ?auto_145333 ?auto_145332 ) ( not ( = ?auto_145325 ?auto_145326 ) ) ( not ( = ?auto_145325 ?auto_145327 ) ) ( not ( = ?auto_145325 ?auto_145328 ) ) ( not ( = ?auto_145325 ?auto_145329 ) ) ( not ( = ?auto_145325 ?auto_145330 ) ) ( not ( = ?auto_145325 ?auto_145331 ) ) ( not ( = ?auto_145325 ?auto_145332 ) ) ( not ( = ?auto_145325 ?auto_145333 ) ) ( not ( = ?auto_145325 ?auto_145334 ) ) ( not ( = ?auto_145325 ?auto_145335 ) ) ( not ( = ?auto_145326 ?auto_145327 ) ) ( not ( = ?auto_145326 ?auto_145328 ) ) ( not ( = ?auto_145326 ?auto_145329 ) ) ( not ( = ?auto_145326 ?auto_145330 ) ) ( not ( = ?auto_145326 ?auto_145331 ) ) ( not ( = ?auto_145326 ?auto_145332 ) ) ( not ( = ?auto_145326 ?auto_145333 ) ) ( not ( = ?auto_145326 ?auto_145334 ) ) ( not ( = ?auto_145326 ?auto_145335 ) ) ( not ( = ?auto_145327 ?auto_145328 ) ) ( not ( = ?auto_145327 ?auto_145329 ) ) ( not ( = ?auto_145327 ?auto_145330 ) ) ( not ( = ?auto_145327 ?auto_145331 ) ) ( not ( = ?auto_145327 ?auto_145332 ) ) ( not ( = ?auto_145327 ?auto_145333 ) ) ( not ( = ?auto_145327 ?auto_145334 ) ) ( not ( = ?auto_145327 ?auto_145335 ) ) ( not ( = ?auto_145328 ?auto_145329 ) ) ( not ( = ?auto_145328 ?auto_145330 ) ) ( not ( = ?auto_145328 ?auto_145331 ) ) ( not ( = ?auto_145328 ?auto_145332 ) ) ( not ( = ?auto_145328 ?auto_145333 ) ) ( not ( = ?auto_145328 ?auto_145334 ) ) ( not ( = ?auto_145328 ?auto_145335 ) ) ( not ( = ?auto_145329 ?auto_145330 ) ) ( not ( = ?auto_145329 ?auto_145331 ) ) ( not ( = ?auto_145329 ?auto_145332 ) ) ( not ( = ?auto_145329 ?auto_145333 ) ) ( not ( = ?auto_145329 ?auto_145334 ) ) ( not ( = ?auto_145329 ?auto_145335 ) ) ( not ( = ?auto_145330 ?auto_145331 ) ) ( not ( = ?auto_145330 ?auto_145332 ) ) ( not ( = ?auto_145330 ?auto_145333 ) ) ( not ( = ?auto_145330 ?auto_145334 ) ) ( not ( = ?auto_145330 ?auto_145335 ) ) ( not ( = ?auto_145331 ?auto_145332 ) ) ( not ( = ?auto_145331 ?auto_145333 ) ) ( not ( = ?auto_145331 ?auto_145334 ) ) ( not ( = ?auto_145331 ?auto_145335 ) ) ( not ( = ?auto_145332 ?auto_145333 ) ) ( not ( = ?auto_145332 ?auto_145334 ) ) ( not ( = ?auto_145332 ?auto_145335 ) ) ( not ( = ?auto_145333 ?auto_145334 ) ) ( not ( = ?auto_145333 ?auto_145335 ) ) ( not ( = ?auto_145334 ?auto_145335 ) ) ( CLEAR ?auto_145333 ) ( ON ?auto_145334 ?auto_145335 ) ( CLEAR ?auto_145334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_145325 ?auto_145326 ?auto_145327 ?auto_145328 ?auto_145329 ?auto_145330 ?auto_145331 ?auto_145332 ?auto_145333 ?auto_145334 )
      ( MAKE-11PILE ?auto_145325 ?auto_145326 ?auto_145327 ?auto_145328 ?auto_145329 ?auto_145330 ?auto_145331 ?auto_145332 ?auto_145333 ?auto_145334 ?auto_145335 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_145347 - BLOCK
      ?auto_145348 - BLOCK
      ?auto_145349 - BLOCK
      ?auto_145350 - BLOCK
      ?auto_145351 - BLOCK
      ?auto_145352 - BLOCK
      ?auto_145353 - BLOCK
      ?auto_145354 - BLOCK
      ?auto_145355 - BLOCK
      ?auto_145356 - BLOCK
      ?auto_145357 - BLOCK
    )
    :vars
    (
      ?auto_145358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145357 ?auto_145358 ) ( ON-TABLE ?auto_145347 ) ( ON ?auto_145348 ?auto_145347 ) ( ON ?auto_145349 ?auto_145348 ) ( ON ?auto_145350 ?auto_145349 ) ( ON ?auto_145351 ?auto_145350 ) ( ON ?auto_145352 ?auto_145351 ) ( ON ?auto_145353 ?auto_145352 ) ( ON ?auto_145354 ?auto_145353 ) ( not ( = ?auto_145347 ?auto_145348 ) ) ( not ( = ?auto_145347 ?auto_145349 ) ) ( not ( = ?auto_145347 ?auto_145350 ) ) ( not ( = ?auto_145347 ?auto_145351 ) ) ( not ( = ?auto_145347 ?auto_145352 ) ) ( not ( = ?auto_145347 ?auto_145353 ) ) ( not ( = ?auto_145347 ?auto_145354 ) ) ( not ( = ?auto_145347 ?auto_145355 ) ) ( not ( = ?auto_145347 ?auto_145356 ) ) ( not ( = ?auto_145347 ?auto_145357 ) ) ( not ( = ?auto_145347 ?auto_145358 ) ) ( not ( = ?auto_145348 ?auto_145349 ) ) ( not ( = ?auto_145348 ?auto_145350 ) ) ( not ( = ?auto_145348 ?auto_145351 ) ) ( not ( = ?auto_145348 ?auto_145352 ) ) ( not ( = ?auto_145348 ?auto_145353 ) ) ( not ( = ?auto_145348 ?auto_145354 ) ) ( not ( = ?auto_145348 ?auto_145355 ) ) ( not ( = ?auto_145348 ?auto_145356 ) ) ( not ( = ?auto_145348 ?auto_145357 ) ) ( not ( = ?auto_145348 ?auto_145358 ) ) ( not ( = ?auto_145349 ?auto_145350 ) ) ( not ( = ?auto_145349 ?auto_145351 ) ) ( not ( = ?auto_145349 ?auto_145352 ) ) ( not ( = ?auto_145349 ?auto_145353 ) ) ( not ( = ?auto_145349 ?auto_145354 ) ) ( not ( = ?auto_145349 ?auto_145355 ) ) ( not ( = ?auto_145349 ?auto_145356 ) ) ( not ( = ?auto_145349 ?auto_145357 ) ) ( not ( = ?auto_145349 ?auto_145358 ) ) ( not ( = ?auto_145350 ?auto_145351 ) ) ( not ( = ?auto_145350 ?auto_145352 ) ) ( not ( = ?auto_145350 ?auto_145353 ) ) ( not ( = ?auto_145350 ?auto_145354 ) ) ( not ( = ?auto_145350 ?auto_145355 ) ) ( not ( = ?auto_145350 ?auto_145356 ) ) ( not ( = ?auto_145350 ?auto_145357 ) ) ( not ( = ?auto_145350 ?auto_145358 ) ) ( not ( = ?auto_145351 ?auto_145352 ) ) ( not ( = ?auto_145351 ?auto_145353 ) ) ( not ( = ?auto_145351 ?auto_145354 ) ) ( not ( = ?auto_145351 ?auto_145355 ) ) ( not ( = ?auto_145351 ?auto_145356 ) ) ( not ( = ?auto_145351 ?auto_145357 ) ) ( not ( = ?auto_145351 ?auto_145358 ) ) ( not ( = ?auto_145352 ?auto_145353 ) ) ( not ( = ?auto_145352 ?auto_145354 ) ) ( not ( = ?auto_145352 ?auto_145355 ) ) ( not ( = ?auto_145352 ?auto_145356 ) ) ( not ( = ?auto_145352 ?auto_145357 ) ) ( not ( = ?auto_145352 ?auto_145358 ) ) ( not ( = ?auto_145353 ?auto_145354 ) ) ( not ( = ?auto_145353 ?auto_145355 ) ) ( not ( = ?auto_145353 ?auto_145356 ) ) ( not ( = ?auto_145353 ?auto_145357 ) ) ( not ( = ?auto_145353 ?auto_145358 ) ) ( not ( = ?auto_145354 ?auto_145355 ) ) ( not ( = ?auto_145354 ?auto_145356 ) ) ( not ( = ?auto_145354 ?auto_145357 ) ) ( not ( = ?auto_145354 ?auto_145358 ) ) ( not ( = ?auto_145355 ?auto_145356 ) ) ( not ( = ?auto_145355 ?auto_145357 ) ) ( not ( = ?auto_145355 ?auto_145358 ) ) ( not ( = ?auto_145356 ?auto_145357 ) ) ( not ( = ?auto_145356 ?auto_145358 ) ) ( not ( = ?auto_145357 ?auto_145358 ) ) ( ON ?auto_145356 ?auto_145357 ) ( CLEAR ?auto_145354 ) ( ON ?auto_145355 ?auto_145356 ) ( CLEAR ?auto_145355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_145347 ?auto_145348 ?auto_145349 ?auto_145350 ?auto_145351 ?auto_145352 ?auto_145353 ?auto_145354 ?auto_145355 )
      ( MAKE-11PILE ?auto_145347 ?auto_145348 ?auto_145349 ?auto_145350 ?auto_145351 ?auto_145352 ?auto_145353 ?auto_145354 ?auto_145355 ?auto_145356 ?auto_145357 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_145370 - BLOCK
      ?auto_145371 - BLOCK
      ?auto_145372 - BLOCK
      ?auto_145373 - BLOCK
      ?auto_145374 - BLOCK
      ?auto_145375 - BLOCK
      ?auto_145376 - BLOCK
      ?auto_145377 - BLOCK
      ?auto_145378 - BLOCK
      ?auto_145379 - BLOCK
      ?auto_145380 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145380 ) ( ON-TABLE ?auto_145370 ) ( ON ?auto_145371 ?auto_145370 ) ( ON ?auto_145372 ?auto_145371 ) ( ON ?auto_145373 ?auto_145372 ) ( ON ?auto_145374 ?auto_145373 ) ( ON ?auto_145375 ?auto_145374 ) ( ON ?auto_145376 ?auto_145375 ) ( ON ?auto_145377 ?auto_145376 ) ( not ( = ?auto_145370 ?auto_145371 ) ) ( not ( = ?auto_145370 ?auto_145372 ) ) ( not ( = ?auto_145370 ?auto_145373 ) ) ( not ( = ?auto_145370 ?auto_145374 ) ) ( not ( = ?auto_145370 ?auto_145375 ) ) ( not ( = ?auto_145370 ?auto_145376 ) ) ( not ( = ?auto_145370 ?auto_145377 ) ) ( not ( = ?auto_145370 ?auto_145378 ) ) ( not ( = ?auto_145370 ?auto_145379 ) ) ( not ( = ?auto_145370 ?auto_145380 ) ) ( not ( = ?auto_145371 ?auto_145372 ) ) ( not ( = ?auto_145371 ?auto_145373 ) ) ( not ( = ?auto_145371 ?auto_145374 ) ) ( not ( = ?auto_145371 ?auto_145375 ) ) ( not ( = ?auto_145371 ?auto_145376 ) ) ( not ( = ?auto_145371 ?auto_145377 ) ) ( not ( = ?auto_145371 ?auto_145378 ) ) ( not ( = ?auto_145371 ?auto_145379 ) ) ( not ( = ?auto_145371 ?auto_145380 ) ) ( not ( = ?auto_145372 ?auto_145373 ) ) ( not ( = ?auto_145372 ?auto_145374 ) ) ( not ( = ?auto_145372 ?auto_145375 ) ) ( not ( = ?auto_145372 ?auto_145376 ) ) ( not ( = ?auto_145372 ?auto_145377 ) ) ( not ( = ?auto_145372 ?auto_145378 ) ) ( not ( = ?auto_145372 ?auto_145379 ) ) ( not ( = ?auto_145372 ?auto_145380 ) ) ( not ( = ?auto_145373 ?auto_145374 ) ) ( not ( = ?auto_145373 ?auto_145375 ) ) ( not ( = ?auto_145373 ?auto_145376 ) ) ( not ( = ?auto_145373 ?auto_145377 ) ) ( not ( = ?auto_145373 ?auto_145378 ) ) ( not ( = ?auto_145373 ?auto_145379 ) ) ( not ( = ?auto_145373 ?auto_145380 ) ) ( not ( = ?auto_145374 ?auto_145375 ) ) ( not ( = ?auto_145374 ?auto_145376 ) ) ( not ( = ?auto_145374 ?auto_145377 ) ) ( not ( = ?auto_145374 ?auto_145378 ) ) ( not ( = ?auto_145374 ?auto_145379 ) ) ( not ( = ?auto_145374 ?auto_145380 ) ) ( not ( = ?auto_145375 ?auto_145376 ) ) ( not ( = ?auto_145375 ?auto_145377 ) ) ( not ( = ?auto_145375 ?auto_145378 ) ) ( not ( = ?auto_145375 ?auto_145379 ) ) ( not ( = ?auto_145375 ?auto_145380 ) ) ( not ( = ?auto_145376 ?auto_145377 ) ) ( not ( = ?auto_145376 ?auto_145378 ) ) ( not ( = ?auto_145376 ?auto_145379 ) ) ( not ( = ?auto_145376 ?auto_145380 ) ) ( not ( = ?auto_145377 ?auto_145378 ) ) ( not ( = ?auto_145377 ?auto_145379 ) ) ( not ( = ?auto_145377 ?auto_145380 ) ) ( not ( = ?auto_145378 ?auto_145379 ) ) ( not ( = ?auto_145378 ?auto_145380 ) ) ( not ( = ?auto_145379 ?auto_145380 ) ) ( ON ?auto_145379 ?auto_145380 ) ( CLEAR ?auto_145377 ) ( ON ?auto_145378 ?auto_145379 ) ( CLEAR ?auto_145378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_145370 ?auto_145371 ?auto_145372 ?auto_145373 ?auto_145374 ?auto_145375 ?auto_145376 ?auto_145377 ?auto_145378 )
      ( MAKE-11PILE ?auto_145370 ?auto_145371 ?auto_145372 ?auto_145373 ?auto_145374 ?auto_145375 ?auto_145376 ?auto_145377 ?auto_145378 ?auto_145379 ?auto_145380 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_145392 - BLOCK
      ?auto_145393 - BLOCK
      ?auto_145394 - BLOCK
      ?auto_145395 - BLOCK
      ?auto_145396 - BLOCK
      ?auto_145397 - BLOCK
      ?auto_145398 - BLOCK
      ?auto_145399 - BLOCK
      ?auto_145400 - BLOCK
      ?auto_145401 - BLOCK
      ?auto_145402 - BLOCK
    )
    :vars
    (
      ?auto_145403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145402 ?auto_145403 ) ( ON-TABLE ?auto_145392 ) ( ON ?auto_145393 ?auto_145392 ) ( ON ?auto_145394 ?auto_145393 ) ( ON ?auto_145395 ?auto_145394 ) ( ON ?auto_145396 ?auto_145395 ) ( ON ?auto_145397 ?auto_145396 ) ( ON ?auto_145398 ?auto_145397 ) ( not ( = ?auto_145392 ?auto_145393 ) ) ( not ( = ?auto_145392 ?auto_145394 ) ) ( not ( = ?auto_145392 ?auto_145395 ) ) ( not ( = ?auto_145392 ?auto_145396 ) ) ( not ( = ?auto_145392 ?auto_145397 ) ) ( not ( = ?auto_145392 ?auto_145398 ) ) ( not ( = ?auto_145392 ?auto_145399 ) ) ( not ( = ?auto_145392 ?auto_145400 ) ) ( not ( = ?auto_145392 ?auto_145401 ) ) ( not ( = ?auto_145392 ?auto_145402 ) ) ( not ( = ?auto_145392 ?auto_145403 ) ) ( not ( = ?auto_145393 ?auto_145394 ) ) ( not ( = ?auto_145393 ?auto_145395 ) ) ( not ( = ?auto_145393 ?auto_145396 ) ) ( not ( = ?auto_145393 ?auto_145397 ) ) ( not ( = ?auto_145393 ?auto_145398 ) ) ( not ( = ?auto_145393 ?auto_145399 ) ) ( not ( = ?auto_145393 ?auto_145400 ) ) ( not ( = ?auto_145393 ?auto_145401 ) ) ( not ( = ?auto_145393 ?auto_145402 ) ) ( not ( = ?auto_145393 ?auto_145403 ) ) ( not ( = ?auto_145394 ?auto_145395 ) ) ( not ( = ?auto_145394 ?auto_145396 ) ) ( not ( = ?auto_145394 ?auto_145397 ) ) ( not ( = ?auto_145394 ?auto_145398 ) ) ( not ( = ?auto_145394 ?auto_145399 ) ) ( not ( = ?auto_145394 ?auto_145400 ) ) ( not ( = ?auto_145394 ?auto_145401 ) ) ( not ( = ?auto_145394 ?auto_145402 ) ) ( not ( = ?auto_145394 ?auto_145403 ) ) ( not ( = ?auto_145395 ?auto_145396 ) ) ( not ( = ?auto_145395 ?auto_145397 ) ) ( not ( = ?auto_145395 ?auto_145398 ) ) ( not ( = ?auto_145395 ?auto_145399 ) ) ( not ( = ?auto_145395 ?auto_145400 ) ) ( not ( = ?auto_145395 ?auto_145401 ) ) ( not ( = ?auto_145395 ?auto_145402 ) ) ( not ( = ?auto_145395 ?auto_145403 ) ) ( not ( = ?auto_145396 ?auto_145397 ) ) ( not ( = ?auto_145396 ?auto_145398 ) ) ( not ( = ?auto_145396 ?auto_145399 ) ) ( not ( = ?auto_145396 ?auto_145400 ) ) ( not ( = ?auto_145396 ?auto_145401 ) ) ( not ( = ?auto_145396 ?auto_145402 ) ) ( not ( = ?auto_145396 ?auto_145403 ) ) ( not ( = ?auto_145397 ?auto_145398 ) ) ( not ( = ?auto_145397 ?auto_145399 ) ) ( not ( = ?auto_145397 ?auto_145400 ) ) ( not ( = ?auto_145397 ?auto_145401 ) ) ( not ( = ?auto_145397 ?auto_145402 ) ) ( not ( = ?auto_145397 ?auto_145403 ) ) ( not ( = ?auto_145398 ?auto_145399 ) ) ( not ( = ?auto_145398 ?auto_145400 ) ) ( not ( = ?auto_145398 ?auto_145401 ) ) ( not ( = ?auto_145398 ?auto_145402 ) ) ( not ( = ?auto_145398 ?auto_145403 ) ) ( not ( = ?auto_145399 ?auto_145400 ) ) ( not ( = ?auto_145399 ?auto_145401 ) ) ( not ( = ?auto_145399 ?auto_145402 ) ) ( not ( = ?auto_145399 ?auto_145403 ) ) ( not ( = ?auto_145400 ?auto_145401 ) ) ( not ( = ?auto_145400 ?auto_145402 ) ) ( not ( = ?auto_145400 ?auto_145403 ) ) ( not ( = ?auto_145401 ?auto_145402 ) ) ( not ( = ?auto_145401 ?auto_145403 ) ) ( not ( = ?auto_145402 ?auto_145403 ) ) ( ON ?auto_145401 ?auto_145402 ) ( ON ?auto_145400 ?auto_145401 ) ( CLEAR ?auto_145398 ) ( ON ?auto_145399 ?auto_145400 ) ( CLEAR ?auto_145399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_145392 ?auto_145393 ?auto_145394 ?auto_145395 ?auto_145396 ?auto_145397 ?auto_145398 ?auto_145399 )
      ( MAKE-11PILE ?auto_145392 ?auto_145393 ?auto_145394 ?auto_145395 ?auto_145396 ?auto_145397 ?auto_145398 ?auto_145399 ?auto_145400 ?auto_145401 ?auto_145402 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_145415 - BLOCK
      ?auto_145416 - BLOCK
      ?auto_145417 - BLOCK
      ?auto_145418 - BLOCK
      ?auto_145419 - BLOCK
      ?auto_145420 - BLOCK
      ?auto_145421 - BLOCK
      ?auto_145422 - BLOCK
      ?auto_145423 - BLOCK
      ?auto_145424 - BLOCK
      ?auto_145425 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145425 ) ( ON-TABLE ?auto_145415 ) ( ON ?auto_145416 ?auto_145415 ) ( ON ?auto_145417 ?auto_145416 ) ( ON ?auto_145418 ?auto_145417 ) ( ON ?auto_145419 ?auto_145418 ) ( ON ?auto_145420 ?auto_145419 ) ( ON ?auto_145421 ?auto_145420 ) ( not ( = ?auto_145415 ?auto_145416 ) ) ( not ( = ?auto_145415 ?auto_145417 ) ) ( not ( = ?auto_145415 ?auto_145418 ) ) ( not ( = ?auto_145415 ?auto_145419 ) ) ( not ( = ?auto_145415 ?auto_145420 ) ) ( not ( = ?auto_145415 ?auto_145421 ) ) ( not ( = ?auto_145415 ?auto_145422 ) ) ( not ( = ?auto_145415 ?auto_145423 ) ) ( not ( = ?auto_145415 ?auto_145424 ) ) ( not ( = ?auto_145415 ?auto_145425 ) ) ( not ( = ?auto_145416 ?auto_145417 ) ) ( not ( = ?auto_145416 ?auto_145418 ) ) ( not ( = ?auto_145416 ?auto_145419 ) ) ( not ( = ?auto_145416 ?auto_145420 ) ) ( not ( = ?auto_145416 ?auto_145421 ) ) ( not ( = ?auto_145416 ?auto_145422 ) ) ( not ( = ?auto_145416 ?auto_145423 ) ) ( not ( = ?auto_145416 ?auto_145424 ) ) ( not ( = ?auto_145416 ?auto_145425 ) ) ( not ( = ?auto_145417 ?auto_145418 ) ) ( not ( = ?auto_145417 ?auto_145419 ) ) ( not ( = ?auto_145417 ?auto_145420 ) ) ( not ( = ?auto_145417 ?auto_145421 ) ) ( not ( = ?auto_145417 ?auto_145422 ) ) ( not ( = ?auto_145417 ?auto_145423 ) ) ( not ( = ?auto_145417 ?auto_145424 ) ) ( not ( = ?auto_145417 ?auto_145425 ) ) ( not ( = ?auto_145418 ?auto_145419 ) ) ( not ( = ?auto_145418 ?auto_145420 ) ) ( not ( = ?auto_145418 ?auto_145421 ) ) ( not ( = ?auto_145418 ?auto_145422 ) ) ( not ( = ?auto_145418 ?auto_145423 ) ) ( not ( = ?auto_145418 ?auto_145424 ) ) ( not ( = ?auto_145418 ?auto_145425 ) ) ( not ( = ?auto_145419 ?auto_145420 ) ) ( not ( = ?auto_145419 ?auto_145421 ) ) ( not ( = ?auto_145419 ?auto_145422 ) ) ( not ( = ?auto_145419 ?auto_145423 ) ) ( not ( = ?auto_145419 ?auto_145424 ) ) ( not ( = ?auto_145419 ?auto_145425 ) ) ( not ( = ?auto_145420 ?auto_145421 ) ) ( not ( = ?auto_145420 ?auto_145422 ) ) ( not ( = ?auto_145420 ?auto_145423 ) ) ( not ( = ?auto_145420 ?auto_145424 ) ) ( not ( = ?auto_145420 ?auto_145425 ) ) ( not ( = ?auto_145421 ?auto_145422 ) ) ( not ( = ?auto_145421 ?auto_145423 ) ) ( not ( = ?auto_145421 ?auto_145424 ) ) ( not ( = ?auto_145421 ?auto_145425 ) ) ( not ( = ?auto_145422 ?auto_145423 ) ) ( not ( = ?auto_145422 ?auto_145424 ) ) ( not ( = ?auto_145422 ?auto_145425 ) ) ( not ( = ?auto_145423 ?auto_145424 ) ) ( not ( = ?auto_145423 ?auto_145425 ) ) ( not ( = ?auto_145424 ?auto_145425 ) ) ( ON ?auto_145424 ?auto_145425 ) ( ON ?auto_145423 ?auto_145424 ) ( CLEAR ?auto_145421 ) ( ON ?auto_145422 ?auto_145423 ) ( CLEAR ?auto_145422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_145415 ?auto_145416 ?auto_145417 ?auto_145418 ?auto_145419 ?auto_145420 ?auto_145421 ?auto_145422 )
      ( MAKE-11PILE ?auto_145415 ?auto_145416 ?auto_145417 ?auto_145418 ?auto_145419 ?auto_145420 ?auto_145421 ?auto_145422 ?auto_145423 ?auto_145424 ?auto_145425 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_145437 - BLOCK
      ?auto_145438 - BLOCK
      ?auto_145439 - BLOCK
      ?auto_145440 - BLOCK
      ?auto_145441 - BLOCK
      ?auto_145442 - BLOCK
      ?auto_145443 - BLOCK
      ?auto_145444 - BLOCK
      ?auto_145445 - BLOCK
      ?auto_145446 - BLOCK
      ?auto_145447 - BLOCK
    )
    :vars
    (
      ?auto_145448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145447 ?auto_145448 ) ( ON-TABLE ?auto_145437 ) ( ON ?auto_145438 ?auto_145437 ) ( ON ?auto_145439 ?auto_145438 ) ( ON ?auto_145440 ?auto_145439 ) ( ON ?auto_145441 ?auto_145440 ) ( ON ?auto_145442 ?auto_145441 ) ( not ( = ?auto_145437 ?auto_145438 ) ) ( not ( = ?auto_145437 ?auto_145439 ) ) ( not ( = ?auto_145437 ?auto_145440 ) ) ( not ( = ?auto_145437 ?auto_145441 ) ) ( not ( = ?auto_145437 ?auto_145442 ) ) ( not ( = ?auto_145437 ?auto_145443 ) ) ( not ( = ?auto_145437 ?auto_145444 ) ) ( not ( = ?auto_145437 ?auto_145445 ) ) ( not ( = ?auto_145437 ?auto_145446 ) ) ( not ( = ?auto_145437 ?auto_145447 ) ) ( not ( = ?auto_145437 ?auto_145448 ) ) ( not ( = ?auto_145438 ?auto_145439 ) ) ( not ( = ?auto_145438 ?auto_145440 ) ) ( not ( = ?auto_145438 ?auto_145441 ) ) ( not ( = ?auto_145438 ?auto_145442 ) ) ( not ( = ?auto_145438 ?auto_145443 ) ) ( not ( = ?auto_145438 ?auto_145444 ) ) ( not ( = ?auto_145438 ?auto_145445 ) ) ( not ( = ?auto_145438 ?auto_145446 ) ) ( not ( = ?auto_145438 ?auto_145447 ) ) ( not ( = ?auto_145438 ?auto_145448 ) ) ( not ( = ?auto_145439 ?auto_145440 ) ) ( not ( = ?auto_145439 ?auto_145441 ) ) ( not ( = ?auto_145439 ?auto_145442 ) ) ( not ( = ?auto_145439 ?auto_145443 ) ) ( not ( = ?auto_145439 ?auto_145444 ) ) ( not ( = ?auto_145439 ?auto_145445 ) ) ( not ( = ?auto_145439 ?auto_145446 ) ) ( not ( = ?auto_145439 ?auto_145447 ) ) ( not ( = ?auto_145439 ?auto_145448 ) ) ( not ( = ?auto_145440 ?auto_145441 ) ) ( not ( = ?auto_145440 ?auto_145442 ) ) ( not ( = ?auto_145440 ?auto_145443 ) ) ( not ( = ?auto_145440 ?auto_145444 ) ) ( not ( = ?auto_145440 ?auto_145445 ) ) ( not ( = ?auto_145440 ?auto_145446 ) ) ( not ( = ?auto_145440 ?auto_145447 ) ) ( not ( = ?auto_145440 ?auto_145448 ) ) ( not ( = ?auto_145441 ?auto_145442 ) ) ( not ( = ?auto_145441 ?auto_145443 ) ) ( not ( = ?auto_145441 ?auto_145444 ) ) ( not ( = ?auto_145441 ?auto_145445 ) ) ( not ( = ?auto_145441 ?auto_145446 ) ) ( not ( = ?auto_145441 ?auto_145447 ) ) ( not ( = ?auto_145441 ?auto_145448 ) ) ( not ( = ?auto_145442 ?auto_145443 ) ) ( not ( = ?auto_145442 ?auto_145444 ) ) ( not ( = ?auto_145442 ?auto_145445 ) ) ( not ( = ?auto_145442 ?auto_145446 ) ) ( not ( = ?auto_145442 ?auto_145447 ) ) ( not ( = ?auto_145442 ?auto_145448 ) ) ( not ( = ?auto_145443 ?auto_145444 ) ) ( not ( = ?auto_145443 ?auto_145445 ) ) ( not ( = ?auto_145443 ?auto_145446 ) ) ( not ( = ?auto_145443 ?auto_145447 ) ) ( not ( = ?auto_145443 ?auto_145448 ) ) ( not ( = ?auto_145444 ?auto_145445 ) ) ( not ( = ?auto_145444 ?auto_145446 ) ) ( not ( = ?auto_145444 ?auto_145447 ) ) ( not ( = ?auto_145444 ?auto_145448 ) ) ( not ( = ?auto_145445 ?auto_145446 ) ) ( not ( = ?auto_145445 ?auto_145447 ) ) ( not ( = ?auto_145445 ?auto_145448 ) ) ( not ( = ?auto_145446 ?auto_145447 ) ) ( not ( = ?auto_145446 ?auto_145448 ) ) ( not ( = ?auto_145447 ?auto_145448 ) ) ( ON ?auto_145446 ?auto_145447 ) ( ON ?auto_145445 ?auto_145446 ) ( ON ?auto_145444 ?auto_145445 ) ( CLEAR ?auto_145442 ) ( ON ?auto_145443 ?auto_145444 ) ( CLEAR ?auto_145443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145437 ?auto_145438 ?auto_145439 ?auto_145440 ?auto_145441 ?auto_145442 ?auto_145443 )
      ( MAKE-11PILE ?auto_145437 ?auto_145438 ?auto_145439 ?auto_145440 ?auto_145441 ?auto_145442 ?auto_145443 ?auto_145444 ?auto_145445 ?auto_145446 ?auto_145447 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_145460 - BLOCK
      ?auto_145461 - BLOCK
      ?auto_145462 - BLOCK
      ?auto_145463 - BLOCK
      ?auto_145464 - BLOCK
      ?auto_145465 - BLOCK
      ?auto_145466 - BLOCK
      ?auto_145467 - BLOCK
      ?auto_145468 - BLOCK
      ?auto_145469 - BLOCK
      ?auto_145470 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145470 ) ( ON-TABLE ?auto_145460 ) ( ON ?auto_145461 ?auto_145460 ) ( ON ?auto_145462 ?auto_145461 ) ( ON ?auto_145463 ?auto_145462 ) ( ON ?auto_145464 ?auto_145463 ) ( ON ?auto_145465 ?auto_145464 ) ( not ( = ?auto_145460 ?auto_145461 ) ) ( not ( = ?auto_145460 ?auto_145462 ) ) ( not ( = ?auto_145460 ?auto_145463 ) ) ( not ( = ?auto_145460 ?auto_145464 ) ) ( not ( = ?auto_145460 ?auto_145465 ) ) ( not ( = ?auto_145460 ?auto_145466 ) ) ( not ( = ?auto_145460 ?auto_145467 ) ) ( not ( = ?auto_145460 ?auto_145468 ) ) ( not ( = ?auto_145460 ?auto_145469 ) ) ( not ( = ?auto_145460 ?auto_145470 ) ) ( not ( = ?auto_145461 ?auto_145462 ) ) ( not ( = ?auto_145461 ?auto_145463 ) ) ( not ( = ?auto_145461 ?auto_145464 ) ) ( not ( = ?auto_145461 ?auto_145465 ) ) ( not ( = ?auto_145461 ?auto_145466 ) ) ( not ( = ?auto_145461 ?auto_145467 ) ) ( not ( = ?auto_145461 ?auto_145468 ) ) ( not ( = ?auto_145461 ?auto_145469 ) ) ( not ( = ?auto_145461 ?auto_145470 ) ) ( not ( = ?auto_145462 ?auto_145463 ) ) ( not ( = ?auto_145462 ?auto_145464 ) ) ( not ( = ?auto_145462 ?auto_145465 ) ) ( not ( = ?auto_145462 ?auto_145466 ) ) ( not ( = ?auto_145462 ?auto_145467 ) ) ( not ( = ?auto_145462 ?auto_145468 ) ) ( not ( = ?auto_145462 ?auto_145469 ) ) ( not ( = ?auto_145462 ?auto_145470 ) ) ( not ( = ?auto_145463 ?auto_145464 ) ) ( not ( = ?auto_145463 ?auto_145465 ) ) ( not ( = ?auto_145463 ?auto_145466 ) ) ( not ( = ?auto_145463 ?auto_145467 ) ) ( not ( = ?auto_145463 ?auto_145468 ) ) ( not ( = ?auto_145463 ?auto_145469 ) ) ( not ( = ?auto_145463 ?auto_145470 ) ) ( not ( = ?auto_145464 ?auto_145465 ) ) ( not ( = ?auto_145464 ?auto_145466 ) ) ( not ( = ?auto_145464 ?auto_145467 ) ) ( not ( = ?auto_145464 ?auto_145468 ) ) ( not ( = ?auto_145464 ?auto_145469 ) ) ( not ( = ?auto_145464 ?auto_145470 ) ) ( not ( = ?auto_145465 ?auto_145466 ) ) ( not ( = ?auto_145465 ?auto_145467 ) ) ( not ( = ?auto_145465 ?auto_145468 ) ) ( not ( = ?auto_145465 ?auto_145469 ) ) ( not ( = ?auto_145465 ?auto_145470 ) ) ( not ( = ?auto_145466 ?auto_145467 ) ) ( not ( = ?auto_145466 ?auto_145468 ) ) ( not ( = ?auto_145466 ?auto_145469 ) ) ( not ( = ?auto_145466 ?auto_145470 ) ) ( not ( = ?auto_145467 ?auto_145468 ) ) ( not ( = ?auto_145467 ?auto_145469 ) ) ( not ( = ?auto_145467 ?auto_145470 ) ) ( not ( = ?auto_145468 ?auto_145469 ) ) ( not ( = ?auto_145468 ?auto_145470 ) ) ( not ( = ?auto_145469 ?auto_145470 ) ) ( ON ?auto_145469 ?auto_145470 ) ( ON ?auto_145468 ?auto_145469 ) ( ON ?auto_145467 ?auto_145468 ) ( CLEAR ?auto_145465 ) ( ON ?auto_145466 ?auto_145467 ) ( CLEAR ?auto_145466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145460 ?auto_145461 ?auto_145462 ?auto_145463 ?auto_145464 ?auto_145465 ?auto_145466 )
      ( MAKE-11PILE ?auto_145460 ?auto_145461 ?auto_145462 ?auto_145463 ?auto_145464 ?auto_145465 ?auto_145466 ?auto_145467 ?auto_145468 ?auto_145469 ?auto_145470 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_145482 - BLOCK
      ?auto_145483 - BLOCK
      ?auto_145484 - BLOCK
      ?auto_145485 - BLOCK
      ?auto_145486 - BLOCK
      ?auto_145487 - BLOCK
      ?auto_145488 - BLOCK
      ?auto_145489 - BLOCK
      ?auto_145490 - BLOCK
      ?auto_145491 - BLOCK
      ?auto_145492 - BLOCK
    )
    :vars
    (
      ?auto_145493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145492 ?auto_145493 ) ( ON-TABLE ?auto_145482 ) ( ON ?auto_145483 ?auto_145482 ) ( ON ?auto_145484 ?auto_145483 ) ( ON ?auto_145485 ?auto_145484 ) ( ON ?auto_145486 ?auto_145485 ) ( not ( = ?auto_145482 ?auto_145483 ) ) ( not ( = ?auto_145482 ?auto_145484 ) ) ( not ( = ?auto_145482 ?auto_145485 ) ) ( not ( = ?auto_145482 ?auto_145486 ) ) ( not ( = ?auto_145482 ?auto_145487 ) ) ( not ( = ?auto_145482 ?auto_145488 ) ) ( not ( = ?auto_145482 ?auto_145489 ) ) ( not ( = ?auto_145482 ?auto_145490 ) ) ( not ( = ?auto_145482 ?auto_145491 ) ) ( not ( = ?auto_145482 ?auto_145492 ) ) ( not ( = ?auto_145482 ?auto_145493 ) ) ( not ( = ?auto_145483 ?auto_145484 ) ) ( not ( = ?auto_145483 ?auto_145485 ) ) ( not ( = ?auto_145483 ?auto_145486 ) ) ( not ( = ?auto_145483 ?auto_145487 ) ) ( not ( = ?auto_145483 ?auto_145488 ) ) ( not ( = ?auto_145483 ?auto_145489 ) ) ( not ( = ?auto_145483 ?auto_145490 ) ) ( not ( = ?auto_145483 ?auto_145491 ) ) ( not ( = ?auto_145483 ?auto_145492 ) ) ( not ( = ?auto_145483 ?auto_145493 ) ) ( not ( = ?auto_145484 ?auto_145485 ) ) ( not ( = ?auto_145484 ?auto_145486 ) ) ( not ( = ?auto_145484 ?auto_145487 ) ) ( not ( = ?auto_145484 ?auto_145488 ) ) ( not ( = ?auto_145484 ?auto_145489 ) ) ( not ( = ?auto_145484 ?auto_145490 ) ) ( not ( = ?auto_145484 ?auto_145491 ) ) ( not ( = ?auto_145484 ?auto_145492 ) ) ( not ( = ?auto_145484 ?auto_145493 ) ) ( not ( = ?auto_145485 ?auto_145486 ) ) ( not ( = ?auto_145485 ?auto_145487 ) ) ( not ( = ?auto_145485 ?auto_145488 ) ) ( not ( = ?auto_145485 ?auto_145489 ) ) ( not ( = ?auto_145485 ?auto_145490 ) ) ( not ( = ?auto_145485 ?auto_145491 ) ) ( not ( = ?auto_145485 ?auto_145492 ) ) ( not ( = ?auto_145485 ?auto_145493 ) ) ( not ( = ?auto_145486 ?auto_145487 ) ) ( not ( = ?auto_145486 ?auto_145488 ) ) ( not ( = ?auto_145486 ?auto_145489 ) ) ( not ( = ?auto_145486 ?auto_145490 ) ) ( not ( = ?auto_145486 ?auto_145491 ) ) ( not ( = ?auto_145486 ?auto_145492 ) ) ( not ( = ?auto_145486 ?auto_145493 ) ) ( not ( = ?auto_145487 ?auto_145488 ) ) ( not ( = ?auto_145487 ?auto_145489 ) ) ( not ( = ?auto_145487 ?auto_145490 ) ) ( not ( = ?auto_145487 ?auto_145491 ) ) ( not ( = ?auto_145487 ?auto_145492 ) ) ( not ( = ?auto_145487 ?auto_145493 ) ) ( not ( = ?auto_145488 ?auto_145489 ) ) ( not ( = ?auto_145488 ?auto_145490 ) ) ( not ( = ?auto_145488 ?auto_145491 ) ) ( not ( = ?auto_145488 ?auto_145492 ) ) ( not ( = ?auto_145488 ?auto_145493 ) ) ( not ( = ?auto_145489 ?auto_145490 ) ) ( not ( = ?auto_145489 ?auto_145491 ) ) ( not ( = ?auto_145489 ?auto_145492 ) ) ( not ( = ?auto_145489 ?auto_145493 ) ) ( not ( = ?auto_145490 ?auto_145491 ) ) ( not ( = ?auto_145490 ?auto_145492 ) ) ( not ( = ?auto_145490 ?auto_145493 ) ) ( not ( = ?auto_145491 ?auto_145492 ) ) ( not ( = ?auto_145491 ?auto_145493 ) ) ( not ( = ?auto_145492 ?auto_145493 ) ) ( ON ?auto_145491 ?auto_145492 ) ( ON ?auto_145490 ?auto_145491 ) ( ON ?auto_145489 ?auto_145490 ) ( ON ?auto_145488 ?auto_145489 ) ( CLEAR ?auto_145486 ) ( ON ?auto_145487 ?auto_145488 ) ( CLEAR ?auto_145487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145482 ?auto_145483 ?auto_145484 ?auto_145485 ?auto_145486 ?auto_145487 )
      ( MAKE-11PILE ?auto_145482 ?auto_145483 ?auto_145484 ?auto_145485 ?auto_145486 ?auto_145487 ?auto_145488 ?auto_145489 ?auto_145490 ?auto_145491 ?auto_145492 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_145505 - BLOCK
      ?auto_145506 - BLOCK
      ?auto_145507 - BLOCK
      ?auto_145508 - BLOCK
      ?auto_145509 - BLOCK
      ?auto_145510 - BLOCK
      ?auto_145511 - BLOCK
      ?auto_145512 - BLOCK
      ?auto_145513 - BLOCK
      ?auto_145514 - BLOCK
      ?auto_145515 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145515 ) ( ON-TABLE ?auto_145505 ) ( ON ?auto_145506 ?auto_145505 ) ( ON ?auto_145507 ?auto_145506 ) ( ON ?auto_145508 ?auto_145507 ) ( ON ?auto_145509 ?auto_145508 ) ( not ( = ?auto_145505 ?auto_145506 ) ) ( not ( = ?auto_145505 ?auto_145507 ) ) ( not ( = ?auto_145505 ?auto_145508 ) ) ( not ( = ?auto_145505 ?auto_145509 ) ) ( not ( = ?auto_145505 ?auto_145510 ) ) ( not ( = ?auto_145505 ?auto_145511 ) ) ( not ( = ?auto_145505 ?auto_145512 ) ) ( not ( = ?auto_145505 ?auto_145513 ) ) ( not ( = ?auto_145505 ?auto_145514 ) ) ( not ( = ?auto_145505 ?auto_145515 ) ) ( not ( = ?auto_145506 ?auto_145507 ) ) ( not ( = ?auto_145506 ?auto_145508 ) ) ( not ( = ?auto_145506 ?auto_145509 ) ) ( not ( = ?auto_145506 ?auto_145510 ) ) ( not ( = ?auto_145506 ?auto_145511 ) ) ( not ( = ?auto_145506 ?auto_145512 ) ) ( not ( = ?auto_145506 ?auto_145513 ) ) ( not ( = ?auto_145506 ?auto_145514 ) ) ( not ( = ?auto_145506 ?auto_145515 ) ) ( not ( = ?auto_145507 ?auto_145508 ) ) ( not ( = ?auto_145507 ?auto_145509 ) ) ( not ( = ?auto_145507 ?auto_145510 ) ) ( not ( = ?auto_145507 ?auto_145511 ) ) ( not ( = ?auto_145507 ?auto_145512 ) ) ( not ( = ?auto_145507 ?auto_145513 ) ) ( not ( = ?auto_145507 ?auto_145514 ) ) ( not ( = ?auto_145507 ?auto_145515 ) ) ( not ( = ?auto_145508 ?auto_145509 ) ) ( not ( = ?auto_145508 ?auto_145510 ) ) ( not ( = ?auto_145508 ?auto_145511 ) ) ( not ( = ?auto_145508 ?auto_145512 ) ) ( not ( = ?auto_145508 ?auto_145513 ) ) ( not ( = ?auto_145508 ?auto_145514 ) ) ( not ( = ?auto_145508 ?auto_145515 ) ) ( not ( = ?auto_145509 ?auto_145510 ) ) ( not ( = ?auto_145509 ?auto_145511 ) ) ( not ( = ?auto_145509 ?auto_145512 ) ) ( not ( = ?auto_145509 ?auto_145513 ) ) ( not ( = ?auto_145509 ?auto_145514 ) ) ( not ( = ?auto_145509 ?auto_145515 ) ) ( not ( = ?auto_145510 ?auto_145511 ) ) ( not ( = ?auto_145510 ?auto_145512 ) ) ( not ( = ?auto_145510 ?auto_145513 ) ) ( not ( = ?auto_145510 ?auto_145514 ) ) ( not ( = ?auto_145510 ?auto_145515 ) ) ( not ( = ?auto_145511 ?auto_145512 ) ) ( not ( = ?auto_145511 ?auto_145513 ) ) ( not ( = ?auto_145511 ?auto_145514 ) ) ( not ( = ?auto_145511 ?auto_145515 ) ) ( not ( = ?auto_145512 ?auto_145513 ) ) ( not ( = ?auto_145512 ?auto_145514 ) ) ( not ( = ?auto_145512 ?auto_145515 ) ) ( not ( = ?auto_145513 ?auto_145514 ) ) ( not ( = ?auto_145513 ?auto_145515 ) ) ( not ( = ?auto_145514 ?auto_145515 ) ) ( ON ?auto_145514 ?auto_145515 ) ( ON ?auto_145513 ?auto_145514 ) ( ON ?auto_145512 ?auto_145513 ) ( ON ?auto_145511 ?auto_145512 ) ( CLEAR ?auto_145509 ) ( ON ?auto_145510 ?auto_145511 ) ( CLEAR ?auto_145510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145505 ?auto_145506 ?auto_145507 ?auto_145508 ?auto_145509 ?auto_145510 )
      ( MAKE-11PILE ?auto_145505 ?auto_145506 ?auto_145507 ?auto_145508 ?auto_145509 ?auto_145510 ?auto_145511 ?auto_145512 ?auto_145513 ?auto_145514 ?auto_145515 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_145527 - BLOCK
      ?auto_145528 - BLOCK
      ?auto_145529 - BLOCK
      ?auto_145530 - BLOCK
      ?auto_145531 - BLOCK
      ?auto_145532 - BLOCK
      ?auto_145533 - BLOCK
      ?auto_145534 - BLOCK
      ?auto_145535 - BLOCK
      ?auto_145536 - BLOCK
      ?auto_145537 - BLOCK
    )
    :vars
    (
      ?auto_145538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145537 ?auto_145538 ) ( ON-TABLE ?auto_145527 ) ( ON ?auto_145528 ?auto_145527 ) ( ON ?auto_145529 ?auto_145528 ) ( ON ?auto_145530 ?auto_145529 ) ( not ( = ?auto_145527 ?auto_145528 ) ) ( not ( = ?auto_145527 ?auto_145529 ) ) ( not ( = ?auto_145527 ?auto_145530 ) ) ( not ( = ?auto_145527 ?auto_145531 ) ) ( not ( = ?auto_145527 ?auto_145532 ) ) ( not ( = ?auto_145527 ?auto_145533 ) ) ( not ( = ?auto_145527 ?auto_145534 ) ) ( not ( = ?auto_145527 ?auto_145535 ) ) ( not ( = ?auto_145527 ?auto_145536 ) ) ( not ( = ?auto_145527 ?auto_145537 ) ) ( not ( = ?auto_145527 ?auto_145538 ) ) ( not ( = ?auto_145528 ?auto_145529 ) ) ( not ( = ?auto_145528 ?auto_145530 ) ) ( not ( = ?auto_145528 ?auto_145531 ) ) ( not ( = ?auto_145528 ?auto_145532 ) ) ( not ( = ?auto_145528 ?auto_145533 ) ) ( not ( = ?auto_145528 ?auto_145534 ) ) ( not ( = ?auto_145528 ?auto_145535 ) ) ( not ( = ?auto_145528 ?auto_145536 ) ) ( not ( = ?auto_145528 ?auto_145537 ) ) ( not ( = ?auto_145528 ?auto_145538 ) ) ( not ( = ?auto_145529 ?auto_145530 ) ) ( not ( = ?auto_145529 ?auto_145531 ) ) ( not ( = ?auto_145529 ?auto_145532 ) ) ( not ( = ?auto_145529 ?auto_145533 ) ) ( not ( = ?auto_145529 ?auto_145534 ) ) ( not ( = ?auto_145529 ?auto_145535 ) ) ( not ( = ?auto_145529 ?auto_145536 ) ) ( not ( = ?auto_145529 ?auto_145537 ) ) ( not ( = ?auto_145529 ?auto_145538 ) ) ( not ( = ?auto_145530 ?auto_145531 ) ) ( not ( = ?auto_145530 ?auto_145532 ) ) ( not ( = ?auto_145530 ?auto_145533 ) ) ( not ( = ?auto_145530 ?auto_145534 ) ) ( not ( = ?auto_145530 ?auto_145535 ) ) ( not ( = ?auto_145530 ?auto_145536 ) ) ( not ( = ?auto_145530 ?auto_145537 ) ) ( not ( = ?auto_145530 ?auto_145538 ) ) ( not ( = ?auto_145531 ?auto_145532 ) ) ( not ( = ?auto_145531 ?auto_145533 ) ) ( not ( = ?auto_145531 ?auto_145534 ) ) ( not ( = ?auto_145531 ?auto_145535 ) ) ( not ( = ?auto_145531 ?auto_145536 ) ) ( not ( = ?auto_145531 ?auto_145537 ) ) ( not ( = ?auto_145531 ?auto_145538 ) ) ( not ( = ?auto_145532 ?auto_145533 ) ) ( not ( = ?auto_145532 ?auto_145534 ) ) ( not ( = ?auto_145532 ?auto_145535 ) ) ( not ( = ?auto_145532 ?auto_145536 ) ) ( not ( = ?auto_145532 ?auto_145537 ) ) ( not ( = ?auto_145532 ?auto_145538 ) ) ( not ( = ?auto_145533 ?auto_145534 ) ) ( not ( = ?auto_145533 ?auto_145535 ) ) ( not ( = ?auto_145533 ?auto_145536 ) ) ( not ( = ?auto_145533 ?auto_145537 ) ) ( not ( = ?auto_145533 ?auto_145538 ) ) ( not ( = ?auto_145534 ?auto_145535 ) ) ( not ( = ?auto_145534 ?auto_145536 ) ) ( not ( = ?auto_145534 ?auto_145537 ) ) ( not ( = ?auto_145534 ?auto_145538 ) ) ( not ( = ?auto_145535 ?auto_145536 ) ) ( not ( = ?auto_145535 ?auto_145537 ) ) ( not ( = ?auto_145535 ?auto_145538 ) ) ( not ( = ?auto_145536 ?auto_145537 ) ) ( not ( = ?auto_145536 ?auto_145538 ) ) ( not ( = ?auto_145537 ?auto_145538 ) ) ( ON ?auto_145536 ?auto_145537 ) ( ON ?auto_145535 ?auto_145536 ) ( ON ?auto_145534 ?auto_145535 ) ( ON ?auto_145533 ?auto_145534 ) ( ON ?auto_145532 ?auto_145533 ) ( CLEAR ?auto_145530 ) ( ON ?auto_145531 ?auto_145532 ) ( CLEAR ?auto_145531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_145527 ?auto_145528 ?auto_145529 ?auto_145530 ?auto_145531 )
      ( MAKE-11PILE ?auto_145527 ?auto_145528 ?auto_145529 ?auto_145530 ?auto_145531 ?auto_145532 ?auto_145533 ?auto_145534 ?auto_145535 ?auto_145536 ?auto_145537 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_145550 - BLOCK
      ?auto_145551 - BLOCK
      ?auto_145552 - BLOCK
      ?auto_145553 - BLOCK
      ?auto_145554 - BLOCK
      ?auto_145555 - BLOCK
      ?auto_145556 - BLOCK
      ?auto_145557 - BLOCK
      ?auto_145558 - BLOCK
      ?auto_145559 - BLOCK
      ?auto_145560 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145560 ) ( ON-TABLE ?auto_145550 ) ( ON ?auto_145551 ?auto_145550 ) ( ON ?auto_145552 ?auto_145551 ) ( ON ?auto_145553 ?auto_145552 ) ( not ( = ?auto_145550 ?auto_145551 ) ) ( not ( = ?auto_145550 ?auto_145552 ) ) ( not ( = ?auto_145550 ?auto_145553 ) ) ( not ( = ?auto_145550 ?auto_145554 ) ) ( not ( = ?auto_145550 ?auto_145555 ) ) ( not ( = ?auto_145550 ?auto_145556 ) ) ( not ( = ?auto_145550 ?auto_145557 ) ) ( not ( = ?auto_145550 ?auto_145558 ) ) ( not ( = ?auto_145550 ?auto_145559 ) ) ( not ( = ?auto_145550 ?auto_145560 ) ) ( not ( = ?auto_145551 ?auto_145552 ) ) ( not ( = ?auto_145551 ?auto_145553 ) ) ( not ( = ?auto_145551 ?auto_145554 ) ) ( not ( = ?auto_145551 ?auto_145555 ) ) ( not ( = ?auto_145551 ?auto_145556 ) ) ( not ( = ?auto_145551 ?auto_145557 ) ) ( not ( = ?auto_145551 ?auto_145558 ) ) ( not ( = ?auto_145551 ?auto_145559 ) ) ( not ( = ?auto_145551 ?auto_145560 ) ) ( not ( = ?auto_145552 ?auto_145553 ) ) ( not ( = ?auto_145552 ?auto_145554 ) ) ( not ( = ?auto_145552 ?auto_145555 ) ) ( not ( = ?auto_145552 ?auto_145556 ) ) ( not ( = ?auto_145552 ?auto_145557 ) ) ( not ( = ?auto_145552 ?auto_145558 ) ) ( not ( = ?auto_145552 ?auto_145559 ) ) ( not ( = ?auto_145552 ?auto_145560 ) ) ( not ( = ?auto_145553 ?auto_145554 ) ) ( not ( = ?auto_145553 ?auto_145555 ) ) ( not ( = ?auto_145553 ?auto_145556 ) ) ( not ( = ?auto_145553 ?auto_145557 ) ) ( not ( = ?auto_145553 ?auto_145558 ) ) ( not ( = ?auto_145553 ?auto_145559 ) ) ( not ( = ?auto_145553 ?auto_145560 ) ) ( not ( = ?auto_145554 ?auto_145555 ) ) ( not ( = ?auto_145554 ?auto_145556 ) ) ( not ( = ?auto_145554 ?auto_145557 ) ) ( not ( = ?auto_145554 ?auto_145558 ) ) ( not ( = ?auto_145554 ?auto_145559 ) ) ( not ( = ?auto_145554 ?auto_145560 ) ) ( not ( = ?auto_145555 ?auto_145556 ) ) ( not ( = ?auto_145555 ?auto_145557 ) ) ( not ( = ?auto_145555 ?auto_145558 ) ) ( not ( = ?auto_145555 ?auto_145559 ) ) ( not ( = ?auto_145555 ?auto_145560 ) ) ( not ( = ?auto_145556 ?auto_145557 ) ) ( not ( = ?auto_145556 ?auto_145558 ) ) ( not ( = ?auto_145556 ?auto_145559 ) ) ( not ( = ?auto_145556 ?auto_145560 ) ) ( not ( = ?auto_145557 ?auto_145558 ) ) ( not ( = ?auto_145557 ?auto_145559 ) ) ( not ( = ?auto_145557 ?auto_145560 ) ) ( not ( = ?auto_145558 ?auto_145559 ) ) ( not ( = ?auto_145558 ?auto_145560 ) ) ( not ( = ?auto_145559 ?auto_145560 ) ) ( ON ?auto_145559 ?auto_145560 ) ( ON ?auto_145558 ?auto_145559 ) ( ON ?auto_145557 ?auto_145558 ) ( ON ?auto_145556 ?auto_145557 ) ( ON ?auto_145555 ?auto_145556 ) ( CLEAR ?auto_145553 ) ( ON ?auto_145554 ?auto_145555 ) ( CLEAR ?auto_145554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_145550 ?auto_145551 ?auto_145552 ?auto_145553 ?auto_145554 )
      ( MAKE-11PILE ?auto_145550 ?auto_145551 ?auto_145552 ?auto_145553 ?auto_145554 ?auto_145555 ?auto_145556 ?auto_145557 ?auto_145558 ?auto_145559 ?auto_145560 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_145572 - BLOCK
      ?auto_145573 - BLOCK
      ?auto_145574 - BLOCK
      ?auto_145575 - BLOCK
      ?auto_145576 - BLOCK
      ?auto_145577 - BLOCK
      ?auto_145578 - BLOCK
      ?auto_145579 - BLOCK
      ?auto_145580 - BLOCK
      ?auto_145581 - BLOCK
      ?auto_145582 - BLOCK
    )
    :vars
    (
      ?auto_145583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145582 ?auto_145583 ) ( ON-TABLE ?auto_145572 ) ( ON ?auto_145573 ?auto_145572 ) ( ON ?auto_145574 ?auto_145573 ) ( not ( = ?auto_145572 ?auto_145573 ) ) ( not ( = ?auto_145572 ?auto_145574 ) ) ( not ( = ?auto_145572 ?auto_145575 ) ) ( not ( = ?auto_145572 ?auto_145576 ) ) ( not ( = ?auto_145572 ?auto_145577 ) ) ( not ( = ?auto_145572 ?auto_145578 ) ) ( not ( = ?auto_145572 ?auto_145579 ) ) ( not ( = ?auto_145572 ?auto_145580 ) ) ( not ( = ?auto_145572 ?auto_145581 ) ) ( not ( = ?auto_145572 ?auto_145582 ) ) ( not ( = ?auto_145572 ?auto_145583 ) ) ( not ( = ?auto_145573 ?auto_145574 ) ) ( not ( = ?auto_145573 ?auto_145575 ) ) ( not ( = ?auto_145573 ?auto_145576 ) ) ( not ( = ?auto_145573 ?auto_145577 ) ) ( not ( = ?auto_145573 ?auto_145578 ) ) ( not ( = ?auto_145573 ?auto_145579 ) ) ( not ( = ?auto_145573 ?auto_145580 ) ) ( not ( = ?auto_145573 ?auto_145581 ) ) ( not ( = ?auto_145573 ?auto_145582 ) ) ( not ( = ?auto_145573 ?auto_145583 ) ) ( not ( = ?auto_145574 ?auto_145575 ) ) ( not ( = ?auto_145574 ?auto_145576 ) ) ( not ( = ?auto_145574 ?auto_145577 ) ) ( not ( = ?auto_145574 ?auto_145578 ) ) ( not ( = ?auto_145574 ?auto_145579 ) ) ( not ( = ?auto_145574 ?auto_145580 ) ) ( not ( = ?auto_145574 ?auto_145581 ) ) ( not ( = ?auto_145574 ?auto_145582 ) ) ( not ( = ?auto_145574 ?auto_145583 ) ) ( not ( = ?auto_145575 ?auto_145576 ) ) ( not ( = ?auto_145575 ?auto_145577 ) ) ( not ( = ?auto_145575 ?auto_145578 ) ) ( not ( = ?auto_145575 ?auto_145579 ) ) ( not ( = ?auto_145575 ?auto_145580 ) ) ( not ( = ?auto_145575 ?auto_145581 ) ) ( not ( = ?auto_145575 ?auto_145582 ) ) ( not ( = ?auto_145575 ?auto_145583 ) ) ( not ( = ?auto_145576 ?auto_145577 ) ) ( not ( = ?auto_145576 ?auto_145578 ) ) ( not ( = ?auto_145576 ?auto_145579 ) ) ( not ( = ?auto_145576 ?auto_145580 ) ) ( not ( = ?auto_145576 ?auto_145581 ) ) ( not ( = ?auto_145576 ?auto_145582 ) ) ( not ( = ?auto_145576 ?auto_145583 ) ) ( not ( = ?auto_145577 ?auto_145578 ) ) ( not ( = ?auto_145577 ?auto_145579 ) ) ( not ( = ?auto_145577 ?auto_145580 ) ) ( not ( = ?auto_145577 ?auto_145581 ) ) ( not ( = ?auto_145577 ?auto_145582 ) ) ( not ( = ?auto_145577 ?auto_145583 ) ) ( not ( = ?auto_145578 ?auto_145579 ) ) ( not ( = ?auto_145578 ?auto_145580 ) ) ( not ( = ?auto_145578 ?auto_145581 ) ) ( not ( = ?auto_145578 ?auto_145582 ) ) ( not ( = ?auto_145578 ?auto_145583 ) ) ( not ( = ?auto_145579 ?auto_145580 ) ) ( not ( = ?auto_145579 ?auto_145581 ) ) ( not ( = ?auto_145579 ?auto_145582 ) ) ( not ( = ?auto_145579 ?auto_145583 ) ) ( not ( = ?auto_145580 ?auto_145581 ) ) ( not ( = ?auto_145580 ?auto_145582 ) ) ( not ( = ?auto_145580 ?auto_145583 ) ) ( not ( = ?auto_145581 ?auto_145582 ) ) ( not ( = ?auto_145581 ?auto_145583 ) ) ( not ( = ?auto_145582 ?auto_145583 ) ) ( ON ?auto_145581 ?auto_145582 ) ( ON ?auto_145580 ?auto_145581 ) ( ON ?auto_145579 ?auto_145580 ) ( ON ?auto_145578 ?auto_145579 ) ( ON ?auto_145577 ?auto_145578 ) ( ON ?auto_145576 ?auto_145577 ) ( CLEAR ?auto_145574 ) ( ON ?auto_145575 ?auto_145576 ) ( CLEAR ?auto_145575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145572 ?auto_145573 ?auto_145574 ?auto_145575 )
      ( MAKE-11PILE ?auto_145572 ?auto_145573 ?auto_145574 ?auto_145575 ?auto_145576 ?auto_145577 ?auto_145578 ?auto_145579 ?auto_145580 ?auto_145581 ?auto_145582 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_145595 - BLOCK
      ?auto_145596 - BLOCK
      ?auto_145597 - BLOCK
      ?auto_145598 - BLOCK
      ?auto_145599 - BLOCK
      ?auto_145600 - BLOCK
      ?auto_145601 - BLOCK
      ?auto_145602 - BLOCK
      ?auto_145603 - BLOCK
      ?auto_145604 - BLOCK
      ?auto_145605 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145605 ) ( ON-TABLE ?auto_145595 ) ( ON ?auto_145596 ?auto_145595 ) ( ON ?auto_145597 ?auto_145596 ) ( not ( = ?auto_145595 ?auto_145596 ) ) ( not ( = ?auto_145595 ?auto_145597 ) ) ( not ( = ?auto_145595 ?auto_145598 ) ) ( not ( = ?auto_145595 ?auto_145599 ) ) ( not ( = ?auto_145595 ?auto_145600 ) ) ( not ( = ?auto_145595 ?auto_145601 ) ) ( not ( = ?auto_145595 ?auto_145602 ) ) ( not ( = ?auto_145595 ?auto_145603 ) ) ( not ( = ?auto_145595 ?auto_145604 ) ) ( not ( = ?auto_145595 ?auto_145605 ) ) ( not ( = ?auto_145596 ?auto_145597 ) ) ( not ( = ?auto_145596 ?auto_145598 ) ) ( not ( = ?auto_145596 ?auto_145599 ) ) ( not ( = ?auto_145596 ?auto_145600 ) ) ( not ( = ?auto_145596 ?auto_145601 ) ) ( not ( = ?auto_145596 ?auto_145602 ) ) ( not ( = ?auto_145596 ?auto_145603 ) ) ( not ( = ?auto_145596 ?auto_145604 ) ) ( not ( = ?auto_145596 ?auto_145605 ) ) ( not ( = ?auto_145597 ?auto_145598 ) ) ( not ( = ?auto_145597 ?auto_145599 ) ) ( not ( = ?auto_145597 ?auto_145600 ) ) ( not ( = ?auto_145597 ?auto_145601 ) ) ( not ( = ?auto_145597 ?auto_145602 ) ) ( not ( = ?auto_145597 ?auto_145603 ) ) ( not ( = ?auto_145597 ?auto_145604 ) ) ( not ( = ?auto_145597 ?auto_145605 ) ) ( not ( = ?auto_145598 ?auto_145599 ) ) ( not ( = ?auto_145598 ?auto_145600 ) ) ( not ( = ?auto_145598 ?auto_145601 ) ) ( not ( = ?auto_145598 ?auto_145602 ) ) ( not ( = ?auto_145598 ?auto_145603 ) ) ( not ( = ?auto_145598 ?auto_145604 ) ) ( not ( = ?auto_145598 ?auto_145605 ) ) ( not ( = ?auto_145599 ?auto_145600 ) ) ( not ( = ?auto_145599 ?auto_145601 ) ) ( not ( = ?auto_145599 ?auto_145602 ) ) ( not ( = ?auto_145599 ?auto_145603 ) ) ( not ( = ?auto_145599 ?auto_145604 ) ) ( not ( = ?auto_145599 ?auto_145605 ) ) ( not ( = ?auto_145600 ?auto_145601 ) ) ( not ( = ?auto_145600 ?auto_145602 ) ) ( not ( = ?auto_145600 ?auto_145603 ) ) ( not ( = ?auto_145600 ?auto_145604 ) ) ( not ( = ?auto_145600 ?auto_145605 ) ) ( not ( = ?auto_145601 ?auto_145602 ) ) ( not ( = ?auto_145601 ?auto_145603 ) ) ( not ( = ?auto_145601 ?auto_145604 ) ) ( not ( = ?auto_145601 ?auto_145605 ) ) ( not ( = ?auto_145602 ?auto_145603 ) ) ( not ( = ?auto_145602 ?auto_145604 ) ) ( not ( = ?auto_145602 ?auto_145605 ) ) ( not ( = ?auto_145603 ?auto_145604 ) ) ( not ( = ?auto_145603 ?auto_145605 ) ) ( not ( = ?auto_145604 ?auto_145605 ) ) ( ON ?auto_145604 ?auto_145605 ) ( ON ?auto_145603 ?auto_145604 ) ( ON ?auto_145602 ?auto_145603 ) ( ON ?auto_145601 ?auto_145602 ) ( ON ?auto_145600 ?auto_145601 ) ( ON ?auto_145599 ?auto_145600 ) ( CLEAR ?auto_145597 ) ( ON ?auto_145598 ?auto_145599 ) ( CLEAR ?auto_145598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145595 ?auto_145596 ?auto_145597 ?auto_145598 )
      ( MAKE-11PILE ?auto_145595 ?auto_145596 ?auto_145597 ?auto_145598 ?auto_145599 ?auto_145600 ?auto_145601 ?auto_145602 ?auto_145603 ?auto_145604 ?auto_145605 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_145617 - BLOCK
      ?auto_145618 - BLOCK
      ?auto_145619 - BLOCK
      ?auto_145620 - BLOCK
      ?auto_145621 - BLOCK
      ?auto_145622 - BLOCK
      ?auto_145623 - BLOCK
      ?auto_145624 - BLOCK
      ?auto_145625 - BLOCK
      ?auto_145626 - BLOCK
      ?auto_145627 - BLOCK
    )
    :vars
    (
      ?auto_145628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145627 ?auto_145628 ) ( ON-TABLE ?auto_145617 ) ( ON ?auto_145618 ?auto_145617 ) ( not ( = ?auto_145617 ?auto_145618 ) ) ( not ( = ?auto_145617 ?auto_145619 ) ) ( not ( = ?auto_145617 ?auto_145620 ) ) ( not ( = ?auto_145617 ?auto_145621 ) ) ( not ( = ?auto_145617 ?auto_145622 ) ) ( not ( = ?auto_145617 ?auto_145623 ) ) ( not ( = ?auto_145617 ?auto_145624 ) ) ( not ( = ?auto_145617 ?auto_145625 ) ) ( not ( = ?auto_145617 ?auto_145626 ) ) ( not ( = ?auto_145617 ?auto_145627 ) ) ( not ( = ?auto_145617 ?auto_145628 ) ) ( not ( = ?auto_145618 ?auto_145619 ) ) ( not ( = ?auto_145618 ?auto_145620 ) ) ( not ( = ?auto_145618 ?auto_145621 ) ) ( not ( = ?auto_145618 ?auto_145622 ) ) ( not ( = ?auto_145618 ?auto_145623 ) ) ( not ( = ?auto_145618 ?auto_145624 ) ) ( not ( = ?auto_145618 ?auto_145625 ) ) ( not ( = ?auto_145618 ?auto_145626 ) ) ( not ( = ?auto_145618 ?auto_145627 ) ) ( not ( = ?auto_145618 ?auto_145628 ) ) ( not ( = ?auto_145619 ?auto_145620 ) ) ( not ( = ?auto_145619 ?auto_145621 ) ) ( not ( = ?auto_145619 ?auto_145622 ) ) ( not ( = ?auto_145619 ?auto_145623 ) ) ( not ( = ?auto_145619 ?auto_145624 ) ) ( not ( = ?auto_145619 ?auto_145625 ) ) ( not ( = ?auto_145619 ?auto_145626 ) ) ( not ( = ?auto_145619 ?auto_145627 ) ) ( not ( = ?auto_145619 ?auto_145628 ) ) ( not ( = ?auto_145620 ?auto_145621 ) ) ( not ( = ?auto_145620 ?auto_145622 ) ) ( not ( = ?auto_145620 ?auto_145623 ) ) ( not ( = ?auto_145620 ?auto_145624 ) ) ( not ( = ?auto_145620 ?auto_145625 ) ) ( not ( = ?auto_145620 ?auto_145626 ) ) ( not ( = ?auto_145620 ?auto_145627 ) ) ( not ( = ?auto_145620 ?auto_145628 ) ) ( not ( = ?auto_145621 ?auto_145622 ) ) ( not ( = ?auto_145621 ?auto_145623 ) ) ( not ( = ?auto_145621 ?auto_145624 ) ) ( not ( = ?auto_145621 ?auto_145625 ) ) ( not ( = ?auto_145621 ?auto_145626 ) ) ( not ( = ?auto_145621 ?auto_145627 ) ) ( not ( = ?auto_145621 ?auto_145628 ) ) ( not ( = ?auto_145622 ?auto_145623 ) ) ( not ( = ?auto_145622 ?auto_145624 ) ) ( not ( = ?auto_145622 ?auto_145625 ) ) ( not ( = ?auto_145622 ?auto_145626 ) ) ( not ( = ?auto_145622 ?auto_145627 ) ) ( not ( = ?auto_145622 ?auto_145628 ) ) ( not ( = ?auto_145623 ?auto_145624 ) ) ( not ( = ?auto_145623 ?auto_145625 ) ) ( not ( = ?auto_145623 ?auto_145626 ) ) ( not ( = ?auto_145623 ?auto_145627 ) ) ( not ( = ?auto_145623 ?auto_145628 ) ) ( not ( = ?auto_145624 ?auto_145625 ) ) ( not ( = ?auto_145624 ?auto_145626 ) ) ( not ( = ?auto_145624 ?auto_145627 ) ) ( not ( = ?auto_145624 ?auto_145628 ) ) ( not ( = ?auto_145625 ?auto_145626 ) ) ( not ( = ?auto_145625 ?auto_145627 ) ) ( not ( = ?auto_145625 ?auto_145628 ) ) ( not ( = ?auto_145626 ?auto_145627 ) ) ( not ( = ?auto_145626 ?auto_145628 ) ) ( not ( = ?auto_145627 ?auto_145628 ) ) ( ON ?auto_145626 ?auto_145627 ) ( ON ?auto_145625 ?auto_145626 ) ( ON ?auto_145624 ?auto_145625 ) ( ON ?auto_145623 ?auto_145624 ) ( ON ?auto_145622 ?auto_145623 ) ( ON ?auto_145621 ?auto_145622 ) ( ON ?auto_145620 ?auto_145621 ) ( CLEAR ?auto_145618 ) ( ON ?auto_145619 ?auto_145620 ) ( CLEAR ?auto_145619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145617 ?auto_145618 ?auto_145619 )
      ( MAKE-11PILE ?auto_145617 ?auto_145618 ?auto_145619 ?auto_145620 ?auto_145621 ?auto_145622 ?auto_145623 ?auto_145624 ?auto_145625 ?auto_145626 ?auto_145627 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_145640 - BLOCK
      ?auto_145641 - BLOCK
      ?auto_145642 - BLOCK
      ?auto_145643 - BLOCK
      ?auto_145644 - BLOCK
      ?auto_145645 - BLOCK
      ?auto_145646 - BLOCK
      ?auto_145647 - BLOCK
      ?auto_145648 - BLOCK
      ?auto_145649 - BLOCK
      ?auto_145650 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145650 ) ( ON-TABLE ?auto_145640 ) ( ON ?auto_145641 ?auto_145640 ) ( not ( = ?auto_145640 ?auto_145641 ) ) ( not ( = ?auto_145640 ?auto_145642 ) ) ( not ( = ?auto_145640 ?auto_145643 ) ) ( not ( = ?auto_145640 ?auto_145644 ) ) ( not ( = ?auto_145640 ?auto_145645 ) ) ( not ( = ?auto_145640 ?auto_145646 ) ) ( not ( = ?auto_145640 ?auto_145647 ) ) ( not ( = ?auto_145640 ?auto_145648 ) ) ( not ( = ?auto_145640 ?auto_145649 ) ) ( not ( = ?auto_145640 ?auto_145650 ) ) ( not ( = ?auto_145641 ?auto_145642 ) ) ( not ( = ?auto_145641 ?auto_145643 ) ) ( not ( = ?auto_145641 ?auto_145644 ) ) ( not ( = ?auto_145641 ?auto_145645 ) ) ( not ( = ?auto_145641 ?auto_145646 ) ) ( not ( = ?auto_145641 ?auto_145647 ) ) ( not ( = ?auto_145641 ?auto_145648 ) ) ( not ( = ?auto_145641 ?auto_145649 ) ) ( not ( = ?auto_145641 ?auto_145650 ) ) ( not ( = ?auto_145642 ?auto_145643 ) ) ( not ( = ?auto_145642 ?auto_145644 ) ) ( not ( = ?auto_145642 ?auto_145645 ) ) ( not ( = ?auto_145642 ?auto_145646 ) ) ( not ( = ?auto_145642 ?auto_145647 ) ) ( not ( = ?auto_145642 ?auto_145648 ) ) ( not ( = ?auto_145642 ?auto_145649 ) ) ( not ( = ?auto_145642 ?auto_145650 ) ) ( not ( = ?auto_145643 ?auto_145644 ) ) ( not ( = ?auto_145643 ?auto_145645 ) ) ( not ( = ?auto_145643 ?auto_145646 ) ) ( not ( = ?auto_145643 ?auto_145647 ) ) ( not ( = ?auto_145643 ?auto_145648 ) ) ( not ( = ?auto_145643 ?auto_145649 ) ) ( not ( = ?auto_145643 ?auto_145650 ) ) ( not ( = ?auto_145644 ?auto_145645 ) ) ( not ( = ?auto_145644 ?auto_145646 ) ) ( not ( = ?auto_145644 ?auto_145647 ) ) ( not ( = ?auto_145644 ?auto_145648 ) ) ( not ( = ?auto_145644 ?auto_145649 ) ) ( not ( = ?auto_145644 ?auto_145650 ) ) ( not ( = ?auto_145645 ?auto_145646 ) ) ( not ( = ?auto_145645 ?auto_145647 ) ) ( not ( = ?auto_145645 ?auto_145648 ) ) ( not ( = ?auto_145645 ?auto_145649 ) ) ( not ( = ?auto_145645 ?auto_145650 ) ) ( not ( = ?auto_145646 ?auto_145647 ) ) ( not ( = ?auto_145646 ?auto_145648 ) ) ( not ( = ?auto_145646 ?auto_145649 ) ) ( not ( = ?auto_145646 ?auto_145650 ) ) ( not ( = ?auto_145647 ?auto_145648 ) ) ( not ( = ?auto_145647 ?auto_145649 ) ) ( not ( = ?auto_145647 ?auto_145650 ) ) ( not ( = ?auto_145648 ?auto_145649 ) ) ( not ( = ?auto_145648 ?auto_145650 ) ) ( not ( = ?auto_145649 ?auto_145650 ) ) ( ON ?auto_145649 ?auto_145650 ) ( ON ?auto_145648 ?auto_145649 ) ( ON ?auto_145647 ?auto_145648 ) ( ON ?auto_145646 ?auto_145647 ) ( ON ?auto_145645 ?auto_145646 ) ( ON ?auto_145644 ?auto_145645 ) ( ON ?auto_145643 ?auto_145644 ) ( CLEAR ?auto_145641 ) ( ON ?auto_145642 ?auto_145643 ) ( CLEAR ?auto_145642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145640 ?auto_145641 ?auto_145642 )
      ( MAKE-11PILE ?auto_145640 ?auto_145641 ?auto_145642 ?auto_145643 ?auto_145644 ?auto_145645 ?auto_145646 ?auto_145647 ?auto_145648 ?auto_145649 ?auto_145650 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_145662 - BLOCK
      ?auto_145663 - BLOCK
      ?auto_145664 - BLOCK
      ?auto_145665 - BLOCK
      ?auto_145666 - BLOCK
      ?auto_145667 - BLOCK
      ?auto_145668 - BLOCK
      ?auto_145669 - BLOCK
      ?auto_145670 - BLOCK
      ?auto_145671 - BLOCK
      ?auto_145672 - BLOCK
    )
    :vars
    (
      ?auto_145673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145672 ?auto_145673 ) ( ON-TABLE ?auto_145662 ) ( not ( = ?auto_145662 ?auto_145663 ) ) ( not ( = ?auto_145662 ?auto_145664 ) ) ( not ( = ?auto_145662 ?auto_145665 ) ) ( not ( = ?auto_145662 ?auto_145666 ) ) ( not ( = ?auto_145662 ?auto_145667 ) ) ( not ( = ?auto_145662 ?auto_145668 ) ) ( not ( = ?auto_145662 ?auto_145669 ) ) ( not ( = ?auto_145662 ?auto_145670 ) ) ( not ( = ?auto_145662 ?auto_145671 ) ) ( not ( = ?auto_145662 ?auto_145672 ) ) ( not ( = ?auto_145662 ?auto_145673 ) ) ( not ( = ?auto_145663 ?auto_145664 ) ) ( not ( = ?auto_145663 ?auto_145665 ) ) ( not ( = ?auto_145663 ?auto_145666 ) ) ( not ( = ?auto_145663 ?auto_145667 ) ) ( not ( = ?auto_145663 ?auto_145668 ) ) ( not ( = ?auto_145663 ?auto_145669 ) ) ( not ( = ?auto_145663 ?auto_145670 ) ) ( not ( = ?auto_145663 ?auto_145671 ) ) ( not ( = ?auto_145663 ?auto_145672 ) ) ( not ( = ?auto_145663 ?auto_145673 ) ) ( not ( = ?auto_145664 ?auto_145665 ) ) ( not ( = ?auto_145664 ?auto_145666 ) ) ( not ( = ?auto_145664 ?auto_145667 ) ) ( not ( = ?auto_145664 ?auto_145668 ) ) ( not ( = ?auto_145664 ?auto_145669 ) ) ( not ( = ?auto_145664 ?auto_145670 ) ) ( not ( = ?auto_145664 ?auto_145671 ) ) ( not ( = ?auto_145664 ?auto_145672 ) ) ( not ( = ?auto_145664 ?auto_145673 ) ) ( not ( = ?auto_145665 ?auto_145666 ) ) ( not ( = ?auto_145665 ?auto_145667 ) ) ( not ( = ?auto_145665 ?auto_145668 ) ) ( not ( = ?auto_145665 ?auto_145669 ) ) ( not ( = ?auto_145665 ?auto_145670 ) ) ( not ( = ?auto_145665 ?auto_145671 ) ) ( not ( = ?auto_145665 ?auto_145672 ) ) ( not ( = ?auto_145665 ?auto_145673 ) ) ( not ( = ?auto_145666 ?auto_145667 ) ) ( not ( = ?auto_145666 ?auto_145668 ) ) ( not ( = ?auto_145666 ?auto_145669 ) ) ( not ( = ?auto_145666 ?auto_145670 ) ) ( not ( = ?auto_145666 ?auto_145671 ) ) ( not ( = ?auto_145666 ?auto_145672 ) ) ( not ( = ?auto_145666 ?auto_145673 ) ) ( not ( = ?auto_145667 ?auto_145668 ) ) ( not ( = ?auto_145667 ?auto_145669 ) ) ( not ( = ?auto_145667 ?auto_145670 ) ) ( not ( = ?auto_145667 ?auto_145671 ) ) ( not ( = ?auto_145667 ?auto_145672 ) ) ( not ( = ?auto_145667 ?auto_145673 ) ) ( not ( = ?auto_145668 ?auto_145669 ) ) ( not ( = ?auto_145668 ?auto_145670 ) ) ( not ( = ?auto_145668 ?auto_145671 ) ) ( not ( = ?auto_145668 ?auto_145672 ) ) ( not ( = ?auto_145668 ?auto_145673 ) ) ( not ( = ?auto_145669 ?auto_145670 ) ) ( not ( = ?auto_145669 ?auto_145671 ) ) ( not ( = ?auto_145669 ?auto_145672 ) ) ( not ( = ?auto_145669 ?auto_145673 ) ) ( not ( = ?auto_145670 ?auto_145671 ) ) ( not ( = ?auto_145670 ?auto_145672 ) ) ( not ( = ?auto_145670 ?auto_145673 ) ) ( not ( = ?auto_145671 ?auto_145672 ) ) ( not ( = ?auto_145671 ?auto_145673 ) ) ( not ( = ?auto_145672 ?auto_145673 ) ) ( ON ?auto_145671 ?auto_145672 ) ( ON ?auto_145670 ?auto_145671 ) ( ON ?auto_145669 ?auto_145670 ) ( ON ?auto_145668 ?auto_145669 ) ( ON ?auto_145667 ?auto_145668 ) ( ON ?auto_145666 ?auto_145667 ) ( ON ?auto_145665 ?auto_145666 ) ( ON ?auto_145664 ?auto_145665 ) ( CLEAR ?auto_145662 ) ( ON ?auto_145663 ?auto_145664 ) ( CLEAR ?auto_145663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145662 ?auto_145663 )
      ( MAKE-11PILE ?auto_145662 ?auto_145663 ?auto_145664 ?auto_145665 ?auto_145666 ?auto_145667 ?auto_145668 ?auto_145669 ?auto_145670 ?auto_145671 ?auto_145672 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_145685 - BLOCK
      ?auto_145686 - BLOCK
      ?auto_145687 - BLOCK
      ?auto_145688 - BLOCK
      ?auto_145689 - BLOCK
      ?auto_145690 - BLOCK
      ?auto_145691 - BLOCK
      ?auto_145692 - BLOCK
      ?auto_145693 - BLOCK
      ?auto_145694 - BLOCK
      ?auto_145695 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145695 ) ( ON-TABLE ?auto_145685 ) ( not ( = ?auto_145685 ?auto_145686 ) ) ( not ( = ?auto_145685 ?auto_145687 ) ) ( not ( = ?auto_145685 ?auto_145688 ) ) ( not ( = ?auto_145685 ?auto_145689 ) ) ( not ( = ?auto_145685 ?auto_145690 ) ) ( not ( = ?auto_145685 ?auto_145691 ) ) ( not ( = ?auto_145685 ?auto_145692 ) ) ( not ( = ?auto_145685 ?auto_145693 ) ) ( not ( = ?auto_145685 ?auto_145694 ) ) ( not ( = ?auto_145685 ?auto_145695 ) ) ( not ( = ?auto_145686 ?auto_145687 ) ) ( not ( = ?auto_145686 ?auto_145688 ) ) ( not ( = ?auto_145686 ?auto_145689 ) ) ( not ( = ?auto_145686 ?auto_145690 ) ) ( not ( = ?auto_145686 ?auto_145691 ) ) ( not ( = ?auto_145686 ?auto_145692 ) ) ( not ( = ?auto_145686 ?auto_145693 ) ) ( not ( = ?auto_145686 ?auto_145694 ) ) ( not ( = ?auto_145686 ?auto_145695 ) ) ( not ( = ?auto_145687 ?auto_145688 ) ) ( not ( = ?auto_145687 ?auto_145689 ) ) ( not ( = ?auto_145687 ?auto_145690 ) ) ( not ( = ?auto_145687 ?auto_145691 ) ) ( not ( = ?auto_145687 ?auto_145692 ) ) ( not ( = ?auto_145687 ?auto_145693 ) ) ( not ( = ?auto_145687 ?auto_145694 ) ) ( not ( = ?auto_145687 ?auto_145695 ) ) ( not ( = ?auto_145688 ?auto_145689 ) ) ( not ( = ?auto_145688 ?auto_145690 ) ) ( not ( = ?auto_145688 ?auto_145691 ) ) ( not ( = ?auto_145688 ?auto_145692 ) ) ( not ( = ?auto_145688 ?auto_145693 ) ) ( not ( = ?auto_145688 ?auto_145694 ) ) ( not ( = ?auto_145688 ?auto_145695 ) ) ( not ( = ?auto_145689 ?auto_145690 ) ) ( not ( = ?auto_145689 ?auto_145691 ) ) ( not ( = ?auto_145689 ?auto_145692 ) ) ( not ( = ?auto_145689 ?auto_145693 ) ) ( not ( = ?auto_145689 ?auto_145694 ) ) ( not ( = ?auto_145689 ?auto_145695 ) ) ( not ( = ?auto_145690 ?auto_145691 ) ) ( not ( = ?auto_145690 ?auto_145692 ) ) ( not ( = ?auto_145690 ?auto_145693 ) ) ( not ( = ?auto_145690 ?auto_145694 ) ) ( not ( = ?auto_145690 ?auto_145695 ) ) ( not ( = ?auto_145691 ?auto_145692 ) ) ( not ( = ?auto_145691 ?auto_145693 ) ) ( not ( = ?auto_145691 ?auto_145694 ) ) ( not ( = ?auto_145691 ?auto_145695 ) ) ( not ( = ?auto_145692 ?auto_145693 ) ) ( not ( = ?auto_145692 ?auto_145694 ) ) ( not ( = ?auto_145692 ?auto_145695 ) ) ( not ( = ?auto_145693 ?auto_145694 ) ) ( not ( = ?auto_145693 ?auto_145695 ) ) ( not ( = ?auto_145694 ?auto_145695 ) ) ( ON ?auto_145694 ?auto_145695 ) ( ON ?auto_145693 ?auto_145694 ) ( ON ?auto_145692 ?auto_145693 ) ( ON ?auto_145691 ?auto_145692 ) ( ON ?auto_145690 ?auto_145691 ) ( ON ?auto_145689 ?auto_145690 ) ( ON ?auto_145688 ?auto_145689 ) ( ON ?auto_145687 ?auto_145688 ) ( CLEAR ?auto_145685 ) ( ON ?auto_145686 ?auto_145687 ) ( CLEAR ?auto_145686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145685 ?auto_145686 )
      ( MAKE-11PILE ?auto_145685 ?auto_145686 ?auto_145687 ?auto_145688 ?auto_145689 ?auto_145690 ?auto_145691 ?auto_145692 ?auto_145693 ?auto_145694 ?auto_145695 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_145707 - BLOCK
      ?auto_145708 - BLOCK
      ?auto_145709 - BLOCK
      ?auto_145710 - BLOCK
      ?auto_145711 - BLOCK
      ?auto_145712 - BLOCK
      ?auto_145713 - BLOCK
      ?auto_145714 - BLOCK
      ?auto_145715 - BLOCK
      ?auto_145716 - BLOCK
      ?auto_145717 - BLOCK
    )
    :vars
    (
      ?auto_145718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145717 ?auto_145718 ) ( not ( = ?auto_145707 ?auto_145708 ) ) ( not ( = ?auto_145707 ?auto_145709 ) ) ( not ( = ?auto_145707 ?auto_145710 ) ) ( not ( = ?auto_145707 ?auto_145711 ) ) ( not ( = ?auto_145707 ?auto_145712 ) ) ( not ( = ?auto_145707 ?auto_145713 ) ) ( not ( = ?auto_145707 ?auto_145714 ) ) ( not ( = ?auto_145707 ?auto_145715 ) ) ( not ( = ?auto_145707 ?auto_145716 ) ) ( not ( = ?auto_145707 ?auto_145717 ) ) ( not ( = ?auto_145707 ?auto_145718 ) ) ( not ( = ?auto_145708 ?auto_145709 ) ) ( not ( = ?auto_145708 ?auto_145710 ) ) ( not ( = ?auto_145708 ?auto_145711 ) ) ( not ( = ?auto_145708 ?auto_145712 ) ) ( not ( = ?auto_145708 ?auto_145713 ) ) ( not ( = ?auto_145708 ?auto_145714 ) ) ( not ( = ?auto_145708 ?auto_145715 ) ) ( not ( = ?auto_145708 ?auto_145716 ) ) ( not ( = ?auto_145708 ?auto_145717 ) ) ( not ( = ?auto_145708 ?auto_145718 ) ) ( not ( = ?auto_145709 ?auto_145710 ) ) ( not ( = ?auto_145709 ?auto_145711 ) ) ( not ( = ?auto_145709 ?auto_145712 ) ) ( not ( = ?auto_145709 ?auto_145713 ) ) ( not ( = ?auto_145709 ?auto_145714 ) ) ( not ( = ?auto_145709 ?auto_145715 ) ) ( not ( = ?auto_145709 ?auto_145716 ) ) ( not ( = ?auto_145709 ?auto_145717 ) ) ( not ( = ?auto_145709 ?auto_145718 ) ) ( not ( = ?auto_145710 ?auto_145711 ) ) ( not ( = ?auto_145710 ?auto_145712 ) ) ( not ( = ?auto_145710 ?auto_145713 ) ) ( not ( = ?auto_145710 ?auto_145714 ) ) ( not ( = ?auto_145710 ?auto_145715 ) ) ( not ( = ?auto_145710 ?auto_145716 ) ) ( not ( = ?auto_145710 ?auto_145717 ) ) ( not ( = ?auto_145710 ?auto_145718 ) ) ( not ( = ?auto_145711 ?auto_145712 ) ) ( not ( = ?auto_145711 ?auto_145713 ) ) ( not ( = ?auto_145711 ?auto_145714 ) ) ( not ( = ?auto_145711 ?auto_145715 ) ) ( not ( = ?auto_145711 ?auto_145716 ) ) ( not ( = ?auto_145711 ?auto_145717 ) ) ( not ( = ?auto_145711 ?auto_145718 ) ) ( not ( = ?auto_145712 ?auto_145713 ) ) ( not ( = ?auto_145712 ?auto_145714 ) ) ( not ( = ?auto_145712 ?auto_145715 ) ) ( not ( = ?auto_145712 ?auto_145716 ) ) ( not ( = ?auto_145712 ?auto_145717 ) ) ( not ( = ?auto_145712 ?auto_145718 ) ) ( not ( = ?auto_145713 ?auto_145714 ) ) ( not ( = ?auto_145713 ?auto_145715 ) ) ( not ( = ?auto_145713 ?auto_145716 ) ) ( not ( = ?auto_145713 ?auto_145717 ) ) ( not ( = ?auto_145713 ?auto_145718 ) ) ( not ( = ?auto_145714 ?auto_145715 ) ) ( not ( = ?auto_145714 ?auto_145716 ) ) ( not ( = ?auto_145714 ?auto_145717 ) ) ( not ( = ?auto_145714 ?auto_145718 ) ) ( not ( = ?auto_145715 ?auto_145716 ) ) ( not ( = ?auto_145715 ?auto_145717 ) ) ( not ( = ?auto_145715 ?auto_145718 ) ) ( not ( = ?auto_145716 ?auto_145717 ) ) ( not ( = ?auto_145716 ?auto_145718 ) ) ( not ( = ?auto_145717 ?auto_145718 ) ) ( ON ?auto_145716 ?auto_145717 ) ( ON ?auto_145715 ?auto_145716 ) ( ON ?auto_145714 ?auto_145715 ) ( ON ?auto_145713 ?auto_145714 ) ( ON ?auto_145712 ?auto_145713 ) ( ON ?auto_145711 ?auto_145712 ) ( ON ?auto_145710 ?auto_145711 ) ( ON ?auto_145709 ?auto_145710 ) ( ON ?auto_145708 ?auto_145709 ) ( ON ?auto_145707 ?auto_145708 ) ( CLEAR ?auto_145707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145707 )
      ( MAKE-11PILE ?auto_145707 ?auto_145708 ?auto_145709 ?auto_145710 ?auto_145711 ?auto_145712 ?auto_145713 ?auto_145714 ?auto_145715 ?auto_145716 ?auto_145717 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_145730 - BLOCK
      ?auto_145731 - BLOCK
      ?auto_145732 - BLOCK
      ?auto_145733 - BLOCK
      ?auto_145734 - BLOCK
      ?auto_145735 - BLOCK
      ?auto_145736 - BLOCK
      ?auto_145737 - BLOCK
      ?auto_145738 - BLOCK
      ?auto_145739 - BLOCK
      ?auto_145740 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145740 ) ( not ( = ?auto_145730 ?auto_145731 ) ) ( not ( = ?auto_145730 ?auto_145732 ) ) ( not ( = ?auto_145730 ?auto_145733 ) ) ( not ( = ?auto_145730 ?auto_145734 ) ) ( not ( = ?auto_145730 ?auto_145735 ) ) ( not ( = ?auto_145730 ?auto_145736 ) ) ( not ( = ?auto_145730 ?auto_145737 ) ) ( not ( = ?auto_145730 ?auto_145738 ) ) ( not ( = ?auto_145730 ?auto_145739 ) ) ( not ( = ?auto_145730 ?auto_145740 ) ) ( not ( = ?auto_145731 ?auto_145732 ) ) ( not ( = ?auto_145731 ?auto_145733 ) ) ( not ( = ?auto_145731 ?auto_145734 ) ) ( not ( = ?auto_145731 ?auto_145735 ) ) ( not ( = ?auto_145731 ?auto_145736 ) ) ( not ( = ?auto_145731 ?auto_145737 ) ) ( not ( = ?auto_145731 ?auto_145738 ) ) ( not ( = ?auto_145731 ?auto_145739 ) ) ( not ( = ?auto_145731 ?auto_145740 ) ) ( not ( = ?auto_145732 ?auto_145733 ) ) ( not ( = ?auto_145732 ?auto_145734 ) ) ( not ( = ?auto_145732 ?auto_145735 ) ) ( not ( = ?auto_145732 ?auto_145736 ) ) ( not ( = ?auto_145732 ?auto_145737 ) ) ( not ( = ?auto_145732 ?auto_145738 ) ) ( not ( = ?auto_145732 ?auto_145739 ) ) ( not ( = ?auto_145732 ?auto_145740 ) ) ( not ( = ?auto_145733 ?auto_145734 ) ) ( not ( = ?auto_145733 ?auto_145735 ) ) ( not ( = ?auto_145733 ?auto_145736 ) ) ( not ( = ?auto_145733 ?auto_145737 ) ) ( not ( = ?auto_145733 ?auto_145738 ) ) ( not ( = ?auto_145733 ?auto_145739 ) ) ( not ( = ?auto_145733 ?auto_145740 ) ) ( not ( = ?auto_145734 ?auto_145735 ) ) ( not ( = ?auto_145734 ?auto_145736 ) ) ( not ( = ?auto_145734 ?auto_145737 ) ) ( not ( = ?auto_145734 ?auto_145738 ) ) ( not ( = ?auto_145734 ?auto_145739 ) ) ( not ( = ?auto_145734 ?auto_145740 ) ) ( not ( = ?auto_145735 ?auto_145736 ) ) ( not ( = ?auto_145735 ?auto_145737 ) ) ( not ( = ?auto_145735 ?auto_145738 ) ) ( not ( = ?auto_145735 ?auto_145739 ) ) ( not ( = ?auto_145735 ?auto_145740 ) ) ( not ( = ?auto_145736 ?auto_145737 ) ) ( not ( = ?auto_145736 ?auto_145738 ) ) ( not ( = ?auto_145736 ?auto_145739 ) ) ( not ( = ?auto_145736 ?auto_145740 ) ) ( not ( = ?auto_145737 ?auto_145738 ) ) ( not ( = ?auto_145737 ?auto_145739 ) ) ( not ( = ?auto_145737 ?auto_145740 ) ) ( not ( = ?auto_145738 ?auto_145739 ) ) ( not ( = ?auto_145738 ?auto_145740 ) ) ( not ( = ?auto_145739 ?auto_145740 ) ) ( ON ?auto_145739 ?auto_145740 ) ( ON ?auto_145738 ?auto_145739 ) ( ON ?auto_145737 ?auto_145738 ) ( ON ?auto_145736 ?auto_145737 ) ( ON ?auto_145735 ?auto_145736 ) ( ON ?auto_145734 ?auto_145735 ) ( ON ?auto_145733 ?auto_145734 ) ( ON ?auto_145732 ?auto_145733 ) ( ON ?auto_145731 ?auto_145732 ) ( ON ?auto_145730 ?auto_145731 ) ( CLEAR ?auto_145730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145730 )
      ( MAKE-11PILE ?auto_145730 ?auto_145731 ?auto_145732 ?auto_145733 ?auto_145734 ?auto_145735 ?auto_145736 ?auto_145737 ?auto_145738 ?auto_145739 ?auto_145740 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_145752 - BLOCK
      ?auto_145753 - BLOCK
      ?auto_145754 - BLOCK
      ?auto_145755 - BLOCK
      ?auto_145756 - BLOCK
      ?auto_145757 - BLOCK
      ?auto_145758 - BLOCK
      ?auto_145759 - BLOCK
      ?auto_145760 - BLOCK
      ?auto_145761 - BLOCK
      ?auto_145762 - BLOCK
    )
    :vars
    (
      ?auto_145763 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145752 ?auto_145753 ) ) ( not ( = ?auto_145752 ?auto_145754 ) ) ( not ( = ?auto_145752 ?auto_145755 ) ) ( not ( = ?auto_145752 ?auto_145756 ) ) ( not ( = ?auto_145752 ?auto_145757 ) ) ( not ( = ?auto_145752 ?auto_145758 ) ) ( not ( = ?auto_145752 ?auto_145759 ) ) ( not ( = ?auto_145752 ?auto_145760 ) ) ( not ( = ?auto_145752 ?auto_145761 ) ) ( not ( = ?auto_145752 ?auto_145762 ) ) ( not ( = ?auto_145753 ?auto_145754 ) ) ( not ( = ?auto_145753 ?auto_145755 ) ) ( not ( = ?auto_145753 ?auto_145756 ) ) ( not ( = ?auto_145753 ?auto_145757 ) ) ( not ( = ?auto_145753 ?auto_145758 ) ) ( not ( = ?auto_145753 ?auto_145759 ) ) ( not ( = ?auto_145753 ?auto_145760 ) ) ( not ( = ?auto_145753 ?auto_145761 ) ) ( not ( = ?auto_145753 ?auto_145762 ) ) ( not ( = ?auto_145754 ?auto_145755 ) ) ( not ( = ?auto_145754 ?auto_145756 ) ) ( not ( = ?auto_145754 ?auto_145757 ) ) ( not ( = ?auto_145754 ?auto_145758 ) ) ( not ( = ?auto_145754 ?auto_145759 ) ) ( not ( = ?auto_145754 ?auto_145760 ) ) ( not ( = ?auto_145754 ?auto_145761 ) ) ( not ( = ?auto_145754 ?auto_145762 ) ) ( not ( = ?auto_145755 ?auto_145756 ) ) ( not ( = ?auto_145755 ?auto_145757 ) ) ( not ( = ?auto_145755 ?auto_145758 ) ) ( not ( = ?auto_145755 ?auto_145759 ) ) ( not ( = ?auto_145755 ?auto_145760 ) ) ( not ( = ?auto_145755 ?auto_145761 ) ) ( not ( = ?auto_145755 ?auto_145762 ) ) ( not ( = ?auto_145756 ?auto_145757 ) ) ( not ( = ?auto_145756 ?auto_145758 ) ) ( not ( = ?auto_145756 ?auto_145759 ) ) ( not ( = ?auto_145756 ?auto_145760 ) ) ( not ( = ?auto_145756 ?auto_145761 ) ) ( not ( = ?auto_145756 ?auto_145762 ) ) ( not ( = ?auto_145757 ?auto_145758 ) ) ( not ( = ?auto_145757 ?auto_145759 ) ) ( not ( = ?auto_145757 ?auto_145760 ) ) ( not ( = ?auto_145757 ?auto_145761 ) ) ( not ( = ?auto_145757 ?auto_145762 ) ) ( not ( = ?auto_145758 ?auto_145759 ) ) ( not ( = ?auto_145758 ?auto_145760 ) ) ( not ( = ?auto_145758 ?auto_145761 ) ) ( not ( = ?auto_145758 ?auto_145762 ) ) ( not ( = ?auto_145759 ?auto_145760 ) ) ( not ( = ?auto_145759 ?auto_145761 ) ) ( not ( = ?auto_145759 ?auto_145762 ) ) ( not ( = ?auto_145760 ?auto_145761 ) ) ( not ( = ?auto_145760 ?auto_145762 ) ) ( not ( = ?auto_145761 ?auto_145762 ) ) ( ON ?auto_145752 ?auto_145763 ) ( not ( = ?auto_145762 ?auto_145763 ) ) ( not ( = ?auto_145761 ?auto_145763 ) ) ( not ( = ?auto_145760 ?auto_145763 ) ) ( not ( = ?auto_145759 ?auto_145763 ) ) ( not ( = ?auto_145758 ?auto_145763 ) ) ( not ( = ?auto_145757 ?auto_145763 ) ) ( not ( = ?auto_145756 ?auto_145763 ) ) ( not ( = ?auto_145755 ?auto_145763 ) ) ( not ( = ?auto_145754 ?auto_145763 ) ) ( not ( = ?auto_145753 ?auto_145763 ) ) ( not ( = ?auto_145752 ?auto_145763 ) ) ( ON ?auto_145753 ?auto_145752 ) ( ON ?auto_145754 ?auto_145753 ) ( ON ?auto_145755 ?auto_145754 ) ( ON ?auto_145756 ?auto_145755 ) ( ON ?auto_145757 ?auto_145756 ) ( ON ?auto_145758 ?auto_145757 ) ( ON ?auto_145759 ?auto_145758 ) ( ON ?auto_145760 ?auto_145759 ) ( ON ?auto_145761 ?auto_145760 ) ( ON ?auto_145762 ?auto_145761 ) ( CLEAR ?auto_145762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_145762 ?auto_145761 ?auto_145760 ?auto_145759 ?auto_145758 ?auto_145757 ?auto_145756 ?auto_145755 ?auto_145754 ?auto_145753 ?auto_145752 )
      ( MAKE-11PILE ?auto_145752 ?auto_145753 ?auto_145754 ?auto_145755 ?auto_145756 ?auto_145757 ?auto_145758 ?auto_145759 ?auto_145760 ?auto_145761 ?auto_145762 ) )
  )

)

