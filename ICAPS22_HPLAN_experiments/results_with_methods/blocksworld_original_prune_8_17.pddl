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
      ?auto_180655 - BLOCK
      ?auto_180656 - BLOCK
      ?auto_180657 - BLOCK
      ?auto_180658 - BLOCK
      ?auto_180659 - BLOCK
      ?auto_180660 - BLOCK
      ?auto_180661 - BLOCK
      ?auto_180662 - BLOCK
    )
    :vars
    (
      ?auto_180663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180663 ?auto_180662 ) ( CLEAR ?auto_180663 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180655 ) ( ON ?auto_180656 ?auto_180655 ) ( ON ?auto_180657 ?auto_180656 ) ( ON ?auto_180658 ?auto_180657 ) ( ON ?auto_180659 ?auto_180658 ) ( ON ?auto_180660 ?auto_180659 ) ( ON ?auto_180661 ?auto_180660 ) ( ON ?auto_180662 ?auto_180661 ) ( not ( = ?auto_180655 ?auto_180656 ) ) ( not ( = ?auto_180655 ?auto_180657 ) ) ( not ( = ?auto_180655 ?auto_180658 ) ) ( not ( = ?auto_180655 ?auto_180659 ) ) ( not ( = ?auto_180655 ?auto_180660 ) ) ( not ( = ?auto_180655 ?auto_180661 ) ) ( not ( = ?auto_180655 ?auto_180662 ) ) ( not ( = ?auto_180655 ?auto_180663 ) ) ( not ( = ?auto_180656 ?auto_180657 ) ) ( not ( = ?auto_180656 ?auto_180658 ) ) ( not ( = ?auto_180656 ?auto_180659 ) ) ( not ( = ?auto_180656 ?auto_180660 ) ) ( not ( = ?auto_180656 ?auto_180661 ) ) ( not ( = ?auto_180656 ?auto_180662 ) ) ( not ( = ?auto_180656 ?auto_180663 ) ) ( not ( = ?auto_180657 ?auto_180658 ) ) ( not ( = ?auto_180657 ?auto_180659 ) ) ( not ( = ?auto_180657 ?auto_180660 ) ) ( not ( = ?auto_180657 ?auto_180661 ) ) ( not ( = ?auto_180657 ?auto_180662 ) ) ( not ( = ?auto_180657 ?auto_180663 ) ) ( not ( = ?auto_180658 ?auto_180659 ) ) ( not ( = ?auto_180658 ?auto_180660 ) ) ( not ( = ?auto_180658 ?auto_180661 ) ) ( not ( = ?auto_180658 ?auto_180662 ) ) ( not ( = ?auto_180658 ?auto_180663 ) ) ( not ( = ?auto_180659 ?auto_180660 ) ) ( not ( = ?auto_180659 ?auto_180661 ) ) ( not ( = ?auto_180659 ?auto_180662 ) ) ( not ( = ?auto_180659 ?auto_180663 ) ) ( not ( = ?auto_180660 ?auto_180661 ) ) ( not ( = ?auto_180660 ?auto_180662 ) ) ( not ( = ?auto_180660 ?auto_180663 ) ) ( not ( = ?auto_180661 ?auto_180662 ) ) ( not ( = ?auto_180661 ?auto_180663 ) ) ( not ( = ?auto_180662 ?auto_180663 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180663 ?auto_180662 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180665 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_180665 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_180665 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180666 - BLOCK
    )
    :vars
    (
      ?auto_180667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180666 ?auto_180667 ) ( CLEAR ?auto_180666 ) ( HAND-EMPTY ) ( not ( = ?auto_180666 ?auto_180667 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180666 ?auto_180667 )
      ( MAKE-1PILE ?auto_180666 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180675 - BLOCK
      ?auto_180676 - BLOCK
      ?auto_180677 - BLOCK
      ?auto_180678 - BLOCK
      ?auto_180679 - BLOCK
      ?auto_180680 - BLOCK
      ?auto_180681 - BLOCK
    )
    :vars
    (
      ?auto_180682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180682 ?auto_180681 ) ( CLEAR ?auto_180682 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180675 ) ( ON ?auto_180676 ?auto_180675 ) ( ON ?auto_180677 ?auto_180676 ) ( ON ?auto_180678 ?auto_180677 ) ( ON ?auto_180679 ?auto_180678 ) ( ON ?auto_180680 ?auto_180679 ) ( ON ?auto_180681 ?auto_180680 ) ( not ( = ?auto_180675 ?auto_180676 ) ) ( not ( = ?auto_180675 ?auto_180677 ) ) ( not ( = ?auto_180675 ?auto_180678 ) ) ( not ( = ?auto_180675 ?auto_180679 ) ) ( not ( = ?auto_180675 ?auto_180680 ) ) ( not ( = ?auto_180675 ?auto_180681 ) ) ( not ( = ?auto_180675 ?auto_180682 ) ) ( not ( = ?auto_180676 ?auto_180677 ) ) ( not ( = ?auto_180676 ?auto_180678 ) ) ( not ( = ?auto_180676 ?auto_180679 ) ) ( not ( = ?auto_180676 ?auto_180680 ) ) ( not ( = ?auto_180676 ?auto_180681 ) ) ( not ( = ?auto_180676 ?auto_180682 ) ) ( not ( = ?auto_180677 ?auto_180678 ) ) ( not ( = ?auto_180677 ?auto_180679 ) ) ( not ( = ?auto_180677 ?auto_180680 ) ) ( not ( = ?auto_180677 ?auto_180681 ) ) ( not ( = ?auto_180677 ?auto_180682 ) ) ( not ( = ?auto_180678 ?auto_180679 ) ) ( not ( = ?auto_180678 ?auto_180680 ) ) ( not ( = ?auto_180678 ?auto_180681 ) ) ( not ( = ?auto_180678 ?auto_180682 ) ) ( not ( = ?auto_180679 ?auto_180680 ) ) ( not ( = ?auto_180679 ?auto_180681 ) ) ( not ( = ?auto_180679 ?auto_180682 ) ) ( not ( = ?auto_180680 ?auto_180681 ) ) ( not ( = ?auto_180680 ?auto_180682 ) ) ( not ( = ?auto_180681 ?auto_180682 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180682 ?auto_180681 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180683 - BLOCK
      ?auto_180684 - BLOCK
      ?auto_180685 - BLOCK
      ?auto_180686 - BLOCK
      ?auto_180687 - BLOCK
      ?auto_180688 - BLOCK
      ?auto_180689 - BLOCK
    )
    :vars
    (
      ?auto_180690 - BLOCK
      ?auto_180691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180690 ?auto_180689 ) ( CLEAR ?auto_180690 ) ( ON-TABLE ?auto_180683 ) ( ON ?auto_180684 ?auto_180683 ) ( ON ?auto_180685 ?auto_180684 ) ( ON ?auto_180686 ?auto_180685 ) ( ON ?auto_180687 ?auto_180686 ) ( ON ?auto_180688 ?auto_180687 ) ( ON ?auto_180689 ?auto_180688 ) ( not ( = ?auto_180683 ?auto_180684 ) ) ( not ( = ?auto_180683 ?auto_180685 ) ) ( not ( = ?auto_180683 ?auto_180686 ) ) ( not ( = ?auto_180683 ?auto_180687 ) ) ( not ( = ?auto_180683 ?auto_180688 ) ) ( not ( = ?auto_180683 ?auto_180689 ) ) ( not ( = ?auto_180683 ?auto_180690 ) ) ( not ( = ?auto_180684 ?auto_180685 ) ) ( not ( = ?auto_180684 ?auto_180686 ) ) ( not ( = ?auto_180684 ?auto_180687 ) ) ( not ( = ?auto_180684 ?auto_180688 ) ) ( not ( = ?auto_180684 ?auto_180689 ) ) ( not ( = ?auto_180684 ?auto_180690 ) ) ( not ( = ?auto_180685 ?auto_180686 ) ) ( not ( = ?auto_180685 ?auto_180687 ) ) ( not ( = ?auto_180685 ?auto_180688 ) ) ( not ( = ?auto_180685 ?auto_180689 ) ) ( not ( = ?auto_180685 ?auto_180690 ) ) ( not ( = ?auto_180686 ?auto_180687 ) ) ( not ( = ?auto_180686 ?auto_180688 ) ) ( not ( = ?auto_180686 ?auto_180689 ) ) ( not ( = ?auto_180686 ?auto_180690 ) ) ( not ( = ?auto_180687 ?auto_180688 ) ) ( not ( = ?auto_180687 ?auto_180689 ) ) ( not ( = ?auto_180687 ?auto_180690 ) ) ( not ( = ?auto_180688 ?auto_180689 ) ) ( not ( = ?auto_180688 ?auto_180690 ) ) ( not ( = ?auto_180689 ?auto_180690 ) ) ( HOLDING ?auto_180691 ) ( not ( = ?auto_180683 ?auto_180691 ) ) ( not ( = ?auto_180684 ?auto_180691 ) ) ( not ( = ?auto_180685 ?auto_180691 ) ) ( not ( = ?auto_180686 ?auto_180691 ) ) ( not ( = ?auto_180687 ?auto_180691 ) ) ( not ( = ?auto_180688 ?auto_180691 ) ) ( not ( = ?auto_180689 ?auto_180691 ) ) ( not ( = ?auto_180690 ?auto_180691 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_180691 )
      ( MAKE-7PILE ?auto_180683 ?auto_180684 ?auto_180685 ?auto_180686 ?auto_180687 ?auto_180688 ?auto_180689 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180692 - BLOCK
      ?auto_180693 - BLOCK
      ?auto_180694 - BLOCK
      ?auto_180695 - BLOCK
      ?auto_180696 - BLOCK
      ?auto_180697 - BLOCK
      ?auto_180698 - BLOCK
    )
    :vars
    (
      ?auto_180699 - BLOCK
      ?auto_180700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180699 ?auto_180698 ) ( ON-TABLE ?auto_180692 ) ( ON ?auto_180693 ?auto_180692 ) ( ON ?auto_180694 ?auto_180693 ) ( ON ?auto_180695 ?auto_180694 ) ( ON ?auto_180696 ?auto_180695 ) ( ON ?auto_180697 ?auto_180696 ) ( ON ?auto_180698 ?auto_180697 ) ( not ( = ?auto_180692 ?auto_180693 ) ) ( not ( = ?auto_180692 ?auto_180694 ) ) ( not ( = ?auto_180692 ?auto_180695 ) ) ( not ( = ?auto_180692 ?auto_180696 ) ) ( not ( = ?auto_180692 ?auto_180697 ) ) ( not ( = ?auto_180692 ?auto_180698 ) ) ( not ( = ?auto_180692 ?auto_180699 ) ) ( not ( = ?auto_180693 ?auto_180694 ) ) ( not ( = ?auto_180693 ?auto_180695 ) ) ( not ( = ?auto_180693 ?auto_180696 ) ) ( not ( = ?auto_180693 ?auto_180697 ) ) ( not ( = ?auto_180693 ?auto_180698 ) ) ( not ( = ?auto_180693 ?auto_180699 ) ) ( not ( = ?auto_180694 ?auto_180695 ) ) ( not ( = ?auto_180694 ?auto_180696 ) ) ( not ( = ?auto_180694 ?auto_180697 ) ) ( not ( = ?auto_180694 ?auto_180698 ) ) ( not ( = ?auto_180694 ?auto_180699 ) ) ( not ( = ?auto_180695 ?auto_180696 ) ) ( not ( = ?auto_180695 ?auto_180697 ) ) ( not ( = ?auto_180695 ?auto_180698 ) ) ( not ( = ?auto_180695 ?auto_180699 ) ) ( not ( = ?auto_180696 ?auto_180697 ) ) ( not ( = ?auto_180696 ?auto_180698 ) ) ( not ( = ?auto_180696 ?auto_180699 ) ) ( not ( = ?auto_180697 ?auto_180698 ) ) ( not ( = ?auto_180697 ?auto_180699 ) ) ( not ( = ?auto_180698 ?auto_180699 ) ) ( not ( = ?auto_180692 ?auto_180700 ) ) ( not ( = ?auto_180693 ?auto_180700 ) ) ( not ( = ?auto_180694 ?auto_180700 ) ) ( not ( = ?auto_180695 ?auto_180700 ) ) ( not ( = ?auto_180696 ?auto_180700 ) ) ( not ( = ?auto_180697 ?auto_180700 ) ) ( not ( = ?auto_180698 ?auto_180700 ) ) ( not ( = ?auto_180699 ?auto_180700 ) ) ( ON ?auto_180700 ?auto_180699 ) ( CLEAR ?auto_180700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_180692 ?auto_180693 ?auto_180694 ?auto_180695 ?auto_180696 ?auto_180697 ?auto_180698 ?auto_180699 )
      ( MAKE-7PILE ?auto_180692 ?auto_180693 ?auto_180694 ?auto_180695 ?auto_180696 ?auto_180697 ?auto_180698 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_180703 - BLOCK
      ?auto_180704 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_180704 ) ( CLEAR ?auto_180703 ) ( ON-TABLE ?auto_180703 ) ( not ( = ?auto_180703 ?auto_180704 ) ) )
    :subtasks
    ( ( !STACK ?auto_180704 ?auto_180703 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_180705 - BLOCK
      ?auto_180706 - BLOCK
    )
    :vars
    (
      ?auto_180707 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_180705 ) ( ON-TABLE ?auto_180705 ) ( not ( = ?auto_180705 ?auto_180706 ) ) ( ON ?auto_180706 ?auto_180707 ) ( CLEAR ?auto_180706 ) ( HAND-EMPTY ) ( not ( = ?auto_180705 ?auto_180707 ) ) ( not ( = ?auto_180706 ?auto_180707 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180706 ?auto_180707 )
      ( MAKE-2PILE ?auto_180705 ?auto_180706 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_180708 - BLOCK
      ?auto_180709 - BLOCK
    )
    :vars
    (
      ?auto_180710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180708 ?auto_180709 ) ) ( ON ?auto_180709 ?auto_180710 ) ( CLEAR ?auto_180709 ) ( not ( = ?auto_180708 ?auto_180710 ) ) ( not ( = ?auto_180709 ?auto_180710 ) ) ( HOLDING ?auto_180708 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180708 )
      ( MAKE-2PILE ?auto_180708 ?auto_180709 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_180711 - BLOCK
      ?auto_180712 - BLOCK
    )
    :vars
    (
      ?auto_180713 - BLOCK
      ?auto_180717 - BLOCK
      ?auto_180714 - BLOCK
      ?auto_180715 - BLOCK
      ?auto_180716 - BLOCK
      ?auto_180718 - BLOCK
      ?auto_180719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180711 ?auto_180712 ) ) ( ON ?auto_180712 ?auto_180713 ) ( not ( = ?auto_180711 ?auto_180713 ) ) ( not ( = ?auto_180712 ?auto_180713 ) ) ( ON ?auto_180711 ?auto_180712 ) ( CLEAR ?auto_180711 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180717 ) ( ON ?auto_180714 ?auto_180717 ) ( ON ?auto_180715 ?auto_180714 ) ( ON ?auto_180716 ?auto_180715 ) ( ON ?auto_180718 ?auto_180716 ) ( ON ?auto_180719 ?auto_180718 ) ( ON ?auto_180713 ?auto_180719 ) ( not ( = ?auto_180717 ?auto_180714 ) ) ( not ( = ?auto_180717 ?auto_180715 ) ) ( not ( = ?auto_180717 ?auto_180716 ) ) ( not ( = ?auto_180717 ?auto_180718 ) ) ( not ( = ?auto_180717 ?auto_180719 ) ) ( not ( = ?auto_180717 ?auto_180713 ) ) ( not ( = ?auto_180717 ?auto_180712 ) ) ( not ( = ?auto_180717 ?auto_180711 ) ) ( not ( = ?auto_180714 ?auto_180715 ) ) ( not ( = ?auto_180714 ?auto_180716 ) ) ( not ( = ?auto_180714 ?auto_180718 ) ) ( not ( = ?auto_180714 ?auto_180719 ) ) ( not ( = ?auto_180714 ?auto_180713 ) ) ( not ( = ?auto_180714 ?auto_180712 ) ) ( not ( = ?auto_180714 ?auto_180711 ) ) ( not ( = ?auto_180715 ?auto_180716 ) ) ( not ( = ?auto_180715 ?auto_180718 ) ) ( not ( = ?auto_180715 ?auto_180719 ) ) ( not ( = ?auto_180715 ?auto_180713 ) ) ( not ( = ?auto_180715 ?auto_180712 ) ) ( not ( = ?auto_180715 ?auto_180711 ) ) ( not ( = ?auto_180716 ?auto_180718 ) ) ( not ( = ?auto_180716 ?auto_180719 ) ) ( not ( = ?auto_180716 ?auto_180713 ) ) ( not ( = ?auto_180716 ?auto_180712 ) ) ( not ( = ?auto_180716 ?auto_180711 ) ) ( not ( = ?auto_180718 ?auto_180719 ) ) ( not ( = ?auto_180718 ?auto_180713 ) ) ( not ( = ?auto_180718 ?auto_180712 ) ) ( not ( = ?auto_180718 ?auto_180711 ) ) ( not ( = ?auto_180719 ?auto_180713 ) ) ( not ( = ?auto_180719 ?auto_180712 ) ) ( not ( = ?auto_180719 ?auto_180711 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_180717 ?auto_180714 ?auto_180715 ?auto_180716 ?auto_180718 ?auto_180719 ?auto_180713 ?auto_180712 )
      ( MAKE-2PILE ?auto_180711 ?auto_180712 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180726 - BLOCK
      ?auto_180727 - BLOCK
      ?auto_180728 - BLOCK
      ?auto_180729 - BLOCK
      ?auto_180730 - BLOCK
      ?auto_180731 - BLOCK
    )
    :vars
    (
      ?auto_180732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180732 ?auto_180731 ) ( CLEAR ?auto_180732 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180726 ) ( ON ?auto_180727 ?auto_180726 ) ( ON ?auto_180728 ?auto_180727 ) ( ON ?auto_180729 ?auto_180728 ) ( ON ?auto_180730 ?auto_180729 ) ( ON ?auto_180731 ?auto_180730 ) ( not ( = ?auto_180726 ?auto_180727 ) ) ( not ( = ?auto_180726 ?auto_180728 ) ) ( not ( = ?auto_180726 ?auto_180729 ) ) ( not ( = ?auto_180726 ?auto_180730 ) ) ( not ( = ?auto_180726 ?auto_180731 ) ) ( not ( = ?auto_180726 ?auto_180732 ) ) ( not ( = ?auto_180727 ?auto_180728 ) ) ( not ( = ?auto_180727 ?auto_180729 ) ) ( not ( = ?auto_180727 ?auto_180730 ) ) ( not ( = ?auto_180727 ?auto_180731 ) ) ( not ( = ?auto_180727 ?auto_180732 ) ) ( not ( = ?auto_180728 ?auto_180729 ) ) ( not ( = ?auto_180728 ?auto_180730 ) ) ( not ( = ?auto_180728 ?auto_180731 ) ) ( not ( = ?auto_180728 ?auto_180732 ) ) ( not ( = ?auto_180729 ?auto_180730 ) ) ( not ( = ?auto_180729 ?auto_180731 ) ) ( not ( = ?auto_180729 ?auto_180732 ) ) ( not ( = ?auto_180730 ?auto_180731 ) ) ( not ( = ?auto_180730 ?auto_180732 ) ) ( not ( = ?auto_180731 ?auto_180732 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180732 ?auto_180731 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180733 - BLOCK
      ?auto_180734 - BLOCK
      ?auto_180735 - BLOCK
      ?auto_180736 - BLOCK
      ?auto_180737 - BLOCK
      ?auto_180738 - BLOCK
    )
    :vars
    (
      ?auto_180739 - BLOCK
      ?auto_180740 - BLOCK
      ?auto_180741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180739 ?auto_180738 ) ( CLEAR ?auto_180739 ) ( ON-TABLE ?auto_180733 ) ( ON ?auto_180734 ?auto_180733 ) ( ON ?auto_180735 ?auto_180734 ) ( ON ?auto_180736 ?auto_180735 ) ( ON ?auto_180737 ?auto_180736 ) ( ON ?auto_180738 ?auto_180737 ) ( not ( = ?auto_180733 ?auto_180734 ) ) ( not ( = ?auto_180733 ?auto_180735 ) ) ( not ( = ?auto_180733 ?auto_180736 ) ) ( not ( = ?auto_180733 ?auto_180737 ) ) ( not ( = ?auto_180733 ?auto_180738 ) ) ( not ( = ?auto_180733 ?auto_180739 ) ) ( not ( = ?auto_180734 ?auto_180735 ) ) ( not ( = ?auto_180734 ?auto_180736 ) ) ( not ( = ?auto_180734 ?auto_180737 ) ) ( not ( = ?auto_180734 ?auto_180738 ) ) ( not ( = ?auto_180734 ?auto_180739 ) ) ( not ( = ?auto_180735 ?auto_180736 ) ) ( not ( = ?auto_180735 ?auto_180737 ) ) ( not ( = ?auto_180735 ?auto_180738 ) ) ( not ( = ?auto_180735 ?auto_180739 ) ) ( not ( = ?auto_180736 ?auto_180737 ) ) ( not ( = ?auto_180736 ?auto_180738 ) ) ( not ( = ?auto_180736 ?auto_180739 ) ) ( not ( = ?auto_180737 ?auto_180738 ) ) ( not ( = ?auto_180737 ?auto_180739 ) ) ( not ( = ?auto_180738 ?auto_180739 ) ) ( HOLDING ?auto_180740 ) ( CLEAR ?auto_180741 ) ( not ( = ?auto_180733 ?auto_180740 ) ) ( not ( = ?auto_180733 ?auto_180741 ) ) ( not ( = ?auto_180734 ?auto_180740 ) ) ( not ( = ?auto_180734 ?auto_180741 ) ) ( not ( = ?auto_180735 ?auto_180740 ) ) ( not ( = ?auto_180735 ?auto_180741 ) ) ( not ( = ?auto_180736 ?auto_180740 ) ) ( not ( = ?auto_180736 ?auto_180741 ) ) ( not ( = ?auto_180737 ?auto_180740 ) ) ( not ( = ?auto_180737 ?auto_180741 ) ) ( not ( = ?auto_180738 ?auto_180740 ) ) ( not ( = ?auto_180738 ?auto_180741 ) ) ( not ( = ?auto_180739 ?auto_180740 ) ) ( not ( = ?auto_180739 ?auto_180741 ) ) ( not ( = ?auto_180740 ?auto_180741 ) ) )
    :subtasks
    ( ( !STACK ?auto_180740 ?auto_180741 )
      ( MAKE-6PILE ?auto_180733 ?auto_180734 ?auto_180735 ?auto_180736 ?auto_180737 ?auto_180738 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182073 - BLOCK
      ?auto_182074 - BLOCK
      ?auto_182075 - BLOCK
      ?auto_182076 - BLOCK
      ?auto_182077 - BLOCK
      ?auto_182078 - BLOCK
    )
    :vars
    (
      ?auto_182080 - BLOCK
      ?auto_182079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182080 ?auto_182078 ) ( ON-TABLE ?auto_182073 ) ( ON ?auto_182074 ?auto_182073 ) ( ON ?auto_182075 ?auto_182074 ) ( ON ?auto_182076 ?auto_182075 ) ( ON ?auto_182077 ?auto_182076 ) ( ON ?auto_182078 ?auto_182077 ) ( not ( = ?auto_182073 ?auto_182074 ) ) ( not ( = ?auto_182073 ?auto_182075 ) ) ( not ( = ?auto_182073 ?auto_182076 ) ) ( not ( = ?auto_182073 ?auto_182077 ) ) ( not ( = ?auto_182073 ?auto_182078 ) ) ( not ( = ?auto_182073 ?auto_182080 ) ) ( not ( = ?auto_182074 ?auto_182075 ) ) ( not ( = ?auto_182074 ?auto_182076 ) ) ( not ( = ?auto_182074 ?auto_182077 ) ) ( not ( = ?auto_182074 ?auto_182078 ) ) ( not ( = ?auto_182074 ?auto_182080 ) ) ( not ( = ?auto_182075 ?auto_182076 ) ) ( not ( = ?auto_182075 ?auto_182077 ) ) ( not ( = ?auto_182075 ?auto_182078 ) ) ( not ( = ?auto_182075 ?auto_182080 ) ) ( not ( = ?auto_182076 ?auto_182077 ) ) ( not ( = ?auto_182076 ?auto_182078 ) ) ( not ( = ?auto_182076 ?auto_182080 ) ) ( not ( = ?auto_182077 ?auto_182078 ) ) ( not ( = ?auto_182077 ?auto_182080 ) ) ( not ( = ?auto_182078 ?auto_182080 ) ) ( not ( = ?auto_182073 ?auto_182079 ) ) ( not ( = ?auto_182074 ?auto_182079 ) ) ( not ( = ?auto_182075 ?auto_182079 ) ) ( not ( = ?auto_182076 ?auto_182079 ) ) ( not ( = ?auto_182077 ?auto_182079 ) ) ( not ( = ?auto_182078 ?auto_182079 ) ) ( not ( = ?auto_182080 ?auto_182079 ) ) ( ON ?auto_182079 ?auto_182080 ) ( CLEAR ?auto_182079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182073 ?auto_182074 ?auto_182075 ?auto_182076 ?auto_182077 ?auto_182078 ?auto_182080 )
      ( MAKE-6PILE ?auto_182073 ?auto_182074 ?auto_182075 ?auto_182076 ?auto_182077 ?auto_182078 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180751 - BLOCK
      ?auto_180752 - BLOCK
      ?auto_180753 - BLOCK
      ?auto_180754 - BLOCK
      ?auto_180755 - BLOCK
      ?auto_180756 - BLOCK
    )
    :vars
    (
      ?auto_180759 - BLOCK
      ?auto_180757 - BLOCK
      ?auto_180758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180759 ?auto_180756 ) ( ON-TABLE ?auto_180751 ) ( ON ?auto_180752 ?auto_180751 ) ( ON ?auto_180753 ?auto_180752 ) ( ON ?auto_180754 ?auto_180753 ) ( ON ?auto_180755 ?auto_180754 ) ( ON ?auto_180756 ?auto_180755 ) ( not ( = ?auto_180751 ?auto_180752 ) ) ( not ( = ?auto_180751 ?auto_180753 ) ) ( not ( = ?auto_180751 ?auto_180754 ) ) ( not ( = ?auto_180751 ?auto_180755 ) ) ( not ( = ?auto_180751 ?auto_180756 ) ) ( not ( = ?auto_180751 ?auto_180759 ) ) ( not ( = ?auto_180752 ?auto_180753 ) ) ( not ( = ?auto_180752 ?auto_180754 ) ) ( not ( = ?auto_180752 ?auto_180755 ) ) ( not ( = ?auto_180752 ?auto_180756 ) ) ( not ( = ?auto_180752 ?auto_180759 ) ) ( not ( = ?auto_180753 ?auto_180754 ) ) ( not ( = ?auto_180753 ?auto_180755 ) ) ( not ( = ?auto_180753 ?auto_180756 ) ) ( not ( = ?auto_180753 ?auto_180759 ) ) ( not ( = ?auto_180754 ?auto_180755 ) ) ( not ( = ?auto_180754 ?auto_180756 ) ) ( not ( = ?auto_180754 ?auto_180759 ) ) ( not ( = ?auto_180755 ?auto_180756 ) ) ( not ( = ?auto_180755 ?auto_180759 ) ) ( not ( = ?auto_180756 ?auto_180759 ) ) ( not ( = ?auto_180751 ?auto_180757 ) ) ( not ( = ?auto_180751 ?auto_180758 ) ) ( not ( = ?auto_180752 ?auto_180757 ) ) ( not ( = ?auto_180752 ?auto_180758 ) ) ( not ( = ?auto_180753 ?auto_180757 ) ) ( not ( = ?auto_180753 ?auto_180758 ) ) ( not ( = ?auto_180754 ?auto_180757 ) ) ( not ( = ?auto_180754 ?auto_180758 ) ) ( not ( = ?auto_180755 ?auto_180757 ) ) ( not ( = ?auto_180755 ?auto_180758 ) ) ( not ( = ?auto_180756 ?auto_180757 ) ) ( not ( = ?auto_180756 ?auto_180758 ) ) ( not ( = ?auto_180759 ?auto_180757 ) ) ( not ( = ?auto_180759 ?auto_180758 ) ) ( not ( = ?auto_180757 ?auto_180758 ) ) ( ON ?auto_180757 ?auto_180759 ) ( CLEAR ?auto_180757 ) ( HOLDING ?auto_180758 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180758 )
      ( MAKE-6PILE ?auto_180751 ?auto_180752 ?auto_180753 ?auto_180754 ?auto_180755 ?auto_180756 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180760 - BLOCK
      ?auto_180761 - BLOCK
      ?auto_180762 - BLOCK
      ?auto_180763 - BLOCK
      ?auto_180764 - BLOCK
      ?auto_180765 - BLOCK
    )
    :vars
    (
      ?auto_180767 - BLOCK
      ?auto_180768 - BLOCK
      ?auto_180766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180767 ?auto_180765 ) ( ON-TABLE ?auto_180760 ) ( ON ?auto_180761 ?auto_180760 ) ( ON ?auto_180762 ?auto_180761 ) ( ON ?auto_180763 ?auto_180762 ) ( ON ?auto_180764 ?auto_180763 ) ( ON ?auto_180765 ?auto_180764 ) ( not ( = ?auto_180760 ?auto_180761 ) ) ( not ( = ?auto_180760 ?auto_180762 ) ) ( not ( = ?auto_180760 ?auto_180763 ) ) ( not ( = ?auto_180760 ?auto_180764 ) ) ( not ( = ?auto_180760 ?auto_180765 ) ) ( not ( = ?auto_180760 ?auto_180767 ) ) ( not ( = ?auto_180761 ?auto_180762 ) ) ( not ( = ?auto_180761 ?auto_180763 ) ) ( not ( = ?auto_180761 ?auto_180764 ) ) ( not ( = ?auto_180761 ?auto_180765 ) ) ( not ( = ?auto_180761 ?auto_180767 ) ) ( not ( = ?auto_180762 ?auto_180763 ) ) ( not ( = ?auto_180762 ?auto_180764 ) ) ( not ( = ?auto_180762 ?auto_180765 ) ) ( not ( = ?auto_180762 ?auto_180767 ) ) ( not ( = ?auto_180763 ?auto_180764 ) ) ( not ( = ?auto_180763 ?auto_180765 ) ) ( not ( = ?auto_180763 ?auto_180767 ) ) ( not ( = ?auto_180764 ?auto_180765 ) ) ( not ( = ?auto_180764 ?auto_180767 ) ) ( not ( = ?auto_180765 ?auto_180767 ) ) ( not ( = ?auto_180760 ?auto_180768 ) ) ( not ( = ?auto_180760 ?auto_180766 ) ) ( not ( = ?auto_180761 ?auto_180768 ) ) ( not ( = ?auto_180761 ?auto_180766 ) ) ( not ( = ?auto_180762 ?auto_180768 ) ) ( not ( = ?auto_180762 ?auto_180766 ) ) ( not ( = ?auto_180763 ?auto_180768 ) ) ( not ( = ?auto_180763 ?auto_180766 ) ) ( not ( = ?auto_180764 ?auto_180768 ) ) ( not ( = ?auto_180764 ?auto_180766 ) ) ( not ( = ?auto_180765 ?auto_180768 ) ) ( not ( = ?auto_180765 ?auto_180766 ) ) ( not ( = ?auto_180767 ?auto_180768 ) ) ( not ( = ?auto_180767 ?auto_180766 ) ) ( not ( = ?auto_180768 ?auto_180766 ) ) ( ON ?auto_180768 ?auto_180767 ) ( ON ?auto_180766 ?auto_180768 ) ( CLEAR ?auto_180766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_180760 ?auto_180761 ?auto_180762 ?auto_180763 ?auto_180764 ?auto_180765 ?auto_180767 ?auto_180768 )
      ( MAKE-6PILE ?auto_180760 ?auto_180761 ?auto_180762 ?auto_180763 ?auto_180764 ?auto_180765 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_180772 - BLOCK
      ?auto_180773 - BLOCK
      ?auto_180774 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_180774 ) ( CLEAR ?auto_180773 ) ( ON-TABLE ?auto_180772 ) ( ON ?auto_180773 ?auto_180772 ) ( not ( = ?auto_180772 ?auto_180773 ) ) ( not ( = ?auto_180772 ?auto_180774 ) ) ( not ( = ?auto_180773 ?auto_180774 ) ) )
    :subtasks
    ( ( !STACK ?auto_180774 ?auto_180773 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_180775 - BLOCK
      ?auto_180776 - BLOCK
      ?auto_180777 - BLOCK
    )
    :vars
    (
      ?auto_180778 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_180776 ) ( ON-TABLE ?auto_180775 ) ( ON ?auto_180776 ?auto_180775 ) ( not ( = ?auto_180775 ?auto_180776 ) ) ( not ( = ?auto_180775 ?auto_180777 ) ) ( not ( = ?auto_180776 ?auto_180777 ) ) ( ON ?auto_180777 ?auto_180778 ) ( CLEAR ?auto_180777 ) ( HAND-EMPTY ) ( not ( = ?auto_180775 ?auto_180778 ) ) ( not ( = ?auto_180776 ?auto_180778 ) ) ( not ( = ?auto_180777 ?auto_180778 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180777 ?auto_180778 )
      ( MAKE-3PILE ?auto_180775 ?auto_180776 ?auto_180777 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_180779 - BLOCK
      ?auto_180780 - BLOCK
      ?auto_180781 - BLOCK
    )
    :vars
    (
      ?auto_180782 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180779 ) ( not ( = ?auto_180779 ?auto_180780 ) ) ( not ( = ?auto_180779 ?auto_180781 ) ) ( not ( = ?auto_180780 ?auto_180781 ) ) ( ON ?auto_180781 ?auto_180782 ) ( CLEAR ?auto_180781 ) ( not ( = ?auto_180779 ?auto_180782 ) ) ( not ( = ?auto_180780 ?auto_180782 ) ) ( not ( = ?auto_180781 ?auto_180782 ) ) ( HOLDING ?auto_180780 ) ( CLEAR ?auto_180779 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180779 ?auto_180780 )
      ( MAKE-3PILE ?auto_180779 ?auto_180780 ?auto_180781 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_180783 - BLOCK
      ?auto_180784 - BLOCK
      ?auto_180785 - BLOCK
    )
    :vars
    (
      ?auto_180786 - BLOCK
      ?auto_180787 - BLOCK
      ?auto_180788 - BLOCK
      ?auto_180790 - BLOCK
      ?auto_180791 - BLOCK
      ?auto_180789 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180783 ) ( not ( = ?auto_180783 ?auto_180784 ) ) ( not ( = ?auto_180783 ?auto_180785 ) ) ( not ( = ?auto_180784 ?auto_180785 ) ) ( ON ?auto_180785 ?auto_180786 ) ( not ( = ?auto_180783 ?auto_180786 ) ) ( not ( = ?auto_180784 ?auto_180786 ) ) ( not ( = ?auto_180785 ?auto_180786 ) ) ( CLEAR ?auto_180783 ) ( ON ?auto_180784 ?auto_180785 ) ( CLEAR ?auto_180784 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180787 ) ( ON ?auto_180788 ?auto_180787 ) ( ON ?auto_180790 ?auto_180788 ) ( ON ?auto_180791 ?auto_180790 ) ( ON ?auto_180789 ?auto_180791 ) ( ON ?auto_180786 ?auto_180789 ) ( not ( = ?auto_180787 ?auto_180788 ) ) ( not ( = ?auto_180787 ?auto_180790 ) ) ( not ( = ?auto_180787 ?auto_180791 ) ) ( not ( = ?auto_180787 ?auto_180789 ) ) ( not ( = ?auto_180787 ?auto_180786 ) ) ( not ( = ?auto_180787 ?auto_180785 ) ) ( not ( = ?auto_180787 ?auto_180784 ) ) ( not ( = ?auto_180788 ?auto_180790 ) ) ( not ( = ?auto_180788 ?auto_180791 ) ) ( not ( = ?auto_180788 ?auto_180789 ) ) ( not ( = ?auto_180788 ?auto_180786 ) ) ( not ( = ?auto_180788 ?auto_180785 ) ) ( not ( = ?auto_180788 ?auto_180784 ) ) ( not ( = ?auto_180790 ?auto_180791 ) ) ( not ( = ?auto_180790 ?auto_180789 ) ) ( not ( = ?auto_180790 ?auto_180786 ) ) ( not ( = ?auto_180790 ?auto_180785 ) ) ( not ( = ?auto_180790 ?auto_180784 ) ) ( not ( = ?auto_180791 ?auto_180789 ) ) ( not ( = ?auto_180791 ?auto_180786 ) ) ( not ( = ?auto_180791 ?auto_180785 ) ) ( not ( = ?auto_180791 ?auto_180784 ) ) ( not ( = ?auto_180789 ?auto_180786 ) ) ( not ( = ?auto_180789 ?auto_180785 ) ) ( not ( = ?auto_180789 ?auto_180784 ) ) ( not ( = ?auto_180783 ?auto_180787 ) ) ( not ( = ?auto_180783 ?auto_180788 ) ) ( not ( = ?auto_180783 ?auto_180790 ) ) ( not ( = ?auto_180783 ?auto_180791 ) ) ( not ( = ?auto_180783 ?auto_180789 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180787 ?auto_180788 ?auto_180790 ?auto_180791 ?auto_180789 ?auto_180786 ?auto_180785 )
      ( MAKE-3PILE ?auto_180783 ?auto_180784 ?auto_180785 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_180792 - BLOCK
      ?auto_180793 - BLOCK
      ?auto_180794 - BLOCK
    )
    :vars
    (
      ?auto_180796 - BLOCK
      ?auto_180799 - BLOCK
      ?auto_180798 - BLOCK
      ?auto_180797 - BLOCK
      ?auto_180795 - BLOCK
      ?auto_180800 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180792 ?auto_180793 ) ) ( not ( = ?auto_180792 ?auto_180794 ) ) ( not ( = ?auto_180793 ?auto_180794 ) ) ( ON ?auto_180794 ?auto_180796 ) ( not ( = ?auto_180792 ?auto_180796 ) ) ( not ( = ?auto_180793 ?auto_180796 ) ) ( not ( = ?auto_180794 ?auto_180796 ) ) ( ON ?auto_180793 ?auto_180794 ) ( CLEAR ?auto_180793 ) ( ON-TABLE ?auto_180799 ) ( ON ?auto_180798 ?auto_180799 ) ( ON ?auto_180797 ?auto_180798 ) ( ON ?auto_180795 ?auto_180797 ) ( ON ?auto_180800 ?auto_180795 ) ( ON ?auto_180796 ?auto_180800 ) ( not ( = ?auto_180799 ?auto_180798 ) ) ( not ( = ?auto_180799 ?auto_180797 ) ) ( not ( = ?auto_180799 ?auto_180795 ) ) ( not ( = ?auto_180799 ?auto_180800 ) ) ( not ( = ?auto_180799 ?auto_180796 ) ) ( not ( = ?auto_180799 ?auto_180794 ) ) ( not ( = ?auto_180799 ?auto_180793 ) ) ( not ( = ?auto_180798 ?auto_180797 ) ) ( not ( = ?auto_180798 ?auto_180795 ) ) ( not ( = ?auto_180798 ?auto_180800 ) ) ( not ( = ?auto_180798 ?auto_180796 ) ) ( not ( = ?auto_180798 ?auto_180794 ) ) ( not ( = ?auto_180798 ?auto_180793 ) ) ( not ( = ?auto_180797 ?auto_180795 ) ) ( not ( = ?auto_180797 ?auto_180800 ) ) ( not ( = ?auto_180797 ?auto_180796 ) ) ( not ( = ?auto_180797 ?auto_180794 ) ) ( not ( = ?auto_180797 ?auto_180793 ) ) ( not ( = ?auto_180795 ?auto_180800 ) ) ( not ( = ?auto_180795 ?auto_180796 ) ) ( not ( = ?auto_180795 ?auto_180794 ) ) ( not ( = ?auto_180795 ?auto_180793 ) ) ( not ( = ?auto_180800 ?auto_180796 ) ) ( not ( = ?auto_180800 ?auto_180794 ) ) ( not ( = ?auto_180800 ?auto_180793 ) ) ( not ( = ?auto_180792 ?auto_180799 ) ) ( not ( = ?auto_180792 ?auto_180798 ) ) ( not ( = ?auto_180792 ?auto_180797 ) ) ( not ( = ?auto_180792 ?auto_180795 ) ) ( not ( = ?auto_180792 ?auto_180800 ) ) ( HOLDING ?auto_180792 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180792 )
      ( MAKE-3PILE ?auto_180792 ?auto_180793 ?auto_180794 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_180801 - BLOCK
      ?auto_180802 - BLOCK
      ?auto_180803 - BLOCK
    )
    :vars
    (
      ?auto_180809 - BLOCK
      ?auto_180805 - BLOCK
      ?auto_180808 - BLOCK
      ?auto_180807 - BLOCK
      ?auto_180806 - BLOCK
      ?auto_180804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180801 ?auto_180802 ) ) ( not ( = ?auto_180801 ?auto_180803 ) ) ( not ( = ?auto_180802 ?auto_180803 ) ) ( ON ?auto_180803 ?auto_180809 ) ( not ( = ?auto_180801 ?auto_180809 ) ) ( not ( = ?auto_180802 ?auto_180809 ) ) ( not ( = ?auto_180803 ?auto_180809 ) ) ( ON ?auto_180802 ?auto_180803 ) ( ON-TABLE ?auto_180805 ) ( ON ?auto_180808 ?auto_180805 ) ( ON ?auto_180807 ?auto_180808 ) ( ON ?auto_180806 ?auto_180807 ) ( ON ?auto_180804 ?auto_180806 ) ( ON ?auto_180809 ?auto_180804 ) ( not ( = ?auto_180805 ?auto_180808 ) ) ( not ( = ?auto_180805 ?auto_180807 ) ) ( not ( = ?auto_180805 ?auto_180806 ) ) ( not ( = ?auto_180805 ?auto_180804 ) ) ( not ( = ?auto_180805 ?auto_180809 ) ) ( not ( = ?auto_180805 ?auto_180803 ) ) ( not ( = ?auto_180805 ?auto_180802 ) ) ( not ( = ?auto_180808 ?auto_180807 ) ) ( not ( = ?auto_180808 ?auto_180806 ) ) ( not ( = ?auto_180808 ?auto_180804 ) ) ( not ( = ?auto_180808 ?auto_180809 ) ) ( not ( = ?auto_180808 ?auto_180803 ) ) ( not ( = ?auto_180808 ?auto_180802 ) ) ( not ( = ?auto_180807 ?auto_180806 ) ) ( not ( = ?auto_180807 ?auto_180804 ) ) ( not ( = ?auto_180807 ?auto_180809 ) ) ( not ( = ?auto_180807 ?auto_180803 ) ) ( not ( = ?auto_180807 ?auto_180802 ) ) ( not ( = ?auto_180806 ?auto_180804 ) ) ( not ( = ?auto_180806 ?auto_180809 ) ) ( not ( = ?auto_180806 ?auto_180803 ) ) ( not ( = ?auto_180806 ?auto_180802 ) ) ( not ( = ?auto_180804 ?auto_180809 ) ) ( not ( = ?auto_180804 ?auto_180803 ) ) ( not ( = ?auto_180804 ?auto_180802 ) ) ( not ( = ?auto_180801 ?auto_180805 ) ) ( not ( = ?auto_180801 ?auto_180808 ) ) ( not ( = ?auto_180801 ?auto_180807 ) ) ( not ( = ?auto_180801 ?auto_180806 ) ) ( not ( = ?auto_180801 ?auto_180804 ) ) ( ON ?auto_180801 ?auto_180802 ) ( CLEAR ?auto_180801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_180805 ?auto_180808 ?auto_180807 ?auto_180806 ?auto_180804 ?auto_180809 ?auto_180803 ?auto_180802 )
      ( MAKE-3PILE ?auto_180801 ?auto_180802 ?auto_180803 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_180815 - BLOCK
      ?auto_180816 - BLOCK
      ?auto_180817 - BLOCK
      ?auto_180818 - BLOCK
      ?auto_180819 - BLOCK
    )
    :vars
    (
      ?auto_180820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180820 ?auto_180819 ) ( CLEAR ?auto_180820 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180815 ) ( ON ?auto_180816 ?auto_180815 ) ( ON ?auto_180817 ?auto_180816 ) ( ON ?auto_180818 ?auto_180817 ) ( ON ?auto_180819 ?auto_180818 ) ( not ( = ?auto_180815 ?auto_180816 ) ) ( not ( = ?auto_180815 ?auto_180817 ) ) ( not ( = ?auto_180815 ?auto_180818 ) ) ( not ( = ?auto_180815 ?auto_180819 ) ) ( not ( = ?auto_180815 ?auto_180820 ) ) ( not ( = ?auto_180816 ?auto_180817 ) ) ( not ( = ?auto_180816 ?auto_180818 ) ) ( not ( = ?auto_180816 ?auto_180819 ) ) ( not ( = ?auto_180816 ?auto_180820 ) ) ( not ( = ?auto_180817 ?auto_180818 ) ) ( not ( = ?auto_180817 ?auto_180819 ) ) ( not ( = ?auto_180817 ?auto_180820 ) ) ( not ( = ?auto_180818 ?auto_180819 ) ) ( not ( = ?auto_180818 ?auto_180820 ) ) ( not ( = ?auto_180819 ?auto_180820 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180820 ?auto_180819 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_180821 - BLOCK
      ?auto_180822 - BLOCK
      ?auto_180823 - BLOCK
      ?auto_180824 - BLOCK
      ?auto_180825 - BLOCK
    )
    :vars
    (
      ?auto_180826 - BLOCK
      ?auto_180827 - BLOCK
      ?auto_180828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180826 ?auto_180825 ) ( CLEAR ?auto_180826 ) ( ON-TABLE ?auto_180821 ) ( ON ?auto_180822 ?auto_180821 ) ( ON ?auto_180823 ?auto_180822 ) ( ON ?auto_180824 ?auto_180823 ) ( ON ?auto_180825 ?auto_180824 ) ( not ( = ?auto_180821 ?auto_180822 ) ) ( not ( = ?auto_180821 ?auto_180823 ) ) ( not ( = ?auto_180821 ?auto_180824 ) ) ( not ( = ?auto_180821 ?auto_180825 ) ) ( not ( = ?auto_180821 ?auto_180826 ) ) ( not ( = ?auto_180822 ?auto_180823 ) ) ( not ( = ?auto_180822 ?auto_180824 ) ) ( not ( = ?auto_180822 ?auto_180825 ) ) ( not ( = ?auto_180822 ?auto_180826 ) ) ( not ( = ?auto_180823 ?auto_180824 ) ) ( not ( = ?auto_180823 ?auto_180825 ) ) ( not ( = ?auto_180823 ?auto_180826 ) ) ( not ( = ?auto_180824 ?auto_180825 ) ) ( not ( = ?auto_180824 ?auto_180826 ) ) ( not ( = ?auto_180825 ?auto_180826 ) ) ( HOLDING ?auto_180827 ) ( CLEAR ?auto_180828 ) ( not ( = ?auto_180821 ?auto_180827 ) ) ( not ( = ?auto_180821 ?auto_180828 ) ) ( not ( = ?auto_180822 ?auto_180827 ) ) ( not ( = ?auto_180822 ?auto_180828 ) ) ( not ( = ?auto_180823 ?auto_180827 ) ) ( not ( = ?auto_180823 ?auto_180828 ) ) ( not ( = ?auto_180824 ?auto_180827 ) ) ( not ( = ?auto_180824 ?auto_180828 ) ) ( not ( = ?auto_180825 ?auto_180827 ) ) ( not ( = ?auto_180825 ?auto_180828 ) ) ( not ( = ?auto_180826 ?auto_180827 ) ) ( not ( = ?auto_180826 ?auto_180828 ) ) ( not ( = ?auto_180827 ?auto_180828 ) ) )
    :subtasks
    ( ( !STACK ?auto_180827 ?auto_180828 )
      ( MAKE-5PILE ?auto_180821 ?auto_180822 ?auto_180823 ?auto_180824 ?auto_180825 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_180829 - BLOCK
      ?auto_180830 - BLOCK
      ?auto_180831 - BLOCK
      ?auto_180832 - BLOCK
      ?auto_180833 - BLOCK
    )
    :vars
    (
      ?auto_180834 - BLOCK
      ?auto_180835 - BLOCK
      ?auto_180836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180834 ?auto_180833 ) ( ON-TABLE ?auto_180829 ) ( ON ?auto_180830 ?auto_180829 ) ( ON ?auto_180831 ?auto_180830 ) ( ON ?auto_180832 ?auto_180831 ) ( ON ?auto_180833 ?auto_180832 ) ( not ( = ?auto_180829 ?auto_180830 ) ) ( not ( = ?auto_180829 ?auto_180831 ) ) ( not ( = ?auto_180829 ?auto_180832 ) ) ( not ( = ?auto_180829 ?auto_180833 ) ) ( not ( = ?auto_180829 ?auto_180834 ) ) ( not ( = ?auto_180830 ?auto_180831 ) ) ( not ( = ?auto_180830 ?auto_180832 ) ) ( not ( = ?auto_180830 ?auto_180833 ) ) ( not ( = ?auto_180830 ?auto_180834 ) ) ( not ( = ?auto_180831 ?auto_180832 ) ) ( not ( = ?auto_180831 ?auto_180833 ) ) ( not ( = ?auto_180831 ?auto_180834 ) ) ( not ( = ?auto_180832 ?auto_180833 ) ) ( not ( = ?auto_180832 ?auto_180834 ) ) ( not ( = ?auto_180833 ?auto_180834 ) ) ( CLEAR ?auto_180835 ) ( not ( = ?auto_180829 ?auto_180836 ) ) ( not ( = ?auto_180829 ?auto_180835 ) ) ( not ( = ?auto_180830 ?auto_180836 ) ) ( not ( = ?auto_180830 ?auto_180835 ) ) ( not ( = ?auto_180831 ?auto_180836 ) ) ( not ( = ?auto_180831 ?auto_180835 ) ) ( not ( = ?auto_180832 ?auto_180836 ) ) ( not ( = ?auto_180832 ?auto_180835 ) ) ( not ( = ?auto_180833 ?auto_180836 ) ) ( not ( = ?auto_180833 ?auto_180835 ) ) ( not ( = ?auto_180834 ?auto_180836 ) ) ( not ( = ?auto_180834 ?auto_180835 ) ) ( not ( = ?auto_180836 ?auto_180835 ) ) ( ON ?auto_180836 ?auto_180834 ) ( CLEAR ?auto_180836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180829 ?auto_180830 ?auto_180831 ?auto_180832 ?auto_180833 ?auto_180834 )
      ( MAKE-5PILE ?auto_180829 ?auto_180830 ?auto_180831 ?auto_180832 ?auto_180833 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_180837 - BLOCK
      ?auto_180838 - BLOCK
      ?auto_180839 - BLOCK
      ?auto_180840 - BLOCK
      ?auto_180841 - BLOCK
    )
    :vars
    (
      ?auto_180844 - BLOCK
      ?auto_180843 - BLOCK
      ?auto_180842 - BLOCK
      ?auto_180845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180844 ?auto_180841 ) ( ON-TABLE ?auto_180837 ) ( ON ?auto_180838 ?auto_180837 ) ( ON ?auto_180839 ?auto_180838 ) ( ON ?auto_180840 ?auto_180839 ) ( ON ?auto_180841 ?auto_180840 ) ( not ( = ?auto_180837 ?auto_180838 ) ) ( not ( = ?auto_180837 ?auto_180839 ) ) ( not ( = ?auto_180837 ?auto_180840 ) ) ( not ( = ?auto_180837 ?auto_180841 ) ) ( not ( = ?auto_180837 ?auto_180844 ) ) ( not ( = ?auto_180838 ?auto_180839 ) ) ( not ( = ?auto_180838 ?auto_180840 ) ) ( not ( = ?auto_180838 ?auto_180841 ) ) ( not ( = ?auto_180838 ?auto_180844 ) ) ( not ( = ?auto_180839 ?auto_180840 ) ) ( not ( = ?auto_180839 ?auto_180841 ) ) ( not ( = ?auto_180839 ?auto_180844 ) ) ( not ( = ?auto_180840 ?auto_180841 ) ) ( not ( = ?auto_180840 ?auto_180844 ) ) ( not ( = ?auto_180841 ?auto_180844 ) ) ( not ( = ?auto_180837 ?auto_180843 ) ) ( not ( = ?auto_180837 ?auto_180842 ) ) ( not ( = ?auto_180838 ?auto_180843 ) ) ( not ( = ?auto_180838 ?auto_180842 ) ) ( not ( = ?auto_180839 ?auto_180843 ) ) ( not ( = ?auto_180839 ?auto_180842 ) ) ( not ( = ?auto_180840 ?auto_180843 ) ) ( not ( = ?auto_180840 ?auto_180842 ) ) ( not ( = ?auto_180841 ?auto_180843 ) ) ( not ( = ?auto_180841 ?auto_180842 ) ) ( not ( = ?auto_180844 ?auto_180843 ) ) ( not ( = ?auto_180844 ?auto_180842 ) ) ( not ( = ?auto_180843 ?auto_180842 ) ) ( ON ?auto_180843 ?auto_180844 ) ( CLEAR ?auto_180843 ) ( HOLDING ?auto_180842 ) ( CLEAR ?auto_180845 ) ( ON-TABLE ?auto_180845 ) ( not ( = ?auto_180845 ?auto_180842 ) ) ( not ( = ?auto_180837 ?auto_180845 ) ) ( not ( = ?auto_180838 ?auto_180845 ) ) ( not ( = ?auto_180839 ?auto_180845 ) ) ( not ( = ?auto_180840 ?auto_180845 ) ) ( not ( = ?auto_180841 ?auto_180845 ) ) ( not ( = ?auto_180844 ?auto_180845 ) ) ( not ( = ?auto_180843 ?auto_180845 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180845 ?auto_180842 )
      ( MAKE-5PILE ?auto_180837 ?auto_180838 ?auto_180839 ?auto_180840 ?auto_180841 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182365 - BLOCK
      ?auto_182366 - BLOCK
      ?auto_182367 - BLOCK
      ?auto_182368 - BLOCK
      ?auto_182369 - BLOCK
    )
    :vars
    (
      ?auto_182370 - BLOCK
      ?auto_182372 - BLOCK
      ?auto_182371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182370 ?auto_182369 ) ( ON-TABLE ?auto_182365 ) ( ON ?auto_182366 ?auto_182365 ) ( ON ?auto_182367 ?auto_182366 ) ( ON ?auto_182368 ?auto_182367 ) ( ON ?auto_182369 ?auto_182368 ) ( not ( = ?auto_182365 ?auto_182366 ) ) ( not ( = ?auto_182365 ?auto_182367 ) ) ( not ( = ?auto_182365 ?auto_182368 ) ) ( not ( = ?auto_182365 ?auto_182369 ) ) ( not ( = ?auto_182365 ?auto_182370 ) ) ( not ( = ?auto_182366 ?auto_182367 ) ) ( not ( = ?auto_182366 ?auto_182368 ) ) ( not ( = ?auto_182366 ?auto_182369 ) ) ( not ( = ?auto_182366 ?auto_182370 ) ) ( not ( = ?auto_182367 ?auto_182368 ) ) ( not ( = ?auto_182367 ?auto_182369 ) ) ( not ( = ?auto_182367 ?auto_182370 ) ) ( not ( = ?auto_182368 ?auto_182369 ) ) ( not ( = ?auto_182368 ?auto_182370 ) ) ( not ( = ?auto_182369 ?auto_182370 ) ) ( not ( = ?auto_182365 ?auto_182372 ) ) ( not ( = ?auto_182365 ?auto_182371 ) ) ( not ( = ?auto_182366 ?auto_182372 ) ) ( not ( = ?auto_182366 ?auto_182371 ) ) ( not ( = ?auto_182367 ?auto_182372 ) ) ( not ( = ?auto_182367 ?auto_182371 ) ) ( not ( = ?auto_182368 ?auto_182372 ) ) ( not ( = ?auto_182368 ?auto_182371 ) ) ( not ( = ?auto_182369 ?auto_182372 ) ) ( not ( = ?auto_182369 ?auto_182371 ) ) ( not ( = ?auto_182370 ?auto_182372 ) ) ( not ( = ?auto_182370 ?auto_182371 ) ) ( not ( = ?auto_182372 ?auto_182371 ) ) ( ON ?auto_182372 ?auto_182370 ) ( ON ?auto_182371 ?auto_182372 ) ( CLEAR ?auto_182371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182365 ?auto_182366 ?auto_182367 ?auto_182368 ?auto_182369 ?auto_182370 ?auto_182372 )
      ( MAKE-5PILE ?auto_182365 ?auto_182366 ?auto_182367 ?auto_182368 ?auto_182369 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_180855 - BLOCK
      ?auto_180856 - BLOCK
      ?auto_180857 - BLOCK
      ?auto_180858 - BLOCK
      ?auto_180859 - BLOCK
    )
    :vars
    (
      ?auto_180860 - BLOCK
      ?auto_180861 - BLOCK
      ?auto_180863 - BLOCK
      ?auto_180862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180860 ?auto_180859 ) ( ON-TABLE ?auto_180855 ) ( ON ?auto_180856 ?auto_180855 ) ( ON ?auto_180857 ?auto_180856 ) ( ON ?auto_180858 ?auto_180857 ) ( ON ?auto_180859 ?auto_180858 ) ( not ( = ?auto_180855 ?auto_180856 ) ) ( not ( = ?auto_180855 ?auto_180857 ) ) ( not ( = ?auto_180855 ?auto_180858 ) ) ( not ( = ?auto_180855 ?auto_180859 ) ) ( not ( = ?auto_180855 ?auto_180860 ) ) ( not ( = ?auto_180856 ?auto_180857 ) ) ( not ( = ?auto_180856 ?auto_180858 ) ) ( not ( = ?auto_180856 ?auto_180859 ) ) ( not ( = ?auto_180856 ?auto_180860 ) ) ( not ( = ?auto_180857 ?auto_180858 ) ) ( not ( = ?auto_180857 ?auto_180859 ) ) ( not ( = ?auto_180857 ?auto_180860 ) ) ( not ( = ?auto_180858 ?auto_180859 ) ) ( not ( = ?auto_180858 ?auto_180860 ) ) ( not ( = ?auto_180859 ?auto_180860 ) ) ( not ( = ?auto_180855 ?auto_180861 ) ) ( not ( = ?auto_180855 ?auto_180863 ) ) ( not ( = ?auto_180856 ?auto_180861 ) ) ( not ( = ?auto_180856 ?auto_180863 ) ) ( not ( = ?auto_180857 ?auto_180861 ) ) ( not ( = ?auto_180857 ?auto_180863 ) ) ( not ( = ?auto_180858 ?auto_180861 ) ) ( not ( = ?auto_180858 ?auto_180863 ) ) ( not ( = ?auto_180859 ?auto_180861 ) ) ( not ( = ?auto_180859 ?auto_180863 ) ) ( not ( = ?auto_180860 ?auto_180861 ) ) ( not ( = ?auto_180860 ?auto_180863 ) ) ( not ( = ?auto_180861 ?auto_180863 ) ) ( ON ?auto_180861 ?auto_180860 ) ( not ( = ?auto_180862 ?auto_180863 ) ) ( not ( = ?auto_180855 ?auto_180862 ) ) ( not ( = ?auto_180856 ?auto_180862 ) ) ( not ( = ?auto_180857 ?auto_180862 ) ) ( not ( = ?auto_180858 ?auto_180862 ) ) ( not ( = ?auto_180859 ?auto_180862 ) ) ( not ( = ?auto_180860 ?auto_180862 ) ) ( not ( = ?auto_180861 ?auto_180862 ) ) ( ON ?auto_180863 ?auto_180861 ) ( CLEAR ?auto_180863 ) ( HOLDING ?auto_180862 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180862 )
      ( MAKE-5PILE ?auto_180855 ?auto_180856 ?auto_180857 ?auto_180858 ?auto_180859 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_180864 - BLOCK
      ?auto_180865 - BLOCK
      ?auto_180866 - BLOCK
      ?auto_180867 - BLOCK
      ?auto_180868 - BLOCK
    )
    :vars
    (
      ?auto_180871 - BLOCK
      ?auto_180870 - BLOCK
      ?auto_180872 - BLOCK
      ?auto_180869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180871 ?auto_180868 ) ( ON-TABLE ?auto_180864 ) ( ON ?auto_180865 ?auto_180864 ) ( ON ?auto_180866 ?auto_180865 ) ( ON ?auto_180867 ?auto_180866 ) ( ON ?auto_180868 ?auto_180867 ) ( not ( = ?auto_180864 ?auto_180865 ) ) ( not ( = ?auto_180864 ?auto_180866 ) ) ( not ( = ?auto_180864 ?auto_180867 ) ) ( not ( = ?auto_180864 ?auto_180868 ) ) ( not ( = ?auto_180864 ?auto_180871 ) ) ( not ( = ?auto_180865 ?auto_180866 ) ) ( not ( = ?auto_180865 ?auto_180867 ) ) ( not ( = ?auto_180865 ?auto_180868 ) ) ( not ( = ?auto_180865 ?auto_180871 ) ) ( not ( = ?auto_180866 ?auto_180867 ) ) ( not ( = ?auto_180866 ?auto_180868 ) ) ( not ( = ?auto_180866 ?auto_180871 ) ) ( not ( = ?auto_180867 ?auto_180868 ) ) ( not ( = ?auto_180867 ?auto_180871 ) ) ( not ( = ?auto_180868 ?auto_180871 ) ) ( not ( = ?auto_180864 ?auto_180870 ) ) ( not ( = ?auto_180864 ?auto_180872 ) ) ( not ( = ?auto_180865 ?auto_180870 ) ) ( not ( = ?auto_180865 ?auto_180872 ) ) ( not ( = ?auto_180866 ?auto_180870 ) ) ( not ( = ?auto_180866 ?auto_180872 ) ) ( not ( = ?auto_180867 ?auto_180870 ) ) ( not ( = ?auto_180867 ?auto_180872 ) ) ( not ( = ?auto_180868 ?auto_180870 ) ) ( not ( = ?auto_180868 ?auto_180872 ) ) ( not ( = ?auto_180871 ?auto_180870 ) ) ( not ( = ?auto_180871 ?auto_180872 ) ) ( not ( = ?auto_180870 ?auto_180872 ) ) ( ON ?auto_180870 ?auto_180871 ) ( not ( = ?auto_180869 ?auto_180872 ) ) ( not ( = ?auto_180864 ?auto_180869 ) ) ( not ( = ?auto_180865 ?auto_180869 ) ) ( not ( = ?auto_180866 ?auto_180869 ) ) ( not ( = ?auto_180867 ?auto_180869 ) ) ( not ( = ?auto_180868 ?auto_180869 ) ) ( not ( = ?auto_180871 ?auto_180869 ) ) ( not ( = ?auto_180870 ?auto_180869 ) ) ( ON ?auto_180872 ?auto_180870 ) ( ON ?auto_180869 ?auto_180872 ) ( CLEAR ?auto_180869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_180864 ?auto_180865 ?auto_180866 ?auto_180867 ?auto_180868 ?auto_180871 ?auto_180870 ?auto_180872 )
      ( MAKE-5PILE ?auto_180864 ?auto_180865 ?auto_180866 ?auto_180867 ?auto_180868 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_180877 - BLOCK
      ?auto_180878 - BLOCK
      ?auto_180879 - BLOCK
      ?auto_180880 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_180880 ) ( CLEAR ?auto_180879 ) ( ON-TABLE ?auto_180877 ) ( ON ?auto_180878 ?auto_180877 ) ( ON ?auto_180879 ?auto_180878 ) ( not ( = ?auto_180877 ?auto_180878 ) ) ( not ( = ?auto_180877 ?auto_180879 ) ) ( not ( = ?auto_180877 ?auto_180880 ) ) ( not ( = ?auto_180878 ?auto_180879 ) ) ( not ( = ?auto_180878 ?auto_180880 ) ) ( not ( = ?auto_180879 ?auto_180880 ) ) )
    :subtasks
    ( ( !STACK ?auto_180880 ?auto_180879 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_180881 - BLOCK
      ?auto_180882 - BLOCK
      ?auto_180883 - BLOCK
      ?auto_180884 - BLOCK
    )
    :vars
    (
      ?auto_180885 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_180883 ) ( ON-TABLE ?auto_180881 ) ( ON ?auto_180882 ?auto_180881 ) ( ON ?auto_180883 ?auto_180882 ) ( not ( = ?auto_180881 ?auto_180882 ) ) ( not ( = ?auto_180881 ?auto_180883 ) ) ( not ( = ?auto_180881 ?auto_180884 ) ) ( not ( = ?auto_180882 ?auto_180883 ) ) ( not ( = ?auto_180882 ?auto_180884 ) ) ( not ( = ?auto_180883 ?auto_180884 ) ) ( ON ?auto_180884 ?auto_180885 ) ( CLEAR ?auto_180884 ) ( HAND-EMPTY ) ( not ( = ?auto_180881 ?auto_180885 ) ) ( not ( = ?auto_180882 ?auto_180885 ) ) ( not ( = ?auto_180883 ?auto_180885 ) ) ( not ( = ?auto_180884 ?auto_180885 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180884 ?auto_180885 )
      ( MAKE-4PILE ?auto_180881 ?auto_180882 ?auto_180883 ?auto_180884 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_180886 - BLOCK
      ?auto_180887 - BLOCK
      ?auto_180888 - BLOCK
      ?auto_180889 - BLOCK
    )
    :vars
    (
      ?auto_180890 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180886 ) ( ON ?auto_180887 ?auto_180886 ) ( not ( = ?auto_180886 ?auto_180887 ) ) ( not ( = ?auto_180886 ?auto_180888 ) ) ( not ( = ?auto_180886 ?auto_180889 ) ) ( not ( = ?auto_180887 ?auto_180888 ) ) ( not ( = ?auto_180887 ?auto_180889 ) ) ( not ( = ?auto_180888 ?auto_180889 ) ) ( ON ?auto_180889 ?auto_180890 ) ( CLEAR ?auto_180889 ) ( not ( = ?auto_180886 ?auto_180890 ) ) ( not ( = ?auto_180887 ?auto_180890 ) ) ( not ( = ?auto_180888 ?auto_180890 ) ) ( not ( = ?auto_180889 ?auto_180890 ) ) ( HOLDING ?auto_180888 ) ( CLEAR ?auto_180887 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180886 ?auto_180887 ?auto_180888 )
      ( MAKE-4PILE ?auto_180886 ?auto_180887 ?auto_180888 ?auto_180889 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_180891 - BLOCK
      ?auto_180892 - BLOCK
      ?auto_180893 - BLOCK
      ?auto_180894 - BLOCK
    )
    :vars
    (
      ?auto_180895 - BLOCK
      ?auto_180898 - BLOCK
      ?auto_180899 - BLOCK
      ?auto_180896 - BLOCK
      ?auto_180897 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180891 ) ( ON ?auto_180892 ?auto_180891 ) ( not ( = ?auto_180891 ?auto_180892 ) ) ( not ( = ?auto_180891 ?auto_180893 ) ) ( not ( = ?auto_180891 ?auto_180894 ) ) ( not ( = ?auto_180892 ?auto_180893 ) ) ( not ( = ?auto_180892 ?auto_180894 ) ) ( not ( = ?auto_180893 ?auto_180894 ) ) ( ON ?auto_180894 ?auto_180895 ) ( not ( = ?auto_180891 ?auto_180895 ) ) ( not ( = ?auto_180892 ?auto_180895 ) ) ( not ( = ?auto_180893 ?auto_180895 ) ) ( not ( = ?auto_180894 ?auto_180895 ) ) ( CLEAR ?auto_180892 ) ( ON ?auto_180893 ?auto_180894 ) ( CLEAR ?auto_180893 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180898 ) ( ON ?auto_180899 ?auto_180898 ) ( ON ?auto_180896 ?auto_180899 ) ( ON ?auto_180897 ?auto_180896 ) ( ON ?auto_180895 ?auto_180897 ) ( not ( = ?auto_180898 ?auto_180899 ) ) ( not ( = ?auto_180898 ?auto_180896 ) ) ( not ( = ?auto_180898 ?auto_180897 ) ) ( not ( = ?auto_180898 ?auto_180895 ) ) ( not ( = ?auto_180898 ?auto_180894 ) ) ( not ( = ?auto_180898 ?auto_180893 ) ) ( not ( = ?auto_180899 ?auto_180896 ) ) ( not ( = ?auto_180899 ?auto_180897 ) ) ( not ( = ?auto_180899 ?auto_180895 ) ) ( not ( = ?auto_180899 ?auto_180894 ) ) ( not ( = ?auto_180899 ?auto_180893 ) ) ( not ( = ?auto_180896 ?auto_180897 ) ) ( not ( = ?auto_180896 ?auto_180895 ) ) ( not ( = ?auto_180896 ?auto_180894 ) ) ( not ( = ?auto_180896 ?auto_180893 ) ) ( not ( = ?auto_180897 ?auto_180895 ) ) ( not ( = ?auto_180897 ?auto_180894 ) ) ( not ( = ?auto_180897 ?auto_180893 ) ) ( not ( = ?auto_180891 ?auto_180898 ) ) ( not ( = ?auto_180891 ?auto_180899 ) ) ( not ( = ?auto_180891 ?auto_180896 ) ) ( not ( = ?auto_180891 ?auto_180897 ) ) ( not ( = ?auto_180892 ?auto_180898 ) ) ( not ( = ?auto_180892 ?auto_180899 ) ) ( not ( = ?auto_180892 ?auto_180896 ) ) ( not ( = ?auto_180892 ?auto_180897 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180898 ?auto_180899 ?auto_180896 ?auto_180897 ?auto_180895 ?auto_180894 )
      ( MAKE-4PILE ?auto_180891 ?auto_180892 ?auto_180893 ?auto_180894 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_180900 - BLOCK
      ?auto_180901 - BLOCK
      ?auto_180902 - BLOCK
      ?auto_180903 - BLOCK
    )
    :vars
    (
      ?auto_180907 - BLOCK
      ?auto_180905 - BLOCK
      ?auto_180904 - BLOCK
      ?auto_180906 - BLOCK
      ?auto_180908 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180900 ) ( not ( = ?auto_180900 ?auto_180901 ) ) ( not ( = ?auto_180900 ?auto_180902 ) ) ( not ( = ?auto_180900 ?auto_180903 ) ) ( not ( = ?auto_180901 ?auto_180902 ) ) ( not ( = ?auto_180901 ?auto_180903 ) ) ( not ( = ?auto_180902 ?auto_180903 ) ) ( ON ?auto_180903 ?auto_180907 ) ( not ( = ?auto_180900 ?auto_180907 ) ) ( not ( = ?auto_180901 ?auto_180907 ) ) ( not ( = ?auto_180902 ?auto_180907 ) ) ( not ( = ?auto_180903 ?auto_180907 ) ) ( ON ?auto_180902 ?auto_180903 ) ( CLEAR ?auto_180902 ) ( ON-TABLE ?auto_180905 ) ( ON ?auto_180904 ?auto_180905 ) ( ON ?auto_180906 ?auto_180904 ) ( ON ?auto_180908 ?auto_180906 ) ( ON ?auto_180907 ?auto_180908 ) ( not ( = ?auto_180905 ?auto_180904 ) ) ( not ( = ?auto_180905 ?auto_180906 ) ) ( not ( = ?auto_180905 ?auto_180908 ) ) ( not ( = ?auto_180905 ?auto_180907 ) ) ( not ( = ?auto_180905 ?auto_180903 ) ) ( not ( = ?auto_180905 ?auto_180902 ) ) ( not ( = ?auto_180904 ?auto_180906 ) ) ( not ( = ?auto_180904 ?auto_180908 ) ) ( not ( = ?auto_180904 ?auto_180907 ) ) ( not ( = ?auto_180904 ?auto_180903 ) ) ( not ( = ?auto_180904 ?auto_180902 ) ) ( not ( = ?auto_180906 ?auto_180908 ) ) ( not ( = ?auto_180906 ?auto_180907 ) ) ( not ( = ?auto_180906 ?auto_180903 ) ) ( not ( = ?auto_180906 ?auto_180902 ) ) ( not ( = ?auto_180908 ?auto_180907 ) ) ( not ( = ?auto_180908 ?auto_180903 ) ) ( not ( = ?auto_180908 ?auto_180902 ) ) ( not ( = ?auto_180900 ?auto_180905 ) ) ( not ( = ?auto_180900 ?auto_180904 ) ) ( not ( = ?auto_180900 ?auto_180906 ) ) ( not ( = ?auto_180900 ?auto_180908 ) ) ( not ( = ?auto_180901 ?auto_180905 ) ) ( not ( = ?auto_180901 ?auto_180904 ) ) ( not ( = ?auto_180901 ?auto_180906 ) ) ( not ( = ?auto_180901 ?auto_180908 ) ) ( HOLDING ?auto_180901 ) ( CLEAR ?auto_180900 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180900 ?auto_180901 )
      ( MAKE-4PILE ?auto_180900 ?auto_180901 ?auto_180902 ?auto_180903 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_180909 - BLOCK
      ?auto_180910 - BLOCK
      ?auto_180911 - BLOCK
      ?auto_180912 - BLOCK
    )
    :vars
    (
      ?auto_180916 - BLOCK
      ?auto_180917 - BLOCK
      ?auto_180913 - BLOCK
      ?auto_180915 - BLOCK
      ?auto_180914 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180909 ) ( not ( = ?auto_180909 ?auto_180910 ) ) ( not ( = ?auto_180909 ?auto_180911 ) ) ( not ( = ?auto_180909 ?auto_180912 ) ) ( not ( = ?auto_180910 ?auto_180911 ) ) ( not ( = ?auto_180910 ?auto_180912 ) ) ( not ( = ?auto_180911 ?auto_180912 ) ) ( ON ?auto_180912 ?auto_180916 ) ( not ( = ?auto_180909 ?auto_180916 ) ) ( not ( = ?auto_180910 ?auto_180916 ) ) ( not ( = ?auto_180911 ?auto_180916 ) ) ( not ( = ?auto_180912 ?auto_180916 ) ) ( ON ?auto_180911 ?auto_180912 ) ( ON-TABLE ?auto_180917 ) ( ON ?auto_180913 ?auto_180917 ) ( ON ?auto_180915 ?auto_180913 ) ( ON ?auto_180914 ?auto_180915 ) ( ON ?auto_180916 ?auto_180914 ) ( not ( = ?auto_180917 ?auto_180913 ) ) ( not ( = ?auto_180917 ?auto_180915 ) ) ( not ( = ?auto_180917 ?auto_180914 ) ) ( not ( = ?auto_180917 ?auto_180916 ) ) ( not ( = ?auto_180917 ?auto_180912 ) ) ( not ( = ?auto_180917 ?auto_180911 ) ) ( not ( = ?auto_180913 ?auto_180915 ) ) ( not ( = ?auto_180913 ?auto_180914 ) ) ( not ( = ?auto_180913 ?auto_180916 ) ) ( not ( = ?auto_180913 ?auto_180912 ) ) ( not ( = ?auto_180913 ?auto_180911 ) ) ( not ( = ?auto_180915 ?auto_180914 ) ) ( not ( = ?auto_180915 ?auto_180916 ) ) ( not ( = ?auto_180915 ?auto_180912 ) ) ( not ( = ?auto_180915 ?auto_180911 ) ) ( not ( = ?auto_180914 ?auto_180916 ) ) ( not ( = ?auto_180914 ?auto_180912 ) ) ( not ( = ?auto_180914 ?auto_180911 ) ) ( not ( = ?auto_180909 ?auto_180917 ) ) ( not ( = ?auto_180909 ?auto_180913 ) ) ( not ( = ?auto_180909 ?auto_180915 ) ) ( not ( = ?auto_180909 ?auto_180914 ) ) ( not ( = ?auto_180910 ?auto_180917 ) ) ( not ( = ?auto_180910 ?auto_180913 ) ) ( not ( = ?auto_180910 ?auto_180915 ) ) ( not ( = ?auto_180910 ?auto_180914 ) ) ( CLEAR ?auto_180909 ) ( ON ?auto_180910 ?auto_180911 ) ( CLEAR ?auto_180910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180917 ?auto_180913 ?auto_180915 ?auto_180914 ?auto_180916 ?auto_180912 ?auto_180911 )
      ( MAKE-4PILE ?auto_180909 ?auto_180910 ?auto_180911 ?auto_180912 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_180918 - BLOCK
      ?auto_180919 - BLOCK
      ?auto_180920 - BLOCK
      ?auto_180921 - BLOCK
    )
    :vars
    (
      ?auto_180924 - BLOCK
      ?auto_180925 - BLOCK
      ?auto_180922 - BLOCK
      ?auto_180923 - BLOCK
      ?auto_180926 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180918 ?auto_180919 ) ) ( not ( = ?auto_180918 ?auto_180920 ) ) ( not ( = ?auto_180918 ?auto_180921 ) ) ( not ( = ?auto_180919 ?auto_180920 ) ) ( not ( = ?auto_180919 ?auto_180921 ) ) ( not ( = ?auto_180920 ?auto_180921 ) ) ( ON ?auto_180921 ?auto_180924 ) ( not ( = ?auto_180918 ?auto_180924 ) ) ( not ( = ?auto_180919 ?auto_180924 ) ) ( not ( = ?auto_180920 ?auto_180924 ) ) ( not ( = ?auto_180921 ?auto_180924 ) ) ( ON ?auto_180920 ?auto_180921 ) ( ON-TABLE ?auto_180925 ) ( ON ?auto_180922 ?auto_180925 ) ( ON ?auto_180923 ?auto_180922 ) ( ON ?auto_180926 ?auto_180923 ) ( ON ?auto_180924 ?auto_180926 ) ( not ( = ?auto_180925 ?auto_180922 ) ) ( not ( = ?auto_180925 ?auto_180923 ) ) ( not ( = ?auto_180925 ?auto_180926 ) ) ( not ( = ?auto_180925 ?auto_180924 ) ) ( not ( = ?auto_180925 ?auto_180921 ) ) ( not ( = ?auto_180925 ?auto_180920 ) ) ( not ( = ?auto_180922 ?auto_180923 ) ) ( not ( = ?auto_180922 ?auto_180926 ) ) ( not ( = ?auto_180922 ?auto_180924 ) ) ( not ( = ?auto_180922 ?auto_180921 ) ) ( not ( = ?auto_180922 ?auto_180920 ) ) ( not ( = ?auto_180923 ?auto_180926 ) ) ( not ( = ?auto_180923 ?auto_180924 ) ) ( not ( = ?auto_180923 ?auto_180921 ) ) ( not ( = ?auto_180923 ?auto_180920 ) ) ( not ( = ?auto_180926 ?auto_180924 ) ) ( not ( = ?auto_180926 ?auto_180921 ) ) ( not ( = ?auto_180926 ?auto_180920 ) ) ( not ( = ?auto_180918 ?auto_180925 ) ) ( not ( = ?auto_180918 ?auto_180922 ) ) ( not ( = ?auto_180918 ?auto_180923 ) ) ( not ( = ?auto_180918 ?auto_180926 ) ) ( not ( = ?auto_180919 ?auto_180925 ) ) ( not ( = ?auto_180919 ?auto_180922 ) ) ( not ( = ?auto_180919 ?auto_180923 ) ) ( not ( = ?auto_180919 ?auto_180926 ) ) ( ON ?auto_180919 ?auto_180920 ) ( CLEAR ?auto_180919 ) ( HOLDING ?auto_180918 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180918 )
      ( MAKE-4PILE ?auto_180918 ?auto_180919 ?auto_180920 ?auto_180921 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_180927 - BLOCK
      ?auto_180928 - BLOCK
      ?auto_180929 - BLOCK
      ?auto_180930 - BLOCK
    )
    :vars
    (
      ?auto_180935 - BLOCK
      ?auto_180933 - BLOCK
      ?auto_180931 - BLOCK
      ?auto_180934 - BLOCK
      ?auto_180932 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180927 ?auto_180928 ) ) ( not ( = ?auto_180927 ?auto_180929 ) ) ( not ( = ?auto_180927 ?auto_180930 ) ) ( not ( = ?auto_180928 ?auto_180929 ) ) ( not ( = ?auto_180928 ?auto_180930 ) ) ( not ( = ?auto_180929 ?auto_180930 ) ) ( ON ?auto_180930 ?auto_180935 ) ( not ( = ?auto_180927 ?auto_180935 ) ) ( not ( = ?auto_180928 ?auto_180935 ) ) ( not ( = ?auto_180929 ?auto_180935 ) ) ( not ( = ?auto_180930 ?auto_180935 ) ) ( ON ?auto_180929 ?auto_180930 ) ( ON-TABLE ?auto_180933 ) ( ON ?auto_180931 ?auto_180933 ) ( ON ?auto_180934 ?auto_180931 ) ( ON ?auto_180932 ?auto_180934 ) ( ON ?auto_180935 ?auto_180932 ) ( not ( = ?auto_180933 ?auto_180931 ) ) ( not ( = ?auto_180933 ?auto_180934 ) ) ( not ( = ?auto_180933 ?auto_180932 ) ) ( not ( = ?auto_180933 ?auto_180935 ) ) ( not ( = ?auto_180933 ?auto_180930 ) ) ( not ( = ?auto_180933 ?auto_180929 ) ) ( not ( = ?auto_180931 ?auto_180934 ) ) ( not ( = ?auto_180931 ?auto_180932 ) ) ( not ( = ?auto_180931 ?auto_180935 ) ) ( not ( = ?auto_180931 ?auto_180930 ) ) ( not ( = ?auto_180931 ?auto_180929 ) ) ( not ( = ?auto_180934 ?auto_180932 ) ) ( not ( = ?auto_180934 ?auto_180935 ) ) ( not ( = ?auto_180934 ?auto_180930 ) ) ( not ( = ?auto_180934 ?auto_180929 ) ) ( not ( = ?auto_180932 ?auto_180935 ) ) ( not ( = ?auto_180932 ?auto_180930 ) ) ( not ( = ?auto_180932 ?auto_180929 ) ) ( not ( = ?auto_180927 ?auto_180933 ) ) ( not ( = ?auto_180927 ?auto_180931 ) ) ( not ( = ?auto_180927 ?auto_180934 ) ) ( not ( = ?auto_180927 ?auto_180932 ) ) ( not ( = ?auto_180928 ?auto_180933 ) ) ( not ( = ?auto_180928 ?auto_180931 ) ) ( not ( = ?auto_180928 ?auto_180934 ) ) ( not ( = ?auto_180928 ?auto_180932 ) ) ( ON ?auto_180928 ?auto_180929 ) ( ON ?auto_180927 ?auto_180928 ) ( CLEAR ?auto_180927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_180933 ?auto_180931 ?auto_180934 ?auto_180932 ?auto_180935 ?auto_180930 ?auto_180929 ?auto_180928 )
      ( MAKE-4PILE ?auto_180927 ?auto_180928 ?auto_180929 ?auto_180930 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_180940 - BLOCK
      ?auto_180941 - BLOCK
      ?auto_180942 - BLOCK
      ?auto_180943 - BLOCK
    )
    :vars
    (
      ?auto_180944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180944 ?auto_180943 ) ( CLEAR ?auto_180944 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180940 ) ( ON ?auto_180941 ?auto_180940 ) ( ON ?auto_180942 ?auto_180941 ) ( ON ?auto_180943 ?auto_180942 ) ( not ( = ?auto_180940 ?auto_180941 ) ) ( not ( = ?auto_180940 ?auto_180942 ) ) ( not ( = ?auto_180940 ?auto_180943 ) ) ( not ( = ?auto_180940 ?auto_180944 ) ) ( not ( = ?auto_180941 ?auto_180942 ) ) ( not ( = ?auto_180941 ?auto_180943 ) ) ( not ( = ?auto_180941 ?auto_180944 ) ) ( not ( = ?auto_180942 ?auto_180943 ) ) ( not ( = ?auto_180942 ?auto_180944 ) ) ( not ( = ?auto_180943 ?auto_180944 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180944 ?auto_180943 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_180945 - BLOCK
      ?auto_180946 - BLOCK
      ?auto_180947 - BLOCK
      ?auto_180948 - BLOCK
    )
    :vars
    (
      ?auto_180949 - BLOCK
      ?auto_180950 - BLOCK
      ?auto_180951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180949 ?auto_180948 ) ( CLEAR ?auto_180949 ) ( ON-TABLE ?auto_180945 ) ( ON ?auto_180946 ?auto_180945 ) ( ON ?auto_180947 ?auto_180946 ) ( ON ?auto_180948 ?auto_180947 ) ( not ( = ?auto_180945 ?auto_180946 ) ) ( not ( = ?auto_180945 ?auto_180947 ) ) ( not ( = ?auto_180945 ?auto_180948 ) ) ( not ( = ?auto_180945 ?auto_180949 ) ) ( not ( = ?auto_180946 ?auto_180947 ) ) ( not ( = ?auto_180946 ?auto_180948 ) ) ( not ( = ?auto_180946 ?auto_180949 ) ) ( not ( = ?auto_180947 ?auto_180948 ) ) ( not ( = ?auto_180947 ?auto_180949 ) ) ( not ( = ?auto_180948 ?auto_180949 ) ) ( HOLDING ?auto_180950 ) ( CLEAR ?auto_180951 ) ( not ( = ?auto_180945 ?auto_180950 ) ) ( not ( = ?auto_180945 ?auto_180951 ) ) ( not ( = ?auto_180946 ?auto_180950 ) ) ( not ( = ?auto_180946 ?auto_180951 ) ) ( not ( = ?auto_180947 ?auto_180950 ) ) ( not ( = ?auto_180947 ?auto_180951 ) ) ( not ( = ?auto_180948 ?auto_180950 ) ) ( not ( = ?auto_180948 ?auto_180951 ) ) ( not ( = ?auto_180949 ?auto_180950 ) ) ( not ( = ?auto_180949 ?auto_180951 ) ) ( not ( = ?auto_180950 ?auto_180951 ) ) )
    :subtasks
    ( ( !STACK ?auto_180950 ?auto_180951 )
      ( MAKE-4PILE ?auto_180945 ?auto_180946 ?auto_180947 ?auto_180948 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_180952 - BLOCK
      ?auto_180953 - BLOCK
      ?auto_180954 - BLOCK
      ?auto_180955 - BLOCK
    )
    :vars
    (
      ?auto_180957 - BLOCK
      ?auto_180958 - BLOCK
      ?auto_180956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180957 ?auto_180955 ) ( ON-TABLE ?auto_180952 ) ( ON ?auto_180953 ?auto_180952 ) ( ON ?auto_180954 ?auto_180953 ) ( ON ?auto_180955 ?auto_180954 ) ( not ( = ?auto_180952 ?auto_180953 ) ) ( not ( = ?auto_180952 ?auto_180954 ) ) ( not ( = ?auto_180952 ?auto_180955 ) ) ( not ( = ?auto_180952 ?auto_180957 ) ) ( not ( = ?auto_180953 ?auto_180954 ) ) ( not ( = ?auto_180953 ?auto_180955 ) ) ( not ( = ?auto_180953 ?auto_180957 ) ) ( not ( = ?auto_180954 ?auto_180955 ) ) ( not ( = ?auto_180954 ?auto_180957 ) ) ( not ( = ?auto_180955 ?auto_180957 ) ) ( CLEAR ?auto_180958 ) ( not ( = ?auto_180952 ?auto_180956 ) ) ( not ( = ?auto_180952 ?auto_180958 ) ) ( not ( = ?auto_180953 ?auto_180956 ) ) ( not ( = ?auto_180953 ?auto_180958 ) ) ( not ( = ?auto_180954 ?auto_180956 ) ) ( not ( = ?auto_180954 ?auto_180958 ) ) ( not ( = ?auto_180955 ?auto_180956 ) ) ( not ( = ?auto_180955 ?auto_180958 ) ) ( not ( = ?auto_180957 ?auto_180956 ) ) ( not ( = ?auto_180957 ?auto_180958 ) ) ( not ( = ?auto_180956 ?auto_180958 ) ) ( ON ?auto_180956 ?auto_180957 ) ( CLEAR ?auto_180956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180952 ?auto_180953 ?auto_180954 ?auto_180955 ?auto_180957 )
      ( MAKE-4PILE ?auto_180952 ?auto_180953 ?auto_180954 ?auto_180955 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_180959 - BLOCK
      ?auto_180960 - BLOCK
      ?auto_180961 - BLOCK
      ?auto_180962 - BLOCK
    )
    :vars
    (
      ?auto_180965 - BLOCK
      ?auto_180963 - BLOCK
      ?auto_180964 - BLOCK
      ?auto_180966 - BLOCK
      ?auto_180967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180965 ?auto_180962 ) ( ON-TABLE ?auto_180959 ) ( ON ?auto_180960 ?auto_180959 ) ( ON ?auto_180961 ?auto_180960 ) ( ON ?auto_180962 ?auto_180961 ) ( not ( = ?auto_180959 ?auto_180960 ) ) ( not ( = ?auto_180959 ?auto_180961 ) ) ( not ( = ?auto_180959 ?auto_180962 ) ) ( not ( = ?auto_180959 ?auto_180965 ) ) ( not ( = ?auto_180960 ?auto_180961 ) ) ( not ( = ?auto_180960 ?auto_180962 ) ) ( not ( = ?auto_180960 ?auto_180965 ) ) ( not ( = ?auto_180961 ?auto_180962 ) ) ( not ( = ?auto_180961 ?auto_180965 ) ) ( not ( = ?auto_180962 ?auto_180965 ) ) ( not ( = ?auto_180959 ?auto_180963 ) ) ( not ( = ?auto_180959 ?auto_180964 ) ) ( not ( = ?auto_180960 ?auto_180963 ) ) ( not ( = ?auto_180960 ?auto_180964 ) ) ( not ( = ?auto_180961 ?auto_180963 ) ) ( not ( = ?auto_180961 ?auto_180964 ) ) ( not ( = ?auto_180962 ?auto_180963 ) ) ( not ( = ?auto_180962 ?auto_180964 ) ) ( not ( = ?auto_180965 ?auto_180963 ) ) ( not ( = ?auto_180965 ?auto_180964 ) ) ( not ( = ?auto_180963 ?auto_180964 ) ) ( ON ?auto_180963 ?auto_180965 ) ( CLEAR ?auto_180963 ) ( HOLDING ?auto_180964 ) ( CLEAR ?auto_180966 ) ( ON-TABLE ?auto_180967 ) ( ON ?auto_180966 ?auto_180967 ) ( not ( = ?auto_180967 ?auto_180966 ) ) ( not ( = ?auto_180967 ?auto_180964 ) ) ( not ( = ?auto_180966 ?auto_180964 ) ) ( not ( = ?auto_180959 ?auto_180966 ) ) ( not ( = ?auto_180959 ?auto_180967 ) ) ( not ( = ?auto_180960 ?auto_180966 ) ) ( not ( = ?auto_180960 ?auto_180967 ) ) ( not ( = ?auto_180961 ?auto_180966 ) ) ( not ( = ?auto_180961 ?auto_180967 ) ) ( not ( = ?auto_180962 ?auto_180966 ) ) ( not ( = ?auto_180962 ?auto_180967 ) ) ( not ( = ?auto_180965 ?auto_180966 ) ) ( not ( = ?auto_180965 ?auto_180967 ) ) ( not ( = ?auto_180963 ?auto_180966 ) ) ( not ( = ?auto_180963 ?auto_180967 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180967 ?auto_180966 ?auto_180964 )
      ( MAKE-4PILE ?auto_180959 ?auto_180960 ?auto_180961 ?auto_180962 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_180968 - BLOCK
      ?auto_180969 - BLOCK
      ?auto_180970 - BLOCK
      ?auto_180971 - BLOCK
    )
    :vars
    (
      ?auto_180972 - BLOCK
      ?auto_180973 - BLOCK
      ?auto_180974 - BLOCK
      ?auto_180975 - BLOCK
      ?auto_180976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180972 ?auto_180971 ) ( ON-TABLE ?auto_180968 ) ( ON ?auto_180969 ?auto_180968 ) ( ON ?auto_180970 ?auto_180969 ) ( ON ?auto_180971 ?auto_180970 ) ( not ( = ?auto_180968 ?auto_180969 ) ) ( not ( = ?auto_180968 ?auto_180970 ) ) ( not ( = ?auto_180968 ?auto_180971 ) ) ( not ( = ?auto_180968 ?auto_180972 ) ) ( not ( = ?auto_180969 ?auto_180970 ) ) ( not ( = ?auto_180969 ?auto_180971 ) ) ( not ( = ?auto_180969 ?auto_180972 ) ) ( not ( = ?auto_180970 ?auto_180971 ) ) ( not ( = ?auto_180970 ?auto_180972 ) ) ( not ( = ?auto_180971 ?auto_180972 ) ) ( not ( = ?auto_180968 ?auto_180973 ) ) ( not ( = ?auto_180968 ?auto_180974 ) ) ( not ( = ?auto_180969 ?auto_180973 ) ) ( not ( = ?auto_180969 ?auto_180974 ) ) ( not ( = ?auto_180970 ?auto_180973 ) ) ( not ( = ?auto_180970 ?auto_180974 ) ) ( not ( = ?auto_180971 ?auto_180973 ) ) ( not ( = ?auto_180971 ?auto_180974 ) ) ( not ( = ?auto_180972 ?auto_180973 ) ) ( not ( = ?auto_180972 ?auto_180974 ) ) ( not ( = ?auto_180973 ?auto_180974 ) ) ( ON ?auto_180973 ?auto_180972 ) ( CLEAR ?auto_180975 ) ( ON-TABLE ?auto_180976 ) ( ON ?auto_180975 ?auto_180976 ) ( not ( = ?auto_180976 ?auto_180975 ) ) ( not ( = ?auto_180976 ?auto_180974 ) ) ( not ( = ?auto_180975 ?auto_180974 ) ) ( not ( = ?auto_180968 ?auto_180975 ) ) ( not ( = ?auto_180968 ?auto_180976 ) ) ( not ( = ?auto_180969 ?auto_180975 ) ) ( not ( = ?auto_180969 ?auto_180976 ) ) ( not ( = ?auto_180970 ?auto_180975 ) ) ( not ( = ?auto_180970 ?auto_180976 ) ) ( not ( = ?auto_180971 ?auto_180975 ) ) ( not ( = ?auto_180971 ?auto_180976 ) ) ( not ( = ?auto_180972 ?auto_180975 ) ) ( not ( = ?auto_180972 ?auto_180976 ) ) ( not ( = ?auto_180973 ?auto_180975 ) ) ( not ( = ?auto_180973 ?auto_180976 ) ) ( ON ?auto_180974 ?auto_180973 ) ( CLEAR ?auto_180974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180968 ?auto_180969 ?auto_180970 ?auto_180971 ?auto_180972 ?auto_180973 )
      ( MAKE-4PILE ?auto_180968 ?auto_180969 ?auto_180970 ?auto_180971 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_180977 - BLOCK
      ?auto_180978 - BLOCK
      ?auto_180979 - BLOCK
      ?auto_180980 - BLOCK
    )
    :vars
    (
      ?auto_180982 - BLOCK
      ?auto_180981 - BLOCK
      ?auto_180983 - BLOCK
      ?auto_180984 - BLOCK
      ?auto_180985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180982 ?auto_180980 ) ( ON-TABLE ?auto_180977 ) ( ON ?auto_180978 ?auto_180977 ) ( ON ?auto_180979 ?auto_180978 ) ( ON ?auto_180980 ?auto_180979 ) ( not ( = ?auto_180977 ?auto_180978 ) ) ( not ( = ?auto_180977 ?auto_180979 ) ) ( not ( = ?auto_180977 ?auto_180980 ) ) ( not ( = ?auto_180977 ?auto_180982 ) ) ( not ( = ?auto_180978 ?auto_180979 ) ) ( not ( = ?auto_180978 ?auto_180980 ) ) ( not ( = ?auto_180978 ?auto_180982 ) ) ( not ( = ?auto_180979 ?auto_180980 ) ) ( not ( = ?auto_180979 ?auto_180982 ) ) ( not ( = ?auto_180980 ?auto_180982 ) ) ( not ( = ?auto_180977 ?auto_180981 ) ) ( not ( = ?auto_180977 ?auto_180983 ) ) ( not ( = ?auto_180978 ?auto_180981 ) ) ( not ( = ?auto_180978 ?auto_180983 ) ) ( not ( = ?auto_180979 ?auto_180981 ) ) ( not ( = ?auto_180979 ?auto_180983 ) ) ( not ( = ?auto_180980 ?auto_180981 ) ) ( not ( = ?auto_180980 ?auto_180983 ) ) ( not ( = ?auto_180982 ?auto_180981 ) ) ( not ( = ?auto_180982 ?auto_180983 ) ) ( not ( = ?auto_180981 ?auto_180983 ) ) ( ON ?auto_180981 ?auto_180982 ) ( ON-TABLE ?auto_180984 ) ( not ( = ?auto_180984 ?auto_180985 ) ) ( not ( = ?auto_180984 ?auto_180983 ) ) ( not ( = ?auto_180985 ?auto_180983 ) ) ( not ( = ?auto_180977 ?auto_180985 ) ) ( not ( = ?auto_180977 ?auto_180984 ) ) ( not ( = ?auto_180978 ?auto_180985 ) ) ( not ( = ?auto_180978 ?auto_180984 ) ) ( not ( = ?auto_180979 ?auto_180985 ) ) ( not ( = ?auto_180979 ?auto_180984 ) ) ( not ( = ?auto_180980 ?auto_180985 ) ) ( not ( = ?auto_180980 ?auto_180984 ) ) ( not ( = ?auto_180982 ?auto_180985 ) ) ( not ( = ?auto_180982 ?auto_180984 ) ) ( not ( = ?auto_180981 ?auto_180985 ) ) ( not ( = ?auto_180981 ?auto_180984 ) ) ( ON ?auto_180983 ?auto_180981 ) ( CLEAR ?auto_180983 ) ( HOLDING ?auto_180985 ) ( CLEAR ?auto_180984 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180984 ?auto_180985 )
      ( MAKE-4PILE ?auto_180977 ?auto_180978 ?auto_180979 ?auto_180980 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182679 - BLOCK
      ?auto_182680 - BLOCK
      ?auto_182681 - BLOCK
      ?auto_182682 - BLOCK
    )
    :vars
    (
      ?auto_182683 - BLOCK
      ?auto_182684 - BLOCK
      ?auto_182685 - BLOCK
      ?auto_182686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182683 ?auto_182682 ) ( ON-TABLE ?auto_182679 ) ( ON ?auto_182680 ?auto_182679 ) ( ON ?auto_182681 ?auto_182680 ) ( ON ?auto_182682 ?auto_182681 ) ( not ( = ?auto_182679 ?auto_182680 ) ) ( not ( = ?auto_182679 ?auto_182681 ) ) ( not ( = ?auto_182679 ?auto_182682 ) ) ( not ( = ?auto_182679 ?auto_182683 ) ) ( not ( = ?auto_182680 ?auto_182681 ) ) ( not ( = ?auto_182680 ?auto_182682 ) ) ( not ( = ?auto_182680 ?auto_182683 ) ) ( not ( = ?auto_182681 ?auto_182682 ) ) ( not ( = ?auto_182681 ?auto_182683 ) ) ( not ( = ?auto_182682 ?auto_182683 ) ) ( not ( = ?auto_182679 ?auto_182684 ) ) ( not ( = ?auto_182679 ?auto_182685 ) ) ( not ( = ?auto_182680 ?auto_182684 ) ) ( not ( = ?auto_182680 ?auto_182685 ) ) ( not ( = ?auto_182681 ?auto_182684 ) ) ( not ( = ?auto_182681 ?auto_182685 ) ) ( not ( = ?auto_182682 ?auto_182684 ) ) ( not ( = ?auto_182682 ?auto_182685 ) ) ( not ( = ?auto_182683 ?auto_182684 ) ) ( not ( = ?auto_182683 ?auto_182685 ) ) ( not ( = ?auto_182684 ?auto_182685 ) ) ( ON ?auto_182684 ?auto_182683 ) ( not ( = ?auto_182686 ?auto_182685 ) ) ( not ( = ?auto_182679 ?auto_182686 ) ) ( not ( = ?auto_182680 ?auto_182686 ) ) ( not ( = ?auto_182681 ?auto_182686 ) ) ( not ( = ?auto_182682 ?auto_182686 ) ) ( not ( = ?auto_182683 ?auto_182686 ) ) ( not ( = ?auto_182684 ?auto_182686 ) ) ( ON ?auto_182685 ?auto_182684 ) ( ON ?auto_182686 ?auto_182685 ) ( CLEAR ?auto_182686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182679 ?auto_182680 ?auto_182681 ?auto_182682 ?auto_182683 ?auto_182684 ?auto_182685 )
      ( MAKE-4PILE ?auto_182679 ?auto_182680 ?auto_182681 ?auto_182682 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_180995 - BLOCK
      ?auto_180996 - BLOCK
      ?auto_180997 - BLOCK
      ?auto_180998 - BLOCK
    )
    :vars
    (
      ?auto_180999 - BLOCK
      ?auto_181002 - BLOCK
      ?auto_181000 - BLOCK
      ?auto_181001 - BLOCK
      ?auto_181003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180999 ?auto_180998 ) ( ON-TABLE ?auto_180995 ) ( ON ?auto_180996 ?auto_180995 ) ( ON ?auto_180997 ?auto_180996 ) ( ON ?auto_180998 ?auto_180997 ) ( not ( = ?auto_180995 ?auto_180996 ) ) ( not ( = ?auto_180995 ?auto_180997 ) ) ( not ( = ?auto_180995 ?auto_180998 ) ) ( not ( = ?auto_180995 ?auto_180999 ) ) ( not ( = ?auto_180996 ?auto_180997 ) ) ( not ( = ?auto_180996 ?auto_180998 ) ) ( not ( = ?auto_180996 ?auto_180999 ) ) ( not ( = ?auto_180997 ?auto_180998 ) ) ( not ( = ?auto_180997 ?auto_180999 ) ) ( not ( = ?auto_180998 ?auto_180999 ) ) ( not ( = ?auto_180995 ?auto_181002 ) ) ( not ( = ?auto_180995 ?auto_181000 ) ) ( not ( = ?auto_180996 ?auto_181002 ) ) ( not ( = ?auto_180996 ?auto_181000 ) ) ( not ( = ?auto_180997 ?auto_181002 ) ) ( not ( = ?auto_180997 ?auto_181000 ) ) ( not ( = ?auto_180998 ?auto_181002 ) ) ( not ( = ?auto_180998 ?auto_181000 ) ) ( not ( = ?auto_180999 ?auto_181002 ) ) ( not ( = ?auto_180999 ?auto_181000 ) ) ( not ( = ?auto_181002 ?auto_181000 ) ) ( ON ?auto_181002 ?auto_180999 ) ( not ( = ?auto_181001 ?auto_181003 ) ) ( not ( = ?auto_181001 ?auto_181000 ) ) ( not ( = ?auto_181003 ?auto_181000 ) ) ( not ( = ?auto_180995 ?auto_181003 ) ) ( not ( = ?auto_180995 ?auto_181001 ) ) ( not ( = ?auto_180996 ?auto_181003 ) ) ( not ( = ?auto_180996 ?auto_181001 ) ) ( not ( = ?auto_180997 ?auto_181003 ) ) ( not ( = ?auto_180997 ?auto_181001 ) ) ( not ( = ?auto_180998 ?auto_181003 ) ) ( not ( = ?auto_180998 ?auto_181001 ) ) ( not ( = ?auto_180999 ?auto_181003 ) ) ( not ( = ?auto_180999 ?auto_181001 ) ) ( not ( = ?auto_181002 ?auto_181003 ) ) ( not ( = ?auto_181002 ?auto_181001 ) ) ( ON ?auto_181000 ?auto_181002 ) ( ON ?auto_181003 ?auto_181000 ) ( CLEAR ?auto_181003 ) ( HOLDING ?auto_181001 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_181001 )
      ( MAKE-4PILE ?auto_180995 ?auto_180996 ?auto_180997 ?auto_180998 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_181004 - BLOCK
      ?auto_181005 - BLOCK
      ?auto_181006 - BLOCK
      ?auto_181007 - BLOCK
    )
    :vars
    (
      ?auto_181011 - BLOCK
      ?auto_181009 - BLOCK
      ?auto_181008 - BLOCK
      ?auto_181010 - BLOCK
      ?auto_181012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181011 ?auto_181007 ) ( ON-TABLE ?auto_181004 ) ( ON ?auto_181005 ?auto_181004 ) ( ON ?auto_181006 ?auto_181005 ) ( ON ?auto_181007 ?auto_181006 ) ( not ( = ?auto_181004 ?auto_181005 ) ) ( not ( = ?auto_181004 ?auto_181006 ) ) ( not ( = ?auto_181004 ?auto_181007 ) ) ( not ( = ?auto_181004 ?auto_181011 ) ) ( not ( = ?auto_181005 ?auto_181006 ) ) ( not ( = ?auto_181005 ?auto_181007 ) ) ( not ( = ?auto_181005 ?auto_181011 ) ) ( not ( = ?auto_181006 ?auto_181007 ) ) ( not ( = ?auto_181006 ?auto_181011 ) ) ( not ( = ?auto_181007 ?auto_181011 ) ) ( not ( = ?auto_181004 ?auto_181009 ) ) ( not ( = ?auto_181004 ?auto_181008 ) ) ( not ( = ?auto_181005 ?auto_181009 ) ) ( not ( = ?auto_181005 ?auto_181008 ) ) ( not ( = ?auto_181006 ?auto_181009 ) ) ( not ( = ?auto_181006 ?auto_181008 ) ) ( not ( = ?auto_181007 ?auto_181009 ) ) ( not ( = ?auto_181007 ?auto_181008 ) ) ( not ( = ?auto_181011 ?auto_181009 ) ) ( not ( = ?auto_181011 ?auto_181008 ) ) ( not ( = ?auto_181009 ?auto_181008 ) ) ( ON ?auto_181009 ?auto_181011 ) ( not ( = ?auto_181010 ?auto_181012 ) ) ( not ( = ?auto_181010 ?auto_181008 ) ) ( not ( = ?auto_181012 ?auto_181008 ) ) ( not ( = ?auto_181004 ?auto_181012 ) ) ( not ( = ?auto_181004 ?auto_181010 ) ) ( not ( = ?auto_181005 ?auto_181012 ) ) ( not ( = ?auto_181005 ?auto_181010 ) ) ( not ( = ?auto_181006 ?auto_181012 ) ) ( not ( = ?auto_181006 ?auto_181010 ) ) ( not ( = ?auto_181007 ?auto_181012 ) ) ( not ( = ?auto_181007 ?auto_181010 ) ) ( not ( = ?auto_181011 ?auto_181012 ) ) ( not ( = ?auto_181011 ?auto_181010 ) ) ( not ( = ?auto_181009 ?auto_181012 ) ) ( not ( = ?auto_181009 ?auto_181010 ) ) ( ON ?auto_181008 ?auto_181009 ) ( ON ?auto_181012 ?auto_181008 ) ( ON ?auto_181010 ?auto_181012 ) ( CLEAR ?auto_181010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_181004 ?auto_181005 ?auto_181006 ?auto_181007 ?auto_181011 ?auto_181009 ?auto_181008 ?auto_181012 )
      ( MAKE-4PILE ?auto_181004 ?auto_181005 ?auto_181006 ?auto_181007 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181018 - BLOCK
      ?auto_181019 - BLOCK
      ?auto_181020 - BLOCK
      ?auto_181021 - BLOCK
      ?auto_181022 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_181022 ) ( CLEAR ?auto_181021 ) ( ON-TABLE ?auto_181018 ) ( ON ?auto_181019 ?auto_181018 ) ( ON ?auto_181020 ?auto_181019 ) ( ON ?auto_181021 ?auto_181020 ) ( not ( = ?auto_181018 ?auto_181019 ) ) ( not ( = ?auto_181018 ?auto_181020 ) ) ( not ( = ?auto_181018 ?auto_181021 ) ) ( not ( = ?auto_181018 ?auto_181022 ) ) ( not ( = ?auto_181019 ?auto_181020 ) ) ( not ( = ?auto_181019 ?auto_181021 ) ) ( not ( = ?auto_181019 ?auto_181022 ) ) ( not ( = ?auto_181020 ?auto_181021 ) ) ( not ( = ?auto_181020 ?auto_181022 ) ) ( not ( = ?auto_181021 ?auto_181022 ) ) )
    :subtasks
    ( ( !STACK ?auto_181022 ?auto_181021 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181023 - BLOCK
      ?auto_181024 - BLOCK
      ?auto_181025 - BLOCK
      ?auto_181026 - BLOCK
      ?auto_181027 - BLOCK
    )
    :vars
    (
      ?auto_181028 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_181026 ) ( ON-TABLE ?auto_181023 ) ( ON ?auto_181024 ?auto_181023 ) ( ON ?auto_181025 ?auto_181024 ) ( ON ?auto_181026 ?auto_181025 ) ( not ( = ?auto_181023 ?auto_181024 ) ) ( not ( = ?auto_181023 ?auto_181025 ) ) ( not ( = ?auto_181023 ?auto_181026 ) ) ( not ( = ?auto_181023 ?auto_181027 ) ) ( not ( = ?auto_181024 ?auto_181025 ) ) ( not ( = ?auto_181024 ?auto_181026 ) ) ( not ( = ?auto_181024 ?auto_181027 ) ) ( not ( = ?auto_181025 ?auto_181026 ) ) ( not ( = ?auto_181025 ?auto_181027 ) ) ( not ( = ?auto_181026 ?auto_181027 ) ) ( ON ?auto_181027 ?auto_181028 ) ( CLEAR ?auto_181027 ) ( HAND-EMPTY ) ( not ( = ?auto_181023 ?auto_181028 ) ) ( not ( = ?auto_181024 ?auto_181028 ) ) ( not ( = ?auto_181025 ?auto_181028 ) ) ( not ( = ?auto_181026 ?auto_181028 ) ) ( not ( = ?auto_181027 ?auto_181028 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_181027 ?auto_181028 )
      ( MAKE-5PILE ?auto_181023 ?auto_181024 ?auto_181025 ?auto_181026 ?auto_181027 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181029 - BLOCK
      ?auto_181030 - BLOCK
      ?auto_181031 - BLOCK
      ?auto_181032 - BLOCK
      ?auto_181033 - BLOCK
    )
    :vars
    (
      ?auto_181034 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181029 ) ( ON ?auto_181030 ?auto_181029 ) ( ON ?auto_181031 ?auto_181030 ) ( not ( = ?auto_181029 ?auto_181030 ) ) ( not ( = ?auto_181029 ?auto_181031 ) ) ( not ( = ?auto_181029 ?auto_181032 ) ) ( not ( = ?auto_181029 ?auto_181033 ) ) ( not ( = ?auto_181030 ?auto_181031 ) ) ( not ( = ?auto_181030 ?auto_181032 ) ) ( not ( = ?auto_181030 ?auto_181033 ) ) ( not ( = ?auto_181031 ?auto_181032 ) ) ( not ( = ?auto_181031 ?auto_181033 ) ) ( not ( = ?auto_181032 ?auto_181033 ) ) ( ON ?auto_181033 ?auto_181034 ) ( CLEAR ?auto_181033 ) ( not ( = ?auto_181029 ?auto_181034 ) ) ( not ( = ?auto_181030 ?auto_181034 ) ) ( not ( = ?auto_181031 ?auto_181034 ) ) ( not ( = ?auto_181032 ?auto_181034 ) ) ( not ( = ?auto_181033 ?auto_181034 ) ) ( HOLDING ?auto_181032 ) ( CLEAR ?auto_181031 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181029 ?auto_181030 ?auto_181031 ?auto_181032 )
      ( MAKE-5PILE ?auto_181029 ?auto_181030 ?auto_181031 ?auto_181032 ?auto_181033 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181035 - BLOCK
      ?auto_181036 - BLOCK
      ?auto_181037 - BLOCK
      ?auto_181038 - BLOCK
      ?auto_181039 - BLOCK
    )
    :vars
    (
      ?auto_181040 - BLOCK
      ?auto_181042 - BLOCK
      ?auto_181043 - BLOCK
      ?auto_181041 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181035 ) ( ON ?auto_181036 ?auto_181035 ) ( ON ?auto_181037 ?auto_181036 ) ( not ( = ?auto_181035 ?auto_181036 ) ) ( not ( = ?auto_181035 ?auto_181037 ) ) ( not ( = ?auto_181035 ?auto_181038 ) ) ( not ( = ?auto_181035 ?auto_181039 ) ) ( not ( = ?auto_181036 ?auto_181037 ) ) ( not ( = ?auto_181036 ?auto_181038 ) ) ( not ( = ?auto_181036 ?auto_181039 ) ) ( not ( = ?auto_181037 ?auto_181038 ) ) ( not ( = ?auto_181037 ?auto_181039 ) ) ( not ( = ?auto_181038 ?auto_181039 ) ) ( ON ?auto_181039 ?auto_181040 ) ( not ( = ?auto_181035 ?auto_181040 ) ) ( not ( = ?auto_181036 ?auto_181040 ) ) ( not ( = ?auto_181037 ?auto_181040 ) ) ( not ( = ?auto_181038 ?auto_181040 ) ) ( not ( = ?auto_181039 ?auto_181040 ) ) ( CLEAR ?auto_181037 ) ( ON ?auto_181038 ?auto_181039 ) ( CLEAR ?auto_181038 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_181042 ) ( ON ?auto_181043 ?auto_181042 ) ( ON ?auto_181041 ?auto_181043 ) ( ON ?auto_181040 ?auto_181041 ) ( not ( = ?auto_181042 ?auto_181043 ) ) ( not ( = ?auto_181042 ?auto_181041 ) ) ( not ( = ?auto_181042 ?auto_181040 ) ) ( not ( = ?auto_181042 ?auto_181039 ) ) ( not ( = ?auto_181042 ?auto_181038 ) ) ( not ( = ?auto_181043 ?auto_181041 ) ) ( not ( = ?auto_181043 ?auto_181040 ) ) ( not ( = ?auto_181043 ?auto_181039 ) ) ( not ( = ?auto_181043 ?auto_181038 ) ) ( not ( = ?auto_181041 ?auto_181040 ) ) ( not ( = ?auto_181041 ?auto_181039 ) ) ( not ( = ?auto_181041 ?auto_181038 ) ) ( not ( = ?auto_181035 ?auto_181042 ) ) ( not ( = ?auto_181035 ?auto_181043 ) ) ( not ( = ?auto_181035 ?auto_181041 ) ) ( not ( = ?auto_181036 ?auto_181042 ) ) ( not ( = ?auto_181036 ?auto_181043 ) ) ( not ( = ?auto_181036 ?auto_181041 ) ) ( not ( = ?auto_181037 ?auto_181042 ) ) ( not ( = ?auto_181037 ?auto_181043 ) ) ( not ( = ?auto_181037 ?auto_181041 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181042 ?auto_181043 ?auto_181041 ?auto_181040 ?auto_181039 )
      ( MAKE-5PILE ?auto_181035 ?auto_181036 ?auto_181037 ?auto_181038 ?auto_181039 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181044 - BLOCK
      ?auto_181045 - BLOCK
      ?auto_181046 - BLOCK
      ?auto_181047 - BLOCK
      ?auto_181048 - BLOCK
    )
    :vars
    (
      ?auto_181050 - BLOCK
      ?auto_181051 - BLOCK
      ?auto_181052 - BLOCK
      ?auto_181049 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181044 ) ( ON ?auto_181045 ?auto_181044 ) ( not ( = ?auto_181044 ?auto_181045 ) ) ( not ( = ?auto_181044 ?auto_181046 ) ) ( not ( = ?auto_181044 ?auto_181047 ) ) ( not ( = ?auto_181044 ?auto_181048 ) ) ( not ( = ?auto_181045 ?auto_181046 ) ) ( not ( = ?auto_181045 ?auto_181047 ) ) ( not ( = ?auto_181045 ?auto_181048 ) ) ( not ( = ?auto_181046 ?auto_181047 ) ) ( not ( = ?auto_181046 ?auto_181048 ) ) ( not ( = ?auto_181047 ?auto_181048 ) ) ( ON ?auto_181048 ?auto_181050 ) ( not ( = ?auto_181044 ?auto_181050 ) ) ( not ( = ?auto_181045 ?auto_181050 ) ) ( not ( = ?auto_181046 ?auto_181050 ) ) ( not ( = ?auto_181047 ?auto_181050 ) ) ( not ( = ?auto_181048 ?auto_181050 ) ) ( ON ?auto_181047 ?auto_181048 ) ( CLEAR ?auto_181047 ) ( ON-TABLE ?auto_181051 ) ( ON ?auto_181052 ?auto_181051 ) ( ON ?auto_181049 ?auto_181052 ) ( ON ?auto_181050 ?auto_181049 ) ( not ( = ?auto_181051 ?auto_181052 ) ) ( not ( = ?auto_181051 ?auto_181049 ) ) ( not ( = ?auto_181051 ?auto_181050 ) ) ( not ( = ?auto_181051 ?auto_181048 ) ) ( not ( = ?auto_181051 ?auto_181047 ) ) ( not ( = ?auto_181052 ?auto_181049 ) ) ( not ( = ?auto_181052 ?auto_181050 ) ) ( not ( = ?auto_181052 ?auto_181048 ) ) ( not ( = ?auto_181052 ?auto_181047 ) ) ( not ( = ?auto_181049 ?auto_181050 ) ) ( not ( = ?auto_181049 ?auto_181048 ) ) ( not ( = ?auto_181049 ?auto_181047 ) ) ( not ( = ?auto_181044 ?auto_181051 ) ) ( not ( = ?auto_181044 ?auto_181052 ) ) ( not ( = ?auto_181044 ?auto_181049 ) ) ( not ( = ?auto_181045 ?auto_181051 ) ) ( not ( = ?auto_181045 ?auto_181052 ) ) ( not ( = ?auto_181045 ?auto_181049 ) ) ( not ( = ?auto_181046 ?auto_181051 ) ) ( not ( = ?auto_181046 ?auto_181052 ) ) ( not ( = ?auto_181046 ?auto_181049 ) ) ( HOLDING ?auto_181046 ) ( CLEAR ?auto_181045 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181044 ?auto_181045 ?auto_181046 )
      ( MAKE-5PILE ?auto_181044 ?auto_181045 ?auto_181046 ?auto_181047 ?auto_181048 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181053 - BLOCK
      ?auto_181054 - BLOCK
      ?auto_181055 - BLOCK
      ?auto_181056 - BLOCK
      ?auto_181057 - BLOCK
    )
    :vars
    (
      ?auto_181059 - BLOCK
      ?auto_181061 - BLOCK
      ?auto_181060 - BLOCK
      ?auto_181058 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181053 ) ( ON ?auto_181054 ?auto_181053 ) ( not ( = ?auto_181053 ?auto_181054 ) ) ( not ( = ?auto_181053 ?auto_181055 ) ) ( not ( = ?auto_181053 ?auto_181056 ) ) ( not ( = ?auto_181053 ?auto_181057 ) ) ( not ( = ?auto_181054 ?auto_181055 ) ) ( not ( = ?auto_181054 ?auto_181056 ) ) ( not ( = ?auto_181054 ?auto_181057 ) ) ( not ( = ?auto_181055 ?auto_181056 ) ) ( not ( = ?auto_181055 ?auto_181057 ) ) ( not ( = ?auto_181056 ?auto_181057 ) ) ( ON ?auto_181057 ?auto_181059 ) ( not ( = ?auto_181053 ?auto_181059 ) ) ( not ( = ?auto_181054 ?auto_181059 ) ) ( not ( = ?auto_181055 ?auto_181059 ) ) ( not ( = ?auto_181056 ?auto_181059 ) ) ( not ( = ?auto_181057 ?auto_181059 ) ) ( ON ?auto_181056 ?auto_181057 ) ( ON-TABLE ?auto_181061 ) ( ON ?auto_181060 ?auto_181061 ) ( ON ?auto_181058 ?auto_181060 ) ( ON ?auto_181059 ?auto_181058 ) ( not ( = ?auto_181061 ?auto_181060 ) ) ( not ( = ?auto_181061 ?auto_181058 ) ) ( not ( = ?auto_181061 ?auto_181059 ) ) ( not ( = ?auto_181061 ?auto_181057 ) ) ( not ( = ?auto_181061 ?auto_181056 ) ) ( not ( = ?auto_181060 ?auto_181058 ) ) ( not ( = ?auto_181060 ?auto_181059 ) ) ( not ( = ?auto_181060 ?auto_181057 ) ) ( not ( = ?auto_181060 ?auto_181056 ) ) ( not ( = ?auto_181058 ?auto_181059 ) ) ( not ( = ?auto_181058 ?auto_181057 ) ) ( not ( = ?auto_181058 ?auto_181056 ) ) ( not ( = ?auto_181053 ?auto_181061 ) ) ( not ( = ?auto_181053 ?auto_181060 ) ) ( not ( = ?auto_181053 ?auto_181058 ) ) ( not ( = ?auto_181054 ?auto_181061 ) ) ( not ( = ?auto_181054 ?auto_181060 ) ) ( not ( = ?auto_181054 ?auto_181058 ) ) ( not ( = ?auto_181055 ?auto_181061 ) ) ( not ( = ?auto_181055 ?auto_181060 ) ) ( not ( = ?auto_181055 ?auto_181058 ) ) ( CLEAR ?auto_181054 ) ( ON ?auto_181055 ?auto_181056 ) ( CLEAR ?auto_181055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181061 ?auto_181060 ?auto_181058 ?auto_181059 ?auto_181057 ?auto_181056 )
      ( MAKE-5PILE ?auto_181053 ?auto_181054 ?auto_181055 ?auto_181056 ?auto_181057 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181062 - BLOCK
      ?auto_181063 - BLOCK
      ?auto_181064 - BLOCK
      ?auto_181065 - BLOCK
      ?auto_181066 - BLOCK
    )
    :vars
    (
      ?auto_181070 - BLOCK
      ?auto_181068 - BLOCK
      ?auto_181069 - BLOCK
      ?auto_181067 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181062 ) ( not ( = ?auto_181062 ?auto_181063 ) ) ( not ( = ?auto_181062 ?auto_181064 ) ) ( not ( = ?auto_181062 ?auto_181065 ) ) ( not ( = ?auto_181062 ?auto_181066 ) ) ( not ( = ?auto_181063 ?auto_181064 ) ) ( not ( = ?auto_181063 ?auto_181065 ) ) ( not ( = ?auto_181063 ?auto_181066 ) ) ( not ( = ?auto_181064 ?auto_181065 ) ) ( not ( = ?auto_181064 ?auto_181066 ) ) ( not ( = ?auto_181065 ?auto_181066 ) ) ( ON ?auto_181066 ?auto_181070 ) ( not ( = ?auto_181062 ?auto_181070 ) ) ( not ( = ?auto_181063 ?auto_181070 ) ) ( not ( = ?auto_181064 ?auto_181070 ) ) ( not ( = ?auto_181065 ?auto_181070 ) ) ( not ( = ?auto_181066 ?auto_181070 ) ) ( ON ?auto_181065 ?auto_181066 ) ( ON-TABLE ?auto_181068 ) ( ON ?auto_181069 ?auto_181068 ) ( ON ?auto_181067 ?auto_181069 ) ( ON ?auto_181070 ?auto_181067 ) ( not ( = ?auto_181068 ?auto_181069 ) ) ( not ( = ?auto_181068 ?auto_181067 ) ) ( not ( = ?auto_181068 ?auto_181070 ) ) ( not ( = ?auto_181068 ?auto_181066 ) ) ( not ( = ?auto_181068 ?auto_181065 ) ) ( not ( = ?auto_181069 ?auto_181067 ) ) ( not ( = ?auto_181069 ?auto_181070 ) ) ( not ( = ?auto_181069 ?auto_181066 ) ) ( not ( = ?auto_181069 ?auto_181065 ) ) ( not ( = ?auto_181067 ?auto_181070 ) ) ( not ( = ?auto_181067 ?auto_181066 ) ) ( not ( = ?auto_181067 ?auto_181065 ) ) ( not ( = ?auto_181062 ?auto_181068 ) ) ( not ( = ?auto_181062 ?auto_181069 ) ) ( not ( = ?auto_181062 ?auto_181067 ) ) ( not ( = ?auto_181063 ?auto_181068 ) ) ( not ( = ?auto_181063 ?auto_181069 ) ) ( not ( = ?auto_181063 ?auto_181067 ) ) ( not ( = ?auto_181064 ?auto_181068 ) ) ( not ( = ?auto_181064 ?auto_181069 ) ) ( not ( = ?auto_181064 ?auto_181067 ) ) ( ON ?auto_181064 ?auto_181065 ) ( CLEAR ?auto_181064 ) ( HOLDING ?auto_181063 ) ( CLEAR ?auto_181062 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181062 ?auto_181063 )
      ( MAKE-5PILE ?auto_181062 ?auto_181063 ?auto_181064 ?auto_181065 ?auto_181066 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181071 - BLOCK
      ?auto_181072 - BLOCK
      ?auto_181073 - BLOCK
      ?auto_181074 - BLOCK
      ?auto_181075 - BLOCK
    )
    :vars
    (
      ?auto_181079 - BLOCK
      ?auto_181076 - BLOCK
      ?auto_181078 - BLOCK
      ?auto_181077 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181071 ) ( not ( = ?auto_181071 ?auto_181072 ) ) ( not ( = ?auto_181071 ?auto_181073 ) ) ( not ( = ?auto_181071 ?auto_181074 ) ) ( not ( = ?auto_181071 ?auto_181075 ) ) ( not ( = ?auto_181072 ?auto_181073 ) ) ( not ( = ?auto_181072 ?auto_181074 ) ) ( not ( = ?auto_181072 ?auto_181075 ) ) ( not ( = ?auto_181073 ?auto_181074 ) ) ( not ( = ?auto_181073 ?auto_181075 ) ) ( not ( = ?auto_181074 ?auto_181075 ) ) ( ON ?auto_181075 ?auto_181079 ) ( not ( = ?auto_181071 ?auto_181079 ) ) ( not ( = ?auto_181072 ?auto_181079 ) ) ( not ( = ?auto_181073 ?auto_181079 ) ) ( not ( = ?auto_181074 ?auto_181079 ) ) ( not ( = ?auto_181075 ?auto_181079 ) ) ( ON ?auto_181074 ?auto_181075 ) ( ON-TABLE ?auto_181076 ) ( ON ?auto_181078 ?auto_181076 ) ( ON ?auto_181077 ?auto_181078 ) ( ON ?auto_181079 ?auto_181077 ) ( not ( = ?auto_181076 ?auto_181078 ) ) ( not ( = ?auto_181076 ?auto_181077 ) ) ( not ( = ?auto_181076 ?auto_181079 ) ) ( not ( = ?auto_181076 ?auto_181075 ) ) ( not ( = ?auto_181076 ?auto_181074 ) ) ( not ( = ?auto_181078 ?auto_181077 ) ) ( not ( = ?auto_181078 ?auto_181079 ) ) ( not ( = ?auto_181078 ?auto_181075 ) ) ( not ( = ?auto_181078 ?auto_181074 ) ) ( not ( = ?auto_181077 ?auto_181079 ) ) ( not ( = ?auto_181077 ?auto_181075 ) ) ( not ( = ?auto_181077 ?auto_181074 ) ) ( not ( = ?auto_181071 ?auto_181076 ) ) ( not ( = ?auto_181071 ?auto_181078 ) ) ( not ( = ?auto_181071 ?auto_181077 ) ) ( not ( = ?auto_181072 ?auto_181076 ) ) ( not ( = ?auto_181072 ?auto_181078 ) ) ( not ( = ?auto_181072 ?auto_181077 ) ) ( not ( = ?auto_181073 ?auto_181076 ) ) ( not ( = ?auto_181073 ?auto_181078 ) ) ( not ( = ?auto_181073 ?auto_181077 ) ) ( ON ?auto_181073 ?auto_181074 ) ( CLEAR ?auto_181071 ) ( ON ?auto_181072 ?auto_181073 ) ( CLEAR ?auto_181072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181076 ?auto_181078 ?auto_181077 ?auto_181079 ?auto_181075 ?auto_181074 ?auto_181073 )
      ( MAKE-5PILE ?auto_181071 ?auto_181072 ?auto_181073 ?auto_181074 ?auto_181075 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181080 - BLOCK
      ?auto_181081 - BLOCK
      ?auto_181082 - BLOCK
      ?auto_181083 - BLOCK
      ?auto_181084 - BLOCK
    )
    :vars
    (
      ?auto_181085 - BLOCK
      ?auto_181087 - BLOCK
      ?auto_181086 - BLOCK
      ?auto_181088 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181080 ?auto_181081 ) ) ( not ( = ?auto_181080 ?auto_181082 ) ) ( not ( = ?auto_181080 ?auto_181083 ) ) ( not ( = ?auto_181080 ?auto_181084 ) ) ( not ( = ?auto_181081 ?auto_181082 ) ) ( not ( = ?auto_181081 ?auto_181083 ) ) ( not ( = ?auto_181081 ?auto_181084 ) ) ( not ( = ?auto_181082 ?auto_181083 ) ) ( not ( = ?auto_181082 ?auto_181084 ) ) ( not ( = ?auto_181083 ?auto_181084 ) ) ( ON ?auto_181084 ?auto_181085 ) ( not ( = ?auto_181080 ?auto_181085 ) ) ( not ( = ?auto_181081 ?auto_181085 ) ) ( not ( = ?auto_181082 ?auto_181085 ) ) ( not ( = ?auto_181083 ?auto_181085 ) ) ( not ( = ?auto_181084 ?auto_181085 ) ) ( ON ?auto_181083 ?auto_181084 ) ( ON-TABLE ?auto_181087 ) ( ON ?auto_181086 ?auto_181087 ) ( ON ?auto_181088 ?auto_181086 ) ( ON ?auto_181085 ?auto_181088 ) ( not ( = ?auto_181087 ?auto_181086 ) ) ( not ( = ?auto_181087 ?auto_181088 ) ) ( not ( = ?auto_181087 ?auto_181085 ) ) ( not ( = ?auto_181087 ?auto_181084 ) ) ( not ( = ?auto_181087 ?auto_181083 ) ) ( not ( = ?auto_181086 ?auto_181088 ) ) ( not ( = ?auto_181086 ?auto_181085 ) ) ( not ( = ?auto_181086 ?auto_181084 ) ) ( not ( = ?auto_181086 ?auto_181083 ) ) ( not ( = ?auto_181088 ?auto_181085 ) ) ( not ( = ?auto_181088 ?auto_181084 ) ) ( not ( = ?auto_181088 ?auto_181083 ) ) ( not ( = ?auto_181080 ?auto_181087 ) ) ( not ( = ?auto_181080 ?auto_181086 ) ) ( not ( = ?auto_181080 ?auto_181088 ) ) ( not ( = ?auto_181081 ?auto_181087 ) ) ( not ( = ?auto_181081 ?auto_181086 ) ) ( not ( = ?auto_181081 ?auto_181088 ) ) ( not ( = ?auto_181082 ?auto_181087 ) ) ( not ( = ?auto_181082 ?auto_181086 ) ) ( not ( = ?auto_181082 ?auto_181088 ) ) ( ON ?auto_181082 ?auto_181083 ) ( ON ?auto_181081 ?auto_181082 ) ( CLEAR ?auto_181081 ) ( HOLDING ?auto_181080 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_181080 )
      ( MAKE-5PILE ?auto_181080 ?auto_181081 ?auto_181082 ?auto_181083 ?auto_181084 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_181089 - BLOCK
      ?auto_181090 - BLOCK
      ?auto_181091 - BLOCK
      ?auto_181092 - BLOCK
      ?auto_181093 - BLOCK
    )
    :vars
    (
      ?auto_181096 - BLOCK
      ?auto_181097 - BLOCK
      ?auto_181094 - BLOCK
      ?auto_181095 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181089 ?auto_181090 ) ) ( not ( = ?auto_181089 ?auto_181091 ) ) ( not ( = ?auto_181089 ?auto_181092 ) ) ( not ( = ?auto_181089 ?auto_181093 ) ) ( not ( = ?auto_181090 ?auto_181091 ) ) ( not ( = ?auto_181090 ?auto_181092 ) ) ( not ( = ?auto_181090 ?auto_181093 ) ) ( not ( = ?auto_181091 ?auto_181092 ) ) ( not ( = ?auto_181091 ?auto_181093 ) ) ( not ( = ?auto_181092 ?auto_181093 ) ) ( ON ?auto_181093 ?auto_181096 ) ( not ( = ?auto_181089 ?auto_181096 ) ) ( not ( = ?auto_181090 ?auto_181096 ) ) ( not ( = ?auto_181091 ?auto_181096 ) ) ( not ( = ?auto_181092 ?auto_181096 ) ) ( not ( = ?auto_181093 ?auto_181096 ) ) ( ON ?auto_181092 ?auto_181093 ) ( ON-TABLE ?auto_181097 ) ( ON ?auto_181094 ?auto_181097 ) ( ON ?auto_181095 ?auto_181094 ) ( ON ?auto_181096 ?auto_181095 ) ( not ( = ?auto_181097 ?auto_181094 ) ) ( not ( = ?auto_181097 ?auto_181095 ) ) ( not ( = ?auto_181097 ?auto_181096 ) ) ( not ( = ?auto_181097 ?auto_181093 ) ) ( not ( = ?auto_181097 ?auto_181092 ) ) ( not ( = ?auto_181094 ?auto_181095 ) ) ( not ( = ?auto_181094 ?auto_181096 ) ) ( not ( = ?auto_181094 ?auto_181093 ) ) ( not ( = ?auto_181094 ?auto_181092 ) ) ( not ( = ?auto_181095 ?auto_181096 ) ) ( not ( = ?auto_181095 ?auto_181093 ) ) ( not ( = ?auto_181095 ?auto_181092 ) ) ( not ( = ?auto_181089 ?auto_181097 ) ) ( not ( = ?auto_181089 ?auto_181094 ) ) ( not ( = ?auto_181089 ?auto_181095 ) ) ( not ( = ?auto_181090 ?auto_181097 ) ) ( not ( = ?auto_181090 ?auto_181094 ) ) ( not ( = ?auto_181090 ?auto_181095 ) ) ( not ( = ?auto_181091 ?auto_181097 ) ) ( not ( = ?auto_181091 ?auto_181094 ) ) ( not ( = ?auto_181091 ?auto_181095 ) ) ( ON ?auto_181091 ?auto_181092 ) ( ON ?auto_181090 ?auto_181091 ) ( ON ?auto_181089 ?auto_181090 ) ( CLEAR ?auto_181089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_181097 ?auto_181094 ?auto_181095 ?auto_181096 ?auto_181093 ?auto_181092 ?auto_181091 ?auto_181090 )
      ( MAKE-5PILE ?auto_181089 ?auto_181090 ?auto_181091 ?auto_181092 ?auto_181093 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181101 - BLOCK
      ?auto_181102 - BLOCK
      ?auto_181103 - BLOCK
    )
    :vars
    (
      ?auto_181104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181104 ?auto_181103 ) ( CLEAR ?auto_181104 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_181101 ) ( ON ?auto_181102 ?auto_181101 ) ( ON ?auto_181103 ?auto_181102 ) ( not ( = ?auto_181101 ?auto_181102 ) ) ( not ( = ?auto_181101 ?auto_181103 ) ) ( not ( = ?auto_181101 ?auto_181104 ) ) ( not ( = ?auto_181102 ?auto_181103 ) ) ( not ( = ?auto_181102 ?auto_181104 ) ) ( not ( = ?auto_181103 ?auto_181104 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_181104 ?auto_181103 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181105 - BLOCK
      ?auto_181106 - BLOCK
      ?auto_181107 - BLOCK
    )
    :vars
    (
      ?auto_181108 - BLOCK
      ?auto_181109 - BLOCK
      ?auto_181110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181108 ?auto_181107 ) ( CLEAR ?auto_181108 ) ( ON-TABLE ?auto_181105 ) ( ON ?auto_181106 ?auto_181105 ) ( ON ?auto_181107 ?auto_181106 ) ( not ( = ?auto_181105 ?auto_181106 ) ) ( not ( = ?auto_181105 ?auto_181107 ) ) ( not ( = ?auto_181105 ?auto_181108 ) ) ( not ( = ?auto_181106 ?auto_181107 ) ) ( not ( = ?auto_181106 ?auto_181108 ) ) ( not ( = ?auto_181107 ?auto_181108 ) ) ( HOLDING ?auto_181109 ) ( CLEAR ?auto_181110 ) ( not ( = ?auto_181105 ?auto_181109 ) ) ( not ( = ?auto_181105 ?auto_181110 ) ) ( not ( = ?auto_181106 ?auto_181109 ) ) ( not ( = ?auto_181106 ?auto_181110 ) ) ( not ( = ?auto_181107 ?auto_181109 ) ) ( not ( = ?auto_181107 ?auto_181110 ) ) ( not ( = ?auto_181108 ?auto_181109 ) ) ( not ( = ?auto_181108 ?auto_181110 ) ) ( not ( = ?auto_181109 ?auto_181110 ) ) )
    :subtasks
    ( ( !STACK ?auto_181109 ?auto_181110 )
      ( MAKE-3PILE ?auto_181105 ?auto_181106 ?auto_181107 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181111 - BLOCK
      ?auto_181112 - BLOCK
      ?auto_181113 - BLOCK
    )
    :vars
    (
      ?auto_181116 - BLOCK
      ?auto_181115 - BLOCK
      ?auto_181114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181116 ?auto_181113 ) ( ON-TABLE ?auto_181111 ) ( ON ?auto_181112 ?auto_181111 ) ( ON ?auto_181113 ?auto_181112 ) ( not ( = ?auto_181111 ?auto_181112 ) ) ( not ( = ?auto_181111 ?auto_181113 ) ) ( not ( = ?auto_181111 ?auto_181116 ) ) ( not ( = ?auto_181112 ?auto_181113 ) ) ( not ( = ?auto_181112 ?auto_181116 ) ) ( not ( = ?auto_181113 ?auto_181116 ) ) ( CLEAR ?auto_181115 ) ( not ( = ?auto_181111 ?auto_181114 ) ) ( not ( = ?auto_181111 ?auto_181115 ) ) ( not ( = ?auto_181112 ?auto_181114 ) ) ( not ( = ?auto_181112 ?auto_181115 ) ) ( not ( = ?auto_181113 ?auto_181114 ) ) ( not ( = ?auto_181113 ?auto_181115 ) ) ( not ( = ?auto_181116 ?auto_181114 ) ) ( not ( = ?auto_181116 ?auto_181115 ) ) ( not ( = ?auto_181114 ?auto_181115 ) ) ( ON ?auto_181114 ?auto_181116 ) ( CLEAR ?auto_181114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181111 ?auto_181112 ?auto_181113 ?auto_181116 )
      ( MAKE-3PILE ?auto_181111 ?auto_181112 ?auto_181113 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181117 - BLOCK
      ?auto_181118 - BLOCK
      ?auto_181119 - BLOCK
    )
    :vars
    (
      ?auto_181122 - BLOCK
      ?auto_181121 - BLOCK
      ?auto_181120 - BLOCK
      ?auto_181124 - BLOCK
      ?auto_181125 - BLOCK
      ?auto_181123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181122 ?auto_181119 ) ( ON-TABLE ?auto_181117 ) ( ON ?auto_181118 ?auto_181117 ) ( ON ?auto_181119 ?auto_181118 ) ( not ( = ?auto_181117 ?auto_181118 ) ) ( not ( = ?auto_181117 ?auto_181119 ) ) ( not ( = ?auto_181117 ?auto_181122 ) ) ( not ( = ?auto_181118 ?auto_181119 ) ) ( not ( = ?auto_181118 ?auto_181122 ) ) ( not ( = ?auto_181119 ?auto_181122 ) ) ( not ( = ?auto_181117 ?auto_181121 ) ) ( not ( = ?auto_181117 ?auto_181120 ) ) ( not ( = ?auto_181118 ?auto_181121 ) ) ( not ( = ?auto_181118 ?auto_181120 ) ) ( not ( = ?auto_181119 ?auto_181121 ) ) ( not ( = ?auto_181119 ?auto_181120 ) ) ( not ( = ?auto_181122 ?auto_181121 ) ) ( not ( = ?auto_181122 ?auto_181120 ) ) ( not ( = ?auto_181121 ?auto_181120 ) ) ( ON ?auto_181121 ?auto_181122 ) ( CLEAR ?auto_181121 ) ( HOLDING ?auto_181120 ) ( CLEAR ?auto_181124 ) ( ON-TABLE ?auto_181125 ) ( ON ?auto_181123 ?auto_181125 ) ( ON ?auto_181124 ?auto_181123 ) ( not ( = ?auto_181125 ?auto_181123 ) ) ( not ( = ?auto_181125 ?auto_181124 ) ) ( not ( = ?auto_181125 ?auto_181120 ) ) ( not ( = ?auto_181123 ?auto_181124 ) ) ( not ( = ?auto_181123 ?auto_181120 ) ) ( not ( = ?auto_181124 ?auto_181120 ) ) ( not ( = ?auto_181117 ?auto_181124 ) ) ( not ( = ?auto_181117 ?auto_181125 ) ) ( not ( = ?auto_181117 ?auto_181123 ) ) ( not ( = ?auto_181118 ?auto_181124 ) ) ( not ( = ?auto_181118 ?auto_181125 ) ) ( not ( = ?auto_181118 ?auto_181123 ) ) ( not ( = ?auto_181119 ?auto_181124 ) ) ( not ( = ?auto_181119 ?auto_181125 ) ) ( not ( = ?auto_181119 ?auto_181123 ) ) ( not ( = ?auto_181122 ?auto_181124 ) ) ( not ( = ?auto_181122 ?auto_181125 ) ) ( not ( = ?auto_181122 ?auto_181123 ) ) ( not ( = ?auto_181121 ?auto_181124 ) ) ( not ( = ?auto_181121 ?auto_181125 ) ) ( not ( = ?auto_181121 ?auto_181123 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181125 ?auto_181123 ?auto_181124 ?auto_181120 )
      ( MAKE-3PILE ?auto_181117 ?auto_181118 ?auto_181119 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181126 - BLOCK
      ?auto_181127 - BLOCK
      ?auto_181128 - BLOCK
    )
    :vars
    (
      ?auto_181133 - BLOCK
      ?auto_181134 - BLOCK
      ?auto_181130 - BLOCK
      ?auto_181131 - BLOCK
      ?auto_181132 - BLOCK
      ?auto_181129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181133 ?auto_181128 ) ( ON-TABLE ?auto_181126 ) ( ON ?auto_181127 ?auto_181126 ) ( ON ?auto_181128 ?auto_181127 ) ( not ( = ?auto_181126 ?auto_181127 ) ) ( not ( = ?auto_181126 ?auto_181128 ) ) ( not ( = ?auto_181126 ?auto_181133 ) ) ( not ( = ?auto_181127 ?auto_181128 ) ) ( not ( = ?auto_181127 ?auto_181133 ) ) ( not ( = ?auto_181128 ?auto_181133 ) ) ( not ( = ?auto_181126 ?auto_181134 ) ) ( not ( = ?auto_181126 ?auto_181130 ) ) ( not ( = ?auto_181127 ?auto_181134 ) ) ( not ( = ?auto_181127 ?auto_181130 ) ) ( not ( = ?auto_181128 ?auto_181134 ) ) ( not ( = ?auto_181128 ?auto_181130 ) ) ( not ( = ?auto_181133 ?auto_181134 ) ) ( not ( = ?auto_181133 ?auto_181130 ) ) ( not ( = ?auto_181134 ?auto_181130 ) ) ( ON ?auto_181134 ?auto_181133 ) ( CLEAR ?auto_181131 ) ( ON-TABLE ?auto_181132 ) ( ON ?auto_181129 ?auto_181132 ) ( ON ?auto_181131 ?auto_181129 ) ( not ( = ?auto_181132 ?auto_181129 ) ) ( not ( = ?auto_181132 ?auto_181131 ) ) ( not ( = ?auto_181132 ?auto_181130 ) ) ( not ( = ?auto_181129 ?auto_181131 ) ) ( not ( = ?auto_181129 ?auto_181130 ) ) ( not ( = ?auto_181131 ?auto_181130 ) ) ( not ( = ?auto_181126 ?auto_181131 ) ) ( not ( = ?auto_181126 ?auto_181132 ) ) ( not ( = ?auto_181126 ?auto_181129 ) ) ( not ( = ?auto_181127 ?auto_181131 ) ) ( not ( = ?auto_181127 ?auto_181132 ) ) ( not ( = ?auto_181127 ?auto_181129 ) ) ( not ( = ?auto_181128 ?auto_181131 ) ) ( not ( = ?auto_181128 ?auto_181132 ) ) ( not ( = ?auto_181128 ?auto_181129 ) ) ( not ( = ?auto_181133 ?auto_181131 ) ) ( not ( = ?auto_181133 ?auto_181132 ) ) ( not ( = ?auto_181133 ?auto_181129 ) ) ( not ( = ?auto_181134 ?auto_181131 ) ) ( not ( = ?auto_181134 ?auto_181132 ) ) ( not ( = ?auto_181134 ?auto_181129 ) ) ( ON ?auto_181130 ?auto_181134 ) ( CLEAR ?auto_181130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181126 ?auto_181127 ?auto_181128 ?auto_181133 ?auto_181134 )
      ( MAKE-3PILE ?auto_181126 ?auto_181127 ?auto_181128 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181135 - BLOCK
      ?auto_181136 - BLOCK
      ?auto_181137 - BLOCK
    )
    :vars
    (
      ?auto_181140 - BLOCK
      ?auto_181139 - BLOCK
      ?auto_181142 - BLOCK
      ?auto_181141 - BLOCK
      ?auto_181143 - BLOCK
      ?auto_181138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181140 ?auto_181137 ) ( ON-TABLE ?auto_181135 ) ( ON ?auto_181136 ?auto_181135 ) ( ON ?auto_181137 ?auto_181136 ) ( not ( = ?auto_181135 ?auto_181136 ) ) ( not ( = ?auto_181135 ?auto_181137 ) ) ( not ( = ?auto_181135 ?auto_181140 ) ) ( not ( = ?auto_181136 ?auto_181137 ) ) ( not ( = ?auto_181136 ?auto_181140 ) ) ( not ( = ?auto_181137 ?auto_181140 ) ) ( not ( = ?auto_181135 ?auto_181139 ) ) ( not ( = ?auto_181135 ?auto_181142 ) ) ( not ( = ?auto_181136 ?auto_181139 ) ) ( not ( = ?auto_181136 ?auto_181142 ) ) ( not ( = ?auto_181137 ?auto_181139 ) ) ( not ( = ?auto_181137 ?auto_181142 ) ) ( not ( = ?auto_181140 ?auto_181139 ) ) ( not ( = ?auto_181140 ?auto_181142 ) ) ( not ( = ?auto_181139 ?auto_181142 ) ) ( ON ?auto_181139 ?auto_181140 ) ( ON-TABLE ?auto_181141 ) ( ON ?auto_181143 ?auto_181141 ) ( not ( = ?auto_181141 ?auto_181143 ) ) ( not ( = ?auto_181141 ?auto_181138 ) ) ( not ( = ?auto_181141 ?auto_181142 ) ) ( not ( = ?auto_181143 ?auto_181138 ) ) ( not ( = ?auto_181143 ?auto_181142 ) ) ( not ( = ?auto_181138 ?auto_181142 ) ) ( not ( = ?auto_181135 ?auto_181138 ) ) ( not ( = ?auto_181135 ?auto_181141 ) ) ( not ( = ?auto_181135 ?auto_181143 ) ) ( not ( = ?auto_181136 ?auto_181138 ) ) ( not ( = ?auto_181136 ?auto_181141 ) ) ( not ( = ?auto_181136 ?auto_181143 ) ) ( not ( = ?auto_181137 ?auto_181138 ) ) ( not ( = ?auto_181137 ?auto_181141 ) ) ( not ( = ?auto_181137 ?auto_181143 ) ) ( not ( = ?auto_181140 ?auto_181138 ) ) ( not ( = ?auto_181140 ?auto_181141 ) ) ( not ( = ?auto_181140 ?auto_181143 ) ) ( not ( = ?auto_181139 ?auto_181138 ) ) ( not ( = ?auto_181139 ?auto_181141 ) ) ( not ( = ?auto_181139 ?auto_181143 ) ) ( ON ?auto_181142 ?auto_181139 ) ( CLEAR ?auto_181142 ) ( HOLDING ?auto_181138 ) ( CLEAR ?auto_181143 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181141 ?auto_181143 ?auto_181138 )
      ( MAKE-3PILE ?auto_181135 ?auto_181136 ?auto_181137 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181144 - BLOCK
      ?auto_181145 - BLOCK
      ?auto_181146 - BLOCK
    )
    :vars
    (
      ?auto_181150 - BLOCK
      ?auto_181147 - BLOCK
      ?auto_181149 - BLOCK
      ?auto_181148 - BLOCK
      ?auto_181151 - BLOCK
      ?auto_181152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181150 ?auto_181146 ) ( ON-TABLE ?auto_181144 ) ( ON ?auto_181145 ?auto_181144 ) ( ON ?auto_181146 ?auto_181145 ) ( not ( = ?auto_181144 ?auto_181145 ) ) ( not ( = ?auto_181144 ?auto_181146 ) ) ( not ( = ?auto_181144 ?auto_181150 ) ) ( not ( = ?auto_181145 ?auto_181146 ) ) ( not ( = ?auto_181145 ?auto_181150 ) ) ( not ( = ?auto_181146 ?auto_181150 ) ) ( not ( = ?auto_181144 ?auto_181147 ) ) ( not ( = ?auto_181144 ?auto_181149 ) ) ( not ( = ?auto_181145 ?auto_181147 ) ) ( not ( = ?auto_181145 ?auto_181149 ) ) ( not ( = ?auto_181146 ?auto_181147 ) ) ( not ( = ?auto_181146 ?auto_181149 ) ) ( not ( = ?auto_181150 ?auto_181147 ) ) ( not ( = ?auto_181150 ?auto_181149 ) ) ( not ( = ?auto_181147 ?auto_181149 ) ) ( ON ?auto_181147 ?auto_181150 ) ( ON-TABLE ?auto_181148 ) ( ON ?auto_181151 ?auto_181148 ) ( not ( = ?auto_181148 ?auto_181151 ) ) ( not ( = ?auto_181148 ?auto_181152 ) ) ( not ( = ?auto_181148 ?auto_181149 ) ) ( not ( = ?auto_181151 ?auto_181152 ) ) ( not ( = ?auto_181151 ?auto_181149 ) ) ( not ( = ?auto_181152 ?auto_181149 ) ) ( not ( = ?auto_181144 ?auto_181152 ) ) ( not ( = ?auto_181144 ?auto_181148 ) ) ( not ( = ?auto_181144 ?auto_181151 ) ) ( not ( = ?auto_181145 ?auto_181152 ) ) ( not ( = ?auto_181145 ?auto_181148 ) ) ( not ( = ?auto_181145 ?auto_181151 ) ) ( not ( = ?auto_181146 ?auto_181152 ) ) ( not ( = ?auto_181146 ?auto_181148 ) ) ( not ( = ?auto_181146 ?auto_181151 ) ) ( not ( = ?auto_181150 ?auto_181152 ) ) ( not ( = ?auto_181150 ?auto_181148 ) ) ( not ( = ?auto_181150 ?auto_181151 ) ) ( not ( = ?auto_181147 ?auto_181152 ) ) ( not ( = ?auto_181147 ?auto_181148 ) ) ( not ( = ?auto_181147 ?auto_181151 ) ) ( ON ?auto_181149 ?auto_181147 ) ( CLEAR ?auto_181151 ) ( ON ?auto_181152 ?auto_181149 ) ( CLEAR ?auto_181152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181144 ?auto_181145 ?auto_181146 ?auto_181150 ?auto_181147 ?auto_181149 )
      ( MAKE-3PILE ?auto_181144 ?auto_181145 ?auto_181146 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181153 - BLOCK
      ?auto_181154 - BLOCK
      ?auto_181155 - BLOCK
    )
    :vars
    (
      ?auto_181157 - BLOCK
      ?auto_181156 - BLOCK
      ?auto_181161 - BLOCK
      ?auto_181160 - BLOCK
      ?auto_181158 - BLOCK
      ?auto_181159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181157 ?auto_181155 ) ( ON-TABLE ?auto_181153 ) ( ON ?auto_181154 ?auto_181153 ) ( ON ?auto_181155 ?auto_181154 ) ( not ( = ?auto_181153 ?auto_181154 ) ) ( not ( = ?auto_181153 ?auto_181155 ) ) ( not ( = ?auto_181153 ?auto_181157 ) ) ( not ( = ?auto_181154 ?auto_181155 ) ) ( not ( = ?auto_181154 ?auto_181157 ) ) ( not ( = ?auto_181155 ?auto_181157 ) ) ( not ( = ?auto_181153 ?auto_181156 ) ) ( not ( = ?auto_181153 ?auto_181161 ) ) ( not ( = ?auto_181154 ?auto_181156 ) ) ( not ( = ?auto_181154 ?auto_181161 ) ) ( not ( = ?auto_181155 ?auto_181156 ) ) ( not ( = ?auto_181155 ?auto_181161 ) ) ( not ( = ?auto_181157 ?auto_181156 ) ) ( not ( = ?auto_181157 ?auto_181161 ) ) ( not ( = ?auto_181156 ?auto_181161 ) ) ( ON ?auto_181156 ?auto_181157 ) ( ON-TABLE ?auto_181160 ) ( not ( = ?auto_181160 ?auto_181158 ) ) ( not ( = ?auto_181160 ?auto_181159 ) ) ( not ( = ?auto_181160 ?auto_181161 ) ) ( not ( = ?auto_181158 ?auto_181159 ) ) ( not ( = ?auto_181158 ?auto_181161 ) ) ( not ( = ?auto_181159 ?auto_181161 ) ) ( not ( = ?auto_181153 ?auto_181159 ) ) ( not ( = ?auto_181153 ?auto_181160 ) ) ( not ( = ?auto_181153 ?auto_181158 ) ) ( not ( = ?auto_181154 ?auto_181159 ) ) ( not ( = ?auto_181154 ?auto_181160 ) ) ( not ( = ?auto_181154 ?auto_181158 ) ) ( not ( = ?auto_181155 ?auto_181159 ) ) ( not ( = ?auto_181155 ?auto_181160 ) ) ( not ( = ?auto_181155 ?auto_181158 ) ) ( not ( = ?auto_181157 ?auto_181159 ) ) ( not ( = ?auto_181157 ?auto_181160 ) ) ( not ( = ?auto_181157 ?auto_181158 ) ) ( not ( = ?auto_181156 ?auto_181159 ) ) ( not ( = ?auto_181156 ?auto_181160 ) ) ( not ( = ?auto_181156 ?auto_181158 ) ) ( ON ?auto_181161 ?auto_181156 ) ( ON ?auto_181159 ?auto_181161 ) ( CLEAR ?auto_181159 ) ( HOLDING ?auto_181158 ) ( CLEAR ?auto_181160 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181160 ?auto_181158 )
      ( MAKE-3PILE ?auto_181153 ?auto_181154 ?auto_181155 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_183020 - BLOCK
      ?auto_183021 - BLOCK
      ?auto_183022 - BLOCK
    )
    :vars
    (
      ?auto_183027 - BLOCK
      ?auto_183024 - BLOCK
      ?auto_183026 - BLOCK
      ?auto_183023 - BLOCK
      ?auto_183025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183027 ?auto_183022 ) ( ON-TABLE ?auto_183020 ) ( ON ?auto_183021 ?auto_183020 ) ( ON ?auto_183022 ?auto_183021 ) ( not ( = ?auto_183020 ?auto_183021 ) ) ( not ( = ?auto_183020 ?auto_183022 ) ) ( not ( = ?auto_183020 ?auto_183027 ) ) ( not ( = ?auto_183021 ?auto_183022 ) ) ( not ( = ?auto_183021 ?auto_183027 ) ) ( not ( = ?auto_183022 ?auto_183027 ) ) ( not ( = ?auto_183020 ?auto_183024 ) ) ( not ( = ?auto_183020 ?auto_183026 ) ) ( not ( = ?auto_183021 ?auto_183024 ) ) ( not ( = ?auto_183021 ?auto_183026 ) ) ( not ( = ?auto_183022 ?auto_183024 ) ) ( not ( = ?auto_183022 ?auto_183026 ) ) ( not ( = ?auto_183027 ?auto_183024 ) ) ( not ( = ?auto_183027 ?auto_183026 ) ) ( not ( = ?auto_183024 ?auto_183026 ) ) ( ON ?auto_183024 ?auto_183027 ) ( not ( = ?auto_183023 ?auto_183025 ) ) ( not ( = ?auto_183023 ?auto_183026 ) ) ( not ( = ?auto_183025 ?auto_183026 ) ) ( not ( = ?auto_183020 ?auto_183025 ) ) ( not ( = ?auto_183020 ?auto_183023 ) ) ( not ( = ?auto_183021 ?auto_183025 ) ) ( not ( = ?auto_183021 ?auto_183023 ) ) ( not ( = ?auto_183022 ?auto_183025 ) ) ( not ( = ?auto_183022 ?auto_183023 ) ) ( not ( = ?auto_183027 ?auto_183025 ) ) ( not ( = ?auto_183027 ?auto_183023 ) ) ( not ( = ?auto_183024 ?auto_183025 ) ) ( not ( = ?auto_183024 ?auto_183023 ) ) ( ON ?auto_183026 ?auto_183024 ) ( ON ?auto_183025 ?auto_183026 ) ( ON ?auto_183023 ?auto_183025 ) ( CLEAR ?auto_183023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183020 ?auto_183021 ?auto_183022 ?auto_183027 ?auto_183024 ?auto_183026 ?auto_183025 )
      ( MAKE-3PILE ?auto_183020 ?auto_183021 ?auto_183022 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181171 - BLOCK
      ?auto_181172 - BLOCK
      ?auto_181173 - BLOCK
    )
    :vars
    (
      ?auto_181174 - BLOCK
      ?auto_181178 - BLOCK
      ?auto_181179 - BLOCK
      ?auto_181177 - BLOCK
      ?auto_181176 - BLOCK
      ?auto_181175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181174 ?auto_181173 ) ( ON-TABLE ?auto_181171 ) ( ON ?auto_181172 ?auto_181171 ) ( ON ?auto_181173 ?auto_181172 ) ( not ( = ?auto_181171 ?auto_181172 ) ) ( not ( = ?auto_181171 ?auto_181173 ) ) ( not ( = ?auto_181171 ?auto_181174 ) ) ( not ( = ?auto_181172 ?auto_181173 ) ) ( not ( = ?auto_181172 ?auto_181174 ) ) ( not ( = ?auto_181173 ?auto_181174 ) ) ( not ( = ?auto_181171 ?auto_181178 ) ) ( not ( = ?auto_181171 ?auto_181179 ) ) ( not ( = ?auto_181172 ?auto_181178 ) ) ( not ( = ?auto_181172 ?auto_181179 ) ) ( not ( = ?auto_181173 ?auto_181178 ) ) ( not ( = ?auto_181173 ?auto_181179 ) ) ( not ( = ?auto_181174 ?auto_181178 ) ) ( not ( = ?auto_181174 ?auto_181179 ) ) ( not ( = ?auto_181178 ?auto_181179 ) ) ( ON ?auto_181178 ?auto_181174 ) ( not ( = ?auto_181177 ?auto_181176 ) ) ( not ( = ?auto_181177 ?auto_181175 ) ) ( not ( = ?auto_181177 ?auto_181179 ) ) ( not ( = ?auto_181176 ?auto_181175 ) ) ( not ( = ?auto_181176 ?auto_181179 ) ) ( not ( = ?auto_181175 ?auto_181179 ) ) ( not ( = ?auto_181171 ?auto_181175 ) ) ( not ( = ?auto_181171 ?auto_181177 ) ) ( not ( = ?auto_181171 ?auto_181176 ) ) ( not ( = ?auto_181172 ?auto_181175 ) ) ( not ( = ?auto_181172 ?auto_181177 ) ) ( not ( = ?auto_181172 ?auto_181176 ) ) ( not ( = ?auto_181173 ?auto_181175 ) ) ( not ( = ?auto_181173 ?auto_181177 ) ) ( not ( = ?auto_181173 ?auto_181176 ) ) ( not ( = ?auto_181174 ?auto_181175 ) ) ( not ( = ?auto_181174 ?auto_181177 ) ) ( not ( = ?auto_181174 ?auto_181176 ) ) ( not ( = ?auto_181178 ?auto_181175 ) ) ( not ( = ?auto_181178 ?auto_181177 ) ) ( not ( = ?auto_181178 ?auto_181176 ) ) ( ON ?auto_181179 ?auto_181178 ) ( ON ?auto_181175 ?auto_181179 ) ( ON ?auto_181176 ?auto_181175 ) ( CLEAR ?auto_181176 ) ( HOLDING ?auto_181177 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_181177 )
      ( MAKE-3PILE ?auto_181171 ?auto_181172 ?auto_181173 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_181180 - BLOCK
      ?auto_181181 - BLOCK
      ?auto_181182 - BLOCK
    )
    :vars
    (
      ?auto_181183 - BLOCK
      ?auto_181184 - BLOCK
      ?auto_181185 - BLOCK
      ?auto_181187 - BLOCK
      ?auto_181188 - BLOCK
      ?auto_181186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181183 ?auto_181182 ) ( ON-TABLE ?auto_181180 ) ( ON ?auto_181181 ?auto_181180 ) ( ON ?auto_181182 ?auto_181181 ) ( not ( = ?auto_181180 ?auto_181181 ) ) ( not ( = ?auto_181180 ?auto_181182 ) ) ( not ( = ?auto_181180 ?auto_181183 ) ) ( not ( = ?auto_181181 ?auto_181182 ) ) ( not ( = ?auto_181181 ?auto_181183 ) ) ( not ( = ?auto_181182 ?auto_181183 ) ) ( not ( = ?auto_181180 ?auto_181184 ) ) ( not ( = ?auto_181180 ?auto_181185 ) ) ( not ( = ?auto_181181 ?auto_181184 ) ) ( not ( = ?auto_181181 ?auto_181185 ) ) ( not ( = ?auto_181182 ?auto_181184 ) ) ( not ( = ?auto_181182 ?auto_181185 ) ) ( not ( = ?auto_181183 ?auto_181184 ) ) ( not ( = ?auto_181183 ?auto_181185 ) ) ( not ( = ?auto_181184 ?auto_181185 ) ) ( ON ?auto_181184 ?auto_181183 ) ( not ( = ?auto_181187 ?auto_181188 ) ) ( not ( = ?auto_181187 ?auto_181186 ) ) ( not ( = ?auto_181187 ?auto_181185 ) ) ( not ( = ?auto_181188 ?auto_181186 ) ) ( not ( = ?auto_181188 ?auto_181185 ) ) ( not ( = ?auto_181186 ?auto_181185 ) ) ( not ( = ?auto_181180 ?auto_181186 ) ) ( not ( = ?auto_181180 ?auto_181187 ) ) ( not ( = ?auto_181180 ?auto_181188 ) ) ( not ( = ?auto_181181 ?auto_181186 ) ) ( not ( = ?auto_181181 ?auto_181187 ) ) ( not ( = ?auto_181181 ?auto_181188 ) ) ( not ( = ?auto_181182 ?auto_181186 ) ) ( not ( = ?auto_181182 ?auto_181187 ) ) ( not ( = ?auto_181182 ?auto_181188 ) ) ( not ( = ?auto_181183 ?auto_181186 ) ) ( not ( = ?auto_181183 ?auto_181187 ) ) ( not ( = ?auto_181183 ?auto_181188 ) ) ( not ( = ?auto_181184 ?auto_181186 ) ) ( not ( = ?auto_181184 ?auto_181187 ) ) ( not ( = ?auto_181184 ?auto_181188 ) ) ( ON ?auto_181185 ?auto_181184 ) ( ON ?auto_181186 ?auto_181185 ) ( ON ?auto_181188 ?auto_181186 ) ( ON ?auto_181187 ?auto_181188 ) ( CLEAR ?auto_181187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_181180 ?auto_181181 ?auto_181182 ?auto_181183 ?auto_181184 ?auto_181185 ?auto_181186 ?auto_181188 )
      ( MAKE-3PILE ?auto_181180 ?auto_181181 ?auto_181182 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_181195 - BLOCK
      ?auto_181196 - BLOCK
      ?auto_181197 - BLOCK
      ?auto_181198 - BLOCK
      ?auto_181199 - BLOCK
      ?auto_181200 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_181200 ) ( CLEAR ?auto_181199 ) ( ON-TABLE ?auto_181195 ) ( ON ?auto_181196 ?auto_181195 ) ( ON ?auto_181197 ?auto_181196 ) ( ON ?auto_181198 ?auto_181197 ) ( ON ?auto_181199 ?auto_181198 ) ( not ( = ?auto_181195 ?auto_181196 ) ) ( not ( = ?auto_181195 ?auto_181197 ) ) ( not ( = ?auto_181195 ?auto_181198 ) ) ( not ( = ?auto_181195 ?auto_181199 ) ) ( not ( = ?auto_181195 ?auto_181200 ) ) ( not ( = ?auto_181196 ?auto_181197 ) ) ( not ( = ?auto_181196 ?auto_181198 ) ) ( not ( = ?auto_181196 ?auto_181199 ) ) ( not ( = ?auto_181196 ?auto_181200 ) ) ( not ( = ?auto_181197 ?auto_181198 ) ) ( not ( = ?auto_181197 ?auto_181199 ) ) ( not ( = ?auto_181197 ?auto_181200 ) ) ( not ( = ?auto_181198 ?auto_181199 ) ) ( not ( = ?auto_181198 ?auto_181200 ) ) ( not ( = ?auto_181199 ?auto_181200 ) ) )
    :subtasks
    ( ( !STACK ?auto_181200 ?auto_181199 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_181201 - BLOCK
      ?auto_181202 - BLOCK
      ?auto_181203 - BLOCK
      ?auto_181204 - BLOCK
      ?auto_181205 - BLOCK
      ?auto_181206 - BLOCK
    )
    :vars
    (
      ?auto_181207 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_181205 ) ( ON-TABLE ?auto_181201 ) ( ON ?auto_181202 ?auto_181201 ) ( ON ?auto_181203 ?auto_181202 ) ( ON ?auto_181204 ?auto_181203 ) ( ON ?auto_181205 ?auto_181204 ) ( not ( = ?auto_181201 ?auto_181202 ) ) ( not ( = ?auto_181201 ?auto_181203 ) ) ( not ( = ?auto_181201 ?auto_181204 ) ) ( not ( = ?auto_181201 ?auto_181205 ) ) ( not ( = ?auto_181201 ?auto_181206 ) ) ( not ( = ?auto_181202 ?auto_181203 ) ) ( not ( = ?auto_181202 ?auto_181204 ) ) ( not ( = ?auto_181202 ?auto_181205 ) ) ( not ( = ?auto_181202 ?auto_181206 ) ) ( not ( = ?auto_181203 ?auto_181204 ) ) ( not ( = ?auto_181203 ?auto_181205 ) ) ( not ( = ?auto_181203 ?auto_181206 ) ) ( not ( = ?auto_181204 ?auto_181205 ) ) ( not ( = ?auto_181204 ?auto_181206 ) ) ( not ( = ?auto_181205 ?auto_181206 ) ) ( ON ?auto_181206 ?auto_181207 ) ( CLEAR ?auto_181206 ) ( HAND-EMPTY ) ( not ( = ?auto_181201 ?auto_181207 ) ) ( not ( = ?auto_181202 ?auto_181207 ) ) ( not ( = ?auto_181203 ?auto_181207 ) ) ( not ( = ?auto_181204 ?auto_181207 ) ) ( not ( = ?auto_181205 ?auto_181207 ) ) ( not ( = ?auto_181206 ?auto_181207 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_181206 ?auto_181207 )
      ( MAKE-6PILE ?auto_181201 ?auto_181202 ?auto_181203 ?auto_181204 ?auto_181205 ?auto_181206 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_181208 - BLOCK
      ?auto_181209 - BLOCK
      ?auto_181210 - BLOCK
      ?auto_181211 - BLOCK
      ?auto_181212 - BLOCK
      ?auto_181213 - BLOCK
    )
    :vars
    (
      ?auto_181214 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181208 ) ( ON ?auto_181209 ?auto_181208 ) ( ON ?auto_181210 ?auto_181209 ) ( ON ?auto_181211 ?auto_181210 ) ( not ( = ?auto_181208 ?auto_181209 ) ) ( not ( = ?auto_181208 ?auto_181210 ) ) ( not ( = ?auto_181208 ?auto_181211 ) ) ( not ( = ?auto_181208 ?auto_181212 ) ) ( not ( = ?auto_181208 ?auto_181213 ) ) ( not ( = ?auto_181209 ?auto_181210 ) ) ( not ( = ?auto_181209 ?auto_181211 ) ) ( not ( = ?auto_181209 ?auto_181212 ) ) ( not ( = ?auto_181209 ?auto_181213 ) ) ( not ( = ?auto_181210 ?auto_181211 ) ) ( not ( = ?auto_181210 ?auto_181212 ) ) ( not ( = ?auto_181210 ?auto_181213 ) ) ( not ( = ?auto_181211 ?auto_181212 ) ) ( not ( = ?auto_181211 ?auto_181213 ) ) ( not ( = ?auto_181212 ?auto_181213 ) ) ( ON ?auto_181213 ?auto_181214 ) ( CLEAR ?auto_181213 ) ( not ( = ?auto_181208 ?auto_181214 ) ) ( not ( = ?auto_181209 ?auto_181214 ) ) ( not ( = ?auto_181210 ?auto_181214 ) ) ( not ( = ?auto_181211 ?auto_181214 ) ) ( not ( = ?auto_181212 ?auto_181214 ) ) ( not ( = ?auto_181213 ?auto_181214 ) ) ( HOLDING ?auto_181212 ) ( CLEAR ?auto_181211 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181208 ?auto_181209 ?auto_181210 ?auto_181211 ?auto_181212 )
      ( MAKE-6PILE ?auto_181208 ?auto_181209 ?auto_181210 ?auto_181211 ?auto_181212 ?auto_181213 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_181215 - BLOCK
      ?auto_181216 - BLOCK
      ?auto_181217 - BLOCK
      ?auto_181218 - BLOCK
      ?auto_181219 - BLOCK
      ?auto_181220 - BLOCK
    )
    :vars
    (
      ?auto_181221 - BLOCK
      ?auto_181222 - BLOCK
      ?auto_181223 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181215 ) ( ON ?auto_181216 ?auto_181215 ) ( ON ?auto_181217 ?auto_181216 ) ( ON ?auto_181218 ?auto_181217 ) ( not ( = ?auto_181215 ?auto_181216 ) ) ( not ( = ?auto_181215 ?auto_181217 ) ) ( not ( = ?auto_181215 ?auto_181218 ) ) ( not ( = ?auto_181215 ?auto_181219 ) ) ( not ( = ?auto_181215 ?auto_181220 ) ) ( not ( = ?auto_181216 ?auto_181217 ) ) ( not ( = ?auto_181216 ?auto_181218 ) ) ( not ( = ?auto_181216 ?auto_181219 ) ) ( not ( = ?auto_181216 ?auto_181220 ) ) ( not ( = ?auto_181217 ?auto_181218 ) ) ( not ( = ?auto_181217 ?auto_181219 ) ) ( not ( = ?auto_181217 ?auto_181220 ) ) ( not ( = ?auto_181218 ?auto_181219 ) ) ( not ( = ?auto_181218 ?auto_181220 ) ) ( not ( = ?auto_181219 ?auto_181220 ) ) ( ON ?auto_181220 ?auto_181221 ) ( not ( = ?auto_181215 ?auto_181221 ) ) ( not ( = ?auto_181216 ?auto_181221 ) ) ( not ( = ?auto_181217 ?auto_181221 ) ) ( not ( = ?auto_181218 ?auto_181221 ) ) ( not ( = ?auto_181219 ?auto_181221 ) ) ( not ( = ?auto_181220 ?auto_181221 ) ) ( CLEAR ?auto_181218 ) ( ON ?auto_181219 ?auto_181220 ) ( CLEAR ?auto_181219 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_181222 ) ( ON ?auto_181223 ?auto_181222 ) ( ON ?auto_181221 ?auto_181223 ) ( not ( = ?auto_181222 ?auto_181223 ) ) ( not ( = ?auto_181222 ?auto_181221 ) ) ( not ( = ?auto_181222 ?auto_181220 ) ) ( not ( = ?auto_181222 ?auto_181219 ) ) ( not ( = ?auto_181223 ?auto_181221 ) ) ( not ( = ?auto_181223 ?auto_181220 ) ) ( not ( = ?auto_181223 ?auto_181219 ) ) ( not ( = ?auto_181215 ?auto_181222 ) ) ( not ( = ?auto_181215 ?auto_181223 ) ) ( not ( = ?auto_181216 ?auto_181222 ) ) ( not ( = ?auto_181216 ?auto_181223 ) ) ( not ( = ?auto_181217 ?auto_181222 ) ) ( not ( = ?auto_181217 ?auto_181223 ) ) ( not ( = ?auto_181218 ?auto_181222 ) ) ( not ( = ?auto_181218 ?auto_181223 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181222 ?auto_181223 ?auto_181221 ?auto_181220 )
      ( MAKE-6PILE ?auto_181215 ?auto_181216 ?auto_181217 ?auto_181218 ?auto_181219 ?auto_181220 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_181224 - BLOCK
      ?auto_181225 - BLOCK
      ?auto_181226 - BLOCK
      ?auto_181227 - BLOCK
      ?auto_181228 - BLOCK
      ?auto_181229 - BLOCK
    )
    :vars
    (
      ?auto_181232 - BLOCK
      ?auto_181231 - BLOCK
      ?auto_181230 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181224 ) ( ON ?auto_181225 ?auto_181224 ) ( ON ?auto_181226 ?auto_181225 ) ( not ( = ?auto_181224 ?auto_181225 ) ) ( not ( = ?auto_181224 ?auto_181226 ) ) ( not ( = ?auto_181224 ?auto_181227 ) ) ( not ( = ?auto_181224 ?auto_181228 ) ) ( not ( = ?auto_181224 ?auto_181229 ) ) ( not ( = ?auto_181225 ?auto_181226 ) ) ( not ( = ?auto_181225 ?auto_181227 ) ) ( not ( = ?auto_181225 ?auto_181228 ) ) ( not ( = ?auto_181225 ?auto_181229 ) ) ( not ( = ?auto_181226 ?auto_181227 ) ) ( not ( = ?auto_181226 ?auto_181228 ) ) ( not ( = ?auto_181226 ?auto_181229 ) ) ( not ( = ?auto_181227 ?auto_181228 ) ) ( not ( = ?auto_181227 ?auto_181229 ) ) ( not ( = ?auto_181228 ?auto_181229 ) ) ( ON ?auto_181229 ?auto_181232 ) ( not ( = ?auto_181224 ?auto_181232 ) ) ( not ( = ?auto_181225 ?auto_181232 ) ) ( not ( = ?auto_181226 ?auto_181232 ) ) ( not ( = ?auto_181227 ?auto_181232 ) ) ( not ( = ?auto_181228 ?auto_181232 ) ) ( not ( = ?auto_181229 ?auto_181232 ) ) ( ON ?auto_181228 ?auto_181229 ) ( CLEAR ?auto_181228 ) ( ON-TABLE ?auto_181231 ) ( ON ?auto_181230 ?auto_181231 ) ( ON ?auto_181232 ?auto_181230 ) ( not ( = ?auto_181231 ?auto_181230 ) ) ( not ( = ?auto_181231 ?auto_181232 ) ) ( not ( = ?auto_181231 ?auto_181229 ) ) ( not ( = ?auto_181231 ?auto_181228 ) ) ( not ( = ?auto_181230 ?auto_181232 ) ) ( not ( = ?auto_181230 ?auto_181229 ) ) ( not ( = ?auto_181230 ?auto_181228 ) ) ( not ( = ?auto_181224 ?auto_181231 ) ) ( not ( = ?auto_181224 ?auto_181230 ) ) ( not ( = ?auto_181225 ?auto_181231 ) ) ( not ( = ?auto_181225 ?auto_181230 ) ) ( not ( = ?auto_181226 ?auto_181231 ) ) ( not ( = ?auto_181226 ?auto_181230 ) ) ( not ( = ?auto_181227 ?auto_181231 ) ) ( not ( = ?auto_181227 ?auto_181230 ) ) ( HOLDING ?auto_181227 ) ( CLEAR ?auto_181226 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181224 ?auto_181225 ?auto_181226 ?auto_181227 )
      ( MAKE-6PILE ?auto_181224 ?auto_181225 ?auto_181226 ?auto_181227 ?auto_181228 ?auto_181229 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_181233 - BLOCK
      ?auto_181234 - BLOCK
      ?auto_181235 - BLOCK
      ?auto_181236 - BLOCK
      ?auto_181237 - BLOCK
      ?auto_181238 - BLOCK
    )
    :vars
    (
      ?auto_181241 - BLOCK
      ?auto_181239 - BLOCK
      ?auto_181240 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181233 ) ( ON ?auto_181234 ?auto_181233 ) ( ON ?auto_181235 ?auto_181234 ) ( not ( = ?auto_181233 ?auto_181234 ) ) ( not ( = ?auto_181233 ?auto_181235 ) ) ( not ( = ?auto_181233 ?auto_181236 ) ) ( not ( = ?auto_181233 ?auto_181237 ) ) ( not ( = ?auto_181233 ?auto_181238 ) ) ( not ( = ?auto_181234 ?auto_181235 ) ) ( not ( = ?auto_181234 ?auto_181236 ) ) ( not ( = ?auto_181234 ?auto_181237 ) ) ( not ( = ?auto_181234 ?auto_181238 ) ) ( not ( = ?auto_181235 ?auto_181236 ) ) ( not ( = ?auto_181235 ?auto_181237 ) ) ( not ( = ?auto_181235 ?auto_181238 ) ) ( not ( = ?auto_181236 ?auto_181237 ) ) ( not ( = ?auto_181236 ?auto_181238 ) ) ( not ( = ?auto_181237 ?auto_181238 ) ) ( ON ?auto_181238 ?auto_181241 ) ( not ( = ?auto_181233 ?auto_181241 ) ) ( not ( = ?auto_181234 ?auto_181241 ) ) ( not ( = ?auto_181235 ?auto_181241 ) ) ( not ( = ?auto_181236 ?auto_181241 ) ) ( not ( = ?auto_181237 ?auto_181241 ) ) ( not ( = ?auto_181238 ?auto_181241 ) ) ( ON ?auto_181237 ?auto_181238 ) ( ON-TABLE ?auto_181239 ) ( ON ?auto_181240 ?auto_181239 ) ( ON ?auto_181241 ?auto_181240 ) ( not ( = ?auto_181239 ?auto_181240 ) ) ( not ( = ?auto_181239 ?auto_181241 ) ) ( not ( = ?auto_181239 ?auto_181238 ) ) ( not ( = ?auto_181239 ?auto_181237 ) ) ( not ( = ?auto_181240 ?auto_181241 ) ) ( not ( = ?auto_181240 ?auto_181238 ) ) ( not ( = ?auto_181240 ?auto_181237 ) ) ( not ( = ?auto_181233 ?auto_181239 ) ) ( not ( = ?auto_181233 ?auto_181240 ) ) ( not ( = ?auto_181234 ?auto_181239 ) ) ( not ( = ?auto_181234 ?auto_181240 ) ) ( not ( = ?auto_181235 ?auto_181239 ) ) ( not ( = ?auto_181235 ?auto_181240 ) ) ( not ( = ?auto_181236 ?auto_181239 ) ) ( not ( = ?auto_181236 ?auto_181240 ) ) ( CLEAR ?auto_181235 ) ( ON ?auto_181236 ?auto_181237 ) ( CLEAR ?auto_181236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181239 ?auto_181240 ?auto_181241 ?auto_181238 ?auto_181237 )
      ( MAKE-6PILE ?auto_181233 ?auto_181234 ?auto_181235 ?auto_181236 ?auto_181237 ?auto_181238 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_181242 - BLOCK
      ?auto_181243 - BLOCK
      ?auto_181244 - BLOCK
      ?auto_181245 - BLOCK
      ?auto_181246 - BLOCK
      ?auto_181247 - BLOCK
    )
    :vars
    (
      ?auto_181248 - BLOCK
      ?auto_181250 - BLOCK
      ?auto_181249 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181242 ) ( ON ?auto_181243 ?auto_181242 ) ( not ( = ?auto_181242 ?auto_181243 ) ) ( not ( = ?auto_181242 ?auto_181244 ) ) ( not ( = ?auto_181242 ?auto_181245 ) ) ( not ( = ?auto_181242 ?auto_181246 ) ) ( not ( = ?auto_181242 ?auto_181247 ) ) ( not ( = ?auto_181243 ?auto_181244 ) ) ( not ( = ?auto_181243 ?auto_181245 ) ) ( not ( = ?auto_181243 ?auto_181246 ) ) ( not ( = ?auto_181243 ?auto_181247 ) ) ( not ( = ?auto_181244 ?auto_181245 ) ) ( not ( = ?auto_181244 ?auto_181246 ) ) ( not ( = ?auto_181244 ?auto_181247 ) ) ( not ( = ?auto_181245 ?auto_181246 ) ) ( not ( = ?auto_181245 ?auto_181247 ) ) ( not ( = ?auto_181246 ?auto_181247 ) ) ( ON ?auto_181247 ?auto_181248 ) ( not ( = ?auto_181242 ?auto_181248 ) ) ( not ( = ?auto_181243 ?auto_181248 ) ) ( not ( = ?auto_181244 ?auto_181248 ) ) ( not ( = ?auto_181245 ?auto_181248 ) ) ( not ( = ?auto_181246 ?auto_181248 ) ) ( not ( = ?auto_181247 ?auto_181248 ) ) ( ON ?auto_181246 ?auto_181247 ) ( ON-TABLE ?auto_181250 ) ( ON ?auto_181249 ?auto_181250 ) ( ON ?auto_181248 ?auto_181249 ) ( not ( = ?auto_181250 ?auto_181249 ) ) ( not ( = ?auto_181250 ?auto_181248 ) ) ( not ( = ?auto_181250 ?auto_181247 ) ) ( not ( = ?auto_181250 ?auto_181246 ) ) ( not ( = ?auto_181249 ?auto_181248 ) ) ( not ( = ?auto_181249 ?auto_181247 ) ) ( not ( = ?auto_181249 ?auto_181246 ) ) ( not ( = ?auto_181242 ?auto_181250 ) ) ( not ( = ?auto_181242 ?auto_181249 ) ) ( not ( = ?auto_181243 ?auto_181250 ) ) ( not ( = ?auto_181243 ?auto_181249 ) ) ( not ( = ?auto_181244 ?auto_181250 ) ) ( not ( = ?auto_181244 ?auto_181249 ) ) ( not ( = ?auto_181245 ?auto_181250 ) ) ( not ( = ?auto_181245 ?auto_181249 ) ) ( ON ?auto_181245 ?auto_181246 ) ( CLEAR ?auto_181245 ) ( HOLDING ?auto_181244 ) ( CLEAR ?auto_181243 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181242 ?auto_181243 ?auto_181244 )
      ( MAKE-6PILE ?auto_181242 ?auto_181243 ?auto_181244 ?auto_181245 ?auto_181246 ?auto_181247 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_181251 - BLOCK
      ?auto_181252 - BLOCK
      ?auto_181253 - BLOCK
      ?auto_181254 - BLOCK
      ?auto_181255 - BLOCK
      ?auto_181256 - BLOCK
    )
    :vars
    (
      ?auto_181258 - BLOCK
      ?auto_181259 - BLOCK
      ?auto_181257 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181251 ) ( ON ?auto_181252 ?auto_181251 ) ( not ( = ?auto_181251 ?auto_181252 ) ) ( not ( = ?auto_181251 ?auto_181253 ) ) ( not ( = ?auto_181251 ?auto_181254 ) ) ( not ( = ?auto_181251 ?auto_181255 ) ) ( not ( = ?auto_181251 ?auto_181256 ) ) ( not ( = ?auto_181252 ?auto_181253 ) ) ( not ( = ?auto_181252 ?auto_181254 ) ) ( not ( = ?auto_181252 ?auto_181255 ) ) ( not ( = ?auto_181252 ?auto_181256 ) ) ( not ( = ?auto_181253 ?auto_181254 ) ) ( not ( = ?auto_181253 ?auto_181255 ) ) ( not ( = ?auto_181253 ?auto_181256 ) ) ( not ( = ?auto_181254 ?auto_181255 ) ) ( not ( = ?auto_181254 ?auto_181256 ) ) ( not ( = ?auto_181255 ?auto_181256 ) ) ( ON ?auto_181256 ?auto_181258 ) ( not ( = ?auto_181251 ?auto_181258 ) ) ( not ( = ?auto_181252 ?auto_181258 ) ) ( not ( = ?auto_181253 ?auto_181258 ) ) ( not ( = ?auto_181254 ?auto_181258 ) ) ( not ( = ?auto_181255 ?auto_181258 ) ) ( not ( = ?auto_181256 ?auto_181258 ) ) ( ON ?auto_181255 ?auto_181256 ) ( ON-TABLE ?auto_181259 ) ( ON ?auto_181257 ?auto_181259 ) ( ON ?auto_181258 ?auto_181257 ) ( not ( = ?auto_181259 ?auto_181257 ) ) ( not ( = ?auto_181259 ?auto_181258 ) ) ( not ( = ?auto_181259 ?auto_181256 ) ) ( not ( = ?auto_181259 ?auto_181255 ) ) ( not ( = ?auto_181257 ?auto_181258 ) ) ( not ( = ?auto_181257 ?auto_181256 ) ) ( not ( = ?auto_181257 ?auto_181255 ) ) ( not ( = ?auto_181251 ?auto_181259 ) ) ( not ( = ?auto_181251 ?auto_181257 ) ) ( not ( = ?auto_181252 ?auto_181259 ) ) ( not ( = ?auto_181252 ?auto_181257 ) ) ( not ( = ?auto_181253 ?auto_181259 ) ) ( not ( = ?auto_181253 ?auto_181257 ) ) ( not ( = ?auto_181254 ?auto_181259 ) ) ( not ( = ?auto_181254 ?auto_181257 ) ) ( ON ?auto_181254 ?auto_181255 ) ( CLEAR ?auto_181252 ) ( ON ?auto_181253 ?auto_181254 ) ( CLEAR ?auto_181253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181259 ?auto_181257 ?auto_181258 ?auto_181256 ?auto_181255 ?auto_181254 )
      ( MAKE-6PILE ?auto_181251 ?auto_181252 ?auto_181253 ?auto_181254 ?auto_181255 ?auto_181256 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_181260 - BLOCK
      ?auto_181261 - BLOCK
      ?auto_181262 - BLOCK
      ?auto_181263 - BLOCK
      ?auto_181264 - BLOCK
      ?auto_181265 - BLOCK
    )
    :vars
    (
      ?auto_181268 - BLOCK
      ?auto_181266 - BLOCK
      ?auto_181267 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181260 ) ( not ( = ?auto_181260 ?auto_181261 ) ) ( not ( = ?auto_181260 ?auto_181262 ) ) ( not ( = ?auto_181260 ?auto_181263 ) ) ( not ( = ?auto_181260 ?auto_181264 ) ) ( not ( = ?auto_181260 ?auto_181265 ) ) ( not ( = ?auto_181261 ?auto_181262 ) ) ( not ( = ?auto_181261 ?auto_181263 ) ) ( not ( = ?auto_181261 ?auto_181264 ) ) ( not ( = ?auto_181261 ?auto_181265 ) ) ( not ( = ?auto_181262 ?auto_181263 ) ) ( not ( = ?auto_181262 ?auto_181264 ) ) ( not ( = ?auto_181262 ?auto_181265 ) ) ( not ( = ?auto_181263 ?auto_181264 ) ) ( not ( = ?auto_181263 ?auto_181265 ) ) ( not ( = ?auto_181264 ?auto_181265 ) ) ( ON ?auto_181265 ?auto_181268 ) ( not ( = ?auto_181260 ?auto_181268 ) ) ( not ( = ?auto_181261 ?auto_181268 ) ) ( not ( = ?auto_181262 ?auto_181268 ) ) ( not ( = ?auto_181263 ?auto_181268 ) ) ( not ( = ?auto_181264 ?auto_181268 ) ) ( not ( = ?auto_181265 ?auto_181268 ) ) ( ON ?auto_181264 ?auto_181265 ) ( ON-TABLE ?auto_181266 ) ( ON ?auto_181267 ?auto_181266 ) ( ON ?auto_181268 ?auto_181267 ) ( not ( = ?auto_181266 ?auto_181267 ) ) ( not ( = ?auto_181266 ?auto_181268 ) ) ( not ( = ?auto_181266 ?auto_181265 ) ) ( not ( = ?auto_181266 ?auto_181264 ) ) ( not ( = ?auto_181267 ?auto_181268 ) ) ( not ( = ?auto_181267 ?auto_181265 ) ) ( not ( = ?auto_181267 ?auto_181264 ) ) ( not ( = ?auto_181260 ?auto_181266 ) ) ( not ( = ?auto_181260 ?auto_181267 ) ) ( not ( = ?auto_181261 ?auto_181266 ) ) ( not ( = ?auto_181261 ?auto_181267 ) ) ( not ( = ?auto_181262 ?auto_181266 ) ) ( not ( = ?auto_181262 ?auto_181267 ) ) ( not ( = ?auto_181263 ?auto_181266 ) ) ( not ( = ?auto_181263 ?auto_181267 ) ) ( ON ?auto_181263 ?auto_181264 ) ( ON ?auto_181262 ?auto_181263 ) ( CLEAR ?auto_181262 ) ( HOLDING ?auto_181261 ) ( CLEAR ?auto_181260 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181260 ?auto_181261 )
      ( MAKE-6PILE ?auto_181260 ?auto_181261 ?auto_181262 ?auto_181263 ?auto_181264 ?auto_181265 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_181269 - BLOCK
      ?auto_181270 - BLOCK
      ?auto_181271 - BLOCK
      ?auto_181272 - BLOCK
      ?auto_181273 - BLOCK
      ?auto_181274 - BLOCK
    )
    :vars
    (
      ?auto_181277 - BLOCK
      ?auto_181276 - BLOCK
      ?auto_181275 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181269 ) ( not ( = ?auto_181269 ?auto_181270 ) ) ( not ( = ?auto_181269 ?auto_181271 ) ) ( not ( = ?auto_181269 ?auto_181272 ) ) ( not ( = ?auto_181269 ?auto_181273 ) ) ( not ( = ?auto_181269 ?auto_181274 ) ) ( not ( = ?auto_181270 ?auto_181271 ) ) ( not ( = ?auto_181270 ?auto_181272 ) ) ( not ( = ?auto_181270 ?auto_181273 ) ) ( not ( = ?auto_181270 ?auto_181274 ) ) ( not ( = ?auto_181271 ?auto_181272 ) ) ( not ( = ?auto_181271 ?auto_181273 ) ) ( not ( = ?auto_181271 ?auto_181274 ) ) ( not ( = ?auto_181272 ?auto_181273 ) ) ( not ( = ?auto_181272 ?auto_181274 ) ) ( not ( = ?auto_181273 ?auto_181274 ) ) ( ON ?auto_181274 ?auto_181277 ) ( not ( = ?auto_181269 ?auto_181277 ) ) ( not ( = ?auto_181270 ?auto_181277 ) ) ( not ( = ?auto_181271 ?auto_181277 ) ) ( not ( = ?auto_181272 ?auto_181277 ) ) ( not ( = ?auto_181273 ?auto_181277 ) ) ( not ( = ?auto_181274 ?auto_181277 ) ) ( ON ?auto_181273 ?auto_181274 ) ( ON-TABLE ?auto_181276 ) ( ON ?auto_181275 ?auto_181276 ) ( ON ?auto_181277 ?auto_181275 ) ( not ( = ?auto_181276 ?auto_181275 ) ) ( not ( = ?auto_181276 ?auto_181277 ) ) ( not ( = ?auto_181276 ?auto_181274 ) ) ( not ( = ?auto_181276 ?auto_181273 ) ) ( not ( = ?auto_181275 ?auto_181277 ) ) ( not ( = ?auto_181275 ?auto_181274 ) ) ( not ( = ?auto_181275 ?auto_181273 ) ) ( not ( = ?auto_181269 ?auto_181276 ) ) ( not ( = ?auto_181269 ?auto_181275 ) ) ( not ( = ?auto_181270 ?auto_181276 ) ) ( not ( = ?auto_181270 ?auto_181275 ) ) ( not ( = ?auto_181271 ?auto_181276 ) ) ( not ( = ?auto_181271 ?auto_181275 ) ) ( not ( = ?auto_181272 ?auto_181276 ) ) ( not ( = ?auto_181272 ?auto_181275 ) ) ( ON ?auto_181272 ?auto_181273 ) ( ON ?auto_181271 ?auto_181272 ) ( CLEAR ?auto_181269 ) ( ON ?auto_181270 ?auto_181271 ) ( CLEAR ?auto_181270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181276 ?auto_181275 ?auto_181277 ?auto_181274 ?auto_181273 ?auto_181272 ?auto_181271 )
      ( MAKE-6PILE ?auto_181269 ?auto_181270 ?auto_181271 ?auto_181272 ?auto_181273 ?auto_181274 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_181278 - BLOCK
      ?auto_181279 - BLOCK
      ?auto_181280 - BLOCK
      ?auto_181281 - BLOCK
      ?auto_181282 - BLOCK
      ?auto_181283 - BLOCK
    )
    :vars
    (
      ?auto_181286 - BLOCK
      ?auto_181285 - BLOCK
      ?auto_181284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181278 ?auto_181279 ) ) ( not ( = ?auto_181278 ?auto_181280 ) ) ( not ( = ?auto_181278 ?auto_181281 ) ) ( not ( = ?auto_181278 ?auto_181282 ) ) ( not ( = ?auto_181278 ?auto_181283 ) ) ( not ( = ?auto_181279 ?auto_181280 ) ) ( not ( = ?auto_181279 ?auto_181281 ) ) ( not ( = ?auto_181279 ?auto_181282 ) ) ( not ( = ?auto_181279 ?auto_181283 ) ) ( not ( = ?auto_181280 ?auto_181281 ) ) ( not ( = ?auto_181280 ?auto_181282 ) ) ( not ( = ?auto_181280 ?auto_181283 ) ) ( not ( = ?auto_181281 ?auto_181282 ) ) ( not ( = ?auto_181281 ?auto_181283 ) ) ( not ( = ?auto_181282 ?auto_181283 ) ) ( ON ?auto_181283 ?auto_181286 ) ( not ( = ?auto_181278 ?auto_181286 ) ) ( not ( = ?auto_181279 ?auto_181286 ) ) ( not ( = ?auto_181280 ?auto_181286 ) ) ( not ( = ?auto_181281 ?auto_181286 ) ) ( not ( = ?auto_181282 ?auto_181286 ) ) ( not ( = ?auto_181283 ?auto_181286 ) ) ( ON ?auto_181282 ?auto_181283 ) ( ON-TABLE ?auto_181285 ) ( ON ?auto_181284 ?auto_181285 ) ( ON ?auto_181286 ?auto_181284 ) ( not ( = ?auto_181285 ?auto_181284 ) ) ( not ( = ?auto_181285 ?auto_181286 ) ) ( not ( = ?auto_181285 ?auto_181283 ) ) ( not ( = ?auto_181285 ?auto_181282 ) ) ( not ( = ?auto_181284 ?auto_181286 ) ) ( not ( = ?auto_181284 ?auto_181283 ) ) ( not ( = ?auto_181284 ?auto_181282 ) ) ( not ( = ?auto_181278 ?auto_181285 ) ) ( not ( = ?auto_181278 ?auto_181284 ) ) ( not ( = ?auto_181279 ?auto_181285 ) ) ( not ( = ?auto_181279 ?auto_181284 ) ) ( not ( = ?auto_181280 ?auto_181285 ) ) ( not ( = ?auto_181280 ?auto_181284 ) ) ( not ( = ?auto_181281 ?auto_181285 ) ) ( not ( = ?auto_181281 ?auto_181284 ) ) ( ON ?auto_181281 ?auto_181282 ) ( ON ?auto_181280 ?auto_181281 ) ( ON ?auto_181279 ?auto_181280 ) ( CLEAR ?auto_181279 ) ( HOLDING ?auto_181278 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_181278 )
      ( MAKE-6PILE ?auto_181278 ?auto_181279 ?auto_181280 ?auto_181281 ?auto_181282 ?auto_181283 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_181287 - BLOCK
      ?auto_181288 - BLOCK
      ?auto_181289 - BLOCK
      ?auto_181290 - BLOCK
      ?auto_181291 - BLOCK
      ?auto_181292 - BLOCK
    )
    :vars
    (
      ?auto_181294 - BLOCK
      ?auto_181295 - BLOCK
      ?auto_181293 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181287 ?auto_181288 ) ) ( not ( = ?auto_181287 ?auto_181289 ) ) ( not ( = ?auto_181287 ?auto_181290 ) ) ( not ( = ?auto_181287 ?auto_181291 ) ) ( not ( = ?auto_181287 ?auto_181292 ) ) ( not ( = ?auto_181288 ?auto_181289 ) ) ( not ( = ?auto_181288 ?auto_181290 ) ) ( not ( = ?auto_181288 ?auto_181291 ) ) ( not ( = ?auto_181288 ?auto_181292 ) ) ( not ( = ?auto_181289 ?auto_181290 ) ) ( not ( = ?auto_181289 ?auto_181291 ) ) ( not ( = ?auto_181289 ?auto_181292 ) ) ( not ( = ?auto_181290 ?auto_181291 ) ) ( not ( = ?auto_181290 ?auto_181292 ) ) ( not ( = ?auto_181291 ?auto_181292 ) ) ( ON ?auto_181292 ?auto_181294 ) ( not ( = ?auto_181287 ?auto_181294 ) ) ( not ( = ?auto_181288 ?auto_181294 ) ) ( not ( = ?auto_181289 ?auto_181294 ) ) ( not ( = ?auto_181290 ?auto_181294 ) ) ( not ( = ?auto_181291 ?auto_181294 ) ) ( not ( = ?auto_181292 ?auto_181294 ) ) ( ON ?auto_181291 ?auto_181292 ) ( ON-TABLE ?auto_181295 ) ( ON ?auto_181293 ?auto_181295 ) ( ON ?auto_181294 ?auto_181293 ) ( not ( = ?auto_181295 ?auto_181293 ) ) ( not ( = ?auto_181295 ?auto_181294 ) ) ( not ( = ?auto_181295 ?auto_181292 ) ) ( not ( = ?auto_181295 ?auto_181291 ) ) ( not ( = ?auto_181293 ?auto_181294 ) ) ( not ( = ?auto_181293 ?auto_181292 ) ) ( not ( = ?auto_181293 ?auto_181291 ) ) ( not ( = ?auto_181287 ?auto_181295 ) ) ( not ( = ?auto_181287 ?auto_181293 ) ) ( not ( = ?auto_181288 ?auto_181295 ) ) ( not ( = ?auto_181288 ?auto_181293 ) ) ( not ( = ?auto_181289 ?auto_181295 ) ) ( not ( = ?auto_181289 ?auto_181293 ) ) ( not ( = ?auto_181290 ?auto_181295 ) ) ( not ( = ?auto_181290 ?auto_181293 ) ) ( ON ?auto_181290 ?auto_181291 ) ( ON ?auto_181289 ?auto_181290 ) ( ON ?auto_181288 ?auto_181289 ) ( ON ?auto_181287 ?auto_181288 ) ( CLEAR ?auto_181287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_181295 ?auto_181293 ?auto_181294 ?auto_181292 ?auto_181291 ?auto_181290 ?auto_181289 ?auto_181288 )
      ( MAKE-6PILE ?auto_181287 ?auto_181288 ?auto_181289 ?auto_181290 ?auto_181291 ?auto_181292 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_181298 - BLOCK
      ?auto_181299 - BLOCK
    )
    :vars
    (
      ?auto_181300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181300 ?auto_181299 ) ( CLEAR ?auto_181300 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_181298 ) ( ON ?auto_181299 ?auto_181298 ) ( not ( = ?auto_181298 ?auto_181299 ) ) ( not ( = ?auto_181298 ?auto_181300 ) ) ( not ( = ?auto_181299 ?auto_181300 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_181300 ?auto_181299 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_181301 - BLOCK
      ?auto_181302 - BLOCK
    )
    :vars
    (
      ?auto_181303 - BLOCK
      ?auto_181304 - BLOCK
      ?auto_181305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181303 ?auto_181302 ) ( CLEAR ?auto_181303 ) ( ON-TABLE ?auto_181301 ) ( ON ?auto_181302 ?auto_181301 ) ( not ( = ?auto_181301 ?auto_181302 ) ) ( not ( = ?auto_181301 ?auto_181303 ) ) ( not ( = ?auto_181302 ?auto_181303 ) ) ( HOLDING ?auto_181304 ) ( CLEAR ?auto_181305 ) ( not ( = ?auto_181301 ?auto_181304 ) ) ( not ( = ?auto_181301 ?auto_181305 ) ) ( not ( = ?auto_181302 ?auto_181304 ) ) ( not ( = ?auto_181302 ?auto_181305 ) ) ( not ( = ?auto_181303 ?auto_181304 ) ) ( not ( = ?auto_181303 ?auto_181305 ) ) ( not ( = ?auto_181304 ?auto_181305 ) ) )
    :subtasks
    ( ( !STACK ?auto_181304 ?auto_181305 )
      ( MAKE-2PILE ?auto_181301 ?auto_181302 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_181306 - BLOCK
      ?auto_181307 - BLOCK
    )
    :vars
    (
      ?auto_181310 - BLOCK
      ?auto_181308 - BLOCK
      ?auto_181309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181310 ?auto_181307 ) ( ON-TABLE ?auto_181306 ) ( ON ?auto_181307 ?auto_181306 ) ( not ( = ?auto_181306 ?auto_181307 ) ) ( not ( = ?auto_181306 ?auto_181310 ) ) ( not ( = ?auto_181307 ?auto_181310 ) ) ( CLEAR ?auto_181308 ) ( not ( = ?auto_181306 ?auto_181309 ) ) ( not ( = ?auto_181306 ?auto_181308 ) ) ( not ( = ?auto_181307 ?auto_181309 ) ) ( not ( = ?auto_181307 ?auto_181308 ) ) ( not ( = ?auto_181310 ?auto_181309 ) ) ( not ( = ?auto_181310 ?auto_181308 ) ) ( not ( = ?auto_181309 ?auto_181308 ) ) ( ON ?auto_181309 ?auto_181310 ) ( CLEAR ?auto_181309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181306 ?auto_181307 ?auto_181310 )
      ( MAKE-2PILE ?auto_181306 ?auto_181307 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_181311 - BLOCK
      ?auto_181312 - BLOCK
    )
    :vars
    (
      ?auto_181315 - BLOCK
      ?auto_181313 - BLOCK
      ?auto_181314 - BLOCK
      ?auto_181319 - BLOCK
      ?auto_181318 - BLOCK
      ?auto_181316 - BLOCK
      ?auto_181317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181315 ?auto_181312 ) ( ON-TABLE ?auto_181311 ) ( ON ?auto_181312 ?auto_181311 ) ( not ( = ?auto_181311 ?auto_181312 ) ) ( not ( = ?auto_181311 ?auto_181315 ) ) ( not ( = ?auto_181312 ?auto_181315 ) ) ( not ( = ?auto_181311 ?auto_181313 ) ) ( not ( = ?auto_181311 ?auto_181314 ) ) ( not ( = ?auto_181312 ?auto_181313 ) ) ( not ( = ?auto_181312 ?auto_181314 ) ) ( not ( = ?auto_181315 ?auto_181313 ) ) ( not ( = ?auto_181315 ?auto_181314 ) ) ( not ( = ?auto_181313 ?auto_181314 ) ) ( ON ?auto_181313 ?auto_181315 ) ( CLEAR ?auto_181313 ) ( HOLDING ?auto_181314 ) ( CLEAR ?auto_181319 ) ( ON-TABLE ?auto_181318 ) ( ON ?auto_181316 ?auto_181318 ) ( ON ?auto_181317 ?auto_181316 ) ( ON ?auto_181319 ?auto_181317 ) ( not ( = ?auto_181318 ?auto_181316 ) ) ( not ( = ?auto_181318 ?auto_181317 ) ) ( not ( = ?auto_181318 ?auto_181319 ) ) ( not ( = ?auto_181318 ?auto_181314 ) ) ( not ( = ?auto_181316 ?auto_181317 ) ) ( not ( = ?auto_181316 ?auto_181319 ) ) ( not ( = ?auto_181316 ?auto_181314 ) ) ( not ( = ?auto_181317 ?auto_181319 ) ) ( not ( = ?auto_181317 ?auto_181314 ) ) ( not ( = ?auto_181319 ?auto_181314 ) ) ( not ( = ?auto_181311 ?auto_181319 ) ) ( not ( = ?auto_181311 ?auto_181318 ) ) ( not ( = ?auto_181311 ?auto_181316 ) ) ( not ( = ?auto_181311 ?auto_181317 ) ) ( not ( = ?auto_181312 ?auto_181319 ) ) ( not ( = ?auto_181312 ?auto_181318 ) ) ( not ( = ?auto_181312 ?auto_181316 ) ) ( not ( = ?auto_181312 ?auto_181317 ) ) ( not ( = ?auto_181315 ?auto_181319 ) ) ( not ( = ?auto_181315 ?auto_181318 ) ) ( not ( = ?auto_181315 ?auto_181316 ) ) ( not ( = ?auto_181315 ?auto_181317 ) ) ( not ( = ?auto_181313 ?auto_181319 ) ) ( not ( = ?auto_181313 ?auto_181318 ) ) ( not ( = ?auto_181313 ?auto_181316 ) ) ( not ( = ?auto_181313 ?auto_181317 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181318 ?auto_181316 ?auto_181317 ?auto_181319 ?auto_181314 )
      ( MAKE-2PILE ?auto_181311 ?auto_181312 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_181320 - BLOCK
      ?auto_181321 - BLOCK
    )
    :vars
    (
      ?auto_181322 - BLOCK
      ?auto_181328 - BLOCK
      ?auto_181325 - BLOCK
      ?auto_181323 - BLOCK
      ?auto_181326 - BLOCK
      ?auto_181324 - BLOCK
      ?auto_181327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181322 ?auto_181321 ) ( ON-TABLE ?auto_181320 ) ( ON ?auto_181321 ?auto_181320 ) ( not ( = ?auto_181320 ?auto_181321 ) ) ( not ( = ?auto_181320 ?auto_181322 ) ) ( not ( = ?auto_181321 ?auto_181322 ) ) ( not ( = ?auto_181320 ?auto_181328 ) ) ( not ( = ?auto_181320 ?auto_181325 ) ) ( not ( = ?auto_181321 ?auto_181328 ) ) ( not ( = ?auto_181321 ?auto_181325 ) ) ( not ( = ?auto_181322 ?auto_181328 ) ) ( not ( = ?auto_181322 ?auto_181325 ) ) ( not ( = ?auto_181328 ?auto_181325 ) ) ( ON ?auto_181328 ?auto_181322 ) ( CLEAR ?auto_181323 ) ( ON-TABLE ?auto_181326 ) ( ON ?auto_181324 ?auto_181326 ) ( ON ?auto_181327 ?auto_181324 ) ( ON ?auto_181323 ?auto_181327 ) ( not ( = ?auto_181326 ?auto_181324 ) ) ( not ( = ?auto_181326 ?auto_181327 ) ) ( not ( = ?auto_181326 ?auto_181323 ) ) ( not ( = ?auto_181326 ?auto_181325 ) ) ( not ( = ?auto_181324 ?auto_181327 ) ) ( not ( = ?auto_181324 ?auto_181323 ) ) ( not ( = ?auto_181324 ?auto_181325 ) ) ( not ( = ?auto_181327 ?auto_181323 ) ) ( not ( = ?auto_181327 ?auto_181325 ) ) ( not ( = ?auto_181323 ?auto_181325 ) ) ( not ( = ?auto_181320 ?auto_181323 ) ) ( not ( = ?auto_181320 ?auto_181326 ) ) ( not ( = ?auto_181320 ?auto_181324 ) ) ( not ( = ?auto_181320 ?auto_181327 ) ) ( not ( = ?auto_181321 ?auto_181323 ) ) ( not ( = ?auto_181321 ?auto_181326 ) ) ( not ( = ?auto_181321 ?auto_181324 ) ) ( not ( = ?auto_181321 ?auto_181327 ) ) ( not ( = ?auto_181322 ?auto_181323 ) ) ( not ( = ?auto_181322 ?auto_181326 ) ) ( not ( = ?auto_181322 ?auto_181324 ) ) ( not ( = ?auto_181322 ?auto_181327 ) ) ( not ( = ?auto_181328 ?auto_181323 ) ) ( not ( = ?auto_181328 ?auto_181326 ) ) ( not ( = ?auto_181328 ?auto_181324 ) ) ( not ( = ?auto_181328 ?auto_181327 ) ) ( ON ?auto_181325 ?auto_181328 ) ( CLEAR ?auto_181325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181320 ?auto_181321 ?auto_181322 ?auto_181328 )
      ( MAKE-2PILE ?auto_181320 ?auto_181321 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_181329 - BLOCK
      ?auto_181330 - BLOCK
    )
    :vars
    (
      ?auto_181337 - BLOCK
      ?auto_181334 - BLOCK
      ?auto_181331 - BLOCK
      ?auto_181332 - BLOCK
      ?auto_181336 - BLOCK
      ?auto_181333 - BLOCK
      ?auto_181335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181337 ?auto_181330 ) ( ON-TABLE ?auto_181329 ) ( ON ?auto_181330 ?auto_181329 ) ( not ( = ?auto_181329 ?auto_181330 ) ) ( not ( = ?auto_181329 ?auto_181337 ) ) ( not ( = ?auto_181330 ?auto_181337 ) ) ( not ( = ?auto_181329 ?auto_181334 ) ) ( not ( = ?auto_181329 ?auto_181331 ) ) ( not ( = ?auto_181330 ?auto_181334 ) ) ( not ( = ?auto_181330 ?auto_181331 ) ) ( not ( = ?auto_181337 ?auto_181334 ) ) ( not ( = ?auto_181337 ?auto_181331 ) ) ( not ( = ?auto_181334 ?auto_181331 ) ) ( ON ?auto_181334 ?auto_181337 ) ( ON-TABLE ?auto_181332 ) ( ON ?auto_181336 ?auto_181332 ) ( ON ?auto_181333 ?auto_181336 ) ( not ( = ?auto_181332 ?auto_181336 ) ) ( not ( = ?auto_181332 ?auto_181333 ) ) ( not ( = ?auto_181332 ?auto_181335 ) ) ( not ( = ?auto_181332 ?auto_181331 ) ) ( not ( = ?auto_181336 ?auto_181333 ) ) ( not ( = ?auto_181336 ?auto_181335 ) ) ( not ( = ?auto_181336 ?auto_181331 ) ) ( not ( = ?auto_181333 ?auto_181335 ) ) ( not ( = ?auto_181333 ?auto_181331 ) ) ( not ( = ?auto_181335 ?auto_181331 ) ) ( not ( = ?auto_181329 ?auto_181335 ) ) ( not ( = ?auto_181329 ?auto_181332 ) ) ( not ( = ?auto_181329 ?auto_181336 ) ) ( not ( = ?auto_181329 ?auto_181333 ) ) ( not ( = ?auto_181330 ?auto_181335 ) ) ( not ( = ?auto_181330 ?auto_181332 ) ) ( not ( = ?auto_181330 ?auto_181336 ) ) ( not ( = ?auto_181330 ?auto_181333 ) ) ( not ( = ?auto_181337 ?auto_181335 ) ) ( not ( = ?auto_181337 ?auto_181332 ) ) ( not ( = ?auto_181337 ?auto_181336 ) ) ( not ( = ?auto_181337 ?auto_181333 ) ) ( not ( = ?auto_181334 ?auto_181335 ) ) ( not ( = ?auto_181334 ?auto_181332 ) ) ( not ( = ?auto_181334 ?auto_181336 ) ) ( not ( = ?auto_181334 ?auto_181333 ) ) ( ON ?auto_181331 ?auto_181334 ) ( CLEAR ?auto_181331 ) ( HOLDING ?auto_181335 ) ( CLEAR ?auto_181333 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181332 ?auto_181336 ?auto_181333 ?auto_181335 )
      ( MAKE-2PILE ?auto_181329 ?auto_181330 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_181338 - BLOCK
      ?auto_181339 - BLOCK
    )
    :vars
    (
      ?auto_181342 - BLOCK
      ?auto_181345 - BLOCK
      ?auto_181346 - BLOCK
      ?auto_181344 - BLOCK
      ?auto_181343 - BLOCK
      ?auto_181340 - BLOCK
      ?auto_181341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181342 ?auto_181339 ) ( ON-TABLE ?auto_181338 ) ( ON ?auto_181339 ?auto_181338 ) ( not ( = ?auto_181338 ?auto_181339 ) ) ( not ( = ?auto_181338 ?auto_181342 ) ) ( not ( = ?auto_181339 ?auto_181342 ) ) ( not ( = ?auto_181338 ?auto_181345 ) ) ( not ( = ?auto_181338 ?auto_181346 ) ) ( not ( = ?auto_181339 ?auto_181345 ) ) ( not ( = ?auto_181339 ?auto_181346 ) ) ( not ( = ?auto_181342 ?auto_181345 ) ) ( not ( = ?auto_181342 ?auto_181346 ) ) ( not ( = ?auto_181345 ?auto_181346 ) ) ( ON ?auto_181345 ?auto_181342 ) ( ON-TABLE ?auto_181344 ) ( ON ?auto_181343 ?auto_181344 ) ( ON ?auto_181340 ?auto_181343 ) ( not ( = ?auto_181344 ?auto_181343 ) ) ( not ( = ?auto_181344 ?auto_181340 ) ) ( not ( = ?auto_181344 ?auto_181341 ) ) ( not ( = ?auto_181344 ?auto_181346 ) ) ( not ( = ?auto_181343 ?auto_181340 ) ) ( not ( = ?auto_181343 ?auto_181341 ) ) ( not ( = ?auto_181343 ?auto_181346 ) ) ( not ( = ?auto_181340 ?auto_181341 ) ) ( not ( = ?auto_181340 ?auto_181346 ) ) ( not ( = ?auto_181341 ?auto_181346 ) ) ( not ( = ?auto_181338 ?auto_181341 ) ) ( not ( = ?auto_181338 ?auto_181344 ) ) ( not ( = ?auto_181338 ?auto_181343 ) ) ( not ( = ?auto_181338 ?auto_181340 ) ) ( not ( = ?auto_181339 ?auto_181341 ) ) ( not ( = ?auto_181339 ?auto_181344 ) ) ( not ( = ?auto_181339 ?auto_181343 ) ) ( not ( = ?auto_181339 ?auto_181340 ) ) ( not ( = ?auto_181342 ?auto_181341 ) ) ( not ( = ?auto_181342 ?auto_181344 ) ) ( not ( = ?auto_181342 ?auto_181343 ) ) ( not ( = ?auto_181342 ?auto_181340 ) ) ( not ( = ?auto_181345 ?auto_181341 ) ) ( not ( = ?auto_181345 ?auto_181344 ) ) ( not ( = ?auto_181345 ?auto_181343 ) ) ( not ( = ?auto_181345 ?auto_181340 ) ) ( ON ?auto_181346 ?auto_181345 ) ( CLEAR ?auto_181340 ) ( ON ?auto_181341 ?auto_181346 ) ( CLEAR ?auto_181341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181338 ?auto_181339 ?auto_181342 ?auto_181345 ?auto_181346 )
      ( MAKE-2PILE ?auto_181338 ?auto_181339 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_181347 - BLOCK
      ?auto_181348 - BLOCK
    )
    :vars
    (
      ?auto_181351 - BLOCK
      ?auto_181353 - BLOCK
      ?auto_181354 - BLOCK
      ?auto_181355 - BLOCK
      ?auto_181349 - BLOCK
      ?auto_181352 - BLOCK
      ?auto_181350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181351 ?auto_181348 ) ( ON-TABLE ?auto_181347 ) ( ON ?auto_181348 ?auto_181347 ) ( not ( = ?auto_181347 ?auto_181348 ) ) ( not ( = ?auto_181347 ?auto_181351 ) ) ( not ( = ?auto_181348 ?auto_181351 ) ) ( not ( = ?auto_181347 ?auto_181353 ) ) ( not ( = ?auto_181347 ?auto_181354 ) ) ( not ( = ?auto_181348 ?auto_181353 ) ) ( not ( = ?auto_181348 ?auto_181354 ) ) ( not ( = ?auto_181351 ?auto_181353 ) ) ( not ( = ?auto_181351 ?auto_181354 ) ) ( not ( = ?auto_181353 ?auto_181354 ) ) ( ON ?auto_181353 ?auto_181351 ) ( ON-TABLE ?auto_181355 ) ( ON ?auto_181349 ?auto_181355 ) ( not ( = ?auto_181355 ?auto_181349 ) ) ( not ( = ?auto_181355 ?auto_181352 ) ) ( not ( = ?auto_181355 ?auto_181350 ) ) ( not ( = ?auto_181355 ?auto_181354 ) ) ( not ( = ?auto_181349 ?auto_181352 ) ) ( not ( = ?auto_181349 ?auto_181350 ) ) ( not ( = ?auto_181349 ?auto_181354 ) ) ( not ( = ?auto_181352 ?auto_181350 ) ) ( not ( = ?auto_181352 ?auto_181354 ) ) ( not ( = ?auto_181350 ?auto_181354 ) ) ( not ( = ?auto_181347 ?auto_181350 ) ) ( not ( = ?auto_181347 ?auto_181355 ) ) ( not ( = ?auto_181347 ?auto_181349 ) ) ( not ( = ?auto_181347 ?auto_181352 ) ) ( not ( = ?auto_181348 ?auto_181350 ) ) ( not ( = ?auto_181348 ?auto_181355 ) ) ( not ( = ?auto_181348 ?auto_181349 ) ) ( not ( = ?auto_181348 ?auto_181352 ) ) ( not ( = ?auto_181351 ?auto_181350 ) ) ( not ( = ?auto_181351 ?auto_181355 ) ) ( not ( = ?auto_181351 ?auto_181349 ) ) ( not ( = ?auto_181351 ?auto_181352 ) ) ( not ( = ?auto_181353 ?auto_181350 ) ) ( not ( = ?auto_181353 ?auto_181355 ) ) ( not ( = ?auto_181353 ?auto_181349 ) ) ( not ( = ?auto_181353 ?auto_181352 ) ) ( ON ?auto_181354 ?auto_181353 ) ( ON ?auto_181350 ?auto_181354 ) ( CLEAR ?auto_181350 ) ( HOLDING ?auto_181352 ) ( CLEAR ?auto_181349 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181355 ?auto_181349 ?auto_181352 )
      ( MAKE-2PILE ?auto_181347 ?auto_181348 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_181356 - BLOCK
      ?auto_181357 - BLOCK
    )
    :vars
    (
      ?auto_181364 - BLOCK
      ?auto_181360 - BLOCK
      ?auto_181361 - BLOCK
      ?auto_181359 - BLOCK
      ?auto_181363 - BLOCK
      ?auto_181362 - BLOCK
      ?auto_181358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181364 ?auto_181357 ) ( ON-TABLE ?auto_181356 ) ( ON ?auto_181357 ?auto_181356 ) ( not ( = ?auto_181356 ?auto_181357 ) ) ( not ( = ?auto_181356 ?auto_181364 ) ) ( not ( = ?auto_181357 ?auto_181364 ) ) ( not ( = ?auto_181356 ?auto_181360 ) ) ( not ( = ?auto_181356 ?auto_181361 ) ) ( not ( = ?auto_181357 ?auto_181360 ) ) ( not ( = ?auto_181357 ?auto_181361 ) ) ( not ( = ?auto_181364 ?auto_181360 ) ) ( not ( = ?auto_181364 ?auto_181361 ) ) ( not ( = ?auto_181360 ?auto_181361 ) ) ( ON ?auto_181360 ?auto_181364 ) ( ON-TABLE ?auto_181359 ) ( ON ?auto_181363 ?auto_181359 ) ( not ( = ?auto_181359 ?auto_181363 ) ) ( not ( = ?auto_181359 ?auto_181362 ) ) ( not ( = ?auto_181359 ?auto_181358 ) ) ( not ( = ?auto_181359 ?auto_181361 ) ) ( not ( = ?auto_181363 ?auto_181362 ) ) ( not ( = ?auto_181363 ?auto_181358 ) ) ( not ( = ?auto_181363 ?auto_181361 ) ) ( not ( = ?auto_181362 ?auto_181358 ) ) ( not ( = ?auto_181362 ?auto_181361 ) ) ( not ( = ?auto_181358 ?auto_181361 ) ) ( not ( = ?auto_181356 ?auto_181358 ) ) ( not ( = ?auto_181356 ?auto_181359 ) ) ( not ( = ?auto_181356 ?auto_181363 ) ) ( not ( = ?auto_181356 ?auto_181362 ) ) ( not ( = ?auto_181357 ?auto_181358 ) ) ( not ( = ?auto_181357 ?auto_181359 ) ) ( not ( = ?auto_181357 ?auto_181363 ) ) ( not ( = ?auto_181357 ?auto_181362 ) ) ( not ( = ?auto_181364 ?auto_181358 ) ) ( not ( = ?auto_181364 ?auto_181359 ) ) ( not ( = ?auto_181364 ?auto_181363 ) ) ( not ( = ?auto_181364 ?auto_181362 ) ) ( not ( = ?auto_181360 ?auto_181358 ) ) ( not ( = ?auto_181360 ?auto_181359 ) ) ( not ( = ?auto_181360 ?auto_181363 ) ) ( not ( = ?auto_181360 ?auto_181362 ) ) ( ON ?auto_181361 ?auto_181360 ) ( ON ?auto_181358 ?auto_181361 ) ( CLEAR ?auto_181363 ) ( ON ?auto_181362 ?auto_181358 ) ( CLEAR ?auto_181362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181356 ?auto_181357 ?auto_181364 ?auto_181360 ?auto_181361 ?auto_181358 )
      ( MAKE-2PILE ?auto_181356 ?auto_181357 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_181365 - BLOCK
      ?auto_181366 - BLOCK
    )
    :vars
    (
      ?auto_181367 - BLOCK
      ?auto_181369 - BLOCK
      ?auto_181368 - BLOCK
      ?auto_181372 - BLOCK
      ?auto_181371 - BLOCK
      ?auto_181370 - BLOCK
      ?auto_181373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181367 ?auto_181366 ) ( ON-TABLE ?auto_181365 ) ( ON ?auto_181366 ?auto_181365 ) ( not ( = ?auto_181365 ?auto_181366 ) ) ( not ( = ?auto_181365 ?auto_181367 ) ) ( not ( = ?auto_181366 ?auto_181367 ) ) ( not ( = ?auto_181365 ?auto_181369 ) ) ( not ( = ?auto_181365 ?auto_181368 ) ) ( not ( = ?auto_181366 ?auto_181369 ) ) ( not ( = ?auto_181366 ?auto_181368 ) ) ( not ( = ?auto_181367 ?auto_181369 ) ) ( not ( = ?auto_181367 ?auto_181368 ) ) ( not ( = ?auto_181369 ?auto_181368 ) ) ( ON ?auto_181369 ?auto_181367 ) ( ON-TABLE ?auto_181372 ) ( not ( = ?auto_181372 ?auto_181371 ) ) ( not ( = ?auto_181372 ?auto_181370 ) ) ( not ( = ?auto_181372 ?auto_181373 ) ) ( not ( = ?auto_181372 ?auto_181368 ) ) ( not ( = ?auto_181371 ?auto_181370 ) ) ( not ( = ?auto_181371 ?auto_181373 ) ) ( not ( = ?auto_181371 ?auto_181368 ) ) ( not ( = ?auto_181370 ?auto_181373 ) ) ( not ( = ?auto_181370 ?auto_181368 ) ) ( not ( = ?auto_181373 ?auto_181368 ) ) ( not ( = ?auto_181365 ?auto_181373 ) ) ( not ( = ?auto_181365 ?auto_181372 ) ) ( not ( = ?auto_181365 ?auto_181371 ) ) ( not ( = ?auto_181365 ?auto_181370 ) ) ( not ( = ?auto_181366 ?auto_181373 ) ) ( not ( = ?auto_181366 ?auto_181372 ) ) ( not ( = ?auto_181366 ?auto_181371 ) ) ( not ( = ?auto_181366 ?auto_181370 ) ) ( not ( = ?auto_181367 ?auto_181373 ) ) ( not ( = ?auto_181367 ?auto_181372 ) ) ( not ( = ?auto_181367 ?auto_181371 ) ) ( not ( = ?auto_181367 ?auto_181370 ) ) ( not ( = ?auto_181369 ?auto_181373 ) ) ( not ( = ?auto_181369 ?auto_181372 ) ) ( not ( = ?auto_181369 ?auto_181371 ) ) ( not ( = ?auto_181369 ?auto_181370 ) ) ( ON ?auto_181368 ?auto_181369 ) ( ON ?auto_181373 ?auto_181368 ) ( ON ?auto_181370 ?auto_181373 ) ( CLEAR ?auto_181370 ) ( HOLDING ?auto_181371 ) ( CLEAR ?auto_181372 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181372 ?auto_181371 )
      ( MAKE-2PILE ?auto_181365 ?auto_181366 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_183392 - BLOCK
      ?auto_183393 - BLOCK
    )
    :vars
    (
      ?auto_183397 - BLOCK
      ?auto_183396 - BLOCK
      ?auto_183394 - BLOCK
      ?auto_183399 - BLOCK
      ?auto_183398 - BLOCK
      ?auto_183395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183397 ?auto_183393 ) ( ON-TABLE ?auto_183392 ) ( ON ?auto_183393 ?auto_183392 ) ( not ( = ?auto_183392 ?auto_183393 ) ) ( not ( = ?auto_183392 ?auto_183397 ) ) ( not ( = ?auto_183393 ?auto_183397 ) ) ( not ( = ?auto_183392 ?auto_183396 ) ) ( not ( = ?auto_183392 ?auto_183394 ) ) ( not ( = ?auto_183393 ?auto_183396 ) ) ( not ( = ?auto_183393 ?auto_183394 ) ) ( not ( = ?auto_183397 ?auto_183396 ) ) ( not ( = ?auto_183397 ?auto_183394 ) ) ( not ( = ?auto_183396 ?auto_183394 ) ) ( ON ?auto_183396 ?auto_183397 ) ( not ( = ?auto_183399 ?auto_183398 ) ) ( not ( = ?auto_183399 ?auto_183395 ) ) ( not ( = ?auto_183399 ?auto_183394 ) ) ( not ( = ?auto_183398 ?auto_183395 ) ) ( not ( = ?auto_183398 ?auto_183394 ) ) ( not ( = ?auto_183395 ?auto_183394 ) ) ( not ( = ?auto_183392 ?auto_183395 ) ) ( not ( = ?auto_183392 ?auto_183399 ) ) ( not ( = ?auto_183392 ?auto_183398 ) ) ( not ( = ?auto_183393 ?auto_183395 ) ) ( not ( = ?auto_183393 ?auto_183399 ) ) ( not ( = ?auto_183393 ?auto_183398 ) ) ( not ( = ?auto_183397 ?auto_183395 ) ) ( not ( = ?auto_183397 ?auto_183399 ) ) ( not ( = ?auto_183397 ?auto_183398 ) ) ( not ( = ?auto_183396 ?auto_183395 ) ) ( not ( = ?auto_183396 ?auto_183399 ) ) ( not ( = ?auto_183396 ?auto_183398 ) ) ( ON ?auto_183394 ?auto_183396 ) ( ON ?auto_183395 ?auto_183394 ) ( ON ?auto_183398 ?auto_183395 ) ( ON ?auto_183399 ?auto_183398 ) ( CLEAR ?auto_183399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183392 ?auto_183393 ?auto_183397 ?auto_183396 ?auto_183394 ?auto_183395 ?auto_183398 )
      ( MAKE-2PILE ?auto_183392 ?auto_183393 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_181383 - BLOCK
      ?auto_181384 - BLOCK
    )
    :vars
    (
      ?auto_181390 - BLOCK
      ?auto_181389 - BLOCK
      ?auto_181388 - BLOCK
      ?auto_181391 - BLOCK
      ?auto_181385 - BLOCK
      ?auto_181387 - BLOCK
      ?auto_181386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181390 ?auto_181384 ) ( ON-TABLE ?auto_181383 ) ( ON ?auto_181384 ?auto_181383 ) ( not ( = ?auto_181383 ?auto_181384 ) ) ( not ( = ?auto_181383 ?auto_181390 ) ) ( not ( = ?auto_181384 ?auto_181390 ) ) ( not ( = ?auto_181383 ?auto_181389 ) ) ( not ( = ?auto_181383 ?auto_181388 ) ) ( not ( = ?auto_181384 ?auto_181389 ) ) ( not ( = ?auto_181384 ?auto_181388 ) ) ( not ( = ?auto_181390 ?auto_181389 ) ) ( not ( = ?auto_181390 ?auto_181388 ) ) ( not ( = ?auto_181389 ?auto_181388 ) ) ( ON ?auto_181389 ?auto_181390 ) ( not ( = ?auto_181391 ?auto_181385 ) ) ( not ( = ?auto_181391 ?auto_181387 ) ) ( not ( = ?auto_181391 ?auto_181386 ) ) ( not ( = ?auto_181391 ?auto_181388 ) ) ( not ( = ?auto_181385 ?auto_181387 ) ) ( not ( = ?auto_181385 ?auto_181386 ) ) ( not ( = ?auto_181385 ?auto_181388 ) ) ( not ( = ?auto_181387 ?auto_181386 ) ) ( not ( = ?auto_181387 ?auto_181388 ) ) ( not ( = ?auto_181386 ?auto_181388 ) ) ( not ( = ?auto_181383 ?auto_181386 ) ) ( not ( = ?auto_181383 ?auto_181391 ) ) ( not ( = ?auto_181383 ?auto_181385 ) ) ( not ( = ?auto_181383 ?auto_181387 ) ) ( not ( = ?auto_181384 ?auto_181386 ) ) ( not ( = ?auto_181384 ?auto_181391 ) ) ( not ( = ?auto_181384 ?auto_181385 ) ) ( not ( = ?auto_181384 ?auto_181387 ) ) ( not ( = ?auto_181390 ?auto_181386 ) ) ( not ( = ?auto_181390 ?auto_181391 ) ) ( not ( = ?auto_181390 ?auto_181385 ) ) ( not ( = ?auto_181390 ?auto_181387 ) ) ( not ( = ?auto_181389 ?auto_181386 ) ) ( not ( = ?auto_181389 ?auto_181391 ) ) ( not ( = ?auto_181389 ?auto_181385 ) ) ( not ( = ?auto_181389 ?auto_181387 ) ) ( ON ?auto_181388 ?auto_181389 ) ( ON ?auto_181386 ?auto_181388 ) ( ON ?auto_181387 ?auto_181386 ) ( ON ?auto_181385 ?auto_181387 ) ( CLEAR ?auto_181385 ) ( HOLDING ?auto_181391 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_181391 )
      ( MAKE-2PILE ?auto_181383 ?auto_181384 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_181392 - BLOCK
      ?auto_181393 - BLOCK
    )
    :vars
    (
      ?auto_181395 - BLOCK
      ?auto_181398 - BLOCK
      ?auto_181400 - BLOCK
      ?auto_181397 - BLOCK
      ?auto_181399 - BLOCK
      ?auto_181394 - BLOCK
      ?auto_181396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181395 ?auto_181393 ) ( ON-TABLE ?auto_181392 ) ( ON ?auto_181393 ?auto_181392 ) ( not ( = ?auto_181392 ?auto_181393 ) ) ( not ( = ?auto_181392 ?auto_181395 ) ) ( not ( = ?auto_181393 ?auto_181395 ) ) ( not ( = ?auto_181392 ?auto_181398 ) ) ( not ( = ?auto_181392 ?auto_181400 ) ) ( not ( = ?auto_181393 ?auto_181398 ) ) ( not ( = ?auto_181393 ?auto_181400 ) ) ( not ( = ?auto_181395 ?auto_181398 ) ) ( not ( = ?auto_181395 ?auto_181400 ) ) ( not ( = ?auto_181398 ?auto_181400 ) ) ( ON ?auto_181398 ?auto_181395 ) ( not ( = ?auto_181397 ?auto_181399 ) ) ( not ( = ?auto_181397 ?auto_181394 ) ) ( not ( = ?auto_181397 ?auto_181396 ) ) ( not ( = ?auto_181397 ?auto_181400 ) ) ( not ( = ?auto_181399 ?auto_181394 ) ) ( not ( = ?auto_181399 ?auto_181396 ) ) ( not ( = ?auto_181399 ?auto_181400 ) ) ( not ( = ?auto_181394 ?auto_181396 ) ) ( not ( = ?auto_181394 ?auto_181400 ) ) ( not ( = ?auto_181396 ?auto_181400 ) ) ( not ( = ?auto_181392 ?auto_181396 ) ) ( not ( = ?auto_181392 ?auto_181397 ) ) ( not ( = ?auto_181392 ?auto_181399 ) ) ( not ( = ?auto_181392 ?auto_181394 ) ) ( not ( = ?auto_181393 ?auto_181396 ) ) ( not ( = ?auto_181393 ?auto_181397 ) ) ( not ( = ?auto_181393 ?auto_181399 ) ) ( not ( = ?auto_181393 ?auto_181394 ) ) ( not ( = ?auto_181395 ?auto_181396 ) ) ( not ( = ?auto_181395 ?auto_181397 ) ) ( not ( = ?auto_181395 ?auto_181399 ) ) ( not ( = ?auto_181395 ?auto_181394 ) ) ( not ( = ?auto_181398 ?auto_181396 ) ) ( not ( = ?auto_181398 ?auto_181397 ) ) ( not ( = ?auto_181398 ?auto_181399 ) ) ( not ( = ?auto_181398 ?auto_181394 ) ) ( ON ?auto_181400 ?auto_181398 ) ( ON ?auto_181396 ?auto_181400 ) ( ON ?auto_181394 ?auto_181396 ) ( ON ?auto_181399 ?auto_181394 ) ( ON ?auto_181397 ?auto_181399 ) ( CLEAR ?auto_181397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_181392 ?auto_181393 ?auto_181395 ?auto_181398 ?auto_181400 ?auto_181396 ?auto_181394 ?auto_181399 )
      ( MAKE-2PILE ?auto_181392 ?auto_181393 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181408 - BLOCK
      ?auto_181409 - BLOCK
      ?auto_181410 - BLOCK
      ?auto_181411 - BLOCK
      ?auto_181412 - BLOCK
      ?auto_181413 - BLOCK
      ?auto_181414 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_181414 ) ( CLEAR ?auto_181413 ) ( ON-TABLE ?auto_181408 ) ( ON ?auto_181409 ?auto_181408 ) ( ON ?auto_181410 ?auto_181409 ) ( ON ?auto_181411 ?auto_181410 ) ( ON ?auto_181412 ?auto_181411 ) ( ON ?auto_181413 ?auto_181412 ) ( not ( = ?auto_181408 ?auto_181409 ) ) ( not ( = ?auto_181408 ?auto_181410 ) ) ( not ( = ?auto_181408 ?auto_181411 ) ) ( not ( = ?auto_181408 ?auto_181412 ) ) ( not ( = ?auto_181408 ?auto_181413 ) ) ( not ( = ?auto_181408 ?auto_181414 ) ) ( not ( = ?auto_181409 ?auto_181410 ) ) ( not ( = ?auto_181409 ?auto_181411 ) ) ( not ( = ?auto_181409 ?auto_181412 ) ) ( not ( = ?auto_181409 ?auto_181413 ) ) ( not ( = ?auto_181409 ?auto_181414 ) ) ( not ( = ?auto_181410 ?auto_181411 ) ) ( not ( = ?auto_181410 ?auto_181412 ) ) ( not ( = ?auto_181410 ?auto_181413 ) ) ( not ( = ?auto_181410 ?auto_181414 ) ) ( not ( = ?auto_181411 ?auto_181412 ) ) ( not ( = ?auto_181411 ?auto_181413 ) ) ( not ( = ?auto_181411 ?auto_181414 ) ) ( not ( = ?auto_181412 ?auto_181413 ) ) ( not ( = ?auto_181412 ?auto_181414 ) ) ( not ( = ?auto_181413 ?auto_181414 ) ) )
    :subtasks
    ( ( !STACK ?auto_181414 ?auto_181413 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181415 - BLOCK
      ?auto_181416 - BLOCK
      ?auto_181417 - BLOCK
      ?auto_181418 - BLOCK
      ?auto_181419 - BLOCK
      ?auto_181420 - BLOCK
      ?auto_181421 - BLOCK
    )
    :vars
    (
      ?auto_181422 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_181420 ) ( ON-TABLE ?auto_181415 ) ( ON ?auto_181416 ?auto_181415 ) ( ON ?auto_181417 ?auto_181416 ) ( ON ?auto_181418 ?auto_181417 ) ( ON ?auto_181419 ?auto_181418 ) ( ON ?auto_181420 ?auto_181419 ) ( not ( = ?auto_181415 ?auto_181416 ) ) ( not ( = ?auto_181415 ?auto_181417 ) ) ( not ( = ?auto_181415 ?auto_181418 ) ) ( not ( = ?auto_181415 ?auto_181419 ) ) ( not ( = ?auto_181415 ?auto_181420 ) ) ( not ( = ?auto_181415 ?auto_181421 ) ) ( not ( = ?auto_181416 ?auto_181417 ) ) ( not ( = ?auto_181416 ?auto_181418 ) ) ( not ( = ?auto_181416 ?auto_181419 ) ) ( not ( = ?auto_181416 ?auto_181420 ) ) ( not ( = ?auto_181416 ?auto_181421 ) ) ( not ( = ?auto_181417 ?auto_181418 ) ) ( not ( = ?auto_181417 ?auto_181419 ) ) ( not ( = ?auto_181417 ?auto_181420 ) ) ( not ( = ?auto_181417 ?auto_181421 ) ) ( not ( = ?auto_181418 ?auto_181419 ) ) ( not ( = ?auto_181418 ?auto_181420 ) ) ( not ( = ?auto_181418 ?auto_181421 ) ) ( not ( = ?auto_181419 ?auto_181420 ) ) ( not ( = ?auto_181419 ?auto_181421 ) ) ( not ( = ?auto_181420 ?auto_181421 ) ) ( ON ?auto_181421 ?auto_181422 ) ( CLEAR ?auto_181421 ) ( HAND-EMPTY ) ( not ( = ?auto_181415 ?auto_181422 ) ) ( not ( = ?auto_181416 ?auto_181422 ) ) ( not ( = ?auto_181417 ?auto_181422 ) ) ( not ( = ?auto_181418 ?auto_181422 ) ) ( not ( = ?auto_181419 ?auto_181422 ) ) ( not ( = ?auto_181420 ?auto_181422 ) ) ( not ( = ?auto_181421 ?auto_181422 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_181421 ?auto_181422 )
      ( MAKE-7PILE ?auto_181415 ?auto_181416 ?auto_181417 ?auto_181418 ?auto_181419 ?auto_181420 ?auto_181421 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181423 - BLOCK
      ?auto_181424 - BLOCK
      ?auto_181425 - BLOCK
      ?auto_181426 - BLOCK
      ?auto_181427 - BLOCK
      ?auto_181428 - BLOCK
      ?auto_181429 - BLOCK
    )
    :vars
    (
      ?auto_181430 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181423 ) ( ON ?auto_181424 ?auto_181423 ) ( ON ?auto_181425 ?auto_181424 ) ( ON ?auto_181426 ?auto_181425 ) ( ON ?auto_181427 ?auto_181426 ) ( not ( = ?auto_181423 ?auto_181424 ) ) ( not ( = ?auto_181423 ?auto_181425 ) ) ( not ( = ?auto_181423 ?auto_181426 ) ) ( not ( = ?auto_181423 ?auto_181427 ) ) ( not ( = ?auto_181423 ?auto_181428 ) ) ( not ( = ?auto_181423 ?auto_181429 ) ) ( not ( = ?auto_181424 ?auto_181425 ) ) ( not ( = ?auto_181424 ?auto_181426 ) ) ( not ( = ?auto_181424 ?auto_181427 ) ) ( not ( = ?auto_181424 ?auto_181428 ) ) ( not ( = ?auto_181424 ?auto_181429 ) ) ( not ( = ?auto_181425 ?auto_181426 ) ) ( not ( = ?auto_181425 ?auto_181427 ) ) ( not ( = ?auto_181425 ?auto_181428 ) ) ( not ( = ?auto_181425 ?auto_181429 ) ) ( not ( = ?auto_181426 ?auto_181427 ) ) ( not ( = ?auto_181426 ?auto_181428 ) ) ( not ( = ?auto_181426 ?auto_181429 ) ) ( not ( = ?auto_181427 ?auto_181428 ) ) ( not ( = ?auto_181427 ?auto_181429 ) ) ( not ( = ?auto_181428 ?auto_181429 ) ) ( ON ?auto_181429 ?auto_181430 ) ( CLEAR ?auto_181429 ) ( not ( = ?auto_181423 ?auto_181430 ) ) ( not ( = ?auto_181424 ?auto_181430 ) ) ( not ( = ?auto_181425 ?auto_181430 ) ) ( not ( = ?auto_181426 ?auto_181430 ) ) ( not ( = ?auto_181427 ?auto_181430 ) ) ( not ( = ?auto_181428 ?auto_181430 ) ) ( not ( = ?auto_181429 ?auto_181430 ) ) ( HOLDING ?auto_181428 ) ( CLEAR ?auto_181427 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181423 ?auto_181424 ?auto_181425 ?auto_181426 ?auto_181427 ?auto_181428 )
      ( MAKE-7PILE ?auto_181423 ?auto_181424 ?auto_181425 ?auto_181426 ?auto_181427 ?auto_181428 ?auto_181429 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181431 - BLOCK
      ?auto_181432 - BLOCK
      ?auto_181433 - BLOCK
      ?auto_181434 - BLOCK
      ?auto_181435 - BLOCK
      ?auto_181436 - BLOCK
      ?auto_181437 - BLOCK
    )
    :vars
    (
      ?auto_181438 - BLOCK
      ?auto_181439 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181431 ) ( ON ?auto_181432 ?auto_181431 ) ( ON ?auto_181433 ?auto_181432 ) ( ON ?auto_181434 ?auto_181433 ) ( ON ?auto_181435 ?auto_181434 ) ( not ( = ?auto_181431 ?auto_181432 ) ) ( not ( = ?auto_181431 ?auto_181433 ) ) ( not ( = ?auto_181431 ?auto_181434 ) ) ( not ( = ?auto_181431 ?auto_181435 ) ) ( not ( = ?auto_181431 ?auto_181436 ) ) ( not ( = ?auto_181431 ?auto_181437 ) ) ( not ( = ?auto_181432 ?auto_181433 ) ) ( not ( = ?auto_181432 ?auto_181434 ) ) ( not ( = ?auto_181432 ?auto_181435 ) ) ( not ( = ?auto_181432 ?auto_181436 ) ) ( not ( = ?auto_181432 ?auto_181437 ) ) ( not ( = ?auto_181433 ?auto_181434 ) ) ( not ( = ?auto_181433 ?auto_181435 ) ) ( not ( = ?auto_181433 ?auto_181436 ) ) ( not ( = ?auto_181433 ?auto_181437 ) ) ( not ( = ?auto_181434 ?auto_181435 ) ) ( not ( = ?auto_181434 ?auto_181436 ) ) ( not ( = ?auto_181434 ?auto_181437 ) ) ( not ( = ?auto_181435 ?auto_181436 ) ) ( not ( = ?auto_181435 ?auto_181437 ) ) ( not ( = ?auto_181436 ?auto_181437 ) ) ( ON ?auto_181437 ?auto_181438 ) ( not ( = ?auto_181431 ?auto_181438 ) ) ( not ( = ?auto_181432 ?auto_181438 ) ) ( not ( = ?auto_181433 ?auto_181438 ) ) ( not ( = ?auto_181434 ?auto_181438 ) ) ( not ( = ?auto_181435 ?auto_181438 ) ) ( not ( = ?auto_181436 ?auto_181438 ) ) ( not ( = ?auto_181437 ?auto_181438 ) ) ( CLEAR ?auto_181435 ) ( ON ?auto_181436 ?auto_181437 ) ( CLEAR ?auto_181436 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_181439 ) ( ON ?auto_181438 ?auto_181439 ) ( not ( = ?auto_181439 ?auto_181438 ) ) ( not ( = ?auto_181439 ?auto_181437 ) ) ( not ( = ?auto_181439 ?auto_181436 ) ) ( not ( = ?auto_181431 ?auto_181439 ) ) ( not ( = ?auto_181432 ?auto_181439 ) ) ( not ( = ?auto_181433 ?auto_181439 ) ) ( not ( = ?auto_181434 ?auto_181439 ) ) ( not ( = ?auto_181435 ?auto_181439 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181439 ?auto_181438 ?auto_181437 )
      ( MAKE-7PILE ?auto_181431 ?auto_181432 ?auto_181433 ?auto_181434 ?auto_181435 ?auto_181436 ?auto_181437 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181440 - BLOCK
      ?auto_181441 - BLOCK
      ?auto_181442 - BLOCK
      ?auto_181443 - BLOCK
      ?auto_181444 - BLOCK
      ?auto_181445 - BLOCK
      ?auto_181446 - BLOCK
    )
    :vars
    (
      ?auto_181448 - BLOCK
      ?auto_181447 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181440 ) ( ON ?auto_181441 ?auto_181440 ) ( ON ?auto_181442 ?auto_181441 ) ( ON ?auto_181443 ?auto_181442 ) ( not ( = ?auto_181440 ?auto_181441 ) ) ( not ( = ?auto_181440 ?auto_181442 ) ) ( not ( = ?auto_181440 ?auto_181443 ) ) ( not ( = ?auto_181440 ?auto_181444 ) ) ( not ( = ?auto_181440 ?auto_181445 ) ) ( not ( = ?auto_181440 ?auto_181446 ) ) ( not ( = ?auto_181441 ?auto_181442 ) ) ( not ( = ?auto_181441 ?auto_181443 ) ) ( not ( = ?auto_181441 ?auto_181444 ) ) ( not ( = ?auto_181441 ?auto_181445 ) ) ( not ( = ?auto_181441 ?auto_181446 ) ) ( not ( = ?auto_181442 ?auto_181443 ) ) ( not ( = ?auto_181442 ?auto_181444 ) ) ( not ( = ?auto_181442 ?auto_181445 ) ) ( not ( = ?auto_181442 ?auto_181446 ) ) ( not ( = ?auto_181443 ?auto_181444 ) ) ( not ( = ?auto_181443 ?auto_181445 ) ) ( not ( = ?auto_181443 ?auto_181446 ) ) ( not ( = ?auto_181444 ?auto_181445 ) ) ( not ( = ?auto_181444 ?auto_181446 ) ) ( not ( = ?auto_181445 ?auto_181446 ) ) ( ON ?auto_181446 ?auto_181448 ) ( not ( = ?auto_181440 ?auto_181448 ) ) ( not ( = ?auto_181441 ?auto_181448 ) ) ( not ( = ?auto_181442 ?auto_181448 ) ) ( not ( = ?auto_181443 ?auto_181448 ) ) ( not ( = ?auto_181444 ?auto_181448 ) ) ( not ( = ?auto_181445 ?auto_181448 ) ) ( not ( = ?auto_181446 ?auto_181448 ) ) ( ON ?auto_181445 ?auto_181446 ) ( CLEAR ?auto_181445 ) ( ON-TABLE ?auto_181447 ) ( ON ?auto_181448 ?auto_181447 ) ( not ( = ?auto_181447 ?auto_181448 ) ) ( not ( = ?auto_181447 ?auto_181446 ) ) ( not ( = ?auto_181447 ?auto_181445 ) ) ( not ( = ?auto_181440 ?auto_181447 ) ) ( not ( = ?auto_181441 ?auto_181447 ) ) ( not ( = ?auto_181442 ?auto_181447 ) ) ( not ( = ?auto_181443 ?auto_181447 ) ) ( not ( = ?auto_181444 ?auto_181447 ) ) ( HOLDING ?auto_181444 ) ( CLEAR ?auto_181443 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181440 ?auto_181441 ?auto_181442 ?auto_181443 ?auto_181444 )
      ( MAKE-7PILE ?auto_181440 ?auto_181441 ?auto_181442 ?auto_181443 ?auto_181444 ?auto_181445 ?auto_181446 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181449 - BLOCK
      ?auto_181450 - BLOCK
      ?auto_181451 - BLOCK
      ?auto_181452 - BLOCK
      ?auto_181453 - BLOCK
      ?auto_181454 - BLOCK
      ?auto_181455 - BLOCK
    )
    :vars
    (
      ?auto_181456 - BLOCK
      ?auto_181457 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181449 ) ( ON ?auto_181450 ?auto_181449 ) ( ON ?auto_181451 ?auto_181450 ) ( ON ?auto_181452 ?auto_181451 ) ( not ( = ?auto_181449 ?auto_181450 ) ) ( not ( = ?auto_181449 ?auto_181451 ) ) ( not ( = ?auto_181449 ?auto_181452 ) ) ( not ( = ?auto_181449 ?auto_181453 ) ) ( not ( = ?auto_181449 ?auto_181454 ) ) ( not ( = ?auto_181449 ?auto_181455 ) ) ( not ( = ?auto_181450 ?auto_181451 ) ) ( not ( = ?auto_181450 ?auto_181452 ) ) ( not ( = ?auto_181450 ?auto_181453 ) ) ( not ( = ?auto_181450 ?auto_181454 ) ) ( not ( = ?auto_181450 ?auto_181455 ) ) ( not ( = ?auto_181451 ?auto_181452 ) ) ( not ( = ?auto_181451 ?auto_181453 ) ) ( not ( = ?auto_181451 ?auto_181454 ) ) ( not ( = ?auto_181451 ?auto_181455 ) ) ( not ( = ?auto_181452 ?auto_181453 ) ) ( not ( = ?auto_181452 ?auto_181454 ) ) ( not ( = ?auto_181452 ?auto_181455 ) ) ( not ( = ?auto_181453 ?auto_181454 ) ) ( not ( = ?auto_181453 ?auto_181455 ) ) ( not ( = ?auto_181454 ?auto_181455 ) ) ( ON ?auto_181455 ?auto_181456 ) ( not ( = ?auto_181449 ?auto_181456 ) ) ( not ( = ?auto_181450 ?auto_181456 ) ) ( not ( = ?auto_181451 ?auto_181456 ) ) ( not ( = ?auto_181452 ?auto_181456 ) ) ( not ( = ?auto_181453 ?auto_181456 ) ) ( not ( = ?auto_181454 ?auto_181456 ) ) ( not ( = ?auto_181455 ?auto_181456 ) ) ( ON ?auto_181454 ?auto_181455 ) ( ON-TABLE ?auto_181457 ) ( ON ?auto_181456 ?auto_181457 ) ( not ( = ?auto_181457 ?auto_181456 ) ) ( not ( = ?auto_181457 ?auto_181455 ) ) ( not ( = ?auto_181457 ?auto_181454 ) ) ( not ( = ?auto_181449 ?auto_181457 ) ) ( not ( = ?auto_181450 ?auto_181457 ) ) ( not ( = ?auto_181451 ?auto_181457 ) ) ( not ( = ?auto_181452 ?auto_181457 ) ) ( not ( = ?auto_181453 ?auto_181457 ) ) ( CLEAR ?auto_181452 ) ( ON ?auto_181453 ?auto_181454 ) ( CLEAR ?auto_181453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181457 ?auto_181456 ?auto_181455 ?auto_181454 )
      ( MAKE-7PILE ?auto_181449 ?auto_181450 ?auto_181451 ?auto_181452 ?auto_181453 ?auto_181454 ?auto_181455 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181458 - BLOCK
      ?auto_181459 - BLOCK
      ?auto_181460 - BLOCK
      ?auto_181461 - BLOCK
      ?auto_181462 - BLOCK
      ?auto_181463 - BLOCK
      ?auto_181464 - BLOCK
    )
    :vars
    (
      ?auto_181466 - BLOCK
      ?auto_181465 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181458 ) ( ON ?auto_181459 ?auto_181458 ) ( ON ?auto_181460 ?auto_181459 ) ( not ( = ?auto_181458 ?auto_181459 ) ) ( not ( = ?auto_181458 ?auto_181460 ) ) ( not ( = ?auto_181458 ?auto_181461 ) ) ( not ( = ?auto_181458 ?auto_181462 ) ) ( not ( = ?auto_181458 ?auto_181463 ) ) ( not ( = ?auto_181458 ?auto_181464 ) ) ( not ( = ?auto_181459 ?auto_181460 ) ) ( not ( = ?auto_181459 ?auto_181461 ) ) ( not ( = ?auto_181459 ?auto_181462 ) ) ( not ( = ?auto_181459 ?auto_181463 ) ) ( not ( = ?auto_181459 ?auto_181464 ) ) ( not ( = ?auto_181460 ?auto_181461 ) ) ( not ( = ?auto_181460 ?auto_181462 ) ) ( not ( = ?auto_181460 ?auto_181463 ) ) ( not ( = ?auto_181460 ?auto_181464 ) ) ( not ( = ?auto_181461 ?auto_181462 ) ) ( not ( = ?auto_181461 ?auto_181463 ) ) ( not ( = ?auto_181461 ?auto_181464 ) ) ( not ( = ?auto_181462 ?auto_181463 ) ) ( not ( = ?auto_181462 ?auto_181464 ) ) ( not ( = ?auto_181463 ?auto_181464 ) ) ( ON ?auto_181464 ?auto_181466 ) ( not ( = ?auto_181458 ?auto_181466 ) ) ( not ( = ?auto_181459 ?auto_181466 ) ) ( not ( = ?auto_181460 ?auto_181466 ) ) ( not ( = ?auto_181461 ?auto_181466 ) ) ( not ( = ?auto_181462 ?auto_181466 ) ) ( not ( = ?auto_181463 ?auto_181466 ) ) ( not ( = ?auto_181464 ?auto_181466 ) ) ( ON ?auto_181463 ?auto_181464 ) ( ON-TABLE ?auto_181465 ) ( ON ?auto_181466 ?auto_181465 ) ( not ( = ?auto_181465 ?auto_181466 ) ) ( not ( = ?auto_181465 ?auto_181464 ) ) ( not ( = ?auto_181465 ?auto_181463 ) ) ( not ( = ?auto_181458 ?auto_181465 ) ) ( not ( = ?auto_181459 ?auto_181465 ) ) ( not ( = ?auto_181460 ?auto_181465 ) ) ( not ( = ?auto_181461 ?auto_181465 ) ) ( not ( = ?auto_181462 ?auto_181465 ) ) ( ON ?auto_181462 ?auto_181463 ) ( CLEAR ?auto_181462 ) ( HOLDING ?auto_181461 ) ( CLEAR ?auto_181460 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181458 ?auto_181459 ?auto_181460 ?auto_181461 )
      ( MAKE-7PILE ?auto_181458 ?auto_181459 ?auto_181460 ?auto_181461 ?auto_181462 ?auto_181463 ?auto_181464 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181467 - BLOCK
      ?auto_181468 - BLOCK
      ?auto_181469 - BLOCK
      ?auto_181470 - BLOCK
      ?auto_181471 - BLOCK
      ?auto_181472 - BLOCK
      ?auto_181473 - BLOCK
    )
    :vars
    (
      ?auto_181475 - BLOCK
      ?auto_181474 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181467 ) ( ON ?auto_181468 ?auto_181467 ) ( ON ?auto_181469 ?auto_181468 ) ( not ( = ?auto_181467 ?auto_181468 ) ) ( not ( = ?auto_181467 ?auto_181469 ) ) ( not ( = ?auto_181467 ?auto_181470 ) ) ( not ( = ?auto_181467 ?auto_181471 ) ) ( not ( = ?auto_181467 ?auto_181472 ) ) ( not ( = ?auto_181467 ?auto_181473 ) ) ( not ( = ?auto_181468 ?auto_181469 ) ) ( not ( = ?auto_181468 ?auto_181470 ) ) ( not ( = ?auto_181468 ?auto_181471 ) ) ( not ( = ?auto_181468 ?auto_181472 ) ) ( not ( = ?auto_181468 ?auto_181473 ) ) ( not ( = ?auto_181469 ?auto_181470 ) ) ( not ( = ?auto_181469 ?auto_181471 ) ) ( not ( = ?auto_181469 ?auto_181472 ) ) ( not ( = ?auto_181469 ?auto_181473 ) ) ( not ( = ?auto_181470 ?auto_181471 ) ) ( not ( = ?auto_181470 ?auto_181472 ) ) ( not ( = ?auto_181470 ?auto_181473 ) ) ( not ( = ?auto_181471 ?auto_181472 ) ) ( not ( = ?auto_181471 ?auto_181473 ) ) ( not ( = ?auto_181472 ?auto_181473 ) ) ( ON ?auto_181473 ?auto_181475 ) ( not ( = ?auto_181467 ?auto_181475 ) ) ( not ( = ?auto_181468 ?auto_181475 ) ) ( not ( = ?auto_181469 ?auto_181475 ) ) ( not ( = ?auto_181470 ?auto_181475 ) ) ( not ( = ?auto_181471 ?auto_181475 ) ) ( not ( = ?auto_181472 ?auto_181475 ) ) ( not ( = ?auto_181473 ?auto_181475 ) ) ( ON ?auto_181472 ?auto_181473 ) ( ON-TABLE ?auto_181474 ) ( ON ?auto_181475 ?auto_181474 ) ( not ( = ?auto_181474 ?auto_181475 ) ) ( not ( = ?auto_181474 ?auto_181473 ) ) ( not ( = ?auto_181474 ?auto_181472 ) ) ( not ( = ?auto_181467 ?auto_181474 ) ) ( not ( = ?auto_181468 ?auto_181474 ) ) ( not ( = ?auto_181469 ?auto_181474 ) ) ( not ( = ?auto_181470 ?auto_181474 ) ) ( not ( = ?auto_181471 ?auto_181474 ) ) ( ON ?auto_181471 ?auto_181472 ) ( CLEAR ?auto_181469 ) ( ON ?auto_181470 ?auto_181471 ) ( CLEAR ?auto_181470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181474 ?auto_181475 ?auto_181473 ?auto_181472 ?auto_181471 )
      ( MAKE-7PILE ?auto_181467 ?auto_181468 ?auto_181469 ?auto_181470 ?auto_181471 ?auto_181472 ?auto_181473 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181476 - BLOCK
      ?auto_181477 - BLOCK
      ?auto_181478 - BLOCK
      ?auto_181479 - BLOCK
      ?auto_181480 - BLOCK
      ?auto_181481 - BLOCK
      ?auto_181482 - BLOCK
    )
    :vars
    (
      ?auto_181483 - BLOCK
      ?auto_181484 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181476 ) ( ON ?auto_181477 ?auto_181476 ) ( not ( = ?auto_181476 ?auto_181477 ) ) ( not ( = ?auto_181476 ?auto_181478 ) ) ( not ( = ?auto_181476 ?auto_181479 ) ) ( not ( = ?auto_181476 ?auto_181480 ) ) ( not ( = ?auto_181476 ?auto_181481 ) ) ( not ( = ?auto_181476 ?auto_181482 ) ) ( not ( = ?auto_181477 ?auto_181478 ) ) ( not ( = ?auto_181477 ?auto_181479 ) ) ( not ( = ?auto_181477 ?auto_181480 ) ) ( not ( = ?auto_181477 ?auto_181481 ) ) ( not ( = ?auto_181477 ?auto_181482 ) ) ( not ( = ?auto_181478 ?auto_181479 ) ) ( not ( = ?auto_181478 ?auto_181480 ) ) ( not ( = ?auto_181478 ?auto_181481 ) ) ( not ( = ?auto_181478 ?auto_181482 ) ) ( not ( = ?auto_181479 ?auto_181480 ) ) ( not ( = ?auto_181479 ?auto_181481 ) ) ( not ( = ?auto_181479 ?auto_181482 ) ) ( not ( = ?auto_181480 ?auto_181481 ) ) ( not ( = ?auto_181480 ?auto_181482 ) ) ( not ( = ?auto_181481 ?auto_181482 ) ) ( ON ?auto_181482 ?auto_181483 ) ( not ( = ?auto_181476 ?auto_181483 ) ) ( not ( = ?auto_181477 ?auto_181483 ) ) ( not ( = ?auto_181478 ?auto_181483 ) ) ( not ( = ?auto_181479 ?auto_181483 ) ) ( not ( = ?auto_181480 ?auto_181483 ) ) ( not ( = ?auto_181481 ?auto_181483 ) ) ( not ( = ?auto_181482 ?auto_181483 ) ) ( ON ?auto_181481 ?auto_181482 ) ( ON-TABLE ?auto_181484 ) ( ON ?auto_181483 ?auto_181484 ) ( not ( = ?auto_181484 ?auto_181483 ) ) ( not ( = ?auto_181484 ?auto_181482 ) ) ( not ( = ?auto_181484 ?auto_181481 ) ) ( not ( = ?auto_181476 ?auto_181484 ) ) ( not ( = ?auto_181477 ?auto_181484 ) ) ( not ( = ?auto_181478 ?auto_181484 ) ) ( not ( = ?auto_181479 ?auto_181484 ) ) ( not ( = ?auto_181480 ?auto_181484 ) ) ( ON ?auto_181480 ?auto_181481 ) ( ON ?auto_181479 ?auto_181480 ) ( CLEAR ?auto_181479 ) ( HOLDING ?auto_181478 ) ( CLEAR ?auto_181477 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181476 ?auto_181477 ?auto_181478 )
      ( MAKE-7PILE ?auto_181476 ?auto_181477 ?auto_181478 ?auto_181479 ?auto_181480 ?auto_181481 ?auto_181482 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181485 - BLOCK
      ?auto_181486 - BLOCK
      ?auto_181487 - BLOCK
      ?auto_181488 - BLOCK
      ?auto_181489 - BLOCK
      ?auto_181490 - BLOCK
      ?auto_181491 - BLOCK
    )
    :vars
    (
      ?auto_181492 - BLOCK
      ?auto_181493 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181485 ) ( ON ?auto_181486 ?auto_181485 ) ( not ( = ?auto_181485 ?auto_181486 ) ) ( not ( = ?auto_181485 ?auto_181487 ) ) ( not ( = ?auto_181485 ?auto_181488 ) ) ( not ( = ?auto_181485 ?auto_181489 ) ) ( not ( = ?auto_181485 ?auto_181490 ) ) ( not ( = ?auto_181485 ?auto_181491 ) ) ( not ( = ?auto_181486 ?auto_181487 ) ) ( not ( = ?auto_181486 ?auto_181488 ) ) ( not ( = ?auto_181486 ?auto_181489 ) ) ( not ( = ?auto_181486 ?auto_181490 ) ) ( not ( = ?auto_181486 ?auto_181491 ) ) ( not ( = ?auto_181487 ?auto_181488 ) ) ( not ( = ?auto_181487 ?auto_181489 ) ) ( not ( = ?auto_181487 ?auto_181490 ) ) ( not ( = ?auto_181487 ?auto_181491 ) ) ( not ( = ?auto_181488 ?auto_181489 ) ) ( not ( = ?auto_181488 ?auto_181490 ) ) ( not ( = ?auto_181488 ?auto_181491 ) ) ( not ( = ?auto_181489 ?auto_181490 ) ) ( not ( = ?auto_181489 ?auto_181491 ) ) ( not ( = ?auto_181490 ?auto_181491 ) ) ( ON ?auto_181491 ?auto_181492 ) ( not ( = ?auto_181485 ?auto_181492 ) ) ( not ( = ?auto_181486 ?auto_181492 ) ) ( not ( = ?auto_181487 ?auto_181492 ) ) ( not ( = ?auto_181488 ?auto_181492 ) ) ( not ( = ?auto_181489 ?auto_181492 ) ) ( not ( = ?auto_181490 ?auto_181492 ) ) ( not ( = ?auto_181491 ?auto_181492 ) ) ( ON ?auto_181490 ?auto_181491 ) ( ON-TABLE ?auto_181493 ) ( ON ?auto_181492 ?auto_181493 ) ( not ( = ?auto_181493 ?auto_181492 ) ) ( not ( = ?auto_181493 ?auto_181491 ) ) ( not ( = ?auto_181493 ?auto_181490 ) ) ( not ( = ?auto_181485 ?auto_181493 ) ) ( not ( = ?auto_181486 ?auto_181493 ) ) ( not ( = ?auto_181487 ?auto_181493 ) ) ( not ( = ?auto_181488 ?auto_181493 ) ) ( not ( = ?auto_181489 ?auto_181493 ) ) ( ON ?auto_181489 ?auto_181490 ) ( ON ?auto_181488 ?auto_181489 ) ( CLEAR ?auto_181486 ) ( ON ?auto_181487 ?auto_181488 ) ( CLEAR ?auto_181487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181493 ?auto_181492 ?auto_181491 ?auto_181490 ?auto_181489 ?auto_181488 )
      ( MAKE-7PILE ?auto_181485 ?auto_181486 ?auto_181487 ?auto_181488 ?auto_181489 ?auto_181490 ?auto_181491 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181494 - BLOCK
      ?auto_181495 - BLOCK
      ?auto_181496 - BLOCK
      ?auto_181497 - BLOCK
      ?auto_181498 - BLOCK
      ?auto_181499 - BLOCK
      ?auto_181500 - BLOCK
    )
    :vars
    (
      ?auto_181502 - BLOCK
      ?auto_181501 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181494 ) ( not ( = ?auto_181494 ?auto_181495 ) ) ( not ( = ?auto_181494 ?auto_181496 ) ) ( not ( = ?auto_181494 ?auto_181497 ) ) ( not ( = ?auto_181494 ?auto_181498 ) ) ( not ( = ?auto_181494 ?auto_181499 ) ) ( not ( = ?auto_181494 ?auto_181500 ) ) ( not ( = ?auto_181495 ?auto_181496 ) ) ( not ( = ?auto_181495 ?auto_181497 ) ) ( not ( = ?auto_181495 ?auto_181498 ) ) ( not ( = ?auto_181495 ?auto_181499 ) ) ( not ( = ?auto_181495 ?auto_181500 ) ) ( not ( = ?auto_181496 ?auto_181497 ) ) ( not ( = ?auto_181496 ?auto_181498 ) ) ( not ( = ?auto_181496 ?auto_181499 ) ) ( not ( = ?auto_181496 ?auto_181500 ) ) ( not ( = ?auto_181497 ?auto_181498 ) ) ( not ( = ?auto_181497 ?auto_181499 ) ) ( not ( = ?auto_181497 ?auto_181500 ) ) ( not ( = ?auto_181498 ?auto_181499 ) ) ( not ( = ?auto_181498 ?auto_181500 ) ) ( not ( = ?auto_181499 ?auto_181500 ) ) ( ON ?auto_181500 ?auto_181502 ) ( not ( = ?auto_181494 ?auto_181502 ) ) ( not ( = ?auto_181495 ?auto_181502 ) ) ( not ( = ?auto_181496 ?auto_181502 ) ) ( not ( = ?auto_181497 ?auto_181502 ) ) ( not ( = ?auto_181498 ?auto_181502 ) ) ( not ( = ?auto_181499 ?auto_181502 ) ) ( not ( = ?auto_181500 ?auto_181502 ) ) ( ON ?auto_181499 ?auto_181500 ) ( ON-TABLE ?auto_181501 ) ( ON ?auto_181502 ?auto_181501 ) ( not ( = ?auto_181501 ?auto_181502 ) ) ( not ( = ?auto_181501 ?auto_181500 ) ) ( not ( = ?auto_181501 ?auto_181499 ) ) ( not ( = ?auto_181494 ?auto_181501 ) ) ( not ( = ?auto_181495 ?auto_181501 ) ) ( not ( = ?auto_181496 ?auto_181501 ) ) ( not ( = ?auto_181497 ?auto_181501 ) ) ( not ( = ?auto_181498 ?auto_181501 ) ) ( ON ?auto_181498 ?auto_181499 ) ( ON ?auto_181497 ?auto_181498 ) ( ON ?auto_181496 ?auto_181497 ) ( CLEAR ?auto_181496 ) ( HOLDING ?auto_181495 ) ( CLEAR ?auto_181494 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181494 ?auto_181495 )
      ( MAKE-7PILE ?auto_181494 ?auto_181495 ?auto_181496 ?auto_181497 ?auto_181498 ?auto_181499 ?auto_181500 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181503 - BLOCK
      ?auto_181504 - BLOCK
      ?auto_181505 - BLOCK
      ?auto_181506 - BLOCK
      ?auto_181507 - BLOCK
      ?auto_181508 - BLOCK
      ?auto_181509 - BLOCK
    )
    :vars
    (
      ?auto_181511 - BLOCK
      ?auto_181510 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181503 ) ( not ( = ?auto_181503 ?auto_181504 ) ) ( not ( = ?auto_181503 ?auto_181505 ) ) ( not ( = ?auto_181503 ?auto_181506 ) ) ( not ( = ?auto_181503 ?auto_181507 ) ) ( not ( = ?auto_181503 ?auto_181508 ) ) ( not ( = ?auto_181503 ?auto_181509 ) ) ( not ( = ?auto_181504 ?auto_181505 ) ) ( not ( = ?auto_181504 ?auto_181506 ) ) ( not ( = ?auto_181504 ?auto_181507 ) ) ( not ( = ?auto_181504 ?auto_181508 ) ) ( not ( = ?auto_181504 ?auto_181509 ) ) ( not ( = ?auto_181505 ?auto_181506 ) ) ( not ( = ?auto_181505 ?auto_181507 ) ) ( not ( = ?auto_181505 ?auto_181508 ) ) ( not ( = ?auto_181505 ?auto_181509 ) ) ( not ( = ?auto_181506 ?auto_181507 ) ) ( not ( = ?auto_181506 ?auto_181508 ) ) ( not ( = ?auto_181506 ?auto_181509 ) ) ( not ( = ?auto_181507 ?auto_181508 ) ) ( not ( = ?auto_181507 ?auto_181509 ) ) ( not ( = ?auto_181508 ?auto_181509 ) ) ( ON ?auto_181509 ?auto_181511 ) ( not ( = ?auto_181503 ?auto_181511 ) ) ( not ( = ?auto_181504 ?auto_181511 ) ) ( not ( = ?auto_181505 ?auto_181511 ) ) ( not ( = ?auto_181506 ?auto_181511 ) ) ( not ( = ?auto_181507 ?auto_181511 ) ) ( not ( = ?auto_181508 ?auto_181511 ) ) ( not ( = ?auto_181509 ?auto_181511 ) ) ( ON ?auto_181508 ?auto_181509 ) ( ON-TABLE ?auto_181510 ) ( ON ?auto_181511 ?auto_181510 ) ( not ( = ?auto_181510 ?auto_181511 ) ) ( not ( = ?auto_181510 ?auto_181509 ) ) ( not ( = ?auto_181510 ?auto_181508 ) ) ( not ( = ?auto_181503 ?auto_181510 ) ) ( not ( = ?auto_181504 ?auto_181510 ) ) ( not ( = ?auto_181505 ?auto_181510 ) ) ( not ( = ?auto_181506 ?auto_181510 ) ) ( not ( = ?auto_181507 ?auto_181510 ) ) ( ON ?auto_181507 ?auto_181508 ) ( ON ?auto_181506 ?auto_181507 ) ( ON ?auto_181505 ?auto_181506 ) ( CLEAR ?auto_181503 ) ( ON ?auto_181504 ?auto_181505 ) ( CLEAR ?auto_181504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181510 ?auto_181511 ?auto_181509 ?auto_181508 ?auto_181507 ?auto_181506 ?auto_181505 )
      ( MAKE-7PILE ?auto_181503 ?auto_181504 ?auto_181505 ?auto_181506 ?auto_181507 ?auto_181508 ?auto_181509 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181512 - BLOCK
      ?auto_181513 - BLOCK
      ?auto_181514 - BLOCK
      ?auto_181515 - BLOCK
      ?auto_181516 - BLOCK
      ?auto_181517 - BLOCK
      ?auto_181518 - BLOCK
    )
    :vars
    (
      ?auto_181520 - BLOCK
      ?auto_181519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181512 ?auto_181513 ) ) ( not ( = ?auto_181512 ?auto_181514 ) ) ( not ( = ?auto_181512 ?auto_181515 ) ) ( not ( = ?auto_181512 ?auto_181516 ) ) ( not ( = ?auto_181512 ?auto_181517 ) ) ( not ( = ?auto_181512 ?auto_181518 ) ) ( not ( = ?auto_181513 ?auto_181514 ) ) ( not ( = ?auto_181513 ?auto_181515 ) ) ( not ( = ?auto_181513 ?auto_181516 ) ) ( not ( = ?auto_181513 ?auto_181517 ) ) ( not ( = ?auto_181513 ?auto_181518 ) ) ( not ( = ?auto_181514 ?auto_181515 ) ) ( not ( = ?auto_181514 ?auto_181516 ) ) ( not ( = ?auto_181514 ?auto_181517 ) ) ( not ( = ?auto_181514 ?auto_181518 ) ) ( not ( = ?auto_181515 ?auto_181516 ) ) ( not ( = ?auto_181515 ?auto_181517 ) ) ( not ( = ?auto_181515 ?auto_181518 ) ) ( not ( = ?auto_181516 ?auto_181517 ) ) ( not ( = ?auto_181516 ?auto_181518 ) ) ( not ( = ?auto_181517 ?auto_181518 ) ) ( ON ?auto_181518 ?auto_181520 ) ( not ( = ?auto_181512 ?auto_181520 ) ) ( not ( = ?auto_181513 ?auto_181520 ) ) ( not ( = ?auto_181514 ?auto_181520 ) ) ( not ( = ?auto_181515 ?auto_181520 ) ) ( not ( = ?auto_181516 ?auto_181520 ) ) ( not ( = ?auto_181517 ?auto_181520 ) ) ( not ( = ?auto_181518 ?auto_181520 ) ) ( ON ?auto_181517 ?auto_181518 ) ( ON-TABLE ?auto_181519 ) ( ON ?auto_181520 ?auto_181519 ) ( not ( = ?auto_181519 ?auto_181520 ) ) ( not ( = ?auto_181519 ?auto_181518 ) ) ( not ( = ?auto_181519 ?auto_181517 ) ) ( not ( = ?auto_181512 ?auto_181519 ) ) ( not ( = ?auto_181513 ?auto_181519 ) ) ( not ( = ?auto_181514 ?auto_181519 ) ) ( not ( = ?auto_181515 ?auto_181519 ) ) ( not ( = ?auto_181516 ?auto_181519 ) ) ( ON ?auto_181516 ?auto_181517 ) ( ON ?auto_181515 ?auto_181516 ) ( ON ?auto_181514 ?auto_181515 ) ( ON ?auto_181513 ?auto_181514 ) ( CLEAR ?auto_181513 ) ( HOLDING ?auto_181512 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_181512 )
      ( MAKE-7PILE ?auto_181512 ?auto_181513 ?auto_181514 ?auto_181515 ?auto_181516 ?auto_181517 ?auto_181518 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181521 - BLOCK
      ?auto_181522 - BLOCK
      ?auto_181523 - BLOCK
      ?auto_181524 - BLOCK
      ?auto_181525 - BLOCK
      ?auto_181526 - BLOCK
      ?auto_181527 - BLOCK
    )
    :vars
    (
      ?auto_181529 - BLOCK
      ?auto_181528 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181521 ?auto_181522 ) ) ( not ( = ?auto_181521 ?auto_181523 ) ) ( not ( = ?auto_181521 ?auto_181524 ) ) ( not ( = ?auto_181521 ?auto_181525 ) ) ( not ( = ?auto_181521 ?auto_181526 ) ) ( not ( = ?auto_181521 ?auto_181527 ) ) ( not ( = ?auto_181522 ?auto_181523 ) ) ( not ( = ?auto_181522 ?auto_181524 ) ) ( not ( = ?auto_181522 ?auto_181525 ) ) ( not ( = ?auto_181522 ?auto_181526 ) ) ( not ( = ?auto_181522 ?auto_181527 ) ) ( not ( = ?auto_181523 ?auto_181524 ) ) ( not ( = ?auto_181523 ?auto_181525 ) ) ( not ( = ?auto_181523 ?auto_181526 ) ) ( not ( = ?auto_181523 ?auto_181527 ) ) ( not ( = ?auto_181524 ?auto_181525 ) ) ( not ( = ?auto_181524 ?auto_181526 ) ) ( not ( = ?auto_181524 ?auto_181527 ) ) ( not ( = ?auto_181525 ?auto_181526 ) ) ( not ( = ?auto_181525 ?auto_181527 ) ) ( not ( = ?auto_181526 ?auto_181527 ) ) ( ON ?auto_181527 ?auto_181529 ) ( not ( = ?auto_181521 ?auto_181529 ) ) ( not ( = ?auto_181522 ?auto_181529 ) ) ( not ( = ?auto_181523 ?auto_181529 ) ) ( not ( = ?auto_181524 ?auto_181529 ) ) ( not ( = ?auto_181525 ?auto_181529 ) ) ( not ( = ?auto_181526 ?auto_181529 ) ) ( not ( = ?auto_181527 ?auto_181529 ) ) ( ON ?auto_181526 ?auto_181527 ) ( ON-TABLE ?auto_181528 ) ( ON ?auto_181529 ?auto_181528 ) ( not ( = ?auto_181528 ?auto_181529 ) ) ( not ( = ?auto_181528 ?auto_181527 ) ) ( not ( = ?auto_181528 ?auto_181526 ) ) ( not ( = ?auto_181521 ?auto_181528 ) ) ( not ( = ?auto_181522 ?auto_181528 ) ) ( not ( = ?auto_181523 ?auto_181528 ) ) ( not ( = ?auto_181524 ?auto_181528 ) ) ( not ( = ?auto_181525 ?auto_181528 ) ) ( ON ?auto_181525 ?auto_181526 ) ( ON ?auto_181524 ?auto_181525 ) ( ON ?auto_181523 ?auto_181524 ) ( ON ?auto_181522 ?auto_181523 ) ( ON ?auto_181521 ?auto_181522 ) ( CLEAR ?auto_181521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_181528 ?auto_181529 ?auto_181527 ?auto_181526 ?auto_181525 ?auto_181524 ?auto_181523 ?auto_181522 )
      ( MAKE-7PILE ?auto_181521 ?auto_181522 ?auto_181523 ?auto_181524 ?auto_181525 ?auto_181526 ?auto_181527 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_181531 - BLOCK
    )
    :vars
    (
      ?auto_181532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181532 ?auto_181531 ) ( CLEAR ?auto_181532 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_181531 ) ( not ( = ?auto_181531 ?auto_181532 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_181532 ?auto_181531 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_181533 - BLOCK
    )
    :vars
    (
      ?auto_181534 - BLOCK
      ?auto_181535 - BLOCK
      ?auto_181536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181534 ?auto_181533 ) ( CLEAR ?auto_181534 ) ( ON-TABLE ?auto_181533 ) ( not ( = ?auto_181533 ?auto_181534 ) ) ( HOLDING ?auto_181535 ) ( CLEAR ?auto_181536 ) ( not ( = ?auto_181533 ?auto_181535 ) ) ( not ( = ?auto_181533 ?auto_181536 ) ) ( not ( = ?auto_181534 ?auto_181535 ) ) ( not ( = ?auto_181534 ?auto_181536 ) ) ( not ( = ?auto_181535 ?auto_181536 ) ) )
    :subtasks
    ( ( !STACK ?auto_181535 ?auto_181536 )
      ( MAKE-1PILE ?auto_181533 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_181537 - BLOCK
    )
    :vars
    (
      ?auto_181540 - BLOCK
      ?auto_181538 - BLOCK
      ?auto_181539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181540 ?auto_181537 ) ( ON-TABLE ?auto_181537 ) ( not ( = ?auto_181537 ?auto_181540 ) ) ( CLEAR ?auto_181538 ) ( not ( = ?auto_181537 ?auto_181539 ) ) ( not ( = ?auto_181537 ?auto_181538 ) ) ( not ( = ?auto_181540 ?auto_181539 ) ) ( not ( = ?auto_181540 ?auto_181538 ) ) ( not ( = ?auto_181539 ?auto_181538 ) ) ( ON ?auto_181539 ?auto_181540 ) ( CLEAR ?auto_181539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181537 ?auto_181540 )
      ( MAKE-1PILE ?auto_181537 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_181541 - BLOCK
    )
    :vars
    (
      ?auto_181543 - BLOCK
      ?auto_181542 - BLOCK
      ?auto_181544 - BLOCK
      ?auto_181548 - BLOCK
      ?auto_181547 - BLOCK
      ?auto_181545 - BLOCK
      ?auto_181546 - BLOCK
      ?auto_181549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181543 ?auto_181541 ) ( ON-TABLE ?auto_181541 ) ( not ( = ?auto_181541 ?auto_181543 ) ) ( not ( = ?auto_181541 ?auto_181542 ) ) ( not ( = ?auto_181541 ?auto_181544 ) ) ( not ( = ?auto_181543 ?auto_181542 ) ) ( not ( = ?auto_181543 ?auto_181544 ) ) ( not ( = ?auto_181542 ?auto_181544 ) ) ( ON ?auto_181542 ?auto_181543 ) ( CLEAR ?auto_181542 ) ( HOLDING ?auto_181544 ) ( CLEAR ?auto_181548 ) ( ON-TABLE ?auto_181547 ) ( ON ?auto_181545 ?auto_181547 ) ( ON ?auto_181546 ?auto_181545 ) ( ON ?auto_181549 ?auto_181546 ) ( ON ?auto_181548 ?auto_181549 ) ( not ( = ?auto_181547 ?auto_181545 ) ) ( not ( = ?auto_181547 ?auto_181546 ) ) ( not ( = ?auto_181547 ?auto_181549 ) ) ( not ( = ?auto_181547 ?auto_181548 ) ) ( not ( = ?auto_181547 ?auto_181544 ) ) ( not ( = ?auto_181545 ?auto_181546 ) ) ( not ( = ?auto_181545 ?auto_181549 ) ) ( not ( = ?auto_181545 ?auto_181548 ) ) ( not ( = ?auto_181545 ?auto_181544 ) ) ( not ( = ?auto_181546 ?auto_181549 ) ) ( not ( = ?auto_181546 ?auto_181548 ) ) ( not ( = ?auto_181546 ?auto_181544 ) ) ( not ( = ?auto_181549 ?auto_181548 ) ) ( not ( = ?auto_181549 ?auto_181544 ) ) ( not ( = ?auto_181548 ?auto_181544 ) ) ( not ( = ?auto_181541 ?auto_181548 ) ) ( not ( = ?auto_181541 ?auto_181547 ) ) ( not ( = ?auto_181541 ?auto_181545 ) ) ( not ( = ?auto_181541 ?auto_181546 ) ) ( not ( = ?auto_181541 ?auto_181549 ) ) ( not ( = ?auto_181543 ?auto_181548 ) ) ( not ( = ?auto_181543 ?auto_181547 ) ) ( not ( = ?auto_181543 ?auto_181545 ) ) ( not ( = ?auto_181543 ?auto_181546 ) ) ( not ( = ?auto_181543 ?auto_181549 ) ) ( not ( = ?auto_181542 ?auto_181548 ) ) ( not ( = ?auto_181542 ?auto_181547 ) ) ( not ( = ?auto_181542 ?auto_181545 ) ) ( not ( = ?auto_181542 ?auto_181546 ) ) ( not ( = ?auto_181542 ?auto_181549 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181547 ?auto_181545 ?auto_181546 ?auto_181549 ?auto_181548 ?auto_181544 )
      ( MAKE-1PILE ?auto_181541 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_181550 - BLOCK
    )
    :vars
    (
      ?auto_181557 - BLOCK
      ?auto_181555 - BLOCK
      ?auto_181556 - BLOCK
      ?auto_181551 - BLOCK
      ?auto_181553 - BLOCK
      ?auto_181558 - BLOCK
      ?auto_181552 - BLOCK
      ?auto_181554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181557 ?auto_181550 ) ( ON-TABLE ?auto_181550 ) ( not ( = ?auto_181550 ?auto_181557 ) ) ( not ( = ?auto_181550 ?auto_181555 ) ) ( not ( = ?auto_181550 ?auto_181556 ) ) ( not ( = ?auto_181557 ?auto_181555 ) ) ( not ( = ?auto_181557 ?auto_181556 ) ) ( not ( = ?auto_181555 ?auto_181556 ) ) ( ON ?auto_181555 ?auto_181557 ) ( CLEAR ?auto_181551 ) ( ON-TABLE ?auto_181553 ) ( ON ?auto_181558 ?auto_181553 ) ( ON ?auto_181552 ?auto_181558 ) ( ON ?auto_181554 ?auto_181552 ) ( ON ?auto_181551 ?auto_181554 ) ( not ( = ?auto_181553 ?auto_181558 ) ) ( not ( = ?auto_181553 ?auto_181552 ) ) ( not ( = ?auto_181553 ?auto_181554 ) ) ( not ( = ?auto_181553 ?auto_181551 ) ) ( not ( = ?auto_181553 ?auto_181556 ) ) ( not ( = ?auto_181558 ?auto_181552 ) ) ( not ( = ?auto_181558 ?auto_181554 ) ) ( not ( = ?auto_181558 ?auto_181551 ) ) ( not ( = ?auto_181558 ?auto_181556 ) ) ( not ( = ?auto_181552 ?auto_181554 ) ) ( not ( = ?auto_181552 ?auto_181551 ) ) ( not ( = ?auto_181552 ?auto_181556 ) ) ( not ( = ?auto_181554 ?auto_181551 ) ) ( not ( = ?auto_181554 ?auto_181556 ) ) ( not ( = ?auto_181551 ?auto_181556 ) ) ( not ( = ?auto_181550 ?auto_181551 ) ) ( not ( = ?auto_181550 ?auto_181553 ) ) ( not ( = ?auto_181550 ?auto_181558 ) ) ( not ( = ?auto_181550 ?auto_181552 ) ) ( not ( = ?auto_181550 ?auto_181554 ) ) ( not ( = ?auto_181557 ?auto_181551 ) ) ( not ( = ?auto_181557 ?auto_181553 ) ) ( not ( = ?auto_181557 ?auto_181558 ) ) ( not ( = ?auto_181557 ?auto_181552 ) ) ( not ( = ?auto_181557 ?auto_181554 ) ) ( not ( = ?auto_181555 ?auto_181551 ) ) ( not ( = ?auto_181555 ?auto_181553 ) ) ( not ( = ?auto_181555 ?auto_181558 ) ) ( not ( = ?auto_181555 ?auto_181552 ) ) ( not ( = ?auto_181555 ?auto_181554 ) ) ( ON ?auto_181556 ?auto_181555 ) ( CLEAR ?auto_181556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181550 ?auto_181557 ?auto_181555 )
      ( MAKE-1PILE ?auto_181550 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_181559 - BLOCK
    )
    :vars
    (
      ?auto_181561 - BLOCK
      ?auto_181567 - BLOCK
      ?auto_181565 - BLOCK
      ?auto_181564 - BLOCK
      ?auto_181566 - BLOCK
      ?auto_181562 - BLOCK
      ?auto_181560 - BLOCK
      ?auto_181563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181561 ?auto_181559 ) ( ON-TABLE ?auto_181559 ) ( not ( = ?auto_181559 ?auto_181561 ) ) ( not ( = ?auto_181559 ?auto_181567 ) ) ( not ( = ?auto_181559 ?auto_181565 ) ) ( not ( = ?auto_181561 ?auto_181567 ) ) ( not ( = ?auto_181561 ?auto_181565 ) ) ( not ( = ?auto_181567 ?auto_181565 ) ) ( ON ?auto_181567 ?auto_181561 ) ( ON-TABLE ?auto_181564 ) ( ON ?auto_181566 ?auto_181564 ) ( ON ?auto_181562 ?auto_181566 ) ( ON ?auto_181560 ?auto_181562 ) ( not ( = ?auto_181564 ?auto_181566 ) ) ( not ( = ?auto_181564 ?auto_181562 ) ) ( not ( = ?auto_181564 ?auto_181560 ) ) ( not ( = ?auto_181564 ?auto_181563 ) ) ( not ( = ?auto_181564 ?auto_181565 ) ) ( not ( = ?auto_181566 ?auto_181562 ) ) ( not ( = ?auto_181566 ?auto_181560 ) ) ( not ( = ?auto_181566 ?auto_181563 ) ) ( not ( = ?auto_181566 ?auto_181565 ) ) ( not ( = ?auto_181562 ?auto_181560 ) ) ( not ( = ?auto_181562 ?auto_181563 ) ) ( not ( = ?auto_181562 ?auto_181565 ) ) ( not ( = ?auto_181560 ?auto_181563 ) ) ( not ( = ?auto_181560 ?auto_181565 ) ) ( not ( = ?auto_181563 ?auto_181565 ) ) ( not ( = ?auto_181559 ?auto_181563 ) ) ( not ( = ?auto_181559 ?auto_181564 ) ) ( not ( = ?auto_181559 ?auto_181566 ) ) ( not ( = ?auto_181559 ?auto_181562 ) ) ( not ( = ?auto_181559 ?auto_181560 ) ) ( not ( = ?auto_181561 ?auto_181563 ) ) ( not ( = ?auto_181561 ?auto_181564 ) ) ( not ( = ?auto_181561 ?auto_181566 ) ) ( not ( = ?auto_181561 ?auto_181562 ) ) ( not ( = ?auto_181561 ?auto_181560 ) ) ( not ( = ?auto_181567 ?auto_181563 ) ) ( not ( = ?auto_181567 ?auto_181564 ) ) ( not ( = ?auto_181567 ?auto_181566 ) ) ( not ( = ?auto_181567 ?auto_181562 ) ) ( not ( = ?auto_181567 ?auto_181560 ) ) ( ON ?auto_181565 ?auto_181567 ) ( CLEAR ?auto_181565 ) ( HOLDING ?auto_181563 ) ( CLEAR ?auto_181560 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181564 ?auto_181566 ?auto_181562 ?auto_181560 ?auto_181563 )
      ( MAKE-1PILE ?auto_181559 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_181568 - BLOCK
    )
    :vars
    (
      ?auto_181575 - BLOCK
      ?auto_181576 - BLOCK
      ?auto_181574 - BLOCK
      ?auto_181572 - BLOCK
      ?auto_181571 - BLOCK
      ?auto_181570 - BLOCK
      ?auto_181573 - BLOCK
      ?auto_181569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181575 ?auto_181568 ) ( ON-TABLE ?auto_181568 ) ( not ( = ?auto_181568 ?auto_181575 ) ) ( not ( = ?auto_181568 ?auto_181576 ) ) ( not ( = ?auto_181568 ?auto_181574 ) ) ( not ( = ?auto_181575 ?auto_181576 ) ) ( not ( = ?auto_181575 ?auto_181574 ) ) ( not ( = ?auto_181576 ?auto_181574 ) ) ( ON ?auto_181576 ?auto_181575 ) ( ON-TABLE ?auto_181572 ) ( ON ?auto_181571 ?auto_181572 ) ( ON ?auto_181570 ?auto_181571 ) ( ON ?auto_181573 ?auto_181570 ) ( not ( = ?auto_181572 ?auto_181571 ) ) ( not ( = ?auto_181572 ?auto_181570 ) ) ( not ( = ?auto_181572 ?auto_181573 ) ) ( not ( = ?auto_181572 ?auto_181569 ) ) ( not ( = ?auto_181572 ?auto_181574 ) ) ( not ( = ?auto_181571 ?auto_181570 ) ) ( not ( = ?auto_181571 ?auto_181573 ) ) ( not ( = ?auto_181571 ?auto_181569 ) ) ( not ( = ?auto_181571 ?auto_181574 ) ) ( not ( = ?auto_181570 ?auto_181573 ) ) ( not ( = ?auto_181570 ?auto_181569 ) ) ( not ( = ?auto_181570 ?auto_181574 ) ) ( not ( = ?auto_181573 ?auto_181569 ) ) ( not ( = ?auto_181573 ?auto_181574 ) ) ( not ( = ?auto_181569 ?auto_181574 ) ) ( not ( = ?auto_181568 ?auto_181569 ) ) ( not ( = ?auto_181568 ?auto_181572 ) ) ( not ( = ?auto_181568 ?auto_181571 ) ) ( not ( = ?auto_181568 ?auto_181570 ) ) ( not ( = ?auto_181568 ?auto_181573 ) ) ( not ( = ?auto_181575 ?auto_181569 ) ) ( not ( = ?auto_181575 ?auto_181572 ) ) ( not ( = ?auto_181575 ?auto_181571 ) ) ( not ( = ?auto_181575 ?auto_181570 ) ) ( not ( = ?auto_181575 ?auto_181573 ) ) ( not ( = ?auto_181576 ?auto_181569 ) ) ( not ( = ?auto_181576 ?auto_181572 ) ) ( not ( = ?auto_181576 ?auto_181571 ) ) ( not ( = ?auto_181576 ?auto_181570 ) ) ( not ( = ?auto_181576 ?auto_181573 ) ) ( ON ?auto_181574 ?auto_181576 ) ( CLEAR ?auto_181573 ) ( ON ?auto_181569 ?auto_181574 ) ( CLEAR ?auto_181569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181568 ?auto_181575 ?auto_181576 ?auto_181574 )
      ( MAKE-1PILE ?auto_181568 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_181577 - BLOCK
    )
    :vars
    (
      ?auto_181583 - BLOCK
      ?auto_181585 - BLOCK
      ?auto_181584 - BLOCK
      ?auto_181582 - BLOCK
      ?auto_181580 - BLOCK
      ?auto_181579 - BLOCK
      ?auto_181578 - BLOCK
      ?auto_181581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181583 ?auto_181577 ) ( ON-TABLE ?auto_181577 ) ( not ( = ?auto_181577 ?auto_181583 ) ) ( not ( = ?auto_181577 ?auto_181585 ) ) ( not ( = ?auto_181577 ?auto_181584 ) ) ( not ( = ?auto_181583 ?auto_181585 ) ) ( not ( = ?auto_181583 ?auto_181584 ) ) ( not ( = ?auto_181585 ?auto_181584 ) ) ( ON ?auto_181585 ?auto_181583 ) ( ON-TABLE ?auto_181582 ) ( ON ?auto_181580 ?auto_181582 ) ( ON ?auto_181579 ?auto_181580 ) ( not ( = ?auto_181582 ?auto_181580 ) ) ( not ( = ?auto_181582 ?auto_181579 ) ) ( not ( = ?auto_181582 ?auto_181578 ) ) ( not ( = ?auto_181582 ?auto_181581 ) ) ( not ( = ?auto_181582 ?auto_181584 ) ) ( not ( = ?auto_181580 ?auto_181579 ) ) ( not ( = ?auto_181580 ?auto_181578 ) ) ( not ( = ?auto_181580 ?auto_181581 ) ) ( not ( = ?auto_181580 ?auto_181584 ) ) ( not ( = ?auto_181579 ?auto_181578 ) ) ( not ( = ?auto_181579 ?auto_181581 ) ) ( not ( = ?auto_181579 ?auto_181584 ) ) ( not ( = ?auto_181578 ?auto_181581 ) ) ( not ( = ?auto_181578 ?auto_181584 ) ) ( not ( = ?auto_181581 ?auto_181584 ) ) ( not ( = ?auto_181577 ?auto_181581 ) ) ( not ( = ?auto_181577 ?auto_181582 ) ) ( not ( = ?auto_181577 ?auto_181580 ) ) ( not ( = ?auto_181577 ?auto_181579 ) ) ( not ( = ?auto_181577 ?auto_181578 ) ) ( not ( = ?auto_181583 ?auto_181581 ) ) ( not ( = ?auto_181583 ?auto_181582 ) ) ( not ( = ?auto_181583 ?auto_181580 ) ) ( not ( = ?auto_181583 ?auto_181579 ) ) ( not ( = ?auto_181583 ?auto_181578 ) ) ( not ( = ?auto_181585 ?auto_181581 ) ) ( not ( = ?auto_181585 ?auto_181582 ) ) ( not ( = ?auto_181585 ?auto_181580 ) ) ( not ( = ?auto_181585 ?auto_181579 ) ) ( not ( = ?auto_181585 ?auto_181578 ) ) ( ON ?auto_181584 ?auto_181585 ) ( ON ?auto_181581 ?auto_181584 ) ( CLEAR ?auto_181581 ) ( HOLDING ?auto_181578 ) ( CLEAR ?auto_181579 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181582 ?auto_181580 ?auto_181579 ?auto_181578 )
      ( MAKE-1PILE ?auto_181577 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_181586 - BLOCK
    )
    :vars
    (
      ?auto_181590 - BLOCK
      ?auto_181589 - BLOCK
      ?auto_181593 - BLOCK
      ?auto_181587 - BLOCK
      ?auto_181588 - BLOCK
      ?auto_181594 - BLOCK
      ?auto_181591 - BLOCK
      ?auto_181592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181590 ?auto_181586 ) ( ON-TABLE ?auto_181586 ) ( not ( = ?auto_181586 ?auto_181590 ) ) ( not ( = ?auto_181586 ?auto_181589 ) ) ( not ( = ?auto_181586 ?auto_181593 ) ) ( not ( = ?auto_181590 ?auto_181589 ) ) ( not ( = ?auto_181590 ?auto_181593 ) ) ( not ( = ?auto_181589 ?auto_181593 ) ) ( ON ?auto_181589 ?auto_181590 ) ( ON-TABLE ?auto_181587 ) ( ON ?auto_181588 ?auto_181587 ) ( ON ?auto_181594 ?auto_181588 ) ( not ( = ?auto_181587 ?auto_181588 ) ) ( not ( = ?auto_181587 ?auto_181594 ) ) ( not ( = ?auto_181587 ?auto_181591 ) ) ( not ( = ?auto_181587 ?auto_181592 ) ) ( not ( = ?auto_181587 ?auto_181593 ) ) ( not ( = ?auto_181588 ?auto_181594 ) ) ( not ( = ?auto_181588 ?auto_181591 ) ) ( not ( = ?auto_181588 ?auto_181592 ) ) ( not ( = ?auto_181588 ?auto_181593 ) ) ( not ( = ?auto_181594 ?auto_181591 ) ) ( not ( = ?auto_181594 ?auto_181592 ) ) ( not ( = ?auto_181594 ?auto_181593 ) ) ( not ( = ?auto_181591 ?auto_181592 ) ) ( not ( = ?auto_181591 ?auto_181593 ) ) ( not ( = ?auto_181592 ?auto_181593 ) ) ( not ( = ?auto_181586 ?auto_181592 ) ) ( not ( = ?auto_181586 ?auto_181587 ) ) ( not ( = ?auto_181586 ?auto_181588 ) ) ( not ( = ?auto_181586 ?auto_181594 ) ) ( not ( = ?auto_181586 ?auto_181591 ) ) ( not ( = ?auto_181590 ?auto_181592 ) ) ( not ( = ?auto_181590 ?auto_181587 ) ) ( not ( = ?auto_181590 ?auto_181588 ) ) ( not ( = ?auto_181590 ?auto_181594 ) ) ( not ( = ?auto_181590 ?auto_181591 ) ) ( not ( = ?auto_181589 ?auto_181592 ) ) ( not ( = ?auto_181589 ?auto_181587 ) ) ( not ( = ?auto_181589 ?auto_181588 ) ) ( not ( = ?auto_181589 ?auto_181594 ) ) ( not ( = ?auto_181589 ?auto_181591 ) ) ( ON ?auto_181593 ?auto_181589 ) ( ON ?auto_181592 ?auto_181593 ) ( CLEAR ?auto_181594 ) ( ON ?auto_181591 ?auto_181592 ) ( CLEAR ?auto_181591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181586 ?auto_181590 ?auto_181589 ?auto_181593 ?auto_181592 )
      ( MAKE-1PILE ?auto_181586 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_181595 - BLOCK
    )
    :vars
    (
      ?auto_181598 - BLOCK
      ?auto_181596 - BLOCK
      ?auto_181600 - BLOCK
      ?auto_181597 - BLOCK
      ?auto_181601 - BLOCK
      ?auto_181599 - BLOCK
      ?auto_181602 - BLOCK
      ?auto_181603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181598 ?auto_181595 ) ( ON-TABLE ?auto_181595 ) ( not ( = ?auto_181595 ?auto_181598 ) ) ( not ( = ?auto_181595 ?auto_181596 ) ) ( not ( = ?auto_181595 ?auto_181600 ) ) ( not ( = ?auto_181598 ?auto_181596 ) ) ( not ( = ?auto_181598 ?auto_181600 ) ) ( not ( = ?auto_181596 ?auto_181600 ) ) ( ON ?auto_181596 ?auto_181598 ) ( ON-TABLE ?auto_181597 ) ( ON ?auto_181601 ?auto_181597 ) ( not ( = ?auto_181597 ?auto_181601 ) ) ( not ( = ?auto_181597 ?auto_181599 ) ) ( not ( = ?auto_181597 ?auto_181602 ) ) ( not ( = ?auto_181597 ?auto_181603 ) ) ( not ( = ?auto_181597 ?auto_181600 ) ) ( not ( = ?auto_181601 ?auto_181599 ) ) ( not ( = ?auto_181601 ?auto_181602 ) ) ( not ( = ?auto_181601 ?auto_181603 ) ) ( not ( = ?auto_181601 ?auto_181600 ) ) ( not ( = ?auto_181599 ?auto_181602 ) ) ( not ( = ?auto_181599 ?auto_181603 ) ) ( not ( = ?auto_181599 ?auto_181600 ) ) ( not ( = ?auto_181602 ?auto_181603 ) ) ( not ( = ?auto_181602 ?auto_181600 ) ) ( not ( = ?auto_181603 ?auto_181600 ) ) ( not ( = ?auto_181595 ?auto_181603 ) ) ( not ( = ?auto_181595 ?auto_181597 ) ) ( not ( = ?auto_181595 ?auto_181601 ) ) ( not ( = ?auto_181595 ?auto_181599 ) ) ( not ( = ?auto_181595 ?auto_181602 ) ) ( not ( = ?auto_181598 ?auto_181603 ) ) ( not ( = ?auto_181598 ?auto_181597 ) ) ( not ( = ?auto_181598 ?auto_181601 ) ) ( not ( = ?auto_181598 ?auto_181599 ) ) ( not ( = ?auto_181598 ?auto_181602 ) ) ( not ( = ?auto_181596 ?auto_181603 ) ) ( not ( = ?auto_181596 ?auto_181597 ) ) ( not ( = ?auto_181596 ?auto_181601 ) ) ( not ( = ?auto_181596 ?auto_181599 ) ) ( not ( = ?auto_181596 ?auto_181602 ) ) ( ON ?auto_181600 ?auto_181596 ) ( ON ?auto_181603 ?auto_181600 ) ( ON ?auto_181602 ?auto_181603 ) ( CLEAR ?auto_181602 ) ( HOLDING ?auto_181599 ) ( CLEAR ?auto_181601 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181597 ?auto_181601 ?auto_181599 )
      ( MAKE-1PILE ?auto_181595 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_181604 - BLOCK
    )
    :vars
    (
      ?auto_181606 - BLOCK
      ?auto_181605 - BLOCK
      ?auto_181611 - BLOCK
      ?auto_181610 - BLOCK
      ?auto_181612 - BLOCK
      ?auto_181609 - BLOCK
      ?auto_181608 - BLOCK
      ?auto_181607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181606 ?auto_181604 ) ( ON-TABLE ?auto_181604 ) ( not ( = ?auto_181604 ?auto_181606 ) ) ( not ( = ?auto_181604 ?auto_181605 ) ) ( not ( = ?auto_181604 ?auto_181611 ) ) ( not ( = ?auto_181606 ?auto_181605 ) ) ( not ( = ?auto_181606 ?auto_181611 ) ) ( not ( = ?auto_181605 ?auto_181611 ) ) ( ON ?auto_181605 ?auto_181606 ) ( ON-TABLE ?auto_181610 ) ( ON ?auto_181612 ?auto_181610 ) ( not ( = ?auto_181610 ?auto_181612 ) ) ( not ( = ?auto_181610 ?auto_181609 ) ) ( not ( = ?auto_181610 ?auto_181608 ) ) ( not ( = ?auto_181610 ?auto_181607 ) ) ( not ( = ?auto_181610 ?auto_181611 ) ) ( not ( = ?auto_181612 ?auto_181609 ) ) ( not ( = ?auto_181612 ?auto_181608 ) ) ( not ( = ?auto_181612 ?auto_181607 ) ) ( not ( = ?auto_181612 ?auto_181611 ) ) ( not ( = ?auto_181609 ?auto_181608 ) ) ( not ( = ?auto_181609 ?auto_181607 ) ) ( not ( = ?auto_181609 ?auto_181611 ) ) ( not ( = ?auto_181608 ?auto_181607 ) ) ( not ( = ?auto_181608 ?auto_181611 ) ) ( not ( = ?auto_181607 ?auto_181611 ) ) ( not ( = ?auto_181604 ?auto_181607 ) ) ( not ( = ?auto_181604 ?auto_181610 ) ) ( not ( = ?auto_181604 ?auto_181612 ) ) ( not ( = ?auto_181604 ?auto_181609 ) ) ( not ( = ?auto_181604 ?auto_181608 ) ) ( not ( = ?auto_181606 ?auto_181607 ) ) ( not ( = ?auto_181606 ?auto_181610 ) ) ( not ( = ?auto_181606 ?auto_181612 ) ) ( not ( = ?auto_181606 ?auto_181609 ) ) ( not ( = ?auto_181606 ?auto_181608 ) ) ( not ( = ?auto_181605 ?auto_181607 ) ) ( not ( = ?auto_181605 ?auto_181610 ) ) ( not ( = ?auto_181605 ?auto_181612 ) ) ( not ( = ?auto_181605 ?auto_181609 ) ) ( not ( = ?auto_181605 ?auto_181608 ) ) ( ON ?auto_181611 ?auto_181605 ) ( ON ?auto_181607 ?auto_181611 ) ( ON ?auto_181608 ?auto_181607 ) ( CLEAR ?auto_181612 ) ( ON ?auto_181609 ?auto_181608 ) ( CLEAR ?auto_181609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181604 ?auto_181606 ?auto_181605 ?auto_181611 ?auto_181607 ?auto_181608 )
      ( MAKE-1PILE ?auto_181604 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_181613 - BLOCK
    )
    :vars
    (
      ?auto_181617 - BLOCK
      ?auto_181616 - BLOCK
      ?auto_181620 - BLOCK
      ?auto_181615 - BLOCK
      ?auto_181619 - BLOCK
      ?auto_181614 - BLOCK
      ?auto_181618 - BLOCK
      ?auto_181621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181617 ?auto_181613 ) ( ON-TABLE ?auto_181613 ) ( not ( = ?auto_181613 ?auto_181617 ) ) ( not ( = ?auto_181613 ?auto_181616 ) ) ( not ( = ?auto_181613 ?auto_181620 ) ) ( not ( = ?auto_181617 ?auto_181616 ) ) ( not ( = ?auto_181617 ?auto_181620 ) ) ( not ( = ?auto_181616 ?auto_181620 ) ) ( ON ?auto_181616 ?auto_181617 ) ( ON-TABLE ?auto_181615 ) ( not ( = ?auto_181615 ?auto_181619 ) ) ( not ( = ?auto_181615 ?auto_181614 ) ) ( not ( = ?auto_181615 ?auto_181618 ) ) ( not ( = ?auto_181615 ?auto_181621 ) ) ( not ( = ?auto_181615 ?auto_181620 ) ) ( not ( = ?auto_181619 ?auto_181614 ) ) ( not ( = ?auto_181619 ?auto_181618 ) ) ( not ( = ?auto_181619 ?auto_181621 ) ) ( not ( = ?auto_181619 ?auto_181620 ) ) ( not ( = ?auto_181614 ?auto_181618 ) ) ( not ( = ?auto_181614 ?auto_181621 ) ) ( not ( = ?auto_181614 ?auto_181620 ) ) ( not ( = ?auto_181618 ?auto_181621 ) ) ( not ( = ?auto_181618 ?auto_181620 ) ) ( not ( = ?auto_181621 ?auto_181620 ) ) ( not ( = ?auto_181613 ?auto_181621 ) ) ( not ( = ?auto_181613 ?auto_181615 ) ) ( not ( = ?auto_181613 ?auto_181619 ) ) ( not ( = ?auto_181613 ?auto_181614 ) ) ( not ( = ?auto_181613 ?auto_181618 ) ) ( not ( = ?auto_181617 ?auto_181621 ) ) ( not ( = ?auto_181617 ?auto_181615 ) ) ( not ( = ?auto_181617 ?auto_181619 ) ) ( not ( = ?auto_181617 ?auto_181614 ) ) ( not ( = ?auto_181617 ?auto_181618 ) ) ( not ( = ?auto_181616 ?auto_181621 ) ) ( not ( = ?auto_181616 ?auto_181615 ) ) ( not ( = ?auto_181616 ?auto_181619 ) ) ( not ( = ?auto_181616 ?auto_181614 ) ) ( not ( = ?auto_181616 ?auto_181618 ) ) ( ON ?auto_181620 ?auto_181616 ) ( ON ?auto_181621 ?auto_181620 ) ( ON ?auto_181618 ?auto_181621 ) ( ON ?auto_181614 ?auto_181618 ) ( CLEAR ?auto_181614 ) ( HOLDING ?auto_181619 ) ( CLEAR ?auto_181615 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181615 ?auto_181619 )
      ( MAKE-1PILE ?auto_181613 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_183792 - BLOCK
    )
    :vars
    (
      ?auto_183795 - BLOCK
      ?auto_183797 - BLOCK
      ?auto_183798 - BLOCK
      ?auto_183793 - BLOCK
      ?auto_183799 - BLOCK
      ?auto_183794 - BLOCK
      ?auto_183796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183795 ?auto_183792 ) ( ON-TABLE ?auto_183792 ) ( not ( = ?auto_183792 ?auto_183795 ) ) ( not ( = ?auto_183792 ?auto_183797 ) ) ( not ( = ?auto_183792 ?auto_183798 ) ) ( not ( = ?auto_183795 ?auto_183797 ) ) ( not ( = ?auto_183795 ?auto_183798 ) ) ( not ( = ?auto_183797 ?auto_183798 ) ) ( ON ?auto_183797 ?auto_183795 ) ( not ( = ?auto_183793 ?auto_183799 ) ) ( not ( = ?auto_183793 ?auto_183794 ) ) ( not ( = ?auto_183793 ?auto_183796 ) ) ( not ( = ?auto_183793 ?auto_183798 ) ) ( not ( = ?auto_183799 ?auto_183794 ) ) ( not ( = ?auto_183799 ?auto_183796 ) ) ( not ( = ?auto_183799 ?auto_183798 ) ) ( not ( = ?auto_183794 ?auto_183796 ) ) ( not ( = ?auto_183794 ?auto_183798 ) ) ( not ( = ?auto_183796 ?auto_183798 ) ) ( not ( = ?auto_183792 ?auto_183796 ) ) ( not ( = ?auto_183792 ?auto_183793 ) ) ( not ( = ?auto_183792 ?auto_183799 ) ) ( not ( = ?auto_183792 ?auto_183794 ) ) ( not ( = ?auto_183795 ?auto_183796 ) ) ( not ( = ?auto_183795 ?auto_183793 ) ) ( not ( = ?auto_183795 ?auto_183799 ) ) ( not ( = ?auto_183795 ?auto_183794 ) ) ( not ( = ?auto_183797 ?auto_183796 ) ) ( not ( = ?auto_183797 ?auto_183793 ) ) ( not ( = ?auto_183797 ?auto_183799 ) ) ( not ( = ?auto_183797 ?auto_183794 ) ) ( ON ?auto_183798 ?auto_183797 ) ( ON ?auto_183796 ?auto_183798 ) ( ON ?auto_183794 ?auto_183796 ) ( ON ?auto_183799 ?auto_183794 ) ( ON ?auto_183793 ?auto_183799 ) ( CLEAR ?auto_183793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183792 ?auto_183795 ?auto_183797 ?auto_183798 ?auto_183796 ?auto_183794 ?auto_183799 )
      ( MAKE-1PILE ?auto_183792 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_181631 - BLOCK
    )
    :vars
    (
      ?auto_181639 - BLOCK
      ?auto_181637 - BLOCK
      ?auto_181636 - BLOCK
      ?auto_181633 - BLOCK
      ?auto_181632 - BLOCK
      ?auto_181634 - BLOCK
      ?auto_181638 - BLOCK
      ?auto_181635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181639 ?auto_181631 ) ( ON-TABLE ?auto_181631 ) ( not ( = ?auto_181631 ?auto_181639 ) ) ( not ( = ?auto_181631 ?auto_181637 ) ) ( not ( = ?auto_181631 ?auto_181636 ) ) ( not ( = ?auto_181639 ?auto_181637 ) ) ( not ( = ?auto_181639 ?auto_181636 ) ) ( not ( = ?auto_181637 ?auto_181636 ) ) ( ON ?auto_181637 ?auto_181639 ) ( not ( = ?auto_181633 ?auto_181632 ) ) ( not ( = ?auto_181633 ?auto_181634 ) ) ( not ( = ?auto_181633 ?auto_181638 ) ) ( not ( = ?auto_181633 ?auto_181635 ) ) ( not ( = ?auto_181633 ?auto_181636 ) ) ( not ( = ?auto_181632 ?auto_181634 ) ) ( not ( = ?auto_181632 ?auto_181638 ) ) ( not ( = ?auto_181632 ?auto_181635 ) ) ( not ( = ?auto_181632 ?auto_181636 ) ) ( not ( = ?auto_181634 ?auto_181638 ) ) ( not ( = ?auto_181634 ?auto_181635 ) ) ( not ( = ?auto_181634 ?auto_181636 ) ) ( not ( = ?auto_181638 ?auto_181635 ) ) ( not ( = ?auto_181638 ?auto_181636 ) ) ( not ( = ?auto_181635 ?auto_181636 ) ) ( not ( = ?auto_181631 ?auto_181635 ) ) ( not ( = ?auto_181631 ?auto_181633 ) ) ( not ( = ?auto_181631 ?auto_181632 ) ) ( not ( = ?auto_181631 ?auto_181634 ) ) ( not ( = ?auto_181631 ?auto_181638 ) ) ( not ( = ?auto_181639 ?auto_181635 ) ) ( not ( = ?auto_181639 ?auto_181633 ) ) ( not ( = ?auto_181639 ?auto_181632 ) ) ( not ( = ?auto_181639 ?auto_181634 ) ) ( not ( = ?auto_181639 ?auto_181638 ) ) ( not ( = ?auto_181637 ?auto_181635 ) ) ( not ( = ?auto_181637 ?auto_181633 ) ) ( not ( = ?auto_181637 ?auto_181632 ) ) ( not ( = ?auto_181637 ?auto_181634 ) ) ( not ( = ?auto_181637 ?auto_181638 ) ) ( ON ?auto_181636 ?auto_181637 ) ( ON ?auto_181635 ?auto_181636 ) ( ON ?auto_181638 ?auto_181635 ) ( ON ?auto_181634 ?auto_181638 ) ( ON ?auto_181632 ?auto_181634 ) ( CLEAR ?auto_181632 ) ( HOLDING ?auto_181633 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_181633 )
      ( MAKE-1PILE ?auto_181631 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_181640 - BLOCK
    )
    :vars
    (
      ?auto_181641 - BLOCK
      ?auto_181648 - BLOCK
      ?auto_181647 - BLOCK
      ?auto_181643 - BLOCK
      ?auto_181642 - BLOCK
      ?auto_181644 - BLOCK
      ?auto_181646 - BLOCK
      ?auto_181645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181641 ?auto_181640 ) ( ON-TABLE ?auto_181640 ) ( not ( = ?auto_181640 ?auto_181641 ) ) ( not ( = ?auto_181640 ?auto_181648 ) ) ( not ( = ?auto_181640 ?auto_181647 ) ) ( not ( = ?auto_181641 ?auto_181648 ) ) ( not ( = ?auto_181641 ?auto_181647 ) ) ( not ( = ?auto_181648 ?auto_181647 ) ) ( ON ?auto_181648 ?auto_181641 ) ( not ( = ?auto_181643 ?auto_181642 ) ) ( not ( = ?auto_181643 ?auto_181644 ) ) ( not ( = ?auto_181643 ?auto_181646 ) ) ( not ( = ?auto_181643 ?auto_181645 ) ) ( not ( = ?auto_181643 ?auto_181647 ) ) ( not ( = ?auto_181642 ?auto_181644 ) ) ( not ( = ?auto_181642 ?auto_181646 ) ) ( not ( = ?auto_181642 ?auto_181645 ) ) ( not ( = ?auto_181642 ?auto_181647 ) ) ( not ( = ?auto_181644 ?auto_181646 ) ) ( not ( = ?auto_181644 ?auto_181645 ) ) ( not ( = ?auto_181644 ?auto_181647 ) ) ( not ( = ?auto_181646 ?auto_181645 ) ) ( not ( = ?auto_181646 ?auto_181647 ) ) ( not ( = ?auto_181645 ?auto_181647 ) ) ( not ( = ?auto_181640 ?auto_181645 ) ) ( not ( = ?auto_181640 ?auto_181643 ) ) ( not ( = ?auto_181640 ?auto_181642 ) ) ( not ( = ?auto_181640 ?auto_181644 ) ) ( not ( = ?auto_181640 ?auto_181646 ) ) ( not ( = ?auto_181641 ?auto_181645 ) ) ( not ( = ?auto_181641 ?auto_181643 ) ) ( not ( = ?auto_181641 ?auto_181642 ) ) ( not ( = ?auto_181641 ?auto_181644 ) ) ( not ( = ?auto_181641 ?auto_181646 ) ) ( not ( = ?auto_181648 ?auto_181645 ) ) ( not ( = ?auto_181648 ?auto_181643 ) ) ( not ( = ?auto_181648 ?auto_181642 ) ) ( not ( = ?auto_181648 ?auto_181644 ) ) ( not ( = ?auto_181648 ?auto_181646 ) ) ( ON ?auto_181647 ?auto_181648 ) ( ON ?auto_181645 ?auto_181647 ) ( ON ?auto_181646 ?auto_181645 ) ( ON ?auto_181644 ?auto_181646 ) ( ON ?auto_181642 ?auto_181644 ) ( ON ?auto_181643 ?auto_181642 ) ( CLEAR ?auto_181643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_181640 ?auto_181641 ?auto_181648 ?auto_181647 ?auto_181645 ?auto_181646 ?auto_181644 ?auto_181642 )
      ( MAKE-1PILE ?auto_181640 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181657 - BLOCK
      ?auto_181658 - BLOCK
      ?auto_181659 - BLOCK
      ?auto_181660 - BLOCK
      ?auto_181661 - BLOCK
      ?auto_181662 - BLOCK
      ?auto_181663 - BLOCK
      ?auto_181664 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_181664 ) ( CLEAR ?auto_181663 ) ( ON-TABLE ?auto_181657 ) ( ON ?auto_181658 ?auto_181657 ) ( ON ?auto_181659 ?auto_181658 ) ( ON ?auto_181660 ?auto_181659 ) ( ON ?auto_181661 ?auto_181660 ) ( ON ?auto_181662 ?auto_181661 ) ( ON ?auto_181663 ?auto_181662 ) ( not ( = ?auto_181657 ?auto_181658 ) ) ( not ( = ?auto_181657 ?auto_181659 ) ) ( not ( = ?auto_181657 ?auto_181660 ) ) ( not ( = ?auto_181657 ?auto_181661 ) ) ( not ( = ?auto_181657 ?auto_181662 ) ) ( not ( = ?auto_181657 ?auto_181663 ) ) ( not ( = ?auto_181657 ?auto_181664 ) ) ( not ( = ?auto_181658 ?auto_181659 ) ) ( not ( = ?auto_181658 ?auto_181660 ) ) ( not ( = ?auto_181658 ?auto_181661 ) ) ( not ( = ?auto_181658 ?auto_181662 ) ) ( not ( = ?auto_181658 ?auto_181663 ) ) ( not ( = ?auto_181658 ?auto_181664 ) ) ( not ( = ?auto_181659 ?auto_181660 ) ) ( not ( = ?auto_181659 ?auto_181661 ) ) ( not ( = ?auto_181659 ?auto_181662 ) ) ( not ( = ?auto_181659 ?auto_181663 ) ) ( not ( = ?auto_181659 ?auto_181664 ) ) ( not ( = ?auto_181660 ?auto_181661 ) ) ( not ( = ?auto_181660 ?auto_181662 ) ) ( not ( = ?auto_181660 ?auto_181663 ) ) ( not ( = ?auto_181660 ?auto_181664 ) ) ( not ( = ?auto_181661 ?auto_181662 ) ) ( not ( = ?auto_181661 ?auto_181663 ) ) ( not ( = ?auto_181661 ?auto_181664 ) ) ( not ( = ?auto_181662 ?auto_181663 ) ) ( not ( = ?auto_181662 ?auto_181664 ) ) ( not ( = ?auto_181663 ?auto_181664 ) ) )
    :subtasks
    ( ( !STACK ?auto_181664 ?auto_181663 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181665 - BLOCK
      ?auto_181666 - BLOCK
      ?auto_181667 - BLOCK
      ?auto_181668 - BLOCK
      ?auto_181669 - BLOCK
      ?auto_181670 - BLOCK
      ?auto_181671 - BLOCK
      ?auto_181672 - BLOCK
    )
    :vars
    (
      ?auto_181673 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_181671 ) ( ON-TABLE ?auto_181665 ) ( ON ?auto_181666 ?auto_181665 ) ( ON ?auto_181667 ?auto_181666 ) ( ON ?auto_181668 ?auto_181667 ) ( ON ?auto_181669 ?auto_181668 ) ( ON ?auto_181670 ?auto_181669 ) ( ON ?auto_181671 ?auto_181670 ) ( not ( = ?auto_181665 ?auto_181666 ) ) ( not ( = ?auto_181665 ?auto_181667 ) ) ( not ( = ?auto_181665 ?auto_181668 ) ) ( not ( = ?auto_181665 ?auto_181669 ) ) ( not ( = ?auto_181665 ?auto_181670 ) ) ( not ( = ?auto_181665 ?auto_181671 ) ) ( not ( = ?auto_181665 ?auto_181672 ) ) ( not ( = ?auto_181666 ?auto_181667 ) ) ( not ( = ?auto_181666 ?auto_181668 ) ) ( not ( = ?auto_181666 ?auto_181669 ) ) ( not ( = ?auto_181666 ?auto_181670 ) ) ( not ( = ?auto_181666 ?auto_181671 ) ) ( not ( = ?auto_181666 ?auto_181672 ) ) ( not ( = ?auto_181667 ?auto_181668 ) ) ( not ( = ?auto_181667 ?auto_181669 ) ) ( not ( = ?auto_181667 ?auto_181670 ) ) ( not ( = ?auto_181667 ?auto_181671 ) ) ( not ( = ?auto_181667 ?auto_181672 ) ) ( not ( = ?auto_181668 ?auto_181669 ) ) ( not ( = ?auto_181668 ?auto_181670 ) ) ( not ( = ?auto_181668 ?auto_181671 ) ) ( not ( = ?auto_181668 ?auto_181672 ) ) ( not ( = ?auto_181669 ?auto_181670 ) ) ( not ( = ?auto_181669 ?auto_181671 ) ) ( not ( = ?auto_181669 ?auto_181672 ) ) ( not ( = ?auto_181670 ?auto_181671 ) ) ( not ( = ?auto_181670 ?auto_181672 ) ) ( not ( = ?auto_181671 ?auto_181672 ) ) ( ON ?auto_181672 ?auto_181673 ) ( CLEAR ?auto_181672 ) ( HAND-EMPTY ) ( not ( = ?auto_181665 ?auto_181673 ) ) ( not ( = ?auto_181666 ?auto_181673 ) ) ( not ( = ?auto_181667 ?auto_181673 ) ) ( not ( = ?auto_181668 ?auto_181673 ) ) ( not ( = ?auto_181669 ?auto_181673 ) ) ( not ( = ?auto_181670 ?auto_181673 ) ) ( not ( = ?auto_181671 ?auto_181673 ) ) ( not ( = ?auto_181672 ?auto_181673 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_181672 ?auto_181673 )
      ( MAKE-8PILE ?auto_181665 ?auto_181666 ?auto_181667 ?auto_181668 ?auto_181669 ?auto_181670 ?auto_181671 ?auto_181672 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181674 - BLOCK
      ?auto_181675 - BLOCK
      ?auto_181676 - BLOCK
      ?auto_181677 - BLOCK
      ?auto_181678 - BLOCK
      ?auto_181679 - BLOCK
      ?auto_181680 - BLOCK
      ?auto_181681 - BLOCK
    )
    :vars
    (
      ?auto_181682 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181674 ) ( ON ?auto_181675 ?auto_181674 ) ( ON ?auto_181676 ?auto_181675 ) ( ON ?auto_181677 ?auto_181676 ) ( ON ?auto_181678 ?auto_181677 ) ( ON ?auto_181679 ?auto_181678 ) ( not ( = ?auto_181674 ?auto_181675 ) ) ( not ( = ?auto_181674 ?auto_181676 ) ) ( not ( = ?auto_181674 ?auto_181677 ) ) ( not ( = ?auto_181674 ?auto_181678 ) ) ( not ( = ?auto_181674 ?auto_181679 ) ) ( not ( = ?auto_181674 ?auto_181680 ) ) ( not ( = ?auto_181674 ?auto_181681 ) ) ( not ( = ?auto_181675 ?auto_181676 ) ) ( not ( = ?auto_181675 ?auto_181677 ) ) ( not ( = ?auto_181675 ?auto_181678 ) ) ( not ( = ?auto_181675 ?auto_181679 ) ) ( not ( = ?auto_181675 ?auto_181680 ) ) ( not ( = ?auto_181675 ?auto_181681 ) ) ( not ( = ?auto_181676 ?auto_181677 ) ) ( not ( = ?auto_181676 ?auto_181678 ) ) ( not ( = ?auto_181676 ?auto_181679 ) ) ( not ( = ?auto_181676 ?auto_181680 ) ) ( not ( = ?auto_181676 ?auto_181681 ) ) ( not ( = ?auto_181677 ?auto_181678 ) ) ( not ( = ?auto_181677 ?auto_181679 ) ) ( not ( = ?auto_181677 ?auto_181680 ) ) ( not ( = ?auto_181677 ?auto_181681 ) ) ( not ( = ?auto_181678 ?auto_181679 ) ) ( not ( = ?auto_181678 ?auto_181680 ) ) ( not ( = ?auto_181678 ?auto_181681 ) ) ( not ( = ?auto_181679 ?auto_181680 ) ) ( not ( = ?auto_181679 ?auto_181681 ) ) ( not ( = ?auto_181680 ?auto_181681 ) ) ( ON ?auto_181681 ?auto_181682 ) ( CLEAR ?auto_181681 ) ( not ( = ?auto_181674 ?auto_181682 ) ) ( not ( = ?auto_181675 ?auto_181682 ) ) ( not ( = ?auto_181676 ?auto_181682 ) ) ( not ( = ?auto_181677 ?auto_181682 ) ) ( not ( = ?auto_181678 ?auto_181682 ) ) ( not ( = ?auto_181679 ?auto_181682 ) ) ( not ( = ?auto_181680 ?auto_181682 ) ) ( not ( = ?auto_181681 ?auto_181682 ) ) ( HOLDING ?auto_181680 ) ( CLEAR ?auto_181679 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181674 ?auto_181675 ?auto_181676 ?auto_181677 ?auto_181678 ?auto_181679 ?auto_181680 )
      ( MAKE-8PILE ?auto_181674 ?auto_181675 ?auto_181676 ?auto_181677 ?auto_181678 ?auto_181679 ?auto_181680 ?auto_181681 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181683 - BLOCK
      ?auto_181684 - BLOCK
      ?auto_181685 - BLOCK
      ?auto_181686 - BLOCK
      ?auto_181687 - BLOCK
      ?auto_181688 - BLOCK
      ?auto_181689 - BLOCK
      ?auto_181690 - BLOCK
    )
    :vars
    (
      ?auto_181691 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181683 ) ( ON ?auto_181684 ?auto_181683 ) ( ON ?auto_181685 ?auto_181684 ) ( ON ?auto_181686 ?auto_181685 ) ( ON ?auto_181687 ?auto_181686 ) ( ON ?auto_181688 ?auto_181687 ) ( not ( = ?auto_181683 ?auto_181684 ) ) ( not ( = ?auto_181683 ?auto_181685 ) ) ( not ( = ?auto_181683 ?auto_181686 ) ) ( not ( = ?auto_181683 ?auto_181687 ) ) ( not ( = ?auto_181683 ?auto_181688 ) ) ( not ( = ?auto_181683 ?auto_181689 ) ) ( not ( = ?auto_181683 ?auto_181690 ) ) ( not ( = ?auto_181684 ?auto_181685 ) ) ( not ( = ?auto_181684 ?auto_181686 ) ) ( not ( = ?auto_181684 ?auto_181687 ) ) ( not ( = ?auto_181684 ?auto_181688 ) ) ( not ( = ?auto_181684 ?auto_181689 ) ) ( not ( = ?auto_181684 ?auto_181690 ) ) ( not ( = ?auto_181685 ?auto_181686 ) ) ( not ( = ?auto_181685 ?auto_181687 ) ) ( not ( = ?auto_181685 ?auto_181688 ) ) ( not ( = ?auto_181685 ?auto_181689 ) ) ( not ( = ?auto_181685 ?auto_181690 ) ) ( not ( = ?auto_181686 ?auto_181687 ) ) ( not ( = ?auto_181686 ?auto_181688 ) ) ( not ( = ?auto_181686 ?auto_181689 ) ) ( not ( = ?auto_181686 ?auto_181690 ) ) ( not ( = ?auto_181687 ?auto_181688 ) ) ( not ( = ?auto_181687 ?auto_181689 ) ) ( not ( = ?auto_181687 ?auto_181690 ) ) ( not ( = ?auto_181688 ?auto_181689 ) ) ( not ( = ?auto_181688 ?auto_181690 ) ) ( not ( = ?auto_181689 ?auto_181690 ) ) ( ON ?auto_181690 ?auto_181691 ) ( not ( = ?auto_181683 ?auto_181691 ) ) ( not ( = ?auto_181684 ?auto_181691 ) ) ( not ( = ?auto_181685 ?auto_181691 ) ) ( not ( = ?auto_181686 ?auto_181691 ) ) ( not ( = ?auto_181687 ?auto_181691 ) ) ( not ( = ?auto_181688 ?auto_181691 ) ) ( not ( = ?auto_181689 ?auto_181691 ) ) ( not ( = ?auto_181690 ?auto_181691 ) ) ( CLEAR ?auto_181688 ) ( ON ?auto_181689 ?auto_181690 ) ( CLEAR ?auto_181689 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_181691 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181691 ?auto_181690 )
      ( MAKE-8PILE ?auto_181683 ?auto_181684 ?auto_181685 ?auto_181686 ?auto_181687 ?auto_181688 ?auto_181689 ?auto_181690 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181692 - BLOCK
      ?auto_181693 - BLOCK
      ?auto_181694 - BLOCK
      ?auto_181695 - BLOCK
      ?auto_181696 - BLOCK
      ?auto_181697 - BLOCK
      ?auto_181698 - BLOCK
      ?auto_181699 - BLOCK
    )
    :vars
    (
      ?auto_181700 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181692 ) ( ON ?auto_181693 ?auto_181692 ) ( ON ?auto_181694 ?auto_181693 ) ( ON ?auto_181695 ?auto_181694 ) ( ON ?auto_181696 ?auto_181695 ) ( not ( = ?auto_181692 ?auto_181693 ) ) ( not ( = ?auto_181692 ?auto_181694 ) ) ( not ( = ?auto_181692 ?auto_181695 ) ) ( not ( = ?auto_181692 ?auto_181696 ) ) ( not ( = ?auto_181692 ?auto_181697 ) ) ( not ( = ?auto_181692 ?auto_181698 ) ) ( not ( = ?auto_181692 ?auto_181699 ) ) ( not ( = ?auto_181693 ?auto_181694 ) ) ( not ( = ?auto_181693 ?auto_181695 ) ) ( not ( = ?auto_181693 ?auto_181696 ) ) ( not ( = ?auto_181693 ?auto_181697 ) ) ( not ( = ?auto_181693 ?auto_181698 ) ) ( not ( = ?auto_181693 ?auto_181699 ) ) ( not ( = ?auto_181694 ?auto_181695 ) ) ( not ( = ?auto_181694 ?auto_181696 ) ) ( not ( = ?auto_181694 ?auto_181697 ) ) ( not ( = ?auto_181694 ?auto_181698 ) ) ( not ( = ?auto_181694 ?auto_181699 ) ) ( not ( = ?auto_181695 ?auto_181696 ) ) ( not ( = ?auto_181695 ?auto_181697 ) ) ( not ( = ?auto_181695 ?auto_181698 ) ) ( not ( = ?auto_181695 ?auto_181699 ) ) ( not ( = ?auto_181696 ?auto_181697 ) ) ( not ( = ?auto_181696 ?auto_181698 ) ) ( not ( = ?auto_181696 ?auto_181699 ) ) ( not ( = ?auto_181697 ?auto_181698 ) ) ( not ( = ?auto_181697 ?auto_181699 ) ) ( not ( = ?auto_181698 ?auto_181699 ) ) ( ON ?auto_181699 ?auto_181700 ) ( not ( = ?auto_181692 ?auto_181700 ) ) ( not ( = ?auto_181693 ?auto_181700 ) ) ( not ( = ?auto_181694 ?auto_181700 ) ) ( not ( = ?auto_181695 ?auto_181700 ) ) ( not ( = ?auto_181696 ?auto_181700 ) ) ( not ( = ?auto_181697 ?auto_181700 ) ) ( not ( = ?auto_181698 ?auto_181700 ) ) ( not ( = ?auto_181699 ?auto_181700 ) ) ( ON ?auto_181698 ?auto_181699 ) ( CLEAR ?auto_181698 ) ( ON-TABLE ?auto_181700 ) ( HOLDING ?auto_181697 ) ( CLEAR ?auto_181696 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181692 ?auto_181693 ?auto_181694 ?auto_181695 ?auto_181696 ?auto_181697 )
      ( MAKE-8PILE ?auto_181692 ?auto_181693 ?auto_181694 ?auto_181695 ?auto_181696 ?auto_181697 ?auto_181698 ?auto_181699 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181701 - BLOCK
      ?auto_181702 - BLOCK
      ?auto_181703 - BLOCK
      ?auto_181704 - BLOCK
      ?auto_181705 - BLOCK
      ?auto_181706 - BLOCK
      ?auto_181707 - BLOCK
      ?auto_181708 - BLOCK
    )
    :vars
    (
      ?auto_181709 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181701 ) ( ON ?auto_181702 ?auto_181701 ) ( ON ?auto_181703 ?auto_181702 ) ( ON ?auto_181704 ?auto_181703 ) ( ON ?auto_181705 ?auto_181704 ) ( not ( = ?auto_181701 ?auto_181702 ) ) ( not ( = ?auto_181701 ?auto_181703 ) ) ( not ( = ?auto_181701 ?auto_181704 ) ) ( not ( = ?auto_181701 ?auto_181705 ) ) ( not ( = ?auto_181701 ?auto_181706 ) ) ( not ( = ?auto_181701 ?auto_181707 ) ) ( not ( = ?auto_181701 ?auto_181708 ) ) ( not ( = ?auto_181702 ?auto_181703 ) ) ( not ( = ?auto_181702 ?auto_181704 ) ) ( not ( = ?auto_181702 ?auto_181705 ) ) ( not ( = ?auto_181702 ?auto_181706 ) ) ( not ( = ?auto_181702 ?auto_181707 ) ) ( not ( = ?auto_181702 ?auto_181708 ) ) ( not ( = ?auto_181703 ?auto_181704 ) ) ( not ( = ?auto_181703 ?auto_181705 ) ) ( not ( = ?auto_181703 ?auto_181706 ) ) ( not ( = ?auto_181703 ?auto_181707 ) ) ( not ( = ?auto_181703 ?auto_181708 ) ) ( not ( = ?auto_181704 ?auto_181705 ) ) ( not ( = ?auto_181704 ?auto_181706 ) ) ( not ( = ?auto_181704 ?auto_181707 ) ) ( not ( = ?auto_181704 ?auto_181708 ) ) ( not ( = ?auto_181705 ?auto_181706 ) ) ( not ( = ?auto_181705 ?auto_181707 ) ) ( not ( = ?auto_181705 ?auto_181708 ) ) ( not ( = ?auto_181706 ?auto_181707 ) ) ( not ( = ?auto_181706 ?auto_181708 ) ) ( not ( = ?auto_181707 ?auto_181708 ) ) ( ON ?auto_181708 ?auto_181709 ) ( not ( = ?auto_181701 ?auto_181709 ) ) ( not ( = ?auto_181702 ?auto_181709 ) ) ( not ( = ?auto_181703 ?auto_181709 ) ) ( not ( = ?auto_181704 ?auto_181709 ) ) ( not ( = ?auto_181705 ?auto_181709 ) ) ( not ( = ?auto_181706 ?auto_181709 ) ) ( not ( = ?auto_181707 ?auto_181709 ) ) ( not ( = ?auto_181708 ?auto_181709 ) ) ( ON ?auto_181707 ?auto_181708 ) ( ON-TABLE ?auto_181709 ) ( CLEAR ?auto_181705 ) ( ON ?auto_181706 ?auto_181707 ) ( CLEAR ?auto_181706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181709 ?auto_181708 ?auto_181707 )
      ( MAKE-8PILE ?auto_181701 ?auto_181702 ?auto_181703 ?auto_181704 ?auto_181705 ?auto_181706 ?auto_181707 ?auto_181708 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181710 - BLOCK
      ?auto_181711 - BLOCK
      ?auto_181712 - BLOCK
      ?auto_181713 - BLOCK
      ?auto_181714 - BLOCK
      ?auto_181715 - BLOCK
      ?auto_181716 - BLOCK
      ?auto_181717 - BLOCK
    )
    :vars
    (
      ?auto_181718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181710 ) ( ON ?auto_181711 ?auto_181710 ) ( ON ?auto_181712 ?auto_181711 ) ( ON ?auto_181713 ?auto_181712 ) ( not ( = ?auto_181710 ?auto_181711 ) ) ( not ( = ?auto_181710 ?auto_181712 ) ) ( not ( = ?auto_181710 ?auto_181713 ) ) ( not ( = ?auto_181710 ?auto_181714 ) ) ( not ( = ?auto_181710 ?auto_181715 ) ) ( not ( = ?auto_181710 ?auto_181716 ) ) ( not ( = ?auto_181710 ?auto_181717 ) ) ( not ( = ?auto_181711 ?auto_181712 ) ) ( not ( = ?auto_181711 ?auto_181713 ) ) ( not ( = ?auto_181711 ?auto_181714 ) ) ( not ( = ?auto_181711 ?auto_181715 ) ) ( not ( = ?auto_181711 ?auto_181716 ) ) ( not ( = ?auto_181711 ?auto_181717 ) ) ( not ( = ?auto_181712 ?auto_181713 ) ) ( not ( = ?auto_181712 ?auto_181714 ) ) ( not ( = ?auto_181712 ?auto_181715 ) ) ( not ( = ?auto_181712 ?auto_181716 ) ) ( not ( = ?auto_181712 ?auto_181717 ) ) ( not ( = ?auto_181713 ?auto_181714 ) ) ( not ( = ?auto_181713 ?auto_181715 ) ) ( not ( = ?auto_181713 ?auto_181716 ) ) ( not ( = ?auto_181713 ?auto_181717 ) ) ( not ( = ?auto_181714 ?auto_181715 ) ) ( not ( = ?auto_181714 ?auto_181716 ) ) ( not ( = ?auto_181714 ?auto_181717 ) ) ( not ( = ?auto_181715 ?auto_181716 ) ) ( not ( = ?auto_181715 ?auto_181717 ) ) ( not ( = ?auto_181716 ?auto_181717 ) ) ( ON ?auto_181717 ?auto_181718 ) ( not ( = ?auto_181710 ?auto_181718 ) ) ( not ( = ?auto_181711 ?auto_181718 ) ) ( not ( = ?auto_181712 ?auto_181718 ) ) ( not ( = ?auto_181713 ?auto_181718 ) ) ( not ( = ?auto_181714 ?auto_181718 ) ) ( not ( = ?auto_181715 ?auto_181718 ) ) ( not ( = ?auto_181716 ?auto_181718 ) ) ( not ( = ?auto_181717 ?auto_181718 ) ) ( ON ?auto_181716 ?auto_181717 ) ( ON-TABLE ?auto_181718 ) ( ON ?auto_181715 ?auto_181716 ) ( CLEAR ?auto_181715 ) ( HOLDING ?auto_181714 ) ( CLEAR ?auto_181713 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181710 ?auto_181711 ?auto_181712 ?auto_181713 ?auto_181714 )
      ( MAKE-8PILE ?auto_181710 ?auto_181711 ?auto_181712 ?auto_181713 ?auto_181714 ?auto_181715 ?auto_181716 ?auto_181717 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181719 - BLOCK
      ?auto_181720 - BLOCK
      ?auto_181721 - BLOCK
      ?auto_181722 - BLOCK
      ?auto_181723 - BLOCK
      ?auto_181724 - BLOCK
      ?auto_181725 - BLOCK
      ?auto_181726 - BLOCK
    )
    :vars
    (
      ?auto_181727 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181719 ) ( ON ?auto_181720 ?auto_181719 ) ( ON ?auto_181721 ?auto_181720 ) ( ON ?auto_181722 ?auto_181721 ) ( not ( = ?auto_181719 ?auto_181720 ) ) ( not ( = ?auto_181719 ?auto_181721 ) ) ( not ( = ?auto_181719 ?auto_181722 ) ) ( not ( = ?auto_181719 ?auto_181723 ) ) ( not ( = ?auto_181719 ?auto_181724 ) ) ( not ( = ?auto_181719 ?auto_181725 ) ) ( not ( = ?auto_181719 ?auto_181726 ) ) ( not ( = ?auto_181720 ?auto_181721 ) ) ( not ( = ?auto_181720 ?auto_181722 ) ) ( not ( = ?auto_181720 ?auto_181723 ) ) ( not ( = ?auto_181720 ?auto_181724 ) ) ( not ( = ?auto_181720 ?auto_181725 ) ) ( not ( = ?auto_181720 ?auto_181726 ) ) ( not ( = ?auto_181721 ?auto_181722 ) ) ( not ( = ?auto_181721 ?auto_181723 ) ) ( not ( = ?auto_181721 ?auto_181724 ) ) ( not ( = ?auto_181721 ?auto_181725 ) ) ( not ( = ?auto_181721 ?auto_181726 ) ) ( not ( = ?auto_181722 ?auto_181723 ) ) ( not ( = ?auto_181722 ?auto_181724 ) ) ( not ( = ?auto_181722 ?auto_181725 ) ) ( not ( = ?auto_181722 ?auto_181726 ) ) ( not ( = ?auto_181723 ?auto_181724 ) ) ( not ( = ?auto_181723 ?auto_181725 ) ) ( not ( = ?auto_181723 ?auto_181726 ) ) ( not ( = ?auto_181724 ?auto_181725 ) ) ( not ( = ?auto_181724 ?auto_181726 ) ) ( not ( = ?auto_181725 ?auto_181726 ) ) ( ON ?auto_181726 ?auto_181727 ) ( not ( = ?auto_181719 ?auto_181727 ) ) ( not ( = ?auto_181720 ?auto_181727 ) ) ( not ( = ?auto_181721 ?auto_181727 ) ) ( not ( = ?auto_181722 ?auto_181727 ) ) ( not ( = ?auto_181723 ?auto_181727 ) ) ( not ( = ?auto_181724 ?auto_181727 ) ) ( not ( = ?auto_181725 ?auto_181727 ) ) ( not ( = ?auto_181726 ?auto_181727 ) ) ( ON ?auto_181725 ?auto_181726 ) ( ON-TABLE ?auto_181727 ) ( ON ?auto_181724 ?auto_181725 ) ( CLEAR ?auto_181722 ) ( ON ?auto_181723 ?auto_181724 ) ( CLEAR ?auto_181723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181727 ?auto_181726 ?auto_181725 ?auto_181724 )
      ( MAKE-8PILE ?auto_181719 ?auto_181720 ?auto_181721 ?auto_181722 ?auto_181723 ?auto_181724 ?auto_181725 ?auto_181726 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181728 - BLOCK
      ?auto_181729 - BLOCK
      ?auto_181730 - BLOCK
      ?auto_181731 - BLOCK
      ?auto_181732 - BLOCK
      ?auto_181733 - BLOCK
      ?auto_181734 - BLOCK
      ?auto_181735 - BLOCK
    )
    :vars
    (
      ?auto_181736 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181728 ) ( ON ?auto_181729 ?auto_181728 ) ( ON ?auto_181730 ?auto_181729 ) ( not ( = ?auto_181728 ?auto_181729 ) ) ( not ( = ?auto_181728 ?auto_181730 ) ) ( not ( = ?auto_181728 ?auto_181731 ) ) ( not ( = ?auto_181728 ?auto_181732 ) ) ( not ( = ?auto_181728 ?auto_181733 ) ) ( not ( = ?auto_181728 ?auto_181734 ) ) ( not ( = ?auto_181728 ?auto_181735 ) ) ( not ( = ?auto_181729 ?auto_181730 ) ) ( not ( = ?auto_181729 ?auto_181731 ) ) ( not ( = ?auto_181729 ?auto_181732 ) ) ( not ( = ?auto_181729 ?auto_181733 ) ) ( not ( = ?auto_181729 ?auto_181734 ) ) ( not ( = ?auto_181729 ?auto_181735 ) ) ( not ( = ?auto_181730 ?auto_181731 ) ) ( not ( = ?auto_181730 ?auto_181732 ) ) ( not ( = ?auto_181730 ?auto_181733 ) ) ( not ( = ?auto_181730 ?auto_181734 ) ) ( not ( = ?auto_181730 ?auto_181735 ) ) ( not ( = ?auto_181731 ?auto_181732 ) ) ( not ( = ?auto_181731 ?auto_181733 ) ) ( not ( = ?auto_181731 ?auto_181734 ) ) ( not ( = ?auto_181731 ?auto_181735 ) ) ( not ( = ?auto_181732 ?auto_181733 ) ) ( not ( = ?auto_181732 ?auto_181734 ) ) ( not ( = ?auto_181732 ?auto_181735 ) ) ( not ( = ?auto_181733 ?auto_181734 ) ) ( not ( = ?auto_181733 ?auto_181735 ) ) ( not ( = ?auto_181734 ?auto_181735 ) ) ( ON ?auto_181735 ?auto_181736 ) ( not ( = ?auto_181728 ?auto_181736 ) ) ( not ( = ?auto_181729 ?auto_181736 ) ) ( not ( = ?auto_181730 ?auto_181736 ) ) ( not ( = ?auto_181731 ?auto_181736 ) ) ( not ( = ?auto_181732 ?auto_181736 ) ) ( not ( = ?auto_181733 ?auto_181736 ) ) ( not ( = ?auto_181734 ?auto_181736 ) ) ( not ( = ?auto_181735 ?auto_181736 ) ) ( ON ?auto_181734 ?auto_181735 ) ( ON-TABLE ?auto_181736 ) ( ON ?auto_181733 ?auto_181734 ) ( ON ?auto_181732 ?auto_181733 ) ( CLEAR ?auto_181732 ) ( HOLDING ?auto_181731 ) ( CLEAR ?auto_181730 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181728 ?auto_181729 ?auto_181730 ?auto_181731 )
      ( MAKE-8PILE ?auto_181728 ?auto_181729 ?auto_181730 ?auto_181731 ?auto_181732 ?auto_181733 ?auto_181734 ?auto_181735 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181737 - BLOCK
      ?auto_181738 - BLOCK
      ?auto_181739 - BLOCK
      ?auto_181740 - BLOCK
      ?auto_181741 - BLOCK
      ?auto_181742 - BLOCK
      ?auto_181743 - BLOCK
      ?auto_181744 - BLOCK
    )
    :vars
    (
      ?auto_181745 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181737 ) ( ON ?auto_181738 ?auto_181737 ) ( ON ?auto_181739 ?auto_181738 ) ( not ( = ?auto_181737 ?auto_181738 ) ) ( not ( = ?auto_181737 ?auto_181739 ) ) ( not ( = ?auto_181737 ?auto_181740 ) ) ( not ( = ?auto_181737 ?auto_181741 ) ) ( not ( = ?auto_181737 ?auto_181742 ) ) ( not ( = ?auto_181737 ?auto_181743 ) ) ( not ( = ?auto_181737 ?auto_181744 ) ) ( not ( = ?auto_181738 ?auto_181739 ) ) ( not ( = ?auto_181738 ?auto_181740 ) ) ( not ( = ?auto_181738 ?auto_181741 ) ) ( not ( = ?auto_181738 ?auto_181742 ) ) ( not ( = ?auto_181738 ?auto_181743 ) ) ( not ( = ?auto_181738 ?auto_181744 ) ) ( not ( = ?auto_181739 ?auto_181740 ) ) ( not ( = ?auto_181739 ?auto_181741 ) ) ( not ( = ?auto_181739 ?auto_181742 ) ) ( not ( = ?auto_181739 ?auto_181743 ) ) ( not ( = ?auto_181739 ?auto_181744 ) ) ( not ( = ?auto_181740 ?auto_181741 ) ) ( not ( = ?auto_181740 ?auto_181742 ) ) ( not ( = ?auto_181740 ?auto_181743 ) ) ( not ( = ?auto_181740 ?auto_181744 ) ) ( not ( = ?auto_181741 ?auto_181742 ) ) ( not ( = ?auto_181741 ?auto_181743 ) ) ( not ( = ?auto_181741 ?auto_181744 ) ) ( not ( = ?auto_181742 ?auto_181743 ) ) ( not ( = ?auto_181742 ?auto_181744 ) ) ( not ( = ?auto_181743 ?auto_181744 ) ) ( ON ?auto_181744 ?auto_181745 ) ( not ( = ?auto_181737 ?auto_181745 ) ) ( not ( = ?auto_181738 ?auto_181745 ) ) ( not ( = ?auto_181739 ?auto_181745 ) ) ( not ( = ?auto_181740 ?auto_181745 ) ) ( not ( = ?auto_181741 ?auto_181745 ) ) ( not ( = ?auto_181742 ?auto_181745 ) ) ( not ( = ?auto_181743 ?auto_181745 ) ) ( not ( = ?auto_181744 ?auto_181745 ) ) ( ON ?auto_181743 ?auto_181744 ) ( ON-TABLE ?auto_181745 ) ( ON ?auto_181742 ?auto_181743 ) ( ON ?auto_181741 ?auto_181742 ) ( CLEAR ?auto_181739 ) ( ON ?auto_181740 ?auto_181741 ) ( CLEAR ?auto_181740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181745 ?auto_181744 ?auto_181743 ?auto_181742 ?auto_181741 )
      ( MAKE-8PILE ?auto_181737 ?auto_181738 ?auto_181739 ?auto_181740 ?auto_181741 ?auto_181742 ?auto_181743 ?auto_181744 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181746 - BLOCK
      ?auto_181747 - BLOCK
      ?auto_181748 - BLOCK
      ?auto_181749 - BLOCK
      ?auto_181750 - BLOCK
      ?auto_181751 - BLOCK
      ?auto_181752 - BLOCK
      ?auto_181753 - BLOCK
    )
    :vars
    (
      ?auto_181754 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181746 ) ( ON ?auto_181747 ?auto_181746 ) ( not ( = ?auto_181746 ?auto_181747 ) ) ( not ( = ?auto_181746 ?auto_181748 ) ) ( not ( = ?auto_181746 ?auto_181749 ) ) ( not ( = ?auto_181746 ?auto_181750 ) ) ( not ( = ?auto_181746 ?auto_181751 ) ) ( not ( = ?auto_181746 ?auto_181752 ) ) ( not ( = ?auto_181746 ?auto_181753 ) ) ( not ( = ?auto_181747 ?auto_181748 ) ) ( not ( = ?auto_181747 ?auto_181749 ) ) ( not ( = ?auto_181747 ?auto_181750 ) ) ( not ( = ?auto_181747 ?auto_181751 ) ) ( not ( = ?auto_181747 ?auto_181752 ) ) ( not ( = ?auto_181747 ?auto_181753 ) ) ( not ( = ?auto_181748 ?auto_181749 ) ) ( not ( = ?auto_181748 ?auto_181750 ) ) ( not ( = ?auto_181748 ?auto_181751 ) ) ( not ( = ?auto_181748 ?auto_181752 ) ) ( not ( = ?auto_181748 ?auto_181753 ) ) ( not ( = ?auto_181749 ?auto_181750 ) ) ( not ( = ?auto_181749 ?auto_181751 ) ) ( not ( = ?auto_181749 ?auto_181752 ) ) ( not ( = ?auto_181749 ?auto_181753 ) ) ( not ( = ?auto_181750 ?auto_181751 ) ) ( not ( = ?auto_181750 ?auto_181752 ) ) ( not ( = ?auto_181750 ?auto_181753 ) ) ( not ( = ?auto_181751 ?auto_181752 ) ) ( not ( = ?auto_181751 ?auto_181753 ) ) ( not ( = ?auto_181752 ?auto_181753 ) ) ( ON ?auto_181753 ?auto_181754 ) ( not ( = ?auto_181746 ?auto_181754 ) ) ( not ( = ?auto_181747 ?auto_181754 ) ) ( not ( = ?auto_181748 ?auto_181754 ) ) ( not ( = ?auto_181749 ?auto_181754 ) ) ( not ( = ?auto_181750 ?auto_181754 ) ) ( not ( = ?auto_181751 ?auto_181754 ) ) ( not ( = ?auto_181752 ?auto_181754 ) ) ( not ( = ?auto_181753 ?auto_181754 ) ) ( ON ?auto_181752 ?auto_181753 ) ( ON-TABLE ?auto_181754 ) ( ON ?auto_181751 ?auto_181752 ) ( ON ?auto_181750 ?auto_181751 ) ( ON ?auto_181749 ?auto_181750 ) ( CLEAR ?auto_181749 ) ( HOLDING ?auto_181748 ) ( CLEAR ?auto_181747 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181746 ?auto_181747 ?auto_181748 )
      ( MAKE-8PILE ?auto_181746 ?auto_181747 ?auto_181748 ?auto_181749 ?auto_181750 ?auto_181751 ?auto_181752 ?auto_181753 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181755 - BLOCK
      ?auto_181756 - BLOCK
      ?auto_181757 - BLOCK
      ?auto_181758 - BLOCK
      ?auto_181759 - BLOCK
      ?auto_181760 - BLOCK
      ?auto_181761 - BLOCK
      ?auto_181762 - BLOCK
    )
    :vars
    (
      ?auto_181763 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181755 ) ( ON ?auto_181756 ?auto_181755 ) ( not ( = ?auto_181755 ?auto_181756 ) ) ( not ( = ?auto_181755 ?auto_181757 ) ) ( not ( = ?auto_181755 ?auto_181758 ) ) ( not ( = ?auto_181755 ?auto_181759 ) ) ( not ( = ?auto_181755 ?auto_181760 ) ) ( not ( = ?auto_181755 ?auto_181761 ) ) ( not ( = ?auto_181755 ?auto_181762 ) ) ( not ( = ?auto_181756 ?auto_181757 ) ) ( not ( = ?auto_181756 ?auto_181758 ) ) ( not ( = ?auto_181756 ?auto_181759 ) ) ( not ( = ?auto_181756 ?auto_181760 ) ) ( not ( = ?auto_181756 ?auto_181761 ) ) ( not ( = ?auto_181756 ?auto_181762 ) ) ( not ( = ?auto_181757 ?auto_181758 ) ) ( not ( = ?auto_181757 ?auto_181759 ) ) ( not ( = ?auto_181757 ?auto_181760 ) ) ( not ( = ?auto_181757 ?auto_181761 ) ) ( not ( = ?auto_181757 ?auto_181762 ) ) ( not ( = ?auto_181758 ?auto_181759 ) ) ( not ( = ?auto_181758 ?auto_181760 ) ) ( not ( = ?auto_181758 ?auto_181761 ) ) ( not ( = ?auto_181758 ?auto_181762 ) ) ( not ( = ?auto_181759 ?auto_181760 ) ) ( not ( = ?auto_181759 ?auto_181761 ) ) ( not ( = ?auto_181759 ?auto_181762 ) ) ( not ( = ?auto_181760 ?auto_181761 ) ) ( not ( = ?auto_181760 ?auto_181762 ) ) ( not ( = ?auto_181761 ?auto_181762 ) ) ( ON ?auto_181762 ?auto_181763 ) ( not ( = ?auto_181755 ?auto_181763 ) ) ( not ( = ?auto_181756 ?auto_181763 ) ) ( not ( = ?auto_181757 ?auto_181763 ) ) ( not ( = ?auto_181758 ?auto_181763 ) ) ( not ( = ?auto_181759 ?auto_181763 ) ) ( not ( = ?auto_181760 ?auto_181763 ) ) ( not ( = ?auto_181761 ?auto_181763 ) ) ( not ( = ?auto_181762 ?auto_181763 ) ) ( ON ?auto_181761 ?auto_181762 ) ( ON-TABLE ?auto_181763 ) ( ON ?auto_181760 ?auto_181761 ) ( ON ?auto_181759 ?auto_181760 ) ( ON ?auto_181758 ?auto_181759 ) ( CLEAR ?auto_181756 ) ( ON ?auto_181757 ?auto_181758 ) ( CLEAR ?auto_181757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181763 ?auto_181762 ?auto_181761 ?auto_181760 ?auto_181759 ?auto_181758 )
      ( MAKE-8PILE ?auto_181755 ?auto_181756 ?auto_181757 ?auto_181758 ?auto_181759 ?auto_181760 ?auto_181761 ?auto_181762 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181764 - BLOCK
      ?auto_181765 - BLOCK
      ?auto_181766 - BLOCK
      ?auto_181767 - BLOCK
      ?auto_181768 - BLOCK
      ?auto_181769 - BLOCK
      ?auto_181770 - BLOCK
      ?auto_181771 - BLOCK
    )
    :vars
    (
      ?auto_181772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181764 ) ( not ( = ?auto_181764 ?auto_181765 ) ) ( not ( = ?auto_181764 ?auto_181766 ) ) ( not ( = ?auto_181764 ?auto_181767 ) ) ( not ( = ?auto_181764 ?auto_181768 ) ) ( not ( = ?auto_181764 ?auto_181769 ) ) ( not ( = ?auto_181764 ?auto_181770 ) ) ( not ( = ?auto_181764 ?auto_181771 ) ) ( not ( = ?auto_181765 ?auto_181766 ) ) ( not ( = ?auto_181765 ?auto_181767 ) ) ( not ( = ?auto_181765 ?auto_181768 ) ) ( not ( = ?auto_181765 ?auto_181769 ) ) ( not ( = ?auto_181765 ?auto_181770 ) ) ( not ( = ?auto_181765 ?auto_181771 ) ) ( not ( = ?auto_181766 ?auto_181767 ) ) ( not ( = ?auto_181766 ?auto_181768 ) ) ( not ( = ?auto_181766 ?auto_181769 ) ) ( not ( = ?auto_181766 ?auto_181770 ) ) ( not ( = ?auto_181766 ?auto_181771 ) ) ( not ( = ?auto_181767 ?auto_181768 ) ) ( not ( = ?auto_181767 ?auto_181769 ) ) ( not ( = ?auto_181767 ?auto_181770 ) ) ( not ( = ?auto_181767 ?auto_181771 ) ) ( not ( = ?auto_181768 ?auto_181769 ) ) ( not ( = ?auto_181768 ?auto_181770 ) ) ( not ( = ?auto_181768 ?auto_181771 ) ) ( not ( = ?auto_181769 ?auto_181770 ) ) ( not ( = ?auto_181769 ?auto_181771 ) ) ( not ( = ?auto_181770 ?auto_181771 ) ) ( ON ?auto_181771 ?auto_181772 ) ( not ( = ?auto_181764 ?auto_181772 ) ) ( not ( = ?auto_181765 ?auto_181772 ) ) ( not ( = ?auto_181766 ?auto_181772 ) ) ( not ( = ?auto_181767 ?auto_181772 ) ) ( not ( = ?auto_181768 ?auto_181772 ) ) ( not ( = ?auto_181769 ?auto_181772 ) ) ( not ( = ?auto_181770 ?auto_181772 ) ) ( not ( = ?auto_181771 ?auto_181772 ) ) ( ON ?auto_181770 ?auto_181771 ) ( ON-TABLE ?auto_181772 ) ( ON ?auto_181769 ?auto_181770 ) ( ON ?auto_181768 ?auto_181769 ) ( ON ?auto_181767 ?auto_181768 ) ( ON ?auto_181766 ?auto_181767 ) ( CLEAR ?auto_181766 ) ( HOLDING ?auto_181765 ) ( CLEAR ?auto_181764 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181764 ?auto_181765 )
      ( MAKE-8PILE ?auto_181764 ?auto_181765 ?auto_181766 ?auto_181767 ?auto_181768 ?auto_181769 ?auto_181770 ?auto_181771 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181773 - BLOCK
      ?auto_181774 - BLOCK
      ?auto_181775 - BLOCK
      ?auto_181776 - BLOCK
      ?auto_181777 - BLOCK
      ?auto_181778 - BLOCK
      ?auto_181779 - BLOCK
      ?auto_181780 - BLOCK
    )
    :vars
    (
      ?auto_181781 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_181773 ) ( not ( = ?auto_181773 ?auto_181774 ) ) ( not ( = ?auto_181773 ?auto_181775 ) ) ( not ( = ?auto_181773 ?auto_181776 ) ) ( not ( = ?auto_181773 ?auto_181777 ) ) ( not ( = ?auto_181773 ?auto_181778 ) ) ( not ( = ?auto_181773 ?auto_181779 ) ) ( not ( = ?auto_181773 ?auto_181780 ) ) ( not ( = ?auto_181774 ?auto_181775 ) ) ( not ( = ?auto_181774 ?auto_181776 ) ) ( not ( = ?auto_181774 ?auto_181777 ) ) ( not ( = ?auto_181774 ?auto_181778 ) ) ( not ( = ?auto_181774 ?auto_181779 ) ) ( not ( = ?auto_181774 ?auto_181780 ) ) ( not ( = ?auto_181775 ?auto_181776 ) ) ( not ( = ?auto_181775 ?auto_181777 ) ) ( not ( = ?auto_181775 ?auto_181778 ) ) ( not ( = ?auto_181775 ?auto_181779 ) ) ( not ( = ?auto_181775 ?auto_181780 ) ) ( not ( = ?auto_181776 ?auto_181777 ) ) ( not ( = ?auto_181776 ?auto_181778 ) ) ( not ( = ?auto_181776 ?auto_181779 ) ) ( not ( = ?auto_181776 ?auto_181780 ) ) ( not ( = ?auto_181777 ?auto_181778 ) ) ( not ( = ?auto_181777 ?auto_181779 ) ) ( not ( = ?auto_181777 ?auto_181780 ) ) ( not ( = ?auto_181778 ?auto_181779 ) ) ( not ( = ?auto_181778 ?auto_181780 ) ) ( not ( = ?auto_181779 ?auto_181780 ) ) ( ON ?auto_181780 ?auto_181781 ) ( not ( = ?auto_181773 ?auto_181781 ) ) ( not ( = ?auto_181774 ?auto_181781 ) ) ( not ( = ?auto_181775 ?auto_181781 ) ) ( not ( = ?auto_181776 ?auto_181781 ) ) ( not ( = ?auto_181777 ?auto_181781 ) ) ( not ( = ?auto_181778 ?auto_181781 ) ) ( not ( = ?auto_181779 ?auto_181781 ) ) ( not ( = ?auto_181780 ?auto_181781 ) ) ( ON ?auto_181779 ?auto_181780 ) ( ON-TABLE ?auto_181781 ) ( ON ?auto_181778 ?auto_181779 ) ( ON ?auto_181777 ?auto_181778 ) ( ON ?auto_181776 ?auto_181777 ) ( ON ?auto_181775 ?auto_181776 ) ( CLEAR ?auto_181773 ) ( ON ?auto_181774 ?auto_181775 ) ( CLEAR ?auto_181774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181781 ?auto_181780 ?auto_181779 ?auto_181778 ?auto_181777 ?auto_181776 ?auto_181775 )
      ( MAKE-8PILE ?auto_181773 ?auto_181774 ?auto_181775 ?auto_181776 ?auto_181777 ?auto_181778 ?auto_181779 ?auto_181780 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181782 - BLOCK
      ?auto_181783 - BLOCK
      ?auto_181784 - BLOCK
      ?auto_181785 - BLOCK
      ?auto_181786 - BLOCK
      ?auto_181787 - BLOCK
      ?auto_181788 - BLOCK
      ?auto_181789 - BLOCK
    )
    :vars
    (
      ?auto_181790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181782 ?auto_181783 ) ) ( not ( = ?auto_181782 ?auto_181784 ) ) ( not ( = ?auto_181782 ?auto_181785 ) ) ( not ( = ?auto_181782 ?auto_181786 ) ) ( not ( = ?auto_181782 ?auto_181787 ) ) ( not ( = ?auto_181782 ?auto_181788 ) ) ( not ( = ?auto_181782 ?auto_181789 ) ) ( not ( = ?auto_181783 ?auto_181784 ) ) ( not ( = ?auto_181783 ?auto_181785 ) ) ( not ( = ?auto_181783 ?auto_181786 ) ) ( not ( = ?auto_181783 ?auto_181787 ) ) ( not ( = ?auto_181783 ?auto_181788 ) ) ( not ( = ?auto_181783 ?auto_181789 ) ) ( not ( = ?auto_181784 ?auto_181785 ) ) ( not ( = ?auto_181784 ?auto_181786 ) ) ( not ( = ?auto_181784 ?auto_181787 ) ) ( not ( = ?auto_181784 ?auto_181788 ) ) ( not ( = ?auto_181784 ?auto_181789 ) ) ( not ( = ?auto_181785 ?auto_181786 ) ) ( not ( = ?auto_181785 ?auto_181787 ) ) ( not ( = ?auto_181785 ?auto_181788 ) ) ( not ( = ?auto_181785 ?auto_181789 ) ) ( not ( = ?auto_181786 ?auto_181787 ) ) ( not ( = ?auto_181786 ?auto_181788 ) ) ( not ( = ?auto_181786 ?auto_181789 ) ) ( not ( = ?auto_181787 ?auto_181788 ) ) ( not ( = ?auto_181787 ?auto_181789 ) ) ( not ( = ?auto_181788 ?auto_181789 ) ) ( ON ?auto_181789 ?auto_181790 ) ( not ( = ?auto_181782 ?auto_181790 ) ) ( not ( = ?auto_181783 ?auto_181790 ) ) ( not ( = ?auto_181784 ?auto_181790 ) ) ( not ( = ?auto_181785 ?auto_181790 ) ) ( not ( = ?auto_181786 ?auto_181790 ) ) ( not ( = ?auto_181787 ?auto_181790 ) ) ( not ( = ?auto_181788 ?auto_181790 ) ) ( not ( = ?auto_181789 ?auto_181790 ) ) ( ON ?auto_181788 ?auto_181789 ) ( ON-TABLE ?auto_181790 ) ( ON ?auto_181787 ?auto_181788 ) ( ON ?auto_181786 ?auto_181787 ) ( ON ?auto_181785 ?auto_181786 ) ( ON ?auto_181784 ?auto_181785 ) ( ON ?auto_181783 ?auto_181784 ) ( CLEAR ?auto_181783 ) ( HOLDING ?auto_181782 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_181782 )
      ( MAKE-8PILE ?auto_181782 ?auto_181783 ?auto_181784 ?auto_181785 ?auto_181786 ?auto_181787 ?auto_181788 ?auto_181789 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181791 - BLOCK
      ?auto_181792 - BLOCK
      ?auto_181793 - BLOCK
      ?auto_181794 - BLOCK
      ?auto_181795 - BLOCK
      ?auto_181796 - BLOCK
      ?auto_181797 - BLOCK
      ?auto_181798 - BLOCK
    )
    :vars
    (
      ?auto_181799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_181791 ?auto_181792 ) ) ( not ( = ?auto_181791 ?auto_181793 ) ) ( not ( = ?auto_181791 ?auto_181794 ) ) ( not ( = ?auto_181791 ?auto_181795 ) ) ( not ( = ?auto_181791 ?auto_181796 ) ) ( not ( = ?auto_181791 ?auto_181797 ) ) ( not ( = ?auto_181791 ?auto_181798 ) ) ( not ( = ?auto_181792 ?auto_181793 ) ) ( not ( = ?auto_181792 ?auto_181794 ) ) ( not ( = ?auto_181792 ?auto_181795 ) ) ( not ( = ?auto_181792 ?auto_181796 ) ) ( not ( = ?auto_181792 ?auto_181797 ) ) ( not ( = ?auto_181792 ?auto_181798 ) ) ( not ( = ?auto_181793 ?auto_181794 ) ) ( not ( = ?auto_181793 ?auto_181795 ) ) ( not ( = ?auto_181793 ?auto_181796 ) ) ( not ( = ?auto_181793 ?auto_181797 ) ) ( not ( = ?auto_181793 ?auto_181798 ) ) ( not ( = ?auto_181794 ?auto_181795 ) ) ( not ( = ?auto_181794 ?auto_181796 ) ) ( not ( = ?auto_181794 ?auto_181797 ) ) ( not ( = ?auto_181794 ?auto_181798 ) ) ( not ( = ?auto_181795 ?auto_181796 ) ) ( not ( = ?auto_181795 ?auto_181797 ) ) ( not ( = ?auto_181795 ?auto_181798 ) ) ( not ( = ?auto_181796 ?auto_181797 ) ) ( not ( = ?auto_181796 ?auto_181798 ) ) ( not ( = ?auto_181797 ?auto_181798 ) ) ( ON ?auto_181798 ?auto_181799 ) ( not ( = ?auto_181791 ?auto_181799 ) ) ( not ( = ?auto_181792 ?auto_181799 ) ) ( not ( = ?auto_181793 ?auto_181799 ) ) ( not ( = ?auto_181794 ?auto_181799 ) ) ( not ( = ?auto_181795 ?auto_181799 ) ) ( not ( = ?auto_181796 ?auto_181799 ) ) ( not ( = ?auto_181797 ?auto_181799 ) ) ( not ( = ?auto_181798 ?auto_181799 ) ) ( ON ?auto_181797 ?auto_181798 ) ( ON-TABLE ?auto_181799 ) ( ON ?auto_181796 ?auto_181797 ) ( ON ?auto_181795 ?auto_181796 ) ( ON ?auto_181794 ?auto_181795 ) ( ON ?auto_181793 ?auto_181794 ) ( ON ?auto_181792 ?auto_181793 ) ( ON ?auto_181791 ?auto_181792 ) ( CLEAR ?auto_181791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_181799 ?auto_181798 ?auto_181797 ?auto_181796 ?auto_181795 ?auto_181794 ?auto_181793 ?auto_181792 )
      ( MAKE-8PILE ?auto_181791 ?auto_181792 ?auto_181793 ?auto_181794 ?auto_181795 ?auto_181796 ?auto_181797 ?auto_181798 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_181936 - BLOCK
    )
    :vars
    (
      ?auto_181937 - BLOCK
      ?auto_181938 - BLOCK
      ?auto_181939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181936 ?auto_181937 ) ( CLEAR ?auto_181936 ) ( not ( = ?auto_181936 ?auto_181937 ) ) ( HOLDING ?auto_181938 ) ( CLEAR ?auto_181939 ) ( not ( = ?auto_181936 ?auto_181938 ) ) ( not ( = ?auto_181936 ?auto_181939 ) ) ( not ( = ?auto_181937 ?auto_181938 ) ) ( not ( = ?auto_181937 ?auto_181939 ) ) ( not ( = ?auto_181938 ?auto_181939 ) ) )
    :subtasks
    ( ( !STACK ?auto_181938 ?auto_181939 )
      ( MAKE-1PILE ?auto_181936 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_181940 - BLOCK
    )
    :vars
    (
      ?auto_181943 - BLOCK
      ?auto_181941 - BLOCK
      ?auto_181942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181940 ?auto_181943 ) ( not ( = ?auto_181940 ?auto_181943 ) ) ( CLEAR ?auto_181941 ) ( not ( = ?auto_181940 ?auto_181942 ) ) ( not ( = ?auto_181940 ?auto_181941 ) ) ( not ( = ?auto_181943 ?auto_181942 ) ) ( not ( = ?auto_181943 ?auto_181941 ) ) ( not ( = ?auto_181942 ?auto_181941 ) ) ( ON ?auto_181942 ?auto_181940 ) ( CLEAR ?auto_181942 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_181943 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181943 ?auto_181940 )
      ( MAKE-1PILE ?auto_181940 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_181944 - BLOCK
    )
    :vars
    (
      ?auto_181946 - BLOCK
      ?auto_181945 - BLOCK
      ?auto_181947 - BLOCK
      ?auto_181951 - BLOCK
      ?auto_181950 - BLOCK
      ?auto_181948 - BLOCK
      ?auto_181949 - BLOCK
      ?auto_181952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181944 ?auto_181946 ) ( not ( = ?auto_181944 ?auto_181946 ) ) ( not ( = ?auto_181944 ?auto_181945 ) ) ( not ( = ?auto_181944 ?auto_181947 ) ) ( not ( = ?auto_181946 ?auto_181945 ) ) ( not ( = ?auto_181946 ?auto_181947 ) ) ( not ( = ?auto_181945 ?auto_181947 ) ) ( ON ?auto_181945 ?auto_181944 ) ( CLEAR ?auto_181945 ) ( ON-TABLE ?auto_181946 ) ( HOLDING ?auto_181947 ) ( CLEAR ?auto_181951 ) ( ON-TABLE ?auto_181950 ) ( ON ?auto_181948 ?auto_181950 ) ( ON ?auto_181949 ?auto_181948 ) ( ON ?auto_181952 ?auto_181949 ) ( ON ?auto_181951 ?auto_181952 ) ( not ( = ?auto_181950 ?auto_181948 ) ) ( not ( = ?auto_181950 ?auto_181949 ) ) ( not ( = ?auto_181950 ?auto_181952 ) ) ( not ( = ?auto_181950 ?auto_181951 ) ) ( not ( = ?auto_181950 ?auto_181947 ) ) ( not ( = ?auto_181948 ?auto_181949 ) ) ( not ( = ?auto_181948 ?auto_181952 ) ) ( not ( = ?auto_181948 ?auto_181951 ) ) ( not ( = ?auto_181948 ?auto_181947 ) ) ( not ( = ?auto_181949 ?auto_181952 ) ) ( not ( = ?auto_181949 ?auto_181951 ) ) ( not ( = ?auto_181949 ?auto_181947 ) ) ( not ( = ?auto_181952 ?auto_181951 ) ) ( not ( = ?auto_181952 ?auto_181947 ) ) ( not ( = ?auto_181951 ?auto_181947 ) ) ( not ( = ?auto_181944 ?auto_181951 ) ) ( not ( = ?auto_181944 ?auto_181950 ) ) ( not ( = ?auto_181944 ?auto_181948 ) ) ( not ( = ?auto_181944 ?auto_181949 ) ) ( not ( = ?auto_181944 ?auto_181952 ) ) ( not ( = ?auto_181946 ?auto_181951 ) ) ( not ( = ?auto_181946 ?auto_181950 ) ) ( not ( = ?auto_181946 ?auto_181948 ) ) ( not ( = ?auto_181946 ?auto_181949 ) ) ( not ( = ?auto_181946 ?auto_181952 ) ) ( not ( = ?auto_181945 ?auto_181951 ) ) ( not ( = ?auto_181945 ?auto_181950 ) ) ( not ( = ?auto_181945 ?auto_181948 ) ) ( not ( = ?auto_181945 ?auto_181949 ) ) ( not ( = ?auto_181945 ?auto_181952 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181950 ?auto_181948 ?auto_181949 ?auto_181952 ?auto_181951 ?auto_181947 )
      ( MAKE-1PILE ?auto_181944 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_181953 - BLOCK
    )
    :vars
    (
      ?auto_181957 - BLOCK
      ?auto_181958 - BLOCK
      ?auto_181959 - BLOCK
      ?auto_181961 - BLOCK
      ?auto_181955 - BLOCK
      ?auto_181956 - BLOCK
      ?auto_181954 - BLOCK
      ?auto_181960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181953 ?auto_181957 ) ( not ( = ?auto_181953 ?auto_181957 ) ) ( not ( = ?auto_181953 ?auto_181958 ) ) ( not ( = ?auto_181953 ?auto_181959 ) ) ( not ( = ?auto_181957 ?auto_181958 ) ) ( not ( = ?auto_181957 ?auto_181959 ) ) ( not ( = ?auto_181958 ?auto_181959 ) ) ( ON ?auto_181958 ?auto_181953 ) ( ON-TABLE ?auto_181957 ) ( CLEAR ?auto_181961 ) ( ON-TABLE ?auto_181955 ) ( ON ?auto_181956 ?auto_181955 ) ( ON ?auto_181954 ?auto_181956 ) ( ON ?auto_181960 ?auto_181954 ) ( ON ?auto_181961 ?auto_181960 ) ( not ( = ?auto_181955 ?auto_181956 ) ) ( not ( = ?auto_181955 ?auto_181954 ) ) ( not ( = ?auto_181955 ?auto_181960 ) ) ( not ( = ?auto_181955 ?auto_181961 ) ) ( not ( = ?auto_181955 ?auto_181959 ) ) ( not ( = ?auto_181956 ?auto_181954 ) ) ( not ( = ?auto_181956 ?auto_181960 ) ) ( not ( = ?auto_181956 ?auto_181961 ) ) ( not ( = ?auto_181956 ?auto_181959 ) ) ( not ( = ?auto_181954 ?auto_181960 ) ) ( not ( = ?auto_181954 ?auto_181961 ) ) ( not ( = ?auto_181954 ?auto_181959 ) ) ( not ( = ?auto_181960 ?auto_181961 ) ) ( not ( = ?auto_181960 ?auto_181959 ) ) ( not ( = ?auto_181961 ?auto_181959 ) ) ( not ( = ?auto_181953 ?auto_181961 ) ) ( not ( = ?auto_181953 ?auto_181955 ) ) ( not ( = ?auto_181953 ?auto_181956 ) ) ( not ( = ?auto_181953 ?auto_181954 ) ) ( not ( = ?auto_181953 ?auto_181960 ) ) ( not ( = ?auto_181957 ?auto_181961 ) ) ( not ( = ?auto_181957 ?auto_181955 ) ) ( not ( = ?auto_181957 ?auto_181956 ) ) ( not ( = ?auto_181957 ?auto_181954 ) ) ( not ( = ?auto_181957 ?auto_181960 ) ) ( not ( = ?auto_181958 ?auto_181961 ) ) ( not ( = ?auto_181958 ?auto_181955 ) ) ( not ( = ?auto_181958 ?auto_181956 ) ) ( not ( = ?auto_181958 ?auto_181954 ) ) ( not ( = ?auto_181958 ?auto_181960 ) ) ( ON ?auto_181959 ?auto_181958 ) ( CLEAR ?auto_181959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181957 ?auto_181953 ?auto_181958 )
      ( MAKE-1PILE ?auto_181953 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_181962 - BLOCK
    )
    :vars
    (
      ?auto_181965 - BLOCK
      ?auto_181970 - BLOCK
      ?auto_181968 - BLOCK
      ?auto_181969 - BLOCK
      ?auto_181967 - BLOCK
      ?auto_181964 - BLOCK
      ?auto_181966 - BLOCK
      ?auto_181963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181962 ?auto_181965 ) ( not ( = ?auto_181962 ?auto_181965 ) ) ( not ( = ?auto_181962 ?auto_181970 ) ) ( not ( = ?auto_181962 ?auto_181968 ) ) ( not ( = ?auto_181965 ?auto_181970 ) ) ( not ( = ?auto_181965 ?auto_181968 ) ) ( not ( = ?auto_181970 ?auto_181968 ) ) ( ON ?auto_181970 ?auto_181962 ) ( ON-TABLE ?auto_181965 ) ( ON-TABLE ?auto_181969 ) ( ON ?auto_181967 ?auto_181969 ) ( ON ?auto_181964 ?auto_181967 ) ( ON ?auto_181966 ?auto_181964 ) ( not ( = ?auto_181969 ?auto_181967 ) ) ( not ( = ?auto_181969 ?auto_181964 ) ) ( not ( = ?auto_181969 ?auto_181966 ) ) ( not ( = ?auto_181969 ?auto_181963 ) ) ( not ( = ?auto_181969 ?auto_181968 ) ) ( not ( = ?auto_181967 ?auto_181964 ) ) ( not ( = ?auto_181967 ?auto_181966 ) ) ( not ( = ?auto_181967 ?auto_181963 ) ) ( not ( = ?auto_181967 ?auto_181968 ) ) ( not ( = ?auto_181964 ?auto_181966 ) ) ( not ( = ?auto_181964 ?auto_181963 ) ) ( not ( = ?auto_181964 ?auto_181968 ) ) ( not ( = ?auto_181966 ?auto_181963 ) ) ( not ( = ?auto_181966 ?auto_181968 ) ) ( not ( = ?auto_181963 ?auto_181968 ) ) ( not ( = ?auto_181962 ?auto_181963 ) ) ( not ( = ?auto_181962 ?auto_181969 ) ) ( not ( = ?auto_181962 ?auto_181967 ) ) ( not ( = ?auto_181962 ?auto_181964 ) ) ( not ( = ?auto_181962 ?auto_181966 ) ) ( not ( = ?auto_181965 ?auto_181963 ) ) ( not ( = ?auto_181965 ?auto_181969 ) ) ( not ( = ?auto_181965 ?auto_181967 ) ) ( not ( = ?auto_181965 ?auto_181964 ) ) ( not ( = ?auto_181965 ?auto_181966 ) ) ( not ( = ?auto_181970 ?auto_181963 ) ) ( not ( = ?auto_181970 ?auto_181969 ) ) ( not ( = ?auto_181970 ?auto_181967 ) ) ( not ( = ?auto_181970 ?auto_181964 ) ) ( not ( = ?auto_181970 ?auto_181966 ) ) ( ON ?auto_181968 ?auto_181970 ) ( CLEAR ?auto_181968 ) ( HOLDING ?auto_181963 ) ( CLEAR ?auto_181966 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181969 ?auto_181967 ?auto_181964 ?auto_181966 ?auto_181963 )
      ( MAKE-1PILE ?auto_181962 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_181971 - BLOCK
    )
    :vars
    (
      ?auto_181975 - BLOCK
      ?auto_181976 - BLOCK
      ?auto_181973 - BLOCK
      ?auto_181979 - BLOCK
      ?auto_181977 - BLOCK
      ?auto_181974 - BLOCK
      ?auto_181978 - BLOCK
      ?auto_181972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181971 ?auto_181975 ) ( not ( = ?auto_181971 ?auto_181975 ) ) ( not ( = ?auto_181971 ?auto_181976 ) ) ( not ( = ?auto_181971 ?auto_181973 ) ) ( not ( = ?auto_181975 ?auto_181976 ) ) ( not ( = ?auto_181975 ?auto_181973 ) ) ( not ( = ?auto_181976 ?auto_181973 ) ) ( ON ?auto_181976 ?auto_181971 ) ( ON-TABLE ?auto_181975 ) ( ON-TABLE ?auto_181979 ) ( ON ?auto_181977 ?auto_181979 ) ( ON ?auto_181974 ?auto_181977 ) ( ON ?auto_181978 ?auto_181974 ) ( not ( = ?auto_181979 ?auto_181977 ) ) ( not ( = ?auto_181979 ?auto_181974 ) ) ( not ( = ?auto_181979 ?auto_181978 ) ) ( not ( = ?auto_181979 ?auto_181972 ) ) ( not ( = ?auto_181979 ?auto_181973 ) ) ( not ( = ?auto_181977 ?auto_181974 ) ) ( not ( = ?auto_181977 ?auto_181978 ) ) ( not ( = ?auto_181977 ?auto_181972 ) ) ( not ( = ?auto_181977 ?auto_181973 ) ) ( not ( = ?auto_181974 ?auto_181978 ) ) ( not ( = ?auto_181974 ?auto_181972 ) ) ( not ( = ?auto_181974 ?auto_181973 ) ) ( not ( = ?auto_181978 ?auto_181972 ) ) ( not ( = ?auto_181978 ?auto_181973 ) ) ( not ( = ?auto_181972 ?auto_181973 ) ) ( not ( = ?auto_181971 ?auto_181972 ) ) ( not ( = ?auto_181971 ?auto_181979 ) ) ( not ( = ?auto_181971 ?auto_181977 ) ) ( not ( = ?auto_181971 ?auto_181974 ) ) ( not ( = ?auto_181971 ?auto_181978 ) ) ( not ( = ?auto_181975 ?auto_181972 ) ) ( not ( = ?auto_181975 ?auto_181979 ) ) ( not ( = ?auto_181975 ?auto_181977 ) ) ( not ( = ?auto_181975 ?auto_181974 ) ) ( not ( = ?auto_181975 ?auto_181978 ) ) ( not ( = ?auto_181976 ?auto_181972 ) ) ( not ( = ?auto_181976 ?auto_181979 ) ) ( not ( = ?auto_181976 ?auto_181977 ) ) ( not ( = ?auto_181976 ?auto_181974 ) ) ( not ( = ?auto_181976 ?auto_181978 ) ) ( ON ?auto_181973 ?auto_181976 ) ( CLEAR ?auto_181978 ) ( ON ?auto_181972 ?auto_181973 ) ( CLEAR ?auto_181972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181975 ?auto_181971 ?auto_181976 ?auto_181973 )
      ( MAKE-1PILE ?auto_181971 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_181980 - BLOCK
    )
    :vars
    (
      ?auto_181988 - BLOCK
      ?auto_181987 - BLOCK
      ?auto_181982 - BLOCK
      ?auto_181986 - BLOCK
      ?auto_181984 - BLOCK
      ?auto_181981 - BLOCK
      ?auto_181985 - BLOCK
      ?auto_181983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181980 ?auto_181988 ) ( not ( = ?auto_181980 ?auto_181988 ) ) ( not ( = ?auto_181980 ?auto_181987 ) ) ( not ( = ?auto_181980 ?auto_181982 ) ) ( not ( = ?auto_181988 ?auto_181987 ) ) ( not ( = ?auto_181988 ?auto_181982 ) ) ( not ( = ?auto_181987 ?auto_181982 ) ) ( ON ?auto_181987 ?auto_181980 ) ( ON-TABLE ?auto_181988 ) ( ON-TABLE ?auto_181986 ) ( ON ?auto_181984 ?auto_181986 ) ( ON ?auto_181981 ?auto_181984 ) ( not ( = ?auto_181986 ?auto_181984 ) ) ( not ( = ?auto_181986 ?auto_181981 ) ) ( not ( = ?auto_181986 ?auto_181985 ) ) ( not ( = ?auto_181986 ?auto_181983 ) ) ( not ( = ?auto_181986 ?auto_181982 ) ) ( not ( = ?auto_181984 ?auto_181981 ) ) ( not ( = ?auto_181984 ?auto_181985 ) ) ( not ( = ?auto_181984 ?auto_181983 ) ) ( not ( = ?auto_181984 ?auto_181982 ) ) ( not ( = ?auto_181981 ?auto_181985 ) ) ( not ( = ?auto_181981 ?auto_181983 ) ) ( not ( = ?auto_181981 ?auto_181982 ) ) ( not ( = ?auto_181985 ?auto_181983 ) ) ( not ( = ?auto_181985 ?auto_181982 ) ) ( not ( = ?auto_181983 ?auto_181982 ) ) ( not ( = ?auto_181980 ?auto_181983 ) ) ( not ( = ?auto_181980 ?auto_181986 ) ) ( not ( = ?auto_181980 ?auto_181984 ) ) ( not ( = ?auto_181980 ?auto_181981 ) ) ( not ( = ?auto_181980 ?auto_181985 ) ) ( not ( = ?auto_181988 ?auto_181983 ) ) ( not ( = ?auto_181988 ?auto_181986 ) ) ( not ( = ?auto_181988 ?auto_181984 ) ) ( not ( = ?auto_181988 ?auto_181981 ) ) ( not ( = ?auto_181988 ?auto_181985 ) ) ( not ( = ?auto_181987 ?auto_181983 ) ) ( not ( = ?auto_181987 ?auto_181986 ) ) ( not ( = ?auto_181987 ?auto_181984 ) ) ( not ( = ?auto_181987 ?auto_181981 ) ) ( not ( = ?auto_181987 ?auto_181985 ) ) ( ON ?auto_181982 ?auto_181987 ) ( ON ?auto_181983 ?auto_181982 ) ( CLEAR ?auto_181983 ) ( HOLDING ?auto_181985 ) ( CLEAR ?auto_181981 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181986 ?auto_181984 ?auto_181981 ?auto_181985 )
      ( MAKE-1PILE ?auto_181980 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_181989 - BLOCK
    )
    :vars
    (
      ?auto_181992 - BLOCK
      ?auto_181997 - BLOCK
      ?auto_181993 - BLOCK
      ?auto_181991 - BLOCK
      ?auto_181990 - BLOCK
      ?auto_181996 - BLOCK
      ?auto_181994 - BLOCK
      ?auto_181995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181989 ?auto_181992 ) ( not ( = ?auto_181989 ?auto_181992 ) ) ( not ( = ?auto_181989 ?auto_181997 ) ) ( not ( = ?auto_181989 ?auto_181993 ) ) ( not ( = ?auto_181992 ?auto_181997 ) ) ( not ( = ?auto_181992 ?auto_181993 ) ) ( not ( = ?auto_181997 ?auto_181993 ) ) ( ON ?auto_181997 ?auto_181989 ) ( ON-TABLE ?auto_181992 ) ( ON-TABLE ?auto_181991 ) ( ON ?auto_181990 ?auto_181991 ) ( ON ?auto_181996 ?auto_181990 ) ( not ( = ?auto_181991 ?auto_181990 ) ) ( not ( = ?auto_181991 ?auto_181996 ) ) ( not ( = ?auto_181991 ?auto_181994 ) ) ( not ( = ?auto_181991 ?auto_181995 ) ) ( not ( = ?auto_181991 ?auto_181993 ) ) ( not ( = ?auto_181990 ?auto_181996 ) ) ( not ( = ?auto_181990 ?auto_181994 ) ) ( not ( = ?auto_181990 ?auto_181995 ) ) ( not ( = ?auto_181990 ?auto_181993 ) ) ( not ( = ?auto_181996 ?auto_181994 ) ) ( not ( = ?auto_181996 ?auto_181995 ) ) ( not ( = ?auto_181996 ?auto_181993 ) ) ( not ( = ?auto_181994 ?auto_181995 ) ) ( not ( = ?auto_181994 ?auto_181993 ) ) ( not ( = ?auto_181995 ?auto_181993 ) ) ( not ( = ?auto_181989 ?auto_181995 ) ) ( not ( = ?auto_181989 ?auto_181991 ) ) ( not ( = ?auto_181989 ?auto_181990 ) ) ( not ( = ?auto_181989 ?auto_181996 ) ) ( not ( = ?auto_181989 ?auto_181994 ) ) ( not ( = ?auto_181992 ?auto_181995 ) ) ( not ( = ?auto_181992 ?auto_181991 ) ) ( not ( = ?auto_181992 ?auto_181990 ) ) ( not ( = ?auto_181992 ?auto_181996 ) ) ( not ( = ?auto_181992 ?auto_181994 ) ) ( not ( = ?auto_181997 ?auto_181995 ) ) ( not ( = ?auto_181997 ?auto_181991 ) ) ( not ( = ?auto_181997 ?auto_181990 ) ) ( not ( = ?auto_181997 ?auto_181996 ) ) ( not ( = ?auto_181997 ?auto_181994 ) ) ( ON ?auto_181993 ?auto_181997 ) ( ON ?auto_181995 ?auto_181993 ) ( CLEAR ?auto_181996 ) ( ON ?auto_181994 ?auto_181995 ) ( CLEAR ?auto_181994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181992 ?auto_181989 ?auto_181997 ?auto_181993 ?auto_181995 )
      ( MAKE-1PILE ?auto_181989 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_181998 - BLOCK
    )
    :vars
    (
      ?auto_182001 - BLOCK
      ?auto_182000 - BLOCK
      ?auto_182005 - BLOCK
      ?auto_182002 - BLOCK
      ?auto_182004 - BLOCK
      ?auto_181999 - BLOCK
      ?auto_182003 - BLOCK
      ?auto_182006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181998 ?auto_182001 ) ( not ( = ?auto_181998 ?auto_182001 ) ) ( not ( = ?auto_181998 ?auto_182000 ) ) ( not ( = ?auto_181998 ?auto_182005 ) ) ( not ( = ?auto_182001 ?auto_182000 ) ) ( not ( = ?auto_182001 ?auto_182005 ) ) ( not ( = ?auto_182000 ?auto_182005 ) ) ( ON ?auto_182000 ?auto_181998 ) ( ON-TABLE ?auto_182001 ) ( ON-TABLE ?auto_182002 ) ( ON ?auto_182004 ?auto_182002 ) ( not ( = ?auto_182002 ?auto_182004 ) ) ( not ( = ?auto_182002 ?auto_181999 ) ) ( not ( = ?auto_182002 ?auto_182003 ) ) ( not ( = ?auto_182002 ?auto_182006 ) ) ( not ( = ?auto_182002 ?auto_182005 ) ) ( not ( = ?auto_182004 ?auto_181999 ) ) ( not ( = ?auto_182004 ?auto_182003 ) ) ( not ( = ?auto_182004 ?auto_182006 ) ) ( not ( = ?auto_182004 ?auto_182005 ) ) ( not ( = ?auto_181999 ?auto_182003 ) ) ( not ( = ?auto_181999 ?auto_182006 ) ) ( not ( = ?auto_181999 ?auto_182005 ) ) ( not ( = ?auto_182003 ?auto_182006 ) ) ( not ( = ?auto_182003 ?auto_182005 ) ) ( not ( = ?auto_182006 ?auto_182005 ) ) ( not ( = ?auto_181998 ?auto_182006 ) ) ( not ( = ?auto_181998 ?auto_182002 ) ) ( not ( = ?auto_181998 ?auto_182004 ) ) ( not ( = ?auto_181998 ?auto_181999 ) ) ( not ( = ?auto_181998 ?auto_182003 ) ) ( not ( = ?auto_182001 ?auto_182006 ) ) ( not ( = ?auto_182001 ?auto_182002 ) ) ( not ( = ?auto_182001 ?auto_182004 ) ) ( not ( = ?auto_182001 ?auto_181999 ) ) ( not ( = ?auto_182001 ?auto_182003 ) ) ( not ( = ?auto_182000 ?auto_182006 ) ) ( not ( = ?auto_182000 ?auto_182002 ) ) ( not ( = ?auto_182000 ?auto_182004 ) ) ( not ( = ?auto_182000 ?auto_181999 ) ) ( not ( = ?auto_182000 ?auto_182003 ) ) ( ON ?auto_182005 ?auto_182000 ) ( ON ?auto_182006 ?auto_182005 ) ( ON ?auto_182003 ?auto_182006 ) ( CLEAR ?auto_182003 ) ( HOLDING ?auto_181999 ) ( CLEAR ?auto_182004 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182002 ?auto_182004 ?auto_181999 )
      ( MAKE-1PILE ?auto_181998 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182007 - BLOCK
    )
    :vars
    (
      ?auto_182013 - BLOCK
      ?auto_182011 - BLOCK
      ?auto_182015 - BLOCK
      ?auto_182010 - BLOCK
      ?auto_182012 - BLOCK
      ?auto_182014 - BLOCK
      ?auto_182008 - BLOCK
      ?auto_182009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182007 ?auto_182013 ) ( not ( = ?auto_182007 ?auto_182013 ) ) ( not ( = ?auto_182007 ?auto_182011 ) ) ( not ( = ?auto_182007 ?auto_182015 ) ) ( not ( = ?auto_182013 ?auto_182011 ) ) ( not ( = ?auto_182013 ?auto_182015 ) ) ( not ( = ?auto_182011 ?auto_182015 ) ) ( ON ?auto_182011 ?auto_182007 ) ( ON-TABLE ?auto_182013 ) ( ON-TABLE ?auto_182010 ) ( ON ?auto_182012 ?auto_182010 ) ( not ( = ?auto_182010 ?auto_182012 ) ) ( not ( = ?auto_182010 ?auto_182014 ) ) ( not ( = ?auto_182010 ?auto_182008 ) ) ( not ( = ?auto_182010 ?auto_182009 ) ) ( not ( = ?auto_182010 ?auto_182015 ) ) ( not ( = ?auto_182012 ?auto_182014 ) ) ( not ( = ?auto_182012 ?auto_182008 ) ) ( not ( = ?auto_182012 ?auto_182009 ) ) ( not ( = ?auto_182012 ?auto_182015 ) ) ( not ( = ?auto_182014 ?auto_182008 ) ) ( not ( = ?auto_182014 ?auto_182009 ) ) ( not ( = ?auto_182014 ?auto_182015 ) ) ( not ( = ?auto_182008 ?auto_182009 ) ) ( not ( = ?auto_182008 ?auto_182015 ) ) ( not ( = ?auto_182009 ?auto_182015 ) ) ( not ( = ?auto_182007 ?auto_182009 ) ) ( not ( = ?auto_182007 ?auto_182010 ) ) ( not ( = ?auto_182007 ?auto_182012 ) ) ( not ( = ?auto_182007 ?auto_182014 ) ) ( not ( = ?auto_182007 ?auto_182008 ) ) ( not ( = ?auto_182013 ?auto_182009 ) ) ( not ( = ?auto_182013 ?auto_182010 ) ) ( not ( = ?auto_182013 ?auto_182012 ) ) ( not ( = ?auto_182013 ?auto_182014 ) ) ( not ( = ?auto_182013 ?auto_182008 ) ) ( not ( = ?auto_182011 ?auto_182009 ) ) ( not ( = ?auto_182011 ?auto_182010 ) ) ( not ( = ?auto_182011 ?auto_182012 ) ) ( not ( = ?auto_182011 ?auto_182014 ) ) ( not ( = ?auto_182011 ?auto_182008 ) ) ( ON ?auto_182015 ?auto_182011 ) ( ON ?auto_182009 ?auto_182015 ) ( ON ?auto_182008 ?auto_182009 ) ( CLEAR ?auto_182012 ) ( ON ?auto_182014 ?auto_182008 ) ( CLEAR ?auto_182014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_182013 ?auto_182007 ?auto_182011 ?auto_182015 ?auto_182009 ?auto_182008 )
      ( MAKE-1PILE ?auto_182007 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182016 - BLOCK
    )
    :vars
    (
      ?auto_182021 - BLOCK
      ?auto_182022 - BLOCK
      ?auto_182020 - BLOCK
      ?auto_182024 - BLOCK
      ?auto_182017 - BLOCK
      ?auto_182023 - BLOCK
      ?auto_182018 - BLOCK
      ?auto_182019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182016 ?auto_182021 ) ( not ( = ?auto_182016 ?auto_182021 ) ) ( not ( = ?auto_182016 ?auto_182022 ) ) ( not ( = ?auto_182016 ?auto_182020 ) ) ( not ( = ?auto_182021 ?auto_182022 ) ) ( not ( = ?auto_182021 ?auto_182020 ) ) ( not ( = ?auto_182022 ?auto_182020 ) ) ( ON ?auto_182022 ?auto_182016 ) ( ON-TABLE ?auto_182021 ) ( ON-TABLE ?auto_182024 ) ( not ( = ?auto_182024 ?auto_182017 ) ) ( not ( = ?auto_182024 ?auto_182023 ) ) ( not ( = ?auto_182024 ?auto_182018 ) ) ( not ( = ?auto_182024 ?auto_182019 ) ) ( not ( = ?auto_182024 ?auto_182020 ) ) ( not ( = ?auto_182017 ?auto_182023 ) ) ( not ( = ?auto_182017 ?auto_182018 ) ) ( not ( = ?auto_182017 ?auto_182019 ) ) ( not ( = ?auto_182017 ?auto_182020 ) ) ( not ( = ?auto_182023 ?auto_182018 ) ) ( not ( = ?auto_182023 ?auto_182019 ) ) ( not ( = ?auto_182023 ?auto_182020 ) ) ( not ( = ?auto_182018 ?auto_182019 ) ) ( not ( = ?auto_182018 ?auto_182020 ) ) ( not ( = ?auto_182019 ?auto_182020 ) ) ( not ( = ?auto_182016 ?auto_182019 ) ) ( not ( = ?auto_182016 ?auto_182024 ) ) ( not ( = ?auto_182016 ?auto_182017 ) ) ( not ( = ?auto_182016 ?auto_182023 ) ) ( not ( = ?auto_182016 ?auto_182018 ) ) ( not ( = ?auto_182021 ?auto_182019 ) ) ( not ( = ?auto_182021 ?auto_182024 ) ) ( not ( = ?auto_182021 ?auto_182017 ) ) ( not ( = ?auto_182021 ?auto_182023 ) ) ( not ( = ?auto_182021 ?auto_182018 ) ) ( not ( = ?auto_182022 ?auto_182019 ) ) ( not ( = ?auto_182022 ?auto_182024 ) ) ( not ( = ?auto_182022 ?auto_182017 ) ) ( not ( = ?auto_182022 ?auto_182023 ) ) ( not ( = ?auto_182022 ?auto_182018 ) ) ( ON ?auto_182020 ?auto_182022 ) ( ON ?auto_182019 ?auto_182020 ) ( ON ?auto_182018 ?auto_182019 ) ( ON ?auto_182023 ?auto_182018 ) ( CLEAR ?auto_182023 ) ( HOLDING ?auto_182017 ) ( CLEAR ?auto_182024 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182024 ?auto_182017 )
      ( MAKE-1PILE ?auto_182016 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182025 - BLOCK
    )
    :vars
    (
      ?auto_182029 - BLOCK
      ?auto_182033 - BLOCK
      ?auto_182027 - BLOCK
      ?auto_182026 - BLOCK
      ?auto_182028 - BLOCK
      ?auto_182031 - BLOCK
      ?auto_182030 - BLOCK
      ?auto_182032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182025 ?auto_182029 ) ( not ( = ?auto_182025 ?auto_182029 ) ) ( not ( = ?auto_182025 ?auto_182033 ) ) ( not ( = ?auto_182025 ?auto_182027 ) ) ( not ( = ?auto_182029 ?auto_182033 ) ) ( not ( = ?auto_182029 ?auto_182027 ) ) ( not ( = ?auto_182033 ?auto_182027 ) ) ( ON ?auto_182033 ?auto_182025 ) ( ON-TABLE ?auto_182029 ) ( ON-TABLE ?auto_182026 ) ( not ( = ?auto_182026 ?auto_182028 ) ) ( not ( = ?auto_182026 ?auto_182031 ) ) ( not ( = ?auto_182026 ?auto_182030 ) ) ( not ( = ?auto_182026 ?auto_182032 ) ) ( not ( = ?auto_182026 ?auto_182027 ) ) ( not ( = ?auto_182028 ?auto_182031 ) ) ( not ( = ?auto_182028 ?auto_182030 ) ) ( not ( = ?auto_182028 ?auto_182032 ) ) ( not ( = ?auto_182028 ?auto_182027 ) ) ( not ( = ?auto_182031 ?auto_182030 ) ) ( not ( = ?auto_182031 ?auto_182032 ) ) ( not ( = ?auto_182031 ?auto_182027 ) ) ( not ( = ?auto_182030 ?auto_182032 ) ) ( not ( = ?auto_182030 ?auto_182027 ) ) ( not ( = ?auto_182032 ?auto_182027 ) ) ( not ( = ?auto_182025 ?auto_182032 ) ) ( not ( = ?auto_182025 ?auto_182026 ) ) ( not ( = ?auto_182025 ?auto_182028 ) ) ( not ( = ?auto_182025 ?auto_182031 ) ) ( not ( = ?auto_182025 ?auto_182030 ) ) ( not ( = ?auto_182029 ?auto_182032 ) ) ( not ( = ?auto_182029 ?auto_182026 ) ) ( not ( = ?auto_182029 ?auto_182028 ) ) ( not ( = ?auto_182029 ?auto_182031 ) ) ( not ( = ?auto_182029 ?auto_182030 ) ) ( not ( = ?auto_182033 ?auto_182032 ) ) ( not ( = ?auto_182033 ?auto_182026 ) ) ( not ( = ?auto_182033 ?auto_182028 ) ) ( not ( = ?auto_182033 ?auto_182031 ) ) ( not ( = ?auto_182033 ?auto_182030 ) ) ( ON ?auto_182027 ?auto_182033 ) ( ON ?auto_182032 ?auto_182027 ) ( ON ?auto_182030 ?auto_182032 ) ( ON ?auto_182031 ?auto_182030 ) ( CLEAR ?auto_182026 ) ( ON ?auto_182028 ?auto_182031 ) ( CLEAR ?auto_182028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182029 ?auto_182025 ?auto_182033 ?auto_182027 ?auto_182032 ?auto_182030 ?auto_182031 )
      ( MAKE-1PILE ?auto_182025 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182034 - BLOCK
    )
    :vars
    (
      ?auto_182036 - BLOCK
      ?auto_182038 - BLOCK
      ?auto_182040 - BLOCK
      ?auto_182042 - BLOCK
      ?auto_182041 - BLOCK
      ?auto_182037 - BLOCK
      ?auto_182039 - BLOCK
      ?auto_182035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182034 ?auto_182036 ) ( not ( = ?auto_182034 ?auto_182036 ) ) ( not ( = ?auto_182034 ?auto_182038 ) ) ( not ( = ?auto_182034 ?auto_182040 ) ) ( not ( = ?auto_182036 ?auto_182038 ) ) ( not ( = ?auto_182036 ?auto_182040 ) ) ( not ( = ?auto_182038 ?auto_182040 ) ) ( ON ?auto_182038 ?auto_182034 ) ( ON-TABLE ?auto_182036 ) ( not ( = ?auto_182042 ?auto_182041 ) ) ( not ( = ?auto_182042 ?auto_182037 ) ) ( not ( = ?auto_182042 ?auto_182039 ) ) ( not ( = ?auto_182042 ?auto_182035 ) ) ( not ( = ?auto_182042 ?auto_182040 ) ) ( not ( = ?auto_182041 ?auto_182037 ) ) ( not ( = ?auto_182041 ?auto_182039 ) ) ( not ( = ?auto_182041 ?auto_182035 ) ) ( not ( = ?auto_182041 ?auto_182040 ) ) ( not ( = ?auto_182037 ?auto_182039 ) ) ( not ( = ?auto_182037 ?auto_182035 ) ) ( not ( = ?auto_182037 ?auto_182040 ) ) ( not ( = ?auto_182039 ?auto_182035 ) ) ( not ( = ?auto_182039 ?auto_182040 ) ) ( not ( = ?auto_182035 ?auto_182040 ) ) ( not ( = ?auto_182034 ?auto_182035 ) ) ( not ( = ?auto_182034 ?auto_182042 ) ) ( not ( = ?auto_182034 ?auto_182041 ) ) ( not ( = ?auto_182034 ?auto_182037 ) ) ( not ( = ?auto_182034 ?auto_182039 ) ) ( not ( = ?auto_182036 ?auto_182035 ) ) ( not ( = ?auto_182036 ?auto_182042 ) ) ( not ( = ?auto_182036 ?auto_182041 ) ) ( not ( = ?auto_182036 ?auto_182037 ) ) ( not ( = ?auto_182036 ?auto_182039 ) ) ( not ( = ?auto_182038 ?auto_182035 ) ) ( not ( = ?auto_182038 ?auto_182042 ) ) ( not ( = ?auto_182038 ?auto_182041 ) ) ( not ( = ?auto_182038 ?auto_182037 ) ) ( not ( = ?auto_182038 ?auto_182039 ) ) ( ON ?auto_182040 ?auto_182038 ) ( ON ?auto_182035 ?auto_182040 ) ( ON ?auto_182039 ?auto_182035 ) ( ON ?auto_182037 ?auto_182039 ) ( ON ?auto_182041 ?auto_182037 ) ( CLEAR ?auto_182041 ) ( HOLDING ?auto_182042 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_182042 )
      ( MAKE-1PILE ?auto_182034 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_182043 - BLOCK
    )
    :vars
    (
      ?auto_182047 - BLOCK
      ?auto_182046 - BLOCK
      ?auto_182045 - BLOCK
      ?auto_182051 - BLOCK
      ?auto_182048 - BLOCK
      ?auto_182050 - BLOCK
      ?auto_182049 - BLOCK
      ?auto_182044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182043 ?auto_182047 ) ( not ( = ?auto_182043 ?auto_182047 ) ) ( not ( = ?auto_182043 ?auto_182046 ) ) ( not ( = ?auto_182043 ?auto_182045 ) ) ( not ( = ?auto_182047 ?auto_182046 ) ) ( not ( = ?auto_182047 ?auto_182045 ) ) ( not ( = ?auto_182046 ?auto_182045 ) ) ( ON ?auto_182046 ?auto_182043 ) ( ON-TABLE ?auto_182047 ) ( not ( = ?auto_182051 ?auto_182048 ) ) ( not ( = ?auto_182051 ?auto_182050 ) ) ( not ( = ?auto_182051 ?auto_182049 ) ) ( not ( = ?auto_182051 ?auto_182044 ) ) ( not ( = ?auto_182051 ?auto_182045 ) ) ( not ( = ?auto_182048 ?auto_182050 ) ) ( not ( = ?auto_182048 ?auto_182049 ) ) ( not ( = ?auto_182048 ?auto_182044 ) ) ( not ( = ?auto_182048 ?auto_182045 ) ) ( not ( = ?auto_182050 ?auto_182049 ) ) ( not ( = ?auto_182050 ?auto_182044 ) ) ( not ( = ?auto_182050 ?auto_182045 ) ) ( not ( = ?auto_182049 ?auto_182044 ) ) ( not ( = ?auto_182049 ?auto_182045 ) ) ( not ( = ?auto_182044 ?auto_182045 ) ) ( not ( = ?auto_182043 ?auto_182044 ) ) ( not ( = ?auto_182043 ?auto_182051 ) ) ( not ( = ?auto_182043 ?auto_182048 ) ) ( not ( = ?auto_182043 ?auto_182050 ) ) ( not ( = ?auto_182043 ?auto_182049 ) ) ( not ( = ?auto_182047 ?auto_182044 ) ) ( not ( = ?auto_182047 ?auto_182051 ) ) ( not ( = ?auto_182047 ?auto_182048 ) ) ( not ( = ?auto_182047 ?auto_182050 ) ) ( not ( = ?auto_182047 ?auto_182049 ) ) ( not ( = ?auto_182046 ?auto_182044 ) ) ( not ( = ?auto_182046 ?auto_182051 ) ) ( not ( = ?auto_182046 ?auto_182048 ) ) ( not ( = ?auto_182046 ?auto_182050 ) ) ( not ( = ?auto_182046 ?auto_182049 ) ) ( ON ?auto_182045 ?auto_182046 ) ( ON ?auto_182044 ?auto_182045 ) ( ON ?auto_182049 ?auto_182044 ) ( ON ?auto_182050 ?auto_182049 ) ( ON ?auto_182048 ?auto_182050 ) ( ON ?auto_182051 ?auto_182048 ) ( CLEAR ?auto_182051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_182047 ?auto_182043 ?auto_182046 ?auto_182045 ?auto_182044 ?auto_182049 ?auto_182050 ?auto_182048 )
      ( MAKE-1PILE ?auto_182043 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_182065 - BLOCK
      ?auto_182066 - BLOCK
      ?auto_182067 - BLOCK
      ?auto_182068 - BLOCK
      ?auto_182069 - BLOCK
      ?auto_182070 - BLOCK
    )
    :vars
    (
      ?auto_182071 - BLOCK
      ?auto_182072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182071 ?auto_182070 ) ( CLEAR ?auto_182071 ) ( ON-TABLE ?auto_182065 ) ( ON ?auto_182066 ?auto_182065 ) ( ON ?auto_182067 ?auto_182066 ) ( ON ?auto_182068 ?auto_182067 ) ( ON ?auto_182069 ?auto_182068 ) ( ON ?auto_182070 ?auto_182069 ) ( not ( = ?auto_182065 ?auto_182066 ) ) ( not ( = ?auto_182065 ?auto_182067 ) ) ( not ( = ?auto_182065 ?auto_182068 ) ) ( not ( = ?auto_182065 ?auto_182069 ) ) ( not ( = ?auto_182065 ?auto_182070 ) ) ( not ( = ?auto_182065 ?auto_182071 ) ) ( not ( = ?auto_182066 ?auto_182067 ) ) ( not ( = ?auto_182066 ?auto_182068 ) ) ( not ( = ?auto_182066 ?auto_182069 ) ) ( not ( = ?auto_182066 ?auto_182070 ) ) ( not ( = ?auto_182066 ?auto_182071 ) ) ( not ( = ?auto_182067 ?auto_182068 ) ) ( not ( = ?auto_182067 ?auto_182069 ) ) ( not ( = ?auto_182067 ?auto_182070 ) ) ( not ( = ?auto_182067 ?auto_182071 ) ) ( not ( = ?auto_182068 ?auto_182069 ) ) ( not ( = ?auto_182068 ?auto_182070 ) ) ( not ( = ?auto_182068 ?auto_182071 ) ) ( not ( = ?auto_182069 ?auto_182070 ) ) ( not ( = ?auto_182069 ?auto_182071 ) ) ( not ( = ?auto_182070 ?auto_182071 ) ) ( HOLDING ?auto_182072 ) ( not ( = ?auto_182065 ?auto_182072 ) ) ( not ( = ?auto_182066 ?auto_182072 ) ) ( not ( = ?auto_182067 ?auto_182072 ) ) ( not ( = ?auto_182068 ?auto_182072 ) ) ( not ( = ?auto_182069 ?auto_182072 ) ) ( not ( = ?auto_182070 ?auto_182072 ) ) ( not ( = ?auto_182071 ?auto_182072 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_182072 )
      ( MAKE-6PILE ?auto_182065 ?auto_182066 ?auto_182067 ?auto_182068 ?auto_182069 ?auto_182070 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182190 - BLOCK
      ?auto_182191 - BLOCK
    )
    :vars
    (
      ?auto_182192 - BLOCK
      ?auto_182195 - BLOCK
      ?auto_182197 - BLOCK
      ?auto_182193 - BLOCK
      ?auto_182194 - BLOCK
      ?auto_182196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182190 ?auto_182191 ) ) ( ON ?auto_182191 ?auto_182192 ) ( not ( = ?auto_182190 ?auto_182192 ) ) ( not ( = ?auto_182191 ?auto_182192 ) ) ( ON ?auto_182190 ?auto_182191 ) ( CLEAR ?auto_182190 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_182195 ) ( ON ?auto_182197 ?auto_182195 ) ( ON ?auto_182193 ?auto_182197 ) ( ON ?auto_182194 ?auto_182193 ) ( ON ?auto_182196 ?auto_182194 ) ( ON ?auto_182192 ?auto_182196 ) ( not ( = ?auto_182195 ?auto_182197 ) ) ( not ( = ?auto_182195 ?auto_182193 ) ) ( not ( = ?auto_182195 ?auto_182194 ) ) ( not ( = ?auto_182195 ?auto_182196 ) ) ( not ( = ?auto_182195 ?auto_182192 ) ) ( not ( = ?auto_182195 ?auto_182191 ) ) ( not ( = ?auto_182195 ?auto_182190 ) ) ( not ( = ?auto_182197 ?auto_182193 ) ) ( not ( = ?auto_182197 ?auto_182194 ) ) ( not ( = ?auto_182197 ?auto_182196 ) ) ( not ( = ?auto_182197 ?auto_182192 ) ) ( not ( = ?auto_182197 ?auto_182191 ) ) ( not ( = ?auto_182197 ?auto_182190 ) ) ( not ( = ?auto_182193 ?auto_182194 ) ) ( not ( = ?auto_182193 ?auto_182196 ) ) ( not ( = ?auto_182193 ?auto_182192 ) ) ( not ( = ?auto_182193 ?auto_182191 ) ) ( not ( = ?auto_182193 ?auto_182190 ) ) ( not ( = ?auto_182194 ?auto_182196 ) ) ( not ( = ?auto_182194 ?auto_182192 ) ) ( not ( = ?auto_182194 ?auto_182191 ) ) ( not ( = ?auto_182194 ?auto_182190 ) ) ( not ( = ?auto_182196 ?auto_182192 ) ) ( not ( = ?auto_182196 ?auto_182191 ) ) ( not ( = ?auto_182196 ?auto_182190 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182195 ?auto_182197 ?auto_182193 ?auto_182194 ?auto_182196 ?auto_182192 ?auto_182191 )
      ( MAKE-2PILE ?auto_182190 ?auto_182191 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182200 - BLOCK
      ?auto_182201 - BLOCK
    )
    :vars
    (
      ?auto_182202 - BLOCK
      ?auto_182203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182200 ?auto_182201 ) ) ( ON ?auto_182201 ?auto_182202 ) ( CLEAR ?auto_182201 ) ( not ( = ?auto_182200 ?auto_182202 ) ) ( not ( = ?auto_182201 ?auto_182202 ) ) ( ON ?auto_182200 ?auto_182203 ) ( CLEAR ?auto_182200 ) ( HAND-EMPTY ) ( not ( = ?auto_182200 ?auto_182203 ) ) ( not ( = ?auto_182201 ?auto_182203 ) ) ( not ( = ?auto_182202 ?auto_182203 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_182200 ?auto_182203 )
      ( MAKE-2PILE ?auto_182200 ?auto_182201 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182204 - BLOCK
      ?auto_182205 - BLOCK
    )
    :vars
    (
      ?auto_182206 - BLOCK
      ?auto_182207 - BLOCK
      ?auto_182209 - BLOCK
      ?auto_182211 - BLOCK
      ?auto_182208 - BLOCK
      ?auto_182212 - BLOCK
      ?auto_182210 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182204 ?auto_182205 ) ) ( not ( = ?auto_182204 ?auto_182206 ) ) ( not ( = ?auto_182205 ?auto_182206 ) ) ( ON ?auto_182204 ?auto_182207 ) ( CLEAR ?auto_182204 ) ( not ( = ?auto_182204 ?auto_182207 ) ) ( not ( = ?auto_182205 ?auto_182207 ) ) ( not ( = ?auto_182206 ?auto_182207 ) ) ( HOLDING ?auto_182205 ) ( CLEAR ?auto_182206 ) ( ON-TABLE ?auto_182209 ) ( ON ?auto_182211 ?auto_182209 ) ( ON ?auto_182208 ?auto_182211 ) ( ON ?auto_182212 ?auto_182208 ) ( ON ?auto_182210 ?auto_182212 ) ( ON ?auto_182206 ?auto_182210 ) ( not ( = ?auto_182209 ?auto_182211 ) ) ( not ( = ?auto_182209 ?auto_182208 ) ) ( not ( = ?auto_182209 ?auto_182212 ) ) ( not ( = ?auto_182209 ?auto_182210 ) ) ( not ( = ?auto_182209 ?auto_182206 ) ) ( not ( = ?auto_182209 ?auto_182205 ) ) ( not ( = ?auto_182211 ?auto_182208 ) ) ( not ( = ?auto_182211 ?auto_182212 ) ) ( not ( = ?auto_182211 ?auto_182210 ) ) ( not ( = ?auto_182211 ?auto_182206 ) ) ( not ( = ?auto_182211 ?auto_182205 ) ) ( not ( = ?auto_182208 ?auto_182212 ) ) ( not ( = ?auto_182208 ?auto_182210 ) ) ( not ( = ?auto_182208 ?auto_182206 ) ) ( not ( = ?auto_182208 ?auto_182205 ) ) ( not ( = ?auto_182212 ?auto_182210 ) ) ( not ( = ?auto_182212 ?auto_182206 ) ) ( not ( = ?auto_182212 ?auto_182205 ) ) ( not ( = ?auto_182210 ?auto_182206 ) ) ( not ( = ?auto_182210 ?auto_182205 ) ) ( not ( = ?auto_182204 ?auto_182209 ) ) ( not ( = ?auto_182204 ?auto_182211 ) ) ( not ( = ?auto_182204 ?auto_182208 ) ) ( not ( = ?auto_182204 ?auto_182212 ) ) ( not ( = ?auto_182204 ?auto_182210 ) ) ( not ( = ?auto_182207 ?auto_182209 ) ) ( not ( = ?auto_182207 ?auto_182211 ) ) ( not ( = ?auto_182207 ?auto_182208 ) ) ( not ( = ?auto_182207 ?auto_182212 ) ) ( not ( = ?auto_182207 ?auto_182210 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182209 ?auto_182211 ?auto_182208 ?auto_182212 ?auto_182210 ?auto_182206 ?auto_182205 )
      ( MAKE-2PILE ?auto_182204 ?auto_182205 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182213 - BLOCK
      ?auto_182214 - BLOCK
    )
    :vars
    (
      ?auto_182215 - BLOCK
      ?auto_182217 - BLOCK
      ?auto_182218 - BLOCK
      ?auto_182219 - BLOCK
      ?auto_182221 - BLOCK
      ?auto_182220 - BLOCK
      ?auto_182216 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182213 ?auto_182214 ) ) ( not ( = ?auto_182213 ?auto_182215 ) ) ( not ( = ?auto_182214 ?auto_182215 ) ) ( ON ?auto_182213 ?auto_182217 ) ( not ( = ?auto_182213 ?auto_182217 ) ) ( not ( = ?auto_182214 ?auto_182217 ) ) ( not ( = ?auto_182215 ?auto_182217 ) ) ( CLEAR ?auto_182215 ) ( ON-TABLE ?auto_182218 ) ( ON ?auto_182219 ?auto_182218 ) ( ON ?auto_182221 ?auto_182219 ) ( ON ?auto_182220 ?auto_182221 ) ( ON ?auto_182216 ?auto_182220 ) ( ON ?auto_182215 ?auto_182216 ) ( not ( = ?auto_182218 ?auto_182219 ) ) ( not ( = ?auto_182218 ?auto_182221 ) ) ( not ( = ?auto_182218 ?auto_182220 ) ) ( not ( = ?auto_182218 ?auto_182216 ) ) ( not ( = ?auto_182218 ?auto_182215 ) ) ( not ( = ?auto_182218 ?auto_182214 ) ) ( not ( = ?auto_182219 ?auto_182221 ) ) ( not ( = ?auto_182219 ?auto_182220 ) ) ( not ( = ?auto_182219 ?auto_182216 ) ) ( not ( = ?auto_182219 ?auto_182215 ) ) ( not ( = ?auto_182219 ?auto_182214 ) ) ( not ( = ?auto_182221 ?auto_182220 ) ) ( not ( = ?auto_182221 ?auto_182216 ) ) ( not ( = ?auto_182221 ?auto_182215 ) ) ( not ( = ?auto_182221 ?auto_182214 ) ) ( not ( = ?auto_182220 ?auto_182216 ) ) ( not ( = ?auto_182220 ?auto_182215 ) ) ( not ( = ?auto_182220 ?auto_182214 ) ) ( not ( = ?auto_182216 ?auto_182215 ) ) ( not ( = ?auto_182216 ?auto_182214 ) ) ( not ( = ?auto_182213 ?auto_182218 ) ) ( not ( = ?auto_182213 ?auto_182219 ) ) ( not ( = ?auto_182213 ?auto_182221 ) ) ( not ( = ?auto_182213 ?auto_182220 ) ) ( not ( = ?auto_182213 ?auto_182216 ) ) ( not ( = ?auto_182217 ?auto_182218 ) ) ( not ( = ?auto_182217 ?auto_182219 ) ) ( not ( = ?auto_182217 ?auto_182221 ) ) ( not ( = ?auto_182217 ?auto_182220 ) ) ( not ( = ?auto_182217 ?auto_182216 ) ) ( ON ?auto_182214 ?auto_182213 ) ( CLEAR ?auto_182214 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_182217 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182217 ?auto_182213 )
      ( MAKE-2PILE ?auto_182213 ?auto_182214 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182222 - BLOCK
      ?auto_182223 - BLOCK
    )
    :vars
    (
      ?auto_182230 - BLOCK
      ?auto_182228 - BLOCK
      ?auto_182229 - BLOCK
      ?auto_182224 - BLOCK
      ?auto_182227 - BLOCK
      ?auto_182226 - BLOCK
      ?auto_182225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182222 ?auto_182223 ) ) ( not ( = ?auto_182222 ?auto_182230 ) ) ( not ( = ?auto_182223 ?auto_182230 ) ) ( ON ?auto_182222 ?auto_182228 ) ( not ( = ?auto_182222 ?auto_182228 ) ) ( not ( = ?auto_182223 ?auto_182228 ) ) ( not ( = ?auto_182230 ?auto_182228 ) ) ( ON-TABLE ?auto_182229 ) ( ON ?auto_182224 ?auto_182229 ) ( ON ?auto_182227 ?auto_182224 ) ( ON ?auto_182226 ?auto_182227 ) ( ON ?auto_182225 ?auto_182226 ) ( not ( = ?auto_182229 ?auto_182224 ) ) ( not ( = ?auto_182229 ?auto_182227 ) ) ( not ( = ?auto_182229 ?auto_182226 ) ) ( not ( = ?auto_182229 ?auto_182225 ) ) ( not ( = ?auto_182229 ?auto_182230 ) ) ( not ( = ?auto_182229 ?auto_182223 ) ) ( not ( = ?auto_182224 ?auto_182227 ) ) ( not ( = ?auto_182224 ?auto_182226 ) ) ( not ( = ?auto_182224 ?auto_182225 ) ) ( not ( = ?auto_182224 ?auto_182230 ) ) ( not ( = ?auto_182224 ?auto_182223 ) ) ( not ( = ?auto_182227 ?auto_182226 ) ) ( not ( = ?auto_182227 ?auto_182225 ) ) ( not ( = ?auto_182227 ?auto_182230 ) ) ( not ( = ?auto_182227 ?auto_182223 ) ) ( not ( = ?auto_182226 ?auto_182225 ) ) ( not ( = ?auto_182226 ?auto_182230 ) ) ( not ( = ?auto_182226 ?auto_182223 ) ) ( not ( = ?auto_182225 ?auto_182230 ) ) ( not ( = ?auto_182225 ?auto_182223 ) ) ( not ( = ?auto_182222 ?auto_182229 ) ) ( not ( = ?auto_182222 ?auto_182224 ) ) ( not ( = ?auto_182222 ?auto_182227 ) ) ( not ( = ?auto_182222 ?auto_182226 ) ) ( not ( = ?auto_182222 ?auto_182225 ) ) ( not ( = ?auto_182228 ?auto_182229 ) ) ( not ( = ?auto_182228 ?auto_182224 ) ) ( not ( = ?auto_182228 ?auto_182227 ) ) ( not ( = ?auto_182228 ?auto_182226 ) ) ( not ( = ?auto_182228 ?auto_182225 ) ) ( ON ?auto_182223 ?auto_182222 ) ( CLEAR ?auto_182223 ) ( ON-TABLE ?auto_182228 ) ( HOLDING ?auto_182230 ) ( CLEAR ?auto_182225 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_182229 ?auto_182224 ?auto_182227 ?auto_182226 ?auto_182225 ?auto_182230 )
      ( MAKE-2PILE ?auto_182222 ?auto_182223 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182231 - BLOCK
      ?auto_182232 - BLOCK
    )
    :vars
    (
      ?auto_182233 - BLOCK
      ?auto_182237 - BLOCK
      ?auto_182235 - BLOCK
      ?auto_182236 - BLOCK
      ?auto_182238 - BLOCK
      ?auto_182239 - BLOCK
      ?auto_182234 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182231 ?auto_182232 ) ) ( not ( = ?auto_182231 ?auto_182233 ) ) ( not ( = ?auto_182232 ?auto_182233 ) ) ( ON ?auto_182231 ?auto_182237 ) ( not ( = ?auto_182231 ?auto_182237 ) ) ( not ( = ?auto_182232 ?auto_182237 ) ) ( not ( = ?auto_182233 ?auto_182237 ) ) ( ON-TABLE ?auto_182235 ) ( ON ?auto_182236 ?auto_182235 ) ( ON ?auto_182238 ?auto_182236 ) ( ON ?auto_182239 ?auto_182238 ) ( ON ?auto_182234 ?auto_182239 ) ( not ( = ?auto_182235 ?auto_182236 ) ) ( not ( = ?auto_182235 ?auto_182238 ) ) ( not ( = ?auto_182235 ?auto_182239 ) ) ( not ( = ?auto_182235 ?auto_182234 ) ) ( not ( = ?auto_182235 ?auto_182233 ) ) ( not ( = ?auto_182235 ?auto_182232 ) ) ( not ( = ?auto_182236 ?auto_182238 ) ) ( not ( = ?auto_182236 ?auto_182239 ) ) ( not ( = ?auto_182236 ?auto_182234 ) ) ( not ( = ?auto_182236 ?auto_182233 ) ) ( not ( = ?auto_182236 ?auto_182232 ) ) ( not ( = ?auto_182238 ?auto_182239 ) ) ( not ( = ?auto_182238 ?auto_182234 ) ) ( not ( = ?auto_182238 ?auto_182233 ) ) ( not ( = ?auto_182238 ?auto_182232 ) ) ( not ( = ?auto_182239 ?auto_182234 ) ) ( not ( = ?auto_182239 ?auto_182233 ) ) ( not ( = ?auto_182239 ?auto_182232 ) ) ( not ( = ?auto_182234 ?auto_182233 ) ) ( not ( = ?auto_182234 ?auto_182232 ) ) ( not ( = ?auto_182231 ?auto_182235 ) ) ( not ( = ?auto_182231 ?auto_182236 ) ) ( not ( = ?auto_182231 ?auto_182238 ) ) ( not ( = ?auto_182231 ?auto_182239 ) ) ( not ( = ?auto_182231 ?auto_182234 ) ) ( not ( = ?auto_182237 ?auto_182235 ) ) ( not ( = ?auto_182237 ?auto_182236 ) ) ( not ( = ?auto_182237 ?auto_182238 ) ) ( not ( = ?auto_182237 ?auto_182239 ) ) ( not ( = ?auto_182237 ?auto_182234 ) ) ( ON ?auto_182232 ?auto_182231 ) ( ON-TABLE ?auto_182237 ) ( CLEAR ?auto_182234 ) ( ON ?auto_182233 ?auto_182232 ) ( CLEAR ?auto_182233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182237 ?auto_182231 ?auto_182232 )
      ( MAKE-2PILE ?auto_182231 ?auto_182232 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182240 - BLOCK
      ?auto_182241 - BLOCK
    )
    :vars
    (
      ?auto_182248 - BLOCK
      ?auto_182244 - BLOCK
      ?auto_182247 - BLOCK
      ?auto_182245 - BLOCK
      ?auto_182243 - BLOCK
      ?auto_182242 - BLOCK
      ?auto_182246 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182240 ?auto_182241 ) ) ( not ( = ?auto_182240 ?auto_182248 ) ) ( not ( = ?auto_182241 ?auto_182248 ) ) ( ON ?auto_182240 ?auto_182244 ) ( not ( = ?auto_182240 ?auto_182244 ) ) ( not ( = ?auto_182241 ?auto_182244 ) ) ( not ( = ?auto_182248 ?auto_182244 ) ) ( ON-TABLE ?auto_182247 ) ( ON ?auto_182245 ?auto_182247 ) ( ON ?auto_182243 ?auto_182245 ) ( ON ?auto_182242 ?auto_182243 ) ( not ( = ?auto_182247 ?auto_182245 ) ) ( not ( = ?auto_182247 ?auto_182243 ) ) ( not ( = ?auto_182247 ?auto_182242 ) ) ( not ( = ?auto_182247 ?auto_182246 ) ) ( not ( = ?auto_182247 ?auto_182248 ) ) ( not ( = ?auto_182247 ?auto_182241 ) ) ( not ( = ?auto_182245 ?auto_182243 ) ) ( not ( = ?auto_182245 ?auto_182242 ) ) ( not ( = ?auto_182245 ?auto_182246 ) ) ( not ( = ?auto_182245 ?auto_182248 ) ) ( not ( = ?auto_182245 ?auto_182241 ) ) ( not ( = ?auto_182243 ?auto_182242 ) ) ( not ( = ?auto_182243 ?auto_182246 ) ) ( not ( = ?auto_182243 ?auto_182248 ) ) ( not ( = ?auto_182243 ?auto_182241 ) ) ( not ( = ?auto_182242 ?auto_182246 ) ) ( not ( = ?auto_182242 ?auto_182248 ) ) ( not ( = ?auto_182242 ?auto_182241 ) ) ( not ( = ?auto_182246 ?auto_182248 ) ) ( not ( = ?auto_182246 ?auto_182241 ) ) ( not ( = ?auto_182240 ?auto_182247 ) ) ( not ( = ?auto_182240 ?auto_182245 ) ) ( not ( = ?auto_182240 ?auto_182243 ) ) ( not ( = ?auto_182240 ?auto_182242 ) ) ( not ( = ?auto_182240 ?auto_182246 ) ) ( not ( = ?auto_182244 ?auto_182247 ) ) ( not ( = ?auto_182244 ?auto_182245 ) ) ( not ( = ?auto_182244 ?auto_182243 ) ) ( not ( = ?auto_182244 ?auto_182242 ) ) ( not ( = ?auto_182244 ?auto_182246 ) ) ( ON ?auto_182241 ?auto_182240 ) ( ON-TABLE ?auto_182244 ) ( ON ?auto_182248 ?auto_182241 ) ( CLEAR ?auto_182248 ) ( HOLDING ?auto_182246 ) ( CLEAR ?auto_182242 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182247 ?auto_182245 ?auto_182243 ?auto_182242 ?auto_182246 )
      ( MAKE-2PILE ?auto_182240 ?auto_182241 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182249 - BLOCK
      ?auto_182250 - BLOCK
    )
    :vars
    (
      ?auto_182255 - BLOCK
      ?auto_182253 - BLOCK
      ?auto_182257 - BLOCK
      ?auto_182252 - BLOCK
      ?auto_182256 - BLOCK
      ?auto_182251 - BLOCK
      ?auto_182254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182249 ?auto_182250 ) ) ( not ( = ?auto_182249 ?auto_182255 ) ) ( not ( = ?auto_182250 ?auto_182255 ) ) ( ON ?auto_182249 ?auto_182253 ) ( not ( = ?auto_182249 ?auto_182253 ) ) ( not ( = ?auto_182250 ?auto_182253 ) ) ( not ( = ?auto_182255 ?auto_182253 ) ) ( ON-TABLE ?auto_182257 ) ( ON ?auto_182252 ?auto_182257 ) ( ON ?auto_182256 ?auto_182252 ) ( ON ?auto_182251 ?auto_182256 ) ( not ( = ?auto_182257 ?auto_182252 ) ) ( not ( = ?auto_182257 ?auto_182256 ) ) ( not ( = ?auto_182257 ?auto_182251 ) ) ( not ( = ?auto_182257 ?auto_182254 ) ) ( not ( = ?auto_182257 ?auto_182255 ) ) ( not ( = ?auto_182257 ?auto_182250 ) ) ( not ( = ?auto_182252 ?auto_182256 ) ) ( not ( = ?auto_182252 ?auto_182251 ) ) ( not ( = ?auto_182252 ?auto_182254 ) ) ( not ( = ?auto_182252 ?auto_182255 ) ) ( not ( = ?auto_182252 ?auto_182250 ) ) ( not ( = ?auto_182256 ?auto_182251 ) ) ( not ( = ?auto_182256 ?auto_182254 ) ) ( not ( = ?auto_182256 ?auto_182255 ) ) ( not ( = ?auto_182256 ?auto_182250 ) ) ( not ( = ?auto_182251 ?auto_182254 ) ) ( not ( = ?auto_182251 ?auto_182255 ) ) ( not ( = ?auto_182251 ?auto_182250 ) ) ( not ( = ?auto_182254 ?auto_182255 ) ) ( not ( = ?auto_182254 ?auto_182250 ) ) ( not ( = ?auto_182249 ?auto_182257 ) ) ( not ( = ?auto_182249 ?auto_182252 ) ) ( not ( = ?auto_182249 ?auto_182256 ) ) ( not ( = ?auto_182249 ?auto_182251 ) ) ( not ( = ?auto_182249 ?auto_182254 ) ) ( not ( = ?auto_182253 ?auto_182257 ) ) ( not ( = ?auto_182253 ?auto_182252 ) ) ( not ( = ?auto_182253 ?auto_182256 ) ) ( not ( = ?auto_182253 ?auto_182251 ) ) ( not ( = ?auto_182253 ?auto_182254 ) ) ( ON ?auto_182250 ?auto_182249 ) ( ON-TABLE ?auto_182253 ) ( ON ?auto_182255 ?auto_182250 ) ( CLEAR ?auto_182251 ) ( ON ?auto_182254 ?auto_182255 ) ( CLEAR ?auto_182254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182253 ?auto_182249 ?auto_182250 ?auto_182255 )
      ( MAKE-2PILE ?auto_182249 ?auto_182250 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182258 - BLOCK
      ?auto_182259 - BLOCK
    )
    :vars
    (
      ?auto_182264 - BLOCK
      ?auto_182265 - BLOCK
      ?auto_182260 - BLOCK
      ?auto_182262 - BLOCK
      ?auto_182266 - BLOCK
      ?auto_182263 - BLOCK
      ?auto_182261 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182258 ?auto_182259 ) ) ( not ( = ?auto_182258 ?auto_182264 ) ) ( not ( = ?auto_182259 ?auto_182264 ) ) ( ON ?auto_182258 ?auto_182265 ) ( not ( = ?auto_182258 ?auto_182265 ) ) ( not ( = ?auto_182259 ?auto_182265 ) ) ( not ( = ?auto_182264 ?auto_182265 ) ) ( ON-TABLE ?auto_182260 ) ( ON ?auto_182262 ?auto_182260 ) ( ON ?auto_182266 ?auto_182262 ) ( not ( = ?auto_182260 ?auto_182262 ) ) ( not ( = ?auto_182260 ?auto_182266 ) ) ( not ( = ?auto_182260 ?auto_182263 ) ) ( not ( = ?auto_182260 ?auto_182261 ) ) ( not ( = ?auto_182260 ?auto_182264 ) ) ( not ( = ?auto_182260 ?auto_182259 ) ) ( not ( = ?auto_182262 ?auto_182266 ) ) ( not ( = ?auto_182262 ?auto_182263 ) ) ( not ( = ?auto_182262 ?auto_182261 ) ) ( not ( = ?auto_182262 ?auto_182264 ) ) ( not ( = ?auto_182262 ?auto_182259 ) ) ( not ( = ?auto_182266 ?auto_182263 ) ) ( not ( = ?auto_182266 ?auto_182261 ) ) ( not ( = ?auto_182266 ?auto_182264 ) ) ( not ( = ?auto_182266 ?auto_182259 ) ) ( not ( = ?auto_182263 ?auto_182261 ) ) ( not ( = ?auto_182263 ?auto_182264 ) ) ( not ( = ?auto_182263 ?auto_182259 ) ) ( not ( = ?auto_182261 ?auto_182264 ) ) ( not ( = ?auto_182261 ?auto_182259 ) ) ( not ( = ?auto_182258 ?auto_182260 ) ) ( not ( = ?auto_182258 ?auto_182262 ) ) ( not ( = ?auto_182258 ?auto_182266 ) ) ( not ( = ?auto_182258 ?auto_182263 ) ) ( not ( = ?auto_182258 ?auto_182261 ) ) ( not ( = ?auto_182265 ?auto_182260 ) ) ( not ( = ?auto_182265 ?auto_182262 ) ) ( not ( = ?auto_182265 ?auto_182266 ) ) ( not ( = ?auto_182265 ?auto_182263 ) ) ( not ( = ?auto_182265 ?auto_182261 ) ) ( ON ?auto_182259 ?auto_182258 ) ( ON-TABLE ?auto_182265 ) ( ON ?auto_182264 ?auto_182259 ) ( ON ?auto_182261 ?auto_182264 ) ( CLEAR ?auto_182261 ) ( HOLDING ?auto_182263 ) ( CLEAR ?auto_182266 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182260 ?auto_182262 ?auto_182266 ?auto_182263 )
      ( MAKE-2PILE ?auto_182258 ?auto_182259 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182267 - BLOCK
      ?auto_182268 - BLOCK
    )
    :vars
    (
      ?auto_182271 - BLOCK
      ?auto_182274 - BLOCK
      ?auto_182275 - BLOCK
      ?auto_182272 - BLOCK
      ?auto_182269 - BLOCK
      ?auto_182270 - BLOCK
      ?auto_182273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182267 ?auto_182268 ) ) ( not ( = ?auto_182267 ?auto_182271 ) ) ( not ( = ?auto_182268 ?auto_182271 ) ) ( ON ?auto_182267 ?auto_182274 ) ( not ( = ?auto_182267 ?auto_182274 ) ) ( not ( = ?auto_182268 ?auto_182274 ) ) ( not ( = ?auto_182271 ?auto_182274 ) ) ( ON-TABLE ?auto_182275 ) ( ON ?auto_182272 ?auto_182275 ) ( ON ?auto_182269 ?auto_182272 ) ( not ( = ?auto_182275 ?auto_182272 ) ) ( not ( = ?auto_182275 ?auto_182269 ) ) ( not ( = ?auto_182275 ?auto_182270 ) ) ( not ( = ?auto_182275 ?auto_182273 ) ) ( not ( = ?auto_182275 ?auto_182271 ) ) ( not ( = ?auto_182275 ?auto_182268 ) ) ( not ( = ?auto_182272 ?auto_182269 ) ) ( not ( = ?auto_182272 ?auto_182270 ) ) ( not ( = ?auto_182272 ?auto_182273 ) ) ( not ( = ?auto_182272 ?auto_182271 ) ) ( not ( = ?auto_182272 ?auto_182268 ) ) ( not ( = ?auto_182269 ?auto_182270 ) ) ( not ( = ?auto_182269 ?auto_182273 ) ) ( not ( = ?auto_182269 ?auto_182271 ) ) ( not ( = ?auto_182269 ?auto_182268 ) ) ( not ( = ?auto_182270 ?auto_182273 ) ) ( not ( = ?auto_182270 ?auto_182271 ) ) ( not ( = ?auto_182270 ?auto_182268 ) ) ( not ( = ?auto_182273 ?auto_182271 ) ) ( not ( = ?auto_182273 ?auto_182268 ) ) ( not ( = ?auto_182267 ?auto_182275 ) ) ( not ( = ?auto_182267 ?auto_182272 ) ) ( not ( = ?auto_182267 ?auto_182269 ) ) ( not ( = ?auto_182267 ?auto_182270 ) ) ( not ( = ?auto_182267 ?auto_182273 ) ) ( not ( = ?auto_182274 ?auto_182275 ) ) ( not ( = ?auto_182274 ?auto_182272 ) ) ( not ( = ?auto_182274 ?auto_182269 ) ) ( not ( = ?auto_182274 ?auto_182270 ) ) ( not ( = ?auto_182274 ?auto_182273 ) ) ( ON ?auto_182268 ?auto_182267 ) ( ON-TABLE ?auto_182274 ) ( ON ?auto_182271 ?auto_182268 ) ( ON ?auto_182273 ?auto_182271 ) ( CLEAR ?auto_182269 ) ( ON ?auto_182270 ?auto_182273 ) ( CLEAR ?auto_182270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182274 ?auto_182267 ?auto_182268 ?auto_182271 ?auto_182273 )
      ( MAKE-2PILE ?auto_182267 ?auto_182268 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182276 - BLOCK
      ?auto_182277 - BLOCK
    )
    :vars
    (
      ?auto_182282 - BLOCK
      ?auto_182279 - BLOCK
      ?auto_182283 - BLOCK
      ?auto_182278 - BLOCK
      ?auto_182280 - BLOCK
      ?auto_182284 - BLOCK
      ?auto_182281 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182276 ?auto_182277 ) ) ( not ( = ?auto_182276 ?auto_182282 ) ) ( not ( = ?auto_182277 ?auto_182282 ) ) ( ON ?auto_182276 ?auto_182279 ) ( not ( = ?auto_182276 ?auto_182279 ) ) ( not ( = ?auto_182277 ?auto_182279 ) ) ( not ( = ?auto_182282 ?auto_182279 ) ) ( ON-TABLE ?auto_182283 ) ( ON ?auto_182278 ?auto_182283 ) ( not ( = ?auto_182283 ?auto_182278 ) ) ( not ( = ?auto_182283 ?auto_182280 ) ) ( not ( = ?auto_182283 ?auto_182284 ) ) ( not ( = ?auto_182283 ?auto_182281 ) ) ( not ( = ?auto_182283 ?auto_182282 ) ) ( not ( = ?auto_182283 ?auto_182277 ) ) ( not ( = ?auto_182278 ?auto_182280 ) ) ( not ( = ?auto_182278 ?auto_182284 ) ) ( not ( = ?auto_182278 ?auto_182281 ) ) ( not ( = ?auto_182278 ?auto_182282 ) ) ( not ( = ?auto_182278 ?auto_182277 ) ) ( not ( = ?auto_182280 ?auto_182284 ) ) ( not ( = ?auto_182280 ?auto_182281 ) ) ( not ( = ?auto_182280 ?auto_182282 ) ) ( not ( = ?auto_182280 ?auto_182277 ) ) ( not ( = ?auto_182284 ?auto_182281 ) ) ( not ( = ?auto_182284 ?auto_182282 ) ) ( not ( = ?auto_182284 ?auto_182277 ) ) ( not ( = ?auto_182281 ?auto_182282 ) ) ( not ( = ?auto_182281 ?auto_182277 ) ) ( not ( = ?auto_182276 ?auto_182283 ) ) ( not ( = ?auto_182276 ?auto_182278 ) ) ( not ( = ?auto_182276 ?auto_182280 ) ) ( not ( = ?auto_182276 ?auto_182284 ) ) ( not ( = ?auto_182276 ?auto_182281 ) ) ( not ( = ?auto_182279 ?auto_182283 ) ) ( not ( = ?auto_182279 ?auto_182278 ) ) ( not ( = ?auto_182279 ?auto_182280 ) ) ( not ( = ?auto_182279 ?auto_182284 ) ) ( not ( = ?auto_182279 ?auto_182281 ) ) ( ON ?auto_182277 ?auto_182276 ) ( ON-TABLE ?auto_182279 ) ( ON ?auto_182282 ?auto_182277 ) ( ON ?auto_182281 ?auto_182282 ) ( ON ?auto_182284 ?auto_182281 ) ( CLEAR ?auto_182284 ) ( HOLDING ?auto_182280 ) ( CLEAR ?auto_182278 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182283 ?auto_182278 ?auto_182280 )
      ( MAKE-2PILE ?auto_182276 ?auto_182277 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182285 - BLOCK
      ?auto_182286 - BLOCK
    )
    :vars
    (
      ?auto_182290 - BLOCK
      ?auto_182293 - BLOCK
      ?auto_182288 - BLOCK
      ?auto_182287 - BLOCK
      ?auto_182291 - BLOCK
      ?auto_182289 - BLOCK
      ?auto_182292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182285 ?auto_182286 ) ) ( not ( = ?auto_182285 ?auto_182290 ) ) ( not ( = ?auto_182286 ?auto_182290 ) ) ( ON ?auto_182285 ?auto_182293 ) ( not ( = ?auto_182285 ?auto_182293 ) ) ( not ( = ?auto_182286 ?auto_182293 ) ) ( not ( = ?auto_182290 ?auto_182293 ) ) ( ON-TABLE ?auto_182288 ) ( ON ?auto_182287 ?auto_182288 ) ( not ( = ?auto_182288 ?auto_182287 ) ) ( not ( = ?auto_182288 ?auto_182291 ) ) ( not ( = ?auto_182288 ?auto_182289 ) ) ( not ( = ?auto_182288 ?auto_182292 ) ) ( not ( = ?auto_182288 ?auto_182290 ) ) ( not ( = ?auto_182288 ?auto_182286 ) ) ( not ( = ?auto_182287 ?auto_182291 ) ) ( not ( = ?auto_182287 ?auto_182289 ) ) ( not ( = ?auto_182287 ?auto_182292 ) ) ( not ( = ?auto_182287 ?auto_182290 ) ) ( not ( = ?auto_182287 ?auto_182286 ) ) ( not ( = ?auto_182291 ?auto_182289 ) ) ( not ( = ?auto_182291 ?auto_182292 ) ) ( not ( = ?auto_182291 ?auto_182290 ) ) ( not ( = ?auto_182291 ?auto_182286 ) ) ( not ( = ?auto_182289 ?auto_182292 ) ) ( not ( = ?auto_182289 ?auto_182290 ) ) ( not ( = ?auto_182289 ?auto_182286 ) ) ( not ( = ?auto_182292 ?auto_182290 ) ) ( not ( = ?auto_182292 ?auto_182286 ) ) ( not ( = ?auto_182285 ?auto_182288 ) ) ( not ( = ?auto_182285 ?auto_182287 ) ) ( not ( = ?auto_182285 ?auto_182291 ) ) ( not ( = ?auto_182285 ?auto_182289 ) ) ( not ( = ?auto_182285 ?auto_182292 ) ) ( not ( = ?auto_182293 ?auto_182288 ) ) ( not ( = ?auto_182293 ?auto_182287 ) ) ( not ( = ?auto_182293 ?auto_182291 ) ) ( not ( = ?auto_182293 ?auto_182289 ) ) ( not ( = ?auto_182293 ?auto_182292 ) ) ( ON ?auto_182286 ?auto_182285 ) ( ON-TABLE ?auto_182293 ) ( ON ?auto_182290 ?auto_182286 ) ( ON ?auto_182292 ?auto_182290 ) ( ON ?auto_182289 ?auto_182292 ) ( CLEAR ?auto_182287 ) ( ON ?auto_182291 ?auto_182289 ) ( CLEAR ?auto_182291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_182293 ?auto_182285 ?auto_182286 ?auto_182290 ?auto_182292 ?auto_182289 )
      ( MAKE-2PILE ?auto_182285 ?auto_182286 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182294 - BLOCK
      ?auto_182295 - BLOCK
    )
    :vars
    (
      ?auto_182296 - BLOCK
      ?auto_182301 - BLOCK
      ?auto_182299 - BLOCK
      ?auto_182300 - BLOCK
      ?auto_182297 - BLOCK
      ?auto_182302 - BLOCK
      ?auto_182298 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182294 ?auto_182295 ) ) ( not ( = ?auto_182294 ?auto_182296 ) ) ( not ( = ?auto_182295 ?auto_182296 ) ) ( ON ?auto_182294 ?auto_182301 ) ( not ( = ?auto_182294 ?auto_182301 ) ) ( not ( = ?auto_182295 ?auto_182301 ) ) ( not ( = ?auto_182296 ?auto_182301 ) ) ( ON-TABLE ?auto_182299 ) ( not ( = ?auto_182299 ?auto_182300 ) ) ( not ( = ?auto_182299 ?auto_182297 ) ) ( not ( = ?auto_182299 ?auto_182302 ) ) ( not ( = ?auto_182299 ?auto_182298 ) ) ( not ( = ?auto_182299 ?auto_182296 ) ) ( not ( = ?auto_182299 ?auto_182295 ) ) ( not ( = ?auto_182300 ?auto_182297 ) ) ( not ( = ?auto_182300 ?auto_182302 ) ) ( not ( = ?auto_182300 ?auto_182298 ) ) ( not ( = ?auto_182300 ?auto_182296 ) ) ( not ( = ?auto_182300 ?auto_182295 ) ) ( not ( = ?auto_182297 ?auto_182302 ) ) ( not ( = ?auto_182297 ?auto_182298 ) ) ( not ( = ?auto_182297 ?auto_182296 ) ) ( not ( = ?auto_182297 ?auto_182295 ) ) ( not ( = ?auto_182302 ?auto_182298 ) ) ( not ( = ?auto_182302 ?auto_182296 ) ) ( not ( = ?auto_182302 ?auto_182295 ) ) ( not ( = ?auto_182298 ?auto_182296 ) ) ( not ( = ?auto_182298 ?auto_182295 ) ) ( not ( = ?auto_182294 ?auto_182299 ) ) ( not ( = ?auto_182294 ?auto_182300 ) ) ( not ( = ?auto_182294 ?auto_182297 ) ) ( not ( = ?auto_182294 ?auto_182302 ) ) ( not ( = ?auto_182294 ?auto_182298 ) ) ( not ( = ?auto_182301 ?auto_182299 ) ) ( not ( = ?auto_182301 ?auto_182300 ) ) ( not ( = ?auto_182301 ?auto_182297 ) ) ( not ( = ?auto_182301 ?auto_182302 ) ) ( not ( = ?auto_182301 ?auto_182298 ) ) ( ON ?auto_182295 ?auto_182294 ) ( ON-TABLE ?auto_182301 ) ( ON ?auto_182296 ?auto_182295 ) ( ON ?auto_182298 ?auto_182296 ) ( ON ?auto_182302 ?auto_182298 ) ( ON ?auto_182297 ?auto_182302 ) ( CLEAR ?auto_182297 ) ( HOLDING ?auto_182300 ) ( CLEAR ?auto_182299 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182299 ?auto_182300 )
      ( MAKE-2PILE ?auto_182294 ?auto_182295 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182303 - BLOCK
      ?auto_182304 - BLOCK
    )
    :vars
    (
      ?auto_182309 - BLOCK
      ?auto_182306 - BLOCK
      ?auto_182307 - BLOCK
      ?auto_182311 - BLOCK
      ?auto_182310 - BLOCK
      ?auto_182308 - BLOCK
      ?auto_182305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182303 ?auto_182304 ) ) ( not ( = ?auto_182303 ?auto_182309 ) ) ( not ( = ?auto_182304 ?auto_182309 ) ) ( ON ?auto_182303 ?auto_182306 ) ( not ( = ?auto_182303 ?auto_182306 ) ) ( not ( = ?auto_182304 ?auto_182306 ) ) ( not ( = ?auto_182309 ?auto_182306 ) ) ( ON-TABLE ?auto_182307 ) ( not ( = ?auto_182307 ?auto_182311 ) ) ( not ( = ?auto_182307 ?auto_182310 ) ) ( not ( = ?auto_182307 ?auto_182308 ) ) ( not ( = ?auto_182307 ?auto_182305 ) ) ( not ( = ?auto_182307 ?auto_182309 ) ) ( not ( = ?auto_182307 ?auto_182304 ) ) ( not ( = ?auto_182311 ?auto_182310 ) ) ( not ( = ?auto_182311 ?auto_182308 ) ) ( not ( = ?auto_182311 ?auto_182305 ) ) ( not ( = ?auto_182311 ?auto_182309 ) ) ( not ( = ?auto_182311 ?auto_182304 ) ) ( not ( = ?auto_182310 ?auto_182308 ) ) ( not ( = ?auto_182310 ?auto_182305 ) ) ( not ( = ?auto_182310 ?auto_182309 ) ) ( not ( = ?auto_182310 ?auto_182304 ) ) ( not ( = ?auto_182308 ?auto_182305 ) ) ( not ( = ?auto_182308 ?auto_182309 ) ) ( not ( = ?auto_182308 ?auto_182304 ) ) ( not ( = ?auto_182305 ?auto_182309 ) ) ( not ( = ?auto_182305 ?auto_182304 ) ) ( not ( = ?auto_182303 ?auto_182307 ) ) ( not ( = ?auto_182303 ?auto_182311 ) ) ( not ( = ?auto_182303 ?auto_182310 ) ) ( not ( = ?auto_182303 ?auto_182308 ) ) ( not ( = ?auto_182303 ?auto_182305 ) ) ( not ( = ?auto_182306 ?auto_182307 ) ) ( not ( = ?auto_182306 ?auto_182311 ) ) ( not ( = ?auto_182306 ?auto_182310 ) ) ( not ( = ?auto_182306 ?auto_182308 ) ) ( not ( = ?auto_182306 ?auto_182305 ) ) ( ON ?auto_182304 ?auto_182303 ) ( ON-TABLE ?auto_182306 ) ( ON ?auto_182309 ?auto_182304 ) ( ON ?auto_182305 ?auto_182309 ) ( ON ?auto_182308 ?auto_182305 ) ( ON ?auto_182310 ?auto_182308 ) ( CLEAR ?auto_182307 ) ( ON ?auto_182311 ?auto_182310 ) ( CLEAR ?auto_182311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182306 ?auto_182303 ?auto_182304 ?auto_182309 ?auto_182305 ?auto_182308 ?auto_182310 )
      ( MAKE-2PILE ?auto_182303 ?auto_182304 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182312 - BLOCK
      ?auto_182313 - BLOCK
    )
    :vars
    (
      ?auto_182318 - BLOCK
      ?auto_182316 - BLOCK
      ?auto_182314 - BLOCK
      ?auto_182319 - BLOCK
      ?auto_182320 - BLOCK
      ?auto_182317 - BLOCK
      ?auto_182315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182312 ?auto_182313 ) ) ( not ( = ?auto_182312 ?auto_182318 ) ) ( not ( = ?auto_182313 ?auto_182318 ) ) ( ON ?auto_182312 ?auto_182316 ) ( not ( = ?auto_182312 ?auto_182316 ) ) ( not ( = ?auto_182313 ?auto_182316 ) ) ( not ( = ?auto_182318 ?auto_182316 ) ) ( not ( = ?auto_182314 ?auto_182319 ) ) ( not ( = ?auto_182314 ?auto_182320 ) ) ( not ( = ?auto_182314 ?auto_182317 ) ) ( not ( = ?auto_182314 ?auto_182315 ) ) ( not ( = ?auto_182314 ?auto_182318 ) ) ( not ( = ?auto_182314 ?auto_182313 ) ) ( not ( = ?auto_182319 ?auto_182320 ) ) ( not ( = ?auto_182319 ?auto_182317 ) ) ( not ( = ?auto_182319 ?auto_182315 ) ) ( not ( = ?auto_182319 ?auto_182318 ) ) ( not ( = ?auto_182319 ?auto_182313 ) ) ( not ( = ?auto_182320 ?auto_182317 ) ) ( not ( = ?auto_182320 ?auto_182315 ) ) ( not ( = ?auto_182320 ?auto_182318 ) ) ( not ( = ?auto_182320 ?auto_182313 ) ) ( not ( = ?auto_182317 ?auto_182315 ) ) ( not ( = ?auto_182317 ?auto_182318 ) ) ( not ( = ?auto_182317 ?auto_182313 ) ) ( not ( = ?auto_182315 ?auto_182318 ) ) ( not ( = ?auto_182315 ?auto_182313 ) ) ( not ( = ?auto_182312 ?auto_182314 ) ) ( not ( = ?auto_182312 ?auto_182319 ) ) ( not ( = ?auto_182312 ?auto_182320 ) ) ( not ( = ?auto_182312 ?auto_182317 ) ) ( not ( = ?auto_182312 ?auto_182315 ) ) ( not ( = ?auto_182316 ?auto_182314 ) ) ( not ( = ?auto_182316 ?auto_182319 ) ) ( not ( = ?auto_182316 ?auto_182320 ) ) ( not ( = ?auto_182316 ?auto_182317 ) ) ( not ( = ?auto_182316 ?auto_182315 ) ) ( ON ?auto_182313 ?auto_182312 ) ( ON-TABLE ?auto_182316 ) ( ON ?auto_182318 ?auto_182313 ) ( ON ?auto_182315 ?auto_182318 ) ( ON ?auto_182317 ?auto_182315 ) ( ON ?auto_182320 ?auto_182317 ) ( ON ?auto_182319 ?auto_182320 ) ( CLEAR ?auto_182319 ) ( HOLDING ?auto_182314 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_182314 )
      ( MAKE-2PILE ?auto_182312 ?auto_182313 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182321 - BLOCK
      ?auto_182322 - BLOCK
    )
    :vars
    (
      ?auto_182328 - BLOCK
      ?auto_182326 - BLOCK
      ?auto_182329 - BLOCK
      ?auto_182327 - BLOCK
      ?auto_182323 - BLOCK
      ?auto_182325 - BLOCK
      ?auto_182324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182321 ?auto_182322 ) ) ( not ( = ?auto_182321 ?auto_182328 ) ) ( not ( = ?auto_182322 ?auto_182328 ) ) ( ON ?auto_182321 ?auto_182326 ) ( not ( = ?auto_182321 ?auto_182326 ) ) ( not ( = ?auto_182322 ?auto_182326 ) ) ( not ( = ?auto_182328 ?auto_182326 ) ) ( not ( = ?auto_182329 ?auto_182327 ) ) ( not ( = ?auto_182329 ?auto_182323 ) ) ( not ( = ?auto_182329 ?auto_182325 ) ) ( not ( = ?auto_182329 ?auto_182324 ) ) ( not ( = ?auto_182329 ?auto_182328 ) ) ( not ( = ?auto_182329 ?auto_182322 ) ) ( not ( = ?auto_182327 ?auto_182323 ) ) ( not ( = ?auto_182327 ?auto_182325 ) ) ( not ( = ?auto_182327 ?auto_182324 ) ) ( not ( = ?auto_182327 ?auto_182328 ) ) ( not ( = ?auto_182327 ?auto_182322 ) ) ( not ( = ?auto_182323 ?auto_182325 ) ) ( not ( = ?auto_182323 ?auto_182324 ) ) ( not ( = ?auto_182323 ?auto_182328 ) ) ( not ( = ?auto_182323 ?auto_182322 ) ) ( not ( = ?auto_182325 ?auto_182324 ) ) ( not ( = ?auto_182325 ?auto_182328 ) ) ( not ( = ?auto_182325 ?auto_182322 ) ) ( not ( = ?auto_182324 ?auto_182328 ) ) ( not ( = ?auto_182324 ?auto_182322 ) ) ( not ( = ?auto_182321 ?auto_182329 ) ) ( not ( = ?auto_182321 ?auto_182327 ) ) ( not ( = ?auto_182321 ?auto_182323 ) ) ( not ( = ?auto_182321 ?auto_182325 ) ) ( not ( = ?auto_182321 ?auto_182324 ) ) ( not ( = ?auto_182326 ?auto_182329 ) ) ( not ( = ?auto_182326 ?auto_182327 ) ) ( not ( = ?auto_182326 ?auto_182323 ) ) ( not ( = ?auto_182326 ?auto_182325 ) ) ( not ( = ?auto_182326 ?auto_182324 ) ) ( ON ?auto_182322 ?auto_182321 ) ( ON-TABLE ?auto_182326 ) ( ON ?auto_182328 ?auto_182322 ) ( ON ?auto_182324 ?auto_182328 ) ( ON ?auto_182325 ?auto_182324 ) ( ON ?auto_182323 ?auto_182325 ) ( ON ?auto_182327 ?auto_182323 ) ( ON ?auto_182329 ?auto_182327 ) ( CLEAR ?auto_182329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_182326 ?auto_182321 ?auto_182322 ?auto_182328 ?auto_182324 ?auto_182325 ?auto_182323 ?auto_182327 )
      ( MAKE-2PILE ?auto_182321 ?auto_182322 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_182357 - BLOCK
      ?auto_182358 - BLOCK
      ?auto_182359 - BLOCK
      ?auto_182360 - BLOCK
      ?auto_182361 - BLOCK
    )
    :vars
    (
      ?auto_182364 - BLOCK
      ?auto_182363 - BLOCK
      ?auto_182362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182364 ?auto_182361 ) ( ON-TABLE ?auto_182357 ) ( ON ?auto_182358 ?auto_182357 ) ( ON ?auto_182359 ?auto_182358 ) ( ON ?auto_182360 ?auto_182359 ) ( ON ?auto_182361 ?auto_182360 ) ( not ( = ?auto_182357 ?auto_182358 ) ) ( not ( = ?auto_182357 ?auto_182359 ) ) ( not ( = ?auto_182357 ?auto_182360 ) ) ( not ( = ?auto_182357 ?auto_182361 ) ) ( not ( = ?auto_182357 ?auto_182364 ) ) ( not ( = ?auto_182358 ?auto_182359 ) ) ( not ( = ?auto_182358 ?auto_182360 ) ) ( not ( = ?auto_182358 ?auto_182361 ) ) ( not ( = ?auto_182358 ?auto_182364 ) ) ( not ( = ?auto_182359 ?auto_182360 ) ) ( not ( = ?auto_182359 ?auto_182361 ) ) ( not ( = ?auto_182359 ?auto_182364 ) ) ( not ( = ?auto_182360 ?auto_182361 ) ) ( not ( = ?auto_182360 ?auto_182364 ) ) ( not ( = ?auto_182361 ?auto_182364 ) ) ( not ( = ?auto_182357 ?auto_182363 ) ) ( not ( = ?auto_182357 ?auto_182362 ) ) ( not ( = ?auto_182358 ?auto_182363 ) ) ( not ( = ?auto_182358 ?auto_182362 ) ) ( not ( = ?auto_182359 ?auto_182363 ) ) ( not ( = ?auto_182359 ?auto_182362 ) ) ( not ( = ?auto_182360 ?auto_182363 ) ) ( not ( = ?auto_182360 ?auto_182362 ) ) ( not ( = ?auto_182361 ?auto_182363 ) ) ( not ( = ?auto_182361 ?auto_182362 ) ) ( not ( = ?auto_182364 ?auto_182363 ) ) ( not ( = ?auto_182364 ?auto_182362 ) ) ( not ( = ?auto_182363 ?auto_182362 ) ) ( ON ?auto_182363 ?auto_182364 ) ( CLEAR ?auto_182363 ) ( HOLDING ?auto_182362 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_182362 )
      ( MAKE-5PILE ?auto_182357 ?auto_182358 ?auto_182359 ?auto_182360 ?auto_182361 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182470 - BLOCK
      ?auto_182471 - BLOCK
      ?auto_182472 - BLOCK
    )
    :vars
    (
      ?auto_182473 - BLOCK
      ?auto_182476 - BLOCK
      ?auto_182474 - BLOCK
      ?auto_182477 - BLOCK
      ?auto_182475 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182470 ) ( not ( = ?auto_182470 ?auto_182471 ) ) ( not ( = ?auto_182470 ?auto_182472 ) ) ( not ( = ?auto_182471 ?auto_182472 ) ) ( ON ?auto_182472 ?auto_182473 ) ( not ( = ?auto_182470 ?auto_182473 ) ) ( not ( = ?auto_182471 ?auto_182473 ) ) ( not ( = ?auto_182472 ?auto_182473 ) ) ( CLEAR ?auto_182470 ) ( ON ?auto_182471 ?auto_182472 ) ( CLEAR ?auto_182471 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_182476 ) ( ON ?auto_182474 ?auto_182476 ) ( ON ?auto_182477 ?auto_182474 ) ( ON ?auto_182475 ?auto_182477 ) ( ON ?auto_182473 ?auto_182475 ) ( not ( = ?auto_182476 ?auto_182474 ) ) ( not ( = ?auto_182476 ?auto_182477 ) ) ( not ( = ?auto_182476 ?auto_182475 ) ) ( not ( = ?auto_182476 ?auto_182473 ) ) ( not ( = ?auto_182476 ?auto_182472 ) ) ( not ( = ?auto_182476 ?auto_182471 ) ) ( not ( = ?auto_182474 ?auto_182477 ) ) ( not ( = ?auto_182474 ?auto_182475 ) ) ( not ( = ?auto_182474 ?auto_182473 ) ) ( not ( = ?auto_182474 ?auto_182472 ) ) ( not ( = ?auto_182474 ?auto_182471 ) ) ( not ( = ?auto_182477 ?auto_182475 ) ) ( not ( = ?auto_182477 ?auto_182473 ) ) ( not ( = ?auto_182477 ?auto_182472 ) ) ( not ( = ?auto_182477 ?auto_182471 ) ) ( not ( = ?auto_182475 ?auto_182473 ) ) ( not ( = ?auto_182475 ?auto_182472 ) ) ( not ( = ?auto_182475 ?auto_182471 ) ) ( not ( = ?auto_182470 ?auto_182476 ) ) ( not ( = ?auto_182470 ?auto_182474 ) ) ( not ( = ?auto_182470 ?auto_182477 ) ) ( not ( = ?auto_182470 ?auto_182475 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_182476 ?auto_182474 ?auto_182477 ?auto_182475 ?auto_182473 ?auto_182472 )
      ( MAKE-3PILE ?auto_182470 ?auto_182471 ?auto_182472 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182478 - BLOCK
      ?auto_182479 - BLOCK
      ?auto_182480 - BLOCK
    )
    :vars
    (
      ?auto_182482 - BLOCK
      ?auto_182483 - BLOCK
      ?auto_182485 - BLOCK
      ?auto_182484 - BLOCK
      ?auto_182481 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182478 ?auto_182479 ) ) ( not ( = ?auto_182478 ?auto_182480 ) ) ( not ( = ?auto_182479 ?auto_182480 ) ) ( ON ?auto_182480 ?auto_182482 ) ( not ( = ?auto_182478 ?auto_182482 ) ) ( not ( = ?auto_182479 ?auto_182482 ) ) ( not ( = ?auto_182480 ?auto_182482 ) ) ( ON ?auto_182479 ?auto_182480 ) ( CLEAR ?auto_182479 ) ( ON-TABLE ?auto_182483 ) ( ON ?auto_182485 ?auto_182483 ) ( ON ?auto_182484 ?auto_182485 ) ( ON ?auto_182481 ?auto_182484 ) ( ON ?auto_182482 ?auto_182481 ) ( not ( = ?auto_182483 ?auto_182485 ) ) ( not ( = ?auto_182483 ?auto_182484 ) ) ( not ( = ?auto_182483 ?auto_182481 ) ) ( not ( = ?auto_182483 ?auto_182482 ) ) ( not ( = ?auto_182483 ?auto_182480 ) ) ( not ( = ?auto_182483 ?auto_182479 ) ) ( not ( = ?auto_182485 ?auto_182484 ) ) ( not ( = ?auto_182485 ?auto_182481 ) ) ( not ( = ?auto_182485 ?auto_182482 ) ) ( not ( = ?auto_182485 ?auto_182480 ) ) ( not ( = ?auto_182485 ?auto_182479 ) ) ( not ( = ?auto_182484 ?auto_182481 ) ) ( not ( = ?auto_182484 ?auto_182482 ) ) ( not ( = ?auto_182484 ?auto_182480 ) ) ( not ( = ?auto_182484 ?auto_182479 ) ) ( not ( = ?auto_182481 ?auto_182482 ) ) ( not ( = ?auto_182481 ?auto_182480 ) ) ( not ( = ?auto_182481 ?auto_182479 ) ) ( not ( = ?auto_182478 ?auto_182483 ) ) ( not ( = ?auto_182478 ?auto_182485 ) ) ( not ( = ?auto_182478 ?auto_182484 ) ) ( not ( = ?auto_182478 ?auto_182481 ) ) ( HOLDING ?auto_182478 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_182478 )
      ( MAKE-3PILE ?auto_182478 ?auto_182479 ?auto_182480 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182486 - BLOCK
      ?auto_182487 - BLOCK
      ?auto_182488 - BLOCK
    )
    :vars
    (
      ?auto_182492 - BLOCK
      ?auto_182493 - BLOCK
      ?auto_182490 - BLOCK
      ?auto_182489 - BLOCK
      ?auto_182491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182486 ?auto_182487 ) ) ( not ( = ?auto_182486 ?auto_182488 ) ) ( not ( = ?auto_182487 ?auto_182488 ) ) ( ON ?auto_182488 ?auto_182492 ) ( not ( = ?auto_182486 ?auto_182492 ) ) ( not ( = ?auto_182487 ?auto_182492 ) ) ( not ( = ?auto_182488 ?auto_182492 ) ) ( ON ?auto_182487 ?auto_182488 ) ( ON-TABLE ?auto_182493 ) ( ON ?auto_182490 ?auto_182493 ) ( ON ?auto_182489 ?auto_182490 ) ( ON ?auto_182491 ?auto_182489 ) ( ON ?auto_182492 ?auto_182491 ) ( not ( = ?auto_182493 ?auto_182490 ) ) ( not ( = ?auto_182493 ?auto_182489 ) ) ( not ( = ?auto_182493 ?auto_182491 ) ) ( not ( = ?auto_182493 ?auto_182492 ) ) ( not ( = ?auto_182493 ?auto_182488 ) ) ( not ( = ?auto_182493 ?auto_182487 ) ) ( not ( = ?auto_182490 ?auto_182489 ) ) ( not ( = ?auto_182490 ?auto_182491 ) ) ( not ( = ?auto_182490 ?auto_182492 ) ) ( not ( = ?auto_182490 ?auto_182488 ) ) ( not ( = ?auto_182490 ?auto_182487 ) ) ( not ( = ?auto_182489 ?auto_182491 ) ) ( not ( = ?auto_182489 ?auto_182492 ) ) ( not ( = ?auto_182489 ?auto_182488 ) ) ( not ( = ?auto_182489 ?auto_182487 ) ) ( not ( = ?auto_182491 ?auto_182492 ) ) ( not ( = ?auto_182491 ?auto_182488 ) ) ( not ( = ?auto_182491 ?auto_182487 ) ) ( not ( = ?auto_182486 ?auto_182493 ) ) ( not ( = ?auto_182486 ?auto_182490 ) ) ( not ( = ?auto_182486 ?auto_182489 ) ) ( not ( = ?auto_182486 ?auto_182491 ) ) ( ON ?auto_182486 ?auto_182487 ) ( CLEAR ?auto_182486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182493 ?auto_182490 ?auto_182489 ?auto_182491 ?auto_182492 ?auto_182488 ?auto_182487 )
      ( MAKE-3PILE ?auto_182486 ?auto_182487 ?auto_182488 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182497 - BLOCK
      ?auto_182498 - BLOCK
      ?auto_182499 - BLOCK
    )
    :vars
    (
      ?auto_182500 - BLOCK
      ?auto_182504 - BLOCK
      ?auto_182501 - BLOCK
      ?auto_182502 - BLOCK
      ?auto_182503 - BLOCK
      ?auto_182505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182497 ?auto_182498 ) ) ( not ( = ?auto_182497 ?auto_182499 ) ) ( not ( = ?auto_182498 ?auto_182499 ) ) ( ON ?auto_182499 ?auto_182500 ) ( not ( = ?auto_182497 ?auto_182500 ) ) ( not ( = ?auto_182498 ?auto_182500 ) ) ( not ( = ?auto_182499 ?auto_182500 ) ) ( ON ?auto_182498 ?auto_182499 ) ( CLEAR ?auto_182498 ) ( ON-TABLE ?auto_182504 ) ( ON ?auto_182501 ?auto_182504 ) ( ON ?auto_182502 ?auto_182501 ) ( ON ?auto_182503 ?auto_182502 ) ( ON ?auto_182500 ?auto_182503 ) ( not ( = ?auto_182504 ?auto_182501 ) ) ( not ( = ?auto_182504 ?auto_182502 ) ) ( not ( = ?auto_182504 ?auto_182503 ) ) ( not ( = ?auto_182504 ?auto_182500 ) ) ( not ( = ?auto_182504 ?auto_182499 ) ) ( not ( = ?auto_182504 ?auto_182498 ) ) ( not ( = ?auto_182501 ?auto_182502 ) ) ( not ( = ?auto_182501 ?auto_182503 ) ) ( not ( = ?auto_182501 ?auto_182500 ) ) ( not ( = ?auto_182501 ?auto_182499 ) ) ( not ( = ?auto_182501 ?auto_182498 ) ) ( not ( = ?auto_182502 ?auto_182503 ) ) ( not ( = ?auto_182502 ?auto_182500 ) ) ( not ( = ?auto_182502 ?auto_182499 ) ) ( not ( = ?auto_182502 ?auto_182498 ) ) ( not ( = ?auto_182503 ?auto_182500 ) ) ( not ( = ?auto_182503 ?auto_182499 ) ) ( not ( = ?auto_182503 ?auto_182498 ) ) ( not ( = ?auto_182497 ?auto_182504 ) ) ( not ( = ?auto_182497 ?auto_182501 ) ) ( not ( = ?auto_182497 ?auto_182502 ) ) ( not ( = ?auto_182497 ?auto_182503 ) ) ( ON ?auto_182497 ?auto_182505 ) ( CLEAR ?auto_182497 ) ( HAND-EMPTY ) ( not ( = ?auto_182497 ?auto_182505 ) ) ( not ( = ?auto_182498 ?auto_182505 ) ) ( not ( = ?auto_182499 ?auto_182505 ) ) ( not ( = ?auto_182500 ?auto_182505 ) ) ( not ( = ?auto_182504 ?auto_182505 ) ) ( not ( = ?auto_182501 ?auto_182505 ) ) ( not ( = ?auto_182502 ?auto_182505 ) ) ( not ( = ?auto_182503 ?auto_182505 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_182497 ?auto_182505 )
      ( MAKE-3PILE ?auto_182497 ?auto_182498 ?auto_182499 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182506 - BLOCK
      ?auto_182507 - BLOCK
      ?auto_182508 - BLOCK
    )
    :vars
    (
      ?auto_182512 - BLOCK
      ?auto_182511 - BLOCK
      ?auto_182514 - BLOCK
      ?auto_182510 - BLOCK
      ?auto_182513 - BLOCK
      ?auto_182509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182506 ?auto_182507 ) ) ( not ( = ?auto_182506 ?auto_182508 ) ) ( not ( = ?auto_182507 ?auto_182508 ) ) ( ON ?auto_182508 ?auto_182512 ) ( not ( = ?auto_182506 ?auto_182512 ) ) ( not ( = ?auto_182507 ?auto_182512 ) ) ( not ( = ?auto_182508 ?auto_182512 ) ) ( ON-TABLE ?auto_182511 ) ( ON ?auto_182514 ?auto_182511 ) ( ON ?auto_182510 ?auto_182514 ) ( ON ?auto_182513 ?auto_182510 ) ( ON ?auto_182512 ?auto_182513 ) ( not ( = ?auto_182511 ?auto_182514 ) ) ( not ( = ?auto_182511 ?auto_182510 ) ) ( not ( = ?auto_182511 ?auto_182513 ) ) ( not ( = ?auto_182511 ?auto_182512 ) ) ( not ( = ?auto_182511 ?auto_182508 ) ) ( not ( = ?auto_182511 ?auto_182507 ) ) ( not ( = ?auto_182514 ?auto_182510 ) ) ( not ( = ?auto_182514 ?auto_182513 ) ) ( not ( = ?auto_182514 ?auto_182512 ) ) ( not ( = ?auto_182514 ?auto_182508 ) ) ( not ( = ?auto_182514 ?auto_182507 ) ) ( not ( = ?auto_182510 ?auto_182513 ) ) ( not ( = ?auto_182510 ?auto_182512 ) ) ( not ( = ?auto_182510 ?auto_182508 ) ) ( not ( = ?auto_182510 ?auto_182507 ) ) ( not ( = ?auto_182513 ?auto_182512 ) ) ( not ( = ?auto_182513 ?auto_182508 ) ) ( not ( = ?auto_182513 ?auto_182507 ) ) ( not ( = ?auto_182506 ?auto_182511 ) ) ( not ( = ?auto_182506 ?auto_182514 ) ) ( not ( = ?auto_182506 ?auto_182510 ) ) ( not ( = ?auto_182506 ?auto_182513 ) ) ( ON ?auto_182506 ?auto_182509 ) ( CLEAR ?auto_182506 ) ( not ( = ?auto_182506 ?auto_182509 ) ) ( not ( = ?auto_182507 ?auto_182509 ) ) ( not ( = ?auto_182508 ?auto_182509 ) ) ( not ( = ?auto_182512 ?auto_182509 ) ) ( not ( = ?auto_182511 ?auto_182509 ) ) ( not ( = ?auto_182514 ?auto_182509 ) ) ( not ( = ?auto_182510 ?auto_182509 ) ) ( not ( = ?auto_182513 ?auto_182509 ) ) ( HOLDING ?auto_182507 ) ( CLEAR ?auto_182508 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182511 ?auto_182514 ?auto_182510 ?auto_182513 ?auto_182512 ?auto_182508 ?auto_182507 )
      ( MAKE-3PILE ?auto_182506 ?auto_182507 ?auto_182508 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182515 - BLOCK
      ?auto_182516 - BLOCK
      ?auto_182517 - BLOCK
    )
    :vars
    (
      ?auto_182518 - BLOCK
      ?auto_182519 - BLOCK
      ?auto_182522 - BLOCK
      ?auto_182520 - BLOCK
      ?auto_182523 - BLOCK
      ?auto_182521 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182515 ?auto_182516 ) ) ( not ( = ?auto_182515 ?auto_182517 ) ) ( not ( = ?auto_182516 ?auto_182517 ) ) ( ON ?auto_182517 ?auto_182518 ) ( not ( = ?auto_182515 ?auto_182518 ) ) ( not ( = ?auto_182516 ?auto_182518 ) ) ( not ( = ?auto_182517 ?auto_182518 ) ) ( ON-TABLE ?auto_182519 ) ( ON ?auto_182522 ?auto_182519 ) ( ON ?auto_182520 ?auto_182522 ) ( ON ?auto_182523 ?auto_182520 ) ( ON ?auto_182518 ?auto_182523 ) ( not ( = ?auto_182519 ?auto_182522 ) ) ( not ( = ?auto_182519 ?auto_182520 ) ) ( not ( = ?auto_182519 ?auto_182523 ) ) ( not ( = ?auto_182519 ?auto_182518 ) ) ( not ( = ?auto_182519 ?auto_182517 ) ) ( not ( = ?auto_182519 ?auto_182516 ) ) ( not ( = ?auto_182522 ?auto_182520 ) ) ( not ( = ?auto_182522 ?auto_182523 ) ) ( not ( = ?auto_182522 ?auto_182518 ) ) ( not ( = ?auto_182522 ?auto_182517 ) ) ( not ( = ?auto_182522 ?auto_182516 ) ) ( not ( = ?auto_182520 ?auto_182523 ) ) ( not ( = ?auto_182520 ?auto_182518 ) ) ( not ( = ?auto_182520 ?auto_182517 ) ) ( not ( = ?auto_182520 ?auto_182516 ) ) ( not ( = ?auto_182523 ?auto_182518 ) ) ( not ( = ?auto_182523 ?auto_182517 ) ) ( not ( = ?auto_182523 ?auto_182516 ) ) ( not ( = ?auto_182515 ?auto_182519 ) ) ( not ( = ?auto_182515 ?auto_182522 ) ) ( not ( = ?auto_182515 ?auto_182520 ) ) ( not ( = ?auto_182515 ?auto_182523 ) ) ( ON ?auto_182515 ?auto_182521 ) ( not ( = ?auto_182515 ?auto_182521 ) ) ( not ( = ?auto_182516 ?auto_182521 ) ) ( not ( = ?auto_182517 ?auto_182521 ) ) ( not ( = ?auto_182518 ?auto_182521 ) ) ( not ( = ?auto_182519 ?auto_182521 ) ) ( not ( = ?auto_182522 ?auto_182521 ) ) ( not ( = ?auto_182520 ?auto_182521 ) ) ( not ( = ?auto_182523 ?auto_182521 ) ) ( CLEAR ?auto_182517 ) ( ON ?auto_182516 ?auto_182515 ) ( CLEAR ?auto_182516 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_182521 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182521 ?auto_182515 )
      ( MAKE-3PILE ?auto_182515 ?auto_182516 ?auto_182517 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182524 - BLOCK
      ?auto_182525 - BLOCK
      ?auto_182526 - BLOCK
    )
    :vars
    (
      ?auto_182528 - BLOCK
      ?auto_182530 - BLOCK
      ?auto_182532 - BLOCK
      ?auto_182527 - BLOCK
      ?auto_182529 - BLOCK
      ?auto_182531 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182524 ?auto_182525 ) ) ( not ( = ?auto_182524 ?auto_182526 ) ) ( not ( = ?auto_182525 ?auto_182526 ) ) ( not ( = ?auto_182524 ?auto_182528 ) ) ( not ( = ?auto_182525 ?auto_182528 ) ) ( not ( = ?auto_182526 ?auto_182528 ) ) ( ON-TABLE ?auto_182530 ) ( ON ?auto_182532 ?auto_182530 ) ( ON ?auto_182527 ?auto_182532 ) ( ON ?auto_182529 ?auto_182527 ) ( ON ?auto_182528 ?auto_182529 ) ( not ( = ?auto_182530 ?auto_182532 ) ) ( not ( = ?auto_182530 ?auto_182527 ) ) ( not ( = ?auto_182530 ?auto_182529 ) ) ( not ( = ?auto_182530 ?auto_182528 ) ) ( not ( = ?auto_182530 ?auto_182526 ) ) ( not ( = ?auto_182530 ?auto_182525 ) ) ( not ( = ?auto_182532 ?auto_182527 ) ) ( not ( = ?auto_182532 ?auto_182529 ) ) ( not ( = ?auto_182532 ?auto_182528 ) ) ( not ( = ?auto_182532 ?auto_182526 ) ) ( not ( = ?auto_182532 ?auto_182525 ) ) ( not ( = ?auto_182527 ?auto_182529 ) ) ( not ( = ?auto_182527 ?auto_182528 ) ) ( not ( = ?auto_182527 ?auto_182526 ) ) ( not ( = ?auto_182527 ?auto_182525 ) ) ( not ( = ?auto_182529 ?auto_182528 ) ) ( not ( = ?auto_182529 ?auto_182526 ) ) ( not ( = ?auto_182529 ?auto_182525 ) ) ( not ( = ?auto_182524 ?auto_182530 ) ) ( not ( = ?auto_182524 ?auto_182532 ) ) ( not ( = ?auto_182524 ?auto_182527 ) ) ( not ( = ?auto_182524 ?auto_182529 ) ) ( ON ?auto_182524 ?auto_182531 ) ( not ( = ?auto_182524 ?auto_182531 ) ) ( not ( = ?auto_182525 ?auto_182531 ) ) ( not ( = ?auto_182526 ?auto_182531 ) ) ( not ( = ?auto_182528 ?auto_182531 ) ) ( not ( = ?auto_182530 ?auto_182531 ) ) ( not ( = ?auto_182532 ?auto_182531 ) ) ( not ( = ?auto_182527 ?auto_182531 ) ) ( not ( = ?auto_182529 ?auto_182531 ) ) ( ON ?auto_182525 ?auto_182524 ) ( CLEAR ?auto_182525 ) ( ON-TABLE ?auto_182531 ) ( HOLDING ?auto_182526 ) ( CLEAR ?auto_182528 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_182530 ?auto_182532 ?auto_182527 ?auto_182529 ?auto_182528 ?auto_182526 )
      ( MAKE-3PILE ?auto_182524 ?auto_182525 ?auto_182526 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182533 - BLOCK
      ?auto_182534 - BLOCK
      ?auto_182535 - BLOCK
    )
    :vars
    (
      ?auto_182537 - BLOCK
      ?auto_182540 - BLOCK
      ?auto_182539 - BLOCK
      ?auto_182538 - BLOCK
      ?auto_182536 - BLOCK
      ?auto_182541 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182533 ?auto_182534 ) ) ( not ( = ?auto_182533 ?auto_182535 ) ) ( not ( = ?auto_182534 ?auto_182535 ) ) ( not ( = ?auto_182533 ?auto_182537 ) ) ( not ( = ?auto_182534 ?auto_182537 ) ) ( not ( = ?auto_182535 ?auto_182537 ) ) ( ON-TABLE ?auto_182540 ) ( ON ?auto_182539 ?auto_182540 ) ( ON ?auto_182538 ?auto_182539 ) ( ON ?auto_182536 ?auto_182538 ) ( ON ?auto_182537 ?auto_182536 ) ( not ( = ?auto_182540 ?auto_182539 ) ) ( not ( = ?auto_182540 ?auto_182538 ) ) ( not ( = ?auto_182540 ?auto_182536 ) ) ( not ( = ?auto_182540 ?auto_182537 ) ) ( not ( = ?auto_182540 ?auto_182535 ) ) ( not ( = ?auto_182540 ?auto_182534 ) ) ( not ( = ?auto_182539 ?auto_182538 ) ) ( not ( = ?auto_182539 ?auto_182536 ) ) ( not ( = ?auto_182539 ?auto_182537 ) ) ( not ( = ?auto_182539 ?auto_182535 ) ) ( not ( = ?auto_182539 ?auto_182534 ) ) ( not ( = ?auto_182538 ?auto_182536 ) ) ( not ( = ?auto_182538 ?auto_182537 ) ) ( not ( = ?auto_182538 ?auto_182535 ) ) ( not ( = ?auto_182538 ?auto_182534 ) ) ( not ( = ?auto_182536 ?auto_182537 ) ) ( not ( = ?auto_182536 ?auto_182535 ) ) ( not ( = ?auto_182536 ?auto_182534 ) ) ( not ( = ?auto_182533 ?auto_182540 ) ) ( not ( = ?auto_182533 ?auto_182539 ) ) ( not ( = ?auto_182533 ?auto_182538 ) ) ( not ( = ?auto_182533 ?auto_182536 ) ) ( ON ?auto_182533 ?auto_182541 ) ( not ( = ?auto_182533 ?auto_182541 ) ) ( not ( = ?auto_182534 ?auto_182541 ) ) ( not ( = ?auto_182535 ?auto_182541 ) ) ( not ( = ?auto_182537 ?auto_182541 ) ) ( not ( = ?auto_182540 ?auto_182541 ) ) ( not ( = ?auto_182539 ?auto_182541 ) ) ( not ( = ?auto_182538 ?auto_182541 ) ) ( not ( = ?auto_182536 ?auto_182541 ) ) ( ON ?auto_182534 ?auto_182533 ) ( ON-TABLE ?auto_182541 ) ( CLEAR ?auto_182537 ) ( ON ?auto_182535 ?auto_182534 ) ( CLEAR ?auto_182535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182541 ?auto_182533 ?auto_182534 )
      ( MAKE-3PILE ?auto_182533 ?auto_182534 ?auto_182535 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182542 - BLOCK
      ?auto_182543 - BLOCK
      ?auto_182544 - BLOCK
    )
    :vars
    (
      ?auto_182546 - BLOCK
      ?auto_182547 - BLOCK
      ?auto_182545 - BLOCK
      ?auto_182550 - BLOCK
      ?auto_182548 - BLOCK
      ?auto_182549 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182542 ?auto_182543 ) ) ( not ( = ?auto_182542 ?auto_182544 ) ) ( not ( = ?auto_182543 ?auto_182544 ) ) ( not ( = ?auto_182542 ?auto_182546 ) ) ( not ( = ?auto_182543 ?auto_182546 ) ) ( not ( = ?auto_182544 ?auto_182546 ) ) ( ON-TABLE ?auto_182547 ) ( ON ?auto_182545 ?auto_182547 ) ( ON ?auto_182550 ?auto_182545 ) ( ON ?auto_182548 ?auto_182550 ) ( not ( = ?auto_182547 ?auto_182545 ) ) ( not ( = ?auto_182547 ?auto_182550 ) ) ( not ( = ?auto_182547 ?auto_182548 ) ) ( not ( = ?auto_182547 ?auto_182546 ) ) ( not ( = ?auto_182547 ?auto_182544 ) ) ( not ( = ?auto_182547 ?auto_182543 ) ) ( not ( = ?auto_182545 ?auto_182550 ) ) ( not ( = ?auto_182545 ?auto_182548 ) ) ( not ( = ?auto_182545 ?auto_182546 ) ) ( not ( = ?auto_182545 ?auto_182544 ) ) ( not ( = ?auto_182545 ?auto_182543 ) ) ( not ( = ?auto_182550 ?auto_182548 ) ) ( not ( = ?auto_182550 ?auto_182546 ) ) ( not ( = ?auto_182550 ?auto_182544 ) ) ( not ( = ?auto_182550 ?auto_182543 ) ) ( not ( = ?auto_182548 ?auto_182546 ) ) ( not ( = ?auto_182548 ?auto_182544 ) ) ( not ( = ?auto_182548 ?auto_182543 ) ) ( not ( = ?auto_182542 ?auto_182547 ) ) ( not ( = ?auto_182542 ?auto_182545 ) ) ( not ( = ?auto_182542 ?auto_182550 ) ) ( not ( = ?auto_182542 ?auto_182548 ) ) ( ON ?auto_182542 ?auto_182549 ) ( not ( = ?auto_182542 ?auto_182549 ) ) ( not ( = ?auto_182543 ?auto_182549 ) ) ( not ( = ?auto_182544 ?auto_182549 ) ) ( not ( = ?auto_182546 ?auto_182549 ) ) ( not ( = ?auto_182547 ?auto_182549 ) ) ( not ( = ?auto_182545 ?auto_182549 ) ) ( not ( = ?auto_182550 ?auto_182549 ) ) ( not ( = ?auto_182548 ?auto_182549 ) ) ( ON ?auto_182543 ?auto_182542 ) ( ON-TABLE ?auto_182549 ) ( ON ?auto_182544 ?auto_182543 ) ( CLEAR ?auto_182544 ) ( HOLDING ?auto_182546 ) ( CLEAR ?auto_182548 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182547 ?auto_182545 ?auto_182550 ?auto_182548 ?auto_182546 )
      ( MAKE-3PILE ?auto_182542 ?auto_182543 ?auto_182544 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182551 - BLOCK
      ?auto_182552 - BLOCK
      ?auto_182553 - BLOCK
    )
    :vars
    (
      ?auto_182556 - BLOCK
      ?auto_182558 - BLOCK
      ?auto_182554 - BLOCK
      ?auto_182557 - BLOCK
      ?auto_182555 - BLOCK
      ?auto_182559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182551 ?auto_182552 ) ) ( not ( = ?auto_182551 ?auto_182553 ) ) ( not ( = ?auto_182552 ?auto_182553 ) ) ( not ( = ?auto_182551 ?auto_182556 ) ) ( not ( = ?auto_182552 ?auto_182556 ) ) ( not ( = ?auto_182553 ?auto_182556 ) ) ( ON-TABLE ?auto_182558 ) ( ON ?auto_182554 ?auto_182558 ) ( ON ?auto_182557 ?auto_182554 ) ( ON ?auto_182555 ?auto_182557 ) ( not ( = ?auto_182558 ?auto_182554 ) ) ( not ( = ?auto_182558 ?auto_182557 ) ) ( not ( = ?auto_182558 ?auto_182555 ) ) ( not ( = ?auto_182558 ?auto_182556 ) ) ( not ( = ?auto_182558 ?auto_182553 ) ) ( not ( = ?auto_182558 ?auto_182552 ) ) ( not ( = ?auto_182554 ?auto_182557 ) ) ( not ( = ?auto_182554 ?auto_182555 ) ) ( not ( = ?auto_182554 ?auto_182556 ) ) ( not ( = ?auto_182554 ?auto_182553 ) ) ( not ( = ?auto_182554 ?auto_182552 ) ) ( not ( = ?auto_182557 ?auto_182555 ) ) ( not ( = ?auto_182557 ?auto_182556 ) ) ( not ( = ?auto_182557 ?auto_182553 ) ) ( not ( = ?auto_182557 ?auto_182552 ) ) ( not ( = ?auto_182555 ?auto_182556 ) ) ( not ( = ?auto_182555 ?auto_182553 ) ) ( not ( = ?auto_182555 ?auto_182552 ) ) ( not ( = ?auto_182551 ?auto_182558 ) ) ( not ( = ?auto_182551 ?auto_182554 ) ) ( not ( = ?auto_182551 ?auto_182557 ) ) ( not ( = ?auto_182551 ?auto_182555 ) ) ( ON ?auto_182551 ?auto_182559 ) ( not ( = ?auto_182551 ?auto_182559 ) ) ( not ( = ?auto_182552 ?auto_182559 ) ) ( not ( = ?auto_182553 ?auto_182559 ) ) ( not ( = ?auto_182556 ?auto_182559 ) ) ( not ( = ?auto_182558 ?auto_182559 ) ) ( not ( = ?auto_182554 ?auto_182559 ) ) ( not ( = ?auto_182557 ?auto_182559 ) ) ( not ( = ?auto_182555 ?auto_182559 ) ) ( ON ?auto_182552 ?auto_182551 ) ( ON-TABLE ?auto_182559 ) ( ON ?auto_182553 ?auto_182552 ) ( CLEAR ?auto_182555 ) ( ON ?auto_182556 ?auto_182553 ) ( CLEAR ?auto_182556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182559 ?auto_182551 ?auto_182552 ?auto_182553 )
      ( MAKE-3PILE ?auto_182551 ?auto_182552 ?auto_182553 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182560 - BLOCK
      ?auto_182561 - BLOCK
      ?auto_182562 - BLOCK
    )
    :vars
    (
      ?auto_182565 - BLOCK
      ?auto_182567 - BLOCK
      ?auto_182566 - BLOCK
      ?auto_182563 - BLOCK
      ?auto_182564 - BLOCK
      ?auto_182568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182560 ?auto_182561 ) ) ( not ( = ?auto_182560 ?auto_182562 ) ) ( not ( = ?auto_182561 ?auto_182562 ) ) ( not ( = ?auto_182560 ?auto_182565 ) ) ( not ( = ?auto_182561 ?auto_182565 ) ) ( not ( = ?auto_182562 ?auto_182565 ) ) ( ON-TABLE ?auto_182567 ) ( ON ?auto_182566 ?auto_182567 ) ( ON ?auto_182563 ?auto_182566 ) ( not ( = ?auto_182567 ?auto_182566 ) ) ( not ( = ?auto_182567 ?auto_182563 ) ) ( not ( = ?auto_182567 ?auto_182564 ) ) ( not ( = ?auto_182567 ?auto_182565 ) ) ( not ( = ?auto_182567 ?auto_182562 ) ) ( not ( = ?auto_182567 ?auto_182561 ) ) ( not ( = ?auto_182566 ?auto_182563 ) ) ( not ( = ?auto_182566 ?auto_182564 ) ) ( not ( = ?auto_182566 ?auto_182565 ) ) ( not ( = ?auto_182566 ?auto_182562 ) ) ( not ( = ?auto_182566 ?auto_182561 ) ) ( not ( = ?auto_182563 ?auto_182564 ) ) ( not ( = ?auto_182563 ?auto_182565 ) ) ( not ( = ?auto_182563 ?auto_182562 ) ) ( not ( = ?auto_182563 ?auto_182561 ) ) ( not ( = ?auto_182564 ?auto_182565 ) ) ( not ( = ?auto_182564 ?auto_182562 ) ) ( not ( = ?auto_182564 ?auto_182561 ) ) ( not ( = ?auto_182560 ?auto_182567 ) ) ( not ( = ?auto_182560 ?auto_182566 ) ) ( not ( = ?auto_182560 ?auto_182563 ) ) ( not ( = ?auto_182560 ?auto_182564 ) ) ( ON ?auto_182560 ?auto_182568 ) ( not ( = ?auto_182560 ?auto_182568 ) ) ( not ( = ?auto_182561 ?auto_182568 ) ) ( not ( = ?auto_182562 ?auto_182568 ) ) ( not ( = ?auto_182565 ?auto_182568 ) ) ( not ( = ?auto_182567 ?auto_182568 ) ) ( not ( = ?auto_182566 ?auto_182568 ) ) ( not ( = ?auto_182563 ?auto_182568 ) ) ( not ( = ?auto_182564 ?auto_182568 ) ) ( ON ?auto_182561 ?auto_182560 ) ( ON-TABLE ?auto_182568 ) ( ON ?auto_182562 ?auto_182561 ) ( ON ?auto_182565 ?auto_182562 ) ( CLEAR ?auto_182565 ) ( HOLDING ?auto_182564 ) ( CLEAR ?auto_182563 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182567 ?auto_182566 ?auto_182563 ?auto_182564 )
      ( MAKE-3PILE ?auto_182560 ?auto_182561 ?auto_182562 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182569 - BLOCK
      ?auto_182570 - BLOCK
      ?auto_182571 - BLOCK
    )
    :vars
    (
      ?auto_182574 - BLOCK
      ?auto_182576 - BLOCK
      ?auto_182572 - BLOCK
      ?auto_182573 - BLOCK
      ?auto_182575 - BLOCK
      ?auto_182577 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182569 ?auto_182570 ) ) ( not ( = ?auto_182569 ?auto_182571 ) ) ( not ( = ?auto_182570 ?auto_182571 ) ) ( not ( = ?auto_182569 ?auto_182574 ) ) ( not ( = ?auto_182570 ?auto_182574 ) ) ( not ( = ?auto_182571 ?auto_182574 ) ) ( ON-TABLE ?auto_182576 ) ( ON ?auto_182572 ?auto_182576 ) ( ON ?auto_182573 ?auto_182572 ) ( not ( = ?auto_182576 ?auto_182572 ) ) ( not ( = ?auto_182576 ?auto_182573 ) ) ( not ( = ?auto_182576 ?auto_182575 ) ) ( not ( = ?auto_182576 ?auto_182574 ) ) ( not ( = ?auto_182576 ?auto_182571 ) ) ( not ( = ?auto_182576 ?auto_182570 ) ) ( not ( = ?auto_182572 ?auto_182573 ) ) ( not ( = ?auto_182572 ?auto_182575 ) ) ( not ( = ?auto_182572 ?auto_182574 ) ) ( not ( = ?auto_182572 ?auto_182571 ) ) ( not ( = ?auto_182572 ?auto_182570 ) ) ( not ( = ?auto_182573 ?auto_182575 ) ) ( not ( = ?auto_182573 ?auto_182574 ) ) ( not ( = ?auto_182573 ?auto_182571 ) ) ( not ( = ?auto_182573 ?auto_182570 ) ) ( not ( = ?auto_182575 ?auto_182574 ) ) ( not ( = ?auto_182575 ?auto_182571 ) ) ( not ( = ?auto_182575 ?auto_182570 ) ) ( not ( = ?auto_182569 ?auto_182576 ) ) ( not ( = ?auto_182569 ?auto_182572 ) ) ( not ( = ?auto_182569 ?auto_182573 ) ) ( not ( = ?auto_182569 ?auto_182575 ) ) ( ON ?auto_182569 ?auto_182577 ) ( not ( = ?auto_182569 ?auto_182577 ) ) ( not ( = ?auto_182570 ?auto_182577 ) ) ( not ( = ?auto_182571 ?auto_182577 ) ) ( not ( = ?auto_182574 ?auto_182577 ) ) ( not ( = ?auto_182576 ?auto_182577 ) ) ( not ( = ?auto_182572 ?auto_182577 ) ) ( not ( = ?auto_182573 ?auto_182577 ) ) ( not ( = ?auto_182575 ?auto_182577 ) ) ( ON ?auto_182570 ?auto_182569 ) ( ON-TABLE ?auto_182577 ) ( ON ?auto_182571 ?auto_182570 ) ( ON ?auto_182574 ?auto_182571 ) ( CLEAR ?auto_182573 ) ( ON ?auto_182575 ?auto_182574 ) ( CLEAR ?auto_182575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182577 ?auto_182569 ?auto_182570 ?auto_182571 ?auto_182574 )
      ( MAKE-3PILE ?auto_182569 ?auto_182570 ?auto_182571 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182578 - BLOCK
      ?auto_182579 - BLOCK
      ?auto_182580 - BLOCK
    )
    :vars
    (
      ?auto_182584 - BLOCK
      ?auto_182585 - BLOCK
      ?auto_182586 - BLOCK
      ?auto_182582 - BLOCK
      ?auto_182581 - BLOCK
      ?auto_182583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182578 ?auto_182579 ) ) ( not ( = ?auto_182578 ?auto_182580 ) ) ( not ( = ?auto_182579 ?auto_182580 ) ) ( not ( = ?auto_182578 ?auto_182584 ) ) ( not ( = ?auto_182579 ?auto_182584 ) ) ( not ( = ?auto_182580 ?auto_182584 ) ) ( ON-TABLE ?auto_182585 ) ( ON ?auto_182586 ?auto_182585 ) ( not ( = ?auto_182585 ?auto_182586 ) ) ( not ( = ?auto_182585 ?auto_182582 ) ) ( not ( = ?auto_182585 ?auto_182581 ) ) ( not ( = ?auto_182585 ?auto_182584 ) ) ( not ( = ?auto_182585 ?auto_182580 ) ) ( not ( = ?auto_182585 ?auto_182579 ) ) ( not ( = ?auto_182586 ?auto_182582 ) ) ( not ( = ?auto_182586 ?auto_182581 ) ) ( not ( = ?auto_182586 ?auto_182584 ) ) ( not ( = ?auto_182586 ?auto_182580 ) ) ( not ( = ?auto_182586 ?auto_182579 ) ) ( not ( = ?auto_182582 ?auto_182581 ) ) ( not ( = ?auto_182582 ?auto_182584 ) ) ( not ( = ?auto_182582 ?auto_182580 ) ) ( not ( = ?auto_182582 ?auto_182579 ) ) ( not ( = ?auto_182581 ?auto_182584 ) ) ( not ( = ?auto_182581 ?auto_182580 ) ) ( not ( = ?auto_182581 ?auto_182579 ) ) ( not ( = ?auto_182578 ?auto_182585 ) ) ( not ( = ?auto_182578 ?auto_182586 ) ) ( not ( = ?auto_182578 ?auto_182582 ) ) ( not ( = ?auto_182578 ?auto_182581 ) ) ( ON ?auto_182578 ?auto_182583 ) ( not ( = ?auto_182578 ?auto_182583 ) ) ( not ( = ?auto_182579 ?auto_182583 ) ) ( not ( = ?auto_182580 ?auto_182583 ) ) ( not ( = ?auto_182584 ?auto_182583 ) ) ( not ( = ?auto_182585 ?auto_182583 ) ) ( not ( = ?auto_182586 ?auto_182583 ) ) ( not ( = ?auto_182582 ?auto_182583 ) ) ( not ( = ?auto_182581 ?auto_182583 ) ) ( ON ?auto_182579 ?auto_182578 ) ( ON-TABLE ?auto_182583 ) ( ON ?auto_182580 ?auto_182579 ) ( ON ?auto_182584 ?auto_182580 ) ( ON ?auto_182581 ?auto_182584 ) ( CLEAR ?auto_182581 ) ( HOLDING ?auto_182582 ) ( CLEAR ?auto_182586 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182585 ?auto_182586 ?auto_182582 )
      ( MAKE-3PILE ?auto_182578 ?auto_182579 ?auto_182580 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182587 - BLOCK
      ?auto_182588 - BLOCK
      ?auto_182589 - BLOCK
    )
    :vars
    (
      ?auto_182593 - BLOCK
      ?auto_182591 - BLOCK
      ?auto_182595 - BLOCK
      ?auto_182592 - BLOCK
      ?auto_182594 - BLOCK
      ?auto_182590 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182587 ?auto_182588 ) ) ( not ( = ?auto_182587 ?auto_182589 ) ) ( not ( = ?auto_182588 ?auto_182589 ) ) ( not ( = ?auto_182587 ?auto_182593 ) ) ( not ( = ?auto_182588 ?auto_182593 ) ) ( not ( = ?auto_182589 ?auto_182593 ) ) ( ON-TABLE ?auto_182591 ) ( ON ?auto_182595 ?auto_182591 ) ( not ( = ?auto_182591 ?auto_182595 ) ) ( not ( = ?auto_182591 ?auto_182592 ) ) ( not ( = ?auto_182591 ?auto_182594 ) ) ( not ( = ?auto_182591 ?auto_182593 ) ) ( not ( = ?auto_182591 ?auto_182589 ) ) ( not ( = ?auto_182591 ?auto_182588 ) ) ( not ( = ?auto_182595 ?auto_182592 ) ) ( not ( = ?auto_182595 ?auto_182594 ) ) ( not ( = ?auto_182595 ?auto_182593 ) ) ( not ( = ?auto_182595 ?auto_182589 ) ) ( not ( = ?auto_182595 ?auto_182588 ) ) ( not ( = ?auto_182592 ?auto_182594 ) ) ( not ( = ?auto_182592 ?auto_182593 ) ) ( not ( = ?auto_182592 ?auto_182589 ) ) ( not ( = ?auto_182592 ?auto_182588 ) ) ( not ( = ?auto_182594 ?auto_182593 ) ) ( not ( = ?auto_182594 ?auto_182589 ) ) ( not ( = ?auto_182594 ?auto_182588 ) ) ( not ( = ?auto_182587 ?auto_182591 ) ) ( not ( = ?auto_182587 ?auto_182595 ) ) ( not ( = ?auto_182587 ?auto_182592 ) ) ( not ( = ?auto_182587 ?auto_182594 ) ) ( ON ?auto_182587 ?auto_182590 ) ( not ( = ?auto_182587 ?auto_182590 ) ) ( not ( = ?auto_182588 ?auto_182590 ) ) ( not ( = ?auto_182589 ?auto_182590 ) ) ( not ( = ?auto_182593 ?auto_182590 ) ) ( not ( = ?auto_182591 ?auto_182590 ) ) ( not ( = ?auto_182595 ?auto_182590 ) ) ( not ( = ?auto_182592 ?auto_182590 ) ) ( not ( = ?auto_182594 ?auto_182590 ) ) ( ON ?auto_182588 ?auto_182587 ) ( ON-TABLE ?auto_182590 ) ( ON ?auto_182589 ?auto_182588 ) ( ON ?auto_182593 ?auto_182589 ) ( ON ?auto_182594 ?auto_182593 ) ( CLEAR ?auto_182595 ) ( ON ?auto_182592 ?auto_182594 ) ( CLEAR ?auto_182592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_182590 ?auto_182587 ?auto_182588 ?auto_182589 ?auto_182593 ?auto_182594 )
      ( MAKE-3PILE ?auto_182587 ?auto_182588 ?auto_182589 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182596 - BLOCK
      ?auto_182597 - BLOCK
      ?auto_182598 - BLOCK
    )
    :vars
    (
      ?auto_182604 - BLOCK
      ?auto_182603 - BLOCK
      ?auto_182602 - BLOCK
      ?auto_182601 - BLOCK
      ?auto_182600 - BLOCK
      ?auto_182599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182596 ?auto_182597 ) ) ( not ( = ?auto_182596 ?auto_182598 ) ) ( not ( = ?auto_182597 ?auto_182598 ) ) ( not ( = ?auto_182596 ?auto_182604 ) ) ( not ( = ?auto_182597 ?auto_182604 ) ) ( not ( = ?auto_182598 ?auto_182604 ) ) ( ON-TABLE ?auto_182603 ) ( not ( = ?auto_182603 ?auto_182602 ) ) ( not ( = ?auto_182603 ?auto_182601 ) ) ( not ( = ?auto_182603 ?auto_182600 ) ) ( not ( = ?auto_182603 ?auto_182604 ) ) ( not ( = ?auto_182603 ?auto_182598 ) ) ( not ( = ?auto_182603 ?auto_182597 ) ) ( not ( = ?auto_182602 ?auto_182601 ) ) ( not ( = ?auto_182602 ?auto_182600 ) ) ( not ( = ?auto_182602 ?auto_182604 ) ) ( not ( = ?auto_182602 ?auto_182598 ) ) ( not ( = ?auto_182602 ?auto_182597 ) ) ( not ( = ?auto_182601 ?auto_182600 ) ) ( not ( = ?auto_182601 ?auto_182604 ) ) ( not ( = ?auto_182601 ?auto_182598 ) ) ( not ( = ?auto_182601 ?auto_182597 ) ) ( not ( = ?auto_182600 ?auto_182604 ) ) ( not ( = ?auto_182600 ?auto_182598 ) ) ( not ( = ?auto_182600 ?auto_182597 ) ) ( not ( = ?auto_182596 ?auto_182603 ) ) ( not ( = ?auto_182596 ?auto_182602 ) ) ( not ( = ?auto_182596 ?auto_182601 ) ) ( not ( = ?auto_182596 ?auto_182600 ) ) ( ON ?auto_182596 ?auto_182599 ) ( not ( = ?auto_182596 ?auto_182599 ) ) ( not ( = ?auto_182597 ?auto_182599 ) ) ( not ( = ?auto_182598 ?auto_182599 ) ) ( not ( = ?auto_182604 ?auto_182599 ) ) ( not ( = ?auto_182603 ?auto_182599 ) ) ( not ( = ?auto_182602 ?auto_182599 ) ) ( not ( = ?auto_182601 ?auto_182599 ) ) ( not ( = ?auto_182600 ?auto_182599 ) ) ( ON ?auto_182597 ?auto_182596 ) ( ON-TABLE ?auto_182599 ) ( ON ?auto_182598 ?auto_182597 ) ( ON ?auto_182604 ?auto_182598 ) ( ON ?auto_182600 ?auto_182604 ) ( ON ?auto_182601 ?auto_182600 ) ( CLEAR ?auto_182601 ) ( HOLDING ?auto_182602 ) ( CLEAR ?auto_182603 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182603 ?auto_182602 )
      ( MAKE-3PILE ?auto_182596 ?auto_182597 ?auto_182598 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182605 - BLOCK
      ?auto_182606 - BLOCK
      ?auto_182607 - BLOCK
    )
    :vars
    (
      ?auto_182610 - BLOCK
      ?auto_182608 - BLOCK
      ?auto_182609 - BLOCK
      ?auto_182613 - BLOCK
      ?auto_182612 - BLOCK
      ?auto_182611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182605 ?auto_182606 ) ) ( not ( = ?auto_182605 ?auto_182607 ) ) ( not ( = ?auto_182606 ?auto_182607 ) ) ( not ( = ?auto_182605 ?auto_182610 ) ) ( not ( = ?auto_182606 ?auto_182610 ) ) ( not ( = ?auto_182607 ?auto_182610 ) ) ( ON-TABLE ?auto_182608 ) ( not ( = ?auto_182608 ?auto_182609 ) ) ( not ( = ?auto_182608 ?auto_182613 ) ) ( not ( = ?auto_182608 ?auto_182612 ) ) ( not ( = ?auto_182608 ?auto_182610 ) ) ( not ( = ?auto_182608 ?auto_182607 ) ) ( not ( = ?auto_182608 ?auto_182606 ) ) ( not ( = ?auto_182609 ?auto_182613 ) ) ( not ( = ?auto_182609 ?auto_182612 ) ) ( not ( = ?auto_182609 ?auto_182610 ) ) ( not ( = ?auto_182609 ?auto_182607 ) ) ( not ( = ?auto_182609 ?auto_182606 ) ) ( not ( = ?auto_182613 ?auto_182612 ) ) ( not ( = ?auto_182613 ?auto_182610 ) ) ( not ( = ?auto_182613 ?auto_182607 ) ) ( not ( = ?auto_182613 ?auto_182606 ) ) ( not ( = ?auto_182612 ?auto_182610 ) ) ( not ( = ?auto_182612 ?auto_182607 ) ) ( not ( = ?auto_182612 ?auto_182606 ) ) ( not ( = ?auto_182605 ?auto_182608 ) ) ( not ( = ?auto_182605 ?auto_182609 ) ) ( not ( = ?auto_182605 ?auto_182613 ) ) ( not ( = ?auto_182605 ?auto_182612 ) ) ( ON ?auto_182605 ?auto_182611 ) ( not ( = ?auto_182605 ?auto_182611 ) ) ( not ( = ?auto_182606 ?auto_182611 ) ) ( not ( = ?auto_182607 ?auto_182611 ) ) ( not ( = ?auto_182610 ?auto_182611 ) ) ( not ( = ?auto_182608 ?auto_182611 ) ) ( not ( = ?auto_182609 ?auto_182611 ) ) ( not ( = ?auto_182613 ?auto_182611 ) ) ( not ( = ?auto_182612 ?auto_182611 ) ) ( ON ?auto_182606 ?auto_182605 ) ( ON-TABLE ?auto_182611 ) ( ON ?auto_182607 ?auto_182606 ) ( ON ?auto_182610 ?auto_182607 ) ( ON ?auto_182612 ?auto_182610 ) ( ON ?auto_182613 ?auto_182612 ) ( CLEAR ?auto_182608 ) ( ON ?auto_182609 ?auto_182613 ) ( CLEAR ?auto_182609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182611 ?auto_182605 ?auto_182606 ?auto_182607 ?auto_182610 ?auto_182612 ?auto_182613 )
      ( MAKE-3PILE ?auto_182605 ?auto_182606 ?auto_182607 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182614 - BLOCK
      ?auto_182615 - BLOCK
      ?auto_182616 - BLOCK
    )
    :vars
    (
      ?auto_182620 - BLOCK
      ?auto_182618 - BLOCK
      ?auto_182621 - BLOCK
      ?auto_182617 - BLOCK
      ?auto_182622 - BLOCK
      ?auto_182619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182614 ?auto_182615 ) ) ( not ( = ?auto_182614 ?auto_182616 ) ) ( not ( = ?auto_182615 ?auto_182616 ) ) ( not ( = ?auto_182614 ?auto_182620 ) ) ( not ( = ?auto_182615 ?auto_182620 ) ) ( not ( = ?auto_182616 ?auto_182620 ) ) ( not ( = ?auto_182618 ?auto_182621 ) ) ( not ( = ?auto_182618 ?auto_182617 ) ) ( not ( = ?auto_182618 ?auto_182622 ) ) ( not ( = ?auto_182618 ?auto_182620 ) ) ( not ( = ?auto_182618 ?auto_182616 ) ) ( not ( = ?auto_182618 ?auto_182615 ) ) ( not ( = ?auto_182621 ?auto_182617 ) ) ( not ( = ?auto_182621 ?auto_182622 ) ) ( not ( = ?auto_182621 ?auto_182620 ) ) ( not ( = ?auto_182621 ?auto_182616 ) ) ( not ( = ?auto_182621 ?auto_182615 ) ) ( not ( = ?auto_182617 ?auto_182622 ) ) ( not ( = ?auto_182617 ?auto_182620 ) ) ( not ( = ?auto_182617 ?auto_182616 ) ) ( not ( = ?auto_182617 ?auto_182615 ) ) ( not ( = ?auto_182622 ?auto_182620 ) ) ( not ( = ?auto_182622 ?auto_182616 ) ) ( not ( = ?auto_182622 ?auto_182615 ) ) ( not ( = ?auto_182614 ?auto_182618 ) ) ( not ( = ?auto_182614 ?auto_182621 ) ) ( not ( = ?auto_182614 ?auto_182617 ) ) ( not ( = ?auto_182614 ?auto_182622 ) ) ( ON ?auto_182614 ?auto_182619 ) ( not ( = ?auto_182614 ?auto_182619 ) ) ( not ( = ?auto_182615 ?auto_182619 ) ) ( not ( = ?auto_182616 ?auto_182619 ) ) ( not ( = ?auto_182620 ?auto_182619 ) ) ( not ( = ?auto_182618 ?auto_182619 ) ) ( not ( = ?auto_182621 ?auto_182619 ) ) ( not ( = ?auto_182617 ?auto_182619 ) ) ( not ( = ?auto_182622 ?auto_182619 ) ) ( ON ?auto_182615 ?auto_182614 ) ( ON-TABLE ?auto_182619 ) ( ON ?auto_182616 ?auto_182615 ) ( ON ?auto_182620 ?auto_182616 ) ( ON ?auto_182622 ?auto_182620 ) ( ON ?auto_182617 ?auto_182622 ) ( ON ?auto_182621 ?auto_182617 ) ( CLEAR ?auto_182621 ) ( HOLDING ?auto_182618 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_182618 )
      ( MAKE-3PILE ?auto_182614 ?auto_182615 ?auto_182616 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182623 - BLOCK
      ?auto_182624 - BLOCK
      ?auto_182625 - BLOCK
    )
    :vars
    (
      ?auto_182630 - BLOCK
      ?auto_182628 - BLOCK
      ?auto_182626 - BLOCK
      ?auto_182631 - BLOCK
      ?auto_182627 - BLOCK
      ?auto_182629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182623 ?auto_182624 ) ) ( not ( = ?auto_182623 ?auto_182625 ) ) ( not ( = ?auto_182624 ?auto_182625 ) ) ( not ( = ?auto_182623 ?auto_182630 ) ) ( not ( = ?auto_182624 ?auto_182630 ) ) ( not ( = ?auto_182625 ?auto_182630 ) ) ( not ( = ?auto_182628 ?auto_182626 ) ) ( not ( = ?auto_182628 ?auto_182631 ) ) ( not ( = ?auto_182628 ?auto_182627 ) ) ( not ( = ?auto_182628 ?auto_182630 ) ) ( not ( = ?auto_182628 ?auto_182625 ) ) ( not ( = ?auto_182628 ?auto_182624 ) ) ( not ( = ?auto_182626 ?auto_182631 ) ) ( not ( = ?auto_182626 ?auto_182627 ) ) ( not ( = ?auto_182626 ?auto_182630 ) ) ( not ( = ?auto_182626 ?auto_182625 ) ) ( not ( = ?auto_182626 ?auto_182624 ) ) ( not ( = ?auto_182631 ?auto_182627 ) ) ( not ( = ?auto_182631 ?auto_182630 ) ) ( not ( = ?auto_182631 ?auto_182625 ) ) ( not ( = ?auto_182631 ?auto_182624 ) ) ( not ( = ?auto_182627 ?auto_182630 ) ) ( not ( = ?auto_182627 ?auto_182625 ) ) ( not ( = ?auto_182627 ?auto_182624 ) ) ( not ( = ?auto_182623 ?auto_182628 ) ) ( not ( = ?auto_182623 ?auto_182626 ) ) ( not ( = ?auto_182623 ?auto_182631 ) ) ( not ( = ?auto_182623 ?auto_182627 ) ) ( ON ?auto_182623 ?auto_182629 ) ( not ( = ?auto_182623 ?auto_182629 ) ) ( not ( = ?auto_182624 ?auto_182629 ) ) ( not ( = ?auto_182625 ?auto_182629 ) ) ( not ( = ?auto_182630 ?auto_182629 ) ) ( not ( = ?auto_182628 ?auto_182629 ) ) ( not ( = ?auto_182626 ?auto_182629 ) ) ( not ( = ?auto_182631 ?auto_182629 ) ) ( not ( = ?auto_182627 ?auto_182629 ) ) ( ON ?auto_182624 ?auto_182623 ) ( ON-TABLE ?auto_182629 ) ( ON ?auto_182625 ?auto_182624 ) ( ON ?auto_182630 ?auto_182625 ) ( ON ?auto_182627 ?auto_182630 ) ( ON ?auto_182631 ?auto_182627 ) ( ON ?auto_182626 ?auto_182631 ) ( ON ?auto_182628 ?auto_182626 ) ( CLEAR ?auto_182628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_182629 ?auto_182623 ?auto_182624 ?auto_182625 ?auto_182630 ?auto_182627 ?auto_182631 ?auto_182626 )
      ( MAKE-3PILE ?auto_182623 ?auto_182624 ?auto_182625 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182655 - BLOCK
      ?auto_182656 - BLOCK
      ?auto_182657 - BLOCK
      ?auto_182658 - BLOCK
    )
    :vars
    (
      ?auto_182660 - BLOCK
      ?auto_182661 - BLOCK
      ?auto_182659 - BLOCK
      ?auto_182662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182660 ?auto_182658 ) ( ON-TABLE ?auto_182655 ) ( ON ?auto_182656 ?auto_182655 ) ( ON ?auto_182657 ?auto_182656 ) ( ON ?auto_182658 ?auto_182657 ) ( not ( = ?auto_182655 ?auto_182656 ) ) ( not ( = ?auto_182655 ?auto_182657 ) ) ( not ( = ?auto_182655 ?auto_182658 ) ) ( not ( = ?auto_182655 ?auto_182660 ) ) ( not ( = ?auto_182656 ?auto_182657 ) ) ( not ( = ?auto_182656 ?auto_182658 ) ) ( not ( = ?auto_182656 ?auto_182660 ) ) ( not ( = ?auto_182657 ?auto_182658 ) ) ( not ( = ?auto_182657 ?auto_182660 ) ) ( not ( = ?auto_182658 ?auto_182660 ) ) ( not ( = ?auto_182655 ?auto_182661 ) ) ( not ( = ?auto_182655 ?auto_182659 ) ) ( not ( = ?auto_182656 ?auto_182661 ) ) ( not ( = ?auto_182656 ?auto_182659 ) ) ( not ( = ?auto_182657 ?auto_182661 ) ) ( not ( = ?auto_182657 ?auto_182659 ) ) ( not ( = ?auto_182658 ?auto_182661 ) ) ( not ( = ?auto_182658 ?auto_182659 ) ) ( not ( = ?auto_182660 ?auto_182661 ) ) ( not ( = ?auto_182660 ?auto_182659 ) ) ( not ( = ?auto_182661 ?auto_182659 ) ) ( ON ?auto_182661 ?auto_182660 ) ( CLEAR ?auto_182661 ) ( HOLDING ?auto_182659 ) ( CLEAR ?auto_182662 ) ( ON-TABLE ?auto_182662 ) ( not ( = ?auto_182662 ?auto_182659 ) ) ( not ( = ?auto_182655 ?auto_182662 ) ) ( not ( = ?auto_182656 ?auto_182662 ) ) ( not ( = ?auto_182657 ?auto_182662 ) ) ( not ( = ?auto_182658 ?auto_182662 ) ) ( not ( = ?auto_182660 ?auto_182662 ) ) ( not ( = ?auto_182661 ?auto_182662 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182662 ?auto_182659 )
      ( MAKE-4PILE ?auto_182655 ?auto_182656 ?auto_182657 ?auto_182658 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182663 - BLOCK
      ?auto_182664 - BLOCK
      ?auto_182665 - BLOCK
      ?auto_182666 - BLOCK
    )
    :vars
    (
      ?auto_182670 - BLOCK
      ?auto_182667 - BLOCK
      ?auto_182669 - BLOCK
      ?auto_182668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182670 ?auto_182666 ) ( ON-TABLE ?auto_182663 ) ( ON ?auto_182664 ?auto_182663 ) ( ON ?auto_182665 ?auto_182664 ) ( ON ?auto_182666 ?auto_182665 ) ( not ( = ?auto_182663 ?auto_182664 ) ) ( not ( = ?auto_182663 ?auto_182665 ) ) ( not ( = ?auto_182663 ?auto_182666 ) ) ( not ( = ?auto_182663 ?auto_182670 ) ) ( not ( = ?auto_182664 ?auto_182665 ) ) ( not ( = ?auto_182664 ?auto_182666 ) ) ( not ( = ?auto_182664 ?auto_182670 ) ) ( not ( = ?auto_182665 ?auto_182666 ) ) ( not ( = ?auto_182665 ?auto_182670 ) ) ( not ( = ?auto_182666 ?auto_182670 ) ) ( not ( = ?auto_182663 ?auto_182667 ) ) ( not ( = ?auto_182663 ?auto_182669 ) ) ( not ( = ?auto_182664 ?auto_182667 ) ) ( not ( = ?auto_182664 ?auto_182669 ) ) ( not ( = ?auto_182665 ?auto_182667 ) ) ( not ( = ?auto_182665 ?auto_182669 ) ) ( not ( = ?auto_182666 ?auto_182667 ) ) ( not ( = ?auto_182666 ?auto_182669 ) ) ( not ( = ?auto_182670 ?auto_182667 ) ) ( not ( = ?auto_182670 ?auto_182669 ) ) ( not ( = ?auto_182667 ?auto_182669 ) ) ( ON ?auto_182667 ?auto_182670 ) ( CLEAR ?auto_182668 ) ( ON-TABLE ?auto_182668 ) ( not ( = ?auto_182668 ?auto_182669 ) ) ( not ( = ?auto_182663 ?auto_182668 ) ) ( not ( = ?auto_182664 ?auto_182668 ) ) ( not ( = ?auto_182665 ?auto_182668 ) ) ( not ( = ?auto_182666 ?auto_182668 ) ) ( not ( = ?auto_182670 ?auto_182668 ) ) ( not ( = ?auto_182667 ?auto_182668 ) ) ( ON ?auto_182669 ?auto_182667 ) ( CLEAR ?auto_182669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_182663 ?auto_182664 ?auto_182665 ?auto_182666 ?auto_182670 ?auto_182667 )
      ( MAKE-4PILE ?auto_182663 ?auto_182664 ?auto_182665 ?auto_182666 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182671 - BLOCK
      ?auto_182672 - BLOCK
      ?auto_182673 - BLOCK
      ?auto_182674 - BLOCK
    )
    :vars
    (
      ?auto_182676 - BLOCK
      ?auto_182678 - BLOCK
      ?auto_182677 - BLOCK
      ?auto_182675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182676 ?auto_182674 ) ( ON-TABLE ?auto_182671 ) ( ON ?auto_182672 ?auto_182671 ) ( ON ?auto_182673 ?auto_182672 ) ( ON ?auto_182674 ?auto_182673 ) ( not ( = ?auto_182671 ?auto_182672 ) ) ( not ( = ?auto_182671 ?auto_182673 ) ) ( not ( = ?auto_182671 ?auto_182674 ) ) ( not ( = ?auto_182671 ?auto_182676 ) ) ( not ( = ?auto_182672 ?auto_182673 ) ) ( not ( = ?auto_182672 ?auto_182674 ) ) ( not ( = ?auto_182672 ?auto_182676 ) ) ( not ( = ?auto_182673 ?auto_182674 ) ) ( not ( = ?auto_182673 ?auto_182676 ) ) ( not ( = ?auto_182674 ?auto_182676 ) ) ( not ( = ?auto_182671 ?auto_182678 ) ) ( not ( = ?auto_182671 ?auto_182677 ) ) ( not ( = ?auto_182672 ?auto_182678 ) ) ( not ( = ?auto_182672 ?auto_182677 ) ) ( not ( = ?auto_182673 ?auto_182678 ) ) ( not ( = ?auto_182673 ?auto_182677 ) ) ( not ( = ?auto_182674 ?auto_182678 ) ) ( not ( = ?auto_182674 ?auto_182677 ) ) ( not ( = ?auto_182676 ?auto_182678 ) ) ( not ( = ?auto_182676 ?auto_182677 ) ) ( not ( = ?auto_182678 ?auto_182677 ) ) ( ON ?auto_182678 ?auto_182676 ) ( not ( = ?auto_182675 ?auto_182677 ) ) ( not ( = ?auto_182671 ?auto_182675 ) ) ( not ( = ?auto_182672 ?auto_182675 ) ) ( not ( = ?auto_182673 ?auto_182675 ) ) ( not ( = ?auto_182674 ?auto_182675 ) ) ( not ( = ?auto_182676 ?auto_182675 ) ) ( not ( = ?auto_182678 ?auto_182675 ) ) ( ON ?auto_182677 ?auto_182678 ) ( CLEAR ?auto_182677 ) ( HOLDING ?auto_182675 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_182675 )
      ( MAKE-4PILE ?auto_182671 ?auto_182672 ?auto_182673 ?auto_182674 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182691 - BLOCK
      ?auto_182692 - BLOCK
      ?auto_182693 - BLOCK
      ?auto_182694 - BLOCK
    )
    :vars
    (
      ?auto_182697 - BLOCK
      ?auto_182696 - BLOCK
      ?auto_182695 - BLOCK
      ?auto_182698 - BLOCK
      ?auto_182699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182697 ?auto_182694 ) ( ON-TABLE ?auto_182691 ) ( ON ?auto_182692 ?auto_182691 ) ( ON ?auto_182693 ?auto_182692 ) ( ON ?auto_182694 ?auto_182693 ) ( not ( = ?auto_182691 ?auto_182692 ) ) ( not ( = ?auto_182691 ?auto_182693 ) ) ( not ( = ?auto_182691 ?auto_182694 ) ) ( not ( = ?auto_182691 ?auto_182697 ) ) ( not ( = ?auto_182692 ?auto_182693 ) ) ( not ( = ?auto_182692 ?auto_182694 ) ) ( not ( = ?auto_182692 ?auto_182697 ) ) ( not ( = ?auto_182693 ?auto_182694 ) ) ( not ( = ?auto_182693 ?auto_182697 ) ) ( not ( = ?auto_182694 ?auto_182697 ) ) ( not ( = ?auto_182691 ?auto_182696 ) ) ( not ( = ?auto_182691 ?auto_182695 ) ) ( not ( = ?auto_182692 ?auto_182696 ) ) ( not ( = ?auto_182692 ?auto_182695 ) ) ( not ( = ?auto_182693 ?auto_182696 ) ) ( not ( = ?auto_182693 ?auto_182695 ) ) ( not ( = ?auto_182694 ?auto_182696 ) ) ( not ( = ?auto_182694 ?auto_182695 ) ) ( not ( = ?auto_182697 ?auto_182696 ) ) ( not ( = ?auto_182697 ?auto_182695 ) ) ( not ( = ?auto_182696 ?auto_182695 ) ) ( ON ?auto_182696 ?auto_182697 ) ( not ( = ?auto_182698 ?auto_182695 ) ) ( not ( = ?auto_182691 ?auto_182698 ) ) ( not ( = ?auto_182692 ?auto_182698 ) ) ( not ( = ?auto_182693 ?auto_182698 ) ) ( not ( = ?auto_182694 ?auto_182698 ) ) ( not ( = ?auto_182697 ?auto_182698 ) ) ( not ( = ?auto_182696 ?auto_182698 ) ) ( ON ?auto_182695 ?auto_182696 ) ( CLEAR ?auto_182695 ) ( ON ?auto_182698 ?auto_182699 ) ( CLEAR ?auto_182698 ) ( HAND-EMPTY ) ( not ( = ?auto_182691 ?auto_182699 ) ) ( not ( = ?auto_182692 ?auto_182699 ) ) ( not ( = ?auto_182693 ?auto_182699 ) ) ( not ( = ?auto_182694 ?auto_182699 ) ) ( not ( = ?auto_182697 ?auto_182699 ) ) ( not ( = ?auto_182696 ?auto_182699 ) ) ( not ( = ?auto_182695 ?auto_182699 ) ) ( not ( = ?auto_182698 ?auto_182699 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_182698 ?auto_182699 )
      ( MAKE-4PILE ?auto_182691 ?auto_182692 ?auto_182693 ?auto_182694 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182700 - BLOCK
      ?auto_182701 - BLOCK
      ?auto_182702 - BLOCK
      ?auto_182703 - BLOCK
    )
    :vars
    (
      ?auto_182706 - BLOCK
      ?auto_182707 - BLOCK
      ?auto_182705 - BLOCK
      ?auto_182708 - BLOCK
      ?auto_182704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182706 ?auto_182703 ) ( ON-TABLE ?auto_182700 ) ( ON ?auto_182701 ?auto_182700 ) ( ON ?auto_182702 ?auto_182701 ) ( ON ?auto_182703 ?auto_182702 ) ( not ( = ?auto_182700 ?auto_182701 ) ) ( not ( = ?auto_182700 ?auto_182702 ) ) ( not ( = ?auto_182700 ?auto_182703 ) ) ( not ( = ?auto_182700 ?auto_182706 ) ) ( not ( = ?auto_182701 ?auto_182702 ) ) ( not ( = ?auto_182701 ?auto_182703 ) ) ( not ( = ?auto_182701 ?auto_182706 ) ) ( not ( = ?auto_182702 ?auto_182703 ) ) ( not ( = ?auto_182702 ?auto_182706 ) ) ( not ( = ?auto_182703 ?auto_182706 ) ) ( not ( = ?auto_182700 ?auto_182707 ) ) ( not ( = ?auto_182700 ?auto_182705 ) ) ( not ( = ?auto_182701 ?auto_182707 ) ) ( not ( = ?auto_182701 ?auto_182705 ) ) ( not ( = ?auto_182702 ?auto_182707 ) ) ( not ( = ?auto_182702 ?auto_182705 ) ) ( not ( = ?auto_182703 ?auto_182707 ) ) ( not ( = ?auto_182703 ?auto_182705 ) ) ( not ( = ?auto_182706 ?auto_182707 ) ) ( not ( = ?auto_182706 ?auto_182705 ) ) ( not ( = ?auto_182707 ?auto_182705 ) ) ( ON ?auto_182707 ?auto_182706 ) ( not ( = ?auto_182708 ?auto_182705 ) ) ( not ( = ?auto_182700 ?auto_182708 ) ) ( not ( = ?auto_182701 ?auto_182708 ) ) ( not ( = ?auto_182702 ?auto_182708 ) ) ( not ( = ?auto_182703 ?auto_182708 ) ) ( not ( = ?auto_182706 ?auto_182708 ) ) ( not ( = ?auto_182707 ?auto_182708 ) ) ( ON ?auto_182708 ?auto_182704 ) ( CLEAR ?auto_182708 ) ( not ( = ?auto_182700 ?auto_182704 ) ) ( not ( = ?auto_182701 ?auto_182704 ) ) ( not ( = ?auto_182702 ?auto_182704 ) ) ( not ( = ?auto_182703 ?auto_182704 ) ) ( not ( = ?auto_182706 ?auto_182704 ) ) ( not ( = ?auto_182707 ?auto_182704 ) ) ( not ( = ?auto_182705 ?auto_182704 ) ) ( not ( = ?auto_182708 ?auto_182704 ) ) ( HOLDING ?auto_182705 ) ( CLEAR ?auto_182707 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182700 ?auto_182701 ?auto_182702 ?auto_182703 ?auto_182706 ?auto_182707 ?auto_182705 )
      ( MAKE-4PILE ?auto_182700 ?auto_182701 ?auto_182702 ?auto_182703 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182782 - BLOCK
      ?auto_182783 - BLOCK
      ?auto_182784 - BLOCK
      ?auto_182785 - BLOCK
    )
    :vars
    (
      ?auto_182786 - BLOCK
      ?auto_182788 - BLOCK
      ?auto_182789 - BLOCK
      ?auto_182787 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182782 ) ( ON ?auto_182783 ?auto_182782 ) ( not ( = ?auto_182782 ?auto_182783 ) ) ( not ( = ?auto_182782 ?auto_182784 ) ) ( not ( = ?auto_182782 ?auto_182785 ) ) ( not ( = ?auto_182783 ?auto_182784 ) ) ( not ( = ?auto_182783 ?auto_182785 ) ) ( not ( = ?auto_182784 ?auto_182785 ) ) ( ON ?auto_182785 ?auto_182786 ) ( not ( = ?auto_182782 ?auto_182786 ) ) ( not ( = ?auto_182783 ?auto_182786 ) ) ( not ( = ?auto_182784 ?auto_182786 ) ) ( not ( = ?auto_182785 ?auto_182786 ) ) ( CLEAR ?auto_182783 ) ( ON ?auto_182784 ?auto_182785 ) ( CLEAR ?auto_182784 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_182788 ) ( ON ?auto_182789 ?auto_182788 ) ( ON ?auto_182787 ?auto_182789 ) ( ON ?auto_182786 ?auto_182787 ) ( not ( = ?auto_182788 ?auto_182789 ) ) ( not ( = ?auto_182788 ?auto_182787 ) ) ( not ( = ?auto_182788 ?auto_182786 ) ) ( not ( = ?auto_182788 ?auto_182785 ) ) ( not ( = ?auto_182788 ?auto_182784 ) ) ( not ( = ?auto_182789 ?auto_182787 ) ) ( not ( = ?auto_182789 ?auto_182786 ) ) ( not ( = ?auto_182789 ?auto_182785 ) ) ( not ( = ?auto_182789 ?auto_182784 ) ) ( not ( = ?auto_182787 ?auto_182786 ) ) ( not ( = ?auto_182787 ?auto_182785 ) ) ( not ( = ?auto_182787 ?auto_182784 ) ) ( not ( = ?auto_182782 ?auto_182788 ) ) ( not ( = ?auto_182782 ?auto_182789 ) ) ( not ( = ?auto_182782 ?auto_182787 ) ) ( not ( = ?auto_182783 ?auto_182788 ) ) ( not ( = ?auto_182783 ?auto_182789 ) ) ( not ( = ?auto_182783 ?auto_182787 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182788 ?auto_182789 ?auto_182787 ?auto_182786 ?auto_182785 )
      ( MAKE-4PILE ?auto_182782 ?auto_182783 ?auto_182784 ?auto_182785 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182790 - BLOCK
      ?auto_182791 - BLOCK
      ?auto_182792 - BLOCK
      ?auto_182793 - BLOCK
    )
    :vars
    (
      ?auto_182797 - BLOCK
      ?auto_182795 - BLOCK
      ?auto_182794 - BLOCK
      ?auto_182796 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182790 ) ( not ( = ?auto_182790 ?auto_182791 ) ) ( not ( = ?auto_182790 ?auto_182792 ) ) ( not ( = ?auto_182790 ?auto_182793 ) ) ( not ( = ?auto_182791 ?auto_182792 ) ) ( not ( = ?auto_182791 ?auto_182793 ) ) ( not ( = ?auto_182792 ?auto_182793 ) ) ( ON ?auto_182793 ?auto_182797 ) ( not ( = ?auto_182790 ?auto_182797 ) ) ( not ( = ?auto_182791 ?auto_182797 ) ) ( not ( = ?auto_182792 ?auto_182797 ) ) ( not ( = ?auto_182793 ?auto_182797 ) ) ( ON ?auto_182792 ?auto_182793 ) ( CLEAR ?auto_182792 ) ( ON-TABLE ?auto_182795 ) ( ON ?auto_182794 ?auto_182795 ) ( ON ?auto_182796 ?auto_182794 ) ( ON ?auto_182797 ?auto_182796 ) ( not ( = ?auto_182795 ?auto_182794 ) ) ( not ( = ?auto_182795 ?auto_182796 ) ) ( not ( = ?auto_182795 ?auto_182797 ) ) ( not ( = ?auto_182795 ?auto_182793 ) ) ( not ( = ?auto_182795 ?auto_182792 ) ) ( not ( = ?auto_182794 ?auto_182796 ) ) ( not ( = ?auto_182794 ?auto_182797 ) ) ( not ( = ?auto_182794 ?auto_182793 ) ) ( not ( = ?auto_182794 ?auto_182792 ) ) ( not ( = ?auto_182796 ?auto_182797 ) ) ( not ( = ?auto_182796 ?auto_182793 ) ) ( not ( = ?auto_182796 ?auto_182792 ) ) ( not ( = ?auto_182790 ?auto_182795 ) ) ( not ( = ?auto_182790 ?auto_182794 ) ) ( not ( = ?auto_182790 ?auto_182796 ) ) ( not ( = ?auto_182791 ?auto_182795 ) ) ( not ( = ?auto_182791 ?auto_182794 ) ) ( not ( = ?auto_182791 ?auto_182796 ) ) ( HOLDING ?auto_182791 ) ( CLEAR ?auto_182790 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182790 ?auto_182791 )
      ( MAKE-4PILE ?auto_182790 ?auto_182791 ?auto_182792 ?auto_182793 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182798 - BLOCK
      ?auto_182799 - BLOCK
      ?auto_182800 - BLOCK
      ?auto_182801 - BLOCK
    )
    :vars
    (
      ?auto_182804 - BLOCK
      ?auto_182805 - BLOCK
      ?auto_182802 - BLOCK
      ?auto_182803 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182798 ) ( not ( = ?auto_182798 ?auto_182799 ) ) ( not ( = ?auto_182798 ?auto_182800 ) ) ( not ( = ?auto_182798 ?auto_182801 ) ) ( not ( = ?auto_182799 ?auto_182800 ) ) ( not ( = ?auto_182799 ?auto_182801 ) ) ( not ( = ?auto_182800 ?auto_182801 ) ) ( ON ?auto_182801 ?auto_182804 ) ( not ( = ?auto_182798 ?auto_182804 ) ) ( not ( = ?auto_182799 ?auto_182804 ) ) ( not ( = ?auto_182800 ?auto_182804 ) ) ( not ( = ?auto_182801 ?auto_182804 ) ) ( ON ?auto_182800 ?auto_182801 ) ( ON-TABLE ?auto_182805 ) ( ON ?auto_182802 ?auto_182805 ) ( ON ?auto_182803 ?auto_182802 ) ( ON ?auto_182804 ?auto_182803 ) ( not ( = ?auto_182805 ?auto_182802 ) ) ( not ( = ?auto_182805 ?auto_182803 ) ) ( not ( = ?auto_182805 ?auto_182804 ) ) ( not ( = ?auto_182805 ?auto_182801 ) ) ( not ( = ?auto_182805 ?auto_182800 ) ) ( not ( = ?auto_182802 ?auto_182803 ) ) ( not ( = ?auto_182802 ?auto_182804 ) ) ( not ( = ?auto_182802 ?auto_182801 ) ) ( not ( = ?auto_182802 ?auto_182800 ) ) ( not ( = ?auto_182803 ?auto_182804 ) ) ( not ( = ?auto_182803 ?auto_182801 ) ) ( not ( = ?auto_182803 ?auto_182800 ) ) ( not ( = ?auto_182798 ?auto_182805 ) ) ( not ( = ?auto_182798 ?auto_182802 ) ) ( not ( = ?auto_182798 ?auto_182803 ) ) ( not ( = ?auto_182799 ?auto_182805 ) ) ( not ( = ?auto_182799 ?auto_182802 ) ) ( not ( = ?auto_182799 ?auto_182803 ) ) ( CLEAR ?auto_182798 ) ( ON ?auto_182799 ?auto_182800 ) ( CLEAR ?auto_182799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_182805 ?auto_182802 ?auto_182803 ?auto_182804 ?auto_182801 ?auto_182800 )
      ( MAKE-4PILE ?auto_182798 ?auto_182799 ?auto_182800 ?auto_182801 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182806 - BLOCK
      ?auto_182807 - BLOCK
      ?auto_182808 - BLOCK
      ?auto_182809 - BLOCK
    )
    :vars
    (
      ?auto_182813 - BLOCK
      ?auto_182810 - BLOCK
      ?auto_182811 - BLOCK
      ?auto_182812 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182806 ?auto_182807 ) ) ( not ( = ?auto_182806 ?auto_182808 ) ) ( not ( = ?auto_182806 ?auto_182809 ) ) ( not ( = ?auto_182807 ?auto_182808 ) ) ( not ( = ?auto_182807 ?auto_182809 ) ) ( not ( = ?auto_182808 ?auto_182809 ) ) ( ON ?auto_182809 ?auto_182813 ) ( not ( = ?auto_182806 ?auto_182813 ) ) ( not ( = ?auto_182807 ?auto_182813 ) ) ( not ( = ?auto_182808 ?auto_182813 ) ) ( not ( = ?auto_182809 ?auto_182813 ) ) ( ON ?auto_182808 ?auto_182809 ) ( ON-TABLE ?auto_182810 ) ( ON ?auto_182811 ?auto_182810 ) ( ON ?auto_182812 ?auto_182811 ) ( ON ?auto_182813 ?auto_182812 ) ( not ( = ?auto_182810 ?auto_182811 ) ) ( not ( = ?auto_182810 ?auto_182812 ) ) ( not ( = ?auto_182810 ?auto_182813 ) ) ( not ( = ?auto_182810 ?auto_182809 ) ) ( not ( = ?auto_182810 ?auto_182808 ) ) ( not ( = ?auto_182811 ?auto_182812 ) ) ( not ( = ?auto_182811 ?auto_182813 ) ) ( not ( = ?auto_182811 ?auto_182809 ) ) ( not ( = ?auto_182811 ?auto_182808 ) ) ( not ( = ?auto_182812 ?auto_182813 ) ) ( not ( = ?auto_182812 ?auto_182809 ) ) ( not ( = ?auto_182812 ?auto_182808 ) ) ( not ( = ?auto_182806 ?auto_182810 ) ) ( not ( = ?auto_182806 ?auto_182811 ) ) ( not ( = ?auto_182806 ?auto_182812 ) ) ( not ( = ?auto_182807 ?auto_182810 ) ) ( not ( = ?auto_182807 ?auto_182811 ) ) ( not ( = ?auto_182807 ?auto_182812 ) ) ( ON ?auto_182807 ?auto_182808 ) ( CLEAR ?auto_182807 ) ( HOLDING ?auto_182806 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_182806 )
      ( MAKE-4PILE ?auto_182806 ?auto_182807 ?auto_182808 ?auto_182809 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182814 - BLOCK
      ?auto_182815 - BLOCK
      ?auto_182816 - BLOCK
      ?auto_182817 - BLOCK
    )
    :vars
    (
      ?auto_182819 - BLOCK
      ?auto_182821 - BLOCK
      ?auto_182818 - BLOCK
      ?auto_182820 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182814 ?auto_182815 ) ) ( not ( = ?auto_182814 ?auto_182816 ) ) ( not ( = ?auto_182814 ?auto_182817 ) ) ( not ( = ?auto_182815 ?auto_182816 ) ) ( not ( = ?auto_182815 ?auto_182817 ) ) ( not ( = ?auto_182816 ?auto_182817 ) ) ( ON ?auto_182817 ?auto_182819 ) ( not ( = ?auto_182814 ?auto_182819 ) ) ( not ( = ?auto_182815 ?auto_182819 ) ) ( not ( = ?auto_182816 ?auto_182819 ) ) ( not ( = ?auto_182817 ?auto_182819 ) ) ( ON ?auto_182816 ?auto_182817 ) ( ON-TABLE ?auto_182821 ) ( ON ?auto_182818 ?auto_182821 ) ( ON ?auto_182820 ?auto_182818 ) ( ON ?auto_182819 ?auto_182820 ) ( not ( = ?auto_182821 ?auto_182818 ) ) ( not ( = ?auto_182821 ?auto_182820 ) ) ( not ( = ?auto_182821 ?auto_182819 ) ) ( not ( = ?auto_182821 ?auto_182817 ) ) ( not ( = ?auto_182821 ?auto_182816 ) ) ( not ( = ?auto_182818 ?auto_182820 ) ) ( not ( = ?auto_182818 ?auto_182819 ) ) ( not ( = ?auto_182818 ?auto_182817 ) ) ( not ( = ?auto_182818 ?auto_182816 ) ) ( not ( = ?auto_182820 ?auto_182819 ) ) ( not ( = ?auto_182820 ?auto_182817 ) ) ( not ( = ?auto_182820 ?auto_182816 ) ) ( not ( = ?auto_182814 ?auto_182821 ) ) ( not ( = ?auto_182814 ?auto_182818 ) ) ( not ( = ?auto_182814 ?auto_182820 ) ) ( not ( = ?auto_182815 ?auto_182821 ) ) ( not ( = ?auto_182815 ?auto_182818 ) ) ( not ( = ?auto_182815 ?auto_182820 ) ) ( ON ?auto_182815 ?auto_182816 ) ( ON ?auto_182814 ?auto_182815 ) ( CLEAR ?auto_182814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182821 ?auto_182818 ?auto_182820 ?auto_182819 ?auto_182817 ?auto_182816 ?auto_182815 )
      ( MAKE-4PILE ?auto_182814 ?auto_182815 ?auto_182816 ?auto_182817 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182826 - BLOCK
      ?auto_182827 - BLOCK
      ?auto_182828 - BLOCK
      ?auto_182829 - BLOCK
    )
    :vars
    (
      ?auto_182831 - BLOCK
      ?auto_182833 - BLOCK
      ?auto_182830 - BLOCK
      ?auto_182832 - BLOCK
      ?auto_182834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182826 ?auto_182827 ) ) ( not ( = ?auto_182826 ?auto_182828 ) ) ( not ( = ?auto_182826 ?auto_182829 ) ) ( not ( = ?auto_182827 ?auto_182828 ) ) ( not ( = ?auto_182827 ?auto_182829 ) ) ( not ( = ?auto_182828 ?auto_182829 ) ) ( ON ?auto_182829 ?auto_182831 ) ( not ( = ?auto_182826 ?auto_182831 ) ) ( not ( = ?auto_182827 ?auto_182831 ) ) ( not ( = ?auto_182828 ?auto_182831 ) ) ( not ( = ?auto_182829 ?auto_182831 ) ) ( ON ?auto_182828 ?auto_182829 ) ( ON-TABLE ?auto_182833 ) ( ON ?auto_182830 ?auto_182833 ) ( ON ?auto_182832 ?auto_182830 ) ( ON ?auto_182831 ?auto_182832 ) ( not ( = ?auto_182833 ?auto_182830 ) ) ( not ( = ?auto_182833 ?auto_182832 ) ) ( not ( = ?auto_182833 ?auto_182831 ) ) ( not ( = ?auto_182833 ?auto_182829 ) ) ( not ( = ?auto_182833 ?auto_182828 ) ) ( not ( = ?auto_182830 ?auto_182832 ) ) ( not ( = ?auto_182830 ?auto_182831 ) ) ( not ( = ?auto_182830 ?auto_182829 ) ) ( not ( = ?auto_182830 ?auto_182828 ) ) ( not ( = ?auto_182832 ?auto_182831 ) ) ( not ( = ?auto_182832 ?auto_182829 ) ) ( not ( = ?auto_182832 ?auto_182828 ) ) ( not ( = ?auto_182826 ?auto_182833 ) ) ( not ( = ?auto_182826 ?auto_182830 ) ) ( not ( = ?auto_182826 ?auto_182832 ) ) ( not ( = ?auto_182827 ?auto_182833 ) ) ( not ( = ?auto_182827 ?auto_182830 ) ) ( not ( = ?auto_182827 ?auto_182832 ) ) ( ON ?auto_182827 ?auto_182828 ) ( CLEAR ?auto_182827 ) ( ON ?auto_182826 ?auto_182834 ) ( CLEAR ?auto_182826 ) ( HAND-EMPTY ) ( not ( = ?auto_182826 ?auto_182834 ) ) ( not ( = ?auto_182827 ?auto_182834 ) ) ( not ( = ?auto_182828 ?auto_182834 ) ) ( not ( = ?auto_182829 ?auto_182834 ) ) ( not ( = ?auto_182831 ?auto_182834 ) ) ( not ( = ?auto_182833 ?auto_182834 ) ) ( not ( = ?auto_182830 ?auto_182834 ) ) ( not ( = ?auto_182832 ?auto_182834 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_182826 ?auto_182834 )
      ( MAKE-4PILE ?auto_182826 ?auto_182827 ?auto_182828 ?auto_182829 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182835 - BLOCK
      ?auto_182836 - BLOCK
      ?auto_182837 - BLOCK
      ?auto_182838 - BLOCK
    )
    :vars
    (
      ?auto_182840 - BLOCK
      ?auto_182839 - BLOCK
      ?auto_182842 - BLOCK
      ?auto_182843 - BLOCK
      ?auto_182841 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182835 ?auto_182836 ) ) ( not ( = ?auto_182835 ?auto_182837 ) ) ( not ( = ?auto_182835 ?auto_182838 ) ) ( not ( = ?auto_182836 ?auto_182837 ) ) ( not ( = ?auto_182836 ?auto_182838 ) ) ( not ( = ?auto_182837 ?auto_182838 ) ) ( ON ?auto_182838 ?auto_182840 ) ( not ( = ?auto_182835 ?auto_182840 ) ) ( not ( = ?auto_182836 ?auto_182840 ) ) ( not ( = ?auto_182837 ?auto_182840 ) ) ( not ( = ?auto_182838 ?auto_182840 ) ) ( ON ?auto_182837 ?auto_182838 ) ( ON-TABLE ?auto_182839 ) ( ON ?auto_182842 ?auto_182839 ) ( ON ?auto_182843 ?auto_182842 ) ( ON ?auto_182840 ?auto_182843 ) ( not ( = ?auto_182839 ?auto_182842 ) ) ( not ( = ?auto_182839 ?auto_182843 ) ) ( not ( = ?auto_182839 ?auto_182840 ) ) ( not ( = ?auto_182839 ?auto_182838 ) ) ( not ( = ?auto_182839 ?auto_182837 ) ) ( not ( = ?auto_182842 ?auto_182843 ) ) ( not ( = ?auto_182842 ?auto_182840 ) ) ( not ( = ?auto_182842 ?auto_182838 ) ) ( not ( = ?auto_182842 ?auto_182837 ) ) ( not ( = ?auto_182843 ?auto_182840 ) ) ( not ( = ?auto_182843 ?auto_182838 ) ) ( not ( = ?auto_182843 ?auto_182837 ) ) ( not ( = ?auto_182835 ?auto_182839 ) ) ( not ( = ?auto_182835 ?auto_182842 ) ) ( not ( = ?auto_182835 ?auto_182843 ) ) ( not ( = ?auto_182836 ?auto_182839 ) ) ( not ( = ?auto_182836 ?auto_182842 ) ) ( not ( = ?auto_182836 ?auto_182843 ) ) ( ON ?auto_182835 ?auto_182841 ) ( CLEAR ?auto_182835 ) ( not ( = ?auto_182835 ?auto_182841 ) ) ( not ( = ?auto_182836 ?auto_182841 ) ) ( not ( = ?auto_182837 ?auto_182841 ) ) ( not ( = ?auto_182838 ?auto_182841 ) ) ( not ( = ?auto_182840 ?auto_182841 ) ) ( not ( = ?auto_182839 ?auto_182841 ) ) ( not ( = ?auto_182842 ?auto_182841 ) ) ( not ( = ?auto_182843 ?auto_182841 ) ) ( HOLDING ?auto_182836 ) ( CLEAR ?auto_182837 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182839 ?auto_182842 ?auto_182843 ?auto_182840 ?auto_182838 ?auto_182837 ?auto_182836 )
      ( MAKE-4PILE ?auto_182835 ?auto_182836 ?auto_182837 ?auto_182838 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182844 - BLOCK
      ?auto_182845 - BLOCK
      ?auto_182846 - BLOCK
      ?auto_182847 - BLOCK
    )
    :vars
    (
      ?auto_182848 - BLOCK
      ?auto_182850 - BLOCK
      ?auto_182849 - BLOCK
      ?auto_182852 - BLOCK
      ?auto_182851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182844 ?auto_182845 ) ) ( not ( = ?auto_182844 ?auto_182846 ) ) ( not ( = ?auto_182844 ?auto_182847 ) ) ( not ( = ?auto_182845 ?auto_182846 ) ) ( not ( = ?auto_182845 ?auto_182847 ) ) ( not ( = ?auto_182846 ?auto_182847 ) ) ( ON ?auto_182847 ?auto_182848 ) ( not ( = ?auto_182844 ?auto_182848 ) ) ( not ( = ?auto_182845 ?auto_182848 ) ) ( not ( = ?auto_182846 ?auto_182848 ) ) ( not ( = ?auto_182847 ?auto_182848 ) ) ( ON ?auto_182846 ?auto_182847 ) ( ON-TABLE ?auto_182850 ) ( ON ?auto_182849 ?auto_182850 ) ( ON ?auto_182852 ?auto_182849 ) ( ON ?auto_182848 ?auto_182852 ) ( not ( = ?auto_182850 ?auto_182849 ) ) ( not ( = ?auto_182850 ?auto_182852 ) ) ( not ( = ?auto_182850 ?auto_182848 ) ) ( not ( = ?auto_182850 ?auto_182847 ) ) ( not ( = ?auto_182850 ?auto_182846 ) ) ( not ( = ?auto_182849 ?auto_182852 ) ) ( not ( = ?auto_182849 ?auto_182848 ) ) ( not ( = ?auto_182849 ?auto_182847 ) ) ( not ( = ?auto_182849 ?auto_182846 ) ) ( not ( = ?auto_182852 ?auto_182848 ) ) ( not ( = ?auto_182852 ?auto_182847 ) ) ( not ( = ?auto_182852 ?auto_182846 ) ) ( not ( = ?auto_182844 ?auto_182850 ) ) ( not ( = ?auto_182844 ?auto_182849 ) ) ( not ( = ?auto_182844 ?auto_182852 ) ) ( not ( = ?auto_182845 ?auto_182850 ) ) ( not ( = ?auto_182845 ?auto_182849 ) ) ( not ( = ?auto_182845 ?auto_182852 ) ) ( ON ?auto_182844 ?auto_182851 ) ( not ( = ?auto_182844 ?auto_182851 ) ) ( not ( = ?auto_182845 ?auto_182851 ) ) ( not ( = ?auto_182846 ?auto_182851 ) ) ( not ( = ?auto_182847 ?auto_182851 ) ) ( not ( = ?auto_182848 ?auto_182851 ) ) ( not ( = ?auto_182850 ?auto_182851 ) ) ( not ( = ?auto_182849 ?auto_182851 ) ) ( not ( = ?auto_182852 ?auto_182851 ) ) ( CLEAR ?auto_182846 ) ( ON ?auto_182845 ?auto_182844 ) ( CLEAR ?auto_182845 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_182851 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182851 ?auto_182844 )
      ( MAKE-4PILE ?auto_182844 ?auto_182845 ?auto_182846 ?auto_182847 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182853 - BLOCK
      ?auto_182854 - BLOCK
      ?auto_182855 - BLOCK
      ?auto_182856 - BLOCK
    )
    :vars
    (
      ?auto_182861 - BLOCK
      ?auto_182857 - BLOCK
      ?auto_182860 - BLOCK
      ?auto_182858 - BLOCK
      ?auto_182859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182853 ?auto_182854 ) ) ( not ( = ?auto_182853 ?auto_182855 ) ) ( not ( = ?auto_182853 ?auto_182856 ) ) ( not ( = ?auto_182854 ?auto_182855 ) ) ( not ( = ?auto_182854 ?auto_182856 ) ) ( not ( = ?auto_182855 ?auto_182856 ) ) ( ON ?auto_182856 ?auto_182861 ) ( not ( = ?auto_182853 ?auto_182861 ) ) ( not ( = ?auto_182854 ?auto_182861 ) ) ( not ( = ?auto_182855 ?auto_182861 ) ) ( not ( = ?auto_182856 ?auto_182861 ) ) ( ON-TABLE ?auto_182857 ) ( ON ?auto_182860 ?auto_182857 ) ( ON ?auto_182858 ?auto_182860 ) ( ON ?auto_182861 ?auto_182858 ) ( not ( = ?auto_182857 ?auto_182860 ) ) ( not ( = ?auto_182857 ?auto_182858 ) ) ( not ( = ?auto_182857 ?auto_182861 ) ) ( not ( = ?auto_182857 ?auto_182856 ) ) ( not ( = ?auto_182857 ?auto_182855 ) ) ( not ( = ?auto_182860 ?auto_182858 ) ) ( not ( = ?auto_182860 ?auto_182861 ) ) ( not ( = ?auto_182860 ?auto_182856 ) ) ( not ( = ?auto_182860 ?auto_182855 ) ) ( not ( = ?auto_182858 ?auto_182861 ) ) ( not ( = ?auto_182858 ?auto_182856 ) ) ( not ( = ?auto_182858 ?auto_182855 ) ) ( not ( = ?auto_182853 ?auto_182857 ) ) ( not ( = ?auto_182853 ?auto_182860 ) ) ( not ( = ?auto_182853 ?auto_182858 ) ) ( not ( = ?auto_182854 ?auto_182857 ) ) ( not ( = ?auto_182854 ?auto_182860 ) ) ( not ( = ?auto_182854 ?auto_182858 ) ) ( ON ?auto_182853 ?auto_182859 ) ( not ( = ?auto_182853 ?auto_182859 ) ) ( not ( = ?auto_182854 ?auto_182859 ) ) ( not ( = ?auto_182855 ?auto_182859 ) ) ( not ( = ?auto_182856 ?auto_182859 ) ) ( not ( = ?auto_182861 ?auto_182859 ) ) ( not ( = ?auto_182857 ?auto_182859 ) ) ( not ( = ?auto_182860 ?auto_182859 ) ) ( not ( = ?auto_182858 ?auto_182859 ) ) ( ON ?auto_182854 ?auto_182853 ) ( CLEAR ?auto_182854 ) ( ON-TABLE ?auto_182859 ) ( HOLDING ?auto_182855 ) ( CLEAR ?auto_182856 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_182857 ?auto_182860 ?auto_182858 ?auto_182861 ?auto_182856 ?auto_182855 )
      ( MAKE-4PILE ?auto_182853 ?auto_182854 ?auto_182855 ?auto_182856 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182862 - BLOCK
      ?auto_182863 - BLOCK
      ?auto_182864 - BLOCK
      ?auto_182865 - BLOCK
    )
    :vars
    (
      ?auto_182870 - BLOCK
      ?auto_182867 - BLOCK
      ?auto_182868 - BLOCK
      ?auto_182866 - BLOCK
      ?auto_182869 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182862 ?auto_182863 ) ) ( not ( = ?auto_182862 ?auto_182864 ) ) ( not ( = ?auto_182862 ?auto_182865 ) ) ( not ( = ?auto_182863 ?auto_182864 ) ) ( not ( = ?auto_182863 ?auto_182865 ) ) ( not ( = ?auto_182864 ?auto_182865 ) ) ( ON ?auto_182865 ?auto_182870 ) ( not ( = ?auto_182862 ?auto_182870 ) ) ( not ( = ?auto_182863 ?auto_182870 ) ) ( not ( = ?auto_182864 ?auto_182870 ) ) ( not ( = ?auto_182865 ?auto_182870 ) ) ( ON-TABLE ?auto_182867 ) ( ON ?auto_182868 ?auto_182867 ) ( ON ?auto_182866 ?auto_182868 ) ( ON ?auto_182870 ?auto_182866 ) ( not ( = ?auto_182867 ?auto_182868 ) ) ( not ( = ?auto_182867 ?auto_182866 ) ) ( not ( = ?auto_182867 ?auto_182870 ) ) ( not ( = ?auto_182867 ?auto_182865 ) ) ( not ( = ?auto_182867 ?auto_182864 ) ) ( not ( = ?auto_182868 ?auto_182866 ) ) ( not ( = ?auto_182868 ?auto_182870 ) ) ( not ( = ?auto_182868 ?auto_182865 ) ) ( not ( = ?auto_182868 ?auto_182864 ) ) ( not ( = ?auto_182866 ?auto_182870 ) ) ( not ( = ?auto_182866 ?auto_182865 ) ) ( not ( = ?auto_182866 ?auto_182864 ) ) ( not ( = ?auto_182862 ?auto_182867 ) ) ( not ( = ?auto_182862 ?auto_182868 ) ) ( not ( = ?auto_182862 ?auto_182866 ) ) ( not ( = ?auto_182863 ?auto_182867 ) ) ( not ( = ?auto_182863 ?auto_182868 ) ) ( not ( = ?auto_182863 ?auto_182866 ) ) ( ON ?auto_182862 ?auto_182869 ) ( not ( = ?auto_182862 ?auto_182869 ) ) ( not ( = ?auto_182863 ?auto_182869 ) ) ( not ( = ?auto_182864 ?auto_182869 ) ) ( not ( = ?auto_182865 ?auto_182869 ) ) ( not ( = ?auto_182870 ?auto_182869 ) ) ( not ( = ?auto_182867 ?auto_182869 ) ) ( not ( = ?auto_182868 ?auto_182869 ) ) ( not ( = ?auto_182866 ?auto_182869 ) ) ( ON ?auto_182863 ?auto_182862 ) ( ON-TABLE ?auto_182869 ) ( CLEAR ?auto_182865 ) ( ON ?auto_182864 ?auto_182863 ) ( CLEAR ?auto_182864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182869 ?auto_182862 ?auto_182863 )
      ( MAKE-4PILE ?auto_182862 ?auto_182863 ?auto_182864 ?auto_182865 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182871 - BLOCK
      ?auto_182872 - BLOCK
      ?auto_182873 - BLOCK
      ?auto_182874 - BLOCK
    )
    :vars
    (
      ?auto_182875 - BLOCK
      ?auto_182878 - BLOCK
      ?auto_182877 - BLOCK
      ?auto_182879 - BLOCK
      ?auto_182876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182871 ?auto_182872 ) ) ( not ( = ?auto_182871 ?auto_182873 ) ) ( not ( = ?auto_182871 ?auto_182874 ) ) ( not ( = ?auto_182872 ?auto_182873 ) ) ( not ( = ?auto_182872 ?auto_182874 ) ) ( not ( = ?auto_182873 ?auto_182874 ) ) ( not ( = ?auto_182871 ?auto_182875 ) ) ( not ( = ?auto_182872 ?auto_182875 ) ) ( not ( = ?auto_182873 ?auto_182875 ) ) ( not ( = ?auto_182874 ?auto_182875 ) ) ( ON-TABLE ?auto_182878 ) ( ON ?auto_182877 ?auto_182878 ) ( ON ?auto_182879 ?auto_182877 ) ( ON ?auto_182875 ?auto_182879 ) ( not ( = ?auto_182878 ?auto_182877 ) ) ( not ( = ?auto_182878 ?auto_182879 ) ) ( not ( = ?auto_182878 ?auto_182875 ) ) ( not ( = ?auto_182878 ?auto_182874 ) ) ( not ( = ?auto_182878 ?auto_182873 ) ) ( not ( = ?auto_182877 ?auto_182879 ) ) ( not ( = ?auto_182877 ?auto_182875 ) ) ( not ( = ?auto_182877 ?auto_182874 ) ) ( not ( = ?auto_182877 ?auto_182873 ) ) ( not ( = ?auto_182879 ?auto_182875 ) ) ( not ( = ?auto_182879 ?auto_182874 ) ) ( not ( = ?auto_182879 ?auto_182873 ) ) ( not ( = ?auto_182871 ?auto_182878 ) ) ( not ( = ?auto_182871 ?auto_182877 ) ) ( not ( = ?auto_182871 ?auto_182879 ) ) ( not ( = ?auto_182872 ?auto_182878 ) ) ( not ( = ?auto_182872 ?auto_182877 ) ) ( not ( = ?auto_182872 ?auto_182879 ) ) ( ON ?auto_182871 ?auto_182876 ) ( not ( = ?auto_182871 ?auto_182876 ) ) ( not ( = ?auto_182872 ?auto_182876 ) ) ( not ( = ?auto_182873 ?auto_182876 ) ) ( not ( = ?auto_182874 ?auto_182876 ) ) ( not ( = ?auto_182875 ?auto_182876 ) ) ( not ( = ?auto_182878 ?auto_182876 ) ) ( not ( = ?auto_182877 ?auto_182876 ) ) ( not ( = ?auto_182879 ?auto_182876 ) ) ( ON ?auto_182872 ?auto_182871 ) ( ON-TABLE ?auto_182876 ) ( ON ?auto_182873 ?auto_182872 ) ( CLEAR ?auto_182873 ) ( HOLDING ?auto_182874 ) ( CLEAR ?auto_182875 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182878 ?auto_182877 ?auto_182879 ?auto_182875 ?auto_182874 )
      ( MAKE-4PILE ?auto_182871 ?auto_182872 ?auto_182873 ?auto_182874 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182880 - BLOCK
      ?auto_182881 - BLOCK
      ?auto_182882 - BLOCK
      ?auto_182883 - BLOCK
    )
    :vars
    (
      ?auto_182888 - BLOCK
      ?auto_182884 - BLOCK
      ?auto_182885 - BLOCK
      ?auto_182887 - BLOCK
      ?auto_182886 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182880 ?auto_182881 ) ) ( not ( = ?auto_182880 ?auto_182882 ) ) ( not ( = ?auto_182880 ?auto_182883 ) ) ( not ( = ?auto_182881 ?auto_182882 ) ) ( not ( = ?auto_182881 ?auto_182883 ) ) ( not ( = ?auto_182882 ?auto_182883 ) ) ( not ( = ?auto_182880 ?auto_182888 ) ) ( not ( = ?auto_182881 ?auto_182888 ) ) ( not ( = ?auto_182882 ?auto_182888 ) ) ( not ( = ?auto_182883 ?auto_182888 ) ) ( ON-TABLE ?auto_182884 ) ( ON ?auto_182885 ?auto_182884 ) ( ON ?auto_182887 ?auto_182885 ) ( ON ?auto_182888 ?auto_182887 ) ( not ( = ?auto_182884 ?auto_182885 ) ) ( not ( = ?auto_182884 ?auto_182887 ) ) ( not ( = ?auto_182884 ?auto_182888 ) ) ( not ( = ?auto_182884 ?auto_182883 ) ) ( not ( = ?auto_182884 ?auto_182882 ) ) ( not ( = ?auto_182885 ?auto_182887 ) ) ( not ( = ?auto_182885 ?auto_182888 ) ) ( not ( = ?auto_182885 ?auto_182883 ) ) ( not ( = ?auto_182885 ?auto_182882 ) ) ( not ( = ?auto_182887 ?auto_182888 ) ) ( not ( = ?auto_182887 ?auto_182883 ) ) ( not ( = ?auto_182887 ?auto_182882 ) ) ( not ( = ?auto_182880 ?auto_182884 ) ) ( not ( = ?auto_182880 ?auto_182885 ) ) ( not ( = ?auto_182880 ?auto_182887 ) ) ( not ( = ?auto_182881 ?auto_182884 ) ) ( not ( = ?auto_182881 ?auto_182885 ) ) ( not ( = ?auto_182881 ?auto_182887 ) ) ( ON ?auto_182880 ?auto_182886 ) ( not ( = ?auto_182880 ?auto_182886 ) ) ( not ( = ?auto_182881 ?auto_182886 ) ) ( not ( = ?auto_182882 ?auto_182886 ) ) ( not ( = ?auto_182883 ?auto_182886 ) ) ( not ( = ?auto_182888 ?auto_182886 ) ) ( not ( = ?auto_182884 ?auto_182886 ) ) ( not ( = ?auto_182885 ?auto_182886 ) ) ( not ( = ?auto_182887 ?auto_182886 ) ) ( ON ?auto_182881 ?auto_182880 ) ( ON-TABLE ?auto_182886 ) ( ON ?auto_182882 ?auto_182881 ) ( CLEAR ?auto_182888 ) ( ON ?auto_182883 ?auto_182882 ) ( CLEAR ?auto_182883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182886 ?auto_182880 ?auto_182881 ?auto_182882 )
      ( MAKE-4PILE ?auto_182880 ?auto_182881 ?auto_182882 ?auto_182883 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182889 - BLOCK
      ?auto_182890 - BLOCK
      ?auto_182891 - BLOCK
      ?auto_182892 - BLOCK
    )
    :vars
    (
      ?auto_182896 - BLOCK
      ?auto_182895 - BLOCK
      ?auto_182894 - BLOCK
      ?auto_182897 - BLOCK
      ?auto_182893 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182889 ?auto_182890 ) ) ( not ( = ?auto_182889 ?auto_182891 ) ) ( not ( = ?auto_182889 ?auto_182892 ) ) ( not ( = ?auto_182890 ?auto_182891 ) ) ( not ( = ?auto_182890 ?auto_182892 ) ) ( not ( = ?auto_182891 ?auto_182892 ) ) ( not ( = ?auto_182889 ?auto_182896 ) ) ( not ( = ?auto_182890 ?auto_182896 ) ) ( not ( = ?auto_182891 ?auto_182896 ) ) ( not ( = ?auto_182892 ?auto_182896 ) ) ( ON-TABLE ?auto_182895 ) ( ON ?auto_182894 ?auto_182895 ) ( ON ?auto_182897 ?auto_182894 ) ( not ( = ?auto_182895 ?auto_182894 ) ) ( not ( = ?auto_182895 ?auto_182897 ) ) ( not ( = ?auto_182895 ?auto_182896 ) ) ( not ( = ?auto_182895 ?auto_182892 ) ) ( not ( = ?auto_182895 ?auto_182891 ) ) ( not ( = ?auto_182894 ?auto_182897 ) ) ( not ( = ?auto_182894 ?auto_182896 ) ) ( not ( = ?auto_182894 ?auto_182892 ) ) ( not ( = ?auto_182894 ?auto_182891 ) ) ( not ( = ?auto_182897 ?auto_182896 ) ) ( not ( = ?auto_182897 ?auto_182892 ) ) ( not ( = ?auto_182897 ?auto_182891 ) ) ( not ( = ?auto_182889 ?auto_182895 ) ) ( not ( = ?auto_182889 ?auto_182894 ) ) ( not ( = ?auto_182889 ?auto_182897 ) ) ( not ( = ?auto_182890 ?auto_182895 ) ) ( not ( = ?auto_182890 ?auto_182894 ) ) ( not ( = ?auto_182890 ?auto_182897 ) ) ( ON ?auto_182889 ?auto_182893 ) ( not ( = ?auto_182889 ?auto_182893 ) ) ( not ( = ?auto_182890 ?auto_182893 ) ) ( not ( = ?auto_182891 ?auto_182893 ) ) ( not ( = ?auto_182892 ?auto_182893 ) ) ( not ( = ?auto_182896 ?auto_182893 ) ) ( not ( = ?auto_182895 ?auto_182893 ) ) ( not ( = ?auto_182894 ?auto_182893 ) ) ( not ( = ?auto_182897 ?auto_182893 ) ) ( ON ?auto_182890 ?auto_182889 ) ( ON-TABLE ?auto_182893 ) ( ON ?auto_182891 ?auto_182890 ) ( ON ?auto_182892 ?auto_182891 ) ( CLEAR ?auto_182892 ) ( HOLDING ?auto_182896 ) ( CLEAR ?auto_182897 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182895 ?auto_182894 ?auto_182897 ?auto_182896 )
      ( MAKE-4PILE ?auto_182889 ?auto_182890 ?auto_182891 ?auto_182892 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182898 - BLOCK
      ?auto_182899 - BLOCK
      ?auto_182900 - BLOCK
      ?auto_182901 - BLOCK
    )
    :vars
    (
      ?auto_182902 - BLOCK
      ?auto_182904 - BLOCK
      ?auto_182905 - BLOCK
      ?auto_182903 - BLOCK
      ?auto_182906 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182898 ?auto_182899 ) ) ( not ( = ?auto_182898 ?auto_182900 ) ) ( not ( = ?auto_182898 ?auto_182901 ) ) ( not ( = ?auto_182899 ?auto_182900 ) ) ( not ( = ?auto_182899 ?auto_182901 ) ) ( not ( = ?auto_182900 ?auto_182901 ) ) ( not ( = ?auto_182898 ?auto_182902 ) ) ( not ( = ?auto_182899 ?auto_182902 ) ) ( not ( = ?auto_182900 ?auto_182902 ) ) ( not ( = ?auto_182901 ?auto_182902 ) ) ( ON-TABLE ?auto_182904 ) ( ON ?auto_182905 ?auto_182904 ) ( ON ?auto_182903 ?auto_182905 ) ( not ( = ?auto_182904 ?auto_182905 ) ) ( not ( = ?auto_182904 ?auto_182903 ) ) ( not ( = ?auto_182904 ?auto_182902 ) ) ( not ( = ?auto_182904 ?auto_182901 ) ) ( not ( = ?auto_182904 ?auto_182900 ) ) ( not ( = ?auto_182905 ?auto_182903 ) ) ( not ( = ?auto_182905 ?auto_182902 ) ) ( not ( = ?auto_182905 ?auto_182901 ) ) ( not ( = ?auto_182905 ?auto_182900 ) ) ( not ( = ?auto_182903 ?auto_182902 ) ) ( not ( = ?auto_182903 ?auto_182901 ) ) ( not ( = ?auto_182903 ?auto_182900 ) ) ( not ( = ?auto_182898 ?auto_182904 ) ) ( not ( = ?auto_182898 ?auto_182905 ) ) ( not ( = ?auto_182898 ?auto_182903 ) ) ( not ( = ?auto_182899 ?auto_182904 ) ) ( not ( = ?auto_182899 ?auto_182905 ) ) ( not ( = ?auto_182899 ?auto_182903 ) ) ( ON ?auto_182898 ?auto_182906 ) ( not ( = ?auto_182898 ?auto_182906 ) ) ( not ( = ?auto_182899 ?auto_182906 ) ) ( not ( = ?auto_182900 ?auto_182906 ) ) ( not ( = ?auto_182901 ?auto_182906 ) ) ( not ( = ?auto_182902 ?auto_182906 ) ) ( not ( = ?auto_182904 ?auto_182906 ) ) ( not ( = ?auto_182905 ?auto_182906 ) ) ( not ( = ?auto_182903 ?auto_182906 ) ) ( ON ?auto_182899 ?auto_182898 ) ( ON-TABLE ?auto_182906 ) ( ON ?auto_182900 ?auto_182899 ) ( ON ?auto_182901 ?auto_182900 ) ( CLEAR ?auto_182903 ) ( ON ?auto_182902 ?auto_182901 ) ( CLEAR ?auto_182902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182906 ?auto_182898 ?auto_182899 ?auto_182900 ?auto_182901 )
      ( MAKE-4PILE ?auto_182898 ?auto_182899 ?auto_182900 ?auto_182901 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182907 - BLOCK
      ?auto_182908 - BLOCK
      ?auto_182909 - BLOCK
      ?auto_182910 - BLOCK
    )
    :vars
    (
      ?auto_182914 - BLOCK
      ?auto_182913 - BLOCK
      ?auto_182911 - BLOCK
      ?auto_182915 - BLOCK
      ?auto_182912 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182907 ?auto_182908 ) ) ( not ( = ?auto_182907 ?auto_182909 ) ) ( not ( = ?auto_182907 ?auto_182910 ) ) ( not ( = ?auto_182908 ?auto_182909 ) ) ( not ( = ?auto_182908 ?auto_182910 ) ) ( not ( = ?auto_182909 ?auto_182910 ) ) ( not ( = ?auto_182907 ?auto_182914 ) ) ( not ( = ?auto_182908 ?auto_182914 ) ) ( not ( = ?auto_182909 ?auto_182914 ) ) ( not ( = ?auto_182910 ?auto_182914 ) ) ( ON-TABLE ?auto_182913 ) ( ON ?auto_182911 ?auto_182913 ) ( not ( = ?auto_182913 ?auto_182911 ) ) ( not ( = ?auto_182913 ?auto_182915 ) ) ( not ( = ?auto_182913 ?auto_182914 ) ) ( not ( = ?auto_182913 ?auto_182910 ) ) ( not ( = ?auto_182913 ?auto_182909 ) ) ( not ( = ?auto_182911 ?auto_182915 ) ) ( not ( = ?auto_182911 ?auto_182914 ) ) ( not ( = ?auto_182911 ?auto_182910 ) ) ( not ( = ?auto_182911 ?auto_182909 ) ) ( not ( = ?auto_182915 ?auto_182914 ) ) ( not ( = ?auto_182915 ?auto_182910 ) ) ( not ( = ?auto_182915 ?auto_182909 ) ) ( not ( = ?auto_182907 ?auto_182913 ) ) ( not ( = ?auto_182907 ?auto_182911 ) ) ( not ( = ?auto_182907 ?auto_182915 ) ) ( not ( = ?auto_182908 ?auto_182913 ) ) ( not ( = ?auto_182908 ?auto_182911 ) ) ( not ( = ?auto_182908 ?auto_182915 ) ) ( ON ?auto_182907 ?auto_182912 ) ( not ( = ?auto_182907 ?auto_182912 ) ) ( not ( = ?auto_182908 ?auto_182912 ) ) ( not ( = ?auto_182909 ?auto_182912 ) ) ( not ( = ?auto_182910 ?auto_182912 ) ) ( not ( = ?auto_182914 ?auto_182912 ) ) ( not ( = ?auto_182913 ?auto_182912 ) ) ( not ( = ?auto_182911 ?auto_182912 ) ) ( not ( = ?auto_182915 ?auto_182912 ) ) ( ON ?auto_182908 ?auto_182907 ) ( ON-TABLE ?auto_182912 ) ( ON ?auto_182909 ?auto_182908 ) ( ON ?auto_182910 ?auto_182909 ) ( ON ?auto_182914 ?auto_182910 ) ( CLEAR ?auto_182914 ) ( HOLDING ?auto_182915 ) ( CLEAR ?auto_182911 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182913 ?auto_182911 ?auto_182915 )
      ( MAKE-4PILE ?auto_182907 ?auto_182908 ?auto_182909 ?auto_182910 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182916 - BLOCK
      ?auto_182917 - BLOCK
      ?auto_182918 - BLOCK
      ?auto_182919 - BLOCK
    )
    :vars
    (
      ?auto_182921 - BLOCK
      ?auto_182922 - BLOCK
      ?auto_182923 - BLOCK
      ?auto_182924 - BLOCK
      ?auto_182920 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182916 ?auto_182917 ) ) ( not ( = ?auto_182916 ?auto_182918 ) ) ( not ( = ?auto_182916 ?auto_182919 ) ) ( not ( = ?auto_182917 ?auto_182918 ) ) ( not ( = ?auto_182917 ?auto_182919 ) ) ( not ( = ?auto_182918 ?auto_182919 ) ) ( not ( = ?auto_182916 ?auto_182921 ) ) ( not ( = ?auto_182917 ?auto_182921 ) ) ( not ( = ?auto_182918 ?auto_182921 ) ) ( not ( = ?auto_182919 ?auto_182921 ) ) ( ON-TABLE ?auto_182922 ) ( ON ?auto_182923 ?auto_182922 ) ( not ( = ?auto_182922 ?auto_182923 ) ) ( not ( = ?auto_182922 ?auto_182924 ) ) ( not ( = ?auto_182922 ?auto_182921 ) ) ( not ( = ?auto_182922 ?auto_182919 ) ) ( not ( = ?auto_182922 ?auto_182918 ) ) ( not ( = ?auto_182923 ?auto_182924 ) ) ( not ( = ?auto_182923 ?auto_182921 ) ) ( not ( = ?auto_182923 ?auto_182919 ) ) ( not ( = ?auto_182923 ?auto_182918 ) ) ( not ( = ?auto_182924 ?auto_182921 ) ) ( not ( = ?auto_182924 ?auto_182919 ) ) ( not ( = ?auto_182924 ?auto_182918 ) ) ( not ( = ?auto_182916 ?auto_182922 ) ) ( not ( = ?auto_182916 ?auto_182923 ) ) ( not ( = ?auto_182916 ?auto_182924 ) ) ( not ( = ?auto_182917 ?auto_182922 ) ) ( not ( = ?auto_182917 ?auto_182923 ) ) ( not ( = ?auto_182917 ?auto_182924 ) ) ( ON ?auto_182916 ?auto_182920 ) ( not ( = ?auto_182916 ?auto_182920 ) ) ( not ( = ?auto_182917 ?auto_182920 ) ) ( not ( = ?auto_182918 ?auto_182920 ) ) ( not ( = ?auto_182919 ?auto_182920 ) ) ( not ( = ?auto_182921 ?auto_182920 ) ) ( not ( = ?auto_182922 ?auto_182920 ) ) ( not ( = ?auto_182923 ?auto_182920 ) ) ( not ( = ?auto_182924 ?auto_182920 ) ) ( ON ?auto_182917 ?auto_182916 ) ( ON-TABLE ?auto_182920 ) ( ON ?auto_182918 ?auto_182917 ) ( ON ?auto_182919 ?auto_182918 ) ( ON ?auto_182921 ?auto_182919 ) ( CLEAR ?auto_182923 ) ( ON ?auto_182924 ?auto_182921 ) ( CLEAR ?auto_182924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_182920 ?auto_182916 ?auto_182917 ?auto_182918 ?auto_182919 ?auto_182921 )
      ( MAKE-4PILE ?auto_182916 ?auto_182917 ?auto_182918 ?auto_182919 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182925 - BLOCK
      ?auto_182926 - BLOCK
      ?auto_182927 - BLOCK
      ?auto_182928 - BLOCK
    )
    :vars
    (
      ?auto_182933 - BLOCK
      ?auto_182932 - BLOCK
      ?auto_182931 - BLOCK
      ?auto_182930 - BLOCK
      ?auto_182929 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182925 ?auto_182926 ) ) ( not ( = ?auto_182925 ?auto_182927 ) ) ( not ( = ?auto_182925 ?auto_182928 ) ) ( not ( = ?auto_182926 ?auto_182927 ) ) ( not ( = ?auto_182926 ?auto_182928 ) ) ( not ( = ?auto_182927 ?auto_182928 ) ) ( not ( = ?auto_182925 ?auto_182933 ) ) ( not ( = ?auto_182926 ?auto_182933 ) ) ( not ( = ?auto_182927 ?auto_182933 ) ) ( not ( = ?auto_182928 ?auto_182933 ) ) ( ON-TABLE ?auto_182932 ) ( not ( = ?auto_182932 ?auto_182931 ) ) ( not ( = ?auto_182932 ?auto_182930 ) ) ( not ( = ?auto_182932 ?auto_182933 ) ) ( not ( = ?auto_182932 ?auto_182928 ) ) ( not ( = ?auto_182932 ?auto_182927 ) ) ( not ( = ?auto_182931 ?auto_182930 ) ) ( not ( = ?auto_182931 ?auto_182933 ) ) ( not ( = ?auto_182931 ?auto_182928 ) ) ( not ( = ?auto_182931 ?auto_182927 ) ) ( not ( = ?auto_182930 ?auto_182933 ) ) ( not ( = ?auto_182930 ?auto_182928 ) ) ( not ( = ?auto_182930 ?auto_182927 ) ) ( not ( = ?auto_182925 ?auto_182932 ) ) ( not ( = ?auto_182925 ?auto_182931 ) ) ( not ( = ?auto_182925 ?auto_182930 ) ) ( not ( = ?auto_182926 ?auto_182932 ) ) ( not ( = ?auto_182926 ?auto_182931 ) ) ( not ( = ?auto_182926 ?auto_182930 ) ) ( ON ?auto_182925 ?auto_182929 ) ( not ( = ?auto_182925 ?auto_182929 ) ) ( not ( = ?auto_182926 ?auto_182929 ) ) ( not ( = ?auto_182927 ?auto_182929 ) ) ( not ( = ?auto_182928 ?auto_182929 ) ) ( not ( = ?auto_182933 ?auto_182929 ) ) ( not ( = ?auto_182932 ?auto_182929 ) ) ( not ( = ?auto_182931 ?auto_182929 ) ) ( not ( = ?auto_182930 ?auto_182929 ) ) ( ON ?auto_182926 ?auto_182925 ) ( ON-TABLE ?auto_182929 ) ( ON ?auto_182927 ?auto_182926 ) ( ON ?auto_182928 ?auto_182927 ) ( ON ?auto_182933 ?auto_182928 ) ( ON ?auto_182930 ?auto_182933 ) ( CLEAR ?auto_182930 ) ( HOLDING ?auto_182931 ) ( CLEAR ?auto_182932 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182932 ?auto_182931 )
      ( MAKE-4PILE ?auto_182925 ?auto_182926 ?auto_182927 ?auto_182928 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182934 - BLOCK
      ?auto_182935 - BLOCK
      ?auto_182936 - BLOCK
      ?auto_182937 - BLOCK
    )
    :vars
    (
      ?auto_182939 - BLOCK
      ?auto_182941 - BLOCK
      ?auto_182940 - BLOCK
      ?auto_182938 - BLOCK
      ?auto_182942 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182934 ?auto_182935 ) ) ( not ( = ?auto_182934 ?auto_182936 ) ) ( not ( = ?auto_182934 ?auto_182937 ) ) ( not ( = ?auto_182935 ?auto_182936 ) ) ( not ( = ?auto_182935 ?auto_182937 ) ) ( not ( = ?auto_182936 ?auto_182937 ) ) ( not ( = ?auto_182934 ?auto_182939 ) ) ( not ( = ?auto_182935 ?auto_182939 ) ) ( not ( = ?auto_182936 ?auto_182939 ) ) ( not ( = ?auto_182937 ?auto_182939 ) ) ( ON-TABLE ?auto_182941 ) ( not ( = ?auto_182941 ?auto_182940 ) ) ( not ( = ?auto_182941 ?auto_182938 ) ) ( not ( = ?auto_182941 ?auto_182939 ) ) ( not ( = ?auto_182941 ?auto_182937 ) ) ( not ( = ?auto_182941 ?auto_182936 ) ) ( not ( = ?auto_182940 ?auto_182938 ) ) ( not ( = ?auto_182940 ?auto_182939 ) ) ( not ( = ?auto_182940 ?auto_182937 ) ) ( not ( = ?auto_182940 ?auto_182936 ) ) ( not ( = ?auto_182938 ?auto_182939 ) ) ( not ( = ?auto_182938 ?auto_182937 ) ) ( not ( = ?auto_182938 ?auto_182936 ) ) ( not ( = ?auto_182934 ?auto_182941 ) ) ( not ( = ?auto_182934 ?auto_182940 ) ) ( not ( = ?auto_182934 ?auto_182938 ) ) ( not ( = ?auto_182935 ?auto_182941 ) ) ( not ( = ?auto_182935 ?auto_182940 ) ) ( not ( = ?auto_182935 ?auto_182938 ) ) ( ON ?auto_182934 ?auto_182942 ) ( not ( = ?auto_182934 ?auto_182942 ) ) ( not ( = ?auto_182935 ?auto_182942 ) ) ( not ( = ?auto_182936 ?auto_182942 ) ) ( not ( = ?auto_182937 ?auto_182942 ) ) ( not ( = ?auto_182939 ?auto_182942 ) ) ( not ( = ?auto_182941 ?auto_182942 ) ) ( not ( = ?auto_182940 ?auto_182942 ) ) ( not ( = ?auto_182938 ?auto_182942 ) ) ( ON ?auto_182935 ?auto_182934 ) ( ON-TABLE ?auto_182942 ) ( ON ?auto_182936 ?auto_182935 ) ( ON ?auto_182937 ?auto_182936 ) ( ON ?auto_182939 ?auto_182937 ) ( ON ?auto_182938 ?auto_182939 ) ( CLEAR ?auto_182941 ) ( ON ?auto_182940 ?auto_182938 ) ( CLEAR ?auto_182940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182942 ?auto_182934 ?auto_182935 ?auto_182936 ?auto_182937 ?auto_182939 ?auto_182938 )
      ( MAKE-4PILE ?auto_182934 ?auto_182935 ?auto_182936 ?auto_182937 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182943 - BLOCK
      ?auto_182944 - BLOCK
      ?auto_182945 - BLOCK
      ?auto_182946 - BLOCK
    )
    :vars
    (
      ?auto_182948 - BLOCK
      ?auto_182951 - BLOCK
      ?auto_182949 - BLOCK
      ?auto_182950 - BLOCK
      ?auto_182947 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182943 ?auto_182944 ) ) ( not ( = ?auto_182943 ?auto_182945 ) ) ( not ( = ?auto_182943 ?auto_182946 ) ) ( not ( = ?auto_182944 ?auto_182945 ) ) ( not ( = ?auto_182944 ?auto_182946 ) ) ( not ( = ?auto_182945 ?auto_182946 ) ) ( not ( = ?auto_182943 ?auto_182948 ) ) ( not ( = ?auto_182944 ?auto_182948 ) ) ( not ( = ?auto_182945 ?auto_182948 ) ) ( not ( = ?auto_182946 ?auto_182948 ) ) ( not ( = ?auto_182951 ?auto_182949 ) ) ( not ( = ?auto_182951 ?auto_182950 ) ) ( not ( = ?auto_182951 ?auto_182948 ) ) ( not ( = ?auto_182951 ?auto_182946 ) ) ( not ( = ?auto_182951 ?auto_182945 ) ) ( not ( = ?auto_182949 ?auto_182950 ) ) ( not ( = ?auto_182949 ?auto_182948 ) ) ( not ( = ?auto_182949 ?auto_182946 ) ) ( not ( = ?auto_182949 ?auto_182945 ) ) ( not ( = ?auto_182950 ?auto_182948 ) ) ( not ( = ?auto_182950 ?auto_182946 ) ) ( not ( = ?auto_182950 ?auto_182945 ) ) ( not ( = ?auto_182943 ?auto_182951 ) ) ( not ( = ?auto_182943 ?auto_182949 ) ) ( not ( = ?auto_182943 ?auto_182950 ) ) ( not ( = ?auto_182944 ?auto_182951 ) ) ( not ( = ?auto_182944 ?auto_182949 ) ) ( not ( = ?auto_182944 ?auto_182950 ) ) ( ON ?auto_182943 ?auto_182947 ) ( not ( = ?auto_182943 ?auto_182947 ) ) ( not ( = ?auto_182944 ?auto_182947 ) ) ( not ( = ?auto_182945 ?auto_182947 ) ) ( not ( = ?auto_182946 ?auto_182947 ) ) ( not ( = ?auto_182948 ?auto_182947 ) ) ( not ( = ?auto_182951 ?auto_182947 ) ) ( not ( = ?auto_182949 ?auto_182947 ) ) ( not ( = ?auto_182950 ?auto_182947 ) ) ( ON ?auto_182944 ?auto_182943 ) ( ON-TABLE ?auto_182947 ) ( ON ?auto_182945 ?auto_182944 ) ( ON ?auto_182946 ?auto_182945 ) ( ON ?auto_182948 ?auto_182946 ) ( ON ?auto_182950 ?auto_182948 ) ( ON ?auto_182949 ?auto_182950 ) ( CLEAR ?auto_182949 ) ( HOLDING ?auto_182951 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_182951 )
      ( MAKE-4PILE ?auto_182943 ?auto_182944 ?auto_182945 ?auto_182946 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_182952 - BLOCK
      ?auto_182953 - BLOCK
      ?auto_182954 - BLOCK
      ?auto_182955 - BLOCK
    )
    :vars
    (
      ?auto_182958 - BLOCK
      ?auto_182957 - BLOCK
      ?auto_182956 - BLOCK
      ?auto_182960 - BLOCK
      ?auto_182959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_182952 ?auto_182953 ) ) ( not ( = ?auto_182952 ?auto_182954 ) ) ( not ( = ?auto_182952 ?auto_182955 ) ) ( not ( = ?auto_182953 ?auto_182954 ) ) ( not ( = ?auto_182953 ?auto_182955 ) ) ( not ( = ?auto_182954 ?auto_182955 ) ) ( not ( = ?auto_182952 ?auto_182958 ) ) ( not ( = ?auto_182953 ?auto_182958 ) ) ( not ( = ?auto_182954 ?auto_182958 ) ) ( not ( = ?auto_182955 ?auto_182958 ) ) ( not ( = ?auto_182957 ?auto_182956 ) ) ( not ( = ?auto_182957 ?auto_182960 ) ) ( not ( = ?auto_182957 ?auto_182958 ) ) ( not ( = ?auto_182957 ?auto_182955 ) ) ( not ( = ?auto_182957 ?auto_182954 ) ) ( not ( = ?auto_182956 ?auto_182960 ) ) ( not ( = ?auto_182956 ?auto_182958 ) ) ( not ( = ?auto_182956 ?auto_182955 ) ) ( not ( = ?auto_182956 ?auto_182954 ) ) ( not ( = ?auto_182960 ?auto_182958 ) ) ( not ( = ?auto_182960 ?auto_182955 ) ) ( not ( = ?auto_182960 ?auto_182954 ) ) ( not ( = ?auto_182952 ?auto_182957 ) ) ( not ( = ?auto_182952 ?auto_182956 ) ) ( not ( = ?auto_182952 ?auto_182960 ) ) ( not ( = ?auto_182953 ?auto_182957 ) ) ( not ( = ?auto_182953 ?auto_182956 ) ) ( not ( = ?auto_182953 ?auto_182960 ) ) ( ON ?auto_182952 ?auto_182959 ) ( not ( = ?auto_182952 ?auto_182959 ) ) ( not ( = ?auto_182953 ?auto_182959 ) ) ( not ( = ?auto_182954 ?auto_182959 ) ) ( not ( = ?auto_182955 ?auto_182959 ) ) ( not ( = ?auto_182958 ?auto_182959 ) ) ( not ( = ?auto_182957 ?auto_182959 ) ) ( not ( = ?auto_182956 ?auto_182959 ) ) ( not ( = ?auto_182960 ?auto_182959 ) ) ( ON ?auto_182953 ?auto_182952 ) ( ON-TABLE ?auto_182959 ) ( ON ?auto_182954 ?auto_182953 ) ( ON ?auto_182955 ?auto_182954 ) ( ON ?auto_182958 ?auto_182955 ) ( ON ?auto_182960 ?auto_182958 ) ( ON ?auto_182956 ?auto_182960 ) ( ON ?auto_182957 ?auto_182956 ) ( CLEAR ?auto_182957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_182959 ?auto_182952 ?auto_182953 ?auto_182954 ?auto_182955 ?auto_182958 ?auto_182960 ?auto_182956 )
      ( MAKE-4PILE ?auto_182952 ?auto_182953 ?auto_182954 ?auto_182955 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182980 - BLOCK
      ?auto_182981 - BLOCK
      ?auto_182982 - BLOCK
    )
    :vars
    (
      ?auto_182985 - BLOCK
      ?auto_182984 - BLOCK
      ?auto_182983 - BLOCK
      ?auto_182987 - BLOCK
      ?auto_182986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182985 ?auto_182982 ) ( ON-TABLE ?auto_182980 ) ( ON ?auto_182981 ?auto_182980 ) ( ON ?auto_182982 ?auto_182981 ) ( not ( = ?auto_182980 ?auto_182981 ) ) ( not ( = ?auto_182980 ?auto_182982 ) ) ( not ( = ?auto_182980 ?auto_182985 ) ) ( not ( = ?auto_182981 ?auto_182982 ) ) ( not ( = ?auto_182981 ?auto_182985 ) ) ( not ( = ?auto_182982 ?auto_182985 ) ) ( not ( = ?auto_182980 ?auto_182984 ) ) ( not ( = ?auto_182980 ?auto_182983 ) ) ( not ( = ?auto_182981 ?auto_182984 ) ) ( not ( = ?auto_182981 ?auto_182983 ) ) ( not ( = ?auto_182982 ?auto_182984 ) ) ( not ( = ?auto_182982 ?auto_182983 ) ) ( not ( = ?auto_182985 ?auto_182984 ) ) ( not ( = ?auto_182985 ?auto_182983 ) ) ( not ( = ?auto_182984 ?auto_182983 ) ) ( ON ?auto_182984 ?auto_182985 ) ( CLEAR ?auto_182984 ) ( HOLDING ?auto_182983 ) ( CLEAR ?auto_182987 ) ( ON-TABLE ?auto_182986 ) ( ON ?auto_182987 ?auto_182986 ) ( not ( = ?auto_182986 ?auto_182987 ) ) ( not ( = ?auto_182986 ?auto_182983 ) ) ( not ( = ?auto_182987 ?auto_182983 ) ) ( not ( = ?auto_182980 ?auto_182987 ) ) ( not ( = ?auto_182980 ?auto_182986 ) ) ( not ( = ?auto_182981 ?auto_182987 ) ) ( not ( = ?auto_182981 ?auto_182986 ) ) ( not ( = ?auto_182982 ?auto_182987 ) ) ( not ( = ?auto_182982 ?auto_182986 ) ) ( not ( = ?auto_182985 ?auto_182987 ) ) ( not ( = ?auto_182985 ?auto_182986 ) ) ( not ( = ?auto_182984 ?auto_182987 ) ) ( not ( = ?auto_182984 ?auto_182986 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182986 ?auto_182987 ?auto_182983 )
      ( MAKE-3PILE ?auto_182980 ?auto_182981 ?auto_182982 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182988 - BLOCK
      ?auto_182989 - BLOCK
      ?auto_182990 - BLOCK
    )
    :vars
    (
      ?auto_182993 - BLOCK
      ?auto_182992 - BLOCK
      ?auto_182994 - BLOCK
      ?auto_182991 - BLOCK
      ?auto_182995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182993 ?auto_182990 ) ( ON-TABLE ?auto_182988 ) ( ON ?auto_182989 ?auto_182988 ) ( ON ?auto_182990 ?auto_182989 ) ( not ( = ?auto_182988 ?auto_182989 ) ) ( not ( = ?auto_182988 ?auto_182990 ) ) ( not ( = ?auto_182988 ?auto_182993 ) ) ( not ( = ?auto_182989 ?auto_182990 ) ) ( not ( = ?auto_182989 ?auto_182993 ) ) ( not ( = ?auto_182990 ?auto_182993 ) ) ( not ( = ?auto_182988 ?auto_182992 ) ) ( not ( = ?auto_182988 ?auto_182994 ) ) ( not ( = ?auto_182989 ?auto_182992 ) ) ( not ( = ?auto_182989 ?auto_182994 ) ) ( not ( = ?auto_182990 ?auto_182992 ) ) ( not ( = ?auto_182990 ?auto_182994 ) ) ( not ( = ?auto_182993 ?auto_182992 ) ) ( not ( = ?auto_182993 ?auto_182994 ) ) ( not ( = ?auto_182992 ?auto_182994 ) ) ( ON ?auto_182992 ?auto_182993 ) ( CLEAR ?auto_182991 ) ( ON-TABLE ?auto_182995 ) ( ON ?auto_182991 ?auto_182995 ) ( not ( = ?auto_182995 ?auto_182991 ) ) ( not ( = ?auto_182995 ?auto_182994 ) ) ( not ( = ?auto_182991 ?auto_182994 ) ) ( not ( = ?auto_182988 ?auto_182991 ) ) ( not ( = ?auto_182988 ?auto_182995 ) ) ( not ( = ?auto_182989 ?auto_182991 ) ) ( not ( = ?auto_182989 ?auto_182995 ) ) ( not ( = ?auto_182990 ?auto_182991 ) ) ( not ( = ?auto_182990 ?auto_182995 ) ) ( not ( = ?auto_182993 ?auto_182991 ) ) ( not ( = ?auto_182993 ?auto_182995 ) ) ( not ( = ?auto_182992 ?auto_182991 ) ) ( not ( = ?auto_182992 ?auto_182995 ) ) ( ON ?auto_182994 ?auto_182992 ) ( CLEAR ?auto_182994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182988 ?auto_182989 ?auto_182990 ?auto_182993 ?auto_182992 )
      ( MAKE-3PILE ?auto_182988 ?auto_182989 ?auto_182990 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_182996 - BLOCK
      ?auto_182997 - BLOCK
      ?auto_182998 - BLOCK
    )
    :vars
    (
      ?auto_183000 - BLOCK
      ?auto_182999 - BLOCK
      ?auto_183003 - BLOCK
      ?auto_183002 - BLOCK
      ?auto_183001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183000 ?auto_182998 ) ( ON-TABLE ?auto_182996 ) ( ON ?auto_182997 ?auto_182996 ) ( ON ?auto_182998 ?auto_182997 ) ( not ( = ?auto_182996 ?auto_182997 ) ) ( not ( = ?auto_182996 ?auto_182998 ) ) ( not ( = ?auto_182996 ?auto_183000 ) ) ( not ( = ?auto_182997 ?auto_182998 ) ) ( not ( = ?auto_182997 ?auto_183000 ) ) ( not ( = ?auto_182998 ?auto_183000 ) ) ( not ( = ?auto_182996 ?auto_182999 ) ) ( not ( = ?auto_182996 ?auto_183003 ) ) ( not ( = ?auto_182997 ?auto_182999 ) ) ( not ( = ?auto_182997 ?auto_183003 ) ) ( not ( = ?auto_182998 ?auto_182999 ) ) ( not ( = ?auto_182998 ?auto_183003 ) ) ( not ( = ?auto_183000 ?auto_182999 ) ) ( not ( = ?auto_183000 ?auto_183003 ) ) ( not ( = ?auto_182999 ?auto_183003 ) ) ( ON ?auto_182999 ?auto_183000 ) ( ON-TABLE ?auto_183002 ) ( not ( = ?auto_183002 ?auto_183001 ) ) ( not ( = ?auto_183002 ?auto_183003 ) ) ( not ( = ?auto_183001 ?auto_183003 ) ) ( not ( = ?auto_182996 ?auto_183001 ) ) ( not ( = ?auto_182996 ?auto_183002 ) ) ( not ( = ?auto_182997 ?auto_183001 ) ) ( not ( = ?auto_182997 ?auto_183002 ) ) ( not ( = ?auto_182998 ?auto_183001 ) ) ( not ( = ?auto_182998 ?auto_183002 ) ) ( not ( = ?auto_183000 ?auto_183001 ) ) ( not ( = ?auto_183000 ?auto_183002 ) ) ( not ( = ?auto_182999 ?auto_183001 ) ) ( not ( = ?auto_182999 ?auto_183002 ) ) ( ON ?auto_183003 ?auto_182999 ) ( CLEAR ?auto_183003 ) ( HOLDING ?auto_183001 ) ( CLEAR ?auto_183002 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183002 ?auto_183001 )
      ( MAKE-3PILE ?auto_182996 ?auto_182997 ?auto_182998 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_183004 - BLOCK
      ?auto_183005 - BLOCK
      ?auto_183006 - BLOCK
    )
    :vars
    (
      ?auto_183011 - BLOCK
      ?auto_183010 - BLOCK
      ?auto_183008 - BLOCK
      ?auto_183007 - BLOCK
      ?auto_183009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183011 ?auto_183006 ) ( ON-TABLE ?auto_183004 ) ( ON ?auto_183005 ?auto_183004 ) ( ON ?auto_183006 ?auto_183005 ) ( not ( = ?auto_183004 ?auto_183005 ) ) ( not ( = ?auto_183004 ?auto_183006 ) ) ( not ( = ?auto_183004 ?auto_183011 ) ) ( not ( = ?auto_183005 ?auto_183006 ) ) ( not ( = ?auto_183005 ?auto_183011 ) ) ( not ( = ?auto_183006 ?auto_183011 ) ) ( not ( = ?auto_183004 ?auto_183010 ) ) ( not ( = ?auto_183004 ?auto_183008 ) ) ( not ( = ?auto_183005 ?auto_183010 ) ) ( not ( = ?auto_183005 ?auto_183008 ) ) ( not ( = ?auto_183006 ?auto_183010 ) ) ( not ( = ?auto_183006 ?auto_183008 ) ) ( not ( = ?auto_183011 ?auto_183010 ) ) ( not ( = ?auto_183011 ?auto_183008 ) ) ( not ( = ?auto_183010 ?auto_183008 ) ) ( ON ?auto_183010 ?auto_183011 ) ( ON-TABLE ?auto_183007 ) ( not ( = ?auto_183007 ?auto_183009 ) ) ( not ( = ?auto_183007 ?auto_183008 ) ) ( not ( = ?auto_183009 ?auto_183008 ) ) ( not ( = ?auto_183004 ?auto_183009 ) ) ( not ( = ?auto_183004 ?auto_183007 ) ) ( not ( = ?auto_183005 ?auto_183009 ) ) ( not ( = ?auto_183005 ?auto_183007 ) ) ( not ( = ?auto_183006 ?auto_183009 ) ) ( not ( = ?auto_183006 ?auto_183007 ) ) ( not ( = ?auto_183011 ?auto_183009 ) ) ( not ( = ?auto_183011 ?auto_183007 ) ) ( not ( = ?auto_183010 ?auto_183009 ) ) ( not ( = ?auto_183010 ?auto_183007 ) ) ( ON ?auto_183008 ?auto_183010 ) ( CLEAR ?auto_183007 ) ( ON ?auto_183009 ?auto_183008 ) ( CLEAR ?auto_183009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183004 ?auto_183005 ?auto_183006 ?auto_183011 ?auto_183010 ?auto_183008 )
      ( MAKE-3PILE ?auto_183004 ?auto_183005 ?auto_183006 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_183012 - BLOCK
      ?auto_183013 - BLOCK
      ?auto_183014 - BLOCK
    )
    :vars
    (
      ?auto_183019 - BLOCK
      ?auto_183016 - BLOCK
      ?auto_183015 - BLOCK
      ?auto_183017 - BLOCK
      ?auto_183018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183019 ?auto_183014 ) ( ON-TABLE ?auto_183012 ) ( ON ?auto_183013 ?auto_183012 ) ( ON ?auto_183014 ?auto_183013 ) ( not ( = ?auto_183012 ?auto_183013 ) ) ( not ( = ?auto_183012 ?auto_183014 ) ) ( not ( = ?auto_183012 ?auto_183019 ) ) ( not ( = ?auto_183013 ?auto_183014 ) ) ( not ( = ?auto_183013 ?auto_183019 ) ) ( not ( = ?auto_183014 ?auto_183019 ) ) ( not ( = ?auto_183012 ?auto_183016 ) ) ( not ( = ?auto_183012 ?auto_183015 ) ) ( not ( = ?auto_183013 ?auto_183016 ) ) ( not ( = ?auto_183013 ?auto_183015 ) ) ( not ( = ?auto_183014 ?auto_183016 ) ) ( not ( = ?auto_183014 ?auto_183015 ) ) ( not ( = ?auto_183019 ?auto_183016 ) ) ( not ( = ?auto_183019 ?auto_183015 ) ) ( not ( = ?auto_183016 ?auto_183015 ) ) ( ON ?auto_183016 ?auto_183019 ) ( not ( = ?auto_183017 ?auto_183018 ) ) ( not ( = ?auto_183017 ?auto_183015 ) ) ( not ( = ?auto_183018 ?auto_183015 ) ) ( not ( = ?auto_183012 ?auto_183018 ) ) ( not ( = ?auto_183012 ?auto_183017 ) ) ( not ( = ?auto_183013 ?auto_183018 ) ) ( not ( = ?auto_183013 ?auto_183017 ) ) ( not ( = ?auto_183014 ?auto_183018 ) ) ( not ( = ?auto_183014 ?auto_183017 ) ) ( not ( = ?auto_183019 ?auto_183018 ) ) ( not ( = ?auto_183019 ?auto_183017 ) ) ( not ( = ?auto_183016 ?auto_183018 ) ) ( not ( = ?auto_183016 ?auto_183017 ) ) ( ON ?auto_183015 ?auto_183016 ) ( ON ?auto_183018 ?auto_183015 ) ( CLEAR ?auto_183018 ) ( HOLDING ?auto_183017 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183017 )
      ( MAKE-3PILE ?auto_183012 ?auto_183013 ?auto_183014 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_183031 - BLOCK
      ?auto_183032 - BLOCK
      ?auto_183033 - BLOCK
    )
    :vars
    (
      ?auto_183036 - BLOCK
      ?auto_183038 - BLOCK
      ?auto_183035 - BLOCK
      ?auto_183037 - BLOCK
      ?auto_183034 - BLOCK
      ?auto_183039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183036 ?auto_183033 ) ( ON-TABLE ?auto_183031 ) ( ON ?auto_183032 ?auto_183031 ) ( ON ?auto_183033 ?auto_183032 ) ( not ( = ?auto_183031 ?auto_183032 ) ) ( not ( = ?auto_183031 ?auto_183033 ) ) ( not ( = ?auto_183031 ?auto_183036 ) ) ( not ( = ?auto_183032 ?auto_183033 ) ) ( not ( = ?auto_183032 ?auto_183036 ) ) ( not ( = ?auto_183033 ?auto_183036 ) ) ( not ( = ?auto_183031 ?auto_183038 ) ) ( not ( = ?auto_183031 ?auto_183035 ) ) ( not ( = ?auto_183032 ?auto_183038 ) ) ( not ( = ?auto_183032 ?auto_183035 ) ) ( not ( = ?auto_183033 ?auto_183038 ) ) ( not ( = ?auto_183033 ?auto_183035 ) ) ( not ( = ?auto_183036 ?auto_183038 ) ) ( not ( = ?auto_183036 ?auto_183035 ) ) ( not ( = ?auto_183038 ?auto_183035 ) ) ( ON ?auto_183038 ?auto_183036 ) ( not ( = ?auto_183037 ?auto_183034 ) ) ( not ( = ?auto_183037 ?auto_183035 ) ) ( not ( = ?auto_183034 ?auto_183035 ) ) ( not ( = ?auto_183031 ?auto_183034 ) ) ( not ( = ?auto_183031 ?auto_183037 ) ) ( not ( = ?auto_183032 ?auto_183034 ) ) ( not ( = ?auto_183032 ?auto_183037 ) ) ( not ( = ?auto_183033 ?auto_183034 ) ) ( not ( = ?auto_183033 ?auto_183037 ) ) ( not ( = ?auto_183036 ?auto_183034 ) ) ( not ( = ?auto_183036 ?auto_183037 ) ) ( not ( = ?auto_183038 ?auto_183034 ) ) ( not ( = ?auto_183038 ?auto_183037 ) ) ( ON ?auto_183035 ?auto_183038 ) ( ON ?auto_183034 ?auto_183035 ) ( CLEAR ?auto_183034 ) ( ON ?auto_183037 ?auto_183039 ) ( CLEAR ?auto_183037 ) ( HAND-EMPTY ) ( not ( = ?auto_183031 ?auto_183039 ) ) ( not ( = ?auto_183032 ?auto_183039 ) ) ( not ( = ?auto_183033 ?auto_183039 ) ) ( not ( = ?auto_183036 ?auto_183039 ) ) ( not ( = ?auto_183038 ?auto_183039 ) ) ( not ( = ?auto_183035 ?auto_183039 ) ) ( not ( = ?auto_183037 ?auto_183039 ) ) ( not ( = ?auto_183034 ?auto_183039 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183037 ?auto_183039 )
      ( MAKE-3PILE ?auto_183031 ?auto_183032 ?auto_183033 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_183040 - BLOCK
      ?auto_183041 - BLOCK
      ?auto_183042 - BLOCK
    )
    :vars
    (
      ?auto_183047 - BLOCK
      ?auto_183046 - BLOCK
      ?auto_183045 - BLOCK
      ?auto_183043 - BLOCK
      ?auto_183048 - BLOCK
      ?auto_183044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183047 ?auto_183042 ) ( ON-TABLE ?auto_183040 ) ( ON ?auto_183041 ?auto_183040 ) ( ON ?auto_183042 ?auto_183041 ) ( not ( = ?auto_183040 ?auto_183041 ) ) ( not ( = ?auto_183040 ?auto_183042 ) ) ( not ( = ?auto_183040 ?auto_183047 ) ) ( not ( = ?auto_183041 ?auto_183042 ) ) ( not ( = ?auto_183041 ?auto_183047 ) ) ( not ( = ?auto_183042 ?auto_183047 ) ) ( not ( = ?auto_183040 ?auto_183046 ) ) ( not ( = ?auto_183040 ?auto_183045 ) ) ( not ( = ?auto_183041 ?auto_183046 ) ) ( not ( = ?auto_183041 ?auto_183045 ) ) ( not ( = ?auto_183042 ?auto_183046 ) ) ( not ( = ?auto_183042 ?auto_183045 ) ) ( not ( = ?auto_183047 ?auto_183046 ) ) ( not ( = ?auto_183047 ?auto_183045 ) ) ( not ( = ?auto_183046 ?auto_183045 ) ) ( ON ?auto_183046 ?auto_183047 ) ( not ( = ?auto_183043 ?auto_183048 ) ) ( not ( = ?auto_183043 ?auto_183045 ) ) ( not ( = ?auto_183048 ?auto_183045 ) ) ( not ( = ?auto_183040 ?auto_183048 ) ) ( not ( = ?auto_183040 ?auto_183043 ) ) ( not ( = ?auto_183041 ?auto_183048 ) ) ( not ( = ?auto_183041 ?auto_183043 ) ) ( not ( = ?auto_183042 ?auto_183048 ) ) ( not ( = ?auto_183042 ?auto_183043 ) ) ( not ( = ?auto_183047 ?auto_183048 ) ) ( not ( = ?auto_183047 ?auto_183043 ) ) ( not ( = ?auto_183046 ?auto_183048 ) ) ( not ( = ?auto_183046 ?auto_183043 ) ) ( ON ?auto_183045 ?auto_183046 ) ( ON ?auto_183043 ?auto_183044 ) ( CLEAR ?auto_183043 ) ( not ( = ?auto_183040 ?auto_183044 ) ) ( not ( = ?auto_183041 ?auto_183044 ) ) ( not ( = ?auto_183042 ?auto_183044 ) ) ( not ( = ?auto_183047 ?auto_183044 ) ) ( not ( = ?auto_183046 ?auto_183044 ) ) ( not ( = ?auto_183045 ?auto_183044 ) ) ( not ( = ?auto_183043 ?auto_183044 ) ) ( not ( = ?auto_183048 ?auto_183044 ) ) ( HOLDING ?auto_183048 ) ( CLEAR ?auto_183045 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183040 ?auto_183041 ?auto_183042 ?auto_183047 ?auto_183046 ?auto_183045 ?auto_183048 )
      ( MAKE-3PILE ?auto_183040 ?auto_183041 ?auto_183042 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_183049 - BLOCK
      ?auto_183050 - BLOCK
      ?auto_183051 - BLOCK
    )
    :vars
    (
      ?auto_183053 - BLOCK
      ?auto_183055 - BLOCK
      ?auto_183057 - BLOCK
      ?auto_183054 - BLOCK
      ?auto_183052 - BLOCK
      ?auto_183056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183053 ?auto_183051 ) ( ON-TABLE ?auto_183049 ) ( ON ?auto_183050 ?auto_183049 ) ( ON ?auto_183051 ?auto_183050 ) ( not ( = ?auto_183049 ?auto_183050 ) ) ( not ( = ?auto_183049 ?auto_183051 ) ) ( not ( = ?auto_183049 ?auto_183053 ) ) ( not ( = ?auto_183050 ?auto_183051 ) ) ( not ( = ?auto_183050 ?auto_183053 ) ) ( not ( = ?auto_183051 ?auto_183053 ) ) ( not ( = ?auto_183049 ?auto_183055 ) ) ( not ( = ?auto_183049 ?auto_183057 ) ) ( not ( = ?auto_183050 ?auto_183055 ) ) ( not ( = ?auto_183050 ?auto_183057 ) ) ( not ( = ?auto_183051 ?auto_183055 ) ) ( not ( = ?auto_183051 ?auto_183057 ) ) ( not ( = ?auto_183053 ?auto_183055 ) ) ( not ( = ?auto_183053 ?auto_183057 ) ) ( not ( = ?auto_183055 ?auto_183057 ) ) ( ON ?auto_183055 ?auto_183053 ) ( not ( = ?auto_183054 ?auto_183052 ) ) ( not ( = ?auto_183054 ?auto_183057 ) ) ( not ( = ?auto_183052 ?auto_183057 ) ) ( not ( = ?auto_183049 ?auto_183052 ) ) ( not ( = ?auto_183049 ?auto_183054 ) ) ( not ( = ?auto_183050 ?auto_183052 ) ) ( not ( = ?auto_183050 ?auto_183054 ) ) ( not ( = ?auto_183051 ?auto_183052 ) ) ( not ( = ?auto_183051 ?auto_183054 ) ) ( not ( = ?auto_183053 ?auto_183052 ) ) ( not ( = ?auto_183053 ?auto_183054 ) ) ( not ( = ?auto_183055 ?auto_183052 ) ) ( not ( = ?auto_183055 ?auto_183054 ) ) ( ON ?auto_183057 ?auto_183055 ) ( ON ?auto_183054 ?auto_183056 ) ( not ( = ?auto_183049 ?auto_183056 ) ) ( not ( = ?auto_183050 ?auto_183056 ) ) ( not ( = ?auto_183051 ?auto_183056 ) ) ( not ( = ?auto_183053 ?auto_183056 ) ) ( not ( = ?auto_183055 ?auto_183056 ) ) ( not ( = ?auto_183057 ?auto_183056 ) ) ( not ( = ?auto_183054 ?auto_183056 ) ) ( not ( = ?auto_183052 ?auto_183056 ) ) ( CLEAR ?auto_183057 ) ( ON ?auto_183052 ?auto_183054 ) ( CLEAR ?auto_183052 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183056 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183056 ?auto_183054 )
      ( MAKE-3PILE ?auto_183049 ?auto_183050 ?auto_183051 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_183058 - BLOCK
      ?auto_183059 - BLOCK
      ?auto_183060 - BLOCK
    )
    :vars
    (
      ?auto_183061 - BLOCK
      ?auto_183063 - BLOCK
      ?auto_183065 - BLOCK
      ?auto_183062 - BLOCK
      ?auto_183066 - BLOCK
      ?auto_183064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183061 ?auto_183060 ) ( ON-TABLE ?auto_183058 ) ( ON ?auto_183059 ?auto_183058 ) ( ON ?auto_183060 ?auto_183059 ) ( not ( = ?auto_183058 ?auto_183059 ) ) ( not ( = ?auto_183058 ?auto_183060 ) ) ( not ( = ?auto_183058 ?auto_183061 ) ) ( not ( = ?auto_183059 ?auto_183060 ) ) ( not ( = ?auto_183059 ?auto_183061 ) ) ( not ( = ?auto_183060 ?auto_183061 ) ) ( not ( = ?auto_183058 ?auto_183063 ) ) ( not ( = ?auto_183058 ?auto_183065 ) ) ( not ( = ?auto_183059 ?auto_183063 ) ) ( not ( = ?auto_183059 ?auto_183065 ) ) ( not ( = ?auto_183060 ?auto_183063 ) ) ( not ( = ?auto_183060 ?auto_183065 ) ) ( not ( = ?auto_183061 ?auto_183063 ) ) ( not ( = ?auto_183061 ?auto_183065 ) ) ( not ( = ?auto_183063 ?auto_183065 ) ) ( ON ?auto_183063 ?auto_183061 ) ( not ( = ?auto_183062 ?auto_183066 ) ) ( not ( = ?auto_183062 ?auto_183065 ) ) ( not ( = ?auto_183066 ?auto_183065 ) ) ( not ( = ?auto_183058 ?auto_183066 ) ) ( not ( = ?auto_183058 ?auto_183062 ) ) ( not ( = ?auto_183059 ?auto_183066 ) ) ( not ( = ?auto_183059 ?auto_183062 ) ) ( not ( = ?auto_183060 ?auto_183066 ) ) ( not ( = ?auto_183060 ?auto_183062 ) ) ( not ( = ?auto_183061 ?auto_183066 ) ) ( not ( = ?auto_183061 ?auto_183062 ) ) ( not ( = ?auto_183063 ?auto_183066 ) ) ( not ( = ?auto_183063 ?auto_183062 ) ) ( ON ?auto_183062 ?auto_183064 ) ( not ( = ?auto_183058 ?auto_183064 ) ) ( not ( = ?auto_183059 ?auto_183064 ) ) ( not ( = ?auto_183060 ?auto_183064 ) ) ( not ( = ?auto_183061 ?auto_183064 ) ) ( not ( = ?auto_183063 ?auto_183064 ) ) ( not ( = ?auto_183065 ?auto_183064 ) ) ( not ( = ?auto_183062 ?auto_183064 ) ) ( not ( = ?auto_183066 ?auto_183064 ) ) ( ON ?auto_183066 ?auto_183062 ) ( CLEAR ?auto_183066 ) ( ON-TABLE ?auto_183064 ) ( HOLDING ?auto_183065 ) ( CLEAR ?auto_183063 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183058 ?auto_183059 ?auto_183060 ?auto_183061 ?auto_183063 ?auto_183065 )
      ( MAKE-3PILE ?auto_183058 ?auto_183059 ?auto_183060 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183125 - BLOCK
      ?auto_183126 - BLOCK
      ?auto_183127 - BLOCK
      ?auto_183128 - BLOCK
      ?auto_183129 - BLOCK
    )
    :vars
    (
      ?auto_183130 - BLOCK
      ?auto_183131 - BLOCK
      ?auto_183132 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183125 ) ( ON ?auto_183126 ?auto_183125 ) ( ON ?auto_183127 ?auto_183126 ) ( not ( = ?auto_183125 ?auto_183126 ) ) ( not ( = ?auto_183125 ?auto_183127 ) ) ( not ( = ?auto_183125 ?auto_183128 ) ) ( not ( = ?auto_183125 ?auto_183129 ) ) ( not ( = ?auto_183126 ?auto_183127 ) ) ( not ( = ?auto_183126 ?auto_183128 ) ) ( not ( = ?auto_183126 ?auto_183129 ) ) ( not ( = ?auto_183127 ?auto_183128 ) ) ( not ( = ?auto_183127 ?auto_183129 ) ) ( not ( = ?auto_183128 ?auto_183129 ) ) ( ON ?auto_183129 ?auto_183130 ) ( not ( = ?auto_183125 ?auto_183130 ) ) ( not ( = ?auto_183126 ?auto_183130 ) ) ( not ( = ?auto_183127 ?auto_183130 ) ) ( not ( = ?auto_183128 ?auto_183130 ) ) ( not ( = ?auto_183129 ?auto_183130 ) ) ( CLEAR ?auto_183127 ) ( ON ?auto_183128 ?auto_183129 ) ( CLEAR ?auto_183128 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183131 ) ( ON ?auto_183132 ?auto_183131 ) ( ON ?auto_183130 ?auto_183132 ) ( not ( = ?auto_183131 ?auto_183132 ) ) ( not ( = ?auto_183131 ?auto_183130 ) ) ( not ( = ?auto_183131 ?auto_183129 ) ) ( not ( = ?auto_183131 ?auto_183128 ) ) ( not ( = ?auto_183132 ?auto_183130 ) ) ( not ( = ?auto_183132 ?auto_183129 ) ) ( not ( = ?auto_183132 ?auto_183128 ) ) ( not ( = ?auto_183125 ?auto_183131 ) ) ( not ( = ?auto_183125 ?auto_183132 ) ) ( not ( = ?auto_183126 ?auto_183131 ) ) ( not ( = ?auto_183126 ?auto_183132 ) ) ( not ( = ?auto_183127 ?auto_183131 ) ) ( not ( = ?auto_183127 ?auto_183132 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183131 ?auto_183132 ?auto_183130 ?auto_183129 )
      ( MAKE-5PILE ?auto_183125 ?auto_183126 ?auto_183127 ?auto_183128 ?auto_183129 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183133 - BLOCK
      ?auto_183134 - BLOCK
      ?auto_183135 - BLOCK
      ?auto_183136 - BLOCK
      ?auto_183137 - BLOCK
    )
    :vars
    (
      ?auto_183140 - BLOCK
      ?auto_183138 - BLOCK
      ?auto_183139 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183133 ) ( ON ?auto_183134 ?auto_183133 ) ( not ( = ?auto_183133 ?auto_183134 ) ) ( not ( = ?auto_183133 ?auto_183135 ) ) ( not ( = ?auto_183133 ?auto_183136 ) ) ( not ( = ?auto_183133 ?auto_183137 ) ) ( not ( = ?auto_183134 ?auto_183135 ) ) ( not ( = ?auto_183134 ?auto_183136 ) ) ( not ( = ?auto_183134 ?auto_183137 ) ) ( not ( = ?auto_183135 ?auto_183136 ) ) ( not ( = ?auto_183135 ?auto_183137 ) ) ( not ( = ?auto_183136 ?auto_183137 ) ) ( ON ?auto_183137 ?auto_183140 ) ( not ( = ?auto_183133 ?auto_183140 ) ) ( not ( = ?auto_183134 ?auto_183140 ) ) ( not ( = ?auto_183135 ?auto_183140 ) ) ( not ( = ?auto_183136 ?auto_183140 ) ) ( not ( = ?auto_183137 ?auto_183140 ) ) ( ON ?auto_183136 ?auto_183137 ) ( CLEAR ?auto_183136 ) ( ON-TABLE ?auto_183138 ) ( ON ?auto_183139 ?auto_183138 ) ( ON ?auto_183140 ?auto_183139 ) ( not ( = ?auto_183138 ?auto_183139 ) ) ( not ( = ?auto_183138 ?auto_183140 ) ) ( not ( = ?auto_183138 ?auto_183137 ) ) ( not ( = ?auto_183138 ?auto_183136 ) ) ( not ( = ?auto_183139 ?auto_183140 ) ) ( not ( = ?auto_183139 ?auto_183137 ) ) ( not ( = ?auto_183139 ?auto_183136 ) ) ( not ( = ?auto_183133 ?auto_183138 ) ) ( not ( = ?auto_183133 ?auto_183139 ) ) ( not ( = ?auto_183134 ?auto_183138 ) ) ( not ( = ?auto_183134 ?auto_183139 ) ) ( not ( = ?auto_183135 ?auto_183138 ) ) ( not ( = ?auto_183135 ?auto_183139 ) ) ( HOLDING ?auto_183135 ) ( CLEAR ?auto_183134 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183133 ?auto_183134 ?auto_183135 )
      ( MAKE-5PILE ?auto_183133 ?auto_183134 ?auto_183135 ?auto_183136 ?auto_183137 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183141 - BLOCK
      ?auto_183142 - BLOCK
      ?auto_183143 - BLOCK
      ?auto_183144 - BLOCK
      ?auto_183145 - BLOCK
    )
    :vars
    (
      ?auto_183147 - BLOCK
      ?auto_183146 - BLOCK
      ?auto_183148 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183141 ) ( ON ?auto_183142 ?auto_183141 ) ( not ( = ?auto_183141 ?auto_183142 ) ) ( not ( = ?auto_183141 ?auto_183143 ) ) ( not ( = ?auto_183141 ?auto_183144 ) ) ( not ( = ?auto_183141 ?auto_183145 ) ) ( not ( = ?auto_183142 ?auto_183143 ) ) ( not ( = ?auto_183142 ?auto_183144 ) ) ( not ( = ?auto_183142 ?auto_183145 ) ) ( not ( = ?auto_183143 ?auto_183144 ) ) ( not ( = ?auto_183143 ?auto_183145 ) ) ( not ( = ?auto_183144 ?auto_183145 ) ) ( ON ?auto_183145 ?auto_183147 ) ( not ( = ?auto_183141 ?auto_183147 ) ) ( not ( = ?auto_183142 ?auto_183147 ) ) ( not ( = ?auto_183143 ?auto_183147 ) ) ( not ( = ?auto_183144 ?auto_183147 ) ) ( not ( = ?auto_183145 ?auto_183147 ) ) ( ON ?auto_183144 ?auto_183145 ) ( ON-TABLE ?auto_183146 ) ( ON ?auto_183148 ?auto_183146 ) ( ON ?auto_183147 ?auto_183148 ) ( not ( = ?auto_183146 ?auto_183148 ) ) ( not ( = ?auto_183146 ?auto_183147 ) ) ( not ( = ?auto_183146 ?auto_183145 ) ) ( not ( = ?auto_183146 ?auto_183144 ) ) ( not ( = ?auto_183148 ?auto_183147 ) ) ( not ( = ?auto_183148 ?auto_183145 ) ) ( not ( = ?auto_183148 ?auto_183144 ) ) ( not ( = ?auto_183141 ?auto_183146 ) ) ( not ( = ?auto_183141 ?auto_183148 ) ) ( not ( = ?auto_183142 ?auto_183146 ) ) ( not ( = ?auto_183142 ?auto_183148 ) ) ( not ( = ?auto_183143 ?auto_183146 ) ) ( not ( = ?auto_183143 ?auto_183148 ) ) ( CLEAR ?auto_183142 ) ( ON ?auto_183143 ?auto_183144 ) ( CLEAR ?auto_183143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183146 ?auto_183148 ?auto_183147 ?auto_183145 ?auto_183144 )
      ( MAKE-5PILE ?auto_183141 ?auto_183142 ?auto_183143 ?auto_183144 ?auto_183145 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183149 - BLOCK
      ?auto_183150 - BLOCK
      ?auto_183151 - BLOCK
      ?auto_183152 - BLOCK
      ?auto_183153 - BLOCK
    )
    :vars
    (
      ?auto_183155 - BLOCK
      ?auto_183154 - BLOCK
      ?auto_183156 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183149 ) ( not ( = ?auto_183149 ?auto_183150 ) ) ( not ( = ?auto_183149 ?auto_183151 ) ) ( not ( = ?auto_183149 ?auto_183152 ) ) ( not ( = ?auto_183149 ?auto_183153 ) ) ( not ( = ?auto_183150 ?auto_183151 ) ) ( not ( = ?auto_183150 ?auto_183152 ) ) ( not ( = ?auto_183150 ?auto_183153 ) ) ( not ( = ?auto_183151 ?auto_183152 ) ) ( not ( = ?auto_183151 ?auto_183153 ) ) ( not ( = ?auto_183152 ?auto_183153 ) ) ( ON ?auto_183153 ?auto_183155 ) ( not ( = ?auto_183149 ?auto_183155 ) ) ( not ( = ?auto_183150 ?auto_183155 ) ) ( not ( = ?auto_183151 ?auto_183155 ) ) ( not ( = ?auto_183152 ?auto_183155 ) ) ( not ( = ?auto_183153 ?auto_183155 ) ) ( ON ?auto_183152 ?auto_183153 ) ( ON-TABLE ?auto_183154 ) ( ON ?auto_183156 ?auto_183154 ) ( ON ?auto_183155 ?auto_183156 ) ( not ( = ?auto_183154 ?auto_183156 ) ) ( not ( = ?auto_183154 ?auto_183155 ) ) ( not ( = ?auto_183154 ?auto_183153 ) ) ( not ( = ?auto_183154 ?auto_183152 ) ) ( not ( = ?auto_183156 ?auto_183155 ) ) ( not ( = ?auto_183156 ?auto_183153 ) ) ( not ( = ?auto_183156 ?auto_183152 ) ) ( not ( = ?auto_183149 ?auto_183154 ) ) ( not ( = ?auto_183149 ?auto_183156 ) ) ( not ( = ?auto_183150 ?auto_183154 ) ) ( not ( = ?auto_183150 ?auto_183156 ) ) ( not ( = ?auto_183151 ?auto_183154 ) ) ( not ( = ?auto_183151 ?auto_183156 ) ) ( ON ?auto_183151 ?auto_183152 ) ( CLEAR ?auto_183151 ) ( HOLDING ?auto_183150 ) ( CLEAR ?auto_183149 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183149 ?auto_183150 )
      ( MAKE-5PILE ?auto_183149 ?auto_183150 ?auto_183151 ?auto_183152 ?auto_183153 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183157 - BLOCK
      ?auto_183158 - BLOCK
      ?auto_183159 - BLOCK
      ?auto_183160 - BLOCK
      ?auto_183161 - BLOCK
    )
    :vars
    (
      ?auto_183163 - BLOCK
      ?auto_183162 - BLOCK
      ?auto_183164 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183157 ) ( not ( = ?auto_183157 ?auto_183158 ) ) ( not ( = ?auto_183157 ?auto_183159 ) ) ( not ( = ?auto_183157 ?auto_183160 ) ) ( not ( = ?auto_183157 ?auto_183161 ) ) ( not ( = ?auto_183158 ?auto_183159 ) ) ( not ( = ?auto_183158 ?auto_183160 ) ) ( not ( = ?auto_183158 ?auto_183161 ) ) ( not ( = ?auto_183159 ?auto_183160 ) ) ( not ( = ?auto_183159 ?auto_183161 ) ) ( not ( = ?auto_183160 ?auto_183161 ) ) ( ON ?auto_183161 ?auto_183163 ) ( not ( = ?auto_183157 ?auto_183163 ) ) ( not ( = ?auto_183158 ?auto_183163 ) ) ( not ( = ?auto_183159 ?auto_183163 ) ) ( not ( = ?auto_183160 ?auto_183163 ) ) ( not ( = ?auto_183161 ?auto_183163 ) ) ( ON ?auto_183160 ?auto_183161 ) ( ON-TABLE ?auto_183162 ) ( ON ?auto_183164 ?auto_183162 ) ( ON ?auto_183163 ?auto_183164 ) ( not ( = ?auto_183162 ?auto_183164 ) ) ( not ( = ?auto_183162 ?auto_183163 ) ) ( not ( = ?auto_183162 ?auto_183161 ) ) ( not ( = ?auto_183162 ?auto_183160 ) ) ( not ( = ?auto_183164 ?auto_183163 ) ) ( not ( = ?auto_183164 ?auto_183161 ) ) ( not ( = ?auto_183164 ?auto_183160 ) ) ( not ( = ?auto_183157 ?auto_183162 ) ) ( not ( = ?auto_183157 ?auto_183164 ) ) ( not ( = ?auto_183158 ?auto_183162 ) ) ( not ( = ?auto_183158 ?auto_183164 ) ) ( not ( = ?auto_183159 ?auto_183162 ) ) ( not ( = ?auto_183159 ?auto_183164 ) ) ( ON ?auto_183159 ?auto_183160 ) ( CLEAR ?auto_183157 ) ( ON ?auto_183158 ?auto_183159 ) ( CLEAR ?auto_183158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183162 ?auto_183164 ?auto_183163 ?auto_183161 ?auto_183160 ?auto_183159 )
      ( MAKE-5PILE ?auto_183157 ?auto_183158 ?auto_183159 ?auto_183160 ?auto_183161 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183165 - BLOCK
      ?auto_183166 - BLOCK
      ?auto_183167 - BLOCK
      ?auto_183168 - BLOCK
      ?auto_183169 - BLOCK
    )
    :vars
    (
      ?auto_183170 - BLOCK
      ?auto_183172 - BLOCK
      ?auto_183171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183165 ?auto_183166 ) ) ( not ( = ?auto_183165 ?auto_183167 ) ) ( not ( = ?auto_183165 ?auto_183168 ) ) ( not ( = ?auto_183165 ?auto_183169 ) ) ( not ( = ?auto_183166 ?auto_183167 ) ) ( not ( = ?auto_183166 ?auto_183168 ) ) ( not ( = ?auto_183166 ?auto_183169 ) ) ( not ( = ?auto_183167 ?auto_183168 ) ) ( not ( = ?auto_183167 ?auto_183169 ) ) ( not ( = ?auto_183168 ?auto_183169 ) ) ( ON ?auto_183169 ?auto_183170 ) ( not ( = ?auto_183165 ?auto_183170 ) ) ( not ( = ?auto_183166 ?auto_183170 ) ) ( not ( = ?auto_183167 ?auto_183170 ) ) ( not ( = ?auto_183168 ?auto_183170 ) ) ( not ( = ?auto_183169 ?auto_183170 ) ) ( ON ?auto_183168 ?auto_183169 ) ( ON-TABLE ?auto_183172 ) ( ON ?auto_183171 ?auto_183172 ) ( ON ?auto_183170 ?auto_183171 ) ( not ( = ?auto_183172 ?auto_183171 ) ) ( not ( = ?auto_183172 ?auto_183170 ) ) ( not ( = ?auto_183172 ?auto_183169 ) ) ( not ( = ?auto_183172 ?auto_183168 ) ) ( not ( = ?auto_183171 ?auto_183170 ) ) ( not ( = ?auto_183171 ?auto_183169 ) ) ( not ( = ?auto_183171 ?auto_183168 ) ) ( not ( = ?auto_183165 ?auto_183172 ) ) ( not ( = ?auto_183165 ?auto_183171 ) ) ( not ( = ?auto_183166 ?auto_183172 ) ) ( not ( = ?auto_183166 ?auto_183171 ) ) ( not ( = ?auto_183167 ?auto_183172 ) ) ( not ( = ?auto_183167 ?auto_183171 ) ) ( ON ?auto_183167 ?auto_183168 ) ( ON ?auto_183166 ?auto_183167 ) ( CLEAR ?auto_183166 ) ( HOLDING ?auto_183165 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183165 )
      ( MAKE-5PILE ?auto_183165 ?auto_183166 ?auto_183167 ?auto_183168 ?auto_183169 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183173 - BLOCK
      ?auto_183174 - BLOCK
      ?auto_183175 - BLOCK
      ?auto_183176 - BLOCK
      ?auto_183177 - BLOCK
    )
    :vars
    (
      ?auto_183179 - BLOCK
      ?auto_183180 - BLOCK
      ?auto_183178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183173 ?auto_183174 ) ) ( not ( = ?auto_183173 ?auto_183175 ) ) ( not ( = ?auto_183173 ?auto_183176 ) ) ( not ( = ?auto_183173 ?auto_183177 ) ) ( not ( = ?auto_183174 ?auto_183175 ) ) ( not ( = ?auto_183174 ?auto_183176 ) ) ( not ( = ?auto_183174 ?auto_183177 ) ) ( not ( = ?auto_183175 ?auto_183176 ) ) ( not ( = ?auto_183175 ?auto_183177 ) ) ( not ( = ?auto_183176 ?auto_183177 ) ) ( ON ?auto_183177 ?auto_183179 ) ( not ( = ?auto_183173 ?auto_183179 ) ) ( not ( = ?auto_183174 ?auto_183179 ) ) ( not ( = ?auto_183175 ?auto_183179 ) ) ( not ( = ?auto_183176 ?auto_183179 ) ) ( not ( = ?auto_183177 ?auto_183179 ) ) ( ON ?auto_183176 ?auto_183177 ) ( ON-TABLE ?auto_183180 ) ( ON ?auto_183178 ?auto_183180 ) ( ON ?auto_183179 ?auto_183178 ) ( not ( = ?auto_183180 ?auto_183178 ) ) ( not ( = ?auto_183180 ?auto_183179 ) ) ( not ( = ?auto_183180 ?auto_183177 ) ) ( not ( = ?auto_183180 ?auto_183176 ) ) ( not ( = ?auto_183178 ?auto_183179 ) ) ( not ( = ?auto_183178 ?auto_183177 ) ) ( not ( = ?auto_183178 ?auto_183176 ) ) ( not ( = ?auto_183173 ?auto_183180 ) ) ( not ( = ?auto_183173 ?auto_183178 ) ) ( not ( = ?auto_183174 ?auto_183180 ) ) ( not ( = ?auto_183174 ?auto_183178 ) ) ( not ( = ?auto_183175 ?auto_183180 ) ) ( not ( = ?auto_183175 ?auto_183178 ) ) ( ON ?auto_183175 ?auto_183176 ) ( ON ?auto_183174 ?auto_183175 ) ( ON ?auto_183173 ?auto_183174 ) ( CLEAR ?auto_183173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183180 ?auto_183178 ?auto_183179 ?auto_183177 ?auto_183176 ?auto_183175 ?auto_183174 )
      ( MAKE-5PILE ?auto_183173 ?auto_183174 ?auto_183175 ?auto_183176 ?auto_183177 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183186 - BLOCK
      ?auto_183187 - BLOCK
      ?auto_183188 - BLOCK
      ?auto_183189 - BLOCK
      ?auto_183190 - BLOCK
    )
    :vars
    (
      ?auto_183192 - BLOCK
      ?auto_183191 - BLOCK
      ?auto_183193 - BLOCK
      ?auto_183194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183186 ?auto_183187 ) ) ( not ( = ?auto_183186 ?auto_183188 ) ) ( not ( = ?auto_183186 ?auto_183189 ) ) ( not ( = ?auto_183186 ?auto_183190 ) ) ( not ( = ?auto_183187 ?auto_183188 ) ) ( not ( = ?auto_183187 ?auto_183189 ) ) ( not ( = ?auto_183187 ?auto_183190 ) ) ( not ( = ?auto_183188 ?auto_183189 ) ) ( not ( = ?auto_183188 ?auto_183190 ) ) ( not ( = ?auto_183189 ?auto_183190 ) ) ( ON ?auto_183190 ?auto_183192 ) ( not ( = ?auto_183186 ?auto_183192 ) ) ( not ( = ?auto_183187 ?auto_183192 ) ) ( not ( = ?auto_183188 ?auto_183192 ) ) ( not ( = ?auto_183189 ?auto_183192 ) ) ( not ( = ?auto_183190 ?auto_183192 ) ) ( ON ?auto_183189 ?auto_183190 ) ( ON-TABLE ?auto_183191 ) ( ON ?auto_183193 ?auto_183191 ) ( ON ?auto_183192 ?auto_183193 ) ( not ( = ?auto_183191 ?auto_183193 ) ) ( not ( = ?auto_183191 ?auto_183192 ) ) ( not ( = ?auto_183191 ?auto_183190 ) ) ( not ( = ?auto_183191 ?auto_183189 ) ) ( not ( = ?auto_183193 ?auto_183192 ) ) ( not ( = ?auto_183193 ?auto_183190 ) ) ( not ( = ?auto_183193 ?auto_183189 ) ) ( not ( = ?auto_183186 ?auto_183191 ) ) ( not ( = ?auto_183186 ?auto_183193 ) ) ( not ( = ?auto_183187 ?auto_183191 ) ) ( not ( = ?auto_183187 ?auto_183193 ) ) ( not ( = ?auto_183188 ?auto_183191 ) ) ( not ( = ?auto_183188 ?auto_183193 ) ) ( ON ?auto_183188 ?auto_183189 ) ( ON ?auto_183187 ?auto_183188 ) ( CLEAR ?auto_183187 ) ( ON ?auto_183186 ?auto_183194 ) ( CLEAR ?auto_183186 ) ( HAND-EMPTY ) ( not ( = ?auto_183186 ?auto_183194 ) ) ( not ( = ?auto_183187 ?auto_183194 ) ) ( not ( = ?auto_183188 ?auto_183194 ) ) ( not ( = ?auto_183189 ?auto_183194 ) ) ( not ( = ?auto_183190 ?auto_183194 ) ) ( not ( = ?auto_183192 ?auto_183194 ) ) ( not ( = ?auto_183191 ?auto_183194 ) ) ( not ( = ?auto_183193 ?auto_183194 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183186 ?auto_183194 )
      ( MAKE-5PILE ?auto_183186 ?auto_183187 ?auto_183188 ?auto_183189 ?auto_183190 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183195 - BLOCK
      ?auto_183196 - BLOCK
      ?auto_183197 - BLOCK
      ?auto_183198 - BLOCK
      ?auto_183199 - BLOCK
    )
    :vars
    (
      ?auto_183200 - BLOCK
      ?auto_183202 - BLOCK
      ?auto_183201 - BLOCK
      ?auto_183203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183195 ?auto_183196 ) ) ( not ( = ?auto_183195 ?auto_183197 ) ) ( not ( = ?auto_183195 ?auto_183198 ) ) ( not ( = ?auto_183195 ?auto_183199 ) ) ( not ( = ?auto_183196 ?auto_183197 ) ) ( not ( = ?auto_183196 ?auto_183198 ) ) ( not ( = ?auto_183196 ?auto_183199 ) ) ( not ( = ?auto_183197 ?auto_183198 ) ) ( not ( = ?auto_183197 ?auto_183199 ) ) ( not ( = ?auto_183198 ?auto_183199 ) ) ( ON ?auto_183199 ?auto_183200 ) ( not ( = ?auto_183195 ?auto_183200 ) ) ( not ( = ?auto_183196 ?auto_183200 ) ) ( not ( = ?auto_183197 ?auto_183200 ) ) ( not ( = ?auto_183198 ?auto_183200 ) ) ( not ( = ?auto_183199 ?auto_183200 ) ) ( ON ?auto_183198 ?auto_183199 ) ( ON-TABLE ?auto_183202 ) ( ON ?auto_183201 ?auto_183202 ) ( ON ?auto_183200 ?auto_183201 ) ( not ( = ?auto_183202 ?auto_183201 ) ) ( not ( = ?auto_183202 ?auto_183200 ) ) ( not ( = ?auto_183202 ?auto_183199 ) ) ( not ( = ?auto_183202 ?auto_183198 ) ) ( not ( = ?auto_183201 ?auto_183200 ) ) ( not ( = ?auto_183201 ?auto_183199 ) ) ( not ( = ?auto_183201 ?auto_183198 ) ) ( not ( = ?auto_183195 ?auto_183202 ) ) ( not ( = ?auto_183195 ?auto_183201 ) ) ( not ( = ?auto_183196 ?auto_183202 ) ) ( not ( = ?auto_183196 ?auto_183201 ) ) ( not ( = ?auto_183197 ?auto_183202 ) ) ( not ( = ?auto_183197 ?auto_183201 ) ) ( ON ?auto_183197 ?auto_183198 ) ( ON ?auto_183195 ?auto_183203 ) ( CLEAR ?auto_183195 ) ( not ( = ?auto_183195 ?auto_183203 ) ) ( not ( = ?auto_183196 ?auto_183203 ) ) ( not ( = ?auto_183197 ?auto_183203 ) ) ( not ( = ?auto_183198 ?auto_183203 ) ) ( not ( = ?auto_183199 ?auto_183203 ) ) ( not ( = ?auto_183200 ?auto_183203 ) ) ( not ( = ?auto_183202 ?auto_183203 ) ) ( not ( = ?auto_183201 ?auto_183203 ) ) ( HOLDING ?auto_183196 ) ( CLEAR ?auto_183197 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183202 ?auto_183201 ?auto_183200 ?auto_183199 ?auto_183198 ?auto_183197 ?auto_183196 )
      ( MAKE-5PILE ?auto_183195 ?auto_183196 ?auto_183197 ?auto_183198 ?auto_183199 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183204 - BLOCK
      ?auto_183205 - BLOCK
      ?auto_183206 - BLOCK
      ?auto_183207 - BLOCK
      ?auto_183208 - BLOCK
    )
    :vars
    (
      ?auto_183210 - BLOCK
      ?auto_183209 - BLOCK
      ?auto_183211 - BLOCK
      ?auto_183212 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183204 ?auto_183205 ) ) ( not ( = ?auto_183204 ?auto_183206 ) ) ( not ( = ?auto_183204 ?auto_183207 ) ) ( not ( = ?auto_183204 ?auto_183208 ) ) ( not ( = ?auto_183205 ?auto_183206 ) ) ( not ( = ?auto_183205 ?auto_183207 ) ) ( not ( = ?auto_183205 ?auto_183208 ) ) ( not ( = ?auto_183206 ?auto_183207 ) ) ( not ( = ?auto_183206 ?auto_183208 ) ) ( not ( = ?auto_183207 ?auto_183208 ) ) ( ON ?auto_183208 ?auto_183210 ) ( not ( = ?auto_183204 ?auto_183210 ) ) ( not ( = ?auto_183205 ?auto_183210 ) ) ( not ( = ?auto_183206 ?auto_183210 ) ) ( not ( = ?auto_183207 ?auto_183210 ) ) ( not ( = ?auto_183208 ?auto_183210 ) ) ( ON ?auto_183207 ?auto_183208 ) ( ON-TABLE ?auto_183209 ) ( ON ?auto_183211 ?auto_183209 ) ( ON ?auto_183210 ?auto_183211 ) ( not ( = ?auto_183209 ?auto_183211 ) ) ( not ( = ?auto_183209 ?auto_183210 ) ) ( not ( = ?auto_183209 ?auto_183208 ) ) ( not ( = ?auto_183209 ?auto_183207 ) ) ( not ( = ?auto_183211 ?auto_183210 ) ) ( not ( = ?auto_183211 ?auto_183208 ) ) ( not ( = ?auto_183211 ?auto_183207 ) ) ( not ( = ?auto_183204 ?auto_183209 ) ) ( not ( = ?auto_183204 ?auto_183211 ) ) ( not ( = ?auto_183205 ?auto_183209 ) ) ( not ( = ?auto_183205 ?auto_183211 ) ) ( not ( = ?auto_183206 ?auto_183209 ) ) ( not ( = ?auto_183206 ?auto_183211 ) ) ( ON ?auto_183206 ?auto_183207 ) ( ON ?auto_183204 ?auto_183212 ) ( not ( = ?auto_183204 ?auto_183212 ) ) ( not ( = ?auto_183205 ?auto_183212 ) ) ( not ( = ?auto_183206 ?auto_183212 ) ) ( not ( = ?auto_183207 ?auto_183212 ) ) ( not ( = ?auto_183208 ?auto_183212 ) ) ( not ( = ?auto_183210 ?auto_183212 ) ) ( not ( = ?auto_183209 ?auto_183212 ) ) ( not ( = ?auto_183211 ?auto_183212 ) ) ( CLEAR ?auto_183206 ) ( ON ?auto_183205 ?auto_183204 ) ( CLEAR ?auto_183205 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183212 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183212 ?auto_183204 )
      ( MAKE-5PILE ?auto_183204 ?auto_183205 ?auto_183206 ?auto_183207 ?auto_183208 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183213 - BLOCK
      ?auto_183214 - BLOCK
      ?auto_183215 - BLOCK
      ?auto_183216 - BLOCK
      ?auto_183217 - BLOCK
    )
    :vars
    (
      ?auto_183221 - BLOCK
      ?auto_183218 - BLOCK
      ?auto_183219 - BLOCK
      ?auto_183220 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183213 ?auto_183214 ) ) ( not ( = ?auto_183213 ?auto_183215 ) ) ( not ( = ?auto_183213 ?auto_183216 ) ) ( not ( = ?auto_183213 ?auto_183217 ) ) ( not ( = ?auto_183214 ?auto_183215 ) ) ( not ( = ?auto_183214 ?auto_183216 ) ) ( not ( = ?auto_183214 ?auto_183217 ) ) ( not ( = ?auto_183215 ?auto_183216 ) ) ( not ( = ?auto_183215 ?auto_183217 ) ) ( not ( = ?auto_183216 ?auto_183217 ) ) ( ON ?auto_183217 ?auto_183221 ) ( not ( = ?auto_183213 ?auto_183221 ) ) ( not ( = ?auto_183214 ?auto_183221 ) ) ( not ( = ?auto_183215 ?auto_183221 ) ) ( not ( = ?auto_183216 ?auto_183221 ) ) ( not ( = ?auto_183217 ?auto_183221 ) ) ( ON ?auto_183216 ?auto_183217 ) ( ON-TABLE ?auto_183218 ) ( ON ?auto_183219 ?auto_183218 ) ( ON ?auto_183221 ?auto_183219 ) ( not ( = ?auto_183218 ?auto_183219 ) ) ( not ( = ?auto_183218 ?auto_183221 ) ) ( not ( = ?auto_183218 ?auto_183217 ) ) ( not ( = ?auto_183218 ?auto_183216 ) ) ( not ( = ?auto_183219 ?auto_183221 ) ) ( not ( = ?auto_183219 ?auto_183217 ) ) ( not ( = ?auto_183219 ?auto_183216 ) ) ( not ( = ?auto_183213 ?auto_183218 ) ) ( not ( = ?auto_183213 ?auto_183219 ) ) ( not ( = ?auto_183214 ?auto_183218 ) ) ( not ( = ?auto_183214 ?auto_183219 ) ) ( not ( = ?auto_183215 ?auto_183218 ) ) ( not ( = ?auto_183215 ?auto_183219 ) ) ( ON ?auto_183213 ?auto_183220 ) ( not ( = ?auto_183213 ?auto_183220 ) ) ( not ( = ?auto_183214 ?auto_183220 ) ) ( not ( = ?auto_183215 ?auto_183220 ) ) ( not ( = ?auto_183216 ?auto_183220 ) ) ( not ( = ?auto_183217 ?auto_183220 ) ) ( not ( = ?auto_183221 ?auto_183220 ) ) ( not ( = ?auto_183218 ?auto_183220 ) ) ( not ( = ?auto_183219 ?auto_183220 ) ) ( ON ?auto_183214 ?auto_183213 ) ( CLEAR ?auto_183214 ) ( ON-TABLE ?auto_183220 ) ( HOLDING ?auto_183215 ) ( CLEAR ?auto_183216 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183218 ?auto_183219 ?auto_183221 ?auto_183217 ?auto_183216 ?auto_183215 )
      ( MAKE-5PILE ?auto_183213 ?auto_183214 ?auto_183215 ?auto_183216 ?auto_183217 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183222 - BLOCK
      ?auto_183223 - BLOCK
      ?auto_183224 - BLOCK
      ?auto_183225 - BLOCK
      ?auto_183226 - BLOCK
    )
    :vars
    (
      ?auto_183227 - BLOCK
      ?auto_183228 - BLOCK
      ?auto_183229 - BLOCK
      ?auto_183230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183222 ?auto_183223 ) ) ( not ( = ?auto_183222 ?auto_183224 ) ) ( not ( = ?auto_183222 ?auto_183225 ) ) ( not ( = ?auto_183222 ?auto_183226 ) ) ( not ( = ?auto_183223 ?auto_183224 ) ) ( not ( = ?auto_183223 ?auto_183225 ) ) ( not ( = ?auto_183223 ?auto_183226 ) ) ( not ( = ?auto_183224 ?auto_183225 ) ) ( not ( = ?auto_183224 ?auto_183226 ) ) ( not ( = ?auto_183225 ?auto_183226 ) ) ( ON ?auto_183226 ?auto_183227 ) ( not ( = ?auto_183222 ?auto_183227 ) ) ( not ( = ?auto_183223 ?auto_183227 ) ) ( not ( = ?auto_183224 ?auto_183227 ) ) ( not ( = ?auto_183225 ?auto_183227 ) ) ( not ( = ?auto_183226 ?auto_183227 ) ) ( ON ?auto_183225 ?auto_183226 ) ( ON-TABLE ?auto_183228 ) ( ON ?auto_183229 ?auto_183228 ) ( ON ?auto_183227 ?auto_183229 ) ( not ( = ?auto_183228 ?auto_183229 ) ) ( not ( = ?auto_183228 ?auto_183227 ) ) ( not ( = ?auto_183228 ?auto_183226 ) ) ( not ( = ?auto_183228 ?auto_183225 ) ) ( not ( = ?auto_183229 ?auto_183227 ) ) ( not ( = ?auto_183229 ?auto_183226 ) ) ( not ( = ?auto_183229 ?auto_183225 ) ) ( not ( = ?auto_183222 ?auto_183228 ) ) ( not ( = ?auto_183222 ?auto_183229 ) ) ( not ( = ?auto_183223 ?auto_183228 ) ) ( not ( = ?auto_183223 ?auto_183229 ) ) ( not ( = ?auto_183224 ?auto_183228 ) ) ( not ( = ?auto_183224 ?auto_183229 ) ) ( ON ?auto_183222 ?auto_183230 ) ( not ( = ?auto_183222 ?auto_183230 ) ) ( not ( = ?auto_183223 ?auto_183230 ) ) ( not ( = ?auto_183224 ?auto_183230 ) ) ( not ( = ?auto_183225 ?auto_183230 ) ) ( not ( = ?auto_183226 ?auto_183230 ) ) ( not ( = ?auto_183227 ?auto_183230 ) ) ( not ( = ?auto_183228 ?auto_183230 ) ) ( not ( = ?auto_183229 ?auto_183230 ) ) ( ON ?auto_183223 ?auto_183222 ) ( ON-TABLE ?auto_183230 ) ( CLEAR ?auto_183225 ) ( ON ?auto_183224 ?auto_183223 ) ( CLEAR ?auto_183224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183230 ?auto_183222 ?auto_183223 )
      ( MAKE-5PILE ?auto_183222 ?auto_183223 ?auto_183224 ?auto_183225 ?auto_183226 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183231 - BLOCK
      ?auto_183232 - BLOCK
      ?auto_183233 - BLOCK
      ?auto_183234 - BLOCK
      ?auto_183235 - BLOCK
    )
    :vars
    (
      ?auto_183238 - BLOCK
      ?auto_183239 - BLOCK
      ?auto_183237 - BLOCK
      ?auto_183236 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183231 ?auto_183232 ) ) ( not ( = ?auto_183231 ?auto_183233 ) ) ( not ( = ?auto_183231 ?auto_183234 ) ) ( not ( = ?auto_183231 ?auto_183235 ) ) ( not ( = ?auto_183232 ?auto_183233 ) ) ( not ( = ?auto_183232 ?auto_183234 ) ) ( not ( = ?auto_183232 ?auto_183235 ) ) ( not ( = ?auto_183233 ?auto_183234 ) ) ( not ( = ?auto_183233 ?auto_183235 ) ) ( not ( = ?auto_183234 ?auto_183235 ) ) ( ON ?auto_183235 ?auto_183238 ) ( not ( = ?auto_183231 ?auto_183238 ) ) ( not ( = ?auto_183232 ?auto_183238 ) ) ( not ( = ?auto_183233 ?auto_183238 ) ) ( not ( = ?auto_183234 ?auto_183238 ) ) ( not ( = ?auto_183235 ?auto_183238 ) ) ( ON-TABLE ?auto_183239 ) ( ON ?auto_183237 ?auto_183239 ) ( ON ?auto_183238 ?auto_183237 ) ( not ( = ?auto_183239 ?auto_183237 ) ) ( not ( = ?auto_183239 ?auto_183238 ) ) ( not ( = ?auto_183239 ?auto_183235 ) ) ( not ( = ?auto_183239 ?auto_183234 ) ) ( not ( = ?auto_183237 ?auto_183238 ) ) ( not ( = ?auto_183237 ?auto_183235 ) ) ( not ( = ?auto_183237 ?auto_183234 ) ) ( not ( = ?auto_183231 ?auto_183239 ) ) ( not ( = ?auto_183231 ?auto_183237 ) ) ( not ( = ?auto_183232 ?auto_183239 ) ) ( not ( = ?auto_183232 ?auto_183237 ) ) ( not ( = ?auto_183233 ?auto_183239 ) ) ( not ( = ?auto_183233 ?auto_183237 ) ) ( ON ?auto_183231 ?auto_183236 ) ( not ( = ?auto_183231 ?auto_183236 ) ) ( not ( = ?auto_183232 ?auto_183236 ) ) ( not ( = ?auto_183233 ?auto_183236 ) ) ( not ( = ?auto_183234 ?auto_183236 ) ) ( not ( = ?auto_183235 ?auto_183236 ) ) ( not ( = ?auto_183238 ?auto_183236 ) ) ( not ( = ?auto_183239 ?auto_183236 ) ) ( not ( = ?auto_183237 ?auto_183236 ) ) ( ON ?auto_183232 ?auto_183231 ) ( ON-TABLE ?auto_183236 ) ( ON ?auto_183233 ?auto_183232 ) ( CLEAR ?auto_183233 ) ( HOLDING ?auto_183234 ) ( CLEAR ?auto_183235 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183239 ?auto_183237 ?auto_183238 ?auto_183235 ?auto_183234 )
      ( MAKE-5PILE ?auto_183231 ?auto_183232 ?auto_183233 ?auto_183234 ?auto_183235 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183240 - BLOCK
      ?auto_183241 - BLOCK
      ?auto_183242 - BLOCK
      ?auto_183243 - BLOCK
      ?auto_183244 - BLOCK
    )
    :vars
    (
      ?auto_183247 - BLOCK
      ?auto_183246 - BLOCK
      ?auto_183245 - BLOCK
      ?auto_183248 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183240 ?auto_183241 ) ) ( not ( = ?auto_183240 ?auto_183242 ) ) ( not ( = ?auto_183240 ?auto_183243 ) ) ( not ( = ?auto_183240 ?auto_183244 ) ) ( not ( = ?auto_183241 ?auto_183242 ) ) ( not ( = ?auto_183241 ?auto_183243 ) ) ( not ( = ?auto_183241 ?auto_183244 ) ) ( not ( = ?auto_183242 ?auto_183243 ) ) ( not ( = ?auto_183242 ?auto_183244 ) ) ( not ( = ?auto_183243 ?auto_183244 ) ) ( ON ?auto_183244 ?auto_183247 ) ( not ( = ?auto_183240 ?auto_183247 ) ) ( not ( = ?auto_183241 ?auto_183247 ) ) ( not ( = ?auto_183242 ?auto_183247 ) ) ( not ( = ?auto_183243 ?auto_183247 ) ) ( not ( = ?auto_183244 ?auto_183247 ) ) ( ON-TABLE ?auto_183246 ) ( ON ?auto_183245 ?auto_183246 ) ( ON ?auto_183247 ?auto_183245 ) ( not ( = ?auto_183246 ?auto_183245 ) ) ( not ( = ?auto_183246 ?auto_183247 ) ) ( not ( = ?auto_183246 ?auto_183244 ) ) ( not ( = ?auto_183246 ?auto_183243 ) ) ( not ( = ?auto_183245 ?auto_183247 ) ) ( not ( = ?auto_183245 ?auto_183244 ) ) ( not ( = ?auto_183245 ?auto_183243 ) ) ( not ( = ?auto_183240 ?auto_183246 ) ) ( not ( = ?auto_183240 ?auto_183245 ) ) ( not ( = ?auto_183241 ?auto_183246 ) ) ( not ( = ?auto_183241 ?auto_183245 ) ) ( not ( = ?auto_183242 ?auto_183246 ) ) ( not ( = ?auto_183242 ?auto_183245 ) ) ( ON ?auto_183240 ?auto_183248 ) ( not ( = ?auto_183240 ?auto_183248 ) ) ( not ( = ?auto_183241 ?auto_183248 ) ) ( not ( = ?auto_183242 ?auto_183248 ) ) ( not ( = ?auto_183243 ?auto_183248 ) ) ( not ( = ?auto_183244 ?auto_183248 ) ) ( not ( = ?auto_183247 ?auto_183248 ) ) ( not ( = ?auto_183246 ?auto_183248 ) ) ( not ( = ?auto_183245 ?auto_183248 ) ) ( ON ?auto_183241 ?auto_183240 ) ( ON-TABLE ?auto_183248 ) ( ON ?auto_183242 ?auto_183241 ) ( CLEAR ?auto_183244 ) ( ON ?auto_183243 ?auto_183242 ) ( CLEAR ?auto_183243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183248 ?auto_183240 ?auto_183241 ?auto_183242 )
      ( MAKE-5PILE ?auto_183240 ?auto_183241 ?auto_183242 ?auto_183243 ?auto_183244 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183249 - BLOCK
      ?auto_183250 - BLOCK
      ?auto_183251 - BLOCK
      ?auto_183252 - BLOCK
      ?auto_183253 - BLOCK
    )
    :vars
    (
      ?auto_183255 - BLOCK
      ?auto_183254 - BLOCK
      ?auto_183256 - BLOCK
      ?auto_183257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183249 ?auto_183250 ) ) ( not ( = ?auto_183249 ?auto_183251 ) ) ( not ( = ?auto_183249 ?auto_183252 ) ) ( not ( = ?auto_183249 ?auto_183253 ) ) ( not ( = ?auto_183250 ?auto_183251 ) ) ( not ( = ?auto_183250 ?auto_183252 ) ) ( not ( = ?auto_183250 ?auto_183253 ) ) ( not ( = ?auto_183251 ?auto_183252 ) ) ( not ( = ?auto_183251 ?auto_183253 ) ) ( not ( = ?auto_183252 ?auto_183253 ) ) ( not ( = ?auto_183249 ?auto_183255 ) ) ( not ( = ?auto_183250 ?auto_183255 ) ) ( not ( = ?auto_183251 ?auto_183255 ) ) ( not ( = ?auto_183252 ?auto_183255 ) ) ( not ( = ?auto_183253 ?auto_183255 ) ) ( ON-TABLE ?auto_183254 ) ( ON ?auto_183256 ?auto_183254 ) ( ON ?auto_183255 ?auto_183256 ) ( not ( = ?auto_183254 ?auto_183256 ) ) ( not ( = ?auto_183254 ?auto_183255 ) ) ( not ( = ?auto_183254 ?auto_183253 ) ) ( not ( = ?auto_183254 ?auto_183252 ) ) ( not ( = ?auto_183256 ?auto_183255 ) ) ( not ( = ?auto_183256 ?auto_183253 ) ) ( not ( = ?auto_183256 ?auto_183252 ) ) ( not ( = ?auto_183249 ?auto_183254 ) ) ( not ( = ?auto_183249 ?auto_183256 ) ) ( not ( = ?auto_183250 ?auto_183254 ) ) ( not ( = ?auto_183250 ?auto_183256 ) ) ( not ( = ?auto_183251 ?auto_183254 ) ) ( not ( = ?auto_183251 ?auto_183256 ) ) ( ON ?auto_183249 ?auto_183257 ) ( not ( = ?auto_183249 ?auto_183257 ) ) ( not ( = ?auto_183250 ?auto_183257 ) ) ( not ( = ?auto_183251 ?auto_183257 ) ) ( not ( = ?auto_183252 ?auto_183257 ) ) ( not ( = ?auto_183253 ?auto_183257 ) ) ( not ( = ?auto_183255 ?auto_183257 ) ) ( not ( = ?auto_183254 ?auto_183257 ) ) ( not ( = ?auto_183256 ?auto_183257 ) ) ( ON ?auto_183250 ?auto_183249 ) ( ON-TABLE ?auto_183257 ) ( ON ?auto_183251 ?auto_183250 ) ( ON ?auto_183252 ?auto_183251 ) ( CLEAR ?auto_183252 ) ( HOLDING ?auto_183253 ) ( CLEAR ?auto_183255 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183254 ?auto_183256 ?auto_183255 ?auto_183253 )
      ( MAKE-5PILE ?auto_183249 ?auto_183250 ?auto_183251 ?auto_183252 ?auto_183253 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183258 - BLOCK
      ?auto_183259 - BLOCK
      ?auto_183260 - BLOCK
      ?auto_183261 - BLOCK
      ?auto_183262 - BLOCK
    )
    :vars
    (
      ?auto_183265 - BLOCK
      ?auto_183264 - BLOCK
      ?auto_183263 - BLOCK
      ?auto_183266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183258 ?auto_183259 ) ) ( not ( = ?auto_183258 ?auto_183260 ) ) ( not ( = ?auto_183258 ?auto_183261 ) ) ( not ( = ?auto_183258 ?auto_183262 ) ) ( not ( = ?auto_183259 ?auto_183260 ) ) ( not ( = ?auto_183259 ?auto_183261 ) ) ( not ( = ?auto_183259 ?auto_183262 ) ) ( not ( = ?auto_183260 ?auto_183261 ) ) ( not ( = ?auto_183260 ?auto_183262 ) ) ( not ( = ?auto_183261 ?auto_183262 ) ) ( not ( = ?auto_183258 ?auto_183265 ) ) ( not ( = ?auto_183259 ?auto_183265 ) ) ( not ( = ?auto_183260 ?auto_183265 ) ) ( not ( = ?auto_183261 ?auto_183265 ) ) ( not ( = ?auto_183262 ?auto_183265 ) ) ( ON-TABLE ?auto_183264 ) ( ON ?auto_183263 ?auto_183264 ) ( ON ?auto_183265 ?auto_183263 ) ( not ( = ?auto_183264 ?auto_183263 ) ) ( not ( = ?auto_183264 ?auto_183265 ) ) ( not ( = ?auto_183264 ?auto_183262 ) ) ( not ( = ?auto_183264 ?auto_183261 ) ) ( not ( = ?auto_183263 ?auto_183265 ) ) ( not ( = ?auto_183263 ?auto_183262 ) ) ( not ( = ?auto_183263 ?auto_183261 ) ) ( not ( = ?auto_183258 ?auto_183264 ) ) ( not ( = ?auto_183258 ?auto_183263 ) ) ( not ( = ?auto_183259 ?auto_183264 ) ) ( not ( = ?auto_183259 ?auto_183263 ) ) ( not ( = ?auto_183260 ?auto_183264 ) ) ( not ( = ?auto_183260 ?auto_183263 ) ) ( ON ?auto_183258 ?auto_183266 ) ( not ( = ?auto_183258 ?auto_183266 ) ) ( not ( = ?auto_183259 ?auto_183266 ) ) ( not ( = ?auto_183260 ?auto_183266 ) ) ( not ( = ?auto_183261 ?auto_183266 ) ) ( not ( = ?auto_183262 ?auto_183266 ) ) ( not ( = ?auto_183265 ?auto_183266 ) ) ( not ( = ?auto_183264 ?auto_183266 ) ) ( not ( = ?auto_183263 ?auto_183266 ) ) ( ON ?auto_183259 ?auto_183258 ) ( ON-TABLE ?auto_183266 ) ( ON ?auto_183260 ?auto_183259 ) ( ON ?auto_183261 ?auto_183260 ) ( CLEAR ?auto_183265 ) ( ON ?auto_183262 ?auto_183261 ) ( CLEAR ?auto_183262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183266 ?auto_183258 ?auto_183259 ?auto_183260 ?auto_183261 )
      ( MAKE-5PILE ?auto_183258 ?auto_183259 ?auto_183260 ?auto_183261 ?auto_183262 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183267 - BLOCK
      ?auto_183268 - BLOCK
      ?auto_183269 - BLOCK
      ?auto_183270 - BLOCK
      ?auto_183271 - BLOCK
    )
    :vars
    (
      ?auto_183274 - BLOCK
      ?auto_183275 - BLOCK
      ?auto_183272 - BLOCK
      ?auto_183273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183267 ?auto_183268 ) ) ( not ( = ?auto_183267 ?auto_183269 ) ) ( not ( = ?auto_183267 ?auto_183270 ) ) ( not ( = ?auto_183267 ?auto_183271 ) ) ( not ( = ?auto_183268 ?auto_183269 ) ) ( not ( = ?auto_183268 ?auto_183270 ) ) ( not ( = ?auto_183268 ?auto_183271 ) ) ( not ( = ?auto_183269 ?auto_183270 ) ) ( not ( = ?auto_183269 ?auto_183271 ) ) ( not ( = ?auto_183270 ?auto_183271 ) ) ( not ( = ?auto_183267 ?auto_183274 ) ) ( not ( = ?auto_183268 ?auto_183274 ) ) ( not ( = ?auto_183269 ?auto_183274 ) ) ( not ( = ?auto_183270 ?auto_183274 ) ) ( not ( = ?auto_183271 ?auto_183274 ) ) ( ON-TABLE ?auto_183275 ) ( ON ?auto_183272 ?auto_183275 ) ( not ( = ?auto_183275 ?auto_183272 ) ) ( not ( = ?auto_183275 ?auto_183274 ) ) ( not ( = ?auto_183275 ?auto_183271 ) ) ( not ( = ?auto_183275 ?auto_183270 ) ) ( not ( = ?auto_183272 ?auto_183274 ) ) ( not ( = ?auto_183272 ?auto_183271 ) ) ( not ( = ?auto_183272 ?auto_183270 ) ) ( not ( = ?auto_183267 ?auto_183275 ) ) ( not ( = ?auto_183267 ?auto_183272 ) ) ( not ( = ?auto_183268 ?auto_183275 ) ) ( not ( = ?auto_183268 ?auto_183272 ) ) ( not ( = ?auto_183269 ?auto_183275 ) ) ( not ( = ?auto_183269 ?auto_183272 ) ) ( ON ?auto_183267 ?auto_183273 ) ( not ( = ?auto_183267 ?auto_183273 ) ) ( not ( = ?auto_183268 ?auto_183273 ) ) ( not ( = ?auto_183269 ?auto_183273 ) ) ( not ( = ?auto_183270 ?auto_183273 ) ) ( not ( = ?auto_183271 ?auto_183273 ) ) ( not ( = ?auto_183274 ?auto_183273 ) ) ( not ( = ?auto_183275 ?auto_183273 ) ) ( not ( = ?auto_183272 ?auto_183273 ) ) ( ON ?auto_183268 ?auto_183267 ) ( ON-TABLE ?auto_183273 ) ( ON ?auto_183269 ?auto_183268 ) ( ON ?auto_183270 ?auto_183269 ) ( ON ?auto_183271 ?auto_183270 ) ( CLEAR ?auto_183271 ) ( HOLDING ?auto_183274 ) ( CLEAR ?auto_183272 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183275 ?auto_183272 ?auto_183274 )
      ( MAKE-5PILE ?auto_183267 ?auto_183268 ?auto_183269 ?auto_183270 ?auto_183271 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183276 - BLOCK
      ?auto_183277 - BLOCK
      ?auto_183278 - BLOCK
      ?auto_183279 - BLOCK
      ?auto_183280 - BLOCK
    )
    :vars
    (
      ?auto_183281 - BLOCK
      ?auto_183283 - BLOCK
      ?auto_183282 - BLOCK
      ?auto_183284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183276 ?auto_183277 ) ) ( not ( = ?auto_183276 ?auto_183278 ) ) ( not ( = ?auto_183276 ?auto_183279 ) ) ( not ( = ?auto_183276 ?auto_183280 ) ) ( not ( = ?auto_183277 ?auto_183278 ) ) ( not ( = ?auto_183277 ?auto_183279 ) ) ( not ( = ?auto_183277 ?auto_183280 ) ) ( not ( = ?auto_183278 ?auto_183279 ) ) ( not ( = ?auto_183278 ?auto_183280 ) ) ( not ( = ?auto_183279 ?auto_183280 ) ) ( not ( = ?auto_183276 ?auto_183281 ) ) ( not ( = ?auto_183277 ?auto_183281 ) ) ( not ( = ?auto_183278 ?auto_183281 ) ) ( not ( = ?auto_183279 ?auto_183281 ) ) ( not ( = ?auto_183280 ?auto_183281 ) ) ( ON-TABLE ?auto_183283 ) ( ON ?auto_183282 ?auto_183283 ) ( not ( = ?auto_183283 ?auto_183282 ) ) ( not ( = ?auto_183283 ?auto_183281 ) ) ( not ( = ?auto_183283 ?auto_183280 ) ) ( not ( = ?auto_183283 ?auto_183279 ) ) ( not ( = ?auto_183282 ?auto_183281 ) ) ( not ( = ?auto_183282 ?auto_183280 ) ) ( not ( = ?auto_183282 ?auto_183279 ) ) ( not ( = ?auto_183276 ?auto_183283 ) ) ( not ( = ?auto_183276 ?auto_183282 ) ) ( not ( = ?auto_183277 ?auto_183283 ) ) ( not ( = ?auto_183277 ?auto_183282 ) ) ( not ( = ?auto_183278 ?auto_183283 ) ) ( not ( = ?auto_183278 ?auto_183282 ) ) ( ON ?auto_183276 ?auto_183284 ) ( not ( = ?auto_183276 ?auto_183284 ) ) ( not ( = ?auto_183277 ?auto_183284 ) ) ( not ( = ?auto_183278 ?auto_183284 ) ) ( not ( = ?auto_183279 ?auto_183284 ) ) ( not ( = ?auto_183280 ?auto_183284 ) ) ( not ( = ?auto_183281 ?auto_183284 ) ) ( not ( = ?auto_183283 ?auto_183284 ) ) ( not ( = ?auto_183282 ?auto_183284 ) ) ( ON ?auto_183277 ?auto_183276 ) ( ON-TABLE ?auto_183284 ) ( ON ?auto_183278 ?auto_183277 ) ( ON ?auto_183279 ?auto_183278 ) ( ON ?auto_183280 ?auto_183279 ) ( CLEAR ?auto_183282 ) ( ON ?auto_183281 ?auto_183280 ) ( CLEAR ?auto_183281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183284 ?auto_183276 ?auto_183277 ?auto_183278 ?auto_183279 ?auto_183280 )
      ( MAKE-5PILE ?auto_183276 ?auto_183277 ?auto_183278 ?auto_183279 ?auto_183280 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183285 - BLOCK
      ?auto_183286 - BLOCK
      ?auto_183287 - BLOCK
      ?auto_183288 - BLOCK
      ?auto_183289 - BLOCK
    )
    :vars
    (
      ?auto_183291 - BLOCK
      ?auto_183290 - BLOCK
      ?auto_183293 - BLOCK
      ?auto_183292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183285 ?auto_183286 ) ) ( not ( = ?auto_183285 ?auto_183287 ) ) ( not ( = ?auto_183285 ?auto_183288 ) ) ( not ( = ?auto_183285 ?auto_183289 ) ) ( not ( = ?auto_183286 ?auto_183287 ) ) ( not ( = ?auto_183286 ?auto_183288 ) ) ( not ( = ?auto_183286 ?auto_183289 ) ) ( not ( = ?auto_183287 ?auto_183288 ) ) ( not ( = ?auto_183287 ?auto_183289 ) ) ( not ( = ?auto_183288 ?auto_183289 ) ) ( not ( = ?auto_183285 ?auto_183291 ) ) ( not ( = ?auto_183286 ?auto_183291 ) ) ( not ( = ?auto_183287 ?auto_183291 ) ) ( not ( = ?auto_183288 ?auto_183291 ) ) ( not ( = ?auto_183289 ?auto_183291 ) ) ( ON-TABLE ?auto_183290 ) ( not ( = ?auto_183290 ?auto_183293 ) ) ( not ( = ?auto_183290 ?auto_183291 ) ) ( not ( = ?auto_183290 ?auto_183289 ) ) ( not ( = ?auto_183290 ?auto_183288 ) ) ( not ( = ?auto_183293 ?auto_183291 ) ) ( not ( = ?auto_183293 ?auto_183289 ) ) ( not ( = ?auto_183293 ?auto_183288 ) ) ( not ( = ?auto_183285 ?auto_183290 ) ) ( not ( = ?auto_183285 ?auto_183293 ) ) ( not ( = ?auto_183286 ?auto_183290 ) ) ( not ( = ?auto_183286 ?auto_183293 ) ) ( not ( = ?auto_183287 ?auto_183290 ) ) ( not ( = ?auto_183287 ?auto_183293 ) ) ( ON ?auto_183285 ?auto_183292 ) ( not ( = ?auto_183285 ?auto_183292 ) ) ( not ( = ?auto_183286 ?auto_183292 ) ) ( not ( = ?auto_183287 ?auto_183292 ) ) ( not ( = ?auto_183288 ?auto_183292 ) ) ( not ( = ?auto_183289 ?auto_183292 ) ) ( not ( = ?auto_183291 ?auto_183292 ) ) ( not ( = ?auto_183290 ?auto_183292 ) ) ( not ( = ?auto_183293 ?auto_183292 ) ) ( ON ?auto_183286 ?auto_183285 ) ( ON-TABLE ?auto_183292 ) ( ON ?auto_183287 ?auto_183286 ) ( ON ?auto_183288 ?auto_183287 ) ( ON ?auto_183289 ?auto_183288 ) ( ON ?auto_183291 ?auto_183289 ) ( CLEAR ?auto_183291 ) ( HOLDING ?auto_183293 ) ( CLEAR ?auto_183290 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183290 ?auto_183293 )
      ( MAKE-5PILE ?auto_183285 ?auto_183286 ?auto_183287 ?auto_183288 ?auto_183289 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183294 - BLOCK
      ?auto_183295 - BLOCK
      ?auto_183296 - BLOCK
      ?auto_183297 - BLOCK
      ?auto_183298 - BLOCK
    )
    :vars
    (
      ?auto_183302 - BLOCK
      ?auto_183301 - BLOCK
      ?auto_183300 - BLOCK
      ?auto_183299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183294 ?auto_183295 ) ) ( not ( = ?auto_183294 ?auto_183296 ) ) ( not ( = ?auto_183294 ?auto_183297 ) ) ( not ( = ?auto_183294 ?auto_183298 ) ) ( not ( = ?auto_183295 ?auto_183296 ) ) ( not ( = ?auto_183295 ?auto_183297 ) ) ( not ( = ?auto_183295 ?auto_183298 ) ) ( not ( = ?auto_183296 ?auto_183297 ) ) ( not ( = ?auto_183296 ?auto_183298 ) ) ( not ( = ?auto_183297 ?auto_183298 ) ) ( not ( = ?auto_183294 ?auto_183302 ) ) ( not ( = ?auto_183295 ?auto_183302 ) ) ( not ( = ?auto_183296 ?auto_183302 ) ) ( not ( = ?auto_183297 ?auto_183302 ) ) ( not ( = ?auto_183298 ?auto_183302 ) ) ( ON-TABLE ?auto_183301 ) ( not ( = ?auto_183301 ?auto_183300 ) ) ( not ( = ?auto_183301 ?auto_183302 ) ) ( not ( = ?auto_183301 ?auto_183298 ) ) ( not ( = ?auto_183301 ?auto_183297 ) ) ( not ( = ?auto_183300 ?auto_183302 ) ) ( not ( = ?auto_183300 ?auto_183298 ) ) ( not ( = ?auto_183300 ?auto_183297 ) ) ( not ( = ?auto_183294 ?auto_183301 ) ) ( not ( = ?auto_183294 ?auto_183300 ) ) ( not ( = ?auto_183295 ?auto_183301 ) ) ( not ( = ?auto_183295 ?auto_183300 ) ) ( not ( = ?auto_183296 ?auto_183301 ) ) ( not ( = ?auto_183296 ?auto_183300 ) ) ( ON ?auto_183294 ?auto_183299 ) ( not ( = ?auto_183294 ?auto_183299 ) ) ( not ( = ?auto_183295 ?auto_183299 ) ) ( not ( = ?auto_183296 ?auto_183299 ) ) ( not ( = ?auto_183297 ?auto_183299 ) ) ( not ( = ?auto_183298 ?auto_183299 ) ) ( not ( = ?auto_183302 ?auto_183299 ) ) ( not ( = ?auto_183301 ?auto_183299 ) ) ( not ( = ?auto_183300 ?auto_183299 ) ) ( ON ?auto_183295 ?auto_183294 ) ( ON-TABLE ?auto_183299 ) ( ON ?auto_183296 ?auto_183295 ) ( ON ?auto_183297 ?auto_183296 ) ( ON ?auto_183298 ?auto_183297 ) ( ON ?auto_183302 ?auto_183298 ) ( CLEAR ?auto_183301 ) ( ON ?auto_183300 ?auto_183302 ) ( CLEAR ?auto_183300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183299 ?auto_183294 ?auto_183295 ?auto_183296 ?auto_183297 ?auto_183298 ?auto_183302 )
      ( MAKE-5PILE ?auto_183294 ?auto_183295 ?auto_183296 ?auto_183297 ?auto_183298 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183303 - BLOCK
      ?auto_183304 - BLOCK
      ?auto_183305 - BLOCK
      ?auto_183306 - BLOCK
      ?auto_183307 - BLOCK
    )
    :vars
    (
      ?auto_183310 - BLOCK
      ?auto_183308 - BLOCK
      ?auto_183309 - BLOCK
      ?auto_183311 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183303 ?auto_183304 ) ) ( not ( = ?auto_183303 ?auto_183305 ) ) ( not ( = ?auto_183303 ?auto_183306 ) ) ( not ( = ?auto_183303 ?auto_183307 ) ) ( not ( = ?auto_183304 ?auto_183305 ) ) ( not ( = ?auto_183304 ?auto_183306 ) ) ( not ( = ?auto_183304 ?auto_183307 ) ) ( not ( = ?auto_183305 ?auto_183306 ) ) ( not ( = ?auto_183305 ?auto_183307 ) ) ( not ( = ?auto_183306 ?auto_183307 ) ) ( not ( = ?auto_183303 ?auto_183310 ) ) ( not ( = ?auto_183304 ?auto_183310 ) ) ( not ( = ?auto_183305 ?auto_183310 ) ) ( not ( = ?auto_183306 ?auto_183310 ) ) ( not ( = ?auto_183307 ?auto_183310 ) ) ( not ( = ?auto_183308 ?auto_183309 ) ) ( not ( = ?auto_183308 ?auto_183310 ) ) ( not ( = ?auto_183308 ?auto_183307 ) ) ( not ( = ?auto_183308 ?auto_183306 ) ) ( not ( = ?auto_183309 ?auto_183310 ) ) ( not ( = ?auto_183309 ?auto_183307 ) ) ( not ( = ?auto_183309 ?auto_183306 ) ) ( not ( = ?auto_183303 ?auto_183308 ) ) ( not ( = ?auto_183303 ?auto_183309 ) ) ( not ( = ?auto_183304 ?auto_183308 ) ) ( not ( = ?auto_183304 ?auto_183309 ) ) ( not ( = ?auto_183305 ?auto_183308 ) ) ( not ( = ?auto_183305 ?auto_183309 ) ) ( ON ?auto_183303 ?auto_183311 ) ( not ( = ?auto_183303 ?auto_183311 ) ) ( not ( = ?auto_183304 ?auto_183311 ) ) ( not ( = ?auto_183305 ?auto_183311 ) ) ( not ( = ?auto_183306 ?auto_183311 ) ) ( not ( = ?auto_183307 ?auto_183311 ) ) ( not ( = ?auto_183310 ?auto_183311 ) ) ( not ( = ?auto_183308 ?auto_183311 ) ) ( not ( = ?auto_183309 ?auto_183311 ) ) ( ON ?auto_183304 ?auto_183303 ) ( ON-TABLE ?auto_183311 ) ( ON ?auto_183305 ?auto_183304 ) ( ON ?auto_183306 ?auto_183305 ) ( ON ?auto_183307 ?auto_183306 ) ( ON ?auto_183310 ?auto_183307 ) ( ON ?auto_183309 ?auto_183310 ) ( CLEAR ?auto_183309 ) ( HOLDING ?auto_183308 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183308 )
      ( MAKE-5PILE ?auto_183303 ?auto_183304 ?auto_183305 ?auto_183306 ?auto_183307 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183312 - BLOCK
      ?auto_183313 - BLOCK
      ?auto_183314 - BLOCK
      ?auto_183315 - BLOCK
      ?auto_183316 - BLOCK
    )
    :vars
    (
      ?auto_183319 - BLOCK
      ?auto_183317 - BLOCK
      ?auto_183318 - BLOCK
      ?auto_183320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183312 ?auto_183313 ) ) ( not ( = ?auto_183312 ?auto_183314 ) ) ( not ( = ?auto_183312 ?auto_183315 ) ) ( not ( = ?auto_183312 ?auto_183316 ) ) ( not ( = ?auto_183313 ?auto_183314 ) ) ( not ( = ?auto_183313 ?auto_183315 ) ) ( not ( = ?auto_183313 ?auto_183316 ) ) ( not ( = ?auto_183314 ?auto_183315 ) ) ( not ( = ?auto_183314 ?auto_183316 ) ) ( not ( = ?auto_183315 ?auto_183316 ) ) ( not ( = ?auto_183312 ?auto_183319 ) ) ( not ( = ?auto_183313 ?auto_183319 ) ) ( not ( = ?auto_183314 ?auto_183319 ) ) ( not ( = ?auto_183315 ?auto_183319 ) ) ( not ( = ?auto_183316 ?auto_183319 ) ) ( not ( = ?auto_183317 ?auto_183318 ) ) ( not ( = ?auto_183317 ?auto_183319 ) ) ( not ( = ?auto_183317 ?auto_183316 ) ) ( not ( = ?auto_183317 ?auto_183315 ) ) ( not ( = ?auto_183318 ?auto_183319 ) ) ( not ( = ?auto_183318 ?auto_183316 ) ) ( not ( = ?auto_183318 ?auto_183315 ) ) ( not ( = ?auto_183312 ?auto_183317 ) ) ( not ( = ?auto_183312 ?auto_183318 ) ) ( not ( = ?auto_183313 ?auto_183317 ) ) ( not ( = ?auto_183313 ?auto_183318 ) ) ( not ( = ?auto_183314 ?auto_183317 ) ) ( not ( = ?auto_183314 ?auto_183318 ) ) ( ON ?auto_183312 ?auto_183320 ) ( not ( = ?auto_183312 ?auto_183320 ) ) ( not ( = ?auto_183313 ?auto_183320 ) ) ( not ( = ?auto_183314 ?auto_183320 ) ) ( not ( = ?auto_183315 ?auto_183320 ) ) ( not ( = ?auto_183316 ?auto_183320 ) ) ( not ( = ?auto_183319 ?auto_183320 ) ) ( not ( = ?auto_183317 ?auto_183320 ) ) ( not ( = ?auto_183318 ?auto_183320 ) ) ( ON ?auto_183313 ?auto_183312 ) ( ON-TABLE ?auto_183320 ) ( ON ?auto_183314 ?auto_183313 ) ( ON ?auto_183315 ?auto_183314 ) ( ON ?auto_183316 ?auto_183315 ) ( ON ?auto_183319 ?auto_183316 ) ( ON ?auto_183318 ?auto_183319 ) ( ON ?auto_183317 ?auto_183318 ) ( CLEAR ?auto_183317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_183320 ?auto_183312 ?auto_183313 ?auto_183314 ?auto_183315 ?auto_183316 ?auto_183319 ?auto_183318 )
      ( MAKE-5PILE ?auto_183312 ?auto_183313 ?auto_183314 ?auto_183315 ?auto_183316 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_183336 - BLOCK
      ?auto_183337 - BLOCK
    )
    :vars
    (
      ?auto_183339 - BLOCK
      ?auto_183338 - BLOCK
      ?auto_183340 - BLOCK
      ?auto_183342 - BLOCK
      ?auto_183343 - BLOCK
      ?auto_183341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183339 ?auto_183337 ) ( ON-TABLE ?auto_183336 ) ( ON ?auto_183337 ?auto_183336 ) ( not ( = ?auto_183336 ?auto_183337 ) ) ( not ( = ?auto_183336 ?auto_183339 ) ) ( not ( = ?auto_183337 ?auto_183339 ) ) ( not ( = ?auto_183336 ?auto_183338 ) ) ( not ( = ?auto_183336 ?auto_183340 ) ) ( not ( = ?auto_183337 ?auto_183338 ) ) ( not ( = ?auto_183337 ?auto_183340 ) ) ( not ( = ?auto_183339 ?auto_183338 ) ) ( not ( = ?auto_183339 ?auto_183340 ) ) ( not ( = ?auto_183338 ?auto_183340 ) ) ( ON ?auto_183338 ?auto_183339 ) ( CLEAR ?auto_183338 ) ( HOLDING ?auto_183340 ) ( CLEAR ?auto_183342 ) ( ON-TABLE ?auto_183343 ) ( ON ?auto_183341 ?auto_183343 ) ( ON ?auto_183342 ?auto_183341 ) ( not ( = ?auto_183343 ?auto_183341 ) ) ( not ( = ?auto_183343 ?auto_183342 ) ) ( not ( = ?auto_183343 ?auto_183340 ) ) ( not ( = ?auto_183341 ?auto_183342 ) ) ( not ( = ?auto_183341 ?auto_183340 ) ) ( not ( = ?auto_183342 ?auto_183340 ) ) ( not ( = ?auto_183336 ?auto_183342 ) ) ( not ( = ?auto_183336 ?auto_183343 ) ) ( not ( = ?auto_183336 ?auto_183341 ) ) ( not ( = ?auto_183337 ?auto_183342 ) ) ( not ( = ?auto_183337 ?auto_183343 ) ) ( not ( = ?auto_183337 ?auto_183341 ) ) ( not ( = ?auto_183339 ?auto_183342 ) ) ( not ( = ?auto_183339 ?auto_183343 ) ) ( not ( = ?auto_183339 ?auto_183341 ) ) ( not ( = ?auto_183338 ?auto_183342 ) ) ( not ( = ?auto_183338 ?auto_183343 ) ) ( not ( = ?auto_183338 ?auto_183341 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183343 ?auto_183341 ?auto_183342 ?auto_183340 )
      ( MAKE-2PILE ?auto_183336 ?auto_183337 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_183344 - BLOCK
      ?auto_183345 - BLOCK
    )
    :vars
    (
      ?auto_183347 - BLOCK
      ?auto_183348 - BLOCK
      ?auto_183350 - BLOCK
      ?auto_183346 - BLOCK
      ?auto_183349 - BLOCK
      ?auto_183351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183347 ?auto_183345 ) ( ON-TABLE ?auto_183344 ) ( ON ?auto_183345 ?auto_183344 ) ( not ( = ?auto_183344 ?auto_183345 ) ) ( not ( = ?auto_183344 ?auto_183347 ) ) ( not ( = ?auto_183345 ?auto_183347 ) ) ( not ( = ?auto_183344 ?auto_183348 ) ) ( not ( = ?auto_183344 ?auto_183350 ) ) ( not ( = ?auto_183345 ?auto_183348 ) ) ( not ( = ?auto_183345 ?auto_183350 ) ) ( not ( = ?auto_183347 ?auto_183348 ) ) ( not ( = ?auto_183347 ?auto_183350 ) ) ( not ( = ?auto_183348 ?auto_183350 ) ) ( ON ?auto_183348 ?auto_183347 ) ( CLEAR ?auto_183346 ) ( ON-TABLE ?auto_183349 ) ( ON ?auto_183351 ?auto_183349 ) ( ON ?auto_183346 ?auto_183351 ) ( not ( = ?auto_183349 ?auto_183351 ) ) ( not ( = ?auto_183349 ?auto_183346 ) ) ( not ( = ?auto_183349 ?auto_183350 ) ) ( not ( = ?auto_183351 ?auto_183346 ) ) ( not ( = ?auto_183351 ?auto_183350 ) ) ( not ( = ?auto_183346 ?auto_183350 ) ) ( not ( = ?auto_183344 ?auto_183346 ) ) ( not ( = ?auto_183344 ?auto_183349 ) ) ( not ( = ?auto_183344 ?auto_183351 ) ) ( not ( = ?auto_183345 ?auto_183346 ) ) ( not ( = ?auto_183345 ?auto_183349 ) ) ( not ( = ?auto_183345 ?auto_183351 ) ) ( not ( = ?auto_183347 ?auto_183346 ) ) ( not ( = ?auto_183347 ?auto_183349 ) ) ( not ( = ?auto_183347 ?auto_183351 ) ) ( not ( = ?auto_183348 ?auto_183346 ) ) ( not ( = ?auto_183348 ?auto_183349 ) ) ( not ( = ?auto_183348 ?auto_183351 ) ) ( ON ?auto_183350 ?auto_183348 ) ( CLEAR ?auto_183350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183344 ?auto_183345 ?auto_183347 ?auto_183348 )
      ( MAKE-2PILE ?auto_183344 ?auto_183345 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_183352 - BLOCK
      ?auto_183353 - BLOCK
    )
    :vars
    (
      ?auto_183355 - BLOCK
      ?auto_183359 - BLOCK
      ?auto_183358 - BLOCK
      ?auto_183356 - BLOCK
      ?auto_183354 - BLOCK
      ?auto_183357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183355 ?auto_183353 ) ( ON-TABLE ?auto_183352 ) ( ON ?auto_183353 ?auto_183352 ) ( not ( = ?auto_183352 ?auto_183353 ) ) ( not ( = ?auto_183352 ?auto_183355 ) ) ( not ( = ?auto_183353 ?auto_183355 ) ) ( not ( = ?auto_183352 ?auto_183359 ) ) ( not ( = ?auto_183352 ?auto_183358 ) ) ( not ( = ?auto_183353 ?auto_183359 ) ) ( not ( = ?auto_183353 ?auto_183358 ) ) ( not ( = ?auto_183355 ?auto_183359 ) ) ( not ( = ?auto_183355 ?auto_183358 ) ) ( not ( = ?auto_183359 ?auto_183358 ) ) ( ON ?auto_183359 ?auto_183355 ) ( ON-TABLE ?auto_183356 ) ( ON ?auto_183354 ?auto_183356 ) ( not ( = ?auto_183356 ?auto_183354 ) ) ( not ( = ?auto_183356 ?auto_183357 ) ) ( not ( = ?auto_183356 ?auto_183358 ) ) ( not ( = ?auto_183354 ?auto_183357 ) ) ( not ( = ?auto_183354 ?auto_183358 ) ) ( not ( = ?auto_183357 ?auto_183358 ) ) ( not ( = ?auto_183352 ?auto_183357 ) ) ( not ( = ?auto_183352 ?auto_183356 ) ) ( not ( = ?auto_183352 ?auto_183354 ) ) ( not ( = ?auto_183353 ?auto_183357 ) ) ( not ( = ?auto_183353 ?auto_183356 ) ) ( not ( = ?auto_183353 ?auto_183354 ) ) ( not ( = ?auto_183355 ?auto_183357 ) ) ( not ( = ?auto_183355 ?auto_183356 ) ) ( not ( = ?auto_183355 ?auto_183354 ) ) ( not ( = ?auto_183359 ?auto_183357 ) ) ( not ( = ?auto_183359 ?auto_183356 ) ) ( not ( = ?auto_183359 ?auto_183354 ) ) ( ON ?auto_183358 ?auto_183359 ) ( CLEAR ?auto_183358 ) ( HOLDING ?auto_183357 ) ( CLEAR ?auto_183354 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183356 ?auto_183354 ?auto_183357 )
      ( MAKE-2PILE ?auto_183352 ?auto_183353 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_183360 - BLOCK
      ?auto_183361 - BLOCK
    )
    :vars
    (
      ?auto_183364 - BLOCK
      ?auto_183362 - BLOCK
      ?auto_183363 - BLOCK
      ?auto_183366 - BLOCK
      ?auto_183365 - BLOCK
      ?auto_183367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183364 ?auto_183361 ) ( ON-TABLE ?auto_183360 ) ( ON ?auto_183361 ?auto_183360 ) ( not ( = ?auto_183360 ?auto_183361 ) ) ( not ( = ?auto_183360 ?auto_183364 ) ) ( not ( = ?auto_183361 ?auto_183364 ) ) ( not ( = ?auto_183360 ?auto_183362 ) ) ( not ( = ?auto_183360 ?auto_183363 ) ) ( not ( = ?auto_183361 ?auto_183362 ) ) ( not ( = ?auto_183361 ?auto_183363 ) ) ( not ( = ?auto_183364 ?auto_183362 ) ) ( not ( = ?auto_183364 ?auto_183363 ) ) ( not ( = ?auto_183362 ?auto_183363 ) ) ( ON ?auto_183362 ?auto_183364 ) ( ON-TABLE ?auto_183366 ) ( ON ?auto_183365 ?auto_183366 ) ( not ( = ?auto_183366 ?auto_183365 ) ) ( not ( = ?auto_183366 ?auto_183367 ) ) ( not ( = ?auto_183366 ?auto_183363 ) ) ( not ( = ?auto_183365 ?auto_183367 ) ) ( not ( = ?auto_183365 ?auto_183363 ) ) ( not ( = ?auto_183367 ?auto_183363 ) ) ( not ( = ?auto_183360 ?auto_183367 ) ) ( not ( = ?auto_183360 ?auto_183366 ) ) ( not ( = ?auto_183360 ?auto_183365 ) ) ( not ( = ?auto_183361 ?auto_183367 ) ) ( not ( = ?auto_183361 ?auto_183366 ) ) ( not ( = ?auto_183361 ?auto_183365 ) ) ( not ( = ?auto_183364 ?auto_183367 ) ) ( not ( = ?auto_183364 ?auto_183366 ) ) ( not ( = ?auto_183364 ?auto_183365 ) ) ( not ( = ?auto_183362 ?auto_183367 ) ) ( not ( = ?auto_183362 ?auto_183366 ) ) ( not ( = ?auto_183362 ?auto_183365 ) ) ( ON ?auto_183363 ?auto_183362 ) ( CLEAR ?auto_183365 ) ( ON ?auto_183367 ?auto_183363 ) ( CLEAR ?auto_183367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183360 ?auto_183361 ?auto_183364 ?auto_183362 ?auto_183363 )
      ( MAKE-2PILE ?auto_183360 ?auto_183361 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_183368 - BLOCK
      ?auto_183369 - BLOCK
    )
    :vars
    (
      ?auto_183373 - BLOCK
      ?auto_183371 - BLOCK
      ?auto_183372 - BLOCK
      ?auto_183374 - BLOCK
      ?auto_183370 - BLOCK
      ?auto_183375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183373 ?auto_183369 ) ( ON-TABLE ?auto_183368 ) ( ON ?auto_183369 ?auto_183368 ) ( not ( = ?auto_183368 ?auto_183369 ) ) ( not ( = ?auto_183368 ?auto_183373 ) ) ( not ( = ?auto_183369 ?auto_183373 ) ) ( not ( = ?auto_183368 ?auto_183371 ) ) ( not ( = ?auto_183368 ?auto_183372 ) ) ( not ( = ?auto_183369 ?auto_183371 ) ) ( not ( = ?auto_183369 ?auto_183372 ) ) ( not ( = ?auto_183373 ?auto_183371 ) ) ( not ( = ?auto_183373 ?auto_183372 ) ) ( not ( = ?auto_183371 ?auto_183372 ) ) ( ON ?auto_183371 ?auto_183373 ) ( ON-TABLE ?auto_183374 ) ( not ( = ?auto_183374 ?auto_183370 ) ) ( not ( = ?auto_183374 ?auto_183375 ) ) ( not ( = ?auto_183374 ?auto_183372 ) ) ( not ( = ?auto_183370 ?auto_183375 ) ) ( not ( = ?auto_183370 ?auto_183372 ) ) ( not ( = ?auto_183375 ?auto_183372 ) ) ( not ( = ?auto_183368 ?auto_183375 ) ) ( not ( = ?auto_183368 ?auto_183374 ) ) ( not ( = ?auto_183368 ?auto_183370 ) ) ( not ( = ?auto_183369 ?auto_183375 ) ) ( not ( = ?auto_183369 ?auto_183374 ) ) ( not ( = ?auto_183369 ?auto_183370 ) ) ( not ( = ?auto_183373 ?auto_183375 ) ) ( not ( = ?auto_183373 ?auto_183374 ) ) ( not ( = ?auto_183373 ?auto_183370 ) ) ( not ( = ?auto_183371 ?auto_183375 ) ) ( not ( = ?auto_183371 ?auto_183374 ) ) ( not ( = ?auto_183371 ?auto_183370 ) ) ( ON ?auto_183372 ?auto_183371 ) ( ON ?auto_183375 ?auto_183372 ) ( CLEAR ?auto_183375 ) ( HOLDING ?auto_183370 ) ( CLEAR ?auto_183374 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183374 ?auto_183370 )
      ( MAKE-2PILE ?auto_183368 ?auto_183369 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_183376 - BLOCK
      ?auto_183377 - BLOCK
    )
    :vars
    (
      ?auto_183378 - BLOCK
      ?auto_183381 - BLOCK
      ?auto_183379 - BLOCK
      ?auto_183380 - BLOCK
      ?auto_183382 - BLOCK
      ?auto_183383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183378 ?auto_183377 ) ( ON-TABLE ?auto_183376 ) ( ON ?auto_183377 ?auto_183376 ) ( not ( = ?auto_183376 ?auto_183377 ) ) ( not ( = ?auto_183376 ?auto_183378 ) ) ( not ( = ?auto_183377 ?auto_183378 ) ) ( not ( = ?auto_183376 ?auto_183381 ) ) ( not ( = ?auto_183376 ?auto_183379 ) ) ( not ( = ?auto_183377 ?auto_183381 ) ) ( not ( = ?auto_183377 ?auto_183379 ) ) ( not ( = ?auto_183378 ?auto_183381 ) ) ( not ( = ?auto_183378 ?auto_183379 ) ) ( not ( = ?auto_183381 ?auto_183379 ) ) ( ON ?auto_183381 ?auto_183378 ) ( ON-TABLE ?auto_183380 ) ( not ( = ?auto_183380 ?auto_183382 ) ) ( not ( = ?auto_183380 ?auto_183383 ) ) ( not ( = ?auto_183380 ?auto_183379 ) ) ( not ( = ?auto_183382 ?auto_183383 ) ) ( not ( = ?auto_183382 ?auto_183379 ) ) ( not ( = ?auto_183383 ?auto_183379 ) ) ( not ( = ?auto_183376 ?auto_183383 ) ) ( not ( = ?auto_183376 ?auto_183380 ) ) ( not ( = ?auto_183376 ?auto_183382 ) ) ( not ( = ?auto_183377 ?auto_183383 ) ) ( not ( = ?auto_183377 ?auto_183380 ) ) ( not ( = ?auto_183377 ?auto_183382 ) ) ( not ( = ?auto_183378 ?auto_183383 ) ) ( not ( = ?auto_183378 ?auto_183380 ) ) ( not ( = ?auto_183378 ?auto_183382 ) ) ( not ( = ?auto_183381 ?auto_183383 ) ) ( not ( = ?auto_183381 ?auto_183380 ) ) ( not ( = ?auto_183381 ?auto_183382 ) ) ( ON ?auto_183379 ?auto_183381 ) ( ON ?auto_183383 ?auto_183379 ) ( CLEAR ?auto_183380 ) ( ON ?auto_183382 ?auto_183383 ) ( CLEAR ?auto_183382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183376 ?auto_183377 ?auto_183378 ?auto_183381 ?auto_183379 ?auto_183383 )
      ( MAKE-2PILE ?auto_183376 ?auto_183377 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_183384 - BLOCK
      ?auto_183385 - BLOCK
    )
    :vars
    (
      ?auto_183388 - BLOCK
      ?auto_183387 - BLOCK
      ?auto_183389 - BLOCK
      ?auto_183390 - BLOCK
      ?auto_183386 - BLOCK
      ?auto_183391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183388 ?auto_183385 ) ( ON-TABLE ?auto_183384 ) ( ON ?auto_183385 ?auto_183384 ) ( not ( = ?auto_183384 ?auto_183385 ) ) ( not ( = ?auto_183384 ?auto_183388 ) ) ( not ( = ?auto_183385 ?auto_183388 ) ) ( not ( = ?auto_183384 ?auto_183387 ) ) ( not ( = ?auto_183384 ?auto_183389 ) ) ( not ( = ?auto_183385 ?auto_183387 ) ) ( not ( = ?auto_183385 ?auto_183389 ) ) ( not ( = ?auto_183388 ?auto_183387 ) ) ( not ( = ?auto_183388 ?auto_183389 ) ) ( not ( = ?auto_183387 ?auto_183389 ) ) ( ON ?auto_183387 ?auto_183388 ) ( not ( = ?auto_183390 ?auto_183386 ) ) ( not ( = ?auto_183390 ?auto_183391 ) ) ( not ( = ?auto_183390 ?auto_183389 ) ) ( not ( = ?auto_183386 ?auto_183391 ) ) ( not ( = ?auto_183386 ?auto_183389 ) ) ( not ( = ?auto_183391 ?auto_183389 ) ) ( not ( = ?auto_183384 ?auto_183391 ) ) ( not ( = ?auto_183384 ?auto_183390 ) ) ( not ( = ?auto_183384 ?auto_183386 ) ) ( not ( = ?auto_183385 ?auto_183391 ) ) ( not ( = ?auto_183385 ?auto_183390 ) ) ( not ( = ?auto_183385 ?auto_183386 ) ) ( not ( = ?auto_183388 ?auto_183391 ) ) ( not ( = ?auto_183388 ?auto_183390 ) ) ( not ( = ?auto_183388 ?auto_183386 ) ) ( not ( = ?auto_183387 ?auto_183391 ) ) ( not ( = ?auto_183387 ?auto_183390 ) ) ( not ( = ?auto_183387 ?auto_183386 ) ) ( ON ?auto_183389 ?auto_183387 ) ( ON ?auto_183391 ?auto_183389 ) ( ON ?auto_183386 ?auto_183391 ) ( CLEAR ?auto_183386 ) ( HOLDING ?auto_183390 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183390 )
      ( MAKE-2PILE ?auto_183384 ?auto_183385 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_183402 - BLOCK
      ?auto_183403 - BLOCK
    )
    :vars
    (
      ?auto_183405 - BLOCK
      ?auto_183406 - BLOCK
      ?auto_183409 - BLOCK
      ?auto_183404 - BLOCK
      ?auto_183408 - BLOCK
      ?auto_183407 - BLOCK
      ?auto_183410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183405 ?auto_183403 ) ( ON-TABLE ?auto_183402 ) ( ON ?auto_183403 ?auto_183402 ) ( not ( = ?auto_183402 ?auto_183403 ) ) ( not ( = ?auto_183402 ?auto_183405 ) ) ( not ( = ?auto_183403 ?auto_183405 ) ) ( not ( = ?auto_183402 ?auto_183406 ) ) ( not ( = ?auto_183402 ?auto_183409 ) ) ( not ( = ?auto_183403 ?auto_183406 ) ) ( not ( = ?auto_183403 ?auto_183409 ) ) ( not ( = ?auto_183405 ?auto_183406 ) ) ( not ( = ?auto_183405 ?auto_183409 ) ) ( not ( = ?auto_183406 ?auto_183409 ) ) ( ON ?auto_183406 ?auto_183405 ) ( not ( = ?auto_183404 ?auto_183408 ) ) ( not ( = ?auto_183404 ?auto_183407 ) ) ( not ( = ?auto_183404 ?auto_183409 ) ) ( not ( = ?auto_183408 ?auto_183407 ) ) ( not ( = ?auto_183408 ?auto_183409 ) ) ( not ( = ?auto_183407 ?auto_183409 ) ) ( not ( = ?auto_183402 ?auto_183407 ) ) ( not ( = ?auto_183402 ?auto_183404 ) ) ( not ( = ?auto_183402 ?auto_183408 ) ) ( not ( = ?auto_183403 ?auto_183407 ) ) ( not ( = ?auto_183403 ?auto_183404 ) ) ( not ( = ?auto_183403 ?auto_183408 ) ) ( not ( = ?auto_183405 ?auto_183407 ) ) ( not ( = ?auto_183405 ?auto_183404 ) ) ( not ( = ?auto_183405 ?auto_183408 ) ) ( not ( = ?auto_183406 ?auto_183407 ) ) ( not ( = ?auto_183406 ?auto_183404 ) ) ( not ( = ?auto_183406 ?auto_183408 ) ) ( ON ?auto_183409 ?auto_183406 ) ( ON ?auto_183407 ?auto_183409 ) ( ON ?auto_183408 ?auto_183407 ) ( CLEAR ?auto_183408 ) ( ON ?auto_183404 ?auto_183410 ) ( CLEAR ?auto_183404 ) ( HAND-EMPTY ) ( not ( = ?auto_183402 ?auto_183410 ) ) ( not ( = ?auto_183403 ?auto_183410 ) ) ( not ( = ?auto_183405 ?auto_183410 ) ) ( not ( = ?auto_183406 ?auto_183410 ) ) ( not ( = ?auto_183409 ?auto_183410 ) ) ( not ( = ?auto_183404 ?auto_183410 ) ) ( not ( = ?auto_183408 ?auto_183410 ) ) ( not ( = ?auto_183407 ?auto_183410 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183404 ?auto_183410 )
      ( MAKE-2PILE ?auto_183402 ?auto_183403 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_183411 - BLOCK
      ?auto_183412 - BLOCK
    )
    :vars
    (
      ?auto_183414 - BLOCK
      ?auto_183413 - BLOCK
      ?auto_183418 - BLOCK
      ?auto_183415 - BLOCK
      ?auto_183419 - BLOCK
      ?auto_183416 - BLOCK
      ?auto_183417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183414 ?auto_183412 ) ( ON-TABLE ?auto_183411 ) ( ON ?auto_183412 ?auto_183411 ) ( not ( = ?auto_183411 ?auto_183412 ) ) ( not ( = ?auto_183411 ?auto_183414 ) ) ( not ( = ?auto_183412 ?auto_183414 ) ) ( not ( = ?auto_183411 ?auto_183413 ) ) ( not ( = ?auto_183411 ?auto_183418 ) ) ( not ( = ?auto_183412 ?auto_183413 ) ) ( not ( = ?auto_183412 ?auto_183418 ) ) ( not ( = ?auto_183414 ?auto_183413 ) ) ( not ( = ?auto_183414 ?auto_183418 ) ) ( not ( = ?auto_183413 ?auto_183418 ) ) ( ON ?auto_183413 ?auto_183414 ) ( not ( = ?auto_183415 ?auto_183419 ) ) ( not ( = ?auto_183415 ?auto_183416 ) ) ( not ( = ?auto_183415 ?auto_183418 ) ) ( not ( = ?auto_183419 ?auto_183416 ) ) ( not ( = ?auto_183419 ?auto_183418 ) ) ( not ( = ?auto_183416 ?auto_183418 ) ) ( not ( = ?auto_183411 ?auto_183416 ) ) ( not ( = ?auto_183411 ?auto_183415 ) ) ( not ( = ?auto_183411 ?auto_183419 ) ) ( not ( = ?auto_183412 ?auto_183416 ) ) ( not ( = ?auto_183412 ?auto_183415 ) ) ( not ( = ?auto_183412 ?auto_183419 ) ) ( not ( = ?auto_183414 ?auto_183416 ) ) ( not ( = ?auto_183414 ?auto_183415 ) ) ( not ( = ?auto_183414 ?auto_183419 ) ) ( not ( = ?auto_183413 ?auto_183416 ) ) ( not ( = ?auto_183413 ?auto_183415 ) ) ( not ( = ?auto_183413 ?auto_183419 ) ) ( ON ?auto_183418 ?auto_183413 ) ( ON ?auto_183416 ?auto_183418 ) ( ON ?auto_183415 ?auto_183417 ) ( CLEAR ?auto_183415 ) ( not ( = ?auto_183411 ?auto_183417 ) ) ( not ( = ?auto_183412 ?auto_183417 ) ) ( not ( = ?auto_183414 ?auto_183417 ) ) ( not ( = ?auto_183413 ?auto_183417 ) ) ( not ( = ?auto_183418 ?auto_183417 ) ) ( not ( = ?auto_183415 ?auto_183417 ) ) ( not ( = ?auto_183419 ?auto_183417 ) ) ( not ( = ?auto_183416 ?auto_183417 ) ) ( HOLDING ?auto_183419 ) ( CLEAR ?auto_183416 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183411 ?auto_183412 ?auto_183414 ?auto_183413 ?auto_183418 ?auto_183416 ?auto_183419 )
      ( MAKE-2PILE ?auto_183411 ?auto_183412 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_183420 - BLOCK
      ?auto_183421 - BLOCK
    )
    :vars
    (
      ?auto_183425 - BLOCK
      ?auto_183424 - BLOCK
      ?auto_183423 - BLOCK
      ?auto_183426 - BLOCK
      ?auto_183422 - BLOCK
      ?auto_183427 - BLOCK
      ?auto_183428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183425 ?auto_183421 ) ( ON-TABLE ?auto_183420 ) ( ON ?auto_183421 ?auto_183420 ) ( not ( = ?auto_183420 ?auto_183421 ) ) ( not ( = ?auto_183420 ?auto_183425 ) ) ( not ( = ?auto_183421 ?auto_183425 ) ) ( not ( = ?auto_183420 ?auto_183424 ) ) ( not ( = ?auto_183420 ?auto_183423 ) ) ( not ( = ?auto_183421 ?auto_183424 ) ) ( not ( = ?auto_183421 ?auto_183423 ) ) ( not ( = ?auto_183425 ?auto_183424 ) ) ( not ( = ?auto_183425 ?auto_183423 ) ) ( not ( = ?auto_183424 ?auto_183423 ) ) ( ON ?auto_183424 ?auto_183425 ) ( not ( = ?auto_183426 ?auto_183422 ) ) ( not ( = ?auto_183426 ?auto_183427 ) ) ( not ( = ?auto_183426 ?auto_183423 ) ) ( not ( = ?auto_183422 ?auto_183427 ) ) ( not ( = ?auto_183422 ?auto_183423 ) ) ( not ( = ?auto_183427 ?auto_183423 ) ) ( not ( = ?auto_183420 ?auto_183427 ) ) ( not ( = ?auto_183420 ?auto_183426 ) ) ( not ( = ?auto_183420 ?auto_183422 ) ) ( not ( = ?auto_183421 ?auto_183427 ) ) ( not ( = ?auto_183421 ?auto_183426 ) ) ( not ( = ?auto_183421 ?auto_183422 ) ) ( not ( = ?auto_183425 ?auto_183427 ) ) ( not ( = ?auto_183425 ?auto_183426 ) ) ( not ( = ?auto_183425 ?auto_183422 ) ) ( not ( = ?auto_183424 ?auto_183427 ) ) ( not ( = ?auto_183424 ?auto_183426 ) ) ( not ( = ?auto_183424 ?auto_183422 ) ) ( ON ?auto_183423 ?auto_183424 ) ( ON ?auto_183427 ?auto_183423 ) ( ON ?auto_183426 ?auto_183428 ) ( not ( = ?auto_183420 ?auto_183428 ) ) ( not ( = ?auto_183421 ?auto_183428 ) ) ( not ( = ?auto_183425 ?auto_183428 ) ) ( not ( = ?auto_183424 ?auto_183428 ) ) ( not ( = ?auto_183423 ?auto_183428 ) ) ( not ( = ?auto_183426 ?auto_183428 ) ) ( not ( = ?auto_183422 ?auto_183428 ) ) ( not ( = ?auto_183427 ?auto_183428 ) ) ( CLEAR ?auto_183427 ) ( ON ?auto_183422 ?auto_183426 ) ( CLEAR ?auto_183422 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183428 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183428 ?auto_183426 )
      ( MAKE-2PILE ?auto_183420 ?auto_183421 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_183429 - BLOCK
      ?auto_183430 - BLOCK
    )
    :vars
    (
      ?auto_183431 - BLOCK
      ?auto_183433 - BLOCK
      ?auto_183436 - BLOCK
      ?auto_183434 - BLOCK
      ?auto_183432 - BLOCK
      ?auto_183437 - BLOCK
      ?auto_183435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183431 ?auto_183430 ) ( ON-TABLE ?auto_183429 ) ( ON ?auto_183430 ?auto_183429 ) ( not ( = ?auto_183429 ?auto_183430 ) ) ( not ( = ?auto_183429 ?auto_183431 ) ) ( not ( = ?auto_183430 ?auto_183431 ) ) ( not ( = ?auto_183429 ?auto_183433 ) ) ( not ( = ?auto_183429 ?auto_183436 ) ) ( not ( = ?auto_183430 ?auto_183433 ) ) ( not ( = ?auto_183430 ?auto_183436 ) ) ( not ( = ?auto_183431 ?auto_183433 ) ) ( not ( = ?auto_183431 ?auto_183436 ) ) ( not ( = ?auto_183433 ?auto_183436 ) ) ( ON ?auto_183433 ?auto_183431 ) ( not ( = ?auto_183434 ?auto_183432 ) ) ( not ( = ?auto_183434 ?auto_183437 ) ) ( not ( = ?auto_183434 ?auto_183436 ) ) ( not ( = ?auto_183432 ?auto_183437 ) ) ( not ( = ?auto_183432 ?auto_183436 ) ) ( not ( = ?auto_183437 ?auto_183436 ) ) ( not ( = ?auto_183429 ?auto_183437 ) ) ( not ( = ?auto_183429 ?auto_183434 ) ) ( not ( = ?auto_183429 ?auto_183432 ) ) ( not ( = ?auto_183430 ?auto_183437 ) ) ( not ( = ?auto_183430 ?auto_183434 ) ) ( not ( = ?auto_183430 ?auto_183432 ) ) ( not ( = ?auto_183431 ?auto_183437 ) ) ( not ( = ?auto_183431 ?auto_183434 ) ) ( not ( = ?auto_183431 ?auto_183432 ) ) ( not ( = ?auto_183433 ?auto_183437 ) ) ( not ( = ?auto_183433 ?auto_183434 ) ) ( not ( = ?auto_183433 ?auto_183432 ) ) ( ON ?auto_183436 ?auto_183433 ) ( ON ?auto_183434 ?auto_183435 ) ( not ( = ?auto_183429 ?auto_183435 ) ) ( not ( = ?auto_183430 ?auto_183435 ) ) ( not ( = ?auto_183431 ?auto_183435 ) ) ( not ( = ?auto_183433 ?auto_183435 ) ) ( not ( = ?auto_183436 ?auto_183435 ) ) ( not ( = ?auto_183434 ?auto_183435 ) ) ( not ( = ?auto_183432 ?auto_183435 ) ) ( not ( = ?auto_183437 ?auto_183435 ) ) ( ON ?auto_183432 ?auto_183434 ) ( CLEAR ?auto_183432 ) ( ON-TABLE ?auto_183435 ) ( HOLDING ?auto_183437 ) ( CLEAR ?auto_183436 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183429 ?auto_183430 ?auto_183431 ?auto_183433 ?auto_183436 ?auto_183437 )
      ( MAKE-2PILE ?auto_183429 ?auto_183430 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_183438 - BLOCK
      ?auto_183439 - BLOCK
    )
    :vars
    (
      ?auto_183442 - BLOCK
      ?auto_183445 - BLOCK
      ?auto_183446 - BLOCK
      ?auto_183443 - BLOCK
      ?auto_183440 - BLOCK
      ?auto_183441 - BLOCK
      ?auto_183444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183442 ?auto_183439 ) ( ON-TABLE ?auto_183438 ) ( ON ?auto_183439 ?auto_183438 ) ( not ( = ?auto_183438 ?auto_183439 ) ) ( not ( = ?auto_183438 ?auto_183442 ) ) ( not ( = ?auto_183439 ?auto_183442 ) ) ( not ( = ?auto_183438 ?auto_183445 ) ) ( not ( = ?auto_183438 ?auto_183446 ) ) ( not ( = ?auto_183439 ?auto_183445 ) ) ( not ( = ?auto_183439 ?auto_183446 ) ) ( not ( = ?auto_183442 ?auto_183445 ) ) ( not ( = ?auto_183442 ?auto_183446 ) ) ( not ( = ?auto_183445 ?auto_183446 ) ) ( ON ?auto_183445 ?auto_183442 ) ( not ( = ?auto_183443 ?auto_183440 ) ) ( not ( = ?auto_183443 ?auto_183441 ) ) ( not ( = ?auto_183443 ?auto_183446 ) ) ( not ( = ?auto_183440 ?auto_183441 ) ) ( not ( = ?auto_183440 ?auto_183446 ) ) ( not ( = ?auto_183441 ?auto_183446 ) ) ( not ( = ?auto_183438 ?auto_183441 ) ) ( not ( = ?auto_183438 ?auto_183443 ) ) ( not ( = ?auto_183438 ?auto_183440 ) ) ( not ( = ?auto_183439 ?auto_183441 ) ) ( not ( = ?auto_183439 ?auto_183443 ) ) ( not ( = ?auto_183439 ?auto_183440 ) ) ( not ( = ?auto_183442 ?auto_183441 ) ) ( not ( = ?auto_183442 ?auto_183443 ) ) ( not ( = ?auto_183442 ?auto_183440 ) ) ( not ( = ?auto_183445 ?auto_183441 ) ) ( not ( = ?auto_183445 ?auto_183443 ) ) ( not ( = ?auto_183445 ?auto_183440 ) ) ( ON ?auto_183446 ?auto_183445 ) ( ON ?auto_183443 ?auto_183444 ) ( not ( = ?auto_183438 ?auto_183444 ) ) ( not ( = ?auto_183439 ?auto_183444 ) ) ( not ( = ?auto_183442 ?auto_183444 ) ) ( not ( = ?auto_183445 ?auto_183444 ) ) ( not ( = ?auto_183446 ?auto_183444 ) ) ( not ( = ?auto_183443 ?auto_183444 ) ) ( not ( = ?auto_183440 ?auto_183444 ) ) ( not ( = ?auto_183441 ?auto_183444 ) ) ( ON ?auto_183440 ?auto_183443 ) ( ON-TABLE ?auto_183444 ) ( CLEAR ?auto_183446 ) ( ON ?auto_183441 ?auto_183440 ) ( CLEAR ?auto_183441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183444 ?auto_183443 ?auto_183440 )
      ( MAKE-2PILE ?auto_183438 ?auto_183439 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183496 - BLOCK
      ?auto_183497 - BLOCK
      ?auto_183498 - BLOCK
      ?auto_183499 - BLOCK
      ?auto_183500 - BLOCK
      ?auto_183501 - BLOCK
    )
    :vars
    (
      ?auto_183502 - BLOCK
      ?auto_183503 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183496 ) ( ON ?auto_183497 ?auto_183496 ) ( ON ?auto_183498 ?auto_183497 ) ( ON ?auto_183499 ?auto_183498 ) ( not ( = ?auto_183496 ?auto_183497 ) ) ( not ( = ?auto_183496 ?auto_183498 ) ) ( not ( = ?auto_183496 ?auto_183499 ) ) ( not ( = ?auto_183496 ?auto_183500 ) ) ( not ( = ?auto_183496 ?auto_183501 ) ) ( not ( = ?auto_183497 ?auto_183498 ) ) ( not ( = ?auto_183497 ?auto_183499 ) ) ( not ( = ?auto_183497 ?auto_183500 ) ) ( not ( = ?auto_183497 ?auto_183501 ) ) ( not ( = ?auto_183498 ?auto_183499 ) ) ( not ( = ?auto_183498 ?auto_183500 ) ) ( not ( = ?auto_183498 ?auto_183501 ) ) ( not ( = ?auto_183499 ?auto_183500 ) ) ( not ( = ?auto_183499 ?auto_183501 ) ) ( not ( = ?auto_183500 ?auto_183501 ) ) ( ON ?auto_183501 ?auto_183502 ) ( not ( = ?auto_183496 ?auto_183502 ) ) ( not ( = ?auto_183497 ?auto_183502 ) ) ( not ( = ?auto_183498 ?auto_183502 ) ) ( not ( = ?auto_183499 ?auto_183502 ) ) ( not ( = ?auto_183500 ?auto_183502 ) ) ( not ( = ?auto_183501 ?auto_183502 ) ) ( CLEAR ?auto_183499 ) ( ON ?auto_183500 ?auto_183501 ) ( CLEAR ?auto_183500 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183503 ) ( ON ?auto_183502 ?auto_183503 ) ( not ( = ?auto_183503 ?auto_183502 ) ) ( not ( = ?auto_183503 ?auto_183501 ) ) ( not ( = ?auto_183503 ?auto_183500 ) ) ( not ( = ?auto_183496 ?auto_183503 ) ) ( not ( = ?auto_183497 ?auto_183503 ) ) ( not ( = ?auto_183498 ?auto_183503 ) ) ( not ( = ?auto_183499 ?auto_183503 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183503 ?auto_183502 ?auto_183501 )
      ( MAKE-6PILE ?auto_183496 ?auto_183497 ?auto_183498 ?auto_183499 ?auto_183500 ?auto_183501 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183504 - BLOCK
      ?auto_183505 - BLOCK
      ?auto_183506 - BLOCK
      ?auto_183507 - BLOCK
      ?auto_183508 - BLOCK
      ?auto_183509 - BLOCK
    )
    :vars
    (
      ?auto_183511 - BLOCK
      ?auto_183510 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183504 ) ( ON ?auto_183505 ?auto_183504 ) ( ON ?auto_183506 ?auto_183505 ) ( not ( = ?auto_183504 ?auto_183505 ) ) ( not ( = ?auto_183504 ?auto_183506 ) ) ( not ( = ?auto_183504 ?auto_183507 ) ) ( not ( = ?auto_183504 ?auto_183508 ) ) ( not ( = ?auto_183504 ?auto_183509 ) ) ( not ( = ?auto_183505 ?auto_183506 ) ) ( not ( = ?auto_183505 ?auto_183507 ) ) ( not ( = ?auto_183505 ?auto_183508 ) ) ( not ( = ?auto_183505 ?auto_183509 ) ) ( not ( = ?auto_183506 ?auto_183507 ) ) ( not ( = ?auto_183506 ?auto_183508 ) ) ( not ( = ?auto_183506 ?auto_183509 ) ) ( not ( = ?auto_183507 ?auto_183508 ) ) ( not ( = ?auto_183507 ?auto_183509 ) ) ( not ( = ?auto_183508 ?auto_183509 ) ) ( ON ?auto_183509 ?auto_183511 ) ( not ( = ?auto_183504 ?auto_183511 ) ) ( not ( = ?auto_183505 ?auto_183511 ) ) ( not ( = ?auto_183506 ?auto_183511 ) ) ( not ( = ?auto_183507 ?auto_183511 ) ) ( not ( = ?auto_183508 ?auto_183511 ) ) ( not ( = ?auto_183509 ?auto_183511 ) ) ( ON ?auto_183508 ?auto_183509 ) ( CLEAR ?auto_183508 ) ( ON-TABLE ?auto_183510 ) ( ON ?auto_183511 ?auto_183510 ) ( not ( = ?auto_183510 ?auto_183511 ) ) ( not ( = ?auto_183510 ?auto_183509 ) ) ( not ( = ?auto_183510 ?auto_183508 ) ) ( not ( = ?auto_183504 ?auto_183510 ) ) ( not ( = ?auto_183505 ?auto_183510 ) ) ( not ( = ?auto_183506 ?auto_183510 ) ) ( not ( = ?auto_183507 ?auto_183510 ) ) ( HOLDING ?auto_183507 ) ( CLEAR ?auto_183506 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183504 ?auto_183505 ?auto_183506 ?auto_183507 )
      ( MAKE-6PILE ?auto_183504 ?auto_183505 ?auto_183506 ?auto_183507 ?auto_183508 ?auto_183509 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183512 - BLOCK
      ?auto_183513 - BLOCK
      ?auto_183514 - BLOCK
      ?auto_183515 - BLOCK
      ?auto_183516 - BLOCK
      ?auto_183517 - BLOCK
    )
    :vars
    (
      ?auto_183519 - BLOCK
      ?auto_183518 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183512 ) ( ON ?auto_183513 ?auto_183512 ) ( ON ?auto_183514 ?auto_183513 ) ( not ( = ?auto_183512 ?auto_183513 ) ) ( not ( = ?auto_183512 ?auto_183514 ) ) ( not ( = ?auto_183512 ?auto_183515 ) ) ( not ( = ?auto_183512 ?auto_183516 ) ) ( not ( = ?auto_183512 ?auto_183517 ) ) ( not ( = ?auto_183513 ?auto_183514 ) ) ( not ( = ?auto_183513 ?auto_183515 ) ) ( not ( = ?auto_183513 ?auto_183516 ) ) ( not ( = ?auto_183513 ?auto_183517 ) ) ( not ( = ?auto_183514 ?auto_183515 ) ) ( not ( = ?auto_183514 ?auto_183516 ) ) ( not ( = ?auto_183514 ?auto_183517 ) ) ( not ( = ?auto_183515 ?auto_183516 ) ) ( not ( = ?auto_183515 ?auto_183517 ) ) ( not ( = ?auto_183516 ?auto_183517 ) ) ( ON ?auto_183517 ?auto_183519 ) ( not ( = ?auto_183512 ?auto_183519 ) ) ( not ( = ?auto_183513 ?auto_183519 ) ) ( not ( = ?auto_183514 ?auto_183519 ) ) ( not ( = ?auto_183515 ?auto_183519 ) ) ( not ( = ?auto_183516 ?auto_183519 ) ) ( not ( = ?auto_183517 ?auto_183519 ) ) ( ON ?auto_183516 ?auto_183517 ) ( ON-TABLE ?auto_183518 ) ( ON ?auto_183519 ?auto_183518 ) ( not ( = ?auto_183518 ?auto_183519 ) ) ( not ( = ?auto_183518 ?auto_183517 ) ) ( not ( = ?auto_183518 ?auto_183516 ) ) ( not ( = ?auto_183512 ?auto_183518 ) ) ( not ( = ?auto_183513 ?auto_183518 ) ) ( not ( = ?auto_183514 ?auto_183518 ) ) ( not ( = ?auto_183515 ?auto_183518 ) ) ( CLEAR ?auto_183514 ) ( ON ?auto_183515 ?auto_183516 ) ( CLEAR ?auto_183515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183518 ?auto_183519 ?auto_183517 ?auto_183516 )
      ( MAKE-6PILE ?auto_183512 ?auto_183513 ?auto_183514 ?auto_183515 ?auto_183516 ?auto_183517 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183520 - BLOCK
      ?auto_183521 - BLOCK
      ?auto_183522 - BLOCK
      ?auto_183523 - BLOCK
      ?auto_183524 - BLOCK
      ?auto_183525 - BLOCK
    )
    :vars
    (
      ?auto_183526 - BLOCK
      ?auto_183527 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183520 ) ( ON ?auto_183521 ?auto_183520 ) ( not ( = ?auto_183520 ?auto_183521 ) ) ( not ( = ?auto_183520 ?auto_183522 ) ) ( not ( = ?auto_183520 ?auto_183523 ) ) ( not ( = ?auto_183520 ?auto_183524 ) ) ( not ( = ?auto_183520 ?auto_183525 ) ) ( not ( = ?auto_183521 ?auto_183522 ) ) ( not ( = ?auto_183521 ?auto_183523 ) ) ( not ( = ?auto_183521 ?auto_183524 ) ) ( not ( = ?auto_183521 ?auto_183525 ) ) ( not ( = ?auto_183522 ?auto_183523 ) ) ( not ( = ?auto_183522 ?auto_183524 ) ) ( not ( = ?auto_183522 ?auto_183525 ) ) ( not ( = ?auto_183523 ?auto_183524 ) ) ( not ( = ?auto_183523 ?auto_183525 ) ) ( not ( = ?auto_183524 ?auto_183525 ) ) ( ON ?auto_183525 ?auto_183526 ) ( not ( = ?auto_183520 ?auto_183526 ) ) ( not ( = ?auto_183521 ?auto_183526 ) ) ( not ( = ?auto_183522 ?auto_183526 ) ) ( not ( = ?auto_183523 ?auto_183526 ) ) ( not ( = ?auto_183524 ?auto_183526 ) ) ( not ( = ?auto_183525 ?auto_183526 ) ) ( ON ?auto_183524 ?auto_183525 ) ( ON-TABLE ?auto_183527 ) ( ON ?auto_183526 ?auto_183527 ) ( not ( = ?auto_183527 ?auto_183526 ) ) ( not ( = ?auto_183527 ?auto_183525 ) ) ( not ( = ?auto_183527 ?auto_183524 ) ) ( not ( = ?auto_183520 ?auto_183527 ) ) ( not ( = ?auto_183521 ?auto_183527 ) ) ( not ( = ?auto_183522 ?auto_183527 ) ) ( not ( = ?auto_183523 ?auto_183527 ) ) ( ON ?auto_183523 ?auto_183524 ) ( CLEAR ?auto_183523 ) ( HOLDING ?auto_183522 ) ( CLEAR ?auto_183521 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183520 ?auto_183521 ?auto_183522 )
      ( MAKE-6PILE ?auto_183520 ?auto_183521 ?auto_183522 ?auto_183523 ?auto_183524 ?auto_183525 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183528 - BLOCK
      ?auto_183529 - BLOCK
      ?auto_183530 - BLOCK
      ?auto_183531 - BLOCK
      ?auto_183532 - BLOCK
      ?auto_183533 - BLOCK
    )
    :vars
    (
      ?auto_183534 - BLOCK
      ?auto_183535 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183528 ) ( ON ?auto_183529 ?auto_183528 ) ( not ( = ?auto_183528 ?auto_183529 ) ) ( not ( = ?auto_183528 ?auto_183530 ) ) ( not ( = ?auto_183528 ?auto_183531 ) ) ( not ( = ?auto_183528 ?auto_183532 ) ) ( not ( = ?auto_183528 ?auto_183533 ) ) ( not ( = ?auto_183529 ?auto_183530 ) ) ( not ( = ?auto_183529 ?auto_183531 ) ) ( not ( = ?auto_183529 ?auto_183532 ) ) ( not ( = ?auto_183529 ?auto_183533 ) ) ( not ( = ?auto_183530 ?auto_183531 ) ) ( not ( = ?auto_183530 ?auto_183532 ) ) ( not ( = ?auto_183530 ?auto_183533 ) ) ( not ( = ?auto_183531 ?auto_183532 ) ) ( not ( = ?auto_183531 ?auto_183533 ) ) ( not ( = ?auto_183532 ?auto_183533 ) ) ( ON ?auto_183533 ?auto_183534 ) ( not ( = ?auto_183528 ?auto_183534 ) ) ( not ( = ?auto_183529 ?auto_183534 ) ) ( not ( = ?auto_183530 ?auto_183534 ) ) ( not ( = ?auto_183531 ?auto_183534 ) ) ( not ( = ?auto_183532 ?auto_183534 ) ) ( not ( = ?auto_183533 ?auto_183534 ) ) ( ON ?auto_183532 ?auto_183533 ) ( ON-TABLE ?auto_183535 ) ( ON ?auto_183534 ?auto_183535 ) ( not ( = ?auto_183535 ?auto_183534 ) ) ( not ( = ?auto_183535 ?auto_183533 ) ) ( not ( = ?auto_183535 ?auto_183532 ) ) ( not ( = ?auto_183528 ?auto_183535 ) ) ( not ( = ?auto_183529 ?auto_183535 ) ) ( not ( = ?auto_183530 ?auto_183535 ) ) ( not ( = ?auto_183531 ?auto_183535 ) ) ( ON ?auto_183531 ?auto_183532 ) ( CLEAR ?auto_183529 ) ( ON ?auto_183530 ?auto_183531 ) ( CLEAR ?auto_183530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183535 ?auto_183534 ?auto_183533 ?auto_183532 ?auto_183531 )
      ( MAKE-6PILE ?auto_183528 ?auto_183529 ?auto_183530 ?auto_183531 ?auto_183532 ?auto_183533 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183536 - BLOCK
      ?auto_183537 - BLOCK
      ?auto_183538 - BLOCK
      ?auto_183539 - BLOCK
      ?auto_183540 - BLOCK
      ?auto_183541 - BLOCK
    )
    :vars
    (
      ?auto_183542 - BLOCK
      ?auto_183543 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183536 ) ( not ( = ?auto_183536 ?auto_183537 ) ) ( not ( = ?auto_183536 ?auto_183538 ) ) ( not ( = ?auto_183536 ?auto_183539 ) ) ( not ( = ?auto_183536 ?auto_183540 ) ) ( not ( = ?auto_183536 ?auto_183541 ) ) ( not ( = ?auto_183537 ?auto_183538 ) ) ( not ( = ?auto_183537 ?auto_183539 ) ) ( not ( = ?auto_183537 ?auto_183540 ) ) ( not ( = ?auto_183537 ?auto_183541 ) ) ( not ( = ?auto_183538 ?auto_183539 ) ) ( not ( = ?auto_183538 ?auto_183540 ) ) ( not ( = ?auto_183538 ?auto_183541 ) ) ( not ( = ?auto_183539 ?auto_183540 ) ) ( not ( = ?auto_183539 ?auto_183541 ) ) ( not ( = ?auto_183540 ?auto_183541 ) ) ( ON ?auto_183541 ?auto_183542 ) ( not ( = ?auto_183536 ?auto_183542 ) ) ( not ( = ?auto_183537 ?auto_183542 ) ) ( not ( = ?auto_183538 ?auto_183542 ) ) ( not ( = ?auto_183539 ?auto_183542 ) ) ( not ( = ?auto_183540 ?auto_183542 ) ) ( not ( = ?auto_183541 ?auto_183542 ) ) ( ON ?auto_183540 ?auto_183541 ) ( ON-TABLE ?auto_183543 ) ( ON ?auto_183542 ?auto_183543 ) ( not ( = ?auto_183543 ?auto_183542 ) ) ( not ( = ?auto_183543 ?auto_183541 ) ) ( not ( = ?auto_183543 ?auto_183540 ) ) ( not ( = ?auto_183536 ?auto_183543 ) ) ( not ( = ?auto_183537 ?auto_183543 ) ) ( not ( = ?auto_183538 ?auto_183543 ) ) ( not ( = ?auto_183539 ?auto_183543 ) ) ( ON ?auto_183539 ?auto_183540 ) ( ON ?auto_183538 ?auto_183539 ) ( CLEAR ?auto_183538 ) ( HOLDING ?auto_183537 ) ( CLEAR ?auto_183536 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183536 ?auto_183537 )
      ( MAKE-6PILE ?auto_183536 ?auto_183537 ?auto_183538 ?auto_183539 ?auto_183540 ?auto_183541 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183544 - BLOCK
      ?auto_183545 - BLOCK
      ?auto_183546 - BLOCK
      ?auto_183547 - BLOCK
      ?auto_183548 - BLOCK
      ?auto_183549 - BLOCK
    )
    :vars
    (
      ?auto_183550 - BLOCK
      ?auto_183551 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183544 ) ( not ( = ?auto_183544 ?auto_183545 ) ) ( not ( = ?auto_183544 ?auto_183546 ) ) ( not ( = ?auto_183544 ?auto_183547 ) ) ( not ( = ?auto_183544 ?auto_183548 ) ) ( not ( = ?auto_183544 ?auto_183549 ) ) ( not ( = ?auto_183545 ?auto_183546 ) ) ( not ( = ?auto_183545 ?auto_183547 ) ) ( not ( = ?auto_183545 ?auto_183548 ) ) ( not ( = ?auto_183545 ?auto_183549 ) ) ( not ( = ?auto_183546 ?auto_183547 ) ) ( not ( = ?auto_183546 ?auto_183548 ) ) ( not ( = ?auto_183546 ?auto_183549 ) ) ( not ( = ?auto_183547 ?auto_183548 ) ) ( not ( = ?auto_183547 ?auto_183549 ) ) ( not ( = ?auto_183548 ?auto_183549 ) ) ( ON ?auto_183549 ?auto_183550 ) ( not ( = ?auto_183544 ?auto_183550 ) ) ( not ( = ?auto_183545 ?auto_183550 ) ) ( not ( = ?auto_183546 ?auto_183550 ) ) ( not ( = ?auto_183547 ?auto_183550 ) ) ( not ( = ?auto_183548 ?auto_183550 ) ) ( not ( = ?auto_183549 ?auto_183550 ) ) ( ON ?auto_183548 ?auto_183549 ) ( ON-TABLE ?auto_183551 ) ( ON ?auto_183550 ?auto_183551 ) ( not ( = ?auto_183551 ?auto_183550 ) ) ( not ( = ?auto_183551 ?auto_183549 ) ) ( not ( = ?auto_183551 ?auto_183548 ) ) ( not ( = ?auto_183544 ?auto_183551 ) ) ( not ( = ?auto_183545 ?auto_183551 ) ) ( not ( = ?auto_183546 ?auto_183551 ) ) ( not ( = ?auto_183547 ?auto_183551 ) ) ( ON ?auto_183547 ?auto_183548 ) ( ON ?auto_183546 ?auto_183547 ) ( CLEAR ?auto_183544 ) ( ON ?auto_183545 ?auto_183546 ) ( CLEAR ?auto_183545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183551 ?auto_183550 ?auto_183549 ?auto_183548 ?auto_183547 ?auto_183546 )
      ( MAKE-6PILE ?auto_183544 ?auto_183545 ?auto_183546 ?auto_183547 ?auto_183548 ?auto_183549 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183552 - BLOCK
      ?auto_183553 - BLOCK
      ?auto_183554 - BLOCK
      ?auto_183555 - BLOCK
      ?auto_183556 - BLOCK
      ?auto_183557 - BLOCK
    )
    :vars
    (
      ?auto_183559 - BLOCK
      ?auto_183558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183552 ?auto_183553 ) ) ( not ( = ?auto_183552 ?auto_183554 ) ) ( not ( = ?auto_183552 ?auto_183555 ) ) ( not ( = ?auto_183552 ?auto_183556 ) ) ( not ( = ?auto_183552 ?auto_183557 ) ) ( not ( = ?auto_183553 ?auto_183554 ) ) ( not ( = ?auto_183553 ?auto_183555 ) ) ( not ( = ?auto_183553 ?auto_183556 ) ) ( not ( = ?auto_183553 ?auto_183557 ) ) ( not ( = ?auto_183554 ?auto_183555 ) ) ( not ( = ?auto_183554 ?auto_183556 ) ) ( not ( = ?auto_183554 ?auto_183557 ) ) ( not ( = ?auto_183555 ?auto_183556 ) ) ( not ( = ?auto_183555 ?auto_183557 ) ) ( not ( = ?auto_183556 ?auto_183557 ) ) ( ON ?auto_183557 ?auto_183559 ) ( not ( = ?auto_183552 ?auto_183559 ) ) ( not ( = ?auto_183553 ?auto_183559 ) ) ( not ( = ?auto_183554 ?auto_183559 ) ) ( not ( = ?auto_183555 ?auto_183559 ) ) ( not ( = ?auto_183556 ?auto_183559 ) ) ( not ( = ?auto_183557 ?auto_183559 ) ) ( ON ?auto_183556 ?auto_183557 ) ( ON-TABLE ?auto_183558 ) ( ON ?auto_183559 ?auto_183558 ) ( not ( = ?auto_183558 ?auto_183559 ) ) ( not ( = ?auto_183558 ?auto_183557 ) ) ( not ( = ?auto_183558 ?auto_183556 ) ) ( not ( = ?auto_183552 ?auto_183558 ) ) ( not ( = ?auto_183553 ?auto_183558 ) ) ( not ( = ?auto_183554 ?auto_183558 ) ) ( not ( = ?auto_183555 ?auto_183558 ) ) ( ON ?auto_183555 ?auto_183556 ) ( ON ?auto_183554 ?auto_183555 ) ( ON ?auto_183553 ?auto_183554 ) ( CLEAR ?auto_183553 ) ( HOLDING ?auto_183552 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183552 )
      ( MAKE-6PILE ?auto_183552 ?auto_183553 ?auto_183554 ?auto_183555 ?auto_183556 ?auto_183557 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183560 - BLOCK
      ?auto_183561 - BLOCK
      ?auto_183562 - BLOCK
      ?auto_183563 - BLOCK
      ?auto_183564 - BLOCK
      ?auto_183565 - BLOCK
    )
    :vars
    (
      ?auto_183567 - BLOCK
      ?auto_183566 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183560 ?auto_183561 ) ) ( not ( = ?auto_183560 ?auto_183562 ) ) ( not ( = ?auto_183560 ?auto_183563 ) ) ( not ( = ?auto_183560 ?auto_183564 ) ) ( not ( = ?auto_183560 ?auto_183565 ) ) ( not ( = ?auto_183561 ?auto_183562 ) ) ( not ( = ?auto_183561 ?auto_183563 ) ) ( not ( = ?auto_183561 ?auto_183564 ) ) ( not ( = ?auto_183561 ?auto_183565 ) ) ( not ( = ?auto_183562 ?auto_183563 ) ) ( not ( = ?auto_183562 ?auto_183564 ) ) ( not ( = ?auto_183562 ?auto_183565 ) ) ( not ( = ?auto_183563 ?auto_183564 ) ) ( not ( = ?auto_183563 ?auto_183565 ) ) ( not ( = ?auto_183564 ?auto_183565 ) ) ( ON ?auto_183565 ?auto_183567 ) ( not ( = ?auto_183560 ?auto_183567 ) ) ( not ( = ?auto_183561 ?auto_183567 ) ) ( not ( = ?auto_183562 ?auto_183567 ) ) ( not ( = ?auto_183563 ?auto_183567 ) ) ( not ( = ?auto_183564 ?auto_183567 ) ) ( not ( = ?auto_183565 ?auto_183567 ) ) ( ON ?auto_183564 ?auto_183565 ) ( ON-TABLE ?auto_183566 ) ( ON ?auto_183567 ?auto_183566 ) ( not ( = ?auto_183566 ?auto_183567 ) ) ( not ( = ?auto_183566 ?auto_183565 ) ) ( not ( = ?auto_183566 ?auto_183564 ) ) ( not ( = ?auto_183560 ?auto_183566 ) ) ( not ( = ?auto_183561 ?auto_183566 ) ) ( not ( = ?auto_183562 ?auto_183566 ) ) ( not ( = ?auto_183563 ?auto_183566 ) ) ( ON ?auto_183563 ?auto_183564 ) ( ON ?auto_183562 ?auto_183563 ) ( ON ?auto_183561 ?auto_183562 ) ( ON ?auto_183560 ?auto_183561 ) ( CLEAR ?auto_183560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183566 ?auto_183567 ?auto_183565 ?auto_183564 ?auto_183563 ?auto_183562 ?auto_183561 )
      ( MAKE-6PILE ?auto_183560 ?auto_183561 ?auto_183562 ?auto_183563 ?auto_183564 ?auto_183565 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183574 - BLOCK
      ?auto_183575 - BLOCK
      ?auto_183576 - BLOCK
      ?auto_183577 - BLOCK
      ?auto_183578 - BLOCK
      ?auto_183579 - BLOCK
    )
    :vars
    (
      ?auto_183581 - BLOCK
      ?auto_183580 - BLOCK
      ?auto_183582 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183574 ?auto_183575 ) ) ( not ( = ?auto_183574 ?auto_183576 ) ) ( not ( = ?auto_183574 ?auto_183577 ) ) ( not ( = ?auto_183574 ?auto_183578 ) ) ( not ( = ?auto_183574 ?auto_183579 ) ) ( not ( = ?auto_183575 ?auto_183576 ) ) ( not ( = ?auto_183575 ?auto_183577 ) ) ( not ( = ?auto_183575 ?auto_183578 ) ) ( not ( = ?auto_183575 ?auto_183579 ) ) ( not ( = ?auto_183576 ?auto_183577 ) ) ( not ( = ?auto_183576 ?auto_183578 ) ) ( not ( = ?auto_183576 ?auto_183579 ) ) ( not ( = ?auto_183577 ?auto_183578 ) ) ( not ( = ?auto_183577 ?auto_183579 ) ) ( not ( = ?auto_183578 ?auto_183579 ) ) ( ON ?auto_183579 ?auto_183581 ) ( not ( = ?auto_183574 ?auto_183581 ) ) ( not ( = ?auto_183575 ?auto_183581 ) ) ( not ( = ?auto_183576 ?auto_183581 ) ) ( not ( = ?auto_183577 ?auto_183581 ) ) ( not ( = ?auto_183578 ?auto_183581 ) ) ( not ( = ?auto_183579 ?auto_183581 ) ) ( ON ?auto_183578 ?auto_183579 ) ( ON-TABLE ?auto_183580 ) ( ON ?auto_183581 ?auto_183580 ) ( not ( = ?auto_183580 ?auto_183581 ) ) ( not ( = ?auto_183580 ?auto_183579 ) ) ( not ( = ?auto_183580 ?auto_183578 ) ) ( not ( = ?auto_183574 ?auto_183580 ) ) ( not ( = ?auto_183575 ?auto_183580 ) ) ( not ( = ?auto_183576 ?auto_183580 ) ) ( not ( = ?auto_183577 ?auto_183580 ) ) ( ON ?auto_183577 ?auto_183578 ) ( ON ?auto_183576 ?auto_183577 ) ( ON ?auto_183575 ?auto_183576 ) ( CLEAR ?auto_183575 ) ( ON ?auto_183574 ?auto_183582 ) ( CLEAR ?auto_183574 ) ( HAND-EMPTY ) ( not ( = ?auto_183574 ?auto_183582 ) ) ( not ( = ?auto_183575 ?auto_183582 ) ) ( not ( = ?auto_183576 ?auto_183582 ) ) ( not ( = ?auto_183577 ?auto_183582 ) ) ( not ( = ?auto_183578 ?auto_183582 ) ) ( not ( = ?auto_183579 ?auto_183582 ) ) ( not ( = ?auto_183581 ?auto_183582 ) ) ( not ( = ?auto_183580 ?auto_183582 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183574 ?auto_183582 )
      ( MAKE-6PILE ?auto_183574 ?auto_183575 ?auto_183576 ?auto_183577 ?auto_183578 ?auto_183579 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183583 - BLOCK
      ?auto_183584 - BLOCK
      ?auto_183585 - BLOCK
      ?auto_183586 - BLOCK
      ?auto_183587 - BLOCK
      ?auto_183588 - BLOCK
    )
    :vars
    (
      ?auto_183590 - BLOCK
      ?auto_183589 - BLOCK
      ?auto_183591 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183583 ?auto_183584 ) ) ( not ( = ?auto_183583 ?auto_183585 ) ) ( not ( = ?auto_183583 ?auto_183586 ) ) ( not ( = ?auto_183583 ?auto_183587 ) ) ( not ( = ?auto_183583 ?auto_183588 ) ) ( not ( = ?auto_183584 ?auto_183585 ) ) ( not ( = ?auto_183584 ?auto_183586 ) ) ( not ( = ?auto_183584 ?auto_183587 ) ) ( not ( = ?auto_183584 ?auto_183588 ) ) ( not ( = ?auto_183585 ?auto_183586 ) ) ( not ( = ?auto_183585 ?auto_183587 ) ) ( not ( = ?auto_183585 ?auto_183588 ) ) ( not ( = ?auto_183586 ?auto_183587 ) ) ( not ( = ?auto_183586 ?auto_183588 ) ) ( not ( = ?auto_183587 ?auto_183588 ) ) ( ON ?auto_183588 ?auto_183590 ) ( not ( = ?auto_183583 ?auto_183590 ) ) ( not ( = ?auto_183584 ?auto_183590 ) ) ( not ( = ?auto_183585 ?auto_183590 ) ) ( not ( = ?auto_183586 ?auto_183590 ) ) ( not ( = ?auto_183587 ?auto_183590 ) ) ( not ( = ?auto_183588 ?auto_183590 ) ) ( ON ?auto_183587 ?auto_183588 ) ( ON-TABLE ?auto_183589 ) ( ON ?auto_183590 ?auto_183589 ) ( not ( = ?auto_183589 ?auto_183590 ) ) ( not ( = ?auto_183589 ?auto_183588 ) ) ( not ( = ?auto_183589 ?auto_183587 ) ) ( not ( = ?auto_183583 ?auto_183589 ) ) ( not ( = ?auto_183584 ?auto_183589 ) ) ( not ( = ?auto_183585 ?auto_183589 ) ) ( not ( = ?auto_183586 ?auto_183589 ) ) ( ON ?auto_183586 ?auto_183587 ) ( ON ?auto_183585 ?auto_183586 ) ( ON ?auto_183583 ?auto_183591 ) ( CLEAR ?auto_183583 ) ( not ( = ?auto_183583 ?auto_183591 ) ) ( not ( = ?auto_183584 ?auto_183591 ) ) ( not ( = ?auto_183585 ?auto_183591 ) ) ( not ( = ?auto_183586 ?auto_183591 ) ) ( not ( = ?auto_183587 ?auto_183591 ) ) ( not ( = ?auto_183588 ?auto_183591 ) ) ( not ( = ?auto_183590 ?auto_183591 ) ) ( not ( = ?auto_183589 ?auto_183591 ) ) ( HOLDING ?auto_183584 ) ( CLEAR ?auto_183585 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183589 ?auto_183590 ?auto_183588 ?auto_183587 ?auto_183586 ?auto_183585 ?auto_183584 )
      ( MAKE-6PILE ?auto_183583 ?auto_183584 ?auto_183585 ?auto_183586 ?auto_183587 ?auto_183588 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183592 - BLOCK
      ?auto_183593 - BLOCK
      ?auto_183594 - BLOCK
      ?auto_183595 - BLOCK
      ?auto_183596 - BLOCK
      ?auto_183597 - BLOCK
    )
    :vars
    (
      ?auto_183599 - BLOCK
      ?auto_183600 - BLOCK
      ?auto_183598 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183592 ?auto_183593 ) ) ( not ( = ?auto_183592 ?auto_183594 ) ) ( not ( = ?auto_183592 ?auto_183595 ) ) ( not ( = ?auto_183592 ?auto_183596 ) ) ( not ( = ?auto_183592 ?auto_183597 ) ) ( not ( = ?auto_183593 ?auto_183594 ) ) ( not ( = ?auto_183593 ?auto_183595 ) ) ( not ( = ?auto_183593 ?auto_183596 ) ) ( not ( = ?auto_183593 ?auto_183597 ) ) ( not ( = ?auto_183594 ?auto_183595 ) ) ( not ( = ?auto_183594 ?auto_183596 ) ) ( not ( = ?auto_183594 ?auto_183597 ) ) ( not ( = ?auto_183595 ?auto_183596 ) ) ( not ( = ?auto_183595 ?auto_183597 ) ) ( not ( = ?auto_183596 ?auto_183597 ) ) ( ON ?auto_183597 ?auto_183599 ) ( not ( = ?auto_183592 ?auto_183599 ) ) ( not ( = ?auto_183593 ?auto_183599 ) ) ( not ( = ?auto_183594 ?auto_183599 ) ) ( not ( = ?auto_183595 ?auto_183599 ) ) ( not ( = ?auto_183596 ?auto_183599 ) ) ( not ( = ?auto_183597 ?auto_183599 ) ) ( ON ?auto_183596 ?auto_183597 ) ( ON-TABLE ?auto_183600 ) ( ON ?auto_183599 ?auto_183600 ) ( not ( = ?auto_183600 ?auto_183599 ) ) ( not ( = ?auto_183600 ?auto_183597 ) ) ( not ( = ?auto_183600 ?auto_183596 ) ) ( not ( = ?auto_183592 ?auto_183600 ) ) ( not ( = ?auto_183593 ?auto_183600 ) ) ( not ( = ?auto_183594 ?auto_183600 ) ) ( not ( = ?auto_183595 ?auto_183600 ) ) ( ON ?auto_183595 ?auto_183596 ) ( ON ?auto_183594 ?auto_183595 ) ( ON ?auto_183592 ?auto_183598 ) ( not ( = ?auto_183592 ?auto_183598 ) ) ( not ( = ?auto_183593 ?auto_183598 ) ) ( not ( = ?auto_183594 ?auto_183598 ) ) ( not ( = ?auto_183595 ?auto_183598 ) ) ( not ( = ?auto_183596 ?auto_183598 ) ) ( not ( = ?auto_183597 ?auto_183598 ) ) ( not ( = ?auto_183599 ?auto_183598 ) ) ( not ( = ?auto_183600 ?auto_183598 ) ) ( CLEAR ?auto_183594 ) ( ON ?auto_183593 ?auto_183592 ) ( CLEAR ?auto_183593 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183598 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183598 ?auto_183592 )
      ( MAKE-6PILE ?auto_183592 ?auto_183593 ?auto_183594 ?auto_183595 ?auto_183596 ?auto_183597 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183601 - BLOCK
      ?auto_183602 - BLOCK
      ?auto_183603 - BLOCK
      ?auto_183604 - BLOCK
      ?auto_183605 - BLOCK
      ?auto_183606 - BLOCK
    )
    :vars
    (
      ?auto_183608 - BLOCK
      ?auto_183609 - BLOCK
      ?auto_183607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183601 ?auto_183602 ) ) ( not ( = ?auto_183601 ?auto_183603 ) ) ( not ( = ?auto_183601 ?auto_183604 ) ) ( not ( = ?auto_183601 ?auto_183605 ) ) ( not ( = ?auto_183601 ?auto_183606 ) ) ( not ( = ?auto_183602 ?auto_183603 ) ) ( not ( = ?auto_183602 ?auto_183604 ) ) ( not ( = ?auto_183602 ?auto_183605 ) ) ( not ( = ?auto_183602 ?auto_183606 ) ) ( not ( = ?auto_183603 ?auto_183604 ) ) ( not ( = ?auto_183603 ?auto_183605 ) ) ( not ( = ?auto_183603 ?auto_183606 ) ) ( not ( = ?auto_183604 ?auto_183605 ) ) ( not ( = ?auto_183604 ?auto_183606 ) ) ( not ( = ?auto_183605 ?auto_183606 ) ) ( ON ?auto_183606 ?auto_183608 ) ( not ( = ?auto_183601 ?auto_183608 ) ) ( not ( = ?auto_183602 ?auto_183608 ) ) ( not ( = ?auto_183603 ?auto_183608 ) ) ( not ( = ?auto_183604 ?auto_183608 ) ) ( not ( = ?auto_183605 ?auto_183608 ) ) ( not ( = ?auto_183606 ?auto_183608 ) ) ( ON ?auto_183605 ?auto_183606 ) ( ON-TABLE ?auto_183609 ) ( ON ?auto_183608 ?auto_183609 ) ( not ( = ?auto_183609 ?auto_183608 ) ) ( not ( = ?auto_183609 ?auto_183606 ) ) ( not ( = ?auto_183609 ?auto_183605 ) ) ( not ( = ?auto_183601 ?auto_183609 ) ) ( not ( = ?auto_183602 ?auto_183609 ) ) ( not ( = ?auto_183603 ?auto_183609 ) ) ( not ( = ?auto_183604 ?auto_183609 ) ) ( ON ?auto_183604 ?auto_183605 ) ( ON ?auto_183601 ?auto_183607 ) ( not ( = ?auto_183601 ?auto_183607 ) ) ( not ( = ?auto_183602 ?auto_183607 ) ) ( not ( = ?auto_183603 ?auto_183607 ) ) ( not ( = ?auto_183604 ?auto_183607 ) ) ( not ( = ?auto_183605 ?auto_183607 ) ) ( not ( = ?auto_183606 ?auto_183607 ) ) ( not ( = ?auto_183608 ?auto_183607 ) ) ( not ( = ?auto_183609 ?auto_183607 ) ) ( ON ?auto_183602 ?auto_183601 ) ( CLEAR ?auto_183602 ) ( ON-TABLE ?auto_183607 ) ( HOLDING ?auto_183603 ) ( CLEAR ?auto_183604 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183609 ?auto_183608 ?auto_183606 ?auto_183605 ?auto_183604 ?auto_183603 )
      ( MAKE-6PILE ?auto_183601 ?auto_183602 ?auto_183603 ?auto_183604 ?auto_183605 ?auto_183606 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183610 - BLOCK
      ?auto_183611 - BLOCK
      ?auto_183612 - BLOCK
      ?auto_183613 - BLOCK
      ?auto_183614 - BLOCK
      ?auto_183615 - BLOCK
    )
    :vars
    (
      ?auto_183617 - BLOCK
      ?auto_183616 - BLOCK
      ?auto_183618 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183610 ?auto_183611 ) ) ( not ( = ?auto_183610 ?auto_183612 ) ) ( not ( = ?auto_183610 ?auto_183613 ) ) ( not ( = ?auto_183610 ?auto_183614 ) ) ( not ( = ?auto_183610 ?auto_183615 ) ) ( not ( = ?auto_183611 ?auto_183612 ) ) ( not ( = ?auto_183611 ?auto_183613 ) ) ( not ( = ?auto_183611 ?auto_183614 ) ) ( not ( = ?auto_183611 ?auto_183615 ) ) ( not ( = ?auto_183612 ?auto_183613 ) ) ( not ( = ?auto_183612 ?auto_183614 ) ) ( not ( = ?auto_183612 ?auto_183615 ) ) ( not ( = ?auto_183613 ?auto_183614 ) ) ( not ( = ?auto_183613 ?auto_183615 ) ) ( not ( = ?auto_183614 ?auto_183615 ) ) ( ON ?auto_183615 ?auto_183617 ) ( not ( = ?auto_183610 ?auto_183617 ) ) ( not ( = ?auto_183611 ?auto_183617 ) ) ( not ( = ?auto_183612 ?auto_183617 ) ) ( not ( = ?auto_183613 ?auto_183617 ) ) ( not ( = ?auto_183614 ?auto_183617 ) ) ( not ( = ?auto_183615 ?auto_183617 ) ) ( ON ?auto_183614 ?auto_183615 ) ( ON-TABLE ?auto_183616 ) ( ON ?auto_183617 ?auto_183616 ) ( not ( = ?auto_183616 ?auto_183617 ) ) ( not ( = ?auto_183616 ?auto_183615 ) ) ( not ( = ?auto_183616 ?auto_183614 ) ) ( not ( = ?auto_183610 ?auto_183616 ) ) ( not ( = ?auto_183611 ?auto_183616 ) ) ( not ( = ?auto_183612 ?auto_183616 ) ) ( not ( = ?auto_183613 ?auto_183616 ) ) ( ON ?auto_183613 ?auto_183614 ) ( ON ?auto_183610 ?auto_183618 ) ( not ( = ?auto_183610 ?auto_183618 ) ) ( not ( = ?auto_183611 ?auto_183618 ) ) ( not ( = ?auto_183612 ?auto_183618 ) ) ( not ( = ?auto_183613 ?auto_183618 ) ) ( not ( = ?auto_183614 ?auto_183618 ) ) ( not ( = ?auto_183615 ?auto_183618 ) ) ( not ( = ?auto_183617 ?auto_183618 ) ) ( not ( = ?auto_183616 ?auto_183618 ) ) ( ON ?auto_183611 ?auto_183610 ) ( ON-TABLE ?auto_183618 ) ( CLEAR ?auto_183613 ) ( ON ?auto_183612 ?auto_183611 ) ( CLEAR ?auto_183612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183618 ?auto_183610 ?auto_183611 )
      ( MAKE-6PILE ?auto_183610 ?auto_183611 ?auto_183612 ?auto_183613 ?auto_183614 ?auto_183615 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183619 - BLOCK
      ?auto_183620 - BLOCK
      ?auto_183621 - BLOCK
      ?auto_183622 - BLOCK
      ?auto_183623 - BLOCK
      ?auto_183624 - BLOCK
    )
    :vars
    (
      ?auto_183625 - BLOCK
      ?auto_183627 - BLOCK
      ?auto_183626 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183619 ?auto_183620 ) ) ( not ( = ?auto_183619 ?auto_183621 ) ) ( not ( = ?auto_183619 ?auto_183622 ) ) ( not ( = ?auto_183619 ?auto_183623 ) ) ( not ( = ?auto_183619 ?auto_183624 ) ) ( not ( = ?auto_183620 ?auto_183621 ) ) ( not ( = ?auto_183620 ?auto_183622 ) ) ( not ( = ?auto_183620 ?auto_183623 ) ) ( not ( = ?auto_183620 ?auto_183624 ) ) ( not ( = ?auto_183621 ?auto_183622 ) ) ( not ( = ?auto_183621 ?auto_183623 ) ) ( not ( = ?auto_183621 ?auto_183624 ) ) ( not ( = ?auto_183622 ?auto_183623 ) ) ( not ( = ?auto_183622 ?auto_183624 ) ) ( not ( = ?auto_183623 ?auto_183624 ) ) ( ON ?auto_183624 ?auto_183625 ) ( not ( = ?auto_183619 ?auto_183625 ) ) ( not ( = ?auto_183620 ?auto_183625 ) ) ( not ( = ?auto_183621 ?auto_183625 ) ) ( not ( = ?auto_183622 ?auto_183625 ) ) ( not ( = ?auto_183623 ?auto_183625 ) ) ( not ( = ?auto_183624 ?auto_183625 ) ) ( ON ?auto_183623 ?auto_183624 ) ( ON-TABLE ?auto_183627 ) ( ON ?auto_183625 ?auto_183627 ) ( not ( = ?auto_183627 ?auto_183625 ) ) ( not ( = ?auto_183627 ?auto_183624 ) ) ( not ( = ?auto_183627 ?auto_183623 ) ) ( not ( = ?auto_183619 ?auto_183627 ) ) ( not ( = ?auto_183620 ?auto_183627 ) ) ( not ( = ?auto_183621 ?auto_183627 ) ) ( not ( = ?auto_183622 ?auto_183627 ) ) ( ON ?auto_183619 ?auto_183626 ) ( not ( = ?auto_183619 ?auto_183626 ) ) ( not ( = ?auto_183620 ?auto_183626 ) ) ( not ( = ?auto_183621 ?auto_183626 ) ) ( not ( = ?auto_183622 ?auto_183626 ) ) ( not ( = ?auto_183623 ?auto_183626 ) ) ( not ( = ?auto_183624 ?auto_183626 ) ) ( not ( = ?auto_183625 ?auto_183626 ) ) ( not ( = ?auto_183627 ?auto_183626 ) ) ( ON ?auto_183620 ?auto_183619 ) ( ON-TABLE ?auto_183626 ) ( ON ?auto_183621 ?auto_183620 ) ( CLEAR ?auto_183621 ) ( HOLDING ?auto_183622 ) ( CLEAR ?auto_183623 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183627 ?auto_183625 ?auto_183624 ?auto_183623 ?auto_183622 )
      ( MAKE-6PILE ?auto_183619 ?auto_183620 ?auto_183621 ?auto_183622 ?auto_183623 ?auto_183624 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183628 - BLOCK
      ?auto_183629 - BLOCK
      ?auto_183630 - BLOCK
      ?auto_183631 - BLOCK
      ?auto_183632 - BLOCK
      ?auto_183633 - BLOCK
    )
    :vars
    (
      ?auto_183634 - BLOCK
      ?auto_183635 - BLOCK
      ?auto_183636 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183628 ?auto_183629 ) ) ( not ( = ?auto_183628 ?auto_183630 ) ) ( not ( = ?auto_183628 ?auto_183631 ) ) ( not ( = ?auto_183628 ?auto_183632 ) ) ( not ( = ?auto_183628 ?auto_183633 ) ) ( not ( = ?auto_183629 ?auto_183630 ) ) ( not ( = ?auto_183629 ?auto_183631 ) ) ( not ( = ?auto_183629 ?auto_183632 ) ) ( not ( = ?auto_183629 ?auto_183633 ) ) ( not ( = ?auto_183630 ?auto_183631 ) ) ( not ( = ?auto_183630 ?auto_183632 ) ) ( not ( = ?auto_183630 ?auto_183633 ) ) ( not ( = ?auto_183631 ?auto_183632 ) ) ( not ( = ?auto_183631 ?auto_183633 ) ) ( not ( = ?auto_183632 ?auto_183633 ) ) ( ON ?auto_183633 ?auto_183634 ) ( not ( = ?auto_183628 ?auto_183634 ) ) ( not ( = ?auto_183629 ?auto_183634 ) ) ( not ( = ?auto_183630 ?auto_183634 ) ) ( not ( = ?auto_183631 ?auto_183634 ) ) ( not ( = ?auto_183632 ?auto_183634 ) ) ( not ( = ?auto_183633 ?auto_183634 ) ) ( ON ?auto_183632 ?auto_183633 ) ( ON-TABLE ?auto_183635 ) ( ON ?auto_183634 ?auto_183635 ) ( not ( = ?auto_183635 ?auto_183634 ) ) ( not ( = ?auto_183635 ?auto_183633 ) ) ( not ( = ?auto_183635 ?auto_183632 ) ) ( not ( = ?auto_183628 ?auto_183635 ) ) ( not ( = ?auto_183629 ?auto_183635 ) ) ( not ( = ?auto_183630 ?auto_183635 ) ) ( not ( = ?auto_183631 ?auto_183635 ) ) ( ON ?auto_183628 ?auto_183636 ) ( not ( = ?auto_183628 ?auto_183636 ) ) ( not ( = ?auto_183629 ?auto_183636 ) ) ( not ( = ?auto_183630 ?auto_183636 ) ) ( not ( = ?auto_183631 ?auto_183636 ) ) ( not ( = ?auto_183632 ?auto_183636 ) ) ( not ( = ?auto_183633 ?auto_183636 ) ) ( not ( = ?auto_183634 ?auto_183636 ) ) ( not ( = ?auto_183635 ?auto_183636 ) ) ( ON ?auto_183629 ?auto_183628 ) ( ON-TABLE ?auto_183636 ) ( ON ?auto_183630 ?auto_183629 ) ( CLEAR ?auto_183632 ) ( ON ?auto_183631 ?auto_183630 ) ( CLEAR ?auto_183631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183636 ?auto_183628 ?auto_183629 ?auto_183630 )
      ( MAKE-6PILE ?auto_183628 ?auto_183629 ?auto_183630 ?auto_183631 ?auto_183632 ?auto_183633 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183637 - BLOCK
      ?auto_183638 - BLOCK
      ?auto_183639 - BLOCK
      ?auto_183640 - BLOCK
      ?auto_183641 - BLOCK
      ?auto_183642 - BLOCK
    )
    :vars
    (
      ?auto_183644 - BLOCK
      ?auto_183645 - BLOCK
      ?auto_183643 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183637 ?auto_183638 ) ) ( not ( = ?auto_183637 ?auto_183639 ) ) ( not ( = ?auto_183637 ?auto_183640 ) ) ( not ( = ?auto_183637 ?auto_183641 ) ) ( not ( = ?auto_183637 ?auto_183642 ) ) ( not ( = ?auto_183638 ?auto_183639 ) ) ( not ( = ?auto_183638 ?auto_183640 ) ) ( not ( = ?auto_183638 ?auto_183641 ) ) ( not ( = ?auto_183638 ?auto_183642 ) ) ( not ( = ?auto_183639 ?auto_183640 ) ) ( not ( = ?auto_183639 ?auto_183641 ) ) ( not ( = ?auto_183639 ?auto_183642 ) ) ( not ( = ?auto_183640 ?auto_183641 ) ) ( not ( = ?auto_183640 ?auto_183642 ) ) ( not ( = ?auto_183641 ?auto_183642 ) ) ( ON ?auto_183642 ?auto_183644 ) ( not ( = ?auto_183637 ?auto_183644 ) ) ( not ( = ?auto_183638 ?auto_183644 ) ) ( not ( = ?auto_183639 ?auto_183644 ) ) ( not ( = ?auto_183640 ?auto_183644 ) ) ( not ( = ?auto_183641 ?auto_183644 ) ) ( not ( = ?auto_183642 ?auto_183644 ) ) ( ON-TABLE ?auto_183645 ) ( ON ?auto_183644 ?auto_183645 ) ( not ( = ?auto_183645 ?auto_183644 ) ) ( not ( = ?auto_183645 ?auto_183642 ) ) ( not ( = ?auto_183645 ?auto_183641 ) ) ( not ( = ?auto_183637 ?auto_183645 ) ) ( not ( = ?auto_183638 ?auto_183645 ) ) ( not ( = ?auto_183639 ?auto_183645 ) ) ( not ( = ?auto_183640 ?auto_183645 ) ) ( ON ?auto_183637 ?auto_183643 ) ( not ( = ?auto_183637 ?auto_183643 ) ) ( not ( = ?auto_183638 ?auto_183643 ) ) ( not ( = ?auto_183639 ?auto_183643 ) ) ( not ( = ?auto_183640 ?auto_183643 ) ) ( not ( = ?auto_183641 ?auto_183643 ) ) ( not ( = ?auto_183642 ?auto_183643 ) ) ( not ( = ?auto_183644 ?auto_183643 ) ) ( not ( = ?auto_183645 ?auto_183643 ) ) ( ON ?auto_183638 ?auto_183637 ) ( ON-TABLE ?auto_183643 ) ( ON ?auto_183639 ?auto_183638 ) ( ON ?auto_183640 ?auto_183639 ) ( CLEAR ?auto_183640 ) ( HOLDING ?auto_183641 ) ( CLEAR ?auto_183642 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183645 ?auto_183644 ?auto_183642 ?auto_183641 )
      ( MAKE-6PILE ?auto_183637 ?auto_183638 ?auto_183639 ?auto_183640 ?auto_183641 ?auto_183642 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183646 - BLOCK
      ?auto_183647 - BLOCK
      ?auto_183648 - BLOCK
      ?auto_183649 - BLOCK
      ?auto_183650 - BLOCK
      ?auto_183651 - BLOCK
    )
    :vars
    (
      ?auto_183653 - BLOCK
      ?auto_183654 - BLOCK
      ?auto_183652 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183646 ?auto_183647 ) ) ( not ( = ?auto_183646 ?auto_183648 ) ) ( not ( = ?auto_183646 ?auto_183649 ) ) ( not ( = ?auto_183646 ?auto_183650 ) ) ( not ( = ?auto_183646 ?auto_183651 ) ) ( not ( = ?auto_183647 ?auto_183648 ) ) ( not ( = ?auto_183647 ?auto_183649 ) ) ( not ( = ?auto_183647 ?auto_183650 ) ) ( not ( = ?auto_183647 ?auto_183651 ) ) ( not ( = ?auto_183648 ?auto_183649 ) ) ( not ( = ?auto_183648 ?auto_183650 ) ) ( not ( = ?auto_183648 ?auto_183651 ) ) ( not ( = ?auto_183649 ?auto_183650 ) ) ( not ( = ?auto_183649 ?auto_183651 ) ) ( not ( = ?auto_183650 ?auto_183651 ) ) ( ON ?auto_183651 ?auto_183653 ) ( not ( = ?auto_183646 ?auto_183653 ) ) ( not ( = ?auto_183647 ?auto_183653 ) ) ( not ( = ?auto_183648 ?auto_183653 ) ) ( not ( = ?auto_183649 ?auto_183653 ) ) ( not ( = ?auto_183650 ?auto_183653 ) ) ( not ( = ?auto_183651 ?auto_183653 ) ) ( ON-TABLE ?auto_183654 ) ( ON ?auto_183653 ?auto_183654 ) ( not ( = ?auto_183654 ?auto_183653 ) ) ( not ( = ?auto_183654 ?auto_183651 ) ) ( not ( = ?auto_183654 ?auto_183650 ) ) ( not ( = ?auto_183646 ?auto_183654 ) ) ( not ( = ?auto_183647 ?auto_183654 ) ) ( not ( = ?auto_183648 ?auto_183654 ) ) ( not ( = ?auto_183649 ?auto_183654 ) ) ( ON ?auto_183646 ?auto_183652 ) ( not ( = ?auto_183646 ?auto_183652 ) ) ( not ( = ?auto_183647 ?auto_183652 ) ) ( not ( = ?auto_183648 ?auto_183652 ) ) ( not ( = ?auto_183649 ?auto_183652 ) ) ( not ( = ?auto_183650 ?auto_183652 ) ) ( not ( = ?auto_183651 ?auto_183652 ) ) ( not ( = ?auto_183653 ?auto_183652 ) ) ( not ( = ?auto_183654 ?auto_183652 ) ) ( ON ?auto_183647 ?auto_183646 ) ( ON-TABLE ?auto_183652 ) ( ON ?auto_183648 ?auto_183647 ) ( ON ?auto_183649 ?auto_183648 ) ( CLEAR ?auto_183651 ) ( ON ?auto_183650 ?auto_183649 ) ( CLEAR ?auto_183650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183652 ?auto_183646 ?auto_183647 ?auto_183648 ?auto_183649 )
      ( MAKE-6PILE ?auto_183646 ?auto_183647 ?auto_183648 ?auto_183649 ?auto_183650 ?auto_183651 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183655 - BLOCK
      ?auto_183656 - BLOCK
      ?auto_183657 - BLOCK
      ?auto_183658 - BLOCK
      ?auto_183659 - BLOCK
      ?auto_183660 - BLOCK
    )
    :vars
    (
      ?auto_183661 - BLOCK
      ?auto_183662 - BLOCK
      ?auto_183663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183655 ?auto_183656 ) ) ( not ( = ?auto_183655 ?auto_183657 ) ) ( not ( = ?auto_183655 ?auto_183658 ) ) ( not ( = ?auto_183655 ?auto_183659 ) ) ( not ( = ?auto_183655 ?auto_183660 ) ) ( not ( = ?auto_183656 ?auto_183657 ) ) ( not ( = ?auto_183656 ?auto_183658 ) ) ( not ( = ?auto_183656 ?auto_183659 ) ) ( not ( = ?auto_183656 ?auto_183660 ) ) ( not ( = ?auto_183657 ?auto_183658 ) ) ( not ( = ?auto_183657 ?auto_183659 ) ) ( not ( = ?auto_183657 ?auto_183660 ) ) ( not ( = ?auto_183658 ?auto_183659 ) ) ( not ( = ?auto_183658 ?auto_183660 ) ) ( not ( = ?auto_183659 ?auto_183660 ) ) ( not ( = ?auto_183655 ?auto_183661 ) ) ( not ( = ?auto_183656 ?auto_183661 ) ) ( not ( = ?auto_183657 ?auto_183661 ) ) ( not ( = ?auto_183658 ?auto_183661 ) ) ( not ( = ?auto_183659 ?auto_183661 ) ) ( not ( = ?auto_183660 ?auto_183661 ) ) ( ON-TABLE ?auto_183662 ) ( ON ?auto_183661 ?auto_183662 ) ( not ( = ?auto_183662 ?auto_183661 ) ) ( not ( = ?auto_183662 ?auto_183660 ) ) ( not ( = ?auto_183662 ?auto_183659 ) ) ( not ( = ?auto_183655 ?auto_183662 ) ) ( not ( = ?auto_183656 ?auto_183662 ) ) ( not ( = ?auto_183657 ?auto_183662 ) ) ( not ( = ?auto_183658 ?auto_183662 ) ) ( ON ?auto_183655 ?auto_183663 ) ( not ( = ?auto_183655 ?auto_183663 ) ) ( not ( = ?auto_183656 ?auto_183663 ) ) ( not ( = ?auto_183657 ?auto_183663 ) ) ( not ( = ?auto_183658 ?auto_183663 ) ) ( not ( = ?auto_183659 ?auto_183663 ) ) ( not ( = ?auto_183660 ?auto_183663 ) ) ( not ( = ?auto_183661 ?auto_183663 ) ) ( not ( = ?auto_183662 ?auto_183663 ) ) ( ON ?auto_183656 ?auto_183655 ) ( ON-TABLE ?auto_183663 ) ( ON ?auto_183657 ?auto_183656 ) ( ON ?auto_183658 ?auto_183657 ) ( ON ?auto_183659 ?auto_183658 ) ( CLEAR ?auto_183659 ) ( HOLDING ?auto_183660 ) ( CLEAR ?auto_183661 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183662 ?auto_183661 ?auto_183660 )
      ( MAKE-6PILE ?auto_183655 ?auto_183656 ?auto_183657 ?auto_183658 ?auto_183659 ?auto_183660 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183664 - BLOCK
      ?auto_183665 - BLOCK
      ?auto_183666 - BLOCK
      ?auto_183667 - BLOCK
      ?auto_183668 - BLOCK
      ?auto_183669 - BLOCK
    )
    :vars
    (
      ?auto_183671 - BLOCK
      ?auto_183672 - BLOCK
      ?auto_183670 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183664 ?auto_183665 ) ) ( not ( = ?auto_183664 ?auto_183666 ) ) ( not ( = ?auto_183664 ?auto_183667 ) ) ( not ( = ?auto_183664 ?auto_183668 ) ) ( not ( = ?auto_183664 ?auto_183669 ) ) ( not ( = ?auto_183665 ?auto_183666 ) ) ( not ( = ?auto_183665 ?auto_183667 ) ) ( not ( = ?auto_183665 ?auto_183668 ) ) ( not ( = ?auto_183665 ?auto_183669 ) ) ( not ( = ?auto_183666 ?auto_183667 ) ) ( not ( = ?auto_183666 ?auto_183668 ) ) ( not ( = ?auto_183666 ?auto_183669 ) ) ( not ( = ?auto_183667 ?auto_183668 ) ) ( not ( = ?auto_183667 ?auto_183669 ) ) ( not ( = ?auto_183668 ?auto_183669 ) ) ( not ( = ?auto_183664 ?auto_183671 ) ) ( not ( = ?auto_183665 ?auto_183671 ) ) ( not ( = ?auto_183666 ?auto_183671 ) ) ( not ( = ?auto_183667 ?auto_183671 ) ) ( not ( = ?auto_183668 ?auto_183671 ) ) ( not ( = ?auto_183669 ?auto_183671 ) ) ( ON-TABLE ?auto_183672 ) ( ON ?auto_183671 ?auto_183672 ) ( not ( = ?auto_183672 ?auto_183671 ) ) ( not ( = ?auto_183672 ?auto_183669 ) ) ( not ( = ?auto_183672 ?auto_183668 ) ) ( not ( = ?auto_183664 ?auto_183672 ) ) ( not ( = ?auto_183665 ?auto_183672 ) ) ( not ( = ?auto_183666 ?auto_183672 ) ) ( not ( = ?auto_183667 ?auto_183672 ) ) ( ON ?auto_183664 ?auto_183670 ) ( not ( = ?auto_183664 ?auto_183670 ) ) ( not ( = ?auto_183665 ?auto_183670 ) ) ( not ( = ?auto_183666 ?auto_183670 ) ) ( not ( = ?auto_183667 ?auto_183670 ) ) ( not ( = ?auto_183668 ?auto_183670 ) ) ( not ( = ?auto_183669 ?auto_183670 ) ) ( not ( = ?auto_183671 ?auto_183670 ) ) ( not ( = ?auto_183672 ?auto_183670 ) ) ( ON ?auto_183665 ?auto_183664 ) ( ON-TABLE ?auto_183670 ) ( ON ?auto_183666 ?auto_183665 ) ( ON ?auto_183667 ?auto_183666 ) ( ON ?auto_183668 ?auto_183667 ) ( CLEAR ?auto_183671 ) ( ON ?auto_183669 ?auto_183668 ) ( CLEAR ?auto_183669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183670 ?auto_183664 ?auto_183665 ?auto_183666 ?auto_183667 ?auto_183668 )
      ( MAKE-6PILE ?auto_183664 ?auto_183665 ?auto_183666 ?auto_183667 ?auto_183668 ?auto_183669 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183673 - BLOCK
      ?auto_183674 - BLOCK
      ?auto_183675 - BLOCK
      ?auto_183676 - BLOCK
      ?auto_183677 - BLOCK
      ?auto_183678 - BLOCK
    )
    :vars
    (
      ?auto_183679 - BLOCK
      ?auto_183681 - BLOCK
      ?auto_183680 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183673 ?auto_183674 ) ) ( not ( = ?auto_183673 ?auto_183675 ) ) ( not ( = ?auto_183673 ?auto_183676 ) ) ( not ( = ?auto_183673 ?auto_183677 ) ) ( not ( = ?auto_183673 ?auto_183678 ) ) ( not ( = ?auto_183674 ?auto_183675 ) ) ( not ( = ?auto_183674 ?auto_183676 ) ) ( not ( = ?auto_183674 ?auto_183677 ) ) ( not ( = ?auto_183674 ?auto_183678 ) ) ( not ( = ?auto_183675 ?auto_183676 ) ) ( not ( = ?auto_183675 ?auto_183677 ) ) ( not ( = ?auto_183675 ?auto_183678 ) ) ( not ( = ?auto_183676 ?auto_183677 ) ) ( not ( = ?auto_183676 ?auto_183678 ) ) ( not ( = ?auto_183677 ?auto_183678 ) ) ( not ( = ?auto_183673 ?auto_183679 ) ) ( not ( = ?auto_183674 ?auto_183679 ) ) ( not ( = ?auto_183675 ?auto_183679 ) ) ( not ( = ?auto_183676 ?auto_183679 ) ) ( not ( = ?auto_183677 ?auto_183679 ) ) ( not ( = ?auto_183678 ?auto_183679 ) ) ( ON-TABLE ?auto_183681 ) ( not ( = ?auto_183681 ?auto_183679 ) ) ( not ( = ?auto_183681 ?auto_183678 ) ) ( not ( = ?auto_183681 ?auto_183677 ) ) ( not ( = ?auto_183673 ?auto_183681 ) ) ( not ( = ?auto_183674 ?auto_183681 ) ) ( not ( = ?auto_183675 ?auto_183681 ) ) ( not ( = ?auto_183676 ?auto_183681 ) ) ( ON ?auto_183673 ?auto_183680 ) ( not ( = ?auto_183673 ?auto_183680 ) ) ( not ( = ?auto_183674 ?auto_183680 ) ) ( not ( = ?auto_183675 ?auto_183680 ) ) ( not ( = ?auto_183676 ?auto_183680 ) ) ( not ( = ?auto_183677 ?auto_183680 ) ) ( not ( = ?auto_183678 ?auto_183680 ) ) ( not ( = ?auto_183679 ?auto_183680 ) ) ( not ( = ?auto_183681 ?auto_183680 ) ) ( ON ?auto_183674 ?auto_183673 ) ( ON-TABLE ?auto_183680 ) ( ON ?auto_183675 ?auto_183674 ) ( ON ?auto_183676 ?auto_183675 ) ( ON ?auto_183677 ?auto_183676 ) ( ON ?auto_183678 ?auto_183677 ) ( CLEAR ?auto_183678 ) ( HOLDING ?auto_183679 ) ( CLEAR ?auto_183681 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183681 ?auto_183679 )
      ( MAKE-6PILE ?auto_183673 ?auto_183674 ?auto_183675 ?auto_183676 ?auto_183677 ?auto_183678 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183682 - BLOCK
      ?auto_183683 - BLOCK
      ?auto_183684 - BLOCK
      ?auto_183685 - BLOCK
      ?auto_183686 - BLOCK
      ?auto_183687 - BLOCK
    )
    :vars
    (
      ?auto_183688 - BLOCK
      ?auto_183689 - BLOCK
      ?auto_183690 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183682 ?auto_183683 ) ) ( not ( = ?auto_183682 ?auto_183684 ) ) ( not ( = ?auto_183682 ?auto_183685 ) ) ( not ( = ?auto_183682 ?auto_183686 ) ) ( not ( = ?auto_183682 ?auto_183687 ) ) ( not ( = ?auto_183683 ?auto_183684 ) ) ( not ( = ?auto_183683 ?auto_183685 ) ) ( not ( = ?auto_183683 ?auto_183686 ) ) ( not ( = ?auto_183683 ?auto_183687 ) ) ( not ( = ?auto_183684 ?auto_183685 ) ) ( not ( = ?auto_183684 ?auto_183686 ) ) ( not ( = ?auto_183684 ?auto_183687 ) ) ( not ( = ?auto_183685 ?auto_183686 ) ) ( not ( = ?auto_183685 ?auto_183687 ) ) ( not ( = ?auto_183686 ?auto_183687 ) ) ( not ( = ?auto_183682 ?auto_183688 ) ) ( not ( = ?auto_183683 ?auto_183688 ) ) ( not ( = ?auto_183684 ?auto_183688 ) ) ( not ( = ?auto_183685 ?auto_183688 ) ) ( not ( = ?auto_183686 ?auto_183688 ) ) ( not ( = ?auto_183687 ?auto_183688 ) ) ( ON-TABLE ?auto_183689 ) ( not ( = ?auto_183689 ?auto_183688 ) ) ( not ( = ?auto_183689 ?auto_183687 ) ) ( not ( = ?auto_183689 ?auto_183686 ) ) ( not ( = ?auto_183682 ?auto_183689 ) ) ( not ( = ?auto_183683 ?auto_183689 ) ) ( not ( = ?auto_183684 ?auto_183689 ) ) ( not ( = ?auto_183685 ?auto_183689 ) ) ( ON ?auto_183682 ?auto_183690 ) ( not ( = ?auto_183682 ?auto_183690 ) ) ( not ( = ?auto_183683 ?auto_183690 ) ) ( not ( = ?auto_183684 ?auto_183690 ) ) ( not ( = ?auto_183685 ?auto_183690 ) ) ( not ( = ?auto_183686 ?auto_183690 ) ) ( not ( = ?auto_183687 ?auto_183690 ) ) ( not ( = ?auto_183688 ?auto_183690 ) ) ( not ( = ?auto_183689 ?auto_183690 ) ) ( ON ?auto_183683 ?auto_183682 ) ( ON-TABLE ?auto_183690 ) ( ON ?auto_183684 ?auto_183683 ) ( ON ?auto_183685 ?auto_183684 ) ( ON ?auto_183686 ?auto_183685 ) ( ON ?auto_183687 ?auto_183686 ) ( CLEAR ?auto_183689 ) ( ON ?auto_183688 ?auto_183687 ) ( CLEAR ?auto_183688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183690 ?auto_183682 ?auto_183683 ?auto_183684 ?auto_183685 ?auto_183686 ?auto_183687 )
      ( MAKE-6PILE ?auto_183682 ?auto_183683 ?auto_183684 ?auto_183685 ?auto_183686 ?auto_183687 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183691 - BLOCK
      ?auto_183692 - BLOCK
      ?auto_183693 - BLOCK
      ?auto_183694 - BLOCK
      ?auto_183695 - BLOCK
      ?auto_183696 - BLOCK
    )
    :vars
    (
      ?auto_183699 - BLOCK
      ?auto_183698 - BLOCK
      ?auto_183697 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183691 ?auto_183692 ) ) ( not ( = ?auto_183691 ?auto_183693 ) ) ( not ( = ?auto_183691 ?auto_183694 ) ) ( not ( = ?auto_183691 ?auto_183695 ) ) ( not ( = ?auto_183691 ?auto_183696 ) ) ( not ( = ?auto_183692 ?auto_183693 ) ) ( not ( = ?auto_183692 ?auto_183694 ) ) ( not ( = ?auto_183692 ?auto_183695 ) ) ( not ( = ?auto_183692 ?auto_183696 ) ) ( not ( = ?auto_183693 ?auto_183694 ) ) ( not ( = ?auto_183693 ?auto_183695 ) ) ( not ( = ?auto_183693 ?auto_183696 ) ) ( not ( = ?auto_183694 ?auto_183695 ) ) ( not ( = ?auto_183694 ?auto_183696 ) ) ( not ( = ?auto_183695 ?auto_183696 ) ) ( not ( = ?auto_183691 ?auto_183699 ) ) ( not ( = ?auto_183692 ?auto_183699 ) ) ( not ( = ?auto_183693 ?auto_183699 ) ) ( not ( = ?auto_183694 ?auto_183699 ) ) ( not ( = ?auto_183695 ?auto_183699 ) ) ( not ( = ?auto_183696 ?auto_183699 ) ) ( not ( = ?auto_183698 ?auto_183699 ) ) ( not ( = ?auto_183698 ?auto_183696 ) ) ( not ( = ?auto_183698 ?auto_183695 ) ) ( not ( = ?auto_183691 ?auto_183698 ) ) ( not ( = ?auto_183692 ?auto_183698 ) ) ( not ( = ?auto_183693 ?auto_183698 ) ) ( not ( = ?auto_183694 ?auto_183698 ) ) ( ON ?auto_183691 ?auto_183697 ) ( not ( = ?auto_183691 ?auto_183697 ) ) ( not ( = ?auto_183692 ?auto_183697 ) ) ( not ( = ?auto_183693 ?auto_183697 ) ) ( not ( = ?auto_183694 ?auto_183697 ) ) ( not ( = ?auto_183695 ?auto_183697 ) ) ( not ( = ?auto_183696 ?auto_183697 ) ) ( not ( = ?auto_183699 ?auto_183697 ) ) ( not ( = ?auto_183698 ?auto_183697 ) ) ( ON ?auto_183692 ?auto_183691 ) ( ON-TABLE ?auto_183697 ) ( ON ?auto_183693 ?auto_183692 ) ( ON ?auto_183694 ?auto_183693 ) ( ON ?auto_183695 ?auto_183694 ) ( ON ?auto_183696 ?auto_183695 ) ( ON ?auto_183699 ?auto_183696 ) ( CLEAR ?auto_183699 ) ( HOLDING ?auto_183698 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183698 )
      ( MAKE-6PILE ?auto_183691 ?auto_183692 ?auto_183693 ?auto_183694 ?auto_183695 ?auto_183696 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183700 - BLOCK
      ?auto_183701 - BLOCK
      ?auto_183702 - BLOCK
      ?auto_183703 - BLOCK
      ?auto_183704 - BLOCK
      ?auto_183705 - BLOCK
    )
    :vars
    (
      ?auto_183707 - BLOCK
      ?auto_183708 - BLOCK
      ?auto_183706 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183700 ?auto_183701 ) ) ( not ( = ?auto_183700 ?auto_183702 ) ) ( not ( = ?auto_183700 ?auto_183703 ) ) ( not ( = ?auto_183700 ?auto_183704 ) ) ( not ( = ?auto_183700 ?auto_183705 ) ) ( not ( = ?auto_183701 ?auto_183702 ) ) ( not ( = ?auto_183701 ?auto_183703 ) ) ( not ( = ?auto_183701 ?auto_183704 ) ) ( not ( = ?auto_183701 ?auto_183705 ) ) ( not ( = ?auto_183702 ?auto_183703 ) ) ( not ( = ?auto_183702 ?auto_183704 ) ) ( not ( = ?auto_183702 ?auto_183705 ) ) ( not ( = ?auto_183703 ?auto_183704 ) ) ( not ( = ?auto_183703 ?auto_183705 ) ) ( not ( = ?auto_183704 ?auto_183705 ) ) ( not ( = ?auto_183700 ?auto_183707 ) ) ( not ( = ?auto_183701 ?auto_183707 ) ) ( not ( = ?auto_183702 ?auto_183707 ) ) ( not ( = ?auto_183703 ?auto_183707 ) ) ( not ( = ?auto_183704 ?auto_183707 ) ) ( not ( = ?auto_183705 ?auto_183707 ) ) ( not ( = ?auto_183708 ?auto_183707 ) ) ( not ( = ?auto_183708 ?auto_183705 ) ) ( not ( = ?auto_183708 ?auto_183704 ) ) ( not ( = ?auto_183700 ?auto_183708 ) ) ( not ( = ?auto_183701 ?auto_183708 ) ) ( not ( = ?auto_183702 ?auto_183708 ) ) ( not ( = ?auto_183703 ?auto_183708 ) ) ( ON ?auto_183700 ?auto_183706 ) ( not ( = ?auto_183700 ?auto_183706 ) ) ( not ( = ?auto_183701 ?auto_183706 ) ) ( not ( = ?auto_183702 ?auto_183706 ) ) ( not ( = ?auto_183703 ?auto_183706 ) ) ( not ( = ?auto_183704 ?auto_183706 ) ) ( not ( = ?auto_183705 ?auto_183706 ) ) ( not ( = ?auto_183707 ?auto_183706 ) ) ( not ( = ?auto_183708 ?auto_183706 ) ) ( ON ?auto_183701 ?auto_183700 ) ( ON-TABLE ?auto_183706 ) ( ON ?auto_183702 ?auto_183701 ) ( ON ?auto_183703 ?auto_183702 ) ( ON ?auto_183704 ?auto_183703 ) ( ON ?auto_183705 ?auto_183704 ) ( ON ?auto_183707 ?auto_183705 ) ( ON ?auto_183708 ?auto_183707 ) ( CLEAR ?auto_183708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_183706 ?auto_183700 ?auto_183701 ?auto_183702 ?auto_183703 ?auto_183704 ?auto_183705 ?auto_183707 )
      ( MAKE-6PILE ?auto_183700 ?auto_183701 ?auto_183702 ?auto_183703 ?auto_183704 ?auto_183705 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_183720 - BLOCK
    )
    :vars
    (
      ?auto_183721 - BLOCK
      ?auto_183722 - BLOCK
      ?auto_183723 - BLOCK
      ?auto_183724 - BLOCK
      ?auto_183726 - BLOCK
      ?auto_183725 - BLOCK
      ?auto_183727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183721 ?auto_183720 ) ( ON-TABLE ?auto_183720 ) ( not ( = ?auto_183720 ?auto_183721 ) ) ( not ( = ?auto_183720 ?auto_183722 ) ) ( not ( = ?auto_183720 ?auto_183723 ) ) ( not ( = ?auto_183721 ?auto_183722 ) ) ( not ( = ?auto_183721 ?auto_183723 ) ) ( not ( = ?auto_183722 ?auto_183723 ) ) ( ON ?auto_183722 ?auto_183721 ) ( CLEAR ?auto_183722 ) ( HOLDING ?auto_183723 ) ( CLEAR ?auto_183724 ) ( ON-TABLE ?auto_183726 ) ( ON ?auto_183725 ?auto_183726 ) ( ON ?auto_183727 ?auto_183725 ) ( ON ?auto_183724 ?auto_183727 ) ( not ( = ?auto_183726 ?auto_183725 ) ) ( not ( = ?auto_183726 ?auto_183727 ) ) ( not ( = ?auto_183726 ?auto_183724 ) ) ( not ( = ?auto_183726 ?auto_183723 ) ) ( not ( = ?auto_183725 ?auto_183727 ) ) ( not ( = ?auto_183725 ?auto_183724 ) ) ( not ( = ?auto_183725 ?auto_183723 ) ) ( not ( = ?auto_183727 ?auto_183724 ) ) ( not ( = ?auto_183727 ?auto_183723 ) ) ( not ( = ?auto_183724 ?auto_183723 ) ) ( not ( = ?auto_183720 ?auto_183724 ) ) ( not ( = ?auto_183720 ?auto_183726 ) ) ( not ( = ?auto_183720 ?auto_183725 ) ) ( not ( = ?auto_183720 ?auto_183727 ) ) ( not ( = ?auto_183721 ?auto_183724 ) ) ( not ( = ?auto_183721 ?auto_183726 ) ) ( not ( = ?auto_183721 ?auto_183725 ) ) ( not ( = ?auto_183721 ?auto_183727 ) ) ( not ( = ?auto_183722 ?auto_183724 ) ) ( not ( = ?auto_183722 ?auto_183726 ) ) ( not ( = ?auto_183722 ?auto_183725 ) ) ( not ( = ?auto_183722 ?auto_183727 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183726 ?auto_183725 ?auto_183727 ?auto_183724 ?auto_183723 )
      ( MAKE-1PILE ?auto_183720 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_183728 - BLOCK
    )
    :vars
    (
      ?auto_183730 - BLOCK
      ?auto_183733 - BLOCK
      ?auto_183731 - BLOCK
      ?auto_183734 - BLOCK
      ?auto_183729 - BLOCK
      ?auto_183735 - BLOCK
      ?auto_183732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183730 ?auto_183728 ) ( ON-TABLE ?auto_183728 ) ( not ( = ?auto_183728 ?auto_183730 ) ) ( not ( = ?auto_183728 ?auto_183733 ) ) ( not ( = ?auto_183728 ?auto_183731 ) ) ( not ( = ?auto_183730 ?auto_183733 ) ) ( not ( = ?auto_183730 ?auto_183731 ) ) ( not ( = ?auto_183733 ?auto_183731 ) ) ( ON ?auto_183733 ?auto_183730 ) ( CLEAR ?auto_183734 ) ( ON-TABLE ?auto_183729 ) ( ON ?auto_183735 ?auto_183729 ) ( ON ?auto_183732 ?auto_183735 ) ( ON ?auto_183734 ?auto_183732 ) ( not ( = ?auto_183729 ?auto_183735 ) ) ( not ( = ?auto_183729 ?auto_183732 ) ) ( not ( = ?auto_183729 ?auto_183734 ) ) ( not ( = ?auto_183729 ?auto_183731 ) ) ( not ( = ?auto_183735 ?auto_183732 ) ) ( not ( = ?auto_183735 ?auto_183734 ) ) ( not ( = ?auto_183735 ?auto_183731 ) ) ( not ( = ?auto_183732 ?auto_183734 ) ) ( not ( = ?auto_183732 ?auto_183731 ) ) ( not ( = ?auto_183734 ?auto_183731 ) ) ( not ( = ?auto_183728 ?auto_183734 ) ) ( not ( = ?auto_183728 ?auto_183729 ) ) ( not ( = ?auto_183728 ?auto_183735 ) ) ( not ( = ?auto_183728 ?auto_183732 ) ) ( not ( = ?auto_183730 ?auto_183734 ) ) ( not ( = ?auto_183730 ?auto_183729 ) ) ( not ( = ?auto_183730 ?auto_183735 ) ) ( not ( = ?auto_183730 ?auto_183732 ) ) ( not ( = ?auto_183733 ?auto_183734 ) ) ( not ( = ?auto_183733 ?auto_183729 ) ) ( not ( = ?auto_183733 ?auto_183735 ) ) ( not ( = ?auto_183733 ?auto_183732 ) ) ( ON ?auto_183731 ?auto_183733 ) ( CLEAR ?auto_183731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183728 ?auto_183730 ?auto_183733 )
      ( MAKE-1PILE ?auto_183728 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_183736 - BLOCK
    )
    :vars
    (
      ?auto_183743 - BLOCK
      ?auto_183739 - BLOCK
      ?auto_183738 - BLOCK
      ?auto_183741 - BLOCK
      ?auto_183742 - BLOCK
      ?auto_183737 - BLOCK
      ?auto_183740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183743 ?auto_183736 ) ( ON-TABLE ?auto_183736 ) ( not ( = ?auto_183736 ?auto_183743 ) ) ( not ( = ?auto_183736 ?auto_183739 ) ) ( not ( = ?auto_183736 ?auto_183738 ) ) ( not ( = ?auto_183743 ?auto_183739 ) ) ( not ( = ?auto_183743 ?auto_183738 ) ) ( not ( = ?auto_183739 ?auto_183738 ) ) ( ON ?auto_183739 ?auto_183743 ) ( ON-TABLE ?auto_183741 ) ( ON ?auto_183742 ?auto_183741 ) ( ON ?auto_183737 ?auto_183742 ) ( not ( = ?auto_183741 ?auto_183742 ) ) ( not ( = ?auto_183741 ?auto_183737 ) ) ( not ( = ?auto_183741 ?auto_183740 ) ) ( not ( = ?auto_183741 ?auto_183738 ) ) ( not ( = ?auto_183742 ?auto_183737 ) ) ( not ( = ?auto_183742 ?auto_183740 ) ) ( not ( = ?auto_183742 ?auto_183738 ) ) ( not ( = ?auto_183737 ?auto_183740 ) ) ( not ( = ?auto_183737 ?auto_183738 ) ) ( not ( = ?auto_183740 ?auto_183738 ) ) ( not ( = ?auto_183736 ?auto_183740 ) ) ( not ( = ?auto_183736 ?auto_183741 ) ) ( not ( = ?auto_183736 ?auto_183742 ) ) ( not ( = ?auto_183736 ?auto_183737 ) ) ( not ( = ?auto_183743 ?auto_183740 ) ) ( not ( = ?auto_183743 ?auto_183741 ) ) ( not ( = ?auto_183743 ?auto_183742 ) ) ( not ( = ?auto_183743 ?auto_183737 ) ) ( not ( = ?auto_183739 ?auto_183740 ) ) ( not ( = ?auto_183739 ?auto_183741 ) ) ( not ( = ?auto_183739 ?auto_183742 ) ) ( not ( = ?auto_183739 ?auto_183737 ) ) ( ON ?auto_183738 ?auto_183739 ) ( CLEAR ?auto_183738 ) ( HOLDING ?auto_183740 ) ( CLEAR ?auto_183737 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183741 ?auto_183742 ?auto_183737 ?auto_183740 )
      ( MAKE-1PILE ?auto_183736 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_183744 - BLOCK
    )
    :vars
    (
      ?auto_183748 - BLOCK
      ?auto_183745 - BLOCK
      ?auto_183746 - BLOCK
      ?auto_183751 - BLOCK
      ?auto_183750 - BLOCK
      ?auto_183747 - BLOCK
      ?auto_183749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183748 ?auto_183744 ) ( ON-TABLE ?auto_183744 ) ( not ( = ?auto_183744 ?auto_183748 ) ) ( not ( = ?auto_183744 ?auto_183745 ) ) ( not ( = ?auto_183744 ?auto_183746 ) ) ( not ( = ?auto_183748 ?auto_183745 ) ) ( not ( = ?auto_183748 ?auto_183746 ) ) ( not ( = ?auto_183745 ?auto_183746 ) ) ( ON ?auto_183745 ?auto_183748 ) ( ON-TABLE ?auto_183751 ) ( ON ?auto_183750 ?auto_183751 ) ( ON ?auto_183747 ?auto_183750 ) ( not ( = ?auto_183751 ?auto_183750 ) ) ( not ( = ?auto_183751 ?auto_183747 ) ) ( not ( = ?auto_183751 ?auto_183749 ) ) ( not ( = ?auto_183751 ?auto_183746 ) ) ( not ( = ?auto_183750 ?auto_183747 ) ) ( not ( = ?auto_183750 ?auto_183749 ) ) ( not ( = ?auto_183750 ?auto_183746 ) ) ( not ( = ?auto_183747 ?auto_183749 ) ) ( not ( = ?auto_183747 ?auto_183746 ) ) ( not ( = ?auto_183749 ?auto_183746 ) ) ( not ( = ?auto_183744 ?auto_183749 ) ) ( not ( = ?auto_183744 ?auto_183751 ) ) ( not ( = ?auto_183744 ?auto_183750 ) ) ( not ( = ?auto_183744 ?auto_183747 ) ) ( not ( = ?auto_183748 ?auto_183749 ) ) ( not ( = ?auto_183748 ?auto_183751 ) ) ( not ( = ?auto_183748 ?auto_183750 ) ) ( not ( = ?auto_183748 ?auto_183747 ) ) ( not ( = ?auto_183745 ?auto_183749 ) ) ( not ( = ?auto_183745 ?auto_183751 ) ) ( not ( = ?auto_183745 ?auto_183750 ) ) ( not ( = ?auto_183745 ?auto_183747 ) ) ( ON ?auto_183746 ?auto_183745 ) ( CLEAR ?auto_183747 ) ( ON ?auto_183749 ?auto_183746 ) ( CLEAR ?auto_183749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183744 ?auto_183748 ?auto_183745 ?auto_183746 )
      ( MAKE-1PILE ?auto_183744 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_183752 - BLOCK
    )
    :vars
    (
      ?auto_183758 - BLOCK
      ?auto_183756 - BLOCK
      ?auto_183755 - BLOCK
      ?auto_183753 - BLOCK
      ?auto_183754 - BLOCK
      ?auto_183757 - BLOCK
      ?auto_183759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183758 ?auto_183752 ) ( ON-TABLE ?auto_183752 ) ( not ( = ?auto_183752 ?auto_183758 ) ) ( not ( = ?auto_183752 ?auto_183756 ) ) ( not ( = ?auto_183752 ?auto_183755 ) ) ( not ( = ?auto_183758 ?auto_183756 ) ) ( not ( = ?auto_183758 ?auto_183755 ) ) ( not ( = ?auto_183756 ?auto_183755 ) ) ( ON ?auto_183756 ?auto_183758 ) ( ON-TABLE ?auto_183753 ) ( ON ?auto_183754 ?auto_183753 ) ( not ( = ?auto_183753 ?auto_183754 ) ) ( not ( = ?auto_183753 ?auto_183757 ) ) ( not ( = ?auto_183753 ?auto_183759 ) ) ( not ( = ?auto_183753 ?auto_183755 ) ) ( not ( = ?auto_183754 ?auto_183757 ) ) ( not ( = ?auto_183754 ?auto_183759 ) ) ( not ( = ?auto_183754 ?auto_183755 ) ) ( not ( = ?auto_183757 ?auto_183759 ) ) ( not ( = ?auto_183757 ?auto_183755 ) ) ( not ( = ?auto_183759 ?auto_183755 ) ) ( not ( = ?auto_183752 ?auto_183759 ) ) ( not ( = ?auto_183752 ?auto_183753 ) ) ( not ( = ?auto_183752 ?auto_183754 ) ) ( not ( = ?auto_183752 ?auto_183757 ) ) ( not ( = ?auto_183758 ?auto_183759 ) ) ( not ( = ?auto_183758 ?auto_183753 ) ) ( not ( = ?auto_183758 ?auto_183754 ) ) ( not ( = ?auto_183758 ?auto_183757 ) ) ( not ( = ?auto_183756 ?auto_183759 ) ) ( not ( = ?auto_183756 ?auto_183753 ) ) ( not ( = ?auto_183756 ?auto_183754 ) ) ( not ( = ?auto_183756 ?auto_183757 ) ) ( ON ?auto_183755 ?auto_183756 ) ( ON ?auto_183759 ?auto_183755 ) ( CLEAR ?auto_183759 ) ( HOLDING ?auto_183757 ) ( CLEAR ?auto_183754 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183753 ?auto_183754 ?auto_183757 )
      ( MAKE-1PILE ?auto_183752 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_183760 - BLOCK
    )
    :vars
    (
      ?auto_183767 - BLOCK
      ?auto_183766 - BLOCK
      ?auto_183763 - BLOCK
      ?auto_183764 - BLOCK
      ?auto_183761 - BLOCK
      ?auto_183765 - BLOCK
      ?auto_183762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183767 ?auto_183760 ) ( ON-TABLE ?auto_183760 ) ( not ( = ?auto_183760 ?auto_183767 ) ) ( not ( = ?auto_183760 ?auto_183766 ) ) ( not ( = ?auto_183760 ?auto_183763 ) ) ( not ( = ?auto_183767 ?auto_183766 ) ) ( not ( = ?auto_183767 ?auto_183763 ) ) ( not ( = ?auto_183766 ?auto_183763 ) ) ( ON ?auto_183766 ?auto_183767 ) ( ON-TABLE ?auto_183764 ) ( ON ?auto_183761 ?auto_183764 ) ( not ( = ?auto_183764 ?auto_183761 ) ) ( not ( = ?auto_183764 ?auto_183765 ) ) ( not ( = ?auto_183764 ?auto_183762 ) ) ( not ( = ?auto_183764 ?auto_183763 ) ) ( not ( = ?auto_183761 ?auto_183765 ) ) ( not ( = ?auto_183761 ?auto_183762 ) ) ( not ( = ?auto_183761 ?auto_183763 ) ) ( not ( = ?auto_183765 ?auto_183762 ) ) ( not ( = ?auto_183765 ?auto_183763 ) ) ( not ( = ?auto_183762 ?auto_183763 ) ) ( not ( = ?auto_183760 ?auto_183762 ) ) ( not ( = ?auto_183760 ?auto_183764 ) ) ( not ( = ?auto_183760 ?auto_183761 ) ) ( not ( = ?auto_183760 ?auto_183765 ) ) ( not ( = ?auto_183767 ?auto_183762 ) ) ( not ( = ?auto_183767 ?auto_183764 ) ) ( not ( = ?auto_183767 ?auto_183761 ) ) ( not ( = ?auto_183767 ?auto_183765 ) ) ( not ( = ?auto_183766 ?auto_183762 ) ) ( not ( = ?auto_183766 ?auto_183764 ) ) ( not ( = ?auto_183766 ?auto_183761 ) ) ( not ( = ?auto_183766 ?auto_183765 ) ) ( ON ?auto_183763 ?auto_183766 ) ( ON ?auto_183762 ?auto_183763 ) ( CLEAR ?auto_183761 ) ( ON ?auto_183765 ?auto_183762 ) ( CLEAR ?auto_183765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183760 ?auto_183767 ?auto_183766 ?auto_183763 ?auto_183762 )
      ( MAKE-1PILE ?auto_183760 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_183768 - BLOCK
    )
    :vars
    (
      ?auto_183772 - BLOCK
      ?auto_183773 - BLOCK
      ?auto_183769 - BLOCK
      ?auto_183770 - BLOCK
      ?auto_183774 - BLOCK
      ?auto_183771 - BLOCK
      ?auto_183775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183772 ?auto_183768 ) ( ON-TABLE ?auto_183768 ) ( not ( = ?auto_183768 ?auto_183772 ) ) ( not ( = ?auto_183768 ?auto_183773 ) ) ( not ( = ?auto_183768 ?auto_183769 ) ) ( not ( = ?auto_183772 ?auto_183773 ) ) ( not ( = ?auto_183772 ?auto_183769 ) ) ( not ( = ?auto_183773 ?auto_183769 ) ) ( ON ?auto_183773 ?auto_183772 ) ( ON-TABLE ?auto_183770 ) ( not ( = ?auto_183770 ?auto_183774 ) ) ( not ( = ?auto_183770 ?auto_183771 ) ) ( not ( = ?auto_183770 ?auto_183775 ) ) ( not ( = ?auto_183770 ?auto_183769 ) ) ( not ( = ?auto_183774 ?auto_183771 ) ) ( not ( = ?auto_183774 ?auto_183775 ) ) ( not ( = ?auto_183774 ?auto_183769 ) ) ( not ( = ?auto_183771 ?auto_183775 ) ) ( not ( = ?auto_183771 ?auto_183769 ) ) ( not ( = ?auto_183775 ?auto_183769 ) ) ( not ( = ?auto_183768 ?auto_183775 ) ) ( not ( = ?auto_183768 ?auto_183770 ) ) ( not ( = ?auto_183768 ?auto_183774 ) ) ( not ( = ?auto_183768 ?auto_183771 ) ) ( not ( = ?auto_183772 ?auto_183775 ) ) ( not ( = ?auto_183772 ?auto_183770 ) ) ( not ( = ?auto_183772 ?auto_183774 ) ) ( not ( = ?auto_183772 ?auto_183771 ) ) ( not ( = ?auto_183773 ?auto_183775 ) ) ( not ( = ?auto_183773 ?auto_183770 ) ) ( not ( = ?auto_183773 ?auto_183774 ) ) ( not ( = ?auto_183773 ?auto_183771 ) ) ( ON ?auto_183769 ?auto_183773 ) ( ON ?auto_183775 ?auto_183769 ) ( ON ?auto_183771 ?auto_183775 ) ( CLEAR ?auto_183771 ) ( HOLDING ?auto_183774 ) ( CLEAR ?auto_183770 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183770 ?auto_183774 )
      ( MAKE-1PILE ?auto_183768 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_183776 - BLOCK
    )
    :vars
    (
      ?auto_183778 - BLOCK
      ?auto_183783 - BLOCK
      ?auto_183782 - BLOCK
      ?auto_183781 - BLOCK
      ?auto_183780 - BLOCK
      ?auto_183777 - BLOCK
      ?auto_183779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183778 ?auto_183776 ) ( ON-TABLE ?auto_183776 ) ( not ( = ?auto_183776 ?auto_183778 ) ) ( not ( = ?auto_183776 ?auto_183783 ) ) ( not ( = ?auto_183776 ?auto_183782 ) ) ( not ( = ?auto_183778 ?auto_183783 ) ) ( not ( = ?auto_183778 ?auto_183782 ) ) ( not ( = ?auto_183783 ?auto_183782 ) ) ( ON ?auto_183783 ?auto_183778 ) ( ON-TABLE ?auto_183781 ) ( not ( = ?auto_183781 ?auto_183780 ) ) ( not ( = ?auto_183781 ?auto_183777 ) ) ( not ( = ?auto_183781 ?auto_183779 ) ) ( not ( = ?auto_183781 ?auto_183782 ) ) ( not ( = ?auto_183780 ?auto_183777 ) ) ( not ( = ?auto_183780 ?auto_183779 ) ) ( not ( = ?auto_183780 ?auto_183782 ) ) ( not ( = ?auto_183777 ?auto_183779 ) ) ( not ( = ?auto_183777 ?auto_183782 ) ) ( not ( = ?auto_183779 ?auto_183782 ) ) ( not ( = ?auto_183776 ?auto_183779 ) ) ( not ( = ?auto_183776 ?auto_183781 ) ) ( not ( = ?auto_183776 ?auto_183780 ) ) ( not ( = ?auto_183776 ?auto_183777 ) ) ( not ( = ?auto_183778 ?auto_183779 ) ) ( not ( = ?auto_183778 ?auto_183781 ) ) ( not ( = ?auto_183778 ?auto_183780 ) ) ( not ( = ?auto_183778 ?auto_183777 ) ) ( not ( = ?auto_183783 ?auto_183779 ) ) ( not ( = ?auto_183783 ?auto_183781 ) ) ( not ( = ?auto_183783 ?auto_183780 ) ) ( not ( = ?auto_183783 ?auto_183777 ) ) ( ON ?auto_183782 ?auto_183783 ) ( ON ?auto_183779 ?auto_183782 ) ( ON ?auto_183777 ?auto_183779 ) ( CLEAR ?auto_183781 ) ( ON ?auto_183780 ?auto_183777 ) ( CLEAR ?auto_183780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183776 ?auto_183778 ?auto_183783 ?auto_183782 ?auto_183779 ?auto_183777 )
      ( MAKE-1PILE ?auto_183776 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_183784 - BLOCK
    )
    :vars
    (
      ?auto_183785 - BLOCK
      ?auto_183789 - BLOCK
      ?auto_183787 - BLOCK
      ?auto_183788 - BLOCK
      ?auto_183791 - BLOCK
      ?auto_183786 - BLOCK
      ?auto_183790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183785 ?auto_183784 ) ( ON-TABLE ?auto_183784 ) ( not ( = ?auto_183784 ?auto_183785 ) ) ( not ( = ?auto_183784 ?auto_183789 ) ) ( not ( = ?auto_183784 ?auto_183787 ) ) ( not ( = ?auto_183785 ?auto_183789 ) ) ( not ( = ?auto_183785 ?auto_183787 ) ) ( not ( = ?auto_183789 ?auto_183787 ) ) ( ON ?auto_183789 ?auto_183785 ) ( not ( = ?auto_183788 ?auto_183791 ) ) ( not ( = ?auto_183788 ?auto_183786 ) ) ( not ( = ?auto_183788 ?auto_183790 ) ) ( not ( = ?auto_183788 ?auto_183787 ) ) ( not ( = ?auto_183791 ?auto_183786 ) ) ( not ( = ?auto_183791 ?auto_183790 ) ) ( not ( = ?auto_183791 ?auto_183787 ) ) ( not ( = ?auto_183786 ?auto_183790 ) ) ( not ( = ?auto_183786 ?auto_183787 ) ) ( not ( = ?auto_183790 ?auto_183787 ) ) ( not ( = ?auto_183784 ?auto_183790 ) ) ( not ( = ?auto_183784 ?auto_183788 ) ) ( not ( = ?auto_183784 ?auto_183791 ) ) ( not ( = ?auto_183784 ?auto_183786 ) ) ( not ( = ?auto_183785 ?auto_183790 ) ) ( not ( = ?auto_183785 ?auto_183788 ) ) ( not ( = ?auto_183785 ?auto_183791 ) ) ( not ( = ?auto_183785 ?auto_183786 ) ) ( not ( = ?auto_183789 ?auto_183790 ) ) ( not ( = ?auto_183789 ?auto_183788 ) ) ( not ( = ?auto_183789 ?auto_183791 ) ) ( not ( = ?auto_183789 ?auto_183786 ) ) ( ON ?auto_183787 ?auto_183789 ) ( ON ?auto_183790 ?auto_183787 ) ( ON ?auto_183786 ?auto_183790 ) ( ON ?auto_183791 ?auto_183786 ) ( CLEAR ?auto_183791 ) ( HOLDING ?auto_183788 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183788 )
      ( MAKE-1PILE ?auto_183784 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_183801 - BLOCK
    )
    :vars
    (
      ?auto_183807 - BLOCK
      ?auto_183806 - BLOCK
      ?auto_183808 - BLOCK
      ?auto_183805 - BLOCK
      ?auto_183802 - BLOCK
      ?auto_183803 - BLOCK
      ?auto_183804 - BLOCK
      ?auto_183809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183807 ?auto_183801 ) ( ON-TABLE ?auto_183801 ) ( not ( = ?auto_183801 ?auto_183807 ) ) ( not ( = ?auto_183801 ?auto_183806 ) ) ( not ( = ?auto_183801 ?auto_183808 ) ) ( not ( = ?auto_183807 ?auto_183806 ) ) ( not ( = ?auto_183807 ?auto_183808 ) ) ( not ( = ?auto_183806 ?auto_183808 ) ) ( ON ?auto_183806 ?auto_183807 ) ( not ( = ?auto_183805 ?auto_183802 ) ) ( not ( = ?auto_183805 ?auto_183803 ) ) ( not ( = ?auto_183805 ?auto_183804 ) ) ( not ( = ?auto_183805 ?auto_183808 ) ) ( not ( = ?auto_183802 ?auto_183803 ) ) ( not ( = ?auto_183802 ?auto_183804 ) ) ( not ( = ?auto_183802 ?auto_183808 ) ) ( not ( = ?auto_183803 ?auto_183804 ) ) ( not ( = ?auto_183803 ?auto_183808 ) ) ( not ( = ?auto_183804 ?auto_183808 ) ) ( not ( = ?auto_183801 ?auto_183804 ) ) ( not ( = ?auto_183801 ?auto_183805 ) ) ( not ( = ?auto_183801 ?auto_183802 ) ) ( not ( = ?auto_183801 ?auto_183803 ) ) ( not ( = ?auto_183807 ?auto_183804 ) ) ( not ( = ?auto_183807 ?auto_183805 ) ) ( not ( = ?auto_183807 ?auto_183802 ) ) ( not ( = ?auto_183807 ?auto_183803 ) ) ( not ( = ?auto_183806 ?auto_183804 ) ) ( not ( = ?auto_183806 ?auto_183805 ) ) ( not ( = ?auto_183806 ?auto_183802 ) ) ( not ( = ?auto_183806 ?auto_183803 ) ) ( ON ?auto_183808 ?auto_183806 ) ( ON ?auto_183804 ?auto_183808 ) ( ON ?auto_183803 ?auto_183804 ) ( ON ?auto_183802 ?auto_183803 ) ( CLEAR ?auto_183802 ) ( ON ?auto_183805 ?auto_183809 ) ( CLEAR ?auto_183805 ) ( HAND-EMPTY ) ( not ( = ?auto_183801 ?auto_183809 ) ) ( not ( = ?auto_183807 ?auto_183809 ) ) ( not ( = ?auto_183806 ?auto_183809 ) ) ( not ( = ?auto_183808 ?auto_183809 ) ) ( not ( = ?auto_183805 ?auto_183809 ) ) ( not ( = ?auto_183802 ?auto_183809 ) ) ( not ( = ?auto_183803 ?auto_183809 ) ) ( not ( = ?auto_183804 ?auto_183809 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183805 ?auto_183809 )
      ( MAKE-1PILE ?auto_183801 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_183810 - BLOCK
    )
    :vars
    (
      ?auto_183817 - BLOCK
      ?auto_183812 - BLOCK
      ?auto_183814 - BLOCK
      ?auto_183811 - BLOCK
      ?auto_183815 - BLOCK
      ?auto_183816 - BLOCK
      ?auto_183818 - BLOCK
      ?auto_183813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183817 ?auto_183810 ) ( ON-TABLE ?auto_183810 ) ( not ( = ?auto_183810 ?auto_183817 ) ) ( not ( = ?auto_183810 ?auto_183812 ) ) ( not ( = ?auto_183810 ?auto_183814 ) ) ( not ( = ?auto_183817 ?auto_183812 ) ) ( not ( = ?auto_183817 ?auto_183814 ) ) ( not ( = ?auto_183812 ?auto_183814 ) ) ( ON ?auto_183812 ?auto_183817 ) ( not ( = ?auto_183811 ?auto_183815 ) ) ( not ( = ?auto_183811 ?auto_183816 ) ) ( not ( = ?auto_183811 ?auto_183818 ) ) ( not ( = ?auto_183811 ?auto_183814 ) ) ( not ( = ?auto_183815 ?auto_183816 ) ) ( not ( = ?auto_183815 ?auto_183818 ) ) ( not ( = ?auto_183815 ?auto_183814 ) ) ( not ( = ?auto_183816 ?auto_183818 ) ) ( not ( = ?auto_183816 ?auto_183814 ) ) ( not ( = ?auto_183818 ?auto_183814 ) ) ( not ( = ?auto_183810 ?auto_183818 ) ) ( not ( = ?auto_183810 ?auto_183811 ) ) ( not ( = ?auto_183810 ?auto_183815 ) ) ( not ( = ?auto_183810 ?auto_183816 ) ) ( not ( = ?auto_183817 ?auto_183818 ) ) ( not ( = ?auto_183817 ?auto_183811 ) ) ( not ( = ?auto_183817 ?auto_183815 ) ) ( not ( = ?auto_183817 ?auto_183816 ) ) ( not ( = ?auto_183812 ?auto_183818 ) ) ( not ( = ?auto_183812 ?auto_183811 ) ) ( not ( = ?auto_183812 ?auto_183815 ) ) ( not ( = ?auto_183812 ?auto_183816 ) ) ( ON ?auto_183814 ?auto_183812 ) ( ON ?auto_183818 ?auto_183814 ) ( ON ?auto_183816 ?auto_183818 ) ( ON ?auto_183811 ?auto_183813 ) ( CLEAR ?auto_183811 ) ( not ( = ?auto_183810 ?auto_183813 ) ) ( not ( = ?auto_183817 ?auto_183813 ) ) ( not ( = ?auto_183812 ?auto_183813 ) ) ( not ( = ?auto_183814 ?auto_183813 ) ) ( not ( = ?auto_183811 ?auto_183813 ) ) ( not ( = ?auto_183815 ?auto_183813 ) ) ( not ( = ?auto_183816 ?auto_183813 ) ) ( not ( = ?auto_183818 ?auto_183813 ) ) ( HOLDING ?auto_183815 ) ( CLEAR ?auto_183816 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183810 ?auto_183817 ?auto_183812 ?auto_183814 ?auto_183818 ?auto_183816 ?auto_183815 )
      ( MAKE-1PILE ?auto_183810 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_183819 - BLOCK
    )
    :vars
    (
      ?auto_183821 - BLOCK
      ?auto_183825 - BLOCK
      ?auto_183827 - BLOCK
      ?auto_183823 - BLOCK
      ?auto_183822 - BLOCK
      ?auto_183826 - BLOCK
      ?auto_183824 - BLOCK
      ?auto_183820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183821 ?auto_183819 ) ( ON-TABLE ?auto_183819 ) ( not ( = ?auto_183819 ?auto_183821 ) ) ( not ( = ?auto_183819 ?auto_183825 ) ) ( not ( = ?auto_183819 ?auto_183827 ) ) ( not ( = ?auto_183821 ?auto_183825 ) ) ( not ( = ?auto_183821 ?auto_183827 ) ) ( not ( = ?auto_183825 ?auto_183827 ) ) ( ON ?auto_183825 ?auto_183821 ) ( not ( = ?auto_183823 ?auto_183822 ) ) ( not ( = ?auto_183823 ?auto_183826 ) ) ( not ( = ?auto_183823 ?auto_183824 ) ) ( not ( = ?auto_183823 ?auto_183827 ) ) ( not ( = ?auto_183822 ?auto_183826 ) ) ( not ( = ?auto_183822 ?auto_183824 ) ) ( not ( = ?auto_183822 ?auto_183827 ) ) ( not ( = ?auto_183826 ?auto_183824 ) ) ( not ( = ?auto_183826 ?auto_183827 ) ) ( not ( = ?auto_183824 ?auto_183827 ) ) ( not ( = ?auto_183819 ?auto_183824 ) ) ( not ( = ?auto_183819 ?auto_183823 ) ) ( not ( = ?auto_183819 ?auto_183822 ) ) ( not ( = ?auto_183819 ?auto_183826 ) ) ( not ( = ?auto_183821 ?auto_183824 ) ) ( not ( = ?auto_183821 ?auto_183823 ) ) ( not ( = ?auto_183821 ?auto_183822 ) ) ( not ( = ?auto_183821 ?auto_183826 ) ) ( not ( = ?auto_183825 ?auto_183824 ) ) ( not ( = ?auto_183825 ?auto_183823 ) ) ( not ( = ?auto_183825 ?auto_183822 ) ) ( not ( = ?auto_183825 ?auto_183826 ) ) ( ON ?auto_183827 ?auto_183825 ) ( ON ?auto_183824 ?auto_183827 ) ( ON ?auto_183826 ?auto_183824 ) ( ON ?auto_183823 ?auto_183820 ) ( not ( = ?auto_183819 ?auto_183820 ) ) ( not ( = ?auto_183821 ?auto_183820 ) ) ( not ( = ?auto_183825 ?auto_183820 ) ) ( not ( = ?auto_183827 ?auto_183820 ) ) ( not ( = ?auto_183823 ?auto_183820 ) ) ( not ( = ?auto_183822 ?auto_183820 ) ) ( not ( = ?auto_183826 ?auto_183820 ) ) ( not ( = ?auto_183824 ?auto_183820 ) ) ( CLEAR ?auto_183826 ) ( ON ?auto_183822 ?auto_183823 ) ( CLEAR ?auto_183822 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183820 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183820 ?auto_183823 )
      ( MAKE-1PILE ?auto_183819 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_183828 - BLOCK
    )
    :vars
    (
      ?auto_183834 - BLOCK
      ?auto_183832 - BLOCK
      ?auto_183833 - BLOCK
      ?auto_183835 - BLOCK
      ?auto_183831 - BLOCK
      ?auto_183836 - BLOCK
      ?auto_183829 - BLOCK
      ?auto_183830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183834 ?auto_183828 ) ( ON-TABLE ?auto_183828 ) ( not ( = ?auto_183828 ?auto_183834 ) ) ( not ( = ?auto_183828 ?auto_183832 ) ) ( not ( = ?auto_183828 ?auto_183833 ) ) ( not ( = ?auto_183834 ?auto_183832 ) ) ( not ( = ?auto_183834 ?auto_183833 ) ) ( not ( = ?auto_183832 ?auto_183833 ) ) ( ON ?auto_183832 ?auto_183834 ) ( not ( = ?auto_183835 ?auto_183831 ) ) ( not ( = ?auto_183835 ?auto_183836 ) ) ( not ( = ?auto_183835 ?auto_183829 ) ) ( not ( = ?auto_183835 ?auto_183833 ) ) ( not ( = ?auto_183831 ?auto_183836 ) ) ( not ( = ?auto_183831 ?auto_183829 ) ) ( not ( = ?auto_183831 ?auto_183833 ) ) ( not ( = ?auto_183836 ?auto_183829 ) ) ( not ( = ?auto_183836 ?auto_183833 ) ) ( not ( = ?auto_183829 ?auto_183833 ) ) ( not ( = ?auto_183828 ?auto_183829 ) ) ( not ( = ?auto_183828 ?auto_183835 ) ) ( not ( = ?auto_183828 ?auto_183831 ) ) ( not ( = ?auto_183828 ?auto_183836 ) ) ( not ( = ?auto_183834 ?auto_183829 ) ) ( not ( = ?auto_183834 ?auto_183835 ) ) ( not ( = ?auto_183834 ?auto_183831 ) ) ( not ( = ?auto_183834 ?auto_183836 ) ) ( not ( = ?auto_183832 ?auto_183829 ) ) ( not ( = ?auto_183832 ?auto_183835 ) ) ( not ( = ?auto_183832 ?auto_183831 ) ) ( not ( = ?auto_183832 ?auto_183836 ) ) ( ON ?auto_183833 ?auto_183832 ) ( ON ?auto_183829 ?auto_183833 ) ( ON ?auto_183835 ?auto_183830 ) ( not ( = ?auto_183828 ?auto_183830 ) ) ( not ( = ?auto_183834 ?auto_183830 ) ) ( not ( = ?auto_183832 ?auto_183830 ) ) ( not ( = ?auto_183833 ?auto_183830 ) ) ( not ( = ?auto_183835 ?auto_183830 ) ) ( not ( = ?auto_183831 ?auto_183830 ) ) ( not ( = ?auto_183836 ?auto_183830 ) ) ( not ( = ?auto_183829 ?auto_183830 ) ) ( ON ?auto_183831 ?auto_183835 ) ( CLEAR ?auto_183831 ) ( ON-TABLE ?auto_183830 ) ( HOLDING ?auto_183836 ) ( CLEAR ?auto_183829 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183828 ?auto_183834 ?auto_183832 ?auto_183833 ?auto_183829 ?auto_183836 )
      ( MAKE-1PILE ?auto_183828 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_183837 - BLOCK
    )
    :vars
    (
      ?auto_183842 - BLOCK
      ?auto_183839 - BLOCK
      ?auto_183840 - BLOCK
      ?auto_183844 - BLOCK
      ?auto_183841 - BLOCK
      ?auto_183843 - BLOCK
      ?auto_183838 - BLOCK
      ?auto_183845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183842 ?auto_183837 ) ( ON-TABLE ?auto_183837 ) ( not ( = ?auto_183837 ?auto_183842 ) ) ( not ( = ?auto_183837 ?auto_183839 ) ) ( not ( = ?auto_183837 ?auto_183840 ) ) ( not ( = ?auto_183842 ?auto_183839 ) ) ( not ( = ?auto_183842 ?auto_183840 ) ) ( not ( = ?auto_183839 ?auto_183840 ) ) ( ON ?auto_183839 ?auto_183842 ) ( not ( = ?auto_183844 ?auto_183841 ) ) ( not ( = ?auto_183844 ?auto_183843 ) ) ( not ( = ?auto_183844 ?auto_183838 ) ) ( not ( = ?auto_183844 ?auto_183840 ) ) ( not ( = ?auto_183841 ?auto_183843 ) ) ( not ( = ?auto_183841 ?auto_183838 ) ) ( not ( = ?auto_183841 ?auto_183840 ) ) ( not ( = ?auto_183843 ?auto_183838 ) ) ( not ( = ?auto_183843 ?auto_183840 ) ) ( not ( = ?auto_183838 ?auto_183840 ) ) ( not ( = ?auto_183837 ?auto_183838 ) ) ( not ( = ?auto_183837 ?auto_183844 ) ) ( not ( = ?auto_183837 ?auto_183841 ) ) ( not ( = ?auto_183837 ?auto_183843 ) ) ( not ( = ?auto_183842 ?auto_183838 ) ) ( not ( = ?auto_183842 ?auto_183844 ) ) ( not ( = ?auto_183842 ?auto_183841 ) ) ( not ( = ?auto_183842 ?auto_183843 ) ) ( not ( = ?auto_183839 ?auto_183838 ) ) ( not ( = ?auto_183839 ?auto_183844 ) ) ( not ( = ?auto_183839 ?auto_183841 ) ) ( not ( = ?auto_183839 ?auto_183843 ) ) ( ON ?auto_183840 ?auto_183839 ) ( ON ?auto_183838 ?auto_183840 ) ( ON ?auto_183844 ?auto_183845 ) ( not ( = ?auto_183837 ?auto_183845 ) ) ( not ( = ?auto_183842 ?auto_183845 ) ) ( not ( = ?auto_183839 ?auto_183845 ) ) ( not ( = ?auto_183840 ?auto_183845 ) ) ( not ( = ?auto_183844 ?auto_183845 ) ) ( not ( = ?auto_183841 ?auto_183845 ) ) ( not ( = ?auto_183843 ?auto_183845 ) ) ( not ( = ?auto_183838 ?auto_183845 ) ) ( ON ?auto_183841 ?auto_183844 ) ( ON-TABLE ?auto_183845 ) ( CLEAR ?auto_183838 ) ( ON ?auto_183843 ?auto_183841 ) ( CLEAR ?auto_183843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183845 ?auto_183844 ?auto_183841 )
      ( MAKE-1PILE ?auto_183837 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183889 - BLOCK
      ?auto_183890 - BLOCK
      ?auto_183891 - BLOCK
      ?auto_183892 - BLOCK
      ?auto_183893 - BLOCK
      ?auto_183894 - BLOCK
      ?auto_183895 - BLOCK
    )
    :vars
    (
      ?auto_183896 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183889 ) ( ON ?auto_183890 ?auto_183889 ) ( ON ?auto_183891 ?auto_183890 ) ( ON ?auto_183892 ?auto_183891 ) ( ON ?auto_183893 ?auto_183892 ) ( not ( = ?auto_183889 ?auto_183890 ) ) ( not ( = ?auto_183889 ?auto_183891 ) ) ( not ( = ?auto_183889 ?auto_183892 ) ) ( not ( = ?auto_183889 ?auto_183893 ) ) ( not ( = ?auto_183889 ?auto_183894 ) ) ( not ( = ?auto_183889 ?auto_183895 ) ) ( not ( = ?auto_183890 ?auto_183891 ) ) ( not ( = ?auto_183890 ?auto_183892 ) ) ( not ( = ?auto_183890 ?auto_183893 ) ) ( not ( = ?auto_183890 ?auto_183894 ) ) ( not ( = ?auto_183890 ?auto_183895 ) ) ( not ( = ?auto_183891 ?auto_183892 ) ) ( not ( = ?auto_183891 ?auto_183893 ) ) ( not ( = ?auto_183891 ?auto_183894 ) ) ( not ( = ?auto_183891 ?auto_183895 ) ) ( not ( = ?auto_183892 ?auto_183893 ) ) ( not ( = ?auto_183892 ?auto_183894 ) ) ( not ( = ?auto_183892 ?auto_183895 ) ) ( not ( = ?auto_183893 ?auto_183894 ) ) ( not ( = ?auto_183893 ?auto_183895 ) ) ( not ( = ?auto_183894 ?auto_183895 ) ) ( ON ?auto_183895 ?auto_183896 ) ( not ( = ?auto_183889 ?auto_183896 ) ) ( not ( = ?auto_183890 ?auto_183896 ) ) ( not ( = ?auto_183891 ?auto_183896 ) ) ( not ( = ?auto_183892 ?auto_183896 ) ) ( not ( = ?auto_183893 ?auto_183896 ) ) ( not ( = ?auto_183894 ?auto_183896 ) ) ( not ( = ?auto_183895 ?auto_183896 ) ) ( CLEAR ?auto_183893 ) ( ON ?auto_183894 ?auto_183895 ) ( CLEAR ?auto_183894 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183896 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183896 ?auto_183895 )
      ( MAKE-7PILE ?auto_183889 ?auto_183890 ?auto_183891 ?auto_183892 ?auto_183893 ?auto_183894 ?auto_183895 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183897 - BLOCK
      ?auto_183898 - BLOCK
      ?auto_183899 - BLOCK
      ?auto_183900 - BLOCK
      ?auto_183901 - BLOCK
      ?auto_183902 - BLOCK
      ?auto_183903 - BLOCK
    )
    :vars
    (
      ?auto_183904 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183897 ) ( ON ?auto_183898 ?auto_183897 ) ( ON ?auto_183899 ?auto_183898 ) ( ON ?auto_183900 ?auto_183899 ) ( not ( = ?auto_183897 ?auto_183898 ) ) ( not ( = ?auto_183897 ?auto_183899 ) ) ( not ( = ?auto_183897 ?auto_183900 ) ) ( not ( = ?auto_183897 ?auto_183901 ) ) ( not ( = ?auto_183897 ?auto_183902 ) ) ( not ( = ?auto_183897 ?auto_183903 ) ) ( not ( = ?auto_183898 ?auto_183899 ) ) ( not ( = ?auto_183898 ?auto_183900 ) ) ( not ( = ?auto_183898 ?auto_183901 ) ) ( not ( = ?auto_183898 ?auto_183902 ) ) ( not ( = ?auto_183898 ?auto_183903 ) ) ( not ( = ?auto_183899 ?auto_183900 ) ) ( not ( = ?auto_183899 ?auto_183901 ) ) ( not ( = ?auto_183899 ?auto_183902 ) ) ( not ( = ?auto_183899 ?auto_183903 ) ) ( not ( = ?auto_183900 ?auto_183901 ) ) ( not ( = ?auto_183900 ?auto_183902 ) ) ( not ( = ?auto_183900 ?auto_183903 ) ) ( not ( = ?auto_183901 ?auto_183902 ) ) ( not ( = ?auto_183901 ?auto_183903 ) ) ( not ( = ?auto_183902 ?auto_183903 ) ) ( ON ?auto_183903 ?auto_183904 ) ( not ( = ?auto_183897 ?auto_183904 ) ) ( not ( = ?auto_183898 ?auto_183904 ) ) ( not ( = ?auto_183899 ?auto_183904 ) ) ( not ( = ?auto_183900 ?auto_183904 ) ) ( not ( = ?auto_183901 ?auto_183904 ) ) ( not ( = ?auto_183902 ?auto_183904 ) ) ( not ( = ?auto_183903 ?auto_183904 ) ) ( ON ?auto_183902 ?auto_183903 ) ( CLEAR ?auto_183902 ) ( ON-TABLE ?auto_183904 ) ( HOLDING ?auto_183901 ) ( CLEAR ?auto_183900 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183897 ?auto_183898 ?auto_183899 ?auto_183900 ?auto_183901 )
      ( MAKE-7PILE ?auto_183897 ?auto_183898 ?auto_183899 ?auto_183900 ?auto_183901 ?auto_183902 ?auto_183903 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183905 - BLOCK
      ?auto_183906 - BLOCK
      ?auto_183907 - BLOCK
      ?auto_183908 - BLOCK
      ?auto_183909 - BLOCK
      ?auto_183910 - BLOCK
      ?auto_183911 - BLOCK
    )
    :vars
    (
      ?auto_183912 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183905 ) ( ON ?auto_183906 ?auto_183905 ) ( ON ?auto_183907 ?auto_183906 ) ( ON ?auto_183908 ?auto_183907 ) ( not ( = ?auto_183905 ?auto_183906 ) ) ( not ( = ?auto_183905 ?auto_183907 ) ) ( not ( = ?auto_183905 ?auto_183908 ) ) ( not ( = ?auto_183905 ?auto_183909 ) ) ( not ( = ?auto_183905 ?auto_183910 ) ) ( not ( = ?auto_183905 ?auto_183911 ) ) ( not ( = ?auto_183906 ?auto_183907 ) ) ( not ( = ?auto_183906 ?auto_183908 ) ) ( not ( = ?auto_183906 ?auto_183909 ) ) ( not ( = ?auto_183906 ?auto_183910 ) ) ( not ( = ?auto_183906 ?auto_183911 ) ) ( not ( = ?auto_183907 ?auto_183908 ) ) ( not ( = ?auto_183907 ?auto_183909 ) ) ( not ( = ?auto_183907 ?auto_183910 ) ) ( not ( = ?auto_183907 ?auto_183911 ) ) ( not ( = ?auto_183908 ?auto_183909 ) ) ( not ( = ?auto_183908 ?auto_183910 ) ) ( not ( = ?auto_183908 ?auto_183911 ) ) ( not ( = ?auto_183909 ?auto_183910 ) ) ( not ( = ?auto_183909 ?auto_183911 ) ) ( not ( = ?auto_183910 ?auto_183911 ) ) ( ON ?auto_183911 ?auto_183912 ) ( not ( = ?auto_183905 ?auto_183912 ) ) ( not ( = ?auto_183906 ?auto_183912 ) ) ( not ( = ?auto_183907 ?auto_183912 ) ) ( not ( = ?auto_183908 ?auto_183912 ) ) ( not ( = ?auto_183909 ?auto_183912 ) ) ( not ( = ?auto_183910 ?auto_183912 ) ) ( not ( = ?auto_183911 ?auto_183912 ) ) ( ON ?auto_183910 ?auto_183911 ) ( ON-TABLE ?auto_183912 ) ( CLEAR ?auto_183908 ) ( ON ?auto_183909 ?auto_183910 ) ( CLEAR ?auto_183909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183912 ?auto_183911 ?auto_183910 )
      ( MAKE-7PILE ?auto_183905 ?auto_183906 ?auto_183907 ?auto_183908 ?auto_183909 ?auto_183910 ?auto_183911 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183913 - BLOCK
      ?auto_183914 - BLOCK
      ?auto_183915 - BLOCK
      ?auto_183916 - BLOCK
      ?auto_183917 - BLOCK
      ?auto_183918 - BLOCK
      ?auto_183919 - BLOCK
    )
    :vars
    (
      ?auto_183920 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183913 ) ( ON ?auto_183914 ?auto_183913 ) ( ON ?auto_183915 ?auto_183914 ) ( not ( = ?auto_183913 ?auto_183914 ) ) ( not ( = ?auto_183913 ?auto_183915 ) ) ( not ( = ?auto_183913 ?auto_183916 ) ) ( not ( = ?auto_183913 ?auto_183917 ) ) ( not ( = ?auto_183913 ?auto_183918 ) ) ( not ( = ?auto_183913 ?auto_183919 ) ) ( not ( = ?auto_183914 ?auto_183915 ) ) ( not ( = ?auto_183914 ?auto_183916 ) ) ( not ( = ?auto_183914 ?auto_183917 ) ) ( not ( = ?auto_183914 ?auto_183918 ) ) ( not ( = ?auto_183914 ?auto_183919 ) ) ( not ( = ?auto_183915 ?auto_183916 ) ) ( not ( = ?auto_183915 ?auto_183917 ) ) ( not ( = ?auto_183915 ?auto_183918 ) ) ( not ( = ?auto_183915 ?auto_183919 ) ) ( not ( = ?auto_183916 ?auto_183917 ) ) ( not ( = ?auto_183916 ?auto_183918 ) ) ( not ( = ?auto_183916 ?auto_183919 ) ) ( not ( = ?auto_183917 ?auto_183918 ) ) ( not ( = ?auto_183917 ?auto_183919 ) ) ( not ( = ?auto_183918 ?auto_183919 ) ) ( ON ?auto_183919 ?auto_183920 ) ( not ( = ?auto_183913 ?auto_183920 ) ) ( not ( = ?auto_183914 ?auto_183920 ) ) ( not ( = ?auto_183915 ?auto_183920 ) ) ( not ( = ?auto_183916 ?auto_183920 ) ) ( not ( = ?auto_183917 ?auto_183920 ) ) ( not ( = ?auto_183918 ?auto_183920 ) ) ( not ( = ?auto_183919 ?auto_183920 ) ) ( ON ?auto_183918 ?auto_183919 ) ( ON-TABLE ?auto_183920 ) ( ON ?auto_183917 ?auto_183918 ) ( CLEAR ?auto_183917 ) ( HOLDING ?auto_183916 ) ( CLEAR ?auto_183915 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183913 ?auto_183914 ?auto_183915 ?auto_183916 )
      ( MAKE-7PILE ?auto_183913 ?auto_183914 ?auto_183915 ?auto_183916 ?auto_183917 ?auto_183918 ?auto_183919 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183921 - BLOCK
      ?auto_183922 - BLOCK
      ?auto_183923 - BLOCK
      ?auto_183924 - BLOCK
      ?auto_183925 - BLOCK
      ?auto_183926 - BLOCK
      ?auto_183927 - BLOCK
    )
    :vars
    (
      ?auto_183928 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183921 ) ( ON ?auto_183922 ?auto_183921 ) ( ON ?auto_183923 ?auto_183922 ) ( not ( = ?auto_183921 ?auto_183922 ) ) ( not ( = ?auto_183921 ?auto_183923 ) ) ( not ( = ?auto_183921 ?auto_183924 ) ) ( not ( = ?auto_183921 ?auto_183925 ) ) ( not ( = ?auto_183921 ?auto_183926 ) ) ( not ( = ?auto_183921 ?auto_183927 ) ) ( not ( = ?auto_183922 ?auto_183923 ) ) ( not ( = ?auto_183922 ?auto_183924 ) ) ( not ( = ?auto_183922 ?auto_183925 ) ) ( not ( = ?auto_183922 ?auto_183926 ) ) ( not ( = ?auto_183922 ?auto_183927 ) ) ( not ( = ?auto_183923 ?auto_183924 ) ) ( not ( = ?auto_183923 ?auto_183925 ) ) ( not ( = ?auto_183923 ?auto_183926 ) ) ( not ( = ?auto_183923 ?auto_183927 ) ) ( not ( = ?auto_183924 ?auto_183925 ) ) ( not ( = ?auto_183924 ?auto_183926 ) ) ( not ( = ?auto_183924 ?auto_183927 ) ) ( not ( = ?auto_183925 ?auto_183926 ) ) ( not ( = ?auto_183925 ?auto_183927 ) ) ( not ( = ?auto_183926 ?auto_183927 ) ) ( ON ?auto_183927 ?auto_183928 ) ( not ( = ?auto_183921 ?auto_183928 ) ) ( not ( = ?auto_183922 ?auto_183928 ) ) ( not ( = ?auto_183923 ?auto_183928 ) ) ( not ( = ?auto_183924 ?auto_183928 ) ) ( not ( = ?auto_183925 ?auto_183928 ) ) ( not ( = ?auto_183926 ?auto_183928 ) ) ( not ( = ?auto_183927 ?auto_183928 ) ) ( ON ?auto_183926 ?auto_183927 ) ( ON-TABLE ?auto_183928 ) ( ON ?auto_183925 ?auto_183926 ) ( CLEAR ?auto_183923 ) ( ON ?auto_183924 ?auto_183925 ) ( CLEAR ?auto_183924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183928 ?auto_183927 ?auto_183926 ?auto_183925 )
      ( MAKE-7PILE ?auto_183921 ?auto_183922 ?auto_183923 ?auto_183924 ?auto_183925 ?auto_183926 ?auto_183927 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183929 - BLOCK
      ?auto_183930 - BLOCK
      ?auto_183931 - BLOCK
      ?auto_183932 - BLOCK
      ?auto_183933 - BLOCK
      ?auto_183934 - BLOCK
      ?auto_183935 - BLOCK
    )
    :vars
    (
      ?auto_183936 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183929 ) ( ON ?auto_183930 ?auto_183929 ) ( not ( = ?auto_183929 ?auto_183930 ) ) ( not ( = ?auto_183929 ?auto_183931 ) ) ( not ( = ?auto_183929 ?auto_183932 ) ) ( not ( = ?auto_183929 ?auto_183933 ) ) ( not ( = ?auto_183929 ?auto_183934 ) ) ( not ( = ?auto_183929 ?auto_183935 ) ) ( not ( = ?auto_183930 ?auto_183931 ) ) ( not ( = ?auto_183930 ?auto_183932 ) ) ( not ( = ?auto_183930 ?auto_183933 ) ) ( not ( = ?auto_183930 ?auto_183934 ) ) ( not ( = ?auto_183930 ?auto_183935 ) ) ( not ( = ?auto_183931 ?auto_183932 ) ) ( not ( = ?auto_183931 ?auto_183933 ) ) ( not ( = ?auto_183931 ?auto_183934 ) ) ( not ( = ?auto_183931 ?auto_183935 ) ) ( not ( = ?auto_183932 ?auto_183933 ) ) ( not ( = ?auto_183932 ?auto_183934 ) ) ( not ( = ?auto_183932 ?auto_183935 ) ) ( not ( = ?auto_183933 ?auto_183934 ) ) ( not ( = ?auto_183933 ?auto_183935 ) ) ( not ( = ?auto_183934 ?auto_183935 ) ) ( ON ?auto_183935 ?auto_183936 ) ( not ( = ?auto_183929 ?auto_183936 ) ) ( not ( = ?auto_183930 ?auto_183936 ) ) ( not ( = ?auto_183931 ?auto_183936 ) ) ( not ( = ?auto_183932 ?auto_183936 ) ) ( not ( = ?auto_183933 ?auto_183936 ) ) ( not ( = ?auto_183934 ?auto_183936 ) ) ( not ( = ?auto_183935 ?auto_183936 ) ) ( ON ?auto_183934 ?auto_183935 ) ( ON-TABLE ?auto_183936 ) ( ON ?auto_183933 ?auto_183934 ) ( ON ?auto_183932 ?auto_183933 ) ( CLEAR ?auto_183932 ) ( HOLDING ?auto_183931 ) ( CLEAR ?auto_183930 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183929 ?auto_183930 ?auto_183931 )
      ( MAKE-7PILE ?auto_183929 ?auto_183930 ?auto_183931 ?auto_183932 ?auto_183933 ?auto_183934 ?auto_183935 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183937 - BLOCK
      ?auto_183938 - BLOCK
      ?auto_183939 - BLOCK
      ?auto_183940 - BLOCK
      ?auto_183941 - BLOCK
      ?auto_183942 - BLOCK
      ?auto_183943 - BLOCK
    )
    :vars
    (
      ?auto_183944 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183937 ) ( ON ?auto_183938 ?auto_183937 ) ( not ( = ?auto_183937 ?auto_183938 ) ) ( not ( = ?auto_183937 ?auto_183939 ) ) ( not ( = ?auto_183937 ?auto_183940 ) ) ( not ( = ?auto_183937 ?auto_183941 ) ) ( not ( = ?auto_183937 ?auto_183942 ) ) ( not ( = ?auto_183937 ?auto_183943 ) ) ( not ( = ?auto_183938 ?auto_183939 ) ) ( not ( = ?auto_183938 ?auto_183940 ) ) ( not ( = ?auto_183938 ?auto_183941 ) ) ( not ( = ?auto_183938 ?auto_183942 ) ) ( not ( = ?auto_183938 ?auto_183943 ) ) ( not ( = ?auto_183939 ?auto_183940 ) ) ( not ( = ?auto_183939 ?auto_183941 ) ) ( not ( = ?auto_183939 ?auto_183942 ) ) ( not ( = ?auto_183939 ?auto_183943 ) ) ( not ( = ?auto_183940 ?auto_183941 ) ) ( not ( = ?auto_183940 ?auto_183942 ) ) ( not ( = ?auto_183940 ?auto_183943 ) ) ( not ( = ?auto_183941 ?auto_183942 ) ) ( not ( = ?auto_183941 ?auto_183943 ) ) ( not ( = ?auto_183942 ?auto_183943 ) ) ( ON ?auto_183943 ?auto_183944 ) ( not ( = ?auto_183937 ?auto_183944 ) ) ( not ( = ?auto_183938 ?auto_183944 ) ) ( not ( = ?auto_183939 ?auto_183944 ) ) ( not ( = ?auto_183940 ?auto_183944 ) ) ( not ( = ?auto_183941 ?auto_183944 ) ) ( not ( = ?auto_183942 ?auto_183944 ) ) ( not ( = ?auto_183943 ?auto_183944 ) ) ( ON ?auto_183942 ?auto_183943 ) ( ON-TABLE ?auto_183944 ) ( ON ?auto_183941 ?auto_183942 ) ( ON ?auto_183940 ?auto_183941 ) ( CLEAR ?auto_183938 ) ( ON ?auto_183939 ?auto_183940 ) ( CLEAR ?auto_183939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183944 ?auto_183943 ?auto_183942 ?auto_183941 ?auto_183940 )
      ( MAKE-7PILE ?auto_183937 ?auto_183938 ?auto_183939 ?auto_183940 ?auto_183941 ?auto_183942 ?auto_183943 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183945 - BLOCK
      ?auto_183946 - BLOCK
      ?auto_183947 - BLOCK
      ?auto_183948 - BLOCK
      ?auto_183949 - BLOCK
      ?auto_183950 - BLOCK
      ?auto_183951 - BLOCK
    )
    :vars
    (
      ?auto_183952 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183945 ) ( not ( = ?auto_183945 ?auto_183946 ) ) ( not ( = ?auto_183945 ?auto_183947 ) ) ( not ( = ?auto_183945 ?auto_183948 ) ) ( not ( = ?auto_183945 ?auto_183949 ) ) ( not ( = ?auto_183945 ?auto_183950 ) ) ( not ( = ?auto_183945 ?auto_183951 ) ) ( not ( = ?auto_183946 ?auto_183947 ) ) ( not ( = ?auto_183946 ?auto_183948 ) ) ( not ( = ?auto_183946 ?auto_183949 ) ) ( not ( = ?auto_183946 ?auto_183950 ) ) ( not ( = ?auto_183946 ?auto_183951 ) ) ( not ( = ?auto_183947 ?auto_183948 ) ) ( not ( = ?auto_183947 ?auto_183949 ) ) ( not ( = ?auto_183947 ?auto_183950 ) ) ( not ( = ?auto_183947 ?auto_183951 ) ) ( not ( = ?auto_183948 ?auto_183949 ) ) ( not ( = ?auto_183948 ?auto_183950 ) ) ( not ( = ?auto_183948 ?auto_183951 ) ) ( not ( = ?auto_183949 ?auto_183950 ) ) ( not ( = ?auto_183949 ?auto_183951 ) ) ( not ( = ?auto_183950 ?auto_183951 ) ) ( ON ?auto_183951 ?auto_183952 ) ( not ( = ?auto_183945 ?auto_183952 ) ) ( not ( = ?auto_183946 ?auto_183952 ) ) ( not ( = ?auto_183947 ?auto_183952 ) ) ( not ( = ?auto_183948 ?auto_183952 ) ) ( not ( = ?auto_183949 ?auto_183952 ) ) ( not ( = ?auto_183950 ?auto_183952 ) ) ( not ( = ?auto_183951 ?auto_183952 ) ) ( ON ?auto_183950 ?auto_183951 ) ( ON-TABLE ?auto_183952 ) ( ON ?auto_183949 ?auto_183950 ) ( ON ?auto_183948 ?auto_183949 ) ( ON ?auto_183947 ?auto_183948 ) ( CLEAR ?auto_183947 ) ( HOLDING ?auto_183946 ) ( CLEAR ?auto_183945 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183945 ?auto_183946 )
      ( MAKE-7PILE ?auto_183945 ?auto_183946 ?auto_183947 ?auto_183948 ?auto_183949 ?auto_183950 ?auto_183951 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183953 - BLOCK
      ?auto_183954 - BLOCK
      ?auto_183955 - BLOCK
      ?auto_183956 - BLOCK
      ?auto_183957 - BLOCK
      ?auto_183958 - BLOCK
      ?auto_183959 - BLOCK
    )
    :vars
    (
      ?auto_183960 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183953 ) ( not ( = ?auto_183953 ?auto_183954 ) ) ( not ( = ?auto_183953 ?auto_183955 ) ) ( not ( = ?auto_183953 ?auto_183956 ) ) ( not ( = ?auto_183953 ?auto_183957 ) ) ( not ( = ?auto_183953 ?auto_183958 ) ) ( not ( = ?auto_183953 ?auto_183959 ) ) ( not ( = ?auto_183954 ?auto_183955 ) ) ( not ( = ?auto_183954 ?auto_183956 ) ) ( not ( = ?auto_183954 ?auto_183957 ) ) ( not ( = ?auto_183954 ?auto_183958 ) ) ( not ( = ?auto_183954 ?auto_183959 ) ) ( not ( = ?auto_183955 ?auto_183956 ) ) ( not ( = ?auto_183955 ?auto_183957 ) ) ( not ( = ?auto_183955 ?auto_183958 ) ) ( not ( = ?auto_183955 ?auto_183959 ) ) ( not ( = ?auto_183956 ?auto_183957 ) ) ( not ( = ?auto_183956 ?auto_183958 ) ) ( not ( = ?auto_183956 ?auto_183959 ) ) ( not ( = ?auto_183957 ?auto_183958 ) ) ( not ( = ?auto_183957 ?auto_183959 ) ) ( not ( = ?auto_183958 ?auto_183959 ) ) ( ON ?auto_183959 ?auto_183960 ) ( not ( = ?auto_183953 ?auto_183960 ) ) ( not ( = ?auto_183954 ?auto_183960 ) ) ( not ( = ?auto_183955 ?auto_183960 ) ) ( not ( = ?auto_183956 ?auto_183960 ) ) ( not ( = ?auto_183957 ?auto_183960 ) ) ( not ( = ?auto_183958 ?auto_183960 ) ) ( not ( = ?auto_183959 ?auto_183960 ) ) ( ON ?auto_183958 ?auto_183959 ) ( ON-TABLE ?auto_183960 ) ( ON ?auto_183957 ?auto_183958 ) ( ON ?auto_183956 ?auto_183957 ) ( ON ?auto_183955 ?auto_183956 ) ( CLEAR ?auto_183953 ) ( ON ?auto_183954 ?auto_183955 ) ( CLEAR ?auto_183954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183960 ?auto_183959 ?auto_183958 ?auto_183957 ?auto_183956 ?auto_183955 )
      ( MAKE-7PILE ?auto_183953 ?auto_183954 ?auto_183955 ?auto_183956 ?auto_183957 ?auto_183958 ?auto_183959 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183961 - BLOCK
      ?auto_183962 - BLOCK
      ?auto_183963 - BLOCK
      ?auto_183964 - BLOCK
      ?auto_183965 - BLOCK
      ?auto_183966 - BLOCK
      ?auto_183967 - BLOCK
    )
    :vars
    (
      ?auto_183968 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183961 ?auto_183962 ) ) ( not ( = ?auto_183961 ?auto_183963 ) ) ( not ( = ?auto_183961 ?auto_183964 ) ) ( not ( = ?auto_183961 ?auto_183965 ) ) ( not ( = ?auto_183961 ?auto_183966 ) ) ( not ( = ?auto_183961 ?auto_183967 ) ) ( not ( = ?auto_183962 ?auto_183963 ) ) ( not ( = ?auto_183962 ?auto_183964 ) ) ( not ( = ?auto_183962 ?auto_183965 ) ) ( not ( = ?auto_183962 ?auto_183966 ) ) ( not ( = ?auto_183962 ?auto_183967 ) ) ( not ( = ?auto_183963 ?auto_183964 ) ) ( not ( = ?auto_183963 ?auto_183965 ) ) ( not ( = ?auto_183963 ?auto_183966 ) ) ( not ( = ?auto_183963 ?auto_183967 ) ) ( not ( = ?auto_183964 ?auto_183965 ) ) ( not ( = ?auto_183964 ?auto_183966 ) ) ( not ( = ?auto_183964 ?auto_183967 ) ) ( not ( = ?auto_183965 ?auto_183966 ) ) ( not ( = ?auto_183965 ?auto_183967 ) ) ( not ( = ?auto_183966 ?auto_183967 ) ) ( ON ?auto_183967 ?auto_183968 ) ( not ( = ?auto_183961 ?auto_183968 ) ) ( not ( = ?auto_183962 ?auto_183968 ) ) ( not ( = ?auto_183963 ?auto_183968 ) ) ( not ( = ?auto_183964 ?auto_183968 ) ) ( not ( = ?auto_183965 ?auto_183968 ) ) ( not ( = ?auto_183966 ?auto_183968 ) ) ( not ( = ?auto_183967 ?auto_183968 ) ) ( ON ?auto_183966 ?auto_183967 ) ( ON-TABLE ?auto_183968 ) ( ON ?auto_183965 ?auto_183966 ) ( ON ?auto_183964 ?auto_183965 ) ( ON ?auto_183963 ?auto_183964 ) ( ON ?auto_183962 ?auto_183963 ) ( CLEAR ?auto_183962 ) ( HOLDING ?auto_183961 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183961 )
      ( MAKE-7PILE ?auto_183961 ?auto_183962 ?auto_183963 ?auto_183964 ?auto_183965 ?auto_183966 ?auto_183967 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183969 - BLOCK
      ?auto_183970 - BLOCK
      ?auto_183971 - BLOCK
      ?auto_183972 - BLOCK
      ?auto_183973 - BLOCK
      ?auto_183974 - BLOCK
      ?auto_183975 - BLOCK
    )
    :vars
    (
      ?auto_183976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183969 ?auto_183970 ) ) ( not ( = ?auto_183969 ?auto_183971 ) ) ( not ( = ?auto_183969 ?auto_183972 ) ) ( not ( = ?auto_183969 ?auto_183973 ) ) ( not ( = ?auto_183969 ?auto_183974 ) ) ( not ( = ?auto_183969 ?auto_183975 ) ) ( not ( = ?auto_183970 ?auto_183971 ) ) ( not ( = ?auto_183970 ?auto_183972 ) ) ( not ( = ?auto_183970 ?auto_183973 ) ) ( not ( = ?auto_183970 ?auto_183974 ) ) ( not ( = ?auto_183970 ?auto_183975 ) ) ( not ( = ?auto_183971 ?auto_183972 ) ) ( not ( = ?auto_183971 ?auto_183973 ) ) ( not ( = ?auto_183971 ?auto_183974 ) ) ( not ( = ?auto_183971 ?auto_183975 ) ) ( not ( = ?auto_183972 ?auto_183973 ) ) ( not ( = ?auto_183972 ?auto_183974 ) ) ( not ( = ?auto_183972 ?auto_183975 ) ) ( not ( = ?auto_183973 ?auto_183974 ) ) ( not ( = ?auto_183973 ?auto_183975 ) ) ( not ( = ?auto_183974 ?auto_183975 ) ) ( ON ?auto_183975 ?auto_183976 ) ( not ( = ?auto_183969 ?auto_183976 ) ) ( not ( = ?auto_183970 ?auto_183976 ) ) ( not ( = ?auto_183971 ?auto_183976 ) ) ( not ( = ?auto_183972 ?auto_183976 ) ) ( not ( = ?auto_183973 ?auto_183976 ) ) ( not ( = ?auto_183974 ?auto_183976 ) ) ( not ( = ?auto_183975 ?auto_183976 ) ) ( ON ?auto_183974 ?auto_183975 ) ( ON-TABLE ?auto_183976 ) ( ON ?auto_183973 ?auto_183974 ) ( ON ?auto_183972 ?auto_183973 ) ( ON ?auto_183971 ?auto_183972 ) ( ON ?auto_183970 ?auto_183971 ) ( ON ?auto_183969 ?auto_183970 ) ( CLEAR ?auto_183969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183976 ?auto_183975 ?auto_183974 ?auto_183973 ?auto_183972 ?auto_183971 ?auto_183970 )
      ( MAKE-7PILE ?auto_183969 ?auto_183970 ?auto_183971 ?auto_183972 ?auto_183973 ?auto_183974 ?auto_183975 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183984 - BLOCK
      ?auto_183985 - BLOCK
      ?auto_183986 - BLOCK
      ?auto_183987 - BLOCK
      ?auto_183988 - BLOCK
      ?auto_183989 - BLOCK
      ?auto_183990 - BLOCK
    )
    :vars
    (
      ?auto_183991 - BLOCK
      ?auto_183992 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183984 ?auto_183985 ) ) ( not ( = ?auto_183984 ?auto_183986 ) ) ( not ( = ?auto_183984 ?auto_183987 ) ) ( not ( = ?auto_183984 ?auto_183988 ) ) ( not ( = ?auto_183984 ?auto_183989 ) ) ( not ( = ?auto_183984 ?auto_183990 ) ) ( not ( = ?auto_183985 ?auto_183986 ) ) ( not ( = ?auto_183985 ?auto_183987 ) ) ( not ( = ?auto_183985 ?auto_183988 ) ) ( not ( = ?auto_183985 ?auto_183989 ) ) ( not ( = ?auto_183985 ?auto_183990 ) ) ( not ( = ?auto_183986 ?auto_183987 ) ) ( not ( = ?auto_183986 ?auto_183988 ) ) ( not ( = ?auto_183986 ?auto_183989 ) ) ( not ( = ?auto_183986 ?auto_183990 ) ) ( not ( = ?auto_183987 ?auto_183988 ) ) ( not ( = ?auto_183987 ?auto_183989 ) ) ( not ( = ?auto_183987 ?auto_183990 ) ) ( not ( = ?auto_183988 ?auto_183989 ) ) ( not ( = ?auto_183988 ?auto_183990 ) ) ( not ( = ?auto_183989 ?auto_183990 ) ) ( ON ?auto_183990 ?auto_183991 ) ( not ( = ?auto_183984 ?auto_183991 ) ) ( not ( = ?auto_183985 ?auto_183991 ) ) ( not ( = ?auto_183986 ?auto_183991 ) ) ( not ( = ?auto_183987 ?auto_183991 ) ) ( not ( = ?auto_183988 ?auto_183991 ) ) ( not ( = ?auto_183989 ?auto_183991 ) ) ( not ( = ?auto_183990 ?auto_183991 ) ) ( ON ?auto_183989 ?auto_183990 ) ( ON-TABLE ?auto_183991 ) ( ON ?auto_183988 ?auto_183989 ) ( ON ?auto_183987 ?auto_183988 ) ( ON ?auto_183986 ?auto_183987 ) ( ON ?auto_183985 ?auto_183986 ) ( CLEAR ?auto_183985 ) ( ON ?auto_183984 ?auto_183992 ) ( CLEAR ?auto_183984 ) ( HAND-EMPTY ) ( not ( = ?auto_183984 ?auto_183992 ) ) ( not ( = ?auto_183985 ?auto_183992 ) ) ( not ( = ?auto_183986 ?auto_183992 ) ) ( not ( = ?auto_183987 ?auto_183992 ) ) ( not ( = ?auto_183988 ?auto_183992 ) ) ( not ( = ?auto_183989 ?auto_183992 ) ) ( not ( = ?auto_183990 ?auto_183992 ) ) ( not ( = ?auto_183991 ?auto_183992 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183984 ?auto_183992 )
      ( MAKE-7PILE ?auto_183984 ?auto_183985 ?auto_183986 ?auto_183987 ?auto_183988 ?auto_183989 ?auto_183990 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183993 - BLOCK
      ?auto_183994 - BLOCK
      ?auto_183995 - BLOCK
      ?auto_183996 - BLOCK
      ?auto_183997 - BLOCK
      ?auto_183998 - BLOCK
      ?auto_183999 - BLOCK
    )
    :vars
    (
      ?auto_184000 - BLOCK
      ?auto_184001 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183993 ?auto_183994 ) ) ( not ( = ?auto_183993 ?auto_183995 ) ) ( not ( = ?auto_183993 ?auto_183996 ) ) ( not ( = ?auto_183993 ?auto_183997 ) ) ( not ( = ?auto_183993 ?auto_183998 ) ) ( not ( = ?auto_183993 ?auto_183999 ) ) ( not ( = ?auto_183994 ?auto_183995 ) ) ( not ( = ?auto_183994 ?auto_183996 ) ) ( not ( = ?auto_183994 ?auto_183997 ) ) ( not ( = ?auto_183994 ?auto_183998 ) ) ( not ( = ?auto_183994 ?auto_183999 ) ) ( not ( = ?auto_183995 ?auto_183996 ) ) ( not ( = ?auto_183995 ?auto_183997 ) ) ( not ( = ?auto_183995 ?auto_183998 ) ) ( not ( = ?auto_183995 ?auto_183999 ) ) ( not ( = ?auto_183996 ?auto_183997 ) ) ( not ( = ?auto_183996 ?auto_183998 ) ) ( not ( = ?auto_183996 ?auto_183999 ) ) ( not ( = ?auto_183997 ?auto_183998 ) ) ( not ( = ?auto_183997 ?auto_183999 ) ) ( not ( = ?auto_183998 ?auto_183999 ) ) ( ON ?auto_183999 ?auto_184000 ) ( not ( = ?auto_183993 ?auto_184000 ) ) ( not ( = ?auto_183994 ?auto_184000 ) ) ( not ( = ?auto_183995 ?auto_184000 ) ) ( not ( = ?auto_183996 ?auto_184000 ) ) ( not ( = ?auto_183997 ?auto_184000 ) ) ( not ( = ?auto_183998 ?auto_184000 ) ) ( not ( = ?auto_183999 ?auto_184000 ) ) ( ON ?auto_183998 ?auto_183999 ) ( ON-TABLE ?auto_184000 ) ( ON ?auto_183997 ?auto_183998 ) ( ON ?auto_183996 ?auto_183997 ) ( ON ?auto_183995 ?auto_183996 ) ( ON ?auto_183993 ?auto_184001 ) ( CLEAR ?auto_183993 ) ( not ( = ?auto_183993 ?auto_184001 ) ) ( not ( = ?auto_183994 ?auto_184001 ) ) ( not ( = ?auto_183995 ?auto_184001 ) ) ( not ( = ?auto_183996 ?auto_184001 ) ) ( not ( = ?auto_183997 ?auto_184001 ) ) ( not ( = ?auto_183998 ?auto_184001 ) ) ( not ( = ?auto_183999 ?auto_184001 ) ) ( not ( = ?auto_184000 ?auto_184001 ) ) ( HOLDING ?auto_183994 ) ( CLEAR ?auto_183995 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_184000 ?auto_183999 ?auto_183998 ?auto_183997 ?auto_183996 ?auto_183995 ?auto_183994 )
      ( MAKE-7PILE ?auto_183993 ?auto_183994 ?auto_183995 ?auto_183996 ?auto_183997 ?auto_183998 ?auto_183999 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184002 - BLOCK
      ?auto_184003 - BLOCK
      ?auto_184004 - BLOCK
      ?auto_184005 - BLOCK
      ?auto_184006 - BLOCK
      ?auto_184007 - BLOCK
      ?auto_184008 - BLOCK
    )
    :vars
    (
      ?auto_184009 - BLOCK
      ?auto_184010 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184002 ?auto_184003 ) ) ( not ( = ?auto_184002 ?auto_184004 ) ) ( not ( = ?auto_184002 ?auto_184005 ) ) ( not ( = ?auto_184002 ?auto_184006 ) ) ( not ( = ?auto_184002 ?auto_184007 ) ) ( not ( = ?auto_184002 ?auto_184008 ) ) ( not ( = ?auto_184003 ?auto_184004 ) ) ( not ( = ?auto_184003 ?auto_184005 ) ) ( not ( = ?auto_184003 ?auto_184006 ) ) ( not ( = ?auto_184003 ?auto_184007 ) ) ( not ( = ?auto_184003 ?auto_184008 ) ) ( not ( = ?auto_184004 ?auto_184005 ) ) ( not ( = ?auto_184004 ?auto_184006 ) ) ( not ( = ?auto_184004 ?auto_184007 ) ) ( not ( = ?auto_184004 ?auto_184008 ) ) ( not ( = ?auto_184005 ?auto_184006 ) ) ( not ( = ?auto_184005 ?auto_184007 ) ) ( not ( = ?auto_184005 ?auto_184008 ) ) ( not ( = ?auto_184006 ?auto_184007 ) ) ( not ( = ?auto_184006 ?auto_184008 ) ) ( not ( = ?auto_184007 ?auto_184008 ) ) ( ON ?auto_184008 ?auto_184009 ) ( not ( = ?auto_184002 ?auto_184009 ) ) ( not ( = ?auto_184003 ?auto_184009 ) ) ( not ( = ?auto_184004 ?auto_184009 ) ) ( not ( = ?auto_184005 ?auto_184009 ) ) ( not ( = ?auto_184006 ?auto_184009 ) ) ( not ( = ?auto_184007 ?auto_184009 ) ) ( not ( = ?auto_184008 ?auto_184009 ) ) ( ON ?auto_184007 ?auto_184008 ) ( ON-TABLE ?auto_184009 ) ( ON ?auto_184006 ?auto_184007 ) ( ON ?auto_184005 ?auto_184006 ) ( ON ?auto_184004 ?auto_184005 ) ( ON ?auto_184002 ?auto_184010 ) ( not ( = ?auto_184002 ?auto_184010 ) ) ( not ( = ?auto_184003 ?auto_184010 ) ) ( not ( = ?auto_184004 ?auto_184010 ) ) ( not ( = ?auto_184005 ?auto_184010 ) ) ( not ( = ?auto_184006 ?auto_184010 ) ) ( not ( = ?auto_184007 ?auto_184010 ) ) ( not ( = ?auto_184008 ?auto_184010 ) ) ( not ( = ?auto_184009 ?auto_184010 ) ) ( CLEAR ?auto_184004 ) ( ON ?auto_184003 ?auto_184002 ) ( CLEAR ?auto_184003 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_184010 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184010 ?auto_184002 )
      ( MAKE-7PILE ?auto_184002 ?auto_184003 ?auto_184004 ?auto_184005 ?auto_184006 ?auto_184007 ?auto_184008 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184011 - BLOCK
      ?auto_184012 - BLOCK
      ?auto_184013 - BLOCK
      ?auto_184014 - BLOCK
      ?auto_184015 - BLOCK
      ?auto_184016 - BLOCK
      ?auto_184017 - BLOCK
    )
    :vars
    (
      ?auto_184018 - BLOCK
      ?auto_184019 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184011 ?auto_184012 ) ) ( not ( = ?auto_184011 ?auto_184013 ) ) ( not ( = ?auto_184011 ?auto_184014 ) ) ( not ( = ?auto_184011 ?auto_184015 ) ) ( not ( = ?auto_184011 ?auto_184016 ) ) ( not ( = ?auto_184011 ?auto_184017 ) ) ( not ( = ?auto_184012 ?auto_184013 ) ) ( not ( = ?auto_184012 ?auto_184014 ) ) ( not ( = ?auto_184012 ?auto_184015 ) ) ( not ( = ?auto_184012 ?auto_184016 ) ) ( not ( = ?auto_184012 ?auto_184017 ) ) ( not ( = ?auto_184013 ?auto_184014 ) ) ( not ( = ?auto_184013 ?auto_184015 ) ) ( not ( = ?auto_184013 ?auto_184016 ) ) ( not ( = ?auto_184013 ?auto_184017 ) ) ( not ( = ?auto_184014 ?auto_184015 ) ) ( not ( = ?auto_184014 ?auto_184016 ) ) ( not ( = ?auto_184014 ?auto_184017 ) ) ( not ( = ?auto_184015 ?auto_184016 ) ) ( not ( = ?auto_184015 ?auto_184017 ) ) ( not ( = ?auto_184016 ?auto_184017 ) ) ( ON ?auto_184017 ?auto_184018 ) ( not ( = ?auto_184011 ?auto_184018 ) ) ( not ( = ?auto_184012 ?auto_184018 ) ) ( not ( = ?auto_184013 ?auto_184018 ) ) ( not ( = ?auto_184014 ?auto_184018 ) ) ( not ( = ?auto_184015 ?auto_184018 ) ) ( not ( = ?auto_184016 ?auto_184018 ) ) ( not ( = ?auto_184017 ?auto_184018 ) ) ( ON ?auto_184016 ?auto_184017 ) ( ON-TABLE ?auto_184018 ) ( ON ?auto_184015 ?auto_184016 ) ( ON ?auto_184014 ?auto_184015 ) ( ON ?auto_184011 ?auto_184019 ) ( not ( = ?auto_184011 ?auto_184019 ) ) ( not ( = ?auto_184012 ?auto_184019 ) ) ( not ( = ?auto_184013 ?auto_184019 ) ) ( not ( = ?auto_184014 ?auto_184019 ) ) ( not ( = ?auto_184015 ?auto_184019 ) ) ( not ( = ?auto_184016 ?auto_184019 ) ) ( not ( = ?auto_184017 ?auto_184019 ) ) ( not ( = ?auto_184018 ?auto_184019 ) ) ( ON ?auto_184012 ?auto_184011 ) ( CLEAR ?auto_184012 ) ( ON-TABLE ?auto_184019 ) ( HOLDING ?auto_184013 ) ( CLEAR ?auto_184014 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184018 ?auto_184017 ?auto_184016 ?auto_184015 ?auto_184014 ?auto_184013 )
      ( MAKE-7PILE ?auto_184011 ?auto_184012 ?auto_184013 ?auto_184014 ?auto_184015 ?auto_184016 ?auto_184017 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184020 - BLOCK
      ?auto_184021 - BLOCK
      ?auto_184022 - BLOCK
      ?auto_184023 - BLOCK
      ?auto_184024 - BLOCK
      ?auto_184025 - BLOCK
      ?auto_184026 - BLOCK
    )
    :vars
    (
      ?auto_184027 - BLOCK
      ?auto_184028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184020 ?auto_184021 ) ) ( not ( = ?auto_184020 ?auto_184022 ) ) ( not ( = ?auto_184020 ?auto_184023 ) ) ( not ( = ?auto_184020 ?auto_184024 ) ) ( not ( = ?auto_184020 ?auto_184025 ) ) ( not ( = ?auto_184020 ?auto_184026 ) ) ( not ( = ?auto_184021 ?auto_184022 ) ) ( not ( = ?auto_184021 ?auto_184023 ) ) ( not ( = ?auto_184021 ?auto_184024 ) ) ( not ( = ?auto_184021 ?auto_184025 ) ) ( not ( = ?auto_184021 ?auto_184026 ) ) ( not ( = ?auto_184022 ?auto_184023 ) ) ( not ( = ?auto_184022 ?auto_184024 ) ) ( not ( = ?auto_184022 ?auto_184025 ) ) ( not ( = ?auto_184022 ?auto_184026 ) ) ( not ( = ?auto_184023 ?auto_184024 ) ) ( not ( = ?auto_184023 ?auto_184025 ) ) ( not ( = ?auto_184023 ?auto_184026 ) ) ( not ( = ?auto_184024 ?auto_184025 ) ) ( not ( = ?auto_184024 ?auto_184026 ) ) ( not ( = ?auto_184025 ?auto_184026 ) ) ( ON ?auto_184026 ?auto_184027 ) ( not ( = ?auto_184020 ?auto_184027 ) ) ( not ( = ?auto_184021 ?auto_184027 ) ) ( not ( = ?auto_184022 ?auto_184027 ) ) ( not ( = ?auto_184023 ?auto_184027 ) ) ( not ( = ?auto_184024 ?auto_184027 ) ) ( not ( = ?auto_184025 ?auto_184027 ) ) ( not ( = ?auto_184026 ?auto_184027 ) ) ( ON ?auto_184025 ?auto_184026 ) ( ON-TABLE ?auto_184027 ) ( ON ?auto_184024 ?auto_184025 ) ( ON ?auto_184023 ?auto_184024 ) ( ON ?auto_184020 ?auto_184028 ) ( not ( = ?auto_184020 ?auto_184028 ) ) ( not ( = ?auto_184021 ?auto_184028 ) ) ( not ( = ?auto_184022 ?auto_184028 ) ) ( not ( = ?auto_184023 ?auto_184028 ) ) ( not ( = ?auto_184024 ?auto_184028 ) ) ( not ( = ?auto_184025 ?auto_184028 ) ) ( not ( = ?auto_184026 ?auto_184028 ) ) ( not ( = ?auto_184027 ?auto_184028 ) ) ( ON ?auto_184021 ?auto_184020 ) ( ON-TABLE ?auto_184028 ) ( CLEAR ?auto_184023 ) ( ON ?auto_184022 ?auto_184021 ) ( CLEAR ?auto_184022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184028 ?auto_184020 ?auto_184021 )
      ( MAKE-7PILE ?auto_184020 ?auto_184021 ?auto_184022 ?auto_184023 ?auto_184024 ?auto_184025 ?auto_184026 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184029 - BLOCK
      ?auto_184030 - BLOCK
      ?auto_184031 - BLOCK
      ?auto_184032 - BLOCK
      ?auto_184033 - BLOCK
      ?auto_184034 - BLOCK
      ?auto_184035 - BLOCK
    )
    :vars
    (
      ?auto_184036 - BLOCK
      ?auto_184037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184029 ?auto_184030 ) ) ( not ( = ?auto_184029 ?auto_184031 ) ) ( not ( = ?auto_184029 ?auto_184032 ) ) ( not ( = ?auto_184029 ?auto_184033 ) ) ( not ( = ?auto_184029 ?auto_184034 ) ) ( not ( = ?auto_184029 ?auto_184035 ) ) ( not ( = ?auto_184030 ?auto_184031 ) ) ( not ( = ?auto_184030 ?auto_184032 ) ) ( not ( = ?auto_184030 ?auto_184033 ) ) ( not ( = ?auto_184030 ?auto_184034 ) ) ( not ( = ?auto_184030 ?auto_184035 ) ) ( not ( = ?auto_184031 ?auto_184032 ) ) ( not ( = ?auto_184031 ?auto_184033 ) ) ( not ( = ?auto_184031 ?auto_184034 ) ) ( not ( = ?auto_184031 ?auto_184035 ) ) ( not ( = ?auto_184032 ?auto_184033 ) ) ( not ( = ?auto_184032 ?auto_184034 ) ) ( not ( = ?auto_184032 ?auto_184035 ) ) ( not ( = ?auto_184033 ?auto_184034 ) ) ( not ( = ?auto_184033 ?auto_184035 ) ) ( not ( = ?auto_184034 ?auto_184035 ) ) ( ON ?auto_184035 ?auto_184036 ) ( not ( = ?auto_184029 ?auto_184036 ) ) ( not ( = ?auto_184030 ?auto_184036 ) ) ( not ( = ?auto_184031 ?auto_184036 ) ) ( not ( = ?auto_184032 ?auto_184036 ) ) ( not ( = ?auto_184033 ?auto_184036 ) ) ( not ( = ?auto_184034 ?auto_184036 ) ) ( not ( = ?auto_184035 ?auto_184036 ) ) ( ON ?auto_184034 ?auto_184035 ) ( ON-TABLE ?auto_184036 ) ( ON ?auto_184033 ?auto_184034 ) ( ON ?auto_184029 ?auto_184037 ) ( not ( = ?auto_184029 ?auto_184037 ) ) ( not ( = ?auto_184030 ?auto_184037 ) ) ( not ( = ?auto_184031 ?auto_184037 ) ) ( not ( = ?auto_184032 ?auto_184037 ) ) ( not ( = ?auto_184033 ?auto_184037 ) ) ( not ( = ?auto_184034 ?auto_184037 ) ) ( not ( = ?auto_184035 ?auto_184037 ) ) ( not ( = ?auto_184036 ?auto_184037 ) ) ( ON ?auto_184030 ?auto_184029 ) ( ON-TABLE ?auto_184037 ) ( ON ?auto_184031 ?auto_184030 ) ( CLEAR ?auto_184031 ) ( HOLDING ?auto_184032 ) ( CLEAR ?auto_184033 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184036 ?auto_184035 ?auto_184034 ?auto_184033 ?auto_184032 )
      ( MAKE-7PILE ?auto_184029 ?auto_184030 ?auto_184031 ?auto_184032 ?auto_184033 ?auto_184034 ?auto_184035 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184038 - BLOCK
      ?auto_184039 - BLOCK
      ?auto_184040 - BLOCK
      ?auto_184041 - BLOCK
      ?auto_184042 - BLOCK
      ?auto_184043 - BLOCK
      ?auto_184044 - BLOCK
    )
    :vars
    (
      ?auto_184045 - BLOCK
      ?auto_184046 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184038 ?auto_184039 ) ) ( not ( = ?auto_184038 ?auto_184040 ) ) ( not ( = ?auto_184038 ?auto_184041 ) ) ( not ( = ?auto_184038 ?auto_184042 ) ) ( not ( = ?auto_184038 ?auto_184043 ) ) ( not ( = ?auto_184038 ?auto_184044 ) ) ( not ( = ?auto_184039 ?auto_184040 ) ) ( not ( = ?auto_184039 ?auto_184041 ) ) ( not ( = ?auto_184039 ?auto_184042 ) ) ( not ( = ?auto_184039 ?auto_184043 ) ) ( not ( = ?auto_184039 ?auto_184044 ) ) ( not ( = ?auto_184040 ?auto_184041 ) ) ( not ( = ?auto_184040 ?auto_184042 ) ) ( not ( = ?auto_184040 ?auto_184043 ) ) ( not ( = ?auto_184040 ?auto_184044 ) ) ( not ( = ?auto_184041 ?auto_184042 ) ) ( not ( = ?auto_184041 ?auto_184043 ) ) ( not ( = ?auto_184041 ?auto_184044 ) ) ( not ( = ?auto_184042 ?auto_184043 ) ) ( not ( = ?auto_184042 ?auto_184044 ) ) ( not ( = ?auto_184043 ?auto_184044 ) ) ( ON ?auto_184044 ?auto_184045 ) ( not ( = ?auto_184038 ?auto_184045 ) ) ( not ( = ?auto_184039 ?auto_184045 ) ) ( not ( = ?auto_184040 ?auto_184045 ) ) ( not ( = ?auto_184041 ?auto_184045 ) ) ( not ( = ?auto_184042 ?auto_184045 ) ) ( not ( = ?auto_184043 ?auto_184045 ) ) ( not ( = ?auto_184044 ?auto_184045 ) ) ( ON ?auto_184043 ?auto_184044 ) ( ON-TABLE ?auto_184045 ) ( ON ?auto_184042 ?auto_184043 ) ( ON ?auto_184038 ?auto_184046 ) ( not ( = ?auto_184038 ?auto_184046 ) ) ( not ( = ?auto_184039 ?auto_184046 ) ) ( not ( = ?auto_184040 ?auto_184046 ) ) ( not ( = ?auto_184041 ?auto_184046 ) ) ( not ( = ?auto_184042 ?auto_184046 ) ) ( not ( = ?auto_184043 ?auto_184046 ) ) ( not ( = ?auto_184044 ?auto_184046 ) ) ( not ( = ?auto_184045 ?auto_184046 ) ) ( ON ?auto_184039 ?auto_184038 ) ( ON-TABLE ?auto_184046 ) ( ON ?auto_184040 ?auto_184039 ) ( CLEAR ?auto_184042 ) ( ON ?auto_184041 ?auto_184040 ) ( CLEAR ?auto_184041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184046 ?auto_184038 ?auto_184039 ?auto_184040 )
      ( MAKE-7PILE ?auto_184038 ?auto_184039 ?auto_184040 ?auto_184041 ?auto_184042 ?auto_184043 ?auto_184044 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184047 - BLOCK
      ?auto_184048 - BLOCK
      ?auto_184049 - BLOCK
      ?auto_184050 - BLOCK
      ?auto_184051 - BLOCK
      ?auto_184052 - BLOCK
      ?auto_184053 - BLOCK
    )
    :vars
    (
      ?auto_184055 - BLOCK
      ?auto_184054 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184047 ?auto_184048 ) ) ( not ( = ?auto_184047 ?auto_184049 ) ) ( not ( = ?auto_184047 ?auto_184050 ) ) ( not ( = ?auto_184047 ?auto_184051 ) ) ( not ( = ?auto_184047 ?auto_184052 ) ) ( not ( = ?auto_184047 ?auto_184053 ) ) ( not ( = ?auto_184048 ?auto_184049 ) ) ( not ( = ?auto_184048 ?auto_184050 ) ) ( not ( = ?auto_184048 ?auto_184051 ) ) ( not ( = ?auto_184048 ?auto_184052 ) ) ( not ( = ?auto_184048 ?auto_184053 ) ) ( not ( = ?auto_184049 ?auto_184050 ) ) ( not ( = ?auto_184049 ?auto_184051 ) ) ( not ( = ?auto_184049 ?auto_184052 ) ) ( not ( = ?auto_184049 ?auto_184053 ) ) ( not ( = ?auto_184050 ?auto_184051 ) ) ( not ( = ?auto_184050 ?auto_184052 ) ) ( not ( = ?auto_184050 ?auto_184053 ) ) ( not ( = ?auto_184051 ?auto_184052 ) ) ( not ( = ?auto_184051 ?auto_184053 ) ) ( not ( = ?auto_184052 ?auto_184053 ) ) ( ON ?auto_184053 ?auto_184055 ) ( not ( = ?auto_184047 ?auto_184055 ) ) ( not ( = ?auto_184048 ?auto_184055 ) ) ( not ( = ?auto_184049 ?auto_184055 ) ) ( not ( = ?auto_184050 ?auto_184055 ) ) ( not ( = ?auto_184051 ?auto_184055 ) ) ( not ( = ?auto_184052 ?auto_184055 ) ) ( not ( = ?auto_184053 ?auto_184055 ) ) ( ON ?auto_184052 ?auto_184053 ) ( ON-TABLE ?auto_184055 ) ( ON ?auto_184047 ?auto_184054 ) ( not ( = ?auto_184047 ?auto_184054 ) ) ( not ( = ?auto_184048 ?auto_184054 ) ) ( not ( = ?auto_184049 ?auto_184054 ) ) ( not ( = ?auto_184050 ?auto_184054 ) ) ( not ( = ?auto_184051 ?auto_184054 ) ) ( not ( = ?auto_184052 ?auto_184054 ) ) ( not ( = ?auto_184053 ?auto_184054 ) ) ( not ( = ?auto_184055 ?auto_184054 ) ) ( ON ?auto_184048 ?auto_184047 ) ( ON-TABLE ?auto_184054 ) ( ON ?auto_184049 ?auto_184048 ) ( ON ?auto_184050 ?auto_184049 ) ( CLEAR ?auto_184050 ) ( HOLDING ?auto_184051 ) ( CLEAR ?auto_184052 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184055 ?auto_184053 ?auto_184052 ?auto_184051 )
      ( MAKE-7PILE ?auto_184047 ?auto_184048 ?auto_184049 ?auto_184050 ?auto_184051 ?auto_184052 ?auto_184053 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184056 - BLOCK
      ?auto_184057 - BLOCK
      ?auto_184058 - BLOCK
      ?auto_184059 - BLOCK
      ?auto_184060 - BLOCK
      ?auto_184061 - BLOCK
      ?auto_184062 - BLOCK
    )
    :vars
    (
      ?auto_184063 - BLOCK
      ?auto_184064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184056 ?auto_184057 ) ) ( not ( = ?auto_184056 ?auto_184058 ) ) ( not ( = ?auto_184056 ?auto_184059 ) ) ( not ( = ?auto_184056 ?auto_184060 ) ) ( not ( = ?auto_184056 ?auto_184061 ) ) ( not ( = ?auto_184056 ?auto_184062 ) ) ( not ( = ?auto_184057 ?auto_184058 ) ) ( not ( = ?auto_184057 ?auto_184059 ) ) ( not ( = ?auto_184057 ?auto_184060 ) ) ( not ( = ?auto_184057 ?auto_184061 ) ) ( not ( = ?auto_184057 ?auto_184062 ) ) ( not ( = ?auto_184058 ?auto_184059 ) ) ( not ( = ?auto_184058 ?auto_184060 ) ) ( not ( = ?auto_184058 ?auto_184061 ) ) ( not ( = ?auto_184058 ?auto_184062 ) ) ( not ( = ?auto_184059 ?auto_184060 ) ) ( not ( = ?auto_184059 ?auto_184061 ) ) ( not ( = ?auto_184059 ?auto_184062 ) ) ( not ( = ?auto_184060 ?auto_184061 ) ) ( not ( = ?auto_184060 ?auto_184062 ) ) ( not ( = ?auto_184061 ?auto_184062 ) ) ( ON ?auto_184062 ?auto_184063 ) ( not ( = ?auto_184056 ?auto_184063 ) ) ( not ( = ?auto_184057 ?auto_184063 ) ) ( not ( = ?auto_184058 ?auto_184063 ) ) ( not ( = ?auto_184059 ?auto_184063 ) ) ( not ( = ?auto_184060 ?auto_184063 ) ) ( not ( = ?auto_184061 ?auto_184063 ) ) ( not ( = ?auto_184062 ?auto_184063 ) ) ( ON ?auto_184061 ?auto_184062 ) ( ON-TABLE ?auto_184063 ) ( ON ?auto_184056 ?auto_184064 ) ( not ( = ?auto_184056 ?auto_184064 ) ) ( not ( = ?auto_184057 ?auto_184064 ) ) ( not ( = ?auto_184058 ?auto_184064 ) ) ( not ( = ?auto_184059 ?auto_184064 ) ) ( not ( = ?auto_184060 ?auto_184064 ) ) ( not ( = ?auto_184061 ?auto_184064 ) ) ( not ( = ?auto_184062 ?auto_184064 ) ) ( not ( = ?auto_184063 ?auto_184064 ) ) ( ON ?auto_184057 ?auto_184056 ) ( ON-TABLE ?auto_184064 ) ( ON ?auto_184058 ?auto_184057 ) ( ON ?auto_184059 ?auto_184058 ) ( CLEAR ?auto_184061 ) ( ON ?auto_184060 ?auto_184059 ) ( CLEAR ?auto_184060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184064 ?auto_184056 ?auto_184057 ?auto_184058 ?auto_184059 )
      ( MAKE-7PILE ?auto_184056 ?auto_184057 ?auto_184058 ?auto_184059 ?auto_184060 ?auto_184061 ?auto_184062 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184065 - BLOCK
      ?auto_184066 - BLOCK
      ?auto_184067 - BLOCK
      ?auto_184068 - BLOCK
      ?auto_184069 - BLOCK
      ?auto_184070 - BLOCK
      ?auto_184071 - BLOCK
    )
    :vars
    (
      ?auto_184073 - BLOCK
      ?auto_184072 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184065 ?auto_184066 ) ) ( not ( = ?auto_184065 ?auto_184067 ) ) ( not ( = ?auto_184065 ?auto_184068 ) ) ( not ( = ?auto_184065 ?auto_184069 ) ) ( not ( = ?auto_184065 ?auto_184070 ) ) ( not ( = ?auto_184065 ?auto_184071 ) ) ( not ( = ?auto_184066 ?auto_184067 ) ) ( not ( = ?auto_184066 ?auto_184068 ) ) ( not ( = ?auto_184066 ?auto_184069 ) ) ( not ( = ?auto_184066 ?auto_184070 ) ) ( not ( = ?auto_184066 ?auto_184071 ) ) ( not ( = ?auto_184067 ?auto_184068 ) ) ( not ( = ?auto_184067 ?auto_184069 ) ) ( not ( = ?auto_184067 ?auto_184070 ) ) ( not ( = ?auto_184067 ?auto_184071 ) ) ( not ( = ?auto_184068 ?auto_184069 ) ) ( not ( = ?auto_184068 ?auto_184070 ) ) ( not ( = ?auto_184068 ?auto_184071 ) ) ( not ( = ?auto_184069 ?auto_184070 ) ) ( not ( = ?auto_184069 ?auto_184071 ) ) ( not ( = ?auto_184070 ?auto_184071 ) ) ( ON ?auto_184071 ?auto_184073 ) ( not ( = ?auto_184065 ?auto_184073 ) ) ( not ( = ?auto_184066 ?auto_184073 ) ) ( not ( = ?auto_184067 ?auto_184073 ) ) ( not ( = ?auto_184068 ?auto_184073 ) ) ( not ( = ?auto_184069 ?auto_184073 ) ) ( not ( = ?auto_184070 ?auto_184073 ) ) ( not ( = ?auto_184071 ?auto_184073 ) ) ( ON-TABLE ?auto_184073 ) ( ON ?auto_184065 ?auto_184072 ) ( not ( = ?auto_184065 ?auto_184072 ) ) ( not ( = ?auto_184066 ?auto_184072 ) ) ( not ( = ?auto_184067 ?auto_184072 ) ) ( not ( = ?auto_184068 ?auto_184072 ) ) ( not ( = ?auto_184069 ?auto_184072 ) ) ( not ( = ?auto_184070 ?auto_184072 ) ) ( not ( = ?auto_184071 ?auto_184072 ) ) ( not ( = ?auto_184073 ?auto_184072 ) ) ( ON ?auto_184066 ?auto_184065 ) ( ON-TABLE ?auto_184072 ) ( ON ?auto_184067 ?auto_184066 ) ( ON ?auto_184068 ?auto_184067 ) ( ON ?auto_184069 ?auto_184068 ) ( CLEAR ?auto_184069 ) ( HOLDING ?auto_184070 ) ( CLEAR ?auto_184071 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184073 ?auto_184071 ?auto_184070 )
      ( MAKE-7PILE ?auto_184065 ?auto_184066 ?auto_184067 ?auto_184068 ?auto_184069 ?auto_184070 ?auto_184071 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184074 - BLOCK
      ?auto_184075 - BLOCK
      ?auto_184076 - BLOCK
      ?auto_184077 - BLOCK
      ?auto_184078 - BLOCK
      ?auto_184079 - BLOCK
      ?auto_184080 - BLOCK
    )
    :vars
    (
      ?auto_184081 - BLOCK
      ?auto_184082 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184074 ?auto_184075 ) ) ( not ( = ?auto_184074 ?auto_184076 ) ) ( not ( = ?auto_184074 ?auto_184077 ) ) ( not ( = ?auto_184074 ?auto_184078 ) ) ( not ( = ?auto_184074 ?auto_184079 ) ) ( not ( = ?auto_184074 ?auto_184080 ) ) ( not ( = ?auto_184075 ?auto_184076 ) ) ( not ( = ?auto_184075 ?auto_184077 ) ) ( not ( = ?auto_184075 ?auto_184078 ) ) ( not ( = ?auto_184075 ?auto_184079 ) ) ( not ( = ?auto_184075 ?auto_184080 ) ) ( not ( = ?auto_184076 ?auto_184077 ) ) ( not ( = ?auto_184076 ?auto_184078 ) ) ( not ( = ?auto_184076 ?auto_184079 ) ) ( not ( = ?auto_184076 ?auto_184080 ) ) ( not ( = ?auto_184077 ?auto_184078 ) ) ( not ( = ?auto_184077 ?auto_184079 ) ) ( not ( = ?auto_184077 ?auto_184080 ) ) ( not ( = ?auto_184078 ?auto_184079 ) ) ( not ( = ?auto_184078 ?auto_184080 ) ) ( not ( = ?auto_184079 ?auto_184080 ) ) ( ON ?auto_184080 ?auto_184081 ) ( not ( = ?auto_184074 ?auto_184081 ) ) ( not ( = ?auto_184075 ?auto_184081 ) ) ( not ( = ?auto_184076 ?auto_184081 ) ) ( not ( = ?auto_184077 ?auto_184081 ) ) ( not ( = ?auto_184078 ?auto_184081 ) ) ( not ( = ?auto_184079 ?auto_184081 ) ) ( not ( = ?auto_184080 ?auto_184081 ) ) ( ON-TABLE ?auto_184081 ) ( ON ?auto_184074 ?auto_184082 ) ( not ( = ?auto_184074 ?auto_184082 ) ) ( not ( = ?auto_184075 ?auto_184082 ) ) ( not ( = ?auto_184076 ?auto_184082 ) ) ( not ( = ?auto_184077 ?auto_184082 ) ) ( not ( = ?auto_184078 ?auto_184082 ) ) ( not ( = ?auto_184079 ?auto_184082 ) ) ( not ( = ?auto_184080 ?auto_184082 ) ) ( not ( = ?auto_184081 ?auto_184082 ) ) ( ON ?auto_184075 ?auto_184074 ) ( ON-TABLE ?auto_184082 ) ( ON ?auto_184076 ?auto_184075 ) ( ON ?auto_184077 ?auto_184076 ) ( ON ?auto_184078 ?auto_184077 ) ( CLEAR ?auto_184080 ) ( ON ?auto_184079 ?auto_184078 ) ( CLEAR ?auto_184079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184082 ?auto_184074 ?auto_184075 ?auto_184076 ?auto_184077 ?auto_184078 )
      ( MAKE-7PILE ?auto_184074 ?auto_184075 ?auto_184076 ?auto_184077 ?auto_184078 ?auto_184079 ?auto_184080 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184083 - BLOCK
      ?auto_184084 - BLOCK
      ?auto_184085 - BLOCK
      ?auto_184086 - BLOCK
      ?auto_184087 - BLOCK
      ?auto_184088 - BLOCK
      ?auto_184089 - BLOCK
    )
    :vars
    (
      ?auto_184090 - BLOCK
      ?auto_184091 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184083 ?auto_184084 ) ) ( not ( = ?auto_184083 ?auto_184085 ) ) ( not ( = ?auto_184083 ?auto_184086 ) ) ( not ( = ?auto_184083 ?auto_184087 ) ) ( not ( = ?auto_184083 ?auto_184088 ) ) ( not ( = ?auto_184083 ?auto_184089 ) ) ( not ( = ?auto_184084 ?auto_184085 ) ) ( not ( = ?auto_184084 ?auto_184086 ) ) ( not ( = ?auto_184084 ?auto_184087 ) ) ( not ( = ?auto_184084 ?auto_184088 ) ) ( not ( = ?auto_184084 ?auto_184089 ) ) ( not ( = ?auto_184085 ?auto_184086 ) ) ( not ( = ?auto_184085 ?auto_184087 ) ) ( not ( = ?auto_184085 ?auto_184088 ) ) ( not ( = ?auto_184085 ?auto_184089 ) ) ( not ( = ?auto_184086 ?auto_184087 ) ) ( not ( = ?auto_184086 ?auto_184088 ) ) ( not ( = ?auto_184086 ?auto_184089 ) ) ( not ( = ?auto_184087 ?auto_184088 ) ) ( not ( = ?auto_184087 ?auto_184089 ) ) ( not ( = ?auto_184088 ?auto_184089 ) ) ( not ( = ?auto_184083 ?auto_184090 ) ) ( not ( = ?auto_184084 ?auto_184090 ) ) ( not ( = ?auto_184085 ?auto_184090 ) ) ( not ( = ?auto_184086 ?auto_184090 ) ) ( not ( = ?auto_184087 ?auto_184090 ) ) ( not ( = ?auto_184088 ?auto_184090 ) ) ( not ( = ?auto_184089 ?auto_184090 ) ) ( ON-TABLE ?auto_184090 ) ( ON ?auto_184083 ?auto_184091 ) ( not ( = ?auto_184083 ?auto_184091 ) ) ( not ( = ?auto_184084 ?auto_184091 ) ) ( not ( = ?auto_184085 ?auto_184091 ) ) ( not ( = ?auto_184086 ?auto_184091 ) ) ( not ( = ?auto_184087 ?auto_184091 ) ) ( not ( = ?auto_184088 ?auto_184091 ) ) ( not ( = ?auto_184089 ?auto_184091 ) ) ( not ( = ?auto_184090 ?auto_184091 ) ) ( ON ?auto_184084 ?auto_184083 ) ( ON-TABLE ?auto_184091 ) ( ON ?auto_184085 ?auto_184084 ) ( ON ?auto_184086 ?auto_184085 ) ( ON ?auto_184087 ?auto_184086 ) ( ON ?auto_184088 ?auto_184087 ) ( CLEAR ?auto_184088 ) ( HOLDING ?auto_184089 ) ( CLEAR ?auto_184090 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184090 ?auto_184089 )
      ( MAKE-7PILE ?auto_184083 ?auto_184084 ?auto_184085 ?auto_184086 ?auto_184087 ?auto_184088 ?auto_184089 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184092 - BLOCK
      ?auto_184093 - BLOCK
      ?auto_184094 - BLOCK
      ?auto_184095 - BLOCK
      ?auto_184096 - BLOCK
      ?auto_184097 - BLOCK
      ?auto_184098 - BLOCK
    )
    :vars
    (
      ?auto_184099 - BLOCK
      ?auto_184100 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184092 ?auto_184093 ) ) ( not ( = ?auto_184092 ?auto_184094 ) ) ( not ( = ?auto_184092 ?auto_184095 ) ) ( not ( = ?auto_184092 ?auto_184096 ) ) ( not ( = ?auto_184092 ?auto_184097 ) ) ( not ( = ?auto_184092 ?auto_184098 ) ) ( not ( = ?auto_184093 ?auto_184094 ) ) ( not ( = ?auto_184093 ?auto_184095 ) ) ( not ( = ?auto_184093 ?auto_184096 ) ) ( not ( = ?auto_184093 ?auto_184097 ) ) ( not ( = ?auto_184093 ?auto_184098 ) ) ( not ( = ?auto_184094 ?auto_184095 ) ) ( not ( = ?auto_184094 ?auto_184096 ) ) ( not ( = ?auto_184094 ?auto_184097 ) ) ( not ( = ?auto_184094 ?auto_184098 ) ) ( not ( = ?auto_184095 ?auto_184096 ) ) ( not ( = ?auto_184095 ?auto_184097 ) ) ( not ( = ?auto_184095 ?auto_184098 ) ) ( not ( = ?auto_184096 ?auto_184097 ) ) ( not ( = ?auto_184096 ?auto_184098 ) ) ( not ( = ?auto_184097 ?auto_184098 ) ) ( not ( = ?auto_184092 ?auto_184099 ) ) ( not ( = ?auto_184093 ?auto_184099 ) ) ( not ( = ?auto_184094 ?auto_184099 ) ) ( not ( = ?auto_184095 ?auto_184099 ) ) ( not ( = ?auto_184096 ?auto_184099 ) ) ( not ( = ?auto_184097 ?auto_184099 ) ) ( not ( = ?auto_184098 ?auto_184099 ) ) ( ON-TABLE ?auto_184099 ) ( ON ?auto_184092 ?auto_184100 ) ( not ( = ?auto_184092 ?auto_184100 ) ) ( not ( = ?auto_184093 ?auto_184100 ) ) ( not ( = ?auto_184094 ?auto_184100 ) ) ( not ( = ?auto_184095 ?auto_184100 ) ) ( not ( = ?auto_184096 ?auto_184100 ) ) ( not ( = ?auto_184097 ?auto_184100 ) ) ( not ( = ?auto_184098 ?auto_184100 ) ) ( not ( = ?auto_184099 ?auto_184100 ) ) ( ON ?auto_184093 ?auto_184092 ) ( ON-TABLE ?auto_184100 ) ( ON ?auto_184094 ?auto_184093 ) ( ON ?auto_184095 ?auto_184094 ) ( ON ?auto_184096 ?auto_184095 ) ( ON ?auto_184097 ?auto_184096 ) ( CLEAR ?auto_184099 ) ( ON ?auto_184098 ?auto_184097 ) ( CLEAR ?auto_184098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_184100 ?auto_184092 ?auto_184093 ?auto_184094 ?auto_184095 ?auto_184096 ?auto_184097 )
      ( MAKE-7PILE ?auto_184092 ?auto_184093 ?auto_184094 ?auto_184095 ?auto_184096 ?auto_184097 ?auto_184098 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184101 - BLOCK
      ?auto_184102 - BLOCK
      ?auto_184103 - BLOCK
      ?auto_184104 - BLOCK
      ?auto_184105 - BLOCK
      ?auto_184106 - BLOCK
      ?auto_184107 - BLOCK
    )
    :vars
    (
      ?auto_184109 - BLOCK
      ?auto_184108 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184101 ?auto_184102 ) ) ( not ( = ?auto_184101 ?auto_184103 ) ) ( not ( = ?auto_184101 ?auto_184104 ) ) ( not ( = ?auto_184101 ?auto_184105 ) ) ( not ( = ?auto_184101 ?auto_184106 ) ) ( not ( = ?auto_184101 ?auto_184107 ) ) ( not ( = ?auto_184102 ?auto_184103 ) ) ( not ( = ?auto_184102 ?auto_184104 ) ) ( not ( = ?auto_184102 ?auto_184105 ) ) ( not ( = ?auto_184102 ?auto_184106 ) ) ( not ( = ?auto_184102 ?auto_184107 ) ) ( not ( = ?auto_184103 ?auto_184104 ) ) ( not ( = ?auto_184103 ?auto_184105 ) ) ( not ( = ?auto_184103 ?auto_184106 ) ) ( not ( = ?auto_184103 ?auto_184107 ) ) ( not ( = ?auto_184104 ?auto_184105 ) ) ( not ( = ?auto_184104 ?auto_184106 ) ) ( not ( = ?auto_184104 ?auto_184107 ) ) ( not ( = ?auto_184105 ?auto_184106 ) ) ( not ( = ?auto_184105 ?auto_184107 ) ) ( not ( = ?auto_184106 ?auto_184107 ) ) ( not ( = ?auto_184101 ?auto_184109 ) ) ( not ( = ?auto_184102 ?auto_184109 ) ) ( not ( = ?auto_184103 ?auto_184109 ) ) ( not ( = ?auto_184104 ?auto_184109 ) ) ( not ( = ?auto_184105 ?auto_184109 ) ) ( not ( = ?auto_184106 ?auto_184109 ) ) ( not ( = ?auto_184107 ?auto_184109 ) ) ( ON ?auto_184101 ?auto_184108 ) ( not ( = ?auto_184101 ?auto_184108 ) ) ( not ( = ?auto_184102 ?auto_184108 ) ) ( not ( = ?auto_184103 ?auto_184108 ) ) ( not ( = ?auto_184104 ?auto_184108 ) ) ( not ( = ?auto_184105 ?auto_184108 ) ) ( not ( = ?auto_184106 ?auto_184108 ) ) ( not ( = ?auto_184107 ?auto_184108 ) ) ( not ( = ?auto_184109 ?auto_184108 ) ) ( ON ?auto_184102 ?auto_184101 ) ( ON-TABLE ?auto_184108 ) ( ON ?auto_184103 ?auto_184102 ) ( ON ?auto_184104 ?auto_184103 ) ( ON ?auto_184105 ?auto_184104 ) ( ON ?auto_184106 ?auto_184105 ) ( ON ?auto_184107 ?auto_184106 ) ( CLEAR ?auto_184107 ) ( HOLDING ?auto_184109 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_184109 )
      ( MAKE-7PILE ?auto_184101 ?auto_184102 ?auto_184103 ?auto_184104 ?auto_184105 ?auto_184106 ?auto_184107 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184110 - BLOCK
      ?auto_184111 - BLOCK
      ?auto_184112 - BLOCK
      ?auto_184113 - BLOCK
      ?auto_184114 - BLOCK
      ?auto_184115 - BLOCK
      ?auto_184116 - BLOCK
    )
    :vars
    (
      ?auto_184118 - BLOCK
      ?auto_184117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184110 ?auto_184111 ) ) ( not ( = ?auto_184110 ?auto_184112 ) ) ( not ( = ?auto_184110 ?auto_184113 ) ) ( not ( = ?auto_184110 ?auto_184114 ) ) ( not ( = ?auto_184110 ?auto_184115 ) ) ( not ( = ?auto_184110 ?auto_184116 ) ) ( not ( = ?auto_184111 ?auto_184112 ) ) ( not ( = ?auto_184111 ?auto_184113 ) ) ( not ( = ?auto_184111 ?auto_184114 ) ) ( not ( = ?auto_184111 ?auto_184115 ) ) ( not ( = ?auto_184111 ?auto_184116 ) ) ( not ( = ?auto_184112 ?auto_184113 ) ) ( not ( = ?auto_184112 ?auto_184114 ) ) ( not ( = ?auto_184112 ?auto_184115 ) ) ( not ( = ?auto_184112 ?auto_184116 ) ) ( not ( = ?auto_184113 ?auto_184114 ) ) ( not ( = ?auto_184113 ?auto_184115 ) ) ( not ( = ?auto_184113 ?auto_184116 ) ) ( not ( = ?auto_184114 ?auto_184115 ) ) ( not ( = ?auto_184114 ?auto_184116 ) ) ( not ( = ?auto_184115 ?auto_184116 ) ) ( not ( = ?auto_184110 ?auto_184118 ) ) ( not ( = ?auto_184111 ?auto_184118 ) ) ( not ( = ?auto_184112 ?auto_184118 ) ) ( not ( = ?auto_184113 ?auto_184118 ) ) ( not ( = ?auto_184114 ?auto_184118 ) ) ( not ( = ?auto_184115 ?auto_184118 ) ) ( not ( = ?auto_184116 ?auto_184118 ) ) ( ON ?auto_184110 ?auto_184117 ) ( not ( = ?auto_184110 ?auto_184117 ) ) ( not ( = ?auto_184111 ?auto_184117 ) ) ( not ( = ?auto_184112 ?auto_184117 ) ) ( not ( = ?auto_184113 ?auto_184117 ) ) ( not ( = ?auto_184114 ?auto_184117 ) ) ( not ( = ?auto_184115 ?auto_184117 ) ) ( not ( = ?auto_184116 ?auto_184117 ) ) ( not ( = ?auto_184118 ?auto_184117 ) ) ( ON ?auto_184111 ?auto_184110 ) ( ON-TABLE ?auto_184117 ) ( ON ?auto_184112 ?auto_184111 ) ( ON ?auto_184113 ?auto_184112 ) ( ON ?auto_184114 ?auto_184113 ) ( ON ?auto_184115 ?auto_184114 ) ( ON ?auto_184116 ?auto_184115 ) ( ON ?auto_184118 ?auto_184116 ) ( CLEAR ?auto_184118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_184117 ?auto_184110 ?auto_184111 ?auto_184112 ?auto_184113 ?auto_184114 ?auto_184115 ?auto_184116 )
      ( MAKE-7PILE ?auto_184110 ?auto_184111 ?auto_184112 ?auto_184113 ?auto_184114 ?auto_184115 ?auto_184116 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184135 - BLOCK
      ?auto_184136 - BLOCK
      ?auto_184137 - BLOCK
      ?auto_184138 - BLOCK
      ?auto_184139 - BLOCK
      ?auto_184140 - BLOCK
      ?auto_184141 - BLOCK
      ?auto_184142 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_184141 ) ( ON-TABLE ?auto_184135 ) ( ON ?auto_184136 ?auto_184135 ) ( ON ?auto_184137 ?auto_184136 ) ( ON ?auto_184138 ?auto_184137 ) ( ON ?auto_184139 ?auto_184138 ) ( ON ?auto_184140 ?auto_184139 ) ( ON ?auto_184141 ?auto_184140 ) ( not ( = ?auto_184135 ?auto_184136 ) ) ( not ( = ?auto_184135 ?auto_184137 ) ) ( not ( = ?auto_184135 ?auto_184138 ) ) ( not ( = ?auto_184135 ?auto_184139 ) ) ( not ( = ?auto_184135 ?auto_184140 ) ) ( not ( = ?auto_184135 ?auto_184141 ) ) ( not ( = ?auto_184135 ?auto_184142 ) ) ( not ( = ?auto_184136 ?auto_184137 ) ) ( not ( = ?auto_184136 ?auto_184138 ) ) ( not ( = ?auto_184136 ?auto_184139 ) ) ( not ( = ?auto_184136 ?auto_184140 ) ) ( not ( = ?auto_184136 ?auto_184141 ) ) ( not ( = ?auto_184136 ?auto_184142 ) ) ( not ( = ?auto_184137 ?auto_184138 ) ) ( not ( = ?auto_184137 ?auto_184139 ) ) ( not ( = ?auto_184137 ?auto_184140 ) ) ( not ( = ?auto_184137 ?auto_184141 ) ) ( not ( = ?auto_184137 ?auto_184142 ) ) ( not ( = ?auto_184138 ?auto_184139 ) ) ( not ( = ?auto_184138 ?auto_184140 ) ) ( not ( = ?auto_184138 ?auto_184141 ) ) ( not ( = ?auto_184138 ?auto_184142 ) ) ( not ( = ?auto_184139 ?auto_184140 ) ) ( not ( = ?auto_184139 ?auto_184141 ) ) ( not ( = ?auto_184139 ?auto_184142 ) ) ( not ( = ?auto_184140 ?auto_184141 ) ) ( not ( = ?auto_184140 ?auto_184142 ) ) ( not ( = ?auto_184141 ?auto_184142 ) ) ( ON-TABLE ?auto_184142 ) ( CLEAR ?auto_184142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_184142 )
      ( MAKE-8PILE ?auto_184135 ?auto_184136 ?auto_184137 ?auto_184138 ?auto_184139 ?auto_184140 ?auto_184141 ?auto_184142 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184143 - BLOCK
      ?auto_184144 - BLOCK
      ?auto_184145 - BLOCK
      ?auto_184146 - BLOCK
      ?auto_184147 - BLOCK
      ?auto_184148 - BLOCK
      ?auto_184149 - BLOCK
      ?auto_184150 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184143 ) ( ON ?auto_184144 ?auto_184143 ) ( ON ?auto_184145 ?auto_184144 ) ( ON ?auto_184146 ?auto_184145 ) ( ON ?auto_184147 ?auto_184146 ) ( ON ?auto_184148 ?auto_184147 ) ( not ( = ?auto_184143 ?auto_184144 ) ) ( not ( = ?auto_184143 ?auto_184145 ) ) ( not ( = ?auto_184143 ?auto_184146 ) ) ( not ( = ?auto_184143 ?auto_184147 ) ) ( not ( = ?auto_184143 ?auto_184148 ) ) ( not ( = ?auto_184143 ?auto_184149 ) ) ( not ( = ?auto_184143 ?auto_184150 ) ) ( not ( = ?auto_184144 ?auto_184145 ) ) ( not ( = ?auto_184144 ?auto_184146 ) ) ( not ( = ?auto_184144 ?auto_184147 ) ) ( not ( = ?auto_184144 ?auto_184148 ) ) ( not ( = ?auto_184144 ?auto_184149 ) ) ( not ( = ?auto_184144 ?auto_184150 ) ) ( not ( = ?auto_184145 ?auto_184146 ) ) ( not ( = ?auto_184145 ?auto_184147 ) ) ( not ( = ?auto_184145 ?auto_184148 ) ) ( not ( = ?auto_184145 ?auto_184149 ) ) ( not ( = ?auto_184145 ?auto_184150 ) ) ( not ( = ?auto_184146 ?auto_184147 ) ) ( not ( = ?auto_184146 ?auto_184148 ) ) ( not ( = ?auto_184146 ?auto_184149 ) ) ( not ( = ?auto_184146 ?auto_184150 ) ) ( not ( = ?auto_184147 ?auto_184148 ) ) ( not ( = ?auto_184147 ?auto_184149 ) ) ( not ( = ?auto_184147 ?auto_184150 ) ) ( not ( = ?auto_184148 ?auto_184149 ) ) ( not ( = ?auto_184148 ?auto_184150 ) ) ( not ( = ?auto_184149 ?auto_184150 ) ) ( ON-TABLE ?auto_184150 ) ( CLEAR ?auto_184150 ) ( HOLDING ?auto_184149 ) ( CLEAR ?auto_184148 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_184143 ?auto_184144 ?auto_184145 ?auto_184146 ?auto_184147 ?auto_184148 ?auto_184149 )
      ( MAKE-8PILE ?auto_184143 ?auto_184144 ?auto_184145 ?auto_184146 ?auto_184147 ?auto_184148 ?auto_184149 ?auto_184150 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184151 - BLOCK
      ?auto_184152 - BLOCK
      ?auto_184153 - BLOCK
      ?auto_184154 - BLOCK
      ?auto_184155 - BLOCK
      ?auto_184156 - BLOCK
      ?auto_184157 - BLOCK
      ?auto_184158 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184151 ) ( ON ?auto_184152 ?auto_184151 ) ( ON ?auto_184153 ?auto_184152 ) ( ON ?auto_184154 ?auto_184153 ) ( ON ?auto_184155 ?auto_184154 ) ( ON ?auto_184156 ?auto_184155 ) ( not ( = ?auto_184151 ?auto_184152 ) ) ( not ( = ?auto_184151 ?auto_184153 ) ) ( not ( = ?auto_184151 ?auto_184154 ) ) ( not ( = ?auto_184151 ?auto_184155 ) ) ( not ( = ?auto_184151 ?auto_184156 ) ) ( not ( = ?auto_184151 ?auto_184157 ) ) ( not ( = ?auto_184151 ?auto_184158 ) ) ( not ( = ?auto_184152 ?auto_184153 ) ) ( not ( = ?auto_184152 ?auto_184154 ) ) ( not ( = ?auto_184152 ?auto_184155 ) ) ( not ( = ?auto_184152 ?auto_184156 ) ) ( not ( = ?auto_184152 ?auto_184157 ) ) ( not ( = ?auto_184152 ?auto_184158 ) ) ( not ( = ?auto_184153 ?auto_184154 ) ) ( not ( = ?auto_184153 ?auto_184155 ) ) ( not ( = ?auto_184153 ?auto_184156 ) ) ( not ( = ?auto_184153 ?auto_184157 ) ) ( not ( = ?auto_184153 ?auto_184158 ) ) ( not ( = ?auto_184154 ?auto_184155 ) ) ( not ( = ?auto_184154 ?auto_184156 ) ) ( not ( = ?auto_184154 ?auto_184157 ) ) ( not ( = ?auto_184154 ?auto_184158 ) ) ( not ( = ?auto_184155 ?auto_184156 ) ) ( not ( = ?auto_184155 ?auto_184157 ) ) ( not ( = ?auto_184155 ?auto_184158 ) ) ( not ( = ?auto_184156 ?auto_184157 ) ) ( not ( = ?auto_184156 ?auto_184158 ) ) ( not ( = ?auto_184157 ?auto_184158 ) ) ( ON-TABLE ?auto_184158 ) ( CLEAR ?auto_184156 ) ( ON ?auto_184157 ?auto_184158 ) ( CLEAR ?auto_184157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_184158 )
      ( MAKE-8PILE ?auto_184151 ?auto_184152 ?auto_184153 ?auto_184154 ?auto_184155 ?auto_184156 ?auto_184157 ?auto_184158 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184159 - BLOCK
      ?auto_184160 - BLOCK
      ?auto_184161 - BLOCK
      ?auto_184162 - BLOCK
      ?auto_184163 - BLOCK
      ?auto_184164 - BLOCK
      ?auto_184165 - BLOCK
      ?auto_184166 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184159 ) ( ON ?auto_184160 ?auto_184159 ) ( ON ?auto_184161 ?auto_184160 ) ( ON ?auto_184162 ?auto_184161 ) ( ON ?auto_184163 ?auto_184162 ) ( not ( = ?auto_184159 ?auto_184160 ) ) ( not ( = ?auto_184159 ?auto_184161 ) ) ( not ( = ?auto_184159 ?auto_184162 ) ) ( not ( = ?auto_184159 ?auto_184163 ) ) ( not ( = ?auto_184159 ?auto_184164 ) ) ( not ( = ?auto_184159 ?auto_184165 ) ) ( not ( = ?auto_184159 ?auto_184166 ) ) ( not ( = ?auto_184160 ?auto_184161 ) ) ( not ( = ?auto_184160 ?auto_184162 ) ) ( not ( = ?auto_184160 ?auto_184163 ) ) ( not ( = ?auto_184160 ?auto_184164 ) ) ( not ( = ?auto_184160 ?auto_184165 ) ) ( not ( = ?auto_184160 ?auto_184166 ) ) ( not ( = ?auto_184161 ?auto_184162 ) ) ( not ( = ?auto_184161 ?auto_184163 ) ) ( not ( = ?auto_184161 ?auto_184164 ) ) ( not ( = ?auto_184161 ?auto_184165 ) ) ( not ( = ?auto_184161 ?auto_184166 ) ) ( not ( = ?auto_184162 ?auto_184163 ) ) ( not ( = ?auto_184162 ?auto_184164 ) ) ( not ( = ?auto_184162 ?auto_184165 ) ) ( not ( = ?auto_184162 ?auto_184166 ) ) ( not ( = ?auto_184163 ?auto_184164 ) ) ( not ( = ?auto_184163 ?auto_184165 ) ) ( not ( = ?auto_184163 ?auto_184166 ) ) ( not ( = ?auto_184164 ?auto_184165 ) ) ( not ( = ?auto_184164 ?auto_184166 ) ) ( not ( = ?auto_184165 ?auto_184166 ) ) ( ON-TABLE ?auto_184166 ) ( ON ?auto_184165 ?auto_184166 ) ( CLEAR ?auto_184165 ) ( HOLDING ?auto_184164 ) ( CLEAR ?auto_184163 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184159 ?auto_184160 ?auto_184161 ?auto_184162 ?auto_184163 ?auto_184164 )
      ( MAKE-8PILE ?auto_184159 ?auto_184160 ?auto_184161 ?auto_184162 ?auto_184163 ?auto_184164 ?auto_184165 ?auto_184166 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184167 - BLOCK
      ?auto_184168 - BLOCK
      ?auto_184169 - BLOCK
      ?auto_184170 - BLOCK
      ?auto_184171 - BLOCK
      ?auto_184172 - BLOCK
      ?auto_184173 - BLOCK
      ?auto_184174 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184167 ) ( ON ?auto_184168 ?auto_184167 ) ( ON ?auto_184169 ?auto_184168 ) ( ON ?auto_184170 ?auto_184169 ) ( ON ?auto_184171 ?auto_184170 ) ( not ( = ?auto_184167 ?auto_184168 ) ) ( not ( = ?auto_184167 ?auto_184169 ) ) ( not ( = ?auto_184167 ?auto_184170 ) ) ( not ( = ?auto_184167 ?auto_184171 ) ) ( not ( = ?auto_184167 ?auto_184172 ) ) ( not ( = ?auto_184167 ?auto_184173 ) ) ( not ( = ?auto_184167 ?auto_184174 ) ) ( not ( = ?auto_184168 ?auto_184169 ) ) ( not ( = ?auto_184168 ?auto_184170 ) ) ( not ( = ?auto_184168 ?auto_184171 ) ) ( not ( = ?auto_184168 ?auto_184172 ) ) ( not ( = ?auto_184168 ?auto_184173 ) ) ( not ( = ?auto_184168 ?auto_184174 ) ) ( not ( = ?auto_184169 ?auto_184170 ) ) ( not ( = ?auto_184169 ?auto_184171 ) ) ( not ( = ?auto_184169 ?auto_184172 ) ) ( not ( = ?auto_184169 ?auto_184173 ) ) ( not ( = ?auto_184169 ?auto_184174 ) ) ( not ( = ?auto_184170 ?auto_184171 ) ) ( not ( = ?auto_184170 ?auto_184172 ) ) ( not ( = ?auto_184170 ?auto_184173 ) ) ( not ( = ?auto_184170 ?auto_184174 ) ) ( not ( = ?auto_184171 ?auto_184172 ) ) ( not ( = ?auto_184171 ?auto_184173 ) ) ( not ( = ?auto_184171 ?auto_184174 ) ) ( not ( = ?auto_184172 ?auto_184173 ) ) ( not ( = ?auto_184172 ?auto_184174 ) ) ( not ( = ?auto_184173 ?auto_184174 ) ) ( ON-TABLE ?auto_184174 ) ( ON ?auto_184173 ?auto_184174 ) ( CLEAR ?auto_184171 ) ( ON ?auto_184172 ?auto_184173 ) ( CLEAR ?auto_184172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184174 ?auto_184173 )
      ( MAKE-8PILE ?auto_184167 ?auto_184168 ?auto_184169 ?auto_184170 ?auto_184171 ?auto_184172 ?auto_184173 ?auto_184174 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184175 - BLOCK
      ?auto_184176 - BLOCK
      ?auto_184177 - BLOCK
      ?auto_184178 - BLOCK
      ?auto_184179 - BLOCK
      ?auto_184180 - BLOCK
      ?auto_184181 - BLOCK
      ?auto_184182 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184175 ) ( ON ?auto_184176 ?auto_184175 ) ( ON ?auto_184177 ?auto_184176 ) ( ON ?auto_184178 ?auto_184177 ) ( not ( = ?auto_184175 ?auto_184176 ) ) ( not ( = ?auto_184175 ?auto_184177 ) ) ( not ( = ?auto_184175 ?auto_184178 ) ) ( not ( = ?auto_184175 ?auto_184179 ) ) ( not ( = ?auto_184175 ?auto_184180 ) ) ( not ( = ?auto_184175 ?auto_184181 ) ) ( not ( = ?auto_184175 ?auto_184182 ) ) ( not ( = ?auto_184176 ?auto_184177 ) ) ( not ( = ?auto_184176 ?auto_184178 ) ) ( not ( = ?auto_184176 ?auto_184179 ) ) ( not ( = ?auto_184176 ?auto_184180 ) ) ( not ( = ?auto_184176 ?auto_184181 ) ) ( not ( = ?auto_184176 ?auto_184182 ) ) ( not ( = ?auto_184177 ?auto_184178 ) ) ( not ( = ?auto_184177 ?auto_184179 ) ) ( not ( = ?auto_184177 ?auto_184180 ) ) ( not ( = ?auto_184177 ?auto_184181 ) ) ( not ( = ?auto_184177 ?auto_184182 ) ) ( not ( = ?auto_184178 ?auto_184179 ) ) ( not ( = ?auto_184178 ?auto_184180 ) ) ( not ( = ?auto_184178 ?auto_184181 ) ) ( not ( = ?auto_184178 ?auto_184182 ) ) ( not ( = ?auto_184179 ?auto_184180 ) ) ( not ( = ?auto_184179 ?auto_184181 ) ) ( not ( = ?auto_184179 ?auto_184182 ) ) ( not ( = ?auto_184180 ?auto_184181 ) ) ( not ( = ?auto_184180 ?auto_184182 ) ) ( not ( = ?auto_184181 ?auto_184182 ) ) ( ON-TABLE ?auto_184182 ) ( ON ?auto_184181 ?auto_184182 ) ( ON ?auto_184180 ?auto_184181 ) ( CLEAR ?auto_184180 ) ( HOLDING ?auto_184179 ) ( CLEAR ?auto_184178 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184175 ?auto_184176 ?auto_184177 ?auto_184178 ?auto_184179 )
      ( MAKE-8PILE ?auto_184175 ?auto_184176 ?auto_184177 ?auto_184178 ?auto_184179 ?auto_184180 ?auto_184181 ?auto_184182 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184183 - BLOCK
      ?auto_184184 - BLOCK
      ?auto_184185 - BLOCK
      ?auto_184186 - BLOCK
      ?auto_184187 - BLOCK
      ?auto_184188 - BLOCK
      ?auto_184189 - BLOCK
      ?auto_184190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184183 ) ( ON ?auto_184184 ?auto_184183 ) ( ON ?auto_184185 ?auto_184184 ) ( ON ?auto_184186 ?auto_184185 ) ( not ( = ?auto_184183 ?auto_184184 ) ) ( not ( = ?auto_184183 ?auto_184185 ) ) ( not ( = ?auto_184183 ?auto_184186 ) ) ( not ( = ?auto_184183 ?auto_184187 ) ) ( not ( = ?auto_184183 ?auto_184188 ) ) ( not ( = ?auto_184183 ?auto_184189 ) ) ( not ( = ?auto_184183 ?auto_184190 ) ) ( not ( = ?auto_184184 ?auto_184185 ) ) ( not ( = ?auto_184184 ?auto_184186 ) ) ( not ( = ?auto_184184 ?auto_184187 ) ) ( not ( = ?auto_184184 ?auto_184188 ) ) ( not ( = ?auto_184184 ?auto_184189 ) ) ( not ( = ?auto_184184 ?auto_184190 ) ) ( not ( = ?auto_184185 ?auto_184186 ) ) ( not ( = ?auto_184185 ?auto_184187 ) ) ( not ( = ?auto_184185 ?auto_184188 ) ) ( not ( = ?auto_184185 ?auto_184189 ) ) ( not ( = ?auto_184185 ?auto_184190 ) ) ( not ( = ?auto_184186 ?auto_184187 ) ) ( not ( = ?auto_184186 ?auto_184188 ) ) ( not ( = ?auto_184186 ?auto_184189 ) ) ( not ( = ?auto_184186 ?auto_184190 ) ) ( not ( = ?auto_184187 ?auto_184188 ) ) ( not ( = ?auto_184187 ?auto_184189 ) ) ( not ( = ?auto_184187 ?auto_184190 ) ) ( not ( = ?auto_184188 ?auto_184189 ) ) ( not ( = ?auto_184188 ?auto_184190 ) ) ( not ( = ?auto_184189 ?auto_184190 ) ) ( ON-TABLE ?auto_184190 ) ( ON ?auto_184189 ?auto_184190 ) ( ON ?auto_184188 ?auto_184189 ) ( CLEAR ?auto_184186 ) ( ON ?auto_184187 ?auto_184188 ) ( CLEAR ?auto_184187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184190 ?auto_184189 ?auto_184188 )
      ( MAKE-8PILE ?auto_184183 ?auto_184184 ?auto_184185 ?auto_184186 ?auto_184187 ?auto_184188 ?auto_184189 ?auto_184190 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184191 - BLOCK
      ?auto_184192 - BLOCK
      ?auto_184193 - BLOCK
      ?auto_184194 - BLOCK
      ?auto_184195 - BLOCK
      ?auto_184196 - BLOCK
      ?auto_184197 - BLOCK
      ?auto_184198 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184191 ) ( ON ?auto_184192 ?auto_184191 ) ( ON ?auto_184193 ?auto_184192 ) ( not ( = ?auto_184191 ?auto_184192 ) ) ( not ( = ?auto_184191 ?auto_184193 ) ) ( not ( = ?auto_184191 ?auto_184194 ) ) ( not ( = ?auto_184191 ?auto_184195 ) ) ( not ( = ?auto_184191 ?auto_184196 ) ) ( not ( = ?auto_184191 ?auto_184197 ) ) ( not ( = ?auto_184191 ?auto_184198 ) ) ( not ( = ?auto_184192 ?auto_184193 ) ) ( not ( = ?auto_184192 ?auto_184194 ) ) ( not ( = ?auto_184192 ?auto_184195 ) ) ( not ( = ?auto_184192 ?auto_184196 ) ) ( not ( = ?auto_184192 ?auto_184197 ) ) ( not ( = ?auto_184192 ?auto_184198 ) ) ( not ( = ?auto_184193 ?auto_184194 ) ) ( not ( = ?auto_184193 ?auto_184195 ) ) ( not ( = ?auto_184193 ?auto_184196 ) ) ( not ( = ?auto_184193 ?auto_184197 ) ) ( not ( = ?auto_184193 ?auto_184198 ) ) ( not ( = ?auto_184194 ?auto_184195 ) ) ( not ( = ?auto_184194 ?auto_184196 ) ) ( not ( = ?auto_184194 ?auto_184197 ) ) ( not ( = ?auto_184194 ?auto_184198 ) ) ( not ( = ?auto_184195 ?auto_184196 ) ) ( not ( = ?auto_184195 ?auto_184197 ) ) ( not ( = ?auto_184195 ?auto_184198 ) ) ( not ( = ?auto_184196 ?auto_184197 ) ) ( not ( = ?auto_184196 ?auto_184198 ) ) ( not ( = ?auto_184197 ?auto_184198 ) ) ( ON-TABLE ?auto_184198 ) ( ON ?auto_184197 ?auto_184198 ) ( ON ?auto_184196 ?auto_184197 ) ( ON ?auto_184195 ?auto_184196 ) ( CLEAR ?auto_184195 ) ( HOLDING ?auto_184194 ) ( CLEAR ?auto_184193 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184191 ?auto_184192 ?auto_184193 ?auto_184194 )
      ( MAKE-8PILE ?auto_184191 ?auto_184192 ?auto_184193 ?auto_184194 ?auto_184195 ?auto_184196 ?auto_184197 ?auto_184198 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184199 - BLOCK
      ?auto_184200 - BLOCK
      ?auto_184201 - BLOCK
      ?auto_184202 - BLOCK
      ?auto_184203 - BLOCK
      ?auto_184204 - BLOCK
      ?auto_184205 - BLOCK
      ?auto_184206 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184199 ) ( ON ?auto_184200 ?auto_184199 ) ( ON ?auto_184201 ?auto_184200 ) ( not ( = ?auto_184199 ?auto_184200 ) ) ( not ( = ?auto_184199 ?auto_184201 ) ) ( not ( = ?auto_184199 ?auto_184202 ) ) ( not ( = ?auto_184199 ?auto_184203 ) ) ( not ( = ?auto_184199 ?auto_184204 ) ) ( not ( = ?auto_184199 ?auto_184205 ) ) ( not ( = ?auto_184199 ?auto_184206 ) ) ( not ( = ?auto_184200 ?auto_184201 ) ) ( not ( = ?auto_184200 ?auto_184202 ) ) ( not ( = ?auto_184200 ?auto_184203 ) ) ( not ( = ?auto_184200 ?auto_184204 ) ) ( not ( = ?auto_184200 ?auto_184205 ) ) ( not ( = ?auto_184200 ?auto_184206 ) ) ( not ( = ?auto_184201 ?auto_184202 ) ) ( not ( = ?auto_184201 ?auto_184203 ) ) ( not ( = ?auto_184201 ?auto_184204 ) ) ( not ( = ?auto_184201 ?auto_184205 ) ) ( not ( = ?auto_184201 ?auto_184206 ) ) ( not ( = ?auto_184202 ?auto_184203 ) ) ( not ( = ?auto_184202 ?auto_184204 ) ) ( not ( = ?auto_184202 ?auto_184205 ) ) ( not ( = ?auto_184202 ?auto_184206 ) ) ( not ( = ?auto_184203 ?auto_184204 ) ) ( not ( = ?auto_184203 ?auto_184205 ) ) ( not ( = ?auto_184203 ?auto_184206 ) ) ( not ( = ?auto_184204 ?auto_184205 ) ) ( not ( = ?auto_184204 ?auto_184206 ) ) ( not ( = ?auto_184205 ?auto_184206 ) ) ( ON-TABLE ?auto_184206 ) ( ON ?auto_184205 ?auto_184206 ) ( ON ?auto_184204 ?auto_184205 ) ( ON ?auto_184203 ?auto_184204 ) ( CLEAR ?auto_184201 ) ( ON ?auto_184202 ?auto_184203 ) ( CLEAR ?auto_184202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184206 ?auto_184205 ?auto_184204 ?auto_184203 )
      ( MAKE-8PILE ?auto_184199 ?auto_184200 ?auto_184201 ?auto_184202 ?auto_184203 ?auto_184204 ?auto_184205 ?auto_184206 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184207 - BLOCK
      ?auto_184208 - BLOCK
      ?auto_184209 - BLOCK
      ?auto_184210 - BLOCK
      ?auto_184211 - BLOCK
      ?auto_184212 - BLOCK
      ?auto_184213 - BLOCK
      ?auto_184214 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184207 ) ( ON ?auto_184208 ?auto_184207 ) ( not ( = ?auto_184207 ?auto_184208 ) ) ( not ( = ?auto_184207 ?auto_184209 ) ) ( not ( = ?auto_184207 ?auto_184210 ) ) ( not ( = ?auto_184207 ?auto_184211 ) ) ( not ( = ?auto_184207 ?auto_184212 ) ) ( not ( = ?auto_184207 ?auto_184213 ) ) ( not ( = ?auto_184207 ?auto_184214 ) ) ( not ( = ?auto_184208 ?auto_184209 ) ) ( not ( = ?auto_184208 ?auto_184210 ) ) ( not ( = ?auto_184208 ?auto_184211 ) ) ( not ( = ?auto_184208 ?auto_184212 ) ) ( not ( = ?auto_184208 ?auto_184213 ) ) ( not ( = ?auto_184208 ?auto_184214 ) ) ( not ( = ?auto_184209 ?auto_184210 ) ) ( not ( = ?auto_184209 ?auto_184211 ) ) ( not ( = ?auto_184209 ?auto_184212 ) ) ( not ( = ?auto_184209 ?auto_184213 ) ) ( not ( = ?auto_184209 ?auto_184214 ) ) ( not ( = ?auto_184210 ?auto_184211 ) ) ( not ( = ?auto_184210 ?auto_184212 ) ) ( not ( = ?auto_184210 ?auto_184213 ) ) ( not ( = ?auto_184210 ?auto_184214 ) ) ( not ( = ?auto_184211 ?auto_184212 ) ) ( not ( = ?auto_184211 ?auto_184213 ) ) ( not ( = ?auto_184211 ?auto_184214 ) ) ( not ( = ?auto_184212 ?auto_184213 ) ) ( not ( = ?auto_184212 ?auto_184214 ) ) ( not ( = ?auto_184213 ?auto_184214 ) ) ( ON-TABLE ?auto_184214 ) ( ON ?auto_184213 ?auto_184214 ) ( ON ?auto_184212 ?auto_184213 ) ( ON ?auto_184211 ?auto_184212 ) ( ON ?auto_184210 ?auto_184211 ) ( CLEAR ?auto_184210 ) ( HOLDING ?auto_184209 ) ( CLEAR ?auto_184208 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184207 ?auto_184208 ?auto_184209 )
      ( MAKE-8PILE ?auto_184207 ?auto_184208 ?auto_184209 ?auto_184210 ?auto_184211 ?auto_184212 ?auto_184213 ?auto_184214 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184215 - BLOCK
      ?auto_184216 - BLOCK
      ?auto_184217 - BLOCK
      ?auto_184218 - BLOCK
      ?auto_184219 - BLOCK
      ?auto_184220 - BLOCK
      ?auto_184221 - BLOCK
      ?auto_184222 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184215 ) ( ON ?auto_184216 ?auto_184215 ) ( not ( = ?auto_184215 ?auto_184216 ) ) ( not ( = ?auto_184215 ?auto_184217 ) ) ( not ( = ?auto_184215 ?auto_184218 ) ) ( not ( = ?auto_184215 ?auto_184219 ) ) ( not ( = ?auto_184215 ?auto_184220 ) ) ( not ( = ?auto_184215 ?auto_184221 ) ) ( not ( = ?auto_184215 ?auto_184222 ) ) ( not ( = ?auto_184216 ?auto_184217 ) ) ( not ( = ?auto_184216 ?auto_184218 ) ) ( not ( = ?auto_184216 ?auto_184219 ) ) ( not ( = ?auto_184216 ?auto_184220 ) ) ( not ( = ?auto_184216 ?auto_184221 ) ) ( not ( = ?auto_184216 ?auto_184222 ) ) ( not ( = ?auto_184217 ?auto_184218 ) ) ( not ( = ?auto_184217 ?auto_184219 ) ) ( not ( = ?auto_184217 ?auto_184220 ) ) ( not ( = ?auto_184217 ?auto_184221 ) ) ( not ( = ?auto_184217 ?auto_184222 ) ) ( not ( = ?auto_184218 ?auto_184219 ) ) ( not ( = ?auto_184218 ?auto_184220 ) ) ( not ( = ?auto_184218 ?auto_184221 ) ) ( not ( = ?auto_184218 ?auto_184222 ) ) ( not ( = ?auto_184219 ?auto_184220 ) ) ( not ( = ?auto_184219 ?auto_184221 ) ) ( not ( = ?auto_184219 ?auto_184222 ) ) ( not ( = ?auto_184220 ?auto_184221 ) ) ( not ( = ?auto_184220 ?auto_184222 ) ) ( not ( = ?auto_184221 ?auto_184222 ) ) ( ON-TABLE ?auto_184222 ) ( ON ?auto_184221 ?auto_184222 ) ( ON ?auto_184220 ?auto_184221 ) ( ON ?auto_184219 ?auto_184220 ) ( ON ?auto_184218 ?auto_184219 ) ( CLEAR ?auto_184216 ) ( ON ?auto_184217 ?auto_184218 ) ( CLEAR ?auto_184217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184222 ?auto_184221 ?auto_184220 ?auto_184219 ?auto_184218 )
      ( MAKE-8PILE ?auto_184215 ?auto_184216 ?auto_184217 ?auto_184218 ?auto_184219 ?auto_184220 ?auto_184221 ?auto_184222 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184223 - BLOCK
      ?auto_184224 - BLOCK
      ?auto_184225 - BLOCK
      ?auto_184226 - BLOCK
      ?auto_184227 - BLOCK
      ?auto_184228 - BLOCK
      ?auto_184229 - BLOCK
      ?auto_184230 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184223 ) ( not ( = ?auto_184223 ?auto_184224 ) ) ( not ( = ?auto_184223 ?auto_184225 ) ) ( not ( = ?auto_184223 ?auto_184226 ) ) ( not ( = ?auto_184223 ?auto_184227 ) ) ( not ( = ?auto_184223 ?auto_184228 ) ) ( not ( = ?auto_184223 ?auto_184229 ) ) ( not ( = ?auto_184223 ?auto_184230 ) ) ( not ( = ?auto_184224 ?auto_184225 ) ) ( not ( = ?auto_184224 ?auto_184226 ) ) ( not ( = ?auto_184224 ?auto_184227 ) ) ( not ( = ?auto_184224 ?auto_184228 ) ) ( not ( = ?auto_184224 ?auto_184229 ) ) ( not ( = ?auto_184224 ?auto_184230 ) ) ( not ( = ?auto_184225 ?auto_184226 ) ) ( not ( = ?auto_184225 ?auto_184227 ) ) ( not ( = ?auto_184225 ?auto_184228 ) ) ( not ( = ?auto_184225 ?auto_184229 ) ) ( not ( = ?auto_184225 ?auto_184230 ) ) ( not ( = ?auto_184226 ?auto_184227 ) ) ( not ( = ?auto_184226 ?auto_184228 ) ) ( not ( = ?auto_184226 ?auto_184229 ) ) ( not ( = ?auto_184226 ?auto_184230 ) ) ( not ( = ?auto_184227 ?auto_184228 ) ) ( not ( = ?auto_184227 ?auto_184229 ) ) ( not ( = ?auto_184227 ?auto_184230 ) ) ( not ( = ?auto_184228 ?auto_184229 ) ) ( not ( = ?auto_184228 ?auto_184230 ) ) ( not ( = ?auto_184229 ?auto_184230 ) ) ( ON-TABLE ?auto_184230 ) ( ON ?auto_184229 ?auto_184230 ) ( ON ?auto_184228 ?auto_184229 ) ( ON ?auto_184227 ?auto_184228 ) ( ON ?auto_184226 ?auto_184227 ) ( ON ?auto_184225 ?auto_184226 ) ( CLEAR ?auto_184225 ) ( HOLDING ?auto_184224 ) ( CLEAR ?auto_184223 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184223 ?auto_184224 )
      ( MAKE-8PILE ?auto_184223 ?auto_184224 ?auto_184225 ?auto_184226 ?auto_184227 ?auto_184228 ?auto_184229 ?auto_184230 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184231 - BLOCK
      ?auto_184232 - BLOCK
      ?auto_184233 - BLOCK
      ?auto_184234 - BLOCK
      ?auto_184235 - BLOCK
      ?auto_184236 - BLOCK
      ?auto_184237 - BLOCK
      ?auto_184238 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184231 ) ( not ( = ?auto_184231 ?auto_184232 ) ) ( not ( = ?auto_184231 ?auto_184233 ) ) ( not ( = ?auto_184231 ?auto_184234 ) ) ( not ( = ?auto_184231 ?auto_184235 ) ) ( not ( = ?auto_184231 ?auto_184236 ) ) ( not ( = ?auto_184231 ?auto_184237 ) ) ( not ( = ?auto_184231 ?auto_184238 ) ) ( not ( = ?auto_184232 ?auto_184233 ) ) ( not ( = ?auto_184232 ?auto_184234 ) ) ( not ( = ?auto_184232 ?auto_184235 ) ) ( not ( = ?auto_184232 ?auto_184236 ) ) ( not ( = ?auto_184232 ?auto_184237 ) ) ( not ( = ?auto_184232 ?auto_184238 ) ) ( not ( = ?auto_184233 ?auto_184234 ) ) ( not ( = ?auto_184233 ?auto_184235 ) ) ( not ( = ?auto_184233 ?auto_184236 ) ) ( not ( = ?auto_184233 ?auto_184237 ) ) ( not ( = ?auto_184233 ?auto_184238 ) ) ( not ( = ?auto_184234 ?auto_184235 ) ) ( not ( = ?auto_184234 ?auto_184236 ) ) ( not ( = ?auto_184234 ?auto_184237 ) ) ( not ( = ?auto_184234 ?auto_184238 ) ) ( not ( = ?auto_184235 ?auto_184236 ) ) ( not ( = ?auto_184235 ?auto_184237 ) ) ( not ( = ?auto_184235 ?auto_184238 ) ) ( not ( = ?auto_184236 ?auto_184237 ) ) ( not ( = ?auto_184236 ?auto_184238 ) ) ( not ( = ?auto_184237 ?auto_184238 ) ) ( ON-TABLE ?auto_184238 ) ( ON ?auto_184237 ?auto_184238 ) ( ON ?auto_184236 ?auto_184237 ) ( ON ?auto_184235 ?auto_184236 ) ( ON ?auto_184234 ?auto_184235 ) ( ON ?auto_184233 ?auto_184234 ) ( CLEAR ?auto_184231 ) ( ON ?auto_184232 ?auto_184233 ) ( CLEAR ?auto_184232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184238 ?auto_184237 ?auto_184236 ?auto_184235 ?auto_184234 ?auto_184233 )
      ( MAKE-8PILE ?auto_184231 ?auto_184232 ?auto_184233 ?auto_184234 ?auto_184235 ?auto_184236 ?auto_184237 ?auto_184238 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184239 - BLOCK
      ?auto_184240 - BLOCK
      ?auto_184241 - BLOCK
      ?auto_184242 - BLOCK
      ?auto_184243 - BLOCK
      ?auto_184244 - BLOCK
      ?auto_184245 - BLOCK
      ?auto_184246 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184239 ?auto_184240 ) ) ( not ( = ?auto_184239 ?auto_184241 ) ) ( not ( = ?auto_184239 ?auto_184242 ) ) ( not ( = ?auto_184239 ?auto_184243 ) ) ( not ( = ?auto_184239 ?auto_184244 ) ) ( not ( = ?auto_184239 ?auto_184245 ) ) ( not ( = ?auto_184239 ?auto_184246 ) ) ( not ( = ?auto_184240 ?auto_184241 ) ) ( not ( = ?auto_184240 ?auto_184242 ) ) ( not ( = ?auto_184240 ?auto_184243 ) ) ( not ( = ?auto_184240 ?auto_184244 ) ) ( not ( = ?auto_184240 ?auto_184245 ) ) ( not ( = ?auto_184240 ?auto_184246 ) ) ( not ( = ?auto_184241 ?auto_184242 ) ) ( not ( = ?auto_184241 ?auto_184243 ) ) ( not ( = ?auto_184241 ?auto_184244 ) ) ( not ( = ?auto_184241 ?auto_184245 ) ) ( not ( = ?auto_184241 ?auto_184246 ) ) ( not ( = ?auto_184242 ?auto_184243 ) ) ( not ( = ?auto_184242 ?auto_184244 ) ) ( not ( = ?auto_184242 ?auto_184245 ) ) ( not ( = ?auto_184242 ?auto_184246 ) ) ( not ( = ?auto_184243 ?auto_184244 ) ) ( not ( = ?auto_184243 ?auto_184245 ) ) ( not ( = ?auto_184243 ?auto_184246 ) ) ( not ( = ?auto_184244 ?auto_184245 ) ) ( not ( = ?auto_184244 ?auto_184246 ) ) ( not ( = ?auto_184245 ?auto_184246 ) ) ( ON-TABLE ?auto_184246 ) ( ON ?auto_184245 ?auto_184246 ) ( ON ?auto_184244 ?auto_184245 ) ( ON ?auto_184243 ?auto_184244 ) ( ON ?auto_184242 ?auto_184243 ) ( ON ?auto_184241 ?auto_184242 ) ( ON ?auto_184240 ?auto_184241 ) ( CLEAR ?auto_184240 ) ( HOLDING ?auto_184239 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_184239 )
      ( MAKE-8PILE ?auto_184239 ?auto_184240 ?auto_184241 ?auto_184242 ?auto_184243 ?auto_184244 ?auto_184245 ?auto_184246 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184247 - BLOCK
      ?auto_184248 - BLOCK
      ?auto_184249 - BLOCK
      ?auto_184250 - BLOCK
      ?auto_184251 - BLOCK
      ?auto_184252 - BLOCK
      ?auto_184253 - BLOCK
      ?auto_184254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184247 ?auto_184248 ) ) ( not ( = ?auto_184247 ?auto_184249 ) ) ( not ( = ?auto_184247 ?auto_184250 ) ) ( not ( = ?auto_184247 ?auto_184251 ) ) ( not ( = ?auto_184247 ?auto_184252 ) ) ( not ( = ?auto_184247 ?auto_184253 ) ) ( not ( = ?auto_184247 ?auto_184254 ) ) ( not ( = ?auto_184248 ?auto_184249 ) ) ( not ( = ?auto_184248 ?auto_184250 ) ) ( not ( = ?auto_184248 ?auto_184251 ) ) ( not ( = ?auto_184248 ?auto_184252 ) ) ( not ( = ?auto_184248 ?auto_184253 ) ) ( not ( = ?auto_184248 ?auto_184254 ) ) ( not ( = ?auto_184249 ?auto_184250 ) ) ( not ( = ?auto_184249 ?auto_184251 ) ) ( not ( = ?auto_184249 ?auto_184252 ) ) ( not ( = ?auto_184249 ?auto_184253 ) ) ( not ( = ?auto_184249 ?auto_184254 ) ) ( not ( = ?auto_184250 ?auto_184251 ) ) ( not ( = ?auto_184250 ?auto_184252 ) ) ( not ( = ?auto_184250 ?auto_184253 ) ) ( not ( = ?auto_184250 ?auto_184254 ) ) ( not ( = ?auto_184251 ?auto_184252 ) ) ( not ( = ?auto_184251 ?auto_184253 ) ) ( not ( = ?auto_184251 ?auto_184254 ) ) ( not ( = ?auto_184252 ?auto_184253 ) ) ( not ( = ?auto_184252 ?auto_184254 ) ) ( not ( = ?auto_184253 ?auto_184254 ) ) ( ON-TABLE ?auto_184254 ) ( ON ?auto_184253 ?auto_184254 ) ( ON ?auto_184252 ?auto_184253 ) ( ON ?auto_184251 ?auto_184252 ) ( ON ?auto_184250 ?auto_184251 ) ( ON ?auto_184249 ?auto_184250 ) ( ON ?auto_184248 ?auto_184249 ) ( ON ?auto_184247 ?auto_184248 ) ( CLEAR ?auto_184247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_184254 ?auto_184253 ?auto_184252 ?auto_184251 ?auto_184250 ?auto_184249 ?auto_184248 )
      ( MAKE-8PILE ?auto_184247 ?auto_184248 ?auto_184249 ?auto_184250 ?auto_184251 ?auto_184252 ?auto_184253 ?auto_184254 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184263 - BLOCK
      ?auto_184264 - BLOCK
      ?auto_184265 - BLOCK
      ?auto_184266 - BLOCK
      ?auto_184267 - BLOCK
      ?auto_184268 - BLOCK
      ?auto_184269 - BLOCK
      ?auto_184270 - BLOCK
    )
    :vars
    (
      ?auto_184271 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184263 ?auto_184264 ) ) ( not ( = ?auto_184263 ?auto_184265 ) ) ( not ( = ?auto_184263 ?auto_184266 ) ) ( not ( = ?auto_184263 ?auto_184267 ) ) ( not ( = ?auto_184263 ?auto_184268 ) ) ( not ( = ?auto_184263 ?auto_184269 ) ) ( not ( = ?auto_184263 ?auto_184270 ) ) ( not ( = ?auto_184264 ?auto_184265 ) ) ( not ( = ?auto_184264 ?auto_184266 ) ) ( not ( = ?auto_184264 ?auto_184267 ) ) ( not ( = ?auto_184264 ?auto_184268 ) ) ( not ( = ?auto_184264 ?auto_184269 ) ) ( not ( = ?auto_184264 ?auto_184270 ) ) ( not ( = ?auto_184265 ?auto_184266 ) ) ( not ( = ?auto_184265 ?auto_184267 ) ) ( not ( = ?auto_184265 ?auto_184268 ) ) ( not ( = ?auto_184265 ?auto_184269 ) ) ( not ( = ?auto_184265 ?auto_184270 ) ) ( not ( = ?auto_184266 ?auto_184267 ) ) ( not ( = ?auto_184266 ?auto_184268 ) ) ( not ( = ?auto_184266 ?auto_184269 ) ) ( not ( = ?auto_184266 ?auto_184270 ) ) ( not ( = ?auto_184267 ?auto_184268 ) ) ( not ( = ?auto_184267 ?auto_184269 ) ) ( not ( = ?auto_184267 ?auto_184270 ) ) ( not ( = ?auto_184268 ?auto_184269 ) ) ( not ( = ?auto_184268 ?auto_184270 ) ) ( not ( = ?auto_184269 ?auto_184270 ) ) ( ON-TABLE ?auto_184270 ) ( ON ?auto_184269 ?auto_184270 ) ( ON ?auto_184268 ?auto_184269 ) ( ON ?auto_184267 ?auto_184268 ) ( ON ?auto_184266 ?auto_184267 ) ( ON ?auto_184265 ?auto_184266 ) ( ON ?auto_184264 ?auto_184265 ) ( CLEAR ?auto_184264 ) ( ON ?auto_184263 ?auto_184271 ) ( CLEAR ?auto_184263 ) ( HAND-EMPTY ) ( not ( = ?auto_184263 ?auto_184271 ) ) ( not ( = ?auto_184264 ?auto_184271 ) ) ( not ( = ?auto_184265 ?auto_184271 ) ) ( not ( = ?auto_184266 ?auto_184271 ) ) ( not ( = ?auto_184267 ?auto_184271 ) ) ( not ( = ?auto_184268 ?auto_184271 ) ) ( not ( = ?auto_184269 ?auto_184271 ) ) ( not ( = ?auto_184270 ?auto_184271 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_184263 ?auto_184271 )
      ( MAKE-8PILE ?auto_184263 ?auto_184264 ?auto_184265 ?auto_184266 ?auto_184267 ?auto_184268 ?auto_184269 ?auto_184270 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184272 - BLOCK
      ?auto_184273 - BLOCK
      ?auto_184274 - BLOCK
      ?auto_184275 - BLOCK
      ?auto_184276 - BLOCK
      ?auto_184277 - BLOCK
      ?auto_184278 - BLOCK
      ?auto_184279 - BLOCK
    )
    :vars
    (
      ?auto_184280 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184272 ?auto_184273 ) ) ( not ( = ?auto_184272 ?auto_184274 ) ) ( not ( = ?auto_184272 ?auto_184275 ) ) ( not ( = ?auto_184272 ?auto_184276 ) ) ( not ( = ?auto_184272 ?auto_184277 ) ) ( not ( = ?auto_184272 ?auto_184278 ) ) ( not ( = ?auto_184272 ?auto_184279 ) ) ( not ( = ?auto_184273 ?auto_184274 ) ) ( not ( = ?auto_184273 ?auto_184275 ) ) ( not ( = ?auto_184273 ?auto_184276 ) ) ( not ( = ?auto_184273 ?auto_184277 ) ) ( not ( = ?auto_184273 ?auto_184278 ) ) ( not ( = ?auto_184273 ?auto_184279 ) ) ( not ( = ?auto_184274 ?auto_184275 ) ) ( not ( = ?auto_184274 ?auto_184276 ) ) ( not ( = ?auto_184274 ?auto_184277 ) ) ( not ( = ?auto_184274 ?auto_184278 ) ) ( not ( = ?auto_184274 ?auto_184279 ) ) ( not ( = ?auto_184275 ?auto_184276 ) ) ( not ( = ?auto_184275 ?auto_184277 ) ) ( not ( = ?auto_184275 ?auto_184278 ) ) ( not ( = ?auto_184275 ?auto_184279 ) ) ( not ( = ?auto_184276 ?auto_184277 ) ) ( not ( = ?auto_184276 ?auto_184278 ) ) ( not ( = ?auto_184276 ?auto_184279 ) ) ( not ( = ?auto_184277 ?auto_184278 ) ) ( not ( = ?auto_184277 ?auto_184279 ) ) ( not ( = ?auto_184278 ?auto_184279 ) ) ( ON-TABLE ?auto_184279 ) ( ON ?auto_184278 ?auto_184279 ) ( ON ?auto_184277 ?auto_184278 ) ( ON ?auto_184276 ?auto_184277 ) ( ON ?auto_184275 ?auto_184276 ) ( ON ?auto_184274 ?auto_184275 ) ( ON ?auto_184272 ?auto_184280 ) ( CLEAR ?auto_184272 ) ( not ( = ?auto_184272 ?auto_184280 ) ) ( not ( = ?auto_184273 ?auto_184280 ) ) ( not ( = ?auto_184274 ?auto_184280 ) ) ( not ( = ?auto_184275 ?auto_184280 ) ) ( not ( = ?auto_184276 ?auto_184280 ) ) ( not ( = ?auto_184277 ?auto_184280 ) ) ( not ( = ?auto_184278 ?auto_184280 ) ) ( not ( = ?auto_184279 ?auto_184280 ) ) ( HOLDING ?auto_184273 ) ( CLEAR ?auto_184274 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_184279 ?auto_184278 ?auto_184277 ?auto_184276 ?auto_184275 ?auto_184274 ?auto_184273 )
      ( MAKE-8PILE ?auto_184272 ?auto_184273 ?auto_184274 ?auto_184275 ?auto_184276 ?auto_184277 ?auto_184278 ?auto_184279 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184281 - BLOCK
      ?auto_184282 - BLOCK
      ?auto_184283 - BLOCK
      ?auto_184284 - BLOCK
      ?auto_184285 - BLOCK
      ?auto_184286 - BLOCK
      ?auto_184287 - BLOCK
      ?auto_184288 - BLOCK
    )
    :vars
    (
      ?auto_184289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184281 ?auto_184282 ) ) ( not ( = ?auto_184281 ?auto_184283 ) ) ( not ( = ?auto_184281 ?auto_184284 ) ) ( not ( = ?auto_184281 ?auto_184285 ) ) ( not ( = ?auto_184281 ?auto_184286 ) ) ( not ( = ?auto_184281 ?auto_184287 ) ) ( not ( = ?auto_184281 ?auto_184288 ) ) ( not ( = ?auto_184282 ?auto_184283 ) ) ( not ( = ?auto_184282 ?auto_184284 ) ) ( not ( = ?auto_184282 ?auto_184285 ) ) ( not ( = ?auto_184282 ?auto_184286 ) ) ( not ( = ?auto_184282 ?auto_184287 ) ) ( not ( = ?auto_184282 ?auto_184288 ) ) ( not ( = ?auto_184283 ?auto_184284 ) ) ( not ( = ?auto_184283 ?auto_184285 ) ) ( not ( = ?auto_184283 ?auto_184286 ) ) ( not ( = ?auto_184283 ?auto_184287 ) ) ( not ( = ?auto_184283 ?auto_184288 ) ) ( not ( = ?auto_184284 ?auto_184285 ) ) ( not ( = ?auto_184284 ?auto_184286 ) ) ( not ( = ?auto_184284 ?auto_184287 ) ) ( not ( = ?auto_184284 ?auto_184288 ) ) ( not ( = ?auto_184285 ?auto_184286 ) ) ( not ( = ?auto_184285 ?auto_184287 ) ) ( not ( = ?auto_184285 ?auto_184288 ) ) ( not ( = ?auto_184286 ?auto_184287 ) ) ( not ( = ?auto_184286 ?auto_184288 ) ) ( not ( = ?auto_184287 ?auto_184288 ) ) ( ON-TABLE ?auto_184288 ) ( ON ?auto_184287 ?auto_184288 ) ( ON ?auto_184286 ?auto_184287 ) ( ON ?auto_184285 ?auto_184286 ) ( ON ?auto_184284 ?auto_184285 ) ( ON ?auto_184283 ?auto_184284 ) ( ON ?auto_184281 ?auto_184289 ) ( not ( = ?auto_184281 ?auto_184289 ) ) ( not ( = ?auto_184282 ?auto_184289 ) ) ( not ( = ?auto_184283 ?auto_184289 ) ) ( not ( = ?auto_184284 ?auto_184289 ) ) ( not ( = ?auto_184285 ?auto_184289 ) ) ( not ( = ?auto_184286 ?auto_184289 ) ) ( not ( = ?auto_184287 ?auto_184289 ) ) ( not ( = ?auto_184288 ?auto_184289 ) ) ( CLEAR ?auto_184283 ) ( ON ?auto_184282 ?auto_184281 ) ( CLEAR ?auto_184282 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_184289 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184289 ?auto_184281 )
      ( MAKE-8PILE ?auto_184281 ?auto_184282 ?auto_184283 ?auto_184284 ?auto_184285 ?auto_184286 ?auto_184287 ?auto_184288 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184290 - BLOCK
      ?auto_184291 - BLOCK
      ?auto_184292 - BLOCK
      ?auto_184293 - BLOCK
      ?auto_184294 - BLOCK
      ?auto_184295 - BLOCK
      ?auto_184296 - BLOCK
      ?auto_184297 - BLOCK
    )
    :vars
    (
      ?auto_184298 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184290 ?auto_184291 ) ) ( not ( = ?auto_184290 ?auto_184292 ) ) ( not ( = ?auto_184290 ?auto_184293 ) ) ( not ( = ?auto_184290 ?auto_184294 ) ) ( not ( = ?auto_184290 ?auto_184295 ) ) ( not ( = ?auto_184290 ?auto_184296 ) ) ( not ( = ?auto_184290 ?auto_184297 ) ) ( not ( = ?auto_184291 ?auto_184292 ) ) ( not ( = ?auto_184291 ?auto_184293 ) ) ( not ( = ?auto_184291 ?auto_184294 ) ) ( not ( = ?auto_184291 ?auto_184295 ) ) ( not ( = ?auto_184291 ?auto_184296 ) ) ( not ( = ?auto_184291 ?auto_184297 ) ) ( not ( = ?auto_184292 ?auto_184293 ) ) ( not ( = ?auto_184292 ?auto_184294 ) ) ( not ( = ?auto_184292 ?auto_184295 ) ) ( not ( = ?auto_184292 ?auto_184296 ) ) ( not ( = ?auto_184292 ?auto_184297 ) ) ( not ( = ?auto_184293 ?auto_184294 ) ) ( not ( = ?auto_184293 ?auto_184295 ) ) ( not ( = ?auto_184293 ?auto_184296 ) ) ( not ( = ?auto_184293 ?auto_184297 ) ) ( not ( = ?auto_184294 ?auto_184295 ) ) ( not ( = ?auto_184294 ?auto_184296 ) ) ( not ( = ?auto_184294 ?auto_184297 ) ) ( not ( = ?auto_184295 ?auto_184296 ) ) ( not ( = ?auto_184295 ?auto_184297 ) ) ( not ( = ?auto_184296 ?auto_184297 ) ) ( ON-TABLE ?auto_184297 ) ( ON ?auto_184296 ?auto_184297 ) ( ON ?auto_184295 ?auto_184296 ) ( ON ?auto_184294 ?auto_184295 ) ( ON ?auto_184293 ?auto_184294 ) ( ON ?auto_184290 ?auto_184298 ) ( not ( = ?auto_184290 ?auto_184298 ) ) ( not ( = ?auto_184291 ?auto_184298 ) ) ( not ( = ?auto_184292 ?auto_184298 ) ) ( not ( = ?auto_184293 ?auto_184298 ) ) ( not ( = ?auto_184294 ?auto_184298 ) ) ( not ( = ?auto_184295 ?auto_184298 ) ) ( not ( = ?auto_184296 ?auto_184298 ) ) ( not ( = ?auto_184297 ?auto_184298 ) ) ( ON ?auto_184291 ?auto_184290 ) ( CLEAR ?auto_184291 ) ( ON-TABLE ?auto_184298 ) ( HOLDING ?auto_184292 ) ( CLEAR ?auto_184293 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184297 ?auto_184296 ?auto_184295 ?auto_184294 ?auto_184293 ?auto_184292 )
      ( MAKE-8PILE ?auto_184290 ?auto_184291 ?auto_184292 ?auto_184293 ?auto_184294 ?auto_184295 ?auto_184296 ?auto_184297 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184299 - BLOCK
      ?auto_184300 - BLOCK
      ?auto_184301 - BLOCK
      ?auto_184302 - BLOCK
      ?auto_184303 - BLOCK
      ?auto_184304 - BLOCK
      ?auto_184305 - BLOCK
      ?auto_184306 - BLOCK
    )
    :vars
    (
      ?auto_184307 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184299 ?auto_184300 ) ) ( not ( = ?auto_184299 ?auto_184301 ) ) ( not ( = ?auto_184299 ?auto_184302 ) ) ( not ( = ?auto_184299 ?auto_184303 ) ) ( not ( = ?auto_184299 ?auto_184304 ) ) ( not ( = ?auto_184299 ?auto_184305 ) ) ( not ( = ?auto_184299 ?auto_184306 ) ) ( not ( = ?auto_184300 ?auto_184301 ) ) ( not ( = ?auto_184300 ?auto_184302 ) ) ( not ( = ?auto_184300 ?auto_184303 ) ) ( not ( = ?auto_184300 ?auto_184304 ) ) ( not ( = ?auto_184300 ?auto_184305 ) ) ( not ( = ?auto_184300 ?auto_184306 ) ) ( not ( = ?auto_184301 ?auto_184302 ) ) ( not ( = ?auto_184301 ?auto_184303 ) ) ( not ( = ?auto_184301 ?auto_184304 ) ) ( not ( = ?auto_184301 ?auto_184305 ) ) ( not ( = ?auto_184301 ?auto_184306 ) ) ( not ( = ?auto_184302 ?auto_184303 ) ) ( not ( = ?auto_184302 ?auto_184304 ) ) ( not ( = ?auto_184302 ?auto_184305 ) ) ( not ( = ?auto_184302 ?auto_184306 ) ) ( not ( = ?auto_184303 ?auto_184304 ) ) ( not ( = ?auto_184303 ?auto_184305 ) ) ( not ( = ?auto_184303 ?auto_184306 ) ) ( not ( = ?auto_184304 ?auto_184305 ) ) ( not ( = ?auto_184304 ?auto_184306 ) ) ( not ( = ?auto_184305 ?auto_184306 ) ) ( ON-TABLE ?auto_184306 ) ( ON ?auto_184305 ?auto_184306 ) ( ON ?auto_184304 ?auto_184305 ) ( ON ?auto_184303 ?auto_184304 ) ( ON ?auto_184302 ?auto_184303 ) ( ON ?auto_184299 ?auto_184307 ) ( not ( = ?auto_184299 ?auto_184307 ) ) ( not ( = ?auto_184300 ?auto_184307 ) ) ( not ( = ?auto_184301 ?auto_184307 ) ) ( not ( = ?auto_184302 ?auto_184307 ) ) ( not ( = ?auto_184303 ?auto_184307 ) ) ( not ( = ?auto_184304 ?auto_184307 ) ) ( not ( = ?auto_184305 ?auto_184307 ) ) ( not ( = ?auto_184306 ?auto_184307 ) ) ( ON ?auto_184300 ?auto_184299 ) ( ON-TABLE ?auto_184307 ) ( CLEAR ?auto_184302 ) ( ON ?auto_184301 ?auto_184300 ) ( CLEAR ?auto_184301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184307 ?auto_184299 ?auto_184300 )
      ( MAKE-8PILE ?auto_184299 ?auto_184300 ?auto_184301 ?auto_184302 ?auto_184303 ?auto_184304 ?auto_184305 ?auto_184306 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184308 - BLOCK
      ?auto_184309 - BLOCK
      ?auto_184310 - BLOCK
      ?auto_184311 - BLOCK
      ?auto_184312 - BLOCK
      ?auto_184313 - BLOCK
      ?auto_184314 - BLOCK
      ?auto_184315 - BLOCK
    )
    :vars
    (
      ?auto_184316 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184308 ?auto_184309 ) ) ( not ( = ?auto_184308 ?auto_184310 ) ) ( not ( = ?auto_184308 ?auto_184311 ) ) ( not ( = ?auto_184308 ?auto_184312 ) ) ( not ( = ?auto_184308 ?auto_184313 ) ) ( not ( = ?auto_184308 ?auto_184314 ) ) ( not ( = ?auto_184308 ?auto_184315 ) ) ( not ( = ?auto_184309 ?auto_184310 ) ) ( not ( = ?auto_184309 ?auto_184311 ) ) ( not ( = ?auto_184309 ?auto_184312 ) ) ( not ( = ?auto_184309 ?auto_184313 ) ) ( not ( = ?auto_184309 ?auto_184314 ) ) ( not ( = ?auto_184309 ?auto_184315 ) ) ( not ( = ?auto_184310 ?auto_184311 ) ) ( not ( = ?auto_184310 ?auto_184312 ) ) ( not ( = ?auto_184310 ?auto_184313 ) ) ( not ( = ?auto_184310 ?auto_184314 ) ) ( not ( = ?auto_184310 ?auto_184315 ) ) ( not ( = ?auto_184311 ?auto_184312 ) ) ( not ( = ?auto_184311 ?auto_184313 ) ) ( not ( = ?auto_184311 ?auto_184314 ) ) ( not ( = ?auto_184311 ?auto_184315 ) ) ( not ( = ?auto_184312 ?auto_184313 ) ) ( not ( = ?auto_184312 ?auto_184314 ) ) ( not ( = ?auto_184312 ?auto_184315 ) ) ( not ( = ?auto_184313 ?auto_184314 ) ) ( not ( = ?auto_184313 ?auto_184315 ) ) ( not ( = ?auto_184314 ?auto_184315 ) ) ( ON-TABLE ?auto_184315 ) ( ON ?auto_184314 ?auto_184315 ) ( ON ?auto_184313 ?auto_184314 ) ( ON ?auto_184312 ?auto_184313 ) ( ON ?auto_184308 ?auto_184316 ) ( not ( = ?auto_184308 ?auto_184316 ) ) ( not ( = ?auto_184309 ?auto_184316 ) ) ( not ( = ?auto_184310 ?auto_184316 ) ) ( not ( = ?auto_184311 ?auto_184316 ) ) ( not ( = ?auto_184312 ?auto_184316 ) ) ( not ( = ?auto_184313 ?auto_184316 ) ) ( not ( = ?auto_184314 ?auto_184316 ) ) ( not ( = ?auto_184315 ?auto_184316 ) ) ( ON ?auto_184309 ?auto_184308 ) ( ON-TABLE ?auto_184316 ) ( ON ?auto_184310 ?auto_184309 ) ( CLEAR ?auto_184310 ) ( HOLDING ?auto_184311 ) ( CLEAR ?auto_184312 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184315 ?auto_184314 ?auto_184313 ?auto_184312 ?auto_184311 )
      ( MAKE-8PILE ?auto_184308 ?auto_184309 ?auto_184310 ?auto_184311 ?auto_184312 ?auto_184313 ?auto_184314 ?auto_184315 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184317 - BLOCK
      ?auto_184318 - BLOCK
      ?auto_184319 - BLOCK
      ?auto_184320 - BLOCK
      ?auto_184321 - BLOCK
      ?auto_184322 - BLOCK
      ?auto_184323 - BLOCK
      ?auto_184324 - BLOCK
    )
    :vars
    (
      ?auto_184325 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184317 ?auto_184318 ) ) ( not ( = ?auto_184317 ?auto_184319 ) ) ( not ( = ?auto_184317 ?auto_184320 ) ) ( not ( = ?auto_184317 ?auto_184321 ) ) ( not ( = ?auto_184317 ?auto_184322 ) ) ( not ( = ?auto_184317 ?auto_184323 ) ) ( not ( = ?auto_184317 ?auto_184324 ) ) ( not ( = ?auto_184318 ?auto_184319 ) ) ( not ( = ?auto_184318 ?auto_184320 ) ) ( not ( = ?auto_184318 ?auto_184321 ) ) ( not ( = ?auto_184318 ?auto_184322 ) ) ( not ( = ?auto_184318 ?auto_184323 ) ) ( not ( = ?auto_184318 ?auto_184324 ) ) ( not ( = ?auto_184319 ?auto_184320 ) ) ( not ( = ?auto_184319 ?auto_184321 ) ) ( not ( = ?auto_184319 ?auto_184322 ) ) ( not ( = ?auto_184319 ?auto_184323 ) ) ( not ( = ?auto_184319 ?auto_184324 ) ) ( not ( = ?auto_184320 ?auto_184321 ) ) ( not ( = ?auto_184320 ?auto_184322 ) ) ( not ( = ?auto_184320 ?auto_184323 ) ) ( not ( = ?auto_184320 ?auto_184324 ) ) ( not ( = ?auto_184321 ?auto_184322 ) ) ( not ( = ?auto_184321 ?auto_184323 ) ) ( not ( = ?auto_184321 ?auto_184324 ) ) ( not ( = ?auto_184322 ?auto_184323 ) ) ( not ( = ?auto_184322 ?auto_184324 ) ) ( not ( = ?auto_184323 ?auto_184324 ) ) ( ON-TABLE ?auto_184324 ) ( ON ?auto_184323 ?auto_184324 ) ( ON ?auto_184322 ?auto_184323 ) ( ON ?auto_184321 ?auto_184322 ) ( ON ?auto_184317 ?auto_184325 ) ( not ( = ?auto_184317 ?auto_184325 ) ) ( not ( = ?auto_184318 ?auto_184325 ) ) ( not ( = ?auto_184319 ?auto_184325 ) ) ( not ( = ?auto_184320 ?auto_184325 ) ) ( not ( = ?auto_184321 ?auto_184325 ) ) ( not ( = ?auto_184322 ?auto_184325 ) ) ( not ( = ?auto_184323 ?auto_184325 ) ) ( not ( = ?auto_184324 ?auto_184325 ) ) ( ON ?auto_184318 ?auto_184317 ) ( ON-TABLE ?auto_184325 ) ( ON ?auto_184319 ?auto_184318 ) ( CLEAR ?auto_184321 ) ( ON ?auto_184320 ?auto_184319 ) ( CLEAR ?auto_184320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184325 ?auto_184317 ?auto_184318 ?auto_184319 )
      ( MAKE-8PILE ?auto_184317 ?auto_184318 ?auto_184319 ?auto_184320 ?auto_184321 ?auto_184322 ?auto_184323 ?auto_184324 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184326 - BLOCK
      ?auto_184327 - BLOCK
      ?auto_184328 - BLOCK
      ?auto_184329 - BLOCK
      ?auto_184330 - BLOCK
      ?auto_184331 - BLOCK
      ?auto_184332 - BLOCK
      ?auto_184333 - BLOCK
    )
    :vars
    (
      ?auto_184334 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184326 ?auto_184327 ) ) ( not ( = ?auto_184326 ?auto_184328 ) ) ( not ( = ?auto_184326 ?auto_184329 ) ) ( not ( = ?auto_184326 ?auto_184330 ) ) ( not ( = ?auto_184326 ?auto_184331 ) ) ( not ( = ?auto_184326 ?auto_184332 ) ) ( not ( = ?auto_184326 ?auto_184333 ) ) ( not ( = ?auto_184327 ?auto_184328 ) ) ( not ( = ?auto_184327 ?auto_184329 ) ) ( not ( = ?auto_184327 ?auto_184330 ) ) ( not ( = ?auto_184327 ?auto_184331 ) ) ( not ( = ?auto_184327 ?auto_184332 ) ) ( not ( = ?auto_184327 ?auto_184333 ) ) ( not ( = ?auto_184328 ?auto_184329 ) ) ( not ( = ?auto_184328 ?auto_184330 ) ) ( not ( = ?auto_184328 ?auto_184331 ) ) ( not ( = ?auto_184328 ?auto_184332 ) ) ( not ( = ?auto_184328 ?auto_184333 ) ) ( not ( = ?auto_184329 ?auto_184330 ) ) ( not ( = ?auto_184329 ?auto_184331 ) ) ( not ( = ?auto_184329 ?auto_184332 ) ) ( not ( = ?auto_184329 ?auto_184333 ) ) ( not ( = ?auto_184330 ?auto_184331 ) ) ( not ( = ?auto_184330 ?auto_184332 ) ) ( not ( = ?auto_184330 ?auto_184333 ) ) ( not ( = ?auto_184331 ?auto_184332 ) ) ( not ( = ?auto_184331 ?auto_184333 ) ) ( not ( = ?auto_184332 ?auto_184333 ) ) ( ON-TABLE ?auto_184333 ) ( ON ?auto_184332 ?auto_184333 ) ( ON ?auto_184331 ?auto_184332 ) ( ON ?auto_184326 ?auto_184334 ) ( not ( = ?auto_184326 ?auto_184334 ) ) ( not ( = ?auto_184327 ?auto_184334 ) ) ( not ( = ?auto_184328 ?auto_184334 ) ) ( not ( = ?auto_184329 ?auto_184334 ) ) ( not ( = ?auto_184330 ?auto_184334 ) ) ( not ( = ?auto_184331 ?auto_184334 ) ) ( not ( = ?auto_184332 ?auto_184334 ) ) ( not ( = ?auto_184333 ?auto_184334 ) ) ( ON ?auto_184327 ?auto_184326 ) ( ON-TABLE ?auto_184334 ) ( ON ?auto_184328 ?auto_184327 ) ( ON ?auto_184329 ?auto_184328 ) ( CLEAR ?auto_184329 ) ( HOLDING ?auto_184330 ) ( CLEAR ?auto_184331 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184333 ?auto_184332 ?auto_184331 ?auto_184330 )
      ( MAKE-8PILE ?auto_184326 ?auto_184327 ?auto_184328 ?auto_184329 ?auto_184330 ?auto_184331 ?auto_184332 ?auto_184333 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184335 - BLOCK
      ?auto_184336 - BLOCK
      ?auto_184337 - BLOCK
      ?auto_184338 - BLOCK
      ?auto_184339 - BLOCK
      ?auto_184340 - BLOCK
      ?auto_184341 - BLOCK
      ?auto_184342 - BLOCK
    )
    :vars
    (
      ?auto_184343 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184335 ?auto_184336 ) ) ( not ( = ?auto_184335 ?auto_184337 ) ) ( not ( = ?auto_184335 ?auto_184338 ) ) ( not ( = ?auto_184335 ?auto_184339 ) ) ( not ( = ?auto_184335 ?auto_184340 ) ) ( not ( = ?auto_184335 ?auto_184341 ) ) ( not ( = ?auto_184335 ?auto_184342 ) ) ( not ( = ?auto_184336 ?auto_184337 ) ) ( not ( = ?auto_184336 ?auto_184338 ) ) ( not ( = ?auto_184336 ?auto_184339 ) ) ( not ( = ?auto_184336 ?auto_184340 ) ) ( not ( = ?auto_184336 ?auto_184341 ) ) ( not ( = ?auto_184336 ?auto_184342 ) ) ( not ( = ?auto_184337 ?auto_184338 ) ) ( not ( = ?auto_184337 ?auto_184339 ) ) ( not ( = ?auto_184337 ?auto_184340 ) ) ( not ( = ?auto_184337 ?auto_184341 ) ) ( not ( = ?auto_184337 ?auto_184342 ) ) ( not ( = ?auto_184338 ?auto_184339 ) ) ( not ( = ?auto_184338 ?auto_184340 ) ) ( not ( = ?auto_184338 ?auto_184341 ) ) ( not ( = ?auto_184338 ?auto_184342 ) ) ( not ( = ?auto_184339 ?auto_184340 ) ) ( not ( = ?auto_184339 ?auto_184341 ) ) ( not ( = ?auto_184339 ?auto_184342 ) ) ( not ( = ?auto_184340 ?auto_184341 ) ) ( not ( = ?auto_184340 ?auto_184342 ) ) ( not ( = ?auto_184341 ?auto_184342 ) ) ( ON-TABLE ?auto_184342 ) ( ON ?auto_184341 ?auto_184342 ) ( ON ?auto_184340 ?auto_184341 ) ( ON ?auto_184335 ?auto_184343 ) ( not ( = ?auto_184335 ?auto_184343 ) ) ( not ( = ?auto_184336 ?auto_184343 ) ) ( not ( = ?auto_184337 ?auto_184343 ) ) ( not ( = ?auto_184338 ?auto_184343 ) ) ( not ( = ?auto_184339 ?auto_184343 ) ) ( not ( = ?auto_184340 ?auto_184343 ) ) ( not ( = ?auto_184341 ?auto_184343 ) ) ( not ( = ?auto_184342 ?auto_184343 ) ) ( ON ?auto_184336 ?auto_184335 ) ( ON-TABLE ?auto_184343 ) ( ON ?auto_184337 ?auto_184336 ) ( ON ?auto_184338 ?auto_184337 ) ( CLEAR ?auto_184340 ) ( ON ?auto_184339 ?auto_184338 ) ( CLEAR ?auto_184339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184343 ?auto_184335 ?auto_184336 ?auto_184337 ?auto_184338 )
      ( MAKE-8PILE ?auto_184335 ?auto_184336 ?auto_184337 ?auto_184338 ?auto_184339 ?auto_184340 ?auto_184341 ?auto_184342 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184344 - BLOCK
      ?auto_184345 - BLOCK
      ?auto_184346 - BLOCK
      ?auto_184347 - BLOCK
      ?auto_184348 - BLOCK
      ?auto_184349 - BLOCK
      ?auto_184350 - BLOCK
      ?auto_184351 - BLOCK
    )
    :vars
    (
      ?auto_184352 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184344 ?auto_184345 ) ) ( not ( = ?auto_184344 ?auto_184346 ) ) ( not ( = ?auto_184344 ?auto_184347 ) ) ( not ( = ?auto_184344 ?auto_184348 ) ) ( not ( = ?auto_184344 ?auto_184349 ) ) ( not ( = ?auto_184344 ?auto_184350 ) ) ( not ( = ?auto_184344 ?auto_184351 ) ) ( not ( = ?auto_184345 ?auto_184346 ) ) ( not ( = ?auto_184345 ?auto_184347 ) ) ( not ( = ?auto_184345 ?auto_184348 ) ) ( not ( = ?auto_184345 ?auto_184349 ) ) ( not ( = ?auto_184345 ?auto_184350 ) ) ( not ( = ?auto_184345 ?auto_184351 ) ) ( not ( = ?auto_184346 ?auto_184347 ) ) ( not ( = ?auto_184346 ?auto_184348 ) ) ( not ( = ?auto_184346 ?auto_184349 ) ) ( not ( = ?auto_184346 ?auto_184350 ) ) ( not ( = ?auto_184346 ?auto_184351 ) ) ( not ( = ?auto_184347 ?auto_184348 ) ) ( not ( = ?auto_184347 ?auto_184349 ) ) ( not ( = ?auto_184347 ?auto_184350 ) ) ( not ( = ?auto_184347 ?auto_184351 ) ) ( not ( = ?auto_184348 ?auto_184349 ) ) ( not ( = ?auto_184348 ?auto_184350 ) ) ( not ( = ?auto_184348 ?auto_184351 ) ) ( not ( = ?auto_184349 ?auto_184350 ) ) ( not ( = ?auto_184349 ?auto_184351 ) ) ( not ( = ?auto_184350 ?auto_184351 ) ) ( ON-TABLE ?auto_184351 ) ( ON ?auto_184350 ?auto_184351 ) ( ON ?auto_184344 ?auto_184352 ) ( not ( = ?auto_184344 ?auto_184352 ) ) ( not ( = ?auto_184345 ?auto_184352 ) ) ( not ( = ?auto_184346 ?auto_184352 ) ) ( not ( = ?auto_184347 ?auto_184352 ) ) ( not ( = ?auto_184348 ?auto_184352 ) ) ( not ( = ?auto_184349 ?auto_184352 ) ) ( not ( = ?auto_184350 ?auto_184352 ) ) ( not ( = ?auto_184351 ?auto_184352 ) ) ( ON ?auto_184345 ?auto_184344 ) ( ON-TABLE ?auto_184352 ) ( ON ?auto_184346 ?auto_184345 ) ( ON ?auto_184347 ?auto_184346 ) ( ON ?auto_184348 ?auto_184347 ) ( CLEAR ?auto_184348 ) ( HOLDING ?auto_184349 ) ( CLEAR ?auto_184350 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184351 ?auto_184350 ?auto_184349 )
      ( MAKE-8PILE ?auto_184344 ?auto_184345 ?auto_184346 ?auto_184347 ?auto_184348 ?auto_184349 ?auto_184350 ?auto_184351 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184353 - BLOCK
      ?auto_184354 - BLOCK
      ?auto_184355 - BLOCK
      ?auto_184356 - BLOCK
      ?auto_184357 - BLOCK
      ?auto_184358 - BLOCK
      ?auto_184359 - BLOCK
      ?auto_184360 - BLOCK
    )
    :vars
    (
      ?auto_184361 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184353 ?auto_184354 ) ) ( not ( = ?auto_184353 ?auto_184355 ) ) ( not ( = ?auto_184353 ?auto_184356 ) ) ( not ( = ?auto_184353 ?auto_184357 ) ) ( not ( = ?auto_184353 ?auto_184358 ) ) ( not ( = ?auto_184353 ?auto_184359 ) ) ( not ( = ?auto_184353 ?auto_184360 ) ) ( not ( = ?auto_184354 ?auto_184355 ) ) ( not ( = ?auto_184354 ?auto_184356 ) ) ( not ( = ?auto_184354 ?auto_184357 ) ) ( not ( = ?auto_184354 ?auto_184358 ) ) ( not ( = ?auto_184354 ?auto_184359 ) ) ( not ( = ?auto_184354 ?auto_184360 ) ) ( not ( = ?auto_184355 ?auto_184356 ) ) ( not ( = ?auto_184355 ?auto_184357 ) ) ( not ( = ?auto_184355 ?auto_184358 ) ) ( not ( = ?auto_184355 ?auto_184359 ) ) ( not ( = ?auto_184355 ?auto_184360 ) ) ( not ( = ?auto_184356 ?auto_184357 ) ) ( not ( = ?auto_184356 ?auto_184358 ) ) ( not ( = ?auto_184356 ?auto_184359 ) ) ( not ( = ?auto_184356 ?auto_184360 ) ) ( not ( = ?auto_184357 ?auto_184358 ) ) ( not ( = ?auto_184357 ?auto_184359 ) ) ( not ( = ?auto_184357 ?auto_184360 ) ) ( not ( = ?auto_184358 ?auto_184359 ) ) ( not ( = ?auto_184358 ?auto_184360 ) ) ( not ( = ?auto_184359 ?auto_184360 ) ) ( ON-TABLE ?auto_184360 ) ( ON ?auto_184359 ?auto_184360 ) ( ON ?auto_184353 ?auto_184361 ) ( not ( = ?auto_184353 ?auto_184361 ) ) ( not ( = ?auto_184354 ?auto_184361 ) ) ( not ( = ?auto_184355 ?auto_184361 ) ) ( not ( = ?auto_184356 ?auto_184361 ) ) ( not ( = ?auto_184357 ?auto_184361 ) ) ( not ( = ?auto_184358 ?auto_184361 ) ) ( not ( = ?auto_184359 ?auto_184361 ) ) ( not ( = ?auto_184360 ?auto_184361 ) ) ( ON ?auto_184354 ?auto_184353 ) ( ON-TABLE ?auto_184361 ) ( ON ?auto_184355 ?auto_184354 ) ( ON ?auto_184356 ?auto_184355 ) ( ON ?auto_184357 ?auto_184356 ) ( CLEAR ?auto_184359 ) ( ON ?auto_184358 ?auto_184357 ) ( CLEAR ?auto_184358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184361 ?auto_184353 ?auto_184354 ?auto_184355 ?auto_184356 ?auto_184357 )
      ( MAKE-8PILE ?auto_184353 ?auto_184354 ?auto_184355 ?auto_184356 ?auto_184357 ?auto_184358 ?auto_184359 ?auto_184360 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184362 - BLOCK
      ?auto_184363 - BLOCK
      ?auto_184364 - BLOCK
      ?auto_184365 - BLOCK
      ?auto_184366 - BLOCK
      ?auto_184367 - BLOCK
      ?auto_184368 - BLOCK
      ?auto_184369 - BLOCK
    )
    :vars
    (
      ?auto_184370 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184362 ?auto_184363 ) ) ( not ( = ?auto_184362 ?auto_184364 ) ) ( not ( = ?auto_184362 ?auto_184365 ) ) ( not ( = ?auto_184362 ?auto_184366 ) ) ( not ( = ?auto_184362 ?auto_184367 ) ) ( not ( = ?auto_184362 ?auto_184368 ) ) ( not ( = ?auto_184362 ?auto_184369 ) ) ( not ( = ?auto_184363 ?auto_184364 ) ) ( not ( = ?auto_184363 ?auto_184365 ) ) ( not ( = ?auto_184363 ?auto_184366 ) ) ( not ( = ?auto_184363 ?auto_184367 ) ) ( not ( = ?auto_184363 ?auto_184368 ) ) ( not ( = ?auto_184363 ?auto_184369 ) ) ( not ( = ?auto_184364 ?auto_184365 ) ) ( not ( = ?auto_184364 ?auto_184366 ) ) ( not ( = ?auto_184364 ?auto_184367 ) ) ( not ( = ?auto_184364 ?auto_184368 ) ) ( not ( = ?auto_184364 ?auto_184369 ) ) ( not ( = ?auto_184365 ?auto_184366 ) ) ( not ( = ?auto_184365 ?auto_184367 ) ) ( not ( = ?auto_184365 ?auto_184368 ) ) ( not ( = ?auto_184365 ?auto_184369 ) ) ( not ( = ?auto_184366 ?auto_184367 ) ) ( not ( = ?auto_184366 ?auto_184368 ) ) ( not ( = ?auto_184366 ?auto_184369 ) ) ( not ( = ?auto_184367 ?auto_184368 ) ) ( not ( = ?auto_184367 ?auto_184369 ) ) ( not ( = ?auto_184368 ?auto_184369 ) ) ( ON-TABLE ?auto_184369 ) ( ON ?auto_184362 ?auto_184370 ) ( not ( = ?auto_184362 ?auto_184370 ) ) ( not ( = ?auto_184363 ?auto_184370 ) ) ( not ( = ?auto_184364 ?auto_184370 ) ) ( not ( = ?auto_184365 ?auto_184370 ) ) ( not ( = ?auto_184366 ?auto_184370 ) ) ( not ( = ?auto_184367 ?auto_184370 ) ) ( not ( = ?auto_184368 ?auto_184370 ) ) ( not ( = ?auto_184369 ?auto_184370 ) ) ( ON ?auto_184363 ?auto_184362 ) ( ON-TABLE ?auto_184370 ) ( ON ?auto_184364 ?auto_184363 ) ( ON ?auto_184365 ?auto_184364 ) ( ON ?auto_184366 ?auto_184365 ) ( ON ?auto_184367 ?auto_184366 ) ( CLEAR ?auto_184367 ) ( HOLDING ?auto_184368 ) ( CLEAR ?auto_184369 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184369 ?auto_184368 )
      ( MAKE-8PILE ?auto_184362 ?auto_184363 ?auto_184364 ?auto_184365 ?auto_184366 ?auto_184367 ?auto_184368 ?auto_184369 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184371 - BLOCK
      ?auto_184372 - BLOCK
      ?auto_184373 - BLOCK
      ?auto_184374 - BLOCK
      ?auto_184375 - BLOCK
      ?auto_184376 - BLOCK
      ?auto_184377 - BLOCK
      ?auto_184378 - BLOCK
    )
    :vars
    (
      ?auto_184379 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184371 ?auto_184372 ) ) ( not ( = ?auto_184371 ?auto_184373 ) ) ( not ( = ?auto_184371 ?auto_184374 ) ) ( not ( = ?auto_184371 ?auto_184375 ) ) ( not ( = ?auto_184371 ?auto_184376 ) ) ( not ( = ?auto_184371 ?auto_184377 ) ) ( not ( = ?auto_184371 ?auto_184378 ) ) ( not ( = ?auto_184372 ?auto_184373 ) ) ( not ( = ?auto_184372 ?auto_184374 ) ) ( not ( = ?auto_184372 ?auto_184375 ) ) ( not ( = ?auto_184372 ?auto_184376 ) ) ( not ( = ?auto_184372 ?auto_184377 ) ) ( not ( = ?auto_184372 ?auto_184378 ) ) ( not ( = ?auto_184373 ?auto_184374 ) ) ( not ( = ?auto_184373 ?auto_184375 ) ) ( not ( = ?auto_184373 ?auto_184376 ) ) ( not ( = ?auto_184373 ?auto_184377 ) ) ( not ( = ?auto_184373 ?auto_184378 ) ) ( not ( = ?auto_184374 ?auto_184375 ) ) ( not ( = ?auto_184374 ?auto_184376 ) ) ( not ( = ?auto_184374 ?auto_184377 ) ) ( not ( = ?auto_184374 ?auto_184378 ) ) ( not ( = ?auto_184375 ?auto_184376 ) ) ( not ( = ?auto_184375 ?auto_184377 ) ) ( not ( = ?auto_184375 ?auto_184378 ) ) ( not ( = ?auto_184376 ?auto_184377 ) ) ( not ( = ?auto_184376 ?auto_184378 ) ) ( not ( = ?auto_184377 ?auto_184378 ) ) ( ON-TABLE ?auto_184378 ) ( ON ?auto_184371 ?auto_184379 ) ( not ( = ?auto_184371 ?auto_184379 ) ) ( not ( = ?auto_184372 ?auto_184379 ) ) ( not ( = ?auto_184373 ?auto_184379 ) ) ( not ( = ?auto_184374 ?auto_184379 ) ) ( not ( = ?auto_184375 ?auto_184379 ) ) ( not ( = ?auto_184376 ?auto_184379 ) ) ( not ( = ?auto_184377 ?auto_184379 ) ) ( not ( = ?auto_184378 ?auto_184379 ) ) ( ON ?auto_184372 ?auto_184371 ) ( ON-TABLE ?auto_184379 ) ( ON ?auto_184373 ?auto_184372 ) ( ON ?auto_184374 ?auto_184373 ) ( ON ?auto_184375 ?auto_184374 ) ( ON ?auto_184376 ?auto_184375 ) ( CLEAR ?auto_184378 ) ( ON ?auto_184377 ?auto_184376 ) ( CLEAR ?auto_184377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_184379 ?auto_184371 ?auto_184372 ?auto_184373 ?auto_184374 ?auto_184375 ?auto_184376 )
      ( MAKE-8PILE ?auto_184371 ?auto_184372 ?auto_184373 ?auto_184374 ?auto_184375 ?auto_184376 ?auto_184377 ?auto_184378 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184380 - BLOCK
      ?auto_184381 - BLOCK
      ?auto_184382 - BLOCK
      ?auto_184383 - BLOCK
      ?auto_184384 - BLOCK
      ?auto_184385 - BLOCK
      ?auto_184386 - BLOCK
      ?auto_184387 - BLOCK
    )
    :vars
    (
      ?auto_184388 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184380 ?auto_184381 ) ) ( not ( = ?auto_184380 ?auto_184382 ) ) ( not ( = ?auto_184380 ?auto_184383 ) ) ( not ( = ?auto_184380 ?auto_184384 ) ) ( not ( = ?auto_184380 ?auto_184385 ) ) ( not ( = ?auto_184380 ?auto_184386 ) ) ( not ( = ?auto_184380 ?auto_184387 ) ) ( not ( = ?auto_184381 ?auto_184382 ) ) ( not ( = ?auto_184381 ?auto_184383 ) ) ( not ( = ?auto_184381 ?auto_184384 ) ) ( not ( = ?auto_184381 ?auto_184385 ) ) ( not ( = ?auto_184381 ?auto_184386 ) ) ( not ( = ?auto_184381 ?auto_184387 ) ) ( not ( = ?auto_184382 ?auto_184383 ) ) ( not ( = ?auto_184382 ?auto_184384 ) ) ( not ( = ?auto_184382 ?auto_184385 ) ) ( not ( = ?auto_184382 ?auto_184386 ) ) ( not ( = ?auto_184382 ?auto_184387 ) ) ( not ( = ?auto_184383 ?auto_184384 ) ) ( not ( = ?auto_184383 ?auto_184385 ) ) ( not ( = ?auto_184383 ?auto_184386 ) ) ( not ( = ?auto_184383 ?auto_184387 ) ) ( not ( = ?auto_184384 ?auto_184385 ) ) ( not ( = ?auto_184384 ?auto_184386 ) ) ( not ( = ?auto_184384 ?auto_184387 ) ) ( not ( = ?auto_184385 ?auto_184386 ) ) ( not ( = ?auto_184385 ?auto_184387 ) ) ( not ( = ?auto_184386 ?auto_184387 ) ) ( ON ?auto_184380 ?auto_184388 ) ( not ( = ?auto_184380 ?auto_184388 ) ) ( not ( = ?auto_184381 ?auto_184388 ) ) ( not ( = ?auto_184382 ?auto_184388 ) ) ( not ( = ?auto_184383 ?auto_184388 ) ) ( not ( = ?auto_184384 ?auto_184388 ) ) ( not ( = ?auto_184385 ?auto_184388 ) ) ( not ( = ?auto_184386 ?auto_184388 ) ) ( not ( = ?auto_184387 ?auto_184388 ) ) ( ON ?auto_184381 ?auto_184380 ) ( ON-TABLE ?auto_184388 ) ( ON ?auto_184382 ?auto_184381 ) ( ON ?auto_184383 ?auto_184382 ) ( ON ?auto_184384 ?auto_184383 ) ( ON ?auto_184385 ?auto_184384 ) ( ON ?auto_184386 ?auto_184385 ) ( CLEAR ?auto_184386 ) ( HOLDING ?auto_184387 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_184387 )
      ( MAKE-8PILE ?auto_184380 ?auto_184381 ?auto_184382 ?auto_184383 ?auto_184384 ?auto_184385 ?auto_184386 ?auto_184387 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184389 - BLOCK
      ?auto_184390 - BLOCK
      ?auto_184391 - BLOCK
      ?auto_184392 - BLOCK
      ?auto_184393 - BLOCK
      ?auto_184394 - BLOCK
      ?auto_184395 - BLOCK
      ?auto_184396 - BLOCK
    )
    :vars
    (
      ?auto_184397 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184389 ?auto_184390 ) ) ( not ( = ?auto_184389 ?auto_184391 ) ) ( not ( = ?auto_184389 ?auto_184392 ) ) ( not ( = ?auto_184389 ?auto_184393 ) ) ( not ( = ?auto_184389 ?auto_184394 ) ) ( not ( = ?auto_184389 ?auto_184395 ) ) ( not ( = ?auto_184389 ?auto_184396 ) ) ( not ( = ?auto_184390 ?auto_184391 ) ) ( not ( = ?auto_184390 ?auto_184392 ) ) ( not ( = ?auto_184390 ?auto_184393 ) ) ( not ( = ?auto_184390 ?auto_184394 ) ) ( not ( = ?auto_184390 ?auto_184395 ) ) ( not ( = ?auto_184390 ?auto_184396 ) ) ( not ( = ?auto_184391 ?auto_184392 ) ) ( not ( = ?auto_184391 ?auto_184393 ) ) ( not ( = ?auto_184391 ?auto_184394 ) ) ( not ( = ?auto_184391 ?auto_184395 ) ) ( not ( = ?auto_184391 ?auto_184396 ) ) ( not ( = ?auto_184392 ?auto_184393 ) ) ( not ( = ?auto_184392 ?auto_184394 ) ) ( not ( = ?auto_184392 ?auto_184395 ) ) ( not ( = ?auto_184392 ?auto_184396 ) ) ( not ( = ?auto_184393 ?auto_184394 ) ) ( not ( = ?auto_184393 ?auto_184395 ) ) ( not ( = ?auto_184393 ?auto_184396 ) ) ( not ( = ?auto_184394 ?auto_184395 ) ) ( not ( = ?auto_184394 ?auto_184396 ) ) ( not ( = ?auto_184395 ?auto_184396 ) ) ( ON ?auto_184389 ?auto_184397 ) ( not ( = ?auto_184389 ?auto_184397 ) ) ( not ( = ?auto_184390 ?auto_184397 ) ) ( not ( = ?auto_184391 ?auto_184397 ) ) ( not ( = ?auto_184392 ?auto_184397 ) ) ( not ( = ?auto_184393 ?auto_184397 ) ) ( not ( = ?auto_184394 ?auto_184397 ) ) ( not ( = ?auto_184395 ?auto_184397 ) ) ( not ( = ?auto_184396 ?auto_184397 ) ) ( ON ?auto_184390 ?auto_184389 ) ( ON-TABLE ?auto_184397 ) ( ON ?auto_184391 ?auto_184390 ) ( ON ?auto_184392 ?auto_184391 ) ( ON ?auto_184393 ?auto_184392 ) ( ON ?auto_184394 ?auto_184393 ) ( ON ?auto_184395 ?auto_184394 ) ( ON ?auto_184396 ?auto_184395 ) ( CLEAR ?auto_184396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_184397 ?auto_184389 ?auto_184390 ?auto_184391 ?auto_184392 ?auto_184393 ?auto_184394 ?auto_184395 )
      ( MAKE-8PILE ?auto_184389 ?auto_184390 ?auto_184391 ?auto_184392 ?auto_184393 ?auto_184394 ?auto_184395 ?auto_184396 ) )
  )

)

