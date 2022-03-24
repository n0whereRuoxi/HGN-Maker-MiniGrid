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
      ?auto_571582 - BLOCK
    )
    :vars
    (
      ?auto_571583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_571582 ?auto_571583 ) ( CLEAR ?auto_571582 ) ( HAND-EMPTY ) ( not ( = ?auto_571582 ?auto_571583 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_571582 ?auto_571583 )
      ( !PUTDOWN ?auto_571582 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_571589 - BLOCK
      ?auto_571590 - BLOCK
    )
    :vars
    (
      ?auto_571591 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_571589 ) ( ON ?auto_571590 ?auto_571591 ) ( CLEAR ?auto_571590 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_571589 ) ( not ( = ?auto_571589 ?auto_571590 ) ) ( not ( = ?auto_571589 ?auto_571591 ) ) ( not ( = ?auto_571590 ?auto_571591 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_571590 ?auto_571591 )
      ( !STACK ?auto_571590 ?auto_571589 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_571599 - BLOCK
      ?auto_571600 - BLOCK
    )
    :vars
    (
      ?auto_571601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_571600 ?auto_571601 ) ( not ( = ?auto_571599 ?auto_571600 ) ) ( not ( = ?auto_571599 ?auto_571601 ) ) ( not ( = ?auto_571600 ?auto_571601 ) ) ( ON ?auto_571599 ?auto_571600 ) ( CLEAR ?auto_571599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_571599 )
      ( MAKE-2PILE ?auto_571599 ?auto_571600 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_571610 - BLOCK
      ?auto_571611 - BLOCK
      ?auto_571612 - BLOCK
    )
    :vars
    (
      ?auto_571613 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_571611 ) ( ON ?auto_571612 ?auto_571613 ) ( CLEAR ?auto_571612 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_571610 ) ( ON ?auto_571611 ?auto_571610 ) ( not ( = ?auto_571610 ?auto_571611 ) ) ( not ( = ?auto_571610 ?auto_571612 ) ) ( not ( = ?auto_571610 ?auto_571613 ) ) ( not ( = ?auto_571611 ?auto_571612 ) ) ( not ( = ?auto_571611 ?auto_571613 ) ) ( not ( = ?auto_571612 ?auto_571613 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_571612 ?auto_571613 )
      ( !STACK ?auto_571612 ?auto_571611 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_571624 - BLOCK
      ?auto_571625 - BLOCK
      ?auto_571626 - BLOCK
    )
    :vars
    (
      ?auto_571627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_571626 ?auto_571627 ) ( ON-TABLE ?auto_571624 ) ( not ( = ?auto_571624 ?auto_571625 ) ) ( not ( = ?auto_571624 ?auto_571626 ) ) ( not ( = ?auto_571624 ?auto_571627 ) ) ( not ( = ?auto_571625 ?auto_571626 ) ) ( not ( = ?auto_571625 ?auto_571627 ) ) ( not ( = ?auto_571626 ?auto_571627 ) ) ( CLEAR ?auto_571624 ) ( ON ?auto_571625 ?auto_571626 ) ( CLEAR ?auto_571625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_571624 ?auto_571625 )
      ( MAKE-3PILE ?auto_571624 ?auto_571625 ?auto_571626 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_571638 - BLOCK
      ?auto_571639 - BLOCK
      ?auto_571640 - BLOCK
    )
    :vars
    (
      ?auto_571641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_571640 ?auto_571641 ) ( not ( = ?auto_571638 ?auto_571639 ) ) ( not ( = ?auto_571638 ?auto_571640 ) ) ( not ( = ?auto_571638 ?auto_571641 ) ) ( not ( = ?auto_571639 ?auto_571640 ) ) ( not ( = ?auto_571639 ?auto_571641 ) ) ( not ( = ?auto_571640 ?auto_571641 ) ) ( ON ?auto_571639 ?auto_571640 ) ( ON ?auto_571638 ?auto_571639 ) ( CLEAR ?auto_571638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_571638 )
      ( MAKE-3PILE ?auto_571638 ?auto_571639 ?auto_571640 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_571653 - BLOCK
      ?auto_571654 - BLOCK
      ?auto_571655 - BLOCK
      ?auto_571656 - BLOCK
    )
    :vars
    (
      ?auto_571657 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_571655 ) ( ON ?auto_571656 ?auto_571657 ) ( CLEAR ?auto_571656 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_571653 ) ( ON ?auto_571654 ?auto_571653 ) ( ON ?auto_571655 ?auto_571654 ) ( not ( = ?auto_571653 ?auto_571654 ) ) ( not ( = ?auto_571653 ?auto_571655 ) ) ( not ( = ?auto_571653 ?auto_571656 ) ) ( not ( = ?auto_571653 ?auto_571657 ) ) ( not ( = ?auto_571654 ?auto_571655 ) ) ( not ( = ?auto_571654 ?auto_571656 ) ) ( not ( = ?auto_571654 ?auto_571657 ) ) ( not ( = ?auto_571655 ?auto_571656 ) ) ( not ( = ?auto_571655 ?auto_571657 ) ) ( not ( = ?auto_571656 ?auto_571657 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_571656 ?auto_571657 )
      ( !STACK ?auto_571656 ?auto_571655 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_571671 - BLOCK
      ?auto_571672 - BLOCK
      ?auto_571673 - BLOCK
      ?auto_571674 - BLOCK
    )
    :vars
    (
      ?auto_571675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_571674 ?auto_571675 ) ( ON-TABLE ?auto_571671 ) ( ON ?auto_571672 ?auto_571671 ) ( not ( = ?auto_571671 ?auto_571672 ) ) ( not ( = ?auto_571671 ?auto_571673 ) ) ( not ( = ?auto_571671 ?auto_571674 ) ) ( not ( = ?auto_571671 ?auto_571675 ) ) ( not ( = ?auto_571672 ?auto_571673 ) ) ( not ( = ?auto_571672 ?auto_571674 ) ) ( not ( = ?auto_571672 ?auto_571675 ) ) ( not ( = ?auto_571673 ?auto_571674 ) ) ( not ( = ?auto_571673 ?auto_571675 ) ) ( not ( = ?auto_571674 ?auto_571675 ) ) ( CLEAR ?auto_571672 ) ( ON ?auto_571673 ?auto_571674 ) ( CLEAR ?auto_571673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_571671 ?auto_571672 ?auto_571673 )
      ( MAKE-4PILE ?auto_571671 ?auto_571672 ?auto_571673 ?auto_571674 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_571689 - BLOCK
      ?auto_571690 - BLOCK
      ?auto_571691 - BLOCK
      ?auto_571692 - BLOCK
    )
    :vars
    (
      ?auto_571693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_571692 ?auto_571693 ) ( ON-TABLE ?auto_571689 ) ( not ( = ?auto_571689 ?auto_571690 ) ) ( not ( = ?auto_571689 ?auto_571691 ) ) ( not ( = ?auto_571689 ?auto_571692 ) ) ( not ( = ?auto_571689 ?auto_571693 ) ) ( not ( = ?auto_571690 ?auto_571691 ) ) ( not ( = ?auto_571690 ?auto_571692 ) ) ( not ( = ?auto_571690 ?auto_571693 ) ) ( not ( = ?auto_571691 ?auto_571692 ) ) ( not ( = ?auto_571691 ?auto_571693 ) ) ( not ( = ?auto_571692 ?auto_571693 ) ) ( ON ?auto_571691 ?auto_571692 ) ( CLEAR ?auto_571689 ) ( ON ?auto_571690 ?auto_571691 ) ( CLEAR ?auto_571690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_571689 ?auto_571690 )
      ( MAKE-4PILE ?auto_571689 ?auto_571690 ?auto_571691 ?auto_571692 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_571707 - BLOCK
      ?auto_571708 - BLOCK
      ?auto_571709 - BLOCK
      ?auto_571710 - BLOCK
    )
    :vars
    (
      ?auto_571711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_571710 ?auto_571711 ) ( not ( = ?auto_571707 ?auto_571708 ) ) ( not ( = ?auto_571707 ?auto_571709 ) ) ( not ( = ?auto_571707 ?auto_571710 ) ) ( not ( = ?auto_571707 ?auto_571711 ) ) ( not ( = ?auto_571708 ?auto_571709 ) ) ( not ( = ?auto_571708 ?auto_571710 ) ) ( not ( = ?auto_571708 ?auto_571711 ) ) ( not ( = ?auto_571709 ?auto_571710 ) ) ( not ( = ?auto_571709 ?auto_571711 ) ) ( not ( = ?auto_571710 ?auto_571711 ) ) ( ON ?auto_571709 ?auto_571710 ) ( ON ?auto_571708 ?auto_571709 ) ( ON ?auto_571707 ?auto_571708 ) ( CLEAR ?auto_571707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_571707 )
      ( MAKE-4PILE ?auto_571707 ?auto_571708 ?auto_571709 ?auto_571710 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_571726 - BLOCK
      ?auto_571727 - BLOCK
      ?auto_571728 - BLOCK
      ?auto_571729 - BLOCK
      ?auto_571730 - BLOCK
    )
    :vars
    (
      ?auto_571731 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_571729 ) ( ON ?auto_571730 ?auto_571731 ) ( CLEAR ?auto_571730 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_571726 ) ( ON ?auto_571727 ?auto_571726 ) ( ON ?auto_571728 ?auto_571727 ) ( ON ?auto_571729 ?auto_571728 ) ( not ( = ?auto_571726 ?auto_571727 ) ) ( not ( = ?auto_571726 ?auto_571728 ) ) ( not ( = ?auto_571726 ?auto_571729 ) ) ( not ( = ?auto_571726 ?auto_571730 ) ) ( not ( = ?auto_571726 ?auto_571731 ) ) ( not ( = ?auto_571727 ?auto_571728 ) ) ( not ( = ?auto_571727 ?auto_571729 ) ) ( not ( = ?auto_571727 ?auto_571730 ) ) ( not ( = ?auto_571727 ?auto_571731 ) ) ( not ( = ?auto_571728 ?auto_571729 ) ) ( not ( = ?auto_571728 ?auto_571730 ) ) ( not ( = ?auto_571728 ?auto_571731 ) ) ( not ( = ?auto_571729 ?auto_571730 ) ) ( not ( = ?auto_571729 ?auto_571731 ) ) ( not ( = ?auto_571730 ?auto_571731 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_571730 ?auto_571731 )
      ( !STACK ?auto_571730 ?auto_571729 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_571748 - BLOCK
      ?auto_571749 - BLOCK
      ?auto_571750 - BLOCK
      ?auto_571751 - BLOCK
      ?auto_571752 - BLOCK
    )
    :vars
    (
      ?auto_571753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_571752 ?auto_571753 ) ( ON-TABLE ?auto_571748 ) ( ON ?auto_571749 ?auto_571748 ) ( ON ?auto_571750 ?auto_571749 ) ( not ( = ?auto_571748 ?auto_571749 ) ) ( not ( = ?auto_571748 ?auto_571750 ) ) ( not ( = ?auto_571748 ?auto_571751 ) ) ( not ( = ?auto_571748 ?auto_571752 ) ) ( not ( = ?auto_571748 ?auto_571753 ) ) ( not ( = ?auto_571749 ?auto_571750 ) ) ( not ( = ?auto_571749 ?auto_571751 ) ) ( not ( = ?auto_571749 ?auto_571752 ) ) ( not ( = ?auto_571749 ?auto_571753 ) ) ( not ( = ?auto_571750 ?auto_571751 ) ) ( not ( = ?auto_571750 ?auto_571752 ) ) ( not ( = ?auto_571750 ?auto_571753 ) ) ( not ( = ?auto_571751 ?auto_571752 ) ) ( not ( = ?auto_571751 ?auto_571753 ) ) ( not ( = ?auto_571752 ?auto_571753 ) ) ( CLEAR ?auto_571750 ) ( ON ?auto_571751 ?auto_571752 ) ( CLEAR ?auto_571751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_571748 ?auto_571749 ?auto_571750 ?auto_571751 )
      ( MAKE-5PILE ?auto_571748 ?auto_571749 ?auto_571750 ?auto_571751 ?auto_571752 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_571770 - BLOCK
      ?auto_571771 - BLOCK
      ?auto_571772 - BLOCK
      ?auto_571773 - BLOCK
      ?auto_571774 - BLOCK
    )
    :vars
    (
      ?auto_571775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_571774 ?auto_571775 ) ( ON-TABLE ?auto_571770 ) ( ON ?auto_571771 ?auto_571770 ) ( not ( = ?auto_571770 ?auto_571771 ) ) ( not ( = ?auto_571770 ?auto_571772 ) ) ( not ( = ?auto_571770 ?auto_571773 ) ) ( not ( = ?auto_571770 ?auto_571774 ) ) ( not ( = ?auto_571770 ?auto_571775 ) ) ( not ( = ?auto_571771 ?auto_571772 ) ) ( not ( = ?auto_571771 ?auto_571773 ) ) ( not ( = ?auto_571771 ?auto_571774 ) ) ( not ( = ?auto_571771 ?auto_571775 ) ) ( not ( = ?auto_571772 ?auto_571773 ) ) ( not ( = ?auto_571772 ?auto_571774 ) ) ( not ( = ?auto_571772 ?auto_571775 ) ) ( not ( = ?auto_571773 ?auto_571774 ) ) ( not ( = ?auto_571773 ?auto_571775 ) ) ( not ( = ?auto_571774 ?auto_571775 ) ) ( ON ?auto_571773 ?auto_571774 ) ( CLEAR ?auto_571771 ) ( ON ?auto_571772 ?auto_571773 ) ( CLEAR ?auto_571772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_571770 ?auto_571771 ?auto_571772 )
      ( MAKE-5PILE ?auto_571770 ?auto_571771 ?auto_571772 ?auto_571773 ?auto_571774 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_571792 - BLOCK
      ?auto_571793 - BLOCK
      ?auto_571794 - BLOCK
      ?auto_571795 - BLOCK
      ?auto_571796 - BLOCK
    )
    :vars
    (
      ?auto_571797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_571796 ?auto_571797 ) ( ON-TABLE ?auto_571792 ) ( not ( = ?auto_571792 ?auto_571793 ) ) ( not ( = ?auto_571792 ?auto_571794 ) ) ( not ( = ?auto_571792 ?auto_571795 ) ) ( not ( = ?auto_571792 ?auto_571796 ) ) ( not ( = ?auto_571792 ?auto_571797 ) ) ( not ( = ?auto_571793 ?auto_571794 ) ) ( not ( = ?auto_571793 ?auto_571795 ) ) ( not ( = ?auto_571793 ?auto_571796 ) ) ( not ( = ?auto_571793 ?auto_571797 ) ) ( not ( = ?auto_571794 ?auto_571795 ) ) ( not ( = ?auto_571794 ?auto_571796 ) ) ( not ( = ?auto_571794 ?auto_571797 ) ) ( not ( = ?auto_571795 ?auto_571796 ) ) ( not ( = ?auto_571795 ?auto_571797 ) ) ( not ( = ?auto_571796 ?auto_571797 ) ) ( ON ?auto_571795 ?auto_571796 ) ( ON ?auto_571794 ?auto_571795 ) ( CLEAR ?auto_571792 ) ( ON ?auto_571793 ?auto_571794 ) ( CLEAR ?auto_571793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_571792 ?auto_571793 )
      ( MAKE-5PILE ?auto_571792 ?auto_571793 ?auto_571794 ?auto_571795 ?auto_571796 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_571814 - BLOCK
      ?auto_571815 - BLOCK
      ?auto_571816 - BLOCK
      ?auto_571817 - BLOCK
      ?auto_571818 - BLOCK
    )
    :vars
    (
      ?auto_571819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_571818 ?auto_571819 ) ( not ( = ?auto_571814 ?auto_571815 ) ) ( not ( = ?auto_571814 ?auto_571816 ) ) ( not ( = ?auto_571814 ?auto_571817 ) ) ( not ( = ?auto_571814 ?auto_571818 ) ) ( not ( = ?auto_571814 ?auto_571819 ) ) ( not ( = ?auto_571815 ?auto_571816 ) ) ( not ( = ?auto_571815 ?auto_571817 ) ) ( not ( = ?auto_571815 ?auto_571818 ) ) ( not ( = ?auto_571815 ?auto_571819 ) ) ( not ( = ?auto_571816 ?auto_571817 ) ) ( not ( = ?auto_571816 ?auto_571818 ) ) ( not ( = ?auto_571816 ?auto_571819 ) ) ( not ( = ?auto_571817 ?auto_571818 ) ) ( not ( = ?auto_571817 ?auto_571819 ) ) ( not ( = ?auto_571818 ?auto_571819 ) ) ( ON ?auto_571817 ?auto_571818 ) ( ON ?auto_571816 ?auto_571817 ) ( ON ?auto_571815 ?auto_571816 ) ( ON ?auto_571814 ?auto_571815 ) ( CLEAR ?auto_571814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_571814 )
      ( MAKE-5PILE ?auto_571814 ?auto_571815 ?auto_571816 ?auto_571817 ?auto_571818 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_571837 - BLOCK
      ?auto_571838 - BLOCK
      ?auto_571839 - BLOCK
      ?auto_571840 - BLOCK
      ?auto_571841 - BLOCK
      ?auto_571842 - BLOCK
    )
    :vars
    (
      ?auto_571843 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_571841 ) ( ON ?auto_571842 ?auto_571843 ) ( CLEAR ?auto_571842 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_571837 ) ( ON ?auto_571838 ?auto_571837 ) ( ON ?auto_571839 ?auto_571838 ) ( ON ?auto_571840 ?auto_571839 ) ( ON ?auto_571841 ?auto_571840 ) ( not ( = ?auto_571837 ?auto_571838 ) ) ( not ( = ?auto_571837 ?auto_571839 ) ) ( not ( = ?auto_571837 ?auto_571840 ) ) ( not ( = ?auto_571837 ?auto_571841 ) ) ( not ( = ?auto_571837 ?auto_571842 ) ) ( not ( = ?auto_571837 ?auto_571843 ) ) ( not ( = ?auto_571838 ?auto_571839 ) ) ( not ( = ?auto_571838 ?auto_571840 ) ) ( not ( = ?auto_571838 ?auto_571841 ) ) ( not ( = ?auto_571838 ?auto_571842 ) ) ( not ( = ?auto_571838 ?auto_571843 ) ) ( not ( = ?auto_571839 ?auto_571840 ) ) ( not ( = ?auto_571839 ?auto_571841 ) ) ( not ( = ?auto_571839 ?auto_571842 ) ) ( not ( = ?auto_571839 ?auto_571843 ) ) ( not ( = ?auto_571840 ?auto_571841 ) ) ( not ( = ?auto_571840 ?auto_571842 ) ) ( not ( = ?auto_571840 ?auto_571843 ) ) ( not ( = ?auto_571841 ?auto_571842 ) ) ( not ( = ?auto_571841 ?auto_571843 ) ) ( not ( = ?auto_571842 ?auto_571843 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_571842 ?auto_571843 )
      ( !STACK ?auto_571842 ?auto_571841 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_571863 - BLOCK
      ?auto_571864 - BLOCK
      ?auto_571865 - BLOCK
      ?auto_571866 - BLOCK
      ?auto_571867 - BLOCK
      ?auto_571868 - BLOCK
    )
    :vars
    (
      ?auto_571869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_571868 ?auto_571869 ) ( ON-TABLE ?auto_571863 ) ( ON ?auto_571864 ?auto_571863 ) ( ON ?auto_571865 ?auto_571864 ) ( ON ?auto_571866 ?auto_571865 ) ( not ( = ?auto_571863 ?auto_571864 ) ) ( not ( = ?auto_571863 ?auto_571865 ) ) ( not ( = ?auto_571863 ?auto_571866 ) ) ( not ( = ?auto_571863 ?auto_571867 ) ) ( not ( = ?auto_571863 ?auto_571868 ) ) ( not ( = ?auto_571863 ?auto_571869 ) ) ( not ( = ?auto_571864 ?auto_571865 ) ) ( not ( = ?auto_571864 ?auto_571866 ) ) ( not ( = ?auto_571864 ?auto_571867 ) ) ( not ( = ?auto_571864 ?auto_571868 ) ) ( not ( = ?auto_571864 ?auto_571869 ) ) ( not ( = ?auto_571865 ?auto_571866 ) ) ( not ( = ?auto_571865 ?auto_571867 ) ) ( not ( = ?auto_571865 ?auto_571868 ) ) ( not ( = ?auto_571865 ?auto_571869 ) ) ( not ( = ?auto_571866 ?auto_571867 ) ) ( not ( = ?auto_571866 ?auto_571868 ) ) ( not ( = ?auto_571866 ?auto_571869 ) ) ( not ( = ?auto_571867 ?auto_571868 ) ) ( not ( = ?auto_571867 ?auto_571869 ) ) ( not ( = ?auto_571868 ?auto_571869 ) ) ( CLEAR ?auto_571866 ) ( ON ?auto_571867 ?auto_571868 ) ( CLEAR ?auto_571867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_571863 ?auto_571864 ?auto_571865 ?auto_571866 ?auto_571867 )
      ( MAKE-6PILE ?auto_571863 ?auto_571864 ?auto_571865 ?auto_571866 ?auto_571867 ?auto_571868 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_571889 - BLOCK
      ?auto_571890 - BLOCK
      ?auto_571891 - BLOCK
      ?auto_571892 - BLOCK
      ?auto_571893 - BLOCK
      ?auto_571894 - BLOCK
    )
    :vars
    (
      ?auto_571895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_571894 ?auto_571895 ) ( ON-TABLE ?auto_571889 ) ( ON ?auto_571890 ?auto_571889 ) ( ON ?auto_571891 ?auto_571890 ) ( not ( = ?auto_571889 ?auto_571890 ) ) ( not ( = ?auto_571889 ?auto_571891 ) ) ( not ( = ?auto_571889 ?auto_571892 ) ) ( not ( = ?auto_571889 ?auto_571893 ) ) ( not ( = ?auto_571889 ?auto_571894 ) ) ( not ( = ?auto_571889 ?auto_571895 ) ) ( not ( = ?auto_571890 ?auto_571891 ) ) ( not ( = ?auto_571890 ?auto_571892 ) ) ( not ( = ?auto_571890 ?auto_571893 ) ) ( not ( = ?auto_571890 ?auto_571894 ) ) ( not ( = ?auto_571890 ?auto_571895 ) ) ( not ( = ?auto_571891 ?auto_571892 ) ) ( not ( = ?auto_571891 ?auto_571893 ) ) ( not ( = ?auto_571891 ?auto_571894 ) ) ( not ( = ?auto_571891 ?auto_571895 ) ) ( not ( = ?auto_571892 ?auto_571893 ) ) ( not ( = ?auto_571892 ?auto_571894 ) ) ( not ( = ?auto_571892 ?auto_571895 ) ) ( not ( = ?auto_571893 ?auto_571894 ) ) ( not ( = ?auto_571893 ?auto_571895 ) ) ( not ( = ?auto_571894 ?auto_571895 ) ) ( ON ?auto_571893 ?auto_571894 ) ( CLEAR ?auto_571891 ) ( ON ?auto_571892 ?auto_571893 ) ( CLEAR ?auto_571892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_571889 ?auto_571890 ?auto_571891 ?auto_571892 )
      ( MAKE-6PILE ?auto_571889 ?auto_571890 ?auto_571891 ?auto_571892 ?auto_571893 ?auto_571894 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_571915 - BLOCK
      ?auto_571916 - BLOCK
      ?auto_571917 - BLOCK
      ?auto_571918 - BLOCK
      ?auto_571919 - BLOCK
      ?auto_571920 - BLOCK
    )
    :vars
    (
      ?auto_571921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_571920 ?auto_571921 ) ( ON-TABLE ?auto_571915 ) ( ON ?auto_571916 ?auto_571915 ) ( not ( = ?auto_571915 ?auto_571916 ) ) ( not ( = ?auto_571915 ?auto_571917 ) ) ( not ( = ?auto_571915 ?auto_571918 ) ) ( not ( = ?auto_571915 ?auto_571919 ) ) ( not ( = ?auto_571915 ?auto_571920 ) ) ( not ( = ?auto_571915 ?auto_571921 ) ) ( not ( = ?auto_571916 ?auto_571917 ) ) ( not ( = ?auto_571916 ?auto_571918 ) ) ( not ( = ?auto_571916 ?auto_571919 ) ) ( not ( = ?auto_571916 ?auto_571920 ) ) ( not ( = ?auto_571916 ?auto_571921 ) ) ( not ( = ?auto_571917 ?auto_571918 ) ) ( not ( = ?auto_571917 ?auto_571919 ) ) ( not ( = ?auto_571917 ?auto_571920 ) ) ( not ( = ?auto_571917 ?auto_571921 ) ) ( not ( = ?auto_571918 ?auto_571919 ) ) ( not ( = ?auto_571918 ?auto_571920 ) ) ( not ( = ?auto_571918 ?auto_571921 ) ) ( not ( = ?auto_571919 ?auto_571920 ) ) ( not ( = ?auto_571919 ?auto_571921 ) ) ( not ( = ?auto_571920 ?auto_571921 ) ) ( ON ?auto_571919 ?auto_571920 ) ( ON ?auto_571918 ?auto_571919 ) ( CLEAR ?auto_571916 ) ( ON ?auto_571917 ?auto_571918 ) ( CLEAR ?auto_571917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_571915 ?auto_571916 ?auto_571917 )
      ( MAKE-6PILE ?auto_571915 ?auto_571916 ?auto_571917 ?auto_571918 ?auto_571919 ?auto_571920 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_571941 - BLOCK
      ?auto_571942 - BLOCK
      ?auto_571943 - BLOCK
      ?auto_571944 - BLOCK
      ?auto_571945 - BLOCK
      ?auto_571946 - BLOCK
    )
    :vars
    (
      ?auto_571947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_571946 ?auto_571947 ) ( ON-TABLE ?auto_571941 ) ( not ( = ?auto_571941 ?auto_571942 ) ) ( not ( = ?auto_571941 ?auto_571943 ) ) ( not ( = ?auto_571941 ?auto_571944 ) ) ( not ( = ?auto_571941 ?auto_571945 ) ) ( not ( = ?auto_571941 ?auto_571946 ) ) ( not ( = ?auto_571941 ?auto_571947 ) ) ( not ( = ?auto_571942 ?auto_571943 ) ) ( not ( = ?auto_571942 ?auto_571944 ) ) ( not ( = ?auto_571942 ?auto_571945 ) ) ( not ( = ?auto_571942 ?auto_571946 ) ) ( not ( = ?auto_571942 ?auto_571947 ) ) ( not ( = ?auto_571943 ?auto_571944 ) ) ( not ( = ?auto_571943 ?auto_571945 ) ) ( not ( = ?auto_571943 ?auto_571946 ) ) ( not ( = ?auto_571943 ?auto_571947 ) ) ( not ( = ?auto_571944 ?auto_571945 ) ) ( not ( = ?auto_571944 ?auto_571946 ) ) ( not ( = ?auto_571944 ?auto_571947 ) ) ( not ( = ?auto_571945 ?auto_571946 ) ) ( not ( = ?auto_571945 ?auto_571947 ) ) ( not ( = ?auto_571946 ?auto_571947 ) ) ( ON ?auto_571945 ?auto_571946 ) ( ON ?auto_571944 ?auto_571945 ) ( ON ?auto_571943 ?auto_571944 ) ( CLEAR ?auto_571941 ) ( ON ?auto_571942 ?auto_571943 ) ( CLEAR ?auto_571942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_571941 ?auto_571942 )
      ( MAKE-6PILE ?auto_571941 ?auto_571942 ?auto_571943 ?auto_571944 ?auto_571945 ?auto_571946 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_571967 - BLOCK
      ?auto_571968 - BLOCK
      ?auto_571969 - BLOCK
      ?auto_571970 - BLOCK
      ?auto_571971 - BLOCK
      ?auto_571972 - BLOCK
    )
    :vars
    (
      ?auto_571973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_571972 ?auto_571973 ) ( not ( = ?auto_571967 ?auto_571968 ) ) ( not ( = ?auto_571967 ?auto_571969 ) ) ( not ( = ?auto_571967 ?auto_571970 ) ) ( not ( = ?auto_571967 ?auto_571971 ) ) ( not ( = ?auto_571967 ?auto_571972 ) ) ( not ( = ?auto_571967 ?auto_571973 ) ) ( not ( = ?auto_571968 ?auto_571969 ) ) ( not ( = ?auto_571968 ?auto_571970 ) ) ( not ( = ?auto_571968 ?auto_571971 ) ) ( not ( = ?auto_571968 ?auto_571972 ) ) ( not ( = ?auto_571968 ?auto_571973 ) ) ( not ( = ?auto_571969 ?auto_571970 ) ) ( not ( = ?auto_571969 ?auto_571971 ) ) ( not ( = ?auto_571969 ?auto_571972 ) ) ( not ( = ?auto_571969 ?auto_571973 ) ) ( not ( = ?auto_571970 ?auto_571971 ) ) ( not ( = ?auto_571970 ?auto_571972 ) ) ( not ( = ?auto_571970 ?auto_571973 ) ) ( not ( = ?auto_571971 ?auto_571972 ) ) ( not ( = ?auto_571971 ?auto_571973 ) ) ( not ( = ?auto_571972 ?auto_571973 ) ) ( ON ?auto_571971 ?auto_571972 ) ( ON ?auto_571970 ?auto_571971 ) ( ON ?auto_571969 ?auto_571970 ) ( ON ?auto_571968 ?auto_571969 ) ( ON ?auto_571967 ?auto_571968 ) ( CLEAR ?auto_571967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_571967 )
      ( MAKE-6PILE ?auto_571967 ?auto_571968 ?auto_571969 ?auto_571970 ?auto_571971 ?auto_571972 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_571994 - BLOCK
      ?auto_571995 - BLOCK
      ?auto_571996 - BLOCK
      ?auto_571997 - BLOCK
      ?auto_571998 - BLOCK
      ?auto_571999 - BLOCK
      ?auto_572000 - BLOCK
    )
    :vars
    (
      ?auto_572001 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_571999 ) ( ON ?auto_572000 ?auto_572001 ) ( CLEAR ?auto_572000 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_571994 ) ( ON ?auto_571995 ?auto_571994 ) ( ON ?auto_571996 ?auto_571995 ) ( ON ?auto_571997 ?auto_571996 ) ( ON ?auto_571998 ?auto_571997 ) ( ON ?auto_571999 ?auto_571998 ) ( not ( = ?auto_571994 ?auto_571995 ) ) ( not ( = ?auto_571994 ?auto_571996 ) ) ( not ( = ?auto_571994 ?auto_571997 ) ) ( not ( = ?auto_571994 ?auto_571998 ) ) ( not ( = ?auto_571994 ?auto_571999 ) ) ( not ( = ?auto_571994 ?auto_572000 ) ) ( not ( = ?auto_571994 ?auto_572001 ) ) ( not ( = ?auto_571995 ?auto_571996 ) ) ( not ( = ?auto_571995 ?auto_571997 ) ) ( not ( = ?auto_571995 ?auto_571998 ) ) ( not ( = ?auto_571995 ?auto_571999 ) ) ( not ( = ?auto_571995 ?auto_572000 ) ) ( not ( = ?auto_571995 ?auto_572001 ) ) ( not ( = ?auto_571996 ?auto_571997 ) ) ( not ( = ?auto_571996 ?auto_571998 ) ) ( not ( = ?auto_571996 ?auto_571999 ) ) ( not ( = ?auto_571996 ?auto_572000 ) ) ( not ( = ?auto_571996 ?auto_572001 ) ) ( not ( = ?auto_571997 ?auto_571998 ) ) ( not ( = ?auto_571997 ?auto_571999 ) ) ( not ( = ?auto_571997 ?auto_572000 ) ) ( not ( = ?auto_571997 ?auto_572001 ) ) ( not ( = ?auto_571998 ?auto_571999 ) ) ( not ( = ?auto_571998 ?auto_572000 ) ) ( not ( = ?auto_571998 ?auto_572001 ) ) ( not ( = ?auto_571999 ?auto_572000 ) ) ( not ( = ?auto_571999 ?auto_572001 ) ) ( not ( = ?auto_572000 ?auto_572001 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_572000 ?auto_572001 )
      ( !STACK ?auto_572000 ?auto_571999 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_572024 - BLOCK
      ?auto_572025 - BLOCK
      ?auto_572026 - BLOCK
      ?auto_572027 - BLOCK
      ?auto_572028 - BLOCK
      ?auto_572029 - BLOCK
      ?auto_572030 - BLOCK
    )
    :vars
    (
      ?auto_572031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_572030 ?auto_572031 ) ( ON-TABLE ?auto_572024 ) ( ON ?auto_572025 ?auto_572024 ) ( ON ?auto_572026 ?auto_572025 ) ( ON ?auto_572027 ?auto_572026 ) ( ON ?auto_572028 ?auto_572027 ) ( not ( = ?auto_572024 ?auto_572025 ) ) ( not ( = ?auto_572024 ?auto_572026 ) ) ( not ( = ?auto_572024 ?auto_572027 ) ) ( not ( = ?auto_572024 ?auto_572028 ) ) ( not ( = ?auto_572024 ?auto_572029 ) ) ( not ( = ?auto_572024 ?auto_572030 ) ) ( not ( = ?auto_572024 ?auto_572031 ) ) ( not ( = ?auto_572025 ?auto_572026 ) ) ( not ( = ?auto_572025 ?auto_572027 ) ) ( not ( = ?auto_572025 ?auto_572028 ) ) ( not ( = ?auto_572025 ?auto_572029 ) ) ( not ( = ?auto_572025 ?auto_572030 ) ) ( not ( = ?auto_572025 ?auto_572031 ) ) ( not ( = ?auto_572026 ?auto_572027 ) ) ( not ( = ?auto_572026 ?auto_572028 ) ) ( not ( = ?auto_572026 ?auto_572029 ) ) ( not ( = ?auto_572026 ?auto_572030 ) ) ( not ( = ?auto_572026 ?auto_572031 ) ) ( not ( = ?auto_572027 ?auto_572028 ) ) ( not ( = ?auto_572027 ?auto_572029 ) ) ( not ( = ?auto_572027 ?auto_572030 ) ) ( not ( = ?auto_572027 ?auto_572031 ) ) ( not ( = ?auto_572028 ?auto_572029 ) ) ( not ( = ?auto_572028 ?auto_572030 ) ) ( not ( = ?auto_572028 ?auto_572031 ) ) ( not ( = ?auto_572029 ?auto_572030 ) ) ( not ( = ?auto_572029 ?auto_572031 ) ) ( not ( = ?auto_572030 ?auto_572031 ) ) ( CLEAR ?auto_572028 ) ( ON ?auto_572029 ?auto_572030 ) ( CLEAR ?auto_572029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_572024 ?auto_572025 ?auto_572026 ?auto_572027 ?auto_572028 ?auto_572029 )
      ( MAKE-7PILE ?auto_572024 ?auto_572025 ?auto_572026 ?auto_572027 ?auto_572028 ?auto_572029 ?auto_572030 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_572054 - BLOCK
      ?auto_572055 - BLOCK
      ?auto_572056 - BLOCK
      ?auto_572057 - BLOCK
      ?auto_572058 - BLOCK
      ?auto_572059 - BLOCK
      ?auto_572060 - BLOCK
    )
    :vars
    (
      ?auto_572061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_572060 ?auto_572061 ) ( ON-TABLE ?auto_572054 ) ( ON ?auto_572055 ?auto_572054 ) ( ON ?auto_572056 ?auto_572055 ) ( ON ?auto_572057 ?auto_572056 ) ( not ( = ?auto_572054 ?auto_572055 ) ) ( not ( = ?auto_572054 ?auto_572056 ) ) ( not ( = ?auto_572054 ?auto_572057 ) ) ( not ( = ?auto_572054 ?auto_572058 ) ) ( not ( = ?auto_572054 ?auto_572059 ) ) ( not ( = ?auto_572054 ?auto_572060 ) ) ( not ( = ?auto_572054 ?auto_572061 ) ) ( not ( = ?auto_572055 ?auto_572056 ) ) ( not ( = ?auto_572055 ?auto_572057 ) ) ( not ( = ?auto_572055 ?auto_572058 ) ) ( not ( = ?auto_572055 ?auto_572059 ) ) ( not ( = ?auto_572055 ?auto_572060 ) ) ( not ( = ?auto_572055 ?auto_572061 ) ) ( not ( = ?auto_572056 ?auto_572057 ) ) ( not ( = ?auto_572056 ?auto_572058 ) ) ( not ( = ?auto_572056 ?auto_572059 ) ) ( not ( = ?auto_572056 ?auto_572060 ) ) ( not ( = ?auto_572056 ?auto_572061 ) ) ( not ( = ?auto_572057 ?auto_572058 ) ) ( not ( = ?auto_572057 ?auto_572059 ) ) ( not ( = ?auto_572057 ?auto_572060 ) ) ( not ( = ?auto_572057 ?auto_572061 ) ) ( not ( = ?auto_572058 ?auto_572059 ) ) ( not ( = ?auto_572058 ?auto_572060 ) ) ( not ( = ?auto_572058 ?auto_572061 ) ) ( not ( = ?auto_572059 ?auto_572060 ) ) ( not ( = ?auto_572059 ?auto_572061 ) ) ( not ( = ?auto_572060 ?auto_572061 ) ) ( ON ?auto_572059 ?auto_572060 ) ( CLEAR ?auto_572057 ) ( ON ?auto_572058 ?auto_572059 ) ( CLEAR ?auto_572058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_572054 ?auto_572055 ?auto_572056 ?auto_572057 ?auto_572058 )
      ( MAKE-7PILE ?auto_572054 ?auto_572055 ?auto_572056 ?auto_572057 ?auto_572058 ?auto_572059 ?auto_572060 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_572084 - BLOCK
      ?auto_572085 - BLOCK
      ?auto_572086 - BLOCK
      ?auto_572087 - BLOCK
      ?auto_572088 - BLOCK
      ?auto_572089 - BLOCK
      ?auto_572090 - BLOCK
    )
    :vars
    (
      ?auto_572091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_572090 ?auto_572091 ) ( ON-TABLE ?auto_572084 ) ( ON ?auto_572085 ?auto_572084 ) ( ON ?auto_572086 ?auto_572085 ) ( not ( = ?auto_572084 ?auto_572085 ) ) ( not ( = ?auto_572084 ?auto_572086 ) ) ( not ( = ?auto_572084 ?auto_572087 ) ) ( not ( = ?auto_572084 ?auto_572088 ) ) ( not ( = ?auto_572084 ?auto_572089 ) ) ( not ( = ?auto_572084 ?auto_572090 ) ) ( not ( = ?auto_572084 ?auto_572091 ) ) ( not ( = ?auto_572085 ?auto_572086 ) ) ( not ( = ?auto_572085 ?auto_572087 ) ) ( not ( = ?auto_572085 ?auto_572088 ) ) ( not ( = ?auto_572085 ?auto_572089 ) ) ( not ( = ?auto_572085 ?auto_572090 ) ) ( not ( = ?auto_572085 ?auto_572091 ) ) ( not ( = ?auto_572086 ?auto_572087 ) ) ( not ( = ?auto_572086 ?auto_572088 ) ) ( not ( = ?auto_572086 ?auto_572089 ) ) ( not ( = ?auto_572086 ?auto_572090 ) ) ( not ( = ?auto_572086 ?auto_572091 ) ) ( not ( = ?auto_572087 ?auto_572088 ) ) ( not ( = ?auto_572087 ?auto_572089 ) ) ( not ( = ?auto_572087 ?auto_572090 ) ) ( not ( = ?auto_572087 ?auto_572091 ) ) ( not ( = ?auto_572088 ?auto_572089 ) ) ( not ( = ?auto_572088 ?auto_572090 ) ) ( not ( = ?auto_572088 ?auto_572091 ) ) ( not ( = ?auto_572089 ?auto_572090 ) ) ( not ( = ?auto_572089 ?auto_572091 ) ) ( not ( = ?auto_572090 ?auto_572091 ) ) ( ON ?auto_572089 ?auto_572090 ) ( ON ?auto_572088 ?auto_572089 ) ( CLEAR ?auto_572086 ) ( ON ?auto_572087 ?auto_572088 ) ( CLEAR ?auto_572087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_572084 ?auto_572085 ?auto_572086 ?auto_572087 )
      ( MAKE-7PILE ?auto_572084 ?auto_572085 ?auto_572086 ?auto_572087 ?auto_572088 ?auto_572089 ?auto_572090 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_572114 - BLOCK
      ?auto_572115 - BLOCK
      ?auto_572116 - BLOCK
      ?auto_572117 - BLOCK
      ?auto_572118 - BLOCK
      ?auto_572119 - BLOCK
      ?auto_572120 - BLOCK
    )
    :vars
    (
      ?auto_572121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_572120 ?auto_572121 ) ( ON-TABLE ?auto_572114 ) ( ON ?auto_572115 ?auto_572114 ) ( not ( = ?auto_572114 ?auto_572115 ) ) ( not ( = ?auto_572114 ?auto_572116 ) ) ( not ( = ?auto_572114 ?auto_572117 ) ) ( not ( = ?auto_572114 ?auto_572118 ) ) ( not ( = ?auto_572114 ?auto_572119 ) ) ( not ( = ?auto_572114 ?auto_572120 ) ) ( not ( = ?auto_572114 ?auto_572121 ) ) ( not ( = ?auto_572115 ?auto_572116 ) ) ( not ( = ?auto_572115 ?auto_572117 ) ) ( not ( = ?auto_572115 ?auto_572118 ) ) ( not ( = ?auto_572115 ?auto_572119 ) ) ( not ( = ?auto_572115 ?auto_572120 ) ) ( not ( = ?auto_572115 ?auto_572121 ) ) ( not ( = ?auto_572116 ?auto_572117 ) ) ( not ( = ?auto_572116 ?auto_572118 ) ) ( not ( = ?auto_572116 ?auto_572119 ) ) ( not ( = ?auto_572116 ?auto_572120 ) ) ( not ( = ?auto_572116 ?auto_572121 ) ) ( not ( = ?auto_572117 ?auto_572118 ) ) ( not ( = ?auto_572117 ?auto_572119 ) ) ( not ( = ?auto_572117 ?auto_572120 ) ) ( not ( = ?auto_572117 ?auto_572121 ) ) ( not ( = ?auto_572118 ?auto_572119 ) ) ( not ( = ?auto_572118 ?auto_572120 ) ) ( not ( = ?auto_572118 ?auto_572121 ) ) ( not ( = ?auto_572119 ?auto_572120 ) ) ( not ( = ?auto_572119 ?auto_572121 ) ) ( not ( = ?auto_572120 ?auto_572121 ) ) ( ON ?auto_572119 ?auto_572120 ) ( ON ?auto_572118 ?auto_572119 ) ( ON ?auto_572117 ?auto_572118 ) ( CLEAR ?auto_572115 ) ( ON ?auto_572116 ?auto_572117 ) ( CLEAR ?auto_572116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_572114 ?auto_572115 ?auto_572116 )
      ( MAKE-7PILE ?auto_572114 ?auto_572115 ?auto_572116 ?auto_572117 ?auto_572118 ?auto_572119 ?auto_572120 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_572144 - BLOCK
      ?auto_572145 - BLOCK
      ?auto_572146 - BLOCK
      ?auto_572147 - BLOCK
      ?auto_572148 - BLOCK
      ?auto_572149 - BLOCK
      ?auto_572150 - BLOCK
    )
    :vars
    (
      ?auto_572151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_572150 ?auto_572151 ) ( ON-TABLE ?auto_572144 ) ( not ( = ?auto_572144 ?auto_572145 ) ) ( not ( = ?auto_572144 ?auto_572146 ) ) ( not ( = ?auto_572144 ?auto_572147 ) ) ( not ( = ?auto_572144 ?auto_572148 ) ) ( not ( = ?auto_572144 ?auto_572149 ) ) ( not ( = ?auto_572144 ?auto_572150 ) ) ( not ( = ?auto_572144 ?auto_572151 ) ) ( not ( = ?auto_572145 ?auto_572146 ) ) ( not ( = ?auto_572145 ?auto_572147 ) ) ( not ( = ?auto_572145 ?auto_572148 ) ) ( not ( = ?auto_572145 ?auto_572149 ) ) ( not ( = ?auto_572145 ?auto_572150 ) ) ( not ( = ?auto_572145 ?auto_572151 ) ) ( not ( = ?auto_572146 ?auto_572147 ) ) ( not ( = ?auto_572146 ?auto_572148 ) ) ( not ( = ?auto_572146 ?auto_572149 ) ) ( not ( = ?auto_572146 ?auto_572150 ) ) ( not ( = ?auto_572146 ?auto_572151 ) ) ( not ( = ?auto_572147 ?auto_572148 ) ) ( not ( = ?auto_572147 ?auto_572149 ) ) ( not ( = ?auto_572147 ?auto_572150 ) ) ( not ( = ?auto_572147 ?auto_572151 ) ) ( not ( = ?auto_572148 ?auto_572149 ) ) ( not ( = ?auto_572148 ?auto_572150 ) ) ( not ( = ?auto_572148 ?auto_572151 ) ) ( not ( = ?auto_572149 ?auto_572150 ) ) ( not ( = ?auto_572149 ?auto_572151 ) ) ( not ( = ?auto_572150 ?auto_572151 ) ) ( ON ?auto_572149 ?auto_572150 ) ( ON ?auto_572148 ?auto_572149 ) ( ON ?auto_572147 ?auto_572148 ) ( ON ?auto_572146 ?auto_572147 ) ( CLEAR ?auto_572144 ) ( ON ?auto_572145 ?auto_572146 ) ( CLEAR ?auto_572145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_572144 ?auto_572145 )
      ( MAKE-7PILE ?auto_572144 ?auto_572145 ?auto_572146 ?auto_572147 ?auto_572148 ?auto_572149 ?auto_572150 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_572174 - BLOCK
      ?auto_572175 - BLOCK
      ?auto_572176 - BLOCK
      ?auto_572177 - BLOCK
      ?auto_572178 - BLOCK
      ?auto_572179 - BLOCK
      ?auto_572180 - BLOCK
    )
    :vars
    (
      ?auto_572181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_572180 ?auto_572181 ) ( not ( = ?auto_572174 ?auto_572175 ) ) ( not ( = ?auto_572174 ?auto_572176 ) ) ( not ( = ?auto_572174 ?auto_572177 ) ) ( not ( = ?auto_572174 ?auto_572178 ) ) ( not ( = ?auto_572174 ?auto_572179 ) ) ( not ( = ?auto_572174 ?auto_572180 ) ) ( not ( = ?auto_572174 ?auto_572181 ) ) ( not ( = ?auto_572175 ?auto_572176 ) ) ( not ( = ?auto_572175 ?auto_572177 ) ) ( not ( = ?auto_572175 ?auto_572178 ) ) ( not ( = ?auto_572175 ?auto_572179 ) ) ( not ( = ?auto_572175 ?auto_572180 ) ) ( not ( = ?auto_572175 ?auto_572181 ) ) ( not ( = ?auto_572176 ?auto_572177 ) ) ( not ( = ?auto_572176 ?auto_572178 ) ) ( not ( = ?auto_572176 ?auto_572179 ) ) ( not ( = ?auto_572176 ?auto_572180 ) ) ( not ( = ?auto_572176 ?auto_572181 ) ) ( not ( = ?auto_572177 ?auto_572178 ) ) ( not ( = ?auto_572177 ?auto_572179 ) ) ( not ( = ?auto_572177 ?auto_572180 ) ) ( not ( = ?auto_572177 ?auto_572181 ) ) ( not ( = ?auto_572178 ?auto_572179 ) ) ( not ( = ?auto_572178 ?auto_572180 ) ) ( not ( = ?auto_572178 ?auto_572181 ) ) ( not ( = ?auto_572179 ?auto_572180 ) ) ( not ( = ?auto_572179 ?auto_572181 ) ) ( not ( = ?auto_572180 ?auto_572181 ) ) ( ON ?auto_572179 ?auto_572180 ) ( ON ?auto_572178 ?auto_572179 ) ( ON ?auto_572177 ?auto_572178 ) ( ON ?auto_572176 ?auto_572177 ) ( ON ?auto_572175 ?auto_572176 ) ( ON ?auto_572174 ?auto_572175 ) ( CLEAR ?auto_572174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_572174 )
      ( MAKE-7PILE ?auto_572174 ?auto_572175 ?auto_572176 ?auto_572177 ?auto_572178 ?auto_572179 ?auto_572180 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_572205 - BLOCK
      ?auto_572206 - BLOCK
      ?auto_572207 - BLOCK
      ?auto_572208 - BLOCK
      ?auto_572209 - BLOCK
      ?auto_572210 - BLOCK
      ?auto_572211 - BLOCK
      ?auto_572212 - BLOCK
    )
    :vars
    (
      ?auto_572213 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_572211 ) ( ON ?auto_572212 ?auto_572213 ) ( CLEAR ?auto_572212 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_572205 ) ( ON ?auto_572206 ?auto_572205 ) ( ON ?auto_572207 ?auto_572206 ) ( ON ?auto_572208 ?auto_572207 ) ( ON ?auto_572209 ?auto_572208 ) ( ON ?auto_572210 ?auto_572209 ) ( ON ?auto_572211 ?auto_572210 ) ( not ( = ?auto_572205 ?auto_572206 ) ) ( not ( = ?auto_572205 ?auto_572207 ) ) ( not ( = ?auto_572205 ?auto_572208 ) ) ( not ( = ?auto_572205 ?auto_572209 ) ) ( not ( = ?auto_572205 ?auto_572210 ) ) ( not ( = ?auto_572205 ?auto_572211 ) ) ( not ( = ?auto_572205 ?auto_572212 ) ) ( not ( = ?auto_572205 ?auto_572213 ) ) ( not ( = ?auto_572206 ?auto_572207 ) ) ( not ( = ?auto_572206 ?auto_572208 ) ) ( not ( = ?auto_572206 ?auto_572209 ) ) ( not ( = ?auto_572206 ?auto_572210 ) ) ( not ( = ?auto_572206 ?auto_572211 ) ) ( not ( = ?auto_572206 ?auto_572212 ) ) ( not ( = ?auto_572206 ?auto_572213 ) ) ( not ( = ?auto_572207 ?auto_572208 ) ) ( not ( = ?auto_572207 ?auto_572209 ) ) ( not ( = ?auto_572207 ?auto_572210 ) ) ( not ( = ?auto_572207 ?auto_572211 ) ) ( not ( = ?auto_572207 ?auto_572212 ) ) ( not ( = ?auto_572207 ?auto_572213 ) ) ( not ( = ?auto_572208 ?auto_572209 ) ) ( not ( = ?auto_572208 ?auto_572210 ) ) ( not ( = ?auto_572208 ?auto_572211 ) ) ( not ( = ?auto_572208 ?auto_572212 ) ) ( not ( = ?auto_572208 ?auto_572213 ) ) ( not ( = ?auto_572209 ?auto_572210 ) ) ( not ( = ?auto_572209 ?auto_572211 ) ) ( not ( = ?auto_572209 ?auto_572212 ) ) ( not ( = ?auto_572209 ?auto_572213 ) ) ( not ( = ?auto_572210 ?auto_572211 ) ) ( not ( = ?auto_572210 ?auto_572212 ) ) ( not ( = ?auto_572210 ?auto_572213 ) ) ( not ( = ?auto_572211 ?auto_572212 ) ) ( not ( = ?auto_572211 ?auto_572213 ) ) ( not ( = ?auto_572212 ?auto_572213 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_572212 ?auto_572213 )
      ( !STACK ?auto_572212 ?auto_572211 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_572239 - BLOCK
      ?auto_572240 - BLOCK
      ?auto_572241 - BLOCK
      ?auto_572242 - BLOCK
      ?auto_572243 - BLOCK
      ?auto_572244 - BLOCK
      ?auto_572245 - BLOCK
      ?auto_572246 - BLOCK
    )
    :vars
    (
      ?auto_572247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_572246 ?auto_572247 ) ( ON-TABLE ?auto_572239 ) ( ON ?auto_572240 ?auto_572239 ) ( ON ?auto_572241 ?auto_572240 ) ( ON ?auto_572242 ?auto_572241 ) ( ON ?auto_572243 ?auto_572242 ) ( ON ?auto_572244 ?auto_572243 ) ( not ( = ?auto_572239 ?auto_572240 ) ) ( not ( = ?auto_572239 ?auto_572241 ) ) ( not ( = ?auto_572239 ?auto_572242 ) ) ( not ( = ?auto_572239 ?auto_572243 ) ) ( not ( = ?auto_572239 ?auto_572244 ) ) ( not ( = ?auto_572239 ?auto_572245 ) ) ( not ( = ?auto_572239 ?auto_572246 ) ) ( not ( = ?auto_572239 ?auto_572247 ) ) ( not ( = ?auto_572240 ?auto_572241 ) ) ( not ( = ?auto_572240 ?auto_572242 ) ) ( not ( = ?auto_572240 ?auto_572243 ) ) ( not ( = ?auto_572240 ?auto_572244 ) ) ( not ( = ?auto_572240 ?auto_572245 ) ) ( not ( = ?auto_572240 ?auto_572246 ) ) ( not ( = ?auto_572240 ?auto_572247 ) ) ( not ( = ?auto_572241 ?auto_572242 ) ) ( not ( = ?auto_572241 ?auto_572243 ) ) ( not ( = ?auto_572241 ?auto_572244 ) ) ( not ( = ?auto_572241 ?auto_572245 ) ) ( not ( = ?auto_572241 ?auto_572246 ) ) ( not ( = ?auto_572241 ?auto_572247 ) ) ( not ( = ?auto_572242 ?auto_572243 ) ) ( not ( = ?auto_572242 ?auto_572244 ) ) ( not ( = ?auto_572242 ?auto_572245 ) ) ( not ( = ?auto_572242 ?auto_572246 ) ) ( not ( = ?auto_572242 ?auto_572247 ) ) ( not ( = ?auto_572243 ?auto_572244 ) ) ( not ( = ?auto_572243 ?auto_572245 ) ) ( not ( = ?auto_572243 ?auto_572246 ) ) ( not ( = ?auto_572243 ?auto_572247 ) ) ( not ( = ?auto_572244 ?auto_572245 ) ) ( not ( = ?auto_572244 ?auto_572246 ) ) ( not ( = ?auto_572244 ?auto_572247 ) ) ( not ( = ?auto_572245 ?auto_572246 ) ) ( not ( = ?auto_572245 ?auto_572247 ) ) ( not ( = ?auto_572246 ?auto_572247 ) ) ( CLEAR ?auto_572244 ) ( ON ?auto_572245 ?auto_572246 ) ( CLEAR ?auto_572245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_572239 ?auto_572240 ?auto_572241 ?auto_572242 ?auto_572243 ?auto_572244 ?auto_572245 )
      ( MAKE-8PILE ?auto_572239 ?auto_572240 ?auto_572241 ?auto_572242 ?auto_572243 ?auto_572244 ?auto_572245 ?auto_572246 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_572273 - BLOCK
      ?auto_572274 - BLOCK
      ?auto_572275 - BLOCK
      ?auto_572276 - BLOCK
      ?auto_572277 - BLOCK
      ?auto_572278 - BLOCK
      ?auto_572279 - BLOCK
      ?auto_572280 - BLOCK
    )
    :vars
    (
      ?auto_572281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_572280 ?auto_572281 ) ( ON-TABLE ?auto_572273 ) ( ON ?auto_572274 ?auto_572273 ) ( ON ?auto_572275 ?auto_572274 ) ( ON ?auto_572276 ?auto_572275 ) ( ON ?auto_572277 ?auto_572276 ) ( not ( = ?auto_572273 ?auto_572274 ) ) ( not ( = ?auto_572273 ?auto_572275 ) ) ( not ( = ?auto_572273 ?auto_572276 ) ) ( not ( = ?auto_572273 ?auto_572277 ) ) ( not ( = ?auto_572273 ?auto_572278 ) ) ( not ( = ?auto_572273 ?auto_572279 ) ) ( not ( = ?auto_572273 ?auto_572280 ) ) ( not ( = ?auto_572273 ?auto_572281 ) ) ( not ( = ?auto_572274 ?auto_572275 ) ) ( not ( = ?auto_572274 ?auto_572276 ) ) ( not ( = ?auto_572274 ?auto_572277 ) ) ( not ( = ?auto_572274 ?auto_572278 ) ) ( not ( = ?auto_572274 ?auto_572279 ) ) ( not ( = ?auto_572274 ?auto_572280 ) ) ( not ( = ?auto_572274 ?auto_572281 ) ) ( not ( = ?auto_572275 ?auto_572276 ) ) ( not ( = ?auto_572275 ?auto_572277 ) ) ( not ( = ?auto_572275 ?auto_572278 ) ) ( not ( = ?auto_572275 ?auto_572279 ) ) ( not ( = ?auto_572275 ?auto_572280 ) ) ( not ( = ?auto_572275 ?auto_572281 ) ) ( not ( = ?auto_572276 ?auto_572277 ) ) ( not ( = ?auto_572276 ?auto_572278 ) ) ( not ( = ?auto_572276 ?auto_572279 ) ) ( not ( = ?auto_572276 ?auto_572280 ) ) ( not ( = ?auto_572276 ?auto_572281 ) ) ( not ( = ?auto_572277 ?auto_572278 ) ) ( not ( = ?auto_572277 ?auto_572279 ) ) ( not ( = ?auto_572277 ?auto_572280 ) ) ( not ( = ?auto_572277 ?auto_572281 ) ) ( not ( = ?auto_572278 ?auto_572279 ) ) ( not ( = ?auto_572278 ?auto_572280 ) ) ( not ( = ?auto_572278 ?auto_572281 ) ) ( not ( = ?auto_572279 ?auto_572280 ) ) ( not ( = ?auto_572279 ?auto_572281 ) ) ( not ( = ?auto_572280 ?auto_572281 ) ) ( ON ?auto_572279 ?auto_572280 ) ( CLEAR ?auto_572277 ) ( ON ?auto_572278 ?auto_572279 ) ( CLEAR ?auto_572278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_572273 ?auto_572274 ?auto_572275 ?auto_572276 ?auto_572277 ?auto_572278 )
      ( MAKE-8PILE ?auto_572273 ?auto_572274 ?auto_572275 ?auto_572276 ?auto_572277 ?auto_572278 ?auto_572279 ?auto_572280 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_572307 - BLOCK
      ?auto_572308 - BLOCK
      ?auto_572309 - BLOCK
      ?auto_572310 - BLOCK
      ?auto_572311 - BLOCK
      ?auto_572312 - BLOCK
      ?auto_572313 - BLOCK
      ?auto_572314 - BLOCK
    )
    :vars
    (
      ?auto_572315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_572314 ?auto_572315 ) ( ON-TABLE ?auto_572307 ) ( ON ?auto_572308 ?auto_572307 ) ( ON ?auto_572309 ?auto_572308 ) ( ON ?auto_572310 ?auto_572309 ) ( not ( = ?auto_572307 ?auto_572308 ) ) ( not ( = ?auto_572307 ?auto_572309 ) ) ( not ( = ?auto_572307 ?auto_572310 ) ) ( not ( = ?auto_572307 ?auto_572311 ) ) ( not ( = ?auto_572307 ?auto_572312 ) ) ( not ( = ?auto_572307 ?auto_572313 ) ) ( not ( = ?auto_572307 ?auto_572314 ) ) ( not ( = ?auto_572307 ?auto_572315 ) ) ( not ( = ?auto_572308 ?auto_572309 ) ) ( not ( = ?auto_572308 ?auto_572310 ) ) ( not ( = ?auto_572308 ?auto_572311 ) ) ( not ( = ?auto_572308 ?auto_572312 ) ) ( not ( = ?auto_572308 ?auto_572313 ) ) ( not ( = ?auto_572308 ?auto_572314 ) ) ( not ( = ?auto_572308 ?auto_572315 ) ) ( not ( = ?auto_572309 ?auto_572310 ) ) ( not ( = ?auto_572309 ?auto_572311 ) ) ( not ( = ?auto_572309 ?auto_572312 ) ) ( not ( = ?auto_572309 ?auto_572313 ) ) ( not ( = ?auto_572309 ?auto_572314 ) ) ( not ( = ?auto_572309 ?auto_572315 ) ) ( not ( = ?auto_572310 ?auto_572311 ) ) ( not ( = ?auto_572310 ?auto_572312 ) ) ( not ( = ?auto_572310 ?auto_572313 ) ) ( not ( = ?auto_572310 ?auto_572314 ) ) ( not ( = ?auto_572310 ?auto_572315 ) ) ( not ( = ?auto_572311 ?auto_572312 ) ) ( not ( = ?auto_572311 ?auto_572313 ) ) ( not ( = ?auto_572311 ?auto_572314 ) ) ( not ( = ?auto_572311 ?auto_572315 ) ) ( not ( = ?auto_572312 ?auto_572313 ) ) ( not ( = ?auto_572312 ?auto_572314 ) ) ( not ( = ?auto_572312 ?auto_572315 ) ) ( not ( = ?auto_572313 ?auto_572314 ) ) ( not ( = ?auto_572313 ?auto_572315 ) ) ( not ( = ?auto_572314 ?auto_572315 ) ) ( ON ?auto_572313 ?auto_572314 ) ( ON ?auto_572312 ?auto_572313 ) ( CLEAR ?auto_572310 ) ( ON ?auto_572311 ?auto_572312 ) ( CLEAR ?auto_572311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_572307 ?auto_572308 ?auto_572309 ?auto_572310 ?auto_572311 )
      ( MAKE-8PILE ?auto_572307 ?auto_572308 ?auto_572309 ?auto_572310 ?auto_572311 ?auto_572312 ?auto_572313 ?auto_572314 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_572341 - BLOCK
      ?auto_572342 - BLOCK
      ?auto_572343 - BLOCK
      ?auto_572344 - BLOCK
      ?auto_572345 - BLOCK
      ?auto_572346 - BLOCK
      ?auto_572347 - BLOCK
      ?auto_572348 - BLOCK
    )
    :vars
    (
      ?auto_572349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_572348 ?auto_572349 ) ( ON-TABLE ?auto_572341 ) ( ON ?auto_572342 ?auto_572341 ) ( ON ?auto_572343 ?auto_572342 ) ( not ( = ?auto_572341 ?auto_572342 ) ) ( not ( = ?auto_572341 ?auto_572343 ) ) ( not ( = ?auto_572341 ?auto_572344 ) ) ( not ( = ?auto_572341 ?auto_572345 ) ) ( not ( = ?auto_572341 ?auto_572346 ) ) ( not ( = ?auto_572341 ?auto_572347 ) ) ( not ( = ?auto_572341 ?auto_572348 ) ) ( not ( = ?auto_572341 ?auto_572349 ) ) ( not ( = ?auto_572342 ?auto_572343 ) ) ( not ( = ?auto_572342 ?auto_572344 ) ) ( not ( = ?auto_572342 ?auto_572345 ) ) ( not ( = ?auto_572342 ?auto_572346 ) ) ( not ( = ?auto_572342 ?auto_572347 ) ) ( not ( = ?auto_572342 ?auto_572348 ) ) ( not ( = ?auto_572342 ?auto_572349 ) ) ( not ( = ?auto_572343 ?auto_572344 ) ) ( not ( = ?auto_572343 ?auto_572345 ) ) ( not ( = ?auto_572343 ?auto_572346 ) ) ( not ( = ?auto_572343 ?auto_572347 ) ) ( not ( = ?auto_572343 ?auto_572348 ) ) ( not ( = ?auto_572343 ?auto_572349 ) ) ( not ( = ?auto_572344 ?auto_572345 ) ) ( not ( = ?auto_572344 ?auto_572346 ) ) ( not ( = ?auto_572344 ?auto_572347 ) ) ( not ( = ?auto_572344 ?auto_572348 ) ) ( not ( = ?auto_572344 ?auto_572349 ) ) ( not ( = ?auto_572345 ?auto_572346 ) ) ( not ( = ?auto_572345 ?auto_572347 ) ) ( not ( = ?auto_572345 ?auto_572348 ) ) ( not ( = ?auto_572345 ?auto_572349 ) ) ( not ( = ?auto_572346 ?auto_572347 ) ) ( not ( = ?auto_572346 ?auto_572348 ) ) ( not ( = ?auto_572346 ?auto_572349 ) ) ( not ( = ?auto_572347 ?auto_572348 ) ) ( not ( = ?auto_572347 ?auto_572349 ) ) ( not ( = ?auto_572348 ?auto_572349 ) ) ( ON ?auto_572347 ?auto_572348 ) ( ON ?auto_572346 ?auto_572347 ) ( ON ?auto_572345 ?auto_572346 ) ( CLEAR ?auto_572343 ) ( ON ?auto_572344 ?auto_572345 ) ( CLEAR ?auto_572344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_572341 ?auto_572342 ?auto_572343 ?auto_572344 )
      ( MAKE-8PILE ?auto_572341 ?auto_572342 ?auto_572343 ?auto_572344 ?auto_572345 ?auto_572346 ?auto_572347 ?auto_572348 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_572375 - BLOCK
      ?auto_572376 - BLOCK
      ?auto_572377 - BLOCK
      ?auto_572378 - BLOCK
      ?auto_572379 - BLOCK
      ?auto_572380 - BLOCK
      ?auto_572381 - BLOCK
      ?auto_572382 - BLOCK
    )
    :vars
    (
      ?auto_572383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_572382 ?auto_572383 ) ( ON-TABLE ?auto_572375 ) ( ON ?auto_572376 ?auto_572375 ) ( not ( = ?auto_572375 ?auto_572376 ) ) ( not ( = ?auto_572375 ?auto_572377 ) ) ( not ( = ?auto_572375 ?auto_572378 ) ) ( not ( = ?auto_572375 ?auto_572379 ) ) ( not ( = ?auto_572375 ?auto_572380 ) ) ( not ( = ?auto_572375 ?auto_572381 ) ) ( not ( = ?auto_572375 ?auto_572382 ) ) ( not ( = ?auto_572375 ?auto_572383 ) ) ( not ( = ?auto_572376 ?auto_572377 ) ) ( not ( = ?auto_572376 ?auto_572378 ) ) ( not ( = ?auto_572376 ?auto_572379 ) ) ( not ( = ?auto_572376 ?auto_572380 ) ) ( not ( = ?auto_572376 ?auto_572381 ) ) ( not ( = ?auto_572376 ?auto_572382 ) ) ( not ( = ?auto_572376 ?auto_572383 ) ) ( not ( = ?auto_572377 ?auto_572378 ) ) ( not ( = ?auto_572377 ?auto_572379 ) ) ( not ( = ?auto_572377 ?auto_572380 ) ) ( not ( = ?auto_572377 ?auto_572381 ) ) ( not ( = ?auto_572377 ?auto_572382 ) ) ( not ( = ?auto_572377 ?auto_572383 ) ) ( not ( = ?auto_572378 ?auto_572379 ) ) ( not ( = ?auto_572378 ?auto_572380 ) ) ( not ( = ?auto_572378 ?auto_572381 ) ) ( not ( = ?auto_572378 ?auto_572382 ) ) ( not ( = ?auto_572378 ?auto_572383 ) ) ( not ( = ?auto_572379 ?auto_572380 ) ) ( not ( = ?auto_572379 ?auto_572381 ) ) ( not ( = ?auto_572379 ?auto_572382 ) ) ( not ( = ?auto_572379 ?auto_572383 ) ) ( not ( = ?auto_572380 ?auto_572381 ) ) ( not ( = ?auto_572380 ?auto_572382 ) ) ( not ( = ?auto_572380 ?auto_572383 ) ) ( not ( = ?auto_572381 ?auto_572382 ) ) ( not ( = ?auto_572381 ?auto_572383 ) ) ( not ( = ?auto_572382 ?auto_572383 ) ) ( ON ?auto_572381 ?auto_572382 ) ( ON ?auto_572380 ?auto_572381 ) ( ON ?auto_572379 ?auto_572380 ) ( ON ?auto_572378 ?auto_572379 ) ( CLEAR ?auto_572376 ) ( ON ?auto_572377 ?auto_572378 ) ( CLEAR ?auto_572377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_572375 ?auto_572376 ?auto_572377 )
      ( MAKE-8PILE ?auto_572375 ?auto_572376 ?auto_572377 ?auto_572378 ?auto_572379 ?auto_572380 ?auto_572381 ?auto_572382 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_572409 - BLOCK
      ?auto_572410 - BLOCK
      ?auto_572411 - BLOCK
      ?auto_572412 - BLOCK
      ?auto_572413 - BLOCK
      ?auto_572414 - BLOCK
      ?auto_572415 - BLOCK
      ?auto_572416 - BLOCK
    )
    :vars
    (
      ?auto_572417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_572416 ?auto_572417 ) ( ON-TABLE ?auto_572409 ) ( not ( = ?auto_572409 ?auto_572410 ) ) ( not ( = ?auto_572409 ?auto_572411 ) ) ( not ( = ?auto_572409 ?auto_572412 ) ) ( not ( = ?auto_572409 ?auto_572413 ) ) ( not ( = ?auto_572409 ?auto_572414 ) ) ( not ( = ?auto_572409 ?auto_572415 ) ) ( not ( = ?auto_572409 ?auto_572416 ) ) ( not ( = ?auto_572409 ?auto_572417 ) ) ( not ( = ?auto_572410 ?auto_572411 ) ) ( not ( = ?auto_572410 ?auto_572412 ) ) ( not ( = ?auto_572410 ?auto_572413 ) ) ( not ( = ?auto_572410 ?auto_572414 ) ) ( not ( = ?auto_572410 ?auto_572415 ) ) ( not ( = ?auto_572410 ?auto_572416 ) ) ( not ( = ?auto_572410 ?auto_572417 ) ) ( not ( = ?auto_572411 ?auto_572412 ) ) ( not ( = ?auto_572411 ?auto_572413 ) ) ( not ( = ?auto_572411 ?auto_572414 ) ) ( not ( = ?auto_572411 ?auto_572415 ) ) ( not ( = ?auto_572411 ?auto_572416 ) ) ( not ( = ?auto_572411 ?auto_572417 ) ) ( not ( = ?auto_572412 ?auto_572413 ) ) ( not ( = ?auto_572412 ?auto_572414 ) ) ( not ( = ?auto_572412 ?auto_572415 ) ) ( not ( = ?auto_572412 ?auto_572416 ) ) ( not ( = ?auto_572412 ?auto_572417 ) ) ( not ( = ?auto_572413 ?auto_572414 ) ) ( not ( = ?auto_572413 ?auto_572415 ) ) ( not ( = ?auto_572413 ?auto_572416 ) ) ( not ( = ?auto_572413 ?auto_572417 ) ) ( not ( = ?auto_572414 ?auto_572415 ) ) ( not ( = ?auto_572414 ?auto_572416 ) ) ( not ( = ?auto_572414 ?auto_572417 ) ) ( not ( = ?auto_572415 ?auto_572416 ) ) ( not ( = ?auto_572415 ?auto_572417 ) ) ( not ( = ?auto_572416 ?auto_572417 ) ) ( ON ?auto_572415 ?auto_572416 ) ( ON ?auto_572414 ?auto_572415 ) ( ON ?auto_572413 ?auto_572414 ) ( ON ?auto_572412 ?auto_572413 ) ( ON ?auto_572411 ?auto_572412 ) ( CLEAR ?auto_572409 ) ( ON ?auto_572410 ?auto_572411 ) ( CLEAR ?auto_572410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_572409 ?auto_572410 )
      ( MAKE-8PILE ?auto_572409 ?auto_572410 ?auto_572411 ?auto_572412 ?auto_572413 ?auto_572414 ?auto_572415 ?auto_572416 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_572443 - BLOCK
      ?auto_572444 - BLOCK
      ?auto_572445 - BLOCK
      ?auto_572446 - BLOCK
      ?auto_572447 - BLOCK
      ?auto_572448 - BLOCK
      ?auto_572449 - BLOCK
      ?auto_572450 - BLOCK
    )
    :vars
    (
      ?auto_572451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_572450 ?auto_572451 ) ( not ( = ?auto_572443 ?auto_572444 ) ) ( not ( = ?auto_572443 ?auto_572445 ) ) ( not ( = ?auto_572443 ?auto_572446 ) ) ( not ( = ?auto_572443 ?auto_572447 ) ) ( not ( = ?auto_572443 ?auto_572448 ) ) ( not ( = ?auto_572443 ?auto_572449 ) ) ( not ( = ?auto_572443 ?auto_572450 ) ) ( not ( = ?auto_572443 ?auto_572451 ) ) ( not ( = ?auto_572444 ?auto_572445 ) ) ( not ( = ?auto_572444 ?auto_572446 ) ) ( not ( = ?auto_572444 ?auto_572447 ) ) ( not ( = ?auto_572444 ?auto_572448 ) ) ( not ( = ?auto_572444 ?auto_572449 ) ) ( not ( = ?auto_572444 ?auto_572450 ) ) ( not ( = ?auto_572444 ?auto_572451 ) ) ( not ( = ?auto_572445 ?auto_572446 ) ) ( not ( = ?auto_572445 ?auto_572447 ) ) ( not ( = ?auto_572445 ?auto_572448 ) ) ( not ( = ?auto_572445 ?auto_572449 ) ) ( not ( = ?auto_572445 ?auto_572450 ) ) ( not ( = ?auto_572445 ?auto_572451 ) ) ( not ( = ?auto_572446 ?auto_572447 ) ) ( not ( = ?auto_572446 ?auto_572448 ) ) ( not ( = ?auto_572446 ?auto_572449 ) ) ( not ( = ?auto_572446 ?auto_572450 ) ) ( not ( = ?auto_572446 ?auto_572451 ) ) ( not ( = ?auto_572447 ?auto_572448 ) ) ( not ( = ?auto_572447 ?auto_572449 ) ) ( not ( = ?auto_572447 ?auto_572450 ) ) ( not ( = ?auto_572447 ?auto_572451 ) ) ( not ( = ?auto_572448 ?auto_572449 ) ) ( not ( = ?auto_572448 ?auto_572450 ) ) ( not ( = ?auto_572448 ?auto_572451 ) ) ( not ( = ?auto_572449 ?auto_572450 ) ) ( not ( = ?auto_572449 ?auto_572451 ) ) ( not ( = ?auto_572450 ?auto_572451 ) ) ( ON ?auto_572449 ?auto_572450 ) ( ON ?auto_572448 ?auto_572449 ) ( ON ?auto_572447 ?auto_572448 ) ( ON ?auto_572446 ?auto_572447 ) ( ON ?auto_572445 ?auto_572446 ) ( ON ?auto_572444 ?auto_572445 ) ( ON ?auto_572443 ?auto_572444 ) ( CLEAR ?auto_572443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_572443 )
      ( MAKE-8PILE ?auto_572443 ?auto_572444 ?auto_572445 ?auto_572446 ?auto_572447 ?auto_572448 ?auto_572449 ?auto_572450 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_572478 - BLOCK
      ?auto_572479 - BLOCK
      ?auto_572480 - BLOCK
      ?auto_572481 - BLOCK
      ?auto_572482 - BLOCK
      ?auto_572483 - BLOCK
      ?auto_572484 - BLOCK
      ?auto_572485 - BLOCK
      ?auto_572486 - BLOCK
    )
    :vars
    (
      ?auto_572487 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_572485 ) ( ON ?auto_572486 ?auto_572487 ) ( CLEAR ?auto_572486 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_572478 ) ( ON ?auto_572479 ?auto_572478 ) ( ON ?auto_572480 ?auto_572479 ) ( ON ?auto_572481 ?auto_572480 ) ( ON ?auto_572482 ?auto_572481 ) ( ON ?auto_572483 ?auto_572482 ) ( ON ?auto_572484 ?auto_572483 ) ( ON ?auto_572485 ?auto_572484 ) ( not ( = ?auto_572478 ?auto_572479 ) ) ( not ( = ?auto_572478 ?auto_572480 ) ) ( not ( = ?auto_572478 ?auto_572481 ) ) ( not ( = ?auto_572478 ?auto_572482 ) ) ( not ( = ?auto_572478 ?auto_572483 ) ) ( not ( = ?auto_572478 ?auto_572484 ) ) ( not ( = ?auto_572478 ?auto_572485 ) ) ( not ( = ?auto_572478 ?auto_572486 ) ) ( not ( = ?auto_572478 ?auto_572487 ) ) ( not ( = ?auto_572479 ?auto_572480 ) ) ( not ( = ?auto_572479 ?auto_572481 ) ) ( not ( = ?auto_572479 ?auto_572482 ) ) ( not ( = ?auto_572479 ?auto_572483 ) ) ( not ( = ?auto_572479 ?auto_572484 ) ) ( not ( = ?auto_572479 ?auto_572485 ) ) ( not ( = ?auto_572479 ?auto_572486 ) ) ( not ( = ?auto_572479 ?auto_572487 ) ) ( not ( = ?auto_572480 ?auto_572481 ) ) ( not ( = ?auto_572480 ?auto_572482 ) ) ( not ( = ?auto_572480 ?auto_572483 ) ) ( not ( = ?auto_572480 ?auto_572484 ) ) ( not ( = ?auto_572480 ?auto_572485 ) ) ( not ( = ?auto_572480 ?auto_572486 ) ) ( not ( = ?auto_572480 ?auto_572487 ) ) ( not ( = ?auto_572481 ?auto_572482 ) ) ( not ( = ?auto_572481 ?auto_572483 ) ) ( not ( = ?auto_572481 ?auto_572484 ) ) ( not ( = ?auto_572481 ?auto_572485 ) ) ( not ( = ?auto_572481 ?auto_572486 ) ) ( not ( = ?auto_572481 ?auto_572487 ) ) ( not ( = ?auto_572482 ?auto_572483 ) ) ( not ( = ?auto_572482 ?auto_572484 ) ) ( not ( = ?auto_572482 ?auto_572485 ) ) ( not ( = ?auto_572482 ?auto_572486 ) ) ( not ( = ?auto_572482 ?auto_572487 ) ) ( not ( = ?auto_572483 ?auto_572484 ) ) ( not ( = ?auto_572483 ?auto_572485 ) ) ( not ( = ?auto_572483 ?auto_572486 ) ) ( not ( = ?auto_572483 ?auto_572487 ) ) ( not ( = ?auto_572484 ?auto_572485 ) ) ( not ( = ?auto_572484 ?auto_572486 ) ) ( not ( = ?auto_572484 ?auto_572487 ) ) ( not ( = ?auto_572485 ?auto_572486 ) ) ( not ( = ?auto_572485 ?auto_572487 ) ) ( not ( = ?auto_572486 ?auto_572487 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_572486 ?auto_572487 )
      ( !STACK ?auto_572486 ?auto_572485 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_572516 - BLOCK
      ?auto_572517 - BLOCK
      ?auto_572518 - BLOCK
      ?auto_572519 - BLOCK
      ?auto_572520 - BLOCK
      ?auto_572521 - BLOCK
      ?auto_572522 - BLOCK
      ?auto_572523 - BLOCK
      ?auto_572524 - BLOCK
    )
    :vars
    (
      ?auto_572525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_572524 ?auto_572525 ) ( ON-TABLE ?auto_572516 ) ( ON ?auto_572517 ?auto_572516 ) ( ON ?auto_572518 ?auto_572517 ) ( ON ?auto_572519 ?auto_572518 ) ( ON ?auto_572520 ?auto_572519 ) ( ON ?auto_572521 ?auto_572520 ) ( ON ?auto_572522 ?auto_572521 ) ( not ( = ?auto_572516 ?auto_572517 ) ) ( not ( = ?auto_572516 ?auto_572518 ) ) ( not ( = ?auto_572516 ?auto_572519 ) ) ( not ( = ?auto_572516 ?auto_572520 ) ) ( not ( = ?auto_572516 ?auto_572521 ) ) ( not ( = ?auto_572516 ?auto_572522 ) ) ( not ( = ?auto_572516 ?auto_572523 ) ) ( not ( = ?auto_572516 ?auto_572524 ) ) ( not ( = ?auto_572516 ?auto_572525 ) ) ( not ( = ?auto_572517 ?auto_572518 ) ) ( not ( = ?auto_572517 ?auto_572519 ) ) ( not ( = ?auto_572517 ?auto_572520 ) ) ( not ( = ?auto_572517 ?auto_572521 ) ) ( not ( = ?auto_572517 ?auto_572522 ) ) ( not ( = ?auto_572517 ?auto_572523 ) ) ( not ( = ?auto_572517 ?auto_572524 ) ) ( not ( = ?auto_572517 ?auto_572525 ) ) ( not ( = ?auto_572518 ?auto_572519 ) ) ( not ( = ?auto_572518 ?auto_572520 ) ) ( not ( = ?auto_572518 ?auto_572521 ) ) ( not ( = ?auto_572518 ?auto_572522 ) ) ( not ( = ?auto_572518 ?auto_572523 ) ) ( not ( = ?auto_572518 ?auto_572524 ) ) ( not ( = ?auto_572518 ?auto_572525 ) ) ( not ( = ?auto_572519 ?auto_572520 ) ) ( not ( = ?auto_572519 ?auto_572521 ) ) ( not ( = ?auto_572519 ?auto_572522 ) ) ( not ( = ?auto_572519 ?auto_572523 ) ) ( not ( = ?auto_572519 ?auto_572524 ) ) ( not ( = ?auto_572519 ?auto_572525 ) ) ( not ( = ?auto_572520 ?auto_572521 ) ) ( not ( = ?auto_572520 ?auto_572522 ) ) ( not ( = ?auto_572520 ?auto_572523 ) ) ( not ( = ?auto_572520 ?auto_572524 ) ) ( not ( = ?auto_572520 ?auto_572525 ) ) ( not ( = ?auto_572521 ?auto_572522 ) ) ( not ( = ?auto_572521 ?auto_572523 ) ) ( not ( = ?auto_572521 ?auto_572524 ) ) ( not ( = ?auto_572521 ?auto_572525 ) ) ( not ( = ?auto_572522 ?auto_572523 ) ) ( not ( = ?auto_572522 ?auto_572524 ) ) ( not ( = ?auto_572522 ?auto_572525 ) ) ( not ( = ?auto_572523 ?auto_572524 ) ) ( not ( = ?auto_572523 ?auto_572525 ) ) ( not ( = ?auto_572524 ?auto_572525 ) ) ( CLEAR ?auto_572522 ) ( ON ?auto_572523 ?auto_572524 ) ( CLEAR ?auto_572523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_572516 ?auto_572517 ?auto_572518 ?auto_572519 ?auto_572520 ?auto_572521 ?auto_572522 ?auto_572523 )
      ( MAKE-9PILE ?auto_572516 ?auto_572517 ?auto_572518 ?auto_572519 ?auto_572520 ?auto_572521 ?auto_572522 ?auto_572523 ?auto_572524 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_572554 - BLOCK
      ?auto_572555 - BLOCK
      ?auto_572556 - BLOCK
      ?auto_572557 - BLOCK
      ?auto_572558 - BLOCK
      ?auto_572559 - BLOCK
      ?auto_572560 - BLOCK
      ?auto_572561 - BLOCK
      ?auto_572562 - BLOCK
    )
    :vars
    (
      ?auto_572563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_572562 ?auto_572563 ) ( ON-TABLE ?auto_572554 ) ( ON ?auto_572555 ?auto_572554 ) ( ON ?auto_572556 ?auto_572555 ) ( ON ?auto_572557 ?auto_572556 ) ( ON ?auto_572558 ?auto_572557 ) ( ON ?auto_572559 ?auto_572558 ) ( not ( = ?auto_572554 ?auto_572555 ) ) ( not ( = ?auto_572554 ?auto_572556 ) ) ( not ( = ?auto_572554 ?auto_572557 ) ) ( not ( = ?auto_572554 ?auto_572558 ) ) ( not ( = ?auto_572554 ?auto_572559 ) ) ( not ( = ?auto_572554 ?auto_572560 ) ) ( not ( = ?auto_572554 ?auto_572561 ) ) ( not ( = ?auto_572554 ?auto_572562 ) ) ( not ( = ?auto_572554 ?auto_572563 ) ) ( not ( = ?auto_572555 ?auto_572556 ) ) ( not ( = ?auto_572555 ?auto_572557 ) ) ( not ( = ?auto_572555 ?auto_572558 ) ) ( not ( = ?auto_572555 ?auto_572559 ) ) ( not ( = ?auto_572555 ?auto_572560 ) ) ( not ( = ?auto_572555 ?auto_572561 ) ) ( not ( = ?auto_572555 ?auto_572562 ) ) ( not ( = ?auto_572555 ?auto_572563 ) ) ( not ( = ?auto_572556 ?auto_572557 ) ) ( not ( = ?auto_572556 ?auto_572558 ) ) ( not ( = ?auto_572556 ?auto_572559 ) ) ( not ( = ?auto_572556 ?auto_572560 ) ) ( not ( = ?auto_572556 ?auto_572561 ) ) ( not ( = ?auto_572556 ?auto_572562 ) ) ( not ( = ?auto_572556 ?auto_572563 ) ) ( not ( = ?auto_572557 ?auto_572558 ) ) ( not ( = ?auto_572557 ?auto_572559 ) ) ( not ( = ?auto_572557 ?auto_572560 ) ) ( not ( = ?auto_572557 ?auto_572561 ) ) ( not ( = ?auto_572557 ?auto_572562 ) ) ( not ( = ?auto_572557 ?auto_572563 ) ) ( not ( = ?auto_572558 ?auto_572559 ) ) ( not ( = ?auto_572558 ?auto_572560 ) ) ( not ( = ?auto_572558 ?auto_572561 ) ) ( not ( = ?auto_572558 ?auto_572562 ) ) ( not ( = ?auto_572558 ?auto_572563 ) ) ( not ( = ?auto_572559 ?auto_572560 ) ) ( not ( = ?auto_572559 ?auto_572561 ) ) ( not ( = ?auto_572559 ?auto_572562 ) ) ( not ( = ?auto_572559 ?auto_572563 ) ) ( not ( = ?auto_572560 ?auto_572561 ) ) ( not ( = ?auto_572560 ?auto_572562 ) ) ( not ( = ?auto_572560 ?auto_572563 ) ) ( not ( = ?auto_572561 ?auto_572562 ) ) ( not ( = ?auto_572561 ?auto_572563 ) ) ( not ( = ?auto_572562 ?auto_572563 ) ) ( ON ?auto_572561 ?auto_572562 ) ( CLEAR ?auto_572559 ) ( ON ?auto_572560 ?auto_572561 ) ( CLEAR ?auto_572560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_572554 ?auto_572555 ?auto_572556 ?auto_572557 ?auto_572558 ?auto_572559 ?auto_572560 )
      ( MAKE-9PILE ?auto_572554 ?auto_572555 ?auto_572556 ?auto_572557 ?auto_572558 ?auto_572559 ?auto_572560 ?auto_572561 ?auto_572562 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_572592 - BLOCK
      ?auto_572593 - BLOCK
      ?auto_572594 - BLOCK
      ?auto_572595 - BLOCK
      ?auto_572596 - BLOCK
      ?auto_572597 - BLOCK
      ?auto_572598 - BLOCK
      ?auto_572599 - BLOCK
      ?auto_572600 - BLOCK
    )
    :vars
    (
      ?auto_572601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_572600 ?auto_572601 ) ( ON-TABLE ?auto_572592 ) ( ON ?auto_572593 ?auto_572592 ) ( ON ?auto_572594 ?auto_572593 ) ( ON ?auto_572595 ?auto_572594 ) ( ON ?auto_572596 ?auto_572595 ) ( not ( = ?auto_572592 ?auto_572593 ) ) ( not ( = ?auto_572592 ?auto_572594 ) ) ( not ( = ?auto_572592 ?auto_572595 ) ) ( not ( = ?auto_572592 ?auto_572596 ) ) ( not ( = ?auto_572592 ?auto_572597 ) ) ( not ( = ?auto_572592 ?auto_572598 ) ) ( not ( = ?auto_572592 ?auto_572599 ) ) ( not ( = ?auto_572592 ?auto_572600 ) ) ( not ( = ?auto_572592 ?auto_572601 ) ) ( not ( = ?auto_572593 ?auto_572594 ) ) ( not ( = ?auto_572593 ?auto_572595 ) ) ( not ( = ?auto_572593 ?auto_572596 ) ) ( not ( = ?auto_572593 ?auto_572597 ) ) ( not ( = ?auto_572593 ?auto_572598 ) ) ( not ( = ?auto_572593 ?auto_572599 ) ) ( not ( = ?auto_572593 ?auto_572600 ) ) ( not ( = ?auto_572593 ?auto_572601 ) ) ( not ( = ?auto_572594 ?auto_572595 ) ) ( not ( = ?auto_572594 ?auto_572596 ) ) ( not ( = ?auto_572594 ?auto_572597 ) ) ( not ( = ?auto_572594 ?auto_572598 ) ) ( not ( = ?auto_572594 ?auto_572599 ) ) ( not ( = ?auto_572594 ?auto_572600 ) ) ( not ( = ?auto_572594 ?auto_572601 ) ) ( not ( = ?auto_572595 ?auto_572596 ) ) ( not ( = ?auto_572595 ?auto_572597 ) ) ( not ( = ?auto_572595 ?auto_572598 ) ) ( not ( = ?auto_572595 ?auto_572599 ) ) ( not ( = ?auto_572595 ?auto_572600 ) ) ( not ( = ?auto_572595 ?auto_572601 ) ) ( not ( = ?auto_572596 ?auto_572597 ) ) ( not ( = ?auto_572596 ?auto_572598 ) ) ( not ( = ?auto_572596 ?auto_572599 ) ) ( not ( = ?auto_572596 ?auto_572600 ) ) ( not ( = ?auto_572596 ?auto_572601 ) ) ( not ( = ?auto_572597 ?auto_572598 ) ) ( not ( = ?auto_572597 ?auto_572599 ) ) ( not ( = ?auto_572597 ?auto_572600 ) ) ( not ( = ?auto_572597 ?auto_572601 ) ) ( not ( = ?auto_572598 ?auto_572599 ) ) ( not ( = ?auto_572598 ?auto_572600 ) ) ( not ( = ?auto_572598 ?auto_572601 ) ) ( not ( = ?auto_572599 ?auto_572600 ) ) ( not ( = ?auto_572599 ?auto_572601 ) ) ( not ( = ?auto_572600 ?auto_572601 ) ) ( ON ?auto_572599 ?auto_572600 ) ( ON ?auto_572598 ?auto_572599 ) ( CLEAR ?auto_572596 ) ( ON ?auto_572597 ?auto_572598 ) ( CLEAR ?auto_572597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_572592 ?auto_572593 ?auto_572594 ?auto_572595 ?auto_572596 ?auto_572597 )
      ( MAKE-9PILE ?auto_572592 ?auto_572593 ?auto_572594 ?auto_572595 ?auto_572596 ?auto_572597 ?auto_572598 ?auto_572599 ?auto_572600 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_572630 - BLOCK
      ?auto_572631 - BLOCK
      ?auto_572632 - BLOCK
      ?auto_572633 - BLOCK
      ?auto_572634 - BLOCK
      ?auto_572635 - BLOCK
      ?auto_572636 - BLOCK
      ?auto_572637 - BLOCK
      ?auto_572638 - BLOCK
    )
    :vars
    (
      ?auto_572639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_572638 ?auto_572639 ) ( ON-TABLE ?auto_572630 ) ( ON ?auto_572631 ?auto_572630 ) ( ON ?auto_572632 ?auto_572631 ) ( ON ?auto_572633 ?auto_572632 ) ( not ( = ?auto_572630 ?auto_572631 ) ) ( not ( = ?auto_572630 ?auto_572632 ) ) ( not ( = ?auto_572630 ?auto_572633 ) ) ( not ( = ?auto_572630 ?auto_572634 ) ) ( not ( = ?auto_572630 ?auto_572635 ) ) ( not ( = ?auto_572630 ?auto_572636 ) ) ( not ( = ?auto_572630 ?auto_572637 ) ) ( not ( = ?auto_572630 ?auto_572638 ) ) ( not ( = ?auto_572630 ?auto_572639 ) ) ( not ( = ?auto_572631 ?auto_572632 ) ) ( not ( = ?auto_572631 ?auto_572633 ) ) ( not ( = ?auto_572631 ?auto_572634 ) ) ( not ( = ?auto_572631 ?auto_572635 ) ) ( not ( = ?auto_572631 ?auto_572636 ) ) ( not ( = ?auto_572631 ?auto_572637 ) ) ( not ( = ?auto_572631 ?auto_572638 ) ) ( not ( = ?auto_572631 ?auto_572639 ) ) ( not ( = ?auto_572632 ?auto_572633 ) ) ( not ( = ?auto_572632 ?auto_572634 ) ) ( not ( = ?auto_572632 ?auto_572635 ) ) ( not ( = ?auto_572632 ?auto_572636 ) ) ( not ( = ?auto_572632 ?auto_572637 ) ) ( not ( = ?auto_572632 ?auto_572638 ) ) ( not ( = ?auto_572632 ?auto_572639 ) ) ( not ( = ?auto_572633 ?auto_572634 ) ) ( not ( = ?auto_572633 ?auto_572635 ) ) ( not ( = ?auto_572633 ?auto_572636 ) ) ( not ( = ?auto_572633 ?auto_572637 ) ) ( not ( = ?auto_572633 ?auto_572638 ) ) ( not ( = ?auto_572633 ?auto_572639 ) ) ( not ( = ?auto_572634 ?auto_572635 ) ) ( not ( = ?auto_572634 ?auto_572636 ) ) ( not ( = ?auto_572634 ?auto_572637 ) ) ( not ( = ?auto_572634 ?auto_572638 ) ) ( not ( = ?auto_572634 ?auto_572639 ) ) ( not ( = ?auto_572635 ?auto_572636 ) ) ( not ( = ?auto_572635 ?auto_572637 ) ) ( not ( = ?auto_572635 ?auto_572638 ) ) ( not ( = ?auto_572635 ?auto_572639 ) ) ( not ( = ?auto_572636 ?auto_572637 ) ) ( not ( = ?auto_572636 ?auto_572638 ) ) ( not ( = ?auto_572636 ?auto_572639 ) ) ( not ( = ?auto_572637 ?auto_572638 ) ) ( not ( = ?auto_572637 ?auto_572639 ) ) ( not ( = ?auto_572638 ?auto_572639 ) ) ( ON ?auto_572637 ?auto_572638 ) ( ON ?auto_572636 ?auto_572637 ) ( ON ?auto_572635 ?auto_572636 ) ( CLEAR ?auto_572633 ) ( ON ?auto_572634 ?auto_572635 ) ( CLEAR ?auto_572634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_572630 ?auto_572631 ?auto_572632 ?auto_572633 ?auto_572634 )
      ( MAKE-9PILE ?auto_572630 ?auto_572631 ?auto_572632 ?auto_572633 ?auto_572634 ?auto_572635 ?auto_572636 ?auto_572637 ?auto_572638 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_572668 - BLOCK
      ?auto_572669 - BLOCK
      ?auto_572670 - BLOCK
      ?auto_572671 - BLOCK
      ?auto_572672 - BLOCK
      ?auto_572673 - BLOCK
      ?auto_572674 - BLOCK
      ?auto_572675 - BLOCK
      ?auto_572676 - BLOCK
    )
    :vars
    (
      ?auto_572677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_572676 ?auto_572677 ) ( ON-TABLE ?auto_572668 ) ( ON ?auto_572669 ?auto_572668 ) ( ON ?auto_572670 ?auto_572669 ) ( not ( = ?auto_572668 ?auto_572669 ) ) ( not ( = ?auto_572668 ?auto_572670 ) ) ( not ( = ?auto_572668 ?auto_572671 ) ) ( not ( = ?auto_572668 ?auto_572672 ) ) ( not ( = ?auto_572668 ?auto_572673 ) ) ( not ( = ?auto_572668 ?auto_572674 ) ) ( not ( = ?auto_572668 ?auto_572675 ) ) ( not ( = ?auto_572668 ?auto_572676 ) ) ( not ( = ?auto_572668 ?auto_572677 ) ) ( not ( = ?auto_572669 ?auto_572670 ) ) ( not ( = ?auto_572669 ?auto_572671 ) ) ( not ( = ?auto_572669 ?auto_572672 ) ) ( not ( = ?auto_572669 ?auto_572673 ) ) ( not ( = ?auto_572669 ?auto_572674 ) ) ( not ( = ?auto_572669 ?auto_572675 ) ) ( not ( = ?auto_572669 ?auto_572676 ) ) ( not ( = ?auto_572669 ?auto_572677 ) ) ( not ( = ?auto_572670 ?auto_572671 ) ) ( not ( = ?auto_572670 ?auto_572672 ) ) ( not ( = ?auto_572670 ?auto_572673 ) ) ( not ( = ?auto_572670 ?auto_572674 ) ) ( not ( = ?auto_572670 ?auto_572675 ) ) ( not ( = ?auto_572670 ?auto_572676 ) ) ( not ( = ?auto_572670 ?auto_572677 ) ) ( not ( = ?auto_572671 ?auto_572672 ) ) ( not ( = ?auto_572671 ?auto_572673 ) ) ( not ( = ?auto_572671 ?auto_572674 ) ) ( not ( = ?auto_572671 ?auto_572675 ) ) ( not ( = ?auto_572671 ?auto_572676 ) ) ( not ( = ?auto_572671 ?auto_572677 ) ) ( not ( = ?auto_572672 ?auto_572673 ) ) ( not ( = ?auto_572672 ?auto_572674 ) ) ( not ( = ?auto_572672 ?auto_572675 ) ) ( not ( = ?auto_572672 ?auto_572676 ) ) ( not ( = ?auto_572672 ?auto_572677 ) ) ( not ( = ?auto_572673 ?auto_572674 ) ) ( not ( = ?auto_572673 ?auto_572675 ) ) ( not ( = ?auto_572673 ?auto_572676 ) ) ( not ( = ?auto_572673 ?auto_572677 ) ) ( not ( = ?auto_572674 ?auto_572675 ) ) ( not ( = ?auto_572674 ?auto_572676 ) ) ( not ( = ?auto_572674 ?auto_572677 ) ) ( not ( = ?auto_572675 ?auto_572676 ) ) ( not ( = ?auto_572675 ?auto_572677 ) ) ( not ( = ?auto_572676 ?auto_572677 ) ) ( ON ?auto_572675 ?auto_572676 ) ( ON ?auto_572674 ?auto_572675 ) ( ON ?auto_572673 ?auto_572674 ) ( ON ?auto_572672 ?auto_572673 ) ( CLEAR ?auto_572670 ) ( ON ?auto_572671 ?auto_572672 ) ( CLEAR ?auto_572671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_572668 ?auto_572669 ?auto_572670 ?auto_572671 )
      ( MAKE-9PILE ?auto_572668 ?auto_572669 ?auto_572670 ?auto_572671 ?auto_572672 ?auto_572673 ?auto_572674 ?auto_572675 ?auto_572676 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_572706 - BLOCK
      ?auto_572707 - BLOCK
      ?auto_572708 - BLOCK
      ?auto_572709 - BLOCK
      ?auto_572710 - BLOCK
      ?auto_572711 - BLOCK
      ?auto_572712 - BLOCK
      ?auto_572713 - BLOCK
      ?auto_572714 - BLOCK
    )
    :vars
    (
      ?auto_572715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_572714 ?auto_572715 ) ( ON-TABLE ?auto_572706 ) ( ON ?auto_572707 ?auto_572706 ) ( not ( = ?auto_572706 ?auto_572707 ) ) ( not ( = ?auto_572706 ?auto_572708 ) ) ( not ( = ?auto_572706 ?auto_572709 ) ) ( not ( = ?auto_572706 ?auto_572710 ) ) ( not ( = ?auto_572706 ?auto_572711 ) ) ( not ( = ?auto_572706 ?auto_572712 ) ) ( not ( = ?auto_572706 ?auto_572713 ) ) ( not ( = ?auto_572706 ?auto_572714 ) ) ( not ( = ?auto_572706 ?auto_572715 ) ) ( not ( = ?auto_572707 ?auto_572708 ) ) ( not ( = ?auto_572707 ?auto_572709 ) ) ( not ( = ?auto_572707 ?auto_572710 ) ) ( not ( = ?auto_572707 ?auto_572711 ) ) ( not ( = ?auto_572707 ?auto_572712 ) ) ( not ( = ?auto_572707 ?auto_572713 ) ) ( not ( = ?auto_572707 ?auto_572714 ) ) ( not ( = ?auto_572707 ?auto_572715 ) ) ( not ( = ?auto_572708 ?auto_572709 ) ) ( not ( = ?auto_572708 ?auto_572710 ) ) ( not ( = ?auto_572708 ?auto_572711 ) ) ( not ( = ?auto_572708 ?auto_572712 ) ) ( not ( = ?auto_572708 ?auto_572713 ) ) ( not ( = ?auto_572708 ?auto_572714 ) ) ( not ( = ?auto_572708 ?auto_572715 ) ) ( not ( = ?auto_572709 ?auto_572710 ) ) ( not ( = ?auto_572709 ?auto_572711 ) ) ( not ( = ?auto_572709 ?auto_572712 ) ) ( not ( = ?auto_572709 ?auto_572713 ) ) ( not ( = ?auto_572709 ?auto_572714 ) ) ( not ( = ?auto_572709 ?auto_572715 ) ) ( not ( = ?auto_572710 ?auto_572711 ) ) ( not ( = ?auto_572710 ?auto_572712 ) ) ( not ( = ?auto_572710 ?auto_572713 ) ) ( not ( = ?auto_572710 ?auto_572714 ) ) ( not ( = ?auto_572710 ?auto_572715 ) ) ( not ( = ?auto_572711 ?auto_572712 ) ) ( not ( = ?auto_572711 ?auto_572713 ) ) ( not ( = ?auto_572711 ?auto_572714 ) ) ( not ( = ?auto_572711 ?auto_572715 ) ) ( not ( = ?auto_572712 ?auto_572713 ) ) ( not ( = ?auto_572712 ?auto_572714 ) ) ( not ( = ?auto_572712 ?auto_572715 ) ) ( not ( = ?auto_572713 ?auto_572714 ) ) ( not ( = ?auto_572713 ?auto_572715 ) ) ( not ( = ?auto_572714 ?auto_572715 ) ) ( ON ?auto_572713 ?auto_572714 ) ( ON ?auto_572712 ?auto_572713 ) ( ON ?auto_572711 ?auto_572712 ) ( ON ?auto_572710 ?auto_572711 ) ( ON ?auto_572709 ?auto_572710 ) ( CLEAR ?auto_572707 ) ( ON ?auto_572708 ?auto_572709 ) ( CLEAR ?auto_572708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_572706 ?auto_572707 ?auto_572708 )
      ( MAKE-9PILE ?auto_572706 ?auto_572707 ?auto_572708 ?auto_572709 ?auto_572710 ?auto_572711 ?auto_572712 ?auto_572713 ?auto_572714 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_572744 - BLOCK
      ?auto_572745 - BLOCK
      ?auto_572746 - BLOCK
      ?auto_572747 - BLOCK
      ?auto_572748 - BLOCK
      ?auto_572749 - BLOCK
      ?auto_572750 - BLOCK
      ?auto_572751 - BLOCK
      ?auto_572752 - BLOCK
    )
    :vars
    (
      ?auto_572753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_572752 ?auto_572753 ) ( ON-TABLE ?auto_572744 ) ( not ( = ?auto_572744 ?auto_572745 ) ) ( not ( = ?auto_572744 ?auto_572746 ) ) ( not ( = ?auto_572744 ?auto_572747 ) ) ( not ( = ?auto_572744 ?auto_572748 ) ) ( not ( = ?auto_572744 ?auto_572749 ) ) ( not ( = ?auto_572744 ?auto_572750 ) ) ( not ( = ?auto_572744 ?auto_572751 ) ) ( not ( = ?auto_572744 ?auto_572752 ) ) ( not ( = ?auto_572744 ?auto_572753 ) ) ( not ( = ?auto_572745 ?auto_572746 ) ) ( not ( = ?auto_572745 ?auto_572747 ) ) ( not ( = ?auto_572745 ?auto_572748 ) ) ( not ( = ?auto_572745 ?auto_572749 ) ) ( not ( = ?auto_572745 ?auto_572750 ) ) ( not ( = ?auto_572745 ?auto_572751 ) ) ( not ( = ?auto_572745 ?auto_572752 ) ) ( not ( = ?auto_572745 ?auto_572753 ) ) ( not ( = ?auto_572746 ?auto_572747 ) ) ( not ( = ?auto_572746 ?auto_572748 ) ) ( not ( = ?auto_572746 ?auto_572749 ) ) ( not ( = ?auto_572746 ?auto_572750 ) ) ( not ( = ?auto_572746 ?auto_572751 ) ) ( not ( = ?auto_572746 ?auto_572752 ) ) ( not ( = ?auto_572746 ?auto_572753 ) ) ( not ( = ?auto_572747 ?auto_572748 ) ) ( not ( = ?auto_572747 ?auto_572749 ) ) ( not ( = ?auto_572747 ?auto_572750 ) ) ( not ( = ?auto_572747 ?auto_572751 ) ) ( not ( = ?auto_572747 ?auto_572752 ) ) ( not ( = ?auto_572747 ?auto_572753 ) ) ( not ( = ?auto_572748 ?auto_572749 ) ) ( not ( = ?auto_572748 ?auto_572750 ) ) ( not ( = ?auto_572748 ?auto_572751 ) ) ( not ( = ?auto_572748 ?auto_572752 ) ) ( not ( = ?auto_572748 ?auto_572753 ) ) ( not ( = ?auto_572749 ?auto_572750 ) ) ( not ( = ?auto_572749 ?auto_572751 ) ) ( not ( = ?auto_572749 ?auto_572752 ) ) ( not ( = ?auto_572749 ?auto_572753 ) ) ( not ( = ?auto_572750 ?auto_572751 ) ) ( not ( = ?auto_572750 ?auto_572752 ) ) ( not ( = ?auto_572750 ?auto_572753 ) ) ( not ( = ?auto_572751 ?auto_572752 ) ) ( not ( = ?auto_572751 ?auto_572753 ) ) ( not ( = ?auto_572752 ?auto_572753 ) ) ( ON ?auto_572751 ?auto_572752 ) ( ON ?auto_572750 ?auto_572751 ) ( ON ?auto_572749 ?auto_572750 ) ( ON ?auto_572748 ?auto_572749 ) ( ON ?auto_572747 ?auto_572748 ) ( ON ?auto_572746 ?auto_572747 ) ( CLEAR ?auto_572744 ) ( ON ?auto_572745 ?auto_572746 ) ( CLEAR ?auto_572745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_572744 ?auto_572745 )
      ( MAKE-9PILE ?auto_572744 ?auto_572745 ?auto_572746 ?auto_572747 ?auto_572748 ?auto_572749 ?auto_572750 ?auto_572751 ?auto_572752 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_572782 - BLOCK
      ?auto_572783 - BLOCK
      ?auto_572784 - BLOCK
      ?auto_572785 - BLOCK
      ?auto_572786 - BLOCK
      ?auto_572787 - BLOCK
      ?auto_572788 - BLOCK
      ?auto_572789 - BLOCK
      ?auto_572790 - BLOCK
    )
    :vars
    (
      ?auto_572791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_572790 ?auto_572791 ) ( not ( = ?auto_572782 ?auto_572783 ) ) ( not ( = ?auto_572782 ?auto_572784 ) ) ( not ( = ?auto_572782 ?auto_572785 ) ) ( not ( = ?auto_572782 ?auto_572786 ) ) ( not ( = ?auto_572782 ?auto_572787 ) ) ( not ( = ?auto_572782 ?auto_572788 ) ) ( not ( = ?auto_572782 ?auto_572789 ) ) ( not ( = ?auto_572782 ?auto_572790 ) ) ( not ( = ?auto_572782 ?auto_572791 ) ) ( not ( = ?auto_572783 ?auto_572784 ) ) ( not ( = ?auto_572783 ?auto_572785 ) ) ( not ( = ?auto_572783 ?auto_572786 ) ) ( not ( = ?auto_572783 ?auto_572787 ) ) ( not ( = ?auto_572783 ?auto_572788 ) ) ( not ( = ?auto_572783 ?auto_572789 ) ) ( not ( = ?auto_572783 ?auto_572790 ) ) ( not ( = ?auto_572783 ?auto_572791 ) ) ( not ( = ?auto_572784 ?auto_572785 ) ) ( not ( = ?auto_572784 ?auto_572786 ) ) ( not ( = ?auto_572784 ?auto_572787 ) ) ( not ( = ?auto_572784 ?auto_572788 ) ) ( not ( = ?auto_572784 ?auto_572789 ) ) ( not ( = ?auto_572784 ?auto_572790 ) ) ( not ( = ?auto_572784 ?auto_572791 ) ) ( not ( = ?auto_572785 ?auto_572786 ) ) ( not ( = ?auto_572785 ?auto_572787 ) ) ( not ( = ?auto_572785 ?auto_572788 ) ) ( not ( = ?auto_572785 ?auto_572789 ) ) ( not ( = ?auto_572785 ?auto_572790 ) ) ( not ( = ?auto_572785 ?auto_572791 ) ) ( not ( = ?auto_572786 ?auto_572787 ) ) ( not ( = ?auto_572786 ?auto_572788 ) ) ( not ( = ?auto_572786 ?auto_572789 ) ) ( not ( = ?auto_572786 ?auto_572790 ) ) ( not ( = ?auto_572786 ?auto_572791 ) ) ( not ( = ?auto_572787 ?auto_572788 ) ) ( not ( = ?auto_572787 ?auto_572789 ) ) ( not ( = ?auto_572787 ?auto_572790 ) ) ( not ( = ?auto_572787 ?auto_572791 ) ) ( not ( = ?auto_572788 ?auto_572789 ) ) ( not ( = ?auto_572788 ?auto_572790 ) ) ( not ( = ?auto_572788 ?auto_572791 ) ) ( not ( = ?auto_572789 ?auto_572790 ) ) ( not ( = ?auto_572789 ?auto_572791 ) ) ( not ( = ?auto_572790 ?auto_572791 ) ) ( ON ?auto_572789 ?auto_572790 ) ( ON ?auto_572788 ?auto_572789 ) ( ON ?auto_572787 ?auto_572788 ) ( ON ?auto_572786 ?auto_572787 ) ( ON ?auto_572785 ?auto_572786 ) ( ON ?auto_572784 ?auto_572785 ) ( ON ?auto_572783 ?auto_572784 ) ( ON ?auto_572782 ?auto_572783 ) ( CLEAR ?auto_572782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_572782 )
      ( MAKE-9PILE ?auto_572782 ?auto_572783 ?auto_572784 ?auto_572785 ?auto_572786 ?auto_572787 ?auto_572788 ?auto_572789 ?auto_572790 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_572821 - BLOCK
      ?auto_572822 - BLOCK
      ?auto_572823 - BLOCK
      ?auto_572824 - BLOCK
      ?auto_572825 - BLOCK
      ?auto_572826 - BLOCK
      ?auto_572827 - BLOCK
      ?auto_572828 - BLOCK
      ?auto_572829 - BLOCK
      ?auto_572830 - BLOCK
    )
    :vars
    (
      ?auto_572831 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_572829 ) ( ON ?auto_572830 ?auto_572831 ) ( CLEAR ?auto_572830 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_572821 ) ( ON ?auto_572822 ?auto_572821 ) ( ON ?auto_572823 ?auto_572822 ) ( ON ?auto_572824 ?auto_572823 ) ( ON ?auto_572825 ?auto_572824 ) ( ON ?auto_572826 ?auto_572825 ) ( ON ?auto_572827 ?auto_572826 ) ( ON ?auto_572828 ?auto_572827 ) ( ON ?auto_572829 ?auto_572828 ) ( not ( = ?auto_572821 ?auto_572822 ) ) ( not ( = ?auto_572821 ?auto_572823 ) ) ( not ( = ?auto_572821 ?auto_572824 ) ) ( not ( = ?auto_572821 ?auto_572825 ) ) ( not ( = ?auto_572821 ?auto_572826 ) ) ( not ( = ?auto_572821 ?auto_572827 ) ) ( not ( = ?auto_572821 ?auto_572828 ) ) ( not ( = ?auto_572821 ?auto_572829 ) ) ( not ( = ?auto_572821 ?auto_572830 ) ) ( not ( = ?auto_572821 ?auto_572831 ) ) ( not ( = ?auto_572822 ?auto_572823 ) ) ( not ( = ?auto_572822 ?auto_572824 ) ) ( not ( = ?auto_572822 ?auto_572825 ) ) ( not ( = ?auto_572822 ?auto_572826 ) ) ( not ( = ?auto_572822 ?auto_572827 ) ) ( not ( = ?auto_572822 ?auto_572828 ) ) ( not ( = ?auto_572822 ?auto_572829 ) ) ( not ( = ?auto_572822 ?auto_572830 ) ) ( not ( = ?auto_572822 ?auto_572831 ) ) ( not ( = ?auto_572823 ?auto_572824 ) ) ( not ( = ?auto_572823 ?auto_572825 ) ) ( not ( = ?auto_572823 ?auto_572826 ) ) ( not ( = ?auto_572823 ?auto_572827 ) ) ( not ( = ?auto_572823 ?auto_572828 ) ) ( not ( = ?auto_572823 ?auto_572829 ) ) ( not ( = ?auto_572823 ?auto_572830 ) ) ( not ( = ?auto_572823 ?auto_572831 ) ) ( not ( = ?auto_572824 ?auto_572825 ) ) ( not ( = ?auto_572824 ?auto_572826 ) ) ( not ( = ?auto_572824 ?auto_572827 ) ) ( not ( = ?auto_572824 ?auto_572828 ) ) ( not ( = ?auto_572824 ?auto_572829 ) ) ( not ( = ?auto_572824 ?auto_572830 ) ) ( not ( = ?auto_572824 ?auto_572831 ) ) ( not ( = ?auto_572825 ?auto_572826 ) ) ( not ( = ?auto_572825 ?auto_572827 ) ) ( not ( = ?auto_572825 ?auto_572828 ) ) ( not ( = ?auto_572825 ?auto_572829 ) ) ( not ( = ?auto_572825 ?auto_572830 ) ) ( not ( = ?auto_572825 ?auto_572831 ) ) ( not ( = ?auto_572826 ?auto_572827 ) ) ( not ( = ?auto_572826 ?auto_572828 ) ) ( not ( = ?auto_572826 ?auto_572829 ) ) ( not ( = ?auto_572826 ?auto_572830 ) ) ( not ( = ?auto_572826 ?auto_572831 ) ) ( not ( = ?auto_572827 ?auto_572828 ) ) ( not ( = ?auto_572827 ?auto_572829 ) ) ( not ( = ?auto_572827 ?auto_572830 ) ) ( not ( = ?auto_572827 ?auto_572831 ) ) ( not ( = ?auto_572828 ?auto_572829 ) ) ( not ( = ?auto_572828 ?auto_572830 ) ) ( not ( = ?auto_572828 ?auto_572831 ) ) ( not ( = ?auto_572829 ?auto_572830 ) ) ( not ( = ?auto_572829 ?auto_572831 ) ) ( not ( = ?auto_572830 ?auto_572831 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_572830 ?auto_572831 )
      ( !STACK ?auto_572830 ?auto_572829 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_572863 - BLOCK
      ?auto_572864 - BLOCK
      ?auto_572865 - BLOCK
      ?auto_572866 - BLOCK
      ?auto_572867 - BLOCK
      ?auto_572868 - BLOCK
      ?auto_572869 - BLOCK
      ?auto_572870 - BLOCK
      ?auto_572871 - BLOCK
      ?auto_572872 - BLOCK
    )
    :vars
    (
      ?auto_572873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_572872 ?auto_572873 ) ( ON-TABLE ?auto_572863 ) ( ON ?auto_572864 ?auto_572863 ) ( ON ?auto_572865 ?auto_572864 ) ( ON ?auto_572866 ?auto_572865 ) ( ON ?auto_572867 ?auto_572866 ) ( ON ?auto_572868 ?auto_572867 ) ( ON ?auto_572869 ?auto_572868 ) ( ON ?auto_572870 ?auto_572869 ) ( not ( = ?auto_572863 ?auto_572864 ) ) ( not ( = ?auto_572863 ?auto_572865 ) ) ( not ( = ?auto_572863 ?auto_572866 ) ) ( not ( = ?auto_572863 ?auto_572867 ) ) ( not ( = ?auto_572863 ?auto_572868 ) ) ( not ( = ?auto_572863 ?auto_572869 ) ) ( not ( = ?auto_572863 ?auto_572870 ) ) ( not ( = ?auto_572863 ?auto_572871 ) ) ( not ( = ?auto_572863 ?auto_572872 ) ) ( not ( = ?auto_572863 ?auto_572873 ) ) ( not ( = ?auto_572864 ?auto_572865 ) ) ( not ( = ?auto_572864 ?auto_572866 ) ) ( not ( = ?auto_572864 ?auto_572867 ) ) ( not ( = ?auto_572864 ?auto_572868 ) ) ( not ( = ?auto_572864 ?auto_572869 ) ) ( not ( = ?auto_572864 ?auto_572870 ) ) ( not ( = ?auto_572864 ?auto_572871 ) ) ( not ( = ?auto_572864 ?auto_572872 ) ) ( not ( = ?auto_572864 ?auto_572873 ) ) ( not ( = ?auto_572865 ?auto_572866 ) ) ( not ( = ?auto_572865 ?auto_572867 ) ) ( not ( = ?auto_572865 ?auto_572868 ) ) ( not ( = ?auto_572865 ?auto_572869 ) ) ( not ( = ?auto_572865 ?auto_572870 ) ) ( not ( = ?auto_572865 ?auto_572871 ) ) ( not ( = ?auto_572865 ?auto_572872 ) ) ( not ( = ?auto_572865 ?auto_572873 ) ) ( not ( = ?auto_572866 ?auto_572867 ) ) ( not ( = ?auto_572866 ?auto_572868 ) ) ( not ( = ?auto_572866 ?auto_572869 ) ) ( not ( = ?auto_572866 ?auto_572870 ) ) ( not ( = ?auto_572866 ?auto_572871 ) ) ( not ( = ?auto_572866 ?auto_572872 ) ) ( not ( = ?auto_572866 ?auto_572873 ) ) ( not ( = ?auto_572867 ?auto_572868 ) ) ( not ( = ?auto_572867 ?auto_572869 ) ) ( not ( = ?auto_572867 ?auto_572870 ) ) ( not ( = ?auto_572867 ?auto_572871 ) ) ( not ( = ?auto_572867 ?auto_572872 ) ) ( not ( = ?auto_572867 ?auto_572873 ) ) ( not ( = ?auto_572868 ?auto_572869 ) ) ( not ( = ?auto_572868 ?auto_572870 ) ) ( not ( = ?auto_572868 ?auto_572871 ) ) ( not ( = ?auto_572868 ?auto_572872 ) ) ( not ( = ?auto_572868 ?auto_572873 ) ) ( not ( = ?auto_572869 ?auto_572870 ) ) ( not ( = ?auto_572869 ?auto_572871 ) ) ( not ( = ?auto_572869 ?auto_572872 ) ) ( not ( = ?auto_572869 ?auto_572873 ) ) ( not ( = ?auto_572870 ?auto_572871 ) ) ( not ( = ?auto_572870 ?auto_572872 ) ) ( not ( = ?auto_572870 ?auto_572873 ) ) ( not ( = ?auto_572871 ?auto_572872 ) ) ( not ( = ?auto_572871 ?auto_572873 ) ) ( not ( = ?auto_572872 ?auto_572873 ) ) ( CLEAR ?auto_572870 ) ( ON ?auto_572871 ?auto_572872 ) ( CLEAR ?auto_572871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_572863 ?auto_572864 ?auto_572865 ?auto_572866 ?auto_572867 ?auto_572868 ?auto_572869 ?auto_572870 ?auto_572871 )
      ( MAKE-10PILE ?auto_572863 ?auto_572864 ?auto_572865 ?auto_572866 ?auto_572867 ?auto_572868 ?auto_572869 ?auto_572870 ?auto_572871 ?auto_572872 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_572905 - BLOCK
      ?auto_572906 - BLOCK
      ?auto_572907 - BLOCK
      ?auto_572908 - BLOCK
      ?auto_572909 - BLOCK
      ?auto_572910 - BLOCK
      ?auto_572911 - BLOCK
      ?auto_572912 - BLOCK
      ?auto_572913 - BLOCK
      ?auto_572914 - BLOCK
    )
    :vars
    (
      ?auto_572915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_572914 ?auto_572915 ) ( ON-TABLE ?auto_572905 ) ( ON ?auto_572906 ?auto_572905 ) ( ON ?auto_572907 ?auto_572906 ) ( ON ?auto_572908 ?auto_572907 ) ( ON ?auto_572909 ?auto_572908 ) ( ON ?auto_572910 ?auto_572909 ) ( ON ?auto_572911 ?auto_572910 ) ( not ( = ?auto_572905 ?auto_572906 ) ) ( not ( = ?auto_572905 ?auto_572907 ) ) ( not ( = ?auto_572905 ?auto_572908 ) ) ( not ( = ?auto_572905 ?auto_572909 ) ) ( not ( = ?auto_572905 ?auto_572910 ) ) ( not ( = ?auto_572905 ?auto_572911 ) ) ( not ( = ?auto_572905 ?auto_572912 ) ) ( not ( = ?auto_572905 ?auto_572913 ) ) ( not ( = ?auto_572905 ?auto_572914 ) ) ( not ( = ?auto_572905 ?auto_572915 ) ) ( not ( = ?auto_572906 ?auto_572907 ) ) ( not ( = ?auto_572906 ?auto_572908 ) ) ( not ( = ?auto_572906 ?auto_572909 ) ) ( not ( = ?auto_572906 ?auto_572910 ) ) ( not ( = ?auto_572906 ?auto_572911 ) ) ( not ( = ?auto_572906 ?auto_572912 ) ) ( not ( = ?auto_572906 ?auto_572913 ) ) ( not ( = ?auto_572906 ?auto_572914 ) ) ( not ( = ?auto_572906 ?auto_572915 ) ) ( not ( = ?auto_572907 ?auto_572908 ) ) ( not ( = ?auto_572907 ?auto_572909 ) ) ( not ( = ?auto_572907 ?auto_572910 ) ) ( not ( = ?auto_572907 ?auto_572911 ) ) ( not ( = ?auto_572907 ?auto_572912 ) ) ( not ( = ?auto_572907 ?auto_572913 ) ) ( not ( = ?auto_572907 ?auto_572914 ) ) ( not ( = ?auto_572907 ?auto_572915 ) ) ( not ( = ?auto_572908 ?auto_572909 ) ) ( not ( = ?auto_572908 ?auto_572910 ) ) ( not ( = ?auto_572908 ?auto_572911 ) ) ( not ( = ?auto_572908 ?auto_572912 ) ) ( not ( = ?auto_572908 ?auto_572913 ) ) ( not ( = ?auto_572908 ?auto_572914 ) ) ( not ( = ?auto_572908 ?auto_572915 ) ) ( not ( = ?auto_572909 ?auto_572910 ) ) ( not ( = ?auto_572909 ?auto_572911 ) ) ( not ( = ?auto_572909 ?auto_572912 ) ) ( not ( = ?auto_572909 ?auto_572913 ) ) ( not ( = ?auto_572909 ?auto_572914 ) ) ( not ( = ?auto_572909 ?auto_572915 ) ) ( not ( = ?auto_572910 ?auto_572911 ) ) ( not ( = ?auto_572910 ?auto_572912 ) ) ( not ( = ?auto_572910 ?auto_572913 ) ) ( not ( = ?auto_572910 ?auto_572914 ) ) ( not ( = ?auto_572910 ?auto_572915 ) ) ( not ( = ?auto_572911 ?auto_572912 ) ) ( not ( = ?auto_572911 ?auto_572913 ) ) ( not ( = ?auto_572911 ?auto_572914 ) ) ( not ( = ?auto_572911 ?auto_572915 ) ) ( not ( = ?auto_572912 ?auto_572913 ) ) ( not ( = ?auto_572912 ?auto_572914 ) ) ( not ( = ?auto_572912 ?auto_572915 ) ) ( not ( = ?auto_572913 ?auto_572914 ) ) ( not ( = ?auto_572913 ?auto_572915 ) ) ( not ( = ?auto_572914 ?auto_572915 ) ) ( ON ?auto_572913 ?auto_572914 ) ( CLEAR ?auto_572911 ) ( ON ?auto_572912 ?auto_572913 ) ( CLEAR ?auto_572912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_572905 ?auto_572906 ?auto_572907 ?auto_572908 ?auto_572909 ?auto_572910 ?auto_572911 ?auto_572912 )
      ( MAKE-10PILE ?auto_572905 ?auto_572906 ?auto_572907 ?auto_572908 ?auto_572909 ?auto_572910 ?auto_572911 ?auto_572912 ?auto_572913 ?auto_572914 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_572947 - BLOCK
      ?auto_572948 - BLOCK
      ?auto_572949 - BLOCK
      ?auto_572950 - BLOCK
      ?auto_572951 - BLOCK
      ?auto_572952 - BLOCK
      ?auto_572953 - BLOCK
      ?auto_572954 - BLOCK
      ?auto_572955 - BLOCK
      ?auto_572956 - BLOCK
    )
    :vars
    (
      ?auto_572957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_572956 ?auto_572957 ) ( ON-TABLE ?auto_572947 ) ( ON ?auto_572948 ?auto_572947 ) ( ON ?auto_572949 ?auto_572948 ) ( ON ?auto_572950 ?auto_572949 ) ( ON ?auto_572951 ?auto_572950 ) ( ON ?auto_572952 ?auto_572951 ) ( not ( = ?auto_572947 ?auto_572948 ) ) ( not ( = ?auto_572947 ?auto_572949 ) ) ( not ( = ?auto_572947 ?auto_572950 ) ) ( not ( = ?auto_572947 ?auto_572951 ) ) ( not ( = ?auto_572947 ?auto_572952 ) ) ( not ( = ?auto_572947 ?auto_572953 ) ) ( not ( = ?auto_572947 ?auto_572954 ) ) ( not ( = ?auto_572947 ?auto_572955 ) ) ( not ( = ?auto_572947 ?auto_572956 ) ) ( not ( = ?auto_572947 ?auto_572957 ) ) ( not ( = ?auto_572948 ?auto_572949 ) ) ( not ( = ?auto_572948 ?auto_572950 ) ) ( not ( = ?auto_572948 ?auto_572951 ) ) ( not ( = ?auto_572948 ?auto_572952 ) ) ( not ( = ?auto_572948 ?auto_572953 ) ) ( not ( = ?auto_572948 ?auto_572954 ) ) ( not ( = ?auto_572948 ?auto_572955 ) ) ( not ( = ?auto_572948 ?auto_572956 ) ) ( not ( = ?auto_572948 ?auto_572957 ) ) ( not ( = ?auto_572949 ?auto_572950 ) ) ( not ( = ?auto_572949 ?auto_572951 ) ) ( not ( = ?auto_572949 ?auto_572952 ) ) ( not ( = ?auto_572949 ?auto_572953 ) ) ( not ( = ?auto_572949 ?auto_572954 ) ) ( not ( = ?auto_572949 ?auto_572955 ) ) ( not ( = ?auto_572949 ?auto_572956 ) ) ( not ( = ?auto_572949 ?auto_572957 ) ) ( not ( = ?auto_572950 ?auto_572951 ) ) ( not ( = ?auto_572950 ?auto_572952 ) ) ( not ( = ?auto_572950 ?auto_572953 ) ) ( not ( = ?auto_572950 ?auto_572954 ) ) ( not ( = ?auto_572950 ?auto_572955 ) ) ( not ( = ?auto_572950 ?auto_572956 ) ) ( not ( = ?auto_572950 ?auto_572957 ) ) ( not ( = ?auto_572951 ?auto_572952 ) ) ( not ( = ?auto_572951 ?auto_572953 ) ) ( not ( = ?auto_572951 ?auto_572954 ) ) ( not ( = ?auto_572951 ?auto_572955 ) ) ( not ( = ?auto_572951 ?auto_572956 ) ) ( not ( = ?auto_572951 ?auto_572957 ) ) ( not ( = ?auto_572952 ?auto_572953 ) ) ( not ( = ?auto_572952 ?auto_572954 ) ) ( not ( = ?auto_572952 ?auto_572955 ) ) ( not ( = ?auto_572952 ?auto_572956 ) ) ( not ( = ?auto_572952 ?auto_572957 ) ) ( not ( = ?auto_572953 ?auto_572954 ) ) ( not ( = ?auto_572953 ?auto_572955 ) ) ( not ( = ?auto_572953 ?auto_572956 ) ) ( not ( = ?auto_572953 ?auto_572957 ) ) ( not ( = ?auto_572954 ?auto_572955 ) ) ( not ( = ?auto_572954 ?auto_572956 ) ) ( not ( = ?auto_572954 ?auto_572957 ) ) ( not ( = ?auto_572955 ?auto_572956 ) ) ( not ( = ?auto_572955 ?auto_572957 ) ) ( not ( = ?auto_572956 ?auto_572957 ) ) ( ON ?auto_572955 ?auto_572956 ) ( ON ?auto_572954 ?auto_572955 ) ( CLEAR ?auto_572952 ) ( ON ?auto_572953 ?auto_572954 ) ( CLEAR ?auto_572953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_572947 ?auto_572948 ?auto_572949 ?auto_572950 ?auto_572951 ?auto_572952 ?auto_572953 )
      ( MAKE-10PILE ?auto_572947 ?auto_572948 ?auto_572949 ?auto_572950 ?auto_572951 ?auto_572952 ?auto_572953 ?auto_572954 ?auto_572955 ?auto_572956 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_572989 - BLOCK
      ?auto_572990 - BLOCK
      ?auto_572991 - BLOCK
      ?auto_572992 - BLOCK
      ?auto_572993 - BLOCK
      ?auto_572994 - BLOCK
      ?auto_572995 - BLOCK
      ?auto_572996 - BLOCK
      ?auto_572997 - BLOCK
      ?auto_572998 - BLOCK
    )
    :vars
    (
      ?auto_572999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_572998 ?auto_572999 ) ( ON-TABLE ?auto_572989 ) ( ON ?auto_572990 ?auto_572989 ) ( ON ?auto_572991 ?auto_572990 ) ( ON ?auto_572992 ?auto_572991 ) ( ON ?auto_572993 ?auto_572992 ) ( not ( = ?auto_572989 ?auto_572990 ) ) ( not ( = ?auto_572989 ?auto_572991 ) ) ( not ( = ?auto_572989 ?auto_572992 ) ) ( not ( = ?auto_572989 ?auto_572993 ) ) ( not ( = ?auto_572989 ?auto_572994 ) ) ( not ( = ?auto_572989 ?auto_572995 ) ) ( not ( = ?auto_572989 ?auto_572996 ) ) ( not ( = ?auto_572989 ?auto_572997 ) ) ( not ( = ?auto_572989 ?auto_572998 ) ) ( not ( = ?auto_572989 ?auto_572999 ) ) ( not ( = ?auto_572990 ?auto_572991 ) ) ( not ( = ?auto_572990 ?auto_572992 ) ) ( not ( = ?auto_572990 ?auto_572993 ) ) ( not ( = ?auto_572990 ?auto_572994 ) ) ( not ( = ?auto_572990 ?auto_572995 ) ) ( not ( = ?auto_572990 ?auto_572996 ) ) ( not ( = ?auto_572990 ?auto_572997 ) ) ( not ( = ?auto_572990 ?auto_572998 ) ) ( not ( = ?auto_572990 ?auto_572999 ) ) ( not ( = ?auto_572991 ?auto_572992 ) ) ( not ( = ?auto_572991 ?auto_572993 ) ) ( not ( = ?auto_572991 ?auto_572994 ) ) ( not ( = ?auto_572991 ?auto_572995 ) ) ( not ( = ?auto_572991 ?auto_572996 ) ) ( not ( = ?auto_572991 ?auto_572997 ) ) ( not ( = ?auto_572991 ?auto_572998 ) ) ( not ( = ?auto_572991 ?auto_572999 ) ) ( not ( = ?auto_572992 ?auto_572993 ) ) ( not ( = ?auto_572992 ?auto_572994 ) ) ( not ( = ?auto_572992 ?auto_572995 ) ) ( not ( = ?auto_572992 ?auto_572996 ) ) ( not ( = ?auto_572992 ?auto_572997 ) ) ( not ( = ?auto_572992 ?auto_572998 ) ) ( not ( = ?auto_572992 ?auto_572999 ) ) ( not ( = ?auto_572993 ?auto_572994 ) ) ( not ( = ?auto_572993 ?auto_572995 ) ) ( not ( = ?auto_572993 ?auto_572996 ) ) ( not ( = ?auto_572993 ?auto_572997 ) ) ( not ( = ?auto_572993 ?auto_572998 ) ) ( not ( = ?auto_572993 ?auto_572999 ) ) ( not ( = ?auto_572994 ?auto_572995 ) ) ( not ( = ?auto_572994 ?auto_572996 ) ) ( not ( = ?auto_572994 ?auto_572997 ) ) ( not ( = ?auto_572994 ?auto_572998 ) ) ( not ( = ?auto_572994 ?auto_572999 ) ) ( not ( = ?auto_572995 ?auto_572996 ) ) ( not ( = ?auto_572995 ?auto_572997 ) ) ( not ( = ?auto_572995 ?auto_572998 ) ) ( not ( = ?auto_572995 ?auto_572999 ) ) ( not ( = ?auto_572996 ?auto_572997 ) ) ( not ( = ?auto_572996 ?auto_572998 ) ) ( not ( = ?auto_572996 ?auto_572999 ) ) ( not ( = ?auto_572997 ?auto_572998 ) ) ( not ( = ?auto_572997 ?auto_572999 ) ) ( not ( = ?auto_572998 ?auto_572999 ) ) ( ON ?auto_572997 ?auto_572998 ) ( ON ?auto_572996 ?auto_572997 ) ( ON ?auto_572995 ?auto_572996 ) ( CLEAR ?auto_572993 ) ( ON ?auto_572994 ?auto_572995 ) ( CLEAR ?auto_572994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_572989 ?auto_572990 ?auto_572991 ?auto_572992 ?auto_572993 ?auto_572994 )
      ( MAKE-10PILE ?auto_572989 ?auto_572990 ?auto_572991 ?auto_572992 ?auto_572993 ?auto_572994 ?auto_572995 ?auto_572996 ?auto_572997 ?auto_572998 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_573031 - BLOCK
      ?auto_573032 - BLOCK
      ?auto_573033 - BLOCK
      ?auto_573034 - BLOCK
      ?auto_573035 - BLOCK
      ?auto_573036 - BLOCK
      ?auto_573037 - BLOCK
      ?auto_573038 - BLOCK
      ?auto_573039 - BLOCK
      ?auto_573040 - BLOCK
    )
    :vars
    (
      ?auto_573041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_573040 ?auto_573041 ) ( ON-TABLE ?auto_573031 ) ( ON ?auto_573032 ?auto_573031 ) ( ON ?auto_573033 ?auto_573032 ) ( ON ?auto_573034 ?auto_573033 ) ( not ( = ?auto_573031 ?auto_573032 ) ) ( not ( = ?auto_573031 ?auto_573033 ) ) ( not ( = ?auto_573031 ?auto_573034 ) ) ( not ( = ?auto_573031 ?auto_573035 ) ) ( not ( = ?auto_573031 ?auto_573036 ) ) ( not ( = ?auto_573031 ?auto_573037 ) ) ( not ( = ?auto_573031 ?auto_573038 ) ) ( not ( = ?auto_573031 ?auto_573039 ) ) ( not ( = ?auto_573031 ?auto_573040 ) ) ( not ( = ?auto_573031 ?auto_573041 ) ) ( not ( = ?auto_573032 ?auto_573033 ) ) ( not ( = ?auto_573032 ?auto_573034 ) ) ( not ( = ?auto_573032 ?auto_573035 ) ) ( not ( = ?auto_573032 ?auto_573036 ) ) ( not ( = ?auto_573032 ?auto_573037 ) ) ( not ( = ?auto_573032 ?auto_573038 ) ) ( not ( = ?auto_573032 ?auto_573039 ) ) ( not ( = ?auto_573032 ?auto_573040 ) ) ( not ( = ?auto_573032 ?auto_573041 ) ) ( not ( = ?auto_573033 ?auto_573034 ) ) ( not ( = ?auto_573033 ?auto_573035 ) ) ( not ( = ?auto_573033 ?auto_573036 ) ) ( not ( = ?auto_573033 ?auto_573037 ) ) ( not ( = ?auto_573033 ?auto_573038 ) ) ( not ( = ?auto_573033 ?auto_573039 ) ) ( not ( = ?auto_573033 ?auto_573040 ) ) ( not ( = ?auto_573033 ?auto_573041 ) ) ( not ( = ?auto_573034 ?auto_573035 ) ) ( not ( = ?auto_573034 ?auto_573036 ) ) ( not ( = ?auto_573034 ?auto_573037 ) ) ( not ( = ?auto_573034 ?auto_573038 ) ) ( not ( = ?auto_573034 ?auto_573039 ) ) ( not ( = ?auto_573034 ?auto_573040 ) ) ( not ( = ?auto_573034 ?auto_573041 ) ) ( not ( = ?auto_573035 ?auto_573036 ) ) ( not ( = ?auto_573035 ?auto_573037 ) ) ( not ( = ?auto_573035 ?auto_573038 ) ) ( not ( = ?auto_573035 ?auto_573039 ) ) ( not ( = ?auto_573035 ?auto_573040 ) ) ( not ( = ?auto_573035 ?auto_573041 ) ) ( not ( = ?auto_573036 ?auto_573037 ) ) ( not ( = ?auto_573036 ?auto_573038 ) ) ( not ( = ?auto_573036 ?auto_573039 ) ) ( not ( = ?auto_573036 ?auto_573040 ) ) ( not ( = ?auto_573036 ?auto_573041 ) ) ( not ( = ?auto_573037 ?auto_573038 ) ) ( not ( = ?auto_573037 ?auto_573039 ) ) ( not ( = ?auto_573037 ?auto_573040 ) ) ( not ( = ?auto_573037 ?auto_573041 ) ) ( not ( = ?auto_573038 ?auto_573039 ) ) ( not ( = ?auto_573038 ?auto_573040 ) ) ( not ( = ?auto_573038 ?auto_573041 ) ) ( not ( = ?auto_573039 ?auto_573040 ) ) ( not ( = ?auto_573039 ?auto_573041 ) ) ( not ( = ?auto_573040 ?auto_573041 ) ) ( ON ?auto_573039 ?auto_573040 ) ( ON ?auto_573038 ?auto_573039 ) ( ON ?auto_573037 ?auto_573038 ) ( ON ?auto_573036 ?auto_573037 ) ( CLEAR ?auto_573034 ) ( ON ?auto_573035 ?auto_573036 ) ( CLEAR ?auto_573035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_573031 ?auto_573032 ?auto_573033 ?auto_573034 ?auto_573035 )
      ( MAKE-10PILE ?auto_573031 ?auto_573032 ?auto_573033 ?auto_573034 ?auto_573035 ?auto_573036 ?auto_573037 ?auto_573038 ?auto_573039 ?auto_573040 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_573073 - BLOCK
      ?auto_573074 - BLOCK
      ?auto_573075 - BLOCK
      ?auto_573076 - BLOCK
      ?auto_573077 - BLOCK
      ?auto_573078 - BLOCK
      ?auto_573079 - BLOCK
      ?auto_573080 - BLOCK
      ?auto_573081 - BLOCK
      ?auto_573082 - BLOCK
    )
    :vars
    (
      ?auto_573083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_573082 ?auto_573083 ) ( ON-TABLE ?auto_573073 ) ( ON ?auto_573074 ?auto_573073 ) ( ON ?auto_573075 ?auto_573074 ) ( not ( = ?auto_573073 ?auto_573074 ) ) ( not ( = ?auto_573073 ?auto_573075 ) ) ( not ( = ?auto_573073 ?auto_573076 ) ) ( not ( = ?auto_573073 ?auto_573077 ) ) ( not ( = ?auto_573073 ?auto_573078 ) ) ( not ( = ?auto_573073 ?auto_573079 ) ) ( not ( = ?auto_573073 ?auto_573080 ) ) ( not ( = ?auto_573073 ?auto_573081 ) ) ( not ( = ?auto_573073 ?auto_573082 ) ) ( not ( = ?auto_573073 ?auto_573083 ) ) ( not ( = ?auto_573074 ?auto_573075 ) ) ( not ( = ?auto_573074 ?auto_573076 ) ) ( not ( = ?auto_573074 ?auto_573077 ) ) ( not ( = ?auto_573074 ?auto_573078 ) ) ( not ( = ?auto_573074 ?auto_573079 ) ) ( not ( = ?auto_573074 ?auto_573080 ) ) ( not ( = ?auto_573074 ?auto_573081 ) ) ( not ( = ?auto_573074 ?auto_573082 ) ) ( not ( = ?auto_573074 ?auto_573083 ) ) ( not ( = ?auto_573075 ?auto_573076 ) ) ( not ( = ?auto_573075 ?auto_573077 ) ) ( not ( = ?auto_573075 ?auto_573078 ) ) ( not ( = ?auto_573075 ?auto_573079 ) ) ( not ( = ?auto_573075 ?auto_573080 ) ) ( not ( = ?auto_573075 ?auto_573081 ) ) ( not ( = ?auto_573075 ?auto_573082 ) ) ( not ( = ?auto_573075 ?auto_573083 ) ) ( not ( = ?auto_573076 ?auto_573077 ) ) ( not ( = ?auto_573076 ?auto_573078 ) ) ( not ( = ?auto_573076 ?auto_573079 ) ) ( not ( = ?auto_573076 ?auto_573080 ) ) ( not ( = ?auto_573076 ?auto_573081 ) ) ( not ( = ?auto_573076 ?auto_573082 ) ) ( not ( = ?auto_573076 ?auto_573083 ) ) ( not ( = ?auto_573077 ?auto_573078 ) ) ( not ( = ?auto_573077 ?auto_573079 ) ) ( not ( = ?auto_573077 ?auto_573080 ) ) ( not ( = ?auto_573077 ?auto_573081 ) ) ( not ( = ?auto_573077 ?auto_573082 ) ) ( not ( = ?auto_573077 ?auto_573083 ) ) ( not ( = ?auto_573078 ?auto_573079 ) ) ( not ( = ?auto_573078 ?auto_573080 ) ) ( not ( = ?auto_573078 ?auto_573081 ) ) ( not ( = ?auto_573078 ?auto_573082 ) ) ( not ( = ?auto_573078 ?auto_573083 ) ) ( not ( = ?auto_573079 ?auto_573080 ) ) ( not ( = ?auto_573079 ?auto_573081 ) ) ( not ( = ?auto_573079 ?auto_573082 ) ) ( not ( = ?auto_573079 ?auto_573083 ) ) ( not ( = ?auto_573080 ?auto_573081 ) ) ( not ( = ?auto_573080 ?auto_573082 ) ) ( not ( = ?auto_573080 ?auto_573083 ) ) ( not ( = ?auto_573081 ?auto_573082 ) ) ( not ( = ?auto_573081 ?auto_573083 ) ) ( not ( = ?auto_573082 ?auto_573083 ) ) ( ON ?auto_573081 ?auto_573082 ) ( ON ?auto_573080 ?auto_573081 ) ( ON ?auto_573079 ?auto_573080 ) ( ON ?auto_573078 ?auto_573079 ) ( ON ?auto_573077 ?auto_573078 ) ( CLEAR ?auto_573075 ) ( ON ?auto_573076 ?auto_573077 ) ( CLEAR ?auto_573076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_573073 ?auto_573074 ?auto_573075 ?auto_573076 )
      ( MAKE-10PILE ?auto_573073 ?auto_573074 ?auto_573075 ?auto_573076 ?auto_573077 ?auto_573078 ?auto_573079 ?auto_573080 ?auto_573081 ?auto_573082 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_573115 - BLOCK
      ?auto_573116 - BLOCK
      ?auto_573117 - BLOCK
      ?auto_573118 - BLOCK
      ?auto_573119 - BLOCK
      ?auto_573120 - BLOCK
      ?auto_573121 - BLOCK
      ?auto_573122 - BLOCK
      ?auto_573123 - BLOCK
      ?auto_573124 - BLOCK
    )
    :vars
    (
      ?auto_573125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_573124 ?auto_573125 ) ( ON-TABLE ?auto_573115 ) ( ON ?auto_573116 ?auto_573115 ) ( not ( = ?auto_573115 ?auto_573116 ) ) ( not ( = ?auto_573115 ?auto_573117 ) ) ( not ( = ?auto_573115 ?auto_573118 ) ) ( not ( = ?auto_573115 ?auto_573119 ) ) ( not ( = ?auto_573115 ?auto_573120 ) ) ( not ( = ?auto_573115 ?auto_573121 ) ) ( not ( = ?auto_573115 ?auto_573122 ) ) ( not ( = ?auto_573115 ?auto_573123 ) ) ( not ( = ?auto_573115 ?auto_573124 ) ) ( not ( = ?auto_573115 ?auto_573125 ) ) ( not ( = ?auto_573116 ?auto_573117 ) ) ( not ( = ?auto_573116 ?auto_573118 ) ) ( not ( = ?auto_573116 ?auto_573119 ) ) ( not ( = ?auto_573116 ?auto_573120 ) ) ( not ( = ?auto_573116 ?auto_573121 ) ) ( not ( = ?auto_573116 ?auto_573122 ) ) ( not ( = ?auto_573116 ?auto_573123 ) ) ( not ( = ?auto_573116 ?auto_573124 ) ) ( not ( = ?auto_573116 ?auto_573125 ) ) ( not ( = ?auto_573117 ?auto_573118 ) ) ( not ( = ?auto_573117 ?auto_573119 ) ) ( not ( = ?auto_573117 ?auto_573120 ) ) ( not ( = ?auto_573117 ?auto_573121 ) ) ( not ( = ?auto_573117 ?auto_573122 ) ) ( not ( = ?auto_573117 ?auto_573123 ) ) ( not ( = ?auto_573117 ?auto_573124 ) ) ( not ( = ?auto_573117 ?auto_573125 ) ) ( not ( = ?auto_573118 ?auto_573119 ) ) ( not ( = ?auto_573118 ?auto_573120 ) ) ( not ( = ?auto_573118 ?auto_573121 ) ) ( not ( = ?auto_573118 ?auto_573122 ) ) ( not ( = ?auto_573118 ?auto_573123 ) ) ( not ( = ?auto_573118 ?auto_573124 ) ) ( not ( = ?auto_573118 ?auto_573125 ) ) ( not ( = ?auto_573119 ?auto_573120 ) ) ( not ( = ?auto_573119 ?auto_573121 ) ) ( not ( = ?auto_573119 ?auto_573122 ) ) ( not ( = ?auto_573119 ?auto_573123 ) ) ( not ( = ?auto_573119 ?auto_573124 ) ) ( not ( = ?auto_573119 ?auto_573125 ) ) ( not ( = ?auto_573120 ?auto_573121 ) ) ( not ( = ?auto_573120 ?auto_573122 ) ) ( not ( = ?auto_573120 ?auto_573123 ) ) ( not ( = ?auto_573120 ?auto_573124 ) ) ( not ( = ?auto_573120 ?auto_573125 ) ) ( not ( = ?auto_573121 ?auto_573122 ) ) ( not ( = ?auto_573121 ?auto_573123 ) ) ( not ( = ?auto_573121 ?auto_573124 ) ) ( not ( = ?auto_573121 ?auto_573125 ) ) ( not ( = ?auto_573122 ?auto_573123 ) ) ( not ( = ?auto_573122 ?auto_573124 ) ) ( not ( = ?auto_573122 ?auto_573125 ) ) ( not ( = ?auto_573123 ?auto_573124 ) ) ( not ( = ?auto_573123 ?auto_573125 ) ) ( not ( = ?auto_573124 ?auto_573125 ) ) ( ON ?auto_573123 ?auto_573124 ) ( ON ?auto_573122 ?auto_573123 ) ( ON ?auto_573121 ?auto_573122 ) ( ON ?auto_573120 ?auto_573121 ) ( ON ?auto_573119 ?auto_573120 ) ( ON ?auto_573118 ?auto_573119 ) ( CLEAR ?auto_573116 ) ( ON ?auto_573117 ?auto_573118 ) ( CLEAR ?auto_573117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_573115 ?auto_573116 ?auto_573117 )
      ( MAKE-10PILE ?auto_573115 ?auto_573116 ?auto_573117 ?auto_573118 ?auto_573119 ?auto_573120 ?auto_573121 ?auto_573122 ?auto_573123 ?auto_573124 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_573157 - BLOCK
      ?auto_573158 - BLOCK
      ?auto_573159 - BLOCK
      ?auto_573160 - BLOCK
      ?auto_573161 - BLOCK
      ?auto_573162 - BLOCK
      ?auto_573163 - BLOCK
      ?auto_573164 - BLOCK
      ?auto_573165 - BLOCK
      ?auto_573166 - BLOCK
    )
    :vars
    (
      ?auto_573167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_573166 ?auto_573167 ) ( ON-TABLE ?auto_573157 ) ( not ( = ?auto_573157 ?auto_573158 ) ) ( not ( = ?auto_573157 ?auto_573159 ) ) ( not ( = ?auto_573157 ?auto_573160 ) ) ( not ( = ?auto_573157 ?auto_573161 ) ) ( not ( = ?auto_573157 ?auto_573162 ) ) ( not ( = ?auto_573157 ?auto_573163 ) ) ( not ( = ?auto_573157 ?auto_573164 ) ) ( not ( = ?auto_573157 ?auto_573165 ) ) ( not ( = ?auto_573157 ?auto_573166 ) ) ( not ( = ?auto_573157 ?auto_573167 ) ) ( not ( = ?auto_573158 ?auto_573159 ) ) ( not ( = ?auto_573158 ?auto_573160 ) ) ( not ( = ?auto_573158 ?auto_573161 ) ) ( not ( = ?auto_573158 ?auto_573162 ) ) ( not ( = ?auto_573158 ?auto_573163 ) ) ( not ( = ?auto_573158 ?auto_573164 ) ) ( not ( = ?auto_573158 ?auto_573165 ) ) ( not ( = ?auto_573158 ?auto_573166 ) ) ( not ( = ?auto_573158 ?auto_573167 ) ) ( not ( = ?auto_573159 ?auto_573160 ) ) ( not ( = ?auto_573159 ?auto_573161 ) ) ( not ( = ?auto_573159 ?auto_573162 ) ) ( not ( = ?auto_573159 ?auto_573163 ) ) ( not ( = ?auto_573159 ?auto_573164 ) ) ( not ( = ?auto_573159 ?auto_573165 ) ) ( not ( = ?auto_573159 ?auto_573166 ) ) ( not ( = ?auto_573159 ?auto_573167 ) ) ( not ( = ?auto_573160 ?auto_573161 ) ) ( not ( = ?auto_573160 ?auto_573162 ) ) ( not ( = ?auto_573160 ?auto_573163 ) ) ( not ( = ?auto_573160 ?auto_573164 ) ) ( not ( = ?auto_573160 ?auto_573165 ) ) ( not ( = ?auto_573160 ?auto_573166 ) ) ( not ( = ?auto_573160 ?auto_573167 ) ) ( not ( = ?auto_573161 ?auto_573162 ) ) ( not ( = ?auto_573161 ?auto_573163 ) ) ( not ( = ?auto_573161 ?auto_573164 ) ) ( not ( = ?auto_573161 ?auto_573165 ) ) ( not ( = ?auto_573161 ?auto_573166 ) ) ( not ( = ?auto_573161 ?auto_573167 ) ) ( not ( = ?auto_573162 ?auto_573163 ) ) ( not ( = ?auto_573162 ?auto_573164 ) ) ( not ( = ?auto_573162 ?auto_573165 ) ) ( not ( = ?auto_573162 ?auto_573166 ) ) ( not ( = ?auto_573162 ?auto_573167 ) ) ( not ( = ?auto_573163 ?auto_573164 ) ) ( not ( = ?auto_573163 ?auto_573165 ) ) ( not ( = ?auto_573163 ?auto_573166 ) ) ( not ( = ?auto_573163 ?auto_573167 ) ) ( not ( = ?auto_573164 ?auto_573165 ) ) ( not ( = ?auto_573164 ?auto_573166 ) ) ( not ( = ?auto_573164 ?auto_573167 ) ) ( not ( = ?auto_573165 ?auto_573166 ) ) ( not ( = ?auto_573165 ?auto_573167 ) ) ( not ( = ?auto_573166 ?auto_573167 ) ) ( ON ?auto_573165 ?auto_573166 ) ( ON ?auto_573164 ?auto_573165 ) ( ON ?auto_573163 ?auto_573164 ) ( ON ?auto_573162 ?auto_573163 ) ( ON ?auto_573161 ?auto_573162 ) ( ON ?auto_573160 ?auto_573161 ) ( ON ?auto_573159 ?auto_573160 ) ( CLEAR ?auto_573157 ) ( ON ?auto_573158 ?auto_573159 ) ( CLEAR ?auto_573158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_573157 ?auto_573158 )
      ( MAKE-10PILE ?auto_573157 ?auto_573158 ?auto_573159 ?auto_573160 ?auto_573161 ?auto_573162 ?auto_573163 ?auto_573164 ?auto_573165 ?auto_573166 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_573199 - BLOCK
      ?auto_573200 - BLOCK
      ?auto_573201 - BLOCK
      ?auto_573202 - BLOCK
      ?auto_573203 - BLOCK
      ?auto_573204 - BLOCK
      ?auto_573205 - BLOCK
      ?auto_573206 - BLOCK
      ?auto_573207 - BLOCK
      ?auto_573208 - BLOCK
    )
    :vars
    (
      ?auto_573209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_573208 ?auto_573209 ) ( not ( = ?auto_573199 ?auto_573200 ) ) ( not ( = ?auto_573199 ?auto_573201 ) ) ( not ( = ?auto_573199 ?auto_573202 ) ) ( not ( = ?auto_573199 ?auto_573203 ) ) ( not ( = ?auto_573199 ?auto_573204 ) ) ( not ( = ?auto_573199 ?auto_573205 ) ) ( not ( = ?auto_573199 ?auto_573206 ) ) ( not ( = ?auto_573199 ?auto_573207 ) ) ( not ( = ?auto_573199 ?auto_573208 ) ) ( not ( = ?auto_573199 ?auto_573209 ) ) ( not ( = ?auto_573200 ?auto_573201 ) ) ( not ( = ?auto_573200 ?auto_573202 ) ) ( not ( = ?auto_573200 ?auto_573203 ) ) ( not ( = ?auto_573200 ?auto_573204 ) ) ( not ( = ?auto_573200 ?auto_573205 ) ) ( not ( = ?auto_573200 ?auto_573206 ) ) ( not ( = ?auto_573200 ?auto_573207 ) ) ( not ( = ?auto_573200 ?auto_573208 ) ) ( not ( = ?auto_573200 ?auto_573209 ) ) ( not ( = ?auto_573201 ?auto_573202 ) ) ( not ( = ?auto_573201 ?auto_573203 ) ) ( not ( = ?auto_573201 ?auto_573204 ) ) ( not ( = ?auto_573201 ?auto_573205 ) ) ( not ( = ?auto_573201 ?auto_573206 ) ) ( not ( = ?auto_573201 ?auto_573207 ) ) ( not ( = ?auto_573201 ?auto_573208 ) ) ( not ( = ?auto_573201 ?auto_573209 ) ) ( not ( = ?auto_573202 ?auto_573203 ) ) ( not ( = ?auto_573202 ?auto_573204 ) ) ( not ( = ?auto_573202 ?auto_573205 ) ) ( not ( = ?auto_573202 ?auto_573206 ) ) ( not ( = ?auto_573202 ?auto_573207 ) ) ( not ( = ?auto_573202 ?auto_573208 ) ) ( not ( = ?auto_573202 ?auto_573209 ) ) ( not ( = ?auto_573203 ?auto_573204 ) ) ( not ( = ?auto_573203 ?auto_573205 ) ) ( not ( = ?auto_573203 ?auto_573206 ) ) ( not ( = ?auto_573203 ?auto_573207 ) ) ( not ( = ?auto_573203 ?auto_573208 ) ) ( not ( = ?auto_573203 ?auto_573209 ) ) ( not ( = ?auto_573204 ?auto_573205 ) ) ( not ( = ?auto_573204 ?auto_573206 ) ) ( not ( = ?auto_573204 ?auto_573207 ) ) ( not ( = ?auto_573204 ?auto_573208 ) ) ( not ( = ?auto_573204 ?auto_573209 ) ) ( not ( = ?auto_573205 ?auto_573206 ) ) ( not ( = ?auto_573205 ?auto_573207 ) ) ( not ( = ?auto_573205 ?auto_573208 ) ) ( not ( = ?auto_573205 ?auto_573209 ) ) ( not ( = ?auto_573206 ?auto_573207 ) ) ( not ( = ?auto_573206 ?auto_573208 ) ) ( not ( = ?auto_573206 ?auto_573209 ) ) ( not ( = ?auto_573207 ?auto_573208 ) ) ( not ( = ?auto_573207 ?auto_573209 ) ) ( not ( = ?auto_573208 ?auto_573209 ) ) ( ON ?auto_573207 ?auto_573208 ) ( ON ?auto_573206 ?auto_573207 ) ( ON ?auto_573205 ?auto_573206 ) ( ON ?auto_573204 ?auto_573205 ) ( ON ?auto_573203 ?auto_573204 ) ( ON ?auto_573202 ?auto_573203 ) ( ON ?auto_573201 ?auto_573202 ) ( ON ?auto_573200 ?auto_573201 ) ( ON ?auto_573199 ?auto_573200 ) ( CLEAR ?auto_573199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_573199 )
      ( MAKE-10PILE ?auto_573199 ?auto_573200 ?auto_573201 ?auto_573202 ?auto_573203 ?auto_573204 ?auto_573205 ?auto_573206 ?auto_573207 ?auto_573208 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_573242 - BLOCK
      ?auto_573243 - BLOCK
      ?auto_573244 - BLOCK
      ?auto_573245 - BLOCK
      ?auto_573246 - BLOCK
      ?auto_573247 - BLOCK
      ?auto_573248 - BLOCK
      ?auto_573249 - BLOCK
      ?auto_573250 - BLOCK
      ?auto_573251 - BLOCK
      ?auto_573252 - BLOCK
    )
    :vars
    (
      ?auto_573253 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_573251 ) ( ON ?auto_573252 ?auto_573253 ) ( CLEAR ?auto_573252 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_573242 ) ( ON ?auto_573243 ?auto_573242 ) ( ON ?auto_573244 ?auto_573243 ) ( ON ?auto_573245 ?auto_573244 ) ( ON ?auto_573246 ?auto_573245 ) ( ON ?auto_573247 ?auto_573246 ) ( ON ?auto_573248 ?auto_573247 ) ( ON ?auto_573249 ?auto_573248 ) ( ON ?auto_573250 ?auto_573249 ) ( ON ?auto_573251 ?auto_573250 ) ( not ( = ?auto_573242 ?auto_573243 ) ) ( not ( = ?auto_573242 ?auto_573244 ) ) ( not ( = ?auto_573242 ?auto_573245 ) ) ( not ( = ?auto_573242 ?auto_573246 ) ) ( not ( = ?auto_573242 ?auto_573247 ) ) ( not ( = ?auto_573242 ?auto_573248 ) ) ( not ( = ?auto_573242 ?auto_573249 ) ) ( not ( = ?auto_573242 ?auto_573250 ) ) ( not ( = ?auto_573242 ?auto_573251 ) ) ( not ( = ?auto_573242 ?auto_573252 ) ) ( not ( = ?auto_573242 ?auto_573253 ) ) ( not ( = ?auto_573243 ?auto_573244 ) ) ( not ( = ?auto_573243 ?auto_573245 ) ) ( not ( = ?auto_573243 ?auto_573246 ) ) ( not ( = ?auto_573243 ?auto_573247 ) ) ( not ( = ?auto_573243 ?auto_573248 ) ) ( not ( = ?auto_573243 ?auto_573249 ) ) ( not ( = ?auto_573243 ?auto_573250 ) ) ( not ( = ?auto_573243 ?auto_573251 ) ) ( not ( = ?auto_573243 ?auto_573252 ) ) ( not ( = ?auto_573243 ?auto_573253 ) ) ( not ( = ?auto_573244 ?auto_573245 ) ) ( not ( = ?auto_573244 ?auto_573246 ) ) ( not ( = ?auto_573244 ?auto_573247 ) ) ( not ( = ?auto_573244 ?auto_573248 ) ) ( not ( = ?auto_573244 ?auto_573249 ) ) ( not ( = ?auto_573244 ?auto_573250 ) ) ( not ( = ?auto_573244 ?auto_573251 ) ) ( not ( = ?auto_573244 ?auto_573252 ) ) ( not ( = ?auto_573244 ?auto_573253 ) ) ( not ( = ?auto_573245 ?auto_573246 ) ) ( not ( = ?auto_573245 ?auto_573247 ) ) ( not ( = ?auto_573245 ?auto_573248 ) ) ( not ( = ?auto_573245 ?auto_573249 ) ) ( not ( = ?auto_573245 ?auto_573250 ) ) ( not ( = ?auto_573245 ?auto_573251 ) ) ( not ( = ?auto_573245 ?auto_573252 ) ) ( not ( = ?auto_573245 ?auto_573253 ) ) ( not ( = ?auto_573246 ?auto_573247 ) ) ( not ( = ?auto_573246 ?auto_573248 ) ) ( not ( = ?auto_573246 ?auto_573249 ) ) ( not ( = ?auto_573246 ?auto_573250 ) ) ( not ( = ?auto_573246 ?auto_573251 ) ) ( not ( = ?auto_573246 ?auto_573252 ) ) ( not ( = ?auto_573246 ?auto_573253 ) ) ( not ( = ?auto_573247 ?auto_573248 ) ) ( not ( = ?auto_573247 ?auto_573249 ) ) ( not ( = ?auto_573247 ?auto_573250 ) ) ( not ( = ?auto_573247 ?auto_573251 ) ) ( not ( = ?auto_573247 ?auto_573252 ) ) ( not ( = ?auto_573247 ?auto_573253 ) ) ( not ( = ?auto_573248 ?auto_573249 ) ) ( not ( = ?auto_573248 ?auto_573250 ) ) ( not ( = ?auto_573248 ?auto_573251 ) ) ( not ( = ?auto_573248 ?auto_573252 ) ) ( not ( = ?auto_573248 ?auto_573253 ) ) ( not ( = ?auto_573249 ?auto_573250 ) ) ( not ( = ?auto_573249 ?auto_573251 ) ) ( not ( = ?auto_573249 ?auto_573252 ) ) ( not ( = ?auto_573249 ?auto_573253 ) ) ( not ( = ?auto_573250 ?auto_573251 ) ) ( not ( = ?auto_573250 ?auto_573252 ) ) ( not ( = ?auto_573250 ?auto_573253 ) ) ( not ( = ?auto_573251 ?auto_573252 ) ) ( not ( = ?auto_573251 ?auto_573253 ) ) ( not ( = ?auto_573252 ?auto_573253 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_573252 ?auto_573253 )
      ( !STACK ?auto_573252 ?auto_573251 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_573288 - BLOCK
      ?auto_573289 - BLOCK
      ?auto_573290 - BLOCK
      ?auto_573291 - BLOCK
      ?auto_573292 - BLOCK
      ?auto_573293 - BLOCK
      ?auto_573294 - BLOCK
      ?auto_573295 - BLOCK
      ?auto_573296 - BLOCK
      ?auto_573297 - BLOCK
      ?auto_573298 - BLOCK
    )
    :vars
    (
      ?auto_573299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_573298 ?auto_573299 ) ( ON-TABLE ?auto_573288 ) ( ON ?auto_573289 ?auto_573288 ) ( ON ?auto_573290 ?auto_573289 ) ( ON ?auto_573291 ?auto_573290 ) ( ON ?auto_573292 ?auto_573291 ) ( ON ?auto_573293 ?auto_573292 ) ( ON ?auto_573294 ?auto_573293 ) ( ON ?auto_573295 ?auto_573294 ) ( ON ?auto_573296 ?auto_573295 ) ( not ( = ?auto_573288 ?auto_573289 ) ) ( not ( = ?auto_573288 ?auto_573290 ) ) ( not ( = ?auto_573288 ?auto_573291 ) ) ( not ( = ?auto_573288 ?auto_573292 ) ) ( not ( = ?auto_573288 ?auto_573293 ) ) ( not ( = ?auto_573288 ?auto_573294 ) ) ( not ( = ?auto_573288 ?auto_573295 ) ) ( not ( = ?auto_573288 ?auto_573296 ) ) ( not ( = ?auto_573288 ?auto_573297 ) ) ( not ( = ?auto_573288 ?auto_573298 ) ) ( not ( = ?auto_573288 ?auto_573299 ) ) ( not ( = ?auto_573289 ?auto_573290 ) ) ( not ( = ?auto_573289 ?auto_573291 ) ) ( not ( = ?auto_573289 ?auto_573292 ) ) ( not ( = ?auto_573289 ?auto_573293 ) ) ( not ( = ?auto_573289 ?auto_573294 ) ) ( not ( = ?auto_573289 ?auto_573295 ) ) ( not ( = ?auto_573289 ?auto_573296 ) ) ( not ( = ?auto_573289 ?auto_573297 ) ) ( not ( = ?auto_573289 ?auto_573298 ) ) ( not ( = ?auto_573289 ?auto_573299 ) ) ( not ( = ?auto_573290 ?auto_573291 ) ) ( not ( = ?auto_573290 ?auto_573292 ) ) ( not ( = ?auto_573290 ?auto_573293 ) ) ( not ( = ?auto_573290 ?auto_573294 ) ) ( not ( = ?auto_573290 ?auto_573295 ) ) ( not ( = ?auto_573290 ?auto_573296 ) ) ( not ( = ?auto_573290 ?auto_573297 ) ) ( not ( = ?auto_573290 ?auto_573298 ) ) ( not ( = ?auto_573290 ?auto_573299 ) ) ( not ( = ?auto_573291 ?auto_573292 ) ) ( not ( = ?auto_573291 ?auto_573293 ) ) ( not ( = ?auto_573291 ?auto_573294 ) ) ( not ( = ?auto_573291 ?auto_573295 ) ) ( not ( = ?auto_573291 ?auto_573296 ) ) ( not ( = ?auto_573291 ?auto_573297 ) ) ( not ( = ?auto_573291 ?auto_573298 ) ) ( not ( = ?auto_573291 ?auto_573299 ) ) ( not ( = ?auto_573292 ?auto_573293 ) ) ( not ( = ?auto_573292 ?auto_573294 ) ) ( not ( = ?auto_573292 ?auto_573295 ) ) ( not ( = ?auto_573292 ?auto_573296 ) ) ( not ( = ?auto_573292 ?auto_573297 ) ) ( not ( = ?auto_573292 ?auto_573298 ) ) ( not ( = ?auto_573292 ?auto_573299 ) ) ( not ( = ?auto_573293 ?auto_573294 ) ) ( not ( = ?auto_573293 ?auto_573295 ) ) ( not ( = ?auto_573293 ?auto_573296 ) ) ( not ( = ?auto_573293 ?auto_573297 ) ) ( not ( = ?auto_573293 ?auto_573298 ) ) ( not ( = ?auto_573293 ?auto_573299 ) ) ( not ( = ?auto_573294 ?auto_573295 ) ) ( not ( = ?auto_573294 ?auto_573296 ) ) ( not ( = ?auto_573294 ?auto_573297 ) ) ( not ( = ?auto_573294 ?auto_573298 ) ) ( not ( = ?auto_573294 ?auto_573299 ) ) ( not ( = ?auto_573295 ?auto_573296 ) ) ( not ( = ?auto_573295 ?auto_573297 ) ) ( not ( = ?auto_573295 ?auto_573298 ) ) ( not ( = ?auto_573295 ?auto_573299 ) ) ( not ( = ?auto_573296 ?auto_573297 ) ) ( not ( = ?auto_573296 ?auto_573298 ) ) ( not ( = ?auto_573296 ?auto_573299 ) ) ( not ( = ?auto_573297 ?auto_573298 ) ) ( not ( = ?auto_573297 ?auto_573299 ) ) ( not ( = ?auto_573298 ?auto_573299 ) ) ( CLEAR ?auto_573296 ) ( ON ?auto_573297 ?auto_573298 ) ( CLEAR ?auto_573297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_573288 ?auto_573289 ?auto_573290 ?auto_573291 ?auto_573292 ?auto_573293 ?auto_573294 ?auto_573295 ?auto_573296 ?auto_573297 )
      ( MAKE-11PILE ?auto_573288 ?auto_573289 ?auto_573290 ?auto_573291 ?auto_573292 ?auto_573293 ?auto_573294 ?auto_573295 ?auto_573296 ?auto_573297 ?auto_573298 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_573334 - BLOCK
      ?auto_573335 - BLOCK
      ?auto_573336 - BLOCK
      ?auto_573337 - BLOCK
      ?auto_573338 - BLOCK
      ?auto_573339 - BLOCK
      ?auto_573340 - BLOCK
      ?auto_573341 - BLOCK
      ?auto_573342 - BLOCK
      ?auto_573343 - BLOCK
      ?auto_573344 - BLOCK
    )
    :vars
    (
      ?auto_573345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_573344 ?auto_573345 ) ( ON-TABLE ?auto_573334 ) ( ON ?auto_573335 ?auto_573334 ) ( ON ?auto_573336 ?auto_573335 ) ( ON ?auto_573337 ?auto_573336 ) ( ON ?auto_573338 ?auto_573337 ) ( ON ?auto_573339 ?auto_573338 ) ( ON ?auto_573340 ?auto_573339 ) ( ON ?auto_573341 ?auto_573340 ) ( not ( = ?auto_573334 ?auto_573335 ) ) ( not ( = ?auto_573334 ?auto_573336 ) ) ( not ( = ?auto_573334 ?auto_573337 ) ) ( not ( = ?auto_573334 ?auto_573338 ) ) ( not ( = ?auto_573334 ?auto_573339 ) ) ( not ( = ?auto_573334 ?auto_573340 ) ) ( not ( = ?auto_573334 ?auto_573341 ) ) ( not ( = ?auto_573334 ?auto_573342 ) ) ( not ( = ?auto_573334 ?auto_573343 ) ) ( not ( = ?auto_573334 ?auto_573344 ) ) ( not ( = ?auto_573334 ?auto_573345 ) ) ( not ( = ?auto_573335 ?auto_573336 ) ) ( not ( = ?auto_573335 ?auto_573337 ) ) ( not ( = ?auto_573335 ?auto_573338 ) ) ( not ( = ?auto_573335 ?auto_573339 ) ) ( not ( = ?auto_573335 ?auto_573340 ) ) ( not ( = ?auto_573335 ?auto_573341 ) ) ( not ( = ?auto_573335 ?auto_573342 ) ) ( not ( = ?auto_573335 ?auto_573343 ) ) ( not ( = ?auto_573335 ?auto_573344 ) ) ( not ( = ?auto_573335 ?auto_573345 ) ) ( not ( = ?auto_573336 ?auto_573337 ) ) ( not ( = ?auto_573336 ?auto_573338 ) ) ( not ( = ?auto_573336 ?auto_573339 ) ) ( not ( = ?auto_573336 ?auto_573340 ) ) ( not ( = ?auto_573336 ?auto_573341 ) ) ( not ( = ?auto_573336 ?auto_573342 ) ) ( not ( = ?auto_573336 ?auto_573343 ) ) ( not ( = ?auto_573336 ?auto_573344 ) ) ( not ( = ?auto_573336 ?auto_573345 ) ) ( not ( = ?auto_573337 ?auto_573338 ) ) ( not ( = ?auto_573337 ?auto_573339 ) ) ( not ( = ?auto_573337 ?auto_573340 ) ) ( not ( = ?auto_573337 ?auto_573341 ) ) ( not ( = ?auto_573337 ?auto_573342 ) ) ( not ( = ?auto_573337 ?auto_573343 ) ) ( not ( = ?auto_573337 ?auto_573344 ) ) ( not ( = ?auto_573337 ?auto_573345 ) ) ( not ( = ?auto_573338 ?auto_573339 ) ) ( not ( = ?auto_573338 ?auto_573340 ) ) ( not ( = ?auto_573338 ?auto_573341 ) ) ( not ( = ?auto_573338 ?auto_573342 ) ) ( not ( = ?auto_573338 ?auto_573343 ) ) ( not ( = ?auto_573338 ?auto_573344 ) ) ( not ( = ?auto_573338 ?auto_573345 ) ) ( not ( = ?auto_573339 ?auto_573340 ) ) ( not ( = ?auto_573339 ?auto_573341 ) ) ( not ( = ?auto_573339 ?auto_573342 ) ) ( not ( = ?auto_573339 ?auto_573343 ) ) ( not ( = ?auto_573339 ?auto_573344 ) ) ( not ( = ?auto_573339 ?auto_573345 ) ) ( not ( = ?auto_573340 ?auto_573341 ) ) ( not ( = ?auto_573340 ?auto_573342 ) ) ( not ( = ?auto_573340 ?auto_573343 ) ) ( not ( = ?auto_573340 ?auto_573344 ) ) ( not ( = ?auto_573340 ?auto_573345 ) ) ( not ( = ?auto_573341 ?auto_573342 ) ) ( not ( = ?auto_573341 ?auto_573343 ) ) ( not ( = ?auto_573341 ?auto_573344 ) ) ( not ( = ?auto_573341 ?auto_573345 ) ) ( not ( = ?auto_573342 ?auto_573343 ) ) ( not ( = ?auto_573342 ?auto_573344 ) ) ( not ( = ?auto_573342 ?auto_573345 ) ) ( not ( = ?auto_573343 ?auto_573344 ) ) ( not ( = ?auto_573343 ?auto_573345 ) ) ( not ( = ?auto_573344 ?auto_573345 ) ) ( ON ?auto_573343 ?auto_573344 ) ( CLEAR ?auto_573341 ) ( ON ?auto_573342 ?auto_573343 ) ( CLEAR ?auto_573342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_573334 ?auto_573335 ?auto_573336 ?auto_573337 ?auto_573338 ?auto_573339 ?auto_573340 ?auto_573341 ?auto_573342 )
      ( MAKE-11PILE ?auto_573334 ?auto_573335 ?auto_573336 ?auto_573337 ?auto_573338 ?auto_573339 ?auto_573340 ?auto_573341 ?auto_573342 ?auto_573343 ?auto_573344 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_573380 - BLOCK
      ?auto_573381 - BLOCK
      ?auto_573382 - BLOCK
      ?auto_573383 - BLOCK
      ?auto_573384 - BLOCK
      ?auto_573385 - BLOCK
      ?auto_573386 - BLOCK
      ?auto_573387 - BLOCK
      ?auto_573388 - BLOCK
      ?auto_573389 - BLOCK
      ?auto_573390 - BLOCK
    )
    :vars
    (
      ?auto_573391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_573390 ?auto_573391 ) ( ON-TABLE ?auto_573380 ) ( ON ?auto_573381 ?auto_573380 ) ( ON ?auto_573382 ?auto_573381 ) ( ON ?auto_573383 ?auto_573382 ) ( ON ?auto_573384 ?auto_573383 ) ( ON ?auto_573385 ?auto_573384 ) ( ON ?auto_573386 ?auto_573385 ) ( not ( = ?auto_573380 ?auto_573381 ) ) ( not ( = ?auto_573380 ?auto_573382 ) ) ( not ( = ?auto_573380 ?auto_573383 ) ) ( not ( = ?auto_573380 ?auto_573384 ) ) ( not ( = ?auto_573380 ?auto_573385 ) ) ( not ( = ?auto_573380 ?auto_573386 ) ) ( not ( = ?auto_573380 ?auto_573387 ) ) ( not ( = ?auto_573380 ?auto_573388 ) ) ( not ( = ?auto_573380 ?auto_573389 ) ) ( not ( = ?auto_573380 ?auto_573390 ) ) ( not ( = ?auto_573380 ?auto_573391 ) ) ( not ( = ?auto_573381 ?auto_573382 ) ) ( not ( = ?auto_573381 ?auto_573383 ) ) ( not ( = ?auto_573381 ?auto_573384 ) ) ( not ( = ?auto_573381 ?auto_573385 ) ) ( not ( = ?auto_573381 ?auto_573386 ) ) ( not ( = ?auto_573381 ?auto_573387 ) ) ( not ( = ?auto_573381 ?auto_573388 ) ) ( not ( = ?auto_573381 ?auto_573389 ) ) ( not ( = ?auto_573381 ?auto_573390 ) ) ( not ( = ?auto_573381 ?auto_573391 ) ) ( not ( = ?auto_573382 ?auto_573383 ) ) ( not ( = ?auto_573382 ?auto_573384 ) ) ( not ( = ?auto_573382 ?auto_573385 ) ) ( not ( = ?auto_573382 ?auto_573386 ) ) ( not ( = ?auto_573382 ?auto_573387 ) ) ( not ( = ?auto_573382 ?auto_573388 ) ) ( not ( = ?auto_573382 ?auto_573389 ) ) ( not ( = ?auto_573382 ?auto_573390 ) ) ( not ( = ?auto_573382 ?auto_573391 ) ) ( not ( = ?auto_573383 ?auto_573384 ) ) ( not ( = ?auto_573383 ?auto_573385 ) ) ( not ( = ?auto_573383 ?auto_573386 ) ) ( not ( = ?auto_573383 ?auto_573387 ) ) ( not ( = ?auto_573383 ?auto_573388 ) ) ( not ( = ?auto_573383 ?auto_573389 ) ) ( not ( = ?auto_573383 ?auto_573390 ) ) ( not ( = ?auto_573383 ?auto_573391 ) ) ( not ( = ?auto_573384 ?auto_573385 ) ) ( not ( = ?auto_573384 ?auto_573386 ) ) ( not ( = ?auto_573384 ?auto_573387 ) ) ( not ( = ?auto_573384 ?auto_573388 ) ) ( not ( = ?auto_573384 ?auto_573389 ) ) ( not ( = ?auto_573384 ?auto_573390 ) ) ( not ( = ?auto_573384 ?auto_573391 ) ) ( not ( = ?auto_573385 ?auto_573386 ) ) ( not ( = ?auto_573385 ?auto_573387 ) ) ( not ( = ?auto_573385 ?auto_573388 ) ) ( not ( = ?auto_573385 ?auto_573389 ) ) ( not ( = ?auto_573385 ?auto_573390 ) ) ( not ( = ?auto_573385 ?auto_573391 ) ) ( not ( = ?auto_573386 ?auto_573387 ) ) ( not ( = ?auto_573386 ?auto_573388 ) ) ( not ( = ?auto_573386 ?auto_573389 ) ) ( not ( = ?auto_573386 ?auto_573390 ) ) ( not ( = ?auto_573386 ?auto_573391 ) ) ( not ( = ?auto_573387 ?auto_573388 ) ) ( not ( = ?auto_573387 ?auto_573389 ) ) ( not ( = ?auto_573387 ?auto_573390 ) ) ( not ( = ?auto_573387 ?auto_573391 ) ) ( not ( = ?auto_573388 ?auto_573389 ) ) ( not ( = ?auto_573388 ?auto_573390 ) ) ( not ( = ?auto_573388 ?auto_573391 ) ) ( not ( = ?auto_573389 ?auto_573390 ) ) ( not ( = ?auto_573389 ?auto_573391 ) ) ( not ( = ?auto_573390 ?auto_573391 ) ) ( ON ?auto_573389 ?auto_573390 ) ( ON ?auto_573388 ?auto_573389 ) ( CLEAR ?auto_573386 ) ( ON ?auto_573387 ?auto_573388 ) ( CLEAR ?auto_573387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_573380 ?auto_573381 ?auto_573382 ?auto_573383 ?auto_573384 ?auto_573385 ?auto_573386 ?auto_573387 )
      ( MAKE-11PILE ?auto_573380 ?auto_573381 ?auto_573382 ?auto_573383 ?auto_573384 ?auto_573385 ?auto_573386 ?auto_573387 ?auto_573388 ?auto_573389 ?auto_573390 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_573426 - BLOCK
      ?auto_573427 - BLOCK
      ?auto_573428 - BLOCK
      ?auto_573429 - BLOCK
      ?auto_573430 - BLOCK
      ?auto_573431 - BLOCK
      ?auto_573432 - BLOCK
      ?auto_573433 - BLOCK
      ?auto_573434 - BLOCK
      ?auto_573435 - BLOCK
      ?auto_573436 - BLOCK
    )
    :vars
    (
      ?auto_573437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_573436 ?auto_573437 ) ( ON-TABLE ?auto_573426 ) ( ON ?auto_573427 ?auto_573426 ) ( ON ?auto_573428 ?auto_573427 ) ( ON ?auto_573429 ?auto_573428 ) ( ON ?auto_573430 ?auto_573429 ) ( ON ?auto_573431 ?auto_573430 ) ( not ( = ?auto_573426 ?auto_573427 ) ) ( not ( = ?auto_573426 ?auto_573428 ) ) ( not ( = ?auto_573426 ?auto_573429 ) ) ( not ( = ?auto_573426 ?auto_573430 ) ) ( not ( = ?auto_573426 ?auto_573431 ) ) ( not ( = ?auto_573426 ?auto_573432 ) ) ( not ( = ?auto_573426 ?auto_573433 ) ) ( not ( = ?auto_573426 ?auto_573434 ) ) ( not ( = ?auto_573426 ?auto_573435 ) ) ( not ( = ?auto_573426 ?auto_573436 ) ) ( not ( = ?auto_573426 ?auto_573437 ) ) ( not ( = ?auto_573427 ?auto_573428 ) ) ( not ( = ?auto_573427 ?auto_573429 ) ) ( not ( = ?auto_573427 ?auto_573430 ) ) ( not ( = ?auto_573427 ?auto_573431 ) ) ( not ( = ?auto_573427 ?auto_573432 ) ) ( not ( = ?auto_573427 ?auto_573433 ) ) ( not ( = ?auto_573427 ?auto_573434 ) ) ( not ( = ?auto_573427 ?auto_573435 ) ) ( not ( = ?auto_573427 ?auto_573436 ) ) ( not ( = ?auto_573427 ?auto_573437 ) ) ( not ( = ?auto_573428 ?auto_573429 ) ) ( not ( = ?auto_573428 ?auto_573430 ) ) ( not ( = ?auto_573428 ?auto_573431 ) ) ( not ( = ?auto_573428 ?auto_573432 ) ) ( not ( = ?auto_573428 ?auto_573433 ) ) ( not ( = ?auto_573428 ?auto_573434 ) ) ( not ( = ?auto_573428 ?auto_573435 ) ) ( not ( = ?auto_573428 ?auto_573436 ) ) ( not ( = ?auto_573428 ?auto_573437 ) ) ( not ( = ?auto_573429 ?auto_573430 ) ) ( not ( = ?auto_573429 ?auto_573431 ) ) ( not ( = ?auto_573429 ?auto_573432 ) ) ( not ( = ?auto_573429 ?auto_573433 ) ) ( not ( = ?auto_573429 ?auto_573434 ) ) ( not ( = ?auto_573429 ?auto_573435 ) ) ( not ( = ?auto_573429 ?auto_573436 ) ) ( not ( = ?auto_573429 ?auto_573437 ) ) ( not ( = ?auto_573430 ?auto_573431 ) ) ( not ( = ?auto_573430 ?auto_573432 ) ) ( not ( = ?auto_573430 ?auto_573433 ) ) ( not ( = ?auto_573430 ?auto_573434 ) ) ( not ( = ?auto_573430 ?auto_573435 ) ) ( not ( = ?auto_573430 ?auto_573436 ) ) ( not ( = ?auto_573430 ?auto_573437 ) ) ( not ( = ?auto_573431 ?auto_573432 ) ) ( not ( = ?auto_573431 ?auto_573433 ) ) ( not ( = ?auto_573431 ?auto_573434 ) ) ( not ( = ?auto_573431 ?auto_573435 ) ) ( not ( = ?auto_573431 ?auto_573436 ) ) ( not ( = ?auto_573431 ?auto_573437 ) ) ( not ( = ?auto_573432 ?auto_573433 ) ) ( not ( = ?auto_573432 ?auto_573434 ) ) ( not ( = ?auto_573432 ?auto_573435 ) ) ( not ( = ?auto_573432 ?auto_573436 ) ) ( not ( = ?auto_573432 ?auto_573437 ) ) ( not ( = ?auto_573433 ?auto_573434 ) ) ( not ( = ?auto_573433 ?auto_573435 ) ) ( not ( = ?auto_573433 ?auto_573436 ) ) ( not ( = ?auto_573433 ?auto_573437 ) ) ( not ( = ?auto_573434 ?auto_573435 ) ) ( not ( = ?auto_573434 ?auto_573436 ) ) ( not ( = ?auto_573434 ?auto_573437 ) ) ( not ( = ?auto_573435 ?auto_573436 ) ) ( not ( = ?auto_573435 ?auto_573437 ) ) ( not ( = ?auto_573436 ?auto_573437 ) ) ( ON ?auto_573435 ?auto_573436 ) ( ON ?auto_573434 ?auto_573435 ) ( ON ?auto_573433 ?auto_573434 ) ( CLEAR ?auto_573431 ) ( ON ?auto_573432 ?auto_573433 ) ( CLEAR ?auto_573432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_573426 ?auto_573427 ?auto_573428 ?auto_573429 ?auto_573430 ?auto_573431 ?auto_573432 )
      ( MAKE-11PILE ?auto_573426 ?auto_573427 ?auto_573428 ?auto_573429 ?auto_573430 ?auto_573431 ?auto_573432 ?auto_573433 ?auto_573434 ?auto_573435 ?auto_573436 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_573472 - BLOCK
      ?auto_573473 - BLOCK
      ?auto_573474 - BLOCK
      ?auto_573475 - BLOCK
      ?auto_573476 - BLOCK
      ?auto_573477 - BLOCK
      ?auto_573478 - BLOCK
      ?auto_573479 - BLOCK
      ?auto_573480 - BLOCK
      ?auto_573481 - BLOCK
      ?auto_573482 - BLOCK
    )
    :vars
    (
      ?auto_573483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_573482 ?auto_573483 ) ( ON-TABLE ?auto_573472 ) ( ON ?auto_573473 ?auto_573472 ) ( ON ?auto_573474 ?auto_573473 ) ( ON ?auto_573475 ?auto_573474 ) ( ON ?auto_573476 ?auto_573475 ) ( not ( = ?auto_573472 ?auto_573473 ) ) ( not ( = ?auto_573472 ?auto_573474 ) ) ( not ( = ?auto_573472 ?auto_573475 ) ) ( not ( = ?auto_573472 ?auto_573476 ) ) ( not ( = ?auto_573472 ?auto_573477 ) ) ( not ( = ?auto_573472 ?auto_573478 ) ) ( not ( = ?auto_573472 ?auto_573479 ) ) ( not ( = ?auto_573472 ?auto_573480 ) ) ( not ( = ?auto_573472 ?auto_573481 ) ) ( not ( = ?auto_573472 ?auto_573482 ) ) ( not ( = ?auto_573472 ?auto_573483 ) ) ( not ( = ?auto_573473 ?auto_573474 ) ) ( not ( = ?auto_573473 ?auto_573475 ) ) ( not ( = ?auto_573473 ?auto_573476 ) ) ( not ( = ?auto_573473 ?auto_573477 ) ) ( not ( = ?auto_573473 ?auto_573478 ) ) ( not ( = ?auto_573473 ?auto_573479 ) ) ( not ( = ?auto_573473 ?auto_573480 ) ) ( not ( = ?auto_573473 ?auto_573481 ) ) ( not ( = ?auto_573473 ?auto_573482 ) ) ( not ( = ?auto_573473 ?auto_573483 ) ) ( not ( = ?auto_573474 ?auto_573475 ) ) ( not ( = ?auto_573474 ?auto_573476 ) ) ( not ( = ?auto_573474 ?auto_573477 ) ) ( not ( = ?auto_573474 ?auto_573478 ) ) ( not ( = ?auto_573474 ?auto_573479 ) ) ( not ( = ?auto_573474 ?auto_573480 ) ) ( not ( = ?auto_573474 ?auto_573481 ) ) ( not ( = ?auto_573474 ?auto_573482 ) ) ( not ( = ?auto_573474 ?auto_573483 ) ) ( not ( = ?auto_573475 ?auto_573476 ) ) ( not ( = ?auto_573475 ?auto_573477 ) ) ( not ( = ?auto_573475 ?auto_573478 ) ) ( not ( = ?auto_573475 ?auto_573479 ) ) ( not ( = ?auto_573475 ?auto_573480 ) ) ( not ( = ?auto_573475 ?auto_573481 ) ) ( not ( = ?auto_573475 ?auto_573482 ) ) ( not ( = ?auto_573475 ?auto_573483 ) ) ( not ( = ?auto_573476 ?auto_573477 ) ) ( not ( = ?auto_573476 ?auto_573478 ) ) ( not ( = ?auto_573476 ?auto_573479 ) ) ( not ( = ?auto_573476 ?auto_573480 ) ) ( not ( = ?auto_573476 ?auto_573481 ) ) ( not ( = ?auto_573476 ?auto_573482 ) ) ( not ( = ?auto_573476 ?auto_573483 ) ) ( not ( = ?auto_573477 ?auto_573478 ) ) ( not ( = ?auto_573477 ?auto_573479 ) ) ( not ( = ?auto_573477 ?auto_573480 ) ) ( not ( = ?auto_573477 ?auto_573481 ) ) ( not ( = ?auto_573477 ?auto_573482 ) ) ( not ( = ?auto_573477 ?auto_573483 ) ) ( not ( = ?auto_573478 ?auto_573479 ) ) ( not ( = ?auto_573478 ?auto_573480 ) ) ( not ( = ?auto_573478 ?auto_573481 ) ) ( not ( = ?auto_573478 ?auto_573482 ) ) ( not ( = ?auto_573478 ?auto_573483 ) ) ( not ( = ?auto_573479 ?auto_573480 ) ) ( not ( = ?auto_573479 ?auto_573481 ) ) ( not ( = ?auto_573479 ?auto_573482 ) ) ( not ( = ?auto_573479 ?auto_573483 ) ) ( not ( = ?auto_573480 ?auto_573481 ) ) ( not ( = ?auto_573480 ?auto_573482 ) ) ( not ( = ?auto_573480 ?auto_573483 ) ) ( not ( = ?auto_573481 ?auto_573482 ) ) ( not ( = ?auto_573481 ?auto_573483 ) ) ( not ( = ?auto_573482 ?auto_573483 ) ) ( ON ?auto_573481 ?auto_573482 ) ( ON ?auto_573480 ?auto_573481 ) ( ON ?auto_573479 ?auto_573480 ) ( ON ?auto_573478 ?auto_573479 ) ( CLEAR ?auto_573476 ) ( ON ?auto_573477 ?auto_573478 ) ( CLEAR ?auto_573477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_573472 ?auto_573473 ?auto_573474 ?auto_573475 ?auto_573476 ?auto_573477 )
      ( MAKE-11PILE ?auto_573472 ?auto_573473 ?auto_573474 ?auto_573475 ?auto_573476 ?auto_573477 ?auto_573478 ?auto_573479 ?auto_573480 ?auto_573481 ?auto_573482 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_573518 - BLOCK
      ?auto_573519 - BLOCK
      ?auto_573520 - BLOCK
      ?auto_573521 - BLOCK
      ?auto_573522 - BLOCK
      ?auto_573523 - BLOCK
      ?auto_573524 - BLOCK
      ?auto_573525 - BLOCK
      ?auto_573526 - BLOCK
      ?auto_573527 - BLOCK
      ?auto_573528 - BLOCK
    )
    :vars
    (
      ?auto_573529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_573528 ?auto_573529 ) ( ON-TABLE ?auto_573518 ) ( ON ?auto_573519 ?auto_573518 ) ( ON ?auto_573520 ?auto_573519 ) ( ON ?auto_573521 ?auto_573520 ) ( not ( = ?auto_573518 ?auto_573519 ) ) ( not ( = ?auto_573518 ?auto_573520 ) ) ( not ( = ?auto_573518 ?auto_573521 ) ) ( not ( = ?auto_573518 ?auto_573522 ) ) ( not ( = ?auto_573518 ?auto_573523 ) ) ( not ( = ?auto_573518 ?auto_573524 ) ) ( not ( = ?auto_573518 ?auto_573525 ) ) ( not ( = ?auto_573518 ?auto_573526 ) ) ( not ( = ?auto_573518 ?auto_573527 ) ) ( not ( = ?auto_573518 ?auto_573528 ) ) ( not ( = ?auto_573518 ?auto_573529 ) ) ( not ( = ?auto_573519 ?auto_573520 ) ) ( not ( = ?auto_573519 ?auto_573521 ) ) ( not ( = ?auto_573519 ?auto_573522 ) ) ( not ( = ?auto_573519 ?auto_573523 ) ) ( not ( = ?auto_573519 ?auto_573524 ) ) ( not ( = ?auto_573519 ?auto_573525 ) ) ( not ( = ?auto_573519 ?auto_573526 ) ) ( not ( = ?auto_573519 ?auto_573527 ) ) ( not ( = ?auto_573519 ?auto_573528 ) ) ( not ( = ?auto_573519 ?auto_573529 ) ) ( not ( = ?auto_573520 ?auto_573521 ) ) ( not ( = ?auto_573520 ?auto_573522 ) ) ( not ( = ?auto_573520 ?auto_573523 ) ) ( not ( = ?auto_573520 ?auto_573524 ) ) ( not ( = ?auto_573520 ?auto_573525 ) ) ( not ( = ?auto_573520 ?auto_573526 ) ) ( not ( = ?auto_573520 ?auto_573527 ) ) ( not ( = ?auto_573520 ?auto_573528 ) ) ( not ( = ?auto_573520 ?auto_573529 ) ) ( not ( = ?auto_573521 ?auto_573522 ) ) ( not ( = ?auto_573521 ?auto_573523 ) ) ( not ( = ?auto_573521 ?auto_573524 ) ) ( not ( = ?auto_573521 ?auto_573525 ) ) ( not ( = ?auto_573521 ?auto_573526 ) ) ( not ( = ?auto_573521 ?auto_573527 ) ) ( not ( = ?auto_573521 ?auto_573528 ) ) ( not ( = ?auto_573521 ?auto_573529 ) ) ( not ( = ?auto_573522 ?auto_573523 ) ) ( not ( = ?auto_573522 ?auto_573524 ) ) ( not ( = ?auto_573522 ?auto_573525 ) ) ( not ( = ?auto_573522 ?auto_573526 ) ) ( not ( = ?auto_573522 ?auto_573527 ) ) ( not ( = ?auto_573522 ?auto_573528 ) ) ( not ( = ?auto_573522 ?auto_573529 ) ) ( not ( = ?auto_573523 ?auto_573524 ) ) ( not ( = ?auto_573523 ?auto_573525 ) ) ( not ( = ?auto_573523 ?auto_573526 ) ) ( not ( = ?auto_573523 ?auto_573527 ) ) ( not ( = ?auto_573523 ?auto_573528 ) ) ( not ( = ?auto_573523 ?auto_573529 ) ) ( not ( = ?auto_573524 ?auto_573525 ) ) ( not ( = ?auto_573524 ?auto_573526 ) ) ( not ( = ?auto_573524 ?auto_573527 ) ) ( not ( = ?auto_573524 ?auto_573528 ) ) ( not ( = ?auto_573524 ?auto_573529 ) ) ( not ( = ?auto_573525 ?auto_573526 ) ) ( not ( = ?auto_573525 ?auto_573527 ) ) ( not ( = ?auto_573525 ?auto_573528 ) ) ( not ( = ?auto_573525 ?auto_573529 ) ) ( not ( = ?auto_573526 ?auto_573527 ) ) ( not ( = ?auto_573526 ?auto_573528 ) ) ( not ( = ?auto_573526 ?auto_573529 ) ) ( not ( = ?auto_573527 ?auto_573528 ) ) ( not ( = ?auto_573527 ?auto_573529 ) ) ( not ( = ?auto_573528 ?auto_573529 ) ) ( ON ?auto_573527 ?auto_573528 ) ( ON ?auto_573526 ?auto_573527 ) ( ON ?auto_573525 ?auto_573526 ) ( ON ?auto_573524 ?auto_573525 ) ( ON ?auto_573523 ?auto_573524 ) ( CLEAR ?auto_573521 ) ( ON ?auto_573522 ?auto_573523 ) ( CLEAR ?auto_573522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_573518 ?auto_573519 ?auto_573520 ?auto_573521 ?auto_573522 )
      ( MAKE-11PILE ?auto_573518 ?auto_573519 ?auto_573520 ?auto_573521 ?auto_573522 ?auto_573523 ?auto_573524 ?auto_573525 ?auto_573526 ?auto_573527 ?auto_573528 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_573564 - BLOCK
      ?auto_573565 - BLOCK
      ?auto_573566 - BLOCK
      ?auto_573567 - BLOCK
      ?auto_573568 - BLOCK
      ?auto_573569 - BLOCK
      ?auto_573570 - BLOCK
      ?auto_573571 - BLOCK
      ?auto_573572 - BLOCK
      ?auto_573573 - BLOCK
      ?auto_573574 - BLOCK
    )
    :vars
    (
      ?auto_573575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_573574 ?auto_573575 ) ( ON-TABLE ?auto_573564 ) ( ON ?auto_573565 ?auto_573564 ) ( ON ?auto_573566 ?auto_573565 ) ( not ( = ?auto_573564 ?auto_573565 ) ) ( not ( = ?auto_573564 ?auto_573566 ) ) ( not ( = ?auto_573564 ?auto_573567 ) ) ( not ( = ?auto_573564 ?auto_573568 ) ) ( not ( = ?auto_573564 ?auto_573569 ) ) ( not ( = ?auto_573564 ?auto_573570 ) ) ( not ( = ?auto_573564 ?auto_573571 ) ) ( not ( = ?auto_573564 ?auto_573572 ) ) ( not ( = ?auto_573564 ?auto_573573 ) ) ( not ( = ?auto_573564 ?auto_573574 ) ) ( not ( = ?auto_573564 ?auto_573575 ) ) ( not ( = ?auto_573565 ?auto_573566 ) ) ( not ( = ?auto_573565 ?auto_573567 ) ) ( not ( = ?auto_573565 ?auto_573568 ) ) ( not ( = ?auto_573565 ?auto_573569 ) ) ( not ( = ?auto_573565 ?auto_573570 ) ) ( not ( = ?auto_573565 ?auto_573571 ) ) ( not ( = ?auto_573565 ?auto_573572 ) ) ( not ( = ?auto_573565 ?auto_573573 ) ) ( not ( = ?auto_573565 ?auto_573574 ) ) ( not ( = ?auto_573565 ?auto_573575 ) ) ( not ( = ?auto_573566 ?auto_573567 ) ) ( not ( = ?auto_573566 ?auto_573568 ) ) ( not ( = ?auto_573566 ?auto_573569 ) ) ( not ( = ?auto_573566 ?auto_573570 ) ) ( not ( = ?auto_573566 ?auto_573571 ) ) ( not ( = ?auto_573566 ?auto_573572 ) ) ( not ( = ?auto_573566 ?auto_573573 ) ) ( not ( = ?auto_573566 ?auto_573574 ) ) ( not ( = ?auto_573566 ?auto_573575 ) ) ( not ( = ?auto_573567 ?auto_573568 ) ) ( not ( = ?auto_573567 ?auto_573569 ) ) ( not ( = ?auto_573567 ?auto_573570 ) ) ( not ( = ?auto_573567 ?auto_573571 ) ) ( not ( = ?auto_573567 ?auto_573572 ) ) ( not ( = ?auto_573567 ?auto_573573 ) ) ( not ( = ?auto_573567 ?auto_573574 ) ) ( not ( = ?auto_573567 ?auto_573575 ) ) ( not ( = ?auto_573568 ?auto_573569 ) ) ( not ( = ?auto_573568 ?auto_573570 ) ) ( not ( = ?auto_573568 ?auto_573571 ) ) ( not ( = ?auto_573568 ?auto_573572 ) ) ( not ( = ?auto_573568 ?auto_573573 ) ) ( not ( = ?auto_573568 ?auto_573574 ) ) ( not ( = ?auto_573568 ?auto_573575 ) ) ( not ( = ?auto_573569 ?auto_573570 ) ) ( not ( = ?auto_573569 ?auto_573571 ) ) ( not ( = ?auto_573569 ?auto_573572 ) ) ( not ( = ?auto_573569 ?auto_573573 ) ) ( not ( = ?auto_573569 ?auto_573574 ) ) ( not ( = ?auto_573569 ?auto_573575 ) ) ( not ( = ?auto_573570 ?auto_573571 ) ) ( not ( = ?auto_573570 ?auto_573572 ) ) ( not ( = ?auto_573570 ?auto_573573 ) ) ( not ( = ?auto_573570 ?auto_573574 ) ) ( not ( = ?auto_573570 ?auto_573575 ) ) ( not ( = ?auto_573571 ?auto_573572 ) ) ( not ( = ?auto_573571 ?auto_573573 ) ) ( not ( = ?auto_573571 ?auto_573574 ) ) ( not ( = ?auto_573571 ?auto_573575 ) ) ( not ( = ?auto_573572 ?auto_573573 ) ) ( not ( = ?auto_573572 ?auto_573574 ) ) ( not ( = ?auto_573572 ?auto_573575 ) ) ( not ( = ?auto_573573 ?auto_573574 ) ) ( not ( = ?auto_573573 ?auto_573575 ) ) ( not ( = ?auto_573574 ?auto_573575 ) ) ( ON ?auto_573573 ?auto_573574 ) ( ON ?auto_573572 ?auto_573573 ) ( ON ?auto_573571 ?auto_573572 ) ( ON ?auto_573570 ?auto_573571 ) ( ON ?auto_573569 ?auto_573570 ) ( ON ?auto_573568 ?auto_573569 ) ( CLEAR ?auto_573566 ) ( ON ?auto_573567 ?auto_573568 ) ( CLEAR ?auto_573567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_573564 ?auto_573565 ?auto_573566 ?auto_573567 )
      ( MAKE-11PILE ?auto_573564 ?auto_573565 ?auto_573566 ?auto_573567 ?auto_573568 ?auto_573569 ?auto_573570 ?auto_573571 ?auto_573572 ?auto_573573 ?auto_573574 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_573610 - BLOCK
      ?auto_573611 - BLOCK
      ?auto_573612 - BLOCK
      ?auto_573613 - BLOCK
      ?auto_573614 - BLOCK
      ?auto_573615 - BLOCK
      ?auto_573616 - BLOCK
      ?auto_573617 - BLOCK
      ?auto_573618 - BLOCK
      ?auto_573619 - BLOCK
      ?auto_573620 - BLOCK
    )
    :vars
    (
      ?auto_573621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_573620 ?auto_573621 ) ( ON-TABLE ?auto_573610 ) ( ON ?auto_573611 ?auto_573610 ) ( not ( = ?auto_573610 ?auto_573611 ) ) ( not ( = ?auto_573610 ?auto_573612 ) ) ( not ( = ?auto_573610 ?auto_573613 ) ) ( not ( = ?auto_573610 ?auto_573614 ) ) ( not ( = ?auto_573610 ?auto_573615 ) ) ( not ( = ?auto_573610 ?auto_573616 ) ) ( not ( = ?auto_573610 ?auto_573617 ) ) ( not ( = ?auto_573610 ?auto_573618 ) ) ( not ( = ?auto_573610 ?auto_573619 ) ) ( not ( = ?auto_573610 ?auto_573620 ) ) ( not ( = ?auto_573610 ?auto_573621 ) ) ( not ( = ?auto_573611 ?auto_573612 ) ) ( not ( = ?auto_573611 ?auto_573613 ) ) ( not ( = ?auto_573611 ?auto_573614 ) ) ( not ( = ?auto_573611 ?auto_573615 ) ) ( not ( = ?auto_573611 ?auto_573616 ) ) ( not ( = ?auto_573611 ?auto_573617 ) ) ( not ( = ?auto_573611 ?auto_573618 ) ) ( not ( = ?auto_573611 ?auto_573619 ) ) ( not ( = ?auto_573611 ?auto_573620 ) ) ( not ( = ?auto_573611 ?auto_573621 ) ) ( not ( = ?auto_573612 ?auto_573613 ) ) ( not ( = ?auto_573612 ?auto_573614 ) ) ( not ( = ?auto_573612 ?auto_573615 ) ) ( not ( = ?auto_573612 ?auto_573616 ) ) ( not ( = ?auto_573612 ?auto_573617 ) ) ( not ( = ?auto_573612 ?auto_573618 ) ) ( not ( = ?auto_573612 ?auto_573619 ) ) ( not ( = ?auto_573612 ?auto_573620 ) ) ( not ( = ?auto_573612 ?auto_573621 ) ) ( not ( = ?auto_573613 ?auto_573614 ) ) ( not ( = ?auto_573613 ?auto_573615 ) ) ( not ( = ?auto_573613 ?auto_573616 ) ) ( not ( = ?auto_573613 ?auto_573617 ) ) ( not ( = ?auto_573613 ?auto_573618 ) ) ( not ( = ?auto_573613 ?auto_573619 ) ) ( not ( = ?auto_573613 ?auto_573620 ) ) ( not ( = ?auto_573613 ?auto_573621 ) ) ( not ( = ?auto_573614 ?auto_573615 ) ) ( not ( = ?auto_573614 ?auto_573616 ) ) ( not ( = ?auto_573614 ?auto_573617 ) ) ( not ( = ?auto_573614 ?auto_573618 ) ) ( not ( = ?auto_573614 ?auto_573619 ) ) ( not ( = ?auto_573614 ?auto_573620 ) ) ( not ( = ?auto_573614 ?auto_573621 ) ) ( not ( = ?auto_573615 ?auto_573616 ) ) ( not ( = ?auto_573615 ?auto_573617 ) ) ( not ( = ?auto_573615 ?auto_573618 ) ) ( not ( = ?auto_573615 ?auto_573619 ) ) ( not ( = ?auto_573615 ?auto_573620 ) ) ( not ( = ?auto_573615 ?auto_573621 ) ) ( not ( = ?auto_573616 ?auto_573617 ) ) ( not ( = ?auto_573616 ?auto_573618 ) ) ( not ( = ?auto_573616 ?auto_573619 ) ) ( not ( = ?auto_573616 ?auto_573620 ) ) ( not ( = ?auto_573616 ?auto_573621 ) ) ( not ( = ?auto_573617 ?auto_573618 ) ) ( not ( = ?auto_573617 ?auto_573619 ) ) ( not ( = ?auto_573617 ?auto_573620 ) ) ( not ( = ?auto_573617 ?auto_573621 ) ) ( not ( = ?auto_573618 ?auto_573619 ) ) ( not ( = ?auto_573618 ?auto_573620 ) ) ( not ( = ?auto_573618 ?auto_573621 ) ) ( not ( = ?auto_573619 ?auto_573620 ) ) ( not ( = ?auto_573619 ?auto_573621 ) ) ( not ( = ?auto_573620 ?auto_573621 ) ) ( ON ?auto_573619 ?auto_573620 ) ( ON ?auto_573618 ?auto_573619 ) ( ON ?auto_573617 ?auto_573618 ) ( ON ?auto_573616 ?auto_573617 ) ( ON ?auto_573615 ?auto_573616 ) ( ON ?auto_573614 ?auto_573615 ) ( ON ?auto_573613 ?auto_573614 ) ( CLEAR ?auto_573611 ) ( ON ?auto_573612 ?auto_573613 ) ( CLEAR ?auto_573612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_573610 ?auto_573611 ?auto_573612 )
      ( MAKE-11PILE ?auto_573610 ?auto_573611 ?auto_573612 ?auto_573613 ?auto_573614 ?auto_573615 ?auto_573616 ?auto_573617 ?auto_573618 ?auto_573619 ?auto_573620 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_573656 - BLOCK
      ?auto_573657 - BLOCK
      ?auto_573658 - BLOCK
      ?auto_573659 - BLOCK
      ?auto_573660 - BLOCK
      ?auto_573661 - BLOCK
      ?auto_573662 - BLOCK
      ?auto_573663 - BLOCK
      ?auto_573664 - BLOCK
      ?auto_573665 - BLOCK
      ?auto_573666 - BLOCK
    )
    :vars
    (
      ?auto_573667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_573666 ?auto_573667 ) ( ON-TABLE ?auto_573656 ) ( not ( = ?auto_573656 ?auto_573657 ) ) ( not ( = ?auto_573656 ?auto_573658 ) ) ( not ( = ?auto_573656 ?auto_573659 ) ) ( not ( = ?auto_573656 ?auto_573660 ) ) ( not ( = ?auto_573656 ?auto_573661 ) ) ( not ( = ?auto_573656 ?auto_573662 ) ) ( not ( = ?auto_573656 ?auto_573663 ) ) ( not ( = ?auto_573656 ?auto_573664 ) ) ( not ( = ?auto_573656 ?auto_573665 ) ) ( not ( = ?auto_573656 ?auto_573666 ) ) ( not ( = ?auto_573656 ?auto_573667 ) ) ( not ( = ?auto_573657 ?auto_573658 ) ) ( not ( = ?auto_573657 ?auto_573659 ) ) ( not ( = ?auto_573657 ?auto_573660 ) ) ( not ( = ?auto_573657 ?auto_573661 ) ) ( not ( = ?auto_573657 ?auto_573662 ) ) ( not ( = ?auto_573657 ?auto_573663 ) ) ( not ( = ?auto_573657 ?auto_573664 ) ) ( not ( = ?auto_573657 ?auto_573665 ) ) ( not ( = ?auto_573657 ?auto_573666 ) ) ( not ( = ?auto_573657 ?auto_573667 ) ) ( not ( = ?auto_573658 ?auto_573659 ) ) ( not ( = ?auto_573658 ?auto_573660 ) ) ( not ( = ?auto_573658 ?auto_573661 ) ) ( not ( = ?auto_573658 ?auto_573662 ) ) ( not ( = ?auto_573658 ?auto_573663 ) ) ( not ( = ?auto_573658 ?auto_573664 ) ) ( not ( = ?auto_573658 ?auto_573665 ) ) ( not ( = ?auto_573658 ?auto_573666 ) ) ( not ( = ?auto_573658 ?auto_573667 ) ) ( not ( = ?auto_573659 ?auto_573660 ) ) ( not ( = ?auto_573659 ?auto_573661 ) ) ( not ( = ?auto_573659 ?auto_573662 ) ) ( not ( = ?auto_573659 ?auto_573663 ) ) ( not ( = ?auto_573659 ?auto_573664 ) ) ( not ( = ?auto_573659 ?auto_573665 ) ) ( not ( = ?auto_573659 ?auto_573666 ) ) ( not ( = ?auto_573659 ?auto_573667 ) ) ( not ( = ?auto_573660 ?auto_573661 ) ) ( not ( = ?auto_573660 ?auto_573662 ) ) ( not ( = ?auto_573660 ?auto_573663 ) ) ( not ( = ?auto_573660 ?auto_573664 ) ) ( not ( = ?auto_573660 ?auto_573665 ) ) ( not ( = ?auto_573660 ?auto_573666 ) ) ( not ( = ?auto_573660 ?auto_573667 ) ) ( not ( = ?auto_573661 ?auto_573662 ) ) ( not ( = ?auto_573661 ?auto_573663 ) ) ( not ( = ?auto_573661 ?auto_573664 ) ) ( not ( = ?auto_573661 ?auto_573665 ) ) ( not ( = ?auto_573661 ?auto_573666 ) ) ( not ( = ?auto_573661 ?auto_573667 ) ) ( not ( = ?auto_573662 ?auto_573663 ) ) ( not ( = ?auto_573662 ?auto_573664 ) ) ( not ( = ?auto_573662 ?auto_573665 ) ) ( not ( = ?auto_573662 ?auto_573666 ) ) ( not ( = ?auto_573662 ?auto_573667 ) ) ( not ( = ?auto_573663 ?auto_573664 ) ) ( not ( = ?auto_573663 ?auto_573665 ) ) ( not ( = ?auto_573663 ?auto_573666 ) ) ( not ( = ?auto_573663 ?auto_573667 ) ) ( not ( = ?auto_573664 ?auto_573665 ) ) ( not ( = ?auto_573664 ?auto_573666 ) ) ( not ( = ?auto_573664 ?auto_573667 ) ) ( not ( = ?auto_573665 ?auto_573666 ) ) ( not ( = ?auto_573665 ?auto_573667 ) ) ( not ( = ?auto_573666 ?auto_573667 ) ) ( ON ?auto_573665 ?auto_573666 ) ( ON ?auto_573664 ?auto_573665 ) ( ON ?auto_573663 ?auto_573664 ) ( ON ?auto_573662 ?auto_573663 ) ( ON ?auto_573661 ?auto_573662 ) ( ON ?auto_573660 ?auto_573661 ) ( ON ?auto_573659 ?auto_573660 ) ( ON ?auto_573658 ?auto_573659 ) ( CLEAR ?auto_573656 ) ( ON ?auto_573657 ?auto_573658 ) ( CLEAR ?auto_573657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_573656 ?auto_573657 )
      ( MAKE-11PILE ?auto_573656 ?auto_573657 ?auto_573658 ?auto_573659 ?auto_573660 ?auto_573661 ?auto_573662 ?auto_573663 ?auto_573664 ?auto_573665 ?auto_573666 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_573702 - BLOCK
      ?auto_573703 - BLOCK
      ?auto_573704 - BLOCK
      ?auto_573705 - BLOCK
      ?auto_573706 - BLOCK
      ?auto_573707 - BLOCK
      ?auto_573708 - BLOCK
      ?auto_573709 - BLOCK
      ?auto_573710 - BLOCK
      ?auto_573711 - BLOCK
      ?auto_573712 - BLOCK
    )
    :vars
    (
      ?auto_573713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_573712 ?auto_573713 ) ( not ( = ?auto_573702 ?auto_573703 ) ) ( not ( = ?auto_573702 ?auto_573704 ) ) ( not ( = ?auto_573702 ?auto_573705 ) ) ( not ( = ?auto_573702 ?auto_573706 ) ) ( not ( = ?auto_573702 ?auto_573707 ) ) ( not ( = ?auto_573702 ?auto_573708 ) ) ( not ( = ?auto_573702 ?auto_573709 ) ) ( not ( = ?auto_573702 ?auto_573710 ) ) ( not ( = ?auto_573702 ?auto_573711 ) ) ( not ( = ?auto_573702 ?auto_573712 ) ) ( not ( = ?auto_573702 ?auto_573713 ) ) ( not ( = ?auto_573703 ?auto_573704 ) ) ( not ( = ?auto_573703 ?auto_573705 ) ) ( not ( = ?auto_573703 ?auto_573706 ) ) ( not ( = ?auto_573703 ?auto_573707 ) ) ( not ( = ?auto_573703 ?auto_573708 ) ) ( not ( = ?auto_573703 ?auto_573709 ) ) ( not ( = ?auto_573703 ?auto_573710 ) ) ( not ( = ?auto_573703 ?auto_573711 ) ) ( not ( = ?auto_573703 ?auto_573712 ) ) ( not ( = ?auto_573703 ?auto_573713 ) ) ( not ( = ?auto_573704 ?auto_573705 ) ) ( not ( = ?auto_573704 ?auto_573706 ) ) ( not ( = ?auto_573704 ?auto_573707 ) ) ( not ( = ?auto_573704 ?auto_573708 ) ) ( not ( = ?auto_573704 ?auto_573709 ) ) ( not ( = ?auto_573704 ?auto_573710 ) ) ( not ( = ?auto_573704 ?auto_573711 ) ) ( not ( = ?auto_573704 ?auto_573712 ) ) ( not ( = ?auto_573704 ?auto_573713 ) ) ( not ( = ?auto_573705 ?auto_573706 ) ) ( not ( = ?auto_573705 ?auto_573707 ) ) ( not ( = ?auto_573705 ?auto_573708 ) ) ( not ( = ?auto_573705 ?auto_573709 ) ) ( not ( = ?auto_573705 ?auto_573710 ) ) ( not ( = ?auto_573705 ?auto_573711 ) ) ( not ( = ?auto_573705 ?auto_573712 ) ) ( not ( = ?auto_573705 ?auto_573713 ) ) ( not ( = ?auto_573706 ?auto_573707 ) ) ( not ( = ?auto_573706 ?auto_573708 ) ) ( not ( = ?auto_573706 ?auto_573709 ) ) ( not ( = ?auto_573706 ?auto_573710 ) ) ( not ( = ?auto_573706 ?auto_573711 ) ) ( not ( = ?auto_573706 ?auto_573712 ) ) ( not ( = ?auto_573706 ?auto_573713 ) ) ( not ( = ?auto_573707 ?auto_573708 ) ) ( not ( = ?auto_573707 ?auto_573709 ) ) ( not ( = ?auto_573707 ?auto_573710 ) ) ( not ( = ?auto_573707 ?auto_573711 ) ) ( not ( = ?auto_573707 ?auto_573712 ) ) ( not ( = ?auto_573707 ?auto_573713 ) ) ( not ( = ?auto_573708 ?auto_573709 ) ) ( not ( = ?auto_573708 ?auto_573710 ) ) ( not ( = ?auto_573708 ?auto_573711 ) ) ( not ( = ?auto_573708 ?auto_573712 ) ) ( not ( = ?auto_573708 ?auto_573713 ) ) ( not ( = ?auto_573709 ?auto_573710 ) ) ( not ( = ?auto_573709 ?auto_573711 ) ) ( not ( = ?auto_573709 ?auto_573712 ) ) ( not ( = ?auto_573709 ?auto_573713 ) ) ( not ( = ?auto_573710 ?auto_573711 ) ) ( not ( = ?auto_573710 ?auto_573712 ) ) ( not ( = ?auto_573710 ?auto_573713 ) ) ( not ( = ?auto_573711 ?auto_573712 ) ) ( not ( = ?auto_573711 ?auto_573713 ) ) ( not ( = ?auto_573712 ?auto_573713 ) ) ( ON ?auto_573711 ?auto_573712 ) ( ON ?auto_573710 ?auto_573711 ) ( ON ?auto_573709 ?auto_573710 ) ( ON ?auto_573708 ?auto_573709 ) ( ON ?auto_573707 ?auto_573708 ) ( ON ?auto_573706 ?auto_573707 ) ( ON ?auto_573705 ?auto_573706 ) ( ON ?auto_573704 ?auto_573705 ) ( ON ?auto_573703 ?auto_573704 ) ( ON ?auto_573702 ?auto_573703 ) ( CLEAR ?auto_573702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_573702 )
      ( MAKE-11PILE ?auto_573702 ?auto_573703 ?auto_573704 ?auto_573705 ?auto_573706 ?auto_573707 ?auto_573708 ?auto_573709 ?auto_573710 ?auto_573711 ?auto_573712 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_573749 - BLOCK
      ?auto_573750 - BLOCK
      ?auto_573751 - BLOCK
      ?auto_573752 - BLOCK
      ?auto_573753 - BLOCK
      ?auto_573754 - BLOCK
      ?auto_573755 - BLOCK
      ?auto_573756 - BLOCK
      ?auto_573757 - BLOCK
      ?auto_573758 - BLOCK
      ?auto_573759 - BLOCK
      ?auto_573760 - BLOCK
    )
    :vars
    (
      ?auto_573761 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_573759 ) ( ON ?auto_573760 ?auto_573761 ) ( CLEAR ?auto_573760 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_573749 ) ( ON ?auto_573750 ?auto_573749 ) ( ON ?auto_573751 ?auto_573750 ) ( ON ?auto_573752 ?auto_573751 ) ( ON ?auto_573753 ?auto_573752 ) ( ON ?auto_573754 ?auto_573753 ) ( ON ?auto_573755 ?auto_573754 ) ( ON ?auto_573756 ?auto_573755 ) ( ON ?auto_573757 ?auto_573756 ) ( ON ?auto_573758 ?auto_573757 ) ( ON ?auto_573759 ?auto_573758 ) ( not ( = ?auto_573749 ?auto_573750 ) ) ( not ( = ?auto_573749 ?auto_573751 ) ) ( not ( = ?auto_573749 ?auto_573752 ) ) ( not ( = ?auto_573749 ?auto_573753 ) ) ( not ( = ?auto_573749 ?auto_573754 ) ) ( not ( = ?auto_573749 ?auto_573755 ) ) ( not ( = ?auto_573749 ?auto_573756 ) ) ( not ( = ?auto_573749 ?auto_573757 ) ) ( not ( = ?auto_573749 ?auto_573758 ) ) ( not ( = ?auto_573749 ?auto_573759 ) ) ( not ( = ?auto_573749 ?auto_573760 ) ) ( not ( = ?auto_573749 ?auto_573761 ) ) ( not ( = ?auto_573750 ?auto_573751 ) ) ( not ( = ?auto_573750 ?auto_573752 ) ) ( not ( = ?auto_573750 ?auto_573753 ) ) ( not ( = ?auto_573750 ?auto_573754 ) ) ( not ( = ?auto_573750 ?auto_573755 ) ) ( not ( = ?auto_573750 ?auto_573756 ) ) ( not ( = ?auto_573750 ?auto_573757 ) ) ( not ( = ?auto_573750 ?auto_573758 ) ) ( not ( = ?auto_573750 ?auto_573759 ) ) ( not ( = ?auto_573750 ?auto_573760 ) ) ( not ( = ?auto_573750 ?auto_573761 ) ) ( not ( = ?auto_573751 ?auto_573752 ) ) ( not ( = ?auto_573751 ?auto_573753 ) ) ( not ( = ?auto_573751 ?auto_573754 ) ) ( not ( = ?auto_573751 ?auto_573755 ) ) ( not ( = ?auto_573751 ?auto_573756 ) ) ( not ( = ?auto_573751 ?auto_573757 ) ) ( not ( = ?auto_573751 ?auto_573758 ) ) ( not ( = ?auto_573751 ?auto_573759 ) ) ( not ( = ?auto_573751 ?auto_573760 ) ) ( not ( = ?auto_573751 ?auto_573761 ) ) ( not ( = ?auto_573752 ?auto_573753 ) ) ( not ( = ?auto_573752 ?auto_573754 ) ) ( not ( = ?auto_573752 ?auto_573755 ) ) ( not ( = ?auto_573752 ?auto_573756 ) ) ( not ( = ?auto_573752 ?auto_573757 ) ) ( not ( = ?auto_573752 ?auto_573758 ) ) ( not ( = ?auto_573752 ?auto_573759 ) ) ( not ( = ?auto_573752 ?auto_573760 ) ) ( not ( = ?auto_573752 ?auto_573761 ) ) ( not ( = ?auto_573753 ?auto_573754 ) ) ( not ( = ?auto_573753 ?auto_573755 ) ) ( not ( = ?auto_573753 ?auto_573756 ) ) ( not ( = ?auto_573753 ?auto_573757 ) ) ( not ( = ?auto_573753 ?auto_573758 ) ) ( not ( = ?auto_573753 ?auto_573759 ) ) ( not ( = ?auto_573753 ?auto_573760 ) ) ( not ( = ?auto_573753 ?auto_573761 ) ) ( not ( = ?auto_573754 ?auto_573755 ) ) ( not ( = ?auto_573754 ?auto_573756 ) ) ( not ( = ?auto_573754 ?auto_573757 ) ) ( not ( = ?auto_573754 ?auto_573758 ) ) ( not ( = ?auto_573754 ?auto_573759 ) ) ( not ( = ?auto_573754 ?auto_573760 ) ) ( not ( = ?auto_573754 ?auto_573761 ) ) ( not ( = ?auto_573755 ?auto_573756 ) ) ( not ( = ?auto_573755 ?auto_573757 ) ) ( not ( = ?auto_573755 ?auto_573758 ) ) ( not ( = ?auto_573755 ?auto_573759 ) ) ( not ( = ?auto_573755 ?auto_573760 ) ) ( not ( = ?auto_573755 ?auto_573761 ) ) ( not ( = ?auto_573756 ?auto_573757 ) ) ( not ( = ?auto_573756 ?auto_573758 ) ) ( not ( = ?auto_573756 ?auto_573759 ) ) ( not ( = ?auto_573756 ?auto_573760 ) ) ( not ( = ?auto_573756 ?auto_573761 ) ) ( not ( = ?auto_573757 ?auto_573758 ) ) ( not ( = ?auto_573757 ?auto_573759 ) ) ( not ( = ?auto_573757 ?auto_573760 ) ) ( not ( = ?auto_573757 ?auto_573761 ) ) ( not ( = ?auto_573758 ?auto_573759 ) ) ( not ( = ?auto_573758 ?auto_573760 ) ) ( not ( = ?auto_573758 ?auto_573761 ) ) ( not ( = ?auto_573759 ?auto_573760 ) ) ( not ( = ?auto_573759 ?auto_573761 ) ) ( not ( = ?auto_573760 ?auto_573761 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_573760 ?auto_573761 )
      ( !STACK ?auto_573760 ?auto_573759 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_573799 - BLOCK
      ?auto_573800 - BLOCK
      ?auto_573801 - BLOCK
      ?auto_573802 - BLOCK
      ?auto_573803 - BLOCK
      ?auto_573804 - BLOCK
      ?auto_573805 - BLOCK
      ?auto_573806 - BLOCK
      ?auto_573807 - BLOCK
      ?auto_573808 - BLOCK
      ?auto_573809 - BLOCK
      ?auto_573810 - BLOCK
    )
    :vars
    (
      ?auto_573811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_573810 ?auto_573811 ) ( ON-TABLE ?auto_573799 ) ( ON ?auto_573800 ?auto_573799 ) ( ON ?auto_573801 ?auto_573800 ) ( ON ?auto_573802 ?auto_573801 ) ( ON ?auto_573803 ?auto_573802 ) ( ON ?auto_573804 ?auto_573803 ) ( ON ?auto_573805 ?auto_573804 ) ( ON ?auto_573806 ?auto_573805 ) ( ON ?auto_573807 ?auto_573806 ) ( ON ?auto_573808 ?auto_573807 ) ( not ( = ?auto_573799 ?auto_573800 ) ) ( not ( = ?auto_573799 ?auto_573801 ) ) ( not ( = ?auto_573799 ?auto_573802 ) ) ( not ( = ?auto_573799 ?auto_573803 ) ) ( not ( = ?auto_573799 ?auto_573804 ) ) ( not ( = ?auto_573799 ?auto_573805 ) ) ( not ( = ?auto_573799 ?auto_573806 ) ) ( not ( = ?auto_573799 ?auto_573807 ) ) ( not ( = ?auto_573799 ?auto_573808 ) ) ( not ( = ?auto_573799 ?auto_573809 ) ) ( not ( = ?auto_573799 ?auto_573810 ) ) ( not ( = ?auto_573799 ?auto_573811 ) ) ( not ( = ?auto_573800 ?auto_573801 ) ) ( not ( = ?auto_573800 ?auto_573802 ) ) ( not ( = ?auto_573800 ?auto_573803 ) ) ( not ( = ?auto_573800 ?auto_573804 ) ) ( not ( = ?auto_573800 ?auto_573805 ) ) ( not ( = ?auto_573800 ?auto_573806 ) ) ( not ( = ?auto_573800 ?auto_573807 ) ) ( not ( = ?auto_573800 ?auto_573808 ) ) ( not ( = ?auto_573800 ?auto_573809 ) ) ( not ( = ?auto_573800 ?auto_573810 ) ) ( not ( = ?auto_573800 ?auto_573811 ) ) ( not ( = ?auto_573801 ?auto_573802 ) ) ( not ( = ?auto_573801 ?auto_573803 ) ) ( not ( = ?auto_573801 ?auto_573804 ) ) ( not ( = ?auto_573801 ?auto_573805 ) ) ( not ( = ?auto_573801 ?auto_573806 ) ) ( not ( = ?auto_573801 ?auto_573807 ) ) ( not ( = ?auto_573801 ?auto_573808 ) ) ( not ( = ?auto_573801 ?auto_573809 ) ) ( not ( = ?auto_573801 ?auto_573810 ) ) ( not ( = ?auto_573801 ?auto_573811 ) ) ( not ( = ?auto_573802 ?auto_573803 ) ) ( not ( = ?auto_573802 ?auto_573804 ) ) ( not ( = ?auto_573802 ?auto_573805 ) ) ( not ( = ?auto_573802 ?auto_573806 ) ) ( not ( = ?auto_573802 ?auto_573807 ) ) ( not ( = ?auto_573802 ?auto_573808 ) ) ( not ( = ?auto_573802 ?auto_573809 ) ) ( not ( = ?auto_573802 ?auto_573810 ) ) ( not ( = ?auto_573802 ?auto_573811 ) ) ( not ( = ?auto_573803 ?auto_573804 ) ) ( not ( = ?auto_573803 ?auto_573805 ) ) ( not ( = ?auto_573803 ?auto_573806 ) ) ( not ( = ?auto_573803 ?auto_573807 ) ) ( not ( = ?auto_573803 ?auto_573808 ) ) ( not ( = ?auto_573803 ?auto_573809 ) ) ( not ( = ?auto_573803 ?auto_573810 ) ) ( not ( = ?auto_573803 ?auto_573811 ) ) ( not ( = ?auto_573804 ?auto_573805 ) ) ( not ( = ?auto_573804 ?auto_573806 ) ) ( not ( = ?auto_573804 ?auto_573807 ) ) ( not ( = ?auto_573804 ?auto_573808 ) ) ( not ( = ?auto_573804 ?auto_573809 ) ) ( not ( = ?auto_573804 ?auto_573810 ) ) ( not ( = ?auto_573804 ?auto_573811 ) ) ( not ( = ?auto_573805 ?auto_573806 ) ) ( not ( = ?auto_573805 ?auto_573807 ) ) ( not ( = ?auto_573805 ?auto_573808 ) ) ( not ( = ?auto_573805 ?auto_573809 ) ) ( not ( = ?auto_573805 ?auto_573810 ) ) ( not ( = ?auto_573805 ?auto_573811 ) ) ( not ( = ?auto_573806 ?auto_573807 ) ) ( not ( = ?auto_573806 ?auto_573808 ) ) ( not ( = ?auto_573806 ?auto_573809 ) ) ( not ( = ?auto_573806 ?auto_573810 ) ) ( not ( = ?auto_573806 ?auto_573811 ) ) ( not ( = ?auto_573807 ?auto_573808 ) ) ( not ( = ?auto_573807 ?auto_573809 ) ) ( not ( = ?auto_573807 ?auto_573810 ) ) ( not ( = ?auto_573807 ?auto_573811 ) ) ( not ( = ?auto_573808 ?auto_573809 ) ) ( not ( = ?auto_573808 ?auto_573810 ) ) ( not ( = ?auto_573808 ?auto_573811 ) ) ( not ( = ?auto_573809 ?auto_573810 ) ) ( not ( = ?auto_573809 ?auto_573811 ) ) ( not ( = ?auto_573810 ?auto_573811 ) ) ( CLEAR ?auto_573808 ) ( ON ?auto_573809 ?auto_573810 ) ( CLEAR ?auto_573809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_573799 ?auto_573800 ?auto_573801 ?auto_573802 ?auto_573803 ?auto_573804 ?auto_573805 ?auto_573806 ?auto_573807 ?auto_573808 ?auto_573809 )
      ( MAKE-12PILE ?auto_573799 ?auto_573800 ?auto_573801 ?auto_573802 ?auto_573803 ?auto_573804 ?auto_573805 ?auto_573806 ?auto_573807 ?auto_573808 ?auto_573809 ?auto_573810 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_573849 - BLOCK
      ?auto_573850 - BLOCK
      ?auto_573851 - BLOCK
      ?auto_573852 - BLOCK
      ?auto_573853 - BLOCK
      ?auto_573854 - BLOCK
      ?auto_573855 - BLOCK
      ?auto_573856 - BLOCK
      ?auto_573857 - BLOCK
      ?auto_573858 - BLOCK
      ?auto_573859 - BLOCK
      ?auto_573860 - BLOCK
    )
    :vars
    (
      ?auto_573861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_573860 ?auto_573861 ) ( ON-TABLE ?auto_573849 ) ( ON ?auto_573850 ?auto_573849 ) ( ON ?auto_573851 ?auto_573850 ) ( ON ?auto_573852 ?auto_573851 ) ( ON ?auto_573853 ?auto_573852 ) ( ON ?auto_573854 ?auto_573853 ) ( ON ?auto_573855 ?auto_573854 ) ( ON ?auto_573856 ?auto_573855 ) ( ON ?auto_573857 ?auto_573856 ) ( not ( = ?auto_573849 ?auto_573850 ) ) ( not ( = ?auto_573849 ?auto_573851 ) ) ( not ( = ?auto_573849 ?auto_573852 ) ) ( not ( = ?auto_573849 ?auto_573853 ) ) ( not ( = ?auto_573849 ?auto_573854 ) ) ( not ( = ?auto_573849 ?auto_573855 ) ) ( not ( = ?auto_573849 ?auto_573856 ) ) ( not ( = ?auto_573849 ?auto_573857 ) ) ( not ( = ?auto_573849 ?auto_573858 ) ) ( not ( = ?auto_573849 ?auto_573859 ) ) ( not ( = ?auto_573849 ?auto_573860 ) ) ( not ( = ?auto_573849 ?auto_573861 ) ) ( not ( = ?auto_573850 ?auto_573851 ) ) ( not ( = ?auto_573850 ?auto_573852 ) ) ( not ( = ?auto_573850 ?auto_573853 ) ) ( not ( = ?auto_573850 ?auto_573854 ) ) ( not ( = ?auto_573850 ?auto_573855 ) ) ( not ( = ?auto_573850 ?auto_573856 ) ) ( not ( = ?auto_573850 ?auto_573857 ) ) ( not ( = ?auto_573850 ?auto_573858 ) ) ( not ( = ?auto_573850 ?auto_573859 ) ) ( not ( = ?auto_573850 ?auto_573860 ) ) ( not ( = ?auto_573850 ?auto_573861 ) ) ( not ( = ?auto_573851 ?auto_573852 ) ) ( not ( = ?auto_573851 ?auto_573853 ) ) ( not ( = ?auto_573851 ?auto_573854 ) ) ( not ( = ?auto_573851 ?auto_573855 ) ) ( not ( = ?auto_573851 ?auto_573856 ) ) ( not ( = ?auto_573851 ?auto_573857 ) ) ( not ( = ?auto_573851 ?auto_573858 ) ) ( not ( = ?auto_573851 ?auto_573859 ) ) ( not ( = ?auto_573851 ?auto_573860 ) ) ( not ( = ?auto_573851 ?auto_573861 ) ) ( not ( = ?auto_573852 ?auto_573853 ) ) ( not ( = ?auto_573852 ?auto_573854 ) ) ( not ( = ?auto_573852 ?auto_573855 ) ) ( not ( = ?auto_573852 ?auto_573856 ) ) ( not ( = ?auto_573852 ?auto_573857 ) ) ( not ( = ?auto_573852 ?auto_573858 ) ) ( not ( = ?auto_573852 ?auto_573859 ) ) ( not ( = ?auto_573852 ?auto_573860 ) ) ( not ( = ?auto_573852 ?auto_573861 ) ) ( not ( = ?auto_573853 ?auto_573854 ) ) ( not ( = ?auto_573853 ?auto_573855 ) ) ( not ( = ?auto_573853 ?auto_573856 ) ) ( not ( = ?auto_573853 ?auto_573857 ) ) ( not ( = ?auto_573853 ?auto_573858 ) ) ( not ( = ?auto_573853 ?auto_573859 ) ) ( not ( = ?auto_573853 ?auto_573860 ) ) ( not ( = ?auto_573853 ?auto_573861 ) ) ( not ( = ?auto_573854 ?auto_573855 ) ) ( not ( = ?auto_573854 ?auto_573856 ) ) ( not ( = ?auto_573854 ?auto_573857 ) ) ( not ( = ?auto_573854 ?auto_573858 ) ) ( not ( = ?auto_573854 ?auto_573859 ) ) ( not ( = ?auto_573854 ?auto_573860 ) ) ( not ( = ?auto_573854 ?auto_573861 ) ) ( not ( = ?auto_573855 ?auto_573856 ) ) ( not ( = ?auto_573855 ?auto_573857 ) ) ( not ( = ?auto_573855 ?auto_573858 ) ) ( not ( = ?auto_573855 ?auto_573859 ) ) ( not ( = ?auto_573855 ?auto_573860 ) ) ( not ( = ?auto_573855 ?auto_573861 ) ) ( not ( = ?auto_573856 ?auto_573857 ) ) ( not ( = ?auto_573856 ?auto_573858 ) ) ( not ( = ?auto_573856 ?auto_573859 ) ) ( not ( = ?auto_573856 ?auto_573860 ) ) ( not ( = ?auto_573856 ?auto_573861 ) ) ( not ( = ?auto_573857 ?auto_573858 ) ) ( not ( = ?auto_573857 ?auto_573859 ) ) ( not ( = ?auto_573857 ?auto_573860 ) ) ( not ( = ?auto_573857 ?auto_573861 ) ) ( not ( = ?auto_573858 ?auto_573859 ) ) ( not ( = ?auto_573858 ?auto_573860 ) ) ( not ( = ?auto_573858 ?auto_573861 ) ) ( not ( = ?auto_573859 ?auto_573860 ) ) ( not ( = ?auto_573859 ?auto_573861 ) ) ( not ( = ?auto_573860 ?auto_573861 ) ) ( ON ?auto_573859 ?auto_573860 ) ( CLEAR ?auto_573857 ) ( ON ?auto_573858 ?auto_573859 ) ( CLEAR ?auto_573858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_573849 ?auto_573850 ?auto_573851 ?auto_573852 ?auto_573853 ?auto_573854 ?auto_573855 ?auto_573856 ?auto_573857 ?auto_573858 )
      ( MAKE-12PILE ?auto_573849 ?auto_573850 ?auto_573851 ?auto_573852 ?auto_573853 ?auto_573854 ?auto_573855 ?auto_573856 ?auto_573857 ?auto_573858 ?auto_573859 ?auto_573860 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_573899 - BLOCK
      ?auto_573900 - BLOCK
      ?auto_573901 - BLOCK
      ?auto_573902 - BLOCK
      ?auto_573903 - BLOCK
      ?auto_573904 - BLOCK
      ?auto_573905 - BLOCK
      ?auto_573906 - BLOCK
      ?auto_573907 - BLOCK
      ?auto_573908 - BLOCK
      ?auto_573909 - BLOCK
      ?auto_573910 - BLOCK
    )
    :vars
    (
      ?auto_573911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_573910 ?auto_573911 ) ( ON-TABLE ?auto_573899 ) ( ON ?auto_573900 ?auto_573899 ) ( ON ?auto_573901 ?auto_573900 ) ( ON ?auto_573902 ?auto_573901 ) ( ON ?auto_573903 ?auto_573902 ) ( ON ?auto_573904 ?auto_573903 ) ( ON ?auto_573905 ?auto_573904 ) ( ON ?auto_573906 ?auto_573905 ) ( not ( = ?auto_573899 ?auto_573900 ) ) ( not ( = ?auto_573899 ?auto_573901 ) ) ( not ( = ?auto_573899 ?auto_573902 ) ) ( not ( = ?auto_573899 ?auto_573903 ) ) ( not ( = ?auto_573899 ?auto_573904 ) ) ( not ( = ?auto_573899 ?auto_573905 ) ) ( not ( = ?auto_573899 ?auto_573906 ) ) ( not ( = ?auto_573899 ?auto_573907 ) ) ( not ( = ?auto_573899 ?auto_573908 ) ) ( not ( = ?auto_573899 ?auto_573909 ) ) ( not ( = ?auto_573899 ?auto_573910 ) ) ( not ( = ?auto_573899 ?auto_573911 ) ) ( not ( = ?auto_573900 ?auto_573901 ) ) ( not ( = ?auto_573900 ?auto_573902 ) ) ( not ( = ?auto_573900 ?auto_573903 ) ) ( not ( = ?auto_573900 ?auto_573904 ) ) ( not ( = ?auto_573900 ?auto_573905 ) ) ( not ( = ?auto_573900 ?auto_573906 ) ) ( not ( = ?auto_573900 ?auto_573907 ) ) ( not ( = ?auto_573900 ?auto_573908 ) ) ( not ( = ?auto_573900 ?auto_573909 ) ) ( not ( = ?auto_573900 ?auto_573910 ) ) ( not ( = ?auto_573900 ?auto_573911 ) ) ( not ( = ?auto_573901 ?auto_573902 ) ) ( not ( = ?auto_573901 ?auto_573903 ) ) ( not ( = ?auto_573901 ?auto_573904 ) ) ( not ( = ?auto_573901 ?auto_573905 ) ) ( not ( = ?auto_573901 ?auto_573906 ) ) ( not ( = ?auto_573901 ?auto_573907 ) ) ( not ( = ?auto_573901 ?auto_573908 ) ) ( not ( = ?auto_573901 ?auto_573909 ) ) ( not ( = ?auto_573901 ?auto_573910 ) ) ( not ( = ?auto_573901 ?auto_573911 ) ) ( not ( = ?auto_573902 ?auto_573903 ) ) ( not ( = ?auto_573902 ?auto_573904 ) ) ( not ( = ?auto_573902 ?auto_573905 ) ) ( not ( = ?auto_573902 ?auto_573906 ) ) ( not ( = ?auto_573902 ?auto_573907 ) ) ( not ( = ?auto_573902 ?auto_573908 ) ) ( not ( = ?auto_573902 ?auto_573909 ) ) ( not ( = ?auto_573902 ?auto_573910 ) ) ( not ( = ?auto_573902 ?auto_573911 ) ) ( not ( = ?auto_573903 ?auto_573904 ) ) ( not ( = ?auto_573903 ?auto_573905 ) ) ( not ( = ?auto_573903 ?auto_573906 ) ) ( not ( = ?auto_573903 ?auto_573907 ) ) ( not ( = ?auto_573903 ?auto_573908 ) ) ( not ( = ?auto_573903 ?auto_573909 ) ) ( not ( = ?auto_573903 ?auto_573910 ) ) ( not ( = ?auto_573903 ?auto_573911 ) ) ( not ( = ?auto_573904 ?auto_573905 ) ) ( not ( = ?auto_573904 ?auto_573906 ) ) ( not ( = ?auto_573904 ?auto_573907 ) ) ( not ( = ?auto_573904 ?auto_573908 ) ) ( not ( = ?auto_573904 ?auto_573909 ) ) ( not ( = ?auto_573904 ?auto_573910 ) ) ( not ( = ?auto_573904 ?auto_573911 ) ) ( not ( = ?auto_573905 ?auto_573906 ) ) ( not ( = ?auto_573905 ?auto_573907 ) ) ( not ( = ?auto_573905 ?auto_573908 ) ) ( not ( = ?auto_573905 ?auto_573909 ) ) ( not ( = ?auto_573905 ?auto_573910 ) ) ( not ( = ?auto_573905 ?auto_573911 ) ) ( not ( = ?auto_573906 ?auto_573907 ) ) ( not ( = ?auto_573906 ?auto_573908 ) ) ( not ( = ?auto_573906 ?auto_573909 ) ) ( not ( = ?auto_573906 ?auto_573910 ) ) ( not ( = ?auto_573906 ?auto_573911 ) ) ( not ( = ?auto_573907 ?auto_573908 ) ) ( not ( = ?auto_573907 ?auto_573909 ) ) ( not ( = ?auto_573907 ?auto_573910 ) ) ( not ( = ?auto_573907 ?auto_573911 ) ) ( not ( = ?auto_573908 ?auto_573909 ) ) ( not ( = ?auto_573908 ?auto_573910 ) ) ( not ( = ?auto_573908 ?auto_573911 ) ) ( not ( = ?auto_573909 ?auto_573910 ) ) ( not ( = ?auto_573909 ?auto_573911 ) ) ( not ( = ?auto_573910 ?auto_573911 ) ) ( ON ?auto_573909 ?auto_573910 ) ( ON ?auto_573908 ?auto_573909 ) ( CLEAR ?auto_573906 ) ( ON ?auto_573907 ?auto_573908 ) ( CLEAR ?auto_573907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_573899 ?auto_573900 ?auto_573901 ?auto_573902 ?auto_573903 ?auto_573904 ?auto_573905 ?auto_573906 ?auto_573907 )
      ( MAKE-12PILE ?auto_573899 ?auto_573900 ?auto_573901 ?auto_573902 ?auto_573903 ?auto_573904 ?auto_573905 ?auto_573906 ?auto_573907 ?auto_573908 ?auto_573909 ?auto_573910 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_573949 - BLOCK
      ?auto_573950 - BLOCK
      ?auto_573951 - BLOCK
      ?auto_573952 - BLOCK
      ?auto_573953 - BLOCK
      ?auto_573954 - BLOCK
      ?auto_573955 - BLOCK
      ?auto_573956 - BLOCK
      ?auto_573957 - BLOCK
      ?auto_573958 - BLOCK
      ?auto_573959 - BLOCK
      ?auto_573960 - BLOCK
    )
    :vars
    (
      ?auto_573961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_573960 ?auto_573961 ) ( ON-TABLE ?auto_573949 ) ( ON ?auto_573950 ?auto_573949 ) ( ON ?auto_573951 ?auto_573950 ) ( ON ?auto_573952 ?auto_573951 ) ( ON ?auto_573953 ?auto_573952 ) ( ON ?auto_573954 ?auto_573953 ) ( ON ?auto_573955 ?auto_573954 ) ( not ( = ?auto_573949 ?auto_573950 ) ) ( not ( = ?auto_573949 ?auto_573951 ) ) ( not ( = ?auto_573949 ?auto_573952 ) ) ( not ( = ?auto_573949 ?auto_573953 ) ) ( not ( = ?auto_573949 ?auto_573954 ) ) ( not ( = ?auto_573949 ?auto_573955 ) ) ( not ( = ?auto_573949 ?auto_573956 ) ) ( not ( = ?auto_573949 ?auto_573957 ) ) ( not ( = ?auto_573949 ?auto_573958 ) ) ( not ( = ?auto_573949 ?auto_573959 ) ) ( not ( = ?auto_573949 ?auto_573960 ) ) ( not ( = ?auto_573949 ?auto_573961 ) ) ( not ( = ?auto_573950 ?auto_573951 ) ) ( not ( = ?auto_573950 ?auto_573952 ) ) ( not ( = ?auto_573950 ?auto_573953 ) ) ( not ( = ?auto_573950 ?auto_573954 ) ) ( not ( = ?auto_573950 ?auto_573955 ) ) ( not ( = ?auto_573950 ?auto_573956 ) ) ( not ( = ?auto_573950 ?auto_573957 ) ) ( not ( = ?auto_573950 ?auto_573958 ) ) ( not ( = ?auto_573950 ?auto_573959 ) ) ( not ( = ?auto_573950 ?auto_573960 ) ) ( not ( = ?auto_573950 ?auto_573961 ) ) ( not ( = ?auto_573951 ?auto_573952 ) ) ( not ( = ?auto_573951 ?auto_573953 ) ) ( not ( = ?auto_573951 ?auto_573954 ) ) ( not ( = ?auto_573951 ?auto_573955 ) ) ( not ( = ?auto_573951 ?auto_573956 ) ) ( not ( = ?auto_573951 ?auto_573957 ) ) ( not ( = ?auto_573951 ?auto_573958 ) ) ( not ( = ?auto_573951 ?auto_573959 ) ) ( not ( = ?auto_573951 ?auto_573960 ) ) ( not ( = ?auto_573951 ?auto_573961 ) ) ( not ( = ?auto_573952 ?auto_573953 ) ) ( not ( = ?auto_573952 ?auto_573954 ) ) ( not ( = ?auto_573952 ?auto_573955 ) ) ( not ( = ?auto_573952 ?auto_573956 ) ) ( not ( = ?auto_573952 ?auto_573957 ) ) ( not ( = ?auto_573952 ?auto_573958 ) ) ( not ( = ?auto_573952 ?auto_573959 ) ) ( not ( = ?auto_573952 ?auto_573960 ) ) ( not ( = ?auto_573952 ?auto_573961 ) ) ( not ( = ?auto_573953 ?auto_573954 ) ) ( not ( = ?auto_573953 ?auto_573955 ) ) ( not ( = ?auto_573953 ?auto_573956 ) ) ( not ( = ?auto_573953 ?auto_573957 ) ) ( not ( = ?auto_573953 ?auto_573958 ) ) ( not ( = ?auto_573953 ?auto_573959 ) ) ( not ( = ?auto_573953 ?auto_573960 ) ) ( not ( = ?auto_573953 ?auto_573961 ) ) ( not ( = ?auto_573954 ?auto_573955 ) ) ( not ( = ?auto_573954 ?auto_573956 ) ) ( not ( = ?auto_573954 ?auto_573957 ) ) ( not ( = ?auto_573954 ?auto_573958 ) ) ( not ( = ?auto_573954 ?auto_573959 ) ) ( not ( = ?auto_573954 ?auto_573960 ) ) ( not ( = ?auto_573954 ?auto_573961 ) ) ( not ( = ?auto_573955 ?auto_573956 ) ) ( not ( = ?auto_573955 ?auto_573957 ) ) ( not ( = ?auto_573955 ?auto_573958 ) ) ( not ( = ?auto_573955 ?auto_573959 ) ) ( not ( = ?auto_573955 ?auto_573960 ) ) ( not ( = ?auto_573955 ?auto_573961 ) ) ( not ( = ?auto_573956 ?auto_573957 ) ) ( not ( = ?auto_573956 ?auto_573958 ) ) ( not ( = ?auto_573956 ?auto_573959 ) ) ( not ( = ?auto_573956 ?auto_573960 ) ) ( not ( = ?auto_573956 ?auto_573961 ) ) ( not ( = ?auto_573957 ?auto_573958 ) ) ( not ( = ?auto_573957 ?auto_573959 ) ) ( not ( = ?auto_573957 ?auto_573960 ) ) ( not ( = ?auto_573957 ?auto_573961 ) ) ( not ( = ?auto_573958 ?auto_573959 ) ) ( not ( = ?auto_573958 ?auto_573960 ) ) ( not ( = ?auto_573958 ?auto_573961 ) ) ( not ( = ?auto_573959 ?auto_573960 ) ) ( not ( = ?auto_573959 ?auto_573961 ) ) ( not ( = ?auto_573960 ?auto_573961 ) ) ( ON ?auto_573959 ?auto_573960 ) ( ON ?auto_573958 ?auto_573959 ) ( ON ?auto_573957 ?auto_573958 ) ( CLEAR ?auto_573955 ) ( ON ?auto_573956 ?auto_573957 ) ( CLEAR ?auto_573956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_573949 ?auto_573950 ?auto_573951 ?auto_573952 ?auto_573953 ?auto_573954 ?auto_573955 ?auto_573956 )
      ( MAKE-12PILE ?auto_573949 ?auto_573950 ?auto_573951 ?auto_573952 ?auto_573953 ?auto_573954 ?auto_573955 ?auto_573956 ?auto_573957 ?auto_573958 ?auto_573959 ?auto_573960 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_573999 - BLOCK
      ?auto_574000 - BLOCK
      ?auto_574001 - BLOCK
      ?auto_574002 - BLOCK
      ?auto_574003 - BLOCK
      ?auto_574004 - BLOCK
      ?auto_574005 - BLOCK
      ?auto_574006 - BLOCK
      ?auto_574007 - BLOCK
      ?auto_574008 - BLOCK
      ?auto_574009 - BLOCK
      ?auto_574010 - BLOCK
    )
    :vars
    (
      ?auto_574011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_574010 ?auto_574011 ) ( ON-TABLE ?auto_573999 ) ( ON ?auto_574000 ?auto_573999 ) ( ON ?auto_574001 ?auto_574000 ) ( ON ?auto_574002 ?auto_574001 ) ( ON ?auto_574003 ?auto_574002 ) ( ON ?auto_574004 ?auto_574003 ) ( not ( = ?auto_573999 ?auto_574000 ) ) ( not ( = ?auto_573999 ?auto_574001 ) ) ( not ( = ?auto_573999 ?auto_574002 ) ) ( not ( = ?auto_573999 ?auto_574003 ) ) ( not ( = ?auto_573999 ?auto_574004 ) ) ( not ( = ?auto_573999 ?auto_574005 ) ) ( not ( = ?auto_573999 ?auto_574006 ) ) ( not ( = ?auto_573999 ?auto_574007 ) ) ( not ( = ?auto_573999 ?auto_574008 ) ) ( not ( = ?auto_573999 ?auto_574009 ) ) ( not ( = ?auto_573999 ?auto_574010 ) ) ( not ( = ?auto_573999 ?auto_574011 ) ) ( not ( = ?auto_574000 ?auto_574001 ) ) ( not ( = ?auto_574000 ?auto_574002 ) ) ( not ( = ?auto_574000 ?auto_574003 ) ) ( not ( = ?auto_574000 ?auto_574004 ) ) ( not ( = ?auto_574000 ?auto_574005 ) ) ( not ( = ?auto_574000 ?auto_574006 ) ) ( not ( = ?auto_574000 ?auto_574007 ) ) ( not ( = ?auto_574000 ?auto_574008 ) ) ( not ( = ?auto_574000 ?auto_574009 ) ) ( not ( = ?auto_574000 ?auto_574010 ) ) ( not ( = ?auto_574000 ?auto_574011 ) ) ( not ( = ?auto_574001 ?auto_574002 ) ) ( not ( = ?auto_574001 ?auto_574003 ) ) ( not ( = ?auto_574001 ?auto_574004 ) ) ( not ( = ?auto_574001 ?auto_574005 ) ) ( not ( = ?auto_574001 ?auto_574006 ) ) ( not ( = ?auto_574001 ?auto_574007 ) ) ( not ( = ?auto_574001 ?auto_574008 ) ) ( not ( = ?auto_574001 ?auto_574009 ) ) ( not ( = ?auto_574001 ?auto_574010 ) ) ( not ( = ?auto_574001 ?auto_574011 ) ) ( not ( = ?auto_574002 ?auto_574003 ) ) ( not ( = ?auto_574002 ?auto_574004 ) ) ( not ( = ?auto_574002 ?auto_574005 ) ) ( not ( = ?auto_574002 ?auto_574006 ) ) ( not ( = ?auto_574002 ?auto_574007 ) ) ( not ( = ?auto_574002 ?auto_574008 ) ) ( not ( = ?auto_574002 ?auto_574009 ) ) ( not ( = ?auto_574002 ?auto_574010 ) ) ( not ( = ?auto_574002 ?auto_574011 ) ) ( not ( = ?auto_574003 ?auto_574004 ) ) ( not ( = ?auto_574003 ?auto_574005 ) ) ( not ( = ?auto_574003 ?auto_574006 ) ) ( not ( = ?auto_574003 ?auto_574007 ) ) ( not ( = ?auto_574003 ?auto_574008 ) ) ( not ( = ?auto_574003 ?auto_574009 ) ) ( not ( = ?auto_574003 ?auto_574010 ) ) ( not ( = ?auto_574003 ?auto_574011 ) ) ( not ( = ?auto_574004 ?auto_574005 ) ) ( not ( = ?auto_574004 ?auto_574006 ) ) ( not ( = ?auto_574004 ?auto_574007 ) ) ( not ( = ?auto_574004 ?auto_574008 ) ) ( not ( = ?auto_574004 ?auto_574009 ) ) ( not ( = ?auto_574004 ?auto_574010 ) ) ( not ( = ?auto_574004 ?auto_574011 ) ) ( not ( = ?auto_574005 ?auto_574006 ) ) ( not ( = ?auto_574005 ?auto_574007 ) ) ( not ( = ?auto_574005 ?auto_574008 ) ) ( not ( = ?auto_574005 ?auto_574009 ) ) ( not ( = ?auto_574005 ?auto_574010 ) ) ( not ( = ?auto_574005 ?auto_574011 ) ) ( not ( = ?auto_574006 ?auto_574007 ) ) ( not ( = ?auto_574006 ?auto_574008 ) ) ( not ( = ?auto_574006 ?auto_574009 ) ) ( not ( = ?auto_574006 ?auto_574010 ) ) ( not ( = ?auto_574006 ?auto_574011 ) ) ( not ( = ?auto_574007 ?auto_574008 ) ) ( not ( = ?auto_574007 ?auto_574009 ) ) ( not ( = ?auto_574007 ?auto_574010 ) ) ( not ( = ?auto_574007 ?auto_574011 ) ) ( not ( = ?auto_574008 ?auto_574009 ) ) ( not ( = ?auto_574008 ?auto_574010 ) ) ( not ( = ?auto_574008 ?auto_574011 ) ) ( not ( = ?auto_574009 ?auto_574010 ) ) ( not ( = ?auto_574009 ?auto_574011 ) ) ( not ( = ?auto_574010 ?auto_574011 ) ) ( ON ?auto_574009 ?auto_574010 ) ( ON ?auto_574008 ?auto_574009 ) ( ON ?auto_574007 ?auto_574008 ) ( ON ?auto_574006 ?auto_574007 ) ( CLEAR ?auto_574004 ) ( ON ?auto_574005 ?auto_574006 ) ( CLEAR ?auto_574005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_573999 ?auto_574000 ?auto_574001 ?auto_574002 ?auto_574003 ?auto_574004 ?auto_574005 )
      ( MAKE-12PILE ?auto_573999 ?auto_574000 ?auto_574001 ?auto_574002 ?auto_574003 ?auto_574004 ?auto_574005 ?auto_574006 ?auto_574007 ?auto_574008 ?auto_574009 ?auto_574010 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_574049 - BLOCK
      ?auto_574050 - BLOCK
      ?auto_574051 - BLOCK
      ?auto_574052 - BLOCK
      ?auto_574053 - BLOCK
      ?auto_574054 - BLOCK
      ?auto_574055 - BLOCK
      ?auto_574056 - BLOCK
      ?auto_574057 - BLOCK
      ?auto_574058 - BLOCK
      ?auto_574059 - BLOCK
      ?auto_574060 - BLOCK
    )
    :vars
    (
      ?auto_574061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_574060 ?auto_574061 ) ( ON-TABLE ?auto_574049 ) ( ON ?auto_574050 ?auto_574049 ) ( ON ?auto_574051 ?auto_574050 ) ( ON ?auto_574052 ?auto_574051 ) ( ON ?auto_574053 ?auto_574052 ) ( not ( = ?auto_574049 ?auto_574050 ) ) ( not ( = ?auto_574049 ?auto_574051 ) ) ( not ( = ?auto_574049 ?auto_574052 ) ) ( not ( = ?auto_574049 ?auto_574053 ) ) ( not ( = ?auto_574049 ?auto_574054 ) ) ( not ( = ?auto_574049 ?auto_574055 ) ) ( not ( = ?auto_574049 ?auto_574056 ) ) ( not ( = ?auto_574049 ?auto_574057 ) ) ( not ( = ?auto_574049 ?auto_574058 ) ) ( not ( = ?auto_574049 ?auto_574059 ) ) ( not ( = ?auto_574049 ?auto_574060 ) ) ( not ( = ?auto_574049 ?auto_574061 ) ) ( not ( = ?auto_574050 ?auto_574051 ) ) ( not ( = ?auto_574050 ?auto_574052 ) ) ( not ( = ?auto_574050 ?auto_574053 ) ) ( not ( = ?auto_574050 ?auto_574054 ) ) ( not ( = ?auto_574050 ?auto_574055 ) ) ( not ( = ?auto_574050 ?auto_574056 ) ) ( not ( = ?auto_574050 ?auto_574057 ) ) ( not ( = ?auto_574050 ?auto_574058 ) ) ( not ( = ?auto_574050 ?auto_574059 ) ) ( not ( = ?auto_574050 ?auto_574060 ) ) ( not ( = ?auto_574050 ?auto_574061 ) ) ( not ( = ?auto_574051 ?auto_574052 ) ) ( not ( = ?auto_574051 ?auto_574053 ) ) ( not ( = ?auto_574051 ?auto_574054 ) ) ( not ( = ?auto_574051 ?auto_574055 ) ) ( not ( = ?auto_574051 ?auto_574056 ) ) ( not ( = ?auto_574051 ?auto_574057 ) ) ( not ( = ?auto_574051 ?auto_574058 ) ) ( not ( = ?auto_574051 ?auto_574059 ) ) ( not ( = ?auto_574051 ?auto_574060 ) ) ( not ( = ?auto_574051 ?auto_574061 ) ) ( not ( = ?auto_574052 ?auto_574053 ) ) ( not ( = ?auto_574052 ?auto_574054 ) ) ( not ( = ?auto_574052 ?auto_574055 ) ) ( not ( = ?auto_574052 ?auto_574056 ) ) ( not ( = ?auto_574052 ?auto_574057 ) ) ( not ( = ?auto_574052 ?auto_574058 ) ) ( not ( = ?auto_574052 ?auto_574059 ) ) ( not ( = ?auto_574052 ?auto_574060 ) ) ( not ( = ?auto_574052 ?auto_574061 ) ) ( not ( = ?auto_574053 ?auto_574054 ) ) ( not ( = ?auto_574053 ?auto_574055 ) ) ( not ( = ?auto_574053 ?auto_574056 ) ) ( not ( = ?auto_574053 ?auto_574057 ) ) ( not ( = ?auto_574053 ?auto_574058 ) ) ( not ( = ?auto_574053 ?auto_574059 ) ) ( not ( = ?auto_574053 ?auto_574060 ) ) ( not ( = ?auto_574053 ?auto_574061 ) ) ( not ( = ?auto_574054 ?auto_574055 ) ) ( not ( = ?auto_574054 ?auto_574056 ) ) ( not ( = ?auto_574054 ?auto_574057 ) ) ( not ( = ?auto_574054 ?auto_574058 ) ) ( not ( = ?auto_574054 ?auto_574059 ) ) ( not ( = ?auto_574054 ?auto_574060 ) ) ( not ( = ?auto_574054 ?auto_574061 ) ) ( not ( = ?auto_574055 ?auto_574056 ) ) ( not ( = ?auto_574055 ?auto_574057 ) ) ( not ( = ?auto_574055 ?auto_574058 ) ) ( not ( = ?auto_574055 ?auto_574059 ) ) ( not ( = ?auto_574055 ?auto_574060 ) ) ( not ( = ?auto_574055 ?auto_574061 ) ) ( not ( = ?auto_574056 ?auto_574057 ) ) ( not ( = ?auto_574056 ?auto_574058 ) ) ( not ( = ?auto_574056 ?auto_574059 ) ) ( not ( = ?auto_574056 ?auto_574060 ) ) ( not ( = ?auto_574056 ?auto_574061 ) ) ( not ( = ?auto_574057 ?auto_574058 ) ) ( not ( = ?auto_574057 ?auto_574059 ) ) ( not ( = ?auto_574057 ?auto_574060 ) ) ( not ( = ?auto_574057 ?auto_574061 ) ) ( not ( = ?auto_574058 ?auto_574059 ) ) ( not ( = ?auto_574058 ?auto_574060 ) ) ( not ( = ?auto_574058 ?auto_574061 ) ) ( not ( = ?auto_574059 ?auto_574060 ) ) ( not ( = ?auto_574059 ?auto_574061 ) ) ( not ( = ?auto_574060 ?auto_574061 ) ) ( ON ?auto_574059 ?auto_574060 ) ( ON ?auto_574058 ?auto_574059 ) ( ON ?auto_574057 ?auto_574058 ) ( ON ?auto_574056 ?auto_574057 ) ( ON ?auto_574055 ?auto_574056 ) ( CLEAR ?auto_574053 ) ( ON ?auto_574054 ?auto_574055 ) ( CLEAR ?auto_574054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_574049 ?auto_574050 ?auto_574051 ?auto_574052 ?auto_574053 ?auto_574054 )
      ( MAKE-12PILE ?auto_574049 ?auto_574050 ?auto_574051 ?auto_574052 ?auto_574053 ?auto_574054 ?auto_574055 ?auto_574056 ?auto_574057 ?auto_574058 ?auto_574059 ?auto_574060 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_574099 - BLOCK
      ?auto_574100 - BLOCK
      ?auto_574101 - BLOCK
      ?auto_574102 - BLOCK
      ?auto_574103 - BLOCK
      ?auto_574104 - BLOCK
      ?auto_574105 - BLOCK
      ?auto_574106 - BLOCK
      ?auto_574107 - BLOCK
      ?auto_574108 - BLOCK
      ?auto_574109 - BLOCK
      ?auto_574110 - BLOCK
    )
    :vars
    (
      ?auto_574111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_574110 ?auto_574111 ) ( ON-TABLE ?auto_574099 ) ( ON ?auto_574100 ?auto_574099 ) ( ON ?auto_574101 ?auto_574100 ) ( ON ?auto_574102 ?auto_574101 ) ( not ( = ?auto_574099 ?auto_574100 ) ) ( not ( = ?auto_574099 ?auto_574101 ) ) ( not ( = ?auto_574099 ?auto_574102 ) ) ( not ( = ?auto_574099 ?auto_574103 ) ) ( not ( = ?auto_574099 ?auto_574104 ) ) ( not ( = ?auto_574099 ?auto_574105 ) ) ( not ( = ?auto_574099 ?auto_574106 ) ) ( not ( = ?auto_574099 ?auto_574107 ) ) ( not ( = ?auto_574099 ?auto_574108 ) ) ( not ( = ?auto_574099 ?auto_574109 ) ) ( not ( = ?auto_574099 ?auto_574110 ) ) ( not ( = ?auto_574099 ?auto_574111 ) ) ( not ( = ?auto_574100 ?auto_574101 ) ) ( not ( = ?auto_574100 ?auto_574102 ) ) ( not ( = ?auto_574100 ?auto_574103 ) ) ( not ( = ?auto_574100 ?auto_574104 ) ) ( not ( = ?auto_574100 ?auto_574105 ) ) ( not ( = ?auto_574100 ?auto_574106 ) ) ( not ( = ?auto_574100 ?auto_574107 ) ) ( not ( = ?auto_574100 ?auto_574108 ) ) ( not ( = ?auto_574100 ?auto_574109 ) ) ( not ( = ?auto_574100 ?auto_574110 ) ) ( not ( = ?auto_574100 ?auto_574111 ) ) ( not ( = ?auto_574101 ?auto_574102 ) ) ( not ( = ?auto_574101 ?auto_574103 ) ) ( not ( = ?auto_574101 ?auto_574104 ) ) ( not ( = ?auto_574101 ?auto_574105 ) ) ( not ( = ?auto_574101 ?auto_574106 ) ) ( not ( = ?auto_574101 ?auto_574107 ) ) ( not ( = ?auto_574101 ?auto_574108 ) ) ( not ( = ?auto_574101 ?auto_574109 ) ) ( not ( = ?auto_574101 ?auto_574110 ) ) ( not ( = ?auto_574101 ?auto_574111 ) ) ( not ( = ?auto_574102 ?auto_574103 ) ) ( not ( = ?auto_574102 ?auto_574104 ) ) ( not ( = ?auto_574102 ?auto_574105 ) ) ( not ( = ?auto_574102 ?auto_574106 ) ) ( not ( = ?auto_574102 ?auto_574107 ) ) ( not ( = ?auto_574102 ?auto_574108 ) ) ( not ( = ?auto_574102 ?auto_574109 ) ) ( not ( = ?auto_574102 ?auto_574110 ) ) ( not ( = ?auto_574102 ?auto_574111 ) ) ( not ( = ?auto_574103 ?auto_574104 ) ) ( not ( = ?auto_574103 ?auto_574105 ) ) ( not ( = ?auto_574103 ?auto_574106 ) ) ( not ( = ?auto_574103 ?auto_574107 ) ) ( not ( = ?auto_574103 ?auto_574108 ) ) ( not ( = ?auto_574103 ?auto_574109 ) ) ( not ( = ?auto_574103 ?auto_574110 ) ) ( not ( = ?auto_574103 ?auto_574111 ) ) ( not ( = ?auto_574104 ?auto_574105 ) ) ( not ( = ?auto_574104 ?auto_574106 ) ) ( not ( = ?auto_574104 ?auto_574107 ) ) ( not ( = ?auto_574104 ?auto_574108 ) ) ( not ( = ?auto_574104 ?auto_574109 ) ) ( not ( = ?auto_574104 ?auto_574110 ) ) ( not ( = ?auto_574104 ?auto_574111 ) ) ( not ( = ?auto_574105 ?auto_574106 ) ) ( not ( = ?auto_574105 ?auto_574107 ) ) ( not ( = ?auto_574105 ?auto_574108 ) ) ( not ( = ?auto_574105 ?auto_574109 ) ) ( not ( = ?auto_574105 ?auto_574110 ) ) ( not ( = ?auto_574105 ?auto_574111 ) ) ( not ( = ?auto_574106 ?auto_574107 ) ) ( not ( = ?auto_574106 ?auto_574108 ) ) ( not ( = ?auto_574106 ?auto_574109 ) ) ( not ( = ?auto_574106 ?auto_574110 ) ) ( not ( = ?auto_574106 ?auto_574111 ) ) ( not ( = ?auto_574107 ?auto_574108 ) ) ( not ( = ?auto_574107 ?auto_574109 ) ) ( not ( = ?auto_574107 ?auto_574110 ) ) ( not ( = ?auto_574107 ?auto_574111 ) ) ( not ( = ?auto_574108 ?auto_574109 ) ) ( not ( = ?auto_574108 ?auto_574110 ) ) ( not ( = ?auto_574108 ?auto_574111 ) ) ( not ( = ?auto_574109 ?auto_574110 ) ) ( not ( = ?auto_574109 ?auto_574111 ) ) ( not ( = ?auto_574110 ?auto_574111 ) ) ( ON ?auto_574109 ?auto_574110 ) ( ON ?auto_574108 ?auto_574109 ) ( ON ?auto_574107 ?auto_574108 ) ( ON ?auto_574106 ?auto_574107 ) ( ON ?auto_574105 ?auto_574106 ) ( ON ?auto_574104 ?auto_574105 ) ( CLEAR ?auto_574102 ) ( ON ?auto_574103 ?auto_574104 ) ( CLEAR ?auto_574103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_574099 ?auto_574100 ?auto_574101 ?auto_574102 ?auto_574103 )
      ( MAKE-12PILE ?auto_574099 ?auto_574100 ?auto_574101 ?auto_574102 ?auto_574103 ?auto_574104 ?auto_574105 ?auto_574106 ?auto_574107 ?auto_574108 ?auto_574109 ?auto_574110 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_574149 - BLOCK
      ?auto_574150 - BLOCK
      ?auto_574151 - BLOCK
      ?auto_574152 - BLOCK
      ?auto_574153 - BLOCK
      ?auto_574154 - BLOCK
      ?auto_574155 - BLOCK
      ?auto_574156 - BLOCK
      ?auto_574157 - BLOCK
      ?auto_574158 - BLOCK
      ?auto_574159 - BLOCK
      ?auto_574160 - BLOCK
    )
    :vars
    (
      ?auto_574161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_574160 ?auto_574161 ) ( ON-TABLE ?auto_574149 ) ( ON ?auto_574150 ?auto_574149 ) ( ON ?auto_574151 ?auto_574150 ) ( not ( = ?auto_574149 ?auto_574150 ) ) ( not ( = ?auto_574149 ?auto_574151 ) ) ( not ( = ?auto_574149 ?auto_574152 ) ) ( not ( = ?auto_574149 ?auto_574153 ) ) ( not ( = ?auto_574149 ?auto_574154 ) ) ( not ( = ?auto_574149 ?auto_574155 ) ) ( not ( = ?auto_574149 ?auto_574156 ) ) ( not ( = ?auto_574149 ?auto_574157 ) ) ( not ( = ?auto_574149 ?auto_574158 ) ) ( not ( = ?auto_574149 ?auto_574159 ) ) ( not ( = ?auto_574149 ?auto_574160 ) ) ( not ( = ?auto_574149 ?auto_574161 ) ) ( not ( = ?auto_574150 ?auto_574151 ) ) ( not ( = ?auto_574150 ?auto_574152 ) ) ( not ( = ?auto_574150 ?auto_574153 ) ) ( not ( = ?auto_574150 ?auto_574154 ) ) ( not ( = ?auto_574150 ?auto_574155 ) ) ( not ( = ?auto_574150 ?auto_574156 ) ) ( not ( = ?auto_574150 ?auto_574157 ) ) ( not ( = ?auto_574150 ?auto_574158 ) ) ( not ( = ?auto_574150 ?auto_574159 ) ) ( not ( = ?auto_574150 ?auto_574160 ) ) ( not ( = ?auto_574150 ?auto_574161 ) ) ( not ( = ?auto_574151 ?auto_574152 ) ) ( not ( = ?auto_574151 ?auto_574153 ) ) ( not ( = ?auto_574151 ?auto_574154 ) ) ( not ( = ?auto_574151 ?auto_574155 ) ) ( not ( = ?auto_574151 ?auto_574156 ) ) ( not ( = ?auto_574151 ?auto_574157 ) ) ( not ( = ?auto_574151 ?auto_574158 ) ) ( not ( = ?auto_574151 ?auto_574159 ) ) ( not ( = ?auto_574151 ?auto_574160 ) ) ( not ( = ?auto_574151 ?auto_574161 ) ) ( not ( = ?auto_574152 ?auto_574153 ) ) ( not ( = ?auto_574152 ?auto_574154 ) ) ( not ( = ?auto_574152 ?auto_574155 ) ) ( not ( = ?auto_574152 ?auto_574156 ) ) ( not ( = ?auto_574152 ?auto_574157 ) ) ( not ( = ?auto_574152 ?auto_574158 ) ) ( not ( = ?auto_574152 ?auto_574159 ) ) ( not ( = ?auto_574152 ?auto_574160 ) ) ( not ( = ?auto_574152 ?auto_574161 ) ) ( not ( = ?auto_574153 ?auto_574154 ) ) ( not ( = ?auto_574153 ?auto_574155 ) ) ( not ( = ?auto_574153 ?auto_574156 ) ) ( not ( = ?auto_574153 ?auto_574157 ) ) ( not ( = ?auto_574153 ?auto_574158 ) ) ( not ( = ?auto_574153 ?auto_574159 ) ) ( not ( = ?auto_574153 ?auto_574160 ) ) ( not ( = ?auto_574153 ?auto_574161 ) ) ( not ( = ?auto_574154 ?auto_574155 ) ) ( not ( = ?auto_574154 ?auto_574156 ) ) ( not ( = ?auto_574154 ?auto_574157 ) ) ( not ( = ?auto_574154 ?auto_574158 ) ) ( not ( = ?auto_574154 ?auto_574159 ) ) ( not ( = ?auto_574154 ?auto_574160 ) ) ( not ( = ?auto_574154 ?auto_574161 ) ) ( not ( = ?auto_574155 ?auto_574156 ) ) ( not ( = ?auto_574155 ?auto_574157 ) ) ( not ( = ?auto_574155 ?auto_574158 ) ) ( not ( = ?auto_574155 ?auto_574159 ) ) ( not ( = ?auto_574155 ?auto_574160 ) ) ( not ( = ?auto_574155 ?auto_574161 ) ) ( not ( = ?auto_574156 ?auto_574157 ) ) ( not ( = ?auto_574156 ?auto_574158 ) ) ( not ( = ?auto_574156 ?auto_574159 ) ) ( not ( = ?auto_574156 ?auto_574160 ) ) ( not ( = ?auto_574156 ?auto_574161 ) ) ( not ( = ?auto_574157 ?auto_574158 ) ) ( not ( = ?auto_574157 ?auto_574159 ) ) ( not ( = ?auto_574157 ?auto_574160 ) ) ( not ( = ?auto_574157 ?auto_574161 ) ) ( not ( = ?auto_574158 ?auto_574159 ) ) ( not ( = ?auto_574158 ?auto_574160 ) ) ( not ( = ?auto_574158 ?auto_574161 ) ) ( not ( = ?auto_574159 ?auto_574160 ) ) ( not ( = ?auto_574159 ?auto_574161 ) ) ( not ( = ?auto_574160 ?auto_574161 ) ) ( ON ?auto_574159 ?auto_574160 ) ( ON ?auto_574158 ?auto_574159 ) ( ON ?auto_574157 ?auto_574158 ) ( ON ?auto_574156 ?auto_574157 ) ( ON ?auto_574155 ?auto_574156 ) ( ON ?auto_574154 ?auto_574155 ) ( ON ?auto_574153 ?auto_574154 ) ( CLEAR ?auto_574151 ) ( ON ?auto_574152 ?auto_574153 ) ( CLEAR ?auto_574152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_574149 ?auto_574150 ?auto_574151 ?auto_574152 )
      ( MAKE-12PILE ?auto_574149 ?auto_574150 ?auto_574151 ?auto_574152 ?auto_574153 ?auto_574154 ?auto_574155 ?auto_574156 ?auto_574157 ?auto_574158 ?auto_574159 ?auto_574160 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_574199 - BLOCK
      ?auto_574200 - BLOCK
      ?auto_574201 - BLOCK
      ?auto_574202 - BLOCK
      ?auto_574203 - BLOCK
      ?auto_574204 - BLOCK
      ?auto_574205 - BLOCK
      ?auto_574206 - BLOCK
      ?auto_574207 - BLOCK
      ?auto_574208 - BLOCK
      ?auto_574209 - BLOCK
      ?auto_574210 - BLOCK
    )
    :vars
    (
      ?auto_574211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_574210 ?auto_574211 ) ( ON-TABLE ?auto_574199 ) ( ON ?auto_574200 ?auto_574199 ) ( not ( = ?auto_574199 ?auto_574200 ) ) ( not ( = ?auto_574199 ?auto_574201 ) ) ( not ( = ?auto_574199 ?auto_574202 ) ) ( not ( = ?auto_574199 ?auto_574203 ) ) ( not ( = ?auto_574199 ?auto_574204 ) ) ( not ( = ?auto_574199 ?auto_574205 ) ) ( not ( = ?auto_574199 ?auto_574206 ) ) ( not ( = ?auto_574199 ?auto_574207 ) ) ( not ( = ?auto_574199 ?auto_574208 ) ) ( not ( = ?auto_574199 ?auto_574209 ) ) ( not ( = ?auto_574199 ?auto_574210 ) ) ( not ( = ?auto_574199 ?auto_574211 ) ) ( not ( = ?auto_574200 ?auto_574201 ) ) ( not ( = ?auto_574200 ?auto_574202 ) ) ( not ( = ?auto_574200 ?auto_574203 ) ) ( not ( = ?auto_574200 ?auto_574204 ) ) ( not ( = ?auto_574200 ?auto_574205 ) ) ( not ( = ?auto_574200 ?auto_574206 ) ) ( not ( = ?auto_574200 ?auto_574207 ) ) ( not ( = ?auto_574200 ?auto_574208 ) ) ( not ( = ?auto_574200 ?auto_574209 ) ) ( not ( = ?auto_574200 ?auto_574210 ) ) ( not ( = ?auto_574200 ?auto_574211 ) ) ( not ( = ?auto_574201 ?auto_574202 ) ) ( not ( = ?auto_574201 ?auto_574203 ) ) ( not ( = ?auto_574201 ?auto_574204 ) ) ( not ( = ?auto_574201 ?auto_574205 ) ) ( not ( = ?auto_574201 ?auto_574206 ) ) ( not ( = ?auto_574201 ?auto_574207 ) ) ( not ( = ?auto_574201 ?auto_574208 ) ) ( not ( = ?auto_574201 ?auto_574209 ) ) ( not ( = ?auto_574201 ?auto_574210 ) ) ( not ( = ?auto_574201 ?auto_574211 ) ) ( not ( = ?auto_574202 ?auto_574203 ) ) ( not ( = ?auto_574202 ?auto_574204 ) ) ( not ( = ?auto_574202 ?auto_574205 ) ) ( not ( = ?auto_574202 ?auto_574206 ) ) ( not ( = ?auto_574202 ?auto_574207 ) ) ( not ( = ?auto_574202 ?auto_574208 ) ) ( not ( = ?auto_574202 ?auto_574209 ) ) ( not ( = ?auto_574202 ?auto_574210 ) ) ( not ( = ?auto_574202 ?auto_574211 ) ) ( not ( = ?auto_574203 ?auto_574204 ) ) ( not ( = ?auto_574203 ?auto_574205 ) ) ( not ( = ?auto_574203 ?auto_574206 ) ) ( not ( = ?auto_574203 ?auto_574207 ) ) ( not ( = ?auto_574203 ?auto_574208 ) ) ( not ( = ?auto_574203 ?auto_574209 ) ) ( not ( = ?auto_574203 ?auto_574210 ) ) ( not ( = ?auto_574203 ?auto_574211 ) ) ( not ( = ?auto_574204 ?auto_574205 ) ) ( not ( = ?auto_574204 ?auto_574206 ) ) ( not ( = ?auto_574204 ?auto_574207 ) ) ( not ( = ?auto_574204 ?auto_574208 ) ) ( not ( = ?auto_574204 ?auto_574209 ) ) ( not ( = ?auto_574204 ?auto_574210 ) ) ( not ( = ?auto_574204 ?auto_574211 ) ) ( not ( = ?auto_574205 ?auto_574206 ) ) ( not ( = ?auto_574205 ?auto_574207 ) ) ( not ( = ?auto_574205 ?auto_574208 ) ) ( not ( = ?auto_574205 ?auto_574209 ) ) ( not ( = ?auto_574205 ?auto_574210 ) ) ( not ( = ?auto_574205 ?auto_574211 ) ) ( not ( = ?auto_574206 ?auto_574207 ) ) ( not ( = ?auto_574206 ?auto_574208 ) ) ( not ( = ?auto_574206 ?auto_574209 ) ) ( not ( = ?auto_574206 ?auto_574210 ) ) ( not ( = ?auto_574206 ?auto_574211 ) ) ( not ( = ?auto_574207 ?auto_574208 ) ) ( not ( = ?auto_574207 ?auto_574209 ) ) ( not ( = ?auto_574207 ?auto_574210 ) ) ( not ( = ?auto_574207 ?auto_574211 ) ) ( not ( = ?auto_574208 ?auto_574209 ) ) ( not ( = ?auto_574208 ?auto_574210 ) ) ( not ( = ?auto_574208 ?auto_574211 ) ) ( not ( = ?auto_574209 ?auto_574210 ) ) ( not ( = ?auto_574209 ?auto_574211 ) ) ( not ( = ?auto_574210 ?auto_574211 ) ) ( ON ?auto_574209 ?auto_574210 ) ( ON ?auto_574208 ?auto_574209 ) ( ON ?auto_574207 ?auto_574208 ) ( ON ?auto_574206 ?auto_574207 ) ( ON ?auto_574205 ?auto_574206 ) ( ON ?auto_574204 ?auto_574205 ) ( ON ?auto_574203 ?auto_574204 ) ( ON ?auto_574202 ?auto_574203 ) ( CLEAR ?auto_574200 ) ( ON ?auto_574201 ?auto_574202 ) ( CLEAR ?auto_574201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_574199 ?auto_574200 ?auto_574201 )
      ( MAKE-12PILE ?auto_574199 ?auto_574200 ?auto_574201 ?auto_574202 ?auto_574203 ?auto_574204 ?auto_574205 ?auto_574206 ?auto_574207 ?auto_574208 ?auto_574209 ?auto_574210 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_574249 - BLOCK
      ?auto_574250 - BLOCK
      ?auto_574251 - BLOCK
      ?auto_574252 - BLOCK
      ?auto_574253 - BLOCK
      ?auto_574254 - BLOCK
      ?auto_574255 - BLOCK
      ?auto_574256 - BLOCK
      ?auto_574257 - BLOCK
      ?auto_574258 - BLOCK
      ?auto_574259 - BLOCK
      ?auto_574260 - BLOCK
    )
    :vars
    (
      ?auto_574261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_574260 ?auto_574261 ) ( ON-TABLE ?auto_574249 ) ( not ( = ?auto_574249 ?auto_574250 ) ) ( not ( = ?auto_574249 ?auto_574251 ) ) ( not ( = ?auto_574249 ?auto_574252 ) ) ( not ( = ?auto_574249 ?auto_574253 ) ) ( not ( = ?auto_574249 ?auto_574254 ) ) ( not ( = ?auto_574249 ?auto_574255 ) ) ( not ( = ?auto_574249 ?auto_574256 ) ) ( not ( = ?auto_574249 ?auto_574257 ) ) ( not ( = ?auto_574249 ?auto_574258 ) ) ( not ( = ?auto_574249 ?auto_574259 ) ) ( not ( = ?auto_574249 ?auto_574260 ) ) ( not ( = ?auto_574249 ?auto_574261 ) ) ( not ( = ?auto_574250 ?auto_574251 ) ) ( not ( = ?auto_574250 ?auto_574252 ) ) ( not ( = ?auto_574250 ?auto_574253 ) ) ( not ( = ?auto_574250 ?auto_574254 ) ) ( not ( = ?auto_574250 ?auto_574255 ) ) ( not ( = ?auto_574250 ?auto_574256 ) ) ( not ( = ?auto_574250 ?auto_574257 ) ) ( not ( = ?auto_574250 ?auto_574258 ) ) ( not ( = ?auto_574250 ?auto_574259 ) ) ( not ( = ?auto_574250 ?auto_574260 ) ) ( not ( = ?auto_574250 ?auto_574261 ) ) ( not ( = ?auto_574251 ?auto_574252 ) ) ( not ( = ?auto_574251 ?auto_574253 ) ) ( not ( = ?auto_574251 ?auto_574254 ) ) ( not ( = ?auto_574251 ?auto_574255 ) ) ( not ( = ?auto_574251 ?auto_574256 ) ) ( not ( = ?auto_574251 ?auto_574257 ) ) ( not ( = ?auto_574251 ?auto_574258 ) ) ( not ( = ?auto_574251 ?auto_574259 ) ) ( not ( = ?auto_574251 ?auto_574260 ) ) ( not ( = ?auto_574251 ?auto_574261 ) ) ( not ( = ?auto_574252 ?auto_574253 ) ) ( not ( = ?auto_574252 ?auto_574254 ) ) ( not ( = ?auto_574252 ?auto_574255 ) ) ( not ( = ?auto_574252 ?auto_574256 ) ) ( not ( = ?auto_574252 ?auto_574257 ) ) ( not ( = ?auto_574252 ?auto_574258 ) ) ( not ( = ?auto_574252 ?auto_574259 ) ) ( not ( = ?auto_574252 ?auto_574260 ) ) ( not ( = ?auto_574252 ?auto_574261 ) ) ( not ( = ?auto_574253 ?auto_574254 ) ) ( not ( = ?auto_574253 ?auto_574255 ) ) ( not ( = ?auto_574253 ?auto_574256 ) ) ( not ( = ?auto_574253 ?auto_574257 ) ) ( not ( = ?auto_574253 ?auto_574258 ) ) ( not ( = ?auto_574253 ?auto_574259 ) ) ( not ( = ?auto_574253 ?auto_574260 ) ) ( not ( = ?auto_574253 ?auto_574261 ) ) ( not ( = ?auto_574254 ?auto_574255 ) ) ( not ( = ?auto_574254 ?auto_574256 ) ) ( not ( = ?auto_574254 ?auto_574257 ) ) ( not ( = ?auto_574254 ?auto_574258 ) ) ( not ( = ?auto_574254 ?auto_574259 ) ) ( not ( = ?auto_574254 ?auto_574260 ) ) ( not ( = ?auto_574254 ?auto_574261 ) ) ( not ( = ?auto_574255 ?auto_574256 ) ) ( not ( = ?auto_574255 ?auto_574257 ) ) ( not ( = ?auto_574255 ?auto_574258 ) ) ( not ( = ?auto_574255 ?auto_574259 ) ) ( not ( = ?auto_574255 ?auto_574260 ) ) ( not ( = ?auto_574255 ?auto_574261 ) ) ( not ( = ?auto_574256 ?auto_574257 ) ) ( not ( = ?auto_574256 ?auto_574258 ) ) ( not ( = ?auto_574256 ?auto_574259 ) ) ( not ( = ?auto_574256 ?auto_574260 ) ) ( not ( = ?auto_574256 ?auto_574261 ) ) ( not ( = ?auto_574257 ?auto_574258 ) ) ( not ( = ?auto_574257 ?auto_574259 ) ) ( not ( = ?auto_574257 ?auto_574260 ) ) ( not ( = ?auto_574257 ?auto_574261 ) ) ( not ( = ?auto_574258 ?auto_574259 ) ) ( not ( = ?auto_574258 ?auto_574260 ) ) ( not ( = ?auto_574258 ?auto_574261 ) ) ( not ( = ?auto_574259 ?auto_574260 ) ) ( not ( = ?auto_574259 ?auto_574261 ) ) ( not ( = ?auto_574260 ?auto_574261 ) ) ( ON ?auto_574259 ?auto_574260 ) ( ON ?auto_574258 ?auto_574259 ) ( ON ?auto_574257 ?auto_574258 ) ( ON ?auto_574256 ?auto_574257 ) ( ON ?auto_574255 ?auto_574256 ) ( ON ?auto_574254 ?auto_574255 ) ( ON ?auto_574253 ?auto_574254 ) ( ON ?auto_574252 ?auto_574253 ) ( ON ?auto_574251 ?auto_574252 ) ( CLEAR ?auto_574249 ) ( ON ?auto_574250 ?auto_574251 ) ( CLEAR ?auto_574250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_574249 ?auto_574250 )
      ( MAKE-12PILE ?auto_574249 ?auto_574250 ?auto_574251 ?auto_574252 ?auto_574253 ?auto_574254 ?auto_574255 ?auto_574256 ?auto_574257 ?auto_574258 ?auto_574259 ?auto_574260 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_574299 - BLOCK
      ?auto_574300 - BLOCK
      ?auto_574301 - BLOCK
      ?auto_574302 - BLOCK
      ?auto_574303 - BLOCK
      ?auto_574304 - BLOCK
      ?auto_574305 - BLOCK
      ?auto_574306 - BLOCK
      ?auto_574307 - BLOCK
      ?auto_574308 - BLOCK
      ?auto_574309 - BLOCK
      ?auto_574310 - BLOCK
    )
    :vars
    (
      ?auto_574311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_574310 ?auto_574311 ) ( not ( = ?auto_574299 ?auto_574300 ) ) ( not ( = ?auto_574299 ?auto_574301 ) ) ( not ( = ?auto_574299 ?auto_574302 ) ) ( not ( = ?auto_574299 ?auto_574303 ) ) ( not ( = ?auto_574299 ?auto_574304 ) ) ( not ( = ?auto_574299 ?auto_574305 ) ) ( not ( = ?auto_574299 ?auto_574306 ) ) ( not ( = ?auto_574299 ?auto_574307 ) ) ( not ( = ?auto_574299 ?auto_574308 ) ) ( not ( = ?auto_574299 ?auto_574309 ) ) ( not ( = ?auto_574299 ?auto_574310 ) ) ( not ( = ?auto_574299 ?auto_574311 ) ) ( not ( = ?auto_574300 ?auto_574301 ) ) ( not ( = ?auto_574300 ?auto_574302 ) ) ( not ( = ?auto_574300 ?auto_574303 ) ) ( not ( = ?auto_574300 ?auto_574304 ) ) ( not ( = ?auto_574300 ?auto_574305 ) ) ( not ( = ?auto_574300 ?auto_574306 ) ) ( not ( = ?auto_574300 ?auto_574307 ) ) ( not ( = ?auto_574300 ?auto_574308 ) ) ( not ( = ?auto_574300 ?auto_574309 ) ) ( not ( = ?auto_574300 ?auto_574310 ) ) ( not ( = ?auto_574300 ?auto_574311 ) ) ( not ( = ?auto_574301 ?auto_574302 ) ) ( not ( = ?auto_574301 ?auto_574303 ) ) ( not ( = ?auto_574301 ?auto_574304 ) ) ( not ( = ?auto_574301 ?auto_574305 ) ) ( not ( = ?auto_574301 ?auto_574306 ) ) ( not ( = ?auto_574301 ?auto_574307 ) ) ( not ( = ?auto_574301 ?auto_574308 ) ) ( not ( = ?auto_574301 ?auto_574309 ) ) ( not ( = ?auto_574301 ?auto_574310 ) ) ( not ( = ?auto_574301 ?auto_574311 ) ) ( not ( = ?auto_574302 ?auto_574303 ) ) ( not ( = ?auto_574302 ?auto_574304 ) ) ( not ( = ?auto_574302 ?auto_574305 ) ) ( not ( = ?auto_574302 ?auto_574306 ) ) ( not ( = ?auto_574302 ?auto_574307 ) ) ( not ( = ?auto_574302 ?auto_574308 ) ) ( not ( = ?auto_574302 ?auto_574309 ) ) ( not ( = ?auto_574302 ?auto_574310 ) ) ( not ( = ?auto_574302 ?auto_574311 ) ) ( not ( = ?auto_574303 ?auto_574304 ) ) ( not ( = ?auto_574303 ?auto_574305 ) ) ( not ( = ?auto_574303 ?auto_574306 ) ) ( not ( = ?auto_574303 ?auto_574307 ) ) ( not ( = ?auto_574303 ?auto_574308 ) ) ( not ( = ?auto_574303 ?auto_574309 ) ) ( not ( = ?auto_574303 ?auto_574310 ) ) ( not ( = ?auto_574303 ?auto_574311 ) ) ( not ( = ?auto_574304 ?auto_574305 ) ) ( not ( = ?auto_574304 ?auto_574306 ) ) ( not ( = ?auto_574304 ?auto_574307 ) ) ( not ( = ?auto_574304 ?auto_574308 ) ) ( not ( = ?auto_574304 ?auto_574309 ) ) ( not ( = ?auto_574304 ?auto_574310 ) ) ( not ( = ?auto_574304 ?auto_574311 ) ) ( not ( = ?auto_574305 ?auto_574306 ) ) ( not ( = ?auto_574305 ?auto_574307 ) ) ( not ( = ?auto_574305 ?auto_574308 ) ) ( not ( = ?auto_574305 ?auto_574309 ) ) ( not ( = ?auto_574305 ?auto_574310 ) ) ( not ( = ?auto_574305 ?auto_574311 ) ) ( not ( = ?auto_574306 ?auto_574307 ) ) ( not ( = ?auto_574306 ?auto_574308 ) ) ( not ( = ?auto_574306 ?auto_574309 ) ) ( not ( = ?auto_574306 ?auto_574310 ) ) ( not ( = ?auto_574306 ?auto_574311 ) ) ( not ( = ?auto_574307 ?auto_574308 ) ) ( not ( = ?auto_574307 ?auto_574309 ) ) ( not ( = ?auto_574307 ?auto_574310 ) ) ( not ( = ?auto_574307 ?auto_574311 ) ) ( not ( = ?auto_574308 ?auto_574309 ) ) ( not ( = ?auto_574308 ?auto_574310 ) ) ( not ( = ?auto_574308 ?auto_574311 ) ) ( not ( = ?auto_574309 ?auto_574310 ) ) ( not ( = ?auto_574309 ?auto_574311 ) ) ( not ( = ?auto_574310 ?auto_574311 ) ) ( ON ?auto_574309 ?auto_574310 ) ( ON ?auto_574308 ?auto_574309 ) ( ON ?auto_574307 ?auto_574308 ) ( ON ?auto_574306 ?auto_574307 ) ( ON ?auto_574305 ?auto_574306 ) ( ON ?auto_574304 ?auto_574305 ) ( ON ?auto_574303 ?auto_574304 ) ( ON ?auto_574302 ?auto_574303 ) ( ON ?auto_574301 ?auto_574302 ) ( ON ?auto_574300 ?auto_574301 ) ( ON ?auto_574299 ?auto_574300 ) ( CLEAR ?auto_574299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_574299 )
      ( MAKE-12PILE ?auto_574299 ?auto_574300 ?auto_574301 ?auto_574302 ?auto_574303 ?auto_574304 ?auto_574305 ?auto_574306 ?auto_574307 ?auto_574308 ?auto_574309 ?auto_574310 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_574350 - BLOCK
      ?auto_574351 - BLOCK
      ?auto_574352 - BLOCK
      ?auto_574353 - BLOCK
      ?auto_574354 - BLOCK
      ?auto_574355 - BLOCK
      ?auto_574356 - BLOCK
      ?auto_574357 - BLOCK
      ?auto_574358 - BLOCK
      ?auto_574359 - BLOCK
      ?auto_574360 - BLOCK
      ?auto_574361 - BLOCK
      ?auto_574362 - BLOCK
    )
    :vars
    (
      ?auto_574363 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_574361 ) ( ON ?auto_574362 ?auto_574363 ) ( CLEAR ?auto_574362 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_574350 ) ( ON ?auto_574351 ?auto_574350 ) ( ON ?auto_574352 ?auto_574351 ) ( ON ?auto_574353 ?auto_574352 ) ( ON ?auto_574354 ?auto_574353 ) ( ON ?auto_574355 ?auto_574354 ) ( ON ?auto_574356 ?auto_574355 ) ( ON ?auto_574357 ?auto_574356 ) ( ON ?auto_574358 ?auto_574357 ) ( ON ?auto_574359 ?auto_574358 ) ( ON ?auto_574360 ?auto_574359 ) ( ON ?auto_574361 ?auto_574360 ) ( not ( = ?auto_574350 ?auto_574351 ) ) ( not ( = ?auto_574350 ?auto_574352 ) ) ( not ( = ?auto_574350 ?auto_574353 ) ) ( not ( = ?auto_574350 ?auto_574354 ) ) ( not ( = ?auto_574350 ?auto_574355 ) ) ( not ( = ?auto_574350 ?auto_574356 ) ) ( not ( = ?auto_574350 ?auto_574357 ) ) ( not ( = ?auto_574350 ?auto_574358 ) ) ( not ( = ?auto_574350 ?auto_574359 ) ) ( not ( = ?auto_574350 ?auto_574360 ) ) ( not ( = ?auto_574350 ?auto_574361 ) ) ( not ( = ?auto_574350 ?auto_574362 ) ) ( not ( = ?auto_574350 ?auto_574363 ) ) ( not ( = ?auto_574351 ?auto_574352 ) ) ( not ( = ?auto_574351 ?auto_574353 ) ) ( not ( = ?auto_574351 ?auto_574354 ) ) ( not ( = ?auto_574351 ?auto_574355 ) ) ( not ( = ?auto_574351 ?auto_574356 ) ) ( not ( = ?auto_574351 ?auto_574357 ) ) ( not ( = ?auto_574351 ?auto_574358 ) ) ( not ( = ?auto_574351 ?auto_574359 ) ) ( not ( = ?auto_574351 ?auto_574360 ) ) ( not ( = ?auto_574351 ?auto_574361 ) ) ( not ( = ?auto_574351 ?auto_574362 ) ) ( not ( = ?auto_574351 ?auto_574363 ) ) ( not ( = ?auto_574352 ?auto_574353 ) ) ( not ( = ?auto_574352 ?auto_574354 ) ) ( not ( = ?auto_574352 ?auto_574355 ) ) ( not ( = ?auto_574352 ?auto_574356 ) ) ( not ( = ?auto_574352 ?auto_574357 ) ) ( not ( = ?auto_574352 ?auto_574358 ) ) ( not ( = ?auto_574352 ?auto_574359 ) ) ( not ( = ?auto_574352 ?auto_574360 ) ) ( not ( = ?auto_574352 ?auto_574361 ) ) ( not ( = ?auto_574352 ?auto_574362 ) ) ( not ( = ?auto_574352 ?auto_574363 ) ) ( not ( = ?auto_574353 ?auto_574354 ) ) ( not ( = ?auto_574353 ?auto_574355 ) ) ( not ( = ?auto_574353 ?auto_574356 ) ) ( not ( = ?auto_574353 ?auto_574357 ) ) ( not ( = ?auto_574353 ?auto_574358 ) ) ( not ( = ?auto_574353 ?auto_574359 ) ) ( not ( = ?auto_574353 ?auto_574360 ) ) ( not ( = ?auto_574353 ?auto_574361 ) ) ( not ( = ?auto_574353 ?auto_574362 ) ) ( not ( = ?auto_574353 ?auto_574363 ) ) ( not ( = ?auto_574354 ?auto_574355 ) ) ( not ( = ?auto_574354 ?auto_574356 ) ) ( not ( = ?auto_574354 ?auto_574357 ) ) ( not ( = ?auto_574354 ?auto_574358 ) ) ( not ( = ?auto_574354 ?auto_574359 ) ) ( not ( = ?auto_574354 ?auto_574360 ) ) ( not ( = ?auto_574354 ?auto_574361 ) ) ( not ( = ?auto_574354 ?auto_574362 ) ) ( not ( = ?auto_574354 ?auto_574363 ) ) ( not ( = ?auto_574355 ?auto_574356 ) ) ( not ( = ?auto_574355 ?auto_574357 ) ) ( not ( = ?auto_574355 ?auto_574358 ) ) ( not ( = ?auto_574355 ?auto_574359 ) ) ( not ( = ?auto_574355 ?auto_574360 ) ) ( not ( = ?auto_574355 ?auto_574361 ) ) ( not ( = ?auto_574355 ?auto_574362 ) ) ( not ( = ?auto_574355 ?auto_574363 ) ) ( not ( = ?auto_574356 ?auto_574357 ) ) ( not ( = ?auto_574356 ?auto_574358 ) ) ( not ( = ?auto_574356 ?auto_574359 ) ) ( not ( = ?auto_574356 ?auto_574360 ) ) ( not ( = ?auto_574356 ?auto_574361 ) ) ( not ( = ?auto_574356 ?auto_574362 ) ) ( not ( = ?auto_574356 ?auto_574363 ) ) ( not ( = ?auto_574357 ?auto_574358 ) ) ( not ( = ?auto_574357 ?auto_574359 ) ) ( not ( = ?auto_574357 ?auto_574360 ) ) ( not ( = ?auto_574357 ?auto_574361 ) ) ( not ( = ?auto_574357 ?auto_574362 ) ) ( not ( = ?auto_574357 ?auto_574363 ) ) ( not ( = ?auto_574358 ?auto_574359 ) ) ( not ( = ?auto_574358 ?auto_574360 ) ) ( not ( = ?auto_574358 ?auto_574361 ) ) ( not ( = ?auto_574358 ?auto_574362 ) ) ( not ( = ?auto_574358 ?auto_574363 ) ) ( not ( = ?auto_574359 ?auto_574360 ) ) ( not ( = ?auto_574359 ?auto_574361 ) ) ( not ( = ?auto_574359 ?auto_574362 ) ) ( not ( = ?auto_574359 ?auto_574363 ) ) ( not ( = ?auto_574360 ?auto_574361 ) ) ( not ( = ?auto_574360 ?auto_574362 ) ) ( not ( = ?auto_574360 ?auto_574363 ) ) ( not ( = ?auto_574361 ?auto_574362 ) ) ( not ( = ?auto_574361 ?auto_574363 ) ) ( not ( = ?auto_574362 ?auto_574363 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_574362 ?auto_574363 )
      ( !STACK ?auto_574362 ?auto_574361 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_574404 - BLOCK
      ?auto_574405 - BLOCK
      ?auto_574406 - BLOCK
      ?auto_574407 - BLOCK
      ?auto_574408 - BLOCK
      ?auto_574409 - BLOCK
      ?auto_574410 - BLOCK
      ?auto_574411 - BLOCK
      ?auto_574412 - BLOCK
      ?auto_574413 - BLOCK
      ?auto_574414 - BLOCK
      ?auto_574415 - BLOCK
      ?auto_574416 - BLOCK
    )
    :vars
    (
      ?auto_574417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_574416 ?auto_574417 ) ( ON-TABLE ?auto_574404 ) ( ON ?auto_574405 ?auto_574404 ) ( ON ?auto_574406 ?auto_574405 ) ( ON ?auto_574407 ?auto_574406 ) ( ON ?auto_574408 ?auto_574407 ) ( ON ?auto_574409 ?auto_574408 ) ( ON ?auto_574410 ?auto_574409 ) ( ON ?auto_574411 ?auto_574410 ) ( ON ?auto_574412 ?auto_574411 ) ( ON ?auto_574413 ?auto_574412 ) ( ON ?auto_574414 ?auto_574413 ) ( not ( = ?auto_574404 ?auto_574405 ) ) ( not ( = ?auto_574404 ?auto_574406 ) ) ( not ( = ?auto_574404 ?auto_574407 ) ) ( not ( = ?auto_574404 ?auto_574408 ) ) ( not ( = ?auto_574404 ?auto_574409 ) ) ( not ( = ?auto_574404 ?auto_574410 ) ) ( not ( = ?auto_574404 ?auto_574411 ) ) ( not ( = ?auto_574404 ?auto_574412 ) ) ( not ( = ?auto_574404 ?auto_574413 ) ) ( not ( = ?auto_574404 ?auto_574414 ) ) ( not ( = ?auto_574404 ?auto_574415 ) ) ( not ( = ?auto_574404 ?auto_574416 ) ) ( not ( = ?auto_574404 ?auto_574417 ) ) ( not ( = ?auto_574405 ?auto_574406 ) ) ( not ( = ?auto_574405 ?auto_574407 ) ) ( not ( = ?auto_574405 ?auto_574408 ) ) ( not ( = ?auto_574405 ?auto_574409 ) ) ( not ( = ?auto_574405 ?auto_574410 ) ) ( not ( = ?auto_574405 ?auto_574411 ) ) ( not ( = ?auto_574405 ?auto_574412 ) ) ( not ( = ?auto_574405 ?auto_574413 ) ) ( not ( = ?auto_574405 ?auto_574414 ) ) ( not ( = ?auto_574405 ?auto_574415 ) ) ( not ( = ?auto_574405 ?auto_574416 ) ) ( not ( = ?auto_574405 ?auto_574417 ) ) ( not ( = ?auto_574406 ?auto_574407 ) ) ( not ( = ?auto_574406 ?auto_574408 ) ) ( not ( = ?auto_574406 ?auto_574409 ) ) ( not ( = ?auto_574406 ?auto_574410 ) ) ( not ( = ?auto_574406 ?auto_574411 ) ) ( not ( = ?auto_574406 ?auto_574412 ) ) ( not ( = ?auto_574406 ?auto_574413 ) ) ( not ( = ?auto_574406 ?auto_574414 ) ) ( not ( = ?auto_574406 ?auto_574415 ) ) ( not ( = ?auto_574406 ?auto_574416 ) ) ( not ( = ?auto_574406 ?auto_574417 ) ) ( not ( = ?auto_574407 ?auto_574408 ) ) ( not ( = ?auto_574407 ?auto_574409 ) ) ( not ( = ?auto_574407 ?auto_574410 ) ) ( not ( = ?auto_574407 ?auto_574411 ) ) ( not ( = ?auto_574407 ?auto_574412 ) ) ( not ( = ?auto_574407 ?auto_574413 ) ) ( not ( = ?auto_574407 ?auto_574414 ) ) ( not ( = ?auto_574407 ?auto_574415 ) ) ( not ( = ?auto_574407 ?auto_574416 ) ) ( not ( = ?auto_574407 ?auto_574417 ) ) ( not ( = ?auto_574408 ?auto_574409 ) ) ( not ( = ?auto_574408 ?auto_574410 ) ) ( not ( = ?auto_574408 ?auto_574411 ) ) ( not ( = ?auto_574408 ?auto_574412 ) ) ( not ( = ?auto_574408 ?auto_574413 ) ) ( not ( = ?auto_574408 ?auto_574414 ) ) ( not ( = ?auto_574408 ?auto_574415 ) ) ( not ( = ?auto_574408 ?auto_574416 ) ) ( not ( = ?auto_574408 ?auto_574417 ) ) ( not ( = ?auto_574409 ?auto_574410 ) ) ( not ( = ?auto_574409 ?auto_574411 ) ) ( not ( = ?auto_574409 ?auto_574412 ) ) ( not ( = ?auto_574409 ?auto_574413 ) ) ( not ( = ?auto_574409 ?auto_574414 ) ) ( not ( = ?auto_574409 ?auto_574415 ) ) ( not ( = ?auto_574409 ?auto_574416 ) ) ( not ( = ?auto_574409 ?auto_574417 ) ) ( not ( = ?auto_574410 ?auto_574411 ) ) ( not ( = ?auto_574410 ?auto_574412 ) ) ( not ( = ?auto_574410 ?auto_574413 ) ) ( not ( = ?auto_574410 ?auto_574414 ) ) ( not ( = ?auto_574410 ?auto_574415 ) ) ( not ( = ?auto_574410 ?auto_574416 ) ) ( not ( = ?auto_574410 ?auto_574417 ) ) ( not ( = ?auto_574411 ?auto_574412 ) ) ( not ( = ?auto_574411 ?auto_574413 ) ) ( not ( = ?auto_574411 ?auto_574414 ) ) ( not ( = ?auto_574411 ?auto_574415 ) ) ( not ( = ?auto_574411 ?auto_574416 ) ) ( not ( = ?auto_574411 ?auto_574417 ) ) ( not ( = ?auto_574412 ?auto_574413 ) ) ( not ( = ?auto_574412 ?auto_574414 ) ) ( not ( = ?auto_574412 ?auto_574415 ) ) ( not ( = ?auto_574412 ?auto_574416 ) ) ( not ( = ?auto_574412 ?auto_574417 ) ) ( not ( = ?auto_574413 ?auto_574414 ) ) ( not ( = ?auto_574413 ?auto_574415 ) ) ( not ( = ?auto_574413 ?auto_574416 ) ) ( not ( = ?auto_574413 ?auto_574417 ) ) ( not ( = ?auto_574414 ?auto_574415 ) ) ( not ( = ?auto_574414 ?auto_574416 ) ) ( not ( = ?auto_574414 ?auto_574417 ) ) ( not ( = ?auto_574415 ?auto_574416 ) ) ( not ( = ?auto_574415 ?auto_574417 ) ) ( not ( = ?auto_574416 ?auto_574417 ) ) ( CLEAR ?auto_574414 ) ( ON ?auto_574415 ?auto_574416 ) ( CLEAR ?auto_574415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_574404 ?auto_574405 ?auto_574406 ?auto_574407 ?auto_574408 ?auto_574409 ?auto_574410 ?auto_574411 ?auto_574412 ?auto_574413 ?auto_574414 ?auto_574415 )
      ( MAKE-13PILE ?auto_574404 ?auto_574405 ?auto_574406 ?auto_574407 ?auto_574408 ?auto_574409 ?auto_574410 ?auto_574411 ?auto_574412 ?auto_574413 ?auto_574414 ?auto_574415 ?auto_574416 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_574458 - BLOCK
      ?auto_574459 - BLOCK
      ?auto_574460 - BLOCK
      ?auto_574461 - BLOCK
      ?auto_574462 - BLOCK
      ?auto_574463 - BLOCK
      ?auto_574464 - BLOCK
      ?auto_574465 - BLOCK
      ?auto_574466 - BLOCK
      ?auto_574467 - BLOCK
      ?auto_574468 - BLOCK
      ?auto_574469 - BLOCK
      ?auto_574470 - BLOCK
    )
    :vars
    (
      ?auto_574471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_574470 ?auto_574471 ) ( ON-TABLE ?auto_574458 ) ( ON ?auto_574459 ?auto_574458 ) ( ON ?auto_574460 ?auto_574459 ) ( ON ?auto_574461 ?auto_574460 ) ( ON ?auto_574462 ?auto_574461 ) ( ON ?auto_574463 ?auto_574462 ) ( ON ?auto_574464 ?auto_574463 ) ( ON ?auto_574465 ?auto_574464 ) ( ON ?auto_574466 ?auto_574465 ) ( ON ?auto_574467 ?auto_574466 ) ( not ( = ?auto_574458 ?auto_574459 ) ) ( not ( = ?auto_574458 ?auto_574460 ) ) ( not ( = ?auto_574458 ?auto_574461 ) ) ( not ( = ?auto_574458 ?auto_574462 ) ) ( not ( = ?auto_574458 ?auto_574463 ) ) ( not ( = ?auto_574458 ?auto_574464 ) ) ( not ( = ?auto_574458 ?auto_574465 ) ) ( not ( = ?auto_574458 ?auto_574466 ) ) ( not ( = ?auto_574458 ?auto_574467 ) ) ( not ( = ?auto_574458 ?auto_574468 ) ) ( not ( = ?auto_574458 ?auto_574469 ) ) ( not ( = ?auto_574458 ?auto_574470 ) ) ( not ( = ?auto_574458 ?auto_574471 ) ) ( not ( = ?auto_574459 ?auto_574460 ) ) ( not ( = ?auto_574459 ?auto_574461 ) ) ( not ( = ?auto_574459 ?auto_574462 ) ) ( not ( = ?auto_574459 ?auto_574463 ) ) ( not ( = ?auto_574459 ?auto_574464 ) ) ( not ( = ?auto_574459 ?auto_574465 ) ) ( not ( = ?auto_574459 ?auto_574466 ) ) ( not ( = ?auto_574459 ?auto_574467 ) ) ( not ( = ?auto_574459 ?auto_574468 ) ) ( not ( = ?auto_574459 ?auto_574469 ) ) ( not ( = ?auto_574459 ?auto_574470 ) ) ( not ( = ?auto_574459 ?auto_574471 ) ) ( not ( = ?auto_574460 ?auto_574461 ) ) ( not ( = ?auto_574460 ?auto_574462 ) ) ( not ( = ?auto_574460 ?auto_574463 ) ) ( not ( = ?auto_574460 ?auto_574464 ) ) ( not ( = ?auto_574460 ?auto_574465 ) ) ( not ( = ?auto_574460 ?auto_574466 ) ) ( not ( = ?auto_574460 ?auto_574467 ) ) ( not ( = ?auto_574460 ?auto_574468 ) ) ( not ( = ?auto_574460 ?auto_574469 ) ) ( not ( = ?auto_574460 ?auto_574470 ) ) ( not ( = ?auto_574460 ?auto_574471 ) ) ( not ( = ?auto_574461 ?auto_574462 ) ) ( not ( = ?auto_574461 ?auto_574463 ) ) ( not ( = ?auto_574461 ?auto_574464 ) ) ( not ( = ?auto_574461 ?auto_574465 ) ) ( not ( = ?auto_574461 ?auto_574466 ) ) ( not ( = ?auto_574461 ?auto_574467 ) ) ( not ( = ?auto_574461 ?auto_574468 ) ) ( not ( = ?auto_574461 ?auto_574469 ) ) ( not ( = ?auto_574461 ?auto_574470 ) ) ( not ( = ?auto_574461 ?auto_574471 ) ) ( not ( = ?auto_574462 ?auto_574463 ) ) ( not ( = ?auto_574462 ?auto_574464 ) ) ( not ( = ?auto_574462 ?auto_574465 ) ) ( not ( = ?auto_574462 ?auto_574466 ) ) ( not ( = ?auto_574462 ?auto_574467 ) ) ( not ( = ?auto_574462 ?auto_574468 ) ) ( not ( = ?auto_574462 ?auto_574469 ) ) ( not ( = ?auto_574462 ?auto_574470 ) ) ( not ( = ?auto_574462 ?auto_574471 ) ) ( not ( = ?auto_574463 ?auto_574464 ) ) ( not ( = ?auto_574463 ?auto_574465 ) ) ( not ( = ?auto_574463 ?auto_574466 ) ) ( not ( = ?auto_574463 ?auto_574467 ) ) ( not ( = ?auto_574463 ?auto_574468 ) ) ( not ( = ?auto_574463 ?auto_574469 ) ) ( not ( = ?auto_574463 ?auto_574470 ) ) ( not ( = ?auto_574463 ?auto_574471 ) ) ( not ( = ?auto_574464 ?auto_574465 ) ) ( not ( = ?auto_574464 ?auto_574466 ) ) ( not ( = ?auto_574464 ?auto_574467 ) ) ( not ( = ?auto_574464 ?auto_574468 ) ) ( not ( = ?auto_574464 ?auto_574469 ) ) ( not ( = ?auto_574464 ?auto_574470 ) ) ( not ( = ?auto_574464 ?auto_574471 ) ) ( not ( = ?auto_574465 ?auto_574466 ) ) ( not ( = ?auto_574465 ?auto_574467 ) ) ( not ( = ?auto_574465 ?auto_574468 ) ) ( not ( = ?auto_574465 ?auto_574469 ) ) ( not ( = ?auto_574465 ?auto_574470 ) ) ( not ( = ?auto_574465 ?auto_574471 ) ) ( not ( = ?auto_574466 ?auto_574467 ) ) ( not ( = ?auto_574466 ?auto_574468 ) ) ( not ( = ?auto_574466 ?auto_574469 ) ) ( not ( = ?auto_574466 ?auto_574470 ) ) ( not ( = ?auto_574466 ?auto_574471 ) ) ( not ( = ?auto_574467 ?auto_574468 ) ) ( not ( = ?auto_574467 ?auto_574469 ) ) ( not ( = ?auto_574467 ?auto_574470 ) ) ( not ( = ?auto_574467 ?auto_574471 ) ) ( not ( = ?auto_574468 ?auto_574469 ) ) ( not ( = ?auto_574468 ?auto_574470 ) ) ( not ( = ?auto_574468 ?auto_574471 ) ) ( not ( = ?auto_574469 ?auto_574470 ) ) ( not ( = ?auto_574469 ?auto_574471 ) ) ( not ( = ?auto_574470 ?auto_574471 ) ) ( ON ?auto_574469 ?auto_574470 ) ( CLEAR ?auto_574467 ) ( ON ?auto_574468 ?auto_574469 ) ( CLEAR ?auto_574468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_574458 ?auto_574459 ?auto_574460 ?auto_574461 ?auto_574462 ?auto_574463 ?auto_574464 ?auto_574465 ?auto_574466 ?auto_574467 ?auto_574468 )
      ( MAKE-13PILE ?auto_574458 ?auto_574459 ?auto_574460 ?auto_574461 ?auto_574462 ?auto_574463 ?auto_574464 ?auto_574465 ?auto_574466 ?auto_574467 ?auto_574468 ?auto_574469 ?auto_574470 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_574512 - BLOCK
      ?auto_574513 - BLOCK
      ?auto_574514 - BLOCK
      ?auto_574515 - BLOCK
      ?auto_574516 - BLOCK
      ?auto_574517 - BLOCK
      ?auto_574518 - BLOCK
      ?auto_574519 - BLOCK
      ?auto_574520 - BLOCK
      ?auto_574521 - BLOCK
      ?auto_574522 - BLOCK
      ?auto_574523 - BLOCK
      ?auto_574524 - BLOCK
    )
    :vars
    (
      ?auto_574525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_574524 ?auto_574525 ) ( ON-TABLE ?auto_574512 ) ( ON ?auto_574513 ?auto_574512 ) ( ON ?auto_574514 ?auto_574513 ) ( ON ?auto_574515 ?auto_574514 ) ( ON ?auto_574516 ?auto_574515 ) ( ON ?auto_574517 ?auto_574516 ) ( ON ?auto_574518 ?auto_574517 ) ( ON ?auto_574519 ?auto_574518 ) ( ON ?auto_574520 ?auto_574519 ) ( not ( = ?auto_574512 ?auto_574513 ) ) ( not ( = ?auto_574512 ?auto_574514 ) ) ( not ( = ?auto_574512 ?auto_574515 ) ) ( not ( = ?auto_574512 ?auto_574516 ) ) ( not ( = ?auto_574512 ?auto_574517 ) ) ( not ( = ?auto_574512 ?auto_574518 ) ) ( not ( = ?auto_574512 ?auto_574519 ) ) ( not ( = ?auto_574512 ?auto_574520 ) ) ( not ( = ?auto_574512 ?auto_574521 ) ) ( not ( = ?auto_574512 ?auto_574522 ) ) ( not ( = ?auto_574512 ?auto_574523 ) ) ( not ( = ?auto_574512 ?auto_574524 ) ) ( not ( = ?auto_574512 ?auto_574525 ) ) ( not ( = ?auto_574513 ?auto_574514 ) ) ( not ( = ?auto_574513 ?auto_574515 ) ) ( not ( = ?auto_574513 ?auto_574516 ) ) ( not ( = ?auto_574513 ?auto_574517 ) ) ( not ( = ?auto_574513 ?auto_574518 ) ) ( not ( = ?auto_574513 ?auto_574519 ) ) ( not ( = ?auto_574513 ?auto_574520 ) ) ( not ( = ?auto_574513 ?auto_574521 ) ) ( not ( = ?auto_574513 ?auto_574522 ) ) ( not ( = ?auto_574513 ?auto_574523 ) ) ( not ( = ?auto_574513 ?auto_574524 ) ) ( not ( = ?auto_574513 ?auto_574525 ) ) ( not ( = ?auto_574514 ?auto_574515 ) ) ( not ( = ?auto_574514 ?auto_574516 ) ) ( not ( = ?auto_574514 ?auto_574517 ) ) ( not ( = ?auto_574514 ?auto_574518 ) ) ( not ( = ?auto_574514 ?auto_574519 ) ) ( not ( = ?auto_574514 ?auto_574520 ) ) ( not ( = ?auto_574514 ?auto_574521 ) ) ( not ( = ?auto_574514 ?auto_574522 ) ) ( not ( = ?auto_574514 ?auto_574523 ) ) ( not ( = ?auto_574514 ?auto_574524 ) ) ( not ( = ?auto_574514 ?auto_574525 ) ) ( not ( = ?auto_574515 ?auto_574516 ) ) ( not ( = ?auto_574515 ?auto_574517 ) ) ( not ( = ?auto_574515 ?auto_574518 ) ) ( not ( = ?auto_574515 ?auto_574519 ) ) ( not ( = ?auto_574515 ?auto_574520 ) ) ( not ( = ?auto_574515 ?auto_574521 ) ) ( not ( = ?auto_574515 ?auto_574522 ) ) ( not ( = ?auto_574515 ?auto_574523 ) ) ( not ( = ?auto_574515 ?auto_574524 ) ) ( not ( = ?auto_574515 ?auto_574525 ) ) ( not ( = ?auto_574516 ?auto_574517 ) ) ( not ( = ?auto_574516 ?auto_574518 ) ) ( not ( = ?auto_574516 ?auto_574519 ) ) ( not ( = ?auto_574516 ?auto_574520 ) ) ( not ( = ?auto_574516 ?auto_574521 ) ) ( not ( = ?auto_574516 ?auto_574522 ) ) ( not ( = ?auto_574516 ?auto_574523 ) ) ( not ( = ?auto_574516 ?auto_574524 ) ) ( not ( = ?auto_574516 ?auto_574525 ) ) ( not ( = ?auto_574517 ?auto_574518 ) ) ( not ( = ?auto_574517 ?auto_574519 ) ) ( not ( = ?auto_574517 ?auto_574520 ) ) ( not ( = ?auto_574517 ?auto_574521 ) ) ( not ( = ?auto_574517 ?auto_574522 ) ) ( not ( = ?auto_574517 ?auto_574523 ) ) ( not ( = ?auto_574517 ?auto_574524 ) ) ( not ( = ?auto_574517 ?auto_574525 ) ) ( not ( = ?auto_574518 ?auto_574519 ) ) ( not ( = ?auto_574518 ?auto_574520 ) ) ( not ( = ?auto_574518 ?auto_574521 ) ) ( not ( = ?auto_574518 ?auto_574522 ) ) ( not ( = ?auto_574518 ?auto_574523 ) ) ( not ( = ?auto_574518 ?auto_574524 ) ) ( not ( = ?auto_574518 ?auto_574525 ) ) ( not ( = ?auto_574519 ?auto_574520 ) ) ( not ( = ?auto_574519 ?auto_574521 ) ) ( not ( = ?auto_574519 ?auto_574522 ) ) ( not ( = ?auto_574519 ?auto_574523 ) ) ( not ( = ?auto_574519 ?auto_574524 ) ) ( not ( = ?auto_574519 ?auto_574525 ) ) ( not ( = ?auto_574520 ?auto_574521 ) ) ( not ( = ?auto_574520 ?auto_574522 ) ) ( not ( = ?auto_574520 ?auto_574523 ) ) ( not ( = ?auto_574520 ?auto_574524 ) ) ( not ( = ?auto_574520 ?auto_574525 ) ) ( not ( = ?auto_574521 ?auto_574522 ) ) ( not ( = ?auto_574521 ?auto_574523 ) ) ( not ( = ?auto_574521 ?auto_574524 ) ) ( not ( = ?auto_574521 ?auto_574525 ) ) ( not ( = ?auto_574522 ?auto_574523 ) ) ( not ( = ?auto_574522 ?auto_574524 ) ) ( not ( = ?auto_574522 ?auto_574525 ) ) ( not ( = ?auto_574523 ?auto_574524 ) ) ( not ( = ?auto_574523 ?auto_574525 ) ) ( not ( = ?auto_574524 ?auto_574525 ) ) ( ON ?auto_574523 ?auto_574524 ) ( ON ?auto_574522 ?auto_574523 ) ( CLEAR ?auto_574520 ) ( ON ?auto_574521 ?auto_574522 ) ( CLEAR ?auto_574521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_574512 ?auto_574513 ?auto_574514 ?auto_574515 ?auto_574516 ?auto_574517 ?auto_574518 ?auto_574519 ?auto_574520 ?auto_574521 )
      ( MAKE-13PILE ?auto_574512 ?auto_574513 ?auto_574514 ?auto_574515 ?auto_574516 ?auto_574517 ?auto_574518 ?auto_574519 ?auto_574520 ?auto_574521 ?auto_574522 ?auto_574523 ?auto_574524 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_574566 - BLOCK
      ?auto_574567 - BLOCK
      ?auto_574568 - BLOCK
      ?auto_574569 - BLOCK
      ?auto_574570 - BLOCK
      ?auto_574571 - BLOCK
      ?auto_574572 - BLOCK
      ?auto_574573 - BLOCK
      ?auto_574574 - BLOCK
      ?auto_574575 - BLOCK
      ?auto_574576 - BLOCK
      ?auto_574577 - BLOCK
      ?auto_574578 - BLOCK
    )
    :vars
    (
      ?auto_574579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_574578 ?auto_574579 ) ( ON-TABLE ?auto_574566 ) ( ON ?auto_574567 ?auto_574566 ) ( ON ?auto_574568 ?auto_574567 ) ( ON ?auto_574569 ?auto_574568 ) ( ON ?auto_574570 ?auto_574569 ) ( ON ?auto_574571 ?auto_574570 ) ( ON ?auto_574572 ?auto_574571 ) ( ON ?auto_574573 ?auto_574572 ) ( not ( = ?auto_574566 ?auto_574567 ) ) ( not ( = ?auto_574566 ?auto_574568 ) ) ( not ( = ?auto_574566 ?auto_574569 ) ) ( not ( = ?auto_574566 ?auto_574570 ) ) ( not ( = ?auto_574566 ?auto_574571 ) ) ( not ( = ?auto_574566 ?auto_574572 ) ) ( not ( = ?auto_574566 ?auto_574573 ) ) ( not ( = ?auto_574566 ?auto_574574 ) ) ( not ( = ?auto_574566 ?auto_574575 ) ) ( not ( = ?auto_574566 ?auto_574576 ) ) ( not ( = ?auto_574566 ?auto_574577 ) ) ( not ( = ?auto_574566 ?auto_574578 ) ) ( not ( = ?auto_574566 ?auto_574579 ) ) ( not ( = ?auto_574567 ?auto_574568 ) ) ( not ( = ?auto_574567 ?auto_574569 ) ) ( not ( = ?auto_574567 ?auto_574570 ) ) ( not ( = ?auto_574567 ?auto_574571 ) ) ( not ( = ?auto_574567 ?auto_574572 ) ) ( not ( = ?auto_574567 ?auto_574573 ) ) ( not ( = ?auto_574567 ?auto_574574 ) ) ( not ( = ?auto_574567 ?auto_574575 ) ) ( not ( = ?auto_574567 ?auto_574576 ) ) ( not ( = ?auto_574567 ?auto_574577 ) ) ( not ( = ?auto_574567 ?auto_574578 ) ) ( not ( = ?auto_574567 ?auto_574579 ) ) ( not ( = ?auto_574568 ?auto_574569 ) ) ( not ( = ?auto_574568 ?auto_574570 ) ) ( not ( = ?auto_574568 ?auto_574571 ) ) ( not ( = ?auto_574568 ?auto_574572 ) ) ( not ( = ?auto_574568 ?auto_574573 ) ) ( not ( = ?auto_574568 ?auto_574574 ) ) ( not ( = ?auto_574568 ?auto_574575 ) ) ( not ( = ?auto_574568 ?auto_574576 ) ) ( not ( = ?auto_574568 ?auto_574577 ) ) ( not ( = ?auto_574568 ?auto_574578 ) ) ( not ( = ?auto_574568 ?auto_574579 ) ) ( not ( = ?auto_574569 ?auto_574570 ) ) ( not ( = ?auto_574569 ?auto_574571 ) ) ( not ( = ?auto_574569 ?auto_574572 ) ) ( not ( = ?auto_574569 ?auto_574573 ) ) ( not ( = ?auto_574569 ?auto_574574 ) ) ( not ( = ?auto_574569 ?auto_574575 ) ) ( not ( = ?auto_574569 ?auto_574576 ) ) ( not ( = ?auto_574569 ?auto_574577 ) ) ( not ( = ?auto_574569 ?auto_574578 ) ) ( not ( = ?auto_574569 ?auto_574579 ) ) ( not ( = ?auto_574570 ?auto_574571 ) ) ( not ( = ?auto_574570 ?auto_574572 ) ) ( not ( = ?auto_574570 ?auto_574573 ) ) ( not ( = ?auto_574570 ?auto_574574 ) ) ( not ( = ?auto_574570 ?auto_574575 ) ) ( not ( = ?auto_574570 ?auto_574576 ) ) ( not ( = ?auto_574570 ?auto_574577 ) ) ( not ( = ?auto_574570 ?auto_574578 ) ) ( not ( = ?auto_574570 ?auto_574579 ) ) ( not ( = ?auto_574571 ?auto_574572 ) ) ( not ( = ?auto_574571 ?auto_574573 ) ) ( not ( = ?auto_574571 ?auto_574574 ) ) ( not ( = ?auto_574571 ?auto_574575 ) ) ( not ( = ?auto_574571 ?auto_574576 ) ) ( not ( = ?auto_574571 ?auto_574577 ) ) ( not ( = ?auto_574571 ?auto_574578 ) ) ( not ( = ?auto_574571 ?auto_574579 ) ) ( not ( = ?auto_574572 ?auto_574573 ) ) ( not ( = ?auto_574572 ?auto_574574 ) ) ( not ( = ?auto_574572 ?auto_574575 ) ) ( not ( = ?auto_574572 ?auto_574576 ) ) ( not ( = ?auto_574572 ?auto_574577 ) ) ( not ( = ?auto_574572 ?auto_574578 ) ) ( not ( = ?auto_574572 ?auto_574579 ) ) ( not ( = ?auto_574573 ?auto_574574 ) ) ( not ( = ?auto_574573 ?auto_574575 ) ) ( not ( = ?auto_574573 ?auto_574576 ) ) ( not ( = ?auto_574573 ?auto_574577 ) ) ( not ( = ?auto_574573 ?auto_574578 ) ) ( not ( = ?auto_574573 ?auto_574579 ) ) ( not ( = ?auto_574574 ?auto_574575 ) ) ( not ( = ?auto_574574 ?auto_574576 ) ) ( not ( = ?auto_574574 ?auto_574577 ) ) ( not ( = ?auto_574574 ?auto_574578 ) ) ( not ( = ?auto_574574 ?auto_574579 ) ) ( not ( = ?auto_574575 ?auto_574576 ) ) ( not ( = ?auto_574575 ?auto_574577 ) ) ( not ( = ?auto_574575 ?auto_574578 ) ) ( not ( = ?auto_574575 ?auto_574579 ) ) ( not ( = ?auto_574576 ?auto_574577 ) ) ( not ( = ?auto_574576 ?auto_574578 ) ) ( not ( = ?auto_574576 ?auto_574579 ) ) ( not ( = ?auto_574577 ?auto_574578 ) ) ( not ( = ?auto_574577 ?auto_574579 ) ) ( not ( = ?auto_574578 ?auto_574579 ) ) ( ON ?auto_574577 ?auto_574578 ) ( ON ?auto_574576 ?auto_574577 ) ( ON ?auto_574575 ?auto_574576 ) ( CLEAR ?auto_574573 ) ( ON ?auto_574574 ?auto_574575 ) ( CLEAR ?auto_574574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_574566 ?auto_574567 ?auto_574568 ?auto_574569 ?auto_574570 ?auto_574571 ?auto_574572 ?auto_574573 ?auto_574574 )
      ( MAKE-13PILE ?auto_574566 ?auto_574567 ?auto_574568 ?auto_574569 ?auto_574570 ?auto_574571 ?auto_574572 ?auto_574573 ?auto_574574 ?auto_574575 ?auto_574576 ?auto_574577 ?auto_574578 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_574620 - BLOCK
      ?auto_574621 - BLOCK
      ?auto_574622 - BLOCK
      ?auto_574623 - BLOCK
      ?auto_574624 - BLOCK
      ?auto_574625 - BLOCK
      ?auto_574626 - BLOCK
      ?auto_574627 - BLOCK
      ?auto_574628 - BLOCK
      ?auto_574629 - BLOCK
      ?auto_574630 - BLOCK
      ?auto_574631 - BLOCK
      ?auto_574632 - BLOCK
    )
    :vars
    (
      ?auto_574633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_574632 ?auto_574633 ) ( ON-TABLE ?auto_574620 ) ( ON ?auto_574621 ?auto_574620 ) ( ON ?auto_574622 ?auto_574621 ) ( ON ?auto_574623 ?auto_574622 ) ( ON ?auto_574624 ?auto_574623 ) ( ON ?auto_574625 ?auto_574624 ) ( ON ?auto_574626 ?auto_574625 ) ( not ( = ?auto_574620 ?auto_574621 ) ) ( not ( = ?auto_574620 ?auto_574622 ) ) ( not ( = ?auto_574620 ?auto_574623 ) ) ( not ( = ?auto_574620 ?auto_574624 ) ) ( not ( = ?auto_574620 ?auto_574625 ) ) ( not ( = ?auto_574620 ?auto_574626 ) ) ( not ( = ?auto_574620 ?auto_574627 ) ) ( not ( = ?auto_574620 ?auto_574628 ) ) ( not ( = ?auto_574620 ?auto_574629 ) ) ( not ( = ?auto_574620 ?auto_574630 ) ) ( not ( = ?auto_574620 ?auto_574631 ) ) ( not ( = ?auto_574620 ?auto_574632 ) ) ( not ( = ?auto_574620 ?auto_574633 ) ) ( not ( = ?auto_574621 ?auto_574622 ) ) ( not ( = ?auto_574621 ?auto_574623 ) ) ( not ( = ?auto_574621 ?auto_574624 ) ) ( not ( = ?auto_574621 ?auto_574625 ) ) ( not ( = ?auto_574621 ?auto_574626 ) ) ( not ( = ?auto_574621 ?auto_574627 ) ) ( not ( = ?auto_574621 ?auto_574628 ) ) ( not ( = ?auto_574621 ?auto_574629 ) ) ( not ( = ?auto_574621 ?auto_574630 ) ) ( not ( = ?auto_574621 ?auto_574631 ) ) ( not ( = ?auto_574621 ?auto_574632 ) ) ( not ( = ?auto_574621 ?auto_574633 ) ) ( not ( = ?auto_574622 ?auto_574623 ) ) ( not ( = ?auto_574622 ?auto_574624 ) ) ( not ( = ?auto_574622 ?auto_574625 ) ) ( not ( = ?auto_574622 ?auto_574626 ) ) ( not ( = ?auto_574622 ?auto_574627 ) ) ( not ( = ?auto_574622 ?auto_574628 ) ) ( not ( = ?auto_574622 ?auto_574629 ) ) ( not ( = ?auto_574622 ?auto_574630 ) ) ( not ( = ?auto_574622 ?auto_574631 ) ) ( not ( = ?auto_574622 ?auto_574632 ) ) ( not ( = ?auto_574622 ?auto_574633 ) ) ( not ( = ?auto_574623 ?auto_574624 ) ) ( not ( = ?auto_574623 ?auto_574625 ) ) ( not ( = ?auto_574623 ?auto_574626 ) ) ( not ( = ?auto_574623 ?auto_574627 ) ) ( not ( = ?auto_574623 ?auto_574628 ) ) ( not ( = ?auto_574623 ?auto_574629 ) ) ( not ( = ?auto_574623 ?auto_574630 ) ) ( not ( = ?auto_574623 ?auto_574631 ) ) ( not ( = ?auto_574623 ?auto_574632 ) ) ( not ( = ?auto_574623 ?auto_574633 ) ) ( not ( = ?auto_574624 ?auto_574625 ) ) ( not ( = ?auto_574624 ?auto_574626 ) ) ( not ( = ?auto_574624 ?auto_574627 ) ) ( not ( = ?auto_574624 ?auto_574628 ) ) ( not ( = ?auto_574624 ?auto_574629 ) ) ( not ( = ?auto_574624 ?auto_574630 ) ) ( not ( = ?auto_574624 ?auto_574631 ) ) ( not ( = ?auto_574624 ?auto_574632 ) ) ( not ( = ?auto_574624 ?auto_574633 ) ) ( not ( = ?auto_574625 ?auto_574626 ) ) ( not ( = ?auto_574625 ?auto_574627 ) ) ( not ( = ?auto_574625 ?auto_574628 ) ) ( not ( = ?auto_574625 ?auto_574629 ) ) ( not ( = ?auto_574625 ?auto_574630 ) ) ( not ( = ?auto_574625 ?auto_574631 ) ) ( not ( = ?auto_574625 ?auto_574632 ) ) ( not ( = ?auto_574625 ?auto_574633 ) ) ( not ( = ?auto_574626 ?auto_574627 ) ) ( not ( = ?auto_574626 ?auto_574628 ) ) ( not ( = ?auto_574626 ?auto_574629 ) ) ( not ( = ?auto_574626 ?auto_574630 ) ) ( not ( = ?auto_574626 ?auto_574631 ) ) ( not ( = ?auto_574626 ?auto_574632 ) ) ( not ( = ?auto_574626 ?auto_574633 ) ) ( not ( = ?auto_574627 ?auto_574628 ) ) ( not ( = ?auto_574627 ?auto_574629 ) ) ( not ( = ?auto_574627 ?auto_574630 ) ) ( not ( = ?auto_574627 ?auto_574631 ) ) ( not ( = ?auto_574627 ?auto_574632 ) ) ( not ( = ?auto_574627 ?auto_574633 ) ) ( not ( = ?auto_574628 ?auto_574629 ) ) ( not ( = ?auto_574628 ?auto_574630 ) ) ( not ( = ?auto_574628 ?auto_574631 ) ) ( not ( = ?auto_574628 ?auto_574632 ) ) ( not ( = ?auto_574628 ?auto_574633 ) ) ( not ( = ?auto_574629 ?auto_574630 ) ) ( not ( = ?auto_574629 ?auto_574631 ) ) ( not ( = ?auto_574629 ?auto_574632 ) ) ( not ( = ?auto_574629 ?auto_574633 ) ) ( not ( = ?auto_574630 ?auto_574631 ) ) ( not ( = ?auto_574630 ?auto_574632 ) ) ( not ( = ?auto_574630 ?auto_574633 ) ) ( not ( = ?auto_574631 ?auto_574632 ) ) ( not ( = ?auto_574631 ?auto_574633 ) ) ( not ( = ?auto_574632 ?auto_574633 ) ) ( ON ?auto_574631 ?auto_574632 ) ( ON ?auto_574630 ?auto_574631 ) ( ON ?auto_574629 ?auto_574630 ) ( ON ?auto_574628 ?auto_574629 ) ( CLEAR ?auto_574626 ) ( ON ?auto_574627 ?auto_574628 ) ( CLEAR ?auto_574627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_574620 ?auto_574621 ?auto_574622 ?auto_574623 ?auto_574624 ?auto_574625 ?auto_574626 ?auto_574627 )
      ( MAKE-13PILE ?auto_574620 ?auto_574621 ?auto_574622 ?auto_574623 ?auto_574624 ?auto_574625 ?auto_574626 ?auto_574627 ?auto_574628 ?auto_574629 ?auto_574630 ?auto_574631 ?auto_574632 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_574674 - BLOCK
      ?auto_574675 - BLOCK
      ?auto_574676 - BLOCK
      ?auto_574677 - BLOCK
      ?auto_574678 - BLOCK
      ?auto_574679 - BLOCK
      ?auto_574680 - BLOCK
      ?auto_574681 - BLOCK
      ?auto_574682 - BLOCK
      ?auto_574683 - BLOCK
      ?auto_574684 - BLOCK
      ?auto_574685 - BLOCK
      ?auto_574686 - BLOCK
    )
    :vars
    (
      ?auto_574687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_574686 ?auto_574687 ) ( ON-TABLE ?auto_574674 ) ( ON ?auto_574675 ?auto_574674 ) ( ON ?auto_574676 ?auto_574675 ) ( ON ?auto_574677 ?auto_574676 ) ( ON ?auto_574678 ?auto_574677 ) ( ON ?auto_574679 ?auto_574678 ) ( not ( = ?auto_574674 ?auto_574675 ) ) ( not ( = ?auto_574674 ?auto_574676 ) ) ( not ( = ?auto_574674 ?auto_574677 ) ) ( not ( = ?auto_574674 ?auto_574678 ) ) ( not ( = ?auto_574674 ?auto_574679 ) ) ( not ( = ?auto_574674 ?auto_574680 ) ) ( not ( = ?auto_574674 ?auto_574681 ) ) ( not ( = ?auto_574674 ?auto_574682 ) ) ( not ( = ?auto_574674 ?auto_574683 ) ) ( not ( = ?auto_574674 ?auto_574684 ) ) ( not ( = ?auto_574674 ?auto_574685 ) ) ( not ( = ?auto_574674 ?auto_574686 ) ) ( not ( = ?auto_574674 ?auto_574687 ) ) ( not ( = ?auto_574675 ?auto_574676 ) ) ( not ( = ?auto_574675 ?auto_574677 ) ) ( not ( = ?auto_574675 ?auto_574678 ) ) ( not ( = ?auto_574675 ?auto_574679 ) ) ( not ( = ?auto_574675 ?auto_574680 ) ) ( not ( = ?auto_574675 ?auto_574681 ) ) ( not ( = ?auto_574675 ?auto_574682 ) ) ( not ( = ?auto_574675 ?auto_574683 ) ) ( not ( = ?auto_574675 ?auto_574684 ) ) ( not ( = ?auto_574675 ?auto_574685 ) ) ( not ( = ?auto_574675 ?auto_574686 ) ) ( not ( = ?auto_574675 ?auto_574687 ) ) ( not ( = ?auto_574676 ?auto_574677 ) ) ( not ( = ?auto_574676 ?auto_574678 ) ) ( not ( = ?auto_574676 ?auto_574679 ) ) ( not ( = ?auto_574676 ?auto_574680 ) ) ( not ( = ?auto_574676 ?auto_574681 ) ) ( not ( = ?auto_574676 ?auto_574682 ) ) ( not ( = ?auto_574676 ?auto_574683 ) ) ( not ( = ?auto_574676 ?auto_574684 ) ) ( not ( = ?auto_574676 ?auto_574685 ) ) ( not ( = ?auto_574676 ?auto_574686 ) ) ( not ( = ?auto_574676 ?auto_574687 ) ) ( not ( = ?auto_574677 ?auto_574678 ) ) ( not ( = ?auto_574677 ?auto_574679 ) ) ( not ( = ?auto_574677 ?auto_574680 ) ) ( not ( = ?auto_574677 ?auto_574681 ) ) ( not ( = ?auto_574677 ?auto_574682 ) ) ( not ( = ?auto_574677 ?auto_574683 ) ) ( not ( = ?auto_574677 ?auto_574684 ) ) ( not ( = ?auto_574677 ?auto_574685 ) ) ( not ( = ?auto_574677 ?auto_574686 ) ) ( not ( = ?auto_574677 ?auto_574687 ) ) ( not ( = ?auto_574678 ?auto_574679 ) ) ( not ( = ?auto_574678 ?auto_574680 ) ) ( not ( = ?auto_574678 ?auto_574681 ) ) ( not ( = ?auto_574678 ?auto_574682 ) ) ( not ( = ?auto_574678 ?auto_574683 ) ) ( not ( = ?auto_574678 ?auto_574684 ) ) ( not ( = ?auto_574678 ?auto_574685 ) ) ( not ( = ?auto_574678 ?auto_574686 ) ) ( not ( = ?auto_574678 ?auto_574687 ) ) ( not ( = ?auto_574679 ?auto_574680 ) ) ( not ( = ?auto_574679 ?auto_574681 ) ) ( not ( = ?auto_574679 ?auto_574682 ) ) ( not ( = ?auto_574679 ?auto_574683 ) ) ( not ( = ?auto_574679 ?auto_574684 ) ) ( not ( = ?auto_574679 ?auto_574685 ) ) ( not ( = ?auto_574679 ?auto_574686 ) ) ( not ( = ?auto_574679 ?auto_574687 ) ) ( not ( = ?auto_574680 ?auto_574681 ) ) ( not ( = ?auto_574680 ?auto_574682 ) ) ( not ( = ?auto_574680 ?auto_574683 ) ) ( not ( = ?auto_574680 ?auto_574684 ) ) ( not ( = ?auto_574680 ?auto_574685 ) ) ( not ( = ?auto_574680 ?auto_574686 ) ) ( not ( = ?auto_574680 ?auto_574687 ) ) ( not ( = ?auto_574681 ?auto_574682 ) ) ( not ( = ?auto_574681 ?auto_574683 ) ) ( not ( = ?auto_574681 ?auto_574684 ) ) ( not ( = ?auto_574681 ?auto_574685 ) ) ( not ( = ?auto_574681 ?auto_574686 ) ) ( not ( = ?auto_574681 ?auto_574687 ) ) ( not ( = ?auto_574682 ?auto_574683 ) ) ( not ( = ?auto_574682 ?auto_574684 ) ) ( not ( = ?auto_574682 ?auto_574685 ) ) ( not ( = ?auto_574682 ?auto_574686 ) ) ( not ( = ?auto_574682 ?auto_574687 ) ) ( not ( = ?auto_574683 ?auto_574684 ) ) ( not ( = ?auto_574683 ?auto_574685 ) ) ( not ( = ?auto_574683 ?auto_574686 ) ) ( not ( = ?auto_574683 ?auto_574687 ) ) ( not ( = ?auto_574684 ?auto_574685 ) ) ( not ( = ?auto_574684 ?auto_574686 ) ) ( not ( = ?auto_574684 ?auto_574687 ) ) ( not ( = ?auto_574685 ?auto_574686 ) ) ( not ( = ?auto_574685 ?auto_574687 ) ) ( not ( = ?auto_574686 ?auto_574687 ) ) ( ON ?auto_574685 ?auto_574686 ) ( ON ?auto_574684 ?auto_574685 ) ( ON ?auto_574683 ?auto_574684 ) ( ON ?auto_574682 ?auto_574683 ) ( ON ?auto_574681 ?auto_574682 ) ( CLEAR ?auto_574679 ) ( ON ?auto_574680 ?auto_574681 ) ( CLEAR ?auto_574680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_574674 ?auto_574675 ?auto_574676 ?auto_574677 ?auto_574678 ?auto_574679 ?auto_574680 )
      ( MAKE-13PILE ?auto_574674 ?auto_574675 ?auto_574676 ?auto_574677 ?auto_574678 ?auto_574679 ?auto_574680 ?auto_574681 ?auto_574682 ?auto_574683 ?auto_574684 ?auto_574685 ?auto_574686 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_574728 - BLOCK
      ?auto_574729 - BLOCK
      ?auto_574730 - BLOCK
      ?auto_574731 - BLOCK
      ?auto_574732 - BLOCK
      ?auto_574733 - BLOCK
      ?auto_574734 - BLOCK
      ?auto_574735 - BLOCK
      ?auto_574736 - BLOCK
      ?auto_574737 - BLOCK
      ?auto_574738 - BLOCK
      ?auto_574739 - BLOCK
      ?auto_574740 - BLOCK
    )
    :vars
    (
      ?auto_574741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_574740 ?auto_574741 ) ( ON-TABLE ?auto_574728 ) ( ON ?auto_574729 ?auto_574728 ) ( ON ?auto_574730 ?auto_574729 ) ( ON ?auto_574731 ?auto_574730 ) ( ON ?auto_574732 ?auto_574731 ) ( not ( = ?auto_574728 ?auto_574729 ) ) ( not ( = ?auto_574728 ?auto_574730 ) ) ( not ( = ?auto_574728 ?auto_574731 ) ) ( not ( = ?auto_574728 ?auto_574732 ) ) ( not ( = ?auto_574728 ?auto_574733 ) ) ( not ( = ?auto_574728 ?auto_574734 ) ) ( not ( = ?auto_574728 ?auto_574735 ) ) ( not ( = ?auto_574728 ?auto_574736 ) ) ( not ( = ?auto_574728 ?auto_574737 ) ) ( not ( = ?auto_574728 ?auto_574738 ) ) ( not ( = ?auto_574728 ?auto_574739 ) ) ( not ( = ?auto_574728 ?auto_574740 ) ) ( not ( = ?auto_574728 ?auto_574741 ) ) ( not ( = ?auto_574729 ?auto_574730 ) ) ( not ( = ?auto_574729 ?auto_574731 ) ) ( not ( = ?auto_574729 ?auto_574732 ) ) ( not ( = ?auto_574729 ?auto_574733 ) ) ( not ( = ?auto_574729 ?auto_574734 ) ) ( not ( = ?auto_574729 ?auto_574735 ) ) ( not ( = ?auto_574729 ?auto_574736 ) ) ( not ( = ?auto_574729 ?auto_574737 ) ) ( not ( = ?auto_574729 ?auto_574738 ) ) ( not ( = ?auto_574729 ?auto_574739 ) ) ( not ( = ?auto_574729 ?auto_574740 ) ) ( not ( = ?auto_574729 ?auto_574741 ) ) ( not ( = ?auto_574730 ?auto_574731 ) ) ( not ( = ?auto_574730 ?auto_574732 ) ) ( not ( = ?auto_574730 ?auto_574733 ) ) ( not ( = ?auto_574730 ?auto_574734 ) ) ( not ( = ?auto_574730 ?auto_574735 ) ) ( not ( = ?auto_574730 ?auto_574736 ) ) ( not ( = ?auto_574730 ?auto_574737 ) ) ( not ( = ?auto_574730 ?auto_574738 ) ) ( not ( = ?auto_574730 ?auto_574739 ) ) ( not ( = ?auto_574730 ?auto_574740 ) ) ( not ( = ?auto_574730 ?auto_574741 ) ) ( not ( = ?auto_574731 ?auto_574732 ) ) ( not ( = ?auto_574731 ?auto_574733 ) ) ( not ( = ?auto_574731 ?auto_574734 ) ) ( not ( = ?auto_574731 ?auto_574735 ) ) ( not ( = ?auto_574731 ?auto_574736 ) ) ( not ( = ?auto_574731 ?auto_574737 ) ) ( not ( = ?auto_574731 ?auto_574738 ) ) ( not ( = ?auto_574731 ?auto_574739 ) ) ( not ( = ?auto_574731 ?auto_574740 ) ) ( not ( = ?auto_574731 ?auto_574741 ) ) ( not ( = ?auto_574732 ?auto_574733 ) ) ( not ( = ?auto_574732 ?auto_574734 ) ) ( not ( = ?auto_574732 ?auto_574735 ) ) ( not ( = ?auto_574732 ?auto_574736 ) ) ( not ( = ?auto_574732 ?auto_574737 ) ) ( not ( = ?auto_574732 ?auto_574738 ) ) ( not ( = ?auto_574732 ?auto_574739 ) ) ( not ( = ?auto_574732 ?auto_574740 ) ) ( not ( = ?auto_574732 ?auto_574741 ) ) ( not ( = ?auto_574733 ?auto_574734 ) ) ( not ( = ?auto_574733 ?auto_574735 ) ) ( not ( = ?auto_574733 ?auto_574736 ) ) ( not ( = ?auto_574733 ?auto_574737 ) ) ( not ( = ?auto_574733 ?auto_574738 ) ) ( not ( = ?auto_574733 ?auto_574739 ) ) ( not ( = ?auto_574733 ?auto_574740 ) ) ( not ( = ?auto_574733 ?auto_574741 ) ) ( not ( = ?auto_574734 ?auto_574735 ) ) ( not ( = ?auto_574734 ?auto_574736 ) ) ( not ( = ?auto_574734 ?auto_574737 ) ) ( not ( = ?auto_574734 ?auto_574738 ) ) ( not ( = ?auto_574734 ?auto_574739 ) ) ( not ( = ?auto_574734 ?auto_574740 ) ) ( not ( = ?auto_574734 ?auto_574741 ) ) ( not ( = ?auto_574735 ?auto_574736 ) ) ( not ( = ?auto_574735 ?auto_574737 ) ) ( not ( = ?auto_574735 ?auto_574738 ) ) ( not ( = ?auto_574735 ?auto_574739 ) ) ( not ( = ?auto_574735 ?auto_574740 ) ) ( not ( = ?auto_574735 ?auto_574741 ) ) ( not ( = ?auto_574736 ?auto_574737 ) ) ( not ( = ?auto_574736 ?auto_574738 ) ) ( not ( = ?auto_574736 ?auto_574739 ) ) ( not ( = ?auto_574736 ?auto_574740 ) ) ( not ( = ?auto_574736 ?auto_574741 ) ) ( not ( = ?auto_574737 ?auto_574738 ) ) ( not ( = ?auto_574737 ?auto_574739 ) ) ( not ( = ?auto_574737 ?auto_574740 ) ) ( not ( = ?auto_574737 ?auto_574741 ) ) ( not ( = ?auto_574738 ?auto_574739 ) ) ( not ( = ?auto_574738 ?auto_574740 ) ) ( not ( = ?auto_574738 ?auto_574741 ) ) ( not ( = ?auto_574739 ?auto_574740 ) ) ( not ( = ?auto_574739 ?auto_574741 ) ) ( not ( = ?auto_574740 ?auto_574741 ) ) ( ON ?auto_574739 ?auto_574740 ) ( ON ?auto_574738 ?auto_574739 ) ( ON ?auto_574737 ?auto_574738 ) ( ON ?auto_574736 ?auto_574737 ) ( ON ?auto_574735 ?auto_574736 ) ( ON ?auto_574734 ?auto_574735 ) ( CLEAR ?auto_574732 ) ( ON ?auto_574733 ?auto_574734 ) ( CLEAR ?auto_574733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_574728 ?auto_574729 ?auto_574730 ?auto_574731 ?auto_574732 ?auto_574733 )
      ( MAKE-13PILE ?auto_574728 ?auto_574729 ?auto_574730 ?auto_574731 ?auto_574732 ?auto_574733 ?auto_574734 ?auto_574735 ?auto_574736 ?auto_574737 ?auto_574738 ?auto_574739 ?auto_574740 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_574782 - BLOCK
      ?auto_574783 - BLOCK
      ?auto_574784 - BLOCK
      ?auto_574785 - BLOCK
      ?auto_574786 - BLOCK
      ?auto_574787 - BLOCK
      ?auto_574788 - BLOCK
      ?auto_574789 - BLOCK
      ?auto_574790 - BLOCK
      ?auto_574791 - BLOCK
      ?auto_574792 - BLOCK
      ?auto_574793 - BLOCK
      ?auto_574794 - BLOCK
    )
    :vars
    (
      ?auto_574795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_574794 ?auto_574795 ) ( ON-TABLE ?auto_574782 ) ( ON ?auto_574783 ?auto_574782 ) ( ON ?auto_574784 ?auto_574783 ) ( ON ?auto_574785 ?auto_574784 ) ( not ( = ?auto_574782 ?auto_574783 ) ) ( not ( = ?auto_574782 ?auto_574784 ) ) ( not ( = ?auto_574782 ?auto_574785 ) ) ( not ( = ?auto_574782 ?auto_574786 ) ) ( not ( = ?auto_574782 ?auto_574787 ) ) ( not ( = ?auto_574782 ?auto_574788 ) ) ( not ( = ?auto_574782 ?auto_574789 ) ) ( not ( = ?auto_574782 ?auto_574790 ) ) ( not ( = ?auto_574782 ?auto_574791 ) ) ( not ( = ?auto_574782 ?auto_574792 ) ) ( not ( = ?auto_574782 ?auto_574793 ) ) ( not ( = ?auto_574782 ?auto_574794 ) ) ( not ( = ?auto_574782 ?auto_574795 ) ) ( not ( = ?auto_574783 ?auto_574784 ) ) ( not ( = ?auto_574783 ?auto_574785 ) ) ( not ( = ?auto_574783 ?auto_574786 ) ) ( not ( = ?auto_574783 ?auto_574787 ) ) ( not ( = ?auto_574783 ?auto_574788 ) ) ( not ( = ?auto_574783 ?auto_574789 ) ) ( not ( = ?auto_574783 ?auto_574790 ) ) ( not ( = ?auto_574783 ?auto_574791 ) ) ( not ( = ?auto_574783 ?auto_574792 ) ) ( not ( = ?auto_574783 ?auto_574793 ) ) ( not ( = ?auto_574783 ?auto_574794 ) ) ( not ( = ?auto_574783 ?auto_574795 ) ) ( not ( = ?auto_574784 ?auto_574785 ) ) ( not ( = ?auto_574784 ?auto_574786 ) ) ( not ( = ?auto_574784 ?auto_574787 ) ) ( not ( = ?auto_574784 ?auto_574788 ) ) ( not ( = ?auto_574784 ?auto_574789 ) ) ( not ( = ?auto_574784 ?auto_574790 ) ) ( not ( = ?auto_574784 ?auto_574791 ) ) ( not ( = ?auto_574784 ?auto_574792 ) ) ( not ( = ?auto_574784 ?auto_574793 ) ) ( not ( = ?auto_574784 ?auto_574794 ) ) ( not ( = ?auto_574784 ?auto_574795 ) ) ( not ( = ?auto_574785 ?auto_574786 ) ) ( not ( = ?auto_574785 ?auto_574787 ) ) ( not ( = ?auto_574785 ?auto_574788 ) ) ( not ( = ?auto_574785 ?auto_574789 ) ) ( not ( = ?auto_574785 ?auto_574790 ) ) ( not ( = ?auto_574785 ?auto_574791 ) ) ( not ( = ?auto_574785 ?auto_574792 ) ) ( not ( = ?auto_574785 ?auto_574793 ) ) ( not ( = ?auto_574785 ?auto_574794 ) ) ( not ( = ?auto_574785 ?auto_574795 ) ) ( not ( = ?auto_574786 ?auto_574787 ) ) ( not ( = ?auto_574786 ?auto_574788 ) ) ( not ( = ?auto_574786 ?auto_574789 ) ) ( not ( = ?auto_574786 ?auto_574790 ) ) ( not ( = ?auto_574786 ?auto_574791 ) ) ( not ( = ?auto_574786 ?auto_574792 ) ) ( not ( = ?auto_574786 ?auto_574793 ) ) ( not ( = ?auto_574786 ?auto_574794 ) ) ( not ( = ?auto_574786 ?auto_574795 ) ) ( not ( = ?auto_574787 ?auto_574788 ) ) ( not ( = ?auto_574787 ?auto_574789 ) ) ( not ( = ?auto_574787 ?auto_574790 ) ) ( not ( = ?auto_574787 ?auto_574791 ) ) ( not ( = ?auto_574787 ?auto_574792 ) ) ( not ( = ?auto_574787 ?auto_574793 ) ) ( not ( = ?auto_574787 ?auto_574794 ) ) ( not ( = ?auto_574787 ?auto_574795 ) ) ( not ( = ?auto_574788 ?auto_574789 ) ) ( not ( = ?auto_574788 ?auto_574790 ) ) ( not ( = ?auto_574788 ?auto_574791 ) ) ( not ( = ?auto_574788 ?auto_574792 ) ) ( not ( = ?auto_574788 ?auto_574793 ) ) ( not ( = ?auto_574788 ?auto_574794 ) ) ( not ( = ?auto_574788 ?auto_574795 ) ) ( not ( = ?auto_574789 ?auto_574790 ) ) ( not ( = ?auto_574789 ?auto_574791 ) ) ( not ( = ?auto_574789 ?auto_574792 ) ) ( not ( = ?auto_574789 ?auto_574793 ) ) ( not ( = ?auto_574789 ?auto_574794 ) ) ( not ( = ?auto_574789 ?auto_574795 ) ) ( not ( = ?auto_574790 ?auto_574791 ) ) ( not ( = ?auto_574790 ?auto_574792 ) ) ( not ( = ?auto_574790 ?auto_574793 ) ) ( not ( = ?auto_574790 ?auto_574794 ) ) ( not ( = ?auto_574790 ?auto_574795 ) ) ( not ( = ?auto_574791 ?auto_574792 ) ) ( not ( = ?auto_574791 ?auto_574793 ) ) ( not ( = ?auto_574791 ?auto_574794 ) ) ( not ( = ?auto_574791 ?auto_574795 ) ) ( not ( = ?auto_574792 ?auto_574793 ) ) ( not ( = ?auto_574792 ?auto_574794 ) ) ( not ( = ?auto_574792 ?auto_574795 ) ) ( not ( = ?auto_574793 ?auto_574794 ) ) ( not ( = ?auto_574793 ?auto_574795 ) ) ( not ( = ?auto_574794 ?auto_574795 ) ) ( ON ?auto_574793 ?auto_574794 ) ( ON ?auto_574792 ?auto_574793 ) ( ON ?auto_574791 ?auto_574792 ) ( ON ?auto_574790 ?auto_574791 ) ( ON ?auto_574789 ?auto_574790 ) ( ON ?auto_574788 ?auto_574789 ) ( ON ?auto_574787 ?auto_574788 ) ( CLEAR ?auto_574785 ) ( ON ?auto_574786 ?auto_574787 ) ( CLEAR ?auto_574786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_574782 ?auto_574783 ?auto_574784 ?auto_574785 ?auto_574786 )
      ( MAKE-13PILE ?auto_574782 ?auto_574783 ?auto_574784 ?auto_574785 ?auto_574786 ?auto_574787 ?auto_574788 ?auto_574789 ?auto_574790 ?auto_574791 ?auto_574792 ?auto_574793 ?auto_574794 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_574836 - BLOCK
      ?auto_574837 - BLOCK
      ?auto_574838 - BLOCK
      ?auto_574839 - BLOCK
      ?auto_574840 - BLOCK
      ?auto_574841 - BLOCK
      ?auto_574842 - BLOCK
      ?auto_574843 - BLOCK
      ?auto_574844 - BLOCK
      ?auto_574845 - BLOCK
      ?auto_574846 - BLOCK
      ?auto_574847 - BLOCK
      ?auto_574848 - BLOCK
    )
    :vars
    (
      ?auto_574849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_574848 ?auto_574849 ) ( ON-TABLE ?auto_574836 ) ( ON ?auto_574837 ?auto_574836 ) ( ON ?auto_574838 ?auto_574837 ) ( not ( = ?auto_574836 ?auto_574837 ) ) ( not ( = ?auto_574836 ?auto_574838 ) ) ( not ( = ?auto_574836 ?auto_574839 ) ) ( not ( = ?auto_574836 ?auto_574840 ) ) ( not ( = ?auto_574836 ?auto_574841 ) ) ( not ( = ?auto_574836 ?auto_574842 ) ) ( not ( = ?auto_574836 ?auto_574843 ) ) ( not ( = ?auto_574836 ?auto_574844 ) ) ( not ( = ?auto_574836 ?auto_574845 ) ) ( not ( = ?auto_574836 ?auto_574846 ) ) ( not ( = ?auto_574836 ?auto_574847 ) ) ( not ( = ?auto_574836 ?auto_574848 ) ) ( not ( = ?auto_574836 ?auto_574849 ) ) ( not ( = ?auto_574837 ?auto_574838 ) ) ( not ( = ?auto_574837 ?auto_574839 ) ) ( not ( = ?auto_574837 ?auto_574840 ) ) ( not ( = ?auto_574837 ?auto_574841 ) ) ( not ( = ?auto_574837 ?auto_574842 ) ) ( not ( = ?auto_574837 ?auto_574843 ) ) ( not ( = ?auto_574837 ?auto_574844 ) ) ( not ( = ?auto_574837 ?auto_574845 ) ) ( not ( = ?auto_574837 ?auto_574846 ) ) ( not ( = ?auto_574837 ?auto_574847 ) ) ( not ( = ?auto_574837 ?auto_574848 ) ) ( not ( = ?auto_574837 ?auto_574849 ) ) ( not ( = ?auto_574838 ?auto_574839 ) ) ( not ( = ?auto_574838 ?auto_574840 ) ) ( not ( = ?auto_574838 ?auto_574841 ) ) ( not ( = ?auto_574838 ?auto_574842 ) ) ( not ( = ?auto_574838 ?auto_574843 ) ) ( not ( = ?auto_574838 ?auto_574844 ) ) ( not ( = ?auto_574838 ?auto_574845 ) ) ( not ( = ?auto_574838 ?auto_574846 ) ) ( not ( = ?auto_574838 ?auto_574847 ) ) ( not ( = ?auto_574838 ?auto_574848 ) ) ( not ( = ?auto_574838 ?auto_574849 ) ) ( not ( = ?auto_574839 ?auto_574840 ) ) ( not ( = ?auto_574839 ?auto_574841 ) ) ( not ( = ?auto_574839 ?auto_574842 ) ) ( not ( = ?auto_574839 ?auto_574843 ) ) ( not ( = ?auto_574839 ?auto_574844 ) ) ( not ( = ?auto_574839 ?auto_574845 ) ) ( not ( = ?auto_574839 ?auto_574846 ) ) ( not ( = ?auto_574839 ?auto_574847 ) ) ( not ( = ?auto_574839 ?auto_574848 ) ) ( not ( = ?auto_574839 ?auto_574849 ) ) ( not ( = ?auto_574840 ?auto_574841 ) ) ( not ( = ?auto_574840 ?auto_574842 ) ) ( not ( = ?auto_574840 ?auto_574843 ) ) ( not ( = ?auto_574840 ?auto_574844 ) ) ( not ( = ?auto_574840 ?auto_574845 ) ) ( not ( = ?auto_574840 ?auto_574846 ) ) ( not ( = ?auto_574840 ?auto_574847 ) ) ( not ( = ?auto_574840 ?auto_574848 ) ) ( not ( = ?auto_574840 ?auto_574849 ) ) ( not ( = ?auto_574841 ?auto_574842 ) ) ( not ( = ?auto_574841 ?auto_574843 ) ) ( not ( = ?auto_574841 ?auto_574844 ) ) ( not ( = ?auto_574841 ?auto_574845 ) ) ( not ( = ?auto_574841 ?auto_574846 ) ) ( not ( = ?auto_574841 ?auto_574847 ) ) ( not ( = ?auto_574841 ?auto_574848 ) ) ( not ( = ?auto_574841 ?auto_574849 ) ) ( not ( = ?auto_574842 ?auto_574843 ) ) ( not ( = ?auto_574842 ?auto_574844 ) ) ( not ( = ?auto_574842 ?auto_574845 ) ) ( not ( = ?auto_574842 ?auto_574846 ) ) ( not ( = ?auto_574842 ?auto_574847 ) ) ( not ( = ?auto_574842 ?auto_574848 ) ) ( not ( = ?auto_574842 ?auto_574849 ) ) ( not ( = ?auto_574843 ?auto_574844 ) ) ( not ( = ?auto_574843 ?auto_574845 ) ) ( not ( = ?auto_574843 ?auto_574846 ) ) ( not ( = ?auto_574843 ?auto_574847 ) ) ( not ( = ?auto_574843 ?auto_574848 ) ) ( not ( = ?auto_574843 ?auto_574849 ) ) ( not ( = ?auto_574844 ?auto_574845 ) ) ( not ( = ?auto_574844 ?auto_574846 ) ) ( not ( = ?auto_574844 ?auto_574847 ) ) ( not ( = ?auto_574844 ?auto_574848 ) ) ( not ( = ?auto_574844 ?auto_574849 ) ) ( not ( = ?auto_574845 ?auto_574846 ) ) ( not ( = ?auto_574845 ?auto_574847 ) ) ( not ( = ?auto_574845 ?auto_574848 ) ) ( not ( = ?auto_574845 ?auto_574849 ) ) ( not ( = ?auto_574846 ?auto_574847 ) ) ( not ( = ?auto_574846 ?auto_574848 ) ) ( not ( = ?auto_574846 ?auto_574849 ) ) ( not ( = ?auto_574847 ?auto_574848 ) ) ( not ( = ?auto_574847 ?auto_574849 ) ) ( not ( = ?auto_574848 ?auto_574849 ) ) ( ON ?auto_574847 ?auto_574848 ) ( ON ?auto_574846 ?auto_574847 ) ( ON ?auto_574845 ?auto_574846 ) ( ON ?auto_574844 ?auto_574845 ) ( ON ?auto_574843 ?auto_574844 ) ( ON ?auto_574842 ?auto_574843 ) ( ON ?auto_574841 ?auto_574842 ) ( ON ?auto_574840 ?auto_574841 ) ( CLEAR ?auto_574838 ) ( ON ?auto_574839 ?auto_574840 ) ( CLEAR ?auto_574839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_574836 ?auto_574837 ?auto_574838 ?auto_574839 )
      ( MAKE-13PILE ?auto_574836 ?auto_574837 ?auto_574838 ?auto_574839 ?auto_574840 ?auto_574841 ?auto_574842 ?auto_574843 ?auto_574844 ?auto_574845 ?auto_574846 ?auto_574847 ?auto_574848 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_574890 - BLOCK
      ?auto_574891 - BLOCK
      ?auto_574892 - BLOCK
      ?auto_574893 - BLOCK
      ?auto_574894 - BLOCK
      ?auto_574895 - BLOCK
      ?auto_574896 - BLOCK
      ?auto_574897 - BLOCK
      ?auto_574898 - BLOCK
      ?auto_574899 - BLOCK
      ?auto_574900 - BLOCK
      ?auto_574901 - BLOCK
      ?auto_574902 - BLOCK
    )
    :vars
    (
      ?auto_574903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_574902 ?auto_574903 ) ( ON-TABLE ?auto_574890 ) ( ON ?auto_574891 ?auto_574890 ) ( not ( = ?auto_574890 ?auto_574891 ) ) ( not ( = ?auto_574890 ?auto_574892 ) ) ( not ( = ?auto_574890 ?auto_574893 ) ) ( not ( = ?auto_574890 ?auto_574894 ) ) ( not ( = ?auto_574890 ?auto_574895 ) ) ( not ( = ?auto_574890 ?auto_574896 ) ) ( not ( = ?auto_574890 ?auto_574897 ) ) ( not ( = ?auto_574890 ?auto_574898 ) ) ( not ( = ?auto_574890 ?auto_574899 ) ) ( not ( = ?auto_574890 ?auto_574900 ) ) ( not ( = ?auto_574890 ?auto_574901 ) ) ( not ( = ?auto_574890 ?auto_574902 ) ) ( not ( = ?auto_574890 ?auto_574903 ) ) ( not ( = ?auto_574891 ?auto_574892 ) ) ( not ( = ?auto_574891 ?auto_574893 ) ) ( not ( = ?auto_574891 ?auto_574894 ) ) ( not ( = ?auto_574891 ?auto_574895 ) ) ( not ( = ?auto_574891 ?auto_574896 ) ) ( not ( = ?auto_574891 ?auto_574897 ) ) ( not ( = ?auto_574891 ?auto_574898 ) ) ( not ( = ?auto_574891 ?auto_574899 ) ) ( not ( = ?auto_574891 ?auto_574900 ) ) ( not ( = ?auto_574891 ?auto_574901 ) ) ( not ( = ?auto_574891 ?auto_574902 ) ) ( not ( = ?auto_574891 ?auto_574903 ) ) ( not ( = ?auto_574892 ?auto_574893 ) ) ( not ( = ?auto_574892 ?auto_574894 ) ) ( not ( = ?auto_574892 ?auto_574895 ) ) ( not ( = ?auto_574892 ?auto_574896 ) ) ( not ( = ?auto_574892 ?auto_574897 ) ) ( not ( = ?auto_574892 ?auto_574898 ) ) ( not ( = ?auto_574892 ?auto_574899 ) ) ( not ( = ?auto_574892 ?auto_574900 ) ) ( not ( = ?auto_574892 ?auto_574901 ) ) ( not ( = ?auto_574892 ?auto_574902 ) ) ( not ( = ?auto_574892 ?auto_574903 ) ) ( not ( = ?auto_574893 ?auto_574894 ) ) ( not ( = ?auto_574893 ?auto_574895 ) ) ( not ( = ?auto_574893 ?auto_574896 ) ) ( not ( = ?auto_574893 ?auto_574897 ) ) ( not ( = ?auto_574893 ?auto_574898 ) ) ( not ( = ?auto_574893 ?auto_574899 ) ) ( not ( = ?auto_574893 ?auto_574900 ) ) ( not ( = ?auto_574893 ?auto_574901 ) ) ( not ( = ?auto_574893 ?auto_574902 ) ) ( not ( = ?auto_574893 ?auto_574903 ) ) ( not ( = ?auto_574894 ?auto_574895 ) ) ( not ( = ?auto_574894 ?auto_574896 ) ) ( not ( = ?auto_574894 ?auto_574897 ) ) ( not ( = ?auto_574894 ?auto_574898 ) ) ( not ( = ?auto_574894 ?auto_574899 ) ) ( not ( = ?auto_574894 ?auto_574900 ) ) ( not ( = ?auto_574894 ?auto_574901 ) ) ( not ( = ?auto_574894 ?auto_574902 ) ) ( not ( = ?auto_574894 ?auto_574903 ) ) ( not ( = ?auto_574895 ?auto_574896 ) ) ( not ( = ?auto_574895 ?auto_574897 ) ) ( not ( = ?auto_574895 ?auto_574898 ) ) ( not ( = ?auto_574895 ?auto_574899 ) ) ( not ( = ?auto_574895 ?auto_574900 ) ) ( not ( = ?auto_574895 ?auto_574901 ) ) ( not ( = ?auto_574895 ?auto_574902 ) ) ( not ( = ?auto_574895 ?auto_574903 ) ) ( not ( = ?auto_574896 ?auto_574897 ) ) ( not ( = ?auto_574896 ?auto_574898 ) ) ( not ( = ?auto_574896 ?auto_574899 ) ) ( not ( = ?auto_574896 ?auto_574900 ) ) ( not ( = ?auto_574896 ?auto_574901 ) ) ( not ( = ?auto_574896 ?auto_574902 ) ) ( not ( = ?auto_574896 ?auto_574903 ) ) ( not ( = ?auto_574897 ?auto_574898 ) ) ( not ( = ?auto_574897 ?auto_574899 ) ) ( not ( = ?auto_574897 ?auto_574900 ) ) ( not ( = ?auto_574897 ?auto_574901 ) ) ( not ( = ?auto_574897 ?auto_574902 ) ) ( not ( = ?auto_574897 ?auto_574903 ) ) ( not ( = ?auto_574898 ?auto_574899 ) ) ( not ( = ?auto_574898 ?auto_574900 ) ) ( not ( = ?auto_574898 ?auto_574901 ) ) ( not ( = ?auto_574898 ?auto_574902 ) ) ( not ( = ?auto_574898 ?auto_574903 ) ) ( not ( = ?auto_574899 ?auto_574900 ) ) ( not ( = ?auto_574899 ?auto_574901 ) ) ( not ( = ?auto_574899 ?auto_574902 ) ) ( not ( = ?auto_574899 ?auto_574903 ) ) ( not ( = ?auto_574900 ?auto_574901 ) ) ( not ( = ?auto_574900 ?auto_574902 ) ) ( not ( = ?auto_574900 ?auto_574903 ) ) ( not ( = ?auto_574901 ?auto_574902 ) ) ( not ( = ?auto_574901 ?auto_574903 ) ) ( not ( = ?auto_574902 ?auto_574903 ) ) ( ON ?auto_574901 ?auto_574902 ) ( ON ?auto_574900 ?auto_574901 ) ( ON ?auto_574899 ?auto_574900 ) ( ON ?auto_574898 ?auto_574899 ) ( ON ?auto_574897 ?auto_574898 ) ( ON ?auto_574896 ?auto_574897 ) ( ON ?auto_574895 ?auto_574896 ) ( ON ?auto_574894 ?auto_574895 ) ( ON ?auto_574893 ?auto_574894 ) ( CLEAR ?auto_574891 ) ( ON ?auto_574892 ?auto_574893 ) ( CLEAR ?auto_574892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_574890 ?auto_574891 ?auto_574892 )
      ( MAKE-13PILE ?auto_574890 ?auto_574891 ?auto_574892 ?auto_574893 ?auto_574894 ?auto_574895 ?auto_574896 ?auto_574897 ?auto_574898 ?auto_574899 ?auto_574900 ?auto_574901 ?auto_574902 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_574944 - BLOCK
      ?auto_574945 - BLOCK
      ?auto_574946 - BLOCK
      ?auto_574947 - BLOCK
      ?auto_574948 - BLOCK
      ?auto_574949 - BLOCK
      ?auto_574950 - BLOCK
      ?auto_574951 - BLOCK
      ?auto_574952 - BLOCK
      ?auto_574953 - BLOCK
      ?auto_574954 - BLOCK
      ?auto_574955 - BLOCK
      ?auto_574956 - BLOCK
    )
    :vars
    (
      ?auto_574957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_574956 ?auto_574957 ) ( ON-TABLE ?auto_574944 ) ( not ( = ?auto_574944 ?auto_574945 ) ) ( not ( = ?auto_574944 ?auto_574946 ) ) ( not ( = ?auto_574944 ?auto_574947 ) ) ( not ( = ?auto_574944 ?auto_574948 ) ) ( not ( = ?auto_574944 ?auto_574949 ) ) ( not ( = ?auto_574944 ?auto_574950 ) ) ( not ( = ?auto_574944 ?auto_574951 ) ) ( not ( = ?auto_574944 ?auto_574952 ) ) ( not ( = ?auto_574944 ?auto_574953 ) ) ( not ( = ?auto_574944 ?auto_574954 ) ) ( not ( = ?auto_574944 ?auto_574955 ) ) ( not ( = ?auto_574944 ?auto_574956 ) ) ( not ( = ?auto_574944 ?auto_574957 ) ) ( not ( = ?auto_574945 ?auto_574946 ) ) ( not ( = ?auto_574945 ?auto_574947 ) ) ( not ( = ?auto_574945 ?auto_574948 ) ) ( not ( = ?auto_574945 ?auto_574949 ) ) ( not ( = ?auto_574945 ?auto_574950 ) ) ( not ( = ?auto_574945 ?auto_574951 ) ) ( not ( = ?auto_574945 ?auto_574952 ) ) ( not ( = ?auto_574945 ?auto_574953 ) ) ( not ( = ?auto_574945 ?auto_574954 ) ) ( not ( = ?auto_574945 ?auto_574955 ) ) ( not ( = ?auto_574945 ?auto_574956 ) ) ( not ( = ?auto_574945 ?auto_574957 ) ) ( not ( = ?auto_574946 ?auto_574947 ) ) ( not ( = ?auto_574946 ?auto_574948 ) ) ( not ( = ?auto_574946 ?auto_574949 ) ) ( not ( = ?auto_574946 ?auto_574950 ) ) ( not ( = ?auto_574946 ?auto_574951 ) ) ( not ( = ?auto_574946 ?auto_574952 ) ) ( not ( = ?auto_574946 ?auto_574953 ) ) ( not ( = ?auto_574946 ?auto_574954 ) ) ( not ( = ?auto_574946 ?auto_574955 ) ) ( not ( = ?auto_574946 ?auto_574956 ) ) ( not ( = ?auto_574946 ?auto_574957 ) ) ( not ( = ?auto_574947 ?auto_574948 ) ) ( not ( = ?auto_574947 ?auto_574949 ) ) ( not ( = ?auto_574947 ?auto_574950 ) ) ( not ( = ?auto_574947 ?auto_574951 ) ) ( not ( = ?auto_574947 ?auto_574952 ) ) ( not ( = ?auto_574947 ?auto_574953 ) ) ( not ( = ?auto_574947 ?auto_574954 ) ) ( not ( = ?auto_574947 ?auto_574955 ) ) ( not ( = ?auto_574947 ?auto_574956 ) ) ( not ( = ?auto_574947 ?auto_574957 ) ) ( not ( = ?auto_574948 ?auto_574949 ) ) ( not ( = ?auto_574948 ?auto_574950 ) ) ( not ( = ?auto_574948 ?auto_574951 ) ) ( not ( = ?auto_574948 ?auto_574952 ) ) ( not ( = ?auto_574948 ?auto_574953 ) ) ( not ( = ?auto_574948 ?auto_574954 ) ) ( not ( = ?auto_574948 ?auto_574955 ) ) ( not ( = ?auto_574948 ?auto_574956 ) ) ( not ( = ?auto_574948 ?auto_574957 ) ) ( not ( = ?auto_574949 ?auto_574950 ) ) ( not ( = ?auto_574949 ?auto_574951 ) ) ( not ( = ?auto_574949 ?auto_574952 ) ) ( not ( = ?auto_574949 ?auto_574953 ) ) ( not ( = ?auto_574949 ?auto_574954 ) ) ( not ( = ?auto_574949 ?auto_574955 ) ) ( not ( = ?auto_574949 ?auto_574956 ) ) ( not ( = ?auto_574949 ?auto_574957 ) ) ( not ( = ?auto_574950 ?auto_574951 ) ) ( not ( = ?auto_574950 ?auto_574952 ) ) ( not ( = ?auto_574950 ?auto_574953 ) ) ( not ( = ?auto_574950 ?auto_574954 ) ) ( not ( = ?auto_574950 ?auto_574955 ) ) ( not ( = ?auto_574950 ?auto_574956 ) ) ( not ( = ?auto_574950 ?auto_574957 ) ) ( not ( = ?auto_574951 ?auto_574952 ) ) ( not ( = ?auto_574951 ?auto_574953 ) ) ( not ( = ?auto_574951 ?auto_574954 ) ) ( not ( = ?auto_574951 ?auto_574955 ) ) ( not ( = ?auto_574951 ?auto_574956 ) ) ( not ( = ?auto_574951 ?auto_574957 ) ) ( not ( = ?auto_574952 ?auto_574953 ) ) ( not ( = ?auto_574952 ?auto_574954 ) ) ( not ( = ?auto_574952 ?auto_574955 ) ) ( not ( = ?auto_574952 ?auto_574956 ) ) ( not ( = ?auto_574952 ?auto_574957 ) ) ( not ( = ?auto_574953 ?auto_574954 ) ) ( not ( = ?auto_574953 ?auto_574955 ) ) ( not ( = ?auto_574953 ?auto_574956 ) ) ( not ( = ?auto_574953 ?auto_574957 ) ) ( not ( = ?auto_574954 ?auto_574955 ) ) ( not ( = ?auto_574954 ?auto_574956 ) ) ( not ( = ?auto_574954 ?auto_574957 ) ) ( not ( = ?auto_574955 ?auto_574956 ) ) ( not ( = ?auto_574955 ?auto_574957 ) ) ( not ( = ?auto_574956 ?auto_574957 ) ) ( ON ?auto_574955 ?auto_574956 ) ( ON ?auto_574954 ?auto_574955 ) ( ON ?auto_574953 ?auto_574954 ) ( ON ?auto_574952 ?auto_574953 ) ( ON ?auto_574951 ?auto_574952 ) ( ON ?auto_574950 ?auto_574951 ) ( ON ?auto_574949 ?auto_574950 ) ( ON ?auto_574948 ?auto_574949 ) ( ON ?auto_574947 ?auto_574948 ) ( ON ?auto_574946 ?auto_574947 ) ( CLEAR ?auto_574944 ) ( ON ?auto_574945 ?auto_574946 ) ( CLEAR ?auto_574945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_574944 ?auto_574945 )
      ( MAKE-13PILE ?auto_574944 ?auto_574945 ?auto_574946 ?auto_574947 ?auto_574948 ?auto_574949 ?auto_574950 ?auto_574951 ?auto_574952 ?auto_574953 ?auto_574954 ?auto_574955 ?auto_574956 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_574998 - BLOCK
      ?auto_574999 - BLOCK
      ?auto_575000 - BLOCK
      ?auto_575001 - BLOCK
      ?auto_575002 - BLOCK
      ?auto_575003 - BLOCK
      ?auto_575004 - BLOCK
      ?auto_575005 - BLOCK
      ?auto_575006 - BLOCK
      ?auto_575007 - BLOCK
      ?auto_575008 - BLOCK
      ?auto_575009 - BLOCK
      ?auto_575010 - BLOCK
    )
    :vars
    (
      ?auto_575011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_575010 ?auto_575011 ) ( not ( = ?auto_574998 ?auto_574999 ) ) ( not ( = ?auto_574998 ?auto_575000 ) ) ( not ( = ?auto_574998 ?auto_575001 ) ) ( not ( = ?auto_574998 ?auto_575002 ) ) ( not ( = ?auto_574998 ?auto_575003 ) ) ( not ( = ?auto_574998 ?auto_575004 ) ) ( not ( = ?auto_574998 ?auto_575005 ) ) ( not ( = ?auto_574998 ?auto_575006 ) ) ( not ( = ?auto_574998 ?auto_575007 ) ) ( not ( = ?auto_574998 ?auto_575008 ) ) ( not ( = ?auto_574998 ?auto_575009 ) ) ( not ( = ?auto_574998 ?auto_575010 ) ) ( not ( = ?auto_574998 ?auto_575011 ) ) ( not ( = ?auto_574999 ?auto_575000 ) ) ( not ( = ?auto_574999 ?auto_575001 ) ) ( not ( = ?auto_574999 ?auto_575002 ) ) ( not ( = ?auto_574999 ?auto_575003 ) ) ( not ( = ?auto_574999 ?auto_575004 ) ) ( not ( = ?auto_574999 ?auto_575005 ) ) ( not ( = ?auto_574999 ?auto_575006 ) ) ( not ( = ?auto_574999 ?auto_575007 ) ) ( not ( = ?auto_574999 ?auto_575008 ) ) ( not ( = ?auto_574999 ?auto_575009 ) ) ( not ( = ?auto_574999 ?auto_575010 ) ) ( not ( = ?auto_574999 ?auto_575011 ) ) ( not ( = ?auto_575000 ?auto_575001 ) ) ( not ( = ?auto_575000 ?auto_575002 ) ) ( not ( = ?auto_575000 ?auto_575003 ) ) ( not ( = ?auto_575000 ?auto_575004 ) ) ( not ( = ?auto_575000 ?auto_575005 ) ) ( not ( = ?auto_575000 ?auto_575006 ) ) ( not ( = ?auto_575000 ?auto_575007 ) ) ( not ( = ?auto_575000 ?auto_575008 ) ) ( not ( = ?auto_575000 ?auto_575009 ) ) ( not ( = ?auto_575000 ?auto_575010 ) ) ( not ( = ?auto_575000 ?auto_575011 ) ) ( not ( = ?auto_575001 ?auto_575002 ) ) ( not ( = ?auto_575001 ?auto_575003 ) ) ( not ( = ?auto_575001 ?auto_575004 ) ) ( not ( = ?auto_575001 ?auto_575005 ) ) ( not ( = ?auto_575001 ?auto_575006 ) ) ( not ( = ?auto_575001 ?auto_575007 ) ) ( not ( = ?auto_575001 ?auto_575008 ) ) ( not ( = ?auto_575001 ?auto_575009 ) ) ( not ( = ?auto_575001 ?auto_575010 ) ) ( not ( = ?auto_575001 ?auto_575011 ) ) ( not ( = ?auto_575002 ?auto_575003 ) ) ( not ( = ?auto_575002 ?auto_575004 ) ) ( not ( = ?auto_575002 ?auto_575005 ) ) ( not ( = ?auto_575002 ?auto_575006 ) ) ( not ( = ?auto_575002 ?auto_575007 ) ) ( not ( = ?auto_575002 ?auto_575008 ) ) ( not ( = ?auto_575002 ?auto_575009 ) ) ( not ( = ?auto_575002 ?auto_575010 ) ) ( not ( = ?auto_575002 ?auto_575011 ) ) ( not ( = ?auto_575003 ?auto_575004 ) ) ( not ( = ?auto_575003 ?auto_575005 ) ) ( not ( = ?auto_575003 ?auto_575006 ) ) ( not ( = ?auto_575003 ?auto_575007 ) ) ( not ( = ?auto_575003 ?auto_575008 ) ) ( not ( = ?auto_575003 ?auto_575009 ) ) ( not ( = ?auto_575003 ?auto_575010 ) ) ( not ( = ?auto_575003 ?auto_575011 ) ) ( not ( = ?auto_575004 ?auto_575005 ) ) ( not ( = ?auto_575004 ?auto_575006 ) ) ( not ( = ?auto_575004 ?auto_575007 ) ) ( not ( = ?auto_575004 ?auto_575008 ) ) ( not ( = ?auto_575004 ?auto_575009 ) ) ( not ( = ?auto_575004 ?auto_575010 ) ) ( not ( = ?auto_575004 ?auto_575011 ) ) ( not ( = ?auto_575005 ?auto_575006 ) ) ( not ( = ?auto_575005 ?auto_575007 ) ) ( not ( = ?auto_575005 ?auto_575008 ) ) ( not ( = ?auto_575005 ?auto_575009 ) ) ( not ( = ?auto_575005 ?auto_575010 ) ) ( not ( = ?auto_575005 ?auto_575011 ) ) ( not ( = ?auto_575006 ?auto_575007 ) ) ( not ( = ?auto_575006 ?auto_575008 ) ) ( not ( = ?auto_575006 ?auto_575009 ) ) ( not ( = ?auto_575006 ?auto_575010 ) ) ( not ( = ?auto_575006 ?auto_575011 ) ) ( not ( = ?auto_575007 ?auto_575008 ) ) ( not ( = ?auto_575007 ?auto_575009 ) ) ( not ( = ?auto_575007 ?auto_575010 ) ) ( not ( = ?auto_575007 ?auto_575011 ) ) ( not ( = ?auto_575008 ?auto_575009 ) ) ( not ( = ?auto_575008 ?auto_575010 ) ) ( not ( = ?auto_575008 ?auto_575011 ) ) ( not ( = ?auto_575009 ?auto_575010 ) ) ( not ( = ?auto_575009 ?auto_575011 ) ) ( not ( = ?auto_575010 ?auto_575011 ) ) ( ON ?auto_575009 ?auto_575010 ) ( ON ?auto_575008 ?auto_575009 ) ( ON ?auto_575007 ?auto_575008 ) ( ON ?auto_575006 ?auto_575007 ) ( ON ?auto_575005 ?auto_575006 ) ( ON ?auto_575004 ?auto_575005 ) ( ON ?auto_575003 ?auto_575004 ) ( ON ?auto_575002 ?auto_575003 ) ( ON ?auto_575001 ?auto_575002 ) ( ON ?auto_575000 ?auto_575001 ) ( ON ?auto_574999 ?auto_575000 ) ( ON ?auto_574998 ?auto_574999 ) ( CLEAR ?auto_574998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_574998 )
      ( MAKE-13PILE ?auto_574998 ?auto_574999 ?auto_575000 ?auto_575001 ?auto_575002 ?auto_575003 ?auto_575004 ?auto_575005 ?auto_575006 ?auto_575007 ?auto_575008 ?auto_575009 ?auto_575010 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_575053 - BLOCK
      ?auto_575054 - BLOCK
      ?auto_575055 - BLOCK
      ?auto_575056 - BLOCK
      ?auto_575057 - BLOCK
      ?auto_575058 - BLOCK
      ?auto_575059 - BLOCK
      ?auto_575060 - BLOCK
      ?auto_575061 - BLOCK
      ?auto_575062 - BLOCK
      ?auto_575063 - BLOCK
      ?auto_575064 - BLOCK
      ?auto_575065 - BLOCK
      ?auto_575066 - BLOCK
    )
    :vars
    (
      ?auto_575067 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_575065 ) ( ON ?auto_575066 ?auto_575067 ) ( CLEAR ?auto_575066 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_575053 ) ( ON ?auto_575054 ?auto_575053 ) ( ON ?auto_575055 ?auto_575054 ) ( ON ?auto_575056 ?auto_575055 ) ( ON ?auto_575057 ?auto_575056 ) ( ON ?auto_575058 ?auto_575057 ) ( ON ?auto_575059 ?auto_575058 ) ( ON ?auto_575060 ?auto_575059 ) ( ON ?auto_575061 ?auto_575060 ) ( ON ?auto_575062 ?auto_575061 ) ( ON ?auto_575063 ?auto_575062 ) ( ON ?auto_575064 ?auto_575063 ) ( ON ?auto_575065 ?auto_575064 ) ( not ( = ?auto_575053 ?auto_575054 ) ) ( not ( = ?auto_575053 ?auto_575055 ) ) ( not ( = ?auto_575053 ?auto_575056 ) ) ( not ( = ?auto_575053 ?auto_575057 ) ) ( not ( = ?auto_575053 ?auto_575058 ) ) ( not ( = ?auto_575053 ?auto_575059 ) ) ( not ( = ?auto_575053 ?auto_575060 ) ) ( not ( = ?auto_575053 ?auto_575061 ) ) ( not ( = ?auto_575053 ?auto_575062 ) ) ( not ( = ?auto_575053 ?auto_575063 ) ) ( not ( = ?auto_575053 ?auto_575064 ) ) ( not ( = ?auto_575053 ?auto_575065 ) ) ( not ( = ?auto_575053 ?auto_575066 ) ) ( not ( = ?auto_575053 ?auto_575067 ) ) ( not ( = ?auto_575054 ?auto_575055 ) ) ( not ( = ?auto_575054 ?auto_575056 ) ) ( not ( = ?auto_575054 ?auto_575057 ) ) ( not ( = ?auto_575054 ?auto_575058 ) ) ( not ( = ?auto_575054 ?auto_575059 ) ) ( not ( = ?auto_575054 ?auto_575060 ) ) ( not ( = ?auto_575054 ?auto_575061 ) ) ( not ( = ?auto_575054 ?auto_575062 ) ) ( not ( = ?auto_575054 ?auto_575063 ) ) ( not ( = ?auto_575054 ?auto_575064 ) ) ( not ( = ?auto_575054 ?auto_575065 ) ) ( not ( = ?auto_575054 ?auto_575066 ) ) ( not ( = ?auto_575054 ?auto_575067 ) ) ( not ( = ?auto_575055 ?auto_575056 ) ) ( not ( = ?auto_575055 ?auto_575057 ) ) ( not ( = ?auto_575055 ?auto_575058 ) ) ( not ( = ?auto_575055 ?auto_575059 ) ) ( not ( = ?auto_575055 ?auto_575060 ) ) ( not ( = ?auto_575055 ?auto_575061 ) ) ( not ( = ?auto_575055 ?auto_575062 ) ) ( not ( = ?auto_575055 ?auto_575063 ) ) ( not ( = ?auto_575055 ?auto_575064 ) ) ( not ( = ?auto_575055 ?auto_575065 ) ) ( not ( = ?auto_575055 ?auto_575066 ) ) ( not ( = ?auto_575055 ?auto_575067 ) ) ( not ( = ?auto_575056 ?auto_575057 ) ) ( not ( = ?auto_575056 ?auto_575058 ) ) ( not ( = ?auto_575056 ?auto_575059 ) ) ( not ( = ?auto_575056 ?auto_575060 ) ) ( not ( = ?auto_575056 ?auto_575061 ) ) ( not ( = ?auto_575056 ?auto_575062 ) ) ( not ( = ?auto_575056 ?auto_575063 ) ) ( not ( = ?auto_575056 ?auto_575064 ) ) ( not ( = ?auto_575056 ?auto_575065 ) ) ( not ( = ?auto_575056 ?auto_575066 ) ) ( not ( = ?auto_575056 ?auto_575067 ) ) ( not ( = ?auto_575057 ?auto_575058 ) ) ( not ( = ?auto_575057 ?auto_575059 ) ) ( not ( = ?auto_575057 ?auto_575060 ) ) ( not ( = ?auto_575057 ?auto_575061 ) ) ( not ( = ?auto_575057 ?auto_575062 ) ) ( not ( = ?auto_575057 ?auto_575063 ) ) ( not ( = ?auto_575057 ?auto_575064 ) ) ( not ( = ?auto_575057 ?auto_575065 ) ) ( not ( = ?auto_575057 ?auto_575066 ) ) ( not ( = ?auto_575057 ?auto_575067 ) ) ( not ( = ?auto_575058 ?auto_575059 ) ) ( not ( = ?auto_575058 ?auto_575060 ) ) ( not ( = ?auto_575058 ?auto_575061 ) ) ( not ( = ?auto_575058 ?auto_575062 ) ) ( not ( = ?auto_575058 ?auto_575063 ) ) ( not ( = ?auto_575058 ?auto_575064 ) ) ( not ( = ?auto_575058 ?auto_575065 ) ) ( not ( = ?auto_575058 ?auto_575066 ) ) ( not ( = ?auto_575058 ?auto_575067 ) ) ( not ( = ?auto_575059 ?auto_575060 ) ) ( not ( = ?auto_575059 ?auto_575061 ) ) ( not ( = ?auto_575059 ?auto_575062 ) ) ( not ( = ?auto_575059 ?auto_575063 ) ) ( not ( = ?auto_575059 ?auto_575064 ) ) ( not ( = ?auto_575059 ?auto_575065 ) ) ( not ( = ?auto_575059 ?auto_575066 ) ) ( not ( = ?auto_575059 ?auto_575067 ) ) ( not ( = ?auto_575060 ?auto_575061 ) ) ( not ( = ?auto_575060 ?auto_575062 ) ) ( not ( = ?auto_575060 ?auto_575063 ) ) ( not ( = ?auto_575060 ?auto_575064 ) ) ( not ( = ?auto_575060 ?auto_575065 ) ) ( not ( = ?auto_575060 ?auto_575066 ) ) ( not ( = ?auto_575060 ?auto_575067 ) ) ( not ( = ?auto_575061 ?auto_575062 ) ) ( not ( = ?auto_575061 ?auto_575063 ) ) ( not ( = ?auto_575061 ?auto_575064 ) ) ( not ( = ?auto_575061 ?auto_575065 ) ) ( not ( = ?auto_575061 ?auto_575066 ) ) ( not ( = ?auto_575061 ?auto_575067 ) ) ( not ( = ?auto_575062 ?auto_575063 ) ) ( not ( = ?auto_575062 ?auto_575064 ) ) ( not ( = ?auto_575062 ?auto_575065 ) ) ( not ( = ?auto_575062 ?auto_575066 ) ) ( not ( = ?auto_575062 ?auto_575067 ) ) ( not ( = ?auto_575063 ?auto_575064 ) ) ( not ( = ?auto_575063 ?auto_575065 ) ) ( not ( = ?auto_575063 ?auto_575066 ) ) ( not ( = ?auto_575063 ?auto_575067 ) ) ( not ( = ?auto_575064 ?auto_575065 ) ) ( not ( = ?auto_575064 ?auto_575066 ) ) ( not ( = ?auto_575064 ?auto_575067 ) ) ( not ( = ?auto_575065 ?auto_575066 ) ) ( not ( = ?auto_575065 ?auto_575067 ) ) ( not ( = ?auto_575066 ?auto_575067 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_575066 ?auto_575067 )
      ( !STACK ?auto_575066 ?auto_575065 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_575111 - BLOCK
      ?auto_575112 - BLOCK
      ?auto_575113 - BLOCK
      ?auto_575114 - BLOCK
      ?auto_575115 - BLOCK
      ?auto_575116 - BLOCK
      ?auto_575117 - BLOCK
      ?auto_575118 - BLOCK
      ?auto_575119 - BLOCK
      ?auto_575120 - BLOCK
      ?auto_575121 - BLOCK
      ?auto_575122 - BLOCK
      ?auto_575123 - BLOCK
      ?auto_575124 - BLOCK
    )
    :vars
    (
      ?auto_575125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_575124 ?auto_575125 ) ( ON-TABLE ?auto_575111 ) ( ON ?auto_575112 ?auto_575111 ) ( ON ?auto_575113 ?auto_575112 ) ( ON ?auto_575114 ?auto_575113 ) ( ON ?auto_575115 ?auto_575114 ) ( ON ?auto_575116 ?auto_575115 ) ( ON ?auto_575117 ?auto_575116 ) ( ON ?auto_575118 ?auto_575117 ) ( ON ?auto_575119 ?auto_575118 ) ( ON ?auto_575120 ?auto_575119 ) ( ON ?auto_575121 ?auto_575120 ) ( ON ?auto_575122 ?auto_575121 ) ( not ( = ?auto_575111 ?auto_575112 ) ) ( not ( = ?auto_575111 ?auto_575113 ) ) ( not ( = ?auto_575111 ?auto_575114 ) ) ( not ( = ?auto_575111 ?auto_575115 ) ) ( not ( = ?auto_575111 ?auto_575116 ) ) ( not ( = ?auto_575111 ?auto_575117 ) ) ( not ( = ?auto_575111 ?auto_575118 ) ) ( not ( = ?auto_575111 ?auto_575119 ) ) ( not ( = ?auto_575111 ?auto_575120 ) ) ( not ( = ?auto_575111 ?auto_575121 ) ) ( not ( = ?auto_575111 ?auto_575122 ) ) ( not ( = ?auto_575111 ?auto_575123 ) ) ( not ( = ?auto_575111 ?auto_575124 ) ) ( not ( = ?auto_575111 ?auto_575125 ) ) ( not ( = ?auto_575112 ?auto_575113 ) ) ( not ( = ?auto_575112 ?auto_575114 ) ) ( not ( = ?auto_575112 ?auto_575115 ) ) ( not ( = ?auto_575112 ?auto_575116 ) ) ( not ( = ?auto_575112 ?auto_575117 ) ) ( not ( = ?auto_575112 ?auto_575118 ) ) ( not ( = ?auto_575112 ?auto_575119 ) ) ( not ( = ?auto_575112 ?auto_575120 ) ) ( not ( = ?auto_575112 ?auto_575121 ) ) ( not ( = ?auto_575112 ?auto_575122 ) ) ( not ( = ?auto_575112 ?auto_575123 ) ) ( not ( = ?auto_575112 ?auto_575124 ) ) ( not ( = ?auto_575112 ?auto_575125 ) ) ( not ( = ?auto_575113 ?auto_575114 ) ) ( not ( = ?auto_575113 ?auto_575115 ) ) ( not ( = ?auto_575113 ?auto_575116 ) ) ( not ( = ?auto_575113 ?auto_575117 ) ) ( not ( = ?auto_575113 ?auto_575118 ) ) ( not ( = ?auto_575113 ?auto_575119 ) ) ( not ( = ?auto_575113 ?auto_575120 ) ) ( not ( = ?auto_575113 ?auto_575121 ) ) ( not ( = ?auto_575113 ?auto_575122 ) ) ( not ( = ?auto_575113 ?auto_575123 ) ) ( not ( = ?auto_575113 ?auto_575124 ) ) ( not ( = ?auto_575113 ?auto_575125 ) ) ( not ( = ?auto_575114 ?auto_575115 ) ) ( not ( = ?auto_575114 ?auto_575116 ) ) ( not ( = ?auto_575114 ?auto_575117 ) ) ( not ( = ?auto_575114 ?auto_575118 ) ) ( not ( = ?auto_575114 ?auto_575119 ) ) ( not ( = ?auto_575114 ?auto_575120 ) ) ( not ( = ?auto_575114 ?auto_575121 ) ) ( not ( = ?auto_575114 ?auto_575122 ) ) ( not ( = ?auto_575114 ?auto_575123 ) ) ( not ( = ?auto_575114 ?auto_575124 ) ) ( not ( = ?auto_575114 ?auto_575125 ) ) ( not ( = ?auto_575115 ?auto_575116 ) ) ( not ( = ?auto_575115 ?auto_575117 ) ) ( not ( = ?auto_575115 ?auto_575118 ) ) ( not ( = ?auto_575115 ?auto_575119 ) ) ( not ( = ?auto_575115 ?auto_575120 ) ) ( not ( = ?auto_575115 ?auto_575121 ) ) ( not ( = ?auto_575115 ?auto_575122 ) ) ( not ( = ?auto_575115 ?auto_575123 ) ) ( not ( = ?auto_575115 ?auto_575124 ) ) ( not ( = ?auto_575115 ?auto_575125 ) ) ( not ( = ?auto_575116 ?auto_575117 ) ) ( not ( = ?auto_575116 ?auto_575118 ) ) ( not ( = ?auto_575116 ?auto_575119 ) ) ( not ( = ?auto_575116 ?auto_575120 ) ) ( not ( = ?auto_575116 ?auto_575121 ) ) ( not ( = ?auto_575116 ?auto_575122 ) ) ( not ( = ?auto_575116 ?auto_575123 ) ) ( not ( = ?auto_575116 ?auto_575124 ) ) ( not ( = ?auto_575116 ?auto_575125 ) ) ( not ( = ?auto_575117 ?auto_575118 ) ) ( not ( = ?auto_575117 ?auto_575119 ) ) ( not ( = ?auto_575117 ?auto_575120 ) ) ( not ( = ?auto_575117 ?auto_575121 ) ) ( not ( = ?auto_575117 ?auto_575122 ) ) ( not ( = ?auto_575117 ?auto_575123 ) ) ( not ( = ?auto_575117 ?auto_575124 ) ) ( not ( = ?auto_575117 ?auto_575125 ) ) ( not ( = ?auto_575118 ?auto_575119 ) ) ( not ( = ?auto_575118 ?auto_575120 ) ) ( not ( = ?auto_575118 ?auto_575121 ) ) ( not ( = ?auto_575118 ?auto_575122 ) ) ( not ( = ?auto_575118 ?auto_575123 ) ) ( not ( = ?auto_575118 ?auto_575124 ) ) ( not ( = ?auto_575118 ?auto_575125 ) ) ( not ( = ?auto_575119 ?auto_575120 ) ) ( not ( = ?auto_575119 ?auto_575121 ) ) ( not ( = ?auto_575119 ?auto_575122 ) ) ( not ( = ?auto_575119 ?auto_575123 ) ) ( not ( = ?auto_575119 ?auto_575124 ) ) ( not ( = ?auto_575119 ?auto_575125 ) ) ( not ( = ?auto_575120 ?auto_575121 ) ) ( not ( = ?auto_575120 ?auto_575122 ) ) ( not ( = ?auto_575120 ?auto_575123 ) ) ( not ( = ?auto_575120 ?auto_575124 ) ) ( not ( = ?auto_575120 ?auto_575125 ) ) ( not ( = ?auto_575121 ?auto_575122 ) ) ( not ( = ?auto_575121 ?auto_575123 ) ) ( not ( = ?auto_575121 ?auto_575124 ) ) ( not ( = ?auto_575121 ?auto_575125 ) ) ( not ( = ?auto_575122 ?auto_575123 ) ) ( not ( = ?auto_575122 ?auto_575124 ) ) ( not ( = ?auto_575122 ?auto_575125 ) ) ( not ( = ?auto_575123 ?auto_575124 ) ) ( not ( = ?auto_575123 ?auto_575125 ) ) ( not ( = ?auto_575124 ?auto_575125 ) ) ( CLEAR ?auto_575122 ) ( ON ?auto_575123 ?auto_575124 ) ( CLEAR ?auto_575123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_575111 ?auto_575112 ?auto_575113 ?auto_575114 ?auto_575115 ?auto_575116 ?auto_575117 ?auto_575118 ?auto_575119 ?auto_575120 ?auto_575121 ?auto_575122 ?auto_575123 )
      ( MAKE-14PILE ?auto_575111 ?auto_575112 ?auto_575113 ?auto_575114 ?auto_575115 ?auto_575116 ?auto_575117 ?auto_575118 ?auto_575119 ?auto_575120 ?auto_575121 ?auto_575122 ?auto_575123 ?auto_575124 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_575169 - BLOCK
      ?auto_575170 - BLOCK
      ?auto_575171 - BLOCK
      ?auto_575172 - BLOCK
      ?auto_575173 - BLOCK
      ?auto_575174 - BLOCK
      ?auto_575175 - BLOCK
      ?auto_575176 - BLOCK
      ?auto_575177 - BLOCK
      ?auto_575178 - BLOCK
      ?auto_575179 - BLOCK
      ?auto_575180 - BLOCK
      ?auto_575181 - BLOCK
      ?auto_575182 - BLOCK
    )
    :vars
    (
      ?auto_575183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_575182 ?auto_575183 ) ( ON-TABLE ?auto_575169 ) ( ON ?auto_575170 ?auto_575169 ) ( ON ?auto_575171 ?auto_575170 ) ( ON ?auto_575172 ?auto_575171 ) ( ON ?auto_575173 ?auto_575172 ) ( ON ?auto_575174 ?auto_575173 ) ( ON ?auto_575175 ?auto_575174 ) ( ON ?auto_575176 ?auto_575175 ) ( ON ?auto_575177 ?auto_575176 ) ( ON ?auto_575178 ?auto_575177 ) ( ON ?auto_575179 ?auto_575178 ) ( not ( = ?auto_575169 ?auto_575170 ) ) ( not ( = ?auto_575169 ?auto_575171 ) ) ( not ( = ?auto_575169 ?auto_575172 ) ) ( not ( = ?auto_575169 ?auto_575173 ) ) ( not ( = ?auto_575169 ?auto_575174 ) ) ( not ( = ?auto_575169 ?auto_575175 ) ) ( not ( = ?auto_575169 ?auto_575176 ) ) ( not ( = ?auto_575169 ?auto_575177 ) ) ( not ( = ?auto_575169 ?auto_575178 ) ) ( not ( = ?auto_575169 ?auto_575179 ) ) ( not ( = ?auto_575169 ?auto_575180 ) ) ( not ( = ?auto_575169 ?auto_575181 ) ) ( not ( = ?auto_575169 ?auto_575182 ) ) ( not ( = ?auto_575169 ?auto_575183 ) ) ( not ( = ?auto_575170 ?auto_575171 ) ) ( not ( = ?auto_575170 ?auto_575172 ) ) ( not ( = ?auto_575170 ?auto_575173 ) ) ( not ( = ?auto_575170 ?auto_575174 ) ) ( not ( = ?auto_575170 ?auto_575175 ) ) ( not ( = ?auto_575170 ?auto_575176 ) ) ( not ( = ?auto_575170 ?auto_575177 ) ) ( not ( = ?auto_575170 ?auto_575178 ) ) ( not ( = ?auto_575170 ?auto_575179 ) ) ( not ( = ?auto_575170 ?auto_575180 ) ) ( not ( = ?auto_575170 ?auto_575181 ) ) ( not ( = ?auto_575170 ?auto_575182 ) ) ( not ( = ?auto_575170 ?auto_575183 ) ) ( not ( = ?auto_575171 ?auto_575172 ) ) ( not ( = ?auto_575171 ?auto_575173 ) ) ( not ( = ?auto_575171 ?auto_575174 ) ) ( not ( = ?auto_575171 ?auto_575175 ) ) ( not ( = ?auto_575171 ?auto_575176 ) ) ( not ( = ?auto_575171 ?auto_575177 ) ) ( not ( = ?auto_575171 ?auto_575178 ) ) ( not ( = ?auto_575171 ?auto_575179 ) ) ( not ( = ?auto_575171 ?auto_575180 ) ) ( not ( = ?auto_575171 ?auto_575181 ) ) ( not ( = ?auto_575171 ?auto_575182 ) ) ( not ( = ?auto_575171 ?auto_575183 ) ) ( not ( = ?auto_575172 ?auto_575173 ) ) ( not ( = ?auto_575172 ?auto_575174 ) ) ( not ( = ?auto_575172 ?auto_575175 ) ) ( not ( = ?auto_575172 ?auto_575176 ) ) ( not ( = ?auto_575172 ?auto_575177 ) ) ( not ( = ?auto_575172 ?auto_575178 ) ) ( not ( = ?auto_575172 ?auto_575179 ) ) ( not ( = ?auto_575172 ?auto_575180 ) ) ( not ( = ?auto_575172 ?auto_575181 ) ) ( not ( = ?auto_575172 ?auto_575182 ) ) ( not ( = ?auto_575172 ?auto_575183 ) ) ( not ( = ?auto_575173 ?auto_575174 ) ) ( not ( = ?auto_575173 ?auto_575175 ) ) ( not ( = ?auto_575173 ?auto_575176 ) ) ( not ( = ?auto_575173 ?auto_575177 ) ) ( not ( = ?auto_575173 ?auto_575178 ) ) ( not ( = ?auto_575173 ?auto_575179 ) ) ( not ( = ?auto_575173 ?auto_575180 ) ) ( not ( = ?auto_575173 ?auto_575181 ) ) ( not ( = ?auto_575173 ?auto_575182 ) ) ( not ( = ?auto_575173 ?auto_575183 ) ) ( not ( = ?auto_575174 ?auto_575175 ) ) ( not ( = ?auto_575174 ?auto_575176 ) ) ( not ( = ?auto_575174 ?auto_575177 ) ) ( not ( = ?auto_575174 ?auto_575178 ) ) ( not ( = ?auto_575174 ?auto_575179 ) ) ( not ( = ?auto_575174 ?auto_575180 ) ) ( not ( = ?auto_575174 ?auto_575181 ) ) ( not ( = ?auto_575174 ?auto_575182 ) ) ( not ( = ?auto_575174 ?auto_575183 ) ) ( not ( = ?auto_575175 ?auto_575176 ) ) ( not ( = ?auto_575175 ?auto_575177 ) ) ( not ( = ?auto_575175 ?auto_575178 ) ) ( not ( = ?auto_575175 ?auto_575179 ) ) ( not ( = ?auto_575175 ?auto_575180 ) ) ( not ( = ?auto_575175 ?auto_575181 ) ) ( not ( = ?auto_575175 ?auto_575182 ) ) ( not ( = ?auto_575175 ?auto_575183 ) ) ( not ( = ?auto_575176 ?auto_575177 ) ) ( not ( = ?auto_575176 ?auto_575178 ) ) ( not ( = ?auto_575176 ?auto_575179 ) ) ( not ( = ?auto_575176 ?auto_575180 ) ) ( not ( = ?auto_575176 ?auto_575181 ) ) ( not ( = ?auto_575176 ?auto_575182 ) ) ( not ( = ?auto_575176 ?auto_575183 ) ) ( not ( = ?auto_575177 ?auto_575178 ) ) ( not ( = ?auto_575177 ?auto_575179 ) ) ( not ( = ?auto_575177 ?auto_575180 ) ) ( not ( = ?auto_575177 ?auto_575181 ) ) ( not ( = ?auto_575177 ?auto_575182 ) ) ( not ( = ?auto_575177 ?auto_575183 ) ) ( not ( = ?auto_575178 ?auto_575179 ) ) ( not ( = ?auto_575178 ?auto_575180 ) ) ( not ( = ?auto_575178 ?auto_575181 ) ) ( not ( = ?auto_575178 ?auto_575182 ) ) ( not ( = ?auto_575178 ?auto_575183 ) ) ( not ( = ?auto_575179 ?auto_575180 ) ) ( not ( = ?auto_575179 ?auto_575181 ) ) ( not ( = ?auto_575179 ?auto_575182 ) ) ( not ( = ?auto_575179 ?auto_575183 ) ) ( not ( = ?auto_575180 ?auto_575181 ) ) ( not ( = ?auto_575180 ?auto_575182 ) ) ( not ( = ?auto_575180 ?auto_575183 ) ) ( not ( = ?auto_575181 ?auto_575182 ) ) ( not ( = ?auto_575181 ?auto_575183 ) ) ( not ( = ?auto_575182 ?auto_575183 ) ) ( ON ?auto_575181 ?auto_575182 ) ( CLEAR ?auto_575179 ) ( ON ?auto_575180 ?auto_575181 ) ( CLEAR ?auto_575180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_575169 ?auto_575170 ?auto_575171 ?auto_575172 ?auto_575173 ?auto_575174 ?auto_575175 ?auto_575176 ?auto_575177 ?auto_575178 ?auto_575179 ?auto_575180 )
      ( MAKE-14PILE ?auto_575169 ?auto_575170 ?auto_575171 ?auto_575172 ?auto_575173 ?auto_575174 ?auto_575175 ?auto_575176 ?auto_575177 ?auto_575178 ?auto_575179 ?auto_575180 ?auto_575181 ?auto_575182 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_575227 - BLOCK
      ?auto_575228 - BLOCK
      ?auto_575229 - BLOCK
      ?auto_575230 - BLOCK
      ?auto_575231 - BLOCK
      ?auto_575232 - BLOCK
      ?auto_575233 - BLOCK
      ?auto_575234 - BLOCK
      ?auto_575235 - BLOCK
      ?auto_575236 - BLOCK
      ?auto_575237 - BLOCK
      ?auto_575238 - BLOCK
      ?auto_575239 - BLOCK
      ?auto_575240 - BLOCK
    )
    :vars
    (
      ?auto_575241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_575240 ?auto_575241 ) ( ON-TABLE ?auto_575227 ) ( ON ?auto_575228 ?auto_575227 ) ( ON ?auto_575229 ?auto_575228 ) ( ON ?auto_575230 ?auto_575229 ) ( ON ?auto_575231 ?auto_575230 ) ( ON ?auto_575232 ?auto_575231 ) ( ON ?auto_575233 ?auto_575232 ) ( ON ?auto_575234 ?auto_575233 ) ( ON ?auto_575235 ?auto_575234 ) ( ON ?auto_575236 ?auto_575235 ) ( not ( = ?auto_575227 ?auto_575228 ) ) ( not ( = ?auto_575227 ?auto_575229 ) ) ( not ( = ?auto_575227 ?auto_575230 ) ) ( not ( = ?auto_575227 ?auto_575231 ) ) ( not ( = ?auto_575227 ?auto_575232 ) ) ( not ( = ?auto_575227 ?auto_575233 ) ) ( not ( = ?auto_575227 ?auto_575234 ) ) ( not ( = ?auto_575227 ?auto_575235 ) ) ( not ( = ?auto_575227 ?auto_575236 ) ) ( not ( = ?auto_575227 ?auto_575237 ) ) ( not ( = ?auto_575227 ?auto_575238 ) ) ( not ( = ?auto_575227 ?auto_575239 ) ) ( not ( = ?auto_575227 ?auto_575240 ) ) ( not ( = ?auto_575227 ?auto_575241 ) ) ( not ( = ?auto_575228 ?auto_575229 ) ) ( not ( = ?auto_575228 ?auto_575230 ) ) ( not ( = ?auto_575228 ?auto_575231 ) ) ( not ( = ?auto_575228 ?auto_575232 ) ) ( not ( = ?auto_575228 ?auto_575233 ) ) ( not ( = ?auto_575228 ?auto_575234 ) ) ( not ( = ?auto_575228 ?auto_575235 ) ) ( not ( = ?auto_575228 ?auto_575236 ) ) ( not ( = ?auto_575228 ?auto_575237 ) ) ( not ( = ?auto_575228 ?auto_575238 ) ) ( not ( = ?auto_575228 ?auto_575239 ) ) ( not ( = ?auto_575228 ?auto_575240 ) ) ( not ( = ?auto_575228 ?auto_575241 ) ) ( not ( = ?auto_575229 ?auto_575230 ) ) ( not ( = ?auto_575229 ?auto_575231 ) ) ( not ( = ?auto_575229 ?auto_575232 ) ) ( not ( = ?auto_575229 ?auto_575233 ) ) ( not ( = ?auto_575229 ?auto_575234 ) ) ( not ( = ?auto_575229 ?auto_575235 ) ) ( not ( = ?auto_575229 ?auto_575236 ) ) ( not ( = ?auto_575229 ?auto_575237 ) ) ( not ( = ?auto_575229 ?auto_575238 ) ) ( not ( = ?auto_575229 ?auto_575239 ) ) ( not ( = ?auto_575229 ?auto_575240 ) ) ( not ( = ?auto_575229 ?auto_575241 ) ) ( not ( = ?auto_575230 ?auto_575231 ) ) ( not ( = ?auto_575230 ?auto_575232 ) ) ( not ( = ?auto_575230 ?auto_575233 ) ) ( not ( = ?auto_575230 ?auto_575234 ) ) ( not ( = ?auto_575230 ?auto_575235 ) ) ( not ( = ?auto_575230 ?auto_575236 ) ) ( not ( = ?auto_575230 ?auto_575237 ) ) ( not ( = ?auto_575230 ?auto_575238 ) ) ( not ( = ?auto_575230 ?auto_575239 ) ) ( not ( = ?auto_575230 ?auto_575240 ) ) ( not ( = ?auto_575230 ?auto_575241 ) ) ( not ( = ?auto_575231 ?auto_575232 ) ) ( not ( = ?auto_575231 ?auto_575233 ) ) ( not ( = ?auto_575231 ?auto_575234 ) ) ( not ( = ?auto_575231 ?auto_575235 ) ) ( not ( = ?auto_575231 ?auto_575236 ) ) ( not ( = ?auto_575231 ?auto_575237 ) ) ( not ( = ?auto_575231 ?auto_575238 ) ) ( not ( = ?auto_575231 ?auto_575239 ) ) ( not ( = ?auto_575231 ?auto_575240 ) ) ( not ( = ?auto_575231 ?auto_575241 ) ) ( not ( = ?auto_575232 ?auto_575233 ) ) ( not ( = ?auto_575232 ?auto_575234 ) ) ( not ( = ?auto_575232 ?auto_575235 ) ) ( not ( = ?auto_575232 ?auto_575236 ) ) ( not ( = ?auto_575232 ?auto_575237 ) ) ( not ( = ?auto_575232 ?auto_575238 ) ) ( not ( = ?auto_575232 ?auto_575239 ) ) ( not ( = ?auto_575232 ?auto_575240 ) ) ( not ( = ?auto_575232 ?auto_575241 ) ) ( not ( = ?auto_575233 ?auto_575234 ) ) ( not ( = ?auto_575233 ?auto_575235 ) ) ( not ( = ?auto_575233 ?auto_575236 ) ) ( not ( = ?auto_575233 ?auto_575237 ) ) ( not ( = ?auto_575233 ?auto_575238 ) ) ( not ( = ?auto_575233 ?auto_575239 ) ) ( not ( = ?auto_575233 ?auto_575240 ) ) ( not ( = ?auto_575233 ?auto_575241 ) ) ( not ( = ?auto_575234 ?auto_575235 ) ) ( not ( = ?auto_575234 ?auto_575236 ) ) ( not ( = ?auto_575234 ?auto_575237 ) ) ( not ( = ?auto_575234 ?auto_575238 ) ) ( not ( = ?auto_575234 ?auto_575239 ) ) ( not ( = ?auto_575234 ?auto_575240 ) ) ( not ( = ?auto_575234 ?auto_575241 ) ) ( not ( = ?auto_575235 ?auto_575236 ) ) ( not ( = ?auto_575235 ?auto_575237 ) ) ( not ( = ?auto_575235 ?auto_575238 ) ) ( not ( = ?auto_575235 ?auto_575239 ) ) ( not ( = ?auto_575235 ?auto_575240 ) ) ( not ( = ?auto_575235 ?auto_575241 ) ) ( not ( = ?auto_575236 ?auto_575237 ) ) ( not ( = ?auto_575236 ?auto_575238 ) ) ( not ( = ?auto_575236 ?auto_575239 ) ) ( not ( = ?auto_575236 ?auto_575240 ) ) ( not ( = ?auto_575236 ?auto_575241 ) ) ( not ( = ?auto_575237 ?auto_575238 ) ) ( not ( = ?auto_575237 ?auto_575239 ) ) ( not ( = ?auto_575237 ?auto_575240 ) ) ( not ( = ?auto_575237 ?auto_575241 ) ) ( not ( = ?auto_575238 ?auto_575239 ) ) ( not ( = ?auto_575238 ?auto_575240 ) ) ( not ( = ?auto_575238 ?auto_575241 ) ) ( not ( = ?auto_575239 ?auto_575240 ) ) ( not ( = ?auto_575239 ?auto_575241 ) ) ( not ( = ?auto_575240 ?auto_575241 ) ) ( ON ?auto_575239 ?auto_575240 ) ( ON ?auto_575238 ?auto_575239 ) ( CLEAR ?auto_575236 ) ( ON ?auto_575237 ?auto_575238 ) ( CLEAR ?auto_575237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_575227 ?auto_575228 ?auto_575229 ?auto_575230 ?auto_575231 ?auto_575232 ?auto_575233 ?auto_575234 ?auto_575235 ?auto_575236 ?auto_575237 )
      ( MAKE-14PILE ?auto_575227 ?auto_575228 ?auto_575229 ?auto_575230 ?auto_575231 ?auto_575232 ?auto_575233 ?auto_575234 ?auto_575235 ?auto_575236 ?auto_575237 ?auto_575238 ?auto_575239 ?auto_575240 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_575285 - BLOCK
      ?auto_575286 - BLOCK
      ?auto_575287 - BLOCK
      ?auto_575288 - BLOCK
      ?auto_575289 - BLOCK
      ?auto_575290 - BLOCK
      ?auto_575291 - BLOCK
      ?auto_575292 - BLOCK
      ?auto_575293 - BLOCK
      ?auto_575294 - BLOCK
      ?auto_575295 - BLOCK
      ?auto_575296 - BLOCK
      ?auto_575297 - BLOCK
      ?auto_575298 - BLOCK
    )
    :vars
    (
      ?auto_575299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_575298 ?auto_575299 ) ( ON-TABLE ?auto_575285 ) ( ON ?auto_575286 ?auto_575285 ) ( ON ?auto_575287 ?auto_575286 ) ( ON ?auto_575288 ?auto_575287 ) ( ON ?auto_575289 ?auto_575288 ) ( ON ?auto_575290 ?auto_575289 ) ( ON ?auto_575291 ?auto_575290 ) ( ON ?auto_575292 ?auto_575291 ) ( ON ?auto_575293 ?auto_575292 ) ( not ( = ?auto_575285 ?auto_575286 ) ) ( not ( = ?auto_575285 ?auto_575287 ) ) ( not ( = ?auto_575285 ?auto_575288 ) ) ( not ( = ?auto_575285 ?auto_575289 ) ) ( not ( = ?auto_575285 ?auto_575290 ) ) ( not ( = ?auto_575285 ?auto_575291 ) ) ( not ( = ?auto_575285 ?auto_575292 ) ) ( not ( = ?auto_575285 ?auto_575293 ) ) ( not ( = ?auto_575285 ?auto_575294 ) ) ( not ( = ?auto_575285 ?auto_575295 ) ) ( not ( = ?auto_575285 ?auto_575296 ) ) ( not ( = ?auto_575285 ?auto_575297 ) ) ( not ( = ?auto_575285 ?auto_575298 ) ) ( not ( = ?auto_575285 ?auto_575299 ) ) ( not ( = ?auto_575286 ?auto_575287 ) ) ( not ( = ?auto_575286 ?auto_575288 ) ) ( not ( = ?auto_575286 ?auto_575289 ) ) ( not ( = ?auto_575286 ?auto_575290 ) ) ( not ( = ?auto_575286 ?auto_575291 ) ) ( not ( = ?auto_575286 ?auto_575292 ) ) ( not ( = ?auto_575286 ?auto_575293 ) ) ( not ( = ?auto_575286 ?auto_575294 ) ) ( not ( = ?auto_575286 ?auto_575295 ) ) ( not ( = ?auto_575286 ?auto_575296 ) ) ( not ( = ?auto_575286 ?auto_575297 ) ) ( not ( = ?auto_575286 ?auto_575298 ) ) ( not ( = ?auto_575286 ?auto_575299 ) ) ( not ( = ?auto_575287 ?auto_575288 ) ) ( not ( = ?auto_575287 ?auto_575289 ) ) ( not ( = ?auto_575287 ?auto_575290 ) ) ( not ( = ?auto_575287 ?auto_575291 ) ) ( not ( = ?auto_575287 ?auto_575292 ) ) ( not ( = ?auto_575287 ?auto_575293 ) ) ( not ( = ?auto_575287 ?auto_575294 ) ) ( not ( = ?auto_575287 ?auto_575295 ) ) ( not ( = ?auto_575287 ?auto_575296 ) ) ( not ( = ?auto_575287 ?auto_575297 ) ) ( not ( = ?auto_575287 ?auto_575298 ) ) ( not ( = ?auto_575287 ?auto_575299 ) ) ( not ( = ?auto_575288 ?auto_575289 ) ) ( not ( = ?auto_575288 ?auto_575290 ) ) ( not ( = ?auto_575288 ?auto_575291 ) ) ( not ( = ?auto_575288 ?auto_575292 ) ) ( not ( = ?auto_575288 ?auto_575293 ) ) ( not ( = ?auto_575288 ?auto_575294 ) ) ( not ( = ?auto_575288 ?auto_575295 ) ) ( not ( = ?auto_575288 ?auto_575296 ) ) ( not ( = ?auto_575288 ?auto_575297 ) ) ( not ( = ?auto_575288 ?auto_575298 ) ) ( not ( = ?auto_575288 ?auto_575299 ) ) ( not ( = ?auto_575289 ?auto_575290 ) ) ( not ( = ?auto_575289 ?auto_575291 ) ) ( not ( = ?auto_575289 ?auto_575292 ) ) ( not ( = ?auto_575289 ?auto_575293 ) ) ( not ( = ?auto_575289 ?auto_575294 ) ) ( not ( = ?auto_575289 ?auto_575295 ) ) ( not ( = ?auto_575289 ?auto_575296 ) ) ( not ( = ?auto_575289 ?auto_575297 ) ) ( not ( = ?auto_575289 ?auto_575298 ) ) ( not ( = ?auto_575289 ?auto_575299 ) ) ( not ( = ?auto_575290 ?auto_575291 ) ) ( not ( = ?auto_575290 ?auto_575292 ) ) ( not ( = ?auto_575290 ?auto_575293 ) ) ( not ( = ?auto_575290 ?auto_575294 ) ) ( not ( = ?auto_575290 ?auto_575295 ) ) ( not ( = ?auto_575290 ?auto_575296 ) ) ( not ( = ?auto_575290 ?auto_575297 ) ) ( not ( = ?auto_575290 ?auto_575298 ) ) ( not ( = ?auto_575290 ?auto_575299 ) ) ( not ( = ?auto_575291 ?auto_575292 ) ) ( not ( = ?auto_575291 ?auto_575293 ) ) ( not ( = ?auto_575291 ?auto_575294 ) ) ( not ( = ?auto_575291 ?auto_575295 ) ) ( not ( = ?auto_575291 ?auto_575296 ) ) ( not ( = ?auto_575291 ?auto_575297 ) ) ( not ( = ?auto_575291 ?auto_575298 ) ) ( not ( = ?auto_575291 ?auto_575299 ) ) ( not ( = ?auto_575292 ?auto_575293 ) ) ( not ( = ?auto_575292 ?auto_575294 ) ) ( not ( = ?auto_575292 ?auto_575295 ) ) ( not ( = ?auto_575292 ?auto_575296 ) ) ( not ( = ?auto_575292 ?auto_575297 ) ) ( not ( = ?auto_575292 ?auto_575298 ) ) ( not ( = ?auto_575292 ?auto_575299 ) ) ( not ( = ?auto_575293 ?auto_575294 ) ) ( not ( = ?auto_575293 ?auto_575295 ) ) ( not ( = ?auto_575293 ?auto_575296 ) ) ( not ( = ?auto_575293 ?auto_575297 ) ) ( not ( = ?auto_575293 ?auto_575298 ) ) ( not ( = ?auto_575293 ?auto_575299 ) ) ( not ( = ?auto_575294 ?auto_575295 ) ) ( not ( = ?auto_575294 ?auto_575296 ) ) ( not ( = ?auto_575294 ?auto_575297 ) ) ( not ( = ?auto_575294 ?auto_575298 ) ) ( not ( = ?auto_575294 ?auto_575299 ) ) ( not ( = ?auto_575295 ?auto_575296 ) ) ( not ( = ?auto_575295 ?auto_575297 ) ) ( not ( = ?auto_575295 ?auto_575298 ) ) ( not ( = ?auto_575295 ?auto_575299 ) ) ( not ( = ?auto_575296 ?auto_575297 ) ) ( not ( = ?auto_575296 ?auto_575298 ) ) ( not ( = ?auto_575296 ?auto_575299 ) ) ( not ( = ?auto_575297 ?auto_575298 ) ) ( not ( = ?auto_575297 ?auto_575299 ) ) ( not ( = ?auto_575298 ?auto_575299 ) ) ( ON ?auto_575297 ?auto_575298 ) ( ON ?auto_575296 ?auto_575297 ) ( ON ?auto_575295 ?auto_575296 ) ( CLEAR ?auto_575293 ) ( ON ?auto_575294 ?auto_575295 ) ( CLEAR ?auto_575294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_575285 ?auto_575286 ?auto_575287 ?auto_575288 ?auto_575289 ?auto_575290 ?auto_575291 ?auto_575292 ?auto_575293 ?auto_575294 )
      ( MAKE-14PILE ?auto_575285 ?auto_575286 ?auto_575287 ?auto_575288 ?auto_575289 ?auto_575290 ?auto_575291 ?auto_575292 ?auto_575293 ?auto_575294 ?auto_575295 ?auto_575296 ?auto_575297 ?auto_575298 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_575343 - BLOCK
      ?auto_575344 - BLOCK
      ?auto_575345 - BLOCK
      ?auto_575346 - BLOCK
      ?auto_575347 - BLOCK
      ?auto_575348 - BLOCK
      ?auto_575349 - BLOCK
      ?auto_575350 - BLOCK
      ?auto_575351 - BLOCK
      ?auto_575352 - BLOCK
      ?auto_575353 - BLOCK
      ?auto_575354 - BLOCK
      ?auto_575355 - BLOCK
      ?auto_575356 - BLOCK
    )
    :vars
    (
      ?auto_575357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_575356 ?auto_575357 ) ( ON-TABLE ?auto_575343 ) ( ON ?auto_575344 ?auto_575343 ) ( ON ?auto_575345 ?auto_575344 ) ( ON ?auto_575346 ?auto_575345 ) ( ON ?auto_575347 ?auto_575346 ) ( ON ?auto_575348 ?auto_575347 ) ( ON ?auto_575349 ?auto_575348 ) ( ON ?auto_575350 ?auto_575349 ) ( not ( = ?auto_575343 ?auto_575344 ) ) ( not ( = ?auto_575343 ?auto_575345 ) ) ( not ( = ?auto_575343 ?auto_575346 ) ) ( not ( = ?auto_575343 ?auto_575347 ) ) ( not ( = ?auto_575343 ?auto_575348 ) ) ( not ( = ?auto_575343 ?auto_575349 ) ) ( not ( = ?auto_575343 ?auto_575350 ) ) ( not ( = ?auto_575343 ?auto_575351 ) ) ( not ( = ?auto_575343 ?auto_575352 ) ) ( not ( = ?auto_575343 ?auto_575353 ) ) ( not ( = ?auto_575343 ?auto_575354 ) ) ( not ( = ?auto_575343 ?auto_575355 ) ) ( not ( = ?auto_575343 ?auto_575356 ) ) ( not ( = ?auto_575343 ?auto_575357 ) ) ( not ( = ?auto_575344 ?auto_575345 ) ) ( not ( = ?auto_575344 ?auto_575346 ) ) ( not ( = ?auto_575344 ?auto_575347 ) ) ( not ( = ?auto_575344 ?auto_575348 ) ) ( not ( = ?auto_575344 ?auto_575349 ) ) ( not ( = ?auto_575344 ?auto_575350 ) ) ( not ( = ?auto_575344 ?auto_575351 ) ) ( not ( = ?auto_575344 ?auto_575352 ) ) ( not ( = ?auto_575344 ?auto_575353 ) ) ( not ( = ?auto_575344 ?auto_575354 ) ) ( not ( = ?auto_575344 ?auto_575355 ) ) ( not ( = ?auto_575344 ?auto_575356 ) ) ( not ( = ?auto_575344 ?auto_575357 ) ) ( not ( = ?auto_575345 ?auto_575346 ) ) ( not ( = ?auto_575345 ?auto_575347 ) ) ( not ( = ?auto_575345 ?auto_575348 ) ) ( not ( = ?auto_575345 ?auto_575349 ) ) ( not ( = ?auto_575345 ?auto_575350 ) ) ( not ( = ?auto_575345 ?auto_575351 ) ) ( not ( = ?auto_575345 ?auto_575352 ) ) ( not ( = ?auto_575345 ?auto_575353 ) ) ( not ( = ?auto_575345 ?auto_575354 ) ) ( not ( = ?auto_575345 ?auto_575355 ) ) ( not ( = ?auto_575345 ?auto_575356 ) ) ( not ( = ?auto_575345 ?auto_575357 ) ) ( not ( = ?auto_575346 ?auto_575347 ) ) ( not ( = ?auto_575346 ?auto_575348 ) ) ( not ( = ?auto_575346 ?auto_575349 ) ) ( not ( = ?auto_575346 ?auto_575350 ) ) ( not ( = ?auto_575346 ?auto_575351 ) ) ( not ( = ?auto_575346 ?auto_575352 ) ) ( not ( = ?auto_575346 ?auto_575353 ) ) ( not ( = ?auto_575346 ?auto_575354 ) ) ( not ( = ?auto_575346 ?auto_575355 ) ) ( not ( = ?auto_575346 ?auto_575356 ) ) ( not ( = ?auto_575346 ?auto_575357 ) ) ( not ( = ?auto_575347 ?auto_575348 ) ) ( not ( = ?auto_575347 ?auto_575349 ) ) ( not ( = ?auto_575347 ?auto_575350 ) ) ( not ( = ?auto_575347 ?auto_575351 ) ) ( not ( = ?auto_575347 ?auto_575352 ) ) ( not ( = ?auto_575347 ?auto_575353 ) ) ( not ( = ?auto_575347 ?auto_575354 ) ) ( not ( = ?auto_575347 ?auto_575355 ) ) ( not ( = ?auto_575347 ?auto_575356 ) ) ( not ( = ?auto_575347 ?auto_575357 ) ) ( not ( = ?auto_575348 ?auto_575349 ) ) ( not ( = ?auto_575348 ?auto_575350 ) ) ( not ( = ?auto_575348 ?auto_575351 ) ) ( not ( = ?auto_575348 ?auto_575352 ) ) ( not ( = ?auto_575348 ?auto_575353 ) ) ( not ( = ?auto_575348 ?auto_575354 ) ) ( not ( = ?auto_575348 ?auto_575355 ) ) ( not ( = ?auto_575348 ?auto_575356 ) ) ( not ( = ?auto_575348 ?auto_575357 ) ) ( not ( = ?auto_575349 ?auto_575350 ) ) ( not ( = ?auto_575349 ?auto_575351 ) ) ( not ( = ?auto_575349 ?auto_575352 ) ) ( not ( = ?auto_575349 ?auto_575353 ) ) ( not ( = ?auto_575349 ?auto_575354 ) ) ( not ( = ?auto_575349 ?auto_575355 ) ) ( not ( = ?auto_575349 ?auto_575356 ) ) ( not ( = ?auto_575349 ?auto_575357 ) ) ( not ( = ?auto_575350 ?auto_575351 ) ) ( not ( = ?auto_575350 ?auto_575352 ) ) ( not ( = ?auto_575350 ?auto_575353 ) ) ( not ( = ?auto_575350 ?auto_575354 ) ) ( not ( = ?auto_575350 ?auto_575355 ) ) ( not ( = ?auto_575350 ?auto_575356 ) ) ( not ( = ?auto_575350 ?auto_575357 ) ) ( not ( = ?auto_575351 ?auto_575352 ) ) ( not ( = ?auto_575351 ?auto_575353 ) ) ( not ( = ?auto_575351 ?auto_575354 ) ) ( not ( = ?auto_575351 ?auto_575355 ) ) ( not ( = ?auto_575351 ?auto_575356 ) ) ( not ( = ?auto_575351 ?auto_575357 ) ) ( not ( = ?auto_575352 ?auto_575353 ) ) ( not ( = ?auto_575352 ?auto_575354 ) ) ( not ( = ?auto_575352 ?auto_575355 ) ) ( not ( = ?auto_575352 ?auto_575356 ) ) ( not ( = ?auto_575352 ?auto_575357 ) ) ( not ( = ?auto_575353 ?auto_575354 ) ) ( not ( = ?auto_575353 ?auto_575355 ) ) ( not ( = ?auto_575353 ?auto_575356 ) ) ( not ( = ?auto_575353 ?auto_575357 ) ) ( not ( = ?auto_575354 ?auto_575355 ) ) ( not ( = ?auto_575354 ?auto_575356 ) ) ( not ( = ?auto_575354 ?auto_575357 ) ) ( not ( = ?auto_575355 ?auto_575356 ) ) ( not ( = ?auto_575355 ?auto_575357 ) ) ( not ( = ?auto_575356 ?auto_575357 ) ) ( ON ?auto_575355 ?auto_575356 ) ( ON ?auto_575354 ?auto_575355 ) ( ON ?auto_575353 ?auto_575354 ) ( ON ?auto_575352 ?auto_575353 ) ( CLEAR ?auto_575350 ) ( ON ?auto_575351 ?auto_575352 ) ( CLEAR ?auto_575351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_575343 ?auto_575344 ?auto_575345 ?auto_575346 ?auto_575347 ?auto_575348 ?auto_575349 ?auto_575350 ?auto_575351 )
      ( MAKE-14PILE ?auto_575343 ?auto_575344 ?auto_575345 ?auto_575346 ?auto_575347 ?auto_575348 ?auto_575349 ?auto_575350 ?auto_575351 ?auto_575352 ?auto_575353 ?auto_575354 ?auto_575355 ?auto_575356 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_575401 - BLOCK
      ?auto_575402 - BLOCK
      ?auto_575403 - BLOCK
      ?auto_575404 - BLOCK
      ?auto_575405 - BLOCK
      ?auto_575406 - BLOCK
      ?auto_575407 - BLOCK
      ?auto_575408 - BLOCK
      ?auto_575409 - BLOCK
      ?auto_575410 - BLOCK
      ?auto_575411 - BLOCK
      ?auto_575412 - BLOCK
      ?auto_575413 - BLOCK
      ?auto_575414 - BLOCK
    )
    :vars
    (
      ?auto_575415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_575414 ?auto_575415 ) ( ON-TABLE ?auto_575401 ) ( ON ?auto_575402 ?auto_575401 ) ( ON ?auto_575403 ?auto_575402 ) ( ON ?auto_575404 ?auto_575403 ) ( ON ?auto_575405 ?auto_575404 ) ( ON ?auto_575406 ?auto_575405 ) ( ON ?auto_575407 ?auto_575406 ) ( not ( = ?auto_575401 ?auto_575402 ) ) ( not ( = ?auto_575401 ?auto_575403 ) ) ( not ( = ?auto_575401 ?auto_575404 ) ) ( not ( = ?auto_575401 ?auto_575405 ) ) ( not ( = ?auto_575401 ?auto_575406 ) ) ( not ( = ?auto_575401 ?auto_575407 ) ) ( not ( = ?auto_575401 ?auto_575408 ) ) ( not ( = ?auto_575401 ?auto_575409 ) ) ( not ( = ?auto_575401 ?auto_575410 ) ) ( not ( = ?auto_575401 ?auto_575411 ) ) ( not ( = ?auto_575401 ?auto_575412 ) ) ( not ( = ?auto_575401 ?auto_575413 ) ) ( not ( = ?auto_575401 ?auto_575414 ) ) ( not ( = ?auto_575401 ?auto_575415 ) ) ( not ( = ?auto_575402 ?auto_575403 ) ) ( not ( = ?auto_575402 ?auto_575404 ) ) ( not ( = ?auto_575402 ?auto_575405 ) ) ( not ( = ?auto_575402 ?auto_575406 ) ) ( not ( = ?auto_575402 ?auto_575407 ) ) ( not ( = ?auto_575402 ?auto_575408 ) ) ( not ( = ?auto_575402 ?auto_575409 ) ) ( not ( = ?auto_575402 ?auto_575410 ) ) ( not ( = ?auto_575402 ?auto_575411 ) ) ( not ( = ?auto_575402 ?auto_575412 ) ) ( not ( = ?auto_575402 ?auto_575413 ) ) ( not ( = ?auto_575402 ?auto_575414 ) ) ( not ( = ?auto_575402 ?auto_575415 ) ) ( not ( = ?auto_575403 ?auto_575404 ) ) ( not ( = ?auto_575403 ?auto_575405 ) ) ( not ( = ?auto_575403 ?auto_575406 ) ) ( not ( = ?auto_575403 ?auto_575407 ) ) ( not ( = ?auto_575403 ?auto_575408 ) ) ( not ( = ?auto_575403 ?auto_575409 ) ) ( not ( = ?auto_575403 ?auto_575410 ) ) ( not ( = ?auto_575403 ?auto_575411 ) ) ( not ( = ?auto_575403 ?auto_575412 ) ) ( not ( = ?auto_575403 ?auto_575413 ) ) ( not ( = ?auto_575403 ?auto_575414 ) ) ( not ( = ?auto_575403 ?auto_575415 ) ) ( not ( = ?auto_575404 ?auto_575405 ) ) ( not ( = ?auto_575404 ?auto_575406 ) ) ( not ( = ?auto_575404 ?auto_575407 ) ) ( not ( = ?auto_575404 ?auto_575408 ) ) ( not ( = ?auto_575404 ?auto_575409 ) ) ( not ( = ?auto_575404 ?auto_575410 ) ) ( not ( = ?auto_575404 ?auto_575411 ) ) ( not ( = ?auto_575404 ?auto_575412 ) ) ( not ( = ?auto_575404 ?auto_575413 ) ) ( not ( = ?auto_575404 ?auto_575414 ) ) ( not ( = ?auto_575404 ?auto_575415 ) ) ( not ( = ?auto_575405 ?auto_575406 ) ) ( not ( = ?auto_575405 ?auto_575407 ) ) ( not ( = ?auto_575405 ?auto_575408 ) ) ( not ( = ?auto_575405 ?auto_575409 ) ) ( not ( = ?auto_575405 ?auto_575410 ) ) ( not ( = ?auto_575405 ?auto_575411 ) ) ( not ( = ?auto_575405 ?auto_575412 ) ) ( not ( = ?auto_575405 ?auto_575413 ) ) ( not ( = ?auto_575405 ?auto_575414 ) ) ( not ( = ?auto_575405 ?auto_575415 ) ) ( not ( = ?auto_575406 ?auto_575407 ) ) ( not ( = ?auto_575406 ?auto_575408 ) ) ( not ( = ?auto_575406 ?auto_575409 ) ) ( not ( = ?auto_575406 ?auto_575410 ) ) ( not ( = ?auto_575406 ?auto_575411 ) ) ( not ( = ?auto_575406 ?auto_575412 ) ) ( not ( = ?auto_575406 ?auto_575413 ) ) ( not ( = ?auto_575406 ?auto_575414 ) ) ( not ( = ?auto_575406 ?auto_575415 ) ) ( not ( = ?auto_575407 ?auto_575408 ) ) ( not ( = ?auto_575407 ?auto_575409 ) ) ( not ( = ?auto_575407 ?auto_575410 ) ) ( not ( = ?auto_575407 ?auto_575411 ) ) ( not ( = ?auto_575407 ?auto_575412 ) ) ( not ( = ?auto_575407 ?auto_575413 ) ) ( not ( = ?auto_575407 ?auto_575414 ) ) ( not ( = ?auto_575407 ?auto_575415 ) ) ( not ( = ?auto_575408 ?auto_575409 ) ) ( not ( = ?auto_575408 ?auto_575410 ) ) ( not ( = ?auto_575408 ?auto_575411 ) ) ( not ( = ?auto_575408 ?auto_575412 ) ) ( not ( = ?auto_575408 ?auto_575413 ) ) ( not ( = ?auto_575408 ?auto_575414 ) ) ( not ( = ?auto_575408 ?auto_575415 ) ) ( not ( = ?auto_575409 ?auto_575410 ) ) ( not ( = ?auto_575409 ?auto_575411 ) ) ( not ( = ?auto_575409 ?auto_575412 ) ) ( not ( = ?auto_575409 ?auto_575413 ) ) ( not ( = ?auto_575409 ?auto_575414 ) ) ( not ( = ?auto_575409 ?auto_575415 ) ) ( not ( = ?auto_575410 ?auto_575411 ) ) ( not ( = ?auto_575410 ?auto_575412 ) ) ( not ( = ?auto_575410 ?auto_575413 ) ) ( not ( = ?auto_575410 ?auto_575414 ) ) ( not ( = ?auto_575410 ?auto_575415 ) ) ( not ( = ?auto_575411 ?auto_575412 ) ) ( not ( = ?auto_575411 ?auto_575413 ) ) ( not ( = ?auto_575411 ?auto_575414 ) ) ( not ( = ?auto_575411 ?auto_575415 ) ) ( not ( = ?auto_575412 ?auto_575413 ) ) ( not ( = ?auto_575412 ?auto_575414 ) ) ( not ( = ?auto_575412 ?auto_575415 ) ) ( not ( = ?auto_575413 ?auto_575414 ) ) ( not ( = ?auto_575413 ?auto_575415 ) ) ( not ( = ?auto_575414 ?auto_575415 ) ) ( ON ?auto_575413 ?auto_575414 ) ( ON ?auto_575412 ?auto_575413 ) ( ON ?auto_575411 ?auto_575412 ) ( ON ?auto_575410 ?auto_575411 ) ( ON ?auto_575409 ?auto_575410 ) ( CLEAR ?auto_575407 ) ( ON ?auto_575408 ?auto_575409 ) ( CLEAR ?auto_575408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_575401 ?auto_575402 ?auto_575403 ?auto_575404 ?auto_575405 ?auto_575406 ?auto_575407 ?auto_575408 )
      ( MAKE-14PILE ?auto_575401 ?auto_575402 ?auto_575403 ?auto_575404 ?auto_575405 ?auto_575406 ?auto_575407 ?auto_575408 ?auto_575409 ?auto_575410 ?auto_575411 ?auto_575412 ?auto_575413 ?auto_575414 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_575459 - BLOCK
      ?auto_575460 - BLOCK
      ?auto_575461 - BLOCK
      ?auto_575462 - BLOCK
      ?auto_575463 - BLOCK
      ?auto_575464 - BLOCK
      ?auto_575465 - BLOCK
      ?auto_575466 - BLOCK
      ?auto_575467 - BLOCK
      ?auto_575468 - BLOCK
      ?auto_575469 - BLOCK
      ?auto_575470 - BLOCK
      ?auto_575471 - BLOCK
      ?auto_575472 - BLOCK
    )
    :vars
    (
      ?auto_575473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_575472 ?auto_575473 ) ( ON-TABLE ?auto_575459 ) ( ON ?auto_575460 ?auto_575459 ) ( ON ?auto_575461 ?auto_575460 ) ( ON ?auto_575462 ?auto_575461 ) ( ON ?auto_575463 ?auto_575462 ) ( ON ?auto_575464 ?auto_575463 ) ( not ( = ?auto_575459 ?auto_575460 ) ) ( not ( = ?auto_575459 ?auto_575461 ) ) ( not ( = ?auto_575459 ?auto_575462 ) ) ( not ( = ?auto_575459 ?auto_575463 ) ) ( not ( = ?auto_575459 ?auto_575464 ) ) ( not ( = ?auto_575459 ?auto_575465 ) ) ( not ( = ?auto_575459 ?auto_575466 ) ) ( not ( = ?auto_575459 ?auto_575467 ) ) ( not ( = ?auto_575459 ?auto_575468 ) ) ( not ( = ?auto_575459 ?auto_575469 ) ) ( not ( = ?auto_575459 ?auto_575470 ) ) ( not ( = ?auto_575459 ?auto_575471 ) ) ( not ( = ?auto_575459 ?auto_575472 ) ) ( not ( = ?auto_575459 ?auto_575473 ) ) ( not ( = ?auto_575460 ?auto_575461 ) ) ( not ( = ?auto_575460 ?auto_575462 ) ) ( not ( = ?auto_575460 ?auto_575463 ) ) ( not ( = ?auto_575460 ?auto_575464 ) ) ( not ( = ?auto_575460 ?auto_575465 ) ) ( not ( = ?auto_575460 ?auto_575466 ) ) ( not ( = ?auto_575460 ?auto_575467 ) ) ( not ( = ?auto_575460 ?auto_575468 ) ) ( not ( = ?auto_575460 ?auto_575469 ) ) ( not ( = ?auto_575460 ?auto_575470 ) ) ( not ( = ?auto_575460 ?auto_575471 ) ) ( not ( = ?auto_575460 ?auto_575472 ) ) ( not ( = ?auto_575460 ?auto_575473 ) ) ( not ( = ?auto_575461 ?auto_575462 ) ) ( not ( = ?auto_575461 ?auto_575463 ) ) ( not ( = ?auto_575461 ?auto_575464 ) ) ( not ( = ?auto_575461 ?auto_575465 ) ) ( not ( = ?auto_575461 ?auto_575466 ) ) ( not ( = ?auto_575461 ?auto_575467 ) ) ( not ( = ?auto_575461 ?auto_575468 ) ) ( not ( = ?auto_575461 ?auto_575469 ) ) ( not ( = ?auto_575461 ?auto_575470 ) ) ( not ( = ?auto_575461 ?auto_575471 ) ) ( not ( = ?auto_575461 ?auto_575472 ) ) ( not ( = ?auto_575461 ?auto_575473 ) ) ( not ( = ?auto_575462 ?auto_575463 ) ) ( not ( = ?auto_575462 ?auto_575464 ) ) ( not ( = ?auto_575462 ?auto_575465 ) ) ( not ( = ?auto_575462 ?auto_575466 ) ) ( not ( = ?auto_575462 ?auto_575467 ) ) ( not ( = ?auto_575462 ?auto_575468 ) ) ( not ( = ?auto_575462 ?auto_575469 ) ) ( not ( = ?auto_575462 ?auto_575470 ) ) ( not ( = ?auto_575462 ?auto_575471 ) ) ( not ( = ?auto_575462 ?auto_575472 ) ) ( not ( = ?auto_575462 ?auto_575473 ) ) ( not ( = ?auto_575463 ?auto_575464 ) ) ( not ( = ?auto_575463 ?auto_575465 ) ) ( not ( = ?auto_575463 ?auto_575466 ) ) ( not ( = ?auto_575463 ?auto_575467 ) ) ( not ( = ?auto_575463 ?auto_575468 ) ) ( not ( = ?auto_575463 ?auto_575469 ) ) ( not ( = ?auto_575463 ?auto_575470 ) ) ( not ( = ?auto_575463 ?auto_575471 ) ) ( not ( = ?auto_575463 ?auto_575472 ) ) ( not ( = ?auto_575463 ?auto_575473 ) ) ( not ( = ?auto_575464 ?auto_575465 ) ) ( not ( = ?auto_575464 ?auto_575466 ) ) ( not ( = ?auto_575464 ?auto_575467 ) ) ( not ( = ?auto_575464 ?auto_575468 ) ) ( not ( = ?auto_575464 ?auto_575469 ) ) ( not ( = ?auto_575464 ?auto_575470 ) ) ( not ( = ?auto_575464 ?auto_575471 ) ) ( not ( = ?auto_575464 ?auto_575472 ) ) ( not ( = ?auto_575464 ?auto_575473 ) ) ( not ( = ?auto_575465 ?auto_575466 ) ) ( not ( = ?auto_575465 ?auto_575467 ) ) ( not ( = ?auto_575465 ?auto_575468 ) ) ( not ( = ?auto_575465 ?auto_575469 ) ) ( not ( = ?auto_575465 ?auto_575470 ) ) ( not ( = ?auto_575465 ?auto_575471 ) ) ( not ( = ?auto_575465 ?auto_575472 ) ) ( not ( = ?auto_575465 ?auto_575473 ) ) ( not ( = ?auto_575466 ?auto_575467 ) ) ( not ( = ?auto_575466 ?auto_575468 ) ) ( not ( = ?auto_575466 ?auto_575469 ) ) ( not ( = ?auto_575466 ?auto_575470 ) ) ( not ( = ?auto_575466 ?auto_575471 ) ) ( not ( = ?auto_575466 ?auto_575472 ) ) ( not ( = ?auto_575466 ?auto_575473 ) ) ( not ( = ?auto_575467 ?auto_575468 ) ) ( not ( = ?auto_575467 ?auto_575469 ) ) ( not ( = ?auto_575467 ?auto_575470 ) ) ( not ( = ?auto_575467 ?auto_575471 ) ) ( not ( = ?auto_575467 ?auto_575472 ) ) ( not ( = ?auto_575467 ?auto_575473 ) ) ( not ( = ?auto_575468 ?auto_575469 ) ) ( not ( = ?auto_575468 ?auto_575470 ) ) ( not ( = ?auto_575468 ?auto_575471 ) ) ( not ( = ?auto_575468 ?auto_575472 ) ) ( not ( = ?auto_575468 ?auto_575473 ) ) ( not ( = ?auto_575469 ?auto_575470 ) ) ( not ( = ?auto_575469 ?auto_575471 ) ) ( not ( = ?auto_575469 ?auto_575472 ) ) ( not ( = ?auto_575469 ?auto_575473 ) ) ( not ( = ?auto_575470 ?auto_575471 ) ) ( not ( = ?auto_575470 ?auto_575472 ) ) ( not ( = ?auto_575470 ?auto_575473 ) ) ( not ( = ?auto_575471 ?auto_575472 ) ) ( not ( = ?auto_575471 ?auto_575473 ) ) ( not ( = ?auto_575472 ?auto_575473 ) ) ( ON ?auto_575471 ?auto_575472 ) ( ON ?auto_575470 ?auto_575471 ) ( ON ?auto_575469 ?auto_575470 ) ( ON ?auto_575468 ?auto_575469 ) ( ON ?auto_575467 ?auto_575468 ) ( ON ?auto_575466 ?auto_575467 ) ( CLEAR ?auto_575464 ) ( ON ?auto_575465 ?auto_575466 ) ( CLEAR ?auto_575465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_575459 ?auto_575460 ?auto_575461 ?auto_575462 ?auto_575463 ?auto_575464 ?auto_575465 )
      ( MAKE-14PILE ?auto_575459 ?auto_575460 ?auto_575461 ?auto_575462 ?auto_575463 ?auto_575464 ?auto_575465 ?auto_575466 ?auto_575467 ?auto_575468 ?auto_575469 ?auto_575470 ?auto_575471 ?auto_575472 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_575517 - BLOCK
      ?auto_575518 - BLOCK
      ?auto_575519 - BLOCK
      ?auto_575520 - BLOCK
      ?auto_575521 - BLOCK
      ?auto_575522 - BLOCK
      ?auto_575523 - BLOCK
      ?auto_575524 - BLOCK
      ?auto_575525 - BLOCK
      ?auto_575526 - BLOCK
      ?auto_575527 - BLOCK
      ?auto_575528 - BLOCK
      ?auto_575529 - BLOCK
      ?auto_575530 - BLOCK
    )
    :vars
    (
      ?auto_575531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_575530 ?auto_575531 ) ( ON-TABLE ?auto_575517 ) ( ON ?auto_575518 ?auto_575517 ) ( ON ?auto_575519 ?auto_575518 ) ( ON ?auto_575520 ?auto_575519 ) ( ON ?auto_575521 ?auto_575520 ) ( not ( = ?auto_575517 ?auto_575518 ) ) ( not ( = ?auto_575517 ?auto_575519 ) ) ( not ( = ?auto_575517 ?auto_575520 ) ) ( not ( = ?auto_575517 ?auto_575521 ) ) ( not ( = ?auto_575517 ?auto_575522 ) ) ( not ( = ?auto_575517 ?auto_575523 ) ) ( not ( = ?auto_575517 ?auto_575524 ) ) ( not ( = ?auto_575517 ?auto_575525 ) ) ( not ( = ?auto_575517 ?auto_575526 ) ) ( not ( = ?auto_575517 ?auto_575527 ) ) ( not ( = ?auto_575517 ?auto_575528 ) ) ( not ( = ?auto_575517 ?auto_575529 ) ) ( not ( = ?auto_575517 ?auto_575530 ) ) ( not ( = ?auto_575517 ?auto_575531 ) ) ( not ( = ?auto_575518 ?auto_575519 ) ) ( not ( = ?auto_575518 ?auto_575520 ) ) ( not ( = ?auto_575518 ?auto_575521 ) ) ( not ( = ?auto_575518 ?auto_575522 ) ) ( not ( = ?auto_575518 ?auto_575523 ) ) ( not ( = ?auto_575518 ?auto_575524 ) ) ( not ( = ?auto_575518 ?auto_575525 ) ) ( not ( = ?auto_575518 ?auto_575526 ) ) ( not ( = ?auto_575518 ?auto_575527 ) ) ( not ( = ?auto_575518 ?auto_575528 ) ) ( not ( = ?auto_575518 ?auto_575529 ) ) ( not ( = ?auto_575518 ?auto_575530 ) ) ( not ( = ?auto_575518 ?auto_575531 ) ) ( not ( = ?auto_575519 ?auto_575520 ) ) ( not ( = ?auto_575519 ?auto_575521 ) ) ( not ( = ?auto_575519 ?auto_575522 ) ) ( not ( = ?auto_575519 ?auto_575523 ) ) ( not ( = ?auto_575519 ?auto_575524 ) ) ( not ( = ?auto_575519 ?auto_575525 ) ) ( not ( = ?auto_575519 ?auto_575526 ) ) ( not ( = ?auto_575519 ?auto_575527 ) ) ( not ( = ?auto_575519 ?auto_575528 ) ) ( not ( = ?auto_575519 ?auto_575529 ) ) ( not ( = ?auto_575519 ?auto_575530 ) ) ( not ( = ?auto_575519 ?auto_575531 ) ) ( not ( = ?auto_575520 ?auto_575521 ) ) ( not ( = ?auto_575520 ?auto_575522 ) ) ( not ( = ?auto_575520 ?auto_575523 ) ) ( not ( = ?auto_575520 ?auto_575524 ) ) ( not ( = ?auto_575520 ?auto_575525 ) ) ( not ( = ?auto_575520 ?auto_575526 ) ) ( not ( = ?auto_575520 ?auto_575527 ) ) ( not ( = ?auto_575520 ?auto_575528 ) ) ( not ( = ?auto_575520 ?auto_575529 ) ) ( not ( = ?auto_575520 ?auto_575530 ) ) ( not ( = ?auto_575520 ?auto_575531 ) ) ( not ( = ?auto_575521 ?auto_575522 ) ) ( not ( = ?auto_575521 ?auto_575523 ) ) ( not ( = ?auto_575521 ?auto_575524 ) ) ( not ( = ?auto_575521 ?auto_575525 ) ) ( not ( = ?auto_575521 ?auto_575526 ) ) ( not ( = ?auto_575521 ?auto_575527 ) ) ( not ( = ?auto_575521 ?auto_575528 ) ) ( not ( = ?auto_575521 ?auto_575529 ) ) ( not ( = ?auto_575521 ?auto_575530 ) ) ( not ( = ?auto_575521 ?auto_575531 ) ) ( not ( = ?auto_575522 ?auto_575523 ) ) ( not ( = ?auto_575522 ?auto_575524 ) ) ( not ( = ?auto_575522 ?auto_575525 ) ) ( not ( = ?auto_575522 ?auto_575526 ) ) ( not ( = ?auto_575522 ?auto_575527 ) ) ( not ( = ?auto_575522 ?auto_575528 ) ) ( not ( = ?auto_575522 ?auto_575529 ) ) ( not ( = ?auto_575522 ?auto_575530 ) ) ( not ( = ?auto_575522 ?auto_575531 ) ) ( not ( = ?auto_575523 ?auto_575524 ) ) ( not ( = ?auto_575523 ?auto_575525 ) ) ( not ( = ?auto_575523 ?auto_575526 ) ) ( not ( = ?auto_575523 ?auto_575527 ) ) ( not ( = ?auto_575523 ?auto_575528 ) ) ( not ( = ?auto_575523 ?auto_575529 ) ) ( not ( = ?auto_575523 ?auto_575530 ) ) ( not ( = ?auto_575523 ?auto_575531 ) ) ( not ( = ?auto_575524 ?auto_575525 ) ) ( not ( = ?auto_575524 ?auto_575526 ) ) ( not ( = ?auto_575524 ?auto_575527 ) ) ( not ( = ?auto_575524 ?auto_575528 ) ) ( not ( = ?auto_575524 ?auto_575529 ) ) ( not ( = ?auto_575524 ?auto_575530 ) ) ( not ( = ?auto_575524 ?auto_575531 ) ) ( not ( = ?auto_575525 ?auto_575526 ) ) ( not ( = ?auto_575525 ?auto_575527 ) ) ( not ( = ?auto_575525 ?auto_575528 ) ) ( not ( = ?auto_575525 ?auto_575529 ) ) ( not ( = ?auto_575525 ?auto_575530 ) ) ( not ( = ?auto_575525 ?auto_575531 ) ) ( not ( = ?auto_575526 ?auto_575527 ) ) ( not ( = ?auto_575526 ?auto_575528 ) ) ( not ( = ?auto_575526 ?auto_575529 ) ) ( not ( = ?auto_575526 ?auto_575530 ) ) ( not ( = ?auto_575526 ?auto_575531 ) ) ( not ( = ?auto_575527 ?auto_575528 ) ) ( not ( = ?auto_575527 ?auto_575529 ) ) ( not ( = ?auto_575527 ?auto_575530 ) ) ( not ( = ?auto_575527 ?auto_575531 ) ) ( not ( = ?auto_575528 ?auto_575529 ) ) ( not ( = ?auto_575528 ?auto_575530 ) ) ( not ( = ?auto_575528 ?auto_575531 ) ) ( not ( = ?auto_575529 ?auto_575530 ) ) ( not ( = ?auto_575529 ?auto_575531 ) ) ( not ( = ?auto_575530 ?auto_575531 ) ) ( ON ?auto_575529 ?auto_575530 ) ( ON ?auto_575528 ?auto_575529 ) ( ON ?auto_575527 ?auto_575528 ) ( ON ?auto_575526 ?auto_575527 ) ( ON ?auto_575525 ?auto_575526 ) ( ON ?auto_575524 ?auto_575525 ) ( ON ?auto_575523 ?auto_575524 ) ( CLEAR ?auto_575521 ) ( ON ?auto_575522 ?auto_575523 ) ( CLEAR ?auto_575522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_575517 ?auto_575518 ?auto_575519 ?auto_575520 ?auto_575521 ?auto_575522 )
      ( MAKE-14PILE ?auto_575517 ?auto_575518 ?auto_575519 ?auto_575520 ?auto_575521 ?auto_575522 ?auto_575523 ?auto_575524 ?auto_575525 ?auto_575526 ?auto_575527 ?auto_575528 ?auto_575529 ?auto_575530 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_575575 - BLOCK
      ?auto_575576 - BLOCK
      ?auto_575577 - BLOCK
      ?auto_575578 - BLOCK
      ?auto_575579 - BLOCK
      ?auto_575580 - BLOCK
      ?auto_575581 - BLOCK
      ?auto_575582 - BLOCK
      ?auto_575583 - BLOCK
      ?auto_575584 - BLOCK
      ?auto_575585 - BLOCK
      ?auto_575586 - BLOCK
      ?auto_575587 - BLOCK
      ?auto_575588 - BLOCK
    )
    :vars
    (
      ?auto_575589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_575588 ?auto_575589 ) ( ON-TABLE ?auto_575575 ) ( ON ?auto_575576 ?auto_575575 ) ( ON ?auto_575577 ?auto_575576 ) ( ON ?auto_575578 ?auto_575577 ) ( not ( = ?auto_575575 ?auto_575576 ) ) ( not ( = ?auto_575575 ?auto_575577 ) ) ( not ( = ?auto_575575 ?auto_575578 ) ) ( not ( = ?auto_575575 ?auto_575579 ) ) ( not ( = ?auto_575575 ?auto_575580 ) ) ( not ( = ?auto_575575 ?auto_575581 ) ) ( not ( = ?auto_575575 ?auto_575582 ) ) ( not ( = ?auto_575575 ?auto_575583 ) ) ( not ( = ?auto_575575 ?auto_575584 ) ) ( not ( = ?auto_575575 ?auto_575585 ) ) ( not ( = ?auto_575575 ?auto_575586 ) ) ( not ( = ?auto_575575 ?auto_575587 ) ) ( not ( = ?auto_575575 ?auto_575588 ) ) ( not ( = ?auto_575575 ?auto_575589 ) ) ( not ( = ?auto_575576 ?auto_575577 ) ) ( not ( = ?auto_575576 ?auto_575578 ) ) ( not ( = ?auto_575576 ?auto_575579 ) ) ( not ( = ?auto_575576 ?auto_575580 ) ) ( not ( = ?auto_575576 ?auto_575581 ) ) ( not ( = ?auto_575576 ?auto_575582 ) ) ( not ( = ?auto_575576 ?auto_575583 ) ) ( not ( = ?auto_575576 ?auto_575584 ) ) ( not ( = ?auto_575576 ?auto_575585 ) ) ( not ( = ?auto_575576 ?auto_575586 ) ) ( not ( = ?auto_575576 ?auto_575587 ) ) ( not ( = ?auto_575576 ?auto_575588 ) ) ( not ( = ?auto_575576 ?auto_575589 ) ) ( not ( = ?auto_575577 ?auto_575578 ) ) ( not ( = ?auto_575577 ?auto_575579 ) ) ( not ( = ?auto_575577 ?auto_575580 ) ) ( not ( = ?auto_575577 ?auto_575581 ) ) ( not ( = ?auto_575577 ?auto_575582 ) ) ( not ( = ?auto_575577 ?auto_575583 ) ) ( not ( = ?auto_575577 ?auto_575584 ) ) ( not ( = ?auto_575577 ?auto_575585 ) ) ( not ( = ?auto_575577 ?auto_575586 ) ) ( not ( = ?auto_575577 ?auto_575587 ) ) ( not ( = ?auto_575577 ?auto_575588 ) ) ( not ( = ?auto_575577 ?auto_575589 ) ) ( not ( = ?auto_575578 ?auto_575579 ) ) ( not ( = ?auto_575578 ?auto_575580 ) ) ( not ( = ?auto_575578 ?auto_575581 ) ) ( not ( = ?auto_575578 ?auto_575582 ) ) ( not ( = ?auto_575578 ?auto_575583 ) ) ( not ( = ?auto_575578 ?auto_575584 ) ) ( not ( = ?auto_575578 ?auto_575585 ) ) ( not ( = ?auto_575578 ?auto_575586 ) ) ( not ( = ?auto_575578 ?auto_575587 ) ) ( not ( = ?auto_575578 ?auto_575588 ) ) ( not ( = ?auto_575578 ?auto_575589 ) ) ( not ( = ?auto_575579 ?auto_575580 ) ) ( not ( = ?auto_575579 ?auto_575581 ) ) ( not ( = ?auto_575579 ?auto_575582 ) ) ( not ( = ?auto_575579 ?auto_575583 ) ) ( not ( = ?auto_575579 ?auto_575584 ) ) ( not ( = ?auto_575579 ?auto_575585 ) ) ( not ( = ?auto_575579 ?auto_575586 ) ) ( not ( = ?auto_575579 ?auto_575587 ) ) ( not ( = ?auto_575579 ?auto_575588 ) ) ( not ( = ?auto_575579 ?auto_575589 ) ) ( not ( = ?auto_575580 ?auto_575581 ) ) ( not ( = ?auto_575580 ?auto_575582 ) ) ( not ( = ?auto_575580 ?auto_575583 ) ) ( not ( = ?auto_575580 ?auto_575584 ) ) ( not ( = ?auto_575580 ?auto_575585 ) ) ( not ( = ?auto_575580 ?auto_575586 ) ) ( not ( = ?auto_575580 ?auto_575587 ) ) ( not ( = ?auto_575580 ?auto_575588 ) ) ( not ( = ?auto_575580 ?auto_575589 ) ) ( not ( = ?auto_575581 ?auto_575582 ) ) ( not ( = ?auto_575581 ?auto_575583 ) ) ( not ( = ?auto_575581 ?auto_575584 ) ) ( not ( = ?auto_575581 ?auto_575585 ) ) ( not ( = ?auto_575581 ?auto_575586 ) ) ( not ( = ?auto_575581 ?auto_575587 ) ) ( not ( = ?auto_575581 ?auto_575588 ) ) ( not ( = ?auto_575581 ?auto_575589 ) ) ( not ( = ?auto_575582 ?auto_575583 ) ) ( not ( = ?auto_575582 ?auto_575584 ) ) ( not ( = ?auto_575582 ?auto_575585 ) ) ( not ( = ?auto_575582 ?auto_575586 ) ) ( not ( = ?auto_575582 ?auto_575587 ) ) ( not ( = ?auto_575582 ?auto_575588 ) ) ( not ( = ?auto_575582 ?auto_575589 ) ) ( not ( = ?auto_575583 ?auto_575584 ) ) ( not ( = ?auto_575583 ?auto_575585 ) ) ( not ( = ?auto_575583 ?auto_575586 ) ) ( not ( = ?auto_575583 ?auto_575587 ) ) ( not ( = ?auto_575583 ?auto_575588 ) ) ( not ( = ?auto_575583 ?auto_575589 ) ) ( not ( = ?auto_575584 ?auto_575585 ) ) ( not ( = ?auto_575584 ?auto_575586 ) ) ( not ( = ?auto_575584 ?auto_575587 ) ) ( not ( = ?auto_575584 ?auto_575588 ) ) ( not ( = ?auto_575584 ?auto_575589 ) ) ( not ( = ?auto_575585 ?auto_575586 ) ) ( not ( = ?auto_575585 ?auto_575587 ) ) ( not ( = ?auto_575585 ?auto_575588 ) ) ( not ( = ?auto_575585 ?auto_575589 ) ) ( not ( = ?auto_575586 ?auto_575587 ) ) ( not ( = ?auto_575586 ?auto_575588 ) ) ( not ( = ?auto_575586 ?auto_575589 ) ) ( not ( = ?auto_575587 ?auto_575588 ) ) ( not ( = ?auto_575587 ?auto_575589 ) ) ( not ( = ?auto_575588 ?auto_575589 ) ) ( ON ?auto_575587 ?auto_575588 ) ( ON ?auto_575586 ?auto_575587 ) ( ON ?auto_575585 ?auto_575586 ) ( ON ?auto_575584 ?auto_575585 ) ( ON ?auto_575583 ?auto_575584 ) ( ON ?auto_575582 ?auto_575583 ) ( ON ?auto_575581 ?auto_575582 ) ( ON ?auto_575580 ?auto_575581 ) ( CLEAR ?auto_575578 ) ( ON ?auto_575579 ?auto_575580 ) ( CLEAR ?auto_575579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_575575 ?auto_575576 ?auto_575577 ?auto_575578 ?auto_575579 )
      ( MAKE-14PILE ?auto_575575 ?auto_575576 ?auto_575577 ?auto_575578 ?auto_575579 ?auto_575580 ?auto_575581 ?auto_575582 ?auto_575583 ?auto_575584 ?auto_575585 ?auto_575586 ?auto_575587 ?auto_575588 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_575633 - BLOCK
      ?auto_575634 - BLOCK
      ?auto_575635 - BLOCK
      ?auto_575636 - BLOCK
      ?auto_575637 - BLOCK
      ?auto_575638 - BLOCK
      ?auto_575639 - BLOCK
      ?auto_575640 - BLOCK
      ?auto_575641 - BLOCK
      ?auto_575642 - BLOCK
      ?auto_575643 - BLOCK
      ?auto_575644 - BLOCK
      ?auto_575645 - BLOCK
      ?auto_575646 - BLOCK
    )
    :vars
    (
      ?auto_575647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_575646 ?auto_575647 ) ( ON-TABLE ?auto_575633 ) ( ON ?auto_575634 ?auto_575633 ) ( ON ?auto_575635 ?auto_575634 ) ( not ( = ?auto_575633 ?auto_575634 ) ) ( not ( = ?auto_575633 ?auto_575635 ) ) ( not ( = ?auto_575633 ?auto_575636 ) ) ( not ( = ?auto_575633 ?auto_575637 ) ) ( not ( = ?auto_575633 ?auto_575638 ) ) ( not ( = ?auto_575633 ?auto_575639 ) ) ( not ( = ?auto_575633 ?auto_575640 ) ) ( not ( = ?auto_575633 ?auto_575641 ) ) ( not ( = ?auto_575633 ?auto_575642 ) ) ( not ( = ?auto_575633 ?auto_575643 ) ) ( not ( = ?auto_575633 ?auto_575644 ) ) ( not ( = ?auto_575633 ?auto_575645 ) ) ( not ( = ?auto_575633 ?auto_575646 ) ) ( not ( = ?auto_575633 ?auto_575647 ) ) ( not ( = ?auto_575634 ?auto_575635 ) ) ( not ( = ?auto_575634 ?auto_575636 ) ) ( not ( = ?auto_575634 ?auto_575637 ) ) ( not ( = ?auto_575634 ?auto_575638 ) ) ( not ( = ?auto_575634 ?auto_575639 ) ) ( not ( = ?auto_575634 ?auto_575640 ) ) ( not ( = ?auto_575634 ?auto_575641 ) ) ( not ( = ?auto_575634 ?auto_575642 ) ) ( not ( = ?auto_575634 ?auto_575643 ) ) ( not ( = ?auto_575634 ?auto_575644 ) ) ( not ( = ?auto_575634 ?auto_575645 ) ) ( not ( = ?auto_575634 ?auto_575646 ) ) ( not ( = ?auto_575634 ?auto_575647 ) ) ( not ( = ?auto_575635 ?auto_575636 ) ) ( not ( = ?auto_575635 ?auto_575637 ) ) ( not ( = ?auto_575635 ?auto_575638 ) ) ( not ( = ?auto_575635 ?auto_575639 ) ) ( not ( = ?auto_575635 ?auto_575640 ) ) ( not ( = ?auto_575635 ?auto_575641 ) ) ( not ( = ?auto_575635 ?auto_575642 ) ) ( not ( = ?auto_575635 ?auto_575643 ) ) ( not ( = ?auto_575635 ?auto_575644 ) ) ( not ( = ?auto_575635 ?auto_575645 ) ) ( not ( = ?auto_575635 ?auto_575646 ) ) ( not ( = ?auto_575635 ?auto_575647 ) ) ( not ( = ?auto_575636 ?auto_575637 ) ) ( not ( = ?auto_575636 ?auto_575638 ) ) ( not ( = ?auto_575636 ?auto_575639 ) ) ( not ( = ?auto_575636 ?auto_575640 ) ) ( not ( = ?auto_575636 ?auto_575641 ) ) ( not ( = ?auto_575636 ?auto_575642 ) ) ( not ( = ?auto_575636 ?auto_575643 ) ) ( not ( = ?auto_575636 ?auto_575644 ) ) ( not ( = ?auto_575636 ?auto_575645 ) ) ( not ( = ?auto_575636 ?auto_575646 ) ) ( not ( = ?auto_575636 ?auto_575647 ) ) ( not ( = ?auto_575637 ?auto_575638 ) ) ( not ( = ?auto_575637 ?auto_575639 ) ) ( not ( = ?auto_575637 ?auto_575640 ) ) ( not ( = ?auto_575637 ?auto_575641 ) ) ( not ( = ?auto_575637 ?auto_575642 ) ) ( not ( = ?auto_575637 ?auto_575643 ) ) ( not ( = ?auto_575637 ?auto_575644 ) ) ( not ( = ?auto_575637 ?auto_575645 ) ) ( not ( = ?auto_575637 ?auto_575646 ) ) ( not ( = ?auto_575637 ?auto_575647 ) ) ( not ( = ?auto_575638 ?auto_575639 ) ) ( not ( = ?auto_575638 ?auto_575640 ) ) ( not ( = ?auto_575638 ?auto_575641 ) ) ( not ( = ?auto_575638 ?auto_575642 ) ) ( not ( = ?auto_575638 ?auto_575643 ) ) ( not ( = ?auto_575638 ?auto_575644 ) ) ( not ( = ?auto_575638 ?auto_575645 ) ) ( not ( = ?auto_575638 ?auto_575646 ) ) ( not ( = ?auto_575638 ?auto_575647 ) ) ( not ( = ?auto_575639 ?auto_575640 ) ) ( not ( = ?auto_575639 ?auto_575641 ) ) ( not ( = ?auto_575639 ?auto_575642 ) ) ( not ( = ?auto_575639 ?auto_575643 ) ) ( not ( = ?auto_575639 ?auto_575644 ) ) ( not ( = ?auto_575639 ?auto_575645 ) ) ( not ( = ?auto_575639 ?auto_575646 ) ) ( not ( = ?auto_575639 ?auto_575647 ) ) ( not ( = ?auto_575640 ?auto_575641 ) ) ( not ( = ?auto_575640 ?auto_575642 ) ) ( not ( = ?auto_575640 ?auto_575643 ) ) ( not ( = ?auto_575640 ?auto_575644 ) ) ( not ( = ?auto_575640 ?auto_575645 ) ) ( not ( = ?auto_575640 ?auto_575646 ) ) ( not ( = ?auto_575640 ?auto_575647 ) ) ( not ( = ?auto_575641 ?auto_575642 ) ) ( not ( = ?auto_575641 ?auto_575643 ) ) ( not ( = ?auto_575641 ?auto_575644 ) ) ( not ( = ?auto_575641 ?auto_575645 ) ) ( not ( = ?auto_575641 ?auto_575646 ) ) ( not ( = ?auto_575641 ?auto_575647 ) ) ( not ( = ?auto_575642 ?auto_575643 ) ) ( not ( = ?auto_575642 ?auto_575644 ) ) ( not ( = ?auto_575642 ?auto_575645 ) ) ( not ( = ?auto_575642 ?auto_575646 ) ) ( not ( = ?auto_575642 ?auto_575647 ) ) ( not ( = ?auto_575643 ?auto_575644 ) ) ( not ( = ?auto_575643 ?auto_575645 ) ) ( not ( = ?auto_575643 ?auto_575646 ) ) ( not ( = ?auto_575643 ?auto_575647 ) ) ( not ( = ?auto_575644 ?auto_575645 ) ) ( not ( = ?auto_575644 ?auto_575646 ) ) ( not ( = ?auto_575644 ?auto_575647 ) ) ( not ( = ?auto_575645 ?auto_575646 ) ) ( not ( = ?auto_575645 ?auto_575647 ) ) ( not ( = ?auto_575646 ?auto_575647 ) ) ( ON ?auto_575645 ?auto_575646 ) ( ON ?auto_575644 ?auto_575645 ) ( ON ?auto_575643 ?auto_575644 ) ( ON ?auto_575642 ?auto_575643 ) ( ON ?auto_575641 ?auto_575642 ) ( ON ?auto_575640 ?auto_575641 ) ( ON ?auto_575639 ?auto_575640 ) ( ON ?auto_575638 ?auto_575639 ) ( ON ?auto_575637 ?auto_575638 ) ( CLEAR ?auto_575635 ) ( ON ?auto_575636 ?auto_575637 ) ( CLEAR ?auto_575636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_575633 ?auto_575634 ?auto_575635 ?auto_575636 )
      ( MAKE-14PILE ?auto_575633 ?auto_575634 ?auto_575635 ?auto_575636 ?auto_575637 ?auto_575638 ?auto_575639 ?auto_575640 ?auto_575641 ?auto_575642 ?auto_575643 ?auto_575644 ?auto_575645 ?auto_575646 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_575691 - BLOCK
      ?auto_575692 - BLOCK
      ?auto_575693 - BLOCK
      ?auto_575694 - BLOCK
      ?auto_575695 - BLOCK
      ?auto_575696 - BLOCK
      ?auto_575697 - BLOCK
      ?auto_575698 - BLOCK
      ?auto_575699 - BLOCK
      ?auto_575700 - BLOCK
      ?auto_575701 - BLOCK
      ?auto_575702 - BLOCK
      ?auto_575703 - BLOCK
      ?auto_575704 - BLOCK
    )
    :vars
    (
      ?auto_575705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_575704 ?auto_575705 ) ( ON-TABLE ?auto_575691 ) ( ON ?auto_575692 ?auto_575691 ) ( not ( = ?auto_575691 ?auto_575692 ) ) ( not ( = ?auto_575691 ?auto_575693 ) ) ( not ( = ?auto_575691 ?auto_575694 ) ) ( not ( = ?auto_575691 ?auto_575695 ) ) ( not ( = ?auto_575691 ?auto_575696 ) ) ( not ( = ?auto_575691 ?auto_575697 ) ) ( not ( = ?auto_575691 ?auto_575698 ) ) ( not ( = ?auto_575691 ?auto_575699 ) ) ( not ( = ?auto_575691 ?auto_575700 ) ) ( not ( = ?auto_575691 ?auto_575701 ) ) ( not ( = ?auto_575691 ?auto_575702 ) ) ( not ( = ?auto_575691 ?auto_575703 ) ) ( not ( = ?auto_575691 ?auto_575704 ) ) ( not ( = ?auto_575691 ?auto_575705 ) ) ( not ( = ?auto_575692 ?auto_575693 ) ) ( not ( = ?auto_575692 ?auto_575694 ) ) ( not ( = ?auto_575692 ?auto_575695 ) ) ( not ( = ?auto_575692 ?auto_575696 ) ) ( not ( = ?auto_575692 ?auto_575697 ) ) ( not ( = ?auto_575692 ?auto_575698 ) ) ( not ( = ?auto_575692 ?auto_575699 ) ) ( not ( = ?auto_575692 ?auto_575700 ) ) ( not ( = ?auto_575692 ?auto_575701 ) ) ( not ( = ?auto_575692 ?auto_575702 ) ) ( not ( = ?auto_575692 ?auto_575703 ) ) ( not ( = ?auto_575692 ?auto_575704 ) ) ( not ( = ?auto_575692 ?auto_575705 ) ) ( not ( = ?auto_575693 ?auto_575694 ) ) ( not ( = ?auto_575693 ?auto_575695 ) ) ( not ( = ?auto_575693 ?auto_575696 ) ) ( not ( = ?auto_575693 ?auto_575697 ) ) ( not ( = ?auto_575693 ?auto_575698 ) ) ( not ( = ?auto_575693 ?auto_575699 ) ) ( not ( = ?auto_575693 ?auto_575700 ) ) ( not ( = ?auto_575693 ?auto_575701 ) ) ( not ( = ?auto_575693 ?auto_575702 ) ) ( not ( = ?auto_575693 ?auto_575703 ) ) ( not ( = ?auto_575693 ?auto_575704 ) ) ( not ( = ?auto_575693 ?auto_575705 ) ) ( not ( = ?auto_575694 ?auto_575695 ) ) ( not ( = ?auto_575694 ?auto_575696 ) ) ( not ( = ?auto_575694 ?auto_575697 ) ) ( not ( = ?auto_575694 ?auto_575698 ) ) ( not ( = ?auto_575694 ?auto_575699 ) ) ( not ( = ?auto_575694 ?auto_575700 ) ) ( not ( = ?auto_575694 ?auto_575701 ) ) ( not ( = ?auto_575694 ?auto_575702 ) ) ( not ( = ?auto_575694 ?auto_575703 ) ) ( not ( = ?auto_575694 ?auto_575704 ) ) ( not ( = ?auto_575694 ?auto_575705 ) ) ( not ( = ?auto_575695 ?auto_575696 ) ) ( not ( = ?auto_575695 ?auto_575697 ) ) ( not ( = ?auto_575695 ?auto_575698 ) ) ( not ( = ?auto_575695 ?auto_575699 ) ) ( not ( = ?auto_575695 ?auto_575700 ) ) ( not ( = ?auto_575695 ?auto_575701 ) ) ( not ( = ?auto_575695 ?auto_575702 ) ) ( not ( = ?auto_575695 ?auto_575703 ) ) ( not ( = ?auto_575695 ?auto_575704 ) ) ( not ( = ?auto_575695 ?auto_575705 ) ) ( not ( = ?auto_575696 ?auto_575697 ) ) ( not ( = ?auto_575696 ?auto_575698 ) ) ( not ( = ?auto_575696 ?auto_575699 ) ) ( not ( = ?auto_575696 ?auto_575700 ) ) ( not ( = ?auto_575696 ?auto_575701 ) ) ( not ( = ?auto_575696 ?auto_575702 ) ) ( not ( = ?auto_575696 ?auto_575703 ) ) ( not ( = ?auto_575696 ?auto_575704 ) ) ( not ( = ?auto_575696 ?auto_575705 ) ) ( not ( = ?auto_575697 ?auto_575698 ) ) ( not ( = ?auto_575697 ?auto_575699 ) ) ( not ( = ?auto_575697 ?auto_575700 ) ) ( not ( = ?auto_575697 ?auto_575701 ) ) ( not ( = ?auto_575697 ?auto_575702 ) ) ( not ( = ?auto_575697 ?auto_575703 ) ) ( not ( = ?auto_575697 ?auto_575704 ) ) ( not ( = ?auto_575697 ?auto_575705 ) ) ( not ( = ?auto_575698 ?auto_575699 ) ) ( not ( = ?auto_575698 ?auto_575700 ) ) ( not ( = ?auto_575698 ?auto_575701 ) ) ( not ( = ?auto_575698 ?auto_575702 ) ) ( not ( = ?auto_575698 ?auto_575703 ) ) ( not ( = ?auto_575698 ?auto_575704 ) ) ( not ( = ?auto_575698 ?auto_575705 ) ) ( not ( = ?auto_575699 ?auto_575700 ) ) ( not ( = ?auto_575699 ?auto_575701 ) ) ( not ( = ?auto_575699 ?auto_575702 ) ) ( not ( = ?auto_575699 ?auto_575703 ) ) ( not ( = ?auto_575699 ?auto_575704 ) ) ( not ( = ?auto_575699 ?auto_575705 ) ) ( not ( = ?auto_575700 ?auto_575701 ) ) ( not ( = ?auto_575700 ?auto_575702 ) ) ( not ( = ?auto_575700 ?auto_575703 ) ) ( not ( = ?auto_575700 ?auto_575704 ) ) ( not ( = ?auto_575700 ?auto_575705 ) ) ( not ( = ?auto_575701 ?auto_575702 ) ) ( not ( = ?auto_575701 ?auto_575703 ) ) ( not ( = ?auto_575701 ?auto_575704 ) ) ( not ( = ?auto_575701 ?auto_575705 ) ) ( not ( = ?auto_575702 ?auto_575703 ) ) ( not ( = ?auto_575702 ?auto_575704 ) ) ( not ( = ?auto_575702 ?auto_575705 ) ) ( not ( = ?auto_575703 ?auto_575704 ) ) ( not ( = ?auto_575703 ?auto_575705 ) ) ( not ( = ?auto_575704 ?auto_575705 ) ) ( ON ?auto_575703 ?auto_575704 ) ( ON ?auto_575702 ?auto_575703 ) ( ON ?auto_575701 ?auto_575702 ) ( ON ?auto_575700 ?auto_575701 ) ( ON ?auto_575699 ?auto_575700 ) ( ON ?auto_575698 ?auto_575699 ) ( ON ?auto_575697 ?auto_575698 ) ( ON ?auto_575696 ?auto_575697 ) ( ON ?auto_575695 ?auto_575696 ) ( ON ?auto_575694 ?auto_575695 ) ( CLEAR ?auto_575692 ) ( ON ?auto_575693 ?auto_575694 ) ( CLEAR ?auto_575693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_575691 ?auto_575692 ?auto_575693 )
      ( MAKE-14PILE ?auto_575691 ?auto_575692 ?auto_575693 ?auto_575694 ?auto_575695 ?auto_575696 ?auto_575697 ?auto_575698 ?auto_575699 ?auto_575700 ?auto_575701 ?auto_575702 ?auto_575703 ?auto_575704 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_575749 - BLOCK
      ?auto_575750 - BLOCK
      ?auto_575751 - BLOCK
      ?auto_575752 - BLOCK
      ?auto_575753 - BLOCK
      ?auto_575754 - BLOCK
      ?auto_575755 - BLOCK
      ?auto_575756 - BLOCK
      ?auto_575757 - BLOCK
      ?auto_575758 - BLOCK
      ?auto_575759 - BLOCK
      ?auto_575760 - BLOCK
      ?auto_575761 - BLOCK
      ?auto_575762 - BLOCK
    )
    :vars
    (
      ?auto_575763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_575762 ?auto_575763 ) ( ON-TABLE ?auto_575749 ) ( not ( = ?auto_575749 ?auto_575750 ) ) ( not ( = ?auto_575749 ?auto_575751 ) ) ( not ( = ?auto_575749 ?auto_575752 ) ) ( not ( = ?auto_575749 ?auto_575753 ) ) ( not ( = ?auto_575749 ?auto_575754 ) ) ( not ( = ?auto_575749 ?auto_575755 ) ) ( not ( = ?auto_575749 ?auto_575756 ) ) ( not ( = ?auto_575749 ?auto_575757 ) ) ( not ( = ?auto_575749 ?auto_575758 ) ) ( not ( = ?auto_575749 ?auto_575759 ) ) ( not ( = ?auto_575749 ?auto_575760 ) ) ( not ( = ?auto_575749 ?auto_575761 ) ) ( not ( = ?auto_575749 ?auto_575762 ) ) ( not ( = ?auto_575749 ?auto_575763 ) ) ( not ( = ?auto_575750 ?auto_575751 ) ) ( not ( = ?auto_575750 ?auto_575752 ) ) ( not ( = ?auto_575750 ?auto_575753 ) ) ( not ( = ?auto_575750 ?auto_575754 ) ) ( not ( = ?auto_575750 ?auto_575755 ) ) ( not ( = ?auto_575750 ?auto_575756 ) ) ( not ( = ?auto_575750 ?auto_575757 ) ) ( not ( = ?auto_575750 ?auto_575758 ) ) ( not ( = ?auto_575750 ?auto_575759 ) ) ( not ( = ?auto_575750 ?auto_575760 ) ) ( not ( = ?auto_575750 ?auto_575761 ) ) ( not ( = ?auto_575750 ?auto_575762 ) ) ( not ( = ?auto_575750 ?auto_575763 ) ) ( not ( = ?auto_575751 ?auto_575752 ) ) ( not ( = ?auto_575751 ?auto_575753 ) ) ( not ( = ?auto_575751 ?auto_575754 ) ) ( not ( = ?auto_575751 ?auto_575755 ) ) ( not ( = ?auto_575751 ?auto_575756 ) ) ( not ( = ?auto_575751 ?auto_575757 ) ) ( not ( = ?auto_575751 ?auto_575758 ) ) ( not ( = ?auto_575751 ?auto_575759 ) ) ( not ( = ?auto_575751 ?auto_575760 ) ) ( not ( = ?auto_575751 ?auto_575761 ) ) ( not ( = ?auto_575751 ?auto_575762 ) ) ( not ( = ?auto_575751 ?auto_575763 ) ) ( not ( = ?auto_575752 ?auto_575753 ) ) ( not ( = ?auto_575752 ?auto_575754 ) ) ( not ( = ?auto_575752 ?auto_575755 ) ) ( not ( = ?auto_575752 ?auto_575756 ) ) ( not ( = ?auto_575752 ?auto_575757 ) ) ( not ( = ?auto_575752 ?auto_575758 ) ) ( not ( = ?auto_575752 ?auto_575759 ) ) ( not ( = ?auto_575752 ?auto_575760 ) ) ( not ( = ?auto_575752 ?auto_575761 ) ) ( not ( = ?auto_575752 ?auto_575762 ) ) ( not ( = ?auto_575752 ?auto_575763 ) ) ( not ( = ?auto_575753 ?auto_575754 ) ) ( not ( = ?auto_575753 ?auto_575755 ) ) ( not ( = ?auto_575753 ?auto_575756 ) ) ( not ( = ?auto_575753 ?auto_575757 ) ) ( not ( = ?auto_575753 ?auto_575758 ) ) ( not ( = ?auto_575753 ?auto_575759 ) ) ( not ( = ?auto_575753 ?auto_575760 ) ) ( not ( = ?auto_575753 ?auto_575761 ) ) ( not ( = ?auto_575753 ?auto_575762 ) ) ( not ( = ?auto_575753 ?auto_575763 ) ) ( not ( = ?auto_575754 ?auto_575755 ) ) ( not ( = ?auto_575754 ?auto_575756 ) ) ( not ( = ?auto_575754 ?auto_575757 ) ) ( not ( = ?auto_575754 ?auto_575758 ) ) ( not ( = ?auto_575754 ?auto_575759 ) ) ( not ( = ?auto_575754 ?auto_575760 ) ) ( not ( = ?auto_575754 ?auto_575761 ) ) ( not ( = ?auto_575754 ?auto_575762 ) ) ( not ( = ?auto_575754 ?auto_575763 ) ) ( not ( = ?auto_575755 ?auto_575756 ) ) ( not ( = ?auto_575755 ?auto_575757 ) ) ( not ( = ?auto_575755 ?auto_575758 ) ) ( not ( = ?auto_575755 ?auto_575759 ) ) ( not ( = ?auto_575755 ?auto_575760 ) ) ( not ( = ?auto_575755 ?auto_575761 ) ) ( not ( = ?auto_575755 ?auto_575762 ) ) ( not ( = ?auto_575755 ?auto_575763 ) ) ( not ( = ?auto_575756 ?auto_575757 ) ) ( not ( = ?auto_575756 ?auto_575758 ) ) ( not ( = ?auto_575756 ?auto_575759 ) ) ( not ( = ?auto_575756 ?auto_575760 ) ) ( not ( = ?auto_575756 ?auto_575761 ) ) ( not ( = ?auto_575756 ?auto_575762 ) ) ( not ( = ?auto_575756 ?auto_575763 ) ) ( not ( = ?auto_575757 ?auto_575758 ) ) ( not ( = ?auto_575757 ?auto_575759 ) ) ( not ( = ?auto_575757 ?auto_575760 ) ) ( not ( = ?auto_575757 ?auto_575761 ) ) ( not ( = ?auto_575757 ?auto_575762 ) ) ( not ( = ?auto_575757 ?auto_575763 ) ) ( not ( = ?auto_575758 ?auto_575759 ) ) ( not ( = ?auto_575758 ?auto_575760 ) ) ( not ( = ?auto_575758 ?auto_575761 ) ) ( not ( = ?auto_575758 ?auto_575762 ) ) ( not ( = ?auto_575758 ?auto_575763 ) ) ( not ( = ?auto_575759 ?auto_575760 ) ) ( not ( = ?auto_575759 ?auto_575761 ) ) ( not ( = ?auto_575759 ?auto_575762 ) ) ( not ( = ?auto_575759 ?auto_575763 ) ) ( not ( = ?auto_575760 ?auto_575761 ) ) ( not ( = ?auto_575760 ?auto_575762 ) ) ( not ( = ?auto_575760 ?auto_575763 ) ) ( not ( = ?auto_575761 ?auto_575762 ) ) ( not ( = ?auto_575761 ?auto_575763 ) ) ( not ( = ?auto_575762 ?auto_575763 ) ) ( ON ?auto_575761 ?auto_575762 ) ( ON ?auto_575760 ?auto_575761 ) ( ON ?auto_575759 ?auto_575760 ) ( ON ?auto_575758 ?auto_575759 ) ( ON ?auto_575757 ?auto_575758 ) ( ON ?auto_575756 ?auto_575757 ) ( ON ?auto_575755 ?auto_575756 ) ( ON ?auto_575754 ?auto_575755 ) ( ON ?auto_575753 ?auto_575754 ) ( ON ?auto_575752 ?auto_575753 ) ( ON ?auto_575751 ?auto_575752 ) ( CLEAR ?auto_575749 ) ( ON ?auto_575750 ?auto_575751 ) ( CLEAR ?auto_575750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_575749 ?auto_575750 )
      ( MAKE-14PILE ?auto_575749 ?auto_575750 ?auto_575751 ?auto_575752 ?auto_575753 ?auto_575754 ?auto_575755 ?auto_575756 ?auto_575757 ?auto_575758 ?auto_575759 ?auto_575760 ?auto_575761 ?auto_575762 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_575807 - BLOCK
      ?auto_575808 - BLOCK
      ?auto_575809 - BLOCK
      ?auto_575810 - BLOCK
      ?auto_575811 - BLOCK
      ?auto_575812 - BLOCK
      ?auto_575813 - BLOCK
      ?auto_575814 - BLOCK
      ?auto_575815 - BLOCK
      ?auto_575816 - BLOCK
      ?auto_575817 - BLOCK
      ?auto_575818 - BLOCK
      ?auto_575819 - BLOCK
      ?auto_575820 - BLOCK
    )
    :vars
    (
      ?auto_575821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_575820 ?auto_575821 ) ( not ( = ?auto_575807 ?auto_575808 ) ) ( not ( = ?auto_575807 ?auto_575809 ) ) ( not ( = ?auto_575807 ?auto_575810 ) ) ( not ( = ?auto_575807 ?auto_575811 ) ) ( not ( = ?auto_575807 ?auto_575812 ) ) ( not ( = ?auto_575807 ?auto_575813 ) ) ( not ( = ?auto_575807 ?auto_575814 ) ) ( not ( = ?auto_575807 ?auto_575815 ) ) ( not ( = ?auto_575807 ?auto_575816 ) ) ( not ( = ?auto_575807 ?auto_575817 ) ) ( not ( = ?auto_575807 ?auto_575818 ) ) ( not ( = ?auto_575807 ?auto_575819 ) ) ( not ( = ?auto_575807 ?auto_575820 ) ) ( not ( = ?auto_575807 ?auto_575821 ) ) ( not ( = ?auto_575808 ?auto_575809 ) ) ( not ( = ?auto_575808 ?auto_575810 ) ) ( not ( = ?auto_575808 ?auto_575811 ) ) ( not ( = ?auto_575808 ?auto_575812 ) ) ( not ( = ?auto_575808 ?auto_575813 ) ) ( not ( = ?auto_575808 ?auto_575814 ) ) ( not ( = ?auto_575808 ?auto_575815 ) ) ( not ( = ?auto_575808 ?auto_575816 ) ) ( not ( = ?auto_575808 ?auto_575817 ) ) ( not ( = ?auto_575808 ?auto_575818 ) ) ( not ( = ?auto_575808 ?auto_575819 ) ) ( not ( = ?auto_575808 ?auto_575820 ) ) ( not ( = ?auto_575808 ?auto_575821 ) ) ( not ( = ?auto_575809 ?auto_575810 ) ) ( not ( = ?auto_575809 ?auto_575811 ) ) ( not ( = ?auto_575809 ?auto_575812 ) ) ( not ( = ?auto_575809 ?auto_575813 ) ) ( not ( = ?auto_575809 ?auto_575814 ) ) ( not ( = ?auto_575809 ?auto_575815 ) ) ( not ( = ?auto_575809 ?auto_575816 ) ) ( not ( = ?auto_575809 ?auto_575817 ) ) ( not ( = ?auto_575809 ?auto_575818 ) ) ( not ( = ?auto_575809 ?auto_575819 ) ) ( not ( = ?auto_575809 ?auto_575820 ) ) ( not ( = ?auto_575809 ?auto_575821 ) ) ( not ( = ?auto_575810 ?auto_575811 ) ) ( not ( = ?auto_575810 ?auto_575812 ) ) ( not ( = ?auto_575810 ?auto_575813 ) ) ( not ( = ?auto_575810 ?auto_575814 ) ) ( not ( = ?auto_575810 ?auto_575815 ) ) ( not ( = ?auto_575810 ?auto_575816 ) ) ( not ( = ?auto_575810 ?auto_575817 ) ) ( not ( = ?auto_575810 ?auto_575818 ) ) ( not ( = ?auto_575810 ?auto_575819 ) ) ( not ( = ?auto_575810 ?auto_575820 ) ) ( not ( = ?auto_575810 ?auto_575821 ) ) ( not ( = ?auto_575811 ?auto_575812 ) ) ( not ( = ?auto_575811 ?auto_575813 ) ) ( not ( = ?auto_575811 ?auto_575814 ) ) ( not ( = ?auto_575811 ?auto_575815 ) ) ( not ( = ?auto_575811 ?auto_575816 ) ) ( not ( = ?auto_575811 ?auto_575817 ) ) ( not ( = ?auto_575811 ?auto_575818 ) ) ( not ( = ?auto_575811 ?auto_575819 ) ) ( not ( = ?auto_575811 ?auto_575820 ) ) ( not ( = ?auto_575811 ?auto_575821 ) ) ( not ( = ?auto_575812 ?auto_575813 ) ) ( not ( = ?auto_575812 ?auto_575814 ) ) ( not ( = ?auto_575812 ?auto_575815 ) ) ( not ( = ?auto_575812 ?auto_575816 ) ) ( not ( = ?auto_575812 ?auto_575817 ) ) ( not ( = ?auto_575812 ?auto_575818 ) ) ( not ( = ?auto_575812 ?auto_575819 ) ) ( not ( = ?auto_575812 ?auto_575820 ) ) ( not ( = ?auto_575812 ?auto_575821 ) ) ( not ( = ?auto_575813 ?auto_575814 ) ) ( not ( = ?auto_575813 ?auto_575815 ) ) ( not ( = ?auto_575813 ?auto_575816 ) ) ( not ( = ?auto_575813 ?auto_575817 ) ) ( not ( = ?auto_575813 ?auto_575818 ) ) ( not ( = ?auto_575813 ?auto_575819 ) ) ( not ( = ?auto_575813 ?auto_575820 ) ) ( not ( = ?auto_575813 ?auto_575821 ) ) ( not ( = ?auto_575814 ?auto_575815 ) ) ( not ( = ?auto_575814 ?auto_575816 ) ) ( not ( = ?auto_575814 ?auto_575817 ) ) ( not ( = ?auto_575814 ?auto_575818 ) ) ( not ( = ?auto_575814 ?auto_575819 ) ) ( not ( = ?auto_575814 ?auto_575820 ) ) ( not ( = ?auto_575814 ?auto_575821 ) ) ( not ( = ?auto_575815 ?auto_575816 ) ) ( not ( = ?auto_575815 ?auto_575817 ) ) ( not ( = ?auto_575815 ?auto_575818 ) ) ( not ( = ?auto_575815 ?auto_575819 ) ) ( not ( = ?auto_575815 ?auto_575820 ) ) ( not ( = ?auto_575815 ?auto_575821 ) ) ( not ( = ?auto_575816 ?auto_575817 ) ) ( not ( = ?auto_575816 ?auto_575818 ) ) ( not ( = ?auto_575816 ?auto_575819 ) ) ( not ( = ?auto_575816 ?auto_575820 ) ) ( not ( = ?auto_575816 ?auto_575821 ) ) ( not ( = ?auto_575817 ?auto_575818 ) ) ( not ( = ?auto_575817 ?auto_575819 ) ) ( not ( = ?auto_575817 ?auto_575820 ) ) ( not ( = ?auto_575817 ?auto_575821 ) ) ( not ( = ?auto_575818 ?auto_575819 ) ) ( not ( = ?auto_575818 ?auto_575820 ) ) ( not ( = ?auto_575818 ?auto_575821 ) ) ( not ( = ?auto_575819 ?auto_575820 ) ) ( not ( = ?auto_575819 ?auto_575821 ) ) ( not ( = ?auto_575820 ?auto_575821 ) ) ( ON ?auto_575819 ?auto_575820 ) ( ON ?auto_575818 ?auto_575819 ) ( ON ?auto_575817 ?auto_575818 ) ( ON ?auto_575816 ?auto_575817 ) ( ON ?auto_575815 ?auto_575816 ) ( ON ?auto_575814 ?auto_575815 ) ( ON ?auto_575813 ?auto_575814 ) ( ON ?auto_575812 ?auto_575813 ) ( ON ?auto_575811 ?auto_575812 ) ( ON ?auto_575810 ?auto_575811 ) ( ON ?auto_575809 ?auto_575810 ) ( ON ?auto_575808 ?auto_575809 ) ( ON ?auto_575807 ?auto_575808 ) ( CLEAR ?auto_575807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_575807 )
      ( MAKE-14PILE ?auto_575807 ?auto_575808 ?auto_575809 ?auto_575810 ?auto_575811 ?auto_575812 ?auto_575813 ?auto_575814 ?auto_575815 ?auto_575816 ?auto_575817 ?auto_575818 ?auto_575819 ?auto_575820 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_575866 - BLOCK
      ?auto_575867 - BLOCK
      ?auto_575868 - BLOCK
      ?auto_575869 - BLOCK
      ?auto_575870 - BLOCK
      ?auto_575871 - BLOCK
      ?auto_575872 - BLOCK
      ?auto_575873 - BLOCK
      ?auto_575874 - BLOCK
      ?auto_575875 - BLOCK
      ?auto_575876 - BLOCK
      ?auto_575877 - BLOCK
      ?auto_575878 - BLOCK
      ?auto_575879 - BLOCK
      ?auto_575880 - BLOCK
    )
    :vars
    (
      ?auto_575881 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_575879 ) ( ON ?auto_575880 ?auto_575881 ) ( CLEAR ?auto_575880 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_575866 ) ( ON ?auto_575867 ?auto_575866 ) ( ON ?auto_575868 ?auto_575867 ) ( ON ?auto_575869 ?auto_575868 ) ( ON ?auto_575870 ?auto_575869 ) ( ON ?auto_575871 ?auto_575870 ) ( ON ?auto_575872 ?auto_575871 ) ( ON ?auto_575873 ?auto_575872 ) ( ON ?auto_575874 ?auto_575873 ) ( ON ?auto_575875 ?auto_575874 ) ( ON ?auto_575876 ?auto_575875 ) ( ON ?auto_575877 ?auto_575876 ) ( ON ?auto_575878 ?auto_575877 ) ( ON ?auto_575879 ?auto_575878 ) ( not ( = ?auto_575866 ?auto_575867 ) ) ( not ( = ?auto_575866 ?auto_575868 ) ) ( not ( = ?auto_575866 ?auto_575869 ) ) ( not ( = ?auto_575866 ?auto_575870 ) ) ( not ( = ?auto_575866 ?auto_575871 ) ) ( not ( = ?auto_575866 ?auto_575872 ) ) ( not ( = ?auto_575866 ?auto_575873 ) ) ( not ( = ?auto_575866 ?auto_575874 ) ) ( not ( = ?auto_575866 ?auto_575875 ) ) ( not ( = ?auto_575866 ?auto_575876 ) ) ( not ( = ?auto_575866 ?auto_575877 ) ) ( not ( = ?auto_575866 ?auto_575878 ) ) ( not ( = ?auto_575866 ?auto_575879 ) ) ( not ( = ?auto_575866 ?auto_575880 ) ) ( not ( = ?auto_575866 ?auto_575881 ) ) ( not ( = ?auto_575867 ?auto_575868 ) ) ( not ( = ?auto_575867 ?auto_575869 ) ) ( not ( = ?auto_575867 ?auto_575870 ) ) ( not ( = ?auto_575867 ?auto_575871 ) ) ( not ( = ?auto_575867 ?auto_575872 ) ) ( not ( = ?auto_575867 ?auto_575873 ) ) ( not ( = ?auto_575867 ?auto_575874 ) ) ( not ( = ?auto_575867 ?auto_575875 ) ) ( not ( = ?auto_575867 ?auto_575876 ) ) ( not ( = ?auto_575867 ?auto_575877 ) ) ( not ( = ?auto_575867 ?auto_575878 ) ) ( not ( = ?auto_575867 ?auto_575879 ) ) ( not ( = ?auto_575867 ?auto_575880 ) ) ( not ( = ?auto_575867 ?auto_575881 ) ) ( not ( = ?auto_575868 ?auto_575869 ) ) ( not ( = ?auto_575868 ?auto_575870 ) ) ( not ( = ?auto_575868 ?auto_575871 ) ) ( not ( = ?auto_575868 ?auto_575872 ) ) ( not ( = ?auto_575868 ?auto_575873 ) ) ( not ( = ?auto_575868 ?auto_575874 ) ) ( not ( = ?auto_575868 ?auto_575875 ) ) ( not ( = ?auto_575868 ?auto_575876 ) ) ( not ( = ?auto_575868 ?auto_575877 ) ) ( not ( = ?auto_575868 ?auto_575878 ) ) ( not ( = ?auto_575868 ?auto_575879 ) ) ( not ( = ?auto_575868 ?auto_575880 ) ) ( not ( = ?auto_575868 ?auto_575881 ) ) ( not ( = ?auto_575869 ?auto_575870 ) ) ( not ( = ?auto_575869 ?auto_575871 ) ) ( not ( = ?auto_575869 ?auto_575872 ) ) ( not ( = ?auto_575869 ?auto_575873 ) ) ( not ( = ?auto_575869 ?auto_575874 ) ) ( not ( = ?auto_575869 ?auto_575875 ) ) ( not ( = ?auto_575869 ?auto_575876 ) ) ( not ( = ?auto_575869 ?auto_575877 ) ) ( not ( = ?auto_575869 ?auto_575878 ) ) ( not ( = ?auto_575869 ?auto_575879 ) ) ( not ( = ?auto_575869 ?auto_575880 ) ) ( not ( = ?auto_575869 ?auto_575881 ) ) ( not ( = ?auto_575870 ?auto_575871 ) ) ( not ( = ?auto_575870 ?auto_575872 ) ) ( not ( = ?auto_575870 ?auto_575873 ) ) ( not ( = ?auto_575870 ?auto_575874 ) ) ( not ( = ?auto_575870 ?auto_575875 ) ) ( not ( = ?auto_575870 ?auto_575876 ) ) ( not ( = ?auto_575870 ?auto_575877 ) ) ( not ( = ?auto_575870 ?auto_575878 ) ) ( not ( = ?auto_575870 ?auto_575879 ) ) ( not ( = ?auto_575870 ?auto_575880 ) ) ( not ( = ?auto_575870 ?auto_575881 ) ) ( not ( = ?auto_575871 ?auto_575872 ) ) ( not ( = ?auto_575871 ?auto_575873 ) ) ( not ( = ?auto_575871 ?auto_575874 ) ) ( not ( = ?auto_575871 ?auto_575875 ) ) ( not ( = ?auto_575871 ?auto_575876 ) ) ( not ( = ?auto_575871 ?auto_575877 ) ) ( not ( = ?auto_575871 ?auto_575878 ) ) ( not ( = ?auto_575871 ?auto_575879 ) ) ( not ( = ?auto_575871 ?auto_575880 ) ) ( not ( = ?auto_575871 ?auto_575881 ) ) ( not ( = ?auto_575872 ?auto_575873 ) ) ( not ( = ?auto_575872 ?auto_575874 ) ) ( not ( = ?auto_575872 ?auto_575875 ) ) ( not ( = ?auto_575872 ?auto_575876 ) ) ( not ( = ?auto_575872 ?auto_575877 ) ) ( not ( = ?auto_575872 ?auto_575878 ) ) ( not ( = ?auto_575872 ?auto_575879 ) ) ( not ( = ?auto_575872 ?auto_575880 ) ) ( not ( = ?auto_575872 ?auto_575881 ) ) ( not ( = ?auto_575873 ?auto_575874 ) ) ( not ( = ?auto_575873 ?auto_575875 ) ) ( not ( = ?auto_575873 ?auto_575876 ) ) ( not ( = ?auto_575873 ?auto_575877 ) ) ( not ( = ?auto_575873 ?auto_575878 ) ) ( not ( = ?auto_575873 ?auto_575879 ) ) ( not ( = ?auto_575873 ?auto_575880 ) ) ( not ( = ?auto_575873 ?auto_575881 ) ) ( not ( = ?auto_575874 ?auto_575875 ) ) ( not ( = ?auto_575874 ?auto_575876 ) ) ( not ( = ?auto_575874 ?auto_575877 ) ) ( not ( = ?auto_575874 ?auto_575878 ) ) ( not ( = ?auto_575874 ?auto_575879 ) ) ( not ( = ?auto_575874 ?auto_575880 ) ) ( not ( = ?auto_575874 ?auto_575881 ) ) ( not ( = ?auto_575875 ?auto_575876 ) ) ( not ( = ?auto_575875 ?auto_575877 ) ) ( not ( = ?auto_575875 ?auto_575878 ) ) ( not ( = ?auto_575875 ?auto_575879 ) ) ( not ( = ?auto_575875 ?auto_575880 ) ) ( not ( = ?auto_575875 ?auto_575881 ) ) ( not ( = ?auto_575876 ?auto_575877 ) ) ( not ( = ?auto_575876 ?auto_575878 ) ) ( not ( = ?auto_575876 ?auto_575879 ) ) ( not ( = ?auto_575876 ?auto_575880 ) ) ( not ( = ?auto_575876 ?auto_575881 ) ) ( not ( = ?auto_575877 ?auto_575878 ) ) ( not ( = ?auto_575877 ?auto_575879 ) ) ( not ( = ?auto_575877 ?auto_575880 ) ) ( not ( = ?auto_575877 ?auto_575881 ) ) ( not ( = ?auto_575878 ?auto_575879 ) ) ( not ( = ?auto_575878 ?auto_575880 ) ) ( not ( = ?auto_575878 ?auto_575881 ) ) ( not ( = ?auto_575879 ?auto_575880 ) ) ( not ( = ?auto_575879 ?auto_575881 ) ) ( not ( = ?auto_575880 ?auto_575881 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_575880 ?auto_575881 )
      ( !STACK ?auto_575880 ?auto_575879 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_575928 - BLOCK
      ?auto_575929 - BLOCK
      ?auto_575930 - BLOCK
      ?auto_575931 - BLOCK
      ?auto_575932 - BLOCK
      ?auto_575933 - BLOCK
      ?auto_575934 - BLOCK
      ?auto_575935 - BLOCK
      ?auto_575936 - BLOCK
      ?auto_575937 - BLOCK
      ?auto_575938 - BLOCK
      ?auto_575939 - BLOCK
      ?auto_575940 - BLOCK
      ?auto_575941 - BLOCK
      ?auto_575942 - BLOCK
    )
    :vars
    (
      ?auto_575943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_575942 ?auto_575943 ) ( ON-TABLE ?auto_575928 ) ( ON ?auto_575929 ?auto_575928 ) ( ON ?auto_575930 ?auto_575929 ) ( ON ?auto_575931 ?auto_575930 ) ( ON ?auto_575932 ?auto_575931 ) ( ON ?auto_575933 ?auto_575932 ) ( ON ?auto_575934 ?auto_575933 ) ( ON ?auto_575935 ?auto_575934 ) ( ON ?auto_575936 ?auto_575935 ) ( ON ?auto_575937 ?auto_575936 ) ( ON ?auto_575938 ?auto_575937 ) ( ON ?auto_575939 ?auto_575938 ) ( ON ?auto_575940 ?auto_575939 ) ( not ( = ?auto_575928 ?auto_575929 ) ) ( not ( = ?auto_575928 ?auto_575930 ) ) ( not ( = ?auto_575928 ?auto_575931 ) ) ( not ( = ?auto_575928 ?auto_575932 ) ) ( not ( = ?auto_575928 ?auto_575933 ) ) ( not ( = ?auto_575928 ?auto_575934 ) ) ( not ( = ?auto_575928 ?auto_575935 ) ) ( not ( = ?auto_575928 ?auto_575936 ) ) ( not ( = ?auto_575928 ?auto_575937 ) ) ( not ( = ?auto_575928 ?auto_575938 ) ) ( not ( = ?auto_575928 ?auto_575939 ) ) ( not ( = ?auto_575928 ?auto_575940 ) ) ( not ( = ?auto_575928 ?auto_575941 ) ) ( not ( = ?auto_575928 ?auto_575942 ) ) ( not ( = ?auto_575928 ?auto_575943 ) ) ( not ( = ?auto_575929 ?auto_575930 ) ) ( not ( = ?auto_575929 ?auto_575931 ) ) ( not ( = ?auto_575929 ?auto_575932 ) ) ( not ( = ?auto_575929 ?auto_575933 ) ) ( not ( = ?auto_575929 ?auto_575934 ) ) ( not ( = ?auto_575929 ?auto_575935 ) ) ( not ( = ?auto_575929 ?auto_575936 ) ) ( not ( = ?auto_575929 ?auto_575937 ) ) ( not ( = ?auto_575929 ?auto_575938 ) ) ( not ( = ?auto_575929 ?auto_575939 ) ) ( not ( = ?auto_575929 ?auto_575940 ) ) ( not ( = ?auto_575929 ?auto_575941 ) ) ( not ( = ?auto_575929 ?auto_575942 ) ) ( not ( = ?auto_575929 ?auto_575943 ) ) ( not ( = ?auto_575930 ?auto_575931 ) ) ( not ( = ?auto_575930 ?auto_575932 ) ) ( not ( = ?auto_575930 ?auto_575933 ) ) ( not ( = ?auto_575930 ?auto_575934 ) ) ( not ( = ?auto_575930 ?auto_575935 ) ) ( not ( = ?auto_575930 ?auto_575936 ) ) ( not ( = ?auto_575930 ?auto_575937 ) ) ( not ( = ?auto_575930 ?auto_575938 ) ) ( not ( = ?auto_575930 ?auto_575939 ) ) ( not ( = ?auto_575930 ?auto_575940 ) ) ( not ( = ?auto_575930 ?auto_575941 ) ) ( not ( = ?auto_575930 ?auto_575942 ) ) ( not ( = ?auto_575930 ?auto_575943 ) ) ( not ( = ?auto_575931 ?auto_575932 ) ) ( not ( = ?auto_575931 ?auto_575933 ) ) ( not ( = ?auto_575931 ?auto_575934 ) ) ( not ( = ?auto_575931 ?auto_575935 ) ) ( not ( = ?auto_575931 ?auto_575936 ) ) ( not ( = ?auto_575931 ?auto_575937 ) ) ( not ( = ?auto_575931 ?auto_575938 ) ) ( not ( = ?auto_575931 ?auto_575939 ) ) ( not ( = ?auto_575931 ?auto_575940 ) ) ( not ( = ?auto_575931 ?auto_575941 ) ) ( not ( = ?auto_575931 ?auto_575942 ) ) ( not ( = ?auto_575931 ?auto_575943 ) ) ( not ( = ?auto_575932 ?auto_575933 ) ) ( not ( = ?auto_575932 ?auto_575934 ) ) ( not ( = ?auto_575932 ?auto_575935 ) ) ( not ( = ?auto_575932 ?auto_575936 ) ) ( not ( = ?auto_575932 ?auto_575937 ) ) ( not ( = ?auto_575932 ?auto_575938 ) ) ( not ( = ?auto_575932 ?auto_575939 ) ) ( not ( = ?auto_575932 ?auto_575940 ) ) ( not ( = ?auto_575932 ?auto_575941 ) ) ( not ( = ?auto_575932 ?auto_575942 ) ) ( not ( = ?auto_575932 ?auto_575943 ) ) ( not ( = ?auto_575933 ?auto_575934 ) ) ( not ( = ?auto_575933 ?auto_575935 ) ) ( not ( = ?auto_575933 ?auto_575936 ) ) ( not ( = ?auto_575933 ?auto_575937 ) ) ( not ( = ?auto_575933 ?auto_575938 ) ) ( not ( = ?auto_575933 ?auto_575939 ) ) ( not ( = ?auto_575933 ?auto_575940 ) ) ( not ( = ?auto_575933 ?auto_575941 ) ) ( not ( = ?auto_575933 ?auto_575942 ) ) ( not ( = ?auto_575933 ?auto_575943 ) ) ( not ( = ?auto_575934 ?auto_575935 ) ) ( not ( = ?auto_575934 ?auto_575936 ) ) ( not ( = ?auto_575934 ?auto_575937 ) ) ( not ( = ?auto_575934 ?auto_575938 ) ) ( not ( = ?auto_575934 ?auto_575939 ) ) ( not ( = ?auto_575934 ?auto_575940 ) ) ( not ( = ?auto_575934 ?auto_575941 ) ) ( not ( = ?auto_575934 ?auto_575942 ) ) ( not ( = ?auto_575934 ?auto_575943 ) ) ( not ( = ?auto_575935 ?auto_575936 ) ) ( not ( = ?auto_575935 ?auto_575937 ) ) ( not ( = ?auto_575935 ?auto_575938 ) ) ( not ( = ?auto_575935 ?auto_575939 ) ) ( not ( = ?auto_575935 ?auto_575940 ) ) ( not ( = ?auto_575935 ?auto_575941 ) ) ( not ( = ?auto_575935 ?auto_575942 ) ) ( not ( = ?auto_575935 ?auto_575943 ) ) ( not ( = ?auto_575936 ?auto_575937 ) ) ( not ( = ?auto_575936 ?auto_575938 ) ) ( not ( = ?auto_575936 ?auto_575939 ) ) ( not ( = ?auto_575936 ?auto_575940 ) ) ( not ( = ?auto_575936 ?auto_575941 ) ) ( not ( = ?auto_575936 ?auto_575942 ) ) ( not ( = ?auto_575936 ?auto_575943 ) ) ( not ( = ?auto_575937 ?auto_575938 ) ) ( not ( = ?auto_575937 ?auto_575939 ) ) ( not ( = ?auto_575937 ?auto_575940 ) ) ( not ( = ?auto_575937 ?auto_575941 ) ) ( not ( = ?auto_575937 ?auto_575942 ) ) ( not ( = ?auto_575937 ?auto_575943 ) ) ( not ( = ?auto_575938 ?auto_575939 ) ) ( not ( = ?auto_575938 ?auto_575940 ) ) ( not ( = ?auto_575938 ?auto_575941 ) ) ( not ( = ?auto_575938 ?auto_575942 ) ) ( not ( = ?auto_575938 ?auto_575943 ) ) ( not ( = ?auto_575939 ?auto_575940 ) ) ( not ( = ?auto_575939 ?auto_575941 ) ) ( not ( = ?auto_575939 ?auto_575942 ) ) ( not ( = ?auto_575939 ?auto_575943 ) ) ( not ( = ?auto_575940 ?auto_575941 ) ) ( not ( = ?auto_575940 ?auto_575942 ) ) ( not ( = ?auto_575940 ?auto_575943 ) ) ( not ( = ?auto_575941 ?auto_575942 ) ) ( not ( = ?auto_575941 ?auto_575943 ) ) ( not ( = ?auto_575942 ?auto_575943 ) ) ( CLEAR ?auto_575940 ) ( ON ?auto_575941 ?auto_575942 ) ( CLEAR ?auto_575941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_575928 ?auto_575929 ?auto_575930 ?auto_575931 ?auto_575932 ?auto_575933 ?auto_575934 ?auto_575935 ?auto_575936 ?auto_575937 ?auto_575938 ?auto_575939 ?auto_575940 ?auto_575941 )
      ( MAKE-15PILE ?auto_575928 ?auto_575929 ?auto_575930 ?auto_575931 ?auto_575932 ?auto_575933 ?auto_575934 ?auto_575935 ?auto_575936 ?auto_575937 ?auto_575938 ?auto_575939 ?auto_575940 ?auto_575941 ?auto_575942 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_575990 - BLOCK
      ?auto_575991 - BLOCK
      ?auto_575992 - BLOCK
      ?auto_575993 - BLOCK
      ?auto_575994 - BLOCK
      ?auto_575995 - BLOCK
      ?auto_575996 - BLOCK
      ?auto_575997 - BLOCK
      ?auto_575998 - BLOCK
      ?auto_575999 - BLOCK
      ?auto_576000 - BLOCK
      ?auto_576001 - BLOCK
      ?auto_576002 - BLOCK
      ?auto_576003 - BLOCK
      ?auto_576004 - BLOCK
    )
    :vars
    (
      ?auto_576005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_576004 ?auto_576005 ) ( ON-TABLE ?auto_575990 ) ( ON ?auto_575991 ?auto_575990 ) ( ON ?auto_575992 ?auto_575991 ) ( ON ?auto_575993 ?auto_575992 ) ( ON ?auto_575994 ?auto_575993 ) ( ON ?auto_575995 ?auto_575994 ) ( ON ?auto_575996 ?auto_575995 ) ( ON ?auto_575997 ?auto_575996 ) ( ON ?auto_575998 ?auto_575997 ) ( ON ?auto_575999 ?auto_575998 ) ( ON ?auto_576000 ?auto_575999 ) ( ON ?auto_576001 ?auto_576000 ) ( not ( = ?auto_575990 ?auto_575991 ) ) ( not ( = ?auto_575990 ?auto_575992 ) ) ( not ( = ?auto_575990 ?auto_575993 ) ) ( not ( = ?auto_575990 ?auto_575994 ) ) ( not ( = ?auto_575990 ?auto_575995 ) ) ( not ( = ?auto_575990 ?auto_575996 ) ) ( not ( = ?auto_575990 ?auto_575997 ) ) ( not ( = ?auto_575990 ?auto_575998 ) ) ( not ( = ?auto_575990 ?auto_575999 ) ) ( not ( = ?auto_575990 ?auto_576000 ) ) ( not ( = ?auto_575990 ?auto_576001 ) ) ( not ( = ?auto_575990 ?auto_576002 ) ) ( not ( = ?auto_575990 ?auto_576003 ) ) ( not ( = ?auto_575990 ?auto_576004 ) ) ( not ( = ?auto_575990 ?auto_576005 ) ) ( not ( = ?auto_575991 ?auto_575992 ) ) ( not ( = ?auto_575991 ?auto_575993 ) ) ( not ( = ?auto_575991 ?auto_575994 ) ) ( not ( = ?auto_575991 ?auto_575995 ) ) ( not ( = ?auto_575991 ?auto_575996 ) ) ( not ( = ?auto_575991 ?auto_575997 ) ) ( not ( = ?auto_575991 ?auto_575998 ) ) ( not ( = ?auto_575991 ?auto_575999 ) ) ( not ( = ?auto_575991 ?auto_576000 ) ) ( not ( = ?auto_575991 ?auto_576001 ) ) ( not ( = ?auto_575991 ?auto_576002 ) ) ( not ( = ?auto_575991 ?auto_576003 ) ) ( not ( = ?auto_575991 ?auto_576004 ) ) ( not ( = ?auto_575991 ?auto_576005 ) ) ( not ( = ?auto_575992 ?auto_575993 ) ) ( not ( = ?auto_575992 ?auto_575994 ) ) ( not ( = ?auto_575992 ?auto_575995 ) ) ( not ( = ?auto_575992 ?auto_575996 ) ) ( not ( = ?auto_575992 ?auto_575997 ) ) ( not ( = ?auto_575992 ?auto_575998 ) ) ( not ( = ?auto_575992 ?auto_575999 ) ) ( not ( = ?auto_575992 ?auto_576000 ) ) ( not ( = ?auto_575992 ?auto_576001 ) ) ( not ( = ?auto_575992 ?auto_576002 ) ) ( not ( = ?auto_575992 ?auto_576003 ) ) ( not ( = ?auto_575992 ?auto_576004 ) ) ( not ( = ?auto_575992 ?auto_576005 ) ) ( not ( = ?auto_575993 ?auto_575994 ) ) ( not ( = ?auto_575993 ?auto_575995 ) ) ( not ( = ?auto_575993 ?auto_575996 ) ) ( not ( = ?auto_575993 ?auto_575997 ) ) ( not ( = ?auto_575993 ?auto_575998 ) ) ( not ( = ?auto_575993 ?auto_575999 ) ) ( not ( = ?auto_575993 ?auto_576000 ) ) ( not ( = ?auto_575993 ?auto_576001 ) ) ( not ( = ?auto_575993 ?auto_576002 ) ) ( not ( = ?auto_575993 ?auto_576003 ) ) ( not ( = ?auto_575993 ?auto_576004 ) ) ( not ( = ?auto_575993 ?auto_576005 ) ) ( not ( = ?auto_575994 ?auto_575995 ) ) ( not ( = ?auto_575994 ?auto_575996 ) ) ( not ( = ?auto_575994 ?auto_575997 ) ) ( not ( = ?auto_575994 ?auto_575998 ) ) ( not ( = ?auto_575994 ?auto_575999 ) ) ( not ( = ?auto_575994 ?auto_576000 ) ) ( not ( = ?auto_575994 ?auto_576001 ) ) ( not ( = ?auto_575994 ?auto_576002 ) ) ( not ( = ?auto_575994 ?auto_576003 ) ) ( not ( = ?auto_575994 ?auto_576004 ) ) ( not ( = ?auto_575994 ?auto_576005 ) ) ( not ( = ?auto_575995 ?auto_575996 ) ) ( not ( = ?auto_575995 ?auto_575997 ) ) ( not ( = ?auto_575995 ?auto_575998 ) ) ( not ( = ?auto_575995 ?auto_575999 ) ) ( not ( = ?auto_575995 ?auto_576000 ) ) ( not ( = ?auto_575995 ?auto_576001 ) ) ( not ( = ?auto_575995 ?auto_576002 ) ) ( not ( = ?auto_575995 ?auto_576003 ) ) ( not ( = ?auto_575995 ?auto_576004 ) ) ( not ( = ?auto_575995 ?auto_576005 ) ) ( not ( = ?auto_575996 ?auto_575997 ) ) ( not ( = ?auto_575996 ?auto_575998 ) ) ( not ( = ?auto_575996 ?auto_575999 ) ) ( not ( = ?auto_575996 ?auto_576000 ) ) ( not ( = ?auto_575996 ?auto_576001 ) ) ( not ( = ?auto_575996 ?auto_576002 ) ) ( not ( = ?auto_575996 ?auto_576003 ) ) ( not ( = ?auto_575996 ?auto_576004 ) ) ( not ( = ?auto_575996 ?auto_576005 ) ) ( not ( = ?auto_575997 ?auto_575998 ) ) ( not ( = ?auto_575997 ?auto_575999 ) ) ( not ( = ?auto_575997 ?auto_576000 ) ) ( not ( = ?auto_575997 ?auto_576001 ) ) ( not ( = ?auto_575997 ?auto_576002 ) ) ( not ( = ?auto_575997 ?auto_576003 ) ) ( not ( = ?auto_575997 ?auto_576004 ) ) ( not ( = ?auto_575997 ?auto_576005 ) ) ( not ( = ?auto_575998 ?auto_575999 ) ) ( not ( = ?auto_575998 ?auto_576000 ) ) ( not ( = ?auto_575998 ?auto_576001 ) ) ( not ( = ?auto_575998 ?auto_576002 ) ) ( not ( = ?auto_575998 ?auto_576003 ) ) ( not ( = ?auto_575998 ?auto_576004 ) ) ( not ( = ?auto_575998 ?auto_576005 ) ) ( not ( = ?auto_575999 ?auto_576000 ) ) ( not ( = ?auto_575999 ?auto_576001 ) ) ( not ( = ?auto_575999 ?auto_576002 ) ) ( not ( = ?auto_575999 ?auto_576003 ) ) ( not ( = ?auto_575999 ?auto_576004 ) ) ( not ( = ?auto_575999 ?auto_576005 ) ) ( not ( = ?auto_576000 ?auto_576001 ) ) ( not ( = ?auto_576000 ?auto_576002 ) ) ( not ( = ?auto_576000 ?auto_576003 ) ) ( not ( = ?auto_576000 ?auto_576004 ) ) ( not ( = ?auto_576000 ?auto_576005 ) ) ( not ( = ?auto_576001 ?auto_576002 ) ) ( not ( = ?auto_576001 ?auto_576003 ) ) ( not ( = ?auto_576001 ?auto_576004 ) ) ( not ( = ?auto_576001 ?auto_576005 ) ) ( not ( = ?auto_576002 ?auto_576003 ) ) ( not ( = ?auto_576002 ?auto_576004 ) ) ( not ( = ?auto_576002 ?auto_576005 ) ) ( not ( = ?auto_576003 ?auto_576004 ) ) ( not ( = ?auto_576003 ?auto_576005 ) ) ( not ( = ?auto_576004 ?auto_576005 ) ) ( ON ?auto_576003 ?auto_576004 ) ( CLEAR ?auto_576001 ) ( ON ?auto_576002 ?auto_576003 ) ( CLEAR ?auto_576002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_575990 ?auto_575991 ?auto_575992 ?auto_575993 ?auto_575994 ?auto_575995 ?auto_575996 ?auto_575997 ?auto_575998 ?auto_575999 ?auto_576000 ?auto_576001 ?auto_576002 )
      ( MAKE-15PILE ?auto_575990 ?auto_575991 ?auto_575992 ?auto_575993 ?auto_575994 ?auto_575995 ?auto_575996 ?auto_575997 ?auto_575998 ?auto_575999 ?auto_576000 ?auto_576001 ?auto_576002 ?auto_576003 ?auto_576004 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_576052 - BLOCK
      ?auto_576053 - BLOCK
      ?auto_576054 - BLOCK
      ?auto_576055 - BLOCK
      ?auto_576056 - BLOCK
      ?auto_576057 - BLOCK
      ?auto_576058 - BLOCK
      ?auto_576059 - BLOCK
      ?auto_576060 - BLOCK
      ?auto_576061 - BLOCK
      ?auto_576062 - BLOCK
      ?auto_576063 - BLOCK
      ?auto_576064 - BLOCK
      ?auto_576065 - BLOCK
      ?auto_576066 - BLOCK
    )
    :vars
    (
      ?auto_576067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_576066 ?auto_576067 ) ( ON-TABLE ?auto_576052 ) ( ON ?auto_576053 ?auto_576052 ) ( ON ?auto_576054 ?auto_576053 ) ( ON ?auto_576055 ?auto_576054 ) ( ON ?auto_576056 ?auto_576055 ) ( ON ?auto_576057 ?auto_576056 ) ( ON ?auto_576058 ?auto_576057 ) ( ON ?auto_576059 ?auto_576058 ) ( ON ?auto_576060 ?auto_576059 ) ( ON ?auto_576061 ?auto_576060 ) ( ON ?auto_576062 ?auto_576061 ) ( not ( = ?auto_576052 ?auto_576053 ) ) ( not ( = ?auto_576052 ?auto_576054 ) ) ( not ( = ?auto_576052 ?auto_576055 ) ) ( not ( = ?auto_576052 ?auto_576056 ) ) ( not ( = ?auto_576052 ?auto_576057 ) ) ( not ( = ?auto_576052 ?auto_576058 ) ) ( not ( = ?auto_576052 ?auto_576059 ) ) ( not ( = ?auto_576052 ?auto_576060 ) ) ( not ( = ?auto_576052 ?auto_576061 ) ) ( not ( = ?auto_576052 ?auto_576062 ) ) ( not ( = ?auto_576052 ?auto_576063 ) ) ( not ( = ?auto_576052 ?auto_576064 ) ) ( not ( = ?auto_576052 ?auto_576065 ) ) ( not ( = ?auto_576052 ?auto_576066 ) ) ( not ( = ?auto_576052 ?auto_576067 ) ) ( not ( = ?auto_576053 ?auto_576054 ) ) ( not ( = ?auto_576053 ?auto_576055 ) ) ( not ( = ?auto_576053 ?auto_576056 ) ) ( not ( = ?auto_576053 ?auto_576057 ) ) ( not ( = ?auto_576053 ?auto_576058 ) ) ( not ( = ?auto_576053 ?auto_576059 ) ) ( not ( = ?auto_576053 ?auto_576060 ) ) ( not ( = ?auto_576053 ?auto_576061 ) ) ( not ( = ?auto_576053 ?auto_576062 ) ) ( not ( = ?auto_576053 ?auto_576063 ) ) ( not ( = ?auto_576053 ?auto_576064 ) ) ( not ( = ?auto_576053 ?auto_576065 ) ) ( not ( = ?auto_576053 ?auto_576066 ) ) ( not ( = ?auto_576053 ?auto_576067 ) ) ( not ( = ?auto_576054 ?auto_576055 ) ) ( not ( = ?auto_576054 ?auto_576056 ) ) ( not ( = ?auto_576054 ?auto_576057 ) ) ( not ( = ?auto_576054 ?auto_576058 ) ) ( not ( = ?auto_576054 ?auto_576059 ) ) ( not ( = ?auto_576054 ?auto_576060 ) ) ( not ( = ?auto_576054 ?auto_576061 ) ) ( not ( = ?auto_576054 ?auto_576062 ) ) ( not ( = ?auto_576054 ?auto_576063 ) ) ( not ( = ?auto_576054 ?auto_576064 ) ) ( not ( = ?auto_576054 ?auto_576065 ) ) ( not ( = ?auto_576054 ?auto_576066 ) ) ( not ( = ?auto_576054 ?auto_576067 ) ) ( not ( = ?auto_576055 ?auto_576056 ) ) ( not ( = ?auto_576055 ?auto_576057 ) ) ( not ( = ?auto_576055 ?auto_576058 ) ) ( not ( = ?auto_576055 ?auto_576059 ) ) ( not ( = ?auto_576055 ?auto_576060 ) ) ( not ( = ?auto_576055 ?auto_576061 ) ) ( not ( = ?auto_576055 ?auto_576062 ) ) ( not ( = ?auto_576055 ?auto_576063 ) ) ( not ( = ?auto_576055 ?auto_576064 ) ) ( not ( = ?auto_576055 ?auto_576065 ) ) ( not ( = ?auto_576055 ?auto_576066 ) ) ( not ( = ?auto_576055 ?auto_576067 ) ) ( not ( = ?auto_576056 ?auto_576057 ) ) ( not ( = ?auto_576056 ?auto_576058 ) ) ( not ( = ?auto_576056 ?auto_576059 ) ) ( not ( = ?auto_576056 ?auto_576060 ) ) ( not ( = ?auto_576056 ?auto_576061 ) ) ( not ( = ?auto_576056 ?auto_576062 ) ) ( not ( = ?auto_576056 ?auto_576063 ) ) ( not ( = ?auto_576056 ?auto_576064 ) ) ( not ( = ?auto_576056 ?auto_576065 ) ) ( not ( = ?auto_576056 ?auto_576066 ) ) ( not ( = ?auto_576056 ?auto_576067 ) ) ( not ( = ?auto_576057 ?auto_576058 ) ) ( not ( = ?auto_576057 ?auto_576059 ) ) ( not ( = ?auto_576057 ?auto_576060 ) ) ( not ( = ?auto_576057 ?auto_576061 ) ) ( not ( = ?auto_576057 ?auto_576062 ) ) ( not ( = ?auto_576057 ?auto_576063 ) ) ( not ( = ?auto_576057 ?auto_576064 ) ) ( not ( = ?auto_576057 ?auto_576065 ) ) ( not ( = ?auto_576057 ?auto_576066 ) ) ( not ( = ?auto_576057 ?auto_576067 ) ) ( not ( = ?auto_576058 ?auto_576059 ) ) ( not ( = ?auto_576058 ?auto_576060 ) ) ( not ( = ?auto_576058 ?auto_576061 ) ) ( not ( = ?auto_576058 ?auto_576062 ) ) ( not ( = ?auto_576058 ?auto_576063 ) ) ( not ( = ?auto_576058 ?auto_576064 ) ) ( not ( = ?auto_576058 ?auto_576065 ) ) ( not ( = ?auto_576058 ?auto_576066 ) ) ( not ( = ?auto_576058 ?auto_576067 ) ) ( not ( = ?auto_576059 ?auto_576060 ) ) ( not ( = ?auto_576059 ?auto_576061 ) ) ( not ( = ?auto_576059 ?auto_576062 ) ) ( not ( = ?auto_576059 ?auto_576063 ) ) ( not ( = ?auto_576059 ?auto_576064 ) ) ( not ( = ?auto_576059 ?auto_576065 ) ) ( not ( = ?auto_576059 ?auto_576066 ) ) ( not ( = ?auto_576059 ?auto_576067 ) ) ( not ( = ?auto_576060 ?auto_576061 ) ) ( not ( = ?auto_576060 ?auto_576062 ) ) ( not ( = ?auto_576060 ?auto_576063 ) ) ( not ( = ?auto_576060 ?auto_576064 ) ) ( not ( = ?auto_576060 ?auto_576065 ) ) ( not ( = ?auto_576060 ?auto_576066 ) ) ( not ( = ?auto_576060 ?auto_576067 ) ) ( not ( = ?auto_576061 ?auto_576062 ) ) ( not ( = ?auto_576061 ?auto_576063 ) ) ( not ( = ?auto_576061 ?auto_576064 ) ) ( not ( = ?auto_576061 ?auto_576065 ) ) ( not ( = ?auto_576061 ?auto_576066 ) ) ( not ( = ?auto_576061 ?auto_576067 ) ) ( not ( = ?auto_576062 ?auto_576063 ) ) ( not ( = ?auto_576062 ?auto_576064 ) ) ( not ( = ?auto_576062 ?auto_576065 ) ) ( not ( = ?auto_576062 ?auto_576066 ) ) ( not ( = ?auto_576062 ?auto_576067 ) ) ( not ( = ?auto_576063 ?auto_576064 ) ) ( not ( = ?auto_576063 ?auto_576065 ) ) ( not ( = ?auto_576063 ?auto_576066 ) ) ( not ( = ?auto_576063 ?auto_576067 ) ) ( not ( = ?auto_576064 ?auto_576065 ) ) ( not ( = ?auto_576064 ?auto_576066 ) ) ( not ( = ?auto_576064 ?auto_576067 ) ) ( not ( = ?auto_576065 ?auto_576066 ) ) ( not ( = ?auto_576065 ?auto_576067 ) ) ( not ( = ?auto_576066 ?auto_576067 ) ) ( ON ?auto_576065 ?auto_576066 ) ( ON ?auto_576064 ?auto_576065 ) ( CLEAR ?auto_576062 ) ( ON ?auto_576063 ?auto_576064 ) ( CLEAR ?auto_576063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_576052 ?auto_576053 ?auto_576054 ?auto_576055 ?auto_576056 ?auto_576057 ?auto_576058 ?auto_576059 ?auto_576060 ?auto_576061 ?auto_576062 ?auto_576063 )
      ( MAKE-15PILE ?auto_576052 ?auto_576053 ?auto_576054 ?auto_576055 ?auto_576056 ?auto_576057 ?auto_576058 ?auto_576059 ?auto_576060 ?auto_576061 ?auto_576062 ?auto_576063 ?auto_576064 ?auto_576065 ?auto_576066 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_576114 - BLOCK
      ?auto_576115 - BLOCK
      ?auto_576116 - BLOCK
      ?auto_576117 - BLOCK
      ?auto_576118 - BLOCK
      ?auto_576119 - BLOCK
      ?auto_576120 - BLOCK
      ?auto_576121 - BLOCK
      ?auto_576122 - BLOCK
      ?auto_576123 - BLOCK
      ?auto_576124 - BLOCK
      ?auto_576125 - BLOCK
      ?auto_576126 - BLOCK
      ?auto_576127 - BLOCK
      ?auto_576128 - BLOCK
    )
    :vars
    (
      ?auto_576129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_576128 ?auto_576129 ) ( ON-TABLE ?auto_576114 ) ( ON ?auto_576115 ?auto_576114 ) ( ON ?auto_576116 ?auto_576115 ) ( ON ?auto_576117 ?auto_576116 ) ( ON ?auto_576118 ?auto_576117 ) ( ON ?auto_576119 ?auto_576118 ) ( ON ?auto_576120 ?auto_576119 ) ( ON ?auto_576121 ?auto_576120 ) ( ON ?auto_576122 ?auto_576121 ) ( ON ?auto_576123 ?auto_576122 ) ( not ( = ?auto_576114 ?auto_576115 ) ) ( not ( = ?auto_576114 ?auto_576116 ) ) ( not ( = ?auto_576114 ?auto_576117 ) ) ( not ( = ?auto_576114 ?auto_576118 ) ) ( not ( = ?auto_576114 ?auto_576119 ) ) ( not ( = ?auto_576114 ?auto_576120 ) ) ( not ( = ?auto_576114 ?auto_576121 ) ) ( not ( = ?auto_576114 ?auto_576122 ) ) ( not ( = ?auto_576114 ?auto_576123 ) ) ( not ( = ?auto_576114 ?auto_576124 ) ) ( not ( = ?auto_576114 ?auto_576125 ) ) ( not ( = ?auto_576114 ?auto_576126 ) ) ( not ( = ?auto_576114 ?auto_576127 ) ) ( not ( = ?auto_576114 ?auto_576128 ) ) ( not ( = ?auto_576114 ?auto_576129 ) ) ( not ( = ?auto_576115 ?auto_576116 ) ) ( not ( = ?auto_576115 ?auto_576117 ) ) ( not ( = ?auto_576115 ?auto_576118 ) ) ( not ( = ?auto_576115 ?auto_576119 ) ) ( not ( = ?auto_576115 ?auto_576120 ) ) ( not ( = ?auto_576115 ?auto_576121 ) ) ( not ( = ?auto_576115 ?auto_576122 ) ) ( not ( = ?auto_576115 ?auto_576123 ) ) ( not ( = ?auto_576115 ?auto_576124 ) ) ( not ( = ?auto_576115 ?auto_576125 ) ) ( not ( = ?auto_576115 ?auto_576126 ) ) ( not ( = ?auto_576115 ?auto_576127 ) ) ( not ( = ?auto_576115 ?auto_576128 ) ) ( not ( = ?auto_576115 ?auto_576129 ) ) ( not ( = ?auto_576116 ?auto_576117 ) ) ( not ( = ?auto_576116 ?auto_576118 ) ) ( not ( = ?auto_576116 ?auto_576119 ) ) ( not ( = ?auto_576116 ?auto_576120 ) ) ( not ( = ?auto_576116 ?auto_576121 ) ) ( not ( = ?auto_576116 ?auto_576122 ) ) ( not ( = ?auto_576116 ?auto_576123 ) ) ( not ( = ?auto_576116 ?auto_576124 ) ) ( not ( = ?auto_576116 ?auto_576125 ) ) ( not ( = ?auto_576116 ?auto_576126 ) ) ( not ( = ?auto_576116 ?auto_576127 ) ) ( not ( = ?auto_576116 ?auto_576128 ) ) ( not ( = ?auto_576116 ?auto_576129 ) ) ( not ( = ?auto_576117 ?auto_576118 ) ) ( not ( = ?auto_576117 ?auto_576119 ) ) ( not ( = ?auto_576117 ?auto_576120 ) ) ( not ( = ?auto_576117 ?auto_576121 ) ) ( not ( = ?auto_576117 ?auto_576122 ) ) ( not ( = ?auto_576117 ?auto_576123 ) ) ( not ( = ?auto_576117 ?auto_576124 ) ) ( not ( = ?auto_576117 ?auto_576125 ) ) ( not ( = ?auto_576117 ?auto_576126 ) ) ( not ( = ?auto_576117 ?auto_576127 ) ) ( not ( = ?auto_576117 ?auto_576128 ) ) ( not ( = ?auto_576117 ?auto_576129 ) ) ( not ( = ?auto_576118 ?auto_576119 ) ) ( not ( = ?auto_576118 ?auto_576120 ) ) ( not ( = ?auto_576118 ?auto_576121 ) ) ( not ( = ?auto_576118 ?auto_576122 ) ) ( not ( = ?auto_576118 ?auto_576123 ) ) ( not ( = ?auto_576118 ?auto_576124 ) ) ( not ( = ?auto_576118 ?auto_576125 ) ) ( not ( = ?auto_576118 ?auto_576126 ) ) ( not ( = ?auto_576118 ?auto_576127 ) ) ( not ( = ?auto_576118 ?auto_576128 ) ) ( not ( = ?auto_576118 ?auto_576129 ) ) ( not ( = ?auto_576119 ?auto_576120 ) ) ( not ( = ?auto_576119 ?auto_576121 ) ) ( not ( = ?auto_576119 ?auto_576122 ) ) ( not ( = ?auto_576119 ?auto_576123 ) ) ( not ( = ?auto_576119 ?auto_576124 ) ) ( not ( = ?auto_576119 ?auto_576125 ) ) ( not ( = ?auto_576119 ?auto_576126 ) ) ( not ( = ?auto_576119 ?auto_576127 ) ) ( not ( = ?auto_576119 ?auto_576128 ) ) ( not ( = ?auto_576119 ?auto_576129 ) ) ( not ( = ?auto_576120 ?auto_576121 ) ) ( not ( = ?auto_576120 ?auto_576122 ) ) ( not ( = ?auto_576120 ?auto_576123 ) ) ( not ( = ?auto_576120 ?auto_576124 ) ) ( not ( = ?auto_576120 ?auto_576125 ) ) ( not ( = ?auto_576120 ?auto_576126 ) ) ( not ( = ?auto_576120 ?auto_576127 ) ) ( not ( = ?auto_576120 ?auto_576128 ) ) ( not ( = ?auto_576120 ?auto_576129 ) ) ( not ( = ?auto_576121 ?auto_576122 ) ) ( not ( = ?auto_576121 ?auto_576123 ) ) ( not ( = ?auto_576121 ?auto_576124 ) ) ( not ( = ?auto_576121 ?auto_576125 ) ) ( not ( = ?auto_576121 ?auto_576126 ) ) ( not ( = ?auto_576121 ?auto_576127 ) ) ( not ( = ?auto_576121 ?auto_576128 ) ) ( not ( = ?auto_576121 ?auto_576129 ) ) ( not ( = ?auto_576122 ?auto_576123 ) ) ( not ( = ?auto_576122 ?auto_576124 ) ) ( not ( = ?auto_576122 ?auto_576125 ) ) ( not ( = ?auto_576122 ?auto_576126 ) ) ( not ( = ?auto_576122 ?auto_576127 ) ) ( not ( = ?auto_576122 ?auto_576128 ) ) ( not ( = ?auto_576122 ?auto_576129 ) ) ( not ( = ?auto_576123 ?auto_576124 ) ) ( not ( = ?auto_576123 ?auto_576125 ) ) ( not ( = ?auto_576123 ?auto_576126 ) ) ( not ( = ?auto_576123 ?auto_576127 ) ) ( not ( = ?auto_576123 ?auto_576128 ) ) ( not ( = ?auto_576123 ?auto_576129 ) ) ( not ( = ?auto_576124 ?auto_576125 ) ) ( not ( = ?auto_576124 ?auto_576126 ) ) ( not ( = ?auto_576124 ?auto_576127 ) ) ( not ( = ?auto_576124 ?auto_576128 ) ) ( not ( = ?auto_576124 ?auto_576129 ) ) ( not ( = ?auto_576125 ?auto_576126 ) ) ( not ( = ?auto_576125 ?auto_576127 ) ) ( not ( = ?auto_576125 ?auto_576128 ) ) ( not ( = ?auto_576125 ?auto_576129 ) ) ( not ( = ?auto_576126 ?auto_576127 ) ) ( not ( = ?auto_576126 ?auto_576128 ) ) ( not ( = ?auto_576126 ?auto_576129 ) ) ( not ( = ?auto_576127 ?auto_576128 ) ) ( not ( = ?auto_576127 ?auto_576129 ) ) ( not ( = ?auto_576128 ?auto_576129 ) ) ( ON ?auto_576127 ?auto_576128 ) ( ON ?auto_576126 ?auto_576127 ) ( ON ?auto_576125 ?auto_576126 ) ( CLEAR ?auto_576123 ) ( ON ?auto_576124 ?auto_576125 ) ( CLEAR ?auto_576124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_576114 ?auto_576115 ?auto_576116 ?auto_576117 ?auto_576118 ?auto_576119 ?auto_576120 ?auto_576121 ?auto_576122 ?auto_576123 ?auto_576124 )
      ( MAKE-15PILE ?auto_576114 ?auto_576115 ?auto_576116 ?auto_576117 ?auto_576118 ?auto_576119 ?auto_576120 ?auto_576121 ?auto_576122 ?auto_576123 ?auto_576124 ?auto_576125 ?auto_576126 ?auto_576127 ?auto_576128 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_576176 - BLOCK
      ?auto_576177 - BLOCK
      ?auto_576178 - BLOCK
      ?auto_576179 - BLOCK
      ?auto_576180 - BLOCK
      ?auto_576181 - BLOCK
      ?auto_576182 - BLOCK
      ?auto_576183 - BLOCK
      ?auto_576184 - BLOCK
      ?auto_576185 - BLOCK
      ?auto_576186 - BLOCK
      ?auto_576187 - BLOCK
      ?auto_576188 - BLOCK
      ?auto_576189 - BLOCK
      ?auto_576190 - BLOCK
    )
    :vars
    (
      ?auto_576191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_576190 ?auto_576191 ) ( ON-TABLE ?auto_576176 ) ( ON ?auto_576177 ?auto_576176 ) ( ON ?auto_576178 ?auto_576177 ) ( ON ?auto_576179 ?auto_576178 ) ( ON ?auto_576180 ?auto_576179 ) ( ON ?auto_576181 ?auto_576180 ) ( ON ?auto_576182 ?auto_576181 ) ( ON ?auto_576183 ?auto_576182 ) ( ON ?auto_576184 ?auto_576183 ) ( not ( = ?auto_576176 ?auto_576177 ) ) ( not ( = ?auto_576176 ?auto_576178 ) ) ( not ( = ?auto_576176 ?auto_576179 ) ) ( not ( = ?auto_576176 ?auto_576180 ) ) ( not ( = ?auto_576176 ?auto_576181 ) ) ( not ( = ?auto_576176 ?auto_576182 ) ) ( not ( = ?auto_576176 ?auto_576183 ) ) ( not ( = ?auto_576176 ?auto_576184 ) ) ( not ( = ?auto_576176 ?auto_576185 ) ) ( not ( = ?auto_576176 ?auto_576186 ) ) ( not ( = ?auto_576176 ?auto_576187 ) ) ( not ( = ?auto_576176 ?auto_576188 ) ) ( not ( = ?auto_576176 ?auto_576189 ) ) ( not ( = ?auto_576176 ?auto_576190 ) ) ( not ( = ?auto_576176 ?auto_576191 ) ) ( not ( = ?auto_576177 ?auto_576178 ) ) ( not ( = ?auto_576177 ?auto_576179 ) ) ( not ( = ?auto_576177 ?auto_576180 ) ) ( not ( = ?auto_576177 ?auto_576181 ) ) ( not ( = ?auto_576177 ?auto_576182 ) ) ( not ( = ?auto_576177 ?auto_576183 ) ) ( not ( = ?auto_576177 ?auto_576184 ) ) ( not ( = ?auto_576177 ?auto_576185 ) ) ( not ( = ?auto_576177 ?auto_576186 ) ) ( not ( = ?auto_576177 ?auto_576187 ) ) ( not ( = ?auto_576177 ?auto_576188 ) ) ( not ( = ?auto_576177 ?auto_576189 ) ) ( not ( = ?auto_576177 ?auto_576190 ) ) ( not ( = ?auto_576177 ?auto_576191 ) ) ( not ( = ?auto_576178 ?auto_576179 ) ) ( not ( = ?auto_576178 ?auto_576180 ) ) ( not ( = ?auto_576178 ?auto_576181 ) ) ( not ( = ?auto_576178 ?auto_576182 ) ) ( not ( = ?auto_576178 ?auto_576183 ) ) ( not ( = ?auto_576178 ?auto_576184 ) ) ( not ( = ?auto_576178 ?auto_576185 ) ) ( not ( = ?auto_576178 ?auto_576186 ) ) ( not ( = ?auto_576178 ?auto_576187 ) ) ( not ( = ?auto_576178 ?auto_576188 ) ) ( not ( = ?auto_576178 ?auto_576189 ) ) ( not ( = ?auto_576178 ?auto_576190 ) ) ( not ( = ?auto_576178 ?auto_576191 ) ) ( not ( = ?auto_576179 ?auto_576180 ) ) ( not ( = ?auto_576179 ?auto_576181 ) ) ( not ( = ?auto_576179 ?auto_576182 ) ) ( not ( = ?auto_576179 ?auto_576183 ) ) ( not ( = ?auto_576179 ?auto_576184 ) ) ( not ( = ?auto_576179 ?auto_576185 ) ) ( not ( = ?auto_576179 ?auto_576186 ) ) ( not ( = ?auto_576179 ?auto_576187 ) ) ( not ( = ?auto_576179 ?auto_576188 ) ) ( not ( = ?auto_576179 ?auto_576189 ) ) ( not ( = ?auto_576179 ?auto_576190 ) ) ( not ( = ?auto_576179 ?auto_576191 ) ) ( not ( = ?auto_576180 ?auto_576181 ) ) ( not ( = ?auto_576180 ?auto_576182 ) ) ( not ( = ?auto_576180 ?auto_576183 ) ) ( not ( = ?auto_576180 ?auto_576184 ) ) ( not ( = ?auto_576180 ?auto_576185 ) ) ( not ( = ?auto_576180 ?auto_576186 ) ) ( not ( = ?auto_576180 ?auto_576187 ) ) ( not ( = ?auto_576180 ?auto_576188 ) ) ( not ( = ?auto_576180 ?auto_576189 ) ) ( not ( = ?auto_576180 ?auto_576190 ) ) ( not ( = ?auto_576180 ?auto_576191 ) ) ( not ( = ?auto_576181 ?auto_576182 ) ) ( not ( = ?auto_576181 ?auto_576183 ) ) ( not ( = ?auto_576181 ?auto_576184 ) ) ( not ( = ?auto_576181 ?auto_576185 ) ) ( not ( = ?auto_576181 ?auto_576186 ) ) ( not ( = ?auto_576181 ?auto_576187 ) ) ( not ( = ?auto_576181 ?auto_576188 ) ) ( not ( = ?auto_576181 ?auto_576189 ) ) ( not ( = ?auto_576181 ?auto_576190 ) ) ( not ( = ?auto_576181 ?auto_576191 ) ) ( not ( = ?auto_576182 ?auto_576183 ) ) ( not ( = ?auto_576182 ?auto_576184 ) ) ( not ( = ?auto_576182 ?auto_576185 ) ) ( not ( = ?auto_576182 ?auto_576186 ) ) ( not ( = ?auto_576182 ?auto_576187 ) ) ( not ( = ?auto_576182 ?auto_576188 ) ) ( not ( = ?auto_576182 ?auto_576189 ) ) ( not ( = ?auto_576182 ?auto_576190 ) ) ( not ( = ?auto_576182 ?auto_576191 ) ) ( not ( = ?auto_576183 ?auto_576184 ) ) ( not ( = ?auto_576183 ?auto_576185 ) ) ( not ( = ?auto_576183 ?auto_576186 ) ) ( not ( = ?auto_576183 ?auto_576187 ) ) ( not ( = ?auto_576183 ?auto_576188 ) ) ( not ( = ?auto_576183 ?auto_576189 ) ) ( not ( = ?auto_576183 ?auto_576190 ) ) ( not ( = ?auto_576183 ?auto_576191 ) ) ( not ( = ?auto_576184 ?auto_576185 ) ) ( not ( = ?auto_576184 ?auto_576186 ) ) ( not ( = ?auto_576184 ?auto_576187 ) ) ( not ( = ?auto_576184 ?auto_576188 ) ) ( not ( = ?auto_576184 ?auto_576189 ) ) ( not ( = ?auto_576184 ?auto_576190 ) ) ( not ( = ?auto_576184 ?auto_576191 ) ) ( not ( = ?auto_576185 ?auto_576186 ) ) ( not ( = ?auto_576185 ?auto_576187 ) ) ( not ( = ?auto_576185 ?auto_576188 ) ) ( not ( = ?auto_576185 ?auto_576189 ) ) ( not ( = ?auto_576185 ?auto_576190 ) ) ( not ( = ?auto_576185 ?auto_576191 ) ) ( not ( = ?auto_576186 ?auto_576187 ) ) ( not ( = ?auto_576186 ?auto_576188 ) ) ( not ( = ?auto_576186 ?auto_576189 ) ) ( not ( = ?auto_576186 ?auto_576190 ) ) ( not ( = ?auto_576186 ?auto_576191 ) ) ( not ( = ?auto_576187 ?auto_576188 ) ) ( not ( = ?auto_576187 ?auto_576189 ) ) ( not ( = ?auto_576187 ?auto_576190 ) ) ( not ( = ?auto_576187 ?auto_576191 ) ) ( not ( = ?auto_576188 ?auto_576189 ) ) ( not ( = ?auto_576188 ?auto_576190 ) ) ( not ( = ?auto_576188 ?auto_576191 ) ) ( not ( = ?auto_576189 ?auto_576190 ) ) ( not ( = ?auto_576189 ?auto_576191 ) ) ( not ( = ?auto_576190 ?auto_576191 ) ) ( ON ?auto_576189 ?auto_576190 ) ( ON ?auto_576188 ?auto_576189 ) ( ON ?auto_576187 ?auto_576188 ) ( ON ?auto_576186 ?auto_576187 ) ( CLEAR ?auto_576184 ) ( ON ?auto_576185 ?auto_576186 ) ( CLEAR ?auto_576185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_576176 ?auto_576177 ?auto_576178 ?auto_576179 ?auto_576180 ?auto_576181 ?auto_576182 ?auto_576183 ?auto_576184 ?auto_576185 )
      ( MAKE-15PILE ?auto_576176 ?auto_576177 ?auto_576178 ?auto_576179 ?auto_576180 ?auto_576181 ?auto_576182 ?auto_576183 ?auto_576184 ?auto_576185 ?auto_576186 ?auto_576187 ?auto_576188 ?auto_576189 ?auto_576190 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_576238 - BLOCK
      ?auto_576239 - BLOCK
      ?auto_576240 - BLOCK
      ?auto_576241 - BLOCK
      ?auto_576242 - BLOCK
      ?auto_576243 - BLOCK
      ?auto_576244 - BLOCK
      ?auto_576245 - BLOCK
      ?auto_576246 - BLOCK
      ?auto_576247 - BLOCK
      ?auto_576248 - BLOCK
      ?auto_576249 - BLOCK
      ?auto_576250 - BLOCK
      ?auto_576251 - BLOCK
      ?auto_576252 - BLOCK
    )
    :vars
    (
      ?auto_576253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_576252 ?auto_576253 ) ( ON-TABLE ?auto_576238 ) ( ON ?auto_576239 ?auto_576238 ) ( ON ?auto_576240 ?auto_576239 ) ( ON ?auto_576241 ?auto_576240 ) ( ON ?auto_576242 ?auto_576241 ) ( ON ?auto_576243 ?auto_576242 ) ( ON ?auto_576244 ?auto_576243 ) ( ON ?auto_576245 ?auto_576244 ) ( not ( = ?auto_576238 ?auto_576239 ) ) ( not ( = ?auto_576238 ?auto_576240 ) ) ( not ( = ?auto_576238 ?auto_576241 ) ) ( not ( = ?auto_576238 ?auto_576242 ) ) ( not ( = ?auto_576238 ?auto_576243 ) ) ( not ( = ?auto_576238 ?auto_576244 ) ) ( not ( = ?auto_576238 ?auto_576245 ) ) ( not ( = ?auto_576238 ?auto_576246 ) ) ( not ( = ?auto_576238 ?auto_576247 ) ) ( not ( = ?auto_576238 ?auto_576248 ) ) ( not ( = ?auto_576238 ?auto_576249 ) ) ( not ( = ?auto_576238 ?auto_576250 ) ) ( not ( = ?auto_576238 ?auto_576251 ) ) ( not ( = ?auto_576238 ?auto_576252 ) ) ( not ( = ?auto_576238 ?auto_576253 ) ) ( not ( = ?auto_576239 ?auto_576240 ) ) ( not ( = ?auto_576239 ?auto_576241 ) ) ( not ( = ?auto_576239 ?auto_576242 ) ) ( not ( = ?auto_576239 ?auto_576243 ) ) ( not ( = ?auto_576239 ?auto_576244 ) ) ( not ( = ?auto_576239 ?auto_576245 ) ) ( not ( = ?auto_576239 ?auto_576246 ) ) ( not ( = ?auto_576239 ?auto_576247 ) ) ( not ( = ?auto_576239 ?auto_576248 ) ) ( not ( = ?auto_576239 ?auto_576249 ) ) ( not ( = ?auto_576239 ?auto_576250 ) ) ( not ( = ?auto_576239 ?auto_576251 ) ) ( not ( = ?auto_576239 ?auto_576252 ) ) ( not ( = ?auto_576239 ?auto_576253 ) ) ( not ( = ?auto_576240 ?auto_576241 ) ) ( not ( = ?auto_576240 ?auto_576242 ) ) ( not ( = ?auto_576240 ?auto_576243 ) ) ( not ( = ?auto_576240 ?auto_576244 ) ) ( not ( = ?auto_576240 ?auto_576245 ) ) ( not ( = ?auto_576240 ?auto_576246 ) ) ( not ( = ?auto_576240 ?auto_576247 ) ) ( not ( = ?auto_576240 ?auto_576248 ) ) ( not ( = ?auto_576240 ?auto_576249 ) ) ( not ( = ?auto_576240 ?auto_576250 ) ) ( not ( = ?auto_576240 ?auto_576251 ) ) ( not ( = ?auto_576240 ?auto_576252 ) ) ( not ( = ?auto_576240 ?auto_576253 ) ) ( not ( = ?auto_576241 ?auto_576242 ) ) ( not ( = ?auto_576241 ?auto_576243 ) ) ( not ( = ?auto_576241 ?auto_576244 ) ) ( not ( = ?auto_576241 ?auto_576245 ) ) ( not ( = ?auto_576241 ?auto_576246 ) ) ( not ( = ?auto_576241 ?auto_576247 ) ) ( not ( = ?auto_576241 ?auto_576248 ) ) ( not ( = ?auto_576241 ?auto_576249 ) ) ( not ( = ?auto_576241 ?auto_576250 ) ) ( not ( = ?auto_576241 ?auto_576251 ) ) ( not ( = ?auto_576241 ?auto_576252 ) ) ( not ( = ?auto_576241 ?auto_576253 ) ) ( not ( = ?auto_576242 ?auto_576243 ) ) ( not ( = ?auto_576242 ?auto_576244 ) ) ( not ( = ?auto_576242 ?auto_576245 ) ) ( not ( = ?auto_576242 ?auto_576246 ) ) ( not ( = ?auto_576242 ?auto_576247 ) ) ( not ( = ?auto_576242 ?auto_576248 ) ) ( not ( = ?auto_576242 ?auto_576249 ) ) ( not ( = ?auto_576242 ?auto_576250 ) ) ( not ( = ?auto_576242 ?auto_576251 ) ) ( not ( = ?auto_576242 ?auto_576252 ) ) ( not ( = ?auto_576242 ?auto_576253 ) ) ( not ( = ?auto_576243 ?auto_576244 ) ) ( not ( = ?auto_576243 ?auto_576245 ) ) ( not ( = ?auto_576243 ?auto_576246 ) ) ( not ( = ?auto_576243 ?auto_576247 ) ) ( not ( = ?auto_576243 ?auto_576248 ) ) ( not ( = ?auto_576243 ?auto_576249 ) ) ( not ( = ?auto_576243 ?auto_576250 ) ) ( not ( = ?auto_576243 ?auto_576251 ) ) ( not ( = ?auto_576243 ?auto_576252 ) ) ( not ( = ?auto_576243 ?auto_576253 ) ) ( not ( = ?auto_576244 ?auto_576245 ) ) ( not ( = ?auto_576244 ?auto_576246 ) ) ( not ( = ?auto_576244 ?auto_576247 ) ) ( not ( = ?auto_576244 ?auto_576248 ) ) ( not ( = ?auto_576244 ?auto_576249 ) ) ( not ( = ?auto_576244 ?auto_576250 ) ) ( not ( = ?auto_576244 ?auto_576251 ) ) ( not ( = ?auto_576244 ?auto_576252 ) ) ( not ( = ?auto_576244 ?auto_576253 ) ) ( not ( = ?auto_576245 ?auto_576246 ) ) ( not ( = ?auto_576245 ?auto_576247 ) ) ( not ( = ?auto_576245 ?auto_576248 ) ) ( not ( = ?auto_576245 ?auto_576249 ) ) ( not ( = ?auto_576245 ?auto_576250 ) ) ( not ( = ?auto_576245 ?auto_576251 ) ) ( not ( = ?auto_576245 ?auto_576252 ) ) ( not ( = ?auto_576245 ?auto_576253 ) ) ( not ( = ?auto_576246 ?auto_576247 ) ) ( not ( = ?auto_576246 ?auto_576248 ) ) ( not ( = ?auto_576246 ?auto_576249 ) ) ( not ( = ?auto_576246 ?auto_576250 ) ) ( not ( = ?auto_576246 ?auto_576251 ) ) ( not ( = ?auto_576246 ?auto_576252 ) ) ( not ( = ?auto_576246 ?auto_576253 ) ) ( not ( = ?auto_576247 ?auto_576248 ) ) ( not ( = ?auto_576247 ?auto_576249 ) ) ( not ( = ?auto_576247 ?auto_576250 ) ) ( not ( = ?auto_576247 ?auto_576251 ) ) ( not ( = ?auto_576247 ?auto_576252 ) ) ( not ( = ?auto_576247 ?auto_576253 ) ) ( not ( = ?auto_576248 ?auto_576249 ) ) ( not ( = ?auto_576248 ?auto_576250 ) ) ( not ( = ?auto_576248 ?auto_576251 ) ) ( not ( = ?auto_576248 ?auto_576252 ) ) ( not ( = ?auto_576248 ?auto_576253 ) ) ( not ( = ?auto_576249 ?auto_576250 ) ) ( not ( = ?auto_576249 ?auto_576251 ) ) ( not ( = ?auto_576249 ?auto_576252 ) ) ( not ( = ?auto_576249 ?auto_576253 ) ) ( not ( = ?auto_576250 ?auto_576251 ) ) ( not ( = ?auto_576250 ?auto_576252 ) ) ( not ( = ?auto_576250 ?auto_576253 ) ) ( not ( = ?auto_576251 ?auto_576252 ) ) ( not ( = ?auto_576251 ?auto_576253 ) ) ( not ( = ?auto_576252 ?auto_576253 ) ) ( ON ?auto_576251 ?auto_576252 ) ( ON ?auto_576250 ?auto_576251 ) ( ON ?auto_576249 ?auto_576250 ) ( ON ?auto_576248 ?auto_576249 ) ( ON ?auto_576247 ?auto_576248 ) ( CLEAR ?auto_576245 ) ( ON ?auto_576246 ?auto_576247 ) ( CLEAR ?auto_576246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_576238 ?auto_576239 ?auto_576240 ?auto_576241 ?auto_576242 ?auto_576243 ?auto_576244 ?auto_576245 ?auto_576246 )
      ( MAKE-15PILE ?auto_576238 ?auto_576239 ?auto_576240 ?auto_576241 ?auto_576242 ?auto_576243 ?auto_576244 ?auto_576245 ?auto_576246 ?auto_576247 ?auto_576248 ?auto_576249 ?auto_576250 ?auto_576251 ?auto_576252 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_576300 - BLOCK
      ?auto_576301 - BLOCK
      ?auto_576302 - BLOCK
      ?auto_576303 - BLOCK
      ?auto_576304 - BLOCK
      ?auto_576305 - BLOCK
      ?auto_576306 - BLOCK
      ?auto_576307 - BLOCK
      ?auto_576308 - BLOCK
      ?auto_576309 - BLOCK
      ?auto_576310 - BLOCK
      ?auto_576311 - BLOCK
      ?auto_576312 - BLOCK
      ?auto_576313 - BLOCK
      ?auto_576314 - BLOCK
    )
    :vars
    (
      ?auto_576315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_576314 ?auto_576315 ) ( ON-TABLE ?auto_576300 ) ( ON ?auto_576301 ?auto_576300 ) ( ON ?auto_576302 ?auto_576301 ) ( ON ?auto_576303 ?auto_576302 ) ( ON ?auto_576304 ?auto_576303 ) ( ON ?auto_576305 ?auto_576304 ) ( ON ?auto_576306 ?auto_576305 ) ( not ( = ?auto_576300 ?auto_576301 ) ) ( not ( = ?auto_576300 ?auto_576302 ) ) ( not ( = ?auto_576300 ?auto_576303 ) ) ( not ( = ?auto_576300 ?auto_576304 ) ) ( not ( = ?auto_576300 ?auto_576305 ) ) ( not ( = ?auto_576300 ?auto_576306 ) ) ( not ( = ?auto_576300 ?auto_576307 ) ) ( not ( = ?auto_576300 ?auto_576308 ) ) ( not ( = ?auto_576300 ?auto_576309 ) ) ( not ( = ?auto_576300 ?auto_576310 ) ) ( not ( = ?auto_576300 ?auto_576311 ) ) ( not ( = ?auto_576300 ?auto_576312 ) ) ( not ( = ?auto_576300 ?auto_576313 ) ) ( not ( = ?auto_576300 ?auto_576314 ) ) ( not ( = ?auto_576300 ?auto_576315 ) ) ( not ( = ?auto_576301 ?auto_576302 ) ) ( not ( = ?auto_576301 ?auto_576303 ) ) ( not ( = ?auto_576301 ?auto_576304 ) ) ( not ( = ?auto_576301 ?auto_576305 ) ) ( not ( = ?auto_576301 ?auto_576306 ) ) ( not ( = ?auto_576301 ?auto_576307 ) ) ( not ( = ?auto_576301 ?auto_576308 ) ) ( not ( = ?auto_576301 ?auto_576309 ) ) ( not ( = ?auto_576301 ?auto_576310 ) ) ( not ( = ?auto_576301 ?auto_576311 ) ) ( not ( = ?auto_576301 ?auto_576312 ) ) ( not ( = ?auto_576301 ?auto_576313 ) ) ( not ( = ?auto_576301 ?auto_576314 ) ) ( not ( = ?auto_576301 ?auto_576315 ) ) ( not ( = ?auto_576302 ?auto_576303 ) ) ( not ( = ?auto_576302 ?auto_576304 ) ) ( not ( = ?auto_576302 ?auto_576305 ) ) ( not ( = ?auto_576302 ?auto_576306 ) ) ( not ( = ?auto_576302 ?auto_576307 ) ) ( not ( = ?auto_576302 ?auto_576308 ) ) ( not ( = ?auto_576302 ?auto_576309 ) ) ( not ( = ?auto_576302 ?auto_576310 ) ) ( not ( = ?auto_576302 ?auto_576311 ) ) ( not ( = ?auto_576302 ?auto_576312 ) ) ( not ( = ?auto_576302 ?auto_576313 ) ) ( not ( = ?auto_576302 ?auto_576314 ) ) ( not ( = ?auto_576302 ?auto_576315 ) ) ( not ( = ?auto_576303 ?auto_576304 ) ) ( not ( = ?auto_576303 ?auto_576305 ) ) ( not ( = ?auto_576303 ?auto_576306 ) ) ( not ( = ?auto_576303 ?auto_576307 ) ) ( not ( = ?auto_576303 ?auto_576308 ) ) ( not ( = ?auto_576303 ?auto_576309 ) ) ( not ( = ?auto_576303 ?auto_576310 ) ) ( not ( = ?auto_576303 ?auto_576311 ) ) ( not ( = ?auto_576303 ?auto_576312 ) ) ( not ( = ?auto_576303 ?auto_576313 ) ) ( not ( = ?auto_576303 ?auto_576314 ) ) ( not ( = ?auto_576303 ?auto_576315 ) ) ( not ( = ?auto_576304 ?auto_576305 ) ) ( not ( = ?auto_576304 ?auto_576306 ) ) ( not ( = ?auto_576304 ?auto_576307 ) ) ( not ( = ?auto_576304 ?auto_576308 ) ) ( not ( = ?auto_576304 ?auto_576309 ) ) ( not ( = ?auto_576304 ?auto_576310 ) ) ( not ( = ?auto_576304 ?auto_576311 ) ) ( not ( = ?auto_576304 ?auto_576312 ) ) ( not ( = ?auto_576304 ?auto_576313 ) ) ( not ( = ?auto_576304 ?auto_576314 ) ) ( not ( = ?auto_576304 ?auto_576315 ) ) ( not ( = ?auto_576305 ?auto_576306 ) ) ( not ( = ?auto_576305 ?auto_576307 ) ) ( not ( = ?auto_576305 ?auto_576308 ) ) ( not ( = ?auto_576305 ?auto_576309 ) ) ( not ( = ?auto_576305 ?auto_576310 ) ) ( not ( = ?auto_576305 ?auto_576311 ) ) ( not ( = ?auto_576305 ?auto_576312 ) ) ( not ( = ?auto_576305 ?auto_576313 ) ) ( not ( = ?auto_576305 ?auto_576314 ) ) ( not ( = ?auto_576305 ?auto_576315 ) ) ( not ( = ?auto_576306 ?auto_576307 ) ) ( not ( = ?auto_576306 ?auto_576308 ) ) ( not ( = ?auto_576306 ?auto_576309 ) ) ( not ( = ?auto_576306 ?auto_576310 ) ) ( not ( = ?auto_576306 ?auto_576311 ) ) ( not ( = ?auto_576306 ?auto_576312 ) ) ( not ( = ?auto_576306 ?auto_576313 ) ) ( not ( = ?auto_576306 ?auto_576314 ) ) ( not ( = ?auto_576306 ?auto_576315 ) ) ( not ( = ?auto_576307 ?auto_576308 ) ) ( not ( = ?auto_576307 ?auto_576309 ) ) ( not ( = ?auto_576307 ?auto_576310 ) ) ( not ( = ?auto_576307 ?auto_576311 ) ) ( not ( = ?auto_576307 ?auto_576312 ) ) ( not ( = ?auto_576307 ?auto_576313 ) ) ( not ( = ?auto_576307 ?auto_576314 ) ) ( not ( = ?auto_576307 ?auto_576315 ) ) ( not ( = ?auto_576308 ?auto_576309 ) ) ( not ( = ?auto_576308 ?auto_576310 ) ) ( not ( = ?auto_576308 ?auto_576311 ) ) ( not ( = ?auto_576308 ?auto_576312 ) ) ( not ( = ?auto_576308 ?auto_576313 ) ) ( not ( = ?auto_576308 ?auto_576314 ) ) ( not ( = ?auto_576308 ?auto_576315 ) ) ( not ( = ?auto_576309 ?auto_576310 ) ) ( not ( = ?auto_576309 ?auto_576311 ) ) ( not ( = ?auto_576309 ?auto_576312 ) ) ( not ( = ?auto_576309 ?auto_576313 ) ) ( not ( = ?auto_576309 ?auto_576314 ) ) ( not ( = ?auto_576309 ?auto_576315 ) ) ( not ( = ?auto_576310 ?auto_576311 ) ) ( not ( = ?auto_576310 ?auto_576312 ) ) ( not ( = ?auto_576310 ?auto_576313 ) ) ( not ( = ?auto_576310 ?auto_576314 ) ) ( not ( = ?auto_576310 ?auto_576315 ) ) ( not ( = ?auto_576311 ?auto_576312 ) ) ( not ( = ?auto_576311 ?auto_576313 ) ) ( not ( = ?auto_576311 ?auto_576314 ) ) ( not ( = ?auto_576311 ?auto_576315 ) ) ( not ( = ?auto_576312 ?auto_576313 ) ) ( not ( = ?auto_576312 ?auto_576314 ) ) ( not ( = ?auto_576312 ?auto_576315 ) ) ( not ( = ?auto_576313 ?auto_576314 ) ) ( not ( = ?auto_576313 ?auto_576315 ) ) ( not ( = ?auto_576314 ?auto_576315 ) ) ( ON ?auto_576313 ?auto_576314 ) ( ON ?auto_576312 ?auto_576313 ) ( ON ?auto_576311 ?auto_576312 ) ( ON ?auto_576310 ?auto_576311 ) ( ON ?auto_576309 ?auto_576310 ) ( ON ?auto_576308 ?auto_576309 ) ( CLEAR ?auto_576306 ) ( ON ?auto_576307 ?auto_576308 ) ( CLEAR ?auto_576307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_576300 ?auto_576301 ?auto_576302 ?auto_576303 ?auto_576304 ?auto_576305 ?auto_576306 ?auto_576307 )
      ( MAKE-15PILE ?auto_576300 ?auto_576301 ?auto_576302 ?auto_576303 ?auto_576304 ?auto_576305 ?auto_576306 ?auto_576307 ?auto_576308 ?auto_576309 ?auto_576310 ?auto_576311 ?auto_576312 ?auto_576313 ?auto_576314 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_576362 - BLOCK
      ?auto_576363 - BLOCK
      ?auto_576364 - BLOCK
      ?auto_576365 - BLOCK
      ?auto_576366 - BLOCK
      ?auto_576367 - BLOCK
      ?auto_576368 - BLOCK
      ?auto_576369 - BLOCK
      ?auto_576370 - BLOCK
      ?auto_576371 - BLOCK
      ?auto_576372 - BLOCK
      ?auto_576373 - BLOCK
      ?auto_576374 - BLOCK
      ?auto_576375 - BLOCK
      ?auto_576376 - BLOCK
    )
    :vars
    (
      ?auto_576377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_576376 ?auto_576377 ) ( ON-TABLE ?auto_576362 ) ( ON ?auto_576363 ?auto_576362 ) ( ON ?auto_576364 ?auto_576363 ) ( ON ?auto_576365 ?auto_576364 ) ( ON ?auto_576366 ?auto_576365 ) ( ON ?auto_576367 ?auto_576366 ) ( not ( = ?auto_576362 ?auto_576363 ) ) ( not ( = ?auto_576362 ?auto_576364 ) ) ( not ( = ?auto_576362 ?auto_576365 ) ) ( not ( = ?auto_576362 ?auto_576366 ) ) ( not ( = ?auto_576362 ?auto_576367 ) ) ( not ( = ?auto_576362 ?auto_576368 ) ) ( not ( = ?auto_576362 ?auto_576369 ) ) ( not ( = ?auto_576362 ?auto_576370 ) ) ( not ( = ?auto_576362 ?auto_576371 ) ) ( not ( = ?auto_576362 ?auto_576372 ) ) ( not ( = ?auto_576362 ?auto_576373 ) ) ( not ( = ?auto_576362 ?auto_576374 ) ) ( not ( = ?auto_576362 ?auto_576375 ) ) ( not ( = ?auto_576362 ?auto_576376 ) ) ( not ( = ?auto_576362 ?auto_576377 ) ) ( not ( = ?auto_576363 ?auto_576364 ) ) ( not ( = ?auto_576363 ?auto_576365 ) ) ( not ( = ?auto_576363 ?auto_576366 ) ) ( not ( = ?auto_576363 ?auto_576367 ) ) ( not ( = ?auto_576363 ?auto_576368 ) ) ( not ( = ?auto_576363 ?auto_576369 ) ) ( not ( = ?auto_576363 ?auto_576370 ) ) ( not ( = ?auto_576363 ?auto_576371 ) ) ( not ( = ?auto_576363 ?auto_576372 ) ) ( not ( = ?auto_576363 ?auto_576373 ) ) ( not ( = ?auto_576363 ?auto_576374 ) ) ( not ( = ?auto_576363 ?auto_576375 ) ) ( not ( = ?auto_576363 ?auto_576376 ) ) ( not ( = ?auto_576363 ?auto_576377 ) ) ( not ( = ?auto_576364 ?auto_576365 ) ) ( not ( = ?auto_576364 ?auto_576366 ) ) ( not ( = ?auto_576364 ?auto_576367 ) ) ( not ( = ?auto_576364 ?auto_576368 ) ) ( not ( = ?auto_576364 ?auto_576369 ) ) ( not ( = ?auto_576364 ?auto_576370 ) ) ( not ( = ?auto_576364 ?auto_576371 ) ) ( not ( = ?auto_576364 ?auto_576372 ) ) ( not ( = ?auto_576364 ?auto_576373 ) ) ( not ( = ?auto_576364 ?auto_576374 ) ) ( not ( = ?auto_576364 ?auto_576375 ) ) ( not ( = ?auto_576364 ?auto_576376 ) ) ( not ( = ?auto_576364 ?auto_576377 ) ) ( not ( = ?auto_576365 ?auto_576366 ) ) ( not ( = ?auto_576365 ?auto_576367 ) ) ( not ( = ?auto_576365 ?auto_576368 ) ) ( not ( = ?auto_576365 ?auto_576369 ) ) ( not ( = ?auto_576365 ?auto_576370 ) ) ( not ( = ?auto_576365 ?auto_576371 ) ) ( not ( = ?auto_576365 ?auto_576372 ) ) ( not ( = ?auto_576365 ?auto_576373 ) ) ( not ( = ?auto_576365 ?auto_576374 ) ) ( not ( = ?auto_576365 ?auto_576375 ) ) ( not ( = ?auto_576365 ?auto_576376 ) ) ( not ( = ?auto_576365 ?auto_576377 ) ) ( not ( = ?auto_576366 ?auto_576367 ) ) ( not ( = ?auto_576366 ?auto_576368 ) ) ( not ( = ?auto_576366 ?auto_576369 ) ) ( not ( = ?auto_576366 ?auto_576370 ) ) ( not ( = ?auto_576366 ?auto_576371 ) ) ( not ( = ?auto_576366 ?auto_576372 ) ) ( not ( = ?auto_576366 ?auto_576373 ) ) ( not ( = ?auto_576366 ?auto_576374 ) ) ( not ( = ?auto_576366 ?auto_576375 ) ) ( not ( = ?auto_576366 ?auto_576376 ) ) ( not ( = ?auto_576366 ?auto_576377 ) ) ( not ( = ?auto_576367 ?auto_576368 ) ) ( not ( = ?auto_576367 ?auto_576369 ) ) ( not ( = ?auto_576367 ?auto_576370 ) ) ( not ( = ?auto_576367 ?auto_576371 ) ) ( not ( = ?auto_576367 ?auto_576372 ) ) ( not ( = ?auto_576367 ?auto_576373 ) ) ( not ( = ?auto_576367 ?auto_576374 ) ) ( not ( = ?auto_576367 ?auto_576375 ) ) ( not ( = ?auto_576367 ?auto_576376 ) ) ( not ( = ?auto_576367 ?auto_576377 ) ) ( not ( = ?auto_576368 ?auto_576369 ) ) ( not ( = ?auto_576368 ?auto_576370 ) ) ( not ( = ?auto_576368 ?auto_576371 ) ) ( not ( = ?auto_576368 ?auto_576372 ) ) ( not ( = ?auto_576368 ?auto_576373 ) ) ( not ( = ?auto_576368 ?auto_576374 ) ) ( not ( = ?auto_576368 ?auto_576375 ) ) ( not ( = ?auto_576368 ?auto_576376 ) ) ( not ( = ?auto_576368 ?auto_576377 ) ) ( not ( = ?auto_576369 ?auto_576370 ) ) ( not ( = ?auto_576369 ?auto_576371 ) ) ( not ( = ?auto_576369 ?auto_576372 ) ) ( not ( = ?auto_576369 ?auto_576373 ) ) ( not ( = ?auto_576369 ?auto_576374 ) ) ( not ( = ?auto_576369 ?auto_576375 ) ) ( not ( = ?auto_576369 ?auto_576376 ) ) ( not ( = ?auto_576369 ?auto_576377 ) ) ( not ( = ?auto_576370 ?auto_576371 ) ) ( not ( = ?auto_576370 ?auto_576372 ) ) ( not ( = ?auto_576370 ?auto_576373 ) ) ( not ( = ?auto_576370 ?auto_576374 ) ) ( not ( = ?auto_576370 ?auto_576375 ) ) ( not ( = ?auto_576370 ?auto_576376 ) ) ( not ( = ?auto_576370 ?auto_576377 ) ) ( not ( = ?auto_576371 ?auto_576372 ) ) ( not ( = ?auto_576371 ?auto_576373 ) ) ( not ( = ?auto_576371 ?auto_576374 ) ) ( not ( = ?auto_576371 ?auto_576375 ) ) ( not ( = ?auto_576371 ?auto_576376 ) ) ( not ( = ?auto_576371 ?auto_576377 ) ) ( not ( = ?auto_576372 ?auto_576373 ) ) ( not ( = ?auto_576372 ?auto_576374 ) ) ( not ( = ?auto_576372 ?auto_576375 ) ) ( not ( = ?auto_576372 ?auto_576376 ) ) ( not ( = ?auto_576372 ?auto_576377 ) ) ( not ( = ?auto_576373 ?auto_576374 ) ) ( not ( = ?auto_576373 ?auto_576375 ) ) ( not ( = ?auto_576373 ?auto_576376 ) ) ( not ( = ?auto_576373 ?auto_576377 ) ) ( not ( = ?auto_576374 ?auto_576375 ) ) ( not ( = ?auto_576374 ?auto_576376 ) ) ( not ( = ?auto_576374 ?auto_576377 ) ) ( not ( = ?auto_576375 ?auto_576376 ) ) ( not ( = ?auto_576375 ?auto_576377 ) ) ( not ( = ?auto_576376 ?auto_576377 ) ) ( ON ?auto_576375 ?auto_576376 ) ( ON ?auto_576374 ?auto_576375 ) ( ON ?auto_576373 ?auto_576374 ) ( ON ?auto_576372 ?auto_576373 ) ( ON ?auto_576371 ?auto_576372 ) ( ON ?auto_576370 ?auto_576371 ) ( ON ?auto_576369 ?auto_576370 ) ( CLEAR ?auto_576367 ) ( ON ?auto_576368 ?auto_576369 ) ( CLEAR ?auto_576368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_576362 ?auto_576363 ?auto_576364 ?auto_576365 ?auto_576366 ?auto_576367 ?auto_576368 )
      ( MAKE-15PILE ?auto_576362 ?auto_576363 ?auto_576364 ?auto_576365 ?auto_576366 ?auto_576367 ?auto_576368 ?auto_576369 ?auto_576370 ?auto_576371 ?auto_576372 ?auto_576373 ?auto_576374 ?auto_576375 ?auto_576376 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_576424 - BLOCK
      ?auto_576425 - BLOCK
      ?auto_576426 - BLOCK
      ?auto_576427 - BLOCK
      ?auto_576428 - BLOCK
      ?auto_576429 - BLOCK
      ?auto_576430 - BLOCK
      ?auto_576431 - BLOCK
      ?auto_576432 - BLOCK
      ?auto_576433 - BLOCK
      ?auto_576434 - BLOCK
      ?auto_576435 - BLOCK
      ?auto_576436 - BLOCK
      ?auto_576437 - BLOCK
      ?auto_576438 - BLOCK
    )
    :vars
    (
      ?auto_576439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_576438 ?auto_576439 ) ( ON-TABLE ?auto_576424 ) ( ON ?auto_576425 ?auto_576424 ) ( ON ?auto_576426 ?auto_576425 ) ( ON ?auto_576427 ?auto_576426 ) ( ON ?auto_576428 ?auto_576427 ) ( not ( = ?auto_576424 ?auto_576425 ) ) ( not ( = ?auto_576424 ?auto_576426 ) ) ( not ( = ?auto_576424 ?auto_576427 ) ) ( not ( = ?auto_576424 ?auto_576428 ) ) ( not ( = ?auto_576424 ?auto_576429 ) ) ( not ( = ?auto_576424 ?auto_576430 ) ) ( not ( = ?auto_576424 ?auto_576431 ) ) ( not ( = ?auto_576424 ?auto_576432 ) ) ( not ( = ?auto_576424 ?auto_576433 ) ) ( not ( = ?auto_576424 ?auto_576434 ) ) ( not ( = ?auto_576424 ?auto_576435 ) ) ( not ( = ?auto_576424 ?auto_576436 ) ) ( not ( = ?auto_576424 ?auto_576437 ) ) ( not ( = ?auto_576424 ?auto_576438 ) ) ( not ( = ?auto_576424 ?auto_576439 ) ) ( not ( = ?auto_576425 ?auto_576426 ) ) ( not ( = ?auto_576425 ?auto_576427 ) ) ( not ( = ?auto_576425 ?auto_576428 ) ) ( not ( = ?auto_576425 ?auto_576429 ) ) ( not ( = ?auto_576425 ?auto_576430 ) ) ( not ( = ?auto_576425 ?auto_576431 ) ) ( not ( = ?auto_576425 ?auto_576432 ) ) ( not ( = ?auto_576425 ?auto_576433 ) ) ( not ( = ?auto_576425 ?auto_576434 ) ) ( not ( = ?auto_576425 ?auto_576435 ) ) ( not ( = ?auto_576425 ?auto_576436 ) ) ( not ( = ?auto_576425 ?auto_576437 ) ) ( not ( = ?auto_576425 ?auto_576438 ) ) ( not ( = ?auto_576425 ?auto_576439 ) ) ( not ( = ?auto_576426 ?auto_576427 ) ) ( not ( = ?auto_576426 ?auto_576428 ) ) ( not ( = ?auto_576426 ?auto_576429 ) ) ( not ( = ?auto_576426 ?auto_576430 ) ) ( not ( = ?auto_576426 ?auto_576431 ) ) ( not ( = ?auto_576426 ?auto_576432 ) ) ( not ( = ?auto_576426 ?auto_576433 ) ) ( not ( = ?auto_576426 ?auto_576434 ) ) ( not ( = ?auto_576426 ?auto_576435 ) ) ( not ( = ?auto_576426 ?auto_576436 ) ) ( not ( = ?auto_576426 ?auto_576437 ) ) ( not ( = ?auto_576426 ?auto_576438 ) ) ( not ( = ?auto_576426 ?auto_576439 ) ) ( not ( = ?auto_576427 ?auto_576428 ) ) ( not ( = ?auto_576427 ?auto_576429 ) ) ( not ( = ?auto_576427 ?auto_576430 ) ) ( not ( = ?auto_576427 ?auto_576431 ) ) ( not ( = ?auto_576427 ?auto_576432 ) ) ( not ( = ?auto_576427 ?auto_576433 ) ) ( not ( = ?auto_576427 ?auto_576434 ) ) ( not ( = ?auto_576427 ?auto_576435 ) ) ( not ( = ?auto_576427 ?auto_576436 ) ) ( not ( = ?auto_576427 ?auto_576437 ) ) ( not ( = ?auto_576427 ?auto_576438 ) ) ( not ( = ?auto_576427 ?auto_576439 ) ) ( not ( = ?auto_576428 ?auto_576429 ) ) ( not ( = ?auto_576428 ?auto_576430 ) ) ( not ( = ?auto_576428 ?auto_576431 ) ) ( not ( = ?auto_576428 ?auto_576432 ) ) ( not ( = ?auto_576428 ?auto_576433 ) ) ( not ( = ?auto_576428 ?auto_576434 ) ) ( not ( = ?auto_576428 ?auto_576435 ) ) ( not ( = ?auto_576428 ?auto_576436 ) ) ( not ( = ?auto_576428 ?auto_576437 ) ) ( not ( = ?auto_576428 ?auto_576438 ) ) ( not ( = ?auto_576428 ?auto_576439 ) ) ( not ( = ?auto_576429 ?auto_576430 ) ) ( not ( = ?auto_576429 ?auto_576431 ) ) ( not ( = ?auto_576429 ?auto_576432 ) ) ( not ( = ?auto_576429 ?auto_576433 ) ) ( not ( = ?auto_576429 ?auto_576434 ) ) ( not ( = ?auto_576429 ?auto_576435 ) ) ( not ( = ?auto_576429 ?auto_576436 ) ) ( not ( = ?auto_576429 ?auto_576437 ) ) ( not ( = ?auto_576429 ?auto_576438 ) ) ( not ( = ?auto_576429 ?auto_576439 ) ) ( not ( = ?auto_576430 ?auto_576431 ) ) ( not ( = ?auto_576430 ?auto_576432 ) ) ( not ( = ?auto_576430 ?auto_576433 ) ) ( not ( = ?auto_576430 ?auto_576434 ) ) ( not ( = ?auto_576430 ?auto_576435 ) ) ( not ( = ?auto_576430 ?auto_576436 ) ) ( not ( = ?auto_576430 ?auto_576437 ) ) ( not ( = ?auto_576430 ?auto_576438 ) ) ( not ( = ?auto_576430 ?auto_576439 ) ) ( not ( = ?auto_576431 ?auto_576432 ) ) ( not ( = ?auto_576431 ?auto_576433 ) ) ( not ( = ?auto_576431 ?auto_576434 ) ) ( not ( = ?auto_576431 ?auto_576435 ) ) ( not ( = ?auto_576431 ?auto_576436 ) ) ( not ( = ?auto_576431 ?auto_576437 ) ) ( not ( = ?auto_576431 ?auto_576438 ) ) ( not ( = ?auto_576431 ?auto_576439 ) ) ( not ( = ?auto_576432 ?auto_576433 ) ) ( not ( = ?auto_576432 ?auto_576434 ) ) ( not ( = ?auto_576432 ?auto_576435 ) ) ( not ( = ?auto_576432 ?auto_576436 ) ) ( not ( = ?auto_576432 ?auto_576437 ) ) ( not ( = ?auto_576432 ?auto_576438 ) ) ( not ( = ?auto_576432 ?auto_576439 ) ) ( not ( = ?auto_576433 ?auto_576434 ) ) ( not ( = ?auto_576433 ?auto_576435 ) ) ( not ( = ?auto_576433 ?auto_576436 ) ) ( not ( = ?auto_576433 ?auto_576437 ) ) ( not ( = ?auto_576433 ?auto_576438 ) ) ( not ( = ?auto_576433 ?auto_576439 ) ) ( not ( = ?auto_576434 ?auto_576435 ) ) ( not ( = ?auto_576434 ?auto_576436 ) ) ( not ( = ?auto_576434 ?auto_576437 ) ) ( not ( = ?auto_576434 ?auto_576438 ) ) ( not ( = ?auto_576434 ?auto_576439 ) ) ( not ( = ?auto_576435 ?auto_576436 ) ) ( not ( = ?auto_576435 ?auto_576437 ) ) ( not ( = ?auto_576435 ?auto_576438 ) ) ( not ( = ?auto_576435 ?auto_576439 ) ) ( not ( = ?auto_576436 ?auto_576437 ) ) ( not ( = ?auto_576436 ?auto_576438 ) ) ( not ( = ?auto_576436 ?auto_576439 ) ) ( not ( = ?auto_576437 ?auto_576438 ) ) ( not ( = ?auto_576437 ?auto_576439 ) ) ( not ( = ?auto_576438 ?auto_576439 ) ) ( ON ?auto_576437 ?auto_576438 ) ( ON ?auto_576436 ?auto_576437 ) ( ON ?auto_576435 ?auto_576436 ) ( ON ?auto_576434 ?auto_576435 ) ( ON ?auto_576433 ?auto_576434 ) ( ON ?auto_576432 ?auto_576433 ) ( ON ?auto_576431 ?auto_576432 ) ( ON ?auto_576430 ?auto_576431 ) ( CLEAR ?auto_576428 ) ( ON ?auto_576429 ?auto_576430 ) ( CLEAR ?auto_576429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_576424 ?auto_576425 ?auto_576426 ?auto_576427 ?auto_576428 ?auto_576429 )
      ( MAKE-15PILE ?auto_576424 ?auto_576425 ?auto_576426 ?auto_576427 ?auto_576428 ?auto_576429 ?auto_576430 ?auto_576431 ?auto_576432 ?auto_576433 ?auto_576434 ?auto_576435 ?auto_576436 ?auto_576437 ?auto_576438 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_576486 - BLOCK
      ?auto_576487 - BLOCK
      ?auto_576488 - BLOCK
      ?auto_576489 - BLOCK
      ?auto_576490 - BLOCK
      ?auto_576491 - BLOCK
      ?auto_576492 - BLOCK
      ?auto_576493 - BLOCK
      ?auto_576494 - BLOCK
      ?auto_576495 - BLOCK
      ?auto_576496 - BLOCK
      ?auto_576497 - BLOCK
      ?auto_576498 - BLOCK
      ?auto_576499 - BLOCK
      ?auto_576500 - BLOCK
    )
    :vars
    (
      ?auto_576501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_576500 ?auto_576501 ) ( ON-TABLE ?auto_576486 ) ( ON ?auto_576487 ?auto_576486 ) ( ON ?auto_576488 ?auto_576487 ) ( ON ?auto_576489 ?auto_576488 ) ( not ( = ?auto_576486 ?auto_576487 ) ) ( not ( = ?auto_576486 ?auto_576488 ) ) ( not ( = ?auto_576486 ?auto_576489 ) ) ( not ( = ?auto_576486 ?auto_576490 ) ) ( not ( = ?auto_576486 ?auto_576491 ) ) ( not ( = ?auto_576486 ?auto_576492 ) ) ( not ( = ?auto_576486 ?auto_576493 ) ) ( not ( = ?auto_576486 ?auto_576494 ) ) ( not ( = ?auto_576486 ?auto_576495 ) ) ( not ( = ?auto_576486 ?auto_576496 ) ) ( not ( = ?auto_576486 ?auto_576497 ) ) ( not ( = ?auto_576486 ?auto_576498 ) ) ( not ( = ?auto_576486 ?auto_576499 ) ) ( not ( = ?auto_576486 ?auto_576500 ) ) ( not ( = ?auto_576486 ?auto_576501 ) ) ( not ( = ?auto_576487 ?auto_576488 ) ) ( not ( = ?auto_576487 ?auto_576489 ) ) ( not ( = ?auto_576487 ?auto_576490 ) ) ( not ( = ?auto_576487 ?auto_576491 ) ) ( not ( = ?auto_576487 ?auto_576492 ) ) ( not ( = ?auto_576487 ?auto_576493 ) ) ( not ( = ?auto_576487 ?auto_576494 ) ) ( not ( = ?auto_576487 ?auto_576495 ) ) ( not ( = ?auto_576487 ?auto_576496 ) ) ( not ( = ?auto_576487 ?auto_576497 ) ) ( not ( = ?auto_576487 ?auto_576498 ) ) ( not ( = ?auto_576487 ?auto_576499 ) ) ( not ( = ?auto_576487 ?auto_576500 ) ) ( not ( = ?auto_576487 ?auto_576501 ) ) ( not ( = ?auto_576488 ?auto_576489 ) ) ( not ( = ?auto_576488 ?auto_576490 ) ) ( not ( = ?auto_576488 ?auto_576491 ) ) ( not ( = ?auto_576488 ?auto_576492 ) ) ( not ( = ?auto_576488 ?auto_576493 ) ) ( not ( = ?auto_576488 ?auto_576494 ) ) ( not ( = ?auto_576488 ?auto_576495 ) ) ( not ( = ?auto_576488 ?auto_576496 ) ) ( not ( = ?auto_576488 ?auto_576497 ) ) ( not ( = ?auto_576488 ?auto_576498 ) ) ( not ( = ?auto_576488 ?auto_576499 ) ) ( not ( = ?auto_576488 ?auto_576500 ) ) ( not ( = ?auto_576488 ?auto_576501 ) ) ( not ( = ?auto_576489 ?auto_576490 ) ) ( not ( = ?auto_576489 ?auto_576491 ) ) ( not ( = ?auto_576489 ?auto_576492 ) ) ( not ( = ?auto_576489 ?auto_576493 ) ) ( not ( = ?auto_576489 ?auto_576494 ) ) ( not ( = ?auto_576489 ?auto_576495 ) ) ( not ( = ?auto_576489 ?auto_576496 ) ) ( not ( = ?auto_576489 ?auto_576497 ) ) ( not ( = ?auto_576489 ?auto_576498 ) ) ( not ( = ?auto_576489 ?auto_576499 ) ) ( not ( = ?auto_576489 ?auto_576500 ) ) ( not ( = ?auto_576489 ?auto_576501 ) ) ( not ( = ?auto_576490 ?auto_576491 ) ) ( not ( = ?auto_576490 ?auto_576492 ) ) ( not ( = ?auto_576490 ?auto_576493 ) ) ( not ( = ?auto_576490 ?auto_576494 ) ) ( not ( = ?auto_576490 ?auto_576495 ) ) ( not ( = ?auto_576490 ?auto_576496 ) ) ( not ( = ?auto_576490 ?auto_576497 ) ) ( not ( = ?auto_576490 ?auto_576498 ) ) ( not ( = ?auto_576490 ?auto_576499 ) ) ( not ( = ?auto_576490 ?auto_576500 ) ) ( not ( = ?auto_576490 ?auto_576501 ) ) ( not ( = ?auto_576491 ?auto_576492 ) ) ( not ( = ?auto_576491 ?auto_576493 ) ) ( not ( = ?auto_576491 ?auto_576494 ) ) ( not ( = ?auto_576491 ?auto_576495 ) ) ( not ( = ?auto_576491 ?auto_576496 ) ) ( not ( = ?auto_576491 ?auto_576497 ) ) ( not ( = ?auto_576491 ?auto_576498 ) ) ( not ( = ?auto_576491 ?auto_576499 ) ) ( not ( = ?auto_576491 ?auto_576500 ) ) ( not ( = ?auto_576491 ?auto_576501 ) ) ( not ( = ?auto_576492 ?auto_576493 ) ) ( not ( = ?auto_576492 ?auto_576494 ) ) ( not ( = ?auto_576492 ?auto_576495 ) ) ( not ( = ?auto_576492 ?auto_576496 ) ) ( not ( = ?auto_576492 ?auto_576497 ) ) ( not ( = ?auto_576492 ?auto_576498 ) ) ( not ( = ?auto_576492 ?auto_576499 ) ) ( not ( = ?auto_576492 ?auto_576500 ) ) ( not ( = ?auto_576492 ?auto_576501 ) ) ( not ( = ?auto_576493 ?auto_576494 ) ) ( not ( = ?auto_576493 ?auto_576495 ) ) ( not ( = ?auto_576493 ?auto_576496 ) ) ( not ( = ?auto_576493 ?auto_576497 ) ) ( not ( = ?auto_576493 ?auto_576498 ) ) ( not ( = ?auto_576493 ?auto_576499 ) ) ( not ( = ?auto_576493 ?auto_576500 ) ) ( not ( = ?auto_576493 ?auto_576501 ) ) ( not ( = ?auto_576494 ?auto_576495 ) ) ( not ( = ?auto_576494 ?auto_576496 ) ) ( not ( = ?auto_576494 ?auto_576497 ) ) ( not ( = ?auto_576494 ?auto_576498 ) ) ( not ( = ?auto_576494 ?auto_576499 ) ) ( not ( = ?auto_576494 ?auto_576500 ) ) ( not ( = ?auto_576494 ?auto_576501 ) ) ( not ( = ?auto_576495 ?auto_576496 ) ) ( not ( = ?auto_576495 ?auto_576497 ) ) ( not ( = ?auto_576495 ?auto_576498 ) ) ( not ( = ?auto_576495 ?auto_576499 ) ) ( not ( = ?auto_576495 ?auto_576500 ) ) ( not ( = ?auto_576495 ?auto_576501 ) ) ( not ( = ?auto_576496 ?auto_576497 ) ) ( not ( = ?auto_576496 ?auto_576498 ) ) ( not ( = ?auto_576496 ?auto_576499 ) ) ( not ( = ?auto_576496 ?auto_576500 ) ) ( not ( = ?auto_576496 ?auto_576501 ) ) ( not ( = ?auto_576497 ?auto_576498 ) ) ( not ( = ?auto_576497 ?auto_576499 ) ) ( not ( = ?auto_576497 ?auto_576500 ) ) ( not ( = ?auto_576497 ?auto_576501 ) ) ( not ( = ?auto_576498 ?auto_576499 ) ) ( not ( = ?auto_576498 ?auto_576500 ) ) ( not ( = ?auto_576498 ?auto_576501 ) ) ( not ( = ?auto_576499 ?auto_576500 ) ) ( not ( = ?auto_576499 ?auto_576501 ) ) ( not ( = ?auto_576500 ?auto_576501 ) ) ( ON ?auto_576499 ?auto_576500 ) ( ON ?auto_576498 ?auto_576499 ) ( ON ?auto_576497 ?auto_576498 ) ( ON ?auto_576496 ?auto_576497 ) ( ON ?auto_576495 ?auto_576496 ) ( ON ?auto_576494 ?auto_576495 ) ( ON ?auto_576493 ?auto_576494 ) ( ON ?auto_576492 ?auto_576493 ) ( ON ?auto_576491 ?auto_576492 ) ( CLEAR ?auto_576489 ) ( ON ?auto_576490 ?auto_576491 ) ( CLEAR ?auto_576490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_576486 ?auto_576487 ?auto_576488 ?auto_576489 ?auto_576490 )
      ( MAKE-15PILE ?auto_576486 ?auto_576487 ?auto_576488 ?auto_576489 ?auto_576490 ?auto_576491 ?auto_576492 ?auto_576493 ?auto_576494 ?auto_576495 ?auto_576496 ?auto_576497 ?auto_576498 ?auto_576499 ?auto_576500 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_576548 - BLOCK
      ?auto_576549 - BLOCK
      ?auto_576550 - BLOCK
      ?auto_576551 - BLOCK
      ?auto_576552 - BLOCK
      ?auto_576553 - BLOCK
      ?auto_576554 - BLOCK
      ?auto_576555 - BLOCK
      ?auto_576556 - BLOCK
      ?auto_576557 - BLOCK
      ?auto_576558 - BLOCK
      ?auto_576559 - BLOCK
      ?auto_576560 - BLOCK
      ?auto_576561 - BLOCK
      ?auto_576562 - BLOCK
    )
    :vars
    (
      ?auto_576563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_576562 ?auto_576563 ) ( ON-TABLE ?auto_576548 ) ( ON ?auto_576549 ?auto_576548 ) ( ON ?auto_576550 ?auto_576549 ) ( not ( = ?auto_576548 ?auto_576549 ) ) ( not ( = ?auto_576548 ?auto_576550 ) ) ( not ( = ?auto_576548 ?auto_576551 ) ) ( not ( = ?auto_576548 ?auto_576552 ) ) ( not ( = ?auto_576548 ?auto_576553 ) ) ( not ( = ?auto_576548 ?auto_576554 ) ) ( not ( = ?auto_576548 ?auto_576555 ) ) ( not ( = ?auto_576548 ?auto_576556 ) ) ( not ( = ?auto_576548 ?auto_576557 ) ) ( not ( = ?auto_576548 ?auto_576558 ) ) ( not ( = ?auto_576548 ?auto_576559 ) ) ( not ( = ?auto_576548 ?auto_576560 ) ) ( not ( = ?auto_576548 ?auto_576561 ) ) ( not ( = ?auto_576548 ?auto_576562 ) ) ( not ( = ?auto_576548 ?auto_576563 ) ) ( not ( = ?auto_576549 ?auto_576550 ) ) ( not ( = ?auto_576549 ?auto_576551 ) ) ( not ( = ?auto_576549 ?auto_576552 ) ) ( not ( = ?auto_576549 ?auto_576553 ) ) ( not ( = ?auto_576549 ?auto_576554 ) ) ( not ( = ?auto_576549 ?auto_576555 ) ) ( not ( = ?auto_576549 ?auto_576556 ) ) ( not ( = ?auto_576549 ?auto_576557 ) ) ( not ( = ?auto_576549 ?auto_576558 ) ) ( not ( = ?auto_576549 ?auto_576559 ) ) ( not ( = ?auto_576549 ?auto_576560 ) ) ( not ( = ?auto_576549 ?auto_576561 ) ) ( not ( = ?auto_576549 ?auto_576562 ) ) ( not ( = ?auto_576549 ?auto_576563 ) ) ( not ( = ?auto_576550 ?auto_576551 ) ) ( not ( = ?auto_576550 ?auto_576552 ) ) ( not ( = ?auto_576550 ?auto_576553 ) ) ( not ( = ?auto_576550 ?auto_576554 ) ) ( not ( = ?auto_576550 ?auto_576555 ) ) ( not ( = ?auto_576550 ?auto_576556 ) ) ( not ( = ?auto_576550 ?auto_576557 ) ) ( not ( = ?auto_576550 ?auto_576558 ) ) ( not ( = ?auto_576550 ?auto_576559 ) ) ( not ( = ?auto_576550 ?auto_576560 ) ) ( not ( = ?auto_576550 ?auto_576561 ) ) ( not ( = ?auto_576550 ?auto_576562 ) ) ( not ( = ?auto_576550 ?auto_576563 ) ) ( not ( = ?auto_576551 ?auto_576552 ) ) ( not ( = ?auto_576551 ?auto_576553 ) ) ( not ( = ?auto_576551 ?auto_576554 ) ) ( not ( = ?auto_576551 ?auto_576555 ) ) ( not ( = ?auto_576551 ?auto_576556 ) ) ( not ( = ?auto_576551 ?auto_576557 ) ) ( not ( = ?auto_576551 ?auto_576558 ) ) ( not ( = ?auto_576551 ?auto_576559 ) ) ( not ( = ?auto_576551 ?auto_576560 ) ) ( not ( = ?auto_576551 ?auto_576561 ) ) ( not ( = ?auto_576551 ?auto_576562 ) ) ( not ( = ?auto_576551 ?auto_576563 ) ) ( not ( = ?auto_576552 ?auto_576553 ) ) ( not ( = ?auto_576552 ?auto_576554 ) ) ( not ( = ?auto_576552 ?auto_576555 ) ) ( not ( = ?auto_576552 ?auto_576556 ) ) ( not ( = ?auto_576552 ?auto_576557 ) ) ( not ( = ?auto_576552 ?auto_576558 ) ) ( not ( = ?auto_576552 ?auto_576559 ) ) ( not ( = ?auto_576552 ?auto_576560 ) ) ( not ( = ?auto_576552 ?auto_576561 ) ) ( not ( = ?auto_576552 ?auto_576562 ) ) ( not ( = ?auto_576552 ?auto_576563 ) ) ( not ( = ?auto_576553 ?auto_576554 ) ) ( not ( = ?auto_576553 ?auto_576555 ) ) ( not ( = ?auto_576553 ?auto_576556 ) ) ( not ( = ?auto_576553 ?auto_576557 ) ) ( not ( = ?auto_576553 ?auto_576558 ) ) ( not ( = ?auto_576553 ?auto_576559 ) ) ( not ( = ?auto_576553 ?auto_576560 ) ) ( not ( = ?auto_576553 ?auto_576561 ) ) ( not ( = ?auto_576553 ?auto_576562 ) ) ( not ( = ?auto_576553 ?auto_576563 ) ) ( not ( = ?auto_576554 ?auto_576555 ) ) ( not ( = ?auto_576554 ?auto_576556 ) ) ( not ( = ?auto_576554 ?auto_576557 ) ) ( not ( = ?auto_576554 ?auto_576558 ) ) ( not ( = ?auto_576554 ?auto_576559 ) ) ( not ( = ?auto_576554 ?auto_576560 ) ) ( not ( = ?auto_576554 ?auto_576561 ) ) ( not ( = ?auto_576554 ?auto_576562 ) ) ( not ( = ?auto_576554 ?auto_576563 ) ) ( not ( = ?auto_576555 ?auto_576556 ) ) ( not ( = ?auto_576555 ?auto_576557 ) ) ( not ( = ?auto_576555 ?auto_576558 ) ) ( not ( = ?auto_576555 ?auto_576559 ) ) ( not ( = ?auto_576555 ?auto_576560 ) ) ( not ( = ?auto_576555 ?auto_576561 ) ) ( not ( = ?auto_576555 ?auto_576562 ) ) ( not ( = ?auto_576555 ?auto_576563 ) ) ( not ( = ?auto_576556 ?auto_576557 ) ) ( not ( = ?auto_576556 ?auto_576558 ) ) ( not ( = ?auto_576556 ?auto_576559 ) ) ( not ( = ?auto_576556 ?auto_576560 ) ) ( not ( = ?auto_576556 ?auto_576561 ) ) ( not ( = ?auto_576556 ?auto_576562 ) ) ( not ( = ?auto_576556 ?auto_576563 ) ) ( not ( = ?auto_576557 ?auto_576558 ) ) ( not ( = ?auto_576557 ?auto_576559 ) ) ( not ( = ?auto_576557 ?auto_576560 ) ) ( not ( = ?auto_576557 ?auto_576561 ) ) ( not ( = ?auto_576557 ?auto_576562 ) ) ( not ( = ?auto_576557 ?auto_576563 ) ) ( not ( = ?auto_576558 ?auto_576559 ) ) ( not ( = ?auto_576558 ?auto_576560 ) ) ( not ( = ?auto_576558 ?auto_576561 ) ) ( not ( = ?auto_576558 ?auto_576562 ) ) ( not ( = ?auto_576558 ?auto_576563 ) ) ( not ( = ?auto_576559 ?auto_576560 ) ) ( not ( = ?auto_576559 ?auto_576561 ) ) ( not ( = ?auto_576559 ?auto_576562 ) ) ( not ( = ?auto_576559 ?auto_576563 ) ) ( not ( = ?auto_576560 ?auto_576561 ) ) ( not ( = ?auto_576560 ?auto_576562 ) ) ( not ( = ?auto_576560 ?auto_576563 ) ) ( not ( = ?auto_576561 ?auto_576562 ) ) ( not ( = ?auto_576561 ?auto_576563 ) ) ( not ( = ?auto_576562 ?auto_576563 ) ) ( ON ?auto_576561 ?auto_576562 ) ( ON ?auto_576560 ?auto_576561 ) ( ON ?auto_576559 ?auto_576560 ) ( ON ?auto_576558 ?auto_576559 ) ( ON ?auto_576557 ?auto_576558 ) ( ON ?auto_576556 ?auto_576557 ) ( ON ?auto_576555 ?auto_576556 ) ( ON ?auto_576554 ?auto_576555 ) ( ON ?auto_576553 ?auto_576554 ) ( ON ?auto_576552 ?auto_576553 ) ( CLEAR ?auto_576550 ) ( ON ?auto_576551 ?auto_576552 ) ( CLEAR ?auto_576551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_576548 ?auto_576549 ?auto_576550 ?auto_576551 )
      ( MAKE-15PILE ?auto_576548 ?auto_576549 ?auto_576550 ?auto_576551 ?auto_576552 ?auto_576553 ?auto_576554 ?auto_576555 ?auto_576556 ?auto_576557 ?auto_576558 ?auto_576559 ?auto_576560 ?auto_576561 ?auto_576562 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_576610 - BLOCK
      ?auto_576611 - BLOCK
      ?auto_576612 - BLOCK
      ?auto_576613 - BLOCK
      ?auto_576614 - BLOCK
      ?auto_576615 - BLOCK
      ?auto_576616 - BLOCK
      ?auto_576617 - BLOCK
      ?auto_576618 - BLOCK
      ?auto_576619 - BLOCK
      ?auto_576620 - BLOCK
      ?auto_576621 - BLOCK
      ?auto_576622 - BLOCK
      ?auto_576623 - BLOCK
      ?auto_576624 - BLOCK
    )
    :vars
    (
      ?auto_576625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_576624 ?auto_576625 ) ( ON-TABLE ?auto_576610 ) ( ON ?auto_576611 ?auto_576610 ) ( not ( = ?auto_576610 ?auto_576611 ) ) ( not ( = ?auto_576610 ?auto_576612 ) ) ( not ( = ?auto_576610 ?auto_576613 ) ) ( not ( = ?auto_576610 ?auto_576614 ) ) ( not ( = ?auto_576610 ?auto_576615 ) ) ( not ( = ?auto_576610 ?auto_576616 ) ) ( not ( = ?auto_576610 ?auto_576617 ) ) ( not ( = ?auto_576610 ?auto_576618 ) ) ( not ( = ?auto_576610 ?auto_576619 ) ) ( not ( = ?auto_576610 ?auto_576620 ) ) ( not ( = ?auto_576610 ?auto_576621 ) ) ( not ( = ?auto_576610 ?auto_576622 ) ) ( not ( = ?auto_576610 ?auto_576623 ) ) ( not ( = ?auto_576610 ?auto_576624 ) ) ( not ( = ?auto_576610 ?auto_576625 ) ) ( not ( = ?auto_576611 ?auto_576612 ) ) ( not ( = ?auto_576611 ?auto_576613 ) ) ( not ( = ?auto_576611 ?auto_576614 ) ) ( not ( = ?auto_576611 ?auto_576615 ) ) ( not ( = ?auto_576611 ?auto_576616 ) ) ( not ( = ?auto_576611 ?auto_576617 ) ) ( not ( = ?auto_576611 ?auto_576618 ) ) ( not ( = ?auto_576611 ?auto_576619 ) ) ( not ( = ?auto_576611 ?auto_576620 ) ) ( not ( = ?auto_576611 ?auto_576621 ) ) ( not ( = ?auto_576611 ?auto_576622 ) ) ( not ( = ?auto_576611 ?auto_576623 ) ) ( not ( = ?auto_576611 ?auto_576624 ) ) ( not ( = ?auto_576611 ?auto_576625 ) ) ( not ( = ?auto_576612 ?auto_576613 ) ) ( not ( = ?auto_576612 ?auto_576614 ) ) ( not ( = ?auto_576612 ?auto_576615 ) ) ( not ( = ?auto_576612 ?auto_576616 ) ) ( not ( = ?auto_576612 ?auto_576617 ) ) ( not ( = ?auto_576612 ?auto_576618 ) ) ( not ( = ?auto_576612 ?auto_576619 ) ) ( not ( = ?auto_576612 ?auto_576620 ) ) ( not ( = ?auto_576612 ?auto_576621 ) ) ( not ( = ?auto_576612 ?auto_576622 ) ) ( not ( = ?auto_576612 ?auto_576623 ) ) ( not ( = ?auto_576612 ?auto_576624 ) ) ( not ( = ?auto_576612 ?auto_576625 ) ) ( not ( = ?auto_576613 ?auto_576614 ) ) ( not ( = ?auto_576613 ?auto_576615 ) ) ( not ( = ?auto_576613 ?auto_576616 ) ) ( not ( = ?auto_576613 ?auto_576617 ) ) ( not ( = ?auto_576613 ?auto_576618 ) ) ( not ( = ?auto_576613 ?auto_576619 ) ) ( not ( = ?auto_576613 ?auto_576620 ) ) ( not ( = ?auto_576613 ?auto_576621 ) ) ( not ( = ?auto_576613 ?auto_576622 ) ) ( not ( = ?auto_576613 ?auto_576623 ) ) ( not ( = ?auto_576613 ?auto_576624 ) ) ( not ( = ?auto_576613 ?auto_576625 ) ) ( not ( = ?auto_576614 ?auto_576615 ) ) ( not ( = ?auto_576614 ?auto_576616 ) ) ( not ( = ?auto_576614 ?auto_576617 ) ) ( not ( = ?auto_576614 ?auto_576618 ) ) ( not ( = ?auto_576614 ?auto_576619 ) ) ( not ( = ?auto_576614 ?auto_576620 ) ) ( not ( = ?auto_576614 ?auto_576621 ) ) ( not ( = ?auto_576614 ?auto_576622 ) ) ( not ( = ?auto_576614 ?auto_576623 ) ) ( not ( = ?auto_576614 ?auto_576624 ) ) ( not ( = ?auto_576614 ?auto_576625 ) ) ( not ( = ?auto_576615 ?auto_576616 ) ) ( not ( = ?auto_576615 ?auto_576617 ) ) ( not ( = ?auto_576615 ?auto_576618 ) ) ( not ( = ?auto_576615 ?auto_576619 ) ) ( not ( = ?auto_576615 ?auto_576620 ) ) ( not ( = ?auto_576615 ?auto_576621 ) ) ( not ( = ?auto_576615 ?auto_576622 ) ) ( not ( = ?auto_576615 ?auto_576623 ) ) ( not ( = ?auto_576615 ?auto_576624 ) ) ( not ( = ?auto_576615 ?auto_576625 ) ) ( not ( = ?auto_576616 ?auto_576617 ) ) ( not ( = ?auto_576616 ?auto_576618 ) ) ( not ( = ?auto_576616 ?auto_576619 ) ) ( not ( = ?auto_576616 ?auto_576620 ) ) ( not ( = ?auto_576616 ?auto_576621 ) ) ( not ( = ?auto_576616 ?auto_576622 ) ) ( not ( = ?auto_576616 ?auto_576623 ) ) ( not ( = ?auto_576616 ?auto_576624 ) ) ( not ( = ?auto_576616 ?auto_576625 ) ) ( not ( = ?auto_576617 ?auto_576618 ) ) ( not ( = ?auto_576617 ?auto_576619 ) ) ( not ( = ?auto_576617 ?auto_576620 ) ) ( not ( = ?auto_576617 ?auto_576621 ) ) ( not ( = ?auto_576617 ?auto_576622 ) ) ( not ( = ?auto_576617 ?auto_576623 ) ) ( not ( = ?auto_576617 ?auto_576624 ) ) ( not ( = ?auto_576617 ?auto_576625 ) ) ( not ( = ?auto_576618 ?auto_576619 ) ) ( not ( = ?auto_576618 ?auto_576620 ) ) ( not ( = ?auto_576618 ?auto_576621 ) ) ( not ( = ?auto_576618 ?auto_576622 ) ) ( not ( = ?auto_576618 ?auto_576623 ) ) ( not ( = ?auto_576618 ?auto_576624 ) ) ( not ( = ?auto_576618 ?auto_576625 ) ) ( not ( = ?auto_576619 ?auto_576620 ) ) ( not ( = ?auto_576619 ?auto_576621 ) ) ( not ( = ?auto_576619 ?auto_576622 ) ) ( not ( = ?auto_576619 ?auto_576623 ) ) ( not ( = ?auto_576619 ?auto_576624 ) ) ( not ( = ?auto_576619 ?auto_576625 ) ) ( not ( = ?auto_576620 ?auto_576621 ) ) ( not ( = ?auto_576620 ?auto_576622 ) ) ( not ( = ?auto_576620 ?auto_576623 ) ) ( not ( = ?auto_576620 ?auto_576624 ) ) ( not ( = ?auto_576620 ?auto_576625 ) ) ( not ( = ?auto_576621 ?auto_576622 ) ) ( not ( = ?auto_576621 ?auto_576623 ) ) ( not ( = ?auto_576621 ?auto_576624 ) ) ( not ( = ?auto_576621 ?auto_576625 ) ) ( not ( = ?auto_576622 ?auto_576623 ) ) ( not ( = ?auto_576622 ?auto_576624 ) ) ( not ( = ?auto_576622 ?auto_576625 ) ) ( not ( = ?auto_576623 ?auto_576624 ) ) ( not ( = ?auto_576623 ?auto_576625 ) ) ( not ( = ?auto_576624 ?auto_576625 ) ) ( ON ?auto_576623 ?auto_576624 ) ( ON ?auto_576622 ?auto_576623 ) ( ON ?auto_576621 ?auto_576622 ) ( ON ?auto_576620 ?auto_576621 ) ( ON ?auto_576619 ?auto_576620 ) ( ON ?auto_576618 ?auto_576619 ) ( ON ?auto_576617 ?auto_576618 ) ( ON ?auto_576616 ?auto_576617 ) ( ON ?auto_576615 ?auto_576616 ) ( ON ?auto_576614 ?auto_576615 ) ( ON ?auto_576613 ?auto_576614 ) ( CLEAR ?auto_576611 ) ( ON ?auto_576612 ?auto_576613 ) ( CLEAR ?auto_576612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_576610 ?auto_576611 ?auto_576612 )
      ( MAKE-15PILE ?auto_576610 ?auto_576611 ?auto_576612 ?auto_576613 ?auto_576614 ?auto_576615 ?auto_576616 ?auto_576617 ?auto_576618 ?auto_576619 ?auto_576620 ?auto_576621 ?auto_576622 ?auto_576623 ?auto_576624 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_576672 - BLOCK
      ?auto_576673 - BLOCK
      ?auto_576674 - BLOCK
      ?auto_576675 - BLOCK
      ?auto_576676 - BLOCK
      ?auto_576677 - BLOCK
      ?auto_576678 - BLOCK
      ?auto_576679 - BLOCK
      ?auto_576680 - BLOCK
      ?auto_576681 - BLOCK
      ?auto_576682 - BLOCK
      ?auto_576683 - BLOCK
      ?auto_576684 - BLOCK
      ?auto_576685 - BLOCK
      ?auto_576686 - BLOCK
    )
    :vars
    (
      ?auto_576687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_576686 ?auto_576687 ) ( ON-TABLE ?auto_576672 ) ( not ( = ?auto_576672 ?auto_576673 ) ) ( not ( = ?auto_576672 ?auto_576674 ) ) ( not ( = ?auto_576672 ?auto_576675 ) ) ( not ( = ?auto_576672 ?auto_576676 ) ) ( not ( = ?auto_576672 ?auto_576677 ) ) ( not ( = ?auto_576672 ?auto_576678 ) ) ( not ( = ?auto_576672 ?auto_576679 ) ) ( not ( = ?auto_576672 ?auto_576680 ) ) ( not ( = ?auto_576672 ?auto_576681 ) ) ( not ( = ?auto_576672 ?auto_576682 ) ) ( not ( = ?auto_576672 ?auto_576683 ) ) ( not ( = ?auto_576672 ?auto_576684 ) ) ( not ( = ?auto_576672 ?auto_576685 ) ) ( not ( = ?auto_576672 ?auto_576686 ) ) ( not ( = ?auto_576672 ?auto_576687 ) ) ( not ( = ?auto_576673 ?auto_576674 ) ) ( not ( = ?auto_576673 ?auto_576675 ) ) ( not ( = ?auto_576673 ?auto_576676 ) ) ( not ( = ?auto_576673 ?auto_576677 ) ) ( not ( = ?auto_576673 ?auto_576678 ) ) ( not ( = ?auto_576673 ?auto_576679 ) ) ( not ( = ?auto_576673 ?auto_576680 ) ) ( not ( = ?auto_576673 ?auto_576681 ) ) ( not ( = ?auto_576673 ?auto_576682 ) ) ( not ( = ?auto_576673 ?auto_576683 ) ) ( not ( = ?auto_576673 ?auto_576684 ) ) ( not ( = ?auto_576673 ?auto_576685 ) ) ( not ( = ?auto_576673 ?auto_576686 ) ) ( not ( = ?auto_576673 ?auto_576687 ) ) ( not ( = ?auto_576674 ?auto_576675 ) ) ( not ( = ?auto_576674 ?auto_576676 ) ) ( not ( = ?auto_576674 ?auto_576677 ) ) ( not ( = ?auto_576674 ?auto_576678 ) ) ( not ( = ?auto_576674 ?auto_576679 ) ) ( not ( = ?auto_576674 ?auto_576680 ) ) ( not ( = ?auto_576674 ?auto_576681 ) ) ( not ( = ?auto_576674 ?auto_576682 ) ) ( not ( = ?auto_576674 ?auto_576683 ) ) ( not ( = ?auto_576674 ?auto_576684 ) ) ( not ( = ?auto_576674 ?auto_576685 ) ) ( not ( = ?auto_576674 ?auto_576686 ) ) ( not ( = ?auto_576674 ?auto_576687 ) ) ( not ( = ?auto_576675 ?auto_576676 ) ) ( not ( = ?auto_576675 ?auto_576677 ) ) ( not ( = ?auto_576675 ?auto_576678 ) ) ( not ( = ?auto_576675 ?auto_576679 ) ) ( not ( = ?auto_576675 ?auto_576680 ) ) ( not ( = ?auto_576675 ?auto_576681 ) ) ( not ( = ?auto_576675 ?auto_576682 ) ) ( not ( = ?auto_576675 ?auto_576683 ) ) ( not ( = ?auto_576675 ?auto_576684 ) ) ( not ( = ?auto_576675 ?auto_576685 ) ) ( not ( = ?auto_576675 ?auto_576686 ) ) ( not ( = ?auto_576675 ?auto_576687 ) ) ( not ( = ?auto_576676 ?auto_576677 ) ) ( not ( = ?auto_576676 ?auto_576678 ) ) ( not ( = ?auto_576676 ?auto_576679 ) ) ( not ( = ?auto_576676 ?auto_576680 ) ) ( not ( = ?auto_576676 ?auto_576681 ) ) ( not ( = ?auto_576676 ?auto_576682 ) ) ( not ( = ?auto_576676 ?auto_576683 ) ) ( not ( = ?auto_576676 ?auto_576684 ) ) ( not ( = ?auto_576676 ?auto_576685 ) ) ( not ( = ?auto_576676 ?auto_576686 ) ) ( not ( = ?auto_576676 ?auto_576687 ) ) ( not ( = ?auto_576677 ?auto_576678 ) ) ( not ( = ?auto_576677 ?auto_576679 ) ) ( not ( = ?auto_576677 ?auto_576680 ) ) ( not ( = ?auto_576677 ?auto_576681 ) ) ( not ( = ?auto_576677 ?auto_576682 ) ) ( not ( = ?auto_576677 ?auto_576683 ) ) ( not ( = ?auto_576677 ?auto_576684 ) ) ( not ( = ?auto_576677 ?auto_576685 ) ) ( not ( = ?auto_576677 ?auto_576686 ) ) ( not ( = ?auto_576677 ?auto_576687 ) ) ( not ( = ?auto_576678 ?auto_576679 ) ) ( not ( = ?auto_576678 ?auto_576680 ) ) ( not ( = ?auto_576678 ?auto_576681 ) ) ( not ( = ?auto_576678 ?auto_576682 ) ) ( not ( = ?auto_576678 ?auto_576683 ) ) ( not ( = ?auto_576678 ?auto_576684 ) ) ( not ( = ?auto_576678 ?auto_576685 ) ) ( not ( = ?auto_576678 ?auto_576686 ) ) ( not ( = ?auto_576678 ?auto_576687 ) ) ( not ( = ?auto_576679 ?auto_576680 ) ) ( not ( = ?auto_576679 ?auto_576681 ) ) ( not ( = ?auto_576679 ?auto_576682 ) ) ( not ( = ?auto_576679 ?auto_576683 ) ) ( not ( = ?auto_576679 ?auto_576684 ) ) ( not ( = ?auto_576679 ?auto_576685 ) ) ( not ( = ?auto_576679 ?auto_576686 ) ) ( not ( = ?auto_576679 ?auto_576687 ) ) ( not ( = ?auto_576680 ?auto_576681 ) ) ( not ( = ?auto_576680 ?auto_576682 ) ) ( not ( = ?auto_576680 ?auto_576683 ) ) ( not ( = ?auto_576680 ?auto_576684 ) ) ( not ( = ?auto_576680 ?auto_576685 ) ) ( not ( = ?auto_576680 ?auto_576686 ) ) ( not ( = ?auto_576680 ?auto_576687 ) ) ( not ( = ?auto_576681 ?auto_576682 ) ) ( not ( = ?auto_576681 ?auto_576683 ) ) ( not ( = ?auto_576681 ?auto_576684 ) ) ( not ( = ?auto_576681 ?auto_576685 ) ) ( not ( = ?auto_576681 ?auto_576686 ) ) ( not ( = ?auto_576681 ?auto_576687 ) ) ( not ( = ?auto_576682 ?auto_576683 ) ) ( not ( = ?auto_576682 ?auto_576684 ) ) ( not ( = ?auto_576682 ?auto_576685 ) ) ( not ( = ?auto_576682 ?auto_576686 ) ) ( not ( = ?auto_576682 ?auto_576687 ) ) ( not ( = ?auto_576683 ?auto_576684 ) ) ( not ( = ?auto_576683 ?auto_576685 ) ) ( not ( = ?auto_576683 ?auto_576686 ) ) ( not ( = ?auto_576683 ?auto_576687 ) ) ( not ( = ?auto_576684 ?auto_576685 ) ) ( not ( = ?auto_576684 ?auto_576686 ) ) ( not ( = ?auto_576684 ?auto_576687 ) ) ( not ( = ?auto_576685 ?auto_576686 ) ) ( not ( = ?auto_576685 ?auto_576687 ) ) ( not ( = ?auto_576686 ?auto_576687 ) ) ( ON ?auto_576685 ?auto_576686 ) ( ON ?auto_576684 ?auto_576685 ) ( ON ?auto_576683 ?auto_576684 ) ( ON ?auto_576682 ?auto_576683 ) ( ON ?auto_576681 ?auto_576682 ) ( ON ?auto_576680 ?auto_576681 ) ( ON ?auto_576679 ?auto_576680 ) ( ON ?auto_576678 ?auto_576679 ) ( ON ?auto_576677 ?auto_576678 ) ( ON ?auto_576676 ?auto_576677 ) ( ON ?auto_576675 ?auto_576676 ) ( ON ?auto_576674 ?auto_576675 ) ( CLEAR ?auto_576672 ) ( ON ?auto_576673 ?auto_576674 ) ( CLEAR ?auto_576673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_576672 ?auto_576673 )
      ( MAKE-15PILE ?auto_576672 ?auto_576673 ?auto_576674 ?auto_576675 ?auto_576676 ?auto_576677 ?auto_576678 ?auto_576679 ?auto_576680 ?auto_576681 ?auto_576682 ?auto_576683 ?auto_576684 ?auto_576685 ?auto_576686 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_576734 - BLOCK
      ?auto_576735 - BLOCK
      ?auto_576736 - BLOCK
      ?auto_576737 - BLOCK
      ?auto_576738 - BLOCK
      ?auto_576739 - BLOCK
      ?auto_576740 - BLOCK
      ?auto_576741 - BLOCK
      ?auto_576742 - BLOCK
      ?auto_576743 - BLOCK
      ?auto_576744 - BLOCK
      ?auto_576745 - BLOCK
      ?auto_576746 - BLOCK
      ?auto_576747 - BLOCK
      ?auto_576748 - BLOCK
    )
    :vars
    (
      ?auto_576749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_576748 ?auto_576749 ) ( not ( = ?auto_576734 ?auto_576735 ) ) ( not ( = ?auto_576734 ?auto_576736 ) ) ( not ( = ?auto_576734 ?auto_576737 ) ) ( not ( = ?auto_576734 ?auto_576738 ) ) ( not ( = ?auto_576734 ?auto_576739 ) ) ( not ( = ?auto_576734 ?auto_576740 ) ) ( not ( = ?auto_576734 ?auto_576741 ) ) ( not ( = ?auto_576734 ?auto_576742 ) ) ( not ( = ?auto_576734 ?auto_576743 ) ) ( not ( = ?auto_576734 ?auto_576744 ) ) ( not ( = ?auto_576734 ?auto_576745 ) ) ( not ( = ?auto_576734 ?auto_576746 ) ) ( not ( = ?auto_576734 ?auto_576747 ) ) ( not ( = ?auto_576734 ?auto_576748 ) ) ( not ( = ?auto_576734 ?auto_576749 ) ) ( not ( = ?auto_576735 ?auto_576736 ) ) ( not ( = ?auto_576735 ?auto_576737 ) ) ( not ( = ?auto_576735 ?auto_576738 ) ) ( not ( = ?auto_576735 ?auto_576739 ) ) ( not ( = ?auto_576735 ?auto_576740 ) ) ( not ( = ?auto_576735 ?auto_576741 ) ) ( not ( = ?auto_576735 ?auto_576742 ) ) ( not ( = ?auto_576735 ?auto_576743 ) ) ( not ( = ?auto_576735 ?auto_576744 ) ) ( not ( = ?auto_576735 ?auto_576745 ) ) ( not ( = ?auto_576735 ?auto_576746 ) ) ( not ( = ?auto_576735 ?auto_576747 ) ) ( not ( = ?auto_576735 ?auto_576748 ) ) ( not ( = ?auto_576735 ?auto_576749 ) ) ( not ( = ?auto_576736 ?auto_576737 ) ) ( not ( = ?auto_576736 ?auto_576738 ) ) ( not ( = ?auto_576736 ?auto_576739 ) ) ( not ( = ?auto_576736 ?auto_576740 ) ) ( not ( = ?auto_576736 ?auto_576741 ) ) ( not ( = ?auto_576736 ?auto_576742 ) ) ( not ( = ?auto_576736 ?auto_576743 ) ) ( not ( = ?auto_576736 ?auto_576744 ) ) ( not ( = ?auto_576736 ?auto_576745 ) ) ( not ( = ?auto_576736 ?auto_576746 ) ) ( not ( = ?auto_576736 ?auto_576747 ) ) ( not ( = ?auto_576736 ?auto_576748 ) ) ( not ( = ?auto_576736 ?auto_576749 ) ) ( not ( = ?auto_576737 ?auto_576738 ) ) ( not ( = ?auto_576737 ?auto_576739 ) ) ( not ( = ?auto_576737 ?auto_576740 ) ) ( not ( = ?auto_576737 ?auto_576741 ) ) ( not ( = ?auto_576737 ?auto_576742 ) ) ( not ( = ?auto_576737 ?auto_576743 ) ) ( not ( = ?auto_576737 ?auto_576744 ) ) ( not ( = ?auto_576737 ?auto_576745 ) ) ( not ( = ?auto_576737 ?auto_576746 ) ) ( not ( = ?auto_576737 ?auto_576747 ) ) ( not ( = ?auto_576737 ?auto_576748 ) ) ( not ( = ?auto_576737 ?auto_576749 ) ) ( not ( = ?auto_576738 ?auto_576739 ) ) ( not ( = ?auto_576738 ?auto_576740 ) ) ( not ( = ?auto_576738 ?auto_576741 ) ) ( not ( = ?auto_576738 ?auto_576742 ) ) ( not ( = ?auto_576738 ?auto_576743 ) ) ( not ( = ?auto_576738 ?auto_576744 ) ) ( not ( = ?auto_576738 ?auto_576745 ) ) ( not ( = ?auto_576738 ?auto_576746 ) ) ( not ( = ?auto_576738 ?auto_576747 ) ) ( not ( = ?auto_576738 ?auto_576748 ) ) ( not ( = ?auto_576738 ?auto_576749 ) ) ( not ( = ?auto_576739 ?auto_576740 ) ) ( not ( = ?auto_576739 ?auto_576741 ) ) ( not ( = ?auto_576739 ?auto_576742 ) ) ( not ( = ?auto_576739 ?auto_576743 ) ) ( not ( = ?auto_576739 ?auto_576744 ) ) ( not ( = ?auto_576739 ?auto_576745 ) ) ( not ( = ?auto_576739 ?auto_576746 ) ) ( not ( = ?auto_576739 ?auto_576747 ) ) ( not ( = ?auto_576739 ?auto_576748 ) ) ( not ( = ?auto_576739 ?auto_576749 ) ) ( not ( = ?auto_576740 ?auto_576741 ) ) ( not ( = ?auto_576740 ?auto_576742 ) ) ( not ( = ?auto_576740 ?auto_576743 ) ) ( not ( = ?auto_576740 ?auto_576744 ) ) ( not ( = ?auto_576740 ?auto_576745 ) ) ( not ( = ?auto_576740 ?auto_576746 ) ) ( not ( = ?auto_576740 ?auto_576747 ) ) ( not ( = ?auto_576740 ?auto_576748 ) ) ( not ( = ?auto_576740 ?auto_576749 ) ) ( not ( = ?auto_576741 ?auto_576742 ) ) ( not ( = ?auto_576741 ?auto_576743 ) ) ( not ( = ?auto_576741 ?auto_576744 ) ) ( not ( = ?auto_576741 ?auto_576745 ) ) ( not ( = ?auto_576741 ?auto_576746 ) ) ( not ( = ?auto_576741 ?auto_576747 ) ) ( not ( = ?auto_576741 ?auto_576748 ) ) ( not ( = ?auto_576741 ?auto_576749 ) ) ( not ( = ?auto_576742 ?auto_576743 ) ) ( not ( = ?auto_576742 ?auto_576744 ) ) ( not ( = ?auto_576742 ?auto_576745 ) ) ( not ( = ?auto_576742 ?auto_576746 ) ) ( not ( = ?auto_576742 ?auto_576747 ) ) ( not ( = ?auto_576742 ?auto_576748 ) ) ( not ( = ?auto_576742 ?auto_576749 ) ) ( not ( = ?auto_576743 ?auto_576744 ) ) ( not ( = ?auto_576743 ?auto_576745 ) ) ( not ( = ?auto_576743 ?auto_576746 ) ) ( not ( = ?auto_576743 ?auto_576747 ) ) ( not ( = ?auto_576743 ?auto_576748 ) ) ( not ( = ?auto_576743 ?auto_576749 ) ) ( not ( = ?auto_576744 ?auto_576745 ) ) ( not ( = ?auto_576744 ?auto_576746 ) ) ( not ( = ?auto_576744 ?auto_576747 ) ) ( not ( = ?auto_576744 ?auto_576748 ) ) ( not ( = ?auto_576744 ?auto_576749 ) ) ( not ( = ?auto_576745 ?auto_576746 ) ) ( not ( = ?auto_576745 ?auto_576747 ) ) ( not ( = ?auto_576745 ?auto_576748 ) ) ( not ( = ?auto_576745 ?auto_576749 ) ) ( not ( = ?auto_576746 ?auto_576747 ) ) ( not ( = ?auto_576746 ?auto_576748 ) ) ( not ( = ?auto_576746 ?auto_576749 ) ) ( not ( = ?auto_576747 ?auto_576748 ) ) ( not ( = ?auto_576747 ?auto_576749 ) ) ( not ( = ?auto_576748 ?auto_576749 ) ) ( ON ?auto_576747 ?auto_576748 ) ( ON ?auto_576746 ?auto_576747 ) ( ON ?auto_576745 ?auto_576746 ) ( ON ?auto_576744 ?auto_576745 ) ( ON ?auto_576743 ?auto_576744 ) ( ON ?auto_576742 ?auto_576743 ) ( ON ?auto_576741 ?auto_576742 ) ( ON ?auto_576740 ?auto_576741 ) ( ON ?auto_576739 ?auto_576740 ) ( ON ?auto_576738 ?auto_576739 ) ( ON ?auto_576737 ?auto_576738 ) ( ON ?auto_576736 ?auto_576737 ) ( ON ?auto_576735 ?auto_576736 ) ( ON ?auto_576734 ?auto_576735 ) ( CLEAR ?auto_576734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_576734 )
      ( MAKE-15PILE ?auto_576734 ?auto_576735 ?auto_576736 ?auto_576737 ?auto_576738 ?auto_576739 ?auto_576740 ?auto_576741 ?auto_576742 ?auto_576743 ?auto_576744 ?auto_576745 ?auto_576746 ?auto_576747 ?auto_576748 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_576797 - BLOCK
      ?auto_576798 - BLOCK
      ?auto_576799 - BLOCK
      ?auto_576800 - BLOCK
      ?auto_576801 - BLOCK
      ?auto_576802 - BLOCK
      ?auto_576803 - BLOCK
      ?auto_576804 - BLOCK
      ?auto_576805 - BLOCK
      ?auto_576806 - BLOCK
      ?auto_576807 - BLOCK
      ?auto_576808 - BLOCK
      ?auto_576809 - BLOCK
      ?auto_576810 - BLOCK
      ?auto_576811 - BLOCK
      ?auto_576812 - BLOCK
    )
    :vars
    (
      ?auto_576813 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_576811 ) ( ON ?auto_576812 ?auto_576813 ) ( CLEAR ?auto_576812 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_576797 ) ( ON ?auto_576798 ?auto_576797 ) ( ON ?auto_576799 ?auto_576798 ) ( ON ?auto_576800 ?auto_576799 ) ( ON ?auto_576801 ?auto_576800 ) ( ON ?auto_576802 ?auto_576801 ) ( ON ?auto_576803 ?auto_576802 ) ( ON ?auto_576804 ?auto_576803 ) ( ON ?auto_576805 ?auto_576804 ) ( ON ?auto_576806 ?auto_576805 ) ( ON ?auto_576807 ?auto_576806 ) ( ON ?auto_576808 ?auto_576807 ) ( ON ?auto_576809 ?auto_576808 ) ( ON ?auto_576810 ?auto_576809 ) ( ON ?auto_576811 ?auto_576810 ) ( not ( = ?auto_576797 ?auto_576798 ) ) ( not ( = ?auto_576797 ?auto_576799 ) ) ( not ( = ?auto_576797 ?auto_576800 ) ) ( not ( = ?auto_576797 ?auto_576801 ) ) ( not ( = ?auto_576797 ?auto_576802 ) ) ( not ( = ?auto_576797 ?auto_576803 ) ) ( not ( = ?auto_576797 ?auto_576804 ) ) ( not ( = ?auto_576797 ?auto_576805 ) ) ( not ( = ?auto_576797 ?auto_576806 ) ) ( not ( = ?auto_576797 ?auto_576807 ) ) ( not ( = ?auto_576797 ?auto_576808 ) ) ( not ( = ?auto_576797 ?auto_576809 ) ) ( not ( = ?auto_576797 ?auto_576810 ) ) ( not ( = ?auto_576797 ?auto_576811 ) ) ( not ( = ?auto_576797 ?auto_576812 ) ) ( not ( = ?auto_576797 ?auto_576813 ) ) ( not ( = ?auto_576798 ?auto_576799 ) ) ( not ( = ?auto_576798 ?auto_576800 ) ) ( not ( = ?auto_576798 ?auto_576801 ) ) ( not ( = ?auto_576798 ?auto_576802 ) ) ( not ( = ?auto_576798 ?auto_576803 ) ) ( not ( = ?auto_576798 ?auto_576804 ) ) ( not ( = ?auto_576798 ?auto_576805 ) ) ( not ( = ?auto_576798 ?auto_576806 ) ) ( not ( = ?auto_576798 ?auto_576807 ) ) ( not ( = ?auto_576798 ?auto_576808 ) ) ( not ( = ?auto_576798 ?auto_576809 ) ) ( not ( = ?auto_576798 ?auto_576810 ) ) ( not ( = ?auto_576798 ?auto_576811 ) ) ( not ( = ?auto_576798 ?auto_576812 ) ) ( not ( = ?auto_576798 ?auto_576813 ) ) ( not ( = ?auto_576799 ?auto_576800 ) ) ( not ( = ?auto_576799 ?auto_576801 ) ) ( not ( = ?auto_576799 ?auto_576802 ) ) ( not ( = ?auto_576799 ?auto_576803 ) ) ( not ( = ?auto_576799 ?auto_576804 ) ) ( not ( = ?auto_576799 ?auto_576805 ) ) ( not ( = ?auto_576799 ?auto_576806 ) ) ( not ( = ?auto_576799 ?auto_576807 ) ) ( not ( = ?auto_576799 ?auto_576808 ) ) ( not ( = ?auto_576799 ?auto_576809 ) ) ( not ( = ?auto_576799 ?auto_576810 ) ) ( not ( = ?auto_576799 ?auto_576811 ) ) ( not ( = ?auto_576799 ?auto_576812 ) ) ( not ( = ?auto_576799 ?auto_576813 ) ) ( not ( = ?auto_576800 ?auto_576801 ) ) ( not ( = ?auto_576800 ?auto_576802 ) ) ( not ( = ?auto_576800 ?auto_576803 ) ) ( not ( = ?auto_576800 ?auto_576804 ) ) ( not ( = ?auto_576800 ?auto_576805 ) ) ( not ( = ?auto_576800 ?auto_576806 ) ) ( not ( = ?auto_576800 ?auto_576807 ) ) ( not ( = ?auto_576800 ?auto_576808 ) ) ( not ( = ?auto_576800 ?auto_576809 ) ) ( not ( = ?auto_576800 ?auto_576810 ) ) ( not ( = ?auto_576800 ?auto_576811 ) ) ( not ( = ?auto_576800 ?auto_576812 ) ) ( not ( = ?auto_576800 ?auto_576813 ) ) ( not ( = ?auto_576801 ?auto_576802 ) ) ( not ( = ?auto_576801 ?auto_576803 ) ) ( not ( = ?auto_576801 ?auto_576804 ) ) ( not ( = ?auto_576801 ?auto_576805 ) ) ( not ( = ?auto_576801 ?auto_576806 ) ) ( not ( = ?auto_576801 ?auto_576807 ) ) ( not ( = ?auto_576801 ?auto_576808 ) ) ( not ( = ?auto_576801 ?auto_576809 ) ) ( not ( = ?auto_576801 ?auto_576810 ) ) ( not ( = ?auto_576801 ?auto_576811 ) ) ( not ( = ?auto_576801 ?auto_576812 ) ) ( not ( = ?auto_576801 ?auto_576813 ) ) ( not ( = ?auto_576802 ?auto_576803 ) ) ( not ( = ?auto_576802 ?auto_576804 ) ) ( not ( = ?auto_576802 ?auto_576805 ) ) ( not ( = ?auto_576802 ?auto_576806 ) ) ( not ( = ?auto_576802 ?auto_576807 ) ) ( not ( = ?auto_576802 ?auto_576808 ) ) ( not ( = ?auto_576802 ?auto_576809 ) ) ( not ( = ?auto_576802 ?auto_576810 ) ) ( not ( = ?auto_576802 ?auto_576811 ) ) ( not ( = ?auto_576802 ?auto_576812 ) ) ( not ( = ?auto_576802 ?auto_576813 ) ) ( not ( = ?auto_576803 ?auto_576804 ) ) ( not ( = ?auto_576803 ?auto_576805 ) ) ( not ( = ?auto_576803 ?auto_576806 ) ) ( not ( = ?auto_576803 ?auto_576807 ) ) ( not ( = ?auto_576803 ?auto_576808 ) ) ( not ( = ?auto_576803 ?auto_576809 ) ) ( not ( = ?auto_576803 ?auto_576810 ) ) ( not ( = ?auto_576803 ?auto_576811 ) ) ( not ( = ?auto_576803 ?auto_576812 ) ) ( not ( = ?auto_576803 ?auto_576813 ) ) ( not ( = ?auto_576804 ?auto_576805 ) ) ( not ( = ?auto_576804 ?auto_576806 ) ) ( not ( = ?auto_576804 ?auto_576807 ) ) ( not ( = ?auto_576804 ?auto_576808 ) ) ( not ( = ?auto_576804 ?auto_576809 ) ) ( not ( = ?auto_576804 ?auto_576810 ) ) ( not ( = ?auto_576804 ?auto_576811 ) ) ( not ( = ?auto_576804 ?auto_576812 ) ) ( not ( = ?auto_576804 ?auto_576813 ) ) ( not ( = ?auto_576805 ?auto_576806 ) ) ( not ( = ?auto_576805 ?auto_576807 ) ) ( not ( = ?auto_576805 ?auto_576808 ) ) ( not ( = ?auto_576805 ?auto_576809 ) ) ( not ( = ?auto_576805 ?auto_576810 ) ) ( not ( = ?auto_576805 ?auto_576811 ) ) ( not ( = ?auto_576805 ?auto_576812 ) ) ( not ( = ?auto_576805 ?auto_576813 ) ) ( not ( = ?auto_576806 ?auto_576807 ) ) ( not ( = ?auto_576806 ?auto_576808 ) ) ( not ( = ?auto_576806 ?auto_576809 ) ) ( not ( = ?auto_576806 ?auto_576810 ) ) ( not ( = ?auto_576806 ?auto_576811 ) ) ( not ( = ?auto_576806 ?auto_576812 ) ) ( not ( = ?auto_576806 ?auto_576813 ) ) ( not ( = ?auto_576807 ?auto_576808 ) ) ( not ( = ?auto_576807 ?auto_576809 ) ) ( not ( = ?auto_576807 ?auto_576810 ) ) ( not ( = ?auto_576807 ?auto_576811 ) ) ( not ( = ?auto_576807 ?auto_576812 ) ) ( not ( = ?auto_576807 ?auto_576813 ) ) ( not ( = ?auto_576808 ?auto_576809 ) ) ( not ( = ?auto_576808 ?auto_576810 ) ) ( not ( = ?auto_576808 ?auto_576811 ) ) ( not ( = ?auto_576808 ?auto_576812 ) ) ( not ( = ?auto_576808 ?auto_576813 ) ) ( not ( = ?auto_576809 ?auto_576810 ) ) ( not ( = ?auto_576809 ?auto_576811 ) ) ( not ( = ?auto_576809 ?auto_576812 ) ) ( not ( = ?auto_576809 ?auto_576813 ) ) ( not ( = ?auto_576810 ?auto_576811 ) ) ( not ( = ?auto_576810 ?auto_576812 ) ) ( not ( = ?auto_576810 ?auto_576813 ) ) ( not ( = ?auto_576811 ?auto_576812 ) ) ( not ( = ?auto_576811 ?auto_576813 ) ) ( not ( = ?auto_576812 ?auto_576813 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_576812 ?auto_576813 )
      ( !STACK ?auto_576812 ?auto_576811 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_576830 - BLOCK
      ?auto_576831 - BLOCK
      ?auto_576832 - BLOCK
      ?auto_576833 - BLOCK
      ?auto_576834 - BLOCK
      ?auto_576835 - BLOCK
      ?auto_576836 - BLOCK
      ?auto_576837 - BLOCK
      ?auto_576838 - BLOCK
      ?auto_576839 - BLOCK
      ?auto_576840 - BLOCK
      ?auto_576841 - BLOCK
      ?auto_576842 - BLOCK
      ?auto_576843 - BLOCK
      ?auto_576844 - BLOCK
      ?auto_576845 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_576844 ) ( ON-TABLE ?auto_576845 ) ( CLEAR ?auto_576845 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_576830 ) ( ON ?auto_576831 ?auto_576830 ) ( ON ?auto_576832 ?auto_576831 ) ( ON ?auto_576833 ?auto_576832 ) ( ON ?auto_576834 ?auto_576833 ) ( ON ?auto_576835 ?auto_576834 ) ( ON ?auto_576836 ?auto_576835 ) ( ON ?auto_576837 ?auto_576836 ) ( ON ?auto_576838 ?auto_576837 ) ( ON ?auto_576839 ?auto_576838 ) ( ON ?auto_576840 ?auto_576839 ) ( ON ?auto_576841 ?auto_576840 ) ( ON ?auto_576842 ?auto_576841 ) ( ON ?auto_576843 ?auto_576842 ) ( ON ?auto_576844 ?auto_576843 ) ( not ( = ?auto_576830 ?auto_576831 ) ) ( not ( = ?auto_576830 ?auto_576832 ) ) ( not ( = ?auto_576830 ?auto_576833 ) ) ( not ( = ?auto_576830 ?auto_576834 ) ) ( not ( = ?auto_576830 ?auto_576835 ) ) ( not ( = ?auto_576830 ?auto_576836 ) ) ( not ( = ?auto_576830 ?auto_576837 ) ) ( not ( = ?auto_576830 ?auto_576838 ) ) ( not ( = ?auto_576830 ?auto_576839 ) ) ( not ( = ?auto_576830 ?auto_576840 ) ) ( not ( = ?auto_576830 ?auto_576841 ) ) ( not ( = ?auto_576830 ?auto_576842 ) ) ( not ( = ?auto_576830 ?auto_576843 ) ) ( not ( = ?auto_576830 ?auto_576844 ) ) ( not ( = ?auto_576830 ?auto_576845 ) ) ( not ( = ?auto_576831 ?auto_576832 ) ) ( not ( = ?auto_576831 ?auto_576833 ) ) ( not ( = ?auto_576831 ?auto_576834 ) ) ( not ( = ?auto_576831 ?auto_576835 ) ) ( not ( = ?auto_576831 ?auto_576836 ) ) ( not ( = ?auto_576831 ?auto_576837 ) ) ( not ( = ?auto_576831 ?auto_576838 ) ) ( not ( = ?auto_576831 ?auto_576839 ) ) ( not ( = ?auto_576831 ?auto_576840 ) ) ( not ( = ?auto_576831 ?auto_576841 ) ) ( not ( = ?auto_576831 ?auto_576842 ) ) ( not ( = ?auto_576831 ?auto_576843 ) ) ( not ( = ?auto_576831 ?auto_576844 ) ) ( not ( = ?auto_576831 ?auto_576845 ) ) ( not ( = ?auto_576832 ?auto_576833 ) ) ( not ( = ?auto_576832 ?auto_576834 ) ) ( not ( = ?auto_576832 ?auto_576835 ) ) ( not ( = ?auto_576832 ?auto_576836 ) ) ( not ( = ?auto_576832 ?auto_576837 ) ) ( not ( = ?auto_576832 ?auto_576838 ) ) ( not ( = ?auto_576832 ?auto_576839 ) ) ( not ( = ?auto_576832 ?auto_576840 ) ) ( not ( = ?auto_576832 ?auto_576841 ) ) ( not ( = ?auto_576832 ?auto_576842 ) ) ( not ( = ?auto_576832 ?auto_576843 ) ) ( not ( = ?auto_576832 ?auto_576844 ) ) ( not ( = ?auto_576832 ?auto_576845 ) ) ( not ( = ?auto_576833 ?auto_576834 ) ) ( not ( = ?auto_576833 ?auto_576835 ) ) ( not ( = ?auto_576833 ?auto_576836 ) ) ( not ( = ?auto_576833 ?auto_576837 ) ) ( not ( = ?auto_576833 ?auto_576838 ) ) ( not ( = ?auto_576833 ?auto_576839 ) ) ( not ( = ?auto_576833 ?auto_576840 ) ) ( not ( = ?auto_576833 ?auto_576841 ) ) ( not ( = ?auto_576833 ?auto_576842 ) ) ( not ( = ?auto_576833 ?auto_576843 ) ) ( not ( = ?auto_576833 ?auto_576844 ) ) ( not ( = ?auto_576833 ?auto_576845 ) ) ( not ( = ?auto_576834 ?auto_576835 ) ) ( not ( = ?auto_576834 ?auto_576836 ) ) ( not ( = ?auto_576834 ?auto_576837 ) ) ( not ( = ?auto_576834 ?auto_576838 ) ) ( not ( = ?auto_576834 ?auto_576839 ) ) ( not ( = ?auto_576834 ?auto_576840 ) ) ( not ( = ?auto_576834 ?auto_576841 ) ) ( not ( = ?auto_576834 ?auto_576842 ) ) ( not ( = ?auto_576834 ?auto_576843 ) ) ( not ( = ?auto_576834 ?auto_576844 ) ) ( not ( = ?auto_576834 ?auto_576845 ) ) ( not ( = ?auto_576835 ?auto_576836 ) ) ( not ( = ?auto_576835 ?auto_576837 ) ) ( not ( = ?auto_576835 ?auto_576838 ) ) ( not ( = ?auto_576835 ?auto_576839 ) ) ( not ( = ?auto_576835 ?auto_576840 ) ) ( not ( = ?auto_576835 ?auto_576841 ) ) ( not ( = ?auto_576835 ?auto_576842 ) ) ( not ( = ?auto_576835 ?auto_576843 ) ) ( not ( = ?auto_576835 ?auto_576844 ) ) ( not ( = ?auto_576835 ?auto_576845 ) ) ( not ( = ?auto_576836 ?auto_576837 ) ) ( not ( = ?auto_576836 ?auto_576838 ) ) ( not ( = ?auto_576836 ?auto_576839 ) ) ( not ( = ?auto_576836 ?auto_576840 ) ) ( not ( = ?auto_576836 ?auto_576841 ) ) ( not ( = ?auto_576836 ?auto_576842 ) ) ( not ( = ?auto_576836 ?auto_576843 ) ) ( not ( = ?auto_576836 ?auto_576844 ) ) ( not ( = ?auto_576836 ?auto_576845 ) ) ( not ( = ?auto_576837 ?auto_576838 ) ) ( not ( = ?auto_576837 ?auto_576839 ) ) ( not ( = ?auto_576837 ?auto_576840 ) ) ( not ( = ?auto_576837 ?auto_576841 ) ) ( not ( = ?auto_576837 ?auto_576842 ) ) ( not ( = ?auto_576837 ?auto_576843 ) ) ( not ( = ?auto_576837 ?auto_576844 ) ) ( not ( = ?auto_576837 ?auto_576845 ) ) ( not ( = ?auto_576838 ?auto_576839 ) ) ( not ( = ?auto_576838 ?auto_576840 ) ) ( not ( = ?auto_576838 ?auto_576841 ) ) ( not ( = ?auto_576838 ?auto_576842 ) ) ( not ( = ?auto_576838 ?auto_576843 ) ) ( not ( = ?auto_576838 ?auto_576844 ) ) ( not ( = ?auto_576838 ?auto_576845 ) ) ( not ( = ?auto_576839 ?auto_576840 ) ) ( not ( = ?auto_576839 ?auto_576841 ) ) ( not ( = ?auto_576839 ?auto_576842 ) ) ( not ( = ?auto_576839 ?auto_576843 ) ) ( not ( = ?auto_576839 ?auto_576844 ) ) ( not ( = ?auto_576839 ?auto_576845 ) ) ( not ( = ?auto_576840 ?auto_576841 ) ) ( not ( = ?auto_576840 ?auto_576842 ) ) ( not ( = ?auto_576840 ?auto_576843 ) ) ( not ( = ?auto_576840 ?auto_576844 ) ) ( not ( = ?auto_576840 ?auto_576845 ) ) ( not ( = ?auto_576841 ?auto_576842 ) ) ( not ( = ?auto_576841 ?auto_576843 ) ) ( not ( = ?auto_576841 ?auto_576844 ) ) ( not ( = ?auto_576841 ?auto_576845 ) ) ( not ( = ?auto_576842 ?auto_576843 ) ) ( not ( = ?auto_576842 ?auto_576844 ) ) ( not ( = ?auto_576842 ?auto_576845 ) ) ( not ( = ?auto_576843 ?auto_576844 ) ) ( not ( = ?auto_576843 ?auto_576845 ) ) ( not ( = ?auto_576844 ?auto_576845 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_576845 )
      ( !STACK ?auto_576845 ?auto_576844 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_576862 - BLOCK
      ?auto_576863 - BLOCK
      ?auto_576864 - BLOCK
      ?auto_576865 - BLOCK
      ?auto_576866 - BLOCK
      ?auto_576867 - BLOCK
      ?auto_576868 - BLOCK
      ?auto_576869 - BLOCK
      ?auto_576870 - BLOCK
      ?auto_576871 - BLOCK
      ?auto_576872 - BLOCK
      ?auto_576873 - BLOCK
      ?auto_576874 - BLOCK
      ?auto_576875 - BLOCK
      ?auto_576876 - BLOCK
      ?auto_576877 - BLOCK
    )
    :vars
    (
      ?auto_576878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_576877 ?auto_576878 ) ( ON-TABLE ?auto_576862 ) ( ON ?auto_576863 ?auto_576862 ) ( ON ?auto_576864 ?auto_576863 ) ( ON ?auto_576865 ?auto_576864 ) ( ON ?auto_576866 ?auto_576865 ) ( ON ?auto_576867 ?auto_576866 ) ( ON ?auto_576868 ?auto_576867 ) ( ON ?auto_576869 ?auto_576868 ) ( ON ?auto_576870 ?auto_576869 ) ( ON ?auto_576871 ?auto_576870 ) ( ON ?auto_576872 ?auto_576871 ) ( ON ?auto_576873 ?auto_576872 ) ( ON ?auto_576874 ?auto_576873 ) ( ON ?auto_576875 ?auto_576874 ) ( not ( = ?auto_576862 ?auto_576863 ) ) ( not ( = ?auto_576862 ?auto_576864 ) ) ( not ( = ?auto_576862 ?auto_576865 ) ) ( not ( = ?auto_576862 ?auto_576866 ) ) ( not ( = ?auto_576862 ?auto_576867 ) ) ( not ( = ?auto_576862 ?auto_576868 ) ) ( not ( = ?auto_576862 ?auto_576869 ) ) ( not ( = ?auto_576862 ?auto_576870 ) ) ( not ( = ?auto_576862 ?auto_576871 ) ) ( not ( = ?auto_576862 ?auto_576872 ) ) ( not ( = ?auto_576862 ?auto_576873 ) ) ( not ( = ?auto_576862 ?auto_576874 ) ) ( not ( = ?auto_576862 ?auto_576875 ) ) ( not ( = ?auto_576862 ?auto_576876 ) ) ( not ( = ?auto_576862 ?auto_576877 ) ) ( not ( = ?auto_576862 ?auto_576878 ) ) ( not ( = ?auto_576863 ?auto_576864 ) ) ( not ( = ?auto_576863 ?auto_576865 ) ) ( not ( = ?auto_576863 ?auto_576866 ) ) ( not ( = ?auto_576863 ?auto_576867 ) ) ( not ( = ?auto_576863 ?auto_576868 ) ) ( not ( = ?auto_576863 ?auto_576869 ) ) ( not ( = ?auto_576863 ?auto_576870 ) ) ( not ( = ?auto_576863 ?auto_576871 ) ) ( not ( = ?auto_576863 ?auto_576872 ) ) ( not ( = ?auto_576863 ?auto_576873 ) ) ( not ( = ?auto_576863 ?auto_576874 ) ) ( not ( = ?auto_576863 ?auto_576875 ) ) ( not ( = ?auto_576863 ?auto_576876 ) ) ( not ( = ?auto_576863 ?auto_576877 ) ) ( not ( = ?auto_576863 ?auto_576878 ) ) ( not ( = ?auto_576864 ?auto_576865 ) ) ( not ( = ?auto_576864 ?auto_576866 ) ) ( not ( = ?auto_576864 ?auto_576867 ) ) ( not ( = ?auto_576864 ?auto_576868 ) ) ( not ( = ?auto_576864 ?auto_576869 ) ) ( not ( = ?auto_576864 ?auto_576870 ) ) ( not ( = ?auto_576864 ?auto_576871 ) ) ( not ( = ?auto_576864 ?auto_576872 ) ) ( not ( = ?auto_576864 ?auto_576873 ) ) ( not ( = ?auto_576864 ?auto_576874 ) ) ( not ( = ?auto_576864 ?auto_576875 ) ) ( not ( = ?auto_576864 ?auto_576876 ) ) ( not ( = ?auto_576864 ?auto_576877 ) ) ( not ( = ?auto_576864 ?auto_576878 ) ) ( not ( = ?auto_576865 ?auto_576866 ) ) ( not ( = ?auto_576865 ?auto_576867 ) ) ( not ( = ?auto_576865 ?auto_576868 ) ) ( not ( = ?auto_576865 ?auto_576869 ) ) ( not ( = ?auto_576865 ?auto_576870 ) ) ( not ( = ?auto_576865 ?auto_576871 ) ) ( not ( = ?auto_576865 ?auto_576872 ) ) ( not ( = ?auto_576865 ?auto_576873 ) ) ( not ( = ?auto_576865 ?auto_576874 ) ) ( not ( = ?auto_576865 ?auto_576875 ) ) ( not ( = ?auto_576865 ?auto_576876 ) ) ( not ( = ?auto_576865 ?auto_576877 ) ) ( not ( = ?auto_576865 ?auto_576878 ) ) ( not ( = ?auto_576866 ?auto_576867 ) ) ( not ( = ?auto_576866 ?auto_576868 ) ) ( not ( = ?auto_576866 ?auto_576869 ) ) ( not ( = ?auto_576866 ?auto_576870 ) ) ( not ( = ?auto_576866 ?auto_576871 ) ) ( not ( = ?auto_576866 ?auto_576872 ) ) ( not ( = ?auto_576866 ?auto_576873 ) ) ( not ( = ?auto_576866 ?auto_576874 ) ) ( not ( = ?auto_576866 ?auto_576875 ) ) ( not ( = ?auto_576866 ?auto_576876 ) ) ( not ( = ?auto_576866 ?auto_576877 ) ) ( not ( = ?auto_576866 ?auto_576878 ) ) ( not ( = ?auto_576867 ?auto_576868 ) ) ( not ( = ?auto_576867 ?auto_576869 ) ) ( not ( = ?auto_576867 ?auto_576870 ) ) ( not ( = ?auto_576867 ?auto_576871 ) ) ( not ( = ?auto_576867 ?auto_576872 ) ) ( not ( = ?auto_576867 ?auto_576873 ) ) ( not ( = ?auto_576867 ?auto_576874 ) ) ( not ( = ?auto_576867 ?auto_576875 ) ) ( not ( = ?auto_576867 ?auto_576876 ) ) ( not ( = ?auto_576867 ?auto_576877 ) ) ( not ( = ?auto_576867 ?auto_576878 ) ) ( not ( = ?auto_576868 ?auto_576869 ) ) ( not ( = ?auto_576868 ?auto_576870 ) ) ( not ( = ?auto_576868 ?auto_576871 ) ) ( not ( = ?auto_576868 ?auto_576872 ) ) ( not ( = ?auto_576868 ?auto_576873 ) ) ( not ( = ?auto_576868 ?auto_576874 ) ) ( not ( = ?auto_576868 ?auto_576875 ) ) ( not ( = ?auto_576868 ?auto_576876 ) ) ( not ( = ?auto_576868 ?auto_576877 ) ) ( not ( = ?auto_576868 ?auto_576878 ) ) ( not ( = ?auto_576869 ?auto_576870 ) ) ( not ( = ?auto_576869 ?auto_576871 ) ) ( not ( = ?auto_576869 ?auto_576872 ) ) ( not ( = ?auto_576869 ?auto_576873 ) ) ( not ( = ?auto_576869 ?auto_576874 ) ) ( not ( = ?auto_576869 ?auto_576875 ) ) ( not ( = ?auto_576869 ?auto_576876 ) ) ( not ( = ?auto_576869 ?auto_576877 ) ) ( not ( = ?auto_576869 ?auto_576878 ) ) ( not ( = ?auto_576870 ?auto_576871 ) ) ( not ( = ?auto_576870 ?auto_576872 ) ) ( not ( = ?auto_576870 ?auto_576873 ) ) ( not ( = ?auto_576870 ?auto_576874 ) ) ( not ( = ?auto_576870 ?auto_576875 ) ) ( not ( = ?auto_576870 ?auto_576876 ) ) ( not ( = ?auto_576870 ?auto_576877 ) ) ( not ( = ?auto_576870 ?auto_576878 ) ) ( not ( = ?auto_576871 ?auto_576872 ) ) ( not ( = ?auto_576871 ?auto_576873 ) ) ( not ( = ?auto_576871 ?auto_576874 ) ) ( not ( = ?auto_576871 ?auto_576875 ) ) ( not ( = ?auto_576871 ?auto_576876 ) ) ( not ( = ?auto_576871 ?auto_576877 ) ) ( not ( = ?auto_576871 ?auto_576878 ) ) ( not ( = ?auto_576872 ?auto_576873 ) ) ( not ( = ?auto_576872 ?auto_576874 ) ) ( not ( = ?auto_576872 ?auto_576875 ) ) ( not ( = ?auto_576872 ?auto_576876 ) ) ( not ( = ?auto_576872 ?auto_576877 ) ) ( not ( = ?auto_576872 ?auto_576878 ) ) ( not ( = ?auto_576873 ?auto_576874 ) ) ( not ( = ?auto_576873 ?auto_576875 ) ) ( not ( = ?auto_576873 ?auto_576876 ) ) ( not ( = ?auto_576873 ?auto_576877 ) ) ( not ( = ?auto_576873 ?auto_576878 ) ) ( not ( = ?auto_576874 ?auto_576875 ) ) ( not ( = ?auto_576874 ?auto_576876 ) ) ( not ( = ?auto_576874 ?auto_576877 ) ) ( not ( = ?auto_576874 ?auto_576878 ) ) ( not ( = ?auto_576875 ?auto_576876 ) ) ( not ( = ?auto_576875 ?auto_576877 ) ) ( not ( = ?auto_576875 ?auto_576878 ) ) ( not ( = ?auto_576876 ?auto_576877 ) ) ( not ( = ?auto_576876 ?auto_576878 ) ) ( not ( = ?auto_576877 ?auto_576878 ) ) ( CLEAR ?auto_576875 ) ( ON ?auto_576876 ?auto_576877 ) ( CLEAR ?auto_576876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_576862 ?auto_576863 ?auto_576864 ?auto_576865 ?auto_576866 ?auto_576867 ?auto_576868 ?auto_576869 ?auto_576870 ?auto_576871 ?auto_576872 ?auto_576873 ?auto_576874 ?auto_576875 ?auto_576876 )
      ( MAKE-16PILE ?auto_576862 ?auto_576863 ?auto_576864 ?auto_576865 ?auto_576866 ?auto_576867 ?auto_576868 ?auto_576869 ?auto_576870 ?auto_576871 ?auto_576872 ?auto_576873 ?auto_576874 ?auto_576875 ?auto_576876 ?auto_576877 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_576895 - BLOCK
      ?auto_576896 - BLOCK
      ?auto_576897 - BLOCK
      ?auto_576898 - BLOCK
      ?auto_576899 - BLOCK
      ?auto_576900 - BLOCK
      ?auto_576901 - BLOCK
      ?auto_576902 - BLOCK
      ?auto_576903 - BLOCK
      ?auto_576904 - BLOCK
      ?auto_576905 - BLOCK
      ?auto_576906 - BLOCK
      ?auto_576907 - BLOCK
      ?auto_576908 - BLOCK
      ?auto_576909 - BLOCK
      ?auto_576910 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_576910 ) ( ON-TABLE ?auto_576895 ) ( ON ?auto_576896 ?auto_576895 ) ( ON ?auto_576897 ?auto_576896 ) ( ON ?auto_576898 ?auto_576897 ) ( ON ?auto_576899 ?auto_576898 ) ( ON ?auto_576900 ?auto_576899 ) ( ON ?auto_576901 ?auto_576900 ) ( ON ?auto_576902 ?auto_576901 ) ( ON ?auto_576903 ?auto_576902 ) ( ON ?auto_576904 ?auto_576903 ) ( ON ?auto_576905 ?auto_576904 ) ( ON ?auto_576906 ?auto_576905 ) ( ON ?auto_576907 ?auto_576906 ) ( ON ?auto_576908 ?auto_576907 ) ( not ( = ?auto_576895 ?auto_576896 ) ) ( not ( = ?auto_576895 ?auto_576897 ) ) ( not ( = ?auto_576895 ?auto_576898 ) ) ( not ( = ?auto_576895 ?auto_576899 ) ) ( not ( = ?auto_576895 ?auto_576900 ) ) ( not ( = ?auto_576895 ?auto_576901 ) ) ( not ( = ?auto_576895 ?auto_576902 ) ) ( not ( = ?auto_576895 ?auto_576903 ) ) ( not ( = ?auto_576895 ?auto_576904 ) ) ( not ( = ?auto_576895 ?auto_576905 ) ) ( not ( = ?auto_576895 ?auto_576906 ) ) ( not ( = ?auto_576895 ?auto_576907 ) ) ( not ( = ?auto_576895 ?auto_576908 ) ) ( not ( = ?auto_576895 ?auto_576909 ) ) ( not ( = ?auto_576895 ?auto_576910 ) ) ( not ( = ?auto_576896 ?auto_576897 ) ) ( not ( = ?auto_576896 ?auto_576898 ) ) ( not ( = ?auto_576896 ?auto_576899 ) ) ( not ( = ?auto_576896 ?auto_576900 ) ) ( not ( = ?auto_576896 ?auto_576901 ) ) ( not ( = ?auto_576896 ?auto_576902 ) ) ( not ( = ?auto_576896 ?auto_576903 ) ) ( not ( = ?auto_576896 ?auto_576904 ) ) ( not ( = ?auto_576896 ?auto_576905 ) ) ( not ( = ?auto_576896 ?auto_576906 ) ) ( not ( = ?auto_576896 ?auto_576907 ) ) ( not ( = ?auto_576896 ?auto_576908 ) ) ( not ( = ?auto_576896 ?auto_576909 ) ) ( not ( = ?auto_576896 ?auto_576910 ) ) ( not ( = ?auto_576897 ?auto_576898 ) ) ( not ( = ?auto_576897 ?auto_576899 ) ) ( not ( = ?auto_576897 ?auto_576900 ) ) ( not ( = ?auto_576897 ?auto_576901 ) ) ( not ( = ?auto_576897 ?auto_576902 ) ) ( not ( = ?auto_576897 ?auto_576903 ) ) ( not ( = ?auto_576897 ?auto_576904 ) ) ( not ( = ?auto_576897 ?auto_576905 ) ) ( not ( = ?auto_576897 ?auto_576906 ) ) ( not ( = ?auto_576897 ?auto_576907 ) ) ( not ( = ?auto_576897 ?auto_576908 ) ) ( not ( = ?auto_576897 ?auto_576909 ) ) ( not ( = ?auto_576897 ?auto_576910 ) ) ( not ( = ?auto_576898 ?auto_576899 ) ) ( not ( = ?auto_576898 ?auto_576900 ) ) ( not ( = ?auto_576898 ?auto_576901 ) ) ( not ( = ?auto_576898 ?auto_576902 ) ) ( not ( = ?auto_576898 ?auto_576903 ) ) ( not ( = ?auto_576898 ?auto_576904 ) ) ( not ( = ?auto_576898 ?auto_576905 ) ) ( not ( = ?auto_576898 ?auto_576906 ) ) ( not ( = ?auto_576898 ?auto_576907 ) ) ( not ( = ?auto_576898 ?auto_576908 ) ) ( not ( = ?auto_576898 ?auto_576909 ) ) ( not ( = ?auto_576898 ?auto_576910 ) ) ( not ( = ?auto_576899 ?auto_576900 ) ) ( not ( = ?auto_576899 ?auto_576901 ) ) ( not ( = ?auto_576899 ?auto_576902 ) ) ( not ( = ?auto_576899 ?auto_576903 ) ) ( not ( = ?auto_576899 ?auto_576904 ) ) ( not ( = ?auto_576899 ?auto_576905 ) ) ( not ( = ?auto_576899 ?auto_576906 ) ) ( not ( = ?auto_576899 ?auto_576907 ) ) ( not ( = ?auto_576899 ?auto_576908 ) ) ( not ( = ?auto_576899 ?auto_576909 ) ) ( not ( = ?auto_576899 ?auto_576910 ) ) ( not ( = ?auto_576900 ?auto_576901 ) ) ( not ( = ?auto_576900 ?auto_576902 ) ) ( not ( = ?auto_576900 ?auto_576903 ) ) ( not ( = ?auto_576900 ?auto_576904 ) ) ( not ( = ?auto_576900 ?auto_576905 ) ) ( not ( = ?auto_576900 ?auto_576906 ) ) ( not ( = ?auto_576900 ?auto_576907 ) ) ( not ( = ?auto_576900 ?auto_576908 ) ) ( not ( = ?auto_576900 ?auto_576909 ) ) ( not ( = ?auto_576900 ?auto_576910 ) ) ( not ( = ?auto_576901 ?auto_576902 ) ) ( not ( = ?auto_576901 ?auto_576903 ) ) ( not ( = ?auto_576901 ?auto_576904 ) ) ( not ( = ?auto_576901 ?auto_576905 ) ) ( not ( = ?auto_576901 ?auto_576906 ) ) ( not ( = ?auto_576901 ?auto_576907 ) ) ( not ( = ?auto_576901 ?auto_576908 ) ) ( not ( = ?auto_576901 ?auto_576909 ) ) ( not ( = ?auto_576901 ?auto_576910 ) ) ( not ( = ?auto_576902 ?auto_576903 ) ) ( not ( = ?auto_576902 ?auto_576904 ) ) ( not ( = ?auto_576902 ?auto_576905 ) ) ( not ( = ?auto_576902 ?auto_576906 ) ) ( not ( = ?auto_576902 ?auto_576907 ) ) ( not ( = ?auto_576902 ?auto_576908 ) ) ( not ( = ?auto_576902 ?auto_576909 ) ) ( not ( = ?auto_576902 ?auto_576910 ) ) ( not ( = ?auto_576903 ?auto_576904 ) ) ( not ( = ?auto_576903 ?auto_576905 ) ) ( not ( = ?auto_576903 ?auto_576906 ) ) ( not ( = ?auto_576903 ?auto_576907 ) ) ( not ( = ?auto_576903 ?auto_576908 ) ) ( not ( = ?auto_576903 ?auto_576909 ) ) ( not ( = ?auto_576903 ?auto_576910 ) ) ( not ( = ?auto_576904 ?auto_576905 ) ) ( not ( = ?auto_576904 ?auto_576906 ) ) ( not ( = ?auto_576904 ?auto_576907 ) ) ( not ( = ?auto_576904 ?auto_576908 ) ) ( not ( = ?auto_576904 ?auto_576909 ) ) ( not ( = ?auto_576904 ?auto_576910 ) ) ( not ( = ?auto_576905 ?auto_576906 ) ) ( not ( = ?auto_576905 ?auto_576907 ) ) ( not ( = ?auto_576905 ?auto_576908 ) ) ( not ( = ?auto_576905 ?auto_576909 ) ) ( not ( = ?auto_576905 ?auto_576910 ) ) ( not ( = ?auto_576906 ?auto_576907 ) ) ( not ( = ?auto_576906 ?auto_576908 ) ) ( not ( = ?auto_576906 ?auto_576909 ) ) ( not ( = ?auto_576906 ?auto_576910 ) ) ( not ( = ?auto_576907 ?auto_576908 ) ) ( not ( = ?auto_576907 ?auto_576909 ) ) ( not ( = ?auto_576907 ?auto_576910 ) ) ( not ( = ?auto_576908 ?auto_576909 ) ) ( not ( = ?auto_576908 ?auto_576910 ) ) ( not ( = ?auto_576909 ?auto_576910 ) ) ( CLEAR ?auto_576908 ) ( ON ?auto_576909 ?auto_576910 ) ( CLEAR ?auto_576909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_576895 ?auto_576896 ?auto_576897 ?auto_576898 ?auto_576899 ?auto_576900 ?auto_576901 ?auto_576902 ?auto_576903 ?auto_576904 ?auto_576905 ?auto_576906 ?auto_576907 ?auto_576908 ?auto_576909 )
      ( MAKE-16PILE ?auto_576895 ?auto_576896 ?auto_576897 ?auto_576898 ?auto_576899 ?auto_576900 ?auto_576901 ?auto_576902 ?auto_576903 ?auto_576904 ?auto_576905 ?auto_576906 ?auto_576907 ?auto_576908 ?auto_576909 ?auto_576910 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_576927 - BLOCK
      ?auto_576928 - BLOCK
      ?auto_576929 - BLOCK
      ?auto_576930 - BLOCK
      ?auto_576931 - BLOCK
      ?auto_576932 - BLOCK
      ?auto_576933 - BLOCK
      ?auto_576934 - BLOCK
      ?auto_576935 - BLOCK
      ?auto_576936 - BLOCK
      ?auto_576937 - BLOCK
      ?auto_576938 - BLOCK
      ?auto_576939 - BLOCK
      ?auto_576940 - BLOCK
      ?auto_576941 - BLOCK
      ?auto_576942 - BLOCK
    )
    :vars
    (
      ?auto_576943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_576942 ?auto_576943 ) ( ON-TABLE ?auto_576927 ) ( ON ?auto_576928 ?auto_576927 ) ( ON ?auto_576929 ?auto_576928 ) ( ON ?auto_576930 ?auto_576929 ) ( ON ?auto_576931 ?auto_576930 ) ( ON ?auto_576932 ?auto_576931 ) ( ON ?auto_576933 ?auto_576932 ) ( ON ?auto_576934 ?auto_576933 ) ( ON ?auto_576935 ?auto_576934 ) ( ON ?auto_576936 ?auto_576935 ) ( ON ?auto_576937 ?auto_576936 ) ( ON ?auto_576938 ?auto_576937 ) ( ON ?auto_576939 ?auto_576938 ) ( not ( = ?auto_576927 ?auto_576928 ) ) ( not ( = ?auto_576927 ?auto_576929 ) ) ( not ( = ?auto_576927 ?auto_576930 ) ) ( not ( = ?auto_576927 ?auto_576931 ) ) ( not ( = ?auto_576927 ?auto_576932 ) ) ( not ( = ?auto_576927 ?auto_576933 ) ) ( not ( = ?auto_576927 ?auto_576934 ) ) ( not ( = ?auto_576927 ?auto_576935 ) ) ( not ( = ?auto_576927 ?auto_576936 ) ) ( not ( = ?auto_576927 ?auto_576937 ) ) ( not ( = ?auto_576927 ?auto_576938 ) ) ( not ( = ?auto_576927 ?auto_576939 ) ) ( not ( = ?auto_576927 ?auto_576940 ) ) ( not ( = ?auto_576927 ?auto_576941 ) ) ( not ( = ?auto_576927 ?auto_576942 ) ) ( not ( = ?auto_576927 ?auto_576943 ) ) ( not ( = ?auto_576928 ?auto_576929 ) ) ( not ( = ?auto_576928 ?auto_576930 ) ) ( not ( = ?auto_576928 ?auto_576931 ) ) ( not ( = ?auto_576928 ?auto_576932 ) ) ( not ( = ?auto_576928 ?auto_576933 ) ) ( not ( = ?auto_576928 ?auto_576934 ) ) ( not ( = ?auto_576928 ?auto_576935 ) ) ( not ( = ?auto_576928 ?auto_576936 ) ) ( not ( = ?auto_576928 ?auto_576937 ) ) ( not ( = ?auto_576928 ?auto_576938 ) ) ( not ( = ?auto_576928 ?auto_576939 ) ) ( not ( = ?auto_576928 ?auto_576940 ) ) ( not ( = ?auto_576928 ?auto_576941 ) ) ( not ( = ?auto_576928 ?auto_576942 ) ) ( not ( = ?auto_576928 ?auto_576943 ) ) ( not ( = ?auto_576929 ?auto_576930 ) ) ( not ( = ?auto_576929 ?auto_576931 ) ) ( not ( = ?auto_576929 ?auto_576932 ) ) ( not ( = ?auto_576929 ?auto_576933 ) ) ( not ( = ?auto_576929 ?auto_576934 ) ) ( not ( = ?auto_576929 ?auto_576935 ) ) ( not ( = ?auto_576929 ?auto_576936 ) ) ( not ( = ?auto_576929 ?auto_576937 ) ) ( not ( = ?auto_576929 ?auto_576938 ) ) ( not ( = ?auto_576929 ?auto_576939 ) ) ( not ( = ?auto_576929 ?auto_576940 ) ) ( not ( = ?auto_576929 ?auto_576941 ) ) ( not ( = ?auto_576929 ?auto_576942 ) ) ( not ( = ?auto_576929 ?auto_576943 ) ) ( not ( = ?auto_576930 ?auto_576931 ) ) ( not ( = ?auto_576930 ?auto_576932 ) ) ( not ( = ?auto_576930 ?auto_576933 ) ) ( not ( = ?auto_576930 ?auto_576934 ) ) ( not ( = ?auto_576930 ?auto_576935 ) ) ( not ( = ?auto_576930 ?auto_576936 ) ) ( not ( = ?auto_576930 ?auto_576937 ) ) ( not ( = ?auto_576930 ?auto_576938 ) ) ( not ( = ?auto_576930 ?auto_576939 ) ) ( not ( = ?auto_576930 ?auto_576940 ) ) ( not ( = ?auto_576930 ?auto_576941 ) ) ( not ( = ?auto_576930 ?auto_576942 ) ) ( not ( = ?auto_576930 ?auto_576943 ) ) ( not ( = ?auto_576931 ?auto_576932 ) ) ( not ( = ?auto_576931 ?auto_576933 ) ) ( not ( = ?auto_576931 ?auto_576934 ) ) ( not ( = ?auto_576931 ?auto_576935 ) ) ( not ( = ?auto_576931 ?auto_576936 ) ) ( not ( = ?auto_576931 ?auto_576937 ) ) ( not ( = ?auto_576931 ?auto_576938 ) ) ( not ( = ?auto_576931 ?auto_576939 ) ) ( not ( = ?auto_576931 ?auto_576940 ) ) ( not ( = ?auto_576931 ?auto_576941 ) ) ( not ( = ?auto_576931 ?auto_576942 ) ) ( not ( = ?auto_576931 ?auto_576943 ) ) ( not ( = ?auto_576932 ?auto_576933 ) ) ( not ( = ?auto_576932 ?auto_576934 ) ) ( not ( = ?auto_576932 ?auto_576935 ) ) ( not ( = ?auto_576932 ?auto_576936 ) ) ( not ( = ?auto_576932 ?auto_576937 ) ) ( not ( = ?auto_576932 ?auto_576938 ) ) ( not ( = ?auto_576932 ?auto_576939 ) ) ( not ( = ?auto_576932 ?auto_576940 ) ) ( not ( = ?auto_576932 ?auto_576941 ) ) ( not ( = ?auto_576932 ?auto_576942 ) ) ( not ( = ?auto_576932 ?auto_576943 ) ) ( not ( = ?auto_576933 ?auto_576934 ) ) ( not ( = ?auto_576933 ?auto_576935 ) ) ( not ( = ?auto_576933 ?auto_576936 ) ) ( not ( = ?auto_576933 ?auto_576937 ) ) ( not ( = ?auto_576933 ?auto_576938 ) ) ( not ( = ?auto_576933 ?auto_576939 ) ) ( not ( = ?auto_576933 ?auto_576940 ) ) ( not ( = ?auto_576933 ?auto_576941 ) ) ( not ( = ?auto_576933 ?auto_576942 ) ) ( not ( = ?auto_576933 ?auto_576943 ) ) ( not ( = ?auto_576934 ?auto_576935 ) ) ( not ( = ?auto_576934 ?auto_576936 ) ) ( not ( = ?auto_576934 ?auto_576937 ) ) ( not ( = ?auto_576934 ?auto_576938 ) ) ( not ( = ?auto_576934 ?auto_576939 ) ) ( not ( = ?auto_576934 ?auto_576940 ) ) ( not ( = ?auto_576934 ?auto_576941 ) ) ( not ( = ?auto_576934 ?auto_576942 ) ) ( not ( = ?auto_576934 ?auto_576943 ) ) ( not ( = ?auto_576935 ?auto_576936 ) ) ( not ( = ?auto_576935 ?auto_576937 ) ) ( not ( = ?auto_576935 ?auto_576938 ) ) ( not ( = ?auto_576935 ?auto_576939 ) ) ( not ( = ?auto_576935 ?auto_576940 ) ) ( not ( = ?auto_576935 ?auto_576941 ) ) ( not ( = ?auto_576935 ?auto_576942 ) ) ( not ( = ?auto_576935 ?auto_576943 ) ) ( not ( = ?auto_576936 ?auto_576937 ) ) ( not ( = ?auto_576936 ?auto_576938 ) ) ( not ( = ?auto_576936 ?auto_576939 ) ) ( not ( = ?auto_576936 ?auto_576940 ) ) ( not ( = ?auto_576936 ?auto_576941 ) ) ( not ( = ?auto_576936 ?auto_576942 ) ) ( not ( = ?auto_576936 ?auto_576943 ) ) ( not ( = ?auto_576937 ?auto_576938 ) ) ( not ( = ?auto_576937 ?auto_576939 ) ) ( not ( = ?auto_576937 ?auto_576940 ) ) ( not ( = ?auto_576937 ?auto_576941 ) ) ( not ( = ?auto_576937 ?auto_576942 ) ) ( not ( = ?auto_576937 ?auto_576943 ) ) ( not ( = ?auto_576938 ?auto_576939 ) ) ( not ( = ?auto_576938 ?auto_576940 ) ) ( not ( = ?auto_576938 ?auto_576941 ) ) ( not ( = ?auto_576938 ?auto_576942 ) ) ( not ( = ?auto_576938 ?auto_576943 ) ) ( not ( = ?auto_576939 ?auto_576940 ) ) ( not ( = ?auto_576939 ?auto_576941 ) ) ( not ( = ?auto_576939 ?auto_576942 ) ) ( not ( = ?auto_576939 ?auto_576943 ) ) ( not ( = ?auto_576940 ?auto_576941 ) ) ( not ( = ?auto_576940 ?auto_576942 ) ) ( not ( = ?auto_576940 ?auto_576943 ) ) ( not ( = ?auto_576941 ?auto_576942 ) ) ( not ( = ?auto_576941 ?auto_576943 ) ) ( not ( = ?auto_576942 ?auto_576943 ) ) ( ON ?auto_576941 ?auto_576942 ) ( CLEAR ?auto_576939 ) ( ON ?auto_576940 ?auto_576941 ) ( CLEAR ?auto_576940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_576927 ?auto_576928 ?auto_576929 ?auto_576930 ?auto_576931 ?auto_576932 ?auto_576933 ?auto_576934 ?auto_576935 ?auto_576936 ?auto_576937 ?auto_576938 ?auto_576939 ?auto_576940 )
      ( MAKE-16PILE ?auto_576927 ?auto_576928 ?auto_576929 ?auto_576930 ?auto_576931 ?auto_576932 ?auto_576933 ?auto_576934 ?auto_576935 ?auto_576936 ?auto_576937 ?auto_576938 ?auto_576939 ?auto_576940 ?auto_576941 ?auto_576942 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_576960 - BLOCK
      ?auto_576961 - BLOCK
      ?auto_576962 - BLOCK
      ?auto_576963 - BLOCK
      ?auto_576964 - BLOCK
      ?auto_576965 - BLOCK
      ?auto_576966 - BLOCK
      ?auto_576967 - BLOCK
      ?auto_576968 - BLOCK
      ?auto_576969 - BLOCK
      ?auto_576970 - BLOCK
      ?auto_576971 - BLOCK
      ?auto_576972 - BLOCK
      ?auto_576973 - BLOCK
      ?auto_576974 - BLOCK
      ?auto_576975 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_576975 ) ( ON-TABLE ?auto_576960 ) ( ON ?auto_576961 ?auto_576960 ) ( ON ?auto_576962 ?auto_576961 ) ( ON ?auto_576963 ?auto_576962 ) ( ON ?auto_576964 ?auto_576963 ) ( ON ?auto_576965 ?auto_576964 ) ( ON ?auto_576966 ?auto_576965 ) ( ON ?auto_576967 ?auto_576966 ) ( ON ?auto_576968 ?auto_576967 ) ( ON ?auto_576969 ?auto_576968 ) ( ON ?auto_576970 ?auto_576969 ) ( ON ?auto_576971 ?auto_576970 ) ( ON ?auto_576972 ?auto_576971 ) ( not ( = ?auto_576960 ?auto_576961 ) ) ( not ( = ?auto_576960 ?auto_576962 ) ) ( not ( = ?auto_576960 ?auto_576963 ) ) ( not ( = ?auto_576960 ?auto_576964 ) ) ( not ( = ?auto_576960 ?auto_576965 ) ) ( not ( = ?auto_576960 ?auto_576966 ) ) ( not ( = ?auto_576960 ?auto_576967 ) ) ( not ( = ?auto_576960 ?auto_576968 ) ) ( not ( = ?auto_576960 ?auto_576969 ) ) ( not ( = ?auto_576960 ?auto_576970 ) ) ( not ( = ?auto_576960 ?auto_576971 ) ) ( not ( = ?auto_576960 ?auto_576972 ) ) ( not ( = ?auto_576960 ?auto_576973 ) ) ( not ( = ?auto_576960 ?auto_576974 ) ) ( not ( = ?auto_576960 ?auto_576975 ) ) ( not ( = ?auto_576961 ?auto_576962 ) ) ( not ( = ?auto_576961 ?auto_576963 ) ) ( not ( = ?auto_576961 ?auto_576964 ) ) ( not ( = ?auto_576961 ?auto_576965 ) ) ( not ( = ?auto_576961 ?auto_576966 ) ) ( not ( = ?auto_576961 ?auto_576967 ) ) ( not ( = ?auto_576961 ?auto_576968 ) ) ( not ( = ?auto_576961 ?auto_576969 ) ) ( not ( = ?auto_576961 ?auto_576970 ) ) ( not ( = ?auto_576961 ?auto_576971 ) ) ( not ( = ?auto_576961 ?auto_576972 ) ) ( not ( = ?auto_576961 ?auto_576973 ) ) ( not ( = ?auto_576961 ?auto_576974 ) ) ( not ( = ?auto_576961 ?auto_576975 ) ) ( not ( = ?auto_576962 ?auto_576963 ) ) ( not ( = ?auto_576962 ?auto_576964 ) ) ( not ( = ?auto_576962 ?auto_576965 ) ) ( not ( = ?auto_576962 ?auto_576966 ) ) ( not ( = ?auto_576962 ?auto_576967 ) ) ( not ( = ?auto_576962 ?auto_576968 ) ) ( not ( = ?auto_576962 ?auto_576969 ) ) ( not ( = ?auto_576962 ?auto_576970 ) ) ( not ( = ?auto_576962 ?auto_576971 ) ) ( not ( = ?auto_576962 ?auto_576972 ) ) ( not ( = ?auto_576962 ?auto_576973 ) ) ( not ( = ?auto_576962 ?auto_576974 ) ) ( not ( = ?auto_576962 ?auto_576975 ) ) ( not ( = ?auto_576963 ?auto_576964 ) ) ( not ( = ?auto_576963 ?auto_576965 ) ) ( not ( = ?auto_576963 ?auto_576966 ) ) ( not ( = ?auto_576963 ?auto_576967 ) ) ( not ( = ?auto_576963 ?auto_576968 ) ) ( not ( = ?auto_576963 ?auto_576969 ) ) ( not ( = ?auto_576963 ?auto_576970 ) ) ( not ( = ?auto_576963 ?auto_576971 ) ) ( not ( = ?auto_576963 ?auto_576972 ) ) ( not ( = ?auto_576963 ?auto_576973 ) ) ( not ( = ?auto_576963 ?auto_576974 ) ) ( not ( = ?auto_576963 ?auto_576975 ) ) ( not ( = ?auto_576964 ?auto_576965 ) ) ( not ( = ?auto_576964 ?auto_576966 ) ) ( not ( = ?auto_576964 ?auto_576967 ) ) ( not ( = ?auto_576964 ?auto_576968 ) ) ( not ( = ?auto_576964 ?auto_576969 ) ) ( not ( = ?auto_576964 ?auto_576970 ) ) ( not ( = ?auto_576964 ?auto_576971 ) ) ( not ( = ?auto_576964 ?auto_576972 ) ) ( not ( = ?auto_576964 ?auto_576973 ) ) ( not ( = ?auto_576964 ?auto_576974 ) ) ( not ( = ?auto_576964 ?auto_576975 ) ) ( not ( = ?auto_576965 ?auto_576966 ) ) ( not ( = ?auto_576965 ?auto_576967 ) ) ( not ( = ?auto_576965 ?auto_576968 ) ) ( not ( = ?auto_576965 ?auto_576969 ) ) ( not ( = ?auto_576965 ?auto_576970 ) ) ( not ( = ?auto_576965 ?auto_576971 ) ) ( not ( = ?auto_576965 ?auto_576972 ) ) ( not ( = ?auto_576965 ?auto_576973 ) ) ( not ( = ?auto_576965 ?auto_576974 ) ) ( not ( = ?auto_576965 ?auto_576975 ) ) ( not ( = ?auto_576966 ?auto_576967 ) ) ( not ( = ?auto_576966 ?auto_576968 ) ) ( not ( = ?auto_576966 ?auto_576969 ) ) ( not ( = ?auto_576966 ?auto_576970 ) ) ( not ( = ?auto_576966 ?auto_576971 ) ) ( not ( = ?auto_576966 ?auto_576972 ) ) ( not ( = ?auto_576966 ?auto_576973 ) ) ( not ( = ?auto_576966 ?auto_576974 ) ) ( not ( = ?auto_576966 ?auto_576975 ) ) ( not ( = ?auto_576967 ?auto_576968 ) ) ( not ( = ?auto_576967 ?auto_576969 ) ) ( not ( = ?auto_576967 ?auto_576970 ) ) ( not ( = ?auto_576967 ?auto_576971 ) ) ( not ( = ?auto_576967 ?auto_576972 ) ) ( not ( = ?auto_576967 ?auto_576973 ) ) ( not ( = ?auto_576967 ?auto_576974 ) ) ( not ( = ?auto_576967 ?auto_576975 ) ) ( not ( = ?auto_576968 ?auto_576969 ) ) ( not ( = ?auto_576968 ?auto_576970 ) ) ( not ( = ?auto_576968 ?auto_576971 ) ) ( not ( = ?auto_576968 ?auto_576972 ) ) ( not ( = ?auto_576968 ?auto_576973 ) ) ( not ( = ?auto_576968 ?auto_576974 ) ) ( not ( = ?auto_576968 ?auto_576975 ) ) ( not ( = ?auto_576969 ?auto_576970 ) ) ( not ( = ?auto_576969 ?auto_576971 ) ) ( not ( = ?auto_576969 ?auto_576972 ) ) ( not ( = ?auto_576969 ?auto_576973 ) ) ( not ( = ?auto_576969 ?auto_576974 ) ) ( not ( = ?auto_576969 ?auto_576975 ) ) ( not ( = ?auto_576970 ?auto_576971 ) ) ( not ( = ?auto_576970 ?auto_576972 ) ) ( not ( = ?auto_576970 ?auto_576973 ) ) ( not ( = ?auto_576970 ?auto_576974 ) ) ( not ( = ?auto_576970 ?auto_576975 ) ) ( not ( = ?auto_576971 ?auto_576972 ) ) ( not ( = ?auto_576971 ?auto_576973 ) ) ( not ( = ?auto_576971 ?auto_576974 ) ) ( not ( = ?auto_576971 ?auto_576975 ) ) ( not ( = ?auto_576972 ?auto_576973 ) ) ( not ( = ?auto_576972 ?auto_576974 ) ) ( not ( = ?auto_576972 ?auto_576975 ) ) ( not ( = ?auto_576973 ?auto_576974 ) ) ( not ( = ?auto_576973 ?auto_576975 ) ) ( not ( = ?auto_576974 ?auto_576975 ) ) ( ON ?auto_576974 ?auto_576975 ) ( CLEAR ?auto_576972 ) ( ON ?auto_576973 ?auto_576974 ) ( CLEAR ?auto_576973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_576960 ?auto_576961 ?auto_576962 ?auto_576963 ?auto_576964 ?auto_576965 ?auto_576966 ?auto_576967 ?auto_576968 ?auto_576969 ?auto_576970 ?auto_576971 ?auto_576972 ?auto_576973 )
      ( MAKE-16PILE ?auto_576960 ?auto_576961 ?auto_576962 ?auto_576963 ?auto_576964 ?auto_576965 ?auto_576966 ?auto_576967 ?auto_576968 ?auto_576969 ?auto_576970 ?auto_576971 ?auto_576972 ?auto_576973 ?auto_576974 ?auto_576975 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_576992 - BLOCK
      ?auto_576993 - BLOCK
      ?auto_576994 - BLOCK
      ?auto_576995 - BLOCK
      ?auto_576996 - BLOCK
      ?auto_576997 - BLOCK
      ?auto_576998 - BLOCK
      ?auto_576999 - BLOCK
      ?auto_577000 - BLOCK
      ?auto_577001 - BLOCK
      ?auto_577002 - BLOCK
      ?auto_577003 - BLOCK
      ?auto_577004 - BLOCK
      ?auto_577005 - BLOCK
      ?auto_577006 - BLOCK
      ?auto_577007 - BLOCK
    )
    :vars
    (
      ?auto_577008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_577007 ?auto_577008 ) ( ON-TABLE ?auto_576992 ) ( ON ?auto_576993 ?auto_576992 ) ( ON ?auto_576994 ?auto_576993 ) ( ON ?auto_576995 ?auto_576994 ) ( ON ?auto_576996 ?auto_576995 ) ( ON ?auto_576997 ?auto_576996 ) ( ON ?auto_576998 ?auto_576997 ) ( ON ?auto_576999 ?auto_576998 ) ( ON ?auto_577000 ?auto_576999 ) ( ON ?auto_577001 ?auto_577000 ) ( ON ?auto_577002 ?auto_577001 ) ( ON ?auto_577003 ?auto_577002 ) ( not ( = ?auto_576992 ?auto_576993 ) ) ( not ( = ?auto_576992 ?auto_576994 ) ) ( not ( = ?auto_576992 ?auto_576995 ) ) ( not ( = ?auto_576992 ?auto_576996 ) ) ( not ( = ?auto_576992 ?auto_576997 ) ) ( not ( = ?auto_576992 ?auto_576998 ) ) ( not ( = ?auto_576992 ?auto_576999 ) ) ( not ( = ?auto_576992 ?auto_577000 ) ) ( not ( = ?auto_576992 ?auto_577001 ) ) ( not ( = ?auto_576992 ?auto_577002 ) ) ( not ( = ?auto_576992 ?auto_577003 ) ) ( not ( = ?auto_576992 ?auto_577004 ) ) ( not ( = ?auto_576992 ?auto_577005 ) ) ( not ( = ?auto_576992 ?auto_577006 ) ) ( not ( = ?auto_576992 ?auto_577007 ) ) ( not ( = ?auto_576992 ?auto_577008 ) ) ( not ( = ?auto_576993 ?auto_576994 ) ) ( not ( = ?auto_576993 ?auto_576995 ) ) ( not ( = ?auto_576993 ?auto_576996 ) ) ( not ( = ?auto_576993 ?auto_576997 ) ) ( not ( = ?auto_576993 ?auto_576998 ) ) ( not ( = ?auto_576993 ?auto_576999 ) ) ( not ( = ?auto_576993 ?auto_577000 ) ) ( not ( = ?auto_576993 ?auto_577001 ) ) ( not ( = ?auto_576993 ?auto_577002 ) ) ( not ( = ?auto_576993 ?auto_577003 ) ) ( not ( = ?auto_576993 ?auto_577004 ) ) ( not ( = ?auto_576993 ?auto_577005 ) ) ( not ( = ?auto_576993 ?auto_577006 ) ) ( not ( = ?auto_576993 ?auto_577007 ) ) ( not ( = ?auto_576993 ?auto_577008 ) ) ( not ( = ?auto_576994 ?auto_576995 ) ) ( not ( = ?auto_576994 ?auto_576996 ) ) ( not ( = ?auto_576994 ?auto_576997 ) ) ( not ( = ?auto_576994 ?auto_576998 ) ) ( not ( = ?auto_576994 ?auto_576999 ) ) ( not ( = ?auto_576994 ?auto_577000 ) ) ( not ( = ?auto_576994 ?auto_577001 ) ) ( not ( = ?auto_576994 ?auto_577002 ) ) ( not ( = ?auto_576994 ?auto_577003 ) ) ( not ( = ?auto_576994 ?auto_577004 ) ) ( not ( = ?auto_576994 ?auto_577005 ) ) ( not ( = ?auto_576994 ?auto_577006 ) ) ( not ( = ?auto_576994 ?auto_577007 ) ) ( not ( = ?auto_576994 ?auto_577008 ) ) ( not ( = ?auto_576995 ?auto_576996 ) ) ( not ( = ?auto_576995 ?auto_576997 ) ) ( not ( = ?auto_576995 ?auto_576998 ) ) ( not ( = ?auto_576995 ?auto_576999 ) ) ( not ( = ?auto_576995 ?auto_577000 ) ) ( not ( = ?auto_576995 ?auto_577001 ) ) ( not ( = ?auto_576995 ?auto_577002 ) ) ( not ( = ?auto_576995 ?auto_577003 ) ) ( not ( = ?auto_576995 ?auto_577004 ) ) ( not ( = ?auto_576995 ?auto_577005 ) ) ( not ( = ?auto_576995 ?auto_577006 ) ) ( not ( = ?auto_576995 ?auto_577007 ) ) ( not ( = ?auto_576995 ?auto_577008 ) ) ( not ( = ?auto_576996 ?auto_576997 ) ) ( not ( = ?auto_576996 ?auto_576998 ) ) ( not ( = ?auto_576996 ?auto_576999 ) ) ( not ( = ?auto_576996 ?auto_577000 ) ) ( not ( = ?auto_576996 ?auto_577001 ) ) ( not ( = ?auto_576996 ?auto_577002 ) ) ( not ( = ?auto_576996 ?auto_577003 ) ) ( not ( = ?auto_576996 ?auto_577004 ) ) ( not ( = ?auto_576996 ?auto_577005 ) ) ( not ( = ?auto_576996 ?auto_577006 ) ) ( not ( = ?auto_576996 ?auto_577007 ) ) ( not ( = ?auto_576996 ?auto_577008 ) ) ( not ( = ?auto_576997 ?auto_576998 ) ) ( not ( = ?auto_576997 ?auto_576999 ) ) ( not ( = ?auto_576997 ?auto_577000 ) ) ( not ( = ?auto_576997 ?auto_577001 ) ) ( not ( = ?auto_576997 ?auto_577002 ) ) ( not ( = ?auto_576997 ?auto_577003 ) ) ( not ( = ?auto_576997 ?auto_577004 ) ) ( not ( = ?auto_576997 ?auto_577005 ) ) ( not ( = ?auto_576997 ?auto_577006 ) ) ( not ( = ?auto_576997 ?auto_577007 ) ) ( not ( = ?auto_576997 ?auto_577008 ) ) ( not ( = ?auto_576998 ?auto_576999 ) ) ( not ( = ?auto_576998 ?auto_577000 ) ) ( not ( = ?auto_576998 ?auto_577001 ) ) ( not ( = ?auto_576998 ?auto_577002 ) ) ( not ( = ?auto_576998 ?auto_577003 ) ) ( not ( = ?auto_576998 ?auto_577004 ) ) ( not ( = ?auto_576998 ?auto_577005 ) ) ( not ( = ?auto_576998 ?auto_577006 ) ) ( not ( = ?auto_576998 ?auto_577007 ) ) ( not ( = ?auto_576998 ?auto_577008 ) ) ( not ( = ?auto_576999 ?auto_577000 ) ) ( not ( = ?auto_576999 ?auto_577001 ) ) ( not ( = ?auto_576999 ?auto_577002 ) ) ( not ( = ?auto_576999 ?auto_577003 ) ) ( not ( = ?auto_576999 ?auto_577004 ) ) ( not ( = ?auto_576999 ?auto_577005 ) ) ( not ( = ?auto_576999 ?auto_577006 ) ) ( not ( = ?auto_576999 ?auto_577007 ) ) ( not ( = ?auto_576999 ?auto_577008 ) ) ( not ( = ?auto_577000 ?auto_577001 ) ) ( not ( = ?auto_577000 ?auto_577002 ) ) ( not ( = ?auto_577000 ?auto_577003 ) ) ( not ( = ?auto_577000 ?auto_577004 ) ) ( not ( = ?auto_577000 ?auto_577005 ) ) ( not ( = ?auto_577000 ?auto_577006 ) ) ( not ( = ?auto_577000 ?auto_577007 ) ) ( not ( = ?auto_577000 ?auto_577008 ) ) ( not ( = ?auto_577001 ?auto_577002 ) ) ( not ( = ?auto_577001 ?auto_577003 ) ) ( not ( = ?auto_577001 ?auto_577004 ) ) ( not ( = ?auto_577001 ?auto_577005 ) ) ( not ( = ?auto_577001 ?auto_577006 ) ) ( not ( = ?auto_577001 ?auto_577007 ) ) ( not ( = ?auto_577001 ?auto_577008 ) ) ( not ( = ?auto_577002 ?auto_577003 ) ) ( not ( = ?auto_577002 ?auto_577004 ) ) ( not ( = ?auto_577002 ?auto_577005 ) ) ( not ( = ?auto_577002 ?auto_577006 ) ) ( not ( = ?auto_577002 ?auto_577007 ) ) ( not ( = ?auto_577002 ?auto_577008 ) ) ( not ( = ?auto_577003 ?auto_577004 ) ) ( not ( = ?auto_577003 ?auto_577005 ) ) ( not ( = ?auto_577003 ?auto_577006 ) ) ( not ( = ?auto_577003 ?auto_577007 ) ) ( not ( = ?auto_577003 ?auto_577008 ) ) ( not ( = ?auto_577004 ?auto_577005 ) ) ( not ( = ?auto_577004 ?auto_577006 ) ) ( not ( = ?auto_577004 ?auto_577007 ) ) ( not ( = ?auto_577004 ?auto_577008 ) ) ( not ( = ?auto_577005 ?auto_577006 ) ) ( not ( = ?auto_577005 ?auto_577007 ) ) ( not ( = ?auto_577005 ?auto_577008 ) ) ( not ( = ?auto_577006 ?auto_577007 ) ) ( not ( = ?auto_577006 ?auto_577008 ) ) ( not ( = ?auto_577007 ?auto_577008 ) ) ( ON ?auto_577006 ?auto_577007 ) ( ON ?auto_577005 ?auto_577006 ) ( CLEAR ?auto_577003 ) ( ON ?auto_577004 ?auto_577005 ) ( CLEAR ?auto_577004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_576992 ?auto_576993 ?auto_576994 ?auto_576995 ?auto_576996 ?auto_576997 ?auto_576998 ?auto_576999 ?auto_577000 ?auto_577001 ?auto_577002 ?auto_577003 ?auto_577004 )
      ( MAKE-16PILE ?auto_576992 ?auto_576993 ?auto_576994 ?auto_576995 ?auto_576996 ?auto_576997 ?auto_576998 ?auto_576999 ?auto_577000 ?auto_577001 ?auto_577002 ?auto_577003 ?auto_577004 ?auto_577005 ?auto_577006 ?auto_577007 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577025 - BLOCK
      ?auto_577026 - BLOCK
      ?auto_577027 - BLOCK
      ?auto_577028 - BLOCK
      ?auto_577029 - BLOCK
      ?auto_577030 - BLOCK
      ?auto_577031 - BLOCK
      ?auto_577032 - BLOCK
      ?auto_577033 - BLOCK
      ?auto_577034 - BLOCK
      ?auto_577035 - BLOCK
      ?auto_577036 - BLOCK
      ?auto_577037 - BLOCK
      ?auto_577038 - BLOCK
      ?auto_577039 - BLOCK
      ?auto_577040 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_577040 ) ( ON-TABLE ?auto_577025 ) ( ON ?auto_577026 ?auto_577025 ) ( ON ?auto_577027 ?auto_577026 ) ( ON ?auto_577028 ?auto_577027 ) ( ON ?auto_577029 ?auto_577028 ) ( ON ?auto_577030 ?auto_577029 ) ( ON ?auto_577031 ?auto_577030 ) ( ON ?auto_577032 ?auto_577031 ) ( ON ?auto_577033 ?auto_577032 ) ( ON ?auto_577034 ?auto_577033 ) ( ON ?auto_577035 ?auto_577034 ) ( ON ?auto_577036 ?auto_577035 ) ( not ( = ?auto_577025 ?auto_577026 ) ) ( not ( = ?auto_577025 ?auto_577027 ) ) ( not ( = ?auto_577025 ?auto_577028 ) ) ( not ( = ?auto_577025 ?auto_577029 ) ) ( not ( = ?auto_577025 ?auto_577030 ) ) ( not ( = ?auto_577025 ?auto_577031 ) ) ( not ( = ?auto_577025 ?auto_577032 ) ) ( not ( = ?auto_577025 ?auto_577033 ) ) ( not ( = ?auto_577025 ?auto_577034 ) ) ( not ( = ?auto_577025 ?auto_577035 ) ) ( not ( = ?auto_577025 ?auto_577036 ) ) ( not ( = ?auto_577025 ?auto_577037 ) ) ( not ( = ?auto_577025 ?auto_577038 ) ) ( not ( = ?auto_577025 ?auto_577039 ) ) ( not ( = ?auto_577025 ?auto_577040 ) ) ( not ( = ?auto_577026 ?auto_577027 ) ) ( not ( = ?auto_577026 ?auto_577028 ) ) ( not ( = ?auto_577026 ?auto_577029 ) ) ( not ( = ?auto_577026 ?auto_577030 ) ) ( not ( = ?auto_577026 ?auto_577031 ) ) ( not ( = ?auto_577026 ?auto_577032 ) ) ( not ( = ?auto_577026 ?auto_577033 ) ) ( not ( = ?auto_577026 ?auto_577034 ) ) ( not ( = ?auto_577026 ?auto_577035 ) ) ( not ( = ?auto_577026 ?auto_577036 ) ) ( not ( = ?auto_577026 ?auto_577037 ) ) ( not ( = ?auto_577026 ?auto_577038 ) ) ( not ( = ?auto_577026 ?auto_577039 ) ) ( not ( = ?auto_577026 ?auto_577040 ) ) ( not ( = ?auto_577027 ?auto_577028 ) ) ( not ( = ?auto_577027 ?auto_577029 ) ) ( not ( = ?auto_577027 ?auto_577030 ) ) ( not ( = ?auto_577027 ?auto_577031 ) ) ( not ( = ?auto_577027 ?auto_577032 ) ) ( not ( = ?auto_577027 ?auto_577033 ) ) ( not ( = ?auto_577027 ?auto_577034 ) ) ( not ( = ?auto_577027 ?auto_577035 ) ) ( not ( = ?auto_577027 ?auto_577036 ) ) ( not ( = ?auto_577027 ?auto_577037 ) ) ( not ( = ?auto_577027 ?auto_577038 ) ) ( not ( = ?auto_577027 ?auto_577039 ) ) ( not ( = ?auto_577027 ?auto_577040 ) ) ( not ( = ?auto_577028 ?auto_577029 ) ) ( not ( = ?auto_577028 ?auto_577030 ) ) ( not ( = ?auto_577028 ?auto_577031 ) ) ( not ( = ?auto_577028 ?auto_577032 ) ) ( not ( = ?auto_577028 ?auto_577033 ) ) ( not ( = ?auto_577028 ?auto_577034 ) ) ( not ( = ?auto_577028 ?auto_577035 ) ) ( not ( = ?auto_577028 ?auto_577036 ) ) ( not ( = ?auto_577028 ?auto_577037 ) ) ( not ( = ?auto_577028 ?auto_577038 ) ) ( not ( = ?auto_577028 ?auto_577039 ) ) ( not ( = ?auto_577028 ?auto_577040 ) ) ( not ( = ?auto_577029 ?auto_577030 ) ) ( not ( = ?auto_577029 ?auto_577031 ) ) ( not ( = ?auto_577029 ?auto_577032 ) ) ( not ( = ?auto_577029 ?auto_577033 ) ) ( not ( = ?auto_577029 ?auto_577034 ) ) ( not ( = ?auto_577029 ?auto_577035 ) ) ( not ( = ?auto_577029 ?auto_577036 ) ) ( not ( = ?auto_577029 ?auto_577037 ) ) ( not ( = ?auto_577029 ?auto_577038 ) ) ( not ( = ?auto_577029 ?auto_577039 ) ) ( not ( = ?auto_577029 ?auto_577040 ) ) ( not ( = ?auto_577030 ?auto_577031 ) ) ( not ( = ?auto_577030 ?auto_577032 ) ) ( not ( = ?auto_577030 ?auto_577033 ) ) ( not ( = ?auto_577030 ?auto_577034 ) ) ( not ( = ?auto_577030 ?auto_577035 ) ) ( not ( = ?auto_577030 ?auto_577036 ) ) ( not ( = ?auto_577030 ?auto_577037 ) ) ( not ( = ?auto_577030 ?auto_577038 ) ) ( not ( = ?auto_577030 ?auto_577039 ) ) ( not ( = ?auto_577030 ?auto_577040 ) ) ( not ( = ?auto_577031 ?auto_577032 ) ) ( not ( = ?auto_577031 ?auto_577033 ) ) ( not ( = ?auto_577031 ?auto_577034 ) ) ( not ( = ?auto_577031 ?auto_577035 ) ) ( not ( = ?auto_577031 ?auto_577036 ) ) ( not ( = ?auto_577031 ?auto_577037 ) ) ( not ( = ?auto_577031 ?auto_577038 ) ) ( not ( = ?auto_577031 ?auto_577039 ) ) ( not ( = ?auto_577031 ?auto_577040 ) ) ( not ( = ?auto_577032 ?auto_577033 ) ) ( not ( = ?auto_577032 ?auto_577034 ) ) ( not ( = ?auto_577032 ?auto_577035 ) ) ( not ( = ?auto_577032 ?auto_577036 ) ) ( not ( = ?auto_577032 ?auto_577037 ) ) ( not ( = ?auto_577032 ?auto_577038 ) ) ( not ( = ?auto_577032 ?auto_577039 ) ) ( not ( = ?auto_577032 ?auto_577040 ) ) ( not ( = ?auto_577033 ?auto_577034 ) ) ( not ( = ?auto_577033 ?auto_577035 ) ) ( not ( = ?auto_577033 ?auto_577036 ) ) ( not ( = ?auto_577033 ?auto_577037 ) ) ( not ( = ?auto_577033 ?auto_577038 ) ) ( not ( = ?auto_577033 ?auto_577039 ) ) ( not ( = ?auto_577033 ?auto_577040 ) ) ( not ( = ?auto_577034 ?auto_577035 ) ) ( not ( = ?auto_577034 ?auto_577036 ) ) ( not ( = ?auto_577034 ?auto_577037 ) ) ( not ( = ?auto_577034 ?auto_577038 ) ) ( not ( = ?auto_577034 ?auto_577039 ) ) ( not ( = ?auto_577034 ?auto_577040 ) ) ( not ( = ?auto_577035 ?auto_577036 ) ) ( not ( = ?auto_577035 ?auto_577037 ) ) ( not ( = ?auto_577035 ?auto_577038 ) ) ( not ( = ?auto_577035 ?auto_577039 ) ) ( not ( = ?auto_577035 ?auto_577040 ) ) ( not ( = ?auto_577036 ?auto_577037 ) ) ( not ( = ?auto_577036 ?auto_577038 ) ) ( not ( = ?auto_577036 ?auto_577039 ) ) ( not ( = ?auto_577036 ?auto_577040 ) ) ( not ( = ?auto_577037 ?auto_577038 ) ) ( not ( = ?auto_577037 ?auto_577039 ) ) ( not ( = ?auto_577037 ?auto_577040 ) ) ( not ( = ?auto_577038 ?auto_577039 ) ) ( not ( = ?auto_577038 ?auto_577040 ) ) ( not ( = ?auto_577039 ?auto_577040 ) ) ( ON ?auto_577039 ?auto_577040 ) ( ON ?auto_577038 ?auto_577039 ) ( CLEAR ?auto_577036 ) ( ON ?auto_577037 ?auto_577038 ) ( CLEAR ?auto_577037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_577025 ?auto_577026 ?auto_577027 ?auto_577028 ?auto_577029 ?auto_577030 ?auto_577031 ?auto_577032 ?auto_577033 ?auto_577034 ?auto_577035 ?auto_577036 ?auto_577037 )
      ( MAKE-16PILE ?auto_577025 ?auto_577026 ?auto_577027 ?auto_577028 ?auto_577029 ?auto_577030 ?auto_577031 ?auto_577032 ?auto_577033 ?auto_577034 ?auto_577035 ?auto_577036 ?auto_577037 ?auto_577038 ?auto_577039 ?auto_577040 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577057 - BLOCK
      ?auto_577058 - BLOCK
      ?auto_577059 - BLOCK
      ?auto_577060 - BLOCK
      ?auto_577061 - BLOCK
      ?auto_577062 - BLOCK
      ?auto_577063 - BLOCK
      ?auto_577064 - BLOCK
      ?auto_577065 - BLOCK
      ?auto_577066 - BLOCK
      ?auto_577067 - BLOCK
      ?auto_577068 - BLOCK
      ?auto_577069 - BLOCK
      ?auto_577070 - BLOCK
      ?auto_577071 - BLOCK
      ?auto_577072 - BLOCK
    )
    :vars
    (
      ?auto_577073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_577072 ?auto_577073 ) ( ON-TABLE ?auto_577057 ) ( ON ?auto_577058 ?auto_577057 ) ( ON ?auto_577059 ?auto_577058 ) ( ON ?auto_577060 ?auto_577059 ) ( ON ?auto_577061 ?auto_577060 ) ( ON ?auto_577062 ?auto_577061 ) ( ON ?auto_577063 ?auto_577062 ) ( ON ?auto_577064 ?auto_577063 ) ( ON ?auto_577065 ?auto_577064 ) ( ON ?auto_577066 ?auto_577065 ) ( ON ?auto_577067 ?auto_577066 ) ( not ( = ?auto_577057 ?auto_577058 ) ) ( not ( = ?auto_577057 ?auto_577059 ) ) ( not ( = ?auto_577057 ?auto_577060 ) ) ( not ( = ?auto_577057 ?auto_577061 ) ) ( not ( = ?auto_577057 ?auto_577062 ) ) ( not ( = ?auto_577057 ?auto_577063 ) ) ( not ( = ?auto_577057 ?auto_577064 ) ) ( not ( = ?auto_577057 ?auto_577065 ) ) ( not ( = ?auto_577057 ?auto_577066 ) ) ( not ( = ?auto_577057 ?auto_577067 ) ) ( not ( = ?auto_577057 ?auto_577068 ) ) ( not ( = ?auto_577057 ?auto_577069 ) ) ( not ( = ?auto_577057 ?auto_577070 ) ) ( not ( = ?auto_577057 ?auto_577071 ) ) ( not ( = ?auto_577057 ?auto_577072 ) ) ( not ( = ?auto_577057 ?auto_577073 ) ) ( not ( = ?auto_577058 ?auto_577059 ) ) ( not ( = ?auto_577058 ?auto_577060 ) ) ( not ( = ?auto_577058 ?auto_577061 ) ) ( not ( = ?auto_577058 ?auto_577062 ) ) ( not ( = ?auto_577058 ?auto_577063 ) ) ( not ( = ?auto_577058 ?auto_577064 ) ) ( not ( = ?auto_577058 ?auto_577065 ) ) ( not ( = ?auto_577058 ?auto_577066 ) ) ( not ( = ?auto_577058 ?auto_577067 ) ) ( not ( = ?auto_577058 ?auto_577068 ) ) ( not ( = ?auto_577058 ?auto_577069 ) ) ( not ( = ?auto_577058 ?auto_577070 ) ) ( not ( = ?auto_577058 ?auto_577071 ) ) ( not ( = ?auto_577058 ?auto_577072 ) ) ( not ( = ?auto_577058 ?auto_577073 ) ) ( not ( = ?auto_577059 ?auto_577060 ) ) ( not ( = ?auto_577059 ?auto_577061 ) ) ( not ( = ?auto_577059 ?auto_577062 ) ) ( not ( = ?auto_577059 ?auto_577063 ) ) ( not ( = ?auto_577059 ?auto_577064 ) ) ( not ( = ?auto_577059 ?auto_577065 ) ) ( not ( = ?auto_577059 ?auto_577066 ) ) ( not ( = ?auto_577059 ?auto_577067 ) ) ( not ( = ?auto_577059 ?auto_577068 ) ) ( not ( = ?auto_577059 ?auto_577069 ) ) ( not ( = ?auto_577059 ?auto_577070 ) ) ( not ( = ?auto_577059 ?auto_577071 ) ) ( not ( = ?auto_577059 ?auto_577072 ) ) ( not ( = ?auto_577059 ?auto_577073 ) ) ( not ( = ?auto_577060 ?auto_577061 ) ) ( not ( = ?auto_577060 ?auto_577062 ) ) ( not ( = ?auto_577060 ?auto_577063 ) ) ( not ( = ?auto_577060 ?auto_577064 ) ) ( not ( = ?auto_577060 ?auto_577065 ) ) ( not ( = ?auto_577060 ?auto_577066 ) ) ( not ( = ?auto_577060 ?auto_577067 ) ) ( not ( = ?auto_577060 ?auto_577068 ) ) ( not ( = ?auto_577060 ?auto_577069 ) ) ( not ( = ?auto_577060 ?auto_577070 ) ) ( not ( = ?auto_577060 ?auto_577071 ) ) ( not ( = ?auto_577060 ?auto_577072 ) ) ( not ( = ?auto_577060 ?auto_577073 ) ) ( not ( = ?auto_577061 ?auto_577062 ) ) ( not ( = ?auto_577061 ?auto_577063 ) ) ( not ( = ?auto_577061 ?auto_577064 ) ) ( not ( = ?auto_577061 ?auto_577065 ) ) ( not ( = ?auto_577061 ?auto_577066 ) ) ( not ( = ?auto_577061 ?auto_577067 ) ) ( not ( = ?auto_577061 ?auto_577068 ) ) ( not ( = ?auto_577061 ?auto_577069 ) ) ( not ( = ?auto_577061 ?auto_577070 ) ) ( not ( = ?auto_577061 ?auto_577071 ) ) ( not ( = ?auto_577061 ?auto_577072 ) ) ( not ( = ?auto_577061 ?auto_577073 ) ) ( not ( = ?auto_577062 ?auto_577063 ) ) ( not ( = ?auto_577062 ?auto_577064 ) ) ( not ( = ?auto_577062 ?auto_577065 ) ) ( not ( = ?auto_577062 ?auto_577066 ) ) ( not ( = ?auto_577062 ?auto_577067 ) ) ( not ( = ?auto_577062 ?auto_577068 ) ) ( not ( = ?auto_577062 ?auto_577069 ) ) ( not ( = ?auto_577062 ?auto_577070 ) ) ( not ( = ?auto_577062 ?auto_577071 ) ) ( not ( = ?auto_577062 ?auto_577072 ) ) ( not ( = ?auto_577062 ?auto_577073 ) ) ( not ( = ?auto_577063 ?auto_577064 ) ) ( not ( = ?auto_577063 ?auto_577065 ) ) ( not ( = ?auto_577063 ?auto_577066 ) ) ( not ( = ?auto_577063 ?auto_577067 ) ) ( not ( = ?auto_577063 ?auto_577068 ) ) ( not ( = ?auto_577063 ?auto_577069 ) ) ( not ( = ?auto_577063 ?auto_577070 ) ) ( not ( = ?auto_577063 ?auto_577071 ) ) ( not ( = ?auto_577063 ?auto_577072 ) ) ( not ( = ?auto_577063 ?auto_577073 ) ) ( not ( = ?auto_577064 ?auto_577065 ) ) ( not ( = ?auto_577064 ?auto_577066 ) ) ( not ( = ?auto_577064 ?auto_577067 ) ) ( not ( = ?auto_577064 ?auto_577068 ) ) ( not ( = ?auto_577064 ?auto_577069 ) ) ( not ( = ?auto_577064 ?auto_577070 ) ) ( not ( = ?auto_577064 ?auto_577071 ) ) ( not ( = ?auto_577064 ?auto_577072 ) ) ( not ( = ?auto_577064 ?auto_577073 ) ) ( not ( = ?auto_577065 ?auto_577066 ) ) ( not ( = ?auto_577065 ?auto_577067 ) ) ( not ( = ?auto_577065 ?auto_577068 ) ) ( not ( = ?auto_577065 ?auto_577069 ) ) ( not ( = ?auto_577065 ?auto_577070 ) ) ( not ( = ?auto_577065 ?auto_577071 ) ) ( not ( = ?auto_577065 ?auto_577072 ) ) ( not ( = ?auto_577065 ?auto_577073 ) ) ( not ( = ?auto_577066 ?auto_577067 ) ) ( not ( = ?auto_577066 ?auto_577068 ) ) ( not ( = ?auto_577066 ?auto_577069 ) ) ( not ( = ?auto_577066 ?auto_577070 ) ) ( not ( = ?auto_577066 ?auto_577071 ) ) ( not ( = ?auto_577066 ?auto_577072 ) ) ( not ( = ?auto_577066 ?auto_577073 ) ) ( not ( = ?auto_577067 ?auto_577068 ) ) ( not ( = ?auto_577067 ?auto_577069 ) ) ( not ( = ?auto_577067 ?auto_577070 ) ) ( not ( = ?auto_577067 ?auto_577071 ) ) ( not ( = ?auto_577067 ?auto_577072 ) ) ( not ( = ?auto_577067 ?auto_577073 ) ) ( not ( = ?auto_577068 ?auto_577069 ) ) ( not ( = ?auto_577068 ?auto_577070 ) ) ( not ( = ?auto_577068 ?auto_577071 ) ) ( not ( = ?auto_577068 ?auto_577072 ) ) ( not ( = ?auto_577068 ?auto_577073 ) ) ( not ( = ?auto_577069 ?auto_577070 ) ) ( not ( = ?auto_577069 ?auto_577071 ) ) ( not ( = ?auto_577069 ?auto_577072 ) ) ( not ( = ?auto_577069 ?auto_577073 ) ) ( not ( = ?auto_577070 ?auto_577071 ) ) ( not ( = ?auto_577070 ?auto_577072 ) ) ( not ( = ?auto_577070 ?auto_577073 ) ) ( not ( = ?auto_577071 ?auto_577072 ) ) ( not ( = ?auto_577071 ?auto_577073 ) ) ( not ( = ?auto_577072 ?auto_577073 ) ) ( ON ?auto_577071 ?auto_577072 ) ( ON ?auto_577070 ?auto_577071 ) ( ON ?auto_577069 ?auto_577070 ) ( CLEAR ?auto_577067 ) ( ON ?auto_577068 ?auto_577069 ) ( CLEAR ?auto_577068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_577057 ?auto_577058 ?auto_577059 ?auto_577060 ?auto_577061 ?auto_577062 ?auto_577063 ?auto_577064 ?auto_577065 ?auto_577066 ?auto_577067 ?auto_577068 )
      ( MAKE-16PILE ?auto_577057 ?auto_577058 ?auto_577059 ?auto_577060 ?auto_577061 ?auto_577062 ?auto_577063 ?auto_577064 ?auto_577065 ?auto_577066 ?auto_577067 ?auto_577068 ?auto_577069 ?auto_577070 ?auto_577071 ?auto_577072 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577090 - BLOCK
      ?auto_577091 - BLOCK
      ?auto_577092 - BLOCK
      ?auto_577093 - BLOCK
      ?auto_577094 - BLOCK
      ?auto_577095 - BLOCK
      ?auto_577096 - BLOCK
      ?auto_577097 - BLOCK
      ?auto_577098 - BLOCK
      ?auto_577099 - BLOCK
      ?auto_577100 - BLOCK
      ?auto_577101 - BLOCK
      ?auto_577102 - BLOCK
      ?auto_577103 - BLOCK
      ?auto_577104 - BLOCK
      ?auto_577105 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_577105 ) ( ON-TABLE ?auto_577090 ) ( ON ?auto_577091 ?auto_577090 ) ( ON ?auto_577092 ?auto_577091 ) ( ON ?auto_577093 ?auto_577092 ) ( ON ?auto_577094 ?auto_577093 ) ( ON ?auto_577095 ?auto_577094 ) ( ON ?auto_577096 ?auto_577095 ) ( ON ?auto_577097 ?auto_577096 ) ( ON ?auto_577098 ?auto_577097 ) ( ON ?auto_577099 ?auto_577098 ) ( ON ?auto_577100 ?auto_577099 ) ( not ( = ?auto_577090 ?auto_577091 ) ) ( not ( = ?auto_577090 ?auto_577092 ) ) ( not ( = ?auto_577090 ?auto_577093 ) ) ( not ( = ?auto_577090 ?auto_577094 ) ) ( not ( = ?auto_577090 ?auto_577095 ) ) ( not ( = ?auto_577090 ?auto_577096 ) ) ( not ( = ?auto_577090 ?auto_577097 ) ) ( not ( = ?auto_577090 ?auto_577098 ) ) ( not ( = ?auto_577090 ?auto_577099 ) ) ( not ( = ?auto_577090 ?auto_577100 ) ) ( not ( = ?auto_577090 ?auto_577101 ) ) ( not ( = ?auto_577090 ?auto_577102 ) ) ( not ( = ?auto_577090 ?auto_577103 ) ) ( not ( = ?auto_577090 ?auto_577104 ) ) ( not ( = ?auto_577090 ?auto_577105 ) ) ( not ( = ?auto_577091 ?auto_577092 ) ) ( not ( = ?auto_577091 ?auto_577093 ) ) ( not ( = ?auto_577091 ?auto_577094 ) ) ( not ( = ?auto_577091 ?auto_577095 ) ) ( not ( = ?auto_577091 ?auto_577096 ) ) ( not ( = ?auto_577091 ?auto_577097 ) ) ( not ( = ?auto_577091 ?auto_577098 ) ) ( not ( = ?auto_577091 ?auto_577099 ) ) ( not ( = ?auto_577091 ?auto_577100 ) ) ( not ( = ?auto_577091 ?auto_577101 ) ) ( not ( = ?auto_577091 ?auto_577102 ) ) ( not ( = ?auto_577091 ?auto_577103 ) ) ( not ( = ?auto_577091 ?auto_577104 ) ) ( not ( = ?auto_577091 ?auto_577105 ) ) ( not ( = ?auto_577092 ?auto_577093 ) ) ( not ( = ?auto_577092 ?auto_577094 ) ) ( not ( = ?auto_577092 ?auto_577095 ) ) ( not ( = ?auto_577092 ?auto_577096 ) ) ( not ( = ?auto_577092 ?auto_577097 ) ) ( not ( = ?auto_577092 ?auto_577098 ) ) ( not ( = ?auto_577092 ?auto_577099 ) ) ( not ( = ?auto_577092 ?auto_577100 ) ) ( not ( = ?auto_577092 ?auto_577101 ) ) ( not ( = ?auto_577092 ?auto_577102 ) ) ( not ( = ?auto_577092 ?auto_577103 ) ) ( not ( = ?auto_577092 ?auto_577104 ) ) ( not ( = ?auto_577092 ?auto_577105 ) ) ( not ( = ?auto_577093 ?auto_577094 ) ) ( not ( = ?auto_577093 ?auto_577095 ) ) ( not ( = ?auto_577093 ?auto_577096 ) ) ( not ( = ?auto_577093 ?auto_577097 ) ) ( not ( = ?auto_577093 ?auto_577098 ) ) ( not ( = ?auto_577093 ?auto_577099 ) ) ( not ( = ?auto_577093 ?auto_577100 ) ) ( not ( = ?auto_577093 ?auto_577101 ) ) ( not ( = ?auto_577093 ?auto_577102 ) ) ( not ( = ?auto_577093 ?auto_577103 ) ) ( not ( = ?auto_577093 ?auto_577104 ) ) ( not ( = ?auto_577093 ?auto_577105 ) ) ( not ( = ?auto_577094 ?auto_577095 ) ) ( not ( = ?auto_577094 ?auto_577096 ) ) ( not ( = ?auto_577094 ?auto_577097 ) ) ( not ( = ?auto_577094 ?auto_577098 ) ) ( not ( = ?auto_577094 ?auto_577099 ) ) ( not ( = ?auto_577094 ?auto_577100 ) ) ( not ( = ?auto_577094 ?auto_577101 ) ) ( not ( = ?auto_577094 ?auto_577102 ) ) ( not ( = ?auto_577094 ?auto_577103 ) ) ( not ( = ?auto_577094 ?auto_577104 ) ) ( not ( = ?auto_577094 ?auto_577105 ) ) ( not ( = ?auto_577095 ?auto_577096 ) ) ( not ( = ?auto_577095 ?auto_577097 ) ) ( not ( = ?auto_577095 ?auto_577098 ) ) ( not ( = ?auto_577095 ?auto_577099 ) ) ( not ( = ?auto_577095 ?auto_577100 ) ) ( not ( = ?auto_577095 ?auto_577101 ) ) ( not ( = ?auto_577095 ?auto_577102 ) ) ( not ( = ?auto_577095 ?auto_577103 ) ) ( not ( = ?auto_577095 ?auto_577104 ) ) ( not ( = ?auto_577095 ?auto_577105 ) ) ( not ( = ?auto_577096 ?auto_577097 ) ) ( not ( = ?auto_577096 ?auto_577098 ) ) ( not ( = ?auto_577096 ?auto_577099 ) ) ( not ( = ?auto_577096 ?auto_577100 ) ) ( not ( = ?auto_577096 ?auto_577101 ) ) ( not ( = ?auto_577096 ?auto_577102 ) ) ( not ( = ?auto_577096 ?auto_577103 ) ) ( not ( = ?auto_577096 ?auto_577104 ) ) ( not ( = ?auto_577096 ?auto_577105 ) ) ( not ( = ?auto_577097 ?auto_577098 ) ) ( not ( = ?auto_577097 ?auto_577099 ) ) ( not ( = ?auto_577097 ?auto_577100 ) ) ( not ( = ?auto_577097 ?auto_577101 ) ) ( not ( = ?auto_577097 ?auto_577102 ) ) ( not ( = ?auto_577097 ?auto_577103 ) ) ( not ( = ?auto_577097 ?auto_577104 ) ) ( not ( = ?auto_577097 ?auto_577105 ) ) ( not ( = ?auto_577098 ?auto_577099 ) ) ( not ( = ?auto_577098 ?auto_577100 ) ) ( not ( = ?auto_577098 ?auto_577101 ) ) ( not ( = ?auto_577098 ?auto_577102 ) ) ( not ( = ?auto_577098 ?auto_577103 ) ) ( not ( = ?auto_577098 ?auto_577104 ) ) ( not ( = ?auto_577098 ?auto_577105 ) ) ( not ( = ?auto_577099 ?auto_577100 ) ) ( not ( = ?auto_577099 ?auto_577101 ) ) ( not ( = ?auto_577099 ?auto_577102 ) ) ( not ( = ?auto_577099 ?auto_577103 ) ) ( not ( = ?auto_577099 ?auto_577104 ) ) ( not ( = ?auto_577099 ?auto_577105 ) ) ( not ( = ?auto_577100 ?auto_577101 ) ) ( not ( = ?auto_577100 ?auto_577102 ) ) ( not ( = ?auto_577100 ?auto_577103 ) ) ( not ( = ?auto_577100 ?auto_577104 ) ) ( not ( = ?auto_577100 ?auto_577105 ) ) ( not ( = ?auto_577101 ?auto_577102 ) ) ( not ( = ?auto_577101 ?auto_577103 ) ) ( not ( = ?auto_577101 ?auto_577104 ) ) ( not ( = ?auto_577101 ?auto_577105 ) ) ( not ( = ?auto_577102 ?auto_577103 ) ) ( not ( = ?auto_577102 ?auto_577104 ) ) ( not ( = ?auto_577102 ?auto_577105 ) ) ( not ( = ?auto_577103 ?auto_577104 ) ) ( not ( = ?auto_577103 ?auto_577105 ) ) ( not ( = ?auto_577104 ?auto_577105 ) ) ( ON ?auto_577104 ?auto_577105 ) ( ON ?auto_577103 ?auto_577104 ) ( ON ?auto_577102 ?auto_577103 ) ( CLEAR ?auto_577100 ) ( ON ?auto_577101 ?auto_577102 ) ( CLEAR ?auto_577101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_577090 ?auto_577091 ?auto_577092 ?auto_577093 ?auto_577094 ?auto_577095 ?auto_577096 ?auto_577097 ?auto_577098 ?auto_577099 ?auto_577100 ?auto_577101 )
      ( MAKE-16PILE ?auto_577090 ?auto_577091 ?auto_577092 ?auto_577093 ?auto_577094 ?auto_577095 ?auto_577096 ?auto_577097 ?auto_577098 ?auto_577099 ?auto_577100 ?auto_577101 ?auto_577102 ?auto_577103 ?auto_577104 ?auto_577105 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577122 - BLOCK
      ?auto_577123 - BLOCK
      ?auto_577124 - BLOCK
      ?auto_577125 - BLOCK
      ?auto_577126 - BLOCK
      ?auto_577127 - BLOCK
      ?auto_577128 - BLOCK
      ?auto_577129 - BLOCK
      ?auto_577130 - BLOCK
      ?auto_577131 - BLOCK
      ?auto_577132 - BLOCK
      ?auto_577133 - BLOCK
      ?auto_577134 - BLOCK
      ?auto_577135 - BLOCK
      ?auto_577136 - BLOCK
      ?auto_577137 - BLOCK
    )
    :vars
    (
      ?auto_577138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_577137 ?auto_577138 ) ( ON-TABLE ?auto_577122 ) ( ON ?auto_577123 ?auto_577122 ) ( ON ?auto_577124 ?auto_577123 ) ( ON ?auto_577125 ?auto_577124 ) ( ON ?auto_577126 ?auto_577125 ) ( ON ?auto_577127 ?auto_577126 ) ( ON ?auto_577128 ?auto_577127 ) ( ON ?auto_577129 ?auto_577128 ) ( ON ?auto_577130 ?auto_577129 ) ( ON ?auto_577131 ?auto_577130 ) ( not ( = ?auto_577122 ?auto_577123 ) ) ( not ( = ?auto_577122 ?auto_577124 ) ) ( not ( = ?auto_577122 ?auto_577125 ) ) ( not ( = ?auto_577122 ?auto_577126 ) ) ( not ( = ?auto_577122 ?auto_577127 ) ) ( not ( = ?auto_577122 ?auto_577128 ) ) ( not ( = ?auto_577122 ?auto_577129 ) ) ( not ( = ?auto_577122 ?auto_577130 ) ) ( not ( = ?auto_577122 ?auto_577131 ) ) ( not ( = ?auto_577122 ?auto_577132 ) ) ( not ( = ?auto_577122 ?auto_577133 ) ) ( not ( = ?auto_577122 ?auto_577134 ) ) ( not ( = ?auto_577122 ?auto_577135 ) ) ( not ( = ?auto_577122 ?auto_577136 ) ) ( not ( = ?auto_577122 ?auto_577137 ) ) ( not ( = ?auto_577122 ?auto_577138 ) ) ( not ( = ?auto_577123 ?auto_577124 ) ) ( not ( = ?auto_577123 ?auto_577125 ) ) ( not ( = ?auto_577123 ?auto_577126 ) ) ( not ( = ?auto_577123 ?auto_577127 ) ) ( not ( = ?auto_577123 ?auto_577128 ) ) ( not ( = ?auto_577123 ?auto_577129 ) ) ( not ( = ?auto_577123 ?auto_577130 ) ) ( not ( = ?auto_577123 ?auto_577131 ) ) ( not ( = ?auto_577123 ?auto_577132 ) ) ( not ( = ?auto_577123 ?auto_577133 ) ) ( not ( = ?auto_577123 ?auto_577134 ) ) ( not ( = ?auto_577123 ?auto_577135 ) ) ( not ( = ?auto_577123 ?auto_577136 ) ) ( not ( = ?auto_577123 ?auto_577137 ) ) ( not ( = ?auto_577123 ?auto_577138 ) ) ( not ( = ?auto_577124 ?auto_577125 ) ) ( not ( = ?auto_577124 ?auto_577126 ) ) ( not ( = ?auto_577124 ?auto_577127 ) ) ( not ( = ?auto_577124 ?auto_577128 ) ) ( not ( = ?auto_577124 ?auto_577129 ) ) ( not ( = ?auto_577124 ?auto_577130 ) ) ( not ( = ?auto_577124 ?auto_577131 ) ) ( not ( = ?auto_577124 ?auto_577132 ) ) ( not ( = ?auto_577124 ?auto_577133 ) ) ( not ( = ?auto_577124 ?auto_577134 ) ) ( not ( = ?auto_577124 ?auto_577135 ) ) ( not ( = ?auto_577124 ?auto_577136 ) ) ( not ( = ?auto_577124 ?auto_577137 ) ) ( not ( = ?auto_577124 ?auto_577138 ) ) ( not ( = ?auto_577125 ?auto_577126 ) ) ( not ( = ?auto_577125 ?auto_577127 ) ) ( not ( = ?auto_577125 ?auto_577128 ) ) ( not ( = ?auto_577125 ?auto_577129 ) ) ( not ( = ?auto_577125 ?auto_577130 ) ) ( not ( = ?auto_577125 ?auto_577131 ) ) ( not ( = ?auto_577125 ?auto_577132 ) ) ( not ( = ?auto_577125 ?auto_577133 ) ) ( not ( = ?auto_577125 ?auto_577134 ) ) ( not ( = ?auto_577125 ?auto_577135 ) ) ( not ( = ?auto_577125 ?auto_577136 ) ) ( not ( = ?auto_577125 ?auto_577137 ) ) ( not ( = ?auto_577125 ?auto_577138 ) ) ( not ( = ?auto_577126 ?auto_577127 ) ) ( not ( = ?auto_577126 ?auto_577128 ) ) ( not ( = ?auto_577126 ?auto_577129 ) ) ( not ( = ?auto_577126 ?auto_577130 ) ) ( not ( = ?auto_577126 ?auto_577131 ) ) ( not ( = ?auto_577126 ?auto_577132 ) ) ( not ( = ?auto_577126 ?auto_577133 ) ) ( not ( = ?auto_577126 ?auto_577134 ) ) ( not ( = ?auto_577126 ?auto_577135 ) ) ( not ( = ?auto_577126 ?auto_577136 ) ) ( not ( = ?auto_577126 ?auto_577137 ) ) ( not ( = ?auto_577126 ?auto_577138 ) ) ( not ( = ?auto_577127 ?auto_577128 ) ) ( not ( = ?auto_577127 ?auto_577129 ) ) ( not ( = ?auto_577127 ?auto_577130 ) ) ( not ( = ?auto_577127 ?auto_577131 ) ) ( not ( = ?auto_577127 ?auto_577132 ) ) ( not ( = ?auto_577127 ?auto_577133 ) ) ( not ( = ?auto_577127 ?auto_577134 ) ) ( not ( = ?auto_577127 ?auto_577135 ) ) ( not ( = ?auto_577127 ?auto_577136 ) ) ( not ( = ?auto_577127 ?auto_577137 ) ) ( not ( = ?auto_577127 ?auto_577138 ) ) ( not ( = ?auto_577128 ?auto_577129 ) ) ( not ( = ?auto_577128 ?auto_577130 ) ) ( not ( = ?auto_577128 ?auto_577131 ) ) ( not ( = ?auto_577128 ?auto_577132 ) ) ( not ( = ?auto_577128 ?auto_577133 ) ) ( not ( = ?auto_577128 ?auto_577134 ) ) ( not ( = ?auto_577128 ?auto_577135 ) ) ( not ( = ?auto_577128 ?auto_577136 ) ) ( not ( = ?auto_577128 ?auto_577137 ) ) ( not ( = ?auto_577128 ?auto_577138 ) ) ( not ( = ?auto_577129 ?auto_577130 ) ) ( not ( = ?auto_577129 ?auto_577131 ) ) ( not ( = ?auto_577129 ?auto_577132 ) ) ( not ( = ?auto_577129 ?auto_577133 ) ) ( not ( = ?auto_577129 ?auto_577134 ) ) ( not ( = ?auto_577129 ?auto_577135 ) ) ( not ( = ?auto_577129 ?auto_577136 ) ) ( not ( = ?auto_577129 ?auto_577137 ) ) ( not ( = ?auto_577129 ?auto_577138 ) ) ( not ( = ?auto_577130 ?auto_577131 ) ) ( not ( = ?auto_577130 ?auto_577132 ) ) ( not ( = ?auto_577130 ?auto_577133 ) ) ( not ( = ?auto_577130 ?auto_577134 ) ) ( not ( = ?auto_577130 ?auto_577135 ) ) ( not ( = ?auto_577130 ?auto_577136 ) ) ( not ( = ?auto_577130 ?auto_577137 ) ) ( not ( = ?auto_577130 ?auto_577138 ) ) ( not ( = ?auto_577131 ?auto_577132 ) ) ( not ( = ?auto_577131 ?auto_577133 ) ) ( not ( = ?auto_577131 ?auto_577134 ) ) ( not ( = ?auto_577131 ?auto_577135 ) ) ( not ( = ?auto_577131 ?auto_577136 ) ) ( not ( = ?auto_577131 ?auto_577137 ) ) ( not ( = ?auto_577131 ?auto_577138 ) ) ( not ( = ?auto_577132 ?auto_577133 ) ) ( not ( = ?auto_577132 ?auto_577134 ) ) ( not ( = ?auto_577132 ?auto_577135 ) ) ( not ( = ?auto_577132 ?auto_577136 ) ) ( not ( = ?auto_577132 ?auto_577137 ) ) ( not ( = ?auto_577132 ?auto_577138 ) ) ( not ( = ?auto_577133 ?auto_577134 ) ) ( not ( = ?auto_577133 ?auto_577135 ) ) ( not ( = ?auto_577133 ?auto_577136 ) ) ( not ( = ?auto_577133 ?auto_577137 ) ) ( not ( = ?auto_577133 ?auto_577138 ) ) ( not ( = ?auto_577134 ?auto_577135 ) ) ( not ( = ?auto_577134 ?auto_577136 ) ) ( not ( = ?auto_577134 ?auto_577137 ) ) ( not ( = ?auto_577134 ?auto_577138 ) ) ( not ( = ?auto_577135 ?auto_577136 ) ) ( not ( = ?auto_577135 ?auto_577137 ) ) ( not ( = ?auto_577135 ?auto_577138 ) ) ( not ( = ?auto_577136 ?auto_577137 ) ) ( not ( = ?auto_577136 ?auto_577138 ) ) ( not ( = ?auto_577137 ?auto_577138 ) ) ( ON ?auto_577136 ?auto_577137 ) ( ON ?auto_577135 ?auto_577136 ) ( ON ?auto_577134 ?auto_577135 ) ( ON ?auto_577133 ?auto_577134 ) ( CLEAR ?auto_577131 ) ( ON ?auto_577132 ?auto_577133 ) ( CLEAR ?auto_577132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_577122 ?auto_577123 ?auto_577124 ?auto_577125 ?auto_577126 ?auto_577127 ?auto_577128 ?auto_577129 ?auto_577130 ?auto_577131 ?auto_577132 )
      ( MAKE-16PILE ?auto_577122 ?auto_577123 ?auto_577124 ?auto_577125 ?auto_577126 ?auto_577127 ?auto_577128 ?auto_577129 ?auto_577130 ?auto_577131 ?auto_577132 ?auto_577133 ?auto_577134 ?auto_577135 ?auto_577136 ?auto_577137 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577155 - BLOCK
      ?auto_577156 - BLOCK
      ?auto_577157 - BLOCK
      ?auto_577158 - BLOCK
      ?auto_577159 - BLOCK
      ?auto_577160 - BLOCK
      ?auto_577161 - BLOCK
      ?auto_577162 - BLOCK
      ?auto_577163 - BLOCK
      ?auto_577164 - BLOCK
      ?auto_577165 - BLOCK
      ?auto_577166 - BLOCK
      ?auto_577167 - BLOCK
      ?auto_577168 - BLOCK
      ?auto_577169 - BLOCK
      ?auto_577170 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_577170 ) ( ON-TABLE ?auto_577155 ) ( ON ?auto_577156 ?auto_577155 ) ( ON ?auto_577157 ?auto_577156 ) ( ON ?auto_577158 ?auto_577157 ) ( ON ?auto_577159 ?auto_577158 ) ( ON ?auto_577160 ?auto_577159 ) ( ON ?auto_577161 ?auto_577160 ) ( ON ?auto_577162 ?auto_577161 ) ( ON ?auto_577163 ?auto_577162 ) ( ON ?auto_577164 ?auto_577163 ) ( not ( = ?auto_577155 ?auto_577156 ) ) ( not ( = ?auto_577155 ?auto_577157 ) ) ( not ( = ?auto_577155 ?auto_577158 ) ) ( not ( = ?auto_577155 ?auto_577159 ) ) ( not ( = ?auto_577155 ?auto_577160 ) ) ( not ( = ?auto_577155 ?auto_577161 ) ) ( not ( = ?auto_577155 ?auto_577162 ) ) ( not ( = ?auto_577155 ?auto_577163 ) ) ( not ( = ?auto_577155 ?auto_577164 ) ) ( not ( = ?auto_577155 ?auto_577165 ) ) ( not ( = ?auto_577155 ?auto_577166 ) ) ( not ( = ?auto_577155 ?auto_577167 ) ) ( not ( = ?auto_577155 ?auto_577168 ) ) ( not ( = ?auto_577155 ?auto_577169 ) ) ( not ( = ?auto_577155 ?auto_577170 ) ) ( not ( = ?auto_577156 ?auto_577157 ) ) ( not ( = ?auto_577156 ?auto_577158 ) ) ( not ( = ?auto_577156 ?auto_577159 ) ) ( not ( = ?auto_577156 ?auto_577160 ) ) ( not ( = ?auto_577156 ?auto_577161 ) ) ( not ( = ?auto_577156 ?auto_577162 ) ) ( not ( = ?auto_577156 ?auto_577163 ) ) ( not ( = ?auto_577156 ?auto_577164 ) ) ( not ( = ?auto_577156 ?auto_577165 ) ) ( not ( = ?auto_577156 ?auto_577166 ) ) ( not ( = ?auto_577156 ?auto_577167 ) ) ( not ( = ?auto_577156 ?auto_577168 ) ) ( not ( = ?auto_577156 ?auto_577169 ) ) ( not ( = ?auto_577156 ?auto_577170 ) ) ( not ( = ?auto_577157 ?auto_577158 ) ) ( not ( = ?auto_577157 ?auto_577159 ) ) ( not ( = ?auto_577157 ?auto_577160 ) ) ( not ( = ?auto_577157 ?auto_577161 ) ) ( not ( = ?auto_577157 ?auto_577162 ) ) ( not ( = ?auto_577157 ?auto_577163 ) ) ( not ( = ?auto_577157 ?auto_577164 ) ) ( not ( = ?auto_577157 ?auto_577165 ) ) ( not ( = ?auto_577157 ?auto_577166 ) ) ( not ( = ?auto_577157 ?auto_577167 ) ) ( not ( = ?auto_577157 ?auto_577168 ) ) ( not ( = ?auto_577157 ?auto_577169 ) ) ( not ( = ?auto_577157 ?auto_577170 ) ) ( not ( = ?auto_577158 ?auto_577159 ) ) ( not ( = ?auto_577158 ?auto_577160 ) ) ( not ( = ?auto_577158 ?auto_577161 ) ) ( not ( = ?auto_577158 ?auto_577162 ) ) ( not ( = ?auto_577158 ?auto_577163 ) ) ( not ( = ?auto_577158 ?auto_577164 ) ) ( not ( = ?auto_577158 ?auto_577165 ) ) ( not ( = ?auto_577158 ?auto_577166 ) ) ( not ( = ?auto_577158 ?auto_577167 ) ) ( not ( = ?auto_577158 ?auto_577168 ) ) ( not ( = ?auto_577158 ?auto_577169 ) ) ( not ( = ?auto_577158 ?auto_577170 ) ) ( not ( = ?auto_577159 ?auto_577160 ) ) ( not ( = ?auto_577159 ?auto_577161 ) ) ( not ( = ?auto_577159 ?auto_577162 ) ) ( not ( = ?auto_577159 ?auto_577163 ) ) ( not ( = ?auto_577159 ?auto_577164 ) ) ( not ( = ?auto_577159 ?auto_577165 ) ) ( not ( = ?auto_577159 ?auto_577166 ) ) ( not ( = ?auto_577159 ?auto_577167 ) ) ( not ( = ?auto_577159 ?auto_577168 ) ) ( not ( = ?auto_577159 ?auto_577169 ) ) ( not ( = ?auto_577159 ?auto_577170 ) ) ( not ( = ?auto_577160 ?auto_577161 ) ) ( not ( = ?auto_577160 ?auto_577162 ) ) ( not ( = ?auto_577160 ?auto_577163 ) ) ( not ( = ?auto_577160 ?auto_577164 ) ) ( not ( = ?auto_577160 ?auto_577165 ) ) ( not ( = ?auto_577160 ?auto_577166 ) ) ( not ( = ?auto_577160 ?auto_577167 ) ) ( not ( = ?auto_577160 ?auto_577168 ) ) ( not ( = ?auto_577160 ?auto_577169 ) ) ( not ( = ?auto_577160 ?auto_577170 ) ) ( not ( = ?auto_577161 ?auto_577162 ) ) ( not ( = ?auto_577161 ?auto_577163 ) ) ( not ( = ?auto_577161 ?auto_577164 ) ) ( not ( = ?auto_577161 ?auto_577165 ) ) ( not ( = ?auto_577161 ?auto_577166 ) ) ( not ( = ?auto_577161 ?auto_577167 ) ) ( not ( = ?auto_577161 ?auto_577168 ) ) ( not ( = ?auto_577161 ?auto_577169 ) ) ( not ( = ?auto_577161 ?auto_577170 ) ) ( not ( = ?auto_577162 ?auto_577163 ) ) ( not ( = ?auto_577162 ?auto_577164 ) ) ( not ( = ?auto_577162 ?auto_577165 ) ) ( not ( = ?auto_577162 ?auto_577166 ) ) ( not ( = ?auto_577162 ?auto_577167 ) ) ( not ( = ?auto_577162 ?auto_577168 ) ) ( not ( = ?auto_577162 ?auto_577169 ) ) ( not ( = ?auto_577162 ?auto_577170 ) ) ( not ( = ?auto_577163 ?auto_577164 ) ) ( not ( = ?auto_577163 ?auto_577165 ) ) ( not ( = ?auto_577163 ?auto_577166 ) ) ( not ( = ?auto_577163 ?auto_577167 ) ) ( not ( = ?auto_577163 ?auto_577168 ) ) ( not ( = ?auto_577163 ?auto_577169 ) ) ( not ( = ?auto_577163 ?auto_577170 ) ) ( not ( = ?auto_577164 ?auto_577165 ) ) ( not ( = ?auto_577164 ?auto_577166 ) ) ( not ( = ?auto_577164 ?auto_577167 ) ) ( not ( = ?auto_577164 ?auto_577168 ) ) ( not ( = ?auto_577164 ?auto_577169 ) ) ( not ( = ?auto_577164 ?auto_577170 ) ) ( not ( = ?auto_577165 ?auto_577166 ) ) ( not ( = ?auto_577165 ?auto_577167 ) ) ( not ( = ?auto_577165 ?auto_577168 ) ) ( not ( = ?auto_577165 ?auto_577169 ) ) ( not ( = ?auto_577165 ?auto_577170 ) ) ( not ( = ?auto_577166 ?auto_577167 ) ) ( not ( = ?auto_577166 ?auto_577168 ) ) ( not ( = ?auto_577166 ?auto_577169 ) ) ( not ( = ?auto_577166 ?auto_577170 ) ) ( not ( = ?auto_577167 ?auto_577168 ) ) ( not ( = ?auto_577167 ?auto_577169 ) ) ( not ( = ?auto_577167 ?auto_577170 ) ) ( not ( = ?auto_577168 ?auto_577169 ) ) ( not ( = ?auto_577168 ?auto_577170 ) ) ( not ( = ?auto_577169 ?auto_577170 ) ) ( ON ?auto_577169 ?auto_577170 ) ( ON ?auto_577168 ?auto_577169 ) ( ON ?auto_577167 ?auto_577168 ) ( ON ?auto_577166 ?auto_577167 ) ( CLEAR ?auto_577164 ) ( ON ?auto_577165 ?auto_577166 ) ( CLEAR ?auto_577165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_577155 ?auto_577156 ?auto_577157 ?auto_577158 ?auto_577159 ?auto_577160 ?auto_577161 ?auto_577162 ?auto_577163 ?auto_577164 ?auto_577165 )
      ( MAKE-16PILE ?auto_577155 ?auto_577156 ?auto_577157 ?auto_577158 ?auto_577159 ?auto_577160 ?auto_577161 ?auto_577162 ?auto_577163 ?auto_577164 ?auto_577165 ?auto_577166 ?auto_577167 ?auto_577168 ?auto_577169 ?auto_577170 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577187 - BLOCK
      ?auto_577188 - BLOCK
      ?auto_577189 - BLOCK
      ?auto_577190 - BLOCK
      ?auto_577191 - BLOCK
      ?auto_577192 - BLOCK
      ?auto_577193 - BLOCK
      ?auto_577194 - BLOCK
      ?auto_577195 - BLOCK
      ?auto_577196 - BLOCK
      ?auto_577197 - BLOCK
      ?auto_577198 - BLOCK
      ?auto_577199 - BLOCK
      ?auto_577200 - BLOCK
      ?auto_577201 - BLOCK
      ?auto_577202 - BLOCK
    )
    :vars
    (
      ?auto_577203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_577202 ?auto_577203 ) ( ON-TABLE ?auto_577187 ) ( ON ?auto_577188 ?auto_577187 ) ( ON ?auto_577189 ?auto_577188 ) ( ON ?auto_577190 ?auto_577189 ) ( ON ?auto_577191 ?auto_577190 ) ( ON ?auto_577192 ?auto_577191 ) ( ON ?auto_577193 ?auto_577192 ) ( ON ?auto_577194 ?auto_577193 ) ( ON ?auto_577195 ?auto_577194 ) ( not ( = ?auto_577187 ?auto_577188 ) ) ( not ( = ?auto_577187 ?auto_577189 ) ) ( not ( = ?auto_577187 ?auto_577190 ) ) ( not ( = ?auto_577187 ?auto_577191 ) ) ( not ( = ?auto_577187 ?auto_577192 ) ) ( not ( = ?auto_577187 ?auto_577193 ) ) ( not ( = ?auto_577187 ?auto_577194 ) ) ( not ( = ?auto_577187 ?auto_577195 ) ) ( not ( = ?auto_577187 ?auto_577196 ) ) ( not ( = ?auto_577187 ?auto_577197 ) ) ( not ( = ?auto_577187 ?auto_577198 ) ) ( not ( = ?auto_577187 ?auto_577199 ) ) ( not ( = ?auto_577187 ?auto_577200 ) ) ( not ( = ?auto_577187 ?auto_577201 ) ) ( not ( = ?auto_577187 ?auto_577202 ) ) ( not ( = ?auto_577187 ?auto_577203 ) ) ( not ( = ?auto_577188 ?auto_577189 ) ) ( not ( = ?auto_577188 ?auto_577190 ) ) ( not ( = ?auto_577188 ?auto_577191 ) ) ( not ( = ?auto_577188 ?auto_577192 ) ) ( not ( = ?auto_577188 ?auto_577193 ) ) ( not ( = ?auto_577188 ?auto_577194 ) ) ( not ( = ?auto_577188 ?auto_577195 ) ) ( not ( = ?auto_577188 ?auto_577196 ) ) ( not ( = ?auto_577188 ?auto_577197 ) ) ( not ( = ?auto_577188 ?auto_577198 ) ) ( not ( = ?auto_577188 ?auto_577199 ) ) ( not ( = ?auto_577188 ?auto_577200 ) ) ( not ( = ?auto_577188 ?auto_577201 ) ) ( not ( = ?auto_577188 ?auto_577202 ) ) ( not ( = ?auto_577188 ?auto_577203 ) ) ( not ( = ?auto_577189 ?auto_577190 ) ) ( not ( = ?auto_577189 ?auto_577191 ) ) ( not ( = ?auto_577189 ?auto_577192 ) ) ( not ( = ?auto_577189 ?auto_577193 ) ) ( not ( = ?auto_577189 ?auto_577194 ) ) ( not ( = ?auto_577189 ?auto_577195 ) ) ( not ( = ?auto_577189 ?auto_577196 ) ) ( not ( = ?auto_577189 ?auto_577197 ) ) ( not ( = ?auto_577189 ?auto_577198 ) ) ( not ( = ?auto_577189 ?auto_577199 ) ) ( not ( = ?auto_577189 ?auto_577200 ) ) ( not ( = ?auto_577189 ?auto_577201 ) ) ( not ( = ?auto_577189 ?auto_577202 ) ) ( not ( = ?auto_577189 ?auto_577203 ) ) ( not ( = ?auto_577190 ?auto_577191 ) ) ( not ( = ?auto_577190 ?auto_577192 ) ) ( not ( = ?auto_577190 ?auto_577193 ) ) ( not ( = ?auto_577190 ?auto_577194 ) ) ( not ( = ?auto_577190 ?auto_577195 ) ) ( not ( = ?auto_577190 ?auto_577196 ) ) ( not ( = ?auto_577190 ?auto_577197 ) ) ( not ( = ?auto_577190 ?auto_577198 ) ) ( not ( = ?auto_577190 ?auto_577199 ) ) ( not ( = ?auto_577190 ?auto_577200 ) ) ( not ( = ?auto_577190 ?auto_577201 ) ) ( not ( = ?auto_577190 ?auto_577202 ) ) ( not ( = ?auto_577190 ?auto_577203 ) ) ( not ( = ?auto_577191 ?auto_577192 ) ) ( not ( = ?auto_577191 ?auto_577193 ) ) ( not ( = ?auto_577191 ?auto_577194 ) ) ( not ( = ?auto_577191 ?auto_577195 ) ) ( not ( = ?auto_577191 ?auto_577196 ) ) ( not ( = ?auto_577191 ?auto_577197 ) ) ( not ( = ?auto_577191 ?auto_577198 ) ) ( not ( = ?auto_577191 ?auto_577199 ) ) ( not ( = ?auto_577191 ?auto_577200 ) ) ( not ( = ?auto_577191 ?auto_577201 ) ) ( not ( = ?auto_577191 ?auto_577202 ) ) ( not ( = ?auto_577191 ?auto_577203 ) ) ( not ( = ?auto_577192 ?auto_577193 ) ) ( not ( = ?auto_577192 ?auto_577194 ) ) ( not ( = ?auto_577192 ?auto_577195 ) ) ( not ( = ?auto_577192 ?auto_577196 ) ) ( not ( = ?auto_577192 ?auto_577197 ) ) ( not ( = ?auto_577192 ?auto_577198 ) ) ( not ( = ?auto_577192 ?auto_577199 ) ) ( not ( = ?auto_577192 ?auto_577200 ) ) ( not ( = ?auto_577192 ?auto_577201 ) ) ( not ( = ?auto_577192 ?auto_577202 ) ) ( not ( = ?auto_577192 ?auto_577203 ) ) ( not ( = ?auto_577193 ?auto_577194 ) ) ( not ( = ?auto_577193 ?auto_577195 ) ) ( not ( = ?auto_577193 ?auto_577196 ) ) ( not ( = ?auto_577193 ?auto_577197 ) ) ( not ( = ?auto_577193 ?auto_577198 ) ) ( not ( = ?auto_577193 ?auto_577199 ) ) ( not ( = ?auto_577193 ?auto_577200 ) ) ( not ( = ?auto_577193 ?auto_577201 ) ) ( not ( = ?auto_577193 ?auto_577202 ) ) ( not ( = ?auto_577193 ?auto_577203 ) ) ( not ( = ?auto_577194 ?auto_577195 ) ) ( not ( = ?auto_577194 ?auto_577196 ) ) ( not ( = ?auto_577194 ?auto_577197 ) ) ( not ( = ?auto_577194 ?auto_577198 ) ) ( not ( = ?auto_577194 ?auto_577199 ) ) ( not ( = ?auto_577194 ?auto_577200 ) ) ( not ( = ?auto_577194 ?auto_577201 ) ) ( not ( = ?auto_577194 ?auto_577202 ) ) ( not ( = ?auto_577194 ?auto_577203 ) ) ( not ( = ?auto_577195 ?auto_577196 ) ) ( not ( = ?auto_577195 ?auto_577197 ) ) ( not ( = ?auto_577195 ?auto_577198 ) ) ( not ( = ?auto_577195 ?auto_577199 ) ) ( not ( = ?auto_577195 ?auto_577200 ) ) ( not ( = ?auto_577195 ?auto_577201 ) ) ( not ( = ?auto_577195 ?auto_577202 ) ) ( not ( = ?auto_577195 ?auto_577203 ) ) ( not ( = ?auto_577196 ?auto_577197 ) ) ( not ( = ?auto_577196 ?auto_577198 ) ) ( not ( = ?auto_577196 ?auto_577199 ) ) ( not ( = ?auto_577196 ?auto_577200 ) ) ( not ( = ?auto_577196 ?auto_577201 ) ) ( not ( = ?auto_577196 ?auto_577202 ) ) ( not ( = ?auto_577196 ?auto_577203 ) ) ( not ( = ?auto_577197 ?auto_577198 ) ) ( not ( = ?auto_577197 ?auto_577199 ) ) ( not ( = ?auto_577197 ?auto_577200 ) ) ( not ( = ?auto_577197 ?auto_577201 ) ) ( not ( = ?auto_577197 ?auto_577202 ) ) ( not ( = ?auto_577197 ?auto_577203 ) ) ( not ( = ?auto_577198 ?auto_577199 ) ) ( not ( = ?auto_577198 ?auto_577200 ) ) ( not ( = ?auto_577198 ?auto_577201 ) ) ( not ( = ?auto_577198 ?auto_577202 ) ) ( not ( = ?auto_577198 ?auto_577203 ) ) ( not ( = ?auto_577199 ?auto_577200 ) ) ( not ( = ?auto_577199 ?auto_577201 ) ) ( not ( = ?auto_577199 ?auto_577202 ) ) ( not ( = ?auto_577199 ?auto_577203 ) ) ( not ( = ?auto_577200 ?auto_577201 ) ) ( not ( = ?auto_577200 ?auto_577202 ) ) ( not ( = ?auto_577200 ?auto_577203 ) ) ( not ( = ?auto_577201 ?auto_577202 ) ) ( not ( = ?auto_577201 ?auto_577203 ) ) ( not ( = ?auto_577202 ?auto_577203 ) ) ( ON ?auto_577201 ?auto_577202 ) ( ON ?auto_577200 ?auto_577201 ) ( ON ?auto_577199 ?auto_577200 ) ( ON ?auto_577198 ?auto_577199 ) ( ON ?auto_577197 ?auto_577198 ) ( CLEAR ?auto_577195 ) ( ON ?auto_577196 ?auto_577197 ) ( CLEAR ?auto_577196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_577187 ?auto_577188 ?auto_577189 ?auto_577190 ?auto_577191 ?auto_577192 ?auto_577193 ?auto_577194 ?auto_577195 ?auto_577196 )
      ( MAKE-16PILE ?auto_577187 ?auto_577188 ?auto_577189 ?auto_577190 ?auto_577191 ?auto_577192 ?auto_577193 ?auto_577194 ?auto_577195 ?auto_577196 ?auto_577197 ?auto_577198 ?auto_577199 ?auto_577200 ?auto_577201 ?auto_577202 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577220 - BLOCK
      ?auto_577221 - BLOCK
      ?auto_577222 - BLOCK
      ?auto_577223 - BLOCK
      ?auto_577224 - BLOCK
      ?auto_577225 - BLOCK
      ?auto_577226 - BLOCK
      ?auto_577227 - BLOCK
      ?auto_577228 - BLOCK
      ?auto_577229 - BLOCK
      ?auto_577230 - BLOCK
      ?auto_577231 - BLOCK
      ?auto_577232 - BLOCK
      ?auto_577233 - BLOCK
      ?auto_577234 - BLOCK
      ?auto_577235 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_577235 ) ( ON-TABLE ?auto_577220 ) ( ON ?auto_577221 ?auto_577220 ) ( ON ?auto_577222 ?auto_577221 ) ( ON ?auto_577223 ?auto_577222 ) ( ON ?auto_577224 ?auto_577223 ) ( ON ?auto_577225 ?auto_577224 ) ( ON ?auto_577226 ?auto_577225 ) ( ON ?auto_577227 ?auto_577226 ) ( ON ?auto_577228 ?auto_577227 ) ( not ( = ?auto_577220 ?auto_577221 ) ) ( not ( = ?auto_577220 ?auto_577222 ) ) ( not ( = ?auto_577220 ?auto_577223 ) ) ( not ( = ?auto_577220 ?auto_577224 ) ) ( not ( = ?auto_577220 ?auto_577225 ) ) ( not ( = ?auto_577220 ?auto_577226 ) ) ( not ( = ?auto_577220 ?auto_577227 ) ) ( not ( = ?auto_577220 ?auto_577228 ) ) ( not ( = ?auto_577220 ?auto_577229 ) ) ( not ( = ?auto_577220 ?auto_577230 ) ) ( not ( = ?auto_577220 ?auto_577231 ) ) ( not ( = ?auto_577220 ?auto_577232 ) ) ( not ( = ?auto_577220 ?auto_577233 ) ) ( not ( = ?auto_577220 ?auto_577234 ) ) ( not ( = ?auto_577220 ?auto_577235 ) ) ( not ( = ?auto_577221 ?auto_577222 ) ) ( not ( = ?auto_577221 ?auto_577223 ) ) ( not ( = ?auto_577221 ?auto_577224 ) ) ( not ( = ?auto_577221 ?auto_577225 ) ) ( not ( = ?auto_577221 ?auto_577226 ) ) ( not ( = ?auto_577221 ?auto_577227 ) ) ( not ( = ?auto_577221 ?auto_577228 ) ) ( not ( = ?auto_577221 ?auto_577229 ) ) ( not ( = ?auto_577221 ?auto_577230 ) ) ( not ( = ?auto_577221 ?auto_577231 ) ) ( not ( = ?auto_577221 ?auto_577232 ) ) ( not ( = ?auto_577221 ?auto_577233 ) ) ( not ( = ?auto_577221 ?auto_577234 ) ) ( not ( = ?auto_577221 ?auto_577235 ) ) ( not ( = ?auto_577222 ?auto_577223 ) ) ( not ( = ?auto_577222 ?auto_577224 ) ) ( not ( = ?auto_577222 ?auto_577225 ) ) ( not ( = ?auto_577222 ?auto_577226 ) ) ( not ( = ?auto_577222 ?auto_577227 ) ) ( not ( = ?auto_577222 ?auto_577228 ) ) ( not ( = ?auto_577222 ?auto_577229 ) ) ( not ( = ?auto_577222 ?auto_577230 ) ) ( not ( = ?auto_577222 ?auto_577231 ) ) ( not ( = ?auto_577222 ?auto_577232 ) ) ( not ( = ?auto_577222 ?auto_577233 ) ) ( not ( = ?auto_577222 ?auto_577234 ) ) ( not ( = ?auto_577222 ?auto_577235 ) ) ( not ( = ?auto_577223 ?auto_577224 ) ) ( not ( = ?auto_577223 ?auto_577225 ) ) ( not ( = ?auto_577223 ?auto_577226 ) ) ( not ( = ?auto_577223 ?auto_577227 ) ) ( not ( = ?auto_577223 ?auto_577228 ) ) ( not ( = ?auto_577223 ?auto_577229 ) ) ( not ( = ?auto_577223 ?auto_577230 ) ) ( not ( = ?auto_577223 ?auto_577231 ) ) ( not ( = ?auto_577223 ?auto_577232 ) ) ( not ( = ?auto_577223 ?auto_577233 ) ) ( not ( = ?auto_577223 ?auto_577234 ) ) ( not ( = ?auto_577223 ?auto_577235 ) ) ( not ( = ?auto_577224 ?auto_577225 ) ) ( not ( = ?auto_577224 ?auto_577226 ) ) ( not ( = ?auto_577224 ?auto_577227 ) ) ( not ( = ?auto_577224 ?auto_577228 ) ) ( not ( = ?auto_577224 ?auto_577229 ) ) ( not ( = ?auto_577224 ?auto_577230 ) ) ( not ( = ?auto_577224 ?auto_577231 ) ) ( not ( = ?auto_577224 ?auto_577232 ) ) ( not ( = ?auto_577224 ?auto_577233 ) ) ( not ( = ?auto_577224 ?auto_577234 ) ) ( not ( = ?auto_577224 ?auto_577235 ) ) ( not ( = ?auto_577225 ?auto_577226 ) ) ( not ( = ?auto_577225 ?auto_577227 ) ) ( not ( = ?auto_577225 ?auto_577228 ) ) ( not ( = ?auto_577225 ?auto_577229 ) ) ( not ( = ?auto_577225 ?auto_577230 ) ) ( not ( = ?auto_577225 ?auto_577231 ) ) ( not ( = ?auto_577225 ?auto_577232 ) ) ( not ( = ?auto_577225 ?auto_577233 ) ) ( not ( = ?auto_577225 ?auto_577234 ) ) ( not ( = ?auto_577225 ?auto_577235 ) ) ( not ( = ?auto_577226 ?auto_577227 ) ) ( not ( = ?auto_577226 ?auto_577228 ) ) ( not ( = ?auto_577226 ?auto_577229 ) ) ( not ( = ?auto_577226 ?auto_577230 ) ) ( not ( = ?auto_577226 ?auto_577231 ) ) ( not ( = ?auto_577226 ?auto_577232 ) ) ( not ( = ?auto_577226 ?auto_577233 ) ) ( not ( = ?auto_577226 ?auto_577234 ) ) ( not ( = ?auto_577226 ?auto_577235 ) ) ( not ( = ?auto_577227 ?auto_577228 ) ) ( not ( = ?auto_577227 ?auto_577229 ) ) ( not ( = ?auto_577227 ?auto_577230 ) ) ( not ( = ?auto_577227 ?auto_577231 ) ) ( not ( = ?auto_577227 ?auto_577232 ) ) ( not ( = ?auto_577227 ?auto_577233 ) ) ( not ( = ?auto_577227 ?auto_577234 ) ) ( not ( = ?auto_577227 ?auto_577235 ) ) ( not ( = ?auto_577228 ?auto_577229 ) ) ( not ( = ?auto_577228 ?auto_577230 ) ) ( not ( = ?auto_577228 ?auto_577231 ) ) ( not ( = ?auto_577228 ?auto_577232 ) ) ( not ( = ?auto_577228 ?auto_577233 ) ) ( not ( = ?auto_577228 ?auto_577234 ) ) ( not ( = ?auto_577228 ?auto_577235 ) ) ( not ( = ?auto_577229 ?auto_577230 ) ) ( not ( = ?auto_577229 ?auto_577231 ) ) ( not ( = ?auto_577229 ?auto_577232 ) ) ( not ( = ?auto_577229 ?auto_577233 ) ) ( not ( = ?auto_577229 ?auto_577234 ) ) ( not ( = ?auto_577229 ?auto_577235 ) ) ( not ( = ?auto_577230 ?auto_577231 ) ) ( not ( = ?auto_577230 ?auto_577232 ) ) ( not ( = ?auto_577230 ?auto_577233 ) ) ( not ( = ?auto_577230 ?auto_577234 ) ) ( not ( = ?auto_577230 ?auto_577235 ) ) ( not ( = ?auto_577231 ?auto_577232 ) ) ( not ( = ?auto_577231 ?auto_577233 ) ) ( not ( = ?auto_577231 ?auto_577234 ) ) ( not ( = ?auto_577231 ?auto_577235 ) ) ( not ( = ?auto_577232 ?auto_577233 ) ) ( not ( = ?auto_577232 ?auto_577234 ) ) ( not ( = ?auto_577232 ?auto_577235 ) ) ( not ( = ?auto_577233 ?auto_577234 ) ) ( not ( = ?auto_577233 ?auto_577235 ) ) ( not ( = ?auto_577234 ?auto_577235 ) ) ( ON ?auto_577234 ?auto_577235 ) ( ON ?auto_577233 ?auto_577234 ) ( ON ?auto_577232 ?auto_577233 ) ( ON ?auto_577231 ?auto_577232 ) ( ON ?auto_577230 ?auto_577231 ) ( CLEAR ?auto_577228 ) ( ON ?auto_577229 ?auto_577230 ) ( CLEAR ?auto_577229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_577220 ?auto_577221 ?auto_577222 ?auto_577223 ?auto_577224 ?auto_577225 ?auto_577226 ?auto_577227 ?auto_577228 ?auto_577229 )
      ( MAKE-16PILE ?auto_577220 ?auto_577221 ?auto_577222 ?auto_577223 ?auto_577224 ?auto_577225 ?auto_577226 ?auto_577227 ?auto_577228 ?auto_577229 ?auto_577230 ?auto_577231 ?auto_577232 ?auto_577233 ?auto_577234 ?auto_577235 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577252 - BLOCK
      ?auto_577253 - BLOCK
      ?auto_577254 - BLOCK
      ?auto_577255 - BLOCK
      ?auto_577256 - BLOCK
      ?auto_577257 - BLOCK
      ?auto_577258 - BLOCK
      ?auto_577259 - BLOCK
      ?auto_577260 - BLOCK
      ?auto_577261 - BLOCK
      ?auto_577262 - BLOCK
      ?auto_577263 - BLOCK
      ?auto_577264 - BLOCK
      ?auto_577265 - BLOCK
      ?auto_577266 - BLOCK
      ?auto_577267 - BLOCK
    )
    :vars
    (
      ?auto_577268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_577267 ?auto_577268 ) ( ON-TABLE ?auto_577252 ) ( ON ?auto_577253 ?auto_577252 ) ( ON ?auto_577254 ?auto_577253 ) ( ON ?auto_577255 ?auto_577254 ) ( ON ?auto_577256 ?auto_577255 ) ( ON ?auto_577257 ?auto_577256 ) ( ON ?auto_577258 ?auto_577257 ) ( ON ?auto_577259 ?auto_577258 ) ( not ( = ?auto_577252 ?auto_577253 ) ) ( not ( = ?auto_577252 ?auto_577254 ) ) ( not ( = ?auto_577252 ?auto_577255 ) ) ( not ( = ?auto_577252 ?auto_577256 ) ) ( not ( = ?auto_577252 ?auto_577257 ) ) ( not ( = ?auto_577252 ?auto_577258 ) ) ( not ( = ?auto_577252 ?auto_577259 ) ) ( not ( = ?auto_577252 ?auto_577260 ) ) ( not ( = ?auto_577252 ?auto_577261 ) ) ( not ( = ?auto_577252 ?auto_577262 ) ) ( not ( = ?auto_577252 ?auto_577263 ) ) ( not ( = ?auto_577252 ?auto_577264 ) ) ( not ( = ?auto_577252 ?auto_577265 ) ) ( not ( = ?auto_577252 ?auto_577266 ) ) ( not ( = ?auto_577252 ?auto_577267 ) ) ( not ( = ?auto_577252 ?auto_577268 ) ) ( not ( = ?auto_577253 ?auto_577254 ) ) ( not ( = ?auto_577253 ?auto_577255 ) ) ( not ( = ?auto_577253 ?auto_577256 ) ) ( not ( = ?auto_577253 ?auto_577257 ) ) ( not ( = ?auto_577253 ?auto_577258 ) ) ( not ( = ?auto_577253 ?auto_577259 ) ) ( not ( = ?auto_577253 ?auto_577260 ) ) ( not ( = ?auto_577253 ?auto_577261 ) ) ( not ( = ?auto_577253 ?auto_577262 ) ) ( not ( = ?auto_577253 ?auto_577263 ) ) ( not ( = ?auto_577253 ?auto_577264 ) ) ( not ( = ?auto_577253 ?auto_577265 ) ) ( not ( = ?auto_577253 ?auto_577266 ) ) ( not ( = ?auto_577253 ?auto_577267 ) ) ( not ( = ?auto_577253 ?auto_577268 ) ) ( not ( = ?auto_577254 ?auto_577255 ) ) ( not ( = ?auto_577254 ?auto_577256 ) ) ( not ( = ?auto_577254 ?auto_577257 ) ) ( not ( = ?auto_577254 ?auto_577258 ) ) ( not ( = ?auto_577254 ?auto_577259 ) ) ( not ( = ?auto_577254 ?auto_577260 ) ) ( not ( = ?auto_577254 ?auto_577261 ) ) ( not ( = ?auto_577254 ?auto_577262 ) ) ( not ( = ?auto_577254 ?auto_577263 ) ) ( not ( = ?auto_577254 ?auto_577264 ) ) ( not ( = ?auto_577254 ?auto_577265 ) ) ( not ( = ?auto_577254 ?auto_577266 ) ) ( not ( = ?auto_577254 ?auto_577267 ) ) ( not ( = ?auto_577254 ?auto_577268 ) ) ( not ( = ?auto_577255 ?auto_577256 ) ) ( not ( = ?auto_577255 ?auto_577257 ) ) ( not ( = ?auto_577255 ?auto_577258 ) ) ( not ( = ?auto_577255 ?auto_577259 ) ) ( not ( = ?auto_577255 ?auto_577260 ) ) ( not ( = ?auto_577255 ?auto_577261 ) ) ( not ( = ?auto_577255 ?auto_577262 ) ) ( not ( = ?auto_577255 ?auto_577263 ) ) ( not ( = ?auto_577255 ?auto_577264 ) ) ( not ( = ?auto_577255 ?auto_577265 ) ) ( not ( = ?auto_577255 ?auto_577266 ) ) ( not ( = ?auto_577255 ?auto_577267 ) ) ( not ( = ?auto_577255 ?auto_577268 ) ) ( not ( = ?auto_577256 ?auto_577257 ) ) ( not ( = ?auto_577256 ?auto_577258 ) ) ( not ( = ?auto_577256 ?auto_577259 ) ) ( not ( = ?auto_577256 ?auto_577260 ) ) ( not ( = ?auto_577256 ?auto_577261 ) ) ( not ( = ?auto_577256 ?auto_577262 ) ) ( not ( = ?auto_577256 ?auto_577263 ) ) ( not ( = ?auto_577256 ?auto_577264 ) ) ( not ( = ?auto_577256 ?auto_577265 ) ) ( not ( = ?auto_577256 ?auto_577266 ) ) ( not ( = ?auto_577256 ?auto_577267 ) ) ( not ( = ?auto_577256 ?auto_577268 ) ) ( not ( = ?auto_577257 ?auto_577258 ) ) ( not ( = ?auto_577257 ?auto_577259 ) ) ( not ( = ?auto_577257 ?auto_577260 ) ) ( not ( = ?auto_577257 ?auto_577261 ) ) ( not ( = ?auto_577257 ?auto_577262 ) ) ( not ( = ?auto_577257 ?auto_577263 ) ) ( not ( = ?auto_577257 ?auto_577264 ) ) ( not ( = ?auto_577257 ?auto_577265 ) ) ( not ( = ?auto_577257 ?auto_577266 ) ) ( not ( = ?auto_577257 ?auto_577267 ) ) ( not ( = ?auto_577257 ?auto_577268 ) ) ( not ( = ?auto_577258 ?auto_577259 ) ) ( not ( = ?auto_577258 ?auto_577260 ) ) ( not ( = ?auto_577258 ?auto_577261 ) ) ( not ( = ?auto_577258 ?auto_577262 ) ) ( not ( = ?auto_577258 ?auto_577263 ) ) ( not ( = ?auto_577258 ?auto_577264 ) ) ( not ( = ?auto_577258 ?auto_577265 ) ) ( not ( = ?auto_577258 ?auto_577266 ) ) ( not ( = ?auto_577258 ?auto_577267 ) ) ( not ( = ?auto_577258 ?auto_577268 ) ) ( not ( = ?auto_577259 ?auto_577260 ) ) ( not ( = ?auto_577259 ?auto_577261 ) ) ( not ( = ?auto_577259 ?auto_577262 ) ) ( not ( = ?auto_577259 ?auto_577263 ) ) ( not ( = ?auto_577259 ?auto_577264 ) ) ( not ( = ?auto_577259 ?auto_577265 ) ) ( not ( = ?auto_577259 ?auto_577266 ) ) ( not ( = ?auto_577259 ?auto_577267 ) ) ( not ( = ?auto_577259 ?auto_577268 ) ) ( not ( = ?auto_577260 ?auto_577261 ) ) ( not ( = ?auto_577260 ?auto_577262 ) ) ( not ( = ?auto_577260 ?auto_577263 ) ) ( not ( = ?auto_577260 ?auto_577264 ) ) ( not ( = ?auto_577260 ?auto_577265 ) ) ( not ( = ?auto_577260 ?auto_577266 ) ) ( not ( = ?auto_577260 ?auto_577267 ) ) ( not ( = ?auto_577260 ?auto_577268 ) ) ( not ( = ?auto_577261 ?auto_577262 ) ) ( not ( = ?auto_577261 ?auto_577263 ) ) ( not ( = ?auto_577261 ?auto_577264 ) ) ( not ( = ?auto_577261 ?auto_577265 ) ) ( not ( = ?auto_577261 ?auto_577266 ) ) ( not ( = ?auto_577261 ?auto_577267 ) ) ( not ( = ?auto_577261 ?auto_577268 ) ) ( not ( = ?auto_577262 ?auto_577263 ) ) ( not ( = ?auto_577262 ?auto_577264 ) ) ( not ( = ?auto_577262 ?auto_577265 ) ) ( not ( = ?auto_577262 ?auto_577266 ) ) ( not ( = ?auto_577262 ?auto_577267 ) ) ( not ( = ?auto_577262 ?auto_577268 ) ) ( not ( = ?auto_577263 ?auto_577264 ) ) ( not ( = ?auto_577263 ?auto_577265 ) ) ( not ( = ?auto_577263 ?auto_577266 ) ) ( not ( = ?auto_577263 ?auto_577267 ) ) ( not ( = ?auto_577263 ?auto_577268 ) ) ( not ( = ?auto_577264 ?auto_577265 ) ) ( not ( = ?auto_577264 ?auto_577266 ) ) ( not ( = ?auto_577264 ?auto_577267 ) ) ( not ( = ?auto_577264 ?auto_577268 ) ) ( not ( = ?auto_577265 ?auto_577266 ) ) ( not ( = ?auto_577265 ?auto_577267 ) ) ( not ( = ?auto_577265 ?auto_577268 ) ) ( not ( = ?auto_577266 ?auto_577267 ) ) ( not ( = ?auto_577266 ?auto_577268 ) ) ( not ( = ?auto_577267 ?auto_577268 ) ) ( ON ?auto_577266 ?auto_577267 ) ( ON ?auto_577265 ?auto_577266 ) ( ON ?auto_577264 ?auto_577265 ) ( ON ?auto_577263 ?auto_577264 ) ( ON ?auto_577262 ?auto_577263 ) ( ON ?auto_577261 ?auto_577262 ) ( CLEAR ?auto_577259 ) ( ON ?auto_577260 ?auto_577261 ) ( CLEAR ?auto_577260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_577252 ?auto_577253 ?auto_577254 ?auto_577255 ?auto_577256 ?auto_577257 ?auto_577258 ?auto_577259 ?auto_577260 )
      ( MAKE-16PILE ?auto_577252 ?auto_577253 ?auto_577254 ?auto_577255 ?auto_577256 ?auto_577257 ?auto_577258 ?auto_577259 ?auto_577260 ?auto_577261 ?auto_577262 ?auto_577263 ?auto_577264 ?auto_577265 ?auto_577266 ?auto_577267 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577285 - BLOCK
      ?auto_577286 - BLOCK
      ?auto_577287 - BLOCK
      ?auto_577288 - BLOCK
      ?auto_577289 - BLOCK
      ?auto_577290 - BLOCK
      ?auto_577291 - BLOCK
      ?auto_577292 - BLOCK
      ?auto_577293 - BLOCK
      ?auto_577294 - BLOCK
      ?auto_577295 - BLOCK
      ?auto_577296 - BLOCK
      ?auto_577297 - BLOCK
      ?auto_577298 - BLOCK
      ?auto_577299 - BLOCK
      ?auto_577300 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_577300 ) ( ON-TABLE ?auto_577285 ) ( ON ?auto_577286 ?auto_577285 ) ( ON ?auto_577287 ?auto_577286 ) ( ON ?auto_577288 ?auto_577287 ) ( ON ?auto_577289 ?auto_577288 ) ( ON ?auto_577290 ?auto_577289 ) ( ON ?auto_577291 ?auto_577290 ) ( ON ?auto_577292 ?auto_577291 ) ( not ( = ?auto_577285 ?auto_577286 ) ) ( not ( = ?auto_577285 ?auto_577287 ) ) ( not ( = ?auto_577285 ?auto_577288 ) ) ( not ( = ?auto_577285 ?auto_577289 ) ) ( not ( = ?auto_577285 ?auto_577290 ) ) ( not ( = ?auto_577285 ?auto_577291 ) ) ( not ( = ?auto_577285 ?auto_577292 ) ) ( not ( = ?auto_577285 ?auto_577293 ) ) ( not ( = ?auto_577285 ?auto_577294 ) ) ( not ( = ?auto_577285 ?auto_577295 ) ) ( not ( = ?auto_577285 ?auto_577296 ) ) ( not ( = ?auto_577285 ?auto_577297 ) ) ( not ( = ?auto_577285 ?auto_577298 ) ) ( not ( = ?auto_577285 ?auto_577299 ) ) ( not ( = ?auto_577285 ?auto_577300 ) ) ( not ( = ?auto_577286 ?auto_577287 ) ) ( not ( = ?auto_577286 ?auto_577288 ) ) ( not ( = ?auto_577286 ?auto_577289 ) ) ( not ( = ?auto_577286 ?auto_577290 ) ) ( not ( = ?auto_577286 ?auto_577291 ) ) ( not ( = ?auto_577286 ?auto_577292 ) ) ( not ( = ?auto_577286 ?auto_577293 ) ) ( not ( = ?auto_577286 ?auto_577294 ) ) ( not ( = ?auto_577286 ?auto_577295 ) ) ( not ( = ?auto_577286 ?auto_577296 ) ) ( not ( = ?auto_577286 ?auto_577297 ) ) ( not ( = ?auto_577286 ?auto_577298 ) ) ( not ( = ?auto_577286 ?auto_577299 ) ) ( not ( = ?auto_577286 ?auto_577300 ) ) ( not ( = ?auto_577287 ?auto_577288 ) ) ( not ( = ?auto_577287 ?auto_577289 ) ) ( not ( = ?auto_577287 ?auto_577290 ) ) ( not ( = ?auto_577287 ?auto_577291 ) ) ( not ( = ?auto_577287 ?auto_577292 ) ) ( not ( = ?auto_577287 ?auto_577293 ) ) ( not ( = ?auto_577287 ?auto_577294 ) ) ( not ( = ?auto_577287 ?auto_577295 ) ) ( not ( = ?auto_577287 ?auto_577296 ) ) ( not ( = ?auto_577287 ?auto_577297 ) ) ( not ( = ?auto_577287 ?auto_577298 ) ) ( not ( = ?auto_577287 ?auto_577299 ) ) ( not ( = ?auto_577287 ?auto_577300 ) ) ( not ( = ?auto_577288 ?auto_577289 ) ) ( not ( = ?auto_577288 ?auto_577290 ) ) ( not ( = ?auto_577288 ?auto_577291 ) ) ( not ( = ?auto_577288 ?auto_577292 ) ) ( not ( = ?auto_577288 ?auto_577293 ) ) ( not ( = ?auto_577288 ?auto_577294 ) ) ( not ( = ?auto_577288 ?auto_577295 ) ) ( not ( = ?auto_577288 ?auto_577296 ) ) ( not ( = ?auto_577288 ?auto_577297 ) ) ( not ( = ?auto_577288 ?auto_577298 ) ) ( not ( = ?auto_577288 ?auto_577299 ) ) ( not ( = ?auto_577288 ?auto_577300 ) ) ( not ( = ?auto_577289 ?auto_577290 ) ) ( not ( = ?auto_577289 ?auto_577291 ) ) ( not ( = ?auto_577289 ?auto_577292 ) ) ( not ( = ?auto_577289 ?auto_577293 ) ) ( not ( = ?auto_577289 ?auto_577294 ) ) ( not ( = ?auto_577289 ?auto_577295 ) ) ( not ( = ?auto_577289 ?auto_577296 ) ) ( not ( = ?auto_577289 ?auto_577297 ) ) ( not ( = ?auto_577289 ?auto_577298 ) ) ( not ( = ?auto_577289 ?auto_577299 ) ) ( not ( = ?auto_577289 ?auto_577300 ) ) ( not ( = ?auto_577290 ?auto_577291 ) ) ( not ( = ?auto_577290 ?auto_577292 ) ) ( not ( = ?auto_577290 ?auto_577293 ) ) ( not ( = ?auto_577290 ?auto_577294 ) ) ( not ( = ?auto_577290 ?auto_577295 ) ) ( not ( = ?auto_577290 ?auto_577296 ) ) ( not ( = ?auto_577290 ?auto_577297 ) ) ( not ( = ?auto_577290 ?auto_577298 ) ) ( not ( = ?auto_577290 ?auto_577299 ) ) ( not ( = ?auto_577290 ?auto_577300 ) ) ( not ( = ?auto_577291 ?auto_577292 ) ) ( not ( = ?auto_577291 ?auto_577293 ) ) ( not ( = ?auto_577291 ?auto_577294 ) ) ( not ( = ?auto_577291 ?auto_577295 ) ) ( not ( = ?auto_577291 ?auto_577296 ) ) ( not ( = ?auto_577291 ?auto_577297 ) ) ( not ( = ?auto_577291 ?auto_577298 ) ) ( not ( = ?auto_577291 ?auto_577299 ) ) ( not ( = ?auto_577291 ?auto_577300 ) ) ( not ( = ?auto_577292 ?auto_577293 ) ) ( not ( = ?auto_577292 ?auto_577294 ) ) ( not ( = ?auto_577292 ?auto_577295 ) ) ( not ( = ?auto_577292 ?auto_577296 ) ) ( not ( = ?auto_577292 ?auto_577297 ) ) ( not ( = ?auto_577292 ?auto_577298 ) ) ( not ( = ?auto_577292 ?auto_577299 ) ) ( not ( = ?auto_577292 ?auto_577300 ) ) ( not ( = ?auto_577293 ?auto_577294 ) ) ( not ( = ?auto_577293 ?auto_577295 ) ) ( not ( = ?auto_577293 ?auto_577296 ) ) ( not ( = ?auto_577293 ?auto_577297 ) ) ( not ( = ?auto_577293 ?auto_577298 ) ) ( not ( = ?auto_577293 ?auto_577299 ) ) ( not ( = ?auto_577293 ?auto_577300 ) ) ( not ( = ?auto_577294 ?auto_577295 ) ) ( not ( = ?auto_577294 ?auto_577296 ) ) ( not ( = ?auto_577294 ?auto_577297 ) ) ( not ( = ?auto_577294 ?auto_577298 ) ) ( not ( = ?auto_577294 ?auto_577299 ) ) ( not ( = ?auto_577294 ?auto_577300 ) ) ( not ( = ?auto_577295 ?auto_577296 ) ) ( not ( = ?auto_577295 ?auto_577297 ) ) ( not ( = ?auto_577295 ?auto_577298 ) ) ( not ( = ?auto_577295 ?auto_577299 ) ) ( not ( = ?auto_577295 ?auto_577300 ) ) ( not ( = ?auto_577296 ?auto_577297 ) ) ( not ( = ?auto_577296 ?auto_577298 ) ) ( not ( = ?auto_577296 ?auto_577299 ) ) ( not ( = ?auto_577296 ?auto_577300 ) ) ( not ( = ?auto_577297 ?auto_577298 ) ) ( not ( = ?auto_577297 ?auto_577299 ) ) ( not ( = ?auto_577297 ?auto_577300 ) ) ( not ( = ?auto_577298 ?auto_577299 ) ) ( not ( = ?auto_577298 ?auto_577300 ) ) ( not ( = ?auto_577299 ?auto_577300 ) ) ( ON ?auto_577299 ?auto_577300 ) ( ON ?auto_577298 ?auto_577299 ) ( ON ?auto_577297 ?auto_577298 ) ( ON ?auto_577296 ?auto_577297 ) ( ON ?auto_577295 ?auto_577296 ) ( ON ?auto_577294 ?auto_577295 ) ( CLEAR ?auto_577292 ) ( ON ?auto_577293 ?auto_577294 ) ( CLEAR ?auto_577293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_577285 ?auto_577286 ?auto_577287 ?auto_577288 ?auto_577289 ?auto_577290 ?auto_577291 ?auto_577292 ?auto_577293 )
      ( MAKE-16PILE ?auto_577285 ?auto_577286 ?auto_577287 ?auto_577288 ?auto_577289 ?auto_577290 ?auto_577291 ?auto_577292 ?auto_577293 ?auto_577294 ?auto_577295 ?auto_577296 ?auto_577297 ?auto_577298 ?auto_577299 ?auto_577300 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577317 - BLOCK
      ?auto_577318 - BLOCK
      ?auto_577319 - BLOCK
      ?auto_577320 - BLOCK
      ?auto_577321 - BLOCK
      ?auto_577322 - BLOCK
      ?auto_577323 - BLOCK
      ?auto_577324 - BLOCK
      ?auto_577325 - BLOCK
      ?auto_577326 - BLOCK
      ?auto_577327 - BLOCK
      ?auto_577328 - BLOCK
      ?auto_577329 - BLOCK
      ?auto_577330 - BLOCK
      ?auto_577331 - BLOCK
      ?auto_577332 - BLOCK
    )
    :vars
    (
      ?auto_577333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_577332 ?auto_577333 ) ( ON-TABLE ?auto_577317 ) ( ON ?auto_577318 ?auto_577317 ) ( ON ?auto_577319 ?auto_577318 ) ( ON ?auto_577320 ?auto_577319 ) ( ON ?auto_577321 ?auto_577320 ) ( ON ?auto_577322 ?auto_577321 ) ( ON ?auto_577323 ?auto_577322 ) ( not ( = ?auto_577317 ?auto_577318 ) ) ( not ( = ?auto_577317 ?auto_577319 ) ) ( not ( = ?auto_577317 ?auto_577320 ) ) ( not ( = ?auto_577317 ?auto_577321 ) ) ( not ( = ?auto_577317 ?auto_577322 ) ) ( not ( = ?auto_577317 ?auto_577323 ) ) ( not ( = ?auto_577317 ?auto_577324 ) ) ( not ( = ?auto_577317 ?auto_577325 ) ) ( not ( = ?auto_577317 ?auto_577326 ) ) ( not ( = ?auto_577317 ?auto_577327 ) ) ( not ( = ?auto_577317 ?auto_577328 ) ) ( not ( = ?auto_577317 ?auto_577329 ) ) ( not ( = ?auto_577317 ?auto_577330 ) ) ( not ( = ?auto_577317 ?auto_577331 ) ) ( not ( = ?auto_577317 ?auto_577332 ) ) ( not ( = ?auto_577317 ?auto_577333 ) ) ( not ( = ?auto_577318 ?auto_577319 ) ) ( not ( = ?auto_577318 ?auto_577320 ) ) ( not ( = ?auto_577318 ?auto_577321 ) ) ( not ( = ?auto_577318 ?auto_577322 ) ) ( not ( = ?auto_577318 ?auto_577323 ) ) ( not ( = ?auto_577318 ?auto_577324 ) ) ( not ( = ?auto_577318 ?auto_577325 ) ) ( not ( = ?auto_577318 ?auto_577326 ) ) ( not ( = ?auto_577318 ?auto_577327 ) ) ( not ( = ?auto_577318 ?auto_577328 ) ) ( not ( = ?auto_577318 ?auto_577329 ) ) ( not ( = ?auto_577318 ?auto_577330 ) ) ( not ( = ?auto_577318 ?auto_577331 ) ) ( not ( = ?auto_577318 ?auto_577332 ) ) ( not ( = ?auto_577318 ?auto_577333 ) ) ( not ( = ?auto_577319 ?auto_577320 ) ) ( not ( = ?auto_577319 ?auto_577321 ) ) ( not ( = ?auto_577319 ?auto_577322 ) ) ( not ( = ?auto_577319 ?auto_577323 ) ) ( not ( = ?auto_577319 ?auto_577324 ) ) ( not ( = ?auto_577319 ?auto_577325 ) ) ( not ( = ?auto_577319 ?auto_577326 ) ) ( not ( = ?auto_577319 ?auto_577327 ) ) ( not ( = ?auto_577319 ?auto_577328 ) ) ( not ( = ?auto_577319 ?auto_577329 ) ) ( not ( = ?auto_577319 ?auto_577330 ) ) ( not ( = ?auto_577319 ?auto_577331 ) ) ( not ( = ?auto_577319 ?auto_577332 ) ) ( not ( = ?auto_577319 ?auto_577333 ) ) ( not ( = ?auto_577320 ?auto_577321 ) ) ( not ( = ?auto_577320 ?auto_577322 ) ) ( not ( = ?auto_577320 ?auto_577323 ) ) ( not ( = ?auto_577320 ?auto_577324 ) ) ( not ( = ?auto_577320 ?auto_577325 ) ) ( not ( = ?auto_577320 ?auto_577326 ) ) ( not ( = ?auto_577320 ?auto_577327 ) ) ( not ( = ?auto_577320 ?auto_577328 ) ) ( not ( = ?auto_577320 ?auto_577329 ) ) ( not ( = ?auto_577320 ?auto_577330 ) ) ( not ( = ?auto_577320 ?auto_577331 ) ) ( not ( = ?auto_577320 ?auto_577332 ) ) ( not ( = ?auto_577320 ?auto_577333 ) ) ( not ( = ?auto_577321 ?auto_577322 ) ) ( not ( = ?auto_577321 ?auto_577323 ) ) ( not ( = ?auto_577321 ?auto_577324 ) ) ( not ( = ?auto_577321 ?auto_577325 ) ) ( not ( = ?auto_577321 ?auto_577326 ) ) ( not ( = ?auto_577321 ?auto_577327 ) ) ( not ( = ?auto_577321 ?auto_577328 ) ) ( not ( = ?auto_577321 ?auto_577329 ) ) ( not ( = ?auto_577321 ?auto_577330 ) ) ( not ( = ?auto_577321 ?auto_577331 ) ) ( not ( = ?auto_577321 ?auto_577332 ) ) ( not ( = ?auto_577321 ?auto_577333 ) ) ( not ( = ?auto_577322 ?auto_577323 ) ) ( not ( = ?auto_577322 ?auto_577324 ) ) ( not ( = ?auto_577322 ?auto_577325 ) ) ( not ( = ?auto_577322 ?auto_577326 ) ) ( not ( = ?auto_577322 ?auto_577327 ) ) ( not ( = ?auto_577322 ?auto_577328 ) ) ( not ( = ?auto_577322 ?auto_577329 ) ) ( not ( = ?auto_577322 ?auto_577330 ) ) ( not ( = ?auto_577322 ?auto_577331 ) ) ( not ( = ?auto_577322 ?auto_577332 ) ) ( not ( = ?auto_577322 ?auto_577333 ) ) ( not ( = ?auto_577323 ?auto_577324 ) ) ( not ( = ?auto_577323 ?auto_577325 ) ) ( not ( = ?auto_577323 ?auto_577326 ) ) ( not ( = ?auto_577323 ?auto_577327 ) ) ( not ( = ?auto_577323 ?auto_577328 ) ) ( not ( = ?auto_577323 ?auto_577329 ) ) ( not ( = ?auto_577323 ?auto_577330 ) ) ( not ( = ?auto_577323 ?auto_577331 ) ) ( not ( = ?auto_577323 ?auto_577332 ) ) ( not ( = ?auto_577323 ?auto_577333 ) ) ( not ( = ?auto_577324 ?auto_577325 ) ) ( not ( = ?auto_577324 ?auto_577326 ) ) ( not ( = ?auto_577324 ?auto_577327 ) ) ( not ( = ?auto_577324 ?auto_577328 ) ) ( not ( = ?auto_577324 ?auto_577329 ) ) ( not ( = ?auto_577324 ?auto_577330 ) ) ( not ( = ?auto_577324 ?auto_577331 ) ) ( not ( = ?auto_577324 ?auto_577332 ) ) ( not ( = ?auto_577324 ?auto_577333 ) ) ( not ( = ?auto_577325 ?auto_577326 ) ) ( not ( = ?auto_577325 ?auto_577327 ) ) ( not ( = ?auto_577325 ?auto_577328 ) ) ( not ( = ?auto_577325 ?auto_577329 ) ) ( not ( = ?auto_577325 ?auto_577330 ) ) ( not ( = ?auto_577325 ?auto_577331 ) ) ( not ( = ?auto_577325 ?auto_577332 ) ) ( not ( = ?auto_577325 ?auto_577333 ) ) ( not ( = ?auto_577326 ?auto_577327 ) ) ( not ( = ?auto_577326 ?auto_577328 ) ) ( not ( = ?auto_577326 ?auto_577329 ) ) ( not ( = ?auto_577326 ?auto_577330 ) ) ( not ( = ?auto_577326 ?auto_577331 ) ) ( not ( = ?auto_577326 ?auto_577332 ) ) ( not ( = ?auto_577326 ?auto_577333 ) ) ( not ( = ?auto_577327 ?auto_577328 ) ) ( not ( = ?auto_577327 ?auto_577329 ) ) ( not ( = ?auto_577327 ?auto_577330 ) ) ( not ( = ?auto_577327 ?auto_577331 ) ) ( not ( = ?auto_577327 ?auto_577332 ) ) ( not ( = ?auto_577327 ?auto_577333 ) ) ( not ( = ?auto_577328 ?auto_577329 ) ) ( not ( = ?auto_577328 ?auto_577330 ) ) ( not ( = ?auto_577328 ?auto_577331 ) ) ( not ( = ?auto_577328 ?auto_577332 ) ) ( not ( = ?auto_577328 ?auto_577333 ) ) ( not ( = ?auto_577329 ?auto_577330 ) ) ( not ( = ?auto_577329 ?auto_577331 ) ) ( not ( = ?auto_577329 ?auto_577332 ) ) ( not ( = ?auto_577329 ?auto_577333 ) ) ( not ( = ?auto_577330 ?auto_577331 ) ) ( not ( = ?auto_577330 ?auto_577332 ) ) ( not ( = ?auto_577330 ?auto_577333 ) ) ( not ( = ?auto_577331 ?auto_577332 ) ) ( not ( = ?auto_577331 ?auto_577333 ) ) ( not ( = ?auto_577332 ?auto_577333 ) ) ( ON ?auto_577331 ?auto_577332 ) ( ON ?auto_577330 ?auto_577331 ) ( ON ?auto_577329 ?auto_577330 ) ( ON ?auto_577328 ?auto_577329 ) ( ON ?auto_577327 ?auto_577328 ) ( ON ?auto_577326 ?auto_577327 ) ( ON ?auto_577325 ?auto_577326 ) ( CLEAR ?auto_577323 ) ( ON ?auto_577324 ?auto_577325 ) ( CLEAR ?auto_577324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_577317 ?auto_577318 ?auto_577319 ?auto_577320 ?auto_577321 ?auto_577322 ?auto_577323 ?auto_577324 )
      ( MAKE-16PILE ?auto_577317 ?auto_577318 ?auto_577319 ?auto_577320 ?auto_577321 ?auto_577322 ?auto_577323 ?auto_577324 ?auto_577325 ?auto_577326 ?auto_577327 ?auto_577328 ?auto_577329 ?auto_577330 ?auto_577331 ?auto_577332 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577350 - BLOCK
      ?auto_577351 - BLOCK
      ?auto_577352 - BLOCK
      ?auto_577353 - BLOCK
      ?auto_577354 - BLOCK
      ?auto_577355 - BLOCK
      ?auto_577356 - BLOCK
      ?auto_577357 - BLOCK
      ?auto_577358 - BLOCK
      ?auto_577359 - BLOCK
      ?auto_577360 - BLOCK
      ?auto_577361 - BLOCK
      ?auto_577362 - BLOCK
      ?auto_577363 - BLOCK
      ?auto_577364 - BLOCK
      ?auto_577365 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_577365 ) ( ON-TABLE ?auto_577350 ) ( ON ?auto_577351 ?auto_577350 ) ( ON ?auto_577352 ?auto_577351 ) ( ON ?auto_577353 ?auto_577352 ) ( ON ?auto_577354 ?auto_577353 ) ( ON ?auto_577355 ?auto_577354 ) ( ON ?auto_577356 ?auto_577355 ) ( not ( = ?auto_577350 ?auto_577351 ) ) ( not ( = ?auto_577350 ?auto_577352 ) ) ( not ( = ?auto_577350 ?auto_577353 ) ) ( not ( = ?auto_577350 ?auto_577354 ) ) ( not ( = ?auto_577350 ?auto_577355 ) ) ( not ( = ?auto_577350 ?auto_577356 ) ) ( not ( = ?auto_577350 ?auto_577357 ) ) ( not ( = ?auto_577350 ?auto_577358 ) ) ( not ( = ?auto_577350 ?auto_577359 ) ) ( not ( = ?auto_577350 ?auto_577360 ) ) ( not ( = ?auto_577350 ?auto_577361 ) ) ( not ( = ?auto_577350 ?auto_577362 ) ) ( not ( = ?auto_577350 ?auto_577363 ) ) ( not ( = ?auto_577350 ?auto_577364 ) ) ( not ( = ?auto_577350 ?auto_577365 ) ) ( not ( = ?auto_577351 ?auto_577352 ) ) ( not ( = ?auto_577351 ?auto_577353 ) ) ( not ( = ?auto_577351 ?auto_577354 ) ) ( not ( = ?auto_577351 ?auto_577355 ) ) ( not ( = ?auto_577351 ?auto_577356 ) ) ( not ( = ?auto_577351 ?auto_577357 ) ) ( not ( = ?auto_577351 ?auto_577358 ) ) ( not ( = ?auto_577351 ?auto_577359 ) ) ( not ( = ?auto_577351 ?auto_577360 ) ) ( not ( = ?auto_577351 ?auto_577361 ) ) ( not ( = ?auto_577351 ?auto_577362 ) ) ( not ( = ?auto_577351 ?auto_577363 ) ) ( not ( = ?auto_577351 ?auto_577364 ) ) ( not ( = ?auto_577351 ?auto_577365 ) ) ( not ( = ?auto_577352 ?auto_577353 ) ) ( not ( = ?auto_577352 ?auto_577354 ) ) ( not ( = ?auto_577352 ?auto_577355 ) ) ( not ( = ?auto_577352 ?auto_577356 ) ) ( not ( = ?auto_577352 ?auto_577357 ) ) ( not ( = ?auto_577352 ?auto_577358 ) ) ( not ( = ?auto_577352 ?auto_577359 ) ) ( not ( = ?auto_577352 ?auto_577360 ) ) ( not ( = ?auto_577352 ?auto_577361 ) ) ( not ( = ?auto_577352 ?auto_577362 ) ) ( not ( = ?auto_577352 ?auto_577363 ) ) ( not ( = ?auto_577352 ?auto_577364 ) ) ( not ( = ?auto_577352 ?auto_577365 ) ) ( not ( = ?auto_577353 ?auto_577354 ) ) ( not ( = ?auto_577353 ?auto_577355 ) ) ( not ( = ?auto_577353 ?auto_577356 ) ) ( not ( = ?auto_577353 ?auto_577357 ) ) ( not ( = ?auto_577353 ?auto_577358 ) ) ( not ( = ?auto_577353 ?auto_577359 ) ) ( not ( = ?auto_577353 ?auto_577360 ) ) ( not ( = ?auto_577353 ?auto_577361 ) ) ( not ( = ?auto_577353 ?auto_577362 ) ) ( not ( = ?auto_577353 ?auto_577363 ) ) ( not ( = ?auto_577353 ?auto_577364 ) ) ( not ( = ?auto_577353 ?auto_577365 ) ) ( not ( = ?auto_577354 ?auto_577355 ) ) ( not ( = ?auto_577354 ?auto_577356 ) ) ( not ( = ?auto_577354 ?auto_577357 ) ) ( not ( = ?auto_577354 ?auto_577358 ) ) ( not ( = ?auto_577354 ?auto_577359 ) ) ( not ( = ?auto_577354 ?auto_577360 ) ) ( not ( = ?auto_577354 ?auto_577361 ) ) ( not ( = ?auto_577354 ?auto_577362 ) ) ( not ( = ?auto_577354 ?auto_577363 ) ) ( not ( = ?auto_577354 ?auto_577364 ) ) ( not ( = ?auto_577354 ?auto_577365 ) ) ( not ( = ?auto_577355 ?auto_577356 ) ) ( not ( = ?auto_577355 ?auto_577357 ) ) ( not ( = ?auto_577355 ?auto_577358 ) ) ( not ( = ?auto_577355 ?auto_577359 ) ) ( not ( = ?auto_577355 ?auto_577360 ) ) ( not ( = ?auto_577355 ?auto_577361 ) ) ( not ( = ?auto_577355 ?auto_577362 ) ) ( not ( = ?auto_577355 ?auto_577363 ) ) ( not ( = ?auto_577355 ?auto_577364 ) ) ( not ( = ?auto_577355 ?auto_577365 ) ) ( not ( = ?auto_577356 ?auto_577357 ) ) ( not ( = ?auto_577356 ?auto_577358 ) ) ( not ( = ?auto_577356 ?auto_577359 ) ) ( not ( = ?auto_577356 ?auto_577360 ) ) ( not ( = ?auto_577356 ?auto_577361 ) ) ( not ( = ?auto_577356 ?auto_577362 ) ) ( not ( = ?auto_577356 ?auto_577363 ) ) ( not ( = ?auto_577356 ?auto_577364 ) ) ( not ( = ?auto_577356 ?auto_577365 ) ) ( not ( = ?auto_577357 ?auto_577358 ) ) ( not ( = ?auto_577357 ?auto_577359 ) ) ( not ( = ?auto_577357 ?auto_577360 ) ) ( not ( = ?auto_577357 ?auto_577361 ) ) ( not ( = ?auto_577357 ?auto_577362 ) ) ( not ( = ?auto_577357 ?auto_577363 ) ) ( not ( = ?auto_577357 ?auto_577364 ) ) ( not ( = ?auto_577357 ?auto_577365 ) ) ( not ( = ?auto_577358 ?auto_577359 ) ) ( not ( = ?auto_577358 ?auto_577360 ) ) ( not ( = ?auto_577358 ?auto_577361 ) ) ( not ( = ?auto_577358 ?auto_577362 ) ) ( not ( = ?auto_577358 ?auto_577363 ) ) ( not ( = ?auto_577358 ?auto_577364 ) ) ( not ( = ?auto_577358 ?auto_577365 ) ) ( not ( = ?auto_577359 ?auto_577360 ) ) ( not ( = ?auto_577359 ?auto_577361 ) ) ( not ( = ?auto_577359 ?auto_577362 ) ) ( not ( = ?auto_577359 ?auto_577363 ) ) ( not ( = ?auto_577359 ?auto_577364 ) ) ( not ( = ?auto_577359 ?auto_577365 ) ) ( not ( = ?auto_577360 ?auto_577361 ) ) ( not ( = ?auto_577360 ?auto_577362 ) ) ( not ( = ?auto_577360 ?auto_577363 ) ) ( not ( = ?auto_577360 ?auto_577364 ) ) ( not ( = ?auto_577360 ?auto_577365 ) ) ( not ( = ?auto_577361 ?auto_577362 ) ) ( not ( = ?auto_577361 ?auto_577363 ) ) ( not ( = ?auto_577361 ?auto_577364 ) ) ( not ( = ?auto_577361 ?auto_577365 ) ) ( not ( = ?auto_577362 ?auto_577363 ) ) ( not ( = ?auto_577362 ?auto_577364 ) ) ( not ( = ?auto_577362 ?auto_577365 ) ) ( not ( = ?auto_577363 ?auto_577364 ) ) ( not ( = ?auto_577363 ?auto_577365 ) ) ( not ( = ?auto_577364 ?auto_577365 ) ) ( ON ?auto_577364 ?auto_577365 ) ( ON ?auto_577363 ?auto_577364 ) ( ON ?auto_577362 ?auto_577363 ) ( ON ?auto_577361 ?auto_577362 ) ( ON ?auto_577360 ?auto_577361 ) ( ON ?auto_577359 ?auto_577360 ) ( ON ?auto_577358 ?auto_577359 ) ( CLEAR ?auto_577356 ) ( ON ?auto_577357 ?auto_577358 ) ( CLEAR ?auto_577357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_577350 ?auto_577351 ?auto_577352 ?auto_577353 ?auto_577354 ?auto_577355 ?auto_577356 ?auto_577357 )
      ( MAKE-16PILE ?auto_577350 ?auto_577351 ?auto_577352 ?auto_577353 ?auto_577354 ?auto_577355 ?auto_577356 ?auto_577357 ?auto_577358 ?auto_577359 ?auto_577360 ?auto_577361 ?auto_577362 ?auto_577363 ?auto_577364 ?auto_577365 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577382 - BLOCK
      ?auto_577383 - BLOCK
      ?auto_577384 - BLOCK
      ?auto_577385 - BLOCK
      ?auto_577386 - BLOCK
      ?auto_577387 - BLOCK
      ?auto_577388 - BLOCK
      ?auto_577389 - BLOCK
      ?auto_577390 - BLOCK
      ?auto_577391 - BLOCK
      ?auto_577392 - BLOCK
      ?auto_577393 - BLOCK
      ?auto_577394 - BLOCK
      ?auto_577395 - BLOCK
      ?auto_577396 - BLOCK
      ?auto_577397 - BLOCK
    )
    :vars
    (
      ?auto_577398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_577397 ?auto_577398 ) ( ON-TABLE ?auto_577382 ) ( ON ?auto_577383 ?auto_577382 ) ( ON ?auto_577384 ?auto_577383 ) ( ON ?auto_577385 ?auto_577384 ) ( ON ?auto_577386 ?auto_577385 ) ( ON ?auto_577387 ?auto_577386 ) ( not ( = ?auto_577382 ?auto_577383 ) ) ( not ( = ?auto_577382 ?auto_577384 ) ) ( not ( = ?auto_577382 ?auto_577385 ) ) ( not ( = ?auto_577382 ?auto_577386 ) ) ( not ( = ?auto_577382 ?auto_577387 ) ) ( not ( = ?auto_577382 ?auto_577388 ) ) ( not ( = ?auto_577382 ?auto_577389 ) ) ( not ( = ?auto_577382 ?auto_577390 ) ) ( not ( = ?auto_577382 ?auto_577391 ) ) ( not ( = ?auto_577382 ?auto_577392 ) ) ( not ( = ?auto_577382 ?auto_577393 ) ) ( not ( = ?auto_577382 ?auto_577394 ) ) ( not ( = ?auto_577382 ?auto_577395 ) ) ( not ( = ?auto_577382 ?auto_577396 ) ) ( not ( = ?auto_577382 ?auto_577397 ) ) ( not ( = ?auto_577382 ?auto_577398 ) ) ( not ( = ?auto_577383 ?auto_577384 ) ) ( not ( = ?auto_577383 ?auto_577385 ) ) ( not ( = ?auto_577383 ?auto_577386 ) ) ( not ( = ?auto_577383 ?auto_577387 ) ) ( not ( = ?auto_577383 ?auto_577388 ) ) ( not ( = ?auto_577383 ?auto_577389 ) ) ( not ( = ?auto_577383 ?auto_577390 ) ) ( not ( = ?auto_577383 ?auto_577391 ) ) ( not ( = ?auto_577383 ?auto_577392 ) ) ( not ( = ?auto_577383 ?auto_577393 ) ) ( not ( = ?auto_577383 ?auto_577394 ) ) ( not ( = ?auto_577383 ?auto_577395 ) ) ( not ( = ?auto_577383 ?auto_577396 ) ) ( not ( = ?auto_577383 ?auto_577397 ) ) ( not ( = ?auto_577383 ?auto_577398 ) ) ( not ( = ?auto_577384 ?auto_577385 ) ) ( not ( = ?auto_577384 ?auto_577386 ) ) ( not ( = ?auto_577384 ?auto_577387 ) ) ( not ( = ?auto_577384 ?auto_577388 ) ) ( not ( = ?auto_577384 ?auto_577389 ) ) ( not ( = ?auto_577384 ?auto_577390 ) ) ( not ( = ?auto_577384 ?auto_577391 ) ) ( not ( = ?auto_577384 ?auto_577392 ) ) ( not ( = ?auto_577384 ?auto_577393 ) ) ( not ( = ?auto_577384 ?auto_577394 ) ) ( not ( = ?auto_577384 ?auto_577395 ) ) ( not ( = ?auto_577384 ?auto_577396 ) ) ( not ( = ?auto_577384 ?auto_577397 ) ) ( not ( = ?auto_577384 ?auto_577398 ) ) ( not ( = ?auto_577385 ?auto_577386 ) ) ( not ( = ?auto_577385 ?auto_577387 ) ) ( not ( = ?auto_577385 ?auto_577388 ) ) ( not ( = ?auto_577385 ?auto_577389 ) ) ( not ( = ?auto_577385 ?auto_577390 ) ) ( not ( = ?auto_577385 ?auto_577391 ) ) ( not ( = ?auto_577385 ?auto_577392 ) ) ( not ( = ?auto_577385 ?auto_577393 ) ) ( not ( = ?auto_577385 ?auto_577394 ) ) ( not ( = ?auto_577385 ?auto_577395 ) ) ( not ( = ?auto_577385 ?auto_577396 ) ) ( not ( = ?auto_577385 ?auto_577397 ) ) ( not ( = ?auto_577385 ?auto_577398 ) ) ( not ( = ?auto_577386 ?auto_577387 ) ) ( not ( = ?auto_577386 ?auto_577388 ) ) ( not ( = ?auto_577386 ?auto_577389 ) ) ( not ( = ?auto_577386 ?auto_577390 ) ) ( not ( = ?auto_577386 ?auto_577391 ) ) ( not ( = ?auto_577386 ?auto_577392 ) ) ( not ( = ?auto_577386 ?auto_577393 ) ) ( not ( = ?auto_577386 ?auto_577394 ) ) ( not ( = ?auto_577386 ?auto_577395 ) ) ( not ( = ?auto_577386 ?auto_577396 ) ) ( not ( = ?auto_577386 ?auto_577397 ) ) ( not ( = ?auto_577386 ?auto_577398 ) ) ( not ( = ?auto_577387 ?auto_577388 ) ) ( not ( = ?auto_577387 ?auto_577389 ) ) ( not ( = ?auto_577387 ?auto_577390 ) ) ( not ( = ?auto_577387 ?auto_577391 ) ) ( not ( = ?auto_577387 ?auto_577392 ) ) ( not ( = ?auto_577387 ?auto_577393 ) ) ( not ( = ?auto_577387 ?auto_577394 ) ) ( not ( = ?auto_577387 ?auto_577395 ) ) ( not ( = ?auto_577387 ?auto_577396 ) ) ( not ( = ?auto_577387 ?auto_577397 ) ) ( not ( = ?auto_577387 ?auto_577398 ) ) ( not ( = ?auto_577388 ?auto_577389 ) ) ( not ( = ?auto_577388 ?auto_577390 ) ) ( not ( = ?auto_577388 ?auto_577391 ) ) ( not ( = ?auto_577388 ?auto_577392 ) ) ( not ( = ?auto_577388 ?auto_577393 ) ) ( not ( = ?auto_577388 ?auto_577394 ) ) ( not ( = ?auto_577388 ?auto_577395 ) ) ( not ( = ?auto_577388 ?auto_577396 ) ) ( not ( = ?auto_577388 ?auto_577397 ) ) ( not ( = ?auto_577388 ?auto_577398 ) ) ( not ( = ?auto_577389 ?auto_577390 ) ) ( not ( = ?auto_577389 ?auto_577391 ) ) ( not ( = ?auto_577389 ?auto_577392 ) ) ( not ( = ?auto_577389 ?auto_577393 ) ) ( not ( = ?auto_577389 ?auto_577394 ) ) ( not ( = ?auto_577389 ?auto_577395 ) ) ( not ( = ?auto_577389 ?auto_577396 ) ) ( not ( = ?auto_577389 ?auto_577397 ) ) ( not ( = ?auto_577389 ?auto_577398 ) ) ( not ( = ?auto_577390 ?auto_577391 ) ) ( not ( = ?auto_577390 ?auto_577392 ) ) ( not ( = ?auto_577390 ?auto_577393 ) ) ( not ( = ?auto_577390 ?auto_577394 ) ) ( not ( = ?auto_577390 ?auto_577395 ) ) ( not ( = ?auto_577390 ?auto_577396 ) ) ( not ( = ?auto_577390 ?auto_577397 ) ) ( not ( = ?auto_577390 ?auto_577398 ) ) ( not ( = ?auto_577391 ?auto_577392 ) ) ( not ( = ?auto_577391 ?auto_577393 ) ) ( not ( = ?auto_577391 ?auto_577394 ) ) ( not ( = ?auto_577391 ?auto_577395 ) ) ( not ( = ?auto_577391 ?auto_577396 ) ) ( not ( = ?auto_577391 ?auto_577397 ) ) ( not ( = ?auto_577391 ?auto_577398 ) ) ( not ( = ?auto_577392 ?auto_577393 ) ) ( not ( = ?auto_577392 ?auto_577394 ) ) ( not ( = ?auto_577392 ?auto_577395 ) ) ( not ( = ?auto_577392 ?auto_577396 ) ) ( not ( = ?auto_577392 ?auto_577397 ) ) ( not ( = ?auto_577392 ?auto_577398 ) ) ( not ( = ?auto_577393 ?auto_577394 ) ) ( not ( = ?auto_577393 ?auto_577395 ) ) ( not ( = ?auto_577393 ?auto_577396 ) ) ( not ( = ?auto_577393 ?auto_577397 ) ) ( not ( = ?auto_577393 ?auto_577398 ) ) ( not ( = ?auto_577394 ?auto_577395 ) ) ( not ( = ?auto_577394 ?auto_577396 ) ) ( not ( = ?auto_577394 ?auto_577397 ) ) ( not ( = ?auto_577394 ?auto_577398 ) ) ( not ( = ?auto_577395 ?auto_577396 ) ) ( not ( = ?auto_577395 ?auto_577397 ) ) ( not ( = ?auto_577395 ?auto_577398 ) ) ( not ( = ?auto_577396 ?auto_577397 ) ) ( not ( = ?auto_577396 ?auto_577398 ) ) ( not ( = ?auto_577397 ?auto_577398 ) ) ( ON ?auto_577396 ?auto_577397 ) ( ON ?auto_577395 ?auto_577396 ) ( ON ?auto_577394 ?auto_577395 ) ( ON ?auto_577393 ?auto_577394 ) ( ON ?auto_577392 ?auto_577393 ) ( ON ?auto_577391 ?auto_577392 ) ( ON ?auto_577390 ?auto_577391 ) ( ON ?auto_577389 ?auto_577390 ) ( CLEAR ?auto_577387 ) ( ON ?auto_577388 ?auto_577389 ) ( CLEAR ?auto_577388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_577382 ?auto_577383 ?auto_577384 ?auto_577385 ?auto_577386 ?auto_577387 ?auto_577388 )
      ( MAKE-16PILE ?auto_577382 ?auto_577383 ?auto_577384 ?auto_577385 ?auto_577386 ?auto_577387 ?auto_577388 ?auto_577389 ?auto_577390 ?auto_577391 ?auto_577392 ?auto_577393 ?auto_577394 ?auto_577395 ?auto_577396 ?auto_577397 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577415 - BLOCK
      ?auto_577416 - BLOCK
      ?auto_577417 - BLOCK
      ?auto_577418 - BLOCK
      ?auto_577419 - BLOCK
      ?auto_577420 - BLOCK
      ?auto_577421 - BLOCK
      ?auto_577422 - BLOCK
      ?auto_577423 - BLOCK
      ?auto_577424 - BLOCK
      ?auto_577425 - BLOCK
      ?auto_577426 - BLOCK
      ?auto_577427 - BLOCK
      ?auto_577428 - BLOCK
      ?auto_577429 - BLOCK
      ?auto_577430 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_577430 ) ( ON-TABLE ?auto_577415 ) ( ON ?auto_577416 ?auto_577415 ) ( ON ?auto_577417 ?auto_577416 ) ( ON ?auto_577418 ?auto_577417 ) ( ON ?auto_577419 ?auto_577418 ) ( ON ?auto_577420 ?auto_577419 ) ( not ( = ?auto_577415 ?auto_577416 ) ) ( not ( = ?auto_577415 ?auto_577417 ) ) ( not ( = ?auto_577415 ?auto_577418 ) ) ( not ( = ?auto_577415 ?auto_577419 ) ) ( not ( = ?auto_577415 ?auto_577420 ) ) ( not ( = ?auto_577415 ?auto_577421 ) ) ( not ( = ?auto_577415 ?auto_577422 ) ) ( not ( = ?auto_577415 ?auto_577423 ) ) ( not ( = ?auto_577415 ?auto_577424 ) ) ( not ( = ?auto_577415 ?auto_577425 ) ) ( not ( = ?auto_577415 ?auto_577426 ) ) ( not ( = ?auto_577415 ?auto_577427 ) ) ( not ( = ?auto_577415 ?auto_577428 ) ) ( not ( = ?auto_577415 ?auto_577429 ) ) ( not ( = ?auto_577415 ?auto_577430 ) ) ( not ( = ?auto_577416 ?auto_577417 ) ) ( not ( = ?auto_577416 ?auto_577418 ) ) ( not ( = ?auto_577416 ?auto_577419 ) ) ( not ( = ?auto_577416 ?auto_577420 ) ) ( not ( = ?auto_577416 ?auto_577421 ) ) ( not ( = ?auto_577416 ?auto_577422 ) ) ( not ( = ?auto_577416 ?auto_577423 ) ) ( not ( = ?auto_577416 ?auto_577424 ) ) ( not ( = ?auto_577416 ?auto_577425 ) ) ( not ( = ?auto_577416 ?auto_577426 ) ) ( not ( = ?auto_577416 ?auto_577427 ) ) ( not ( = ?auto_577416 ?auto_577428 ) ) ( not ( = ?auto_577416 ?auto_577429 ) ) ( not ( = ?auto_577416 ?auto_577430 ) ) ( not ( = ?auto_577417 ?auto_577418 ) ) ( not ( = ?auto_577417 ?auto_577419 ) ) ( not ( = ?auto_577417 ?auto_577420 ) ) ( not ( = ?auto_577417 ?auto_577421 ) ) ( not ( = ?auto_577417 ?auto_577422 ) ) ( not ( = ?auto_577417 ?auto_577423 ) ) ( not ( = ?auto_577417 ?auto_577424 ) ) ( not ( = ?auto_577417 ?auto_577425 ) ) ( not ( = ?auto_577417 ?auto_577426 ) ) ( not ( = ?auto_577417 ?auto_577427 ) ) ( not ( = ?auto_577417 ?auto_577428 ) ) ( not ( = ?auto_577417 ?auto_577429 ) ) ( not ( = ?auto_577417 ?auto_577430 ) ) ( not ( = ?auto_577418 ?auto_577419 ) ) ( not ( = ?auto_577418 ?auto_577420 ) ) ( not ( = ?auto_577418 ?auto_577421 ) ) ( not ( = ?auto_577418 ?auto_577422 ) ) ( not ( = ?auto_577418 ?auto_577423 ) ) ( not ( = ?auto_577418 ?auto_577424 ) ) ( not ( = ?auto_577418 ?auto_577425 ) ) ( not ( = ?auto_577418 ?auto_577426 ) ) ( not ( = ?auto_577418 ?auto_577427 ) ) ( not ( = ?auto_577418 ?auto_577428 ) ) ( not ( = ?auto_577418 ?auto_577429 ) ) ( not ( = ?auto_577418 ?auto_577430 ) ) ( not ( = ?auto_577419 ?auto_577420 ) ) ( not ( = ?auto_577419 ?auto_577421 ) ) ( not ( = ?auto_577419 ?auto_577422 ) ) ( not ( = ?auto_577419 ?auto_577423 ) ) ( not ( = ?auto_577419 ?auto_577424 ) ) ( not ( = ?auto_577419 ?auto_577425 ) ) ( not ( = ?auto_577419 ?auto_577426 ) ) ( not ( = ?auto_577419 ?auto_577427 ) ) ( not ( = ?auto_577419 ?auto_577428 ) ) ( not ( = ?auto_577419 ?auto_577429 ) ) ( not ( = ?auto_577419 ?auto_577430 ) ) ( not ( = ?auto_577420 ?auto_577421 ) ) ( not ( = ?auto_577420 ?auto_577422 ) ) ( not ( = ?auto_577420 ?auto_577423 ) ) ( not ( = ?auto_577420 ?auto_577424 ) ) ( not ( = ?auto_577420 ?auto_577425 ) ) ( not ( = ?auto_577420 ?auto_577426 ) ) ( not ( = ?auto_577420 ?auto_577427 ) ) ( not ( = ?auto_577420 ?auto_577428 ) ) ( not ( = ?auto_577420 ?auto_577429 ) ) ( not ( = ?auto_577420 ?auto_577430 ) ) ( not ( = ?auto_577421 ?auto_577422 ) ) ( not ( = ?auto_577421 ?auto_577423 ) ) ( not ( = ?auto_577421 ?auto_577424 ) ) ( not ( = ?auto_577421 ?auto_577425 ) ) ( not ( = ?auto_577421 ?auto_577426 ) ) ( not ( = ?auto_577421 ?auto_577427 ) ) ( not ( = ?auto_577421 ?auto_577428 ) ) ( not ( = ?auto_577421 ?auto_577429 ) ) ( not ( = ?auto_577421 ?auto_577430 ) ) ( not ( = ?auto_577422 ?auto_577423 ) ) ( not ( = ?auto_577422 ?auto_577424 ) ) ( not ( = ?auto_577422 ?auto_577425 ) ) ( not ( = ?auto_577422 ?auto_577426 ) ) ( not ( = ?auto_577422 ?auto_577427 ) ) ( not ( = ?auto_577422 ?auto_577428 ) ) ( not ( = ?auto_577422 ?auto_577429 ) ) ( not ( = ?auto_577422 ?auto_577430 ) ) ( not ( = ?auto_577423 ?auto_577424 ) ) ( not ( = ?auto_577423 ?auto_577425 ) ) ( not ( = ?auto_577423 ?auto_577426 ) ) ( not ( = ?auto_577423 ?auto_577427 ) ) ( not ( = ?auto_577423 ?auto_577428 ) ) ( not ( = ?auto_577423 ?auto_577429 ) ) ( not ( = ?auto_577423 ?auto_577430 ) ) ( not ( = ?auto_577424 ?auto_577425 ) ) ( not ( = ?auto_577424 ?auto_577426 ) ) ( not ( = ?auto_577424 ?auto_577427 ) ) ( not ( = ?auto_577424 ?auto_577428 ) ) ( not ( = ?auto_577424 ?auto_577429 ) ) ( not ( = ?auto_577424 ?auto_577430 ) ) ( not ( = ?auto_577425 ?auto_577426 ) ) ( not ( = ?auto_577425 ?auto_577427 ) ) ( not ( = ?auto_577425 ?auto_577428 ) ) ( not ( = ?auto_577425 ?auto_577429 ) ) ( not ( = ?auto_577425 ?auto_577430 ) ) ( not ( = ?auto_577426 ?auto_577427 ) ) ( not ( = ?auto_577426 ?auto_577428 ) ) ( not ( = ?auto_577426 ?auto_577429 ) ) ( not ( = ?auto_577426 ?auto_577430 ) ) ( not ( = ?auto_577427 ?auto_577428 ) ) ( not ( = ?auto_577427 ?auto_577429 ) ) ( not ( = ?auto_577427 ?auto_577430 ) ) ( not ( = ?auto_577428 ?auto_577429 ) ) ( not ( = ?auto_577428 ?auto_577430 ) ) ( not ( = ?auto_577429 ?auto_577430 ) ) ( ON ?auto_577429 ?auto_577430 ) ( ON ?auto_577428 ?auto_577429 ) ( ON ?auto_577427 ?auto_577428 ) ( ON ?auto_577426 ?auto_577427 ) ( ON ?auto_577425 ?auto_577426 ) ( ON ?auto_577424 ?auto_577425 ) ( ON ?auto_577423 ?auto_577424 ) ( ON ?auto_577422 ?auto_577423 ) ( CLEAR ?auto_577420 ) ( ON ?auto_577421 ?auto_577422 ) ( CLEAR ?auto_577421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_577415 ?auto_577416 ?auto_577417 ?auto_577418 ?auto_577419 ?auto_577420 ?auto_577421 )
      ( MAKE-16PILE ?auto_577415 ?auto_577416 ?auto_577417 ?auto_577418 ?auto_577419 ?auto_577420 ?auto_577421 ?auto_577422 ?auto_577423 ?auto_577424 ?auto_577425 ?auto_577426 ?auto_577427 ?auto_577428 ?auto_577429 ?auto_577430 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577447 - BLOCK
      ?auto_577448 - BLOCK
      ?auto_577449 - BLOCK
      ?auto_577450 - BLOCK
      ?auto_577451 - BLOCK
      ?auto_577452 - BLOCK
      ?auto_577453 - BLOCK
      ?auto_577454 - BLOCK
      ?auto_577455 - BLOCK
      ?auto_577456 - BLOCK
      ?auto_577457 - BLOCK
      ?auto_577458 - BLOCK
      ?auto_577459 - BLOCK
      ?auto_577460 - BLOCK
      ?auto_577461 - BLOCK
      ?auto_577462 - BLOCK
    )
    :vars
    (
      ?auto_577463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_577462 ?auto_577463 ) ( ON-TABLE ?auto_577447 ) ( ON ?auto_577448 ?auto_577447 ) ( ON ?auto_577449 ?auto_577448 ) ( ON ?auto_577450 ?auto_577449 ) ( ON ?auto_577451 ?auto_577450 ) ( not ( = ?auto_577447 ?auto_577448 ) ) ( not ( = ?auto_577447 ?auto_577449 ) ) ( not ( = ?auto_577447 ?auto_577450 ) ) ( not ( = ?auto_577447 ?auto_577451 ) ) ( not ( = ?auto_577447 ?auto_577452 ) ) ( not ( = ?auto_577447 ?auto_577453 ) ) ( not ( = ?auto_577447 ?auto_577454 ) ) ( not ( = ?auto_577447 ?auto_577455 ) ) ( not ( = ?auto_577447 ?auto_577456 ) ) ( not ( = ?auto_577447 ?auto_577457 ) ) ( not ( = ?auto_577447 ?auto_577458 ) ) ( not ( = ?auto_577447 ?auto_577459 ) ) ( not ( = ?auto_577447 ?auto_577460 ) ) ( not ( = ?auto_577447 ?auto_577461 ) ) ( not ( = ?auto_577447 ?auto_577462 ) ) ( not ( = ?auto_577447 ?auto_577463 ) ) ( not ( = ?auto_577448 ?auto_577449 ) ) ( not ( = ?auto_577448 ?auto_577450 ) ) ( not ( = ?auto_577448 ?auto_577451 ) ) ( not ( = ?auto_577448 ?auto_577452 ) ) ( not ( = ?auto_577448 ?auto_577453 ) ) ( not ( = ?auto_577448 ?auto_577454 ) ) ( not ( = ?auto_577448 ?auto_577455 ) ) ( not ( = ?auto_577448 ?auto_577456 ) ) ( not ( = ?auto_577448 ?auto_577457 ) ) ( not ( = ?auto_577448 ?auto_577458 ) ) ( not ( = ?auto_577448 ?auto_577459 ) ) ( not ( = ?auto_577448 ?auto_577460 ) ) ( not ( = ?auto_577448 ?auto_577461 ) ) ( not ( = ?auto_577448 ?auto_577462 ) ) ( not ( = ?auto_577448 ?auto_577463 ) ) ( not ( = ?auto_577449 ?auto_577450 ) ) ( not ( = ?auto_577449 ?auto_577451 ) ) ( not ( = ?auto_577449 ?auto_577452 ) ) ( not ( = ?auto_577449 ?auto_577453 ) ) ( not ( = ?auto_577449 ?auto_577454 ) ) ( not ( = ?auto_577449 ?auto_577455 ) ) ( not ( = ?auto_577449 ?auto_577456 ) ) ( not ( = ?auto_577449 ?auto_577457 ) ) ( not ( = ?auto_577449 ?auto_577458 ) ) ( not ( = ?auto_577449 ?auto_577459 ) ) ( not ( = ?auto_577449 ?auto_577460 ) ) ( not ( = ?auto_577449 ?auto_577461 ) ) ( not ( = ?auto_577449 ?auto_577462 ) ) ( not ( = ?auto_577449 ?auto_577463 ) ) ( not ( = ?auto_577450 ?auto_577451 ) ) ( not ( = ?auto_577450 ?auto_577452 ) ) ( not ( = ?auto_577450 ?auto_577453 ) ) ( not ( = ?auto_577450 ?auto_577454 ) ) ( not ( = ?auto_577450 ?auto_577455 ) ) ( not ( = ?auto_577450 ?auto_577456 ) ) ( not ( = ?auto_577450 ?auto_577457 ) ) ( not ( = ?auto_577450 ?auto_577458 ) ) ( not ( = ?auto_577450 ?auto_577459 ) ) ( not ( = ?auto_577450 ?auto_577460 ) ) ( not ( = ?auto_577450 ?auto_577461 ) ) ( not ( = ?auto_577450 ?auto_577462 ) ) ( not ( = ?auto_577450 ?auto_577463 ) ) ( not ( = ?auto_577451 ?auto_577452 ) ) ( not ( = ?auto_577451 ?auto_577453 ) ) ( not ( = ?auto_577451 ?auto_577454 ) ) ( not ( = ?auto_577451 ?auto_577455 ) ) ( not ( = ?auto_577451 ?auto_577456 ) ) ( not ( = ?auto_577451 ?auto_577457 ) ) ( not ( = ?auto_577451 ?auto_577458 ) ) ( not ( = ?auto_577451 ?auto_577459 ) ) ( not ( = ?auto_577451 ?auto_577460 ) ) ( not ( = ?auto_577451 ?auto_577461 ) ) ( not ( = ?auto_577451 ?auto_577462 ) ) ( not ( = ?auto_577451 ?auto_577463 ) ) ( not ( = ?auto_577452 ?auto_577453 ) ) ( not ( = ?auto_577452 ?auto_577454 ) ) ( not ( = ?auto_577452 ?auto_577455 ) ) ( not ( = ?auto_577452 ?auto_577456 ) ) ( not ( = ?auto_577452 ?auto_577457 ) ) ( not ( = ?auto_577452 ?auto_577458 ) ) ( not ( = ?auto_577452 ?auto_577459 ) ) ( not ( = ?auto_577452 ?auto_577460 ) ) ( not ( = ?auto_577452 ?auto_577461 ) ) ( not ( = ?auto_577452 ?auto_577462 ) ) ( not ( = ?auto_577452 ?auto_577463 ) ) ( not ( = ?auto_577453 ?auto_577454 ) ) ( not ( = ?auto_577453 ?auto_577455 ) ) ( not ( = ?auto_577453 ?auto_577456 ) ) ( not ( = ?auto_577453 ?auto_577457 ) ) ( not ( = ?auto_577453 ?auto_577458 ) ) ( not ( = ?auto_577453 ?auto_577459 ) ) ( not ( = ?auto_577453 ?auto_577460 ) ) ( not ( = ?auto_577453 ?auto_577461 ) ) ( not ( = ?auto_577453 ?auto_577462 ) ) ( not ( = ?auto_577453 ?auto_577463 ) ) ( not ( = ?auto_577454 ?auto_577455 ) ) ( not ( = ?auto_577454 ?auto_577456 ) ) ( not ( = ?auto_577454 ?auto_577457 ) ) ( not ( = ?auto_577454 ?auto_577458 ) ) ( not ( = ?auto_577454 ?auto_577459 ) ) ( not ( = ?auto_577454 ?auto_577460 ) ) ( not ( = ?auto_577454 ?auto_577461 ) ) ( not ( = ?auto_577454 ?auto_577462 ) ) ( not ( = ?auto_577454 ?auto_577463 ) ) ( not ( = ?auto_577455 ?auto_577456 ) ) ( not ( = ?auto_577455 ?auto_577457 ) ) ( not ( = ?auto_577455 ?auto_577458 ) ) ( not ( = ?auto_577455 ?auto_577459 ) ) ( not ( = ?auto_577455 ?auto_577460 ) ) ( not ( = ?auto_577455 ?auto_577461 ) ) ( not ( = ?auto_577455 ?auto_577462 ) ) ( not ( = ?auto_577455 ?auto_577463 ) ) ( not ( = ?auto_577456 ?auto_577457 ) ) ( not ( = ?auto_577456 ?auto_577458 ) ) ( not ( = ?auto_577456 ?auto_577459 ) ) ( not ( = ?auto_577456 ?auto_577460 ) ) ( not ( = ?auto_577456 ?auto_577461 ) ) ( not ( = ?auto_577456 ?auto_577462 ) ) ( not ( = ?auto_577456 ?auto_577463 ) ) ( not ( = ?auto_577457 ?auto_577458 ) ) ( not ( = ?auto_577457 ?auto_577459 ) ) ( not ( = ?auto_577457 ?auto_577460 ) ) ( not ( = ?auto_577457 ?auto_577461 ) ) ( not ( = ?auto_577457 ?auto_577462 ) ) ( not ( = ?auto_577457 ?auto_577463 ) ) ( not ( = ?auto_577458 ?auto_577459 ) ) ( not ( = ?auto_577458 ?auto_577460 ) ) ( not ( = ?auto_577458 ?auto_577461 ) ) ( not ( = ?auto_577458 ?auto_577462 ) ) ( not ( = ?auto_577458 ?auto_577463 ) ) ( not ( = ?auto_577459 ?auto_577460 ) ) ( not ( = ?auto_577459 ?auto_577461 ) ) ( not ( = ?auto_577459 ?auto_577462 ) ) ( not ( = ?auto_577459 ?auto_577463 ) ) ( not ( = ?auto_577460 ?auto_577461 ) ) ( not ( = ?auto_577460 ?auto_577462 ) ) ( not ( = ?auto_577460 ?auto_577463 ) ) ( not ( = ?auto_577461 ?auto_577462 ) ) ( not ( = ?auto_577461 ?auto_577463 ) ) ( not ( = ?auto_577462 ?auto_577463 ) ) ( ON ?auto_577461 ?auto_577462 ) ( ON ?auto_577460 ?auto_577461 ) ( ON ?auto_577459 ?auto_577460 ) ( ON ?auto_577458 ?auto_577459 ) ( ON ?auto_577457 ?auto_577458 ) ( ON ?auto_577456 ?auto_577457 ) ( ON ?auto_577455 ?auto_577456 ) ( ON ?auto_577454 ?auto_577455 ) ( ON ?auto_577453 ?auto_577454 ) ( CLEAR ?auto_577451 ) ( ON ?auto_577452 ?auto_577453 ) ( CLEAR ?auto_577452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_577447 ?auto_577448 ?auto_577449 ?auto_577450 ?auto_577451 ?auto_577452 )
      ( MAKE-16PILE ?auto_577447 ?auto_577448 ?auto_577449 ?auto_577450 ?auto_577451 ?auto_577452 ?auto_577453 ?auto_577454 ?auto_577455 ?auto_577456 ?auto_577457 ?auto_577458 ?auto_577459 ?auto_577460 ?auto_577461 ?auto_577462 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577480 - BLOCK
      ?auto_577481 - BLOCK
      ?auto_577482 - BLOCK
      ?auto_577483 - BLOCK
      ?auto_577484 - BLOCK
      ?auto_577485 - BLOCK
      ?auto_577486 - BLOCK
      ?auto_577487 - BLOCK
      ?auto_577488 - BLOCK
      ?auto_577489 - BLOCK
      ?auto_577490 - BLOCK
      ?auto_577491 - BLOCK
      ?auto_577492 - BLOCK
      ?auto_577493 - BLOCK
      ?auto_577494 - BLOCK
      ?auto_577495 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_577495 ) ( ON-TABLE ?auto_577480 ) ( ON ?auto_577481 ?auto_577480 ) ( ON ?auto_577482 ?auto_577481 ) ( ON ?auto_577483 ?auto_577482 ) ( ON ?auto_577484 ?auto_577483 ) ( not ( = ?auto_577480 ?auto_577481 ) ) ( not ( = ?auto_577480 ?auto_577482 ) ) ( not ( = ?auto_577480 ?auto_577483 ) ) ( not ( = ?auto_577480 ?auto_577484 ) ) ( not ( = ?auto_577480 ?auto_577485 ) ) ( not ( = ?auto_577480 ?auto_577486 ) ) ( not ( = ?auto_577480 ?auto_577487 ) ) ( not ( = ?auto_577480 ?auto_577488 ) ) ( not ( = ?auto_577480 ?auto_577489 ) ) ( not ( = ?auto_577480 ?auto_577490 ) ) ( not ( = ?auto_577480 ?auto_577491 ) ) ( not ( = ?auto_577480 ?auto_577492 ) ) ( not ( = ?auto_577480 ?auto_577493 ) ) ( not ( = ?auto_577480 ?auto_577494 ) ) ( not ( = ?auto_577480 ?auto_577495 ) ) ( not ( = ?auto_577481 ?auto_577482 ) ) ( not ( = ?auto_577481 ?auto_577483 ) ) ( not ( = ?auto_577481 ?auto_577484 ) ) ( not ( = ?auto_577481 ?auto_577485 ) ) ( not ( = ?auto_577481 ?auto_577486 ) ) ( not ( = ?auto_577481 ?auto_577487 ) ) ( not ( = ?auto_577481 ?auto_577488 ) ) ( not ( = ?auto_577481 ?auto_577489 ) ) ( not ( = ?auto_577481 ?auto_577490 ) ) ( not ( = ?auto_577481 ?auto_577491 ) ) ( not ( = ?auto_577481 ?auto_577492 ) ) ( not ( = ?auto_577481 ?auto_577493 ) ) ( not ( = ?auto_577481 ?auto_577494 ) ) ( not ( = ?auto_577481 ?auto_577495 ) ) ( not ( = ?auto_577482 ?auto_577483 ) ) ( not ( = ?auto_577482 ?auto_577484 ) ) ( not ( = ?auto_577482 ?auto_577485 ) ) ( not ( = ?auto_577482 ?auto_577486 ) ) ( not ( = ?auto_577482 ?auto_577487 ) ) ( not ( = ?auto_577482 ?auto_577488 ) ) ( not ( = ?auto_577482 ?auto_577489 ) ) ( not ( = ?auto_577482 ?auto_577490 ) ) ( not ( = ?auto_577482 ?auto_577491 ) ) ( not ( = ?auto_577482 ?auto_577492 ) ) ( not ( = ?auto_577482 ?auto_577493 ) ) ( not ( = ?auto_577482 ?auto_577494 ) ) ( not ( = ?auto_577482 ?auto_577495 ) ) ( not ( = ?auto_577483 ?auto_577484 ) ) ( not ( = ?auto_577483 ?auto_577485 ) ) ( not ( = ?auto_577483 ?auto_577486 ) ) ( not ( = ?auto_577483 ?auto_577487 ) ) ( not ( = ?auto_577483 ?auto_577488 ) ) ( not ( = ?auto_577483 ?auto_577489 ) ) ( not ( = ?auto_577483 ?auto_577490 ) ) ( not ( = ?auto_577483 ?auto_577491 ) ) ( not ( = ?auto_577483 ?auto_577492 ) ) ( not ( = ?auto_577483 ?auto_577493 ) ) ( not ( = ?auto_577483 ?auto_577494 ) ) ( not ( = ?auto_577483 ?auto_577495 ) ) ( not ( = ?auto_577484 ?auto_577485 ) ) ( not ( = ?auto_577484 ?auto_577486 ) ) ( not ( = ?auto_577484 ?auto_577487 ) ) ( not ( = ?auto_577484 ?auto_577488 ) ) ( not ( = ?auto_577484 ?auto_577489 ) ) ( not ( = ?auto_577484 ?auto_577490 ) ) ( not ( = ?auto_577484 ?auto_577491 ) ) ( not ( = ?auto_577484 ?auto_577492 ) ) ( not ( = ?auto_577484 ?auto_577493 ) ) ( not ( = ?auto_577484 ?auto_577494 ) ) ( not ( = ?auto_577484 ?auto_577495 ) ) ( not ( = ?auto_577485 ?auto_577486 ) ) ( not ( = ?auto_577485 ?auto_577487 ) ) ( not ( = ?auto_577485 ?auto_577488 ) ) ( not ( = ?auto_577485 ?auto_577489 ) ) ( not ( = ?auto_577485 ?auto_577490 ) ) ( not ( = ?auto_577485 ?auto_577491 ) ) ( not ( = ?auto_577485 ?auto_577492 ) ) ( not ( = ?auto_577485 ?auto_577493 ) ) ( not ( = ?auto_577485 ?auto_577494 ) ) ( not ( = ?auto_577485 ?auto_577495 ) ) ( not ( = ?auto_577486 ?auto_577487 ) ) ( not ( = ?auto_577486 ?auto_577488 ) ) ( not ( = ?auto_577486 ?auto_577489 ) ) ( not ( = ?auto_577486 ?auto_577490 ) ) ( not ( = ?auto_577486 ?auto_577491 ) ) ( not ( = ?auto_577486 ?auto_577492 ) ) ( not ( = ?auto_577486 ?auto_577493 ) ) ( not ( = ?auto_577486 ?auto_577494 ) ) ( not ( = ?auto_577486 ?auto_577495 ) ) ( not ( = ?auto_577487 ?auto_577488 ) ) ( not ( = ?auto_577487 ?auto_577489 ) ) ( not ( = ?auto_577487 ?auto_577490 ) ) ( not ( = ?auto_577487 ?auto_577491 ) ) ( not ( = ?auto_577487 ?auto_577492 ) ) ( not ( = ?auto_577487 ?auto_577493 ) ) ( not ( = ?auto_577487 ?auto_577494 ) ) ( not ( = ?auto_577487 ?auto_577495 ) ) ( not ( = ?auto_577488 ?auto_577489 ) ) ( not ( = ?auto_577488 ?auto_577490 ) ) ( not ( = ?auto_577488 ?auto_577491 ) ) ( not ( = ?auto_577488 ?auto_577492 ) ) ( not ( = ?auto_577488 ?auto_577493 ) ) ( not ( = ?auto_577488 ?auto_577494 ) ) ( not ( = ?auto_577488 ?auto_577495 ) ) ( not ( = ?auto_577489 ?auto_577490 ) ) ( not ( = ?auto_577489 ?auto_577491 ) ) ( not ( = ?auto_577489 ?auto_577492 ) ) ( not ( = ?auto_577489 ?auto_577493 ) ) ( not ( = ?auto_577489 ?auto_577494 ) ) ( not ( = ?auto_577489 ?auto_577495 ) ) ( not ( = ?auto_577490 ?auto_577491 ) ) ( not ( = ?auto_577490 ?auto_577492 ) ) ( not ( = ?auto_577490 ?auto_577493 ) ) ( not ( = ?auto_577490 ?auto_577494 ) ) ( not ( = ?auto_577490 ?auto_577495 ) ) ( not ( = ?auto_577491 ?auto_577492 ) ) ( not ( = ?auto_577491 ?auto_577493 ) ) ( not ( = ?auto_577491 ?auto_577494 ) ) ( not ( = ?auto_577491 ?auto_577495 ) ) ( not ( = ?auto_577492 ?auto_577493 ) ) ( not ( = ?auto_577492 ?auto_577494 ) ) ( not ( = ?auto_577492 ?auto_577495 ) ) ( not ( = ?auto_577493 ?auto_577494 ) ) ( not ( = ?auto_577493 ?auto_577495 ) ) ( not ( = ?auto_577494 ?auto_577495 ) ) ( ON ?auto_577494 ?auto_577495 ) ( ON ?auto_577493 ?auto_577494 ) ( ON ?auto_577492 ?auto_577493 ) ( ON ?auto_577491 ?auto_577492 ) ( ON ?auto_577490 ?auto_577491 ) ( ON ?auto_577489 ?auto_577490 ) ( ON ?auto_577488 ?auto_577489 ) ( ON ?auto_577487 ?auto_577488 ) ( ON ?auto_577486 ?auto_577487 ) ( CLEAR ?auto_577484 ) ( ON ?auto_577485 ?auto_577486 ) ( CLEAR ?auto_577485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_577480 ?auto_577481 ?auto_577482 ?auto_577483 ?auto_577484 ?auto_577485 )
      ( MAKE-16PILE ?auto_577480 ?auto_577481 ?auto_577482 ?auto_577483 ?auto_577484 ?auto_577485 ?auto_577486 ?auto_577487 ?auto_577488 ?auto_577489 ?auto_577490 ?auto_577491 ?auto_577492 ?auto_577493 ?auto_577494 ?auto_577495 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577512 - BLOCK
      ?auto_577513 - BLOCK
      ?auto_577514 - BLOCK
      ?auto_577515 - BLOCK
      ?auto_577516 - BLOCK
      ?auto_577517 - BLOCK
      ?auto_577518 - BLOCK
      ?auto_577519 - BLOCK
      ?auto_577520 - BLOCK
      ?auto_577521 - BLOCK
      ?auto_577522 - BLOCK
      ?auto_577523 - BLOCK
      ?auto_577524 - BLOCK
      ?auto_577525 - BLOCK
      ?auto_577526 - BLOCK
      ?auto_577527 - BLOCK
    )
    :vars
    (
      ?auto_577528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_577527 ?auto_577528 ) ( ON-TABLE ?auto_577512 ) ( ON ?auto_577513 ?auto_577512 ) ( ON ?auto_577514 ?auto_577513 ) ( ON ?auto_577515 ?auto_577514 ) ( not ( = ?auto_577512 ?auto_577513 ) ) ( not ( = ?auto_577512 ?auto_577514 ) ) ( not ( = ?auto_577512 ?auto_577515 ) ) ( not ( = ?auto_577512 ?auto_577516 ) ) ( not ( = ?auto_577512 ?auto_577517 ) ) ( not ( = ?auto_577512 ?auto_577518 ) ) ( not ( = ?auto_577512 ?auto_577519 ) ) ( not ( = ?auto_577512 ?auto_577520 ) ) ( not ( = ?auto_577512 ?auto_577521 ) ) ( not ( = ?auto_577512 ?auto_577522 ) ) ( not ( = ?auto_577512 ?auto_577523 ) ) ( not ( = ?auto_577512 ?auto_577524 ) ) ( not ( = ?auto_577512 ?auto_577525 ) ) ( not ( = ?auto_577512 ?auto_577526 ) ) ( not ( = ?auto_577512 ?auto_577527 ) ) ( not ( = ?auto_577512 ?auto_577528 ) ) ( not ( = ?auto_577513 ?auto_577514 ) ) ( not ( = ?auto_577513 ?auto_577515 ) ) ( not ( = ?auto_577513 ?auto_577516 ) ) ( not ( = ?auto_577513 ?auto_577517 ) ) ( not ( = ?auto_577513 ?auto_577518 ) ) ( not ( = ?auto_577513 ?auto_577519 ) ) ( not ( = ?auto_577513 ?auto_577520 ) ) ( not ( = ?auto_577513 ?auto_577521 ) ) ( not ( = ?auto_577513 ?auto_577522 ) ) ( not ( = ?auto_577513 ?auto_577523 ) ) ( not ( = ?auto_577513 ?auto_577524 ) ) ( not ( = ?auto_577513 ?auto_577525 ) ) ( not ( = ?auto_577513 ?auto_577526 ) ) ( not ( = ?auto_577513 ?auto_577527 ) ) ( not ( = ?auto_577513 ?auto_577528 ) ) ( not ( = ?auto_577514 ?auto_577515 ) ) ( not ( = ?auto_577514 ?auto_577516 ) ) ( not ( = ?auto_577514 ?auto_577517 ) ) ( not ( = ?auto_577514 ?auto_577518 ) ) ( not ( = ?auto_577514 ?auto_577519 ) ) ( not ( = ?auto_577514 ?auto_577520 ) ) ( not ( = ?auto_577514 ?auto_577521 ) ) ( not ( = ?auto_577514 ?auto_577522 ) ) ( not ( = ?auto_577514 ?auto_577523 ) ) ( not ( = ?auto_577514 ?auto_577524 ) ) ( not ( = ?auto_577514 ?auto_577525 ) ) ( not ( = ?auto_577514 ?auto_577526 ) ) ( not ( = ?auto_577514 ?auto_577527 ) ) ( not ( = ?auto_577514 ?auto_577528 ) ) ( not ( = ?auto_577515 ?auto_577516 ) ) ( not ( = ?auto_577515 ?auto_577517 ) ) ( not ( = ?auto_577515 ?auto_577518 ) ) ( not ( = ?auto_577515 ?auto_577519 ) ) ( not ( = ?auto_577515 ?auto_577520 ) ) ( not ( = ?auto_577515 ?auto_577521 ) ) ( not ( = ?auto_577515 ?auto_577522 ) ) ( not ( = ?auto_577515 ?auto_577523 ) ) ( not ( = ?auto_577515 ?auto_577524 ) ) ( not ( = ?auto_577515 ?auto_577525 ) ) ( not ( = ?auto_577515 ?auto_577526 ) ) ( not ( = ?auto_577515 ?auto_577527 ) ) ( not ( = ?auto_577515 ?auto_577528 ) ) ( not ( = ?auto_577516 ?auto_577517 ) ) ( not ( = ?auto_577516 ?auto_577518 ) ) ( not ( = ?auto_577516 ?auto_577519 ) ) ( not ( = ?auto_577516 ?auto_577520 ) ) ( not ( = ?auto_577516 ?auto_577521 ) ) ( not ( = ?auto_577516 ?auto_577522 ) ) ( not ( = ?auto_577516 ?auto_577523 ) ) ( not ( = ?auto_577516 ?auto_577524 ) ) ( not ( = ?auto_577516 ?auto_577525 ) ) ( not ( = ?auto_577516 ?auto_577526 ) ) ( not ( = ?auto_577516 ?auto_577527 ) ) ( not ( = ?auto_577516 ?auto_577528 ) ) ( not ( = ?auto_577517 ?auto_577518 ) ) ( not ( = ?auto_577517 ?auto_577519 ) ) ( not ( = ?auto_577517 ?auto_577520 ) ) ( not ( = ?auto_577517 ?auto_577521 ) ) ( not ( = ?auto_577517 ?auto_577522 ) ) ( not ( = ?auto_577517 ?auto_577523 ) ) ( not ( = ?auto_577517 ?auto_577524 ) ) ( not ( = ?auto_577517 ?auto_577525 ) ) ( not ( = ?auto_577517 ?auto_577526 ) ) ( not ( = ?auto_577517 ?auto_577527 ) ) ( not ( = ?auto_577517 ?auto_577528 ) ) ( not ( = ?auto_577518 ?auto_577519 ) ) ( not ( = ?auto_577518 ?auto_577520 ) ) ( not ( = ?auto_577518 ?auto_577521 ) ) ( not ( = ?auto_577518 ?auto_577522 ) ) ( not ( = ?auto_577518 ?auto_577523 ) ) ( not ( = ?auto_577518 ?auto_577524 ) ) ( not ( = ?auto_577518 ?auto_577525 ) ) ( not ( = ?auto_577518 ?auto_577526 ) ) ( not ( = ?auto_577518 ?auto_577527 ) ) ( not ( = ?auto_577518 ?auto_577528 ) ) ( not ( = ?auto_577519 ?auto_577520 ) ) ( not ( = ?auto_577519 ?auto_577521 ) ) ( not ( = ?auto_577519 ?auto_577522 ) ) ( not ( = ?auto_577519 ?auto_577523 ) ) ( not ( = ?auto_577519 ?auto_577524 ) ) ( not ( = ?auto_577519 ?auto_577525 ) ) ( not ( = ?auto_577519 ?auto_577526 ) ) ( not ( = ?auto_577519 ?auto_577527 ) ) ( not ( = ?auto_577519 ?auto_577528 ) ) ( not ( = ?auto_577520 ?auto_577521 ) ) ( not ( = ?auto_577520 ?auto_577522 ) ) ( not ( = ?auto_577520 ?auto_577523 ) ) ( not ( = ?auto_577520 ?auto_577524 ) ) ( not ( = ?auto_577520 ?auto_577525 ) ) ( not ( = ?auto_577520 ?auto_577526 ) ) ( not ( = ?auto_577520 ?auto_577527 ) ) ( not ( = ?auto_577520 ?auto_577528 ) ) ( not ( = ?auto_577521 ?auto_577522 ) ) ( not ( = ?auto_577521 ?auto_577523 ) ) ( not ( = ?auto_577521 ?auto_577524 ) ) ( not ( = ?auto_577521 ?auto_577525 ) ) ( not ( = ?auto_577521 ?auto_577526 ) ) ( not ( = ?auto_577521 ?auto_577527 ) ) ( not ( = ?auto_577521 ?auto_577528 ) ) ( not ( = ?auto_577522 ?auto_577523 ) ) ( not ( = ?auto_577522 ?auto_577524 ) ) ( not ( = ?auto_577522 ?auto_577525 ) ) ( not ( = ?auto_577522 ?auto_577526 ) ) ( not ( = ?auto_577522 ?auto_577527 ) ) ( not ( = ?auto_577522 ?auto_577528 ) ) ( not ( = ?auto_577523 ?auto_577524 ) ) ( not ( = ?auto_577523 ?auto_577525 ) ) ( not ( = ?auto_577523 ?auto_577526 ) ) ( not ( = ?auto_577523 ?auto_577527 ) ) ( not ( = ?auto_577523 ?auto_577528 ) ) ( not ( = ?auto_577524 ?auto_577525 ) ) ( not ( = ?auto_577524 ?auto_577526 ) ) ( not ( = ?auto_577524 ?auto_577527 ) ) ( not ( = ?auto_577524 ?auto_577528 ) ) ( not ( = ?auto_577525 ?auto_577526 ) ) ( not ( = ?auto_577525 ?auto_577527 ) ) ( not ( = ?auto_577525 ?auto_577528 ) ) ( not ( = ?auto_577526 ?auto_577527 ) ) ( not ( = ?auto_577526 ?auto_577528 ) ) ( not ( = ?auto_577527 ?auto_577528 ) ) ( ON ?auto_577526 ?auto_577527 ) ( ON ?auto_577525 ?auto_577526 ) ( ON ?auto_577524 ?auto_577525 ) ( ON ?auto_577523 ?auto_577524 ) ( ON ?auto_577522 ?auto_577523 ) ( ON ?auto_577521 ?auto_577522 ) ( ON ?auto_577520 ?auto_577521 ) ( ON ?auto_577519 ?auto_577520 ) ( ON ?auto_577518 ?auto_577519 ) ( ON ?auto_577517 ?auto_577518 ) ( CLEAR ?auto_577515 ) ( ON ?auto_577516 ?auto_577517 ) ( CLEAR ?auto_577516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_577512 ?auto_577513 ?auto_577514 ?auto_577515 ?auto_577516 )
      ( MAKE-16PILE ?auto_577512 ?auto_577513 ?auto_577514 ?auto_577515 ?auto_577516 ?auto_577517 ?auto_577518 ?auto_577519 ?auto_577520 ?auto_577521 ?auto_577522 ?auto_577523 ?auto_577524 ?auto_577525 ?auto_577526 ?auto_577527 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577545 - BLOCK
      ?auto_577546 - BLOCK
      ?auto_577547 - BLOCK
      ?auto_577548 - BLOCK
      ?auto_577549 - BLOCK
      ?auto_577550 - BLOCK
      ?auto_577551 - BLOCK
      ?auto_577552 - BLOCK
      ?auto_577553 - BLOCK
      ?auto_577554 - BLOCK
      ?auto_577555 - BLOCK
      ?auto_577556 - BLOCK
      ?auto_577557 - BLOCK
      ?auto_577558 - BLOCK
      ?auto_577559 - BLOCK
      ?auto_577560 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_577560 ) ( ON-TABLE ?auto_577545 ) ( ON ?auto_577546 ?auto_577545 ) ( ON ?auto_577547 ?auto_577546 ) ( ON ?auto_577548 ?auto_577547 ) ( not ( = ?auto_577545 ?auto_577546 ) ) ( not ( = ?auto_577545 ?auto_577547 ) ) ( not ( = ?auto_577545 ?auto_577548 ) ) ( not ( = ?auto_577545 ?auto_577549 ) ) ( not ( = ?auto_577545 ?auto_577550 ) ) ( not ( = ?auto_577545 ?auto_577551 ) ) ( not ( = ?auto_577545 ?auto_577552 ) ) ( not ( = ?auto_577545 ?auto_577553 ) ) ( not ( = ?auto_577545 ?auto_577554 ) ) ( not ( = ?auto_577545 ?auto_577555 ) ) ( not ( = ?auto_577545 ?auto_577556 ) ) ( not ( = ?auto_577545 ?auto_577557 ) ) ( not ( = ?auto_577545 ?auto_577558 ) ) ( not ( = ?auto_577545 ?auto_577559 ) ) ( not ( = ?auto_577545 ?auto_577560 ) ) ( not ( = ?auto_577546 ?auto_577547 ) ) ( not ( = ?auto_577546 ?auto_577548 ) ) ( not ( = ?auto_577546 ?auto_577549 ) ) ( not ( = ?auto_577546 ?auto_577550 ) ) ( not ( = ?auto_577546 ?auto_577551 ) ) ( not ( = ?auto_577546 ?auto_577552 ) ) ( not ( = ?auto_577546 ?auto_577553 ) ) ( not ( = ?auto_577546 ?auto_577554 ) ) ( not ( = ?auto_577546 ?auto_577555 ) ) ( not ( = ?auto_577546 ?auto_577556 ) ) ( not ( = ?auto_577546 ?auto_577557 ) ) ( not ( = ?auto_577546 ?auto_577558 ) ) ( not ( = ?auto_577546 ?auto_577559 ) ) ( not ( = ?auto_577546 ?auto_577560 ) ) ( not ( = ?auto_577547 ?auto_577548 ) ) ( not ( = ?auto_577547 ?auto_577549 ) ) ( not ( = ?auto_577547 ?auto_577550 ) ) ( not ( = ?auto_577547 ?auto_577551 ) ) ( not ( = ?auto_577547 ?auto_577552 ) ) ( not ( = ?auto_577547 ?auto_577553 ) ) ( not ( = ?auto_577547 ?auto_577554 ) ) ( not ( = ?auto_577547 ?auto_577555 ) ) ( not ( = ?auto_577547 ?auto_577556 ) ) ( not ( = ?auto_577547 ?auto_577557 ) ) ( not ( = ?auto_577547 ?auto_577558 ) ) ( not ( = ?auto_577547 ?auto_577559 ) ) ( not ( = ?auto_577547 ?auto_577560 ) ) ( not ( = ?auto_577548 ?auto_577549 ) ) ( not ( = ?auto_577548 ?auto_577550 ) ) ( not ( = ?auto_577548 ?auto_577551 ) ) ( not ( = ?auto_577548 ?auto_577552 ) ) ( not ( = ?auto_577548 ?auto_577553 ) ) ( not ( = ?auto_577548 ?auto_577554 ) ) ( not ( = ?auto_577548 ?auto_577555 ) ) ( not ( = ?auto_577548 ?auto_577556 ) ) ( not ( = ?auto_577548 ?auto_577557 ) ) ( not ( = ?auto_577548 ?auto_577558 ) ) ( not ( = ?auto_577548 ?auto_577559 ) ) ( not ( = ?auto_577548 ?auto_577560 ) ) ( not ( = ?auto_577549 ?auto_577550 ) ) ( not ( = ?auto_577549 ?auto_577551 ) ) ( not ( = ?auto_577549 ?auto_577552 ) ) ( not ( = ?auto_577549 ?auto_577553 ) ) ( not ( = ?auto_577549 ?auto_577554 ) ) ( not ( = ?auto_577549 ?auto_577555 ) ) ( not ( = ?auto_577549 ?auto_577556 ) ) ( not ( = ?auto_577549 ?auto_577557 ) ) ( not ( = ?auto_577549 ?auto_577558 ) ) ( not ( = ?auto_577549 ?auto_577559 ) ) ( not ( = ?auto_577549 ?auto_577560 ) ) ( not ( = ?auto_577550 ?auto_577551 ) ) ( not ( = ?auto_577550 ?auto_577552 ) ) ( not ( = ?auto_577550 ?auto_577553 ) ) ( not ( = ?auto_577550 ?auto_577554 ) ) ( not ( = ?auto_577550 ?auto_577555 ) ) ( not ( = ?auto_577550 ?auto_577556 ) ) ( not ( = ?auto_577550 ?auto_577557 ) ) ( not ( = ?auto_577550 ?auto_577558 ) ) ( not ( = ?auto_577550 ?auto_577559 ) ) ( not ( = ?auto_577550 ?auto_577560 ) ) ( not ( = ?auto_577551 ?auto_577552 ) ) ( not ( = ?auto_577551 ?auto_577553 ) ) ( not ( = ?auto_577551 ?auto_577554 ) ) ( not ( = ?auto_577551 ?auto_577555 ) ) ( not ( = ?auto_577551 ?auto_577556 ) ) ( not ( = ?auto_577551 ?auto_577557 ) ) ( not ( = ?auto_577551 ?auto_577558 ) ) ( not ( = ?auto_577551 ?auto_577559 ) ) ( not ( = ?auto_577551 ?auto_577560 ) ) ( not ( = ?auto_577552 ?auto_577553 ) ) ( not ( = ?auto_577552 ?auto_577554 ) ) ( not ( = ?auto_577552 ?auto_577555 ) ) ( not ( = ?auto_577552 ?auto_577556 ) ) ( not ( = ?auto_577552 ?auto_577557 ) ) ( not ( = ?auto_577552 ?auto_577558 ) ) ( not ( = ?auto_577552 ?auto_577559 ) ) ( not ( = ?auto_577552 ?auto_577560 ) ) ( not ( = ?auto_577553 ?auto_577554 ) ) ( not ( = ?auto_577553 ?auto_577555 ) ) ( not ( = ?auto_577553 ?auto_577556 ) ) ( not ( = ?auto_577553 ?auto_577557 ) ) ( not ( = ?auto_577553 ?auto_577558 ) ) ( not ( = ?auto_577553 ?auto_577559 ) ) ( not ( = ?auto_577553 ?auto_577560 ) ) ( not ( = ?auto_577554 ?auto_577555 ) ) ( not ( = ?auto_577554 ?auto_577556 ) ) ( not ( = ?auto_577554 ?auto_577557 ) ) ( not ( = ?auto_577554 ?auto_577558 ) ) ( not ( = ?auto_577554 ?auto_577559 ) ) ( not ( = ?auto_577554 ?auto_577560 ) ) ( not ( = ?auto_577555 ?auto_577556 ) ) ( not ( = ?auto_577555 ?auto_577557 ) ) ( not ( = ?auto_577555 ?auto_577558 ) ) ( not ( = ?auto_577555 ?auto_577559 ) ) ( not ( = ?auto_577555 ?auto_577560 ) ) ( not ( = ?auto_577556 ?auto_577557 ) ) ( not ( = ?auto_577556 ?auto_577558 ) ) ( not ( = ?auto_577556 ?auto_577559 ) ) ( not ( = ?auto_577556 ?auto_577560 ) ) ( not ( = ?auto_577557 ?auto_577558 ) ) ( not ( = ?auto_577557 ?auto_577559 ) ) ( not ( = ?auto_577557 ?auto_577560 ) ) ( not ( = ?auto_577558 ?auto_577559 ) ) ( not ( = ?auto_577558 ?auto_577560 ) ) ( not ( = ?auto_577559 ?auto_577560 ) ) ( ON ?auto_577559 ?auto_577560 ) ( ON ?auto_577558 ?auto_577559 ) ( ON ?auto_577557 ?auto_577558 ) ( ON ?auto_577556 ?auto_577557 ) ( ON ?auto_577555 ?auto_577556 ) ( ON ?auto_577554 ?auto_577555 ) ( ON ?auto_577553 ?auto_577554 ) ( ON ?auto_577552 ?auto_577553 ) ( ON ?auto_577551 ?auto_577552 ) ( ON ?auto_577550 ?auto_577551 ) ( CLEAR ?auto_577548 ) ( ON ?auto_577549 ?auto_577550 ) ( CLEAR ?auto_577549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_577545 ?auto_577546 ?auto_577547 ?auto_577548 ?auto_577549 )
      ( MAKE-16PILE ?auto_577545 ?auto_577546 ?auto_577547 ?auto_577548 ?auto_577549 ?auto_577550 ?auto_577551 ?auto_577552 ?auto_577553 ?auto_577554 ?auto_577555 ?auto_577556 ?auto_577557 ?auto_577558 ?auto_577559 ?auto_577560 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577577 - BLOCK
      ?auto_577578 - BLOCK
      ?auto_577579 - BLOCK
      ?auto_577580 - BLOCK
      ?auto_577581 - BLOCK
      ?auto_577582 - BLOCK
      ?auto_577583 - BLOCK
      ?auto_577584 - BLOCK
      ?auto_577585 - BLOCK
      ?auto_577586 - BLOCK
      ?auto_577587 - BLOCK
      ?auto_577588 - BLOCK
      ?auto_577589 - BLOCK
      ?auto_577590 - BLOCK
      ?auto_577591 - BLOCK
      ?auto_577592 - BLOCK
    )
    :vars
    (
      ?auto_577593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_577592 ?auto_577593 ) ( ON-TABLE ?auto_577577 ) ( ON ?auto_577578 ?auto_577577 ) ( ON ?auto_577579 ?auto_577578 ) ( not ( = ?auto_577577 ?auto_577578 ) ) ( not ( = ?auto_577577 ?auto_577579 ) ) ( not ( = ?auto_577577 ?auto_577580 ) ) ( not ( = ?auto_577577 ?auto_577581 ) ) ( not ( = ?auto_577577 ?auto_577582 ) ) ( not ( = ?auto_577577 ?auto_577583 ) ) ( not ( = ?auto_577577 ?auto_577584 ) ) ( not ( = ?auto_577577 ?auto_577585 ) ) ( not ( = ?auto_577577 ?auto_577586 ) ) ( not ( = ?auto_577577 ?auto_577587 ) ) ( not ( = ?auto_577577 ?auto_577588 ) ) ( not ( = ?auto_577577 ?auto_577589 ) ) ( not ( = ?auto_577577 ?auto_577590 ) ) ( not ( = ?auto_577577 ?auto_577591 ) ) ( not ( = ?auto_577577 ?auto_577592 ) ) ( not ( = ?auto_577577 ?auto_577593 ) ) ( not ( = ?auto_577578 ?auto_577579 ) ) ( not ( = ?auto_577578 ?auto_577580 ) ) ( not ( = ?auto_577578 ?auto_577581 ) ) ( not ( = ?auto_577578 ?auto_577582 ) ) ( not ( = ?auto_577578 ?auto_577583 ) ) ( not ( = ?auto_577578 ?auto_577584 ) ) ( not ( = ?auto_577578 ?auto_577585 ) ) ( not ( = ?auto_577578 ?auto_577586 ) ) ( not ( = ?auto_577578 ?auto_577587 ) ) ( not ( = ?auto_577578 ?auto_577588 ) ) ( not ( = ?auto_577578 ?auto_577589 ) ) ( not ( = ?auto_577578 ?auto_577590 ) ) ( not ( = ?auto_577578 ?auto_577591 ) ) ( not ( = ?auto_577578 ?auto_577592 ) ) ( not ( = ?auto_577578 ?auto_577593 ) ) ( not ( = ?auto_577579 ?auto_577580 ) ) ( not ( = ?auto_577579 ?auto_577581 ) ) ( not ( = ?auto_577579 ?auto_577582 ) ) ( not ( = ?auto_577579 ?auto_577583 ) ) ( not ( = ?auto_577579 ?auto_577584 ) ) ( not ( = ?auto_577579 ?auto_577585 ) ) ( not ( = ?auto_577579 ?auto_577586 ) ) ( not ( = ?auto_577579 ?auto_577587 ) ) ( not ( = ?auto_577579 ?auto_577588 ) ) ( not ( = ?auto_577579 ?auto_577589 ) ) ( not ( = ?auto_577579 ?auto_577590 ) ) ( not ( = ?auto_577579 ?auto_577591 ) ) ( not ( = ?auto_577579 ?auto_577592 ) ) ( not ( = ?auto_577579 ?auto_577593 ) ) ( not ( = ?auto_577580 ?auto_577581 ) ) ( not ( = ?auto_577580 ?auto_577582 ) ) ( not ( = ?auto_577580 ?auto_577583 ) ) ( not ( = ?auto_577580 ?auto_577584 ) ) ( not ( = ?auto_577580 ?auto_577585 ) ) ( not ( = ?auto_577580 ?auto_577586 ) ) ( not ( = ?auto_577580 ?auto_577587 ) ) ( not ( = ?auto_577580 ?auto_577588 ) ) ( not ( = ?auto_577580 ?auto_577589 ) ) ( not ( = ?auto_577580 ?auto_577590 ) ) ( not ( = ?auto_577580 ?auto_577591 ) ) ( not ( = ?auto_577580 ?auto_577592 ) ) ( not ( = ?auto_577580 ?auto_577593 ) ) ( not ( = ?auto_577581 ?auto_577582 ) ) ( not ( = ?auto_577581 ?auto_577583 ) ) ( not ( = ?auto_577581 ?auto_577584 ) ) ( not ( = ?auto_577581 ?auto_577585 ) ) ( not ( = ?auto_577581 ?auto_577586 ) ) ( not ( = ?auto_577581 ?auto_577587 ) ) ( not ( = ?auto_577581 ?auto_577588 ) ) ( not ( = ?auto_577581 ?auto_577589 ) ) ( not ( = ?auto_577581 ?auto_577590 ) ) ( not ( = ?auto_577581 ?auto_577591 ) ) ( not ( = ?auto_577581 ?auto_577592 ) ) ( not ( = ?auto_577581 ?auto_577593 ) ) ( not ( = ?auto_577582 ?auto_577583 ) ) ( not ( = ?auto_577582 ?auto_577584 ) ) ( not ( = ?auto_577582 ?auto_577585 ) ) ( not ( = ?auto_577582 ?auto_577586 ) ) ( not ( = ?auto_577582 ?auto_577587 ) ) ( not ( = ?auto_577582 ?auto_577588 ) ) ( not ( = ?auto_577582 ?auto_577589 ) ) ( not ( = ?auto_577582 ?auto_577590 ) ) ( not ( = ?auto_577582 ?auto_577591 ) ) ( not ( = ?auto_577582 ?auto_577592 ) ) ( not ( = ?auto_577582 ?auto_577593 ) ) ( not ( = ?auto_577583 ?auto_577584 ) ) ( not ( = ?auto_577583 ?auto_577585 ) ) ( not ( = ?auto_577583 ?auto_577586 ) ) ( not ( = ?auto_577583 ?auto_577587 ) ) ( not ( = ?auto_577583 ?auto_577588 ) ) ( not ( = ?auto_577583 ?auto_577589 ) ) ( not ( = ?auto_577583 ?auto_577590 ) ) ( not ( = ?auto_577583 ?auto_577591 ) ) ( not ( = ?auto_577583 ?auto_577592 ) ) ( not ( = ?auto_577583 ?auto_577593 ) ) ( not ( = ?auto_577584 ?auto_577585 ) ) ( not ( = ?auto_577584 ?auto_577586 ) ) ( not ( = ?auto_577584 ?auto_577587 ) ) ( not ( = ?auto_577584 ?auto_577588 ) ) ( not ( = ?auto_577584 ?auto_577589 ) ) ( not ( = ?auto_577584 ?auto_577590 ) ) ( not ( = ?auto_577584 ?auto_577591 ) ) ( not ( = ?auto_577584 ?auto_577592 ) ) ( not ( = ?auto_577584 ?auto_577593 ) ) ( not ( = ?auto_577585 ?auto_577586 ) ) ( not ( = ?auto_577585 ?auto_577587 ) ) ( not ( = ?auto_577585 ?auto_577588 ) ) ( not ( = ?auto_577585 ?auto_577589 ) ) ( not ( = ?auto_577585 ?auto_577590 ) ) ( not ( = ?auto_577585 ?auto_577591 ) ) ( not ( = ?auto_577585 ?auto_577592 ) ) ( not ( = ?auto_577585 ?auto_577593 ) ) ( not ( = ?auto_577586 ?auto_577587 ) ) ( not ( = ?auto_577586 ?auto_577588 ) ) ( not ( = ?auto_577586 ?auto_577589 ) ) ( not ( = ?auto_577586 ?auto_577590 ) ) ( not ( = ?auto_577586 ?auto_577591 ) ) ( not ( = ?auto_577586 ?auto_577592 ) ) ( not ( = ?auto_577586 ?auto_577593 ) ) ( not ( = ?auto_577587 ?auto_577588 ) ) ( not ( = ?auto_577587 ?auto_577589 ) ) ( not ( = ?auto_577587 ?auto_577590 ) ) ( not ( = ?auto_577587 ?auto_577591 ) ) ( not ( = ?auto_577587 ?auto_577592 ) ) ( not ( = ?auto_577587 ?auto_577593 ) ) ( not ( = ?auto_577588 ?auto_577589 ) ) ( not ( = ?auto_577588 ?auto_577590 ) ) ( not ( = ?auto_577588 ?auto_577591 ) ) ( not ( = ?auto_577588 ?auto_577592 ) ) ( not ( = ?auto_577588 ?auto_577593 ) ) ( not ( = ?auto_577589 ?auto_577590 ) ) ( not ( = ?auto_577589 ?auto_577591 ) ) ( not ( = ?auto_577589 ?auto_577592 ) ) ( not ( = ?auto_577589 ?auto_577593 ) ) ( not ( = ?auto_577590 ?auto_577591 ) ) ( not ( = ?auto_577590 ?auto_577592 ) ) ( not ( = ?auto_577590 ?auto_577593 ) ) ( not ( = ?auto_577591 ?auto_577592 ) ) ( not ( = ?auto_577591 ?auto_577593 ) ) ( not ( = ?auto_577592 ?auto_577593 ) ) ( ON ?auto_577591 ?auto_577592 ) ( ON ?auto_577590 ?auto_577591 ) ( ON ?auto_577589 ?auto_577590 ) ( ON ?auto_577588 ?auto_577589 ) ( ON ?auto_577587 ?auto_577588 ) ( ON ?auto_577586 ?auto_577587 ) ( ON ?auto_577585 ?auto_577586 ) ( ON ?auto_577584 ?auto_577585 ) ( ON ?auto_577583 ?auto_577584 ) ( ON ?auto_577582 ?auto_577583 ) ( ON ?auto_577581 ?auto_577582 ) ( CLEAR ?auto_577579 ) ( ON ?auto_577580 ?auto_577581 ) ( CLEAR ?auto_577580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_577577 ?auto_577578 ?auto_577579 ?auto_577580 )
      ( MAKE-16PILE ?auto_577577 ?auto_577578 ?auto_577579 ?auto_577580 ?auto_577581 ?auto_577582 ?auto_577583 ?auto_577584 ?auto_577585 ?auto_577586 ?auto_577587 ?auto_577588 ?auto_577589 ?auto_577590 ?auto_577591 ?auto_577592 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577610 - BLOCK
      ?auto_577611 - BLOCK
      ?auto_577612 - BLOCK
      ?auto_577613 - BLOCK
      ?auto_577614 - BLOCK
      ?auto_577615 - BLOCK
      ?auto_577616 - BLOCK
      ?auto_577617 - BLOCK
      ?auto_577618 - BLOCK
      ?auto_577619 - BLOCK
      ?auto_577620 - BLOCK
      ?auto_577621 - BLOCK
      ?auto_577622 - BLOCK
      ?auto_577623 - BLOCK
      ?auto_577624 - BLOCK
      ?auto_577625 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_577625 ) ( ON-TABLE ?auto_577610 ) ( ON ?auto_577611 ?auto_577610 ) ( ON ?auto_577612 ?auto_577611 ) ( not ( = ?auto_577610 ?auto_577611 ) ) ( not ( = ?auto_577610 ?auto_577612 ) ) ( not ( = ?auto_577610 ?auto_577613 ) ) ( not ( = ?auto_577610 ?auto_577614 ) ) ( not ( = ?auto_577610 ?auto_577615 ) ) ( not ( = ?auto_577610 ?auto_577616 ) ) ( not ( = ?auto_577610 ?auto_577617 ) ) ( not ( = ?auto_577610 ?auto_577618 ) ) ( not ( = ?auto_577610 ?auto_577619 ) ) ( not ( = ?auto_577610 ?auto_577620 ) ) ( not ( = ?auto_577610 ?auto_577621 ) ) ( not ( = ?auto_577610 ?auto_577622 ) ) ( not ( = ?auto_577610 ?auto_577623 ) ) ( not ( = ?auto_577610 ?auto_577624 ) ) ( not ( = ?auto_577610 ?auto_577625 ) ) ( not ( = ?auto_577611 ?auto_577612 ) ) ( not ( = ?auto_577611 ?auto_577613 ) ) ( not ( = ?auto_577611 ?auto_577614 ) ) ( not ( = ?auto_577611 ?auto_577615 ) ) ( not ( = ?auto_577611 ?auto_577616 ) ) ( not ( = ?auto_577611 ?auto_577617 ) ) ( not ( = ?auto_577611 ?auto_577618 ) ) ( not ( = ?auto_577611 ?auto_577619 ) ) ( not ( = ?auto_577611 ?auto_577620 ) ) ( not ( = ?auto_577611 ?auto_577621 ) ) ( not ( = ?auto_577611 ?auto_577622 ) ) ( not ( = ?auto_577611 ?auto_577623 ) ) ( not ( = ?auto_577611 ?auto_577624 ) ) ( not ( = ?auto_577611 ?auto_577625 ) ) ( not ( = ?auto_577612 ?auto_577613 ) ) ( not ( = ?auto_577612 ?auto_577614 ) ) ( not ( = ?auto_577612 ?auto_577615 ) ) ( not ( = ?auto_577612 ?auto_577616 ) ) ( not ( = ?auto_577612 ?auto_577617 ) ) ( not ( = ?auto_577612 ?auto_577618 ) ) ( not ( = ?auto_577612 ?auto_577619 ) ) ( not ( = ?auto_577612 ?auto_577620 ) ) ( not ( = ?auto_577612 ?auto_577621 ) ) ( not ( = ?auto_577612 ?auto_577622 ) ) ( not ( = ?auto_577612 ?auto_577623 ) ) ( not ( = ?auto_577612 ?auto_577624 ) ) ( not ( = ?auto_577612 ?auto_577625 ) ) ( not ( = ?auto_577613 ?auto_577614 ) ) ( not ( = ?auto_577613 ?auto_577615 ) ) ( not ( = ?auto_577613 ?auto_577616 ) ) ( not ( = ?auto_577613 ?auto_577617 ) ) ( not ( = ?auto_577613 ?auto_577618 ) ) ( not ( = ?auto_577613 ?auto_577619 ) ) ( not ( = ?auto_577613 ?auto_577620 ) ) ( not ( = ?auto_577613 ?auto_577621 ) ) ( not ( = ?auto_577613 ?auto_577622 ) ) ( not ( = ?auto_577613 ?auto_577623 ) ) ( not ( = ?auto_577613 ?auto_577624 ) ) ( not ( = ?auto_577613 ?auto_577625 ) ) ( not ( = ?auto_577614 ?auto_577615 ) ) ( not ( = ?auto_577614 ?auto_577616 ) ) ( not ( = ?auto_577614 ?auto_577617 ) ) ( not ( = ?auto_577614 ?auto_577618 ) ) ( not ( = ?auto_577614 ?auto_577619 ) ) ( not ( = ?auto_577614 ?auto_577620 ) ) ( not ( = ?auto_577614 ?auto_577621 ) ) ( not ( = ?auto_577614 ?auto_577622 ) ) ( not ( = ?auto_577614 ?auto_577623 ) ) ( not ( = ?auto_577614 ?auto_577624 ) ) ( not ( = ?auto_577614 ?auto_577625 ) ) ( not ( = ?auto_577615 ?auto_577616 ) ) ( not ( = ?auto_577615 ?auto_577617 ) ) ( not ( = ?auto_577615 ?auto_577618 ) ) ( not ( = ?auto_577615 ?auto_577619 ) ) ( not ( = ?auto_577615 ?auto_577620 ) ) ( not ( = ?auto_577615 ?auto_577621 ) ) ( not ( = ?auto_577615 ?auto_577622 ) ) ( not ( = ?auto_577615 ?auto_577623 ) ) ( not ( = ?auto_577615 ?auto_577624 ) ) ( not ( = ?auto_577615 ?auto_577625 ) ) ( not ( = ?auto_577616 ?auto_577617 ) ) ( not ( = ?auto_577616 ?auto_577618 ) ) ( not ( = ?auto_577616 ?auto_577619 ) ) ( not ( = ?auto_577616 ?auto_577620 ) ) ( not ( = ?auto_577616 ?auto_577621 ) ) ( not ( = ?auto_577616 ?auto_577622 ) ) ( not ( = ?auto_577616 ?auto_577623 ) ) ( not ( = ?auto_577616 ?auto_577624 ) ) ( not ( = ?auto_577616 ?auto_577625 ) ) ( not ( = ?auto_577617 ?auto_577618 ) ) ( not ( = ?auto_577617 ?auto_577619 ) ) ( not ( = ?auto_577617 ?auto_577620 ) ) ( not ( = ?auto_577617 ?auto_577621 ) ) ( not ( = ?auto_577617 ?auto_577622 ) ) ( not ( = ?auto_577617 ?auto_577623 ) ) ( not ( = ?auto_577617 ?auto_577624 ) ) ( not ( = ?auto_577617 ?auto_577625 ) ) ( not ( = ?auto_577618 ?auto_577619 ) ) ( not ( = ?auto_577618 ?auto_577620 ) ) ( not ( = ?auto_577618 ?auto_577621 ) ) ( not ( = ?auto_577618 ?auto_577622 ) ) ( not ( = ?auto_577618 ?auto_577623 ) ) ( not ( = ?auto_577618 ?auto_577624 ) ) ( not ( = ?auto_577618 ?auto_577625 ) ) ( not ( = ?auto_577619 ?auto_577620 ) ) ( not ( = ?auto_577619 ?auto_577621 ) ) ( not ( = ?auto_577619 ?auto_577622 ) ) ( not ( = ?auto_577619 ?auto_577623 ) ) ( not ( = ?auto_577619 ?auto_577624 ) ) ( not ( = ?auto_577619 ?auto_577625 ) ) ( not ( = ?auto_577620 ?auto_577621 ) ) ( not ( = ?auto_577620 ?auto_577622 ) ) ( not ( = ?auto_577620 ?auto_577623 ) ) ( not ( = ?auto_577620 ?auto_577624 ) ) ( not ( = ?auto_577620 ?auto_577625 ) ) ( not ( = ?auto_577621 ?auto_577622 ) ) ( not ( = ?auto_577621 ?auto_577623 ) ) ( not ( = ?auto_577621 ?auto_577624 ) ) ( not ( = ?auto_577621 ?auto_577625 ) ) ( not ( = ?auto_577622 ?auto_577623 ) ) ( not ( = ?auto_577622 ?auto_577624 ) ) ( not ( = ?auto_577622 ?auto_577625 ) ) ( not ( = ?auto_577623 ?auto_577624 ) ) ( not ( = ?auto_577623 ?auto_577625 ) ) ( not ( = ?auto_577624 ?auto_577625 ) ) ( ON ?auto_577624 ?auto_577625 ) ( ON ?auto_577623 ?auto_577624 ) ( ON ?auto_577622 ?auto_577623 ) ( ON ?auto_577621 ?auto_577622 ) ( ON ?auto_577620 ?auto_577621 ) ( ON ?auto_577619 ?auto_577620 ) ( ON ?auto_577618 ?auto_577619 ) ( ON ?auto_577617 ?auto_577618 ) ( ON ?auto_577616 ?auto_577617 ) ( ON ?auto_577615 ?auto_577616 ) ( ON ?auto_577614 ?auto_577615 ) ( CLEAR ?auto_577612 ) ( ON ?auto_577613 ?auto_577614 ) ( CLEAR ?auto_577613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_577610 ?auto_577611 ?auto_577612 ?auto_577613 )
      ( MAKE-16PILE ?auto_577610 ?auto_577611 ?auto_577612 ?auto_577613 ?auto_577614 ?auto_577615 ?auto_577616 ?auto_577617 ?auto_577618 ?auto_577619 ?auto_577620 ?auto_577621 ?auto_577622 ?auto_577623 ?auto_577624 ?auto_577625 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577642 - BLOCK
      ?auto_577643 - BLOCK
      ?auto_577644 - BLOCK
      ?auto_577645 - BLOCK
      ?auto_577646 - BLOCK
      ?auto_577647 - BLOCK
      ?auto_577648 - BLOCK
      ?auto_577649 - BLOCK
      ?auto_577650 - BLOCK
      ?auto_577651 - BLOCK
      ?auto_577652 - BLOCK
      ?auto_577653 - BLOCK
      ?auto_577654 - BLOCK
      ?auto_577655 - BLOCK
      ?auto_577656 - BLOCK
      ?auto_577657 - BLOCK
    )
    :vars
    (
      ?auto_577658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_577657 ?auto_577658 ) ( ON-TABLE ?auto_577642 ) ( ON ?auto_577643 ?auto_577642 ) ( not ( = ?auto_577642 ?auto_577643 ) ) ( not ( = ?auto_577642 ?auto_577644 ) ) ( not ( = ?auto_577642 ?auto_577645 ) ) ( not ( = ?auto_577642 ?auto_577646 ) ) ( not ( = ?auto_577642 ?auto_577647 ) ) ( not ( = ?auto_577642 ?auto_577648 ) ) ( not ( = ?auto_577642 ?auto_577649 ) ) ( not ( = ?auto_577642 ?auto_577650 ) ) ( not ( = ?auto_577642 ?auto_577651 ) ) ( not ( = ?auto_577642 ?auto_577652 ) ) ( not ( = ?auto_577642 ?auto_577653 ) ) ( not ( = ?auto_577642 ?auto_577654 ) ) ( not ( = ?auto_577642 ?auto_577655 ) ) ( not ( = ?auto_577642 ?auto_577656 ) ) ( not ( = ?auto_577642 ?auto_577657 ) ) ( not ( = ?auto_577642 ?auto_577658 ) ) ( not ( = ?auto_577643 ?auto_577644 ) ) ( not ( = ?auto_577643 ?auto_577645 ) ) ( not ( = ?auto_577643 ?auto_577646 ) ) ( not ( = ?auto_577643 ?auto_577647 ) ) ( not ( = ?auto_577643 ?auto_577648 ) ) ( not ( = ?auto_577643 ?auto_577649 ) ) ( not ( = ?auto_577643 ?auto_577650 ) ) ( not ( = ?auto_577643 ?auto_577651 ) ) ( not ( = ?auto_577643 ?auto_577652 ) ) ( not ( = ?auto_577643 ?auto_577653 ) ) ( not ( = ?auto_577643 ?auto_577654 ) ) ( not ( = ?auto_577643 ?auto_577655 ) ) ( not ( = ?auto_577643 ?auto_577656 ) ) ( not ( = ?auto_577643 ?auto_577657 ) ) ( not ( = ?auto_577643 ?auto_577658 ) ) ( not ( = ?auto_577644 ?auto_577645 ) ) ( not ( = ?auto_577644 ?auto_577646 ) ) ( not ( = ?auto_577644 ?auto_577647 ) ) ( not ( = ?auto_577644 ?auto_577648 ) ) ( not ( = ?auto_577644 ?auto_577649 ) ) ( not ( = ?auto_577644 ?auto_577650 ) ) ( not ( = ?auto_577644 ?auto_577651 ) ) ( not ( = ?auto_577644 ?auto_577652 ) ) ( not ( = ?auto_577644 ?auto_577653 ) ) ( not ( = ?auto_577644 ?auto_577654 ) ) ( not ( = ?auto_577644 ?auto_577655 ) ) ( not ( = ?auto_577644 ?auto_577656 ) ) ( not ( = ?auto_577644 ?auto_577657 ) ) ( not ( = ?auto_577644 ?auto_577658 ) ) ( not ( = ?auto_577645 ?auto_577646 ) ) ( not ( = ?auto_577645 ?auto_577647 ) ) ( not ( = ?auto_577645 ?auto_577648 ) ) ( not ( = ?auto_577645 ?auto_577649 ) ) ( not ( = ?auto_577645 ?auto_577650 ) ) ( not ( = ?auto_577645 ?auto_577651 ) ) ( not ( = ?auto_577645 ?auto_577652 ) ) ( not ( = ?auto_577645 ?auto_577653 ) ) ( not ( = ?auto_577645 ?auto_577654 ) ) ( not ( = ?auto_577645 ?auto_577655 ) ) ( not ( = ?auto_577645 ?auto_577656 ) ) ( not ( = ?auto_577645 ?auto_577657 ) ) ( not ( = ?auto_577645 ?auto_577658 ) ) ( not ( = ?auto_577646 ?auto_577647 ) ) ( not ( = ?auto_577646 ?auto_577648 ) ) ( not ( = ?auto_577646 ?auto_577649 ) ) ( not ( = ?auto_577646 ?auto_577650 ) ) ( not ( = ?auto_577646 ?auto_577651 ) ) ( not ( = ?auto_577646 ?auto_577652 ) ) ( not ( = ?auto_577646 ?auto_577653 ) ) ( not ( = ?auto_577646 ?auto_577654 ) ) ( not ( = ?auto_577646 ?auto_577655 ) ) ( not ( = ?auto_577646 ?auto_577656 ) ) ( not ( = ?auto_577646 ?auto_577657 ) ) ( not ( = ?auto_577646 ?auto_577658 ) ) ( not ( = ?auto_577647 ?auto_577648 ) ) ( not ( = ?auto_577647 ?auto_577649 ) ) ( not ( = ?auto_577647 ?auto_577650 ) ) ( not ( = ?auto_577647 ?auto_577651 ) ) ( not ( = ?auto_577647 ?auto_577652 ) ) ( not ( = ?auto_577647 ?auto_577653 ) ) ( not ( = ?auto_577647 ?auto_577654 ) ) ( not ( = ?auto_577647 ?auto_577655 ) ) ( not ( = ?auto_577647 ?auto_577656 ) ) ( not ( = ?auto_577647 ?auto_577657 ) ) ( not ( = ?auto_577647 ?auto_577658 ) ) ( not ( = ?auto_577648 ?auto_577649 ) ) ( not ( = ?auto_577648 ?auto_577650 ) ) ( not ( = ?auto_577648 ?auto_577651 ) ) ( not ( = ?auto_577648 ?auto_577652 ) ) ( not ( = ?auto_577648 ?auto_577653 ) ) ( not ( = ?auto_577648 ?auto_577654 ) ) ( not ( = ?auto_577648 ?auto_577655 ) ) ( not ( = ?auto_577648 ?auto_577656 ) ) ( not ( = ?auto_577648 ?auto_577657 ) ) ( not ( = ?auto_577648 ?auto_577658 ) ) ( not ( = ?auto_577649 ?auto_577650 ) ) ( not ( = ?auto_577649 ?auto_577651 ) ) ( not ( = ?auto_577649 ?auto_577652 ) ) ( not ( = ?auto_577649 ?auto_577653 ) ) ( not ( = ?auto_577649 ?auto_577654 ) ) ( not ( = ?auto_577649 ?auto_577655 ) ) ( not ( = ?auto_577649 ?auto_577656 ) ) ( not ( = ?auto_577649 ?auto_577657 ) ) ( not ( = ?auto_577649 ?auto_577658 ) ) ( not ( = ?auto_577650 ?auto_577651 ) ) ( not ( = ?auto_577650 ?auto_577652 ) ) ( not ( = ?auto_577650 ?auto_577653 ) ) ( not ( = ?auto_577650 ?auto_577654 ) ) ( not ( = ?auto_577650 ?auto_577655 ) ) ( not ( = ?auto_577650 ?auto_577656 ) ) ( not ( = ?auto_577650 ?auto_577657 ) ) ( not ( = ?auto_577650 ?auto_577658 ) ) ( not ( = ?auto_577651 ?auto_577652 ) ) ( not ( = ?auto_577651 ?auto_577653 ) ) ( not ( = ?auto_577651 ?auto_577654 ) ) ( not ( = ?auto_577651 ?auto_577655 ) ) ( not ( = ?auto_577651 ?auto_577656 ) ) ( not ( = ?auto_577651 ?auto_577657 ) ) ( not ( = ?auto_577651 ?auto_577658 ) ) ( not ( = ?auto_577652 ?auto_577653 ) ) ( not ( = ?auto_577652 ?auto_577654 ) ) ( not ( = ?auto_577652 ?auto_577655 ) ) ( not ( = ?auto_577652 ?auto_577656 ) ) ( not ( = ?auto_577652 ?auto_577657 ) ) ( not ( = ?auto_577652 ?auto_577658 ) ) ( not ( = ?auto_577653 ?auto_577654 ) ) ( not ( = ?auto_577653 ?auto_577655 ) ) ( not ( = ?auto_577653 ?auto_577656 ) ) ( not ( = ?auto_577653 ?auto_577657 ) ) ( not ( = ?auto_577653 ?auto_577658 ) ) ( not ( = ?auto_577654 ?auto_577655 ) ) ( not ( = ?auto_577654 ?auto_577656 ) ) ( not ( = ?auto_577654 ?auto_577657 ) ) ( not ( = ?auto_577654 ?auto_577658 ) ) ( not ( = ?auto_577655 ?auto_577656 ) ) ( not ( = ?auto_577655 ?auto_577657 ) ) ( not ( = ?auto_577655 ?auto_577658 ) ) ( not ( = ?auto_577656 ?auto_577657 ) ) ( not ( = ?auto_577656 ?auto_577658 ) ) ( not ( = ?auto_577657 ?auto_577658 ) ) ( ON ?auto_577656 ?auto_577657 ) ( ON ?auto_577655 ?auto_577656 ) ( ON ?auto_577654 ?auto_577655 ) ( ON ?auto_577653 ?auto_577654 ) ( ON ?auto_577652 ?auto_577653 ) ( ON ?auto_577651 ?auto_577652 ) ( ON ?auto_577650 ?auto_577651 ) ( ON ?auto_577649 ?auto_577650 ) ( ON ?auto_577648 ?auto_577649 ) ( ON ?auto_577647 ?auto_577648 ) ( ON ?auto_577646 ?auto_577647 ) ( ON ?auto_577645 ?auto_577646 ) ( CLEAR ?auto_577643 ) ( ON ?auto_577644 ?auto_577645 ) ( CLEAR ?auto_577644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_577642 ?auto_577643 ?auto_577644 )
      ( MAKE-16PILE ?auto_577642 ?auto_577643 ?auto_577644 ?auto_577645 ?auto_577646 ?auto_577647 ?auto_577648 ?auto_577649 ?auto_577650 ?auto_577651 ?auto_577652 ?auto_577653 ?auto_577654 ?auto_577655 ?auto_577656 ?auto_577657 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577675 - BLOCK
      ?auto_577676 - BLOCK
      ?auto_577677 - BLOCK
      ?auto_577678 - BLOCK
      ?auto_577679 - BLOCK
      ?auto_577680 - BLOCK
      ?auto_577681 - BLOCK
      ?auto_577682 - BLOCK
      ?auto_577683 - BLOCK
      ?auto_577684 - BLOCK
      ?auto_577685 - BLOCK
      ?auto_577686 - BLOCK
      ?auto_577687 - BLOCK
      ?auto_577688 - BLOCK
      ?auto_577689 - BLOCK
      ?auto_577690 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_577690 ) ( ON-TABLE ?auto_577675 ) ( ON ?auto_577676 ?auto_577675 ) ( not ( = ?auto_577675 ?auto_577676 ) ) ( not ( = ?auto_577675 ?auto_577677 ) ) ( not ( = ?auto_577675 ?auto_577678 ) ) ( not ( = ?auto_577675 ?auto_577679 ) ) ( not ( = ?auto_577675 ?auto_577680 ) ) ( not ( = ?auto_577675 ?auto_577681 ) ) ( not ( = ?auto_577675 ?auto_577682 ) ) ( not ( = ?auto_577675 ?auto_577683 ) ) ( not ( = ?auto_577675 ?auto_577684 ) ) ( not ( = ?auto_577675 ?auto_577685 ) ) ( not ( = ?auto_577675 ?auto_577686 ) ) ( not ( = ?auto_577675 ?auto_577687 ) ) ( not ( = ?auto_577675 ?auto_577688 ) ) ( not ( = ?auto_577675 ?auto_577689 ) ) ( not ( = ?auto_577675 ?auto_577690 ) ) ( not ( = ?auto_577676 ?auto_577677 ) ) ( not ( = ?auto_577676 ?auto_577678 ) ) ( not ( = ?auto_577676 ?auto_577679 ) ) ( not ( = ?auto_577676 ?auto_577680 ) ) ( not ( = ?auto_577676 ?auto_577681 ) ) ( not ( = ?auto_577676 ?auto_577682 ) ) ( not ( = ?auto_577676 ?auto_577683 ) ) ( not ( = ?auto_577676 ?auto_577684 ) ) ( not ( = ?auto_577676 ?auto_577685 ) ) ( not ( = ?auto_577676 ?auto_577686 ) ) ( not ( = ?auto_577676 ?auto_577687 ) ) ( not ( = ?auto_577676 ?auto_577688 ) ) ( not ( = ?auto_577676 ?auto_577689 ) ) ( not ( = ?auto_577676 ?auto_577690 ) ) ( not ( = ?auto_577677 ?auto_577678 ) ) ( not ( = ?auto_577677 ?auto_577679 ) ) ( not ( = ?auto_577677 ?auto_577680 ) ) ( not ( = ?auto_577677 ?auto_577681 ) ) ( not ( = ?auto_577677 ?auto_577682 ) ) ( not ( = ?auto_577677 ?auto_577683 ) ) ( not ( = ?auto_577677 ?auto_577684 ) ) ( not ( = ?auto_577677 ?auto_577685 ) ) ( not ( = ?auto_577677 ?auto_577686 ) ) ( not ( = ?auto_577677 ?auto_577687 ) ) ( not ( = ?auto_577677 ?auto_577688 ) ) ( not ( = ?auto_577677 ?auto_577689 ) ) ( not ( = ?auto_577677 ?auto_577690 ) ) ( not ( = ?auto_577678 ?auto_577679 ) ) ( not ( = ?auto_577678 ?auto_577680 ) ) ( not ( = ?auto_577678 ?auto_577681 ) ) ( not ( = ?auto_577678 ?auto_577682 ) ) ( not ( = ?auto_577678 ?auto_577683 ) ) ( not ( = ?auto_577678 ?auto_577684 ) ) ( not ( = ?auto_577678 ?auto_577685 ) ) ( not ( = ?auto_577678 ?auto_577686 ) ) ( not ( = ?auto_577678 ?auto_577687 ) ) ( not ( = ?auto_577678 ?auto_577688 ) ) ( not ( = ?auto_577678 ?auto_577689 ) ) ( not ( = ?auto_577678 ?auto_577690 ) ) ( not ( = ?auto_577679 ?auto_577680 ) ) ( not ( = ?auto_577679 ?auto_577681 ) ) ( not ( = ?auto_577679 ?auto_577682 ) ) ( not ( = ?auto_577679 ?auto_577683 ) ) ( not ( = ?auto_577679 ?auto_577684 ) ) ( not ( = ?auto_577679 ?auto_577685 ) ) ( not ( = ?auto_577679 ?auto_577686 ) ) ( not ( = ?auto_577679 ?auto_577687 ) ) ( not ( = ?auto_577679 ?auto_577688 ) ) ( not ( = ?auto_577679 ?auto_577689 ) ) ( not ( = ?auto_577679 ?auto_577690 ) ) ( not ( = ?auto_577680 ?auto_577681 ) ) ( not ( = ?auto_577680 ?auto_577682 ) ) ( not ( = ?auto_577680 ?auto_577683 ) ) ( not ( = ?auto_577680 ?auto_577684 ) ) ( not ( = ?auto_577680 ?auto_577685 ) ) ( not ( = ?auto_577680 ?auto_577686 ) ) ( not ( = ?auto_577680 ?auto_577687 ) ) ( not ( = ?auto_577680 ?auto_577688 ) ) ( not ( = ?auto_577680 ?auto_577689 ) ) ( not ( = ?auto_577680 ?auto_577690 ) ) ( not ( = ?auto_577681 ?auto_577682 ) ) ( not ( = ?auto_577681 ?auto_577683 ) ) ( not ( = ?auto_577681 ?auto_577684 ) ) ( not ( = ?auto_577681 ?auto_577685 ) ) ( not ( = ?auto_577681 ?auto_577686 ) ) ( not ( = ?auto_577681 ?auto_577687 ) ) ( not ( = ?auto_577681 ?auto_577688 ) ) ( not ( = ?auto_577681 ?auto_577689 ) ) ( not ( = ?auto_577681 ?auto_577690 ) ) ( not ( = ?auto_577682 ?auto_577683 ) ) ( not ( = ?auto_577682 ?auto_577684 ) ) ( not ( = ?auto_577682 ?auto_577685 ) ) ( not ( = ?auto_577682 ?auto_577686 ) ) ( not ( = ?auto_577682 ?auto_577687 ) ) ( not ( = ?auto_577682 ?auto_577688 ) ) ( not ( = ?auto_577682 ?auto_577689 ) ) ( not ( = ?auto_577682 ?auto_577690 ) ) ( not ( = ?auto_577683 ?auto_577684 ) ) ( not ( = ?auto_577683 ?auto_577685 ) ) ( not ( = ?auto_577683 ?auto_577686 ) ) ( not ( = ?auto_577683 ?auto_577687 ) ) ( not ( = ?auto_577683 ?auto_577688 ) ) ( not ( = ?auto_577683 ?auto_577689 ) ) ( not ( = ?auto_577683 ?auto_577690 ) ) ( not ( = ?auto_577684 ?auto_577685 ) ) ( not ( = ?auto_577684 ?auto_577686 ) ) ( not ( = ?auto_577684 ?auto_577687 ) ) ( not ( = ?auto_577684 ?auto_577688 ) ) ( not ( = ?auto_577684 ?auto_577689 ) ) ( not ( = ?auto_577684 ?auto_577690 ) ) ( not ( = ?auto_577685 ?auto_577686 ) ) ( not ( = ?auto_577685 ?auto_577687 ) ) ( not ( = ?auto_577685 ?auto_577688 ) ) ( not ( = ?auto_577685 ?auto_577689 ) ) ( not ( = ?auto_577685 ?auto_577690 ) ) ( not ( = ?auto_577686 ?auto_577687 ) ) ( not ( = ?auto_577686 ?auto_577688 ) ) ( not ( = ?auto_577686 ?auto_577689 ) ) ( not ( = ?auto_577686 ?auto_577690 ) ) ( not ( = ?auto_577687 ?auto_577688 ) ) ( not ( = ?auto_577687 ?auto_577689 ) ) ( not ( = ?auto_577687 ?auto_577690 ) ) ( not ( = ?auto_577688 ?auto_577689 ) ) ( not ( = ?auto_577688 ?auto_577690 ) ) ( not ( = ?auto_577689 ?auto_577690 ) ) ( ON ?auto_577689 ?auto_577690 ) ( ON ?auto_577688 ?auto_577689 ) ( ON ?auto_577687 ?auto_577688 ) ( ON ?auto_577686 ?auto_577687 ) ( ON ?auto_577685 ?auto_577686 ) ( ON ?auto_577684 ?auto_577685 ) ( ON ?auto_577683 ?auto_577684 ) ( ON ?auto_577682 ?auto_577683 ) ( ON ?auto_577681 ?auto_577682 ) ( ON ?auto_577680 ?auto_577681 ) ( ON ?auto_577679 ?auto_577680 ) ( ON ?auto_577678 ?auto_577679 ) ( CLEAR ?auto_577676 ) ( ON ?auto_577677 ?auto_577678 ) ( CLEAR ?auto_577677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_577675 ?auto_577676 ?auto_577677 )
      ( MAKE-16PILE ?auto_577675 ?auto_577676 ?auto_577677 ?auto_577678 ?auto_577679 ?auto_577680 ?auto_577681 ?auto_577682 ?auto_577683 ?auto_577684 ?auto_577685 ?auto_577686 ?auto_577687 ?auto_577688 ?auto_577689 ?auto_577690 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577707 - BLOCK
      ?auto_577708 - BLOCK
      ?auto_577709 - BLOCK
      ?auto_577710 - BLOCK
      ?auto_577711 - BLOCK
      ?auto_577712 - BLOCK
      ?auto_577713 - BLOCK
      ?auto_577714 - BLOCK
      ?auto_577715 - BLOCK
      ?auto_577716 - BLOCK
      ?auto_577717 - BLOCK
      ?auto_577718 - BLOCK
      ?auto_577719 - BLOCK
      ?auto_577720 - BLOCK
      ?auto_577721 - BLOCK
      ?auto_577722 - BLOCK
    )
    :vars
    (
      ?auto_577723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_577722 ?auto_577723 ) ( ON-TABLE ?auto_577707 ) ( not ( = ?auto_577707 ?auto_577708 ) ) ( not ( = ?auto_577707 ?auto_577709 ) ) ( not ( = ?auto_577707 ?auto_577710 ) ) ( not ( = ?auto_577707 ?auto_577711 ) ) ( not ( = ?auto_577707 ?auto_577712 ) ) ( not ( = ?auto_577707 ?auto_577713 ) ) ( not ( = ?auto_577707 ?auto_577714 ) ) ( not ( = ?auto_577707 ?auto_577715 ) ) ( not ( = ?auto_577707 ?auto_577716 ) ) ( not ( = ?auto_577707 ?auto_577717 ) ) ( not ( = ?auto_577707 ?auto_577718 ) ) ( not ( = ?auto_577707 ?auto_577719 ) ) ( not ( = ?auto_577707 ?auto_577720 ) ) ( not ( = ?auto_577707 ?auto_577721 ) ) ( not ( = ?auto_577707 ?auto_577722 ) ) ( not ( = ?auto_577707 ?auto_577723 ) ) ( not ( = ?auto_577708 ?auto_577709 ) ) ( not ( = ?auto_577708 ?auto_577710 ) ) ( not ( = ?auto_577708 ?auto_577711 ) ) ( not ( = ?auto_577708 ?auto_577712 ) ) ( not ( = ?auto_577708 ?auto_577713 ) ) ( not ( = ?auto_577708 ?auto_577714 ) ) ( not ( = ?auto_577708 ?auto_577715 ) ) ( not ( = ?auto_577708 ?auto_577716 ) ) ( not ( = ?auto_577708 ?auto_577717 ) ) ( not ( = ?auto_577708 ?auto_577718 ) ) ( not ( = ?auto_577708 ?auto_577719 ) ) ( not ( = ?auto_577708 ?auto_577720 ) ) ( not ( = ?auto_577708 ?auto_577721 ) ) ( not ( = ?auto_577708 ?auto_577722 ) ) ( not ( = ?auto_577708 ?auto_577723 ) ) ( not ( = ?auto_577709 ?auto_577710 ) ) ( not ( = ?auto_577709 ?auto_577711 ) ) ( not ( = ?auto_577709 ?auto_577712 ) ) ( not ( = ?auto_577709 ?auto_577713 ) ) ( not ( = ?auto_577709 ?auto_577714 ) ) ( not ( = ?auto_577709 ?auto_577715 ) ) ( not ( = ?auto_577709 ?auto_577716 ) ) ( not ( = ?auto_577709 ?auto_577717 ) ) ( not ( = ?auto_577709 ?auto_577718 ) ) ( not ( = ?auto_577709 ?auto_577719 ) ) ( not ( = ?auto_577709 ?auto_577720 ) ) ( not ( = ?auto_577709 ?auto_577721 ) ) ( not ( = ?auto_577709 ?auto_577722 ) ) ( not ( = ?auto_577709 ?auto_577723 ) ) ( not ( = ?auto_577710 ?auto_577711 ) ) ( not ( = ?auto_577710 ?auto_577712 ) ) ( not ( = ?auto_577710 ?auto_577713 ) ) ( not ( = ?auto_577710 ?auto_577714 ) ) ( not ( = ?auto_577710 ?auto_577715 ) ) ( not ( = ?auto_577710 ?auto_577716 ) ) ( not ( = ?auto_577710 ?auto_577717 ) ) ( not ( = ?auto_577710 ?auto_577718 ) ) ( not ( = ?auto_577710 ?auto_577719 ) ) ( not ( = ?auto_577710 ?auto_577720 ) ) ( not ( = ?auto_577710 ?auto_577721 ) ) ( not ( = ?auto_577710 ?auto_577722 ) ) ( not ( = ?auto_577710 ?auto_577723 ) ) ( not ( = ?auto_577711 ?auto_577712 ) ) ( not ( = ?auto_577711 ?auto_577713 ) ) ( not ( = ?auto_577711 ?auto_577714 ) ) ( not ( = ?auto_577711 ?auto_577715 ) ) ( not ( = ?auto_577711 ?auto_577716 ) ) ( not ( = ?auto_577711 ?auto_577717 ) ) ( not ( = ?auto_577711 ?auto_577718 ) ) ( not ( = ?auto_577711 ?auto_577719 ) ) ( not ( = ?auto_577711 ?auto_577720 ) ) ( not ( = ?auto_577711 ?auto_577721 ) ) ( not ( = ?auto_577711 ?auto_577722 ) ) ( not ( = ?auto_577711 ?auto_577723 ) ) ( not ( = ?auto_577712 ?auto_577713 ) ) ( not ( = ?auto_577712 ?auto_577714 ) ) ( not ( = ?auto_577712 ?auto_577715 ) ) ( not ( = ?auto_577712 ?auto_577716 ) ) ( not ( = ?auto_577712 ?auto_577717 ) ) ( not ( = ?auto_577712 ?auto_577718 ) ) ( not ( = ?auto_577712 ?auto_577719 ) ) ( not ( = ?auto_577712 ?auto_577720 ) ) ( not ( = ?auto_577712 ?auto_577721 ) ) ( not ( = ?auto_577712 ?auto_577722 ) ) ( not ( = ?auto_577712 ?auto_577723 ) ) ( not ( = ?auto_577713 ?auto_577714 ) ) ( not ( = ?auto_577713 ?auto_577715 ) ) ( not ( = ?auto_577713 ?auto_577716 ) ) ( not ( = ?auto_577713 ?auto_577717 ) ) ( not ( = ?auto_577713 ?auto_577718 ) ) ( not ( = ?auto_577713 ?auto_577719 ) ) ( not ( = ?auto_577713 ?auto_577720 ) ) ( not ( = ?auto_577713 ?auto_577721 ) ) ( not ( = ?auto_577713 ?auto_577722 ) ) ( not ( = ?auto_577713 ?auto_577723 ) ) ( not ( = ?auto_577714 ?auto_577715 ) ) ( not ( = ?auto_577714 ?auto_577716 ) ) ( not ( = ?auto_577714 ?auto_577717 ) ) ( not ( = ?auto_577714 ?auto_577718 ) ) ( not ( = ?auto_577714 ?auto_577719 ) ) ( not ( = ?auto_577714 ?auto_577720 ) ) ( not ( = ?auto_577714 ?auto_577721 ) ) ( not ( = ?auto_577714 ?auto_577722 ) ) ( not ( = ?auto_577714 ?auto_577723 ) ) ( not ( = ?auto_577715 ?auto_577716 ) ) ( not ( = ?auto_577715 ?auto_577717 ) ) ( not ( = ?auto_577715 ?auto_577718 ) ) ( not ( = ?auto_577715 ?auto_577719 ) ) ( not ( = ?auto_577715 ?auto_577720 ) ) ( not ( = ?auto_577715 ?auto_577721 ) ) ( not ( = ?auto_577715 ?auto_577722 ) ) ( not ( = ?auto_577715 ?auto_577723 ) ) ( not ( = ?auto_577716 ?auto_577717 ) ) ( not ( = ?auto_577716 ?auto_577718 ) ) ( not ( = ?auto_577716 ?auto_577719 ) ) ( not ( = ?auto_577716 ?auto_577720 ) ) ( not ( = ?auto_577716 ?auto_577721 ) ) ( not ( = ?auto_577716 ?auto_577722 ) ) ( not ( = ?auto_577716 ?auto_577723 ) ) ( not ( = ?auto_577717 ?auto_577718 ) ) ( not ( = ?auto_577717 ?auto_577719 ) ) ( not ( = ?auto_577717 ?auto_577720 ) ) ( not ( = ?auto_577717 ?auto_577721 ) ) ( not ( = ?auto_577717 ?auto_577722 ) ) ( not ( = ?auto_577717 ?auto_577723 ) ) ( not ( = ?auto_577718 ?auto_577719 ) ) ( not ( = ?auto_577718 ?auto_577720 ) ) ( not ( = ?auto_577718 ?auto_577721 ) ) ( not ( = ?auto_577718 ?auto_577722 ) ) ( not ( = ?auto_577718 ?auto_577723 ) ) ( not ( = ?auto_577719 ?auto_577720 ) ) ( not ( = ?auto_577719 ?auto_577721 ) ) ( not ( = ?auto_577719 ?auto_577722 ) ) ( not ( = ?auto_577719 ?auto_577723 ) ) ( not ( = ?auto_577720 ?auto_577721 ) ) ( not ( = ?auto_577720 ?auto_577722 ) ) ( not ( = ?auto_577720 ?auto_577723 ) ) ( not ( = ?auto_577721 ?auto_577722 ) ) ( not ( = ?auto_577721 ?auto_577723 ) ) ( not ( = ?auto_577722 ?auto_577723 ) ) ( ON ?auto_577721 ?auto_577722 ) ( ON ?auto_577720 ?auto_577721 ) ( ON ?auto_577719 ?auto_577720 ) ( ON ?auto_577718 ?auto_577719 ) ( ON ?auto_577717 ?auto_577718 ) ( ON ?auto_577716 ?auto_577717 ) ( ON ?auto_577715 ?auto_577716 ) ( ON ?auto_577714 ?auto_577715 ) ( ON ?auto_577713 ?auto_577714 ) ( ON ?auto_577712 ?auto_577713 ) ( ON ?auto_577711 ?auto_577712 ) ( ON ?auto_577710 ?auto_577711 ) ( ON ?auto_577709 ?auto_577710 ) ( CLEAR ?auto_577707 ) ( ON ?auto_577708 ?auto_577709 ) ( CLEAR ?auto_577708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_577707 ?auto_577708 )
      ( MAKE-16PILE ?auto_577707 ?auto_577708 ?auto_577709 ?auto_577710 ?auto_577711 ?auto_577712 ?auto_577713 ?auto_577714 ?auto_577715 ?auto_577716 ?auto_577717 ?auto_577718 ?auto_577719 ?auto_577720 ?auto_577721 ?auto_577722 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577740 - BLOCK
      ?auto_577741 - BLOCK
      ?auto_577742 - BLOCK
      ?auto_577743 - BLOCK
      ?auto_577744 - BLOCK
      ?auto_577745 - BLOCK
      ?auto_577746 - BLOCK
      ?auto_577747 - BLOCK
      ?auto_577748 - BLOCK
      ?auto_577749 - BLOCK
      ?auto_577750 - BLOCK
      ?auto_577751 - BLOCK
      ?auto_577752 - BLOCK
      ?auto_577753 - BLOCK
      ?auto_577754 - BLOCK
      ?auto_577755 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_577755 ) ( ON-TABLE ?auto_577740 ) ( not ( = ?auto_577740 ?auto_577741 ) ) ( not ( = ?auto_577740 ?auto_577742 ) ) ( not ( = ?auto_577740 ?auto_577743 ) ) ( not ( = ?auto_577740 ?auto_577744 ) ) ( not ( = ?auto_577740 ?auto_577745 ) ) ( not ( = ?auto_577740 ?auto_577746 ) ) ( not ( = ?auto_577740 ?auto_577747 ) ) ( not ( = ?auto_577740 ?auto_577748 ) ) ( not ( = ?auto_577740 ?auto_577749 ) ) ( not ( = ?auto_577740 ?auto_577750 ) ) ( not ( = ?auto_577740 ?auto_577751 ) ) ( not ( = ?auto_577740 ?auto_577752 ) ) ( not ( = ?auto_577740 ?auto_577753 ) ) ( not ( = ?auto_577740 ?auto_577754 ) ) ( not ( = ?auto_577740 ?auto_577755 ) ) ( not ( = ?auto_577741 ?auto_577742 ) ) ( not ( = ?auto_577741 ?auto_577743 ) ) ( not ( = ?auto_577741 ?auto_577744 ) ) ( not ( = ?auto_577741 ?auto_577745 ) ) ( not ( = ?auto_577741 ?auto_577746 ) ) ( not ( = ?auto_577741 ?auto_577747 ) ) ( not ( = ?auto_577741 ?auto_577748 ) ) ( not ( = ?auto_577741 ?auto_577749 ) ) ( not ( = ?auto_577741 ?auto_577750 ) ) ( not ( = ?auto_577741 ?auto_577751 ) ) ( not ( = ?auto_577741 ?auto_577752 ) ) ( not ( = ?auto_577741 ?auto_577753 ) ) ( not ( = ?auto_577741 ?auto_577754 ) ) ( not ( = ?auto_577741 ?auto_577755 ) ) ( not ( = ?auto_577742 ?auto_577743 ) ) ( not ( = ?auto_577742 ?auto_577744 ) ) ( not ( = ?auto_577742 ?auto_577745 ) ) ( not ( = ?auto_577742 ?auto_577746 ) ) ( not ( = ?auto_577742 ?auto_577747 ) ) ( not ( = ?auto_577742 ?auto_577748 ) ) ( not ( = ?auto_577742 ?auto_577749 ) ) ( not ( = ?auto_577742 ?auto_577750 ) ) ( not ( = ?auto_577742 ?auto_577751 ) ) ( not ( = ?auto_577742 ?auto_577752 ) ) ( not ( = ?auto_577742 ?auto_577753 ) ) ( not ( = ?auto_577742 ?auto_577754 ) ) ( not ( = ?auto_577742 ?auto_577755 ) ) ( not ( = ?auto_577743 ?auto_577744 ) ) ( not ( = ?auto_577743 ?auto_577745 ) ) ( not ( = ?auto_577743 ?auto_577746 ) ) ( not ( = ?auto_577743 ?auto_577747 ) ) ( not ( = ?auto_577743 ?auto_577748 ) ) ( not ( = ?auto_577743 ?auto_577749 ) ) ( not ( = ?auto_577743 ?auto_577750 ) ) ( not ( = ?auto_577743 ?auto_577751 ) ) ( not ( = ?auto_577743 ?auto_577752 ) ) ( not ( = ?auto_577743 ?auto_577753 ) ) ( not ( = ?auto_577743 ?auto_577754 ) ) ( not ( = ?auto_577743 ?auto_577755 ) ) ( not ( = ?auto_577744 ?auto_577745 ) ) ( not ( = ?auto_577744 ?auto_577746 ) ) ( not ( = ?auto_577744 ?auto_577747 ) ) ( not ( = ?auto_577744 ?auto_577748 ) ) ( not ( = ?auto_577744 ?auto_577749 ) ) ( not ( = ?auto_577744 ?auto_577750 ) ) ( not ( = ?auto_577744 ?auto_577751 ) ) ( not ( = ?auto_577744 ?auto_577752 ) ) ( not ( = ?auto_577744 ?auto_577753 ) ) ( not ( = ?auto_577744 ?auto_577754 ) ) ( not ( = ?auto_577744 ?auto_577755 ) ) ( not ( = ?auto_577745 ?auto_577746 ) ) ( not ( = ?auto_577745 ?auto_577747 ) ) ( not ( = ?auto_577745 ?auto_577748 ) ) ( not ( = ?auto_577745 ?auto_577749 ) ) ( not ( = ?auto_577745 ?auto_577750 ) ) ( not ( = ?auto_577745 ?auto_577751 ) ) ( not ( = ?auto_577745 ?auto_577752 ) ) ( not ( = ?auto_577745 ?auto_577753 ) ) ( not ( = ?auto_577745 ?auto_577754 ) ) ( not ( = ?auto_577745 ?auto_577755 ) ) ( not ( = ?auto_577746 ?auto_577747 ) ) ( not ( = ?auto_577746 ?auto_577748 ) ) ( not ( = ?auto_577746 ?auto_577749 ) ) ( not ( = ?auto_577746 ?auto_577750 ) ) ( not ( = ?auto_577746 ?auto_577751 ) ) ( not ( = ?auto_577746 ?auto_577752 ) ) ( not ( = ?auto_577746 ?auto_577753 ) ) ( not ( = ?auto_577746 ?auto_577754 ) ) ( not ( = ?auto_577746 ?auto_577755 ) ) ( not ( = ?auto_577747 ?auto_577748 ) ) ( not ( = ?auto_577747 ?auto_577749 ) ) ( not ( = ?auto_577747 ?auto_577750 ) ) ( not ( = ?auto_577747 ?auto_577751 ) ) ( not ( = ?auto_577747 ?auto_577752 ) ) ( not ( = ?auto_577747 ?auto_577753 ) ) ( not ( = ?auto_577747 ?auto_577754 ) ) ( not ( = ?auto_577747 ?auto_577755 ) ) ( not ( = ?auto_577748 ?auto_577749 ) ) ( not ( = ?auto_577748 ?auto_577750 ) ) ( not ( = ?auto_577748 ?auto_577751 ) ) ( not ( = ?auto_577748 ?auto_577752 ) ) ( not ( = ?auto_577748 ?auto_577753 ) ) ( not ( = ?auto_577748 ?auto_577754 ) ) ( not ( = ?auto_577748 ?auto_577755 ) ) ( not ( = ?auto_577749 ?auto_577750 ) ) ( not ( = ?auto_577749 ?auto_577751 ) ) ( not ( = ?auto_577749 ?auto_577752 ) ) ( not ( = ?auto_577749 ?auto_577753 ) ) ( not ( = ?auto_577749 ?auto_577754 ) ) ( not ( = ?auto_577749 ?auto_577755 ) ) ( not ( = ?auto_577750 ?auto_577751 ) ) ( not ( = ?auto_577750 ?auto_577752 ) ) ( not ( = ?auto_577750 ?auto_577753 ) ) ( not ( = ?auto_577750 ?auto_577754 ) ) ( not ( = ?auto_577750 ?auto_577755 ) ) ( not ( = ?auto_577751 ?auto_577752 ) ) ( not ( = ?auto_577751 ?auto_577753 ) ) ( not ( = ?auto_577751 ?auto_577754 ) ) ( not ( = ?auto_577751 ?auto_577755 ) ) ( not ( = ?auto_577752 ?auto_577753 ) ) ( not ( = ?auto_577752 ?auto_577754 ) ) ( not ( = ?auto_577752 ?auto_577755 ) ) ( not ( = ?auto_577753 ?auto_577754 ) ) ( not ( = ?auto_577753 ?auto_577755 ) ) ( not ( = ?auto_577754 ?auto_577755 ) ) ( ON ?auto_577754 ?auto_577755 ) ( ON ?auto_577753 ?auto_577754 ) ( ON ?auto_577752 ?auto_577753 ) ( ON ?auto_577751 ?auto_577752 ) ( ON ?auto_577750 ?auto_577751 ) ( ON ?auto_577749 ?auto_577750 ) ( ON ?auto_577748 ?auto_577749 ) ( ON ?auto_577747 ?auto_577748 ) ( ON ?auto_577746 ?auto_577747 ) ( ON ?auto_577745 ?auto_577746 ) ( ON ?auto_577744 ?auto_577745 ) ( ON ?auto_577743 ?auto_577744 ) ( ON ?auto_577742 ?auto_577743 ) ( CLEAR ?auto_577740 ) ( ON ?auto_577741 ?auto_577742 ) ( CLEAR ?auto_577741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_577740 ?auto_577741 )
      ( MAKE-16PILE ?auto_577740 ?auto_577741 ?auto_577742 ?auto_577743 ?auto_577744 ?auto_577745 ?auto_577746 ?auto_577747 ?auto_577748 ?auto_577749 ?auto_577750 ?auto_577751 ?auto_577752 ?auto_577753 ?auto_577754 ?auto_577755 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577772 - BLOCK
      ?auto_577773 - BLOCK
      ?auto_577774 - BLOCK
      ?auto_577775 - BLOCK
      ?auto_577776 - BLOCK
      ?auto_577777 - BLOCK
      ?auto_577778 - BLOCK
      ?auto_577779 - BLOCK
      ?auto_577780 - BLOCK
      ?auto_577781 - BLOCK
      ?auto_577782 - BLOCK
      ?auto_577783 - BLOCK
      ?auto_577784 - BLOCK
      ?auto_577785 - BLOCK
      ?auto_577786 - BLOCK
      ?auto_577787 - BLOCK
    )
    :vars
    (
      ?auto_577788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_577787 ?auto_577788 ) ( not ( = ?auto_577772 ?auto_577773 ) ) ( not ( = ?auto_577772 ?auto_577774 ) ) ( not ( = ?auto_577772 ?auto_577775 ) ) ( not ( = ?auto_577772 ?auto_577776 ) ) ( not ( = ?auto_577772 ?auto_577777 ) ) ( not ( = ?auto_577772 ?auto_577778 ) ) ( not ( = ?auto_577772 ?auto_577779 ) ) ( not ( = ?auto_577772 ?auto_577780 ) ) ( not ( = ?auto_577772 ?auto_577781 ) ) ( not ( = ?auto_577772 ?auto_577782 ) ) ( not ( = ?auto_577772 ?auto_577783 ) ) ( not ( = ?auto_577772 ?auto_577784 ) ) ( not ( = ?auto_577772 ?auto_577785 ) ) ( not ( = ?auto_577772 ?auto_577786 ) ) ( not ( = ?auto_577772 ?auto_577787 ) ) ( not ( = ?auto_577772 ?auto_577788 ) ) ( not ( = ?auto_577773 ?auto_577774 ) ) ( not ( = ?auto_577773 ?auto_577775 ) ) ( not ( = ?auto_577773 ?auto_577776 ) ) ( not ( = ?auto_577773 ?auto_577777 ) ) ( not ( = ?auto_577773 ?auto_577778 ) ) ( not ( = ?auto_577773 ?auto_577779 ) ) ( not ( = ?auto_577773 ?auto_577780 ) ) ( not ( = ?auto_577773 ?auto_577781 ) ) ( not ( = ?auto_577773 ?auto_577782 ) ) ( not ( = ?auto_577773 ?auto_577783 ) ) ( not ( = ?auto_577773 ?auto_577784 ) ) ( not ( = ?auto_577773 ?auto_577785 ) ) ( not ( = ?auto_577773 ?auto_577786 ) ) ( not ( = ?auto_577773 ?auto_577787 ) ) ( not ( = ?auto_577773 ?auto_577788 ) ) ( not ( = ?auto_577774 ?auto_577775 ) ) ( not ( = ?auto_577774 ?auto_577776 ) ) ( not ( = ?auto_577774 ?auto_577777 ) ) ( not ( = ?auto_577774 ?auto_577778 ) ) ( not ( = ?auto_577774 ?auto_577779 ) ) ( not ( = ?auto_577774 ?auto_577780 ) ) ( not ( = ?auto_577774 ?auto_577781 ) ) ( not ( = ?auto_577774 ?auto_577782 ) ) ( not ( = ?auto_577774 ?auto_577783 ) ) ( not ( = ?auto_577774 ?auto_577784 ) ) ( not ( = ?auto_577774 ?auto_577785 ) ) ( not ( = ?auto_577774 ?auto_577786 ) ) ( not ( = ?auto_577774 ?auto_577787 ) ) ( not ( = ?auto_577774 ?auto_577788 ) ) ( not ( = ?auto_577775 ?auto_577776 ) ) ( not ( = ?auto_577775 ?auto_577777 ) ) ( not ( = ?auto_577775 ?auto_577778 ) ) ( not ( = ?auto_577775 ?auto_577779 ) ) ( not ( = ?auto_577775 ?auto_577780 ) ) ( not ( = ?auto_577775 ?auto_577781 ) ) ( not ( = ?auto_577775 ?auto_577782 ) ) ( not ( = ?auto_577775 ?auto_577783 ) ) ( not ( = ?auto_577775 ?auto_577784 ) ) ( not ( = ?auto_577775 ?auto_577785 ) ) ( not ( = ?auto_577775 ?auto_577786 ) ) ( not ( = ?auto_577775 ?auto_577787 ) ) ( not ( = ?auto_577775 ?auto_577788 ) ) ( not ( = ?auto_577776 ?auto_577777 ) ) ( not ( = ?auto_577776 ?auto_577778 ) ) ( not ( = ?auto_577776 ?auto_577779 ) ) ( not ( = ?auto_577776 ?auto_577780 ) ) ( not ( = ?auto_577776 ?auto_577781 ) ) ( not ( = ?auto_577776 ?auto_577782 ) ) ( not ( = ?auto_577776 ?auto_577783 ) ) ( not ( = ?auto_577776 ?auto_577784 ) ) ( not ( = ?auto_577776 ?auto_577785 ) ) ( not ( = ?auto_577776 ?auto_577786 ) ) ( not ( = ?auto_577776 ?auto_577787 ) ) ( not ( = ?auto_577776 ?auto_577788 ) ) ( not ( = ?auto_577777 ?auto_577778 ) ) ( not ( = ?auto_577777 ?auto_577779 ) ) ( not ( = ?auto_577777 ?auto_577780 ) ) ( not ( = ?auto_577777 ?auto_577781 ) ) ( not ( = ?auto_577777 ?auto_577782 ) ) ( not ( = ?auto_577777 ?auto_577783 ) ) ( not ( = ?auto_577777 ?auto_577784 ) ) ( not ( = ?auto_577777 ?auto_577785 ) ) ( not ( = ?auto_577777 ?auto_577786 ) ) ( not ( = ?auto_577777 ?auto_577787 ) ) ( not ( = ?auto_577777 ?auto_577788 ) ) ( not ( = ?auto_577778 ?auto_577779 ) ) ( not ( = ?auto_577778 ?auto_577780 ) ) ( not ( = ?auto_577778 ?auto_577781 ) ) ( not ( = ?auto_577778 ?auto_577782 ) ) ( not ( = ?auto_577778 ?auto_577783 ) ) ( not ( = ?auto_577778 ?auto_577784 ) ) ( not ( = ?auto_577778 ?auto_577785 ) ) ( not ( = ?auto_577778 ?auto_577786 ) ) ( not ( = ?auto_577778 ?auto_577787 ) ) ( not ( = ?auto_577778 ?auto_577788 ) ) ( not ( = ?auto_577779 ?auto_577780 ) ) ( not ( = ?auto_577779 ?auto_577781 ) ) ( not ( = ?auto_577779 ?auto_577782 ) ) ( not ( = ?auto_577779 ?auto_577783 ) ) ( not ( = ?auto_577779 ?auto_577784 ) ) ( not ( = ?auto_577779 ?auto_577785 ) ) ( not ( = ?auto_577779 ?auto_577786 ) ) ( not ( = ?auto_577779 ?auto_577787 ) ) ( not ( = ?auto_577779 ?auto_577788 ) ) ( not ( = ?auto_577780 ?auto_577781 ) ) ( not ( = ?auto_577780 ?auto_577782 ) ) ( not ( = ?auto_577780 ?auto_577783 ) ) ( not ( = ?auto_577780 ?auto_577784 ) ) ( not ( = ?auto_577780 ?auto_577785 ) ) ( not ( = ?auto_577780 ?auto_577786 ) ) ( not ( = ?auto_577780 ?auto_577787 ) ) ( not ( = ?auto_577780 ?auto_577788 ) ) ( not ( = ?auto_577781 ?auto_577782 ) ) ( not ( = ?auto_577781 ?auto_577783 ) ) ( not ( = ?auto_577781 ?auto_577784 ) ) ( not ( = ?auto_577781 ?auto_577785 ) ) ( not ( = ?auto_577781 ?auto_577786 ) ) ( not ( = ?auto_577781 ?auto_577787 ) ) ( not ( = ?auto_577781 ?auto_577788 ) ) ( not ( = ?auto_577782 ?auto_577783 ) ) ( not ( = ?auto_577782 ?auto_577784 ) ) ( not ( = ?auto_577782 ?auto_577785 ) ) ( not ( = ?auto_577782 ?auto_577786 ) ) ( not ( = ?auto_577782 ?auto_577787 ) ) ( not ( = ?auto_577782 ?auto_577788 ) ) ( not ( = ?auto_577783 ?auto_577784 ) ) ( not ( = ?auto_577783 ?auto_577785 ) ) ( not ( = ?auto_577783 ?auto_577786 ) ) ( not ( = ?auto_577783 ?auto_577787 ) ) ( not ( = ?auto_577783 ?auto_577788 ) ) ( not ( = ?auto_577784 ?auto_577785 ) ) ( not ( = ?auto_577784 ?auto_577786 ) ) ( not ( = ?auto_577784 ?auto_577787 ) ) ( not ( = ?auto_577784 ?auto_577788 ) ) ( not ( = ?auto_577785 ?auto_577786 ) ) ( not ( = ?auto_577785 ?auto_577787 ) ) ( not ( = ?auto_577785 ?auto_577788 ) ) ( not ( = ?auto_577786 ?auto_577787 ) ) ( not ( = ?auto_577786 ?auto_577788 ) ) ( not ( = ?auto_577787 ?auto_577788 ) ) ( ON ?auto_577786 ?auto_577787 ) ( ON ?auto_577785 ?auto_577786 ) ( ON ?auto_577784 ?auto_577785 ) ( ON ?auto_577783 ?auto_577784 ) ( ON ?auto_577782 ?auto_577783 ) ( ON ?auto_577781 ?auto_577782 ) ( ON ?auto_577780 ?auto_577781 ) ( ON ?auto_577779 ?auto_577780 ) ( ON ?auto_577778 ?auto_577779 ) ( ON ?auto_577777 ?auto_577778 ) ( ON ?auto_577776 ?auto_577777 ) ( ON ?auto_577775 ?auto_577776 ) ( ON ?auto_577774 ?auto_577775 ) ( ON ?auto_577773 ?auto_577774 ) ( ON ?auto_577772 ?auto_577773 ) ( CLEAR ?auto_577772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_577772 )
      ( MAKE-16PILE ?auto_577772 ?auto_577773 ?auto_577774 ?auto_577775 ?auto_577776 ?auto_577777 ?auto_577778 ?auto_577779 ?auto_577780 ?auto_577781 ?auto_577782 ?auto_577783 ?auto_577784 ?auto_577785 ?auto_577786 ?auto_577787 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577805 - BLOCK
      ?auto_577806 - BLOCK
      ?auto_577807 - BLOCK
      ?auto_577808 - BLOCK
      ?auto_577809 - BLOCK
      ?auto_577810 - BLOCK
      ?auto_577811 - BLOCK
      ?auto_577812 - BLOCK
      ?auto_577813 - BLOCK
      ?auto_577814 - BLOCK
      ?auto_577815 - BLOCK
      ?auto_577816 - BLOCK
      ?auto_577817 - BLOCK
      ?auto_577818 - BLOCK
      ?auto_577819 - BLOCK
      ?auto_577820 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_577820 ) ( not ( = ?auto_577805 ?auto_577806 ) ) ( not ( = ?auto_577805 ?auto_577807 ) ) ( not ( = ?auto_577805 ?auto_577808 ) ) ( not ( = ?auto_577805 ?auto_577809 ) ) ( not ( = ?auto_577805 ?auto_577810 ) ) ( not ( = ?auto_577805 ?auto_577811 ) ) ( not ( = ?auto_577805 ?auto_577812 ) ) ( not ( = ?auto_577805 ?auto_577813 ) ) ( not ( = ?auto_577805 ?auto_577814 ) ) ( not ( = ?auto_577805 ?auto_577815 ) ) ( not ( = ?auto_577805 ?auto_577816 ) ) ( not ( = ?auto_577805 ?auto_577817 ) ) ( not ( = ?auto_577805 ?auto_577818 ) ) ( not ( = ?auto_577805 ?auto_577819 ) ) ( not ( = ?auto_577805 ?auto_577820 ) ) ( not ( = ?auto_577806 ?auto_577807 ) ) ( not ( = ?auto_577806 ?auto_577808 ) ) ( not ( = ?auto_577806 ?auto_577809 ) ) ( not ( = ?auto_577806 ?auto_577810 ) ) ( not ( = ?auto_577806 ?auto_577811 ) ) ( not ( = ?auto_577806 ?auto_577812 ) ) ( not ( = ?auto_577806 ?auto_577813 ) ) ( not ( = ?auto_577806 ?auto_577814 ) ) ( not ( = ?auto_577806 ?auto_577815 ) ) ( not ( = ?auto_577806 ?auto_577816 ) ) ( not ( = ?auto_577806 ?auto_577817 ) ) ( not ( = ?auto_577806 ?auto_577818 ) ) ( not ( = ?auto_577806 ?auto_577819 ) ) ( not ( = ?auto_577806 ?auto_577820 ) ) ( not ( = ?auto_577807 ?auto_577808 ) ) ( not ( = ?auto_577807 ?auto_577809 ) ) ( not ( = ?auto_577807 ?auto_577810 ) ) ( not ( = ?auto_577807 ?auto_577811 ) ) ( not ( = ?auto_577807 ?auto_577812 ) ) ( not ( = ?auto_577807 ?auto_577813 ) ) ( not ( = ?auto_577807 ?auto_577814 ) ) ( not ( = ?auto_577807 ?auto_577815 ) ) ( not ( = ?auto_577807 ?auto_577816 ) ) ( not ( = ?auto_577807 ?auto_577817 ) ) ( not ( = ?auto_577807 ?auto_577818 ) ) ( not ( = ?auto_577807 ?auto_577819 ) ) ( not ( = ?auto_577807 ?auto_577820 ) ) ( not ( = ?auto_577808 ?auto_577809 ) ) ( not ( = ?auto_577808 ?auto_577810 ) ) ( not ( = ?auto_577808 ?auto_577811 ) ) ( not ( = ?auto_577808 ?auto_577812 ) ) ( not ( = ?auto_577808 ?auto_577813 ) ) ( not ( = ?auto_577808 ?auto_577814 ) ) ( not ( = ?auto_577808 ?auto_577815 ) ) ( not ( = ?auto_577808 ?auto_577816 ) ) ( not ( = ?auto_577808 ?auto_577817 ) ) ( not ( = ?auto_577808 ?auto_577818 ) ) ( not ( = ?auto_577808 ?auto_577819 ) ) ( not ( = ?auto_577808 ?auto_577820 ) ) ( not ( = ?auto_577809 ?auto_577810 ) ) ( not ( = ?auto_577809 ?auto_577811 ) ) ( not ( = ?auto_577809 ?auto_577812 ) ) ( not ( = ?auto_577809 ?auto_577813 ) ) ( not ( = ?auto_577809 ?auto_577814 ) ) ( not ( = ?auto_577809 ?auto_577815 ) ) ( not ( = ?auto_577809 ?auto_577816 ) ) ( not ( = ?auto_577809 ?auto_577817 ) ) ( not ( = ?auto_577809 ?auto_577818 ) ) ( not ( = ?auto_577809 ?auto_577819 ) ) ( not ( = ?auto_577809 ?auto_577820 ) ) ( not ( = ?auto_577810 ?auto_577811 ) ) ( not ( = ?auto_577810 ?auto_577812 ) ) ( not ( = ?auto_577810 ?auto_577813 ) ) ( not ( = ?auto_577810 ?auto_577814 ) ) ( not ( = ?auto_577810 ?auto_577815 ) ) ( not ( = ?auto_577810 ?auto_577816 ) ) ( not ( = ?auto_577810 ?auto_577817 ) ) ( not ( = ?auto_577810 ?auto_577818 ) ) ( not ( = ?auto_577810 ?auto_577819 ) ) ( not ( = ?auto_577810 ?auto_577820 ) ) ( not ( = ?auto_577811 ?auto_577812 ) ) ( not ( = ?auto_577811 ?auto_577813 ) ) ( not ( = ?auto_577811 ?auto_577814 ) ) ( not ( = ?auto_577811 ?auto_577815 ) ) ( not ( = ?auto_577811 ?auto_577816 ) ) ( not ( = ?auto_577811 ?auto_577817 ) ) ( not ( = ?auto_577811 ?auto_577818 ) ) ( not ( = ?auto_577811 ?auto_577819 ) ) ( not ( = ?auto_577811 ?auto_577820 ) ) ( not ( = ?auto_577812 ?auto_577813 ) ) ( not ( = ?auto_577812 ?auto_577814 ) ) ( not ( = ?auto_577812 ?auto_577815 ) ) ( not ( = ?auto_577812 ?auto_577816 ) ) ( not ( = ?auto_577812 ?auto_577817 ) ) ( not ( = ?auto_577812 ?auto_577818 ) ) ( not ( = ?auto_577812 ?auto_577819 ) ) ( not ( = ?auto_577812 ?auto_577820 ) ) ( not ( = ?auto_577813 ?auto_577814 ) ) ( not ( = ?auto_577813 ?auto_577815 ) ) ( not ( = ?auto_577813 ?auto_577816 ) ) ( not ( = ?auto_577813 ?auto_577817 ) ) ( not ( = ?auto_577813 ?auto_577818 ) ) ( not ( = ?auto_577813 ?auto_577819 ) ) ( not ( = ?auto_577813 ?auto_577820 ) ) ( not ( = ?auto_577814 ?auto_577815 ) ) ( not ( = ?auto_577814 ?auto_577816 ) ) ( not ( = ?auto_577814 ?auto_577817 ) ) ( not ( = ?auto_577814 ?auto_577818 ) ) ( not ( = ?auto_577814 ?auto_577819 ) ) ( not ( = ?auto_577814 ?auto_577820 ) ) ( not ( = ?auto_577815 ?auto_577816 ) ) ( not ( = ?auto_577815 ?auto_577817 ) ) ( not ( = ?auto_577815 ?auto_577818 ) ) ( not ( = ?auto_577815 ?auto_577819 ) ) ( not ( = ?auto_577815 ?auto_577820 ) ) ( not ( = ?auto_577816 ?auto_577817 ) ) ( not ( = ?auto_577816 ?auto_577818 ) ) ( not ( = ?auto_577816 ?auto_577819 ) ) ( not ( = ?auto_577816 ?auto_577820 ) ) ( not ( = ?auto_577817 ?auto_577818 ) ) ( not ( = ?auto_577817 ?auto_577819 ) ) ( not ( = ?auto_577817 ?auto_577820 ) ) ( not ( = ?auto_577818 ?auto_577819 ) ) ( not ( = ?auto_577818 ?auto_577820 ) ) ( not ( = ?auto_577819 ?auto_577820 ) ) ( ON ?auto_577819 ?auto_577820 ) ( ON ?auto_577818 ?auto_577819 ) ( ON ?auto_577817 ?auto_577818 ) ( ON ?auto_577816 ?auto_577817 ) ( ON ?auto_577815 ?auto_577816 ) ( ON ?auto_577814 ?auto_577815 ) ( ON ?auto_577813 ?auto_577814 ) ( ON ?auto_577812 ?auto_577813 ) ( ON ?auto_577811 ?auto_577812 ) ( ON ?auto_577810 ?auto_577811 ) ( ON ?auto_577809 ?auto_577810 ) ( ON ?auto_577808 ?auto_577809 ) ( ON ?auto_577807 ?auto_577808 ) ( ON ?auto_577806 ?auto_577807 ) ( ON ?auto_577805 ?auto_577806 ) ( CLEAR ?auto_577805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_577805 )
      ( MAKE-16PILE ?auto_577805 ?auto_577806 ?auto_577807 ?auto_577808 ?auto_577809 ?auto_577810 ?auto_577811 ?auto_577812 ?auto_577813 ?auto_577814 ?auto_577815 ?auto_577816 ?auto_577817 ?auto_577818 ?auto_577819 ?auto_577820 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_577837 - BLOCK
      ?auto_577838 - BLOCK
      ?auto_577839 - BLOCK
      ?auto_577840 - BLOCK
      ?auto_577841 - BLOCK
      ?auto_577842 - BLOCK
      ?auto_577843 - BLOCK
      ?auto_577844 - BLOCK
      ?auto_577845 - BLOCK
      ?auto_577846 - BLOCK
      ?auto_577847 - BLOCK
      ?auto_577848 - BLOCK
      ?auto_577849 - BLOCK
      ?auto_577850 - BLOCK
      ?auto_577851 - BLOCK
      ?auto_577852 - BLOCK
    )
    :vars
    (
      ?auto_577853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_577837 ?auto_577838 ) ) ( not ( = ?auto_577837 ?auto_577839 ) ) ( not ( = ?auto_577837 ?auto_577840 ) ) ( not ( = ?auto_577837 ?auto_577841 ) ) ( not ( = ?auto_577837 ?auto_577842 ) ) ( not ( = ?auto_577837 ?auto_577843 ) ) ( not ( = ?auto_577837 ?auto_577844 ) ) ( not ( = ?auto_577837 ?auto_577845 ) ) ( not ( = ?auto_577837 ?auto_577846 ) ) ( not ( = ?auto_577837 ?auto_577847 ) ) ( not ( = ?auto_577837 ?auto_577848 ) ) ( not ( = ?auto_577837 ?auto_577849 ) ) ( not ( = ?auto_577837 ?auto_577850 ) ) ( not ( = ?auto_577837 ?auto_577851 ) ) ( not ( = ?auto_577837 ?auto_577852 ) ) ( not ( = ?auto_577838 ?auto_577839 ) ) ( not ( = ?auto_577838 ?auto_577840 ) ) ( not ( = ?auto_577838 ?auto_577841 ) ) ( not ( = ?auto_577838 ?auto_577842 ) ) ( not ( = ?auto_577838 ?auto_577843 ) ) ( not ( = ?auto_577838 ?auto_577844 ) ) ( not ( = ?auto_577838 ?auto_577845 ) ) ( not ( = ?auto_577838 ?auto_577846 ) ) ( not ( = ?auto_577838 ?auto_577847 ) ) ( not ( = ?auto_577838 ?auto_577848 ) ) ( not ( = ?auto_577838 ?auto_577849 ) ) ( not ( = ?auto_577838 ?auto_577850 ) ) ( not ( = ?auto_577838 ?auto_577851 ) ) ( not ( = ?auto_577838 ?auto_577852 ) ) ( not ( = ?auto_577839 ?auto_577840 ) ) ( not ( = ?auto_577839 ?auto_577841 ) ) ( not ( = ?auto_577839 ?auto_577842 ) ) ( not ( = ?auto_577839 ?auto_577843 ) ) ( not ( = ?auto_577839 ?auto_577844 ) ) ( not ( = ?auto_577839 ?auto_577845 ) ) ( not ( = ?auto_577839 ?auto_577846 ) ) ( not ( = ?auto_577839 ?auto_577847 ) ) ( not ( = ?auto_577839 ?auto_577848 ) ) ( not ( = ?auto_577839 ?auto_577849 ) ) ( not ( = ?auto_577839 ?auto_577850 ) ) ( not ( = ?auto_577839 ?auto_577851 ) ) ( not ( = ?auto_577839 ?auto_577852 ) ) ( not ( = ?auto_577840 ?auto_577841 ) ) ( not ( = ?auto_577840 ?auto_577842 ) ) ( not ( = ?auto_577840 ?auto_577843 ) ) ( not ( = ?auto_577840 ?auto_577844 ) ) ( not ( = ?auto_577840 ?auto_577845 ) ) ( not ( = ?auto_577840 ?auto_577846 ) ) ( not ( = ?auto_577840 ?auto_577847 ) ) ( not ( = ?auto_577840 ?auto_577848 ) ) ( not ( = ?auto_577840 ?auto_577849 ) ) ( not ( = ?auto_577840 ?auto_577850 ) ) ( not ( = ?auto_577840 ?auto_577851 ) ) ( not ( = ?auto_577840 ?auto_577852 ) ) ( not ( = ?auto_577841 ?auto_577842 ) ) ( not ( = ?auto_577841 ?auto_577843 ) ) ( not ( = ?auto_577841 ?auto_577844 ) ) ( not ( = ?auto_577841 ?auto_577845 ) ) ( not ( = ?auto_577841 ?auto_577846 ) ) ( not ( = ?auto_577841 ?auto_577847 ) ) ( not ( = ?auto_577841 ?auto_577848 ) ) ( not ( = ?auto_577841 ?auto_577849 ) ) ( not ( = ?auto_577841 ?auto_577850 ) ) ( not ( = ?auto_577841 ?auto_577851 ) ) ( not ( = ?auto_577841 ?auto_577852 ) ) ( not ( = ?auto_577842 ?auto_577843 ) ) ( not ( = ?auto_577842 ?auto_577844 ) ) ( not ( = ?auto_577842 ?auto_577845 ) ) ( not ( = ?auto_577842 ?auto_577846 ) ) ( not ( = ?auto_577842 ?auto_577847 ) ) ( not ( = ?auto_577842 ?auto_577848 ) ) ( not ( = ?auto_577842 ?auto_577849 ) ) ( not ( = ?auto_577842 ?auto_577850 ) ) ( not ( = ?auto_577842 ?auto_577851 ) ) ( not ( = ?auto_577842 ?auto_577852 ) ) ( not ( = ?auto_577843 ?auto_577844 ) ) ( not ( = ?auto_577843 ?auto_577845 ) ) ( not ( = ?auto_577843 ?auto_577846 ) ) ( not ( = ?auto_577843 ?auto_577847 ) ) ( not ( = ?auto_577843 ?auto_577848 ) ) ( not ( = ?auto_577843 ?auto_577849 ) ) ( not ( = ?auto_577843 ?auto_577850 ) ) ( not ( = ?auto_577843 ?auto_577851 ) ) ( not ( = ?auto_577843 ?auto_577852 ) ) ( not ( = ?auto_577844 ?auto_577845 ) ) ( not ( = ?auto_577844 ?auto_577846 ) ) ( not ( = ?auto_577844 ?auto_577847 ) ) ( not ( = ?auto_577844 ?auto_577848 ) ) ( not ( = ?auto_577844 ?auto_577849 ) ) ( not ( = ?auto_577844 ?auto_577850 ) ) ( not ( = ?auto_577844 ?auto_577851 ) ) ( not ( = ?auto_577844 ?auto_577852 ) ) ( not ( = ?auto_577845 ?auto_577846 ) ) ( not ( = ?auto_577845 ?auto_577847 ) ) ( not ( = ?auto_577845 ?auto_577848 ) ) ( not ( = ?auto_577845 ?auto_577849 ) ) ( not ( = ?auto_577845 ?auto_577850 ) ) ( not ( = ?auto_577845 ?auto_577851 ) ) ( not ( = ?auto_577845 ?auto_577852 ) ) ( not ( = ?auto_577846 ?auto_577847 ) ) ( not ( = ?auto_577846 ?auto_577848 ) ) ( not ( = ?auto_577846 ?auto_577849 ) ) ( not ( = ?auto_577846 ?auto_577850 ) ) ( not ( = ?auto_577846 ?auto_577851 ) ) ( not ( = ?auto_577846 ?auto_577852 ) ) ( not ( = ?auto_577847 ?auto_577848 ) ) ( not ( = ?auto_577847 ?auto_577849 ) ) ( not ( = ?auto_577847 ?auto_577850 ) ) ( not ( = ?auto_577847 ?auto_577851 ) ) ( not ( = ?auto_577847 ?auto_577852 ) ) ( not ( = ?auto_577848 ?auto_577849 ) ) ( not ( = ?auto_577848 ?auto_577850 ) ) ( not ( = ?auto_577848 ?auto_577851 ) ) ( not ( = ?auto_577848 ?auto_577852 ) ) ( not ( = ?auto_577849 ?auto_577850 ) ) ( not ( = ?auto_577849 ?auto_577851 ) ) ( not ( = ?auto_577849 ?auto_577852 ) ) ( not ( = ?auto_577850 ?auto_577851 ) ) ( not ( = ?auto_577850 ?auto_577852 ) ) ( not ( = ?auto_577851 ?auto_577852 ) ) ( ON ?auto_577837 ?auto_577853 ) ( not ( = ?auto_577852 ?auto_577853 ) ) ( not ( = ?auto_577851 ?auto_577853 ) ) ( not ( = ?auto_577850 ?auto_577853 ) ) ( not ( = ?auto_577849 ?auto_577853 ) ) ( not ( = ?auto_577848 ?auto_577853 ) ) ( not ( = ?auto_577847 ?auto_577853 ) ) ( not ( = ?auto_577846 ?auto_577853 ) ) ( not ( = ?auto_577845 ?auto_577853 ) ) ( not ( = ?auto_577844 ?auto_577853 ) ) ( not ( = ?auto_577843 ?auto_577853 ) ) ( not ( = ?auto_577842 ?auto_577853 ) ) ( not ( = ?auto_577841 ?auto_577853 ) ) ( not ( = ?auto_577840 ?auto_577853 ) ) ( not ( = ?auto_577839 ?auto_577853 ) ) ( not ( = ?auto_577838 ?auto_577853 ) ) ( not ( = ?auto_577837 ?auto_577853 ) ) ( ON ?auto_577838 ?auto_577837 ) ( ON ?auto_577839 ?auto_577838 ) ( ON ?auto_577840 ?auto_577839 ) ( ON ?auto_577841 ?auto_577840 ) ( ON ?auto_577842 ?auto_577841 ) ( ON ?auto_577843 ?auto_577842 ) ( ON ?auto_577844 ?auto_577843 ) ( ON ?auto_577845 ?auto_577844 ) ( ON ?auto_577846 ?auto_577845 ) ( ON ?auto_577847 ?auto_577846 ) ( ON ?auto_577848 ?auto_577847 ) ( ON ?auto_577849 ?auto_577848 ) ( ON ?auto_577850 ?auto_577849 ) ( ON ?auto_577851 ?auto_577850 ) ( ON ?auto_577852 ?auto_577851 ) ( CLEAR ?auto_577852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_577852 ?auto_577851 ?auto_577850 ?auto_577849 ?auto_577848 ?auto_577847 ?auto_577846 ?auto_577845 ?auto_577844 ?auto_577843 ?auto_577842 ?auto_577841 ?auto_577840 ?auto_577839 ?auto_577838 ?auto_577837 )
      ( MAKE-16PILE ?auto_577837 ?auto_577838 ?auto_577839 ?auto_577840 ?auto_577841 ?auto_577842 ?auto_577843 ?auto_577844 ?auto_577845 ?auto_577846 ?auto_577847 ?auto_577848 ?auto_577849 ?auto_577850 ?auto_577851 ?auto_577852 ) )
  )

)

