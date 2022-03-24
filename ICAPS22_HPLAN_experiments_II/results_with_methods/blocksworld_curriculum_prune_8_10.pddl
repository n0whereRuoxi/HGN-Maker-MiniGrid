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
      ?auto_39751 - BLOCK
    )
    :vars
    (
      ?auto_39752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39751 ?auto_39752 ) ( CLEAR ?auto_39751 ) ( HAND-EMPTY ) ( not ( = ?auto_39751 ?auto_39752 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39751 ?auto_39752 )
      ( !PUTDOWN ?auto_39751 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39758 - BLOCK
      ?auto_39759 - BLOCK
    )
    :vars
    (
      ?auto_39760 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_39758 ) ( ON ?auto_39759 ?auto_39760 ) ( CLEAR ?auto_39759 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39758 ) ( not ( = ?auto_39758 ?auto_39759 ) ) ( not ( = ?auto_39758 ?auto_39760 ) ) ( not ( = ?auto_39759 ?auto_39760 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39759 ?auto_39760 )
      ( !STACK ?auto_39759 ?auto_39758 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39768 - BLOCK
      ?auto_39769 - BLOCK
    )
    :vars
    (
      ?auto_39770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39769 ?auto_39770 ) ( not ( = ?auto_39768 ?auto_39769 ) ) ( not ( = ?auto_39768 ?auto_39770 ) ) ( not ( = ?auto_39769 ?auto_39770 ) ) ( ON ?auto_39768 ?auto_39769 ) ( CLEAR ?auto_39768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39768 )
      ( MAKE-2PILE ?auto_39768 ?auto_39769 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39779 - BLOCK
      ?auto_39780 - BLOCK
      ?auto_39781 - BLOCK
    )
    :vars
    (
      ?auto_39782 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_39780 ) ( ON ?auto_39781 ?auto_39782 ) ( CLEAR ?auto_39781 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39779 ) ( ON ?auto_39780 ?auto_39779 ) ( not ( = ?auto_39779 ?auto_39780 ) ) ( not ( = ?auto_39779 ?auto_39781 ) ) ( not ( = ?auto_39779 ?auto_39782 ) ) ( not ( = ?auto_39780 ?auto_39781 ) ) ( not ( = ?auto_39780 ?auto_39782 ) ) ( not ( = ?auto_39781 ?auto_39782 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39781 ?auto_39782 )
      ( !STACK ?auto_39781 ?auto_39780 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39793 - BLOCK
      ?auto_39794 - BLOCK
      ?auto_39795 - BLOCK
    )
    :vars
    (
      ?auto_39796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39795 ?auto_39796 ) ( ON-TABLE ?auto_39793 ) ( not ( = ?auto_39793 ?auto_39794 ) ) ( not ( = ?auto_39793 ?auto_39795 ) ) ( not ( = ?auto_39793 ?auto_39796 ) ) ( not ( = ?auto_39794 ?auto_39795 ) ) ( not ( = ?auto_39794 ?auto_39796 ) ) ( not ( = ?auto_39795 ?auto_39796 ) ) ( CLEAR ?auto_39793 ) ( ON ?auto_39794 ?auto_39795 ) ( CLEAR ?auto_39794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39793 ?auto_39794 )
      ( MAKE-3PILE ?auto_39793 ?auto_39794 ?auto_39795 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39807 - BLOCK
      ?auto_39808 - BLOCK
      ?auto_39809 - BLOCK
    )
    :vars
    (
      ?auto_39810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39809 ?auto_39810 ) ( not ( = ?auto_39807 ?auto_39808 ) ) ( not ( = ?auto_39807 ?auto_39809 ) ) ( not ( = ?auto_39807 ?auto_39810 ) ) ( not ( = ?auto_39808 ?auto_39809 ) ) ( not ( = ?auto_39808 ?auto_39810 ) ) ( not ( = ?auto_39809 ?auto_39810 ) ) ( ON ?auto_39808 ?auto_39809 ) ( ON ?auto_39807 ?auto_39808 ) ( CLEAR ?auto_39807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39807 )
      ( MAKE-3PILE ?auto_39807 ?auto_39808 ?auto_39809 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39822 - BLOCK
      ?auto_39823 - BLOCK
      ?auto_39824 - BLOCK
      ?auto_39825 - BLOCK
    )
    :vars
    (
      ?auto_39826 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_39824 ) ( ON ?auto_39825 ?auto_39826 ) ( CLEAR ?auto_39825 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39822 ) ( ON ?auto_39823 ?auto_39822 ) ( ON ?auto_39824 ?auto_39823 ) ( not ( = ?auto_39822 ?auto_39823 ) ) ( not ( = ?auto_39822 ?auto_39824 ) ) ( not ( = ?auto_39822 ?auto_39825 ) ) ( not ( = ?auto_39822 ?auto_39826 ) ) ( not ( = ?auto_39823 ?auto_39824 ) ) ( not ( = ?auto_39823 ?auto_39825 ) ) ( not ( = ?auto_39823 ?auto_39826 ) ) ( not ( = ?auto_39824 ?auto_39825 ) ) ( not ( = ?auto_39824 ?auto_39826 ) ) ( not ( = ?auto_39825 ?auto_39826 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39825 ?auto_39826 )
      ( !STACK ?auto_39825 ?auto_39824 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39840 - BLOCK
      ?auto_39841 - BLOCK
      ?auto_39842 - BLOCK
      ?auto_39843 - BLOCK
    )
    :vars
    (
      ?auto_39844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39843 ?auto_39844 ) ( ON-TABLE ?auto_39840 ) ( ON ?auto_39841 ?auto_39840 ) ( not ( = ?auto_39840 ?auto_39841 ) ) ( not ( = ?auto_39840 ?auto_39842 ) ) ( not ( = ?auto_39840 ?auto_39843 ) ) ( not ( = ?auto_39840 ?auto_39844 ) ) ( not ( = ?auto_39841 ?auto_39842 ) ) ( not ( = ?auto_39841 ?auto_39843 ) ) ( not ( = ?auto_39841 ?auto_39844 ) ) ( not ( = ?auto_39842 ?auto_39843 ) ) ( not ( = ?auto_39842 ?auto_39844 ) ) ( not ( = ?auto_39843 ?auto_39844 ) ) ( CLEAR ?auto_39841 ) ( ON ?auto_39842 ?auto_39843 ) ( CLEAR ?auto_39842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39840 ?auto_39841 ?auto_39842 )
      ( MAKE-4PILE ?auto_39840 ?auto_39841 ?auto_39842 ?auto_39843 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39858 - BLOCK
      ?auto_39859 - BLOCK
      ?auto_39860 - BLOCK
      ?auto_39861 - BLOCK
    )
    :vars
    (
      ?auto_39862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39861 ?auto_39862 ) ( ON-TABLE ?auto_39858 ) ( not ( = ?auto_39858 ?auto_39859 ) ) ( not ( = ?auto_39858 ?auto_39860 ) ) ( not ( = ?auto_39858 ?auto_39861 ) ) ( not ( = ?auto_39858 ?auto_39862 ) ) ( not ( = ?auto_39859 ?auto_39860 ) ) ( not ( = ?auto_39859 ?auto_39861 ) ) ( not ( = ?auto_39859 ?auto_39862 ) ) ( not ( = ?auto_39860 ?auto_39861 ) ) ( not ( = ?auto_39860 ?auto_39862 ) ) ( not ( = ?auto_39861 ?auto_39862 ) ) ( ON ?auto_39860 ?auto_39861 ) ( CLEAR ?auto_39858 ) ( ON ?auto_39859 ?auto_39860 ) ( CLEAR ?auto_39859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39858 ?auto_39859 )
      ( MAKE-4PILE ?auto_39858 ?auto_39859 ?auto_39860 ?auto_39861 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39876 - BLOCK
      ?auto_39877 - BLOCK
      ?auto_39878 - BLOCK
      ?auto_39879 - BLOCK
    )
    :vars
    (
      ?auto_39880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39879 ?auto_39880 ) ( not ( = ?auto_39876 ?auto_39877 ) ) ( not ( = ?auto_39876 ?auto_39878 ) ) ( not ( = ?auto_39876 ?auto_39879 ) ) ( not ( = ?auto_39876 ?auto_39880 ) ) ( not ( = ?auto_39877 ?auto_39878 ) ) ( not ( = ?auto_39877 ?auto_39879 ) ) ( not ( = ?auto_39877 ?auto_39880 ) ) ( not ( = ?auto_39878 ?auto_39879 ) ) ( not ( = ?auto_39878 ?auto_39880 ) ) ( not ( = ?auto_39879 ?auto_39880 ) ) ( ON ?auto_39878 ?auto_39879 ) ( ON ?auto_39877 ?auto_39878 ) ( ON ?auto_39876 ?auto_39877 ) ( CLEAR ?auto_39876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39876 )
      ( MAKE-4PILE ?auto_39876 ?auto_39877 ?auto_39878 ?auto_39879 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39895 - BLOCK
      ?auto_39896 - BLOCK
      ?auto_39897 - BLOCK
      ?auto_39898 - BLOCK
      ?auto_39899 - BLOCK
    )
    :vars
    (
      ?auto_39900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_39898 ) ( ON ?auto_39899 ?auto_39900 ) ( CLEAR ?auto_39899 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39895 ) ( ON ?auto_39896 ?auto_39895 ) ( ON ?auto_39897 ?auto_39896 ) ( ON ?auto_39898 ?auto_39897 ) ( not ( = ?auto_39895 ?auto_39896 ) ) ( not ( = ?auto_39895 ?auto_39897 ) ) ( not ( = ?auto_39895 ?auto_39898 ) ) ( not ( = ?auto_39895 ?auto_39899 ) ) ( not ( = ?auto_39895 ?auto_39900 ) ) ( not ( = ?auto_39896 ?auto_39897 ) ) ( not ( = ?auto_39896 ?auto_39898 ) ) ( not ( = ?auto_39896 ?auto_39899 ) ) ( not ( = ?auto_39896 ?auto_39900 ) ) ( not ( = ?auto_39897 ?auto_39898 ) ) ( not ( = ?auto_39897 ?auto_39899 ) ) ( not ( = ?auto_39897 ?auto_39900 ) ) ( not ( = ?auto_39898 ?auto_39899 ) ) ( not ( = ?auto_39898 ?auto_39900 ) ) ( not ( = ?auto_39899 ?auto_39900 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39899 ?auto_39900 )
      ( !STACK ?auto_39899 ?auto_39898 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39917 - BLOCK
      ?auto_39918 - BLOCK
      ?auto_39919 - BLOCK
      ?auto_39920 - BLOCK
      ?auto_39921 - BLOCK
    )
    :vars
    (
      ?auto_39922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39921 ?auto_39922 ) ( ON-TABLE ?auto_39917 ) ( ON ?auto_39918 ?auto_39917 ) ( ON ?auto_39919 ?auto_39918 ) ( not ( = ?auto_39917 ?auto_39918 ) ) ( not ( = ?auto_39917 ?auto_39919 ) ) ( not ( = ?auto_39917 ?auto_39920 ) ) ( not ( = ?auto_39917 ?auto_39921 ) ) ( not ( = ?auto_39917 ?auto_39922 ) ) ( not ( = ?auto_39918 ?auto_39919 ) ) ( not ( = ?auto_39918 ?auto_39920 ) ) ( not ( = ?auto_39918 ?auto_39921 ) ) ( not ( = ?auto_39918 ?auto_39922 ) ) ( not ( = ?auto_39919 ?auto_39920 ) ) ( not ( = ?auto_39919 ?auto_39921 ) ) ( not ( = ?auto_39919 ?auto_39922 ) ) ( not ( = ?auto_39920 ?auto_39921 ) ) ( not ( = ?auto_39920 ?auto_39922 ) ) ( not ( = ?auto_39921 ?auto_39922 ) ) ( CLEAR ?auto_39919 ) ( ON ?auto_39920 ?auto_39921 ) ( CLEAR ?auto_39920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39917 ?auto_39918 ?auto_39919 ?auto_39920 )
      ( MAKE-5PILE ?auto_39917 ?auto_39918 ?auto_39919 ?auto_39920 ?auto_39921 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39939 - BLOCK
      ?auto_39940 - BLOCK
      ?auto_39941 - BLOCK
      ?auto_39942 - BLOCK
      ?auto_39943 - BLOCK
    )
    :vars
    (
      ?auto_39944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39943 ?auto_39944 ) ( ON-TABLE ?auto_39939 ) ( ON ?auto_39940 ?auto_39939 ) ( not ( = ?auto_39939 ?auto_39940 ) ) ( not ( = ?auto_39939 ?auto_39941 ) ) ( not ( = ?auto_39939 ?auto_39942 ) ) ( not ( = ?auto_39939 ?auto_39943 ) ) ( not ( = ?auto_39939 ?auto_39944 ) ) ( not ( = ?auto_39940 ?auto_39941 ) ) ( not ( = ?auto_39940 ?auto_39942 ) ) ( not ( = ?auto_39940 ?auto_39943 ) ) ( not ( = ?auto_39940 ?auto_39944 ) ) ( not ( = ?auto_39941 ?auto_39942 ) ) ( not ( = ?auto_39941 ?auto_39943 ) ) ( not ( = ?auto_39941 ?auto_39944 ) ) ( not ( = ?auto_39942 ?auto_39943 ) ) ( not ( = ?auto_39942 ?auto_39944 ) ) ( not ( = ?auto_39943 ?auto_39944 ) ) ( ON ?auto_39942 ?auto_39943 ) ( CLEAR ?auto_39940 ) ( ON ?auto_39941 ?auto_39942 ) ( CLEAR ?auto_39941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39939 ?auto_39940 ?auto_39941 )
      ( MAKE-5PILE ?auto_39939 ?auto_39940 ?auto_39941 ?auto_39942 ?auto_39943 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39961 - BLOCK
      ?auto_39962 - BLOCK
      ?auto_39963 - BLOCK
      ?auto_39964 - BLOCK
      ?auto_39965 - BLOCK
    )
    :vars
    (
      ?auto_39966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39965 ?auto_39966 ) ( ON-TABLE ?auto_39961 ) ( not ( = ?auto_39961 ?auto_39962 ) ) ( not ( = ?auto_39961 ?auto_39963 ) ) ( not ( = ?auto_39961 ?auto_39964 ) ) ( not ( = ?auto_39961 ?auto_39965 ) ) ( not ( = ?auto_39961 ?auto_39966 ) ) ( not ( = ?auto_39962 ?auto_39963 ) ) ( not ( = ?auto_39962 ?auto_39964 ) ) ( not ( = ?auto_39962 ?auto_39965 ) ) ( not ( = ?auto_39962 ?auto_39966 ) ) ( not ( = ?auto_39963 ?auto_39964 ) ) ( not ( = ?auto_39963 ?auto_39965 ) ) ( not ( = ?auto_39963 ?auto_39966 ) ) ( not ( = ?auto_39964 ?auto_39965 ) ) ( not ( = ?auto_39964 ?auto_39966 ) ) ( not ( = ?auto_39965 ?auto_39966 ) ) ( ON ?auto_39964 ?auto_39965 ) ( ON ?auto_39963 ?auto_39964 ) ( CLEAR ?auto_39961 ) ( ON ?auto_39962 ?auto_39963 ) ( CLEAR ?auto_39962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39961 ?auto_39962 )
      ( MAKE-5PILE ?auto_39961 ?auto_39962 ?auto_39963 ?auto_39964 ?auto_39965 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39983 - BLOCK
      ?auto_39984 - BLOCK
      ?auto_39985 - BLOCK
      ?auto_39986 - BLOCK
      ?auto_39987 - BLOCK
    )
    :vars
    (
      ?auto_39988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39987 ?auto_39988 ) ( not ( = ?auto_39983 ?auto_39984 ) ) ( not ( = ?auto_39983 ?auto_39985 ) ) ( not ( = ?auto_39983 ?auto_39986 ) ) ( not ( = ?auto_39983 ?auto_39987 ) ) ( not ( = ?auto_39983 ?auto_39988 ) ) ( not ( = ?auto_39984 ?auto_39985 ) ) ( not ( = ?auto_39984 ?auto_39986 ) ) ( not ( = ?auto_39984 ?auto_39987 ) ) ( not ( = ?auto_39984 ?auto_39988 ) ) ( not ( = ?auto_39985 ?auto_39986 ) ) ( not ( = ?auto_39985 ?auto_39987 ) ) ( not ( = ?auto_39985 ?auto_39988 ) ) ( not ( = ?auto_39986 ?auto_39987 ) ) ( not ( = ?auto_39986 ?auto_39988 ) ) ( not ( = ?auto_39987 ?auto_39988 ) ) ( ON ?auto_39986 ?auto_39987 ) ( ON ?auto_39985 ?auto_39986 ) ( ON ?auto_39984 ?auto_39985 ) ( ON ?auto_39983 ?auto_39984 ) ( CLEAR ?auto_39983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39983 )
      ( MAKE-5PILE ?auto_39983 ?auto_39984 ?auto_39985 ?auto_39986 ?auto_39987 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40006 - BLOCK
      ?auto_40007 - BLOCK
      ?auto_40008 - BLOCK
      ?auto_40009 - BLOCK
      ?auto_40010 - BLOCK
      ?auto_40011 - BLOCK
    )
    :vars
    (
      ?auto_40012 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_40010 ) ( ON ?auto_40011 ?auto_40012 ) ( CLEAR ?auto_40011 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40006 ) ( ON ?auto_40007 ?auto_40006 ) ( ON ?auto_40008 ?auto_40007 ) ( ON ?auto_40009 ?auto_40008 ) ( ON ?auto_40010 ?auto_40009 ) ( not ( = ?auto_40006 ?auto_40007 ) ) ( not ( = ?auto_40006 ?auto_40008 ) ) ( not ( = ?auto_40006 ?auto_40009 ) ) ( not ( = ?auto_40006 ?auto_40010 ) ) ( not ( = ?auto_40006 ?auto_40011 ) ) ( not ( = ?auto_40006 ?auto_40012 ) ) ( not ( = ?auto_40007 ?auto_40008 ) ) ( not ( = ?auto_40007 ?auto_40009 ) ) ( not ( = ?auto_40007 ?auto_40010 ) ) ( not ( = ?auto_40007 ?auto_40011 ) ) ( not ( = ?auto_40007 ?auto_40012 ) ) ( not ( = ?auto_40008 ?auto_40009 ) ) ( not ( = ?auto_40008 ?auto_40010 ) ) ( not ( = ?auto_40008 ?auto_40011 ) ) ( not ( = ?auto_40008 ?auto_40012 ) ) ( not ( = ?auto_40009 ?auto_40010 ) ) ( not ( = ?auto_40009 ?auto_40011 ) ) ( not ( = ?auto_40009 ?auto_40012 ) ) ( not ( = ?auto_40010 ?auto_40011 ) ) ( not ( = ?auto_40010 ?auto_40012 ) ) ( not ( = ?auto_40011 ?auto_40012 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40011 ?auto_40012 )
      ( !STACK ?auto_40011 ?auto_40010 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40032 - BLOCK
      ?auto_40033 - BLOCK
      ?auto_40034 - BLOCK
      ?auto_40035 - BLOCK
      ?auto_40036 - BLOCK
      ?auto_40037 - BLOCK
    )
    :vars
    (
      ?auto_40038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40037 ?auto_40038 ) ( ON-TABLE ?auto_40032 ) ( ON ?auto_40033 ?auto_40032 ) ( ON ?auto_40034 ?auto_40033 ) ( ON ?auto_40035 ?auto_40034 ) ( not ( = ?auto_40032 ?auto_40033 ) ) ( not ( = ?auto_40032 ?auto_40034 ) ) ( not ( = ?auto_40032 ?auto_40035 ) ) ( not ( = ?auto_40032 ?auto_40036 ) ) ( not ( = ?auto_40032 ?auto_40037 ) ) ( not ( = ?auto_40032 ?auto_40038 ) ) ( not ( = ?auto_40033 ?auto_40034 ) ) ( not ( = ?auto_40033 ?auto_40035 ) ) ( not ( = ?auto_40033 ?auto_40036 ) ) ( not ( = ?auto_40033 ?auto_40037 ) ) ( not ( = ?auto_40033 ?auto_40038 ) ) ( not ( = ?auto_40034 ?auto_40035 ) ) ( not ( = ?auto_40034 ?auto_40036 ) ) ( not ( = ?auto_40034 ?auto_40037 ) ) ( not ( = ?auto_40034 ?auto_40038 ) ) ( not ( = ?auto_40035 ?auto_40036 ) ) ( not ( = ?auto_40035 ?auto_40037 ) ) ( not ( = ?auto_40035 ?auto_40038 ) ) ( not ( = ?auto_40036 ?auto_40037 ) ) ( not ( = ?auto_40036 ?auto_40038 ) ) ( not ( = ?auto_40037 ?auto_40038 ) ) ( CLEAR ?auto_40035 ) ( ON ?auto_40036 ?auto_40037 ) ( CLEAR ?auto_40036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40032 ?auto_40033 ?auto_40034 ?auto_40035 ?auto_40036 )
      ( MAKE-6PILE ?auto_40032 ?auto_40033 ?auto_40034 ?auto_40035 ?auto_40036 ?auto_40037 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40058 - BLOCK
      ?auto_40059 - BLOCK
      ?auto_40060 - BLOCK
      ?auto_40061 - BLOCK
      ?auto_40062 - BLOCK
      ?auto_40063 - BLOCK
    )
    :vars
    (
      ?auto_40064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40063 ?auto_40064 ) ( ON-TABLE ?auto_40058 ) ( ON ?auto_40059 ?auto_40058 ) ( ON ?auto_40060 ?auto_40059 ) ( not ( = ?auto_40058 ?auto_40059 ) ) ( not ( = ?auto_40058 ?auto_40060 ) ) ( not ( = ?auto_40058 ?auto_40061 ) ) ( not ( = ?auto_40058 ?auto_40062 ) ) ( not ( = ?auto_40058 ?auto_40063 ) ) ( not ( = ?auto_40058 ?auto_40064 ) ) ( not ( = ?auto_40059 ?auto_40060 ) ) ( not ( = ?auto_40059 ?auto_40061 ) ) ( not ( = ?auto_40059 ?auto_40062 ) ) ( not ( = ?auto_40059 ?auto_40063 ) ) ( not ( = ?auto_40059 ?auto_40064 ) ) ( not ( = ?auto_40060 ?auto_40061 ) ) ( not ( = ?auto_40060 ?auto_40062 ) ) ( not ( = ?auto_40060 ?auto_40063 ) ) ( not ( = ?auto_40060 ?auto_40064 ) ) ( not ( = ?auto_40061 ?auto_40062 ) ) ( not ( = ?auto_40061 ?auto_40063 ) ) ( not ( = ?auto_40061 ?auto_40064 ) ) ( not ( = ?auto_40062 ?auto_40063 ) ) ( not ( = ?auto_40062 ?auto_40064 ) ) ( not ( = ?auto_40063 ?auto_40064 ) ) ( ON ?auto_40062 ?auto_40063 ) ( CLEAR ?auto_40060 ) ( ON ?auto_40061 ?auto_40062 ) ( CLEAR ?auto_40061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40058 ?auto_40059 ?auto_40060 ?auto_40061 )
      ( MAKE-6PILE ?auto_40058 ?auto_40059 ?auto_40060 ?auto_40061 ?auto_40062 ?auto_40063 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40084 - BLOCK
      ?auto_40085 - BLOCK
      ?auto_40086 - BLOCK
      ?auto_40087 - BLOCK
      ?auto_40088 - BLOCK
      ?auto_40089 - BLOCK
    )
    :vars
    (
      ?auto_40090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40089 ?auto_40090 ) ( ON-TABLE ?auto_40084 ) ( ON ?auto_40085 ?auto_40084 ) ( not ( = ?auto_40084 ?auto_40085 ) ) ( not ( = ?auto_40084 ?auto_40086 ) ) ( not ( = ?auto_40084 ?auto_40087 ) ) ( not ( = ?auto_40084 ?auto_40088 ) ) ( not ( = ?auto_40084 ?auto_40089 ) ) ( not ( = ?auto_40084 ?auto_40090 ) ) ( not ( = ?auto_40085 ?auto_40086 ) ) ( not ( = ?auto_40085 ?auto_40087 ) ) ( not ( = ?auto_40085 ?auto_40088 ) ) ( not ( = ?auto_40085 ?auto_40089 ) ) ( not ( = ?auto_40085 ?auto_40090 ) ) ( not ( = ?auto_40086 ?auto_40087 ) ) ( not ( = ?auto_40086 ?auto_40088 ) ) ( not ( = ?auto_40086 ?auto_40089 ) ) ( not ( = ?auto_40086 ?auto_40090 ) ) ( not ( = ?auto_40087 ?auto_40088 ) ) ( not ( = ?auto_40087 ?auto_40089 ) ) ( not ( = ?auto_40087 ?auto_40090 ) ) ( not ( = ?auto_40088 ?auto_40089 ) ) ( not ( = ?auto_40088 ?auto_40090 ) ) ( not ( = ?auto_40089 ?auto_40090 ) ) ( ON ?auto_40088 ?auto_40089 ) ( ON ?auto_40087 ?auto_40088 ) ( CLEAR ?auto_40085 ) ( ON ?auto_40086 ?auto_40087 ) ( CLEAR ?auto_40086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40084 ?auto_40085 ?auto_40086 )
      ( MAKE-6PILE ?auto_40084 ?auto_40085 ?auto_40086 ?auto_40087 ?auto_40088 ?auto_40089 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40110 - BLOCK
      ?auto_40111 - BLOCK
      ?auto_40112 - BLOCK
      ?auto_40113 - BLOCK
      ?auto_40114 - BLOCK
      ?auto_40115 - BLOCK
    )
    :vars
    (
      ?auto_40116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40115 ?auto_40116 ) ( ON-TABLE ?auto_40110 ) ( not ( = ?auto_40110 ?auto_40111 ) ) ( not ( = ?auto_40110 ?auto_40112 ) ) ( not ( = ?auto_40110 ?auto_40113 ) ) ( not ( = ?auto_40110 ?auto_40114 ) ) ( not ( = ?auto_40110 ?auto_40115 ) ) ( not ( = ?auto_40110 ?auto_40116 ) ) ( not ( = ?auto_40111 ?auto_40112 ) ) ( not ( = ?auto_40111 ?auto_40113 ) ) ( not ( = ?auto_40111 ?auto_40114 ) ) ( not ( = ?auto_40111 ?auto_40115 ) ) ( not ( = ?auto_40111 ?auto_40116 ) ) ( not ( = ?auto_40112 ?auto_40113 ) ) ( not ( = ?auto_40112 ?auto_40114 ) ) ( not ( = ?auto_40112 ?auto_40115 ) ) ( not ( = ?auto_40112 ?auto_40116 ) ) ( not ( = ?auto_40113 ?auto_40114 ) ) ( not ( = ?auto_40113 ?auto_40115 ) ) ( not ( = ?auto_40113 ?auto_40116 ) ) ( not ( = ?auto_40114 ?auto_40115 ) ) ( not ( = ?auto_40114 ?auto_40116 ) ) ( not ( = ?auto_40115 ?auto_40116 ) ) ( ON ?auto_40114 ?auto_40115 ) ( ON ?auto_40113 ?auto_40114 ) ( ON ?auto_40112 ?auto_40113 ) ( CLEAR ?auto_40110 ) ( ON ?auto_40111 ?auto_40112 ) ( CLEAR ?auto_40111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40110 ?auto_40111 )
      ( MAKE-6PILE ?auto_40110 ?auto_40111 ?auto_40112 ?auto_40113 ?auto_40114 ?auto_40115 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40136 - BLOCK
      ?auto_40137 - BLOCK
      ?auto_40138 - BLOCK
      ?auto_40139 - BLOCK
      ?auto_40140 - BLOCK
      ?auto_40141 - BLOCK
    )
    :vars
    (
      ?auto_40142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40141 ?auto_40142 ) ( not ( = ?auto_40136 ?auto_40137 ) ) ( not ( = ?auto_40136 ?auto_40138 ) ) ( not ( = ?auto_40136 ?auto_40139 ) ) ( not ( = ?auto_40136 ?auto_40140 ) ) ( not ( = ?auto_40136 ?auto_40141 ) ) ( not ( = ?auto_40136 ?auto_40142 ) ) ( not ( = ?auto_40137 ?auto_40138 ) ) ( not ( = ?auto_40137 ?auto_40139 ) ) ( not ( = ?auto_40137 ?auto_40140 ) ) ( not ( = ?auto_40137 ?auto_40141 ) ) ( not ( = ?auto_40137 ?auto_40142 ) ) ( not ( = ?auto_40138 ?auto_40139 ) ) ( not ( = ?auto_40138 ?auto_40140 ) ) ( not ( = ?auto_40138 ?auto_40141 ) ) ( not ( = ?auto_40138 ?auto_40142 ) ) ( not ( = ?auto_40139 ?auto_40140 ) ) ( not ( = ?auto_40139 ?auto_40141 ) ) ( not ( = ?auto_40139 ?auto_40142 ) ) ( not ( = ?auto_40140 ?auto_40141 ) ) ( not ( = ?auto_40140 ?auto_40142 ) ) ( not ( = ?auto_40141 ?auto_40142 ) ) ( ON ?auto_40140 ?auto_40141 ) ( ON ?auto_40139 ?auto_40140 ) ( ON ?auto_40138 ?auto_40139 ) ( ON ?auto_40137 ?auto_40138 ) ( ON ?auto_40136 ?auto_40137 ) ( CLEAR ?auto_40136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40136 )
      ( MAKE-6PILE ?auto_40136 ?auto_40137 ?auto_40138 ?auto_40139 ?auto_40140 ?auto_40141 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_40163 - BLOCK
      ?auto_40164 - BLOCK
      ?auto_40165 - BLOCK
      ?auto_40166 - BLOCK
      ?auto_40167 - BLOCK
      ?auto_40168 - BLOCK
      ?auto_40169 - BLOCK
    )
    :vars
    (
      ?auto_40170 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_40168 ) ( ON ?auto_40169 ?auto_40170 ) ( CLEAR ?auto_40169 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40163 ) ( ON ?auto_40164 ?auto_40163 ) ( ON ?auto_40165 ?auto_40164 ) ( ON ?auto_40166 ?auto_40165 ) ( ON ?auto_40167 ?auto_40166 ) ( ON ?auto_40168 ?auto_40167 ) ( not ( = ?auto_40163 ?auto_40164 ) ) ( not ( = ?auto_40163 ?auto_40165 ) ) ( not ( = ?auto_40163 ?auto_40166 ) ) ( not ( = ?auto_40163 ?auto_40167 ) ) ( not ( = ?auto_40163 ?auto_40168 ) ) ( not ( = ?auto_40163 ?auto_40169 ) ) ( not ( = ?auto_40163 ?auto_40170 ) ) ( not ( = ?auto_40164 ?auto_40165 ) ) ( not ( = ?auto_40164 ?auto_40166 ) ) ( not ( = ?auto_40164 ?auto_40167 ) ) ( not ( = ?auto_40164 ?auto_40168 ) ) ( not ( = ?auto_40164 ?auto_40169 ) ) ( not ( = ?auto_40164 ?auto_40170 ) ) ( not ( = ?auto_40165 ?auto_40166 ) ) ( not ( = ?auto_40165 ?auto_40167 ) ) ( not ( = ?auto_40165 ?auto_40168 ) ) ( not ( = ?auto_40165 ?auto_40169 ) ) ( not ( = ?auto_40165 ?auto_40170 ) ) ( not ( = ?auto_40166 ?auto_40167 ) ) ( not ( = ?auto_40166 ?auto_40168 ) ) ( not ( = ?auto_40166 ?auto_40169 ) ) ( not ( = ?auto_40166 ?auto_40170 ) ) ( not ( = ?auto_40167 ?auto_40168 ) ) ( not ( = ?auto_40167 ?auto_40169 ) ) ( not ( = ?auto_40167 ?auto_40170 ) ) ( not ( = ?auto_40168 ?auto_40169 ) ) ( not ( = ?auto_40168 ?auto_40170 ) ) ( not ( = ?auto_40169 ?auto_40170 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40169 ?auto_40170 )
      ( !STACK ?auto_40169 ?auto_40168 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_40193 - BLOCK
      ?auto_40194 - BLOCK
      ?auto_40195 - BLOCK
      ?auto_40196 - BLOCK
      ?auto_40197 - BLOCK
      ?auto_40198 - BLOCK
      ?auto_40199 - BLOCK
    )
    :vars
    (
      ?auto_40200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40199 ?auto_40200 ) ( ON-TABLE ?auto_40193 ) ( ON ?auto_40194 ?auto_40193 ) ( ON ?auto_40195 ?auto_40194 ) ( ON ?auto_40196 ?auto_40195 ) ( ON ?auto_40197 ?auto_40196 ) ( not ( = ?auto_40193 ?auto_40194 ) ) ( not ( = ?auto_40193 ?auto_40195 ) ) ( not ( = ?auto_40193 ?auto_40196 ) ) ( not ( = ?auto_40193 ?auto_40197 ) ) ( not ( = ?auto_40193 ?auto_40198 ) ) ( not ( = ?auto_40193 ?auto_40199 ) ) ( not ( = ?auto_40193 ?auto_40200 ) ) ( not ( = ?auto_40194 ?auto_40195 ) ) ( not ( = ?auto_40194 ?auto_40196 ) ) ( not ( = ?auto_40194 ?auto_40197 ) ) ( not ( = ?auto_40194 ?auto_40198 ) ) ( not ( = ?auto_40194 ?auto_40199 ) ) ( not ( = ?auto_40194 ?auto_40200 ) ) ( not ( = ?auto_40195 ?auto_40196 ) ) ( not ( = ?auto_40195 ?auto_40197 ) ) ( not ( = ?auto_40195 ?auto_40198 ) ) ( not ( = ?auto_40195 ?auto_40199 ) ) ( not ( = ?auto_40195 ?auto_40200 ) ) ( not ( = ?auto_40196 ?auto_40197 ) ) ( not ( = ?auto_40196 ?auto_40198 ) ) ( not ( = ?auto_40196 ?auto_40199 ) ) ( not ( = ?auto_40196 ?auto_40200 ) ) ( not ( = ?auto_40197 ?auto_40198 ) ) ( not ( = ?auto_40197 ?auto_40199 ) ) ( not ( = ?auto_40197 ?auto_40200 ) ) ( not ( = ?auto_40198 ?auto_40199 ) ) ( not ( = ?auto_40198 ?auto_40200 ) ) ( not ( = ?auto_40199 ?auto_40200 ) ) ( CLEAR ?auto_40197 ) ( ON ?auto_40198 ?auto_40199 ) ( CLEAR ?auto_40198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40193 ?auto_40194 ?auto_40195 ?auto_40196 ?auto_40197 ?auto_40198 )
      ( MAKE-7PILE ?auto_40193 ?auto_40194 ?auto_40195 ?auto_40196 ?auto_40197 ?auto_40198 ?auto_40199 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_40223 - BLOCK
      ?auto_40224 - BLOCK
      ?auto_40225 - BLOCK
      ?auto_40226 - BLOCK
      ?auto_40227 - BLOCK
      ?auto_40228 - BLOCK
      ?auto_40229 - BLOCK
    )
    :vars
    (
      ?auto_40230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40229 ?auto_40230 ) ( ON-TABLE ?auto_40223 ) ( ON ?auto_40224 ?auto_40223 ) ( ON ?auto_40225 ?auto_40224 ) ( ON ?auto_40226 ?auto_40225 ) ( not ( = ?auto_40223 ?auto_40224 ) ) ( not ( = ?auto_40223 ?auto_40225 ) ) ( not ( = ?auto_40223 ?auto_40226 ) ) ( not ( = ?auto_40223 ?auto_40227 ) ) ( not ( = ?auto_40223 ?auto_40228 ) ) ( not ( = ?auto_40223 ?auto_40229 ) ) ( not ( = ?auto_40223 ?auto_40230 ) ) ( not ( = ?auto_40224 ?auto_40225 ) ) ( not ( = ?auto_40224 ?auto_40226 ) ) ( not ( = ?auto_40224 ?auto_40227 ) ) ( not ( = ?auto_40224 ?auto_40228 ) ) ( not ( = ?auto_40224 ?auto_40229 ) ) ( not ( = ?auto_40224 ?auto_40230 ) ) ( not ( = ?auto_40225 ?auto_40226 ) ) ( not ( = ?auto_40225 ?auto_40227 ) ) ( not ( = ?auto_40225 ?auto_40228 ) ) ( not ( = ?auto_40225 ?auto_40229 ) ) ( not ( = ?auto_40225 ?auto_40230 ) ) ( not ( = ?auto_40226 ?auto_40227 ) ) ( not ( = ?auto_40226 ?auto_40228 ) ) ( not ( = ?auto_40226 ?auto_40229 ) ) ( not ( = ?auto_40226 ?auto_40230 ) ) ( not ( = ?auto_40227 ?auto_40228 ) ) ( not ( = ?auto_40227 ?auto_40229 ) ) ( not ( = ?auto_40227 ?auto_40230 ) ) ( not ( = ?auto_40228 ?auto_40229 ) ) ( not ( = ?auto_40228 ?auto_40230 ) ) ( not ( = ?auto_40229 ?auto_40230 ) ) ( ON ?auto_40228 ?auto_40229 ) ( CLEAR ?auto_40226 ) ( ON ?auto_40227 ?auto_40228 ) ( CLEAR ?auto_40227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40223 ?auto_40224 ?auto_40225 ?auto_40226 ?auto_40227 )
      ( MAKE-7PILE ?auto_40223 ?auto_40224 ?auto_40225 ?auto_40226 ?auto_40227 ?auto_40228 ?auto_40229 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_40253 - BLOCK
      ?auto_40254 - BLOCK
      ?auto_40255 - BLOCK
      ?auto_40256 - BLOCK
      ?auto_40257 - BLOCK
      ?auto_40258 - BLOCK
      ?auto_40259 - BLOCK
    )
    :vars
    (
      ?auto_40260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40259 ?auto_40260 ) ( ON-TABLE ?auto_40253 ) ( ON ?auto_40254 ?auto_40253 ) ( ON ?auto_40255 ?auto_40254 ) ( not ( = ?auto_40253 ?auto_40254 ) ) ( not ( = ?auto_40253 ?auto_40255 ) ) ( not ( = ?auto_40253 ?auto_40256 ) ) ( not ( = ?auto_40253 ?auto_40257 ) ) ( not ( = ?auto_40253 ?auto_40258 ) ) ( not ( = ?auto_40253 ?auto_40259 ) ) ( not ( = ?auto_40253 ?auto_40260 ) ) ( not ( = ?auto_40254 ?auto_40255 ) ) ( not ( = ?auto_40254 ?auto_40256 ) ) ( not ( = ?auto_40254 ?auto_40257 ) ) ( not ( = ?auto_40254 ?auto_40258 ) ) ( not ( = ?auto_40254 ?auto_40259 ) ) ( not ( = ?auto_40254 ?auto_40260 ) ) ( not ( = ?auto_40255 ?auto_40256 ) ) ( not ( = ?auto_40255 ?auto_40257 ) ) ( not ( = ?auto_40255 ?auto_40258 ) ) ( not ( = ?auto_40255 ?auto_40259 ) ) ( not ( = ?auto_40255 ?auto_40260 ) ) ( not ( = ?auto_40256 ?auto_40257 ) ) ( not ( = ?auto_40256 ?auto_40258 ) ) ( not ( = ?auto_40256 ?auto_40259 ) ) ( not ( = ?auto_40256 ?auto_40260 ) ) ( not ( = ?auto_40257 ?auto_40258 ) ) ( not ( = ?auto_40257 ?auto_40259 ) ) ( not ( = ?auto_40257 ?auto_40260 ) ) ( not ( = ?auto_40258 ?auto_40259 ) ) ( not ( = ?auto_40258 ?auto_40260 ) ) ( not ( = ?auto_40259 ?auto_40260 ) ) ( ON ?auto_40258 ?auto_40259 ) ( ON ?auto_40257 ?auto_40258 ) ( CLEAR ?auto_40255 ) ( ON ?auto_40256 ?auto_40257 ) ( CLEAR ?auto_40256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40253 ?auto_40254 ?auto_40255 ?auto_40256 )
      ( MAKE-7PILE ?auto_40253 ?auto_40254 ?auto_40255 ?auto_40256 ?auto_40257 ?auto_40258 ?auto_40259 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_40283 - BLOCK
      ?auto_40284 - BLOCK
      ?auto_40285 - BLOCK
      ?auto_40286 - BLOCK
      ?auto_40287 - BLOCK
      ?auto_40288 - BLOCK
      ?auto_40289 - BLOCK
    )
    :vars
    (
      ?auto_40290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40289 ?auto_40290 ) ( ON-TABLE ?auto_40283 ) ( ON ?auto_40284 ?auto_40283 ) ( not ( = ?auto_40283 ?auto_40284 ) ) ( not ( = ?auto_40283 ?auto_40285 ) ) ( not ( = ?auto_40283 ?auto_40286 ) ) ( not ( = ?auto_40283 ?auto_40287 ) ) ( not ( = ?auto_40283 ?auto_40288 ) ) ( not ( = ?auto_40283 ?auto_40289 ) ) ( not ( = ?auto_40283 ?auto_40290 ) ) ( not ( = ?auto_40284 ?auto_40285 ) ) ( not ( = ?auto_40284 ?auto_40286 ) ) ( not ( = ?auto_40284 ?auto_40287 ) ) ( not ( = ?auto_40284 ?auto_40288 ) ) ( not ( = ?auto_40284 ?auto_40289 ) ) ( not ( = ?auto_40284 ?auto_40290 ) ) ( not ( = ?auto_40285 ?auto_40286 ) ) ( not ( = ?auto_40285 ?auto_40287 ) ) ( not ( = ?auto_40285 ?auto_40288 ) ) ( not ( = ?auto_40285 ?auto_40289 ) ) ( not ( = ?auto_40285 ?auto_40290 ) ) ( not ( = ?auto_40286 ?auto_40287 ) ) ( not ( = ?auto_40286 ?auto_40288 ) ) ( not ( = ?auto_40286 ?auto_40289 ) ) ( not ( = ?auto_40286 ?auto_40290 ) ) ( not ( = ?auto_40287 ?auto_40288 ) ) ( not ( = ?auto_40287 ?auto_40289 ) ) ( not ( = ?auto_40287 ?auto_40290 ) ) ( not ( = ?auto_40288 ?auto_40289 ) ) ( not ( = ?auto_40288 ?auto_40290 ) ) ( not ( = ?auto_40289 ?auto_40290 ) ) ( ON ?auto_40288 ?auto_40289 ) ( ON ?auto_40287 ?auto_40288 ) ( ON ?auto_40286 ?auto_40287 ) ( CLEAR ?auto_40284 ) ( ON ?auto_40285 ?auto_40286 ) ( CLEAR ?auto_40285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40283 ?auto_40284 ?auto_40285 )
      ( MAKE-7PILE ?auto_40283 ?auto_40284 ?auto_40285 ?auto_40286 ?auto_40287 ?auto_40288 ?auto_40289 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_40313 - BLOCK
      ?auto_40314 - BLOCK
      ?auto_40315 - BLOCK
      ?auto_40316 - BLOCK
      ?auto_40317 - BLOCK
      ?auto_40318 - BLOCK
      ?auto_40319 - BLOCK
    )
    :vars
    (
      ?auto_40320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40319 ?auto_40320 ) ( ON-TABLE ?auto_40313 ) ( not ( = ?auto_40313 ?auto_40314 ) ) ( not ( = ?auto_40313 ?auto_40315 ) ) ( not ( = ?auto_40313 ?auto_40316 ) ) ( not ( = ?auto_40313 ?auto_40317 ) ) ( not ( = ?auto_40313 ?auto_40318 ) ) ( not ( = ?auto_40313 ?auto_40319 ) ) ( not ( = ?auto_40313 ?auto_40320 ) ) ( not ( = ?auto_40314 ?auto_40315 ) ) ( not ( = ?auto_40314 ?auto_40316 ) ) ( not ( = ?auto_40314 ?auto_40317 ) ) ( not ( = ?auto_40314 ?auto_40318 ) ) ( not ( = ?auto_40314 ?auto_40319 ) ) ( not ( = ?auto_40314 ?auto_40320 ) ) ( not ( = ?auto_40315 ?auto_40316 ) ) ( not ( = ?auto_40315 ?auto_40317 ) ) ( not ( = ?auto_40315 ?auto_40318 ) ) ( not ( = ?auto_40315 ?auto_40319 ) ) ( not ( = ?auto_40315 ?auto_40320 ) ) ( not ( = ?auto_40316 ?auto_40317 ) ) ( not ( = ?auto_40316 ?auto_40318 ) ) ( not ( = ?auto_40316 ?auto_40319 ) ) ( not ( = ?auto_40316 ?auto_40320 ) ) ( not ( = ?auto_40317 ?auto_40318 ) ) ( not ( = ?auto_40317 ?auto_40319 ) ) ( not ( = ?auto_40317 ?auto_40320 ) ) ( not ( = ?auto_40318 ?auto_40319 ) ) ( not ( = ?auto_40318 ?auto_40320 ) ) ( not ( = ?auto_40319 ?auto_40320 ) ) ( ON ?auto_40318 ?auto_40319 ) ( ON ?auto_40317 ?auto_40318 ) ( ON ?auto_40316 ?auto_40317 ) ( ON ?auto_40315 ?auto_40316 ) ( CLEAR ?auto_40313 ) ( ON ?auto_40314 ?auto_40315 ) ( CLEAR ?auto_40314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40313 ?auto_40314 )
      ( MAKE-7PILE ?auto_40313 ?auto_40314 ?auto_40315 ?auto_40316 ?auto_40317 ?auto_40318 ?auto_40319 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_40343 - BLOCK
      ?auto_40344 - BLOCK
      ?auto_40345 - BLOCK
      ?auto_40346 - BLOCK
      ?auto_40347 - BLOCK
      ?auto_40348 - BLOCK
      ?auto_40349 - BLOCK
    )
    :vars
    (
      ?auto_40350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40349 ?auto_40350 ) ( not ( = ?auto_40343 ?auto_40344 ) ) ( not ( = ?auto_40343 ?auto_40345 ) ) ( not ( = ?auto_40343 ?auto_40346 ) ) ( not ( = ?auto_40343 ?auto_40347 ) ) ( not ( = ?auto_40343 ?auto_40348 ) ) ( not ( = ?auto_40343 ?auto_40349 ) ) ( not ( = ?auto_40343 ?auto_40350 ) ) ( not ( = ?auto_40344 ?auto_40345 ) ) ( not ( = ?auto_40344 ?auto_40346 ) ) ( not ( = ?auto_40344 ?auto_40347 ) ) ( not ( = ?auto_40344 ?auto_40348 ) ) ( not ( = ?auto_40344 ?auto_40349 ) ) ( not ( = ?auto_40344 ?auto_40350 ) ) ( not ( = ?auto_40345 ?auto_40346 ) ) ( not ( = ?auto_40345 ?auto_40347 ) ) ( not ( = ?auto_40345 ?auto_40348 ) ) ( not ( = ?auto_40345 ?auto_40349 ) ) ( not ( = ?auto_40345 ?auto_40350 ) ) ( not ( = ?auto_40346 ?auto_40347 ) ) ( not ( = ?auto_40346 ?auto_40348 ) ) ( not ( = ?auto_40346 ?auto_40349 ) ) ( not ( = ?auto_40346 ?auto_40350 ) ) ( not ( = ?auto_40347 ?auto_40348 ) ) ( not ( = ?auto_40347 ?auto_40349 ) ) ( not ( = ?auto_40347 ?auto_40350 ) ) ( not ( = ?auto_40348 ?auto_40349 ) ) ( not ( = ?auto_40348 ?auto_40350 ) ) ( not ( = ?auto_40349 ?auto_40350 ) ) ( ON ?auto_40348 ?auto_40349 ) ( ON ?auto_40347 ?auto_40348 ) ( ON ?auto_40346 ?auto_40347 ) ( ON ?auto_40345 ?auto_40346 ) ( ON ?auto_40344 ?auto_40345 ) ( ON ?auto_40343 ?auto_40344 ) ( CLEAR ?auto_40343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40343 )
      ( MAKE-7PILE ?auto_40343 ?auto_40344 ?auto_40345 ?auto_40346 ?auto_40347 ?auto_40348 ?auto_40349 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_40374 - BLOCK
      ?auto_40375 - BLOCK
      ?auto_40376 - BLOCK
      ?auto_40377 - BLOCK
      ?auto_40378 - BLOCK
      ?auto_40379 - BLOCK
      ?auto_40380 - BLOCK
      ?auto_40381 - BLOCK
    )
    :vars
    (
      ?auto_40382 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_40380 ) ( ON ?auto_40381 ?auto_40382 ) ( CLEAR ?auto_40381 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40374 ) ( ON ?auto_40375 ?auto_40374 ) ( ON ?auto_40376 ?auto_40375 ) ( ON ?auto_40377 ?auto_40376 ) ( ON ?auto_40378 ?auto_40377 ) ( ON ?auto_40379 ?auto_40378 ) ( ON ?auto_40380 ?auto_40379 ) ( not ( = ?auto_40374 ?auto_40375 ) ) ( not ( = ?auto_40374 ?auto_40376 ) ) ( not ( = ?auto_40374 ?auto_40377 ) ) ( not ( = ?auto_40374 ?auto_40378 ) ) ( not ( = ?auto_40374 ?auto_40379 ) ) ( not ( = ?auto_40374 ?auto_40380 ) ) ( not ( = ?auto_40374 ?auto_40381 ) ) ( not ( = ?auto_40374 ?auto_40382 ) ) ( not ( = ?auto_40375 ?auto_40376 ) ) ( not ( = ?auto_40375 ?auto_40377 ) ) ( not ( = ?auto_40375 ?auto_40378 ) ) ( not ( = ?auto_40375 ?auto_40379 ) ) ( not ( = ?auto_40375 ?auto_40380 ) ) ( not ( = ?auto_40375 ?auto_40381 ) ) ( not ( = ?auto_40375 ?auto_40382 ) ) ( not ( = ?auto_40376 ?auto_40377 ) ) ( not ( = ?auto_40376 ?auto_40378 ) ) ( not ( = ?auto_40376 ?auto_40379 ) ) ( not ( = ?auto_40376 ?auto_40380 ) ) ( not ( = ?auto_40376 ?auto_40381 ) ) ( not ( = ?auto_40376 ?auto_40382 ) ) ( not ( = ?auto_40377 ?auto_40378 ) ) ( not ( = ?auto_40377 ?auto_40379 ) ) ( not ( = ?auto_40377 ?auto_40380 ) ) ( not ( = ?auto_40377 ?auto_40381 ) ) ( not ( = ?auto_40377 ?auto_40382 ) ) ( not ( = ?auto_40378 ?auto_40379 ) ) ( not ( = ?auto_40378 ?auto_40380 ) ) ( not ( = ?auto_40378 ?auto_40381 ) ) ( not ( = ?auto_40378 ?auto_40382 ) ) ( not ( = ?auto_40379 ?auto_40380 ) ) ( not ( = ?auto_40379 ?auto_40381 ) ) ( not ( = ?auto_40379 ?auto_40382 ) ) ( not ( = ?auto_40380 ?auto_40381 ) ) ( not ( = ?auto_40380 ?auto_40382 ) ) ( not ( = ?auto_40381 ?auto_40382 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40381 ?auto_40382 )
      ( !STACK ?auto_40381 ?auto_40380 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_40391 - BLOCK
      ?auto_40392 - BLOCK
      ?auto_40393 - BLOCK
      ?auto_40394 - BLOCK
      ?auto_40395 - BLOCK
      ?auto_40396 - BLOCK
      ?auto_40397 - BLOCK
      ?auto_40398 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_40397 ) ( ON-TABLE ?auto_40398 ) ( CLEAR ?auto_40398 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40391 ) ( ON ?auto_40392 ?auto_40391 ) ( ON ?auto_40393 ?auto_40392 ) ( ON ?auto_40394 ?auto_40393 ) ( ON ?auto_40395 ?auto_40394 ) ( ON ?auto_40396 ?auto_40395 ) ( ON ?auto_40397 ?auto_40396 ) ( not ( = ?auto_40391 ?auto_40392 ) ) ( not ( = ?auto_40391 ?auto_40393 ) ) ( not ( = ?auto_40391 ?auto_40394 ) ) ( not ( = ?auto_40391 ?auto_40395 ) ) ( not ( = ?auto_40391 ?auto_40396 ) ) ( not ( = ?auto_40391 ?auto_40397 ) ) ( not ( = ?auto_40391 ?auto_40398 ) ) ( not ( = ?auto_40392 ?auto_40393 ) ) ( not ( = ?auto_40392 ?auto_40394 ) ) ( not ( = ?auto_40392 ?auto_40395 ) ) ( not ( = ?auto_40392 ?auto_40396 ) ) ( not ( = ?auto_40392 ?auto_40397 ) ) ( not ( = ?auto_40392 ?auto_40398 ) ) ( not ( = ?auto_40393 ?auto_40394 ) ) ( not ( = ?auto_40393 ?auto_40395 ) ) ( not ( = ?auto_40393 ?auto_40396 ) ) ( not ( = ?auto_40393 ?auto_40397 ) ) ( not ( = ?auto_40393 ?auto_40398 ) ) ( not ( = ?auto_40394 ?auto_40395 ) ) ( not ( = ?auto_40394 ?auto_40396 ) ) ( not ( = ?auto_40394 ?auto_40397 ) ) ( not ( = ?auto_40394 ?auto_40398 ) ) ( not ( = ?auto_40395 ?auto_40396 ) ) ( not ( = ?auto_40395 ?auto_40397 ) ) ( not ( = ?auto_40395 ?auto_40398 ) ) ( not ( = ?auto_40396 ?auto_40397 ) ) ( not ( = ?auto_40396 ?auto_40398 ) ) ( not ( = ?auto_40397 ?auto_40398 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_40398 )
      ( !STACK ?auto_40398 ?auto_40397 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_40407 - BLOCK
      ?auto_40408 - BLOCK
      ?auto_40409 - BLOCK
      ?auto_40410 - BLOCK
      ?auto_40411 - BLOCK
      ?auto_40412 - BLOCK
      ?auto_40413 - BLOCK
      ?auto_40414 - BLOCK
    )
    :vars
    (
      ?auto_40415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40414 ?auto_40415 ) ( ON-TABLE ?auto_40407 ) ( ON ?auto_40408 ?auto_40407 ) ( ON ?auto_40409 ?auto_40408 ) ( ON ?auto_40410 ?auto_40409 ) ( ON ?auto_40411 ?auto_40410 ) ( ON ?auto_40412 ?auto_40411 ) ( not ( = ?auto_40407 ?auto_40408 ) ) ( not ( = ?auto_40407 ?auto_40409 ) ) ( not ( = ?auto_40407 ?auto_40410 ) ) ( not ( = ?auto_40407 ?auto_40411 ) ) ( not ( = ?auto_40407 ?auto_40412 ) ) ( not ( = ?auto_40407 ?auto_40413 ) ) ( not ( = ?auto_40407 ?auto_40414 ) ) ( not ( = ?auto_40407 ?auto_40415 ) ) ( not ( = ?auto_40408 ?auto_40409 ) ) ( not ( = ?auto_40408 ?auto_40410 ) ) ( not ( = ?auto_40408 ?auto_40411 ) ) ( not ( = ?auto_40408 ?auto_40412 ) ) ( not ( = ?auto_40408 ?auto_40413 ) ) ( not ( = ?auto_40408 ?auto_40414 ) ) ( not ( = ?auto_40408 ?auto_40415 ) ) ( not ( = ?auto_40409 ?auto_40410 ) ) ( not ( = ?auto_40409 ?auto_40411 ) ) ( not ( = ?auto_40409 ?auto_40412 ) ) ( not ( = ?auto_40409 ?auto_40413 ) ) ( not ( = ?auto_40409 ?auto_40414 ) ) ( not ( = ?auto_40409 ?auto_40415 ) ) ( not ( = ?auto_40410 ?auto_40411 ) ) ( not ( = ?auto_40410 ?auto_40412 ) ) ( not ( = ?auto_40410 ?auto_40413 ) ) ( not ( = ?auto_40410 ?auto_40414 ) ) ( not ( = ?auto_40410 ?auto_40415 ) ) ( not ( = ?auto_40411 ?auto_40412 ) ) ( not ( = ?auto_40411 ?auto_40413 ) ) ( not ( = ?auto_40411 ?auto_40414 ) ) ( not ( = ?auto_40411 ?auto_40415 ) ) ( not ( = ?auto_40412 ?auto_40413 ) ) ( not ( = ?auto_40412 ?auto_40414 ) ) ( not ( = ?auto_40412 ?auto_40415 ) ) ( not ( = ?auto_40413 ?auto_40414 ) ) ( not ( = ?auto_40413 ?auto_40415 ) ) ( not ( = ?auto_40414 ?auto_40415 ) ) ( CLEAR ?auto_40412 ) ( ON ?auto_40413 ?auto_40414 ) ( CLEAR ?auto_40413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_40407 ?auto_40408 ?auto_40409 ?auto_40410 ?auto_40411 ?auto_40412 ?auto_40413 )
      ( MAKE-8PILE ?auto_40407 ?auto_40408 ?auto_40409 ?auto_40410 ?auto_40411 ?auto_40412 ?auto_40413 ?auto_40414 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_40424 - BLOCK
      ?auto_40425 - BLOCK
      ?auto_40426 - BLOCK
      ?auto_40427 - BLOCK
      ?auto_40428 - BLOCK
      ?auto_40429 - BLOCK
      ?auto_40430 - BLOCK
      ?auto_40431 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40431 ) ( ON-TABLE ?auto_40424 ) ( ON ?auto_40425 ?auto_40424 ) ( ON ?auto_40426 ?auto_40425 ) ( ON ?auto_40427 ?auto_40426 ) ( ON ?auto_40428 ?auto_40427 ) ( ON ?auto_40429 ?auto_40428 ) ( not ( = ?auto_40424 ?auto_40425 ) ) ( not ( = ?auto_40424 ?auto_40426 ) ) ( not ( = ?auto_40424 ?auto_40427 ) ) ( not ( = ?auto_40424 ?auto_40428 ) ) ( not ( = ?auto_40424 ?auto_40429 ) ) ( not ( = ?auto_40424 ?auto_40430 ) ) ( not ( = ?auto_40424 ?auto_40431 ) ) ( not ( = ?auto_40425 ?auto_40426 ) ) ( not ( = ?auto_40425 ?auto_40427 ) ) ( not ( = ?auto_40425 ?auto_40428 ) ) ( not ( = ?auto_40425 ?auto_40429 ) ) ( not ( = ?auto_40425 ?auto_40430 ) ) ( not ( = ?auto_40425 ?auto_40431 ) ) ( not ( = ?auto_40426 ?auto_40427 ) ) ( not ( = ?auto_40426 ?auto_40428 ) ) ( not ( = ?auto_40426 ?auto_40429 ) ) ( not ( = ?auto_40426 ?auto_40430 ) ) ( not ( = ?auto_40426 ?auto_40431 ) ) ( not ( = ?auto_40427 ?auto_40428 ) ) ( not ( = ?auto_40427 ?auto_40429 ) ) ( not ( = ?auto_40427 ?auto_40430 ) ) ( not ( = ?auto_40427 ?auto_40431 ) ) ( not ( = ?auto_40428 ?auto_40429 ) ) ( not ( = ?auto_40428 ?auto_40430 ) ) ( not ( = ?auto_40428 ?auto_40431 ) ) ( not ( = ?auto_40429 ?auto_40430 ) ) ( not ( = ?auto_40429 ?auto_40431 ) ) ( not ( = ?auto_40430 ?auto_40431 ) ) ( CLEAR ?auto_40429 ) ( ON ?auto_40430 ?auto_40431 ) ( CLEAR ?auto_40430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_40424 ?auto_40425 ?auto_40426 ?auto_40427 ?auto_40428 ?auto_40429 ?auto_40430 )
      ( MAKE-8PILE ?auto_40424 ?auto_40425 ?auto_40426 ?auto_40427 ?auto_40428 ?auto_40429 ?auto_40430 ?auto_40431 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_40440 - BLOCK
      ?auto_40441 - BLOCK
      ?auto_40442 - BLOCK
      ?auto_40443 - BLOCK
      ?auto_40444 - BLOCK
      ?auto_40445 - BLOCK
      ?auto_40446 - BLOCK
      ?auto_40447 - BLOCK
    )
    :vars
    (
      ?auto_40448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40447 ?auto_40448 ) ( ON-TABLE ?auto_40440 ) ( ON ?auto_40441 ?auto_40440 ) ( ON ?auto_40442 ?auto_40441 ) ( ON ?auto_40443 ?auto_40442 ) ( ON ?auto_40444 ?auto_40443 ) ( not ( = ?auto_40440 ?auto_40441 ) ) ( not ( = ?auto_40440 ?auto_40442 ) ) ( not ( = ?auto_40440 ?auto_40443 ) ) ( not ( = ?auto_40440 ?auto_40444 ) ) ( not ( = ?auto_40440 ?auto_40445 ) ) ( not ( = ?auto_40440 ?auto_40446 ) ) ( not ( = ?auto_40440 ?auto_40447 ) ) ( not ( = ?auto_40440 ?auto_40448 ) ) ( not ( = ?auto_40441 ?auto_40442 ) ) ( not ( = ?auto_40441 ?auto_40443 ) ) ( not ( = ?auto_40441 ?auto_40444 ) ) ( not ( = ?auto_40441 ?auto_40445 ) ) ( not ( = ?auto_40441 ?auto_40446 ) ) ( not ( = ?auto_40441 ?auto_40447 ) ) ( not ( = ?auto_40441 ?auto_40448 ) ) ( not ( = ?auto_40442 ?auto_40443 ) ) ( not ( = ?auto_40442 ?auto_40444 ) ) ( not ( = ?auto_40442 ?auto_40445 ) ) ( not ( = ?auto_40442 ?auto_40446 ) ) ( not ( = ?auto_40442 ?auto_40447 ) ) ( not ( = ?auto_40442 ?auto_40448 ) ) ( not ( = ?auto_40443 ?auto_40444 ) ) ( not ( = ?auto_40443 ?auto_40445 ) ) ( not ( = ?auto_40443 ?auto_40446 ) ) ( not ( = ?auto_40443 ?auto_40447 ) ) ( not ( = ?auto_40443 ?auto_40448 ) ) ( not ( = ?auto_40444 ?auto_40445 ) ) ( not ( = ?auto_40444 ?auto_40446 ) ) ( not ( = ?auto_40444 ?auto_40447 ) ) ( not ( = ?auto_40444 ?auto_40448 ) ) ( not ( = ?auto_40445 ?auto_40446 ) ) ( not ( = ?auto_40445 ?auto_40447 ) ) ( not ( = ?auto_40445 ?auto_40448 ) ) ( not ( = ?auto_40446 ?auto_40447 ) ) ( not ( = ?auto_40446 ?auto_40448 ) ) ( not ( = ?auto_40447 ?auto_40448 ) ) ( ON ?auto_40446 ?auto_40447 ) ( CLEAR ?auto_40444 ) ( ON ?auto_40445 ?auto_40446 ) ( CLEAR ?auto_40445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40440 ?auto_40441 ?auto_40442 ?auto_40443 ?auto_40444 ?auto_40445 )
      ( MAKE-8PILE ?auto_40440 ?auto_40441 ?auto_40442 ?auto_40443 ?auto_40444 ?auto_40445 ?auto_40446 ?auto_40447 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_40457 - BLOCK
      ?auto_40458 - BLOCK
      ?auto_40459 - BLOCK
      ?auto_40460 - BLOCK
      ?auto_40461 - BLOCK
      ?auto_40462 - BLOCK
      ?auto_40463 - BLOCK
      ?auto_40464 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40464 ) ( ON-TABLE ?auto_40457 ) ( ON ?auto_40458 ?auto_40457 ) ( ON ?auto_40459 ?auto_40458 ) ( ON ?auto_40460 ?auto_40459 ) ( ON ?auto_40461 ?auto_40460 ) ( not ( = ?auto_40457 ?auto_40458 ) ) ( not ( = ?auto_40457 ?auto_40459 ) ) ( not ( = ?auto_40457 ?auto_40460 ) ) ( not ( = ?auto_40457 ?auto_40461 ) ) ( not ( = ?auto_40457 ?auto_40462 ) ) ( not ( = ?auto_40457 ?auto_40463 ) ) ( not ( = ?auto_40457 ?auto_40464 ) ) ( not ( = ?auto_40458 ?auto_40459 ) ) ( not ( = ?auto_40458 ?auto_40460 ) ) ( not ( = ?auto_40458 ?auto_40461 ) ) ( not ( = ?auto_40458 ?auto_40462 ) ) ( not ( = ?auto_40458 ?auto_40463 ) ) ( not ( = ?auto_40458 ?auto_40464 ) ) ( not ( = ?auto_40459 ?auto_40460 ) ) ( not ( = ?auto_40459 ?auto_40461 ) ) ( not ( = ?auto_40459 ?auto_40462 ) ) ( not ( = ?auto_40459 ?auto_40463 ) ) ( not ( = ?auto_40459 ?auto_40464 ) ) ( not ( = ?auto_40460 ?auto_40461 ) ) ( not ( = ?auto_40460 ?auto_40462 ) ) ( not ( = ?auto_40460 ?auto_40463 ) ) ( not ( = ?auto_40460 ?auto_40464 ) ) ( not ( = ?auto_40461 ?auto_40462 ) ) ( not ( = ?auto_40461 ?auto_40463 ) ) ( not ( = ?auto_40461 ?auto_40464 ) ) ( not ( = ?auto_40462 ?auto_40463 ) ) ( not ( = ?auto_40462 ?auto_40464 ) ) ( not ( = ?auto_40463 ?auto_40464 ) ) ( ON ?auto_40463 ?auto_40464 ) ( CLEAR ?auto_40461 ) ( ON ?auto_40462 ?auto_40463 ) ( CLEAR ?auto_40462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40457 ?auto_40458 ?auto_40459 ?auto_40460 ?auto_40461 ?auto_40462 )
      ( MAKE-8PILE ?auto_40457 ?auto_40458 ?auto_40459 ?auto_40460 ?auto_40461 ?auto_40462 ?auto_40463 ?auto_40464 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_40473 - BLOCK
      ?auto_40474 - BLOCK
      ?auto_40475 - BLOCK
      ?auto_40476 - BLOCK
      ?auto_40477 - BLOCK
      ?auto_40478 - BLOCK
      ?auto_40479 - BLOCK
      ?auto_40480 - BLOCK
    )
    :vars
    (
      ?auto_40481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40480 ?auto_40481 ) ( ON-TABLE ?auto_40473 ) ( ON ?auto_40474 ?auto_40473 ) ( ON ?auto_40475 ?auto_40474 ) ( ON ?auto_40476 ?auto_40475 ) ( not ( = ?auto_40473 ?auto_40474 ) ) ( not ( = ?auto_40473 ?auto_40475 ) ) ( not ( = ?auto_40473 ?auto_40476 ) ) ( not ( = ?auto_40473 ?auto_40477 ) ) ( not ( = ?auto_40473 ?auto_40478 ) ) ( not ( = ?auto_40473 ?auto_40479 ) ) ( not ( = ?auto_40473 ?auto_40480 ) ) ( not ( = ?auto_40473 ?auto_40481 ) ) ( not ( = ?auto_40474 ?auto_40475 ) ) ( not ( = ?auto_40474 ?auto_40476 ) ) ( not ( = ?auto_40474 ?auto_40477 ) ) ( not ( = ?auto_40474 ?auto_40478 ) ) ( not ( = ?auto_40474 ?auto_40479 ) ) ( not ( = ?auto_40474 ?auto_40480 ) ) ( not ( = ?auto_40474 ?auto_40481 ) ) ( not ( = ?auto_40475 ?auto_40476 ) ) ( not ( = ?auto_40475 ?auto_40477 ) ) ( not ( = ?auto_40475 ?auto_40478 ) ) ( not ( = ?auto_40475 ?auto_40479 ) ) ( not ( = ?auto_40475 ?auto_40480 ) ) ( not ( = ?auto_40475 ?auto_40481 ) ) ( not ( = ?auto_40476 ?auto_40477 ) ) ( not ( = ?auto_40476 ?auto_40478 ) ) ( not ( = ?auto_40476 ?auto_40479 ) ) ( not ( = ?auto_40476 ?auto_40480 ) ) ( not ( = ?auto_40476 ?auto_40481 ) ) ( not ( = ?auto_40477 ?auto_40478 ) ) ( not ( = ?auto_40477 ?auto_40479 ) ) ( not ( = ?auto_40477 ?auto_40480 ) ) ( not ( = ?auto_40477 ?auto_40481 ) ) ( not ( = ?auto_40478 ?auto_40479 ) ) ( not ( = ?auto_40478 ?auto_40480 ) ) ( not ( = ?auto_40478 ?auto_40481 ) ) ( not ( = ?auto_40479 ?auto_40480 ) ) ( not ( = ?auto_40479 ?auto_40481 ) ) ( not ( = ?auto_40480 ?auto_40481 ) ) ( ON ?auto_40479 ?auto_40480 ) ( ON ?auto_40478 ?auto_40479 ) ( CLEAR ?auto_40476 ) ( ON ?auto_40477 ?auto_40478 ) ( CLEAR ?auto_40477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40473 ?auto_40474 ?auto_40475 ?auto_40476 ?auto_40477 )
      ( MAKE-8PILE ?auto_40473 ?auto_40474 ?auto_40475 ?auto_40476 ?auto_40477 ?auto_40478 ?auto_40479 ?auto_40480 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_40490 - BLOCK
      ?auto_40491 - BLOCK
      ?auto_40492 - BLOCK
      ?auto_40493 - BLOCK
      ?auto_40494 - BLOCK
      ?auto_40495 - BLOCK
      ?auto_40496 - BLOCK
      ?auto_40497 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40497 ) ( ON-TABLE ?auto_40490 ) ( ON ?auto_40491 ?auto_40490 ) ( ON ?auto_40492 ?auto_40491 ) ( ON ?auto_40493 ?auto_40492 ) ( not ( = ?auto_40490 ?auto_40491 ) ) ( not ( = ?auto_40490 ?auto_40492 ) ) ( not ( = ?auto_40490 ?auto_40493 ) ) ( not ( = ?auto_40490 ?auto_40494 ) ) ( not ( = ?auto_40490 ?auto_40495 ) ) ( not ( = ?auto_40490 ?auto_40496 ) ) ( not ( = ?auto_40490 ?auto_40497 ) ) ( not ( = ?auto_40491 ?auto_40492 ) ) ( not ( = ?auto_40491 ?auto_40493 ) ) ( not ( = ?auto_40491 ?auto_40494 ) ) ( not ( = ?auto_40491 ?auto_40495 ) ) ( not ( = ?auto_40491 ?auto_40496 ) ) ( not ( = ?auto_40491 ?auto_40497 ) ) ( not ( = ?auto_40492 ?auto_40493 ) ) ( not ( = ?auto_40492 ?auto_40494 ) ) ( not ( = ?auto_40492 ?auto_40495 ) ) ( not ( = ?auto_40492 ?auto_40496 ) ) ( not ( = ?auto_40492 ?auto_40497 ) ) ( not ( = ?auto_40493 ?auto_40494 ) ) ( not ( = ?auto_40493 ?auto_40495 ) ) ( not ( = ?auto_40493 ?auto_40496 ) ) ( not ( = ?auto_40493 ?auto_40497 ) ) ( not ( = ?auto_40494 ?auto_40495 ) ) ( not ( = ?auto_40494 ?auto_40496 ) ) ( not ( = ?auto_40494 ?auto_40497 ) ) ( not ( = ?auto_40495 ?auto_40496 ) ) ( not ( = ?auto_40495 ?auto_40497 ) ) ( not ( = ?auto_40496 ?auto_40497 ) ) ( ON ?auto_40496 ?auto_40497 ) ( ON ?auto_40495 ?auto_40496 ) ( CLEAR ?auto_40493 ) ( ON ?auto_40494 ?auto_40495 ) ( CLEAR ?auto_40494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40490 ?auto_40491 ?auto_40492 ?auto_40493 ?auto_40494 )
      ( MAKE-8PILE ?auto_40490 ?auto_40491 ?auto_40492 ?auto_40493 ?auto_40494 ?auto_40495 ?auto_40496 ?auto_40497 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_40506 - BLOCK
      ?auto_40507 - BLOCK
      ?auto_40508 - BLOCK
      ?auto_40509 - BLOCK
      ?auto_40510 - BLOCK
      ?auto_40511 - BLOCK
      ?auto_40512 - BLOCK
      ?auto_40513 - BLOCK
    )
    :vars
    (
      ?auto_40514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40513 ?auto_40514 ) ( ON-TABLE ?auto_40506 ) ( ON ?auto_40507 ?auto_40506 ) ( ON ?auto_40508 ?auto_40507 ) ( not ( = ?auto_40506 ?auto_40507 ) ) ( not ( = ?auto_40506 ?auto_40508 ) ) ( not ( = ?auto_40506 ?auto_40509 ) ) ( not ( = ?auto_40506 ?auto_40510 ) ) ( not ( = ?auto_40506 ?auto_40511 ) ) ( not ( = ?auto_40506 ?auto_40512 ) ) ( not ( = ?auto_40506 ?auto_40513 ) ) ( not ( = ?auto_40506 ?auto_40514 ) ) ( not ( = ?auto_40507 ?auto_40508 ) ) ( not ( = ?auto_40507 ?auto_40509 ) ) ( not ( = ?auto_40507 ?auto_40510 ) ) ( not ( = ?auto_40507 ?auto_40511 ) ) ( not ( = ?auto_40507 ?auto_40512 ) ) ( not ( = ?auto_40507 ?auto_40513 ) ) ( not ( = ?auto_40507 ?auto_40514 ) ) ( not ( = ?auto_40508 ?auto_40509 ) ) ( not ( = ?auto_40508 ?auto_40510 ) ) ( not ( = ?auto_40508 ?auto_40511 ) ) ( not ( = ?auto_40508 ?auto_40512 ) ) ( not ( = ?auto_40508 ?auto_40513 ) ) ( not ( = ?auto_40508 ?auto_40514 ) ) ( not ( = ?auto_40509 ?auto_40510 ) ) ( not ( = ?auto_40509 ?auto_40511 ) ) ( not ( = ?auto_40509 ?auto_40512 ) ) ( not ( = ?auto_40509 ?auto_40513 ) ) ( not ( = ?auto_40509 ?auto_40514 ) ) ( not ( = ?auto_40510 ?auto_40511 ) ) ( not ( = ?auto_40510 ?auto_40512 ) ) ( not ( = ?auto_40510 ?auto_40513 ) ) ( not ( = ?auto_40510 ?auto_40514 ) ) ( not ( = ?auto_40511 ?auto_40512 ) ) ( not ( = ?auto_40511 ?auto_40513 ) ) ( not ( = ?auto_40511 ?auto_40514 ) ) ( not ( = ?auto_40512 ?auto_40513 ) ) ( not ( = ?auto_40512 ?auto_40514 ) ) ( not ( = ?auto_40513 ?auto_40514 ) ) ( ON ?auto_40512 ?auto_40513 ) ( ON ?auto_40511 ?auto_40512 ) ( ON ?auto_40510 ?auto_40511 ) ( CLEAR ?auto_40508 ) ( ON ?auto_40509 ?auto_40510 ) ( CLEAR ?auto_40509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40506 ?auto_40507 ?auto_40508 ?auto_40509 )
      ( MAKE-8PILE ?auto_40506 ?auto_40507 ?auto_40508 ?auto_40509 ?auto_40510 ?auto_40511 ?auto_40512 ?auto_40513 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_40523 - BLOCK
      ?auto_40524 - BLOCK
      ?auto_40525 - BLOCK
      ?auto_40526 - BLOCK
      ?auto_40527 - BLOCK
      ?auto_40528 - BLOCK
      ?auto_40529 - BLOCK
      ?auto_40530 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40530 ) ( ON-TABLE ?auto_40523 ) ( ON ?auto_40524 ?auto_40523 ) ( ON ?auto_40525 ?auto_40524 ) ( not ( = ?auto_40523 ?auto_40524 ) ) ( not ( = ?auto_40523 ?auto_40525 ) ) ( not ( = ?auto_40523 ?auto_40526 ) ) ( not ( = ?auto_40523 ?auto_40527 ) ) ( not ( = ?auto_40523 ?auto_40528 ) ) ( not ( = ?auto_40523 ?auto_40529 ) ) ( not ( = ?auto_40523 ?auto_40530 ) ) ( not ( = ?auto_40524 ?auto_40525 ) ) ( not ( = ?auto_40524 ?auto_40526 ) ) ( not ( = ?auto_40524 ?auto_40527 ) ) ( not ( = ?auto_40524 ?auto_40528 ) ) ( not ( = ?auto_40524 ?auto_40529 ) ) ( not ( = ?auto_40524 ?auto_40530 ) ) ( not ( = ?auto_40525 ?auto_40526 ) ) ( not ( = ?auto_40525 ?auto_40527 ) ) ( not ( = ?auto_40525 ?auto_40528 ) ) ( not ( = ?auto_40525 ?auto_40529 ) ) ( not ( = ?auto_40525 ?auto_40530 ) ) ( not ( = ?auto_40526 ?auto_40527 ) ) ( not ( = ?auto_40526 ?auto_40528 ) ) ( not ( = ?auto_40526 ?auto_40529 ) ) ( not ( = ?auto_40526 ?auto_40530 ) ) ( not ( = ?auto_40527 ?auto_40528 ) ) ( not ( = ?auto_40527 ?auto_40529 ) ) ( not ( = ?auto_40527 ?auto_40530 ) ) ( not ( = ?auto_40528 ?auto_40529 ) ) ( not ( = ?auto_40528 ?auto_40530 ) ) ( not ( = ?auto_40529 ?auto_40530 ) ) ( ON ?auto_40529 ?auto_40530 ) ( ON ?auto_40528 ?auto_40529 ) ( ON ?auto_40527 ?auto_40528 ) ( CLEAR ?auto_40525 ) ( ON ?auto_40526 ?auto_40527 ) ( CLEAR ?auto_40526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40523 ?auto_40524 ?auto_40525 ?auto_40526 )
      ( MAKE-8PILE ?auto_40523 ?auto_40524 ?auto_40525 ?auto_40526 ?auto_40527 ?auto_40528 ?auto_40529 ?auto_40530 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_40539 - BLOCK
      ?auto_40540 - BLOCK
      ?auto_40541 - BLOCK
      ?auto_40542 - BLOCK
      ?auto_40543 - BLOCK
      ?auto_40544 - BLOCK
      ?auto_40545 - BLOCK
      ?auto_40546 - BLOCK
    )
    :vars
    (
      ?auto_40547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40546 ?auto_40547 ) ( ON-TABLE ?auto_40539 ) ( ON ?auto_40540 ?auto_40539 ) ( not ( = ?auto_40539 ?auto_40540 ) ) ( not ( = ?auto_40539 ?auto_40541 ) ) ( not ( = ?auto_40539 ?auto_40542 ) ) ( not ( = ?auto_40539 ?auto_40543 ) ) ( not ( = ?auto_40539 ?auto_40544 ) ) ( not ( = ?auto_40539 ?auto_40545 ) ) ( not ( = ?auto_40539 ?auto_40546 ) ) ( not ( = ?auto_40539 ?auto_40547 ) ) ( not ( = ?auto_40540 ?auto_40541 ) ) ( not ( = ?auto_40540 ?auto_40542 ) ) ( not ( = ?auto_40540 ?auto_40543 ) ) ( not ( = ?auto_40540 ?auto_40544 ) ) ( not ( = ?auto_40540 ?auto_40545 ) ) ( not ( = ?auto_40540 ?auto_40546 ) ) ( not ( = ?auto_40540 ?auto_40547 ) ) ( not ( = ?auto_40541 ?auto_40542 ) ) ( not ( = ?auto_40541 ?auto_40543 ) ) ( not ( = ?auto_40541 ?auto_40544 ) ) ( not ( = ?auto_40541 ?auto_40545 ) ) ( not ( = ?auto_40541 ?auto_40546 ) ) ( not ( = ?auto_40541 ?auto_40547 ) ) ( not ( = ?auto_40542 ?auto_40543 ) ) ( not ( = ?auto_40542 ?auto_40544 ) ) ( not ( = ?auto_40542 ?auto_40545 ) ) ( not ( = ?auto_40542 ?auto_40546 ) ) ( not ( = ?auto_40542 ?auto_40547 ) ) ( not ( = ?auto_40543 ?auto_40544 ) ) ( not ( = ?auto_40543 ?auto_40545 ) ) ( not ( = ?auto_40543 ?auto_40546 ) ) ( not ( = ?auto_40543 ?auto_40547 ) ) ( not ( = ?auto_40544 ?auto_40545 ) ) ( not ( = ?auto_40544 ?auto_40546 ) ) ( not ( = ?auto_40544 ?auto_40547 ) ) ( not ( = ?auto_40545 ?auto_40546 ) ) ( not ( = ?auto_40545 ?auto_40547 ) ) ( not ( = ?auto_40546 ?auto_40547 ) ) ( ON ?auto_40545 ?auto_40546 ) ( ON ?auto_40544 ?auto_40545 ) ( ON ?auto_40543 ?auto_40544 ) ( ON ?auto_40542 ?auto_40543 ) ( CLEAR ?auto_40540 ) ( ON ?auto_40541 ?auto_40542 ) ( CLEAR ?auto_40541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40539 ?auto_40540 ?auto_40541 )
      ( MAKE-8PILE ?auto_40539 ?auto_40540 ?auto_40541 ?auto_40542 ?auto_40543 ?auto_40544 ?auto_40545 ?auto_40546 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_40556 - BLOCK
      ?auto_40557 - BLOCK
      ?auto_40558 - BLOCK
      ?auto_40559 - BLOCK
      ?auto_40560 - BLOCK
      ?auto_40561 - BLOCK
      ?auto_40562 - BLOCK
      ?auto_40563 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40563 ) ( ON-TABLE ?auto_40556 ) ( ON ?auto_40557 ?auto_40556 ) ( not ( = ?auto_40556 ?auto_40557 ) ) ( not ( = ?auto_40556 ?auto_40558 ) ) ( not ( = ?auto_40556 ?auto_40559 ) ) ( not ( = ?auto_40556 ?auto_40560 ) ) ( not ( = ?auto_40556 ?auto_40561 ) ) ( not ( = ?auto_40556 ?auto_40562 ) ) ( not ( = ?auto_40556 ?auto_40563 ) ) ( not ( = ?auto_40557 ?auto_40558 ) ) ( not ( = ?auto_40557 ?auto_40559 ) ) ( not ( = ?auto_40557 ?auto_40560 ) ) ( not ( = ?auto_40557 ?auto_40561 ) ) ( not ( = ?auto_40557 ?auto_40562 ) ) ( not ( = ?auto_40557 ?auto_40563 ) ) ( not ( = ?auto_40558 ?auto_40559 ) ) ( not ( = ?auto_40558 ?auto_40560 ) ) ( not ( = ?auto_40558 ?auto_40561 ) ) ( not ( = ?auto_40558 ?auto_40562 ) ) ( not ( = ?auto_40558 ?auto_40563 ) ) ( not ( = ?auto_40559 ?auto_40560 ) ) ( not ( = ?auto_40559 ?auto_40561 ) ) ( not ( = ?auto_40559 ?auto_40562 ) ) ( not ( = ?auto_40559 ?auto_40563 ) ) ( not ( = ?auto_40560 ?auto_40561 ) ) ( not ( = ?auto_40560 ?auto_40562 ) ) ( not ( = ?auto_40560 ?auto_40563 ) ) ( not ( = ?auto_40561 ?auto_40562 ) ) ( not ( = ?auto_40561 ?auto_40563 ) ) ( not ( = ?auto_40562 ?auto_40563 ) ) ( ON ?auto_40562 ?auto_40563 ) ( ON ?auto_40561 ?auto_40562 ) ( ON ?auto_40560 ?auto_40561 ) ( ON ?auto_40559 ?auto_40560 ) ( CLEAR ?auto_40557 ) ( ON ?auto_40558 ?auto_40559 ) ( CLEAR ?auto_40558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40556 ?auto_40557 ?auto_40558 )
      ( MAKE-8PILE ?auto_40556 ?auto_40557 ?auto_40558 ?auto_40559 ?auto_40560 ?auto_40561 ?auto_40562 ?auto_40563 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_40572 - BLOCK
      ?auto_40573 - BLOCK
      ?auto_40574 - BLOCK
      ?auto_40575 - BLOCK
      ?auto_40576 - BLOCK
      ?auto_40577 - BLOCK
      ?auto_40578 - BLOCK
      ?auto_40579 - BLOCK
    )
    :vars
    (
      ?auto_40580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40579 ?auto_40580 ) ( ON-TABLE ?auto_40572 ) ( not ( = ?auto_40572 ?auto_40573 ) ) ( not ( = ?auto_40572 ?auto_40574 ) ) ( not ( = ?auto_40572 ?auto_40575 ) ) ( not ( = ?auto_40572 ?auto_40576 ) ) ( not ( = ?auto_40572 ?auto_40577 ) ) ( not ( = ?auto_40572 ?auto_40578 ) ) ( not ( = ?auto_40572 ?auto_40579 ) ) ( not ( = ?auto_40572 ?auto_40580 ) ) ( not ( = ?auto_40573 ?auto_40574 ) ) ( not ( = ?auto_40573 ?auto_40575 ) ) ( not ( = ?auto_40573 ?auto_40576 ) ) ( not ( = ?auto_40573 ?auto_40577 ) ) ( not ( = ?auto_40573 ?auto_40578 ) ) ( not ( = ?auto_40573 ?auto_40579 ) ) ( not ( = ?auto_40573 ?auto_40580 ) ) ( not ( = ?auto_40574 ?auto_40575 ) ) ( not ( = ?auto_40574 ?auto_40576 ) ) ( not ( = ?auto_40574 ?auto_40577 ) ) ( not ( = ?auto_40574 ?auto_40578 ) ) ( not ( = ?auto_40574 ?auto_40579 ) ) ( not ( = ?auto_40574 ?auto_40580 ) ) ( not ( = ?auto_40575 ?auto_40576 ) ) ( not ( = ?auto_40575 ?auto_40577 ) ) ( not ( = ?auto_40575 ?auto_40578 ) ) ( not ( = ?auto_40575 ?auto_40579 ) ) ( not ( = ?auto_40575 ?auto_40580 ) ) ( not ( = ?auto_40576 ?auto_40577 ) ) ( not ( = ?auto_40576 ?auto_40578 ) ) ( not ( = ?auto_40576 ?auto_40579 ) ) ( not ( = ?auto_40576 ?auto_40580 ) ) ( not ( = ?auto_40577 ?auto_40578 ) ) ( not ( = ?auto_40577 ?auto_40579 ) ) ( not ( = ?auto_40577 ?auto_40580 ) ) ( not ( = ?auto_40578 ?auto_40579 ) ) ( not ( = ?auto_40578 ?auto_40580 ) ) ( not ( = ?auto_40579 ?auto_40580 ) ) ( ON ?auto_40578 ?auto_40579 ) ( ON ?auto_40577 ?auto_40578 ) ( ON ?auto_40576 ?auto_40577 ) ( ON ?auto_40575 ?auto_40576 ) ( ON ?auto_40574 ?auto_40575 ) ( CLEAR ?auto_40572 ) ( ON ?auto_40573 ?auto_40574 ) ( CLEAR ?auto_40573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40572 ?auto_40573 )
      ( MAKE-8PILE ?auto_40572 ?auto_40573 ?auto_40574 ?auto_40575 ?auto_40576 ?auto_40577 ?auto_40578 ?auto_40579 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_40589 - BLOCK
      ?auto_40590 - BLOCK
      ?auto_40591 - BLOCK
      ?auto_40592 - BLOCK
      ?auto_40593 - BLOCK
      ?auto_40594 - BLOCK
      ?auto_40595 - BLOCK
      ?auto_40596 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40596 ) ( ON-TABLE ?auto_40589 ) ( not ( = ?auto_40589 ?auto_40590 ) ) ( not ( = ?auto_40589 ?auto_40591 ) ) ( not ( = ?auto_40589 ?auto_40592 ) ) ( not ( = ?auto_40589 ?auto_40593 ) ) ( not ( = ?auto_40589 ?auto_40594 ) ) ( not ( = ?auto_40589 ?auto_40595 ) ) ( not ( = ?auto_40589 ?auto_40596 ) ) ( not ( = ?auto_40590 ?auto_40591 ) ) ( not ( = ?auto_40590 ?auto_40592 ) ) ( not ( = ?auto_40590 ?auto_40593 ) ) ( not ( = ?auto_40590 ?auto_40594 ) ) ( not ( = ?auto_40590 ?auto_40595 ) ) ( not ( = ?auto_40590 ?auto_40596 ) ) ( not ( = ?auto_40591 ?auto_40592 ) ) ( not ( = ?auto_40591 ?auto_40593 ) ) ( not ( = ?auto_40591 ?auto_40594 ) ) ( not ( = ?auto_40591 ?auto_40595 ) ) ( not ( = ?auto_40591 ?auto_40596 ) ) ( not ( = ?auto_40592 ?auto_40593 ) ) ( not ( = ?auto_40592 ?auto_40594 ) ) ( not ( = ?auto_40592 ?auto_40595 ) ) ( not ( = ?auto_40592 ?auto_40596 ) ) ( not ( = ?auto_40593 ?auto_40594 ) ) ( not ( = ?auto_40593 ?auto_40595 ) ) ( not ( = ?auto_40593 ?auto_40596 ) ) ( not ( = ?auto_40594 ?auto_40595 ) ) ( not ( = ?auto_40594 ?auto_40596 ) ) ( not ( = ?auto_40595 ?auto_40596 ) ) ( ON ?auto_40595 ?auto_40596 ) ( ON ?auto_40594 ?auto_40595 ) ( ON ?auto_40593 ?auto_40594 ) ( ON ?auto_40592 ?auto_40593 ) ( ON ?auto_40591 ?auto_40592 ) ( CLEAR ?auto_40589 ) ( ON ?auto_40590 ?auto_40591 ) ( CLEAR ?auto_40590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40589 ?auto_40590 )
      ( MAKE-8PILE ?auto_40589 ?auto_40590 ?auto_40591 ?auto_40592 ?auto_40593 ?auto_40594 ?auto_40595 ?auto_40596 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_40605 - BLOCK
      ?auto_40606 - BLOCK
      ?auto_40607 - BLOCK
      ?auto_40608 - BLOCK
      ?auto_40609 - BLOCK
      ?auto_40610 - BLOCK
      ?auto_40611 - BLOCK
      ?auto_40612 - BLOCK
    )
    :vars
    (
      ?auto_40613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40612 ?auto_40613 ) ( not ( = ?auto_40605 ?auto_40606 ) ) ( not ( = ?auto_40605 ?auto_40607 ) ) ( not ( = ?auto_40605 ?auto_40608 ) ) ( not ( = ?auto_40605 ?auto_40609 ) ) ( not ( = ?auto_40605 ?auto_40610 ) ) ( not ( = ?auto_40605 ?auto_40611 ) ) ( not ( = ?auto_40605 ?auto_40612 ) ) ( not ( = ?auto_40605 ?auto_40613 ) ) ( not ( = ?auto_40606 ?auto_40607 ) ) ( not ( = ?auto_40606 ?auto_40608 ) ) ( not ( = ?auto_40606 ?auto_40609 ) ) ( not ( = ?auto_40606 ?auto_40610 ) ) ( not ( = ?auto_40606 ?auto_40611 ) ) ( not ( = ?auto_40606 ?auto_40612 ) ) ( not ( = ?auto_40606 ?auto_40613 ) ) ( not ( = ?auto_40607 ?auto_40608 ) ) ( not ( = ?auto_40607 ?auto_40609 ) ) ( not ( = ?auto_40607 ?auto_40610 ) ) ( not ( = ?auto_40607 ?auto_40611 ) ) ( not ( = ?auto_40607 ?auto_40612 ) ) ( not ( = ?auto_40607 ?auto_40613 ) ) ( not ( = ?auto_40608 ?auto_40609 ) ) ( not ( = ?auto_40608 ?auto_40610 ) ) ( not ( = ?auto_40608 ?auto_40611 ) ) ( not ( = ?auto_40608 ?auto_40612 ) ) ( not ( = ?auto_40608 ?auto_40613 ) ) ( not ( = ?auto_40609 ?auto_40610 ) ) ( not ( = ?auto_40609 ?auto_40611 ) ) ( not ( = ?auto_40609 ?auto_40612 ) ) ( not ( = ?auto_40609 ?auto_40613 ) ) ( not ( = ?auto_40610 ?auto_40611 ) ) ( not ( = ?auto_40610 ?auto_40612 ) ) ( not ( = ?auto_40610 ?auto_40613 ) ) ( not ( = ?auto_40611 ?auto_40612 ) ) ( not ( = ?auto_40611 ?auto_40613 ) ) ( not ( = ?auto_40612 ?auto_40613 ) ) ( ON ?auto_40611 ?auto_40612 ) ( ON ?auto_40610 ?auto_40611 ) ( ON ?auto_40609 ?auto_40610 ) ( ON ?auto_40608 ?auto_40609 ) ( ON ?auto_40607 ?auto_40608 ) ( ON ?auto_40606 ?auto_40607 ) ( ON ?auto_40605 ?auto_40606 ) ( CLEAR ?auto_40605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40605 )
      ( MAKE-8PILE ?auto_40605 ?auto_40606 ?auto_40607 ?auto_40608 ?auto_40609 ?auto_40610 ?auto_40611 ?auto_40612 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_40622 - BLOCK
      ?auto_40623 - BLOCK
      ?auto_40624 - BLOCK
      ?auto_40625 - BLOCK
      ?auto_40626 - BLOCK
      ?auto_40627 - BLOCK
      ?auto_40628 - BLOCK
      ?auto_40629 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40629 ) ( not ( = ?auto_40622 ?auto_40623 ) ) ( not ( = ?auto_40622 ?auto_40624 ) ) ( not ( = ?auto_40622 ?auto_40625 ) ) ( not ( = ?auto_40622 ?auto_40626 ) ) ( not ( = ?auto_40622 ?auto_40627 ) ) ( not ( = ?auto_40622 ?auto_40628 ) ) ( not ( = ?auto_40622 ?auto_40629 ) ) ( not ( = ?auto_40623 ?auto_40624 ) ) ( not ( = ?auto_40623 ?auto_40625 ) ) ( not ( = ?auto_40623 ?auto_40626 ) ) ( not ( = ?auto_40623 ?auto_40627 ) ) ( not ( = ?auto_40623 ?auto_40628 ) ) ( not ( = ?auto_40623 ?auto_40629 ) ) ( not ( = ?auto_40624 ?auto_40625 ) ) ( not ( = ?auto_40624 ?auto_40626 ) ) ( not ( = ?auto_40624 ?auto_40627 ) ) ( not ( = ?auto_40624 ?auto_40628 ) ) ( not ( = ?auto_40624 ?auto_40629 ) ) ( not ( = ?auto_40625 ?auto_40626 ) ) ( not ( = ?auto_40625 ?auto_40627 ) ) ( not ( = ?auto_40625 ?auto_40628 ) ) ( not ( = ?auto_40625 ?auto_40629 ) ) ( not ( = ?auto_40626 ?auto_40627 ) ) ( not ( = ?auto_40626 ?auto_40628 ) ) ( not ( = ?auto_40626 ?auto_40629 ) ) ( not ( = ?auto_40627 ?auto_40628 ) ) ( not ( = ?auto_40627 ?auto_40629 ) ) ( not ( = ?auto_40628 ?auto_40629 ) ) ( ON ?auto_40628 ?auto_40629 ) ( ON ?auto_40627 ?auto_40628 ) ( ON ?auto_40626 ?auto_40627 ) ( ON ?auto_40625 ?auto_40626 ) ( ON ?auto_40624 ?auto_40625 ) ( ON ?auto_40623 ?auto_40624 ) ( ON ?auto_40622 ?auto_40623 ) ( CLEAR ?auto_40622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40622 )
      ( MAKE-8PILE ?auto_40622 ?auto_40623 ?auto_40624 ?auto_40625 ?auto_40626 ?auto_40627 ?auto_40628 ?auto_40629 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_40638 - BLOCK
      ?auto_40639 - BLOCK
      ?auto_40640 - BLOCK
      ?auto_40641 - BLOCK
      ?auto_40642 - BLOCK
      ?auto_40643 - BLOCK
      ?auto_40644 - BLOCK
      ?auto_40645 - BLOCK
    )
    :vars
    (
      ?auto_40646 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40638 ?auto_40639 ) ) ( not ( = ?auto_40638 ?auto_40640 ) ) ( not ( = ?auto_40638 ?auto_40641 ) ) ( not ( = ?auto_40638 ?auto_40642 ) ) ( not ( = ?auto_40638 ?auto_40643 ) ) ( not ( = ?auto_40638 ?auto_40644 ) ) ( not ( = ?auto_40638 ?auto_40645 ) ) ( not ( = ?auto_40639 ?auto_40640 ) ) ( not ( = ?auto_40639 ?auto_40641 ) ) ( not ( = ?auto_40639 ?auto_40642 ) ) ( not ( = ?auto_40639 ?auto_40643 ) ) ( not ( = ?auto_40639 ?auto_40644 ) ) ( not ( = ?auto_40639 ?auto_40645 ) ) ( not ( = ?auto_40640 ?auto_40641 ) ) ( not ( = ?auto_40640 ?auto_40642 ) ) ( not ( = ?auto_40640 ?auto_40643 ) ) ( not ( = ?auto_40640 ?auto_40644 ) ) ( not ( = ?auto_40640 ?auto_40645 ) ) ( not ( = ?auto_40641 ?auto_40642 ) ) ( not ( = ?auto_40641 ?auto_40643 ) ) ( not ( = ?auto_40641 ?auto_40644 ) ) ( not ( = ?auto_40641 ?auto_40645 ) ) ( not ( = ?auto_40642 ?auto_40643 ) ) ( not ( = ?auto_40642 ?auto_40644 ) ) ( not ( = ?auto_40642 ?auto_40645 ) ) ( not ( = ?auto_40643 ?auto_40644 ) ) ( not ( = ?auto_40643 ?auto_40645 ) ) ( not ( = ?auto_40644 ?auto_40645 ) ) ( ON ?auto_40638 ?auto_40646 ) ( not ( = ?auto_40645 ?auto_40646 ) ) ( not ( = ?auto_40644 ?auto_40646 ) ) ( not ( = ?auto_40643 ?auto_40646 ) ) ( not ( = ?auto_40642 ?auto_40646 ) ) ( not ( = ?auto_40641 ?auto_40646 ) ) ( not ( = ?auto_40640 ?auto_40646 ) ) ( not ( = ?auto_40639 ?auto_40646 ) ) ( not ( = ?auto_40638 ?auto_40646 ) ) ( ON ?auto_40639 ?auto_40638 ) ( ON ?auto_40640 ?auto_40639 ) ( ON ?auto_40641 ?auto_40640 ) ( ON ?auto_40642 ?auto_40641 ) ( ON ?auto_40643 ?auto_40642 ) ( ON ?auto_40644 ?auto_40643 ) ( ON ?auto_40645 ?auto_40644 ) ( CLEAR ?auto_40645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_40645 ?auto_40644 ?auto_40643 ?auto_40642 ?auto_40641 ?auto_40640 ?auto_40639 ?auto_40638 )
      ( MAKE-8PILE ?auto_40638 ?auto_40639 ?auto_40640 ?auto_40641 ?auto_40642 ?auto_40643 ?auto_40644 ?auto_40645 ) )
  )

)

