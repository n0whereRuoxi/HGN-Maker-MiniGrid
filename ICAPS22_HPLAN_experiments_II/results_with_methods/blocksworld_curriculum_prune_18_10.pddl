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
      ?auto_827651 - BLOCK
    )
    :vars
    (
      ?auto_827652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_827651 ?auto_827652 ) ( CLEAR ?auto_827651 ) ( HAND-EMPTY ) ( not ( = ?auto_827651 ?auto_827652 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_827651 ?auto_827652 )
      ( !PUTDOWN ?auto_827651 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_827658 - BLOCK
      ?auto_827659 - BLOCK
    )
    :vars
    (
      ?auto_827660 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_827658 ) ( ON ?auto_827659 ?auto_827660 ) ( CLEAR ?auto_827659 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_827658 ) ( not ( = ?auto_827658 ?auto_827659 ) ) ( not ( = ?auto_827658 ?auto_827660 ) ) ( not ( = ?auto_827659 ?auto_827660 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_827659 ?auto_827660 )
      ( !STACK ?auto_827659 ?auto_827658 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_827668 - BLOCK
      ?auto_827669 - BLOCK
    )
    :vars
    (
      ?auto_827670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_827669 ?auto_827670 ) ( not ( = ?auto_827668 ?auto_827669 ) ) ( not ( = ?auto_827668 ?auto_827670 ) ) ( not ( = ?auto_827669 ?auto_827670 ) ) ( ON ?auto_827668 ?auto_827669 ) ( CLEAR ?auto_827668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_827668 )
      ( MAKE-2PILE ?auto_827668 ?auto_827669 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_827679 - BLOCK
      ?auto_827680 - BLOCK
      ?auto_827681 - BLOCK
    )
    :vars
    (
      ?auto_827682 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_827680 ) ( ON ?auto_827681 ?auto_827682 ) ( CLEAR ?auto_827681 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_827679 ) ( ON ?auto_827680 ?auto_827679 ) ( not ( = ?auto_827679 ?auto_827680 ) ) ( not ( = ?auto_827679 ?auto_827681 ) ) ( not ( = ?auto_827679 ?auto_827682 ) ) ( not ( = ?auto_827680 ?auto_827681 ) ) ( not ( = ?auto_827680 ?auto_827682 ) ) ( not ( = ?auto_827681 ?auto_827682 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_827681 ?auto_827682 )
      ( !STACK ?auto_827681 ?auto_827680 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_827693 - BLOCK
      ?auto_827694 - BLOCK
      ?auto_827695 - BLOCK
    )
    :vars
    (
      ?auto_827696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_827695 ?auto_827696 ) ( ON-TABLE ?auto_827693 ) ( not ( = ?auto_827693 ?auto_827694 ) ) ( not ( = ?auto_827693 ?auto_827695 ) ) ( not ( = ?auto_827693 ?auto_827696 ) ) ( not ( = ?auto_827694 ?auto_827695 ) ) ( not ( = ?auto_827694 ?auto_827696 ) ) ( not ( = ?auto_827695 ?auto_827696 ) ) ( CLEAR ?auto_827693 ) ( ON ?auto_827694 ?auto_827695 ) ( CLEAR ?auto_827694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_827693 ?auto_827694 )
      ( MAKE-3PILE ?auto_827693 ?auto_827694 ?auto_827695 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_827707 - BLOCK
      ?auto_827708 - BLOCK
      ?auto_827709 - BLOCK
    )
    :vars
    (
      ?auto_827710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_827709 ?auto_827710 ) ( not ( = ?auto_827707 ?auto_827708 ) ) ( not ( = ?auto_827707 ?auto_827709 ) ) ( not ( = ?auto_827707 ?auto_827710 ) ) ( not ( = ?auto_827708 ?auto_827709 ) ) ( not ( = ?auto_827708 ?auto_827710 ) ) ( not ( = ?auto_827709 ?auto_827710 ) ) ( ON ?auto_827708 ?auto_827709 ) ( ON ?auto_827707 ?auto_827708 ) ( CLEAR ?auto_827707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_827707 )
      ( MAKE-3PILE ?auto_827707 ?auto_827708 ?auto_827709 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_827722 - BLOCK
      ?auto_827723 - BLOCK
      ?auto_827724 - BLOCK
      ?auto_827725 - BLOCK
    )
    :vars
    (
      ?auto_827726 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_827724 ) ( ON ?auto_827725 ?auto_827726 ) ( CLEAR ?auto_827725 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_827722 ) ( ON ?auto_827723 ?auto_827722 ) ( ON ?auto_827724 ?auto_827723 ) ( not ( = ?auto_827722 ?auto_827723 ) ) ( not ( = ?auto_827722 ?auto_827724 ) ) ( not ( = ?auto_827722 ?auto_827725 ) ) ( not ( = ?auto_827722 ?auto_827726 ) ) ( not ( = ?auto_827723 ?auto_827724 ) ) ( not ( = ?auto_827723 ?auto_827725 ) ) ( not ( = ?auto_827723 ?auto_827726 ) ) ( not ( = ?auto_827724 ?auto_827725 ) ) ( not ( = ?auto_827724 ?auto_827726 ) ) ( not ( = ?auto_827725 ?auto_827726 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_827725 ?auto_827726 )
      ( !STACK ?auto_827725 ?auto_827724 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_827740 - BLOCK
      ?auto_827741 - BLOCK
      ?auto_827742 - BLOCK
      ?auto_827743 - BLOCK
    )
    :vars
    (
      ?auto_827744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_827743 ?auto_827744 ) ( ON-TABLE ?auto_827740 ) ( ON ?auto_827741 ?auto_827740 ) ( not ( = ?auto_827740 ?auto_827741 ) ) ( not ( = ?auto_827740 ?auto_827742 ) ) ( not ( = ?auto_827740 ?auto_827743 ) ) ( not ( = ?auto_827740 ?auto_827744 ) ) ( not ( = ?auto_827741 ?auto_827742 ) ) ( not ( = ?auto_827741 ?auto_827743 ) ) ( not ( = ?auto_827741 ?auto_827744 ) ) ( not ( = ?auto_827742 ?auto_827743 ) ) ( not ( = ?auto_827742 ?auto_827744 ) ) ( not ( = ?auto_827743 ?auto_827744 ) ) ( CLEAR ?auto_827741 ) ( ON ?auto_827742 ?auto_827743 ) ( CLEAR ?auto_827742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_827740 ?auto_827741 ?auto_827742 )
      ( MAKE-4PILE ?auto_827740 ?auto_827741 ?auto_827742 ?auto_827743 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_827758 - BLOCK
      ?auto_827759 - BLOCK
      ?auto_827760 - BLOCK
      ?auto_827761 - BLOCK
    )
    :vars
    (
      ?auto_827762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_827761 ?auto_827762 ) ( ON-TABLE ?auto_827758 ) ( not ( = ?auto_827758 ?auto_827759 ) ) ( not ( = ?auto_827758 ?auto_827760 ) ) ( not ( = ?auto_827758 ?auto_827761 ) ) ( not ( = ?auto_827758 ?auto_827762 ) ) ( not ( = ?auto_827759 ?auto_827760 ) ) ( not ( = ?auto_827759 ?auto_827761 ) ) ( not ( = ?auto_827759 ?auto_827762 ) ) ( not ( = ?auto_827760 ?auto_827761 ) ) ( not ( = ?auto_827760 ?auto_827762 ) ) ( not ( = ?auto_827761 ?auto_827762 ) ) ( ON ?auto_827760 ?auto_827761 ) ( CLEAR ?auto_827758 ) ( ON ?auto_827759 ?auto_827760 ) ( CLEAR ?auto_827759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_827758 ?auto_827759 )
      ( MAKE-4PILE ?auto_827758 ?auto_827759 ?auto_827760 ?auto_827761 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_827776 - BLOCK
      ?auto_827777 - BLOCK
      ?auto_827778 - BLOCK
      ?auto_827779 - BLOCK
    )
    :vars
    (
      ?auto_827780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_827779 ?auto_827780 ) ( not ( = ?auto_827776 ?auto_827777 ) ) ( not ( = ?auto_827776 ?auto_827778 ) ) ( not ( = ?auto_827776 ?auto_827779 ) ) ( not ( = ?auto_827776 ?auto_827780 ) ) ( not ( = ?auto_827777 ?auto_827778 ) ) ( not ( = ?auto_827777 ?auto_827779 ) ) ( not ( = ?auto_827777 ?auto_827780 ) ) ( not ( = ?auto_827778 ?auto_827779 ) ) ( not ( = ?auto_827778 ?auto_827780 ) ) ( not ( = ?auto_827779 ?auto_827780 ) ) ( ON ?auto_827778 ?auto_827779 ) ( ON ?auto_827777 ?auto_827778 ) ( ON ?auto_827776 ?auto_827777 ) ( CLEAR ?auto_827776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_827776 )
      ( MAKE-4PILE ?auto_827776 ?auto_827777 ?auto_827778 ?auto_827779 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_827795 - BLOCK
      ?auto_827796 - BLOCK
      ?auto_827797 - BLOCK
      ?auto_827798 - BLOCK
      ?auto_827799 - BLOCK
    )
    :vars
    (
      ?auto_827800 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_827798 ) ( ON ?auto_827799 ?auto_827800 ) ( CLEAR ?auto_827799 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_827795 ) ( ON ?auto_827796 ?auto_827795 ) ( ON ?auto_827797 ?auto_827796 ) ( ON ?auto_827798 ?auto_827797 ) ( not ( = ?auto_827795 ?auto_827796 ) ) ( not ( = ?auto_827795 ?auto_827797 ) ) ( not ( = ?auto_827795 ?auto_827798 ) ) ( not ( = ?auto_827795 ?auto_827799 ) ) ( not ( = ?auto_827795 ?auto_827800 ) ) ( not ( = ?auto_827796 ?auto_827797 ) ) ( not ( = ?auto_827796 ?auto_827798 ) ) ( not ( = ?auto_827796 ?auto_827799 ) ) ( not ( = ?auto_827796 ?auto_827800 ) ) ( not ( = ?auto_827797 ?auto_827798 ) ) ( not ( = ?auto_827797 ?auto_827799 ) ) ( not ( = ?auto_827797 ?auto_827800 ) ) ( not ( = ?auto_827798 ?auto_827799 ) ) ( not ( = ?auto_827798 ?auto_827800 ) ) ( not ( = ?auto_827799 ?auto_827800 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_827799 ?auto_827800 )
      ( !STACK ?auto_827799 ?auto_827798 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_827817 - BLOCK
      ?auto_827818 - BLOCK
      ?auto_827819 - BLOCK
      ?auto_827820 - BLOCK
      ?auto_827821 - BLOCK
    )
    :vars
    (
      ?auto_827822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_827821 ?auto_827822 ) ( ON-TABLE ?auto_827817 ) ( ON ?auto_827818 ?auto_827817 ) ( ON ?auto_827819 ?auto_827818 ) ( not ( = ?auto_827817 ?auto_827818 ) ) ( not ( = ?auto_827817 ?auto_827819 ) ) ( not ( = ?auto_827817 ?auto_827820 ) ) ( not ( = ?auto_827817 ?auto_827821 ) ) ( not ( = ?auto_827817 ?auto_827822 ) ) ( not ( = ?auto_827818 ?auto_827819 ) ) ( not ( = ?auto_827818 ?auto_827820 ) ) ( not ( = ?auto_827818 ?auto_827821 ) ) ( not ( = ?auto_827818 ?auto_827822 ) ) ( not ( = ?auto_827819 ?auto_827820 ) ) ( not ( = ?auto_827819 ?auto_827821 ) ) ( not ( = ?auto_827819 ?auto_827822 ) ) ( not ( = ?auto_827820 ?auto_827821 ) ) ( not ( = ?auto_827820 ?auto_827822 ) ) ( not ( = ?auto_827821 ?auto_827822 ) ) ( CLEAR ?auto_827819 ) ( ON ?auto_827820 ?auto_827821 ) ( CLEAR ?auto_827820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_827817 ?auto_827818 ?auto_827819 ?auto_827820 )
      ( MAKE-5PILE ?auto_827817 ?auto_827818 ?auto_827819 ?auto_827820 ?auto_827821 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_827839 - BLOCK
      ?auto_827840 - BLOCK
      ?auto_827841 - BLOCK
      ?auto_827842 - BLOCK
      ?auto_827843 - BLOCK
    )
    :vars
    (
      ?auto_827844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_827843 ?auto_827844 ) ( ON-TABLE ?auto_827839 ) ( ON ?auto_827840 ?auto_827839 ) ( not ( = ?auto_827839 ?auto_827840 ) ) ( not ( = ?auto_827839 ?auto_827841 ) ) ( not ( = ?auto_827839 ?auto_827842 ) ) ( not ( = ?auto_827839 ?auto_827843 ) ) ( not ( = ?auto_827839 ?auto_827844 ) ) ( not ( = ?auto_827840 ?auto_827841 ) ) ( not ( = ?auto_827840 ?auto_827842 ) ) ( not ( = ?auto_827840 ?auto_827843 ) ) ( not ( = ?auto_827840 ?auto_827844 ) ) ( not ( = ?auto_827841 ?auto_827842 ) ) ( not ( = ?auto_827841 ?auto_827843 ) ) ( not ( = ?auto_827841 ?auto_827844 ) ) ( not ( = ?auto_827842 ?auto_827843 ) ) ( not ( = ?auto_827842 ?auto_827844 ) ) ( not ( = ?auto_827843 ?auto_827844 ) ) ( ON ?auto_827842 ?auto_827843 ) ( CLEAR ?auto_827840 ) ( ON ?auto_827841 ?auto_827842 ) ( CLEAR ?auto_827841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_827839 ?auto_827840 ?auto_827841 )
      ( MAKE-5PILE ?auto_827839 ?auto_827840 ?auto_827841 ?auto_827842 ?auto_827843 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_827861 - BLOCK
      ?auto_827862 - BLOCK
      ?auto_827863 - BLOCK
      ?auto_827864 - BLOCK
      ?auto_827865 - BLOCK
    )
    :vars
    (
      ?auto_827866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_827865 ?auto_827866 ) ( ON-TABLE ?auto_827861 ) ( not ( = ?auto_827861 ?auto_827862 ) ) ( not ( = ?auto_827861 ?auto_827863 ) ) ( not ( = ?auto_827861 ?auto_827864 ) ) ( not ( = ?auto_827861 ?auto_827865 ) ) ( not ( = ?auto_827861 ?auto_827866 ) ) ( not ( = ?auto_827862 ?auto_827863 ) ) ( not ( = ?auto_827862 ?auto_827864 ) ) ( not ( = ?auto_827862 ?auto_827865 ) ) ( not ( = ?auto_827862 ?auto_827866 ) ) ( not ( = ?auto_827863 ?auto_827864 ) ) ( not ( = ?auto_827863 ?auto_827865 ) ) ( not ( = ?auto_827863 ?auto_827866 ) ) ( not ( = ?auto_827864 ?auto_827865 ) ) ( not ( = ?auto_827864 ?auto_827866 ) ) ( not ( = ?auto_827865 ?auto_827866 ) ) ( ON ?auto_827864 ?auto_827865 ) ( ON ?auto_827863 ?auto_827864 ) ( CLEAR ?auto_827861 ) ( ON ?auto_827862 ?auto_827863 ) ( CLEAR ?auto_827862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_827861 ?auto_827862 )
      ( MAKE-5PILE ?auto_827861 ?auto_827862 ?auto_827863 ?auto_827864 ?auto_827865 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_827883 - BLOCK
      ?auto_827884 - BLOCK
      ?auto_827885 - BLOCK
      ?auto_827886 - BLOCK
      ?auto_827887 - BLOCK
    )
    :vars
    (
      ?auto_827888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_827887 ?auto_827888 ) ( not ( = ?auto_827883 ?auto_827884 ) ) ( not ( = ?auto_827883 ?auto_827885 ) ) ( not ( = ?auto_827883 ?auto_827886 ) ) ( not ( = ?auto_827883 ?auto_827887 ) ) ( not ( = ?auto_827883 ?auto_827888 ) ) ( not ( = ?auto_827884 ?auto_827885 ) ) ( not ( = ?auto_827884 ?auto_827886 ) ) ( not ( = ?auto_827884 ?auto_827887 ) ) ( not ( = ?auto_827884 ?auto_827888 ) ) ( not ( = ?auto_827885 ?auto_827886 ) ) ( not ( = ?auto_827885 ?auto_827887 ) ) ( not ( = ?auto_827885 ?auto_827888 ) ) ( not ( = ?auto_827886 ?auto_827887 ) ) ( not ( = ?auto_827886 ?auto_827888 ) ) ( not ( = ?auto_827887 ?auto_827888 ) ) ( ON ?auto_827886 ?auto_827887 ) ( ON ?auto_827885 ?auto_827886 ) ( ON ?auto_827884 ?auto_827885 ) ( ON ?auto_827883 ?auto_827884 ) ( CLEAR ?auto_827883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_827883 )
      ( MAKE-5PILE ?auto_827883 ?auto_827884 ?auto_827885 ?auto_827886 ?auto_827887 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_827906 - BLOCK
      ?auto_827907 - BLOCK
      ?auto_827908 - BLOCK
      ?auto_827909 - BLOCK
      ?auto_827910 - BLOCK
      ?auto_827911 - BLOCK
    )
    :vars
    (
      ?auto_827912 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_827910 ) ( ON ?auto_827911 ?auto_827912 ) ( CLEAR ?auto_827911 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_827906 ) ( ON ?auto_827907 ?auto_827906 ) ( ON ?auto_827908 ?auto_827907 ) ( ON ?auto_827909 ?auto_827908 ) ( ON ?auto_827910 ?auto_827909 ) ( not ( = ?auto_827906 ?auto_827907 ) ) ( not ( = ?auto_827906 ?auto_827908 ) ) ( not ( = ?auto_827906 ?auto_827909 ) ) ( not ( = ?auto_827906 ?auto_827910 ) ) ( not ( = ?auto_827906 ?auto_827911 ) ) ( not ( = ?auto_827906 ?auto_827912 ) ) ( not ( = ?auto_827907 ?auto_827908 ) ) ( not ( = ?auto_827907 ?auto_827909 ) ) ( not ( = ?auto_827907 ?auto_827910 ) ) ( not ( = ?auto_827907 ?auto_827911 ) ) ( not ( = ?auto_827907 ?auto_827912 ) ) ( not ( = ?auto_827908 ?auto_827909 ) ) ( not ( = ?auto_827908 ?auto_827910 ) ) ( not ( = ?auto_827908 ?auto_827911 ) ) ( not ( = ?auto_827908 ?auto_827912 ) ) ( not ( = ?auto_827909 ?auto_827910 ) ) ( not ( = ?auto_827909 ?auto_827911 ) ) ( not ( = ?auto_827909 ?auto_827912 ) ) ( not ( = ?auto_827910 ?auto_827911 ) ) ( not ( = ?auto_827910 ?auto_827912 ) ) ( not ( = ?auto_827911 ?auto_827912 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_827911 ?auto_827912 )
      ( !STACK ?auto_827911 ?auto_827910 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_827932 - BLOCK
      ?auto_827933 - BLOCK
      ?auto_827934 - BLOCK
      ?auto_827935 - BLOCK
      ?auto_827936 - BLOCK
      ?auto_827937 - BLOCK
    )
    :vars
    (
      ?auto_827938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_827937 ?auto_827938 ) ( ON-TABLE ?auto_827932 ) ( ON ?auto_827933 ?auto_827932 ) ( ON ?auto_827934 ?auto_827933 ) ( ON ?auto_827935 ?auto_827934 ) ( not ( = ?auto_827932 ?auto_827933 ) ) ( not ( = ?auto_827932 ?auto_827934 ) ) ( not ( = ?auto_827932 ?auto_827935 ) ) ( not ( = ?auto_827932 ?auto_827936 ) ) ( not ( = ?auto_827932 ?auto_827937 ) ) ( not ( = ?auto_827932 ?auto_827938 ) ) ( not ( = ?auto_827933 ?auto_827934 ) ) ( not ( = ?auto_827933 ?auto_827935 ) ) ( not ( = ?auto_827933 ?auto_827936 ) ) ( not ( = ?auto_827933 ?auto_827937 ) ) ( not ( = ?auto_827933 ?auto_827938 ) ) ( not ( = ?auto_827934 ?auto_827935 ) ) ( not ( = ?auto_827934 ?auto_827936 ) ) ( not ( = ?auto_827934 ?auto_827937 ) ) ( not ( = ?auto_827934 ?auto_827938 ) ) ( not ( = ?auto_827935 ?auto_827936 ) ) ( not ( = ?auto_827935 ?auto_827937 ) ) ( not ( = ?auto_827935 ?auto_827938 ) ) ( not ( = ?auto_827936 ?auto_827937 ) ) ( not ( = ?auto_827936 ?auto_827938 ) ) ( not ( = ?auto_827937 ?auto_827938 ) ) ( CLEAR ?auto_827935 ) ( ON ?auto_827936 ?auto_827937 ) ( CLEAR ?auto_827936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_827932 ?auto_827933 ?auto_827934 ?auto_827935 ?auto_827936 )
      ( MAKE-6PILE ?auto_827932 ?auto_827933 ?auto_827934 ?auto_827935 ?auto_827936 ?auto_827937 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_827958 - BLOCK
      ?auto_827959 - BLOCK
      ?auto_827960 - BLOCK
      ?auto_827961 - BLOCK
      ?auto_827962 - BLOCK
      ?auto_827963 - BLOCK
    )
    :vars
    (
      ?auto_827964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_827963 ?auto_827964 ) ( ON-TABLE ?auto_827958 ) ( ON ?auto_827959 ?auto_827958 ) ( ON ?auto_827960 ?auto_827959 ) ( not ( = ?auto_827958 ?auto_827959 ) ) ( not ( = ?auto_827958 ?auto_827960 ) ) ( not ( = ?auto_827958 ?auto_827961 ) ) ( not ( = ?auto_827958 ?auto_827962 ) ) ( not ( = ?auto_827958 ?auto_827963 ) ) ( not ( = ?auto_827958 ?auto_827964 ) ) ( not ( = ?auto_827959 ?auto_827960 ) ) ( not ( = ?auto_827959 ?auto_827961 ) ) ( not ( = ?auto_827959 ?auto_827962 ) ) ( not ( = ?auto_827959 ?auto_827963 ) ) ( not ( = ?auto_827959 ?auto_827964 ) ) ( not ( = ?auto_827960 ?auto_827961 ) ) ( not ( = ?auto_827960 ?auto_827962 ) ) ( not ( = ?auto_827960 ?auto_827963 ) ) ( not ( = ?auto_827960 ?auto_827964 ) ) ( not ( = ?auto_827961 ?auto_827962 ) ) ( not ( = ?auto_827961 ?auto_827963 ) ) ( not ( = ?auto_827961 ?auto_827964 ) ) ( not ( = ?auto_827962 ?auto_827963 ) ) ( not ( = ?auto_827962 ?auto_827964 ) ) ( not ( = ?auto_827963 ?auto_827964 ) ) ( ON ?auto_827962 ?auto_827963 ) ( CLEAR ?auto_827960 ) ( ON ?auto_827961 ?auto_827962 ) ( CLEAR ?auto_827961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_827958 ?auto_827959 ?auto_827960 ?auto_827961 )
      ( MAKE-6PILE ?auto_827958 ?auto_827959 ?auto_827960 ?auto_827961 ?auto_827962 ?auto_827963 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_827984 - BLOCK
      ?auto_827985 - BLOCK
      ?auto_827986 - BLOCK
      ?auto_827987 - BLOCK
      ?auto_827988 - BLOCK
      ?auto_827989 - BLOCK
    )
    :vars
    (
      ?auto_827990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_827989 ?auto_827990 ) ( ON-TABLE ?auto_827984 ) ( ON ?auto_827985 ?auto_827984 ) ( not ( = ?auto_827984 ?auto_827985 ) ) ( not ( = ?auto_827984 ?auto_827986 ) ) ( not ( = ?auto_827984 ?auto_827987 ) ) ( not ( = ?auto_827984 ?auto_827988 ) ) ( not ( = ?auto_827984 ?auto_827989 ) ) ( not ( = ?auto_827984 ?auto_827990 ) ) ( not ( = ?auto_827985 ?auto_827986 ) ) ( not ( = ?auto_827985 ?auto_827987 ) ) ( not ( = ?auto_827985 ?auto_827988 ) ) ( not ( = ?auto_827985 ?auto_827989 ) ) ( not ( = ?auto_827985 ?auto_827990 ) ) ( not ( = ?auto_827986 ?auto_827987 ) ) ( not ( = ?auto_827986 ?auto_827988 ) ) ( not ( = ?auto_827986 ?auto_827989 ) ) ( not ( = ?auto_827986 ?auto_827990 ) ) ( not ( = ?auto_827987 ?auto_827988 ) ) ( not ( = ?auto_827987 ?auto_827989 ) ) ( not ( = ?auto_827987 ?auto_827990 ) ) ( not ( = ?auto_827988 ?auto_827989 ) ) ( not ( = ?auto_827988 ?auto_827990 ) ) ( not ( = ?auto_827989 ?auto_827990 ) ) ( ON ?auto_827988 ?auto_827989 ) ( ON ?auto_827987 ?auto_827988 ) ( CLEAR ?auto_827985 ) ( ON ?auto_827986 ?auto_827987 ) ( CLEAR ?auto_827986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_827984 ?auto_827985 ?auto_827986 )
      ( MAKE-6PILE ?auto_827984 ?auto_827985 ?auto_827986 ?auto_827987 ?auto_827988 ?auto_827989 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_828010 - BLOCK
      ?auto_828011 - BLOCK
      ?auto_828012 - BLOCK
      ?auto_828013 - BLOCK
      ?auto_828014 - BLOCK
      ?auto_828015 - BLOCK
    )
    :vars
    (
      ?auto_828016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_828015 ?auto_828016 ) ( ON-TABLE ?auto_828010 ) ( not ( = ?auto_828010 ?auto_828011 ) ) ( not ( = ?auto_828010 ?auto_828012 ) ) ( not ( = ?auto_828010 ?auto_828013 ) ) ( not ( = ?auto_828010 ?auto_828014 ) ) ( not ( = ?auto_828010 ?auto_828015 ) ) ( not ( = ?auto_828010 ?auto_828016 ) ) ( not ( = ?auto_828011 ?auto_828012 ) ) ( not ( = ?auto_828011 ?auto_828013 ) ) ( not ( = ?auto_828011 ?auto_828014 ) ) ( not ( = ?auto_828011 ?auto_828015 ) ) ( not ( = ?auto_828011 ?auto_828016 ) ) ( not ( = ?auto_828012 ?auto_828013 ) ) ( not ( = ?auto_828012 ?auto_828014 ) ) ( not ( = ?auto_828012 ?auto_828015 ) ) ( not ( = ?auto_828012 ?auto_828016 ) ) ( not ( = ?auto_828013 ?auto_828014 ) ) ( not ( = ?auto_828013 ?auto_828015 ) ) ( not ( = ?auto_828013 ?auto_828016 ) ) ( not ( = ?auto_828014 ?auto_828015 ) ) ( not ( = ?auto_828014 ?auto_828016 ) ) ( not ( = ?auto_828015 ?auto_828016 ) ) ( ON ?auto_828014 ?auto_828015 ) ( ON ?auto_828013 ?auto_828014 ) ( ON ?auto_828012 ?auto_828013 ) ( CLEAR ?auto_828010 ) ( ON ?auto_828011 ?auto_828012 ) ( CLEAR ?auto_828011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_828010 ?auto_828011 )
      ( MAKE-6PILE ?auto_828010 ?auto_828011 ?auto_828012 ?auto_828013 ?auto_828014 ?auto_828015 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_828036 - BLOCK
      ?auto_828037 - BLOCK
      ?auto_828038 - BLOCK
      ?auto_828039 - BLOCK
      ?auto_828040 - BLOCK
      ?auto_828041 - BLOCK
    )
    :vars
    (
      ?auto_828042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_828041 ?auto_828042 ) ( not ( = ?auto_828036 ?auto_828037 ) ) ( not ( = ?auto_828036 ?auto_828038 ) ) ( not ( = ?auto_828036 ?auto_828039 ) ) ( not ( = ?auto_828036 ?auto_828040 ) ) ( not ( = ?auto_828036 ?auto_828041 ) ) ( not ( = ?auto_828036 ?auto_828042 ) ) ( not ( = ?auto_828037 ?auto_828038 ) ) ( not ( = ?auto_828037 ?auto_828039 ) ) ( not ( = ?auto_828037 ?auto_828040 ) ) ( not ( = ?auto_828037 ?auto_828041 ) ) ( not ( = ?auto_828037 ?auto_828042 ) ) ( not ( = ?auto_828038 ?auto_828039 ) ) ( not ( = ?auto_828038 ?auto_828040 ) ) ( not ( = ?auto_828038 ?auto_828041 ) ) ( not ( = ?auto_828038 ?auto_828042 ) ) ( not ( = ?auto_828039 ?auto_828040 ) ) ( not ( = ?auto_828039 ?auto_828041 ) ) ( not ( = ?auto_828039 ?auto_828042 ) ) ( not ( = ?auto_828040 ?auto_828041 ) ) ( not ( = ?auto_828040 ?auto_828042 ) ) ( not ( = ?auto_828041 ?auto_828042 ) ) ( ON ?auto_828040 ?auto_828041 ) ( ON ?auto_828039 ?auto_828040 ) ( ON ?auto_828038 ?auto_828039 ) ( ON ?auto_828037 ?auto_828038 ) ( ON ?auto_828036 ?auto_828037 ) ( CLEAR ?auto_828036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_828036 )
      ( MAKE-6PILE ?auto_828036 ?auto_828037 ?auto_828038 ?auto_828039 ?auto_828040 ?auto_828041 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_828063 - BLOCK
      ?auto_828064 - BLOCK
      ?auto_828065 - BLOCK
      ?auto_828066 - BLOCK
      ?auto_828067 - BLOCK
      ?auto_828068 - BLOCK
      ?auto_828069 - BLOCK
    )
    :vars
    (
      ?auto_828070 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_828068 ) ( ON ?auto_828069 ?auto_828070 ) ( CLEAR ?auto_828069 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_828063 ) ( ON ?auto_828064 ?auto_828063 ) ( ON ?auto_828065 ?auto_828064 ) ( ON ?auto_828066 ?auto_828065 ) ( ON ?auto_828067 ?auto_828066 ) ( ON ?auto_828068 ?auto_828067 ) ( not ( = ?auto_828063 ?auto_828064 ) ) ( not ( = ?auto_828063 ?auto_828065 ) ) ( not ( = ?auto_828063 ?auto_828066 ) ) ( not ( = ?auto_828063 ?auto_828067 ) ) ( not ( = ?auto_828063 ?auto_828068 ) ) ( not ( = ?auto_828063 ?auto_828069 ) ) ( not ( = ?auto_828063 ?auto_828070 ) ) ( not ( = ?auto_828064 ?auto_828065 ) ) ( not ( = ?auto_828064 ?auto_828066 ) ) ( not ( = ?auto_828064 ?auto_828067 ) ) ( not ( = ?auto_828064 ?auto_828068 ) ) ( not ( = ?auto_828064 ?auto_828069 ) ) ( not ( = ?auto_828064 ?auto_828070 ) ) ( not ( = ?auto_828065 ?auto_828066 ) ) ( not ( = ?auto_828065 ?auto_828067 ) ) ( not ( = ?auto_828065 ?auto_828068 ) ) ( not ( = ?auto_828065 ?auto_828069 ) ) ( not ( = ?auto_828065 ?auto_828070 ) ) ( not ( = ?auto_828066 ?auto_828067 ) ) ( not ( = ?auto_828066 ?auto_828068 ) ) ( not ( = ?auto_828066 ?auto_828069 ) ) ( not ( = ?auto_828066 ?auto_828070 ) ) ( not ( = ?auto_828067 ?auto_828068 ) ) ( not ( = ?auto_828067 ?auto_828069 ) ) ( not ( = ?auto_828067 ?auto_828070 ) ) ( not ( = ?auto_828068 ?auto_828069 ) ) ( not ( = ?auto_828068 ?auto_828070 ) ) ( not ( = ?auto_828069 ?auto_828070 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_828069 ?auto_828070 )
      ( !STACK ?auto_828069 ?auto_828068 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_828093 - BLOCK
      ?auto_828094 - BLOCK
      ?auto_828095 - BLOCK
      ?auto_828096 - BLOCK
      ?auto_828097 - BLOCK
      ?auto_828098 - BLOCK
      ?auto_828099 - BLOCK
    )
    :vars
    (
      ?auto_828100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_828099 ?auto_828100 ) ( ON-TABLE ?auto_828093 ) ( ON ?auto_828094 ?auto_828093 ) ( ON ?auto_828095 ?auto_828094 ) ( ON ?auto_828096 ?auto_828095 ) ( ON ?auto_828097 ?auto_828096 ) ( not ( = ?auto_828093 ?auto_828094 ) ) ( not ( = ?auto_828093 ?auto_828095 ) ) ( not ( = ?auto_828093 ?auto_828096 ) ) ( not ( = ?auto_828093 ?auto_828097 ) ) ( not ( = ?auto_828093 ?auto_828098 ) ) ( not ( = ?auto_828093 ?auto_828099 ) ) ( not ( = ?auto_828093 ?auto_828100 ) ) ( not ( = ?auto_828094 ?auto_828095 ) ) ( not ( = ?auto_828094 ?auto_828096 ) ) ( not ( = ?auto_828094 ?auto_828097 ) ) ( not ( = ?auto_828094 ?auto_828098 ) ) ( not ( = ?auto_828094 ?auto_828099 ) ) ( not ( = ?auto_828094 ?auto_828100 ) ) ( not ( = ?auto_828095 ?auto_828096 ) ) ( not ( = ?auto_828095 ?auto_828097 ) ) ( not ( = ?auto_828095 ?auto_828098 ) ) ( not ( = ?auto_828095 ?auto_828099 ) ) ( not ( = ?auto_828095 ?auto_828100 ) ) ( not ( = ?auto_828096 ?auto_828097 ) ) ( not ( = ?auto_828096 ?auto_828098 ) ) ( not ( = ?auto_828096 ?auto_828099 ) ) ( not ( = ?auto_828096 ?auto_828100 ) ) ( not ( = ?auto_828097 ?auto_828098 ) ) ( not ( = ?auto_828097 ?auto_828099 ) ) ( not ( = ?auto_828097 ?auto_828100 ) ) ( not ( = ?auto_828098 ?auto_828099 ) ) ( not ( = ?auto_828098 ?auto_828100 ) ) ( not ( = ?auto_828099 ?auto_828100 ) ) ( CLEAR ?auto_828097 ) ( ON ?auto_828098 ?auto_828099 ) ( CLEAR ?auto_828098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_828093 ?auto_828094 ?auto_828095 ?auto_828096 ?auto_828097 ?auto_828098 )
      ( MAKE-7PILE ?auto_828093 ?auto_828094 ?auto_828095 ?auto_828096 ?auto_828097 ?auto_828098 ?auto_828099 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_828123 - BLOCK
      ?auto_828124 - BLOCK
      ?auto_828125 - BLOCK
      ?auto_828126 - BLOCK
      ?auto_828127 - BLOCK
      ?auto_828128 - BLOCK
      ?auto_828129 - BLOCK
    )
    :vars
    (
      ?auto_828130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_828129 ?auto_828130 ) ( ON-TABLE ?auto_828123 ) ( ON ?auto_828124 ?auto_828123 ) ( ON ?auto_828125 ?auto_828124 ) ( ON ?auto_828126 ?auto_828125 ) ( not ( = ?auto_828123 ?auto_828124 ) ) ( not ( = ?auto_828123 ?auto_828125 ) ) ( not ( = ?auto_828123 ?auto_828126 ) ) ( not ( = ?auto_828123 ?auto_828127 ) ) ( not ( = ?auto_828123 ?auto_828128 ) ) ( not ( = ?auto_828123 ?auto_828129 ) ) ( not ( = ?auto_828123 ?auto_828130 ) ) ( not ( = ?auto_828124 ?auto_828125 ) ) ( not ( = ?auto_828124 ?auto_828126 ) ) ( not ( = ?auto_828124 ?auto_828127 ) ) ( not ( = ?auto_828124 ?auto_828128 ) ) ( not ( = ?auto_828124 ?auto_828129 ) ) ( not ( = ?auto_828124 ?auto_828130 ) ) ( not ( = ?auto_828125 ?auto_828126 ) ) ( not ( = ?auto_828125 ?auto_828127 ) ) ( not ( = ?auto_828125 ?auto_828128 ) ) ( not ( = ?auto_828125 ?auto_828129 ) ) ( not ( = ?auto_828125 ?auto_828130 ) ) ( not ( = ?auto_828126 ?auto_828127 ) ) ( not ( = ?auto_828126 ?auto_828128 ) ) ( not ( = ?auto_828126 ?auto_828129 ) ) ( not ( = ?auto_828126 ?auto_828130 ) ) ( not ( = ?auto_828127 ?auto_828128 ) ) ( not ( = ?auto_828127 ?auto_828129 ) ) ( not ( = ?auto_828127 ?auto_828130 ) ) ( not ( = ?auto_828128 ?auto_828129 ) ) ( not ( = ?auto_828128 ?auto_828130 ) ) ( not ( = ?auto_828129 ?auto_828130 ) ) ( ON ?auto_828128 ?auto_828129 ) ( CLEAR ?auto_828126 ) ( ON ?auto_828127 ?auto_828128 ) ( CLEAR ?auto_828127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_828123 ?auto_828124 ?auto_828125 ?auto_828126 ?auto_828127 )
      ( MAKE-7PILE ?auto_828123 ?auto_828124 ?auto_828125 ?auto_828126 ?auto_828127 ?auto_828128 ?auto_828129 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_828153 - BLOCK
      ?auto_828154 - BLOCK
      ?auto_828155 - BLOCK
      ?auto_828156 - BLOCK
      ?auto_828157 - BLOCK
      ?auto_828158 - BLOCK
      ?auto_828159 - BLOCK
    )
    :vars
    (
      ?auto_828160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_828159 ?auto_828160 ) ( ON-TABLE ?auto_828153 ) ( ON ?auto_828154 ?auto_828153 ) ( ON ?auto_828155 ?auto_828154 ) ( not ( = ?auto_828153 ?auto_828154 ) ) ( not ( = ?auto_828153 ?auto_828155 ) ) ( not ( = ?auto_828153 ?auto_828156 ) ) ( not ( = ?auto_828153 ?auto_828157 ) ) ( not ( = ?auto_828153 ?auto_828158 ) ) ( not ( = ?auto_828153 ?auto_828159 ) ) ( not ( = ?auto_828153 ?auto_828160 ) ) ( not ( = ?auto_828154 ?auto_828155 ) ) ( not ( = ?auto_828154 ?auto_828156 ) ) ( not ( = ?auto_828154 ?auto_828157 ) ) ( not ( = ?auto_828154 ?auto_828158 ) ) ( not ( = ?auto_828154 ?auto_828159 ) ) ( not ( = ?auto_828154 ?auto_828160 ) ) ( not ( = ?auto_828155 ?auto_828156 ) ) ( not ( = ?auto_828155 ?auto_828157 ) ) ( not ( = ?auto_828155 ?auto_828158 ) ) ( not ( = ?auto_828155 ?auto_828159 ) ) ( not ( = ?auto_828155 ?auto_828160 ) ) ( not ( = ?auto_828156 ?auto_828157 ) ) ( not ( = ?auto_828156 ?auto_828158 ) ) ( not ( = ?auto_828156 ?auto_828159 ) ) ( not ( = ?auto_828156 ?auto_828160 ) ) ( not ( = ?auto_828157 ?auto_828158 ) ) ( not ( = ?auto_828157 ?auto_828159 ) ) ( not ( = ?auto_828157 ?auto_828160 ) ) ( not ( = ?auto_828158 ?auto_828159 ) ) ( not ( = ?auto_828158 ?auto_828160 ) ) ( not ( = ?auto_828159 ?auto_828160 ) ) ( ON ?auto_828158 ?auto_828159 ) ( ON ?auto_828157 ?auto_828158 ) ( CLEAR ?auto_828155 ) ( ON ?auto_828156 ?auto_828157 ) ( CLEAR ?auto_828156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_828153 ?auto_828154 ?auto_828155 ?auto_828156 )
      ( MAKE-7PILE ?auto_828153 ?auto_828154 ?auto_828155 ?auto_828156 ?auto_828157 ?auto_828158 ?auto_828159 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_828183 - BLOCK
      ?auto_828184 - BLOCK
      ?auto_828185 - BLOCK
      ?auto_828186 - BLOCK
      ?auto_828187 - BLOCK
      ?auto_828188 - BLOCK
      ?auto_828189 - BLOCK
    )
    :vars
    (
      ?auto_828190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_828189 ?auto_828190 ) ( ON-TABLE ?auto_828183 ) ( ON ?auto_828184 ?auto_828183 ) ( not ( = ?auto_828183 ?auto_828184 ) ) ( not ( = ?auto_828183 ?auto_828185 ) ) ( not ( = ?auto_828183 ?auto_828186 ) ) ( not ( = ?auto_828183 ?auto_828187 ) ) ( not ( = ?auto_828183 ?auto_828188 ) ) ( not ( = ?auto_828183 ?auto_828189 ) ) ( not ( = ?auto_828183 ?auto_828190 ) ) ( not ( = ?auto_828184 ?auto_828185 ) ) ( not ( = ?auto_828184 ?auto_828186 ) ) ( not ( = ?auto_828184 ?auto_828187 ) ) ( not ( = ?auto_828184 ?auto_828188 ) ) ( not ( = ?auto_828184 ?auto_828189 ) ) ( not ( = ?auto_828184 ?auto_828190 ) ) ( not ( = ?auto_828185 ?auto_828186 ) ) ( not ( = ?auto_828185 ?auto_828187 ) ) ( not ( = ?auto_828185 ?auto_828188 ) ) ( not ( = ?auto_828185 ?auto_828189 ) ) ( not ( = ?auto_828185 ?auto_828190 ) ) ( not ( = ?auto_828186 ?auto_828187 ) ) ( not ( = ?auto_828186 ?auto_828188 ) ) ( not ( = ?auto_828186 ?auto_828189 ) ) ( not ( = ?auto_828186 ?auto_828190 ) ) ( not ( = ?auto_828187 ?auto_828188 ) ) ( not ( = ?auto_828187 ?auto_828189 ) ) ( not ( = ?auto_828187 ?auto_828190 ) ) ( not ( = ?auto_828188 ?auto_828189 ) ) ( not ( = ?auto_828188 ?auto_828190 ) ) ( not ( = ?auto_828189 ?auto_828190 ) ) ( ON ?auto_828188 ?auto_828189 ) ( ON ?auto_828187 ?auto_828188 ) ( ON ?auto_828186 ?auto_828187 ) ( CLEAR ?auto_828184 ) ( ON ?auto_828185 ?auto_828186 ) ( CLEAR ?auto_828185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_828183 ?auto_828184 ?auto_828185 )
      ( MAKE-7PILE ?auto_828183 ?auto_828184 ?auto_828185 ?auto_828186 ?auto_828187 ?auto_828188 ?auto_828189 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_828213 - BLOCK
      ?auto_828214 - BLOCK
      ?auto_828215 - BLOCK
      ?auto_828216 - BLOCK
      ?auto_828217 - BLOCK
      ?auto_828218 - BLOCK
      ?auto_828219 - BLOCK
    )
    :vars
    (
      ?auto_828220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_828219 ?auto_828220 ) ( ON-TABLE ?auto_828213 ) ( not ( = ?auto_828213 ?auto_828214 ) ) ( not ( = ?auto_828213 ?auto_828215 ) ) ( not ( = ?auto_828213 ?auto_828216 ) ) ( not ( = ?auto_828213 ?auto_828217 ) ) ( not ( = ?auto_828213 ?auto_828218 ) ) ( not ( = ?auto_828213 ?auto_828219 ) ) ( not ( = ?auto_828213 ?auto_828220 ) ) ( not ( = ?auto_828214 ?auto_828215 ) ) ( not ( = ?auto_828214 ?auto_828216 ) ) ( not ( = ?auto_828214 ?auto_828217 ) ) ( not ( = ?auto_828214 ?auto_828218 ) ) ( not ( = ?auto_828214 ?auto_828219 ) ) ( not ( = ?auto_828214 ?auto_828220 ) ) ( not ( = ?auto_828215 ?auto_828216 ) ) ( not ( = ?auto_828215 ?auto_828217 ) ) ( not ( = ?auto_828215 ?auto_828218 ) ) ( not ( = ?auto_828215 ?auto_828219 ) ) ( not ( = ?auto_828215 ?auto_828220 ) ) ( not ( = ?auto_828216 ?auto_828217 ) ) ( not ( = ?auto_828216 ?auto_828218 ) ) ( not ( = ?auto_828216 ?auto_828219 ) ) ( not ( = ?auto_828216 ?auto_828220 ) ) ( not ( = ?auto_828217 ?auto_828218 ) ) ( not ( = ?auto_828217 ?auto_828219 ) ) ( not ( = ?auto_828217 ?auto_828220 ) ) ( not ( = ?auto_828218 ?auto_828219 ) ) ( not ( = ?auto_828218 ?auto_828220 ) ) ( not ( = ?auto_828219 ?auto_828220 ) ) ( ON ?auto_828218 ?auto_828219 ) ( ON ?auto_828217 ?auto_828218 ) ( ON ?auto_828216 ?auto_828217 ) ( ON ?auto_828215 ?auto_828216 ) ( CLEAR ?auto_828213 ) ( ON ?auto_828214 ?auto_828215 ) ( CLEAR ?auto_828214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_828213 ?auto_828214 )
      ( MAKE-7PILE ?auto_828213 ?auto_828214 ?auto_828215 ?auto_828216 ?auto_828217 ?auto_828218 ?auto_828219 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_828243 - BLOCK
      ?auto_828244 - BLOCK
      ?auto_828245 - BLOCK
      ?auto_828246 - BLOCK
      ?auto_828247 - BLOCK
      ?auto_828248 - BLOCK
      ?auto_828249 - BLOCK
    )
    :vars
    (
      ?auto_828250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_828249 ?auto_828250 ) ( not ( = ?auto_828243 ?auto_828244 ) ) ( not ( = ?auto_828243 ?auto_828245 ) ) ( not ( = ?auto_828243 ?auto_828246 ) ) ( not ( = ?auto_828243 ?auto_828247 ) ) ( not ( = ?auto_828243 ?auto_828248 ) ) ( not ( = ?auto_828243 ?auto_828249 ) ) ( not ( = ?auto_828243 ?auto_828250 ) ) ( not ( = ?auto_828244 ?auto_828245 ) ) ( not ( = ?auto_828244 ?auto_828246 ) ) ( not ( = ?auto_828244 ?auto_828247 ) ) ( not ( = ?auto_828244 ?auto_828248 ) ) ( not ( = ?auto_828244 ?auto_828249 ) ) ( not ( = ?auto_828244 ?auto_828250 ) ) ( not ( = ?auto_828245 ?auto_828246 ) ) ( not ( = ?auto_828245 ?auto_828247 ) ) ( not ( = ?auto_828245 ?auto_828248 ) ) ( not ( = ?auto_828245 ?auto_828249 ) ) ( not ( = ?auto_828245 ?auto_828250 ) ) ( not ( = ?auto_828246 ?auto_828247 ) ) ( not ( = ?auto_828246 ?auto_828248 ) ) ( not ( = ?auto_828246 ?auto_828249 ) ) ( not ( = ?auto_828246 ?auto_828250 ) ) ( not ( = ?auto_828247 ?auto_828248 ) ) ( not ( = ?auto_828247 ?auto_828249 ) ) ( not ( = ?auto_828247 ?auto_828250 ) ) ( not ( = ?auto_828248 ?auto_828249 ) ) ( not ( = ?auto_828248 ?auto_828250 ) ) ( not ( = ?auto_828249 ?auto_828250 ) ) ( ON ?auto_828248 ?auto_828249 ) ( ON ?auto_828247 ?auto_828248 ) ( ON ?auto_828246 ?auto_828247 ) ( ON ?auto_828245 ?auto_828246 ) ( ON ?auto_828244 ?auto_828245 ) ( ON ?auto_828243 ?auto_828244 ) ( CLEAR ?auto_828243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_828243 )
      ( MAKE-7PILE ?auto_828243 ?auto_828244 ?auto_828245 ?auto_828246 ?auto_828247 ?auto_828248 ?auto_828249 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_828274 - BLOCK
      ?auto_828275 - BLOCK
      ?auto_828276 - BLOCK
      ?auto_828277 - BLOCK
      ?auto_828278 - BLOCK
      ?auto_828279 - BLOCK
      ?auto_828280 - BLOCK
      ?auto_828281 - BLOCK
    )
    :vars
    (
      ?auto_828282 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_828280 ) ( ON ?auto_828281 ?auto_828282 ) ( CLEAR ?auto_828281 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_828274 ) ( ON ?auto_828275 ?auto_828274 ) ( ON ?auto_828276 ?auto_828275 ) ( ON ?auto_828277 ?auto_828276 ) ( ON ?auto_828278 ?auto_828277 ) ( ON ?auto_828279 ?auto_828278 ) ( ON ?auto_828280 ?auto_828279 ) ( not ( = ?auto_828274 ?auto_828275 ) ) ( not ( = ?auto_828274 ?auto_828276 ) ) ( not ( = ?auto_828274 ?auto_828277 ) ) ( not ( = ?auto_828274 ?auto_828278 ) ) ( not ( = ?auto_828274 ?auto_828279 ) ) ( not ( = ?auto_828274 ?auto_828280 ) ) ( not ( = ?auto_828274 ?auto_828281 ) ) ( not ( = ?auto_828274 ?auto_828282 ) ) ( not ( = ?auto_828275 ?auto_828276 ) ) ( not ( = ?auto_828275 ?auto_828277 ) ) ( not ( = ?auto_828275 ?auto_828278 ) ) ( not ( = ?auto_828275 ?auto_828279 ) ) ( not ( = ?auto_828275 ?auto_828280 ) ) ( not ( = ?auto_828275 ?auto_828281 ) ) ( not ( = ?auto_828275 ?auto_828282 ) ) ( not ( = ?auto_828276 ?auto_828277 ) ) ( not ( = ?auto_828276 ?auto_828278 ) ) ( not ( = ?auto_828276 ?auto_828279 ) ) ( not ( = ?auto_828276 ?auto_828280 ) ) ( not ( = ?auto_828276 ?auto_828281 ) ) ( not ( = ?auto_828276 ?auto_828282 ) ) ( not ( = ?auto_828277 ?auto_828278 ) ) ( not ( = ?auto_828277 ?auto_828279 ) ) ( not ( = ?auto_828277 ?auto_828280 ) ) ( not ( = ?auto_828277 ?auto_828281 ) ) ( not ( = ?auto_828277 ?auto_828282 ) ) ( not ( = ?auto_828278 ?auto_828279 ) ) ( not ( = ?auto_828278 ?auto_828280 ) ) ( not ( = ?auto_828278 ?auto_828281 ) ) ( not ( = ?auto_828278 ?auto_828282 ) ) ( not ( = ?auto_828279 ?auto_828280 ) ) ( not ( = ?auto_828279 ?auto_828281 ) ) ( not ( = ?auto_828279 ?auto_828282 ) ) ( not ( = ?auto_828280 ?auto_828281 ) ) ( not ( = ?auto_828280 ?auto_828282 ) ) ( not ( = ?auto_828281 ?auto_828282 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_828281 ?auto_828282 )
      ( !STACK ?auto_828281 ?auto_828280 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_828308 - BLOCK
      ?auto_828309 - BLOCK
      ?auto_828310 - BLOCK
      ?auto_828311 - BLOCK
      ?auto_828312 - BLOCK
      ?auto_828313 - BLOCK
      ?auto_828314 - BLOCK
      ?auto_828315 - BLOCK
    )
    :vars
    (
      ?auto_828316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_828315 ?auto_828316 ) ( ON-TABLE ?auto_828308 ) ( ON ?auto_828309 ?auto_828308 ) ( ON ?auto_828310 ?auto_828309 ) ( ON ?auto_828311 ?auto_828310 ) ( ON ?auto_828312 ?auto_828311 ) ( ON ?auto_828313 ?auto_828312 ) ( not ( = ?auto_828308 ?auto_828309 ) ) ( not ( = ?auto_828308 ?auto_828310 ) ) ( not ( = ?auto_828308 ?auto_828311 ) ) ( not ( = ?auto_828308 ?auto_828312 ) ) ( not ( = ?auto_828308 ?auto_828313 ) ) ( not ( = ?auto_828308 ?auto_828314 ) ) ( not ( = ?auto_828308 ?auto_828315 ) ) ( not ( = ?auto_828308 ?auto_828316 ) ) ( not ( = ?auto_828309 ?auto_828310 ) ) ( not ( = ?auto_828309 ?auto_828311 ) ) ( not ( = ?auto_828309 ?auto_828312 ) ) ( not ( = ?auto_828309 ?auto_828313 ) ) ( not ( = ?auto_828309 ?auto_828314 ) ) ( not ( = ?auto_828309 ?auto_828315 ) ) ( not ( = ?auto_828309 ?auto_828316 ) ) ( not ( = ?auto_828310 ?auto_828311 ) ) ( not ( = ?auto_828310 ?auto_828312 ) ) ( not ( = ?auto_828310 ?auto_828313 ) ) ( not ( = ?auto_828310 ?auto_828314 ) ) ( not ( = ?auto_828310 ?auto_828315 ) ) ( not ( = ?auto_828310 ?auto_828316 ) ) ( not ( = ?auto_828311 ?auto_828312 ) ) ( not ( = ?auto_828311 ?auto_828313 ) ) ( not ( = ?auto_828311 ?auto_828314 ) ) ( not ( = ?auto_828311 ?auto_828315 ) ) ( not ( = ?auto_828311 ?auto_828316 ) ) ( not ( = ?auto_828312 ?auto_828313 ) ) ( not ( = ?auto_828312 ?auto_828314 ) ) ( not ( = ?auto_828312 ?auto_828315 ) ) ( not ( = ?auto_828312 ?auto_828316 ) ) ( not ( = ?auto_828313 ?auto_828314 ) ) ( not ( = ?auto_828313 ?auto_828315 ) ) ( not ( = ?auto_828313 ?auto_828316 ) ) ( not ( = ?auto_828314 ?auto_828315 ) ) ( not ( = ?auto_828314 ?auto_828316 ) ) ( not ( = ?auto_828315 ?auto_828316 ) ) ( CLEAR ?auto_828313 ) ( ON ?auto_828314 ?auto_828315 ) ( CLEAR ?auto_828314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_828308 ?auto_828309 ?auto_828310 ?auto_828311 ?auto_828312 ?auto_828313 ?auto_828314 )
      ( MAKE-8PILE ?auto_828308 ?auto_828309 ?auto_828310 ?auto_828311 ?auto_828312 ?auto_828313 ?auto_828314 ?auto_828315 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_828342 - BLOCK
      ?auto_828343 - BLOCK
      ?auto_828344 - BLOCK
      ?auto_828345 - BLOCK
      ?auto_828346 - BLOCK
      ?auto_828347 - BLOCK
      ?auto_828348 - BLOCK
      ?auto_828349 - BLOCK
    )
    :vars
    (
      ?auto_828350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_828349 ?auto_828350 ) ( ON-TABLE ?auto_828342 ) ( ON ?auto_828343 ?auto_828342 ) ( ON ?auto_828344 ?auto_828343 ) ( ON ?auto_828345 ?auto_828344 ) ( ON ?auto_828346 ?auto_828345 ) ( not ( = ?auto_828342 ?auto_828343 ) ) ( not ( = ?auto_828342 ?auto_828344 ) ) ( not ( = ?auto_828342 ?auto_828345 ) ) ( not ( = ?auto_828342 ?auto_828346 ) ) ( not ( = ?auto_828342 ?auto_828347 ) ) ( not ( = ?auto_828342 ?auto_828348 ) ) ( not ( = ?auto_828342 ?auto_828349 ) ) ( not ( = ?auto_828342 ?auto_828350 ) ) ( not ( = ?auto_828343 ?auto_828344 ) ) ( not ( = ?auto_828343 ?auto_828345 ) ) ( not ( = ?auto_828343 ?auto_828346 ) ) ( not ( = ?auto_828343 ?auto_828347 ) ) ( not ( = ?auto_828343 ?auto_828348 ) ) ( not ( = ?auto_828343 ?auto_828349 ) ) ( not ( = ?auto_828343 ?auto_828350 ) ) ( not ( = ?auto_828344 ?auto_828345 ) ) ( not ( = ?auto_828344 ?auto_828346 ) ) ( not ( = ?auto_828344 ?auto_828347 ) ) ( not ( = ?auto_828344 ?auto_828348 ) ) ( not ( = ?auto_828344 ?auto_828349 ) ) ( not ( = ?auto_828344 ?auto_828350 ) ) ( not ( = ?auto_828345 ?auto_828346 ) ) ( not ( = ?auto_828345 ?auto_828347 ) ) ( not ( = ?auto_828345 ?auto_828348 ) ) ( not ( = ?auto_828345 ?auto_828349 ) ) ( not ( = ?auto_828345 ?auto_828350 ) ) ( not ( = ?auto_828346 ?auto_828347 ) ) ( not ( = ?auto_828346 ?auto_828348 ) ) ( not ( = ?auto_828346 ?auto_828349 ) ) ( not ( = ?auto_828346 ?auto_828350 ) ) ( not ( = ?auto_828347 ?auto_828348 ) ) ( not ( = ?auto_828347 ?auto_828349 ) ) ( not ( = ?auto_828347 ?auto_828350 ) ) ( not ( = ?auto_828348 ?auto_828349 ) ) ( not ( = ?auto_828348 ?auto_828350 ) ) ( not ( = ?auto_828349 ?auto_828350 ) ) ( ON ?auto_828348 ?auto_828349 ) ( CLEAR ?auto_828346 ) ( ON ?auto_828347 ?auto_828348 ) ( CLEAR ?auto_828347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_828342 ?auto_828343 ?auto_828344 ?auto_828345 ?auto_828346 ?auto_828347 )
      ( MAKE-8PILE ?auto_828342 ?auto_828343 ?auto_828344 ?auto_828345 ?auto_828346 ?auto_828347 ?auto_828348 ?auto_828349 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_828376 - BLOCK
      ?auto_828377 - BLOCK
      ?auto_828378 - BLOCK
      ?auto_828379 - BLOCK
      ?auto_828380 - BLOCK
      ?auto_828381 - BLOCK
      ?auto_828382 - BLOCK
      ?auto_828383 - BLOCK
    )
    :vars
    (
      ?auto_828384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_828383 ?auto_828384 ) ( ON-TABLE ?auto_828376 ) ( ON ?auto_828377 ?auto_828376 ) ( ON ?auto_828378 ?auto_828377 ) ( ON ?auto_828379 ?auto_828378 ) ( not ( = ?auto_828376 ?auto_828377 ) ) ( not ( = ?auto_828376 ?auto_828378 ) ) ( not ( = ?auto_828376 ?auto_828379 ) ) ( not ( = ?auto_828376 ?auto_828380 ) ) ( not ( = ?auto_828376 ?auto_828381 ) ) ( not ( = ?auto_828376 ?auto_828382 ) ) ( not ( = ?auto_828376 ?auto_828383 ) ) ( not ( = ?auto_828376 ?auto_828384 ) ) ( not ( = ?auto_828377 ?auto_828378 ) ) ( not ( = ?auto_828377 ?auto_828379 ) ) ( not ( = ?auto_828377 ?auto_828380 ) ) ( not ( = ?auto_828377 ?auto_828381 ) ) ( not ( = ?auto_828377 ?auto_828382 ) ) ( not ( = ?auto_828377 ?auto_828383 ) ) ( not ( = ?auto_828377 ?auto_828384 ) ) ( not ( = ?auto_828378 ?auto_828379 ) ) ( not ( = ?auto_828378 ?auto_828380 ) ) ( not ( = ?auto_828378 ?auto_828381 ) ) ( not ( = ?auto_828378 ?auto_828382 ) ) ( not ( = ?auto_828378 ?auto_828383 ) ) ( not ( = ?auto_828378 ?auto_828384 ) ) ( not ( = ?auto_828379 ?auto_828380 ) ) ( not ( = ?auto_828379 ?auto_828381 ) ) ( not ( = ?auto_828379 ?auto_828382 ) ) ( not ( = ?auto_828379 ?auto_828383 ) ) ( not ( = ?auto_828379 ?auto_828384 ) ) ( not ( = ?auto_828380 ?auto_828381 ) ) ( not ( = ?auto_828380 ?auto_828382 ) ) ( not ( = ?auto_828380 ?auto_828383 ) ) ( not ( = ?auto_828380 ?auto_828384 ) ) ( not ( = ?auto_828381 ?auto_828382 ) ) ( not ( = ?auto_828381 ?auto_828383 ) ) ( not ( = ?auto_828381 ?auto_828384 ) ) ( not ( = ?auto_828382 ?auto_828383 ) ) ( not ( = ?auto_828382 ?auto_828384 ) ) ( not ( = ?auto_828383 ?auto_828384 ) ) ( ON ?auto_828382 ?auto_828383 ) ( ON ?auto_828381 ?auto_828382 ) ( CLEAR ?auto_828379 ) ( ON ?auto_828380 ?auto_828381 ) ( CLEAR ?auto_828380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_828376 ?auto_828377 ?auto_828378 ?auto_828379 ?auto_828380 )
      ( MAKE-8PILE ?auto_828376 ?auto_828377 ?auto_828378 ?auto_828379 ?auto_828380 ?auto_828381 ?auto_828382 ?auto_828383 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_828410 - BLOCK
      ?auto_828411 - BLOCK
      ?auto_828412 - BLOCK
      ?auto_828413 - BLOCK
      ?auto_828414 - BLOCK
      ?auto_828415 - BLOCK
      ?auto_828416 - BLOCK
      ?auto_828417 - BLOCK
    )
    :vars
    (
      ?auto_828418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_828417 ?auto_828418 ) ( ON-TABLE ?auto_828410 ) ( ON ?auto_828411 ?auto_828410 ) ( ON ?auto_828412 ?auto_828411 ) ( not ( = ?auto_828410 ?auto_828411 ) ) ( not ( = ?auto_828410 ?auto_828412 ) ) ( not ( = ?auto_828410 ?auto_828413 ) ) ( not ( = ?auto_828410 ?auto_828414 ) ) ( not ( = ?auto_828410 ?auto_828415 ) ) ( not ( = ?auto_828410 ?auto_828416 ) ) ( not ( = ?auto_828410 ?auto_828417 ) ) ( not ( = ?auto_828410 ?auto_828418 ) ) ( not ( = ?auto_828411 ?auto_828412 ) ) ( not ( = ?auto_828411 ?auto_828413 ) ) ( not ( = ?auto_828411 ?auto_828414 ) ) ( not ( = ?auto_828411 ?auto_828415 ) ) ( not ( = ?auto_828411 ?auto_828416 ) ) ( not ( = ?auto_828411 ?auto_828417 ) ) ( not ( = ?auto_828411 ?auto_828418 ) ) ( not ( = ?auto_828412 ?auto_828413 ) ) ( not ( = ?auto_828412 ?auto_828414 ) ) ( not ( = ?auto_828412 ?auto_828415 ) ) ( not ( = ?auto_828412 ?auto_828416 ) ) ( not ( = ?auto_828412 ?auto_828417 ) ) ( not ( = ?auto_828412 ?auto_828418 ) ) ( not ( = ?auto_828413 ?auto_828414 ) ) ( not ( = ?auto_828413 ?auto_828415 ) ) ( not ( = ?auto_828413 ?auto_828416 ) ) ( not ( = ?auto_828413 ?auto_828417 ) ) ( not ( = ?auto_828413 ?auto_828418 ) ) ( not ( = ?auto_828414 ?auto_828415 ) ) ( not ( = ?auto_828414 ?auto_828416 ) ) ( not ( = ?auto_828414 ?auto_828417 ) ) ( not ( = ?auto_828414 ?auto_828418 ) ) ( not ( = ?auto_828415 ?auto_828416 ) ) ( not ( = ?auto_828415 ?auto_828417 ) ) ( not ( = ?auto_828415 ?auto_828418 ) ) ( not ( = ?auto_828416 ?auto_828417 ) ) ( not ( = ?auto_828416 ?auto_828418 ) ) ( not ( = ?auto_828417 ?auto_828418 ) ) ( ON ?auto_828416 ?auto_828417 ) ( ON ?auto_828415 ?auto_828416 ) ( ON ?auto_828414 ?auto_828415 ) ( CLEAR ?auto_828412 ) ( ON ?auto_828413 ?auto_828414 ) ( CLEAR ?auto_828413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_828410 ?auto_828411 ?auto_828412 ?auto_828413 )
      ( MAKE-8PILE ?auto_828410 ?auto_828411 ?auto_828412 ?auto_828413 ?auto_828414 ?auto_828415 ?auto_828416 ?auto_828417 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_828444 - BLOCK
      ?auto_828445 - BLOCK
      ?auto_828446 - BLOCK
      ?auto_828447 - BLOCK
      ?auto_828448 - BLOCK
      ?auto_828449 - BLOCK
      ?auto_828450 - BLOCK
      ?auto_828451 - BLOCK
    )
    :vars
    (
      ?auto_828452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_828451 ?auto_828452 ) ( ON-TABLE ?auto_828444 ) ( ON ?auto_828445 ?auto_828444 ) ( not ( = ?auto_828444 ?auto_828445 ) ) ( not ( = ?auto_828444 ?auto_828446 ) ) ( not ( = ?auto_828444 ?auto_828447 ) ) ( not ( = ?auto_828444 ?auto_828448 ) ) ( not ( = ?auto_828444 ?auto_828449 ) ) ( not ( = ?auto_828444 ?auto_828450 ) ) ( not ( = ?auto_828444 ?auto_828451 ) ) ( not ( = ?auto_828444 ?auto_828452 ) ) ( not ( = ?auto_828445 ?auto_828446 ) ) ( not ( = ?auto_828445 ?auto_828447 ) ) ( not ( = ?auto_828445 ?auto_828448 ) ) ( not ( = ?auto_828445 ?auto_828449 ) ) ( not ( = ?auto_828445 ?auto_828450 ) ) ( not ( = ?auto_828445 ?auto_828451 ) ) ( not ( = ?auto_828445 ?auto_828452 ) ) ( not ( = ?auto_828446 ?auto_828447 ) ) ( not ( = ?auto_828446 ?auto_828448 ) ) ( not ( = ?auto_828446 ?auto_828449 ) ) ( not ( = ?auto_828446 ?auto_828450 ) ) ( not ( = ?auto_828446 ?auto_828451 ) ) ( not ( = ?auto_828446 ?auto_828452 ) ) ( not ( = ?auto_828447 ?auto_828448 ) ) ( not ( = ?auto_828447 ?auto_828449 ) ) ( not ( = ?auto_828447 ?auto_828450 ) ) ( not ( = ?auto_828447 ?auto_828451 ) ) ( not ( = ?auto_828447 ?auto_828452 ) ) ( not ( = ?auto_828448 ?auto_828449 ) ) ( not ( = ?auto_828448 ?auto_828450 ) ) ( not ( = ?auto_828448 ?auto_828451 ) ) ( not ( = ?auto_828448 ?auto_828452 ) ) ( not ( = ?auto_828449 ?auto_828450 ) ) ( not ( = ?auto_828449 ?auto_828451 ) ) ( not ( = ?auto_828449 ?auto_828452 ) ) ( not ( = ?auto_828450 ?auto_828451 ) ) ( not ( = ?auto_828450 ?auto_828452 ) ) ( not ( = ?auto_828451 ?auto_828452 ) ) ( ON ?auto_828450 ?auto_828451 ) ( ON ?auto_828449 ?auto_828450 ) ( ON ?auto_828448 ?auto_828449 ) ( ON ?auto_828447 ?auto_828448 ) ( CLEAR ?auto_828445 ) ( ON ?auto_828446 ?auto_828447 ) ( CLEAR ?auto_828446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_828444 ?auto_828445 ?auto_828446 )
      ( MAKE-8PILE ?auto_828444 ?auto_828445 ?auto_828446 ?auto_828447 ?auto_828448 ?auto_828449 ?auto_828450 ?auto_828451 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_828478 - BLOCK
      ?auto_828479 - BLOCK
      ?auto_828480 - BLOCK
      ?auto_828481 - BLOCK
      ?auto_828482 - BLOCK
      ?auto_828483 - BLOCK
      ?auto_828484 - BLOCK
      ?auto_828485 - BLOCK
    )
    :vars
    (
      ?auto_828486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_828485 ?auto_828486 ) ( ON-TABLE ?auto_828478 ) ( not ( = ?auto_828478 ?auto_828479 ) ) ( not ( = ?auto_828478 ?auto_828480 ) ) ( not ( = ?auto_828478 ?auto_828481 ) ) ( not ( = ?auto_828478 ?auto_828482 ) ) ( not ( = ?auto_828478 ?auto_828483 ) ) ( not ( = ?auto_828478 ?auto_828484 ) ) ( not ( = ?auto_828478 ?auto_828485 ) ) ( not ( = ?auto_828478 ?auto_828486 ) ) ( not ( = ?auto_828479 ?auto_828480 ) ) ( not ( = ?auto_828479 ?auto_828481 ) ) ( not ( = ?auto_828479 ?auto_828482 ) ) ( not ( = ?auto_828479 ?auto_828483 ) ) ( not ( = ?auto_828479 ?auto_828484 ) ) ( not ( = ?auto_828479 ?auto_828485 ) ) ( not ( = ?auto_828479 ?auto_828486 ) ) ( not ( = ?auto_828480 ?auto_828481 ) ) ( not ( = ?auto_828480 ?auto_828482 ) ) ( not ( = ?auto_828480 ?auto_828483 ) ) ( not ( = ?auto_828480 ?auto_828484 ) ) ( not ( = ?auto_828480 ?auto_828485 ) ) ( not ( = ?auto_828480 ?auto_828486 ) ) ( not ( = ?auto_828481 ?auto_828482 ) ) ( not ( = ?auto_828481 ?auto_828483 ) ) ( not ( = ?auto_828481 ?auto_828484 ) ) ( not ( = ?auto_828481 ?auto_828485 ) ) ( not ( = ?auto_828481 ?auto_828486 ) ) ( not ( = ?auto_828482 ?auto_828483 ) ) ( not ( = ?auto_828482 ?auto_828484 ) ) ( not ( = ?auto_828482 ?auto_828485 ) ) ( not ( = ?auto_828482 ?auto_828486 ) ) ( not ( = ?auto_828483 ?auto_828484 ) ) ( not ( = ?auto_828483 ?auto_828485 ) ) ( not ( = ?auto_828483 ?auto_828486 ) ) ( not ( = ?auto_828484 ?auto_828485 ) ) ( not ( = ?auto_828484 ?auto_828486 ) ) ( not ( = ?auto_828485 ?auto_828486 ) ) ( ON ?auto_828484 ?auto_828485 ) ( ON ?auto_828483 ?auto_828484 ) ( ON ?auto_828482 ?auto_828483 ) ( ON ?auto_828481 ?auto_828482 ) ( ON ?auto_828480 ?auto_828481 ) ( CLEAR ?auto_828478 ) ( ON ?auto_828479 ?auto_828480 ) ( CLEAR ?auto_828479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_828478 ?auto_828479 )
      ( MAKE-8PILE ?auto_828478 ?auto_828479 ?auto_828480 ?auto_828481 ?auto_828482 ?auto_828483 ?auto_828484 ?auto_828485 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_828512 - BLOCK
      ?auto_828513 - BLOCK
      ?auto_828514 - BLOCK
      ?auto_828515 - BLOCK
      ?auto_828516 - BLOCK
      ?auto_828517 - BLOCK
      ?auto_828518 - BLOCK
      ?auto_828519 - BLOCK
    )
    :vars
    (
      ?auto_828520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_828519 ?auto_828520 ) ( not ( = ?auto_828512 ?auto_828513 ) ) ( not ( = ?auto_828512 ?auto_828514 ) ) ( not ( = ?auto_828512 ?auto_828515 ) ) ( not ( = ?auto_828512 ?auto_828516 ) ) ( not ( = ?auto_828512 ?auto_828517 ) ) ( not ( = ?auto_828512 ?auto_828518 ) ) ( not ( = ?auto_828512 ?auto_828519 ) ) ( not ( = ?auto_828512 ?auto_828520 ) ) ( not ( = ?auto_828513 ?auto_828514 ) ) ( not ( = ?auto_828513 ?auto_828515 ) ) ( not ( = ?auto_828513 ?auto_828516 ) ) ( not ( = ?auto_828513 ?auto_828517 ) ) ( not ( = ?auto_828513 ?auto_828518 ) ) ( not ( = ?auto_828513 ?auto_828519 ) ) ( not ( = ?auto_828513 ?auto_828520 ) ) ( not ( = ?auto_828514 ?auto_828515 ) ) ( not ( = ?auto_828514 ?auto_828516 ) ) ( not ( = ?auto_828514 ?auto_828517 ) ) ( not ( = ?auto_828514 ?auto_828518 ) ) ( not ( = ?auto_828514 ?auto_828519 ) ) ( not ( = ?auto_828514 ?auto_828520 ) ) ( not ( = ?auto_828515 ?auto_828516 ) ) ( not ( = ?auto_828515 ?auto_828517 ) ) ( not ( = ?auto_828515 ?auto_828518 ) ) ( not ( = ?auto_828515 ?auto_828519 ) ) ( not ( = ?auto_828515 ?auto_828520 ) ) ( not ( = ?auto_828516 ?auto_828517 ) ) ( not ( = ?auto_828516 ?auto_828518 ) ) ( not ( = ?auto_828516 ?auto_828519 ) ) ( not ( = ?auto_828516 ?auto_828520 ) ) ( not ( = ?auto_828517 ?auto_828518 ) ) ( not ( = ?auto_828517 ?auto_828519 ) ) ( not ( = ?auto_828517 ?auto_828520 ) ) ( not ( = ?auto_828518 ?auto_828519 ) ) ( not ( = ?auto_828518 ?auto_828520 ) ) ( not ( = ?auto_828519 ?auto_828520 ) ) ( ON ?auto_828518 ?auto_828519 ) ( ON ?auto_828517 ?auto_828518 ) ( ON ?auto_828516 ?auto_828517 ) ( ON ?auto_828515 ?auto_828516 ) ( ON ?auto_828514 ?auto_828515 ) ( ON ?auto_828513 ?auto_828514 ) ( ON ?auto_828512 ?auto_828513 ) ( CLEAR ?auto_828512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_828512 )
      ( MAKE-8PILE ?auto_828512 ?auto_828513 ?auto_828514 ?auto_828515 ?auto_828516 ?auto_828517 ?auto_828518 ?auto_828519 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_828547 - BLOCK
      ?auto_828548 - BLOCK
      ?auto_828549 - BLOCK
      ?auto_828550 - BLOCK
      ?auto_828551 - BLOCK
      ?auto_828552 - BLOCK
      ?auto_828553 - BLOCK
      ?auto_828554 - BLOCK
      ?auto_828555 - BLOCK
    )
    :vars
    (
      ?auto_828556 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_828554 ) ( ON ?auto_828555 ?auto_828556 ) ( CLEAR ?auto_828555 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_828547 ) ( ON ?auto_828548 ?auto_828547 ) ( ON ?auto_828549 ?auto_828548 ) ( ON ?auto_828550 ?auto_828549 ) ( ON ?auto_828551 ?auto_828550 ) ( ON ?auto_828552 ?auto_828551 ) ( ON ?auto_828553 ?auto_828552 ) ( ON ?auto_828554 ?auto_828553 ) ( not ( = ?auto_828547 ?auto_828548 ) ) ( not ( = ?auto_828547 ?auto_828549 ) ) ( not ( = ?auto_828547 ?auto_828550 ) ) ( not ( = ?auto_828547 ?auto_828551 ) ) ( not ( = ?auto_828547 ?auto_828552 ) ) ( not ( = ?auto_828547 ?auto_828553 ) ) ( not ( = ?auto_828547 ?auto_828554 ) ) ( not ( = ?auto_828547 ?auto_828555 ) ) ( not ( = ?auto_828547 ?auto_828556 ) ) ( not ( = ?auto_828548 ?auto_828549 ) ) ( not ( = ?auto_828548 ?auto_828550 ) ) ( not ( = ?auto_828548 ?auto_828551 ) ) ( not ( = ?auto_828548 ?auto_828552 ) ) ( not ( = ?auto_828548 ?auto_828553 ) ) ( not ( = ?auto_828548 ?auto_828554 ) ) ( not ( = ?auto_828548 ?auto_828555 ) ) ( not ( = ?auto_828548 ?auto_828556 ) ) ( not ( = ?auto_828549 ?auto_828550 ) ) ( not ( = ?auto_828549 ?auto_828551 ) ) ( not ( = ?auto_828549 ?auto_828552 ) ) ( not ( = ?auto_828549 ?auto_828553 ) ) ( not ( = ?auto_828549 ?auto_828554 ) ) ( not ( = ?auto_828549 ?auto_828555 ) ) ( not ( = ?auto_828549 ?auto_828556 ) ) ( not ( = ?auto_828550 ?auto_828551 ) ) ( not ( = ?auto_828550 ?auto_828552 ) ) ( not ( = ?auto_828550 ?auto_828553 ) ) ( not ( = ?auto_828550 ?auto_828554 ) ) ( not ( = ?auto_828550 ?auto_828555 ) ) ( not ( = ?auto_828550 ?auto_828556 ) ) ( not ( = ?auto_828551 ?auto_828552 ) ) ( not ( = ?auto_828551 ?auto_828553 ) ) ( not ( = ?auto_828551 ?auto_828554 ) ) ( not ( = ?auto_828551 ?auto_828555 ) ) ( not ( = ?auto_828551 ?auto_828556 ) ) ( not ( = ?auto_828552 ?auto_828553 ) ) ( not ( = ?auto_828552 ?auto_828554 ) ) ( not ( = ?auto_828552 ?auto_828555 ) ) ( not ( = ?auto_828552 ?auto_828556 ) ) ( not ( = ?auto_828553 ?auto_828554 ) ) ( not ( = ?auto_828553 ?auto_828555 ) ) ( not ( = ?auto_828553 ?auto_828556 ) ) ( not ( = ?auto_828554 ?auto_828555 ) ) ( not ( = ?auto_828554 ?auto_828556 ) ) ( not ( = ?auto_828555 ?auto_828556 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_828555 ?auto_828556 )
      ( !STACK ?auto_828555 ?auto_828554 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_828585 - BLOCK
      ?auto_828586 - BLOCK
      ?auto_828587 - BLOCK
      ?auto_828588 - BLOCK
      ?auto_828589 - BLOCK
      ?auto_828590 - BLOCK
      ?auto_828591 - BLOCK
      ?auto_828592 - BLOCK
      ?auto_828593 - BLOCK
    )
    :vars
    (
      ?auto_828594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_828593 ?auto_828594 ) ( ON-TABLE ?auto_828585 ) ( ON ?auto_828586 ?auto_828585 ) ( ON ?auto_828587 ?auto_828586 ) ( ON ?auto_828588 ?auto_828587 ) ( ON ?auto_828589 ?auto_828588 ) ( ON ?auto_828590 ?auto_828589 ) ( ON ?auto_828591 ?auto_828590 ) ( not ( = ?auto_828585 ?auto_828586 ) ) ( not ( = ?auto_828585 ?auto_828587 ) ) ( not ( = ?auto_828585 ?auto_828588 ) ) ( not ( = ?auto_828585 ?auto_828589 ) ) ( not ( = ?auto_828585 ?auto_828590 ) ) ( not ( = ?auto_828585 ?auto_828591 ) ) ( not ( = ?auto_828585 ?auto_828592 ) ) ( not ( = ?auto_828585 ?auto_828593 ) ) ( not ( = ?auto_828585 ?auto_828594 ) ) ( not ( = ?auto_828586 ?auto_828587 ) ) ( not ( = ?auto_828586 ?auto_828588 ) ) ( not ( = ?auto_828586 ?auto_828589 ) ) ( not ( = ?auto_828586 ?auto_828590 ) ) ( not ( = ?auto_828586 ?auto_828591 ) ) ( not ( = ?auto_828586 ?auto_828592 ) ) ( not ( = ?auto_828586 ?auto_828593 ) ) ( not ( = ?auto_828586 ?auto_828594 ) ) ( not ( = ?auto_828587 ?auto_828588 ) ) ( not ( = ?auto_828587 ?auto_828589 ) ) ( not ( = ?auto_828587 ?auto_828590 ) ) ( not ( = ?auto_828587 ?auto_828591 ) ) ( not ( = ?auto_828587 ?auto_828592 ) ) ( not ( = ?auto_828587 ?auto_828593 ) ) ( not ( = ?auto_828587 ?auto_828594 ) ) ( not ( = ?auto_828588 ?auto_828589 ) ) ( not ( = ?auto_828588 ?auto_828590 ) ) ( not ( = ?auto_828588 ?auto_828591 ) ) ( not ( = ?auto_828588 ?auto_828592 ) ) ( not ( = ?auto_828588 ?auto_828593 ) ) ( not ( = ?auto_828588 ?auto_828594 ) ) ( not ( = ?auto_828589 ?auto_828590 ) ) ( not ( = ?auto_828589 ?auto_828591 ) ) ( not ( = ?auto_828589 ?auto_828592 ) ) ( not ( = ?auto_828589 ?auto_828593 ) ) ( not ( = ?auto_828589 ?auto_828594 ) ) ( not ( = ?auto_828590 ?auto_828591 ) ) ( not ( = ?auto_828590 ?auto_828592 ) ) ( not ( = ?auto_828590 ?auto_828593 ) ) ( not ( = ?auto_828590 ?auto_828594 ) ) ( not ( = ?auto_828591 ?auto_828592 ) ) ( not ( = ?auto_828591 ?auto_828593 ) ) ( not ( = ?auto_828591 ?auto_828594 ) ) ( not ( = ?auto_828592 ?auto_828593 ) ) ( not ( = ?auto_828592 ?auto_828594 ) ) ( not ( = ?auto_828593 ?auto_828594 ) ) ( CLEAR ?auto_828591 ) ( ON ?auto_828592 ?auto_828593 ) ( CLEAR ?auto_828592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_828585 ?auto_828586 ?auto_828587 ?auto_828588 ?auto_828589 ?auto_828590 ?auto_828591 ?auto_828592 )
      ( MAKE-9PILE ?auto_828585 ?auto_828586 ?auto_828587 ?auto_828588 ?auto_828589 ?auto_828590 ?auto_828591 ?auto_828592 ?auto_828593 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_828623 - BLOCK
      ?auto_828624 - BLOCK
      ?auto_828625 - BLOCK
      ?auto_828626 - BLOCK
      ?auto_828627 - BLOCK
      ?auto_828628 - BLOCK
      ?auto_828629 - BLOCK
      ?auto_828630 - BLOCK
      ?auto_828631 - BLOCK
    )
    :vars
    (
      ?auto_828632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_828631 ?auto_828632 ) ( ON-TABLE ?auto_828623 ) ( ON ?auto_828624 ?auto_828623 ) ( ON ?auto_828625 ?auto_828624 ) ( ON ?auto_828626 ?auto_828625 ) ( ON ?auto_828627 ?auto_828626 ) ( ON ?auto_828628 ?auto_828627 ) ( not ( = ?auto_828623 ?auto_828624 ) ) ( not ( = ?auto_828623 ?auto_828625 ) ) ( not ( = ?auto_828623 ?auto_828626 ) ) ( not ( = ?auto_828623 ?auto_828627 ) ) ( not ( = ?auto_828623 ?auto_828628 ) ) ( not ( = ?auto_828623 ?auto_828629 ) ) ( not ( = ?auto_828623 ?auto_828630 ) ) ( not ( = ?auto_828623 ?auto_828631 ) ) ( not ( = ?auto_828623 ?auto_828632 ) ) ( not ( = ?auto_828624 ?auto_828625 ) ) ( not ( = ?auto_828624 ?auto_828626 ) ) ( not ( = ?auto_828624 ?auto_828627 ) ) ( not ( = ?auto_828624 ?auto_828628 ) ) ( not ( = ?auto_828624 ?auto_828629 ) ) ( not ( = ?auto_828624 ?auto_828630 ) ) ( not ( = ?auto_828624 ?auto_828631 ) ) ( not ( = ?auto_828624 ?auto_828632 ) ) ( not ( = ?auto_828625 ?auto_828626 ) ) ( not ( = ?auto_828625 ?auto_828627 ) ) ( not ( = ?auto_828625 ?auto_828628 ) ) ( not ( = ?auto_828625 ?auto_828629 ) ) ( not ( = ?auto_828625 ?auto_828630 ) ) ( not ( = ?auto_828625 ?auto_828631 ) ) ( not ( = ?auto_828625 ?auto_828632 ) ) ( not ( = ?auto_828626 ?auto_828627 ) ) ( not ( = ?auto_828626 ?auto_828628 ) ) ( not ( = ?auto_828626 ?auto_828629 ) ) ( not ( = ?auto_828626 ?auto_828630 ) ) ( not ( = ?auto_828626 ?auto_828631 ) ) ( not ( = ?auto_828626 ?auto_828632 ) ) ( not ( = ?auto_828627 ?auto_828628 ) ) ( not ( = ?auto_828627 ?auto_828629 ) ) ( not ( = ?auto_828627 ?auto_828630 ) ) ( not ( = ?auto_828627 ?auto_828631 ) ) ( not ( = ?auto_828627 ?auto_828632 ) ) ( not ( = ?auto_828628 ?auto_828629 ) ) ( not ( = ?auto_828628 ?auto_828630 ) ) ( not ( = ?auto_828628 ?auto_828631 ) ) ( not ( = ?auto_828628 ?auto_828632 ) ) ( not ( = ?auto_828629 ?auto_828630 ) ) ( not ( = ?auto_828629 ?auto_828631 ) ) ( not ( = ?auto_828629 ?auto_828632 ) ) ( not ( = ?auto_828630 ?auto_828631 ) ) ( not ( = ?auto_828630 ?auto_828632 ) ) ( not ( = ?auto_828631 ?auto_828632 ) ) ( ON ?auto_828630 ?auto_828631 ) ( CLEAR ?auto_828628 ) ( ON ?auto_828629 ?auto_828630 ) ( CLEAR ?auto_828629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_828623 ?auto_828624 ?auto_828625 ?auto_828626 ?auto_828627 ?auto_828628 ?auto_828629 )
      ( MAKE-9PILE ?auto_828623 ?auto_828624 ?auto_828625 ?auto_828626 ?auto_828627 ?auto_828628 ?auto_828629 ?auto_828630 ?auto_828631 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_828661 - BLOCK
      ?auto_828662 - BLOCK
      ?auto_828663 - BLOCK
      ?auto_828664 - BLOCK
      ?auto_828665 - BLOCK
      ?auto_828666 - BLOCK
      ?auto_828667 - BLOCK
      ?auto_828668 - BLOCK
      ?auto_828669 - BLOCK
    )
    :vars
    (
      ?auto_828670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_828669 ?auto_828670 ) ( ON-TABLE ?auto_828661 ) ( ON ?auto_828662 ?auto_828661 ) ( ON ?auto_828663 ?auto_828662 ) ( ON ?auto_828664 ?auto_828663 ) ( ON ?auto_828665 ?auto_828664 ) ( not ( = ?auto_828661 ?auto_828662 ) ) ( not ( = ?auto_828661 ?auto_828663 ) ) ( not ( = ?auto_828661 ?auto_828664 ) ) ( not ( = ?auto_828661 ?auto_828665 ) ) ( not ( = ?auto_828661 ?auto_828666 ) ) ( not ( = ?auto_828661 ?auto_828667 ) ) ( not ( = ?auto_828661 ?auto_828668 ) ) ( not ( = ?auto_828661 ?auto_828669 ) ) ( not ( = ?auto_828661 ?auto_828670 ) ) ( not ( = ?auto_828662 ?auto_828663 ) ) ( not ( = ?auto_828662 ?auto_828664 ) ) ( not ( = ?auto_828662 ?auto_828665 ) ) ( not ( = ?auto_828662 ?auto_828666 ) ) ( not ( = ?auto_828662 ?auto_828667 ) ) ( not ( = ?auto_828662 ?auto_828668 ) ) ( not ( = ?auto_828662 ?auto_828669 ) ) ( not ( = ?auto_828662 ?auto_828670 ) ) ( not ( = ?auto_828663 ?auto_828664 ) ) ( not ( = ?auto_828663 ?auto_828665 ) ) ( not ( = ?auto_828663 ?auto_828666 ) ) ( not ( = ?auto_828663 ?auto_828667 ) ) ( not ( = ?auto_828663 ?auto_828668 ) ) ( not ( = ?auto_828663 ?auto_828669 ) ) ( not ( = ?auto_828663 ?auto_828670 ) ) ( not ( = ?auto_828664 ?auto_828665 ) ) ( not ( = ?auto_828664 ?auto_828666 ) ) ( not ( = ?auto_828664 ?auto_828667 ) ) ( not ( = ?auto_828664 ?auto_828668 ) ) ( not ( = ?auto_828664 ?auto_828669 ) ) ( not ( = ?auto_828664 ?auto_828670 ) ) ( not ( = ?auto_828665 ?auto_828666 ) ) ( not ( = ?auto_828665 ?auto_828667 ) ) ( not ( = ?auto_828665 ?auto_828668 ) ) ( not ( = ?auto_828665 ?auto_828669 ) ) ( not ( = ?auto_828665 ?auto_828670 ) ) ( not ( = ?auto_828666 ?auto_828667 ) ) ( not ( = ?auto_828666 ?auto_828668 ) ) ( not ( = ?auto_828666 ?auto_828669 ) ) ( not ( = ?auto_828666 ?auto_828670 ) ) ( not ( = ?auto_828667 ?auto_828668 ) ) ( not ( = ?auto_828667 ?auto_828669 ) ) ( not ( = ?auto_828667 ?auto_828670 ) ) ( not ( = ?auto_828668 ?auto_828669 ) ) ( not ( = ?auto_828668 ?auto_828670 ) ) ( not ( = ?auto_828669 ?auto_828670 ) ) ( ON ?auto_828668 ?auto_828669 ) ( ON ?auto_828667 ?auto_828668 ) ( CLEAR ?auto_828665 ) ( ON ?auto_828666 ?auto_828667 ) ( CLEAR ?auto_828666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_828661 ?auto_828662 ?auto_828663 ?auto_828664 ?auto_828665 ?auto_828666 )
      ( MAKE-9PILE ?auto_828661 ?auto_828662 ?auto_828663 ?auto_828664 ?auto_828665 ?auto_828666 ?auto_828667 ?auto_828668 ?auto_828669 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_828699 - BLOCK
      ?auto_828700 - BLOCK
      ?auto_828701 - BLOCK
      ?auto_828702 - BLOCK
      ?auto_828703 - BLOCK
      ?auto_828704 - BLOCK
      ?auto_828705 - BLOCK
      ?auto_828706 - BLOCK
      ?auto_828707 - BLOCK
    )
    :vars
    (
      ?auto_828708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_828707 ?auto_828708 ) ( ON-TABLE ?auto_828699 ) ( ON ?auto_828700 ?auto_828699 ) ( ON ?auto_828701 ?auto_828700 ) ( ON ?auto_828702 ?auto_828701 ) ( not ( = ?auto_828699 ?auto_828700 ) ) ( not ( = ?auto_828699 ?auto_828701 ) ) ( not ( = ?auto_828699 ?auto_828702 ) ) ( not ( = ?auto_828699 ?auto_828703 ) ) ( not ( = ?auto_828699 ?auto_828704 ) ) ( not ( = ?auto_828699 ?auto_828705 ) ) ( not ( = ?auto_828699 ?auto_828706 ) ) ( not ( = ?auto_828699 ?auto_828707 ) ) ( not ( = ?auto_828699 ?auto_828708 ) ) ( not ( = ?auto_828700 ?auto_828701 ) ) ( not ( = ?auto_828700 ?auto_828702 ) ) ( not ( = ?auto_828700 ?auto_828703 ) ) ( not ( = ?auto_828700 ?auto_828704 ) ) ( not ( = ?auto_828700 ?auto_828705 ) ) ( not ( = ?auto_828700 ?auto_828706 ) ) ( not ( = ?auto_828700 ?auto_828707 ) ) ( not ( = ?auto_828700 ?auto_828708 ) ) ( not ( = ?auto_828701 ?auto_828702 ) ) ( not ( = ?auto_828701 ?auto_828703 ) ) ( not ( = ?auto_828701 ?auto_828704 ) ) ( not ( = ?auto_828701 ?auto_828705 ) ) ( not ( = ?auto_828701 ?auto_828706 ) ) ( not ( = ?auto_828701 ?auto_828707 ) ) ( not ( = ?auto_828701 ?auto_828708 ) ) ( not ( = ?auto_828702 ?auto_828703 ) ) ( not ( = ?auto_828702 ?auto_828704 ) ) ( not ( = ?auto_828702 ?auto_828705 ) ) ( not ( = ?auto_828702 ?auto_828706 ) ) ( not ( = ?auto_828702 ?auto_828707 ) ) ( not ( = ?auto_828702 ?auto_828708 ) ) ( not ( = ?auto_828703 ?auto_828704 ) ) ( not ( = ?auto_828703 ?auto_828705 ) ) ( not ( = ?auto_828703 ?auto_828706 ) ) ( not ( = ?auto_828703 ?auto_828707 ) ) ( not ( = ?auto_828703 ?auto_828708 ) ) ( not ( = ?auto_828704 ?auto_828705 ) ) ( not ( = ?auto_828704 ?auto_828706 ) ) ( not ( = ?auto_828704 ?auto_828707 ) ) ( not ( = ?auto_828704 ?auto_828708 ) ) ( not ( = ?auto_828705 ?auto_828706 ) ) ( not ( = ?auto_828705 ?auto_828707 ) ) ( not ( = ?auto_828705 ?auto_828708 ) ) ( not ( = ?auto_828706 ?auto_828707 ) ) ( not ( = ?auto_828706 ?auto_828708 ) ) ( not ( = ?auto_828707 ?auto_828708 ) ) ( ON ?auto_828706 ?auto_828707 ) ( ON ?auto_828705 ?auto_828706 ) ( ON ?auto_828704 ?auto_828705 ) ( CLEAR ?auto_828702 ) ( ON ?auto_828703 ?auto_828704 ) ( CLEAR ?auto_828703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_828699 ?auto_828700 ?auto_828701 ?auto_828702 ?auto_828703 )
      ( MAKE-9PILE ?auto_828699 ?auto_828700 ?auto_828701 ?auto_828702 ?auto_828703 ?auto_828704 ?auto_828705 ?auto_828706 ?auto_828707 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_828737 - BLOCK
      ?auto_828738 - BLOCK
      ?auto_828739 - BLOCK
      ?auto_828740 - BLOCK
      ?auto_828741 - BLOCK
      ?auto_828742 - BLOCK
      ?auto_828743 - BLOCK
      ?auto_828744 - BLOCK
      ?auto_828745 - BLOCK
    )
    :vars
    (
      ?auto_828746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_828745 ?auto_828746 ) ( ON-TABLE ?auto_828737 ) ( ON ?auto_828738 ?auto_828737 ) ( ON ?auto_828739 ?auto_828738 ) ( not ( = ?auto_828737 ?auto_828738 ) ) ( not ( = ?auto_828737 ?auto_828739 ) ) ( not ( = ?auto_828737 ?auto_828740 ) ) ( not ( = ?auto_828737 ?auto_828741 ) ) ( not ( = ?auto_828737 ?auto_828742 ) ) ( not ( = ?auto_828737 ?auto_828743 ) ) ( not ( = ?auto_828737 ?auto_828744 ) ) ( not ( = ?auto_828737 ?auto_828745 ) ) ( not ( = ?auto_828737 ?auto_828746 ) ) ( not ( = ?auto_828738 ?auto_828739 ) ) ( not ( = ?auto_828738 ?auto_828740 ) ) ( not ( = ?auto_828738 ?auto_828741 ) ) ( not ( = ?auto_828738 ?auto_828742 ) ) ( not ( = ?auto_828738 ?auto_828743 ) ) ( not ( = ?auto_828738 ?auto_828744 ) ) ( not ( = ?auto_828738 ?auto_828745 ) ) ( not ( = ?auto_828738 ?auto_828746 ) ) ( not ( = ?auto_828739 ?auto_828740 ) ) ( not ( = ?auto_828739 ?auto_828741 ) ) ( not ( = ?auto_828739 ?auto_828742 ) ) ( not ( = ?auto_828739 ?auto_828743 ) ) ( not ( = ?auto_828739 ?auto_828744 ) ) ( not ( = ?auto_828739 ?auto_828745 ) ) ( not ( = ?auto_828739 ?auto_828746 ) ) ( not ( = ?auto_828740 ?auto_828741 ) ) ( not ( = ?auto_828740 ?auto_828742 ) ) ( not ( = ?auto_828740 ?auto_828743 ) ) ( not ( = ?auto_828740 ?auto_828744 ) ) ( not ( = ?auto_828740 ?auto_828745 ) ) ( not ( = ?auto_828740 ?auto_828746 ) ) ( not ( = ?auto_828741 ?auto_828742 ) ) ( not ( = ?auto_828741 ?auto_828743 ) ) ( not ( = ?auto_828741 ?auto_828744 ) ) ( not ( = ?auto_828741 ?auto_828745 ) ) ( not ( = ?auto_828741 ?auto_828746 ) ) ( not ( = ?auto_828742 ?auto_828743 ) ) ( not ( = ?auto_828742 ?auto_828744 ) ) ( not ( = ?auto_828742 ?auto_828745 ) ) ( not ( = ?auto_828742 ?auto_828746 ) ) ( not ( = ?auto_828743 ?auto_828744 ) ) ( not ( = ?auto_828743 ?auto_828745 ) ) ( not ( = ?auto_828743 ?auto_828746 ) ) ( not ( = ?auto_828744 ?auto_828745 ) ) ( not ( = ?auto_828744 ?auto_828746 ) ) ( not ( = ?auto_828745 ?auto_828746 ) ) ( ON ?auto_828744 ?auto_828745 ) ( ON ?auto_828743 ?auto_828744 ) ( ON ?auto_828742 ?auto_828743 ) ( ON ?auto_828741 ?auto_828742 ) ( CLEAR ?auto_828739 ) ( ON ?auto_828740 ?auto_828741 ) ( CLEAR ?auto_828740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_828737 ?auto_828738 ?auto_828739 ?auto_828740 )
      ( MAKE-9PILE ?auto_828737 ?auto_828738 ?auto_828739 ?auto_828740 ?auto_828741 ?auto_828742 ?auto_828743 ?auto_828744 ?auto_828745 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_828775 - BLOCK
      ?auto_828776 - BLOCK
      ?auto_828777 - BLOCK
      ?auto_828778 - BLOCK
      ?auto_828779 - BLOCK
      ?auto_828780 - BLOCK
      ?auto_828781 - BLOCK
      ?auto_828782 - BLOCK
      ?auto_828783 - BLOCK
    )
    :vars
    (
      ?auto_828784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_828783 ?auto_828784 ) ( ON-TABLE ?auto_828775 ) ( ON ?auto_828776 ?auto_828775 ) ( not ( = ?auto_828775 ?auto_828776 ) ) ( not ( = ?auto_828775 ?auto_828777 ) ) ( not ( = ?auto_828775 ?auto_828778 ) ) ( not ( = ?auto_828775 ?auto_828779 ) ) ( not ( = ?auto_828775 ?auto_828780 ) ) ( not ( = ?auto_828775 ?auto_828781 ) ) ( not ( = ?auto_828775 ?auto_828782 ) ) ( not ( = ?auto_828775 ?auto_828783 ) ) ( not ( = ?auto_828775 ?auto_828784 ) ) ( not ( = ?auto_828776 ?auto_828777 ) ) ( not ( = ?auto_828776 ?auto_828778 ) ) ( not ( = ?auto_828776 ?auto_828779 ) ) ( not ( = ?auto_828776 ?auto_828780 ) ) ( not ( = ?auto_828776 ?auto_828781 ) ) ( not ( = ?auto_828776 ?auto_828782 ) ) ( not ( = ?auto_828776 ?auto_828783 ) ) ( not ( = ?auto_828776 ?auto_828784 ) ) ( not ( = ?auto_828777 ?auto_828778 ) ) ( not ( = ?auto_828777 ?auto_828779 ) ) ( not ( = ?auto_828777 ?auto_828780 ) ) ( not ( = ?auto_828777 ?auto_828781 ) ) ( not ( = ?auto_828777 ?auto_828782 ) ) ( not ( = ?auto_828777 ?auto_828783 ) ) ( not ( = ?auto_828777 ?auto_828784 ) ) ( not ( = ?auto_828778 ?auto_828779 ) ) ( not ( = ?auto_828778 ?auto_828780 ) ) ( not ( = ?auto_828778 ?auto_828781 ) ) ( not ( = ?auto_828778 ?auto_828782 ) ) ( not ( = ?auto_828778 ?auto_828783 ) ) ( not ( = ?auto_828778 ?auto_828784 ) ) ( not ( = ?auto_828779 ?auto_828780 ) ) ( not ( = ?auto_828779 ?auto_828781 ) ) ( not ( = ?auto_828779 ?auto_828782 ) ) ( not ( = ?auto_828779 ?auto_828783 ) ) ( not ( = ?auto_828779 ?auto_828784 ) ) ( not ( = ?auto_828780 ?auto_828781 ) ) ( not ( = ?auto_828780 ?auto_828782 ) ) ( not ( = ?auto_828780 ?auto_828783 ) ) ( not ( = ?auto_828780 ?auto_828784 ) ) ( not ( = ?auto_828781 ?auto_828782 ) ) ( not ( = ?auto_828781 ?auto_828783 ) ) ( not ( = ?auto_828781 ?auto_828784 ) ) ( not ( = ?auto_828782 ?auto_828783 ) ) ( not ( = ?auto_828782 ?auto_828784 ) ) ( not ( = ?auto_828783 ?auto_828784 ) ) ( ON ?auto_828782 ?auto_828783 ) ( ON ?auto_828781 ?auto_828782 ) ( ON ?auto_828780 ?auto_828781 ) ( ON ?auto_828779 ?auto_828780 ) ( ON ?auto_828778 ?auto_828779 ) ( CLEAR ?auto_828776 ) ( ON ?auto_828777 ?auto_828778 ) ( CLEAR ?auto_828777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_828775 ?auto_828776 ?auto_828777 )
      ( MAKE-9PILE ?auto_828775 ?auto_828776 ?auto_828777 ?auto_828778 ?auto_828779 ?auto_828780 ?auto_828781 ?auto_828782 ?auto_828783 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_828813 - BLOCK
      ?auto_828814 - BLOCK
      ?auto_828815 - BLOCK
      ?auto_828816 - BLOCK
      ?auto_828817 - BLOCK
      ?auto_828818 - BLOCK
      ?auto_828819 - BLOCK
      ?auto_828820 - BLOCK
      ?auto_828821 - BLOCK
    )
    :vars
    (
      ?auto_828822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_828821 ?auto_828822 ) ( ON-TABLE ?auto_828813 ) ( not ( = ?auto_828813 ?auto_828814 ) ) ( not ( = ?auto_828813 ?auto_828815 ) ) ( not ( = ?auto_828813 ?auto_828816 ) ) ( not ( = ?auto_828813 ?auto_828817 ) ) ( not ( = ?auto_828813 ?auto_828818 ) ) ( not ( = ?auto_828813 ?auto_828819 ) ) ( not ( = ?auto_828813 ?auto_828820 ) ) ( not ( = ?auto_828813 ?auto_828821 ) ) ( not ( = ?auto_828813 ?auto_828822 ) ) ( not ( = ?auto_828814 ?auto_828815 ) ) ( not ( = ?auto_828814 ?auto_828816 ) ) ( not ( = ?auto_828814 ?auto_828817 ) ) ( not ( = ?auto_828814 ?auto_828818 ) ) ( not ( = ?auto_828814 ?auto_828819 ) ) ( not ( = ?auto_828814 ?auto_828820 ) ) ( not ( = ?auto_828814 ?auto_828821 ) ) ( not ( = ?auto_828814 ?auto_828822 ) ) ( not ( = ?auto_828815 ?auto_828816 ) ) ( not ( = ?auto_828815 ?auto_828817 ) ) ( not ( = ?auto_828815 ?auto_828818 ) ) ( not ( = ?auto_828815 ?auto_828819 ) ) ( not ( = ?auto_828815 ?auto_828820 ) ) ( not ( = ?auto_828815 ?auto_828821 ) ) ( not ( = ?auto_828815 ?auto_828822 ) ) ( not ( = ?auto_828816 ?auto_828817 ) ) ( not ( = ?auto_828816 ?auto_828818 ) ) ( not ( = ?auto_828816 ?auto_828819 ) ) ( not ( = ?auto_828816 ?auto_828820 ) ) ( not ( = ?auto_828816 ?auto_828821 ) ) ( not ( = ?auto_828816 ?auto_828822 ) ) ( not ( = ?auto_828817 ?auto_828818 ) ) ( not ( = ?auto_828817 ?auto_828819 ) ) ( not ( = ?auto_828817 ?auto_828820 ) ) ( not ( = ?auto_828817 ?auto_828821 ) ) ( not ( = ?auto_828817 ?auto_828822 ) ) ( not ( = ?auto_828818 ?auto_828819 ) ) ( not ( = ?auto_828818 ?auto_828820 ) ) ( not ( = ?auto_828818 ?auto_828821 ) ) ( not ( = ?auto_828818 ?auto_828822 ) ) ( not ( = ?auto_828819 ?auto_828820 ) ) ( not ( = ?auto_828819 ?auto_828821 ) ) ( not ( = ?auto_828819 ?auto_828822 ) ) ( not ( = ?auto_828820 ?auto_828821 ) ) ( not ( = ?auto_828820 ?auto_828822 ) ) ( not ( = ?auto_828821 ?auto_828822 ) ) ( ON ?auto_828820 ?auto_828821 ) ( ON ?auto_828819 ?auto_828820 ) ( ON ?auto_828818 ?auto_828819 ) ( ON ?auto_828817 ?auto_828818 ) ( ON ?auto_828816 ?auto_828817 ) ( ON ?auto_828815 ?auto_828816 ) ( CLEAR ?auto_828813 ) ( ON ?auto_828814 ?auto_828815 ) ( CLEAR ?auto_828814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_828813 ?auto_828814 )
      ( MAKE-9PILE ?auto_828813 ?auto_828814 ?auto_828815 ?auto_828816 ?auto_828817 ?auto_828818 ?auto_828819 ?auto_828820 ?auto_828821 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_828851 - BLOCK
      ?auto_828852 - BLOCK
      ?auto_828853 - BLOCK
      ?auto_828854 - BLOCK
      ?auto_828855 - BLOCK
      ?auto_828856 - BLOCK
      ?auto_828857 - BLOCK
      ?auto_828858 - BLOCK
      ?auto_828859 - BLOCK
    )
    :vars
    (
      ?auto_828860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_828859 ?auto_828860 ) ( not ( = ?auto_828851 ?auto_828852 ) ) ( not ( = ?auto_828851 ?auto_828853 ) ) ( not ( = ?auto_828851 ?auto_828854 ) ) ( not ( = ?auto_828851 ?auto_828855 ) ) ( not ( = ?auto_828851 ?auto_828856 ) ) ( not ( = ?auto_828851 ?auto_828857 ) ) ( not ( = ?auto_828851 ?auto_828858 ) ) ( not ( = ?auto_828851 ?auto_828859 ) ) ( not ( = ?auto_828851 ?auto_828860 ) ) ( not ( = ?auto_828852 ?auto_828853 ) ) ( not ( = ?auto_828852 ?auto_828854 ) ) ( not ( = ?auto_828852 ?auto_828855 ) ) ( not ( = ?auto_828852 ?auto_828856 ) ) ( not ( = ?auto_828852 ?auto_828857 ) ) ( not ( = ?auto_828852 ?auto_828858 ) ) ( not ( = ?auto_828852 ?auto_828859 ) ) ( not ( = ?auto_828852 ?auto_828860 ) ) ( not ( = ?auto_828853 ?auto_828854 ) ) ( not ( = ?auto_828853 ?auto_828855 ) ) ( not ( = ?auto_828853 ?auto_828856 ) ) ( not ( = ?auto_828853 ?auto_828857 ) ) ( not ( = ?auto_828853 ?auto_828858 ) ) ( not ( = ?auto_828853 ?auto_828859 ) ) ( not ( = ?auto_828853 ?auto_828860 ) ) ( not ( = ?auto_828854 ?auto_828855 ) ) ( not ( = ?auto_828854 ?auto_828856 ) ) ( not ( = ?auto_828854 ?auto_828857 ) ) ( not ( = ?auto_828854 ?auto_828858 ) ) ( not ( = ?auto_828854 ?auto_828859 ) ) ( not ( = ?auto_828854 ?auto_828860 ) ) ( not ( = ?auto_828855 ?auto_828856 ) ) ( not ( = ?auto_828855 ?auto_828857 ) ) ( not ( = ?auto_828855 ?auto_828858 ) ) ( not ( = ?auto_828855 ?auto_828859 ) ) ( not ( = ?auto_828855 ?auto_828860 ) ) ( not ( = ?auto_828856 ?auto_828857 ) ) ( not ( = ?auto_828856 ?auto_828858 ) ) ( not ( = ?auto_828856 ?auto_828859 ) ) ( not ( = ?auto_828856 ?auto_828860 ) ) ( not ( = ?auto_828857 ?auto_828858 ) ) ( not ( = ?auto_828857 ?auto_828859 ) ) ( not ( = ?auto_828857 ?auto_828860 ) ) ( not ( = ?auto_828858 ?auto_828859 ) ) ( not ( = ?auto_828858 ?auto_828860 ) ) ( not ( = ?auto_828859 ?auto_828860 ) ) ( ON ?auto_828858 ?auto_828859 ) ( ON ?auto_828857 ?auto_828858 ) ( ON ?auto_828856 ?auto_828857 ) ( ON ?auto_828855 ?auto_828856 ) ( ON ?auto_828854 ?auto_828855 ) ( ON ?auto_828853 ?auto_828854 ) ( ON ?auto_828852 ?auto_828853 ) ( ON ?auto_828851 ?auto_828852 ) ( CLEAR ?auto_828851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_828851 )
      ( MAKE-9PILE ?auto_828851 ?auto_828852 ?auto_828853 ?auto_828854 ?auto_828855 ?auto_828856 ?auto_828857 ?auto_828858 ?auto_828859 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_828890 - BLOCK
      ?auto_828891 - BLOCK
      ?auto_828892 - BLOCK
      ?auto_828893 - BLOCK
      ?auto_828894 - BLOCK
      ?auto_828895 - BLOCK
      ?auto_828896 - BLOCK
      ?auto_828897 - BLOCK
      ?auto_828898 - BLOCK
      ?auto_828899 - BLOCK
    )
    :vars
    (
      ?auto_828900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_828898 ) ( ON ?auto_828899 ?auto_828900 ) ( CLEAR ?auto_828899 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_828890 ) ( ON ?auto_828891 ?auto_828890 ) ( ON ?auto_828892 ?auto_828891 ) ( ON ?auto_828893 ?auto_828892 ) ( ON ?auto_828894 ?auto_828893 ) ( ON ?auto_828895 ?auto_828894 ) ( ON ?auto_828896 ?auto_828895 ) ( ON ?auto_828897 ?auto_828896 ) ( ON ?auto_828898 ?auto_828897 ) ( not ( = ?auto_828890 ?auto_828891 ) ) ( not ( = ?auto_828890 ?auto_828892 ) ) ( not ( = ?auto_828890 ?auto_828893 ) ) ( not ( = ?auto_828890 ?auto_828894 ) ) ( not ( = ?auto_828890 ?auto_828895 ) ) ( not ( = ?auto_828890 ?auto_828896 ) ) ( not ( = ?auto_828890 ?auto_828897 ) ) ( not ( = ?auto_828890 ?auto_828898 ) ) ( not ( = ?auto_828890 ?auto_828899 ) ) ( not ( = ?auto_828890 ?auto_828900 ) ) ( not ( = ?auto_828891 ?auto_828892 ) ) ( not ( = ?auto_828891 ?auto_828893 ) ) ( not ( = ?auto_828891 ?auto_828894 ) ) ( not ( = ?auto_828891 ?auto_828895 ) ) ( not ( = ?auto_828891 ?auto_828896 ) ) ( not ( = ?auto_828891 ?auto_828897 ) ) ( not ( = ?auto_828891 ?auto_828898 ) ) ( not ( = ?auto_828891 ?auto_828899 ) ) ( not ( = ?auto_828891 ?auto_828900 ) ) ( not ( = ?auto_828892 ?auto_828893 ) ) ( not ( = ?auto_828892 ?auto_828894 ) ) ( not ( = ?auto_828892 ?auto_828895 ) ) ( not ( = ?auto_828892 ?auto_828896 ) ) ( not ( = ?auto_828892 ?auto_828897 ) ) ( not ( = ?auto_828892 ?auto_828898 ) ) ( not ( = ?auto_828892 ?auto_828899 ) ) ( not ( = ?auto_828892 ?auto_828900 ) ) ( not ( = ?auto_828893 ?auto_828894 ) ) ( not ( = ?auto_828893 ?auto_828895 ) ) ( not ( = ?auto_828893 ?auto_828896 ) ) ( not ( = ?auto_828893 ?auto_828897 ) ) ( not ( = ?auto_828893 ?auto_828898 ) ) ( not ( = ?auto_828893 ?auto_828899 ) ) ( not ( = ?auto_828893 ?auto_828900 ) ) ( not ( = ?auto_828894 ?auto_828895 ) ) ( not ( = ?auto_828894 ?auto_828896 ) ) ( not ( = ?auto_828894 ?auto_828897 ) ) ( not ( = ?auto_828894 ?auto_828898 ) ) ( not ( = ?auto_828894 ?auto_828899 ) ) ( not ( = ?auto_828894 ?auto_828900 ) ) ( not ( = ?auto_828895 ?auto_828896 ) ) ( not ( = ?auto_828895 ?auto_828897 ) ) ( not ( = ?auto_828895 ?auto_828898 ) ) ( not ( = ?auto_828895 ?auto_828899 ) ) ( not ( = ?auto_828895 ?auto_828900 ) ) ( not ( = ?auto_828896 ?auto_828897 ) ) ( not ( = ?auto_828896 ?auto_828898 ) ) ( not ( = ?auto_828896 ?auto_828899 ) ) ( not ( = ?auto_828896 ?auto_828900 ) ) ( not ( = ?auto_828897 ?auto_828898 ) ) ( not ( = ?auto_828897 ?auto_828899 ) ) ( not ( = ?auto_828897 ?auto_828900 ) ) ( not ( = ?auto_828898 ?auto_828899 ) ) ( not ( = ?auto_828898 ?auto_828900 ) ) ( not ( = ?auto_828899 ?auto_828900 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_828899 ?auto_828900 )
      ( !STACK ?auto_828899 ?auto_828898 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_828932 - BLOCK
      ?auto_828933 - BLOCK
      ?auto_828934 - BLOCK
      ?auto_828935 - BLOCK
      ?auto_828936 - BLOCK
      ?auto_828937 - BLOCK
      ?auto_828938 - BLOCK
      ?auto_828939 - BLOCK
      ?auto_828940 - BLOCK
      ?auto_828941 - BLOCK
    )
    :vars
    (
      ?auto_828942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_828941 ?auto_828942 ) ( ON-TABLE ?auto_828932 ) ( ON ?auto_828933 ?auto_828932 ) ( ON ?auto_828934 ?auto_828933 ) ( ON ?auto_828935 ?auto_828934 ) ( ON ?auto_828936 ?auto_828935 ) ( ON ?auto_828937 ?auto_828936 ) ( ON ?auto_828938 ?auto_828937 ) ( ON ?auto_828939 ?auto_828938 ) ( not ( = ?auto_828932 ?auto_828933 ) ) ( not ( = ?auto_828932 ?auto_828934 ) ) ( not ( = ?auto_828932 ?auto_828935 ) ) ( not ( = ?auto_828932 ?auto_828936 ) ) ( not ( = ?auto_828932 ?auto_828937 ) ) ( not ( = ?auto_828932 ?auto_828938 ) ) ( not ( = ?auto_828932 ?auto_828939 ) ) ( not ( = ?auto_828932 ?auto_828940 ) ) ( not ( = ?auto_828932 ?auto_828941 ) ) ( not ( = ?auto_828932 ?auto_828942 ) ) ( not ( = ?auto_828933 ?auto_828934 ) ) ( not ( = ?auto_828933 ?auto_828935 ) ) ( not ( = ?auto_828933 ?auto_828936 ) ) ( not ( = ?auto_828933 ?auto_828937 ) ) ( not ( = ?auto_828933 ?auto_828938 ) ) ( not ( = ?auto_828933 ?auto_828939 ) ) ( not ( = ?auto_828933 ?auto_828940 ) ) ( not ( = ?auto_828933 ?auto_828941 ) ) ( not ( = ?auto_828933 ?auto_828942 ) ) ( not ( = ?auto_828934 ?auto_828935 ) ) ( not ( = ?auto_828934 ?auto_828936 ) ) ( not ( = ?auto_828934 ?auto_828937 ) ) ( not ( = ?auto_828934 ?auto_828938 ) ) ( not ( = ?auto_828934 ?auto_828939 ) ) ( not ( = ?auto_828934 ?auto_828940 ) ) ( not ( = ?auto_828934 ?auto_828941 ) ) ( not ( = ?auto_828934 ?auto_828942 ) ) ( not ( = ?auto_828935 ?auto_828936 ) ) ( not ( = ?auto_828935 ?auto_828937 ) ) ( not ( = ?auto_828935 ?auto_828938 ) ) ( not ( = ?auto_828935 ?auto_828939 ) ) ( not ( = ?auto_828935 ?auto_828940 ) ) ( not ( = ?auto_828935 ?auto_828941 ) ) ( not ( = ?auto_828935 ?auto_828942 ) ) ( not ( = ?auto_828936 ?auto_828937 ) ) ( not ( = ?auto_828936 ?auto_828938 ) ) ( not ( = ?auto_828936 ?auto_828939 ) ) ( not ( = ?auto_828936 ?auto_828940 ) ) ( not ( = ?auto_828936 ?auto_828941 ) ) ( not ( = ?auto_828936 ?auto_828942 ) ) ( not ( = ?auto_828937 ?auto_828938 ) ) ( not ( = ?auto_828937 ?auto_828939 ) ) ( not ( = ?auto_828937 ?auto_828940 ) ) ( not ( = ?auto_828937 ?auto_828941 ) ) ( not ( = ?auto_828937 ?auto_828942 ) ) ( not ( = ?auto_828938 ?auto_828939 ) ) ( not ( = ?auto_828938 ?auto_828940 ) ) ( not ( = ?auto_828938 ?auto_828941 ) ) ( not ( = ?auto_828938 ?auto_828942 ) ) ( not ( = ?auto_828939 ?auto_828940 ) ) ( not ( = ?auto_828939 ?auto_828941 ) ) ( not ( = ?auto_828939 ?auto_828942 ) ) ( not ( = ?auto_828940 ?auto_828941 ) ) ( not ( = ?auto_828940 ?auto_828942 ) ) ( not ( = ?auto_828941 ?auto_828942 ) ) ( CLEAR ?auto_828939 ) ( ON ?auto_828940 ?auto_828941 ) ( CLEAR ?auto_828940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_828932 ?auto_828933 ?auto_828934 ?auto_828935 ?auto_828936 ?auto_828937 ?auto_828938 ?auto_828939 ?auto_828940 )
      ( MAKE-10PILE ?auto_828932 ?auto_828933 ?auto_828934 ?auto_828935 ?auto_828936 ?auto_828937 ?auto_828938 ?auto_828939 ?auto_828940 ?auto_828941 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_828974 - BLOCK
      ?auto_828975 - BLOCK
      ?auto_828976 - BLOCK
      ?auto_828977 - BLOCK
      ?auto_828978 - BLOCK
      ?auto_828979 - BLOCK
      ?auto_828980 - BLOCK
      ?auto_828981 - BLOCK
      ?auto_828982 - BLOCK
      ?auto_828983 - BLOCK
    )
    :vars
    (
      ?auto_828984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_828983 ?auto_828984 ) ( ON-TABLE ?auto_828974 ) ( ON ?auto_828975 ?auto_828974 ) ( ON ?auto_828976 ?auto_828975 ) ( ON ?auto_828977 ?auto_828976 ) ( ON ?auto_828978 ?auto_828977 ) ( ON ?auto_828979 ?auto_828978 ) ( ON ?auto_828980 ?auto_828979 ) ( not ( = ?auto_828974 ?auto_828975 ) ) ( not ( = ?auto_828974 ?auto_828976 ) ) ( not ( = ?auto_828974 ?auto_828977 ) ) ( not ( = ?auto_828974 ?auto_828978 ) ) ( not ( = ?auto_828974 ?auto_828979 ) ) ( not ( = ?auto_828974 ?auto_828980 ) ) ( not ( = ?auto_828974 ?auto_828981 ) ) ( not ( = ?auto_828974 ?auto_828982 ) ) ( not ( = ?auto_828974 ?auto_828983 ) ) ( not ( = ?auto_828974 ?auto_828984 ) ) ( not ( = ?auto_828975 ?auto_828976 ) ) ( not ( = ?auto_828975 ?auto_828977 ) ) ( not ( = ?auto_828975 ?auto_828978 ) ) ( not ( = ?auto_828975 ?auto_828979 ) ) ( not ( = ?auto_828975 ?auto_828980 ) ) ( not ( = ?auto_828975 ?auto_828981 ) ) ( not ( = ?auto_828975 ?auto_828982 ) ) ( not ( = ?auto_828975 ?auto_828983 ) ) ( not ( = ?auto_828975 ?auto_828984 ) ) ( not ( = ?auto_828976 ?auto_828977 ) ) ( not ( = ?auto_828976 ?auto_828978 ) ) ( not ( = ?auto_828976 ?auto_828979 ) ) ( not ( = ?auto_828976 ?auto_828980 ) ) ( not ( = ?auto_828976 ?auto_828981 ) ) ( not ( = ?auto_828976 ?auto_828982 ) ) ( not ( = ?auto_828976 ?auto_828983 ) ) ( not ( = ?auto_828976 ?auto_828984 ) ) ( not ( = ?auto_828977 ?auto_828978 ) ) ( not ( = ?auto_828977 ?auto_828979 ) ) ( not ( = ?auto_828977 ?auto_828980 ) ) ( not ( = ?auto_828977 ?auto_828981 ) ) ( not ( = ?auto_828977 ?auto_828982 ) ) ( not ( = ?auto_828977 ?auto_828983 ) ) ( not ( = ?auto_828977 ?auto_828984 ) ) ( not ( = ?auto_828978 ?auto_828979 ) ) ( not ( = ?auto_828978 ?auto_828980 ) ) ( not ( = ?auto_828978 ?auto_828981 ) ) ( not ( = ?auto_828978 ?auto_828982 ) ) ( not ( = ?auto_828978 ?auto_828983 ) ) ( not ( = ?auto_828978 ?auto_828984 ) ) ( not ( = ?auto_828979 ?auto_828980 ) ) ( not ( = ?auto_828979 ?auto_828981 ) ) ( not ( = ?auto_828979 ?auto_828982 ) ) ( not ( = ?auto_828979 ?auto_828983 ) ) ( not ( = ?auto_828979 ?auto_828984 ) ) ( not ( = ?auto_828980 ?auto_828981 ) ) ( not ( = ?auto_828980 ?auto_828982 ) ) ( not ( = ?auto_828980 ?auto_828983 ) ) ( not ( = ?auto_828980 ?auto_828984 ) ) ( not ( = ?auto_828981 ?auto_828982 ) ) ( not ( = ?auto_828981 ?auto_828983 ) ) ( not ( = ?auto_828981 ?auto_828984 ) ) ( not ( = ?auto_828982 ?auto_828983 ) ) ( not ( = ?auto_828982 ?auto_828984 ) ) ( not ( = ?auto_828983 ?auto_828984 ) ) ( ON ?auto_828982 ?auto_828983 ) ( CLEAR ?auto_828980 ) ( ON ?auto_828981 ?auto_828982 ) ( CLEAR ?auto_828981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_828974 ?auto_828975 ?auto_828976 ?auto_828977 ?auto_828978 ?auto_828979 ?auto_828980 ?auto_828981 )
      ( MAKE-10PILE ?auto_828974 ?auto_828975 ?auto_828976 ?auto_828977 ?auto_828978 ?auto_828979 ?auto_828980 ?auto_828981 ?auto_828982 ?auto_828983 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_829016 - BLOCK
      ?auto_829017 - BLOCK
      ?auto_829018 - BLOCK
      ?auto_829019 - BLOCK
      ?auto_829020 - BLOCK
      ?auto_829021 - BLOCK
      ?auto_829022 - BLOCK
      ?auto_829023 - BLOCK
      ?auto_829024 - BLOCK
      ?auto_829025 - BLOCK
    )
    :vars
    (
      ?auto_829026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_829025 ?auto_829026 ) ( ON-TABLE ?auto_829016 ) ( ON ?auto_829017 ?auto_829016 ) ( ON ?auto_829018 ?auto_829017 ) ( ON ?auto_829019 ?auto_829018 ) ( ON ?auto_829020 ?auto_829019 ) ( ON ?auto_829021 ?auto_829020 ) ( not ( = ?auto_829016 ?auto_829017 ) ) ( not ( = ?auto_829016 ?auto_829018 ) ) ( not ( = ?auto_829016 ?auto_829019 ) ) ( not ( = ?auto_829016 ?auto_829020 ) ) ( not ( = ?auto_829016 ?auto_829021 ) ) ( not ( = ?auto_829016 ?auto_829022 ) ) ( not ( = ?auto_829016 ?auto_829023 ) ) ( not ( = ?auto_829016 ?auto_829024 ) ) ( not ( = ?auto_829016 ?auto_829025 ) ) ( not ( = ?auto_829016 ?auto_829026 ) ) ( not ( = ?auto_829017 ?auto_829018 ) ) ( not ( = ?auto_829017 ?auto_829019 ) ) ( not ( = ?auto_829017 ?auto_829020 ) ) ( not ( = ?auto_829017 ?auto_829021 ) ) ( not ( = ?auto_829017 ?auto_829022 ) ) ( not ( = ?auto_829017 ?auto_829023 ) ) ( not ( = ?auto_829017 ?auto_829024 ) ) ( not ( = ?auto_829017 ?auto_829025 ) ) ( not ( = ?auto_829017 ?auto_829026 ) ) ( not ( = ?auto_829018 ?auto_829019 ) ) ( not ( = ?auto_829018 ?auto_829020 ) ) ( not ( = ?auto_829018 ?auto_829021 ) ) ( not ( = ?auto_829018 ?auto_829022 ) ) ( not ( = ?auto_829018 ?auto_829023 ) ) ( not ( = ?auto_829018 ?auto_829024 ) ) ( not ( = ?auto_829018 ?auto_829025 ) ) ( not ( = ?auto_829018 ?auto_829026 ) ) ( not ( = ?auto_829019 ?auto_829020 ) ) ( not ( = ?auto_829019 ?auto_829021 ) ) ( not ( = ?auto_829019 ?auto_829022 ) ) ( not ( = ?auto_829019 ?auto_829023 ) ) ( not ( = ?auto_829019 ?auto_829024 ) ) ( not ( = ?auto_829019 ?auto_829025 ) ) ( not ( = ?auto_829019 ?auto_829026 ) ) ( not ( = ?auto_829020 ?auto_829021 ) ) ( not ( = ?auto_829020 ?auto_829022 ) ) ( not ( = ?auto_829020 ?auto_829023 ) ) ( not ( = ?auto_829020 ?auto_829024 ) ) ( not ( = ?auto_829020 ?auto_829025 ) ) ( not ( = ?auto_829020 ?auto_829026 ) ) ( not ( = ?auto_829021 ?auto_829022 ) ) ( not ( = ?auto_829021 ?auto_829023 ) ) ( not ( = ?auto_829021 ?auto_829024 ) ) ( not ( = ?auto_829021 ?auto_829025 ) ) ( not ( = ?auto_829021 ?auto_829026 ) ) ( not ( = ?auto_829022 ?auto_829023 ) ) ( not ( = ?auto_829022 ?auto_829024 ) ) ( not ( = ?auto_829022 ?auto_829025 ) ) ( not ( = ?auto_829022 ?auto_829026 ) ) ( not ( = ?auto_829023 ?auto_829024 ) ) ( not ( = ?auto_829023 ?auto_829025 ) ) ( not ( = ?auto_829023 ?auto_829026 ) ) ( not ( = ?auto_829024 ?auto_829025 ) ) ( not ( = ?auto_829024 ?auto_829026 ) ) ( not ( = ?auto_829025 ?auto_829026 ) ) ( ON ?auto_829024 ?auto_829025 ) ( ON ?auto_829023 ?auto_829024 ) ( CLEAR ?auto_829021 ) ( ON ?auto_829022 ?auto_829023 ) ( CLEAR ?auto_829022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_829016 ?auto_829017 ?auto_829018 ?auto_829019 ?auto_829020 ?auto_829021 ?auto_829022 )
      ( MAKE-10PILE ?auto_829016 ?auto_829017 ?auto_829018 ?auto_829019 ?auto_829020 ?auto_829021 ?auto_829022 ?auto_829023 ?auto_829024 ?auto_829025 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_829058 - BLOCK
      ?auto_829059 - BLOCK
      ?auto_829060 - BLOCK
      ?auto_829061 - BLOCK
      ?auto_829062 - BLOCK
      ?auto_829063 - BLOCK
      ?auto_829064 - BLOCK
      ?auto_829065 - BLOCK
      ?auto_829066 - BLOCK
      ?auto_829067 - BLOCK
    )
    :vars
    (
      ?auto_829068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_829067 ?auto_829068 ) ( ON-TABLE ?auto_829058 ) ( ON ?auto_829059 ?auto_829058 ) ( ON ?auto_829060 ?auto_829059 ) ( ON ?auto_829061 ?auto_829060 ) ( ON ?auto_829062 ?auto_829061 ) ( not ( = ?auto_829058 ?auto_829059 ) ) ( not ( = ?auto_829058 ?auto_829060 ) ) ( not ( = ?auto_829058 ?auto_829061 ) ) ( not ( = ?auto_829058 ?auto_829062 ) ) ( not ( = ?auto_829058 ?auto_829063 ) ) ( not ( = ?auto_829058 ?auto_829064 ) ) ( not ( = ?auto_829058 ?auto_829065 ) ) ( not ( = ?auto_829058 ?auto_829066 ) ) ( not ( = ?auto_829058 ?auto_829067 ) ) ( not ( = ?auto_829058 ?auto_829068 ) ) ( not ( = ?auto_829059 ?auto_829060 ) ) ( not ( = ?auto_829059 ?auto_829061 ) ) ( not ( = ?auto_829059 ?auto_829062 ) ) ( not ( = ?auto_829059 ?auto_829063 ) ) ( not ( = ?auto_829059 ?auto_829064 ) ) ( not ( = ?auto_829059 ?auto_829065 ) ) ( not ( = ?auto_829059 ?auto_829066 ) ) ( not ( = ?auto_829059 ?auto_829067 ) ) ( not ( = ?auto_829059 ?auto_829068 ) ) ( not ( = ?auto_829060 ?auto_829061 ) ) ( not ( = ?auto_829060 ?auto_829062 ) ) ( not ( = ?auto_829060 ?auto_829063 ) ) ( not ( = ?auto_829060 ?auto_829064 ) ) ( not ( = ?auto_829060 ?auto_829065 ) ) ( not ( = ?auto_829060 ?auto_829066 ) ) ( not ( = ?auto_829060 ?auto_829067 ) ) ( not ( = ?auto_829060 ?auto_829068 ) ) ( not ( = ?auto_829061 ?auto_829062 ) ) ( not ( = ?auto_829061 ?auto_829063 ) ) ( not ( = ?auto_829061 ?auto_829064 ) ) ( not ( = ?auto_829061 ?auto_829065 ) ) ( not ( = ?auto_829061 ?auto_829066 ) ) ( not ( = ?auto_829061 ?auto_829067 ) ) ( not ( = ?auto_829061 ?auto_829068 ) ) ( not ( = ?auto_829062 ?auto_829063 ) ) ( not ( = ?auto_829062 ?auto_829064 ) ) ( not ( = ?auto_829062 ?auto_829065 ) ) ( not ( = ?auto_829062 ?auto_829066 ) ) ( not ( = ?auto_829062 ?auto_829067 ) ) ( not ( = ?auto_829062 ?auto_829068 ) ) ( not ( = ?auto_829063 ?auto_829064 ) ) ( not ( = ?auto_829063 ?auto_829065 ) ) ( not ( = ?auto_829063 ?auto_829066 ) ) ( not ( = ?auto_829063 ?auto_829067 ) ) ( not ( = ?auto_829063 ?auto_829068 ) ) ( not ( = ?auto_829064 ?auto_829065 ) ) ( not ( = ?auto_829064 ?auto_829066 ) ) ( not ( = ?auto_829064 ?auto_829067 ) ) ( not ( = ?auto_829064 ?auto_829068 ) ) ( not ( = ?auto_829065 ?auto_829066 ) ) ( not ( = ?auto_829065 ?auto_829067 ) ) ( not ( = ?auto_829065 ?auto_829068 ) ) ( not ( = ?auto_829066 ?auto_829067 ) ) ( not ( = ?auto_829066 ?auto_829068 ) ) ( not ( = ?auto_829067 ?auto_829068 ) ) ( ON ?auto_829066 ?auto_829067 ) ( ON ?auto_829065 ?auto_829066 ) ( ON ?auto_829064 ?auto_829065 ) ( CLEAR ?auto_829062 ) ( ON ?auto_829063 ?auto_829064 ) ( CLEAR ?auto_829063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_829058 ?auto_829059 ?auto_829060 ?auto_829061 ?auto_829062 ?auto_829063 )
      ( MAKE-10PILE ?auto_829058 ?auto_829059 ?auto_829060 ?auto_829061 ?auto_829062 ?auto_829063 ?auto_829064 ?auto_829065 ?auto_829066 ?auto_829067 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_829100 - BLOCK
      ?auto_829101 - BLOCK
      ?auto_829102 - BLOCK
      ?auto_829103 - BLOCK
      ?auto_829104 - BLOCK
      ?auto_829105 - BLOCK
      ?auto_829106 - BLOCK
      ?auto_829107 - BLOCK
      ?auto_829108 - BLOCK
      ?auto_829109 - BLOCK
    )
    :vars
    (
      ?auto_829110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_829109 ?auto_829110 ) ( ON-TABLE ?auto_829100 ) ( ON ?auto_829101 ?auto_829100 ) ( ON ?auto_829102 ?auto_829101 ) ( ON ?auto_829103 ?auto_829102 ) ( not ( = ?auto_829100 ?auto_829101 ) ) ( not ( = ?auto_829100 ?auto_829102 ) ) ( not ( = ?auto_829100 ?auto_829103 ) ) ( not ( = ?auto_829100 ?auto_829104 ) ) ( not ( = ?auto_829100 ?auto_829105 ) ) ( not ( = ?auto_829100 ?auto_829106 ) ) ( not ( = ?auto_829100 ?auto_829107 ) ) ( not ( = ?auto_829100 ?auto_829108 ) ) ( not ( = ?auto_829100 ?auto_829109 ) ) ( not ( = ?auto_829100 ?auto_829110 ) ) ( not ( = ?auto_829101 ?auto_829102 ) ) ( not ( = ?auto_829101 ?auto_829103 ) ) ( not ( = ?auto_829101 ?auto_829104 ) ) ( not ( = ?auto_829101 ?auto_829105 ) ) ( not ( = ?auto_829101 ?auto_829106 ) ) ( not ( = ?auto_829101 ?auto_829107 ) ) ( not ( = ?auto_829101 ?auto_829108 ) ) ( not ( = ?auto_829101 ?auto_829109 ) ) ( not ( = ?auto_829101 ?auto_829110 ) ) ( not ( = ?auto_829102 ?auto_829103 ) ) ( not ( = ?auto_829102 ?auto_829104 ) ) ( not ( = ?auto_829102 ?auto_829105 ) ) ( not ( = ?auto_829102 ?auto_829106 ) ) ( not ( = ?auto_829102 ?auto_829107 ) ) ( not ( = ?auto_829102 ?auto_829108 ) ) ( not ( = ?auto_829102 ?auto_829109 ) ) ( not ( = ?auto_829102 ?auto_829110 ) ) ( not ( = ?auto_829103 ?auto_829104 ) ) ( not ( = ?auto_829103 ?auto_829105 ) ) ( not ( = ?auto_829103 ?auto_829106 ) ) ( not ( = ?auto_829103 ?auto_829107 ) ) ( not ( = ?auto_829103 ?auto_829108 ) ) ( not ( = ?auto_829103 ?auto_829109 ) ) ( not ( = ?auto_829103 ?auto_829110 ) ) ( not ( = ?auto_829104 ?auto_829105 ) ) ( not ( = ?auto_829104 ?auto_829106 ) ) ( not ( = ?auto_829104 ?auto_829107 ) ) ( not ( = ?auto_829104 ?auto_829108 ) ) ( not ( = ?auto_829104 ?auto_829109 ) ) ( not ( = ?auto_829104 ?auto_829110 ) ) ( not ( = ?auto_829105 ?auto_829106 ) ) ( not ( = ?auto_829105 ?auto_829107 ) ) ( not ( = ?auto_829105 ?auto_829108 ) ) ( not ( = ?auto_829105 ?auto_829109 ) ) ( not ( = ?auto_829105 ?auto_829110 ) ) ( not ( = ?auto_829106 ?auto_829107 ) ) ( not ( = ?auto_829106 ?auto_829108 ) ) ( not ( = ?auto_829106 ?auto_829109 ) ) ( not ( = ?auto_829106 ?auto_829110 ) ) ( not ( = ?auto_829107 ?auto_829108 ) ) ( not ( = ?auto_829107 ?auto_829109 ) ) ( not ( = ?auto_829107 ?auto_829110 ) ) ( not ( = ?auto_829108 ?auto_829109 ) ) ( not ( = ?auto_829108 ?auto_829110 ) ) ( not ( = ?auto_829109 ?auto_829110 ) ) ( ON ?auto_829108 ?auto_829109 ) ( ON ?auto_829107 ?auto_829108 ) ( ON ?auto_829106 ?auto_829107 ) ( ON ?auto_829105 ?auto_829106 ) ( CLEAR ?auto_829103 ) ( ON ?auto_829104 ?auto_829105 ) ( CLEAR ?auto_829104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_829100 ?auto_829101 ?auto_829102 ?auto_829103 ?auto_829104 )
      ( MAKE-10PILE ?auto_829100 ?auto_829101 ?auto_829102 ?auto_829103 ?auto_829104 ?auto_829105 ?auto_829106 ?auto_829107 ?auto_829108 ?auto_829109 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_829142 - BLOCK
      ?auto_829143 - BLOCK
      ?auto_829144 - BLOCK
      ?auto_829145 - BLOCK
      ?auto_829146 - BLOCK
      ?auto_829147 - BLOCK
      ?auto_829148 - BLOCK
      ?auto_829149 - BLOCK
      ?auto_829150 - BLOCK
      ?auto_829151 - BLOCK
    )
    :vars
    (
      ?auto_829152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_829151 ?auto_829152 ) ( ON-TABLE ?auto_829142 ) ( ON ?auto_829143 ?auto_829142 ) ( ON ?auto_829144 ?auto_829143 ) ( not ( = ?auto_829142 ?auto_829143 ) ) ( not ( = ?auto_829142 ?auto_829144 ) ) ( not ( = ?auto_829142 ?auto_829145 ) ) ( not ( = ?auto_829142 ?auto_829146 ) ) ( not ( = ?auto_829142 ?auto_829147 ) ) ( not ( = ?auto_829142 ?auto_829148 ) ) ( not ( = ?auto_829142 ?auto_829149 ) ) ( not ( = ?auto_829142 ?auto_829150 ) ) ( not ( = ?auto_829142 ?auto_829151 ) ) ( not ( = ?auto_829142 ?auto_829152 ) ) ( not ( = ?auto_829143 ?auto_829144 ) ) ( not ( = ?auto_829143 ?auto_829145 ) ) ( not ( = ?auto_829143 ?auto_829146 ) ) ( not ( = ?auto_829143 ?auto_829147 ) ) ( not ( = ?auto_829143 ?auto_829148 ) ) ( not ( = ?auto_829143 ?auto_829149 ) ) ( not ( = ?auto_829143 ?auto_829150 ) ) ( not ( = ?auto_829143 ?auto_829151 ) ) ( not ( = ?auto_829143 ?auto_829152 ) ) ( not ( = ?auto_829144 ?auto_829145 ) ) ( not ( = ?auto_829144 ?auto_829146 ) ) ( not ( = ?auto_829144 ?auto_829147 ) ) ( not ( = ?auto_829144 ?auto_829148 ) ) ( not ( = ?auto_829144 ?auto_829149 ) ) ( not ( = ?auto_829144 ?auto_829150 ) ) ( not ( = ?auto_829144 ?auto_829151 ) ) ( not ( = ?auto_829144 ?auto_829152 ) ) ( not ( = ?auto_829145 ?auto_829146 ) ) ( not ( = ?auto_829145 ?auto_829147 ) ) ( not ( = ?auto_829145 ?auto_829148 ) ) ( not ( = ?auto_829145 ?auto_829149 ) ) ( not ( = ?auto_829145 ?auto_829150 ) ) ( not ( = ?auto_829145 ?auto_829151 ) ) ( not ( = ?auto_829145 ?auto_829152 ) ) ( not ( = ?auto_829146 ?auto_829147 ) ) ( not ( = ?auto_829146 ?auto_829148 ) ) ( not ( = ?auto_829146 ?auto_829149 ) ) ( not ( = ?auto_829146 ?auto_829150 ) ) ( not ( = ?auto_829146 ?auto_829151 ) ) ( not ( = ?auto_829146 ?auto_829152 ) ) ( not ( = ?auto_829147 ?auto_829148 ) ) ( not ( = ?auto_829147 ?auto_829149 ) ) ( not ( = ?auto_829147 ?auto_829150 ) ) ( not ( = ?auto_829147 ?auto_829151 ) ) ( not ( = ?auto_829147 ?auto_829152 ) ) ( not ( = ?auto_829148 ?auto_829149 ) ) ( not ( = ?auto_829148 ?auto_829150 ) ) ( not ( = ?auto_829148 ?auto_829151 ) ) ( not ( = ?auto_829148 ?auto_829152 ) ) ( not ( = ?auto_829149 ?auto_829150 ) ) ( not ( = ?auto_829149 ?auto_829151 ) ) ( not ( = ?auto_829149 ?auto_829152 ) ) ( not ( = ?auto_829150 ?auto_829151 ) ) ( not ( = ?auto_829150 ?auto_829152 ) ) ( not ( = ?auto_829151 ?auto_829152 ) ) ( ON ?auto_829150 ?auto_829151 ) ( ON ?auto_829149 ?auto_829150 ) ( ON ?auto_829148 ?auto_829149 ) ( ON ?auto_829147 ?auto_829148 ) ( ON ?auto_829146 ?auto_829147 ) ( CLEAR ?auto_829144 ) ( ON ?auto_829145 ?auto_829146 ) ( CLEAR ?auto_829145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_829142 ?auto_829143 ?auto_829144 ?auto_829145 )
      ( MAKE-10PILE ?auto_829142 ?auto_829143 ?auto_829144 ?auto_829145 ?auto_829146 ?auto_829147 ?auto_829148 ?auto_829149 ?auto_829150 ?auto_829151 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_829184 - BLOCK
      ?auto_829185 - BLOCK
      ?auto_829186 - BLOCK
      ?auto_829187 - BLOCK
      ?auto_829188 - BLOCK
      ?auto_829189 - BLOCK
      ?auto_829190 - BLOCK
      ?auto_829191 - BLOCK
      ?auto_829192 - BLOCK
      ?auto_829193 - BLOCK
    )
    :vars
    (
      ?auto_829194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_829193 ?auto_829194 ) ( ON-TABLE ?auto_829184 ) ( ON ?auto_829185 ?auto_829184 ) ( not ( = ?auto_829184 ?auto_829185 ) ) ( not ( = ?auto_829184 ?auto_829186 ) ) ( not ( = ?auto_829184 ?auto_829187 ) ) ( not ( = ?auto_829184 ?auto_829188 ) ) ( not ( = ?auto_829184 ?auto_829189 ) ) ( not ( = ?auto_829184 ?auto_829190 ) ) ( not ( = ?auto_829184 ?auto_829191 ) ) ( not ( = ?auto_829184 ?auto_829192 ) ) ( not ( = ?auto_829184 ?auto_829193 ) ) ( not ( = ?auto_829184 ?auto_829194 ) ) ( not ( = ?auto_829185 ?auto_829186 ) ) ( not ( = ?auto_829185 ?auto_829187 ) ) ( not ( = ?auto_829185 ?auto_829188 ) ) ( not ( = ?auto_829185 ?auto_829189 ) ) ( not ( = ?auto_829185 ?auto_829190 ) ) ( not ( = ?auto_829185 ?auto_829191 ) ) ( not ( = ?auto_829185 ?auto_829192 ) ) ( not ( = ?auto_829185 ?auto_829193 ) ) ( not ( = ?auto_829185 ?auto_829194 ) ) ( not ( = ?auto_829186 ?auto_829187 ) ) ( not ( = ?auto_829186 ?auto_829188 ) ) ( not ( = ?auto_829186 ?auto_829189 ) ) ( not ( = ?auto_829186 ?auto_829190 ) ) ( not ( = ?auto_829186 ?auto_829191 ) ) ( not ( = ?auto_829186 ?auto_829192 ) ) ( not ( = ?auto_829186 ?auto_829193 ) ) ( not ( = ?auto_829186 ?auto_829194 ) ) ( not ( = ?auto_829187 ?auto_829188 ) ) ( not ( = ?auto_829187 ?auto_829189 ) ) ( not ( = ?auto_829187 ?auto_829190 ) ) ( not ( = ?auto_829187 ?auto_829191 ) ) ( not ( = ?auto_829187 ?auto_829192 ) ) ( not ( = ?auto_829187 ?auto_829193 ) ) ( not ( = ?auto_829187 ?auto_829194 ) ) ( not ( = ?auto_829188 ?auto_829189 ) ) ( not ( = ?auto_829188 ?auto_829190 ) ) ( not ( = ?auto_829188 ?auto_829191 ) ) ( not ( = ?auto_829188 ?auto_829192 ) ) ( not ( = ?auto_829188 ?auto_829193 ) ) ( not ( = ?auto_829188 ?auto_829194 ) ) ( not ( = ?auto_829189 ?auto_829190 ) ) ( not ( = ?auto_829189 ?auto_829191 ) ) ( not ( = ?auto_829189 ?auto_829192 ) ) ( not ( = ?auto_829189 ?auto_829193 ) ) ( not ( = ?auto_829189 ?auto_829194 ) ) ( not ( = ?auto_829190 ?auto_829191 ) ) ( not ( = ?auto_829190 ?auto_829192 ) ) ( not ( = ?auto_829190 ?auto_829193 ) ) ( not ( = ?auto_829190 ?auto_829194 ) ) ( not ( = ?auto_829191 ?auto_829192 ) ) ( not ( = ?auto_829191 ?auto_829193 ) ) ( not ( = ?auto_829191 ?auto_829194 ) ) ( not ( = ?auto_829192 ?auto_829193 ) ) ( not ( = ?auto_829192 ?auto_829194 ) ) ( not ( = ?auto_829193 ?auto_829194 ) ) ( ON ?auto_829192 ?auto_829193 ) ( ON ?auto_829191 ?auto_829192 ) ( ON ?auto_829190 ?auto_829191 ) ( ON ?auto_829189 ?auto_829190 ) ( ON ?auto_829188 ?auto_829189 ) ( ON ?auto_829187 ?auto_829188 ) ( CLEAR ?auto_829185 ) ( ON ?auto_829186 ?auto_829187 ) ( CLEAR ?auto_829186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_829184 ?auto_829185 ?auto_829186 )
      ( MAKE-10PILE ?auto_829184 ?auto_829185 ?auto_829186 ?auto_829187 ?auto_829188 ?auto_829189 ?auto_829190 ?auto_829191 ?auto_829192 ?auto_829193 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_829226 - BLOCK
      ?auto_829227 - BLOCK
      ?auto_829228 - BLOCK
      ?auto_829229 - BLOCK
      ?auto_829230 - BLOCK
      ?auto_829231 - BLOCK
      ?auto_829232 - BLOCK
      ?auto_829233 - BLOCK
      ?auto_829234 - BLOCK
      ?auto_829235 - BLOCK
    )
    :vars
    (
      ?auto_829236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_829235 ?auto_829236 ) ( ON-TABLE ?auto_829226 ) ( not ( = ?auto_829226 ?auto_829227 ) ) ( not ( = ?auto_829226 ?auto_829228 ) ) ( not ( = ?auto_829226 ?auto_829229 ) ) ( not ( = ?auto_829226 ?auto_829230 ) ) ( not ( = ?auto_829226 ?auto_829231 ) ) ( not ( = ?auto_829226 ?auto_829232 ) ) ( not ( = ?auto_829226 ?auto_829233 ) ) ( not ( = ?auto_829226 ?auto_829234 ) ) ( not ( = ?auto_829226 ?auto_829235 ) ) ( not ( = ?auto_829226 ?auto_829236 ) ) ( not ( = ?auto_829227 ?auto_829228 ) ) ( not ( = ?auto_829227 ?auto_829229 ) ) ( not ( = ?auto_829227 ?auto_829230 ) ) ( not ( = ?auto_829227 ?auto_829231 ) ) ( not ( = ?auto_829227 ?auto_829232 ) ) ( not ( = ?auto_829227 ?auto_829233 ) ) ( not ( = ?auto_829227 ?auto_829234 ) ) ( not ( = ?auto_829227 ?auto_829235 ) ) ( not ( = ?auto_829227 ?auto_829236 ) ) ( not ( = ?auto_829228 ?auto_829229 ) ) ( not ( = ?auto_829228 ?auto_829230 ) ) ( not ( = ?auto_829228 ?auto_829231 ) ) ( not ( = ?auto_829228 ?auto_829232 ) ) ( not ( = ?auto_829228 ?auto_829233 ) ) ( not ( = ?auto_829228 ?auto_829234 ) ) ( not ( = ?auto_829228 ?auto_829235 ) ) ( not ( = ?auto_829228 ?auto_829236 ) ) ( not ( = ?auto_829229 ?auto_829230 ) ) ( not ( = ?auto_829229 ?auto_829231 ) ) ( not ( = ?auto_829229 ?auto_829232 ) ) ( not ( = ?auto_829229 ?auto_829233 ) ) ( not ( = ?auto_829229 ?auto_829234 ) ) ( not ( = ?auto_829229 ?auto_829235 ) ) ( not ( = ?auto_829229 ?auto_829236 ) ) ( not ( = ?auto_829230 ?auto_829231 ) ) ( not ( = ?auto_829230 ?auto_829232 ) ) ( not ( = ?auto_829230 ?auto_829233 ) ) ( not ( = ?auto_829230 ?auto_829234 ) ) ( not ( = ?auto_829230 ?auto_829235 ) ) ( not ( = ?auto_829230 ?auto_829236 ) ) ( not ( = ?auto_829231 ?auto_829232 ) ) ( not ( = ?auto_829231 ?auto_829233 ) ) ( not ( = ?auto_829231 ?auto_829234 ) ) ( not ( = ?auto_829231 ?auto_829235 ) ) ( not ( = ?auto_829231 ?auto_829236 ) ) ( not ( = ?auto_829232 ?auto_829233 ) ) ( not ( = ?auto_829232 ?auto_829234 ) ) ( not ( = ?auto_829232 ?auto_829235 ) ) ( not ( = ?auto_829232 ?auto_829236 ) ) ( not ( = ?auto_829233 ?auto_829234 ) ) ( not ( = ?auto_829233 ?auto_829235 ) ) ( not ( = ?auto_829233 ?auto_829236 ) ) ( not ( = ?auto_829234 ?auto_829235 ) ) ( not ( = ?auto_829234 ?auto_829236 ) ) ( not ( = ?auto_829235 ?auto_829236 ) ) ( ON ?auto_829234 ?auto_829235 ) ( ON ?auto_829233 ?auto_829234 ) ( ON ?auto_829232 ?auto_829233 ) ( ON ?auto_829231 ?auto_829232 ) ( ON ?auto_829230 ?auto_829231 ) ( ON ?auto_829229 ?auto_829230 ) ( ON ?auto_829228 ?auto_829229 ) ( CLEAR ?auto_829226 ) ( ON ?auto_829227 ?auto_829228 ) ( CLEAR ?auto_829227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_829226 ?auto_829227 )
      ( MAKE-10PILE ?auto_829226 ?auto_829227 ?auto_829228 ?auto_829229 ?auto_829230 ?auto_829231 ?auto_829232 ?auto_829233 ?auto_829234 ?auto_829235 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_829268 - BLOCK
      ?auto_829269 - BLOCK
      ?auto_829270 - BLOCK
      ?auto_829271 - BLOCK
      ?auto_829272 - BLOCK
      ?auto_829273 - BLOCK
      ?auto_829274 - BLOCK
      ?auto_829275 - BLOCK
      ?auto_829276 - BLOCK
      ?auto_829277 - BLOCK
    )
    :vars
    (
      ?auto_829278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_829277 ?auto_829278 ) ( not ( = ?auto_829268 ?auto_829269 ) ) ( not ( = ?auto_829268 ?auto_829270 ) ) ( not ( = ?auto_829268 ?auto_829271 ) ) ( not ( = ?auto_829268 ?auto_829272 ) ) ( not ( = ?auto_829268 ?auto_829273 ) ) ( not ( = ?auto_829268 ?auto_829274 ) ) ( not ( = ?auto_829268 ?auto_829275 ) ) ( not ( = ?auto_829268 ?auto_829276 ) ) ( not ( = ?auto_829268 ?auto_829277 ) ) ( not ( = ?auto_829268 ?auto_829278 ) ) ( not ( = ?auto_829269 ?auto_829270 ) ) ( not ( = ?auto_829269 ?auto_829271 ) ) ( not ( = ?auto_829269 ?auto_829272 ) ) ( not ( = ?auto_829269 ?auto_829273 ) ) ( not ( = ?auto_829269 ?auto_829274 ) ) ( not ( = ?auto_829269 ?auto_829275 ) ) ( not ( = ?auto_829269 ?auto_829276 ) ) ( not ( = ?auto_829269 ?auto_829277 ) ) ( not ( = ?auto_829269 ?auto_829278 ) ) ( not ( = ?auto_829270 ?auto_829271 ) ) ( not ( = ?auto_829270 ?auto_829272 ) ) ( not ( = ?auto_829270 ?auto_829273 ) ) ( not ( = ?auto_829270 ?auto_829274 ) ) ( not ( = ?auto_829270 ?auto_829275 ) ) ( not ( = ?auto_829270 ?auto_829276 ) ) ( not ( = ?auto_829270 ?auto_829277 ) ) ( not ( = ?auto_829270 ?auto_829278 ) ) ( not ( = ?auto_829271 ?auto_829272 ) ) ( not ( = ?auto_829271 ?auto_829273 ) ) ( not ( = ?auto_829271 ?auto_829274 ) ) ( not ( = ?auto_829271 ?auto_829275 ) ) ( not ( = ?auto_829271 ?auto_829276 ) ) ( not ( = ?auto_829271 ?auto_829277 ) ) ( not ( = ?auto_829271 ?auto_829278 ) ) ( not ( = ?auto_829272 ?auto_829273 ) ) ( not ( = ?auto_829272 ?auto_829274 ) ) ( not ( = ?auto_829272 ?auto_829275 ) ) ( not ( = ?auto_829272 ?auto_829276 ) ) ( not ( = ?auto_829272 ?auto_829277 ) ) ( not ( = ?auto_829272 ?auto_829278 ) ) ( not ( = ?auto_829273 ?auto_829274 ) ) ( not ( = ?auto_829273 ?auto_829275 ) ) ( not ( = ?auto_829273 ?auto_829276 ) ) ( not ( = ?auto_829273 ?auto_829277 ) ) ( not ( = ?auto_829273 ?auto_829278 ) ) ( not ( = ?auto_829274 ?auto_829275 ) ) ( not ( = ?auto_829274 ?auto_829276 ) ) ( not ( = ?auto_829274 ?auto_829277 ) ) ( not ( = ?auto_829274 ?auto_829278 ) ) ( not ( = ?auto_829275 ?auto_829276 ) ) ( not ( = ?auto_829275 ?auto_829277 ) ) ( not ( = ?auto_829275 ?auto_829278 ) ) ( not ( = ?auto_829276 ?auto_829277 ) ) ( not ( = ?auto_829276 ?auto_829278 ) ) ( not ( = ?auto_829277 ?auto_829278 ) ) ( ON ?auto_829276 ?auto_829277 ) ( ON ?auto_829275 ?auto_829276 ) ( ON ?auto_829274 ?auto_829275 ) ( ON ?auto_829273 ?auto_829274 ) ( ON ?auto_829272 ?auto_829273 ) ( ON ?auto_829271 ?auto_829272 ) ( ON ?auto_829270 ?auto_829271 ) ( ON ?auto_829269 ?auto_829270 ) ( ON ?auto_829268 ?auto_829269 ) ( CLEAR ?auto_829268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_829268 )
      ( MAKE-10PILE ?auto_829268 ?auto_829269 ?auto_829270 ?auto_829271 ?auto_829272 ?auto_829273 ?auto_829274 ?auto_829275 ?auto_829276 ?auto_829277 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_829311 - BLOCK
      ?auto_829312 - BLOCK
      ?auto_829313 - BLOCK
      ?auto_829314 - BLOCK
      ?auto_829315 - BLOCK
      ?auto_829316 - BLOCK
      ?auto_829317 - BLOCK
      ?auto_829318 - BLOCK
      ?auto_829319 - BLOCK
      ?auto_829320 - BLOCK
      ?auto_829321 - BLOCK
    )
    :vars
    (
      ?auto_829322 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_829320 ) ( ON ?auto_829321 ?auto_829322 ) ( CLEAR ?auto_829321 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_829311 ) ( ON ?auto_829312 ?auto_829311 ) ( ON ?auto_829313 ?auto_829312 ) ( ON ?auto_829314 ?auto_829313 ) ( ON ?auto_829315 ?auto_829314 ) ( ON ?auto_829316 ?auto_829315 ) ( ON ?auto_829317 ?auto_829316 ) ( ON ?auto_829318 ?auto_829317 ) ( ON ?auto_829319 ?auto_829318 ) ( ON ?auto_829320 ?auto_829319 ) ( not ( = ?auto_829311 ?auto_829312 ) ) ( not ( = ?auto_829311 ?auto_829313 ) ) ( not ( = ?auto_829311 ?auto_829314 ) ) ( not ( = ?auto_829311 ?auto_829315 ) ) ( not ( = ?auto_829311 ?auto_829316 ) ) ( not ( = ?auto_829311 ?auto_829317 ) ) ( not ( = ?auto_829311 ?auto_829318 ) ) ( not ( = ?auto_829311 ?auto_829319 ) ) ( not ( = ?auto_829311 ?auto_829320 ) ) ( not ( = ?auto_829311 ?auto_829321 ) ) ( not ( = ?auto_829311 ?auto_829322 ) ) ( not ( = ?auto_829312 ?auto_829313 ) ) ( not ( = ?auto_829312 ?auto_829314 ) ) ( not ( = ?auto_829312 ?auto_829315 ) ) ( not ( = ?auto_829312 ?auto_829316 ) ) ( not ( = ?auto_829312 ?auto_829317 ) ) ( not ( = ?auto_829312 ?auto_829318 ) ) ( not ( = ?auto_829312 ?auto_829319 ) ) ( not ( = ?auto_829312 ?auto_829320 ) ) ( not ( = ?auto_829312 ?auto_829321 ) ) ( not ( = ?auto_829312 ?auto_829322 ) ) ( not ( = ?auto_829313 ?auto_829314 ) ) ( not ( = ?auto_829313 ?auto_829315 ) ) ( not ( = ?auto_829313 ?auto_829316 ) ) ( not ( = ?auto_829313 ?auto_829317 ) ) ( not ( = ?auto_829313 ?auto_829318 ) ) ( not ( = ?auto_829313 ?auto_829319 ) ) ( not ( = ?auto_829313 ?auto_829320 ) ) ( not ( = ?auto_829313 ?auto_829321 ) ) ( not ( = ?auto_829313 ?auto_829322 ) ) ( not ( = ?auto_829314 ?auto_829315 ) ) ( not ( = ?auto_829314 ?auto_829316 ) ) ( not ( = ?auto_829314 ?auto_829317 ) ) ( not ( = ?auto_829314 ?auto_829318 ) ) ( not ( = ?auto_829314 ?auto_829319 ) ) ( not ( = ?auto_829314 ?auto_829320 ) ) ( not ( = ?auto_829314 ?auto_829321 ) ) ( not ( = ?auto_829314 ?auto_829322 ) ) ( not ( = ?auto_829315 ?auto_829316 ) ) ( not ( = ?auto_829315 ?auto_829317 ) ) ( not ( = ?auto_829315 ?auto_829318 ) ) ( not ( = ?auto_829315 ?auto_829319 ) ) ( not ( = ?auto_829315 ?auto_829320 ) ) ( not ( = ?auto_829315 ?auto_829321 ) ) ( not ( = ?auto_829315 ?auto_829322 ) ) ( not ( = ?auto_829316 ?auto_829317 ) ) ( not ( = ?auto_829316 ?auto_829318 ) ) ( not ( = ?auto_829316 ?auto_829319 ) ) ( not ( = ?auto_829316 ?auto_829320 ) ) ( not ( = ?auto_829316 ?auto_829321 ) ) ( not ( = ?auto_829316 ?auto_829322 ) ) ( not ( = ?auto_829317 ?auto_829318 ) ) ( not ( = ?auto_829317 ?auto_829319 ) ) ( not ( = ?auto_829317 ?auto_829320 ) ) ( not ( = ?auto_829317 ?auto_829321 ) ) ( not ( = ?auto_829317 ?auto_829322 ) ) ( not ( = ?auto_829318 ?auto_829319 ) ) ( not ( = ?auto_829318 ?auto_829320 ) ) ( not ( = ?auto_829318 ?auto_829321 ) ) ( not ( = ?auto_829318 ?auto_829322 ) ) ( not ( = ?auto_829319 ?auto_829320 ) ) ( not ( = ?auto_829319 ?auto_829321 ) ) ( not ( = ?auto_829319 ?auto_829322 ) ) ( not ( = ?auto_829320 ?auto_829321 ) ) ( not ( = ?auto_829320 ?auto_829322 ) ) ( not ( = ?auto_829321 ?auto_829322 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_829321 ?auto_829322 )
      ( !STACK ?auto_829321 ?auto_829320 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_829357 - BLOCK
      ?auto_829358 - BLOCK
      ?auto_829359 - BLOCK
      ?auto_829360 - BLOCK
      ?auto_829361 - BLOCK
      ?auto_829362 - BLOCK
      ?auto_829363 - BLOCK
      ?auto_829364 - BLOCK
      ?auto_829365 - BLOCK
      ?auto_829366 - BLOCK
      ?auto_829367 - BLOCK
    )
    :vars
    (
      ?auto_829368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_829367 ?auto_829368 ) ( ON-TABLE ?auto_829357 ) ( ON ?auto_829358 ?auto_829357 ) ( ON ?auto_829359 ?auto_829358 ) ( ON ?auto_829360 ?auto_829359 ) ( ON ?auto_829361 ?auto_829360 ) ( ON ?auto_829362 ?auto_829361 ) ( ON ?auto_829363 ?auto_829362 ) ( ON ?auto_829364 ?auto_829363 ) ( ON ?auto_829365 ?auto_829364 ) ( not ( = ?auto_829357 ?auto_829358 ) ) ( not ( = ?auto_829357 ?auto_829359 ) ) ( not ( = ?auto_829357 ?auto_829360 ) ) ( not ( = ?auto_829357 ?auto_829361 ) ) ( not ( = ?auto_829357 ?auto_829362 ) ) ( not ( = ?auto_829357 ?auto_829363 ) ) ( not ( = ?auto_829357 ?auto_829364 ) ) ( not ( = ?auto_829357 ?auto_829365 ) ) ( not ( = ?auto_829357 ?auto_829366 ) ) ( not ( = ?auto_829357 ?auto_829367 ) ) ( not ( = ?auto_829357 ?auto_829368 ) ) ( not ( = ?auto_829358 ?auto_829359 ) ) ( not ( = ?auto_829358 ?auto_829360 ) ) ( not ( = ?auto_829358 ?auto_829361 ) ) ( not ( = ?auto_829358 ?auto_829362 ) ) ( not ( = ?auto_829358 ?auto_829363 ) ) ( not ( = ?auto_829358 ?auto_829364 ) ) ( not ( = ?auto_829358 ?auto_829365 ) ) ( not ( = ?auto_829358 ?auto_829366 ) ) ( not ( = ?auto_829358 ?auto_829367 ) ) ( not ( = ?auto_829358 ?auto_829368 ) ) ( not ( = ?auto_829359 ?auto_829360 ) ) ( not ( = ?auto_829359 ?auto_829361 ) ) ( not ( = ?auto_829359 ?auto_829362 ) ) ( not ( = ?auto_829359 ?auto_829363 ) ) ( not ( = ?auto_829359 ?auto_829364 ) ) ( not ( = ?auto_829359 ?auto_829365 ) ) ( not ( = ?auto_829359 ?auto_829366 ) ) ( not ( = ?auto_829359 ?auto_829367 ) ) ( not ( = ?auto_829359 ?auto_829368 ) ) ( not ( = ?auto_829360 ?auto_829361 ) ) ( not ( = ?auto_829360 ?auto_829362 ) ) ( not ( = ?auto_829360 ?auto_829363 ) ) ( not ( = ?auto_829360 ?auto_829364 ) ) ( not ( = ?auto_829360 ?auto_829365 ) ) ( not ( = ?auto_829360 ?auto_829366 ) ) ( not ( = ?auto_829360 ?auto_829367 ) ) ( not ( = ?auto_829360 ?auto_829368 ) ) ( not ( = ?auto_829361 ?auto_829362 ) ) ( not ( = ?auto_829361 ?auto_829363 ) ) ( not ( = ?auto_829361 ?auto_829364 ) ) ( not ( = ?auto_829361 ?auto_829365 ) ) ( not ( = ?auto_829361 ?auto_829366 ) ) ( not ( = ?auto_829361 ?auto_829367 ) ) ( not ( = ?auto_829361 ?auto_829368 ) ) ( not ( = ?auto_829362 ?auto_829363 ) ) ( not ( = ?auto_829362 ?auto_829364 ) ) ( not ( = ?auto_829362 ?auto_829365 ) ) ( not ( = ?auto_829362 ?auto_829366 ) ) ( not ( = ?auto_829362 ?auto_829367 ) ) ( not ( = ?auto_829362 ?auto_829368 ) ) ( not ( = ?auto_829363 ?auto_829364 ) ) ( not ( = ?auto_829363 ?auto_829365 ) ) ( not ( = ?auto_829363 ?auto_829366 ) ) ( not ( = ?auto_829363 ?auto_829367 ) ) ( not ( = ?auto_829363 ?auto_829368 ) ) ( not ( = ?auto_829364 ?auto_829365 ) ) ( not ( = ?auto_829364 ?auto_829366 ) ) ( not ( = ?auto_829364 ?auto_829367 ) ) ( not ( = ?auto_829364 ?auto_829368 ) ) ( not ( = ?auto_829365 ?auto_829366 ) ) ( not ( = ?auto_829365 ?auto_829367 ) ) ( not ( = ?auto_829365 ?auto_829368 ) ) ( not ( = ?auto_829366 ?auto_829367 ) ) ( not ( = ?auto_829366 ?auto_829368 ) ) ( not ( = ?auto_829367 ?auto_829368 ) ) ( CLEAR ?auto_829365 ) ( ON ?auto_829366 ?auto_829367 ) ( CLEAR ?auto_829366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_829357 ?auto_829358 ?auto_829359 ?auto_829360 ?auto_829361 ?auto_829362 ?auto_829363 ?auto_829364 ?auto_829365 ?auto_829366 )
      ( MAKE-11PILE ?auto_829357 ?auto_829358 ?auto_829359 ?auto_829360 ?auto_829361 ?auto_829362 ?auto_829363 ?auto_829364 ?auto_829365 ?auto_829366 ?auto_829367 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_829403 - BLOCK
      ?auto_829404 - BLOCK
      ?auto_829405 - BLOCK
      ?auto_829406 - BLOCK
      ?auto_829407 - BLOCK
      ?auto_829408 - BLOCK
      ?auto_829409 - BLOCK
      ?auto_829410 - BLOCK
      ?auto_829411 - BLOCK
      ?auto_829412 - BLOCK
      ?auto_829413 - BLOCK
    )
    :vars
    (
      ?auto_829414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_829413 ?auto_829414 ) ( ON-TABLE ?auto_829403 ) ( ON ?auto_829404 ?auto_829403 ) ( ON ?auto_829405 ?auto_829404 ) ( ON ?auto_829406 ?auto_829405 ) ( ON ?auto_829407 ?auto_829406 ) ( ON ?auto_829408 ?auto_829407 ) ( ON ?auto_829409 ?auto_829408 ) ( ON ?auto_829410 ?auto_829409 ) ( not ( = ?auto_829403 ?auto_829404 ) ) ( not ( = ?auto_829403 ?auto_829405 ) ) ( not ( = ?auto_829403 ?auto_829406 ) ) ( not ( = ?auto_829403 ?auto_829407 ) ) ( not ( = ?auto_829403 ?auto_829408 ) ) ( not ( = ?auto_829403 ?auto_829409 ) ) ( not ( = ?auto_829403 ?auto_829410 ) ) ( not ( = ?auto_829403 ?auto_829411 ) ) ( not ( = ?auto_829403 ?auto_829412 ) ) ( not ( = ?auto_829403 ?auto_829413 ) ) ( not ( = ?auto_829403 ?auto_829414 ) ) ( not ( = ?auto_829404 ?auto_829405 ) ) ( not ( = ?auto_829404 ?auto_829406 ) ) ( not ( = ?auto_829404 ?auto_829407 ) ) ( not ( = ?auto_829404 ?auto_829408 ) ) ( not ( = ?auto_829404 ?auto_829409 ) ) ( not ( = ?auto_829404 ?auto_829410 ) ) ( not ( = ?auto_829404 ?auto_829411 ) ) ( not ( = ?auto_829404 ?auto_829412 ) ) ( not ( = ?auto_829404 ?auto_829413 ) ) ( not ( = ?auto_829404 ?auto_829414 ) ) ( not ( = ?auto_829405 ?auto_829406 ) ) ( not ( = ?auto_829405 ?auto_829407 ) ) ( not ( = ?auto_829405 ?auto_829408 ) ) ( not ( = ?auto_829405 ?auto_829409 ) ) ( not ( = ?auto_829405 ?auto_829410 ) ) ( not ( = ?auto_829405 ?auto_829411 ) ) ( not ( = ?auto_829405 ?auto_829412 ) ) ( not ( = ?auto_829405 ?auto_829413 ) ) ( not ( = ?auto_829405 ?auto_829414 ) ) ( not ( = ?auto_829406 ?auto_829407 ) ) ( not ( = ?auto_829406 ?auto_829408 ) ) ( not ( = ?auto_829406 ?auto_829409 ) ) ( not ( = ?auto_829406 ?auto_829410 ) ) ( not ( = ?auto_829406 ?auto_829411 ) ) ( not ( = ?auto_829406 ?auto_829412 ) ) ( not ( = ?auto_829406 ?auto_829413 ) ) ( not ( = ?auto_829406 ?auto_829414 ) ) ( not ( = ?auto_829407 ?auto_829408 ) ) ( not ( = ?auto_829407 ?auto_829409 ) ) ( not ( = ?auto_829407 ?auto_829410 ) ) ( not ( = ?auto_829407 ?auto_829411 ) ) ( not ( = ?auto_829407 ?auto_829412 ) ) ( not ( = ?auto_829407 ?auto_829413 ) ) ( not ( = ?auto_829407 ?auto_829414 ) ) ( not ( = ?auto_829408 ?auto_829409 ) ) ( not ( = ?auto_829408 ?auto_829410 ) ) ( not ( = ?auto_829408 ?auto_829411 ) ) ( not ( = ?auto_829408 ?auto_829412 ) ) ( not ( = ?auto_829408 ?auto_829413 ) ) ( not ( = ?auto_829408 ?auto_829414 ) ) ( not ( = ?auto_829409 ?auto_829410 ) ) ( not ( = ?auto_829409 ?auto_829411 ) ) ( not ( = ?auto_829409 ?auto_829412 ) ) ( not ( = ?auto_829409 ?auto_829413 ) ) ( not ( = ?auto_829409 ?auto_829414 ) ) ( not ( = ?auto_829410 ?auto_829411 ) ) ( not ( = ?auto_829410 ?auto_829412 ) ) ( not ( = ?auto_829410 ?auto_829413 ) ) ( not ( = ?auto_829410 ?auto_829414 ) ) ( not ( = ?auto_829411 ?auto_829412 ) ) ( not ( = ?auto_829411 ?auto_829413 ) ) ( not ( = ?auto_829411 ?auto_829414 ) ) ( not ( = ?auto_829412 ?auto_829413 ) ) ( not ( = ?auto_829412 ?auto_829414 ) ) ( not ( = ?auto_829413 ?auto_829414 ) ) ( ON ?auto_829412 ?auto_829413 ) ( CLEAR ?auto_829410 ) ( ON ?auto_829411 ?auto_829412 ) ( CLEAR ?auto_829411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_829403 ?auto_829404 ?auto_829405 ?auto_829406 ?auto_829407 ?auto_829408 ?auto_829409 ?auto_829410 ?auto_829411 )
      ( MAKE-11PILE ?auto_829403 ?auto_829404 ?auto_829405 ?auto_829406 ?auto_829407 ?auto_829408 ?auto_829409 ?auto_829410 ?auto_829411 ?auto_829412 ?auto_829413 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_829449 - BLOCK
      ?auto_829450 - BLOCK
      ?auto_829451 - BLOCK
      ?auto_829452 - BLOCK
      ?auto_829453 - BLOCK
      ?auto_829454 - BLOCK
      ?auto_829455 - BLOCK
      ?auto_829456 - BLOCK
      ?auto_829457 - BLOCK
      ?auto_829458 - BLOCK
      ?auto_829459 - BLOCK
    )
    :vars
    (
      ?auto_829460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_829459 ?auto_829460 ) ( ON-TABLE ?auto_829449 ) ( ON ?auto_829450 ?auto_829449 ) ( ON ?auto_829451 ?auto_829450 ) ( ON ?auto_829452 ?auto_829451 ) ( ON ?auto_829453 ?auto_829452 ) ( ON ?auto_829454 ?auto_829453 ) ( ON ?auto_829455 ?auto_829454 ) ( not ( = ?auto_829449 ?auto_829450 ) ) ( not ( = ?auto_829449 ?auto_829451 ) ) ( not ( = ?auto_829449 ?auto_829452 ) ) ( not ( = ?auto_829449 ?auto_829453 ) ) ( not ( = ?auto_829449 ?auto_829454 ) ) ( not ( = ?auto_829449 ?auto_829455 ) ) ( not ( = ?auto_829449 ?auto_829456 ) ) ( not ( = ?auto_829449 ?auto_829457 ) ) ( not ( = ?auto_829449 ?auto_829458 ) ) ( not ( = ?auto_829449 ?auto_829459 ) ) ( not ( = ?auto_829449 ?auto_829460 ) ) ( not ( = ?auto_829450 ?auto_829451 ) ) ( not ( = ?auto_829450 ?auto_829452 ) ) ( not ( = ?auto_829450 ?auto_829453 ) ) ( not ( = ?auto_829450 ?auto_829454 ) ) ( not ( = ?auto_829450 ?auto_829455 ) ) ( not ( = ?auto_829450 ?auto_829456 ) ) ( not ( = ?auto_829450 ?auto_829457 ) ) ( not ( = ?auto_829450 ?auto_829458 ) ) ( not ( = ?auto_829450 ?auto_829459 ) ) ( not ( = ?auto_829450 ?auto_829460 ) ) ( not ( = ?auto_829451 ?auto_829452 ) ) ( not ( = ?auto_829451 ?auto_829453 ) ) ( not ( = ?auto_829451 ?auto_829454 ) ) ( not ( = ?auto_829451 ?auto_829455 ) ) ( not ( = ?auto_829451 ?auto_829456 ) ) ( not ( = ?auto_829451 ?auto_829457 ) ) ( not ( = ?auto_829451 ?auto_829458 ) ) ( not ( = ?auto_829451 ?auto_829459 ) ) ( not ( = ?auto_829451 ?auto_829460 ) ) ( not ( = ?auto_829452 ?auto_829453 ) ) ( not ( = ?auto_829452 ?auto_829454 ) ) ( not ( = ?auto_829452 ?auto_829455 ) ) ( not ( = ?auto_829452 ?auto_829456 ) ) ( not ( = ?auto_829452 ?auto_829457 ) ) ( not ( = ?auto_829452 ?auto_829458 ) ) ( not ( = ?auto_829452 ?auto_829459 ) ) ( not ( = ?auto_829452 ?auto_829460 ) ) ( not ( = ?auto_829453 ?auto_829454 ) ) ( not ( = ?auto_829453 ?auto_829455 ) ) ( not ( = ?auto_829453 ?auto_829456 ) ) ( not ( = ?auto_829453 ?auto_829457 ) ) ( not ( = ?auto_829453 ?auto_829458 ) ) ( not ( = ?auto_829453 ?auto_829459 ) ) ( not ( = ?auto_829453 ?auto_829460 ) ) ( not ( = ?auto_829454 ?auto_829455 ) ) ( not ( = ?auto_829454 ?auto_829456 ) ) ( not ( = ?auto_829454 ?auto_829457 ) ) ( not ( = ?auto_829454 ?auto_829458 ) ) ( not ( = ?auto_829454 ?auto_829459 ) ) ( not ( = ?auto_829454 ?auto_829460 ) ) ( not ( = ?auto_829455 ?auto_829456 ) ) ( not ( = ?auto_829455 ?auto_829457 ) ) ( not ( = ?auto_829455 ?auto_829458 ) ) ( not ( = ?auto_829455 ?auto_829459 ) ) ( not ( = ?auto_829455 ?auto_829460 ) ) ( not ( = ?auto_829456 ?auto_829457 ) ) ( not ( = ?auto_829456 ?auto_829458 ) ) ( not ( = ?auto_829456 ?auto_829459 ) ) ( not ( = ?auto_829456 ?auto_829460 ) ) ( not ( = ?auto_829457 ?auto_829458 ) ) ( not ( = ?auto_829457 ?auto_829459 ) ) ( not ( = ?auto_829457 ?auto_829460 ) ) ( not ( = ?auto_829458 ?auto_829459 ) ) ( not ( = ?auto_829458 ?auto_829460 ) ) ( not ( = ?auto_829459 ?auto_829460 ) ) ( ON ?auto_829458 ?auto_829459 ) ( ON ?auto_829457 ?auto_829458 ) ( CLEAR ?auto_829455 ) ( ON ?auto_829456 ?auto_829457 ) ( CLEAR ?auto_829456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_829449 ?auto_829450 ?auto_829451 ?auto_829452 ?auto_829453 ?auto_829454 ?auto_829455 ?auto_829456 )
      ( MAKE-11PILE ?auto_829449 ?auto_829450 ?auto_829451 ?auto_829452 ?auto_829453 ?auto_829454 ?auto_829455 ?auto_829456 ?auto_829457 ?auto_829458 ?auto_829459 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_829495 - BLOCK
      ?auto_829496 - BLOCK
      ?auto_829497 - BLOCK
      ?auto_829498 - BLOCK
      ?auto_829499 - BLOCK
      ?auto_829500 - BLOCK
      ?auto_829501 - BLOCK
      ?auto_829502 - BLOCK
      ?auto_829503 - BLOCK
      ?auto_829504 - BLOCK
      ?auto_829505 - BLOCK
    )
    :vars
    (
      ?auto_829506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_829505 ?auto_829506 ) ( ON-TABLE ?auto_829495 ) ( ON ?auto_829496 ?auto_829495 ) ( ON ?auto_829497 ?auto_829496 ) ( ON ?auto_829498 ?auto_829497 ) ( ON ?auto_829499 ?auto_829498 ) ( ON ?auto_829500 ?auto_829499 ) ( not ( = ?auto_829495 ?auto_829496 ) ) ( not ( = ?auto_829495 ?auto_829497 ) ) ( not ( = ?auto_829495 ?auto_829498 ) ) ( not ( = ?auto_829495 ?auto_829499 ) ) ( not ( = ?auto_829495 ?auto_829500 ) ) ( not ( = ?auto_829495 ?auto_829501 ) ) ( not ( = ?auto_829495 ?auto_829502 ) ) ( not ( = ?auto_829495 ?auto_829503 ) ) ( not ( = ?auto_829495 ?auto_829504 ) ) ( not ( = ?auto_829495 ?auto_829505 ) ) ( not ( = ?auto_829495 ?auto_829506 ) ) ( not ( = ?auto_829496 ?auto_829497 ) ) ( not ( = ?auto_829496 ?auto_829498 ) ) ( not ( = ?auto_829496 ?auto_829499 ) ) ( not ( = ?auto_829496 ?auto_829500 ) ) ( not ( = ?auto_829496 ?auto_829501 ) ) ( not ( = ?auto_829496 ?auto_829502 ) ) ( not ( = ?auto_829496 ?auto_829503 ) ) ( not ( = ?auto_829496 ?auto_829504 ) ) ( not ( = ?auto_829496 ?auto_829505 ) ) ( not ( = ?auto_829496 ?auto_829506 ) ) ( not ( = ?auto_829497 ?auto_829498 ) ) ( not ( = ?auto_829497 ?auto_829499 ) ) ( not ( = ?auto_829497 ?auto_829500 ) ) ( not ( = ?auto_829497 ?auto_829501 ) ) ( not ( = ?auto_829497 ?auto_829502 ) ) ( not ( = ?auto_829497 ?auto_829503 ) ) ( not ( = ?auto_829497 ?auto_829504 ) ) ( not ( = ?auto_829497 ?auto_829505 ) ) ( not ( = ?auto_829497 ?auto_829506 ) ) ( not ( = ?auto_829498 ?auto_829499 ) ) ( not ( = ?auto_829498 ?auto_829500 ) ) ( not ( = ?auto_829498 ?auto_829501 ) ) ( not ( = ?auto_829498 ?auto_829502 ) ) ( not ( = ?auto_829498 ?auto_829503 ) ) ( not ( = ?auto_829498 ?auto_829504 ) ) ( not ( = ?auto_829498 ?auto_829505 ) ) ( not ( = ?auto_829498 ?auto_829506 ) ) ( not ( = ?auto_829499 ?auto_829500 ) ) ( not ( = ?auto_829499 ?auto_829501 ) ) ( not ( = ?auto_829499 ?auto_829502 ) ) ( not ( = ?auto_829499 ?auto_829503 ) ) ( not ( = ?auto_829499 ?auto_829504 ) ) ( not ( = ?auto_829499 ?auto_829505 ) ) ( not ( = ?auto_829499 ?auto_829506 ) ) ( not ( = ?auto_829500 ?auto_829501 ) ) ( not ( = ?auto_829500 ?auto_829502 ) ) ( not ( = ?auto_829500 ?auto_829503 ) ) ( not ( = ?auto_829500 ?auto_829504 ) ) ( not ( = ?auto_829500 ?auto_829505 ) ) ( not ( = ?auto_829500 ?auto_829506 ) ) ( not ( = ?auto_829501 ?auto_829502 ) ) ( not ( = ?auto_829501 ?auto_829503 ) ) ( not ( = ?auto_829501 ?auto_829504 ) ) ( not ( = ?auto_829501 ?auto_829505 ) ) ( not ( = ?auto_829501 ?auto_829506 ) ) ( not ( = ?auto_829502 ?auto_829503 ) ) ( not ( = ?auto_829502 ?auto_829504 ) ) ( not ( = ?auto_829502 ?auto_829505 ) ) ( not ( = ?auto_829502 ?auto_829506 ) ) ( not ( = ?auto_829503 ?auto_829504 ) ) ( not ( = ?auto_829503 ?auto_829505 ) ) ( not ( = ?auto_829503 ?auto_829506 ) ) ( not ( = ?auto_829504 ?auto_829505 ) ) ( not ( = ?auto_829504 ?auto_829506 ) ) ( not ( = ?auto_829505 ?auto_829506 ) ) ( ON ?auto_829504 ?auto_829505 ) ( ON ?auto_829503 ?auto_829504 ) ( ON ?auto_829502 ?auto_829503 ) ( CLEAR ?auto_829500 ) ( ON ?auto_829501 ?auto_829502 ) ( CLEAR ?auto_829501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_829495 ?auto_829496 ?auto_829497 ?auto_829498 ?auto_829499 ?auto_829500 ?auto_829501 )
      ( MAKE-11PILE ?auto_829495 ?auto_829496 ?auto_829497 ?auto_829498 ?auto_829499 ?auto_829500 ?auto_829501 ?auto_829502 ?auto_829503 ?auto_829504 ?auto_829505 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_829541 - BLOCK
      ?auto_829542 - BLOCK
      ?auto_829543 - BLOCK
      ?auto_829544 - BLOCK
      ?auto_829545 - BLOCK
      ?auto_829546 - BLOCK
      ?auto_829547 - BLOCK
      ?auto_829548 - BLOCK
      ?auto_829549 - BLOCK
      ?auto_829550 - BLOCK
      ?auto_829551 - BLOCK
    )
    :vars
    (
      ?auto_829552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_829551 ?auto_829552 ) ( ON-TABLE ?auto_829541 ) ( ON ?auto_829542 ?auto_829541 ) ( ON ?auto_829543 ?auto_829542 ) ( ON ?auto_829544 ?auto_829543 ) ( ON ?auto_829545 ?auto_829544 ) ( not ( = ?auto_829541 ?auto_829542 ) ) ( not ( = ?auto_829541 ?auto_829543 ) ) ( not ( = ?auto_829541 ?auto_829544 ) ) ( not ( = ?auto_829541 ?auto_829545 ) ) ( not ( = ?auto_829541 ?auto_829546 ) ) ( not ( = ?auto_829541 ?auto_829547 ) ) ( not ( = ?auto_829541 ?auto_829548 ) ) ( not ( = ?auto_829541 ?auto_829549 ) ) ( not ( = ?auto_829541 ?auto_829550 ) ) ( not ( = ?auto_829541 ?auto_829551 ) ) ( not ( = ?auto_829541 ?auto_829552 ) ) ( not ( = ?auto_829542 ?auto_829543 ) ) ( not ( = ?auto_829542 ?auto_829544 ) ) ( not ( = ?auto_829542 ?auto_829545 ) ) ( not ( = ?auto_829542 ?auto_829546 ) ) ( not ( = ?auto_829542 ?auto_829547 ) ) ( not ( = ?auto_829542 ?auto_829548 ) ) ( not ( = ?auto_829542 ?auto_829549 ) ) ( not ( = ?auto_829542 ?auto_829550 ) ) ( not ( = ?auto_829542 ?auto_829551 ) ) ( not ( = ?auto_829542 ?auto_829552 ) ) ( not ( = ?auto_829543 ?auto_829544 ) ) ( not ( = ?auto_829543 ?auto_829545 ) ) ( not ( = ?auto_829543 ?auto_829546 ) ) ( not ( = ?auto_829543 ?auto_829547 ) ) ( not ( = ?auto_829543 ?auto_829548 ) ) ( not ( = ?auto_829543 ?auto_829549 ) ) ( not ( = ?auto_829543 ?auto_829550 ) ) ( not ( = ?auto_829543 ?auto_829551 ) ) ( not ( = ?auto_829543 ?auto_829552 ) ) ( not ( = ?auto_829544 ?auto_829545 ) ) ( not ( = ?auto_829544 ?auto_829546 ) ) ( not ( = ?auto_829544 ?auto_829547 ) ) ( not ( = ?auto_829544 ?auto_829548 ) ) ( not ( = ?auto_829544 ?auto_829549 ) ) ( not ( = ?auto_829544 ?auto_829550 ) ) ( not ( = ?auto_829544 ?auto_829551 ) ) ( not ( = ?auto_829544 ?auto_829552 ) ) ( not ( = ?auto_829545 ?auto_829546 ) ) ( not ( = ?auto_829545 ?auto_829547 ) ) ( not ( = ?auto_829545 ?auto_829548 ) ) ( not ( = ?auto_829545 ?auto_829549 ) ) ( not ( = ?auto_829545 ?auto_829550 ) ) ( not ( = ?auto_829545 ?auto_829551 ) ) ( not ( = ?auto_829545 ?auto_829552 ) ) ( not ( = ?auto_829546 ?auto_829547 ) ) ( not ( = ?auto_829546 ?auto_829548 ) ) ( not ( = ?auto_829546 ?auto_829549 ) ) ( not ( = ?auto_829546 ?auto_829550 ) ) ( not ( = ?auto_829546 ?auto_829551 ) ) ( not ( = ?auto_829546 ?auto_829552 ) ) ( not ( = ?auto_829547 ?auto_829548 ) ) ( not ( = ?auto_829547 ?auto_829549 ) ) ( not ( = ?auto_829547 ?auto_829550 ) ) ( not ( = ?auto_829547 ?auto_829551 ) ) ( not ( = ?auto_829547 ?auto_829552 ) ) ( not ( = ?auto_829548 ?auto_829549 ) ) ( not ( = ?auto_829548 ?auto_829550 ) ) ( not ( = ?auto_829548 ?auto_829551 ) ) ( not ( = ?auto_829548 ?auto_829552 ) ) ( not ( = ?auto_829549 ?auto_829550 ) ) ( not ( = ?auto_829549 ?auto_829551 ) ) ( not ( = ?auto_829549 ?auto_829552 ) ) ( not ( = ?auto_829550 ?auto_829551 ) ) ( not ( = ?auto_829550 ?auto_829552 ) ) ( not ( = ?auto_829551 ?auto_829552 ) ) ( ON ?auto_829550 ?auto_829551 ) ( ON ?auto_829549 ?auto_829550 ) ( ON ?auto_829548 ?auto_829549 ) ( ON ?auto_829547 ?auto_829548 ) ( CLEAR ?auto_829545 ) ( ON ?auto_829546 ?auto_829547 ) ( CLEAR ?auto_829546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_829541 ?auto_829542 ?auto_829543 ?auto_829544 ?auto_829545 ?auto_829546 )
      ( MAKE-11PILE ?auto_829541 ?auto_829542 ?auto_829543 ?auto_829544 ?auto_829545 ?auto_829546 ?auto_829547 ?auto_829548 ?auto_829549 ?auto_829550 ?auto_829551 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_829587 - BLOCK
      ?auto_829588 - BLOCK
      ?auto_829589 - BLOCK
      ?auto_829590 - BLOCK
      ?auto_829591 - BLOCK
      ?auto_829592 - BLOCK
      ?auto_829593 - BLOCK
      ?auto_829594 - BLOCK
      ?auto_829595 - BLOCK
      ?auto_829596 - BLOCK
      ?auto_829597 - BLOCK
    )
    :vars
    (
      ?auto_829598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_829597 ?auto_829598 ) ( ON-TABLE ?auto_829587 ) ( ON ?auto_829588 ?auto_829587 ) ( ON ?auto_829589 ?auto_829588 ) ( ON ?auto_829590 ?auto_829589 ) ( not ( = ?auto_829587 ?auto_829588 ) ) ( not ( = ?auto_829587 ?auto_829589 ) ) ( not ( = ?auto_829587 ?auto_829590 ) ) ( not ( = ?auto_829587 ?auto_829591 ) ) ( not ( = ?auto_829587 ?auto_829592 ) ) ( not ( = ?auto_829587 ?auto_829593 ) ) ( not ( = ?auto_829587 ?auto_829594 ) ) ( not ( = ?auto_829587 ?auto_829595 ) ) ( not ( = ?auto_829587 ?auto_829596 ) ) ( not ( = ?auto_829587 ?auto_829597 ) ) ( not ( = ?auto_829587 ?auto_829598 ) ) ( not ( = ?auto_829588 ?auto_829589 ) ) ( not ( = ?auto_829588 ?auto_829590 ) ) ( not ( = ?auto_829588 ?auto_829591 ) ) ( not ( = ?auto_829588 ?auto_829592 ) ) ( not ( = ?auto_829588 ?auto_829593 ) ) ( not ( = ?auto_829588 ?auto_829594 ) ) ( not ( = ?auto_829588 ?auto_829595 ) ) ( not ( = ?auto_829588 ?auto_829596 ) ) ( not ( = ?auto_829588 ?auto_829597 ) ) ( not ( = ?auto_829588 ?auto_829598 ) ) ( not ( = ?auto_829589 ?auto_829590 ) ) ( not ( = ?auto_829589 ?auto_829591 ) ) ( not ( = ?auto_829589 ?auto_829592 ) ) ( not ( = ?auto_829589 ?auto_829593 ) ) ( not ( = ?auto_829589 ?auto_829594 ) ) ( not ( = ?auto_829589 ?auto_829595 ) ) ( not ( = ?auto_829589 ?auto_829596 ) ) ( not ( = ?auto_829589 ?auto_829597 ) ) ( not ( = ?auto_829589 ?auto_829598 ) ) ( not ( = ?auto_829590 ?auto_829591 ) ) ( not ( = ?auto_829590 ?auto_829592 ) ) ( not ( = ?auto_829590 ?auto_829593 ) ) ( not ( = ?auto_829590 ?auto_829594 ) ) ( not ( = ?auto_829590 ?auto_829595 ) ) ( not ( = ?auto_829590 ?auto_829596 ) ) ( not ( = ?auto_829590 ?auto_829597 ) ) ( not ( = ?auto_829590 ?auto_829598 ) ) ( not ( = ?auto_829591 ?auto_829592 ) ) ( not ( = ?auto_829591 ?auto_829593 ) ) ( not ( = ?auto_829591 ?auto_829594 ) ) ( not ( = ?auto_829591 ?auto_829595 ) ) ( not ( = ?auto_829591 ?auto_829596 ) ) ( not ( = ?auto_829591 ?auto_829597 ) ) ( not ( = ?auto_829591 ?auto_829598 ) ) ( not ( = ?auto_829592 ?auto_829593 ) ) ( not ( = ?auto_829592 ?auto_829594 ) ) ( not ( = ?auto_829592 ?auto_829595 ) ) ( not ( = ?auto_829592 ?auto_829596 ) ) ( not ( = ?auto_829592 ?auto_829597 ) ) ( not ( = ?auto_829592 ?auto_829598 ) ) ( not ( = ?auto_829593 ?auto_829594 ) ) ( not ( = ?auto_829593 ?auto_829595 ) ) ( not ( = ?auto_829593 ?auto_829596 ) ) ( not ( = ?auto_829593 ?auto_829597 ) ) ( not ( = ?auto_829593 ?auto_829598 ) ) ( not ( = ?auto_829594 ?auto_829595 ) ) ( not ( = ?auto_829594 ?auto_829596 ) ) ( not ( = ?auto_829594 ?auto_829597 ) ) ( not ( = ?auto_829594 ?auto_829598 ) ) ( not ( = ?auto_829595 ?auto_829596 ) ) ( not ( = ?auto_829595 ?auto_829597 ) ) ( not ( = ?auto_829595 ?auto_829598 ) ) ( not ( = ?auto_829596 ?auto_829597 ) ) ( not ( = ?auto_829596 ?auto_829598 ) ) ( not ( = ?auto_829597 ?auto_829598 ) ) ( ON ?auto_829596 ?auto_829597 ) ( ON ?auto_829595 ?auto_829596 ) ( ON ?auto_829594 ?auto_829595 ) ( ON ?auto_829593 ?auto_829594 ) ( ON ?auto_829592 ?auto_829593 ) ( CLEAR ?auto_829590 ) ( ON ?auto_829591 ?auto_829592 ) ( CLEAR ?auto_829591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_829587 ?auto_829588 ?auto_829589 ?auto_829590 ?auto_829591 )
      ( MAKE-11PILE ?auto_829587 ?auto_829588 ?auto_829589 ?auto_829590 ?auto_829591 ?auto_829592 ?auto_829593 ?auto_829594 ?auto_829595 ?auto_829596 ?auto_829597 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_829633 - BLOCK
      ?auto_829634 - BLOCK
      ?auto_829635 - BLOCK
      ?auto_829636 - BLOCK
      ?auto_829637 - BLOCK
      ?auto_829638 - BLOCK
      ?auto_829639 - BLOCK
      ?auto_829640 - BLOCK
      ?auto_829641 - BLOCK
      ?auto_829642 - BLOCK
      ?auto_829643 - BLOCK
    )
    :vars
    (
      ?auto_829644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_829643 ?auto_829644 ) ( ON-TABLE ?auto_829633 ) ( ON ?auto_829634 ?auto_829633 ) ( ON ?auto_829635 ?auto_829634 ) ( not ( = ?auto_829633 ?auto_829634 ) ) ( not ( = ?auto_829633 ?auto_829635 ) ) ( not ( = ?auto_829633 ?auto_829636 ) ) ( not ( = ?auto_829633 ?auto_829637 ) ) ( not ( = ?auto_829633 ?auto_829638 ) ) ( not ( = ?auto_829633 ?auto_829639 ) ) ( not ( = ?auto_829633 ?auto_829640 ) ) ( not ( = ?auto_829633 ?auto_829641 ) ) ( not ( = ?auto_829633 ?auto_829642 ) ) ( not ( = ?auto_829633 ?auto_829643 ) ) ( not ( = ?auto_829633 ?auto_829644 ) ) ( not ( = ?auto_829634 ?auto_829635 ) ) ( not ( = ?auto_829634 ?auto_829636 ) ) ( not ( = ?auto_829634 ?auto_829637 ) ) ( not ( = ?auto_829634 ?auto_829638 ) ) ( not ( = ?auto_829634 ?auto_829639 ) ) ( not ( = ?auto_829634 ?auto_829640 ) ) ( not ( = ?auto_829634 ?auto_829641 ) ) ( not ( = ?auto_829634 ?auto_829642 ) ) ( not ( = ?auto_829634 ?auto_829643 ) ) ( not ( = ?auto_829634 ?auto_829644 ) ) ( not ( = ?auto_829635 ?auto_829636 ) ) ( not ( = ?auto_829635 ?auto_829637 ) ) ( not ( = ?auto_829635 ?auto_829638 ) ) ( not ( = ?auto_829635 ?auto_829639 ) ) ( not ( = ?auto_829635 ?auto_829640 ) ) ( not ( = ?auto_829635 ?auto_829641 ) ) ( not ( = ?auto_829635 ?auto_829642 ) ) ( not ( = ?auto_829635 ?auto_829643 ) ) ( not ( = ?auto_829635 ?auto_829644 ) ) ( not ( = ?auto_829636 ?auto_829637 ) ) ( not ( = ?auto_829636 ?auto_829638 ) ) ( not ( = ?auto_829636 ?auto_829639 ) ) ( not ( = ?auto_829636 ?auto_829640 ) ) ( not ( = ?auto_829636 ?auto_829641 ) ) ( not ( = ?auto_829636 ?auto_829642 ) ) ( not ( = ?auto_829636 ?auto_829643 ) ) ( not ( = ?auto_829636 ?auto_829644 ) ) ( not ( = ?auto_829637 ?auto_829638 ) ) ( not ( = ?auto_829637 ?auto_829639 ) ) ( not ( = ?auto_829637 ?auto_829640 ) ) ( not ( = ?auto_829637 ?auto_829641 ) ) ( not ( = ?auto_829637 ?auto_829642 ) ) ( not ( = ?auto_829637 ?auto_829643 ) ) ( not ( = ?auto_829637 ?auto_829644 ) ) ( not ( = ?auto_829638 ?auto_829639 ) ) ( not ( = ?auto_829638 ?auto_829640 ) ) ( not ( = ?auto_829638 ?auto_829641 ) ) ( not ( = ?auto_829638 ?auto_829642 ) ) ( not ( = ?auto_829638 ?auto_829643 ) ) ( not ( = ?auto_829638 ?auto_829644 ) ) ( not ( = ?auto_829639 ?auto_829640 ) ) ( not ( = ?auto_829639 ?auto_829641 ) ) ( not ( = ?auto_829639 ?auto_829642 ) ) ( not ( = ?auto_829639 ?auto_829643 ) ) ( not ( = ?auto_829639 ?auto_829644 ) ) ( not ( = ?auto_829640 ?auto_829641 ) ) ( not ( = ?auto_829640 ?auto_829642 ) ) ( not ( = ?auto_829640 ?auto_829643 ) ) ( not ( = ?auto_829640 ?auto_829644 ) ) ( not ( = ?auto_829641 ?auto_829642 ) ) ( not ( = ?auto_829641 ?auto_829643 ) ) ( not ( = ?auto_829641 ?auto_829644 ) ) ( not ( = ?auto_829642 ?auto_829643 ) ) ( not ( = ?auto_829642 ?auto_829644 ) ) ( not ( = ?auto_829643 ?auto_829644 ) ) ( ON ?auto_829642 ?auto_829643 ) ( ON ?auto_829641 ?auto_829642 ) ( ON ?auto_829640 ?auto_829641 ) ( ON ?auto_829639 ?auto_829640 ) ( ON ?auto_829638 ?auto_829639 ) ( ON ?auto_829637 ?auto_829638 ) ( CLEAR ?auto_829635 ) ( ON ?auto_829636 ?auto_829637 ) ( CLEAR ?auto_829636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_829633 ?auto_829634 ?auto_829635 ?auto_829636 )
      ( MAKE-11PILE ?auto_829633 ?auto_829634 ?auto_829635 ?auto_829636 ?auto_829637 ?auto_829638 ?auto_829639 ?auto_829640 ?auto_829641 ?auto_829642 ?auto_829643 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_829679 - BLOCK
      ?auto_829680 - BLOCK
      ?auto_829681 - BLOCK
      ?auto_829682 - BLOCK
      ?auto_829683 - BLOCK
      ?auto_829684 - BLOCK
      ?auto_829685 - BLOCK
      ?auto_829686 - BLOCK
      ?auto_829687 - BLOCK
      ?auto_829688 - BLOCK
      ?auto_829689 - BLOCK
    )
    :vars
    (
      ?auto_829690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_829689 ?auto_829690 ) ( ON-TABLE ?auto_829679 ) ( ON ?auto_829680 ?auto_829679 ) ( not ( = ?auto_829679 ?auto_829680 ) ) ( not ( = ?auto_829679 ?auto_829681 ) ) ( not ( = ?auto_829679 ?auto_829682 ) ) ( not ( = ?auto_829679 ?auto_829683 ) ) ( not ( = ?auto_829679 ?auto_829684 ) ) ( not ( = ?auto_829679 ?auto_829685 ) ) ( not ( = ?auto_829679 ?auto_829686 ) ) ( not ( = ?auto_829679 ?auto_829687 ) ) ( not ( = ?auto_829679 ?auto_829688 ) ) ( not ( = ?auto_829679 ?auto_829689 ) ) ( not ( = ?auto_829679 ?auto_829690 ) ) ( not ( = ?auto_829680 ?auto_829681 ) ) ( not ( = ?auto_829680 ?auto_829682 ) ) ( not ( = ?auto_829680 ?auto_829683 ) ) ( not ( = ?auto_829680 ?auto_829684 ) ) ( not ( = ?auto_829680 ?auto_829685 ) ) ( not ( = ?auto_829680 ?auto_829686 ) ) ( not ( = ?auto_829680 ?auto_829687 ) ) ( not ( = ?auto_829680 ?auto_829688 ) ) ( not ( = ?auto_829680 ?auto_829689 ) ) ( not ( = ?auto_829680 ?auto_829690 ) ) ( not ( = ?auto_829681 ?auto_829682 ) ) ( not ( = ?auto_829681 ?auto_829683 ) ) ( not ( = ?auto_829681 ?auto_829684 ) ) ( not ( = ?auto_829681 ?auto_829685 ) ) ( not ( = ?auto_829681 ?auto_829686 ) ) ( not ( = ?auto_829681 ?auto_829687 ) ) ( not ( = ?auto_829681 ?auto_829688 ) ) ( not ( = ?auto_829681 ?auto_829689 ) ) ( not ( = ?auto_829681 ?auto_829690 ) ) ( not ( = ?auto_829682 ?auto_829683 ) ) ( not ( = ?auto_829682 ?auto_829684 ) ) ( not ( = ?auto_829682 ?auto_829685 ) ) ( not ( = ?auto_829682 ?auto_829686 ) ) ( not ( = ?auto_829682 ?auto_829687 ) ) ( not ( = ?auto_829682 ?auto_829688 ) ) ( not ( = ?auto_829682 ?auto_829689 ) ) ( not ( = ?auto_829682 ?auto_829690 ) ) ( not ( = ?auto_829683 ?auto_829684 ) ) ( not ( = ?auto_829683 ?auto_829685 ) ) ( not ( = ?auto_829683 ?auto_829686 ) ) ( not ( = ?auto_829683 ?auto_829687 ) ) ( not ( = ?auto_829683 ?auto_829688 ) ) ( not ( = ?auto_829683 ?auto_829689 ) ) ( not ( = ?auto_829683 ?auto_829690 ) ) ( not ( = ?auto_829684 ?auto_829685 ) ) ( not ( = ?auto_829684 ?auto_829686 ) ) ( not ( = ?auto_829684 ?auto_829687 ) ) ( not ( = ?auto_829684 ?auto_829688 ) ) ( not ( = ?auto_829684 ?auto_829689 ) ) ( not ( = ?auto_829684 ?auto_829690 ) ) ( not ( = ?auto_829685 ?auto_829686 ) ) ( not ( = ?auto_829685 ?auto_829687 ) ) ( not ( = ?auto_829685 ?auto_829688 ) ) ( not ( = ?auto_829685 ?auto_829689 ) ) ( not ( = ?auto_829685 ?auto_829690 ) ) ( not ( = ?auto_829686 ?auto_829687 ) ) ( not ( = ?auto_829686 ?auto_829688 ) ) ( not ( = ?auto_829686 ?auto_829689 ) ) ( not ( = ?auto_829686 ?auto_829690 ) ) ( not ( = ?auto_829687 ?auto_829688 ) ) ( not ( = ?auto_829687 ?auto_829689 ) ) ( not ( = ?auto_829687 ?auto_829690 ) ) ( not ( = ?auto_829688 ?auto_829689 ) ) ( not ( = ?auto_829688 ?auto_829690 ) ) ( not ( = ?auto_829689 ?auto_829690 ) ) ( ON ?auto_829688 ?auto_829689 ) ( ON ?auto_829687 ?auto_829688 ) ( ON ?auto_829686 ?auto_829687 ) ( ON ?auto_829685 ?auto_829686 ) ( ON ?auto_829684 ?auto_829685 ) ( ON ?auto_829683 ?auto_829684 ) ( ON ?auto_829682 ?auto_829683 ) ( CLEAR ?auto_829680 ) ( ON ?auto_829681 ?auto_829682 ) ( CLEAR ?auto_829681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_829679 ?auto_829680 ?auto_829681 )
      ( MAKE-11PILE ?auto_829679 ?auto_829680 ?auto_829681 ?auto_829682 ?auto_829683 ?auto_829684 ?auto_829685 ?auto_829686 ?auto_829687 ?auto_829688 ?auto_829689 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_829725 - BLOCK
      ?auto_829726 - BLOCK
      ?auto_829727 - BLOCK
      ?auto_829728 - BLOCK
      ?auto_829729 - BLOCK
      ?auto_829730 - BLOCK
      ?auto_829731 - BLOCK
      ?auto_829732 - BLOCK
      ?auto_829733 - BLOCK
      ?auto_829734 - BLOCK
      ?auto_829735 - BLOCK
    )
    :vars
    (
      ?auto_829736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_829735 ?auto_829736 ) ( ON-TABLE ?auto_829725 ) ( not ( = ?auto_829725 ?auto_829726 ) ) ( not ( = ?auto_829725 ?auto_829727 ) ) ( not ( = ?auto_829725 ?auto_829728 ) ) ( not ( = ?auto_829725 ?auto_829729 ) ) ( not ( = ?auto_829725 ?auto_829730 ) ) ( not ( = ?auto_829725 ?auto_829731 ) ) ( not ( = ?auto_829725 ?auto_829732 ) ) ( not ( = ?auto_829725 ?auto_829733 ) ) ( not ( = ?auto_829725 ?auto_829734 ) ) ( not ( = ?auto_829725 ?auto_829735 ) ) ( not ( = ?auto_829725 ?auto_829736 ) ) ( not ( = ?auto_829726 ?auto_829727 ) ) ( not ( = ?auto_829726 ?auto_829728 ) ) ( not ( = ?auto_829726 ?auto_829729 ) ) ( not ( = ?auto_829726 ?auto_829730 ) ) ( not ( = ?auto_829726 ?auto_829731 ) ) ( not ( = ?auto_829726 ?auto_829732 ) ) ( not ( = ?auto_829726 ?auto_829733 ) ) ( not ( = ?auto_829726 ?auto_829734 ) ) ( not ( = ?auto_829726 ?auto_829735 ) ) ( not ( = ?auto_829726 ?auto_829736 ) ) ( not ( = ?auto_829727 ?auto_829728 ) ) ( not ( = ?auto_829727 ?auto_829729 ) ) ( not ( = ?auto_829727 ?auto_829730 ) ) ( not ( = ?auto_829727 ?auto_829731 ) ) ( not ( = ?auto_829727 ?auto_829732 ) ) ( not ( = ?auto_829727 ?auto_829733 ) ) ( not ( = ?auto_829727 ?auto_829734 ) ) ( not ( = ?auto_829727 ?auto_829735 ) ) ( not ( = ?auto_829727 ?auto_829736 ) ) ( not ( = ?auto_829728 ?auto_829729 ) ) ( not ( = ?auto_829728 ?auto_829730 ) ) ( not ( = ?auto_829728 ?auto_829731 ) ) ( not ( = ?auto_829728 ?auto_829732 ) ) ( not ( = ?auto_829728 ?auto_829733 ) ) ( not ( = ?auto_829728 ?auto_829734 ) ) ( not ( = ?auto_829728 ?auto_829735 ) ) ( not ( = ?auto_829728 ?auto_829736 ) ) ( not ( = ?auto_829729 ?auto_829730 ) ) ( not ( = ?auto_829729 ?auto_829731 ) ) ( not ( = ?auto_829729 ?auto_829732 ) ) ( not ( = ?auto_829729 ?auto_829733 ) ) ( not ( = ?auto_829729 ?auto_829734 ) ) ( not ( = ?auto_829729 ?auto_829735 ) ) ( not ( = ?auto_829729 ?auto_829736 ) ) ( not ( = ?auto_829730 ?auto_829731 ) ) ( not ( = ?auto_829730 ?auto_829732 ) ) ( not ( = ?auto_829730 ?auto_829733 ) ) ( not ( = ?auto_829730 ?auto_829734 ) ) ( not ( = ?auto_829730 ?auto_829735 ) ) ( not ( = ?auto_829730 ?auto_829736 ) ) ( not ( = ?auto_829731 ?auto_829732 ) ) ( not ( = ?auto_829731 ?auto_829733 ) ) ( not ( = ?auto_829731 ?auto_829734 ) ) ( not ( = ?auto_829731 ?auto_829735 ) ) ( not ( = ?auto_829731 ?auto_829736 ) ) ( not ( = ?auto_829732 ?auto_829733 ) ) ( not ( = ?auto_829732 ?auto_829734 ) ) ( not ( = ?auto_829732 ?auto_829735 ) ) ( not ( = ?auto_829732 ?auto_829736 ) ) ( not ( = ?auto_829733 ?auto_829734 ) ) ( not ( = ?auto_829733 ?auto_829735 ) ) ( not ( = ?auto_829733 ?auto_829736 ) ) ( not ( = ?auto_829734 ?auto_829735 ) ) ( not ( = ?auto_829734 ?auto_829736 ) ) ( not ( = ?auto_829735 ?auto_829736 ) ) ( ON ?auto_829734 ?auto_829735 ) ( ON ?auto_829733 ?auto_829734 ) ( ON ?auto_829732 ?auto_829733 ) ( ON ?auto_829731 ?auto_829732 ) ( ON ?auto_829730 ?auto_829731 ) ( ON ?auto_829729 ?auto_829730 ) ( ON ?auto_829728 ?auto_829729 ) ( ON ?auto_829727 ?auto_829728 ) ( CLEAR ?auto_829725 ) ( ON ?auto_829726 ?auto_829727 ) ( CLEAR ?auto_829726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_829725 ?auto_829726 )
      ( MAKE-11PILE ?auto_829725 ?auto_829726 ?auto_829727 ?auto_829728 ?auto_829729 ?auto_829730 ?auto_829731 ?auto_829732 ?auto_829733 ?auto_829734 ?auto_829735 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_829771 - BLOCK
      ?auto_829772 - BLOCK
      ?auto_829773 - BLOCK
      ?auto_829774 - BLOCK
      ?auto_829775 - BLOCK
      ?auto_829776 - BLOCK
      ?auto_829777 - BLOCK
      ?auto_829778 - BLOCK
      ?auto_829779 - BLOCK
      ?auto_829780 - BLOCK
      ?auto_829781 - BLOCK
    )
    :vars
    (
      ?auto_829782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_829781 ?auto_829782 ) ( not ( = ?auto_829771 ?auto_829772 ) ) ( not ( = ?auto_829771 ?auto_829773 ) ) ( not ( = ?auto_829771 ?auto_829774 ) ) ( not ( = ?auto_829771 ?auto_829775 ) ) ( not ( = ?auto_829771 ?auto_829776 ) ) ( not ( = ?auto_829771 ?auto_829777 ) ) ( not ( = ?auto_829771 ?auto_829778 ) ) ( not ( = ?auto_829771 ?auto_829779 ) ) ( not ( = ?auto_829771 ?auto_829780 ) ) ( not ( = ?auto_829771 ?auto_829781 ) ) ( not ( = ?auto_829771 ?auto_829782 ) ) ( not ( = ?auto_829772 ?auto_829773 ) ) ( not ( = ?auto_829772 ?auto_829774 ) ) ( not ( = ?auto_829772 ?auto_829775 ) ) ( not ( = ?auto_829772 ?auto_829776 ) ) ( not ( = ?auto_829772 ?auto_829777 ) ) ( not ( = ?auto_829772 ?auto_829778 ) ) ( not ( = ?auto_829772 ?auto_829779 ) ) ( not ( = ?auto_829772 ?auto_829780 ) ) ( not ( = ?auto_829772 ?auto_829781 ) ) ( not ( = ?auto_829772 ?auto_829782 ) ) ( not ( = ?auto_829773 ?auto_829774 ) ) ( not ( = ?auto_829773 ?auto_829775 ) ) ( not ( = ?auto_829773 ?auto_829776 ) ) ( not ( = ?auto_829773 ?auto_829777 ) ) ( not ( = ?auto_829773 ?auto_829778 ) ) ( not ( = ?auto_829773 ?auto_829779 ) ) ( not ( = ?auto_829773 ?auto_829780 ) ) ( not ( = ?auto_829773 ?auto_829781 ) ) ( not ( = ?auto_829773 ?auto_829782 ) ) ( not ( = ?auto_829774 ?auto_829775 ) ) ( not ( = ?auto_829774 ?auto_829776 ) ) ( not ( = ?auto_829774 ?auto_829777 ) ) ( not ( = ?auto_829774 ?auto_829778 ) ) ( not ( = ?auto_829774 ?auto_829779 ) ) ( not ( = ?auto_829774 ?auto_829780 ) ) ( not ( = ?auto_829774 ?auto_829781 ) ) ( not ( = ?auto_829774 ?auto_829782 ) ) ( not ( = ?auto_829775 ?auto_829776 ) ) ( not ( = ?auto_829775 ?auto_829777 ) ) ( not ( = ?auto_829775 ?auto_829778 ) ) ( not ( = ?auto_829775 ?auto_829779 ) ) ( not ( = ?auto_829775 ?auto_829780 ) ) ( not ( = ?auto_829775 ?auto_829781 ) ) ( not ( = ?auto_829775 ?auto_829782 ) ) ( not ( = ?auto_829776 ?auto_829777 ) ) ( not ( = ?auto_829776 ?auto_829778 ) ) ( not ( = ?auto_829776 ?auto_829779 ) ) ( not ( = ?auto_829776 ?auto_829780 ) ) ( not ( = ?auto_829776 ?auto_829781 ) ) ( not ( = ?auto_829776 ?auto_829782 ) ) ( not ( = ?auto_829777 ?auto_829778 ) ) ( not ( = ?auto_829777 ?auto_829779 ) ) ( not ( = ?auto_829777 ?auto_829780 ) ) ( not ( = ?auto_829777 ?auto_829781 ) ) ( not ( = ?auto_829777 ?auto_829782 ) ) ( not ( = ?auto_829778 ?auto_829779 ) ) ( not ( = ?auto_829778 ?auto_829780 ) ) ( not ( = ?auto_829778 ?auto_829781 ) ) ( not ( = ?auto_829778 ?auto_829782 ) ) ( not ( = ?auto_829779 ?auto_829780 ) ) ( not ( = ?auto_829779 ?auto_829781 ) ) ( not ( = ?auto_829779 ?auto_829782 ) ) ( not ( = ?auto_829780 ?auto_829781 ) ) ( not ( = ?auto_829780 ?auto_829782 ) ) ( not ( = ?auto_829781 ?auto_829782 ) ) ( ON ?auto_829780 ?auto_829781 ) ( ON ?auto_829779 ?auto_829780 ) ( ON ?auto_829778 ?auto_829779 ) ( ON ?auto_829777 ?auto_829778 ) ( ON ?auto_829776 ?auto_829777 ) ( ON ?auto_829775 ?auto_829776 ) ( ON ?auto_829774 ?auto_829775 ) ( ON ?auto_829773 ?auto_829774 ) ( ON ?auto_829772 ?auto_829773 ) ( ON ?auto_829771 ?auto_829772 ) ( CLEAR ?auto_829771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_829771 )
      ( MAKE-11PILE ?auto_829771 ?auto_829772 ?auto_829773 ?auto_829774 ?auto_829775 ?auto_829776 ?auto_829777 ?auto_829778 ?auto_829779 ?auto_829780 ?auto_829781 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_829818 - BLOCK
      ?auto_829819 - BLOCK
      ?auto_829820 - BLOCK
      ?auto_829821 - BLOCK
      ?auto_829822 - BLOCK
      ?auto_829823 - BLOCK
      ?auto_829824 - BLOCK
      ?auto_829825 - BLOCK
      ?auto_829826 - BLOCK
      ?auto_829827 - BLOCK
      ?auto_829828 - BLOCK
      ?auto_829829 - BLOCK
    )
    :vars
    (
      ?auto_829830 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_829828 ) ( ON ?auto_829829 ?auto_829830 ) ( CLEAR ?auto_829829 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_829818 ) ( ON ?auto_829819 ?auto_829818 ) ( ON ?auto_829820 ?auto_829819 ) ( ON ?auto_829821 ?auto_829820 ) ( ON ?auto_829822 ?auto_829821 ) ( ON ?auto_829823 ?auto_829822 ) ( ON ?auto_829824 ?auto_829823 ) ( ON ?auto_829825 ?auto_829824 ) ( ON ?auto_829826 ?auto_829825 ) ( ON ?auto_829827 ?auto_829826 ) ( ON ?auto_829828 ?auto_829827 ) ( not ( = ?auto_829818 ?auto_829819 ) ) ( not ( = ?auto_829818 ?auto_829820 ) ) ( not ( = ?auto_829818 ?auto_829821 ) ) ( not ( = ?auto_829818 ?auto_829822 ) ) ( not ( = ?auto_829818 ?auto_829823 ) ) ( not ( = ?auto_829818 ?auto_829824 ) ) ( not ( = ?auto_829818 ?auto_829825 ) ) ( not ( = ?auto_829818 ?auto_829826 ) ) ( not ( = ?auto_829818 ?auto_829827 ) ) ( not ( = ?auto_829818 ?auto_829828 ) ) ( not ( = ?auto_829818 ?auto_829829 ) ) ( not ( = ?auto_829818 ?auto_829830 ) ) ( not ( = ?auto_829819 ?auto_829820 ) ) ( not ( = ?auto_829819 ?auto_829821 ) ) ( not ( = ?auto_829819 ?auto_829822 ) ) ( not ( = ?auto_829819 ?auto_829823 ) ) ( not ( = ?auto_829819 ?auto_829824 ) ) ( not ( = ?auto_829819 ?auto_829825 ) ) ( not ( = ?auto_829819 ?auto_829826 ) ) ( not ( = ?auto_829819 ?auto_829827 ) ) ( not ( = ?auto_829819 ?auto_829828 ) ) ( not ( = ?auto_829819 ?auto_829829 ) ) ( not ( = ?auto_829819 ?auto_829830 ) ) ( not ( = ?auto_829820 ?auto_829821 ) ) ( not ( = ?auto_829820 ?auto_829822 ) ) ( not ( = ?auto_829820 ?auto_829823 ) ) ( not ( = ?auto_829820 ?auto_829824 ) ) ( not ( = ?auto_829820 ?auto_829825 ) ) ( not ( = ?auto_829820 ?auto_829826 ) ) ( not ( = ?auto_829820 ?auto_829827 ) ) ( not ( = ?auto_829820 ?auto_829828 ) ) ( not ( = ?auto_829820 ?auto_829829 ) ) ( not ( = ?auto_829820 ?auto_829830 ) ) ( not ( = ?auto_829821 ?auto_829822 ) ) ( not ( = ?auto_829821 ?auto_829823 ) ) ( not ( = ?auto_829821 ?auto_829824 ) ) ( not ( = ?auto_829821 ?auto_829825 ) ) ( not ( = ?auto_829821 ?auto_829826 ) ) ( not ( = ?auto_829821 ?auto_829827 ) ) ( not ( = ?auto_829821 ?auto_829828 ) ) ( not ( = ?auto_829821 ?auto_829829 ) ) ( not ( = ?auto_829821 ?auto_829830 ) ) ( not ( = ?auto_829822 ?auto_829823 ) ) ( not ( = ?auto_829822 ?auto_829824 ) ) ( not ( = ?auto_829822 ?auto_829825 ) ) ( not ( = ?auto_829822 ?auto_829826 ) ) ( not ( = ?auto_829822 ?auto_829827 ) ) ( not ( = ?auto_829822 ?auto_829828 ) ) ( not ( = ?auto_829822 ?auto_829829 ) ) ( not ( = ?auto_829822 ?auto_829830 ) ) ( not ( = ?auto_829823 ?auto_829824 ) ) ( not ( = ?auto_829823 ?auto_829825 ) ) ( not ( = ?auto_829823 ?auto_829826 ) ) ( not ( = ?auto_829823 ?auto_829827 ) ) ( not ( = ?auto_829823 ?auto_829828 ) ) ( not ( = ?auto_829823 ?auto_829829 ) ) ( not ( = ?auto_829823 ?auto_829830 ) ) ( not ( = ?auto_829824 ?auto_829825 ) ) ( not ( = ?auto_829824 ?auto_829826 ) ) ( not ( = ?auto_829824 ?auto_829827 ) ) ( not ( = ?auto_829824 ?auto_829828 ) ) ( not ( = ?auto_829824 ?auto_829829 ) ) ( not ( = ?auto_829824 ?auto_829830 ) ) ( not ( = ?auto_829825 ?auto_829826 ) ) ( not ( = ?auto_829825 ?auto_829827 ) ) ( not ( = ?auto_829825 ?auto_829828 ) ) ( not ( = ?auto_829825 ?auto_829829 ) ) ( not ( = ?auto_829825 ?auto_829830 ) ) ( not ( = ?auto_829826 ?auto_829827 ) ) ( not ( = ?auto_829826 ?auto_829828 ) ) ( not ( = ?auto_829826 ?auto_829829 ) ) ( not ( = ?auto_829826 ?auto_829830 ) ) ( not ( = ?auto_829827 ?auto_829828 ) ) ( not ( = ?auto_829827 ?auto_829829 ) ) ( not ( = ?auto_829827 ?auto_829830 ) ) ( not ( = ?auto_829828 ?auto_829829 ) ) ( not ( = ?auto_829828 ?auto_829830 ) ) ( not ( = ?auto_829829 ?auto_829830 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_829829 ?auto_829830 )
      ( !STACK ?auto_829829 ?auto_829828 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_829868 - BLOCK
      ?auto_829869 - BLOCK
      ?auto_829870 - BLOCK
      ?auto_829871 - BLOCK
      ?auto_829872 - BLOCK
      ?auto_829873 - BLOCK
      ?auto_829874 - BLOCK
      ?auto_829875 - BLOCK
      ?auto_829876 - BLOCK
      ?auto_829877 - BLOCK
      ?auto_829878 - BLOCK
      ?auto_829879 - BLOCK
    )
    :vars
    (
      ?auto_829880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_829879 ?auto_829880 ) ( ON-TABLE ?auto_829868 ) ( ON ?auto_829869 ?auto_829868 ) ( ON ?auto_829870 ?auto_829869 ) ( ON ?auto_829871 ?auto_829870 ) ( ON ?auto_829872 ?auto_829871 ) ( ON ?auto_829873 ?auto_829872 ) ( ON ?auto_829874 ?auto_829873 ) ( ON ?auto_829875 ?auto_829874 ) ( ON ?auto_829876 ?auto_829875 ) ( ON ?auto_829877 ?auto_829876 ) ( not ( = ?auto_829868 ?auto_829869 ) ) ( not ( = ?auto_829868 ?auto_829870 ) ) ( not ( = ?auto_829868 ?auto_829871 ) ) ( not ( = ?auto_829868 ?auto_829872 ) ) ( not ( = ?auto_829868 ?auto_829873 ) ) ( not ( = ?auto_829868 ?auto_829874 ) ) ( not ( = ?auto_829868 ?auto_829875 ) ) ( not ( = ?auto_829868 ?auto_829876 ) ) ( not ( = ?auto_829868 ?auto_829877 ) ) ( not ( = ?auto_829868 ?auto_829878 ) ) ( not ( = ?auto_829868 ?auto_829879 ) ) ( not ( = ?auto_829868 ?auto_829880 ) ) ( not ( = ?auto_829869 ?auto_829870 ) ) ( not ( = ?auto_829869 ?auto_829871 ) ) ( not ( = ?auto_829869 ?auto_829872 ) ) ( not ( = ?auto_829869 ?auto_829873 ) ) ( not ( = ?auto_829869 ?auto_829874 ) ) ( not ( = ?auto_829869 ?auto_829875 ) ) ( not ( = ?auto_829869 ?auto_829876 ) ) ( not ( = ?auto_829869 ?auto_829877 ) ) ( not ( = ?auto_829869 ?auto_829878 ) ) ( not ( = ?auto_829869 ?auto_829879 ) ) ( not ( = ?auto_829869 ?auto_829880 ) ) ( not ( = ?auto_829870 ?auto_829871 ) ) ( not ( = ?auto_829870 ?auto_829872 ) ) ( not ( = ?auto_829870 ?auto_829873 ) ) ( not ( = ?auto_829870 ?auto_829874 ) ) ( not ( = ?auto_829870 ?auto_829875 ) ) ( not ( = ?auto_829870 ?auto_829876 ) ) ( not ( = ?auto_829870 ?auto_829877 ) ) ( not ( = ?auto_829870 ?auto_829878 ) ) ( not ( = ?auto_829870 ?auto_829879 ) ) ( not ( = ?auto_829870 ?auto_829880 ) ) ( not ( = ?auto_829871 ?auto_829872 ) ) ( not ( = ?auto_829871 ?auto_829873 ) ) ( not ( = ?auto_829871 ?auto_829874 ) ) ( not ( = ?auto_829871 ?auto_829875 ) ) ( not ( = ?auto_829871 ?auto_829876 ) ) ( not ( = ?auto_829871 ?auto_829877 ) ) ( not ( = ?auto_829871 ?auto_829878 ) ) ( not ( = ?auto_829871 ?auto_829879 ) ) ( not ( = ?auto_829871 ?auto_829880 ) ) ( not ( = ?auto_829872 ?auto_829873 ) ) ( not ( = ?auto_829872 ?auto_829874 ) ) ( not ( = ?auto_829872 ?auto_829875 ) ) ( not ( = ?auto_829872 ?auto_829876 ) ) ( not ( = ?auto_829872 ?auto_829877 ) ) ( not ( = ?auto_829872 ?auto_829878 ) ) ( not ( = ?auto_829872 ?auto_829879 ) ) ( not ( = ?auto_829872 ?auto_829880 ) ) ( not ( = ?auto_829873 ?auto_829874 ) ) ( not ( = ?auto_829873 ?auto_829875 ) ) ( not ( = ?auto_829873 ?auto_829876 ) ) ( not ( = ?auto_829873 ?auto_829877 ) ) ( not ( = ?auto_829873 ?auto_829878 ) ) ( not ( = ?auto_829873 ?auto_829879 ) ) ( not ( = ?auto_829873 ?auto_829880 ) ) ( not ( = ?auto_829874 ?auto_829875 ) ) ( not ( = ?auto_829874 ?auto_829876 ) ) ( not ( = ?auto_829874 ?auto_829877 ) ) ( not ( = ?auto_829874 ?auto_829878 ) ) ( not ( = ?auto_829874 ?auto_829879 ) ) ( not ( = ?auto_829874 ?auto_829880 ) ) ( not ( = ?auto_829875 ?auto_829876 ) ) ( not ( = ?auto_829875 ?auto_829877 ) ) ( not ( = ?auto_829875 ?auto_829878 ) ) ( not ( = ?auto_829875 ?auto_829879 ) ) ( not ( = ?auto_829875 ?auto_829880 ) ) ( not ( = ?auto_829876 ?auto_829877 ) ) ( not ( = ?auto_829876 ?auto_829878 ) ) ( not ( = ?auto_829876 ?auto_829879 ) ) ( not ( = ?auto_829876 ?auto_829880 ) ) ( not ( = ?auto_829877 ?auto_829878 ) ) ( not ( = ?auto_829877 ?auto_829879 ) ) ( not ( = ?auto_829877 ?auto_829880 ) ) ( not ( = ?auto_829878 ?auto_829879 ) ) ( not ( = ?auto_829878 ?auto_829880 ) ) ( not ( = ?auto_829879 ?auto_829880 ) ) ( CLEAR ?auto_829877 ) ( ON ?auto_829878 ?auto_829879 ) ( CLEAR ?auto_829878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_829868 ?auto_829869 ?auto_829870 ?auto_829871 ?auto_829872 ?auto_829873 ?auto_829874 ?auto_829875 ?auto_829876 ?auto_829877 ?auto_829878 )
      ( MAKE-12PILE ?auto_829868 ?auto_829869 ?auto_829870 ?auto_829871 ?auto_829872 ?auto_829873 ?auto_829874 ?auto_829875 ?auto_829876 ?auto_829877 ?auto_829878 ?auto_829879 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_829918 - BLOCK
      ?auto_829919 - BLOCK
      ?auto_829920 - BLOCK
      ?auto_829921 - BLOCK
      ?auto_829922 - BLOCK
      ?auto_829923 - BLOCK
      ?auto_829924 - BLOCK
      ?auto_829925 - BLOCK
      ?auto_829926 - BLOCK
      ?auto_829927 - BLOCK
      ?auto_829928 - BLOCK
      ?auto_829929 - BLOCK
    )
    :vars
    (
      ?auto_829930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_829929 ?auto_829930 ) ( ON-TABLE ?auto_829918 ) ( ON ?auto_829919 ?auto_829918 ) ( ON ?auto_829920 ?auto_829919 ) ( ON ?auto_829921 ?auto_829920 ) ( ON ?auto_829922 ?auto_829921 ) ( ON ?auto_829923 ?auto_829922 ) ( ON ?auto_829924 ?auto_829923 ) ( ON ?auto_829925 ?auto_829924 ) ( ON ?auto_829926 ?auto_829925 ) ( not ( = ?auto_829918 ?auto_829919 ) ) ( not ( = ?auto_829918 ?auto_829920 ) ) ( not ( = ?auto_829918 ?auto_829921 ) ) ( not ( = ?auto_829918 ?auto_829922 ) ) ( not ( = ?auto_829918 ?auto_829923 ) ) ( not ( = ?auto_829918 ?auto_829924 ) ) ( not ( = ?auto_829918 ?auto_829925 ) ) ( not ( = ?auto_829918 ?auto_829926 ) ) ( not ( = ?auto_829918 ?auto_829927 ) ) ( not ( = ?auto_829918 ?auto_829928 ) ) ( not ( = ?auto_829918 ?auto_829929 ) ) ( not ( = ?auto_829918 ?auto_829930 ) ) ( not ( = ?auto_829919 ?auto_829920 ) ) ( not ( = ?auto_829919 ?auto_829921 ) ) ( not ( = ?auto_829919 ?auto_829922 ) ) ( not ( = ?auto_829919 ?auto_829923 ) ) ( not ( = ?auto_829919 ?auto_829924 ) ) ( not ( = ?auto_829919 ?auto_829925 ) ) ( not ( = ?auto_829919 ?auto_829926 ) ) ( not ( = ?auto_829919 ?auto_829927 ) ) ( not ( = ?auto_829919 ?auto_829928 ) ) ( not ( = ?auto_829919 ?auto_829929 ) ) ( not ( = ?auto_829919 ?auto_829930 ) ) ( not ( = ?auto_829920 ?auto_829921 ) ) ( not ( = ?auto_829920 ?auto_829922 ) ) ( not ( = ?auto_829920 ?auto_829923 ) ) ( not ( = ?auto_829920 ?auto_829924 ) ) ( not ( = ?auto_829920 ?auto_829925 ) ) ( not ( = ?auto_829920 ?auto_829926 ) ) ( not ( = ?auto_829920 ?auto_829927 ) ) ( not ( = ?auto_829920 ?auto_829928 ) ) ( not ( = ?auto_829920 ?auto_829929 ) ) ( not ( = ?auto_829920 ?auto_829930 ) ) ( not ( = ?auto_829921 ?auto_829922 ) ) ( not ( = ?auto_829921 ?auto_829923 ) ) ( not ( = ?auto_829921 ?auto_829924 ) ) ( not ( = ?auto_829921 ?auto_829925 ) ) ( not ( = ?auto_829921 ?auto_829926 ) ) ( not ( = ?auto_829921 ?auto_829927 ) ) ( not ( = ?auto_829921 ?auto_829928 ) ) ( not ( = ?auto_829921 ?auto_829929 ) ) ( not ( = ?auto_829921 ?auto_829930 ) ) ( not ( = ?auto_829922 ?auto_829923 ) ) ( not ( = ?auto_829922 ?auto_829924 ) ) ( not ( = ?auto_829922 ?auto_829925 ) ) ( not ( = ?auto_829922 ?auto_829926 ) ) ( not ( = ?auto_829922 ?auto_829927 ) ) ( not ( = ?auto_829922 ?auto_829928 ) ) ( not ( = ?auto_829922 ?auto_829929 ) ) ( not ( = ?auto_829922 ?auto_829930 ) ) ( not ( = ?auto_829923 ?auto_829924 ) ) ( not ( = ?auto_829923 ?auto_829925 ) ) ( not ( = ?auto_829923 ?auto_829926 ) ) ( not ( = ?auto_829923 ?auto_829927 ) ) ( not ( = ?auto_829923 ?auto_829928 ) ) ( not ( = ?auto_829923 ?auto_829929 ) ) ( not ( = ?auto_829923 ?auto_829930 ) ) ( not ( = ?auto_829924 ?auto_829925 ) ) ( not ( = ?auto_829924 ?auto_829926 ) ) ( not ( = ?auto_829924 ?auto_829927 ) ) ( not ( = ?auto_829924 ?auto_829928 ) ) ( not ( = ?auto_829924 ?auto_829929 ) ) ( not ( = ?auto_829924 ?auto_829930 ) ) ( not ( = ?auto_829925 ?auto_829926 ) ) ( not ( = ?auto_829925 ?auto_829927 ) ) ( not ( = ?auto_829925 ?auto_829928 ) ) ( not ( = ?auto_829925 ?auto_829929 ) ) ( not ( = ?auto_829925 ?auto_829930 ) ) ( not ( = ?auto_829926 ?auto_829927 ) ) ( not ( = ?auto_829926 ?auto_829928 ) ) ( not ( = ?auto_829926 ?auto_829929 ) ) ( not ( = ?auto_829926 ?auto_829930 ) ) ( not ( = ?auto_829927 ?auto_829928 ) ) ( not ( = ?auto_829927 ?auto_829929 ) ) ( not ( = ?auto_829927 ?auto_829930 ) ) ( not ( = ?auto_829928 ?auto_829929 ) ) ( not ( = ?auto_829928 ?auto_829930 ) ) ( not ( = ?auto_829929 ?auto_829930 ) ) ( ON ?auto_829928 ?auto_829929 ) ( CLEAR ?auto_829926 ) ( ON ?auto_829927 ?auto_829928 ) ( CLEAR ?auto_829927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_829918 ?auto_829919 ?auto_829920 ?auto_829921 ?auto_829922 ?auto_829923 ?auto_829924 ?auto_829925 ?auto_829926 ?auto_829927 )
      ( MAKE-12PILE ?auto_829918 ?auto_829919 ?auto_829920 ?auto_829921 ?auto_829922 ?auto_829923 ?auto_829924 ?auto_829925 ?auto_829926 ?auto_829927 ?auto_829928 ?auto_829929 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_829968 - BLOCK
      ?auto_829969 - BLOCK
      ?auto_829970 - BLOCK
      ?auto_829971 - BLOCK
      ?auto_829972 - BLOCK
      ?auto_829973 - BLOCK
      ?auto_829974 - BLOCK
      ?auto_829975 - BLOCK
      ?auto_829976 - BLOCK
      ?auto_829977 - BLOCK
      ?auto_829978 - BLOCK
      ?auto_829979 - BLOCK
    )
    :vars
    (
      ?auto_829980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_829979 ?auto_829980 ) ( ON-TABLE ?auto_829968 ) ( ON ?auto_829969 ?auto_829968 ) ( ON ?auto_829970 ?auto_829969 ) ( ON ?auto_829971 ?auto_829970 ) ( ON ?auto_829972 ?auto_829971 ) ( ON ?auto_829973 ?auto_829972 ) ( ON ?auto_829974 ?auto_829973 ) ( ON ?auto_829975 ?auto_829974 ) ( not ( = ?auto_829968 ?auto_829969 ) ) ( not ( = ?auto_829968 ?auto_829970 ) ) ( not ( = ?auto_829968 ?auto_829971 ) ) ( not ( = ?auto_829968 ?auto_829972 ) ) ( not ( = ?auto_829968 ?auto_829973 ) ) ( not ( = ?auto_829968 ?auto_829974 ) ) ( not ( = ?auto_829968 ?auto_829975 ) ) ( not ( = ?auto_829968 ?auto_829976 ) ) ( not ( = ?auto_829968 ?auto_829977 ) ) ( not ( = ?auto_829968 ?auto_829978 ) ) ( not ( = ?auto_829968 ?auto_829979 ) ) ( not ( = ?auto_829968 ?auto_829980 ) ) ( not ( = ?auto_829969 ?auto_829970 ) ) ( not ( = ?auto_829969 ?auto_829971 ) ) ( not ( = ?auto_829969 ?auto_829972 ) ) ( not ( = ?auto_829969 ?auto_829973 ) ) ( not ( = ?auto_829969 ?auto_829974 ) ) ( not ( = ?auto_829969 ?auto_829975 ) ) ( not ( = ?auto_829969 ?auto_829976 ) ) ( not ( = ?auto_829969 ?auto_829977 ) ) ( not ( = ?auto_829969 ?auto_829978 ) ) ( not ( = ?auto_829969 ?auto_829979 ) ) ( not ( = ?auto_829969 ?auto_829980 ) ) ( not ( = ?auto_829970 ?auto_829971 ) ) ( not ( = ?auto_829970 ?auto_829972 ) ) ( not ( = ?auto_829970 ?auto_829973 ) ) ( not ( = ?auto_829970 ?auto_829974 ) ) ( not ( = ?auto_829970 ?auto_829975 ) ) ( not ( = ?auto_829970 ?auto_829976 ) ) ( not ( = ?auto_829970 ?auto_829977 ) ) ( not ( = ?auto_829970 ?auto_829978 ) ) ( not ( = ?auto_829970 ?auto_829979 ) ) ( not ( = ?auto_829970 ?auto_829980 ) ) ( not ( = ?auto_829971 ?auto_829972 ) ) ( not ( = ?auto_829971 ?auto_829973 ) ) ( not ( = ?auto_829971 ?auto_829974 ) ) ( not ( = ?auto_829971 ?auto_829975 ) ) ( not ( = ?auto_829971 ?auto_829976 ) ) ( not ( = ?auto_829971 ?auto_829977 ) ) ( not ( = ?auto_829971 ?auto_829978 ) ) ( not ( = ?auto_829971 ?auto_829979 ) ) ( not ( = ?auto_829971 ?auto_829980 ) ) ( not ( = ?auto_829972 ?auto_829973 ) ) ( not ( = ?auto_829972 ?auto_829974 ) ) ( not ( = ?auto_829972 ?auto_829975 ) ) ( not ( = ?auto_829972 ?auto_829976 ) ) ( not ( = ?auto_829972 ?auto_829977 ) ) ( not ( = ?auto_829972 ?auto_829978 ) ) ( not ( = ?auto_829972 ?auto_829979 ) ) ( not ( = ?auto_829972 ?auto_829980 ) ) ( not ( = ?auto_829973 ?auto_829974 ) ) ( not ( = ?auto_829973 ?auto_829975 ) ) ( not ( = ?auto_829973 ?auto_829976 ) ) ( not ( = ?auto_829973 ?auto_829977 ) ) ( not ( = ?auto_829973 ?auto_829978 ) ) ( not ( = ?auto_829973 ?auto_829979 ) ) ( not ( = ?auto_829973 ?auto_829980 ) ) ( not ( = ?auto_829974 ?auto_829975 ) ) ( not ( = ?auto_829974 ?auto_829976 ) ) ( not ( = ?auto_829974 ?auto_829977 ) ) ( not ( = ?auto_829974 ?auto_829978 ) ) ( not ( = ?auto_829974 ?auto_829979 ) ) ( not ( = ?auto_829974 ?auto_829980 ) ) ( not ( = ?auto_829975 ?auto_829976 ) ) ( not ( = ?auto_829975 ?auto_829977 ) ) ( not ( = ?auto_829975 ?auto_829978 ) ) ( not ( = ?auto_829975 ?auto_829979 ) ) ( not ( = ?auto_829975 ?auto_829980 ) ) ( not ( = ?auto_829976 ?auto_829977 ) ) ( not ( = ?auto_829976 ?auto_829978 ) ) ( not ( = ?auto_829976 ?auto_829979 ) ) ( not ( = ?auto_829976 ?auto_829980 ) ) ( not ( = ?auto_829977 ?auto_829978 ) ) ( not ( = ?auto_829977 ?auto_829979 ) ) ( not ( = ?auto_829977 ?auto_829980 ) ) ( not ( = ?auto_829978 ?auto_829979 ) ) ( not ( = ?auto_829978 ?auto_829980 ) ) ( not ( = ?auto_829979 ?auto_829980 ) ) ( ON ?auto_829978 ?auto_829979 ) ( ON ?auto_829977 ?auto_829978 ) ( CLEAR ?auto_829975 ) ( ON ?auto_829976 ?auto_829977 ) ( CLEAR ?auto_829976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_829968 ?auto_829969 ?auto_829970 ?auto_829971 ?auto_829972 ?auto_829973 ?auto_829974 ?auto_829975 ?auto_829976 )
      ( MAKE-12PILE ?auto_829968 ?auto_829969 ?auto_829970 ?auto_829971 ?auto_829972 ?auto_829973 ?auto_829974 ?auto_829975 ?auto_829976 ?auto_829977 ?auto_829978 ?auto_829979 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_830018 - BLOCK
      ?auto_830019 - BLOCK
      ?auto_830020 - BLOCK
      ?auto_830021 - BLOCK
      ?auto_830022 - BLOCK
      ?auto_830023 - BLOCK
      ?auto_830024 - BLOCK
      ?auto_830025 - BLOCK
      ?auto_830026 - BLOCK
      ?auto_830027 - BLOCK
      ?auto_830028 - BLOCK
      ?auto_830029 - BLOCK
    )
    :vars
    (
      ?auto_830030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_830029 ?auto_830030 ) ( ON-TABLE ?auto_830018 ) ( ON ?auto_830019 ?auto_830018 ) ( ON ?auto_830020 ?auto_830019 ) ( ON ?auto_830021 ?auto_830020 ) ( ON ?auto_830022 ?auto_830021 ) ( ON ?auto_830023 ?auto_830022 ) ( ON ?auto_830024 ?auto_830023 ) ( not ( = ?auto_830018 ?auto_830019 ) ) ( not ( = ?auto_830018 ?auto_830020 ) ) ( not ( = ?auto_830018 ?auto_830021 ) ) ( not ( = ?auto_830018 ?auto_830022 ) ) ( not ( = ?auto_830018 ?auto_830023 ) ) ( not ( = ?auto_830018 ?auto_830024 ) ) ( not ( = ?auto_830018 ?auto_830025 ) ) ( not ( = ?auto_830018 ?auto_830026 ) ) ( not ( = ?auto_830018 ?auto_830027 ) ) ( not ( = ?auto_830018 ?auto_830028 ) ) ( not ( = ?auto_830018 ?auto_830029 ) ) ( not ( = ?auto_830018 ?auto_830030 ) ) ( not ( = ?auto_830019 ?auto_830020 ) ) ( not ( = ?auto_830019 ?auto_830021 ) ) ( not ( = ?auto_830019 ?auto_830022 ) ) ( not ( = ?auto_830019 ?auto_830023 ) ) ( not ( = ?auto_830019 ?auto_830024 ) ) ( not ( = ?auto_830019 ?auto_830025 ) ) ( not ( = ?auto_830019 ?auto_830026 ) ) ( not ( = ?auto_830019 ?auto_830027 ) ) ( not ( = ?auto_830019 ?auto_830028 ) ) ( not ( = ?auto_830019 ?auto_830029 ) ) ( not ( = ?auto_830019 ?auto_830030 ) ) ( not ( = ?auto_830020 ?auto_830021 ) ) ( not ( = ?auto_830020 ?auto_830022 ) ) ( not ( = ?auto_830020 ?auto_830023 ) ) ( not ( = ?auto_830020 ?auto_830024 ) ) ( not ( = ?auto_830020 ?auto_830025 ) ) ( not ( = ?auto_830020 ?auto_830026 ) ) ( not ( = ?auto_830020 ?auto_830027 ) ) ( not ( = ?auto_830020 ?auto_830028 ) ) ( not ( = ?auto_830020 ?auto_830029 ) ) ( not ( = ?auto_830020 ?auto_830030 ) ) ( not ( = ?auto_830021 ?auto_830022 ) ) ( not ( = ?auto_830021 ?auto_830023 ) ) ( not ( = ?auto_830021 ?auto_830024 ) ) ( not ( = ?auto_830021 ?auto_830025 ) ) ( not ( = ?auto_830021 ?auto_830026 ) ) ( not ( = ?auto_830021 ?auto_830027 ) ) ( not ( = ?auto_830021 ?auto_830028 ) ) ( not ( = ?auto_830021 ?auto_830029 ) ) ( not ( = ?auto_830021 ?auto_830030 ) ) ( not ( = ?auto_830022 ?auto_830023 ) ) ( not ( = ?auto_830022 ?auto_830024 ) ) ( not ( = ?auto_830022 ?auto_830025 ) ) ( not ( = ?auto_830022 ?auto_830026 ) ) ( not ( = ?auto_830022 ?auto_830027 ) ) ( not ( = ?auto_830022 ?auto_830028 ) ) ( not ( = ?auto_830022 ?auto_830029 ) ) ( not ( = ?auto_830022 ?auto_830030 ) ) ( not ( = ?auto_830023 ?auto_830024 ) ) ( not ( = ?auto_830023 ?auto_830025 ) ) ( not ( = ?auto_830023 ?auto_830026 ) ) ( not ( = ?auto_830023 ?auto_830027 ) ) ( not ( = ?auto_830023 ?auto_830028 ) ) ( not ( = ?auto_830023 ?auto_830029 ) ) ( not ( = ?auto_830023 ?auto_830030 ) ) ( not ( = ?auto_830024 ?auto_830025 ) ) ( not ( = ?auto_830024 ?auto_830026 ) ) ( not ( = ?auto_830024 ?auto_830027 ) ) ( not ( = ?auto_830024 ?auto_830028 ) ) ( not ( = ?auto_830024 ?auto_830029 ) ) ( not ( = ?auto_830024 ?auto_830030 ) ) ( not ( = ?auto_830025 ?auto_830026 ) ) ( not ( = ?auto_830025 ?auto_830027 ) ) ( not ( = ?auto_830025 ?auto_830028 ) ) ( not ( = ?auto_830025 ?auto_830029 ) ) ( not ( = ?auto_830025 ?auto_830030 ) ) ( not ( = ?auto_830026 ?auto_830027 ) ) ( not ( = ?auto_830026 ?auto_830028 ) ) ( not ( = ?auto_830026 ?auto_830029 ) ) ( not ( = ?auto_830026 ?auto_830030 ) ) ( not ( = ?auto_830027 ?auto_830028 ) ) ( not ( = ?auto_830027 ?auto_830029 ) ) ( not ( = ?auto_830027 ?auto_830030 ) ) ( not ( = ?auto_830028 ?auto_830029 ) ) ( not ( = ?auto_830028 ?auto_830030 ) ) ( not ( = ?auto_830029 ?auto_830030 ) ) ( ON ?auto_830028 ?auto_830029 ) ( ON ?auto_830027 ?auto_830028 ) ( ON ?auto_830026 ?auto_830027 ) ( CLEAR ?auto_830024 ) ( ON ?auto_830025 ?auto_830026 ) ( CLEAR ?auto_830025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_830018 ?auto_830019 ?auto_830020 ?auto_830021 ?auto_830022 ?auto_830023 ?auto_830024 ?auto_830025 )
      ( MAKE-12PILE ?auto_830018 ?auto_830019 ?auto_830020 ?auto_830021 ?auto_830022 ?auto_830023 ?auto_830024 ?auto_830025 ?auto_830026 ?auto_830027 ?auto_830028 ?auto_830029 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_830068 - BLOCK
      ?auto_830069 - BLOCK
      ?auto_830070 - BLOCK
      ?auto_830071 - BLOCK
      ?auto_830072 - BLOCK
      ?auto_830073 - BLOCK
      ?auto_830074 - BLOCK
      ?auto_830075 - BLOCK
      ?auto_830076 - BLOCK
      ?auto_830077 - BLOCK
      ?auto_830078 - BLOCK
      ?auto_830079 - BLOCK
    )
    :vars
    (
      ?auto_830080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_830079 ?auto_830080 ) ( ON-TABLE ?auto_830068 ) ( ON ?auto_830069 ?auto_830068 ) ( ON ?auto_830070 ?auto_830069 ) ( ON ?auto_830071 ?auto_830070 ) ( ON ?auto_830072 ?auto_830071 ) ( ON ?auto_830073 ?auto_830072 ) ( not ( = ?auto_830068 ?auto_830069 ) ) ( not ( = ?auto_830068 ?auto_830070 ) ) ( not ( = ?auto_830068 ?auto_830071 ) ) ( not ( = ?auto_830068 ?auto_830072 ) ) ( not ( = ?auto_830068 ?auto_830073 ) ) ( not ( = ?auto_830068 ?auto_830074 ) ) ( not ( = ?auto_830068 ?auto_830075 ) ) ( not ( = ?auto_830068 ?auto_830076 ) ) ( not ( = ?auto_830068 ?auto_830077 ) ) ( not ( = ?auto_830068 ?auto_830078 ) ) ( not ( = ?auto_830068 ?auto_830079 ) ) ( not ( = ?auto_830068 ?auto_830080 ) ) ( not ( = ?auto_830069 ?auto_830070 ) ) ( not ( = ?auto_830069 ?auto_830071 ) ) ( not ( = ?auto_830069 ?auto_830072 ) ) ( not ( = ?auto_830069 ?auto_830073 ) ) ( not ( = ?auto_830069 ?auto_830074 ) ) ( not ( = ?auto_830069 ?auto_830075 ) ) ( not ( = ?auto_830069 ?auto_830076 ) ) ( not ( = ?auto_830069 ?auto_830077 ) ) ( not ( = ?auto_830069 ?auto_830078 ) ) ( not ( = ?auto_830069 ?auto_830079 ) ) ( not ( = ?auto_830069 ?auto_830080 ) ) ( not ( = ?auto_830070 ?auto_830071 ) ) ( not ( = ?auto_830070 ?auto_830072 ) ) ( not ( = ?auto_830070 ?auto_830073 ) ) ( not ( = ?auto_830070 ?auto_830074 ) ) ( not ( = ?auto_830070 ?auto_830075 ) ) ( not ( = ?auto_830070 ?auto_830076 ) ) ( not ( = ?auto_830070 ?auto_830077 ) ) ( not ( = ?auto_830070 ?auto_830078 ) ) ( not ( = ?auto_830070 ?auto_830079 ) ) ( not ( = ?auto_830070 ?auto_830080 ) ) ( not ( = ?auto_830071 ?auto_830072 ) ) ( not ( = ?auto_830071 ?auto_830073 ) ) ( not ( = ?auto_830071 ?auto_830074 ) ) ( not ( = ?auto_830071 ?auto_830075 ) ) ( not ( = ?auto_830071 ?auto_830076 ) ) ( not ( = ?auto_830071 ?auto_830077 ) ) ( not ( = ?auto_830071 ?auto_830078 ) ) ( not ( = ?auto_830071 ?auto_830079 ) ) ( not ( = ?auto_830071 ?auto_830080 ) ) ( not ( = ?auto_830072 ?auto_830073 ) ) ( not ( = ?auto_830072 ?auto_830074 ) ) ( not ( = ?auto_830072 ?auto_830075 ) ) ( not ( = ?auto_830072 ?auto_830076 ) ) ( not ( = ?auto_830072 ?auto_830077 ) ) ( not ( = ?auto_830072 ?auto_830078 ) ) ( not ( = ?auto_830072 ?auto_830079 ) ) ( not ( = ?auto_830072 ?auto_830080 ) ) ( not ( = ?auto_830073 ?auto_830074 ) ) ( not ( = ?auto_830073 ?auto_830075 ) ) ( not ( = ?auto_830073 ?auto_830076 ) ) ( not ( = ?auto_830073 ?auto_830077 ) ) ( not ( = ?auto_830073 ?auto_830078 ) ) ( not ( = ?auto_830073 ?auto_830079 ) ) ( not ( = ?auto_830073 ?auto_830080 ) ) ( not ( = ?auto_830074 ?auto_830075 ) ) ( not ( = ?auto_830074 ?auto_830076 ) ) ( not ( = ?auto_830074 ?auto_830077 ) ) ( not ( = ?auto_830074 ?auto_830078 ) ) ( not ( = ?auto_830074 ?auto_830079 ) ) ( not ( = ?auto_830074 ?auto_830080 ) ) ( not ( = ?auto_830075 ?auto_830076 ) ) ( not ( = ?auto_830075 ?auto_830077 ) ) ( not ( = ?auto_830075 ?auto_830078 ) ) ( not ( = ?auto_830075 ?auto_830079 ) ) ( not ( = ?auto_830075 ?auto_830080 ) ) ( not ( = ?auto_830076 ?auto_830077 ) ) ( not ( = ?auto_830076 ?auto_830078 ) ) ( not ( = ?auto_830076 ?auto_830079 ) ) ( not ( = ?auto_830076 ?auto_830080 ) ) ( not ( = ?auto_830077 ?auto_830078 ) ) ( not ( = ?auto_830077 ?auto_830079 ) ) ( not ( = ?auto_830077 ?auto_830080 ) ) ( not ( = ?auto_830078 ?auto_830079 ) ) ( not ( = ?auto_830078 ?auto_830080 ) ) ( not ( = ?auto_830079 ?auto_830080 ) ) ( ON ?auto_830078 ?auto_830079 ) ( ON ?auto_830077 ?auto_830078 ) ( ON ?auto_830076 ?auto_830077 ) ( ON ?auto_830075 ?auto_830076 ) ( CLEAR ?auto_830073 ) ( ON ?auto_830074 ?auto_830075 ) ( CLEAR ?auto_830074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_830068 ?auto_830069 ?auto_830070 ?auto_830071 ?auto_830072 ?auto_830073 ?auto_830074 )
      ( MAKE-12PILE ?auto_830068 ?auto_830069 ?auto_830070 ?auto_830071 ?auto_830072 ?auto_830073 ?auto_830074 ?auto_830075 ?auto_830076 ?auto_830077 ?auto_830078 ?auto_830079 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_830118 - BLOCK
      ?auto_830119 - BLOCK
      ?auto_830120 - BLOCK
      ?auto_830121 - BLOCK
      ?auto_830122 - BLOCK
      ?auto_830123 - BLOCK
      ?auto_830124 - BLOCK
      ?auto_830125 - BLOCK
      ?auto_830126 - BLOCK
      ?auto_830127 - BLOCK
      ?auto_830128 - BLOCK
      ?auto_830129 - BLOCK
    )
    :vars
    (
      ?auto_830130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_830129 ?auto_830130 ) ( ON-TABLE ?auto_830118 ) ( ON ?auto_830119 ?auto_830118 ) ( ON ?auto_830120 ?auto_830119 ) ( ON ?auto_830121 ?auto_830120 ) ( ON ?auto_830122 ?auto_830121 ) ( not ( = ?auto_830118 ?auto_830119 ) ) ( not ( = ?auto_830118 ?auto_830120 ) ) ( not ( = ?auto_830118 ?auto_830121 ) ) ( not ( = ?auto_830118 ?auto_830122 ) ) ( not ( = ?auto_830118 ?auto_830123 ) ) ( not ( = ?auto_830118 ?auto_830124 ) ) ( not ( = ?auto_830118 ?auto_830125 ) ) ( not ( = ?auto_830118 ?auto_830126 ) ) ( not ( = ?auto_830118 ?auto_830127 ) ) ( not ( = ?auto_830118 ?auto_830128 ) ) ( not ( = ?auto_830118 ?auto_830129 ) ) ( not ( = ?auto_830118 ?auto_830130 ) ) ( not ( = ?auto_830119 ?auto_830120 ) ) ( not ( = ?auto_830119 ?auto_830121 ) ) ( not ( = ?auto_830119 ?auto_830122 ) ) ( not ( = ?auto_830119 ?auto_830123 ) ) ( not ( = ?auto_830119 ?auto_830124 ) ) ( not ( = ?auto_830119 ?auto_830125 ) ) ( not ( = ?auto_830119 ?auto_830126 ) ) ( not ( = ?auto_830119 ?auto_830127 ) ) ( not ( = ?auto_830119 ?auto_830128 ) ) ( not ( = ?auto_830119 ?auto_830129 ) ) ( not ( = ?auto_830119 ?auto_830130 ) ) ( not ( = ?auto_830120 ?auto_830121 ) ) ( not ( = ?auto_830120 ?auto_830122 ) ) ( not ( = ?auto_830120 ?auto_830123 ) ) ( not ( = ?auto_830120 ?auto_830124 ) ) ( not ( = ?auto_830120 ?auto_830125 ) ) ( not ( = ?auto_830120 ?auto_830126 ) ) ( not ( = ?auto_830120 ?auto_830127 ) ) ( not ( = ?auto_830120 ?auto_830128 ) ) ( not ( = ?auto_830120 ?auto_830129 ) ) ( not ( = ?auto_830120 ?auto_830130 ) ) ( not ( = ?auto_830121 ?auto_830122 ) ) ( not ( = ?auto_830121 ?auto_830123 ) ) ( not ( = ?auto_830121 ?auto_830124 ) ) ( not ( = ?auto_830121 ?auto_830125 ) ) ( not ( = ?auto_830121 ?auto_830126 ) ) ( not ( = ?auto_830121 ?auto_830127 ) ) ( not ( = ?auto_830121 ?auto_830128 ) ) ( not ( = ?auto_830121 ?auto_830129 ) ) ( not ( = ?auto_830121 ?auto_830130 ) ) ( not ( = ?auto_830122 ?auto_830123 ) ) ( not ( = ?auto_830122 ?auto_830124 ) ) ( not ( = ?auto_830122 ?auto_830125 ) ) ( not ( = ?auto_830122 ?auto_830126 ) ) ( not ( = ?auto_830122 ?auto_830127 ) ) ( not ( = ?auto_830122 ?auto_830128 ) ) ( not ( = ?auto_830122 ?auto_830129 ) ) ( not ( = ?auto_830122 ?auto_830130 ) ) ( not ( = ?auto_830123 ?auto_830124 ) ) ( not ( = ?auto_830123 ?auto_830125 ) ) ( not ( = ?auto_830123 ?auto_830126 ) ) ( not ( = ?auto_830123 ?auto_830127 ) ) ( not ( = ?auto_830123 ?auto_830128 ) ) ( not ( = ?auto_830123 ?auto_830129 ) ) ( not ( = ?auto_830123 ?auto_830130 ) ) ( not ( = ?auto_830124 ?auto_830125 ) ) ( not ( = ?auto_830124 ?auto_830126 ) ) ( not ( = ?auto_830124 ?auto_830127 ) ) ( not ( = ?auto_830124 ?auto_830128 ) ) ( not ( = ?auto_830124 ?auto_830129 ) ) ( not ( = ?auto_830124 ?auto_830130 ) ) ( not ( = ?auto_830125 ?auto_830126 ) ) ( not ( = ?auto_830125 ?auto_830127 ) ) ( not ( = ?auto_830125 ?auto_830128 ) ) ( not ( = ?auto_830125 ?auto_830129 ) ) ( not ( = ?auto_830125 ?auto_830130 ) ) ( not ( = ?auto_830126 ?auto_830127 ) ) ( not ( = ?auto_830126 ?auto_830128 ) ) ( not ( = ?auto_830126 ?auto_830129 ) ) ( not ( = ?auto_830126 ?auto_830130 ) ) ( not ( = ?auto_830127 ?auto_830128 ) ) ( not ( = ?auto_830127 ?auto_830129 ) ) ( not ( = ?auto_830127 ?auto_830130 ) ) ( not ( = ?auto_830128 ?auto_830129 ) ) ( not ( = ?auto_830128 ?auto_830130 ) ) ( not ( = ?auto_830129 ?auto_830130 ) ) ( ON ?auto_830128 ?auto_830129 ) ( ON ?auto_830127 ?auto_830128 ) ( ON ?auto_830126 ?auto_830127 ) ( ON ?auto_830125 ?auto_830126 ) ( ON ?auto_830124 ?auto_830125 ) ( CLEAR ?auto_830122 ) ( ON ?auto_830123 ?auto_830124 ) ( CLEAR ?auto_830123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_830118 ?auto_830119 ?auto_830120 ?auto_830121 ?auto_830122 ?auto_830123 )
      ( MAKE-12PILE ?auto_830118 ?auto_830119 ?auto_830120 ?auto_830121 ?auto_830122 ?auto_830123 ?auto_830124 ?auto_830125 ?auto_830126 ?auto_830127 ?auto_830128 ?auto_830129 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_830168 - BLOCK
      ?auto_830169 - BLOCK
      ?auto_830170 - BLOCK
      ?auto_830171 - BLOCK
      ?auto_830172 - BLOCK
      ?auto_830173 - BLOCK
      ?auto_830174 - BLOCK
      ?auto_830175 - BLOCK
      ?auto_830176 - BLOCK
      ?auto_830177 - BLOCK
      ?auto_830178 - BLOCK
      ?auto_830179 - BLOCK
    )
    :vars
    (
      ?auto_830180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_830179 ?auto_830180 ) ( ON-TABLE ?auto_830168 ) ( ON ?auto_830169 ?auto_830168 ) ( ON ?auto_830170 ?auto_830169 ) ( ON ?auto_830171 ?auto_830170 ) ( not ( = ?auto_830168 ?auto_830169 ) ) ( not ( = ?auto_830168 ?auto_830170 ) ) ( not ( = ?auto_830168 ?auto_830171 ) ) ( not ( = ?auto_830168 ?auto_830172 ) ) ( not ( = ?auto_830168 ?auto_830173 ) ) ( not ( = ?auto_830168 ?auto_830174 ) ) ( not ( = ?auto_830168 ?auto_830175 ) ) ( not ( = ?auto_830168 ?auto_830176 ) ) ( not ( = ?auto_830168 ?auto_830177 ) ) ( not ( = ?auto_830168 ?auto_830178 ) ) ( not ( = ?auto_830168 ?auto_830179 ) ) ( not ( = ?auto_830168 ?auto_830180 ) ) ( not ( = ?auto_830169 ?auto_830170 ) ) ( not ( = ?auto_830169 ?auto_830171 ) ) ( not ( = ?auto_830169 ?auto_830172 ) ) ( not ( = ?auto_830169 ?auto_830173 ) ) ( not ( = ?auto_830169 ?auto_830174 ) ) ( not ( = ?auto_830169 ?auto_830175 ) ) ( not ( = ?auto_830169 ?auto_830176 ) ) ( not ( = ?auto_830169 ?auto_830177 ) ) ( not ( = ?auto_830169 ?auto_830178 ) ) ( not ( = ?auto_830169 ?auto_830179 ) ) ( not ( = ?auto_830169 ?auto_830180 ) ) ( not ( = ?auto_830170 ?auto_830171 ) ) ( not ( = ?auto_830170 ?auto_830172 ) ) ( not ( = ?auto_830170 ?auto_830173 ) ) ( not ( = ?auto_830170 ?auto_830174 ) ) ( not ( = ?auto_830170 ?auto_830175 ) ) ( not ( = ?auto_830170 ?auto_830176 ) ) ( not ( = ?auto_830170 ?auto_830177 ) ) ( not ( = ?auto_830170 ?auto_830178 ) ) ( not ( = ?auto_830170 ?auto_830179 ) ) ( not ( = ?auto_830170 ?auto_830180 ) ) ( not ( = ?auto_830171 ?auto_830172 ) ) ( not ( = ?auto_830171 ?auto_830173 ) ) ( not ( = ?auto_830171 ?auto_830174 ) ) ( not ( = ?auto_830171 ?auto_830175 ) ) ( not ( = ?auto_830171 ?auto_830176 ) ) ( not ( = ?auto_830171 ?auto_830177 ) ) ( not ( = ?auto_830171 ?auto_830178 ) ) ( not ( = ?auto_830171 ?auto_830179 ) ) ( not ( = ?auto_830171 ?auto_830180 ) ) ( not ( = ?auto_830172 ?auto_830173 ) ) ( not ( = ?auto_830172 ?auto_830174 ) ) ( not ( = ?auto_830172 ?auto_830175 ) ) ( not ( = ?auto_830172 ?auto_830176 ) ) ( not ( = ?auto_830172 ?auto_830177 ) ) ( not ( = ?auto_830172 ?auto_830178 ) ) ( not ( = ?auto_830172 ?auto_830179 ) ) ( not ( = ?auto_830172 ?auto_830180 ) ) ( not ( = ?auto_830173 ?auto_830174 ) ) ( not ( = ?auto_830173 ?auto_830175 ) ) ( not ( = ?auto_830173 ?auto_830176 ) ) ( not ( = ?auto_830173 ?auto_830177 ) ) ( not ( = ?auto_830173 ?auto_830178 ) ) ( not ( = ?auto_830173 ?auto_830179 ) ) ( not ( = ?auto_830173 ?auto_830180 ) ) ( not ( = ?auto_830174 ?auto_830175 ) ) ( not ( = ?auto_830174 ?auto_830176 ) ) ( not ( = ?auto_830174 ?auto_830177 ) ) ( not ( = ?auto_830174 ?auto_830178 ) ) ( not ( = ?auto_830174 ?auto_830179 ) ) ( not ( = ?auto_830174 ?auto_830180 ) ) ( not ( = ?auto_830175 ?auto_830176 ) ) ( not ( = ?auto_830175 ?auto_830177 ) ) ( not ( = ?auto_830175 ?auto_830178 ) ) ( not ( = ?auto_830175 ?auto_830179 ) ) ( not ( = ?auto_830175 ?auto_830180 ) ) ( not ( = ?auto_830176 ?auto_830177 ) ) ( not ( = ?auto_830176 ?auto_830178 ) ) ( not ( = ?auto_830176 ?auto_830179 ) ) ( not ( = ?auto_830176 ?auto_830180 ) ) ( not ( = ?auto_830177 ?auto_830178 ) ) ( not ( = ?auto_830177 ?auto_830179 ) ) ( not ( = ?auto_830177 ?auto_830180 ) ) ( not ( = ?auto_830178 ?auto_830179 ) ) ( not ( = ?auto_830178 ?auto_830180 ) ) ( not ( = ?auto_830179 ?auto_830180 ) ) ( ON ?auto_830178 ?auto_830179 ) ( ON ?auto_830177 ?auto_830178 ) ( ON ?auto_830176 ?auto_830177 ) ( ON ?auto_830175 ?auto_830176 ) ( ON ?auto_830174 ?auto_830175 ) ( ON ?auto_830173 ?auto_830174 ) ( CLEAR ?auto_830171 ) ( ON ?auto_830172 ?auto_830173 ) ( CLEAR ?auto_830172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_830168 ?auto_830169 ?auto_830170 ?auto_830171 ?auto_830172 )
      ( MAKE-12PILE ?auto_830168 ?auto_830169 ?auto_830170 ?auto_830171 ?auto_830172 ?auto_830173 ?auto_830174 ?auto_830175 ?auto_830176 ?auto_830177 ?auto_830178 ?auto_830179 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_830218 - BLOCK
      ?auto_830219 - BLOCK
      ?auto_830220 - BLOCK
      ?auto_830221 - BLOCK
      ?auto_830222 - BLOCK
      ?auto_830223 - BLOCK
      ?auto_830224 - BLOCK
      ?auto_830225 - BLOCK
      ?auto_830226 - BLOCK
      ?auto_830227 - BLOCK
      ?auto_830228 - BLOCK
      ?auto_830229 - BLOCK
    )
    :vars
    (
      ?auto_830230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_830229 ?auto_830230 ) ( ON-TABLE ?auto_830218 ) ( ON ?auto_830219 ?auto_830218 ) ( ON ?auto_830220 ?auto_830219 ) ( not ( = ?auto_830218 ?auto_830219 ) ) ( not ( = ?auto_830218 ?auto_830220 ) ) ( not ( = ?auto_830218 ?auto_830221 ) ) ( not ( = ?auto_830218 ?auto_830222 ) ) ( not ( = ?auto_830218 ?auto_830223 ) ) ( not ( = ?auto_830218 ?auto_830224 ) ) ( not ( = ?auto_830218 ?auto_830225 ) ) ( not ( = ?auto_830218 ?auto_830226 ) ) ( not ( = ?auto_830218 ?auto_830227 ) ) ( not ( = ?auto_830218 ?auto_830228 ) ) ( not ( = ?auto_830218 ?auto_830229 ) ) ( not ( = ?auto_830218 ?auto_830230 ) ) ( not ( = ?auto_830219 ?auto_830220 ) ) ( not ( = ?auto_830219 ?auto_830221 ) ) ( not ( = ?auto_830219 ?auto_830222 ) ) ( not ( = ?auto_830219 ?auto_830223 ) ) ( not ( = ?auto_830219 ?auto_830224 ) ) ( not ( = ?auto_830219 ?auto_830225 ) ) ( not ( = ?auto_830219 ?auto_830226 ) ) ( not ( = ?auto_830219 ?auto_830227 ) ) ( not ( = ?auto_830219 ?auto_830228 ) ) ( not ( = ?auto_830219 ?auto_830229 ) ) ( not ( = ?auto_830219 ?auto_830230 ) ) ( not ( = ?auto_830220 ?auto_830221 ) ) ( not ( = ?auto_830220 ?auto_830222 ) ) ( not ( = ?auto_830220 ?auto_830223 ) ) ( not ( = ?auto_830220 ?auto_830224 ) ) ( not ( = ?auto_830220 ?auto_830225 ) ) ( not ( = ?auto_830220 ?auto_830226 ) ) ( not ( = ?auto_830220 ?auto_830227 ) ) ( not ( = ?auto_830220 ?auto_830228 ) ) ( not ( = ?auto_830220 ?auto_830229 ) ) ( not ( = ?auto_830220 ?auto_830230 ) ) ( not ( = ?auto_830221 ?auto_830222 ) ) ( not ( = ?auto_830221 ?auto_830223 ) ) ( not ( = ?auto_830221 ?auto_830224 ) ) ( not ( = ?auto_830221 ?auto_830225 ) ) ( not ( = ?auto_830221 ?auto_830226 ) ) ( not ( = ?auto_830221 ?auto_830227 ) ) ( not ( = ?auto_830221 ?auto_830228 ) ) ( not ( = ?auto_830221 ?auto_830229 ) ) ( not ( = ?auto_830221 ?auto_830230 ) ) ( not ( = ?auto_830222 ?auto_830223 ) ) ( not ( = ?auto_830222 ?auto_830224 ) ) ( not ( = ?auto_830222 ?auto_830225 ) ) ( not ( = ?auto_830222 ?auto_830226 ) ) ( not ( = ?auto_830222 ?auto_830227 ) ) ( not ( = ?auto_830222 ?auto_830228 ) ) ( not ( = ?auto_830222 ?auto_830229 ) ) ( not ( = ?auto_830222 ?auto_830230 ) ) ( not ( = ?auto_830223 ?auto_830224 ) ) ( not ( = ?auto_830223 ?auto_830225 ) ) ( not ( = ?auto_830223 ?auto_830226 ) ) ( not ( = ?auto_830223 ?auto_830227 ) ) ( not ( = ?auto_830223 ?auto_830228 ) ) ( not ( = ?auto_830223 ?auto_830229 ) ) ( not ( = ?auto_830223 ?auto_830230 ) ) ( not ( = ?auto_830224 ?auto_830225 ) ) ( not ( = ?auto_830224 ?auto_830226 ) ) ( not ( = ?auto_830224 ?auto_830227 ) ) ( not ( = ?auto_830224 ?auto_830228 ) ) ( not ( = ?auto_830224 ?auto_830229 ) ) ( not ( = ?auto_830224 ?auto_830230 ) ) ( not ( = ?auto_830225 ?auto_830226 ) ) ( not ( = ?auto_830225 ?auto_830227 ) ) ( not ( = ?auto_830225 ?auto_830228 ) ) ( not ( = ?auto_830225 ?auto_830229 ) ) ( not ( = ?auto_830225 ?auto_830230 ) ) ( not ( = ?auto_830226 ?auto_830227 ) ) ( not ( = ?auto_830226 ?auto_830228 ) ) ( not ( = ?auto_830226 ?auto_830229 ) ) ( not ( = ?auto_830226 ?auto_830230 ) ) ( not ( = ?auto_830227 ?auto_830228 ) ) ( not ( = ?auto_830227 ?auto_830229 ) ) ( not ( = ?auto_830227 ?auto_830230 ) ) ( not ( = ?auto_830228 ?auto_830229 ) ) ( not ( = ?auto_830228 ?auto_830230 ) ) ( not ( = ?auto_830229 ?auto_830230 ) ) ( ON ?auto_830228 ?auto_830229 ) ( ON ?auto_830227 ?auto_830228 ) ( ON ?auto_830226 ?auto_830227 ) ( ON ?auto_830225 ?auto_830226 ) ( ON ?auto_830224 ?auto_830225 ) ( ON ?auto_830223 ?auto_830224 ) ( ON ?auto_830222 ?auto_830223 ) ( CLEAR ?auto_830220 ) ( ON ?auto_830221 ?auto_830222 ) ( CLEAR ?auto_830221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_830218 ?auto_830219 ?auto_830220 ?auto_830221 )
      ( MAKE-12PILE ?auto_830218 ?auto_830219 ?auto_830220 ?auto_830221 ?auto_830222 ?auto_830223 ?auto_830224 ?auto_830225 ?auto_830226 ?auto_830227 ?auto_830228 ?auto_830229 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_830268 - BLOCK
      ?auto_830269 - BLOCK
      ?auto_830270 - BLOCK
      ?auto_830271 - BLOCK
      ?auto_830272 - BLOCK
      ?auto_830273 - BLOCK
      ?auto_830274 - BLOCK
      ?auto_830275 - BLOCK
      ?auto_830276 - BLOCK
      ?auto_830277 - BLOCK
      ?auto_830278 - BLOCK
      ?auto_830279 - BLOCK
    )
    :vars
    (
      ?auto_830280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_830279 ?auto_830280 ) ( ON-TABLE ?auto_830268 ) ( ON ?auto_830269 ?auto_830268 ) ( not ( = ?auto_830268 ?auto_830269 ) ) ( not ( = ?auto_830268 ?auto_830270 ) ) ( not ( = ?auto_830268 ?auto_830271 ) ) ( not ( = ?auto_830268 ?auto_830272 ) ) ( not ( = ?auto_830268 ?auto_830273 ) ) ( not ( = ?auto_830268 ?auto_830274 ) ) ( not ( = ?auto_830268 ?auto_830275 ) ) ( not ( = ?auto_830268 ?auto_830276 ) ) ( not ( = ?auto_830268 ?auto_830277 ) ) ( not ( = ?auto_830268 ?auto_830278 ) ) ( not ( = ?auto_830268 ?auto_830279 ) ) ( not ( = ?auto_830268 ?auto_830280 ) ) ( not ( = ?auto_830269 ?auto_830270 ) ) ( not ( = ?auto_830269 ?auto_830271 ) ) ( not ( = ?auto_830269 ?auto_830272 ) ) ( not ( = ?auto_830269 ?auto_830273 ) ) ( not ( = ?auto_830269 ?auto_830274 ) ) ( not ( = ?auto_830269 ?auto_830275 ) ) ( not ( = ?auto_830269 ?auto_830276 ) ) ( not ( = ?auto_830269 ?auto_830277 ) ) ( not ( = ?auto_830269 ?auto_830278 ) ) ( not ( = ?auto_830269 ?auto_830279 ) ) ( not ( = ?auto_830269 ?auto_830280 ) ) ( not ( = ?auto_830270 ?auto_830271 ) ) ( not ( = ?auto_830270 ?auto_830272 ) ) ( not ( = ?auto_830270 ?auto_830273 ) ) ( not ( = ?auto_830270 ?auto_830274 ) ) ( not ( = ?auto_830270 ?auto_830275 ) ) ( not ( = ?auto_830270 ?auto_830276 ) ) ( not ( = ?auto_830270 ?auto_830277 ) ) ( not ( = ?auto_830270 ?auto_830278 ) ) ( not ( = ?auto_830270 ?auto_830279 ) ) ( not ( = ?auto_830270 ?auto_830280 ) ) ( not ( = ?auto_830271 ?auto_830272 ) ) ( not ( = ?auto_830271 ?auto_830273 ) ) ( not ( = ?auto_830271 ?auto_830274 ) ) ( not ( = ?auto_830271 ?auto_830275 ) ) ( not ( = ?auto_830271 ?auto_830276 ) ) ( not ( = ?auto_830271 ?auto_830277 ) ) ( not ( = ?auto_830271 ?auto_830278 ) ) ( not ( = ?auto_830271 ?auto_830279 ) ) ( not ( = ?auto_830271 ?auto_830280 ) ) ( not ( = ?auto_830272 ?auto_830273 ) ) ( not ( = ?auto_830272 ?auto_830274 ) ) ( not ( = ?auto_830272 ?auto_830275 ) ) ( not ( = ?auto_830272 ?auto_830276 ) ) ( not ( = ?auto_830272 ?auto_830277 ) ) ( not ( = ?auto_830272 ?auto_830278 ) ) ( not ( = ?auto_830272 ?auto_830279 ) ) ( not ( = ?auto_830272 ?auto_830280 ) ) ( not ( = ?auto_830273 ?auto_830274 ) ) ( not ( = ?auto_830273 ?auto_830275 ) ) ( not ( = ?auto_830273 ?auto_830276 ) ) ( not ( = ?auto_830273 ?auto_830277 ) ) ( not ( = ?auto_830273 ?auto_830278 ) ) ( not ( = ?auto_830273 ?auto_830279 ) ) ( not ( = ?auto_830273 ?auto_830280 ) ) ( not ( = ?auto_830274 ?auto_830275 ) ) ( not ( = ?auto_830274 ?auto_830276 ) ) ( not ( = ?auto_830274 ?auto_830277 ) ) ( not ( = ?auto_830274 ?auto_830278 ) ) ( not ( = ?auto_830274 ?auto_830279 ) ) ( not ( = ?auto_830274 ?auto_830280 ) ) ( not ( = ?auto_830275 ?auto_830276 ) ) ( not ( = ?auto_830275 ?auto_830277 ) ) ( not ( = ?auto_830275 ?auto_830278 ) ) ( not ( = ?auto_830275 ?auto_830279 ) ) ( not ( = ?auto_830275 ?auto_830280 ) ) ( not ( = ?auto_830276 ?auto_830277 ) ) ( not ( = ?auto_830276 ?auto_830278 ) ) ( not ( = ?auto_830276 ?auto_830279 ) ) ( not ( = ?auto_830276 ?auto_830280 ) ) ( not ( = ?auto_830277 ?auto_830278 ) ) ( not ( = ?auto_830277 ?auto_830279 ) ) ( not ( = ?auto_830277 ?auto_830280 ) ) ( not ( = ?auto_830278 ?auto_830279 ) ) ( not ( = ?auto_830278 ?auto_830280 ) ) ( not ( = ?auto_830279 ?auto_830280 ) ) ( ON ?auto_830278 ?auto_830279 ) ( ON ?auto_830277 ?auto_830278 ) ( ON ?auto_830276 ?auto_830277 ) ( ON ?auto_830275 ?auto_830276 ) ( ON ?auto_830274 ?auto_830275 ) ( ON ?auto_830273 ?auto_830274 ) ( ON ?auto_830272 ?auto_830273 ) ( ON ?auto_830271 ?auto_830272 ) ( CLEAR ?auto_830269 ) ( ON ?auto_830270 ?auto_830271 ) ( CLEAR ?auto_830270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_830268 ?auto_830269 ?auto_830270 )
      ( MAKE-12PILE ?auto_830268 ?auto_830269 ?auto_830270 ?auto_830271 ?auto_830272 ?auto_830273 ?auto_830274 ?auto_830275 ?auto_830276 ?auto_830277 ?auto_830278 ?auto_830279 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_830318 - BLOCK
      ?auto_830319 - BLOCK
      ?auto_830320 - BLOCK
      ?auto_830321 - BLOCK
      ?auto_830322 - BLOCK
      ?auto_830323 - BLOCK
      ?auto_830324 - BLOCK
      ?auto_830325 - BLOCK
      ?auto_830326 - BLOCK
      ?auto_830327 - BLOCK
      ?auto_830328 - BLOCK
      ?auto_830329 - BLOCK
    )
    :vars
    (
      ?auto_830330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_830329 ?auto_830330 ) ( ON-TABLE ?auto_830318 ) ( not ( = ?auto_830318 ?auto_830319 ) ) ( not ( = ?auto_830318 ?auto_830320 ) ) ( not ( = ?auto_830318 ?auto_830321 ) ) ( not ( = ?auto_830318 ?auto_830322 ) ) ( not ( = ?auto_830318 ?auto_830323 ) ) ( not ( = ?auto_830318 ?auto_830324 ) ) ( not ( = ?auto_830318 ?auto_830325 ) ) ( not ( = ?auto_830318 ?auto_830326 ) ) ( not ( = ?auto_830318 ?auto_830327 ) ) ( not ( = ?auto_830318 ?auto_830328 ) ) ( not ( = ?auto_830318 ?auto_830329 ) ) ( not ( = ?auto_830318 ?auto_830330 ) ) ( not ( = ?auto_830319 ?auto_830320 ) ) ( not ( = ?auto_830319 ?auto_830321 ) ) ( not ( = ?auto_830319 ?auto_830322 ) ) ( not ( = ?auto_830319 ?auto_830323 ) ) ( not ( = ?auto_830319 ?auto_830324 ) ) ( not ( = ?auto_830319 ?auto_830325 ) ) ( not ( = ?auto_830319 ?auto_830326 ) ) ( not ( = ?auto_830319 ?auto_830327 ) ) ( not ( = ?auto_830319 ?auto_830328 ) ) ( not ( = ?auto_830319 ?auto_830329 ) ) ( not ( = ?auto_830319 ?auto_830330 ) ) ( not ( = ?auto_830320 ?auto_830321 ) ) ( not ( = ?auto_830320 ?auto_830322 ) ) ( not ( = ?auto_830320 ?auto_830323 ) ) ( not ( = ?auto_830320 ?auto_830324 ) ) ( not ( = ?auto_830320 ?auto_830325 ) ) ( not ( = ?auto_830320 ?auto_830326 ) ) ( not ( = ?auto_830320 ?auto_830327 ) ) ( not ( = ?auto_830320 ?auto_830328 ) ) ( not ( = ?auto_830320 ?auto_830329 ) ) ( not ( = ?auto_830320 ?auto_830330 ) ) ( not ( = ?auto_830321 ?auto_830322 ) ) ( not ( = ?auto_830321 ?auto_830323 ) ) ( not ( = ?auto_830321 ?auto_830324 ) ) ( not ( = ?auto_830321 ?auto_830325 ) ) ( not ( = ?auto_830321 ?auto_830326 ) ) ( not ( = ?auto_830321 ?auto_830327 ) ) ( not ( = ?auto_830321 ?auto_830328 ) ) ( not ( = ?auto_830321 ?auto_830329 ) ) ( not ( = ?auto_830321 ?auto_830330 ) ) ( not ( = ?auto_830322 ?auto_830323 ) ) ( not ( = ?auto_830322 ?auto_830324 ) ) ( not ( = ?auto_830322 ?auto_830325 ) ) ( not ( = ?auto_830322 ?auto_830326 ) ) ( not ( = ?auto_830322 ?auto_830327 ) ) ( not ( = ?auto_830322 ?auto_830328 ) ) ( not ( = ?auto_830322 ?auto_830329 ) ) ( not ( = ?auto_830322 ?auto_830330 ) ) ( not ( = ?auto_830323 ?auto_830324 ) ) ( not ( = ?auto_830323 ?auto_830325 ) ) ( not ( = ?auto_830323 ?auto_830326 ) ) ( not ( = ?auto_830323 ?auto_830327 ) ) ( not ( = ?auto_830323 ?auto_830328 ) ) ( not ( = ?auto_830323 ?auto_830329 ) ) ( not ( = ?auto_830323 ?auto_830330 ) ) ( not ( = ?auto_830324 ?auto_830325 ) ) ( not ( = ?auto_830324 ?auto_830326 ) ) ( not ( = ?auto_830324 ?auto_830327 ) ) ( not ( = ?auto_830324 ?auto_830328 ) ) ( not ( = ?auto_830324 ?auto_830329 ) ) ( not ( = ?auto_830324 ?auto_830330 ) ) ( not ( = ?auto_830325 ?auto_830326 ) ) ( not ( = ?auto_830325 ?auto_830327 ) ) ( not ( = ?auto_830325 ?auto_830328 ) ) ( not ( = ?auto_830325 ?auto_830329 ) ) ( not ( = ?auto_830325 ?auto_830330 ) ) ( not ( = ?auto_830326 ?auto_830327 ) ) ( not ( = ?auto_830326 ?auto_830328 ) ) ( not ( = ?auto_830326 ?auto_830329 ) ) ( not ( = ?auto_830326 ?auto_830330 ) ) ( not ( = ?auto_830327 ?auto_830328 ) ) ( not ( = ?auto_830327 ?auto_830329 ) ) ( not ( = ?auto_830327 ?auto_830330 ) ) ( not ( = ?auto_830328 ?auto_830329 ) ) ( not ( = ?auto_830328 ?auto_830330 ) ) ( not ( = ?auto_830329 ?auto_830330 ) ) ( ON ?auto_830328 ?auto_830329 ) ( ON ?auto_830327 ?auto_830328 ) ( ON ?auto_830326 ?auto_830327 ) ( ON ?auto_830325 ?auto_830326 ) ( ON ?auto_830324 ?auto_830325 ) ( ON ?auto_830323 ?auto_830324 ) ( ON ?auto_830322 ?auto_830323 ) ( ON ?auto_830321 ?auto_830322 ) ( ON ?auto_830320 ?auto_830321 ) ( CLEAR ?auto_830318 ) ( ON ?auto_830319 ?auto_830320 ) ( CLEAR ?auto_830319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_830318 ?auto_830319 )
      ( MAKE-12PILE ?auto_830318 ?auto_830319 ?auto_830320 ?auto_830321 ?auto_830322 ?auto_830323 ?auto_830324 ?auto_830325 ?auto_830326 ?auto_830327 ?auto_830328 ?auto_830329 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_830368 - BLOCK
      ?auto_830369 - BLOCK
      ?auto_830370 - BLOCK
      ?auto_830371 - BLOCK
      ?auto_830372 - BLOCK
      ?auto_830373 - BLOCK
      ?auto_830374 - BLOCK
      ?auto_830375 - BLOCK
      ?auto_830376 - BLOCK
      ?auto_830377 - BLOCK
      ?auto_830378 - BLOCK
      ?auto_830379 - BLOCK
    )
    :vars
    (
      ?auto_830380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_830379 ?auto_830380 ) ( not ( = ?auto_830368 ?auto_830369 ) ) ( not ( = ?auto_830368 ?auto_830370 ) ) ( not ( = ?auto_830368 ?auto_830371 ) ) ( not ( = ?auto_830368 ?auto_830372 ) ) ( not ( = ?auto_830368 ?auto_830373 ) ) ( not ( = ?auto_830368 ?auto_830374 ) ) ( not ( = ?auto_830368 ?auto_830375 ) ) ( not ( = ?auto_830368 ?auto_830376 ) ) ( not ( = ?auto_830368 ?auto_830377 ) ) ( not ( = ?auto_830368 ?auto_830378 ) ) ( not ( = ?auto_830368 ?auto_830379 ) ) ( not ( = ?auto_830368 ?auto_830380 ) ) ( not ( = ?auto_830369 ?auto_830370 ) ) ( not ( = ?auto_830369 ?auto_830371 ) ) ( not ( = ?auto_830369 ?auto_830372 ) ) ( not ( = ?auto_830369 ?auto_830373 ) ) ( not ( = ?auto_830369 ?auto_830374 ) ) ( not ( = ?auto_830369 ?auto_830375 ) ) ( not ( = ?auto_830369 ?auto_830376 ) ) ( not ( = ?auto_830369 ?auto_830377 ) ) ( not ( = ?auto_830369 ?auto_830378 ) ) ( not ( = ?auto_830369 ?auto_830379 ) ) ( not ( = ?auto_830369 ?auto_830380 ) ) ( not ( = ?auto_830370 ?auto_830371 ) ) ( not ( = ?auto_830370 ?auto_830372 ) ) ( not ( = ?auto_830370 ?auto_830373 ) ) ( not ( = ?auto_830370 ?auto_830374 ) ) ( not ( = ?auto_830370 ?auto_830375 ) ) ( not ( = ?auto_830370 ?auto_830376 ) ) ( not ( = ?auto_830370 ?auto_830377 ) ) ( not ( = ?auto_830370 ?auto_830378 ) ) ( not ( = ?auto_830370 ?auto_830379 ) ) ( not ( = ?auto_830370 ?auto_830380 ) ) ( not ( = ?auto_830371 ?auto_830372 ) ) ( not ( = ?auto_830371 ?auto_830373 ) ) ( not ( = ?auto_830371 ?auto_830374 ) ) ( not ( = ?auto_830371 ?auto_830375 ) ) ( not ( = ?auto_830371 ?auto_830376 ) ) ( not ( = ?auto_830371 ?auto_830377 ) ) ( not ( = ?auto_830371 ?auto_830378 ) ) ( not ( = ?auto_830371 ?auto_830379 ) ) ( not ( = ?auto_830371 ?auto_830380 ) ) ( not ( = ?auto_830372 ?auto_830373 ) ) ( not ( = ?auto_830372 ?auto_830374 ) ) ( not ( = ?auto_830372 ?auto_830375 ) ) ( not ( = ?auto_830372 ?auto_830376 ) ) ( not ( = ?auto_830372 ?auto_830377 ) ) ( not ( = ?auto_830372 ?auto_830378 ) ) ( not ( = ?auto_830372 ?auto_830379 ) ) ( not ( = ?auto_830372 ?auto_830380 ) ) ( not ( = ?auto_830373 ?auto_830374 ) ) ( not ( = ?auto_830373 ?auto_830375 ) ) ( not ( = ?auto_830373 ?auto_830376 ) ) ( not ( = ?auto_830373 ?auto_830377 ) ) ( not ( = ?auto_830373 ?auto_830378 ) ) ( not ( = ?auto_830373 ?auto_830379 ) ) ( not ( = ?auto_830373 ?auto_830380 ) ) ( not ( = ?auto_830374 ?auto_830375 ) ) ( not ( = ?auto_830374 ?auto_830376 ) ) ( not ( = ?auto_830374 ?auto_830377 ) ) ( not ( = ?auto_830374 ?auto_830378 ) ) ( not ( = ?auto_830374 ?auto_830379 ) ) ( not ( = ?auto_830374 ?auto_830380 ) ) ( not ( = ?auto_830375 ?auto_830376 ) ) ( not ( = ?auto_830375 ?auto_830377 ) ) ( not ( = ?auto_830375 ?auto_830378 ) ) ( not ( = ?auto_830375 ?auto_830379 ) ) ( not ( = ?auto_830375 ?auto_830380 ) ) ( not ( = ?auto_830376 ?auto_830377 ) ) ( not ( = ?auto_830376 ?auto_830378 ) ) ( not ( = ?auto_830376 ?auto_830379 ) ) ( not ( = ?auto_830376 ?auto_830380 ) ) ( not ( = ?auto_830377 ?auto_830378 ) ) ( not ( = ?auto_830377 ?auto_830379 ) ) ( not ( = ?auto_830377 ?auto_830380 ) ) ( not ( = ?auto_830378 ?auto_830379 ) ) ( not ( = ?auto_830378 ?auto_830380 ) ) ( not ( = ?auto_830379 ?auto_830380 ) ) ( ON ?auto_830378 ?auto_830379 ) ( ON ?auto_830377 ?auto_830378 ) ( ON ?auto_830376 ?auto_830377 ) ( ON ?auto_830375 ?auto_830376 ) ( ON ?auto_830374 ?auto_830375 ) ( ON ?auto_830373 ?auto_830374 ) ( ON ?auto_830372 ?auto_830373 ) ( ON ?auto_830371 ?auto_830372 ) ( ON ?auto_830370 ?auto_830371 ) ( ON ?auto_830369 ?auto_830370 ) ( ON ?auto_830368 ?auto_830369 ) ( CLEAR ?auto_830368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_830368 )
      ( MAKE-12PILE ?auto_830368 ?auto_830369 ?auto_830370 ?auto_830371 ?auto_830372 ?auto_830373 ?auto_830374 ?auto_830375 ?auto_830376 ?auto_830377 ?auto_830378 ?auto_830379 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_830419 - BLOCK
      ?auto_830420 - BLOCK
      ?auto_830421 - BLOCK
      ?auto_830422 - BLOCK
      ?auto_830423 - BLOCK
      ?auto_830424 - BLOCK
      ?auto_830425 - BLOCK
      ?auto_830426 - BLOCK
      ?auto_830427 - BLOCK
      ?auto_830428 - BLOCK
      ?auto_830429 - BLOCK
      ?auto_830430 - BLOCK
      ?auto_830431 - BLOCK
    )
    :vars
    (
      ?auto_830432 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_830430 ) ( ON ?auto_830431 ?auto_830432 ) ( CLEAR ?auto_830431 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_830419 ) ( ON ?auto_830420 ?auto_830419 ) ( ON ?auto_830421 ?auto_830420 ) ( ON ?auto_830422 ?auto_830421 ) ( ON ?auto_830423 ?auto_830422 ) ( ON ?auto_830424 ?auto_830423 ) ( ON ?auto_830425 ?auto_830424 ) ( ON ?auto_830426 ?auto_830425 ) ( ON ?auto_830427 ?auto_830426 ) ( ON ?auto_830428 ?auto_830427 ) ( ON ?auto_830429 ?auto_830428 ) ( ON ?auto_830430 ?auto_830429 ) ( not ( = ?auto_830419 ?auto_830420 ) ) ( not ( = ?auto_830419 ?auto_830421 ) ) ( not ( = ?auto_830419 ?auto_830422 ) ) ( not ( = ?auto_830419 ?auto_830423 ) ) ( not ( = ?auto_830419 ?auto_830424 ) ) ( not ( = ?auto_830419 ?auto_830425 ) ) ( not ( = ?auto_830419 ?auto_830426 ) ) ( not ( = ?auto_830419 ?auto_830427 ) ) ( not ( = ?auto_830419 ?auto_830428 ) ) ( not ( = ?auto_830419 ?auto_830429 ) ) ( not ( = ?auto_830419 ?auto_830430 ) ) ( not ( = ?auto_830419 ?auto_830431 ) ) ( not ( = ?auto_830419 ?auto_830432 ) ) ( not ( = ?auto_830420 ?auto_830421 ) ) ( not ( = ?auto_830420 ?auto_830422 ) ) ( not ( = ?auto_830420 ?auto_830423 ) ) ( not ( = ?auto_830420 ?auto_830424 ) ) ( not ( = ?auto_830420 ?auto_830425 ) ) ( not ( = ?auto_830420 ?auto_830426 ) ) ( not ( = ?auto_830420 ?auto_830427 ) ) ( not ( = ?auto_830420 ?auto_830428 ) ) ( not ( = ?auto_830420 ?auto_830429 ) ) ( not ( = ?auto_830420 ?auto_830430 ) ) ( not ( = ?auto_830420 ?auto_830431 ) ) ( not ( = ?auto_830420 ?auto_830432 ) ) ( not ( = ?auto_830421 ?auto_830422 ) ) ( not ( = ?auto_830421 ?auto_830423 ) ) ( not ( = ?auto_830421 ?auto_830424 ) ) ( not ( = ?auto_830421 ?auto_830425 ) ) ( not ( = ?auto_830421 ?auto_830426 ) ) ( not ( = ?auto_830421 ?auto_830427 ) ) ( not ( = ?auto_830421 ?auto_830428 ) ) ( not ( = ?auto_830421 ?auto_830429 ) ) ( not ( = ?auto_830421 ?auto_830430 ) ) ( not ( = ?auto_830421 ?auto_830431 ) ) ( not ( = ?auto_830421 ?auto_830432 ) ) ( not ( = ?auto_830422 ?auto_830423 ) ) ( not ( = ?auto_830422 ?auto_830424 ) ) ( not ( = ?auto_830422 ?auto_830425 ) ) ( not ( = ?auto_830422 ?auto_830426 ) ) ( not ( = ?auto_830422 ?auto_830427 ) ) ( not ( = ?auto_830422 ?auto_830428 ) ) ( not ( = ?auto_830422 ?auto_830429 ) ) ( not ( = ?auto_830422 ?auto_830430 ) ) ( not ( = ?auto_830422 ?auto_830431 ) ) ( not ( = ?auto_830422 ?auto_830432 ) ) ( not ( = ?auto_830423 ?auto_830424 ) ) ( not ( = ?auto_830423 ?auto_830425 ) ) ( not ( = ?auto_830423 ?auto_830426 ) ) ( not ( = ?auto_830423 ?auto_830427 ) ) ( not ( = ?auto_830423 ?auto_830428 ) ) ( not ( = ?auto_830423 ?auto_830429 ) ) ( not ( = ?auto_830423 ?auto_830430 ) ) ( not ( = ?auto_830423 ?auto_830431 ) ) ( not ( = ?auto_830423 ?auto_830432 ) ) ( not ( = ?auto_830424 ?auto_830425 ) ) ( not ( = ?auto_830424 ?auto_830426 ) ) ( not ( = ?auto_830424 ?auto_830427 ) ) ( not ( = ?auto_830424 ?auto_830428 ) ) ( not ( = ?auto_830424 ?auto_830429 ) ) ( not ( = ?auto_830424 ?auto_830430 ) ) ( not ( = ?auto_830424 ?auto_830431 ) ) ( not ( = ?auto_830424 ?auto_830432 ) ) ( not ( = ?auto_830425 ?auto_830426 ) ) ( not ( = ?auto_830425 ?auto_830427 ) ) ( not ( = ?auto_830425 ?auto_830428 ) ) ( not ( = ?auto_830425 ?auto_830429 ) ) ( not ( = ?auto_830425 ?auto_830430 ) ) ( not ( = ?auto_830425 ?auto_830431 ) ) ( not ( = ?auto_830425 ?auto_830432 ) ) ( not ( = ?auto_830426 ?auto_830427 ) ) ( not ( = ?auto_830426 ?auto_830428 ) ) ( not ( = ?auto_830426 ?auto_830429 ) ) ( not ( = ?auto_830426 ?auto_830430 ) ) ( not ( = ?auto_830426 ?auto_830431 ) ) ( not ( = ?auto_830426 ?auto_830432 ) ) ( not ( = ?auto_830427 ?auto_830428 ) ) ( not ( = ?auto_830427 ?auto_830429 ) ) ( not ( = ?auto_830427 ?auto_830430 ) ) ( not ( = ?auto_830427 ?auto_830431 ) ) ( not ( = ?auto_830427 ?auto_830432 ) ) ( not ( = ?auto_830428 ?auto_830429 ) ) ( not ( = ?auto_830428 ?auto_830430 ) ) ( not ( = ?auto_830428 ?auto_830431 ) ) ( not ( = ?auto_830428 ?auto_830432 ) ) ( not ( = ?auto_830429 ?auto_830430 ) ) ( not ( = ?auto_830429 ?auto_830431 ) ) ( not ( = ?auto_830429 ?auto_830432 ) ) ( not ( = ?auto_830430 ?auto_830431 ) ) ( not ( = ?auto_830430 ?auto_830432 ) ) ( not ( = ?auto_830431 ?auto_830432 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_830431 ?auto_830432 )
      ( !STACK ?auto_830431 ?auto_830430 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_830473 - BLOCK
      ?auto_830474 - BLOCK
      ?auto_830475 - BLOCK
      ?auto_830476 - BLOCK
      ?auto_830477 - BLOCK
      ?auto_830478 - BLOCK
      ?auto_830479 - BLOCK
      ?auto_830480 - BLOCK
      ?auto_830481 - BLOCK
      ?auto_830482 - BLOCK
      ?auto_830483 - BLOCK
      ?auto_830484 - BLOCK
      ?auto_830485 - BLOCK
    )
    :vars
    (
      ?auto_830486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_830485 ?auto_830486 ) ( ON-TABLE ?auto_830473 ) ( ON ?auto_830474 ?auto_830473 ) ( ON ?auto_830475 ?auto_830474 ) ( ON ?auto_830476 ?auto_830475 ) ( ON ?auto_830477 ?auto_830476 ) ( ON ?auto_830478 ?auto_830477 ) ( ON ?auto_830479 ?auto_830478 ) ( ON ?auto_830480 ?auto_830479 ) ( ON ?auto_830481 ?auto_830480 ) ( ON ?auto_830482 ?auto_830481 ) ( ON ?auto_830483 ?auto_830482 ) ( not ( = ?auto_830473 ?auto_830474 ) ) ( not ( = ?auto_830473 ?auto_830475 ) ) ( not ( = ?auto_830473 ?auto_830476 ) ) ( not ( = ?auto_830473 ?auto_830477 ) ) ( not ( = ?auto_830473 ?auto_830478 ) ) ( not ( = ?auto_830473 ?auto_830479 ) ) ( not ( = ?auto_830473 ?auto_830480 ) ) ( not ( = ?auto_830473 ?auto_830481 ) ) ( not ( = ?auto_830473 ?auto_830482 ) ) ( not ( = ?auto_830473 ?auto_830483 ) ) ( not ( = ?auto_830473 ?auto_830484 ) ) ( not ( = ?auto_830473 ?auto_830485 ) ) ( not ( = ?auto_830473 ?auto_830486 ) ) ( not ( = ?auto_830474 ?auto_830475 ) ) ( not ( = ?auto_830474 ?auto_830476 ) ) ( not ( = ?auto_830474 ?auto_830477 ) ) ( not ( = ?auto_830474 ?auto_830478 ) ) ( not ( = ?auto_830474 ?auto_830479 ) ) ( not ( = ?auto_830474 ?auto_830480 ) ) ( not ( = ?auto_830474 ?auto_830481 ) ) ( not ( = ?auto_830474 ?auto_830482 ) ) ( not ( = ?auto_830474 ?auto_830483 ) ) ( not ( = ?auto_830474 ?auto_830484 ) ) ( not ( = ?auto_830474 ?auto_830485 ) ) ( not ( = ?auto_830474 ?auto_830486 ) ) ( not ( = ?auto_830475 ?auto_830476 ) ) ( not ( = ?auto_830475 ?auto_830477 ) ) ( not ( = ?auto_830475 ?auto_830478 ) ) ( not ( = ?auto_830475 ?auto_830479 ) ) ( not ( = ?auto_830475 ?auto_830480 ) ) ( not ( = ?auto_830475 ?auto_830481 ) ) ( not ( = ?auto_830475 ?auto_830482 ) ) ( not ( = ?auto_830475 ?auto_830483 ) ) ( not ( = ?auto_830475 ?auto_830484 ) ) ( not ( = ?auto_830475 ?auto_830485 ) ) ( not ( = ?auto_830475 ?auto_830486 ) ) ( not ( = ?auto_830476 ?auto_830477 ) ) ( not ( = ?auto_830476 ?auto_830478 ) ) ( not ( = ?auto_830476 ?auto_830479 ) ) ( not ( = ?auto_830476 ?auto_830480 ) ) ( not ( = ?auto_830476 ?auto_830481 ) ) ( not ( = ?auto_830476 ?auto_830482 ) ) ( not ( = ?auto_830476 ?auto_830483 ) ) ( not ( = ?auto_830476 ?auto_830484 ) ) ( not ( = ?auto_830476 ?auto_830485 ) ) ( not ( = ?auto_830476 ?auto_830486 ) ) ( not ( = ?auto_830477 ?auto_830478 ) ) ( not ( = ?auto_830477 ?auto_830479 ) ) ( not ( = ?auto_830477 ?auto_830480 ) ) ( not ( = ?auto_830477 ?auto_830481 ) ) ( not ( = ?auto_830477 ?auto_830482 ) ) ( not ( = ?auto_830477 ?auto_830483 ) ) ( not ( = ?auto_830477 ?auto_830484 ) ) ( not ( = ?auto_830477 ?auto_830485 ) ) ( not ( = ?auto_830477 ?auto_830486 ) ) ( not ( = ?auto_830478 ?auto_830479 ) ) ( not ( = ?auto_830478 ?auto_830480 ) ) ( not ( = ?auto_830478 ?auto_830481 ) ) ( not ( = ?auto_830478 ?auto_830482 ) ) ( not ( = ?auto_830478 ?auto_830483 ) ) ( not ( = ?auto_830478 ?auto_830484 ) ) ( not ( = ?auto_830478 ?auto_830485 ) ) ( not ( = ?auto_830478 ?auto_830486 ) ) ( not ( = ?auto_830479 ?auto_830480 ) ) ( not ( = ?auto_830479 ?auto_830481 ) ) ( not ( = ?auto_830479 ?auto_830482 ) ) ( not ( = ?auto_830479 ?auto_830483 ) ) ( not ( = ?auto_830479 ?auto_830484 ) ) ( not ( = ?auto_830479 ?auto_830485 ) ) ( not ( = ?auto_830479 ?auto_830486 ) ) ( not ( = ?auto_830480 ?auto_830481 ) ) ( not ( = ?auto_830480 ?auto_830482 ) ) ( not ( = ?auto_830480 ?auto_830483 ) ) ( not ( = ?auto_830480 ?auto_830484 ) ) ( not ( = ?auto_830480 ?auto_830485 ) ) ( not ( = ?auto_830480 ?auto_830486 ) ) ( not ( = ?auto_830481 ?auto_830482 ) ) ( not ( = ?auto_830481 ?auto_830483 ) ) ( not ( = ?auto_830481 ?auto_830484 ) ) ( not ( = ?auto_830481 ?auto_830485 ) ) ( not ( = ?auto_830481 ?auto_830486 ) ) ( not ( = ?auto_830482 ?auto_830483 ) ) ( not ( = ?auto_830482 ?auto_830484 ) ) ( not ( = ?auto_830482 ?auto_830485 ) ) ( not ( = ?auto_830482 ?auto_830486 ) ) ( not ( = ?auto_830483 ?auto_830484 ) ) ( not ( = ?auto_830483 ?auto_830485 ) ) ( not ( = ?auto_830483 ?auto_830486 ) ) ( not ( = ?auto_830484 ?auto_830485 ) ) ( not ( = ?auto_830484 ?auto_830486 ) ) ( not ( = ?auto_830485 ?auto_830486 ) ) ( CLEAR ?auto_830483 ) ( ON ?auto_830484 ?auto_830485 ) ( CLEAR ?auto_830484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_830473 ?auto_830474 ?auto_830475 ?auto_830476 ?auto_830477 ?auto_830478 ?auto_830479 ?auto_830480 ?auto_830481 ?auto_830482 ?auto_830483 ?auto_830484 )
      ( MAKE-13PILE ?auto_830473 ?auto_830474 ?auto_830475 ?auto_830476 ?auto_830477 ?auto_830478 ?auto_830479 ?auto_830480 ?auto_830481 ?auto_830482 ?auto_830483 ?auto_830484 ?auto_830485 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_830527 - BLOCK
      ?auto_830528 - BLOCK
      ?auto_830529 - BLOCK
      ?auto_830530 - BLOCK
      ?auto_830531 - BLOCK
      ?auto_830532 - BLOCK
      ?auto_830533 - BLOCK
      ?auto_830534 - BLOCK
      ?auto_830535 - BLOCK
      ?auto_830536 - BLOCK
      ?auto_830537 - BLOCK
      ?auto_830538 - BLOCK
      ?auto_830539 - BLOCK
    )
    :vars
    (
      ?auto_830540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_830539 ?auto_830540 ) ( ON-TABLE ?auto_830527 ) ( ON ?auto_830528 ?auto_830527 ) ( ON ?auto_830529 ?auto_830528 ) ( ON ?auto_830530 ?auto_830529 ) ( ON ?auto_830531 ?auto_830530 ) ( ON ?auto_830532 ?auto_830531 ) ( ON ?auto_830533 ?auto_830532 ) ( ON ?auto_830534 ?auto_830533 ) ( ON ?auto_830535 ?auto_830534 ) ( ON ?auto_830536 ?auto_830535 ) ( not ( = ?auto_830527 ?auto_830528 ) ) ( not ( = ?auto_830527 ?auto_830529 ) ) ( not ( = ?auto_830527 ?auto_830530 ) ) ( not ( = ?auto_830527 ?auto_830531 ) ) ( not ( = ?auto_830527 ?auto_830532 ) ) ( not ( = ?auto_830527 ?auto_830533 ) ) ( not ( = ?auto_830527 ?auto_830534 ) ) ( not ( = ?auto_830527 ?auto_830535 ) ) ( not ( = ?auto_830527 ?auto_830536 ) ) ( not ( = ?auto_830527 ?auto_830537 ) ) ( not ( = ?auto_830527 ?auto_830538 ) ) ( not ( = ?auto_830527 ?auto_830539 ) ) ( not ( = ?auto_830527 ?auto_830540 ) ) ( not ( = ?auto_830528 ?auto_830529 ) ) ( not ( = ?auto_830528 ?auto_830530 ) ) ( not ( = ?auto_830528 ?auto_830531 ) ) ( not ( = ?auto_830528 ?auto_830532 ) ) ( not ( = ?auto_830528 ?auto_830533 ) ) ( not ( = ?auto_830528 ?auto_830534 ) ) ( not ( = ?auto_830528 ?auto_830535 ) ) ( not ( = ?auto_830528 ?auto_830536 ) ) ( not ( = ?auto_830528 ?auto_830537 ) ) ( not ( = ?auto_830528 ?auto_830538 ) ) ( not ( = ?auto_830528 ?auto_830539 ) ) ( not ( = ?auto_830528 ?auto_830540 ) ) ( not ( = ?auto_830529 ?auto_830530 ) ) ( not ( = ?auto_830529 ?auto_830531 ) ) ( not ( = ?auto_830529 ?auto_830532 ) ) ( not ( = ?auto_830529 ?auto_830533 ) ) ( not ( = ?auto_830529 ?auto_830534 ) ) ( not ( = ?auto_830529 ?auto_830535 ) ) ( not ( = ?auto_830529 ?auto_830536 ) ) ( not ( = ?auto_830529 ?auto_830537 ) ) ( not ( = ?auto_830529 ?auto_830538 ) ) ( not ( = ?auto_830529 ?auto_830539 ) ) ( not ( = ?auto_830529 ?auto_830540 ) ) ( not ( = ?auto_830530 ?auto_830531 ) ) ( not ( = ?auto_830530 ?auto_830532 ) ) ( not ( = ?auto_830530 ?auto_830533 ) ) ( not ( = ?auto_830530 ?auto_830534 ) ) ( not ( = ?auto_830530 ?auto_830535 ) ) ( not ( = ?auto_830530 ?auto_830536 ) ) ( not ( = ?auto_830530 ?auto_830537 ) ) ( not ( = ?auto_830530 ?auto_830538 ) ) ( not ( = ?auto_830530 ?auto_830539 ) ) ( not ( = ?auto_830530 ?auto_830540 ) ) ( not ( = ?auto_830531 ?auto_830532 ) ) ( not ( = ?auto_830531 ?auto_830533 ) ) ( not ( = ?auto_830531 ?auto_830534 ) ) ( not ( = ?auto_830531 ?auto_830535 ) ) ( not ( = ?auto_830531 ?auto_830536 ) ) ( not ( = ?auto_830531 ?auto_830537 ) ) ( not ( = ?auto_830531 ?auto_830538 ) ) ( not ( = ?auto_830531 ?auto_830539 ) ) ( not ( = ?auto_830531 ?auto_830540 ) ) ( not ( = ?auto_830532 ?auto_830533 ) ) ( not ( = ?auto_830532 ?auto_830534 ) ) ( not ( = ?auto_830532 ?auto_830535 ) ) ( not ( = ?auto_830532 ?auto_830536 ) ) ( not ( = ?auto_830532 ?auto_830537 ) ) ( not ( = ?auto_830532 ?auto_830538 ) ) ( not ( = ?auto_830532 ?auto_830539 ) ) ( not ( = ?auto_830532 ?auto_830540 ) ) ( not ( = ?auto_830533 ?auto_830534 ) ) ( not ( = ?auto_830533 ?auto_830535 ) ) ( not ( = ?auto_830533 ?auto_830536 ) ) ( not ( = ?auto_830533 ?auto_830537 ) ) ( not ( = ?auto_830533 ?auto_830538 ) ) ( not ( = ?auto_830533 ?auto_830539 ) ) ( not ( = ?auto_830533 ?auto_830540 ) ) ( not ( = ?auto_830534 ?auto_830535 ) ) ( not ( = ?auto_830534 ?auto_830536 ) ) ( not ( = ?auto_830534 ?auto_830537 ) ) ( not ( = ?auto_830534 ?auto_830538 ) ) ( not ( = ?auto_830534 ?auto_830539 ) ) ( not ( = ?auto_830534 ?auto_830540 ) ) ( not ( = ?auto_830535 ?auto_830536 ) ) ( not ( = ?auto_830535 ?auto_830537 ) ) ( not ( = ?auto_830535 ?auto_830538 ) ) ( not ( = ?auto_830535 ?auto_830539 ) ) ( not ( = ?auto_830535 ?auto_830540 ) ) ( not ( = ?auto_830536 ?auto_830537 ) ) ( not ( = ?auto_830536 ?auto_830538 ) ) ( not ( = ?auto_830536 ?auto_830539 ) ) ( not ( = ?auto_830536 ?auto_830540 ) ) ( not ( = ?auto_830537 ?auto_830538 ) ) ( not ( = ?auto_830537 ?auto_830539 ) ) ( not ( = ?auto_830537 ?auto_830540 ) ) ( not ( = ?auto_830538 ?auto_830539 ) ) ( not ( = ?auto_830538 ?auto_830540 ) ) ( not ( = ?auto_830539 ?auto_830540 ) ) ( ON ?auto_830538 ?auto_830539 ) ( CLEAR ?auto_830536 ) ( ON ?auto_830537 ?auto_830538 ) ( CLEAR ?auto_830537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_830527 ?auto_830528 ?auto_830529 ?auto_830530 ?auto_830531 ?auto_830532 ?auto_830533 ?auto_830534 ?auto_830535 ?auto_830536 ?auto_830537 )
      ( MAKE-13PILE ?auto_830527 ?auto_830528 ?auto_830529 ?auto_830530 ?auto_830531 ?auto_830532 ?auto_830533 ?auto_830534 ?auto_830535 ?auto_830536 ?auto_830537 ?auto_830538 ?auto_830539 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_830581 - BLOCK
      ?auto_830582 - BLOCK
      ?auto_830583 - BLOCK
      ?auto_830584 - BLOCK
      ?auto_830585 - BLOCK
      ?auto_830586 - BLOCK
      ?auto_830587 - BLOCK
      ?auto_830588 - BLOCK
      ?auto_830589 - BLOCK
      ?auto_830590 - BLOCK
      ?auto_830591 - BLOCK
      ?auto_830592 - BLOCK
      ?auto_830593 - BLOCK
    )
    :vars
    (
      ?auto_830594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_830593 ?auto_830594 ) ( ON-TABLE ?auto_830581 ) ( ON ?auto_830582 ?auto_830581 ) ( ON ?auto_830583 ?auto_830582 ) ( ON ?auto_830584 ?auto_830583 ) ( ON ?auto_830585 ?auto_830584 ) ( ON ?auto_830586 ?auto_830585 ) ( ON ?auto_830587 ?auto_830586 ) ( ON ?auto_830588 ?auto_830587 ) ( ON ?auto_830589 ?auto_830588 ) ( not ( = ?auto_830581 ?auto_830582 ) ) ( not ( = ?auto_830581 ?auto_830583 ) ) ( not ( = ?auto_830581 ?auto_830584 ) ) ( not ( = ?auto_830581 ?auto_830585 ) ) ( not ( = ?auto_830581 ?auto_830586 ) ) ( not ( = ?auto_830581 ?auto_830587 ) ) ( not ( = ?auto_830581 ?auto_830588 ) ) ( not ( = ?auto_830581 ?auto_830589 ) ) ( not ( = ?auto_830581 ?auto_830590 ) ) ( not ( = ?auto_830581 ?auto_830591 ) ) ( not ( = ?auto_830581 ?auto_830592 ) ) ( not ( = ?auto_830581 ?auto_830593 ) ) ( not ( = ?auto_830581 ?auto_830594 ) ) ( not ( = ?auto_830582 ?auto_830583 ) ) ( not ( = ?auto_830582 ?auto_830584 ) ) ( not ( = ?auto_830582 ?auto_830585 ) ) ( not ( = ?auto_830582 ?auto_830586 ) ) ( not ( = ?auto_830582 ?auto_830587 ) ) ( not ( = ?auto_830582 ?auto_830588 ) ) ( not ( = ?auto_830582 ?auto_830589 ) ) ( not ( = ?auto_830582 ?auto_830590 ) ) ( not ( = ?auto_830582 ?auto_830591 ) ) ( not ( = ?auto_830582 ?auto_830592 ) ) ( not ( = ?auto_830582 ?auto_830593 ) ) ( not ( = ?auto_830582 ?auto_830594 ) ) ( not ( = ?auto_830583 ?auto_830584 ) ) ( not ( = ?auto_830583 ?auto_830585 ) ) ( not ( = ?auto_830583 ?auto_830586 ) ) ( not ( = ?auto_830583 ?auto_830587 ) ) ( not ( = ?auto_830583 ?auto_830588 ) ) ( not ( = ?auto_830583 ?auto_830589 ) ) ( not ( = ?auto_830583 ?auto_830590 ) ) ( not ( = ?auto_830583 ?auto_830591 ) ) ( not ( = ?auto_830583 ?auto_830592 ) ) ( not ( = ?auto_830583 ?auto_830593 ) ) ( not ( = ?auto_830583 ?auto_830594 ) ) ( not ( = ?auto_830584 ?auto_830585 ) ) ( not ( = ?auto_830584 ?auto_830586 ) ) ( not ( = ?auto_830584 ?auto_830587 ) ) ( not ( = ?auto_830584 ?auto_830588 ) ) ( not ( = ?auto_830584 ?auto_830589 ) ) ( not ( = ?auto_830584 ?auto_830590 ) ) ( not ( = ?auto_830584 ?auto_830591 ) ) ( not ( = ?auto_830584 ?auto_830592 ) ) ( not ( = ?auto_830584 ?auto_830593 ) ) ( not ( = ?auto_830584 ?auto_830594 ) ) ( not ( = ?auto_830585 ?auto_830586 ) ) ( not ( = ?auto_830585 ?auto_830587 ) ) ( not ( = ?auto_830585 ?auto_830588 ) ) ( not ( = ?auto_830585 ?auto_830589 ) ) ( not ( = ?auto_830585 ?auto_830590 ) ) ( not ( = ?auto_830585 ?auto_830591 ) ) ( not ( = ?auto_830585 ?auto_830592 ) ) ( not ( = ?auto_830585 ?auto_830593 ) ) ( not ( = ?auto_830585 ?auto_830594 ) ) ( not ( = ?auto_830586 ?auto_830587 ) ) ( not ( = ?auto_830586 ?auto_830588 ) ) ( not ( = ?auto_830586 ?auto_830589 ) ) ( not ( = ?auto_830586 ?auto_830590 ) ) ( not ( = ?auto_830586 ?auto_830591 ) ) ( not ( = ?auto_830586 ?auto_830592 ) ) ( not ( = ?auto_830586 ?auto_830593 ) ) ( not ( = ?auto_830586 ?auto_830594 ) ) ( not ( = ?auto_830587 ?auto_830588 ) ) ( not ( = ?auto_830587 ?auto_830589 ) ) ( not ( = ?auto_830587 ?auto_830590 ) ) ( not ( = ?auto_830587 ?auto_830591 ) ) ( not ( = ?auto_830587 ?auto_830592 ) ) ( not ( = ?auto_830587 ?auto_830593 ) ) ( not ( = ?auto_830587 ?auto_830594 ) ) ( not ( = ?auto_830588 ?auto_830589 ) ) ( not ( = ?auto_830588 ?auto_830590 ) ) ( not ( = ?auto_830588 ?auto_830591 ) ) ( not ( = ?auto_830588 ?auto_830592 ) ) ( not ( = ?auto_830588 ?auto_830593 ) ) ( not ( = ?auto_830588 ?auto_830594 ) ) ( not ( = ?auto_830589 ?auto_830590 ) ) ( not ( = ?auto_830589 ?auto_830591 ) ) ( not ( = ?auto_830589 ?auto_830592 ) ) ( not ( = ?auto_830589 ?auto_830593 ) ) ( not ( = ?auto_830589 ?auto_830594 ) ) ( not ( = ?auto_830590 ?auto_830591 ) ) ( not ( = ?auto_830590 ?auto_830592 ) ) ( not ( = ?auto_830590 ?auto_830593 ) ) ( not ( = ?auto_830590 ?auto_830594 ) ) ( not ( = ?auto_830591 ?auto_830592 ) ) ( not ( = ?auto_830591 ?auto_830593 ) ) ( not ( = ?auto_830591 ?auto_830594 ) ) ( not ( = ?auto_830592 ?auto_830593 ) ) ( not ( = ?auto_830592 ?auto_830594 ) ) ( not ( = ?auto_830593 ?auto_830594 ) ) ( ON ?auto_830592 ?auto_830593 ) ( ON ?auto_830591 ?auto_830592 ) ( CLEAR ?auto_830589 ) ( ON ?auto_830590 ?auto_830591 ) ( CLEAR ?auto_830590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_830581 ?auto_830582 ?auto_830583 ?auto_830584 ?auto_830585 ?auto_830586 ?auto_830587 ?auto_830588 ?auto_830589 ?auto_830590 )
      ( MAKE-13PILE ?auto_830581 ?auto_830582 ?auto_830583 ?auto_830584 ?auto_830585 ?auto_830586 ?auto_830587 ?auto_830588 ?auto_830589 ?auto_830590 ?auto_830591 ?auto_830592 ?auto_830593 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_830635 - BLOCK
      ?auto_830636 - BLOCK
      ?auto_830637 - BLOCK
      ?auto_830638 - BLOCK
      ?auto_830639 - BLOCK
      ?auto_830640 - BLOCK
      ?auto_830641 - BLOCK
      ?auto_830642 - BLOCK
      ?auto_830643 - BLOCK
      ?auto_830644 - BLOCK
      ?auto_830645 - BLOCK
      ?auto_830646 - BLOCK
      ?auto_830647 - BLOCK
    )
    :vars
    (
      ?auto_830648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_830647 ?auto_830648 ) ( ON-TABLE ?auto_830635 ) ( ON ?auto_830636 ?auto_830635 ) ( ON ?auto_830637 ?auto_830636 ) ( ON ?auto_830638 ?auto_830637 ) ( ON ?auto_830639 ?auto_830638 ) ( ON ?auto_830640 ?auto_830639 ) ( ON ?auto_830641 ?auto_830640 ) ( ON ?auto_830642 ?auto_830641 ) ( not ( = ?auto_830635 ?auto_830636 ) ) ( not ( = ?auto_830635 ?auto_830637 ) ) ( not ( = ?auto_830635 ?auto_830638 ) ) ( not ( = ?auto_830635 ?auto_830639 ) ) ( not ( = ?auto_830635 ?auto_830640 ) ) ( not ( = ?auto_830635 ?auto_830641 ) ) ( not ( = ?auto_830635 ?auto_830642 ) ) ( not ( = ?auto_830635 ?auto_830643 ) ) ( not ( = ?auto_830635 ?auto_830644 ) ) ( not ( = ?auto_830635 ?auto_830645 ) ) ( not ( = ?auto_830635 ?auto_830646 ) ) ( not ( = ?auto_830635 ?auto_830647 ) ) ( not ( = ?auto_830635 ?auto_830648 ) ) ( not ( = ?auto_830636 ?auto_830637 ) ) ( not ( = ?auto_830636 ?auto_830638 ) ) ( not ( = ?auto_830636 ?auto_830639 ) ) ( not ( = ?auto_830636 ?auto_830640 ) ) ( not ( = ?auto_830636 ?auto_830641 ) ) ( not ( = ?auto_830636 ?auto_830642 ) ) ( not ( = ?auto_830636 ?auto_830643 ) ) ( not ( = ?auto_830636 ?auto_830644 ) ) ( not ( = ?auto_830636 ?auto_830645 ) ) ( not ( = ?auto_830636 ?auto_830646 ) ) ( not ( = ?auto_830636 ?auto_830647 ) ) ( not ( = ?auto_830636 ?auto_830648 ) ) ( not ( = ?auto_830637 ?auto_830638 ) ) ( not ( = ?auto_830637 ?auto_830639 ) ) ( not ( = ?auto_830637 ?auto_830640 ) ) ( not ( = ?auto_830637 ?auto_830641 ) ) ( not ( = ?auto_830637 ?auto_830642 ) ) ( not ( = ?auto_830637 ?auto_830643 ) ) ( not ( = ?auto_830637 ?auto_830644 ) ) ( not ( = ?auto_830637 ?auto_830645 ) ) ( not ( = ?auto_830637 ?auto_830646 ) ) ( not ( = ?auto_830637 ?auto_830647 ) ) ( not ( = ?auto_830637 ?auto_830648 ) ) ( not ( = ?auto_830638 ?auto_830639 ) ) ( not ( = ?auto_830638 ?auto_830640 ) ) ( not ( = ?auto_830638 ?auto_830641 ) ) ( not ( = ?auto_830638 ?auto_830642 ) ) ( not ( = ?auto_830638 ?auto_830643 ) ) ( not ( = ?auto_830638 ?auto_830644 ) ) ( not ( = ?auto_830638 ?auto_830645 ) ) ( not ( = ?auto_830638 ?auto_830646 ) ) ( not ( = ?auto_830638 ?auto_830647 ) ) ( not ( = ?auto_830638 ?auto_830648 ) ) ( not ( = ?auto_830639 ?auto_830640 ) ) ( not ( = ?auto_830639 ?auto_830641 ) ) ( not ( = ?auto_830639 ?auto_830642 ) ) ( not ( = ?auto_830639 ?auto_830643 ) ) ( not ( = ?auto_830639 ?auto_830644 ) ) ( not ( = ?auto_830639 ?auto_830645 ) ) ( not ( = ?auto_830639 ?auto_830646 ) ) ( not ( = ?auto_830639 ?auto_830647 ) ) ( not ( = ?auto_830639 ?auto_830648 ) ) ( not ( = ?auto_830640 ?auto_830641 ) ) ( not ( = ?auto_830640 ?auto_830642 ) ) ( not ( = ?auto_830640 ?auto_830643 ) ) ( not ( = ?auto_830640 ?auto_830644 ) ) ( not ( = ?auto_830640 ?auto_830645 ) ) ( not ( = ?auto_830640 ?auto_830646 ) ) ( not ( = ?auto_830640 ?auto_830647 ) ) ( not ( = ?auto_830640 ?auto_830648 ) ) ( not ( = ?auto_830641 ?auto_830642 ) ) ( not ( = ?auto_830641 ?auto_830643 ) ) ( not ( = ?auto_830641 ?auto_830644 ) ) ( not ( = ?auto_830641 ?auto_830645 ) ) ( not ( = ?auto_830641 ?auto_830646 ) ) ( not ( = ?auto_830641 ?auto_830647 ) ) ( not ( = ?auto_830641 ?auto_830648 ) ) ( not ( = ?auto_830642 ?auto_830643 ) ) ( not ( = ?auto_830642 ?auto_830644 ) ) ( not ( = ?auto_830642 ?auto_830645 ) ) ( not ( = ?auto_830642 ?auto_830646 ) ) ( not ( = ?auto_830642 ?auto_830647 ) ) ( not ( = ?auto_830642 ?auto_830648 ) ) ( not ( = ?auto_830643 ?auto_830644 ) ) ( not ( = ?auto_830643 ?auto_830645 ) ) ( not ( = ?auto_830643 ?auto_830646 ) ) ( not ( = ?auto_830643 ?auto_830647 ) ) ( not ( = ?auto_830643 ?auto_830648 ) ) ( not ( = ?auto_830644 ?auto_830645 ) ) ( not ( = ?auto_830644 ?auto_830646 ) ) ( not ( = ?auto_830644 ?auto_830647 ) ) ( not ( = ?auto_830644 ?auto_830648 ) ) ( not ( = ?auto_830645 ?auto_830646 ) ) ( not ( = ?auto_830645 ?auto_830647 ) ) ( not ( = ?auto_830645 ?auto_830648 ) ) ( not ( = ?auto_830646 ?auto_830647 ) ) ( not ( = ?auto_830646 ?auto_830648 ) ) ( not ( = ?auto_830647 ?auto_830648 ) ) ( ON ?auto_830646 ?auto_830647 ) ( ON ?auto_830645 ?auto_830646 ) ( ON ?auto_830644 ?auto_830645 ) ( CLEAR ?auto_830642 ) ( ON ?auto_830643 ?auto_830644 ) ( CLEAR ?auto_830643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_830635 ?auto_830636 ?auto_830637 ?auto_830638 ?auto_830639 ?auto_830640 ?auto_830641 ?auto_830642 ?auto_830643 )
      ( MAKE-13PILE ?auto_830635 ?auto_830636 ?auto_830637 ?auto_830638 ?auto_830639 ?auto_830640 ?auto_830641 ?auto_830642 ?auto_830643 ?auto_830644 ?auto_830645 ?auto_830646 ?auto_830647 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_830689 - BLOCK
      ?auto_830690 - BLOCK
      ?auto_830691 - BLOCK
      ?auto_830692 - BLOCK
      ?auto_830693 - BLOCK
      ?auto_830694 - BLOCK
      ?auto_830695 - BLOCK
      ?auto_830696 - BLOCK
      ?auto_830697 - BLOCK
      ?auto_830698 - BLOCK
      ?auto_830699 - BLOCK
      ?auto_830700 - BLOCK
      ?auto_830701 - BLOCK
    )
    :vars
    (
      ?auto_830702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_830701 ?auto_830702 ) ( ON-TABLE ?auto_830689 ) ( ON ?auto_830690 ?auto_830689 ) ( ON ?auto_830691 ?auto_830690 ) ( ON ?auto_830692 ?auto_830691 ) ( ON ?auto_830693 ?auto_830692 ) ( ON ?auto_830694 ?auto_830693 ) ( ON ?auto_830695 ?auto_830694 ) ( not ( = ?auto_830689 ?auto_830690 ) ) ( not ( = ?auto_830689 ?auto_830691 ) ) ( not ( = ?auto_830689 ?auto_830692 ) ) ( not ( = ?auto_830689 ?auto_830693 ) ) ( not ( = ?auto_830689 ?auto_830694 ) ) ( not ( = ?auto_830689 ?auto_830695 ) ) ( not ( = ?auto_830689 ?auto_830696 ) ) ( not ( = ?auto_830689 ?auto_830697 ) ) ( not ( = ?auto_830689 ?auto_830698 ) ) ( not ( = ?auto_830689 ?auto_830699 ) ) ( not ( = ?auto_830689 ?auto_830700 ) ) ( not ( = ?auto_830689 ?auto_830701 ) ) ( not ( = ?auto_830689 ?auto_830702 ) ) ( not ( = ?auto_830690 ?auto_830691 ) ) ( not ( = ?auto_830690 ?auto_830692 ) ) ( not ( = ?auto_830690 ?auto_830693 ) ) ( not ( = ?auto_830690 ?auto_830694 ) ) ( not ( = ?auto_830690 ?auto_830695 ) ) ( not ( = ?auto_830690 ?auto_830696 ) ) ( not ( = ?auto_830690 ?auto_830697 ) ) ( not ( = ?auto_830690 ?auto_830698 ) ) ( not ( = ?auto_830690 ?auto_830699 ) ) ( not ( = ?auto_830690 ?auto_830700 ) ) ( not ( = ?auto_830690 ?auto_830701 ) ) ( not ( = ?auto_830690 ?auto_830702 ) ) ( not ( = ?auto_830691 ?auto_830692 ) ) ( not ( = ?auto_830691 ?auto_830693 ) ) ( not ( = ?auto_830691 ?auto_830694 ) ) ( not ( = ?auto_830691 ?auto_830695 ) ) ( not ( = ?auto_830691 ?auto_830696 ) ) ( not ( = ?auto_830691 ?auto_830697 ) ) ( not ( = ?auto_830691 ?auto_830698 ) ) ( not ( = ?auto_830691 ?auto_830699 ) ) ( not ( = ?auto_830691 ?auto_830700 ) ) ( not ( = ?auto_830691 ?auto_830701 ) ) ( not ( = ?auto_830691 ?auto_830702 ) ) ( not ( = ?auto_830692 ?auto_830693 ) ) ( not ( = ?auto_830692 ?auto_830694 ) ) ( not ( = ?auto_830692 ?auto_830695 ) ) ( not ( = ?auto_830692 ?auto_830696 ) ) ( not ( = ?auto_830692 ?auto_830697 ) ) ( not ( = ?auto_830692 ?auto_830698 ) ) ( not ( = ?auto_830692 ?auto_830699 ) ) ( not ( = ?auto_830692 ?auto_830700 ) ) ( not ( = ?auto_830692 ?auto_830701 ) ) ( not ( = ?auto_830692 ?auto_830702 ) ) ( not ( = ?auto_830693 ?auto_830694 ) ) ( not ( = ?auto_830693 ?auto_830695 ) ) ( not ( = ?auto_830693 ?auto_830696 ) ) ( not ( = ?auto_830693 ?auto_830697 ) ) ( not ( = ?auto_830693 ?auto_830698 ) ) ( not ( = ?auto_830693 ?auto_830699 ) ) ( not ( = ?auto_830693 ?auto_830700 ) ) ( not ( = ?auto_830693 ?auto_830701 ) ) ( not ( = ?auto_830693 ?auto_830702 ) ) ( not ( = ?auto_830694 ?auto_830695 ) ) ( not ( = ?auto_830694 ?auto_830696 ) ) ( not ( = ?auto_830694 ?auto_830697 ) ) ( not ( = ?auto_830694 ?auto_830698 ) ) ( not ( = ?auto_830694 ?auto_830699 ) ) ( not ( = ?auto_830694 ?auto_830700 ) ) ( not ( = ?auto_830694 ?auto_830701 ) ) ( not ( = ?auto_830694 ?auto_830702 ) ) ( not ( = ?auto_830695 ?auto_830696 ) ) ( not ( = ?auto_830695 ?auto_830697 ) ) ( not ( = ?auto_830695 ?auto_830698 ) ) ( not ( = ?auto_830695 ?auto_830699 ) ) ( not ( = ?auto_830695 ?auto_830700 ) ) ( not ( = ?auto_830695 ?auto_830701 ) ) ( not ( = ?auto_830695 ?auto_830702 ) ) ( not ( = ?auto_830696 ?auto_830697 ) ) ( not ( = ?auto_830696 ?auto_830698 ) ) ( not ( = ?auto_830696 ?auto_830699 ) ) ( not ( = ?auto_830696 ?auto_830700 ) ) ( not ( = ?auto_830696 ?auto_830701 ) ) ( not ( = ?auto_830696 ?auto_830702 ) ) ( not ( = ?auto_830697 ?auto_830698 ) ) ( not ( = ?auto_830697 ?auto_830699 ) ) ( not ( = ?auto_830697 ?auto_830700 ) ) ( not ( = ?auto_830697 ?auto_830701 ) ) ( not ( = ?auto_830697 ?auto_830702 ) ) ( not ( = ?auto_830698 ?auto_830699 ) ) ( not ( = ?auto_830698 ?auto_830700 ) ) ( not ( = ?auto_830698 ?auto_830701 ) ) ( not ( = ?auto_830698 ?auto_830702 ) ) ( not ( = ?auto_830699 ?auto_830700 ) ) ( not ( = ?auto_830699 ?auto_830701 ) ) ( not ( = ?auto_830699 ?auto_830702 ) ) ( not ( = ?auto_830700 ?auto_830701 ) ) ( not ( = ?auto_830700 ?auto_830702 ) ) ( not ( = ?auto_830701 ?auto_830702 ) ) ( ON ?auto_830700 ?auto_830701 ) ( ON ?auto_830699 ?auto_830700 ) ( ON ?auto_830698 ?auto_830699 ) ( ON ?auto_830697 ?auto_830698 ) ( CLEAR ?auto_830695 ) ( ON ?auto_830696 ?auto_830697 ) ( CLEAR ?auto_830696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_830689 ?auto_830690 ?auto_830691 ?auto_830692 ?auto_830693 ?auto_830694 ?auto_830695 ?auto_830696 )
      ( MAKE-13PILE ?auto_830689 ?auto_830690 ?auto_830691 ?auto_830692 ?auto_830693 ?auto_830694 ?auto_830695 ?auto_830696 ?auto_830697 ?auto_830698 ?auto_830699 ?auto_830700 ?auto_830701 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_830743 - BLOCK
      ?auto_830744 - BLOCK
      ?auto_830745 - BLOCK
      ?auto_830746 - BLOCK
      ?auto_830747 - BLOCK
      ?auto_830748 - BLOCK
      ?auto_830749 - BLOCK
      ?auto_830750 - BLOCK
      ?auto_830751 - BLOCK
      ?auto_830752 - BLOCK
      ?auto_830753 - BLOCK
      ?auto_830754 - BLOCK
      ?auto_830755 - BLOCK
    )
    :vars
    (
      ?auto_830756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_830755 ?auto_830756 ) ( ON-TABLE ?auto_830743 ) ( ON ?auto_830744 ?auto_830743 ) ( ON ?auto_830745 ?auto_830744 ) ( ON ?auto_830746 ?auto_830745 ) ( ON ?auto_830747 ?auto_830746 ) ( ON ?auto_830748 ?auto_830747 ) ( not ( = ?auto_830743 ?auto_830744 ) ) ( not ( = ?auto_830743 ?auto_830745 ) ) ( not ( = ?auto_830743 ?auto_830746 ) ) ( not ( = ?auto_830743 ?auto_830747 ) ) ( not ( = ?auto_830743 ?auto_830748 ) ) ( not ( = ?auto_830743 ?auto_830749 ) ) ( not ( = ?auto_830743 ?auto_830750 ) ) ( not ( = ?auto_830743 ?auto_830751 ) ) ( not ( = ?auto_830743 ?auto_830752 ) ) ( not ( = ?auto_830743 ?auto_830753 ) ) ( not ( = ?auto_830743 ?auto_830754 ) ) ( not ( = ?auto_830743 ?auto_830755 ) ) ( not ( = ?auto_830743 ?auto_830756 ) ) ( not ( = ?auto_830744 ?auto_830745 ) ) ( not ( = ?auto_830744 ?auto_830746 ) ) ( not ( = ?auto_830744 ?auto_830747 ) ) ( not ( = ?auto_830744 ?auto_830748 ) ) ( not ( = ?auto_830744 ?auto_830749 ) ) ( not ( = ?auto_830744 ?auto_830750 ) ) ( not ( = ?auto_830744 ?auto_830751 ) ) ( not ( = ?auto_830744 ?auto_830752 ) ) ( not ( = ?auto_830744 ?auto_830753 ) ) ( not ( = ?auto_830744 ?auto_830754 ) ) ( not ( = ?auto_830744 ?auto_830755 ) ) ( not ( = ?auto_830744 ?auto_830756 ) ) ( not ( = ?auto_830745 ?auto_830746 ) ) ( not ( = ?auto_830745 ?auto_830747 ) ) ( not ( = ?auto_830745 ?auto_830748 ) ) ( not ( = ?auto_830745 ?auto_830749 ) ) ( not ( = ?auto_830745 ?auto_830750 ) ) ( not ( = ?auto_830745 ?auto_830751 ) ) ( not ( = ?auto_830745 ?auto_830752 ) ) ( not ( = ?auto_830745 ?auto_830753 ) ) ( not ( = ?auto_830745 ?auto_830754 ) ) ( not ( = ?auto_830745 ?auto_830755 ) ) ( not ( = ?auto_830745 ?auto_830756 ) ) ( not ( = ?auto_830746 ?auto_830747 ) ) ( not ( = ?auto_830746 ?auto_830748 ) ) ( not ( = ?auto_830746 ?auto_830749 ) ) ( not ( = ?auto_830746 ?auto_830750 ) ) ( not ( = ?auto_830746 ?auto_830751 ) ) ( not ( = ?auto_830746 ?auto_830752 ) ) ( not ( = ?auto_830746 ?auto_830753 ) ) ( not ( = ?auto_830746 ?auto_830754 ) ) ( not ( = ?auto_830746 ?auto_830755 ) ) ( not ( = ?auto_830746 ?auto_830756 ) ) ( not ( = ?auto_830747 ?auto_830748 ) ) ( not ( = ?auto_830747 ?auto_830749 ) ) ( not ( = ?auto_830747 ?auto_830750 ) ) ( not ( = ?auto_830747 ?auto_830751 ) ) ( not ( = ?auto_830747 ?auto_830752 ) ) ( not ( = ?auto_830747 ?auto_830753 ) ) ( not ( = ?auto_830747 ?auto_830754 ) ) ( not ( = ?auto_830747 ?auto_830755 ) ) ( not ( = ?auto_830747 ?auto_830756 ) ) ( not ( = ?auto_830748 ?auto_830749 ) ) ( not ( = ?auto_830748 ?auto_830750 ) ) ( not ( = ?auto_830748 ?auto_830751 ) ) ( not ( = ?auto_830748 ?auto_830752 ) ) ( not ( = ?auto_830748 ?auto_830753 ) ) ( not ( = ?auto_830748 ?auto_830754 ) ) ( not ( = ?auto_830748 ?auto_830755 ) ) ( not ( = ?auto_830748 ?auto_830756 ) ) ( not ( = ?auto_830749 ?auto_830750 ) ) ( not ( = ?auto_830749 ?auto_830751 ) ) ( not ( = ?auto_830749 ?auto_830752 ) ) ( not ( = ?auto_830749 ?auto_830753 ) ) ( not ( = ?auto_830749 ?auto_830754 ) ) ( not ( = ?auto_830749 ?auto_830755 ) ) ( not ( = ?auto_830749 ?auto_830756 ) ) ( not ( = ?auto_830750 ?auto_830751 ) ) ( not ( = ?auto_830750 ?auto_830752 ) ) ( not ( = ?auto_830750 ?auto_830753 ) ) ( not ( = ?auto_830750 ?auto_830754 ) ) ( not ( = ?auto_830750 ?auto_830755 ) ) ( not ( = ?auto_830750 ?auto_830756 ) ) ( not ( = ?auto_830751 ?auto_830752 ) ) ( not ( = ?auto_830751 ?auto_830753 ) ) ( not ( = ?auto_830751 ?auto_830754 ) ) ( not ( = ?auto_830751 ?auto_830755 ) ) ( not ( = ?auto_830751 ?auto_830756 ) ) ( not ( = ?auto_830752 ?auto_830753 ) ) ( not ( = ?auto_830752 ?auto_830754 ) ) ( not ( = ?auto_830752 ?auto_830755 ) ) ( not ( = ?auto_830752 ?auto_830756 ) ) ( not ( = ?auto_830753 ?auto_830754 ) ) ( not ( = ?auto_830753 ?auto_830755 ) ) ( not ( = ?auto_830753 ?auto_830756 ) ) ( not ( = ?auto_830754 ?auto_830755 ) ) ( not ( = ?auto_830754 ?auto_830756 ) ) ( not ( = ?auto_830755 ?auto_830756 ) ) ( ON ?auto_830754 ?auto_830755 ) ( ON ?auto_830753 ?auto_830754 ) ( ON ?auto_830752 ?auto_830753 ) ( ON ?auto_830751 ?auto_830752 ) ( ON ?auto_830750 ?auto_830751 ) ( CLEAR ?auto_830748 ) ( ON ?auto_830749 ?auto_830750 ) ( CLEAR ?auto_830749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_830743 ?auto_830744 ?auto_830745 ?auto_830746 ?auto_830747 ?auto_830748 ?auto_830749 )
      ( MAKE-13PILE ?auto_830743 ?auto_830744 ?auto_830745 ?auto_830746 ?auto_830747 ?auto_830748 ?auto_830749 ?auto_830750 ?auto_830751 ?auto_830752 ?auto_830753 ?auto_830754 ?auto_830755 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_830797 - BLOCK
      ?auto_830798 - BLOCK
      ?auto_830799 - BLOCK
      ?auto_830800 - BLOCK
      ?auto_830801 - BLOCK
      ?auto_830802 - BLOCK
      ?auto_830803 - BLOCK
      ?auto_830804 - BLOCK
      ?auto_830805 - BLOCK
      ?auto_830806 - BLOCK
      ?auto_830807 - BLOCK
      ?auto_830808 - BLOCK
      ?auto_830809 - BLOCK
    )
    :vars
    (
      ?auto_830810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_830809 ?auto_830810 ) ( ON-TABLE ?auto_830797 ) ( ON ?auto_830798 ?auto_830797 ) ( ON ?auto_830799 ?auto_830798 ) ( ON ?auto_830800 ?auto_830799 ) ( ON ?auto_830801 ?auto_830800 ) ( not ( = ?auto_830797 ?auto_830798 ) ) ( not ( = ?auto_830797 ?auto_830799 ) ) ( not ( = ?auto_830797 ?auto_830800 ) ) ( not ( = ?auto_830797 ?auto_830801 ) ) ( not ( = ?auto_830797 ?auto_830802 ) ) ( not ( = ?auto_830797 ?auto_830803 ) ) ( not ( = ?auto_830797 ?auto_830804 ) ) ( not ( = ?auto_830797 ?auto_830805 ) ) ( not ( = ?auto_830797 ?auto_830806 ) ) ( not ( = ?auto_830797 ?auto_830807 ) ) ( not ( = ?auto_830797 ?auto_830808 ) ) ( not ( = ?auto_830797 ?auto_830809 ) ) ( not ( = ?auto_830797 ?auto_830810 ) ) ( not ( = ?auto_830798 ?auto_830799 ) ) ( not ( = ?auto_830798 ?auto_830800 ) ) ( not ( = ?auto_830798 ?auto_830801 ) ) ( not ( = ?auto_830798 ?auto_830802 ) ) ( not ( = ?auto_830798 ?auto_830803 ) ) ( not ( = ?auto_830798 ?auto_830804 ) ) ( not ( = ?auto_830798 ?auto_830805 ) ) ( not ( = ?auto_830798 ?auto_830806 ) ) ( not ( = ?auto_830798 ?auto_830807 ) ) ( not ( = ?auto_830798 ?auto_830808 ) ) ( not ( = ?auto_830798 ?auto_830809 ) ) ( not ( = ?auto_830798 ?auto_830810 ) ) ( not ( = ?auto_830799 ?auto_830800 ) ) ( not ( = ?auto_830799 ?auto_830801 ) ) ( not ( = ?auto_830799 ?auto_830802 ) ) ( not ( = ?auto_830799 ?auto_830803 ) ) ( not ( = ?auto_830799 ?auto_830804 ) ) ( not ( = ?auto_830799 ?auto_830805 ) ) ( not ( = ?auto_830799 ?auto_830806 ) ) ( not ( = ?auto_830799 ?auto_830807 ) ) ( not ( = ?auto_830799 ?auto_830808 ) ) ( not ( = ?auto_830799 ?auto_830809 ) ) ( not ( = ?auto_830799 ?auto_830810 ) ) ( not ( = ?auto_830800 ?auto_830801 ) ) ( not ( = ?auto_830800 ?auto_830802 ) ) ( not ( = ?auto_830800 ?auto_830803 ) ) ( not ( = ?auto_830800 ?auto_830804 ) ) ( not ( = ?auto_830800 ?auto_830805 ) ) ( not ( = ?auto_830800 ?auto_830806 ) ) ( not ( = ?auto_830800 ?auto_830807 ) ) ( not ( = ?auto_830800 ?auto_830808 ) ) ( not ( = ?auto_830800 ?auto_830809 ) ) ( not ( = ?auto_830800 ?auto_830810 ) ) ( not ( = ?auto_830801 ?auto_830802 ) ) ( not ( = ?auto_830801 ?auto_830803 ) ) ( not ( = ?auto_830801 ?auto_830804 ) ) ( not ( = ?auto_830801 ?auto_830805 ) ) ( not ( = ?auto_830801 ?auto_830806 ) ) ( not ( = ?auto_830801 ?auto_830807 ) ) ( not ( = ?auto_830801 ?auto_830808 ) ) ( not ( = ?auto_830801 ?auto_830809 ) ) ( not ( = ?auto_830801 ?auto_830810 ) ) ( not ( = ?auto_830802 ?auto_830803 ) ) ( not ( = ?auto_830802 ?auto_830804 ) ) ( not ( = ?auto_830802 ?auto_830805 ) ) ( not ( = ?auto_830802 ?auto_830806 ) ) ( not ( = ?auto_830802 ?auto_830807 ) ) ( not ( = ?auto_830802 ?auto_830808 ) ) ( not ( = ?auto_830802 ?auto_830809 ) ) ( not ( = ?auto_830802 ?auto_830810 ) ) ( not ( = ?auto_830803 ?auto_830804 ) ) ( not ( = ?auto_830803 ?auto_830805 ) ) ( not ( = ?auto_830803 ?auto_830806 ) ) ( not ( = ?auto_830803 ?auto_830807 ) ) ( not ( = ?auto_830803 ?auto_830808 ) ) ( not ( = ?auto_830803 ?auto_830809 ) ) ( not ( = ?auto_830803 ?auto_830810 ) ) ( not ( = ?auto_830804 ?auto_830805 ) ) ( not ( = ?auto_830804 ?auto_830806 ) ) ( not ( = ?auto_830804 ?auto_830807 ) ) ( not ( = ?auto_830804 ?auto_830808 ) ) ( not ( = ?auto_830804 ?auto_830809 ) ) ( not ( = ?auto_830804 ?auto_830810 ) ) ( not ( = ?auto_830805 ?auto_830806 ) ) ( not ( = ?auto_830805 ?auto_830807 ) ) ( not ( = ?auto_830805 ?auto_830808 ) ) ( not ( = ?auto_830805 ?auto_830809 ) ) ( not ( = ?auto_830805 ?auto_830810 ) ) ( not ( = ?auto_830806 ?auto_830807 ) ) ( not ( = ?auto_830806 ?auto_830808 ) ) ( not ( = ?auto_830806 ?auto_830809 ) ) ( not ( = ?auto_830806 ?auto_830810 ) ) ( not ( = ?auto_830807 ?auto_830808 ) ) ( not ( = ?auto_830807 ?auto_830809 ) ) ( not ( = ?auto_830807 ?auto_830810 ) ) ( not ( = ?auto_830808 ?auto_830809 ) ) ( not ( = ?auto_830808 ?auto_830810 ) ) ( not ( = ?auto_830809 ?auto_830810 ) ) ( ON ?auto_830808 ?auto_830809 ) ( ON ?auto_830807 ?auto_830808 ) ( ON ?auto_830806 ?auto_830807 ) ( ON ?auto_830805 ?auto_830806 ) ( ON ?auto_830804 ?auto_830805 ) ( ON ?auto_830803 ?auto_830804 ) ( CLEAR ?auto_830801 ) ( ON ?auto_830802 ?auto_830803 ) ( CLEAR ?auto_830802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_830797 ?auto_830798 ?auto_830799 ?auto_830800 ?auto_830801 ?auto_830802 )
      ( MAKE-13PILE ?auto_830797 ?auto_830798 ?auto_830799 ?auto_830800 ?auto_830801 ?auto_830802 ?auto_830803 ?auto_830804 ?auto_830805 ?auto_830806 ?auto_830807 ?auto_830808 ?auto_830809 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_830851 - BLOCK
      ?auto_830852 - BLOCK
      ?auto_830853 - BLOCK
      ?auto_830854 - BLOCK
      ?auto_830855 - BLOCK
      ?auto_830856 - BLOCK
      ?auto_830857 - BLOCK
      ?auto_830858 - BLOCK
      ?auto_830859 - BLOCK
      ?auto_830860 - BLOCK
      ?auto_830861 - BLOCK
      ?auto_830862 - BLOCK
      ?auto_830863 - BLOCK
    )
    :vars
    (
      ?auto_830864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_830863 ?auto_830864 ) ( ON-TABLE ?auto_830851 ) ( ON ?auto_830852 ?auto_830851 ) ( ON ?auto_830853 ?auto_830852 ) ( ON ?auto_830854 ?auto_830853 ) ( not ( = ?auto_830851 ?auto_830852 ) ) ( not ( = ?auto_830851 ?auto_830853 ) ) ( not ( = ?auto_830851 ?auto_830854 ) ) ( not ( = ?auto_830851 ?auto_830855 ) ) ( not ( = ?auto_830851 ?auto_830856 ) ) ( not ( = ?auto_830851 ?auto_830857 ) ) ( not ( = ?auto_830851 ?auto_830858 ) ) ( not ( = ?auto_830851 ?auto_830859 ) ) ( not ( = ?auto_830851 ?auto_830860 ) ) ( not ( = ?auto_830851 ?auto_830861 ) ) ( not ( = ?auto_830851 ?auto_830862 ) ) ( not ( = ?auto_830851 ?auto_830863 ) ) ( not ( = ?auto_830851 ?auto_830864 ) ) ( not ( = ?auto_830852 ?auto_830853 ) ) ( not ( = ?auto_830852 ?auto_830854 ) ) ( not ( = ?auto_830852 ?auto_830855 ) ) ( not ( = ?auto_830852 ?auto_830856 ) ) ( not ( = ?auto_830852 ?auto_830857 ) ) ( not ( = ?auto_830852 ?auto_830858 ) ) ( not ( = ?auto_830852 ?auto_830859 ) ) ( not ( = ?auto_830852 ?auto_830860 ) ) ( not ( = ?auto_830852 ?auto_830861 ) ) ( not ( = ?auto_830852 ?auto_830862 ) ) ( not ( = ?auto_830852 ?auto_830863 ) ) ( not ( = ?auto_830852 ?auto_830864 ) ) ( not ( = ?auto_830853 ?auto_830854 ) ) ( not ( = ?auto_830853 ?auto_830855 ) ) ( not ( = ?auto_830853 ?auto_830856 ) ) ( not ( = ?auto_830853 ?auto_830857 ) ) ( not ( = ?auto_830853 ?auto_830858 ) ) ( not ( = ?auto_830853 ?auto_830859 ) ) ( not ( = ?auto_830853 ?auto_830860 ) ) ( not ( = ?auto_830853 ?auto_830861 ) ) ( not ( = ?auto_830853 ?auto_830862 ) ) ( not ( = ?auto_830853 ?auto_830863 ) ) ( not ( = ?auto_830853 ?auto_830864 ) ) ( not ( = ?auto_830854 ?auto_830855 ) ) ( not ( = ?auto_830854 ?auto_830856 ) ) ( not ( = ?auto_830854 ?auto_830857 ) ) ( not ( = ?auto_830854 ?auto_830858 ) ) ( not ( = ?auto_830854 ?auto_830859 ) ) ( not ( = ?auto_830854 ?auto_830860 ) ) ( not ( = ?auto_830854 ?auto_830861 ) ) ( not ( = ?auto_830854 ?auto_830862 ) ) ( not ( = ?auto_830854 ?auto_830863 ) ) ( not ( = ?auto_830854 ?auto_830864 ) ) ( not ( = ?auto_830855 ?auto_830856 ) ) ( not ( = ?auto_830855 ?auto_830857 ) ) ( not ( = ?auto_830855 ?auto_830858 ) ) ( not ( = ?auto_830855 ?auto_830859 ) ) ( not ( = ?auto_830855 ?auto_830860 ) ) ( not ( = ?auto_830855 ?auto_830861 ) ) ( not ( = ?auto_830855 ?auto_830862 ) ) ( not ( = ?auto_830855 ?auto_830863 ) ) ( not ( = ?auto_830855 ?auto_830864 ) ) ( not ( = ?auto_830856 ?auto_830857 ) ) ( not ( = ?auto_830856 ?auto_830858 ) ) ( not ( = ?auto_830856 ?auto_830859 ) ) ( not ( = ?auto_830856 ?auto_830860 ) ) ( not ( = ?auto_830856 ?auto_830861 ) ) ( not ( = ?auto_830856 ?auto_830862 ) ) ( not ( = ?auto_830856 ?auto_830863 ) ) ( not ( = ?auto_830856 ?auto_830864 ) ) ( not ( = ?auto_830857 ?auto_830858 ) ) ( not ( = ?auto_830857 ?auto_830859 ) ) ( not ( = ?auto_830857 ?auto_830860 ) ) ( not ( = ?auto_830857 ?auto_830861 ) ) ( not ( = ?auto_830857 ?auto_830862 ) ) ( not ( = ?auto_830857 ?auto_830863 ) ) ( not ( = ?auto_830857 ?auto_830864 ) ) ( not ( = ?auto_830858 ?auto_830859 ) ) ( not ( = ?auto_830858 ?auto_830860 ) ) ( not ( = ?auto_830858 ?auto_830861 ) ) ( not ( = ?auto_830858 ?auto_830862 ) ) ( not ( = ?auto_830858 ?auto_830863 ) ) ( not ( = ?auto_830858 ?auto_830864 ) ) ( not ( = ?auto_830859 ?auto_830860 ) ) ( not ( = ?auto_830859 ?auto_830861 ) ) ( not ( = ?auto_830859 ?auto_830862 ) ) ( not ( = ?auto_830859 ?auto_830863 ) ) ( not ( = ?auto_830859 ?auto_830864 ) ) ( not ( = ?auto_830860 ?auto_830861 ) ) ( not ( = ?auto_830860 ?auto_830862 ) ) ( not ( = ?auto_830860 ?auto_830863 ) ) ( not ( = ?auto_830860 ?auto_830864 ) ) ( not ( = ?auto_830861 ?auto_830862 ) ) ( not ( = ?auto_830861 ?auto_830863 ) ) ( not ( = ?auto_830861 ?auto_830864 ) ) ( not ( = ?auto_830862 ?auto_830863 ) ) ( not ( = ?auto_830862 ?auto_830864 ) ) ( not ( = ?auto_830863 ?auto_830864 ) ) ( ON ?auto_830862 ?auto_830863 ) ( ON ?auto_830861 ?auto_830862 ) ( ON ?auto_830860 ?auto_830861 ) ( ON ?auto_830859 ?auto_830860 ) ( ON ?auto_830858 ?auto_830859 ) ( ON ?auto_830857 ?auto_830858 ) ( ON ?auto_830856 ?auto_830857 ) ( CLEAR ?auto_830854 ) ( ON ?auto_830855 ?auto_830856 ) ( CLEAR ?auto_830855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_830851 ?auto_830852 ?auto_830853 ?auto_830854 ?auto_830855 )
      ( MAKE-13PILE ?auto_830851 ?auto_830852 ?auto_830853 ?auto_830854 ?auto_830855 ?auto_830856 ?auto_830857 ?auto_830858 ?auto_830859 ?auto_830860 ?auto_830861 ?auto_830862 ?auto_830863 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_830905 - BLOCK
      ?auto_830906 - BLOCK
      ?auto_830907 - BLOCK
      ?auto_830908 - BLOCK
      ?auto_830909 - BLOCK
      ?auto_830910 - BLOCK
      ?auto_830911 - BLOCK
      ?auto_830912 - BLOCK
      ?auto_830913 - BLOCK
      ?auto_830914 - BLOCK
      ?auto_830915 - BLOCK
      ?auto_830916 - BLOCK
      ?auto_830917 - BLOCK
    )
    :vars
    (
      ?auto_830918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_830917 ?auto_830918 ) ( ON-TABLE ?auto_830905 ) ( ON ?auto_830906 ?auto_830905 ) ( ON ?auto_830907 ?auto_830906 ) ( not ( = ?auto_830905 ?auto_830906 ) ) ( not ( = ?auto_830905 ?auto_830907 ) ) ( not ( = ?auto_830905 ?auto_830908 ) ) ( not ( = ?auto_830905 ?auto_830909 ) ) ( not ( = ?auto_830905 ?auto_830910 ) ) ( not ( = ?auto_830905 ?auto_830911 ) ) ( not ( = ?auto_830905 ?auto_830912 ) ) ( not ( = ?auto_830905 ?auto_830913 ) ) ( not ( = ?auto_830905 ?auto_830914 ) ) ( not ( = ?auto_830905 ?auto_830915 ) ) ( not ( = ?auto_830905 ?auto_830916 ) ) ( not ( = ?auto_830905 ?auto_830917 ) ) ( not ( = ?auto_830905 ?auto_830918 ) ) ( not ( = ?auto_830906 ?auto_830907 ) ) ( not ( = ?auto_830906 ?auto_830908 ) ) ( not ( = ?auto_830906 ?auto_830909 ) ) ( not ( = ?auto_830906 ?auto_830910 ) ) ( not ( = ?auto_830906 ?auto_830911 ) ) ( not ( = ?auto_830906 ?auto_830912 ) ) ( not ( = ?auto_830906 ?auto_830913 ) ) ( not ( = ?auto_830906 ?auto_830914 ) ) ( not ( = ?auto_830906 ?auto_830915 ) ) ( not ( = ?auto_830906 ?auto_830916 ) ) ( not ( = ?auto_830906 ?auto_830917 ) ) ( not ( = ?auto_830906 ?auto_830918 ) ) ( not ( = ?auto_830907 ?auto_830908 ) ) ( not ( = ?auto_830907 ?auto_830909 ) ) ( not ( = ?auto_830907 ?auto_830910 ) ) ( not ( = ?auto_830907 ?auto_830911 ) ) ( not ( = ?auto_830907 ?auto_830912 ) ) ( not ( = ?auto_830907 ?auto_830913 ) ) ( not ( = ?auto_830907 ?auto_830914 ) ) ( not ( = ?auto_830907 ?auto_830915 ) ) ( not ( = ?auto_830907 ?auto_830916 ) ) ( not ( = ?auto_830907 ?auto_830917 ) ) ( not ( = ?auto_830907 ?auto_830918 ) ) ( not ( = ?auto_830908 ?auto_830909 ) ) ( not ( = ?auto_830908 ?auto_830910 ) ) ( not ( = ?auto_830908 ?auto_830911 ) ) ( not ( = ?auto_830908 ?auto_830912 ) ) ( not ( = ?auto_830908 ?auto_830913 ) ) ( not ( = ?auto_830908 ?auto_830914 ) ) ( not ( = ?auto_830908 ?auto_830915 ) ) ( not ( = ?auto_830908 ?auto_830916 ) ) ( not ( = ?auto_830908 ?auto_830917 ) ) ( not ( = ?auto_830908 ?auto_830918 ) ) ( not ( = ?auto_830909 ?auto_830910 ) ) ( not ( = ?auto_830909 ?auto_830911 ) ) ( not ( = ?auto_830909 ?auto_830912 ) ) ( not ( = ?auto_830909 ?auto_830913 ) ) ( not ( = ?auto_830909 ?auto_830914 ) ) ( not ( = ?auto_830909 ?auto_830915 ) ) ( not ( = ?auto_830909 ?auto_830916 ) ) ( not ( = ?auto_830909 ?auto_830917 ) ) ( not ( = ?auto_830909 ?auto_830918 ) ) ( not ( = ?auto_830910 ?auto_830911 ) ) ( not ( = ?auto_830910 ?auto_830912 ) ) ( not ( = ?auto_830910 ?auto_830913 ) ) ( not ( = ?auto_830910 ?auto_830914 ) ) ( not ( = ?auto_830910 ?auto_830915 ) ) ( not ( = ?auto_830910 ?auto_830916 ) ) ( not ( = ?auto_830910 ?auto_830917 ) ) ( not ( = ?auto_830910 ?auto_830918 ) ) ( not ( = ?auto_830911 ?auto_830912 ) ) ( not ( = ?auto_830911 ?auto_830913 ) ) ( not ( = ?auto_830911 ?auto_830914 ) ) ( not ( = ?auto_830911 ?auto_830915 ) ) ( not ( = ?auto_830911 ?auto_830916 ) ) ( not ( = ?auto_830911 ?auto_830917 ) ) ( not ( = ?auto_830911 ?auto_830918 ) ) ( not ( = ?auto_830912 ?auto_830913 ) ) ( not ( = ?auto_830912 ?auto_830914 ) ) ( not ( = ?auto_830912 ?auto_830915 ) ) ( not ( = ?auto_830912 ?auto_830916 ) ) ( not ( = ?auto_830912 ?auto_830917 ) ) ( not ( = ?auto_830912 ?auto_830918 ) ) ( not ( = ?auto_830913 ?auto_830914 ) ) ( not ( = ?auto_830913 ?auto_830915 ) ) ( not ( = ?auto_830913 ?auto_830916 ) ) ( not ( = ?auto_830913 ?auto_830917 ) ) ( not ( = ?auto_830913 ?auto_830918 ) ) ( not ( = ?auto_830914 ?auto_830915 ) ) ( not ( = ?auto_830914 ?auto_830916 ) ) ( not ( = ?auto_830914 ?auto_830917 ) ) ( not ( = ?auto_830914 ?auto_830918 ) ) ( not ( = ?auto_830915 ?auto_830916 ) ) ( not ( = ?auto_830915 ?auto_830917 ) ) ( not ( = ?auto_830915 ?auto_830918 ) ) ( not ( = ?auto_830916 ?auto_830917 ) ) ( not ( = ?auto_830916 ?auto_830918 ) ) ( not ( = ?auto_830917 ?auto_830918 ) ) ( ON ?auto_830916 ?auto_830917 ) ( ON ?auto_830915 ?auto_830916 ) ( ON ?auto_830914 ?auto_830915 ) ( ON ?auto_830913 ?auto_830914 ) ( ON ?auto_830912 ?auto_830913 ) ( ON ?auto_830911 ?auto_830912 ) ( ON ?auto_830910 ?auto_830911 ) ( ON ?auto_830909 ?auto_830910 ) ( CLEAR ?auto_830907 ) ( ON ?auto_830908 ?auto_830909 ) ( CLEAR ?auto_830908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_830905 ?auto_830906 ?auto_830907 ?auto_830908 )
      ( MAKE-13PILE ?auto_830905 ?auto_830906 ?auto_830907 ?auto_830908 ?auto_830909 ?auto_830910 ?auto_830911 ?auto_830912 ?auto_830913 ?auto_830914 ?auto_830915 ?auto_830916 ?auto_830917 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_830959 - BLOCK
      ?auto_830960 - BLOCK
      ?auto_830961 - BLOCK
      ?auto_830962 - BLOCK
      ?auto_830963 - BLOCK
      ?auto_830964 - BLOCK
      ?auto_830965 - BLOCK
      ?auto_830966 - BLOCK
      ?auto_830967 - BLOCK
      ?auto_830968 - BLOCK
      ?auto_830969 - BLOCK
      ?auto_830970 - BLOCK
      ?auto_830971 - BLOCK
    )
    :vars
    (
      ?auto_830972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_830971 ?auto_830972 ) ( ON-TABLE ?auto_830959 ) ( ON ?auto_830960 ?auto_830959 ) ( not ( = ?auto_830959 ?auto_830960 ) ) ( not ( = ?auto_830959 ?auto_830961 ) ) ( not ( = ?auto_830959 ?auto_830962 ) ) ( not ( = ?auto_830959 ?auto_830963 ) ) ( not ( = ?auto_830959 ?auto_830964 ) ) ( not ( = ?auto_830959 ?auto_830965 ) ) ( not ( = ?auto_830959 ?auto_830966 ) ) ( not ( = ?auto_830959 ?auto_830967 ) ) ( not ( = ?auto_830959 ?auto_830968 ) ) ( not ( = ?auto_830959 ?auto_830969 ) ) ( not ( = ?auto_830959 ?auto_830970 ) ) ( not ( = ?auto_830959 ?auto_830971 ) ) ( not ( = ?auto_830959 ?auto_830972 ) ) ( not ( = ?auto_830960 ?auto_830961 ) ) ( not ( = ?auto_830960 ?auto_830962 ) ) ( not ( = ?auto_830960 ?auto_830963 ) ) ( not ( = ?auto_830960 ?auto_830964 ) ) ( not ( = ?auto_830960 ?auto_830965 ) ) ( not ( = ?auto_830960 ?auto_830966 ) ) ( not ( = ?auto_830960 ?auto_830967 ) ) ( not ( = ?auto_830960 ?auto_830968 ) ) ( not ( = ?auto_830960 ?auto_830969 ) ) ( not ( = ?auto_830960 ?auto_830970 ) ) ( not ( = ?auto_830960 ?auto_830971 ) ) ( not ( = ?auto_830960 ?auto_830972 ) ) ( not ( = ?auto_830961 ?auto_830962 ) ) ( not ( = ?auto_830961 ?auto_830963 ) ) ( not ( = ?auto_830961 ?auto_830964 ) ) ( not ( = ?auto_830961 ?auto_830965 ) ) ( not ( = ?auto_830961 ?auto_830966 ) ) ( not ( = ?auto_830961 ?auto_830967 ) ) ( not ( = ?auto_830961 ?auto_830968 ) ) ( not ( = ?auto_830961 ?auto_830969 ) ) ( not ( = ?auto_830961 ?auto_830970 ) ) ( not ( = ?auto_830961 ?auto_830971 ) ) ( not ( = ?auto_830961 ?auto_830972 ) ) ( not ( = ?auto_830962 ?auto_830963 ) ) ( not ( = ?auto_830962 ?auto_830964 ) ) ( not ( = ?auto_830962 ?auto_830965 ) ) ( not ( = ?auto_830962 ?auto_830966 ) ) ( not ( = ?auto_830962 ?auto_830967 ) ) ( not ( = ?auto_830962 ?auto_830968 ) ) ( not ( = ?auto_830962 ?auto_830969 ) ) ( not ( = ?auto_830962 ?auto_830970 ) ) ( not ( = ?auto_830962 ?auto_830971 ) ) ( not ( = ?auto_830962 ?auto_830972 ) ) ( not ( = ?auto_830963 ?auto_830964 ) ) ( not ( = ?auto_830963 ?auto_830965 ) ) ( not ( = ?auto_830963 ?auto_830966 ) ) ( not ( = ?auto_830963 ?auto_830967 ) ) ( not ( = ?auto_830963 ?auto_830968 ) ) ( not ( = ?auto_830963 ?auto_830969 ) ) ( not ( = ?auto_830963 ?auto_830970 ) ) ( not ( = ?auto_830963 ?auto_830971 ) ) ( not ( = ?auto_830963 ?auto_830972 ) ) ( not ( = ?auto_830964 ?auto_830965 ) ) ( not ( = ?auto_830964 ?auto_830966 ) ) ( not ( = ?auto_830964 ?auto_830967 ) ) ( not ( = ?auto_830964 ?auto_830968 ) ) ( not ( = ?auto_830964 ?auto_830969 ) ) ( not ( = ?auto_830964 ?auto_830970 ) ) ( not ( = ?auto_830964 ?auto_830971 ) ) ( not ( = ?auto_830964 ?auto_830972 ) ) ( not ( = ?auto_830965 ?auto_830966 ) ) ( not ( = ?auto_830965 ?auto_830967 ) ) ( not ( = ?auto_830965 ?auto_830968 ) ) ( not ( = ?auto_830965 ?auto_830969 ) ) ( not ( = ?auto_830965 ?auto_830970 ) ) ( not ( = ?auto_830965 ?auto_830971 ) ) ( not ( = ?auto_830965 ?auto_830972 ) ) ( not ( = ?auto_830966 ?auto_830967 ) ) ( not ( = ?auto_830966 ?auto_830968 ) ) ( not ( = ?auto_830966 ?auto_830969 ) ) ( not ( = ?auto_830966 ?auto_830970 ) ) ( not ( = ?auto_830966 ?auto_830971 ) ) ( not ( = ?auto_830966 ?auto_830972 ) ) ( not ( = ?auto_830967 ?auto_830968 ) ) ( not ( = ?auto_830967 ?auto_830969 ) ) ( not ( = ?auto_830967 ?auto_830970 ) ) ( not ( = ?auto_830967 ?auto_830971 ) ) ( not ( = ?auto_830967 ?auto_830972 ) ) ( not ( = ?auto_830968 ?auto_830969 ) ) ( not ( = ?auto_830968 ?auto_830970 ) ) ( not ( = ?auto_830968 ?auto_830971 ) ) ( not ( = ?auto_830968 ?auto_830972 ) ) ( not ( = ?auto_830969 ?auto_830970 ) ) ( not ( = ?auto_830969 ?auto_830971 ) ) ( not ( = ?auto_830969 ?auto_830972 ) ) ( not ( = ?auto_830970 ?auto_830971 ) ) ( not ( = ?auto_830970 ?auto_830972 ) ) ( not ( = ?auto_830971 ?auto_830972 ) ) ( ON ?auto_830970 ?auto_830971 ) ( ON ?auto_830969 ?auto_830970 ) ( ON ?auto_830968 ?auto_830969 ) ( ON ?auto_830967 ?auto_830968 ) ( ON ?auto_830966 ?auto_830967 ) ( ON ?auto_830965 ?auto_830966 ) ( ON ?auto_830964 ?auto_830965 ) ( ON ?auto_830963 ?auto_830964 ) ( ON ?auto_830962 ?auto_830963 ) ( CLEAR ?auto_830960 ) ( ON ?auto_830961 ?auto_830962 ) ( CLEAR ?auto_830961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_830959 ?auto_830960 ?auto_830961 )
      ( MAKE-13PILE ?auto_830959 ?auto_830960 ?auto_830961 ?auto_830962 ?auto_830963 ?auto_830964 ?auto_830965 ?auto_830966 ?auto_830967 ?auto_830968 ?auto_830969 ?auto_830970 ?auto_830971 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_831013 - BLOCK
      ?auto_831014 - BLOCK
      ?auto_831015 - BLOCK
      ?auto_831016 - BLOCK
      ?auto_831017 - BLOCK
      ?auto_831018 - BLOCK
      ?auto_831019 - BLOCK
      ?auto_831020 - BLOCK
      ?auto_831021 - BLOCK
      ?auto_831022 - BLOCK
      ?auto_831023 - BLOCK
      ?auto_831024 - BLOCK
      ?auto_831025 - BLOCK
    )
    :vars
    (
      ?auto_831026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_831025 ?auto_831026 ) ( ON-TABLE ?auto_831013 ) ( not ( = ?auto_831013 ?auto_831014 ) ) ( not ( = ?auto_831013 ?auto_831015 ) ) ( not ( = ?auto_831013 ?auto_831016 ) ) ( not ( = ?auto_831013 ?auto_831017 ) ) ( not ( = ?auto_831013 ?auto_831018 ) ) ( not ( = ?auto_831013 ?auto_831019 ) ) ( not ( = ?auto_831013 ?auto_831020 ) ) ( not ( = ?auto_831013 ?auto_831021 ) ) ( not ( = ?auto_831013 ?auto_831022 ) ) ( not ( = ?auto_831013 ?auto_831023 ) ) ( not ( = ?auto_831013 ?auto_831024 ) ) ( not ( = ?auto_831013 ?auto_831025 ) ) ( not ( = ?auto_831013 ?auto_831026 ) ) ( not ( = ?auto_831014 ?auto_831015 ) ) ( not ( = ?auto_831014 ?auto_831016 ) ) ( not ( = ?auto_831014 ?auto_831017 ) ) ( not ( = ?auto_831014 ?auto_831018 ) ) ( not ( = ?auto_831014 ?auto_831019 ) ) ( not ( = ?auto_831014 ?auto_831020 ) ) ( not ( = ?auto_831014 ?auto_831021 ) ) ( not ( = ?auto_831014 ?auto_831022 ) ) ( not ( = ?auto_831014 ?auto_831023 ) ) ( not ( = ?auto_831014 ?auto_831024 ) ) ( not ( = ?auto_831014 ?auto_831025 ) ) ( not ( = ?auto_831014 ?auto_831026 ) ) ( not ( = ?auto_831015 ?auto_831016 ) ) ( not ( = ?auto_831015 ?auto_831017 ) ) ( not ( = ?auto_831015 ?auto_831018 ) ) ( not ( = ?auto_831015 ?auto_831019 ) ) ( not ( = ?auto_831015 ?auto_831020 ) ) ( not ( = ?auto_831015 ?auto_831021 ) ) ( not ( = ?auto_831015 ?auto_831022 ) ) ( not ( = ?auto_831015 ?auto_831023 ) ) ( not ( = ?auto_831015 ?auto_831024 ) ) ( not ( = ?auto_831015 ?auto_831025 ) ) ( not ( = ?auto_831015 ?auto_831026 ) ) ( not ( = ?auto_831016 ?auto_831017 ) ) ( not ( = ?auto_831016 ?auto_831018 ) ) ( not ( = ?auto_831016 ?auto_831019 ) ) ( not ( = ?auto_831016 ?auto_831020 ) ) ( not ( = ?auto_831016 ?auto_831021 ) ) ( not ( = ?auto_831016 ?auto_831022 ) ) ( not ( = ?auto_831016 ?auto_831023 ) ) ( not ( = ?auto_831016 ?auto_831024 ) ) ( not ( = ?auto_831016 ?auto_831025 ) ) ( not ( = ?auto_831016 ?auto_831026 ) ) ( not ( = ?auto_831017 ?auto_831018 ) ) ( not ( = ?auto_831017 ?auto_831019 ) ) ( not ( = ?auto_831017 ?auto_831020 ) ) ( not ( = ?auto_831017 ?auto_831021 ) ) ( not ( = ?auto_831017 ?auto_831022 ) ) ( not ( = ?auto_831017 ?auto_831023 ) ) ( not ( = ?auto_831017 ?auto_831024 ) ) ( not ( = ?auto_831017 ?auto_831025 ) ) ( not ( = ?auto_831017 ?auto_831026 ) ) ( not ( = ?auto_831018 ?auto_831019 ) ) ( not ( = ?auto_831018 ?auto_831020 ) ) ( not ( = ?auto_831018 ?auto_831021 ) ) ( not ( = ?auto_831018 ?auto_831022 ) ) ( not ( = ?auto_831018 ?auto_831023 ) ) ( not ( = ?auto_831018 ?auto_831024 ) ) ( not ( = ?auto_831018 ?auto_831025 ) ) ( not ( = ?auto_831018 ?auto_831026 ) ) ( not ( = ?auto_831019 ?auto_831020 ) ) ( not ( = ?auto_831019 ?auto_831021 ) ) ( not ( = ?auto_831019 ?auto_831022 ) ) ( not ( = ?auto_831019 ?auto_831023 ) ) ( not ( = ?auto_831019 ?auto_831024 ) ) ( not ( = ?auto_831019 ?auto_831025 ) ) ( not ( = ?auto_831019 ?auto_831026 ) ) ( not ( = ?auto_831020 ?auto_831021 ) ) ( not ( = ?auto_831020 ?auto_831022 ) ) ( not ( = ?auto_831020 ?auto_831023 ) ) ( not ( = ?auto_831020 ?auto_831024 ) ) ( not ( = ?auto_831020 ?auto_831025 ) ) ( not ( = ?auto_831020 ?auto_831026 ) ) ( not ( = ?auto_831021 ?auto_831022 ) ) ( not ( = ?auto_831021 ?auto_831023 ) ) ( not ( = ?auto_831021 ?auto_831024 ) ) ( not ( = ?auto_831021 ?auto_831025 ) ) ( not ( = ?auto_831021 ?auto_831026 ) ) ( not ( = ?auto_831022 ?auto_831023 ) ) ( not ( = ?auto_831022 ?auto_831024 ) ) ( not ( = ?auto_831022 ?auto_831025 ) ) ( not ( = ?auto_831022 ?auto_831026 ) ) ( not ( = ?auto_831023 ?auto_831024 ) ) ( not ( = ?auto_831023 ?auto_831025 ) ) ( not ( = ?auto_831023 ?auto_831026 ) ) ( not ( = ?auto_831024 ?auto_831025 ) ) ( not ( = ?auto_831024 ?auto_831026 ) ) ( not ( = ?auto_831025 ?auto_831026 ) ) ( ON ?auto_831024 ?auto_831025 ) ( ON ?auto_831023 ?auto_831024 ) ( ON ?auto_831022 ?auto_831023 ) ( ON ?auto_831021 ?auto_831022 ) ( ON ?auto_831020 ?auto_831021 ) ( ON ?auto_831019 ?auto_831020 ) ( ON ?auto_831018 ?auto_831019 ) ( ON ?auto_831017 ?auto_831018 ) ( ON ?auto_831016 ?auto_831017 ) ( ON ?auto_831015 ?auto_831016 ) ( CLEAR ?auto_831013 ) ( ON ?auto_831014 ?auto_831015 ) ( CLEAR ?auto_831014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_831013 ?auto_831014 )
      ( MAKE-13PILE ?auto_831013 ?auto_831014 ?auto_831015 ?auto_831016 ?auto_831017 ?auto_831018 ?auto_831019 ?auto_831020 ?auto_831021 ?auto_831022 ?auto_831023 ?auto_831024 ?auto_831025 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_831067 - BLOCK
      ?auto_831068 - BLOCK
      ?auto_831069 - BLOCK
      ?auto_831070 - BLOCK
      ?auto_831071 - BLOCK
      ?auto_831072 - BLOCK
      ?auto_831073 - BLOCK
      ?auto_831074 - BLOCK
      ?auto_831075 - BLOCK
      ?auto_831076 - BLOCK
      ?auto_831077 - BLOCK
      ?auto_831078 - BLOCK
      ?auto_831079 - BLOCK
    )
    :vars
    (
      ?auto_831080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_831079 ?auto_831080 ) ( not ( = ?auto_831067 ?auto_831068 ) ) ( not ( = ?auto_831067 ?auto_831069 ) ) ( not ( = ?auto_831067 ?auto_831070 ) ) ( not ( = ?auto_831067 ?auto_831071 ) ) ( not ( = ?auto_831067 ?auto_831072 ) ) ( not ( = ?auto_831067 ?auto_831073 ) ) ( not ( = ?auto_831067 ?auto_831074 ) ) ( not ( = ?auto_831067 ?auto_831075 ) ) ( not ( = ?auto_831067 ?auto_831076 ) ) ( not ( = ?auto_831067 ?auto_831077 ) ) ( not ( = ?auto_831067 ?auto_831078 ) ) ( not ( = ?auto_831067 ?auto_831079 ) ) ( not ( = ?auto_831067 ?auto_831080 ) ) ( not ( = ?auto_831068 ?auto_831069 ) ) ( not ( = ?auto_831068 ?auto_831070 ) ) ( not ( = ?auto_831068 ?auto_831071 ) ) ( not ( = ?auto_831068 ?auto_831072 ) ) ( not ( = ?auto_831068 ?auto_831073 ) ) ( not ( = ?auto_831068 ?auto_831074 ) ) ( not ( = ?auto_831068 ?auto_831075 ) ) ( not ( = ?auto_831068 ?auto_831076 ) ) ( not ( = ?auto_831068 ?auto_831077 ) ) ( not ( = ?auto_831068 ?auto_831078 ) ) ( not ( = ?auto_831068 ?auto_831079 ) ) ( not ( = ?auto_831068 ?auto_831080 ) ) ( not ( = ?auto_831069 ?auto_831070 ) ) ( not ( = ?auto_831069 ?auto_831071 ) ) ( not ( = ?auto_831069 ?auto_831072 ) ) ( not ( = ?auto_831069 ?auto_831073 ) ) ( not ( = ?auto_831069 ?auto_831074 ) ) ( not ( = ?auto_831069 ?auto_831075 ) ) ( not ( = ?auto_831069 ?auto_831076 ) ) ( not ( = ?auto_831069 ?auto_831077 ) ) ( not ( = ?auto_831069 ?auto_831078 ) ) ( not ( = ?auto_831069 ?auto_831079 ) ) ( not ( = ?auto_831069 ?auto_831080 ) ) ( not ( = ?auto_831070 ?auto_831071 ) ) ( not ( = ?auto_831070 ?auto_831072 ) ) ( not ( = ?auto_831070 ?auto_831073 ) ) ( not ( = ?auto_831070 ?auto_831074 ) ) ( not ( = ?auto_831070 ?auto_831075 ) ) ( not ( = ?auto_831070 ?auto_831076 ) ) ( not ( = ?auto_831070 ?auto_831077 ) ) ( not ( = ?auto_831070 ?auto_831078 ) ) ( not ( = ?auto_831070 ?auto_831079 ) ) ( not ( = ?auto_831070 ?auto_831080 ) ) ( not ( = ?auto_831071 ?auto_831072 ) ) ( not ( = ?auto_831071 ?auto_831073 ) ) ( not ( = ?auto_831071 ?auto_831074 ) ) ( not ( = ?auto_831071 ?auto_831075 ) ) ( not ( = ?auto_831071 ?auto_831076 ) ) ( not ( = ?auto_831071 ?auto_831077 ) ) ( not ( = ?auto_831071 ?auto_831078 ) ) ( not ( = ?auto_831071 ?auto_831079 ) ) ( not ( = ?auto_831071 ?auto_831080 ) ) ( not ( = ?auto_831072 ?auto_831073 ) ) ( not ( = ?auto_831072 ?auto_831074 ) ) ( not ( = ?auto_831072 ?auto_831075 ) ) ( not ( = ?auto_831072 ?auto_831076 ) ) ( not ( = ?auto_831072 ?auto_831077 ) ) ( not ( = ?auto_831072 ?auto_831078 ) ) ( not ( = ?auto_831072 ?auto_831079 ) ) ( not ( = ?auto_831072 ?auto_831080 ) ) ( not ( = ?auto_831073 ?auto_831074 ) ) ( not ( = ?auto_831073 ?auto_831075 ) ) ( not ( = ?auto_831073 ?auto_831076 ) ) ( not ( = ?auto_831073 ?auto_831077 ) ) ( not ( = ?auto_831073 ?auto_831078 ) ) ( not ( = ?auto_831073 ?auto_831079 ) ) ( not ( = ?auto_831073 ?auto_831080 ) ) ( not ( = ?auto_831074 ?auto_831075 ) ) ( not ( = ?auto_831074 ?auto_831076 ) ) ( not ( = ?auto_831074 ?auto_831077 ) ) ( not ( = ?auto_831074 ?auto_831078 ) ) ( not ( = ?auto_831074 ?auto_831079 ) ) ( not ( = ?auto_831074 ?auto_831080 ) ) ( not ( = ?auto_831075 ?auto_831076 ) ) ( not ( = ?auto_831075 ?auto_831077 ) ) ( not ( = ?auto_831075 ?auto_831078 ) ) ( not ( = ?auto_831075 ?auto_831079 ) ) ( not ( = ?auto_831075 ?auto_831080 ) ) ( not ( = ?auto_831076 ?auto_831077 ) ) ( not ( = ?auto_831076 ?auto_831078 ) ) ( not ( = ?auto_831076 ?auto_831079 ) ) ( not ( = ?auto_831076 ?auto_831080 ) ) ( not ( = ?auto_831077 ?auto_831078 ) ) ( not ( = ?auto_831077 ?auto_831079 ) ) ( not ( = ?auto_831077 ?auto_831080 ) ) ( not ( = ?auto_831078 ?auto_831079 ) ) ( not ( = ?auto_831078 ?auto_831080 ) ) ( not ( = ?auto_831079 ?auto_831080 ) ) ( ON ?auto_831078 ?auto_831079 ) ( ON ?auto_831077 ?auto_831078 ) ( ON ?auto_831076 ?auto_831077 ) ( ON ?auto_831075 ?auto_831076 ) ( ON ?auto_831074 ?auto_831075 ) ( ON ?auto_831073 ?auto_831074 ) ( ON ?auto_831072 ?auto_831073 ) ( ON ?auto_831071 ?auto_831072 ) ( ON ?auto_831070 ?auto_831071 ) ( ON ?auto_831069 ?auto_831070 ) ( ON ?auto_831068 ?auto_831069 ) ( ON ?auto_831067 ?auto_831068 ) ( CLEAR ?auto_831067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_831067 )
      ( MAKE-13PILE ?auto_831067 ?auto_831068 ?auto_831069 ?auto_831070 ?auto_831071 ?auto_831072 ?auto_831073 ?auto_831074 ?auto_831075 ?auto_831076 ?auto_831077 ?auto_831078 ?auto_831079 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_831122 - BLOCK
      ?auto_831123 - BLOCK
      ?auto_831124 - BLOCK
      ?auto_831125 - BLOCK
      ?auto_831126 - BLOCK
      ?auto_831127 - BLOCK
      ?auto_831128 - BLOCK
      ?auto_831129 - BLOCK
      ?auto_831130 - BLOCK
      ?auto_831131 - BLOCK
      ?auto_831132 - BLOCK
      ?auto_831133 - BLOCK
      ?auto_831134 - BLOCK
      ?auto_831135 - BLOCK
    )
    :vars
    (
      ?auto_831136 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_831134 ) ( ON ?auto_831135 ?auto_831136 ) ( CLEAR ?auto_831135 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_831122 ) ( ON ?auto_831123 ?auto_831122 ) ( ON ?auto_831124 ?auto_831123 ) ( ON ?auto_831125 ?auto_831124 ) ( ON ?auto_831126 ?auto_831125 ) ( ON ?auto_831127 ?auto_831126 ) ( ON ?auto_831128 ?auto_831127 ) ( ON ?auto_831129 ?auto_831128 ) ( ON ?auto_831130 ?auto_831129 ) ( ON ?auto_831131 ?auto_831130 ) ( ON ?auto_831132 ?auto_831131 ) ( ON ?auto_831133 ?auto_831132 ) ( ON ?auto_831134 ?auto_831133 ) ( not ( = ?auto_831122 ?auto_831123 ) ) ( not ( = ?auto_831122 ?auto_831124 ) ) ( not ( = ?auto_831122 ?auto_831125 ) ) ( not ( = ?auto_831122 ?auto_831126 ) ) ( not ( = ?auto_831122 ?auto_831127 ) ) ( not ( = ?auto_831122 ?auto_831128 ) ) ( not ( = ?auto_831122 ?auto_831129 ) ) ( not ( = ?auto_831122 ?auto_831130 ) ) ( not ( = ?auto_831122 ?auto_831131 ) ) ( not ( = ?auto_831122 ?auto_831132 ) ) ( not ( = ?auto_831122 ?auto_831133 ) ) ( not ( = ?auto_831122 ?auto_831134 ) ) ( not ( = ?auto_831122 ?auto_831135 ) ) ( not ( = ?auto_831122 ?auto_831136 ) ) ( not ( = ?auto_831123 ?auto_831124 ) ) ( not ( = ?auto_831123 ?auto_831125 ) ) ( not ( = ?auto_831123 ?auto_831126 ) ) ( not ( = ?auto_831123 ?auto_831127 ) ) ( not ( = ?auto_831123 ?auto_831128 ) ) ( not ( = ?auto_831123 ?auto_831129 ) ) ( not ( = ?auto_831123 ?auto_831130 ) ) ( not ( = ?auto_831123 ?auto_831131 ) ) ( not ( = ?auto_831123 ?auto_831132 ) ) ( not ( = ?auto_831123 ?auto_831133 ) ) ( not ( = ?auto_831123 ?auto_831134 ) ) ( not ( = ?auto_831123 ?auto_831135 ) ) ( not ( = ?auto_831123 ?auto_831136 ) ) ( not ( = ?auto_831124 ?auto_831125 ) ) ( not ( = ?auto_831124 ?auto_831126 ) ) ( not ( = ?auto_831124 ?auto_831127 ) ) ( not ( = ?auto_831124 ?auto_831128 ) ) ( not ( = ?auto_831124 ?auto_831129 ) ) ( not ( = ?auto_831124 ?auto_831130 ) ) ( not ( = ?auto_831124 ?auto_831131 ) ) ( not ( = ?auto_831124 ?auto_831132 ) ) ( not ( = ?auto_831124 ?auto_831133 ) ) ( not ( = ?auto_831124 ?auto_831134 ) ) ( not ( = ?auto_831124 ?auto_831135 ) ) ( not ( = ?auto_831124 ?auto_831136 ) ) ( not ( = ?auto_831125 ?auto_831126 ) ) ( not ( = ?auto_831125 ?auto_831127 ) ) ( not ( = ?auto_831125 ?auto_831128 ) ) ( not ( = ?auto_831125 ?auto_831129 ) ) ( not ( = ?auto_831125 ?auto_831130 ) ) ( not ( = ?auto_831125 ?auto_831131 ) ) ( not ( = ?auto_831125 ?auto_831132 ) ) ( not ( = ?auto_831125 ?auto_831133 ) ) ( not ( = ?auto_831125 ?auto_831134 ) ) ( not ( = ?auto_831125 ?auto_831135 ) ) ( not ( = ?auto_831125 ?auto_831136 ) ) ( not ( = ?auto_831126 ?auto_831127 ) ) ( not ( = ?auto_831126 ?auto_831128 ) ) ( not ( = ?auto_831126 ?auto_831129 ) ) ( not ( = ?auto_831126 ?auto_831130 ) ) ( not ( = ?auto_831126 ?auto_831131 ) ) ( not ( = ?auto_831126 ?auto_831132 ) ) ( not ( = ?auto_831126 ?auto_831133 ) ) ( not ( = ?auto_831126 ?auto_831134 ) ) ( not ( = ?auto_831126 ?auto_831135 ) ) ( not ( = ?auto_831126 ?auto_831136 ) ) ( not ( = ?auto_831127 ?auto_831128 ) ) ( not ( = ?auto_831127 ?auto_831129 ) ) ( not ( = ?auto_831127 ?auto_831130 ) ) ( not ( = ?auto_831127 ?auto_831131 ) ) ( not ( = ?auto_831127 ?auto_831132 ) ) ( not ( = ?auto_831127 ?auto_831133 ) ) ( not ( = ?auto_831127 ?auto_831134 ) ) ( not ( = ?auto_831127 ?auto_831135 ) ) ( not ( = ?auto_831127 ?auto_831136 ) ) ( not ( = ?auto_831128 ?auto_831129 ) ) ( not ( = ?auto_831128 ?auto_831130 ) ) ( not ( = ?auto_831128 ?auto_831131 ) ) ( not ( = ?auto_831128 ?auto_831132 ) ) ( not ( = ?auto_831128 ?auto_831133 ) ) ( not ( = ?auto_831128 ?auto_831134 ) ) ( not ( = ?auto_831128 ?auto_831135 ) ) ( not ( = ?auto_831128 ?auto_831136 ) ) ( not ( = ?auto_831129 ?auto_831130 ) ) ( not ( = ?auto_831129 ?auto_831131 ) ) ( not ( = ?auto_831129 ?auto_831132 ) ) ( not ( = ?auto_831129 ?auto_831133 ) ) ( not ( = ?auto_831129 ?auto_831134 ) ) ( not ( = ?auto_831129 ?auto_831135 ) ) ( not ( = ?auto_831129 ?auto_831136 ) ) ( not ( = ?auto_831130 ?auto_831131 ) ) ( not ( = ?auto_831130 ?auto_831132 ) ) ( not ( = ?auto_831130 ?auto_831133 ) ) ( not ( = ?auto_831130 ?auto_831134 ) ) ( not ( = ?auto_831130 ?auto_831135 ) ) ( not ( = ?auto_831130 ?auto_831136 ) ) ( not ( = ?auto_831131 ?auto_831132 ) ) ( not ( = ?auto_831131 ?auto_831133 ) ) ( not ( = ?auto_831131 ?auto_831134 ) ) ( not ( = ?auto_831131 ?auto_831135 ) ) ( not ( = ?auto_831131 ?auto_831136 ) ) ( not ( = ?auto_831132 ?auto_831133 ) ) ( not ( = ?auto_831132 ?auto_831134 ) ) ( not ( = ?auto_831132 ?auto_831135 ) ) ( not ( = ?auto_831132 ?auto_831136 ) ) ( not ( = ?auto_831133 ?auto_831134 ) ) ( not ( = ?auto_831133 ?auto_831135 ) ) ( not ( = ?auto_831133 ?auto_831136 ) ) ( not ( = ?auto_831134 ?auto_831135 ) ) ( not ( = ?auto_831134 ?auto_831136 ) ) ( not ( = ?auto_831135 ?auto_831136 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_831135 ?auto_831136 )
      ( !STACK ?auto_831135 ?auto_831134 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_831180 - BLOCK
      ?auto_831181 - BLOCK
      ?auto_831182 - BLOCK
      ?auto_831183 - BLOCK
      ?auto_831184 - BLOCK
      ?auto_831185 - BLOCK
      ?auto_831186 - BLOCK
      ?auto_831187 - BLOCK
      ?auto_831188 - BLOCK
      ?auto_831189 - BLOCK
      ?auto_831190 - BLOCK
      ?auto_831191 - BLOCK
      ?auto_831192 - BLOCK
      ?auto_831193 - BLOCK
    )
    :vars
    (
      ?auto_831194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_831193 ?auto_831194 ) ( ON-TABLE ?auto_831180 ) ( ON ?auto_831181 ?auto_831180 ) ( ON ?auto_831182 ?auto_831181 ) ( ON ?auto_831183 ?auto_831182 ) ( ON ?auto_831184 ?auto_831183 ) ( ON ?auto_831185 ?auto_831184 ) ( ON ?auto_831186 ?auto_831185 ) ( ON ?auto_831187 ?auto_831186 ) ( ON ?auto_831188 ?auto_831187 ) ( ON ?auto_831189 ?auto_831188 ) ( ON ?auto_831190 ?auto_831189 ) ( ON ?auto_831191 ?auto_831190 ) ( not ( = ?auto_831180 ?auto_831181 ) ) ( not ( = ?auto_831180 ?auto_831182 ) ) ( not ( = ?auto_831180 ?auto_831183 ) ) ( not ( = ?auto_831180 ?auto_831184 ) ) ( not ( = ?auto_831180 ?auto_831185 ) ) ( not ( = ?auto_831180 ?auto_831186 ) ) ( not ( = ?auto_831180 ?auto_831187 ) ) ( not ( = ?auto_831180 ?auto_831188 ) ) ( not ( = ?auto_831180 ?auto_831189 ) ) ( not ( = ?auto_831180 ?auto_831190 ) ) ( not ( = ?auto_831180 ?auto_831191 ) ) ( not ( = ?auto_831180 ?auto_831192 ) ) ( not ( = ?auto_831180 ?auto_831193 ) ) ( not ( = ?auto_831180 ?auto_831194 ) ) ( not ( = ?auto_831181 ?auto_831182 ) ) ( not ( = ?auto_831181 ?auto_831183 ) ) ( not ( = ?auto_831181 ?auto_831184 ) ) ( not ( = ?auto_831181 ?auto_831185 ) ) ( not ( = ?auto_831181 ?auto_831186 ) ) ( not ( = ?auto_831181 ?auto_831187 ) ) ( not ( = ?auto_831181 ?auto_831188 ) ) ( not ( = ?auto_831181 ?auto_831189 ) ) ( not ( = ?auto_831181 ?auto_831190 ) ) ( not ( = ?auto_831181 ?auto_831191 ) ) ( not ( = ?auto_831181 ?auto_831192 ) ) ( not ( = ?auto_831181 ?auto_831193 ) ) ( not ( = ?auto_831181 ?auto_831194 ) ) ( not ( = ?auto_831182 ?auto_831183 ) ) ( not ( = ?auto_831182 ?auto_831184 ) ) ( not ( = ?auto_831182 ?auto_831185 ) ) ( not ( = ?auto_831182 ?auto_831186 ) ) ( not ( = ?auto_831182 ?auto_831187 ) ) ( not ( = ?auto_831182 ?auto_831188 ) ) ( not ( = ?auto_831182 ?auto_831189 ) ) ( not ( = ?auto_831182 ?auto_831190 ) ) ( not ( = ?auto_831182 ?auto_831191 ) ) ( not ( = ?auto_831182 ?auto_831192 ) ) ( not ( = ?auto_831182 ?auto_831193 ) ) ( not ( = ?auto_831182 ?auto_831194 ) ) ( not ( = ?auto_831183 ?auto_831184 ) ) ( not ( = ?auto_831183 ?auto_831185 ) ) ( not ( = ?auto_831183 ?auto_831186 ) ) ( not ( = ?auto_831183 ?auto_831187 ) ) ( not ( = ?auto_831183 ?auto_831188 ) ) ( not ( = ?auto_831183 ?auto_831189 ) ) ( not ( = ?auto_831183 ?auto_831190 ) ) ( not ( = ?auto_831183 ?auto_831191 ) ) ( not ( = ?auto_831183 ?auto_831192 ) ) ( not ( = ?auto_831183 ?auto_831193 ) ) ( not ( = ?auto_831183 ?auto_831194 ) ) ( not ( = ?auto_831184 ?auto_831185 ) ) ( not ( = ?auto_831184 ?auto_831186 ) ) ( not ( = ?auto_831184 ?auto_831187 ) ) ( not ( = ?auto_831184 ?auto_831188 ) ) ( not ( = ?auto_831184 ?auto_831189 ) ) ( not ( = ?auto_831184 ?auto_831190 ) ) ( not ( = ?auto_831184 ?auto_831191 ) ) ( not ( = ?auto_831184 ?auto_831192 ) ) ( not ( = ?auto_831184 ?auto_831193 ) ) ( not ( = ?auto_831184 ?auto_831194 ) ) ( not ( = ?auto_831185 ?auto_831186 ) ) ( not ( = ?auto_831185 ?auto_831187 ) ) ( not ( = ?auto_831185 ?auto_831188 ) ) ( not ( = ?auto_831185 ?auto_831189 ) ) ( not ( = ?auto_831185 ?auto_831190 ) ) ( not ( = ?auto_831185 ?auto_831191 ) ) ( not ( = ?auto_831185 ?auto_831192 ) ) ( not ( = ?auto_831185 ?auto_831193 ) ) ( not ( = ?auto_831185 ?auto_831194 ) ) ( not ( = ?auto_831186 ?auto_831187 ) ) ( not ( = ?auto_831186 ?auto_831188 ) ) ( not ( = ?auto_831186 ?auto_831189 ) ) ( not ( = ?auto_831186 ?auto_831190 ) ) ( not ( = ?auto_831186 ?auto_831191 ) ) ( not ( = ?auto_831186 ?auto_831192 ) ) ( not ( = ?auto_831186 ?auto_831193 ) ) ( not ( = ?auto_831186 ?auto_831194 ) ) ( not ( = ?auto_831187 ?auto_831188 ) ) ( not ( = ?auto_831187 ?auto_831189 ) ) ( not ( = ?auto_831187 ?auto_831190 ) ) ( not ( = ?auto_831187 ?auto_831191 ) ) ( not ( = ?auto_831187 ?auto_831192 ) ) ( not ( = ?auto_831187 ?auto_831193 ) ) ( not ( = ?auto_831187 ?auto_831194 ) ) ( not ( = ?auto_831188 ?auto_831189 ) ) ( not ( = ?auto_831188 ?auto_831190 ) ) ( not ( = ?auto_831188 ?auto_831191 ) ) ( not ( = ?auto_831188 ?auto_831192 ) ) ( not ( = ?auto_831188 ?auto_831193 ) ) ( not ( = ?auto_831188 ?auto_831194 ) ) ( not ( = ?auto_831189 ?auto_831190 ) ) ( not ( = ?auto_831189 ?auto_831191 ) ) ( not ( = ?auto_831189 ?auto_831192 ) ) ( not ( = ?auto_831189 ?auto_831193 ) ) ( not ( = ?auto_831189 ?auto_831194 ) ) ( not ( = ?auto_831190 ?auto_831191 ) ) ( not ( = ?auto_831190 ?auto_831192 ) ) ( not ( = ?auto_831190 ?auto_831193 ) ) ( not ( = ?auto_831190 ?auto_831194 ) ) ( not ( = ?auto_831191 ?auto_831192 ) ) ( not ( = ?auto_831191 ?auto_831193 ) ) ( not ( = ?auto_831191 ?auto_831194 ) ) ( not ( = ?auto_831192 ?auto_831193 ) ) ( not ( = ?auto_831192 ?auto_831194 ) ) ( not ( = ?auto_831193 ?auto_831194 ) ) ( CLEAR ?auto_831191 ) ( ON ?auto_831192 ?auto_831193 ) ( CLEAR ?auto_831192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_831180 ?auto_831181 ?auto_831182 ?auto_831183 ?auto_831184 ?auto_831185 ?auto_831186 ?auto_831187 ?auto_831188 ?auto_831189 ?auto_831190 ?auto_831191 ?auto_831192 )
      ( MAKE-14PILE ?auto_831180 ?auto_831181 ?auto_831182 ?auto_831183 ?auto_831184 ?auto_831185 ?auto_831186 ?auto_831187 ?auto_831188 ?auto_831189 ?auto_831190 ?auto_831191 ?auto_831192 ?auto_831193 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_831238 - BLOCK
      ?auto_831239 - BLOCK
      ?auto_831240 - BLOCK
      ?auto_831241 - BLOCK
      ?auto_831242 - BLOCK
      ?auto_831243 - BLOCK
      ?auto_831244 - BLOCK
      ?auto_831245 - BLOCK
      ?auto_831246 - BLOCK
      ?auto_831247 - BLOCK
      ?auto_831248 - BLOCK
      ?auto_831249 - BLOCK
      ?auto_831250 - BLOCK
      ?auto_831251 - BLOCK
    )
    :vars
    (
      ?auto_831252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_831251 ?auto_831252 ) ( ON-TABLE ?auto_831238 ) ( ON ?auto_831239 ?auto_831238 ) ( ON ?auto_831240 ?auto_831239 ) ( ON ?auto_831241 ?auto_831240 ) ( ON ?auto_831242 ?auto_831241 ) ( ON ?auto_831243 ?auto_831242 ) ( ON ?auto_831244 ?auto_831243 ) ( ON ?auto_831245 ?auto_831244 ) ( ON ?auto_831246 ?auto_831245 ) ( ON ?auto_831247 ?auto_831246 ) ( ON ?auto_831248 ?auto_831247 ) ( not ( = ?auto_831238 ?auto_831239 ) ) ( not ( = ?auto_831238 ?auto_831240 ) ) ( not ( = ?auto_831238 ?auto_831241 ) ) ( not ( = ?auto_831238 ?auto_831242 ) ) ( not ( = ?auto_831238 ?auto_831243 ) ) ( not ( = ?auto_831238 ?auto_831244 ) ) ( not ( = ?auto_831238 ?auto_831245 ) ) ( not ( = ?auto_831238 ?auto_831246 ) ) ( not ( = ?auto_831238 ?auto_831247 ) ) ( not ( = ?auto_831238 ?auto_831248 ) ) ( not ( = ?auto_831238 ?auto_831249 ) ) ( not ( = ?auto_831238 ?auto_831250 ) ) ( not ( = ?auto_831238 ?auto_831251 ) ) ( not ( = ?auto_831238 ?auto_831252 ) ) ( not ( = ?auto_831239 ?auto_831240 ) ) ( not ( = ?auto_831239 ?auto_831241 ) ) ( not ( = ?auto_831239 ?auto_831242 ) ) ( not ( = ?auto_831239 ?auto_831243 ) ) ( not ( = ?auto_831239 ?auto_831244 ) ) ( not ( = ?auto_831239 ?auto_831245 ) ) ( not ( = ?auto_831239 ?auto_831246 ) ) ( not ( = ?auto_831239 ?auto_831247 ) ) ( not ( = ?auto_831239 ?auto_831248 ) ) ( not ( = ?auto_831239 ?auto_831249 ) ) ( not ( = ?auto_831239 ?auto_831250 ) ) ( not ( = ?auto_831239 ?auto_831251 ) ) ( not ( = ?auto_831239 ?auto_831252 ) ) ( not ( = ?auto_831240 ?auto_831241 ) ) ( not ( = ?auto_831240 ?auto_831242 ) ) ( not ( = ?auto_831240 ?auto_831243 ) ) ( not ( = ?auto_831240 ?auto_831244 ) ) ( not ( = ?auto_831240 ?auto_831245 ) ) ( not ( = ?auto_831240 ?auto_831246 ) ) ( not ( = ?auto_831240 ?auto_831247 ) ) ( not ( = ?auto_831240 ?auto_831248 ) ) ( not ( = ?auto_831240 ?auto_831249 ) ) ( not ( = ?auto_831240 ?auto_831250 ) ) ( not ( = ?auto_831240 ?auto_831251 ) ) ( not ( = ?auto_831240 ?auto_831252 ) ) ( not ( = ?auto_831241 ?auto_831242 ) ) ( not ( = ?auto_831241 ?auto_831243 ) ) ( not ( = ?auto_831241 ?auto_831244 ) ) ( not ( = ?auto_831241 ?auto_831245 ) ) ( not ( = ?auto_831241 ?auto_831246 ) ) ( not ( = ?auto_831241 ?auto_831247 ) ) ( not ( = ?auto_831241 ?auto_831248 ) ) ( not ( = ?auto_831241 ?auto_831249 ) ) ( not ( = ?auto_831241 ?auto_831250 ) ) ( not ( = ?auto_831241 ?auto_831251 ) ) ( not ( = ?auto_831241 ?auto_831252 ) ) ( not ( = ?auto_831242 ?auto_831243 ) ) ( not ( = ?auto_831242 ?auto_831244 ) ) ( not ( = ?auto_831242 ?auto_831245 ) ) ( not ( = ?auto_831242 ?auto_831246 ) ) ( not ( = ?auto_831242 ?auto_831247 ) ) ( not ( = ?auto_831242 ?auto_831248 ) ) ( not ( = ?auto_831242 ?auto_831249 ) ) ( not ( = ?auto_831242 ?auto_831250 ) ) ( not ( = ?auto_831242 ?auto_831251 ) ) ( not ( = ?auto_831242 ?auto_831252 ) ) ( not ( = ?auto_831243 ?auto_831244 ) ) ( not ( = ?auto_831243 ?auto_831245 ) ) ( not ( = ?auto_831243 ?auto_831246 ) ) ( not ( = ?auto_831243 ?auto_831247 ) ) ( not ( = ?auto_831243 ?auto_831248 ) ) ( not ( = ?auto_831243 ?auto_831249 ) ) ( not ( = ?auto_831243 ?auto_831250 ) ) ( not ( = ?auto_831243 ?auto_831251 ) ) ( not ( = ?auto_831243 ?auto_831252 ) ) ( not ( = ?auto_831244 ?auto_831245 ) ) ( not ( = ?auto_831244 ?auto_831246 ) ) ( not ( = ?auto_831244 ?auto_831247 ) ) ( not ( = ?auto_831244 ?auto_831248 ) ) ( not ( = ?auto_831244 ?auto_831249 ) ) ( not ( = ?auto_831244 ?auto_831250 ) ) ( not ( = ?auto_831244 ?auto_831251 ) ) ( not ( = ?auto_831244 ?auto_831252 ) ) ( not ( = ?auto_831245 ?auto_831246 ) ) ( not ( = ?auto_831245 ?auto_831247 ) ) ( not ( = ?auto_831245 ?auto_831248 ) ) ( not ( = ?auto_831245 ?auto_831249 ) ) ( not ( = ?auto_831245 ?auto_831250 ) ) ( not ( = ?auto_831245 ?auto_831251 ) ) ( not ( = ?auto_831245 ?auto_831252 ) ) ( not ( = ?auto_831246 ?auto_831247 ) ) ( not ( = ?auto_831246 ?auto_831248 ) ) ( not ( = ?auto_831246 ?auto_831249 ) ) ( not ( = ?auto_831246 ?auto_831250 ) ) ( not ( = ?auto_831246 ?auto_831251 ) ) ( not ( = ?auto_831246 ?auto_831252 ) ) ( not ( = ?auto_831247 ?auto_831248 ) ) ( not ( = ?auto_831247 ?auto_831249 ) ) ( not ( = ?auto_831247 ?auto_831250 ) ) ( not ( = ?auto_831247 ?auto_831251 ) ) ( not ( = ?auto_831247 ?auto_831252 ) ) ( not ( = ?auto_831248 ?auto_831249 ) ) ( not ( = ?auto_831248 ?auto_831250 ) ) ( not ( = ?auto_831248 ?auto_831251 ) ) ( not ( = ?auto_831248 ?auto_831252 ) ) ( not ( = ?auto_831249 ?auto_831250 ) ) ( not ( = ?auto_831249 ?auto_831251 ) ) ( not ( = ?auto_831249 ?auto_831252 ) ) ( not ( = ?auto_831250 ?auto_831251 ) ) ( not ( = ?auto_831250 ?auto_831252 ) ) ( not ( = ?auto_831251 ?auto_831252 ) ) ( ON ?auto_831250 ?auto_831251 ) ( CLEAR ?auto_831248 ) ( ON ?auto_831249 ?auto_831250 ) ( CLEAR ?auto_831249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_831238 ?auto_831239 ?auto_831240 ?auto_831241 ?auto_831242 ?auto_831243 ?auto_831244 ?auto_831245 ?auto_831246 ?auto_831247 ?auto_831248 ?auto_831249 )
      ( MAKE-14PILE ?auto_831238 ?auto_831239 ?auto_831240 ?auto_831241 ?auto_831242 ?auto_831243 ?auto_831244 ?auto_831245 ?auto_831246 ?auto_831247 ?auto_831248 ?auto_831249 ?auto_831250 ?auto_831251 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_831296 - BLOCK
      ?auto_831297 - BLOCK
      ?auto_831298 - BLOCK
      ?auto_831299 - BLOCK
      ?auto_831300 - BLOCK
      ?auto_831301 - BLOCK
      ?auto_831302 - BLOCK
      ?auto_831303 - BLOCK
      ?auto_831304 - BLOCK
      ?auto_831305 - BLOCK
      ?auto_831306 - BLOCK
      ?auto_831307 - BLOCK
      ?auto_831308 - BLOCK
      ?auto_831309 - BLOCK
    )
    :vars
    (
      ?auto_831310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_831309 ?auto_831310 ) ( ON-TABLE ?auto_831296 ) ( ON ?auto_831297 ?auto_831296 ) ( ON ?auto_831298 ?auto_831297 ) ( ON ?auto_831299 ?auto_831298 ) ( ON ?auto_831300 ?auto_831299 ) ( ON ?auto_831301 ?auto_831300 ) ( ON ?auto_831302 ?auto_831301 ) ( ON ?auto_831303 ?auto_831302 ) ( ON ?auto_831304 ?auto_831303 ) ( ON ?auto_831305 ?auto_831304 ) ( not ( = ?auto_831296 ?auto_831297 ) ) ( not ( = ?auto_831296 ?auto_831298 ) ) ( not ( = ?auto_831296 ?auto_831299 ) ) ( not ( = ?auto_831296 ?auto_831300 ) ) ( not ( = ?auto_831296 ?auto_831301 ) ) ( not ( = ?auto_831296 ?auto_831302 ) ) ( not ( = ?auto_831296 ?auto_831303 ) ) ( not ( = ?auto_831296 ?auto_831304 ) ) ( not ( = ?auto_831296 ?auto_831305 ) ) ( not ( = ?auto_831296 ?auto_831306 ) ) ( not ( = ?auto_831296 ?auto_831307 ) ) ( not ( = ?auto_831296 ?auto_831308 ) ) ( not ( = ?auto_831296 ?auto_831309 ) ) ( not ( = ?auto_831296 ?auto_831310 ) ) ( not ( = ?auto_831297 ?auto_831298 ) ) ( not ( = ?auto_831297 ?auto_831299 ) ) ( not ( = ?auto_831297 ?auto_831300 ) ) ( not ( = ?auto_831297 ?auto_831301 ) ) ( not ( = ?auto_831297 ?auto_831302 ) ) ( not ( = ?auto_831297 ?auto_831303 ) ) ( not ( = ?auto_831297 ?auto_831304 ) ) ( not ( = ?auto_831297 ?auto_831305 ) ) ( not ( = ?auto_831297 ?auto_831306 ) ) ( not ( = ?auto_831297 ?auto_831307 ) ) ( not ( = ?auto_831297 ?auto_831308 ) ) ( not ( = ?auto_831297 ?auto_831309 ) ) ( not ( = ?auto_831297 ?auto_831310 ) ) ( not ( = ?auto_831298 ?auto_831299 ) ) ( not ( = ?auto_831298 ?auto_831300 ) ) ( not ( = ?auto_831298 ?auto_831301 ) ) ( not ( = ?auto_831298 ?auto_831302 ) ) ( not ( = ?auto_831298 ?auto_831303 ) ) ( not ( = ?auto_831298 ?auto_831304 ) ) ( not ( = ?auto_831298 ?auto_831305 ) ) ( not ( = ?auto_831298 ?auto_831306 ) ) ( not ( = ?auto_831298 ?auto_831307 ) ) ( not ( = ?auto_831298 ?auto_831308 ) ) ( not ( = ?auto_831298 ?auto_831309 ) ) ( not ( = ?auto_831298 ?auto_831310 ) ) ( not ( = ?auto_831299 ?auto_831300 ) ) ( not ( = ?auto_831299 ?auto_831301 ) ) ( not ( = ?auto_831299 ?auto_831302 ) ) ( not ( = ?auto_831299 ?auto_831303 ) ) ( not ( = ?auto_831299 ?auto_831304 ) ) ( not ( = ?auto_831299 ?auto_831305 ) ) ( not ( = ?auto_831299 ?auto_831306 ) ) ( not ( = ?auto_831299 ?auto_831307 ) ) ( not ( = ?auto_831299 ?auto_831308 ) ) ( not ( = ?auto_831299 ?auto_831309 ) ) ( not ( = ?auto_831299 ?auto_831310 ) ) ( not ( = ?auto_831300 ?auto_831301 ) ) ( not ( = ?auto_831300 ?auto_831302 ) ) ( not ( = ?auto_831300 ?auto_831303 ) ) ( not ( = ?auto_831300 ?auto_831304 ) ) ( not ( = ?auto_831300 ?auto_831305 ) ) ( not ( = ?auto_831300 ?auto_831306 ) ) ( not ( = ?auto_831300 ?auto_831307 ) ) ( not ( = ?auto_831300 ?auto_831308 ) ) ( not ( = ?auto_831300 ?auto_831309 ) ) ( not ( = ?auto_831300 ?auto_831310 ) ) ( not ( = ?auto_831301 ?auto_831302 ) ) ( not ( = ?auto_831301 ?auto_831303 ) ) ( not ( = ?auto_831301 ?auto_831304 ) ) ( not ( = ?auto_831301 ?auto_831305 ) ) ( not ( = ?auto_831301 ?auto_831306 ) ) ( not ( = ?auto_831301 ?auto_831307 ) ) ( not ( = ?auto_831301 ?auto_831308 ) ) ( not ( = ?auto_831301 ?auto_831309 ) ) ( not ( = ?auto_831301 ?auto_831310 ) ) ( not ( = ?auto_831302 ?auto_831303 ) ) ( not ( = ?auto_831302 ?auto_831304 ) ) ( not ( = ?auto_831302 ?auto_831305 ) ) ( not ( = ?auto_831302 ?auto_831306 ) ) ( not ( = ?auto_831302 ?auto_831307 ) ) ( not ( = ?auto_831302 ?auto_831308 ) ) ( not ( = ?auto_831302 ?auto_831309 ) ) ( not ( = ?auto_831302 ?auto_831310 ) ) ( not ( = ?auto_831303 ?auto_831304 ) ) ( not ( = ?auto_831303 ?auto_831305 ) ) ( not ( = ?auto_831303 ?auto_831306 ) ) ( not ( = ?auto_831303 ?auto_831307 ) ) ( not ( = ?auto_831303 ?auto_831308 ) ) ( not ( = ?auto_831303 ?auto_831309 ) ) ( not ( = ?auto_831303 ?auto_831310 ) ) ( not ( = ?auto_831304 ?auto_831305 ) ) ( not ( = ?auto_831304 ?auto_831306 ) ) ( not ( = ?auto_831304 ?auto_831307 ) ) ( not ( = ?auto_831304 ?auto_831308 ) ) ( not ( = ?auto_831304 ?auto_831309 ) ) ( not ( = ?auto_831304 ?auto_831310 ) ) ( not ( = ?auto_831305 ?auto_831306 ) ) ( not ( = ?auto_831305 ?auto_831307 ) ) ( not ( = ?auto_831305 ?auto_831308 ) ) ( not ( = ?auto_831305 ?auto_831309 ) ) ( not ( = ?auto_831305 ?auto_831310 ) ) ( not ( = ?auto_831306 ?auto_831307 ) ) ( not ( = ?auto_831306 ?auto_831308 ) ) ( not ( = ?auto_831306 ?auto_831309 ) ) ( not ( = ?auto_831306 ?auto_831310 ) ) ( not ( = ?auto_831307 ?auto_831308 ) ) ( not ( = ?auto_831307 ?auto_831309 ) ) ( not ( = ?auto_831307 ?auto_831310 ) ) ( not ( = ?auto_831308 ?auto_831309 ) ) ( not ( = ?auto_831308 ?auto_831310 ) ) ( not ( = ?auto_831309 ?auto_831310 ) ) ( ON ?auto_831308 ?auto_831309 ) ( ON ?auto_831307 ?auto_831308 ) ( CLEAR ?auto_831305 ) ( ON ?auto_831306 ?auto_831307 ) ( CLEAR ?auto_831306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_831296 ?auto_831297 ?auto_831298 ?auto_831299 ?auto_831300 ?auto_831301 ?auto_831302 ?auto_831303 ?auto_831304 ?auto_831305 ?auto_831306 )
      ( MAKE-14PILE ?auto_831296 ?auto_831297 ?auto_831298 ?auto_831299 ?auto_831300 ?auto_831301 ?auto_831302 ?auto_831303 ?auto_831304 ?auto_831305 ?auto_831306 ?auto_831307 ?auto_831308 ?auto_831309 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_831354 - BLOCK
      ?auto_831355 - BLOCK
      ?auto_831356 - BLOCK
      ?auto_831357 - BLOCK
      ?auto_831358 - BLOCK
      ?auto_831359 - BLOCK
      ?auto_831360 - BLOCK
      ?auto_831361 - BLOCK
      ?auto_831362 - BLOCK
      ?auto_831363 - BLOCK
      ?auto_831364 - BLOCK
      ?auto_831365 - BLOCK
      ?auto_831366 - BLOCK
      ?auto_831367 - BLOCK
    )
    :vars
    (
      ?auto_831368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_831367 ?auto_831368 ) ( ON-TABLE ?auto_831354 ) ( ON ?auto_831355 ?auto_831354 ) ( ON ?auto_831356 ?auto_831355 ) ( ON ?auto_831357 ?auto_831356 ) ( ON ?auto_831358 ?auto_831357 ) ( ON ?auto_831359 ?auto_831358 ) ( ON ?auto_831360 ?auto_831359 ) ( ON ?auto_831361 ?auto_831360 ) ( ON ?auto_831362 ?auto_831361 ) ( not ( = ?auto_831354 ?auto_831355 ) ) ( not ( = ?auto_831354 ?auto_831356 ) ) ( not ( = ?auto_831354 ?auto_831357 ) ) ( not ( = ?auto_831354 ?auto_831358 ) ) ( not ( = ?auto_831354 ?auto_831359 ) ) ( not ( = ?auto_831354 ?auto_831360 ) ) ( not ( = ?auto_831354 ?auto_831361 ) ) ( not ( = ?auto_831354 ?auto_831362 ) ) ( not ( = ?auto_831354 ?auto_831363 ) ) ( not ( = ?auto_831354 ?auto_831364 ) ) ( not ( = ?auto_831354 ?auto_831365 ) ) ( not ( = ?auto_831354 ?auto_831366 ) ) ( not ( = ?auto_831354 ?auto_831367 ) ) ( not ( = ?auto_831354 ?auto_831368 ) ) ( not ( = ?auto_831355 ?auto_831356 ) ) ( not ( = ?auto_831355 ?auto_831357 ) ) ( not ( = ?auto_831355 ?auto_831358 ) ) ( not ( = ?auto_831355 ?auto_831359 ) ) ( not ( = ?auto_831355 ?auto_831360 ) ) ( not ( = ?auto_831355 ?auto_831361 ) ) ( not ( = ?auto_831355 ?auto_831362 ) ) ( not ( = ?auto_831355 ?auto_831363 ) ) ( not ( = ?auto_831355 ?auto_831364 ) ) ( not ( = ?auto_831355 ?auto_831365 ) ) ( not ( = ?auto_831355 ?auto_831366 ) ) ( not ( = ?auto_831355 ?auto_831367 ) ) ( not ( = ?auto_831355 ?auto_831368 ) ) ( not ( = ?auto_831356 ?auto_831357 ) ) ( not ( = ?auto_831356 ?auto_831358 ) ) ( not ( = ?auto_831356 ?auto_831359 ) ) ( not ( = ?auto_831356 ?auto_831360 ) ) ( not ( = ?auto_831356 ?auto_831361 ) ) ( not ( = ?auto_831356 ?auto_831362 ) ) ( not ( = ?auto_831356 ?auto_831363 ) ) ( not ( = ?auto_831356 ?auto_831364 ) ) ( not ( = ?auto_831356 ?auto_831365 ) ) ( not ( = ?auto_831356 ?auto_831366 ) ) ( not ( = ?auto_831356 ?auto_831367 ) ) ( not ( = ?auto_831356 ?auto_831368 ) ) ( not ( = ?auto_831357 ?auto_831358 ) ) ( not ( = ?auto_831357 ?auto_831359 ) ) ( not ( = ?auto_831357 ?auto_831360 ) ) ( not ( = ?auto_831357 ?auto_831361 ) ) ( not ( = ?auto_831357 ?auto_831362 ) ) ( not ( = ?auto_831357 ?auto_831363 ) ) ( not ( = ?auto_831357 ?auto_831364 ) ) ( not ( = ?auto_831357 ?auto_831365 ) ) ( not ( = ?auto_831357 ?auto_831366 ) ) ( not ( = ?auto_831357 ?auto_831367 ) ) ( not ( = ?auto_831357 ?auto_831368 ) ) ( not ( = ?auto_831358 ?auto_831359 ) ) ( not ( = ?auto_831358 ?auto_831360 ) ) ( not ( = ?auto_831358 ?auto_831361 ) ) ( not ( = ?auto_831358 ?auto_831362 ) ) ( not ( = ?auto_831358 ?auto_831363 ) ) ( not ( = ?auto_831358 ?auto_831364 ) ) ( not ( = ?auto_831358 ?auto_831365 ) ) ( not ( = ?auto_831358 ?auto_831366 ) ) ( not ( = ?auto_831358 ?auto_831367 ) ) ( not ( = ?auto_831358 ?auto_831368 ) ) ( not ( = ?auto_831359 ?auto_831360 ) ) ( not ( = ?auto_831359 ?auto_831361 ) ) ( not ( = ?auto_831359 ?auto_831362 ) ) ( not ( = ?auto_831359 ?auto_831363 ) ) ( not ( = ?auto_831359 ?auto_831364 ) ) ( not ( = ?auto_831359 ?auto_831365 ) ) ( not ( = ?auto_831359 ?auto_831366 ) ) ( not ( = ?auto_831359 ?auto_831367 ) ) ( not ( = ?auto_831359 ?auto_831368 ) ) ( not ( = ?auto_831360 ?auto_831361 ) ) ( not ( = ?auto_831360 ?auto_831362 ) ) ( not ( = ?auto_831360 ?auto_831363 ) ) ( not ( = ?auto_831360 ?auto_831364 ) ) ( not ( = ?auto_831360 ?auto_831365 ) ) ( not ( = ?auto_831360 ?auto_831366 ) ) ( not ( = ?auto_831360 ?auto_831367 ) ) ( not ( = ?auto_831360 ?auto_831368 ) ) ( not ( = ?auto_831361 ?auto_831362 ) ) ( not ( = ?auto_831361 ?auto_831363 ) ) ( not ( = ?auto_831361 ?auto_831364 ) ) ( not ( = ?auto_831361 ?auto_831365 ) ) ( not ( = ?auto_831361 ?auto_831366 ) ) ( not ( = ?auto_831361 ?auto_831367 ) ) ( not ( = ?auto_831361 ?auto_831368 ) ) ( not ( = ?auto_831362 ?auto_831363 ) ) ( not ( = ?auto_831362 ?auto_831364 ) ) ( not ( = ?auto_831362 ?auto_831365 ) ) ( not ( = ?auto_831362 ?auto_831366 ) ) ( not ( = ?auto_831362 ?auto_831367 ) ) ( not ( = ?auto_831362 ?auto_831368 ) ) ( not ( = ?auto_831363 ?auto_831364 ) ) ( not ( = ?auto_831363 ?auto_831365 ) ) ( not ( = ?auto_831363 ?auto_831366 ) ) ( not ( = ?auto_831363 ?auto_831367 ) ) ( not ( = ?auto_831363 ?auto_831368 ) ) ( not ( = ?auto_831364 ?auto_831365 ) ) ( not ( = ?auto_831364 ?auto_831366 ) ) ( not ( = ?auto_831364 ?auto_831367 ) ) ( not ( = ?auto_831364 ?auto_831368 ) ) ( not ( = ?auto_831365 ?auto_831366 ) ) ( not ( = ?auto_831365 ?auto_831367 ) ) ( not ( = ?auto_831365 ?auto_831368 ) ) ( not ( = ?auto_831366 ?auto_831367 ) ) ( not ( = ?auto_831366 ?auto_831368 ) ) ( not ( = ?auto_831367 ?auto_831368 ) ) ( ON ?auto_831366 ?auto_831367 ) ( ON ?auto_831365 ?auto_831366 ) ( ON ?auto_831364 ?auto_831365 ) ( CLEAR ?auto_831362 ) ( ON ?auto_831363 ?auto_831364 ) ( CLEAR ?auto_831363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_831354 ?auto_831355 ?auto_831356 ?auto_831357 ?auto_831358 ?auto_831359 ?auto_831360 ?auto_831361 ?auto_831362 ?auto_831363 )
      ( MAKE-14PILE ?auto_831354 ?auto_831355 ?auto_831356 ?auto_831357 ?auto_831358 ?auto_831359 ?auto_831360 ?auto_831361 ?auto_831362 ?auto_831363 ?auto_831364 ?auto_831365 ?auto_831366 ?auto_831367 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_831412 - BLOCK
      ?auto_831413 - BLOCK
      ?auto_831414 - BLOCK
      ?auto_831415 - BLOCK
      ?auto_831416 - BLOCK
      ?auto_831417 - BLOCK
      ?auto_831418 - BLOCK
      ?auto_831419 - BLOCK
      ?auto_831420 - BLOCK
      ?auto_831421 - BLOCK
      ?auto_831422 - BLOCK
      ?auto_831423 - BLOCK
      ?auto_831424 - BLOCK
      ?auto_831425 - BLOCK
    )
    :vars
    (
      ?auto_831426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_831425 ?auto_831426 ) ( ON-TABLE ?auto_831412 ) ( ON ?auto_831413 ?auto_831412 ) ( ON ?auto_831414 ?auto_831413 ) ( ON ?auto_831415 ?auto_831414 ) ( ON ?auto_831416 ?auto_831415 ) ( ON ?auto_831417 ?auto_831416 ) ( ON ?auto_831418 ?auto_831417 ) ( ON ?auto_831419 ?auto_831418 ) ( not ( = ?auto_831412 ?auto_831413 ) ) ( not ( = ?auto_831412 ?auto_831414 ) ) ( not ( = ?auto_831412 ?auto_831415 ) ) ( not ( = ?auto_831412 ?auto_831416 ) ) ( not ( = ?auto_831412 ?auto_831417 ) ) ( not ( = ?auto_831412 ?auto_831418 ) ) ( not ( = ?auto_831412 ?auto_831419 ) ) ( not ( = ?auto_831412 ?auto_831420 ) ) ( not ( = ?auto_831412 ?auto_831421 ) ) ( not ( = ?auto_831412 ?auto_831422 ) ) ( not ( = ?auto_831412 ?auto_831423 ) ) ( not ( = ?auto_831412 ?auto_831424 ) ) ( not ( = ?auto_831412 ?auto_831425 ) ) ( not ( = ?auto_831412 ?auto_831426 ) ) ( not ( = ?auto_831413 ?auto_831414 ) ) ( not ( = ?auto_831413 ?auto_831415 ) ) ( not ( = ?auto_831413 ?auto_831416 ) ) ( not ( = ?auto_831413 ?auto_831417 ) ) ( not ( = ?auto_831413 ?auto_831418 ) ) ( not ( = ?auto_831413 ?auto_831419 ) ) ( not ( = ?auto_831413 ?auto_831420 ) ) ( not ( = ?auto_831413 ?auto_831421 ) ) ( not ( = ?auto_831413 ?auto_831422 ) ) ( not ( = ?auto_831413 ?auto_831423 ) ) ( not ( = ?auto_831413 ?auto_831424 ) ) ( not ( = ?auto_831413 ?auto_831425 ) ) ( not ( = ?auto_831413 ?auto_831426 ) ) ( not ( = ?auto_831414 ?auto_831415 ) ) ( not ( = ?auto_831414 ?auto_831416 ) ) ( not ( = ?auto_831414 ?auto_831417 ) ) ( not ( = ?auto_831414 ?auto_831418 ) ) ( not ( = ?auto_831414 ?auto_831419 ) ) ( not ( = ?auto_831414 ?auto_831420 ) ) ( not ( = ?auto_831414 ?auto_831421 ) ) ( not ( = ?auto_831414 ?auto_831422 ) ) ( not ( = ?auto_831414 ?auto_831423 ) ) ( not ( = ?auto_831414 ?auto_831424 ) ) ( not ( = ?auto_831414 ?auto_831425 ) ) ( not ( = ?auto_831414 ?auto_831426 ) ) ( not ( = ?auto_831415 ?auto_831416 ) ) ( not ( = ?auto_831415 ?auto_831417 ) ) ( not ( = ?auto_831415 ?auto_831418 ) ) ( not ( = ?auto_831415 ?auto_831419 ) ) ( not ( = ?auto_831415 ?auto_831420 ) ) ( not ( = ?auto_831415 ?auto_831421 ) ) ( not ( = ?auto_831415 ?auto_831422 ) ) ( not ( = ?auto_831415 ?auto_831423 ) ) ( not ( = ?auto_831415 ?auto_831424 ) ) ( not ( = ?auto_831415 ?auto_831425 ) ) ( not ( = ?auto_831415 ?auto_831426 ) ) ( not ( = ?auto_831416 ?auto_831417 ) ) ( not ( = ?auto_831416 ?auto_831418 ) ) ( not ( = ?auto_831416 ?auto_831419 ) ) ( not ( = ?auto_831416 ?auto_831420 ) ) ( not ( = ?auto_831416 ?auto_831421 ) ) ( not ( = ?auto_831416 ?auto_831422 ) ) ( not ( = ?auto_831416 ?auto_831423 ) ) ( not ( = ?auto_831416 ?auto_831424 ) ) ( not ( = ?auto_831416 ?auto_831425 ) ) ( not ( = ?auto_831416 ?auto_831426 ) ) ( not ( = ?auto_831417 ?auto_831418 ) ) ( not ( = ?auto_831417 ?auto_831419 ) ) ( not ( = ?auto_831417 ?auto_831420 ) ) ( not ( = ?auto_831417 ?auto_831421 ) ) ( not ( = ?auto_831417 ?auto_831422 ) ) ( not ( = ?auto_831417 ?auto_831423 ) ) ( not ( = ?auto_831417 ?auto_831424 ) ) ( not ( = ?auto_831417 ?auto_831425 ) ) ( not ( = ?auto_831417 ?auto_831426 ) ) ( not ( = ?auto_831418 ?auto_831419 ) ) ( not ( = ?auto_831418 ?auto_831420 ) ) ( not ( = ?auto_831418 ?auto_831421 ) ) ( not ( = ?auto_831418 ?auto_831422 ) ) ( not ( = ?auto_831418 ?auto_831423 ) ) ( not ( = ?auto_831418 ?auto_831424 ) ) ( not ( = ?auto_831418 ?auto_831425 ) ) ( not ( = ?auto_831418 ?auto_831426 ) ) ( not ( = ?auto_831419 ?auto_831420 ) ) ( not ( = ?auto_831419 ?auto_831421 ) ) ( not ( = ?auto_831419 ?auto_831422 ) ) ( not ( = ?auto_831419 ?auto_831423 ) ) ( not ( = ?auto_831419 ?auto_831424 ) ) ( not ( = ?auto_831419 ?auto_831425 ) ) ( not ( = ?auto_831419 ?auto_831426 ) ) ( not ( = ?auto_831420 ?auto_831421 ) ) ( not ( = ?auto_831420 ?auto_831422 ) ) ( not ( = ?auto_831420 ?auto_831423 ) ) ( not ( = ?auto_831420 ?auto_831424 ) ) ( not ( = ?auto_831420 ?auto_831425 ) ) ( not ( = ?auto_831420 ?auto_831426 ) ) ( not ( = ?auto_831421 ?auto_831422 ) ) ( not ( = ?auto_831421 ?auto_831423 ) ) ( not ( = ?auto_831421 ?auto_831424 ) ) ( not ( = ?auto_831421 ?auto_831425 ) ) ( not ( = ?auto_831421 ?auto_831426 ) ) ( not ( = ?auto_831422 ?auto_831423 ) ) ( not ( = ?auto_831422 ?auto_831424 ) ) ( not ( = ?auto_831422 ?auto_831425 ) ) ( not ( = ?auto_831422 ?auto_831426 ) ) ( not ( = ?auto_831423 ?auto_831424 ) ) ( not ( = ?auto_831423 ?auto_831425 ) ) ( not ( = ?auto_831423 ?auto_831426 ) ) ( not ( = ?auto_831424 ?auto_831425 ) ) ( not ( = ?auto_831424 ?auto_831426 ) ) ( not ( = ?auto_831425 ?auto_831426 ) ) ( ON ?auto_831424 ?auto_831425 ) ( ON ?auto_831423 ?auto_831424 ) ( ON ?auto_831422 ?auto_831423 ) ( ON ?auto_831421 ?auto_831422 ) ( CLEAR ?auto_831419 ) ( ON ?auto_831420 ?auto_831421 ) ( CLEAR ?auto_831420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_831412 ?auto_831413 ?auto_831414 ?auto_831415 ?auto_831416 ?auto_831417 ?auto_831418 ?auto_831419 ?auto_831420 )
      ( MAKE-14PILE ?auto_831412 ?auto_831413 ?auto_831414 ?auto_831415 ?auto_831416 ?auto_831417 ?auto_831418 ?auto_831419 ?auto_831420 ?auto_831421 ?auto_831422 ?auto_831423 ?auto_831424 ?auto_831425 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_831470 - BLOCK
      ?auto_831471 - BLOCK
      ?auto_831472 - BLOCK
      ?auto_831473 - BLOCK
      ?auto_831474 - BLOCK
      ?auto_831475 - BLOCK
      ?auto_831476 - BLOCK
      ?auto_831477 - BLOCK
      ?auto_831478 - BLOCK
      ?auto_831479 - BLOCK
      ?auto_831480 - BLOCK
      ?auto_831481 - BLOCK
      ?auto_831482 - BLOCK
      ?auto_831483 - BLOCK
    )
    :vars
    (
      ?auto_831484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_831483 ?auto_831484 ) ( ON-TABLE ?auto_831470 ) ( ON ?auto_831471 ?auto_831470 ) ( ON ?auto_831472 ?auto_831471 ) ( ON ?auto_831473 ?auto_831472 ) ( ON ?auto_831474 ?auto_831473 ) ( ON ?auto_831475 ?auto_831474 ) ( ON ?auto_831476 ?auto_831475 ) ( not ( = ?auto_831470 ?auto_831471 ) ) ( not ( = ?auto_831470 ?auto_831472 ) ) ( not ( = ?auto_831470 ?auto_831473 ) ) ( not ( = ?auto_831470 ?auto_831474 ) ) ( not ( = ?auto_831470 ?auto_831475 ) ) ( not ( = ?auto_831470 ?auto_831476 ) ) ( not ( = ?auto_831470 ?auto_831477 ) ) ( not ( = ?auto_831470 ?auto_831478 ) ) ( not ( = ?auto_831470 ?auto_831479 ) ) ( not ( = ?auto_831470 ?auto_831480 ) ) ( not ( = ?auto_831470 ?auto_831481 ) ) ( not ( = ?auto_831470 ?auto_831482 ) ) ( not ( = ?auto_831470 ?auto_831483 ) ) ( not ( = ?auto_831470 ?auto_831484 ) ) ( not ( = ?auto_831471 ?auto_831472 ) ) ( not ( = ?auto_831471 ?auto_831473 ) ) ( not ( = ?auto_831471 ?auto_831474 ) ) ( not ( = ?auto_831471 ?auto_831475 ) ) ( not ( = ?auto_831471 ?auto_831476 ) ) ( not ( = ?auto_831471 ?auto_831477 ) ) ( not ( = ?auto_831471 ?auto_831478 ) ) ( not ( = ?auto_831471 ?auto_831479 ) ) ( not ( = ?auto_831471 ?auto_831480 ) ) ( not ( = ?auto_831471 ?auto_831481 ) ) ( not ( = ?auto_831471 ?auto_831482 ) ) ( not ( = ?auto_831471 ?auto_831483 ) ) ( not ( = ?auto_831471 ?auto_831484 ) ) ( not ( = ?auto_831472 ?auto_831473 ) ) ( not ( = ?auto_831472 ?auto_831474 ) ) ( not ( = ?auto_831472 ?auto_831475 ) ) ( not ( = ?auto_831472 ?auto_831476 ) ) ( not ( = ?auto_831472 ?auto_831477 ) ) ( not ( = ?auto_831472 ?auto_831478 ) ) ( not ( = ?auto_831472 ?auto_831479 ) ) ( not ( = ?auto_831472 ?auto_831480 ) ) ( not ( = ?auto_831472 ?auto_831481 ) ) ( not ( = ?auto_831472 ?auto_831482 ) ) ( not ( = ?auto_831472 ?auto_831483 ) ) ( not ( = ?auto_831472 ?auto_831484 ) ) ( not ( = ?auto_831473 ?auto_831474 ) ) ( not ( = ?auto_831473 ?auto_831475 ) ) ( not ( = ?auto_831473 ?auto_831476 ) ) ( not ( = ?auto_831473 ?auto_831477 ) ) ( not ( = ?auto_831473 ?auto_831478 ) ) ( not ( = ?auto_831473 ?auto_831479 ) ) ( not ( = ?auto_831473 ?auto_831480 ) ) ( not ( = ?auto_831473 ?auto_831481 ) ) ( not ( = ?auto_831473 ?auto_831482 ) ) ( not ( = ?auto_831473 ?auto_831483 ) ) ( not ( = ?auto_831473 ?auto_831484 ) ) ( not ( = ?auto_831474 ?auto_831475 ) ) ( not ( = ?auto_831474 ?auto_831476 ) ) ( not ( = ?auto_831474 ?auto_831477 ) ) ( not ( = ?auto_831474 ?auto_831478 ) ) ( not ( = ?auto_831474 ?auto_831479 ) ) ( not ( = ?auto_831474 ?auto_831480 ) ) ( not ( = ?auto_831474 ?auto_831481 ) ) ( not ( = ?auto_831474 ?auto_831482 ) ) ( not ( = ?auto_831474 ?auto_831483 ) ) ( not ( = ?auto_831474 ?auto_831484 ) ) ( not ( = ?auto_831475 ?auto_831476 ) ) ( not ( = ?auto_831475 ?auto_831477 ) ) ( not ( = ?auto_831475 ?auto_831478 ) ) ( not ( = ?auto_831475 ?auto_831479 ) ) ( not ( = ?auto_831475 ?auto_831480 ) ) ( not ( = ?auto_831475 ?auto_831481 ) ) ( not ( = ?auto_831475 ?auto_831482 ) ) ( not ( = ?auto_831475 ?auto_831483 ) ) ( not ( = ?auto_831475 ?auto_831484 ) ) ( not ( = ?auto_831476 ?auto_831477 ) ) ( not ( = ?auto_831476 ?auto_831478 ) ) ( not ( = ?auto_831476 ?auto_831479 ) ) ( not ( = ?auto_831476 ?auto_831480 ) ) ( not ( = ?auto_831476 ?auto_831481 ) ) ( not ( = ?auto_831476 ?auto_831482 ) ) ( not ( = ?auto_831476 ?auto_831483 ) ) ( not ( = ?auto_831476 ?auto_831484 ) ) ( not ( = ?auto_831477 ?auto_831478 ) ) ( not ( = ?auto_831477 ?auto_831479 ) ) ( not ( = ?auto_831477 ?auto_831480 ) ) ( not ( = ?auto_831477 ?auto_831481 ) ) ( not ( = ?auto_831477 ?auto_831482 ) ) ( not ( = ?auto_831477 ?auto_831483 ) ) ( not ( = ?auto_831477 ?auto_831484 ) ) ( not ( = ?auto_831478 ?auto_831479 ) ) ( not ( = ?auto_831478 ?auto_831480 ) ) ( not ( = ?auto_831478 ?auto_831481 ) ) ( not ( = ?auto_831478 ?auto_831482 ) ) ( not ( = ?auto_831478 ?auto_831483 ) ) ( not ( = ?auto_831478 ?auto_831484 ) ) ( not ( = ?auto_831479 ?auto_831480 ) ) ( not ( = ?auto_831479 ?auto_831481 ) ) ( not ( = ?auto_831479 ?auto_831482 ) ) ( not ( = ?auto_831479 ?auto_831483 ) ) ( not ( = ?auto_831479 ?auto_831484 ) ) ( not ( = ?auto_831480 ?auto_831481 ) ) ( not ( = ?auto_831480 ?auto_831482 ) ) ( not ( = ?auto_831480 ?auto_831483 ) ) ( not ( = ?auto_831480 ?auto_831484 ) ) ( not ( = ?auto_831481 ?auto_831482 ) ) ( not ( = ?auto_831481 ?auto_831483 ) ) ( not ( = ?auto_831481 ?auto_831484 ) ) ( not ( = ?auto_831482 ?auto_831483 ) ) ( not ( = ?auto_831482 ?auto_831484 ) ) ( not ( = ?auto_831483 ?auto_831484 ) ) ( ON ?auto_831482 ?auto_831483 ) ( ON ?auto_831481 ?auto_831482 ) ( ON ?auto_831480 ?auto_831481 ) ( ON ?auto_831479 ?auto_831480 ) ( ON ?auto_831478 ?auto_831479 ) ( CLEAR ?auto_831476 ) ( ON ?auto_831477 ?auto_831478 ) ( CLEAR ?auto_831477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_831470 ?auto_831471 ?auto_831472 ?auto_831473 ?auto_831474 ?auto_831475 ?auto_831476 ?auto_831477 )
      ( MAKE-14PILE ?auto_831470 ?auto_831471 ?auto_831472 ?auto_831473 ?auto_831474 ?auto_831475 ?auto_831476 ?auto_831477 ?auto_831478 ?auto_831479 ?auto_831480 ?auto_831481 ?auto_831482 ?auto_831483 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_831528 - BLOCK
      ?auto_831529 - BLOCK
      ?auto_831530 - BLOCK
      ?auto_831531 - BLOCK
      ?auto_831532 - BLOCK
      ?auto_831533 - BLOCK
      ?auto_831534 - BLOCK
      ?auto_831535 - BLOCK
      ?auto_831536 - BLOCK
      ?auto_831537 - BLOCK
      ?auto_831538 - BLOCK
      ?auto_831539 - BLOCK
      ?auto_831540 - BLOCK
      ?auto_831541 - BLOCK
    )
    :vars
    (
      ?auto_831542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_831541 ?auto_831542 ) ( ON-TABLE ?auto_831528 ) ( ON ?auto_831529 ?auto_831528 ) ( ON ?auto_831530 ?auto_831529 ) ( ON ?auto_831531 ?auto_831530 ) ( ON ?auto_831532 ?auto_831531 ) ( ON ?auto_831533 ?auto_831532 ) ( not ( = ?auto_831528 ?auto_831529 ) ) ( not ( = ?auto_831528 ?auto_831530 ) ) ( not ( = ?auto_831528 ?auto_831531 ) ) ( not ( = ?auto_831528 ?auto_831532 ) ) ( not ( = ?auto_831528 ?auto_831533 ) ) ( not ( = ?auto_831528 ?auto_831534 ) ) ( not ( = ?auto_831528 ?auto_831535 ) ) ( not ( = ?auto_831528 ?auto_831536 ) ) ( not ( = ?auto_831528 ?auto_831537 ) ) ( not ( = ?auto_831528 ?auto_831538 ) ) ( not ( = ?auto_831528 ?auto_831539 ) ) ( not ( = ?auto_831528 ?auto_831540 ) ) ( not ( = ?auto_831528 ?auto_831541 ) ) ( not ( = ?auto_831528 ?auto_831542 ) ) ( not ( = ?auto_831529 ?auto_831530 ) ) ( not ( = ?auto_831529 ?auto_831531 ) ) ( not ( = ?auto_831529 ?auto_831532 ) ) ( not ( = ?auto_831529 ?auto_831533 ) ) ( not ( = ?auto_831529 ?auto_831534 ) ) ( not ( = ?auto_831529 ?auto_831535 ) ) ( not ( = ?auto_831529 ?auto_831536 ) ) ( not ( = ?auto_831529 ?auto_831537 ) ) ( not ( = ?auto_831529 ?auto_831538 ) ) ( not ( = ?auto_831529 ?auto_831539 ) ) ( not ( = ?auto_831529 ?auto_831540 ) ) ( not ( = ?auto_831529 ?auto_831541 ) ) ( not ( = ?auto_831529 ?auto_831542 ) ) ( not ( = ?auto_831530 ?auto_831531 ) ) ( not ( = ?auto_831530 ?auto_831532 ) ) ( not ( = ?auto_831530 ?auto_831533 ) ) ( not ( = ?auto_831530 ?auto_831534 ) ) ( not ( = ?auto_831530 ?auto_831535 ) ) ( not ( = ?auto_831530 ?auto_831536 ) ) ( not ( = ?auto_831530 ?auto_831537 ) ) ( not ( = ?auto_831530 ?auto_831538 ) ) ( not ( = ?auto_831530 ?auto_831539 ) ) ( not ( = ?auto_831530 ?auto_831540 ) ) ( not ( = ?auto_831530 ?auto_831541 ) ) ( not ( = ?auto_831530 ?auto_831542 ) ) ( not ( = ?auto_831531 ?auto_831532 ) ) ( not ( = ?auto_831531 ?auto_831533 ) ) ( not ( = ?auto_831531 ?auto_831534 ) ) ( not ( = ?auto_831531 ?auto_831535 ) ) ( not ( = ?auto_831531 ?auto_831536 ) ) ( not ( = ?auto_831531 ?auto_831537 ) ) ( not ( = ?auto_831531 ?auto_831538 ) ) ( not ( = ?auto_831531 ?auto_831539 ) ) ( not ( = ?auto_831531 ?auto_831540 ) ) ( not ( = ?auto_831531 ?auto_831541 ) ) ( not ( = ?auto_831531 ?auto_831542 ) ) ( not ( = ?auto_831532 ?auto_831533 ) ) ( not ( = ?auto_831532 ?auto_831534 ) ) ( not ( = ?auto_831532 ?auto_831535 ) ) ( not ( = ?auto_831532 ?auto_831536 ) ) ( not ( = ?auto_831532 ?auto_831537 ) ) ( not ( = ?auto_831532 ?auto_831538 ) ) ( not ( = ?auto_831532 ?auto_831539 ) ) ( not ( = ?auto_831532 ?auto_831540 ) ) ( not ( = ?auto_831532 ?auto_831541 ) ) ( not ( = ?auto_831532 ?auto_831542 ) ) ( not ( = ?auto_831533 ?auto_831534 ) ) ( not ( = ?auto_831533 ?auto_831535 ) ) ( not ( = ?auto_831533 ?auto_831536 ) ) ( not ( = ?auto_831533 ?auto_831537 ) ) ( not ( = ?auto_831533 ?auto_831538 ) ) ( not ( = ?auto_831533 ?auto_831539 ) ) ( not ( = ?auto_831533 ?auto_831540 ) ) ( not ( = ?auto_831533 ?auto_831541 ) ) ( not ( = ?auto_831533 ?auto_831542 ) ) ( not ( = ?auto_831534 ?auto_831535 ) ) ( not ( = ?auto_831534 ?auto_831536 ) ) ( not ( = ?auto_831534 ?auto_831537 ) ) ( not ( = ?auto_831534 ?auto_831538 ) ) ( not ( = ?auto_831534 ?auto_831539 ) ) ( not ( = ?auto_831534 ?auto_831540 ) ) ( not ( = ?auto_831534 ?auto_831541 ) ) ( not ( = ?auto_831534 ?auto_831542 ) ) ( not ( = ?auto_831535 ?auto_831536 ) ) ( not ( = ?auto_831535 ?auto_831537 ) ) ( not ( = ?auto_831535 ?auto_831538 ) ) ( not ( = ?auto_831535 ?auto_831539 ) ) ( not ( = ?auto_831535 ?auto_831540 ) ) ( not ( = ?auto_831535 ?auto_831541 ) ) ( not ( = ?auto_831535 ?auto_831542 ) ) ( not ( = ?auto_831536 ?auto_831537 ) ) ( not ( = ?auto_831536 ?auto_831538 ) ) ( not ( = ?auto_831536 ?auto_831539 ) ) ( not ( = ?auto_831536 ?auto_831540 ) ) ( not ( = ?auto_831536 ?auto_831541 ) ) ( not ( = ?auto_831536 ?auto_831542 ) ) ( not ( = ?auto_831537 ?auto_831538 ) ) ( not ( = ?auto_831537 ?auto_831539 ) ) ( not ( = ?auto_831537 ?auto_831540 ) ) ( not ( = ?auto_831537 ?auto_831541 ) ) ( not ( = ?auto_831537 ?auto_831542 ) ) ( not ( = ?auto_831538 ?auto_831539 ) ) ( not ( = ?auto_831538 ?auto_831540 ) ) ( not ( = ?auto_831538 ?auto_831541 ) ) ( not ( = ?auto_831538 ?auto_831542 ) ) ( not ( = ?auto_831539 ?auto_831540 ) ) ( not ( = ?auto_831539 ?auto_831541 ) ) ( not ( = ?auto_831539 ?auto_831542 ) ) ( not ( = ?auto_831540 ?auto_831541 ) ) ( not ( = ?auto_831540 ?auto_831542 ) ) ( not ( = ?auto_831541 ?auto_831542 ) ) ( ON ?auto_831540 ?auto_831541 ) ( ON ?auto_831539 ?auto_831540 ) ( ON ?auto_831538 ?auto_831539 ) ( ON ?auto_831537 ?auto_831538 ) ( ON ?auto_831536 ?auto_831537 ) ( ON ?auto_831535 ?auto_831536 ) ( CLEAR ?auto_831533 ) ( ON ?auto_831534 ?auto_831535 ) ( CLEAR ?auto_831534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_831528 ?auto_831529 ?auto_831530 ?auto_831531 ?auto_831532 ?auto_831533 ?auto_831534 )
      ( MAKE-14PILE ?auto_831528 ?auto_831529 ?auto_831530 ?auto_831531 ?auto_831532 ?auto_831533 ?auto_831534 ?auto_831535 ?auto_831536 ?auto_831537 ?auto_831538 ?auto_831539 ?auto_831540 ?auto_831541 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_831586 - BLOCK
      ?auto_831587 - BLOCK
      ?auto_831588 - BLOCK
      ?auto_831589 - BLOCK
      ?auto_831590 - BLOCK
      ?auto_831591 - BLOCK
      ?auto_831592 - BLOCK
      ?auto_831593 - BLOCK
      ?auto_831594 - BLOCK
      ?auto_831595 - BLOCK
      ?auto_831596 - BLOCK
      ?auto_831597 - BLOCK
      ?auto_831598 - BLOCK
      ?auto_831599 - BLOCK
    )
    :vars
    (
      ?auto_831600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_831599 ?auto_831600 ) ( ON-TABLE ?auto_831586 ) ( ON ?auto_831587 ?auto_831586 ) ( ON ?auto_831588 ?auto_831587 ) ( ON ?auto_831589 ?auto_831588 ) ( ON ?auto_831590 ?auto_831589 ) ( not ( = ?auto_831586 ?auto_831587 ) ) ( not ( = ?auto_831586 ?auto_831588 ) ) ( not ( = ?auto_831586 ?auto_831589 ) ) ( not ( = ?auto_831586 ?auto_831590 ) ) ( not ( = ?auto_831586 ?auto_831591 ) ) ( not ( = ?auto_831586 ?auto_831592 ) ) ( not ( = ?auto_831586 ?auto_831593 ) ) ( not ( = ?auto_831586 ?auto_831594 ) ) ( not ( = ?auto_831586 ?auto_831595 ) ) ( not ( = ?auto_831586 ?auto_831596 ) ) ( not ( = ?auto_831586 ?auto_831597 ) ) ( not ( = ?auto_831586 ?auto_831598 ) ) ( not ( = ?auto_831586 ?auto_831599 ) ) ( not ( = ?auto_831586 ?auto_831600 ) ) ( not ( = ?auto_831587 ?auto_831588 ) ) ( not ( = ?auto_831587 ?auto_831589 ) ) ( not ( = ?auto_831587 ?auto_831590 ) ) ( not ( = ?auto_831587 ?auto_831591 ) ) ( not ( = ?auto_831587 ?auto_831592 ) ) ( not ( = ?auto_831587 ?auto_831593 ) ) ( not ( = ?auto_831587 ?auto_831594 ) ) ( not ( = ?auto_831587 ?auto_831595 ) ) ( not ( = ?auto_831587 ?auto_831596 ) ) ( not ( = ?auto_831587 ?auto_831597 ) ) ( not ( = ?auto_831587 ?auto_831598 ) ) ( not ( = ?auto_831587 ?auto_831599 ) ) ( not ( = ?auto_831587 ?auto_831600 ) ) ( not ( = ?auto_831588 ?auto_831589 ) ) ( not ( = ?auto_831588 ?auto_831590 ) ) ( not ( = ?auto_831588 ?auto_831591 ) ) ( not ( = ?auto_831588 ?auto_831592 ) ) ( not ( = ?auto_831588 ?auto_831593 ) ) ( not ( = ?auto_831588 ?auto_831594 ) ) ( not ( = ?auto_831588 ?auto_831595 ) ) ( not ( = ?auto_831588 ?auto_831596 ) ) ( not ( = ?auto_831588 ?auto_831597 ) ) ( not ( = ?auto_831588 ?auto_831598 ) ) ( not ( = ?auto_831588 ?auto_831599 ) ) ( not ( = ?auto_831588 ?auto_831600 ) ) ( not ( = ?auto_831589 ?auto_831590 ) ) ( not ( = ?auto_831589 ?auto_831591 ) ) ( not ( = ?auto_831589 ?auto_831592 ) ) ( not ( = ?auto_831589 ?auto_831593 ) ) ( not ( = ?auto_831589 ?auto_831594 ) ) ( not ( = ?auto_831589 ?auto_831595 ) ) ( not ( = ?auto_831589 ?auto_831596 ) ) ( not ( = ?auto_831589 ?auto_831597 ) ) ( not ( = ?auto_831589 ?auto_831598 ) ) ( not ( = ?auto_831589 ?auto_831599 ) ) ( not ( = ?auto_831589 ?auto_831600 ) ) ( not ( = ?auto_831590 ?auto_831591 ) ) ( not ( = ?auto_831590 ?auto_831592 ) ) ( not ( = ?auto_831590 ?auto_831593 ) ) ( not ( = ?auto_831590 ?auto_831594 ) ) ( not ( = ?auto_831590 ?auto_831595 ) ) ( not ( = ?auto_831590 ?auto_831596 ) ) ( not ( = ?auto_831590 ?auto_831597 ) ) ( not ( = ?auto_831590 ?auto_831598 ) ) ( not ( = ?auto_831590 ?auto_831599 ) ) ( not ( = ?auto_831590 ?auto_831600 ) ) ( not ( = ?auto_831591 ?auto_831592 ) ) ( not ( = ?auto_831591 ?auto_831593 ) ) ( not ( = ?auto_831591 ?auto_831594 ) ) ( not ( = ?auto_831591 ?auto_831595 ) ) ( not ( = ?auto_831591 ?auto_831596 ) ) ( not ( = ?auto_831591 ?auto_831597 ) ) ( not ( = ?auto_831591 ?auto_831598 ) ) ( not ( = ?auto_831591 ?auto_831599 ) ) ( not ( = ?auto_831591 ?auto_831600 ) ) ( not ( = ?auto_831592 ?auto_831593 ) ) ( not ( = ?auto_831592 ?auto_831594 ) ) ( not ( = ?auto_831592 ?auto_831595 ) ) ( not ( = ?auto_831592 ?auto_831596 ) ) ( not ( = ?auto_831592 ?auto_831597 ) ) ( not ( = ?auto_831592 ?auto_831598 ) ) ( not ( = ?auto_831592 ?auto_831599 ) ) ( not ( = ?auto_831592 ?auto_831600 ) ) ( not ( = ?auto_831593 ?auto_831594 ) ) ( not ( = ?auto_831593 ?auto_831595 ) ) ( not ( = ?auto_831593 ?auto_831596 ) ) ( not ( = ?auto_831593 ?auto_831597 ) ) ( not ( = ?auto_831593 ?auto_831598 ) ) ( not ( = ?auto_831593 ?auto_831599 ) ) ( not ( = ?auto_831593 ?auto_831600 ) ) ( not ( = ?auto_831594 ?auto_831595 ) ) ( not ( = ?auto_831594 ?auto_831596 ) ) ( not ( = ?auto_831594 ?auto_831597 ) ) ( not ( = ?auto_831594 ?auto_831598 ) ) ( not ( = ?auto_831594 ?auto_831599 ) ) ( not ( = ?auto_831594 ?auto_831600 ) ) ( not ( = ?auto_831595 ?auto_831596 ) ) ( not ( = ?auto_831595 ?auto_831597 ) ) ( not ( = ?auto_831595 ?auto_831598 ) ) ( not ( = ?auto_831595 ?auto_831599 ) ) ( not ( = ?auto_831595 ?auto_831600 ) ) ( not ( = ?auto_831596 ?auto_831597 ) ) ( not ( = ?auto_831596 ?auto_831598 ) ) ( not ( = ?auto_831596 ?auto_831599 ) ) ( not ( = ?auto_831596 ?auto_831600 ) ) ( not ( = ?auto_831597 ?auto_831598 ) ) ( not ( = ?auto_831597 ?auto_831599 ) ) ( not ( = ?auto_831597 ?auto_831600 ) ) ( not ( = ?auto_831598 ?auto_831599 ) ) ( not ( = ?auto_831598 ?auto_831600 ) ) ( not ( = ?auto_831599 ?auto_831600 ) ) ( ON ?auto_831598 ?auto_831599 ) ( ON ?auto_831597 ?auto_831598 ) ( ON ?auto_831596 ?auto_831597 ) ( ON ?auto_831595 ?auto_831596 ) ( ON ?auto_831594 ?auto_831595 ) ( ON ?auto_831593 ?auto_831594 ) ( ON ?auto_831592 ?auto_831593 ) ( CLEAR ?auto_831590 ) ( ON ?auto_831591 ?auto_831592 ) ( CLEAR ?auto_831591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_831586 ?auto_831587 ?auto_831588 ?auto_831589 ?auto_831590 ?auto_831591 )
      ( MAKE-14PILE ?auto_831586 ?auto_831587 ?auto_831588 ?auto_831589 ?auto_831590 ?auto_831591 ?auto_831592 ?auto_831593 ?auto_831594 ?auto_831595 ?auto_831596 ?auto_831597 ?auto_831598 ?auto_831599 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_831644 - BLOCK
      ?auto_831645 - BLOCK
      ?auto_831646 - BLOCK
      ?auto_831647 - BLOCK
      ?auto_831648 - BLOCK
      ?auto_831649 - BLOCK
      ?auto_831650 - BLOCK
      ?auto_831651 - BLOCK
      ?auto_831652 - BLOCK
      ?auto_831653 - BLOCK
      ?auto_831654 - BLOCK
      ?auto_831655 - BLOCK
      ?auto_831656 - BLOCK
      ?auto_831657 - BLOCK
    )
    :vars
    (
      ?auto_831658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_831657 ?auto_831658 ) ( ON-TABLE ?auto_831644 ) ( ON ?auto_831645 ?auto_831644 ) ( ON ?auto_831646 ?auto_831645 ) ( ON ?auto_831647 ?auto_831646 ) ( not ( = ?auto_831644 ?auto_831645 ) ) ( not ( = ?auto_831644 ?auto_831646 ) ) ( not ( = ?auto_831644 ?auto_831647 ) ) ( not ( = ?auto_831644 ?auto_831648 ) ) ( not ( = ?auto_831644 ?auto_831649 ) ) ( not ( = ?auto_831644 ?auto_831650 ) ) ( not ( = ?auto_831644 ?auto_831651 ) ) ( not ( = ?auto_831644 ?auto_831652 ) ) ( not ( = ?auto_831644 ?auto_831653 ) ) ( not ( = ?auto_831644 ?auto_831654 ) ) ( not ( = ?auto_831644 ?auto_831655 ) ) ( not ( = ?auto_831644 ?auto_831656 ) ) ( not ( = ?auto_831644 ?auto_831657 ) ) ( not ( = ?auto_831644 ?auto_831658 ) ) ( not ( = ?auto_831645 ?auto_831646 ) ) ( not ( = ?auto_831645 ?auto_831647 ) ) ( not ( = ?auto_831645 ?auto_831648 ) ) ( not ( = ?auto_831645 ?auto_831649 ) ) ( not ( = ?auto_831645 ?auto_831650 ) ) ( not ( = ?auto_831645 ?auto_831651 ) ) ( not ( = ?auto_831645 ?auto_831652 ) ) ( not ( = ?auto_831645 ?auto_831653 ) ) ( not ( = ?auto_831645 ?auto_831654 ) ) ( not ( = ?auto_831645 ?auto_831655 ) ) ( not ( = ?auto_831645 ?auto_831656 ) ) ( not ( = ?auto_831645 ?auto_831657 ) ) ( not ( = ?auto_831645 ?auto_831658 ) ) ( not ( = ?auto_831646 ?auto_831647 ) ) ( not ( = ?auto_831646 ?auto_831648 ) ) ( not ( = ?auto_831646 ?auto_831649 ) ) ( not ( = ?auto_831646 ?auto_831650 ) ) ( not ( = ?auto_831646 ?auto_831651 ) ) ( not ( = ?auto_831646 ?auto_831652 ) ) ( not ( = ?auto_831646 ?auto_831653 ) ) ( not ( = ?auto_831646 ?auto_831654 ) ) ( not ( = ?auto_831646 ?auto_831655 ) ) ( not ( = ?auto_831646 ?auto_831656 ) ) ( not ( = ?auto_831646 ?auto_831657 ) ) ( not ( = ?auto_831646 ?auto_831658 ) ) ( not ( = ?auto_831647 ?auto_831648 ) ) ( not ( = ?auto_831647 ?auto_831649 ) ) ( not ( = ?auto_831647 ?auto_831650 ) ) ( not ( = ?auto_831647 ?auto_831651 ) ) ( not ( = ?auto_831647 ?auto_831652 ) ) ( not ( = ?auto_831647 ?auto_831653 ) ) ( not ( = ?auto_831647 ?auto_831654 ) ) ( not ( = ?auto_831647 ?auto_831655 ) ) ( not ( = ?auto_831647 ?auto_831656 ) ) ( not ( = ?auto_831647 ?auto_831657 ) ) ( not ( = ?auto_831647 ?auto_831658 ) ) ( not ( = ?auto_831648 ?auto_831649 ) ) ( not ( = ?auto_831648 ?auto_831650 ) ) ( not ( = ?auto_831648 ?auto_831651 ) ) ( not ( = ?auto_831648 ?auto_831652 ) ) ( not ( = ?auto_831648 ?auto_831653 ) ) ( not ( = ?auto_831648 ?auto_831654 ) ) ( not ( = ?auto_831648 ?auto_831655 ) ) ( not ( = ?auto_831648 ?auto_831656 ) ) ( not ( = ?auto_831648 ?auto_831657 ) ) ( not ( = ?auto_831648 ?auto_831658 ) ) ( not ( = ?auto_831649 ?auto_831650 ) ) ( not ( = ?auto_831649 ?auto_831651 ) ) ( not ( = ?auto_831649 ?auto_831652 ) ) ( not ( = ?auto_831649 ?auto_831653 ) ) ( not ( = ?auto_831649 ?auto_831654 ) ) ( not ( = ?auto_831649 ?auto_831655 ) ) ( not ( = ?auto_831649 ?auto_831656 ) ) ( not ( = ?auto_831649 ?auto_831657 ) ) ( not ( = ?auto_831649 ?auto_831658 ) ) ( not ( = ?auto_831650 ?auto_831651 ) ) ( not ( = ?auto_831650 ?auto_831652 ) ) ( not ( = ?auto_831650 ?auto_831653 ) ) ( not ( = ?auto_831650 ?auto_831654 ) ) ( not ( = ?auto_831650 ?auto_831655 ) ) ( not ( = ?auto_831650 ?auto_831656 ) ) ( not ( = ?auto_831650 ?auto_831657 ) ) ( not ( = ?auto_831650 ?auto_831658 ) ) ( not ( = ?auto_831651 ?auto_831652 ) ) ( not ( = ?auto_831651 ?auto_831653 ) ) ( not ( = ?auto_831651 ?auto_831654 ) ) ( not ( = ?auto_831651 ?auto_831655 ) ) ( not ( = ?auto_831651 ?auto_831656 ) ) ( not ( = ?auto_831651 ?auto_831657 ) ) ( not ( = ?auto_831651 ?auto_831658 ) ) ( not ( = ?auto_831652 ?auto_831653 ) ) ( not ( = ?auto_831652 ?auto_831654 ) ) ( not ( = ?auto_831652 ?auto_831655 ) ) ( not ( = ?auto_831652 ?auto_831656 ) ) ( not ( = ?auto_831652 ?auto_831657 ) ) ( not ( = ?auto_831652 ?auto_831658 ) ) ( not ( = ?auto_831653 ?auto_831654 ) ) ( not ( = ?auto_831653 ?auto_831655 ) ) ( not ( = ?auto_831653 ?auto_831656 ) ) ( not ( = ?auto_831653 ?auto_831657 ) ) ( not ( = ?auto_831653 ?auto_831658 ) ) ( not ( = ?auto_831654 ?auto_831655 ) ) ( not ( = ?auto_831654 ?auto_831656 ) ) ( not ( = ?auto_831654 ?auto_831657 ) ) ( not ( = ?auto_831654 ?auto_831658 ) ) ( not ( = ?auto_831655 ?auto_831656 ) ) ( not ( = ?auto_831655 ?auto_831657 ) ) ( not ( = ?auto_831655 ?auto_831658 ) ) ( not ( = ?auto_831656 ?auto_831657 ) ) ( not ( = ?auto_831656 ?auto_831658 ) ) ( not ( = ?auto_831657 ?auto_831658 ) ) ( ON ?auto_831656 ?auto_831657 ) ( ON ?auto_831655 ?auto_831656 ) ( ON ?auto_831654 ?auto_831655 ) ( ON ?auto_831653 ?auto_831654 ) ( ON ?auto_831652 ?auto_831653 ) ( ON ?auto_831651 ?auto_831652 ) ( ON ?auto_831650 ?auto_831651 ) ( ON ?auto_831649 ?auto_831650 ) ( CLEAR ?auto_831647 ) ( ON ?auto_831648 ?auto_831649 ) ( CLEAR ?auto_831648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_831644 ?auto_831645 ?auto_831646 ?auto_831647 ?auto_831648 )
      ( MAKE-14PILE ?auto_831644 ?auto_831645 ?auto_831646 ?auto_831647 ?auto_831648 ?auto_831649 ?auto_831650 ?auto_831651 ?auto_831652 ?auto_831653 ?auto_831654 ?auto_831655 ?auto_831656 ?auto_831657 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_831702 - BLOCK
      ?auto_831703 - BLOCK
      ?auto_831704 - BLOCK
      ?auto_831705 - BLOCK
      ?auto_831706 - BLOCK
      ?auto_831707 - BLOCK
      ?auto_831708 - BLOCK
      ?auto_831709 - BLOCK
      ?auto_831710 - BLOCK
      ?auto_831711 - BLOCK
      ?auto_831712 - BLOCK
      ?auto_831713 - BLOCK
      ?auto_831714 - BLOCK
      ?auto_831715 - BLOCK
    )
    :vars
    (
      ?auto_831716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_831715 ?auto_831716 ) ( ON-TABLE ?auto_831702 ) ( ON ?auto_831703 ?auto_831702 ) ( ON ?auto_831704 ?auto_831703 ) ( not ( = ?auto_831702 ?auto_831703 ) ) ( not ( = ?auto_831702 ?auto_831704 ) ) ( not ( = ?auto_831702 ?auto_831705 ) ) ( not ( = ?auto_831702 ?auto_831706 ) ) ( not ( = ?auto_831702 ?auto_831707 ) ) ( not ( = ?auto_831702 ?auto_831708 ) ) ( not ( = ?auto_831702 ?auto_831709 ) ) ( not ( = ?auto_831702 ?auto_831710 ) ) ( not ( = ?auto_831702 ?auto_831711 ) ) ( not ( = ?auto_831702 ?auto_831712 ) ) ( not ( = ?auto_831702 ?auto_831713 ) ) ( not ( = ?auto_831702 ?auto_831714 ) ) ( not ( = ?auto_831702 ?auto_831715 ) ) ( not ( = ?auto_831702 ?auto_831716 ) ) ( not ( = ?auto_831703 ?auto_831704 ) ) ( not ( = ?auto_831703 ?auto_831705 ) ) ( not ( = ?auto_831703 ?auto_831706 ) ) ( not ( = ?auto_831703 ?auto_831707 ) ) ( not ( = ?auto_831703 ?auto_831708 ) ) ( not ( = ?auto_831703 ?auto_831709 ) ) ( not ( = ?auto_831703 ?auto_831710 ) ) ( not ( = ?auto_831703 ?auto_831711 ) ) ( not ( = ?auto_831703 ?auto_831712 ) ) ( not ( = ?auto_831703 ?auto_831713 ) ) ( not ( = ?auto_831703 ?auto_831714 ) ) ( not ( = ?auto_831703 ?auto_831715 ) ) ( not ( = ?auto_831703 ?auto_831716 ) ) ( not ( = ?auto_831704 ?auto_831705 ) ) ( not ( = ?auto_831704 ?auto_831706 ) ) ( not ( = ?auto_831704 ?auto_831707 ) ) ( not ( = ?auto_831704 ?auto_831708 ) ) ( not ( = ?auto_831704 ?auto_831709 ) ) ( not ( = ?auto_831704 ?auto_831710 ) ) ( not ( = ?auto_831704 ?auto_831711 ) ) ( not ( = ?auto_831704 ?auto_831712 ) ) ( not ( = ?auto_831704 ?auto_831713 ) ) ( not ( = ?auto_831704 ?auto_831714 ) ) ( not ( = ?auto_831704 ?auto_831715 ) ) ( not ( = ?auto_831704 ?auto_831716 ) ) ( not ( = ?auto_831705 ?auto_831706 ) ) ( not ( = ?auto_831705 ?auto_831707 ) ) ( not ( = ?auto_831705 ?auto_831708 ) ) ( not ( = ?auto_831705 ?auto_831709 ) ) ( not ( = ?auto_831705 ?auto_831710 ) ) ( not ( = ?auto_831705 ?auto_831711 ) ) ( not ( = ?auto_831705 ?auto_831712 ) ) ( not ( = ?auto_831705 ?auto_831713 ) ) ( not ( = ?auto_831705 ?auto_831714 ) ) ( not ( = ?auto_831705 ?auto_831715 ) ) ( not ( = ?auto_831705 ?auto_831716 ) ) ( not ( = ?auto_831706 ?auto_831707 ) ) ( not ( = ?auto_831706 ?auto_831708 ) ) ( not ( = ?auto_831706 ?auto_831709 ) ) ( not ( = ?auto_831706 ?auto_831710 ) ) ( not ( = ?auto_831706 ?auto_831711 ) ) ( not ( = ?auto_831706 ?auto_831712 ) ) ( not ( = ?auto_831706 ?auto_831713 ) ) ( not ( = ?auto_831706 ?auto_831714 ) ) ( not ( = ?auto_831706 ?auto_831715 ) ) ( not ( = ?auto_831706 ?auto_831716 ) ) ( not ( = ?auto_831707 ?auto_831708 ) ) ( not ( = ?auto_831707 ?auto_831709 ) ) ( not ( = ?auto_831707 ?auto_831710 ) ) ( not ( = ?auto_831707 ?auto_831711 ) ) ( not ( = ?auto_831707 ?auto_831712 ) ) ( not ( = ?auto_831707 ?auto_831713 ) ) ( not ( = ?auto_831707 ?auto_831714 ) ) ( not ( = ?auto_831707 ?auto_831715 ) ) ( not ( = ?auto_831707 ?auto_831716 ) ) ( not ( = ?auto_831708 ?auto_831709 ) ) ( not ( = ?auto_831708 ?auto_831710 ) ) ( not ( = ?auto_831708 ?auto_831711 ) ) ( not ( = ?auto_831708 ?auto_831712 ) ) ( not ( = ?auto_831708 ?auto_831713 ) ) ( not ( = ?auto_831708 ?auto_831714 ) ) ( not ( = ?auto_831708 ?auto_831715 ) ) ( not ( = ?auto_831708 ?auto_831716 ) ) ( not ( = ?auto_831709 ?auto_831710 ) ) ( not ( = ?auto_831709 ?auto_831711 ) ) ( not ( = ?auto_831709 ?auto_831712 ) ) ( not ( = ?auto_831709 ?auto_831713 ) ) ( not ( = ?auto_831709 ?auto_831714 ) ) ( not ( = ?auto_831709 ?auto_831715 ) ) ( not ( = ?auto_831709 ?auto_831716 ) ) ( not ( = ?auto_831710 ?auto_831711 ) ) ( not ( = ?auto_831710 ?auto_831712 ) ) ( not ( = ?auto_831710 ?auto_831713 ) ) ( not ( = ?auto_831710 ?auto_831714 ) ) ( not ( = ?auto_831710 ?auto_831715 ) ) ( not ( = ?auto_831710 ?auto_831716 ) ) ( not ( = ?auto_831711 ?auto_831712 ) ) ( not ( = ?auto_831711 ?auto_831713 ) ) ( not ( = ?auto_831711 ?auto_831714 ) ) ( not ( = ?auto_831711 ?auto_831715 ) ) ( not ( = ?auto_831711 ?auto_831716 ) ) ( not ( = ?auto_831712 ?auto_831713 ) ) ( not ( = ?auto_831712 ?auto_831714 ) ) ( not ( = ?auto_831712 ?auto_831715 ) ) ( not ( = ?auto_831712 ?auto_831716 ) ) ( not ( = ?auto_831713 ?auto_831714 ) ) ( not ( = ?auto_831713 ?auto_831715 ) ) ( not ( = ?auto_831713 ?auto_831716 ) ) ( not ( = ?auto_831714 ?auto_831715 ) ) ( not ( = ?auto_831714 ?auto_831716 ) ) ( not ( = ?auto_831715 ?auto_831716 ) ) ( ON ?auto_831714 ?auto_831715 ) ( ON ?auto_831713 ?auto_831714 ) ( ON ?auto_831712 ?auto_831713 ) ( ON ?auto_831711 ?auto_831712 ) ( ON ?auto_831710 ?auto_831711 ) ( ON ?auto_831709 ?auto_831710 ) ( ON ?auto_831708 ?auto_831709 ) ( ON ?auto_831707 ?auto_831708 ) ( ON ?auto_831706 ?auto_831707 ) ( CLEAR ?auto_831704 ) ( ON ?auto_831705 ?auto_831706 ) ( CLEAR ?auto_831705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_831702 ?auto_831703 ?auto_831704 ?auto_831705 )
      ( MAKE-14PILE ?auto_831702 ?auto_831703 ?auto_831704 ?auto_831705 ?auto_831706 ?auto_831707 ?auto_831708 ?auto_831709 ?auto_831710 ?auto_831711 ?auto_831712 ?auto_831713 ?auto_831714 ?auto_831715 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_831760 - BLOCK
      ?auto_831761 - BLOCK
      ?auto_831762 - BLOCK
      ?auto_831763 - BLOCK
      ?auto_831764 - BLOCK
      ?auto_831765 - BLOCK
      ?auto_831766 - BLOCK
      ?auto_831767 - BLOCK
      ?auto_831768 - BLOCK
      ?auto_831769 - BLOCK
      ?auto_831770 - BLOCK
      ?auto_831771 - BLOCK
      ?auto_831772 - BLOCK
      ?auto_831773 - BLOCK
    )
    :vars
    (
      ?auto_831774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_831773 ?auto_831774 ) ( ON-TABLE ?auto_831760 ) ( ON ?auto_831761 ?auto_831760 ) ( not ( = ?auto_831760 ?auto_831761 ) ) ( not ( = ?auto_831760 ?auto_831762 ) ) ( not ( = ?auto_831760 ?auto_831763 ) ) ( not ( = ?auto_831760 ?auto_831764 ) ) ( not ( = ?auto_831760 ?auto_831765 ) ) ( not ( = ?auto_831760 ?auto_831766 ) ) ( not ( = ?auto_831760 ?auto_831767 ) ) ( not ( = ?auto_831760 ?auto_831768 ) ) ( not ( = ?auto_831760 ?auto_831769 ) ) ( not ( = ?auto_831760 ?auto_831770 ) ) ( not ( = ?auto_831760 ?auto_831771 ) ) ( not ( = ?auto_831760 ?auto_831772 ) ) ( not ( = ?auto_831760 ?auto_831773 ) ) ( not ( = ?auto_831760 ?auto_831774 ) ) ( not ( = ?auto_831761 ?auto_831762 ) ) ( not ( = ?auto_831761 ?auto_831763 ) ) ( not ( = ?auto_831761 ?auto_831764 ) ) ( not ( = ?auto_831761 ?auto_831765 ) ) ( not ( = ?auto_831761 ?auto_831766 ) ) ( not ( = ?auto_831761 ?auto_831767 ) ) ( not ( = ?auto_831761 ?auto_831768 ) ) ( not ( = ?auto_831761 ?auto_831769 ) ) ( not ( = ?auto_831761 ?auto_831770 ) ) ( not ( = ?auto_831761 ?auto_831771 ) ) ( not ( = ?auto_831761 ?auto_831772 ) ) ( not ( = ?auto_831761 ?auto_831773 ) ) ( not ( = ?auto_831761 ?auto_831774 ) ) ( not ( = ?auto_831762 ?auto_831763 ) ) ( not ( = ?auto_831762 ?auto_831764 ) ) ( not ( = ?auto_831762 ?auto_831765 ) ) ( not ( = ?auto_831762 ?auto_831766 ) ) ( not ( = ?auto_831762 ?auto_831767 ) ) ( not ( = ?auto_831762 ?auto_831768 ) ) ( not ( = ?auto_831762 ?auto_831769 ) ) ( not ( = ?auto_831762 ?auto_831770 ) ) ( not ( = ?auto_831762 ?auto_831771 ) ) ( not ( = ?auto_831762 ?auto_831772 ) ) ( not ( = ?auto_831762 ?auto_831773 ) ) ( not ( = ?auto_831762 ?auto_831774 ) ) ( not ( = ?auto_831763 ?auto_831764 ) ) ( not ( = ?auto_831763 ?auto_831765 ) ) ( not ( = ?auto_831763 ?auto_831766 ) ) ( not ( = ?auto_831763 ?auto_831767 ) ) ( not ( = ?auto_831763 ?auto_831768 ) ) ( not ( = ?auto_831763 ?auto_831769 ) ) ( not ( = ?auto_831763 ?auto_831770 ) ) ( not ( = ?auto_831763 ?auto_831771 ) ) ( not ( = ?auto_831763 ?auto_831772 ) ) ( not ( = ?auto_831763 ?auto_831773 ) ) ( not ( = ?auto_831763 ?auto_831774 ) ) ( not ( = ?auto_831764 ?auto_831765 ) ) ( not ( = ?auto_831764 ?auto_831766 ) ) ( not ( = ?auto_831764 ?auto_831767 ) ) ( not ( = ?auto_831764 ?auto_831768 ) ) ( not ( = ?auto_831764 ?auto_831769 ) ) ( not ( = ?auto_831764 ?auto_831770 ) ) ( not ( = ?auto_831764 ?auto_831771 ) ) ( not ( = ?auto_831764 ?auto_831772 ) ) ( not ( = ?auto_831764 ?auto_831773 ) ) ( not ( = ?auto_831764 ?auto_831774 ) ) ( not ( = ?auto_831765 ?auto_831766 ) ) ( not ( = ?auto_831765 ?auto_831767 ) ) ( not ( = ?auto_831765 ?auto_831768 ) ) ( not ( = ?auto_831765 ?auto_831769 ) ) ( not ( = ?auto_831765 ?auto_831770 ) ) ( not ( = ?auto_831765 ?auto_831771 ) ) ( not ( = ?auto_831765 ?auto_831772 ) ) ( not ( = ?auto_831765 ?auto_831773 ) ) ( not ( = ?auto_831765 ?auto_831774 ) ) ( not ( = ?auto_831766 ?auto_831767 ) ) ( not ( = ?auto_831766 ?auto_831768 ) ) ( not ( = ?auto_831766 ?auto_831769 ) ) ( not ( = ?auto_831766 ?auto_831770 ) ) ( not ( = ?auto_831766 ?auto_831771 ) ) ( not ( = ?auto_831766 ?auto_831772 ) ) ( not ( = ?auto_831766 ?auto_831773 ) ) ( not ( = ?auto_831766 ?auto_831774 ) ) ( not ( = ?auto_831767 ?auto_831768 ) ) ( not ( = ?auto_831767 ?auto_831769 ) ) ( not ( = ?auto_831767 ?auto_831770 ) ) ( not ( = ?auto_831767 ?auto_831771 ) ) ( not ( = ?auto_831767 ?auto_831772 ) ) ( not ( = ?auto_831767 ?auto_831773 ) ) ( not ( = ?auto_831767 ?auto_831774 ) ) ( not ( = ?auto_831768 ?auto_831769 ) ) ( not ( = ?auto_831768 ?auto_831770 ) ) ( not ( = ?auto_831768 ?auto_831771 ) ) ( not ( = ?auto_831768 ?auto_831772 ) ) ( not ( = ?auto_831768 ?auto_831773 ) ) ( not ( = ?auto_831768 ?auto_831774 ) ) ( not ( = ?auto_831769 ?auto_831770 ) ) ( not ( = ?auto_831769 ?auto_831771 ) ) ( not ( = ?auto_831769 ?auto_831772 ) ) ( not ( = ?auto_831769 ?auto_831773 ) ) ( not ( = ?auto_831769 ?auto_831774 ) ) ( not ( = ?auto_831770 ?auto_831771 ) ) ( not ( = ?auto_831770 ?auto_831772 ) ) ( not ( = ?auto_831770 ?auto_831773 ) ) ( not ( = ?auto_831770 ?auto_831774 ) ) ( not ( = ?auto_831771 ?auto_831772 ) ) ( not ( = ?auto_831771 ?auto_831773 ) ) ( not ( = ?auto_831771 ?auto_831774 ) ) ( not ( = ?auto_831772 ?auto_831773 ) ) ( not ( = ?auto_831772 ?auto_831774 ) ) ( not ( = ?auto_831773 ?auto_831774 ) ) ( ON ?auto_831772 ?auto_831773 ) ( ON ?auto_831771 ?auto_831772 ) ( ON ?auto_831770 ?auto_831771 ) ( ON ?auto_831769 ?auto_831770 ) ( ON ?auto_831768 ?auto_831769 ) ( ON ?auto_831767 ?auto_831768 ) ( ON ?auto_831766 ?auto_831767 ) ( ON ?auto_831765 ?auto_831766 ) ( ON ?auto_831764 ?auto_831765 ) ( ON ?auto_831763 ?auto_831764 ) ( CLEAR ?auto_831761 ) ( ON ?auto_831762 ?auto_831763 ) ( CLEAR ?auto_831762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_831760 ?auto_831761 ?auto_831762 )
      ( MAKE-14PILE ?auto_831760 ?auto_831761 ?auto_831762 ?auto_831763 ?auto_831764 ?auto_831765 ?auto_831766 ?auto_831767 ?auto_831768 ?auto_831769 ?auto_831770 ?auto_831771 ?auto_831772 ?auto_831773 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_831818 - BLOCK
      ?auto_831819 - BLOCK
      ?auto_831820 - BLOCK
      ?auto_831821 - BLOCK
      ?auto_831822 - BLOCK
      ?auto_831823 - BLOCK
      ?auto_831824 - BLOCK
      ?auto_831825 - BLOCK
      ?auto_831826 - BLOCK
      ?auto_831827 - BLOCK
      ?auto_831828 - BLOCK
      ?auto_831829 - BLOCK
      ?auto_831830 - BLOCK
      ?auto_831831 - BLOCK
    )
    :vars
    (
      ?auto_831832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_831831 ?auto_831832 ) ( ON-TABLE ?auto_831818 ) ( not ( = ?auto_831818 ?auto_831819 ) ) ( not ( = ?auto_831818 ?auto_831820 ) ) ( not ( = ?auto_831818 ?auto_831821 ) ) ( not ( = ?auto_831818 ?auto_831822 ) ) ( not ( = ?auto_831818 ?auto_831823 ) ) ( not ( = ?auto_831818 ?auto_831824 ) ) ( not ( = ?auto_831818 ?auto_831825 ) ) ( not ( = ?auto_831818 ?auto_831826 ) ) ( not ( = ?auto_831818 ?auto_831827 ) ) ( not ( = ?auto_831818 ?auto_831828 ) ) ( not ( = ?auto_831818 ?auto_831829 ) ) ( not ( = ?auto_831818 ?auto_831830 ) ) ( not ( = ?auto_831818 ?auto_831831 ) ) ( not ( = ?auto_831818 ?auto_831832 ) ) ( not ( = ?auto_831819 ?auto_831820 ) ) ( not ( = ?auto_831819 ?auto_831821 ) ) ( not ( = ?auto_831819 ?auto_831822 ) ) ( not ( = ?auto_831819 ?auto_831823 ) ) ( not ( = ?auto_831819 ?auto_831824 ) ) ( not ( = ?auto_831819 ?auto_831825 ) ) ( not ( = ?auto_831819 ?auto_831826 ) ) ( not ( = ?auto_831819 ?auto_831827 ) ) ( not ( = ?auto_831819 ?auto_831828 ) ) ( not ( = ?auto_831819 ?auto_831829 ) ) ( not ( = ?auto_831819 ?auto_831830 ) ) ( not ( = ?auto_831819 ?auto_831831 ) ) ( not ( = ?auto_831819 ?auto_831832 ) ) ( not ( = ?auto_831820 ?auto_831821 ) ) ( not ( = ?auto_831820 ?auto_831822 ) ) ( not ( = ?auto_831820 ?auto_831823 ) ) ( not ( = ?auto_831820 ?auto_831824 ) ) ( not ( = ?auto_831820 ?auto_831825 ) ) ( not ( = ?auto_831820 ?auto_831826 ) ) ( not ( = ?auto_831820 ?auto_831827 ) ) ( not ( = ?auto_831820 ?auto_831828 ) ) ( not ( = ?auto_831820 ?auto_831829 ) ) ( not ( = ?auto_831820 ?auto_831830 ) ) ( not ( = ?auto_831820 ?auto_831831 ) ) ( not ( = ?auto_831820 ?auto_831832 ) ) ( not ( = ?auto_831821 ?auto_831822 ) ) ( not ( = ?auto_831821 ?auto_831823 ) ) ( not ( = ?auto_831821 ?auto_831824 ) ) ( not ( = ?auto_831821 ?auto_831825 ) ) ( not ( = ?auto_831821 ?auto_831826 ) ) ( not ( = ?auto_831821 ?auto_831827 ) ) ( not ( = ?auto_831821 ?auto_831828 ) ) ( not ( = ?auto_831821 ?auto_831829 ) ) ( not ( = ?auto_831821 ?auto_831830 ) ) ( not ( = ?auto_831821 ?auto_831831 ) ) ( not ( = ?auto_831821 ?auto_831832 ) ) ( not ( = ?auto_831822 ?auto_831823 ) ) ( not ( = ?auto_831822 ?auto_831824 ) ) ( not ( = ?auto_831822 ?auto_831825 ) ) ( not ( = ?auto_831822 ?auto_831826 ) ) ( not ( = ?auto_831822 ?auto_831827 ) ) ( not ( = ?auto_831822 ?auto_831828 ) ) ( not ( = ?auto_831822 ?auto_831829 ) ) ( not ( = ?auto_831822 ?auto_831830 ) ) ( not ( = ?auto_831822 ?auto_831831 ) ) ( not ( = ?auto_831822 ?auto_831832 ) ) ( not ( = ?auto_831823 ?auto_831824 ) ) ( not ( = ?auto_831823 ?auto_831825 ) ) ( not ( = ?auto_831823 ?auto_831826 ) ) ( not ( = ?auto_831823 ?auto_831827 ) ) ( not ( = ?auto_831823 ?auto_831828 ) ) ( not ( = ?auto_831823 ?auto_831829 ) ) ( not ( = ?auto_831823 ?auto_831830 ) ) ( not ( = ?auto_831823 ?auto_831831 ) ) ( not ( = ?auto_831823 ?auto_831832 ) ) ( not ( = ?auto_831824 ?auto_831825 ) ) ( not ( = ?auto_831824 ?auto_831826 ) ) ( not ( = ?auto_831824 ?auto_831827 ) ) ( not ( = ?auto_831824 ?auto_831828 ) ) ( not ( = ?auto_831824 ?auto_831829 ) ) ( not ( = ?auto_831824 ?auto_831830 ) ) ( not ( = ?auto_831824 ?auto_831831 ) ) ( not ( = ?auto_831824 ?auto_831832 ) ) ( not ( = ?auto_831825 ?auto_831826 ) ) ( not ( = ?auto_831825 ?auto_831827 ) ) ( not ( = ?auto_831825 ?auto_831828 ) ) ( not ( = ?auto_831825 ?auto_831829 ) ) ( not ( = ?auto_831825 ?auto_831830 ) ) ( not ( = ?auto_831825 ?auto_831831 ) ) ( not ( = ?auto_831825 ?auto_831832 ) ) ( not ( = ?auto_831826 ?auto_831827 ) ) ( not ( = ?auto_831826 ?auto_831828 ) ) ( not ( = ?auto_831826 ?auto_831829 ) ) ( not ( = ?auto_831826 ?auto_831830 ) ) ( not ( = ?auto_831826 ?auto_831831 ) ) ( not ( = ?auto_831826 ?auto_831832 ) ) ( not ( = ?auto_831827 ?auto_831828 ) ) ( not ( = ?auto_831827 ?auto_831829 ) ) ( not ( = ?auto_831827 ?auto_831830 ) ) ( not ( = ?auto_831827 ?auto_831831 ) ) ( not ( = ?auto_831827 ?auto_831832 ) ) ( not ( = ?auto_831828 ?auto_831829 ) ) ( not ( = ?auto_831828 ?auto_831830 ) ) ( not ( = ?auto_831828 ?auto_831831 ) ) ( not ( = ?auto_831828 ?auto_831832 ) ) ( not ( = ?auto_831829 ?auto_831830 ) ) ( not ( = ?auto_831829 ?auto_831831 ) ) ( not ( = ?auto_831829 ?auto_831832 ) ) ( not ( = ?auto_831830 ?auto_831831 ) ) ( not ( = ?auto_831830 ?auto_831832 ) ) ( not ( = ?auto_831831 ?auto_831832 ) ) ( ON ?auto_831830 ?auto_831831 ) ( ON ?auto_831829 ?auto_831830 ) ( ON ?auto_831828 ?auto_831829 ) ( ON ?auto_831827 ?auto_831828 ) ( ON ?auto_831826 ?auto_831827 ) ( ON ?auto_831825 ?auto_831826 ) ( ON ?auto_831824 ?auto_831825 ) ( ON ?auto_831823 ?auto_831824 ) ( ON ?auto_831822 ?auto_831823 ) ( ON ?auto_831821 ?auto_831822 ) ( ON ?auto_831820 ?auto_831821 ) ( CLEAR ?auto_831818 ) ( ON ?auto_831819 ?auto_831820 ) ( CLEAR ?auto_831819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_831818 ?auto_831819 )
      ( MAKE-14PILE ?auto_831818 ?auto_831819 ?auto_831820 ?auto_831821 ?auto_831822 ?auto_831823 ?auto_831824 ?auto_831825 ?auto_831826 ?auto_831827 ?auto_831828 ?auto_831829 ?auto_831830 ?auto_831831 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_831876 - BLOCK
      ?auto_831877 - BLOCK
      ?auto_831878 - BLOCK
      ?auto_831879 - BLOCK
      ?auto_831880 - BLOCK
      ?auto_831881 - BLOCK
      ?auto_831882 - BLOCK
      ?auto_831883 - BLOCK
      ?auto_831884 - BLOCK
      ?auto_831885 - BLOCK
      ?auto_831886 - BLOCK
      ?auto_831887 - BLOCK
      ?auto_831888 - BLOCK
      ?auto_831889 - BLOCK
    )
    :vars
    (
      ?auto_831890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_831889 ?auto_831890 ) ( not ( = ?auto_831876 ?auto_831877 ) ) ( not ( = ?auto_831876 ?auto_831878 ) ) ( not ( = ?auto_831876 ?auto_831879 ) ) ( not ( = ?auto_831876 ?auto_831880 ) ) ( not ( = ?auto_831876 ?auto_831881 ) ) ( not ( = ?auto_831876 ?auto_831882 ) ) ( not ( = ?auto_831876 ?auto_831883 ) ) ( not ( = ?auto_831876 ?auto_831884 ) ) ( not ( = ?auto_831876 ?auto_831885 ) ) ( not ( = ?auto_831876 ?auto_831886 ) ) ( not ( = ?auto_831876 ?auto_831887 ) ) ( not ( = ?auto_831876 ?auto_831888 ) ) ( not ( = ?auto_831876 ?auto_831889 ) ) ( not ( = ?auto_831876 ?auto_831890 ) ) ( not ( = ?auto_831877 ?auto_831878 ) ) ( not ( = ?auto_831877 ?auto_831879 ) ) ( not ( = ?auto_831877 ?auto_831880 ) ) ( not ( = ?auto_831877 ?auto_831881 ) ) ( not ( = ?auto_831877 ?auto_831882 ) ) ( not ( = ?auto_831877 ?auto_831883 ) ) ( not ( = ?auto_831877 ?auto_831884 ) ) ( not ( = ?auto_831877 ?auto_831885 ) ) ( not ( = ?auto_831877 ?auto_831886 ) ) ( not ( = ?auto_831877 ?auto_831887 ) ) ( not ( = ?auto_831877 ?auto_831888 ) ) ( not ( = ?auto_831877 ?auto_831889 ) ) ( not ( = ?auto_831877 ?auto_831890 ) ) ( not ( = ?auto_831878 ?auto_831879 ) ) ( not ( = ?auto_831878 ?auto_831880 ) ) ( not ( = ?auto_831878 ?auto_831881 ) ) ( not ( = ?auto_831878 ?auto_831882 ) ) ( not ( = ?auto_831878 ?auto_831883 ) ) ( not ( = ?auto_831878 ?auto_831884 ) ) ( not ( = ?auto_831878 ?auto_831885 ) ) ( not ( = ?auto_831878 ?auto_831886 ) ) ( not ( = ?auto_831878 ?auto_831887 ) ) ( not ( = ?auto_831878 ?auto_831888 ) ) ( not ( = ?auto_831878 ?auto_831889 ) ) ( not ( = ?auto_831878 ?auto_831890 ) ) ( not ( = ?auto_831879 ?auto_831880 ) ) ( not ( = ?auto_831879 ?auto_831881 ) ) ( not ( = ?auto_831879 ?auto_831882 ) ) ( not ( = ?auto_831879 ?auto_831883 ) ) ( not ( = ?auto_831879 ?auto_831884 ) ) ( not ( = ?auto_831879 ?auto_831885 ) ) ( not ( = ?auto_831879 ?auto_831886 ) ) ( not ( = ?auto_831879 ?auto_831887 ) ) ( not ( = ?auto_831879 ?auto_831888 ) ) ( not ( = ?auto_831879 ?auto_831889 ) ) ( not ( = ?auto_831879 ?auto_831890 ) ) ( not ( = ?auto_831880 ?auto_831881 ) ) ( not ( = ?auto_831880 ?auto_831882 ) ) ( not ( = ?auto_831880 ?auto_831883 ) ) ( not ( = ?auto_831880 ?auto_831884 ) ) ( not ( = ?auto_831880 ?auto_831885 ) ) ( not ( = ?auto_831880 ?auto_831886 ) ) ( not ( = ?auto_831880 ?auto_831887 ) ) ( not ( = ?auto_831880 ?auto_831888 ) ) ( not ( = ?auto_831880 ?auto_831889 ) ) ( not ( = ?auto_831880 ?auto_831890 ) ) ( not ( = ?auto_831881 ?auto_831882 ) ) ( not ( = ?auto_831881 ?auto_831883 ) ) ( not ( = ?auto_831881 ?auto_831884 ) ) ( not ( = ?auto_831881 ?auto_831885 ) ) ( not ( = ?auto_831881 ?auto_831886 ) ) ( not ( = ?auto_831881 ?auto_831887 ) ) ( not ( = ?auto_831881 ?auto_831888 ) ) ( not ( = ?auto_831881 ?auto_831889 ) ) ( not ( = ?auto_831881 ?auto_831890 ) ) ( not ( = ?auto_831882 ?auto_831883 ) ) ( not ( = ?auto_831882 ?auto_831884 ) ) ( not ( = ?auto_831882 ?auto_831885 ) ) ( not ( = ?auto_831882 ?auto_831886 ) ) ( not ( = ?auto_831882 ?auto_831887 ) ) ( not ( = ?auto_831882 ?auto_831888 ) ) ( not ( = ?auto_831882 ?auto_831889 ) ) ( not ( = ?auto_831882 ?auto_831890 ) ) ( not ( = ?auto_831883 ?auto_831884 ) ) ( not ( = ?auto_831883 ?auto_831885 ) ) ( not ( = ?auto_831883 ?auto_831886 ) ) ( not ( = ?auto_831883 ?auto_831887 ) ) ( not ( = ?auto_831883 ?auto_831888 ) ) ( not ( = ?auto_831883 ?auto_831889 ) ) ( not ( = ?auto_831883 ?auto_831890 ) ) ( not ( = ?auto_831884 ?auto_831885 ) ) ( not ( = ?auto_831884 ?auto_831886 ) ) ( not ( = ?auto_831884 ?auto_831887 ) ) ( not ( = ?auto_831884 ?auto_831888 ) ) ( not ( = ?auto_831884 ?auto_831889 ) ) ( not ( = ?auto_831884 ?auto_831890 ) ) ( not ( = ?auto_831885 ?auto_831886 ) ) ( not ( = ?auto_831885 ?auto_831887 ) ) ( not ( = ?auto_831885 ?auto_831888 ) ) ( not ( = ?auto_831885 ?auto_831889 ) ) ( not ( = ?auto_831885 ?auto_831890 ) ) ( not ( = ?auto_831886 ?auto_831887 ) ) ( not ( = ?auto_831886 ?auto_831888 ) ) ( not ( = ?auto_831886 ?auto_831889 ) ) ( not ( = ?auto_831886 ?auto_831890 ) ) ( not ( = ?auto_831887 ?auto_831888 ) ) ( not ( = ?auto_831887 ?auto_831889 ) ) ( not ( = ?auto_831887 ?auto_831890 ) ) ( not ( = ?auto_831888 ?auto_831889 ) ) ( not ( = ?auto_831888 ?auto_831890 ) ) ( not ( = ?auto_831889 ?auto_831890 ) ) ( ON ?auto_831888 ?auto_831889 ) ( ON ?auto_831887 ?auto_831888 ) ( ON ?auto_831886 ?auto_831887 ) ( ON ?auto_831885 ?auto_831886 ) ( ON ?auto_831884 ?auto_831885 ) ( ON ?auto_831883 ?auto_831884 ) ( ON ?auto_831882 ?auto_831883 ) ( ON ?auto_831881 ?auto_831882 ) ( ON ?auto_831880 ?auto_831881 ) ( ON ?auto_831879 ?auto_831880 ) ( ON ?auto_831878 ?auto_831879 ) ( ON ?auto_831877 ?auto_831878 ) ( ON ?auto_831876 ?auto_831877 ) ( CLEAR ?auto_831876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_831876 )
      ( MAKE-14PILE ?auto_831876 ?auto_831877 ?auto_831878 ?auto_831879 ?auto_831880 ?auto_831881 ?auto_831882 ?auto_831883 ?auto_831884 ?auto_831885 ?auto_831886 ?auto_831887 ?auto_831888 ?auto_831889 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_831935 - BLOCK
      ?auto_831936 - BLOCK
      ?auto_831937 - BLOCK
      ?auto_831938 - BLOCK
      ?auto_831939 - BLOCK
      ?auto_831940 - BLOCK
      ?auto_831941 - BLOCK
      ?auto_831942 - BLOCK
      ?auto_831943 - BLOCK
      ?auto_831944 - BLOCK
      ?auto_831945 - BLOCK
      ?auto_831946 - BLOCK
      ?auto_831947 - BLOCK
      ?auto_831948 - BLOCK
      ?auto_831949 - BLOCK
    )
    :vars
    (
      ?auto_831950 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_831948 ) ( ON ?auto_831949 ?auto_831950 ) ( CLEAR ?auto_831949 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_831935 ) ( ON ?auto_831936 ?auto_831935 ) ( ON ?auto_831937 ?auto_831936 ) ( ON ?auto_831938 ?auto_831937 ) ( ON ?auto_831939 ?auto_831938 ) ( ON ?auto_831940 ?auto_831939 ) ( ON ?auto_831941 ?auto_831940 ) ( ON ?auto_831942 ?auto_831941 ) ( ON ?auto_831943 ?auto_831942 ) ( ON ?auto_831944 ?auto_831943 ) ( ON ?auto_831945 ?auto_831944 ) ( ON ?auto_831946 ?auto_831945 ) ( ON ?auto_831947 ?auto_831946 ) ( ON ?auto_831948 ?auto_831947 ) ( not ( = ?auto_831935 ?auto_831936 ) ) ( not ( = ?auto_831935 ?auto_831937 ) ) ( not ( = ?auto_831935 ?auto_831938 ) ) ( not ( = ?auto_831935 ?auto_831939 ) ) ( not ( = ?auto_831935 ?auto_831940 ) ) ( not ( = ?auto_831935 ?auto_831941 ) ) ( not ( = ?auto_831935 ?auto_831942 ) ) ( not ( = ?auto_831935 ?auto_831943 ) ) ( not ( = ?auto_831935 ?auto_831944 ) ) ( not ( = ?auto_831935 ?auto_831945 ) ) ( not ( = ?auto_831935 ?auto_831946 ) ) ( not ( = ?auto_831935 ?auto_831947 ) ) ( not ( = ?auto_831935 ?auto_831948 ) ) ( not ( = ?auto_831935 ?auto_831949 ) ) ( not ( = ?auto_831935 ?auto_831950 ) ) ( not ( = ?auto_831936 ?auto_831937 ) ) ( not ( = ?auto_831936 ?auto_831938 ) ) ( not ( = ?auto_831936 ?auto_831939 ) ) ( not ( = ?auto_831936 ?auto_831940 ) ) ( not ( = ?auto_831936 ?auto_831941 ) ) ( not ( = ?auto_831936 ?auto_831942 ) ) ( not ( = ?auto_831936 ?auto_831943 ) ) ( not ( = ?auto_831936 ?auto_831944 ) ) ( not ( = ?auto_831936 ?auto_831945 ) ) ( not ( = ?auto_831936 ?auto_831946 ) ) ( not ( = ?auto_831936 ?auto_831947 ) ) ( not ( = ?auto_831936 ?auto_831948 ) ) ( not ( = ?auto_831936 ?auto_831949 ) ) ( not ( = ?auto_831936 ?auto_831950 ) ) ( not ( = ?auto_831937 ?auto_831938 ) ) ( not ( = ?auto_831937 ?auto_831939 ) ) ( not ( = ?auto_831937 ?auto_831940 ) ) ( not ( = ?auto_831937 ?auto_831941 ) ) ( not ( = ?auto_831937 ?auto_831942 ) ) ( not ( = ?auto_831937 ?auto_831943 ) ) ( not ( = ?auto_831937 ?auto_831944 ) ) ( not ( = ?auto_831937 ?auto_831945 ) ) ( not ( = ?auto_831937 ?auto_831946 ) ) ( not ( = ?auto_831937 ?auto_831947 ) ) ( not ( = ?auto_831937 ?auto_831948 ) ) ( not ( = ?auto_831937 ?auto_831949 ) ) ( not ( = ?auto_831937 ?auto_831950 ) ) ( not ( = ?auto_831938 ?auto_831939 ) ) ( not ( = ?auto_831938 ?auto_831940 ) ) ( not ( = ?auto_831938 ?auto_831941 ) ) ( not ( = ?auto_831938 ?auto_831942 ) ) ( not ( = ?auto_831938 ?auto_831943 ) ) ( not ( = ?auto_831938 ?auto_831944 ) ) ( not ( = ?auto_831938 ?auto_831945 ) ) ( not ( = ?auto_831938 ?auto_831946 ) ) ( not ( = ?auto_831938 ?auto_831947 ) ) ( not ( = ?auto_831938 ?auto_831948 ) ) ( not ( = ?auto_831938 ?auto_831949 ) ) ( not ( = ?auto_831938 ?auto_831950 ) ) ( not ( = ?auto_831939 ?auto_831940 ) ) ( not ( = ?auto_831939 ?auto_831941 ) ) ( not ( = ?auto_831939 ?auto_831942 ) ) ( not ( = ?auto_831939 ?auto_831943 ) ) ( not ( = ?auto_831939 ?auto_831944 ) ) ( not ( = ?auto_831939 ?auto_831945 ) ) ( not ( = ?auto_831939 ?auto_831946 ) ) ( not ( = ?auto_831939 ?auto_831947 ) ) ( not ( = ?auto_831939 ?auto_831948 ) ) ( not ( = ?auto_831939 ?auto_831949 ) ) ( not ( = ?auto_831939 ?auto_831950 ) ) ( not ( = ?auto_831940 ?auto_831941 ) ) ( not ( = ?auto_831940 ?auto_831942 ) ) ( not ( = ?auto_831940 ?auto_831943 ) ) ( not ( = ?auto_831940 ?auto_831944 ) ) ( not ( = ?auto_831940 ?auto_831945 ) ) ( not ( = ?auto_831940 ?auto_831946 ) ) ( not ( = ?auto_831940 ?auto_831947 ) ) ( not ( = ?auto_831940 ?auto_831948 ) ) ( not ( = ?auto_831940 ?auto_831949 ) ) ( not ( = ?auto_831940 ?auto_831950 ) ) ( not ( = ?auto_831941 ?auto_831942 ) ) ( not ( = ?auto_831941 ?auto_831943 ) ) ( not ( = ?auto_831941 ?auto_831944 ) ) ( not ( = ?auto_831941 ?auto_831945 ) ) ( not ( = ?auto_831941 ?auto_831946 ) ) ( not ( = ?auto_831941 ?auto_831947 ) ) ( not ( = ?auto_831941 ?auto_831948 ) ) ( not ( = ?auto_831941 ?auto_831949 ) ) ( not ( = ?auto_831941 ?auto_831950 ) ) ( not ( = ?auto_831942 ?auto_831943 ) ) ( not ( = ?auto_831942 ?auto_831944 ) ) ( not ( = ?auto_831942 ?auto_831945 ) ) ( not ( = ?auto_831942 ?auto_831946 ) ) ( not ( = ?auto_831942 ?auto_831947 ) ) ( not ( = ?auto_831942 ?auto_831948 ) ) ( not ( = ?auto_831942 ?auto_831949 ) ) ( not ( = ?auto_831942 ?auto_831950 ) ) ( not ( = ?auto_831943 ?auto_831944 ) ) ( not ( = ?auto_831943 ?auto_831945 ) ) ( not ( = ?auto_831943 ?auto_831946 ) ) ( not ( = ?auto_831943 ?auto_831947 ) ) ( not ( = ?auto_831943 ?auto_831948 ) ) ( not ( = ?auto_831943 ?auto_831949 ) ) ( not ( = ?auto_831943 ?auto_831950 ) ) ( not ( = ?auto_831944 ?auto_831945 ) ) ( not ( = ?auto_831944 ?auto_831946 ) ) ( not ( = ?auto_831944 ?auto_831947 ) ) ( not ( = ?auto_831944 ?auto_831948 ) ) ( not ( = ?auto_831944 ?auto_831949 ) ) ( not ( = ?auto_831944 ?auto_831950 ) ) ( not ( = ?auto_831945 ?auto_831946 ) ) ( not ( = ?auto_831945 ?auto_831947 ) ) ( not ( = ?auto_831945 ?auto_831948 ) ) ( not ( = ?auto_831945 ?auto_831949 ) ) ( not ( = ?auto_831945 ?auto_831950 ) ) ( not ( = ?auto_831946 ?auto_831947 ) ) ( not ( = ?auto_831946 ?auto_831948 ) ) ( not ( = ?auto_831946 ?auto_831949 ) ) ( not ( = ?auto_831946 ?auto_831950 ) ) ( not ( = ?auto_831947 ?auto_831948 ) ) ( not ( = ?auto_831947 ?auto_831949 ) ) ( not ( = ?auto_831947 ?auto_831950 ) ) ( not ( = ?auto_831948 ?auto_831949 ) ) ( not ( = ?auto_831948 ?auto_831950 ) ) ( not ( = ?auto_831949 ?auto_831950 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_831949 ?auto_831950 )
      ( !STACK ?auto_831949 ?auto_831948 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_831997 - BLOCK
      ?auto_831998 - BLOCK
      ?auto_831999 - BLOCK
      ?auto_832000 - BLOCK
      ?auto_832001 - BLOCK
      ?auto_832002 - BLOCK
      ?auto_832003 - BLOCK
      ?auto_832004 - BLOCK
      ?auto_832005 - BLOCK
      ?auto_832006 - BLOCK
      ?auto_832007 - BLOCK
      ?auto_832008 - BLOCK
      ?auto_832009 - BLOCK
      ?auto_832010 - BLOCK
      ?auto_832011 - BLOCK
    )
    :vars
    (
      ?auto_832012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_832011 ?auto_832012 ) ( ON-TABLE ?auto_831997 ) ( ON ?auto_831998 ?auto_831997 ) ( ON ?auto_831999 ?auto_831998 ) ( ON ?auto_832000 ?auto_831999 ) ( ON ?auto_832001 ?auto_832000 ) ( ON ?auto_832002 ?auto_832001 ) ( ON ?auto_832003 ?auto_832002 ) ( ON ?auto_832004 ?auto_832003 ) ( ON ?auto_832005 ?auto_832004 ) ( ON ?auto_832006 ?auto_832005 ) ( ON ?auto_832007 ?auto_832006 ) ( ON ?auto_832008 ?auto_832007 ) ( ON ?auto_832009 ?auto_832008 ) ( not ( = ?auto_831997 ?auto_831998 ) ) ( not ( = ?auto_831997 ?auto_831999 ) ) ( not ( = ?auto_831997 ?auto_832000 ) ) ( not ( = ?auto_831997 ?auto_832001 ) ) ( not ( = ?auto_831997 ?auto_832002 ) ) ( not ( = ?auto_831997 ?auto_832003 ) ) ( not ( = ?auto_831997 ?auto_832004 ) ) ( not ( = ?auto_831997 ?auto_832005 ) ) ( not ( = ?auto_831997 ?auto_832006 ) ) ( not ( = ?auto_831997 ?auto_832007 ) ) ( not ( = ?auto_831997 ?auto_832008 ) ) ( not ( = ?auto_831997 ?auto_832009 ) ) ( not ( = ?auto_831997 ?auto_832010 ) ) ( not ( = ?auto_831997 ?auto_832011 ) ) ( not ( = ?auto_831997 ?auto_832012 ) ) ( not ( = ?auto_831998 ?auto_831999 ) ) ( not ( = ?auto_831998 ?auto_832000 ) ) ( not ( = ?auto_831998 ?auto_832001 ) ) ( not ( = ?auto_831998 ?auto_832002 ) ) ( not ( = ?auto_831998 ?auto_832003 ) ) ( not ( = ?auto_831998 ?auto_832004 ) ) ( not ( = ?auto_831998 ?auto_832005 ) ) ( not ( = ?auto_831998 ?auto_832006 ) ) ( not ( = ?auto_831998 ?auto_832007 ) ) ( not ( = ?auto_831998 ?auto_832008 ) ) ( not ( = ?auto_831998 ?auto_832009 ) ) ( not ( = ?auto_831998 ?auto_832010 ) ) ( not ( = ?auto_831998 ?auto_832011 ) ) ( not ( = ?auto_831998 ?auto_832012 ) ) ( not ( = ?auto_831999 ?auto_832000 ) ) ( not ( = ?auto_831999 ?auto_832001 ) ) ( not ( = ?auto_831999 ?auto_832002 ) ) ( not ( = ?auto_831999 ?auto_832003 ) ) ( not ( = ?auto_831999 ?auto_832004 ) ) ( not ( = ?auto_831999 ?auto_832005 ) ) ( not ( = ?auto_831999 ?auto_832006 ) ) ( not ( = ?auto_831999 ?auto_832007 ) ) ( not ( = ?auto_831999 ?auto_832008 ) ) ( not ( = ?auto_831999 ?auto_832009 ) ) ( not ( = ?auto_831999 ?auto_832010 ) ) ( not ( = ?auto_831999 ?auto_832011 ) ) ( not ( = ?auto_831999 ?auto_832012 ) ) ( not ( = ?auto_832000 ?auto_832001 ) ) ( not ( = ?auto_832000 ?auto_832002 ) ) ( not ( = ?auto_832000 ?auto_832003 ) ) ( not ( = ?auto_832000 ?auto_832004 ) ) ( not ( = ?auto_832000 ?auto_832005 ) ) ( not ( = ?auto_832000 ?auto_832006 ) ) ( not ( = ?auto_832000 ?auto_832007 ) ) ( not ( = ?auto_832000 ?auto_832008 ) ) ( not ( = ?auto_832000 ?auto_832009 ) ) ( not ( = ?auto_832000 ?auto_832010 ) ) ( not ( = ?auto_832000 ?auto_832011 ) ) ( not ( = ?auto_832000 ?auto_832012 ) ) ( not ( = ?auto_832001 ?auto_832002 ) ) ( not ( = ?auto_832001 ?auto_832003 ) ) ( not ( = ?auto_832001 ?auto_832004 ) ) ( not ( = ?auto_832001 ?auto_832005 ) ) ( not ( = ?auto_832001 ?auto_832006 ) ) ( not ( = ?auto_832001 ?auto_832007 ) ) ( not ( = ?auto_832001 ?auto_832008 ) ) ( not ( = ?auto_832001 ?auto_832009 ) ) ( not ( = ?auto_832001 ?auto_832010 ) ) ( not ( = ?auto_832001 ?auto_832011 ) ) ( not ( = ?auto_832001 ?auto_832012 ) ) ( not ( = ?auto_832002 ?auto_832003 ) ) ( not ( = ?auto_832002 ?auto_832004 ) ) ( not ( = ?auto_832002 ?auto_832005 ) ) ( not ( = ?auto_832002 ?auto_832006 ) ) ( not ( = ?auto_832002 ?auto_832007 ) ) ( not ( = ?auto_832002 ?auto_832008 ) ) ( not ( = ?auto_832002 ?auto_832009 ) ) ( not ( = ?auto_832002 ?auto_832010 ) ) ( not ( = ?auto_832002 ?auto_832011 ) ) ( not ( = ?auto_832002 ?auto_832012 ) ) ( not ( = ?auto_832003 ?auto_832004 ) ) ( not ( = ?auto_832003 ?auto_832005 ) ) ( not ( = ?auto_832003 ?auto_832006 ) ) ( not ( = ?auto_832003 ?auto_832007 ) ) ( not ( = ?auto_832003 ?auto_832008 ) ) ( not ( = ?auto_832003 ?auto_832009 ) ) ( not ( = ?auto_832003 ?auto_832010 ) ) ( not ( = ?auto_832003 ?auto_832011 ) ) ( not ( = ?auto_832003 ?auto_832012 ) ) ( not ( = ?auto_832004 ?auto_832005 ) ) ( not ( = ?auto_832004 ?auto_832006 ) ) ( not ( = ?auto_832004 ?auto_832007 ) ) ( not ( = ?auto_832004 ?auto_832008 ) ) ( not ( = ?auto_832004 ?auto_832009 ) ) ( not ( = ?auto_832004 ?auto_832010 ) ) ( not ( = ?auto_832004 ?auto_832011 ) ) ( not ( = ?auto_832004 ?auto_832012 ) ) ( not ( = ?auto_832005 ?auto_832006 ) ) ( not ( = ?auto_832005 ?auto_832007 ) ) ( not ( = ?auto_832005 ?auto_832008 ) ) ( not ( = ?auto_832005 ?auto_832009 ) ) ( not ( = ?auto_832005 ?auto_832010 ) ) ( not ( = ?auto_832005 ?auto_832011 ) ) ( not ( = ?auto_832005 ?auto_832012 ) ) ( not ( = ?auto_832006 ?auto_832007 ) ) ( not ( = ?auto_832006 ?auto_832008 ) ) ( not ( = ?auto_832006 ?auto_832009 ) ) ( not ( = ?auto_832006 ?auto_832010 ) ) ( not ( = ?auto_832006 ?auto_832011 ) ) ( not ( = ?auto_832006 ?auto_832012 ) ) ( not ( = ?auto_832007 ?auto_832008 ) ) ( not ( = ?auto_832007 ?auto_832009 ) ) ( not ( = ?auto_832007 ?auto_832010 ) ) ( not ( = ?auto_832007 ?auto_832011 ) ) ( not ( = ?auto_832007 ?auto_832012 ) ) ( not ( = ?auto_832008 ?auto_832009 ) ) ( not ( = ?auto_832008 ?auto_832010 ) ) ( not ( = ?auto_832008 ?auto_832011 ) ) ( not ( = ?auto_832008 ?auto_832012 ) ) ( not ( = ?auto_832009 ?auto_832010 ) ) ( not ( = ?auto_832009 ?auto_832011 ) ) ( not ( = ?auto_832009 ?auto_832012 ) ) ( not ( = ?auto_832010 ?auto_832011 ) ) ( not ( = ?auto_832010 ?auto_832012 ) ) ( not ( = ?auto_832011 ?auto_832012 ) ) ( CLEAR ?auto_832009 ) ( ON ?auto_832010 ?auto_832011 ) ( CLEAR ?auto_832010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_831997 ?auto_831998 ?auto_831999 ?auto_832000 ?auto_832001 ?auto_832002 ?auto_832003 ?auto_832004 ?auto_832005 ?auto_832006 ?auto_832007 ?auto_832008 ?auto_832009 ?auto_832010 )
      ( MAKE-15PILE ?auto_831997 ?auto_831998 ?auto_831999 ?auto_832000 ?auto_832001 ?auto_832002 ?auto_832003 ?auto_832004 ?auto_832005 ?auto_832006 ?auto_832007 ?auto_832008 ?auto_832009 ?auto_832010 ?auto_832011 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_832059 - BLOCK
      ?auto_832060 - BLOCK
      ?auto_832061 - BLOCK
      ?auto_832062 - BLOCK
      ?auto_832063 - BLOCK
      ?auto_832064 - BLOCK
      ?auto_832065 - BLOCK
      ?auto_832066 - BLOCK
      ?auto_832067 - BLOCK
      ?auto_832068 - BLOCK
      ?auto_832069 - BLOCK
      ?auto_832070 - BLOCK
      ?auto_832071 - BLOCK
      ?auto_832072 - BLOCK
      ?auto_832073 - BLOCK
    )
    :vars
    (
      ?auto_832074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_832073 ?auto_832074 ) ( ON-TABLE ?auto_832059 ) ( ON ?auto_832060 ?auto_832059 ) ( ON ?auto_832061 ?auto_832060 ) ( ON ?auto_832062 ?auto_832061 ) ( ON ?auto_832063 ?auto_832062 ) ( ON ?auto_832064 ?auto_832063 ) ( ON ?auto_832065 ?auto_832064 ) ( ON ?auto_832066 ?auto_832065 ) ( ON ?auto_832067 ?auto_832066 ) ( ON ?auto_832068 ?auto_832067 ) ( ON ?auto_832069 ?auto_832068 ) ( ON ?auto_832070 ?auto_832069 ) ( not ( = ?auto_832059 ?auto_832060 ) ) ( not ( = ?auto_832059 ?auto_832061 ) ) ( not ( = ?auto_832059 ?auto_832062 ) ) ( not ( = ?auto_832059 ?auto_832063 ) ) ( not ( = ?auto_832059 ?auto_832064 ) ) ( not ( = ?auto_832059 ?auto_832065 ) ) ( not ( = ?auto_832059 ?auto_832066 ) ) ( not ( = ?auto_832059 ?auto_832067 ) ) ( not ( = ?auto_832059 ?auto_832068 ) ) ( not ( = ?auto_832059 ?auto_832069 ) ) ( not ( = ?auto_832059 ?auto_832070 ) ) ( not ( = ?auto_832059 ?auto_832071 ) ) ( not ( = ?auto_832059 ?auto_832072 ) ) ( not ( = ?auto_832059 ?auto_832073 ) ) ( not ( = ?auto_832059 ?auto_832074 ) ) ( not ( = ?auto_832060 ?auto_832061 ) ) ( not ( = ?auto_832060 ?auto_832062 ) ) ( not ( = ?auto_832060 ?auto_832063 ) ) ( not ( = ?auto_832060 ?auto_832064 ) ) ( not ( = ?auto_832060 ?auto_832065 ) ) ( not ( = ?auto_832060 ?auto_832066 ) ) ( not ( = ?auto_832060 ?auto_832067 ) ) ( not ( = ?auto_832060 ?auto_832068 ) ) ( not ( = ?auto_832060 ?auto_832069 ) ) ( not ( = ?auto_832060 ?auto_832070 ) ) ( not ( = ?auto_832060 ?auto_832071 ) ) ( not ( = ?auto_832060 ?auto_832072 ) ) ( not ( = ?auto_832060 ?auto_832073 ) ) ( not ( = ?auto_832060 ?auto_832074 ) ) ( not ( = ?auto_832061 ?auto_832062 ) ) ( not ( = ?auto_832061 ?auto_832063 ) ) ( not ( = ?auto_832061 ?auto_832064 ) ) ( not ( = ?auto_832061 ?auto_832065 ) ) ( not ( = ?auto_832061 ?auto_832066 ) ) ( not ( = ?auto_832061 ?auto_832067 ) ) ( not ( = ?auto_832061 ?auto_832068 ) ) ( not ( = ?auto_832061 ?auto_832069 ) ) ( not ( = ?auto_832061 ?auto_832070 ) ) ( not ( = ?auto_832061 ?auto_832071 ) ) ( not ( = ?auto_832061 ?auto_832072 ) ) ( not ( = ?auto_832061 ?auto_832073 ) ) ( not ( = ?auto_832061 ?auto_832074 ) ) ( not ( = ?auto_832062 ?auto_832063 ) ) ( not ( = ?auto_832062 ?auto_832064 ) ) ( not ( = ?auto_832062 ?auto_832065 ) ) ( not ( = ?auto_832062 ?auto_832066 ) ) ( not ( = ?auto_832062 ?auto_832067 ) ) ( not ( = ?auto_832062 ?auto_832068 ) ) ( not ( = ?auto_832062 ?auto_832069 ) ) ( not ( = ?auto_832062 ?auto_832070 ) ) ( not ( = ?auto_832062 ?auto_832071 ) ) ( not ( = ?auto_832062 ?auto_832072 ) ) ( not ( = ?auto_832062 ?auto_832073 ) ) ( not ( = ?auto_832062 ?auto_832074 ) ) ( not ( = ?auto_832063 ?auto_832064 ) ) ( not ( = ?auto_832063 ?auto_832065 ) ) ( not ( = ?auto_832063 ?auto_832066 ) ) ( not ( = ?auto_832063 ?auto_832067 ) ) ( not ( = ?auto_832063 ?auto_832068 ) ) ( not ( = ?auto_832063 ?auto_832069 ) ) ( not ( = ?auto_832063 ?auto_832070 ) ) ( not ( = ?auto_832063 ?auto_832071 ) ) ( not ( = ?auto_832063 ?auto_832072 ) ) ( not ( = ?auto_832063 ?auto_832073 ) ) ( not ( = ?auto_832063 ?auto_832074 ) ) ( not ( = ?auto_832064 ?auto_832065 ) ) ( not ( = ?auto_832064 ?auto_832066 ) ) ( not ( = ?auto_832064 ?auto_832067 ) ) ( not ( = ?auto_832064 ?auto_832068 ) ) ( not ( = ?auto_832064 ?auto_832069 ) ) ( not ( = ?auto_832064 ?auto_832070 ) ) ( not ( = ?auto_832064 ?auto_832071 ) ) ( not ( = ?auto_832064 ?auto_832072 ) ) ( not ( = ?auto_832064 ?auto_832073 ) ) ( not ( = ?auto_832064 ?auto_832074 ) ) ( not ( = ?auto_832065 ?auto_832066 ) ) ( not ( = ?auto_832065 ?auto_832067 ) ) ( not ( = ?auto_832065 ?auto_832068 ) ) ( not ( = ?auto_832065 ?auto_832069 ) ) ( not ( = ?auto_832065 ?auto_832070 ) ) ( not ( = ?auto_832065 ?auto_832071 ) ) ( not ( = ?auto_832065 ?auto_832072 ) ) ( not ( = ?auto_832065 ?auto_832073 ) ) ( not ( = ?auto_832065 ?auto_832074 ) ) ( not ( = ?auto_832066 ?auto_832067 ) ) ( not ( = ?auto_832066 ?auto_832068 ) ) ( not ( = ?auto_832066 ?auto_832069 ) ) ( not ( = ?auto_832066 ?auto_832070 ) ) ( not ( = ?auto_832066 ?auto_832071 ) ) ( not ( = ?auto_832066 ?auto_832072 ) ) ( not ( = ?auto_832066 ?auto_832073 ) ) ( not ( = ?auto_832066 ?auto_832074 ) ) ( not ( = ?auto_832067 ?auto_832068 ) ) ( not ( = ?auto_832067 ?auto_832069 ) ) ( not ( = ?auto_832067 ?auto_832070 ) ) ( not ( = ?auto_832067 ?auto_832071 ) ) ( not ( = ?auto_832067 ?auto_832072 ) ) ( not ( = ?auto_832067 ?auto_832073 ) ) ( not ( = ?auto_832067 ?auto_832074 ) ) ( not ( = ?auto_832068 ?auto_832069 ) ) ( not ( = ?auto_832068 ?auto_832070 ) ) ( not ( = ?auto_832068 ?auto_832071 ) ) ( not ( = ?auto_832068 ?auto_832072 ) ) ( not ( = ?auto_832068 ?auto_832073 ) ) ( not ( = ?auto_832068 ?auto_832074 ) ) ( not ( = ?auto_832069 ?auto_832070 ) ) ( not ( = ?auto_832069 ?auto_832071 ) ) ( not ( = ?auto_832069 ?auto_832072 ) ) ( not ( = ?auto_832069 ?auto_832073 ) ) ( not ( = ?auto_832069 ?auto_832074 ) ) ( not ( = ?auto_832070 ?auto_832071 ) ) ( not ( = ?auto_832070 ?auto_832072 ) ) ( not ( = ?auto_832070 ?auto_832073 ) ) ( not ( = ?auto_832070 ?auto_832074 ) ) ( not ( = ?auto_832071 ?auto_832072 ) ) ( not ( = ?auto_832071 ?auto_832073 ) ) ( not ( = ?auto_832071 ?auto_832074 ) ) ( not ( = ?auto_832072 ?auto_832073 ) ) ( not ( = ?auto_832072 ?auto_832074 ) ) ( not ( = ?auto_832073 ?auto_832074 ) ) ( ON ?auto_832072 ?auto_832073 ) ( CLEAR ?auto_832070 ) ( ON ?auto_832071 ?auto_832072 ) ( CLEAR ?auto_832071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_832059 ?auto_832060 ?auto_832061 ?auto_832062 ?auto_832063 ?auto_832064 ?auto_832065 ?auto_832066 ?auto_832067 ?auto_832068 ?auto_832069 ?auto_832070 ?auto_832071 )
      ( MAKE-15PILE ?auto_832059 ?auto_832060 ?auto_832061 ?auto_832062 ?auto_832063 ?auto_832064 ?auto_832065 ?auto_832066 ?auto_832067 ?auto_832068 ?auto_832069 ?auto_832070 ?auto_832071 ?auto_832072 ?auto_832073 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_832121 - BLOCK
      ?auto_832122 - BLOCK
      ?auto_832123 - BLOCK
      ?auto_832124 - BLOCK
      ?auto_832125 - BLOCK
      ?auto_832126 - BLOCK
      ?auto_832127 - BLOCK
      ?auto_832128 - BLOCK
      ?auto_832129 - BLOCK
      ?auto_832130 - BLOCK
      ?auto_832131 - BLOCK
      ?auto_832132 - BLOCK
      ?auto_832133 - BLOCK
      ?auto_832134 - BLOCK
      ?auto_832135 - BLOCK
    )
    :vars
    (
      ?auto_832136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_832135 ?auto_832136 ) ( ON-TABLE ?auto_832121 ) ( ON ?auto_832122 ?auto_832121 ) ( ON ?auto_832123 ?auto_832122 ) ( ON ?auto_832124 ?auto_832123 ) ( ON ?auto_832125 ?auto_832124 ) ( ON ?auto_832126 ?auto_832125 ) ( ON ?auto_832127 ?auto_832126 ) ( ON ?auto_832128 ?auto_832127 ) ( ON ?auto_832129 ?auto_832128 ) ( ON ?auto_832130 ?auto_832129 ) ( ON ?auto_832131 ?auto_832130 ) ( not ( = ?auto_832121 ?auto_832122 ) ) ( not ( = ?auto_832121 ?auto_832123 ) ) ( not ( = ?auto_832121 ?auto_832124 ) ) ( not ( = ?auto_832121 ?auto_832125 ) ) ( not ( = ?auto_832121 ?auto_832126 ) ) ( not ( = ?auto_832121 ?auto_832127 ) ) ( not ( = ?auto_832121 ?auto_832128 ) ) ( not ( = ?auto_832121 ?auto_832129 ) ) ( not ( = ?auto_832121 ?auto_832130 ) ) ( not ( = ?auto_832121 ?auto_832131 ) ) ( not ( = ?auto_832121 ?auto_832132 ) ) ( not ( = ?auto_832121 ?auto_832133 ) ) ( not ( = ?auto_832121 ?auto_832134 ) ) ( not ( = ?auto_832121 ?auto_832135 ) ) ( not ( = ?auto_832121 ?auto_832136 ) ) ( not ( = ?auto_832122 ?auto_832123 ) ) ( not ( = ?auto_832122 ?auto_832124 ) ) ( not ( = ?auto_832122 ?auto_832125 ) ) ( not ( = ?auto_832122 ?auto_832126 ) ) ( not ( = ?auto_832122 ?auto_832127 ) ) ( not ( = ?auto_832122 ?auto_832128 ) ) ( not ( = ?auto_832122 ?auto_832129 ) ) ( not ( = ?auto_832122 ?auto_832130 ) ) ( not ( = ?auto_832122 ?auto_832131 ) ) ( not ( = ?auto_832122 ?auto_832132 ) ) ( not ( = ?auto_832122 ?auto_832133 ) ) ( not ( = ?auto_832122 ?auto_832134 ) ) ( not ( = ?auto_832122 ?auto_832135 ) ) ( not ( = ?auto_832122 ?auto_832136 ) ) ( not ( = ?auto_832123 ?auto_832124 ) ) ( not ( = ?auto_832123 ?auto_832125 ) ) ( not ( = ?auto_832123 ?auto_832126 ) ) ( not ( = ?auto_832123 ?auto_832127 ) ) ( not ( = ?auto_832123 ?auto_832128 ) ) ( not ( = ?auto_832123 ?auto_832129 ) ) ( not ( = ?auto_832123 ?auto_832130 ) ) ( not ( = ?auto_832123 ?auto_832131 ) ) ( not ( = ?auto_832123 ?auto_832132 ) ) ( not ( = ?auto_832123 ?auto_832133 ) ) ( not ( = ?auto_832123 ?auto_832134 ) ) ( not ( = ?auto_832123 ?auto_832135 ) ) ( not ( = ?auto_832123 ?auto_832136 ) ) ( not ( = ?auto_832124 ?auto_832125 ) ) ( not ( = ?auto_832124 ?auto_832126 ) ) ( not ( = ?auto_832124 ?auto_832127 ) ) ( not ( = ?auto_832124 ?auto_832128 ) ) ( not ( = ?auto_832124 ?auto_832129 ) ) ( not ( = ?auto_832124 ?auto_832130 ) ) ( not ( = ?auto_832124 ?auto_832131 ) ) ( not ( = ?auto_832124 ?auto_832132 ) ) ( not ( = ?auto_832124 ?auto_832133 ) ) ( not ( = ?auto_832124 ?auto_832134 ) ) ( not ( = ?auto_832124 ?auto_832135 ) ) ( not ( = ?auto_832124 ?auto_832136 ) ) ( not ( = ?auto_832125 ?auto_832126 ) ) ( not ( = ?auto_832125 ?auto_832127 ) ) ( not ( = ?auto_832125 ?auto_832128 ) ) ( not ( = ?auto_832125 ?auto_832129 ) ) ( not ( = ?auto_832125 ?auto_832130 ) ) ( not ( = ?auto_832125 ?auto_832131 ) ) ( not ( = ?auto_832125 ?auto_832132 ) ) ( not ( = ?auto_832125 ?auto_832133 ) ) ( not ( = ?auto_832125 ?auto_832134 ) ) ( not ( = ?auto_832125 ?auto_832135 ) ) ( not ( = ?auto_832125 ?auto_832136 ) ) ( not ( = ?auto_832126 ?auto_832127 ) ) ( not ( = ?auto_832126 ?auto_832128 ) ) ( not ( = ?auto_832126 ?auto_832129 ) ) ( not ( = ?auto_832126 ?auto_832130 ) ) ( not ( = ?auto_832126 ?auto_832131 ) ) ( not ( = ?auto_832126 ?auto_832132 ) ) ( not ( = ?auto_832126 ?auto_832133 ) ) ( not ( = ?auto_832126 ?auto_832134 ) ) ( not ( = ?auto_832126 ?auto_832135 ) ) ( not ( = ?auto_832126 ?auto_832136 ) ) ( not ( = ?auto_832127 ?auto_832128 ) ) ( not ( = ?auto_832127 ?auto_832129 ) ) ( not ( = ?auto_832127 ?auto_832130 ) ) ( not ( = ?auto_832127 ?auto_832131 ) ) ( not ( = ?auto_832127 ?auto_832132 ) ) ( not ( = ?auto_832127 ?auto_832133 ) ) ( not ( = ?auto_832127 ?auto_832134 ) ) ( not ( = ?auto_832127 ?auto_832135 ) ) ( not ( = ?auto_832127 ?auto_832136 ) ) ( not ( = ?auto_832128 ?auto_832129 ) ) ( not ( = ?auto_832128 ?auto_832130 ) ) ( not ( = ?auto_832128 ?auto_832131 ) ) ( not ( = ?auto_832128 ?auto_832132 ) ) ( not ( = ?auto_832128 ?auto_832133 ) ) ( not ( = ?auto_832128 ?auto_832134 ) ) ( not ( = ?auto_832128 ?auto_832135 ) ) ( not ( = ?auto_832128 ?auto_832136 ) ) ( not ( = ?auto_832129 ?auto_832130 ) ) ( not ( = ?auto_832129 ?auto_832131 ) ) ( not ( = ?auto_832129 ?auto_832132 ) ) ( not ( = ?auto_832129 ?auto_832133 ) ) ( not ( = ?auto_832129 ?auto_832134 ) ) ( not ( = ?auto_832129 ?auto_832135 ) ) ( not ( = ?auto_832129 ?auto_832136 ) ) ( not ( = ?auto_832130 ?auto_832131 ) ) ( not ( = ?auto_832130 ?auto_832132 ) ) ( not ( = ?auto_832130 ?auto_832133 ) ) ( not ( = ?auto_832130 ?auto_832134 ) ) ( not ( = ?auto_832130 ?auto_832135 ) ) ( not ( = ?auto_832130 ?auto_832136 ) ) ( not ( = ?auto_832131 ?auto_832132 ) ) ( not ( = ?auto_832131 ?auto_832133 ) ) ( not ( = ?auto_832131 ?auto_832134 ) ) ( not ( = ?auto_832131 ?auto_832135 ) ) ( not ( = ?auto_832131 ?auto_832136 ) ) ( not ( = ?auto_832132 ?auto_832133 ) ) ( not ( = ?auto_832132 ?auto_832134 ) ) ( not ( = ?auto_832132 ?auto_832135 ) ) ( not ( = ?auto_832132 ?auto_832136 ) ) ( not ( = ?auto_832133 ?auto_832134 ) ) ( not ( = ?auto_832133 ?auto_832135 ) ) ( not ( = ?auto_832133 ?auto_832136 ) ) ( not ( = ?auto_832134 ?auto_832135 ) ) ( not ( = ?auto_832134 ?auto_832136 ) ) ( not ( = ?auto_832135 ?auto_832136 ) ) ( ON ?auto_832134 ?auto_832135 ) ( ON ?auto_832133 ?auto_832134 ) ( CLEAR ?auto_832131 ) ( ON ?auto_832132 ?auto_832133 ) ( CLEAR ?auto_832132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_832121 ?auto_832122 ?auto_832123 ?auto_832124 ?auto_832125 ?auto_832126 ?auto_832127 ?auto_832128 ?auto_832129 ?auto_832130 ?auto_832131 ?auto_832132 )
      ( MAKE-15PILE ?auto_832121 ?auto_832122 ?auto_832123 ?auto_832124 ?auto_832125 ?auto_832126 ?auto_832127 ?auto_832128 ?auto_832129 ?auto_832130 ?auto_832131 ?auto_832132 ?auto_832133 ?auto_832134 ?auto_832135 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_832183 - BLOCK
      ?auto_832184 - BLOCK
      ?auto_832185 - BLOCK
      ?auto_832186 - BLOCK
      ?auto_832187 - BLOCK
      ?auto_832188 - BLOCK
      ?auto_832189 - BLOCK
      ?auto_832190 - BLOCK
      ?auto_832191 - BLOCK
      ?auto_832192 - BLOCK
      ?auto_832193 - BLOCK
      ?auto_832194 - BLOCK
      ?auto_832195 - BLOCK
      ?auto_832196 - BLOCK
      ?auto_832197 - BLOCK
    )
    :vars
    (
      ?auto_832198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_832197 ?auto_832198 ) ( ON-TABLE ?auto_832183 ) ( ON ?auto_832184 ?auto_832183 ) ( ON ?auto_832185 ?auto_832184 ) ( ON ?auto_832186 ?auto_832185 ) ( ON ?auto_832187 ?auto_832186 ) ( ON ?auto_832188 ?auto_832187 ) ( ON ?auto_832189 ?auto_832188 ) ( ON ?auto_832190 ?auto_832189 ) ( ON ?auto_832191 ?auto_832190 ) ( ON ?auto_832192 ?auto_832191 ) ( not ( = ?auto_832183 ?auto_832184 ) ) ( not ( = ?auto_832183 ?auto_832185 ) ) ( not ( = ?auto_832183 ?auto_832186 ) ) ( not ( = ?auto_832183 ?auto_832187 ) ) ( not ( = ?auto_832183 ?auto_832188 ) ) ( not ( = ?auto_832183 ?auto_832189 ) ) ( not ( = ?auto_832183 ?auto_832190 ) ) ( not ( = ?auto_832183 ?auto_832191 ) ) ( not ( = ?auto_832183 ?auto_832192 ) ) ( not ( = ?auto_832183 ?auto_832193 ) ) ( not ( = ?auto_832183 ?auto_832194 ) ) ( not ( = ?auto_832183 ?auto_832195 ) ) ( not ( = ?auto_832183 ?auto_832196 ) ) ( not ( = ?auto_832183 ?auto_832197 ) ) ( not ( = ?auto_832183 ?auto_832198 ) ) ( not ( = ?auto_832184 ?auto_832185 ) ) ( not ( = ?auto_832184 ?auto_832186 ) ) ( not ( = ?auto_832184 ?auto_832187 ) ) ( not ( = ?auto_832184 ?auto_832188 ) ) ( not ( = ?auto_832184 ?auto_832189 ) ) ( not ( = ?auto_832184 ?auto_832190 ) ) ( not ( = ?auto_832184 ?auto_832191 ) ) ( not ( = ?auto_832184 ?auto_832192 ) ) ( not ( = ?auto_832184 ?auto_832193 ) ) ( not ( = ?auto_832184 ?auto_832194 ) ) ( not ( = ?auto_832184 ?auto_832195 ) ) ( not ( = ?auto_832184 ?auto_832196 ) ) ( not ( = ?auto_832184 ?auto_832197 ) ) ( not ( = ?auto_832184 ?auto_832198 ) ) ( not ( = ?auto_832185 ?auto_832186 ) ) ( not ( = ?auto_832185 ?auto_832187 ) ) ( not ( = ?auto_832185 ?auto_832188 ) ) ( not ( = ?auto_832185 ?auto_832189 ) ) ( not ( = ?auto_832185 ?auto_832190 ) ) ( not ( = ?auto_832185 ?auto_832191 ) ) ( not ( = ?auto_832185 ?auto_832192 ) ) ( not ( = ?auto_832185 ?auto_832193 ) ) ( not ( = ?auto_832185 ?auto_832194 ) ) ( not ( = ?auto_832185 ?auto_832195 ) ) ( not ( = ?auto_832185 ?auto_832196 ) ) ( not ( = ?auto_832185 ?auto_832197 ) ) ( not ( = ?auto_832185 ?auto_832198 ) ) ( not ( = ?auto_832186 ?auto_832187 ) ) ( not ( = ?auto_832186 ?auto_832188 ) ) ( not ( = ?auto_832186 ?auto_832189 ) ) ( not ( = ?auto_832186 ?auto_832190 ) ) ( not ( = ?auto_832186 ?auto_832191 ) ) ( not ( = ?auto_832186 ?auto_832192 ) ) ( not ( = ?auto_832186 ?auto_832193 ) ) ( not ( = ?auto_832186 ?auto_832194 ) ) ( not ( = ?auto_832186 ?auto_832195 ) ) ( not ( = ?auto_832186 ?auto_832196 ) ) ( not ( = ?auto_832186 ?auto_832197 ) ) ( not ( = ?auto_832186 ?auto_832198 ) ) ( not ( = ?auto_832187 ?auto_832188 ) ) ( not ( = ?auto_832187 ?auto_832189 ) ) ( not ( = ?auto_832187 ?auto_832190 ) ) ( not ( = ?auto_832187 ?auto_832191 ) ) ( not ( = ?auto_832187 ?auto_832192 ) ) ( not ( = ?auto_832187 ?auto_832193 ) ) ( not ( = ?auto_832187 ?auto_832194 ) ) ( not ( = ?auto_832187 ?auto_832195 ) ) ( not ( = ?auto_832187 ?auto_832196 ) ) ( not ( = ?auto_832187 ?auto_832197 ) ) ( not ( = ?auto_832187 ?auto_832198 ) ) ( not ( = ?auto_832188 ?auto_832189 ) ) ( not ( = ?auto_832188 ?auto_832190 ) ) ( not ( = ?auto_832188 ?auto_832191 ) ) ( not ( = ?auto_832188 ?auto_832192 ) ) ( not ( = ?auto_832188 ?auto_832193 ) ) ( not ( = ?auto_832188 ?auto_832194 ) ) ( not ( = ?auto_832188 ?auto_832195 ) ) ( not ( = ?auto_832188 ?auto_832196 ) ) ( not ( = ?auto_832188 ?auto_832197 ) ) ( not ( = ?auto_832188 ?auto_832198 ) ) ( not ( = ?auto_832189 ?auto_832190 ) ) ( not ( = ?auto_832189 ?auto_832191 ) ) ( not ( = ?auto_832189 ?auto_832192 ) ) ( not ( = ?auto_832189 ?auto_832193 ) ) ( not ( = ?auto_832189 ?auto_832194 ) ) ( not ( = ?auto_832189 ?auto_832195 ) ) ( not ( = ?auto_832189 ?auto_832196 ) ) ( not ( = ?auto_832189 ?auto_832197 ) ) ( not ( = ?auto_832189 ?auto_832198 ) ) ( not ( = ?auto_832190 ?auto_832191 ) ) ( not ( = ?auto_832190 ?auto_832192 ) ) ( not ( = ?auto_832190 ?auto_832193 ) ) ( not ( = ?auto_832190 ?auto_832194 ) ) ( not ( = ?auto_832190 ?auto_832195 ) ) ( not ( = ?auto_832190 ?auto_832196 ) ) ( not ( = ?auto_832190 ?auto_832197 ) ) ( not ( = ?auto_832190 ?auto_832198 ) ) ( not ( = ?auto_832191 ?auto_832192 ) ) ( not ( = ?auto_832191 ?auto_832193 ) ) ( not ( = ?auto_832191 ?auto_832194 ) ) ( not ( = ?auto_832191 ?auto_832195 ) ) ( not ( = ?auto_832191 ?auto_832196 ) ) ( not ( = ?auto_832191 ?auto_832197 ) ) ( not ( = ?auto_832191 ?auto_832198 ) ) ( not ( = ?auto_832192 ?auto_832193 ) ) ( not ( = ?auto_832192 ?auto_832194 ) ) ( not ( = ?auto_832192 ?auto_832195 ) ) ( not ( = ?auto_832192 ?auto_832196 ) ) ( not ( = ?auto_832192 ?auto_832197 ) ) ( not ( = ?auto_832192 ?auto_832198 ) ) ( not ( = ?auto_832193 ?auto_832194 ) ) ( not ( = ?auto_832193 ?auto_832195 ) ) ( not ( = ?auto_832193 ?auto_832196 ) ) ( not ( = ?auto_832193 ?auto_832197 ) ) ( not ( = ?auto_832193 ?auto_832198 ) ) ( not ( = ?auto_832194 ?auto_832195 ) ) ( not ( = ?auto_832194 ?auto_832196 ) ) ( not ( = ?auto_832194 ?auto_832197 ) ) ( not ( = ?auto_832194 ?auto_832198 ) ) ( not ( = ?auto_832195 ?auto_832196 ) ) ( not ( = ?auto_832195 ?auto_832197 ) ) ( not ( = ?auto_832195 ?auto_832198 ) ) ( not ( = ?auto_832196 ?auto_832197 ) ) ( not ( = ?auto_832196 ?auto_832198 ) ) ( not ( = ?auto_832197 ?auto_832198 ) ) ( ON ?auto_832196 ?auto_832197 ) ( ON ?auto_832195 ?auto_832196 ) ( ON ?auto_832194 ?auto_832195 ) ( CLEAR ?auto_832192 ) ( ON ?auto_832193 ?auto_832194 ) ( CLEAR ?auto_832193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_832183 ?auto_832184 ?auto_832185 ?auto_832186 ?auto_832187 ?auto_832188 ?auto_832189 ?auto_832190 ?auto_832191 ?auto_832192 ?auto_832193 )
      ( MAKE-15PILE ?auto_832183 ?auto_832184 ?auto_832185 ?auto_832186 ?auto_832187 ?auto_832188 ?auto_832189 ?auto_832190 ?auto_832191 ?auto_832192 ?auto_832193 ?auto_832194 ?auto_832195 ?auto_832196 ?auto_832197 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_832245 - BLOCK
      ?auto_832246 - BLOCK
      ?auto_832247 - BLOCK
      ?auto_832248 - BLOCK
      ?auto_832249 - BLOCK
      ?auto_832250 - BLOCK
      ?auto_832251 - BLOCK
      ?auto_832252 - BLOCK
      ?auto_832253 - BLOCK
      ?auto_832254 - BLOCK
      ?auto_832255 - BLOCK
      ?auto_832256 - BLOCK
      ?auto_832257 - BLOCK
      ?auto_832258 - BLOCK
      ?auto_832259 - BLOCK
    )
    :vars
    (
      ?auto_832260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_832259 ?auto_832260 ) ( ON-TABLE ?auto_832245 ) ( ON ?auto_832246 ?auto_832245 ) ( ON ?auto_832247 ?auto_832246 ) ( ON ?auto_832248 ?auto_832247 ) ( ON ?auto_832249 ?auto_832248 ) ( ON ?auto_832250 ?auto_832249 ) ( ON ?auto_832251 ?auto_832250 ) ( ON ?auto_832252 ?auto_832251 ) ( ON ?auto_832253 ?auto_832252 ) ( not ( = ?auto_832245 ?auto_832246 ) ) ( not ( = ?auto_832245 ?auto_832247 ) ) ( not ( = ?auto_832245 ?auto_832248 ) ) ( not ( = ?auto_832245 ?auto_832249 ) ) ( not ( = ?auto_832245 ?auto_832250 ) ) ( not ( = ?auto_832245 ?auto_832251 ) ) ( not ( = ?auto_832245 ?auto_832252 ) ) ( not ( = ?auto_832245 ?auto_832253 ) ) ( not ( = ?auto_832245 ?auto_832254 ) ) ( not ( = ?auto_832245 ?auto_832255 ) ) ( not ( = ?auto_832245 ?auto_832256 ) ) ( not ( = ?auto_832245 ?auto_832257 ) ) ( not ( = ?auto_832245 ?auto_832258 ) ) ( not ( = ?auto_832245 ?auto_832259 ) ) ( not ( = ?auto_832245 ?auto_832260 ) ) ( not ( = ?auto_832246 ?auto_832247 ) ) ( not ( = ?auto_832246 ?auto_832248 ) ) ( not ( = ?auto_832246 ?auto_832249 ) ) ( not ( = ?auto_832246 ?auto_832250 ) ) ( not ( = ?auto_832246 ?auto_832251 ) ) ( not ( = ?auto_832246 ?auto_832252 ) ) ( not ( = ?auto_832246 ?auto_832253 ) ) ( not ( = ?auto_832246 ?auto_832254 ) ) ( not ( = ?auto_832246 ?auto_832255 ) ) ( not ( = ?auto_832246 ?auto_832256 ) ) ( not ( = ?auto_832246 ?auto_832257 ) ) ( not ( = ?auto_832246 ?auto_832258 ) ) ( not ( = ?auto_832246 ?auto_832259 ) ) ( not ( = ?auto_832246 ?auto_832260 ) ) ( not ( = ?auto_832247 ?auto_832248 ) ) ( not ( = ?auto_832247 ?auto_832249 ) ) ( not ( = ?auto_832247 ?auto_832250 ) ) ( not ( = ?auto_832247 ?auto_832251 ) ) ( not ( = ?auto_832247 ?auto_832252 ) ) ( not ( = ?auto_832247 ?auto_832253 ) ) ( not ( = ?auto_832247 ?auto_832254 ) ) ( not ( = ?auto_832247 ?auto_832255 ) ) ( not ( = ?auto_832247 ?auto_832256 ) ) ( not ( = ?auto_832247 ?auto_832257 ) ) ( not ( = ?auto_832247 ?auto_832258 ) ) ( not ( = ?auto_832247 ?auto_832259 ) ) ( not ( = ?auto_832247 ?auto_832260 ) ) ( not ( = ?auto_832248 ?auto_832249 ) ) ( not ( = ?auto_832248 ?auto_832250 ) ) ( not ( = ?auto_832248 ?auto_832251 ) ) ( not ( = ?auto_832248 ?auto_832252 ) ) ( not ( = ?auto_832248 ?auto_832253 ) ) ( not ( = ?auto_832248 ?auto_832254 ) ) ( not ( = ?auto_832248 ?auto_832255 ) ) ( not ( = ?auto_832248 ?auto_832256 ) ) ( not ( = ?auto_832248 ?auto_832257 ) ) ( not ( = ?auto_832248 ?auto_832258 ) ) ( not ( = ?auto_832248 ?auto_832259 ) ) ( not ( = ?auto_832248 ?auto_832260 ) ) ( not ( = ?auto_832249 ?auto_832250 ) ) ( not ( = ?auto_832249 ?auto_832251 ) ) ( not ( = ?auto_832249 ?auto_832252 ) ) ( not ( = ?auto_832249 ?auto_832253 ) ) ( not ( = ?auto_832249 ?auto_832254 ) ) ( not ( = ?auto_832249 ?auto_832255 ) ) ( not ( = ?auto_832249 ?auto_832256 ) ) ( not ( = ?auto_832249 ?auto_832257 ) ) ( not ( = ?auto_832249 ?auto_832258 ) ) ( not ( = ?auto_832249 ?auto_832259 ) ) ( not ( = ?auto_832249 ?auto_832260 ) ) ( not ( = ?auto_832250 ?auto_832251 ) ) ( not ( = ?auto_832250 ?auto_832252 ) ) ( not ( = ?auto_832250 ?auto_832253 ) ) ( not ( = ?auto_832250 ?auto_832254 ) ) ( not ( = ?auto_832250 ?auto_832255 ) ) ( not ( = ?auto_832250 ?auto_832256 ) ) ( not ( = ?auto_832250 ?auto_832257 ) ) ( not ( = ?auto_832250 ?auto_832258 ) ) ( not ( = ?auto_832250 ?auto_832259 ) ) ( not ( = ?auto_832250 ?auto_832260 ) ) ( not ( = ?auto_832251 ?auto_832252 ) ) ( not ( = ?auto_832251 ?auto_832253 ) ) ( not ( = ?auto_832251 ?auto_832254 ) ) ( not ( = ?auto_832251 ?auto_832255 ) ) ( not ( = ?auto_832251 ?auto_832256 ) ) ( not ( = ?auto_832251 ?auto_832257 ) ) ( not ( = ?auto_832251 ?auto_832258 ) ) ( not ( = ?auto_832251 ?auto_832259 ) ) ( not ( = ?auto_832251 ?auto_832260 ) ) ( not ( = ?auto_832252 ?auto_832253 ) ) ( not ( = ?auto_832252 ?auto_832254 ) ) ( not ( = ?auto_832252 ?auto_832255 ) ) ( not ( = ?auto_832252 ?auto_832256 ) ) ( not ( = ?auto_832252 ?auto_832257 ) ) ( not ( = ?auto_832252 ?auto_832258 ) ) ( not ( = ?auto_832252 ?auto_832259 ) ) ( not ( = ?auto_832252 ?auto_832260 ) ) ( not ( = ?auto_832253 ?auto_832254 ) ) ( not ( = ?auto_832253 ?auto_832255 ) ) ( not ( = ?auto_832253 ?auto_832256 ) ) ( not ( = ?auto_832253 ?auto_832257 ) ) ( not ( = ?auto_832253 ?auto_832258 ) ) ( not ( = ?auto_832253 ?auto_832259 ) ) ( not ( = ?auto_832253 ?auto_832260 ) ) ( not ( = ?auto_832254 ?auto_832255 ) ) ( not ( = ?auto_832254 ?auto_832256 ) ) ( not ( = ?auto_832254 ?auto_832257 ) ) ( not ( = ?auto_832254 ?auto_832258 ) ) ( not ( = ?auto_832254 ?auto_832259 ) ) ( not ( = ?auto_832254 ?auto_832260 ) ) ( not ( = ?auto_832255 ?auto_832256 ) ) ( not ( = ?auto_832255 ?auto_832257 ) ) ( not ( = ?auto_832255 ?auto_832258 ) ) ( not ( = ?auto_832255 ?auto_832259 ) ) ( not ( = ?auto_832255 ?auto_832260 ) ) ( not ( = ?auto_832256 ?auto_832257 ) ) ( not ( = ?auto_832256 ?auto_832258 ) ) ( not ( = ?auto_832256 ?auto_832259 ) ) ( not ( = ?auto_832256 ?auto_832260 ) ) ( not ( = ?auto_832257 ?auto_832258 ) ) ( not ( = ?auto_832257 ?auto_832259 ) ) ( not ( = ?auto_832257 ?auto_832260 ) ) ( not ( = ?auto_832258 ?auto_832259 ) ) ( not ( = ?auto_832258 ?auto_832260 ) ) ( not ( = ?auto_832259 ?auto_832260 ) ) ( ON ?auto_832258 ?auto_832259 ) ( ON ?auto_832257 ?auto_832258 ) ( ON ?auto_832256 ?auto_832257 ) ( ON ?auto_832255 ?auto_832256 ) ( CLEAR ?auto_832253 ) ( ON ?auto_832254 ?auto_832255 ) ( CLEAR ?auto_832254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_832245 ?auto_832246 ?auto_832247 ?auto_832248 ?auto_832249 ?auto_832250 ?auto_832251 ?auto_832252 ?auto_832253 ?auto_832254 )
      ( MAKE-15PILE ?auto_832245 ?auto_832246 ?auto_832247 ?auto_832248 ?auto_832249 ?auto_832250 ?auto_832251 ?auto_832252 ?auto_832253 ?auto_832254 ?auto_832255 ?auto_832256 ?auto_832257 ?auto_832258 ?auto_832259 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_832307 - BLOCK
      ?auto_832308 - BLOCK
      ?auto_832309 - BLOCK
      ?auto_832310 - BLOCK
      ?auto_832311 - BLOCK
      ?auto_832312 - BLOCK
      ?auto_832313 - BLOCK
      ?auto_832314 - BLOCK
      ?auto_832315 - BLOCK
      ?auto_832316 - BLOCK
      ?auto_832317 - BLOCK
      ?auto_832318 - BLOCK
      ?auto_832319 - BLOCK
      ?auto_832320 - BLOCK
      ?auto_832321 - BLOCK
    )
    :vars
    (
      ?auto_832322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_832321 ?auto_832322 ) ( ON-TABLE ?auto_832307 ) ( ON ?auto_832308 ?auto_832307 ) ( ON ?auto_832309 ?auto_832308 ) ( ON ?auto_832310 ?auto_832309 ) ( ON ?auto_832311 ?auto_832310 ) ( ON ?auto_832312 ?auto_832311 ) ( ON ?auto_832313 ?auto_832312 ) ( ON ?auto_832314 ?auto_832313 ) ( not ( = ?auto_832307 ?auto_832308 ) ) ( not ( = ?auto_832307 ?auto_832309 ) ) ( not ( = ?auto_832307 ?auto_832310 ) ) ( not ( = ?auto_832307 ?auto_832311 ) ) ( not ( = ?auto_832307 ?auto_832312 ) ) ( not ( = ?auto_832307 ?auto_832313 ) ) ( not ( = ?auto_832307 ?auto_832314 ) ) ( not ( = ?auto_832307 ?auto_832315 ) ) ( not ( = ?auto_832307 ?auto_832316 ) ) ( not ( = ?auto_832307 ?auto_832317 ) ) ( not ( = ?auto_832307 ?auto_832318 ) ) ( not ( = ?auto_832307 ?auto_832319 ) ) ( not ( = ?auto_832307 ?auto_832320 ) ) ( not ( = ?auto_832307 ?auto_832321 ) ) ( not ( = ?auto_832307 ?auto_832322 ) ) ( not ( = ?auto_832308 ?auto_832309 ) ) ( not ( = ?auto_832308 ?auto_832310 ) ) ( not ( = ?auto_832308 ?auto_832311 ) ) ( not ( = ?auto_832308 ?auto_832312 ) ) ( not ( = ?auto_832308 ?auto_832313 ) ) ( not ( = ?auto_832308 ?auto_832314 ) ) ( not ( = ?auto_832308 ?auto_832315 ) ) ( not ( = ?auto_832308 ?auto_832316 ) ) ( not ( = ?auto_832308 ?auto_832317 ) ) ( not ( = ?auto_832308 ?auto_832318 ) ) ( not ( = ?auto_832308 ?auto_832319 ) ) ( not ( = ?auto_832308 ?auto_832320 ) ) ( not ( = ?auto_832308 ?auto_832321 ) ) ( not ( = ?auto_832308 ?auto_832322 ) ) ( not ( = ?auto_832309 ?auto_832310 ) ) ( not ( = ?auto_832309 ?auto_832311 ) ) ( not ( = ?auto_832309 ?auto_832312 ) ) ( not ( = ?auto_832309 ?auto_832313 ) ) ( not ( = ?auto_832309 ?auto_832314 ) ) ( not ( = ?auto_832309 ?auto_832315 ) ) ( not ( = ?auto_832309 ?auto_832316 ) ) ( not ( = ?auto_832309 ?auto_832317 ) ) ( not ( = ?auto_832309 ?auto_832318 ) ) ( not ( = ?auto_832309 ?auto_832319 ) ) ( not ( = ?auto_832309 ?auto_832320 ) ) ( not ( = ?auto_832309 ?auto_832321 ) ) ( not ( = ?auto_832309 ?auto_832322 ) ) ( not ( = ?auto_832310 ?auto_832311 ) ) ( not ( = ?auto_832310 ?auto_832312 ) ) ( not ( = ?auto_832310 ?auto_832313 ) ) ( not ( = ?auto_832310 ?auto_832314 ) ) ( not ( = ?auto_832310 ?auto_832315 ) ) ( not ( = ?auto_832310 ?auto_832316 ) ) ( not ( = ?auto_832310 ?auto_832317 ) ) ( not ( = ?auto_832310 ?auto_832318 ) ) ( not ( = ?auto_832310 ?auto_832319 ) ) ( not ( = ?auto_832310 ?auto_832320 ) ) ( not ( = ?auto_832310 ?auto_832321 ) ) ( not ( = ?auto_832310 ?auto_832322 ) ) ( not ( = ?auto_832311 ?auto_832312 ) ) ( not ( = ?auto_832311 ?auto_832313 ) ) ( not ( = ?auto_832311 ?auto_832314 ) ) ( not ( = ?auto_832311 ?auto_832315 ) ) ( not ( = ?auto_832311 ?auto_832316 ) ) ( not ( = ?auto_832311 ?auto_832317 ) ) ( not ( = ?auto_832311 ?auto_832318 ) ) ( not ( = ?auto_832311 ?auto_832319 ) ) ( not ( = ?auto_832311 ?auto_832320 ) ) ( not ( = ?auto_832311 ?auto_832321 ) ) ( not ( = ?auto_832311 ?auto_832322 ) ) ( not ( = ?auto_832312 ?auto_832313 ) ) ( not ( = ?auto_832312 ?auto_832314 ) ) ( not ( = ?auto_832312 ?auto_832315 ) ) ( not ( = ?auto_832312 ?auto_832316 ) ) ( not ( = ?auto_832312 ?auto_832317 ) ) ( not ( = ?auto_832312 ?auto_832318 ) ) ( not ( = ?auto_832312 ?auto_832319 ) ) ( not ( = ?auto_832312 ?auto_832320 ) ) ( not ( = ?auto_832312 ?auto_832321 ) ) ( not ( = ?auto_832312 ?auto_832322 ) ) ( not ( = ?auto_832313 ?auto_832314 ) ) ( not ( = ?auto_832313 ?auto_832315 ) ) ( not ( = ?auto_832313 ?auto_832316 ) ) ( not ( = ?auto_832313 ?auto_832317 ) ) ( not ( = ?auto_832313 ?auto_832318 ) ) ( not ( = ?auto_832313 ?auto_832319 ) ) ( not ( = ?auto_832313 ?auto_832320 ) ) ( not ( = ?auto_832313 ?auto_832321 ) ) ( not ( = ?auto_832313 ?auto_832322 ) ) ( not ( = ?auto_832314 ?auto_832315 ) ) ( not ( = ?auto_832314 ?auto_832316 ) ) ( not ( = ?auto_832314 ?auto_832317 ) ) ( not ( = ?auto_832314 ?auto_832318 ) ) ( not ( = ?auto_832314 ?auto_832319 ) ) ( not ( = ?auto_832314 ?auto_832320 ) ) ( not ( = ?auto_832314 ?auto_832321 ) ) ( not ( = ?auto_832314 ?auto_832322 ) ) ( not ( = ?auto_832315 ?auto_832316 ) ) ( not ( = ?auto_832315 ?auto_832317 ) ) ( not ( = ?auto_832315 ?auto_832318 ) ) ( not ( = ?auto_832315 ?auto_832319 ) ) ( not ( = ?auto_832315 ?auto_832320 ) ) ( not ( = ?auto_832315 ?auto_832321 ) ) ( not ( = ?auto_832315 ?auto_832322 ) ) ( not ( = ?auto_832316 ?auto_832317 ) ) ( not ( = ?auto_832316 ?auto_832318 ) ) ( not ( = ?auto_832316 ?auto_832319 ) ) ( not ( = ?auto_832316 ?auto_832320 ) ) ( not ( = ?auto_832316 ?auto_832321 ) ) ( not ( = ?auto_832316 ?auto_832322 ) ) ( not ( = ?auto_832317 ?auto_832318 ) ) ( not ( = ?auto_832317 ?auto_832319 ) ) ( not ( = ?auto_832317 ?auto_832320 ) ) ( not ( = ?auto_832317 ?auto_832321 ) ) ( not ( = ?auto_832317 ?auto_832322 ) ) ( not ( = ?auto_832318 ?auto_832319 ) ) ( not ( = ?auto_832318 ?auto_832320 ) ) ( not ( = ?auto_832318 ?auto_832321 ) ) ( not ( = ?auto_832318 ?auto_832322 ) ) ( not ( = ?auto_832319 ?auto_832320 ) ) ( not ( = ?auto_832319 ?auto_832321 ) ) ( not ( = ?auto_832319 ?auto_832322 ) ) ( not ( = ?auto_832320 ?auto_832321 ) ) ( not ( = ?auto_832320 ?auto_832322 ) ) ( not ( = ?auto_832321 ?auto_832322 ) ) ( ON ?auto_832320 ?auto_832321 ) ( ON ?auto_832319 ?auto_832320 ) ( ON ?auto_832318 ?auto_832319 ) ( ON ?auto_832317 ?auto_832318 ) ( ON ?auto_832316 ?auto_832317 ) ( CLEAR ?auto_832314 ) ( ON ?auto_832315 ?auto_832316 ) ( CLEAR ?auto_832315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_832307 ?auto_832308 ?auto_832309 ?auto_832310 ?auto_832311 ?auto_832312 ?auto_832313 ?auto_832314 ?auto_832315 )
      ( MAKE-15PILE ?auto_832307 ?auto_832308 ?auto_832309 ?auto_832310 ?auto_832311 ?auto_832312 ?auto_832313 ?auto_832314 ?auto_832315 ?auto_832316 ?auto_832317 ?auto_832318 ?auto_832319 ?auto_832320 ?auto_832321 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_832369 - BLOCK
      ?auto_832370 - BLOCK
      ?auto_832371 - BLOCK
      ?auto_832372 - BLOCK
      ?auto_832373 - BLOCK
      ?auto_832374 - BLOCK
      ?auto_832375 - BLOCK
      ?auto_832376 - BLOCK
      ?auto_832377 - BLOCK
      ?auto_832378 - BLOCK
      ?auto_832379 - BLOCK
      ?auto_832380 - BLOCK
      ?auto_832381 - BLOCK
      ?auto_832382 - BLOCK
      ?auto_832383 - BLOCK
    )
    :vars
    (
      ?auto_832384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_832383 ?auto_832384 ) ( ON-TABLE ?auto_832369 ) ( ON ?auto_832370 ?auto_832369 ) ( ON ?auto_832371 ?auto_832370 ) ( ON ?auto_832372 ?auto_832371 ) ( ON ?auto_832373 ?auto_832372 ) ( ON ?auto_832374 ?auto_832373 ) ( ON ?auto_832375 ?auto_832374 ) ( not ( = ?auto_832369 ?auto_832370 ) ) ( not ( = ?auto_832369 ?auto_832371 ) ) ( not ( = ?auto_832369 ?auto_832372 ) ) ( not ( = ?auto_832369 ?auto_832373 ) ) ( not ( = ?auto_832369 ?auto_832374 ) ) ( not ( = ?auto_832369 ?auto_832375 ) ) ( not ( = ?auto_832369 ?auto_832376 ) ) ( not ( = ?auto_832369 ?auto_832377 ) ) ( not ( = ?auto_832369 ?auto_832378 ) ) ( not ( = ?auto_832369 ?auto_832379 ) ) ( not ( = ?auto_832369 ?auto_832380 ) ) ( not ( = ?auto_832369 ?auto_832381 ) ) ( not ( = ?auto_832369 ?auto_832382 ) ) ( not ( = ?auto_832369 ?auto_832383 ) ) ( not ( = ?auto_832369 ?auto_832384 ) ) ( not ( = ?auto_832370 ?auto_832371 ) ) ( not ( = ?auto_832370 ?auto_832372 ) ) ( not ( = ?auto_832370 ?auto_832373 ) ) ( not ( = ?auto_832370 ?auto_832374 ) ) ( not ( = ?auto_832370 ?auto_832375 ) ) ( not ( = ?auto_832370 ?auto_832376 ) ) ( not ( = ?auto_832370 ?auto_832377 ) ) ( not ( = ?auto_832370 ?auto_832378 ) ) ( not ( = ?auto_832370 ?auto_832379 ) ) ( not ( = ?auto_832370 ?auto_832380 ) ) ( not ( = ?auto_832370 ?auto_832381 ) ) ( not ( = ?auto_832370 ?auto_832382 ) ) ( not ( = ?auto_832370 ?auto_832383 ) ) ( not ( = ?auto_832370 ?auto_832384 ) ) ( not ( = ?auto_832371 ?auto_832372 ) ) ( not ( = ?auto_832371 ?auto_832373 ) ) ( not ( = ?auto_832371 ?auto_832374 ) ) ( not ( = ?auto_832371 ?auto_832375 ) ) ( not ( = ?auto_832371 ?auto_832376 ) ) ( not ( = ?auto_832371 ?auto_832377 ) ) ( not ( = ?auto_832371 ?auto_832378 ) ) ( not ( = ?auto_832371 ?auto_832379 ) ) ( not ( = ?auto_832371 ?auto_832380 ) ) ( not ( = ?auto_832371 ?auto_832381 ) ) ( not ( = ?auto_832371 ?auto_832382 ) ) ( not ( = ?auto_832371 ?auto_832383 ) ) ( not ( = ?auto_832371 ?auto_832384 ) ) ( not ( = ?auto_832372 ?auto_832373 ) ) ( not ( = ?auto_832372 ?auto_832374 ) ) ( not ( = ?auto_832372 ?auto_832375 ) ) ( not ( = ?auto_832372 ?auto_832376 ) ) ( not ( = ?auto_832372 ?auto_832377 ) ) ( not ( = ?auto_832372 ?auto_832378 ) ) ( not ( = ?auto_832372 ?auto_832379 ) ) ( not ( = ?auto_832372 ?auto_832380 ) ) ( not ( = ?auto_832372 ?auto_832381 ) ) ( not ( = ?auto_832372 ?auto_832382 ) ) ( not ( = ?auto_832372 ?auto_832383 ) ) ( not ( = ?auto_832372 ?auto_832384 ) ) ( not ( = ?auto_832373 ?auto_832374 ) ) ( not ( = ?auto_832373 ?auto_832375 ) ) ( not ( = ?auto_832373 ?auto_832376 ) ) ( not ( = ?auto_832373 ?auto_832377 ) ) ( not ( = ?auto_832373 ?auto_832378 ) ) ( not ( = ?auto_832373 ?auto_832379 ) ) ( not ( = ?auto_832373 ?auto_832380 ) ) ( not ( = ?auto_832373 ?auto_832381 ) ) ( not ( = ?auto_832373 ?auto_832382 ) ) ( not ( = ?auto_832373 ?auto_832383 ) ) ( not ( = ?auto_832373 ?auto_832384 ) ) ( not ( = ?auto_832374 ?auto_832375 ) ) ( not ( = ?auto_832374 ?auto_832376 ) ) ( not ( = ?auto_832374 ?auto_832377 ) ) ( not ( = ?auto_832374 ?auto_832378 ) ) ( not ( = ?auto_832374 ?auto_832379 ) ) ( not ( = ?auto_832374 ?auto_832380 ) ) ( not ( = ?auto_832374 ?auto_832381 ) ) ( not ( = ?auto_832374 ?auto_832382 ) ) ( not ( = ?auto_832374 ?auto_832383 ) ) ( not ( = ?auto_832374 ?auto_832384 ) ) ( not ( = ?auto_832375 ?auto_832376 ) ) ( not ( = ?auto_832375 ?auto_832377 ) ) ( not ( = ?auto_832375 ?auto_832378 ) ) ( not ( = ?auto_832375 ?auto_832379 ) ) ( not ( = ?auto_832375 ?auto_832380 ) ) ( not ( = ?auto_832375 ?auto_832381 ) ) ( not ( = ?auto_832375 ?auto_832382 ) ) ( not ( = ?auto_832375 ?auto_832383 ) ) ( not ( = ?auto_832375 ?auto_832384 ) ) ( not ( = ?auto_832376 ?auto_832377 ) ) ( not ( = ?auto_832376 ?auto_832378 ) ) ( not ( = ?auto_832376 ?auto_832379 ) ) ( not ( = ?auto_832376 ?auto_832380 ) ) ( not ( = ?auto_832376 ?auto_832381 ) ) ( not ( = ?auto_832376 ?auto_832382 ) ) ( not ( = ?auto_832376 ?auto_832383 ) ) ( not ( = ?auto_832376 ?auto_832384 ) ) ( not ( = ?auto_832377 ?auto_832378 ) ) ( not ( = ?auto_832377 ?auto_832379 ) ) ( not ( = ?auto_832377 ?auto_832380 ) ) ( not ( = ?auto_832377 ?auto_832381 ) ) ( not ( = ?auto_832377 ?auto_832382 ) ) ( not ( = ?auto_832377 ?auto_832383 ) ) ( not ( = ?auto_832377 ?auto_832384 ) ) ( not ( = ?auto_832378 ?auto_832379 ) ) ( not ( = ?auto_832378 ?auto_832380 ) ) ( not ( = ?auto_832378 ?auto_832381 ) ) ( not ( = ?auto_832378 ?auto_832382 ) ) ( not ( = ?auto_832378 ?auto_832383 ) ) ( not ( = ?auto_832378 ?auto_832384 ) ) ( not ( = ?auto_832379 ?auto_832380 ) ) ( not ( = ?auto_832379 ?auto_832381 ) ) ( not ( = ?auto_832379 ?auto_832382 ) ) ( not ( = ?auto_832379 ?auto_832383 ) ) ( not ( = ?auto_832379 ?auto_832384 ) ) ( not ( = ?auto_832380 ?auto_832381 ) ) ( not ( = ?auto_832380 ?auto_832382 ) ) ( not ( = ?auto_832380 ?auto_832383 ) ) ( not ( = ?auto_832380 ?auto_832384 ) ) ( not ( = ?auto_832381 ?auto_832382 ) ) ( not ( = ?auto_832381 ?auto_832383 ) ) ( not ( = ?auto_832381 ?auto_832384 ) ) ( not ( = ?auto_832382 ?auto_832383 ) ) ( not ( = ?auto_832382 ?auto_832384 ) ) ( not ( = ?auto_832383 ?auto_832384 ) ) ( ON ?auto_832382 ?auto_832383 ) ( ON ?auto_832381 ?auto_832382 ) ( ON ?auto_832380 ?auto_832381 ) ( ON ?auto_832379 ?auto_832380 ) ( ON ?auto_832378 ?auto_832379 ) ( ON ?auto_832377 ?auto_832378 ) ( CLEAR ?auto_832375 ) ( ON ?auto_832376 ?auto_832377 ) ( CLEAR ?auto_832376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_832369 ?auto_832370 ?auto_832371 ?auto_832372 ?auto_832373 ?auto_832374 ?auto_832375 ?auto_832376 )
      ( MAKE-15PILE ?auto_832369 ?auto_832370 ?auto_832371 ?auto_832372 ?auto_832373 ?auto_832374 ?auto_832375 ?auto_832376 ?auto_832377 ?auto_832378 ?auto_832379 ?auto_832380 ?auto_832381 ?auto_832382 ?auto_832383 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_832431 - BLOCK
      ?auto_832432 - BLOCK
      ?auto_832433 - BLOCK
      ?auto_832434 - BLOCK
      ?auto_832435 - BLOCK
      ?auto_832436 - BLOCK
      ?auto_832437 - BLOCK
      ?auto_832438 - BLOCK
      ?auto_832439 - BLOCK
      ?auto_832440 - BLOCK
      ?auto_832441 - BLOCK
      ?auto_832442 - BLOCK
      ?auto_832443 - BLOCK
      ?auto_832444 - BLOCK
      ?auto_832445 - BLOCK
    )
    :vars
    (
      ?auto_832446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_832445 ?auto_832446 ) ( ON-TABLE ?auto_832431 ) ( ON ?auto_832432 ?auto_832431 ) ( ON ?auto_832433 ?auto_832432 ) ( ON ?auto_832434 ?auto_832433 ) ( ON ?auto_832435 ?auto_832434 ) ( ON ?auto_832436 ?auto_832435 ) ( not ( = ?auto_832431 ?auto_832432 ) ) ( not ( = ?auto_832431 ?auto_832433 ) ) ( not ( = ?auto_832431 ?auto_832434 ) ) ( not ( = ?auto_832431 ?auto_832435 ) ) ( not ( = ?auto_832431 ?auto_832436 ) ) ( not ( = ?auto_832431 ?auto_832437 ) ) ( not ( = ?auto_832431 ?auto_832438 ) ) ( not ( = ?auto_832431 ?auto_832439 ) ) ( not ( = ?auto_832431 ?auto_832440 ) ) ( not ( = ?auto_832431 ?auto_832441 ) ) ( not ( = ?auto_832431 ?auto_832442 ) ) ( not ( = ?auto_832431 ?auto_832443 ) ) ( not ( = ?auto_832431 ?auto_832444 ) ) ( not ( = ?auto_832431 ?auto_832445 ) ) ( not ( = ?auto_832431 ?auto_832446 ) ) ( not ( = ?auto_832432 ?auto_832433 ) ) ( not ( = ?auto_832432 ?auto_832434 ) ) ( not ( = ?auto_832432 ?auto_832435 ) ) ( not ( = ?auto_832432 ?auto_832436 ) ) ( not ( = ?auto_832432 ?auto_832437 ) ) ( not ( = ?auto_832432 ?auto_832438 ) ) ( not ( = ?auto_832432 ?auto_832439 ) ) ( not ( = ?auto_832432 ?auto_832440 ) ) ( not ( = ?auto_832432 ?auto_832441 ) ) ( not ( = ?auto_832432 ?auto_832442 ) ) ( not ( = ?auto_832432 ?auto_832443 ) ) ( not ( = ?auto_832432 ?auto_832444 ) ) ( not ( = ?auto_832432 ?auto_832445 ) ) ( not ( = ?auto_832432 ?auto_832446 ) ) ( not ( = ?auto_832433 ?auto_832434 ) ) ( not ( = ?auto_832433 ?auto_832435 ) ) ( not ( = ?auto_832433 ?auto_832436 ) ) ( not ( = ?auto_832433 ?auto_832437 ) ) ( not ( = ?auto_832433 ?auto_832438 ) ) ( not ( = ?auto_832433 ?auto_832439 ) ) ( not ( = ?auto_832433 ?auto_832440 ) ) ( not ( = ?auto_832433 ?auto_832441 ) ) ( not ( = ?auto_832433 ?auto_832442 ) ) ( not ( = ?auto_832433 ?auto_832443 ) ) ( not ( = ?auto_832433 ?auto_832444 ) ) ( not ( = ?auto_832433 ?auto_832445 ) ) ( not ( = ?auto_832433 ?auto_832446 ) ) ( not ( = ?auto_832434 ?auto_832435 ) ) ( not ( = ?auto_832434 ?auto_832436 ) ) ( not ( = ?auto_832434 ?auto_832437 ) ) ( not ( = ?auto_832434 ?auto_832438 ) ) ( not ( = ?auto_832434 ?auto_832439 ) ) ( not ( = ?auto_832434 ?auto_832440 ) ) ( not ( = ?auto_832434 ?auto_832441 ) ) ( not ( = ?auto_832434 ?auto_832442 ) ) ( not ( = ?auto_832434 ?auto_832443 ) ) ( not ( = ?auto_832434 ?auto_832444 ) ) ( not ( = ?auto_832434 ?auto_832445 ) ) ( not ( = ?auto_832434 ?auto_832446 ) ) ( not ( = ?auto_832435 ?auto_832436 ) ) ( not ( = ?auto_832435 ?auto_832437 ) ) ( not ( = ?auto_832435 ?auto_832438 ) ) ( not ( = ?auto_832435 ?auto_832439 ) ) ( not ( = ?auto_832435 ?auto_832440 ) ) ( not ( = ?auto_832435 ?auto_832441 ) ) ( not ( = ?auto_832435 ?auto_832442 ) ) ( not ( = ?auto_832435 ?auto_832443 ) ) ( not ( = ?auto_832435 ?auto_832444 ) ) ( not ( = ?auto_832435 ?auto_832445 ) ) ( not ( = ?auto_832435 ?auto_832446 ) ) ( not ( = ?auto_832436 ?auto_832437 ) ) ( not ( = ?auto_832436 ?auto_832438 ) ) ( not ( = ?auto_832436 ?auto_832439 ) ) ( not ( = ?auto_832436 ?auto_832440 ) ) ( not ( = ?auto_832436 ?auto_832441 ) ) ( not ( = ?auto_832436 ?auto_832442 ) ) ( not ( = ?auto_832436 ?auto_832443 ) ) ( not ( = ?auto_832436 ?auto_832444 ) ) ( not ( = ?auto_832436 ?auto_832445 ) ) ( not ( = ?auto_832436 ?auto_832446 ) ) ( not ( = ?auto_832437 ?auto_832438 ) ) ( not ( = ?auto_832437 ?auto_832439 ) ) ( not ( = ?auto_832437 ?auto_832440 ) ) ( not ( = ?auto_832437 ?auto_832441 ) ) ( not ( = ?auto_832437 ?auto_832442 ) ) ( not ( = ?auto_832437 ?auto_832443 ) ) ( not ( = ?auto_832437 ?auto_832444 ) ) ( not ( = ?auto_832437 ?auto_832445 ) ) ( not ( = ?auto_832437 ?auto_832446 ) ) ( not ( = ?auto_832438 ?auto_832439 ) ) ( not ( = ?auto_832438 ?auto_832440 ) ) ( not ( = ?auto_832438 ?auto_832441 ) ) ( not ( = ?auto_832438 ?auto_832442 ) ) ( not ( = ?auto_832438 ?auto_832443 ) ) ( not ( = ?auto_832438 ?auto_832444 ) ) ( not ( = ?auto_832438 ?auto_832445 ) ) ( not ( = ?auto_832438 ?auto_832446 ) ) ( not ( = ?auto_832439 ?auto_832440 ) ) ( not ( = ?auto_832439 ?auto_832441 ) ) ( not ( = ?auto_832439 ?auto_832442 ) ) ( not ( = ?auto_832439 ?auto_832443 ) ) ( not ( = ?auto_832439 ?auto_832444 ) ) ( not ( = ?auto_832439 ?auto_832445 ) ) ( not ( = ?auto_832439 ?auto_832446 ) ) ( not ( = ?auto_832440 ?auto_832441 ) ) ( not ( = ?auto_832440 ?auto_832442 ) ) ( not ( = ?auto_832440 ?auto_832443 ) ) ( not ( = ?auto_832440 ?auto_832444 ) ) ( not ( = ?auto_832440 ?auto_832445 ) ) ( not ( = ?auto_832440 ?auto_832446 ) ) ( not ( = ?auto_832441 ?auto_832442 ) ) ( not ( = ?auto_832441 ?auto_832443 ) ) ( not ( = ?auto_832441 ?auto_832444 ) ) ( not ( = ?auto_832441 ?auto_832445 ) ) ( not ( = ?auto_832441 ?auto_832446 ) ) ( not ( = ?auto_832442 ?auto_832443 ) ) ( not ( = ?auto_832442 ?auto_832444 ) ) ( not ( = ?auto_832442 ?auto_832445 ) ) ( not ( = ?auto_832442 ?auto_832446 ) ) ( not ( = ?auto_832443 ?auto_832444 ) ) ( not ( = ?auto_832443 ?auto_832445 ) ) ( not ( = ?auto_832443 ?auto_832446 ) ) ( not ( = ?auto_832444 ?auto_832445 ) ) ( not ( = ?auto_832444 ?auto_832446 ) ) ( not ( = ?auto_832445 ?auto_832446 ) ) ( ON ?auto_832444 ?auto_832445 ) ( ON ?auto_832443 ?auto_832444 ) ( ON ?auto_832442 ?auto_832443 ) ( ON ?auto_832441 ?auto_832442 ) ( ON ?auto_832440 ?auto_832441 ) ( ON ?auto_832439 ?auto_832440 ) ( ON ?auto_832438 ?auto_832439 ) ( CLEAR ?auto_832436 ) ( ON ?auto_832437 ?auto_832438 ) ( CLEAR ?auto_832437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_832431 ?auto_832432 ?auto_832433 ?auto_832434 ?auto_832435 ?auto_832436 ?auto_832437 )
      ( MAKE-15PILE ?auto_832431 ?auto_832432 ?auto_832433 ?auto_832434 ?auto_832435 ?auto_832436 ?auto_832437 ?auto_832438 ?auto_832439 ?auto_832440 ?auto_832441 ?auto_832442 ?auto_832443 ?auto_832444 ?auto_832445 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_832493 - BLOCK
      ?auto_832494 - BLOCK
      ?auto_832495 - BLOCK
      ?auto_832496 - BLOCK
      ?auto_832497 - BLOCK
      ?auto_832498 - BLOCK
      ?auto_832499 - BLOCK
      ?auto_832500 - BLOCK
      ?auto_832501 - BLOCK
      ?auto_832502 - BLOCK
      ?auto_832503 - BLOCK
      ?auto_832504 - BLOCK
      ?auto_832505 - BLOCK
      ?auto_832506 - BLOCK
      ?auto_832507 - BLOCK
    )
    :vars
    (
      ?auto_832508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_832507 ?auto_832508 ) ( ON-TABLE ?auto_832493 ) ( ON ?auto_832494 ?auto_832493 ) ( ON ?auto_832495 ?auto_832494 ) ( ON ?auto_832496 ?auto_832495 ) ( ON ?auto_832497 ?auto_832496 ) ( not ( = ?auto_832493 ?auto_832494 ) ) ( not ( = ?auto_832493 ?auto_832495 ) ) ( not ( = ?auto_832493 ?auto_832496 ) ) ( not ( = ?auto_832493 ?auto_832497 ) ) ( not ( = ?auto_832493 ?auto_832498 ) ) ( not ( = ?auto_832493 ?auto_832499 ) ) ( not ( = ?auto_832493 ?auto_832500 ) ) ( not ( = ?auto_832493 ?auto_832501 ) ) ( not ( = ?auto_832493 ?auto_832502 ) ) ( not ( = ?auto_832493 ?auto_832503 ) ) ( not ( = ?auto_832493 ?auto_832504 ) ) ( not ( = ?auto_832493 ?auto_832505 ) ) ( not ( = ?auto_832493 ?auto_832506 ) ) ( not ( = ?auto_832493 ?auto_832507 ) ) ( not ( = ?auto_832493 ?auto_832508 ) ) ( not ( = ?auto_832494 ?auto_832495 ) ) ( not ( = ?auto_832494 ?auto_832496 ) ) ( not ( = ?auto_832494 ?auto_832497 ) ) ( not ( = ?auto_832494 ?auto_832498 ) ) ( not ( = ?auto_832494 ?auto_832499 ) ) ( not ( = ?auto_832494 ?auto_832500 ) ) ( not ( = ?auto_832494 ?auto_832501 ) ) ( not ( = ?auto_832494 ?auto_832502 ) ) ( not ( = ?auto_832494 ?auto_832503 ) ) ( not ( = ?auto_832494 ?auto_832504 ) ) ( not ( = ?auto_832494 ?auto_832505 ) ) ( not ( = ?auto_832494 ?auto_832506 ) ) ( not ( = ?auto_832494 ?auto_832507 ) ) ( not ( = ?auto_832494 ?auto_832508 ) ) ( not ( = ?auto_832495 ?auto_832496 ) ) ( not ( = ?auto_832495 ?auto_832497 ) ) ( not ( = ?auto_832495 ?auto_832498 ) ) ( not ( = ?auto_832495 ?auto_832499 ) ) ( not ( = ?auto_832495 ?auto_832500 ) ) ( not ( = ?auto_832495 ?auto_832501 ) ) ( not ( = ?auto_832495 ?auto_832502 ) ) ( not ( = ?auto_832495 ?auto_832503 ) ) ( not ( = ?auto_832495 ?auto_832504 ) ) ( not ( = ?auto_832495 ?auto_832505 ) ) ( not ( = ?auto_832495 ?auto_832506 ) ) ( not ( = ?auto_832495 ?auto_832507 ) ) ( not ( = ?auto_832495 ?auto_832508 ) ) ( not ( = ?auto_832496 ?auto_832497 ) ) ( not ( = ?auto_832496 ?auto_832498 ) ) ( not ( = ?auto_832496 ?auto_832499 ) ) ( not ( = ?auto_832496 ?auto_832500 ) ) ( not ( = ?auto_832496 ?auto_832501 ) ) ( not ( = ?auto_832496 ?auto_832502 ) ) ( not ( = ?auto_832496 ?auto_832503 ) ) ( not ( = ?auto_832496 ?auto_832504 ) ) ( not ( = ?auto_832496 ?auto_832505 ) ) ( not ( = ?auto_832496 ?auto_832506 ) ) ( not ( = ?auto_832496 ?auto_832507 ) ) ( not ( = ?auto_832496 ?auto_832508 ) ) ( not ( = ?auto_832497 ?auto_832498 ) ) ( not ( = ?auto_832497 ?auto_832499 ) ) ( not ( = ?auto_832497 ?auto_832500 ) ) ( not ( = ?auto_832497 ?auto_832501 ) ) ( not ( = ?auto_832497 ?auto_832502 ) ) ( not ( = ?auto_832497 ?auto_832503 ) ) ( not ( = ?auto_832497 ?auto_832504 ) ) ( not ( = ?auto_832497 ?auto_832505 ) ) ( not ( = ?auto_832497 ?auto_832506 ) ) ( not ( = ?auto_832497 ?auto_832507 ) ) ( not ( = ?auto_832497 ?auto_832508 ) ) ( not ( = ?auto_832498 ?auto_832499 ) ) ( not ( = ?auto_832498 ?auto_832500 ) ) ( not ( = ?auto_832498 ?auto_832501 ) ) ( not ( = ?auto_832498 ?auto_832502 ) ) ( not ( = ?auto_832498 ?auto_832503 ) ) ( not ( = ?auto_832498 ?auto_832504 ) ) ( not ( = ?auto_832498 ?auto_832505 ) ) ( not ( = ?auto_832498 ?auto_832506 ) ) ( not ( = ?auto_832498 ?auto_832507 ) ) ( not ( = ?auto_832498 ?auto_832508 ) ) ( not ( = ?auto_832499 ?auto_832500 ) ) ( not ( = ?auto_832499 ?auto_832501 ) ) ( not ( = ?auto_832499 ?auto_832502 ) ) ( not ( = ?auto_832499 ?auto_832503 ) ) ( not ( = ?auto_832499 ?auto_832504 ) ) ( not ( = ?auto_832499 ?auto_832505 ) ) ( not ( = ?auto_832499 ?auto_832506 ) ) ( not ( = ?auto_832499 ?auto_832507 ) ) ( not ( = ?auto_832499 ?auto_832508 ) ) ( not ( = ?auto_832500 ?auto_832501 ) ) ( not ( = ?auto_832500 ?auto_832502 ) ) ( not ( = ?auto_832500 ?auto_832503 ) ) ( not ( = ?auto_832500 ?auto_832504 ) ) ( not ( = ?auto_832500 ?auto_832505 ) ) ( not ( = ?auto_832500 ?auto_832506 ) ) ( not ( = ?auto_832500 ?auto_832507 ) ) ( not ( = ?auto_832500 ?auto_832508 ) ) ( not ( = ?auto_832501 ?auto_832502 ) ) ( not ( = ?auto_832501 ?auto_832503 ) ) ( not ( = ?auto_832501 ?auto_832504 ) ) ( not ( = ?auto_832501 ?auto_832505 ) ) ( not ( = ?auto_832501 ?auto_832506 ) ) ( not ( = ?auto_832501 ?auto_832507 ) ) ( not ( = ?auto_832501 ?auto_832508 ) ) ( not ( = ?auto_832502 ?auto_832503 ) ) ( not ( = ?auto_832502 ?auto_832504 ) ) ( not ( = ?auto_832502 ?auto_832505 ) ) ( not ( = ?auto_832502 ?auto_832506 ) ) ( not ( = ?auto_832502 ?auto_832507 ) ) ( not ( = ?auto_832502 ?auto_832508 ) ) ( not ( = ?auto_832503 ?auto_832504 ) ) ( not ( = ?auto_832503 ?auto_832505 ) ) ( not ( = ?auto_832503 ?auto_832506 ) ) ( not ( = ?auto_832503 ?auto_832507 ) ) ( not ( = ?auto_832503 ?auto_832508 ) ) ( not ( = ?auto_832504 ?auto_832505 ) ) ( not ( = ?auto_832504 ?auto_832506 ) ) ( not ( = ?auto_832504 ?auto_832507 ) ) ( not ( = ?auto_832504 ?auto_832508 ) ) ( not ( = ?auto_832505 ?auto_832506 ) ) ( not ( = ?auto_832505 ?auto_832507 ) ) ( not ( = ?auto_832505 ?auto_832508 ) ) ( not ( = ?auto_832506 ?auto_832507 ) ) ( not ( = ?auto_832506 ?auto_832508 ) ) ( not ( = ?auto_832507 ?auto_832508 ) ) ( ON ?auto_832506 ?auto_832507 ) ( ON ?auto_832505 ?auto_832506 ) ( ON ?auto_832504 ?auto_832505 ) ( ON ?auto_832503 ?auto_832504 ) ( ON ?auto_832502 ?auto_832503 ) ( ON ?auto_832501 ?auto_832502 ) ( ON ?auto_832500 ?auto_832501 ) ( ON ?auto_832499 ?auto_832500 ) ( CLEAR ?auto_832497 ) ( ON ?auto_832498 ?auto_832499 ) ( CLEAR ?auto_832498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_832493 ?auto_832494 ?auto_832495 ?auto_832496 ?auto_832497 ?auto_832498 )
      ( MAKE-15PILE ?auto_832493 ?auto_832494 ?auto_832495 ?auto_832496 ?auto_832497 ?auto_832498 ?auto_832499 ?auto_832500 ?auto_832501 ?auto_832502 ?auto_832503 ?auto_832504 ?auto_832505 ?auto_832506 ?auto_832507 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_832555 - BLOCK
      ?auto_832556 - BLOCK
      ?auto_832557 - BLOCK
      ?auto_832558 - BLOCK
      ?auto_832559 - BLOCK
      ?auto_832560 - BLOCK
      ?auto_832561 - BLOCK
      ?auto_832562 - BLOCK
      ?auto_832563 - BLOCK
      ?auto_832564 - BLOCK
      ?auto_832565 - BLOCK
      ?auto_832566 - BLOCK
      ?auto_832567 - BLOCK
      ?auto_832568 - BLOCK
      ?auto_832569 - BLOCK
    )
    :vars
    (
      ?auto_832570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_832569 ?auto_832570 ) ( ON-TABLE ?auto_832555 ) ( ON ?auto_832556 ?auto_832555 ) ( ON ?auto_832557 ?auto_832556 ) ( ON ?auto_832558 ?auto_832557 ) ( not ( = ?auto_832555 ?auto_832556 ) ) ( not ( = ?auto_832555 ?auto_832557 ) ) ( not ( = ?auto_832555 ?auto_832558 ) ) ( not ( = ?auto_832555 ?auto_832559 ) ) ( not ( = ?auto_832555 ?auto_832560 ) ) ( not ( = ?auto_832555 ?auto_832561 ) ) ( not ( = ?auto_832555 ?auto_832562 ) ) ( not ( = ?auto_832555 ?auto_832563 ) ) ( not ( = ?auto_832555 ?auto_832564 ) ) ( not ( = ?auto_832555 ?auto_832565 ) ) ( not ( = ?auto_832555 ?auto_832566 ) ) ( not ( = ?auto_832555 ?auto_832567 ) ) ( not ( = ?auto_832555 ?auto_832568 ) ) ( not ( = ?auto_832555 ?auto_832569 ) ) ( not ( = ?auto_832555 ?auto_832570 ) ) ( not ( = ?auto_832556 ?auto_832557 ) ) ( not ( = ?auto_832556 ?auto_832558 ) ) ( not ( = ?auto_832556 ?auto_832559 ) ) ( not ( = ?auto_832556 ?auto_832560 ) ) ( not ( = ?auto_832556 ?auto_832561 ) ) ( not ( = ?auto_832556 ?auto_832562 ) ) ( not ( = ?auto_832556 ?auto_832563 ) ) ( not ( = ?auto_832556 ?auto_832564 ) ) ( not ( = ?auto_832556 ?auto_832565 ) ) ( not ( = ?auto_832556 ?auto_832566 ) ) ( not ( = ?auto_832556 ?auto_832567 ) ) ( not ( = ?auto_832556 ?auto_832568 ) ) ( not ( = ?auto_832556 ?auto_832569 ) ) ( not ( = ?auto_832556 ?auto_832570 ) ) ( not ( = ?auto_832557 ?auto_832558 ) ) ( not ( = ?auto_832557 ?auto_832559 ) ) ( not ( = ?auto_832557 ?auto_832560 ) ) ( not ( = ?auto_832557 ?auto_832561 ) ) ( not ( = ?auto_832557 ?auto_832562 ) ) ( not ( = ?auto_832557 ?auto_832563 ) ) ( not ( = ?auto_832557 ?auto_832564 ) ) ( not ( = ?auto_832557 ?auto_832565 ) ) ( not ( = ?auto_832557 ?auto_832566 ) ) ( not ( = ?auto_832557 ?auto_832567 ) ) ( not ( = ?auto_832557 ?auto_832568 ) ) ( not ( = ?auto_832557 ?auto_832569 ) ) ( not ( = ?auto_832557 ?auto_832570 ) ) ( not ( = ?auto_832558 ?auto_832559 ) ) ( not ( = ?auto_832558 ?auto_832560 ) ) ( not ( = ?auto_832558 ?auto_832561 ) ) ( not ( = ?auto_832558 ?auto_832562 ) ) ( not ( = ?auto_832558 ?auto_832563 ) ) ( not ( = ?auto_832558 ?auto_832564 ) ) ( not ( = ?auto_832558 ?auto_832565 ) ) ( not ( = ?auto_832558 ?auto_832566 ) ) ( not ( = ?auto_832558 ?auto_832567 ) ) ( not ( = ?auto_832558 ?auto_832568 ) ) ( not ( = ?auto_832558 ?auto_832569 ) ) ( not ( = ?auto_832558 ?auto_832570 ) ) ( not ( = ?auto_832559 ?auto_832560 ) ) ( not ( = ?auto_832559 ?auto_832561 ) ) ( not ( = ?auto_832559 ?auto_832562 ) ) ( not ( = ?auto_832559 ?auto_832563 ) ) ( not ( = ?auto_832559 ?auto_832564 ) ) ( not ( = ?auto_832559 ?auto_832565 ) ) ( not ( = ?auto_832559 ?auto_832566 ) ) ( not ( = ?auto_832559 ?auto_832567 ) ) ( not ( = ?auto_832559 ?auto_832568 ) ) ( not ( = ?auto_832559 ?auto_832569 ) ) ( not ( = ?auto_832559 ?auto_832570 ) ) ( not ( = ?auto_832560 ?auto_832561 ) ) ( not ( = ?auto_832560 ?auto_832562 ) ) ( not ( = ?auto_832560 ?auto_832563 ) ) ( not ( = ?auto_832560 ?auto_832564 ) ) ( not ( = ?auto_832560 ?auto_832565 ) ) ( not ( = ?auto_832560 ?auto_832566 ) ) ( not ( = ?auto_832560 ?auto_832567 ) ) ( not ( = ?auto_832560 ?auto_832568 ) ) ( not ( = ?auto_832560 ?auto_832569 ) ) ( not ( = ?auto_832560 ?auto_832570 ) ) ( not ( = ?auto_832561 ?auto_832562 ) ) ( not ( = ?auto_832561 ?auto_832563 ) ) ( not ( = ?auto_832561 ?auto_832564 ) ) ( not ( = ?auto_832561 ?auto_832565 ) ) ( not ( = ?auto_832561 ?auto_832566 ) ) ( not ( = ?auto_832561 ?auto_832567 ) ) ( not ( = ?auto_832561 ?auto_832568 ) ) ( not ( = ?auto_832561 ?auto_832569 ) ) ( not ( = ?auto_832561 ?auto_832570 ) ) ( not ( = ?auto_832562 ?auto_832563 ) ) ( not ( = ?auto_832562 ?auto_832564 ) ) ( not ( = ?auto_832562 ?auto_832565 ) ) ( not ( = ?auto_832562 ?auto_832566 ) ) ( not ( = ?auto_832562 ?auto_832567 ) ) ( not ( = ?auto_832562 ?auto_832568 ) ) ( not ( = ?auto_832562 ?auto_832569 ) ) ( not ( = ?auto_832562 ?auto_832570 ) ) ( not ( = ?auto_832563 ?auto_832564 ) ) ( not ( = ?auto_832563 ?auto_832565 ) ) ( not ( = ?auto_832563 ?auto_832566 ) ) ( not ( = ?auto_832563 ?auto_832567 ) ) ( not ( = ?auto_832563 ?auto_832568 ) ) ( not ( = ?auto_832563 ?auto_832569 ) ) ( not ( = ?auto_832563 ?auto_832570 ) ) ( not ( = ?auto_832564 ?auto_832565 ) ) ( not ( = ?auto_832564 ?auto_832566 ) ) ( not ( = ?auto_832564 ?auto_832567 ) ) ( not ( = ?auto_832564 ?auto_832568 ) ) ( not ( = ?auto_832564 ?auto_832569 ) ) ( not ( = ?auto_832564 ?auto_832570 ) ) ( not ( = ?auto_832565 ?auto_832566 ) ) ( not ( = ?auto_832565 ?auto_832567 ) ) ( not ( = ?auto_832565 ?auto_832568 ) ) ( not ( = ?auto_832565 ?auto_832569 ) ) ( not ( = ?auto_832565 ?auto_832570 ) ) ( not ( = ?auto_832566 ?auto_832567 ) ) ( not ( = ?auto_832566 ?auto_832568 ) ) ( not ( = ?auto_832566 ?auto_832569 ) ) ( not ( = ?auto_832566 ?auto_832570 ) ) ( not ( = ?auto_832567 ?auto_832568 ) ) ( not ( = ?auto_832567 ?auto_832569 ) ) ( not ( = ?auto_832567 ?auto_832570 ) ) ( not ( = ?auto_832568 ?auto_832569 ) ) ( not ( = ?auto_832568 ?auto_832570 ) ) ( not ( = ?auto_832569 ?auto_832570 ) ) ( ON ?auto_832568 ?auto_832569 ) ( ON ?auto_832567 ?auto_832568 ) ( ON ?auto_832566 ?auto_832567 ) ( ON ?auto_832565 ?auto_832566 ) ( ON ?auto_832564 ?auto_832565 ) ( ON ?auto_832563 ?auto_832564 ) ( ON ?auto_832562 ?auto_832563 ) ( ON ?auto_832561 ?auto_832562 ) ( ON ?auto_832560 ?auto_832561 ) ( CLEAR ?auto_832558 ) ( ON ?auto_832559 ?auto_832560 ) ( CLEAR ?auto_832559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_832555 ?auto_832556 ?auto_832557 ?auto_832558 ?auto_832559 )
      ( MAKE-15PILE ?auto_832555 ?auto_832556 ?auto_832557 ?auto_832558 ?auto_832559 ?auto_832560 ?auto_832561 ?auto_832562 ?auto_832563 ?auto_832564 ?auto_832565 ?auto_832566 ?auto_832567 ?auto_832568 ?auto_832569 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_832617 - BLOCK
      ?auto_832618 - BLOCK
      ?auto_832619 - BLOCK
      ?auto_832620 - BLOCK
      ?auto_832621 - BLOCK
      ?auto_832622 - BLOCK
      ?auto_832623 - BLOCK
      ?auto_832624 - BLOCK
      ?auto_832625 - BLOCK
      ?auto_832626 - BLOCK
      ?auto_832627 - BLOCK
      ?auto_832628 - BLOCK
      ?auto_832629 - BLOCK
      ?auto_832630 - BLOCK
      ?auto_832631 - BLOCK
    )
    :vars
    (
      ?auto_832632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_832631 ?auto_832632 ) ( ON-TABLE ?auto_832617 ) ( ON ?auto_832618 ?auto_832617 ) ( ON ?auto_832619 ?auto_832618 ) ( not ( = ?auto_832617 ?auto_832618 ) ) ( not ( = ?auto_832617 ?auto_832619 ) ) ( not ( = ?auto_832617 ?auto_832620 ) ) ( not ( = ?auto_832617 ?auto_832621 ) ) ( not ( = ?auto_832617 ?auto_832622 ) ) ( not ( = ?auto_832617 ?auto_832623 ) ) ( not ( = ?auto_832617 ?auto_832624 ) ) ( not ( = ?auto_832617 ?auto_832625 ) ) ( not ( = ?auto_832617 ?auto_832626 ) ) ( not ( = ?auto_832617 ?auto_832627 ) ) ( not ( = ?auto_832617 ?auto_832628 ) ) ( not ( = ?auto_832617 ?auto_832629 ) ) ( not ( = ?auto_832617 ?auto_832630 ) ) ( not ( = ?auto_832617 ?auto_832631 ) ) ( not ( = ?auto_832617 ?auto_832632 ) ) ( not ( = ?auto_832618 ?auto_832619 ) ) ( not ( = ?auto_832618 ?auto_832620 ) ) ( not ( = ?auto_832618 ?auto_832621 ) ) ( not ( = ?auto_832618 ?auto_832622 ) ) ( not ( = ?auto_832618 ?auto_832623 ) ) ( not ( = ?auto_832618 ?auto_832624 ) ) ( not ( = ?auto_832618 ?auto_832625 ) ) ( not ( = ?auto_832618 ?auto_832626 ) ) ( not ( = ?auto_832618 ?auto_832627 ) ) ( not ( = ?auto_832618 ?auto_832628 ) ) ( not ( = ?auto_832618 ?auto_832629 ) ) ( not ( = ?auto_832618 ?auto_832630 ) ) ( not ( = ?auto_832618 ?auto_832631 ) ) ( not ( = ?auto_832618 ?auto_832632 ) ) ( not ( = ?auto_832619 ?auto_832620 ) ) ( not ( = ?auto_832619 ?auto_832621 ) ) ( not ( = ?auto_832619 ?auto_832622 ) ) ( not ( = ?auto_832619 ?auto_832623 ) ) ( not ( = ?auto_832619 ?auto_832624 ) ) ( not ( = ?auto_832619 ?auto_832625 ) ) ( not ( = ?auto_832619 ?auto_832626 ) ) ( not ( = ?auto_832619 ?auto_832627 ) ) ( not ( = ?auto_832619 ?auto_832628 ) ) ( not ( = ?auto_832619 ?auto_832629 ) ) ( not ( = ?auto_832619 ?auto_832630 ) ) ( not ( = ?auto_832619 ?auto_832631 ) ) ( not ( = ?auto_832619 ?auto_832632 ) ) ( not ( = ?auto_832620 ?auto_832621 ) ) ( not ( = ?auto_832620 ?auto_832622 ) ) ( not ( = ?auto_832620 ?auto_832623 ) ) ( not ( = ?auto_832620 ?auto_832624 ) ) ( not ( = ?auto_832620 ?auto_832625 ) ) ( not ( = ?auto_832620 ?auto_832626 ) ) ( not ( = ?auto_832620 ?auto_832627 ) ) ( not ( = ?auto_832620 ?auto_832628 ) ) ( not ( = ?auto_832620 ?auto_832629 ) ) ( not ( = ?auto_832620 ?auto_832630 ) ) ( not ( = ?auto_832620 ?auto_832631 ) ) ( not ( = ?auto_832620 ?auto_832632 ) ) ( not ( = ?auto_832621 ?auto_832622 ) ) ( not ( = ?auto_832621 ?auto_832623 ) ) ( not ( = ?auto_832621 ?auto_832624 ) ) ( not ( = ?auto_832621 ?auto_832625 ) ) ( not ( = ?auto_832621 ?auto_832626 ) ) ( not ( = ?auto_832621 ?auto_832627 ) ) ( not ( = ?auto_832621 ?auto_832628 ) ) ( not ( = ?auto_832621 ?auto_832629 ) ) ( not ( = ?auto_832621 ?auto_832630 ) ) ( not ( = ?auto_832621 ?auto_832631 ) ) ( not ( = ?auto_832621 ?auto_832632 ) ) ( not ( = ?auto_832622 ?auto_832623 ) ) ( not ( = ?auto_832622 ?auto_832624 ) ) ( not ( = ?auto_832622 ?auto_832625 ) ) ( not ( = ?auto_832622 ?auto_832626 ) ) ( not ( = ?auto_832622 ?auto_832627 ) ) ( not ( = ?auto_832622 ?auto_832628 ) ) ( not ( = ?auto_832622 ?auto_832629 ) ) ( not ( = ?auto_832622 ?auto_832630 ) ) ( not ( = ?auto_832622 ?auto_832631 ) ) ( not ( = ?auto_832622 ?auto_832632 ) ) ( not ( = ?auto_832623 ?auto_832624 ) ) ( not ( = ?auto_832623 ?auto_832625 ) ) ( not ( = ?auto_832623 ?auto_832626 ) ) ( not ( = ?auto_832623 ?auto_832627 ) ) ( not ( = ?auto_832623 ?auto_832628 ) ) ( not ( = ?auto_832623 ?auto_832629 ) ) ( not ( = ?auto_832623 ?auto_832630 ) ) ( not ( = ?auto_832623 ?auto_832631 ) ) ( not ( = ?auto_832623 ?auto_832632 ) ) ( not ( = ?auto_832624 ?auto_832625 ) ) ( not ( = ?auto_832624 ?auto_832626 ) ) ( not ( = ?auto_832624 ?auto_832627 ) ) ( not ( = ?auto_832624 ?auto_832628 ) ) ( not ( = ?auto_832624 ?auto_832629 ) ) ( not ( = ?auto_832624 ?auto_832630 ) ) ( not ( = ?auto_832624 ?auto_832631 ) ) ( not ( = ?auto_832624 ?auto_832632 ) ) ( not ( = ?auto_832625 ?auto_832626 ) ) ( not ( = ?auto_832625 ?auto_832627 ) ) ( not ( = ?auto_832625 ?auto_832628 ) ) ( not ( = ?auto_832625 ?auto_832629 ) ) ( not ( = ?auto_832625 ?auto_832630 ) ) ( not ( = ?auto_832625 ?auto_832631 ) ) ( not ( = ?auto_832625 ?auto_832632 ) ) ( not ( = ?auto_832626 ?auto_832627 ) ) ( not ( = ?auto_832626 ?auto_832628 ) ) ( not ( = ?auto_832626 ?auto_832629 ) ) ( not ( = ?auto_832626 ?auto_832630 ) ) ( not ( = ?auto_832626 ?auto_832631 ) ) ( not ( = ?auto_832626 ?auto_832632 ) ) ( not ( = ?auto_832627 ?auto_832628 ) ) ( not ( = ?auto_832627 ?auto_832629 ) ) ( not ( = ?auto_832627 ?auto_832630 ) ) ( not ( = ?auto_832627 ?auto_832631 ) ) ( not ( = ?auto_832627 ?auto_832632 ) ) ( not ( = ?auto_832628 ?auto_832629 ) ) ( not ( = ?auto_832628 ?auto_832630 ) ) ( not ( = ?auto_832628 ?auto_832631 ) ) ( not ( = ?auto_832628 ?auto_832632 ) ) ( not ( = ?auto_832629 ?auto_832630 ) ) ( not ( = ?auto_832629 ?auto_832631 ) ) ( not ( = ?auto_832629 ?auto_832632 ) ) ( not ( = ?auto_832630 ?auto_832631 ) ) ( not ( = ?auto_832630 ?auto_832632 ) ) ( not ( = ?auto_832631 ?auto_832632 ) ) ( ON ?auto_832630 ?auto_832631 ) ( ON ?auto_832629 ?auto_832630 ) ( ON ?auto_832628 ?auto_832629 ) ( ON ?auto_832627 ?auto_832628 ) ( ON ?auto_832626 ?auto_832627 ) ( ON ?auto_832625 ?auto_832626 ) ( ON ?auto_832624 ?auto_832625 ) ( ON ?auto_832623 ?auto_832624 ) ( ON ?auto_832622 ?auto_832623 ) ( ON ?auto_832621 ?auto_832622 ) ( CLEAR ?auto_832619 ) ( ON ?auto_832620 ?auto_832621 ) ( CLEAR ?auto_832620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_832617 ?auto_832618 ?auto_832619 ?auto_832620 )
      ( MAKE-15PILE ?auto_832617 ?auto_832618 ?auto_832619 ?auto_832620 ?auto_832621 ?auto_832622 ?auto_832623 ?auto_832624 ?auto_832625 ?auto_832626 ?auto_832627 ?auto_832628 ?auto_832629 ?auto_832630 ?auto_832631 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_832679 - BLOCK
      ?auto_832680 - BLOCK
      ?auto_832681 - BLOCK
      ?auto_832682 - BLOCK
      ?auto_832683 - BLOCK
      ?auto_832684 - BLOCK
      ?auto_832685 - BLOCK
      ?auto_832686 - BLOCK
      ?auto_832687 - BLOCK
      ?auto_832688 - BLOCK
      ?auto_832689 - BLOCK
      ?auto_832690 - BLOCK
      ?auto_832691 - BLOCK
      ?auto_832692 - BLOCK
      ?auto_832693 - BLOCK
    )
    :vars
    (
      ?auto_832694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_832693 ?auto_832694 ) ( ON-TABLE ?auto_832679 ) ( ON ?auto_832680 ?auto_832679 ) ( not ( = ?auto_832679 ?auto_832680 ) ) ( not ( = ?auto_832679 ?auto_832681 ) ) ( not ( = ?auto_832679 ?auto_832682 ) ) ( not ( = ?auto_832679 ?auto_832683 ) ) ( not ( = ?auto_832679 ?auto_832684 ) ) ( not ( = ?auto_832679 ?auto_832685 ) ) ( not ( = ?auto_832679 ?auto_832686 ) ) ( not ( = ?auto_832679 ?auto_832687 ) ) ( not ( = ?auto_832679 ?auto_832688 ) ) ( not ( = ?auto_832679 ?auto_832689 ) ) ( not ( = ?auto_832679 ?auto_832690 ) ) ( not ( = ?auto_832679 ?auto_832691 ) ) ( not ( = ?auto_832679 ?auto_832692 ) ) ( not ( = ?auto_832679 ?auto_832693 ) ) ( not ( = ?auto_832679 ?auto_832694 ) ) ( not ( = ?auto_832680 ?auto_832681 ) ) ( not ( = ?auto_832680 ?auto_832682 ) ) ( not ( = ?auto_832680 ?auto_832683 ) ) ( not ( = ?auto_832680 ?auto_832684 ) ) ( not ( = ?auto_832680 ?auto_832685 ) ) ( not ( = ?auto_832680 ?auto_832686 ) ) ( not ( = ?auto_832680 ?auto_832687 ) ) ( not ( = ?auto_832680 ?auto_832688 ) ) ( not ( = ?auto_832680 ?auto_832689 ) ) ( not ( = ?auto_832680 ?auto_832690 ) ) ( not ( = ?auto_832680 ?auto_832691 ) ) ( not ( = ?auto_832680 ?auto_832692 ) ) ( not ( = ?auto_832680 ?auto_832693 ) ) ( not ( = ?auto_832680 ?auto_832694 ) ) ( not ( = ?auto_832681 ?auto_832682 ) ) ( not ( = ?auto_832681 ?auto_832683 ) ) ( not ( = ?auto_832681 ?auto_832684 ) ) ( not ( = ?auto_832681 ?auto_832685 ) ) ( not ( = ?auto_832681 ?auto_832686 ) ) ( not ( = ?auto_832681 ?auto_832687 ) ) ( not ( = ?auto_832681 ?auto_832688 ) ) ( not ( = ?auto_832681 ?auto_832689 ) ) ( not ( = ?auto_832681 ?auto_832690 ) ) ( not ( = ?auto_832681 ?auto_832691 ) ) ( not ( = ?auto_832681 ?auto_832692 ) ) ( not ( = ?auto_832681 ?auto_832693 ) ) ( not ( = ?auto_832681 ?auto_832694 ) ) ( not ( = ?auto_832682 ?auto_832683 ) ) ( not ( = ?auto_832682 ?auto_832684 ) ) ( not ( = ?auto_832682 ?auto_832685 ) ) ( not ( = ?auto_832682 ?auto_832686 ) ) ( not ( = ?auto_832682 ?auto_832687 ) ) ( not ( = ?auto_832682 ?auto_832688 ) ) ( not ( = ?auto_832682 ?auto_832689 ) ) ( not ( = ?auto_832682 ?auto_832690 ) ) ( not ( = ?auto_832682 ?auto_832691 ) ) ( not ( = ?auto_832682 ?auto_832692 ) ) ( not ( = ?auto_832682 ?auto_832693 ) ) ( not ( = ?auto_832682 ?auto_832694 ) ) ( not ( = ?auto_832683 ?auto_832684 ) ) ( not ( = ?auto_832683 ?auto_832685 ) ) ( not ( = ?auto_832683 ?auto_832686 ) ) ( not ( = ?auto_832683 ?auto_832687 ) ) ( not ( = ?auto_832683 ?auto_832688 ) ) ( not ( = ?auto_832683 ?auto_832689 ) ) ( not ( = ?auto_832683 ?auto_832690 ) ) ( not ( = ?auto_832683 ?auto_832691 ) ) ( not ( = ?auto_832683 ?auto_832692 ) ) ( not ( = ?auto_832683 ?auto_832693 ) ) ( not ( = ?auto_832683 ?auto_832694 ) ) ( not ( = ?auto_832684 ?auto_832685 ) ) ( not ( = ?auto_832684 ?auto_832686 ) ) ( not ( = ?auto_832684 ?auto_832687 ) ) ( not ( = ?auto_832684 ?auto_832688 ) ) ( not ( = ?auto_832684 ?auto_832689 ) ) ( not ( = ?auto_832684 ?auto_832690 ) ) ( not ( = ?auto_832684 ?auto_832691 ) ) ( not ( = ?auto_832684 ?auto_832692 ) ) ( not ( = ?auto_832684 ?auto_832693 ) ) ( not ( = ?auto_832684 ?auto_832694 ) ) ( not ( = ?auto_832685 ?auto_832686 ) ) ( not ( = ?auto_832685 ?auto_832687 ) ) ( not ( = ?auto_832685 ?auto_832688 ) ) ( not ( = ?auto_832685 ?auto_832689 ) ) ( not ( = ?auto_832685 ?auto_832690 ) ) ( not ( = ?auto_832685 ?auto_832691 ) ) ( not ( = ?auto_832685 ?auto_832692 ) ) ( not ( = ?auto_832685 ?auto_832693 ) ) ( not ( = ?auto_832685 ?auto_832694 ) ) ( not ( = ?auto_832686 ?auto_832687 ) ) ( not ( = ?auto_832686 ?auto_832688 ) ) ( not ( = ?auto_832686 ?auto_832689 ) ) ( not ( = ?auto_832686 ?auto_832690 ) ) ( not ( = ?auto_832686 ?auto_832691 ) ) ( not ( = ?auto_832686 ?auto_832692 ) ) ( not ( = ?auto_832686 ?auto_832693 ) ) ( not ( = ?auto_832686 ?auto_832694 ) ) ( not ( = ?auto_832687 ?auto_832688 ) ) ( not ( = ?auto_832687 ?auto_832689 ) ) ( not ( = ?auto_832687 ?auto_832690 ) ) ( not ( = ?auto_832687 ?auto_832691 ) ) ( not ( = ?auto_832687 ?auto_832692 ) ) ( not ( = ?auto_832687 ?auto_832693 ) ) ( not ( = ?auto_832687 ?auto_832694 ) ) ( not ( = ?auto_832688 ?auto_832689 ) ) ( not ( = ?auto_832688 ?auto_832690 ) ) ( not ( = ?auto_832688 ?auto_832691 ) ) ( not ( = ?auto_832688 ?auto_832692 ) ) ( not ( = ?auto_832688 ?auto_832693 ) ) ( not ( = ?auto_832688 ?auto_832694 ) ) ( not ( = ?auto_832689 ?auto_832690 ) ) ( not ( = ?auto_832689 ?auto_832691 ) ) ( not ( = ?auto_832689 ?auto_832692 ) ) ( not ( = ?auto_832689 ?auto_832693 ) ) ( not ( = ?auto_832689 ?auto_832694 ) ) ( not ( = ?auto_832690 ?auto_832691 ) ) ( not ( = ?auto_832690 ?auto_832692 ) ) ( not ( = ?auto_832690 ?auto_832693 ) ) ( not ( = ?auto_832690 ?auto_832694 ) ) ( not ( = ?auto_832691 ?auto_832692 ) ) ( not ( = ?auto_832691 ?auto_832693 ) ) ( not ( = ?auto_832691 ?auto_832694 ) ) ( not ( = ?auto_832692 ?auto_832693 ) ) ( not ( = ?auto_832692 ?auto_832694 ) ) ( not ( = ?auto_832693 ?auto_832694 ) ) ( ON ?auto_832692 ?auto_832693 ) ( ON ?auto_832691 ?auto_832692 ) ( ON ?auto_832690 ?auto_832691 ) ( ON ?auto_832689 ?auto_832690 ) ( ON ?auto_832688 ?auto_832689 ) ( ON ?auto_832687 ?auto_832688 ) ( ON ?auto_832686 ?auto_832687 ) ( ON ?auto_832685 ?auto_832686 ) ( ON ?auto_832684 ?auto_832685 ) ( ON ?auto_832683 ?auto_832684 ) ( ON ?auto_832682 ?auto_832683 ) ( CLEAR ?auto_832680 ) ( ON ?auto_832681 ?auto_832682 ) ( CLEAR ?auto_832681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_832679 ?auto_832680 ?auto_832681 )
      ( MAKE-15PILE ?auto_832679 ?auto_832680 ?auto_832681 ?auto_832682 ?auto_832683 ?auto_832684 ?auto_832685 ?auto_832686 ?auto_832687 ?auto_832688 ?auto_832689 ?auto_832690 ?auto_832691 ?auto_832692 ?auto_832693 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_832741 - BLOCK
      ?auto_832742 - BLOCK
      ?auto_832743 - BLOCK
      ?auto_832744 - BLOCK
      ?auto_832745 - BLOCK
      ?auto_832746 - BLOCK
      ?auto_832747 - BLOCK
      ?auto_832748 - BLOCK
      ?auto_832749 - BLOCK
      ?auto_832750 - BLOCK
      ?auto_832751 - BLOCK
      ?auto_832752 - BLOCK
      ?auto_832753 - BLOCK
      ?auto_832754 - BLOCK
      ?auto_832755 - BLOCK
    )
    :vars
    (
      ?auto_832756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_832755 ?auto_832756 ) ( ON-TABLE ?auto_832741 ) ( not ( = ?auto_832741 ?auto_832742 ) ) ( not ( = ?auto_832741 ?auto_832743 ) ) ( not ( = ?auto_832741 ?auto_832744 ) ) ( not ( = ?auto_832741 ?auto_832745 ) ) ( not ( = ?auto_832741 ?auto_832746 ) ) ( not ( = ?auto_832741 ?auto_832747 ) ) ( not ( = ?auto_832741 ?auto_832748 ) ) ( not ( = ?auto_832741 ?auto_832749 ) ) ( not ( = ?auto_832741 ?auto_832750 ) ) ( not ( = ?auto_832741 ?auto_832751 ) ) ( not ( = ?auto_832741 ?auto_832752 ) ) ( not ( = ?auto_832741 ?auto_832753 ) ) ( not ( = ?auto_832741 ?auto_832754 ) ) ( not ( = ?auto_832741 ?auto_832755 ) ) ( not ( = ?auto_832741 ?auto_832756 ) ) ( not ( = ?auto_832742 ?auto_832743 ) ) ( not ( = ?auto_832742 ?auto_832744 ) ) ( not ( = ?auto_832742 ?auto_832745 ) ) ( not ( = ?auto_832742 ?auto_832746 ) ) ( not ( = ?auto_832742 ?auto_832747 ) ) ( not ( = ?auto_832742 ?auto_832748 ) ) ( not ( = ?auto_832742 ?auto_832749 ) ) ( not ( = ?auto_832742 ?auto_832750 ) ) ( not ( = ?auto_832742 ?auto_832751 ) ) ( not ( = ?auto_832742 ?auto_832752 ) ) ( not ( = ?auto_832742 ?auto_832753 ) ) ( not ( = ?auto_832742 ?auto_832754 ) ) ( not ( = ?auto_832742 ?auto_832755 ) ) ( not ( = ?auto_832742 ?auto_832756 ) ) ( not ( = ?auto_832743 ?auto_832744 ) ) ( not ( = ?auto_832743 ?auto_832745 ) ) ( not ( = ?auto_832743 ?auto_832746 ) ) ( not ( = ?auto_832743 ?auto_832747 ) ) ( not ( = ?auto_832743 ?auto_832748 ) ) ( not ( = ?auto_832743 ?auto_832749 ) ) ( not ( = ?auto_832743 ?auto_832750 ) ) ( not ( = ?auto_832743 ?auto_832751 ) ) ( not ( = ?auto_832743 ?auto_832752 ) ) ( not ( = ?auto_832743 ?auto_832753 ) ) ( not ( = ?auto_832743 ?auto_832754 ) ) ( not ( = ?auto_832743 ?auto_832755 ) ) ( not ( = ?auto_832743 ?auto_832756 ) ) ( not ( = ?auto_832744 ?auto_832745 ) ) ( not ( = ?auto_832744 ?auto_832746 ) ) ( not ( = ?auto_832744 ?auto_832747 ) ) ( not ( = ?auto_832744 ?auto_832748 ) ) ( not ( = ?auto_832744 ?auto_832749 ) ) ( not ( = ?auto_832744 ?auto_832750 ) ) ( not ( = ?auto_832744 ?auto_832751 ) ) ( not ( = ?auto_832744 ?auto_832752 ) ) ( not ( = ?auto_832744 ?auto_832753 ) ) ( not ( = ?auto_832744 ?auto_832754 ) ) ( not ( = ?auto_832744 ?auto_832755 ) ) ( not ( = ?auto_832744 ?auto_832756 ) ) ( not ( = ?auto_832745 ?auto_832746 ) ) ( not ( = ?auto_832745 ?auto_832747 ) ) ( not ( = ?auto_832745 ?auto_832748 ) ) ( not ( = ?auto_832745 ?auto_832749 ) ) ( not ( = ?auto_832745 ?auto_832750 ) ) ( not ( = ?auto_832745 ?auto_832751 ) ) ( not ( = ?auto_832745 ?auto_832752 ) ) ( not ( = ?auto_832745 ?auto_832753 ) ) ( not ( = ?auto_832745 ?auto_832754 ) ) ( not ( = ?auto_832745 ?auto_832755 ) ) ( not ( = ?auto_832745 ?auto_832756 ) ) ( not ( = ?auto_832746 ?auto_832747 ) ) ( not ( = ?auto_832746 ?auto_832748 ) ) ( not ( = ?auto_832746 ?auto_832749 ) ) ( not ( = ?auto_832746 ?auto_832750 ) ) ( not ( = ?auto_832746 ?auto_832751 ) ) ( not ( = ?auto_832746 ?auto_832752 ) ) ( not ( = ?auto_832746 ?auto_832753 ) ) ( not ( = ?auto_832746 ?auto_832754 ) ) ( not ( = ?auto_832746 ?auto_832755 ) ) ( not ( = ?auto_832746 ?auto_832756 ) ) ( not ( = ?auto_832747 ?auto_832748 ) ) ( not ( = ?auto_832747 ?auto_832749 ) ) ( not ( = ?auto_832747 ?auto_832750 ) ) ( not ( = ?auto_832747 ?auto_832751 ) ) ( not ( = ?auto_832747 ?auto_832752 ) ) ( not ( = ?auto_832747 ?auto_832753 ) ) ( not ( = ?auto_832747 ?auto_832754 ) ) ( not ( = ?auto_832747 ?auto_832755 ) ) ( not ( = ?auto_832747 ?auto_832756 ) ) ( not ( = ?auto_832748 ?auto_832749 ) ) ( not ( = ?auto_832748 ?auto_832750 ) ) ( not ( = ?auto_832748 ?auto_832751 ) ) ( not ( = ?auto_832748 ?auto_832752 ) ) ( not ( = ?auto_832748 ?auto_832753 ) ) ( not ( = ?auto_832748 ?auto_832754 ) ) ( not ( = ?auto_832748 ?auto_832755 ) ) ( not ( = ?auto_832748 ?auto_832756 ) ) ( not ( = ?auto_832749 ?auto_832750 ) ) ( not ( = ?auto_832749 ?auto_832751 ) ) ( not ( = ?auto_832749 ?auto_832752 ) ) ( not ( = ?auto_832749 ?auto_832753 ) ) ( not ( = ?auto_832749 ?auto_832754 ) ) ( not ( = ?auto_832749 ?auto_832755 ) ) ( not ( = ?auto_832749 ?auto_832756 ) ) ( not ( = ?auto_832750 ?auto_832751 ) ) ( not ( = ?auto_832750 ?auto_832752 ) ) ( not ( = ?auto_832750 ?auto_832753 ) ) ( not ( = ?auto_832750 ?auto_832754 ) ) ( not ( = ?auto_832750 ?auto_832755 ) ) ( not ( = ?auto_832750 ?auto_832756 ) ) ( not ( = ?auto_832751 ?auto_832752 ) ) ( not ( = ?auto_832751 ?auto_832753 ) ) ( not ( = ?auto_832751 ?auto_832754 ) ) ( not ( = ?auto_832751 ?auto_832755 ) ) ( not ( = ?auto_832751 ?auto_832756 ) ) ( not ( = ?auto_832752 ?auto_832753 ) ) ( not ( = ?auto_832752 ?auto_832754 ) ) ( not ( = ?auto_832752 ?auto_832755 ) ) ( not ( = ?auto_832752 ?auto_832756 ) ) ( not ( = ?auto_832753 ?auto_832754 ) ) ( not ( = ?auto_832753 ?auto_832755 ) ) ( not ( = ?auto_832753 ?auto_832756 ) ) ( not ( = ?auto_832754 ?auto_832755 ) ) ( not ( = ?auto_832754 ?auto_832756 ) ) ( not ( = ?auto_832755 ?auto_832756 ) ) ( ON ?auto_832754 ?auto_832755 ) ( ON ?auto_832753 ?auto_832754 ) ( ON ?auto_832752 ?auto_832753 ) ( ON ?auto_832751 ?auto_832752 ) ( ON ?auto_832750 ?auto_832751 ) ( ON ?auto_832749 ?auto_832750 ) ( ON ?auto_832748 ?auto_832749 ) ( ON ?auto_832747 ?auto_832748 ) ( ON ?auto_832746 ?auto_832747 ) ( ON ?auto_832745 ?auto_832746 ) ( ON ?auto_832744 ?auto_832745 ) ( ON ?auto_832743 ?auto_832744 ) ( CLEAR ?auto_832741 ) ( ON ?auto_832742 ?auto_832743 ) ( CLEAR ?auto_832742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_832741 ?auto_832742 )
      ( MAKE-15PILE ?auto_832741 ?auto_832742 ?auto_832743 ?auto_832744 ?auto_832745 ?auto_832746 ?auto_832747 ?auto_832748 ?auto_832749 ?auto_832750 ?auto_832751 ?auto_832752 ?auto_832753 ?auto_832754 ?auto_832755 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_832803 - BLOCK
      ?auto_832804 - BLOCK
      ?auto_832805 - BLOCK
      ?auto_832806 - BLOCK
      ?auto_832807 - BLOCK
      ?auto_832808 - BLOCK
      ?auto_832809 - BLOCK
      ?auto_832810 - BLOCK
      ?auto_832811 - BLOCK
      ?auto_832812 - BLOCK
      ?auto_832813 - BLOCK
      ?auto_832814 - BLOCK
      ?auto_832815 - BLOCK
      ?auto_832816 - BLOCK
      ?auto_832817 - BLOCK
    )
    :vars
    (
      ?auto_832818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_832817 ?auto_832818 ) ( not ( = ?auto_832803 ?auto_832804 ) ) ( not ( = ?auto_832803 ?auto_832805 ) ) ( not ( = ?auto_832803 ?auto_832806 ) ) ( not ( = ?auto_832803 ?auto_832807 ) ) ( not ( = ?auto_832803 ?auto_832808 ) ) ( not ( = ?auto_832803 ?auto_832809 ) ) ( not ( = ?auto_832803 ?auto_832810 ) ) ( not ( = ?auto_832803 ?auto_832811 ) ) ( not ( = ?auto_832803 ?auto_832812 ) ) ( not ( = ?auto_832803 ?auto_832813 ) ) ( not ( = ?auto_832803 ?auto_832814 ) ) ( not ( = ?auto_832803 ?auto_832815 ) ) ( not ( = ?auto_832803 ?auto_832816 ) ) ( not ( = ?auto_832803 ?auto_832817 ) ) ( not ( = ?auto_832803 ?auto_832818 ) ) ( not ( = ?auto_832804 ?auto_832805 ) ) ( not ( = ?auto_832804 ?auto_832806 ) ) ( not ( = ?auto_832804 ?auto_832807 ) ) ( not ( = ?auto_832804 ?auto_832808 ) ) ( not ( = ?auto_832804 ?auto_832809 ) ) ( not ( = ?auto_832804 ?auto_832810 ) ) ( not ( = ?auto_832804 ?auto_832811 ) ) ( not ( = ?auto_832804 ?auto_832812 ) ) ( not ( = ?auto_832804 ?auto_832813 ) ) ( not ( = ?auto_832804 ?auto_832814 ) ) ( not ( = ?auto_832804 ?auto_832815 ) ) ( not ( = ?auto_832804 ?auto_832816 ) ) ( not ( = ?auto_832804 ?auto_832817 ) ) ( not ( = ?auto_832804 ?auto_832818 ) ) ( not ( = ?auto_832805 ?auto_832806 ) ) ( not ( = ?auto_832805 ?auto_832807 ) ) ( not ( = ?auto_832805 ?auto_832808 ) ) ( not ( = ?auto_832805 ?auto_832809 ) ) ( not ( = ?auto_832805 ?auto_832810 ) ) ( not ( = ?auto_832805 ?auto_832811 ) ) ( not ( = ?auto_832805 ?auto_832812 ) ) ( not ( = ?auto_832805 ?auto_832813 ) ) ( not ( = ?auto_832805 ?auto_832814 ) ) ( not ( = ?auto_832805 ?auto_832815 ) ) ( not ( = ?auto_832805 ?auto_832816 ) ) ( not ( = ?auto_832805 ?auto_832817 ) ) ( not ( = ?auto_832805 ?auto_832818 ) ) ( not ( = ?auto_832806 ?auto_832807 ) ) ( not ( = ?auto_832806 ?auto_832808 ) ) ( not ( = ?auto_832806 ?auto_832809 ) ) ( not ( = ?auto_832806 ?auto_832810 ) ) ( not ( = ?auto_832806 ?auto_832811 ) ) ( not ( = ?auto_832806 ?auto_832812 ) ) ( not ( = ?auto_832806 ?auto_832813 ) ) ( not ( = ?auto_832806 ?auto_832814 ) ) ( not ( = ?auto_832806 ?auto_832815 ) ) ( not ( = ?auto_832806 ?auto_832816 ) ) ( not ( = ?auto_832806 ?auto_832817 ) ) ( not ( = ?auto_832806 ?auto_832818 ) ) ( not ( = ?auto_832807 ?auto_832808 ) ) ( not ( = ?auto_832807 ?auto_832809 ) ) ( not ( = ?auto_832807 ?auto_832810 ) ) ( not ( = ?auto_832807 ?auto_832811 ) ) ( not ( = ?auto_832807 ?auto_832812 ) ) ( not ( = ?auto_832807 ?auto_832813 ) ) ( not ( = ?auto_832807 ?auto_832814 ) ) ( not ( = ?auto_832807 ?auto_832815 ) ) ( not ( = ?auto_832807 ?auto_832816 ) ) ( not ( = ?auto_832807 ?auto_832817 ) ) ( not ( = ?auto_832807 ?auto_832818 ) ) ( not ( = ?auto_832808 ?auto_832809 ) ) ( not ( = ?auto_832808 ?auto_832810 ) ) ( not ( = ?auto_832808 ?auto_832811 ) ) ( not ( = ?auto_832808 ?auto_832812 ) ) ( not ( = ?auto_832808 ?auto_832813 ) ) ( not ( = ?auto_832808 ?auto_832814 ) ) ( not ( = ?auto_832808 ?auto_832815 ) ) ( not ( = ?auto_832808 ?auto_832816 ) ) ( not ( = ?auto_832808 ?auto_832817 ) ) ( not ( = ?auto_832808 ?auto_832818 ) ) ( not ( = ?auto_832809 ?auto_832810 ) ) ( not ( = ?auto_832809 ?auto_832811 ) ) ( not ( = ?auto_832809 ?auto_832812 ) ) ( not ( = ?auto_832809 ?auto_832813 ) ) ( not ( = ?auto_832809 ?auto_832814 ) ) ( not ( = ?auto_832809 ?auto_832815 ) ) ( not ( = ?auto_832809 ?auto_832816 ) ) ( not ( = ?auto_832809 ?auto_832817 ) ) ( not ( = ?auto_832809 ?auto_832818 ) ) ( not ( = ?auto_832810 ?auto_832811 ) ) ( not ( = ?auto_832810 ?auto_832812 ) ) ( not ( = ?auto_832810 ?auto_832813 ) ) ( not ( = ?auto_832810 ?auto_832814 ) ) ( not ( = ?auto_832810 ?auto_832815 ) ) ( not ( = ?auto_832810 ?auto_832816 ) ) ( not ( = ?auto_832810 ?auto_832817 ) ) ( not ( = ?auto_832810 ?auto_832818 ) ) ( not ( = ?auto_832811 ?auto_832812 ) ) ( not ( = ?auto_832811 ?auto_832813 ) ) ( not ( = ?auto_832811 ?auto_832814 ) ) ( not ( = ?auto_832811 ?auto_832815 ) ) ( not ( = ?auto_832811 ?auto_832816 ) ) ( not ( = ?auto_832811 ?auto_832817 ) ) ( not ( = ?auto_832811 ?auto_832818 ) ) ( not ( = ?auto_832812 ?auto_832813 ) ) ( not ( = ?auto_832812 ?auto_832814 ) ) ( not ( = ?auto_832812 ?auto_832815 ) ) ( not ( = ?auto_832812 ?auto_832816 ) ) ( not ( = ?auto_832812 ?auto_832817 ) ) ( not ( = ?auto_832812 ?auto_832818 ) ) ( not ( = ?auto_832813 ?auto_832814 ) ) ( not ( = ?auto_832813 ?auto_832815 ) ) ( not ( = ?auto_832813 ?auto_832816 ) ) ( not ( = ?auto_832813 ?auto_832817 ) ) ( not ( = ?auto_832813 ?auto_832818 ) ) ( not ( = ?auto_832814 ?auto_832815 ) ) ( not ( = ?auto_832814 ?auto_832816 ) ) ( not ( = ?auto_832814 ?auto_832817 ) ) ( not ( = ?auto_832814 ?auto_832818 ) ) ( not ( = ?auto_832815 ?auto_832816 ) ) ( not ( = ?auto_832815 ?auto_832817 ) ) ( not ( = ?auto_832815 ?auto_832818 ) ) ( not ( = ?auto_832816 ?auto_832817 ) ) ( not ( = ?auto_832816 ?auto_832818 ) ) ( not ( = ?auto_832817 ?auto_832818 ) ) ( ON ?auto_832816 ?auto_832817 ) ( ON ?auto_832815 ?auto_832816 ) ( ON ?auto_832814 ?auto_832815 ) ( ON ?auto_832813 ?auto_832814 ) ( ON ?auto_832812 ?auto_832813 ) ( ON ?auto_832811 ?auto_832812 ) ( ON ?auto_832810 ?auto_832811 ) ( ON ?auto_832809 ?auto_832810 ) ( ON ?auto_832808 ?auto_832809 ) ( ON ?auto_832807 ?auto_832808 ) ( ON ?auto_832806 ?auto_832807 ) ( ON ?auto_832805 ?auto_832806 ) ( ON ?auto_832804 ?auto_832805 ) ( ON ?auto_832803 ?auto_832804 ) ( CLEAR ?auto_832803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_832803 )
      ( MAKE-15PILE ?auto_832803 ?auto_832804 ?auto_832805 ?auto_832806 ?auto_832807 ?auto_832808 ?auto_832809 ?auto_832810 ?auto_832811 ?auto_832812 ?auto_832813 ?auto_832814 ?auto_832815 ?auto_832816 ?auto_832817 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_832866 - BLOCK
      ?auto_832867 - BLOCK
      ?auto_832868 - BLOCK
      ?auto_832869 - BLOCK
      ?auto_832870 - BLOCK
      ?auto_832871 - BLOCK
      ?auto_832872 - BLOCK
      ?auto_832873 - BLOCK
      ?auto_832874 - BLOCK
      ?auto_832875 - BLOCK
      ?auto_832876 - BLOCK
      ?auto_832877 - BLOCK
      ?auto_832878 - BLOCK
      ?auto_832879 - BLOCK
      ?auto_832880 - BLOCK
      ?auto_832881 - BLOCK
    )
    :vars
    (
      ?auto_832882 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_832880 ) ( ON ?auto_832881 ?auto_832882 ) ( CLEAR ?auto_832881 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_832866 ) ( ON ?auto_832867 ?auto_832866 ) ( ON ?auto_832868 ?auto_832867 ) ( ON ?auto_832869 ?auto_832868 ) ( ON ?auto_832870 ?auto_832869 ) ( ON ?auto_832871 ?auto_832870 ) ( ON ?auto_832872 ?auto_832871 ) ( ON ?auto_832873 ?auto_832872 ) ( ON ?auto_832874 ?auto_832873 ) ( ON ?auto_832875 ?auto_832874 ) ( ON ?auto_832876 ?auto_832875 ) ( ON ?auto_832877 ?auto_832876 ) ( ON ?auto_832878 ?auto_832877 ) ( ON ?auto_832879 ?auto_832878 ) ( ON ?auto_832880 ?auto_832879 ) ( not ( = ?auto_832866 ?auto_832867 ) ) ( not ( = ?auto_832866 ?auto_832868 ) ) ( not ( = ?auto_832866 ?auto_832869 ) ) ( not ( = ?auto_832866 ?auto_832870 ) ) ( not ( = ?auto_832866 ?auto_832871 ) ) ( not ( = ?auto_832866 ?auto_832872 ) ) ( not ( = ?auto_832866 ?auto_832873 ) ) ( not ( = ?auto_832866 ?auto_832874 ) ) ( not ( = ?auto_832866 ?auto_832875 ) ) ( not ( = ?auto_832866 ?auto_832876 ) ) ( not ( = ?auto_832866 ?auto_832877 ) ) ( not ( = ?auto_832866 ?auto_832878 ) ) ( not ( = ?auto_832866 ?auto_832879 ) ) ( not ( = ?auto_832866 ?auto_832880 ) ) ( not ( = ?auto_832866 ?auto_832881 ) ) ( not ( = ?auto_832866 ?auto_832882 ) ) ( not ( = ?auto_832867 ?auto_832868 ) ) ( not ( = ?auto_832867 ?auto_832869 ) ) ( not ( = ?auto_832867 ?auto_832870 ) ) ( not ( = ?auto_832867 ?auto_832871 ) ) ( not ( = ?auto_832867 ?auto_832872 ) ) ( not ( = ?auto_832867 ?auto_832873 ) ) ( not ( = ?auto_832867 ?auto_832874 ) ) ( not ( = ?auto_832867 ?auto_832875 ) ) ( not ( = ?auto_832867 ?auto_832876 ) ) ( not ( = ?auto_832867 ?auto_832877 ) ) ( not ( = ?auto_832867 ?auto_832878 ) ) ( not ( = ?auto_832867 ?auto_832879 ) ) ( not ( = ?auto_832867 ?auto_832880 ) ) ( not ( = ?auto_832867 ?auto_832881 ) ) ( not ( = ?auto_832867 ?auto_832882 ) ) ( not ( = ?auto_832868 ?auto_832869 ) ) ( not ( = ?auto_832868 ?auto_832870 ) ) ( not ( = ?auto_832868 ?auto_832871 ) ) ( not ( = ?auto_832868 ?auto_832872 ) ) ( not ( = ?auto_832868 ?auto_832873 ) ) ( not ( = ?auto_832868 ?auto_832874 ) ) ( not ( = ?auto_832868 ?auto_832875 ) ) ( not ( = ?auto_832868 ?auto_832876 ) ) ( not ( = ?auto_832868 ?auto_832877 ) ) ( not ( = ?auto_832868 ?auto_832878 ) ) ( not ( = ?auto_832868 ?auto_832879 ) ) ( not ( = ?auto_832868 ?auto_832880 ) ) ( not ( = ?auto_832868 ?auto_832881 ) ) ( not ( = ?auto_832868 ?auto_832882 ) ) ( not ( = ?auto_832869 ?auto_832870 ) ) ( not ( = ?auto_832869 ?auto_832871 ) ) ( not ( = ?auto_832869 ?auto_832872 ) ) ( not ( = ?auto_832869 ?auto_832873 ) ) ( not ( = ?auto_832869 ?auto_832874 ) ) ( not ( = ?auto_832869 ?auto_832875 ) ) ( not ( = ?auto_832869 ?auto_832876 ) ) ( not ( = ?auto_832869 ?auto_832877 ) ) ( not ( = ?auto_832869 ?auto_832878 ) ) ( not ( = ?auto_832869 ?auto_832879 ) ) ( not ( = ?auto_832869 ?auto_832880 ) ) ( not ( = ?auto_832869 ?auto_832881 ) ) ( not ( = ?auto_832869 ?auto_832882 ) ) ( not ( = ?auto_832870 ?auto_832871 ) ) ( not ( = ?auto_832870 ?auto_832872 ) ) ( not ( = ?auto_832870 ?auto_832873 ) ) ( not ( = ?auto_832870 ?auto_832874 ) ) ( not ( = ?auto_832870 ?auto_832875 ) ) ( not ( = ?auto_832870 ?auto_832876 ) ) ( not ( = ?auto_832870 ?auto_832877 ) ) ( not ( = ?auto_832870 ?auto_832878 ) ) ( not ( = ?auto_832870 ?auto_832879 ) ) ( not ( = ?auto_832870 ?auto_832880 ) ) ( not ( = ?auto_832870 ?auto_832881 ) ) ( not ( = ?auto_832870 ?auto_832882 ) ) ( not ( = ?auto_832871 ?auto_832872 ) ) ( not ( = ?auto_832871 ?auto_832873 ) ) ( not ( = ?auto_832871 ?auto_832874 ) ) ( not ( = ?auto_832871 ?auto_832875 ) ) ( not ( = ?auto_832871 ?auto_832876 ) ) ( not ( = ?auto_832871 ?auto_832877 ) ) ( not ( = ?auto_832871 ?auto_832878 ) ) ( not ( = ?auto_832871 ?auto_832879 ) ) ( not ( = ?auto_832871 ?auto_832880 ) ) ( not ( = ?auto_832871 ?auto_832881 ) ) ( not ( = ?auto_832871 ?auto_832882 ) ) ( not ( = ?auto_832872 ?auto_832873 ) ) ( not ( = ?auto_832872 ?auto_832874 ) ) ( not ( = ?auto_832872 ?auto_832875 ) ) ( not ( = ?auto_832872 ?auto_832876 ) ) ( not ( = ?auto_832872 ?auto_832877 ) ) ( not ( = ?auto_832872 ?auto_832878 ) ) ( not ( = ?auto_832872 ?auto_832879 ) ) ( not ( = ?auto_832872 ?auto_832880 ) ) ( not ( = ?auto_832872 ?auto_832881 ) ) ( not ( = ?auto_832872 ?auto_832882 ) ) ( not ( = ?auto_832873 ?auto_832874 ) ) ( not ( = ?auto_832873 ?auto_832875 ) ) ( not ( = ?auto_832873 ?auto_832876 ) ) ( not ( = ?auto_832873 ?auto_832877 ) ) ( not ( = ?auto_832873 ?auto_832878 ) ) ( not ( = ?auto_832873 ?auto_832879 ) ) ( not ( = ?auto_832873 ?auto_832880 ) ) ( not ( = ?auto_832873 ?auto_832881 ) ) ( not ( = ?auto_832873 ?auto_832882 ) ) ( not ( = ?auto_832874 ?auto_832875 ) ) ( not ( = ?auto_832874 ?auto_832876 ) ) ( not ( = ?auto_832874 ?auto_832877 ) ) ( not ( = ?auto_832874 ?auto_832878 ) ) ( not ( = ?auto_832874 ?auto_832879 ) ) ( not ( = ?auto_832874 ?auto_832880 ) ) ( not ( = ?auto_832874 ?auto_832881 ) ) ( not ( = ?auto_832874 ?auto_832882 ) ) ( not ( = ?auto_832875 ?auto_832876 ) ) ( not ( = ?auto_832875 ?auto_832877 ) ) ( not ( = ?auto_832875 ?auto_832878 ) ) ( not ( = ?auto_832875 ?auto_832879 ) ) ( not ( = ?auto_832875 ?auto_832880 ) ) ( not ( = ?auto_832875 ?auto_832881 ) ) ( not ( = ?auto_832875 ?auto_832882 ) ) ( not ( = ?auto_832876 ?auto_832877 ) ) ( not ( = ?auto_832876 ?auto_832878 ) ) ( not ( = ?auto_832876 ?auto_832879 ) ) ( not ( = ?auto_832876 ?auto_832880 ) ) ( not ( = ?auto_832876 ?auto_832881 ) ) ( not ( = ?auto_832876 ?auto_832882 ) ) ( not ( = ?auto_832877 ?auto_832878 ) ) ( not ( = ?auto_832877 ?auto_832879 ) ) ( not ( = ?auto_832877 ?auto_832880 ) ) ( not ( = ?auto_832877 ?auto_832881 ) ) ( not ( = ?auto_832877 ?auto_832882 ) ) ( not ( = ?auto_832878 ?auto_832879 ) ) ( not ( = ?auto_832878 ?auto_832880 ) ) ( not ( = ?auto_832878 ?auto_832881 ) ) ( not ( = ?auto_832878 ?auto_832882 ) ) ( not ( = ?auto_832879 ?auto_832880 ) ) ( not ( = ?auto_832879 ?auto_832881 ) ) ( not ( = ?auto_832879 ?auto_832882 ) ) ( not ( = ?auto_832880 ?auto_832881 ) ) ( not ( = ?auto_832880 ?auto_832882 ) ) ( not ( = ?auto_832881 ?auto_832882 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_832881 ?auto_832882 )
      ( !STACK ?auto_832881 ?auto_832880 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_832932 - BLOCK
      ?auto_832933 - BLOCK
      ?auto_832934 - BLOCK
      ?auto_832935 - BLOCK
      ?auto_832936 - BLOCK
      ?auto_832937 - BLOCK
      ?auto_832938 - BLOCK
      ?auto_832939 - BLOCK
      ?auto_832940 - BLOCK
      ?auto_832941 - BLOCK
      ?auto_832942 - BLOCK
      ?auto_832943 - BLOCK
      ?auto_832944 - BLOCK
      ?auto_832945 - BLOCK
      ?auto_832946 - BLOCK
      ?auto_832947 - BLOCK
    )
    :vars
    (
      ?auto_832948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_832947 ?auto_832948 ) ( ON-TABLE ?auto_832932 ) ( ON ?auto_832933 ?auto_832932 ) ( ON ?auto_832934 ?auto_832933 ) ( ON ?auto_832935 ?auto_832934 ) ( ON ?auto_832936 ?auto_832935 ) ( ON ?auto_832937 ?auto_832936 ) ( ON ?auto_832938 ?auto_832937 ) ( ON ?auto_832939 ?auto_832938 ) ( ON ?auto_832940 ?auto_832939 ) ( ON ?auto_832941 ?auto_832940 ) ( ON ?auto_832942 ?auto_832941 ) ( ON ?auto_832943 ?auto_832942 ) ( ON ?auto_832944 ?auto_832943 ) ( ON ?auto_832945 ?auto_832944 ) ( not ( = ?auto_832932 ?auto_832933 ) ) ( not ( = ?auto_832932 ?auto_832934 ) ) ( not ( = ?auto_832932 ?auto_832935 ) ) ( not ( = ?auto_832932 ?auto_832936 ) ) ( not ( = ?auto_832932 ?auto_832937 ) ) ( not ( = ?auto_832932 ?auto_832938 ) ) ( not ( = ?auto_832932 ?auto_832939 ) ) ( not ( = ?auto_832932 ?auto_832940 ) ) ( not ( = ?auto_832932 ?auto_832941 ) ) ( not ( = ?auto_832932 ?auto_832942 ) ) ( not ( = ?auto_832932 ?auto_832943 ) ) ( not ( = ?auto_832932 ?auto_832944 ) ) ( not ( = ?auto_832932 ?auto_832945 ) ) ( not ( = ?auto_832932 ?auto_832946 ) ) ( not ( = ?auto_832932 ?auto_832947 ) ) ( not ( = ?auto_832932 ?auto_832948 ) ) ( not ( = ?auto_832933 ?auto_832934 ) ) ( not ( = ?auto_832933 ?auto_832935 ) ) ( not ( = ?auto_832933 ?auto_832936 ) ) ( not ( = ?auto_832933 ?auto_832937 ) ) ( not ( = ?auto_832933 ?auto_832938 ) ) ( not ( = ?auto_832933 ?auto_832939 ) ) ( not ( = ?auto_832933 ?auto_832940 ) ) ( not ( = ?auto_832933 ?auto_832941 ) ) ( not ( = ?auto_832933 ?auto_832942 ) ) ( not ( = ?auto_832933 ?auto_832943 ) ) ( not ( = ?auto_832933 ?auto_832944 ) ) ( not ( = ?auto_832933 ?auto_832945 ) ) ( not ( = ?auto_832933 ?auto_832946 ) ) ( not ( = ?auto_832933 ?auto_832947 ) ) ( not ( = ?auto_832933 ?auto_832948 ) ) ( not ( = ?auto_832934 ?auto_832935 ) ) ( not ( = ?auto_832934 ?auto_832936 ) ) ( not ( = ?auto_832934 ?auto_832937 ) ) ( not ( = ?auto_832934 ?auto_832938 ) ) ( not ( = ?auto_832934 ?auto_832939 ) ) ( not ( = ?auto_832934 ?auto_832940 ) ) ( not ( = ?auto_832934 ?auto_832941 ) ) ( not ( = ?auto_832934 ?auto_832942 ) ) ( not ( = ?auto_832934 ?auto_832943 ) ) ( not ( = ?auto_832934 ?auto_832944 ) ) ( not ( = ?auto_832934 ?auto_832945 ) ) ( not ( = ?auto_832934 ?auto_832946 ) ) ( not ( = ?auto_832934 ?auto_832947 ) ) ( not ( = ?auto_832934 ?auto_832948 ) ) ( not ( = ?auto_832935 ?auto_832936 ) ) ( not ( = ?auto_832935 ?auto_832937 ) ) ( not ( = ?auto_832935 ?auto_832938 ) ) ( not ( = ?auto_832935 ?auto_832939 ) ) ( not ( = ?auto_832935 ?auto_832940 ) ) ( not ( = ?auto_832935 ?auto_832941 ) ) ( not ( = ?auto_832935 ?auto_832942 ) ) ( not ( = ?auto_832935 ?auto_832943 ) ) ( not ( = ?auto_832935 ?auto_832944 ) ) ( not ( = ?auto_832935 ?auto_832945 ) ) ( not ( = ?auto_832935 ?auto_832946 ) ) ( not ( = ?auto_832935 ?auto_832947 ) ) ( not ( = ?auto_832935 ?auto_832948 ) ) ( not ( = ?auto_832936 ?auto_832937 ) ) ( not ( = ?auto_832936 ?auto_832938 ) ) ( not ( = ?auto_832936 ?auto_832939 ) ) ( not ( = ?auto_832936 ?auto_832940 ) ) ( not ( = ?auto_832936 ?auto_832941 ) ) ( not ( = ?auto_832936 ?auto_832942 ) ) ( not ( = ?auto_832936 ?auto_832943 ) ) ( not ( = ?auto_832936 ?auto_832944 ) ) ( not ( = ?auto_832936 ?auto_832945 ) ) ( not ( = ?auto_832936 ?auto_832946 ) ) ( not ( = ?auto_832936 ?auto_832947 ) ) ( not ( = ?auto_832936 ?auto_832948 ) ) ( not ( = ?auto_832937 ?auto_832938 ) ) ( not ( = ?auto_832937 ?auto_832939 ) ) ( not ( = ?auto_832937 ?auto_832940 ) ) ( not ( = ?auto_832937 ?auto_832941 ) ) ( not ( = ?auto_832937 ?auto_832942 ) ) ( not ( = ?auto_832937 ?auto_832943 ) ) ( not ( = ?auto_832937 ?auto_832944 ) ) ( not ( = ?auto_832937 ?auto_832945 ) ) ( not ( = ?auto_832937 ?auto_832946 ) ) ( not ( = ?auto_832937 ?auto_832947 ) ) ( not ( = ?auto_832937 ?auto_832948 ) ) ( not ( = ?auto_832938 ?auto_832939 ) ) ( not ( = ?auto_832938 ?auto_832940 ) ) ( not ( = ?auto_832938 ?auto_832941 ) ) ( not ( = ?auto_832938 ?auto_832942 ) ) ( not ( = ?auto_832938 ?auto_832943 ) ) ( not ( = ?auto_832938 ?auto_832944 ) ) ( not ( = ?auto_832938 ?auto_832945 ) ) ( not ( = ?auto_832938 ?auto_832946 ) ) ( not ( = ?auto_832938 ?auto_832947 ) ) ( not ( = ?auto_832938 ?auto_832948 ) ) ( not ( = ?auto_832939 ?auto_832940 ) ) ( not ( = ?auto_832939 ?auto_832941 ) ) ( not ( = ?auto_832939 ?auto_832942 ) ) ( not ( = ?auto_832939 ?auto_832943 ) ) ( not ( = ?auto_832939 ?auto_832944 ) ) ( not ( = ?auto_832939 ?auto_832945 ) ) ( not ( = ?auto_832939 ?auto_832946 ) ) ( not ( = ?auto_832939 ?auto_832947 ) ) ( not ( = ?auto_832939 ?auto_832948 ) ) ( not ( = ?auto_832940 ?auto_832941 ) ) ( not ( = ?auto_832940 ?auto_832942 ) ) ( not ( = ?auto_832940 ?auto_832943 ) ) ( not ( = ?auto_832940 ?auto_832944 ) ) ( not ( = ?auto_832940 ?auto_832945 ) ) ( not ( = ?auto_832940 ?auto_832946 ) ) ( not ( = ?auto_832940 ?auto_832947 ) ) ( not ( = ?auto_832940 ?auto_832948 ) ) ( not ( = ?auto_832941 ?auto_832942 ) ) ( not ( = ?auto_832941 ?auto_832943 ) ) ( not ( = ?auto_832941 ?auto_832944 ) ) ( not ( = ?auto_832941 ?auto_832945 ) ) ( not ( = ?auto_832941 ?auto_832946 ) ) ( not ( = ?auto_832941 ?auto_832947 ) ) ( not ( = ?auto_832941 ?auto_832948 ) ) ( not ( = ?auto_832942 ?auto_832943 ) ) ( not ( = ?auto_832942 ?auto_832944 ) ) ( not ( = ?auto_832942 ?auto_832945 ) ) ( not ( = ?auto_832942 ?auto_832946 ) ) ( not ( = ?auto_832942 ?auto_832947 ) ) ( not ( = ?auto_832942 ?auto_832948 ) ) ( not ( = ?auto_832943 ?auto_832944 ) ) ( not ( = ?auto_832943 ?auto_832945 ) ) ( not ( = ?auto_832943 ?auto_832946 ) ) ( not ( = ?auto_832943 ?auto_832947 ) ) ( not ( = ?auto_832943 ?auto_832948 ) ) ( not ( = ?auto_832944 ?auto_832945 ) ) ( not ( = ?auto_832944 ?auto_832946 ) ) ( not ( = ?auto_832944 ?auto_832947 ) ) ( not ( = ?auto_832944 ?auto_832948 ) ) ( not ( = ?auto_832945 ?auto_832946 ) ) ( not ( = ?auto_832945 ?auto_832947 ) ) ( not ( = ?auto_832945 ?auto_832948 ) ) ( not ( = ?auto_832946 ?auto_832947 ) ) ( not ( = ?auto_832946 ?auto_832948 ) ) ( not ( = ?auto_832947 ?auto_832948 ) ) ( CLEAR ?auto_832945 ) ( ON ?auto_832946 ?auto_832947 ) ( CLEAR ?auto_832946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_832932 ?auto_832933 ?auto_832934 ?auto_832935 ?auto_832936 ?auto_832937 ?auto_832938 ?auto_832939 ?auto_832940 ?auto_832941 ?auto_832942 ?auto_832943 ?auto_832944 ?auto_832945 ?auto_832946 )
      ( MAKE-16PILE ?auto_832932 ?auto_832933 ?auto_832934 ?auto_832935 ?auto_832936 ?auto_832937 ?auto_832938 ?auto_832939 ?auto_832940 ?auto_832941 ?auto_832942 ?auto_832943 ?auto_832944 ?auto_832945 ?auto_832946 ?auto_832947 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_832998 - BLOCK
      ?auto_832999 - BLOCK
      ?auto_833000 - BLOCK
      ?auto_833001 - BLOCK
      ?auto_833002 - BLOCK
      ?auto_833003 - BLOCK
      ?auto_833004 - BLOCK
      ?auto_833005 - BLOCK
      ?auto_833006 - BLOCK
      ?auto_833007 - BLOCK
      ?auto_833008 - BLOCK
      ?auto_833009 - BLOCK
      ?auto_833010 - BLOCK
      ?auto_833011 - BLOCK
      ?auto_833012 - BLOCK
      ?auto_833013 - BLOCK
    )
    :vars
    (
      ?auto_833014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_833013 ?auto_833014 ) ( ON-TABLE ?auto_832998 ) ( ON ?auto_832999 ?auto_832998 ) ( ON ?auto_833000 ?auto_832999 ) ( ON ?auto_833001 ?auto_833000 ) ( ON ?auto_833002 ?auto_833001 ) ( ON ?auto_833003 ?auto_833002 ) ( ON ?auto_833004 ?auto_833003 ) ( ON ?auto_833005 ?auto_833004 ) ( ON ?auto_833006 ?auto_833005 ) ( ON ?auto_833007 ?auto_833006 ) ( ON ?auto_833008 ?auto_833007 ) ( ON ?auto_833009 ?auto_833008 ) ( ON ?auto_833010 ?auto_833009 ) ( not ( = ?auto_832998 ?auto_832999 ) ) ( not ( = ?auto_832998 ?auto_833000 ) ) ( not ( = ?auto_832998 ?auto_833001 ) ) ( not ( = ?auto_832998 ?auto_833002 ) ) ( not ( = ?auto_832998 ?auto_833003 ) ) ( not ( = ?auto_832998 ?auto_833004 ) ) ( not ( = ?auto_832998 ?auto_833005 ) ) ( not ( = ?auto_832998 ?auto_833006 ) ) ( not ( = ?auto_832998 ?auto_833007 ) ) ( not ( = ?auto_832998 ?auto_833008 ) ) ( not ( = ?auto_832998 ?auto_833009 ) ) ( not ( = ?auto_832998 ?auto_833010 ) ) ( not ( = ?auto_832998 ?auto_833011 ) ) ( not ( = ?auto_832998 ?auto_833012 ) ) ( not ( = ?auto_832998 ?auto_833013 ) ) ( not ( = ?auto_832998 ?auto_833014 ) ) ( not ( = ?auto_832999 ?auto_833000 ) ) ( not ( = ?auto_832999 ?auto_833001 ) ) ( not ( = ?auto_832999 ?auto_833002 ) ) ( not ( = ?auto_832999 ?auto_833003 ) ) ( not ( = ?auto_832999 ?auto_833004 ) ) ( not ( = ?auto_832999 ?auto_833005 ) ) ( not ( = ?auto_832999 ?auto_833006 ) ) ( not ( = ?auto_832999 ?auto_833007 ) ) ( not ( = ?auto_832999 ?auto_833008 ) ) ( not ( = ?auto_832999 ?auto_833009 ) ) ( not ( = ?auto_832999 ?auto_833010 ) ) ( not ( = ?auto_832999 ?auto_833011 ) ) ( not ( = ?auto_832999 ?auto_833012 ) ) ( not ( = ?auto_832999 ?auto_833013 ) ) ( not ( = ?auto_832999 ?auto_833014 ) ) ( not ( = ?auto_833000 ?auto_833001 ) ) ( not ( = ?auto_833000 ?auto_833002 ) ) ( not ( = ?auto_833000 ?auto_833003 ) ) ( not ( = ?auto_833000 ?auto_833004 ) ) ( not ( = ?auto_833000 ?auto_833005 ) ) ( not ( = ?auto_833000 ?auto_833006 ) ) ( not ( = ?auto_833000 ?auto_833007 ) ) ( not ( = ?auto_833000 ?auto_833008 ) ) ( not ( = ?auto_833000 ?auto_833009 ) ) ( not ( = ?auto_833000 ?auto_833010 ) ) ( not ( = ?auto_833000 ?auto_833011 ) ) ( not ( = ?auto_833000 ?auto_833012 ) ) ( not ( = ?auto_833000 ?auto_833013 ) ) ( not ( = ?auto_833000 ?auto_833014 ) ) ( not ( = ?auto_833001 ?auto_833002 ) ) ( not ( = ?auto_833001 ?auto_833003 ) ) ( not ( = ?auto_833001 ?auto_833004 ) ) ( not ( = ?auto_833001 ?auto_833005 ) ) ( not ( = ?auto_833001 ?auto_833006 ) ) ( not ( = ?auto_833001 ?auto_833007 ) ) ( not ( = ?auto_833001 ?auto_833008 ) ) ( not ( = ?auto_833001 ?auto_833009 ) ) ( not ( = ?auto_833001 ?auto_833010 ) ) ( not ( = ?auto_833001 ?auto_833011 ) ) ( not ( = ?auto_833001 ?auto_833012 ) ) ( not ( = ?auto_833001 ?auto_833013 ) ) ( not ( = ?auto_833001 ?auto_833014 ) ) ( not ( = ?auto_833002 ?auto_833003 ) ) ( not ( = ?auto_833002 ?auto_833004 ) ) ( not ( = ?auto_833002 ?auto_833005 ) ) ( not ( = ?auto_833002 ?auto_833006 ) ) ( not ( = ?auto_833002 ?auto_833007 ) ) ( not ( = ?auto_833002 ?auto_833008 ) ) ( not ( = ?auto_833002 ?auto_833009 ) ) ( not ( = ?auto_833002 ?auto_833010 ) ) ( not ( = ?auto_833002 ?auto_833011 ) ) ( not ( = ?auto_833002 ?auto_833012 ) ) ( not ( = ?auto_833002 ?auto_833013 ) ) ( not ( = ?auto_833002 ?auto_833014 ) ) ( not ( = ?auto_833003 ?auto_833004 ) ) ( not ( = ?auto_833003 ?auto_833005 ) ) ( not ( = ?auto_833003 ?auto_833006 ) ) ( not ( = ?auto_833003 ?auto_833007 ) ) ( not ( = ?auto_833003 ?auto_833008 ) ) ( not ( = ?auto_833003 ?auto_833009 ) ) ( not ( = ?auto_833003 ?auto_833010 ) ) ( not ( = ?auto_833003 ?auto_833011 ) ) ( not ( = ?auto_833003 ?auto_833012 ) ) ( not ( = ?auto_833003 ?auto_833013 ) ) ( not ( = ?auto_833003 ?auto_833014 ) ) ( not ( = ?auto_833004 ?auto_833005 ) ) ( not ( = ?auto_833004 ?auto_833006 ) ) ( not ( = ?auto_833004 ?auto_833007 ) ) ( not ( = ?auto_833004 ?auto_833008 ) ) ( not ( = ?auto_833004 ?auto_833009 ) ) ( not ( = ?auto_833004 ?auto_833010 ) ) ( not ( = ?auto_833004 ?auto_833011 ) ) ( not ( = ?auto_833004 ?auto_833012 ) ) ( not ( = ?auto_833004 ?auto_833013 ) ) ( not ( = ?auto_833004 ?auto_833014 ) ) ( not ( = ?auto_833005 ?auto_833006 ) ) ( not ( = ?auto_833005 ?auto_833007 ) ) ( not ( = ?auto_833005 ?auto_833008 ) ) ( not ( = ?auto_833005 ?auto_833009 ) ) ( not ( = ?auto_833005 ?auto_833010 ) ) ( not ( = ?auto_833005 ?auto_833011 ) ) ( not ( = ?auto_833005 ?auto_833012 ) ) ( not ( = ?auto_833005 ?auto_833013 ) ) ( not ( = ?auto_833005 ?auto_833014 ) ) ( not ( = ?auto_833006 ?auto_833007 ) ) ( not ( = ?auto_833006 ?auto_833008 ) ) ( not ( = ?auto_833006 ?auto_833009 ) ) ( not ( = ?auto_833006 ?auto_833010 ) ) ( not ( = ?auto_833006 ?auto_833011 ) ) ( not ( = ?auto_833006 ?auto_833012 ) ) ( not ( = ?auto_833006 ?auto_833013 ) ) ( not ( = ?auto_833006 ?auto_833014 ) ) ( not ( = ?auto_833007 ?auto_833008 ) ) ( not ( = ?auto_833007 ?auto_833009 ) ) ( not ( = ?auto_833007 ?auto_833010 ) ) ( not ( = ?auto_833007 ?auto_833011 ) ) ( not ( = ?auto_833007 ?auto_833012 ) ) ( not ( = ?auto_833007 ?auto_833013 ) ) ( not ( = ?auto_833007 ?auto_833014 ) ) ( not ( = ?auto_833008 ?auto_833009 ) ) ( not ( = ?auto_833008 ?auto_833010 ) ) ( not ( = ?auto_833008 ?auto_833011 ) ) ( not ( = ?auto_833008 ?auto_833012 ) ) ( not ( = ?auto_833008 ?auto_833013 ) ) ( not ( = ?auto_833008 ?auto_833014 ) ) ( not ( = ?auto_833009 ?auto_833010 ) ) ( not ( = ?auto_833009 ?auto_833011 ) ) ( not ( = ?auto_833009 ?auto_833012 ) ) ( not ( = ?auto_833009 ?auto_833013 ) ) ( not ( = ?auto_833009 ?auto_833014 ) ) ( not ( = ?auto_833010 ?auto_833011 ) ) ( not ( = ?auto_833010 ?auto_833012 ) ) ( not ( = ?auto_833010 ?auto_833013 ) ) ( not ( = ?auto_833010 ?auto_833014 ) ) ( not ( = ?auto_833011 ?auto_833012 ) ) ( not ( = ?auto_833011 ?auto_833013 ) ) ( not ( = ?auto_833011 ?auto_833014 ) ) ( not ( = ?auto_833012 ?auto_833013 ) ) ( not ( = ?auto_833012 ?auto_833014 ) ) ( not ( = ?auto_833013 ?auto_833014 ) ) ( ON ?auto_833012 ?auto_833013 ) ( CLEAR ?auto_833010 ) ( ON ?auto_833011 ?auto_833012 ) ( CLEAR ?auto_833011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_832998 ?auto_832999 ?auto_833000 ?auto_833001 ?auto_833002 ?auto_833003 ?auto_833004 ?auto_833005 ?auto_833006 ?auto_833007 ?auto_833008 ?auto_833009 ?auto_833010 ?auto_833011 )
      ( MAKE-16PILE ?auto_832998 ?auto_832999 ?auto_833000 ?auto_833001 ?auto_833002 ?auto_833003 ?auto_833004 ?auto_833005 ?auto_833006 ?auto_833007 ?auto_833008 ?auto_833009 ?auto_833010 ?auto_833011 ?auto_833012 ?auto_833013 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_833064 - BLOCK
      ?auto_833065 - BLOCK
      ?auto_833066 - BLOCK
      ?auto_833067 - BLOCK
      ?auto_833068 - BLOCK
      ?auto_833069 - BLOCK
      ?auto_833070 - BLOCK
      ?auto_833071 - BLOCK
      ?auto_833072 - BLOCK
      ?auto_833073 - BLOCK
      ?auto_833074 - BLOCK
      ?auto_833075 - BLOCK
      ?auto_833076 - BLOCK
      ?auto_833077 - BLOCK
      ?auto_833078 - BLOCK
      ?auto_833079 - BLOCK
    )
    :vars
    (
      ?auto_833080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_833079 ?auto_833080 ) ( ON-TABLE ?auto_833064 ) ( ON ?auto_833065 ?auto_833064 ) ( ON ?auto_833066 ?auto_833065 ) ( ON ?auto_833067 ?auto_833066 ) ( ON ?auto_833068 ?auto_833067 ) ( ON ?auto_833069 ?auto_833068 ) ( ON ?auto_833070 ?auto_833069 ) ( ON ?auto_833071 ?auto_833070 ) ( ON ?auto_833072 ?auto_833071 ) ( ON ?auto_833073 ?auto_833072 ) ( ON ?auto_833074 ?auto_833073 ) ( ON ?auto_833075 ?auto_833074 ) ( not ( = ?auto_833064 ?auto_833065 ) ) ( not ( = ?auto_833064 ?auto_833066 ) ) ( not ( = ?auto_833064 ?auto_833067 ) ) ( not ( = ?auto_833064 ?auto_833068 ) ) ( not ( = ?auto_833064 ?auto_833069 ) ) ( not ( = ?auto_833064 ?auto_833070 ) ) ( not ( = ?auto_833064 ?auto_833071 ) ) ( not ( = ?auto_833064 ?auto_833072 ) ) ( not ( = ?auto_833064 ?auto_833073 ) ) ( not ( = ?auto_833064 ?auto_833074 ) ) ( not ( = ?auto_833064 ?auto_833075 ) ) ( not ( = ?auto_833064 ?auto_833076 ) ) ( not ( = ?auto_833064 ?auto_833077 ) ) ( not ( = ?auto_833064 ?auto_833078 ) ) ( not ( = ?auto_833064 ?auto_833079 ) ) ( not ( = ?auto_833064 ?auto_833080 ) ) ( not ( = ?auto_833065 ?auto_833066 ) ) ( not ( = ?auto_833065 ?auto_833067 ) ) ( not ( = ?auto_833065 ?auto_833068 ) ) ( not ( = ?auto_833065 ?auto_833069 ) ) ( not ( = ?auto_833065 ?auto_833070 ) ) ( not ( = ?auto_833065 ?auto_833071 ) ) ( not ( = ?auto_833065 ?auto_833072 ) ) ( not ( = ?auto_833065 ?auto_833073 ) ) ( not ( = ?auto_833065 ?auto_833074 ) ) ( not ( = ?auto_833065 ?auto_833075 ) ) ( not ( = ?auto_833065 ?auto_833076 ) ) ( not ( = ?auto_833065 ?auto_833077 ) ) ( not ( = ?auto_833065 ?auto_833078 ) ) ( not ( = ?auto_833065 ?auto_833079 ) ) ( not ( = ?auto_833065 ?auto_833080 ) ) ( not ( = ?auto_833066 ?auto_833067 ) ) ( not ( = ?auto_833066 ?auto_833068 ) ) ( not ( = ?auto_833066 ?auto_833069 ) ) ( not ( = ?auto_833066 ?auto_833070 ) ) ( not ( = ?auto_833066 ?auto_833071 ) ) ( not ( = ?auto_833066 ?auto_833072 ) ) ( not ( = ?auto_833066 ?auto_833073 ) ) ( not ( = ?auto_833066 ?auto_833074 ) ) ( not ( = ?auto_833066 ?auto_833075 ) ) ( not ( = ?auto_833066 ?auto_833076 ) ) ( not ( = ?auto_833066 ?auto_833077 ) ) ( not ( = ?auto_833066 ?auto_833078 ) ) ( not ( = ?auto_833066 ?auto_833079 ) ) ( not ( = ?auto_833066 ?auto_833080 ) ) ( not ( = ?auto_833067 ?auto_833068 ) ) ( not ( = ?auto_833067 ?auto_833069 ) ) ( not ( = ?auto_833067 ?auto_833070 ) ) ( not ( = ?auto_833067 ?auto_833071 ) ) ( not ( = ?auto_833067 ?auto_833072 ) ) ( not ( = ?auto_833067 ?auto_833073 ) ) ( not ( = ?auto_833067 ?auto_833074 ) ) ( not ( = ?auto_833067 ?auto_833075 ) ) ( not ( = ?auto_833067 ?auto_833076 ) ) ( not ( = ?auto_833067 ?auto_833077 ) ) ( not ( = ?auto_833067 ?auto_833078 ) ) ( not ( = ?auto_833067 ?auto_833079 ) ) ( not ( = ?auto_833067 ?auto_833080 ) ) ( not ( = ?auto_833068 ?auto_833069 ) ) ( not ( = ?auto_833068 ?auto_833070 ) ) ( not ( = ?auto_833068 ?auto_833071 ) ) ( not ( = ?auto_833068 ?auto_833072 ) ) ( not ( = ?auto_833068 ?auto_833073 ) ) ( not ( = ?auto_833068 ?auto_833074 ) ) ( not ( = ?auto_833068 ?auto_833075 ) ) ( not ( = ?auto_833068 ?auto_833076 ) ) ( not ( = ?auto_833068 ?auto_833077 ) ) ( not ( = ?auto_833068 ?auto_833078 ) ) ( not ( = ?auto_833068 ?auto_833079 ) ) ( not ( = ?auto_833068 ?auto_833080 ) ) ( not ( = ?auto_833069 ?auto_833070 ) ) ( not ( = ?auto_833069 ?auto_833071 ) ) ( not ( = ?auto_833069 ?auto_833072 ) ) ( not ( = ?auto_833069 ?auto_833073 ) ) ( not ( = ?auto_833069 ?auto_833074 ) ) ( not ( = ?auto_833069 ?auto_833075 ) ) ( not ( = ?auto_833069 ?auto_833076 ) ) ( not ( = ?auto_833069 ?auto_833077 ) ) ( not ( = ?auto_833069 ?auto_833078 ) ) ( not ( = ?auto_833069 ?auto_833079 ) ) ( not ( = ?auto_833069 ?auto_833080 ) ) ( not ( = ?auto_833070 ?auto_833071 ) ) ( not ( = ?auto_833070 ?auto_833072 ) ) ( not ( = ?auto_833070 ?auto_833073 ) ) ( not ( = ?auto_833070 ?auto_833074 ) ) ( not ( = ?auto_833070 ?auto_833075 ) ) ( not ( = ?auto_833070 ?auto_833076 ) ) ( not ( = ?auto_833070 ?auto_833077 ) ) ( not ( = ?auto_833070 ?auto_833078 ) ) ( not ( = ?auto_833070 ?auto_833079 ) ) ( not ( = ?auto_833070 ?auto_833080 ) ) ( not ( = ?auto_833071 ?auto_833072 ) ) ( not ( = ?auto_833071 ?auto_833073 ) ) ( not ( = ?auto_833071 ?auto_833074 ) ) ( not ( = ?auto_833071 ?auto_833075 ) ) ( not ( = ?auto_833071 ?auto_833076 ) ) ( not ( = ?auto_833071 ?auto_833077 ) ) ( not ( = ?auto_833071 ?auto_833078 ) ) ( not ( = ?auto_833071 ?auto_833079 ) ) ( not ( = ?auto_833071 ?auto_833080 ) ) ( not ( = ?auto_833072 ?auto_833073 ) ) ( not ( = ?auto_833072 ?auto_833074 ) ) ( not ( = ?auto_833072 ?auto_833075 ) ) ( not ( = ?auto_833072 ?auto_833076 ) ) ( not ( = ?auto_833072 ?auto_833077 ) ) ( not ( = ?auto_833072 ?auto_833078 ) ) ( not ( = ?auto_833072 ?auto_833079 ) ) ( not ( = ?auto_833072 ?auto_833080 ) ) ( not ( = ?auto_833073 ?auto_833074 ) ) ( not ( = ?auto_833073 ?auto_833075 ) ) ( not ( = ?auto_833073 ?auto_833076 ) ) ( not ( = ?auto_833073 ?auto_833077 ) ) ( not ( = ?auto_833073 ?auto_833078 ) ) ( not ( = ?auto_833073 ?auto_833079 ) ) ( not ( = ?auto_833073 ?auto_833080 ) ) ( not ( = ?auto_833074 ?auto_833075 ) ) ( not ( = ?auto_833074 ?auto_833076 ) ) ( not ( = ?auto_833074 ?auto_833077 ) ) ( not ( = ?auto_833074 ?auto_833078 ) ) ( not ( = ?auto_833074 ?auto_833079 ) ) ( not ( = ?auto_833074 ?auto_833080 ) ) ( not ( = ?auto_833075 ?auto_833076 ) ) ( not ( = ?auto_833075 ?auto_833077 ) ) ( not ( = ?auto_833075 ?auto_833078 ) ) ( not ( = ?auto_833075 ?auto_833079 ) ) ( not ( = ?auto_833075 ?auto_833080 ) ) ( not ( = ?auto_833076 ?auto_833077 ) ) ( not ( = ?auto_833076 ?auto_833078 ) ) ( not ( = ?auto_833076 ?auto_833079 ) ) ( not ( = ?auto_833076 ?auto_833080 ) ) ( not ( = ?auto_833077 ?auto_833078 ) ) ( not ( = ?auto_833077 ?auto_833079 ) ) ( not ( = ?auto_833077 ?auto_833080 ) ) ( not ( = ?auto_833078 ?auto_833079 ) ) ( not ( = ?auto_833078 ?auto_833080 ) ) ( not ( = ?auto_833079 ?auto_833080 ) ) ( ON ?auto_833078 ?auto_833079 ) ( ON ?auto_833077 ?auto_833078 ) ( CLEAR ?auto_833075 ) ( ON ?auto_833076 ?auto_833077 ) ( CLEAR ?auto_833076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_833064 ?auto_833065 ?auto_833066 ?auto_833067 ?auto_833068 ?auto_833069 ?auto_833070 ?auto_833071 ?auto_833072 ?auto_833073 ?auto_833074 ?auto_833075 ?auto_833076 )
      ( MAKE-16PILE ?auto_833064 ?auto_833065 ?auto_833066 ?auto_833067 ?auto_833068 ?auto_833069 ?auto_833070 ?auto_833071 ?auto_833072 ?auto_833073 ?auto_833074 ?auto_833075 ?auto_833076 ?auto_833077 ?auto_833078 ?auto_833079 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_833130 - BLOCK
      ?auto_833131 - BLOCK
      ?auto_833132 - BLOCK
      ?auto_833133 - BLOCK
      ?auto_833134 - BLOCK
      ?auto_833135 - BLOCK
      ?auto_833136 - BLOCK
      ?auto_833137 - BLOCK
      ?auto_833138 - BLOCK
      ?auto_833139 - BLOCK
      ?auto_833140 - BLOCK
      ?auto_833141 - BLOCK
      ?auto_833142 - BLOCK
      ?auto_833143 - BLOCK
      ?auto_833144 - BLOCK
      ?auto_833145 - BLOCK
    )
    :vars
    (
      ?auto_833146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_833145 ?auto_833146 ) ( ON-TABLE ?auto_833130 ) ( ON ?auto_833131 ?auto_833130 ) ( ON ?auto_833132 ?auto_833131 ) ( ON ?auto_833133 ?auto_833132 ) ( ON ?auto_833134 ?auto_833133 ) ( ON ?auto_833135 ?auto_833134 ) ( ON ?auto_833136 ?auto_833135 ) ( ON ?auto_833137 ?auto_833136 ) ( ON ?auto_833138 ?auto_833137 ) ( ON ?auto_833139 ?auto_833138 ) ( ON ?auto_833140 ?auto_833139 ) ( not ( = ?auto_833130 ?auto_833131 ) ) ( not ( = ?auto_833130 ?auto_833132 ) ) ( not ( = ?auto_833130 ?auto_833133 ) ) ( not ( = ?auto_833130 ?auto_833134 ) ) ( not ( = ?auto_833130 ?auto_833135 ) ) ( not ( = ?auto_833130 ?auto_833136 ) ) ( not ( = ?auto_833130 ?auto_833137 ) ) ( not ( = ?auto_833130 ?auto_833138 ) ) ( not ( = ?auto_833130 ?auto_833139 ) ) ( not ( = ?auto_833130 ?auto_833140 ) ) ( not ( = ?auto_833130 ?auto_833141 ) ) ( not ( = ?auto_833130 ?auto_833142 ) ) ( not ( = ?auto_833130 ?auto_833143 ) ) ( not ( = ?auto_833130 ?auto_833144 ) ) ( not ( = ?auto_833130 ?auto_833145 ) ) ( not ( = ?auto_833130 ?auto_833146 ) ) ( not ( = ?auto_833131 ?auto_833132 ) ) ( not ( = ?auto_833131 ?auto_833133 ) ) ( not ( = ?auto_833131 ?auto_833134 ) ) ( not ( = ?auto_833131 ?auto_833135 ) ) ( not ( = ?auto_833131 ?auto_833136 ) ) ( not ( = ?auto_833131 ?auto_833137 ) ) ( not ( = ?auto_833131 ?auto_833138 ) ) ( not ( = ?auto_833131 ?auto_833139 ) ) ( not ( = ?auto_833131 ?auto_833140 ) ) ( not ( = ?auto_833131 ?auto_833141 ) ) ( not ( = ?auto_833131 ?auto_833142 ) ) ( not ( = ?auto_833131 ?auto_833143 ) ) ( not ( = ?auto_833131 ?auto_833144 ) ) ( not ( = ?auto_833131 ?auto_833145 ) ) ( not ( = ?auto_833131 ?auto_833146 ) ) ( not ( = ?auto_833132 ?auto_833133 ) ) ( not ( = ?auto_833132 ?auto_833134 ) ) ( not ( = ?auto_833132 ?auto_833135 ) ) ( not ( = ?auto_833132 ?auto_833136 ) ) ( not ( = ?auto_833132 ?auto_833137 ) ) ( not ( = ?auto_833132 ?auto_833138 ) ) ( not ( = ?auto_833132 ?auto_833139 ) ) ( not ( = ?auto_833132 ?auto_833140 ) ) ( not ( = ?auto_833132 ?auto_833141 ) ) ( not ( = ?auto_833132 ?auto_833142 ) ) ( not ( = ?auto_833132 ?auto_833143 ) ) ( not ( = ?auto_833132 ?auto_833144 ) ) ( not ( = ?auto_833132 ?auto_833145 ) ) ( not ( = ?auto_833132 ?auto_833146 ) ) ( not ( = ?auto_833133 ?auto_833134 ) ) ( not ( = ?auto_833133 ?auto_833135 ) ) ( not ( = ?auto_833133 ?auto_833136 ) ) ( not ( = ?auto_833133 ?auto_833137 ) ) ( not ( = ?auto_833133 ?auto_833138 ) ) ( not ( = ?auto_833133 ?auto_833139 ) ) ( not ( = ?auto_833133 ?auto_833140 ) ) ( not ( = ?auto_833133 ?auto_833141 ) ) ( not ( = ?auto_833133 ?auto_833142 ) ) ( not ( = ?auto_833133 ?auto_833143 ) ) ( not ( = ?auto_833133 ?auto_833144 ) ) ( not ( = ?auto_833133 ?auto_833145 ) ) ( not ( = ?auto_833133 ?auto_833146 ) ) ( not ( = ?auto_833134 ?auto_833135 ) ) ( not ( = ?auto_833134 ?auto_833136 ) ) ( not ( = ?auto_833134 ?auto_833137 ) ) ( not ( = ?auto_833134 ?auto_833138 ) ) ( not ( = ?auto_833134 ?auto_833139 ) ) ( not ( = ?auto_833134 ?auto_833140 ) ) ( not ( = ?auto_833134 ?auto_833141 ) ) ( not ( = ?auto_833134 ?auto_833142 ) ) ( not ( = ?auto_833134 ?auto_833143 ) ) ( not ( = ?auto_833134 ?auto_833144 ) ) ( not ( = ?auto_833134 ?auto_833145 ) ) ( not ( = ?auto_833134 ?auto_833146 ) ) ( not ( = ?auto_833135 ?auto_833136 ) ) ( not ( = ?auto_833135 ?auto_833137 ) ) ( not ( = ?auto_833135 ?auto_833138 ) ) ( not ( = ?auto_833135 ?auto_833139 ) ) ( not ( = ?auto_833135 ?auto_833140 ) ) ( not ( = ?auto_833135 ?auto_833141 ) ) ( not ( = ?auto_833135 ?auto_833142 ) ) ( not ( = ?auto_833135 ?auto_833143 ) ) ( not ( = ?auto_833135 ?auto_833144 ) ) ( not ( = ?auto_833135 ?auto_833145 ) ) ( not ( = ?auto_833135 ?auto_833146 ) ) ( not ( = ?auto_833136 ?auto_833137 ) ) ( not ( = ?auto_833136 ?auto_833138 ) ) ( not ( = ?auto_833136 ?auto_833139 ) ) ( not ( = ?auto_833136 ?auto_833140 ) ) ( not ( = ?auto_833136 ?auto_833141 ) ) ( not ( = ?auto_833136 ?auto_833142 ) ) ( not ( = ?auto_833136 ?auto_833143 ) ) ( not ( = ?auto_833136 ?auto_833144 ) ) ( not ( = ?auto_833136 ?auto_833145 ) ) ( not ( = ?auto_833136 ?auto_833146 ) ) ( not ( = ?auto_833137 ?auto_833138 ) ) ( not ( = ?auto_833137 ?auto_833139 ) ) ( not ( = ?auto_833137 ?auto_833140 ) ) ( not ( = ?auto_833137 ?auto_833141 ) ) ( not ( = ?auto_833137 ?auto_833142 ) ) ( not ( = ?auto_833137 ?auto_833143 ) ) ( not ( = ?auto_833137 ?auto_833144 ) ) ( not ( = ?auto_833137 ?auto_833145 ) ) ( not ( = ?auto_833137 ?auto_833146 ) ) ( not ( = ?auto_833138 ?auto_833139 ) ) ( not ( = ?auto_833138 ?auto_833140 ) ) ( not ( = ?auto_833138 ?auto_833141 ) ) ( not ( = ?auto_833138 ?auto_833142 ) ) ( not ( = ?auto_833138 ?auto_833143 ) ) ( not ( = ?auto_833138 ?auto_833144 ) ) ( not ( = ?auto_833138 ?auto_833145 ) ) ( not ( = ?auto_833138 ?auto_833146 ) ) ( not ( = ?auto_833139 ?auto_833140 ) ) ( not ( = ?auto_833139 ?auto_833141 ) ) ( not ( = ?auto_833139 ?auto_833142 ) ) ( not ( = ?auto_833139 ?auto_833143 ) ) ( not ( = ?auto_833139 ?auto_833144 ) ) ( not ( = ?auto_833139 ?auto_833145 ) ) ( not ( = ?auto_833139 ?auto_833146 ) ) ( not ( = ?auto_833140 ?auto_833141 ) ) ( not ( = ?auto_833140 ?auto_833142 ) ) ( not ( = ?auto_833140 ?auto_833143 ) ) ( not ( = ?auto_833140 ?auto_833144 ) ) ( not ( = ?auto_833140 ?auto_833145 ) ) ( not ( = ?auto_833140 ?auto_833146 ) ) ( not ( = ?auto_833141 ?auto_833142 ) ) ( not ( = ?auto_833141 ?auto_833143 ) ) ( not ( = ?auto_833141 ?auto_833144 ) ) ( not ( = ?auto_833141 ?auto_833145 ) ) ( not ( = ?auto_833141 ?auto_833146 ) ) ( not ( = ?auto_833142 ?auto_833143 ) ) ( not ( = ?auto_833142 ?auto_833144 ) ) ( not ( = ?auto_833142 ?auto_833145 ) ) ( not ( = ?auto_833142 ?auto_833146 ) ) ( not ( = ?auto_833143 ?auto_833144 ) ) ( not ( = ?auto_833143 ?auto_833145 ) ) ( not ( = ?auto_833143 ?auto_833146 ) ) ( not ( = ?auto_833144 ?auto_833145 ) ) ( not ( = ?auto_833144 ?auto_833146 ) ) ( not ( = ?auto_833145 ?auto_833146 ) ) ( ON ?auto_833144 ?auto_833145 ) ( ON ?auto_833143 ?auto_833144 ) ( ON ?auto_833142 ?auto_833143 ) ( CLEAR ?auto_833140 ) ( ON ?auto_833141 ?auto_833142 ) ( CLEAR ?auto_833141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_833130 ?auto_833131 ?auto_833132 ?auto_833133 ?auto_833134 ?auto_833135 ?auto_833136 ?auto_833137 ?auto_833138 ?auto_833139 ?auto_833140 ?auto_833141 )
      ( MAKE-16PILE ?auto_833130 ?auto_833131 ?auto_833132 ?auto_833133 ?auto_833134 ?auto_833135 ?auto_833136 ?auto_833137 ?auto_833138 ?auto_833139 ?auto_833140 ?auto_833141 ?auto_833142 ?auto_833143 ?auto_833144 ?auto_833145 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_833196 - BLOCK
      ?auto_833197 - BLOCK
      ?auto_833198 - BLOCK
      ?auto_833199 - BLOCK
      ?auto_833200 - BLOCK
      ?auto_833201 - BLOCK
      ?auto_833202 - BLOCK
      ?auto_833203 - BLOCK
      ?auto_833204 - BLOCK
      ?auto_833205 - BLOCK
      ?auto_833206 - BLOCK
      ?auto_833207 - BLOCK
      ?auto_833208 - BLOCK
      ?auto_833209 - BLOCK
      ?auto_833210 - BLOCK
      ?auto_833211 - BLOCK
    )
    :vars
    (
      ?auto_833212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_833211 ?auto_833212 ) ( ON-TABLE ?auto_833196 ) ( ON ?auto_833197 ?auto_833196 ) ( ON ?auto_833198 ?auto_833197 ) ( ON ?auto_833199 ?auto_833198 ) ( ON ?auto_833200 ?auto_833199 ) ( ON ?auto_833201 ?auto_833200 ) ( ON ?auto_833202 ?auto_833201 ) ( ON ?auto_833203 ?auto_833202 ) ( ON ?auto_833204 ?auto_833203 ) ( ON ?auto_833205 ?auto_833204 ) ( not ( = ?auto_833196 ?auto_833197 ) ) ( not ( = ?auto_833196 ?auto_833198 ) ) ( not ( = ?auto_833196 ?auto_833199 ) ) ( not ( = ?auto_833196 ?auto_833200 ) ) ( not ( = ?auto_833196 ?auto_833201 ) ) ( not ( = ?auto_833196 ?auto_833202 ) ) ( not ( = ?auto_833196 ?auto_833203 ) ) ( not ( = ?auto_833196 ?auto_833204 ) ) ( not ( = ?auto_833196 ?auto_833205 ) ) ( not ( = ?auto_833196 ?auto_833206 ) ) ( not ( = ?auto_833196 ?auto_833207 ) ) ( not ( = ?auto_833196 ?auto_833208 ) ) ( not ( = ?auto_833196 ?auto_833209 ) ) ( not ( = ?auto_833196 ?auto_833210 ) ) ( not ( = ?auto_833196 ?auto_833211 ) ) ( not ( = ?auto_833196 ?auto_833212 ) ) ( not ( = ?auto_833197 ?auto_833198 ) ) ( not ( = ?auto_833197 ?auto_833199 ) ) ( not ( = ?auto_833197 ?auto_833200 ) ) ( not ( = ?auto_833197 ?auto_833201 ) ) ( not ( = ?auto_833197 ?auto_833202 ) ) ( not ( = ?auto_833197 ?auto_833203 ) ) ( not ( = ?auto_833197 ?auto_833204 ) ) ( not ( = ?auto_833197 ?auto_833205 ) ) ( not ( = ?auto_833197 ?auto_833206 ) ) ( not ( = ?auto_833197 ?auto_833207 ) ) ( not ( = ?auto_833197 ?auto_833208 ) ) ( not ( = ?auto_833197 ?auto_833209 ) ) ( not ( = ?auto_833197 ?auto_833210 ) ) ( not ( = ?auto_833197 ?auto_833211 ) ) ( not ( = ?auto_833197 ?auto_833212 ) ) ( not ( = ?auto_833198 ?auto_833199 ) ) ( not ( = ?auto_833198 ?auto_833200 ) ) ( not ( = ?auto_833198 ?auto_833201 ) ) ( not ( = ?auto_833198 ?auto_833202 ) ) ( not ( = ?auto_833198 ?auto_833203 ) ) ( not ( = ?auto_833198 ?auto_833204 ) ) ( not ( = ?auto_833198 ?auto_833205 ) ) ( not ( = ?auto_833198 ?auto_833206 ) ) ( not ( = ?auto_833198 ?auto_833207 ) ) ( not ( = ?auto_833198 ?auto_833208 ) ) ( not ( = ?auto_833198 ?auto_833209 ) ) ( not ( = ?auto_833198 ?auto_833210 ) ) ( not ( = ?auto_833198 ?auto_833211 ) ) ( not ( = ?auto_833198 ?auto_833212 ) ) ( not ( = ?auto_833199 ?auto_833200 ) ) ( not ( = ?auto_833199 ?auto_833201 ) ) ( not ( = ?auto_833199 ?auto_833202 ) ) ( not ( = ?auto_833199 ?auto_833203 ) ) ( not ( = ?auto_833199 ?auto_833204 ) ) ( not ( = ?auto_833199 ?auto_833205 ) ) ( not ( = ?auto_833199 ?auto_833206 ) ) ( not ( = ?auto_833199 ?auto_833207 ) ) ( not ( = ?auto_833199 ?auto_833208 ) ) ( not ( = ?auto_833199 ?auto_833209 ) ) ( not ( = ?auto_833199 ?auto_833210 ) ) ( not ( = ?auto_833199 ?auto_833211 ) ) ( not ( = ?auto_833199 ?auto_833212 ) ) ( not ( = ?auto_833200 ?auto_833201 ) ) ( not ( = ?auto_833200 ?auto_833202 ) ) ( not ( = ?auto_833200 ?auto_833203 ) ) ( not ( = ?auto_833200 ?auto_833204 ) ) ( not ( = ?auto_833200 ?auto_833205 ) ) ( not ( = ?auto_833200 ?auto_833206 ) ) ( not ( = ?auto_833200 ?auto_833207 ) ) ( not ( = ?auto_833200 ?auto_833208 ) ) ( not ( = ?auto_833200 ?auto_833209 ) ) ( not ( = ?auto_833200 ?auto_833210 ) ) ( not ( = ?auto_833200 ?auto_833211 ) ) ( not ( = ?auto_833200 ?auto_833212 ) ) ( not ( = ?auto_833201 ?auto_833202 ) ) ( not ( = ?auto_833201 ?auto_833203 ) ) ( not ( = ?auto_833201 ?auto_833204 ) ) ( not ( = ?auto_833201 ?auto_833205 ) ) ( not ( = ?auto_833201 ?auto_833206 ) ) ( not ( = ?auto_833201 ?auto_833207 ) ) ( not ( = ?auto_833201 ?auto_833208 ) ) ( not ( = ?auto_833201 ?auto_833209 ) ) ( not ( = ?auto_833201 ?auto_833210 ) ) ( not ( = ?auto_833201 ?auto_833211 ) ) ( not ( = ?auto_833201 ?auto_833212 ) ) ( not ( = ?auto_833202 ?auto_833203 ) ) ( not ( = ?auto_833202 ?auto_833204 ) ) ( not ( = ?auto_833202 ?auto_833205 ) ) ( not ( = ?auto_833202 ?auto_833206 ) ) ( not ( = ?auto_833202 ?auto_833207 ) ) ( not ( = ?auto_833202 ?auto_833208 ) ) ( not ( = ?auto_833202 ?auto_833209 ) ) ( not ( = ?auto_833202 ?auto_833210 ) ) ( not ( = ?auto_833202 ?auto_833211 ) ) ( not ( = ?auto_833202 ?auto_833212 ) ) ( not ( = ?auto_833203 ?auto_833204 ) ) ( not ( = ?auto_833203 ?auto_833205 ) ) ( not ( = ?auto_833203 ?auto_833206 ) ) ( not ( = ?auto_833203 ?auto_833207 ) ) ( not ( = ?auto_833203 ?auto_833208 ) ) ( not ( = ?auto_833203 ?auto_833209 ) ) ( not ( = ?auto_833203 ?auto_833210 ) ) ( not ( = ?auto_833203 ?auto_833211 ) ) ( not ( = ?auto_833203 ?auto_833212 ) ) ( not ( = ?auto_833204 ?auto_833205 ) ) ( not ( = ?auto_833204 ?auto_833206 ) ) ( not ( = ?auto_833204 ?auto_833207 ) ) ( not ( = ?auto_833204 ?auto_833208 ) ) ( not ( = ?auto_833204 ?auto_833209 ) ) ( not ( = ?auto_833204 ?auto_833210 ) ) ( not ( = ?auto_833204 ?auto_833211 ) ) ( not ( = ?auto_833204 ?auto_833212 ) ) ( not ( = ?auto_833205 ?auto_833206 ) ) ( not ( = ?auto_833205 ?auto_833207 ) ) ( not ( = ?auto_833205 ?auto_833208 ) ) ( not ( = ?auto_833205 ?auto_833209 ) ) ( not ( = ?auto_833205 ?auto_833210 ) ) ( not ( = ?auto_833205 ?auto_833211 ) ) ( not ( = ?auto_833205 ?auto_833212 ) ) ( not ( = ?auto_833206 ?auto_833207 ) ) ( not ( = ?auto_833206 ?auto_833208 ) ) ( not ( = ?auto_833206 ?auto_833209 ) ) ( not ( = ?auto_833206 ?auto_833210 ) ) ( not ( = ?auto_833206 ?auto_833211 ) ) ( not ( = ?auto_833206 ?auto_833212 ) ) ( not ( = ?auto_833207 ?auto_833208 ) ) ( not ( = ?auto_833207 ?auto_833209 ) ) ( not ( = ?auto_833207 ?auto_833210 ) ) ( not ( = ?auto_833207 ?auto_833211 ) ) ( not ( = ?auto_833207 ?auto_833212 ) ) ( not ( = ?auto_833208 ?auto_833209 ) ) ( not ( = ?auto_833208 ?auto_833210 ) ) ( not ( = ?auto_833208 ?auto_833211 ) ) ( not ( = ?auto_833208 ?auto_833212 ) ) ( not ( = ?auto_833209 ?auto_833210 ) ) ( not ( = ?auto_833209 ?auto_833211 ) ) ( not ( = ?auto_833209 ?auto_833212 ) ) ( not ( = ?auto_833210 ?auto_833211 ) ) ( not ( = ?auto_833210 ?auto_833212 ) ) ( not ( = ?auto_833211 ?auto_833212 ) ) ( ON ?auto_833210 ?auto_833211 ) ( ON ?auto_833209 ?auto_833210 ) ( ON ?auto_833208 ?auto_833209 ) ( ON ?auto_833207 ?auto_833208 ) ( CLEAR ?auto_833205 ) ( ON ?auto_833206 ?auto_833207 ) ( CLEAR ?auto_833206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_833196 ?auto_833197 ?auto_833198 ?auto_833199 ?auto_833200 ?auto_833201 ?auto_833202 ?auto_833203 ?auto_833204 ?auto_833205 ?auto_833206 )
      ( MAKE-16PILE ?auto_833196 ?auto_833197 ?auto_833198 ?auto_833199 ?auto_833200 ?auto_833201 ?auto_833202 ?auto_833203 ?auto_833204 ?auto_833205 ?auto_833206 ?auto_833207 ?auto_833208 ?auto_833209 ?auto_833210 ?auto_833211 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_833262 - BLOCK
      ?auto_833263 - BLOCK
      ?auto_833264 - BLOCK
      ?auto_833265 - BLOCK
      ?auto_833266 - BLOCK
      ?auto_833267 - BLOCK
      ?auto_833268 - BLOCK
      ?auto_833269 - BLOCK
      ?auto_833270 - BLOCK
      ?auto_833271 - BLOCK
      ?auto_833272 - BLOCK
      ?auto_833273 - BLOCK
      ?auto_833274 - BLOCK
      ?auto_833275 - BLOCK
      ?auto_833276 - BLOCK
      ?auto_833277 - BLOCK
    )
    :vars
    (
      ?auto_833278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_833277 ?auto_833278 ) ( ON-TABLE ?auto_833262 ) ( ON ?auto_833263 ?auto_833262 ) ( ON ?auto_833264 ?auto_833263 ) ( ON ?auto_833265 ?auto_833264 ) ( ON ?auto_833266 ?auto_833265 ) ( ON ?auto_833267 ?auto_833266 ) ( ON ?auto_833268 ?auto_833267 ) ( ON ?auto_833269 ?auto_833268 ) ( ON ?auto_833270 ?auto_833269 ) ( not ( = ?auto_833262 ?auto_833263 ) ) ( not ( = ?auto_833262 ?auto_833264 ) ) ( not ( = ?auto_833262 ?auto_833265 ) ) ( not ( = ?auto_833262 ?auto_833266 ) ) ( not ( = ?auto_833262 ?auto_833267 ) ) ( not ( = ?auto_833262 ?auto_833268 ) ) ( not ( = ?auto_833262 ?auto_833269 ) ) ( not ( = ?auto_833262 ?auto_833270 ) ) ( not ( = ?auto_833262 ?auto_833271 ) ) ( not ( = ?auto_833262 ?auto_833272 ) ) ( not ( = ?auto_833262 ?auto_833273 ) ) ( not ( = ?auto_833262 ?auto_833274 ) ) ( not ( = ?auto_833262 ?auto_833275 ) ) ( not ( = ?auto_833262 ?auto_833276 ) ) ( not ( = ?auto_833262 ?auto_833277 ) ) ( not ( = ?auto_833262 ?auto_833278 ) ) ( not ( = ?auto_833263 ?auto_833264 ) ) ( not ( = ?auto_833263 ?auto_833265 ) ) ( not ( = ?auto_833263 ?auto_833266 ) ) ( not ( = ?auto_833263 ?auto_833267 ) ) ( not ( = ?auto_833263 ?auto_833268 ) ) ( not ( = ?auto_833263 ?auto_833269 ) ) ( not ( = ?auto_833263 ?auto_833270 ) ) ( not ( = ?auto_833263 ?auto_833271 ) ) ( not ( = ?auto_833263 ?auto_833272 ) ) ( not ( = ?auto_833263 ?auto_833273 ) ) ( not ( = ?auto_833263 ?auto_833274 ) ) ( not ( = ?auto_833263 ?auto_833275 ) ) ( not ( = ?auto_833263 ?auto_833276 ) ) ( not ( = ?auto_833263 ?auto_833277 ) ) ( not ( = ?auto_833263 ?auto_833278 ) ) ( not ( = ?auto_833264 ?auto_833265 ) ) ( not ( = ?auto_833264 ?auto_833266 ) ) ( not ( = ?auto_833264 ?auto_833267 ) ) ( not ( = ?auto_833264 ?auto_833268 ) ) ( not ( = ?auto_833264 ?auto_833269 ) ) ( not ( = ?auto_833264 ?auto_833270 ) ) ( not ( = ?auto_833264 ?auto_833271 ) ) ( not ( = ?auto_833264 ?auto_833272 ) ) ( not ( = ?auto_833264 ?auto_833273 ) ) ( not ( = ?auto_833264 ?auto_833274 ) ) ( not ( = ?auto_833264 ?auto_833275 ) ) ( not ( = ?auto_833264 ?auto_833276 ) ) ( not ( = ?auto_833264 ?auto_833277 ) ) ( not ( = ?auto_833264 ?auto_833278 ) ) ( not ( = ?auto_833265 ?auto_833266 ) ) ( not ( = ?auto_833265 ?auto_833267 ) ) ( not ( = ?auto_833265 ?auto_833268 ) ) ( not ( = ?auto_833265 ?auto_833269 ) ) ( not ( = ?auto_833265 ?auto_833270 ) ) ( not ( = ?auto_833265 ?auto_833271 ) ) ( not ( = ?auto_833265 ?auto_833272 ) ) ( not ( = ?auto_833265 ?auto_833273 ) ) ( not ( = ?auto_833265 ?auto_833274 ) ) ( not ( = ?auto_833265 ?auto_833275 ) ) ( not ( = ?auto_833265 ?auto_833276 ) ) ( not ( = ?auto_833265 ?auto_833277 ) ) ( not ( = ?auto_833265 ?auto_833278 ) ) ( not ( = ?auto_833266 ?auto_833267 ) ) ( not ( = ?auto_833266 ?auto_833268 ) ) ( not ( = ?auto_833266 ?auto_833269 ) ) ( not ( = ?auto_833266 ?auto_833270 ) ) ( not ( = ?auto_833266 ?auto_833271 ) ) ( not ( = ?auto_833266 ?auto_833272 ) ) ( not ( = ?auto_833266 ?auto_833273 ) ) ( not ( = ?auto_833266 ?auto_833274 ) ) ( not ( = ?auto_833266 ?auto_833275 ) ) ( not ( = ?auto_833266 ?auto_833276 ) ) ( not ( = ?auto_833266 ?auto_833277 ) ) ( not ( = ?auto_833266 ?auto_833278 ) ) ( not ( = ?auto_833267 ?auto_833268 ) ) ( not ( = ?auto_833267 ?auto_833269 ) ) ( not ( = ?auto_833267 ?auto_833270 ) ) ( not ( = ?auto_833267 ?auto_833271 ) ) ( not ( = ?auto_833267 ?auto_833272 ) ) ( not ( = ?auto_833267 ?auto_833273 ) ) ( not ( = ?auto_833267 ?auto_833274 ) ) ( not ( = ?auto_833267 ?auto_833275 ) ) ( not ( = ?auto_833267 ?auto_833276 ) ) ( not ( = ?auto_833267 ?auto_833277 ) ) ( not ( = ?auto_833267 ?auto_833278 ) ) ( not ( = ?auto_833268 ?auto_833269 ) ) ( not ( = ?auto_833268 ?auto_833270 ) ) ( not ( = ?auto_833268 ?auto_833271 ) ) ( not ( = ?auto_833268 ?auto_833272 ) ) ( not ( = ?auto_833268 ?auto_833273 ) ) ( not ( = ?auto_833268 ?auto_833274 ) ) ( not ( = ?auto_833268 ?auto_833275 ) ) ( not ( = ?auto_833268 ?auto_833276 ) ) ( not ( = ?auto_833268 ?auto_833277 ) ) ( not ( = ?auto_833268 ?auto_833278 ) ) ( not ( = ?auto_833269 ?auto_833270 ) ) ( not ( = ?auto_833269 ?auto_833271 ) ) ( not ( = ?auto_833269 ?auto_833272 ) ) ( not ( = ?auto_833269 ?auto_833273 ) ) ( not ( = ?auto_833269 ?auto_833274 ) ) ( not ( = ?auto_833269 ?auto_833275 ) ) ( not ( = ?auto_833269 ?auto_833276 ) ) ( not ( = ?auto_833269 ?auto_833277 ) ) ( not ( = ?auto_833269 ?auto_833278 ) ) ( not ( = ?auto_833270 ?auto_833271 ) ) ( not ( = ?auto_833270 ?auto_833272 ) ) ( not ( = ?auto_833270 ?auto_833273 ) ) ( not ( = ?auto_833270 ?auto_833274 ) ) ( not ( = ?auto_833270 ?auto_833275 ) ) ( not ( = ?auto_833270 ?auto_833276 ) ) ( not ( = ?auto_833270 ?auto_833277 ) ) ( not ( = ?auto_833270 ?auto_833278 ) ) ( not ( = ?auto_833271 ?auto_833272 ) ) ( not ( = ?auto_833271 ?auto_833273 ) ) ( not ( = ?auto_833271 ?auto_833274 ) ) ( not ( = ?auto_833271 ?auto_833275 ) ) ( not ( = ?auto_833271 ?auto_833276 ) ) ( not ( = ?auto_833271 ?auto_833277 ) ) ( not ( = ?auto_833271 ?auto_833278 ) ) ( not ( = ?auto_833272 ?auto_833273 ) ) ( not ( = ?auto_833272 ?auto_833274 ) ) ( not ( = ?auto_833272 ?auto_833275 ) ) ( not ( = ?auto_833272 ?auto_833276 ) ) ( not ( = ?auto_833272 ?auto_833277 ) ) ( not ( = ?auto_833272 ?auto_833278 ) ) ( not ( = ?auto_833273 ?auto_833274 ) ) ( not ( = ?auto_833273 ?auto_833275 ) ) ( not ( = ?auto_833273 ?auto_833276 ) ) ( not ( = ?auto_833273 ?auto_833277 ) ) ( not ( = ?auto_833273 ?auto_833278 ) ) ( not ( = ?auto_833274 ?auto_833275 ) ) ( not ( = ?auto_833274 ?auto_833276 ) ) ( not ( = ?auto_833274 ?auto_833277 ) ) ( not ( = ?auto_833274 ?auto_833278 ) ) ( not ( = ?auto_833275 ?auto_833276 ) ) ( not ( = ?auto_833275 ?auto_833277 ) ) ( not ( = ?auto_833275 ?auto_833278 ) ) ( not ( = ?auto_833276 ?auto_833277 ) ) ( not ( = ?auto_833276 ?auto_833278 ) ) ( not ( = ?auto_833277 ?auto_833278 ) ) ( ON ?auto_833276 ?auto_833277 ) ( ON ?auto_833275 ?auto_833276 ) ( ON ?auto_833274 ?auto_833275 ) ( ON ?auto_833273 ?auto_833274 ) ( ON ?auto_833272 ?auto_833273 ) ( CLEAR ?auto_833270 ) ( ON ?auto_833271 ?auto_833272 ) ( CLEAR ?auto_833271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_833262 ?auto_833263 ?auto_833264 ?auto_833265 ?auto_833266 ?auto_833267 ?auto_833268 ?auto_833269 ?auto_833270 ?auto_833271 )
      ( MAKE-16PILE ?auto_833262 ?auto_833263 ?auto_833264 ?auto_833265 ?auto_833266 ?auto_833267 ?auto_833268 ?auto_833269 ?auto_833270 ?auto_833271 ?auto_833272 ?auto_833273 ?auto_833274 ?auto_833275 ?auto_833276 ?auto_833277 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_833328 - BLOCK
      ?auto_833329 - BLOCK
      ?auto_833330 - BLOCK
      ?auto_833331 - BLOCK
      ?auto_833332 - BLOCK
      ?auto_833333 - BLOCK
      ?auto_833334 - BLOCK
      ?auto_833335 - BLOCK
      ?auto_833336 - BLOCK
      ?auto_833337 - BLOCK
      ?auto_833338 - BLOCK
      ?auto_833339 - BLOCK
      ?auto_833340 - BLOCK
      ?auto_833341 - BLOCK
      ?auto_833342 - BLOCK
      ?auto_833343 - BLOCK
    )
    :vars
    (
      ?auto_833344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_833343 ?auto_833344 ) ( ON-TABLE ?auto_833328 ) ( ON ?auto_833329 ?auto_833328 ) ( ON ?auto_833330 ?auto_833329 ) ( ON ?auto_833331 ?auto_833330 ) ( ON ?auto_833332 ?auto_833331 ) ( ON ?auto_833333 ?auto_833332 ) ( ON ?auto_833334 ?auto_833333 ) ( ON ?auto_833335 ?auto_833334 ) ( not ( = ?auto_833328 ?auto_833329 ) ) ( not ( = ?auto_833328 ?auto_833330 ) ) ( not ( = ?auto_833328 ?auto_833331 ) ) ( not ( = ?auto_833328 ?auto_833332 ) ) ( not ( = ?auto_833328 ?auto_833333 ) ) ( not ( = ?auto_833328 ?auto_833334 ) ) ( not ( = ?auto_833328 ?auto_833335 ) ) ( not ( = ?auto_833328 ?auto_833336 ) ) ( not ( = ?auto_833328 ?auto_833337 ) ) ( not ( = ?auto_833328 ?auto_833338 ) ) ( not ( = ?auto_833328 ?auto_833339 ) ) ( not ( = ?auto_833328 ?auto_833340 ) ) ( not ( = ?auto_833328 ?auto_833341 ) ) ( not ( = ?auto_833328 ?auto_833342 ) ) ( not ( = ?auto_833328 ?auto_833343 ) ) ( not ( = ?auto_833328 ?auto_833344 ) ) ( not ( = ?auto_833329 ?auto_833330 ) ) ( not ( = ?auto_833329 ?auto_833331 ) ) ( not ( = ?auto_833329 ?auto_833332 ) ) ( not ( = ?auto_833329 ?auto_833333 ) ) ( not ( = ?auto_833329 ?auto_833334 ) ) ( not ( = ?auto_833329 ?auto_833335 ) ) ( not ( = ?auto_833329 ?auto_833336 ) ) ( not ( = ?auto_833329 ?auto_833337 ) ) ( not ( = ?auto_833329 ?auto_833338 ) ) ( not ( = ?auto_833329 ?auto_833339 ) ) ( not ( = ?auto_833329 ?auto_833340 ) ) ( not ( = ?auto_833329 ?auto_833341 ) ) ( not ( = ?auto_833329 ?auto_833342 ) ) ( not ( = ?auto_833329 ?auto_833343 ) ) ( not ( = ?auto_833329 ?auto_833344 ) ) ( not ( = ?auto_833330 ?auto_833331 ) ) ( not ( = ?auto_833330 ?auto_833332 ) ) ( not ( = ?auto_833330 ?auto_833333 ) ) ( not ( = ?auto_833330 ?auto_833334 ) ) ( not ( = ?auto_833330 ?auto_833335 ) ) ( not ( = ?auto_833330 ?auto_833336 ) ) ( not ( = ?auto_833330 ?auto_833337 ) ) ( not ( = ?auto_833330 ?auto_833338 ) ) ( not ( = ?auto_833330 ?auto_833339 ) ) ( not ( = ?auto_833330 ?auto_833340 ) ) ( not ( = ?auto_833330 ?auto_833341 ) ) ( not ( = ?auto_833330 ?auto_833342 ) ) ( not ( = ?auto_833330 ?auto_833343 ) ) ( not ( = ?auto_833330 ?auto_833344 ) ) ( not ( = ?auto_833331 ?auto_833332 ) ) ( not ( = ?auto_833331 ?auto_833333 ) ) ( not ( = ?auto_833331 ?auto_833334 ) ) ( not ( = ?auto_833331 ?auto_833335 ) ) ( not ( = ?auto_833331 ?auto_833336 ) ) ( not ( = ?auto_833331 ?auto_833337 ) ) ( not ( = ?auto_833331 ?auto_833338 ) ) ( not ( = ?auto_833331 ?auto_833339 ) ) ( not ( = ?auto_833331 ?auto_833340 ) ) ( not ( = ?auto_833331 ?auto_833341 ) ) ( not ( = ?auto_833331 ?auto_833342 ) ) ( not ( = ?auto_833331 ?auto_833343 ) ) ( not ( = ?auto_833331 ?auto_833344 ) ) ( not ( = ?auto_833332 ?auto_833333 ) ) ( not ( = ?auto_833332 ?auto_833334 ) ) ( not ( = ?auto_833332 ?auto_833335 ) ) ( not ( = ?auto_833332 ?auto_833336 ) ) ( not ( = ?auto_833332 ?auto_833337 ) ) ( not ( = ?auto_833332 ?auto_833338 ) ) ( not ( = ?auto_833332 ?auto_833339 ) ) ( not ( = ?auto_833332 ?auto_833340 ) ) ( not ( = ?auto_833332 ?auto_833341 ) ) ( not ( = ?auto_833332 ?auto_833342 ) ) ( not ( = ?auto_833332 ?auto_833343 ) ) ( not ( = ?auto_833332 ?auto_833344 ) ) ( not ( = ?auto_833333 ?auto_833334 ) ) ( not ( = ?auto_833333 ?auto_833335 ) ) ( not ( = ?auto_833333 ?auto_833336 ) ) ( not ( = ?auto_833333 ?auto_833337 ) ) ( not ( = ?auto_833333 ?auto_833338 ) ) ( not ( = ?auto_833333 ?auto_833339 ) ) ( not ( = ?auto_833333 ?auto_833340 ) ) ( not ( = ?auto_833333 ?auto_833341 ) ) ( not ( = ?auto_833333 ?auto_833342 ) ) ( not ( = ?auto_833333 ?auto_833343 ) ) ( not ( = ?auto_833333 ?auto_833344 ) ) ( not ( = ?auto_833334 ?auto_833335 ) ) ( not ( = ?auto_833334 ?auto_833336 ) ) ( not ( = ?auto_833334 ?auto_833337 ) ) ( not ( = ?auto_833334 ?auto_833338 ) ) ( not ( = ?auto_833334 ?auto_833339 ) ) ( not ( = ?auto_833334 ?auto_833340 ) ) ( not ( = ?auto_833334 ?auto_833341 ) ) ( not ( = ?auto_833334 ?auto_833342 ) ) ( not ( = ?auto_833334 ?auto_833343 ) ) ( not ( = ?auto_833334 ?auto_833344 ) ) ( not ( = ?auto_833335 ?auto_833336 ) ) ( not ( = ?auto_833335 ?auto_833337 ) ) ( not ( = ?auto_833335 ?auto_833338 ) ) ( not ( = ?auto_833335 ?auto_833339 ) ) ( not ( = ?auto_833335 ?auto_833340 ) ) ( not ( = ?auto_833335 ?auto_833341 ) ) ( not ( = ?auto_833335 ?auto_833342 ) ) ( not ( = ?auto_833335 ?auto_833343 ) ) ( not ( = ?auto_833335 ?auto_833344 ) ) ( not ( = ?auto_833336 ?auto_833337 ) ) ( not ( = ?auto_833336 ?auto_833338 ) ) ( not ( = ?auto_833336 ?auto_833339 ) ) ( not ( = ?auto_833336 ?auto_833340 ) ) ( not ( = ?auto_833336 ?auto_833341 ) ) ( not ( = ?auto_833336 ?auto_833342 ) ) ( not ( = ?auto_833336 ?auto_833343 ) ) ( not ( = ?auto_833336 ?auto_833344 ) ) ( not ( = ?auto_833337 ?auto_833338 ) ) ( not ( = ?auto_833337 ?auto_833339 ) ) ( not ( = ?auto_833337 ?auto_833340 ) ) ( not ( = ?auto_833337 ?auto_833341 ) ) ( not ( = ?auto_833337 ?auto_833342 ) ) ( not ( = ?auto_833337 ?auto_833343 ) ) ( not ( = ?auto_833337 ?auto_833344 ) ) ( not ( = ?auto_833338 ?auto_833339 ) ) ( not ( = ?auto_833338 ?auto_833340 ) ) ( not ( = ?auto_833338 ?auto_833341 ) ) ( not ( = ?auto_833338 ?auto_833342 ) ) ( not ( = ?auto_833338 ?auto_833343 ) ) ( not ( = ?auto_833338 ?auto_833344 ) ) ( not ( = ?auto_833339 ?auto_833340 ) ) ( not ( = ?auto_833339 ?auto_833341 ) ) ( not ( = ?auto_833339 ?auto_833342 ) ) ( not ( = ?auto_833339 ?auto_833343 ) ) ( not ( = ?auto_833339 ?auto_833344 ) ) ( not ( = ?auto_833340 ?auto_833341 ) ) ( not ( = ?auto_833340 ?auto_833342 ) ) ( not ( = ?auto_833340 ?auto_833343 ) ) ( not ( = ?auto_833340 ?auto_833344 ) ) ( not ( = ?auto_833341 ?auto_833342 ) ) ( not ( = ?auto_833341 ?auto_833343 ) ) ( not ( = ?auto_833341 ?auto_833344 ) ) ( not ( = ?auto_833342 ?auto_833343 ) ) ( not ( = ?auto_833342 ?auto_833344 ) ) ( not ( = ?auto_833343 ?auto_833344 ) ) ( ON ?auto_833342 ?auto_833343 ) ( ON ?auto_833341 ?auto_833342 ) ( ON ?auto_833340 ?auto_833341 ) ( ON ?auto_833339 ?auto_833340 ) ( ON ?auto_833338 ?auto_833339 ) ( ON ?auto_833337 ?auto_833338 ) ( CLEAR ?auto_833335 ) ( ON ?auto_833336 ?auto_833337 ) ( CLEAR ?auto_833336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_833328 ?auto_833329 ?auto_833330 ?auto_833331 ?auto_833332 ?auto_833333 ?auto_833334 ?auto_833335 ?auto_833336 )
      ( MAKE-16PILE ?auto_833328 ?auto_833329 ?auto_833330 ?auto_833331 ?auto_833332 ?auto_833333 ?auto_833334 ?auto_833335 ?auto_833336 ?auto_833337 ?auto_833338 ?auto_833339 ?auto_833340 ?auto_833341 ?auto_833342 ?auto_833343 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_833394 - BLOCK
      ?auto_833395 - BLOCK
      ?auto_833396 - BLOCK
      ?auto_833397 - BLOCK
      ?auto_833398 - BLOCK
      ?auto_833399 - BLOCK
      ?auto_833400 - BLOCK
      ?auto_833401 - BLOCK
      ?auto_833402 - BLOCK
      ?auto_833403 - BLOCK
      ?auto_833404 - BLOCK
      ?auto_833405 - BLOCK
      ?auto_833406 - BLOCK
      ?auto_833407 - BLOCK
      ?auto_833408 - BLOCK
      ?auto_833409 - BLOCK
    )
    :vars
    (
      ?auto_833410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_833409 ?auto_833410 ) ( ON-TABLE ?auto_833394 ) ( ON ?auto_833395 ?auto_833394 ) ( ON ?auto_833396 ?auto_833395 ) ( ON ?auto_833397 ?auto_833396 ) ( ON ?auto_833398 ?auto_833397 ) ( ON ?auto_833399 ?auto_833398 ) ( ON ?auto_833400 ?auto_833399 ) ( not ( = ?auto_833394 ?auto_833395 ) ) ( not ( = ?auto_833394 ?auto_833396 ) ) ( not ( = ?auto_833394 ?auto_833397 ) ) ( not ( = ?auto_833394 ?auto_833398 ) ) ( not ( = ?auto_833394 ?auto_833399 ) ) ( not ( = ?auto_833394 ?auto_833400 ) ) ( not ( = ?auto_833394 ?auto_833401 ) ) ( not ( = ?auto_833394 ?auto_833402 ) ) ( not ( = ?auto_833394 ?auto_833403 ) ) ( not ( = ?auto_833394 ?auto_833404 ) ) ( not ( = ?auto_833394 ?auto_833405 ) ) ( not ( = ?auto_833394 ?auto_833406 ) ) ( not ( = ?auto_833394 ?auto_833407 ) ) ( not ( = ?auto_833394 ?auto_833408 ) ) ( not ( = ?auto_833394 ?auto_833409 ) ) ( not ( = ?auto_833394 ?auto_833410 ) ) ( not ( = ?auto_833395 ?auto_833396 ) ) ( not ( = ?auto_833395 ?auto_833397 ) ) ( not ( = ?auto_833395 ?auto_833398 ) ) ( not ( = ?auto_833395 ?auto_833399 ) ) ( not ( = ?auto_833395 ?auto_833400 ) ) ( not ( = ?auto_833395 ?auto_833401 ) ) ( not ( = ?auto_833395 ?auto_833402 ) ) ( not ( = ?auto_833395 ?auto_833403 ) ) ( not ( = ?auto_833395 ?auto_833404 ) ) ( not ( = ?auto_833395 ?auto_833405 ) ) ( not ( = ?auto_833395 ?auto_833406 ) ) ( not ( = ?auto_833395 ?auto_833407 ) ) ( not ( = ?auto_833395 ?auto_833408 ) ) ( not ( = ?auto_833395 ?auto_833409 ) ) ( not ( = ?auto_833395 ?auto_833410 ) ) ( not ( = ?auto_833396 ?auto_833397 ) ) ( not ( = ?auto_833396 ?auto_833398 ) ) ( not ( = ?auto_833396 ?auto_833399 ) ) ( not ( = ?auto_833396 ?auto_833400 ) ) ( not ( = ?auto_833396 ?auto_833401 ) ) ( not ( = ?auto_833396 ?auto_833402 ) ) ( not ( = ?auto_833396 ?auto_833403 ) ) ( not ( = ?auto_833396 ?auto_833404 ) ) ( not ( = ?auto_833396 ?auto_833405 ) ) ( not ( = ?auto_833396 ?auto_833406 ) ) ( not ( = ?auto_833396 ?auto_833407 ) ) ( not ( = ?auto_833396 ?auto_833408 ) ) ( not ( = ?auto_833396 ?auto_833409 ) ) ( not ( = ?auto_833396 ?auto_833410 ) ) ( not ( = ?auto_833397 ?auto_833398 ) ) ( not ( = ?auto_833397 ?auto_833399 ) ) ( not ( = ?auto_833397 ?auto_833400 ) ) ( not ( = ?auto_833397 ?auto_833401 ) ) ( not ( = ?auto_833397 ?auto_833402 ) ) ( not ( = ?auto_833397 ?auto_833403 ) ) ( not ( = ?auto_833397 ?auto_833404 ) ) ( not ( = ?auto_833397 ?auto_833405 ) ) ( not ( = ?auto_833397 ?auto_833406 ) ) ( not ( = ?auto_833397 ?auto_833407 ) ) ( not ( = ?auto_833397 ?auto_833408 ) ) ( not ( = ?auto_833397 ?auto_833409 ) ) ( not ( = ?auto_833397 ?auto_833410 ) ) ( not ( = ?auto_833398 ?auto_833399 ) ) ( not ( = ?auto_833398 ?auto_833400 ) ) ( not ( = ?auto_833398 ?auto_833401 ) ) ( not ( = ?auto_833398 ?auto_833402 ) ) ( not ( = ?auto_833398 ?auto_833403 ) ) ( not ( = ?auto_833398 ?auto_833404 ) ) ( not ( = ?auto_833398 ?auto_833405 ) ) ( not ( = ?auto_833398 ?auto_833406 ) ) ( not ( = ?auto_833398 ?auto_833407 ) ) ( not ( = ?auto_833398 ?auto_833408 ) ) ( not ( = ?auto_833398 ?auto_833409 ) ) ( not ( = ?auto_833398 ?auto_833410 ) ) ( not ( = ?auto_833399 ?auto_833400 ) ) ( not ( = ?auto_833399 ?auto_833401 ) ) ( not ( = ?auto_833399 ?auto_833402 ) ) ( not ( = ?auto_833399 ?auto_833403 ) ) ( not ( = ?auto_833399 ?auto_833404 ) ) ( not ( = ?auto_833399 ?auto_833405 ) ) ( not ( = ?auto_833399 ?auto_833406 ) ) ( not ( = ?auto_833399 ?auto_833407 ) ) ( not ( = ?auto_833399 ?auto_833408 ) ) ( not ( = ?auto_833399 ?auto_833409 ) ) ( not ( = ?auto_833399 ?auto_833410 ) ) ( not ( = ?auto_833400 ?auto_833401 ) ) ( not ( = ?auto_833400 ?auto_833402 ) ) ( not ( = ?auto_833400 ?auto_833403 ) ) ( not ( = ?auto_833400 ?auto_833404 ) ) ( not ( = ?auto_833400 ?auto_833405 ) ) ( not ( = ?auto_833400 ?auto_833406 ) ) ( not ( = ?auto_833400 ?auto_833407 ) ) ( not ( = ?auto_833400 ?auto_833408 ) ) ( not ( = ?auto_833400 ?auto_833409 ) ) ( not ( = ?auto_833400 ?auto_833410 ) ) ( not ( = ?auto_833401 ?auto_833402 ) ) ( not ( = ?auto_833401 ?auto_833403 ) ) ( not ( = ?auto_833401 ?auto_833404 ) ) ( not ( = ?auto_833401 ?auto_833405 ) ) ( not ( = ?auto_833401 ?auto_833406 ) ) ( not ( = ?auto_833401 ?auto_833407 ) ) ( not ( = ?auto_833401 ?auto_833408 ) ) ( not ( = ?auto_833401 ?auto_833409 ) ) ( not ( = ?auto_833401 ?auto_833410 ) ) ( not ( = ?auto_833402 ?auto_833403 ) ) ( not ( = ?auto_833402 ?auto_833404 ) ) ( not ( = ?auto_833402 ?auto_833405 ) ) ( not ( = ?auto_833402 ?auto_833406 ) ) ( not ( = ?auto_833402 ?auto_833407 ) ) ( not ( = ?auto_833402 ?auto_833408 ) ) ( not ( = ?auto_833402 ?auto_833409 ) ) ( not ( = ?auto_833402 ?auto_833410 ) ) ( not ( = ?auto_833403 ?auto_833404 ) ) ( not ( = ?auto_833403 ?auto_833405 ) ) ( not ( = ?auto_833403 ?auto_833406 ) ) ( not ( = ?auto_833403 ?auto_833407 ) ) ( not ( = ?auto_833403 ?auto_833408 ) ) ( not ( = ?auto_833403 ?auto_833409 ) ) ( not ( = ?auto_833403 ?auto_833410 ) ) ( not ( = ?auto_833404 ?auto_833405 ) ) ( not ( = ?auto_833404 ?auto_833406 ) ) ( not ( = ?auto_833404 ?auto_833407 ) ) ( not ( = ?auto_833404 ?auto_833408 ) ) ( not ( = ?auto_833404 ?auto_833409 ) ) ( not ( = ?auto_833404 ?auto_833410 ) ) ( not ( = ?auto_833405 ?auto_833406 ) ) ( not ( = ?auto_833405 ?auto_833407 ) ) ( not ( = ?auto_833405 ?auto_833408 ) ) ( not ( = ?auto_833405 ?auto_833409 ) ) ( not ( = ?auto_833405 ?auto_833410 ) ) ( not ( = ?auto_833406 ?auto_833407 ) ) ( not ( = ?auto_833406 ?auto_833408 ) ) ( not ( = ?auto_833406 ?auto_833409 ) ) ( not ( = ?auto_833406 ?auto_833410 ) ) ( not ( = ?auto_833407 ?auto_833408 ) ) ( not ( = ?auto_833407 ?auto_833409 ) ) ( not ( = ?auto_833407 ?auto_833410 ) ) ( not ( = ?auto_833408 ?auto_833409 ) ) ( not ( = ?auto_833408 ?auto_833410 ) ) ( not ( = ?auto_833409 ?auto_833410 ) ) ( ON ?auto_833408 ?auto_833409 ) ( ON ?auto_833407 ?auto_833408 ) ( ON ?auto_833406 ?auto_833407 ) ( ON ?auto_833405 ?auto_833406 ) ( ON ?auto_833404 ?auto_833405 ) ( ON ?auto_833403 ?auto_833404 ) ( ON ?auto_833402 ?auto_833403 ) ( CLEAR ?auto_833400 ) ( ON ?auto_833401 ?auto_833402 ) ( CLEAR ?auto_833401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_833394 ?auto_833395 ?auto_833396 ?auto_833397 ?auto_833398 ?auto_833399 ?auto_833400 ?auto_833401 )
      ( MAKE-16PILE ?auto_833394 ?auto_833395 ?auto_833396 ?auto_833397 ?auto_833398 ?auto_833399 ?auto_833400 ?auto_833401 ?auto_833402 ?auto_833403 ?auto_833404 ?auto_833405 ?auto_833406 ?auto_833407 ?auto_833408 ?auto_833409 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_833460 - BLOCK
      ?auto_833461 - BLOCK
      ?auto_833462 - BLOCK
      ?auto_833463 - BLOCK
      ?auto_833464 - BLOCK
      ?auto_833465 - BLOCK
      ?auto_833466 - BLOCK
      ?auto_833467 - BLOCK
      ?auto_833468 - BLOCK
      ?auto_833469 - BLOCK
      ?auto_833470 - BLOCK
      ?auto_833471 - BLOCK
      ?auto_833472 - BLOCK
      ?auto_833473 - BLOCK
      ?auto_833474 - BLOCK
      ?auto_833475 - BLOCK
    )
    :vars
    (
      ?auto_833476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_833475 ?auto_833476 ) ( ON-TABLE ?auto_833460 ) ( ON ?auto_833461 ?auto_833460 ) ( ON ?auto_833462 ?auto_833461 ) ( ON ?auto_833463 ?auto_833462 ) ( ON ?auto_833464 ?auto_833463 ) ( ON ?auto_833465 ?auto_833464 ) ( not ( = ?auto_833460 ?auto_833461 ) ) ( not ( = ?auto_833460 ?auto_833462 ) ) ( not ( = ?auto_833460 ?auto_833463 ) ) ( not ( = ?auto_833460 ?auto_833464 ) ) ( not ( = ?auto_833460 ?auto_833465 ) ) ( not ( = ?auto_833460 ?auto_833466 ) ) ( not ( = ?auto_833460 ?auto_833467 ) ) ( not ( = ?auto_833460 ?auto_833468 ) ) ( not ( = ?auto_833460 ?auto_833469 ) ) ( not ( = ?auto_833460 ?auto_833470 ) ) ( not ( = ?auto_833460 ?auto_833471 ) ) ( not ( = ?auto_833460 ?auto_833472 ) ) ( not ( = ?auto_833460 ?auto_833473 ) ) ( not ( = ?auto_833460 ?auto_833474 ) ) ( not ( = ?auto_833460 ?auto_833475 ) ) ( not ( = ?auto_833460 ?auto_833476 ) ) ( not ( = ?auto_833461 ?auto_833462 ) ) ( not ( = ?auto_833461 ?auto_833463 ) ) ( not ( = ?auto_833461 ?auto_833464 ) ) ( not ( = ?auto_833461 ?auto_833465 ) ) ( not ( = ?auto_833461 ?auto_833466 ) ) ( not ( = ?auto_833461 ?auto_833467 ) ) ( not ( = ?auto_833461 ?auto_833468 ) ) ( not ( = ?auto_833461 ?auto_833469 ) ) ( not ( = ?auto_833461 ?auto_833470 ) ) ( not ( = ?auto_833461 ?auto_833471 ) ) ( not ( = ?auto_833461 ?auto_833472 ) ) ( not ( = ?auto_833461 ?auto_833473 ) ) ( not ( = ?auto_833461 ?auto_833474 ) ) ( not ( = ?auto_833461 ?auto_833475 ) ) ( not ( = ?auto_833461 ?auto_833476 ) ) ( not ( = ?auto_833462 ?auto_833463 ) ) ( not ( = ?auto_833462 ?auto_833464 ) ) ( not ( = ?auto_833462 ?auto_833465 ) ) ( not ( = ?auto_833462 ?auto_833466 ) ) ( not ( = ?auto_833462 ?auto_833467 ) ) ( not ( = ?auto_833462 ?auto_833468 ) ) ( not ( = ?auto_833462 ?auto_833469 ) ) ( not ( = ?auto_833462 ?auto_833470 ) ) ( not ( = ?auto_833462 ?auto_833471 ) ) ( not ( = ?auto_833462 ?auto_833472 ) ) ( not ( = ?auto_833462 ?auto_833473 ) ) ( not ( = ?auto_833462 ?auto_833474 ) ) ( not ( = ?auto_833462 ?auto_833475 ) ) ( not ( = ?auto_833462 ?auto_833476 ) ) ( not ( = ?auto_833463 ?auto_833464 ) ) ( not ( = ?auto_833463 ?auto_833465 ) ) ( not ( = ?auto_833463 ?auto_833466 ) ) ( not ( = ?auto_833463 ?auto_833467 ) ) ( not ( = ?auto_833463 ?auto_833468 ) ) ( not ( = ?auto_833463 ?auto_833469 ) ) ( not ( = ?auto_833463 ?auto_833470 ) ) ( not ( = ?auto_833463 ?auto_833471 ) ) ( not ( = ?auto_833463 ?auto_833472 ) ) ( not ( = ?auto_833463 ?auto_833473 ) ) ( not ( = ?auto_833463 ?auto_833474 ) ) ( not ( = ?auto_833463 ?auto_833475 ) ) ( not ( = ?auto_833463 ?auto_833476 ) ) ( not ( = ?auto_833464 ?auto_833465 ) ) ( not ( = ?auto_833464 ?auto_833466 ) ) ( not ( = ?auto_833464 ?auto_833467 ) ) ( not ( = ?auto_833464 ?auto_833468 ) ) ( not ( = ?auto_833464 ?auto_833469 ) ) ( not ( = ?auto_833464 ?auto_833470 ) ) ( not ( = ?auto_833464 ?auto_833471 ) ) ( not ( = ?auto_833464 ?auto_833472 ) ) ( not ( = ?auto_833464 ?auto_833473 ) ) ( not ( = ?auto_833464 ?auto_833474 ) ) ( not ( = ?auto_833464 ?auto_833475 ) ) ( not ( = ?auto_833464 ?auto_833476 ) ) ( not ( = ?auto_833465 ?auto_833466 ) ) ( not ( = ?auto_833465 ?auto_833467 ) ) ( not ( = ?auto_833465 ?auto_833468 ) ) ( not ( = ?auto_833465 ?auto_833469 ) ) ( not ( = ?auto_833465 ?auto_833470 ) ) ( not ( = ?auto_833465 ?auto_833471 ) ) ( not ( = ?auto_833465 ?auto_833472 ) ) ( not ( = ?auto_833465 ?auto_833473 ) ) ( not ( = ?auto_833465 ?auto_833474 ) ) ( not ( = ?auto_833465 ?auto_833475 ) ) ( not ( = ?auto_833465 ?auto_833476 ) ) ( not ( = ?auto_833466 ?auto_833467 ) ) ( not ( = ?auto_833466 ?auto_833468 ) ) ( not ( = ?auto_833466 ?auto_833469 ) ) ( not ( = ?auto_833466 ?auto_833470 ) ) ( not ( = ?auto_833466 ?auto_833471 ) ) ( not ( = ?auto_833466 ?auto_833472 ) ) ( not ( = ?auto_833466 ?auto_833473 ) ) ( not ( = ?auto_833466 ?auto_833474 ) ) ( not ( = ?auto_833466 ?auto_833475 ) ) ( not ( = ?auto_833466 ?auto_833476 ) ) ( not ( = ?auto_833467 ?auto_833468 ) ) ( not ( = ?auto_833467 ?auto_833469 ) ) ( not ( = ?auto_833467 ?auto_833470 ) ) ( not ( = ?auto_833467 ?auto_833471 ) ) ( not ( = ?auto_833467 ?auto_833472 ) ) ( not ( = ?auto_833467 ?auto_833473 ) ) ( not ( = ?auto_833467 ?auto_833474 ) ) ( not ( = ?auto_833467 ?auto_833475 ) ) ( not ( = ?auto_833467 ?auto_833476 ) ) ( not ( = ?auto_833468 ?auto_833469 ) ) ( not ( = ?auto_833468 ?auto_833470 ) ) ( not ( = ?auto_833468 ?auto_833471 ) ) ( not ( = ?auto_833468 ?auto_833472 ) ) ( not ( = ?auto_833468 ?auto_833473 ) ) ( not ( = ?auto_833468 ?auto_833474 ) ) ( not ( = ?auto_833468 ?auto_833475 ) ) ( not ( = ?auto_833468 ?auto_833476 ) ) ( not ( = ?auto_833469 ?auto_833470 ) ) ( not ( = ?auto_833469 ?auto_833471 ) ) ( not ( = ?auto_833469 ?auto_833472 ) ) ( not ( = ?auto_833469 ?auto_833473 ) ) ( not ( = ?auto_833469 ?auto_833474 ) ) ( not ( = ?auto_833469 ?auto_833475 ) ) ( not ( = ?auto_833469 ?auto_833476 ) ) ( not ( = ?auto_833470 ?auto_833471 ) ) ( not ( = ?auto_833470 ?auto_833472 ) ) ( not ( = ?auto_833470 ?auto_833473 ) ) ( not ( = ?auto_833470 ?auto_833474 ) ) ( not ( = ?auto_833470 ?auto_833475 ) ) ( not ( = ?auto_833470 ?auto_833476 ) ) ( not ( = ?auto_833471 ?auto_833472 ) ) ( not ( = ?auto_833471 ?auto_833473 ) ) ( not ( = ?auto_833471 ?auto_833474 ) ) ( not ( = ?auto_833471 ?auto_833475 ) ) ( not ( = ?auto_833471 ?auto_833476 ) ) ( not ( = ?auto_833472 ?auto_833473 ) ) ( not ( = ?auto_833472 ?auto_833474 ) ) ( not ( = ?auto_833472 ?auto_833475 ) ) ( not ( = ?auto_833472 ?auto_833476 ) ) ( not ( = ?auto_833473 ?auto_833474 ) ) ( not ( = ?auto_833473 ?auto_833475 ) ) ( not ( = ?auto_833473 ?auto_833476 ) ) ( not ( = ?auto_833474 ?auto_833475 ) ) ( not ( = ?auto_833474 ?auto_833476 ) ) ( not ( = ?auto_833475 ?auto_833476 ) ) ( ON ?auto_833474 ?auto_833475 ) ( ON ?auto_833473 ?auto_833474 ) ( ON ?auto_833472 ?auto_833473 ) ( ON ?auto_833471 ?auto_833472 ) ( ON ?auto_833470 ?auto_833471 ) ( ON ?auto_833469 ?auto_833470 ) ( ON ?auto_833468 ?auto_833469 ) ( ON ?auto_833467 ?auto_833468 ) ( CLEAR ?auto_833465 ) ( ON ?auto_833466 ?auto_833467 ) ( CLEAR ?auto_833466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_833460 ?auto_833461 ?auto_833462 ?auto_833463 ?auto_833464 ?auto_833465 ?auto_833466 )
      ( MAKE-16PILE ?auto_833460 ?auto_833461 ?auto_833462 ?auto_833463 ?auto_833464 ?auto_833465 ?auto_833466 ?auto_833467 ?auto_833468 ?auto_833469 ?auto_833470 ?auto_833471 ?auto_833472 ?auto_833473 ?auto_833474 ?auto_833475 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_833526 - BLOCK
      ?auto_833527 - BLOCK
      ?auto_833528 - BLOCK
      ?auto_833529 - BLOCK
      ?auto_833530 - BLOCK
      ?auto_833531 - BLOCK
      ?auto_833532 - BLOCK
      ?auto_833533 - BLOCK
      ?auto_833534 - BLOCK
      ?auto_833535 - BLOCK
      ?auto_833536 - BLOCK
      ?auto_833537 - BLOCK
      ?auto_833538 - BLOCK
      ?auto_833539 - BLOCK
      ?auto_833540 - BLOCK
      ?auto_833541 - BLOCK
    )
    :vars
    (
      ?auto_833542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_833541 ?auto_833542 ) ( ON-TABLE ?auto_833526 ) ( ON ?auto_833527 ?auto_833526 ) ( ON ?auto_833528 ?auto_833527 ) ( ON ?auto_833529 ?auto_833528 ) ( ON ?auto_833530 ?auto_833529 ) ( not ( = ?auto_833526 ?auto_833527 ) ) ( not ( = ?auto_833526 ?auto_833528 ) ) ( not ( = ?auto_833526 ?auto_833529 ) ) ( not ( = ?auto_833526 ?auto_833530 ) ) ( not ( = ?auto_833526 ?auto_833531 ) ) ( not ( = ?auto_833526 ?auto_833532 ) ) ( not ( = ?auto_833526 ?auto_833533 ) ) ( not ( = ?auto_833526 ?auto_833534 ) ) ( not ( = ?auto_833526 ?auto_833535 ) ) ( not ( = ?auto_833526 ?auto_833536 ) ) ( not ( = ?auto_833526 ?auto_833537 ) ) ( not ( = ?auto_833526 ?auto_833538 ) ) ( not ( = ?auto_833526 ?auto_833539 ) ) ( not ( = ?auto_833526 ?auto_833540 ) ) ( not ( = ?auto_833526 ?auto_833541 ) ) ( not ( = ?auto_833526 ?auto_833542 ) ) ( not ( = ?auto_833527 ?auto_833528 ) ) ( not ( = ?auto_833527 ?auto_833529 ) ) ( not ( = ?auto_833527 ?auto_833530 ) ) ( not ( = ?auto_833527 ?auto_833531 ) ) ( not ( = ?auto_833527 ?auto_833532 ) ) ( not ( = ?auto_833527 ?auto_833533 ) ) ( not ( = ?auto_833527 ?auto_833534 ) ) ( not ( = ?auto_833527 ?auto_833535 ) ) ( not ( = ?auto_833527 ?auto_833536 ) ) ( not ( = ?auto_833527 ?auto_833537 ) ) ( not ( = ?auto_833527 ?auto_833538 ) ) ( not ( = ?auto_833527 ?auto_833539 ) ) ( not ( = ?auto_833527 ?auto_833540 ) ) ( not ( = ?auto_833527 ?auto_833541 ) ) ( not ( = ?auto_833527 ?auto_833542 ) ) ( not ( = ?auto_833528 ?auto_833529 ) ) ( not ( = ?auto_833528 ?auto_833530 ) ) ( not ( = ?auto_833528 ?auto_833531 ) ) ( not ( = ?auto_833528 ?auto_833532 ) ) ( not ( = ?auto_833528 ?auto_833533 ) ) ( not ( = ?auto_833528 ?auto_833534 ) ) ( not ( = ?auto_833528 ?auto_833535 ) ) ( not ( = ?auto_833528 ?auto_833536 ) ) ( not ( = ?auto_833528 ?auto_833537 ) ) ( not ( = ?auto_833528 ?auto_833538 ) ) ( not ( = ?auto_833528 ?auto_833539 ) ) ( not ( = ?auto_833528 ?auto_833540 ) ) ( not ( = ?auto_833528 ?auto_833541 ) ) ( not ( = ?auto_833528 ?auto_833542 ) ) ( not ( = ?auto_833529 ?auto_833530 ) ) ( not ( = ?auto_833529 ?auto_833531 ) ) ( not ( = ?auto_833529 ?auto_833532 ) ) ( not ( = ?auto_833529 ?auto_833533 ) ) ( not ( = ?auto_833529 ?auto_833534 ) ) ( not ( = ?auto_833529 ?auto_833535 ) ) ( not ( = ?auto_833529 ?auto_833536 ) ) ( not ( = ?auto_833529 ?auto_833537 ) ) ( not ( = ?auto_833529 ?auto_833538 ) ) ( not ( = ?auto_833529 ?auto_833539 ) ) ( not ( = ?auto_833529 ?auto_833540 ) ) ( not ( = ?auto_833529 ?auto_833541 ) ) ( not ( = ?auto_833529 ?auto_833542 ) ) ( not ( = ?auto_833530 ?auto_833531 ) ) ( not ( = ?auto_833530 ?auto_833532 ) ) ( not ( = ?auto_833530 ?auto_833533 ) ) ( not ( = ?auto_833530 ?auto_833534 ) ) ( not ( = ?auto_833530 ?auto_833535 ) ) ( not ( = ?auto_833530 ?auto_833536 ) ) ( not ( = ?auto_833530 ?auto_833537 ) ) ( not ( = ?auto_833530 ?auto_833538 ) ) ( not ( = ?auto_833530 ?auto_833539 ) ) ( not ( = ?auto_833530 ?auto_833540 ) ) ( not ( = ?auto_833530 ?auto_833541 ) ) ( not ( = ?auto_833530 ?auto_833542 ) ) ( not ( = ?auto_833531 ?auto_833532 ) ) ( not ( = ?auto_833531 ?auto_833533 ) ) ( not ( = ?auto_833531 ?auto_833534 ) ) ( not ( = ?auto_833531 ?auto_833535 ) ) ( not ( = ?auto_833531 ?auto_833536 ) ) ( not ( = ?auto_833531 ?auto_833537 ) ) ( not ( = ?auto_833531 ?auto_833538 ) ) ( not ( = ?auto_833531 ?auto_833539 ) ) ( not ( = ?auto_833531 ?auto_833540 ) ) ( not ( = ?auto_833531 ?auto_833541 ) ) ( not ( = ?auto_833531 ?auto_833542 ) ) ( not ( = ?auto_833532 ?auto_833533 ) ) ( not ( = ?auto_833532 ?auto_833534 ) ) ( not ( = ?auto_833532 ?auto_833535 ) ) ( not ( = ?auto_833532 ?auto_833536 ) ) ( not ( = ?auto_833532 ?auto_833537 ) ) ( not ( = ?auto_833532 ?auto_833538 ) ) ( not ( = ?auto_833532 ?auto_833539 ) ) ( not ( = ?auto_833532 ?auto_833540 ) ) ( not ( = ?auto_833532 ?auto_833541 ) ) ( not ( = ?auto_833532 ?auto_833542 ) ) ( not ( = ?auto_833533 ?auto_833534 ) ) ( not ( = ?auto_833533 ?auto_833535 ) ) ( not ( = ?auto_833533 ?auto_833536 ) ) ( not ( = ?auto_833533 ?auto_833537 ) ) ( not ( = ?auto_833533 ?auto_833538 ) ) ( not ( = ?auto_833533 ?auto_833539 ) ) ( not ( = ?auto_833533 ?auto_833540 ) ) ( not ( = ?auto_833533 ?auto_833541 ) ) ( not ( = ?auto_833533 ?auto_833542 ) ) ( not ( = ?auto_833534 ?auto_833535 ) ) ( not ( = ?auto_833534 ?auto_833536 ) ) ( not ( = ?auto_833534 ?auto_833537 ) ) ( not ( = ?auto_833534 ?auto_833538 ) ) ( not ( = ?auto_833534 ?auto_833539 ) ) ( not ( = ?auto_833534 ?auto_833540 ) ) ( not ( = ?auto_833534 ?auto_833541 ) ) ( not ( = ?auto_833534 ?auto_833542 ) ) ( not ( = ?auto_833535 ?auto_833536 ) ) ( not ( = ?auto_833535 ?auto_833537 ) ) ( not ( = ?auto_833535 ?auto_833538 ) ) ( not ( = ?auto_833535 ?auto_833539 ) ) ( not ( = ?auto_833535 ?auto_833540 ) ) ( not ( = ?auto_833535 ?auto_833541 ) ) ( not ( = ?auto_833535 ?auto_833542 ) ) ( not ( = ?auto_833536 ?auto_833537 ) ) ( not ( = ?auto_833536 ?auto_833538 ) ) ( not ( = ?auto_833536 ?auto_833539 ) ) ( not ( = ?auto_833536 ?auto_833540 ) ) ( not ( = ?auto_833536 ?auto_833541 ) ) ( not ( = ?auto_833536 ?auto_833542 ) ) ( not ( = ?auto_833537 ?auto_833538 ) ) ( not ( = ?auto_833537 ?auto_833539 ) ) ( not ( = ?auto_833537 ?auto_833540 ) ) ( not ( = ?auto_833537 ?auto_833541 ) ) ( not ( = ?auto_833537 ?auto_833542 ) ) ( not ( = ?auto_833538 ?auto_833539 ) ) ( not ( = ?auto_833538 ?auto_833540 ) ) ( not ( = ?auto_833538 ?auto_833541 ) ) ( not ( = ?auto_833538 ?auto_833542 ) ) ( not ( = ?auto_833539 ?auto_833540 ) ) ( not ( = ?auto_833539 ?auto_833541 ) ) ( not ( = ?auto_833539 ?auto_833542 ) ) ( not ( = ?auto_833540 ?auto_833541 ) ) ( not ( = ?auto_833540 ?auto_833542 ) ) ( not ( = ?auto_833541 ?auto_833542 ) ) ( ON ?auto_833540 ?auto_833541 ) ( ON ?auto_833539 ?auto_833540 ) ( ON ?auto_833538 ?auto_833539 ) ( ON ?auto_833537 ?auto_833538 ) ( ON ?auto_833536 ?auto_833537 ) ( ON ?auto_833535 ?auto_833536 ) ( ON ?auto_833534 ?auto_833535 ) ( ON ?auto_833533 ?auto_833534 ) ( ON ?auto_833532 ?auto_833533 ) ( CLEAR ?auto_833530 ) ( ON ?auto_833531 ?auto_833532 ) ( CLEAR ?auto_833531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_833526 ?auto_833527 ?auto_833528 ?auto_833529 ?auto_833530 ?auto_833531 )
      ( MAKE-16PILE ?auto_833526 ?auto_833527 ?auto_833528 ?auto_833529 ?auto_833530 ?auto_833531 ?auto_833532 ?auto_833533 ?auto_833534 ?auto_833535 ?auto_833536 ?auto_833537 ?auto_833538 ?auto_833539 ?auto_833540 ?auto_833541 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_833592 - BLOCK
      ?auto_833593 - BLOCK
      ?auto_833594 - BLOCK
      ?auto_833595 - BLOCK
      ?auto_833596 - BLOCK
      ?auto_833597 - BLOCK
      ?auto_833598 - BLOCK
      ?auto_833599 - BLOCK
      ?auto_833600 - BLOCK
      ?auto_833601 - BLOCK
      ?auto_833602 - BLOCK
      ?auto_833603 - BLOCK
      ?auto_833604 - BLOCK
      ?auto_833605 - BLOCK
      ?auto_833606 - BLOCK
      ?auto_833607 - BLOCK
    )
    :vars
    (
      ?auto_833608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_833607 ?auto_833608 ) ( ON-TABLE ?auto_833592 ) ( ON ?auto_833593 ?auto_833592 ) ( ON ?auto_833594 ?auto_833593 ) ( ON ?auto_833595 ?auto_833594 ) ( not ( = ?auto_833592 ?auto_833593 ) ) ( not ( = ?auto_833592 ?auto_833594 ) ) ( not ( = ?auto_833592 ?auto_833595 ) ) ( not ( = ?auto_833592 ?auto_833596 ) ) ( not ( = ?auto_833592 ?auto_833597 ) ) ( not ( = ?auto_833592 ?auto_833598 ) ) ( not ( = ?auto_833592 ?auto_833599 ) ) ( not ( = ?auto_833592 ?auto_833600 ) ) ( not ( = ?auto_833592 ?auto_833601 ) ) ( not ( = ?auto_833592 ?auto_833602 ) ) ( not ( = ?auto_833592 ?auto_833603 ) ) ( not ( = ?auto_833592 ?auto_833604 ) ) ( not ( = ?auto_833592 ?auto_833605 ) ) ( not ( = ?auto_833592 ?auto_833606 ) ) ( not ( = ?auto_833592 ?auto_833607 ) ) ( not ( = ?auto_833592 ?auto_833608 ) ) ( not ( = ?auto_833593 ?auto_833594 ) ) ( not ( = ?auto_833593 ?auto_833595 ) ) ( not ( = ?auto_833593 ?auto_833596 ) ) ( not ( = ?auto_833593 ?auto_833597 ) ) ( not ( = ?auto_833593 ?auto_833598 ) ) ( not ( = ?auto_833593 ?auto_833599 ) ) ( not ( = ?auto_833593 ?auto_833600 ) ) ( not ( = ?auto_833593 ?auto_833601 ) ) ( not ( = ?auto_833593 ?auto_833602 ) ) ( not ( = ?auto_833593 ?auto_833603 ) ) ( not ( = ?auto_833593 ?auto_833604 ) ) ( not ( = ?auto_833593 ?auto_833605 ) ) ( not ( = ?auto_833593 ?auto_833606 ) ) ( not ( = ?auto_833593 ?auto_833607 ) ) ( not ( = ?auto_833593 ?auto_833608 ) ) ( not ( = ?auto_833594 ?auto_833595 ) ) ( not ( = ?auto_833594 ?auto_833596 ) ) ( not ( = ?auto_833594 ?auto_833597 ) ) ( not ( = ?auto_833594 ?auto_833598 ) ) ( not ( = ?auto_833594 ?auto_833599 ) ) ( not ( = ?auto_833594 ?auto_833600 ) ) ( not ( = ?auto_833594 ?auto_833601 ) ) ( not ( = ?auto_833594 ?auto_833602 ) ) ( not ( = ?auto_833594 ?auto_833603 ) ) ( not ( = ?auto_833594 ?auto_833604 ) ) ( not ( = ?auto_833594 ?auto_833605 ) ) ( not ( = ?auto_833594 ?auto_833606 ) ) ( not ( = ?auto_833594 ?auto_833607 ) ) ( not ( = ?auto_833594 ?auto_833608 ) ) ( not ( = ?auto_833595 ?auto_833596 ) ) ( not ( = ?auto_833595 ?auto_833597 ) ) ( not ( = ?auto_833595 ?auto_833598 ) ) ( not ( = ?auto_833595 ?auto_833599 ) ) ( not ( = ?auto_833595 ?auto_833600 ) ) ( not ( = ?auto_833595 ?auto_833601 ) ) ( not ( = ?auto_833595 ?auto_833602 ) ) ( not ( = ?auto_833595 ?auto_833603 ) ) ( not ( = ?auto_833595 ?auto_833604 ) ) ( not ( = ?auto_833595 ?auto_833605 ) ) ( not ( = ?auto_833595 ?auto_833606 ) ) ( not ( = ?auto_833595 ?auto_833607 ) ) ( not ( = ?auto_833595 ?auto_833608 ) ) ( not ( = ?auto_833596 ?auto_833597 ) ) ( not ( = ?auto_833596 ?auto_833598 ) ) ( not ( = ?auto_833596 ?auto_833599 ) ) ( not ( = ?auto_833596 ?auto_833600 ) ) ( not ( = ?auto_833596 ?auto_833601 ) ) ( not ( = ?auto_833596 ?auto_833602 ) ) ( not ( = ?auto_833596 ?auto_833603 ) ) ( not ( = ?auto_833596 ?auto_833604 ) ) ( not ( = ?auto_833596 ?auto_833605 ) ) ( not ( = ?auto_833596 ?auto_833606 ) ) ( not ( = ?auto_833596 ?auto_833607 ) ) ( not ( = ?auto_833596 ?auto_833608 ) ) ( not ( = ?auto_833597 ?auto_833598 ) ) ( not ( = ?auto_833597 ?auto_833599 ) ) ( not ( = ?auto_833597 ?auto_833600 ) ) ( not ( = ?auto_833597 ?auto_833601 ) ) ( not ( = ?auto_833597 ?auto_833602 ) ) ( not ( = ?auto_833597 ?auto_833603 ) ) ( not ( = ?auto_833597 ?auto_833604 ) ) ( not ( = ?auto_833597 ?auto_833605 ) ) ( not ( = ?auto_833597 ?auto_833606 ) ) ( not ( = ?auto_833597 ?auto_833607 ) ) ( not ( = ?auto_833597 ?auto_833608 ) ) ( not ( = ?auto_833598 ?auto_833599 ) ) ( not ( = ?auto_833598 ?auto_833600 ) ) ( not ( = ?auto_833598 ?auto_833601 ) ) ( not ( = ?auto_833598 ?auto_833602 ) ) ( not ( = ?auto_833598 ?auto_833603 ) ) ( not ( = ?auto_833598 ?auto_833604 ) ) ( not ( = ?auto_833598 ?auto_833605 ) ) ( not ( = ?auto_833598 ?auto_833606 ) ) ( not ( = ?auto_833598 ?auto_833607 ) ) ( not ( = ?auto_833598 ?auto_833608 ) ) ( not ( = ?auto_833599 ?auto_833600 ) ) ( not ( = ?auto_833599 ?auto_833601 ) ) ( not ( = ?auto_833599 ?auto_833602 ) ) ( not ( = ?auto_833599 ?auto_833603 ) ) ( not ( = ?auto_833599 ?auto_833604 ) ) ( not ( = ?auto_833599 ?auto_833605 ) ) ( not ( = ?auto_833599 ?auto_833606 ) ) ( not ( = ?auto_833599 ?auto_833607 ) ) ( not ( = ?auto_833599 ?auto_833608 ) ) ( not ( = ?auto_833600 ?auto_833601 ) ) ( not ( = ?auto_833600 ?auto_833602 ) ) ( not ( = ?auto_833600 ?auto_833603 ) ) ( not ( = ?auto_833600 ?auto_833604 ) ) ( not ( = ?auto_833600 ?auto_833605 ) ) ( not ( = ?auto_833600 ?auto_833606 ) ) ( not ( = ?auto_833600 ?auto_833607 ) ) ( not ( = ?auto_833600 ?auto_833608 ) ) ( not ( = ?auto_833601 ?auto_833602 ) ) ( not ( = ?auto_833601 ?auto_833603 ) ) ( not ( = ?auto_833601 ?auto_833604 ) ) ( not ( = ?auto_833601 ?auto_833605 ) ) ( not ( = ?auto_833601 ?auto_833606 ) ) ( not ( = ?auto_833601 ?auto_833607 ) ) ( not ( = ?auto_833601 ?auto_833608 ) ) ( not ( = ?auto_833602 ?auto_833603 ) ) ( not ( = ?auto_833602 ?auto_833604 ) ) ( not ( = ?auto_833602 ?auto_833605 ) ) ( not ( = ?auto_833602 ?auto_833606 ) ) ( not ( = ?auto_833602 ?auto_833607 ) ) ( not ( = ?auto_833602 ?auto_833608 ) ) ( not ( = ?auto_833603 ?auto_833604 ) ) ( not ( = ?auto_833603 ?auto_833605 ) ) ( not ( = ?auto_833603 ?auto_833606 ) ) ( not ( = ?auto_833603 ?auto_833607 ) ) ( not ( = ?auto_833603 ?auto_833608 ) ) ( not ( = ?auto_833604 ?auto_833605 ) ) ( not ( = ?auto_833604 ?auto_833606 ) ) ( not ( = ?auto_833604 ?auto_833607 ) ) ( not ( = ?auto_833604 ?auto_833608 ) ) ( not ( = ?auto_833605 ?auto_833606 ) ) ( not ( = ?auto_833605 ?auto_833607 ) ) ( not ( = ?auto_833605 ?auto_833608 ) ) ( not ( = ?auto_833606 ?auto_833607 ) ) ( not ( = ?auto_833606 ?auto_833608 ) ) ( not ( = ?auto_833607 ?auto_833608 ) ) ( ON ?auto_833606 ?auto_833607 ) ( ON ?auto_833605 ?auto_833606 ) ( ON ?auto_833604 ?auto_833605 ) ( ON ?auto_833603 ?auto_833604 ) ( ON ?auto_833602 ?auto_833603 ) ( ON ?auto_833601 ?auto_833602 ) ( ON ?auto_833600 ?auto_833601 ) ( ON ?auto_833599 ?auto_833600 ) ( ON ?auto_833598 ?auto_833599 ) ( ON ?auto_833597 ?auto_833598 ) ( CLEAR ?auto_833595 ) ( ON ?auto_833596 ?auto_833597 ) ( CLEAR ?auto_833596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_833592 ?auto_833593 ?auto_833594 ?auto_833595 ?auto_833596 )
      ( MAKE-16PILE ?auto_833592 ?auto_833593 ?auto_833594 ?auto_833595 ?auto_833596 ?auto_833597 ?auto_833598 ?auto_833599 ?auto_833600 ?auto_833601 ?auto_833602 ?auto_833603 ?auto_833604 ?auto_833605 ?auto_833606 ?auto_833607 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_833658 - BLOCK
      ?auto_833659 - BLOCK
      ?auto_833660 - BLOCK
      ?auto_833661 - BLOCK
      ?auto_833662 - BLOCK
      ?auto_833663 - BLOCK
      ?auto_833664 - BLOCK
      ?auto_833665 - BLOCK
      ?auto_833666 - BLOCK
      ?auto_833667 - BLOCK
      ?auto_833668 - BLOCK
      ?auto_833669 - BLOCK
      ?auto_833670 - BLOCK
      ?auto_833671 - BLOCK
      ?auto_833672 - BLOCK
      ?auto_833673 - BLOCK
    )
    :vars
    (
      ?auto_833674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_833673 ?auto_833674 ) ( ON-TABLE ?auto_833658 ) ( ON ?auto_833659 ?auto_833658 ) ( ON ?auto_833660 ?auto_833659 ) ( not ( = ?auto_833658 ?auto_833659 ) ) ( not ( = ?auto_833658 ?auto_833660 ) ) ( not ( = ?auto_833658 ?auto_833661 ) ) ( not ( = ?auto_833658 ?auto_833662 ) ) ( not ( = ?auto_833658 ?auto_833663 ) ) ( not ( = ?auto_833658 ?auto_833664 ) ) ( not ( = ?auto_833658 ?auto_833665 ) ) ( not ( = ?auto_833658 ?auto_833666 ) ) ( not ( = ?auto_833658 ?auto_833667 ) ) ( not ( = ?auto_833658 ?auto_833668 ) ) ( not ( = ?auto_833658 ?auto_833669 ) ) ( not ( = ?auto_833658 ?auto_833670 ) ) ( not ( = ?auto_833658 ?auto_833671 ) ) ( not ( = ?auto_833658 ?auto_833672 ) ) ( not ( = ?auto_833658 ?auto_833673 ) ) ( not ( = ?auto_833658 ?auto_833674 ) ) ( not ( = ?auto_833659 ?auto_833660 ) ) ( not ( = ?auto_833659 ?auto_833661 ) ) ( not ( = ?auto_833659 ?auto_833662 ) ) ( not ( = ?auto_833659 ?auto_833663 ) ) ( not ( = ?auto_833659 ?auto_833664 ) ) ( not ( = ?auto_833659 ?auto_833665 ) ) ( not ( = ?auto_833659 ?auto_833666 ) ) ( not ( = ?auto_833659 ?auto_833667 ) ) ( not ( = ?auto_833659 ?auto_833668 ) ) ( not ( = ?auto_833659 ?auto_833669 ) ) ( not ( = ?auto_833659 ?auto_833670 ) ) ( not ( = ?auto_833659 ?auto_833671 ) ) ( not ( = ?auto_833659 ?auto_833672 ) ) ( not ( = ?auto_833659 ?auto_833673 ) ) ( not ( = ?auto_833659 ?auto_833674 ) ) ( not ( = ?auto_833660 ?auto_833661 ) ) ( not ( = ?auto_833660 ?auto_833662 ) ) ( not ( = ?auto_833660 ?auto_833663 ) ) ( not ( = ?auto_833660 ?auto_833664 ) ) ( not ( = ?auto_833660 ?auto_833665 ) ) ( not ( = ?auto_833660 ?auto_833666 ) ) ( not ( = ?auto_833660 ?auto_833667 ) ) ( not ( = ?auto_833660 ?auto_833668 ) ) ( not ( = ?auto_833660 ?auto_833669 ) ) ( not ( = ?auto_833660 ?auto_833670 ) ) ( not ( = ?auto_833660 ?auto_833671 ) ) ( not ( = ?auto_833660 ?auto_833672 ) ) ( not ( = ?auto_833660 ?auto_833673 ) ) ( not ( = ?auto_833660 ?auto_833674 ) ) ( not ( = ?auto_833661 ?auto_833662 ) ) ( not ( = ?auto_833661 ?auto_833663 ) ) ( not ( = ?auto_833661 ?auto_833664 ) ) ( not ( = ?auto_833661 ?auto_833665 ) ) ( not ( = ?auto_833661 ?auto_833666 ) ) ( not ( = ?auto_833661 ?auto_833667 ) ) ( not ( = ?auto_833661 ?auto_833668 ) ) ( not ( = ?auto_833661 ?auto_833669 ) ) ( not ( = ?auto_833661 ?auto_833670 ) ) ( not ( = ?auto_833661 ?auto_833671 ) ) ( not ( = ?auto_833661 ?auto_833672 ) ) ( not ( = ?auto_833661 ?auto_833673 ) ) ( not ( = ?auto_833661 ?auto_833674 ) ) ( not ( = ?auto_833662 ?auto_833663 ) ) ( not ( = ?auto_833662 ?auto_833664 ) ) ( not ( = ?auto_833662 ?auto_833665 ) ) ( not ( = ?auto_833662 ?auto_833666 ) ) ( not ( = ?auto_833662 ?auto_833667 ) ) ( not ( = ?auto_833662 ?auto_833668 ) ) ( not ( = ?auto_833662 ?auto_833669 ) ) ( not ( = ?auto_833662 ?auto_833670 ) ) ( not ( = ?auto_833662 ?auto_833671 ) ) ( not ( = ?auto_833662 ?auto_833672 ) ) ( not ( = ?auto_833662 ?auto_833673 ) ) ( not ( = ?auto_833662 ?auto_833674 ) ) ( not ( = ?auto_833663 ?auto_833664 ) ) ( not ( = ?auto_833663 ?auto_833665 ) ) ( not ( = ?auto_833663 ?auto_833666 ) ) ( not ( = ?auto_833663 ?auto_833667 ) ) ( not ( = ?auto_833663 ?auto_833668 ) ) ( not ( = ?auto_833663 ?auto_833669 ) ) ( not ( = ?auto_833663 ?auto_833670 ) ) ( not ( = ?auto_833663 ?auto_833671 ) ) ( not ( = ?auto_833663 ?auto_833672 ) ) ( not ( = ?auto_833663 ?auto_833673 ) ) ( not ( = ?auto_833663 ?auto_833674 ) ) ( not ( = ?auto_833664 ?auto_833665 ) ) ( not ( = ?auto_833664 ?auto_833666 ) ) ( not ( = ?auto_833664 ?auto_833667 ) ) ( not ( = ?auto_833664 ?auto_833668 ) ) ( not ( = ?auto_833664 ?auto_833669 ) ) ( not ( = ?auto_833664 ?auto_833670 ) ) ( not ( = ?auto_833664 ?auto_833671 ) ) ( not ( = ?auto_833664 ?auto_833672 ) ) ( not ( = ?auto_833664 ?auto_833673 ) ) ( not ( = ?auto_833664 ?auto_833674 ) ) ( not ( = ?auto_833665 ?auto_833666 ) ) ( not ( = ?auto_833665 ?auto_833667 ) ) ( not ( = ?auto_833665 ?auto_833668 ) ) ( not ( = ?auto_833665 ?auto_833669 ) ) ( not ( = ?auto_833665 ?auto_833670 ) ) ( not ( = ?auto_833665 ?auto_833671 ) ) ( not ( = ?auto_833665 ?auto_833672 ) ) ( not ( = ?auto_833665 ?auto_833673 ) ) ( not ( = ?auto_833665 ?auto_833674 ) ) ( not ( = ?auto_833666 ?auto_833667 ) ) ( not ( = ?auto_833666 ?auto_833668 ) ) ( not ( = ?auto_833666 ?auto_833669 ) ) ( not ( = ?auto_833666 ?auto_833670 ) ) ( not ( = ?auto_833666 ?auto_833671 ) ) ( not ( = ?auto_833666 ?auto_833672 ) ) ( not ( = ?auto_833666 ?auto_833673 ) ) ( not ( = ?auto_833666 ?auto_833674 ) ) ( not ( = ?auto_833667 ?auto_833668 ) ) ( not ( = ?auto_833667 ?auto_833669 ) ) ( not ( = ?auto_833667 ?auto_833670 ) ) ( not ( = ?auto_833667 ?auto_833671 ) ) ( not ( = ?auto_833667 ?auto_833672 ) ) ( not ( = ?auto_833667 ?auto_833673 ) ) ( not ( = ?auto_833667 ?auto_833674 ) ) ( not ( = ?auto_833668 ?auto_833669 ) ) ( not ( = ?auto_833668 ?auto_833670 ) ) ( not ( = ?auto_833668 ?auto_833671 ) ) ( not ( = ?auto_833668 ?auto_833672 ) ) ( not ( = ?auto_833668 ?auto_833673 ) ) ( not ( = ?auto_833668 ?auto_833674 ) ) ( not ( = ?auto_833669 ?auto_833670 ) ) ( not ( = ?auto_833669 ?auto_833671 ) ) ( not ( = ?auto_833669 ?auto_833672 ) ) ( not ( = ?auto_833669 ?auto_833673 ) ) ( not ( = ?auto_833669 ?auto_833674 ) ) ( not ( = ?auto_833670 ?auto_833671 ) ) ( not ( = ?auto_833670 ?auto_833672 ) ) ( not ( = ?auto_833670 ?auto_833673 ) ) ( not ( = ?auto_833670 ?auto_833674 ) ) ( not ( = ?auto_833671 ?auto_833672 ) ) ( not ( = ?auto_833671 ?auto_833673 ) ) ( not ( = ?auto_833671 ?auto_833674 ) ) ( not ( = ?auto_833672 ?auto_833673 ) ) ( not ( = ?auto_833672 ?auto_833674 ) ) ( not ( = ?auto_833673 ?auto_833674 ) ) ( ON ?auto_833672 ?auto_833673 ) ( ON ?auto_833671 ?auto_833672 ) ( ON ?auto_833670 ?auto_833671 ) ( ON ?auto_833669 ?auto_833670 ) ( ON ?auto_833668 ?auto_833669 ) ( ON ?auto_833667 ?auto_833668 ) ( ON ?auto_833666 ?auto_833667 ) ( ON ?auto_833665 ?auto_833666 ) ( ON ?auto_833664 ?auto_833665 ) ( ON ?auto_833663 ?auto_833664 ) ( ON ?auto_833662 ?auto_833663 ) ( CLEAR ?auto_833660 ) ( ON ?auto_833661 ?auto_833662 ) ( CLEAR ?auto_833661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_833658 ?auto_833659 ?auto_833660 ?auto_833661 )
      ( MAKE-16PILE ?auto_833658 ?auto_833659 ?auto_833660 ?auto_833661 ?auto_833662 ?auto_833663 ?auto_833664 ?auto_833665 ?auto_833666 ?auto_833667 ?auto_833668 ?auto_833669 ?auto_833670 ?auto_833671 ?auto_833672 ?auto_833673 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_833724 - BLOCK
      ?auto_833725 - BLOCK
      ?auto_833726 - BLOCK
      ?auto_833727 - BLOCK
      ?auto_833728 - BLOCK
      ?auto_833729 - BLOCK
      ?auto_833730 - BLOCK
      ?auto_833731 - BLOCK
      ?auto_833732 - BLOCK
      ?auto_833733 - BLOCK
      ?auto_833734 - BLOCK
      ?auto_833735 - BLOCK
      ?auto_833736 - BLOCK
      ?auto_833737 - BLOCK
      ?auto_833738 - BLOCK
      ?auto_833739 - BLOCK
    )
    :vars
    (
      ?auto_833740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_833739 ?auto_833740 ) ( ON-TABLE ?auto_833724 ) ( ON ?auto_833725 ?auto_833724 ) ( not ( = ?auto_833724 ?auto_833725 ) ) ( not ( = ?auto_833724 ?auto_833726 ) ) ( not ( = ?auto_833724 ?auto_833727 ) ) ( not ( = ?auto_833724 ?auto_833728 ) ) ( not ( = ?auto_833724 ?auto_833729 ) ) ( not ( = ?auto_833724 ?auto_833730 ) ) ( not ( = ?auto_833724 ?auto_833731 ) ) ( not ( = ?auto_833724 ?auto_833732 ) ) ( not ( = ?auto_833724 ?auto_833733 ) ) ( not ( = ?auto_833724 ?auto_833734 ) ) ( not ( = ?auto_833724 ?auto_833735 ) ) ( not ( = ?auto_833724 ?auto_833736 ) ) ( not ( = ?auto_833724 ?auto_833737 ) ) ( not ( = ?auto_833724 ?auto_833738 ) ) ( not ( = ?auto_833724 ?auto_833739 ) ) ( not ( = ?auto_833724 ?auto_833740 ) ) ( not ( = ?auto_833725 ?auto_833726 ) ) ( not ( = ?auto_833725 ?auto_833727 ) ) ( not ( = ?auto_833725 ?auto_833728 ) ) ( not ( = ?auto_833725 ?auto_833729 ) ) ( not ( = ?auto_833725 ?auto_833730 ) ) ( not ( = ?auto_833725 ?auto_833731 ) ) ( not ( = ?auto_833725 ?auto_833732 ) ) ( not ( = ?auto_833725 ?auto_833733 ) ) ( not ( = ?auto_833725 ?auto_833734 ) ) ( not ( = ?auto_833725 ?auto_833735 ) ) ( not ( = ?auto_833725 ?auto_833736 ) ) ( not ( = ?auto_833725 ?auto_833737 ) ) ( not ( = ?auto_833725 ?auto_833738 ) ) ( not ( = ?auto_833725 ?auto_833739 ) ) ( not ( = ?auto_833725 ?auto_833740 ) ) ( not ( = ?auto_833726 ?auto_833727 ) ) ( not ( = ?auto_833726 ?auto_833728 ) ) ( not ( = ?auto_833726 ?auto_833729 ) ) ( not ( = ?auto_833726 ?auto_833730 ) ) ( not ( = ?auto_833726 ?auto_833731 ) ) ( not ( = ?auto_833726 ?auto_833732 ) ) ( not ( = ?auto_833726 ?auto_833733 ) ) ( not ( = ?auto_833726 ?auto_833734 ) ) ( not ( = ?auto_833726 ?auto_833735 ) ) ( not ( = ?auto_833726 ?auto_833736 ) ) ( not ( = ?auto_833726 ?auto_833737 ) ) ( not ( = ?auto_833726 ?auto_833738 ) ) ( not ( = ?auto_833726 ?auto_833739 ) ) ( not ( = ?auto_833726 ?auto_833740 ) ) ( not ( = ?auto_833727 ?auto_833728 ) ) ( not ( = ?auto_833727 ?auto_833729 ) ) ( not ( = ?auto_833727 ?auto_833730 ) ) ( not ( = ?auto_833727 ?auto_833731 ) ) ( not ( = ?auto_833727 ?auto_833732 ) ) ( not ( = ?auto_833727 ?auto_833733 ) ) ( not ( = ?auto_833727 ?auto_833734 ) ) ( not ( = ?auto_833727 ?auto_833735 ) ) ( not ( = ?auto_833727 ?auto_833736 ) ) ( not ( = ?auto_833727 ?auto_833737 ) ) ( not ( = ?auto_833727 ?auto_833738 ) ) ( not ( = ?auto_833727 ?auto_833739 ) ) ( not ( = ?auto_833727 ?auto_833740 ) ) ( not ( = ?auto_833728 ?auto_833729 ) ) ( not ( = ?auto_833728 ?auto_833730 ) ) ( not ( = ?auto_833728 ?auto_833731 ) ) ( not ( = ?auto_833728 ?auto_833732 ) ) ( not ( = ?auto_833728 ?auto_833733 ) ) ( not ( = ?auto_833728 ?auto_833734 ) ) ( not ( = ?auto_833728 ?auto_833735 ) ) ( not ( = ?auto_833728 ?auto_833736 ) ) ( not ( = ?auto_833728 ?auto_833737 ) ) ( not ( = ?auto_833728 ?auto_833738 ) ) ( not ( = ?auto_833728 ?auto_833739 ) ) ( not ( = ?auto_833728 ?auto_833740 ) ) ( not ( = ?auto_833729 ?auto_833730 ) ) ( not ( = ?auto_833729 ?auto_833731 ) ) ( not ( = ?auto_833729 ?auto_833732 ) ) ( not ( = ?auto_833729 ?auto_833733 ) ) ( not ( = ?auto_833729 ?auto_833734 ) ) ( not ( = ?auto_833729 ?auto_833735 ) ) ( not ( = ?auto_833729 ?auto_833736 ) ) ( not ( = ?auto_833729 ?auto_833737 ) ) ( not ( = ?auto_833729 ?auto_833738 ) ) ( not ( = ?auto_833729 ?auto_833739 ) ) ( not ( = ?auto_833729 ?auto_833740 ) ) ( not ( = ?auto_833730 ?auto_833731 ) ) ( not ( = ?auto_833730 ?auto_833732 ) ) ( not ( = ?auto_833730 ?auto_833733 ) ) ( not ( = ?auto_833730 ?auto_833734 ) ) ( not ( = ?auto_833730 ?auto_833735 ) ) ( not ( = ?auto_833730 ?auto_833736 ) ) ( not ( = ?auto_833730 ?auto_833737 ) ) ( not ( = ?auto_833730 ?auto_833738 ) ) ( not ( = ?auto_833730 ?auto_833739 ) ) ( not ( = ?auto_833730 ?auto_833740 ) ) ( not ( = ?auto_833731 ?auto_833732 ) ) ( not ( = ?auto_833731 ?auto_833733 ) ) ( not ( = ?auto_833731 ?auto_833734 ) ) ( not ( = ?auto_833731 ?auto_833735 ) ) ( not ( = ?auto_833731 ?auto_833736 ) ) ( not ( = ?auto_833731 ?auto_833737 ) ) ( not ( = ?auto_833731 ?auto_833738 ) ) ( not ( = ?auto_833731 ?auto_833739 ) ) ( not ( = ?auto_833731 ?auto_833740 ) ) ( not ( = ?auto_833732 ?auto_833733 ) ) ( not ( = ?auto_833732 ?auto_833734 ) ) ( not ( = ?auto_833732 ?auto_833735 ) ) ( not ( = ?auto_833732 ?auto_833736 ) ) ( not ( = ?auto_833732 ?auto_833737 ) ) ( not ( = ?auto_833732 ?auto_833738 ) ) ( not ( = ?auto_833732 ?auto_833739 ) ) ( not ( = ?auto_833732 ?auto_833740 ) ) ( not ( = ?auto_833733 ?auto_833734 ) ) ( not ( = ?auto_833733 ?auto_833735 ) ) ( not ( = ?auto_833733 ?auto_833736 ) ) ( not ( = ?auto_833733 ?auto_833737 ) ) ( not ( = ?auto_833733 ?auto_833738 ) ) ( not ( = ?auto_833733 ?auto_833739 ) ) ( not ( = ?auto_833733 ?auto_833740 ) ) ( not ( = ?auto_833734 ?auto_833735 ) ) ( not ( = ?auto_833734 ?auto_833736 ) ) ( not ( = ?auto_833734 ?auto_833737 ) ) ( not ( = ?auto_833734 ?auto_833738 ) ) ( not ( = ?auto_833734 ?auto_833739 ) ) ( not ( = ?auto_833734 ?auto_833740 ) ) ( not ( = ?auto_833735 ?auto_833736 ) ) ( not ( = ?auto_833735 ?auto_833737 ) ) ( not ( = ?auto_833735 ?auto_833738 ) ) ( not ( = ?auto_833735 ?auto_833739 ) ) ( not ( = ?auto_833735 ?auto_833740 ) ) ( not ( = ?auto_833736 ?auto_833737 ) ) ( not ( = ?auto_833736 ?auto_833738 ) ) ( not ( = ?auto_833736 ?auto_833739 ) ) ( not ( = ?auto_833736 ?auto_833740 ) ) ( not ( = ?auto_833737 ?auto_833738 ) ) ( not ( = ?auto_833737 ?auto_833739 ) ) ( not ( = ?auto_833737 ?auto_833740 ) ) ( not ( = ?auto_833738 ?auto_833739 ) ) ( not ( = ?auto_833738 ?auto_833740 ) ) ( not ( = ?auto_833739 ?auto_833740 ) ) ( ON ?auto_833738 ?auto_833739 ) ( ON ?auto_833737 ?auto_833738 ) ( ON ?auto_833736 ?auto_833737 ) ( ON ?auto_833735 ?auto_833736 ) ( ON ?auto_833734 ?auto_833735 ) ( ON ?auto_833733 ?auto_833734 ) ( ON ?auto_833732 ?auto_833733 ) ( ON ?auto_833731 ?auto_833732 ) ( ON ?auto_833730 ?auto_833731 ) ( ON ?auto_833729 ?auto_833730 ) ( ON ?auto_833728 ?auto_833729 ) ( ON ?auto_833727 ?auto_833728 ) ( CLEAR ?auto_833725 ) ( ON ?auto_833726 ?auto_833727 ) ( CLEAR ?auto_833726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_833724 ?auto_833725 ?auto_833726 )
      ( MAKE-16PILE ?auto_833724 ?auto_833725 ?auto_833726 ?auto_833727 ?auto_833728 ?auto_833729 ?auto_833730 ?auto_833731 ?auto_833732 ?auto_833733 ?auto_833734 ?auto_833735 ?auto_833736 ?auto_833737 ?auto_833738 ?auto_833739 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_833790 - BLOCK
      ?auto_833791 - BLOCK
      ?auto_833792 - BLOCK
      ?auto_833793 - BLOCK
      ?auto_833794 - BLOCK
      ?auto_833795 - BLOCK
      ?auto_833796 - BLOCK
      ?auto_833797 - BLOCK
      ?auto_833798 - BLOCK
      ?auto_833799 - BLOCK
      ?auto_833800 - BLOCK
      ?auto_833801 - BLOCK
      ?auto_833802 - BLOCK
      ?auto_833803 - BLOCK
      ?auto_833804 - BLOCK
      ?auto_833805 - BLOCK
    )
    :vars
    (
      ?auto_833806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_833805 ?auto_833806 ) ( ON-TABLE ?auto_833790 ) ( not ( = ?auto_833790 ?auto_833791 ) ) ( not ( = ?auto_833790 ?auto_833792 ) ) ( not ( = ?auto_833790 ?auto_833793 ) ) ( not ( = ?auto_833790 ?auto_833794 ) ) ( not ( = ?auto_833790 ?auto_833795 ) ) ( not ( = ?auto_833790 ?auto_833796 ) ) ( not ( = ?auto_833790 ?auto_833797 ) ) ( not ( = ?auto_833790 ?auto_833798 ) ) ( not ( = ?auto_833790 ?auto_833799 ) ) ( not ( = ?auto_833790 ?auto_833800 ) ) ( not ( = ?auto_833790 ?auto_833801 ) ) ( not ( = ?auto_833790 ?auto_833802 ) ) ( not ( = ?auto_833790 ?auto_833803 ) ) ( not ( = ?auto_833790 ?auto_833804 ) ) ( not ( = ?auto_833790 ?auto_833805 ) ) ( not ( = ?auto_833790 ?auto_833806 ) ) ( not ( = ?auto_833791 ?auto_833792 ) ) ( not ( = ?auto_833791 ?auto_833793 ) ) ( not ( = ?auto_833791 ?auto_833794 ) ) ( not ( = ?auto_833791 ?auto_833795 ) ) ( not ( = ?auto_833791 ?auto_833796 ) ) ( not ( = ?auto_833791 ?auto_833797 ) ) ( not ( = ?auto_833791 ?auto_833798 ) ) ( not ( = ?auto_833791 ?auto_833799 ) ) ( not ( = ?auto_833791 ?auto_833800 ) ) ( not ( = ?auto_833791 ?auto_833801 ) ) ( not ( = ?auto_833791 ?auto_833802 ) ) ( not ( = ?auto_833791 ?auto_833803 ) ) ( not ( = ?auto_833791 ?auto_833804 ) ) ( not ( = ?auto_833791 ?auto_833805 ) ) ( not ( = ?auto_833791 ?auto_833806 ) ) ( not ( = ?auto_833792 ?auto_833793 ) ) ( not ( = ?auto_833792 ?auto_833794 ) ) ( not ( = ?auto_833792 ?auto_833795 ) ) ( not ( = ?auto_833792 ?auto_833796 ) ) ( not ( = ?auto_833792 ?auto_833797 ) ) ( not ( = ?auto_833792 ?auto_833798 ) ) ( not ( = ?auto_833792 ?auto_833799 ) ) ( not ( = ?auto_833792 ?auto_833800 ) ) ( not ( = ?auto_833792 ?auto_833801 ) ) ( not ( = ?auto_833792 ?auto_833802 ) ) ( not ( = ?auto_833792 ?auto_833803 ) ) ( not ( = ?auto_833792 ?auto_833804 ) ) ( not ( = ?auto_833792 ?auto_833805 ) ) ( not ( = ?auto_833792 ?auto_833806 ) ) ( not ( = ?auto_833793 ?auto_833794 ) ) ( not ( = ?auto_833793 ?auto_833795 ) ) ( not ( = ?auto_833793 ?auto_833796 ) ) ( not ( = ?auto_833793 ?auto_833797 ) ) ( not ( = ?auto_833793 ?auto_833798 ) ) ( not ( = ?auto_833793 ?auto_833799 ) ) ( not ( = ?auto_833793 ?auto_833800 ) ) ( not ( = ?auto_833793 ?auto_833801 ) ) ( not ( = ?auto_833793 ?auto_833802 ) ) ( not ( = ?auto_833793 ?auto_833803 ) ) ( not ( = ?auto_833793 ?auto_833804 ) ) ( not ( = ?auto_833793 ?auto_833805 ) ) ( not ( = ?auto_833793 ?auto_833806 ) ) ( not ( = ?auto_833794 ?auto_833795 ) ) ( not ( = ?auto_833794 ?auto_833796 ) ) ( not ( = ?auto_833794 ?auto_833797 ) ) ( not ( = ?auto_833794 ?auto_833798 ) ) ( not ( = ?auto_833794 ?auto_833799 ) ) ( not ( = ?auto_833794 ?auto_833800 ) ) ( not ( = ?auto_833794 ?auto_833801 ) ) ( not ( = ?auto_833794 ?auto_833802 ) ) ( not ( = ?auto_833794 ?auto_833803 ) ) ( not ( = ?auto_833794 ?auto_833804 ) ) ( not ( = ?auto_833794 ?auto_833805 ) ) ( not ( = ?auto_833794 ?auto_833806 ) ) ( not ( = ?auto_833795 ?auto_833796 ) ) ( not ( = ?auto_833795 ?auto_833797 ) ) ( not ( = ?auto_833795 ?auto_833798 ) ) ( not ( = ?auto_833795 ?auto_833799 ) ) ( not ( = ?auto_833795 ?auto_833800 ) ) ( not ( = ?auto_833795 ?auto_833801 ) ) ( not ( = ?auto_833795 ?auto_833802 ) ) ( not ( = ?auto_833795 ?auto_833803 ) ) ( not ( = ?auto_833795 ?auto_833804 ) ) ( not ( = ?auto_833795 ?auto_833805 ) ) ( not ( = ?auto_833795 ?auto_833806 ) ) ( not ( = ?auto_833796 ?auto_833797 ) ) ( not ( = ?auto_833796 ?auto_833798 ) ) ( not ( = ?auto_833796 ?auto_833799 ) ) ( not ( = ?auto_833796 ?auto_833800 ) ) ( not ( = ?auto_833796 ?auto_833801 ) ) ( not ( = ?auto_833796 ?auto_833802 ) ) ( not ( = ?auto_833796 ?auto_833803 ) ) ( not ( = ?auto_833796 ?auto_833804 ) ) ( not ( = ?auto_833796 ?auto_833805 ) ) ( not ( = ?auto_833796 ?auto_833806 ) ) ( not ( = ?auto_833797 ?auto_833798 ) ) ( not ( = ?auto_833797 ?auto_833799 ) ) ( not ( = ?auto_833797 ?auto_833800 ) ) ( not ( = ?auto_833797 ?auto_833801 ) ) ( not ( = ?auto_833797 ?auto_833802 ) ) ( not ( = ?auto_833797 ?auto_833803 ) ) ( not ( = ?auto_833797 ?auto_833804 ) ) ( not ( = ?auto_833797 ?auto_833805 ) ) ( not ( = ?auto_833797 ?auto_833806 ) ) ( not ( = ?auto_833798 ?auto_833799 ) ) ( not ( = ?auto_833798 ?auto_833800 ) ) ( not ( = ?auto_833798 ?auto_833801 ) ) ( not ( = ?auto_833798 ?auto_833802 ) ) ( not ( = ?auto_833798 ?auto_833803 ) ) ( not ( = ?auto_833798 ?auto_833804 ) ) ( not ( = ?auto_833798 ?auto_833805 ) ) ( not ( = ?auto_833798 ?auto_833806 ) ) ( not ( = ?auto_833799 ?auto_833800 ) ) ( not ( = ?auto_833799 ?auto_833801 ) ) ( not ( = ?auto_833799 ?auto_833802 ) ) ( not ( = ?auto_833799 ?auto_833803 ) ) ( not ( = ?auto_833799 ?auto_833804 ) ) ( not ( = ?auto_833799 ?auto_833805 ) ) ( not ( = ?auto_833799 ?auto_833806 ) ) ( not ( = ?auto_833800 ?auto_833801 ) ) ( not ( = ?auto_833800 ?auto_833802 ) ) ( not ( = ?auto_833800 ?auto_833803 ) ) ( not ( = ?auto_833800 ?auto_833804 ) ) ( not ( = ?auto_833800 ?auto_833805 ) ) ( not ( = ?auto_833800 ?auto_833806 ) ) ( not ( = ?auto_833801 ?auto_833802 ) ) ( not ( = ?auto_833801 ?auto_833803 ) ) ( not ( = ?auto_833801 ?auto_833804 ) ) ( not ( = ?auto_833801 ?auto_833805 ) ) ( not ( = ?auto_833801 ?auto_833806 ) ) ( not ( = ?auto_833802 ?auto_833803 ) ) ( not ( = ?auto_833802 ?auto_833804 ) ) ( not ( = ?auto_833802 ?auto_833805 ) ) ( not ( = ?auto_833802 ?auto_833806 ) ) ( not ( = ?auto_833803 ?auto_833804 ) ) ( not ( = ?auto_833803 ?auto_833805 ) ) ( not ( = ?auto_833803 ?auto_833806 ) ) ( not ( = ?auto_833804 ?auto_833805 ) ) ( not ( = ?auto_833804 ?auto_833806 ) ) ( not ( = ?auto_833805 ?auto_833806 ) ) ( ON ?auto_833804 ?auto_833805 ) ( ON ?auto_833803 ?auto_833804 ) ( ON ?auto_833802 ?auto_833803 ) ( ON ?auto_833801 ?auto_833802 ) ( ON ?auto_833800 ?auto_833801 ) ( ON ?auto_833799 ?auto_833800 ) ( ON ?auto_833798 ?auto_833799 ) ( ON ?auto_833797 ?auto_833798 ) ( ON ?auto_833796 ?auto_833797 ) ( ON ?auto_833795 ?auto_833796 ) ( ON ?auto_833794 ?auto_833795 ) ( ON ?auto_833793 ?auto_833794 ) ( ON ?auto_833792 ?auto_833793 ) ( CLEAR ?auto_833790 ) ( ON ?auto_833791 ?auto_833792 ) ( CLEAR ?auto_833791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_833790 ?auto_833791 )
      ( MAKE-16PILE ?auto_833790 ?auto_833791 ?auto_833792 ?auto_833793 ?auto_833794 ?auto_833795 ?auto_833796 ?auto_833797 ?auto_833798 ?auto_833799 ?auto_833800 ?auto_833801 ?auto_833802 ?auto_833803 ?auto_833804 ?auto_833805 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_833856 - BLOCK
      ?auto_833857 - BLOCK
      ?auto_833858 - BLOCK
      ?auto_833859 - BLOCK
      ?auto_833860 - BLOCK
      ?auto_833861 - BLOCK
      ?auto_833862 - BLOCK
      ?auto_833863 - BLOCK
      ?auto_833864 - BLOCK
      ?auto_833865 - BLOCK
      ?auto_833866 - BLOCK
      ?auto_833867 - BLOCK
      ?auto_833868 - BLOCK
      ?auto_833869 - BLOCK
      ?auto_833870 - BLOCK
      ?auto_833871 - BLOCK
    )
    :vars
    (
      ?auto_833872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_833871 ?auto_833872 ) ( not ( = ?auto_833856 ?auto_833857 ) ) ( not ( = ?auto_833856 ?auto_833858 ) ) ( not ( = ?auto_833856 ?auto_833859 ) ) ( not ( = ?auto_833856 ?auto_833860 ) ) ( not ( = ?auto_833856 ?auto_833861 ) ) ( not ( = ?auto_833856 ?auto_833862 ) ) ( not ( = ?auto_833856 ?auto_833863 ) ) ( not ( = ?auto_833856 ?auto_833864 ) ) ( not ( = ?auto_833856 ?auto_833865 ) ) ( not ( = ?auto_833856 ?auto_833866 ) ) ( not ( = ?auto_833856 ?auto_833867 ) ) ( not ( = ?auto_833856 ?auto_833868 ) ) ( not ( = ?auto_833856 ?auto_833869 ) ) ( not ( = ?auto_833856 ?auto_833870 ) ) ( not ( = ?auto_833856 ?auto_833871 ) ) ( not ( = ?auto_833856 ?auto_833872 ) ) ( not ( = ?auto_833857 ?auto_833858 ) ) ( not ( = ?auto_833857 ?auto_833859 ) ) ( not ( = ?auto_833857 ?auto_833860 ) ) ( not ( = ?auto_833857 ?auto_833861 ) ) ( not ( = ?auto_833857 ?auto_833862 ) ) ( not ( = ?auto_833857 ?auto_833863 ) ) ( not ( = ?auto_833857 ?auto_833864 ) ) ( not ( = ?auto_833857 ?auto_833865 ) ) ( not ( = ?auto_833857 ?auto_833866 ) ) ( not ( = ?auto_833857 ?auto_833867 ) ) ( not ( = ?auto_833857 ?auto_833868 ) ) ( not ( = ?auto_833857 ?auto_833869 ) ) ( not ( = ?auto_833857 ?auto_833870 ) ) ( not ( = ?auto_833857 ?auto_833871 ) ) ( not ( = ?auto_833857 ?auto_833872 ) ) ( not ( = ?auto_833858 ?auto_833859 ) ) ( not ( = ?auto_833858 ?auto_833860 ) ) ( not ( = ?auto_833858 ?auto_833861 ) ) ( not ( = ?auto_833858 ?auto_833862 ) ) ( not ( = ?auto_833858 ?auto_833863 ) ) ( not ( = ?auto_833858 ?auto_833864 ) ) ( not ( = ?auto_833858 ?auto_833865 ) ) ( not ( = ?auto_833858 ?auto_833866 ) ) ( not ( = ?auto_833858 ?auto_833867 ) ) ( not ( = ?auto_833858 ?auto_833868 ) ) ( not ( = ?auto_833858 ?auto_833869 ) ) ( not ( = ?auto_833858 ?auto_833870 ) ) ( not ( = ?auto_833858 ?auto_833871 ) ) ( not ( = ?auto_833858 ?auto_833872 ) ) ( not ( = ?auto_833859 ?auto_833860 ) ) ( not ( = ?auto_833859 ?auto_833861 ) ) ( not ( = ?auto_833859 ?auto_833862 ) ) ( not ( = ?auto_833859 ?auto_833863 ) ) ( not ( = ?auto_833859 ?auto_833864 ) ) ( not ( = ?auto_833859 ?auto_833865 ) ) ( not ( = ?auto_833859 ?auto_833866 ) ) ( not ( = ?auto_833859 ?auto_833867 ) ) ( not ( = ?auto_833859 ?auto_833868 ) ) ( not ( = ?auto_833859 ?auto_833869 ) ) ( not ( = ?auto_833859 ?auto_833870 ) ) ( not ( = ?auto_833859 ?auto_833871 ) ) ( not ( = ?auto_833859 ?auto_833872 ) ) ( not ( = ?auto_833860 ?auto_833861 ) ) ( not ( = ?auto_833860 ?auto_833862 ) ) ( not ( = ?auto_833860 ?auto_833863 ) ) ( not ( = ?auto_833860 ?auto_833864 ) ) ( not ( = ?auto_833860 ?auto_833865 ) ) ( not ( = ?auto_833860 ?auto_833866 ) ) ( not ( = ?auto_833860 ?auto_833867 ) ) ( not ( = ?auto_833860 ?auto_833868 ) ) ( not ( = ?auto_833860 ?auto_833869 ) ) ( not ( = ?auto_833860 ?auto_833870 ) ) ( not ( = ?auto_833860 ?auto_833871 ) ) ( not ( = ?auto_833860 ?auto_833872 ) ) ( not ( = ?auto_833861 ?auto_833862 ) ) ( not ( = ?auto_833861 ?auto_833863 ) ) ( not ( = ?auto_833861 ?auto_833864 ) ) ( not ( = ?auto_833861 ?auto_833865 ) ) ( not ( = ?auto_833861 ?auto_833866 ) ) ( not ( = ?auto_833861 ?auto_833867 ) ) ( not ( = ?auto_833861 ?auto_833868 ) ) ( not ( = ?auto_833861 ?auto_833869 ) ) ( not ( = ?auto_833861 ?auto_833870 ) ) ( not ( = ?auto_833861 ?auto_833871 ) ) ( not ( = ?auto_833861 ?auto_833872 ) ) ( not ( = ?auto_833862 ?auto_833863 ) ) ( not ( = ?auto_833862 ?auto_833864 ) ) ( not ( = ?auto_833862 ?auto_833865 ) ) ( not ( = ?auto_833862 ?auto_833866 ) ) ( not ( = ?auto_833862 ?auto_833867 ) ) ( not ( = ?auto_833862 ?auto_833868 ) ) ( not ( = ?auto_833862 ?auto_833869 ) ) ( not ( = ?auto_833862 ?auto_833870 ) ) ( not ( = ?auto_833862 ?auto_833871 ) ) ( not ( = ?auto_833862 ?auto_833872 ) ) ( not ( = ?auto_833863 ?auto_833864 ) ) ( not ( = ?auto_833863 ?auto_833865 ) ) ( not ( = ?auto_833863 ?auto_833866 ) ) ( not ( = ?auto_833863 ?auto_833867 ) ) ( not ( = ?auto_833863 ?auto_833868 ) ) ( not ( = ?auto_833863 ?auto_833869 ) ) ( not ( = ?auto_833863 ?auto_833870 ) ) ( not ( = ?auto_833863 ?auto_833871 ) ) ( not ( = ?auto_833863 ?auto_833872 ) ) ( not ( = ?auto_833864 ?auto_833865 ) ) ( not ( = ?auto_833864 ?auto_833866 ) ) ( not ( = ?auto_833864 ?auto_833867 ) ) ( not ( = ?auto_833864 ?auto_833868 ) ) ( not ( = ?auto_833864 ?auto_833869 ) ) ( not ( = ?auto_833864 ?auto_833870 ) ) ( not ( = ?auto_833864 ?auto_833871 ) ) ( not ( = ?auto_833864 ?auto_833872 ) ) ( not ( = ?auto_833865 ?auto_833866 ) ) ( not ( = ?auto_833865 ?auto_833867 ) ) ( not ( = ?auto_833865 ?auto_833868 ) ) ( not ( = ?auto_833865 ?auto_833869 ) ) ( not ( = ?auto_833865 ?auto_833870 ) ) ( not ( = ?auto_833865 ?auto_833871 ) ) ( not ( = ?auto_833865 ?auto_833872 ) ) ( not ( = ?auto_833866 ?auto_833867 ) ) ( not ( = ?auto_833866 ?auto_833868 ) ) ( not ( = ?auto_833866 ?auto_833869 ) ) ( not ( = ?auto_833866 ?auto_833870 ) ) ( not ( = ?auto_833866 ?auto_833871 ) ) ( not ( = ?auto_833866 ?auto_833872 ) ) ( not ( = ?auto_833867 ?auto_833868 ) ) ( not ( = ?auto_833867 ?auto_833869 ) ) ( not ( = ?auto_833867 ?auto_833870 ) ) ( not ( = ?auto_833867 ?auto_833871 ) ) ( not ( = ?auto_833867 ?auto_833872 ) ) ( not ( = ?auto_833868 ?auto_833869 ) ) ( not ( = ?auto_833868 ?auto_833870 ) ) ( not ( = ?auto_833868 ?auto_833871 ) ) ( not ( = ?auto_833868 ?auto_833872 ) ) ( not ( = ?auto_833869 ?auto_833870 ) ) ( not ( = ?auto_833869 ?auto_833871 ) ) ( not ( = ?auto_833869 ?auto_833872 ) ) ( not ( = ?auto_833870 ?auto_833871 ) ) ( not ( = ?auto_833870 ?auto_833872 ) ) ( not ( = ?auto_833871 ?auto_833872 ) ) ( ON ?auto_833870 ?auto_833871 ) ( ON ?auto_833869 ?auto_833870 ) ( ON ?auto_833868 ?auto_833869 ) ( ON ?auto_833867 ?auto_833868 ) ( ON ?auto_833866 ?auto_833867 ) ( ON ?auto_833865 ?auto_833866 ) ( ON ?auto_833864 ?auto_833865 ) ( ON ?auto_833863 ?auto_833864 ) ( ON ?auto_833862 ?auto_833863 ) ( ON ?auto_833861 ?auto_833862 ) ( ON ?auto_833860 ?auto_833861 ) ( ON ?auto_833859 ?auto_833860 ) ( ON ?auto_833858 ?auto_833859 ) ( ON ?auto_833857 ?auto_833858 ) ( ON ?auto_833856 ?auto_833857 ) ( CLEAR ?auto_833856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_833856 )
      ( MAKE-16PILE ?auto_833856 ?auto_833857 ?auto_833858 ?auto_833859 ?auto_833860 ?auto_833861 ?auto_833862 ?auto_833863 ?auto_833864 ?auto_833865 ?auto_833866 ?auto_833867 ?auto_833868 ?auto_833869 ?auto_833870 ?auto_833871 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_833923 - BLOCK
      ?auto_833924 - BLOCK
      ?auto_833925 - BLOCK
      ?auto_833926 - BLOCK
      ?auto_833927 - BLOCK
      ?auto_833928 - BLOCK
      ?auto_833929 - BLOCK
      ?auto_833930 - BLOCK
      ?auto_833931 - BLOCK
      ?auto_833932 - BLOCK
      ?auto_833933 - BLOCK
      ?auto_833934 - BLOCK
      ?auto_833935 - BLOCK
      ?auto_833936 - BLOCK
      ?auto_833937 - BLOCK
      ?auto_833938 - BLOCK
      ?auto_833939 - BLOCK
    )
    :vars
    (
      ?auto_833940 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_833938 ) ( ON ?auto_833939 ?auto_833940 ) ( CLEAR ?auto_833939 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_833923 ) ( ON ?auto_833924 ?auto_833923 ) ( ON ?auto_833925 ?auto_833924 ) ( ON ?auto_833926 ?auto_833925 ) ( ON ?auto_833927 ?auto_833926 ) ( ON ?auto_833928 ?auto_833927 ) ( ON ?auto_833929 ?auto_833928 ) ( ON ?auto_833930 ?auto_833929 ) ( ON ?auto_833931 ?auto_833930 ) ( ON ?auto_833932 ?auto_833931 ) ( ON ?auto_833933 ?auto_833932 ) ( ON ?auto_833934 ?auto_833933 ) ( ON ?auto_833935 ?auto_833934 ) ( ON ?auto_833936 ?auto_833935 ) ( ON ?auto_833937 ?auto_833936 ) ( ON ?auto_833938 ?auto_833937 ) ( not ( = ?auto_833923 ?auto_833924 ) ) ( not ( = ?auto_833923 ?auto_833925 ) ) ( not ( = ?auto_833923 ?auto_833926 ) ) ( not ( = ?auto_833923 ?auto_833927 ) ) ( not ( = ?auto_833923 ?auto_833928 ) ) ( not ( = ?auto_833923 ?auto_833929 ) ) ( not ( = ?auto_833923 ?auto_833930 ) ) ( not ( = ?auto_833923 ?auto_833931 ) ) ( not ( = ?auto_833923 ?auto_833932 ) ) ( not ( = ?auto_833923 ?auto_833933 ) ) ( not ( = ?auto_833923 ?auto_833934 ) ) ( not ( = ?auto_833923 ?auto_833935 ) ) ( not ( = ?auto_833923 ?auto_833936 ) ) ( not ( = ?auto_833923 ?auto_833937 ) ) ( not ( = ?auto_833923 ?auto_833938 ) ) ( not ( = ?auto_833923 ?auto_833939 ) ) ( not ( = ?auto_833923 ?auto_833940 ) ) ( not ( = ?auto_833924 ?auto_833925 ) ) ( not ( = ?auto_833924 ?auto_833926 ) ) ( not ( = ?auto_833924 ?auto_833927 ) ) ( not ( = ?auto_833924 ?auto_833928 ) ) ( not ( = ?auto_833924 ?auto_833929 ) ) ( not ( = ?auto_833924 ?auto_833930 ) ) ( not ( = ?auto_833924 ?auto_833931 ) ) ( not ( = ?auto_833924 ?auto_833932 ) ) ( not ( = ?auto_833924 ?auto_833933 ) ) ( not ( = ?auto_833924 ?auto_833934 ) ) ( not ( = ?auto_833924 ?auto_833935 ) ) ( not ( = ?auto_833924 ?auto_833936 ) ) ( not ( = ?auto_833924 ?auto_833937 ) ) ( not ( = ?auto_833924 ?auto_833938 ) ) ( not ( = ?auto_833924 ?auto_833939 ) ) ( not ( = ?auto_833924 ?auto_833940 ) ) ( not ( = ?auto_833925 ?auto_833926 ) ) ( not ( = ?auto_833925 ?auto_833927 ) ) ( not ( = ?auto_833925 ?auto_833928 ) ) ( not ( = ?auto_833925 ?auto_833929 ) ) ( not ( = ?auto_833925 ?auto_833930 ) ) ( not ( = ?auto_833925 ?auto_833931 ) ) ( not ( = ?auto_833925 ?auto_833932 ) ) ( not ( = ?auto_833925 ?auto_833933 ) ) ( not ( = ?auto_833925 ?auto_833934 ) ) ( not ( = ?auto_833925 ?auto_833935 ) ) ( not ( = ?auto_833925 ?auto_833936 ) ) ( not ( = ?auto_833925 ?auto_833937 ) ) ( not ( = ?auto_833925 ?auto_833938 ) ) ( not ( = ?auto_833925 ?auto_833939 ) ) ( not ( = ?auto_833925 ?auto_833940 ) ) ( not ( = ?auto_833926 ?auto_833927 ) ) ( not ( = ?auto_833926 ?auto_833928 ) ) ( not ( = ?auto_833926 ?auto_833929 ) ) ( not ( = ?auto_833926 ?auto_833930 ) ) ( not ( = ?auto_833926 ?auto_833931 ) ) ( not ( = ?auto_833926 ?auto_833932 ) ) ( not ( = ?auto_833926 ?auto_833933 ) ) ( not ( = ?auto_833926 ?auto_833934 ) ) ( not ( = ?auto_833926 ?auto_833935 ) ) ( not ( = ?auto_833926 ?auto_833936 ) ) ( not ( = ?auto_833926 ?auto_833937 ) ) ( not ( = ?auto_833926 ?auto_833938 ) ) ( not ( = ?auto_833926 ?auto_833939 ) ) ( not ( = ?auto_833926 ?auto_833940 ) ) ( not ( = ?auto_833927 ?auto_833928 ) ) ( not ( = ?auto_833927 ?auto_833929 ) ) ( not ( = ?auto_833927 ?auto_833930 ) ) ( not ( = ?auto_833927 ?auto_833931 ) ) ( not ( = ?auto_833927 ?auto_833932 ) ) ( not ( = ?auto_833927 ?auto_833933 ) ) ( not ( = ?auto_833927 ?auto_833934 ) ) ( not ( = ?auto_833927 ?auto_833935 ) ) ( not ( = ?auto_833927 ?auto_833936 ) ) ( not ( = ?auto_833927 ?auto_833937 ) ) ( not ( = ?auto_833927 ?auto_833938 ) ) ( not ( = ?auto_833927 ?auto_833939 ) ) ( not ( = ?auto_833927 ?auto_833940 ) ) ( not ( = ?auto_833928 ?auto_833929 ) ) ( not ( = ?auto_833928 ?auto_833930 ) ) ( not ( = ?auto_833928 ?auto_833931 ) ) ( not ( = ?auto_833928 ?auto_833932 ) ) ( not ( = ?auto_833928 ?auto_833933 ) ) ( not ( = ?auto_833928 ?auto_833934 ) ) ( not ( = ?auto_833928 ?auto_833935 ) ) ( not ( = ?auto_833928 ?auto_833936 ) ) ( not ( = ?auto_833928 ?auto_833937 ) ) ( not ( = ?auto_833928 ?auto_833938 ) ) ( not ( = ?auto_833928 ?auto_833939 ) ) ( not ( = ?auto_833928 ?auto_833940 ) ) ( not ( = ?auto_833929 ?auto_833930 ) ) ( not ( = ?auto_833929 ?auto_833931 ) ) ( not ( = ?auto_833929 ?auto_833932 ) ) ( not ( = ?auto_833929 ?auto_833933 ) ) ( not ( = ?auto_833929 ?auto_833934 ) ) ( not ( = ?auto_833929 ?auto_833935 ) ) ( not ( = ?auto_833929 ?auto_833936 ) ) ( not ( = ?auto_833929 ?auto_833937 ) ) ( not ( = ?auto_833929 ?auto_833938 ) ) ( not ( = ?auto_833929 ?auto_833939 ) ) ( not ( = ?auto_833929 ?auto_833940 ) ) ( not ( = ?auto_833930 ?auto_833931 ) ) ( not ( = ?auto_833930 ?auto_833932 ) ) ( not ( = ?auto_833930 ?auto_833933 ) ) ( not ( = ?auto_833930 ?auto_833934 ) ) ( not ( = ?auto_833930 ?auto_833935 ) ) ( not ( = ?auto_833930 ?auto_833936 ) ) ( not ( = ?auto_833930 ?auto_833937 ) ) ( not ( = ?auto_833930 ?auto_833938 ) ) ( not ( = ?auto_833930 ?auto_833939 ) ) ( not ( = ?auto_833930 ?auto_833940 ) ) ( not ( = ?auto_833931 ?auto_833932 ) ) ( not ( = ?auto_833931 ?auto_833933 ) ) ( not ( = ?auto_833931 ?auto_833934 ) ) ( not ( = ?auto_833931 ?auto_833935 ) ) ( not ( = ?auto_833931 ?auto_833936 ) ) ( not ( = ?auto_833931 ?auto_833937 ) ) ( not ( = ?auto_833931 ?auto_833938 ) ) ( not ( = ?auto_833931 ?auto_833939 ) ) ( not ( = ?auto_833931 ?auto_833940 ) ) ( not ( = ?auto_833932 ?auto_833933 ) ) ( not ( = ?auto_833932 ?auto_833934 ) ) ( not ( = ?auto_833932 ?auto_833935 ) ) ( not ( = ?auto_833932 ?auto_833936 ) ) ( not ( = ?auto_833932 ?auto_833937 ) ) ( not ( = ?auto_833932 ?auto_833938 ) ) ( not ( = ?auto_833932 ?auto_833939 ) ) ( not ( = ?auto_833932 ?auto_833940 ) ) ( not ( = ?auto_833933 ?auto_833934 ) ) ( not ( = ?auto_833933 ?auto_833935 ) ) ( not ( = ?auto_833933 ?auto_833936 ) ) ( not ( = ?auto_833933 ?auto_833937 ) ) ( not ( = ?auto_833933 ?auto_833938 ) ) ( not ( = ?auto_833933 ?auto_833939 ) ) ( not ( = ?auto_833933 ?auto_833940 ) ) ( not ( = ?auto_833934 ?auto_833935 ) ) ( not ( = ?auto_833934 ?auto_833936 ) ) ( not ( = ?auto_833934 ?auto_833937 ) ) ( not ( = ?auto_833934 ?auto_833938 ) ) ( not ( = ?auto_833934 ?auto_833939 ) ) ( not ( = ?auto_833934 ?auto_833940 ) ) ( not ( = ?auto_833935 ?auto_833936 ) ) ( not ( = ?auto_833935 ?auto_833937 ) ) ( not ( = ?auto_833935 ?auto_833938 ) ) ( not ( = ?auto_833935 ?auto_833939 ) ) ( not ( = ?auto_833935 ?auto_833940 ) ) ( not ( = ?auto_833936 ?auto_833937 ) ) ( not ( = ?auto_833936 ?auto_833938 ) ) ( not ( = ?auto_833936 ?auto_833939 ) ) ( not ( = ?auto_833936 ?auto_833940 ) ) ( not ( = ?auto_833937 ?auto_833938 ) ) ( not ( = ?auto_833937 ?auto_833939 ) ) ( not ( = ?auto_833937 ?auto_833940 ) ) ( not ( = ?auto_833938 ?auto_833939 ) ) ( not ( = ?auto_833938 ?auto_833940 ) ) ( not ( = ?auto_833939 ?auto_833940 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_833939 ?auto_833940 )
      ( !STACK ?auto_833939 ?auto_833938 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_833993 - BLOCK
      ?auto_833994 - BLOCK
      ?auto_833995 - BLOCK
      ?auto_833996 - BLOCK
      ?auto_833997 - BLOCK
      ?auto_833998 - BLOCK
      ?auto_833999 - BLOCK
      ?auto_834000 - BLOCK
      ?auto_834001 - BLOCK
      ?auto_834002 - BLOCK
      ?auto_834003 - BLOCK
      ?auto_834004 - BLOCK
      ?auto_834005 - BLOCK
      ?auto_834006 - BLOCK
      ?auto_834007 - BLOCK
      ?auto_834008 - BLOCK
      ?auto_834009 - BLOCK
    )
    :vars
    (
      ?auto_834010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_834009 ?auto_834010 ) ( ON-TABLE ?auto_833993 ) ( ON ?auto_833994 ?auto_833993 ) ( ON ?auto_833995 ?auto_833994 ) ( ON ?auto_833996 ?auto_833995 ) ( ON ?auto_833997 ?auto_833996 ) ( ON ?auto_833998 ?auto_833997 ) ( ON ?auto_833999 ?auto_833998 ) ( ON ?auto_834000 ?auto_833999 ) ( ON ?auto_834001 ?auto_834000 ) ( ON ?auto_834002 ?auto_834001 ) ( ON ?auto_834003 ?auto_834002 ) ( ON ?auto_834004 ?auto_834003 ) ( ON ?auto_834005 ?auto_834004 ) ( ON ?auto_834006 ?auto_834005 ) ( ON ?auto_834007 ?auto_834006 ) ( not ( = ?auto_833993 ?auto_833994 ) ) ( not ( = ?auto_833993 ?auto_833995 ) ) ( not ( = ?auto_833993 ?auto_833996 ) ) ( not ( = ?auto_833993 ?auto_833997 ) ) ( not ( = ?auto_833993 ?auto_833998 ) ) ( not ( = ?auto_833993 ?auto_833999 ) ) ( not ( = ?auto_833993 ?auto_834000 ) ) ( not ( = ?auto_833993 ?auto_834001 ) ) ( not ( = ?auto_833993 ?auto_834002 ) ) ( not ( = ?auto_833993 ?auto_834003 ) ) ( not ( = ?auto_833993 ?auto_834004 ) ) ( not ( = ?auto_833993 ?auto_834005 ) ) ( not ( = ?auto_833993 ?auto_834006 ) ) ( not ( = ?auto_833993 ?auto_834007 ) ) ( not ( = ?auto_833993 ?auto_834008 ) ) ( not ( = ?auto_833993 ?auto_834009 ) ) ( not ( = ?auto_833993 ?auto_834010 ) ) ( not ( = ?auto_833994 ?auto_833995 ) ) ( not ( = ?auto_833994 ?auto_833996 ) ) ( not ( = ?auto_833994 ?auto_833997 ) ) ( not ( = ?auto_833994 ?auto_833998 ) ) ( not ( = ?auto_833994 ?auto_833999 ) ) ( not ( = ?auto_833994 ?auto_834000 ) ) ( not ( = ?auto_833994 ?auto_834001 ) ) ( not ( = ?auto_833994 ?auto_834002 ) ) ( not ( = ?auto_833994 ?auto_834003 ) ) ( not ( = ?auto_833994 ?auto_834004 ) ) ( not ( = ?auto_833994 ?auto_834005 ) ) ( not ( = ?auto_833994 ?auto_834006 ) ) ( not ( = ?auto_833994 ?auto_834007 ) ) ( not ( = ?auto_833994 ?auto_834008 ) ) ( not ( = ?auto_833994 ?auto_834009 ) ) ( not ( = ?auto_833994 ?auto_834010 ) ) ( not ( = ?auto_833995 ?auto_833996 ) ) ( not ( = ?auto_833995 ?auto_833997 ) ) ( not ( = ?auto_833995 ?auto_833998 ) ) ( not ( = ?auto_833995 ?auto_833999 ) ) ( not ( = ?auto_833995 ?auto_834000 ) ) ( not ( = ?auto_833995 ?auto_834001 ) ) ( not ( = ?auto_833995 ?auto_834002 ) ) ( not ( = ?auto_833995 ?auto_834003 ) ) ( not ( = ?auto_833995 ?auto_834004 ) ) ( not ( = ?auto_833995 ?auto_834005 ) ) ( not ( = ?auto_833995 ?auto_834006 ) ) ( not ( = ?auto_833995 ?auto_834007 ) ) ( not ( = ?auto_833995 ?auto_834008 ) ) ( not ( = ?auto_833995 ?auto_834009 ) ) ( not ( = ?auto_833995 ?auto_834010 ) ) ( not ( = ?auto_833996 ?auto_833997 ) ) ( not ( = ?auto_833996 ?auto_833998 ) ) ( not ( = ?auto_833996 ?auto_833999 ) ) ( not ( = ?auto_833996 ?auto_834000 ) ) ( not ( = ?auto_833996 ?auto_834001 ) ) ( not ( = ?auto_833996 ?auto_834002 ) ) ( not ( = ?auto_833996 ?auto_834003 ) ) ( not ( = ?auto_833996 ?auto_834004 ) ) ( not ( = ?auto_833996 ?auto_834005 ) ) ( not ( = ?auto_833996 ?auto_834006 ) ) ( not ( = ?auto_833996 ?auto_834007 ) ) ( not ( = ?auto_833996 ?auto_834008 ) ) ( not ( = ?auto_833996 ?auto_834009 ) ) ( not ( = ?auto_833996 ?auto_834010 ) ) ( not ( = ?auto_833997 ?auto_833998 ) ) ( not ( = ?auto_833997 ?auto_833999 ) ) ( not ( = ?auto_833997 ?auto_834000 ) ) ( not ( = ?auto_833997 ?auto_834001 ) ) ( not ( = ?auto_833997 ?auto_834002 ) ) ( not ( = ?auto_833997 ?auto_834003 ) ) ( not ( = ?auto_833997 ?auto_834004 ) ) ( not ( = ?auto_833997 ?auto_834005 ) ) ( not ( = ?auto_833997 ?auto_834006 ) ) ( not ( = ?auto_833997 ?auto_834007 ) ) ( not ( = ?auto_833997 ?auto_834008 ) ) ( not ( = ?auto_833997 ?auto_834009 ) ) ( not ( = ?auto_833997 ?auto_834010 ) ) ( not ( = ?auto_833998 ?auto_833999 ) ) ( not ( = ?auto_833998 ?auto_834000 ) ) ( not ( = ?auto_833998 ?auto_834001 ) ) ( not ( = ?auto_833998 ?auto_834002 ) ) ( not ( = ?auto_833998 ?auto_834003 ) ) ( not ( = ?auto_833998 ?auto_834004 ) ) ( not ( = ?auto_833998 ?auto_834005 ) ) ( not ( = ?auto_833998 ?auto_834006 ) ) ( not ( = ?auto_833998 ?auto_834007 ) ) ( not ( = ?auto_833998 ?auto_834008 ) ) ( not ( = ?auto_833998 ?auto_834009 ) ) ( not ( = ?auto_833998 ?auto_834010 ) ) ( not ( = ?auto_833999 ?auto_834000 ) ) ( not ( = ?auto_833999 ?auto_834001 ) ) ( not ( = ?auto_833999 ?auto_834002 ) ) ( not ( = ?auto_833999 ?auto_834003 ) ) ( not ( = ?auto_833999 ?auto_834004 ) ) ( not ( = ?auto_833999 ?auto_834005 ) ) ( not ( = ?auto_833999 ?auto_834006 ) ) ( not ( = ?auto_833999 ?auto_834007 ) ) ( not ( = ?auto_833999 ?auto_834008 ) ) ( not ( = ?auto_833999 ?auto_834009 ) ) ( not ( = ?auto_833999 ?auto_834010 ) ) ( not ( = ?auto_834000 ?auto_834001 ) ) ( not ( = ?auto_834000 ?auto_834002 ) ) ( not ( = ?auto_834000 ?auto_834003 ) ) ( not ( = ?auto_834000 ?auto_834004 ) ) ( not ( = ?auto_834000 ?auto_834005 ) ) ( not ( = ?auto_834000 ?auto_834006 ) ) ( not ( = ?auto_834000 ?auto_834007 ) ) ( not ( = ?auto_834000 ?auto_834008 ) ) ( not ( = ?auto_834000 ?auto_834009 ) ) ( not ( = ?auto_834000 ?auto_834010 ) ) ( not ( = ?auto_834001 ?auto_834002 ) ) ( not ( = ?auto_834001 ?auto_834003 ) ) ( not ( = ?auto_834001 ?auto_834004 ) ) ( not ( = ?auto_834001 ?auto_834005 ) ) ( not ( = ?auto_834001 ?auto_834006 ) ) ( not ( = ?auto_834001 ?auto_834007 ) ) ( not ( = ?auto_834001 ?auto_834008 ) ) ( not ( = ?auto_834001 ?auto_834009 ) ) ( not ( = ?auto_834001 ?auto_834010 ) ) ( not ( = ?auto_834002 ?auto_834003 ) ) ( not ( = ?auto_834002 ?auto_834004 ) ) ( not ( = ?auto_834002 ?auto_834005 ) ) ( not ( = ?auto_834002 ?auto_834006 ) ) ( not ( = ?auto_834002 ?auto_834007 ) ) ( not ( = ?auto_834002 ?auto_834008 ) ) ( not ( = ?auto_834002 ?auto_834009 ) ) ( not ( = ?auto_834002 ?auto_834010 ) ) ( not ( = ?auto_834003 ?auto_834004 ) ) ( not ( = ?auto_834003 ?auto_834005 ) ) ( not ( = ?auto_834003 ?auto_834006 ) ) ( not ( = ?auto_834003 ?auto_834007 ) ) ( not ( = ?auto_834003 ?auto_834008 ) ) ( not ( = ?auto_834003 ?auto_834009 ) ) ( not ( = ?auto_834003 ?auto_834010 ) ) ( not ( = ?auto_834004 ?auto_834005 ) ) ( not ( = ?auto_834004 ?auto_834006 ) ) ( not ( = ?auto_834004 ?auto_834007 ) ) ( not ( = ?auto_834004 ?auto_834008 ) ) ( not ( = ?auto_834004 ?auto_834009 ) ) ( not ( = ?auto_834004 ?auto_834010 ) ) ( not ( = ?auto_834005 ?auto_834006 ) ) ( not ( = ?auto_834005 ?auto_834007 ) ) ( not ( = ?auto_834005 ?auto_834008 ) ) ( not ( = ?auto_834005 ?auto_834009 ) ) ( not ( = ?auto_834005 ?auto_834010 ) ) ( not ( = ?auto_834006 ?auto_834007 ) ) ( not ( = ?auto_834006 ?auto_834008 ) ) ( not ( = ?auto_834006 ?auto_834009 ) ) ( not ( = ?auto_834006 ?auto_834010 ) ) ( not ( = ?auto_834007 ?auto_834008 ) ) ( not ( = ?auto_834007 ?auto_834009 ) ) ( not ( = ?auto_834007 ?auto_834010 ) ) ( not ( = ?auto_834008 ?auto_834009 ) ) ( not ( = ?auto_834008 ?auto_834010 ) ) ( not ( = ?auto_834009 ?auto_834010 ) ) ( CLEAR ?auto_834007 ) ( ON ?auto_834008 ?auto_834009 ) ( CLEAR ?auto_834008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_833993 ?auto_833994 ?auto_833995 ?auto_833996 ?auto_833997 ?auto_833998 ?auto_833999 ?auto_834000 ?auto_834001 ?auto_834002 ?auto_834003 ?auto_834004 ?auto_834005 ?auto_834006 ?auto_834007 ?auto_834008 )
      ( MAKE-17PILE ?auto_833993 ?auto_833994 ?auto_833995 ?auto_833996 ?auto_833997 ?auto_833998 ?auto_833999 ?auto_834000 ?auto_834001 ?auto_834002 ?auto_834003 ?auto_834004 ?auto_834005 ?auto_834006 ?auto_834007 ?auto_834008 ?auto_834009 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_834063 - BLOCK
      ?auto_834064 - BLOCK
      ?auto_834065 - BLOCK
      ?auto_834066 - BLOCK
      ?auto_834067 - BLOCK
      ?auto_834068 - BLOCK
      ?auto_834069 - BLOCK
      ?auto_834070 - BLOCK
      ?auto_834071 - BLOCK
      ?auto_834072 - BLOCK
      ?auto_834073 - BLOCK
      ?auto_834074 - BLOCK
      ?auto_834075 - BLOCK
      ?auto_834076 - BLOCK
      ?auto_834077 - BLOCK
      ?auto_834078 - BLOCK
      ?auto_834079 - BLOCK
    )
    :vars
    (
      ?auto_834080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_834079 ?auto_834080 ) ( ON-TABLE ?auto_834063 ) ( ON ?auto_834064 ?auto_834063 ) ( ON ?auto_834065 ?auto_834064 ) ( ON ?auto_834066 ?auto_834065 ) ( ON ?auto_834067 ?auto_834066 ) ( ON ?auto_834068 ?auto_834067 ) ( ON ?auto_834069 ?auto_834068 ) ( ON ?auto_834070 ?auto_834069 ) ( ON ?auto_834071 ?auto_834070 ) ( ON ?auto_834072 ?auto_834071 ) ( ON ?auto_834073 ?auto_834072 ) ( ON ?auto_834074 ?auto_834073 ) ( ON ?auto_834075 ?auto_834074 ) ( ON ?auto_834076 ?auto_834075 ) ( not ( = ?auto_834063 ?auto_834064 ) ) ( not ( = ?auto_834063 ?auto_834065 ) ) ( not ( = ?auto_834063 ?auto_834066 ) ) ( not ( = ?auto_834063 ?auto_834067 ) ) ( not ( = ?auto_834063 ?auto_834068 ) ) ( not ( = ?auto_834063 ?auto_834069 ) ) ( not ( = ?auto_834063 ?auto_834070 ) ) ( not ( = ?auto_834063 ?auto_834071 ) ) ( not ( = ?auto_834063 ?auto_834072 ) ) ( not ( = ?auto_834063 ?auto_834073 ) ) ( not ( = ?auto_834063 ?auto_834074 ) ) ( not ( = ?auto_834063 ?auto_834075 ) ) ( not ( = ?auto_834063 ?auto_834076 ) ) ( not ( = ?auto_834063 ?auto_834077 ) ) ( not ( = ?auto_834063 ?auto_834078 ) ) ( not ( = ?auto_834063 ?auto_834079 ) ) ( not ( = ?auto_834063 ?auto_834080 ) ) ( not ( = ?auto_834064 ?auto_834065 ) ) ( not ( = ?auto_834064 ?auto_834066 ) ) ( not ( = ?auto_834064 ?auto_834067 ) ) ( not ( = ?auto_834064 ?auto_834068 ) ) ( not ( = ?auto_834064 ?auto_834069 ) ) ( not ( = ?auto_834064 ?auto_834070 ) ) ( not ( = ?auto_834064 ?auto_834071 ) ) ( not ( = ?auto_834064 ?auto_834072 ) ) ( not ( = ?auto_834064 ?auto_834073 ) ) ( not ( = ?auto_834064 ?auto_834074 ) ) ( not ( = ?auto_834064 ?auto_834075 ) ) ( not ( = ?auto_834064 ?auto_834076 ) ) ( not ( = ?auto_834064 ?auto_834077 ) ) ( not ( = ?auto_834064 ?auto_834078 ) ) ( not ( = ?auto_834064 ?auto_834079 ) ) ( not ( = ?auto_834064 ?auto_834080 ) ) ( not ( = ?auto_834065 ?auto_834066 ) ) ( not ( = ?auto_834065 ?auto_834067 ) ) ( not ( = ?auto_834065 ?auto_834068 ) ) ( not ( = ?auto_834065 ?auto_834069 ) ) ( not ( = ?auto_834065 ?auto_834070 ) ) ( not ( = ?auto_834065 ?auto_834071 ) ) ( not ( = ?auto_834065 ?auto_834072 ) ) ( not ( = ?auto_834065 ?auto_834073 ) ) ( not ( = ?auto_834065 ?auto_834074 ) ) ( not ( = ?auto_834065 ?auto_834075 ) ) ( not ( = ?auto_834065 ?auto_834076 ) ) ( not ( = ?auto_834065 ?auto_834077 ) ) ( not ( = ?auto_834065 ?auto_834078 ) ) ( not ( = ?auto_834065 ?auto_834079 ) ) ( not ( = ?auto_834065 ?auto_834080 ) ) ( not ( = ?auto_834066 ?auto_834067 ) ) ( not ( = ?auto_834066 ?auto_834068 ) ) ( not ( = ?auto_834066 ?auto_834069 ) ) ( not ( = ?auto_834066 ?auto_834070 ) ) ( not ( = ?auto_834066 ?auto_834071 ) ) ( not ( = ?auto_834066 ?auto_834072 ) ) ( not ( = ?auto_834066 ?auto_834073 ) ) ( not ( = ?auto_834066 ?auto_834074 ) ) ( not ( = ?auto_834066 ?auto_834075 ) ) ( not ( = ?auto_834066 ?auto_834076 ) ) ( not ( = ?auto_834066 ?auto_834077 ) ) ( not ( = ?auto_834066 ?auto_834078 ) ) ( not ( = ?auto_834066 ?auto_834079 ) ) ( not ( = ?auto_834066 ?auto_834080 ) ) ( not ( = ?auto_834067 ?auto_834068 ) ) ( not ( = ?auto_834067 ?auto_834069 ) ) ( not ( = ?auto_834067 ?auto_834070 ) ) ( not ( = ?auto_834067 ?auto_834071 ) ) ( not ( = ?auto_834067 ?auto_834072 ) ) ( not ( = ?auto_834067 ?auto_834073 ) ) ( not ( = ?auto_834067 ?auto_834074 ) ) ( not ( = ?auto_834067 ?auto_834075 ) ) ( not ( = ?auto_834067 ?auto_834076 ) ) ( not ( = ?auto_834067 ?auto_834077 ) ) ( not ( = ?auto_834067 ?auto_834078 ) ) ( not ( = ?auto_834067 ?auto_834079 ) ) ( not ( = ?auto_834067 ?auto_834080 ) ) ( not ( = ?auto_834068 ?auto_834069 ) ) ( not ( = ?auto_834068 ?auto_834070 ) ) ( not ( = ?auto_834068 ?auto_834071 ) ) ( not ( = ?auto_834068 ?auto_834072 ) ) ( not ( = ?auto_834068 ?auto_834073 ) ) ( not ( = ?auto_834068 ?auto_834074 ) ) ( not ( = ?auto_834068 ?auto_834075 ) ) ( not ( = ?auto_834068 ?auto_834076 ) ) ( not ( = ?auto_834068 ?auto_834077 ) ) ( not ( = ?auto_834068 ?auto_834078 ) ) ( not ( = ?auto_834068 ?auto_834079 ) ) ( not ( = ?auto_834068 ?auto_834080 ) ) ( not ( = ?auto_834069 ?auto_834070 ) ) ( not ( = ?auto_834069 ?auto_834071 ) ) ( not ( = ?auto_834069 ?auto_834072 ) ) ( not ( = ?auto_834069 ?auto_834073 ) ) ( not ( = ?auto_834069 ?auto_834074 ) ) ( not ( = ?auto_834069 ?auto_834075 ) ) ( not ( = ?auto_834069 ?auto_834076 ) ) ( not ( = ?auto_834069 ?auto_834077 ) ) ( not ( = ?auto_834069 ?auto_834078 ) ) ( not ( = ?auto_834069 ?auto_834079 ) ) ( not ( = ?auto_834069 ?auto_834080 ) ) ( not ( = ?auto_834070 ?auto_834071 ) ) ( not ( = ?auto_834070 ?auto_834072 ) ) ( not ( = ?auto_834070 ?auto_834073 ) ) ( not ( = ?auto_834070 ?auto_834074 ) ) ( not ( = ?auto_834070 ?auto_834075 ) ) ( not ( = ?auto_834070 ?auto_834076 ) ) ( not ( = ?auto_834070 ?auto_834077 ) ) ( not ( = ?auto_834070 ?auto_834078 ) ) ( not ( = ?auto_834070 ?auto_834079 ) ) ( not ( = ?auto_834070 ?auto_834080 ) ) ( not ( = ?auto_834071 ?auto_834072 ) ) ( not ( = ?auto_834071 ?auto_834073 ) ) ( not ( = ?auto_834071 ?auto_834074 ) ) ( not ( = ?auto_834071 ?auto_834075 ) ) ( not ( = ?auto_834071 ?auto_834076 ) ) ( not ( = ?auto_834071 ?auto_834077 ) ) ( not ( = ?auto_834071 ?auto_834078 ) ) ( not ( = ?auto_834071 ?auto_834079 ) ) ( not ( = ?auto_834071 ?auto_834080 ) ) ( not ( = ?auto_834072 ?auto_834073 ) ) ( not ( = ?auto_834072 ?auto_834074 ) ) ( not ( = ?auto_834072 ?auto_834075 ) ) ( not ( = ?auto_834072 ?auto_834076 ) ) ( not ( = ?auto_834072 ?auto_834077 ) ) ( not ( = ?auto_834072 ?auto_834078 ) ) ( not ( = ?auto_834072 ?auto_834079 ) ) ( not ( = ?auto_834072 ?auto_834080 ) ) ( not ( = ?auto_834073 ?auto_834074 ) ) ( not ( = ?auto_834073 ?auto_834075 ) ) ( not ( = ?auto_834073 ?auto_834076 ) ) ( not ( = ?auto_834073 ?auto_834077 ) ) ( not ( = ?auto_834073 ?auto_834078 ) ) ( not ( = ?auto_834073 ?auto_834079 ) ) ( not ( = ?auto_834073 ?auto_834080 ) ) ( not ( = ?auto_834074 ?auto_834075 ) ) ( not ( = ?auto_834074 ?auto_834076 ) ) ( not ( = ?auto_834074 ?auto_834077 ) ) ( not ( = ?auto_834074 ?auto_834078 ) ) ( not ( = ?auto_834074 ?auto_834079 ) ) ( not ( = ?auto_834074 ?auto_834080 ) ) ( not ( = ?auto_834075 ?auto_834076 ) ) ( not ( = ?auto_834075 ?auto_834077 ) ) ( not ( = ?auto_834075 ?auto_834078 ) ) ( not ( = ?auto_834075 ?auto_834079 ) ) ( not ( = ?auto_834075 ?auto_834080 ) ) ( not ( = ?auto_834076 ?auto_834077 ) ) ( not ( = ?auto_834076 ?auto_834078 ) ) ( not ( = ?auto_834076 ?auto_834079 ) ) ( not ( = ?auto_834076 ?auto_834080 ) ) ( not ( = ?auto_834077 ?auto_834078 ) ) ( not ( = ?auto_834077 ?auto_834079 ) ) ( not ( = ?auto_834077 ?auto_834080 ) ) ( not ( = ?auto_834078 ?auto_834079 ) ) ( not ( = ?auto_834078 ?auto_834080 ) ) ( not ( = ?auto_834079 ?auto_834080 ) ) ( ON ?auto_834078 ?auto_834079 ) ( CLEAR ?auto_834076 ) ( ON ?auto_834077 ?auto_834078 ) ( CLEAR ?auto_834077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_834063 ?auto_834064 ?auto_834065 ?auto_834066 ?auto_834067 ?auto_834068 ?auto_834069 ?auto_834070 ?auto_834071 ?auto_834072 ?auto_834073 ?auto_834074 ?auto_834075 ?auto_834076 ?auto_834077 )
      ( MAKE-17PILE ?auto_834063 ?auto_834064 ?auto_834065 ?auto_834066 ?auto_834067 ?auto_834068 ?auto_834069 ?auto_834070 ?auto_834071 ?auto_834072 ?auto_834073 ?auto_834074 ?auto_834075 ?auto_834076 ?auto_834077 ?auto_834078 ?auto_834079 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_834133 - BLOCK
      ?auto_834134 - BLOCK
      ?auto_834135 - BLOCK
      ?auto_834136 - BLOCK
      ?auto_834137 - BLOCK
      ?auto_834138 - BLOCK
      ?auto_834139 - BLOCK
      ?auto_834140 - BLOCK
      ?auto_834141 - BLOCK
      ?auto_834142 - BLOCK
      ?auto_834143 - BLOCK
      ?auto_834144 - BLOCK
      ?auto_834145 - BLOCK
      ?auto_834146 - BLOCK
      ?auto_834147 - BLOCK
      ?auto_834148 - BLOCK
      ?auto_834149 - BLOCK
    )
    :vars
    (
      ?auto_834150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_834149 ?auto_834150 ) ( ON-TABLE ?auto_834133 ) ( ON ?auto_834134 ?auto_834133 ) ( ON ?auto_834135 ?auto_834134 ) ( ON ?auto_834136 ?auto_834135 ) ( ON ?auto_834137 ?auto_834136 ) ( ON ?auto_834138 ?auto_834137 ) ( ON ?auto_834139 ?auto_834138 ) ( ON ?auto_834140 ?auto_834139 ) ( ON ?auto_834141 ?auto_834140 ) ( ON ?auto_834142 ?auto_834141 ) ( ON ?auto_834143 ?auto_834142 ) ( ON ?auto_834144 ?auto_834143 ) ( ON ?auto_834145 ?auto_834144 ) ( not ( = ?auto_834133 ?auto_834134 ) ) ( not ( = ?auto_834133 ?auto_834135 ) ) ( not ( = ?auto_834133 ?auto_834136 ) ) ( not ( = ?auto_834133 ?auto_834137 ) ) ( not ( = ?auto_834133 ?auto_834138 ) ) ( not ( = ?auto_834133 ?auto_834139 ) ) ( not ( = ?auto_834133 ?auto_834140 ) ) ( not ( = ?auto_834133 ?auto_834141 ) ) ( not ( = ?auto_834133 ?auto_834142 ) ) ( not ( = ?auto_834133 ?auto_834143 ) ) ( not ( = ?auto_834133 ?auto_834144 ) ) ( not ( = ?auto_834133 ?auto_834145 ) ) ( not ( = ?auto_834133 ?auto_834146 ) ) ( not ( = ?auto_834133 ?auto_834147 ) ) ( not ( = ?auto_834133 ?auto_834148 ) ) ( not ( = ?auto_834133 ?auto_834149 ) ) ( not ( = ?auto_834133 ?auto_834150 ) ) ( not ( = ?auto_834134 ?auto_834135 ) ) ( not ( = ?auto_834134 ?auto_834136 ) ) ( not ( = ?auto_834134 ?auto_834137 ) ) ( not ( = ?auto_834134 ?auto_834138 ) ) ( not ( = ?auto_834134 ?auto_834139 ) ) ( not ( = ?auto_834134 ?auto_834140 ) ) ( not ( = ?auto_834134 ?auto_834141 ) ) ( not ( = ?auto_834134 ?auto_834142 ) ) ( not ( = ?auto_834134 ?auto_834143 ) ) ( not ( = ?auto_834134 ?auto_834144 ) ) ( not ( = ?auto_834134 ?auto_834145 ) ) ( not ( = ?auto_834134 ?auto_834146 ) ) ( not ( = ?auto_834134 ?auto_834147 ) ) ( not ( = ?auto_834134 ?auto_834148 ) ) ( not ( = ?auto_834134 ?auto_834149 ) ) ( not ( = ?auto_834134 ?auto_834150 ) ) ( not ( = ?auto_834135 ?auto_834136 ) ) ( not ( = ?auto_834135 ?auto_834137 ) ) ( not ( = ?auto_834135 ?auto_834138 ) ) ( not ( = ?auto_834135 ?auto_834139 ) ) ( not ( = ?auto_834135 ?auto_834140 ) ) ( not ( = ?auto_834135 ?auto_834141 ) ) ( not ( = ?auto_834135 ?auto_834142 ) ) ( not ( = ?auto_834135 ?auto_834143 ) ) ( not ( = ?auto_834135 ?auto_834144 ) ) ( not ( = ?auto_834135 ?auto_834145 ) ) ( not ( = ?auto_834135 ?auto_834146 ) ) ( not ( = ?auto_834135 ?auto_834147 ) ) ( not ( = ?auto_834135 ?auto_834148 ) ) ( not ( = ?auto_834135 ?auto_834149 ) ) ( not ( = ?auto_834135 ?auto_834150 ) ) ( not ( = ?auto_834136 ?auto_834137 ) ) ( not ( = ?auto_834136 ?auto_834138 ) ) ( not ( = ?auto_834136 ?auto_834139 ) ) ( not ( = ?auto_834136 ?auto_834140 ) ) ( not ( = ?auto_834136 ?auto_834141 ) ) ( not ( = ?auto_834136 ?auto_834142 ) ) ( not ( = ?auto_834136 ?auto_834143 ) ) ( not ( = ?auto_834136 ?auto_834144 ) ) ( not ( = ?auto_834136 ?auto_834145 ) ) ( not ( = ?auto_834136 ?auto_834146 ) ) ( not ( = ?auto_834136 ?auto_834147 ) ) ( not ( = ?auto_834136 ?auto_834148 ) ) ( not ( = ?auto_834136 ?auto_834149 ) ) ( not ( = ?auto_834136 ?auto_834150 ) ) ( not ( = ?auto_834137 ?auto_834138 ) ) ( not ( = ?auto_834137 ?auto_834139 ) ) ( not ( = ?auto_834137 ?auto_834140 ) ) ( not ( = ?auto_834137 ?auto_834141 ) ) ( not ( = ?auto_834137 ?auto_834142 ) ) ( not ( = ?auto_834137 ?auto_834143 ) ) ( not ( = ?auto_834137 ?auto_834144 ) ) ( not ( = ?auto_834137 ?auto_834145 ) ) ( not ( = ?auto_834137 ?auto_834146 ) ) ( not ( = ?auto_834137 ?auto_834147 ) ) ( not ( = ?auto_834137 ?auto_834148 ) ) ( not ( = ?auto_834137 ?auto_834149 ) ) ( not ( = ?auto_834137 ?auto_834150 ) ) ( not ( = ?auto_834138 ?auto_834139 ) ) ( not ( = ?auto_834138 ?auto_834140 ) ) ( not ( = ?auto_834138 ?auto_834141 ) ) ( not ( = ?auto_834138 ?auto_834142 ) ) ( not ( = ?auto_834138 ?auto_834143 ) ) ( not ( = ?auto_834138 ?auto_834144 ) ) ( not ( = ?auto_834138 ?auto_834145 ) ) ( not ( = ?auto_834138 ?auto_834146 ) ) ( not ( = ?auto_834138 ?auto_834147 ) ) ( not ( = ?auto_834138 ?auto_834148 ) ) ( not ( = ?auto_834138 ?auto_834149 ) ) ( not ( = ?auto_834138 ?auto_834150 ) ) ( not ( = ?auto_834139 ?auto_834140 ) ) ( not ( = ?auto_834139 ?auto_834141 ) ) ( not ( = ?auto_834139 ?auto_834142 ) ) ( not ( = ?auto_834139 ?auto_834143 ) ) ( not ( = ?auto_834139 ?auto_834144 ) ) ( not ( = ?auto_834139 ?auto_834145 ) ) ( not ( = ?auto_834139 ?auto_834146 ) ) ( not ( = ?auto_834139 ?auto_834147 ) ) ( not ( = ?auto_834139 ?auto_834148 ) ) ( not ( = ?auto_834139 ?auto_834149 ) ) ( not ( = ?auto_834139 ?auto_834150 ) ) ( not ( = ?auto_834140 ?auto_834141 ) ) ( not ( = ?auto_834140 ?auto_834142 ) ) ( not ( = ?auto_834140 ?auto_834143 ) ) ( not ( = ?auto_834140 ?auto_834144 ) ) ( not ( = ?auto_834140 ?auto_834145 ) ) ( not ( = ?auto_834140 ?auto_834146 ) ) ( not ( = ?auto_834140 ?auto_834147 ) ) ( not ( = ?auto_834140 ?auto_834148 ) ) ( not ( = ?auto_834140 ?auto_834149 ) ) ( not ( = ?auto_834140 ?auto_834150 ) ) ( not ( = ?auto_834141 ?auto_834142 ) ) ( not ( = ?auto_834141 ?auto_834143 ) ) ( not ( = ?auto_834141 ?auto_834144 ) ) ( not ( = ?auto_834141 ?auto_834145 ) ) ( not ( = ?auto_834141 ?auto_834146 ) ) ( not ( = ?auto_834141 ?auto_834147 ) ) ( not ( = ?auto_834141 ?auto_834148 ) ) ( not ( = ?auto_834141 ?auto_834149 ) ) ( not ( = ?auto_834141 ?auto_834150 ) ) ( not ( = ?auto_834142 ?auto_834143 ) ) ( not ( = ?auto_834142 ?auto_834144 ) ) ( not ( = ?auto_834142 ?auto_834145 ) ) ( not ( = ?auto_834142 ?auto_834146 ) ) ( not ( = ?auto_834142 ?auto_834147 ) ) ( not ( = ?auto_834142 ?auto_834148 ) ) ( not ( = ?auto_834142 ?auto_834149 ) ) ( not ( = ?auto_834142 ?auto_834150 ) ) ( not ( = ?auto_834143 ?auto_834144 ) ) ( not ( = ?auto_834143 ?auto_834145 ) ) ( not ( = ?auto_834143 ?auto_834146 ) ) ( not ( = ?auto_834143 ?auto_834147 ) ) ( not ( = ?auto_834143 ?auto_834148 ) ) ( not ( = ?auto_834143 ?auto_834149 ) ) ( not ( = ?auto_834143 ?auto_834150 ) ) ( not ( = ?auto_834144 ?auto_834145 ) ) ( not ( = ?auto_834144 ?auto_834146 ) ) ( not ( = ?auto_834144 ?auto_834147 ) ) ( not ( = ?auto_834144 ?auto_834148 ) ) ( not ( = ?auto_834144 ?auto_834149 ) ) ( not ( = ?auto_834144 ?auto_834150 ) ) ( not ( = ?auto_834145 ?auto_834146 ) ) ( not ( = ?auto_834145 ?auto_834147 ) ) ( not ( = ?auto_834145 ?auto_834148 ) ) ( not ( = ?auto_834145 ?auto_834149 ) ) ( not ( = ?auto_834145 ?auto_834150 ) ) ( not ( = ?auto_834146 ?auto_834147 ) ) ( not ( = ?auto_834146 ?auto_834148 ) ) ( not ( = ?auto_834146 ?auto_834149 ) ) ( not ( = ?auto_834146 ?auto_834150 ) ) ( not ( = ?auto_834147 ?auto_834148 ) ) ( not ( = ?auto_834147 ?auto_834149 ) ) ( not ( = ?auto_834147 ?auto_834150 ) ) ( not ( = ?auto_834148 ?auto_834149 ) ) ( not ( = ?auto_834148 ?auto_834150 ) ) ( not ( = ?auto_834149 ?auto_834150 ) ) ( ON ?auto_834148 ?auto_834149 ) ( ON ?auto_834147 ?auto_834148 ) ( CLEAR ?auto_834145 ) ( ON ?auto_834146 ?auto_834147 ) ( CLEAR ?auto_834146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_834133 ?auto_834134 ?auto_834135 ?auto_834136 ?auto_834137 ?auto_834138 ?auto_834139 ?auto_834140 ?auto_834141 ?auto_834142 ?auto_834143 ?auto_834144 ?auto_834145 ?auto_834146 )
      ( MAKE-17PILE ?auto_834133 ?auto_834134 ?auto_834135 ?auto_834136 ?auto_834137 ?auto_834138 ?auto_834139 ?auto_834140 ?auto_834141 ?auto_834142 ?auto_834143 ?auto_834144 ?auto_834145 ?auto_834146 ?auto_834147 ?auto_834148 ?auto_834149 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_834203 - BLOCK
      ?auto_834204 - BLOCK
      ?auto_834205 - BLOCK
      ?auto_834206 - BLOCK
      ?auto_834207 - BLOCK
      ?auto_834208 - BLOCK
      ?auto_834209 - BLOCK
      ?auto_834210 - BLOCK
      ?auto_834211 - BLOCK
      ?auto_834212 - BLOCK
      ?auto_834213 - BLOCK
      ?auto_834214 - BLOCK
      ?auto_834215 - BLOCK
      ?auto_834216 - BLOCK
      ?auto_834217 - BLOCK
      ?auto_834218 - BLOCK
      ?auto_834219 - BLOCK
    )
    :vars
    (
      ?auto_834220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_834219 ?auto_834220 ) ( ON-TABLE ?auto_834203 ) ( ON ?auto_834204 ?auto_834203 ) ( ON ?auto_834205 ?auto_834204 ) ( ON ?auto_834206 ?auto_834205 ) ( ON ?auto_834207 ?auto_834206 ) ( ON ?auto_834208 ?auto_834207 ) ( ON ?auto_834209 ?auto_834208 ) ( ON ?auto_834210 ?auto_834209 ) ( ON ?auto_834211 ?auto_834210 ) ( ON ?auto_834212 ?auto_834211 ) ( ON ?auto_834213 ?auto_834212 ) ( ON ?auto_834214 ?auto_834213 ) ( not ( = ?auto_834203 ?auto_834204 ) ) ( not ( = ?auto_834203 ?auto_834205 ) ) ( not ( = ?auto_834203 ?auto_834206 ) ) ( not ( = ?auto_834203 ?auto_834207 ) ) ( not ( = ?auto_834203 ?auto_834208 ) ) ( not ( = ?auto_834203 ?auto_834209 ) ) ( not ( = ?auto_834203 ?auto_834210 ) ) ( not ( = ?auto_834203 ?auto_834211 ) ) ( not ( = ?auto_834203 ?auto_834212 ) ) ( not ( = ?auto_834203 ?auto_834213 ) ) ( not ( = ?auto_834203 ?auto_834214 ) ) ( not ( = ?auto_834203 ?auto_834215 ) ) ( not ( = ?auto_834203 ?auto_834216 ) ) ( not ( = ?auto_834203 ?auto_834217 ) ) ( not ( = ?auto_834203 ?auto_834218 ) ) ( not ( = ?auto_834203 ?auto_834219 ) ) ( not ( = ?auto_834203 ?auto_834220 ) ) ( not ( = ?auto_834204 ?auto_834205 ) ) ( not ( = ?auto_834204 ?auto_834206 ) ) ( not ( = ?auto_834204 ?auto_834207 ) ) ( not ( = ?auto_834204 ?auto_834208 ) ) ( not ( = ?auto_834204 ?auto_834209 ) ) ( not ( = ?auto_834204 ?auto_834210 ) ) ( not ( = ?auto_834204 ?auto_834211 ) ) ( not ( = ?auto_834204 ?auto_834212 ) ) ( not ( = ?auto_834204 ?auto_834213 ) ) ( not ( = ?auto_834204 ?auto_834214 ) ) ( not ( = ?auto_834204 ?auto_834215 ) ) ( not ( = ?auto_834204 ?auto_834216 ) ) ( not ( = ?auto_834204 ?auto_834217 ) ) ( not ( = ?auto_834204 ?auto_834218 ) ) ( not ( = ?auto_834204 ?auto_834219 ) ) ( not ( = ?auto_834204 ?auto_834220 ) ) ( not ( = ?auto_834205 ?auto_834206 ) ) ( not ( = ?auto_834205 ?auto_834207 ) ) ( not ( = ?auto_834205 ?auto_834208 ) ) ( not ( = ?auto_834205 ?auto_834209 ) ) ( not ( = ?auto_834205 ?auto_834210 ) ) ( not ( = ?auto_834205 ?auto_834211 ) ) ( not ( = ?auto_834205 ?auto_834212 ) ) ( not ( = ?auto_834205 ?auto_834213 ) ) ( not ( = ?auto_834205 ?auto_834214 ) ) ( not ( = ?auto_834205 ?auto_834215 ) ) ( not ( = ?auto_834205 ?auto_834216 ) ) ( not ( = ?auto_834205 ?auto_834217 ) ) ( not ( = ?auto_834205 ?auto_834218 ) ) ( not ( = ?auto_834205 ?auto_834219 ) ) ( not ( = ?auto_834205 ?auto_834220 ) ) ( not ( = ?auto_834206 ?auto_834207 ) ) ( not ( = ?auto_834206 ?auto_834208 ) ) ( not ( = ?auto_834206 ?auto_834209 ) ) ( not ( = ?auto_834206 ?auto_834210 ) ) ( not ( = ?auto_834206 ?auto_834211 ) ) ( not ( = ?auto_834206 ?auto_834212 ) ) ( not ( = ?auto_834206 ?auto_834213 ) ) ( not ( = ?auto_834206 ?auto_834214 ) ) ( not ( = ?auto_834206 ?auto_834215 ) ) ( not ( = ?auto_834206 ?auto_834216 ) ) ( not ( = ?auto_834206 ?auto_834217 ) ) ( not ( = ?auto_834206 ?auto_834218 ) ) ( not ( = ?auto_834206 ?auto_834219 ) ) ( not ( = ?auto_834206 ?auto_834220 ) ) ( not ( = ?auto_834207 ?auto_834208 ) ) ( not ( = ?auto_834207 ?auto_834209 ) ) ( not ( = ?auto_834207 ?auto_834210 ) ) ( not ( = ?auto_834207 ?auto_834211 ) ) ( not ( = ?auto_834207 ?auto_834212 ) ) ( not ( = ?auto_834207 ?auto_834213 ) ) ( not ( = ?auto_834207 ?auto_834214 ) ) ( not ( = ?auto_834207 ?auto_834215 ) ) ( not ( = ?auto_834207 ?auto_834216 ) ) ( not ( = ?auto_834207 ?auto_834217 ) ) ( not ( = ?auto_834207 ?auto_834218 ) ) ( not ( = ?auto_834207 ?auto_834219 ) ) ( not ( = ?auto_834207 ?auto_834220 ) ) ( not ( = ?auto_834208 ?auto_834209 ) ) ( not ( = ?auto_834208 ?auto_834210 ) ) ( not ( = ?auto_834208 ?auto_834211 ) ) ( not ( = ?auto_834208 ?auto_834212 ) ) ( not ( = ?auto_834208 ?auto_834213 ) ) ( not ( = ?auto_834208 ?auto_834214 ) ) ( not ( = ?auto_834208 ?auto_834215 ) ) ( not ( = ?auto_834208 ?auto_834216 ) ) ( not ( = ?auto_834208 ?auto_834217 ) ) ( not ( = ?auto_834208 ?auto_834218 ) ) ( not ( = ?auto_834208 ?auto_834219 ) ) ( not ( = ?auto_834208 ?auto_834220 ) ) ( not ( = ?auto_834209 ?auto_834210 ) ) ( not ( = ?auto_834209 ?auto_834211 ) ) ( not ( = ?auto_834209 ?auto_834212 ) ) ( not ( = ?auto_834209 ?auto_834213 ) ) ( not ( = ?auto_834209 ?auto_834214 ) ) ( not ( = ?auto_834209 ?auto_834215 ) ) ( not ( = ?auto_834209 ?auto_834216 ) ) ( not ( = ?auto_834209 ?auto_834217 ) ) ( not ( = ?auto_834209 ?auto_834218 ) ) ( not ( = ?auto_834209 ?auto_834219 ) ) ( not ( = ?auto_834209 ?auto_834220 ) ) ( not ( = ?auto_834210 ?auto_834211 ) ) ( not ( = ?auto_834210 ?auto_834212 ) ) ( not ( = ?auto_834210 ?auto_834213 ) ) ( not ( = ?auto_834210 ?auto_834214 ) ) ( not ( = ?auto_834210 ?auto_834215 ) ) ( not ( = ?auto_834210 ?auto_834216 ) ) ( not ( = ?auto_834210 ?auto_834217 ) ) ( not ( = ?auto_834210 ?auto_834218 ) ) ( not ( = ?auto_834210 ?auto_834219 ) ) ( not ( = ?auto_834210 ?auto_834220 ) ) ( not ( = ?auto_834211 ?auto_834212 ) ) ( not ( = ?auto_834211 ?auto_834213 ) ) ( not ( = ?auto_834211 ?auto_834214 ) ) ( not ( = ?auto_834211 ?auto_834215 ) ) ( not ( = ?auto_834211 ?auto_834216 ) ) ( not ( = ?auto_834211 ?auto_834217 ) ) ( not ( = ?auto_834211 ?auto_834218 ) ) ( not ( = ?auto_834211 ?auto_834219 ) ) ( not ( = ?auto_834211 ?auto_834220 ) ) ( not ( = ?auto_834212 ?auto_834213 ) ) ( not ( = ?auto_834212 ?auto_834214 ) ) ( not ( = ?auto_834212 ?auto_834215 ) ) ( not ( = ?auto_834212 ?auto_834216 ) ) ( not ( = ?auto_834212 ?auto_834217 ) ) ( not ( = ?auto_834212 ?auto_834218 ) ) ( not ( = ?auto_834212 ?auto_834219 ) ) ( not ( = ?auto_834212 ?auto_834220 ) ) ( not ( = ?auto_834213 ?auto_834214 ) ) ( not ( = ?auto_834213 ?auto_834215 ) ) ( not ( = ?auto_834213 ?auto_834216 ) ) ( not ( = ?auto_834213 ?auto_834217 ) ) ( not ( = ?auto_834213 ?auto_834218 ) ) ( not ( = ?auto_834213 ?auto_834219 ) ) ( not ( = ?auto_834213 ?auto_834220 ) ) ( not ( = ?auto_834214 ?auto_834215 ) ) ( not ( = ?auto_834214 ?auto_834216 ) ) ( not ( = ?auto_834214 ?auto_834217 ) ) ( not ( = ?auto_834214 ?auto_834218 ) ) ( not ( = ?auto_834214 ?auto_834219 ) ) ( not ( = ?auto_834214 ?auto_834220 ) ) ( not ( = ?auto_834215 ?auto_834216 ) ) ( not ( = ?auto_834215 ?auto_834217 ) ) ( not ( = ?auto_834215 ?auto_834218 ) ) ( not ( = ?auto_834215 ?auto_834219 ) ) ( not ( = ?auto_834215 ?auto_834220 ) ) ( not ( = ?auto_834216 ?auto_834217 ) ) ( not ( = ?auto_834216 ?auto_834218 ) ) ( not ( = ?auto_834216 ?auto_834219 ) ) ( not ( = ?auto_834216 ?auto_834220 ) ) ( not ( = ?auto_834217 ?auto_834218 ) ) ( not ( = ?auto_834217 ?auto_834219 ) ) ( not ( = ?auto_834217 ?auto_834220 ) ) ( not ( = ?auto_834218 ?auto_834219 ) ) ( not ( = ?auto_834218 ?auto_834220 ) ) ( not ( = ?auto_834219 ?auto_834220 ) ) ( ON ?auto_834218 ?auto_834219 ) ( ON ?auto_834217 ?auto_834218 ) ( ON ?auto_834216 ?auto_834217 ) ( CLEAR ?auto_834214 ) ( ON ?auto_834215 ?auto_834216 ) ( CLEAR ?auto_834215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_834203 ?auto_834204 ?auto_834205 ?auto_834206 ?auto_834207 ?auto_834208 ?auto_834209 ?auto_834210 ?auto_834211 ?auto_834212 ?auto_834213 ?auto_834214 ?auto_834215 )
      ( MAKE-17PILE ?auto_834203 ?auto_834204 ?auto_834205 ?auto_834206 ?auto_834207 ?auto_834208 ?auto_834209 ?auto_834210 ?auto_834211 ?auto_834212 ?auto_834213 ?auto_834214 ?auto_834215 ?auto_834216 ?auto_834217 ?auto_834218 ?auto_834219 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_834273 - BLOCK
      ?auto_834274 - BLOCK
      ?auto_834275 - BLOCK
      ?auto_834276 - BLOCK
      ?auto_834277 - BLOCK
      ?auto_834278 - BLOCK
      ?auto_834279 - BLOCK
      ?auto_834280 - BLOCK
      ?auto_834281 - BLOCK
      ?auto_834282 - BLOCK
      ?auto_834283 - BLOCK
      ?auto_834284 - BLOCK
      ?auto_834285 - BLOCK
      ?auto_834286 - BLOCK
      ?auto_834287 - BLOCK
      ?auto_834288 - BLOCK
      ?auto_834289 - BLOCK
    )
    :vars
    (
      ?auto_834290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_834289 ?auto_834290 ) ( ON-TABLE ?auto_834273 ) ( ON ?auto_834274 ?auto_834273 ) ( ON ?auto_834275 ?auto_834274 ) ( ON ?auto_834276 ?auto_834275 ) ( ON ?auto_834277 ?auto_834276 ) ( ON ?auto_834278 ?auto_834277 ) ( ON ?auto_834279 ?auto_834278 ) ( ON ?auto_834280 ?auto_834279 ) ( ON ?auto_834281 ?auto_834280 ) ( ON ?auto_834282 ?auto_834281 ) ( ON ?auto_834283 ?auto_834282 ) ( not ( = ?auto_834273 ?auto_834274 ) ) ( not ( = ?auto_834273 ?auto_834275 ) ) ( not ( = ?auto_834273 ?auto_834276 ) ) ( not ( = ?auto_834273 ?auto_834277 ) ) ( not ( = ?auto_834273 ?auto_834278 ) ) ( not ( = ?auto_834273 ?auto_834279 ) ) ( not ( = ?auto_834273 ?auto_834280 ) ) ( not ( = ?auto_834273 ?auto_834281 ) ) ( not ( = ?auto_834273 ?auto_834282 ) ) ( not ( = ?auto_834273 ?auto_834283 ) ) ( not ( = ?auto_834273 ?auto_834284 ) ) ( not ( = ?auto_834273 ?auto_834285 ) ) ( not ( = ?auto_834273 ?auto_834286 ) ) ( not ( = ?auto_834273 ?auto_834287 ) ) ( not ( = ?auto_834273 ?auto_834288 ) ) ( not ( = ?auto_834273 ?auto_834289 ) ) ( not ( = ?auto_834273 ?auto_834290 ) ) ( not ( = ?auto_834274 ?auto_834275 ) ) ( not ( = ?auto_834274 ?auto_834276 ) ) ( not ( = ?auto_834274 ?auto_834277 ) ) ( not ( = ?auto_834274 ?auto_834278 ) ) ( not ( = ?auto_834274 ?auto_834279 ) ) ( not ( = ?auto_834274 ?auto_834280 ) ) ( not ( = ?auto_834274 ?auto_834281 ) ) ( not ( = ?auto_834274 ?auto_834282 ) ) ( not ( = ?auto_834274 ?auto_834283 ) ) ( not ( = ?auto_834274 ?auto_834284 ) ) ( not ( = ?auto_834274 ?auto_834285 ) ) ( not ( = ?auto_834274 ?auto_834286 ) ) ( not ( = ?auto_834274 ?auto_834287 ) ) ( not ( = ?auto_834274 ?auto_834288 ) ) ( not ( = ?auto_834274 ?auto_834289 ) ) ( not ( = ?auto_834274 ?auto_834290 ) ) ( not ( = ?auto_834275 ?auto_834276 ) ) ( not ( = ?auto_834275 ?auto_834277 ) ) ( not ( = ?auto_834275 ?auto_834278 ) ) ( not ( = ?auto_834275 ?auto_834279 ) ) ( not ( = ?auto_834275 ?auto_834280 ) ) ( not ( = ?auto_834275 ?auto_834281 ) ) ( not ( = ?auto_834275 ?auto_834282 ) ) ( not ( = ?auto_834275 ?auto_834283 ) ) ( not ( = ?auto_834275 ?auto_834284 ) ) ( not ( = ?auto_834275 ?auto_834285 ) ) ( not ( = ?auto_834275 ?auto_834286 ) ) ( not ( = ?auto_834275 ?auto_834287 ) ) ( not ( = ?auto_834275 ?auto_834288 ) ) ( not ( = ?auto_834275 ?auto_834289 ) ) ( not ( = ?auto_834275 ?auto_834290 ) ) ( not ( = ?auto_834276 ?auto_834277 ) ) ( not ( = ?auto_834276 ?auto_834278 ) ) ( not ( = ?auto_834276 ?auto_834279 ) ) ( not ( = ?auto_834276 ?auto_834280 ) ) ( not ( = ?auto_834276 ?auto_834281 ) ) ( not ( = ?auto_834276 ?auto_834282 ) ) ( not ( = ?auto_834276 ?auto_834283 ) ) ( not ( = ?auto_834276 ?auto_834284 ) ) ( not ( = ?auto_834276 ?auto_834285 ) ) ( not ( = ?auto_834276 ?auto_834286 ) ) ( not ( = ?auto_834276 ?auto_834287 ) ) ( not ( = ?auto_834276 ?auto_834288 ) ) ( not ( = ?auto_834276 ?auto_834289 ) ) ( not ( = ?auto_834276 ?auto_834290 ) ) ( not ( = ?auto_834277 ?auto_834278 ) ) ( not ( = ?auto_834277 ?auto_834279 ) ) ( not ( = ?auto_834277 ?auto_834280 ) ) ( not ( = ?auto_834277 ?auto_834281 ) ) ( not ( = ?auto_834277 ?auto_834282 ) ) ( not ( = ?auto_834277 ?auto_834283 ) ) ( not ( = ?auto_834277 ?auto_834284 ) ) ( not ( = ?auto_834277 ?auto_834285 ) ) ( not ( = ?auto_834277 ?auto_834286 ) ) ( not ( = ?auto_834277 ?auto_834287 ) ) ( not ( = ?auto_834277 ?auto_834288 ) ) ( not ( = ?auto_834277 ?auto_834289 ) ) ( not ( = ?auto_834277 ?auto_834290 ) ) ( not ( = ?auto_834278 ?auto_834279 ) ) ( not ( = ?auto_834278 ?auto_834280 ) ) ( not ( = ?auto_834278 ?auto_834281 ) ) ( not ( = ?auto_834278 ?auto_834282 ) ) ( not ( = ?auto_834278 ?auto_834283 ) ) ( not ( = ?auto_834278 ?auto_834284 ) ) ( not ( = ?auto_834278 ?auto_834285 ) ) ( not ( = ?auto_834278 ?auto_834286 ) ) ( not ( = ?auto_834278 ?auto_834287 ) ) ( not ( = ?auto_834278 ?auto_834288 ) ) ( not ( = ?auto_834278 ?auto_834289 ) ) ( not ( = ?auto_834278 ?auto_834290 ) ) ( not ( = ?auto_834279 ?auto_834280 ) ) ( not ( = ?auto_834279 ?auto_834281 ) ) ( not ( = ?auto_834279 ?auto_834282 ) ) ( not ( = ?auto_834279 ?auto_834283 ) ) ( not ( = ?auto_834279 ?auto_834284 ) ) ( not ( = ?auto_834279 ?auto_834285 ) ) ( not ( = ?auto_834279 ?auto_834286 ) ) ( not ( = ?auto_834279 ?auto_834287 ) ) ( not ( = ?auto_834279 ?auto_834288 ) ) ( not ( = ?auto_834279 ?auto_834289 ) ) ( not ( = ?auto_834279 ?auto_834290 ) ) ( not ( = ?auto_834280 ?auto_834281 ) ) ( not ( = ?auto_834280 ?auto_834282 ) ) ( not ( = ?auto_834280 ?auto_834283 ) ) ( not ( = ?auto_834280 ?auto_834284 ) ) ( not ( = ?auto_834280 ?auto_834285 ) ) ( not ( = ?auto_834280 ?auto_834286 ) ) ( not ( = ?auto_834280 ?auto_834287 ) ) ( not ( = ?auto_834280 ?auto_834288 ) ) ( not ( = ?auto_834280 ?auto_834289 ) ) ( not ( = ?auto_834280 ?auto_834290 ) ) ( not ( = ?auto_834281 ?auto_834282 ) ) ( not ( = ?auto_834281 ?auto_834283 ) ) ( not ( = ?auto_834281 ?auto_834284 ) ) ( not ( = ?auto_834281 ?auto_834285 ) ) ( not ( = ?auto_834281 ?auto_834286 ) ) ( not ( = ?auto_834281 ?auto_834287 ) ) ( not ( = ?auto_834281 ?auto_834288 ) ) ( not ( = ?auto_834281 ?auto_834289 ) ) ( not ( = ?auto_834281 ?auto_834290 ) ) ( not ( = ?auto_834282 ?auto_834283 ) ) ( not ( = ?auto_834282 ?auto_834284 ) ) ( not ( = ?auto_834282 ?auto_834285 ) ) ( not ( = ?auto_834282 ?auto_834286 ) ) ( not ( = ?auto_834282 ?auto_834287 ) ) ( not ( = ?auto_834282 ?auto_834288 ) ) ( not ( = ?auto_834282 ?auto_834289 ) ) ( not ( = ?auto_834282 ?auto_834290 ) ) ( not ( = ?auto_834283 ?auto_834284 ) ) ( not ( = ?auto_834283 ?auto_834285 ) ) ( not ( = ?auto_834283 ?auto_834286 ) ) ( not ( = ?auto_834283 ?auto_834287 ) ) ( not ( = ?auto_834283 ?auto_834288 ) ) ( not ( = ?auto_834283 ?auto_834289 ) ) ( not ( = ?auto_834283 ?auto_834290 ) ) ( not ( = ?auto_834284 ?auto_834285 ) ) ( not ( = ?auto_834284 ?auto_834286 ) ) ( not ( = ?auto_834284 ?auto_834287 ) ) ( not ( = ?auto_834284 ?auto_834288 ) ) ( not ( = ?auto_834284 ?auto_834289 ) ) ( not ( = ?auto_834284 ?auto_834290 ) ) ( not ( = ?auto_834285 ?auto_834286 ) ) ( not ( = ?auto_834285 ?auto_834287 ) ) ( not ( = ?auto_834285 ?auto_834288 ) ) ( not ( = ?auto_834285 ?auto_834289 ) ) ( not ( = ?auto_834285 ?auto_834290 ) ) ( not ( = ?auto_834286 ?auto_834287 ) ) ( not ( = ?auto_834286 ?auto_834288 ) ) ( not ( = ?auto_834286 ?auto_834289 ) ) ( not ( = ?auto_834286 ?auto_834290 ) ) ( not ( = ?auto_834287 ?auto_834288 ) ) ( not ( = ?auto_834287 ?auto_834289 ) ) ( not ( = ?auto_834287 ?auto_834290 ) ) ( not ( = ?auto_834288 ?auto_834289 ) ) ( not ( = ?auto_834288 ?auto_834290 ) ) ( not ( = ?auto_834289 ?auto_834290 ) ) ( ON ?auto_834288 ?auto_834289 ) ( ON ?auto_834287 ?auto_834288 ) ( ON ?auto_834286 ?auto_834287 ) ( ON ?auto_834285 ?auto_834286 ) ( CLEAR ?auto_834283 ) ( ON ?auto_834284 ?auto_834285 ) ( CLEAR ?auto_834284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_834273 ?auto_834274 ?auto_834275 ?auto_834276 ?auto_834277 ?auto_834278 ?auto_834279 ?auto_834280 ?auto_834281 ?auto_834282 ?auto_834283 ?auto_834284 )
      ( MAKE-17PILE ?auto_834273 ?auto_834274 ?auto_834275 ?auto_834276 ?auto_834277 ?auto_834278 ?auto_834279 ?auto_834280 ?auto_834281 ?auto_834282 ?auto_834283 ?auto_834284 ?auto_834285 ?auto_834286 ?auto_834287 ?auto_834288 ?auto_834289 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_834343 - BLOCK
      ?auto_834344 - BLOCK
      ?auto_834345 - BLOCK
      ?auto_834346 - BLOCK
      ?auto_834347 - BLOCK
      ?auto_834348 - BLOCK
      ?auto_834349 - BLOCK
      ?auto_834350 - BLOCK
      ?auto_834351 - BLOCK
      ?auto_834352 - BLOCK
      ?auto_834353 - BLOCK
      ?auto_834354 - BLOCK
      ?auto_834355 - BLOCK
      ?auto_834356 - BLOCK
      ?auto_834357 - BLOCK
      ?auto_834358 - BLOCK
      ?auto_834359 - BLOCK
    )
    :vars
    (
      ?auto_834360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_834359 ?auto_834360 ) ( ON-TABLE ?auto_834343 ) ( ON ?auto_834344 ?auto_834343 ) ( ON ?auto_834345 ?auto_834344 ) ( ON ?auto_834346 ?auto_834345 ) ( ON ?auto_834347 ?auto_834346 ) ( ON ?auto_834348 ?auto_834347 ) ( ON ?auto_834349 ?auto_834348 ) ( ON ?auto_834350 ?auto_834349 ) ( ON ?auto_834351 ?auto_834350 ) ( ON ?auto_834352 ?auto_834351 ) ( not ( = ?auto_834343 ?auto_834344 ) ) ( not ( = ?auto_834343 ?auto_834345 ) ) ( not ( = ?auto_834343 ?auto_834346 ) ) ( not ( = ?auto_834343 ?auto_834347 ) ) ( not ( = ?auto_834343 ?auto_834348 ) ) ( not ( = ?auto_834343 ?auto_834349 ) ) ( not ( = ?auto_834343 ?auto_834350 ) ) ( not ( = ?auto_834343 ?auto_834351 ) ) ( not ( = ?auto_834343 ?auto_834352 ) ) ( not ( = ?auto_834343 ?auto_834353 ) ) ( not ( = ?auto_834343 ?auto_834354 ) ) ( not ( = ?auto_834343 ?auto_834355 ) ) ( not ( = ?auto_834343 ?auto_834356 ) ) ( not ( = ?auto_834343 ?auto_834357 ) ) ( not ( = ?auto_834343 ?auto_834358 ) ) ( not ( = ?auto_834343 ?auto_834359 ) ) ( not ( = ?auto_834343 ?auto_834360 ) ) ( not ( = ?auto_834344 ?auto_834345 ) ) ( not ( = ?auto_834344 ?auto_834346 ) ) ( not ( = ?auto_834344 ?auto_834347 ) ) ( not ( = ?auto_834344 ?auto_834348 ) ) ( not ( = ?auto_834344 ?auto_834349 ) ) ( not ( = ?auto_834344 ?auto_834350 ) ) ( not ( = ?auto_834344 ?auto_834351 ) ) ( not ( = ?auto_834344 ?auto_834352 ) ) ( not ( = ?auto_834344 ?auto_834353 ) ) ( not ( = ?auto_834344 ?auto_834354 ) ) ( not ( = ?auto_834344 ?auto_834355 ) ) ( not ( = ?auto_834344 ?auto_834356 ) ) ( not ( = ?auto_834344 ?auto_834357 ) ) ( not ( = ?auto_834344 ?auto_834358 ) ) ( not ( = ?auto_834344 ?auto_834359 ) ) ( not ( = ?auto_834344 ?auto_834360 ) ) ( not ( = ?auto_834345 ?auto_834346 ) ) ( not ( = ?auto_834345 ?auto_834347 ) ) ( not ( = ?auto_834345 ?auto_834348 ) ) ( not ( = ?auto_834345 ?auto_834349 ) ) ( not ( = ?auto_834345 ?auto_834350 ) ) ( not ( = ?auto_834345 ?auto_834351 ) ) ( not ( = ?auto_834345 ?auto_834352 ) ) ( not ( = ?auto_834345 ?auto_834353 ) ) ( not ( = ?auto_834345 ?auto_834354 ) ) ( not ( = ?auto_834345 ?auto_834355 ) ) ( not ( = ?auto_834345 ?auto_834356 ) ) ( not ( = ?auto_834345 ?auto_834357 ) ) ( not ( = ?auto_834345 ?auto_834358 ) ) ( not ( = ?auto_834345 ?auto_834359 ) ) ( not ( = ?auto_834345 ?auto_834360 ) ) ( not ( = ?auto_834346 ?auto_834347 ) ) ( not ( = ?auto_834346 ?auto_834348 ) ) ( not ( = ?auto_834346 ?auto_834349 ) ) ( not ( = ?auto_834346 ?auto_834350 ) ) ( not ( = ?auto_834346 ?auto_834351 ) ) ( not ( = ?auto_834346 ?auto_834352 ) ) ( not ( = ?auto_834346 ?auto_834353 ) ) ( not ( = ?auto_834346 ?auto_834354 ) ) ( not ( = ?auto_834346 ?auto_834355 ) ) ( not ( = ?auto_834346 ?auto_834356 ) ) ( not ( = ?auto_834346 ?auto_834357 ) ) ( not ( = ?auto_834346 ?auto_834358 ) ) ( not ( = ?auto_834346 ?auto_834359 ) ) ( not ( = ?auto_834346 ?auto_834360 ) ) ( not ( = ?auto_834347 ?auto_834348 ) ) ( not ( = ?auto_834347 ?auto_834349 ) ) ( not ( = ?auto_834347 ?auto_834350 ) ) ( not ( = ?auto_834347 ?auto_834351 ) ) ( not ( = ?auto_834347 ?auto_834352 ) ) ( not ( = ?auto_834347 ?auto_834353 ) ) ( not ( = ?auto_834347 ?auto_834354 ) ) ( not ( = ?auto_834347 ?auto_834355 ) ) ( not ( = ?auto_834347 ?auto_834356 ) ) ( not ( = ?auto_834347 ?auto_834357 ) ) ( not ( = ?auto_834347 ?auto_834358 ) ) ( not ( = ?auto_834347 ?auto_834359 ) ) ( not ( = ?auto_834347 ?auto_834360 ) ) ( not ( = ?auto_834348 ?auto_834349 ) ) ( not ( = ?auto_834348 ?auto_834350 ) ) ( not ( = ?auto_834348 ?auto_834351 ) ) ( not ( = ?auto_834348 ?auto_834352 ) ) ( not ( = ?auto_834348 ?auto_834353 ) ) ( not ( = ?auto_834348 ?auto_834354 ) ) ( not ( = ?auto_834348 ?auto_834355 ) ) ( not ( = ?auto_834348 ?auto_834356 ) ) ( not ( = ?auto_834348 ?auto_834357 ) ) ( not ( = ?auto_834348 ?auto_834358 ) ) ( not ( = ?auto_834348 ?auto_834359 ) ) ( not ( = ?auto_834348 ?auto_834360 ) ) ( not ( = ?auto_834349 ?auto_834350 ) ) ( not ( = ?auto_834349 ?auto_834351 ) ) ( not ( = ?auto_834349 ?auto_834352 ) ) ( not ( = ?auto_834349 ?auto_834353 ) ) ( not ( = ?auto_834349 ?auto_834354 ) ) ( not ( = ?auto_834349 ?auto_834355 ) ) ( not ( = ?auto_834349 ?auto_834356 ) ) ( not ( = ?auto_834349 ?auto_834357 ) ) ( not ( = ?auto_834349 ?auto_834358 ) ) ( not ( = ?auto_834349 ?auto_834359 ) ) ( not ( = ?auto_834349 ?auto_834360 ) ) ( not ( = ?auto_834350 ?auto_834351 ) ) ( not ( = ?auto_834350 ?auto_834352 ) ) ( not ( = ?auto_834350 ?auto_834353 ) ) ( not ( = ?auto_834350 ?auto_834354 ) ) ( not ( = ?auto_834350 ?auto_834355 ) ) ( not ( = ?auto_834350 ?auto_834356 ) ) ( not ( = ?auto_834350 ?auto_834357 ) ) ( not ( = ?auto_834350 ?auto_834358 ) ) ( not ( = ?auto_834350 ?auto_834359 ) ) ( not ( = ?auto_834350 ?auto_834360 ) ) ( not ( = ?auto_834351 ?auto_834352 ) ) ( not ( = ?auto_834351 ?auto_834353 ) ) ( not ( = ?auto_834351 ?auto_834354 ) ) ( not ( = ?auto_834351 ?auto_834355 ) ) ( not ( = ?auto_834351 ?auto_834356 ) ) ( not ( = ?auto_834351 ?auto_834357 ) ) ( not ( = ?auto_834351 ?auto_834358 ) ) ( not ( = ?auto_834351 ?auto_834359 ) ) ( not ( = ?auto_834351 ?auto_834360 ) ) ( not ( = ?auto_834352 ?auto_834353 ) ) ( not ( = ?auto_834352 ?auto_834354 ) ) ( not ( = ?auto_834352 ?auto_834355 ) ) ( not ( = ?auto_834352 ?auto_834356 ) ) ( not ( = ?auto_834352 ?auto_834357 ) ) ( not ( = ?auto_834352 ?auto_834358 ) ) ( not ( = ?auto_834352 ?auto_834359 ) ) ( not ( = ?auto_834352 ?auto_834360 ) ) ( not ( = ?auto_834353 ?auto_834354 ) ) ( not ( = ?auto_834353 ?auto_834355 ) ) ( not ( = ?auto_834353 ?auto_834356 ) ) ( not ( = ?auto_834353 ?auto_834357 ) ) ( not ( = ?auto_834353 ?auto_834358 ) ) ( not ( = ?auto_834353 ?auto_834359 ) ) ( not ( = ?auto_834353 ?auto_834360 ) ) ( not ( = ?auto_834354 ?auto_834355 ) ) ( not ( = ?auto_834354 ?auto_834356 ) ) ( not ( = ?auto_834354 ?auto_834357 ) ) ( not ( = ?auto_834354 ?auto_834358 ) ) ( not ( = ?auto_834354 ?auto_834359 ) ) ( not ( = ?auto_834354 ?auto_834360 ) ) ( not ( = ?auto_834355 ?auto_834356 ) ) ( not ( = ?auto_834355 ?auto_834357 ) ) ( not ( = ?auto_834355 ?auto_834358 ) ) ( not ( = ?auto_834355 ?auto_834359 ) ) ( not ( = ?auto_834355 ?auto_834360 ) ) ( not ( = ?auto_834356 ?auto_834357 ) ) ( not ( = ?auto_834356 ?auto_834358 ) ) ( not ( = ?auto_834356 ?auto_834359 ) ) ( not ( = ?auto_834356 ?auto_834360 ) ) ( not ( = ?auto_834357 ?auto_834358 ) ) ( not ( = ?auto_834357 ?auto_834359 ) ) ( not ( = ?auto_834357 ?auto_834360 ) ) ( not ( = ?auto_834358 ?auto_834359 ) ) ( not ( = ?auto_834358 ?auto_834360 ) ) ( not ( = ?auto_834359 ?auto_834360 ) ) ( ON ?auto_834358 ?auto_834359 ) ( ON ?auto_834357 ?auto_834358 ) ( ON ?auto_834356 ?auto_834357 ) ( ON ?auto_834355 ?auto_834356 ) ( ON ?auto_834354 ?auto_834355 ) ( CLEAR ?auto_834352 ) ( ON ?auto_834353 ?auto_834354 ) ( CLEAR ?auto_834353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_834343 ?auto_834344 ?auto_834345 ?auto_834346 ?auto_834347 ?auto_834348 ?auto_834349 ?auto_834350 ?auto_834351 ?auto_834352 ?auto_834353 )
      ( MAKE-17PILE ?auto_834343 ?auto_834344 ?auto_834345 ?auto_834346 ?auto_834347 ?auto_834348 ?auto_834349 ?auto_834350 ?auto_834351 ?auto_834352 ?auto_834353 ?auto_834354 ?auto_834355 ?auto_834356 ?auto_834357 ?auto_834358 ?auto_834359 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_834413 - BLOCK
      ?auto_834414 - BLOCK
      ?auto_834415 - BLOCK
      ?auto_834416 - BLOCK
      ?auto_834417 - BLOCK
      ?auto_834418 - BLOCK
      ?auto_834419 - BLOCK
      ?auto_834420 - BLOCK
      ?auto_834421 - BLOCK
      ?auto_834422 - BLOCK
      ?auto_834423 - BLOCK
      ?auto_834424 - BLOCK
      ?auto_834425 - BLOCK
      ?auto_834426 - BLOCK
      ?auto_834427 - BLOCK
      ?auto_834428 - BLOCK
      ?auto_834429 - BLOCK
    )
    :vars
    (
      ?auto_834430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_834429 ?auto_834430 ) ( ON-TABLE ?auto_834413 ) ( ON ?auto_834414 ?auto_834413 ) ( ON ?auto_834415 ?auto_834414 ) ( ON ?auto_834416 ?auto_834415 ) ( ON ?auto_834417 ?auto_834416 ) ( ON ?auto_834418 ?auto_834417 ) ( ON ?auto_834419 ?auto_834418 ) ( ON ?auto_834420 ?auto_834419 ) ( ON ?auto_834421 ?auto_834420 ) ( not ( = ?auto_834413 ?auto_834414 ) ) ( not ( = ?auto_834413 ?auto_834415 ) ) ( not ( = ?auto_834413 ?auto_834416 ) ) ( not ( = ?auto_834413 ?auto_834417 ) ) ( not ( = ?auto_834413 ?auto_834418 ) ) ( not ( = ?auto_834413 ?auto_834419 ) ) ( not ( = ?auto_834413 ?auto_834420 ) ) ( not ( = ?auto_834413 ?auto_834421 ) ) ( not ( = ?auto_834413 ?auto_834422 ) ) ( not ( = ?auto_834413 ?auto_834423 ) ) ( not ( = ?auto_834413 ?auto_834424 ) ) ( not ( = ?auto_834413 ?auto_834425 ) ) ( not ( = ?auto_834413 ?auto_834426 ) ) ( not ( = ?auto_834413 ?auto_834427 ) ) ( not ( = ?auto_834413 ?auto_834428 ) ) ( not ( = ?auto_834413 ?auto_834429 ) ) ( not ( = ?auto_834413 ?auto_834430 ) ) ( not ( = ?auto_834414 ?auto_834415 ) ) ( not ( = ?auto_834414 ?auto_834416 ) ) ( not ( = ?auto_834414 ?auto_834417 ) ) ( not ( = ?auto_834414 ?auto_834418 ) ) ( not ( = ?auto_834414 ?auto_834419 ) ) ( not ( = ?auto_834414 ?auto_834420 ) ) ( not ( = ?auto_834414 ?auto_834421 ) ) ( not ( = ?auto_834414 ?auto_834422 ) ) ( not ( = ?auto_834414 ?auto_834423 ) ) ( not ( = ?auto_834414 ?auto_834424 ) ) ( not ( = ?auto_834414 ?auto_834425 ) ) ( not ( = ?auto_834414 ?auto_834426 ) ) ( not ( = ?auto_834414 ?auto_834427 ) ) ( not ( = ?auto_834414 ?auto_834428 ) ) ( not ( = ?auto_834414 ?auto_834429 ) ) ( not ( = ?auto_834414 ?auto_834430 ) ) ( not ( = ?auto_834415 ?auto_834416 ) ) ( not ( = ?auto_834415 ?auto_834417 ) ) ( not ( = ?auto_834415 ?auto_834418 ) ) ( not ( = ?auto_834415 ?auto_834419 ) ) ( not ( = ?auto_834415 ?auto_834420 ) ) ( not ( = ?auto_834415 ?auto_834421 ) ) ( not ( = ?auto_834415 ?auto_834422 ) ) ( not ( = ?auto_834415 ?auto_834423 ) ) ( not ( = ?auto_834415 ?auto_834424 ) ) ( not ( = ?auto_834415 ?auto_834425 ) ) ( not ( = ?auto_834415 ?auto_834426 ) ) ( not ( = ?auto_834415 ?auto_834427 ) ) ( not ( = ?auto_834415 ?auto_834428 ) ) ( not ( = ?auto_834415 ?auto_834429 ) ) ( not ( = ?auto_834415 ?auto_834430 ) ) ( not ( = ?auto_834416 ?auto_834417 ) ) ( not ( = ?auto_834416 ?auto_834418 ) ) ( not ( = ?auto_834416 ?auto_834419 ) ) ( not ( = ?auto_834416 ?auto_834420 ) ) ( not ( = ?auto_834416 ?auto_834421 ) ) ( not ( = ?auto_834416 ?auto_834422 ) ) ( not ( = ?auto_834416 ?auto_834423 ) ) ( not ( = ?auto_834416 ?auto_834424 ) ) ( not ( = ?auto_834416 ?auto_834425 ) ) ( not ( = ?auto_834416 ?auto_834426 ) ) ( not ( = ?auto_834416 ?auto_834427 ) ) ( not ( = ?auto_834416 ?auto_834428 ) ) ( not ( = ?auto_834416 ?auto_834429 ) ) ( not ( = ?auto_834416 ?auto_834430 ) ) ( not ( = ?auto_834417 ?auto_834418 ) ) ( not ( = ?auto_834417 ?auto_834419 ) ) ( not ( = ?auto_834417 ?auto_834420 ) ) ( not ( = ?auto_834417 ?auto_834421 ) ) ( not ( = ?auto_834417 ?auto_834422 ) ) ( not ( = ?auto_834417 ?auto_834423 ) ) ( not ( = ?auto_834417 ?auto_834424 ) ) ( not ( = ?auto_834417 ?auto_834425 ) ) ( not ( = ?auto_834417 ?auto_834426 ) ) ( not ( = ?auto_834417 ?auto_834427 ) ) ( not ( = ?auto_834417 ?auto_834428 ) ) ( not ( = ?auto_834417 ?auto_834429 ) ) ( not ( = ?auto_834417 ?auto_834430 ) ) ( not ( = ?auto_834418 ?auto_834419 ) ) ( not ( = ?auto_834418 ?auto_834420 ) ) ( not ( = ?auto_834418 ?auto_834421 ) ) ( not ( = ?auto_834418 ?auto_834422 ) ) ( not ( = ?auto_834418 ?auto_834423 ) ) ( not ( = ?auto_834418 ?auto_834424 ) ) ( not ( = ?auto_834418 ?auto_834425 ) ) ( not ( = ?auto_834418 ?auto_834426 ) ) ( not ( = ?auto_834418 ?auto_834427 ) ) ( not ( = ?auto_834418 ?auto_834428 ) ) ( not ( = ?auto_834418 ?auto_834429 ) ) ( not ( = ?auto_834418 ?auto_834430 ) ) ( not ( = ?auto_834419 ?auto_834420 ) ) ( not ( = ?auto_834419 ?auto_834421 ) ) ( not ( = ?auto_834419 ?auto_834422 ) ) ( not ( = ?auto_834419 ?auto_834423 ) ) ( not ( = ?auto_834419 ?auto_834424 ) ) ( not ( = ?auto_834419 ?auto_834425 ) ) ( not ( = ?auto_834419 ?auto_834426 ) ) ( not ( = ?auto_834419 ?auto_834427 ) ) ( not ( = ?auto_834419 ?auto_834428 ) ) ( not ( = ?auto_834419 ?auto_834429 ) ) ( not ( = ?auto_834419 ?auto_834430 ) ) ( not ( = ?auto_834420 ?auto_834421 ) ) ( not ( = ?auto_834420 ?auto_834422 ) ) ( not ( = ?auto_834420 ?auto_834423 ) ) ( not ( = ?auto_834420 ?auto_834424 ) ) ( not ( = ?auto_834420 ?auto_834425 ) ) ( not ( = ?auto_834420 ?auto_834426 ) ) ( not ( = ?auto_834420 ?auto_834427 ) ) ( not ( = ?auto_834420 ?auto_834428 ) ) ( not ( = ?auto_834420 ?auto_834429 ) ) ( not ( = ?auto_834420 ?auto_834430 ) ) ( not ( = ?auto_834421 ?auto_834422 ) ) ( not ( = ?auto_834421 ?auto_834423 ) ) ( not ( = ?auto_834421 ?auto_834424 ) ) ( not ( = ?auto_834421 ?auto_834425 ) ) ( not ( = ?auto_834421 ?auto_834426 ) ) ( not ( = ?auto_834421 ?auto_834427 ) ) ( not ( = ?auto_834421 ?auto_834428 ) ) ( not ( = ?auto_834421 ?auto_834429 ) ) ( not ( = ?auto_834421 ?auto_834430 ) ) ( not ( = ?auto_834422 ?auto_834423 ) ) ( not ( = ?auto_834422 ?auto_834424 ) ) ( not ( = ?auto_834422 ?auto_834425 ) ) ( not ( = ?auto_834422 ?auto_834426 ) ) ( not ( = ?auto_834422 ?auto_834427 ) ) ( not ( = ?auto_834422 ?auto_834428 ) ) ( not ( = ?auto_834422 ?auto_834429 ) ) ( not ( = ?auto_834422 ?auto_834430 ) ) ( not ( = ?auto_834423 ?auto_834424 ) ) ( not ( = ?auto_834423 ?auto_834425 ) ) ( not ( = ?auto_834423 ?auto_834426 ) ) ( not ( = ?auto_834423 ?auto_834427 ) ) ( not ( = ?auto_834423 ?auto_834428 ) ) ( not ( = ?auto_834423 ?auto_834429 ) ) ( not ( = ?auto_834423 ?auto_834430 ) ) ( not ( = ?auto_834424 ?auto_834425 ) ) ( not ( = ?auto_834424 ?auto_834426 ) ) ( not ( = ?auto_834424 ?auto_834427 ) ) ( not ( = ?auto_834424 ?auto_834428 ) ) ( not ( = ?auto_834424 ?auto_834429 ) ) ( not ( = ?auto_834424 ?auto_834430 ) ) ( not ( = ?auto_834425 ?auto_834426 ) ) ( not ( = ?auto_834425 ?auto_834427 ) ) ( not ( = ?auto_834425 ?auto_834428 ) ) ( not ( = ?auto_834425 ?auto_834429 ) ) ( not ( = ?auto_834425 ?auto_834430 ) ) ( not ( = ?auto_834426 ?auto_834427 ) ) ( not ( = ?auto_834426 ?auto_834428 ) ) ( not ( = ?auto_834426 ?auto_834429 ) ) ( not ( = ?auto_834426 ?auto_834430 ) ) ( not ( = ?auto_834427 ?auto_834428 ) ) ( not ( = ?auto_834427 ?auto_834429 ) ) ( not ( = ?auto_834427 ?auto_834430 ) ) ( not ( = ?auto_834428 ?auto_834429 ) ) ( not ( = ?auto_834428 ?auto_834430 ) ) ( not ( = ?auto_834429 ?auto_834430 ) ) ( ON ?auto_834428 ?auto_834429 ) ( ON ?auto_834427 ?auto_834428 ) ( ON ?auto_834426 ?auto_834427 ) ( ON ?auto_834425 ?auto_834426 ) ( ON ?auto_834424 ?auto_834425 ) ( ON ?auto_834423 ?auto_834424 ) ( CLEAR ?auto_834421 ) ( ON ?auto_834422 ?auto_834423 ) ( CLEAR ?auto_834422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_834413 ?auto_834414 ?auto_834415 ?auto_834416 ?auto_834417 ?auto_834418 ?auto_834419 ?auto_834420 ?auto_834421 ?auto_834422 )
      ( MAKE-17PILE ?auto_834413 ?auto_834414 ?auto_834415 ?auto_834416 ?auto_834417 ?auto_834418 ?auto_834419 ?auto_834420 ?auto_834421 ?auto_834422 ?auto_834423 ?auto_834424 ?auto_834425 ?auto_834426 ?auto_834427 ?auto_834428 ?auto_834429 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_834483 - BLOCK
      ?auto_834484 - BLOCK
      ?auto_834485 - BLOCK
      ?auto_834486 - BLOCK
      ?auto_834487 - BLOCK
      ?auto_834488 - BLOCK
      ?auto_834489 - BLOCK
      ?auto_834490 - BLOCK
      ?auto_834491 - BLOCK
      ?auto_834492 - BLOCK
      ?auto_834493 - BLOCK
      ?auto_834494 - BLOCK
      ?auto_834495 - BLOCK
      ?auto_834496 - BLOCK
      ?auto_834497 - BLOCK
      ?auto_834498 - BLOCK
      ?auto_834499 - BLOCK
    )
    :vars
    (
      ?auto_834500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_834499 ?auto_834500 ) ( ON-TABLE ?auto_834483 ) ( ON ?auto_834484 ?auto_834483 ) ( ON ?auto_834485 ?auto_834484 ) ( ON ?auto_834486 ?auto_834485 ) ( ON ?auto_834487 ?auto_834486 ) ( ON ?auto_834488 ?auto_834487 ) ( ON ?auto_834489 ?auto_834488 ) ( ON ?auto_834490 ?auto_834489 ) ( not ( = ?auto_834483 ?auto_834484 ) ) ( not ( = ?auto_834483 ?auto_834485 ) ) ( not ( = ?auto_834483 ?auto_834486 ) ) ( not ( = ?auto_834483 ?auto_834487 ) ) ( not ( = ?auto_834483 ?auto_834488 ) ) ( not ( = ?auto_834483 ?auto_834489 ) ) ( not ( = ?auto_834483 ?auto_834490 ) ) ( not ( = ?auto_834483 ?auto_834491 ) ) ( not ( = ?auto_834483 ?auto_834492 ) ) ( not ( = ?auto_834483 ?auto_834493 ) ) ( not ( = ?auto_834483 ?auto_834494 ) ) ( not ( = ?auto_834483 ?auto_834495 ) ) ( not ( = ?auto_834483 ?auto_834496 ) ) ( not ( = ?auto_834483 ?auto_834497 ) ) ( not ( = ?auto_834483 ?auto_834498 ) ) ( not ( = ?auto_834483 ?auto_834499 ) ) ( not ( = ?auto_834483 ?auto_834500 ) ) ( not ( = ?auto_834484 ?auto_834485 ) ) ( not ( = ?auto_834484 ?auto_834486 ) ) ( not ( = ?auto_834484 ?auto_834487 ) ) ( not ( = ?auto_834484 ?auto_834488 ) ) ( not ( = ?auto_834484 ?auto_834489 ) ) ( not ( = ?auto_834484 ?auto_834490 ) ) ( not ( = ?auto_834484 ?auto_834491 ) ) ( not ( = ?auto_834484 ?auto_834492 ) ) ( not ( = ?auto_834484 ?auto_834493 ) ) ( not ( = ?auto_834484 ?auto_834494 ) ) ( not ( = ?auto_834484 ?auto_834495 ) ) ( not ( = ?auto_834484 ?auto_834496 ) ) ( not ( = ?auto_834484 ?auto_834497 ) ) ( not ( = ?auto_834484 ?auto_834498 ) ) ( not ( = ?auto_834484 ?auto_834499 ) ) ( not ( = ?auto_834484 ?auto_834500 ) ) ( not ( = ?auto_834485 ?auto_834486 ) ) ( not ( = ?auto_834485 ?auto_834487 ) ) ( not ( = ?auto_834485 ?auto_834488 ) ) ( not ( = ?auto_834485 ?auto_834489 ) ) ( not ( = ?auto_834485 ?auto_834490 ) ) ( not ( = ?auto_834485 ?auto_834491 ) ) ( not ( = ?auto_834485 ?auto_834492 ) ) ( not ( = ?auto_834485 ?auto_834493 ) ) ( not ( = ?auto_834485 ?auto_834494 ) ) ( not ( = ?auto_834485 ?auto_834495 ) ) ( not ( = ?auto_834485 ?auto_834496 ) ) ( not ( = ?auto_834485 ?auto_834497 ) ) ( not ( = ?auto_834485 ?auto_834498 ) ) ( not ( = ?auto_834485 ?auto_834499 ) ) ( not ( = ?auto_834485 ?auto_834500 ) ) ( not ( = ?auto_834486 ?auto_834487 ) ) ( not ( = ?auto_834486 ?auto_834488 ) ) ( not ( = ?auto_834486 ?auto_834489 ) ) ( not ( = ?auto_834486 ?auto_834490 ) ) ( not ( = ?auto_834486 ?auto_834491 ) ) ( not ( = ?auto_834486 ?auto_834492 ) ) ( not ( = ?auto_834486 ?auto_834493 ) ) ( not ( = ?auto_834486 ?auto_834494 ) ) ( not ( = ?auto_834486 ?auto_834495 ) ) ( not ( = ?auto_834486 ?auto_834496 ) ) ( not ( = ?auto_834486 ?auto_834497 ) ) ( not ( = ?auto_834486 ?auto_834498 ) ) ( not ( = ?auto_834486 ?auto_834499 ) ) ( not ( = ?auto_834486 ?auto_834500 ) ) ( not ( = ?auto_834487 ?auto_834488 ) ) ( not ( = ?auto_834487 ?auto_834489 ) ) ( not ( = ?auto_834487 ?auto_834490 ) ) ( not ( = ?auto_834487 ?auto_834491 ) ) ( not ( = ?auto_834487 ?auto_834492 ) ) ( not ( = ?auto_834487 ?auto_834493 ) ) ( not ( = ?auto_834487 ?auto_834494 ) ) ( not ( = ?auto_834487 ?auto_834495 ) ) ( not ( = ?auto_834487 ?auto_834496 ) ) ( not ( = ?auto_834487 ?auto_834497 ) ) ( not ( = ?auto_834487 ?auto_834498 ) ) ( not ( = ?auto_834487 ?auto_834499 ) ) ( not ( = ?auto_834487 ?auto_834500 ) ) ( not ( = ?auto_834488 ?auto_834489 ) ) ( not ( = ?auto_834488 ?auto_834490 ) ) ( not ( = ?auto_834488 ?auto_834491 ) ) ( not ( = ?auto_834488 ?auto_834492 ) ) ( not ( = ?auto_834488 ?auto_834493 ) ) ( not ( = ?auto_834488 ?auto_834494 ) ) ( not ( = ?auto_834488 ?auto_834495 ) ) ( not ( = ?auto_834488 ?auto_834496 ) ) ( not ( = ?auto_834488 ?auto_834497 ) ) ( not ( = ?auto_834488 ?auto_834498 ) ) ( not ( = ?auto_834488 ?auto_834499 ) ) ( not ( = ?auto_834488 ?auto_834500 ) ) ( not ( = ?auto_834489 ?auto_834490 ) ) ( not ( = ?auto_834489 ?auto_834491 ) ) ( not ( = ?auto_834489 ?auto_834492 ) ) ( not ( = ?auto_834489 ?auto_834493 ) ) ( not ( = ?auto_834489 ?auto_834494 ) ) ( not ( = ?auto_834489 ?auto_834495 ) ) ( not ( = ?auto_834489 ?auto_834496 ) ) ( not ( = ?auto_834489 ?auto_834497 ) ) ( not ( = ?auto_834489 ?auto_834498 ) ) ( not ( = ?auto_834489 ?auto_834499 ) ) ( not ( = ?auto_834489 ?auto_834500 ) ) ( not ( = ?auto_834490 ?auto_834491 ) ) ( not ( = ?auto_834490 ?auto_834492 ) ) ( not ( = ?auto_834490 ?auto_834493 ) ) ( not ( = ?auto_834490 ?auto_834494 ) ) ( not ( = ?auto_834490 ?auto_834495 ) ) ( not ( = ?auto_834490 ?auto_834496 ) ) ( not ( = ?auto_834490 ?auto_834497 ) ) ( not ( = ?auto_834490 ?auto_834498 ) ) ( not ( = ?auto_834490 ?auto_834499 ) ) ( not ( = ?auto_834490 ?auto_834500 ) ) ( not ( = ?auto_834491 ?auto_834492 ) ) ( not ( = ?auto_834491 ?auto_834493 ) ) ( not ( = ?auto_834491 ?auto_834494 ) ) ( not ( = ?auto_834491 ?auto_834495 ) ) ( not ( = ?auto_834491 ?auto_834496 ) ) ( not ( = ?auto_834491 ?auto_834497 ) ) ( not ( = ?auto_834491 ?auto_834498 ) ) ( not ( = ?auto_834491 ?auto_834499 ) ) ( not ( = ?auto_834491 ?auto_834500 ) ) ( not ( = ?auto_834492 ?auto_834493 ) ) ( not ( = ?auto_834492 ?auto_834494 ) ) ( not ( = ?auto_834492 ?auto_834495 ) ) ( not ( = ?auto_834492 ?auto_834496 ) ) ( not ( = ?auto_834492 ?auto_834497 ) ) ( not ( = ?auto_834492 ?auto_834498 ) ) ( not ( = ?auto_834492 ?auto_834499 ) ) ( not ( = ?auto_834492 ?auto_834500 ) ) ( not ( = ?auto_834493 ?auto_834494 ) ) ( not ( = ?auto_834493 ?auto_834495 ) ) ( not ( = ?auto_834493 ?auto_834496 ) ) ( not ( = ?auto_834493 ?auto_834497 ) ) ( not ( = ?auto_834493 ?auto_834498 ) ) ( not ( = ?auto_834493 ?auto_834499 ) ) ( not ( = ?auto_834493 ?auto_834500 ) ) ( not ( = ?auto_834494 ?auto_834495 ) ) ( not ( = ?auto_834494 ?auto_834496 ) ) ( not ( = ?auto_834494 ?auto_834497 ) ) ( not ( = ?auto_834494 ?auto_834498 ) ) ( not ( = ?auto_834494 ?auto_834499 ) ) ( not ( = ?auto_834494 ?auto_834500 ) ) ( not ( = ?auto_834495 ?auto_834496 ) ) ( not ( = ?auto_834495 ?auto_834497 ) ) ( not ( = ?auto_834495 ?auto_834498 ) ) ( not ( = ?auto_834495 ?auto_834499 ) ) ( not ( = ?auto_834495 ?auto_834500 ) ) ( not ( = ?auto_834496 ?auto_834497 ) ) ( not ( = ?auto_834496 ?auto_834498 ) ) ( not ( = ?auto_834496 ?auto_834499 ) ) ( not ( = ?auto_834496 ?auto_834500 ) ) ( not ( = ?auto_834497 ?auto_834498 ) ) ( not ( = ?auto_834497 ?auto_834499 ) ) ( not ( = ?auto_834497 ?auto_834500 ) ) ( not ( = ?auto_834498 ?auto_834499 ) ) ( not ( = ?auto_834498 ?auto_834500 ) ) ( not ( = ?auto_834499 ?auto_834500 ) ) ( ON ?auto_834498 ?auto_834499 ) ( ON ?auto_834497 ?auto_834498 ) ( ON ?auto_834496 ?auto_834497 ) ( ON ?auto_834495 ?auto_834496 ) ( ON ?auto_834494 ?auto_834495 ) ( ON ?auto_834493 ?auto_834494 ) ( ON ?auto_834492 ?auto_834493 ) ( CLEAR ?auto_834490 ) ( ON ?auto_834491 ?auto_834492 ) ( CLEAR ?auto_834491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_834483 ?auto_834484 ?auto_834485 ?auto_834486 ?auto_834487 ?auto_834488 ?auto_834489 ?auto_834490 ?auto_834491 )
      ( MAKE-17PILE ?auto_834483 ?auto_834484 ?auto_834485 ?auto_834486 ?auto_834487 ?auto_834488 ?auto_834489 ?auto_834490 ?auto_834491 ?auto_834492 ?auto_834493 ?auto_834494 ?auto_834495 ?auto_834496 ?auto_834497 ?auto_834498 ?auto_834499 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_834553 - BLOCK
      ?auto_834554 - BLOCK
      ?auto_834555 - BLOCK
      ?auto_834556 - BLOCK
      ?auto_834557 - BLOCK
      ?auto_834558 - BLOCK
      ?auto_834559 - BLOCK
      ?auto_834560 - BLOCK
      ?auto_834561 - BLOCK
      ?auto_834562 - BLOCK
      ?auto_834563 - BLOCK
      ?auto_834564 - BLOCK
      ?auto_834565 - BLOCK
      ?auto_834566 - BLOCK
      ?auto_834567 - BLOCK
      ?auto_834568 - BLOCK
      ?auto_834569 - BLOCK
    )
    :vars
    (
      ?auto_834570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_834569 ?auto_834570 ) ( ON-TABLE ?auto_834553 ) ( ON ?auto_834554 ?auto_834553 ) ( ON ?auto_834555 ?auto_834554 ) ( ON ?auto_834556 ?auto_834555 ) ( ON ?auto_834557 ?auto_834556 ) ( ON ?auto_834558 ?auto_834557 ) ( ON ?auto_834559 ?auto_834558 ) ( not ( = ?auto_834553 ?auto_834554 ) ) ( not ( = ?auto_834553 ?auto_834555 ) ) ( not ( = ?auto_834553 ?auto_834556 ) ) ( not ( = ?auto_834553 ?auto_834557 ) ) ( not ( = ?auto_834553 ?auto_834558 ) ) ( not ( = ?auto_834553 ?auto_834559 ) ) ( not ( = ?auto_834553 ?auto_834560 ) ) ( not ( = ?auto_834553 ?auto_834561 ) ) ( not ( = ?auto_834553 ?auto_834562 ) ) ( not ( = ?auto_834553 ?auto_834563 ) ) ( not ( = ?auto_834553 ?auto_834564 ) ) ( not ( = ?auto_834553 ?auto_834565 ) ) ( not ( = ?auto_834553 ?auto_834566 ) ) ( not ( = ?auto_834553 ?auto_834567 ) ) ( not ( = ?auto_834553 ?auto_834568 ) ) ( not ( = ?auto_834553 ?auto_834569 ) ) ( not ( = ?auto_834553 ?auto_834570 ) ) ( not ( = ?auto_834554 ?auto_834555 ) ) ( not ( = ?auto_834554 ?auto_834556 ) ) ( not ( = ?auto_834554 ?auto_834557 ) ) ( not ( = ?auto_834554 ?auto_834558 ) ) ( not ( = ?auto_834554 ?auto_834559 ) ) ( not ( = ?auto_834554 ?auto_834560 ) ) ( not ( = ?auto_834554 ?auto_834561 ) ) ( not ( = ?auto_834554 ?auto_834562 ) ) ( not ( = ?auto_834554 ?auto_834563 ) ) ( not ( = ?auto_834554 ?auto_834564 ) ) ( not ( = ?auto_834554 ?auto_834565 ) ) ( not ( = ?auto_834554 ?auto_834566 ) ) ( not ( = ?auto_834554 ?auto_834567 ) ) ( not ( = ?auto_834554 ?auto_834568 ) ) ( not ( = ?auto_834554 ?auto_834569 ) ) ( not ( = ?auto_834554 ?auto_834570 ) ) ( not ( = ?auto_834555 ?auto_834556 ) ) ( not ( = ?auto_834555 ?auto_834557 ) ) ( not ( = ?auto_834555 ?auto_834558 ) ) ( not ( = ?auto_834555 ?auto_834559 ) ) ( not ( = ?auto_834555 ?auto_834560 ) ) ( not ( = ?auto_834555 ?auto_834561 ) ) ( not ( = ?auto_834555 ?auto_834562 ) ) ( not ( = ?auto_834555 ?auto_834563 ) ) ( not ( = ?auto_834555 ?auto_834564 ) ) ( not ( = ?auto_834555 ?auto_834565 ) ) ( not ( = ?auto_834555 ?auto_834566 ) ) ( not ( = ?auto_834555 ?auto_834567 ) ) ( not ( = ?auto_834555 ?auto_834568 ) ) ( not ( = ?auto_834555 ?auto_834569 ) ) ( not ( = ?auto_834555 ?auto_834570 ) ) ( not ( = ?auto_834556 ?auto_834557 ) ) ( not ( = ?auto_834556 ?auto_834558 ) ) ( not ( = ?auto_834556 ?auto_834559 ) ) ( not ( = ?auto_834556 ?auto_834560 ) ) ( not ( = ?auto_834556 ?auto_834561 ) ) ( not ( = ?auto_834556 ?auto_834562 ) ) ( not ( = ?auto_834556 ?auto_834563 ) ) ( not ( = ?auto_834556 ?auto_834564 ) ) ( not ( = ?auto_834556 ?auto_834565 ) ) ( not ( = ?auto_834556 ?auto_834566 ) ) ( not ( = ?auto_834556 ?auto_834567 ) ) ( not ( = ?auto_834556 ?auto_834568 ) ) ( not ( = ?auto_834556 ?auto_834569 ) ) ( not ( = ?auto_834556 ?auto_834570 ) ) ( not ( = ?auto_834557 ?auto_834558 ) ) ( not ( = ?auto_834557 ?auto_834559 ) ) ( not ( = ?auto_834557 ?auto_834560 ) ) ( not ( = ?auto_834557 ?auto_834561 ) ) ( not ( = ?auto_834557 ?auto_834562 ) ) ( not ( = ?auto_834557 ?auto_834563 ) ) ( not ( = ?auto_834557 ?auto_834564 ) ) ( not ( = ?auto_834557 ?auto_834565 ) ) ( not ( = ?auto_834557 ?auto_834566 ) ) ( not ( = ?auto_834557 ?auto_834567 ) ) ( not ( = ?auto_834557 ?auto_834568 ) ) ( not ( = ?auto_834557 ?auto_834569 ) ) ( not ( = ?auto_834557 ?auto_834570 ) ) ( not ( = ?auto_834558 ?auto_834559 ) ) ( not ( = ?auto_834558 ?auto_834560 ) ) ( not ( = ?auto_834558 ?auto_834561 ) ) ( not ( = ?auto_834558 ?auto_834562 ) ) ( not ( = ?auto_834558 ?auto_834563 ) ) ( not ( = ?auto_834558 ?auto_834564 ) ) ( not ( = ?auto_834558 ?auto_834565 ) ) ( not ( = ?auto_834558 ?auto_834566 ) ) ( not ( = ?auto_834558 ?auto_834567 ) ) ( not ( = ?auto_834558 ?auto_834568 ) ) ( not ( = ?auto_834558 ?auto_834569 ) ) ( not ( = ?auto_834558 ?auto_834570 ) ) ( not ( = ?auto_834559 ?auto_834560 ) ) ( not ( = ?auto_834559 ?auto_834561 ) ) ( not ( = ?auto_834559 ?auto_834562 ) ) ( not ( = ?auto_834559 ?auto_834563 ) ) ( not ( = ?auto_834559 ?auto_834564 ) ) ( not ( = ?auto_834559 ?auto_834565 ) ) ( not ( = ?auto_834559 ?auto_834566 ) ) ( not ( = ?auto_834559 ?auto_834567 ) ) ( not ( = ?auto_834559 ?auto_834568 ) ) ( not ( = ?auto_834559 ?auto_834569 ) ) ( not ( = ?auto_834559 ?auto_834570 ) ) ( not ( = ?auto_834560 ?auto_834561 ) ) ( not ( = ?auto_834560 ?auto_834562 ) ) ( not ( = ?auto_834560 ?auto_834563 ) ) ( not ( = ?auto_834560 ?auto_834564 ) ) ( not ( = ?auto_834560 ?auto_834565 ) ) ( not ( = ?auto_834560 ?auto_834566 ) ) ( not ( = ?auto_834560 ?auto_834567 ) ) ( not ( = ?auto_834560 ?auto_834568 ) ) ( not ( = ?auto_834560 ?auto_834569 ) ) ( not ( = ?auto_834560 ?auto_834570 ) ) ( not ( = ?auto_834561 ?auto_834562 ) ) ( not ( = ?auto_834561 ?auto_834563 ) ) ( not ( = ?auto_834561 ?auto_834564 ) ) ( not ( = ?auto_834561 ?auto_834565 ) ) ( not ( = ?auto_834561 ?auto_834566 ) ) ( not ( = ?auto_834561 ?auto_834567 ) ) ( not ( = ?auto_834561 ?auto_834568 ) ) ( not ( = ?auto_834561 ?auto_834569 ) ) ( not ( = ?auto_834561 ?auto_834570 ) ) ( not ( = ?auto_834562 ?auto_834563 ) ) ( not ( = ?auto_834562 ?auto_834564 ) ) ( not ( = ?auto_834562 ?auto_834565 ) ) ( not ( = ?auto_834562 ?auto_834566 ) ) ( not ( = ?auto_834562 ?auto_834567 ) ) ( not ( = ?auto_834562 ?auto_834568 ) ) ( not ( = ?auto_834562 ?auto_834569 ) ) ( not ( = ?auto_834562 ?auto_834570 ) ) ( not ( = ?auto_834563 ?auto_834564 ) ) ( not ( = ?auto_834563 ?auto_834565 ) ) ( not ( = ?auto_834563 ?auto_834566 ) ) ( not ( = ?auto_834563 ?auto_834567 ) ) ( not ( = ?auto_834563 ?auto_834568 ) ) ( not ( = ?auto_834563 ?auto_834569 ) ) ( not ( = ?auto_834563 ?auto_834570 ) ) ( not ( = ?auto_834564 ?auto_834565 ) ) ( not ( = ?auto_834564 ?auto_834566 ) ) ( not ( = ?auto_834564 ?auto_834567 ) ) ( not ( = ?auto_834564 ?auto_834568 ) ) ( not ( = ?auto_834564 ?auto_834569 ) ) ( not ( = ?auto_834564 ?auto_834570 ) ) ( not ( = ?auto_834565 ?auto_834566 ) ) ( not ( = ?auto_834565 ?auto_834567 ) ) ( not ( = ?auto_834565 ?auto_834568 ) ) ( not ( = ?auto_834565 ?auto_834569 ) ) ( not ( = ?auto_834565 ?auto_834570 ) ) ( not ( = ?auto_834566 ?auto_834567 ) ) ( not ( = ?auto_834566 ?auto_834568 ) ) ( not ( = ?auto_834566 ?auto_834569 ) ) ( not ( = ?auto_834566 ?auto_834570 ) ) ( not ( = ?auto_834567 ?auto_834568 ) ) ( not ( = ?auto_834567 ?auto_834569 ) ) ( not ( = ?auto_834567 ?auto_834570 ) ) ( not ( = ?auto_834568 ?auto_834569 ) ) ( not ( = ?auto_834568 ?auto_834570 ) ) ( not ( = ?auto_834569 ?auto_834570 ) ) ( ON ?auto_834568 ?auto_834569 ) ( ON ?auto_834567 ?auto_834568 ) ( ON ?auto_834566 ?auto_834567 ) ( ON ?auto_834565 ?auto_834566 ) ( ON ?auto_834564 ?auto_834565 ) ( ON ?auto_834563 ?auto_834564 ) ( ON ?auto_834562 ?auto_834563 ) ( ON ?auto_834561 ?auto_834562 ) ( CLEAR ?auto_834559 ) ( ON ?auto_834560 ?auto_834561 ) ( CLEAR ?auto_834560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_834553 ?auto_834554 ?auto_834555 ?auto_834556 ?auto_834557 ?auto_834558 ?auto_834559 ?auto_834560 )
      ( MAKE-17PILE ?auto_834553 ?auto_834554 ?auto_834555 ?auto_834556 ?auto_834557 ?auto_834558 ?auto_834559 ?auto_834560 ?auto_834561 ?auto_834562 ?auto_834563 ?auto_834564 ?auto_834565 ?auto_834566 ?auto_834567 ?auto_834568 ?auto_834569 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_834623 - BLOCK
      ?auto_834624 - BLOCK
      ?auto_834625 - BLOCK
      ?auto_834626 - BLOCK
      ?auto_834627 - BLOCK
      ?auto_834628 - BLOCK
      ?auto_834629 - BLOCK
      ?auto_834630 - BLOCK
      ?auto_834631 - BLOCK
      ?auto_834632 - BLOCK
      ?auto_834633 - BLOCK
      ?auto_834634 - BLOCK
      ?auto_834635 - BLOCK
      ?auto_834636 - BLOCK
      ?auto_834637 - BLOCK
      ?auto_834638 - BLOCK
      ?auto_834639 - BLOCK
    )
    :vars
    (
      ?auto_834640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_834639 ?auto_834640 ) ( ON-TABLE ?auto_834623 ) ( ON ?auto_834624 ?auto_834623 ) ( ON ?auto_834625 ?auto_834624 ) ( ON ?auto_834626 ?auto_834625 ) ( ON ?auto_834627 ?auto_834626 ) ( ON ?auto_834628 ?auto_834627 ) ( not ( = ?auto_834623 ?auto_834624 ) ) ( not ( = ?auto_834623 ?auto_834625 ) ) ( not ( = ?auto_834623 ?auto_834626 ) ) ( not ( = ?auto_834623 ?auto_834627 ) ) ( not ( = ?auto_834623 ?auto_834628 ) ) ( not ( = ?auto_834623 ?auto_834629 ) ) ( not ( = ?auto_834623 ?auto_834630 ) ) ( not ( = ?auto_834623 ?auto_834631 ) ) ( not ( = ?auto_834623 ?auto_834632 ) ) ( not ( = ?auto_834623 ?auto_834633 ) ) ( not ( = ?auto_834623 ?auto_834634 ) ) ( not ( = ?auto_834623 ?auto_834635 ) ) ( not ( = ?auto_834623 ?auto_834636 ) ) ( not ( = ?auto_834623 ?auto_834637 ) ) ( not ( = ?auto_834623 ?auto_834638 ) ) ( not ( = ?auto_834623 ?auto_834639 ) ) ( not ( = ?auto_834623 ?auto_834640 ) ) ( not ( = ?auto_834624 ?auto_834625 ) ) ( not ( = ?auto_834624 ?auto_834626 ) ) ( not ( = ?auto_834624 ?auto_834627 ) ) ( not ( = ?auto_834624 ?auto_834628 ) ) ( not ( = ?auto_834624 ?auto_834629 ) ) ( not ( = ?auto_834624 ?auto_834630 ) ) ( not ( = ?auto_834624 ?auto_834631 ) ) ( not ( = ?auto_834624 ?auto_834632 ) ) ( not ( = ?auto_834624 ?auto_834633 ) ) ( not ( = ?auto_834624 ?auto_834634 ) ) ( not ( = ?auto_834624 ?auto_834635 ) ) ( not ( = ?auto_834624 ?auto_834636 ) ) ( not ( = ?auto_834624 ?auto_834637 ) ) ( not ( = ?auto_834624 ?auto_834638 ) ) ( not ( = ?auto_834624 ?auto_834639 ) ) ( not ( = ?auto_834624 ?auto_834640 ) ) ( not ( = ?auto_834625 ?auto_834626 ) ) ( not ( = ?auto_834625 ?auto_834627 ) ) ( not ( = ?auto_834625 ?auto_834628 ) ) ( not ( = ?auto_834625 ?auto_834629 ) ) ( not ( = ?auto_834625 ?auto_834630 ) ) ( not ( = ?auto_834625 ?auto_834631 ) ) ( not ( = ?auto_834625 ?auto_834632 ) ) ( not ( = ?auto_834625 ?auto_834633 ) ) ( not ( = ?auto_834625 ?auto_834634 ) ) ( not ( = ?auto_834625 ?auto_834635 ) ) ( not ( = ?auto_834625 ?auto_834636 ) ) ( not ( = ?auto_834625 ?auto_834637 ) ) ( not ( = ?auto_834625 ?auto_834638 ) ) ( not ( = ?auto_834625 ?auto_834639 ) ) ( not ( = ?auto_834625 ?auto_834640 ) ) ( not ( = ?auto_834626 ?auto_834627 ) ) ( not ( = ?auto_834626 ?auto_834628 ) ) ( not ( = ?auto_834626 ?auto_834629 ) ) ( not ( = ?auto_834626 ?auto_834630 ) ) ( not ( = ?auto_834626 ?auto_834631 ) ) ( not ( = ?auto_834626 ?auto_834632 ) ) ( not ( = ?auto_834626 ?auto_834633 ) ) ( not ( = ?auto_834626 ?auto_834634 ) ) ( not ( = ?auto_834626 ?auto_834635 ) ) ( not ( = ?auto_834626 ?auto_834636 ) ) ( not ( = ?auto_834626 ?auto_834637 ) ) ( not ( = ?auto_834626 ?auto_834638 ) ) ( not ( = ?auto_834626 ?auto_834639 ) ) ( not ( = ?auto_834626 ?auto_834640 ) ) ( not ( = ?auto_834627 ?auto_834628 ) ) ( not ( = ?auto_834627 ?auto_834629 ) ) ( not ( = ?auto_834627 ?auto_834630 ) ) ( not ( = ?auto_834627 ?auto_834631 ) ) ( not ( = ?auto_834627 ?auto_834632 ) ) ( not ( = ?auto_834627 ?auto_834633 ) ) ( not ( = ?auto_834627 ?auto_834634 ) ) ( not ( = ?auto_834627 ?auto_834635 ) ) ( not ( = ?auto_834627 ?auto_834636 ) ) ( not ( = ?auto_834627 ?auto_834637 ) ) ( not ( = ?auto_834627 ?auto_834638 ) ) ( not ( = ?auto_834627 ?auto_834639 ) ) ( not ( = ?auto_834627 ?auto_834640 ) ) ( not ( = ?auto_834628 ?auto_834629 ) ) ( not ( = ?auto_834628 ?auto_834630 ) ) ( not ( = ?auto_834628 ?auto_834631 ) ) ( not ( = ?auto_834628 ?auto_834632 ) ) ( not ( = ?auto_834628 ?auto_834633 ) ) ( not ( = ?auto_834628 ?auto_834634 ) ) ( not ( = ?auto_834628 ?auto_834635 ) ) ( not ( = ?auto_834628 ?auto_834636 ) ) ( not ( = ?auto_834628 ?auto_834637 ) ) ( not ( = ?auto_834628 ?auto_834638 ) ) ( not ( = ?auto_834628 ?auto_834639 ) ) ( not ( = ?auto_834628 ?auto_834640 ) ) ( not ( = ?auto_834629 ?auto_834630 ) ) ( not ( = ?auto_834629 ?auto_834631 ) ) ( not ( = ?auto_834629 ?auto_834632 ) ) ( not ( = ?auto_834629 ?auto_834633 ) ) ( not ( = ?auto_834629 ?auto_834634 ) ) ( not ( = ?auto_834629 ?auto_834635 ) ) ( not ( = ?auto_834629 ?auto_834636 ) ) ( not ( = ?auto_834629 ?auto_834637 ) ) ( not ( = ?auto_834629 ?auto_834638 ) ) ( not ( = ?auto_834629 ?auto_834639 ) ) ( not ( = ?auto_834629 ?auto_834640 ) ) ( not ( = ?auto_834630 ?auto_834631 ) ) ( not ( = ?auto_834630 ?auto_834632 ) ) ( not ( = ?auto_834630 ?auto_834633 ) ) ( not ( = ?auto_834630 ?auto_834634 ) ) ( not ( = ?auto_834630 ?auto_834635 ) ) ( not ( = ?auto_834630 ?auto_834636 ) ) ( not ( = ?auto_834630 ?auto_834637 ) ) ( not ( = ?auto_834630 ?auto_834638 ) ) ( not ( = ?auto_834630 ?auto_834639 ) ) ( not ( = ?auto_834630 ?auto_834640 ) ) ( not ( = ?auto_834631 ?auto_834632 ) ) ( not ( = ?auto_834631 ?auto_834633 ) ) ( not ( = ?auto_834631 ?auto_834634 ) ) ( not ( = ?auto_834631 ?auto_834635 ) ) ( not ( = ?auto_834631 ?auto_834636 ) ) ( not ( = ?auto_834631 ?auto_834637 ) ) ( not ( = ?auto_834631 ?auto_834638 ) ) ( not ( = ?auto_834631 ?auto_834639 ) ) ( not ( = ?auto_834631 ?auto_834640 ) ) ( not ( = ?auto_834632 ?auto_834633 ) ) ( not ( = ?auto_834632 ?auto_834634 ) ) ( not ( = ?auto_834632 ?auto_834635 ) ) ( not ( = ?auto_834632 ?auto_834636 ) ) ( not ( = ?auto_834632 ?auto_834637 ) ) ( not ( = ?auto_834632 ?auto_834638 ) ) ( not ( = ?auto_834632 ?auto_834639 ) ) ( not ( = ?auto_834632 ?auto_834640 ) ) ( not ( = ?auto_834633 ?auto_834634 ) ) ( not ( = ?auto_834633 ?auto_834635 ) ) ( not ( = ?auto_834633 ?auto_834636 ) ) ( not ( = ?auto_834633 ?auto_834637 ) ) ( not ( = ?auto_834633 ?auto_834638 ) ) ( not ( = ?auto_834633 ?auto_834639 ) ) ( not ( = ?auto_834633 ?auto_834640 ) ) ( not ( = ?auto_834634 ?auto_834635 ) ) ( not ( = ?auto_834634 ?auto_834636 ) ) ( not ( = ?auto_834634 ?auto_834637 ) ) ( not ( = ?auto_834634 ?auto_834638 ) ) ( not ( = ?auto_834634 ?auto_834639 ) ) ( not ( = ?auto_834634 ?auto_834640 ) ) ( not ( = ?auto_834635 ?auto_834636 ) ) ( not ( = ?auto_834635 ?auto_834637 ) ) ( not ( = ?auto_834635 ?auto_834638 ) ) ( not ( = ?auto_834635 ?auto_834639 ) ) ( not ( = ?auto_834635 ?auto_834640 ) ) ( not ( = ?auto_834636 ?auto_834637 ) ) ( not ( = ?auto_834636 ?auto_834638 ) ) ( not ( = ?auto_834636 ?auto_834639 ) ) ( not ( = ?auto_834636 ?auto_834640 ) ) ( not ( = ?auto_834637 ?auto_834638 ) ) ( not ( = ?auto_834637 ?auto_834639 ) ) ( not ( = ?auto_834637 ?auto_834640 ) ) ( not ( = ?auto_834638 ?auto_834639 ) ) ( not ( = ?auto_834638 ?auto_834640 ) ) ( not ( = ?auto_834639 ?auto_834640 ) ) ( ON ?auto_834638 ?auto_834639 ) ( ON ?auto_834637 ?auto_834638 ) ( ON ?auto_834636 ?auto_834637 ) ( ON ?auto_834635 ?auto_834636 ) ( ON ?auto_834634 ?auto_834635 ) ( ON ?auto_834633 ?auto_834634 ) ( ON ?auto_834632 ?auto_834633 ) ( ON ?auto_834631 ?auto_834632 ) ( ON ?auto_834630 ?auto_834631 ) ( CLEAR ?auto_834628 ) ( ON ?auto_834629 ?auto_834630 ) ( CLEAR ?auto_834629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_834623 ?auto_834624 ?auto_834625 ?auto_834626 ?auto_834627 ?auto_834628 ?auto_834629 )
      ( MAKE-17PILE ?auto_834623 ?auto_834624 ?auto_834625 ?auto_834626 ?auto_834627 ?auto_834628 ?auto_834629 ?auto_834630 ?auto_834631 ?auto_834632 ?auto_834633 ?auto_834634 ?auto_834635 ?auto_834636 ?auto_834637 ?auto_834638 ?auto_834639 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_834693 - BLOCK
      ?auto_834694 - BLOCK
      ?auto_834695 - BLOCK
      ?auto_834696 - BLOCK
      ?auto_834697 - BLOCK
      ?auto_834698 - BLOCK
      ?auto_834699 - BLOCK
      ?auto_834700 - BLOCK
      ?auto_834701 - BLOCK
      ?auto_834702 - BLOCK
      ?auto_834703 - BLOCK
      ?auto_834704 - BLOCK
      ?auto_834705 - BLOCK
      ?auto_834706 - BLOCK
      ?auto_834707 - BLOCK
      ?auto_834708 - BLOCK
      ?auto_834709 - BLOCK
    )
    :vars
    (
      ?auto_834710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_834709 ?auto_834710 ) ( ON-TABLE ?auto_834693 ) ( ON ?auto_834694 ?auto_834693 ) ( ON ?auto_834695 ?auto_834694 ) ( ON ?auto_834696 ?auto_834695 ) ( ON ?auto_834697 ?auto_834696 ) ( not ( = ?auto_834693 ?auto_834694 ) ) ( not ( = ?auto_834693 ?auto_834695 ) ) ( not ( = ?auto_834693 ?auto_834696 ) ) ( not ( = ?auto_834693 ?auto_834697 ) ) ( not ( = ?auto_834693 ?auto_834698 ) ) ( not ( = ?auto_834693 ?auto_834699 ) ) ( not ( = ?auto_834693 ?auto_834700 ) ) ( not ( = ?auto_834693 ?auto_834701 ) ) ( not ( = ?auto_834693 ?auto_834702 ) ) ( not ( = ?auto_834693 ?auto_834703 ) ) ( not ( = ?auto_834693 ?auto_834704 ) ) ( not ( = ?auto_834693 ?auto_834705 ) ) ( not ( = ?auto_834693 ?auto_834706 ) ) ( not ( = ?auto_834693 ?auto_834707 ) ) ( not ( = ?auto_834693 ?auto_834708 ) ) ( not ( = ?auto_834693 ?auto_834709 ) ) ( not ( = ?auto_834693 ?auto_834710 ) ) ( not ( = ?auto_834694 ?auto_834695 ) ) ( not ( = ?auto_834694 ?auto_834696 ) ) ( not ( = ?auto_834694 ?auto_834697 ) ) ( not ( = ?auto_834694 ?auto_834698 ) ) ( not ( = ?auto_834694 ?auto_834699 ) ) ( not ( = ?auto_834694 ?auto_834700 ) ) ( not ( = ?auto_834694 ?auto_834701 ) ) ( not ( = ?auto_834694 ?auto_834702 ) ) ( not ( = ?auto_834694 ?auto_834703 ) ) ( not ( = ?auto_834694 ?auto_834704 ) ) ( not ( = ?auto_834694 ?auto_834705 ) ) ( not ( = ?auto_834694 ?auto_834706 ) ) ( not ( = ?auto_834694 ?auto_834707 ) ) ( not ( = ?auto_834694 ?auto_834708 ) ) ( not ( = ?auto_834694 ?auto_834709 ) ) ( not ( = ?auto_834694 ?auto_834710 ) ) ( not ( = ?auto_834695 ?auto_834696 ) ) ( not ( = ?auto_834695 ?auto_834697 ) ) ( not ( = ?auto_834695 ?auto_834698 ) ) ( not ( = ?auto_834695 ?auto_834699 ) ) ( not ( = ?auto_834695 ?auto_834700 ) ) ( not ( = ?auto_834695 ?auto_834701 ) ) ( not ( = ?auto_834695 ?auto_834702 ) ) ( not ( = ?auto_834695 ?auto_834703 ) ) ( not ( = ?auto_834695 ?auto_834704 ) ) ( not ( = ?auto_834695 ?auto_834705 ) ) ( not ( = ?auto_834695 ?auto_834706 ) ) ( not ( = ?auto_834695 ?auto_834707 ) ) ( not ( = ?auto_834695 ?auto_834708 ) ) ( not ( = ?auto_834695 ?auto_834709 ) ) ( not ( = ?auto_834695 ?auto_834710 ) ) ( not ( = ?auto_834696 ?auto_834697 ) ) ( not ( = ?auto_834696 ?auto_834698 ) ) ( not ( = ?auto_834696 ?auto_834699 ) ) ( not ( = ?auto_834696 ?auto_834700 ) ) ( not ( = ?auto_834696 ?auto_834701 ) ) ( not ( = ?auto_834696 ?auto_834702 ) ) ( not ( = ?auto_834696 ?auto_834703 ) ) ( not ( = ?auto_834696 ?auto_834704 ) ) ( not ( = ?auto_834696 ?auto_834705 ) ) ( not ( = ?auto_834696 ?auto_834706 ) ) ( not ( = ?auto_834696 ?auto_834707 ) ) ( not ( = ?auto_834696 ?auto_834708 ) ) ( not ( = ?auto_834696 ?auto_834709 ) ) ( not ( = ?auto_834696 ?auto_834710 ) ) ( not ( = ?auto_834697 ?auto_834698 ) ) ( not ( = ?auto_834697 ?auto_834699 ) ) ( not ( = ?auto_834697 ?auto_834700 ) ) ( not ( = ?auto_834697 ?auto_834701 ) ) ( not ( = ?auto_834697 ?auto_834702 ) ) ( not ( = ?auto_834697 ?auto_834703 ) ) ( not ( = ?auto_834697 ?auto_834704 ) ) ( not ( = ?auto_834697 ?auto_834705 ) ) ( not ( = ?auto_834697 ?auto_834706 ) ) ( not ( = ?auto_834697 ?auto_834707 ) ) ( not ( = ?auto_834697 ?auto_834708 ) ) ( not ( = ?auto_834697 ?auto_834709 ) ) ( not ( = ?auto_834697 ?auto_834710 ) ) ( not ( = ?auto_834698 ?auto_834699 ) ) ( not ( = ?auto_834698 ?auto_834700 ) ) ( not ( = ?auto_834698 ?auto_834701 ) ) ( not ( = ?auto_834698 ?auto_834702 ) ) ( not ( = ?auto_834698 ?auto_834703 ) ) ( not ( = ?auto_834698 ?auto_834704 ) ) ( not ( = ?auto_834698 ?auto_834705 ) ) ( not ( = ?auto_834698 ?auto_834706 ) ) ( not ( = ?auto_834698 ?auto_834707 ) ) ( not ( = ?auto_834698 ?auto_834708 ) ) ( not ( = ?auto_834698 ?auto_834709 ) ) ( not ( = ?auto_834698 ?auto_834710 ) ) ( not ( = ?auto_834699 ?auto_834700 ) ) ( not ( = ?auto_834699 ?auto_834701 ) ) ( not ( = ?auto_834699 ?auto_834702 ) ) ( not ( = ?auto_834699 ?auto_834703 ) ) ( not ( = ?auto_834699 ?auto_834704 ) ) ( not ( = ?auto_834699 ?auto_834705 ) ) ( not ( = ?auto_834699 ?auto_834706 ) ) ( not ( = ?auto_834699 ?auto_834707 ) ) ( not ( = ?auto_834699 ?auto_834708 ) ) ( not ( = ?auto_834699 ?auto_834709 ) ) ( not ( = ?auto_834699 ?auto_834710 ) ) ( not ( = ?auto_834700 ?auto_834701 ) ) ( not ( = ?auto_834700 ?auto_834702 ) ) ( not ( = ?auto_834700 ?auto_834703 ) ) ( not ( = ?auto_834700 ?auto_834704 ) ) ( not ( = ?auto_834700 ?auto_834705 ) ) ( not ( = ?auto_834700 ?auto_834706 ) ) ( not ( = ?auto_834700 ?auto_834707 ) ) ( not ( = ?auto_834700 ?auto_834708 ) ) ( not ( = ?auto_834700 ?auto_834709 ) ) ( not ( = ?auto_834700 ?auto_834710 ) ) ( not ( = ?auto_834701 ?auto_834702 ) ) ( not ( = ?auto_834701 ?auto_834703 ) ) ( not ( = ?auto_834701 ?auto_834704 ) ) ( not ( = ?auto_834701 ?auto_834705 ) ) ( not ( = ?auto_834701 ?auto_834706 ) ) ( not ( = ?auto_834701 ?auto_834707 ) ) ( not ( = ?auto_834701 ?auto_834708 ) ) ( not ( = ?auto_834701 ?auto_834709 ) ) ( not ( = ?auto_834701 ?auto_834710 ) ) ( not ( = ?auto_834702 ?auto_834703 ) ) ( not ( = ?auto_834702 ?auto_834704 ) ) ( not ( = ?auto_834702 ?auto_834705 ) ) ( not ( = ?auto_834702 ?auto_834706 ) ) ( not ( = ?auto_834702 ?auto_834707 ) ) ( not ( = ?auto_834702 ?auto_834708 ) ) ( not ( = ?auto_834702 ?auto_834709 ) ) ( not ( = ?auto_834702 ?auto_834710 ) ) ( not ( = ?auto_834703 ?auto_834704 ) ) ( not ( = ?auto_834703 ?auto_834705 ) ) ( not ( = ?auto_834703 ?auto_834706 ) ) ( not ( = ?auto_834703 ?auto_834707 ) ) ( not ( = ?auto_834703 ?auto_834708 ) ) ( not ( = ?auto_834703 ?auto_834709 ) ) ( not ( = ?auto_834703 ?auto_834710 ) ) ( not ( = ?auto_834704 ?auto_834705 ) ) ( not ( = ?auto_834704 ?auto_834706 ) ) ( not ( = ?auto_834704 ?auto_834707 ) ) ( not ( = ?auto_834704 ?auto_834708 ) ) ( not ( = ?auto_834704 ?auto_834709 ) ) ( not ( = ?auto_834704 ?auto_834710 ) ) ( not ( = ?auto_834705 ?auto_834706 ) ) ( not ( = ?auto_834705 ?auto_834707 ) ) ( not ( = ?auto_834705 ?auto_834708 ) ) ( not ( = ?auto_834705 ?auto_834709 ) ) ( not ( = ?auto_834705 ?auto_834710 ) ) ( not ( = ?auto_834706 ?auto_834707 ) ) ( not ( = ?auto_834706 ?auto_834708 ) ) ( not ( = ?auto_834706 ?auto_834709 ) ) ( not ( = ?auto_834706 ?auto_834710 ) ) ( not ( = ?auto_834707 ?auto_834708 ) ) ( not ( = ?auto_834707 ?auto_834709 ) ) ( not ( = ?auto_834707 ?auto_834710 ) ) ( not ( = ?auto_834708 ?auto_834709 ) ) ( not ( = ?auto_834708 ?auto_834710 ) ) ( not ( = ?auto_834709 ?auto_834710 ) ) ( ON ?auto_834708 ?auto_834709 ) ( ON ?auto_834707 ?auto_834708 ) ( ON ?auto_834706 ?auto_834707 ) ( ON ?auto_834705 ?auto_834706 ) ( ON ?auto_834704 ?auto_834705 ) ( ON ?auto_834703 ?auto_834704 ) ( ON ?auto_834702 ?auto_834703 ) ( ON ?auto_834701 ?auto_834702 ) ( ON ?auto_834700 ?auto_834701 ) ( ON ?auto_834699 ?auto_834700 ) ( CLEAR ?auto_834697 ) ( ON ?auto_834698 ?auto_834699 ) ( CLEAR ?auto_834698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_834693 ?auto_834694 ?auto_834695 ?auto_834696 ?auto_834697 ?auto_834698 )
      ( MAKE-17PILE ?auto_834693 ?auto_834694 ?auto_834695 ?auto_834696 ?auto_834697 ?auto_834698 ?auto_834699 ?auto_834700 ?auto_834701 ?auto_834702 ?auto_834703 ?auto_834704 ?auto_834705 ?auto_834706 ?auto_834707 ?auto_834708 ?auto_834709 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_834763 - BLOCK
      ?auto_834764 - BLOCK
      ?auto_834765 - BLOCK
      ?auto_834766 - BLOCK
      ?auto_834767 - BLOCK
      ?auto_834768 - BLOCK
      ?auto_834769 - BLOCK
      ?auto_834770 - BLOCK
      ?auto_834771 - BLOCK
      ?auto_834772 - BLOCK
      ?auto_834773 - BLOCK
      ?auto_834774 - BLOCK
      ?auto_834775 - BLOCK
      ?auto_834776 - BLOCK
      ?auto_834777 - BLOCK
      ?auto_834778 - BLOCK
      ?auto_834779 - BLOCK
    )
    :vars
    (
      ?auto_834780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_834779 ?auto_834780 ) ( ON-TABLE ?auto_834763 ) ( ON ?auto_834764 ?auto_834763 ) ( ON ?auto_834765 ?auto_834764 ) ( ON ?auto_834766 ?auto_834765 ) ( not ( = ?auto_834763 ?auto_834764 ) ) ( not ( = ?auto_834763 ?auto_834765 ) ) ( not ( = ?auto_834763 ?auto_834766 ) ) ( not ( = ?auto_834763 ?auto_834767 ) ) ( not ( = ?auto_834763 ?auto_834768 ) ) ( not ( = ?auto_834763 ?auto_834769 ) ) ( not ( = ?auto_834763 ?auto_834770 ) ) ( not ( = ?auto_834763 ?auto_834771 ) ) ( not ( = ?auto_834763 ?auto_834772 ) ) ( not ( = ?auto_834763 ?auto_834773 ) ) ( not ( = ?auto_834763 ?auto_834774 ) ) ( not ( = ?auto_834763 ?auto_834775 ) ) ( not ( = ?auto_834763 ?auto_834776 ) ) ( not ( = ?auto_834763 ?auto_834777 ) ) ( not ( = ?auto_834763 ?auto_834778 ) ) ( not ( = ?auto_834763 ?auto_834779 ) ) ( not ( = ?auto_834763 ?auto_834780 ) ) ( not ( = ?auto_834764 ?auto_834765 ) ) ( not ( = ?auto_834764 ?auto_834766 ) ) ( not ( = ?auto_834764 ?auto_834767 ) ) ( not ( = ?auto_834764 ?auto_834768 ) ) ( not ( = ?auto_834764 ?auto_834769 ) ) ( not ( = ?auto_834764 ?auto_834770 ) ) ( not ( = ?auto_834764 ?auto_834771 ) ) ( not ( = ?auto_834764 ?auto_834772 ) ) ( not ( = ?auto_834764 ?auto_834773 ) ) ( not ( = ?auto_834764 ?auto_834774 ) ) ( not ( = ?auto_834764 ?auto_834775 ) ) ( not ( = ?auto_834764 ?auto_834776 ) ) ( not ( = ?auto_834764 ?auto_834777 ) ) ( not ( = ?auto_834764 ?auto_834778 ) ) ( not ( = ?auto_834764 ?auto_834779 ) ) ( not ( = ?auto_834764 ?auto_834780 ) ) ( not ( = ?auto_834765 ?auto_834766 ) ) ( not ( = ?auto_834765 ?auto_834767 ) ) ( not ( = ?auto_834765 ?auto_834768 ) ) ( not ( = ?auto_834765 ?auto_834769 ) ) ( not ( = ?auto_834765 ?auto_834770 ) ) ( not ( = ?auto_834765 ?auto_834771 ) ) ( not ( = ?auto_834765 ?auto_834772 ) ) ( not ( = ?auto_834765 ?auto_834773 ) ) ( not ( = ?auto_834765 ?auto_834774 ) ) ( not ( = ?auto_834765 ?auto_834775 ) ) ( not ( = ?auto_834765 ?auto_834776 ) ) ( not ( = ?auto_834765 ?auto_834777 ) ) ( not ( = ?auto_834765 ?auto_834778 ) ) ( not ( = ?auto_834765 ?auto_834779 ) ) ( not ( = ?auto_834765 ?auto_834780 ) ) ( not ( = ?auto_834766 ?auto_834767 ) ) ( not ( = ?auto_834766 ?auto_834768 ) ) ( not ( = ?auto_834766 ?auto_834769 ) ) ( not ( = ?auto_834766 ?auto_834770 ) ) ( not ( = ?auto_834766 ?auto_834771 ) ) ( not ( = ?auto_834766 ?auto_834772 ) ) ( not ( = ?auto_834766 ?auto_834773 ) ) ( not ( = ?auto_834766 ?auto_834774 ) ) ( not ( = ?auto_834766 ?auto_834775 ) ) ( not ( = ?auto_834766 ?auto_834776 ) ) ( not ( = ?auto_834766 ?auto_834777 ) ) ( not ( = ?auto_834766 ?auto_834778 ) ) ( not ( = ?auto_834766 ?auto_834779 ) ) ( not ( = ?auto_834766 ?auto_834780 ) ) ( not ( = ?auto_834767 ?auto_834768 ) ) ( not ( = ?auto_834767 ?auto_834769 ) ) ( not ( = ?auto_834767 ?auto_834770 ) ) ( not ( = ?auto_834767 ?auto_834771 ) ) ( not ( = ?auto_834767 ?auto_834772 ) ) ( not ( = ?auto_834767 ?auto_834773 ) ) ( not ( = ?auto_834767 ?auto_834774 ) ) ( not ( = ?auto_834767 ?auto_834775 ) ) ( not ( = ?auto_834767 ?auto_834776 ) ) ( not ( = ?auto_834767 ?auto_834777 ) ) ( not ( = ?auto_834767 ?auto_834778 ) ) ( not ( = ?auto_834767 ?auto_834779 ) ) ( not ( = ?auto_834767 ?auto_834780 ) ) ( not ( = ?auto_834768 ?auto_834769 ) ) ( not ( = ?auto_834768 ?auto_834770 ) ) ( not ( = ?auto_834768 ?auto_834771 ) ) ( not ( = ?auto_834768 ?auto_834772 ) ) ( not ( = ?auto_834768 ?auto_834773 ) ) ( not ( = ?auto_834768 ?auto_834774 ) ) ( not ( = ?auto_834768 ?auto_834775 ) ) ( not ( = ?auto_834768 ?auto_834776 ) ) ( not ( = ?auto_834768 ?auto_834777 ) ) ( not ( = ?auto_834768 ?auto_834778 ) ) ( not ( = ?auto_834768 ?auto_834779 ) ) ( not ( = ?auto_834768 ?auto_834780 ) ) ( not ( = ?auto_834769 ?auto_834770 ) ) ( not ( = ?auto_834769 ?auto_834771 ) ) ( not ( = ?auto_834769 ?auto_834772 ) ) ( not ( = ?auto_834769 ?auto_834773 ) ) ( not ( = ?auto_834769 ?auto_834774 ) ) ( not ( = ?auto_834769 ?auto_834775 ) ) ( not ( = ?auto_834769 ?auto_834776 ) ) ( not ( = ?auto_834769 ?auto_834777 ) ) ( not ( = ?auto_834769 ?auto_834778 ) ) ( not ( = ?auto_834769 ?auto_834779 ) ) ( not ( = ?auto_834769 ?auto_834780 ) ) ( not ( = ?auto_834770 ?auto_834771 ) ) ( not ( = ?auto_834770 ?auto_834772 ) ) ( not ( = ?auto_834770 ?auto_834773 ) ) ( not ( = ?auto_834770 ?auto_834774 ) ) ( not ( = ?auto_834770 ?auto_834775 ) ) ( not ( = ?auto_834770 ?auto_834776 ) ) ( not ( = ?auto_834770 ?auto_834777 ) ) ( not ( = ?auto_834770 ?auto_834778 ) ) ( not ( = ?auto_834770 ?auto_834779 ) ) ( not ( = ?auto_834770 ?auto_834780 ) ) ( not ( = ?auto_834771 ?auto_834772 ) ) ( not ( = ?auto_834771 ?auto_834773 ) ) ( not ( = ?auto_834771 ?auto_834774 ) ) ( not ( = ?auto_834771 ?auto_834775 ) ) ( not ( = ?auto_834771 ?auto_834776 ) ) ( not ( = ?auto_834771 ?auto_834777 ) ) ( not ( = ?auto_834771 ?auto_834778 ) ) ( not ( = ?auto_834771 ?auto_834779 ) ) ( not ( = ?auto_834771 ?auto_834780 ) ) ( not ( = ?auto_834772 ?auto_834773 ) ) ( not ( = ?auto_834772 ?auto_834774 ) ) ( not ( = ?auto_834772 ?auto_834775 ) ) ( not ( = ?auto_834772 ?auto_834776 ) ) ( not ( = ?auto_834772 ?auto_834777 ) ) ( not ( = ?auto_834772 ?auto_834778 ) ) ( not ( = ?auto_834772 ?auto_834779 ) ) ( not ( = ?auto_834772 ?auto_834780 ) ) ( not ( = ?auto_834773 ?auto_834774 ) ) ( not ( = ?auto_834773 ?auto_834775 ) ) ( not ( = ?auto_834773 ?auto_834776 ) ) ( not ( = ?auto_834773 ?auto_834777 ) ) ( not ( = ?auto_834773 ?auto_834778 ) ) ( not ( = ?auto_834773 ?auto_834779 ) ) ( not ( = ?auto_834773 ?auto_834780 ) ) ( not ( = ?auto_834774 ?auto_834775 ) ) ( not ( = ?auto_834774 ?auto_834776 ) ) ( not ( = ?auto_834774 ?auto_834777 ) ) ( not ( = ?auto_834774 ?auto_834778 ) ) ( not ( = ?auto_834774 ?auto_834779 ) ) ( not ( = ?auto_834774 ?auto_834780 ) ) ( not ( = ?auto_834775 ?auto_834776 ) ) ( not ( = ?auto_834775 ?auto_834777 ) ) ( not ( = ?auto_834775 ?auto_834778 ) ) ( not ( = ?auto_834775 ?auto_834779 ) ) ( not ( = ?auto_834775 ?auto_834780 ) ) ( not ( = ?auto_834776 ?auto_834777 ) ) ( not ( = ?auto_834776 ?auto_834778 ) ) ( not ( = ?auto_834776 ?auto_834779 ) ) ( not ( = ?auto_834776 ?auto_834780 ) ) ( not ( = ?auto_834777 ?auto_834778 ) ) ( not ( = ?auto_834777 ?auto_834779 ) ) ( not ( = ?auto_834777 ?auto_834780 ) ) ( not ( = ?auto_834778 ?auto_834779 ) ) ( not ( = ?auto_834778 ?auto_834780 ) ) ( not ( = ?auto_834779 ?auto_834780 ) ) ( ON ?auto_834778 ?auto_834779 ) ( ON ?auto_834777 ?auto_834778 ) ( ON ?auto_834776 ?auto_834777 ) ( ON ?auto_834775 ?auto_834776 ) ( ON ?auto_834774 ?auto_834775 ) ( ON ?auto_834773 ?auto_834774 ) ( ON ?auto_834772 ?auto_834773 ) ( ON ?auto_834771 ?auto_834772 ) ( ON ?auto_834770 ?auto_834771 ) ( ON ?auto_834769 ?auto_834770 ) ( ON ?auto_834768 ?auto_834769 ) ( CLEAR ?auto_834766 ) ( ON ?auto_834767 ?auto_834768 ) ( CLEAR ?auto_834767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_834763 ?auto_834764 ?auto_834765 ?auto_834766 ?auto_834767 )
      ( MAKE-17PILE ?auto_834763 ?auto_834764 ?auto_834765 ?auto_834766 ?auto_834767 ?auto_834768 ?auto_834769 ?auto_834770 ?auto_834771 ?auto_834772 ?auto_834773 ?auto_834774 ?auto_834775 ?auto_834776 ?auto_834777 ?auto_834778 ?auto_834779 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_834833 - BLOCK
      ?auto_834834 - BLOCK
      ?auto_834835 - BLOCK
      ?auto_834836 - BLOCK
      ?auto_834837 - BLOCK
      ?auto_834838 - BLOCK
      ?auto_834839 - BLOCK
      ?auto_834840 - BLOCK
      ?auto_834841 - BLOCK
      ?auto_834842 - BLOCK
      ?auto_834843 - BLOCK
      ?auto_834844 - BLOCK
      ?auto_834845 - BLOCK
      ?auto_834846 - BLOCK
      ?auto_834847 - BLOCK
      ?auto_834848 - BLOCK
      ?auto_834849 - BLOCK
    )
    :vars
    (
      ?auto_834850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_834849 ?auto_834850 ) ( ON-TABLE ?auto_834833 ) ( ON ?auto_834834 ?auto_834833 ) ( ON ?auto_834835 ?auto_834834 ) ( not ( = ?auto_834833 ?auto_834834 ) ) ( not ( = ?auto_834833 ?auto_834835 ) ) ( not ( = ?auto_834833 ?auto_834836 ) ) ( not ( = ?auto_834833 ?auto_834837 ) ) ( not ( = ?auto_834833 ?auto_834838 ) ) ( not ( = ?auto_834833 ?auto_834839 ) ) ( not ( = ?auto_834833 ?auto_834840 ) ) ( not ( = ?auto_834833 ?auto_834841 ) ) ( not ( = ?auto_834833 ?auto_834842 ) ) ( not ( = ?auto_834833 ?auto_834843 ) ) ( not ( = ?auto_834833 ?auto_834844 ) ) ( not ( = ?auto_834833 ?auto_834845 ) ) ( not ( = ?auto_834833 ?auto_834846 ) ) ( not ( = ?auto_834833 ?auto_834847 ) ) ( not ( = ?auto_834833 ?auto_834848 ) ) ( not ( = ?auto_834833 ?auto_834849 ) ) ( not ( = ?auto_834833 ?auto_834850 ) ) ( not ( = ?auto_834834 ?auto_834835 ) ) ( not ( = ?auto_834834 ?auto_834836 ) ) ( not ( = ?auto_834834 ?auto_834837 ) ) ( not ( = ?auto_834834 ?auto_834838 ) ) ( not ( = ?auto_834834 ?auto_834839 ) ) ( not ( = ?auto_834834 ?auto_834840 ) ) ( not ( = ?auto_834834 ?auto_834841 ) ) ( not ( = ?auto_834834 ?auto_834842 ) ) ( not ( = ?auto_834834 ?auto_834843 ) ) ( not ( = ?auto_834834 ?auto_834844 ) ) ( not ( = ?auto_834834 ?auto_834845 ) ) ( not ( = ?auto_834834 ?auto_834846 ) ) ( not ( = ?auto_834834 ?auto_834847 ) ) ( not ( = ?auto_834834 ?auto_834848 ) ) ( not ( = ?auto_834834 ?auto_834849 ) ) ( not ( = ?auto_834834 ?auto_834850 ) ) ( not ( = ?auto_834835 ?auto_834836 ) ) ( not ( = ?auto_834835 ?auto_834837 ) ) ( not ( = ?auto_834835 ?auto_834838 ) ) ( not ( = ?auto_834835 ?auto_834839 ) ) ( not ( = ?auto_834835 ?auto_834840 ) ) ( not ( = ?auto_834835 ?auto_834841 ) ) ( not ( = ?auto_834835 ?auto_834842 ) ) ( not ( = ?auto_834835 ?auto_834843 ) ) ( not ( = ?auto_834835 ?auto_834844 ) ) ( not ( = ?auto_834835 ?auto_834845 ) ) ( not ( = ?auto_834835 ?auto_834846 ) ) ( not ( = ?auto_834835 ?auto_834847 ) ) ( not ( = ?auto_834835 ?auto_834848 ) ) ( not ( = ?auto_834835 ?auto_834849 ) ) ( not ( = ?auto_834835 ?auto_834850 ) ) ( not ( = ?auto_834836 ?auto_834837 ) ) ( not ( = ?auto_834836 ?auto_834838 ) ) ( not ( = ?auto_834836 ?auto_834839 ) ) ( not ( = ?auto_834836 ?auto_834840 ) ) ( not ( = ?auto_834836 ?auto_834841 ) ) ( not ( = ?auto_834836 ?auto_834842 ) ) ( not ( = ?auto_834836 ?auto_834843 ) ) ( not ( = ?auto_834836 ?auto_834844 ) ) ( not ( = ?auto_834836 ?auto_834845 ) ) ( not ( = ?auto_834836 ?auto_834846 ) ) ( not ( = ?auto_834836 ?auto_834847 ) ) ( not ( = ?auto_834836 ?auto_834848 ) ) ( not ( = ?auto_834836 ?auto_834849 ) ) ( not ( = ?auto_834836 ?auto_834850 ) ) ( not ( = ?auto_834837 ?auto_834838 ) ) ( not ( = ?auto_834837 ?auto_834839 ) ) ( not ( = ?auto_834837 ?auto_834840 ) ) ( not ( = ?auto_834837 ?auto_834841 ) ) ( not ( = ?auto_834837 ?auto_834842 ) ) ( not ( = ?auto_834837 ?auto_834843 ) ) ( not ( = ?auto_834837 ?auto_834844 ) ) ( not ( = ?auto_834837 ?auto_834845 ) ) ( not ( = ?auto_834837 ?auto_834846 ) ) ( not ( = ?auto_834837 ?auto_834847 ) ) ( not ( = ?auto_834837 ?auto_834848 ) ) ( not ( = ?auto_834837 ?auto_834849 ) ) ( not ( = ?auto_834837 ?auto_834850 ) ) ( not ( = ?auto_834838 ?auto_834839 ) ) ( not ( = ?auto_834838 ?auto_834840 ) ) ( not ( = ?auto_834838 ?auto_834841 ) ) ( not ( = ?auto_834838 ?auto_834842 ) ) ( not ( = ?auto_834838 ?auto_834843 ) ) ( not ( = ?auto_834838 ?auto_834844 ) ) ( not ( = ?auto_834838 ?auto_834845 ) ) ( not ( = ?auto_834838 ?auto_834846 ) ) ( not ( = ?auto_834838 ?auto_834847 ) ) ( not ( = ?auto_834838 ?auto_834848 ) ) ( not ( = ?auto_834838 ?auto_834849 ) ) ( not ( = ?auto_834838 ?auto_834850 ) ) ( not ( = ?auto_834839 ?auto_834840 ) ) ( not ( = ?auto_834839 ?auto_834841 ) ) ( not ( = ?auto_834839 ?auto_834842 ) ) ( not ( = ?auto_834839 ?auto_834843 ) ) ( not ( = ?auto_834839 ?auto_834844 ) ) ( not ( = ?auto_834839 ?auto_834845 ) ) ( not ( = ?auto_834839 ?auto_834846 ) ) ( not ( = ?auto_834839 ?auto_834847 ) ) ( not ( = ?auto_834839 ?auto_834848 ) ) ( not ( = ?auto_834839 ?auto_834849 ) ) ( not ( = ?auto_834839 ?auto_834850 ) ) ( not ( = ?auto_834840 ?auto_834841 ) ) ( not ( = ?auto_834840 ?auto_834842 ) ) ( not ( = ?auto_834840 ?auto_834843 ) ) ( not ( = ?auto_834840 ?auto_834844 ) ) ( not ( = ?auto_834840 ?auto_834845 ) ) ( not ( = ?auto_834840 ?auto_834846 ) ) ( not ( = ?auto_834840 ?auto_834847 ) ) ( not ( = ?auto_834840 ?auto_834848 ) ) ( not ( = ?auto_834840 ?auto_834849 ) ) ( not ( = ?auto_834840 ?auto_834850 ) ) ( not ( = ?auto_834841 ?auto_834842 ) ) ( not ( = ?auto_834841 ?auto_834843 ) ) ( not ( = ?auto_834841 ?auto_834844 ) ) ( not ( = ?auto_834841 ?auto_834845 ) ) ( not ( = ?auto_834841 ?auto_834846 ) ) ( not ( = ?auto_834841 ?auto_834847 ) ) ( not ( = ?auto_834841 ?auto_834848 ) ) ( not ( = ?auto_834841 ?auto_834849 ) ) ( not ( = ?auto_834841 ?auto_834850 ) ) ( not ( = ?auto_834842 ?auto_834843 ) ) ( not ( = ?auto_834842 ?auto_834844 ) ) ( not ( = ?auto_834842 ?auto_834845 ) ) ( not ( = ?auto_834842 ?auto_834846 ) ) ( not ( = ?auto_834842 ?auto_834847 ) ) ( not ( = ?auto_834842 ?auto_834848 ) ) ( not ( = ?auto_834842 ?auto_834849 ) ) ( not ( = ?auto_834842 ?auto_834850 ) ) ( not ( = ?auto_834843 ?auto_834844 ) ) ( not ( = ?auto_834843 ?auto_834845 ) ) ( not ( = ?auto_834843 ?auto_834846 ) ) ( not ( = ?auto_834843 ?auto_834847 ) ) ( not ( = ?auto_834843 ?auto_834848 ) ) ( not ( = ?auto_834843 ?auto_834849 ) ) ( not ( = ?auto_834843 ?auto_834850 ) ) ( not ( = ?auto_834844 ?auto_834845 ) ) ( not ( = ?auto_834844 ?auto_834846 ) ) ( not ( = ?auto_834844 ?auto_834847 ) ) ( not ( = ?auto_834844 ?auto_834848 ) ) ( not ( = ?auto_834844 ?auto_834849 ) ) ( not ( = ?auto_834844 ?auto_834850 ) ) ( not ( = ?auto_834845 ?auto_834846 ) ) ( not ( = ?auto_834845 ?auto_834847 ) ) ( not ( = ?auto_834845 ?auto_834848 ) ) ( not ( = ?auto_834845 ?auto_834849 ) ) ( not ( = ?auto_834845 ?auto_834850 ) ) ( not ( = ?auto_834846 ?auto_834847 ) ) ( not ( = ?auto_834846 ?auto_834848 ) ) ( not ( = ?auto_834846 ?auto_834849 ) ) ( not ( = ?auto_834846 ?auto_834850 ) ) ( not ( = ?auto_834847 ?auto_834848 ) ) ( not ( = ?auto_834847 ?auto_834849 ) ) ( not ( = ?auto_834847 ?auto_834850 ) ) ( not ( = ?auto_834848 ?auto_834849 ) ) ( not ( = ?auto_834848 ?auto_834850 ) ) ( not ( = ?auto_834849 ?auto_834850 ) ) ( ON ?auto_834848 ?auto_834849 ) ( ON ?auto_834847 ?auto_834848 ) ( ON ?auto_834846 ?auto_834847 ) ( ON ?auto_834845 ?auto_834846 ) ( ON ?auto_834844 ?auto_834845 ) ( ON ?auto_834843 ?auto_834844 ) ( ON ?auto_834842 ?auto_834843 ) ( ON ?auto_834841 ?auto_834842 ) ( ON ?auto_834840 ?auto_834841 ) ( ON ?auto_834839 ?auto_834840 ) ( ON ?auto_834838 ?auto_834839 ) ( ON ?auto_834837 ?auto_834838 ) ( CLEAR ?auto_834835 ) ( ON ?auto_834836 ?auto_834837 ) ( CLEAR ?auto_834836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_834833 ?auto_834834 ?auto_834835 ?auto_834836 )
      ( MAKE-17PILE ?auto_834833 ?auto_834834 ?auto_834835 ?auto_834836 ?auto_834837 ?auto_834838 ?auto_834839 ?auto_834840 ?auto_834841 ?auto_834842 ?auto_834843 ?auto_834844 ?auto_834845 ?auto_834846 ?auto_834847 ?auto_834848 ?auto_834849 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_834903 - BLOCK
      ?auto_834904 - BLOCK
      ?auto_834905 - BLOCK
      ?auto_834906 - BLOCK
      ?auto_834907 - BLOCK
      ?auto_834908 - BLOCK
      ?auto_834909 - BLOCK
      ?auto_834910 - BLOCK
      ?auto_834911 - BLOCK
      ?auto_834912 - BLOCK
      ?auto_834913 - BLOCK
      ?auto_834914 - BLOCK
      ?auto_834915 - BLOCK
      ?auto_834916 - BLOCK
      ?auto_834917 - BLOCK
      ?auto_834918 - BLOCK
      ?auto_834919 - BLOCK
    )
    :vars
    (
      ?auto_834920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_834919 ?auto_834920 ) ( ON-TABLE ?auto_834903 ) ( ON ?auto_834904 ?auto_834903 ) ( not ( = ?auto_834903 ?auto_834904 ) ) ( not ( = ?auto_834903 ?auto_834905 ) ) ( not ( = ?auto_834903 ?auto_834906 ) ) ( not ( = ?auto_834903 ?auto_834907 ) ) ( not ( = ?auto_834903 ?auto_834908 ) ) ( not ( = ?auto_834903 ?auto_834909 ) ) ( not ( = ?auto_834903 ?auto_834910 ) ) ( not ( = ?auto_834903 ?auto_834911 ) ) ( not ( = ?auto_834903 ?auto_834912 ) ) ( not ( = ?auto_834903 ?auto_834913 ) ) ( not ( = ?auto_834903 ?auto_834914 ) ) ( not ( = ?auto_834903 ?auto_834915 ) ) ( not ( = ?auto_834903 ?auto_834916 ) ) ( not ( = ?auto_834903 ?auto_834917 ) ) ( not ( = ?auto_834903 ?auto_834918 ) ) ( not ( = ?auto_834903 ?auto_834919 ) ) ( not ( = ?auto_834903 ?auto_834920 ) ) ( not ( = ?auto_834904 ?auto_834905 ) ) ( not ( = ?auto_834904 ?auto_834906 ) ) ( not ( = ?auto_834904 ?auto_834907 ) ) ( not ( = ?auto_834904 ?auto_834908 ) ) ( not ( = ?auto_834904 ?auto_834909 ) ) ( not ( = ?auto_834904 ?auto_834910 ) ) ( not ( = ?auto_834904 ?auto_834911 ) ) ( not ( = ?auto_834904 ?auto_834912 ) ) ( not ( = ?auto_834904 ?auto_834913 ) ) ( not ( = ?auto_834904 ?auto_834914 ) ) ( not ( = ?auto_834904 ?auto_834915 ) ) ( not ( = ?auto_834904 ?auto_834916 ) ) ( not ( = ?auto_834904 ?auto_834917 ) ) ( not ( = ?auto_834904 ?auto_834918 ) ) ( not ( = ?auto_834904 ?auto_834919 ) ) ( not ( = ?auto_834904 ?auto_834920 ) ) ( not ( = ?auto_834905 ?auto_834906 ) ) ( not ( = ?auto_834905 ?auto_834907 ) ) ( not ( = ?auto_834905 ?auto_834908 ) ) ( not ( = ?auto_834905 ?auto_834909 ) ) ( not ( = ?auto_834905 ?auto_834910 ) ) ( not ( = ?auto_834905 ?auto_834911 ) ) ( not ( = ?auto_834905 ?auto_834912 ) ) ( not ( = ?auto_834905 ?auto_834913 ) ) ( not ( = ?auto_834905 ?auto_834914 ) ) ( not ( = ?auto_834905 ?auto_834915 ) ) ( not ( = ?auto_834905 ?auto_834916 ) ) ( not ( = ?auto_834905 ?auto_834917 ) ) ( not ( = ?auto_834905 ?auto_834918 ) ) ( not ( = ?auto_834905 ?auto_834919 ) ) ( not ( = ?auto_834905 ?auto_834920 ) ) ( not ( = ?auto_834906 ?auto_834907 ) ) ( not ( = ?auto_834906 ?auto_834908 ) ) ( not ( = ?auto_834906 ?auto_834909 ) ) ( not ( = ?auto_834906 ?auto_834910 ) ) ( not ( = ?auto_834906 ?auto_834911 ) ) ( not ( = ?auto_834906 ?auto_834912 ) ) ( not ( = ?auto_834906 ?auto_834913 ) ) ( not ( = ?auto_834906 ?auto_834914 ) ) ( not ( = ?auto_834906 ?auto_834915 ) ) ( not ( = ?auto_834906 ?auto_834916 ) ) ( not ( = ?auto_834906 ?auto_834917 ) ) ( not ( = ?auto_834906 ?auto_834918 ) ) ( not ( = ?auto_834906 ?auto_834919 ) ) ( not ( = ?auto_834906 ?auto_834920 ) ) ( not ( = ?auto_834907 ?auto_834908 ) ) ( not ( = ?auto_834907 ?auto_834909 ) ) ( not ( = ?auto_834907 ?auto_834910 ) ) ( not ( = ?auto_834907 ?auto_834911 ) ) ( not ( = ?auto_834907 ?auto_834912 ) ) ( not ( = ?auto_834907 ?auto_834913 ) ) ( not ( = ?auto_834907 ?auto_834914 ) ) ( not ( = ?auto_834907 ?auto_834915 ) ) ( not ( = ?auto_834907 ?auto_834916 ) ) ( not ( = ?auto_834907 ?auto_834917 ) ) ( not ( = ?auto_834907 ?auto_834918 ) ) ( not ( = ?auto_834907 ?auto_834919 ) ) ( not ( = ?auto_834907 ?auto_834920 ) ) ( not ( = ?auto_834908 ?auto_834909 ) ) ( not ( = ?auto_834908 ?auto_834910 ) ) ( not ( = ?auto_834908 ?auto_834911 ) ) ( not ( = ?auto_834908 ?auto_834912 ) ) ( not ( = ?auto_834908 ?auto_834913 ) ) ( not ( = ?auto_834908 ?auto_834914 ) ) ( not ( = ?auto_834908 ?auto_834915 ) ) ( not ( = ?auto_834908 ?auto_834916 ) ) ( not ( = ?auto_834908 ?auto_834917 ) ) ( not ( = ?auto_834908 ?auto_834918 ) ) ( not ( = ?auto_834908 ?auto_834919 ) ) ( not ( = ?auto_834908 ?auto_834920 ) ) ( not ( = ?auto_834909 ?auto_834910 ) ) ( not ( = ?auto_834909 ?auto_834911 ) ) ( not ( = ?auto_834909 ?auto_834912 ) ) ( not ( = ?auto_834909 ?auto_834913 ) ) ( not ( = ?auto_834909 ?auto_834914 ) ) ( not ( = ?auto_834909 ?auto_834915 ) ) ( not ( = ?auto_834909 ?auto_834916 ) ) ( not ( = ?auto_834909 ?auto_834917 ) ) ( not ( = ?auto_834909 ?auto_834918 ) ) ( not ( = ?auto_834909 ?auto_834919 ) ) ( not ( = ?auto_834909 ?auto_834920 ) ) ( not ( = ?auto_834910 ?auto_834911 ) ) ( not ( = ?auto_834910 ?auto_834912 ) ) ( not ( = ?auto_834910 ?auto_834913 ) ) ( not ( = ?auto_834910 ?auto_834914 ) ) ( not ( = ?auto_834910 ?auto_834915 ) ) ( not ( = ?auto_834910 ?auto_834916 ) ) ( not ( = ?auto_834910 ?auto_834917 ) ) ( not ( = ?auto_834910 ?auto_834918 ) ) ( not ( = ?auto_834910 ?auto_834919 ) ) ( not ( = ?auto_834910 ?auto_834920 ) ) ( not ( = ?auto_834911 ?auto_834912 ) ) ( not ( = ?auto_834911 ?auto_834913 ) ) ( not ( = ?auto_834911 ?auto_834914 ) ) ( not ( = ?auto_834911 ?auto_834915 ) ) ( not ( = ?auto_834911 ?auto_834916 ) ) ( not ( = ?auto_834911 ?auto_834917 ) ) ( not ( = ?auto_834911 ?auto_834918 ) ) ( not ( = ?auto_834911 ?auto_834919 ) ) ( not ( = ?auto_834911 ?auto_834920 ) ) ( not ( = ?auto_834912 ?auto_834913 ) ) ( not ( = ?auto_834912 ?auto_834914 ) ) ( not ( = ?auto_834912 ?auto_834915 ) ) ( not ( = ?auto_834912 ?auto_834916 ) ) ( not ( = ?auto_834912 ?auto_834917 ) ) ( not ( = ?auto_834912 ?auto_834918 ) ) ( not ( = ?auto_834912 ?auto_834919 ) ) ( not ( = ?auto_834912 ?auto_834920 ) ) ( not ( = ?auto_834913 ?auto_834914 ) ) ( not ( = ?auto_834913 ?auto_834915 ) ) ( not ( = ?auto_834913 ?auto_834916 ) ) ( not ( = ?auto_834913 ?auto_834917 ) ) ( not ( = ?auto_834913 ?auto_834918 ) ) ( not ( = ?auto_834913 ?auto_834919 ) ) ( not ( = ?auto_834913 ?auto_834920 ) ) ( not ( = ?auto_834914 ?auto_834915 ) ) ( not ( = ?auto_834914 ?auto_834916 ) ) ( not ( = ?auto_834914 ?auto_834917 ) ) ( not ( = ?auto_834914 ?auto_834918 ) ) ( not ( = ?auto_834914 ?auto_834919 ) ) ( not ( = ?auto_834914 ?auto_834920 ) ) ( not ( = ?auto_834915 ?auto_834916 ) ) ( not ( = ?auto_834915 ?auto_834917 ) ) ( not ( = ?auto_834915 ?auto_834918 ) ) ( not ( = ?auto_834915 ?auto_834919 ) ) ( not ( = ?auto_834915 ?auto_834920 ) ) ( not ( = ?auto_834916 ?auto_834917 ) ) ( not ( = ?auto_834916 ?auto_834918 ) ) ( not ( = ?auto_834916 ?auto_834919 ) ) ( not ( = ?auto_834916 ?auto_834920 ) ) ( not ( = ?auto_834917 ?auto_834918 ) ) ( not ( = ?auto_834917 ?auto_834919 ) ) ( not ( = ?auto_834917 ?auto_834920 ) ) ( not ( = ?auto_834918 ?auto_834919 ) ) ( not ( = ?auto_834918 ?auto_834920 ) ) ( not ( = ?auto_834919 ?auto_834920 ) ) ( ON ?auto_834918 ?auto_834919 ) ( ON ?auto_834917 ?auto_834918 ) ( ON ?auto_834916 ?auto_834917 ) ( ON ?auto_834915 ?auto_834916 ) ( ON ?auto_834914 ?auto_834915 ) ( ON ?auto_834913 ?auto_834914 ) ( ON ?auto_834912 ?auto_834913 ) ( ON ?auto_834911 ?auto_834912 ) ( ON ?auto_834910 ?auto_834911 ) ( ON ?auto_834909 ?auto_834910 ) ( ON ?auto_834908 ?auto_834909 ) ( ON ?auto_834907 ?auto_834908 ) ( ON ?auto_834906 ?auto_834907 ) ( CLEAR ?auto_834904 ) ( ON ?auto_834905 ?auto_834906 ) ( CLEAR ?auto_834905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_834903 ?auto_834904 ?auto_834905 )
      ( MAKE-17PILE ?auto_834903 ?auto_834904 ?auto_834905 ?auto_834906 ?auto_834907 ?auto_834908 ?auto_834909 ?auto_834910 ?auto_834911 ?auto_834912 ?auto_834913 ?auto_834914 ?auto_834915 ?auto_834916 ?auto_834917 ?auto_834918 ?auto_834919 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_834973 - BLOCK
      ?auto_834974 - BLOCK
      ?auto_834975 - BLOCK
      ?auto_834976 - BLOCK
      ?auto_834977 - BLOCK
      ?auto_834978 - BLOCK
      ?auto_834979 - BLOCK
      ?auto_834980 - BLOCK
      ?auto_834981 - BLOCK
      ?auto_834982 - BLOCK
      ?auto_834983 - BLOCK
      ?auto_834984 - BLOCK
      ?auto_834985 - BLOCK
      ?auto_834986 - BLOCK
      ?auto_834987 - BLOCK
      ?auto_834988 - BLOCK
      ?auto_834989 - BLOCK
    )
    :vars
    (
      ?auto_834990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_834989 ?auto_834990 ) ( ON-TABLE ?auto_834973 ) ( not ( = ?auto_834973 ?auto_834974 ) ) ( not ( = ?auto_834973 ?auto_834975 ) ) ( not ( = ?auto_834973 ?auto_834976 ) ) ( not ( = ?auto_834973 ?auto_834977 ) ) ( not ( = ?auto_834973 ?auto_834978 ) ) ( not ( = ?auto_834973 ?auto_834979 ) ) ( not ( = ?auto_834973 ?auto_834980 ) ) ( not ( = ?auto_834973 ?auto_834981 ) ) ( not ( = ?auto_834973 ?auto_834982 ) ) ( not ( = ?auto_834973 ?auto_834983 ) ) ( not ( = ?auto_834973 ?auto_834984 ) ) ( not ( = ?auto_834973 ?auto_834985 ) ) ( not ( = ?auto_834973 ?auto_834986 ) ) ( not ( = ?auto_834973 ?auto_834987 ) ) ( not ( = ?auto_834973 ?auto_834988 ) ) ( not ( = ?auto_834973 ?auto_834989 ) ) ( not ( = ?auto_834973 ?auto_834990 ) ) ( not ( = ?auto_834974 ?auto_834975 ) ) ( not ( = ?auto_834974 ?auto_834976 ) ) ( not ( = ?auto_834974 ?auto_834977 ) ) ( not ( = ?auto_834974 ?auto_834978 ) ) ( not ( = ?auto_834974 ?auto_834979 ) ) ( not ( = ?auto_834974 ?auto_834980 ) ) ( not ( = ?auto_834974 ?auto_834981 ) ) ( not ( = ?auto_834974 ?auto_834982 ) ) ( not ( = ?auto_834974 ?auto_834983 ) ) ( not ( = ?auto_834974 ?auto_834984 ) ) ( not ( = ?auto_834974 ?auto_834985 ) ) ( not ( = ?auto_834974 ?auto_834986 ) ) ( not ( = ?auto_834974 ?auto_834987 ) ) ( not ( = ?auto_834974 ?auto_834988 ) ) ( not ( = ?auto_834974 ?auto_834989 ) ) ( not ( = ?auto_834974 ?auto_834990 ) ) ( not ( = ?auto_834975 ?auto_834976 ) ) ( not ( = ?auto_834975 ?auto_834977 ) ) ( not ( = ?auto_834975 ?auto_834978 ) ) ( not ( = ?auto_834975 ?auto_834979 ) ) ( not ( = ?auto_834975 ?auto_834980 ) ) ( not ( = ?auto_834975 ?auto_834981 ) ) ( not ( = ?auto_834975 ?auto_834982 ) ) ( not ( = ?auto_834975 ?auto_834983 ) ) ( not ( = ?auto_834975 ?auto_834984 ) ) ( not ( = ?auto_834975 ?auto_834985 ) ) ( not ( = ?auto_834975 ?auto_834986 ) ) ( not ( = ?auto_834975 ?auto_834987 ) ) ( not ( = ?auto_834975 ?auto_834988 ) ) ( not ( = ?auto_834975 ?auto_834989 ) ) ( not ( = ?auto_834975 ?auto_834990 ) ) ( not ( = ?auto_834976 ?auto_834977 ) ) ( not ( = ?auto_834976 ?auto_834978 ) ) ( not ( = ?auto_834976 ?auto_834979 ) ) ( not ( = ?auto_834976 ?auto_834980 ) ) ( not ( = ?auto_834976 ?auto_834981 ) ) ( not ( = ?auto_834976 ?auto_834982 ) ) ( not ( = ?auto_834976 ?auto_834983 ) ) ( not ( = ?auto_834976 ?auto_834984 ) ) ( not ( = ?auto_834976 ?auto_834985 ) ) ( not ( = ?auto_834976 ?auto_834986 ) ) ( not ( = ?auto_834976 ?auto_834987 ) ) ( not ( = ?auto_834976 ?auto_834988 ) ) ( not ( = ?auto_834976 ?auto_834989 ) ) ( not ( = ?auto_834976 ?auto_834990 ) ) ( not ( = ?auto_834977 ?auto_834978 ) ) ( not ( = ?auto_834977 ?auto_834979 ) ) ( not ( = ?auto_834977 ?auto_834980 ) ) ( not ( = ?auto_834977 ?auto_834981 ) ) ( not ( = ?auto_834977 ?auto_834982 ) ) ( not ( = ?auto_834977 ?auto_834983 ) ) ( not ( = ?auto_834977 ?auto_834984 ) ) ( not ( = ?auto_834977 ?auto_834985 ) ) ( not ( = ?auto_834977 ?auto_834986 ) ) ( not ( = ?auto_834977 ?auto_834987 ) ) ( not ( = ?auto_834977 ?auto_834988 ) ) ( not ( = ?auto_834977 ?auto_834989 ) ) ( not ( = ?auto_834977 ?auto_834990 ) ) ( not ( = ?auto_834978 ?auto_834979 ) ) ( not ( = ?auto_834978 ?auto_834980 ) ) ( not ( = ?auto_834978 ?auto_834981 ) ) ( not ( = ?auto_834978 ?auto_834982 ) ) ( not ( = ?auto_834978 ?auto_834983 ) ) ( not ( = ?auto_834978 ?auto_834984 ) ) ( not ( = ?auto_834978 ?auto_834985 ) ) ( not ( = ?auto_834978 ?auto_834986 ) ) ( not ( = ?auto_834978 ?auto_834987 ) ) ( not ( = ?auto_834978 ?auto_834988 ) ) ( not ( = ?auto_834978 ?auto_834989 ) ) ( not ( = ?auto_834978 ?auto_834990 ) ) ( not ( = ?auto_834979 ?auto_834980 ) ) ( not ( = ?auto_834979 ?auto_834981 ) ) ( not ( = ?auto_834979 ?auto_834982 ) ) ( not ( = ?auto_834979 ?auto_834983 ) ) ( not ( = ?auto_834979 ?auto_834984 ) ) ( not ( = ?auto_834979 ?auto_834985 ) ) ( not ( = ?auto_834979 ?auto_834986 ) ) ( not ( = ?auto_834979 ?auto_834987 ) ) ( not ( = ?auto_834979 ?auto_834988 ) ) ( not ( = ?auto_834979 ?auto_834989 ) ) ( not ( = ?auto_834979 ?auto_834990 ) ) ( not ( = ?auto_834980 ?auto_834981 ) ) ( not ( = ?auto_834980 ?auto_834982 ) ) ( not ( = ?auto_834980 ?auto_834983 ) ) ( not ( = ?auto_834980 ?auto_834984 ) ) ( not ( = ?auto_834980 ?auto_834985 ) ) ( not ( = ?auto_834980 ?auto_834986 ) ) ( not ( = ?auto_834980 ?auto_834987 ) ) ( not ( = ?auto_834980 ?auto_834988 ) ) ( not ( = ?auto_834980 ?auto_834989 ) ) ( not ( = ?auto_834980 ?auto_834990 ) ) ( not ( = ?auto_834981 ?auto_834982 ) ) ( not ( = ?auto_834981 ?auto_834983 ) ) ( not ( = ?auto_834981 ?auto_834984 ) ) ( not ( = ?auto_834981 ?auto_834985 ) ) ( not ( = ?auto_834981 ?auto_834986 ) ) ( not ( = ?auto_834981 ?auto_834987 ) ) ( not ( = ?auto_834981 ?auto_834988 ) ) ( not ( = ?auto_834981 ?auto_834989 ) ) ( not ( = ?auto_834981 ?auto_834990 ) ) ( not ( = ?auto_834982 ?auto_834983 ) ) ( not ( = ?auto_834982 ?auto_834984 ) ) ( not ( = ?auto_834982 ?auto_834985 ) ) ( not ( = ?auto_834982 ?auto_834986 ) ) ( not ( = ?auto_834982 ?auto_834987 ) ) ( not ( = ?auto_834982 ?auto_834988 ) ) ( not ( = ?auto_834982 ?auto_834989 ) ) ( not ( = ?auto_834982 ?auto_834990 ) ) ( not ( = ?auto_834983 ?auto_834984 ) ) ( not ( = ?auto_834983 ?auto_834985 ) ) ( not ( = ?auto_834983 ?auto_834986 ) ) ( not ( = ?auto_834983 ?auto_834987 ) ) ( not ( = ?auto_834983 ?auto_834988 ) ) ( not ( = ?auto_834983 ?auto_834989 ) ) ( not ( = ?auto_834983 ?auto_834990 ) ) ( not ( = ?auto_834984 ?auto_834985 ) ) ( not ( = ?auto_834984 ?auto_834986 ) ) ( not ( = ?auto_834984 ?auto_834987 ) ) ( not ( = ?auto_834984 ?auto_834988 ) ) ( not ( = ?auto_834984 ?auto_834989 ) ) ( not ( = ?auto_834984 ?auto_834990 ) ) ( not ( = ?auto_834985 ?auto_834986 ) ) ( not ( = ?auto_834985 ?auto_834987 ) ) ( not ( = ?auto_834985 ?auto_834988 ) ) ( not ( = ?auto_834985 ?auto_834989 ) ) ( not ( = ?auto_834985 ?auto_834990 ) ) ( not ( = ?auto_834986 ?auto_834987 ) ) ( not ( = ?auto_834986 ?auto_834988 ) ) ( not ( = ?auto_834986 ?auto_834989 ) ) ( not ( = ?auto_834986 ?auto_834990 ) ) ( not ( = ?auto_834987 ?auto_834988 ) ) ( not ( = ?auto_834987 ?auto_834989 ) ) ( not ( = ?auto_834987 ?auto_834990 ) ) ( not ( = ?auto_834988 ?auto_834989 ) ) ( not ( = ?auto_834988 ?auto_834990 ) ) ( not ( = ?auto_834989 ?auto_834990 ) ) ( ON ?auto_834988 ?auto_834989 ) ( ON ?auto_834987 ?auto_834988 ) ( ON ?auto_834986 ?auto_834987 ) ( ON ?auto_834985 ?auto_834986 ) ( ON ?auto_834984 ?auto_834985 ) ( ON ?auto_834983 ?auto_834984 ) ( ON ?auto_834982 ?auto_834983 ) ( ON ?auto_834981 ?auto_834982 ) ( ON ?auto_834980 ?auto_834981 ) ( ON ?auto_834979 ?auto_834980 ) ( ON ?auto_834978 ?auto_834979 ) ( ON ?auto_834977 ?auto_834978 ) ( ON ?auto_834976 ?auto_834977 ) ( ON ?auto_834975 ?auto_834976 ) ( CLEAR ?auto_834973 ) ( ON ?auto_834974 ?auto_834975 ) ( CLEAR ?auto_834974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_834973 ?auto_834974 )
      ( MAKE-17PILE ?auto_834973 ?auto_834974 ?auto_834975 ?auto_834976 ?auto_834977 ?auto_834978 ?auto_834979 ?auto_834980 ?auto_834981 ?auto_834982 ?auto_834983 ?auto_834984 ?auto_834985 ?auto_834986 ?auto_834987 ?auto_834988 ?auto_834989 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_835043 - BLOCK
      ?auto_835044 - BLOCK
      ?auto_835045 - BLOCK
      ?auto_835046 - BLOCK
      ?auto_835047 - BLOCK
      ?auto_835048 - BLOCK
      ?auto_835049 - BLOCK
      ?auto_835050 - BLOCK
      ?auto_835051 - BLOCK
      ?auto_835052 - BLOCK
      ?auto_835053 - BLOCK
      ?auto_835054 - BLOCK
      ?auto_835055 - BLOCK
      ?auto_835056 - BLOCK
      ?auto_835057 - BLOCK
      ?auto_835058 - BLOCK
      ?auto_835059 - BLOCK
    )
    :vars
    (
      ?auto_835060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_835059 ?auto_835060 ) ( not ( = ?auto_835043 ?auto_835044 ) ) ( not ( = ?auto_835043 ?auto_835045 ) ) ( not ( = ?auto_835043 ?auto_835046 ) ) ( not ( = ?auto_835043 ?auto_835047 ) ) ( not ( = ?auto_835043 ?auto_835048 ) ) ( not ( = ?auto_835043 ?auto_835049 ) ) ( not ( = ?auto_835043 ?auto_835050 ) ) ( not ( = ?auto_835043 ?auto_835051 ) ) ( not ( = ?auto_835043 ?auto_835052 ) ) ( not ( = ?auto_835043 ?auto_835053 ) ) ( not ( = ?auto_835043 ?auto_835054 ) ) ( not ( = ?auto_835043 ?auto_835055 ) ) ( not ( = ?auto_835043 ?auto_835056 ) ) ( not ( = ?auto_835043 ?auto_835057 ) ) ( not ( = ?auto_835043 ?auto_835058 ) ) ( not ( = ?auto_835043 ?auto_835059 ) ) ( not ( = ?auto_835043 ?auto_835060 ) ) ( not ( = ?auto_835044 ?auto_835045 ) ) ( not ( = ?auto_835044 ?auto_835046 ) ) ( not ( = ?auto_835044 ?auto_835047 ) ) ( not ( = ?auto_835044 ?auto_835048 ) ) ( not ( = ?auto_835044 ?auto_835049 ) ) ( not ( = ?auto_835044 ?auto_835050 ) ) ( not ( = ?auto_835044 ?auto_835051 ) ) ( not ( = ?auto_835044 ?auto_835052 ) ) ( not ( = ?auto_835044 ?auto_835053 ) ) ( not ( = ?auto_835044 ?auto_835054 ) ) ( not ( = ?auto_835044 ?auto_835055 ) ) ( not ( = ?auto_835044 ?auto_835056 ) ) ( not ( = ?auto_835044 ?auto_835057 ) ) ( not ( = ?auto_835044 ?auto_835058 ) ) ( not ( = ?auto_835044 ?auto_835059 ) ) ( not ( = ?auto_835044 ?auto_835060 ) ) ( not ( = ?auto_835045 ?auto_835046 ) ) ( not ( = ?auto_835045 ?auto_835047 ) ) ( not ( = ?auto_835045 ?auto_835048 ) ) ( not ( = ?auto_835045 ?auto_835049 ) ) ( not ( = ?auto_835045 ?auto_835050 ) ) ( not ( = ?auto_835045 ?auto_835051 ) ) ( not ( = ?auto_835045 ?auto_835052 ) ) ( not ( = ?auto_835045 ?auto_835053 ) ) ( not ( = ?auto_835045 ?auto_835054 ) ) ( not ( = ?auto_835045 ?auto_835055 ) ) ( not ( = ?auto_835045 ?auto_835056 ) ) ( not ( = ?auto_835045 ?auto_835057 ) ) ( not ( = ?auto_835045 ?auto_835058 ) ) ( not ( = ?auto_835045 ?auto_835059 ) ) ( not ( = ?auto_835045 ?auto_835060 ) ) ( not ( = ?auto_835046 ?auto_835047 ) ) ( not ( = ?auto_835046 ?auto_835048 ) ) ( not ( = ?auto_835046 ?auto_835049 ) ) ( not ( = ?auto_835046 ?auto_835050 ) ) ( not ( = ?auto_835046 ?auto_835051 ) ) ( not ( = ?auto_835046 ?auto_835052 ) ) ( not ( = ?auto_835046 ?auto_835053 ) ) ( not ( = ?auto_835046 ?auto_835054 ) ) ( not ( = ?auto_835046 ?auto_835055 ) ) ( not ( = ?auto_835046 ?auto_835056 ) ) ( not ( = ?auto_835046 ?auto_835057 ) ) ( not ( = ?auto_835046 ?auto_835058 ) ) ( not ( = ?auto_835046 ?auto_835059 ) ) ( not ( = ?auto_835046 ?auto_835060 ) ) ( not ( = ?auto_835047 ?auto_835048 ) ) ( not ( = ?auto_835047 ?auto_835049 ) ) ( not ( = ?auto_835047 ?auto_835050 ) ) ( not ( = ?auto_835047 ?auto_835051 ) ) ( not ( = ?auto_835047 ?auto_835052 ) ) ( not ( = ?auto_835047 ?auto_835053 ) ) ( not ( = ?auto_835047 ?auto_835054 ) ) ( not ( = ?auto_835047 ?auto_835055 ) ) ( not ( = ?auto_835047 ?auto_835056 ) ) ( not ( = ?auto_835047 ?auto_835057 ) ) ( not ( = ?auto_835047 ?auto_835058 ) ) ( not ( = ?auto_835047 ?auto_835059 ) ) ( not ( = ?auto_835047 ?auto_835060 ) ) ( not ( = ?auto_835048 ?auto_835049 ) ) ( not ( = ?auto_835048 ?auto_835050 ) ) ( not ( = ?auto_835048 ?auto_835051 ) ) ( not ( = ?auto_835048 ?auto_835052 ) ) ( not ( = ?auto_835048 ?auto_835053 ) ) ( not ( = ?auto_835048 ?auto_835054 ) ) ( not ( = ?auto_835048 ?auto_835055 ) ) ( not ( = ?auto_835048 ?auto_835056 ) ) ( not ( = ?auto_835048 ?auto_835057 ) ) ( not ( = ?auto_835048 ?auto_835058 ) ) ( not ( = ?auto_835048 ?auto_835059 ) ) ( not ( = ?auto_835048 ?auto_835060 ) ) ( not ( = ?auto_835049 ?auto_835050 ) ) ( not ( = ?auto_835049 ?auto_835051 ) ) ( not ( = ?auto_835049 ?auto_835052 ) ) ( not ( = ?auto_835049 ?auto_835053 ) ) ( not ( = ?auto_835049 ?auto_835054 ) ) ( not ( = ?auto_835049 ?auto_835055 ) ) ( not ( = ?auto_835049 ?auto_835056 ) ) ( not ( = ?auto_835049 ?auto_835057 ) ) ( not ( = ?auto_835049 ?auto_835058 ) ) ( not ( = ?auto_835049 ?auto_835059 ) ) ( not ( = ?auto_835049 ?auto_835060 ) ) ( not ( = ?auto_835050 ?auto_835051 ) ) ( not ( = ?auto_835050 ?auto_835052 ) ) ( not ( = ?auto_835050 ?auto_835053 ) ) ( not ( = ?auto_835050 ?auto_835054 ) ) ( not ( = ?auto_835050 ?auto_835055 ) ) ( not ( = ?auto_835050 ?auto_835056 ) ) ( not ( = ?auto_835050 ?auto_835057 ) ) ( not ( = ?auto_835050 ?auto_835058 ) ) ( not ( = ?auto_835050 ?auto_835059 ) ) ( not ( = ?auto_835050 ?auto_835060 ) ) ( not ( = ?auto_835051 ?auto_835052 ) ) ( not ( = ?auto_835051 ?auto_835053 ) ) ( not ( = ?auto_835051 ?auto_835054 ) ) ( not ( = ?auto_835051 ?auto_835055 ) ) ( not ( = ?auto_835051 ?auto_835056 ) ) ( not ( = ?auto_835051 ?auto_835057 ) ) ( not ( = ?auto_835051 ?auto_835058 ) ) ( not ( = ?auto_835051 ?auto_835059 ) ) ( not ( = ?auto_835051 ?auto_835060 ) ) ( not ( = ?auto_835052 ?auto_835053 ) ) ( not ( = ?auto_835052 ?auto_835054 ) ) ( not ( = ?auto_835052 ?auto_835055 ) ) ( not ( = ?auto_835052 ?auto_835056 ) ) ( not ( = ?auto_835052 ?auto_835057 ) ) ( not ( = ?auto_835052 ?auto_835058 ) ) ( not ( = ?auto_835052 ?auto_835059 ) ) ( not ( = ?auto_835052 ?auto_835060 ) ) ( not ( = ?auto_835053 ?auto_835054 ) ) ( not ( = ?auto_835053 ?auto_835055 ) ) ( not ( = ?auto_835053 ?auto_835056 ) ) ( not ( = ?auto_835053 ?auto_835057 ) ) ( not ( = ?auto_835053 ?auto_835058 ) ) ( not ( = ?auto_835053 ?auto_835059 ) ) ( not ( = ?auto_835053 ?auto_835060 ) ) ( not ( = ?auto_835054 ?auto_835055 ) ) ( not ( = ?auto_835054 ?auto_835056 ) ) ( not ( = ?auto_835054 ?auto_835057 ) ) ( not ( = ?auto_835054 ?auto_835058 ) ) ( not ( = ?auto_835054 ?auto_835059 ) ) ( not ( = ?auto_835054 ?auto_835060 ) ) ( not ( = ?auto_835055 ?auto_835056 ) ) ( not ( = ?auto_835055 ?auto_835057 ) ) ( not ( = ?auto_835055 ?auto_835058 ) ) ( not ( = ?auto_835055 ?auto_835059 ) ) ( not ( = ?auto_835055 ?auto_835060 ) ) ( not ( = ?auto_835056 ?auto_835057 ) ) ( not ( = ?auto_835056 ?auto_835058 ) ) ( not ( = ?auto_835056 ?auto_835059 ) ) ( not ( = ?auto_835056 ?auto_835060 ) ) ( not ( = ?auto_835057 ?auto_835058 ) ) ( not ( = ?auto_835057 ?auto_835059 ) ) ( not ( = ?auto_835057 ?auto_835060 ) ) ( not ( = ?auto_835058 ?auto_835059 ) ) ( not ( = ?auto_835058 ?auto_835060 ) ) ( not ( = ?auto_835059 ?auto_835060 ) ) ( ON ?auto_835058 ?auto_835059 ) ( ON ?auto_835057 ?auto_835058 ) ( ON ?auto_835056 ?auto_835057 ) ( ON ?auto_835055 ?auto_835056 ) ( ON ?auto_835054 ?auto_835055 ) ( ON ?auto_835053 ?auto_835054 ) ( ON ?auto_835052 ?auto_835053 ) ( ON ?auto_835051 ?auto_835052 ) ( ON ?auto_835050 ?auto_835051 ) ( ON ?auto_835049 ?auto_835050 ) ( ON ?auto_835048 ?auto_835049 ) ( ON ?auto_835047 ?auto_835048 ) ( ON ?auto_835046 ?auto_835047 ) ( ON ?auto_835045 ?auto_835046 ) ( ON ?auto_835044 ?auto_835045 ) ( ON ?auto_835043 ?auto_835044 ) ( CLEAR ?auto_835043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_835043 )
      ( MAKE-17PILE ?auto_835043 ?auto_835044 ?auto_835045 ?auto_835046 ?auto_835047 ?auto_835048 ?auto_835049 ?auto_835050 ?auto_835051 ?auto_835052 ?auto_835053 ?auto_835054 ?auto_835055 ?auto_835056 ?auto_835057 ?auto_835058 ?auto_835059 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_835114 - BLOCK
      ?auto_835115 - BLOCK
      ?auto_835116 - BLOCK
      ?auto_835117 - BLOCK
      ?auto_835118 - BLOCK
      ?auto_835119 - BLOCK
      ?auto_835120 - BLOCK
      ?auto_835121 - BLOCK
      ?auto_835122 - BLOCK
      ?auto_835123 - BLOCK
      ?auto_835124 - BLOCK
      ?auto_835125 - BLOCK
      ?auto_835126 - BLOCK
      ?auto_835127 - BLOCK
      ?auto_835128 - BLOCK
      ?auto_835129 - BLOCK
      ?auto_835130 - BLOCK
      ?auto_835131 - BLOCK
    )
    :vars
    (
      ?auto_835132 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_835130 ) ( ON ?auto_835131 ?auto_835132 ) ( CLEAR ?auto_835131 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_835114 ) ( ON ?auto_835115 ?auto_835114 ) ( ON ?auto_835116 ?auto_835115 ) ( ON ?auto_835117 ?auto_835116 ) ( ON ?auto_835118 ?auto_835117 ) ( ON ?auto_835119 ?auto_835118 ) ( ON ?auto_835120 ?auto_835119 ) ( ON ?auto_835121 ?auto_835120 ) ( ON ?auto_835122 ?auto_835121 ) ( ON ?auto_835123 ?auto_835122 ) ( ON ?auto_835124 ?auto_835123 ) ( ON ?auto_835125 ?auto_835124 ) ( ON ?auto_835126 ?auto_835125 ) ( ON ?auto_835127 ?auto_835126 ) ( ON ?auto_835128 ?auto_835127 ) ( ON ?auto_835129 ?auto_835128 ) ( ON ?auto_835130 ?auto_835129 ) ( not ( = ?auto_835114 ?auto_835115 ) ) ( not ( = ?auto_835114 ?auto_835116 ) ) ( not ( = ?auto_835114 ?auto_835117 ) ) ( not ( = ?auto_835114 ?auto_835118 ) ) ( not ( = ?auto_835114 ?auto_835119 ) ) ( not ( = ?auto_835114 ?auto_835120 ) ) ( not ( = ?auto_835114 ?auto_835121 ) ) ( not ( = ?auto_835114 ?auto_835122 ) ) ( not ( = ?auto_835114 ?auto_835123 ) ) ( not ( = ?auto_835114 ?auto_835124 ) ) ( not ( = ?auto_835114 ?auto_835125 ) ) ( not ( = ?auto_835114 ?auto_835126 ) ) ( not ( = ?auto_835114 ?auto_835127 ) ) ( not ( = ?auto_835114 ?auto_835128 ) ) ( not ( = ?auto_835114 ?auto_835129 ) ) ( not ( = ?auto_835114 ?auto_835130 ) ) ( not ( = ?auto_835114 ?auto_835131 ) ) ( not ( = ?auto_835114 ?auto_835132 ) ) ( not ( = ?auto_835115 ?auto_835116 ) ) ( not ( = ?auto_835115 ?auto_835117 ) ) ( not ( = ?auto_835115 ?auto_835118 ) ) ( not ( = ?auto_835115 ?auto_835119 ) ) ( not ( = ?auto_835115 ?auto_835120 ) ) ( not ( = ?auto_835115 ?auto_835121 ) ) ( not ( = ?auto_835115 ?auto_835122 ) ) ( not ( = ?auto_835115 ?auto_835123 ) ) ( not ( = ?auto_835115 ?auto_835124 ) ) ( not ( = ?auto_835115 ?auto_835125 ) ) ( not ( = ?auto_835115 ?auto_835126 ) ) ( not ( = ?auto_835115 ?auto_835127 ) ) ( not ( = ?auto_835115 ?auto_835128 ) ) ( not ( = ?auto_835115 ?auto_835129 ) ) ( not ( = ?auto_835115 ?auto_835130 ) ) ( not ( = ?auto_835115 ?auto_835131 ) ) ( not ( = ?auto_835115 ?auto_835132 ) ) ( not ( = ?auto_835116 ?auto_835117 ) ) ( not ( = ?auto_835116 ?auto_835118 ) ) ( not ( = ?auto_835116 ?auto_835119 ) ) ( not ( = ?auto_835116 ?auto_835120 ) ) ( not ( = ?auto_835116 ?auto_835121 ) ) ( not ( = ?auto_835116 ?auto_835122 ) ) ( not ( = ?auto_835116 ?auto_835123 ) ) ( not ( = ?auto_835116 ?auto_835124 ) ) ( not ( = ?auto_835116 ?auto_835125 ) ) ( not ( = ?auto_835116 ?auto_835126 ) ) ( not ( = ?auto_835116 ?auto_835127 ) ) ( not ( = ?auto_835116 ?auto_835128 ) ) ( not ( = ?auto_835116 ?auto_835129 ) ) ( not ( = ?auto_835116 ?auto_835130 ) ) ( not ( = ?auto_835116 ?auto_835131 ) ) ( not ( = ?auto_835116 ?auto_835132 ) ) ( not ( = ?auto_835117 ?auto_835118 ) ) ( not ( = ?auto_835117 ?auto_835119 ) ) ( not ( = ?auto_835117 ?auto_835120 ) ) ( not ( = ?auto_835117 ?auto_835121 ) ) ( not ( = ?auto_835117 ?auto_835122 ) ) ( not ( = ?auto_835117 ?auto_835123 ) ) ( not ( = ?auto_835117 ?auto_835124 ) ) ( not ( = ?auto_835117 ?auto_835125 ) ) ( not ( = ?auto_835117 ?auto_835126 ) ) ( not ( = ?auto_835117 ?auto_835127 ) ) ( not ( = ?auto_835117 ?auto_835128 ) ) ( not ( = ?auto_835117 ?auto_835129 ) ) ( not ( = ?auto_835117 ?auto_835130 ) ) ( not ( = ?auto_835117 ?auto_835131 ) ) ( not ( = ?auto_835117 ?auto_835132 ) ) ( not ( = ?auto_835118 ?auto_835119 ) ) ( not ( = ?auto_835118 ?auto_835120 ) ) ( not ( = ?auto_835118 ?auto_835121 ) ) ( not ( = ?auto_835118 ?auto_835122 ) ) ( not ( = ?auto_835118 ?auto_835123 ) ) ( not ( = ?auto_835118 ?auto_835124 ) ) ( not ( = ?auto_835118 ?auto_835125 ) ) ( not ( = ?auto_835118 ?auto_835126 ) ) ( not ( = ?auto_835118 ?auto_835127 ) ) ( not ( = ?auto_835118 ?auto_835128 ) ) ( not ( = ?auto_835118 ?auto_835129 ) ) ( not ( = ?auto_835118 ?auto_835130 ) ) ( not ( = ?auto_835118 ?auto_835131 ) ) ( not ( = ?auto_835118 ?auto_835132 ) ) ( not ( = ?auto_835119 ?auto_835120 ) ) ( not ( = ?auto_835119 ?auto_835121 ) ) ( not ( = ?auto_835119 ?auto_835122 ) ) ( not ( = ?auto_835119 ?auto_835123 ) ) ( not ( = ?auto_835119 ?auto_835124 ) ) ( not ( = ?auto_835119 ?auto_835125 ) ) ( not ( = ?auto_835119 ?auto_835126 ) ) ( not ( = ?auto_835119 ?auto_835127 ) ) ( not ( = ?auto_835119 ?auto_835128 ) ) ( not ( = ?auto_835119 ?auto_835129 ) ) ( not ( = ?auto_835119 ?auto_835130 ) ) ( not ( = ?auto_835119 ?auto_835131 ) ) ( not ( = ?auto_835119 ?auto_835132 ) ) ( not ( = ?auto_835120 ?auto_835121 ) ) ( not ( = ?auto_835120 ?auto_835122 ) ) ( not ( = ?auto_835120 ?auto_835123 ) ) ( not ( = ?auto_835120 ?auto_835124 ) ) ( not ( = ?auto_835120 ?auto_835125 ) ) ( not ( = ?auto_835120 ?auto_835126 ) ) ( not ( = ?auto_835120 ?auto_835127 ) ) ( not ( = ?auto_835120 ?auto_835128 ) ) ( not ( = ?auto_835120 ?auto_835129 ) ) ( not ( = ?auto_835120 ?auto_835130 ) ) ( not ( = ?auto_835120 ?auto_835131 ) ) ( not ( = ?auto_835120 ?auto_835132 ) ) ( not ( = ?auto_835121 ?auto_835122 ) ) ( not ( = ?auto_835121 ?auto_835123 ) ) ( not ( = ?auto_835121 ?auto_835124 ) ) ( not ( = ?auto_835121 ?auto_835125 ) ) ( not ( = ?auto_835121 ?auto_835126 ) ) ( not ( = ?auto_835121 ?auto_835127 ) ) ( not ( = ?auto_835121 ?auto_835128 ) ) ( not ( = ?auto_835121 ?auto_835129 ) ) ( not ( = ?auto_835121 ?auto_835130 ) ) ( not ( = ?auto_835121 ?auto_835131 ) ) ( not ( = ?auto_835121 ?auto_835132 ) ) ( not ( = ?auto_835122 ?auto_835123 ) ) ( not ( = ?auto_835122 ?auto_835124 ) ) ( not ( = ?auto_835122 ?auto_835125 ) ) ( not ( = ?auto_835122 ?auto_835126 ) ) ( not ( = ?auto_835122 ?auto_835127 ) ) ( not ( = ?auto_835122 ?auto_835128 ) ) ( not ( = ?auto_835122 ?auto_835129 ) ) ( not ( = ?auto_835122 ?auto_835130 ) ) ( not ( = ?auto_835122 ?auto_835131 ) ) ( not ( = ?auto_835122 ?auto_835132 ) ) ( not ( = ?auto_835123 ?auto_835124 ) ) ( not ( = ?auto_835123 ?auto_835125 ) ) ( not ( = ?auto_835123 ?auto_835126 ) ) ( not ( = ?auto_835123 ?auto_835127 ) ) ( not ( = ?auto_835123 ?auto_835128 ) ) ( not ( = ?auto_835123 ?auto_835129 ) ) ( not ( = ?auto_835123 ?auto_835130 ) ) ( not ( = ?auto_835123 ?auto_835131 ) ) ( not ( = ?auto_835123 ?auto_835132 ) ) ( not ( = ?auto_835124 ?auto_835125 ) ) ( not ( = ?auto_835124 ?auto_835126 ) ) ( not ( = ?auto_835124 ?auto_835127 ) ) ( not ( = ?auto_835124 ?auto_835128 ) ) ( not ( = ?auto_835124 ?auto_835129 ) ) ( not ( = ?auto_835124 ?auto_835130 ) ) ( not ( = ?auto_835124 ?auto_835131 ) ) ( not ( = ?auto_835124 ?auto_835132 ) ) ( not ( = ?auto_835125 ?auto_835126 ) ) ( not ( = ?auto_835125 ?auto_835127 ) ) ( not ( = ?auto_835125 ?auto_835128 ) ) ( not ( = ?auto_835125 ?auto_835129 ) ) ( not ( = ?auto_835125 ?auto_835130 ) ) ( not ( = ?auto_835125 ?auto_835131 ) ) ( not ( = ?auto_835125 ?auto_835132 ) ) ( not ( = ?auto_835126 ?auto_835127 ) ) ( not ( = ?auto_835126 ?auto_835128 ) ) ( not ( = ?auto_835126 ?auto_835129 ) ) ( not ( = ?auto_835126 ?auto_835130 ) ) ( not ( = ?auto_835126 ?auto_835131 ) ) ( not ( = ?auto_835126 ?auto_835132 ) ) ( not ( = ?auto_835127 ?auto_835128 ) ) ( not ( = ?auto_835127 ?auto_835129 ) ) ( not ( = ?auto_835127 ?auto_835130 ) ) ( not ( = ?auto_835127 ?auto_835131 ) ) ( not ( = ?auto_835127 ?auto_835132 ) ) ( not ( = ?auto_835128 ?auto_835129 ) ) ( not ( = ?auto_835128 ?auto_835130 ) ) ( not ( = ?auto_835128 ?auto_835131 ) ) ( not ( = ?auto_835128 ?auto_835132 ) ) ( not ( = ?auto_835129 ?auto_835130 ) ) ( not ( = ?auto_835129 ?auto_835131 ) ) ( not ( = ?auto_835129 ?auto_835132 ) ) ( not ( = ?auto_835130 ?auto_835131 ) ) ( not ( = ?auto_835130 ?auto_835132 ) ) ( not ( = ?auto_835131 ?auto_835132 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_835131 ?auto_835132 )
      ( !STACK ?auto_835131 ?auto_835130 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_835151 - BLOCK
      ?auto_835152 - BLOCK
      ?auto_835153 - BLOCK
      ?auto_835154 - BLOCK
      ?auto_835155 - BLOCK
      ?auto_835156 - BLOCK
      ?auto_835157 - BLOCK
      ?auto_835158 - BLOCK
      ?auto_835159 - BLOCK
      ?auto_835160 - BLOCK
      ?auto_835161 - BLOCK
      ?auto_835162 - BLOCK
      ?auto_835163 - BLOCK
      ?auto_835164 - BLOCK
      ?auto_835165 - BLOCK
      ?auto_835166 - BLOCK
      ?auto_835167 - BLOCK
      ?auto_835168 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_835167 ) ( ON-TABLE ?auto_835168 ) ( CLEAR ?auto_835168 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_835151 ) ( ON ?auto_835152 ?auto_835151 ) ( ON ?auto_835153 ?auto_835152 ) ( ON ?auto_835154 ?auto_835153 ) ( ON ?auto_835155 ?auto_835154 ) ( ON ?auto_835156 ?auto_835155 ) ( ON ?auto_835157 ?auto_835156 ) ( ON ?auto_835158 ?auto_835157 ) ( ON ?auto_835159 ?auto_835158 ) ( ON ?auto_835160 ?auto_835159 ) ( ON ?auto_835161 ?auto_835160 ) ( ON ?auto_835162 ?auto_835161 ) ( ON ?auto_835163 ?auto_835162 ) ( ON ?auto_835164 ?auto_835163 ) ( ON ?auto_835165 ?auto_835164 ) ( ON ?auto_835166 ?auto_835165 ) ( ON ?auto_835167 ?auto_835166 ) ( not ( = ?auto_835151 ?auto_835152 ) ) ( not ( = ?auto_835151 ?auto_835153 ) ) ( not ( = ?auto_835151 ?auto_835154 ) ) ( not ( = ?auto_835151 ?auto_835155 ) ) ( not ( = ?auto_835151 ?auto_835156 ) ) ( not ( = ?auto_835151 ?auto_835157 ) ) ( not ( = ?auto_835151 ?auto_835158 ) ) ( not ( = ?auto_835151 ?auto_835159 ) ) ( not ( = ?auto_835151 ?auto_835160 ) ) ( not ( = ?auto_835151 ?auto_835161 ) ) ( not ( = ?auto_835151 ?auto_835162 ) ) ( not ( = ?auto_835151 ?auto_835163 ) ) ( not ( = ?auto_835151 ?auto_835164 ) ) ( not ( = ?auto_835151 ?auto_835165 ) ) ( not ( = ?auto_835151 ?auto_835166 ) ) ( not ( = ?auto_835151 ?auto_835167 ) ) ( not ( = ?auto_835151 ?auto_835168 ) ) ( not ( = ?auto_835152 ?auto_835153 ) ) ( not ( = ?auto_835152 ?auto_835154 ) ) ( not ( = ?auto_835152 ?auto_835155 ) ) ( not ( = ?auto_835152 ?auto_835156 ) ) ( not ( = ?auto_835152 ?auto_835157 ) ) ( not ( = ?auto_835152 ?auto_835158 ) ) ( not ( = ?auto_835152 ?auto_835159 ) ) ( not ( = ?auto_835152 ?auto_835160 ) ) ( not ( = ?auto_835152 ?auto_835161 ) ) ( not ( = ?auto_835152 ?auto_835162 ) ) ( not ( = ?auto_835152 ?auto_835163 ) ) ( not ( = ?auto_835152 ?auto_835164 ) ) ( not ( = ?auto_835152 ?auto_835165 ) ) ( not ( = ?auto_835152 ?auto_835166 ) ) ( not ( = ?auto_835152 ?auto_835167 ) ) ( not ( = ?auto_835152 ?auto_835168 ) ) ( not ( = ?auto_835153 ?auto_835154 ) ) ( not ( = ?auto_835153 ?auto_835155 ) ) ( not ( = ?auto_835153 ?auto_835156 ) ) ( not ( = ?auto_835153 ?auto_835157 ) ) ( not ( = ?auto_835153 ?auto_835158 ) ) ( not ( = ?auto_835153 ?auto_835159 ) ) ( not ( = ?auto_835153 ?auto_835160 ) ) ( not ( = ?auto_835153 ?auto_835161 ) ) ( not ( = ?auto_835153 ?auto_835162 ) ) ( not ( = ?auto_835153 ?auto_835163 ) ) ( not ( = ?auto_835153 ?auto_835164 ) ) ( not ( = ?auto_835153 ?auto_835165 ) ) ( not ( = ?auto_835153 ?auto_835166 ) ) ( not ( = ?auto_835153 ?auto_835167 ) ) ( not ( = ?auto_835153 ?auto_835168 ) ) ( not ( = ?auto_835154 ?auto_835155 ) ) ( not ( = ?auto_835154 ?auto_835156 ) ) ( not ( = ?auto_835154 ?auto_835157 ) ) ( not ( = ?auto_835154 ?auto_835158 ) ) ( not ( = ?auto_835154 ?auto_835159 ) ) ( not ( = ?auto_835154 ?auto_835160 ) ) ( not ( = ?auto_835154 ?auto_835161 ) ) ( not ( = ?auto_835154 ?auto_835162 ) ) ( not ( = ?auto_835154 ?auto_835163 ) ) ( not ( = ?auto_835154 ?auto_835164 ) ) ( not ( = ?auto_835154 ?auto_835165 ) ) ( not ( = ?auto_835154 ?auto_835166 ) ) ( not ( = ?auto_835154 ?auto_835167 ) ) ( not ( = ?auto_835154 ?auto_835168 ) ) ( not ( = ?auto_835155 ?auto_835156 ) ) ( not ( = ?auto_835155 ?auto_835157 ) ) ( not ( = ?auto_835155 ?auto_835158 ) ) ( not ( = ?auto_835155 ?auto_835159 ) ) ( not ( = ?auto_835155 ?auto_835160 ) ) ( not ( = ?auto_835155 ?auto_835161 ) ) ( not ( = ?auto_835155 ?auto_835162 ) ) ( not ( = ?auto_835155 ?auto_835163 ) ) ( not ( = ?auto_835155 ?auto_835164 ) ) ( not ( = ?auto_835155 ?auto_835165 ) ) ( not ( = ?auto_835155 ?auto_835166 ) ) ( not ( = ?auto_835155 ?auto_835167 ) ) ( not ( = ?auto_835155 ?auto_835168 ) ) ( not ( = ?auto_835156 ?auto_835157 ) ) ( not ( = ?auto_835156 ?auto_835158 ) ) ( not ( = ?auto_835156 ?auto_835159 ) ) ( not ( = ?auto_835156 ?auto_835160 ) ) ( not ( = ?auto_835156 ?auto_835161 ) ) ( not ( = ?auto_835156 ?auto_835162 ) ) ( not ( = ?auto_835156 ?auto_835163 ) ) ( not ( = ?auto_835156 ?auto_835164 ) ) ( not ( = ?auto_835156 ?auto_835165 ) ) ( not ( = ?auto_835156 ?auto_835166 ) ) ( not ( = ?auto_835156 ?auto_835167 ) ) ( not ( = ?auto_835156 ?auto_835168 ) ) ( not ( = ?auto_835157 ?auto_835158 ) ) ( not ( = ?auto_835157 ?auto_835159 ) ) ( not ( = ?auto_835157 ?auto_835160 ) ) ( not ( = ?auto_835157 ?auto_835161 ) ) ( not ( = ?auto_835157 ?auto_835162 ) ) ( not ( = ?auto_835157 ?auto_835163 ) ) ( not ( = ?auto_835157 ?auto_835164 ) ) ( not ( = ?auto_835157 ?auto_835165 ) ) ( not ( = ?auto_835157 ?auto_835166 ) ) ( not ( = ?auto_835157 ?auto_835167 ) ) ( not ( = ?auto_835157 ?auto_835168 ) ) ( not ( = ?auto_835158 ?auto_835159 ) ) ( not ( = ?auto_835158 ?auto_835160 ) ) ( not ( = ?auto_835158 ?auto_835161 ) ) ( not ( = ?auto_835158 ?auto_835162 ) ) ( not ( = ?auto_835158 ?auto_835163 ) ) ( not ( = ?auto_835158 ?auto_835164 ) ) ( not ( = ?auto_835158 ?auto_835165 ) ) ( not ( = ?auto_835158 ?auto_835166 ) ) ( not ( = ?auto_835158 ?auto_835167 ) ) ( not ( = ?auto_835158 ?auto_835168 ) ) ( not ( = ?auto_835159 ?auto_835160 ) ) ( not ( = ?auto_835159 ?auto_835161 ) ) ( not ( = ?auto_835159 ?auto_835162 ) ) ( not ( = ?auto_835159 ?auto_835163 ) ) ( not ( = ?auto_835159 ?auto_835164 ) ) ( not ( = ?auto_835159 ?auto_835165 ) ) ( not ( = ?auto_835159 ?auto_835166 ) ) ( not ( = ?auto_835159 ?auto_835167 ) ) ( not ( = ?auto_835159 ?auto_835168 ) ) ( not ( = ?auto_835160 ?auto_835161 ) ) ( not ( = ?auto_835160 ?auto_835162 ) ) ( not ( = ?auto_835160 ?auto_835163 ) ) ( not ( = ?auto_835160 ?auto_835164 ) ) ( not ( = ?auto_835160 ?auto_835165 ) ) ( not ( = ?auto_835160 ?auto_835166 ) ) ( not ( = ?auto_835160 ?auto_835167 ) ) ( not ( = ?auto_835160 ?auto_835168 ) ) ( not ( = ?auto_835161 ?auto_835162 ) ) ( not ( = ?auto_835161 ?auto_835163 ) ) ( not ( = ?auto_835161 ?auto_835164 ) ) ( not ( = ?auto_835161 ?auto_835165 ) ) ( not ( = ?auto_835161 ?auto_835166 ) ) ( not ( = ?auto_835161 ?auto_835167 ) ) ( not ( = ?auto_835161 ?auto_835168 ) ) ( not ( = ?auto_835162 ?auto_835163 ) ) ( not ( = ?auto_835162 ?auto_835164 ) ) ( not ( = ?auto_835162 ?auto_835165 ) ) ( not ( = ?auto_835162 ?auto_835166 ) ) ( not ( = ?auto_835162 ?auto_835167 ) ) ( not ( = ?auto_835162 ?auto_835168 ) ) ( not ( = ?auto_835163 ?auto_835164 ) ) ( not ( = ?auto_835163 ?auto_835165 ) ) ( not ( = ?auto_835163 ?auto_835166 ) ) ( not ( = ?auto_835163 ?auto_835167 ) ) ( not ( = ?auto_835163 ?auto_835168 ) ) ( not ( = ?auto_835164 ?auto_835165 ) ) ( not ( = ?auto_835164 ?auto_835166 ) ) ( not ( = ?auto_835164 ?auto_835167 ) ) ( not ( = ?auto_835164 ?auto_835168 ) ) ( not ( = ?auto_835165 ?auto_835166 ) ) ( not ( = ?auto_835165 ?auto_835167 ) ) ( not ( = ?auto_835165 ?auto_835168 ) ) ( not ( = ?auto_835166 ?auto_835167 ) ) ( not ( = ?auto_835166 ?auto_835168 ) ) ( not ( = ?auto_835167 ?auto_835168 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_835168 )
      ( !STACK ?auto_835168 ?auto_835167 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_835187 - BLOCK
      ?auto_835188 - BLOCK
      ?auto_835189 - BLOCK
      ?auto_835190 - BLOCK
      ?auto_835191 - BLOCK
      ?auto_835192 - BLOCK
      ?auto_835193 - BLOCK
      ?auto_835194 - BLOCK
      ?auto_835195 - BLOCK
      ?auto_835196 - BLOCK
      ?auto_835197 - BLOCK
      ?auto_835198 - BLOCK
      ?auto_835199 - BLOCK
      ?auto_835200 - BLOCK
      ?auto_835201 - BLOCK
      ?auto_835202 - BLOCK
      ?auto_835203 - BLOCK
      ?auto_835204 - BLOCK
    )
    :vars
    (
      ?auto_835205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_835204 ?auto_835205 ) ( ON-TABLE ?auto_835187 ) ( ON ?auto_835188 ?auto_835187 ) ( ON ?auto_835189 ?auto_835188 ) ( ON ?auto_835190 ?auto_835189 ) ( ON ?auto_835191 ?auto_835190 ) ( ON ?auto_835192 ?auto_835191 ) ( ON ?auto_835193 ?auto_835192 ) ( ON ?auto_835194 ?auto_835193 ) ( ON ?auto_835195 ?auto_835194 ) ( ON ?auto_835196 ?auto_835195 ) ( ON ?auto_835197 ?auto_835196 ) ( ON ?auto_835198 ?auto_835197 ) ( ON ?auto_835199 ?auto_835198 ) ( ON ?auto_835200 ?auto_835199 ) ( ON ?auto_835201 ?auto_835200 ) ( ON ?auto_835202 ?auto_835201 ) ( not ( = ?auto_835187 ?auto_835188 ) ) ( not ( = ?auto_835187 ?auto_835189 ) ) ( not ( = ?auto_835187 ?auto_835190 ) ) ( not ( = ?auto_835187 ?auto_835191 ) ) ( not ( = ?auto_835187 ?auto_835192 ) ) ( not ( = ?auto_835187 ?auto_835193 ) ) ( not ( = ?auto_835187 ?auto_835194 ) ) ( not ( = ?auto_835187 ?auto_835195 ) ) ( not ( = ?auto_835187 ?auto_835196 ) ) ( not ( = ?auto_835187 ?auto_835197 ) ) ( not ( = ?auto_835187 ?auto_835198 ) ) ( not ( = ?auto_835187 ?auto_835199 ) ) ( not ( = ?auto_835187 ?auto_835200 ) ) ( not ( = ?auto_835187 ?auto_835201 ) ) ( not ( = ?auto_835187 ?auto_835202 ) ) ( not ( = ?auto_835187 ?auto_835203 ) ) ( not ( = ?auto_835187 ?auto_835204 ) ) ( not ( = ?auto_835187 ?auto_835205 ) ) ( not ( = ?auto_835188 ?auto_835189 ) ) ( not ( = ?auto_835188 ?auto_835190 ) ) ( not ( = ?auto_835188 ?auto_835191 ) ) ( not ( = ?auto_835188 ?auto_835192 ) ) ( not ( = ?auto_835188 ?auto_835193 ) ) ( not ( = ?auto_835188 ?auto_835194 ) ) ( not ( = ?auto_835188 ?auto_835195 ) ) ( not ( = ?auto_835188 ?auto_835196 ) ) ( not ( = ?auto_835188 ?auto_835197 ) ) ( not ( = ?auto_835188 ?auto_835198 ) ) ( not ( = ?auto_835188 ?auto_835199 ) ) ( not ( = ?auto_835188 ?auto_835200 ) ) ( not ( = ?auto_835188 ?auto_835201 ) ) ( not ( = ?auto_835188 ?auto_835202 ) ) ( not ( = ?auto_835188 ?auto_835203 ) ) ( not ( = ?auto_835188 ?auto_835204 ) ) ( not ( = ?auto_835188 ?auto_835205 ) ) ( not ( = ?auto_835189 ?auto_835190 ) ) ( not ( = ?auto_835189 ?auto_835191 ) ) ( not ( = ?auto_835189 ?auto_835192 ) ) ( not ( = ?auto_835189 ?auto_835193 ) ) ( not ( = ?auto_835189 ?auto_835194 ) ) ( not ( = ?auto_835189 ?auto_835195 ) ) ( not ( = ?auto_835189 ?auto_835196 ) ) ( not ( = ?auto_835189 ?auto_835197 ) ) ( not ( = ?auto_835189 ?auto_835198 ) ) ( not ( = ?auto_835189 ?auto_835199 ) ) ( not ( = ?auto_835189 ?auto_835200 ) ) ( not ( = ?auto_835189 ?auto_835201 ) ) ( not ( = ?auto_835189 ?auto_835202 ) ) ( not ( = ?auto_835189 ?auto_835203 ) ) ( not ( = ?auto_835189 ?auto_835204 ) ) ( not ( = ?auto_835189 ?auto_835205 ) ) ( not ( = ?auto_835190 ?auto_835191 ) ) ( not ( = ?auto_835190 ?auto_835192 ) ) ( not ( = ?auto_835190 ?auto_835193 ) ) ( not ( = ?auto_835190 ?auto_835194 ) ) ( not ( = ?auto_835190 ?auto_835195 ) ) ( not ( = ?auto_835190 ?auto_835196 ) ) ( not ( = ?auto_835190 ?auto_835197 ) ) ( not ( = ?auto_835190 ?auto_835198 ) ) ( not ( = ?auto_835190 ?auto_835199 ) ) ( not ( = ?auto_835190 ?auto_835200 ) ) ( not ( = ?auto_835190 ?auto_835201 ) ) ( not ( = ?auto_835190 ?auto_835202 ) ) ( not ( = ?auto_835190 ?auto_835203 ) ) ( not ( = ?auto_835190 ?auto_835204 ) ) ( not ( = ?auto_835190 ?auto_835205 ) ) ( not ( = ?auto_835191 ?auto_835192 ) ) ( not ( = ?auto_835191 ?auto_835193 ) ) ( not ( = ?auto_835191 ?auto_835194 ) ) ( not ( = ?auto_835191 ?auto_835195 ) ) ( not ( = ?auto_835191 ?auto_835196 ) ) ( not ( = ?auto_835191 ?auto_835197 ) ) ( not ( = ?auto_835191 ?auto_835198 ) ) ( not ( = ?auto_835191 ?auto_835199 ) ) ( not ( = ?auto_835191 ?auto_835200 ) ) ( not ( = ?auto_835191 ?auto_835201 ) ) ( not ( = ?auto_835191 ?auto_835202 ) ) ( not ( = ?auto_835191 ?auto_835203 ) ) ( not ( = ?auto_835191 ?auto_835204 ) ) ( not ( = ?auto_835191 ?auto_835205 ) ) ( not ( = ?auto_835192 ?auto_835193 ) ) ( not ( = ?auto_835192 ?auto_835194 ) ) ( not ( = ?auto_835192 ?auto_835195 ) ) ( not ( = ?auto_835192 ?auto_835196 ) ) ( not ( = ?auto_835192 ?auto_835197 ) ) ( not ( = ?auto_835192 ?auto_835198 ) ) ( not ( = ?auto_835192 ?auto_835199 ) ) ( not ( = ?auto_835192 ?auto_835200 ) ) ( not ( = ?auto_835192 ?auto_835201 ) ) ( not ( = ?auto_835192 ?auto_835202 ) ) ( not ( = ?auto_835192 ?auto_835203 ) ) ( not ( = ?auto_835192 ?auto_835204 ) ) ( not ( = ?auto_835192 ?auto_835205 ) ) ( not ( = ?auto_835193 ?auto_835194 ) ) ( not ( = ?auto_835193 ?auto_835195 ) ) ( not ( = ?auto_835193 ?auto_835196 ) ) ( not ( = ?auto_835193 ?auto_835197 ) ) ( not ( = ?auto_835193 ?auto_835198 ) ) ( not ( = ?auto_835193 ?auto_835199 ) ) ( not ( = ?auto_835193 ?auto_835200 ) ) ( not ( = ?auto_835193 ?auto_835201 ) ) ( not ( = ?auto_835193 ?auto_835202 ) ) ( not ( = ?auto_835193 ?auto_835203 ) ) ( not ( = ?auto_835193 ?auto_835204 ) ) ( not ( = ?auto_835193 ?auto_835205 ) ) ( not ( = ?auto_835194 ?auto_835195 ) ) ( not ( = ?auto_835194 ?auto_835196 ) ) ( not ( = ?auto_835194 ?auto_835197 ) ) ( not ( = ?auto_835194 ?auto_835198 ) ) ( not ( = ?auto_835194 ?auto_835199 ) ) ( not ( = ?auto_835194 ?auto_835200 ) ) ( not ( = ?auto_835194 ?auto_835201 ) ) ( not ( = ?auto_835194 ?auto_835202 ) ) ( not ( = ?auto_835194 ?auto_835203 ) ) ( not ( = ?auto_835194 ?auto_835204 ) ) ( not ( = ?auto_835194 ?auto_835205 ) ) ( not ( = ?auto_835195 ?auto_835196 ) ) ( not ( = ?auto_835195 ?auto_835197 ) ) ( not ( = ?auto_835195 ?auto_835198 ) ) ( not ( = ?auto_835195 ?auto_835199 ) ) ( not ( = ?auto_835195 ?auto_835200 ) ) ( not ( = ?auto_835195 ?auto_835201 ) ) ( not ( = ?auto_835195 ?auto_835202 ) ) ( not ( = ?auto_835195 ?auto_835203 ) ) ( not ( = ?auto_835195 ?auto_835204 ) ) ( not ( = ?auto_835195 ?auto_835205 ) ) ( not ( = ?auto_835196 ?auto_835197 ) ) ( not ( = ?auto_835196 ?auto_835198 ) ) ( not ( = ?auto_835196 ?auto_835199 ) ) ( not ( = ?auto_835196 ?auto_835200 ) ) ( not ( = ?auto_835196 ?auto_835201 ) ) ( not ( = ?auto_835196 ?auto_835202 ) ) ( not ( = ?auto_835196 ?auto_835203 ) ) ( not ( = ?auto_835196 ?auto_835204 ) ) ( not ( = ?auto_835196 ?auto_835205 ) ) ( not ( = ?auto_835197 ?auto_835198 ) ) ( not ( = ?auto_835197 ?auto_835199 ) ) ( not ( = ?auto_835197 ?auto_835200 ) ) ( not ( = ?auto_835197 ?auto_835201 ) ) ( not ( = ?auto_835197 ?auto_835202 ) ) ( not ( = ?auto_835197 ?auto_835203 ) ) ( not ( = ?auto_835197 ?auto_835204 ) ) ( not ( = ?auto_835197 ?auto_835205 ) ) ( not ( = ?auto_835198 ?auto_835199 ) ) ( not ( = ?auto_835198 ?auto_835200 ) ) ( not ( = ?auto_835198 ?auto_835201 ) ) ( not ( = ?auto_835198 ?auto_835202 ) ) ( not ( = ?auto_835198 ?auto_835203 ) ) ( not ( = ?auto_835198 ?auto_835204 ) ) ( not ( = ?auto_835198 ?auto_835205 ) ) ( not ( = ?auto_835199 ?auto_835200 ) ) ( not ( = ?auto_835199 ?auto_835201 ) ) ( not ( = ?auto_835199 ?auto_835202 ) ) ( not ( = ?auto_835199 ?auto_835203 ) ) ( not ( = ?auto_835199 ?auto_835204 ) ) ( not ( = ?auto_835199 ?auto_835205 ) ) ( not ( = ?auto_835200 ?auto_835201 ) ) ( not ( = ?auto_835200 ?auto_835202 ) ) ( not ( = ?auto_835200 ?auto_835203 ) ) ( not ( = ?auto_835200 ?auto_835204 ) ) ( not ( = ?auto_835200 ?auto_835205 ) ) ( not ( = ?auto_835201 ?auto_835202 ) ) ( not ( = ?auto_835201 ?auto_835203 ) ) ( not ( = ?auto_835201 ?auto_835204 ) ) ( not ( = ?auto_835201 ?auto_835205 ) ) ( not ( = ?auto_835202 ?auto_835203 ) ) ( not ( = ?auto_835202 ?auto_835204 ) ) ( not ( = ?auto_835202 ?auto_835205 ) ) ( not ( = ?auto_835203 ?auto_835204 ) ) ( not ( = ?auto_835203 ?auto_835205 ) ) ( not ( = ?auto_835204 ?auto_835205 ) ) ( CLEAR ?auto_835202 ) ( ON ?auto_835203 ?auto_835204 ) ( CLEAR ?auto_835203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_835187 ?auto_835188 ?auto_835189 ?auto_835190 ?auto_835191 ?auto_835192 ?auto_835193 ?auto_835194 ?auto_835195 ?auto_835196 ?auto_835197 ?auto_835198 ?auto_835199 ?auto_835200 ?auto_835201 ?auto_835202 ?auto_835203 )
      ( MAKE-18PILE ?auto_835187 ?auto_835188 ?auto_835189 ?auto_835190 ?auto_835191 ?auto_835192 ?auto_835193 ?auto_835194 ?auto_835195 ?auto_835196 ?auto_835197 ?auto_835198 ?auto_835199 ?auto_835200 ?auto_835201 ?auto_835202 ?auto_835203 ?auto_835204 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_835224 - BLOCK
      ?auto_835225 - BLOCK
      ?auto_835226 - BLOCK
      ?auto_835227 - BLOCK
      ?auto_835228 - BLOCK
      ?auto_835229 - BLOCK
      ?auto_835230 - BLOCK
      ?auto_835231 - BLOCK
      ?auto_835232 - BLOCK
      ?auto_835233 - BLOCK
      ?auto_835234 - BLOCK
      ?auto_835235 - BLOCK
      ?auto_835236 - BLOCK
      ?auto_835237 - BLOCK
      ?auto_835238 - BLOCK
      ?auto_835239 - BLOCK
      ?auto_835240 - BLOCK
      ?auto_835241 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_835241 ) ( ON-TABLE ?auto_835224 ) ( ON ?auto_835225 ?auto_835224 ) ( ON ?auto_835226 ?auto_835225 ) ( ON ?auto_835227 ?auto_835226 ) ( ON ?auto_835228 ?auto_835227 ) ( ON ?auto_835229 ?auto_835228 ) ( ON ?auto_835230 ?auto_835229 ) ( ON ?auto_835231 ?auto_835230 ) ( ON ?auto_835232 ?auto_835231 ) ( ON ?auto_835233 ?auto_835232 ) ( ON ?auto_835234 ?auto_835233 ) ( ON ?auto_835235 ?auto_835234 ) ( ON ?auto_835236 ?auto_835235 ) ( ON ?auto_835237 ?auto_835236 ) ( ON ?auto_835238 ?auto_835237 ) ( ON ?auto_835239 ?auto_835238 ) ( not ( = ?auto_835224 ?auto_835225 ) ) ( not ( = ?auto_835224 ?auto_835226 ) ) ( not ( = ?auto_835224 ?auto_835227 ) ) ( not ( = ?auto_835224 ?auto_835228 ) ) ( not ( = ?auto_835224 ?auto_835229 ) ) ( not ( = ?auto_835224 ?auto_835230 ) ) ( not ( = ?auto_835224 ?auto_835231 ) ) ( not ( = ?auto_835224 ?auto_835232 ) ) ( not ( = ?auto_835224 ?auto_835233 ) ) ( not ( = ?auto_835224 ?auto_835234 ) ) ( not ( = ?auto_835224 ?auto_835235 ) ) ( not ( = ?auto_835224 ?auto_835236 ) ) ( not ( = ?auto_835224 ?auto_835237 ) ) ( not ( = ?auto_835224 ?auto_835238 ) ) ( not ( = ?auto_835224 ?auto_835239 ) ) ( not ( = ?auto_835224 ?auto_835240 ) ) ( not ( = ?auto_835224 ?auto_835241 ) ) ( not ( = ?auto_835225 ?auto_835226 ) ) ( not ( = ?auto_835225 ?auto_835227 ) ) ( not ( = ?auto_835225 ?auto_835228 ) ) ( not ( = ?auto_835225 ?auto_835229 ) ) ( not ( = ?auto_835225 ?auto_835230 ) ) ( not ( = ?auto_835225 ?auto_835231 ) ) ( not ( = ?auto_835225 ?auto_835232 ) ) ( not ( = ?auto_835225 ?auto_835233 ) ) ( not ( = ?auto_835225 ?auto_835234 ) ) ( not ( = ?auto_835225 ?auto_835235 ) ) ( not ( = ?auto_835225 ?auto_835236 ) ) ( not ( = ?auto_835225 ?auto_835237 ) ) ( not ( = ?auto_835225 ?auto_835238 ) ) ( not ( = ?auto_835225 ?auto_835239 ) ) ( not ( = ?auto_835225 ?auto_835240 ) ) ( not ( = ?auto_835225 ?auto_835241 ) ) ( not ( = ?auto_835226 ?auto_835227 ) ) ( not ( = ?auto_835226 ?auto_835228 ) ) ( not ( = ?auto_835226 ?auto_835229 ) ) ( not ( = ?auto_835226 ?auto_835230 ) ) ( not ( = ?auto_835226 ?auto_835231 ) ) ( not ( = ?auto_835226 ?auto_835232 ) ) ( not ( = ?auto_835226 ?auto_835233 ) ) ( not ( = ?auto_835226 ?auto_835234 ) ) ( not ( = ?auto_835226 ?auto_835235 ) ) ( not ( = ?auto_835226 ?auto_835236 ) ) ( not ( = ?auto_835226 ?auto_835237 ) ) ( not ( = ?auto_835226 ?auto_835238 ) ) ( not ( = ?auto_835226 ?auto_835239 ) ) ( not ( = ?auto_835226 ?auto_835240 ) ) ( not ( = ?auto_835226 ?auto_835241 ) ) ( not ( = ?auto_835227 ?auto_835228 ) ) ( not ( = ?auto_835227 ?auto_835229 ) ) ( not ( = ?auto_835227 ?auto_835230 ) ) ( not ( = ?auto_835227 ?auto_835231 ) ) ( not ( = ?auto_835227 ?auto_835232 ) ) ( not ( = ?auto_835227 ?auto_835233 ) ) ( not ( = ?auto_835227 ?auto_835234 ) ) ( not ( = ?auto_835227 ?auto_835235 ) ) ( not ( = ?auto_835227 ?auto_835236 ) ) ( not ( = ?auto_835227 ?auto_835237 ) ) ( not ( = ?auto_835227 ?auto_835238 ) ) ( not ( = ?auto_835227 ?auto_835239 ) ) ( not ( = ?auto_835227 ?auto_835240 ) ) ( not ( = ?auto_835227 ?auto_835241 ) ) ( not ( = ?auto_835228 ?auto_835229 ) ) ( not ( = ?auto_835228 ?auto_835230 ) ) ( not ( = ?auto_835228 ?auto_835231 ) ) ( not ( = ?auto_835228 ?auto_835232 ) ) ( not ( = ?auto_835228 ?auto_835233 ) ) ( not ( = ?auto_835228 ?auto_835234 ) ) ( not ( = ?auto_835228 ?auto_835235 ) ) ( not ( = ?auto_835228 ?auto_835236 ) ) ( not ( = ?auto_835228 ?auto_835237 ) ) ( not ( = ?auto_835228 ?auto_835238 ) ) ( not ( = ?auto_835228 ?auto_835239 ) ) ( not ( = ?auto_835228 ?auto_835240 ) ) ( not ( = ?auto_835228 ?auto_835241 ) ) ( not ( = ?auto_835229 ?auto_835230 ) ) ( not ( = ?auto_835229 ?auto_835231 ) ) ( not ( = ?auto_835229 ?auto_835232 ) ) ( not ( = ?auto_835229 ?auto_835233 ) ) ( not ( = ?auto_835229 ?auto_835234 ) ) ( not ( = ?auto_835229 ?auto_835235 ) ) ( not ( = ?auto_835229 ?auto_835236 ) ) ( not ( = ?auto_835229 ?auto_835237 ) ) ( not ( = ?auto_835229 ?auto_835238 ) ) ( not ( = ?auto_835229 ?auto_835239 ) ) ( not ( = ?auto_835229 ?auto_835240 ) ) ( not ( = ?auto_835229 ?auto_835241 ) ) ( not ( = ?auto_835230 ?auto_835231 ) ) ( not ( = ?auto_835230 ?auto_835232 ) ) ( not ( = ?auto_835230 ?auto_835233 ) ) ( not ( = ?auto_835230 ?auto_835234 ) ) ( not ( = ?auto_835230 ?auto_835235 ) ) ( not ( = ?auto_835230 ?auto_835236 ) ) ( not ( = ?auto_835230 ?auto_835237 ) ) ( not ( = ?auto_835230 ?auto_835238 ) ) ( not ( = ?auto_835230 ?auto_835239 ) ) ( not ( = ?auto_835230 ?auto_835240 ) ) ( not ( = ?auto_835230 ?auto_835241 ) ) ( not ( = ?auto_835231 ?auto_835232 ) ) ( not ( = ?auto_835231 ?auto_835233 ) ) ( not ( = ?auto_835231 ?auto_835234 ) ) ( not ( = ?auto_835231 ?auto_835235 ) ) ( not ( = ?auto_835231 ?auto_835236 ) ) ( not ( = ?auto_835231 ?auto_835237 ) ) ( not ( = ?auto_835231 ?auto_835238 ) ) ( not ( = ?auto_835231 ?auto_835239 ) ) ( not ( = ?auto_835231 ?auto_835240 ) ) ( not ( = ?auto_835231 ?auto_835241 ) ) ( not ( = ?auto_835232 ?auto_835233 ) ) ( not ( = ?auto_835232 ?auto_835234 ) ) ( not ( = ?auto_835232 ?auto_835235 ) ) ( not ( = ?auto_835232 ?auto_835236 ) ) ( not ( = ?auto_835232 ?auto_835237 ) ) ( not ( = ?auto_835232 ?auto_835238 ) ) ( not ( = ?auto_835232 ?auto_835239 ) ) ( not ( = ?auto_835232 ?auto_835240 ) ) ( not ( = ?auto_835232 ?auto_835241 ) ) ( not ( = ?auto_835233 ?auto_835234 ) ) ( not ( = ?auto_835233 ?auto_835235 ) ) ( not ( = ?auto_835233 ?auto_835236 ) ) ( not ( = ?auto_835233 ?auto_835237 ) ) ( not ( = ?auto_835233 ?auto_835238 ) ) ( not ( = ?auto_835233 ?auto_835239 ) ) ( not ( = ?auto_835233 ?auto_835240 ) ) ( not ( = ?auto_835233 ?auto_835241 ) ) ( not ( = ?auto_835234 ?auto_835235 ) ) ( not ( = ?auto_835234 ?auto_835236 ) ) ( not ( = ?auto_835234 ?auto_835237 ) ) ( not ( = ?auto_835234 ?auto_835238 ) ) ( not ( = ?auto_835234 ?auto_835239 ) ) ( not ( = ?auto_835234 ?auto_835240 ) ) ( not ( = ?auto_835234 ?auto_835241 ) ) ( not ( = ?auto_835235 ?auto_835236 ) ) ( not ( = ?auto_835235 ?auto_835237 ) ) ( not ( = ?auto_835235 ?auto_835238 ) ) ( not ( = ?auto_835235 ?auto_835239 ) ) ( not ( = ?auto_835235 ?auto_835240 ) ) ( not ( = ?auto_835235 ?auto_835241 ) ) ( not ( = ?auto_835236 ?auto_835237 ) ) ( not ( = ?auto_835236 ?auto_835238 ) ) ( not ( = ?auto_835236 ?auto_835239 ) ) ( not ( = ?auto_835236 ?auto_835240 ) ) ( not ( = ?auto_835236 ?auto_835241 ) ) ( not ( = ?auto_835237 ?auto_835238 ) ) ( not ( = ?auto_835237 ?auto_835239 ) ) ( not ( = ?auto_835237 ?auto_835240 ) ) ( not ( = ?auto_835237 ?auto_835241 ) ) ( not ( = ?auto_835238 ?auto_835239 ) ) ( not ( = ?auto_835238 ?auto_835240 ) ) ( not ( = ?auto_835238 ?auto_835241 ) ) ( not ( = ?auto_835239 ?auto_835240 ) ) ( not ( = ?auto_835239 ?auto_835241 ) ) ( not ( = ?auto_835240 ?auto_835241 ) ) ( CLEAR ?auto_835239 ) ( ON ?auto_835240 ?auto_835241 ) ( CLEAR ?auto_835240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_835224 ?auto_835225 ?auto_835226 ?auto_835227 ?auto_835228 ?auto_835229 ?auto_835230 ?auto_835231 ?auto_835232 ?auto_835233 ?auto_835234 ?auto_835235 ?auto_835236 ?auto_835237 ?auto_835238 ?auto_835239 ?auto_835240 )
      ( MAKE-18PILE ?auto_835224 ?auto_835225 ?auto_835226 ?auto_835227 ?auto_835228 ?auto_835229 ?auto_835230 ?auto_835231 ?auto_835232 ?auto_835233 ?auto_835234 ?auto_835235 ?auto_835236 ?auto_835237 ?auto_835238 ?auto_835239 ?auto_835240 ?auto_835241 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_835260 - BLOCK
      ?auto_835261 - BLOCK
      ?auto_835262 - BLOCK
      ?auto_835263 - BLOCK
      ?auto_835264 - BLOCK
      ?auto_835265 - BLOCK
      ?auto_835266 - BLOCK
      ?auto_835267 - BLOCK
      ?auto_835268 - BLOCK
      ?auto_835269 - BLOCK
      ?auto_835270 - BLOCK
      ?auto_835271 - BLOCK
      ?auto_835272 - BLOCK
      ?auto_835273 - BLOCK
      ?auto_835274 - BLOCK
      ?auto_835275 - BLOCK
      ?auto_835276 - BLOCK
      ?auto_835277 - BLOCK
    )
    :vars
    (
      ?auto_835278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_835277 ?auto_835278 ) ( ON-TABLE ?auto_835260 ) ( ON ?auto_835261 ?auto_835260 ) ( ON ?auto_835262 ?auto_835261 ) ( ON ?auto_835263 ?auto_835262 ) ( ON ?auto_835264 ?auto_835263 ) ( ON ?auto_835265 ?auto_835264 ) ( ON ?auto_835266 ?auto_835265 ) ( ON ?auto_835267 ?auto_835266 ) ( ON ?auto_835268 ?auto_835267 ) ( ON ?auto_835269 ?auto_835268 ) ( ON ?auto_835270 ?auto_835269 ) ( ON ?auto_835271 ?auto_835270 ) ( ON ?auto_835272 ?auto_835271 ) ( ON ?auto_835273 ?auto_835272 ) ( ON ?auto_835274 ?auto_835273 ) ( not ( = ?auto_835260 ?auto_835261 ) ) ( not ( = ?auto_835260 ?auto_835262 ) ) ( not ( = ?auto_835260 ?auto_835263 ) ) ( not ( = ?auto_835260 ?auto_835264 ) ) ( not ( = ?auto_835260 ?auto_835265 ) ) ( not ( = ?auto_835260 ?auto_835266 ) ) ( not ( = ?auto_835260 ?auto_835267 ) ) ( not ( = ?auto_835260 ?auto_835268 ) ) ( not ( = ?auto_835260 ?auto_835269 ) ) ( not ( = ?auto_835260 ?auto_835270 ) ) ( not ( = ?auto_835260 ?auto_835271 ) ) ( not ( = ?auto_835260 ?auto_835272 ) ) ( not ( = ?auto_835260 ?auto_835273 ) ) ( not ( = ?auto_835260 ?auto_835274 ) ) ( not ( = ?auto_835260 ?auto_835275 ) ) ( not ( = ?auto_835260 ?auto_835276 ) ) ( not ( = ?auto_835260 ?auto_835277 ) ) ( not ( = ?auto_835260 ?auto_835278 ) ) ( not ( = ?auto_835261 ?auto_835262 ) ) ( not ( = ?auto_835261 ?auto_835263 ) ) ( not ( = ?auto_835261 ?auto_835264 ) ) ( not ( = ?auto_835261 ?auto_835265 ) ) ( not ( = ?auto_835261 ?auto_835266 ) ) ( not ( = ?auto_835261 ?auto_835267 ) ) ( not ( = ?auto_835261 ?auto_835268 ) ) ( not ( = ?auto_835261 ?auto_835269 ) ) ( not ( = ?auto_835261 ?auto_835270 ) ) ( not ( = ?auto_835261 ?auto_835271 ) ) ( not ( = ?auto_835261 ?auto_835272 ) ) ( not ( = ?auto_835261 ?auto_835273 ) ) ( not ( = ?auto_835261 ?auto_835274 ) ) ( not ( = ?auto_835261 ?auto_835275 ) ) ( not ( = ?auto_835261 ?auto_835276 ) ) ( not ( = ?auto_835261 ?auto_835277 ) ) ( not ( = ?auto_835261 ?auto_835278 ) ) ( not ( = ?auto_835262 ?auto_835263 ) ) ( not ( = ?auto_835262 ?auto_835264 ) ) ( not ( = ?auto_835262 ?auto_835265 ) ) ( not ( = ?auto_835262 ?auto_835266 ) ) ( not ( = ?auto_835262 ?auto_835267 ) ) ( not ( = ?auto_835262 ?auto_835268 ) ) ( not ( = ?auto_835262 ?auto_835269 ) ) ( not ( = ?auto_835262 ?auto_835270 ) ) ( not ( = ?auto_835262 ?auto_835271 ) ) ( not ( = ?auto_835262 ?auto_835272 ) ) ( not ( = ?auto_835262 ?auto_835273 ) ) ( not ( = ?auto_835262 ?auto_835274 ) ) ( not ( = ?auto_835262 ?auto_835275 ) ) ( not ( = ?auto_835262 ?auto_835276 ) ) ( not ( = ?auto_835262 ?auto_835277 ) ) ( not ( = ?auto_835262 ?auto_835278 ) ) ( not ( = ?auto_835263 ?auto_835264 ) ) ( not ( = ?auto_835263 ?auto_835265 ) ) ( not ( = ?auto_835263 ?auto_835266 ) ) ( not ( = ?auto_835263 ?auto_835267 ) ) ( not ( = ?auto_835263 ?auto_835268 ) ) ( not ( = ?auto_835263 ?auto_835269 ) ) ( not ( = ?auto_835263 ?auto_835270 ) ) ( not ( = ?auto_835263 ?auto_835271 ) ) ( not ( = ?auto_835263 ?auto_835272 ) ) ( not ( = ?auto_835263 ?auto_835273 ) ) ( not ( = ?auto_835263 ?auto_835274 ) ) ( not ( = ?auto_835263 ?auto_835275 ) ) ( not ( = ?auto_835263 ?auto_835276 ) ) ( not ( = ?auto_835263 ?auto_835277 ) ) ( not ( = ?auto_835263 ?auto_835278 ) ) ( not ( = ?auto_835264 ?auto_835265 ) ) ( not ( = ?auto_835264 ?auto_835266 ) ) ( not ( = ?auto_835264 ?auto_835267 ) ) ( not ( = ?auto_835264 ?auto_835268 ) ) ( not ( = ?auto_835264 ?auto_835269 ) ) ( not ( = ?auto_835264 ?auto_835270 ) ) ( not ( = ?auto_835264 ?auto_835271 ) ) ( not ( = ?auto_835264 ?auto_835272 ) ) ( not ( = ?auto_835264 ?auto_835273 ) ) ( not ( = ?auto_835264 ?auto_835274 ) ) ( not ( = ?auto_835264 ?auto_835275 ) ) ( not ( = ?auto_835264 ?auto_835276 ) ) ( not ( = ?auto_835264 ?auto_835277 ) ) ( not ( = ?auto_835264 ?auto_835278 ) ) ( not ( = ?auto_835265 ?auto_835266 ) ) ( not ( = ?auto_835265 ?auto_835267 ) ) ( not ( = ?auto_835265 ?auto_835268 ) ) ( not ( = ?auto_835265 ?auto_835269 ) ) ( not ( = ?auto_835265 ?auto_835270 ) ) ( not ( = ?auto_835265 ?auto_835271 ) ) ( not ( = ?auto_835265 ?auto_835272 ) ) ( not ( = ?auto_835265 ?auto_835273 ) ) ( not ( = ?auto_835265 ?auto_835274 ) ) ( not ( = ?auto_835265 ?auto_835275 ) ) ( not ( = ?auto_835265 ?auto_835276 ) ) ( not ( = ?auto_835265 ?auto_835277 ) ) ( not ( = ?auto_835265 ?auto_835278 ) ) ( not ( = ?auto_835266 ?auto_835267 ) ) ( not ( = ?auto_835266 ?auto_835268 ) ) ( not ( = ?auto_835266 ?auto_835269 ) ) ( not ( = ?auto_835266 ?auto_835270 ) ) ( not ( = ?auto_835266 ?auto_835271 ) ) ( not ( = ?auto_835266 ?auto_835272 ) ) ( not ( = ?auto_835266 ?auto_835273 ) ) ( not ( = ?auto_835266 ?auto_835274 ) ) ( not ( = ?auto_835266 ?auto_835275 ) ) ( not ( = ?auto_835266 ?auto_835276 ) ) ( not ( = ?auto_835266 ?auto_835277 ) ) ( not ( = ?auto_835266 ?auto_835278 ) ) ( not ( = ?auto_835267 ?auto_835268 ) ) ( not ( = ?auto_835267 ?auto_835269 ) ) ( not ( = ?auto_835267 ?auto_835270 ) ) ( not ( = ?auto_835267 ?auto_835271 ) ) ( not ( = ?auto_835267 ?auto_835272 ) ) ( not ( = ?auto_835267 ?auto_835273 ) ) ( not ( = ?auto_835267 ?auto_835274 ) ) ( not ( = ?auto_835267 ?auto_835275 ) ) ( not ( = ?auto_835267 ?auto_835276 ) ) ( not ( = ?auto_835267 ?auto_835277 ) ) ( not ( = ?auto_835267 ?auto_835278 ) ) ( not ( = ?auto_835268 ?auto_835269 ) ) ( not ( = ?auto_835268 ?auto_835270 ) ) ( not ( = ?auto_835268 ?auto_835271 ) ) ( not ( = ?auto_835268 ?auto_835272 ) ) ( not ( = ?auto_835268 ?auto_835273 ) ) ( not ( = ?auto_835268 ?auto_835274 ) ) ( not ( = ?auto_835268 ?auto_835275 ) ) ( not ( = ?auto_835268 ?auto_835276 ) ) ( not ( = ?auto_835268 ?auto_835277 ) ) ( not ( = ?auto_835268 ?auto_835278 ) ) ( not ( = ?auto_835269 ?auto_835270 ) ) ( not ( = ?auto_835269 ?auto_835271 ) ) ( not ( = ?auto_835269 ?auto_835272 ) ) ( not ( = ?auto_835269 ?auto_835273 ) ) ( not ( = ?auto_835269 ?auto_835274 ) ) ( not ( = ?auto_835269 ?auto_835275 ) ) ( not ( = ?auto_835269 ?auto_835276 ) ) ( not ( = ?auto_835269 ?auto_835277 ) ) ( not ( = ?auto_835269 ?auto_835278 ) ) ( not ( = ?auto_835270 ?auto_835271 ) ) ( not ( = ?auto_835270 ?auto_835272 ) ) ( not ( = ?auto_835270 ?auto_835273 ) ) ( not ( = ?auto_835270 ?auto_835274 ) ) ( not ( = ?auto_835270 ?auto_835275 ) ) ( not ( = ?auto_835270 ?auto_835276 ) ) ( not ( = ?auto_835270 ?auto_835277 ) ) ( not ( = ?auto_835270 ?auto_835278 ) ) ( not ( = ?auto_835271 ?auto_835272 ) ) ( not ( = ?auto_835271 ?auto_835273 ) ) ( not ( = ?auto_835271 ?auto_835274 ) ) ( not ( = ?auto_835271 ?auto_835275 ) ) ( not ( = ?auto_835271 ?auto_835276 ) ) ( not ( = ?auto_835271 ?auto_835277 ) ) ( not ( = ?auto_835271 ?auto_835278 ) ) ( not ( = ?auto_835272 ?auto_835273 ) ) ( not ( = ?auto_835272 ?auto_835274 ) ) ( not ( = ?auto_835272 ?auto_835275 ) ) ( not ( = ?auto_835272 ?auto_835276 ) ) ( not ( = ?auto_835272 ?auto_835277 ) ) ( not ( = ?auto_835272 ?auto_835278 ) ) ( not ( = ?auto_835273 ?auto_835274 ) ) ( not ( = ?auto_835273 ?auto_835275 ) ) ( not ( = ?auto_835273 ?auto_835276 ) ) ( not ( = ?auto_835273 ?auto_835277 ) ) ( not ( = ?auto_835273 ?auto_835278 ) ) ( not ( = ?auto_835274 ?auto_835275 ) ) ( not ( = ?auto_835274 ?auto_835276 ) ) ( not ( = ?auto_835274 ?auto_835277 ) ) ( not ( = ?auto_835274 ?auto_835278 ) ) ( not ( = ?auto_835275 ?auto_835276 ) ) ( not ( = ?auto_835275 ?auto_835277 ) ) ( not ( = ?auto_835275 ?auto_835278 ) ) ( not ( = ?auto_835276 ?auto_835277 ) ) ( not ( = ?auto_835276 ?auto_835278 ) ) ( not ( = ?auto_835277 ?auto_835278 ) ) ( ON ?auto_835276 ?auto_835277 ) ( CLEAR ?auto_835274 ) ( ON ?auto_835275 ?auto_835276 ) ( CLEAR ?auto_835275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_835260 ?auto_835261 ?auto_835262 ?auto_835263 ?auto_835264 ?auto_835265 ?auto_835266 ?auto_835267 ?auto_835268 ?auto_835269 ?auto_835270 ?auto_835271 ?auto_835272 ?auto_835273 ?auto_835274 ?auto_835275 )
      ( MAKE-18PILE ?auto_835260 ?auto_835261 ?auto_835262 ?auto_835263 ?auto_835264 ?auto_835265 ?auto_835266 ?auto_835267 ?auto_835268 ?auto_835269 ?auto_835270 ?auto_835271 ?auto_835272 ?auto_835273 ?auto_835274 ?auto_835275 ?auto_835276 ?auto_835277 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_835297 - BLOCK
      ?auto_835298 - BLOCK
      ?auto_835299 - BLOCK
      ?auto_835300 - BLOCK
      ?auto_835301 - BLOCK
      ?auto_835302 - BLOCK
      ?auto_835303 - BLOCK
      ?auto_835304 - BLOCK
      ?auto_835305 - BLOCK
      ?auto_835306 - BLOCK
      ?auto_835307 - BLOCK
      ?auto_835308 - BLOCK
      ?auto_835309 - BLOCK
      ?auto_835310 - BLOCK
      ?auto_835311 - BLOCK
      ?auto_835312 - BLOCK
      ?auto_835313 - BLOCK
      ?auto_835314 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_835314 ) ( ON-TABLE ?auto_835297 ) ( ON ?auto_835298 ?auto_835297 ) ( ON ?auto_835299 ?auto_835298 ) ( ON ?auto_835300 ?auto_835299 ) ( ON ?auto_835301 ?auto_835300 ) ( ON ?auto_835302 ?auto_835301 ) ( ON ?auto_835303 ?auto_835302 ) ( ON ?auto_835304 ?auto_835303 ) ( ON ?auto_835305 ?auto_835304 ) ( ON ?auto_835306 ?auto_835305 ) ( ON ?auto_835307 ?auto_835306 ) ( ON ?auto_835308 ?auto_835307 ) ( ON ?auto_835309 ?auto_835308 ) ( ON ?auto_835310 ?auto_835309 ) ( ON ?auto_835311 ?auto_835310 ) ( not ( = ?auto_835297 ?auto_835298 ) ) ( not ( = ?auto_835297 ?auto_835299 ) ) ( not ( = ?auto_835297 ?auto_835300 ) ) ( not ( = ?auto_835297 ?auto_835301 ) ) ( not ( = ?auto_835297 ?auto_835302 ) ) ( not ( = ?auto_835297 ?auto_835303 ) ) ( not ( = ?auto_835297 ?auto_835304 ) ) ( not ( = ?auto_835297 ?auto_835305 ) ) ( not ( = ?auto_835297 ?auto_835306 ) ) ( not ( = ?auto_835297 ?auto_835307 ) ) ( not ( = ?auto_835297 ?auto_835308 ) ) ( not ( = ?auto_835297 ?auto_835309 ) ) ( not ( = ?auto_835297 ?auto_835310 ) ) ( not ( = ?auto_835297 ?auto_835311 ) ) ( not ( = ?auto_835297 ?auto_835312 ) ) ( not ( = ?auto_835297 ?auto_835313 ) ) ( not ( = ?auto_835297 ?auto_835314 ) ) ( not ( = ?auto_835298 ?auto_835299 ) ) ( not ( = ?auto_835298 ?auto_835300 ) ) ( not ( = ?auto_835298 ?auto_835301 ) ) ( not ( = ?auto_835298 ?auto_835302 ) ) ( not ( = ?auto_835298 ?auto_835303 ) ) ( not ( = ?auto_835298 ?auto_835304 ) ) ( not ( = ?auto_835298 ?auto_835305 ) ) ( not ( = ?auto_835298 ?auto_835306 ) ) ( not ( = ?auto_835298 ?auto_835307 ) ) ( not ( = ?auto_835298 ?auto_835308 ) ) ( not ( = ?auto_835298 ?auto_835309 ) ) ( not ( = ?auto_835298 ?auto_835310 ) ) ( not ( = ?auto_835298 ?auto_835311 ) ) ( not ( = ?auto_835298 ?auto_835312 ) ) ( not ( = ?auto_835298 ?auto_835313 ) ) ( not ( = ?auto_835298 ?auto_835314 ) ) ( not ( = ?auto_835299 ?auto_835300 ) ) ( not ( = ?auto_835299 ?auto_835301 ) ) ( not ( = ?auto_835299 ?auto_835302 ) ) ( not ( = ?auto_835299 ?auto_835303 ) ) ( not ( = ?auto_835299 ?auto_835304 ) ) ( not ( = ?auto_835299 ?auto_835305 ) ) ( not ( = ?auto_835299 ?auto_835306 ) ) ( not ( = ?auto_835299 ?auto_835307 ) ) ( not ( = ?auto_835299 ?auto_835308 ) ) ( not ( = ?auto_835299 ?auto_835309 ) ) ( not ( = ?auto_835299 ?auto_835310 ) ) ( not ( = ?auto_835299 ?auto_835311 ) ) ( not ( = ?auto_835299 ?auto_835312 ) ) ( not ( = ?auto_835299 ?auto_835313 ) ) ( not ( = ?auto_835299 ?auto_835314 ) ) ( not ( = ?auto_835300 ?auto_835301 ) ) ( not ( = ?auto_835300 ?auto_835302 ) ) ( not ( = ?auto_835300 ?auto_835303 ) ) ( not ( = ?auto_835300 ?auto_835304 ) ) ( not ( = ?auto_835300 ?auto_835305 ) ) ( not ( = ?auto_835300 ?auto_835306 ) ) ( not ( = ?auto_835300 ?auto_835307 ) ) ( not ( = ?auto_835300 ?auto_835308 ) ) ( not ( = ?auto_835300 ?auto_835309 ) ) ( not ( = ?auto_835300 ?auto_835310 ) ) ( not ( = ?auto_835300 ?auto_835311 ) ) ( not ( = ?auto_835300 ?auto_835312 ) ) ( not ( = ?auto_835300 ?auto_835313 ) ) ( not ( = ?auto_835300 ?auto_835314 ) ) ( not ( = ?auto_835301 ?auto_835302 ) ) ( not ( = ?auto_835301 ?auto_835303 ) ) ( not ( = ?auto_835301 ?auto_835304 ) ) ( not ( = ?auto_835301 ?auto_835305 ) ) ( not ( = ?auto_835301 ?auto_835306 ) ) ( not ( = ?auto_835301 ?auto_835307 ) ) ( not ( = ?auto_835301 ?auto_835308 ) ) ( not ( = ?auto_835301 ?auto_835309 ) ) ( not ( = ?auto_835301 ?auto_835310 ) ) ( not ( = ?auto_835301 ?auto_835311 ) ) ( not ( = ?auto_835301 ?auto_835312 ) ) ( not ( = ?auto_835301 ?auto_835313 ) ) ( not ( = ?auto_835301 ?auto_835314 ) ) ( not ( = ?auto_835302 ?auto_835303 ) ) ( not ( = ?auto_835302 ?auto_835304 ) ) ( not ( = ?auto_835302 ?auto_835305 ) ) ( not ( = ?auto_835302 ?auto_835306 ) ) ( not ( = ?auto_835302 ?auto_835307 ) ) ( not ( = ?auto_835302 ?auto_835308 ) ) ( not ( = ?auto_835302 ?auto_835309 ) ) ( not ( = ?auto_835302 ?auto_835310 ) ) ( not ( = ?auto_835302 ?auto_835311 ) ) ( not ( = ?auto_835302 ?auto_835312 ) ) ( not ( = ?auto_835302 ?auto_835313 ) ) ( not ( = ?auto_835302 ?auto_835314 ) ) ( not ( = ?auto_835303 ?auto_835304 ) ) ( not ( = ?auto_835303 ?auto_835305 ) ) ( not ( = ?auto_835303 ?auto_835306 ) ) ( not ( = ?auto_835303 ?auto_835307 ) ) ( not ( = ?auto_835303 ?auto_835308 ) ) ( not ( = ?auto_835303 ?auto_835309 ) ) ( not ( = ?auto_835303 ?auto_835310 ) ) ( not ( = ?auto_835303 ?auto_835311 ) ) ( not ( = ?auto_835303 ?auto_835312 ) ) ( not ( = ?auto_835303 ?auto_835313 ) ) ( not ( = ?auto_835303 ?auto_835314 ) ) ( not ( = ?auto_835304 ?auto_835305 ) ) ( not ( = ?auto_835304 ?auto_835306 ) ) ( not ( = ?auto_835304 ?auto_835307 ) ) ( not ( = ?auto_835304 ?auto_835308 ) ) ( not ( = ?auto_835304 ?auto_835309 ) ) ( not ( = ?auto_835304 ?auto_835310 ) ) ( not ( = ?auto_835304 ?auto_835311 ) ) ( not ( = ?auto_835304 ?auto_835312 ) ) ( not ( = ?auto_835304 ?auto_835313 ) ) ( not ( = ?auto_835304 ?auto_835314 ) ) ( not ( = ?auto_835305 ?auto_835306 ) ) ( not ( = ?auto_835305 ?auto_835307 ) ) ( not ( = ?auto_835305 ?auto_835308 ) ) ( not ( = ?auto_835305 ?auto_835309 ) ) ( not ( = ?auto_835305 ?auto_835310 ) ) ( not ( = ?auto_835305 ?auto_835311 ) ) ( not ( = ?auto_835305 ?auto_835312 ) ) ( not ( = ?auto_835305 ?auto_835313 ) ) ( not ( = ?auto_835305 ?auto_835314 ) ) ( not ( = ?auto_835306 ?auto_835307 ) ) ( not ( = ?auto_835306 ?auto_835308 ) ) ( not ( = ?auto_835306 ?auto_835309 ) ) ( not ( = ?auto_835306 ?auto_835310 ) ) ( not ( = ?auto_835306 ?auto_835311 ) ) ( not ( = ?auto_835306 ?auto_835312 ) ) ( not ( = ?auto_835306 ?auto_835313 ) ) ( not ( = ?auto_835306 ?auto_835314 ) ) ( not ( = ?auto_835307 ?auto_835308 ) ) ( not ( = ?auto_835307 ?auto_835309 ) ) ( not ( = ?auto_835307 ?auto_835310 ) ) ( not ( = ?auto_835307 ?auto_835311 ) ) ( not ( = ?auto_835307 ?auto_835312 ) ) ( not ( = ?auto_835307 ?auto_835313 ) ) ( not ( = ?auto_835307 ?auto_835314 ) ) ( not ( = ?auto_835308 ?auto_835309 ) ) ( not ( = ?auto_835308 ?auto_835310 ) ) ( not ( = ?auto_835308 ?auto_835311 ) ) ( not ( = ?auto_835308 ?auto_835312 ) ) ( not ( = ?auto_835308 ?auto_835313 ) ) ( not ( = ?auto_835308 ?auto_835314 ) ) ( not ( = ?auto_835309 ?auto_835310 ) ) ( not ( = ?auto_835309 ?auto_835311 ) ) ( not ( = ?auto_835309 ?auto_835312 ) ) ( not ( = ?auto_835309 ?auto_835313 ) ) ( not ( = ?auto_835309 ?auto_835314 ) ) ( not ( = ?auto_835310 ?auto_835311 ) ) ( not ( = ?auto_835310 ?auto_835312 ) ) ( not ( = ?auto_835310 ?auto_835313 ) ) ( not ( = ?auto_835310 ?auto_835314 ) ) ( not ( = ?auto_835311 ?auto_835312 ) ) ( not ( = ?auto_835311 ?auto_835313 ) ) ( not ( = ?auto_835311 ?auto_835314 ) ) ( not ( = ?auto_835312 ?auto_835313 ) ) ( not ( = ?auto_835312 ?auto_835314 ) ) ( not ( = ?auto_835313 ?auto_835314 ) ) ( ON ?auto_835313 ?auto_835314 ) ( CLEAR ?auto_835311 ) ( ON ?auto_835312 ?auto_835313 ) ( CLEAR ?auto_835312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_835297 ?auto_835298 ?auto_835299 ?auto_835300 ?auto_835301 ?auto_835302 ?auto_835303 ?auto_835304 ?auto_835305 ?auto_835306 ?auto_835307 ?auto_835308 ?auto_835309 ?auto_835310 ?auto_835311 ?auto_835312 )
      ( MAKE-18PILE ?auto_835297 ?auto_835298 ?auto_835299 ?auto_835300 ?auto_835301 ?auto_835302 ?auto_835303 ?auto_835304 ?auto_835305 ?auto_835306 ?auto_835307 ?auto_835308 ?auto_835309 ?auto_835310 ?auto_835311 ?auto_835312 ?auto_835313 ?auto_835314 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_835333 - BLOCK
      ?auto_835334 - BLOCK
      ?auto_835335 - BLOCK
      ?auto_835336 - BLOCK
      ?auto_835337 - BLOCK
      ?auto_835338 - BLOCK
      ?auto_835339 - BLOCK
      ?auto_835340 - BLOCK
      ?auto_835341 - BLOCK
      ?auto_835342 - BLOCK
      ?auto_835343 - BLOCK
      ?auto_835344 - BLOCK
      ?auto_835345 - BLOCK
      ?auto_835346 - BLOCK
      ?auto_835347 - BLOCK
      ?auto_835348 - BLOCK
      ?auto_835349 - BLOCK
      ?auto_835350 - BLOCK
    )
    :vars
    (
      ?auto_835351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_835350 ?auto_835351 ) ( ON-TABLE ?auto_835333 ) ( ON ?auto_835334 ?auto_835333 ) ( ON ?auto_835335 ?auto_835334 ) ( ON ?auto_835336 ?auto_835335 ) ( ON ?auto_835337 ?auto_835336 ) ( ON ?auto_835338 ?auto_835337 ) ( ON ?auto_835339 ?auto_835338 ) ( ON ?auto_835340 ?auto_835339 ) ( ON ?auto_835341 ?auto_835340 ) ( ON ?auto_835342 ?auto_835341 ) ( ON ?auto_835343 ?auto_835342 ) ( ON ?auto_835344 ?auto_835343 ) ( ON ?auto_835345 ?auto_835344 ) ( ON ?auto_835346 ?auto_835345 ) ( not ( = ?auto_835333 ?auto_835334 ) ) ( not ( = ?auto_835333 ?auto_835335 ) ) ( not ( = ?auto_835333 ?auto_835336 ) ) ( not ( = ?auto_835333 ?auto_835337 ) ) ( not ( = ?auto_835333 ?auto_835338 ) ) ( not ( = ?auto_835333 ?auto_835339 ) ) ( not ( = ?auto_835333 ?auto_835340 ) ) ( not ( = ?auto_835333 ?auto_835341 ) ) ( not ( = ?auto_835333 ?auto_835342 ) ) ( not ( = ?auto_835333 ?auto_835343 ) ) ( not ( = ?auto_835333 ?auto_835344 ) ) ( not ( = ?auto_835333 ?auto_835345 ) ) ( not ( = ?auto_835333 ?auto_835346 ) ) ( not ( = ?auto_835333 ?auto_835347 ) ) ( not ( = ?auto_835333 ?auto_835348 ) ) ( not ( = ?auto_835333 ?auto_835349 ) ) ( not ( = ?auto_835333 ?auto_835350 ) ) ( not ( = ?auto_835333 ?auto_835351 ) ) ( not ( = ?auto_835334 ?auto_835335 ) ) ( not ( = ?auto_835334 ?auto_835336 ) ) ( not ( = ?auto_835334 ?auto_835337 ) ) ( not ( = ?auto_835334 ?auto_835338 ) ) ( not ( = ?auto_835334 ?auto_835339 ) ) ( not ( = ?auto_835334 ?auto_835340 ) ) ( not ( = ?auto_835334 ?auto_835341 ) ) ( not ( = ?auto_835334 ?auto_835342 ) ) ( not ( = ?auto_835334 ?auto_835343 ) ) ( not ( = ?auto_835334 ?auto_835344 ) ) ( not ( = ?auto_835334 ?auto_835345 ) ) ( not ( = ?auto_835334 ?auto_835346 ) ) ( not ( = ?auto_835334 ?auto_835347 ) ) ( not ( = ?auto_835334 ?auto_835348 ) ) ( not ( = ?auto_835334 ?auto_835349 ) ) ( not ( = ?auto_835334 ?auto_835350 ) ) ( not ( = ?auto_835334 ?auto_835351 ) ) ( not ( = ?auto_835335 ?auto_835336 ) ) ( not ( = ?auto_835335 ?auto_835337 ) ) ( not ( = ?auto_835335 ?auto_835338 ) ) ( not ( = ?auto_835335 ?auto_835339 ) ) ( not ( = ?auto_835335 ?auto_835340 ) ) ( not ( = ?auto_835335 ?auto_835341 ) ) ( not ( = ?auto_835335 ?auto_835342 ) ) ( not ( = ?auto_835335 ?auto_835343 ) ) ( not ( = ?auto_835335 ?auto_835344 ) ) ( not ( = ?auto_835335 ?auto_835345 ) ) ( not ( = ?auto_835335 ?auto_835346 ) ) ( not ( = ?auto_835335 ?auto_835347 ) ) ( not ( = ?auto_835335 ?auto_835348 ) ) ( not ( = ?auto_835335 ?auto_835349 ) ) ( not ( = ?auto_835335 ?auto_835350 ) ) ( not ( = ?auto_835335 ?auto_835351 ) ) ( not ( = ?auto_835336 ?auto_835337 ) ) ( not ( = ?auto_835336 ?auto_835338 ) ) ( not ( = ?auto_835336 ?auto_835339 ) ) ( not ( = ?auto_835336 ?auto_835340 ) ) ( not ( = ?auto_835336 ?auto_835341 ) ) ( not ( = ?auto_835336 ?auto_835342 ) ) ( not ( = ?auto_835336 ?auto_835343 ) ) ( not ( = ?auto_835336 ?auto_835344 ) ) ( not ( = ?auto_835336 ?auto_835345 ) ) ( not ( = ?auto_835336 ?auto_835346 ) ) ( not ( = ?auto_835336 ?auto_835347 ) ) ( not ( = ?auto_835336 ?auto_835348 ) ) ( not ( = ?auto_835336 ?auto_835349 ) ) ( not ( = ?auto_835336 ?auto_835350 ) ) ( not ( = ?auto_835336 ?auto_835351 ) ) ( not ( = ?auto_835337 ?auto_835338 ) ) ( not ( = ?auto_835337 ?auto_835339 ) ) ( not ( = ?auto_835337 ?auto_835340 ) ) ( not ( = ?auto_835337 ?auto_835341 ) ) ( not ( = ?auto_835337 ?auto_835342 ) ) ( not ( = ?auto_835337 ?auto_835343 ) ) ( not ( = ?auto_835337 ?auto_835344 ) ) ( not ( = ?auto_835337 ?auto_835345 ) ) ( not ( = ?auto_835337 ?auto_835346 ) ) ( not ( = ?auto_835337 ?auto_835347 ) ) ( not ( = ?auto_835337 ?auto_835348 ) ) ( not ( = ?auto_835337 ?auto_835349 ) ) ( not ( = ?auto_835337 ?auto_835350 ) ) ( not ( = ?auto_835337 ?auto_835351 ) ) ( not ( = ?auto_835338 ?auto_835339 ) ) ( not ( = ?auto_835338 ?auto_835340 ) ) ( not ( = ?auto_835338 ?auto_835341 ) ) ( not ( = ?auto_835338 ?auto_835342 ) ) ( not ( = ?auto_835338 ?auto_835343 ) ) ( not ( = ?auto_835338 ?auto_835344 ) ) ( not ( = ?auto_835338 ?auto_835345 ) ) ( not ( = ?auto_835338 ?auto_835346 ) ) ( not ( = ?auto_835338 ?auto_835347 ) ) ( not ( = ?auto_835338 ?auto_835348 ) ) ( not ( = ?auto_835338 ?auto_835349 ) ) ( not ( = ?auto_835338 ?auto_835350 ) ) ( not ( = ?auto_835338 ?auto_835351 ) ) ( not ( = ?auto_835339 ?auto_835340 ) ) ( not ( = ?auto_835339 ?auto_835341 ) ) ( not ( = ?auto_835339 ?auto_835342 ) ) ( not ( = ?auto_835339 ?auto_835343 ) ) ( not ( = ?auto_835339 ?auto_835344 ) ) ( not ( = ?auto_835339 ?auto_835345 ) ) ( not ( = ?auto_835339 ?auto_835346 ) ) ( not ( = ?auto_835339 ?auto_835347 ) ) ( not ( = ?auto_835339 ?auto_835348 ) ) ( not ( = ?auto_835339 ?auto_835349 ) ) ( not ( = ?auto_835339 ?auto_835350 ) ) ( not ( = ?auto_835339 ?auto_835351 ) ) ( not ( = ?auto_835340 ?auto_835341 ) ) ( not ( = ?auto_835340 ?auto_835342 ) ) ( not ( = ?auto_835340 ?auto_835343 ) ) ( not ( = ?auto_835340 ?auto_835344 ) ) ( not ( = ?auto_835340 ?auto_835345 ) ) ( not ( = ?auto_835340 ?auto_835346 ) ) ( not ( = ?auto_835340 ?auto_835347 ) ) ( not ( = ?auto_835340 ?auto_835348 ) ) ( not ( = ?auto_835340 ?auto_835349 ) ) ( not ( = ?auto_835340 ?auto_835350 ) ) ( not ( = ?auto_835340 ?auto_835351 ) ) ( not ( = ?auto_835341 ?auto_835342 ) ) ( not ( = ?auto_835341 ?auto_835343 ) ) ( not ( = ?auto_835341 ?auto_835344 ) ) ( not ( = ?auto_835341 ?auto_835345 ) ) ( not ( = ?auto_835341 ?auto_835346 ) ) ( not ( = ?auto_835341 ?auto_835347 ) ) ( not ( = ?auto_835341 ?auto_835348 ) ) ( not ( = ?auto_835341 ?auto_835349 ) ) ( not ( = ?auto_835341 ?auto_835350 ) ) ( not ( = ?auto_835341 ?auto_835351 ) ) ( not ( = ?auto_835342 ?auto_835343 ) ) ( not ( = ?auto_835342 ?auto_835344 ) ) ( not ( = ?auto_835342 ?auto_835345 ) ) ( not ( = ?auto_835342 ?auto_835346 ) ) ( not ( = ?auto_835342 ?auto_835347 ) ) ( not ( = ?auto_835342 ?auto_835348 ) ) ( not ( = ?auto_835342 ?auto_835349 ) ) ( not ( = ?auto_835342 ?auto_835350 ) ) ( not ( = ?auto_835342 ?auto_835351 ) ) ( not ( = ?auto_835343 ?auto_835344 ) ) ( not ( = ?auto_835343 ?auto_835345 ) ) ( not ( = ?auto_835343 ?auto_835346 ) ) ( not ( = ?auto_835343 ?auto_835347 ) ) ( not ( = ?auto_835343 ?auto_835348 ) ) ( not ( = ?auto_835343 ?auto_835349 ) ) ( not ( = ?auto_835343 ?auto_835350 ) ) ( not ( = ?auto_835343 ?auto_835351 ) ) ( not ( = ?auto_835344 ?auto_835345 ) ) ( not ( = ?auto_835344 ?auto_835346 ) ) ( not ( = ?auto_835344 ?auto_835347 ) ) ( not ( = ?auto_835344 ?auto_835348 ) ) ( not ( = ?auto_835344 ?auto_835349 ) ) ( not ( = ?auto_835344 ?auto_835350 ) ) ( not ( = ?auto_835344 ?auto_835351 ) ) ( not ( = ?auto_835345 ?auto_835346 ) ) ( not ( = ?auto_835345 ?auto_835347 ) ) ( not ( = ?auto_835345 ?auto_835348 ) ) ( not ( = ?auto_835345 ?auto_835349 ) ) ( not ( = ?auto_835345 ?auto_835350 ) ) ( not ( = ?auto_835345 ?auto_835351 ) ) ( not ( = ?auto_835346 ?auto_835347 ) ) ( not ( = ?auto_835346 ?auto_835348 ) ) ( not ( = ?auto_835346 ?auto_835349 ) ) ( not ( = ?auto_835346 ?auto_835350 ) ) ( not ( = ?auto_835346 ?auto_835351 ) ) ( not ( = ?auto_835347 ?auto_835348 ) ) ( not ( = ?auto_835347 ?auto_835349 ) ) ( not ( = ?auto_835347 ?auto_835350 ) ) ( not ( = ?auto_835347 ?auto_835351 ) ) ( not ( = ?auto_835348 ?auto_835349 ) ) ( not ( = ?auto_835348 ?auto_835350 ) ) ( not ( = ?auto_835348 ?auto_835351 ) ) ( not ( = ?auto_835349 ?auto_835350 ) ) ( not ( = ?auto_835349 ?auto_835351 ) ) ( not ( = ?auto_835350 ?auto_835351 ) ) ( ON ?auto_835349 ?auto_835350 ) ( ON ?auto_835348 ?auto_835349 ) ( CLEAR ?auto_835346 ) ( ON ?auto_835347 ?auto_835348 ) ( CLEAR ?auto_835347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_835333 ?auto_835334 ?auto_835335 ?auto_835336 ?auto_835337 ?auto_835338 ?auto_835339 ?auto_835340 ?auto_835341 ?auto_835342 ?auto_835343 ?auto_835344 ?auto_835345 ?auto_835346 ?auto_835347 )
      ( MAKE-18PILE ?auto_835333 ?auto_835334 ?auto_835335 ?auto_835336 ?auto_835337 ?auto_835338 ?auto_835339 ?auto_835340 ?auto_835341 ?auto_835342 ?auto_835343 ?auto_835344 ?auto_835345 ?auto_835346 ?auto_835347 ?auto_835348 ?auto_835349 ?auto_835350 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_835370 - BLOCK
      ?auto_835371 - BLOCK
      ?auto_835372 - BLOCK
      ?auto_835373 - BLOCK
      ?auto_835374 - BLOCK
      ?auto_835375 - BLOCK
      ?auto_835376 - BLOCK
      ?auto_835377 - BLOCK
      ?auto_835378 - BLOCK
      ?auto_835379 - BLOCK
      ?auto_835380 - BLOCK
      ?auto_835381 - BLOCK
      ?auto_835382 - BLOCK
      ?auto_835383 - BLOCK
      ?auto_835384 - BLOCK
      ?auto_835385 - BLOCK
      ?auto_835386 - BLOCK
      ?auto_835387 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_835387 ) ( ON-TABLE ?auto_835370 ) ( ON ?auto_835371 ?auto_835370 ) ( ON ?auto_835372 ?auto_835371 ) ( ON ?auto_835373 ?auto_835372 ) ( ON ?auto_835374 ?auto_835373 ) ( ON ?auto_835375 ?auto_835374 ) ( ON ?auto_835376 ?auto_835375 ) ( ON ?auto_835377 ?auto_835376 ) ( ON ?auto_835378 ?auto_835377 ) ( ON ?auto_835379 ?auto_835378 ) ( ON ?auto_835380 ?auto_835379 ) ( ON ?auto_835381 ?auto_835380 ) ( ON ?auto_835382 ?auto_835381 ) ( ON ?auto_835383 ?auto_835382 ) ( not ( = ?auto_835370 ?auto_835371 ) ) ( not ( = ?auto_835370 ?auto_835372 ) ) ( not ( = ?auto_835370 ?auto_835373 ) ) ( not ( = ?auto_835370 ?auto_835374 ) ) ( not ( = ?auto_835370 ?auto_835375 ) ) ( not ( = ?auto_835370 ?auto_835376 ) ) ( not ( = ?auto_835370 ?auto_835377 ) ) ( not ( = ?auto_835370 ?auto_835378 ) ) ( not ( = ?auto_835370 ?auto_835379 ) ) ( not ( = ?auto_835370 ?auto_835380 ) ) ( not ( = ?auto_835370 ?auto_835381 ) ) ( not ( = ?auto_835370 ?auto_835382 ) ) ( not ( = ?auto_835370 ?auto_835383 ) ) ( not ( = ?auto_835370 ?auto_835384 ) ) ( not ( = ?auto_835370 ?auto_835385 ) ) ( not ( = ?auto_835370 ?auto_835386 ) ) ( not ( = ?auto_835370 ?auto_835387 ) ) ( not ( = ?auto_835371 ?auto_835372 ) ) ( not ( = ?auto_835371 ?auto_835373 ) ) ( not ( = ?auto_835371 ?auto_835374 ) ) ( not ( = ?auto_835371 ?auto_835375 ) ) ( not ( = ?auto_835371 ?auto_835376 ) ) ( not ( = ?auto_835371 ?auto_835377 ) ) ( not ( = ?auto_835371 ?auto_835378 ) ) ( not ( = ?auto_835371 ?auto_835379 ) ) ( not ( = ?auto_835371 ?auto_835380 ) ) ( not ( = ?auto_835371 ?auto_835381 ) ) ( not ( = ?auto_835371 ?auto_835382 ) ) ( not ( = ?auto_835371 ?auto_835383 ) ) ( not ( = ?auto_835371 ?auto_835384 ) ) ( not ( = ?auto_835371 ?auto_835385 ) ) ( not ( = ?auto_835371 ?auto_835386 ) ) ( not ( = ?auto_835371 ?auto_835387 ) ) ( not ( = ?auto_835372 ?auto_835373 ) ) ( not ( = ?auto_835372 ?auto_835374 ) ) ( not ( = ?auto_835372 ?auto_835375 ) ) ( not ( = ?auto_835372 ?auto_835376 ) ) ( not ( = ?auto_835372 ?auto_835377 ) ) ( not ( = ?auto_835372 ?auto_835378 ) ) ( not ( = ?auto_835372 ?auto_835379 ) ) ( not ( = ?auto_835372 ?auto_835380 ) ) ( not ( = ?auto_835372 ?auto_835381 ) ) ( not ( = ?auto_835372 ?auto_835382 ) ) ( not ( = ?auto_835372 ?auto_835383 ) ) ( not ( = ?auto_835372 ?auto_835384 ) ) ( not ( = ?auto_835372 ?auto_835385 ) ) ( not ( = ?auto_835372 ?auto_835386 ) ) ( not ( = ?auto_835372 ?auto_835387 ) ) ( not ( = ?auto_835373 ?auto_835374 ) ) ( not ( = ?auto_835373 ?auto_835375 ) ) ( not ( = ?auto_835373 ?auto_835376 ) ) ( not ( = ?auto_835373 ?auto_835377 ) ) ( not ( = ?auto_835373 ?auto_835378 ) ) ( not ( = ?auto_835373 ?auto_835379 ) ) ( not ( = ?auto_835373 ?auto_835380 ) ) ( not ( = ?auto_835373 ?auto_835381 ) ) ( not ( = ?auto_835373 ?auto_835382 ) ) ( not ( = ?auto_835373 ?auto_835383 ) ) ( not ( = ?auto_835373 ?auto_835384 ) ) ( not ( = ?auto_835373 ?auto_835385 ) ) ( not ( = ?auto_835373 ?auto_835386 ) ) ( not ( = ?auto_835373 ?auto_835387 ) ) ( not ( = ?auto_835374 ?auto_835375 ) ) ( not ( = ?auto_835374 ?auto_835376 ) ) ( not ( = ?auto_835374 ?auto_835377 ) ) ( not ( = ?auto_835374 ?auto_835378 ) ) ( not ( = ?auto_835374 ?auto_835379 ) ) ( not ( = ?auto_835374 ?auto_835380 ) ) ( not ( = ?auto_835374 ?auto_835381 ) ) ( not ( = ?auto_835374 ?auto_835382 ) ) ( not ( = ?auto_835374 ?auto_835383 ) ) ( not ( = ?auto_835374 ?auto_835384 ) ) ( not ( = ?auto_835374 ?auto_835385 ) ) ( not ( = ?auto_835374 ?auto_835386 ) ) ( not ( = ?auto_835374 ?auto_835387 ) ) ( not ( = ?auto_835375 ?auto_835376 ) ) ( not ( = ?auto_835375 ?auto_835377 ) ) ( not ( = ?auto_835375 ?auto_835378 ) ) ( not ( = ?auto_835375 ?auto_835379 ) ) ( not ( = ?auto_835375 ?auto_835380 ) ) ( not ( = ?auto_835375 ?auto_835381 ) ) ( not ( = ?auto_835375 ?auto_835382 ) ) ( not ( = ?auto_835375 ?auto_835383 ) ) ( not ( = ?auto_835375 ?auto_835384 ) ) ( not ( = ?auto_835375 ?auto_835385 ) ) ( not ( = ?auto_835375 ?auto_835386 ) ) ( not ( = ?auto_835375 ?auto_835387 ) ) ( not ( = ?auto_835376 ?auto_835377 ) ) ( not ( = ?auto_835376 ?auto_835378 ) ) ( not ( = ?auto_835376 ?auto_835379 ) ) ( not ( = ?auto_835376 ?auto_835380 ) ) ( not ( = ?auto_835376 ?auto_835381 ) ) ( not ( = ?auto_835376 ?auto_835382 ) ) ( not ( = ?auto_835376 ?auto_835383 ) ) ( not ( = ?auto_835376 ?auto_835384 ) ) ( not ( = ?auto_835376 ?auto_835385 ) ) ( not ( = ?auto_835376 ?auto_835386 ) ) ( not ( = ?auto_835376 ?auto_835387 ) ) ( not ( = ?auto_835377 ?auto_835378 ) ) ( not ( = ?auto_835377 ?auto_835379 ) ) ( not ( = ?auto_835377 ?auto_835380 ) ) ( not ( = ?auto_835377 ?auto_835381 ) ) ( not ( = ?auto_835377 ?auto_835382 ) ) ( not ( = ?auto_835377 ?auto_835383 ) ) ( not ( = ?auto_835377 ?auto_835384 ) ) ( not ( = ?auto_835377 ?auto_835385 ) ) ( not ( = ?auto_835377 ?auto_835386 ) ) ( not ( = ?auto_835377 ?auto_835387 ) ) ( not ( = ?auto_835378 ?auto_835379 ) ) ( not ( = ?auto_835378 ?auto_835380 ) ) ( not ( = ?auto_835378 ?auto_835381 ) ) ( not ( = ?auto_835378 ?auto_835382 ) ) ( not ( = ?auto_835378 ?auto_835383 ) ) ( not ( = ?auto_835378 ?auto_835384 ) ) ( not ( = ?auto_835378 ?auto_835385 ) ) ( not ( = ?auto_835378 ?auto_835386 ) ) ( not ( = ?auto_835378 ?auto_835387 ) ) ( not ( = ?auto_835379 ?auto_835380 ) ) ( not ( = ?auto_835379 ?auto_835381 ) ) ( not ( = ?auto_835379 ?auto_835382 ) ) ( not ( = ?auto_835379 ?auto_835383 ) ) ( not ( = ?auto_835379 ?auto_835384 ) ) ( not ( = ?auto_835379 ?auto_835385 ) ) ( not ( = ?auto_835379 ?auto_835386 ) ) ( not ( = ?auto_835379 ?auto_835387 ) ) ( not ( = ?auto_835380 ?auto_835381 ) ) ( not ( = ?auto_835380 ?auto_835382 ) ) ( not ( = ?auto_835380 ?auto_835383 ) ) ( not ( = ?auto_835380 ?auto_835384 ) ) ( not ( = ?auto_835380 ?auto_835385 ) ) ( not ( = ?auto_835380 ?auto_835386 ) ) ( not ( = ?auto_835380 ?auto_835387 ) ) ( not ( = ?auto_835381 ?auto_835382 ) ) ( not ( = ?auto_835381 ?auto_835383 ) ) ( not ( = ?auto_835381 ?auto_835384 ) ) ( not ( = ?auto_835381 ?auto_835385 ) ) ( not ( = ?auto_835381 ?auto_835386 ) ) ( not ( = ?auto_835381 ?auto_835387 ) ) ( not ( = ?auto_835382 ?auto_835383 ) ) ( not ( = ?auto_835382 ?auto_835384 ) ) ( not ( = ?auto_835382 ?auto_835385 ) ) ( not ( = ?auto_835382 ?auto_835386 ) ) ( not ( = ?auto_835382 ?auto_835387 ) ) ( not ( = ?auto_835383 ?auto_835384 ) ) ( not ( = ?auto_835383 ?auto_835385 ) ) ( not ( = ?auto_835383 ?auto_835386 ) ) ( not ( = ?auto_835383 ?auto_835387 ) ) ( not ( = ?auto_835384 ?auto_835385 ) ) ( not ( = ?auto_835384 ?auto_835386 ) ) ( not ( = ?auto_835384 ?auto_835387 ) ) ( not ( = ?auto_835385 ?auto_835386 ) ) ( not ( = ?auto_835385 ?auto_835387 ) ) ( not ( = ?auto_835386 ?auto_835387 ) ) ( ON ?auto_835386 ?auto_835387 ) ( ON ?auto_835385 ?auto_835386 ) ( CLEAR ?auto_835383 ) ( ON ?auto_835384 ?auto_835385 ) ( CLEAR ?auto_835384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_835370 ?auto_835371 ?auto_835372 ?auto_835373 ?auto_835374 ?auto_835375 ?auto_835376 ?auto_835377 ?auto_835378 ?auto_835379 ?auto_835380 ?auto_835381 ?auto_835382 ?auto_835383 ?auto_835384 )
      ( MAKE-18PILE ?auto_835370 ?auto_835371 ?auto_835372 ?auto_835373 ?auto_835374 ?auto_835375 ?auto_835376 ?auto_835377 ?auto_835378 ?auto_835379 ?auto_835380 ?auto_835381 ?auto_835382 ?auto_835383 ?auto_835384 ?auto_835385 ?auto_835386 ?auto_835387 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_835406 - BLOCK
      ?auto_835407 - BLOCK
      ?auto_835408 - BLOCK
      ?auto_835409 - BLOCK
      ?auto_835410 - BLOCK
      ?auto_835411 - BLOCK
      ?auto_835412 - BLOCK
      ?auto_835413 - BLOCK
      ?auto_835414 - BLOCK
      ?auto_835415 - BLOCK
      ?auto_835416 - BLOCK
      ?auto_835417 - BLOCK
      ?auto_835418 - BLOCK
      ?auto_835419 - BLOCK
      ?auto_835420 - BLOCK
      ?auto_835421 - BLOCK
      ?auto_835422 - BLOCK
      ?auto_835423 - BLOCK
    )
    :vars
    (
      ?auto_835424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_835423 ?auto_835424 ) ( ON-TABLE ?auto_835406 ) ( ON ?auto_835407 ?auto_835406 ) ( ON ?auto_835408 ?auto_835407 ) ( ON ?auto_835409 ?auto_835408 ) ( ON ?auto_835410 ?auto_835409 ) ( ON ?auto_835411 ?auto_835410 ) ( ON ?auto_835412 ?auto_835411 ) ( ON ?auto_835413 ?auto_835412 ) ( ON ?auto_835414 ?auto_835413 ) ( ON ?auto_835415 ?auto_835414 ) ( ON ?auto_835416 ?auto_835415 ) ( ON ?auto_835417 ?auto_835416 ) ( ON ?auto_835418 ?auto_835417 ) ( not ( = ?auto_835406 ?auto_835407 ) ) ( not ( = ?auto_835406 ?auto_835408 ) ) ( not ( = ?auto_835406 ?auto_835409 ) ) ( not ( = ?auto_835406 ?auto_835410 ) ) ( not ( = ?auto_835406 ?auto_835411 ) ) ( not ( = ?auto_835406 ?auto_835412 ) ) ( not ( = ?auto_835406 ?auto_835413 ) ) ( not ( = ?auto_835406 ?auto_835414 ) ) ( not ( = ?auto_835406 ?auto_835415 ) ) ( not ( = ?auto_835406 ?auto_835416 ) ) ( not ( = ?auto_835406 ?auto_835417 ) ) ( not ( = ?auto_835406 ?auto_835418 ) ) ( not ( = ?auto_835406 ?auto_835419 ) ) ( not ( = ?auto_835406 ?auto_835420 ) ) ( not ( = ?auto_835406 ?auto_835421 ) ) ( not ( = ?auto_835406 ?auto_835422 ) ) ( not ( = ?auto_835406 ?auto_835423 ) ) ( not ( = ?auto_835406 ?auto_835424 ) ) ( not ( = ?auto_835407 ?auto_835408 ) ) ( not ( = ?auto_835407 ?auto_835409 ) ) ( not ( = ?auto_835407 ?auto_835410 ) ) ( not ( = ?auto_835407 ?auto_835411 ) ) ( not ( = ?auto_835407 ?auto_835412 ) ) ( not ( = ?auto_835407 ?auto_835413 ) ) ( not ( = ?auto_835407 ?auto_835414 ) ) ( not ( = ?auto_835407 ?auto_835415 ) ) ( not ( = ?auto_835407 ?auto_835416 ) ) ( not ( = ?auto_835407 ?auto_835417 ) ) ( not ( = ?auto_835407 ?auto_835418 ) ) ( not ( = ?auto_835407 ?auto_835419 ) ) ( not ( = ?auto_835407 ?auto_835420 ) ) ( not ( = ?auto_835407 ?auto_835421 ) ) ( not ( = ?auto_835407 ?auto_835422 ) ) ( not ( = ?auto_835407 ?auto_835423 ) ) ( not ( = ?auto_835407 ?auto_835424 ) ) ( not ( = ?auto_835408 ?auto_835409 ) ) ( not ( = ?auto_835408 ?auto_835410 ) ) ( not ( = ?auto_835408 ?auto_835411 ) ) ( not ( = ?auto_835408 ?auto_835412 ) ) ( not ( = ?auto_835408 ?auto_835413 ) ) ( not ( = ?auto_835408 ?auto_835414 ) ) ( not ( = ?auto_835408 ?auto_835415 ) ) ( not ( = ?auto_835408 ?auto_835416 ) ) ( not ( = ?auto_835408 ?auto_835417 ) ) ( not ( = ?auto_835408 ?auto_835418 ) ) ( not ( = ?auto_835408 ?auto_835419 ) ) ( not ( = ?auto_835408 ?auto_835420 ) ) ( not ( = ?auto_835408 ?auto_835421 ) ) ( not ( = ?auto_835408 ?auto_835422 ) ) ( not ( = ?auto_835408 ?auto_835423 ) ) ( not ( = ?auto_835408 ?auto_835424 ) ) ( not ( = ?auto_835409 ?auto_835410 ) ) ( not ( = ?auto_835409 ?auto_835411 ) ) ( not ( = ?auto_835409 ?auto_835412 ) ) ( not ( = ?auto_835409 ?auto_835413 ) ) ( not ( = ?auto_835409 ?auto_835414 ) ) ( not ( = ?auto_835409 ?auto_835415 ) ) ( not ( = ?auto_835409 ?auto_835416 ) ) ( not ( = ?auto_835409 ?auto_835417 ) ) ( not ( = ?auto_835409 ?auto_835418 ) ) ( not ( = ?auto_835409 ?auto_835419 ) ) ( not ( = ?auto_835409 ?auto_835420 ) ) ( not ( = ?auto_835409 ?auto_835421 ) ) ( not ( = ?auto_835409 ?auto_835422 ) ) ( not ( = ?auto_835409 ?auto_835423 ) ) ( not ( = ?auto_835409 ?auto_835424 ) ) ( not ( = ?auto_835410 ?auto_835411 ) ) ( not ( = ?auto_835410 ?auto_835412 ) ) ( not ( = ?auto_835410 ?auto_835413 ) ) ( not ( = ?auto_835410 ?auto_835414 ) ) ( not ( = ?auto_835410 ?auto_835415 ) ) ( not ( = ?auto_835410 ?auto_835416 ) ) ( not ( = ?auto_835410 ?auto_835417 ) ) ( not ( = ?auto_835410 ?auto_835418 ) ) ( not ( = ?auto_835410 ?auto_835419 ) ) ( not ( = ?auto_835410 ?auto_835420 ) ) ( not ( = ?auto_835410 ?auto_835421 ) ) ( not ( = ?auto_835410 ?auto_835422 ) ) ( not ( = ?auto_835410 ?auto_835423 ) ) ( not ( = ?auto_835410 ?auto_835424 ) ) ( not ( = ?auto_835411 ?auto_835412 ) ) ( not ( = ?auto_835411 ?auto_835413 ) ) ( not ( = ?auto_835411 ?auto_835414 ) ) ( not ( = ?auto_835411 ?auto_835415 ) ) ( not ( = ?auto_835411 ?auto_835416 ) ) ( not ( = ?auto_835411 ?auto_835417 ) ) ( not ( = ?auto_835411 ?auto_835418 ) ) ( not ( = ?auto_835411 ?auto_835419 ) ) ( not ( = ?auto_835411 ?auto_835420 ) ) ( not ( = ?auto_835411 ?auto_835421 ) ) ( not ( = ?auto_835411 ?auto_835422 ) ) ( not ( = ?auto_835411 ?auto_835423 ) ) ( not ( = ?auto_835411 ?auto_835424 ) ) ( not ( = ?auto_835412 ?auto_835413 ) ) ( not ( = ?auto_835412 ?auto_835414 ) ) ( not ( = ?auto_835412 ?auto_835415 ) ) ( not ( = ?auto_835412 ?auto_835416 ) ) ( not ( = ?auto_835412 ?auto_835417 ) ) ( not ( = ?auto_835412 ?auto_835418 ) ) ( not ( = ?auto_835412 ?auto_835419 ) ) ( not ( = ?auto_835412 ?auto_835420 ) ) ( not ( = ?auto_835412 ?auto_835421 ) ) ( not ( = ?auto_835412 ?auto_835422 ) ) ( not ( = ?auto_835412 ?auto_835423 ) ) ( not ( = ?auto_835412 ?auto_835424 ) ) ( not ( = ?auto_835413 ?auto_835414 ) ) ( not ( = ?auto_835413 ?auto_835415 ) ) ( not ( = ?auto_835413 ?auto_835416 ) ) ( not ( = ?auto_835413 ?auto_835417 ) ) ( not ( = ?auto_835413 ?auto_835418 ) ) ( not ( = ?auto_835413 ?auto_835419 ) ) ( not ( = ?auto_835413 ?auto_835420 ) ) ( not ( = ?auto_835413 ?auto_835421 ) ) ( not ( = ?auto_835413 ?auto_835422 ) ) ( not ( = ?auto_835413 ?auto_835423 ) ) ( not ( = ?auto_835413 ?auto_835424 ) ) ( not ( = ?auto_835414 ?auto_835415 ) ) ( not ( = ?auto_835414 ?auto_835416 ) ) ( not ( = ?auto_835414 ?auto_835417 ) ) ( not ( = ?auto_835414 ?auto_835418 ) ) ( not ( = ?auto_835414 ?auto_835419 ) ) ( not ( = ?auto_835414 ?auto_835420 ) ) ( not ( = ?auto_835414 ?auto_835421 ) ) ( not ( = ?auto_835414 ?auto_835422 ) ) ( not ( = ?auto_835414 ?auto_835423 ) ) ( not ( = ?auto_835414 ?auto_835424 ) ) ( not ( = ?auto_835415 ?auto_835416 ) ) ( not ( = ?auto_835415 ?auto_835417 ) ) ( not ( = ?auto_835415 ?auto_835418 ) ) ( not ( = ?auto_835415 ?auto_835419 ) ) ( not ( = ?auto_835415 ?auto_835420 ) ) ( not ( = ?auto_835415 ?auto_835421 ) ) ( not ( = ?auto_835415 ?auto_835422 ) ) ( not ( = ?auto_835415 ?auto_835423 ) ) ( not ( = ?auto_835415 ?auto_835424 ) ) ( not ( = ?auto_835416 ?auto_835417 ) ) ( not ( = ?auto_835416 ?auto_835418 ) ) ( not ( = ?auto_835416 ?auto_835419 ) ) ( not ( = ?auto_835416 ?auto_835420 ) ) ( not ( = ?auto_835416 ?auto_835421 ) ) ( not ( = ?auto_835416 ?auto_835422 ) ) ( not ( = ?auto_835416 ?auto_835423 ) ) ( not ( = ?auto_835416 ?auto_835424 ) ) ( not ( = ?auto_835417 ?auto_835418 ) ) ( not ( = ?auto_835417 ?auto_835419 ) ) ( not ( = ?auto_835417 ?auto_835420 ) ) ( not ( = ?auto_835417 ?auto_835421 ) ) ( not ( = ?auto_835417 ?auto_835422 ) ) ( not ( = ?auto_835417 ?auto_835423 ) ) ( not ( = ?auto_835417 ?auto_835424 ) ) ( not ( = ?auto_835418 ?auto_835419 ) ) ( not ( = ?auto_835418 ?auto_835420 ) ) ( not ( = ?auto_835418 ?auto_835421 ) ) ( not ( = ?auto_835418 ?auto_835422 ) ) ( not ( = ?auto_835418 ?auto_835423 ) ) ( not ( = ?auto_835418 ?auto_835424 ) ) ( not ( = ?auto_835419 ?auto_835420 ) ) ( not ( = ?auto_835419 ?auto_835421 ) ) ( not ( = ?auto_835419 ?auto_835422 ) ) ( not ( = ?auto_835419 ?auto_835423 ) ) ( not ( = ?auto_835419 ?auto_835424 ) ) ( not ( = ?auto_835420 ?auto_835421 ) ) ( not ( = ?auto_835420 ?auto_835422 ) ) ( not ( = ?auto_835420 ?auto_835423 ) ) ( not ( = ?auto_835420 ?auto_835424 ) ) ( not ( = ?auto_835421 ?auto_835422 ) ) ( not ( = ?auto_835421 ?auto_835423 ) ) ( not ( = ?auto_835421 ?auto_835424 ) ) ( not ( = ?auto_835422 ?auto_835423 ) ) ( not ( = ?auto_835422 ?auto_835424 ) ) ( not ( = ?auto_835423 ?auto_835424 ) ) ( ON ?auto_835422 ?auto_835423 ) ( ON ?auto_835421 ?auto_835422 ) ( ON ?auto_835420 ?auto_835421 ) ( CLEAR ?auto_835418 ) ( ON ?auto_835419 ?auto_835420 ) ( CLEAR ?auto_835419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_835406 ?auto_835407 ?auto_835408 ?auto_835409 ?auto_835410 ?auto_835411 ?auto_835412 ?auto_835413 ?auto_835414 ?auto_835415 ?auto_835416 ?auto_835417 ?auto_835418 ?auto_835419 )
      ( MAKE-18PILE ?auto_835406 ?auto_835407 ?auto_835408 ?auto_835409 ?auto_835410 ?auto_835411 ?auto_835412 ?auto_835413 ?auto_835414 ?auto_835415 ?auto_835416 ?auto_835417 ?auto_835418 ?auto_835419 ?auto_835420 ?auto_835421 ?auto_835422 ?auto_835423 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_835443 - BLOCK
      ?auto_835444 - BLOCK
      ?auto_835445 - BLOCK
      ?auto_835446 - BLOCK
      ?auto_835447 - BLOCK
      ?auto_835448 - BLOCK
      ?auto_835449 - BLOCK
      ?auto_835450 - BLOCK
      ?auto_835451 - BLOCK
      ?auto_835452 - BLOCK
      ?auto_835453 - BLOCK
      ?auto_835454 - BLOCK
      ?auto_835455 - BLOCK
      ?auto_835456 - BLOCK
      ?auto_835457 - BLOCK
      ?auto_835458 - BLOCK
      ?auto_835459 - BLOCK
      ?auto_835460 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_835460 ) ( ON-TABLE ?auto_835443 ) ( ON ?auto_835444 ?auto_835443 ) ( ON ?auto_835445 ?auto_835444 ) ( ON ?auto_835446 ?auto_835445 ) ( ON ?auto_835447 ?auto_835446 ) ( ON ?auto_835448 ?auto_835447 ) ( ON ?auto_835449 ?auto_835448 ) ( ON ?auto_835450 ?auto_835449 ) ( ON ?auto_835451 ?auto_835450 ) ( ON ?auto_835452 ?auto_835451 ) ( ON ?auto_835453 ?auto_835452 ) ( ON ?auto_835454 ?auto_835453 ) ( ON ?auto_835455 ?auto_835454 ) ( not ( = ?auto_835443 ?auto_835444 ) ) ( not ( = ?auto_835443 ?auto_835445 ) ) ( not ( = ?auto_835443 ?auto_835446 ) ) ( not ( = ?auto_835443 ?auto_835447 ) ) ( not ( = ?auto_835443 ?auto_835448 ) ) ( not ( = ?auto_835443 ?auto_835449 ) ) ( not ( = ?auto_835443 ?auto_835450 ) ) ( not ( = ?auto_835443 ?auto_835451 ) ) ( not ( = ?auto_835443 ?auto_835452 ) ) ( not ( = ?auto_835443 ?auto_835453 ) ) ( not ( = ?auto_835443 ?auto_835454 ) ) ( not ( = ?auto_835443 ?auto_835455 ) ) ( not ( = ?auto_835443 ?auto_835456 ) ) ( not ( = ?auto_835443 ?auto_835457 ) ) ( not ( = ?auto_835443 ?auto_835458 ) ) ( not ( = ?auto_835443 ?auto_835459 ) ) ( not ( = ?auto_835443 ?auto_835460 ) ) ( not ( = ?auto_835444 ?auto_835445 ) ) ( not ( = ?auto_835444 ?auto_835446 ) ) ( not ( = ?auto_835444 ?auto_835447 ) ) ( not ( = ?auto_835444 ?auto_835448 ) ) ( not ( = ?auto_835444 ?auto_835449 ) ) ( not ( = ?auto_835444 ?auto_835450 ) ) ( not ( = ?auto_835444 ?auto_835451 ) ) ( not ( = ?auto_835444 ?auto_835452 ) ) ( not ( = ?auto_835444 ?auto_835453 ) ) ( not ( = ?auto_835444 ?auto_835454 ) ) ( not ( = ?auto_835444 ?auto_835455 ) ) ( not ( = ?auto_835444 ?auto_835456 ) ) ( not ( = ?auto_835444 ?auto_835457 ) ) ( not ( = ?auto_835444 ?auto_835458 ) ) ( not ( = ?auto_835444 ?auto_835459 ) ) ( not ( = ?auto_835444 ?auto_835460 ) ) ( not ( = ?auto_835445 ?auto_835446 ) ) ( not ( = ?auto_835445 ?auto_835447 ) ) ( not ( = ?auto_835445 ?auto_835448 ) ) ( not ( = ?auto_835445 ?auto_835449 ) ) ( not ( = ?auto_835445 ?auto_835450 ) ) ( not ( = ?auto_835445 ?auto_835451 ) ) ( not ( = ?auto_835445 ?auto_835452 ) ) ( not ( = ?auto_835445 ?auto_835453 ) ) ( not ( = ?auto_835445 ?auto_835454 ) ) ( not ( = ?auto_835445 ?auto_835455 ) ) ( not ( = ?auto_835445 ?auto_835456 ) ) ( not ( = ?auto_835445 ?auto_835457 ) ) ( not ( = ?auto_835445 ?auto_835458 ) ) ( not ( = ?auto_835445 ?auto_835459 ) ) ( not ( = ?auto_835445 ?auto_835460 ) ) ( not ( = ?auto_835446 ?auto_835447 ) ) ( not ( = ?auto_835446 ?auto_835448 ) ) ( not ( = ?auto_835446 ?auto_835449 ) ) ( not ( = ?auto_835446 ?auto_835450 ) ) ( not ( = ?auto_835446 ?auto_835451 ) ) ( not ( = ?auto_835446 ?auto_835452 ) ) ( not ( = ?auto_835446 ?auto_835453 ) ) ( not ( = ?auto_835446 ?auto_835454 ) ) ( not ( = ?auto_835446 ?auto_835455 ) ) ( not ( = ?auto_835446 ?auto_835456 ) ) ( not ( = ?auto_835446 ?auto_835457 ) ) ( not ( = ?auto_835446 ?auto_835458 ) ) ( not ( = ?auto_835446 ?auto_835459 ) ) ( not ( = ?auto_835446 ?auto_835460 ) ) ( not ( = ?auto_835447 ?auto_835448 ) ) ( not ( = ?auto_835447 ?auto_835449 ) ) ( not ( = ?auto_835447 ?auto_835450 ) ) ( not ( = ?auto_835447 ?auto_835451 ) ) ( not ( = ?auto_835447 ?auto_835452 ) ) ( not ( = ?auto_835447 ?auto_835453 ) ) ( not ( = ?auto_835447 ?auto_835454 ) ) ( not ( = ?auto_835447 ?auto_835455 ) ) ( not ( = ?auto_835447 ?auto_835456 ) ) ( not ( = ?auto_835447 ?auto_835457 ) ) ( not ( = ?auto_835447 ?auto_835458 ) ) ( not ( = ?auto_835447 ?auto_835459 ) ) ( not ( = ?auto_835447 ?auto_835460 ) ) ( not ( = ?auto_835448 ?auto_835449 ) ) ( not ( = ?auto_835448 ?auto_835450 ) ) ( not ( = ?auto_835448 ?auto_835451 ) ) ( not ( = ?auto_835448 ?auto_835452 ) ) ( not ( = ?auto_835448 ?auto_835453 ) ) ( not ( = ?auto_835448 ?auto_835454 ) ) ( not ( = ?auto_835448 ?auto_835455 ) ) ( not ( = ?auto_835448 ?auto_835456 ) ) ( not ( = ?auto_835448 ?auto_835457 ) ) ( not ( = ?auto_835448 ?auto_835458 ) ) ( not ( = ?auto_835448 ?auto_835459 ) ) ( not ( = ?auto_835448 ?auto_835460 ) ) ( not ( = ?auto_835449 ?auto_835450 ) ) ( not ( = ?auto_835449 ?auto_835451 ) ) ( not ( = ?auto_835449 ?auto_835452 ) ) ( not ( = ?auto_835449 ?auto_835453 ) ) ( not ( = ?auto_835449 ?auto_835454 ) ) ( not ( = ?auto_835449 ?auto_835455 ) ) ( not ( = ?auto_835449 ?auto_835456 ) ) ( not ( = ?auto_835449 ?auto_835457 ) ) ( not ( = ?auto_835449 ?auto_835458 ) ) ( not ( = ?auto_835449 ?auto_835459 ) ) ( not ( = ?auto_835449 ?auto_835460 ) ) ( not ( = ?auto_835450 ?auto_835451 ) ) ( not ( = ?auto_835450 ?auto_835452 ) ) ( not ( = ?auto_835450 ?auto_835453 ) ) ( not ( = ?auto_835450 ?auto_835454 ) ) ( not ( = ?auto_835450 ?auto_835455 ) ) ( not ( = ?auto_835450 ?auto_835456 ) ) ( not ( = ?auto_835450 ?auto_835457 ) ) ( not ( = ?auto_835450 ?auto_835458 ) ) ( not ( = ?auto_835450 ?auto_835459 ) ) ( not ( = ?auto_835450 ?auto_835460 ) ) ( not ( = ?auto_835451 ?auto_835452 ) ) ( not ( = ?auto_835451 ?auto_835453 ) ) ( not ( = ?auto_835451 ?auto_835454 ) ) ( not ( = ?auto_835451 ?auto_835455 ) ) ( not ( = ?auto_835451 ?auto_835456 ) ) ( not ( = ?auto_835451 ?auto_835457 ) ) ( not ( = ?auto_835451 ?auto_835458 ) ) ( not ( = ?auto_835451 ?auto_835459 ) ) ( not ( = ?auto_835451 ?auto_835460 ) ) ( not ( = ?auto_835452 ?auto_835453 ) ) ( not ( = ?auto_835452 ?auto_835454 ) ) ( not ( = ?auto_835452 ?auto_835455 ) ) ( not ( = ?auto_835452 ?auto_835456 ) ) ( not ( = ?auto_835452 ?auto_835457 ) ) ( not ( = ?auto_835452 ?auto_835458 ) ) ( not ( = ?auto_835452 ?auto_835459 ) ) ( not ( = ?auto_835452 ?auto_835460 ) ) ( not ( = ?auto_835453 ?auto_835454 ) ) ( not ( = ?auto_835453 ?auto_835455 ) ) ( not ( = ?auto_835453 ?auto_835456 ) ) ( not ( = ?auto_835453 ?auto_835457 ) ) ( not ( = ?auto_835453 ?auto_835458 ) ) ( not ( = ?auto_835453 ?auto_835459 ) ) ( not ( = ?auto_835453 ?auto_835460 ) ) ( not ( = ?auto_835454 ?auto_835455 ) ) ( not ( = ?auto_835454 ?auto_835456 ) ) ( not ( = ?auto_835454 ?auto_835457 ) ) ( not ( = ?auto_835454 ?auto_835458 ) ) ( not ( = ?auto_835454 ?auto_835459 ) ) ( not ( = ?auto_835454 ?auto_835460 ) ) ( not ( = ?auto_835455 ?auto_835456 ) ) ( not ( = ?auto_835455 ?auto_835457 ) ) ( not ( = ?auto_835455 ?auto_835458 ) ) ( not ( = ?auto_835455 ?auto_835459 ) ) ( not ( = ?auto_835455 ?auto_835460 ) ) ( not ( = ?auto_835456 ?auto_835457 ) ) ( not ( = ?auto_835456 ?auto_835458 ) ) ( not ( = ?auto_835456 ?auto_835459 ) ) ( not ( = ?auto_835456 ?auto_835460 ) ) ( not ( = ?auto_835457 ?auto_835458 ) ) ( not ( = ?auto_835457 ?auto_835459 ) ) ( not ( = ?auto_835457 ?auto_835460 ) ) ( not ( = ?auto_835458 ?auto_835459 ) ) ( not ( = ?auto_835458 ?auto_835460 ) ) ( not ( = ?auto_835459 ?auto_835460 ) ) ( ON ?auto_835459 ?auto_835460 ) ( ON ?auto_835458 ?auto_835459 ) ( ON ?auto_835457 ?auto_835458 ) ( CLEAR ?auto_835455 ) ( ON ?auto_835456 ?auto_835457 ) ( CLEAR ?auto_835456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_835443 ?auto_835444 ?auto_835445 ?auto_835446 ?auto_835447 ?auto_835448 ?auto_835449 ?auto_835450 ?auto_835451 ?auto_835452 ?auto_835453 ?auto_835454 ?auto_835455 ?auto_835456 )
      ( MAKE-18PILE ?auto_835443 ?auto_835444 ?auto_835445 ?auto_835446 ?auto_835447 ?auto_835448 ?auto_835449 ?auto_835450 ?auto_835451 ?auto_835452 ?auto_835453 ?auto_835454 ?auto_835455 ?auto_835456 ?auto_835457 ?auto_835458 ?auto_835459 ?auto_835460 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_835479 - BLOCK
      ?auto_835480 - BLOCK
      ?auto_835481 - BLOCK
      ?auto_835482 - BLOCK
      ?auto_835483 - BLOCK
      ?auto_835484 - BLOCK
      ?auto_835485 - BLOCK
      ?auto_835486 - BLOCK
      ?auto_835487 - BLOCK
      ?auto_835488 - BLOCK
      ?auto_835489 - BLOCK
      ?auto_835490 - BLOCK
      ?auto_835491 - BLOCK
      ?auto_835492 - BLOCK
      ?auto_835493 - BLOCK
      ?auto_835494 - BLOCK
      ?auto_835495 - BLOCK
      ?auto_835496 - BLOCK
    )
    :vars
    (
      ?auto_835497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_835496 ?auto_835497 ) ( ON-TABLE ?auto_835479 ) ( ON ?auto_835480 ?auto_835479 ) ( ON ?auto_835481 ?auto_835480 ) ( ON ?auto_835482 ?auto_835481 ) ( ON ?auto_835483 ?auto_835482 ) ( ON ?auto_835484 ?auto_835483 ) ( ON ?auto_835485 ?auto_835484 ) ( ON ?auto_835486 ?auto_835485 ) ( ON ?auto_835487 ?auto_835486 ) ( ON ?auto_835488 ?auto_835487 ) ( ON ?auto_835489 ?auto_835488 ) ( ON ?auto_835490 ?auto_835489 ) ( not ( = ?auto_835479 ?auto_835480 ) ) ( not ( = ?auto_835479 ?auto_835481 ) ) ( not ( = ?auto_835479 ?auto_835482 ) ) ( not ( = ?auto_835479 ?auto_835483 ) ) ( not ( = ?auto_835479 ?auto_835484 ) ) ( not ( = ?auto_835479 ?auto_835485 ) ) ( not ( = ?auto_835479 ?auto_835486 ) ) ( not ( = ?auto_835479 ?auto_835487 ) ) ( not ( = ?auto_835479 ?auto_835488 ) ) ( not ( = ?auto_835479 ?auto_835489 ) ) ( not ( = ?auto_835479 ?auto_835490 ) ) ( not ( = ?auto_835479 ?auto_835491 ) ) ( not ( = ?auto_835479 ?auto_835492 ) ) ( not ( = ?auto_835479 ?auto_835493 ) ) ( not ( = ?auto_835479 ?auto_835494 ) ) ( not ( = ?auto_835479 ?auto_835495 ) ) ( not ( = ?auto_835479 ?auto_835496 ) ) ( not ( = ?auto_835479 ?auto_835497 ) ) ( not ( = ?auto_835480 ?auto_835481 ) ) ( not ( = ?auto_835480 ?auto_835482 ) ) ( not ( = ?auto_835480 ?auto_835483 ) ) ( not ( = ?auto_835480 ?auto_835484 ) ) ( not ( = ?auto_835480 ?auto_835485 ) ) ( not ( = ?auto_835480 ?auto_835486 ) ) ( not ( = ?auto_835480 ?auto_835487 ) ) ( not ( = ?auto_835480 ?auto_835488 ) ) ( not ( = ?auto_835480 ?auto_835489 ) ) ( not ( = ?auto_835480 ?auto_835490 ) ) ( not ( = ?auto_835480 ?auto_835491 ) ) ( not ( = ?auto_835480 ?auto_835492 ) ) ( not ( = ?auto_835480 ?auto_835493 ) ) ( not ( = ?auto_835480 ?auto_835494 ) ) ( not ( = ?auto_835480 ?auto_835495 ) ) ( not ( = ?auto_835480 ?auto_835496 ) ) ( not ( = ?auto_835480 ?auto_835497 ) ) ( not ( = ?auto_835481 ?auto_835482 ) ) ( not ( = ?auto_835481 ?auto_835483 ) ) ( not ( = ?auto_835481 ?auto_835484 ) ) ( not ( = ?auto_835481 ?auto_835485 ) ) ( not ( = ?auto_835481 ?auto_835486 ) ) ( not ( = ?auto_835481 ?auto_835487 ) ) ( not ( = ?auto_835481 ?auto_835488 ) ) ( not ( = ?auto_835481 ?auto_835489 ) ) ( not ( = ?auto_835481 ?auto_835490 ) ) ( not ( = ?auto_835481 ?auto_835491 ) ) ( not ( = ?auto_835481 ?auto_835492 ) ) ( not ( = ?auto_835481 ?auto_835493 ) ) ( not ( = ?auto_835481 ?auto_835494 ) ) ( not ( = ?auto_835481 ?auto_835495 ) ) ( not ( = ?auto_835481 ?auto_835496 ) ) ( not ( = ?auto_835481 ?auto_835497 ) ) ( not ( = ?auto_835482 ?auto_835483 ) ) ( not ( = ?auto_835482 ?auto_835484 ) ) ( not ( = ?auto_835482 ?auto_835485 ) ) ( not ( = ?auto_835482 ?auto_835486 ) ) ( not ( = ?auto_835482 ?auto_835487 ) ) ( not ( = ?auto_835482 ?auto_835488 ) ) ( not ( = ?auto_835482 ?auto_835489 ) ) ( not ( = ?auto_835482 ?auto_835490 ) ) ( not ( = ?auto_835482 ?auto_835491 ) ) ( not ( = ?auto_835482 ?auto_835492 ) ) ( not ( = ?auto_835482 ?auto_835493 ) ) ( not ( = ?auto_835482 ?auto_835494 ) ) ( not ( = ?auto_835482 ?auto_835495 ) ) ( not ( = ?auto_835482 ?auto_835496 ) ) ( not ( = ?auto_835482 ?auto_835497 ) ) ( not ( = ?auto_835483 ?auto_835484 ) ) ( not ( = ?auto_835483 ?auto_835485 ) ) ( not ( = ?auto_835483 ?auto_835486 ) ) ( not ( = ?auto_835483 ?auto_835487 ) ) ( not ( = ?auto_835483 ?auto_835488 ) ) ( not ( = ?auto_835483 ?auto_835489 ) ) ( not ( = ?auto_835483 ?auto_835490 ) ) ( not ( = ?auto_835483 ?auto_835491 ) ) ( not ( = ?auto_835483 ?auto_835492 ) ) ( not ( = ?auto_835483 ?auto_835493 ) ) ( not ( = ?auto_835483 ?auto_835494 ) ) ( not ( = ?auto_835483 ?auto_835495 ) ) ( not ( = ?auto_835483 ?auto_835496 ) ) ( not ( = ?auto_835483 ?auto_835497 ) ) ( not ( = ?auto_835484 ?auto_835485 ) ) ( not ( = ?auto_835484 ?auto_835486 ) ) ( not ( = ?auto_835484 ?auto_835487 ) ) ( not ( = ?auto_835484 ?auto_835488 ) ) ( not ( = ?auto_835484 ?auto_835489 ) ) ( not ( = ?auto_835484 ?auto_835490 ) ) ( not ( = ?auto_835484 ?auto_835491 ) ) ( not ( = ?auto_835484 ?auto_835492 ) ) ( not ( = ?auto_835484 ?auto_835493 ) ) ( not ( = ?auto_835484 ?auto_835494 ) ) ( not ( = ?auto_835484 ?auto_835495 ) ) ( not ( = ?auto_835484 ?auto_835496 ) ) ( not ( = ?auto_835484 ?auto_835497 ) ) ( not ( = ?auto_835485 ?auto_835486 ) ) ( not ( = ?auto_835485 ?auto_835487 ) ) ( not ( = ?auto_835485 ?auto_835488 ) ) ( not ( = ?auto_835485 ?auto_835489 ) ) ( not ( = ?auto_835485 ?auto_835490 ) ) ( not ( = ?auto_835485 ?auto_835491 ) ) ( not ( = ?auto_835485 ?auto_835492 ) ) ( not ( = ?auto_835485 ?auto_835493 ) ) ( not ( = ?auto_835485 ?auto_835494 ) ) ( not ( = ?auto_835485 ?auto_835495 ) ) ( not ( = ?auto_835485 ?auto_835496 ) ) ( not ( = ?auto_835485 ?auto_835497 ) ) ( not ( = ?auto_835486 ?auto_835487 ) ) ( not ( = ?auto_835486 ?auto_835488 ) ) ( not ( = ?auto_835486 ?auto_835489 ) ) ( not ( = ?auto_835486 ?auto_835490 ) ) ( not ( = ?auto_835486 ?auto_835491 ) ) ( not ( = ?auto_835486 ?auto_835492 ) ) ( not ( = ?auto_835486 ?auto_835493 ) ) ( not ( = ?auto_835486 ?auto_835494 ) ) ( not ( = ?auto_835486 ?auto_835495 ) ) ( not ( = ?auto_835486 ?auto_835496 ) ) ( not ( = ?auto_835486 ?auto_835497 ) ) ( not ( = ?auto_835487 ?auto_835488 ) ) ( not ( = ?auto_835487 ?auto_835489 ) ) ( not ( = ?auto_835487 ?auto_835490 ) ) ( not ( = ?auto_835487 ?auto_835491 ) ) ( not ( = ?auto_835487 ?auto_835492 ) ) ( not ( = ?auto_835487 ?auto_835493 ) ) ( not ( = ?auto_835487 ?auto_835494 ) ) ( not ( = ?auto_835487 ?auto_835495 ) ) ( not ( = ?auto_835487 ?auto_835496 ) ) ( not ( = ?auto_835487 ?auto_835497 ) ) ( not ( = ?auto_835488 ?auto_835489 ) ) ( not ( = ?auto_835488 ?auto_835490 ) ) ( not ( = ?auto_835488 ?auto_835491 ) ) ( not ( = ?auto_835488 ?auto_835492 ) ) ( not ( = ?auto_835488 ?auto_835493 ) ) ( not ( = ?auto_835488 ?auto_835494 ) ) ( not ( = ?auto_835488 ?auto_835495 ) ) ( not ( = ?auto_835488 ?auto_835496 ) ) ( not ( = ?auto_835488 ?auto_835497 ) ) ( not ( = ?auto_835489 ?auto_835490 ) ) ( not ( = ?auto_835489 ?auto_835491 ) ) ( not ( = ?auto_835489 ?auto_835492 ) ) ( not ( = ?auto_835489 ?auto_835493 ) ) ( not ( = ?auto_835489 ?auto_835494 ) ) ( not ( = ?auto_835489 ?auto_835495 ) ) ( not ( = ?auto_835489 ?auto_835496 ) ) ( not ( = ?auto_835489 ?auto_835497 ) ) ( not ( = ?auto_835490 ?auto_835491 ) ) ( not ( = ?auto_835490 ?auto_835492 ) ) ( not ( = ?auto_835490 ?auto_835493 ) ) ( not ( = ?auto_835490 ?auto_835494 ) ) ( not ( = ?auto_835490 ?auto_835495 ) ) ( not ( = ?auto_835490 ?auto_835496 ) ) ( not ( = ?auto_835490 ?auto_835497 ) ) ( not ( = ?auto_835491 ?auto_835492 ) ) ( not ( = ?auto_835491 ?auto_835493 ) ) ( not ( = ?auto_835491 ?auto_835494 ) ) ( not ( = ?auto_835491 ?auto_835495 ) ) ( not ( = ?auto_835491 ?auto_835496 ) ) ( not ( = ?auto_835491 ?auto_835497 ) ) ( not ( = ?auto_835492 ?auto_835493 ) ) ( not ( = ?auto_835492 ?auto_835494 ) ) ( not ( = ?auto_835492 ?auto_835495 ) ) ( not ( = ?auto_835492 ?auto_835496 ) ) ( not ( = ?auto_835492 ?auto_835497 ) ) ( not ( = ?auto_835493 ?auto_835494 ) ) ( not ( = ?auto_835493 ?auto_835495 ) ) ( not ( = ?auto_835493 ?auto_835496 ) ) ( not ( = ?auto_835493 ?auto_835497 ) ) ( not ( = ?auto_835494 ?auto_835495 ) ) ( not ( = ?auto_835494 ?auto_835496 ) ) ( not ( = ?auto_835494 ?auto_835497 ) ) ( not ( = ?auto_835495 ?auto_835496 ) ) ( not ( = ?auto_835495 ?auto_835497 ) ) ( not ( = ?auto_835496 ?auto_835497 ) ) ( ON ?auto_835495 ?auto_835496 ) ( ON ?auto_835494 ?auto_835495 ) ( ON ?auto_835493 ?auto_835494 ) ( ON ?auto_835492 ?auto_835493 ) ( CLEAR ?auto_835490 ) ( ON ?auto_835491 ?auto_835492 ) ( CLEAR ?auto_835491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_835479 ?auto_835480 ?auto_835481 ?auto_835482 ?auto_835483 ?auto_835484 ?auto_835485 ?auto_835486 ?auto_835487 ?auto_835488 ?auto_835489 ?auto_835490 ?auto_835491 )
      ( MAKE-18PILE ?auto_835479 ?auto_835480 ?auto_835481 ?auto_835482 ?auto_835483 ?auto_835484 ?auto_835485 ?auto_835486 ?auto_835487 ?auto_835488 ?auto_835489 ?auto_835490 ?auto_835491 ?auto_835492 ?auto_835493 ?auto_835494 ?auto_835495 ?auto_835496 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_835516 - BLOCK
      ?auto_835517 - BLOCK
      ?auto_835518 - BLOCK
      ?auto_835519 - BLOCK
      ?auto_835520 - BLOCK
      ?auto_835521 - BLOCK
      ?auto_835522 - BLOCK
      ?auto_835523 - BLOCK
      ?auto_835524 - BLOCK
      ?auto_835525 - BLOCK
      ?auto_835526 - BLOCK
      ?auto_835527 - BLOCK
      ?auto_835528 - BLOCK
      ?auto_835529 - BLOCK
      ?auto_835530 - BLOCK
      ?auto_835531 - BLOCK
      ?auto_835532 - BLOCK
      ?auto_835533 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_835533 ) ( ON-TABLE ?auto_835516 ) ( ON ?auto_835517 ?auto_835516 ) ( ON ?auto_835518 ?auto_835517 ) ( ON ?auto_835519 ?auto_835518 ) ( ON ?auto_835520 ?auto_835519 ) ( ON ?auto_835521 ?auto_835520 ) ( ON ?auto_835522 ?auto_835521 ) ( ON ?auto_835523 ?auto_835522 ) ( ON ?auto_835524 ?auto_835523 ) ( ON ?auto_835525 ?auto_835524 ) ( ON ?auto_835526 ?auto_835525 ) ( ON ?auto_835527 ?auto_835526 ) ( not ( = ?auto_835516 ?auto_835517 ) ) ( not ( = ?auto_835516 ?auto_835518 ) ) ( not ( = ?auto_835516 ?auto_835519 ) ) ( not ( = ?auto_835516 ?auto_835520 ) ) ( not ( = ?auto_835516 ?auto_835521 ) ) ( not ( = ?auto_835516 ?auto_835522 ) ) ( not ( = ?auto_835516 ?auto_835523 ) ) ( not ( = ?auto_835516 ?auto_835524 ) ) ( not ( = ?auto_835516 ?auto_835525 ) ) ( not ( = ?auto_835516 ?auto_835526 ) ) ( not ( = ?auto_835516 ?auto_835527 ) ) ( not ( = ?auto_835516 ?auto_835528 ) ) ( not ( = ?auto_835516 ?auto_835529 ) ) ( not ( = ?auto_835516 ?auto_835530 ) ) ( not ( = ?auto_835516 ?auto_835531 ) ) ( not ( = ?auto_835516 ?auto_835532 ) ) ( not ( = ?auto_835516 ?auto_835533 ) ) ( not ( = ?auto_835517 ?auto_835518 ) ) ( not ( = ?auto_835517 ?auto_835519 ) ) ( not ( = ?auto_835517 ?auto_835520 ) ) ( not ( = ?auto_835517 ?auto_835521 ) ) ( not ( = ?auto_835517 ?auto_835522 ) ) ( not ( = ?auto_835517 ?auto_835523 ) ) ( not ( = ?auto_835517 ?auto_835524 ) ) ( not ( = ?auto_835517 ?auto_835525 ) ) ( not ( = ?auto_835517 ?auto_835526 ) ) ( not ( = ?auto_835517 ?auto_835527 ) ) ( not ( = ?auto_835517 ?auto_835528 ) ) ( not ( = ?auto_835517 ?auto_835529 ) ) ( not ( = ?auto_835517 ?auto_835530 ) ) ( not ( = ?auto_835517 ?auto_835531 ) ) ( not ( = ?auto_835517 ?auto_835532 ) ) ( not ( = ?auto_835517 ?auto_835533 ) ) ( not ( = ?auto_835518 ?auto_835519 ) ) ( not ( = ?auto_835518 ?auto_835520 ) ) ( not ( = ?auto_835518 ?auto_835521 ) ) ( not ( = ?auto_835518 ?auto_835522 ) ) ( not ( = ?auto_835518 ?auto_835523 ) ) ( not ( = ?auto_835518 ?auto_835524 ) ) ( not ( = ?auto_835518 ?auto_835525 ) ) ( not ( = ?auto_835518 ?auto_835526 ) ) ( not ( = ?auto_835518 ?auto_835527 ) ) ( not ( = ?auto_835518 ?auto_835528 ) ) ( not ( = ?auto_835518 ?auto_835529 ) ) ( not ( = ?auto_835518 ?auto_835530 ) ) ( not ( = ?auto_835518 ?auto_835531 ) ) ( not ( = ?auto_835518 ?auto_835532 ) ) ( not ( = ?auto_835518 ?auto_835533 ) ) ( not ( = ?auto_835519 ?auto_835520 ) ) ( not ( = ?auto_835519 ?auto_835521 ) ) ( not ( = ?auto_835519 ?auto_835522 ) ) ( not ( = ?auto_835519 ?auto_835523 ) ) ( not ( = ?auto_835519 ?auto_835524 ) ) ( not ( = ?auto_835519 ?auto_835525 ) ) ( not ( = ?auto_835519 ?auto_835526 ) ) ( not ( = ?auto_835519 ?auto_835527 ) ) ( not ( = ?auto_835519 ?auto_835528 ) ) ( not ( = ?auto_835519 ?auto_835529 ) ) ( not ( = ?auto_835519 ?auto_835530 ) ) ( not ( = ?auto_835519 ?auto_835531 ) ) ( not ( = ?auto_835519 ?auto_835532 ) ) ( not ( = ?auto_835519 ?auto_835533 ) ) ( not ( = ?auto_835520 ?auto_835521 ) ) ( not ( = ?auto_835520 ?auto_835522 ) ) ( not ( = ?auto_835520 ?auto_835523 ) ) ( not ( = ?auto_835520 ?auto_835524 ) ) ( not ( = ?auto_835520 ?auto_835525 ) ) ( not ( = ?auto_835520 ?auto_835526 ) ) ( not ( = ?auto_835520 ?auto_835527 ) ) ( not ( = ?auto_835520 ?auto_835528 ) ) ( not ( = ?auto_835520 ?auto_835529 ) ) ( not ( = ?auto_835520 ?auto_835530 ) ) ( not ( = ?auto_835520 ?auto_835531 ) ) ( not ( = ?auto_835520 ?auto_835532 ) ) ( not ( = ?auto_835520 ?auto_835533 ) ) ( not ( = ?auto_835521 ?auto_835522 ) ) ( not ( = ?auto_835521 ?auto_835523 ) ) ( not ( = ?auto_835521 ?auto_835524 ) ) ( not ( = ?auto_835521 ?auto_835525 ) ) ( not ( = ?auto_835521 ?auto_835526 ) ) ( not ( = ?auto_835521 ?auto_835527 ) ) ( not ( = ?auto_835521 ?auto_835528 ) ) ( not ( = ?auto_835521 ?auto_835529 ) ) ( not ( = ?auto_835521 ?auto_835530 ) ) ( not ( = ?auto_835521 ?auto_835531 ) ) ( not ( = ?auto_835521 ?auto_835532 ) ) ( not ( = ?auto_835521 ?auto_835533 ) ) ( not ( = ?auto_835522 ?auto_835523 ) ) ( not ( = ?auto_835522 ?auto_835524 ) ) ( not ( = ?auto_835522 ?auto_835525 ) ) ( not ( = ?auto_835522 ?auto_835526 ) ) ( not ( = ?auto_835522 ?auto_835527 ) ) ( not ( = ?auto_835522 ?auto_835528 ) ) ( not ( = ?auto_835522 ?auto_835529 ) ) ( not ( = ?auto_835522 ?auto_835530 ) ) ( not ( = ?auto_835522 ?auto_835531 ) ) ( not ( = ?auto_835522 ?auto_835532 ) ) ( not ( = ?auto_835522 ?auto_835533 ) ) ( not ( = ?auto_835523 ?auto_835524 ) ) ( not ( = ?auto_835523 ?auto_835525 ) ) ( not ( = ?auto_835523 ?auto_835526 ) ) ( not ( = ?auto_835523 ?auto_835527 ) ) ( not ( = ?auto_835523 ?auto_835528 ) ) ( not ( = ?auto_835523 ?auto_835529 ) ) ( not ( = ?auto_835523 ?auto_835530 ) ) ( not ( = ?auto_835523 ?auto_835531 ) ) ( not ( = ?auto_835523 ?auto_835532 ) ) ( not ( = ?auto_835523 ?auto_835533 ) ) ( not ( = ?auto_835524 ?auto_835525 ) ) ( not ( = ?auto_835524 ?auto_835526 ) ) ( not ( = ?auto_835524 ?auto_835527 ) ) ( not ( = ?auto_835524 ?auto_835528 ) ) ( not ( = ?auto_835524 ?auto_835529 ) ) ( not ( = ?auto_835524 ?auto_835530 ) ) ( not ( = ?auto_835524 ?auto_835531 ) ) ( not ( = ?auto_835524 ?auto_835532 ) ) ( not ( = ?auto_835524 ?auto_835533 ) ) ( not ( = ?auto_835525 ?auto_835526 ) ) ( not ( = ?auto_835525 ?auto_835527 ) ) ( not ( = ?auto_835525 ?auto_835528 ) ) ( not ( = ?auto_835525 ?auto_835529 ) ) ( not ( = ?auto_835525 ?auto_835530 ) ) ( not ( = ?auto_835525 ?auto_835531 ) ) ( not ( = ?auto_835525 ?auto_835532 ) ) ( not ( = ?auto_835525 ?auto_835533 ) ) ( not ( = ?auto_835526 ?auto_835527 ) ) ( not ( = ?auto_835526 ?auto_835528 ) ) ( not ( = ?auto_835526 ?auto_835529 ) ) ( not ( = ?auto_835526 ?auto_835530 ) ) ( not ( = ?auto_835526 ?auto_835531 ) ) ( not ( = ?auto_835526 ?auto_835532 ) ) ( not ( = ?auto_835526 ?auto_835533 ) ) ( not ( = ?auto_835527 ?auto_835528 ) ) ( not ( = ?auto_835527 ?auto_835529 ) ) ( not ( = ?auto_835527 ?auto_835530 ) ) ( not ( = ?auto_835527 ?auto_835531 ) ) ( not ( = ?auto_835527 ?auto_835532 ) ) ( not ( = ?auto_835527 ?auto_835533 ) ) ( not ( = ?auto_835528 ?auto_835529 ) ) ( not ( = ?auto_835528 ?auto_835530 ) ) ( not ( = ?auto_835528 ?auto_835531 ) ) ( not ( = ?auto_835528 ?auto_835532 ) ) ( not ( = ?auto_835528 ?auto_835533 ) ) ( not ( = ?auto_835529 ?auto_835530 ) ) ( not ( = ?auto_835529 ?auto_835531 ) ) ( not ( = ?auto_835529 ?auto_835532 ) ) ( not ( = ?auto_835529 ?auto_835533 ) ) ( not ( = ?auto_835530 ?auto_835531 ) ) ( not ( = ?auto_835530 ?auto_835532 ) ) ( not ( = ?auto_835530 ?auto_835533 ) ) ( not ( = ?auto_835531 ?auto_835532 ) ) ( not ( = ?auto_835531 ?auto_835533 ) ) ( not ( = ?auto_835532 ?auto_835533 ) ) ( ON ?auto_835532 ?auto_835533 ) ( ON ?auto_835531 ?auto_835532 ) ( ON ?auto_835530 ?auto_835531 ) ( ON ?auto_835529 ?auto_835530 ) ( CLEAR ?auto_835527 ) ( ON ?auto_835528 ?auto_835529 ) ( CLEAR ?auto_835528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_835516 ?auto_835517 ?auto_835518 ?auto_835519 ?auto_835520 ?auto_835521 ?auto_835522 ?auto_835523 ?auto_835524 ?auto_835525 ?auto_835526 ?auto_835527 ?auto_835528 )
      ( MAKE-18PILE ?auto_835516 ?auto_835517 ?auto_835518 ?auto_835519 ?auto_835520 ?auto_835521 ?auto_835522 ?auto_835523 ?auto_835524 ?auto_835525 ?auto_835526 ?auto_835527 ?auto_835528 ?auto_835529 ?auto_835530 ?auto_835531 ?auto_835532 ?auto_835533 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_835552 - BLOCK
      ?auto_835553 - BLOCK
      ?auto_835554 - BLOCK
      ?auto_835555 - BLOCK
      ?auto_835556 - BLOCK
      ?auto_835557 - BLOCK
      ?auto_835558 - BLOCK
      ?auto_835559 - BLOCK
      ?auto_835560 - BLOCK
      ?auto_835561 - BLOCK
      ?auto_835562 - BLOCK
      ?auto_835563 - BLOCK
      ?auto_835564 - BLOCK
      ?auto_835565 - BLOCK
      ?auto_835566 - BLOCK
      ?auto_835567 - BLOCK
      ?auto_835568 - BLOCK
      ?auto_835569 - BLOCK
    )
    :vars
    (
      ?auto_835570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_835569 ?auto_835570 ) ( ON-TABLE ?auto_835552 ) ( ON ?auto_835553 ?auto_835552 ) ( ON ?auto_835554 ?auto_835553 ) ( ON ?auto_835555 ?auto_835554 ) ( ON ?auto_835556 ?auto_835555 ) ( ON ?auto_835557 ?auto_835556 ) ( ON ?auto_835558 ?auto_835557 ) ( ON ?auto_835559 ?auto_835558 ) ( ON ?auto_835560 ?auto_835559 ) ( ON ?auto_835561 ?auto_835560 ) ( ON ?auto_835562 ?auto_835561 ) ( not ( = ?auto_835552 ?auto_835553 ) ) ( not ( = ?auto_835552 ?auto_835554 ) ) ( not ( = ?auto_835552 ?auto_835555 ) ) ( not ( = ?auto_835552 ?auto_835556 ) ) ( not ( = ?auto_835552 ?auto_835557 ) ) ( not ( = ?auto_835552 ?auto_835558 ) ) ( not ( = ?auto_835552 ?auto_835559 ) ) ( not ( = ?auto_835552 ?auto_835560 ) ) ( not ( = ?auto_835552 ?auto_835561 ) ) ( not ( = ?auto_835552 ?auto_835562 ) ) ( not ( = ?auto_835552 ?auto_835563 ) ) ( not ( = ?auto_835552 ?auto_835564 ) ) ( not ( = ?auto_835552 ?auto_835565 ) ) ( not ( = ?auto_835552 ?auto_835566 ) ) ( not ( = ?auto_835552 ?auto_835567 ) ) ( not ( = ?auto_835552 ?auto_835568 ) ) ( not ( = ?auto_835552 ?auto_835569 ) ) ( not ( = ?auto_835552 ?auto_835570 ) ) ( not ( = ?auto_835553 ?auto_835554 ) ) ( not ( = ?auto_835553 ?auto_835555 ) ) ( not ( = ?auto_835553 ?auto_835556 ) ) ( not ( = ?auto_835553 ?auto_835557 ) ) ( not ( = ?auto_835553 ?auto_835558 ) ) ( not ( = ?auto_835553 ?auto_835559 ) ) ( not ( = ?auto_835553 ?auto_835560 ) ) ( not ( = ?auto_835553 ?auto_835561 ) ) ( not ( = ?auto_835553 ?auto_835562 ) ) ( not ( = ?auto_835553 ?auto_835563 ) ) ( not ( = ?auto_835553 ?auto_835564 ) ) ( not ( = ?auto_835553 ?auto_835565 ) ) ( not ( = ?auto_835553 ?auto_835566 ) ) ( not ( = ?auto_835553 ?auto_835567 ) ) ( not ( = ?auto_835553 ?auto_835568 ) ) ( not ( = ?auto_835553 ?auto_835569 ) ) ( not ( = ?auto_835553 ?auto_835570 ) ) ( not ( = ?auto_835554 ?auto_835555 ) ) ( not ( = ?auto_835554 ?auto_835556 ) ) ( not ( = ?auto_835554 ?auto_835557 ) ) ( not ( = ?auto_835554 ?auto_835558 ) ) ( not ( = ?auto_835554 ?auto_835559 ) ) ( not ( = ?auto_835554 ?auto_835560 ) ) ( not ( = ?auto_835554 ?auto_835561 ) ) ( not ( = ?auto_835554 ?auto_835562 ) ) ( not ( = ?auto_835554 ?auto_835563 ) ) ( not ( = ?auto_835554 ?auto_835564 ) ) ( not ( = ?auto_835554 ?auto_835565 ) ) ( not ( = ?auto_835554 ?auto_835566 ) ) ( not ( = ?auto_835554 ?auto_835567 ) ) ( not ( = ?auto_835554 ?auto_835568 ) ) ( not ( = ?auto_835554 ?auto_835569 ) ) ( not ( = ?auto_835554 ?auto_835570 ) ) ( not ( = ?auto_835555 ?auto_835556 ) ) ( not ( = ?auto_835555 ?auto_835557 ) ) ( not ( = ?auto_835555 ?auto_835558 ) ) ( not ( = ?auto_835555 ?auto_835559 ) ) ( not ( = ?auto_835555 ?auto_835560 ) ) ( not ( = ?auto_835555 ?auto_835561 ) ) ( not ( = ?auto_835555 ?auto_835562 ) ) ( not ( = ?auto_835555 ?auto_835563 ) ) ( not ( = ?auto_835555 ?auto_835564 ) ) ( not ( = ?auto_835555 ?auto_835565 ) ) ( not ( = ?auto_835555 ?auto_835566 ) ) ( not ( = ?auto_835555 ?auto_835567 ) ) ( not ( = ?auto_835555 ?auto_835568 ) ) ( not ( = ?auto_835555 ?auto_835569 ) ) ( not ( = ?auto_835555 ?auto_835570 ) ) ( not ( = ?auto_835556 ?auto_835557 ) ) ( not ( = ?auto_835556 ?auto_835558 ) ) ( not ( = ?auto_835556 ?auto_835559 ) ) ( not ( = ?auto_835556 ?auto_835560 ) ) ( not ( = ?auto_835556 ?auto_835561 ) ) ( not ( = ?auto_835556 ?auto_835562 ) ) ( not ( = ?auto_835556 ?auto_835563 ) ) ( not ( = ?auto_835556 ?auto_835564 ) ) ( not ( = ?auto_835556 ?auto_835565 ) ) ( not ( = ?auto_835556 ?auto_835566 ) ) ( not ( = ?auto_835556 ?auto_835567 ) ) ( not ( = ?auto_835556 ?auto_835568 ) ) ( not ( = ?auto_835556 ?auto_835569 ) ) ( not ( = ?auto_835556 ?auto_835570 ) ) ( not ( = ?auto_835557 ?auto_835558 ) ) ( not ( = ?auto_835557 ?auto_835559 ) ) ( not ( = ?auto_835557 ?auto_835560 ) ) ( not ( = ?auto_835557 ?auto_835561 ) ) ( not ( = ?auto_835557 ?auto_835562 ) ) ( not ( = ?auto_835557 ?auto_835563 ) ) ( not ( = ?auto_835557 ?auto_835564 ) ) ( not ( = ?auto_835557 ?auto_835565 ) ) ( not ( = ?auto_835557 ?auto_835566 ) ) ( not ( = ?auto_835557 ?auto_835567 ) ) ( not ( = ?auto_835557 ?auto_835568 ) ) ( not ( = ?auto_835557 ?auto_835569 ) ) ( not ( = ?auto_835557 ?auto_835570 ) ) ( not ( = ?auto_835558 ?auto_835559 ) ) ( not ( = ?auto_835558 ?auto_835560 ) ) ( not ( = ?auto_835558 ?auto_835561 ) ) ( not ( = ?auto_835558 ?auto_835562 ) ) ( not ( = ?auto_835558 ?auto_835563 ) ) ( not ( = ?auto_835558 ?auto_835564 ) ) ( not ( = ?auto_835558 ?auto_835565 ) ) ( not ( = ?auto_835558 ?auto_835566 ) ) ( not ( = ?auto_835558 ?auto_835567 ) ) ( not ( = ?auto_835558 ?auto_835568 ) ) ( not ( = ?auto_835558 ?auto_835569 ) ) ( not ( = ?auto_835558 ?auto_835570 ) ) ( not ( = ?auto_835559 ?auto_835560 ) ) ( not ( = ?auto_835559 ?auto_835561 ) ) ( not ( = ?auto_835559 ?auto_835562 ) ) ( not ( = ?auto_835559 ?auto_835563 ) ) ( not ( = ?auto_835559 ?auto_835564 ) ) ( not ( = ?auto_835559 ?auto_835565 ) ) ( not ( = ?auto_835559 ?auto_835566 ) ) ( not ( = ?auto_835559 ?auto_835567 ) ) ( not ( = ?auto_835559 ?auto_835568 ) ) ( not ( = ?auto_835559 ?auto_835569 ) ) ( not ( = ?auto_835559 ?auto_835570 ) ) ( not ( = ?auto_835560 ?auto_835561 ) ) ( not ( = ?auto_835560 ?auto_835562 ) ) ( not ( = ?auto_835560 ?auto_835563 ) ) ( not ( = ?auto_835560 ?auto_835564 ) ) ( not ( = ?auto_835560 ?auto_835565 ) ) ( not ( = ?auto_835560 ?auto_835566 ) ) ( not ( = ?auto_835560 ?auto_835567 ) ) ( not ( = ?auto_835560 ?auto_835568 ) ) ( not ( = ?auto_835560 ?auto_835569 ) ) ( not ( = ?auto_835560 ?auto_835570 ) ) ( not ( = ?auto_835561 ?auto_835562 ) ) ( not ( = ?auto_835561 ?auto_835563 ) ) ( not ( = ?auto_835561 ?auto_835564 ) ) ( not ( = ?auto_835561 ?auto_835565 ) ) ( not ( = ?auto_835561 ?auto_835566 ) ) ( not ( = ?auto_835561 ?auto_835567 ) ) ( not ( = ?auto_835561 ?auto_835568 ) ) ( not ( = ?auto_835561 ?auto_835569 ) ) ( not ( = ?auto_835561 ?auto_835570 ) ) ( not ( = ?auto_835562 ?auto_835563 ) ) ( not ( = ?auto_835562 ?auto_835564 ) ) ( not ( = ?auto_835562 ?auto_835565 ) ) ( not ( = ?auto_835562 ?auto_835566 ) ) ( not ( = ?auto_835562 ?auto_835567 ) ) ( not ( = ?auto_835562 ?auto_835568 ) ) ( not ( = ?auto_835562 ?auto_835569 ) ) ( not ( = ?auto_835562 ?auto_835570 ) ) ( not ( = ?auto_835563 ?auto_835564 ) ) ( not ( = ?auto_835563 ?auto_835565 ) ) ( not ( = ?auto_835563 ?auto_835566 ) ) ( not ( = ?auto_835563 ?auto_835567 ) ) ( not ( = ?auto_835563 ?auto_835568 ) ) ( not ( = ?auto_835563 ?auto_835569 ) ) ( not ( = ?auto_835563 ?auto_835570 ) ) ( not ( = ?auto_835564 ?auto_835565 ) ) ( not ( = ?auto_835564 ?auto_835566 ) ) ( not ( = ?auto_835564 ?auto_835567 ) ) ( not ( = ?auto_835564 ?auto_835568 ) ) ( not ( = ?auto_835564 ?auto_835569 ) ) ( not ( = ?auto_835564 ?auto_835570 ) ) ( not ( = ?auto_835565 ?auto_835566 ) ) ( not ( = ?auto_835565 ?auto_835567 ) ) ( not ( = ?auto_835565 ?auto_835568 ) ) ( not ( = ?auto_835565 ?auto_835569 ) ) ( not ( = ?auto_835565 ?auto_835570 ) ) ( not ( = ?auto_835566 ?auto_835567 ) ) ( not ( = ?auto_835566 ?auto_835568 ) ) ( not ( = ?auto_835566 ?auto_835569 ) ) ( not ( = ?auto_835566 ?auto_835570 ) ) ( not ( = ?auto_835567 ?auto_835568 ) ) ( not ( = ?auto_835567 ?auto_835569 ) ) ( not ( = ?auto_835567 ?auto_835570 ) ) ( not ( = ?auto_835568 ?auto_835569 ) ) ( not ( = ?auto_835568 ?auto_835570 ) ) ( not ( = ?auto_835569 ?auto_835570 ) ) ( ON ?auto_835568 ?auto_835569 ) ( ON ?auto_835567 ?auto_835568 ) ( ON ?auto_835566 ?auto_835567 ) ( ON ?auto_835565 ?auto_835566 ) ( ON ?auto_835564 ?auto_835565 ) ( CLEAR ?auto_835562 ) ( ON ?auto_835563 ?auto_835564 ) ( CLEAR ?auto_835563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_835552 ?auto_835553 ?auto_835554 ?auto_835555 ?auto_835556 ?auto_835557 ?auto_835558 ?auto_835559 ?auto_835560 ?auto_835561 ?auto_835562 ?auto_835563 )
      ( MAKE-18PILE ?auto_835552 ?auto_835553 ?auto_835554 ?auto_835555 ?auto_835556 ?auto_835557 ?auto_835558 ?auto_835559 ?auto_835560 ?auto_835561 ?auto_835562 ?auto_835563 ?auto_835564 ?auto_835565 ?auto_835566 ?auto_835567 ?auto_835568 ?auto_835569 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_835589 - BLOCK
      ?auto_835590 - BLOCK
      ?auto_835591 - BLOCK
      ?auto_835592 - BLOCK
      ?auto_835593 - BLOCK
      ?auto_835594 - BLOCK
      ?auto_835595 - BLOCK
      ?auto_835596 - BLOCK
      ?auto_835597 - BLOCK
      ?auto_835598 - BLOCK
      ?auto_835599 - BLOCK
      ?auto_835600 - BLOCK
      ?auto_835601 - BLOCK
      ?auto_835602 - BLOCK
      ?auto_835603 - BLOCK
      ?auto_835604 - BLOCK
      ?auto_835605 - BLOCK
      ?auto_835606 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_835606 ) ( ON-TABLE ?auto_835589 ) ( ON ?auto_835590 ?auto_835589 ) ( ON ?auto_835591 ?auto_835590 ) ( ON ?auto_835592 ?auto_835591 ) ( ON ?auto_835593 ?auto_835592 ) ( ON ?auto_835594 ?auto_835593 ) ( ON ?auto_835595 ?auto_835594 ) ( ON ?auto_835596 ?auto_835595 ) ( ON ?auto_835597 ?auto_835596 ) ( ON ?auto_835598 ?auto_835597 ) ( ON ?auto_835599 ?auto_835598 ) ( not ( = ?auto_835589 ?auto_835590 ) ) ( not ( = ?auto_835589 ?auto_835591 ) ) ( not ( = ?auto_835589 ?auto_835592 ) ) ( not ( = ?auto_835589 ?auto_835593 ) ) ( not ( = ?auto_835589 ?auto_835594 ) ) ( not ( = ?auto_835589 ?auto_835595 ) ) ( not ( = ?auto_835589 ?auto_835596 ) ) ( not ( = ?auto_835589 ?auto_835597 ) ) ( not ( = ?auto_835589 ?auto_835598 ) ) ( not ( = ?auto_835589 ?auto_835599 ) ) ( not ( = ?auto_835589 ?auto_835600 ) ) ( not ( = ?auto_835589 ?auto_835601 ) ) ( not ( = ?auto_835589 ?auto_835602 ) ) ( not ( = ?auto_835589 ?auto_835603 ) ) ( not ( = ?auto_835589 ?auto_835604 ) ) ( not ( = ?auto_835589 ?auto_835605 ) ) ( not ( = ?auto_835589 ?auto_835606 ) ) ( not ( = ?auto_835590 ?auto_835591 ) ) ( not ( = ?auto_835590 ?auto_835592 ) ) ( not ( = ?auto_835590 ?auto_835593 ) ) ( not ( = ?auto_835590 ?auto_835594 ) ) ( not ( = ?auto_835590 ?auto_835595 ) ) ( not ( = ?auto_835590 ?auto_835596 ) ) ( not ( = ?auto_835590 ?auto_835597 ) ) ( not ( = ?auto_835590 ?auto_835598 ) ) ( not ( = ?auto_835590 ?auto_835599 ) ) ( not ( = ?auto_835590 ?auto_835600 ) ) ( not ( = ?auto_835590 ?auto_835601 ) ) ( not ( = ?auto_835590 ?auto_835602 ) ) ( not ( = ?auto_835590 ?auto_835603 ) ) ( not ( = ?auto_835590 ?auto_835604 ) ) ( not ( = ?auto_835590 ?auto_835605 ) ) ( not ( = ?auto_835590 ?auto_835606 ) ) ( not ( = ?auto_835591 ?auto_835592 ) ) ( not ( = ?auto_835591 ?auto_835593 ) ) ( not ( = ?auto_835591 ?auto_835594 ) ) ( not ( = ?auto_835591 ?auto_835595 ) ) ( not ( = ?auto_835591 ?auto_835596 ) ) ( not ( = ?auto_835591 ?auto_835597 ) ) ( not ( = ?auto_835591 ?auto_835598 ) ) ( not ( = ?auto_835591 ?auto_835599 ) ) ( not ( = ?auto_835591 ?auto_835600 ) ) ( not ( = ?auto_835591 ?auto_835601 ) ) ( not ( = ?auto_835591 ?auto_835602 ) ) ( not ( = ?auto_835591 ?auto_835603 ) ) ( not ( = ?auto_835591 ?auto_835604 ) ) ( not ( = ?auto_835591 ?auto_835605 ) ) ( not ( = ?auto_835591 ?auto_835606 ) ) ( not ( = ?auto_835592 ?auto_835593 ) ) ( not ( = ?auto_835592 ?auto_835594 ) ) ( not ( = ?auto_835592 ?auto_835595 ) ) ( not ( = ?auto_835592 ?auto_835596 ) ) ( not ( = ?auto_835592 ?auto_835597 ) ) ( not ( = ?auto_835592 ?auto_835598 ) ) ( not ( = ?auto_835592 ?auto_835599 ) ) ( not ( = ?auto_835592 ?auto_835600 ) ) ( not ( = ?auto_835592 ?auto_835601 ) ) ( not ( = ?auto_835592 ?auto_835602 ) ) ( not ( = ?auto_835592 ?auto_835603 ) ) ( not ( = ?auto_835592 ?auto_835604 ) ) ( not ( = ?auto_835592 ?auto_835605 ) ) ( not ( = ?auto_835592 ?auto_835606 ) ) ( not ( = ?auto_835593 ?auto_835594 ) ) ( not ( = ?auto_835593 ?auto_835595 ) ) ( not ( = ?auto_835593 ?auto_835596 ) ) ( not ( = ?auto_835593 ?auto_835597 ) ) ( not ( = ?auto_835593 ?auto_835598 ) ) ( not ( = ?auto_835593 ?auto_835599 ) ) ( not ( = ?auto_835593 ?auto_835600 ) ) ( not ( = ?auto_835593 ?auto_835601 ) ) ( not ( = ?auto_835593 ?auto_835602 ) ) ( not ( = ?auto_835593 ?auto_835603 ) ) ( not ( = ?auto_835593 ?auto_835604 ) ) ( not ( = ?auto_835593 ?auto_835605 ) ) ( not ( = ?auto_835593 ?auto_835606 ) ) ( not ( = ?auto_835594 ?auto_835595 ) ) ( not ( = ?auto_835594 ?auto_835596 ) ) ( not ( = ?auto_835594 ?auto_835597 ) ) ( not ( = ?auto_835594 ?auto_835598 ) ) ( not ( = ?auto_835594 ?auto_835599 ) ) ( not ( = ?auto_835594 ?auto_835600 ) ) ( not ( = ?auto_835594 ?auto_835601 ) ) ( not ( = ?auto_835594 ?auto_835602 ) ) ( not ( = ?auto_835594 ?auto_835603 ) ) ( not ( = ?auto_835594 ?auto_835604 ) ) ( not ( = ?auto_835594 ?auto_835605 ) ) ( not ( = ?auto_835594 ?auto_835606 ) ) ( not ( = ?auto_835595 ?auto_835596 ) ) ( not ( = ?auto_835595 ?auto_835597 ) ) ( not ( = ?auto_835595 ?auto_835598 ) ) ( not ( = ?auto_835595 ?auto_835599 ) ) ( not ( = ?auto_835595 ?auto_835600 ) ) ( not ( = ?auto_835595 ?auto_835601 ) ) ( not ( = ?auto_835595 ?auto_835602 ) ) ( not ( = ?auto_835595 ?auto_835603 ) ) ( not ( = ?auto_835595 ?auto_835604 ) ) ( not ( = ?auto_835595 ?auto_835605 ) ) ( not ( = ?auto_835595 ?auto_835606 ) ) ( not ( = ?auto_835596 ?auto_835597 ) ) ( not ( = ?auto_835596 ?auto_835598 ) ) ( not ( = ?auto_835596 ?auto_835599 ) ) ( not ( = ?auto_835596 ?auto_835600 ) ) ( not ( = ?auto_835596 ?auto_835601 ) ) ( not ( = ?auto_835596 ?auto_835602 ) ) ( not ( = ?auto_835596 ?auto_835603 ) ) ( not ( = ?auto_835596 ?auto_835604 ) ) ( not ( = ?auto_835596 ?auto_835605 ) ) ( not ( = ?auto_835596 ?auto_835606 ) ) ( not ( = ?auto_835597 ?auto_835598 ) ) ( not ( = ?auto_835597 ?auto_835599 ) ) ( not ( = ?auto_835597 ?auto_835600 ) ) ( not ( = ?auto_835597 ?auto_835601 ) ) ( not ( = ?auto_835597 ?auto_835602 ) ) ( not ( = ?auto_835597 ?auto_835603 ) ) ( not ( = ?auto_835597 ?auto_835604 ) ) ( not ( = ?auto_835597 ?auto_835605 ) ) ( not ( = ?auto_835597 ?auto_835606 ) ) ( not ( = ?auto_835598 ?auto_835599 ) ) ( not ( = ?auto_835598 ?auto_835600 ) ) ( not ( = ?auto_835598 ?auto_835601 ) ) ( not ( = ?auto_835598 ?auto_835602 ) ) ( not ( = ?auto_835598 ?auto_835603 ) ) ( not ( = ?auto_835598 ?auto_835604 ) ) ( not ( = ?auto_835598 ?auto_835605 ) ) ( not ( = ?auto_835598 ?auto_835606 ) ) ( not ( = ?auto_835599 ?auto_835600 ) ) ( not ( = ?auto_835599 ?auto_835601 ) ) ( not ( = ?auto_835599 ?auto_835602 ) ) ( not ( = ?auto_835599 ?auto_835603 ) ) ( not ( = ?auto_835599 ?auto_835604 ) ) ( not ( = ?auto_835599 ?auto_835605 ) ) ( not ( = ?auto_835599 ?auto_835606 ) ) ( not ( = ?auto_835600 ?auto_835601 ) ) ( not ( = ?auto_835600 ?auto_835602 ) ) ( not ( = ?auto_835600 ?auto_835603 ) ) ( not ( = ?auto_835600 ?auto_835604 ) ) ( not ( = ?auto_835600 ?auto_835605 ) ) ( not ( = ?auto_835600 ?auto_835606 ) ) ( not ( = ?auto_835601 ?auto_835602 ) ) ( not ( = ?auto_835601 ?auto_835603 ) ) ( not ( = ?auto_835601 ?auto_835604 ) ) ( not ( = ?auto_835601 ?auto_835605 ) ) ( not ( = ?auto_835601 ?auto_835606 ) ) ( not ( = ?auto_835602 ?auto_835603 ) ) ( not ( = ?auto_835602 ?auto_835604 ) ) ( not ( = ?auto_835602 ?auto_835605 ) ) ( not ( = ?auto_835602 ?auto_835606 ) ) ( not ( = ?auto_835603 ?auto_835604 ) ) ( not ( = ?auto_835603 ?auto_835605 ) ) ( not ( = ?auto_835603 ?auto_835606 ) ) ( not ( = ?auto_835604 ?auto_835605 ) ) ( not ( = ?auto_835604 ?auto_835606 ) ) ( not ( = ?auto_835605 ?auto_835606 ) ) ( ON ?auto_835605 ?auto_835606 ) ( ON ?auto_835604 ?auto_835605 ) ( ON ?auto_835603 ?auto_835604 ) ( ON ?auto_835602 ?auto_835603 ) ( ON ?auto_835601 ?auto_835602 ) ( CLEAR ?auto_835599 ) ( ON ?auto_835600 ?auto_835601 ) ( CLEAR ?auto_835600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_835589 ?auto_835590 ?auto_835591 ?auto_835592 ?auto_835593 ?auto_835594 ?auto_835595 ?auto_835596 ?auto_835597 ?auto_835598 ?auto_835599 ?auto_835600 )
      ( MAKE-18PILE ?auto_835589 ?auto_835590 ?auto_835591 ?auto_835592 ?auto_835593 ?auto_835594 ?auto_835595 ?auto_835596 ?auto_835597 ?auto_835598 ?auto_835599 ?auto_835600 ?auto_835601 ?auto_835602 ?auto_835603 ?auto_835604 ?auto_835605 ?auto_835606 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_835625 - BLOCK
      ?auto_835626 - BLOCK
      ?auto_835627 - BLOCK
      ?auto_835628 - BLOCK
      ?auto_835629 - BLOCK
      ?auto_835630 - BLOCK
      ?auto_835631 - BLOCK
      ?auto_835632 - BLOCK
      ?auto_835633 - BLOCK
      ?auto_835634 - BLOCK
      ?auto_835635 - BLOCK
      ?auto_835636 - BLOCK
      ?auto_835637 - BLOCK
      ?auto_835638 - BLOCK
      ?auto_835639 - BLOCK
      ?auto_835640 - BLOCK
      ?auto_835641 - BLOCK
      ?auto_835642 - BLOCK
    )
    :vars
    (
      ?auto_835643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_835642 ?auto_835643 ) ( ON-TABLE ?auto_835625 ) ( ON ?auto_835626 ?auto_835625 ) ( ON ?auto_835627 ?auto_835626 ) ( ON ?auto_835628 ?auto_835627 ) ( ON ?auto_835629 ?auto_835628 ) ( ON ?auto_835630 ?auto_835629 ) ( ON ?auto_835631 ?auto_835630 ) ( ON ?auto_835632 ?auto_835631 ) ( ON ?auto_835633 ?auto_835632 ) ( ON ?auto_835634 ?auto_835633 ) ( not ( = ?auto_835625 ?auto_835626 ) ) ( not ( = ?auto_835625 ?auto_835627 ) ) ( not ( = ?auto_835625 ?auto_835628 ) ) ( not ( = ?auto_835625 ?auto_835629 ) ) ( not ( = ?auto_835625 ?auto_835630 ) ) ( not ( = ?auto_835625 ?auto_835631 ) ) ( not ( = ?auto_835625 ?auto_835632 ) ) ( not ( = ?auto_835625 ?auto_835633 ) ) ( not ( = ?auto_835625 ?auto_835634 ) ) ( not ( = ?auto_835625 ?auto_835635 ) ) ( not ( = ?auto_835625 ?auto_835636 ) ) ( not ( = ?auto_835625 ?auto_835637 ) ) ( not ( = ?auto_835625 ?auto_835638 ) ) ( not ( = ?auto_835625 ?auto_835639 ) ) ( not ( = ?auto_835625 ?auto_835640 ) ) ( not ( = ?auto_835625 ?auto_835641 ) ) ( not ( = ?auto_835625 ?auto_835642 ) ) ( not ( = ?auto_835625 ?auto_835643 ) ) ( not ( = ?auto_835626 ?auto_835627 ) ) ( not ( = ?auto_835626 ?auto_835628 ) ) ( not ( = ?auto_835626 ?auto_835629 ) ) ( not ( = ?auto_835626 ?auto_835630 ) ) ( not ( = ?auto_835626 ?auto_835631 ) ) ( not ( = ?auto_835626 ?auto_835632 ) ) ( not ( = ?auto_835626 ?auto_835633 ) ) ( not ( = ?auto_835626 ?auto_835634 ) ) ( not ( = ?auto_835626 ?auto_835635 ) ) ( not ( = ?auto_835626 ?auto_835636 ) ) ( not ( = ?auto_835626 ?auto_835637 ) ) ( not ( = ?auto_835626 ?auto_835638 ) ) ( not ( = ?auto_835626 ?auto_835639 ) ) ( not ( = ?auto_835626 ?auto_835640 ) ) ( not ( = ?auto_835626 ?auto_835641 ) ) ( not ( = ?auto_835626 ?auto_835642 ) ) ( not ( = ?auto_835626 ?auto_835643 ) ) ( not ( = ?auto_835627 ?auto_835628 ) ) ( not ( = ?auto_835627 ?auto_835629 ) ) ( not ( = ?auto_835627 ?auto_835630 ) ) ( not ( = ?auto_835627 ?auto_835631 ) ) ( not ( = ?auto_835627 ?auto_835632 ) ) ( not ( = ?auto_835627 ?auto_835633 ) ) ( not ( = ?auto_835627 ?auto_835634 ) ) ( not ( = ?auto_835627 ?auto_835635 ) ) ( not ( = ?auto_835627 ?auto_835636 ) ) ( not ( = ?auto_835627 ?auto_835637 ) ) ( not ( = ?auto_835627 ?auto_835638 ) ) ( not ( = ?auto_835627 ?auto_835639 ) ) ( not ( = ?auto_835627 ?auto_835640 ) ) ( not ( = ?auto_835627 ?auto_835641 ) ) ( not ( = ?auto_835627 ?auto_835642 ) ) ( not ( = ?auto_835627 ?auto_835643 ) ) ( not ( = ?auto_835628 ?auto_835629 ) ) ( not ( = ?auto_835628 ?auto_835630 ) ) ( not ( = ?auto_835628 ?auto_835631 ) ) ( not ( = ?auto_835628 ?auto_835632 ) ) ( not ( = ?auto_835628 ?auto_835633 ) ) ( not ( = ?auto_835628 ?auto_835634 ) ) ( not ( = ?auto_835628 ?auto_835635 ) ) ( not ( = ?auto_835628 ?auto_835636 ) ) ( not ( = ?auto_835628 ?auto_835637 ) ) ( not ( = ?auto_835628 ?auto_835638 ) ) ( not ( = ?auto_835628 ?auto_835639 ) ) ( not ( = ?auto_835628 ?auto_835640 ) ) ( not ( = ?auto_835628 ?auto_835641 ) ) ( not ( = ?auto_835628 ?auto_835642 ) ) ( not ( = ?auto_835628 ?auto_835643 ) ) ( not ( = ?auto_835629 ?auto_835630 ) ) ( not ( = ?auto_835629 ?auto_835631 ) ) ( not ( = ?auto_835629 ?auto_835632 ) ) ( not ( = ?auto_835629 ?auto_835633 ) ) ( not ( = ?auto_835629 ?auto_835634 ) ) ( not ( = ?auto_835629 ?auto_835635 ) ) ( not ( = ?auto_835629 ?auto_835636 ) ) ( not ( = ?auto_835629 ?auto_835637 ) ) ( not ( = ?auto_835629 ?auto_835638 ) ) ( not ( = ?auto_835629 ?auto_835639 ) ) ( not ( = ?auto_835629 ?auto_835640 ) ) ( not ( = ?auto_835629 ?auto_835641 ) ) ( not ( = ?auto_835629 ?auto_835642 ) ) ( not ( = ?auto_835629 ?auto_835643 ) ) ( not ( = ?auto_835630 ?auto_835631 ) ) ( not ( = ?auto_835630 ?auto_835632 ) ) ( not ( = ?auto_835630 ?auto_835633 ) ) ( not ( = ?auto_835630 ?auto_835634 ) ) ( not ( = ?auto_835630 ?auto_835635 ) ) ( not ( = ?auto_835630 ?auto_835636 ) ) ( not ( = ?auto_835630 ?auto_835637 ) ) ( not ( = ?auto_835630 ?auto_835638 ) ) ( not ( = ?auto_835630 ?auto_835639 ) ) ( not ( = ?auto_835630 ?auto_835640 ) ) ( not ( = ?auto_835630 ?auto_835641 ) ) ( not ( = ?auto_835630 ?auto_835642 ) ) ( not ( = ?auto_835630 ?auto_835643 ) ) ( not ( = ?auto_835631 ?auto_835632 ) ) ( not ( = ?auto_835631 ?auto_835633 ) ) ( not ( = ?auto_835631 ?auto_835634 ) ) ( not ( = ?auto_835631 ?auto_835635 ) ) ( not ( = ?auto_835631 ?auto_835636 ) ) ( not ( = ?auto_835631 ?auto_835637 ) ) ( not ( = ?auto_835631 ?auto_835638 ) ) ( not ( = ?auto_835631 ?auto_835639 ) ) ( not ( = ?auto_835631 ?auto_835640 ) ) ( not ( = ?auto_835631 ?auto_835641 ) ) ( not ( = ?auto_835631 ?auto_835642 ) ) ( not ( = ?auto_835631 ?auto_835643 ) ) ( not ( = ?auto_835632 ?auto_835633 ) ) ( not ( = ?auto_835632 ?auto_835634 ) ) ( not ( = ?auto_835632 ?auto_835635 ) ) ( not ( = ?auto_835632 ?auto_835636 ) ) ( not ( = ?auto_835632 ?auto_835637 ) ) ( not ( = ?auto_835632 ?auto_835638 ) ) ( not ( = ?auto_835632 ?auto_835639 ) ) ( not ( = ?auto_835632 ?auto_835640 ) ) ( not ( = ?auto_835632 ?auto_835641 ) ) ( not ( = ?auto_835632 ?auto_835642 ) ) ( not ( = ?auto_835632 ?auto_835643 ) ) ( not ( = ?auto_835633 ?auto_835634 ) ) ( not ( = ?auto_835633 ?auto_835635 ) ) ( not ( = ?auto_835633 ?auto_835636 ) ) ( not ( = ?auto_835633 ?auto_835637 ) ) ( not ( = ?auto_835633 ?auto_835638 ) ) ( not ( = ?auto_835633 ?auto_835639 ) ) ( not ( = ?auto_835633 ?auto_835640 ) ) ( not ( = ?auto_835633 ?auto_835641 ) ) ( not ( = ?auto_835633 ?auto_835642 ) ) ( not ( = ?auto_835633 ?auto_835643 ) ) ( not ( = ?auto_835634 ?auto_835635 ) ) ( not ( = ?auto_835634 ?auto_835636 ) ) ( not ( = ?auto_835634 ?auto_835637 ) ) ( not ( = ?auto_835634 ?auto_835638 ) ) ( not ( = ?auto_835634 ?auto_835639 ) ) ( not ( = ?auto_835634 ?auto_835640 ) ) ( not ( = ?auto_835634 ?auto_835641 ) ) ( not ( = ?auto_835634 ?auto_835642 ) ) ( not ( = ?auto_835634 ?auto_835643 ) ) ( not ( = ?auto_835635 ?auto_835636 ) ) ( not ( = ?auto_835635 ?auto_835637 ) ) ( not ( = ?auto_835635 ?auto_835638 ) ) ( not ( = ?auto_835635 ?auto_835639 ) ) ( not ( = ?auto_835635 ?auto_835640 ) ) ( not ( = ?auto_835635 ?auto_835641 ) ) ( not ( = ?auto_835635 ?auto_835642 ) ) ( not ( = ?auto_835635 ?auto_835643 ) ) ( not ( = ?auto_835636 ?auto_835637 ) ) ( not ( = ?auto_835636 ?auto_835638 ) ) ( not ( = ?auto_835636 ?auto_835639 ) ) ( not ( = ?auto_835636 ?auto_835640 ) ) ( not ( = ?auto_835636 ?auto_835641 ) ) ( not ( = ?auto_835636 ?auto_835642 ) ) ( not ( = ?auto_835636 ?auto_835643 ) ) ( not ( = ?auto_835637 ?auto_835638 ) ) ( not ( = ?auto_835637 ?auto_835639 ) ) ( not ( = ?auto_835637 ?auto_835640 ) ) ( not ( = ?auto_835637 ?auto_835641 ) ) ( not ( = ?auto_835637 ?auto_835642 ) ) ( not ( = ?auto_835637 ?auto_835643 ) ) ( not ( = ?auto_835638 ?auto_835639 ) ) ( not ( = ?auto_835638 ?auto_835640 ) ) ( not ( = ?auto_835638 ?auto_835641 ) ) ( not ( = ?auto_835638 ?auto_835642 ) ) ( not ( = ?auto_835638 ?auto_835643 ) ) ( not ( = ?auto_835639 ?auto_835640 ) ) ( not ( = ?auto_835639 ?auto_835641 ) ) ( not ( = ?auto_835639 ?auto_835642 ) ) ( not ( = ?auto_835639 ?auto_835643 ) ) ( not ( = ?auto_835640 ?auto_835641 ) ) ( not ( = ?auto_835640 ?auto_835642 ) ) ( not ( = ?auto_835640 ?auto_835643 ) ) ( not ( = ?auto_835641 ?auto_835642 ) ) ( not ( = ?auto_835641 ?auto_835643 ) ) ( not ( = ?auto_835642 ?auto_835643 ) ) ( ON ?auto_835641 ?auto_835642 ) ( ON ?auto_835640 ?auto_835641 ) ( ON ?auto_835639 ?auto_835640 ) ( ON ?auto_835638 ?auto_835639 ) ( ON ?auto_835637 ?auto_835638 ) ( ON ?auto_835636 ?auto_835637 ) ( CLEAR ?auto_835634 ) ( ON ?auto_835635 ?auto_835636 ) ( CLEAR ?auto_835635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_835625 ?auto_835626 ?auto_835627 ?auto_835628 ?auto_835629 ?auto_835630 ?auto_835631 ?auto_835632 ?auto_835633 ?auto_835634 ?auto_835635 )
      ( MAKE-18PILE ?auto_835625 ?auto_835626 ?auto_835627 ?auto_835628 ?auto_835629 ?auto_835630 ?auto_835631 ?auto_835632 ?auto_835633 ?auto_835634 ?auto_835635 ?auto_835636 ?auto_835637 ?auto_835638 ?auto_835639 ?auto_835640 ?auto_835641 ?auto_835642 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_835662 - BLOCK
      ?auto_835663 - BLOCK
      ?auto_835664 - BLOCK
      ?auto_835665 - BLOCK
      ?auto_835666 - BLOCK
      ?auto_835667 - BLOCK
      ?auto_835668 - BLOCK
      ?auto_835669 - BLOCK
      ?auto_835670 - BLOCK
      ?auto_835671 - BLOCK
      ?auto_835672 - BLOCK
      ?auto_835673 - BLOCK
      ?auto_835674 - BLOCK
      ?auto_835675 - BLOCK
      ?auto_835676 - BLOCK
      ?auto_835677 - BLOCK
      ?auto_835678 - BLOCK
      ?auto_835679 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_835679 ) ( ON-TABLE ?auto_835662 ) ( ON ?auto_835663 ?auto_835662 ) ( ON ?auto_835664 ?auto_835663 ) ( ON ?auto_835665 ?auto_835664 ) ( ON ?auto_835666 ?auto_835665 ) ( ON ?auto_835667 ?auto_835666 ) ( ON ?auto_835668 ?auto_835667 ) ( ON ?auto_835669 ?auto_835668 ) ( ON ?auto_835670 ?auto_835669 ) ( ON ?auto_835671 ?auto_835670 ) ( not ( = ?auto_835662 ?auto_835663 ) ) ( not ( = ?auto_835662 ?auto_835664 ) ) ( not ( = ?auto_835662 ?auto_835665 ) ) ( not ( = ?auto_835662 ?auto_835666 ) ) ( not ( = ?auto_835662 ?auto_835667 ) ) ( not ( = ?auto_835662 ?auto_835668 ) ) ( not ( = ?auto_835662 ?auto_835669 ) ) ( not ( = ?auto_835662 ?auto_835670 ) ) ( not ( = ?auto_835662 ?auto_835671 ) ) ( not ( = ?auto_835662 ?auto_835672 ) ) ( not ( = ?auto_835662 ?auto_835673 ) ) ( not ( = ?auto_835662 ?auto_835674 ) ) ( not ( = ?auto_835662 ?auto_835675 ) ) ( not ( = ?auto_835662 ?auto_835676 ) ) ( not ( = ?auto_835662 ?auto_835677 ) ) ( not ( = ?auto_835662 ?auto_835678 ) ) ( not ( = ?auto_835662 ?auto_835679 ) ) ( not ( = ?auto_835663 ?auto_835664 ) ) ( not ( = ?auto_835663 ?auto_835665 ) ) ( not ( = ?auto_835663 ?auto_835666 ) ) ( not ( = ?auto_835663 ?auto_835667 ) ) ( not ( = ?auto_835663 ?auto_835668 ) ) ( not ( = ?auto_835663 ?auto_835669 ) ) ( not ( = ?auto_835663 ?auto_835670 ) ) ( not ( = ?auto_835663 ?auto_835671 ) ) ( not ( = ?auto_835663 ?auto_835672 ) ) ( not ( = ?auto_835663 ?auto_835673 ) ) ( not ( = ?auto_835663 ?auto_835674 ) ) ( not ( = ?auto_835663 ?auto_835675 ) ) ( not ( = ?auto_835663 ?auto_835676 ) ) ( not ( = ?auto_835663 ?auto_835677 ) ) ( not ( = ?auto_835663 ?auto_835678 ) ) ( not ( = ?auto_835663 ?auto_835679 ) ) ( not ( = ?auto_835664 ?auto_835665 ) ) ( not ( = ?auto_835664 ?auto_835666 ) ) ( not ( = ?auto_835664 ?auto_835667 ) ) ( not ( = ?auto_835664 ?auto_835668 ) ) ( not ( = ?auto_835664 ?auto_835669 ) ) ( not ( = ?auto_835664 ?auto_835670 ) ) ( not ( = ?auto_835664 ?auto_835671 ) ) ( not ( = ?auto_835664 ?auto_835672 ) ) ( not ( = ?auto_835664 ?auto_835673 ) ) ( not ( = ?auto_835664 ?auto_835674 ) ) ( not ( = ?auto_835664 ?auto_835675 ) ) ( not ( = ?auto_835664 ?auto_835676 ) ) ( not ( = ?auto_835664 ?auto_835677 ) ) ( not ( = ?auto_835664 ?auto_835678 ) ) ( not ( = ?auto_835664 ?auto_835679 ) ) ( not ( = ?auto_835665 ?auto_835666 ) ) ( not ( = ?auto_835665 ?auto_835667 ) ) ( not ( = ?auto_835665 ?auto_835668 ) ) ( not ( = ?auto_835665 ?auto_835669 ) ) ( not ( = ?auto_835665 ?auto_835670 ) ) ( not ( = ?auto_835665 ?auto_835671 ) ) ( not ( = ?auto_835665 ?auto_835672 ) ) ( not ( = ?auto_835665 ?auto_835673 ) ) ( not ( = ?auto_835665 ?auto_835674 ) ) ( not ( = ?auto_835665 ?auto_835675 ) ) ( not ( = ?auto_835665 ?auto_835676 ) ) ( not ( = ?auto_835665 ?auto_835677 ) ) ( not ( = ?auto_835665 ?auto_835678 ) ) ( not ( = ?auto_835665 ?auto_835679 ) ) ( not ( = ?auto_835666 ?auto_835667 ) ) ( not ( = ?auto_835666 ?auto_835668 ) ) ( not ( = ?auto_835666 ?auto_835669 ) ) ( not ( = ?auto_835666 ?auto_835670 ) ) ( not ( = ?auto_835666 ?auto_835671 ) ) ( not ( = ?auto_835666 ?auto_835672 ) ) ( not ( = ?auto_835666 ?auto_835673 ) ) ( not ( = ?auto_835666 ?auto_835674 ) ) ( not ( = ?auto_835666 ?auto_835675 ) ) ( not ( = ?auto_835666 ?auto_835676 ) ) ( not ( = ?auto_835666 ?auto_835677 ) ) ( not ( = ?auto_835666 ?auto_835678 ) ) ( not ( = ?auto_835666 ?auto_835679 ) ) ( not ( = ?auto_835667 ?auto_835668 ) ) ( not ( = ?auto_835667 ?auto_835669 ) ) ( not ( = ?auto_835667 ?auto_835670 ) ) ( not ( = ?auto_835667 ?auto_835671 ) ) ( not ( = ?auto_835667 ?auto_835672 ) ) ( not ( = ?auto_835667 ?auto_835673 ) ) ( not ( = ?auto_835667 ?auto_835674 ) ) ( not ( = ?auto_835667 ?auto_835675 ) ) ( not ( = ?auto_835667 ?auto_835676 ) ) ( not ( = ?auto_835667 ?auto_835677 ) ) ( not ( = ?auto_835667 ?auto_835678 ) ) ( not ( = ?auto_835667 ?auto_835679 ) ) ( not ( = ?auto_835668 ?auto_835669 ) ) ( not ( = ?auto_835668 ?auto_835670 ) ) ( not ( = ?auto_835668 ?auto_835671 ) ) ( not ( = ?auto_835668 ?auto_835672 ) ) ( not ( = ?auto_835668 ?auto_835673 ) ) ( not ( = ?auto_835668 ?auto_835674 ) ) ( not ( = ?auto_835668 ?auto_835675 ) ) ( not ( = ?auto_835668 ?auto_835676 ) ) ( not ( = ?auto_835668 ?auto_835677 ) ) ( not ( = ?auto_835668 ?auto_835678 ) ) ( not ( = ?auto_835668 ?auto_835679 ) ) ( not ( = ?auto_835669 ?auto_835670 ) ) ( not ( = ?auto_835669 ?auto_835671 ) ) ( not ( = ?auto_835669 ?auto_835672 ) ) ( not ( = ?auto_835669 ?auto_835673 ) ) ( not ( = ?auto_835669 ?auto_835674 ) ) ( not ( = ?auto_835669 ?auto_835675 ) ) ( not ( = ?auto_835669 ?auto_835676 ) ) ( not ( = ?auto_835669 ?auto_835677 ) ) ( not ( = ?auto_835669 ?auto_835678 ) ) ( not ( = ?auto_835669 ?auto_835679 ) ) ( not ( = ?auto_835670 ?auto_835671 ) ) ( not ( = ?auto_835670 ?auto_835672 ) ) ( not ( = ?auto_835670 ?auto_835673 ) ) ( not ( = ?auto_835670 ?auto_835674 ) ) ( not ( = ?auto_835670 ?auto_835675 ) ) ( not ( = ?auto_835670 ?auto_835676 ) ) ( not ( = ?auto_835670 ?auto_835677 ) ) ( not ( = ?auto_835670 ?auto_835678 ) ) ( not ( = ?auto_835670 ?auto_835679 ) ) ( not ( = ?auto_835671 ?auto_835672 ) ) ( not ( = ?auto_835671 ?auto_835673 ) ) ( not ( = ?auto_835671 ?auto_835674 ) ) ( not ( = ?auto_835671 ?auto_835675 ) ) ( not ( = ?auto_835671 ?auto_835676 ) ) ( not ( = ?auto_835671 ?auto_835677 ) ) ( not ( = ?auto_835671 ?auto_835678 ) ) ( not ( = ?auto_835671 ?auto_835679 ) ) ( not ( = ?auto_835672 ?auto_835673 ) ) ( not ( = ?auto_835672 ?auto_835674 ) ) ( not ( = ?auto_835672 ?auto_835675 ) ) ( not ( = ?auto_835672 ?auto_835676 ) ) ( not ( = ?auto_835672 ?auto_835677 ) ) ( not ( = ?auto_835672 ?auto_835678 ) ) ( not ( = ?auto_835672 ?auto_835679 ) ) ( not ( = ?auto_835673 ?auto_835674 ) ) ( not ( = ?auto_835673 ?auto_835675 ) ) ( not ( = ?auto_835673 ?auto_835676 ) ) ( not ( = ?auto_835673 ?auto_835677 ) ) ( not ( = ?auto_835673 ?auto_835678 ) ) ( not ( = ?auto_835673 ?auto_835679 ) ) ( not ( = ?auto_835674 ?auto_835675 ) ) ( not ( = ?auto_835674 ?auto_835676 ) ) ( not ( = ?auto_835674 ?auto_835677 ) ) ( not ( = ?auto_835674 ?auto_835678 ) ) ( not ( = ?auto_835674 ?auto_835679 ) ) ( not ( = ?auto_835675 ?auto_835676 ) ) ( not ( = ?auto_835675 ?auto_835677 ) ) ( not ( = ?auto_835675 ?auto_835678 ) ) ( not ( = ?auto_835675 ?auto_835679 ) ) ( not ( = ?auto_835676 ?auto_835677 ) ) ( not ( = ?auto_835676 ?auto_835678 ) ) ( not ( = ?auto_835676 ?auto_835679 ) ) ( not ( = ?auto_835677 ?auto_835678 ) ) ( not ( = ?auto_835677 ?auto_835679 ) ) ( not ( = ?auto_835678 ?auto_835679 ) ) ( ON ?auto_835678 ?auto_835679 ) ( ON ?auto_835677 ?auto_835678 ) ( ON ?auto_835676 ?auto_835677 ) ( ON ?auto_835675 ?auto_835676 ) ( ON ?auto_835674 ?auto_835675 ) ( ON ?auto_835673 ?auto_835674 ) ( CLEAR ?auto_835671 ) ( ON ?auto_835672 ?auto_835673 ) ( CLEAR ?auto_835672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_835662 ?auto_835663 ?auto_835664 ?auto_835665 ?auto_835666 ?auto_835667 ?auto_835668 ?auto_835669 ?auto_835670 ?auto_835671 ?auto_835672 )
      ( MAKE-18PILE ?auto_835662 ?auto_835663 ?auto_835664 ?auto_835665 ?auto_835666 ?auto_835667 ?auto_835668 ?auto_835669 ?auto_835670 ?auto_835671 ?auto_835672 ?auto_835673 ?auto_835674 ?auto_835675 ?auto_835676 ?auto_835677 ?auto_835678 ?auto_835679 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_835698 - BLOCK
      ?auto_835699 - BLOCK
      ?auto_835700 - BLOCK
      ?auto_835701 - BLOCK
      ?auto_835702 - BLOCK
      ?auto_835703 - BLOCK
      ?auto_835704 - BLOCK
      ?auto_835705 - BLOCK
      ?auto_835706 - BLOCK
      ?auto_835707 - BLOCK
      ?auto_835708 - BLOCK
      ?auto_835709 - BLOCK
      ?auto_835710 - BLOCK
      ?auto_835711 - BLOCK
      ?auto_835712 - BLOCK
      ?auto_835713 - BLOCK
      ?auto_835714 - BLOCK
      ?auto_835715 - BLOCK
    )
    :vars
    (
      ?auto_835716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_835715 ?auto_835716 ) ( ON-TABLE ?auto_835698 ) ( ON ?auto_835699 ?auto_835698 ) ( ON ?auto_835700 ?auto_835699 ) ( ON ?auto_835701 ?auto_835700 ) ( ON ?auto_835702 ?auto_835701 ) ( ON ?auto_835703 ?auto_835702 ) ( ON ?auto_835704 ?auto_835703 ) ( ON ?auto_835705 ?auto_835704 ) ( ON ?auto_835706 ?auto_835705 ) ( not ( = ?auto_835698 ?auto_835699 ) ) ( not ( = ?auto_835698 ?auto_835700 ) ) ( not ( = ?auto_835698 ?auto_835701 ) ) ( not ( = ?auto_835698 ?auto_835702 ) ) ( not ( = ?auto_835698 ?auto_835703 ) ) ( not ( = ?auto_835698 ?auto_835704 ) ) ( not ( = ?auto_835698 ?auto_835705 ) ) ( not ( = ?auto_835698 ?auto_835706 ) ) ( not ( = ?auto_835698 ?auto_835707 ) ) ( not ( = ?auto_835698 ?auto_835708 ) ) ( not ( = ?auto_835698 ?auto_835709 ) ) ( not ( = ?auto_835698 ?auto_835710 ) ) ( not ( = ?auto_835698 ?auto_835711 ) ) ( not ( = ?auto_835698 ?auto_835712 ) ) ( not ( = ?auto_835698 ?auto_835713 ) ) ( not ( = ?auto_835698 ?auto_835714 ) ) ( not ( = ?auto_835698 ?auto_835715 ) ) ( not ( = ?auto_835698 ?auto_835716 ) ) ( not ( = ?auto_835699 ?auto_835700 ) ) ( not ( = ?auto_835699 ?auto_835701 ) ) ( not ( = ?auto_835699 ?auto_835702 ) ) ( not ( = ?auto_835699 ?auto_835703 ) ) ( not ( = ?auto_835699 ?auto_835704 ) ) ( not ( = ?auto_835699 ?auto_835705 ) ) ( not ( = ?auto_835699 ?auto_835706 ) ) ( not ( = ?auto_835699 ?auto_835707 ) ) ( not ( = ?auto_835699 ?auto_835708 ) ) ( not ( = ?auto_835699 ?auto_835709 ) ) ( not ( = ?auto_835699 ?auto_835710 ) ) ( not ( = ?auto_835699 ?auto_835711 ) ) ( not ( = ?auto_835699 ?auto_835712 ) ) ( not ( = ?auto_835699 ?auto_835713 ) ) ( not ( = ?auto_835699 ?auto_835714 ) ) ( not ( = ?auto_835699 ?auto_835715 ) ) ( not ( = ?auto_835699 ?auto_835716 ) ) ( not ( = ?auto_835700 ?auto_835701 ) ) ( not ( = ?auto_835700 ?auto_835702 ) ) ( not ( = ?auto_835700 ?auto_835703 ) ) ( not ( = ?auto_835700 ?auto_835704 ) ) ( not ( = ?auto_835700 ?auto_835705 ) ) ( not ( = ?auto_835700 ?auto_835706 ) ) ( not ( = ?auto_835700 ?auto_835707 ) ) ( not ( = ?auto_835700 ?auto_835708 ) ) ( not ( = ?auto_835700 ?auto_835709 ) ) ( not ( = ?auto_835700 ?auto_835710 ) ) ( not ( = ?auto_835700 ?auto_835711 ) ) ( not ( = ?auto_835700 ?auto_835712 ) ) ( not ( = ?auto_835700 ?auto_835713 ) ) ( not ( = ?auto_835700 ?auto_835714 ) ) ( not ( = ?auto_835700 ?auto_835715 ) ) ( not ( = ?auto_835700 ?auto_835716 ) ) ( not ( = ?auto_835701 ?auto_835702 ) ) ( not ( = ?auto_835701 ?auto_835703 ) ) ( not ( = ?auto_835701 ?auto_835704 ) ) ( not ( = ?auto_835701 ?auto_835705 ) ) ( not ( = ?auto_835701 ?auto_835706 ) ) ( not ( = ?auto_835701 ?auto_835707 ) ) ( not ( = ?auto_835701 ?auto_835708 ) ) ( not ( = ?auto_835701 ?auto_835709 ) ) ( not ( = ?auto_835701 ?auto_835710 ) ) ( not ( = ?auto_835701 ?auto_835711 ) ) ( not ( = ?auto_835701 ?auto_835712 ) ) ( not ( = ?auto_835701 ?auto_835713 ) ) ( not ( = ?auto_835701 ?auto_835714 ) ) ( not ( = ?auto_835701 ?auto_835715 ) ) ( not ( = ?auto_835701 ?auto_835716 ) ) ( not ( = ?auto_835702 ?auto_835703 ) ) ( not ( = ?auto_835702 ?auto_835704 ) ) ( not ( = ?auto_835702 ?auto_835705 ) ) ( not ( = ?auto_835702 ?auto_835706 ) ) ( not ( = ?auto_835702 ?auto_835707 ) ) ( not ( = ?auto_835702 ?auto_835708 ) ) ( not ( = ?auto_835702 ?auto_835709 ) ) ( not ( = ?auto_835702 ?auto_835710 ) ) ( not ( = ?auto_835702 ?auto_835711 ) ) ( not ( = ?auto_835702 ?auto_835712 ) ) ( not ( = ?auto_835702 ?auto_835713 ) ) ( not ( = ?auto_835702 ?auto_835714 ) ) ( not ( = ?auto_835702 ?auto_835715 ) ) ( not ( = ?auto_835702 ?auto_835716 ) ) ( not ( = ?auto_835703 ?auto_835704 ) ) ( not ( = ?auto_835703 ?auto_835705 ) ) ( not ( = ?auto_835703 ?auto_835706 ) ) ( not ( = ?auto_835703 ?auto_835707 ) ) ( not ( = ?auto_835703 ?auto_835708 ) ) ( not ( = ?auto_835703 ?auto_835709 ) ) ( not ( = ?auto_835703 ?auto_835710 ) ) ( not ( = ?auto_835703 ?auto_835711 ) ) ( not ( = ?auto_835703 ?auto_835712 ) ) ( not ( = ?auto_835703 ?auto_835713 ) ) ( not ( = ?auto_835703 ?auto_835714 ) ) ( not ( = ?auto_835703 ?auto_835715 ) ) ( not ( = ?auto_835703 ?auto_835716 ) ) ( not ( = ?auto_835704 ?auto_835705 ) ) ( not ( = ?auto_835704 ?auto_835706 ) ) ( not ( = ?auto_835704 ?auto_835707 ) ) ( not ( = ?auto_835704 ?auto_835708 ) ) ( not ( = ?auto_835704 ?auto_835709 ) ) ( not ( = ?auto_835704 ?auto_835710 ) ) ( not ( = ?auto_835704 ?auto_835711 ) ) ( not ( = ?auto_835704 ?auto_835712 ) ) ( not ( = ?auto_835704 ?auto_835713 ) ) ( not ( = ?auto_835704 ?auto_835714 ) ) ( not ( = ?auto_835704 ?auto_835715 ) ) ( not ( = ?auto_835704 ?auto_835716 ) ) ( not ( = ?auto_835705 ?auto_835706 ) ) ( not ( = ?auto_835705 ?auto_835707 ) ) ( not ( = ?auto_835705 ?auto_835708 ) ) ( not ( = ?auto_835705 ?auto_835709 ) ) ( not ( = ?auto_835705 ?auto_835710 ) ) ( not ( = ?auto_835705 ?auto_835711 ) ) ( not ( = ?auto_835705 ?auto_835712 ) ) ( not ( = ?auto_835705 ?auto_835713 ) ) ( not ( = ?auto_835705 ?auto_835714 ) ) ( not ( = ?auto_835705 ?auto_835715 ) ) ( not ( = ?auto_835705 ?auto_835716 ) ) ( not ( = ?auto_835706 ?auto_835707 ) ) ( not ( = ?auto_835706 ?auto_835708 ) ) ( not ( = ?auto_835706 ?auto_835709 ) ) ( not ( = ?auto_835706 ?auto_835710 ) ) ( not ( = ?auto_835706 ?auto_835711 ) ) ( not ( = ?auto_835706 ?auto_835712 ) ) ( not ( = ?auto_835706 ?auto_835713 ) ) ( not ( = ?auto_835706 ?auto_835714 ) ) ( not ( = ?auto_835706 ?auto_835715 ) ) ( not ( = ?auto_835706 ?auto_835716 ) ) ( not ( = ?auto_835707 ?auto_835708 ) ) ( not ( = ?auto_835707 ?auto_835709 ) ) ( not ( = ?auto_835707 ?auto_835710 ) ) ( not ( = ?auto_835707 ?auto_835711 ) ) ( not ( = ?auto_835707 ?auto_835712 ) ) ( not ( = ?auto_835707 ?auto_835713 ) ) ( not ( = ?auto_835707 ?auto_835714 ) ) ( not ( = ?auto_835707 ?auto_835715 ) ) ( not ( = ?auto_835707 ?auto_835716 ) ) ( not ( = ?auto_835708 ?auto_835709 ) ) ( not ( = ?auto_835708 ?auto_835710 ) ) ( not ( = ?auto_835708 ?auto_835711 ) ) ( not ( = ?auto_835708 ?auto_835712 ) ) ( not ( = ?auto_835708 ?auto_835713 ) ) ( not ( = ?auto_835708 ?auto_835714 ) ) ( not ( = ?auto_835708 ?auto_835715 ) ) ( not ( = ?auto_835708 ?auto_835716 ) ) ( not ( = ?auto_835709 ?auto_835710 ) ) ( not ( = ?auto_835709 ?auto_835711 ) ) ( not ( = ?auto_835709 ?auto_835712 ) ) ( not ( = ?auto_835709 ?auto_835713 ) ) ( not ( = ?auto_835709 ?auto_835714 ) ) ( not ( = ?auto_835709 ?auto_835715 ) ) ( not ( = ?auto_835709 ?auto_835716 ) ) ( not ( = ?auto_835710 ?auto_835711 ) ) ( not ( = ?auto_835710 ?auto_835712 ) ) ( not ( = ?auto_835710 ?auto_835713 ) ) ( not ( = ?auto_835710 ?auto_835714 ) ) ( not ( = ?auto_835710 ?auto_835715 ) ) ( not ( = ?auto_835710 ?auto_835716 ) ) ( not ( = ?auto_835711 ?auto_835712 ) ) ( not ( = ?auto_835711 ?auto_835713 ) ) ( not ( = ?auto_835711 ?auto_835714 ) ) ( not ( = ?auto_835711 ?auto_835715 ) ) ( not ( = ?auto_835711 ?auto_835716 ) ) ( not ( = ?auto_835712 ?auto_835713 ) ) ( not ( = ?auto_835712 ?auto_835714 ) ) ( not ( = ?auto_835712 ?auto_835715 ) ) ( not ( = ?auto_835712 ?auto_835716 ) ) ( not ( = ?auto_835713 ?auto_835714 ) ) ( not ( = ?auto_835713 ?auto_835715 ) ) ( not ( = ?auto_835713 ?auto_835716 ) ) ( not ( = ?auto_835714 ?auto_835715 ) ) ( not ( = ?auto_835714 ?auto_835716 ) ) ( not ( = ?auto_835715 ?auto_835716 ) ) ( ON ?auto_835714 ?auto_835715 ) ( ON ?auto_835713 ?auto_835714 ) ( ON ?auto_835712 ?auto_835713 ) ( ON ?auto_835711 ?auto_835712 ) ( ON ?auto_835710 ?auto_835711 ) ( ON ?auto_835709 ?auto_835710 ) ( ON ?auto_835708 ?auto_835709 ) ( CLEAR ?auto_835706 ) ( ON ?auto_835707 ?auto_835708 ) ( CLEAR ?auto_835707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_835698 ?auto_835699 ?auto_835700 ?auto_835701 ?auto_835702 ?auto_835703 ?auto_835704 ?auto_835705 ?auto_835706 ?auto_835707 )
      ( MAKE-18PILE ?auto_835698 ?auto_835699 ?auto_835700 ?auto_835701 ?auto_835702 ?auto_835703 ?auto_835704 ?auto_835705 ?auto_835706 ?auto_835707 ?auto_835708 ?auto_835709 ?auto_835710 ?auto_835711 ?auto_835712 ?auto_835713 ?auto_835714 ?auto_835715 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_835735 - BLOCK
      ?auto_835736 - BLOCK
      ?auto_835737 - BLOCK
      ?auto_835738 - BLOCK
      ?auto_835739 - BLOCK
      ?auto_835740 - BLOCK
      ?auto_835741 - BLOCK
      ?auto_835742 - BLOCK
      ?auto_835743 - BLOCK
      ?auto_835744 - BLOCK
      ?auto_835745 - BLOCK
      ?auto_835746 - BLOCK
      ?auto_835747 - BLOCK
      ?auto_835748 - BLOCK
      ?auto_835749 - BLOCK
      ?auto_835750 - BLOCK
      ?auto_835751 - BLOCK
      ?auto_835752 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_835752 ) ( ON-TABLE ?auto_835735 ) ( ON ?auto_835736 ?auto_835735 ) ( ON ?auto_835737 ?auto_835736 ) ( ON ?auto_835738 ?auto_835737 ) ( ON ?auto_835739 ?auto_835738 ) ( ON ?auto_835740 ?auto_835739 ) ( ON ?auto_835741 ?auto_835740 ) ( ON ?auto_835742 ?auto_835741 ) ( ON ?auto_835743 ?auto_835742 ) ( not ( = ?auto_835735 ?auto_835736 ) ) ( not ( = ?auto_835735 ?auto_835737 ) ) ( not ( = ?auto_835735 ?auto_835738 ) ) ( not ( = ?auto_835735 ?auto_835739 ) ) ( not ( = ?auto_835735 ?auto_835740 ) ) ( not ( = ?auto_835735 ?auto_835741 ) ) ( not ( = ?auto_835735 ?auto_835742 ) ) ( not ( = ?auto_835735 ?auto_835743 ) ) ( not ( = ?auto_835735 ?auto_835744 ) ) ( not ( = ?auto_835735 ?auto_835745 ) ) ( not ( = ?auto_835735 ?auto_835746 ) ) ( not ( = ?auto_835735 ?auto_835747 ) ) ( not ( = ?auto_835735 ?auto_835748 ) ) ( not ( = ?auto_835735 ?auto_835749 ) ) ( not ( = ?auto_835735 ?auto_835750 ) ) ( not ( = ?auto_835735 ?auto_835751 ) ) ( not ( = ?auto_835735 ?auto_835752 ) ) ( not ( = ?auto_835736 ?auto_835737 ) ) ( not ( = ?auto_835736 ?auto_835738 ) ) ( not ( = ?auto_835736 ?auto_835739 ) ) ( not ( = ?auto_835736 ?auto_835740 ) ) ( not ( = ?auto_835736 ?auto_835741 ) ) ( not ( = ?auto_835736 ?auto_835742 ) ) ( not ( = ?auto_835736 ?auto_835743 ) ) ( not ( = ?auto_835736 ?auto_835744 ) ) ( not ( = ?auto_835736 ?auto_835745 ) ) ( not ( = ?auto_835736 ?auto_835746 ) ) ( not ( = ?auto_835736 ?auto_835747 ) ) ( not ( = ?auto_835736 ?auto_835748 ) ) ( not ( = ?auto_835736 ?auto_835749 ) ) ( not ( = ?auto_835736 ?auto_835750 ) ) ( not ( = ?auto_835736 ?auto_835751 ) ) ( not ( = ?auto_835736 ?auto_835752 ) ) ( not ( = ?auto_835737 ?auto_835738 ) ) ( not ( = ?auto_835737 ?auto_835739 ) ) ( not ( = ?auto_835737 ?auto_835740 ) ) ( not ( = ?auto_835737 ?auto_835741 ) ) ( not ( = ?auto_835737 ?auto_835742 ) ) ( not ( = ?auto_835737 ?auto_835743 ) ) ( not ( = ?auto_835737 ?auto_835744 ) ) ( not ( = ?auto_835737 ?auto_835745 ) ) ( not ( = ?auto_835737 ?auto_835746 ) ) ( not ( = ?auto_835737 ?auto_835747 ) ) ( not ( = ?auto_835737 ?auto_835748 ) ) ( not ( = ?auto_835737 ?auto_835749 ) ) ( not ( = ?auto_835737 ?auto_835750 ) ) ( not ( = ?auto_835737 ?auto_835751 ) ) ( not ( = ?auto_835737 ?auto_835752 ) ) ( not ( = ?auto_835738 ?auto_835739 ) ) ( not ( = ?auto_835738 ?auto_835740 ) ) ( not ( = ?auto_835738 ?auto_835741 ) ) ( not ( = ?auto_835738 ?auto_835742 ) ) ( not ( = ?auto_835738 ?auto_835743 ) ) ( not ( = ?auto_835738 ?auto_835744 ) ) ( not ( = ?auto_835738 ?auto_835745 ) ) ( not ( = ?auto_835738 ?auto_835746 ) ) ( not ( = ?auto_835738 ?auto_835747 ) ) ( not ( = ?auto_835738 ?auto_835748 ) ) ( not ( = ?auto_835738 ?auto_835749 ) ) ( not ( = ?auto_835738 ?auto_835750 ) ) ( not ( = ?auto_835738 ?auto_835751 ) ) ( not ( = ?auto_835738 ?auto_835752 ) ) ( not ( = ?auto_835739 ?auto_835740 ) ) ( not ( = ?auto_835739 ?auto_835741 ) ) ( not ( = ?auto_835739 ?auto_835742 ) ) ( not ( = ?auto_835739 ?auto_835743 ) ) ( not ( = ?auto_835739 ?auto_835744 ) ) ( not ( = ?auto_835739 ?auto_835745 ) ) ( not ( = ?auto_835739 ?auto_835746 ) ) ( not ( = ?auto_835739 ?auto_835747 ) ) ( not ( = ?auto_835739 ?auto_835748 ) ) ( not ( = ?auto_835739 ?auto_835749 ) ) ( not ( = ?auto_835739 ?auto_835750 ) ) ( not ( = ?auto_835739 ?auto_835751 ) ) ( not ( = ?auto_835739 ?auto_835752 ) ) ( not ( = ?auto_835740 ?auto_835741 ) ) ( not ( = ?auto_835740 ?auto_835742 ) ) ( not ( = ?auto_835740 ?auto_835743 ) ) ( not ( = ?auto_835740 ?auto_835744 ) ) ( not ( = ?auto_835740 ?auto_835745 ) ) ( not ( = ?auto_835740 ?auto_835746 ) ) ( not ( = ?auto_835740 ?auto_835747 ) ) ( not ( = ?auto_835740 ?auto_835748 ) ) ( not ( = ?auto_835740 ?auto_835749 ) ) ( not ( = ?auto_835740 ?auto_835750 ) ) ( not ( = ?auto_835740 ?auto_835751 ) ) ( not ( = ?auto_835740 ?auto_835752 ) ) ( not ( = ?auto_835741 ?auto_835742 ) ) ( not ( = ?auto_835741 ?auto_835743 ) ) ( not ( = ?auto_835741 ?auto_835744 ) ) ( not ( = ?auto_835741 ?auto_835745 ) ) ( not ( = ?auto_835741 ?auto_835746 ) ) ( not ( = ?auto_835741 ?auto_835747 ) ) ( not ( = ?auto_835741 ?auto_835748 ) ) ( not ( = ?auto_835741 ?auto_835749 ) ) ( not ( = ?auto_835741 ?auto_835750 ) ) ( not ( = ?auto_835741 ?auto_835751 ) ) ( not ( = ?auto_835741 ?auto_835752 ) ) ( not ( = ?auto_835742 ?auto_835743 ) ) ( not ( = ?auto_835742 ?auto_835744 ) ) ( not ( = ?auto_835742 ?auto_835745 ) ) ( not ( = ?auto_835742 ?auto_835746 ) ) ( not ( = ?auto_835742 ?auto_835747 ) ) ( not ( = ?auto_835742 ?auto_835748 ) ) ( not ( = ?auto_835742 ?auto_835749 ) ) ( not ( = ?auto_835742 ?auto_835750 ) ) ( not ( = ?auto_835742 ?auto_835751 ) ) ( not ( = ?auto_835742 ?auto_835752 ) ) ( not ( = ?auto_835743 ?auto_835744 ) ) ( not ( = ?auto_835743 ?auto_835745 ) ) ( not ( = ?auto_835743 ?auto_835746 ) ) ( not ( = ?auto_835743 ?auto_835747 ) ) ( not ( = ?auto_835743 ?auto_835748 ) ) ( not ( = ?auto_835743 ?auto_835749 ) ) ( not ( = ?auto_835743 ?auto_835750 ) ) ( not ( = ?auto_835743 ?auto_835751 ) ) ( not ( = ?auto_835743 ?auto_835752 ) ) ( not ( = ?auto_835744 ?auto_835745 ) ) ( not ( = ?auto_835744 ?auto_835746 ) ) ( not ( = ?auto_835744 ?auto_835747 ) ) ( not ( = ?auto_835744 ?auto_835748 ) ) ( not ( = ?auto_835744 ?auto_835749 ) ) ( not ( = ?auto_835744 ?auto_835750 ) ) ( not ( = ?auto_835744 ?auto_835751 ) ) ( not ( = ?auto_835744 ?auto_835752 ) ) ( not ( = ?auto_835745 ?auto_835746 ) ) ( not ( = ?auto_835745 ?auto_835747 ) ) ( not ( = ?auto_835745 ?auto_835748 ) ) ( not ( = ?auto_835745 ?auto_835749 ) ) ( not ( = ?auto_835745 ?auto_835750 ) ) ( not ( = ?auto_835745 ?auto_835751 ) ) ( not ( = ?auto_835745 ?auto_835752 ) ) ( not ( = ?auto_835746 ?auto_835747 ) ) ( not ( = ?auto_835746 ?auto_835748 ) ) ( not ( = ?auto_835746 ?auto_835749 ) ) ( not ( = ?auto_835746 ?auto_835750 ) ) ( not ( = ?auto_835746 ?auto_835751 ) ) ( not ( = ?auto_835746 ?auto_835752 ) ) ( not ( = ?auto_835747 ?auto_835748 ) ) ( not ( = ?auto_835747 ?auto_835749 ) ) ( not ( = ?auto_835747 ?auto_835750 ) ) ( not ( = ?auto_835747 ?auto_835751 ) ) ( not ( = ?auto_835747 ?auto_835752 ) ) ( not ( = ?auto_835748 ?auto_835749 ) ) ( not ( = ?auto_835748 ?auto_835750 ) ) ( not ( = ?auto_835748 ?auto_835751 ) ) ( not ( = ?auto_835748 ?auto_835752 ) ) ( not ( = ?auto_835749 ?auto_835750 ) ) ( not ( = ?auto_835749 ?auto_835751 ) ) ( not ( = ?auto_835749 ?auto_835752 ) ) ( not ( = ?auto_835750 ?auto_835751 ) ) ( not ( = ?auto_835750 ?auto_835752 ) ) ( not ( = ?auto_835751 ?auto_835752 ) ) ( ON ?auto_835751 ?auto_835752 ) ( ON ?auto_835750 ?auto_835751 ) ( ON ?auto_835749 ?auto_835750 ) ( ON ?auto_835748 ?auto_835749 ) ( ON ?auto_835747 ?auto_835748 ) ( ON ?auto_835746 ?auto_835747 ) ( ON ?auto_835745 ?auto_835746 ) ( CLEAR ?auto_835743 ) ( ON ?auto_835744 ?auto_835745 ) ( CLEAR ?auto_835744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_835735 ?auto_835736 ?auto_835737 ?auto_835738 ?auto_835739 ?auto_835740 ?auto_835741 ?auto_835742 ?auto_835743 ?auto_835744 )
      ( MAKE-18PILE ?auto_835735 ?auto_835736 ?auto_835737 ?auto_835738 ?auto_835739 ?auto_835740 ?auto_835741 ?auto_835742 ?auto_835743 ?auto_835744 ?auto_835745 ?auto_835746 ?auto_835747 ?auto_835748 ?auto_835749 ?auto_835750 ?auto_835751 ?auto_835752 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_835771 - BLOCK
      ?auto_835772 - BLOCK
      ?auto_835773 - BLOCK
      ?auto_835774 - BLOCK
      ?auto_835775 - BLOCK
      ?auto_835776 - BLOCK
      ?auto_835777 - BLOCK
      ?auto_835778 - BLOCK
      ?auto_835779 - BLOCK
      ?auto_835780 - BLOCK
      ?auto_835781 - BLOCK
      ?auto_835782 - BLOCK
      ?auto_835783 - BLOCK
      ?auto_835784 - BLOCK
      ?auto_835785 - BLOCK
      ?auto_835786 - BLOCK
      ?auto_835787 - BLOCK
      ?auto_835788 - BLOCK
    )
    :vars
    (
      ?auto_835789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_835788 ?auto_835789 ) ( ON-TABLE ?auto_835771 ) ( ON ?auto_835772 ?auto_835771 ) ( ON ?auto_835773 ?auto_835772 ) ( ON ?auto_835774 ?auto_835773 ) ( ON ?auto_835775 ?auto_835774 ) ( ON ?auto_835776 ?auto_835775 ) ( ON ?auto_835777 ?auto_835776 ) ( ON ?auto_835778 ?auto_835777 ) ( not ( = ?auto_835771 ?auto_835772 ) ) ( not ( = ?auto_835771 ?auto_835773 ) ) ( not ( = ?auto_835771 ?auto_835774 ) ) ( not ( = ?auto_835771 ?auto_835775 ) ) ( not ( = ?auto_835771 ?auto_835776 ) ) ( not ( = ?auto_835771 ?auto_835777 ) ) ( not ( = ?auto_835771 ?auto_835778 ) ) ( not ( = ?auto_835771 ?auto_835779 ) ) ( not ( = ?auto_835771 ?auto_835780 ) ) ( not ( = ?auto_835771 ?auto_835781 ) ) ( not ( = ?auto_835771 ?auto_835782 ) ) ( not ( = ?auto_835771 ?auto_835783 ) ) ( not ( = ?auto_835771 ?auto_835784 ) ) ( not ( = ?auto_835771 ?auto_835785 ) ) ( not ( = ?auto_835771 ?auto_835786 ) ) ( not ( = ?auto_835771 ?auto_835787 ) ) ( not ( = ?auto_835771 ?auto_835788 ) ) ( not ( = ?auto_835771 ?auto_835789 ) ) ( not ( = ?auto_835772 ?auto_835773 ) ) ( not ( = ?auto_835772 ?auto_835774 ) ) ( not ( = ?auto_835772 ?auto_835775 ) ) ( not ( = ?auto_835772 ?auto_835776 ) ) ( not ( = ?auto_835772 ?auto_835777 ) ) ( not ( = ?auto_835772 ?auto_835778 ) ) ( not ( = ?auto_835772 ?auto_835779 ) ) ( not ( = ?auto_835772 ?auto_835780 ) ) ( not ( = ?auto_835772 ?auto_835781 ) ) ( not ( = ?auto_835772 ?auto_835782 ) ) ( not ( = ?auto_835772 ?auto_835783 ) ) ( not ( = ?auto_835772 ?auto_835784 ) ) ( not ( = ?auto_835772 ?auto_835785 ) ) ( not ( = ?auto_835772 ?auto_835786 ) ) ( not ( = ?auto_835772 ?auto_835787 ) ) ( not ( = ?auto_835772 ?auto_835788 ) ) ( not ( = ?auto_835772 ?auto_835789 ) ) ( not ( = ?auto_835773 ?auto_835774 ) ) ( not ( = ?auto_835773 ?auto_835775 ) ) ( not ( = ?auto_835773 ?auto_835776 ) ) ( not ( = ?auto_835773 ?auto_835777 ) ) ( not ( = ?auto_835773 ?auto_835778 ) ) ( not ( = ?auto_835773 ?auto_835779 ) ) ( not ( = ?auto_835773 ?auto_835780 ) ) ( not ( = ?auto_835773 ?auto_835781 ) ) ( not ( = ?auto_835773 ?auto_835782 ) ) ( not ( = ?auto_835773 ?auto_835783 ) ) ( not ( = ?auto_835773 ?auto_835784 ) ) ( not ( = ?auto_835773 ?auto_835785 ) ) ( not ( = ?auto_835773 ?auto_835786 ) ) ( not ( = ?auto_835773 ?auto_835787 ) ) ( not ( = ?auto_835773 ?auto_835788 ) ) ( not ( = ?auto_835773 ?auto_835789 ) ) ( not ( = ?auto_835774 ?auto_835775 ) ) ( not ( = ?auto_835774 ?auto_835776 ) ) ( not ( = ?auto_835774 ?auto_835777 ) ) ( not ( = ?auto_835774 ?auto_835778 ) ) ( not ( = ?auto_835774 ?auto_835779 ) ) ( not ( = ?auto_835774 ?auto_835780 ) ) ( not ( = ?auto_835774 ?auto_835781 ) ) ( not ( = ?auto_835774 ?auto_835782 ) ) ( not ( = ?auto_835774 ?auto_835783 ) ) ( not ( = ?auto_835774 ?auto_835784 ) ) ( not ( = ?auto_835774 ?auto_835785 ) ) ( not ( = ?auto_835774 ?auto_835786 ) ) ( not ( = ?auto_835774 ?auto_835787 ) ) ( not ( = ?auto_835774 ?auto_835788 ) ) ( not ( = ?auto_835774 ?auto_835789 ) ) ( not ( = ?auto_835775 ?auto_835776 ) ) ( not ( = ?auto_835775 ?auto_835777 ) ) ( not ( = ?auto_835775 ?auto_835778 ) ) ( not ( = ?auto_835775 ?auto_835779 ) ) ( not ( = ?auto_835775 ?auto_835780 ) ) ( not ( = ?auto_835775 ?auto_835781 ) ) ( not ( = ?auto_835775 ?auto_835782 ) ) ( not ( = ?auto_835775 ?auto_835783 ) ) ( not ( = ?auto_835775 ?auto_835784 ) ) ( not ( = ?auto_835775 ?auto_835785 ) ) ( not ( = ?auto_835775 ?auto_835786 ) ) ( not ( = ?auto_835775 ?auto_835787 ) ) ( not ( = ?auto_835775 ?auto_835788 ) ) ( not ( = ?auto_835775 ?auto_835789 ) ) ( not ( = ?auto_835776 ?auto_835777 ) ) ( not ( = ?auto_835776 ?auto_835778 ) ) ( not ( = ?auto_835776 ?auto_835779 ) ) ( not ( = ?auto_835776 ?auto_835780 ) ) ( not ( = ?auto_835776 ?auto_835781 ) ) ( not ( = ?auto_835776 ?auto_835782 ) ) ( not ( = ?auto_835776 ?auto_835783 ) ) ( not ( = ?auto_835776 ?auto_835784 ) ) ( not ( = ?auto_835776 ?auto_835785 ) ) ( not ( = ?auto_835776 ?auto_835786 ) ) ( not ( = ?auto_835776 ?auto_835787 ) ) ( not ( = ?auto_835776 ?auto_835788 ) ) ( not ( = ?auto_835776 ?auto_835789 ) ) ( not ( = ?auto_835777 ?auto_835778 ) ) ( not ( = ?auto_835777 ?auto_835779 ) ) ( not ( = ?auto_835777 ?auto_835780 ) ) ( not ( = ?auto_835777 ?auto_835781 ) ) ( not ( = ?auto_835777 ?auto_835782 ) ) ( not ( = ?auto_835777 ?auto_835783 ) ) ( not ( = ?auto_835777 ?auto_835784 ) ) ( not ( = ?auto_835777 ?auto_835785 ) ) ( not ( = ?auto_835777 ?auto_835786 ) ) ( not ( = ?auto_835777 ?auto_835787 ) ) ( not ( = ?auto_835777 ?auto_835788 ) ) ( not ( = ?auto_835777 ?auto_835789 ) ) ( not ( = ?auto_835778 ?auto_835779 ) ) ( not ( = ?auto_835778 ?auto_835780 ) ) ( not ( = ?auto_835778 ?auto_835781 ) ) ( not ( = ?auto_835778 ?auto_835782 ) ) ( not ( = ?auto_835778 ?auto_835783 ) ) ( not ( = ?auto_835778 ?auto_835784 ) ) ( not ( = ?auto_835778 ?auto_835785 ) ) ( not ( = ?auto_835778 ?auto_835786 ) ) ( not ( = ?auto_835778 ?auto_835787 ) ) ( not ( = ?auto_835778 ?auto_835788 ) ) ( not ( = ?auto_835778 ?auto_835789 ) ) ( not ( = ?auto_835779 ?auto_835780 ) ) ( not ( = ?auto_835779 ?auto_835781 ) ) ( not ( = ?auto_835779 ?auto_835782 ) ) ( not ( = ?auto_835779 ?auto_835783 ) ) ( not ( = ?auto_835779 ?auto_835784 ) ) ( not ( = ?auto_835779 ?auto_835785 ) ) ( not ( = ?auto_835779 ?auto_835786 ) ) ( not ( = ?auto_835779 ?auto_835787 ) ) ( not ( = ?auto_835779 ?auto_835788 ) ) ( not ( = ?auto_835779 ?auto_835789 ) ) ( not ( = ?auto_835780 ?auto_835781 ) ) ( not ( = ?auto_835780 ?auto_835782 ) ) ( not ( = ?auto_835780 ?auto_835783 ) ) ( not ( = ?auto_835780 ?auto_835784 ) ) ( not ( = ?auto_835780 ?auto_835785 ) ) ( not ( = ?auto_835780 ?auto_835786 ) ) ( not ( = ?auto_835780 ?auto_835787 ) ) ( not ( = ?auto_835780 ?auto_835788 ) ) ( not ( = ?auto_835780 ?auto_835789 ) ) ( not ( = ?auto_835781 ?auto_835782 ) ) ( not ( = ?auto_835781 ?auto_835783 ) ) ( not ( = ?auto_835781 ?auto_835784 ) ) ( not ( = ?auto_835781 ?auto_835785 ) ) ( not ( = ?auto_835781 ?auto_835786 ) ) ( not ( = ?auto_835781 ?auto_835787 ) ) ( not ( = ?auto_835781 ?auto_835788 ) ) ( not ( = ?auto_835781 ?auto_835789 ) ) ( not ( = ?auto_835782 ?auto_835783 ) ) ( not ( = ?auto_835782 ?auto_835784 ) ) ( not ( = ?auto_835782 ?auto_835785 ) ) ( not ( = ?auto_835782 ?auto_835786 ) ) ( not ( = ?auto_835782 ?auto_835787 ) ) ( not ( = ?auto_835782 ?auto_835788 ) ) ( not ( = ?auto_835782 ?auto_835789 ) ) ( not ( = ?auto_835783 ?auto_835784 ) ) ( not ( = ?auto_835783 ?auto_835785 ) ) ( not ( = ?auto_835783 ?auto_835786 ) ) ( not ( = ?auto_835783 ?auto_835787 ) ) ( not ( = ?auto_835783 ?auto_835788 ) ) ( not ( = ?auto_835783 ?auto_835789 ) ) ( not ( = ?auto_835784 ?auto_835785 ) ) ( not ( = ?auto_835784 ?auto_835786 ) ) ( not ( = ?auto_835784 ?auto_835787 ) ) ( not ( = ?auto_835784 ?auto_835788 ) ) ( not ( = ?auto_835784 ?auto_835789 ) ) ( not ( = ?auto_835785 ?auto_835786 ) ) ( not ( = ?auto_835785 ?auto_835787 ) ) ( not ( = ?auto_835785 ?auto_835788 ) ) ( not ( = ?auto_835785 ?auto_835789 ) ) ( not ( = ?auto_835786 ?auto_835787 ) ) ( not ( = ?auto_835786 ?auto_835788 ) ) ( not ( = ?auto_835786 ?auto_835789 ) ) ( not ( = ?auto_835787 ?auto_835788 ) ) ( not ( = ?auto_835787 ?auto_835789 ) ) ( not ( = ?auto_835788 ?auto_835789 ) ) ( ON ?auto_835787 ?auto_835788 ) ( ON ?auto_835786 ?auto_835787 ) ( ON ?auto_835785 ?auto_835786 ) ( ON ?auto_835784 ?auto_835785 ) ( ON ?auto_835783 ?auto_835784 ) ( ON ?auto_835782 ?auto_835783 ) ( ON ?auto_835781 ?auto_835782 ) ( ON ?auto_835780 ?auto_835781 ) ( CLEAR ?auto_835778 ) ( ON ?auto_835779 ?auto_835780 ) ( CLEAR ?auto_835779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_835771 ?auto_835772 ?auto_835773 ?auto_835774 ?auto_835775 ?auto_835776 ?auto_835777 ?auto_835778 ?auto_835779 )
      ( MAKE-18PILE ?auto_835771 ?auto_835772 ?auto_835773 ?auto_835774 ?auto_835775 ?auto_835776 ?auto_835777 ?auto_835778 ?auto_835779 ?auto_835780 ?auto_835781 ?auto_835782 ?auto_835783 ?auto_835784 ?auto_835785 ?auto_835786 ?auto_835787 ?auto_835788 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_835808 - BLOCK
      ?auto_835809 - BLOCK
      ?auto_835810 - BLOCK
      ?auto_835811 - BLOCK
      ?auto_835812 - BLOCK
      ?auto_835813 - BLOCK
      ?auto_835814 - BLOCK
      ?auto_835815 - BLOCK
      ?auto_835816 - BLOCK
      ?auto_835817 - BLOCK
      ?auto_835818 - BLOCK
      ?auto_835819 - BLOCK
      ?auto_835820 - BLOCK
      ?auto_835821 - BLOCK
      ?auto_835822 - BLOCK
      ?auto_835823 - BLOCK
      ?auto_835824 - BLOCK
      ?auto_835825 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_835825 ) ( ON-TABLE ?auto_835808 ) ( ON ?auto_835809 ?auto_835808 ) ( ON ?auto_835810 ?auto_835809 ) ( ON ?auto_835811 ?auto_835810 ) ( ON ?auto_835812 ?auto_835811 ) ( ON ?auto_835813 ?auto_835812 ) ( ON ?auto_835814 ?auto_835813 ) ( ON ?auto_835815 ?auto_835814 ) ( not ( = ?auto_835808 ?auto_835809 ) ) ( not ( = ?auto_835808 ?auto_835810 ) ) ( not ( = ?auto_835808 ?auto_835811 ) ) ( not ( = ?auto_835808 ?auto_835812 ) ) ( not ( = ?auto_835808 ?auto_835813 ) ) ( not ( = ?auto_835808 ?auto_835814 ) ) ( not ( = ?auto_835808 ?auto_835815 ) ) ( not ( = ?auto_835808 ?auto_835816 ) ) ( not ( = ?auto_835808 ?auto_835817 ) ) ( not ( = ?auto_835808 ?auto_835818 ) ) ( not ( = ?auto_835808 ?auto_835819 ) ) ( not ( = ?auto_835808 ?auto_835820 ) ) ( not ( = ?auto_835808 ?auto_835821 ) ) ( not ( = ?auto_835808 ?auto_835822 ) ) ( not ( = ?auto_835808 ?auto_835823 ) ) ( not ( = ?auto_835808 ?auto_835824 ) ) ( not ( = ?auto_835808 ?auto_835825 ) ) ( not ( = ?auto_835809 ?auto_835810 ) ) ( not ( = ?auto_835809 ?auto_835811 ) ) ( not ( = ?auto_835809 ?auto_835812 ) ) ( not ( = ?auto_835809 ?auto_835813 ) ) ( not ( = ?auto_835809 ?auto_835814 ) ) ( not ( = ?auto_835809 ?auto_835815 ) ) ( not ( = ?auto_835809 ?auto_835816 ) ) ( not ( = ?auto_835809 ?auto_835817 ) ) ( not ( = ?auto_835809 ?auto_835818 ) ) ( not ( = ?auto_835809 ?auto_835819 ) ) ( not ( = ?auto_835809 ?auto_835820 ) ) ( not ( = ?auto_835809 ?auto_835821 ) ) ( not ( = ?auto_835809 ?auto_835822 ) ) ( not ( = ?auto_835809 ?auto_835823 ) ) ( not ( = ?auto_835809 ?auto_835824 ) ) ( not ( = ?auto_835809 ?auto_835825 ) ) ( not ( = ?auto_835810 ?auto_835811 ) ) ( not ( = ?auto_835810 ?auto_835812 ) ) ( not ( = ?auto_835810 ?auto_835813 ) ) ( not ( = ?auto_835810 ?auto_835814 ) ) ( not ( = ?auto_835810 ?auto_835815 ) ) ( not ( = ?auto_835810 ?auto_835816 ) ) ( not ( = ?auto_835810 ?auto_835817 ) ) ( not ( = ?auto_835810 ?auto_835818 ) ) ( not ( = ?auto_835810 ?auto_835819 ) ) ( not ( = ?auto_835810 ?auto_835820 ) ) ( not ( = ?auto_835810 ?auto_835821 ) ) ( not ( = ?auto_835810 ?auto_835822 ) ) ( not ( = ?auto_835810 ?auto_835823 ) ) ( not ( = ?auto_835810 ?auto_835824 ) ) ( not ( = ?auto_835810 ?auto_835825 ) ) ( not ( = ?auto_835811 ?auto_835812 ) ) ( not ( = ?auto_835811 ?auto_835813 ) ) ( not ( = ?auto_835811 ?auto_835814 ) ) ( not ( = ?auto_835811 ?auto_835815 ) ) ( not ( = ?auto_835811 ?auto_835816 ) ) ( not ( = ?auto_835811 ?auto_835817 ) ) ( not ( = ?auto_835811 ?auto_835818 ) ) ( not ( = ?auto_835811 ?auto_835819 ) ) ( not ( = ?auto_835811 ?auto_835820 ) ) ( not ( = ?auto_835811 ?auto_835821 ) ) ( not ( = ?auto_835811 ?auto_835822 ) ) ( not ( = ?auto_835811 ?auto_835823 ) ) ( not ( = ?auto_835811 ?auto_835824 ) ) ( not ( = ?auto_835811 ?auto_835825 ) ) ( not ( = ?auto_835812 ?auto_835813 ) ) ( not ( = ?auto_835812 ?auto_835814 ) ) ( not ( = ?auto_835812 ?auto_835815 ) ) ( not ( = ?auto_835812 ?auto_835816 ) ) ( not ( = ?auto_835812 ?auto_835817 ) ) ( not ( = ?auto_835812 ?auto_835818 ) ) ( not ( = ?auto_835812 ?auto_835819 ) ) ( not ( = ?auto_835812 ?auto_835820 ) ) ( not ( = ?auto_835812 ?auto_835821 ) ) ( not ( = ?auto_835812 ?auto_835822 ) ) ( not ( = ?auto_835812 ?auto_835823 ) ) ( not ( = ?auto_835812 ?auto_835824 ) ) ( not ( = ?auto_835812 ?auto_835825 ) ) ( not ( = ?auto_835813 ?auto_835814 ) ) ( not ( = ?auto_835813 ?auto_835815 ) ) ( not ( = ?auto_835813 ?auto_835816 ) ) ( not ( = ?auto_835813 ?auto_835817 ) ) ( not ( = ?auto_835813 ?auto_835818 ) ) ( not ( = ?auto_835813 ?auto_835819 ) ) ( not ( = ?auto_835813 ?auto_835820 ) ) ( not ( = ?auto_835813 ?auto_835821 ) ) ( not ( = ?auto_835813 ?auto_835822 ) ) ( not ( = ?auto_835813 ?auto_835823 ) ) ( not ( = ?auto_835813 ?auto_835824 ) ) ( not ( = ?auto_835813 ?auto_835825 ) ) ( not ( = ?auto_835814 ?auto_835815 ) ) ( not ( = ?auto_835814 ?auto_835816 ) ) ( not ( = ?auto_835814 ?auto_835817 ) ) ( not ( = ?auto_835814 ?auto_835818 ) ) ( not ( = ?auto_835814 ?auto_835819 ) ) ( not ( = ?auto_835814 ?auto_835820 ) ) ( not ( = ?auto_835814 ?auto_835821 ) ) ( not ( = ?auto_835814 ?auto_835822 ) ) ( not ( = ?auto_835814 ?auto_835823 ) ) ( not ( = ?auto_835814 ?auto_835824 ) ) ( not ( = ?auto_835814 ?auto_835825 ) ) ( not ( = ?auto_835815 ?auto_835816 ) ) ( not ( = ?auto_835815 ?auto_835817 ) ) ( not ( = ?auto_835815 ?auto_835818 ) ) ( not ( = ?auto_835815 ?auto_835819 ) ) ( not ( = ?auto_835815 ?auto_835820 ) ) ( not ( = ?auto_835815 ?auto_835821 ) ) ( not ( = ?auto_835815 ?auto_835822 ) ) ( not ( = ?auto_835815 ?auto_835823 ) ) ( not ( = ?auto_835815 ?auto_835824 ) ) ( not ( = ?auto_835815 ?auto_835825 ) ) ( not ( = ?auto_835816 ?auto_835817 ) ) ( not ( = ?auto_835816 ?auto_835818 ) ) ( not ( = ?auto_835816 ?auto_835819 ) ) ( not ( = ?auto_835816 ?auto_835820 ) ) ( not ( = ?auto_835816 ?auto_835821 ) ) ( not ( = ?auto_835816 ?auto_835822 ) ) ( not ( = ?auto_835816 ?auto_835823 ) ) ( not ( = ?auto_835816 ?auto_835824 ) ) ( not ( = ?auto_835816 ?auto_835825 ) ) ( not ( = ?auto_835817 ?auto_835818 ) ) ( not ( = ?auto_835817 ?auto_835819 ) ) ( not ( = ?auto_835817 ?auto_835820 ) ) ( not ( = ?auto_835817 ?auto_835821 ) ) ( not ( = ?auto_835817 ?auto_835822 ) ) ( not ( = ?auto_835817 ?auto_835823 ) ) ( not ( = ?auto_835817 ?auto_835824 ) ) ( not ( = ?auto_835817 ?auto_835825 ) ) ( not ( = ?auto_835818 ?auto_835819 ) ) ( not ( = ?auto_835818 ?auto_835820 ) ) ( not ( = ?auto_835818 ?auto_835821 ) ) ( not ( = ?auto_835818 ?auto_835822 ) ) ( not ( = ?auto_835818 ?auto_835823 ) ) ( not ( = ?auto_835818 ?auto_835824 ) ) ( not ( = ?auto_835818 ?auto_835825 ) ) ( not ( = ?auto_835819 ?auto_835820 ) ) ( not ( = ?auto_835819 ?auto_835821 ) ) ( not ( = ?auto_835819 ?auto_835822 ) ) ( not ( = ?auto_835819 ?auto_835823 ) ) ( not ( = ?auto_835819 ?auto_835824 ) ) ( not ( = ?auto_835819 ?auto_835825 ) ) ( not ( = ?auto_835820 ?auto_835821 ) ) ( not ( = ?auto_835820 ?auto_835822 ) ) ( not ( = ?auto_835820 ?auto_835823 ) ) ( not ( = ?auto_835820 ?auto_835824 ) ) ( not ( = ?auto_835820 ?auto_835825 ) ) ( not ( = ?auto_835821 ?auto_835822 ) ) ( not ( = ?auto_835821 ?auto_835823 ) ) ( not ( = ?auto_835821 ?auto_835824 ) ) ( not ( = ?auto_835821 ?auto_835825 ) ) ( not ( = ?auto_835822 ?auto_835823 ) ) ( not ( = ?auto_835822 ?auto_835824 ) ) ( not ( = ?auto_835822 ?auto_835825 ) ) ( not ( = ?auto_835823 ?auto_835824 ) ) ( not ( = ?auto_835823 ?auto_835825 ) ) ( not ( = ?auto_835824 ?auto_835825 ) ) ( ON ?auto_835824 ?auto_835825 ) ( ON ?auto_835823 ?auto_835824 ) ( ON ?auto_835822 ?auto_835823 ) ( ON ?auto_835821 ?auto_835822 ) ( ON ?auto_835820 ?auto_835821 ) ( ON ?auto_835819 ?auto_835820 ) ( ON ?auto_835818 ?auto_835819 ) ( ON ?auto_835817 ?auto_835818 ) ( CLEAR ?auto_835815 ) ( ON ?auto_835816 ?auto_835817 ) ( CLEAR ?auto_835816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_835808 ?auto_835809 ?auto_835810 ?auto_835811 ?auto_835812 ?auto_835813 ?auto_835814 ?auto_835815 ?auto_835816 )
      ( MAKE-18PILE ?auto_835808 ?auto_835809 ?auto_835810 ?auto_835811 ?auto_835812 ?auto_835813 ?auto_835814 ?auto_835815 ?auto_835816 ?auto_835817 ?auto_835818 ?auto_835819 ?auto_835820 ?auto_835821 ?auto_835822 ?auto_835823 ?auto_835824 ?auto_835825 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_835844 - BLOCK
      ?auto_835845 - BLOCK
      ?auto_835846 - BLOCK
      ?auto_835847 - BLOCK
      ?auto_835848 - BLOCK
      ?auto_835849 - BLOCK
      ?auto_835850 - BLOCK
      ?auto_835851 - BLOCK
      ?auto_835852 - BLOCK
      ?auto_835853 - BLOCK
      ?auto_835854 - BLOCK
      ?auto_835855 - BLOCK
      ?auto_835856 - BLOCK
      ?auto_835857 - BLOCK
      ?auto_835858 - BLOCK
      ?auto_835859 - BLOCK
      ?auto_835860 - BLOCK
      ?auto_835861 - BLOCK
    )
    :vars
    (
      ?auto_835862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_835861 ?auto_835862 ) ( ON-TABLE ?auto_835844 ) ( ON ?auto_835845 ?auto_835844 ) ( ON ?auto_835846 ?auto_835845 ) ( ON ?auto_835847 ?auto_835846 ) ( ON ?auto_835848 ?auto_835847 ) ( ON ?auto_835849 ?auto_835848 ) ( ON ?auto_835850 ?auto_835849 ) ( not ( = ?auto_835844 ?auto_835845 ) ) ( not ( = ?auto_835844 ?auto_835846 ) ) ( not ( = ?auto_835844 ?auto_835847 ) ) ( not ( = ?auto_835844 ?auto_835848 ) ) ( not ( = ?auto_835844 ?auto_835849 ) ) ( not ( = ?auto_835844 ?auto_835850 ) ) ( not ( = ?auto_835844 ?auto_835851 ) ) ( not ( = ?auto_835844 ?auto_835852 ) ) ( not ( = ?auto_835844 ?auto_835853 ) ) ( not ( = ?auto_835844 ?auto_835854 ) ) ( not ( = ?auto_835844 ?auto_835855 ) ) ( not ( = ?auto_835844 ?auto_835856 ) ) ( not ( = ?auto_835844 ?auto_835857 ) ) ( not ( = ?auto_835844 ?auto_835858 ) ) ( not ( = ?auto_835844 ?auto_835859 ) ) ( not ( = ?auto_835844 ?auto_835860 ) ) ( not ( = ?auto_835844 ?auto_835861 ) ) ( not ( = ?auto_835844 ?auto_835862 ) ) ( not ( = ?auto_835845 ?auto_835846 ) ) ( not ( = ?auto_835845 ?auto_835847 ) ) ( not ( = ?auto_835845 ?auto_835848 ) ) ( not ( = ?auto_835845 ?auto_835849 ) ) ( not ( = ?auto_835845 ?auto_835850 ) ) ( not ( = ?auto_835845 ?auto_835851 ) ) ( not ( = ?auto_835845 ?auto_835852 ) ) ( not ( = ?auto_835845 ?auto_835853 ) ) ( not ( = ?auto_835845 ?auto_835854 ) ) ( not ( = ?auto_835845 ?auto_835855 ) ) ( not ( = ?auto_835845 ?auto_835856 ) ) ( not ( = ?auto_835845 ?auto_835857 ) ) ( not ( = ?auto_835845 ?auto_835858 ) ) ( not ( = ?auto_835845 ?auto_835859 ) ) ( not ( = ?auto_835845 ?auto_835860 ) ) ( not ( = ?auto_835845 ?auto_835861 ) ) ( not ( = ?auto_835845 ?auto_835862 ) ) ( not ( = ?auto_835846 ?auto_835847 ) ) ( not ( = ?auto_835846 ?auto_835848 ) ) ( not ( = ?auto_835846 ?auto_835849 ) ) ( not ( = ?auto_835846 ?auto_835850 ) ) ( not ( = ?auto_835846 ?auto_835851 ) ) ( not ( = ?auto_835846 ?auto_835852 ) ) ( not ( = ?auto_835846 ?auto_835853 ) ) ( not ( = ?auto_835846 ?auto_835854 ) ) ( not ( = ?auto_835846 ?auto_835855 ) ) ( not ( = ?auto_835846 ?auto_835856 ) ) ( not ( = ?auto_835846 ?auto_835857 ) ) ( not ( = ?auto_835846 ?auto_835858 ) ) ( not ( = ?auto_835846 ?auto_835859 ) ) ( not ( = ?auto_835846 ?auto_835860 ) ) ( not ( = ?auto_835846 ?auto_835861 ) ) ( not ( = ?auto_835846 ?auto_835862 ) ) ( not ( = ?auto_835847 ?auto_835848 ) ) ( not ( = ?auto_835847 ?auto_835849 ) ) ( not ( = ?auto_835847 ?auto_835850 ) ) ( not ( = ?auto_835847 ?auto_835851 ) ) ( not ( = ?auto_835847 ?auto_835852 ) ) ( not ( = ?auto_835847 ?auto_835853 ) ) ( not ( = ?auto_835847 ?auto_835854 ) ) ( not ( = ?auto_835847 ?auto_835855 ) ) ( not ( = ?auto_835847 ?auto_835856 ) ) ( not ( = ?auto_835847 ?auto_835857 ) ) ( not ( = ?auto_835847 ?auto_835858 ) ) ( not ( = ?auto_835847 ?auto_835859 ) ) ( not ( = ?auto_835847 ?auto_835860 ) ) ( not ( = ?auto_835847 ?auto_835861 ) ) ( not ( = ?auto_835847 ?auto_835862 ) ) ( not ( = ?auto_835848 ?auto_835849 ) ) ( not ( = ?auto_835848 ?auto_835850 ) ) ( not ( = ?auto_835848 ?auto_835851 ) ) ( not ( = ?auto_835848 ?auto_835852 ) ) ( not ( = ?auto_835848 ?auto_835853 ) ) ( not ( = ?auto_835848 ?auto_835854 ) ) ( not ( = ?auto_835848 ?auto_835855 ) ) ( not ( = ?auto_835848 ?auto_835856 ) ) ( not ( = ?auto_835848 ?auto_835857 ) ) ( not ( = ?auto_835848 ?auto_835858 ) ) ( not ( = ?auto_835848 ?auto_835859 ) ) ( not ( = ?auto_835848 ?auto_835860 ) ) ( not ( = ?auto_835848 ?auto_835861 ) ) ( not ( = ?auto_835848 ?auto_835862 ) ) ( not ( = ?auto_835849 ?auto_835850 ) ) ( not ( = ?auto_835849 ?auto_835851 ) ) ( not ( = ?auto_835849 ?auto_835852 ) ) ( not ( = ?auto_835849 ?auto_835853 ) ) ( not ( = ?auto_835849 ?auto_835854 ) ) ( not ( = ?auto_835849 ?auto_835855 ) ) ( not ( = ?auto_835849 ?auto_835856 ) ) ( not ( = ?auto_835849 ?auto_835857 ) ) ( not ( = ?auto_835849 ?auto_835858 ) ) ( not ( = ?auto_835849 ?auto_835859 ) ) ( not ( = ?auto_835849 ?auto_835860 ) ) ( not ( = ?auto_835849 ?auto_835861 ) ) ( not ( = ?auto_835849 ?auto_835862 ) ) ( not ( = ?auto_835850 ?auto_835851 ) ) ( not ( = ?auto_835850 ?auto_835852 ) ) ( not ( = ?auto_835850 ?auto_835853 ) ) ( not ( = ?auto_835850 ?auto_835854 ) ) ( not ( = ?auto_835850 ?auto_835855 ) ) ( not ( = ?auto_835850 ?auto_835856 ) ) ( not ( = ?auto_835850 ?auto_835857 ) ) ( not ( = ?auto_835850 ?auto_835858 ) ) ( not ( = ?auto_835850 ?auto_835859 ) ) ( not ( = ?auto_835850 ?auto_835860 ) ) ( not ( = ?auto_835850 ?auto_835861 ) ) ( not ( = ?auto_835850 ?auto_835862 ) ) ( not ( = ?auto_835851 ?auto_835852 ) ) ( not ( = ?auto_835851 ?auto_835853 ) ) ( not ( = ?auto_835851 ?auto_835854 ) ) ( not ( = ?auto_835851 ?auto_835855 ) ) ( not ( = ?auto_835851 ?auto_835856 ) ) ( not ( = ?auto_835851 ?auto_835857 ) ) ( not ( = ?auto_835851 ?auto_835858 ) ) ( not ( = ?auto_835851 ?auto_835859 ) ) ( not ( = ?auto_835851 ?auto_835860 ) ) ( not ( = ?auto_835851 ?auto_835861 ) ) ( not ( = ?auto_835851 ?auto_835862 ) ) ( not ( = ?auto_835852 ?auto_835853 ) ) ( not ( = ?auto_835852 ?auto_835854 ) ) ( not ( = ?auto_835852 ?auto_835855 ) ) ( not ( = ?auto_835852 ?auto_835856 ) ) ( not ( = ?auto_835852 ?auto_835857 ) ) ( not ( = ?auto_835852 ?auto_835858 ) ) ( not ( = ?auto_835852 ?auto_835859 ) ) ( not ( = ?auto_835852 ?auto_835860 ) ) ( not ( = ?auto_835852 ?auto_835861 ) ) ( not ( = ?auto_835852 ?auto_835862 ) ) ( not ( = ?auto_835853 ?auto_835854 ) ) ( not ( = ?auto_835853 ?auto_835855 ) ) ( not ( = ?auto_835853 ?auto_835856 ) ) ( not ( = ?auto_835853 ?auto_835857 ) ) ( not ( = ?auto_835853 ?auto_835858 ) ) ( not ( = ?auto_835853 ?auto_835859 ) ) ( not ( = ?auto_835853 ?auto_835860 ) ) ( not ( = ?auto_835853 ?auto_835861 ) ) ( not ( = ?auto_835853 ?auto_835862 ) ) ( not ( = ?auto_835854 ?auto_835855 ) ) ( not ( = ?auto_835854 ?auto_835856 ) ) ( not ( = ?auto_835854 ?auto_835857 ) ) ( not ( = ?auto_835854 ?auto_835858 ) ) ( not ( = ?auto_835854 ?auto_835859 ) ) ( not ( = ?auto_835854 ?auto_835860 ) ) ( not ( = ?auto_835854 ?auto_835861 ) ) ( not ( = ?auto_835854 ?auto_835862 ) ) ( not ( = ?auto_835855 ?auto_835856 ) ) ( not ( = ?auto_835855 ?auto_835857 ) ) ( not ( = ?auto_835855 ?auto_835858 ) ) ( not ( = ?auto_835855 ?auto_835859 ) ) ( not ( = ?auto_835855 ?auto_835860 ) ) ( not ( = ?auto_835855 ?auto_835861 ) ) ( not ( = ?auto_835855 ?auto_835862 ) ) ( not ( = ?auto_835856 ?auto_835857 ) ) ( not ( = ?auto_835856 ?auto_835858 ) ) ( not ( = ?auto_835856 ?auto_835859 ) ) ( not ( = ?auto_835856 ?auto_835860 ) ) ( not ( = ?auto_835856 ?auto_835861 ) ) ( not ( = ?auto_835856 ?auto_835862 ) ) ( not ( = ?auto_835857 ?auto_835858 ) ) ( not ( = ?auto_835857 ?auto_835859 ) ) ( not ( = ?auto_835857 ?auto_835860 ) ) ( not ( = ?auto_835857 ?auto_835861 ) ) ( not ( = ?auto_835857 ?auto_835862 ) ) ( not ( = ?auto_835858 ?auto_835859 ) ) ( not ( = ?auto_835858 ?auto_835860 ) ) ( not ( = ?auto_835858 ?auto_835861 ) ) ( not ( = ?auto_835858 ?auto_835862 ) ) ( not ( = ?auto_835859 ?auto_835860 ) ) ( not ( = ?auto_835859 ?auto_835861 ) ) ( not ( = ?auto_835859 ?auto_835862 ) ) ( not ( = ?auto_835860 ?auto_835861 ) ) ( not ( = ?auto_835860 ?auto_835862 ) ) ( not ( = ?auto_835861 ?auto_835862 ) ) ( ON ?auto_835860 ?auto_835861 ) ( ON ?auto_835859 ?auto_835860 ) ( ON ?auto_835858 ?auto_835859 ) ( ON ?auto_835857 ?auto_835858 ) ( ON ?auto_835856 ?auto_835857 ) ( ON ?auto_835855 ?auto_835856 ) ( ON ?auto_835854 ?auto_835855 ) ( ON ?auto_835853 ?auto_835854 ) ( ON ?auto_835852 ?auto_835853 ) ( CLEAR ?auto_835850 ) ( ON ?auto_835851 ?auto_835852 ) ( CLEAR ?auto_835851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_835844 ?auto_835845 ?auto_835846 ?auto_835847 ?auto_835848 ?auto_835849 ?auto_835850 ?auto_835851 )
      ( MAKE-18PILE ?auto_835844 ?auto_835845 ?auto_835846 ?auto_835847 ?auto_835848 ?auto_835849 ?auto_835850 ?auto_835851 ?auto_835852 ?auto_835853 ?auto_835854 ?auto_835855 ?auto_835856 ?auto_835857 ?auto_835858 ?auto_835859 ?auto_835860 ?auto_835861 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_835881 - BLOCK
      ?auto_835882 - BLOCK
      ?auto_835883 - BLOCK
      ?auto_835884 - BLOCK
      ?auto_835885 - BLOCK
      ?auto_835886 - BLOCK
      ?auto_835887 - BLOCK
      ?auto_835888 - BLOCK
      ?auto_835889 - BLOCK
      ?auto_835890 - BLOCK
      ?auto_835891 - BLOCK
      ?auto_835892 - BLOCK
      ?auto_835893 - BLOCK
      ?auto_835894 - BLOCK
      ?auto_835895 - BLOCK
      ?auto_835896 - BLOCK
      ?auto_835897 - BLOCK
      ?auto_835898 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_835898 ) ( ON-TABLE ?auto_835881 ) ( ON ?auto_835882 ?auto_835881 ) ( ON ?auto_835883 ?auto_835882 ) ( ON ?auto_835884 ?auto_835883 ) ( ON ?auto_835885 ?auto_835884 ) ( ON ?auto_835886 ?auto_835885 ) ( ON ?auto_835887 ?auto_835886 ) ( not ( = ?auto_835881 ?auto_835882 ) ) ( not ( = ?auto_835881 ?auto_835883 ) ) ( not ( = ?auto_835881 ?auto_835884 ) ) ( not ( = ?auto_835881 ?auto_835885 ) ) ( not ( = ?auto_835881 ?auto_835886 ) ) ( not ( = ?auto_835881 ?auto_835887 ) ) ( not ( = ?auto_835881 ?auto_835888 ) ) ( not ( = ?auto_835881 ?auto_835889 ) ) ( not ( = ?auto_835881 ?auto_835890 ) ) ( not ( = ?auto_835881 ?auto_835891 ) ) ( not ( = ?auto_835881 ?auto_835892 ) ) ( not ( = ?auto_835881 ?auto_835893 ) ) ( not ( = ?auto_835881 ?auto_835894 ) ) ( not ( = ?auto_835881 ?auto_835895 ) ) ( not ( = ?auto_835881 ?auto_835896 ) ) ( not ( = ?auto_835881 ?auto_835897 ) ) ( not ( = ?auto_835881 ?auto_835898 ) ) ( not ( = ?auto_835882 ?auto_835883 ) ) ( not ( = ?auto_835882 ?auto_835884 ) ) ( not ( = ?auto_835882 ?auto_835885 ) ) ( not ( = ?auto_835882 ?auto_835886 ) ) ( not ( = ?auto_835882 ?auto_835887 ) ) ( not ( = ?auto_835882 ?auto_835888 ) ) ( not ( = ?auto_835882 ?auto_835889 ) ) ( not ( = ?auto_835882 ?auto_835890 ) ) ( not ( = ?auto_835882 ?auto_835891 ) ) ( not ( = ?auto_835882 ?auto_835892 ) ) ( not ( = ?auto_835882 ?auto_835893 ) ) ( not ( = ?auto_835882 ?auto_835894 ) ) ( not ( = ?auto_835882 ?auto_835895 ) ) ( not ( = ?auto_835882 ?auto_835896 ) ) ( not ( = ?auto_835882 ?auto_835897 ) ) ( not ( = ?auto_835882 ?auto_835898 ) ) ( not ( = ?auto_835883 ?auto_835884 ) ) ( not ( = ?auto_835883 ?auto_835885 ) ) ( not ( = ?auto_835883 ?auto_835886 ) ) ( not ( = ?auto_835883 ?auto_835887 ) ) ( not ( = ?auto_835883 ?auto_835888 ) ) ( not ( = ?auto_835883 ?auto_835889 ) ) ( not ( = ?auto_835883 ?auto_835890 ) ) ( not ( = ?auto_835883 ?auto_835891 ) ) ( not ( = ?auto_835883 ?auto_835892 ) ) ( not ( = ?auto_835883 ?auto_835893 ) ) ( not ( = ?auto_835883 ?auto_835894 ) ) ( not ( = ?auto_835883 ?auto_835895 ) ) ( not ( = ?auto_835883 ?auto_835896 ) ) ( not ( = ?auto_835883 ?auto_835897 ) ) ( not ( = ?auto_835883 ?auto_835898 ) ) ( not ( = ?auto_835884 ?auto_835885 ) ) ( not ( = ?auto_835884 ?auto_835886 ) ) ( not ( = ?auto_835884 ?auto_835887 ) ) ( not ( = ?auto_835884 ?auto_835888 ) ) ( not ( = ?auto_835884 ?auto_835889 ) ) ( not ( = ?auto_835884 ?auto_835890 ) ) ( not ( = ?auto_835884 ?auto_835891 ) ) ( not ( = ?auto_835884 ?auto_835892 ) ) ( not ( = ?auto_835884 ?auto_835893 ) ) ( not ( = ?auto_835884 ?auto_835894 ) ) ( not ( = ?auto_835884 ?auto_835895 ) ) ( not ( = ?auto_835884 ?auto_835896 ) ) ( not ( = ?auto_835884 ?auto_835897 ) ) ( not ( = ?auto_835884 ?auto_835898 ) ) ( not ( = ?auto_835885 ?auto_835886 ) ) ( not ( = ?auto_835885 ?auto_835887 ) ) ( not ( = ?auto_835885 ?auto_835888 ) ) ( not ( = ?auto_835885 ?auto_835889 ) ) ( not ( = ?auto_835885 ?auto_835890 ) ) ( not ( = ?auto_835885 ?auto_835891 ) ) ( not ( = ?auto_835885 ?auto_835892 ) ) ( not ( = ?auto_835885 ?auto_835893 ) ) ( not ( = ?auto_835885 ?auto_835894 ) ) ( not ( = ?auto_835885 ?auto_835895 ) ) ( not ( = ?auto_835885 ?auto_835896 ) ) ( not ( = ?auto_835885 ?auto_835897 ) ) ( not ( = ?auto_835885 ?auto_835898 ) ) ( not ( = ?auto_835886 ?auto_835887 ) ) ( not ( = ?auto_835886 ?auto_835888 ) ) ( not ( = ?auto_835886 ?auto_835889 ) ) ( not ( = ?auto_835886 ?auto_835890 ) ) ( not ( = ?auto_835886 ?auto_835891 ) ) ( not ( = ?auto_835886 ?auto_835892 ) ) ( not ( = ?auto_835886 ?auto_835893 ) ) ( not ( = ?auto_835886 ?auto_835894 ) ) ( not ( = ?auto_835886 ?auto_835895 ) ) ( not ( = ?auto_835886 ?auto_835896 ) ) ( not ( = ?auto_835886 ?auto_835897 ) ) ( not ( = ?auto_835886 ?auto_835898 ) ) ( not ( = ?auto_835887 ?auto_835888 ) ) ( not ( = ?auto_835887 ?auto_835889 ) ) ( not ( = ?auto_835887 ?auto_835890 ) ) ( not ( = ?auto_835887 ?auto_835891 ) ) ( not ( = ?auto_835887 ?auto_835892 ) ) ( not ( = ?auto_835887 ?auto_835893 ) ) ( not ( = ?auto_835887 ?auto_835894 ) ) ( not ( = ?auto_835887 ?auto_835895 ) ) ( not ( = ?auto_835887 ?auto_835896 ) ) ( not ( = ?auto_835887 ?auto_835897 ) ) ( not ( = ?auto_835887 ?auto_835898 ) ) ( not ( = ?auto_835888 ?auto_835889 ) ) ( not ( = ?auto_835888 ?auto_835890 ) ) ( not ( = ?auto_835888 ?auto_835891 ) ) ( not ( = ?auto_835888 ?auto_835892 ) ) ( not ( = ?auto_835888 ?auto_835893 ) ) ( not ( = ?auto_835888 ?auto_835894 ) ) ( not ( = ?auto_835888 ?auto_835895 ) ) ( not ( = ?auto_835888 ?auto_835896 ) ) ( not ( = ?auto_835888 ?auto_835897 ) ) ( not ( = ?auto_835888 ?auto_835898 ) ) ( not ( = ?auto_835889 ?auto_835890 ) ) ( not ( = ?auto_835889 ?auto_835891 ) ) ( not ( = ?auto_835889 ?auto_835892 ) ) ( not ( = ?auto_835889 ?auto_835893 ) ) ( not ( = ?auto_835889 ?auto_835894 ) ) ( not ( = ?auto_835889 ?auto_835895 ) ) ( not ( = ?auto_835889 ?auto_835896 ) ) ( not ( = ?auto_835889 ?auto_835897 ) ) ( not ( = ?auto_835889 ?auto_835898 ) ) ( not ( = ?auto_835890 ?auto_835891 ) ) ( not ( = ?auto_835890 ?auto_835892 ) ) ( not ( = ?auto_835890 ?auto_835893 ) ) ( not ( = ?auto_835890 ?auto_835894 ) ) ( not ( = ?auto_835890 ?auto_835895 ) ) ( not ( = ?auto_835890 ?auto_835896 ) ) ( not ( = ?auto_835890 ?auto_835897 ) ) ( not ( = ?auto_835890 ?auto_835898 ) ) ( not ( = ?auto_835891 ?auto_835892 ) ) ( not ( = ?auto_835891 ?auto_835893 ) ) ( not ( = ?auto_835891 ?auto_835894 ) ) ( not ( = ?auto_835891 ?auto_835895 ) ) ( not ( = ?auto_835891 ?auto_835896 ) ) ( not ( = ?auto_835891 ?auto_835897 ) ) ( not ( = ?auto_835891 ?auto_835898 ) ) ( not ( = ?auto_835892 ?auto_835893 ) ) ( not ( = ?auto_835892 ?auto_835894 ) ) ( not ( = ?auto_835892 ?auto_835895 ) ) ( not ( = ?auto_835892 ?auto_835896 ) ) ( not ( = ?auto_835892 ?auto_835897 ) ) ( not ( = ?auto_835892 ?auto_835898 ) ) ( not ( = ?auto_835893 ?auto_835894 ) ) ( not ( = ?auto_835893 ?auto_835895 ) ) ( not ( = ?auto_835893 ?auto_835896 ) ) ( not ( = ?auto_835893 ?auto_835897 ) ) ( not ( = ?auto_835893 ?auto_835898 ) ) ( not ( = ?auto_835894 ?auto_835895 ) ) ( not ( = ?auto_835894 ?auto_835896 ) ) ( not ( = ?auto_835894 ?auto_835897 ) ) ( not ( = ?auto_835894 ?auto_835898 ) ) ( not ( = ?auto_835895 ?auto_835896 ) ) ( not ( = ?auto_835895 ?auto_835897 ) ) ( not ( = ?auto_835895 ?auto_835898 ) ) ( not ( = ?auto_835896 ?auto_835897 ) ) ( not ( = ?auto_835896 ?auto_835898 ) ) ( not ( = ?auto_835897 ?auto_835898 ) ) ( ON ?auto_835897 ?auto_835898 ) ( ON ?auto_835896 ?auto_835897 ) ( ON ?auto_835895 ?auto_835896 ) ( ON ?auto_835894 ?auto_835895 ) ( ON ?auto_835893 ?auto_835894 ) ( ON ?auto_835892 ?auto_835893 ) ( ON ?auto_835891 ?auto_835892 ) ( ON ?auto_835890 ?auto_835891 ) ( ON ?auto_835889 ?auto_835890 ) ( CLEAR ?auto_835887 ) ( ON ?auto_835888 ?auto_835889 ) ( CLEAR ?auto_835888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_835881 ?auto_835882 ?auto_835883 ?auto_835884 ?auto_835885 ?auto_835886 ?auto_835887 ?auto_835888 )
      ( MAKE-18PILE ?auto_835881 ?auto_835882 ?auto_835883 ?auto_835884 ?auto_835885 ?auto_835886 ?auto_835887 ?auto_835888 ?auto_835889 ?auto_835890 ?auto_835891 ?auto_835892 ?auto_835893 ?auto_835894 ?auto_835895 ?auto_835896 ?auto_835897 ?auto_835898 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_835917 - BLOCK
      ?auto_835918 - BLOCK
      ?auto_835919 - BLOCK
      ?auto_835920 - BLOCK
      ?auto_835921 - BLOCK
      ?auto_835922 - BLOCK
      ?auto_835923 - BLOCK
      ?auto_835924 - BLOCK
      ?auto_835925 - BLOCK
      ?auto_835926 - BLOCK
      ?auto_835927 - BLOCK
      ?auto_835928 - BLOCK
      ?auto_835929 - BLOCK
      ?auto_835930 - BLOCK
      ?auto_835931 - BLOCK
      ?auto_835932 - BLOCK
      ?auto_835933 - BLOCK
      ?auto_835934 - BLOCK
    )
    :vars
    (
      ?auto_835935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_835934 ?auto_835935 ) ( ON-TABLE ?auto_835917 ) ( ON ?auto_835918 ?auto_835917 ) ( ON ?auto_835919 ?auto_835918 ) ( ON ?auto_835920 ?auto_835919 ) ( ON ?auto_835921 ?auto_835920 ) ( ON ?auto_835922 ?auto_835921 ) ( not ( = ?auto_835917 ?auto_835918 ) ) ( not ( = ?auto_835917 ?auto_835919 ) ) ( not ( = ?auto_835917 ?auto_835920 ) ) ( not ( = ?auto_835917 ?auto_835921 ) ) ( not ( = ?auto_835917 ?auto_835922 ) ) ( not ( = ?auto_835917 ?auto_835923 ) ) ( not ( = ?auto_835917 ?auto_835924 ) ) ( not ( = ?auto_835917 ?auto_835925 ) ) ( not ( = ?auto_835917 ?auto_835926 ) ) ( not ( = ?auto_835917 ?auto_835927 ) ) ( not ( = ?auto_835917 ?auto_835928 ) ) ( not ( = ?auto_835917 ?auto_835929 ) ) ( not ( = ?auto_835917 ?auto_835930 ) ) ( not ( = ?auto_835917 ?auto_835931 ) ) ( not ( = ?auto_835917 ?auto_835932 ) ) ( not ( = ?auto_835917 ?auto_835933 ) ) ( not ( = ?auto_835917 ?auto_835934 ) ) ( not ( = ?auto_835917 ?auto_835935 ) ) ( not ( = ?auto_835918 ?auto_835919 ) ) ( not ( = ?auto_835918 ?auto_835920 ) ) ( not ( = ?auto_835918 ?auto_835921 ) ) ( not ( = ?auto_835918 ?auto_835922 ) ) ( not ( = ?auto_835918 ?auto_835923 ) ) ( not ( = ?auto_835918 ?auto_835924 ) ) ( not ( = ?auto_835918 ?auto_835925 ) ) ( not ( = ?auto_835918 ?auto_835926 ) ) ( not ( = ?auto_835918 ?auto_835927 ) ) ( not ( = ?auto_835918 ?auto_835928 ) ) ( not ( = ?auto_835918 ?auto_835929 ) ) ( not ( = ?auto_835918 ?auto_835930 ) ) ( not ( = ?auto_835918 ?auto_835931 ) ) ( not ( = ?auto_835918 ?auto_835932 ) ) ( not ( = ?auto_835918 ?auto_835933 ) ) ( not ( = ?auto_835918 ?auto_835934 ) ) ( not ( = ?auto_835918 ?auto_835935 ) ) ( not ( = ?auto_835919 ?auto_835920 ) ) ( not ( = ?auto_835919 ?auto_835921 ) ) ( not ( = ?auto_835919 ?auto_835922 ) ) ( not ( = ?auto_835919 ?auto_835923 ) ) ( not ( = ?auto_835919 ?auto_835924 ) ) ( not ( = ?auto_835919 ?auto_835925 ) ) ( not ( = ?auto_835919 ?auto_835926 ) ) ( not ( = ?auto_835919 ?auto_835927 ) ) ( not ( = ?auto_835919 ?auto_835928 ) ) ( not ( = ?auto_835919 ?auto_835929 ) ) ( not ( = ?auto_835919 ?auto_835930 ) ) ( not ( = ?auto_835919 ?auto_835931 ) ) ( not ( = ?auto_835919 ?auto_835932 ) ) ( not ( = ?auto_835919 ?auto_835933 ) ) ( not ( = ?auto_835919 ?auto_835934 ) ) ( not ( = ?auto_835919 ?auto_835935 ) ) ( not ( = ?auto_835920 ?auto_835921 ) ) ( not ( = ?auto_835920 ?auto_835922 ) ) ( not ( = ?auto_835920 ?auto_835923 ) ) ( not ( = ?auto_835920 ?auto_835924 ) ) ( not ( = ?auto_835920 ?auto_835925 ) ) ( not ( = ?auto_835920 ?auto_835926 ) ) ( not ( = ?auto_835920 ?auto_835927 ) ) ( not ( = ?auto_835920 ?auto_835928 ) ) ( not ( = ?auto_835920 ?auto_835929 ) ) ( not ( = ?auto_835920 ?auto_835930 ) ) ( not ( = ?auto_835920 ?auto_835931 ) ) ( not ( = ?auto_835920 ?auto_835932 ) ) ( not ( = ?auto_835920 ?auto_835933 ) ) ( not ( = ?auto_835920 ?auto_835934 ) ) ( not ( = ?auto_835920 ?auto_835935 ) ) ( not ( = ?auto_835921 ?auto_835922 ) ) ( not ( = ?auto_835921 ?auto_835923 ) ) ( not ( = ?auto_835921 ?auto_835924 ) ) ( not ( = ?auto_835921 ?auto_835925 ) ) ( not ( = ?auto_835921 ?auto_835926 ) ) ( not ( = ?auto_835921 ?auto_835927 ) ) ( not ( = ?auto_835921 ?auto_835928 ) ) ( not ( = ?auto_835921 ?auto_835929 ) ) ( not ( = ?auto_835921 ?auto_835930 ) ) ( not ( = ?auto_835921 ?auto_835931 ) ) ( not ( = ?auto_835921 ?auto_835932 ) ) ( not ( = ?auto_835921 ?auto_835933 ) ) ( not ( = ?auto_835921 ?auto_835934 ) ) ( not ( = ?auto_835921 ?auto_835935 ) ) ( not ( = ?auto_835922 ?auto_835923 ) ) ( not ( = ?auto_835922 ?auto_835924 ) ) ( not ( = ?auto_835922 ?auto_835925 ) ) ( not ( = ?auto_835922 ?auto_835926 ) ) ( not ( = ?auto_835922 ?auto_835927 ) ) ( not ( = ?auto_835922 ?auto_835928 ) ) ( not ( = ?auto_835922 ?auto_835929 ) ) ( not ( = ?auto_835922 ?auto_835930 ) ) ( not ( = ?auto_835922 ?auto_835931 ) ) ( not ( = ?auto_835922 ?auto_835932 ) ) ( not ( = ?auto_835922 ?auto_835933 ) ) ( not ( = ?auto_835922 ?auto_835934 ) ) ( not ( = ?auto_835922 ?auto_835935 ) ) ( not ( = ?auto_835923 ?auto_835924 ) ) ( not ( = ?auto_835923 ?auto_835925 ) ) ( not ( = ?auto_835923 ?auto_835926 ) ) ( not ( = ?auto_835923 ?auto_835927 ) ) ( not ( = ?auto_835923 ?auto_835928 ) ) ( not ( = ?auto_835923 ?auto_835929 ) ) ( not ( = ?auto_835923 ?auto_835930 ) ) ( not ( = ?auto_835923 ?auto_835931 ) ) ( not ( = ?auto_835923 ?auto_835932 ) ) ( not ( = ?auto_835923 ?auto_835933 ) ) ( not ( = ?auto_835923 ?auto_835934 ) ) ( not ( = ?auto_835923 ?auto_835935 ) ) ( not ( = ?auto_835924 ?auto_835925 ) ) ( not ( = ?auto_835924 ?auto_835926 ) ) ( not ( = ?auto_835924 ?auto_835927 ) ) ( not ( = ?auto_835924 ?auto_835928 ) ) ( not ( = ?auto_835924 ?auto_835929 ) ) ( not ( = ?auto_835924 ?auto_835930 ) ) ( not ( = ?auto_835924 ?auto_835931 ) ) ( not ( = ?auto_835924 ?auto_835932 ) ) ( not ( = ?auto_835924 ?auto_835933 ) ) ( not ( = ?auto_835924 ?auto_835934 ) ) ( not ( = ?auto_835924 ?auto_835935 ) ) ( not ( = ?auto_835925 ?auto_835926 ) ) ( not ( = ?auto_835925 ?auto_835927 ) ) ( not ( = ?auto_835925 ?auto_835928 ) ) ( not ( = ?auto_835925 ?auto_835929 ) ) ( not ( = ?auto_835925 ?auto_835930 ) ) ( not ( = ?auto_835925 ?auto_835931 ) ) ( not ( = ?auto_835925 ?auto_835932 ) ) ( not ( = ?auto_835925 ?auto_835933 ) ) ( not ( = ?auto_835925 ?auto_835934 ) ) ( not ( = ?auto_835925 ?auto_835935 ) ) ( not ( = ?auto_835926 ?auto_835927 ) ) ( not ( = ?auto_835926 ?auto_835928 ) ) ( not ( = ?auto_835926 ?auto_835929 ) ) ( not ( = ?auto_835926 ?auto_835930 ) ) ( not ( = ?auto_835926 ?auto_835931 ) ) ( not ( = ?auto_835926 ?auto_835932 ) ) ( not ( = ?auto_835926 ?auto_835933 ) ) ( not ( = ?auto_835926 ?auto_835934 ) ) ( not ( = ?auto_835926 ?auto_835935 ) ) ( not ( = ?auto_835927 ?auto_835928 ) ) ( not ( = ?auto_835927 ?auto_835929 ) ) ( not ( = ?auto_835927 ?auto_835930 ) ) ( not ( = ?auto_835927 ?auto_835931 ) ) ( not ( = ?auto_835927 ?auto_835932 ) ) ( not ( = ?auto_835927 ?auto_835933 ) ) ( not ( = ?auto_835927 ?auto_835934 ) ) ( not ( = ?auto_835927 ?auto_835935 ) ) ( not ( = ?auto_835928 ?auto_835929 ) ) ( not ( = ?auto_835928 ?auto_835930 ) ) ( not ( = ?auto_835928 ?auto_835931 ) ) ( not ( = ?auto_835928 ?auto_835932 ) ) ( not ( = ?auto_835928 ?auto_835933 ) ) ( not ( = ?auto_835928 ?auto_835934 ) ) ( not ( = ?auto_835928 ?auto_835935 ) ) ( not ( = ?auto_835929 ?auto_835930 ) ) ( not ( = ?auto_835929 ?auto_835931 ) ) ( not ( = ?auto_835929 ?auto_835932 ) ) ( not ( = ?auto_835929 ?auto_835933 ) ) ( not ( = ?auto_835929 ?auto_835934 ) ) ( not ( = ?auto_835929 ?auto_835935 ) ) ( not ( = ?auto_835930 ?auto_835931 ) ) ( not ( = ?auto_835930 ?auto_835932 ) ) ( not ( = ?auto_835930 ?auto_835933 ) ) ( not ( = ?auto_835930 ?auto_835934 ) ) ( not ( = ?auto_835930 ?auto_835935 ) ) ( not ( = ?auto_835931 ?auto_835932 ) ) ( not ( = ?auto_835931 ?auto_835933 ) ) ( not ( = ?auto_835931 ?auto_835934 ) ) ( not ( = ?auto_835931 ?auto_835935 ) ) ( not ( = ?auto_835932 ?auto_835933 ) ) ( not ( = ?auto_835932 ?auto_835934 ) ) ( not ( = ?auto_835932 ?auto_835935 ) ) ( not ( = ?auto_835933 ?auto_835934 ) ) ( not ( = ?auto_835933 ?auto_835935 ) ) ( not ( = ?auto_835934 ?auto_835935 ) ) ( ON ?auto_835933 ?auto_835934 ) ( ON ?auto_835932 ?auto_835933 ) ( ON ?auto_835931 ?auto_835932 ) ( ON ?auto_835930 ?auto_835931 ) ( ON ?auto_835929 ?auto_835930 ) ( ON ?auto_835928 ?auto_835929 ) ( ON ?auto_835927 ?auto_835928 ) ( ON ?auto_835926 ?auto_835927 ) ( ON ?auto_835925 ?auto_835926 ) ( ON ?auto_835924 ?auto_835925 ) ( CLEAR ?auto_835922 ) ( ON ?auto_835923 ?auto_835924 ) ( CLEAR ?auto_835923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_835917 ?auto_835918 ?auto_835919 ?auto_835920 ?auto_835921 ?auto_835922 ?auto_835923 )
      ( MAKE-18PILE ?auto_835917 ?auto_835918 ?auto_835919 ?auto_835920 ?auto_835921 ?auto_835922 ?auto_835923 ?auto_835924 ?auto_835925 ?auto_835926 ?auto_835927 ?auto_835928 ?auto_835929 ?auto_835930 ?auto_835931 ?auto_835932 ?auto_835933 ?auto_835934 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_835954 - BLOCK
      ?auto_835955 - BLOCK
      ?auto_835956 - BLOCK
      ?auto_835957 - BLOCK
      ?auto_835958 - BLOCK
      ?auto_835959 - BLOCK
      ?auto_835960 - BLOCK
      ?auto_835961 - BLOCK
      ?auto_835962 - BLOCK
      ?auto_835963 - BLOCK
      ?auto_835964 - BLOCK
      ?auto_835965 - BLOCK
      ?auto_835966 - BLOCK
      ?auto_835967 - BLOCK
      ?auto_835968 - BLOCK
      ?auto_835969 - BLOCK
      ?auto_835970 - BLOCK
      ?auto_835971 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_835971 ) ( ON-TABLE ?auto_835954 ) ( ON ?auto_835955 ?auto_835954 ) ( ON ?auto_835956 ?auto_835955 ) ( ON ?auto_835957 ?auto_835956 ) ( ON ?auto_835958 ?auto_835957 ) ( ON ?auto_835959 ?auto_835958 ) ( not ( = ?auto_835954 ?auto_835955 ) ) ( not ( = ?auto_835954 ?auto_835956 ) ) ( not ( = ?auto_835954 ?auto_835957 ) ) ( not ( = ?auto_835954 ?auto_835958 ) ) ( not ( = ?auto_835954 ?auto_835959 ) ) ( not ( = ?auto_835954 ?auto_835960 ) ) ( not ( = ?auto_835954 ?auto_835961 ) ) ( not ( = ?auto_835954 ?auto_835962 ) ) ( not ( = ?auto_835954 ?auto_835963 ) ) ( not ( = ?auto_835954 ?auto_835964 ) ) ( not ( = ?auto_835954 ?auto_835965 ) ) ( not ( = ?auto_835954 ?auto_835966 ) ) ( not ( = ?auto_835954 ?auto_835967 ) ) ( not ( = ?auto_835954 ?auto_835968 ) ) ( not ( = ?auto_835954 ?auto_835969 ) ) ( not ( = ?auto_835954 ?auto_835970 ) ) ( not ( = ?auto_835954 ?auto_835971 ) ) ( not ( = ?auto_835955 ?auto_835956 ) ) ( not ( = ?auto_835955 ?auto_835957 ) ) ( not ( = ?auto_835955 ?auto_835958 ) ) ( not ( = ?auto_835955 ?auto_835959 ) ) ( not ( = ?auto_835955 ?auto_835960 ) ) ( not ( = ?auto_835955 ?auto_835961 ) ) ( not ( = ?auto_835955 ?auto_835962 ) ) ( not ( = ?auto_835955 ?auto_835963 ) ) ( not ( = ?auto_835955 ?auto_835964 ) ) ( not ( = ?auto_835955 ?auto_835965 ) ) ( not ( = ?auto_835955 ?auto_835966 ) ) ( not ( = ?auto_835955 ?auto_835967 ) ) ( not ( = ?auto_835955 ?auto_835968 ) ) ( not ( = ?auto_835955 ?auto_835969 ) ) ( not ( = ?auto_835955 ?auto_835970 ) ) ( not ( = ?auto_835955 ?auto_835971 ) ) ( not ( = ?auto_835956 ?auto_835957 ) ) ( not ( = ?auto_835956 ?auto_835958 ) ) ( not ( = ?auto_835956 ?auto_835959 ) ) ( not ( = ?auto_835956 ?auto_835960 ) ) ( not ( = ?auto_835956 ?auto_835961 ) ) ( not ( = ?auto_835956 ?auto_835962 ) ) ( not ( = ?auto_835956 ?auto_835963 ) ) ( not ( = ?auto_835956 ?auto_835964 ) ) ( not ( = ?auto_835956 ?auto_835965 ) ) ( not ( = ?auto_835956 ?auto_835966 ) ) ( not ( = ?auto_835956 ?auto_835967 ) ) ( not ( = ?auto_835956 ?auto_835968 ) ) ( not ( = ?auto_835956 ?auto_835969 ) ) ( not ( = ?auto_835956 ?auto_835970 ) ) ( not ( = ?auto_835956 ?auto_835971 ) ) ( not ( = ?auto_835957 ?auto_835958 ) ) ( not ( = ?auto_835957 ?auto_835959 ) ) ( not ( = ?auto_835957 ?auto_835960 ) ) ( not ( = ?auto_835957 ?auto_835961 ) ) ( not ( = ?auto_835957 ?auto_835962 ) ) ( not ( = ?auto_835957 ?auto_835963 ) ) ( not ( = ?auto_835957 ?auto_835964 ) ) ( not ( = ?auto_835957 ?auto_835965 ) ) ( not ( = ?auto_835957 ?auto_835966 ) ) ( not ( = ?auto_835957 ?auto_835967 ) ) ( not ( = ?auto_835957 ?auto_835968 ) ) ( not ( = ?auto_835957 ?auto_835969 ) ) ( not ( = ?auto_835957 ?auto_835970 ) ) ( not ( = ?auto_835957 ?auto_835971 ) ) ( not ( = ?auto_835958 ?auto_835959 ) ) ( not ( = ?auto_835958 ?auto_835960 ) ) ( not ( = ?auto_835958 ?auto_835961 ) ) ( not ( = ?auto_835958 ?auto_835962 ) ) ( not ( = ?auto_835958 ?auto_835963 ) ) ( not ( = ?auto_835958 ?auto_835964 ) ) ( not ( = ?auto_835958 ?auto_835965 ) ) ( not ( = ?auto_835958 ?auto_835966 ) ) ( not ( = ?auto_835958 ?auto_835967 ) ) ( not ( = ?auto_835958 ?auto_835968 ) ) ( not ( = ?auto_835958 ?auto_835969 ) ) ( not ( = ?auto_835958 ?auto_835970 ) ) ( not ( = ?auto_835958 ?auto_835971 ) ) ( not ( = ?auto_835959 ?auto_835960 ) ) ( not ( = ?auto_835959 ?auto_835961 ) ) ( not ( = ?auto_835959 ?auto_835962 ) ) ( not ( = ?auto_835959 ?auto_835963 ) ) ( not ( = ?auto_835959 ?auto_835964 ) ) ( not ( = ?auto_835959 ?auto_835965 ) ) ( not ( = ?auto_835959 ?auto_835966 ) ) ( not ( = ?auto_835959 ?auto_835967 ) ) ( not ( = ?auto_835959 ?auto_835968 ) ) ( not ( = ?auto_835959 ?auto_835969 ) ) ( not ( = ?auto_835959 ?auto_835970 ) ) ( not ( = ?auto_835959 ?auto_835971 ) ) ( not ( = ?auto_835960 ?auto_835961 ) ) ( not ( = ?auto_835960 ?auto_835962 ) ) ( not ( = ?auto_835960 ?auto_835963 ) ) ( not ( = ?auto_835960 ?auto_835964 ) ) ( not ( = ?auto_835960 ?auto_835965 ) ) ( not ( = ?auto_835960 ?auto_835966 ) ) ( not ( = ?auto_835960 ?auto_835967 ) ) ( not ( = ?auto_835960 ?auto_835968 ) ) ( not ( = ?auto_835960 ?auto_835969 ) ) ( not ( = ?auto_835960 ?auto_835970 ) ) ( not ( = ?auto_835960 ?auto_835971 ) ) ( not ( = ?auto_835961 ?auto_835962 ) ) ( not ( = ?auto_835961 ?auto_835963 ) ) ( not ( = ?auto_835961 ?auto_835964 ) ) ( not ( = ?auto_835961 ?auto_835965 ) ) ( not ( = ?auto_835961 ?auto_835966 ) ) ( not ( = ?auto_835961 ?auto_835967 ) ) ( not ( = ?auto_835961 ?auto_835968 ) ) ( not ( = ?auto_835961 ?auto_835969 ) ) ( not ( = ?auto_835961 ?auto_835970 ) ) ( not ( = ?auto_835961 ?auto_835971 ) ) ( not ( = ?auto_835962 ?auto_835963 ) ) ( not ( = ?auto_835962 ?auto_835964 ) ) ( not ( = ?auto_835962 ?auto_835965 ) ) ( not ( = ?auto_835962 ?auto_835966 ) ) ( not ( = ?auto_835962 ?auto_835967 ) ) ( not ( = ?auto_835962 ?auto_835968 ) ) ( not ( = ?auto_835962 ?auto_835969 ) ) ( not ( = ?auto_835962 ?auto_835970 ) ) ( not ( = ?auto_835962 ?auto_835971 ) ) ( not ( = ?auto_835963 ?auto_835964 ) ) ( not ( = ?auto_835963 ?auto_835965 ) ) ( not ( = ?auto_835963 ?auto_835966 ) ) ( not ( = ?auto_835963 ?auto_835967 ) ) ( not ( = ?auto_835963 ?auto_835968 ) ) ( not ( = ?auto_835963 ?auto_835969 ) ) ( not ( = ?auto_835963 ?auto_835970 ) ) ( not ( = ?auto_835963 ?auto_835971 ) ) ( not ( = ?auto_835964 ?auto_835965 ) ) ( not ( = ?auto_835964 ?auto_835966 ) ) ( not ( = ?auto_835964 ?auto_835967 ) ) ( not ( = ?auto_835964 ?auto_835968 ) ) ( not ( = ?auto_835964 ?auto_835969 ) ) ( not ( = ?auto_835964 ?auto_835970 ) ) ( not ( = ?auto_835964 ?auto_835971 ) ) ( not ( = ?auto_835965 ?auto_835966 ) ) ( not ( = ?auto_835965 ?auto_835967 ) ) ( not ( = ?auto_835965 ?auto_835968 ) ) ( not ( = ?auto_835965 ?auto_835969 ) ) ( not ( = ?auto_835965 ?auto_835970 ) ) ( not ( = ?auto_835965 ?auto_835971 ) ) ( not ( = ?auto_835966 ?auto_835967 ) ) ( not ( = ?auto_835966 ?auto_835968 ) ) ( not ( = ?auto_835966 ?auto_835969 ) ) ( not ( = ?auto_835966 ?auto_835970 ) ) ( not ( = ?auto_835966 ?auto_835971 ) ) ( not ( = ?auto_835967 ?auto_835968 ) ) ( not ( = ?auto_835967 ?auto_835969 ) ) ( not ( = ?auto_835967 ?auto_835970 ) ) ( not ( = ?auto_835967 ?auto_835971 ) ) ( not ( = ?auto_835968 ?auto_835969 ) ) ( not ( = ?auto_835968 ?auto_835970 ) ) ( not ( = ?auto_835968 ?auto_835971 ) ) ( not ( = ?auto_835969 ?auto_835970 ) ) ( not ( = ?auto_835969 ?auto_835971 ) ) ( not ( = ?auto_835970 ?auto_835971 ) ) ( ON ?auto_835970 ?auto_835971 ) ( ON ?auto_835969 ?auto_835970 ) ( ON ?auto_835968 ?auto_835969 ) ( ON ?auto_835967 ?auto_835968 ) ( ON ?auto_835966 ?auto_835967 ) ( ON ?auto_835965 ?auto_835966 ) ( ON ?auto_835964 ?auto_835965 ) ( ON ?auto_835963 ?auto_835964 ) ( ON ?auto_835962 ?auto_835963 ) ( ON ?auto_835961 ?auto_835962 ) ( CLEAR ?auto_835959 ) ( ON ?auto_835960 ?auto_835961 ) ( CLEAR ?auto_835960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_835954 ?auto_835955 ?auto_835956 ?auto_835957 ?auto_835958 ?auto_835959 ?auto_835960 )
      ( MAKE-18PILE ?auto_835954 ?auto_835955 ?auto_835956 ?auto_835957 ?auto_835958 ?auto_835959 ?auto_835960 ?auto_835961 ?auto_835962 ?auto_835963 ?auto_835964 ?auto_835965 ?auto_835966 ?auto_835967 ?auto_835968 ?auto_835969 ?auto_835970 ?auto_835971 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_835990 - BLOCK
      ?auto_835991 - BLOCK
      ?auto_835992 - BLOCK
      ?auto_835993 - BLOCK
      ?auto_835994 - BLOCK
      ?auto_835995 - BLOCK
      ?auto_835996 - BLOCK
      ?auto_835997 - BLOCK
      ?auto_835998 - BLOCK
      ?auto_835999 - BLOCK
      ?auto_836000 - BLOCK
      ?auto_836001 - BLOCK
      ?auto_836002 - BLOCK
      ?auto_836003 - BLOCK
      ?auto_836004 - BLOCK
      ?auto_836005 - BLOCK
      ?auto_836006 - BLOCK
      ?auto_836007 - BLOCK
    )
    :vars
    (
      ?auto_836008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836007 ?auto_836008 ) ( ON-TABLE ?auto_835990 ) ( ON ?auto_835991 ?auto_835990 ) ( ON ?auto_835992 ?auto_835991 ) ( ON ?auto_835993 ?auto_835992 ) ( ON ?auto_835994 ?auto_835993 ) ( not ( = ?auto_835990 ?auto_835991 ) ) ( not ( = ?auto_835990 ?auto_835992 ) ) ( not ( = ?auto_835990 ?auto_835993 ) ) ( not ( = ?auto_835990 ?auto_835994 ) ) ( not ( = ?auto_835990 ?auto_835995 ) ) ( not ( = ?auto_835990 ?auto_835996 ) ) ( not ( = ?auto_835990 ?auto_835997 ) ) ( not ( = ?auto_835990 ?auto_835998 ) ) ( not ( = ?auto_835990 ?auto_835999 ) ) ( not ( = ?auto_835990 ?auto_836000 ) ) ( not ( = ?auto_835990 ?auto_836001 ) ) ( not ( = ?auto_835990 ?auto_836002 ) ) ( not ( = ?auto_835990 ?auto_836003 ) ) ( not ( = ?auto_835990 ?auto_836004 ) ) ( not ( = ?auto_835990 ?auto_836005 ) ) ( not ( = ?auto_835990 ?auto_836006 ) ) ( not ( = ?auto_835990 ?auto_836007 ) ) ( not ( = ?auto_835990 ?auto_836008 ) ) ( not ( = ?auto_835991 ?auto_835992 ) ) ( not ( = ?auto_835991 ?auto_835993 ) ) ( not ( = ?auto_835991 ?auto_835994 ) ) ( not ( = ?auto_835991 ?auto_835995 ) ) ( not ( = ?auto_835991 ?auto_835996 ) ) ( not ( = ?auto_835991 ?auto_835997 ) ) ( not ( = ?auto_835991 ?auto_835998 ) ) ( not ( = ?auto_835991 ?auto_835999 ) ) ( not ( = ?auto_835991 ?auto_836000 ) ) ( not ( = ?auto_835991 ?auto_836001 ) ) ( not ( = ?auto_835991 ?auto_836002 ) ) ( not ( = ?auto_835991 ?auto_836003 ) ) ( not ( = ?auto_835991 ?auto_836004 ) ) ( not ( = ?auto_835991 ?auto_836005 ) ) ( not ( = ?auto_835991 ?auto_836006 ) ) ( not ( = ?auto_835991 ?auto_836007 ) ) ( not ( = ?auto_835991 ?auto_836008 ) ) ( not ( = ?auto_835992 ?auto_835993 ) ) ( not ( = ?auto_835992 ?auto_835994 ) ) ( not ( = ?auto_835992 ?auto_835995 ) ) ( not ( = ?auto_835992 ?auto_835996 ) ) ( not ( = ?auto_835992 ?auto_835997 ) ) ( not ( = ?auto_835992 ?auto_835998 ) ) ( not ( = ?auto_835992 ?auto_835999 ) ) ( not ( = ?auto_835992 ?auto_836000 ) ) ( not ( = ?auto_835992 ?auto_836001 ) ) ( not ( = ?auto_835992 ?auto_836002 ) ) ( not ( = ?auto_835992 ?auto_836003 ) ) ( not ( = ?auto_835992 ?auto_836004 ) ) ( not ( = ?auto_835992 ?auto_836005 ) ) ( not ( = ?auto_835992 ?auto_836006 ) ) ( not ( = ?auto_835992 ?auto_836007 ) ) ( not ( = ?auto_835992 ?auto_836008 ) ) ( not ( = ?auto_835993 ?auto_835994 ) ) ( not ( = ?auto_835993 ?auto_835995 ) ) ( not ( = ?auto_835993 ?auto_835996 ) ) ( not ( = ?auto_835993 ?auto_835997 ) ) ( not ( = ?auto_835993 ?auto_835998 ) ) ( not ( = ?auto_835993 ?auto_835999 ) ) ( not ( = ?auto_835993 ?auto_836000 ) ) ( not ( = ?auto_835993 ?auto_836001 ) ) ( not ( = ?auto_835993 ?auto_836002 ) ) ( not ( = ?auto_835993 ?auto_836003 ) ) ( not ( = ?auto_835993 ?auto_836004 ) ) ( not ( = ?auto_835993 ?auto_836005 ) ) ( not ( = ?auto_835993 ?auto_836006 ) ) ( not ( = ?auto_835993 ?auto_836007 ) ) ( not ( = ?auto_835993 ?auto_836008 ) ) ( not ( = ?auto_835994 ?auto_835995 ) ) ( not ( = ?auto_835994 ?auto_835996 ) ) ( not ( = ?auto_835994 ?auto_835997 ) ) ( not ( = ?auto_835994 ?auto_835998 ) ) ( not ( = ?auto_835994 ?auto_835999 ) ) ( not ( = ?auto_835994 ?auto_836000 ) ) ( not ( = ?auto_835994 ?auto_836001 ) ) ( not ( = ?auto_835994 ?auto_836002 ) ) ( not ( = ?auto_835994 ?auto_836003 ) ) ( not ( = ?auto_835994 ?auto_836004 ) ) ( not ( = ?auto_835994 ?auto_836005 ) ) ( not ( = ?auto_835994 ?auto_836006 ) ) ( not ( = ?auto_835994 ?auto_836007 ) ) ( not ( = ?auto_835994 ?auto_836008 ) ) ( not ( = ?auto_835995 ?auto_835996 ) ) ( not ( = ?auto_835995 ?auto_835997 ) ) ( not ( = ?auto_835995 ?auto_835998 ) ) ( not ( = ?auto_835995 ?auto_835999 ) ) ( not ( = ?auto_835995 ?auto_836000 ) ) ( not ( = ?auto_835995 ?auto_836001 ) ) ( not ( = ?auto_835995 ?auto_836002 ) ) ( not ( = ?auto_835995 ?auto_836003 ) ) ( not ( = ?auto_835995 ?auto_836004 ) ) ( not ( = ?auto_835995 ?auto_836005 ) ) ( not ( = ?auto_835995 ?auto_836006 ) ) ( not ( = ?auto_835995 ?auto_836007 ) ) ( not ( = ?auto_835995 ?auto_836008 ) ) ( not ( = ?auto_835996 ?auto_835997 ) ) ( not ( = ?auto_835996 ?auto_835998 ) ) ( not ( = ?auto_835996 ?auto_835999 ) ) ( not ( = ?auto_835996 ?auto_836000 ) ) ( not ( = ?auto_835996 ?auto_836001 ) ) ( not ( = ?auto_835996 ?auto_836002 ) ) ( not ( = ?auto_835996 ?auto_836003 ) ) ( not ( = ?auto_835996 ?auto_836004 ) ) ( not ( = ?auto_835996 ?auto_836005 ) ) ( not ( = ?auto_835996 ?auto_836006 ) ) ( not ( = ?auto_835996 ?auto_836007 ) ) ( not ( = ?auto_835996 ?auto_836008 ) ) ( not ( = ?auto_835997 ?auto_835998 ) ) ( not ( = ?auto_835997 ?auto_835999 ) ) ( not ( = ?auto_835997 ?auto_836000 ) ) ( not ( = ?auto_835997 ?auto_836001 ) ) ( not ( = ?auto_835997 ?auto_836002 ) ) ( not ( = ?auto_835997 ?auto_836003 ) ) ( not ( = ?auto_835997 ?auto_836004 ) ) ( not ( = ?auto_835997 ?auto_836005 ) ) ( not ( = ?auto_835997 ?auto_836006 ) ) ( not ( = ?auto_835997 ?auto_836007 ) ) ( not ( = ?auto_835997 ?auto_836008 ) ) ( not ( = ?auto_835998 ?auto_835999 ) ) ( not ( = ?auto_835998 ?auto_836000 ) ) ( not ( = ?auto_835998 ?auto_836001 ) ) ( not ( = ?auto_835998 ?auto_836002 ) ) ( not ( = ?auto_835998 ?auto_836003 ) ) ( not ( = ?auto_835998 ?auto_836004 ) ) ( not ( = ?auto_835998 ?auto_836005 ) ) ( not ( = ?auto_835998 ?auto_836006 ) ) ( not ( = ?auto_835998 ?auto_836007 ) ) ( not ( = ?auto_835998 ?auto_836008 ) ) ( not ( = ?auto_835999 ?auto_836000 ) ) ( not ( = ?auto_835999 ?auto_836001 ) ) ( not ( = ?auto_835999 ?auto_836002 ) ) ( not ( = ?auto_835999 ?auto_836003 ) ) ( not ( = ?auto_835999 ?auto_836004 ) ) ( not ( = ?auto_835999 ?auto_836005 ) ) ( not ( = ?auto_835999 ?auto_836006 ) ) ( not ( = ?auto_835999 ?auto_836007 ) ) ( not ( = ?auto_835999 ?auto_836008 ) ) ( not ( = ?auto_836000 ?auto_836001 ) ) ( not ( = ?auto_836000 ?auto_836002 ) ) ( not ( = ?auto_836000 ?auto_836003 ) ) ( not ( = ?auto_836000 ?auto_836004 ) ) ( not ( = ?auto_836000 ?auto_836005 ) ) ( not ( = ?auto_836000 ?auto_836006 ) ) ( not ( = ?auto_836000 ?auto_836007 ) ) ( not ( = ?auto_836000 ?auto_836008 ) ) ( not ( = ?auto_836001 ?auto_836002 ) ) ( not ( = ?auto_836001 ?auto_836003 ) ) ( not ( = ?auto_836001 ?auto_836004 ) ) ( not ( = ?auto_836001 ?auto_836005 ) ) ( not ( = ?auto_836001 ?auto_836006 ) ) ( not ( = ?auto_836001 ?auto_836007 ) ) ( not ( = ?auto_836001 ?auto_836008 ) ) ( not ( = ?auto_836002 ?auto_836003 ) ) ( not ( = ?auto_836002 ?auto_836004 ) ) ( not ( = ?auto_836002 ?auto_836005 ) ) ( not ( = ?auto_836002 ?auto_836006 ) ) ( not ( = ?auto_836002 ?auto_836007 ) ) ( not ( = ?auto_836002 ?auto_836008 ) ) ( not ( = ?auto_836003 ?auto_836004 ) ) ( not ( = ?auto_836003 ?auto_836005 ) ) ( not ( = ?auto_836003 ?auto_836006 ) ) ( not ( = ?auto_836003 ?auto_836007 ) ) ( not ( = ?auto_836003 ?auto_836008 ) ) ( not ( = ?auto_836004 ?auto_836005 ) ) ( not ( = ?auto_836004 ?auto_836006 ) ) ( not ( = ?auto_836004 ?auto_836007 ) ) ( not ( = ?auto_836004 ?auto_836008 ) ) ( not ( = ?auto_836005 ?auto_836006 ) ) ( not ( = ?auto_836005 ?auto_836007 ) ) ( not ( = ?auto_836005 ?auto_836008 ) ) ( not ( = ?auto_836006 ?auto_836007 ) ) ( not ( = ?auto_836006 ?auto_836008 ) ) ( not ( = ?auto_836007 ?auto_836008 ) ) ( ON ?auto_836006 ?auto_836007 ) ( ON ?auto_836005 ?auto_836006 ) ( ON ?auto_836004 ?auto_836005 ) ( ON ?auto_836003 ?auto_836004 ) ( ON ?auto_836002 ?auto_836003 ) ( ON ?auto_836001 ?auto_836002 ) ( ON ?auto_836000 ?auto_836001 ) ( ON ?auto_835999 ?auto_836000 ) ( ON ?auto_835998 ?auto_835999 ) ( ON ?auto_835997 ?auto_835998 ) ( ON ?auto_835996 ?auto_835997 ) ( CLEAR ?auto_835994 ) ( ON ?auto_835995 ?auto_835996 ) ( CLEAR ?auto_835995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_835990 ?auto_835991 ?auto_835992 ?auto_835993 ?auto_835994 ?auto_835995 )
      ( MAKE-18PILE ?auto_835990 ?auto_835991 ?auto_835992 ?auto_835993 ?auto_835994 ?auto_835995 ?auto_835996 ?auto_835997 ?auto_835998 ?auto_835999 ?auto_836000 ?auto_836001 ?auto_836002 ?auto_836003 ?auto_836004 ?auto_836005 ?auto_836006 ?auto_836007 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_836027 - BLOCK
      ?auto_836028 - BLOCK
      ?auto_836029 - BLOCK
      ?auto_836030 - BLOCK
      ?auto_836031 - BLOCK
      ?auto_836032 - BLOCK
      ?auto_836033 - BLOCK
      ?auto_836034 - BLOCK
      ?auto_836035 - BLOCK
      ?auto_836036 - BLOCK
      ?auto_836037 - BLOCK
      ?auto_836038 - BLOCK
      ?auto_836039 - BLOCK
      ?auto_836040 - BLOCK
      ?auto_836041 - BLOCK
      ?auto_836042 - BLOCK
      ?auto_836043 - BLOCK
      ?auto_836044 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_836044 ) ( ON-TABLE ?auto_836027 ) ( ON ?auto_836028 ?auto_836027 ) ( ON ?auto_836029 ?auto_836028 ) ( ON ?auto_836030 ?auto_836029 ) ( ON ?auto_836031 ?auto_836030 ) ( not ( = ?auto_836027 ?auto_836028 ) ) ( not ( = ?auto_836027 ?auto_836029 ) ) ( not ( = ?auto_836027 ?auto_836030 ) ) ( not ( = ?auto_836027 ?auto_836031 ) ) ( not ( = ?auto_836027 ?auto_836032 ) ) ( not ( = ?auto_836027 ?auto_836033 ) ) ( not ( = ?auto_836027 ?auto_836034 ) ) ( not ( = ?auto_836027 ?auto_836035 ) ) ( not ( = ?auto_836027 ?auto_836036 ) ) ( not ( = ?auto_836027 ?auto_836037 ) ) ( not ( = ?auto_836027 ?auto_836038 ) ) ( not ( = ?auto_836027 ?auto_836039 ) ) ( not ( = ?auto_836027 ?auto_836040 ) ) ( not ( = ?auto_836027 ?auto_836041 ) ) ( not ( = ?auto_836027 ?auto_836042 ) ) ( not ( = ?auto_836027 ?auto_836043 ) ) ( not ( = ?auto_836027 ?auto_836044 ) ) ( not ( = ?auto_836028 ?auto_836029 ) ) ( not ( = ?auto_836028 ?auto_836030 ) ) ( not ( = ?auto_836028 ?auto_836031 ) ) ( not ( = ?auto_836028 ?auto_836032 ) ) ( not ( = ?auto_836028 ?auto_836033 ) ) ( not ( = ?auto_836028 ?auto_836034 ) ) ( not ( = ?auto_836028 ?auto_836035 ) ) ( not ( = ?auto_836028 ?auto_836036 ) ) ( not ( = ?auto_836028 ?auto_836037 ) ) ( not ( = ?auto_836028 ?auto_836038 ) ) ( not ( = ?auto_836028 ?auto_836039 ) ) ( not ( = ?auto_836028 ?auto_836040 ) ) ( not ( = ?auto_836028 ?auto_836041 ) ) ( not ( = ?auto_836028 ?auto_836042 ) ) ( not ( = ?auto_836028 ?auto_836043 ) ) ( not ( = ?auto_836028 ?auto_836044 ) ) ( not ( = ?auto_836029 ?auto_836030 ) ) ( not ( = ?auto_836029 ?auto_836031 ) ) ( not ( = ?auto_836029 ?auto_836032 ) ) ( not ( = ?auto_836029 ?auto_836033 ) ) ( not ( = ?auto_836029 ?auto_836034 ) ) ( not ( = ?auto_836029 ?auto_836035 ) ) ( not ( = ?auto_836029 ?auto_836036 ) ) ( not ( = ?auto_836029 ?auto_836037 ) ) ( not ( = ?auto_836029 ?auto_836038 ) ) ( not ( = ?auto_836029 ?auto_836039 ) ) ( not ( = ?auto_836029 ?auto_836040 ) ) ( not ( = ?auto_836029 ?auto_836041 ) ) ( not ( = ?auto_836029 ?auto_836042 ) ) ( not ( = ?auto_836029 ?auto_836043 ) ) ( not ( = ?auto_836029 ?auto_836044 ) ) ( not ( = ?auto_836030 ?auto_836031 ) ) ( not ( = ?auto_836030 ?auto_836032 ) ) ( not ( = ?auto_836030 ?auto_836033 ) ) ( not ( = ?auto_836030 ?auto_836034 ) ) ( not ( = ?auto_836030 ?auto_836035 ) ) ( not ( = ?auto_836030 ?auto_836036 ) ) ( not ( = ?auto_836030 ?auto_836037 ) ) ( not ( = ?auto_836030 ?auto_836038 ) ) ( not ( = ?auto_836030 ?auto_836039 ) ) ( not ( = ?auto_836030 ?auto_836040 ) ) ( not ( = ?auto_836030 ?auto_836041 ) ) ( not ( = ?auto_836030 ?auto_836042 ) ) ( not ( = ?auto_836030 ?auto_836043 ) ) ( not ( = ?auto_836030 ?auto_836044 ) ) ( not ( = ?auto_836031 ?auto_836032 ) ) ( not ( = ?auto_836031 ?auto_836033 ) ) ( not ( = ?auto_836031 ?auto_836034 ) ) ( not ( = ?auto_836031 ?auto_836035 ) ) ( not ( = ?auto_836031 ?auto_836036 ) ) ( not ( = ?auto_836031 ?auto_836037 ) ) ( not ( = ?auto_836031 ?auto_836038 ) ) ( not ( = ?auto_836031 ?auto_836039 ) ) ( not ( = ?auto_836031 ?auto_836040 ) ) ( not ( = ?auto_836031 ?auto_836041 ) ) ( not ( = ?auto_836031 ?auto_836042 ) ) ( not ( = ?auto_836031 ?auto_836043 ) ) ( not ( = ?auto_836031 ?auto_836044 ) ) ( not ( = ?auto_836032 ?auto_836033 ) ) ( not ( = ?auto_836032 ?auto_836034 ) ) ( not ( = ?auto_836032 ?auto_836035 ) ) ( not ( = ?auto_836032 ?auto_836036 ) ) ( not ( = ?auto_836032 ?auto_836037 ) ) ( not ( = ?auto_836032 ?auto_836038 ) ) ( not ( = ?auto_836032 ?auto_836039 ) ) ( not ( = ?auto_836032 ?auto_836040 ) ) ( not ( = ?auto_836032 ?auto_836041 ) ) ( not ( = ?auto_836032 ?auto_836042 ) ) ( not ( = ?auto_836032 ?auto_836043 ) ) ( not ( = ?auto_836032 ?auto_836044 ) ) ( not ( = ?auto_836033 ?auto_836034 ) ) ( not ( = ?auto_836033 ?auto_836035 ) ) ( not ( = ?auto_836033 ?auto_836036 ) ) ( not ( = ?auto_836033 ?auto_836037 ) ) ( not ( = ?auto_836033 ?auto_836038 ) ) ( not ( = ?auto_836033 ?auto_836039 ) ) ( not ( = ?auto_836033 ?auto_836040 ) ) ( not ( = ?auto_836033 ?auto_836041 ) ) ( not ( = ?auto_836033 ?auto_836042 ) ) ( not ( = ?auto_836033 ?auto_836043 ) ) ( not ( = ?auto_836033 ?auto_836044 ) ) ( not ( = ?auto_836034 ?auto_836035 ) ) ( not ( = ?auto_836034 ?auto_836036 ) ) ( not ( = ?auto_836034 ?auto_836037 ) ) ( not ( = ?auto_836034 ?auto_836038 ) ) ( not ( = ?auto_836034 ?auto_836039 ) ) ( not ( = ?auto_836034 ?auto_836040 ) ) ( not ( = ?auto_836034 ?auto_836041 ) ) ( not ( = ?auto_836034 ?auto_836042 ) ) ( not ( = ?auto_836034 ?auto_836043 ) ) ( not ( = ?auto_836034 ?auto_836044 ) ) ( not ( = ?auto_836035 ?auto_836036 ) ) ( not ( = ?auto_836035 ?auto_836037 ) ) ( not ( = ?auto_836035 ?auto_836038 ) ) ( not ( = ?auto_836035 ?auto_836039 ) ) ( not ( = ?auto_836035 ?auto_836040 ) ) ( not ( = ?auto_836035 ?auto_836041 ) ) ( not ( = ?auto_836035 ?auto_836042 ) ) ( not ( = ?auto_836035 ?auto_836043 ) ) ( not ( = ?auto_836035 ?auto_836044 ) ) ( not ( = ?auto_836036 ?auto_836037 ) ) ( not ( = ?auto_836036 ?auto_836038 ) ) ( not ( = ?auto_836036 ?auto_836039 ) ) ( not ( = ?auto_836036 ?auto_836040 ) ) ( not ( = ?auto_836036 ?auto_836041 ) ) ( not ( = ?auto_836036 ?auto_836042 ) ) ( not ( = ?auto_836036 ?auto_836043 ) ) ( not ( = ?auto_836036 ?auto_836044 ) ) ( not ( = ?auto_836037 ?auto_836038 ) ) ( not ( = ?auto_836037 ?auto_836039 ) ) ( not ( = ?auto_836037 ?auto_836040 ) ) ( not ( = ?auto_836037 ?auto_836041 ) ) ( not ( = ?auto_836037 ?auto_836042 ) ) ( not ( = ?auto_836037 ?auto_836043 ) ) ( not ( = ?auto_836037 ?auto_836044 ) ) ( not ( = ?auto_836038 ?auto_836039 ) ) ( not ( = ?auto_836038 ?auto_836040 ) ) ( not ( = ?auto_836038 ?auto_836041 ) ) ( not ( = ?auto_836038 ?auto_836042 ) ) ( not ( = ?auto_836038 ?auto_836043 ) ) ( not ( = ?auto_836038 ?auto_836044 ) ) ( not ( = ?auto_836039 ?auto_836040 ) ) ( not ( = ?auto_836039 ?auto_836041 ) ) ( not ( = ?auto_836039 ?auto_836042 ) ) ( not ( = ?auto_836039 ?auto_836043 ) ) ( not ( = ?auto_836039 ?auto_836044 ) ) ( not ( = ?auto_836040 ?auto_836041 ) ) ( not ( = ?auto_836040 ?auto_836042 ) ) ( not ( = ?auto_836040 ?auto_836043 ) ) ( not ( = ?auto_836040 ?auto_836044 ) ) ( not ( = ?auto_836041 ?auto_836042 ) ) ( not ( = ?auto_836041 ?auto_836043 ) ) ( not ( = ?auto_836041 ?auto_836044 ) ) ( not ( = ?auto_836042 ?auto_836043 ) ) ( not ( = ?auto_836042 ?auto_836044 ) ) ( not ( = ?auto_836043 ?auto_836044 ) ) ( ON ?auto_836043 ?auto_836044 ) ( ON ?auto_836042 ?auto_836043 ) ( ON ?auto_836041 ?auto_836042 ) ( ON ?auto_836040 ?auto_836041 ) ( ON ?auto_836039 ?auto_836040 ) ( ON ?auto_836038 ?auto_836039 ) ( ON ?auto_836037 ?auto_836038 ) ( ON ?auto_836036 ?auto_836037 ) ( ON ?auto_836035 ?auto_836036 ) ( ON ?auto_836034 ?auto_836035 ) ( ON ?auto_836033 ?auto_836034 ) ( CLEAR ?auto_836031 ) ( ON ?auto_836032 ?auto_836033 ) ( CLEAR ?auto_836032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_836027 ?auto_836028 ?auto_836029 ?auto_836030 ?auto_836031 ?auto_836032 )
      ( MAKE-18PILE ?auto_836027 ?auto_836028 ?auto_836029 ?auto_836030 ?auto_836031 ?auto_836032 ?auto_836033 ?auto_836034 ?auto_836035 ?auto_836036 ?auto_836037 ?auto_836038 ?auto_836039 ?auto_836040 ?auto_836041 ?auto_836042 ?auto_836043 ?auto_836044 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_836063 - BLOCK
      ?auto_836064 - BLOCK
      ?auto_836065 - BLOCK
      ?auto_836066 - BLOCK
      ?auto_836067 - BLOCK
      ?auto_836068 - BLOCK
      ?auto_836069 - BLOCK
      ?auto_836070 - BLOCK
      ?auto_836071 - BLOCK
      ?auto_836072 - BLOCK
      ?auto_836073 - BLOCK
      ?auto_836074 - BLOCK
      ?auto_836075 - BLOCK
      ?auto_836076 - BLOCK
      ?auto_836077 - BLOCK
      ?auto_836078 - BLOCK
      ?auto_836079 - BLOCK
      ?auto_836080 - BLOCK
    )
    :vars
    (
      ?auto_836081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836080 ?auto_836081 ) ( ON-TABLE ?auto_836063 ) ( ON ?auto_836064 ?auto_836063 ) ( ON ?auto_836065 ?auto_836064 ) ( ON ?auto_836066 ?auto_836065 ) ( not ( = ?auto_836063 ?auto_836064 ) ) ( not ( = ?auto_836063 ?auto_836065 ) ) ( not ( = ?auto_836063 ?auto_836066 ) ) ( not ( = ?auto_836063 ?auto_836067 ) ) ( not ( = ?auto_836063 ?auto_836068 ) ) ( not ( = ?auto_836063 ?auto_836069 ) ) ( not ( = ?auto_836063 ?auto_836070 ) ) ( not ( = ?auto_836063 ?auto_836071 ) ) ( not ( = ?auto_836063 ?auto_836072 ) ) ( not ( = ?auto_836063 ?auto_836073 ) ) ( not ( = ?auto_836063 ?auto_836074 ) ) ( not ( = ?auto_836063 ?auto_836075 ) ) ( not ( = ?auto_836063 ?auto_836076 ) ) ( not ( = ?auto_836063 ?auto_836077 ) ) ( not ( = ?auto_836063 ?auto_836078 ) ) ( not ( = ?auto_836063 ?auto_836079 ) ) ( not ( = ?auto_836063 ?auto_836080 ) ) ( not ( = ?auto_836063 ?auto_836081 ) ) ( not ( = ?auto_836064 ?auto_836065 ) ) ( not ( = ?auto_836064 ?auto_836066 ) ) ( not ( = ?auto_836064 ?auto_836067 ) ) ( not ( = ?auto_836064 ?auto_836068 ) ) ( not ( = ?auto_836064 ?auto_836069 ) ) ( not ( = ?auto_836064 ?auto_836070 ) ) ( not ( = ?auto_836064 ?auto_836071 ) ) ( not ( = ?auto_836064 ?auto_836072 ) ) ( not ( = ?auto_836064 ?auto_836073 ) ) ( not ( = ?auto_836064 ?auto_836074 ) ) ( not ( = ?auto_836064 ?auto_836075 ) ) ( not ( = ?auto_836064 ?auto_836076 ) ) ( not ( = ?auto_836064 ?auto_836077 ) ) ( not ( = ?auto_836064 ?auto_836078 ) ) ( not ( = ?auto_836064 ?auto_836079 ) ) ( not ( = ?auto_836064 ?auto_836080 ) ) ( not ( = ?auto_836064 ?auto_836081 ) ) ( not ( = ?auto_836065 ?auto_836066 ) ) ( not ( = ?auto_836065 ?auto_836067 ) ) ( not ( = ?auto_836065 ?auto_836068 ) ) ( not ( = ?auto_836065 ?auto_836069 ) ) ( not ( = ?auto_836065 ?auto_836070 ) ) ( not ( = ?auto_836065 ?auto_836071 ) ) ( not ( = ?auto_836065 ?auto_836072 ) ) ( not ( = ?auto_836065 ?auto_836073 ) ) ( not ( = ?auto_836065 ?auto_836074 ) ) ( not ( = ?auto_836065 ?auto_836075 ) ) ( not ( = ?auto_836065 ?auto_836076 ) ) ( not ( = ?auto_836065 ?auto_836077 ) ) ( not ( = ?auto_836065 ?auto_836078 ) ) ( not ( = ?auto_836065 ?auto_836079 ) ) ( not ( = ?auto_836065 ?auto_836080 ) ) ( not ( = ?auto_836065 ?auto_836081 ) ) ( not ( = ?auto_836066 ?auto_836067 ) ) ( not ( = ?auto_836066 ?auto_836068 ) ) ( not ( = ?auto_836066 ?auto_836069 ) ) ( not ( = ?auto_836066 ?auto_836070 ) ) ( not ( = ?auto_836066 ?auto_836071 ) ) ( not ( = ?auto_836066 ?auto_836072 ) ) ( not ( = ?auto_836066 ?auto_836073 ) ) ( not ( = ?auto_836066 ?auto_836074 ) ) ( not ( = ?auto_836066 ?auto_836075 ) ) ( not ( = ?auto_836066 ?auto_836076 ) ) ( not ( = ?auto_836066 ?auto_836077 ) ) ( not ( = ?auto_836066 ?auto_836078 ) ) ( not ( = ?auto_836066 ?auto_836079 ) ) ( not ( = ?auto_836066 ?auto_836080 ) ) ( not ( = ?auto_836066 ?auto_836081 ) ) ( not ( = ?auto_836067 ?auto_836068 ) ) ( not ( = ?auto_836067 ?auto_836069 ) ) ( not ( = ?auto_836067 ?auto_836070 ) ) ( not ( = ?auto_836067 ?auto_836071 ) ) ( not ( = ?auto_836067 ?auto_836072 ) ) ( not ( = ?auto_836067 ?auto_836073 ) ) ( not ( = ?auto_836067 ?auto_836074 ) ) ( not ( = ?auto_836067 ?auto_836075 ) ) ( not ( = ?auto_836067 ?auto_836076 ) ) ( not ( = ?auto_836067 ?auto_836077 ) ) ( not ( = ?auto_836067 ?auto_836078 ) ) ( not ( = ?auto_836067 ?auto_836079 ) ) ( not ( = ?auto_836067 ?auto_836080 ) ) ( not ( = ?auto_836067 ?auto_836081 ) ) ( not ( = ?auto_836068 ?auto_836069 ) ) ( not ( = ?auto_836068 ?auto_836070 ) ) ( not ( = ?auto_836068 ?auto_836071 ) ) ( not ( = ?auto_836068 ?auto_836072 ) ) ( not ( = ?auto_836068 ?auto_836073 ) ) ( not ( = ?auto_836068 ?auto_836074 ) ) ( not ( = ?auto_836068 ?auto_836075 ) ) ( not ( = ?auto_836068 ?auto_836076 ) ) ( not ( = ?auto_836068 ?auto_836077 ) ) ( not ( = ?auto_836068 ?auto_836078 ) ) ( not ( = ?auto_836068 ?auto_836079 ) ) ( not ( = ?auto_836068 ?auto_836080 ) ) ( not ( = ?auto_836068 ?auto_836081 ) ) ( not ( = ?auto_836069 ?auto_836070 ) ) ( not ( = ?auto_836069 ?auto_836071 ) ) ( not ( = ?auto_836069 ?auto_836072 ) ) ( not ( = ?auto_836069 ?auto_836073 ) ) ( not ( = ?auto_836069 ?auto_836074 ) ) ( not ( = ?auto_836069 ?auto_836075 ) ) ( not ( = ?auto_836069 ?auto_836076 ) ) ( not ( = ?auto_836069 ?auto_836077 ) ) ( not ( = ?auto_836069 ?auto_836078 ) ) ( not ( = ?auto_836069 ?auto_836079 ) ) ( not ( = ?auto_836069 ?auto_836080 ) ) ( not ( = ?auto_836069 ?auto_836081 ) ) ( not ( = ?auto_836070 ?auto_836071 ) ) ( not ( = ?auto_836070 ?auto_836072 ) ) ( not ( = ?auto_836070 ?auto_836073 ) ) ( not ( = ?auto_836070 ?auto_836074 ) ) ( not ( = ?auto_836070 ?auto_836075 ) ) ( not ( = ?auto_836070 ?auto_836076 ) ) ( not ( = ?auto_836070 ?auto_836077 ) ) ( not ( = ?auto_836070 ?auto_836078 ) ) ( not ( = ?auto_836070 ?auto_836079 ) ) ( not ( = ?auto_836070 ?auto_836080 ) ) ( not ( = ?auto_836070 ?auto_836081 ) ) ( not ( = ?auto_836071 ?auto_836072 ) ) ( not ( = ?auto_836071 ?auto_836073 ) ) ( not ( = ?auto_836071 ?auto_836074 ) ) ( not ( = ?auto_836071 ?auto_836075 ) ) ( not ( = ?auto_836071 ?auto_836076 ) ) ( not ( = ?auto_836071 ?auto_836077 ) ) ( not ( = ?auto_836071 ?auto_836078 ) ) ( not ( = ?auto_836071 ?auto_836079 ) ) ( not ( = ?auto_836071 ?auto_836080 ) ) ( not ( = ?auto_836071 ?auto_836081 ) ) ( not ( = ?auto_836072 ?auto_836073 ) ) ( not ( = ?auto_836072 ?auto_836074 ) ) ( not ( = ?auto_836072 ?auto_836075 ) ) ( not ( = ?auto_836072 ?auto_836076 ) ) ( not ( = ?auto_836072 ?auto_836077 ) ) ( not ( = ?auto_836072 ?auto_836078 ) ) ( not ( = ?auto_836072 ?auto_836079 ) ) ( not ( = ?auto_836072 ?auto_836080 ) ) ( not ( = ?auto_836072 ?auto_836081 ) ) ( not ( = ?auto_836073 ?auto_836074 ) ) ( not ( = ?auto_836073 ?auto_836075 ) ) ( not ( = ?auto_836073 ?auto_836076 ) ) ( not ( = ?auto_836073 ?auto_836077 ) ) ( not ( = ?auto_836073 ?auto_836078 ) ) ( not ( = ?auto_836073 ?auto_836079 ) ) ( not ( = ?auto_836073 ?auto_836080 ) ) ( not ( = ?auto_836073 ?auto_836081 ) ) ( not ( = ?auto_836074 ?auto_836075 ) ) ( not ( = ?auto_836074 ?auto_836076 ) ) ( not ( = ?auto_836074 ?auto_836077 ) ) ( not ( = ?auto_836074 ?auto_836078 ) ) ( not ( = ?auto_836074 ?auto_836079 ) ) ( not ( = ?auto_836074 ?auto_836080 ) ) ( not ( = ?auto_836074 ?auto_836081 ) ) ( not ( = ?auto_836075 ?auto_836076 ) ) ( not ( = ?auto_836075 ?auto_836077 ) ) ( not ( = ?auto_836075 ?auto_836078 ) ) ( not ( = ?auto_836075 ?auto_836079 ) ) ( not ( = ?auto_836075 ?auto_836080 ) ) ( not ( = ?auto_836075 ?auto_836081 ) ) ( not ( = ?auto_836076 ?auto_836077 ) ) ( not ( = ?auto_836076 ?auto_836078 ) ) ( not ( = ?auto_836076 ?auto_836079 ) ) ( not ( = ?auto_836076 ?auto_836080 ) ) ( not ( = ?auto_836076 ?auto_836081 ) ) ( not ( = ?auto_836077 ?auto_836078 ) ) ( not ( = ?auto_836077 ?auto_836079 ) ) ( not ( = ?auto_836077 ?auto_836080 ) ) ( not ( = ?auto_836077 ?auto_836081 ) ) ( not ( = ?auto_836078 ?auto_836079 ) ) ( not ( = ?auto_836078 ?auto_836080 ) ) ( not ( = ?auto_836078 ?auto_836081 ) ) ( not ( = ?auto_836079 ?auto_836080 ) ) ( not ( = ?auto_836079 ?auto_836081 ) ) ( not ( = ?auto_836080 ?auto_836081 ) ) ( ON ?auto_836079 ?auto_836080 ) ( ON ?auto_836078 ?auto_836079 ) ( ON ?auto_836077 ?auto_836078 ) ( ON ?auto_836076 ?auto_836077 ) ( ON ?auto_836075 ?auto_836076 ) ( ON ?auto_836074 ?auto_836075 ) ( ON ?auto_836073 ?auto_836074 ) ( ON ?auto_836072 ?auto_836073 ) ( ON ?auto_836071 ?auto_836072 ) ( ON ?auto_836070 ?auto_836071 ) ( ON ?auto_836069 ?auto_836070 ) ( ON ?auto_836068 ?auto_836069 ) ( CLEAR ?auto_836066 ) ( ON ?auto_836067 ?auto_836068 ) ( CLEAR ?auto_836067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_836063 ?auto_836064 ?auto_836065 ?auto_836066 ?auto_836067 )
      ( MAKE-18PILE ?auto_836063 ?auto_836064 ?auto_836065 ?auto_836066 ?auto_836067 ?auto_836068 ?auto_836069 ?auto_836070 ?auto_836071 ?auto_836072 ?auto_836073 ?auto_836074 ?auto_836075 ?auto_836076 ?auto_836077 ?auto_836078 ?auto_836079 ?auto_836080 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_836100 - BLOCK
      ?auto_836101 - BLOCK
      ?auto_836102 - BLOCK
      ?auto_836103 - BLOCK
      ?auto_836104 - BLOCK
      ?auto_836105 - BLOCK
      ?auto_836106 - BLOCK
      ?auto_836107 - BLOCK
      ?auto_836108 - BLOCK
      ?auto_836109 - BLOCK
      ?auto_836110 - BLOCK
      ?auto_836111 - BLOCK
      ?auto_836112 - BLOCK
      ?auto_836113 - BLOCK
      ?auto_836114 - BLOCK
      ?auto_836115 - BLOCK
      ?auto_836116 - BLOCK
      ?auto_836117 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_836117 ) ( ON-TABLE ?auto_836100 ) ( ON ?auto_836101 ?auto_836100 ) ( ON ?auto_836102 ?auto_836101 ) ( ON ?auto_836103 ?auto_836102 ) ( not ( = ?auto_836100 ?auto_836101 ) ) ( not ( = ?auto_836100 ?auto_836102 ) ) ( not ( = ?auto_836100 ?auto_836103 ) ) ( not ( = ?auto_836100 ?auto_836104 ) ) ( not ( = ?auto_836100 ?auto_836105 ) ) ( not ( = ?auto_836100 ?auto_836106 ) ) ( not ( = ?auto_836100 ?auto_836107 ) ) ( not ( = ?auto_836100 ?auto_836108 ) ) ( not ( = ?auto_836100 ?auto_836109 ) ) ( not ( = ?auto_836100 ?auto_836110 ) ) ( not ( = ?auto_836100 ?auto_836111 ) ) ( not ( = ?auto_836100 ?auto_836112 ) ) ( not ( = ?auto_836100 ?auto_836113 ) ) ( not ( = ?auto_836100 ?auto_836114 ) ) ( not ( = ?auto_836100 ?auto_836115 ) ) ( not ( = ?auto_836100 ?auto_836116 ) ) ( not ( = ?auto_836100 ?auto_836117 ) ) ( not ( = ?auto_836101 ?auto_836102 ) ) ( not ( = ?auto_836101 ?auto_836103 ) ) ( not ( = ?auto_836101 ?auto_836104 ) ) ( not ( = ?auto_836101 ?auto_836105 ) ) ( not ( = ?auto_836101 ?auto_836106 ) ) ( not ( = ?auto_836101 ?auto_836107 ) ) ( not ( = ?auto_836101 ?auto_836108 ) ) ( not ( = ?auto_836101 ?auto_836109 ) ) ( not ( = ?auto_836101 ?auto_836110 ) ) ( not ( = ?auto_836101 ?auto_836111 ) ) ( not ( = ?auto_836101 ?auto_836112 ) ) ( not ( = ?auto_836101 ?auto_836113 ) ) ( not ( = ?auto_836101 ?auto_836114 ) ) ( not ( = ?auto_836101 ?auto_836115 ) ) ( not ( = ?auto_836101 ?auto_836116 ) ) ( not ( = ?auto_836101 ?auto_836117 ) ) ( not ( = ?auto_836102 ?auto_836103 ) ) ( not ( = ?auto_836102 ?auto_836104 ) ) ( not ( = ?auto_836102 ?auto_836105 ) ) ( not ( = ?auto_836102 ?auto_836106 ) ) ( not ( = ?auto_836102 ?auto_836107 ) ) ( not ( = ?auto_836102 ?auto_836108 ) ) ( not ( = ?auto_836102 ?auto_836109 ) ) ( not ( = ?auto_836102 ?auto_836110 ) ) ( not ( = ?auto_836102 ?auto_836111 ) ) ( not ( = ?auto_836102 ?auto_836112 ) ) ( not ( = ?auto_836102 ?auto_836113 ) ) ( not ( = ?auto_836102 ?auto_836114 ) ) ( not ( = ?auto_836102 ?auto_836115 ) ) ( not ( = ?auto_836102 ?auto_836116 ) ) ( not ( = ?auto_836102 ?auto_836117 ) ) ( not ( = ?auto_836103 ?auto_836104 ) ) ( not ( = ?auto_836103 ?auto_836105 ) ) ( not ( = ?auto_836103 ?auto_836106 ) ) ( not ( = ?auto_836103 ?auto_836107 ) ) ( not ( = ?auto_836103 ?auto_836108 ) ) ( not ( = ?auto_836103 ?auto_836109 ) ) ( not ( = ?auto_836103 ?auto_836110 ) ) ( not ( = ?auto_836103 ?auto_836111 ) ) ( not ( = ?auto_836103 ?auto_836112 ) ) ( not ( = ?auto_836103 ?auto_836113 ) ) ( not ( = ?auto_836103 ?auto_836114 ) ) ( not ( = ?auto_836103 ?auto_836115 ) ) ( not ( = ?auto_836103 ?auto_836116 ) ) ( not ( = ?auto_836103 ?auto_836117 ) ) ( not ( = ?auto_836104 ?auto_836105 ) ) ( not ( = ?auto_836104 ?auto_836106 ) ) ( not ( = ?auto_836104 ?auto_836107 ) ) ( not ( = ?auto_836104 ?auto_836108 ) ) ( not ( = ?auto_836104 ?auto_836109 ) ) ( not ( = ?auto_836104 ?auto_836110 ) ) ( not ( = ?auto_836104 ?auto_836111 ) ) ( not ( = ?auto_836104 ?auto_836112 ) ) ( not ( = ?auto_836104 ?auto_836113 ) ) ( not ( = ?auto_836104 ?auto_836114 ) ) ( not ( = ?auto_836104 ?auto_836115 ) ) ( not ( = ?auto_836104 ?auto_836116 ) ) ( not ( = ?auto_836104 ?auto_836117 ) ) ( not ( = ?auto_836105 ?auto_836106 ) ) ( not ( = ?auto_836105 ?auto_836107 ) ) ( not ( = ?auto_836105 ?auto_836108 ) ) ( not ( = ?auto_836105 ?auto_836109 ) ) ( not ( = ?auto_836105 ?auto_836110 ) ) ( not ( = ?auto_836105 ?auto_836111 ) ) ( not ( = ?auto_836105 ?auto_836112 ) ) ( not ( = ?auto_836105 ?auto_836113 ) ) ( not ( = ?auto_836105 ?auto_836114 ) ) ( not ( = ?auto_836105 ?auto_836115 ) ) ( not ( = ?auto_836105 ?auto_836116 ) ) ( not ( = ?auto_836105 ?auto_836117 ) ) ( not ( = ?auto_836106 ?auto_836107 ) ) ( not ( = ?auto_836106 ?auto_836108 ) ) ( not ( = ?auto_836106 ?auto_836109 ) ) ( not ( = ?auto_836106 ?auto_836110 ) ) ( not ( = ?auto_836106 ?auto_836111 ) ) ( not ( = ?auto_836106 ?auto_836112 ) ) ( not ( = ?auto_836106 ?auto_836113 ) ) ( not ( = ?auto_836106 ?auto_836114 ) ) ( not ( = ?auto_836106 ?auto_836115 ) ) ( not ( = ?auto_836106 ?auto_836116 ) ) ( not ( = ?auto_836106 ?auto_836117 ) ) ( not ( = ?auto_836107 ?auto_836108 ) ) ( not ( = ?auto_836107 ?auto_836109 ) ) ( not ( = ?auto_836107 ?auto_836110 ) ) ( not ( = ?auto_836107 ?auto_836111 ) ) ( not ( = ?auto_836107 ?auto_836112 ) ) ( not ( = ?auto_836107 ?auto_836113 ) ) ( not ( = ?auto_836107 ?auto_836114 ) ) ( not ( = ?auto_836107 ?auto_836115 ) ) ( not ( = ?auto_836107 ?auto_836116 ) ) ( not ( = ?auto_836107 ?auto_836117 ) ) ( not ( = ?auto_836108 ?auto_836109 ) ) ( not ( = ?auto_836108 ?auto_836110 ) ) ( not ( = ?auto_836108 ?auto_836111 ) ) ( not ( = ?auto_836108 ?auto_836112 ) ) ( not ( = ?auto_836108 ?auto_836113 ) ) ( not ( = ?auto_836108 ?auto_836114 ) ) ( not ( = ?auto_836108 ?auto_836115 ) ) ( not ( = ?auto_836108 ?auto_836116 ) ) ( not ( = ?auto_836108 ?auto_836117 ) ) ( not ( = ?auto_836109 ?auto_836110 ) ) ( not ( = ?auto_836109 ?auto_836111 ) ) ( not ( = ?auto_836109 ?auto_836112 ) ) ( not ( = ?auto_836109 ?auto_836113 ) ) ( not ( = ?auto_836109 ?auto_836114 ) ) ( not ( = ?auto_836109 ?auto_836115 ) ) ( not ( = ?auto_836109 ?auto_836116 ) ) ( not ( = ?auto_836109 ?auto_836117 ) ) ( not ( = ?auto_836110 ?auto_836111 ) ) ( not ( = ?auto_836110 ?auto_836112 ) ) ( not ( = ?auto_836110 ?auto_836113 ) ) ( not ( = ?auto_836110 ?auto_836114 ) ) ( not ( = ?auto_836110 ?auto_836115 ) ) ( not ( = ?auto_836110 ?auto_836116 ) ) ( not ( = ?auto_836110 ?auto_836117 ) ) ( not ( = ?auto_836111 ?auto_836112 ) ) ( not ( = ?auto_836111 ?auto_836113 ) ) ( not ( = ?auto_836111 ?auto_836114 ) ) ( not ( = ?auto_836111 ?auto_836115 ) ) ( not ( = ?auto_836111 ?auto_836116 ) ) ( not ( = ?auto_836111 ?auto_836117 ) ) ( not ( = ?auto_836112 ?auto_836113 ) ) ( not ( = ?auto_836112 ?auto_836114 ) ) ( not ( = ?auto_836112 ?auto_836115 ) ) ( not ( = ?auto_836112 ?auto_836116 ) ) ( not ( = ?auto_836112 ?auto_836117 ) ) ( not ( = ?auto_836113 ?auto_836114 ) ) ( not ( = ?auto_836113 ?auto_836115 ) ) ( not ( = ?auto_836113 ?auto_836116 ) ) ( not ( = ?auto_836113 ?auto_836117 ) ) ( not ( = ?auto_836114 ?auto_836115 ) ) ( not ( = ?auto_836114 ?auto_836116 ) ) ( not ( = ?auto_836114 ?auto_836117 ) ) ( not ( = ?auto_836115 ?auto_836116 ) ) ( not ( = ?auto_836115 ?auto_836117 ) ) ( not ( = ?auto_836116 ?auto_836117 ) ) ( ON ?auto_836116 ?auto_836117 ) ( ON ?auto_836115 ?auto_836116 ) ( ON ?auto_836114 ?auto_836115 ) ( ON ?auto_836113 ?auto_836114 ) ( ON ?auto_836112 ?auto_836113 ) ( ON ?auto_836111 ?auto_836112 ) ( ON ?auto_836110 ?auto_836111 ) ( ON ?auto_836109 ?auto_836110 ) ( ON ?auto_836108 ?auto_836109 ) ( ON ?auto_836107 ?auto_836108 ) ( ON ?auto_836106 ?auto_836107 ) ( ON ?auto_836105 ?auto_836106 ) ( CLEAR ?auto_836103 ) ( ON ?auto_836104 ?auto_836105 ) ( CLEAR ?auto_836104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_836100 ?auto_836101 ?auto_836102 ?auto_836103 ?auto_836104 )
      ( MAKE-18PILE ?auto_836100 ?auto_836101 ?auto_836102 ?auto_836103 ?auto_836104 ?auto_836105 ?auto_836106 ?auto_836107 ?auto_836108 ?auto_836109 ?auto_836110 ?auto_836111 ?auto_836112 ?auto_836113 ?auto_836114 ?auto_836115 ?auto_836116 ?auto_836117 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_836136 - BLOCK
      ?auto_836137 - BLOCK
      ?auto_836138 - BLOCK
      ?auto_836139 - BLOCK
      ?auto_836140 - BLOCK
      ?auto_836141 - BLOCK
      ?auto_836142 - BLOCK
      ?auto_836143 - BLOCK
      ?auto_836144 - BLOCK
      ?auto_836145 - BLOCK
      ?auto_836146 - BLOCK
      ?auto_836147 - BLOCK
      ?auto_836148 - BLOCK
      ?auto_836149 - BLOCK
      ?auto_836150 - BLOCK
      ?auto_836151 - BLOCK
      ?auto_836152 - BLOCK
      ?auto_836153 - BLOCK
    )
    :vars
    (
      ?auto_836154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836153 ?auto_836154 ) ( ON-TABLE ?auto_836136 ) ( ON ?auto_836137 ?auto_836136 ) ( ON ?auto_836138 ?auto_836137 ) ( not ( = ?auto_836136 ?auto_836137 ) ) ( not ( = ?auto_836136 ?auto_836138 ) ) ( not ( = ?auto_836136 ?auto_836139 ) ) ( not ( = ?auto_836136 ?auto_836140 ) ) ( not ( = ?auto_836136 ?auto_836141 ) ) ( not ( = ?auto_836136 ?auto_836142 ) ) ( not ( = ?auto_836136 ?auto_836143 ) ) ( not ( = ?auto_836136 ?auto_836144 ) ) ( not ( = ?auto_836136 ?auto_836145 ) ) ( not ( = ?auto_836136 ?auto_836146 ) ) ( not ( = ?auto_836136 ?auto_836147 ) ) ( not ( = ?auto_836136 ?auto_836148 ) ) ( not ( = ?auto_836136 ?auto_836149 ) ) ( not ( = ?auto_836136 ?auto_836150 ) ) ( not ( = ?auto_836136 ?auto_836151 ) ) ( not ( = ?auto_836136 ?auto_836152 ) ) ( not ( = ?auto_836136 ?auto_836153 ) ) ( not ( = ?auto_836136 ?auto_836154 ) ) ( not ( = ?auto_836137 ?auto_836138 ) ) ( not ( = ?auto_836137 ?auto_836139 ) ) ( not ( = ?auto_836137 ?auto_836140 ) ) ( not ( = ?auto_836137 ?auto_836141 ) ) ( not ( = ?auto_836137 ?auto_836142 ) ) ( not ( = ?auto_836137 ?auto_836143 ) ) ( not ( = ?auto_836137 ?auto_836144 ) ) ( not ( = ?auto_836137 ?auto_836145 ) ) ( not ( = ?auto_836137 ?auto_836146 ) ) ( not ( = ?auto_836137 ?auto_836147 ) ) ( not ( = ?auto_836137 ?auto_836148 ) ) ( not ( = ?auto_836137 ?auto_836149 ) ) ( not ( = ?auto_836137 ?auto_836150 ) ) ( not ( = ?auto_836137 ?auto_836151 ) ) ( not ( = ?auto_836137 ?auto_836152 ) ) ( not ( = ?auto_836137 ?auto_836153 ) ) ( not ( = ?auto_836137 ?auto_836154 ) ) ( not ( = ?auto_836138 ?auto_836139 ) ) ( not ( = ?auto_836138 ?auto_836140 ) ) ( not ( = ?auto_836138 ?auto_836141 ) ) ( not ( = ?auto_836138 ?auto_836142 ) ) ( not ( = ?auto_836138 ?auto_836143 ) ) ( not ( = ?auto_836138 ?auto_836144 ) ) ( not ( = ?auto_836138 ?auto_836145 ) ) ( not ( = ?auto_836138 ?auto_836146 ) ) ( not ( = ?auto_836138 ?auto_836147 ) ) ( not ( = ?auto_836138 ?auto_836148 ) ) ( not ( = ?auto_836138 ?auto_836149 ) ) ( not ( = ?auto_836138 ?auto_836150 ) ) ( not ( = ?auto_836138 ?auto_836151 ) ) ( not ( = ?auto_836138 ?auto_836152 ) ) ( not ( = ?auto_836138 ?auto_836153 ) ) ( not ( = ?auto_836138 ?auto_836154 ) ) ( not ( = ?auto_836139 ?auto_836140 ) ) ( not ( = ?auto_836139 ?auto_836141 ) ) ( not ( = ?auto_836139 ?auto_836142 ) ) ( not ( = ?auto_836139 ?auto_836143 ) ) ( not ( = ?auto_836139 ?auto_836144 ) ) ( not ( = ?auto_836139 ?auto_836145 ) ) ( not ( = ?auto_836139 ?auto_836146 ) ) ( not ( = ?auto_836139 ?auto_836147 ) ) ( not ( = ?auto_836139 ?auto_836148 ) ) ( not ( = ?auto_836139 ?auto_836149 ) ) ( not ( = ?auto_836139 ?auto_836150 ) ) ( not ( = ?auto_836139 ?auto_836151 ) ) ( not ( = ?auto_836139 ?auto_836152 ) ) ( not ( = ?auto_836139 ?auto_836153 ) ) ( not ( = ?auto_836139 ?auto_836154 ) ) ( not ( = ?auto_836140 ?auto_836141 ) ) ( not ( = ?auto_836140 ?auto_836142 ) ) ( not ( = ?auto_836140 ?auto_836143 ) ) ( not ( = ?auto_836140 ?auto_836144 ) ) ( not ( = ?auto_836140 ?auto_836145 ) ) ( not ( = ?auto_836140 ?auto_836146 ) ) ( not ( = ?auto_836140 ?auto_836147 ) ) ( not ( = ?auto_836140 ?auto_836148 ) ) ( not ( = ?auto_836140 ?auto_836149 ) ) ( not ( = ?auto_836140 ?auto_836150 ) ) ( not ( = ?auto_836140 ?auto_836151 ) ) ( not ( = ?auto_836140 ?auto_836152 ) ) ( not ( = ?auto_836140 ?auto_836153 ) ) ( not ( = ?auto_836140 ?auto_836154 ) ) ( not ( = ?auto_836141 ?auto_836142 ) ) ( not ( = ?auto_836141 ?auto_836143 ) ) ( not ( = ?auto_836141 ?auto_836144 ) ) ( not ( = ?auto_836141 ?auto_836145 ) ) ( not ( = ?auto_836141 ?auto_836146 ) ) ( not ( = ?auto_836141 ?auto_836147 ) ) ( not ( = ?auto_836141 ?auto_836148 ) ) ( not ( = ?auto_836141 ?auto_836149 ) ) ( not ( = ?auto_836141 ?auto_836150 ) ) ( not ( = ?auto_836141 ?auto_836151 ) ) ( not ( = ?auto_836141 ?auto_836152 ) ) ( not ( = ?auto_836141 ?auto_836153 ) ) ( not ( = ?auto_836141 ?auto_836154 ) ) ( not ( = ?auto_836142 ?auto_836143 ) ) ( not ( = ?auto_836142 ?auto_836144 ) ) ( not ( = ?auto_836142 ?auto_836145 ) ) ( not ( = ?auto_836142 ?auto_836146 ) ) ( not ( = ?auto_836142 ?auto_836147 ) ) ( not ( = ?auto_836142 ?auto_836148 ) ) ( not ( = ?auto_836142 ?auto_836149 ) ) ( not ( = ?auto_836142 ?auto_836150 ) ) ( not ( = ?auto_836142 ?auto_836151 ) ) ( not ( = ?auto_836142 ?auto_836152 ) ) ( not ( = ?auto_836142 ?auto_836153 ) ) ( not ( = ?auto_836142 ?auto_836154 ) ) ( not ( = ?auto_836143 ?auto_836144 ) ) ( not ( = ?auto_836143 ?auto_836145 ) ) ( not ( = ?auto_836143 ?auto_836146 ) ) ( not ( = ?auto_836143 ?auto_836147 ) ) ( not ( = ?auto_836143 ?auto_836148 ) ) ( not ( = ?auto_836143 ?auto_836149 ) ) ( not ( = ?auto_836143 ?auto_836150 ) ) ( not ( = ?auto_836143 ?auto_836151 ) ) ( not ( = ?auto_836143 ?auto_836152 ) ) ( not ( = ?auto_836143 ?auto_836153 ) ) ( not ( = ?auto_836143 ?auto_836154 ) ) ( not ( = ?auto_836144 ?auto_836145 ) ) ( not ( = ?auto_836144 ?auto_836146 ) ) ( not ( = ?auto_836144 ?auto_836147 ) ) ( not ( = ?auto_836144 ?auto_836148 ) ) ( not ( = ?auto_836144 ?auto_836149 ) ) ( not ( = ?auto_836144 ?auto_836150 ) ) ( not ( = ?auto_836144 ?auto_836151 ) ) ( not ( = ?auto_836144 ?auto_836152 ) ) ( not ( = ?auto_836144 ?auto_836153 ) ) ( not ( = ?auto_836144 ?auto_836154 ) ) ( not ( = ?auto_836145 ?auto_836146 ) ) ( not ( = ?auto_836145 ?auto_836147 ) ) ( not ( = ?auto_836145 ?auto_836148 ) ) ( not ( = ?auto_836145 ?auto_836149 ) ) ( not ( = ?auto_836145 ?auto_836150 ) ) ( not ( = ?auto_836145 ?auto_836151 ) ) ( not ( = ?auto_836145 ?auto_836152 ) ) ( not ( = ?auto_836145 ?auto_836153 ) ) ( not ( = ?auto_836145 ?auto_836154 ) ) ( not ( = ?auto_836146 ?auto_836147 ) ) ( not ( = ?auto_836146 ?auto_836148 ) ) ( not ( = ?auto_836146 ?auto_836149 ) ) ( not ( = ?auto_836146 ?auto_836150 ) ) ( not ( = ?auto_836146 ?auto_836151 ) ) ( not ( = ?auto_836146 ?auto_836152 ) ) ( not ( = ?auto_836146 ?auto_836153 ) ) ( not ( = ?auto_836146 ?auto_836154 ) ) ( not ( = ?auto_836147 ?auto_836148 ) ) ( not ( = ?auto_836147 ?auto_836149 ) ) ( not ( = ?auto_836147 ?auto_836150 ) ) ( not ( = ?auto_836147 ?auto_836151 ) ) ( not ( = ?auto_836147 ?auto_836152 ) ) ( not ( = ?auto_836147 ?auto_836153 ) ) ( not ( = ?auto_836147 ?auto_836154 ) ) ( not ( = ?auto_836148 ?auto_836149 ) ) ( not ( = ?auto_836148 ?auto_836150 ) ) ( not ( = ?auto_836148 ?auto_836151 ) ) ( not ( = ?auto_836148 ?auto_836152 ) ) ( not ( = ?auto_836148 ?auto_836153 ) ) ( not ( = ?auto_836148 ?auto_836154 ) ) ( not ( = ?auto_836149 ?auto_836150 ) ) ( not ( = ?auto_836149 ?auto_836151 ) ) ( not ( = ?auto_836149 ?auto_836152 ) ) ( not ( = ?auto_836149 ?auto_836153 ) ) ( not ( = ?auto_836149 ?auto_836154 ) ) ( not ( = ?auto_836150 ?auto_836151 ) ) ( not ( = ?auto_836150 ?auto_836152 ) ) ( not ( = ?auto_836150 ?auto_836153 ) ) ( not ( = ?auto_836150 ?auto_836154 ) ) ( not ( = ?auto_836151 ?auto_836152 ) ) ( not ( = ?auto_836151 ?auto_836153 ) ) ( not ( = ?auto_836151 ?auto_836154 ) ) ( not ( = ?auto_836152 ?auto_836153 ) ) ( not ( = ?auto_836152 ?auto_836154 ) ) ( not ( = ?auto_836153 ?auto_836154 ) ) ( ON ?auto_836152 ?auto_836153 ) ( ON ?auto_836151 ?auto_836152 ) ( ON ?auto_836150 ?auto_836151 ) ( ON ?auto_836149 ?auto_836150 ) ( ON ?auto_836148 ?auto_836149 ) ( ON ?auto_836147 ?auto_836148 ) ( ON ?auto_836146 ?auto_836147 ) ( ON ?auto_836145 ?auto_836146 ) ( ON ?auto_836144 ?auto_836145 ) ( ON ?auto_836143 ?auto_836144 ) ( ON ?auto_836142 ?auto_836143 ) ( ON ?auto_836141 ?auto_836142 ) ( ON ?auto_836140 ?auto_836141 ) ( CLEAR ?auto_836138 ) ( ON ?auto_836139 ?auto_836140 ) ( CLEAR ?auto_836139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_836136 ?auto_836137 ?auto_836138 ?auto_836139 )
      ( MAKE-18PILE ?auto_836136 ?auto_836137 ?auto_836138 ?auto_836139 ?auto_836140 ?auto_836141 ?auto_836142 ?auto_836143 ?auto_836144 ?auto_836145 ?auto_836146 ?auto_836147 ?auto_836148 ?auto_836149 ?auto_836150 ?auto_836151 ?auto_836152 ?auto_836153 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_836173 - BLOCK
      ?auto_836174 - BLOCK
      ?auto_836175 - BLOCK
      ?auto_836176 - BLOCK
      ?auto_836177 - BLOCK
      ?auto_836178 - BLOCK
      ?auto_836179 - BLOCK
      ?auto_836180 - BLOCK
      ?auto_836181 - BLOCK
      ?auto_836182 - BLOCK
      ?auto_836183 - BLOCK
      ?auto_836184 - BLOCK
      ?auto_836185 - BLOCK
      ?auto_836186 - BLOCK
      ?auto_836187 - BLOCK
      ?auto_836188 - BLOCK
      ?auto_836189 - BLOCK
      ?auto_836190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_836190 ) ( ON-TABLE ?auto_836173 ) ( ON ?auto_836174 ?auto_836173 ) ( ON ?auto_836175 ?auto_836174 ) ( not ( = ?auto_836173 ?auto_836174 ) ) ( not ( = ?auto_836173 ?auto_836175 ) ) ( not ( = ?auto_836173 ?auto_836176 ) ) ( not ( = ?auto_836173 ?auto_836177 ) ) ( not ( = ?auto_836173 ?auto_836178 ) ) ( not ( = ?auto_836173 ?auto_836179 ) ) ( not ( = ?auto_836173 ?auto_836180 ) ) ( not ( = ?auto_836173 ?auto_836181 ) ) ( not ( = ?auto_836173 ?auto_836182 ) ) ( not ( = ?auto_836173 ?auto_836183 ) ) ( not ( = ?auto_836173 ?auto_836184 ) ) ( not ( = ?auto_836173 ?auto_836185 ) ) ( not ( = ?auto_836173 ?auto_836186 ) ) ( not ( = ?auto_836173 ?auto_836187 ) ) ( not ( = ?auto_836173 ?auto_836188 ) ) ( not ( = ?auto_836173 ?auto_836189 ) ) ( not ( = ?auto_836173 ?auto_836190 ) ) ( not ( = ?auto_836174 ?auto_836175 ) ) ( not ( = ?auto_836174 ?auto_836176 ) ) ( not ( = ?auto_836174 ?auto_836177 ) ) ( not ( = ?auto_836174 ?auto_836178 ) ) ( not ( = ?auto_836174 ?auto_836179 ) ) ( not ( = ?auto_836174 ?auto_836180 ) ) ( not ( = ?auto_836174 ?auto_836181 ) ) ( not ( = ?auto_836174 ?auto_836182 ) ) ( not ( = ?auto_836174 ?auto_836183 ) ) ( not ( = ?auto_836174 ?auto_836184 ) ) ( not ( = ?auto_836174 ?auto_836185 ) ) ( not ( = ?auto_836174 ?auto_836186 ) ) ( not ( = ?auto_836174 ?auto_836187 ) ) ( not ( = ?auto_836174 ?auto_836188 ) ) ( not ( = ?auto_836174 ?auto_836189 ) ) ( not ( = ?auto_836174 ?auto_836190 ) ) ( not ( = ?auto_836175 ?auto_836176 ) ) ( not ( = ?auto_836175 ?auto_836177 ) ) ( not ( = ?auto_836175 ?auto_836178 ) ) ( not ( = ?auto_836175 ?auto_836179 ) ) ( not ( = ?auto_836175 ?auto_836180 ) ) ( not ( = ?auto_836175 ?auto_836181 ) ) ( not ( = ?auto_836175 ?auto_836182 ) ) ( not ( = ?auto_836175 ?auto_836183 ) ) ( not ( = ?auto_836175 ?auto_836184 ) ) ( not ( = ?auto_836175 ?auto_836185 ) ) ( not ( = ?auto_836175 ?auto_836186 ) ) ( not ( = ?auto_836175 ?auto_836187 ) ) ( not ( = ?auto_836175 ?auto_836188 ) ) ( not ( = ?auto_836175 ?auto_836189 ) ) ( not ( = ?auto_836175 ?auto_836190 ) ) ( not ( = ?auto_836176 ?auto_836177 ) ) ( not ( = ?auto_836176 ?auto_836178 ) ) ( not ( = ?auto_836176 ?auto_836179 ) ) ( not ( = ?auto_836176 ?auto_836180 ) ) ( not ( = ?auto_836176 ?auto_836181 ) ) ( not ( = ?auto_836176 ?auto_836182 ) ) ( not ( = ?auto_836176 ?auto_836183 ) ) ( not ( = ?auto_836176 ?auto_836184 ) ) ( not ( = ?auto_836176 ?auto_836185 ) ) ( not ( = ?auto_836176 ?auto_836186 ) ) ( not ( = ?auto_836176 ?auto_836187 ) ) ( not ( = ?auto_836176 ?auto_836188 ) ) ( not ( = ?auto_836176 ?auto_836189 ) ) ( not ( = ?auto_836176 ?auto_836190 ) ) ( not ( = ?auto_836177 ?auto_836178 ) ) ( not ( = ?auto_836177 ?auto_836179 ) ) ( not ( = ?auto_836177 ?auto_836180 ) ) ( not ( = ?auto_836177 ?auto_836181 ) ) ( not ( = ?auto_836177 ?auto_836182 ) ) ( not ( = ?auto_836177 ?auto_836183 ) ) ( not ( = ?auto_836177 ?auto_836184 ) ) ( not ( = ?auto_836177 ?auto_836185 ) ) ( not ( = ?auto_836177 ?auto_836186 ) ) ( not ( = ?auto_836177 ?auto_836187 ) ) ( not ( = ?auto_836177 ?auto_836188 ) ) ( not ( = ?auto_836177 ?auto_836189 ) ) ( not ( = ?auto_836177 ?auto_836190 ) ) ( not ( = ?auto_836178 ?auto_836179 ) ) ( not ( = ?auto_836178 ?auto_836180 ) ) ( not ( = ?auto_836178 ?auto_836181 ) ) ( not ( = ?auto_836178 ?auto_836182 ) ) ( not ( = ?auto_836178 ?auto_836183 ) ) ( not ( = ?auto_836178 ?auto_836184 ) ) ( not ( = ?auto_836178 ?auto_836185 ) ) ( not ( = ?auto_836178 ?auto_836186 ) ) ( not ( = ?auto_836178 ?auto_836187 ) ) ( not ( = ?auto_836178 ?auto_836188 ) ) ( not ( = ?auto_836178 ?auto_836189 ) ) ( not ( = ?auto_836178 ?auto_836190 ) ) ( not ( = ?auto_836179 ?auto_836180 ) ) ( not ( = ?auto_836179 ?auto_836181 ) ) ( not ( = ?auto_836179 ?auto_836182 ) ) ( not ( = ?auto_836179 ?auto_836183 ) ) ( not ( = ?auto_836179 ?auto_836184 ) ) ( not ( = ?auto_836179 ?auto_836185 ) ) ( not ( = ?auto_836179 ?auto_836186 ) ) ( not ( = ?auto_836179 ?auto_836187 ) ) ( not ( = ?auto_836179 ?auto_836188 ) ) ( not ( = ?auto_836179 ?auto_836189 ) ) ( not ( = ?auto_836179 ?auto_836190 ) ) ( not ( = ?auto_836180 ?auto_836181 ) ) ( not ( = ?auto_836180 ?auto_836182 ) ) ( not ( = ?auto_836180 ?auto_836183 ) ) ( not ( = ?auto_836180 ?auto_836184 ) ) ( not ( = ?auto_836180 ?auto_836185 ) ) ( not ( = ?auto_836180 ?auto_836186 ) ) ( not ( = ?auto_836180 ?auto_836187 ) ) ( not ( = ?auto_836180 ?auto_836188 ) ) ( not ( = ?auto_836180 ?auto_836189 ) ) ( not ( = ?auto_836180 ?auto_836190 ) ) ( not ( = ?auto_836181 ?auto_836182 ) ) ( not ( = ?auto_836181 ?auto_836183 ) ) ( not ( = ?auto_836181 ?auto_836184 ) ) ( not ( = ?auto_836181 ?auto_836185 ) ) ( not ( = ?auto_836181 ?auto_836186 ) ) ( not ( = ?auto_836181 ?auto_836187 ) ) ( not ( = ?auto_836181 ?auto_836188 ) ) ( not ( = ?auto_836181 ?auto_836189 ) ) ( not ( = ?auto_836181 ?auto_836190 ) ) ( not ( = ?auto_836182 ?auto_836183 ) ) ( not ( = ?auto_836182 ?auto_836184 ) ) ( not ( = ?auto_836182 ?auto_836185 ) ) ( not ( = ?auto_836182 ?auto_836186 ) ) ( not ( = ?auto_836182 ?auto_836187 ) ) ( not ( = ?auto_836182 ?auto_836188 ) ) ( not ( = ?auto_836182 ?auto_836189 ) ) ( not ( = ?auto_836182 ?auto_836190 ) ) ( not ( = ?auto_836183 ?auto_836184 ) ) ( not ( = ?auto_836183 ?auto_836185 ) ) ( not ( = ?auto_836183 ?auto_836186 ) ) ( not ( = ?auto_836183 ?auto_836187 ) ) ( not ( = ?auto_836183 ?auto_836188 ) ) ( not ( = ?auto_836183 ?auto_836189 ) ) ( not ( = ?auto_836183 ?auto_836190 ) ) ( not ( = ?auto_836184 ?auto_836185 ) ) ( not ( = ?auto_836184 ?auto_836186 ) ) ( not ( = ?auto_836184 ?auto_836187 ) ) ( not ( = ?auto_836184 ?auto_836188 ) ) ( not ( = ?auto_836184 ?auto_836189 ) ) ( not ( = ?auto_836184 ?auto_836190 ) ) ( not ( = ?auto_836185 ?auto_836186 ) ) ( not ( = ?auto_836185 ?auto_836187 ) ) ( not ( = ?auto_836185 ?auto_836188 ) ) ( not ( = ?auto_836185 ?auto_836189 ) ) ( not ( = ?auto_836185 ?auto_836190 ) ) ( not ( = ?auto_836186 ?auto_836187 ) ) ( not ( = ?auto_836186 ?auto_836188 ) ) ( not ( = ?auto_836186 ?auto_836189 ) ) ( not ( = ?auto_836186 ?auto_836190 ) ) ( not ( = ?auto_836187 ?auto_836188 ) ) ( not ( = ?auto_836187 ?auto_836189 ) ) ( not ( = ?auto_836187 ?auto_836190 ) ) ( not ( = ?auto_836188 ?auto_836189 ) ) ( not ( = ?auto_836188 ?auto_836190 ) ) ( not ( = ?auto_836189 ?auto_836190 ) ) ( ON ?auto_836189 ?auto_836190 ) ( ON ?auto_836188 ?auto_836189 ) ( ON ?auto_836187 ?auto_836188 ) ( ON ?auto_836186 ?auto_836187 ) ( ON ?auto_836185 ?auto_836186 ) ( ON ?auto_836184 ?auto_836185 ) ( ON ?auto_836183 ?auto_836184 ) ( ON ?auto_836182 ?auto_836183 ) ( ON ?auto_836181 ?auto_836182 ) ( ON ?auto_836180 ?auto_836181 ) ( ON ?auto_836179 ?auto_836180 ) ( ON ?auto_836178 ?auto_836179 ) ( ON ?auto_836177 ?auto_836178 ) ( CLEAR ?auto_836175 ) ( ON ?auto_836176 ?auto_836177 ) ( CLEAR ?auto_836176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_836173 ?auto_836174 ?auto_836175 ?auto_836176 )
      ( MAKE-18PILE ?auto_836173 ?auto_836174 ?auto_836175 ?auto_836176 ?auto_836177 ?auto_836178 ?auto_836179 ?auto_836180 ?auto_836181 ?auto_836182 ?auto_836183 ?auto_836184 ?auto_836185 ?auto_836186 ?auto_836187 ?auto_836188 ?auto_836189 ?auto_836190 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_836209 - BLOCK
      ?auto_836210 - BLOCK
      ?auto_836211 - BLOCK
      ?auto_836212 - BLOCK
      ?auto_836213 - BLOCK
      ?auto_836214 - BLOCK
      ?auto_836215 - BLOCK
      ?auto_836216 - BLOCK
      ?auto_836217 - BLOCK
      ?auto_836218 - BLOCK
      ?auto_836219 - BLOCK
      ?auto_836220 - BLOCK
      ?auto_836221 - BLOCK
      ?auto_836222 - BLOCK
      ?auto_836223 - BLOCK
      ?auto_836224 - BLOCK
      ?auto_836225 - BLOCK
      ?auto_836226 - BLOCK
    )
    :vars
    (
      ?auto_836227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836226 ?auto_836227 ) ( ON-TABLE ?auto_836209 ) ( ON ?auto_836210 ?auto_836209 ) ( not ( = ?auto_836209 ?auto_836210 ) ) ( not ( = ?auto_836209 ?auto_836211 ) ) ( not ( = ?auto_836209 ?auto_836212 ) ) ( not ( = ?auto_836209 ?auto_836213 ) ) ( not ( = ?auto_836209 ?auto_836214 ) ) ( not ( = ?auto_836209 ?auto_836215 ) ) ( not ( = ?auto_836209 ?auto_836216 ) ) ( not ( = ?auto_836209 ?auto_836217 ) ) ( not ( = ?auto_836209 ?auto_836218 ) ) ( not ( = ?auto_836209 ?auto_836219 ) ) ( not ( = ?auto_836209 ?auto_836220 ) ) ( not ( = ?auto_836209 ?auto_836221 ) ) ( not ( = ?auto_836209 ?auto_836222 ) ) ( not ( = ?auto_836209 ?auto_836223 ) ) ( not ( = ?auto_836209 ?auto_836224 ) ) ( not ( = ?auto_836209 ?auto_836225 ) ) ( not ( = ?auto_836209 ?auto_836226 ) ) ( not ( = ?auto_836209 ?auto_836227 ) ) ( not ( = ?auto_836210 ?auto_836211 ) ) ( not ( = ?auto_836210 ?auto_836212 ) ) ( not ( = ?auto_836210 ?auto_836213 ) ) ( not ( = ?auto_836210 ?auto_836214 ) ) ( not ( = ?auto_836210 ?auto_836215 ) ) ( not ( = ?auto_836210 ?auto_836216 ) ) ( not ( = ?auto_836210 ?auto_836217 ) ) ( not ( = ?auto_836210 ?auto_836218 ) ) ( not ( = ?auto_836210 ?auto_836219 ) ) ( not ( = ?auto_836210 ?auto_836220 ) ) ( not ( = ?auto_836210 ?auto_836221 ) ) ( not ( = ?auto_836210 ?auto_836222 ) ) ( not ( = ?auto_836210 ?auto_836223 ) ) ( not ( = ?auto_836210 ?auto_836224 ) ) ( not ( = ?auto_836210 ?auto_836225 ) ) ( not ( = ?auto_836210 ?auto_836226 ) ) ( not ( = ?auto_836210 ?auto_836227 ) ) ( not ( = ?auto_836211 ?auto_836212 ) ) ( not ( = ?auto_836211 ?auto_836213 ) ) ( not ( = ?auto_836211 ?auto_836214 ) ) ( not ( = ?auto_836211 ?auto_836215 ) ) ( not ( = ?auto_836211 ?auto_836216 ) ) ( not ( = ?auto_836211 ?auto_836217 ) ) ( not ( = ?auto_836211 ?auto_836218 ) ) ( not ( = ?auto_836211 ?auto_836219 ) ) ( not ( = ?auto_836211 ?auto_836220 ) ) ( not ( = ?auto_836211 ?auto_836221 ) ) ( not ( = ?auto_836211 ?auto_836222 ) ) ( not ( = ?auto_836211 ?auto_836223 ) ) ( not ( = ?auto_836211 ?auto_836224 ) ) ( not ( = ?auto_836211 ?auto_836225 ) ) ( not ( = ?auto_836211 ?auto_836226 ) ) ( not ( = ?auto_836211 ?auto_836227 ) ) ( not ( = ?auto_836212 ?auto_836213 ) ) ( not ( = ?auto_836212 ?auto_836214 ) ) ( not ( = ?auto_836212 ?auto_836215 ) ) ( not ( = ?auto_836212 ?auto_836216 ) ) ( not ( = ?auto_836212 ?auto_836217 ) ) ( not ( = ?auto_836212 ?auto_836218 ) ) ( not ( = ?auto_836212 ?auto_836219 ) ) ( not ( = ?auto_836212 ?auto_836220 ) ) ( not ( = ?auto_836212 ?auto_836221 ) ) ( not ( = ?auto_836212 ?auto_836222 ) ) ( not ( = ?auto_836212 ?auto_836223 ) ) ( not ( = ?auto_836212 ?auto_836224 ) ) ( not ( = ?auto_836212 ?auto_836225 ) ) ( not ( = ?auto_836212 ?auto_836226 ) ) ( not ( = ?auto_836212 ?auto_836227 ) ) ( not ( = ?auto_836213 ?auto_836214 ) ) ( not ( = ?auto_836213 ?auto_836215 ) ) ( not ( = ?auto_836213 ?auto_836216 ) ) ( not ( = ?auto_836213 ?auto_836217 ) ) ( not ( = ?auto_836213 ?auto_836218 ) ) ( not ( = ?auto_836213 ?auto_836219 ) ) ( not ( = ?auto_836213 ?auto_836220 ) ) ( not ( = ?auto_836213 ?auto_836221 ) ) ( not ( = ?auto_836213 ?auto_836222 ) ) ( not ( = ?auto_836213 ?auto_836223 ) ) ( not ( = ?auto_836213 ?auto_836224 ) ) ( not ( = ?auto_836213 ?auto_836225 ) ) ( not ( = ?auto_836213 ?auto_836226 ) ) ( not ( = ?auto_836213 ?auto_836227 ) ) ( not ( = ?auto_836214 ?auto_836215 ) ) ( not ( = ?auto_836214 ?auto_836216 ) ) ( not ( = ?auto_836214 ?auto_836217 ) ) ( not ( = ?auto_836214 ?auto_836218 ) ) ( not ( = ?auto_836214 ?auto_836219 ) ) ( not ( = ?auto_836214 ?auto_836220 ) ) ( not ( = ?auto_836214 ?auto_836221 ) ) ( not ( = ?auto_836214 ?auto_836222 ) ) ( not ( = ?auto_836214 ?auto_836223 ) ) ( not ( = ?auto_836214 ?auto_836224 ) ) ( not ( = ?auto_836214 ?auto_836225 ) ) ( not ( = ?auto_836214 ?auto_836226 ) ) ( not ( = ?auto_836214 ?auto_836227 ) ) ( not ( = ?auto_836215 ?auto_836216 ) ) ( not ( = ?auto_836215 ?auto_836217 ) ) ( not ( = ?auto_836215 ?auto_836218 ) ) ( not ( = ?auto_836215 ?auto_836219 ) ) ( not ( = ?auto_836215 ?auto_836220 ) ) ( not ( = ?auto_836215 ?auto_836221 ) ) ( not ( = ?auto_836215 ?auto_836222 ) ) ( not ( = ?auto_836215 ?auto_836223 ) ) ( not ( = ?auto_836215 ?auto_836224 ) ) ( not ( = ?auto_836215 ?auto_836225 ) ) ( not ( = ?auto_836215 ?auto_836226 ) ) ( not ( = ?auto_836215 ?auto_836227 ) ) ( not ( = ?auto_836216 ?auto_836217 ) ) ( not ( = ?auto_836216 ?auto_836218 ) ) ( not ( = ?auto_836216 ?auto_836219 ) ) ( not ( = ?auto_836216 ?auto_836220 ) ) ( not ( = ?auto_836216 ?auto_836221 ) ) ( not ( = ?auto_836216 ?auto_836222 ) ) ( not ( = ?auto_836216 ?auto_836223 ) ) ( not ( = ?auto_836216 ?auto_836224 ) ) ( not ( = ?auto_836216 ?auto_836225 ) ) ( not ( = ?auto_836216 ?auto_836226 ) ) ( not ( = ?auto_836216 ?auto_836227 ) ) ( not ( = ?auto_836217 ?auto_836218 ) ) ( not ( = ?auto_836217 ?auto_836219 ) ) ( not ( = ?auto_836217 ?auto_836220 ) ) ( not ( = ?auto_836217 ?auto_836221 ) ) ( not ( = ?auto_836217 ?auto_836222 ) ) ( not ( = ?auto_836217 ?auto_836223 ) ) ( not ( = ?auto_836217 ?auto_836224 ) ) ( not ( = ?auto_836217 ?auto_836225 ) ) ( not ( = ?auto_836217 ?auto_836226 ) ) ( not ( = ?auto_836217 ?auto_836227 ) ) ( not ( = ?auto_836218 ?auto_836219 ) ) ( not ( = ?auto_836218 ?auto_836220 ) ) ( not ( = ?auto_836218 ?auto_836221 ) ) ( not ( = ?auto_836218 ?auto_836222 ) ) ( not ( = ?auto_836218 ?auto_836223 ) ) ( not ( = ?auto_836218 ?auto_836224 ) ) ( not ( = ?auto_836218 ?auto_836225 ) ) ( not ( = ?auto_836218 ?auto_836226 ) ) ( not ( = ?auto_836218 ?auto_836227 ) ) ( not ( = ?auto_836219 ?auto_836220 ) ) ( not ( = ?auto_836219 ?auto_836221 ) ) ( not ( = ?auto_836219 ?auto_836222 ) ) ( not ( = ?auto_836219 ?auto_836223 ) ) ( not ( = ?auto_836219 ?auto_836224 ) ) ( not ( = ?auto_836219 ?auto_836225 ) ) ( not ( = ?auto_836219 ?auto_836226 ) ) ( not ( = ?auto_836219 ?auto_836227 ) ) ( not ( = ?auto_836220 ?auto_836221 ) ) ( not ( = ?auto_836220 ?auto_836222 ) ) ( not ( = ?auto_836220 ?auto_836223 ) ) ( not ( = ?auto_836220 ?auto_836224 ) ) ( not ( = ?auto_836220 ?auto_836225 ) ) ( not ( = ?auto_836220 ?auto_836226 ) ) ( not ( = ?auto_836220 ?auto_836227 ) ) ( not ( = ?auto_836221 ?auto_836222 ) ) ( not ( = ?auto_836221 ?auto_836223 ) ) ( not ( = ?auto_836221 ?auto_836224 ) ) ( not ( = ?auto_836221 ?auto_836225 ) ) ( not ( = ?auto_836221 ?auto_836226 ) ) ( not ( = ?auto_836221 ?auto_836227 ) ) ( not ( = ?auto_836222 ?auto_836223 ) ) ( not ( = ?auto_836222 ?auto_836224 ) ) ( not ( = ?auto_836222 ?auto_836225 ) ) ( not ( = ?auto_836222 ?auto_836226 ) ) ( not ( = ?auto_836222 ?auto_836227 ) ) ( not ( = ?auto_836223 ?auto_836224 ) ) ( not ( = ?auto_836223 ?auto_836225 ) ) ( not ( = ?auto_836223 ?auto_836226 ) ) ( not ( = ?auto_836223 ?auto_836227 ) ) ( not ( = ?auto_836224 ?auto_836225 ) ) ( not ( = ?auto_836224 ?auto_836226 ) ) ( not ( = ?auto_836224 ?auto_836227 ) ) ( not ( = ?auto_836225 ?auto_836226 ) ) ( not ( = ?auto_836225 ?auto_836227 ) ) ( not ( = ?auto_836226 ?auto_836227 ) ) ( ON ?auto_836225 ?auto_836226 ) ( ON ?auto_836224 ?auto_836225 ) ( ON ?auto_836223 ?auto_836224 ) ( ON ?auto_836222 ?auto_836223 ) ( ON ?auto_836221 ?auto_836222 ) ( ON ?auto_836220 ?auto_836221 ) ( ON ?auto_836219 ?auto_836220 ) ( ON ?auto_836218 ?auto_836219 ) ( ON ?auto_836217 ?auto_836218 ) ( ON ?auto_836216 ?auto_836217 ) ( ON ?auto_836215 ?auto_836216 ) ( ON ?auto_836214 ?auto_836215 ) ( ON ?auto_836213 ?auto_836214 ) ( ON ?auto_836212 ?auto_836213 ) ( CLEAR ?auto_836210 ) ( ON ?auto_836211 ?auto_836212 ) ( CLEAR ?auto_836211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_836209 ?auto_836210 ?auto_836211 )
      ( MAKE-18PILE ?auto_836209 ?auto_836210 ?auto_836211 ?auto_836212 ?auto_836213 ?auto_836214 ?auto_836215 ?auto_836216 ?auto_836217 ?auto_836218 ?auto_836219 ?auto_836220 ?auto_836221 ?auto_836222 ?auto_836223 ?auto_836224 ?auto_836225 ?auto_836226 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_836246 - BLOCK
      ?auto_836247 - BLOCK
      ?auto_836248 - BLOCK
      ?auto_836249 - BLOCK
      ?auto_836250 - BLOCK
      ?auto_836251 - BLOCK
      ?auto_836252 - BLOCK
      ?auto_836253 - BLOCK
      ?auto_836254 - BLOCK
      ?auto_836255 - BLOCK
      ?auto_836256 - BLOCK
      ?auto_836257 - BLOCK
      ?auto_836258 - BLOCK
      ?auto_836259 - BLOCK
      ?auto_836260 - BLOCK
      ?auto_836261 - BLOCK
      ?auto_836262 - BLOCK
      ?auto_836263 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_836263 ) ( ON-TABLE ?auto_836246 ) ( ON ?auto_836247 ?auto_836246 ) ( not ( = ?auto_836246 ?auto_836247 ) ) ( not ( = ?auto_836246 ?auto_836248 ) ) ( not ( = ?auto_836246 ?auto_836249 ) ) ( not ( = ?auto_836246 ?auto_836250 ) ) ( not ( = ?auto_836246 ?auto_836251 ) ) ( not ( = ?auto_836246 ?auto_836252 ) ) ( not ( = ?auto_836246 ?auto_836253 ) ) ( not ( = ?auto_836246 ?auto_836254 ) ) ( not ( = ?auto_836246 ?auto_836255 ) ) ( not ( = ?auto_836246 ?auto_836256 ) ) ( not ( = ?auto_836246 ?auto_836257 ) ) ( not ( = ?auto_836246 ?auto_836258 ) ) ( not ( = ?auto_836246 ?auto_836259 ) ) ( not ( = ?auto_836246 ?auto_836260 ) ) ( not ( = ?auto_836246 ?auto_836261 ) ) ( not ( = ?auto_836246 ?auto_836262 ) ) ( not ( = ?auto_836246 ?auto_836263 ) ) ( not ( = ?auto_836247 ?auto_836248 ) ) ( not ( = ?auto_836247 ?auto_836249 ) ) ( not ( = ?auto_836247 ?auto_836250 ) ) ( not ( = ?auto_836247 ?auto_836251 ) ) ( not ( = ?auto_836247 ?auto_836252 ) ) ( not ( = ?auto_836247 ?auto_836253 ) ) ( not ( = ?auto_836247 ?auto_836254 ) ) ( not ( = ?auto_836247 ?auto_836255 ) ) ( not ( = ?auto_836247 ?auto_836256 ) ) ( not ( = ?auto_836247 ?auto_836257 ) ) ( not ( = ?auto_836247 ?auto_836258 ) ) ( not ( = ?auto_836247 ?auto_836259 ) ) ( not ( = ?auto_836247 ?auto_836260 ) ) ( not ( = ?auto_836247 ?auto_836261 ) ) ( not ( = ?auto_836247 ?auto_836262 ) ) ( not ( = ?auto_836247 ?auto_836263 ) ) ( not ( = ?auto_836248 ?auto_836249 ) ) ( not ( = ?auto_836248 ?auto_836250 ) ) ( not ( = ?auto_836248 ?auto_836251 ) ) ( not ( = ?auto_836248 ?auto_836252 ) ) ( not ( = ?auto_836248 ?auto_836253 ) ) ( not ( = ?auto_836248 ?auto_836254 ) ) ( not ( = ?auto_836248 ?auto_836255 ) ) ( not ( = ?auto_836248 ?auto_836256 ) ) ( not ( = ?auto_836248 ?auto_836257 ) ) ( not ( = ?auto_836248 ?auto_836258 ) ) ( not ( = ?auto_836248 ?auto_836259 ) ) ( not ( = ?auto_836248 ?auto_836260 ) ) ( not ( = ?auto_836248 ?auto_836261 ) ) ( not ( = ?auto_836248 ?auto_836262 ) ) ( not ( = ?auto_836248 ?auto_836263 ) ) ( not ( = ?auto_836249 ?auto_836250 ) ) ( not ( = ?auto_836249 ?auto_836251 ) ) ( not ( = ?auto_836249 ?auto_836252 ) ) ( not ( = ?auto_836249 ?auto_836253 ) ) ( not ( = ?auto_836249 ?auto_836254 ) ) ( not ( = ?auto_836249 ?auto_836255 ) ) ( not ( = ?auto_836249 ?auto_836256 ) ) ( not ( = ?auto_836249 ?auto_836257 ) ) ( not ( = ?auto_836249 ?auto_836258 ) ) ( not ( = ?auto_836249 ?auto_836259 ) ) ( not ( = ?auto_836249 ?auto_836260 ) ) ( not ( = ?auto_836249 ?auto_836261 ) ) ( not ( = ?auto_836249 ?auto_836262 ) ) ( not ( = ?auto_836249 ?auto_836263 ) ) ( not ( = ?auto_836250 ?auto_836251 ) ) ( not ( = ?auto_836250 ?auto_836252 ) ) ( not ( = ?auto_836250 ?auto_836253 ) ) ( not ( = ?auto_836250 ?auto_836254 ) ) ( not ( = ?auto_836250 ?auto_836255 ) ) ( not ( = ?auto_836250 ?auto_836256 ) ) ( not ( = ?auto_836250 ?auto_836257 ) ) ( not ( = ?auto_836250 ?auto_836258 ) ) ( not ( = ?auto_836250 ?auto_836259 ) ) ( not ( = ?auto_836250 ?auto_836260 ) ) ( not ( = ?auto_836250 ?auto_836261 ) ) ( not ( = ?auto_836250 ?auto_836262 ) ) ( not ( = ?auto_836250 ?auto_836263 ) ) ( not ( = ?auto_836251 ?auto_836252 ) ) ( not ( = ?auto_836251 ?auto_836253 ) ) ( not ( = ?auto_836251 ?auto_836254 ) ) ( not ( = ?auto_836251 ?auto_836255 ) ) ( not ( = ?auto_836251 ?auto_836256 ) ) ( not ( = ?auto_836251 ?auto_836257 ) ) ( not ( = ?auto_836251 ?auto_836258 ) ) ( not ( = ?auto_836251 ?auto_836259 ) ) ( not ( = ?auto_836251 ?auto_836260 ) ) ( not ( = ?auto_836251 ?auto_836261 ) ) ( not ( = ?auto_836251 ?auto_836262 ) ) ( not ( = ?auto_836251 ?auto_836263 ) ) ( not ( = ?auto_836252 ?auto_836253 ) ) ( not ( = ?auto_836252 ?auto_836254 ) ) ( not ( = ?auto_836252 ?auto_836255 ) ) ( not ( = ?auto_836252 ?auto_836256 ) ) ( not ( = ?auto_836252 ?auto_836257 ) ) ( not ( = ?auto_836252 ?auto_836258 ) ) ( not ( = ?auto_836252 ?auto_836259 ) ) ( not ( = ?auto_836252 ?auto_836260 ) ) ( not ( = ?auto_836252 ?auto_836261 ) ) ( not ( = ?auto_836252 ?auto_836262 ) ) ( not ( = ?auto_836252 ?auto_836263 ) ) ( not ( = ?auto_836253 ?auto_836254 ) ) ( not ( = ?auto_836253 ?auto_836255 ) ) ( not ( = ?auto_836253 ?auto_836256 ) ) ( not ( = ?auto_836253 ?auto_836257 ) ) ( not ( = ?auto_836253 ?auto_836258 ) ) ( not ( = ?auto_836253 ?auto_836259 ) ) ( not ( = ?auto_836253 ?auto_836260 ) ) ( not ( = ?auto_836253 ?auto_836261 ) ) ( not ( = ?auto_836253 ?auto_836262 ) ) ( not ( = ?auto_836253 ?auto_836263 ) ) ( not ( = ?auto_836254 ?auto_836255 ) ) ( not ( = ?auto_836254 ?auto_836256 ) ) ( not ( = ?auto_836254 ?auto_836257 ) ) ( not ( = ?auto_836254 ?auto_836258 ) ) ( not ( = ?auto_836254 ?auto_836259 ) ) ( not ( = ?auto_836254 ?auto_836260 ) ) ( not ( = ?auto_836254 ?auto_836261 ) ) ( not ( = ?auto_836254 ?auto_836262 ) ) ( not ( = ?auto_836254 ?auto_836263 ) ) ( not ( = ?auto_836255 ?auto_836256 ) ) ( not ( = ?auto_836255 ?auto_836257 ) ) ( not ( = ?auto_836255 ?auto_836258 ) ) ( not ( = ?auto_836255 ?auto_836259 ) ) ( not ( = ?auto_836255 ?auto_836260 ) ) ( not ( = ?auto_836255 ?auto_836261 ) ) ( not ( = ?auto_836255 ?auto_836262 ) ) ( not ( = ?auto_836255 ?auto_836263 ) ) ( not ( = ?auto_836256 ?auto_836257 ) ) ( not ( = ?auto_836256 ?auto_836258 ) ) ( not ( = ?auto_836256 ?auto_836259 ) ) ( not ( = ?auto_836256 ?auto_836260 ) ) ( not ( = ?auto_836256 ?auto_836261 ) ) ( not ( = ?auto_836256 ?auto_836262 ) ) ( not ( = ?auto_836256 ?auto_836263 ) ) ( not ( = ?auto_836257 ?auto_836258 ) ) ( not ( = ?auto_836257 ?auto_836259 ) ) ( not ( = ?auto_836257 ?auto_836260 ) ) ( not ( = ?auto_836257 ?auto_836261 ) ) ( not ( = ?auto_836257 ?auto_836262 ) ) ( not ( = ?auto_836257 ?auto_836263 ) ) ( not ( = ?auto_836258 ?auto_836259 ) ) ( not ( = ?auto_836258 ?auto_836260 ) ) ( not ( = ?auto_836258 ?auto_836261 ) ) ( not ( = ?auto_836258 ?auto_836262 ) ) ( not ( = ?auto_836258 ?auto_836263 ) ) ( not ( = ?auto_836259 ?auto_836260 ) ) ( not ( = ?auto_836259 ?auto_836261 ) ) ( not ( = ?auto_836259 ?auto_836262 ) ) ( not ( = ?auto_836259 ?auto_836263 ) ) ( not ( = ?auto_836260 ?auto_836261 ) ) ( not ( = ?auto_836260 ?auto_836262 ) ) ( not ( = ?auto_836260 ?auto_836263 ) ) ( not ( = ?auto_836261 ?auto_836262 ) ) ( not ( = ?auto_836261 ?auto_836263 ) ) ( not ( = ?auto_836262 ?auto_836263 ) ) ( ON ?auto_836262 ?auto_836263 ) ( ON ?auto_836261 ?auto_836262 ) ( ON ?auto_836260 ?auto_836261 ) ( ON ?auto_836259 ?auto_836260 ) ( ON ?auto_836258 ?auto_836259 ) ( ON ?auto_836257 ?auto_836258 ) ( ON ?auto_836256 ?auto_836257 ) ( ON ?auto_836255 ?auto_836256 ) ( ON ?auto_836254 ?auto_836255 ) ( ON ?auto_836253 ?auto_836254 ) ( ON ?auto_836252 ?auto_836253 ) ( ON ?auto_836251 ?auto_836252 ) ( ON ?auto_836250 ?auto_836251 ) ( ON ?auto_836249 ?auto_836250 ) ( CLEAR ?auto_836247 ) ( ON ?auto_836248 ?auto_836249 ) ( CLEAR ?auto_836248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_836246 ?auto_836247 ?auto_836248 )
      ( MAKE-18PILE ?auto_836246 ?auto_836247 ?auto_836248 ?auto_836249 ?auto_836250 ?auto_836251 ?auto_836252 ?auto_836253 ?auto_836254 ?auto_836255 ?auto_836256 ?auto_836257 ?auto_836258 ?auto_836259 ?auto_836260 ?auto_836261 ?auto_836262 ?auto_836263 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_836282 - BLOCK
      ?auto_836283 - BLOCK
      ?auto_836284 - BLOCK
      ?auto_836285 - BLOCK
      ?auto_836286 - BLOCK
      ?auto_836287 - BLOCK
      ?auto_836288 - BLOCK
      ?auto_836289 - BLOCK
      ?auto_836290 - BLOCK
      ?auto_836291 - BLOCK
      ?auto_836292 - BLOCK
      ?auto_836293 - BLOCK
      ?auto_836294 - BLOCK
      ?auto_836295 - BLOCK
      ?auto_836296 - BLOCK
      ?auto_836297 - BLOCK
      ?auto_836298 - BLOCK
      ?auto_836299 - BLOCK
    )
    :vars
    (
      ?auto_836300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836299 ?auto_836300 ) ( ON-TABLE ?auto_836282 ) ( not ( = ?auto_836282 ?auto_836283 ) ) ( not ( = ?auto_836282 ?auto_836284 ) ) ( not ( = ?auto_836282 ?auto_836285 ) ) ( not ( = ?auto_836282 ?auto_836286 ) ) ( not ( = ?auto_836282 ?auto_836287 ) ) ( not ( = ?auto_836282 ?auto_836288 ) ) ( not ( = ?auto_836282 ?auto_836289 ) ) ( not ( = ?auto_836282 ?auto_836290 ) ) ( not ( = ?auto_836282 ?auto_836291 ) ) ( not ( = ?auto_836282 ?auto_836292 ) ) ( not ( = ?auto_836282 ?auto_836293 ) ) ( not ( = ?auto_836282 ?auto_836294 ) ) ( not ( = ?auto_836282 ?auto_836295 ) ) ( not ( = ?auto_836282 ?auto_836296 ) ) ( not ( = ?auto_836282 ?auto_836297 ) ) ( not ( = ?auto_836282 ?auto_836298 ) ) ( not ( = ?auto_836282 ?auto_836299 ) ) ( not ( = ?auto_836282 ?auto_836300 ) ) ( not ( = ?auto_836283 ?auto_836284 ) ) ( not ( = ?auto_836283 ?auto_836285 ) ) ( not ( = ?auto_836283 ?auto_836286 ) ) ( not ( = ?auto_836283 ?auto_836287 ) ) ( not ( = ?auto_836283 ?auto_836288 ) ) ( not ( = ?auto_836283 ?auto_836289 ) ) ( not ( = ?auto_836283 ?auto_836290 ) ) ( not ( = ?auto_836283 ?auto_836291 ) ) ( not ( = ?auto_836283 ?auto_836292 ) ) ( not ( = ?auto_836283 ?auto_836293 ) ) ( not ( = ?auto_836283 ?auto_836294 ) ) ( not ( = ?auto_836283 ?auto_836295 ) ) ( not ( = ?auto_836283 ?auto_836296 ) ) ( not ( = ?auto_836283 ?auto_836297 ) ) ( not ( = ?auto_836283 ?auto_836298 ) ) ( not ( = ?auto_836283 ?auto_836299 ) ) ( not ( = ?auto_836283 ?auto_836300 ) ) ( not ( = ?auto_836284 ?auto_836285 ) ) ( not ( = ?auto_836284 ?auto_836286 ) ) ( not ( = ?auto_836284 ?auto_836287 ) ) ( not ( = ?auto_836284 ?auto_836288 ) ) ( not ( = ?auto_836284 ?auto_836289 ) ) ( not ( = ?auto_836284 ?auto_836290 ) ) ( not ( = ?auto_836284 ?auto_836291 ) ) ( not ( = ?auto_836284 ?auto_836292 ) ) ( not ( = ?auto_836284 ?auto_836293 ) ) ( not ( = ?auto_836284 ?auto_836294 ) ) ( not ( = ?auto_836284 ?auto_836295 ) ) ( not ( = ?auto_836284 ?auto_836296 ) ) ( not ( = ?auto_836284 ?auto_836297 ) ) ( not ( = ?auto_836284 ?auto_836298 ) ) ( not ( = ?auto_836284 ?auto_836299 ) ) ( not ( = ?auto_836284 ?auto_836300 ) ) ( not ( = ?auto_836285 ?auto_836286 ) ) ( not ( = ?auto_836285 ?auto_836287 ) ) ( not ( = ?auto_836285 ?auto_836288 ) ) ( not ( = ?auto_836285 ?auto_836289 ) ) ( not ( = ?auto_836285 ?auto_836290 ) ) ( not ( = ?auto_836285 ?auto_836291 ) ) ( not ( = ?auto_836285 ?auto_836292 ) ) ( not ( = ?auto_836285 ?auto_836293 ) ) ( not ( = ?auto_836285 ?auto_836294 ) ) ( not ( = ?auto_836285 ?auto_836295 ) ) ( not ( = ?auto_836285 ?auto_836296 ) ) ( not ( = ?auto_836285 ?auto_836297 ) ) ( not ( = ?auto_836285 ?auto_836298 ) ) ( not ( = ?auto_836285 ?auto_836299 ) ) ( not ( = ?auto_836285 ?auto_836300 ) ) ( not ( = ?auto_836286 ?auto_836287 ) ) ( not ( = ?auto_836286 ?auto_836288 ) ) ( not ( = ?auto_836286 ?auto_836289 ) ) ( not ( = ?auto_836286 ?auto_836290 ) ) ( not ( = ?auto_836286 ?auto_836291 ) ) ( not ( = ?auto_836286 ?auto_836292 ) ) ( not ( = ?auto_836286 ?auto_836293 ) ) ( not ( = ?auto_836286 ?auto_836294 ) ) ( not ( = ?auto_836286 ?auto_836295 ) ) ( not ( = ?auto_836286 ?auto_836296 ) ) ( not ( = ?auto_836286 ?auto_836297 ) ) ( not ( = ?auto_836286 ?auto_836298 ) ) ( not ( = ?auto_836286 ?auto_836299 ) ) ( not ( = ?auto_836286 ?auto_836300 ) ) ( not ( = ?auto_836287 ?auto_836288 ) ) ( not ( = ?auto_836287 ?auto_836289 ) ) ( not ( = ?auto_836287 ?auto_836290 ) ) ( not ( = ?auto_836287 ?auto_836291 ) ) ( not ( = ?auto_836287 ?auto_836292 ) ) ( not ( = ?auto_836287 ?auto_836293 ) ) ( not ( = ?auto_836287 ?auto_836294 ) ) ( not ( = ?auto_836287 ?auto_836295 ) ) ( not ( = ?auto_836287 ?auto_836296 ) ) ( not ( = ?auto_836287 ?auto_836297 ) ) ( not ( = ?auto_836287 ?auto_836298 ) ) ( not ( = ?auto_836287 ?auto_836299 ) ) ( not ( = ?auto_836287 ?auto_836300 ) ) ( not ( = ?auto_836288 ?auto_836289 ) ) ( not ( = ?auto_836288 ?auto_836290 ) ) ( not ( = ?auto_836288 ?auto_836291 ) ) ( not ( = ?auto_836288 ?auto_836292 ) ) ( not ( = ?auto_836288 ?auto_836293 ) ) ( not ( = ?auto_836288 ?auto_836294 ) ) ( not ( = ?auto_836288 ?auto_836295 ) ) ( not ( = ?auto_836288 ?auto_836296 ) ) ( not ( = ?auto_836288 ?auto_836297 ) ) ( not ( = ?auto_836288 ?auto_836298 ) ) ( not ( = ?auto_836288 ?auto_836299 ) ) ( not ( = ?auto_836288 ?auto_836300 ) ) ( not ( = ?auto_836289 ?auto_836290 ) ) ( not ( = ?auto_836289 ?auto_836291 ) ) ( not ( = ?auto_836289 ?auto_836292 ) ) ( not ( = ?auto_836289 ?auto_836293 ) ) ( not ( = ?auto_836289 ?auto_836294 ) ) ( not ( = ?auto_836289 ?auto_836295 ) ) ( not ( = ?auto_836289 ?auto_836296 ) ) ( not ( = ?auto_836289 ?auto_836297 ) ) ( not ( = ?auto_836289 ?auto_836298 ) ) ( not ( = ?auto_836289 ?auto_836299 ) ) ( not ( = ?auto_836289 ?auto_836300 ) ) ( not ( = ?auto_836290 ?auto_836291 ) ) ( not ( = ?auto_836290 ?auto_836292 ) ) ( not ( = ?auto_836290 ?auto_836293 ) ) ( not ( = ?auto_836290 ?auto_836294 ) ) ( not ( = ?auto_836290 ?auto_836295 ) ) ( not ( = ?auto_836290 ?auto_836296 ) ) ( not ( = ?auto_836290 ?auto_836297 ) ) ( not ( = ?auto_836290 ?auto_836298 ) ) ( not ( = ?auto_836290 ?auto_836299 ) ) ( not ( = ?auto_836290 ?auto_836300 ) ) ( not ( = ?auto_836291 ?auto_836292 ) ) ( not ( = ?auto_836291 ?auto_836293 ) ) ( not ( = ?auto_836291 ?auto_836294 ) ) ( not ( = ?auto_836291 ?auto_836295 ) ) ( not ( = ?auto_836291 ?auto_836296 ) ) ( not ( = ?auto_836291 ?auto_836297 ) ) ( not ( = ?auto_836291 ?auto_836298 ) ) ( not ( = ?auto_836291 ?auto_836299 ) ) ( not ( = ?auto_836291 ?auto_836300 ) ) ( not ( = ?auto_836292 ?auto_836293 ) ) ( not ( = ?auto_836292 ?auto_836294 ) ) ( not ( = ?auto_836292 ?auto_836295 ) ) ( not ( = ?auto_836292 ?auto_836296 ) ) ( not ( = ?auto_836292 ?auto_836297 ) ) ( not ( = ?auto_836292 ?auto_836298 ) ) ( not ( = ?auto_836292 ?auto_836299 ) ) ( not ( = ?auto_836292 ?auto_836300 ) ) ( not ( = ?auto_836293 ?auto_836294 ) ) ( not ( = ?auto_836293 ?auto_836295 ) ) ( not ( = ?auto_836293 ?auto_836296 ) ) ( not ( = ?auto_836293 ?auto_836297 ) ) ( not ( = ?auto_836293 ?auto_836298 ) ) ( not ( = ?auto_836293 ?auto_836299 ) ) ( not ( = ?auto_836293 ?auto_836300 ) ) ( not ( = ?auto_836294 ?auto_836295 ) ) ( not ( = ?auto_836294 ?auto_836296 ) ) ( not ( = ?auto_836294 ?auto_836297 ) ) ( not ( = ?auto_836294 ?auto_836298 ) ) ( not ( = ?auto_836294 ?auto_836299 ) ) ( not ( = ?auto_836294 ?auto_836300 ) ) ( not ( = ?auto_836295 ?auto_836296 ) ) ( not ( = ?auto_836295 ?auto_836297 ) ) ( not ( = ?auto_836295 ?auto_836298 ) ) ( not ( = ?auto_836295 ?auto_836299 ) ) ( not ( = ?auto_836295 ?auto_836300 ) ) ( not ( = ?auto_836296 ?auto_836297 ) ) ( not ( = ?auto_836296 ?auto_836298 ) ) ( not ( = ?auto_836296 ?auto_836299 ) ) ( not ( = ?auto_836296 ?auto_836300 ) ) ( not ( = ?auto_836297 ?auto_836298 ) ) ( not ( = ?auto_836297 ?auto_836299 ) ) ( not ( = ?auto_836297 ?auto_836300 ) ) ( not ( = ?auto_836298 ?auto_836299 ) ) ( not ( = ?auto_836298 ?auto_836300 ) ) ( not ( = ?auto_836299 ?auto_836300 ) ) ( ON ?auto_836298 ?auto_836299 ) ( ON ?auto_836297 ?auto_836298 ) ( ON ?auto_836296 ?auto_836297 ) ( ON ?auto_836295 ?auto_836296 ) ( ON ?auto_836294 ?auto_836295 ) ( ON ?auto_836293 ?auto_836294 ) ( ON ?auto_836292 ?auto_836293 ) ( ON ?auto_836291 ?auto_836292 ) ( ON ?auto_836290 ?auto_836291 ) ( ON ?auto_836289 ?auto_836290 ) ( ON ?auto_836288 ?auto_836289 ) ( ON ?auto_836287 ?auto_836288 ) ( ON ?auto_836286 ?auto_836287 ) ( ON ?auto_836285 ?auto_836286 ) ( ON ?auto_836284 ?auto_836285 ) ( CLEAR ?auto_836282 ) ( ON ?auto_836283 ?auto_836284 ) ( CLEAR ?auto_836283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_836282 ?auto_836283 )
      ( MAKE-18PILE ?auto_836282 ?auto_836283 ?auto_836284 ?auto_836285 ?auto_836286 ?auto_836287 ?auto_836288 ?auto_836289 ?auto_836290 ?auto_836291 ?auto_836292 ?auto_836293 ?auto_836294 ?auto_836295 ?auto_836296 ?auto_836297 ?auto_836298 ?auto_836299 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_836319 - BLOCK
      ?auto_836320 - BLOCK
      ?auto_836321 - BLOCK
      ?auto_836322 - BLOCK
      ?auto_836323 - BLOCK
      ?auto_836324 - BLOCK
      ?auto_836325 - BLOCK
      ?auto_836326 - BLOCK
      ?auto_836327 - BLOCK
      ?auto_836328 - BLOCK
      ?auto_836329 - BLOCK
      ?auto_836330 - BLOCK
      ?auto_836331 - BLOCK
      ?auto_836332 - BLOCK
      ?auto_836333 - BLOCK
      ?auto_836334 - BLOCK
      ?auto_836335 - BLOCK
      ?auto_836336 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_836336 ) ( ON-TABLE ?auto_836319 ) ( not ( = ?auto_836319 ?auto_836320 ) ) ( not ( = ?auto_836319 ?auto_836321 ) ) ( not ( = ?auto_836319 ?auto_836322 ) ) ( not ( = ?auto_836319 ?auto_836323 ) ) ( not ( = ?auto_836319 ?auto_836324 ) ) ( not ( = ?auto_836319 ?auto_836325 ) ) ( not ( = ?auto_836319 ?auto_836326 ) ) ( not ( = ?auto_836319 ?auto_836327 ) ) ( not ( = ?auto_836319 ?auto_836328 ) ) ( not ( = ?auto_836319 ?auto_836329 ) ) ( not ( = ?auto_836319 ?auto_836330 ) ) ( not ( = ?auto_836319 ?auto_836331 ) ) ( not ( = ?auto_836319 ?auto_836332 ) ) ( not ( = ?auto_836319 ?auto_836333 ) ) ( not ( = ?auto_836319 ?auto_836334 ) ) ( not ( = ?auto_836319 ?auto_836335 ) ) ( not ( = ?auto_836319 ?auto_836336 ) ) ( not ( = ?auto_836320 ?auto_836321 ) ) ( not ( = ?auto_836320 ?auto_836322 ) ) ( not ( = ?auto_836320 ?auto_836323 ) ) ( not ( = ?auto_836320 ?auto_836324 ) ) ( not ( = ?auto_836320 ?auto_836325 ) ) ( not ( = ?auto_836320 ?auto_836326 ) ) ( not ( = ?auto_836320 ?auto_836327 ) ) ( not ( = ?auto_836320 ?auto_836328 ) ) ( not ( = ?auto_836320 ?auto_836329 ) ) ( not ( = ?auto_836320 ?auto_836330 ) ) ( not ( = ?auto_836320 ?auto_836331 ) ) ( not ( = ?auto_836320 ?auto_836332 ) ) ( not ( = ?auto_836320 ?auto_836333 ) ) ( not ( = ?auto_836320 ?auto_836334 ) ) ( not ( = ?auto_836320 ?auto_836335 ) ) ( not ( = ?auto_836320 ?auto_836336 ) ) ( not ( = ?auto_836321 ?auto_836322 ) ) ( not ( = ?auto_836321 ?auto_836323 ) ) ( not ( = ?auto_836321 ?auto_836324 ) ) ( not ( = ?auto_836321 ?auto_836325 ) ) ( not ( = ?auto_836321 ?auto_836326 ) ) ( not ( = ?auto_836321 ?auto_836327 ) ) ( not ( = ?auto_836321 ?auto_836328 ) ) ( not ( = ?auto_836321 ?auto_836329 ) ) ( not ( = ?auto_836321 ?auto_836330 ) ) ( not ( = ?auto_836321 ?auto_836331 ) ) ( not ( = ?auto_836321 ?auto_836332 ) ) ( not ( = ?auto_836321 ?auto_836333 ) ) ( not ( = ?auto_836321 ?auto_836334 ) ) ( not ( = ?auto_836321 ?auto_836335 ) ) ( not ( = ?auto_836321 ?auto_836336 ) ) ( not ( = ?auto_836322 ?auto_836323 ) ) ( not ( = ?auto_836322 ?auto_836324 ) ) ( not ( = ?auto_836322 ?auto_836325 ) ) ( not ( = ?auto_836322 ?auto_836326 ) ) ( not ( = ?auto_836322 ?auto_836327 ) ) ( not ( = ?auto_836322 ?auto_836328 ) ) ( not ( = ?auto_836322 ?auto_836329 ) ) ( not ( = ?auto_836322 ?auto_836330 ) ) ( not ( = ?auto_836322 ?auto_836331 ) ) ( not ( = ?auto_836322 ?auto_836332 ) ) ( not ( = ?auto_836322 ?auto_836333 ) ) ( not ( = ?auto_836322 ?auto_836334 ) ) ( not ( = ?auto_836322 ?auto_836335 ) ) ( not ( = ?auto_836322 ?auto_836336 ) ) ( not ( = ?auto_836323 ?auto_836324 ) ) ( not ( = ?auto_836323 ?auto_836325 ) ) ( not ( = ?auto_836323 ?auto_836326 ) ) ( not ( = ?auto_836323 ?auto_836327 ) ) ( not ( = ?auto_836323 ?auto_836328 ) ) ( not ( = ?auto_836323 ?auto_836329 ) ) ( not ( = ?auto_836323 ?auto_836330 ) ) ( not ( = ?auto_836323 ?auto_836331 ) ) ( not ( = ?auto_836323 ?auto_836332 ) ) ( not ( = ?auto_836323 ?auto_836333 ) ) ( not ( = ?auto_836323 ?auto_836334 ) ) ( not ( = ?auto_836323 ?auto_836335 ) ) ( not ( = ?auto_836323 ?auto_836336 ) ) ( not ( = ?auto_836324 ?auto_836325 ) ) ( not ( = ?auto_836324 ?auto_836326 ) ) ( not ( = ?auto_836324 ?auto_836327 ) ) ( not ( = ?auto_836324 ?auto_836328 ) ) ( not ( = ?auto_836324 ?auto_836329 ) ) ( not ( = ?auto_836324 ?auto_836330 ) ) ( not ( = ?auto_836324 ?auto_836331 ) ) ( not ( = ?auto_836324 ?auto_836332 ) ) ( not ( = ?auto_836324 ?auto_836333 ) ) ( not ( = ?auto_836324 ?auto_836334 ) ) ( not ( = ?auto_836324 ?auto_836335 ) ) ( not ( = ?auto_836324 ?auto_836336 ) ) ( not ( = ?auto_836325 ?auto_836326 ) ) ( not ( = ?auto_836325 ?auto_836327 ) ) ( not ( = ?auto_836325 ?auto_836328 ) ) ( not ( = ?auto_836325 ?auto_836329 ) ) ( not ( = ?auto_836325 ?auto_836330 ) ) ( not ( = ?auto_836325 ?auto_836331 ) ) ( not ( = ?auto_836325 ?auto_836332 ) ) ( not ( = ?auto_836325 ?auto_836333 ) ) ( not ( = ?auto_836325 ?auto_836334 ) ) ( not ( = ?auto_836325 ?auto_836335 ) ) ( not ( = ?auto_836325 ?auto_836336 ) ) ( not ( = ?auto_836326 ?auto_836327 ) ) ( not ( = ?auto_836326 ?auto_836328 ) ) ( not ( = ?auto_836326 ?auto_836329 ) ) ( not ( = ?auto_836326 ?auto_836330 ) ) ( not ( = ?auto_836326 ?auto_836331 ) ) ( not ( = ?auto_836326 ?auto_836332 ) ) ( not ( = ?auto_836326 ?auto_836333 ) ) ( not ( = ?auto_836326 ?auto_836334 ) ) ( not ( = ?auto_836326 ?auto_836335 ) ) ( not ( = ?auto_836326 ?auto_836336 ) ) ( not ( = ?auto_836327 ?auto_836328 ) ) ( not ( = ?auto_836327 ?auto_836329 ) ) ( not ( = ?auto_836327 ?auto_836330 ) ) ( not ( = ?auto_836327 ?auto_836331 ) ) ( not ( = ?auto_836327 ?auto_836332 ) ) ( not ( = ?auto_836327 ?auto_836333 ) ) ( not ( = ?auto_836327 ?auto_836334 ) ) ( not ( = ?auto_836327 ?auto_836335 ) ) ( not ( = ?auto_836327 ?auto_836336 ) ) ( not ( = ?auto_836328 ?auto_836329 ) ) ( not ( = ?auto_836328 ?auto_836330 ) ) ( not ( = ?auto_836328 ?auto_836331 ) ) ( not ( = ?auto_836328 ?auto_836332 ) ) ( not ( = ?auto_836328 ?auto_836333 ) ) ( not ( = ?auto_836328 ?auto_836334 ) ) ( not ( = ?auto_836328 ?auto_836335 ) ) ( not ( = ?auto_836328 ?auto_836336 ) ) ( not ( = ?auto_836329 ?auto_836330 ) ) ( not ( = ?auto_836329 ?auto_836331 ) ) ( not ( = ?auto_836329 ?auto_836332 ) ) ( not ( = ?auto_836329 ?auto_836333 ) ) ( not ( = ?auto_836329 ?auto_836334 ) ) ( not ( = ?auto_836329 ?auto_836335 ) ) ( not ( = ?auto_836329 ?auto_836336 ) ) ( not ( = ?auto_836330 ?auto_836331 ) ) ( not ( = ?auto_836330 ?auto_836332 ) ) ( not ( = ?auto_836330 ?auto_836333 ) ) ( not ( = ?auto_836330 ?auto_836334 ) ) ( not ( = ?auto_836330 ?auto_836335 ) ) ( not ( = ?auto_836330 ?auto_836336 ) ) ( not ( = ?auto_836331 ?auto_836332 ) ) ( not ( = ?auto_836331 ?auto_836333 ) ) ( not ( = ?auto_836331 ?auto_836334 ) ) ( not ( = ?auto_836331 ?auto_836335 ) ) ( not ( = ?auto_836331 ?auto_836336 ) ) ( not ( = ?auto_836332 ?auto_836333 ) ) ( not ( = ?auto_836332 ?auto_836334 ) ) ( not ( = ?auto_836332 ?auto_836335 ) ) ( not ( = ?auto_836332 ?auto_836336 ) ) ( not ( = ?auto_836333 ?auto_836334 ) ) ( not ( = ?auto_836333 ?auto_836335 ) ) ( not ( = ?auto_836333 ?auto_836336 ) ) ( not ( = ?auto_836334 ?auto_836335 ) ) ( not ( = ?auto_836334 ?auto_836336 ) ) ( not ( = ?auto_836335 ?auto_836336 ) ) ( ON ?auto_836335 ?auto_836336 ) ( ON ?auto_836334 ?auto_836335 ) ( ON ?auto_836333 ?auto_836334 ) ( ON ?auto_836332 ?auto_836333 ) ( ON ?auto_836331 ?auto_836332 ) ( ON ?auto_836330 ?auto_836331 ) ( ON ?auto_836329 ?auto_836330 ) ( ON ?auto_836328 ?auto_836329 ) ( ON ?auto_836327 ?auto_836328 ) ( ON ?auto_836326 ?auto_836327 ) ( ON ?auto_836325 ?auto_836326 ) ( ON ?auto_836324 ?auto_836325 ) ( ON ?auto_836323 ?auto_836324 ) ( ON ?auto_836322 ?auto_836323 ) ( ON ?auto_836321 ?auto_836322 ) ( CLEAR ?auto_836319 ) ( ON ?auto_836320 ?auto_836321 ) ( CLEAR ?auto_836320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_836319 ?auto_836320 )
      ( MAKE-18PILE ?auto_836319 ?auto_836320 ?auto_836321 ?auto_836322 ?auto_836323 ?auto_836324 ?auto_836325 ?auto_836326 ?auto_836327 ?auto_836328 ?auto_836329 ?auto_836330 ?auto_836331 ?auto_836332 ?auto_836333 ?auto_836334 ?auto_836335 ?auto_836336 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_836355 - BLOCK
      ?auto_836356 - BLOCK
      ?auto_836357 - BLOCK
      ?auto_836358 - BLOCK
      ?auto_836359 - BLOCK
      ?auto_836360 - BLOCK
      ?auto_836361 - BLOCK
      ?auto_836362 - BLOCK
      ?auto_836363 - BLOCK
      ?auto_836364 - BLOCK
      ?auto_836365 - BLOCK
      ?auto_836366 - BLOCK
      ?auto_836367 - BLOCK
      ?auto_836368 - BLOCK
      ?auto_836369 - BLOCK
      ?auto_836370 - BLOCK
      ?auto_836371 - BLOCK
      ?auto_836372 - BLOCK
    )
    :vars
    (
      ?auto_836373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836372 ?auto_836373 ) ( not ( = ?auto_836355 ?auto_836356 ) ) ( not ( = ?auto_836355 ?auto_836357 ) ) ( not ( = ?auto_836355 ?auto_836358 ) ) ( not ( = ?auto_836355 ?auto_836359 ) ) ( not ( = ?auto_836355 ?auto_836360 ) ) ( not ( = ?auto_836355 ?auto_836361 ) ) ( not ( = ?auto_836355 ?auto_836362 ) ) ( not ( = ?auto_836355 ?auto_836363 ) ) ( not ( = ?auto_836355 ?auto_836364 ) ) ( not ( = ?auto_836355 ?auto_836365 ) ) ( not ( = ?auto_836355 ?auto_836366 ) ) ( not ( = ?auto_836355 ?auto_836367 ) ) ( not ( = ?auto_836355 ?auto_836368 ) ) ( not ( = ?auto_836355 ?auto_836369 ) ) ( not ( = ?auto_836355 ?auto_836370 ) ) ( not ( = ?auto_836355 ?auto_836371 ) ) ( not ( = ?auto_836355 ?auto_836372 ) ) ( not ( = ?auto_836355 ?auto_836373 ) ) ( not ( = ?auto_836356 ?auto_836357 ) ) ( not ( = ?auto_836356 ?auto_836358 ) ) ( not ( = ?auto_836356 ?auto_836359 ) ) ( not ( = ?auto_836356 ?auto_836360 ) ) ( not ( = ?auto_836356 ?auto_836361 ) ) ( not ( = ?auto_836356 ?auto_836362 ) ) ( not ( = ?auto_836356 ?auto_836363 ) ) ( not ( = ?auto_836356 ?auto_836364 ) ) ( not ( = ?auto_836356 ?auto_836365 ) ) ( not ( = ?auto_836356 ?auto_836366 ) ) ( not ( = ?auto_836356 ?auto_836367 ) ) ( not ( = ?auto_836356 ?auto_836368 ) ) ( not ( = ?auto_836356 ?auto_836369 ) ) ( not ( = ?auto_836356 ?auto_836370 ) ) ( not ( = ?auto_836356 ?auto_836371 ) ) ( not ( = ?auto_836356 ?auto_836372 ) ) ( not ( = ?auto_836356 ?auto_836373 ) ) ( not ( = ?auto_836357 ?auto_836358 ) ) ( not ( = ?auto_836357 ?auto_836359 ) ) ( not ( = ?auto_836357 ?auto_836360 ) ) ( not ( = ?auto_836357 ?auto_836361 ) ) ( not ( = ?auto_836357 ?auto_836362 ) ) ( not ( = ?auto_836357 ?auto_836363 ) ) ( not ( = ?auto_836357 ?auto_836364 ) ) ( not ( = ?auto_836357 ?auto_836365 ) ) ( not ( = ?auto_836357 ?auto_836366 ) ) ( not ( = ?auto_836357 ?auto_836367 ) ) ( not ( = ?auto_836357 ?auto_836368 ) ) ( not ( = ?auto_836357 ?auto_836369 ) ) ( not ( = ?auto_836357 ?auto_836370 ) ) ( not ( = ?auto_836357 ?auto_836371 ) ) ( not ( = ?auto_836357 ?auto_836372 ) ) ( not ( = ?auto_836357 ?auto_836373 ) ) ( not ( = ?auto_836358 ?auto_836359 ) ) ( not ( = ?auto_836358 ?auto_836360 ) ) ( not ( = ?auto_836358 ?auto_836361 ) ) ( not ( = ?auto_836358 ?auto_836362 ) ) ( not ( = ?auto_836358 ?auto_836363 ) ) ( not ( = ?auto_836358 ?auto_836364 ) ) ( not ( = ?auto_836358 ?auto_836365 ) ) ( not ( = ?auto_836358 ?auto_836366 ) ) ( not ( = ?auto_836358 ?auto_836367 ) ) ( not ( = ?auto_836358 ?auto_836368 ) ) ( not ( = ?auto_836358 ?auto_836369 ) ) ( not ( = ?auto_836358 ?auto_836370 ) ) ( not ( = ?auto_836358 ?auto_836371 ) ) ( not ( = ?auto_836358 ?auto_836372 ) ) ( not ( = ?auto_836358 ?auto_836373 ) ) ( not ( = ?auto_836359 ?auto_836360 ) ) ( not ( = ?auto_836359 ?auto_836361 ) ) ( not ( = ?auto_836359 ?auto_836362 ) ) ( not ( = ?auto_836359 ?auto_836363 ) ) ( not ( = ?auto_836359 ?auto_836364 ) ) ( not ( = ?auto_836359 ?auto_836365 ) ) ( not ( = ?auto_836359 ?auto_836366 ) ) ( not ( = ?auto_836359 ?auto_836367 ) ) ( not ( = ?auto_836359 ?auto_836368 ) ) ( not ( = ?auto_836359 ?auto_836369 ) ) ( not ( = ?auto_836359 ?auto_836370 ) ) ( not ( = ?auto_836359 ?auto_836371 ) ) ( not ( = ?auto_836359 ?auto_836372 ) ) ( not ( = ?auto_836359 ?auto_836373 ) ) ( not ( = ?auto_836360 ?auto_836361 ) ) ( not ( = ?auto_836360 ?auto_836362 ) ) ( not ( = ?auto_836360 ?auto_836363 ) ) ( not ( = ?auto_836360 ?auto_836364 ) ) ( not ( = ?auto_836360 ?auto_836365 ) ) ( not ( = ?auto_836360 ?auto_836366 ) ) ( not ( = ?auto_836360 ?auto_836367 ) ) ( not ( = ?auto_836360 ?auto_836368 ) ) ( not ( = ?auto_836360 ?auto_836369 ) ) ( not ( = ?auto_836360 ?auto_836370 ) ) ( not ( = ?auto_836360 ?auto_836371 ) ) ( not ( = ?auto_836360 ?auto_836372 ) ) ( not ( = ?auto_836360 ?auto_836373 ) ) ( not ( = ?auto_836361 ?auto_836362 ) ) ( not ( = ?auto_836361 ?auto_836363 ) ) ( not ( = ?auto_836361 ?auto_836364 ) ) ( not ( = ?auto_836361 ?auto_836365 ) ) ( not ( = ?auto_836361 ?auto_836366 ) ) ( not ( = ?auto_836361 ?auto_836367 ) ) ( not ( = ?auto_836361 ?auto_836368 ) ) ( not ( = ?auto_836361 ?auto_836369 ) ) ( not ( = ?auto_836361 ?auto_836370 ) ) ( not ( = ?auto_836361 ?auto_836371 ) ) ( not ( = ?auto_836361 ?auto_836372 ) ) ( not ( = ?auto_836361 ?auto_836373 ) ) ( not ( = ?auto_836362 ?auto_836363 ) ) ( not ( = ?auto_836362 ?auto_836364 ) ) ( not ( = ?auto_836362 ?auto_836365 ) ) ( not ( = ?auto_836362 ?auto_836366 ) ) ( not ( = ?auto_836362 ?auto_836367 ) ) ( not ( = ?auto_836362 ?auto_836368 ) ) ( not ( = ?auto_836362 ?auto_836369 ) ) ( not ( = ?auto_836362 ?auto_836370 ) ) ( not ( = ?auto_836362 ?auto_836371 ) ) ( not ( = ?auto_836362 ?auto_836372 ) ) ( not ( = ?auto_836362 ?auto_836373 ) ) ( not ( = ?auto_836363 ?auto_836364 ) ) ( not ( = ?auto_836363 ?auto_836365 ) ) ( not ( = ?auto_836363 ?auto_836366 ) ) ( not ( = ?auto_836363 ?auto_836367 ) ) ( not ( = ?auto_836363 ?auto_836368 ) ) ( not ( = ?auto_836363 ?auto_836369 ) ) ( not ( = ?auto_836363 ?auto_836370 ) ) ( not ( = ?auto_836363 ?auto_836371 ) ) ( not ( = ?auto_836363 ?auto_836372 ) ) ( not ( = ?auto_836363 ?auto_836373 ) ) ( not ( = ?auto_836364 ?auto_836365 ) ) ( not ( = ?auto_836364 ?auto_836366 ) ) ( not ( = ?auto_836364 ?auto_836367 ) ) ( not ( = ?auto_836364 ?auto_836368 ) ) ( not ( = ?auto_836364 ?auto_836369 ) ) ( not ( = ?auto_836364 ?auto_836370 ) ) ( not ( = ?auto_836364 ?auto_836371 ) ) ( not ( = ?auto_836364 ?auto_836372 ) ) ( not ( = ?auto_836364 ?auto_836373 ) ) ( not ( = ?auto_836365 ?auto_836366 ) ) ( not ( = ?auto_836365 ?auto_836367 ) ) ( not ( = ?auto_836365 ?auto_836368 ) ) ( not ( = ?auto_836365 ?auto_836369 ) ) ( not ( = ?auto_836365 ?auto_836370 ) ) ( not ( = ?auto_836365 ?auto_836371 ) ) ( not ( = ?auto_836365 ?auto_836372 ) ) ( not ( = ?auto_836365 ?auto_836373 ) ) ( not ( = ?auto_836366 ?auto_836367 ) ) ( not ( = ?auto_836366 ?auto_836368 ) ) ( not ( = ?auto_836366 ?auto_836369 ) ) ( not ( = ?auto_836366 ?auto_836370 ) ) ( not ( = ?auto_836366 ?auto_836371 ) ) ( not ( = ?auto_836366 ?auto_836372 ) ) ( not ( = ?auto_836366 ?auto_836373 ) ) ( not ( = ?auto_836367 ?auto_836368 ) ) ( not ( = ?auto_836367 ?auto_836369 ) ) ( not ( = ?auto_836367 ?auto_836370 ) ) ( not ( = ?auto_836367 ?auto_836371 ) ) ( not ( = ?auto_836367 ?auto_836372 ) ) ( not ( = ?auto_836367 ?auto_836373 ) ) ( not ( = ?auto_836368 ?auto_836369 ) ) ( not ( = ?auto_836368 ?auto_836370 ) ) ( not ( = ?auto_836368 ?auto_836371 ) ) ( not ( = ?auto_836368 ?auto_836372 ) ) ( not ( = ?auto_836368 ?auto_836373 ) ) ( not ( = ?auto_836369 ?auto_836370 ) ) ( not ( = ?auto_836369 ?auto_836371 ) ) ( not ( = ?auto_836369 ?auto_836372 ) ) ( not ( = ?auto_836369 ?auto_836373 ) ) ( not ( = ?auto_836370 ?auto_836371 ) ) ( not ( = ?auto_836370 ?auto_836372 ) ) ( not ( = ?auto_836370 ?auto_836373 ) ) ( not ( = ?auto_836371 ?auto_836372 ) ) ( not ( = ?auto_836371 ?auto_836373 ) ) ( not ( = ?auto_836372 ?auto_836373 ) ) ( ON ?auto_836371 ?auto_836372 ) ( ON ?auto_836370 ?auto_836371 ) ( ON ?auto_836369 ?auto_836370 ) ( ON ?auto_836368 ?auto_836369 ) ( ON ?auto_836367 ?auto_836368 ) ( ON ?auto_836366 ?auto_836367 ) ( ON ?auto_836365 ?auto_836366 ) ( ON ?auto_836364 ?auto_836365 ) ( ON ?auto_836363 ?auto_836364 ) ( ON ?auto_836362 ?auto_836363 ) ( ON ?auto_836361 ?auto_836362 ) ( ON ?auto_836360 ?auto_836361 ) ( ON ?auto_836359 ?auto_836360 ) ( ON ?auto_836358 ?auto_836359 ) ( ON ?auto_836357 ?auto_836358 ) ( ON ?auto_836356 ?auto_836357 ) ( ON ?auto_836355 ?auto_836356 ) ( CLEAR ?auto_836355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_836355 )
      ( MAKE-18PILE ?auto_836355 ?auto_836356 ?auto_836357 ?auto_836358 ?auto_836359 ?auto_836360 ?auto_836361 ?auto_836362 ?auto_836363 ?auto_836364 ?auto_836365 ?auto_836366 ?auto_836367 ?auto_836368 ?auto_836369 ?auto_836370 ?auto_836371 ?auto_836372 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_836392 - BLOCK
      ?auto_836393 - BLOCK
      ?auto_836394 - BLOCK
      ?auto_836395 - BLOCK
      ?auto_836396 - BLOCK
      ?auto_836397 - BLOCK
      ?auto_836398 - BLOCK
      ?auto_836399 - BLOCK
      ?auto_836400 - BLOCK
      ?auto_836401 - BLOCK
      ?auto_836402 - BLOCK
      ?auto_836403 - BLOCK
      ?auto_836404 - BLOCK
      ?auto_836405 - BLOCK
      ?auto_836406 - BLOCK
      ?auto_836407 - BLOCK
      ?auto_836408 - BLOCK
      ?auto_836409 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_836409 ) ( not ( = ?auto_836392 ?auto_836393 ) ) ( not ( = ?auto_836392 ?auto_836394 ) ) ( not ( = ?auto_836392 ?auto_836395 ) ) ( not ( = ?auto_836392 ?auto_836396 ) ) ( not ( = ?auto_836392 ?auto_836397 ) ) ( not ( = ?auto_836392 ?auto_836398 ) ) ( not ( = ?auto_836392 ?auto_836399 ) ) ( not ( = ?auto_836392 ?auto_836400 ) ) ( not ( = ?auto_836392 ?auto_836401 ) ) ( not ( = ?auto_836392 ?auto_836402 ) ) ( not ( = ?auto_836392 ?auto_836403 ) ) ( not ( = ?auto_836392 ?auto_836404 ) ) ( not ( = ?auto_836392 ?auto_836405 ) ) ( not ( = ?auto_836392 ?auto_836406 ) ) ( not ( = ?auto_836392 ?auto_836407 ) ) ( not ( = ?auto_836392 ?auto_836408 ) ) ( not ( = ?auto_836392 ?auto_836409 ) ) ( not ( = ?auto_836393 ?auto_836394 ) ) ( not ( = ?auto_836393 ?auto_836395 ) ) ( not ( = ?auto_836393 ?auto_836396 ) ) ( not ( = ?auto_836393 ?auto_836397 ) ) ( not ( = ?auto_836393 ?auto_836398 ) ) ( not ( = ?auto_836393 ?auto_836399 ) ) ( not ( = ?auto_836393 ?auto_836400 ) ) ( not ( = ?auto_836393 ?auto_836401 ) ) ( not ( = ?auto_836393 ?auto_836402 ) ) ( not ( = ?auto_836393 ?auto_836403 ) ) ( not ( = ?auto_836393 ?auto_836404 ) ) ( not ( = ?auto_836393 ?auto_836405 ) ) ( not ( = ?auto_836393 ?auto_836406 ) ) ( not ( = ?auto_836393 ?auto_836407 ) ) ( not ( = ?auto_836393 ?auto_836408 ) ) ( not ( = ?auto_836393 ?auto_836409 ) ) ( not ( = ?auto_836394 ?auto_836395 ) ) ( not ( = ?auto_836394 ?auto_836396 ) ) ( not ( = ?auto_836394 ?auto_836397 ) ) ( not ( = ?auto_836394 ?auto_836398 ) ) ( not ( = ?auto_836394 ?auto_836399 ) ) ( not ( = ?auto_836394 ?auto_836400 ) ) ( not ( = ?auto_836394 ?auto_836401 ) ) ( not ( = ?auto_836394 ?auto_836402 ) ) ( not ( = ?auto_836394 ?auto_836403 ) ) ( not ( = ?auto_836394 ?auto_836404 ) ) ( not ( = ?auto_836394 ?auto_836405 ) ) ( not ( = ?auto_836394 ?auto_836406 ) ) ( not ( = ?auto_836394 ?auto_836407 ) ) ( not ( = ?auto_836394 ?auto_836408 ) ) ( not ( = ?auto_836394 ?auto_836409 ) ) ( not ( = ?auto_836395 ?auto_836396 ) ) ( not ( = ?auto_836395 ?auto_836397 ) ) ( not ( = ?auto_836395 ?auto_836398 ) ) ( not ( = ?auto_836395 ?auto_836399 ) ) ( not ( = ?auto_836395 ?auto_836400 ) ) ( not ( = ?auto_836395 ?auto_836401 ) ) ( not ( = ?auto_836395 ?auto_836402 ) ) ( not ( = ?auto_836395 ?auto_836403 ) ) ( not ( = ?auto_836395 ?auto_836404 ) ) ( not ( = ?auto_836395 ?auto_836405 ) ) ( not ( = ?auto_836395 ?auto_836406 ) ) ( not ( = ?auto_836395 ?auto_836407 ) ) ( not ( = ?auto_836395 ?auto_836408 ) ) ( not ( = ?auto_836395 ?auto_836409 ) ) ( not ( = ?auto_836396 ?auto_836397 ) ) ( not ( = ?auto_836396 ?auto_836398 ) ) ( not ( = ?auto_836396 ?auto_836399 ) ) ( not ( = ?auto_836396 ?auto_836400 ) ) ( not ( = ?auto_836396 ?auto_836401 ) ) ( not ( = ?auto_836396 ?auto_836402 ) ) ( not ( = ?auto_836396 ?auto_836403 ) ) ( not ( = ?auto_836396 ?auto_836404 ) ) ( not ( = ?auto_836396 ?auto_836405 ) ) ( not ( = ?auto_836396 ?auto_836406 ) ) ( not ( = ?auto_836396 ?auto_836407 ) ) ( not ( = ?auto_836396 ?auto_836408 ) ) ( not ( = ?auto_836396 ?auto_836409 ) ) ( not ( = ?auto_836397 ?auto_836398 ) ) ( not ( = ?auto_836397 ?auto_836399 ) ) ( not ( = ?auto_836397 ?auto_836400 ) ) ( not ( = ?auto_836397 ?auto_836401 ) ) ( not ( = ?auto_836397 ?auto_836402 ) ) ( not ( = ?auto_836397 ?auto_836403 ) ) ( not ( = ?auto_836397 ?auto_836404 ) ) ( not ( = ?auto_836397 ?auto_836405 ) ) ( not ( = ?auto_836397 ?auto_836406 ) ) ( not ( = ?auto_836397 ?auto_836407 ) ) ( not ( = ?auto_836397 ?auto_836408 ) ) ( not ( = ?auto_836397 ?auto_836409 ) ) ( not ( = ?auto_836398 ?auto_836399 ) ) ( not ( = ?auto_836398 ?auto_836400 ) ) ( not ( = ?auto_836398 ?auto_836401 ) ) ( not ( = ?auto_836398 ?auto_836402 ) ) ( not ( = ?auto_836398 ?auto_836403 ) ) ( not ( = ?auto_836398 ?auto_836404 ) ) ( not ( = ?auto_836398 ?auto_836405 ) ) ( not ( = ?auto_836398 ?auto_836406 ) ) ( not ( = ?auto_836398 ?auto_836407 ) ) ( not ( = ?auto_836398 ?auto_836408 ) ) ( not ( = ?auto_836398 ?auto_836409 ) ) ( not ( = ?auto_836399 ?auto_836400 ) ) ( not ( = ?auto_836399 ?auto_836401 ) ) ( not ( = ?auto_836399 ?auto_836402 ) ) ( not ( = ?auto_836399 ?auto_836403 ) ) ( not ( = ?auto_836399 ?auto_836404 ) ) ( not ( = ?auto_836399 ?auto_836405 ) ) ( not ( = ?auto_836399 ?auto_836406 ) ) ( not ( = ?auto_836399 ?auto_836407 ) ) ( not ( = ?auto_836399 ?auto_836408 ) ) ( not ( = ?auto_836399 ?auto_836409 ) ) ( not ( = ?auto_836400 ?auto_836401 ) ) ( not ( = ?auto_836400 ?auto_836402 ) ) ( not ( = ?auto_836400 ?auto_836403 ) ) ( not ( = ?auto_836400 ?auto_836404 ) ) ( not ( = ?auto_836400 ?auto_836405 ) ) ( not ( = ?auto_836400 ?auto_836406 ) ) ( not ( = ?auto_836400 ?auto_836407 ) ) ( not ( = ?auto_836400 ?auto_836408 ) ) ( not ( = ?auto_836400 ?auto_836409 ) ) ( not ( = ?auto_836401 ?auto_836402 ) ) ( not ( = ?auto_836401 ?auto_836403 ) ) ( not ( = ?auto_836401 ?auto_836404 ) ) ( not ( = ?auto_836401 ?auto_836405 ) ) ( not ( = ?auto_836401 ?auto_836406 ) ) ( not ( = ?auto_836401 ?auto_836407 ) ) ( not ( = ?auto_836401 ?auto_836408 ) ) ( not ( = ?auto_836401 ?auto_836409 ) ) ( not ( = ?auto_836402 ?auto_836403 ) ) ( not ( = ?auto_836402 ?auto_836404 ) ) ( not ( = ?auto_836402 ?auto_836405 ) ) ( not ( = ?auto_836402 ?auto_836406 ) ) ( not ( = ?auto_836402 ?auto_836407 ) ) ( not ( = ?auto_836402 ?auto_836408 ) ) ( not ( = ?auto_836402 ?auto_836409 ) ) ( not ( = ?auto_836403 ?auto_836404 ) ) ( not ( = ?auto_836403 ?auto_836405 ) ) ( not ( = ?auto_836403 ?auto_836406 ) ) ( not ( = ?auto_836403 ?auto_836407 ) ) ( not ( = ?auto_836403 ?auto_836408 ) ) ( not ( = ?auto_836403 ?auto_836409 ) ) ( not ( = ?auto_836404 ?auto_836405 ) ) ( not ( = ?auto_836404 ?auto_836406 ) ) ( not ( = ?auto_836404 ?auto_836407 ) ) ( not ( = ?auto_836404 ?auto_836408 ) ) ( not ( = ?auto_836404 ?auto_836409 ) ) ( not ( = ?auto_836405 ?auto_836406 ) ) ( not ( = ?auto_836405 ?auto_836407 ) ) ( not ( = ?auto_836405 ?auto_836408 ) ) ( not ( = ?auto_836405 ?auto_836409 ) ) ( not ( = ?auto_836406 ?auto_836407 ) ) ( not ( = ?auto_836406 ?auto_836408 ) ) ( not ( = ?auto_836406 ?auto_836409 ) ) ( not ( = ?auto_836407 ?auto_836408 ) ) ( not ( = ?auto_836407 ?auto_836409 ) ) ( not ( = ?auto_836408 ?auto_836409 ) ) ( ON ?auto_836408 ?auto_836409 ) ( ON ?auto_836407 ?auto_836408 ) ( ON ?auto_836406 ?auto_836407 ) ( ON ?auto_836405 ?auto_836406 ) ( ON ?auto_836404 ?auto_836405 ) ( ON ?auto_836403 ?auto_836404 ) ( ON ?auto_836402 ?auto_836403 ) ( ON ?auto_836401 ?auto_836402 ) ( ON ?auto_836400 ?auto_836401 ) ( ON ?auto_836399 ?auto_836400 ) ( ON ?auto_836398 ?auto_836399 ) ( ON ?auto_836397 ?auto_836398 ) ( ON ?auto_836396 ?auto_836397 ) ( ON ?auto_836395 ?auto_836396 ) ( ON ?auto_836394 ?auto_836395 ) ( ON ?auto_836393 ?auto_836394 ) ( ON ?auto_836392 ?auto_836393 ) ( CLEAR ?auto_836392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_836392 )
      ( MAKE-18PILE ?auto_836392 ?auto_836393 ?auto_836394 ?auto_836395 ?auto_836396 ?auto_836397 ?auto_836398 ?auto_836399 ?auto_836400 ?auto_836401 ?auto_836402 ?auto_836403 ?auto_836404 ?auto_836405 ?auto_836406 ?auto_836407 ?auto_836408 ?auto_836409 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_836428 - BLOCK
      ?auto_836429 - BLOCK
      ?auto_836430 - BLOCK
      ?auto_836431 - BLOCK
      ?auto_836432 - BLOCK
      ?auto_836433 - BLOCK
      ?auto_836434 - BLOCK
      ?auto_836435 - BLOCK
      ?auto_836436 - BLOCK
      ?auto_836437 - BLOCK
      ?auto_836438 - BLOCK
      ?auto_836439 - BLOCK
      ?auto_836440 - BLOCK
      ?auto_836441 - BLOCK
      ?auto_836442 - BLOCK
      ?auto_836443 - BLOCK
      ?auto_836444 - BLOCK
      ?auto_836445 - BLOCK
    )
    :vars
    (
      ?auto_836446 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_836428 ?auto_836429 ) ) ( not ( = ?auto_836428 ?auto_836430 ) ) ( not ( = ?auto_836428 ?auto_836431 ) ) ( not ( = ?auto_836428 ?auto_836432 ) ) ( not ( = ?auto_836428 ?auto_836433 ) ) ( not ( = ?auto_836428 ?auto_836434 ) ) ( not ( = ?auto_836428 ?auto_836435 ) ) ( not ( = ?auto_836428 ?auto_836436 ) ) ( not ( = ?auto_836428 ?auto_836437 ) ) ( not ( = ?auto_836428 ?auto_836438 ) ) ( not ( = ?auto_836428 ?auto_836439 ) ) ( not ( = ?auto_836428 ?auto_836440 ) ) ( not ( = ?auto_836428 ?auto_836441 ) ) ( not ( = ?auto_836428 ?auto_836442 ) ) ( not ( = ?auto_836428 ?auto_836443 ) ) ( not ( = ?auto_836428 ?auto_836444 ) ) ( not ( = ?auto_836428 ?auto_836445 ) ) ( not ( = ?auto_836429 ?auto_836430 ) ) ( not ( = ?auto_836429 ?auto_836431 ) ) ( not ( = ?auto_836429 ?auto_836432 ) ) ( not ( = ?auto_836429 ?auto_836433 ) ) ( not ( = ?auto_836429 ?auto_836434 ) ) ( not ( = ?auto_836429 ?auto_836435 ) ) ( not ( = ?auto_836429 ?auto_836436 ) ) ( not ( = ?auto_836429 ?auto_836437 ) ) ( not ( = ?auto_836429 ?auto_836438 ) ) ( not ( = ?auto_836429 ?auto_836439 ) ) ( not ( = ?auto_836429 ?auto_836440 ) ) ( not ( = ?auto_836429 ?auto_836441 ) ) ( not ( = ?auto_836429 ?auto_836442 ) ) ( not ( = ?auto_836429 ?auto_836443 ) ) ( not ( = ?auto_836429 ?auto_836444 ) ) ( not ( = ?auto_836429 ?auto_836445 ) ) ( not ( = ?auto_836430 ?auto_836431 ) ) ( not ( = ?auto_836430 ?auto_836432 ) ) ( not ( = ?auto_836430 ?auto_836433 ) ) ( not ( = ?auto_836430 ?auto_836434 ) ) ( not ( = ?auto_836430 ?auto_836435 ) ) ( not ( = ?auto_836430 ?auto_836436 ) ) ( not ( = ?auto_836430 ?auto_836437 ) ) ( not ( = ?auto_836430 ?auto_836438 ) ) ( not ( = ?auto_836430 ?auto_836439 ) ) ( not ( = ?auto_836430 ?auto_836440 ) ) ( not ( = ?auto_836430 ?auto_836441 ) ) ( not ( = ?auto_836430 ?auto_836442 ) ) ( not ( = ?auto_836430 ?auto_836443 ) ) ( not ( = ?auto_836430 ?auto_836444 ) ) ( not ( = ?auto_836430 ?auto_836445 ) ) ( not ( = ?auto_836431 ?auto_836432 ) ) ( not ( = ?auto_836431 ?auto_836433 ) ) ( not ( = ?auto_836431 ?auto_836434 ) ) ( not ( = ?auto_836431 ?auto_836435 ) ) ( not ( = ?auto_836431 ?auto_836436 ) ) ( not ( = ?auto_836431 ?auto_836437 ) ) ( not ( = ?auto_836431 ?auto_836438 ) ) ( not ( = ?auto_836431 ?auto_836439 ) ) ( not ( = ?auto_836431 ?auto_836440 ) ) ( not ( = ?auto_836431 ?auto_836441 ) ) ( not ( = ?auto_836431 ?auto_836442 ) ) ( not ( = ?auto_836431 ?auto_836443 ) ) ( not ( = ?auto_836431 ?auto_836444 ) ) ( not ( = ?auto_836431 ?auto_836445 ) ) ( not ( = ?auto_836432 ?auto_836433 ) ) ( not ( = ?auto_836432 ?auto_836434 ) ) ( not ( = ?auto_836432 ?auto_836435 ) ) ( not ( = ?auto_836432 ?auto_836436 ) ) ( not ( = ?auto_836432 ?auto_836437 ) ) ( not ( = ?auto_836432 ?auto_836438 ) ) ( not ( = ?auto_836432 ?auto_836439 ) ) ( not ( = ?auto_836432 ?auto_836440 ) ) ( not ( = ?auto_836432 ?auto_836441 ) ) ( not ( = ?auto_836432 ?auto_836442 ) ) ( not ( = ?auto_836432 ?auto_836443 ) ) ( not ( = ?auto_836432 ?auto_836444 ) ) ( not ( = ?auto_836432 ?auto_836445 ) ) ( not ( = ?auto_836433 ?auto_836434 ) ) ( not ( = ?auto_836433 ?auto_836435 ) ) ( not ( = ?auto_836433 ?auto_836436 ) ) ( not ( = ?auto_836433 ?auto_836437 ) ) ( not ( = ?auto_836433 ?auto_836438 ) ) ( not ( = ?auto_836433 ?auto_836439 ) ) ( not ( = ?auto_836433 ?auto_836440 ) ) ( not ( = ?auto_836433 ?auto_836441 ) ) ( not ( = ?auto_836433 ?auto_836442 ) ) ( not ( = ?auto_836433 ?auto_836443 ) ) ( not ( = ?auto_836433 ?auto_836444 ) ) ( not ( = ?auto_836433 ?auto_836445 ) ) ( not ( = ?auto_836434 ?auto_836435 ) ) ( not ( = ?auto_836434 ?auto_836436 ) ) ( not ( = ?auto_836434 ?auto_836437 ) ) ( not ( = ?auto_836434 ?auto_836438 ) ) ( not ( = ?auto_836434 ?auto_836439 ) ) ( not ( = ?auto_836434 ?auto_836440 ) ) ( not ( = ?auto_836434 ?auto_836441 ) ) ( not ( = ?auto_836434 ?auto_836442 ) ) ( not ( = ?auto_836434 ?auto_836443 ) ) ( not ( = ?auto_836434 ?auto_836444 ) ) ( not ( = ?auto_836434 ?auto_836445 ) ) ( not ( = ?auto_836435 ?auto_836436 ) ) ( not ( = ?auto_836435 ?auto_836437 ) ) ( not ( = ?auto_836435 ?auto_836438 ) ) ( not ( = ?auto_836435 ?auto_836439 ) ) ( not ( = ?auto_836435 ?auto_836440 ) ) ( not ( = ?auto_836435 ?auto_836441 ) ) ( not ( = ?auto_836435 ?auto_836442 ) ) ( not ( = ?auto_836435 ?auto_836443 ) ) ( not ( = ?auto_836435 ?auto_836444 ) ) ( not ( = ?auto_836435 ?auto_836445 ) ) ( not ( = ?auto_836436 ?auto_836437 ) ) ( not ( = ?auto_836436 ?auto_836438 ) ) ( not ( = ?auto_836436 ?auto_836439 ) ) ( not ( = ?auto_836436 ?auto_836440 ) ) ( not ( = ?auto_836436 ?auto_836441 ) ) ( not ( = ?auto_836436 ?auto_836442 ) ) ( not ( = ?auto_836436 ?auto_836443 ) ) ( not ( = ?auto_836436 ?auto_836444 ) ) ( not ( = ?auto_836436 ?auto_836445 ) ) ( not ( = ?auto_836437 ?auto_836438 ) ) ( not ( = ?auto_836437 ?auto_836439 ) ) ( not ( = ?auto_836437 ?auto_836440 ) ) ( not ( = ?auto_836437 ?auto_836441 ) ) ( not ( = ?auto_836437 ?auto_836442 ) ) ( not ( = ?auto_836437 ?auto_836443 ) ) ( not ( = ?auto_836437 ?auto_836444 ) ) ( not ( = ?auto_836437 ?auto_836445 ) ) ( not ( = ?auto_836438 ?auto_836439 ) ) ( not ( = ?auto_836438 ?auto_836440 ) ) ( not ( = ?auto_836438 ?auto_836441 ) ) ( not ( = ?auto_836438 ?auto_836442 ) ) ( not ( = ?auto_836438 ?auto_836443 ) ) ( not ( = ?auto_836438 ?auto_836444 ) ) ( not ( = ?auto_836438 ?auto_836445 ) ) ( not ( = ?auto_836439 ?auto_836440 ) ) ( not ( = ?auto_836439 ?auto_836441 ) ) ( not ( = ?auto_836439 ?auto_836442 ) ) ( not ( = ?auto_836439 ?auto_836443 ) ) ( not ( = ?auto_836439 ?auto_836444 ) ) ( not ( = ?auto_836439 ?auto_836445 ) ) ( not ( = ?auto_836440 ?auto_836441 ) ) ( not ( = ?auto_836440 ?auto_836442 ) ) ( not ( = ?auto_836440 ?auto_836443 ) ) ( not ( = ?auto_836440 ?auto_836444 ) ) ( not ( = ?auto_836440 ?auto_836445 ) ) ( not ( = ?auto_836441 ?auto_836442 ) ) ( not ( = ?auto_836441 ?auto_836443 ) ) ( not ( = ?auto_836441 ?auto_836444 ) ) ( not ( = ?auto_836441 ?auto_836445 ) ) ( not ( = ?auto_836442 ?auto_836443 ) ) ( not ( = ?auto_836442 ?auto_836444 ) ) ( not ( = ?auto_836442 ?auto_836445 ) ) ( not ( = ?auto_836443 ?auto_836444 ) ) ( not ( = ?auto_836443 ?auto_836445 ) ) ( not ( = ?auto_836444 ?auto_836445 ) ) ( ON ?auto_836428 ?auto_836446 ) ( not ( = ?auto_836445 ?auto_836446 ) ) ( not ( = ?auto_836444 ?auto_836446 ) ) ( not ( = ?auto_836443 ?auto_836446 ) ) ( not ( = ?auto_836442 ?auto_836446 ) ) ( not ( = ?auto_836441 ?auto_836446 ) ) ( not ( = ?auto_836440 ?auto_836446 ) ) ( not ( = ?auto_836439 ?auto_836446 ) ) ( not ( = ?auto_836438 ?auto_836446 ) ) ( not ( = ?auto_836437 ?auto_836446 ) ) ( not ( = ?auto_836436 ?auto_836446 ) ) ( not ( = ?auto_836435 ?auto_836446 ) ) ( not ( = ?auto_836434 ?auto_836446 ) ) ( not ( = ?auto_836433 ?auto_836446 ) ) ( not ( = ?auto_836432 ?auto_836446 ) ) ( not ( = ?auto_836431 ?auto_836446 ) ) ( not ( = ?auto_836430 ?auto_836446 ) ) ( not ( = ?auto_836429 ?auto_836446 ) ) ( not ( = ?auto_836428 ?auto_836446 ) ) ( ON ?auto_836429 ?auto_836428 ) ( ON ?auto_836430 ?auto_836429 ) ( ON ?auto_836431 ?auto_836430 ) ( ON ?auto_836432 ?auto_836431 ) ( ON ?auto_836433 ?auto_836432 ) ( ON ?auto_836434 ?auto_836433 ) ( ON ?auto_836435 ?auto_836434 ) ( ON ?auto_836436 ?auto_836435 ) ( ON ?auto_836437 ?auto_836436 ) ( ON ?auto_836438 ?auto_836437 ) ( ON ?auto_836439 ?auto_836438 ) ( ON ?auto_836440 ?auto_836439 ) ( ON ?auto_836441 ?auto_836440 ) ( ON ?auto_836442 ?auto_836441 ) ( ON ?auto_836443 ?auto_836442 ) ( ON ?auto_836444 ?auto_836443 ) ( ON ?auto_836445 ?auto_836444 ) ( CLEAR ?auto_836445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-18PILE ?auto_836445 ?auto_836444 ?auto_836443 ?auto_836442 ?auto_836441 ?auto_836440 ?auto_836439 ?auto_836438 ?auto_836437 ?auto_836436 ?auto_836435 ?auto_836434 ?auto_836433 ?auto_836432 ?auto_836431 ?auto_836430 ?auto_836429 ?auto_836428 )
      ( MAKE-18PILE ?auto_836428 ?auto_836429 ?auto_836430 ?auto_836431 ?auto_836432 ?auto_836433 ?auto_836434 ?auto_836435 ?auto_836436 ?auto_836437 ?auto_836438 ?auto_836439 ?auto_836440 ?auto_836441 ?auto_836442 ?auto_836443 ?auto_836444 ?auto_836445 ) )
  )

)

