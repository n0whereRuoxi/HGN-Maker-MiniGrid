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
      ?auto_797 - BLOCK
    )
    :vars
    (
      ?auto_798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_797 ?auto_798 ) ( CLEAR ?auto_797 ) ( HAND-EMPTY ) ( not ( = ?auto_797 ?auto_798 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_797 ?auto_798 )
      ( !PUTDOWN ?auto_797 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_800 - BLOCK
    )
    :vars
    (
      ?auto_801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_800 ?auto_801 ) ( CLEAR ?auto_800 ) ( HAND-EMPTY ) ( not ( = ?auto_800 ?auto_801 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_800 ?auto_801 )
      ( !PUTDOWN ?auto_800 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_804 - BLOCK
      ?auto_805 - BLOCK
    )
    :vars
    (
      ?auto_806 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_804 ) ( ON ?auto_805 ?auto_806 ) ( CLEAR ?auto_805 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_804 ) ( not ( = ?auto_804 ?auto_805 ) ) ( not ( = ?auto_804 ?auto_806 ) ) ( not ( = ?auto_805 ?auto_806 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_805 ?auto_806 )
      ( !STACK ?auto_805 ?auto_804 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_809 - BLOCK
      ?auto_810 - BLOCK
    )
    :vars
    (
      ?auto_811 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_809 ) ( ON ?auto_810 ?auto_811 ) ( CLEAR ?auto_810 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_809 ) ( not ( = ?auto_809 ?auto_810 ) ) ( not ( = ?auto_809 ?auto_811 ) ) ( not ( = ?auto_810 ?auto_811 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_810 ?auto_811 )
      ( !STACK ?auto_810 ?auto_809 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_814 - BLOCK
      ?auto_815 - BLOCK
    )
    :vars
    (
      ?auto_816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_815 ?auto_816 ) ( not ( = ?auto_814 ?auto_815 ) ) ( not ( = ?auto_814 ?auto_816 ) ) ( not ( = ?auto_815 ?auto_816 ) ) ( ON ?auto_814 ?auto_815 ) ( CLEAR ?auto_814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_814 )
      ( MAKE-2PILE ?auto_814 ?auto_815 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_819 - BLOCK
      ?auto_820 - BLOCK
    )
    :vars
    (
      ?auto_821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_820 ?auto_821 ) ( not ( = ?auto_819 ?auto_820 ) ) ( not ( = ?auto_819 ?auto_821 ) ) ( not ( = ?auto_820 ?auto_821 ) ) ( ON ?auto_819 ?auto_820 ) ( CLEAR ?auto_819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_819 )
      ( MAKE-2PILE ?auto_819 ?auto_820 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_825 - BLOCK
      ?auto_826 - BLOCK
      ?auto_827 - BLOCK
    )
    :vars
    (
      ?auto_828 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_826 ) ( ON ?auto_827 ?auto_828 ) ( CLEAR ?auto_827 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_825 ) ( ON ?auto_826 ?auto_825 ) ( not ( = ?auto_825 ?auto_826 ) ) ( not ( = ?auto_825 ?auto_827 ) ) ( not ( = ?auto_825 ?auto_828 ) ) ( not ( = ?auto_826 ?auto_827 ) ) ( not ( = ?auto_826 ?auto_828 ) ) ( not ( = ?auto_827 ?auto_828 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_827 ?auto_828 )
      ( !STACK ?auto_827 ?auto_826 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_832 - BLOCK
      ?auto_833 - BLOCK
      ?auto_834 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_833 ) ( ON-TABLE ?auto_834 ) ( CLEAR ?auto_834 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_832 ) ( ON ?auto_833 ?auto_832 ) ( not ( = ?auto_832 ?auto_833 ) ) ( not ( = ?auto_832 ?auto_834 ) ) ( not ( = ?auto_833 ?auto_834 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_834 )
      ( !STACK ?auto_834 ?auto_833 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_838 - BLOCK
      ?auto_839 - BLOCK
      ?auto_840 - BLOCK
    )
    :vars
    (
      ?auto_841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_840 ?auto_841 ) ( ON-TABLE ?auto_838 ) ( not ( = ?auto_838 ?auto_839 ) ) ( not ( = ?auto_838 ?auto_840 ) ) ( not ( = ?auto_838 ?auto_841 ) ) ( not ( = ?auto_839 ?auto_840 ) ) ( not ( = ?auto_839 ?auto_841 ) ) ( not ( = ?auto_840 ?auto_841 ) ) ( CLEAR ?auto_838 ) ( ON ?auto_839 ?auto_840 ) ( CLEAR ?auto_839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_838 ?auto_839 )
      ( MAKE-3PILE ?auto_838 ?auto_839 ?auto_840 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_845 - BLOCK
      ?auto_846 - BLOCK
      ?auto_847 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_847 ) ( ON-TABLE ?auto_845 ) ( not ( = ?auto_845 ?auto_846 ) ) ( not ( = ?auto_845 ?auto_847 ) ) ( not ( = ?auto_846 ?auto_847 ) ) ( CLEAR ?auto_845 ) ( ON ?auto_846 ?auto_847 ) ( CLEAR ?auto_846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_845 ?auto_846 )
      ( MAKE-3PILE ?auto_845 ?auto_846 ?auto_847 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_851 - BLOCK
      ?auto_852 - BLOCK
      ?auto_853 - BLOCK
    )
    :vars
    (
      ?auto_854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_853 ?auto_854 ) ( not ( = ?auto_851 ?auto_852 ) ) ( not ( = ?auto_851 ?auto_853 ) ) ( not ( = ?auto_851 ?auto_854 ) ) ( not ( = ?auto_852 ?auto_853 ) ) ( not ( = ?auto_852 ?auto_854 ) ) ( not ( = ?auto_853 ?auto_854 ) ) ( ON ?auto_852 ?auto_853 ) ( ON ?auto_851 ?auto_852 ) ( CLEAR ?auto_851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_851 )
      ( MAKE-3PILE ?auto_851 ?auto_852 ?auto_853 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_858 - BLOCK
      ?auto_859 - BLOCK
      ?auto_860 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_860 ) ( not ( = ?auto_858 ?auto_859 ) ) ( not ( = ?auto_858 ?auto_860 ) ) ( not ( = ?auto_859 ?auto_860 ) ) ( ON ?auto_859 ?auto_860 ) ( ON ?auto_858 ?auto_859 ) ( CLEAR ?auto_858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_858 )
      ( MAKE-3PILE ?auto_858 ?auto_859 ?auto_860 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_864 - BLOCK
      ?auto_865 - BLOCK
      ?auto_866 - BLOCK
    )
    :vars
    (
      ?auto_867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_864 ?auto_865 ) ) ( not ( = ?auto_864 ?auto_866 ) ) ( not ( = ?auto_865 ?auto_866 ) ) ( ON ?auto_864 ?auto_867 ) ( not ( = ?auto_866 ?auto_867 ) ) ( not ( = ?auto_865 ?auto_867 ) ) ( not ( = ?auto_864 ?auto_867 ) ) ( ON ?auto_865 ?auto_864 ) ( ON ?auto_866 ?auto_865 ) ( CLEAR ?auto_866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_866 ?auto_865 ?auto_864 )
      ( MAKE-3PILE ?auto_864 ?auto_865 ?auto_866 ) )
  )

)

