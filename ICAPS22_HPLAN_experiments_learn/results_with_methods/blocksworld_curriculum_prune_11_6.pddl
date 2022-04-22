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
      ?auto_119749 - BLOCK
    )
    :vars
    (
      ?auto_119750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119749 ?auto_119750 ) ( CLEAR ?auto_119749 ) ( HAND-EMPTY ) ( not ( = ?auto_119749 ?auto_119750 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_119749 ?auto_119750 )
      ( !PUTDOWN ?auto_119749 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119756 - BLOCK
      ?auto_119757 - BLOCK
    )
    :vars
    (
      ?auto_119758 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_119756 ) ( ON ?auto_119757 ?auto_119758 ) ( CLEAR ?auto_119757 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119756 ) ( not ( = ?auto_119756 ?auto_119757 ) ) ( not ( = ?auto_119756 ?auto_119758 ) ) ( not ( = ?auto_119757 ?auto_119758 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_119757 ?auto_119758 )
      ( !STACK ?auto_119757 ?auto_119756 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119766 - BLOCK
      ?auto_119767 - BLOCK
    )
    :vars
    (
      ?auto_119768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119767 ?auto_119768 ) ( not ( = ?auto_119766 ?auto_119767 ) ) ( not ( = ?auto_119766 ?auto_119768 ) ) ( not ( = ?auto_119767 ?auto_119768 ) ) ( ON ?auto_119766 ?auto_119767 ) ( CLEAR ?auto_119766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119766 )
      ( MAKE-2PILE ?auto_119766 ?auto_119767 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_119777 - BLOCK
      ?auto_119778 - BLOCK
      ?auto_119779 - BLOCK
    )
    :vars
    (
      ?auto_119780 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_119778 ) ( ON ?auto_119779 ?auto_119780 ) ( CLEAR ?auto_119779 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119777 ) ( ON ?auto_119778 ?auto_119777 ) ( not ( = ?auto_119777 ?auto_119778 ) ) ( not ( = ?auto_119777 ?auto_119779 ) ) ( not ( = ?auto_119777 ?auto_119780 ) ) ( not ( = ?auto_119778 ?auto_119779 ) ) ( not ( = ?auto_119778 ?auto_119780 ) ) ( not ( = ?auto_119779 ?auto_119780 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_119779 ?auto_119780 )
      ( !STACK ?auto_119779 ?auto_119778 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_119791 - BLOCK
      ?auto_119792 - BLOCK
      ?auto_119793 - BLOCK
    )
    :vars
    (
      ?auto_119794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119793 ?auto_119794 ) ( ON-TABLE ?auto_119791 ) ( not ( = ?auto_119791 ?auto_119792 ) ) ( not ( = ?auto_119791 ?auto_119793 ) ) ( not ( = ?auto_119791 ?auto_119794 ) ) ( not ( = ?auto_119792 ?auto_119793 ) ) ( not ( = ?auto_119792 ?auto_119794 ) ) ( not ( = ?auto_119793 ?auto_119794 ) ) ( CLEAR ?auto_119791 ) ( ON ?auto_119792 ?auto_119793 ) ( CLEAR ?auto_119792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119791 ?auto_119792 )
      ( MAKE-3PILE ?auto_119791 ?auto_119792 ?auto_119793 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_119805 - BLOCK
      ?auto_119806 - BLOCK
      ?auto_119807 - BLOCK
    )
    :vars
    (
      ?auto_119808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119807 ?auto_119808 ) ( not ( = ?auto_119805 ?auto_119806 ) ) ( not ( = ?auto_119805 ?auto_119807 ) ) ( not ( = ?auto_119805 ?auto_119808 ) ) ( not ( = ?auto_119806 ?auto_119807 ) ) ( not ( = ?auto_119806 ?auto_119808 ) ) ( not ( = ?auto_119807 ?auto_119808 ) ) ( ON ?auto_119806 ?auto_119807 ) ( ON ?auto_119805 ?auto_119806 ) ( CLEAR ?auto_119805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119805 )
      ( MAKE-3PILE ?auto_119805 ?auto_119806 ?auto_119807 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119820 - BLOCK
      ?auto_119821 - BLOCK
      ?auto_119822 - BLOCK
      ?auto_119823 - BLOCK
    )
    :vars
    (
      ?auto_119824 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_119822 ) ( ON ?auto_119823 ?auto_119824 ) ( CLEAR ?auto_119823 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119820 ) ( ON ?auto_119821 ?auto_119820 ) ( ON ?auto_119822 ?auto_119821 ) ( not ( = ?auto_119820 ?auto_119821 ) ) ( not ( = ?auto_119820 ?auto_119822 ) ) ( not ( = ?auto_119820 ?auto_119823 ) ) ( not ( = ?auto_119820 ?auto_119824 ) ) ( not ( = ?auto_119821 ?auto_119822 ) ) ( not ( = ?auto_119821 ?auto_119823 ) ) ( not ( = ?auto_119821 ?auto_119824 ) ) ( not ( = ?auto_119822 ?auto_119823 ) ) ( not ( = ?auto_119822 ?auto_119824 ) ) ( not ( = ?auto_119823 ?auto_119824 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_119823 ?auto_119824 )
      ( !STACK ?auto_119823 ?auto_119822 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119838 - BLOCK
      ?auto_119839 - BLOCK
      ?auto_119840 - BLOCK
      ?auto_119841 - BLOCK
    )
    :vars
    (
      ?auto_119842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119841 ?auto_119842 ) ( ON-TABLE ?auto_119838 ) ( ON ?auto_119839 ?auto_119838 ) ( not ( = ?auto_119838 ?auto_119839 ) ) ( not ( = ?auto_119838 ?auto_119840 ) ) ( not ( = ?auto_119838 ?auto_119841 ) ) ( not ( = ?auto_119838 ?auto_119842 ) ) ( not ( = ?auto_119839 ?auto_119840 ) ) ( not ( = ?auto_119839 ?auto_119841 ) ) ( not ( = ?auto_119839 ?auto_119842 ) ) ( not ( = ?auto_119840 ?auto_119841 ) ) ( not ( = ?auto_119840 ?auto_119842 ) ) ( not ( = ?auto_119841 ?auto_119842 ) ) ( CLEAR ?auto_119839 ) ( ON ?auto_119840 ?auto_119841 ) ( CLEAR ?auto_119840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119838 ?auto_119839 ?auto_119840 )
      ( MAKE-4PILE ?auto_119838 ?auto_119839 ?auto_119840 ?auto_119841 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119856 - BLOCK
      ?auto_119857 - BLOCK
      ?auto_119858 - BLOCK
      ?auto_119859 - BLOCK
    )
    :vars
    (
      ?auto_119860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119859 ?auto_119860 ) ( ON-TABLE ?auto_119856 ) ( not ( = ?auto_119856 ?auto_119857 ) ) ( not ( = ?auto_119856 ?auto_119858 ) ) ( not ( = ?auto_119856 ?auto_119859 ) ) ( not ( = ?auto_119856 ?auto_119860 ) ) ( not ( = ?auto_119857 ?auto_119858 ) ) ( not ( = ?auto_119857 ?auto_119859 ) ) ( not ( = ?auto_119857 ?auto_119860 ) ) ( not ( = ?auto_119858 ?auto_119859 ) ) ( not ( = ?auto_119858 ?auto_119860 ) ) ( not ( = ?auto_119859 ?auto_119860 ) ) ( ON ?auto_119858 ?auto_119859 ) ( CLEAR ?auto_119856 ) ( ON ?auto_119857 ?auto_119858 ) ( CLEAR ?auto_119857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119856 ?auto_119857 )
      ( MAKE-4PILE ?auto_119856 ?auto_119857 ?auto_119858 ?auto_119859 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119874 - BLOCK
      ?auto_119875 - BLOCK
      ?auto_119876 - BLOCK
      ?auto_119877 - BLOCK
    )
    :vars
    (
      ?auto_119878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119877 ?auto_119878 ) ( not ( = ?auto_119874 ?auto_119875 ) ) ( not ( = ?auto_119874 ?auto_119876 ) ) ( not ( = ?auto_119874 ?auto_119877 ) ) ( not ( = ?auto_119874 ?auto_119878 ) ) ( not ( = ?auto_119875 ?auto_119876 ) ) ( not ( = ?auto_119875 ?auto_119877 ) ) ( not ( = ?auto_119875 ?auto_119878 ) ) ( not ( = ?auto_119876 ?auto_119877 ) ) ( not ( = ?auto_119876 ?auto_119878 ) ) ( not ( = ?auto_119877 ?auto_119878 ) ) ( ON ?auto_119876 ?auto_119877 ) ( ON ?auto_119875 ?auto_119876 ) ( ON ?auto_119874 ?auto_119875 ) ( CLEAR ?auto_119874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119874 )
      ( MAKE-4PILE ?auto_119874 ?auto_119875 ?auto_119876 ?auto_119877 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119893 - BLOCK
      ?auto_119894 - BLOCK
      ?auto_119895 - BLOCK
      ?auto_119896 - BLOCK
      ?auto_119897 - BLOCK
    )
    :vars
    (
      ?auto_119898 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_119896 ) ( ON ?auto_119897 ?auto_119898 ) ( CLEAR ?auto_119897 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119893 ) ( ON ?auto_119894 ?auto_119893 ) ( ON ?auto_119895 ?auto_119894 ) ( ON ?auto_119896 ?auto_119895 ) ( not ( = ?auto_119893 ?auto_119894 ) ) ( not ( = ?auto_119893 ?auto_119895 ) ) ( not ( = ?auto_119893 ?auto_119896 ) ) ( not ( = ?auto_119893 ?auto_119897 ) ) ( not ( = ?auto_119893 ?auto_119898 ) ) ( not ( = ?auto_119894 ?auto_119895 ) ) ( not ( = ?auto_119894 ?auto_119896 ) ) ( not ( = ?auto_119894 ?auto_119897 ) ) ( not ( = ?auto_119894 ?auto_119898 ) ) ( not ( = ?auto_119895 ?auto_119896 ) ) ( not ( = ?auto_119895 ?auto_119897 ) ) ( not ( = ?auto_119895 ?auto_119898 ) ) ( not ( = ?auto_119896 ?auto_119897 ) ) ( not ( = ?auto_119896 ?auto_119898 ) ) ( not ( = ?auto_119897 ?auto_119898 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_119897 ?auto_119898 )
      ( !STACK ?auto_119897 ?auto_119896 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119915 - BLOCK
      ?auto_119916 - BLOCK
      ?auto_119917 - BLOCK
      ?auto_119918 - BLOCK
      ?auto_119919 - BLOCK
    )
    :vars
    (
      ?auto_119920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119919 ?auto_119920 ) ( ON-TABLE ?auto_119915 ) ( ON ?auto_119916 ?auto_119915 ) ( ON ?auto_119917 ?auto_119916 ) ( not ( = ?auto_119915 ?auto_119916 ) ) ( not ( = ?auto_119915 ?auto_119917 ) ) ( not ( = ?auto_119915 ?auto_119918 ) ) ( not ( = ?auto_119915 ?auto_119919 ) ) ( not ( = ?auto_119915 ?auto_119920 ) ) ( not ( = ?auto_119916 ?auto_119917 ) ) ( not ( = ?auto_119916 ?auto_119918 ) ) ( not ( = ?auto_119916 ?auto_119919 ) ) ( not ( = ?auto_119916 ?auto_119920 ) ) ( not ( = ?auto_119917 ?auto_119918 ) ) ( not ( = ?auto_119917 ?auto_119919 ) ) ( not ( = ?auto_119917 ?auto_119920 ) ) ( not ( = ?auto_119918 ?auto_119919 ) ) ( not ( = ?auto_119918 ?auto_119920 ) ) ( not ( = ?auto_119919 ?auto_119920 ) ) ( CLEAR ?auto_119917 ) ( ON ?auto_119918 ?auto_119919 ) ( CLEAR ?auto_119918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119915 ?auto_119916 ?auto_119917 ?auto_119918 )
      ( MAKE-5PILE ?auto_119915 ?auto_119916 ?auto_119917 ?auto_119918 ?auto_119919 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119937 - BLOCK
      ?auto_119938 - BLOCK
      ?auto_119939 - BLOCK
      ?auto_119940 - BLOCK
      ?auto_119941 - BLOCK
    )
    :vars
    (
      ?auto_119942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119941 ?auto_119942 ) ( ON-TABLE ?auto_119937 ) ( ON ?auto_119938 ?auto_119937 ) ( not ( = ?auto_119937 ?auto_119938 ) ) ( not ( = ?auto_119937 ?auto_119939 ) ) ( not ( = ?auto_119937 ?auto_119940 ) ) ( not ( = ?auto_119937 ?auto_119941 ) ) ( not ( = ?auto_119937 ?auto_119942 ) ) ( not ( = ?auto_119938 ?auto_119939 ) ) ( not ( = ?auto_119938 ?auto_119940 ) ) ( not ( = ?auto_119938 ?auto_119941 ) ) ( not ( = ?auto_119938 ?auto_119942 ) ) ( not ( = ?auto_119939 ?auto_119940 ) ) ( not ( = ?auto_119939 ?auto_119941 ) ) ( not ( = ?auto_119939 ?auto_119942 ) ) ( not ( = ?auto_119940 ?auto_119941 ) ) ( not ( = ?auto_119940 ?auto_119942 ) ) ( not ( = ?auto_119941 ?auto_119942 ) ) ( ON ?auto_119940 ?auto_119941 ) ( CLEAR ?auto_119938 ) ( ON ?auto_119939 ?auto_119940 ) ( CLEAR ?auto_119939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119937 ?auto_119938 ?auto_119939 )
      ( MAKE-5PILE ?auto_119937 ?auto_119938 ?auto_119939 ?auto_119940 ?auto_119941 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119959 - BLOCK
      ?auto_119960 - BLOCK
      ?auto_119961 - BLOCK
      ?auto_119962 - BLOCK
      ?auto_119963 - BLOCK
    )
    :vars
    (
      ?auto_119964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119963 ?auto_119964 ) ( ON-TABLE ?auto_119959 ) ( not ( = ?auto_119959 ?auto_119960 ) ) ( not ( = ?auto_119959 ?auto_119961 ) ) ( not ( = ?auto_119959 ?auto_119962 ) ) ( not ( = ?auto_119959 ?auto_119963 ) ) ( not ( = ?auto_119959 ?auto_119964 ) ) ( not ( = ?auto_119960 ?auto_119961 ) ) ( not ( = ?auto_119960 ?auto_119962 ) ) ( not ( = ?auto_119960 ?auto_119963 ) ) ( not ( = ?auto_119960 ?auto_119964 ) ) ( not ( = ?auto_119961 ?auto_119962 ) ) ( not ( = ?auto_119961 ?auto_119963 ) ) ( not ( = ?auto_119961 ?auto_119964 ) ) ( not ( = ?auto_119962 ?auto_119963 ) ) ( not ( = ?auto_119962 ?auto_119964 ) ) ( not ( = ?auto_119963 ?auto_119964 ) ) ( ON ?auto_119962 ?auto_119963 ) ( ON ?auto_119961 ?auto_119962 ) ( CLEAR ?auto_119959 ) ( ON ?auto_119960 ?auto_119961 ) ( CLEAR ?auto_119960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119959 ?auto_119960 )
      ( MAKE-5PILE ?auto_119959 ?auto_119960 ?auto_119961 ?auto_119962 ?auto_119963 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119981 - BLOCK
      ?auto_119982 - BLOCK
      ?auto_119983 - BLOCK
      ?auto_119984 - BLOCK
      ?auto_119985 - BLOCK
    )
    :vars
    (
      ?auto_119986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119985 ?auto_119986 ) ( not ( = ?auto_119981 ?auto_119982 ) ) ( not ( = ?auto_119981 ?auto_119983 ) ) ( not ( = ?auto_119981 ?auto_119984 ) ) ( not ( = ?auto_119981 ?auto_119985 ) ) ( not ( = ?auto_119981 ?auto_119986 ) ) ( not ( = ?auto_119982 ?auto_119983 ) ) ( not ( = ?auto_119982 ?auto_119984 ) ) ( not ( = ?auto_119982 ?auto_119985 ) ) ( not ( = ?auto_119982 ?auto_119986 ) ) ( not ( = ?auto_119983 ?auto_119984 ) ) ( not ( = ?auto_119983 ?auto_119985 ) ) ( not ( = ?auto_119983 ?auto_119986 ) ) ( not ( = ?auto_119984 ?auto_119985 ) ) ( not ( = ?auto_119984 ?auto_119986 ) ) ( not ( = ?auto_119985 ?auto_119986 ) ) ( ON ?auto_119984 ?auto_119985 ) ( ON ?auto_119983 ?auto_119984 ) ( ON ?auto_119982 ?auto_119983 ) ( ON ?auto_119981 ?auto_119982 ) ( CLEAR ?auto_119981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119981 )
      ( MAKE-5PILE ?auto_119981 ?auto_119982 ?auto_119983 ?auto_119984 ?auto_119985 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_120004 - BLOCK
      ?auto_120005 - BLOCK
      ?auto_120006 - BLOCK
      ?auto_120007 - BLOCK
      ?auto_120008 - BLOCK
      ?auto_120009 - BLOCK
    )
    :vars
    (
      ?auto_120010 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_120008 ) ( ON ?auto_120009 ?auto_120010 ) ( CLEAR ?auto_120009 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120004 ) ( ON ?auto_120005 ?auto_120004 ) ( ON ?auto_120006 ?auto_120005 ) ( ON ?auto_120007 ?auto_120006 ) ( ON ?auto_120008 ?auto_120007 ) ( not ( = ?auto_120004 ?auto_120005 ) ) ( not ( = ?auto_120004 ?auto_120006 ) ) ( not ( = ?auto_120004 ?auto_120007 ) ) ( not ( = ?auto_120004 ?auto_120008 ) ) ( not ( = ?auto_120004 ?auto_120009 ) ) ( not ( = ?auto_120004 ?auto_120010 ) ) ( not ( = ?auto_120005 ?auto_120006 ) ) ( not ( = ?auto_120005 ?auto_120007 ) ) ( not ( = ?auto_120005 ?auto_120008 ) ) ( not ( = ?auto_120005 ?auto_120009 ) ) ( not ( = ?auto_120005 ?auto_120010 ) ) ( not ( = ?auto_120006 ?auto_120007 ) ) ( not ( = ?auto_120006 ?auto_120008 ) ) ( not ( = ?auto_120006 ?auto_120009 ) ) ( not ( = ?auto_120006 ?auto_120010 ) ) ( not ( = ?auto_120007 ?auto_120008 ) ) ( not ( = ?auto_120007 ?auto_120009 ) ) ( not ( = ?auto_120007 ?auto_120010 ) ) ( not ( = ?auto_120008 ?auto_120009 ) ) ( not ( = ?auto_120008 ?auto_120010 ) ) ( not ( = ?auto_120009 ?auto_120010 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120009 ?auto_120010 )
      ( !STACK ?auto_120009 ?auto_120008 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_120030 - BLOCK
      ?auto_120031 - BLOCK
      ?auto_120032 - BLOCK
      ?auto_120033 - BLOCK
      ?auto_120034 - BLOCK
      ?auto_120035 - BLOCK
    )
    :vars
    (
      ?auto_120036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120035 ?auto_120036 ) ( ON-TABLE ?auto_120030 ) ( ON ?auto_120031 ?auto_120030 ) ( ON ?auto_120032 ?auto_120031 ) ( ON ?auto_120033 ?auto_120032 ) ( not ( = ?auto_120030 ?auto_120031 ) ) ( not ( = ?auto_120030 ?auto_120032 ) ) ( not ( = ?auto_120030 ?auto_120033 ) ) ( not ( = ?auto_120030 ?auto_120034 ) ) ( not ( = ?auto_120030 ?auto_120035 ) ) ( not ( = ?auto_120030 ?auto_120036 ) ) ( not ( = ?auto_120031 ?auto_120032 ) ) ( not ( = ?auto_120031 ?auto_120033 ) ) ( not ( = ?auto_120031 ?auto_120034 ) ) ( not ( = ?auto_120031 ?auto_120035 ) ) ( not ( = ?auto_120031 ?auto_120036 ) ) ( not ( = ?auto_120032 ?auto_120033 ) ) ( not ( = ?auto_120032 ?auto_120034 ) ) ( not ( = ?auto_120032 ?auto_120035 ) ) ( not ( = ?auto_120032 ?auto_120036 ) ) ( not ( = ?auto_120033 ?auto_120034 ) ) ( not ( = ?auto_120033 ?auto_120035 ) ) ( not ( = ?auto_120033 ?auto_120036 ) ) ( not ( = ?auto_120034 ?auto_120035 ) ) ( not ( = ?auto_120034 ?auto_120036 ) ) ( not ( = ?auto_120035 ?auto_120036 ) ) ( CLEAR ?auto_120033 ) ( ON ?auto_120034 ?auto_120035 ) ( CLEAR ?auto_120034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120030 ?auto_120031 ?auto_120032 ?auto_120033 ?auto_120034 )
      ( MAKE-6PILE ?auto_120030 ?auto_120031 ?auto_120032 ?auto_120033 ?auto_120034 ?auto_120035 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_120056 - BLOCK
      ?auto_120057 - BLOCK
      ?auto_120058 - BLOCK
      ?auto_120059 - BLOCK
      ?auto_120060 - BLOCK
      ?auto_120061 - BLOCK
    )
    :vars
    (
      ?auto_120062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120061 ?auto_120062 ) ( ON-TABLE ?auto_120056 ) ( ON ?auto_120057 ?auto_120056 ) ( ON ?auto_120058 ?auto_120057 ) ( not ( = ?auto_120056 ?auto_120057 ) ) ( not ( = ?auto_120056 ?auto_120058 ) ) ( not ( = ?auto_120056 ?auto_120059 ) ) ( not ( = ?auto_120056 ?auto_120060 ) ) ( not ( = ?auto_120056 ?auto_120061 ) ) ( not ( = ?auto_120056 ?auto_120062 ) ) ( not ( = ?auto_120057 ?auto_120058 ) ) ( not ( = ?auto_120057 ?auto_120059 ) ) ( not ( = ?auto_120057 ?auto_120060 ) ) ( not ( = ?auto_120057 ?auto_120061 ) ) ( not ( = ?auto_120057 ?auto_120062 ) ) ( not ( = ?auto_120058 ?auto_120059 ) ) ( not ( = ?auto_120058 ?auto_120060 ) ) ( not ( = ?auto_120058 ?auto_120061 ) ) ( not ( = ?auto_120058 ?auto_120062 ) ) ( not ( = ?auto_120059 ?auto_120060 ) ) ( not ( = ?auto_120059 ?auto_120061 ) ) ( not ( = ?auto_120059 ?auto_120062 ) ) ( not ( = ?auto_120060 ?auto_120061 ) ) ( not ( = ?auto_120060 ?auto_120062 ) ) ( not ( = ?auto_120061 ?auto_120062 ) ) ( ON ?auto_120060 ?auto_120061 ) ( CLEAR ?auto_120058 ) ( ON ?auto_120059 ?auto_120060 ) ( CLEAR ?auto_120059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120056 ?auto_120057 ?auto_120058 ?auto_120059 )
      ( MAKE-6PILE ?auto_120056 ?auto_120057 ?auto_120058 ?auto_120059 ?auto_120060 ?auto_120061 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_120082 - BLOCK
      ?auto_120083 - BLOCK
      ?auto_120084 - BLOCK
      ?auto_120085 - BLOCK
      ?auto_120086 - BLOCK
      ?auto_120087 - BLOCK
    )
    :vars
    (
      ?auto_120088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120087 ?auto_120088 ) ( ON-TABLE ?auto_120082 ) ( ON ?auto_120083 ?auto_120082 ) ( not ( = ?auto_120082 ?auto_120083 ) ) ( not ( = ?auto_120082 ?auto_120084 ) ) ( not ( = ?auto_120082 ?auto_120085 ) ) ( not ( = ?auto_120082 ?auto_120086 ) ) ( not ( = ?auto_120082 ?auto_120087 ) ) ( not ( = ?auto_120082 ?auto_120088 ) ) ( not ( = ?auto_120083 ?auto_120084 ) ) ( not ( = ?auto_120083 ?auto_120085 ) ) ( not ( = ?auto_120083 ?auto_120086 ) ) ( not ( = ?auto_120083 ?auto_120087 ) ) ( not ( = ?auto_120083 ?auto_120088 ) ) ( not ( = ?auto_120084 ?auto_120085 ) ) ( not ( = ?auto_120084 ?auto_120086 ) ) ( not ( = ?auto_120084 ?auto_120087 ) ) ( not ( = ?auto_120084 ?auto_120088 ) ) ( not ( = ?auto_120085 ?auto_120086 ) ) ( not ( = ?auto_120085 ?auto_120087 ) ) ( not ( = ?auto_120085 ?auto_120088 ) ) ( not ( = ?auto_120086 ?auto_120087 ) ) ( not ( = ?auto_120086 ?auto_120088 ) ) ( not ( = ?auto_120087 ?auto_120088 ) ) ( ON ?auto_120086 ?auto_120087 ) ( ON ?auto_120085 ?auto_120086 ) ( CLEAR ?auto_120083 ) ( ON ?auto_120084 ?auto_120085 ) ( CLEAR ?auto_120084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120082 ?auto_120083 ?auto_120084 )
      ( MAKE-6PILE ?auto_120082 ?auto_120083 ?auto_120084 ?auto_120085 ?auto_120086 ?auto_120087 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_120108 - BLOCK
      ?auto_120109 - BLOCK
      ?auto_120110 - BLOCK
      ?auto_120111 - BLOCK
      ?auto_120112 - BLOCK
      ?auto_120113 - BLOCK
    )
    :vars
    (
      ?auto_120114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120113 ?auto_120114 ) ( ON-TABLE ?auto_120108 ) ( not ( = ?auto_120108 ?auto_120109 ) ) ( not ( = ?auto_120108 ?auto_120110 ) ) ( not ( = ?auto_120108 ?auto_120111 ) ) ( not ( = ?auto_120108 ?auto_120112 ) ) ( not ( = ?auto_120108 ?auto_120113 ) ) ( not ( = ?auto_120108 ?auto_120114 ) ) ( not ( = ?auto_120109 ?auto_120110 ) ) ( not ( = ?auto_120109 ?auto_120111 ) ) ( not ( = ?auto_120109 ?auto_120112 ) ) ( not ( = ?auto_120109 ?auto_120113 ) ) ( not ( = ?auto_120109 ?auto_120114 ) ) ( not ( = ?auto_120110 ?auto_120111 ) ) ( not ( = ?auto_120110 ?auto_120112 ) ) ( not ( = ?auto_120110 ?auto_120113 ) ) ( not ( = ?auto_120110 ?auto_120114 ) ) ( not ( = ?auto_120111 ?auto_120112 ) ) ( not ( = ?auto_120111 ?auto_120113 ) ) ( not ( = ?auto_120111 ?auto_120114 ) ) ( not ( = ?auto_120112 ?auto_120113 ) ) ( not ( = ?auto_120112 ?auto_120114 ) ) ( not ( = ?auto_120113 ?auto_120114 ) ) ( ON ?auto_120112 ?auto_120113 ) ( ON ?auto_120111 ?auto_120112 ) ( ON ?auto_120110 ?auto_120111 ) ( CLEAR ?auto_120108 ) ( ON ?auto_120109 ?auto_120110 ) ( CLEAR ?auto_120109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120108 ?auto_120109 )
      ( MAKE-6PILE ?auto_120108 ?auto_120109 ?auto_120110 ?auto_120111 ?auto_120112 ?auto_120113 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_120134 - BLOCK
      ?auto_120135 - BLOCK
      ?auto_120136 - BLOCK
      ?auto_120137 - BLOCK
      ?auto_120138 - BLOCK
      ?auto_120139 - BLOCK
    )
    :vars
    (
      ?auto_120140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120139 ?auto_120140 ) ( not ( = ?auto_120134 ?auto_120135 ) ) ( not ( = ?auto_120134 ?auto_120136 ) ) ( not ( = ?auto_120134 ?auto_120137 ) ) ( not ( = ?auto_120134 ?auto_120138 ) ) ( not ( = ?auto_120134 ?auto_120139 ) ) ( not ( = ?auto_120134 ?auto_120140 ) ) ( not ( = ?auto_120135 ?auto_120136 ) ) ( not ( = ?auto_120135 ?auto_120137 ) ) ( not ( = ?auto_120135 ?auto_120138 ) ) ( not ( = ?auto_120135 ?auto_120139 ) ) ( not ( = ?auto_120135 ?auto_120140 ) ) ( not ( = ?auto_120136 ?auto_120137 ) ) ( not ( = ?auto_120136 ?auto_120138 ) ) ( not ( = ?auto_120136 ?auto_120139 ) ) ( not ( = ?auto_120136 ?auto_120140 ) ) ( not ( = ?auto_120137 ?auto_120138 ) ) ( not ( = ?auto_120137 ?auto_120139 ) ) ( not ( = ?auto_120137 ?auto_120140 ) ) ( not ( = ?auto_120138 ?auto_120139 ) ) ( not ( = ?auto_120138 ?auto_120140 ) ) ( not ( = ?auto_120139 ?auto_120140 ) ) ( ON ?auto_120138 ?auto_120139 ) ( ON ?auto_120137 ?auto_120138 ) ( ON ?auto_120136 ?auto_120137 ) ( ON ?auto_120135 ?auto_120136 ) ( ON ?auto_120134 ?auto_120135 ) ( CLEAR ?auto_120134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120134 )
      ( MAKE-6PILE ?auto_120134 ?auto_120135 ?auto_120136 ?auto_120137 ?auto_120138 ?auto_120139 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120161 - BLOCK
      ?auto_120162 - BLOCK
      ?auto_120163 - BLOCK
      ?auto_120164 - BLOCK
      ?auto_120165 - BLOCK
      ?auto_120166 - BLOCK
      ?auto_120167 - BLOCK
    )
    :vars
    (
      ?auto_120168 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_120166 ) ( ON ?auto_120167 ?auto_120168 ) ( CLEAR ?auto_120167 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120161 ) ( ON ?auto_120162 ?auto_120161 ) ( ON ?auto_120163 ?auto_120162 ) ( ON ?auto_120164 ?auto_120163 ) ( ON ?auto_120165 ?auto_120164 ) ( ON ?auto_120166 ?auto_120165 ) ( not ( = ?auto_120161 ?auto_120162 ) ) ( not ( = ?auto_120161 ?auto_120163 ) ) ( not ( = ?auto_120161 ?auto_120164 ) ) ( not ( = ?auto_120161 ?auto_120165 ) ) ( not ( = ?auto_120161 ?auto_120166 ) ) ( not ( = ?auto_120161 ?auto_120167 ) ) ( not ( = ?auto_120161 ?auto_120168 ) ) ( not ( = ?auto_120162 ?auto_120163 ) ) ( not ( = ?auto_120162 ?auto_120164 ) ) ( not ( = ?auto_120162 ?auto_120165 ) ) ( not ( = ?auto_120162 ?auto_120166 ) ) ( not ( = ?auto_120162 ?auto_120167 ) ) ( not ( = ?auto_120162 ?auto_120168 ) ) ( not ( = ?auto_120163 ?auto_120164 ) ) ( not ( = ?auto_120163 ?auto_120165 ) ) ( not ( = ?auto_120163 ?auto_120166 ) ) ( not ( = ?auto_120163 ?auto_120167 ) ) ( not ( = ?auto_120163 ?auto_120168 ) ) ( not ( = ?auto_120164 ?auto_120165 ) ) ( not ( = ?auto_120164 ?auto_120166 ) ) ( not ( = ?auto_120164 ?auto_120167 ) ) ( not ( = ?auto_120164 ?auto_120168 ) ) ( not ( = ?auto_120165 ?auto_120166 ) ) ( not ( = ?auto_120165 ?auto_120167 ) ) ( not ( = ?auto_120165 ?auto_120168 ) ) ( not ( = ?auto_120166 ?auto_120167 ) ) ( not ( = ?auto_120166 ?auto_120168 ) ) ( not ( = ?auto_120167 ?auto_120168 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120167 ?auto_120168 )
      ( !STACK ?auto_120167 ?auto_120166 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120191 - BLOCK
      ?auto_120192 - BLOCK
      ?auto_120193 - BLOCK
      ?auto_120194 - BLOCK
      ?auto_120195 - BLOCK
      ?auto_120196 - BLOCK
      ?auto_120197 - BLOCK
    )
    :vars
    (
      ?auto_120198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120197 ?auto_120198 ) ( ON-TABLE ?auto_120191 ) ( ON ?auto_120192 ?auto_120191 ) ( ON ?auto_120193 ?auto_120192 ) ( ON ?auto_120194 ?auto_120193 ) ( ON ?auto_120195 ?auto_120194 ) ( not ( = ?auto_120191 ?auto_120192 ) ) ( not ( = ?auto_120191 ?auto_120193 ) ) ( not ( = ?auto_120191 ?auto_120194 ) ) ( not ( = ?auto_120191 ?auto_120195 ) ) ( not ( = ?auto_120191 ?auto_120196 ) ) ( not ( = ?auto_120191 ?auto_120197 ) ) ( not ( = ?auto_120191 ?auto_120198 ) ) ( not ( = ?auto_120192 ?auto_120193 ) ) ( not ( = ?auto_120192 ?auto_120194 ) ) ( not ( = ?auto_120192 ?auto_120195 ) ) ( not ( = ?auto_120192 ?auto_120196 ) ) ( not ( = ?auto_120192 ?auto_120197 ) ) ( not ( = ?auto_120192 ?auto_120198 ) ) ( not ( = ?auto_120193 ?auto_120194 ) ) ( not ( = ?auto_120193 ?auto_120195 ) ) ( not ( = ?auto_120193 ?auto_120196 ) ) ( not ( = ?auto_120193 ?auto_120197 ) ) ( not ( = ?auto_120193 ?auto_120198 ) ) ( not ( = ?auto_120194 ?auto_120195 ) ) ( not ( = ?auto_120194 ?auto_120196 ) ) ( not ( = ?auto_120194 ?auto_120197 ) ) ( not ( = ?auto_120194 ?auto_120198 ) ) ( not ( = ?auto_120195 ?auto_120196 ) ) ( not ( = ?auto_120195 ?auto_120197 ) ) ( not ( = ?auto_120195 ?auto_120198 ) ) ( not ( = ?auto_120196 ?auto_120197 ) ) ( not ( = ?auto_120196 ?auto_120198 ) ) ( not ( = ?auto_120197 ?auto_120198 ) ) ( CLEAR ?auto_120195 ) ( ON ?auto_120196 ?auto_120197 ) ( CLEAR ?auto_120196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120191 ?auto_120192 ?auto_120193 ?auto_120194 ?auto_120195 ?auto_120196 )
      ( MAKE-7PILE ?auto_120191 ?auto_120192 ?auto_120193 ?auto_120194 ?auto_120195 ?auto_120196 ?auto_120197 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120221 - BLOCK
      ?auto_120222 - BLOCK
      ?auto_120223 - BLOCK
      ?auto_120224 - BLOCK
      ?auto_120225 - BLOCK
      ?auto_120226 - BLOCK
      ?auto_120227 - BLOCK
    )
    :vars
    (
      ?auto_120228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120227 ?auto_120228 ) ( ON-TABLE ?auto_120221 ) ( ON ?auto_120222 ?auto_120221 ) ( ON ?auto_120223 ?auto_120222 ) ( ON ?auto_120224 ?auto_120223 ) ( not ( = ?auto_120221 ?auto_120222 ) ) ( not ( = ?auto_120221 ?auto_120223 ) ) ( not ( = ?auto_120221 ?auto_120224 ) ) ( not ( = ?auto_120221 ?auto_120225 ) ) ( not ( = ?auto_120221 ?auto_120226 ) ) ( not ( = ?auto_120221 ?auto_120227 ) ) ( not ( = ?auto_120221 ?auto_120228 ) ) ( not ( = ?auto_120222 ?auto_120223 ) ) ( not ( = ?auto_120222 ?auto_120224 ) ) ( not ( = ?auto_120222 ?auto_120225 ) ) ( not ( = ?auto_120222 ?auto_120226 ) ) ( not ( = ?auto_120222 ?auto_120227 ) ) ( not ( = ?auto_120222 ?auto_120228 ) ) ( not ( = ?auto_120223 ?auto_120224 ) ) ( not ( = ?auto_120223 ?auto_120225 ) ) ( not ( = ?auto_120223 ?auto_120226 ) ) ( not ( = ?auto_120223 ?auto_120227 ) ) ( not ( = ?auto_120223 ?auto_120228 ) ) ( not ( = ?auto_120224 ?auto_120225 ) ) ( not ( = ?auto_120224 ?auto_120226 ) ) ( not ( = ?auto_120224 ?auto_120227 ) ) ( not ( = ?auto_120224 ?auto_120228 ) ) ( not ( = ?auto_120225 ?auto_120226 ) ) ( not ( = ?auto_120225 ?auto_120227 ) ) ( not ( = ?auto_120225 ?auto_120228 ) ) ( not ( = ?auto_120226 ?auto_120227 ) ) ( not ( = ?auto_120226 ?auto_120228 ) ) ( not ( = ?auto_120227 ?auto_120228 ) ) ( ON ?auto_120226 ?auto_120227 ) ( CLEAR ?auto_120224 ) ( ON ?auto_120225 ?auto_120226 ) ( CLEAR ?auto_120225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120221 ?auto_120222 ?auto_120223 ?auto_120224 ?auto_120225 )
      ( MAKE-7PILE ?auto_120221 ?auto_120222 ?auto_120223 ?auto_120224 ?auto_120225 ?auto_120226 ?auto_120227 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120251 - BLOCK
      ?auto_120252 - BLOCK
      ?auto_120253 - BLOCK
      ?auto_120254 - BLOCK
      ?auto_120255 - BLOCK
      ?auto_120256 - BLOCK
      ?auto_120257 - BLOCK
    )
    :vars
    (
      ?auto_120258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120257 ?auto_120258 ) ( ON-TABLE ?auto_120251 ) ( ON ?auto_120252 ?auto_120251 ) ( ON ?auto_120253 ?auto_120252 ) ( not ( = ?auto_120251 ?auto_120252 ) ) ( not ( = ?auto_120251 ?auto_120253 ) ) ( not ( = ?auto_120251 ?auto_120254 ) ) ( not ( = ?auto_120251 ?auto_120255 ) ) ( not ( = ?auto_120251 ?auto_120256 ) ) ( not ( = ?auto_120251 ?auto_120257 ) ) ( not ( = ?auto_120251 ?auto_120258 ) ) ( not ( = ?auto_120252 ?auto_120253 ) ) ( not ( = ?auto_120252 ?auto_120254 ) ) ( not ( = ?auto_120252 ?auto_120255 ) ) ( not ( = ?auto_120252 ?auto_120256 ) ) ( not ( = ?auto_120252 ?auto_120257 ) ) ( not ( = ?auto_120252 ?auto_120258 ) ) ( not ( = ?auto_120253 ?auto_120254 ) ) ( not ( = ?auto_120253 ?auto_120255 ) ) ( not ( = ?auto_120253 ?auto_120256 ) ) ( not ( = ?auto_120253 ?auto_120257 ) ) ( not ( = ?auto_120253 ?auto_120258 ) ) ( not ( = ?auto_120254 ?auto_120255 ) ) ( not ( = ?auto_120254 ?auto_120256 ) ) ( not ( = ?auto_120254 ?auto_120257 ) ) ( not ( = ?auto_120254 ?auto_120258 ) ) ( not ( = ?auto_120255 ?auto_120256 ) ) ( not ( = ?auto_120255 ?auto_120257 ) ) ( not ( = ?auto_120255 ?auto_120258 ) ) ( not ( = ?auto_120256 ?auto_120257 ) ) ( not ( = ?auto_120256 ?auto_120258 ) ) ( not ( = ?auto_120257 ?auto_120258 ) ) ( ON ?auto_120256 ?auto_120257 ) ( ON ?auto_120255 ?auto_120256 ) ( CLEAR ?auto_120253 ) ( ON ?auto_120254 ?auto_120255 ) ( CLEAR ?auto_120254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120251 ?auto_120252 ?auto_120253 ?auto_120254 )
      ( MAKE-7PILE ?auto_120251 ?auto_120252 ?auto_120253 ?auto_120254 ?auto_120255 ?auto_120256 ?auto_120257 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120281 - BLOCK
      ?auto_120282 - BLOCK
      ?auto_120283 - BLOCK
      ?auto_120284 - BLOCK
      ?auto_120285 - BLOCK
      ?auto_120286 - BLOCK
      ?auto_120287 - BLOCK
    )
    :vars
    (
      ?auto_120288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120287 ?auto_120288 ) ( ON-TABLE ?auto_120281 ) ( ON ?auto_120282 ?auto_120281 ) ( not ( = ?auto_120281 ?auto_120282 ) ) ( not ( = ?auto_120281 ?auto_120283 ) ) ( not ( = ?auto_120281 ?auto_120284 ) ) ( not ( = ?auto_120281 ?auto_120285 ) ) ( not ( = ?auto_120281 ?auto_120286 ) ) ( not ( = ?auto_120281 ?auto_120287 ) ) ( not ( = ?auto_120281 ?auto_120288 ) ) ( not ( = ?auto_120282 ?auto_120283 ) ) ( not ( = ?auto_120282 ?auto_120284 ) ) ( not ( = ?auto_120282 ?auto_120285 ) ) ( not ( = ?auto_120282 ?auto_120286 ) ) ( not ( = ?auto_120282 ?auto_120287 ) ) ( not ( = ?auto_120282 ?auto_120288 ) ) ( not ( = ?auto_120283 ?auto_120284 ) ) ( not ( = ?auto_120283 ?auto_120285 ) ) ( not ( = ?auto_120283 ?auto_120286 ) ) ( not ( = ?auto_120283 ?auto_120287 ) ) ( not ( = ?auto_120283 ?auto_120288 ) ) ( not ( = ?auto_120284 ?auto_120285 ) ) ( not ( = ?auto_120284 ?auto_120286 ) ) ( not ( = ?auto_120284 ?auto_120287 ) ) ( not ( = ?auto_120284 ?auto_120288 ) ) ( not ( = ?auto_120285 ?auto_120286 ) ) ( not ( = ?auto_120285 ?auto_120287 ) ) ( not ( = ?auto_120285 ?auto_120288 ) ) ( not ( = ?auto_120286 ?auto_120287 ) ) ( not ( = ?auto_120286 ?auto_120288 ) ) ( not ( = ?auto_120287 ?auto_120288 ) ) ( ON ?auto_120286 ?auto_120287 ) ( ON ?auto_120285 ?auto_120286 ) ( ON ?auto_120284 ?auto_120285 ) ( CLEAR ?auto_120282 ) ( ON ?auto_120283 ?auto_120284 ) ( CLEAR ?auto_120283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120281 ?auto_120282 ?auto_120283 )
      ( MAKE-7PILE ?auto_120281 ?auto_120282 ?auto_120283 ?auto_120284 ?auto_120285 ?auto_120286 ?auto_120287 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120311 - BLOCK
      ?auto_120312 - BLOCK
      ?auto_120313 - BLOCK
      ?auto_120314 - BLOCK
      ?auto_120315 - BLOCK
      ?auto_120316 - BLOCK
      ?auto_120317 - BLOCK
    )
    :vars
    (
      ?auto_120318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120317 ?auto_120318 ) ( ON-TABLE ?auto_120311 ) ( not ( = ?auto_120311 ?auto_120312 ) ) ( not ( = ?auto_120311 ?auto_120313 ) ) ( not ( = ?auto_120311 ?auto_120314 ) ) ( not ( = ?auto_120311 ?auto_120315 ) ) ( not ( = ?auto_120311 ?auto_120316 ) ) ( not ( = ?auto_120311 ?auto_120317 ) ) ( not ( = ?auto_120311 ?auto_120318 ) ) ( not ( = ?auto_120312 ?auto_120313 ) ) ( not ( = ?auto_120312 ?auto_120314 ) ) ( not ( = ?auto_120312 ?auto_120315 ) ) ( not ( = ?auto_120312 ?auto_120316 ) ) ( not ( = ?auto_120312 ?auto_120317 ) ) ( not ( = ?auto_120312 ?auto_120318 ) ) ( not ( = ?auto_120313 ?auto_120314 ) ) ( not ( = ?auto_120313 ?auto_120315 ) ) ( not ( = ?auto_120313 ?auto_120316 ) ) ( not ( = ?auto_120313 ?auto_120317 ) ) ( not ( = ?auto_120313 ?auto_120318 ) ) ( not ( = ?auto_120314 ?auto_120315 ) ) ( not ( = ?auto_120314 ?auto_120316 ) ) ( not ( = ?auto_120314 ?auto_120317 ) ) ( not ( = ?auto_120314 ?auto_120318 ) ) ( not ( = ?auto_120315 ?auto_120316 ) ) ( not ( = ?auto_120315 ?auto_120317 ) ) ( not ( = ?auto_120315 ?auto_120318 ) ) ( not ( = ?auto_120316 ?auto_120317 ) ) ( not ( = ?auto_120316 ?auto_120318 ) ) ( not ( = ?auto_120317 ?auto_120318 ) ) ( ON ?auto_120316 ?auto_120317 ) ( ON ?auto_120315 ?auto_120316 ) ( ON ?auto_120314 ?auto_120315 ) ( ON ?auto_120313 ?auto_120314 ) ( CLEAR ?auto_120311 ) ( ON ?auto_120312 ?auto_120313 ) ( CLEAR ?auto_120312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120311 ?auto_120312 )
      ( MAKE-7PILE ?auto_120311 ?auto_120312 ?auto_120313 ?auto_120314 ?auto_120315 ?auto_120316 ?auto_120317 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120341 - BLOCK
      ?auto_120342 - BLOCK
      ?auto_120343 - BLOCK
      ?auto_120344 - BLOCK
      ?auto_120345 - BLOCK
      ?auto_120346 - BLOCK
      ?auto_120347 - BLOCK
    )
    :vars
    (
      ?auto_120348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120347 ?auto_120348 ) ( not ( = ?auto_120341 ?auto_120342 ) ) ( not ( = ?auto_120341 ?auto_120343 ) ) ( not ( = ?auto_120341 ?auto_120344 ) ) ( not ( = ?auto_120341 ?auto_120345 ) ) ( not ( = ?auto_120341 ?auto_120346 ) ) ( not ( = ?auto_120341 ?auto_120347 ) ) ( not ( = ?auto_120341 ?auto_120348 ) ) ( not ( = ?auto_120342 ?auto_120343 ) ) ( not ( = ?auto_120342 ?auto_120344 ) ) ( not ( = ?auto_120342 ?auto_120345 ) ) ( not ( = ?auto_120342 ?auto_120346 ) ) ( not ( = ?auto_120342 ?auto_120347 ) ) ( not ( = ?auto_120342 ?auto_120348 ) ) ( not ( = ?auto_120343 ?auto_120344 ) ) ( not ( = ?auto_120343 ?auto_120345 ) ) ( not ( = ?auto_120343 ?auto_120346 ) ) ( not ( = ?auto_120343 ?auto_120347 ) ) ( not ( = ?auto_120343 ?auto_120348 ) ) ( not ( = ?auto_120344 ?auto_120345 ) ) ( not ( = ?auto_120344 ?auto_120346 ) ) ( not ( = ?auto_120344 ?auto_120347 ) ) ( not ( = ?auto_120344 ?auto_120348 ) ) ( not ( = ?auto_120345 ?auto_120346 ) ) ( not ( = ?auto_120345 ?auto_120347 ) ) ( not ( = ?auto_120345 ?auto_120348 ) ) ( not ( = ?auto_120346 ?auto_120347 ) ) ( not ( = ?auto_120346 ?auto_120348 ) ) ( not ( = ?auto_120347 ?auto_120348 ) ) ( ON ?auto_120346 ?auto_120347 ) ( ON ?auto_120345 ?auto_120346 ) ( ON ?auto_120344 ?auto_120345 ) ( ON ?auto_120343 ?auto_120344 ) ( ON ?auto_120342 ?auto_120343 ) ( ON ?auto_120341 ?auto_120342 ) ( CLEAR ?auto_120341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120341 )
      ( MAKE-7PILE ?auto_120341 ?auto_120342 ?auto_120343 ?auto_120344 ?auto_120345 ?auto_120346 ?auto_120347 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120372 - BLOCK
      ?auto_120373 - BLOCK
      ?auto_120374 - BLOCK
      ?auto_120375 - BLOCK
      ?auto_120376 - BLOCK
      ?auto_120377 - BLOCK
      ?auto_120378 - BLOCK
      ?auto_120379 - BLOCK
    )
    :vars
    (
      ?auto_120380 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_120378 ) ( ON ?auto_120379 ?auto_120380 ) ( CLEAR ?auto_120379 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120372 ) ( ON ?auto_120373 ?auto_120372 ) ( ON ?auto_120374 ?auto_120373 ) ( ON ?auto_120375 ?auto_120374 ) ( ON ?auto_120376 ?auto_120375 ) ( ON ?auto_120377 ?auto_120376 ) ( ON ?auto_120378 ?auto_120377 ) ( not ( = ?auto_120372 ?auto_120373 ) ) ( not ( = ?auto_120372 ?auto_120374 ) ) ( not ( = ?auto_120372 ?auto_120375 ) ) ( not ( = ?auto_120372 ?auto_120376 ) ) ( not ( = ?auto_120372 ?auto_120377 ) ) ( not ( = ?auto_120372 ?auto_120378 ) ) ( not ( = ?auto_120372 ?auto_120379 ) ) ( not ( = ?auto_120372 ?auto_120380 ) ) ( not ( = ?auto_120373 ?auto_120374 ) ) ( not ( = ?auto_120373 ?auto_120375 ) ) ( not ( = ?auto_120373 ?auto_120376 ) ) ( not ( = ?auto_120373 ?auto_120377 ) ) ( not ( = ?auto_120373 ?auto_120378 ) ) ( not ( = ?auto_120373 ?auto_120379 ) ) ( not ( = ?auto_120373 ?auto_120380 ) ) ( not ( = ?auto_120374 ?auto_120375 ) ) ( not ( = ?auto_120374 ?auto_120376 ) ) ( not ( = ?auto_120374 ?auto_120377 ) ) ( not ( = ?auto_120374 ?auto_120378 ) ) ( not ( = ?auto_120374 ?auto_120379 ) ) ( not ( = ?auto_120374 ?auto_120380 ) ) ( not ( = ?auto_120375 ?auto_120376 ) ) ( not ( = ?auto_120375 ?auto_120377 ) ) ( not ( = ?auto_120375 ?auto_120378 ) ) ( not ( = ?auto_120375 ?auto_120379 ) ) ( not ( = ?auto_120375 ?auto_120380 ) ) ( not ( = ?auto_120376 ?auto_120377 ) ) ( not ( = ?auto_120376 ?auto_120378 ) ) ( not ( = ?auto_120376 ?auto_120379 ) ) ( not ( = ?auto_120376 ?auto_120380 ) ) ( not ( = ?auto_120377 ?auto_120378 ) ) ( not ( = ?auto_120377 ?auto_120379 ) ) ( not ( = ?auto_120377 ?auto_120380 ) ) ( not ( = ?auto_120378 ?auto_120379 ) ) ( not ( = ?auto_120378 ?auto_120380 ) ) ( not ( = ?auto_120379 ?auto_120380 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120379 ?auto_120380 )
      ( !STACK ?auto_120379 ?auto_120378 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120406 - BLOCK
      ?auto_120407 - BLOCK
      ?auto_120408 - BLOCK
      ?auto_120409 - BLOCK
      ?auto_120410 - BLOCK
      ?auto_120411 - BLOCK
      ?auto_120412 - BLOCK
      ?auto_120413 - BLOCK
    )
    :vars
    (
      ?auto_120414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120413 ?auto_120414 ) ( ON-TABLE ?auto_120406 ) ( ON ?auto_120407 ?auto_120406 ) ( ON ?auto_120408 ?auto_120407 ) ( ON ?auto_120409 ?auto_120408 ) ( ON ?auto_120410 ?auto_120409 ) ( ON ?auto_120411 ?auto_120410 ) ( not ( = ?auto_120406 ?auto_120407 ) ) ( not ( = ?auto_120406 ?auto_120408 ) ) ( not ( = ?auto_120406 ?auto_120409 ) ) ( not ( = ?auto_120406 ?auto_120410 ) ) ( not ( = ?auto_120406 ?auto_120411 ) ) ( not ( = ?auto_120406 ?auto_120412 ) ) ( not ( = ?auto_120406 ?auto_120413 ) ) ( not ( = ?auto_120406 ?auto_120414 ) ) ( not ( = ?auto_120407 ?auto_120408 ) ) ( not ( = ?auto_120407 ?auto_120409 ) ) ( not ( = ?auto_120407 ?auto_120410 ) ) ( not ( = ?auto_120407 ?auto_120411 ) ) ( not ( = ?auto_120407 ?auto_120412 ) ) ( not ( = ?auto_120407 ?auto_120413 ) ) ( not ( = ?auto_120407 ?auto_120414 ) ) ( not ( = ?auto_120408 ?auto_120409 ) ) ( not ( = ?auto_120408 ?auto_120410 ) ) ( not ( = ?auto_120408 ?auto_120411 ) ) ( not ( = ?auto_120408 ?auto_120412 ) ) ( not ( = ?auto_120408 ?auto_120413 ) ) ( not ( = ?auto_120408 ?auto_120414 ) ) ( not ( = ?auto_120409 ?auto_120410 ) ) ( not ( = ?auto_120409 ?auto_120411 ) ) ( not ( = ?auto_120409 ?auto_120412 ) ) ( not ( = ?auto_120409 ?auto_120413 ) ) ( not ( = ?auto_120409 ?auto_120414 ) ) ( not ( = ?auto_120410 ?auto_120411 ) ) ( not ( = ?auto_120410 ?auto_120412 ) ) ( not ( = ?auto_120410 ?auto_120413 ) ) ( not ( = ?auto_120410 ?auto_120414 ) ) ( not ( = ?auto_120411 ?auto_120412 ) ) ( not ( = ?auto_120411 ?auto_120413 ) ) ( not ( = ?auto_120411 ?auto_120414 ) ) ( not ( = ?auto_120412 ?auto_120413 ) ) ( not ( = ?auto_120412 ?auto_120414 ) ) ( not ( = ?auto_120413 ?auto_120414 ) ) ( CLEAR ?auto_120411 ) ( ON ?auto_120412 ?auto_120413 ) ( CLEAR ?auto_120412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_120406 ?auto_120407 ?auto_120408 ?auto_120409 ?auto_120410 ?auto_120411 ?auto_120412 )
      ( MAKE-8PILE ?auto_120406 ?auto_120407 ?auto_120408 ?auto_120409 ?auto_120410 ?auto_120411 ?auto_120412 ?auto_120413 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120440 - BLOCK
      ?auto_120441 - BLOCK
      ?auto_120442 - BLOCK
      ?auto_120443 - BLOCK
      ?auto_120444 - BLOCK
      ?auto_120445 - BLOCK
      ?auto_120446 - BLOCK
      ?auto_120447 - BLOCK
    )
    :vars
    (
      ?auto_120448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120447 ?auto_120448 ) ( ON-TABLE ?auto_120440 ) ( ON ?auto_120441 ?auto_120440 ) ( ON ?auto_120442 ?auto_120441 ) ( ON ?auto_120443 ?auto_120442 ) ( ON ?auto_120444 ?auto_120443 ) ( not ( = ?auto_120440 ?auto_120441 ) ) ( not ( = ?auto_120440 ?auto_120442 ) ) ( not ( = ?auto_120440 ?auto_120443 ) ) ( not ( = ?auto_120440 ?auto_120444 ) ) ( not ( = ?auto_120440 ?auto_120445 ) ) ( not ( = ?auto_120440 ?auto_120446 ) ) ( not ( = ?auto_120440 ?auto_120447 ) ) ( not ( = ?auto_120440 ?auto_120448 ) ) ( not ( = ?auto_120441 ?auto_120442 ) ) ( not ( = ?auto_120441 ?auto_120443 ) ) ( not ( = ?auto_120441 ?auto_120444 ) ) ( not ( = ?auto_120441 ?auto_120445 ) ) ( not ( = ?auto_120441 ?auto_120446 ) ) ( not ( = ?auto_120441 ?auto_120447 ) ) ( not ( = ?auto_120441 ?auto_120448 ) ) ( not ( = ?auto_120442 ?auto_120443 ) ) ( not ( = ?auto_120442 ?auto_120444 ) ) ( not ( = ?auto_120442 ?auto_120445 ) ) ( not ( = ?auto_120442 ?auto_120446 ) ) ( not ( = ?auto_120442 ?auto_120447 ) ) ( not ( = ?auto_120442 ?auto_120448 ) ) ( not ( = ?auto_120443 ?auto_120444 ) ) ( not ( = ?auto_120443 ?auto_120445 ) ) ( not ( = ?auto_120443 ?auto_120446 ) ) ( not ( = ?auto_120443 ?auto_120447 ) ) ( not ( = ?auto_120443 ?auto_120448 ) ) ( not ( = ?auto_120444 ?auto_120445 ) ) ( not ( = ?auto_120444 ?auto_120446 ) ) ( not ( = ?auto_120444 ?auto_120447 ) ) ( not ( = ?auto_120444 ?auto_120448 ) ) ( not ( = ?auto_120445 ?auto_120446 ) ) ( not ( = ?auto_120445 ?auto_120447 ) ) ( not ( = ?auto_120445 ?auto_120448 ) ) ( not ( = ?auto_120446 ?auto_120447 ) ) ( not ( = ?auto_120446 ?auto_120448 ) ) ( not ( = ?auto_120447 ?auto_120448 ) ) ( ON ?auto_120446 ?auto_120447 ) ( CLEAR ?auto_120444 ) ( ON ?auto_120445 ?auto_120446 ) ( CLEAR ?auto_120445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120440 ?auto_120441 ?auto_120442 ?auto_120443 ?auto_120444 ?auto_120445 )
      ( MAKE-8PILE ?auto_120440 ?auto_120441 ?auto_120442 ?auto_120443 ?auto_120444 ?auto_120445 ?auto_120446 ?auto_120447 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120474 - BLOCK
      ?auto_120475 - BLOCK
      ?auto_120476 - BLOCK
      ?auto_120477 - BLOCK
      ?auto_120478 - BLOCK
      ?auto_120479 - BLOCK
      ?auto_120480 - BLOCK
      ?auto_120481 - BLOCK
    )
    :vars
    (
      ?auto_120482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120481 ?auto_120482 ) ( ON-TABLE ?auto_120474 ) ( ON ?auto_120475 ?auto_120474 ) ( ON ?auto_120476 ?auto_120475 ) ( ON ?auto_120477 ?auto_120476 ) ( not ( = ?auto_120474 ?auto_120475 ) ) ( not ( = ?auto_120474 ?auto_120476 ) ) ( not ( = ?auto_120474 ?auto_120477 ) ) ( not ( = ?auto_120474 ?auto_120478 ) ) ( not ( = ?auto_120474 ?auto_120479 ) ) ( not ( = ?auto_120474 ?auto_120480 ) ) ( not ( = ?auto_120474 ?auto_120481 ) ) ( not ( = ?auto_120474 ?auto_120482 ) ) ( not ( = ?auto_120475 ?auto_120476 ) ) ( not ( = ?auto_120475 ?auto_120477 ) ) ( not ( = ?auto_120475 ?auto_120478 ) ) ( not ( = ?auto_120475 ?auto_120479 ) ) ( not ( = ?auto_120475 ?auto_120480 ) ) ( not ( = ?auto_120475 ?auto_120481 ) ) ( not ( = ?auto_120475 ?auto_120482 ) ) ( not ( = ?auto_120476 ?auto_120477 ) ) ( not ( = ?auto_120476 ?auto_120478 ) ) ( not ( = ?auto_120476 ?auto_120479 ) ) ( not ( = ?auto_120476 ?auto_120480 ) ) ( not ( = ?auto_120476 ?auto_120481 ) ) ( not ( = ?auto_120476 ?auto_120482 ) ) ( not ( = ?auto_120477 ?auto_120478 ) ) ( not ( = ?auto_120477 ?auto_120479 ) ) ( not ( = ?auto_120477 ?auto_120480 ) ) ( not ( = ?auto_120477 ?auto_120481 ) ) ( not ( = ?auto_120477 ?auto_120482 ) ) ( not ( = ?auto_120478 ?auto_120479 ) ) ( not ( = ?auto_120478 ?auto_120480 ) ) ( not ( = ?auto_120478 ?auto_120481 ) ) ( not ( = ?auto_120478 ?auto_120482 ) ) ( not ( = ?auto_120479 ?auto_120480 ) ) ( not ( = ?auto_120479 ?auto_120481 ) ) ( not ( = ?auto_120479 ?auto_120482 ) ) ( not ( = ?auto_120480 ?auto_120481 ) ) ( not ( = ?auto_120480 ?auto_120482 ) ) ( not ( = ?auto_120481 ?auto_120482 ) ) ( ON ?auto_120480 ?auto_120481 ) ( ON ?auto_120479 ?auto_120480 ) ( CLEAR ?auto_120477 ) ( ON ?auto_120478 ?auto_120479 ) ( CLEAR ?auto_120478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120474 ?auto_120475 ?auto_120476 ?auto_120477 ?auto_120478 )
      ( MAKE-8PILE ?auto_120474 ?auto_120475 ?auto_120476 ?auto_120477 ?auto_120478 ?auto_120479 ?auto_120480 ?auto_120481 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120508 - BLOCK
      ?auto_120509 - BLOCK
      ?auto_120510 - BLOCK
      ?auto_120511 - BLOCK
      ?auto_120512 - BLOCK
      ?auto_120513 - BLOCK
      ?auto_120514 - BLOCK
      ?auto_120515 - BLOCK
    )
    :vars
    (
      ?auto_120516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120515 ?auto_120516 ) ( ON-TABLE ?auto_120508 ) ( ON ?auto_120509 ?auto_120508 ) ( ON ?auto_120510 ?auto_120509 ) ( not ( = ?auto_120508 ?auto_120509 ) ) ( not ( = ?auto_120508 ?auto_120510 ) ) ( not ( = ?auto_120508 ?auto_120511 ) ) ( not ( = ?auto_120508 ?auto_120512 ) ) ( not ( = ?auto_120508 ?auto_120513 ) ) ( not ( = ?auto_120508 ?auto_120514 ) ) ( not ( = ?auto_120508 ?auto_120515 ) ) ( not ( = ?auto_120508 ?auto_120516 ) ) ( not ( = ?auto_120509 ?auto_120510 ) ) ( not ( = ?auto_120509 ?auto_120511 ) ) ( not ( = ?auto_120509 ?auto_120512 ) ) ( not ( = ?auto_120509 ?auto_120513 ) ) ( not ( = ?auto_120509 ?auto_120514 ) ) ( not ( = ?auto_120509 ?auto_120515 ) ) ( not ( = ?auto_120509 ?auto_120516 ) ) ( not ( = ?auto_120510 ?auto_120511 ) ) ( not ( = ?auto_120510 ?auto_120512 ) ) ( not ( = ?auto_120510 ?auto_120513 ) ) ( not ( = ?auto_120510 ?auto_120514 ) ) ( not ( = ?auto_120510 ?auto_120515 ) ) ( not ( = ?auto_120510 ?auto_120516 ) ) ( not ( = ?auto_120511 ?auto_120512 ) ) ( not ( = ?auto_120511 ?auto_120513 ) ) ( not ( = ?auto_120511 ?auto_120514 ) ) ( not ( = ?auto_120511 ?auto_120515 ) ) ( not ( = ?auto_120511 ?auto_120516 ) ) ( not ( = ?auto_120512 ?auto_120513 ) ) ( not ( = ?auto_120512 ?auto_120514 ) ) ( not ( = ?auto_120512 ?auto_120515 ) ) ( not ( = ?auto_120512 ?auto_120516 ) ) ( not ( = ?auto_120513 ?auto_120514 ) ) ( not ( = ?auto_120513 ?auto_120515 ) ) ( not ( = ?auto_120513 ?auto_120516 ) ) ( not ( = ?auto_120514 ?auto_120515 ) ) ( not ( = ?auto_120514 ?auto_120516 ) ) ( not ( = ?auto_120515 ?auto_120516 ) ) ( ON ?auto_120514 ?auto_120515 ) ( ON ?auto_120513 ?auto_120514 ) ( ON ?auto_120512 ?auto_120513 ) ( CLEAR ?auto_120510 ) ( ON ?auto_120511 ?auto_120512 ) ( CLEAR ?auto_120511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120508 ?auto_120509 ?auto_120510 ?auto_120511 )
      ( MAKE-8PILE ?auto_120508 ?auto_120509 ?auto_120510 ?auto_120511 ?auto_120512 ?auto_120513 ?auto_120514 ?auto_120515 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120542 - BLOCK
      ?auto_120543 - BLOCK
      ?auto_120544 - BLOCK
      ?auto_120545 - BLOCK
      ?auto_120546 - BLOCK
      ?auto_120547 - BLOCK
      ?auto_120548 - BLOCK
      ?auto_120549 - BLOCK
    )
    :vars
    (
      ?auto_120550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120549 ?auto_120550 ) ( ON-TABLE ?auto_120542 ) ( ON ?auto_120543 ?auto_120542 ) ( not ( = ?auto_120542 ?auto_120543 ) ) ( not ( = ?auto_120542 ?auto_120544 ) ) ( not ( = ?auto_120542 ?auto_120545 ) ) ( not ( = ?auto_120542 ?auto_120546 ) ) ( not ( = ?auto_120542 ?auto_120547 ) ) ( not ( = ?auto_120542 ?auto_120548 ) ) ( not ( = ?auto_120542 ?auto_120549 ) ) ( not ( = ?auto_120542 ?auto_120550 ) ) ( not ( = ?auto_120543 ?auto_120544 ) ) ( not ( = ?auto_120543 ?auto_120545 ) ) ( not ( = ?auto_120543 ?auto_120546 ) ) ( not ( = ?auto_120543 ?auto_120547 ) ) ( not ( = ?auto_120543 ?auto_120548 ) ) ( not ( = ?auto_120543 ?auto_120549 ) ) ( not ( = ?auto_120543 ?auto_120550 ) ) ( not ( = ?auto_120544 ?auto_120545 ) ) ( not ( = ?auto_120544 ?auto_120546 ) ) ( not ( = ?auto_120544 ?auto_120547 ) ) ( not ( = ?auto_120544 ?auto_120548 ) ) ( not ( = ?auto_120544 ?auto_120549 ) ) ( not ( = ?auto_120544 ?auto_120550 ) ) ( not ( = ?auto_120545 ?auto_120546 ) ) ( not ( = ?auto_120545 ?auto_120547 ) ) ( not ( = ?auto_120545 ?auto_120548 ) ) ( not ( = ?auto_120545 ?auto_120549 ) ) ( not ( = ?auto_120545 ?auto_120550 ) ) ( not ( = ?auto_120546 ?auto_120547 ) ) ( not ( = ?auto_120546 ?auto_120548 ) ) ( not ( = ?auto_120546 ?auto_120549 ) ) ( not ( = ?auto_120546 ?auto_120550 ) ) ( not ( = ?auto_120547 ?auto_120548 ) ) ( not ( = ?auto_120547 ?auto_120549 ) ) ( not ( = ?auto_120547 ?auto_120550 ) ) ( not ( = ?auto_120548 ?auto_120549 ) ) ( not ( = ?auto_120548 ?auto_120550 ) ) ( not ( = ?auto_120549 ?auto_120550 ) ) ( ON ?auto_120548 ?auto_120549 ) ( ON ?auto_120547 ?auto_120548 ) ( ON ?auto_120546 ?auto_120547 ) ( ON ?auto_120545 ?auto_120546 ) ( CLEAR ?auto_120543 ) ( ON ?auto_120544 ?auto_120545 ) ( CLEAR ?auto_120544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120542 ?auto_120543 ?auto_120544 )
      ( MAKE-8PILE ?auto_120542 ?auto_120543 ?auto_120544 ?auto_120545 ?auto_120546 ?auto_120547 ?auto_120548 ?auto_120549 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120576 - BLOCK
      ?auto_120577 - BLOCK
      ?auto_120578 - BLOCK
      ?auto_120579 - BLOCK
      ?auto_120580 - BLOCK
      ?auto_120581 - BLOCK
      ?auto_120582 - BLOCK
      ?auto_120583 - BLOCK
    )
    :vars
    (
      ?auto_120584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120583 ?auto_120584 ) ( ON-TABLE ?auto_120576 ) ( not ( = ?auto_120576 ?auto_120577 ) ) ( not ( = ?auto_120576 ?auto_120578 ) ) ( not ( = ?auto_120576 ?auto_120579 ) ) ( not ( = ?auto_120576 ?auto_120580 ) ) ( not ( = ?auto_120576 ?auto_120581 ) ) ( not ( = ?auto_120576 ?auto_120582 ) ) ( not ( = ?auto_120576 ?auto_120583 ) ) ( not ( = ?auto_120576 ?auto_120584 ) ) ( not ( = ?auto_120577 ?auto_120578 ) ) ( not ( = ?auto_120577 ?auto_120579 ) ) ( not ( = ?auto_120577 ?auto_120580 ) ) ( not ( = ?auto_120577 ?auto_120581 ) ) ( not ( = ?auto_120577 ?auto_120582 ) ) ( not ( = ?auto_120577 ?auto_120583 ) ) ( not ( = ?auto_120577 ?auto_120584 ) ) ( not ( = ?auto_120578 ?auto_120579 ) ) ( not ( = ?auto_120578 ?auto_120580 ) ) ( not ( = ?auto_120578 ?auto_120581 ) ) ( not ( = ?auto_120578 ?auto_120582 ) ) ( not ( = ?auto_120578 ?auto_120583 ) ) ( not ( = ?auto_120578 ?auto_120584 ) ) ( not ( = ?auto_120579 ?auto_120580 ) ) ( not ( = ?auto_120579 ?auto_120581 ) ) ( not ( = ?auto_120579 ?auto_120582 ) ) ( not ( = ?auto_120579 ?auto_120583 ) ) ( not ( = ?auto_120579 ?auto_120584 ) ) ( not ( = ?auto_120580 ?auto_120581 ) ) ( not ( = ?auto_120580 ?auto_120582 ) ) ( not ( = ?auto_120580 ?auto_120583 ) ) ( not ( = ?auto_120580 ?auto_120584 ) ) ( not ( = ?auto_120581 ?auto_120582 ) ) ( not ( = ?auto_120581 ?auto_120583 ) ) ( not ( = ?auto_120581 ?auto_120584 ) ) ( not ( = ?auto_120582 ?auto_120583 ) ) ( not ( = ?auto_120582 ?auto_120584 ) ) ( not ( = ?auto_120583 ?auto_120584 ) ) ( ON ?auto_120582 ?auto_120583 ) ( ON ?auto_120581 ?auto_120582 ) ( ON ?auto_120580 ?auto_120581 ) ( ON ?auto_120579 ?auto_120580 ) ( ON ?auto_120578 ?auto_120579 ) ( CLEAR ?auto_120576 ) ( ON ?auto_120577 ?auto_120578 ) ( CLEAR ?auto_120577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120576 ?auto_120577 )
      ( MAKE-8PILE ?auto_120576 ?auto_120577 ?auto_120578 ?auto_120579 ?auto_120580 ?auto_120581 ?auto_120582 ?auto_120583 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120610 - BLOCK
      ?auto_120611 - BLOCK
      ?auto_120612 - BLOCK
      ?auto_120613 - BLOCK
      ?auto_120614 - BLOCK
      ?auto_120615 - BLOCK
      ?auto_120616 - BLOCK
      ?auto_120617 - BLOCK
    )
    :vars
    (
      ?auto_120618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120617 ?auto_120618 ) ( not ( = ?auto_120610 ?auto_120611 ) ) ( not ( = ?auto_120610 ?auto_120612 ) ) ( not ( = ?auto_120610 ?auto_120613 ) ) ( not ( = ?auto_120610 ?auto_120614 ) ) ( not ( = ?auto_120610 ?auto_120615 ) ) ( not ( = ?auto_120610 ?auto_120616 ) ) ( not ( = ?auto_120610 ?auto_120617 ) ) ( not ( = ?auto_120610 ?auto_120618 ) ) ( not ( = ?auto_120611 ?auto_120612 ) ) ( not ( = ?auto_120611 ?auto_120613 ) ) ( not ( = ?auto_120611 ?auto_120614 ) ) ( not ( = ?auto_120611 ?auto_120615 ) ) ( not ( = ?auto_120611 ?auto_120616 ) ) ( not ( = ?auto_120611 ?auto_120617 ) ) ( not ( = ?auto_120611 ?auto_120618 ) ) ( not ( = ?auto_120612 ?auto_120613 ) ) ( not ( = ?auto_120612 ?auto_120614 ) ) ( not ( = ?auto_120612 ?auto_120615 ) ) ( not ( = ?auto_120612 ?auto_120616 ) ) ( not ( = ?auto_120612 ?auto_120617 ) ) ( not ( = ?auto_120612 ?auto_120618 ) ) ( not ( = ?auto_120613 ?auto_120614 ) ) ( not ( = ?auto_120613 ?auto_120615 ) ) ( not ( = ?auto_120613 ?auto_120616 ) ) ( not ( = ?auto_120613 ?auto_120617 ) ) ( not ( = ?auto_120613 ?auto_120618 ) ) ( not ( = ?auto_120614 ?auto_120615 ) ) ( not ( = ?auto_120614 ?auto_120616 ) ) ( not ( = ?auto_120614 ?auto_120617 ) ) ( not ( = ?auto_120614 ?auto_120618 ) ) ( not ( = ?auto_120615 ?auto_120616 ) ) ( not ( = ?auto_120615 ?auto_120617 ) ) ( not ( = ?auto_120615 ?auto_120618 ) ) ( not ( = ?auto_120616 ?auto_120617 ) ) ( not ( = ?auto_120616 ?auto_120618 ) ) ( not ( = ?auto_120617 ?auto_120618 ) ) ( ON ?auto_120616 ?auto_120617 ) ( ON ?auto_120615 ?auto_120616 ) ( ON ?auto_120614 ?auto_120615 ) ( ON ?auto_120613 ?auto_120614 ) ( ON ?auto_120612 ?auto_120613 ) ( ON ?auto_120611 ?auto_120612 ) ( ON ?auto_120610 ?auto_120611 ) ( CLEAR ?auto_120610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120610 )
      ( MAKE-8PILE ?auto_120610 ?auto_120611 ?auto_120612 ?auto_120613 ?auto_120614 ?auto_120615 ?auto_120616 ?auto_120617 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_120645 - BLOCK
      ?auto_120646 - BLOCK
      ?auto_120647 - BLOCK
      ?auto_120648 - BLOCK
      ?auto_120649 - BLOCK
      ?auto_120650 - BLOCK
      ?auto_120651 - BLOCK
      ?auto_120652 - BLOCK
      ?auto_120653 - BLOCK
    )
    :vars
    (
      ?auto_120654 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_120652 ) ( ON ?auto_120653 ?auto_120654 ) ( CLEAR ?auto_120653 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120645 ) ( ON ?auto_120646 ?auto_120645 ) ( ON ?auto_120647 ?auto_120646 ) ( ON ?auto_120648 ?auto_120647 ) ( ON ?auto_120649 ?auto_120648 ) ( ON ?auto_120650 ?auto_120649 ) ( ON ?auto_120651 ?auto_120650 ) ( ON ?auto_120652 ?auto_120651 ) ( not ( = ?auto_120645 ?auto_120646 ) ) ( not ( = ?auto_120645 ?auto_120647 ) ) ( not ( = ?auto_120645 ?auto_120648 ) ) ( not ( = ?auto_120645 ?auto_120649 ) ) ( not ( = ?auto_120645 ?auto_120650 ) ) ( not ( = ?auto_120645 ?auto_120651 ) ) ( not ( = ?auto_120645 ?auto_120652 ) ) ( not ( = ?auto_120645 ?auto_120653 ) ) ( not ( = ?auto_120645 ?auto_120654 ) ) ( not ( = ?auto_120646 ?auto_120647 ) ) ( not ( = ?auto_120646 ?auto_120648 ) ) ( not ( = ?auto_120646 ?auto_120649 ) ) ( not ( = ?auto_120646 ?auto_120650 ) ) ( not ( = ?auto_120646 ?auto_120651 ) ) ( not ( = ?auto_120646 ?auto_120652 ) ) ( not ( = ?auto_120646 ?auto_120653 ) ) ( not ( = ?auto_120646 ?auto_120654 ) ) ( not ( = ?auto_120647 ?auto_120648 ) ) ( not ( = ?auto_120647 ?auto_120649 ) ) ( not ( = ?auto_120647 ?auto_120650 ) ) ( not ( = ?auto_120647 ?auto_120651 ) ) ( not ( = ?auto_120647 ?auto_120652 ) ) ( not ( = ?auto_120647 ?auto_120653 ) ) ( not ( = ?auto_120647 ?auto_120654 ) ) ( not ( = ?auto_120648 ?auto_120649 ) ) ( not ( = ?auto_120648 ?auto_120650 ) ) ( not ( = ?auto_120648 ?auto_120651 ) ) ( not ( = ?auto_120648 ?auto_120652 ) ) ( not ( = ?auto_120648 ?auto_120653 ) ) ( not ( = ?auto_120648 ?auto_120654 ) ) ( not ( = ?auto_120649 ?auto_120650 ) ) ( not ( = ?auto_120649 ?auto_120651 ) ) ( not ( = ?auto_120649 ?auto_120652 ) ) ( not ( = ?auto_120649 ?auto_120653 ) ) ( not ( = ?auto_120649 ?auto_120654 ) ) ( not ( = ?auto_120650 ?auto_120651 ) ) ( not ( = ?auto_120650 ?auto_120652 ) ) ( not ( = ?auto_120650 ?auto_120653 ) ) ( not ( = ?auto_120650 ?auto_120654 ) ) ( not ( = ?auto_120651 ?auto_120652 ) ) ( not ( = ?auto_120651 ?auto_120653 ) ) ( not ( = ?auto_120651 ?auto_120654 ) ) ( not ( = ?auto_120652 ?auto_120653 ) ) ( not ( = ?auto_120652 ?auto_120654 ) ) ( not ( = ?auto_120653 ?auto_120654 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120653 ?auto_120654 )
      ( !STACK ?auto_120653 ?auto_120652 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_120683 - BLOCK
      ?auto_120684 - BLOCK
      ?auto_120685 - BLOCK
      ?auto_120686 - BLOCK
      ?auto_120687 - BLOCK
      ?auto_120688 - BLOCK
      ?auto_120689 - BLOCK
      ?auto_120690 - BLOCK
      ?auto_120691 - BLOCK
    )
    :vars
    (
      ?auto_120692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120691 ?auto_120692 ) ( ON-TABLE ?auto_120683 ) ( ON ?auto_120684 ?auto_120683 ) ( ON ?auto_120685 ?auto_120684 ) ( ON ?auto_120686 ?auto_120685 ) ( ON ?auto_120687 ?auto_120686 ) ( ON ?auto_120688 ?auto_120687 ) ( ON ?auto_120689 ?auto_120688 ) ( not ( = ?auto_120683 ?auto_120684 ) ) ( not ( = ?auto_120683 ?auto_120685 ) ) ( not ( = ?auto_120683 ?auto_120686 ) ) ( not ( = ?auto_120683 ?auto_120687 ) ) ( not ( = ?auto_120683 ?auto_120688 ) ) ( not ( = ?auto_120683 ?auto_120689 ) ) ( not ( = ?auto_120683 ?auto_120690 ) ) ( not ( = ?auto_120683 ?auto_120691 ) ) ( not ( = ?auto_120683 ?auto_120692 ) ) ( not ( = ?auto_120684 ?auto_120685 ) ) ( not ( = ?auto_120684 ?auto_120686 ) ) ( not ( = ?auto_120684 ?auto_120687 ) ) ( not ( = ?auto_120684 ?auto_120688 ) ) ( not ( = ?auto_120684 ?auto_120689 ) ) ( not ( = ?auto_120684 ?auto_120690 ) ) ( not ( = ?auto_120684 ?auto_120691 ) ) ( not ( = ?auto_120684 ?auto_120692 ) ) ( not ( = ?auto_120685 ?auto_120686 ) ) ( not ( = ?auto_120685 ?auto_120687 ) ) ( not ( = ?auto_120685 ?auto_120688 ) ) ( not ( = ?auto_120685 ?auto_120689 ) ) ( not ( = ?auto_120685 ?auto_120690 ) ) ( not ( = ?auto_120685 ?auto_120691 ) ) ( not ( = ?auto_120685 ?auto_120692 ) ) ( not ( = ?auto_120686 ?auto_120687 ) ) ( not ( = ?auto_120686 ?auto_120688 ) ) ( not ( = ?auto_120686 ?auto_120689 ) ) ( not ( = ?auto_120686 ?auto_120690 ) ) ( not ( = ?auto_120686 ?auto_120691 ) ) ( not ( = ?auto_120686 ?auto_120692 ) ) ( not ( = ?auto_120687 ?auto_120688 ) ) ( not ( = ?auto_120687 ?auto_120689 ) ) ( not ( = ?auto_120687 ?auto_120690 ) ) ( not ( = ?auto_120687 ?auto_120691 ) ) ( not ( = ?auto_120687 ?auto_120692 ) ) ( not ( = ?auto_120688 ?auto_120689 ) ) ( not ( = ?auto_120688 ?auto_120690 ) ) ( not ( = ?auto_120688 ?auto_120691 ) ) ( not ( = ?auto_120688 ?auto_120692 ) ) ( not ( = ?auto_120689 ?auto_120690 ) ) ( not ( = ?auto_120689 ?auto_120691 ) ) ( not ( = ?auto_120689 ?auto_120692 ) ) ( not ( = ?auto_120690 ?auto_120691 ) ) ( not ( = ?auto_120690 ?auto_120692 ) ) ( not ( = ?auto_120691 ?auto_120692 ) ) ( CLEAR ?auto_120689 ) ( ON ?auto_120690 ?auto_120691 ) ( CLEAR ?auto_120690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_120683 ?auto_120684 ?auto_120685 ?auto_120686 ?auto_120687 ?auto_120688 ?auto_120689 ?auto_120690 )
      ( MAKE-9PILE ?auto_120683 ?auto_120684 ?auto_120685 ?auto_120686 ?auto_120687 ?auto_120688 ?auto_120689 ?auto_120690 ?auto_120691 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_120721 - BLOCK
      ?auto_120722 - BLOCK
      ?auto_120723 - BLOCK
      ?auto_120724 - BLOCK
      ?auto_120725 - BLOCK
      ?auto_120726 - BLOCK
      ?auto_120727 - BLOCK
      ?auto_120728 - BLOCK
      ?auto_120729 - BLOCK
    )
    :vars
    (
      ?auto_120730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120729 ?auto_120730 ) ( ON-TABLE ?auto_120721 ) ( ON ?auto_120722 ?auto_120721 ) ( ON ?auto_120723 ?auto_120722 ) ( ON ?auto_120724 ?auto_120723 ) ( ON ?auto_120725 ?auto_120724 ) ( ON ?auto_120726 ?auto_120725 ) ( not ( = ?auto_120721 ?auto_120722 ) ) ( not ( = ?auto_120721 ?auto_120723 ) ) ( not ( = ?auto_120721 ?auto_120724 ) ) ( not ( = ?auto_120721 ?auto_120725 ) ) ( not ( = ?auto_120721 ?auto_120726 ) ) ( not ( = ?auto_120721 ?auto_120727 ) ) ( not ( = ?auto_120721 ?auto_120728 ) ) ( not ( = ?auto_120721 ?auto_120729 ) ) ( not ( = ?auto_120721 ?auto_120730 ) ) ( not ( = ?auto_120722 ?auto_120723 ) ) ( not ( = ?auto_120722 ?auto_120724 ) ) ( not ( = ?auto_120722 ?auto_120725 ) ) ( not ( = ?auto_120722 ?auto_120726 ) ) ( not ( = ?auto_120722 ?auto_120727 ) ) ( not ( = ?auto_120722 ?auto_120728 ) ) ( not ( = ?auto_120722 ?auto_120729 ) ) ( not ( = ?auto_120722 ?auto_120730 ) ) ( not ( = ?auto_120723 ?auto_120724 ) ) ( not ( = ?auto_120723 ?auto_120725 ) ) ( not ( = ?auto_120723 ?auto_120726 ) ) ( not ( = ?auto_120723 ?auto_120727 ) ) ( not ( = ?auto_120723 ?auto_120728 ) ) ( not ( = ?auto_120723 ?auto_120729 ) ) ( not ( = ?auto_120723 ?auto_120730 ) ) ( not ( = ?auto_120724 ?auto_120725 ) ) ( not ( = ?auto_120724 ?auto_120726 ) ) ( not ( = ?auto_120724 ?auto_120727 ) ) ( not ( = ?auto_120724 ?auto_120728 ) ) ( not ( = ?auto_120724 ?auto_120729 ) ) ( not ( = ?auto_120724 ?auto_120730 ) ) ( not ( = ?auto_120725 ?auto_120726 ) ) ( not ( = ?auto_120725 ?auto_120727 ) ) ( not ( = ?auto_120725 ?auto_120728 ) ) ( not ( = ?auto_120725 ?auto_120729 ) ) ( not ( = ?auto_120725 ?auto_120730 ) ) ( not ( = ?auto_120726 ?auto_120727 ) ) ( not ( = ?auto_120726 ?auto_120728 ) ) ( not ( = ?auto_120726 ?auto_120729 ) ) ( not ( = ?auto_120726 ?auto_120730 ) ) ( not ( = ?auto_120727 ?auto_120728 ) ) ( not ( = ?auto_120727 ?auto_120729 ) ) ( not ( = ?auto_120727 ?auto_120730 ) ) ( not ( = ?auto_120728 ?auto_120729 ) ) ( not ( = ?auto_120728 ?auto_120730 ) ) ( not ( = ?auto_120729 ?auto_120730 ) ) ( ON ?auto_120728 ?auto_120729 ) ( CLEAR ?auto_120726 ) ( ON ?auto_120727 ?auto_120728 ) ( CLEAR ?auto_120727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_120721 ?auto_120722 ?auto_120723 ?auto_120724 ?auto_120725 ?auto_120726 ?auto_120727 )
      ( MAKE-9PILE ?auto_120721 ?auto_120722 ?auto_120723 ?auto_120724 ?auto_120725 ?auto_120726 ?auto_120727 ?auto_120728 ?auto_120729 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_120759 - BLOCK
      ?auto_120760 - BLOCK
      ?auto_120761 - BLOCK
      ?auto_120762 - BLOCK
      ?auto_120763 - BLOCK
      ?auto_120764 - BLOCK
      ?auto_120765 - BLOCK
      ?auto_120766 - BLOCK
      ?auto_120767 - BLOCK
    )
    :vars
    (
      ?auto_120768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120767 ?auto_120768 ) ( ON-TABLE ?auto_120759 ) ( ON ?auto_120760 ?auto_120759 ) ( ON ?auto_120761 ?auto_120760 ) ( ON ?auto_120762 ?auto_120761 ) ( ON ?auto_120763 ?auto_120762 ) ( not ( = ?auto_120759 ?auto_120760 ) ) ( not ( = ?auto_120759 ?auto_120761 ) ) ( not ( = ?auto_120759 ?auto_120762 ) ) ( not ( = ?auto_120759 ?auto_120763 ) ) ( not ( = ?auto_120759 ?auto_120764 ) ) ( not ( = ?auto_120759 ?auto_120765 ) ) ( not ( = ?auto_120759 ?auto_120766 ) ) ( not ( = ?auto_120759 ?auto_120767 ) ) ( not ( = ?auto_120759 ?auto_120768 ) ) ( not ( = ?auto_120760 ?auto_120761 ) ) ( not ( = ?auto_120760 ?auto_120762 ) ) ( not ( = ?auto_120760 ?auto_120763 ) ) ( not ( = ?auto_120760 ?auto_120764 ) ) ( not ( = ?auto_120760 ?auto_120765 ) ) ( not ( = ?auto_120760 ?auto_120766 ) ) ( not ( = ?auto_120760 ?auto_120767 ) ) ( not ( = ?auto_120760 ?auto_120768 ) ) ( not ( = ?auto_120761 ?auto_120762 ) ) ( not ( = ?auto_120761 ?auto_120763 ) ) ( not ( = ?auto_120761 ?auto_120764 ) ) ( not ( = ?auto_120761 ?auto_120765 ) ) ( not ( = ?auto_120761 ?auto_120766 ) ) ( not ( = ?auto_120761 ?auto_120767 ) ) ( not ( = ?auto_120761 ?auto_120768 ) ) ( not ( = ?auto_120762 ?auto_120763 ) ) ( not ( = ?auto_120762 ?auto_120764 ) ) ( not ( = ?auto_120762 ?auto_120765 ) ) ( not ( = ?auto_120762 ?auto_120766 ) ) ( not ( = ?auto_120762 ?auto_120767 ) ) ( not ( = ?auto_120762 ?auto_120768 ) ) ( not ( = ?auto_120763 ?auto_120764 ) ) ( not ( = ?auto_120763 ?auto_120765 ) ) ( not ( = ?auto_120763 ?auto_120766 ) ) ( not ( = ?auto_120763 ?auto_120767 ) ) ( not ( = ?auto_120763 ?auto_120768 ) ) ( not ( = ?auto_120764 ?auto_120765 ) ) ( not ( = ?auto_120764 ?auto_120766 ) ) ( not ( = ?auto_120764 ?auto_120767 ) ) ( not ( = ?auto_120764 ?auto_120768 ) ) ( not ( = ?auto_120765 ?auto_120766 ) ) ( not ( = ?auto_120765 ?auto_120767 ) ) ( not ( = ?auto_120765 ?auto_120768 ) ) ( not ( = ?auto_120766 ?auto_120767 ) ) ( not ( = ?auto_120766 ?auto_120768 ) ) ( not ( = ?auto_120767 ?auto_120768 ) ) ( ON ?auto_120766 ?auto_120767 ) ( ON ?auto_120765 ?auto_120766 ) ( CLEAR ?auto_120763 ) ( ON ?auto_120764 ?auto_120765 ) ( CLEAR ?auto_120764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120759 ?auto_120760 ?auto_120761 ?auto_120762 ?auto_120763 ?auto_120764 )
      ( MAKE-9PILE ?auto_120759 ?auto_120760 ?auto_120761 ?auto_120762 ?auto_120763 ?auto_120764 ?auto_120765 ?auto_120766 ?auto_120767 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_120797 - BLOCK
      ?auto_120798 - BLOCK
      ?auto_120799 - BLOCK
      ?auto_120800 - BLOCK
      ?auto_120801 - BLOCK
      ?auto_120802 - BLOCK
      ?auto_120803 - BLOCK
      ?auto_120804 - BLOCK
      ?auto_120805 - BLOCK
    )
    :vars
    (
      ?auto_120806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120805 ?auto_120806 ) ( ON-TABLE ?auto_120797 ) ( ON ?auto_120798 ?auto_120797 ) ( ON ?auto_120799 ?auto_120798 ) ( ON ?auto_120800 ?auto_120799 ) ( not ( = ?auto_120797 ?auto_120798 ) ) ( not ( = ?auto_120797 ?auto_120799 ) ) ( not ( = ?auto_120797 ?auto_120800 ) ) ( not ( = ?auto_120797 ?auto_120801 ) ) ( not ( = ?auto_120797 ?auto_120802 ) ) ( not ( = ?auto_120797 ?auto_120803 ) ) ( not ( = ?auto_120797 ?auto_120804 ) ) ( not ( = ?auto_120797 ?auto_120805 ) ) ( not ( = ?auto_120797 ?auto_120806 ) ) ( not ( = ?auto_120798 ?auto_120799 ) ) ( not ( = ?auto_120798 ?auto_120800 ) ) ( not ( = ?auto_120798 ?auto_120801 ) ) ( not ( = ?auto_120798 ?auto_120802 ) ) ( not ( = ?auto_120798 ?auto_120803 ) ) ( not ( = ?auto_120798 ?auto_120804 ) ) ( not ( = ?auto_120798 ?auto_120805 ) ) ( not ( = ?auto_120798 ?auto_120806 ) ) ( not ( = ?auto_120799 ?auto_120800 ) ) ( not ( = ?auto_120799 ?auto_120801 ) ) ( not ( = ?auto_120799 ?auto_120802 ) ) ( not ( = ?auto_120799 ?auto_120803 ) ) ( not ( = ?auto_120799 ?auto_120804 ) ) ( not ( = ?auto_120799 ?auto_120805 ) ) ( not ( = ?auto_120799 ?auto_120806 ) ) ( not ( = ?auto_120800 ?auto_120801 ) ) ( not ( = ?auto_120800 ?auto_120802 ) ) ( not ( = ?auto_120800 ?auto_120803 ) ) ( not ( = ?auto_120800 ?auto_120804 ) ) ( not ( = ?auto_120800 ?auto_120805 ) ) ( not ( = ?auto_120800 ?auto_120806 ) ) ( not ( = ?auto_120801 ?auto_120802 ) ) ( not ( = ?auto_120801 ?auto_120803 ) ) ( not ( = ?auto_120801 ?auto_120804 ) ) ( not ( = ?auto_120801 ?auto_120805 ) ) ( not ( = ?auto_120801 ?auto_120806 ) ) ( not ( = ?auto_120802 ?auto_120803 ) ) ( not ( = ?auto_120802 ?auto_120804 ) ) ( not ( = ?auto_120802 ?auto_120805 ) ) ( not ( = ?auto_120802 ?auto_120806 ) ) ( not ( = ?auto_120803 ?auto_120804 ) ) ( not ( = ?auto_120803 ?auto_120805 ) ) ( not ( = ?auto_120803 ?auto_120806 ) ) ( not ( = ?auto_120804 ?auto_120805 ) ) ( not ( = ?auto_120804 ?auto_120806 ) ) ( not ( = ?auto_120805 ?auto_120806 ) ) ( ON ?auto_120804 ?auto_120805 ) ( ON ?auto_120803 ?auto_120804 ) ( ON ?auto_120802 ?auto_120803 ) ( CLEAR ?auto_120800 ) ( ON ?auto_120801 ?auto_120802 ) ( CLEAR ?auto_120801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120797 ?auto_120798 ?auto_120799 ?auto_120800 ?auto_120801 )
      ( MAKE-9PILE ?auto_120797 ?auto_120798 ?auto_120799 ?auto_120800 ?auto_120801 ?auto_120802 ?auto_120803 ?auto_120804 ?auto_120805 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_120835 - BLOCK
      ?auto_120836 - BLOCK
      ?auto_120837 - BLOCK
      ?auto_120838 - BLOCK
      ?auto_120839 - BLOCK
      ?auto_120840 - BLOCK
      ?auto_120841 - BLOCK
      ?auto_120842 - BLOCK
      ?auto_120843 - BLOCK
    )
    :vars
    (
      ?auto_120844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120843 ?auto_120844 ) ( ON-TABLE ?auto_120835 ) ( ON ?auto_120836 ?auto_120835 ) ( ON ?auto_120837 ?auto_120836 ) ( not ( = ?auto_120835 ?auto_120836 ) ) ( not ( = ?auto_120835 ?auto_120837 ) ) ( not ( = ?auto_120835 ?auto_120838 ) ) ( not ( = ?auto_120835 ?auto_120839 ) ) ( not ( = ?auto_120835 ?auto_120840 ) ) ( not ( = ?auto_120835 ?auto_120841 ) ) ( not ( = ?auto_120835 ?auto_120842 ) ) ( not ( = ?auto_120835 ?auto_120843 ) ) ( not ( = ?auto_120835 ?auto_120844 ) ) ( not ( = ?auto_120836 ?auto_120837 ) ) ( not ( = ?auto_120836 ?auto_120838 ) ) ( not ( = ?auto_120836 ?auto_120839 ) ) ( not ( = ?auto_120836 ?auto_120840 ) ) ( not ( = ?auto_120836 ?auto_120841 ) ) ( not ( = ?auto_120836 ?auto_120842 ) ) ( not ( = ?auto_120836 ?auto_120843 ) ) ( not ( = ?auto_120836 ?auto_120844 ) ) ( not ( = ?auto_120837 ?auto_120838 ) ) ( not ( = ?auto_120837 ?auto_120839 ) ) ( not ( = ?auto_120837 ?auto_120840 ) ) ( not ( = ?auto_120837 ?auto_120841 ) ) ( not ( = ?auto_120837 ?auto_120842 ) ) ( not ( = ?auto_120837 ?auto_120843 ) ) ( not ( = ?auto_120837 ?auto_120844 ) ) ( not ( = ?auto_120838 ?auto_120839 ) ) ( not ( = ?auto_120838 ?auto_120840 ) ) ( not ( = ?auto_120838 ?auto_120841 ) ) ( not ( = ?auto_120838 ?auto_120842 ) ) ( not ( = ?auto_120838 ?auto_120843 ) ) ( not ( = ?auto_120838 ?auto_120844 ) ) ( not ( = ?auto_120839 ?auto_120840 ) ) ( not ( = ?auto_120839 ?auto_120841 ) ) ( not ( = ?auto_120839 ?auto_120842 ) ) ( not ( = ?auto_120839 ?auto_120843 ) ) ( not ( = ?auto_120839 ?auto_120844 ) ) ( not ( = ?auto_120840 ?auto_120841 ) ) ( not ( = ?auto_120840 ?auto_120842 ) ) ( not ( = ?auto_120840 ?auto_120843 ) ) ( not ( = ?auto_120840 ?auto_120844 ) ) ( not ( = ?auto_120841 ?auto_120842 ) ) ( not ( = ?auto_120841 ?auto_120843 ) ) ( not ( = ?auto_120841 ?auto_120844 ) ) ( not ( = ?auto_120842 ?auto_120843 ) ) ( not ( = ?auto_120842 ?auto_120844 ) ) ( not ( = ?auto_120843 ?auto_120844 ) ) ( ON ?auto_120842 ?auto_120843 ) ( ON ?auto_120841 ?auto_120842 ) ( ON ?auto_120840 ?auto_120841 ) ( ON ?auto_120839 ?auto_120840 ) ( CLEAR ?auto_120837 ) ( ON ?auto_120838 ?auto_120839 ) ( CLEAR ?auto_120838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120835 ?auto_120836 ?auto_120837 ?auto_120838 )
      ( MAKE-9PILE ?auto_120835 ?auto_120836 ?auto_120837 ?auto_120838 ?auto_120839 ?auto_120840 ?auto_120841 ?auto_120842 ?auto_120843 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_120873 - BLOCK
      ?auto_120874 - BLOCK
      ?auto_120875 - BLOCK
      ?auto_120876 - BLOCK
      ?auto_120877 - BLOCK
      ?auto_120878 - BLOCK
      ?auto_120879 - BLOCK
      ?auto_120880 - BLOCK
      ?auto_120881 - BLOCK
    )
    :vars
    (
      ?auto_120882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120881 ?auto_120882 ) ( ON-TABLE ?auto_120873 ) ( ON ?auto_120874 ?auto_120873 ) ( not ( = ?auto_120873 ?auto_120874 ) ) ( not ( = ?auto_120873 ?auto_120875 ) ) ( not ( = ?auto_120873 ?auto_120876 ) ) ( not ( = ?auto_120873 ?auto_120877 ) ) ( not ( = ?auto_120873 ?auto_120878 ) ) ( not ( = ?auto_120873 ?auto_120879 ) ) ( not ( = ?auto_120873 ?auto_120880 ) ) ( not ( = ?auto_120873 ?auto_120881 ) ) ( not ( = ?auto_120873 ?auto_120882 ) ) ( not ( = ?auto_120874 ?auto_120875 ) ) ( not ( = ?auto_120874 ?auto_120876 ) ) ( not ( = ?auto_120874 ?auto_120877 ) ) ( not ( = ?auto_120874 ?auto_120878 ) ) ( not ( = ?auto_120874 ?auto_120879 ) ) ( not ( = ?auto_120874 ?auto_120880 ) ) ( not ( = ?auto_120874 ?auto_120881 ) ) ( not ( = ?auto_120874 ?auto_120882 ) ) ( not ( = ?auto_120875 ?auto_120876 ) ) ( not ( = ?auto_120875 ?auto_120877 ) ) ( not ( = ?auto_120875 ?auto_120878 ) ) ( not ( = ?auto_120875 ?auto_120879 ) ) ( not ( = ?auto_120875 ?auto_120880 ) ) ( not ( = ?auto_120875 ?auto_120881 ) ) ( not ( = ?auto_120875 ?auto_120882 ) ) ( not ( = ?auto_120876 ?auto_120877 ) ) ( not ( = ?auto_120876 ?auto_120878 ) ) ( not ( = ?auto_120876 ?auto_120879 ) ) ( not ( = ?auto_120876 ?auto_120880 ) ) ( not ( = ?auto_120876 ?auto_120881 ) ) ( not ( = ?auto_120876 ?auto_120882 ) ) ( not ( = ?auto_120877 ?auto_120878 ) ) ( not ( = ?auto_120877 ?auto_120879 ) ) ( not ( = ?auto_120877 ?auto_120880 ) ) ( not ( = ?auto_120877 ?auto_120881 ) ) ( not ( = ?auto_120877 ?auto_120882 ) ) ( not ( = ?auto_120878 ?auto_120879 ) ) ( not ( = ?auto_120878 ?auto_120880 ) ) ( not ( = ?auto_120878 ?auto_120881 ) ) ( not ( = ?auto_120878 ?auto_120882 ) ) ( not ( = ?auto_120879 ?auto_120880 ) ) ( not ( = ?auto_120879 ?auto_120881 ) ) ( not ( = ?auto_120879 ?auto_120882 ) ) ( not ( = ?auto_120880 ?auto_120881 ) ) ( not ( = ?auto_120880 ?auto_120882 ) ) ( not ( = ?auto_120881 ?auto_120882 ) ) ( ON ?auto_120880 ?auto_120881 ) ( ON ?auto_120879 ?auto_120880 ) ( ON ?auto_120878 ?auto_120879 ) ( ON ?auto_120877 ?auto_120878 ) ( ON ?auto_120876 ?auto_120877 ) ( CLEAR ?auto_120874 ) ( ON ?auto_120875 ?auto_120876 ) ( CLEAR ?auto_120875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120873 ?auto_120874 ?auto_120875 )
      ( MAKE-9PILE ?auto_120873 ?auto_120874 ?auto_120875 ?auto_120876 ?auto_120877 ?auto_120878 ?auto_120879 ?auto_120880 ?auto_120881 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_120911 - BLOCK
      ?auto_120912 - BLOCK
      ?auto_120913 - BLOCK
      ?auto_120914 - BLOCK
      ?auto_120915 - BLOCK
      ?auto_120916 - BLOCK
      ?auto_120917 - BLOCK
      ?auto_120918 - BLOCK
      ?auto_120919 - BLOCK
    )
    :vars
    (
      ?auto_120920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120919 ?auto_120920 ) ( ON-TABLE ?auto_120911 ) ( not ( = ?auto_120911 ?auto_120912 ) ) ( not ( = ?auto_120911 ?auto_120913 ) ) ( not ( = ?auto_120911 ?auto_120914 ) ) ( not ( = ?auto_120911 ?auto_120915 ) ) ( not ( = ?auto_120911 ?auto_120916 ) ) ( not ( = ?auto_120911 ?auto_120917 ) ) ( not ( = ?auto_120911 ?auto_120918 ) ) ( not ( = ?auto_120911 ?auto_120919 ) ) ( not ( = ?auto_120911 ?auto_120920 ) ) ( not ( = ?auto_120912 ?auto_120913 ) ) ( not ( = ?auto_120912 ?auto_120914 ) ) ( not ( = ?auto_120912 ?auto_120915 ) ) ( not ( = ?auto_120912 ?auto_120916 ) ) ( not ( = ?auto_120912 ?auto_120917 ) ) ( not ( = ?auto_120912 ?auto_120918 ) ) ( not ( = ?auto_120912 ?auto_120919 ) ) ( not ( = ?auto_120912 ?auto_120920 ) ) ( not ( = ?auto_120913 ?auto_120914 ) ) ( not ( = ?auto_120913 ?auto_120915 ) ) ( not ( = ?auto_120913 ?auto_120916 ) ) ( not ( = ?auto_120913 ?auto_120917 ) ) ( not ( = ?auto_120913 ?auto_120918 ) ) ( not ( = ?auto_120913 ?auto_120919 ) ) ( not ( = ?auto_120913 ?auto_120920 ) ) ( not ( = ?auto_120914 ?auto_120915 ) ) ( not ( = ?auto_120914 ?auto_120916 ) ) ( not ( = ?auto_120914 ?auto_120917 ) ) ( not ( = ?auto_120914 ?auto_120918 ) ) ( not ( = ?auto_120914 ?auto_120919 ) ) ( not ( = ?auto_120914 ?auto_120920 ) ) ( not ( = ?auto_120915 ?auto_120916 ) ) ( not ( = ?auto_120915 ?auto_120917 ) ) ( not ( = ?auto_120915 ?auto_120918 ) ) ( not ( = ?auto_120915 ?auto_120919 ) ) ( not ( = ?auto_120915 ?auto_120920 ) ) ( not ( = ?auto_120916 ?auto_120917 ) ) ( not ( = ?auto_120916 ?auto_120918 ) ) ( not ( = ?auto_120916 ?auto_120919 ) ) ( not ( = ?auto_120916 ?auto_120920 ) ) ( not ( = ?auto_120917 ?auto_120918 ) ) ( not ( = ?auto_120917 ?auto_120919 ) ) ( not ( = ?auto_120917 ?auto_120920 ) ) ( not ( = ?auto_120918 ?auto_120919 ) ) ( not ( = ?auto_120918 ?auto_120920 ) ) ( not ( = ?auto_120919 ?auto_120920 ) ) ( ON ?auto_120918 ?auto_120919 ) ( ON ?auto_120917 ?auto_120918 ) ( ON ?auto_120916 ?auto_120917 ) ( ON ?auto_120915 ?auto_120916 ) ( ON ?auto_120914 ?auto_120915 ) ( ON ?auto_120913 ?auto_120914 ) ( CLEAR ?auto_120911 ) ( ON ?auto_120912 ?auto_120913 ) ( CLEAR ?auto_120912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120911 ?auto_120912 )
      ( MAKE-9PILE ?auto_120911 ?auto_120912 ?auto_120913 ?auto_120914 ?auto_120915 ?auto_120916 ?auto_120917 ?auto_120918 ?auto_120919 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_120949 - BLOCK
      ?auto_120950 - BLOCK
      ?auto_120951 - BLOCK
      ?auto_120952 - BLOCK
      ?auto_120953 - BLOCK
      ?auto_120954 - BLOCK
      ?auto_120955 - BLOCK
      ?auto_120956 - BLOCK
      ?auto_120957 - BLOCK
    )
    :vars
    (
      ?auto_120958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120957 ?auto_120958 ) ( not ( = ?auto_120949 ?auto_120950 ) ) ( not ( = ?auto_120949 ?auto_120951 ) ) ( not ( = ?auto_120949 ?auto_120952 ) ) ( not ( = ?auto_120949 ?auto_120953 ) ) ( not ( = ?auto_120949 ?auto_120954 ) ) ( not ( = ?auto_120949 ?auto_120955 ) ) ( not ( = ?auto_120949 ?auto_120956 ) ) ( not ( = ?auto_120949 ?auto_120957 ) ) ( not ( = ?auto_120949 ?auto_120958 ) ) ( not ( = ?auto_120950 ?auto_120951 ) ) ( not ( = ?auto_120950 ?auto_120952 ) ) ( not ( = ?auto_120950 ?auto_120953 ) ) ( not ( = ?auto_120950 ?auto_120954 ) ) ( not ( = ?auto_120950 ?auto_120955 ) ) ( not ( = ?auto_120950 ?auto_120956 ) ) ( not ( = ?auto_120950 ?auto_120957 ) ) ( not ( = ?auto_120950 ?auto_120958 ) ) ( not ( = ?auto_120951 ?auto_120952 ) ) ( not ( = ?auto_120951 ?auto_120953 ) ) ( not ( = ?auto_120951 ?auto_120954 ) ) ( not ( = ?auto_120951 ?auto_120955 ) ) ( not ( = ?auto_120951 ?auto_120956 ) ) ( not ( = ?auto_120951 ?auto_120957 ) ) ( not ( = ?auto_120951 ?auto_120958 ) ) ( not ( = ?auto_120952 ?auto_120953 ) ) ( not ( = ?auto_120952 ?auto_120954 ) ) ( not ( = ?auto_120952 ?auto_120955 ) ) ( not ( = ?auto_120952 ?auto_120956 ) ) ( not ( = ?auto_120952 ?auto_120957 ) ) ( not ( = ?auto_120952 ?auto_120958 ) ) ( not ( = ?auto_120953 ?auto_120954 ) ) ( not ( = ?auto_120953 ?auto_120955 ) ) ( not ( = ?auto_120953 ?auto_120956 ) ) ( not ( = ?auto_120953 ?auto_120957 ) ) ( not ( = ?auto_120953 ?auto_120958 ) ) ( not ( = ?auto_120954 ?auto_120955 ) ) ( not ( = ?auto_120954 ?auto_120956 ) ) ( not ( = ?auto_120954 ?auto_120957 ) ) ( not ( = ?auto_120954 ?auto_120958 ) ) ( not ( = ?auto_120955 ?auto_120956 ) ) ( not ( = ?auto_120955 ?auto_120957 ) ) ( not ( = ?auto_120955 ?auto_120958 ) ) ( not ( = ?auto_120956 ?auto_120957 ) ) ( not ( = ?auto_120956 ?auto_120958 ) ) ( not ( = ?auto_120957 ?auto_120958 ) ) ( ON ?auto_120956 ?auto_120957 ) ( ON ?auto_120955 ?auto_120956 ) ( ON ?auto_120954 ?auto_120955 ) ( ON ?auto_120953 ?auto_120954 ) ( ON ?auto_120952 ?auto_120953 ) ( ON ?auto_120951 ?auto_120952 ) ( ON ?auto_120950 ?auto_120951 ) ( ON ?auto_120949 ?auto_120950 ) ( CLEAR ?auto_120949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120949 )
      ( MAKE-9PILE ?auto_120949 ?auto_120950 ?auto_120951 ?auto_120952 ?auto_120953 ?auto_120954 ?auto_120955 ?auto_120956 ?auto_120957 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_120988 - BLOCK
      ?auto_120989 - BLOCK
      ?auto_120990 - BLOCK
      ?auto_120991 - BLOCK
      ?auto_120992 - BLOCK
      ?auto_120993 - BLOCK
      ?auto_120994 - BLOCK
      ?auto_120995 - BLOCK
      ?auto_120996 - BLOCK
      ?auto_120997 - BLOCK
    )
    :vars
    (
      ?auto_120998 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_120996 ) ( ON ?auto_120997 ?auto_120998 ) ( CLEAR ?auto_120997 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120988 ) ( ON ?auto_120989 ?auto_120988 ) ( ON ?auto_120990 ?auto_120989 ) ( ON ?auto_120991 ?auto_120990 ) ( ON ?auto_120992 ?auto_120991 ) ( ON ?auto_120993 ?auto_120992 ) ( ON ?auto_120994 ?auto_120993 ) ( ON ?auto_120995 ?auto_120994 ) ( ON ?auto_120996 ?auto_120995 ) ( not ( = ?auto_120988 ?auto_120989 ) ) ( not ( = ?auto_120988 ?auto_120990 ) ) ( not ( = ?auto_120988 ?auto_120991 ) ) ( not ( = ?auto_120988 ?auto_120992 ) ) ( not ( = ?auto_120988 ?auto_120993 ) ) ( not ( = ?auto_120988 ?auto_120994 ) ) ( not ( = ?auto_120988 ?auto_120995 ) ) ( not ( = ?auto_120988 ?auto_120996 ) ) ( not ( = ?auto_120988 ?auto_120997 ) ) ( not ( = ?auto_120988 ?auto_120998 ) ) ( not ( = ?auto_120989 ?auto_120990 ) ) ( not ( = ?auto_120989 ?auto_120991 ) ) ( not ( = ?auto_120989 ?auto_120992 ) ) ( not ( = ?auto_120989 ?auto_120993 ) ) ( not ( = ?auto_120989 ?auto_120994 ) ) ( not ( = ?auto_120989 ?auto_120995 ) ) ( not ( = ?auto_120989 ?auto_120996 ) ) ( not ( = ?auto_120989 ?auto_120997 ) ) ( not ( = ?auto_120989 ?auto_120998 ) ) ( not ( = ?auto_120990 ?auto_120991 ) ) ( not ( = ?auto_120990 ?auto_120992 ) ) ( not ( = ?auto_120990 ?auto_120993 ) ) ( not ( = ?auto_120990 ?auto_120994 ) ) ( not ( = ?auto_120990 ?auto_120995 ) ) ( not ( = ?auto_120990 ?auto_120996 ) ) ( not ( = ?auto_120990 ?auto_120997 ) ) ( not ( = ?auto_120990 ?auto_120998 ) ) ( not ( = ?auto_120991 ?auto_120992 ) ) ( not ( = ?auto_120991 ?auto_120993 ) ) ( not ( = ?auto_120991 ?auto_120994 ) ) ( not ( = ?auto_120991 ?auto_120995 ) ) ( not ( = ?auto_120991 ?auto_120996 ) ) ( not ( = ?auto_120991 ?auto_120997 ) ) ( not ( = ?auto_120991 ?auto_120998 ) ) ( not ( = ?auto_120992 ?auto_120993 ) ) ( not ( = ?auto_120992 ?auto_120994 ) ) ( not ( = ?auto_120992 ?auto_120995 ) ) ( not ( = ?auto_120992 ?auto_120996 ) ) ( not ( = ?auto_120992 ?auto_120997 ) ) ( not ( = ?auto_120992 ?auto_120998 ) ) ( not ( = ?auto_120993 ?auto_120994 ) ) ( not ( = ?auto_120993 ?auto_120995 ) ) ( not ( = ?auto_120993 ?auto_120996 ) ) ( not ( = ?auto_120993 ?auto_120997 ) ) ( not ( = ?auto_120993 ?auto_120998 ) ) ( not ( = ?auto_120994 ?auto_120995 ) ) ( not ( = ?auto_120994 ?auto_120996 ) ) ( not ( = ?auto_120994 ?auto_120997 ) ) ( not ( = ?auto_120994 ?auto_120998 ) ) ( not ( = ?auto_120995 ?auto_120996 ) ) ( not ( = ?auto_120995 ?auto_120997 ) ) ( not ( = ?auto_120995 ?auto_120998 ) ) ( not ( = ?auto_120996 ?auto_120997 ) ) ( not ( = ?auto_120996 ?auto_120998 ) ) ( not ( = ?auto_120997 ?auto_120998 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120997 ?auto_120998 )
      ( !STACK ?auto_120997 ?auto_120996 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_121030 - BLOCK
      ?auto_121031 - BLOCK
      ?auto_121032 - BLOCK
      ?auto_121033 - BLOCK
      ?auto_121034 - BLOCK
      ?auto_121035 - BLOCK
      ?auto_121036 - BLOCK
      ?auto_121037 - BLOCK
      ?auto_121038 - BLOCK
      ?auto_121039 - BLOCK
    )
    :vars
    (
      ?auto_121040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121039 ?auto_121040 ) ( ON-TABLE ?auto_121030 ) ( ON ?auto_121031 ?auto_121030 ) ( ON ?auto_121032 ?auto_121031 ) ( ON ?auto_121033 ?auto_121032 ) ( ON ?auto_121034 ?auto_121033 ) ( ON ?auto_121035 ?auto_121034 ) ( ON ?auto_121036 ?auto_121035 ) ( ON ?auto_121037 ?auto_121036 ) ( not ( = ?auto_121030 ?auto_121031 ) ) ( not ( = ?auto_121030 ?auto_121032 ) ) ( not ( = ?auto_121030 ?auto_121033 ) ) ( not ( = ?auto_121030 ?auto_121034 ) ) ( not ( = ?auto_121030 ?auto_121035 ) ) ( not ( = ?auto_121030 ?auto_121036 ) ) ( not ( = ?auto_121030 ?auto_121037 ) ) ( not ( = ?auto_121030 ?auto_121038 ) ) ( not ( = ?auto_121030 ?auto_121039 ) ) ( not ( = ?auto_121030 ?auto_121040 ) ) ( not ( = ?auto_121031 ?auto_121032 ) ) ( not ( = ?auto_121031 ?auto_121033 ) ) ( not ( = ?auto_121031 ?auto_121034 ) ) ( not ( = ?auto_121031 ?auto_121035 ) ) ( not ( = ?auto_121031 ?auto_121036 ) ) ( not ( = ?auto_121031 ?auto_121037 ) ) ( not ( = ?auto_121031 ?auto_121038 ) ) ( not ( = ?auto_121031 ?auto_121039 ) ) ( not ( = ?auto_121031 ?auto_121040 ) ) ( not ( = ?auto_121032 ?auto_121033 ) ) ( not ( = ?auto_121032 ?auto_121034 ) ) ( not ( = ?auto_121032 ?auto_121035 ) ) ( not ( = ?auto_121032 ?auto_121036 ) ) ( not ( = ?auto_121032 ?auto_121037 ) ) ( not ( = ?auto_121032 ?auto_121038 ) ) ( not ( = ?auto_121032 ?auto_121039 ) ) ( not ( = ?auto_121032 ?auto_121040 ) ) ( not ( = ?auto_121033 ?auto_121034 ) ) ( not ( = ?auto_121033 ?auto_121035 ) ) ( not ( = ?auto_121033 ?auto_121036 ) ) ( not ( = ?auto_121033 ?auto_121037 ) ) ( not ( = ?auto_121033 ?auto_121038 ) ) ( not ( = ?auto_121033 ?auto_121039 ) ) ( not ( = ?auto_121033 ?auto_121040 ) ) ( not ( = ?auto_121034 ?auto_121035 ) ) ( not ( = ?auto_121034 ?auto_121036 ) ) ( not ( = ?auto_121034 ?auto_121037 ) ) ( not ( = ?auto_121034 ?auto_121038 ) ) ( not ( = ?auto_121034 ?auto_121039 ) ) ( not ( = ?auto_121034 ?auto_121040 ) ) ( not ( = ?auto_121035 ?auto_121036 ) ) ( not ( = ?auto_121035 ?auto_121037 ) ) ( not ( = ?auto_121035 ?auto_121038 ) ) ( not ( = ?auto_121035 ?auto_121039 ) ) ( not ( = ?auto_121035 ?auto_121040 ) ) ( not ( = ?auto_121036 ?auto_121037 ) ) ( not ( = ?auto_121036 ?auto_121038 ) ) ( not ( = ?auto_121036 ?auto_121039 ) ) ( not ( = ?auto_121036 ?auto_121040 ) ) ( not ( = ?auto_121037 ?auto_121038 ) ) ( not ( = ?auto_121037 ?auto_121039 ) ) ( not ( = ?auto_121037 ?auto_121040 ) ) ( not ( = ?auto_121038 ?auto_121039 ) ) ( not ( = ?auto_121038 ?auto_121040 ) ) ( not ( = ?auto_121039 ?auto_121040 ) ) ( CLEAR ?auto_121037 ) ( ON ?auto_121038 ?auto_121039 ) ( CLEAR ?auto_121038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_121030 ?auto_121031 ?auto_121032 ?auto_121033 ?auto_121034 ?auto_121035 ?auto_121036 ?auto_121037 ?auto_121038 )
      ( MAKE-10PILE ?auto_121030 ?auto_121031 ?auto_121032 ?auto_121033 ?auto_121034 ?auto_121035 ?auto_121036 ?auto_121037 ?auto_121038 ?auto_121039 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_121072 - BLOCK
      ?auto_121073 - BLOCK
      ?auto_121074 - BLOCK
      ?auto_121075 - BLOCK
      ?auto_121076 - BLOCK
      ?auto_121077 - BLOCK
      ?auto_121078 - BLOCK
      ?auto_121079 - BLOCK
      ?auto_121080 - BLOCK
      ?auto_121081 - BLOCK
    )
    :vars
    (
      ?auto_121082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121081 ?auto_121082 ) ( ON-TABLE ?auto_121072 ) ( ON ?auto_121073 ?auto_121072 ) ( ON ?auto_121074 ?auto_121073 ) ( ON ?auto_121075 ?auto_121074 ) ( ON ?auto_121076 ?auto_121075 ) ( ON ?auto_121077 ?auto_121076 ) ( ON ?auto_121078 ?auto_121077 ) ( not ( = ?auto_121072 ?auto_121073 ) ) ( not ( = ?auto_121072 ?auto_121074 ) ) ( not ( = ?auto_121072 ?auto_121075 ) ) ( not ( = ?auto_121072 ?auto_121076 ) ) ( not ( = ?auto_121072 ?auto_121077 ) ) ( not ( = ?auto_121072 ?auto_121078 ) ) ( not ( = ?auto_121072 ?auto_121079 ) ) ( not ( = ?auto_121072 ?auto_121080 ) ) ( not ( = ?auto_121072 ?auto_121081 ) ) ( not ( = ?auto_121072 ?auto_121082 ) ) ( not ( = ?auto_121073 ?auto_121074 ) ) ( not ( = ?auto_121073 ?auto_121075 ) ) ( not ( = ?auto_121073 ?auto_121076 ) ) ( not ( = ?auto_121073 ?auto_121077 ) ) ( not ( = ?auto_121073 ?auto_121078 ) ) ( not ( = ?auto_121073 ?auto_121079 ) ) ( not ( = ?auto_121073 ?auto_121080 ) ) ( not ( = ?auto_121073 ?auto_121081 ) ) ( not ( = ?auto_121073 ?auto_121082 ) ) ( not ( = ?auto_121074 ?auto_121075 ) ) ( not ( = ?auto_121074 ?auto_121076 ) ) ( not ( = ?auto_121074 ?auto_121077 ) ) ( not ( = ?auto_121074 ?auto_121078 ) ) ( not ( = ?auto_121074 ?auto_121079 ) ) ( not ( = ?auto_121074 ?auto_121080 ) ) ( not ( = ?auto_121074 ?auto_121081 ) ) ( not ( = ?auto_121074 ?auto_121082 ) ) ( not ( = ?auto_121075 ?auto_121076 ) ) ( not ( = ?auto_121075 ?auto_121077 ) ) ( not ( = ?auto_121075 ?auto_121078 ) ) ( not ( = ?auto_121075 ?auto_121079 ) ) ( not ( = ?auto_121075 ?auto_121080 ) ) ( not ( = ?auto_121075 ?auto_121081 ) ) ( not ( = ?auto_121075 ?auto_121082 ) ) ( not ( = ?auto_121076 ?auto_121077 ) ) ( not ( = ?auto_121076 ?auto_121078 ) ) ( not ( = ?auto_121076 ?auto_121079 ) ) ( not ( = ?auto_121076 ?auto_121080 ) ) ( not ( = ?auto_121076 ?auto_121081 ) ) ( not ( = ?auto_121076 ?auto_121082 ) ) ( not ( = ?auto_121077 ?auto_121078 ) ) ( not ( = ?auto_121077 ?auto_121079 ) ) ( not ( = ?auto_121077 ?auto_121080 ) ) ( not ( = ?auto_121077 ?auto_121081 ) ) ( not ( = ?auto_121077 ?auto_121082 ) ) ( not ( = ?auto_121078 ?auto_121079 ) ) ( not ( = ?auto_121078 ?auto_121080 ) ) ( not ( = ?auto_121078 ?auto_121081 ) ) ( not ( = ?auto_121078 ?auto_121082 ) ) ( not ( = ?auto_121079 ?auto_121080 ) ) ( not ( = ?auto_121079 ?auto_121081 ) ) ( not ( = ?auto_121079 ?auto_121082 ) ) ( not ( = ?auto_121080 ?auto_121081 ) ) ( not ( = ?auto_121080 ?auto_121082 ) ) ( not ( = ?auto_121081 ?auto_121082 ) ) ( ON ?auto_121080 ?auto_121081 ) ( CLEAR ?auto_121078 ) ( ON ?auto_121079 ?auto_121080 ) ( CLEAR ?auto_121079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_121072 ?auto_121073 ?auto_121074 ?auto_121075 ?auto_121076 ?auto_121077 ?auto_121078 ?auto_121079 )
      ( MAKE-10PILE ?auto_121072 ?auto_121073 ?auto_121074 ?auto_121075 ?auto_121076 ?auto_121077 ?auto_121078 ?auto_121079 ?auto_121080 ?auto_121081 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_121114 - BLOCK
      ?auto_121115 - BLOCK
      ?auto_121116 - BLOCK
      ?auto_121117 - BLOCK
      ?auto_121118 - BLOCK
      ?auto_121119 - BLOCK
      ?auto_121120 - BLOCK
      ?auto_121121 - BLOCK
      ?auto_121122 - BLOCK
      ?auto_121123 - BLOCK
    )
    :vars
    (
      ?auto_121124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121123 ?auto_121124 ) ( ON-TABLE ?auto_121114 ) ( ON ?auto_121115 ?auto_121114 ) ( ON ?auto_121116 ?auto_121115 ) ( ON ?auto_121117 ?auto_121116 ) ( ON ?auto_121118 ?auto_121117 ) ( ON ?auto_121119 ?auto_121118 ) ( not ( = ?auto_121114 ?auto_121115 ) ) ( not ( = ?auto_121114 ?auto_121116 ) ) ( not ( = ?auto_121114 ?auto_121117 ) ) ( not ( = ?auto_121114 ?auto_121118 ) ) ( not ( = ?auto_121114 ?auto_121119 ) ) ( not ( = ?auto_121114 ?auto_121120 ) ) ( not ( = ?auto_121114 ?auto_121121 ) ) ( not ( = ?auto_121114 ?auto_121122 ) ) ( not ( = ?auto_121114 ?auto_121123 ) ) ( not ( = ?auto_121114 ?auto_121124 ) ) ( not ( = ?auto_121115 ?auto_121116 ) ) ( not ( = ?auto_121115 ?auto_121117 ) ) ( not ( = ?auto_121115 ?auto_121118 ) ) ( not ( = ?auto_121115 ?auto_121119 ) ) ( not ( = ?auto_121115 ?auto_121120 ) ) ( not ( = ?auto_121115 ?auto_121121 ) ) ( not ( = ?auto_121115 ?auto_121122 ) ) ( not ( = ?auto_121115 ?auto_121123 ) ) ( not ( = ?auto_121115 ?auto_121124 ) ) ( not ( = ?auto_121116 ?auto_121117 ) ) ( not ( = ?auto_121116 ?auto_121118 ) ) ( not ( = ?auto_121116 ?auto_121119 ) ) ( not ( = ?auto_121116 ?auto_121120 ) ) ( not ( = ?auto_121116 ?auto_121121 ) ) ( not ( = ?auto_121116 ?auto_121122 ) ) ( not ( = ?auto_121116 ?auto_121123 ) ) ( not ( = ?auto_121116 ?auto_121124 ) ) ( not ( = ?auto_121117 ?auto_121118 ) ) ( not ( = ?auto_121117 ?auto_121119 ) ) ( not ( = ?auto_121117 ?auto_121120 ) ) ( not ( = ?auto_121117 ?auto_121121 ) ) ( not ( = ?auto_121117 ?auto_121122 ) ) ( not ( = ?auto_121117 ?auto_121123 ) ) ( not ( = ?auto_121117 ?auto_121124 ) ) ( not ( = ?auto_121118 ?auto_121119 ) ) ( not ( = ?auto_121118 ?auto_121120 ) ) ( not ( = ?auto_121118 ?auto_121121 ) ) ( not ( = ?auto_121118 ?auto_121122 ) ) ( not ( = ?auto_121118 ?auto_121123 ) ) ( not ( = ?auto_121118 ?auto_121124 ) ) ( not ( = ?auto_121119 ?auto_121120 ) ) ( not ( = ?auto_121119 ?auto_121121 ) ) ( not ( = ?auto_121119 ?auto_121122 ) ) ( not ( = ?auto_121119 ?auto_121123 ) ) ( not ( = ?auto_121119 ?auto_121124 ) ) ( not ( = ?auto_121120 ?auto_121121 ) ) ( not ( = ?auto_121120 ?auto_121122 ) ) ( not ( = ?auto_121120 ?auto_121123 ) ) ( not ( = ?auto_121120 ?auto_121124 ) ) ( not ( = ?auto_121121 ?auto_121122 ) ) ( not ( = ?auto_121121 ?auto_121123 ) ) ( not ( = ?auto_121121 ?auto_121124 ) ) ( not ( = ?auto_121122 ?auto_121123 ) ) ( not ( = ?auto_121122 ?auto_121124 ) ) ( not ( = ?auto_121123 ?auto_121124 ) ) ( ON ?auto_121122 ?auto_121123 ) ( ON ?auto_121121 ?auto_121122 ) ( CLEAR ?auto_121119 ) ( ON ?auto_121120 ?auto_121121 ) ( CLEAR ?auto_121120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_121114 ?auto_121115 ?auto_121116 ?auto_121117 ?auto_121118 ?auto_121119 ?auto_121120 )
      ( MAKE-10PILE ?auto_121114 ?auto_121115 ?auto_121116 ?auto_121117 ?auto_121118 ?auto_121119 ?auto_121120 ?auto_121121 ?auto_121122 ?auto_121123 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_121156 - BLOCK
      ?auto_121157 - BLOCK
      ?auto_121158 - BLOCK
      ?auto_121159 - BLOCK
      ?auto_121160 - BLOCK
      ?auto_121161 - BLOCK
      ?auto_121162 - BLOCK
      ?auto_121163 - BLOCK
      ?auto_121164 - BLOCK
      ?auto_121165 - BLOCK
    )
    :vars
    (
      ?auto_121166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121165 ?auto_121166 ) ( ON-TABLE ?auto_121156 ) ( ON ?auto_121157 ?auto_121156 ) ( ON ?auto_121158 ?auto_121157 ) ( ON ?auto_121159 ?auto_121158 ) ( ON ?auto_121160 ?auto_121159 ) ( not ( = ?auto_121156 ?auto_121157 ) ) ( not ( = ?auto_121156 ?auto_121158 ) ) ( not ( = ?auto_121156 ?auto_121159 ) ) ( not ( = ?auto_121156 ?auto_121160 ) ) ( not ( = ?auto_121156 ?auto_121161 ) ) ( not ( = ?auto_121156 ?auto_121162 ) ) ( not ( = ?auto_121156 ?auto_121163 ) ) ( not ( = ?auto_121156 ?auto_121164 ) ) ( not ( = ?auto_121156 ?auto_121165 ) ) ( not ( = ?auto_121156 ?auto_121166 ) ) ( not ( = ?auto_121157 ?auto_121158 ) ) ( not ( = ?auto_121157 ?auto_121159 ) ) ( not ( = ?auto_121157 ?auto_121160 ) ) ( not ( = ?auto_121157 ?auto_121161 ) ) ( not ( = ?auto_121157 ?auto_121162 ) ) ( not ( = ?auto_121157 ?auto_121163 ) ) ( not ( = ?auto_121157 ?auto_121164 ) ) ( not ( = ?auto_121157 ?auto_121165 ) ) ( not ( = ?auto_121157 ?auto_121166 ) ) ( not ( = ?auto_121158 ?auto_121159 ) ) ( not ( = ?auto_121158 ?auto_121160 ) ) ( not ( = ?auto_121158 ?auto_121161 ) ) ( not ( = ?auto_121158 ?auto_121162 ) ) ( not ( = ?auto_121158 ?auto_121163 ) ) ( not ( = ?auto_121158 ?auto_121164 ) ) ( not ( = ?auto_121158 ?auto_121165 ) ) ( not ( = ?auto_121158 ?auto_121166 ) ) ( not ( = ?auto_121159 ?auto_121160 ) ) ( not ( = ?auto_121159 ?auto_121161 ) ) ( not ( = ?auto_121159 ?auto_121162 ) ) ( not ( = ?auto_121159 ?auto_121163 ) ) ( not ( = ?auto_121159 ?auto_121164 ) ) ( not ( = ?auto_121159 ?auto_121165 ) ) ( not ( = ?auto_121159 ?auto_121166 ) ) ( not ( = ?auto_121160 ?auto_121161 ) ) ( not ( = ?auto_121160 ?auto_121162 ) ) ( not ( = ?auto_121160 ?auto_121163 ) ) ( not ( = ?auto_121160 ?auto_121164 ) ) ( not ( = ?auto_121160 ?auto_121165 ) ) ( not ( = ?auto_121160 ?auto_121166 ) ) ( not ( = ?auto_121161 ?auto_121162 ) ) ( not ( = ?auto_121161 ?auto_121163 ) ) ( not ( = ?auto_121161 ?auto_121164 ) ) ( not ( = ?auto_121161 ?auto_121165 ) ) ( not ( = ?auto_121161 ?auto_121166 ) ) ( not ( = ?auto_121162 ?auto_121163 ) ) ( not ( = ?auto_121162 ?auto_121164 ) ) ( not ( = ?auto_121162 ?auto_121165 ) ) ( not ( = ?auto_121162 ?auto_121166 ) ) ( not ( = ?auto_121163 ?auto_121164 ) ) ( not ( = ?auto_121163 ?auto_121165 ) ) ( not ( = ?auto_121163 ?auto_121166 ) ) ( not ( = ?auto_121164 ?auto_121165 ) ) ( not ( = ?auto_121164 ?auto_121166 ) ) ( not ( = ?auto_121165 ?auto_121166 ) ) ( ON ?auto_121164 ?auto_121165 ) ( ON ?auto_121163 ?auto_121164 ) ( ON ?auto_121162 ?auto_121163 ) ( CLEAR ?auto_121160 ) ( ON ?auto_121161 ?auto_121162 ) ( CLEAR ?auto_121161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121156 ?auto_121157 ?auto_121158 ?auto_121159 ?auto_121160 ?auto_121161 )
      ( MAKE-10PILE ?auto_121156 ?auto_121157 ?auto_121158 ?auto_121159 ?auto_121160 ?auto_121161 ?auto_121162 ?auto_121163 ?auto_121164 ?auto_121165 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_121198 - BLOCK
      ?auto_121199 - BLOCK
      ?auto_121200 - BLOCK
      ?auto_121201 - BLOCK
      ?auto_121202 - BLOCK
      ?auto_121203 - BLOCK
      ?auto_121204 - BLOCK
      ?auto_121205 - BLOCK
      ?auto_121206 - BLOCK
      ?auto_121207 - BLOCK
    )
    :vars
    (
      ?auto_121208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121207 ?auto_121208 ) ( ON-TABLE ?auto_121198 ) ( ON ?auto_121199 ?auto_121198 ) ( ON ?auto_121200 ?auto_121199 ) ( ON ?auto_121201 ?auto_121200 ) ( not ( = ?auto_121198 ?auto_121199 ) ) ( not ( = ?auto_121198 ?auto_121200 ) ) ( not ( = ?auto_121198 ?auto_121201 ) ) ( not ( = ?auto_121198 ?auto_121202 ) ) ( not ( = ?auto_121198 ?auto_121203 ) ) ( not ( = ?auto_121198 ?auto_121204 ) ) ( not ( = ?auto_121198 ?auto_121205 ) ) ( not ( = ?auto_121198 ?auto_121206 ) ) ( not ( = ?auto_121198 ?auto_121207 ) ) ( not ( = ?auto_121198 ?auto_121208 ) ) ( not ( = ?auto_121199 ?auto_121200 ) ) ( not ( = ?auto_121199 ?auto_121201 ) ) ( not ( = ?auto_121199 ?auto_121202 ) ) ( not ( = ?auto_121199 ?auto_121203 ) ) ( not ( = ?auto_121199 ?auto_121204 ) ) ( not ( = ?auto_121199 ?auto_121205 ) ) ( not ( = ?auto_121199 ?auto_121206 ) ) ( not ( = ?auto_121199 ?auto_121207 ) ) ( not ( = ?auto_121199 ?auto_121208 ) ) ( not ( = ?auto_121200 ?auto_121201 ) ) ( not ( = ?auto_121200 ?auto_121202 ) ) ( not ( = ?auto_121200 ?auto_121203 ) ) ( not ( = ?auto_121200 ?auto_121204 ) ) ( not ( = ?auto_121200 ?auto_121205 ) ) ( not ( = ?auto_121200 ?auto_121206 ) ) ( not ( = ?auto_121200 ?auto_121207 ) ) ( not ( = ?auto_121200 ?auto_121208 ) ) ( not ( = ?auto_121201 ?auto_121202 ) ) ( not ( = ?auto_121201 ?auto_121203 ) ) ( not ( = ?auto_121201 ?auto_121204 ) ) ( not ( = ?auto_121201 ?auto_121205 ) ) ( not ( = ?auto_121201 ?auto_121206 ) ) ( not ( = ?auto_121201 ?auto_121207 ) ) ( not ( = ?auto_121201 ?auto_121208 ) ) ( not ( = ?auto_121202 ?auto_121203 ) ) ( not ( = ?auto_121202 ?auto_121204 ) ) ( not ( = ?auto_121202 ?auto_121205 ) ) ( not ( = ?auto_121202 ?auto_121206 ) ) ( not ( = ?auto_121202 ?auto_121207 ) ) ( not ( = ?auto_121202 ?auto_121208 ) ) ( not ( = ?auto_121203 ?auto_121204 ) ) ( not ( = ?auto_121203 ?auto_121205 ) ) ( not ( = ?auto_121203 ?auto_121206 ) ) ( not ( = ?auto_121203 ?auto_121207 ) ) ( not ( = ?auto_121203 ?auto_121208 ) ) ( not ( = ?auto_121204 ?auto_121205 ) ) ( not ( = ?auto_121204 ?auto_121206 ) ) ( not ( = ?auto_121204 ?auto_121207 ) ) ( not ( = ?auto_121204 ?auto_121208 ) ) ( not ( = ?auto_121205 ?auto_121206 ) ) ( not ( = ?auto_121205 ?auto_121207 ) ) ( not ( = ?auto_121205 ?auto_121208 ) ) ( not ( = ?auto_121206 ?auto_121207 ) ) ( not ( = ?auto_121206 ?auto_121208 ) ) ( not ( = ?auto_121207 ?auto_121208 ) ) ( ON ?auto_121206 ?auto_121207 ) ( ON ?auto_121205 ?auto_121206 ) ( ON ?auto_121204 ?auto_121205 ) ( ON ?auto_121203 ?auto_121204 ) ( CLEAR ?auto_121201 ) ( ON ?auto_121202 ?auto_121203 ) ( CLEAR ?auto_121202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121198 ?auto_121199 ?auto_121200 ?auto_121201 ?auto_121202 )
      ( MAKE-10PILE ?auto_121198 ?auto_121199 ?auto_121200 ?auto_121201 ?auto_121202 ?auto_121203 ?auto_121204 ?auto_121205 ?auto_121206 ?auto_121207 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_121240 - BLOCK
      ?auto_121241 - BLOCK
      ?auto_121242 - BLOCK
      ?auto_121243 - BLOCK
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
    )
    :precondition
    ( and ( ON ?auto_121249 ?auto_121250 ) ( ON-TABLE ?auto_121240 ) ( ON ?auto_121241 ?auto_121240 ) ( ON ?auto_121242 ?auto_121241 ) ( not ( = ?auto_121240 ?auto_121241 ) ) ( not ( = ?auto_121240 ?auto_121242 ) ) ( not ( = ?auto_121240 ?auto_121243 ) ) ( not ( = ?auto_121240 ?auto_121244 ) ) ( not ( = ?auto_121240 ?auto_121245 ) ) ( not ( = ?auto_121240 ?auto_121246 ) ) ( not ( = ?auto_121240 ?auto_121247 ) ) ( not ( = ?auto_121240 ?auto_121248 ) ) ( not ( = ?auto_121240 ?auto_121249 ) ) ( not ( = ?auto_121240 ?auto_121250 ) ) ( not ( = ?auto_121241 ?auto_121242 ) ) ( not ( = ?auto_121241 ?auto_121243 ) ) ( not ( = ?auto_121241 ?auto_121244 ) ) ( not ( = ?auto_121241 ?auto_121245 ) ) ( not ( = ?auto_121241 ?auto_121246 ) ) ( not ( = ?auto_121241 ?auto_121247 ) ) ( not ( = ?auto_121241 ?auto_121248 ) ) ( not ( = ?auto_121241 ?auto_121249 ) ) ( not ( = ?auto_121241 ?auto_121250 ) ) ( not ( = ?auto_121242 ?auto_121243 ) ) ( not ( = ?auto_121242 ?auto_121244 ) ) ( not ( = ?auto_121242 ?auto_121245 ) ) ( not ( = ?auto_121242 ?auto_121246 ) ) ( not ( = ?auto_121242 ?auto_121247 ) ) ( not ( = ?auto_121242 ?auto_121248 ) ) ( not ( = ?auto_121242 ?auto_121249 ) ) ( not ( = ?auto_121242 ?auto_121250 ) ) ( not ( = ?auto_121243 ?auto_121244 ) ) ( not ( = ?auto_121243 ?auto_121245 ) ) ( not ( = ?auto_121243 ?auto_121246 ) ) ( not ( = ?auto_121243 ?auto_121247 ) ) ( not ( = ?auto_121243 ?auto_121248 ) ) ( not ( = ?auto_121243 ?auto_121249 ) ) ( not ( = ?auto_121243 ?auto_121250 ) ) ( not ( = ?auto_121244 ?auto_121245 ) ) ( not ( = ?auto_121244 ?auto_121246 ) ) ( not ( = ?auto_121244 ?auto_121247 ) ) ( not ( = ?auto_121244 ?auto_121248 ) ) ( not ( = ?auto_121244 ?auto_121249 ) ) ( not ( = ?auto_121244 ?auto_121250 ) ) ( not ( = ?auto_121245 ?auto_121246 ) ) ( not ( = ?auto_121245 ?auto_121247 ) ) ( not ( = ?auto_121245 ?auto_121248 ) ) ( not ( = ?auto_121245 ?auto_121249 ) ) ( not ( = ?auto_121245 ?auto_121250 ) ) ( not ( = ?auto_121246 ?auto_121247 ) ) ( not ( = ?auto_121246 ?auto_121248 ) ) ( not ( = ?auto_121246 ?auto_121249 ) ) ( not ( = ?auto_121246 ?auto_121250 ) ) ( not ( = ?auto_121247 ?auto_121248 ) ) ( not ( = ?auto_121247 ?auto_121249 ) ) ( not ( = ?auto_121247 ?auto_121250 ) ) ( not ( = ?auto_121248 ?auto_121249 ) ) ( not ( = ?auto_121248 ?auto_121250 ) ) ( not ( = ?auto_121249 ?auto_121250 ) ) ( ON ?auto_121248 ?auto_121249 ) ( ON ?auto_121247 ?auto_121248 ) ( ON ?auto_121246 ?auto_121247 ) ( ON ?auto_121245 ?auto_121246 ) ( ON ?auto_121244 ?auto_121245 ) ( CLEAR ?auto_121242 ) ( ON ?auto_121243 ?auto_121244 ) ( CLEAR ?auto_121243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121240 ?auto_121241 ?auto_121242 ?auto_121243 )
      ( MAKE-10PILE ?auto_121240 ?auto_121241 ?auto_121242 ?auto_121243 ?auto_121244 ?auto_121245 ?auto_121246 ?auto_121247 ?auto_121248 ?auto_121249 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_121282 - BLOCK
      ?auto_121283 - BLOCK
      ?auto_121284 - BLOCK
      ?auto_121285 - BLOCK
      ?auto_121286 - BLOCK
      ?auto_121287 - BLOCK
      ?auto_121288 - BLOCK
      ?auto_121289 - BLOCK
      ?auto_121290 - BLOCK
      ?auto_121291 - BLOCK
    )
    :vars
    (
      ?auto_121292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121291 ?auto_121292 ) ( ON-TABLE ?auto_121282 ) ( ON ?auto_121283 ?auto_121282 ) ( not ( = ?auto_121282 ?auto_121283 ) ) ( not ( = ?auto_121282 ?auto_121284 ) ) ( not ( = ?auto_121282 ?auto_121285 ) ) ( not ( = ?auto_121282 ?auto_121286 ) ) ( not ( = ?auto_121282 ?auto_121287 ) ) ( not ( = ?auto_121282 ?auto_121288 ) ) ( not ( = ?auto_121282 ?auto_121289 ) ) ( not ( = ?auto_121282 ?auto_121290 ) ) ( not ( = ?auto_121282 ?auto_121291 ) ) ( not ( = ?auto_121282 ?auto_121292 ) ) ( not ( = ?auto_121283 ?auto_121284 ) ) ( not ( = ?auto_121283 ?auto_121285 ) ) ( not ( = ?auto_121283 ?auto_121286 ) ) ( not ( = ?auto_121283 ?auto_121287 ) ) ( not ( = ?auto_121283 ?auto_121288 ) ) ( not ( = ?auto_121283 ?auto_121289 ) ) ( not ( = ?auto_121283 ?auto_121290 ) ) ( not ( = ?auto_121283 ?auto_121291 ) ) ( not ( = ?auto_121283 ?auto_121292 ) ) ( not ( = ?auto_121284 ?auto_121285 ) ) ( not ( = ?auto_121284 ?auto_121286 ) ) ( not ( = ?auto_121284 ?auto_121287 ) ) ( not ( = ?auto_121284 ?auto_121288 ) ) ( not ( = ?auto_121284 ?auto_121289 ) ) ( not ( = ?auto_121284 ?auto_121290 ) ) ( not ( = ?auto_121284 ?auto_121291 ) ) ( not ( = ?auto_121284 ?auto_121292 ) ) ( not ( = ?auto_121285 ?auto_121286 ) ) ( not ( = ?auto_121285 ?auto_121287 ) ) ( not ( = ?auto_121285 ?auto_121288 ) ) ( not ( = ?auto_121285 ?auto_121289 ) ) ( not ( = ?auto_121285 ?auto_121290 ) ) ( not ( = ?auto_121285 ?auto_121291 ) ) ( not ( = ?auto_121285 ?auto_121292 ) ) ( not ( = ?auto_121286 ?auto_121287 ) ) ( not ( = ?auto_121286 ?auto_121288 ) ) ( not ( = ?auto_121286 ?auto_121289 ) ) ( not ( = ?auto_121286 ?auto_121290 ) ) ( not ( = ?auto_121286 ?auto_121291 ) ) ( not ( = ?auto_121286 ?auto_121292 ) ) ( not ( = ?auto_121287 ?auto_121288 ) ) ( not ( = ?auto_121287 ?auto_121289 ) ) ( not ( = ?auto_121287 ?auto_121290 ) ) ( not ( = ?auto_121287 ?auto_121291 ) ) ( not ( = ?auto_121287 ?auto_121292 ) ) ( not ( = ?auto_121288 ?auto_121289 ) ) ( not ( = ?auto_121288 ?auto_121290 ) ) ( not ( = ?auto_121288 ?auto_121291 ) ) ( not ( = ?auto_121288 ?auto_121292 ) ) ( not ( = ?auto_121289 ?auto_121290 ) ) ( not ( = ?auto_121289 ?auto_121291 ) ) ( not ( = ?auto_121289 ?auto_121292 ) ) ( not ( = ?auto_121290 ?auto_121291 ) ) ( not ( = ?auto_121290 ?auto_121292 ) ) ( not ( = ?auto_121291 ?auto_121292 ) ) ( ON ?auto_121290 ?auto_121291 ) ( ON ?auto_121289 ?auto_121290 ) ( ON ?auto_121288 ?auto_121289 ) ( ON ?auto_121287 ?auto_121288 ) ( ON ?auto_121286 ?auto_121287 ) ( ON ?auto_121285 ?auto_121286 ) ( CLEAR ?auto_121283 ) ( ON ?auto_121284 ?auto_121285 ) ( CLEAR ?auto_121284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121282 ?auto_121283 ?auto_121284 )
      ( MAKE-10PILE ?auto_121282 ?auto_121283 ?auto_121284 ?auto_121285 ?auto_121286 ?auto_121287 ?auto_121288 ?auto_121289 ?auto_121290 ?auto_121291 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_121324 - BLOCK
      ?auto_121325 - BLOCK
      ?auto_121326 - BLOCK
      ?auto_121327 - BLOCK
      ?auto_121328 - BLOCK
      ?auto_121329 - BLOCK
      ?auto_121330 - BLOCK
      ?auto_121331 - BLOCK
      ?auto_121332 - BLOCK
      ?auto_121333 - BLOCK
    )
    :vars
    (
      ?auto_121334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121333 ?auto_121334 ) ( ON-TABLE ?auto_121324 ) ( not ( = ?auto_121324 ?auto_121325 ) ) ( not ( = ?auto_121324 ?auto_121326 ) ) ( not ( = ?auto_121324 ?auto_121327 ) ) ( not ( = ?auto_121324 ?auto_121328 ) ) ( not ( = ?auto_121324 ?auto_121329 ) ) ( not ( = ?auto_121324 ?auto_121330 ) ) ( not ( = ?auto_121324 ?auto_121331 ) ) ( not ( = ?auto_121324 ?auto_121332 ) ) ( not ( = ?auto_121324 ?auto_121333 ) ) ( not ( = ?auto_121324 ?auto_121334 ) ) ( not ( = ?auto_121325 ?auto_121326 ) ) ( not ( = ?auto_121325 ?auto_121327 ) ) ( not ( = ?auto_121325 ?auto_121328 ) ) ( not ( = ?auto_121325 ?auto_121329 ) ) ( not ( = ?auto_121325 ?auto_121330 ) ) ( not ( = ?auto_121325 ?auto_121331 ) ) ( not ( = ?auto_121325 ?auto_121332 ) ) ( not ( = ?auto_121325 ?auto_121333 ) ) ( not ( = ?auto_121325 ?auto_121334 ) ) ( not ( = ?auto_121326 ?auto_121327 ) ) ( not ( = ?auto_121326 ?auto_121328 ) ) ( not ( = ?auto_121326 ?auto_121329 ) ) ( not ( = ?auto_121326 ?auto_121330 ) ) ( not ( = ?auto_121326 ?auto_121331 ) ) ( not ( = ?auto_121326 ?auto_121332 ) ) ( not ( = ?auto_121326 ?auto_121333 ) ) ( not ( = ?auto_121326 ?auto_121334 ) ) ( not ( = ?auto_121327 ?auto_121328 ) ) ( not ( = ?auto_121327 ?auto_121329 ) ) ( not ( = ?auto_121327 ?auto_121330 ) ) ( not ( = ?auto_121327 ?auto_121331 ) ) ( not ( = ?auto_121327 ?auto_121332 ) ) ( not ( = ?auto_121327 ?auto_121333 ) ) ( not ( = ?auto_121327 ?auto_121334 ) ) ( not ( = ?auto_121328 ?auto_121329 ) ) ( not ( = ?auto_121328 ?auto_121330 ) ) ( not ( = ?auto_121328 ?auto_121331 ) ) ( not ( = ?auto_121328 ?auto_121332 ) ) ( not ( = ?auto_121328 ?auto_121333 ) ) ( not ( = ?auto_121328 ?auto_121334 ) ) ( not ( = ?auto_121329 ?auto_121330 ) ) ( not ( = ?auto_121329 ?auto_121331 ) ) ( not ( = ?auto_121329 ?auto_121332 ) ) ( not ( = ?auto_121329 ?auto_121333 ) ) ( not ( = ?auto_121329 ?auto_121334 ) ) ( not ( = ?auto_121330 ?auto_121331 ) ) ( not ( = ?auto_121330 ?auto_121332 ) ) ( not ( = ?auto_121330 ?auto_121333 ) ) ( not ( = ?auto_121330 ?auto_121334 ) ) ( not ( = ?auto_121331 ?auto_121332 ) ) ( not ( = ?auto_121331 ?auto_121333 ) ) ( not ( = ?auto_121331 ?auto_121334 ) ) ( not ( = ?auto_121332 ?auto_121333 ) ) ( not ( = ?auto_121332 ?auto_121334 ) ) ( not ( = ?auto_121333 ?auto_121334 ) ) ( ON ?auto_121332 ?auto_121333 ) ( ON ?auto_121331 ?auto_121332 ) ( ON ?auto_121330 ?auto_121331 ) ( ON ?auto_121329 ?auto_121330 ) ( ON ?auto_121328 ?auto_121329 ) ( ON ?auto_121327 ?auto_121328 ) ( ON ?auto_121326 ?auto_121327 ) ( CLEAR ?auto_121324 ) ( ON ?auto_121325 ?auto_121326 ) ( CLEAR ?auto_121325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121324 ?auto_121325 )
      ( MAKE-10PILE ?auto_121324 ?auto_121325 ?auto_121326 ?auto_121327 ?auto_121328 ?auto_121329 ?auto_121330 ?auto_121331 ?auto_121332 ?auto_121333 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_121366 - BLOCK
      ?auto_121367 - BLOCK
      ?auto_121368 - BLOCK
      ?auto_121369 - BLOCK
      ?auto_121370 - BLOCK
      ?auto_121371 - BLOCK
      ?auto_121372 - BLOCK
      ?auto_121373 - BLOCK
      ?auto_121374 - BLOCK
      ?auto_121375 - BLOCK
    )
    :vars
    (
      ?auto_121376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121375 ?auto_121376 ) ( not ( = ?auto_121366 ?auto_121367 ) ) ( not ( = ?auto_121366 ?auto_121368 ) ) ( not ( = ?auto_121366 ?auto_121369 ) ) ( not ( = ?auto_121366 ?auto_121370 ) ) ( not ( = ?auto_121366 ?auto_121371 ) ) ( not ( = ?auto_121366 ?auto_121372 ) ) ( not ( = ?auto_121366 ?auto_121373 ) ) ( not ( = ?auto_121366 ?auto_121374 ) ) ( not ( = ?auto_121366 ?auto_121375 ) ) ( not ( = ?auto_121366 ?auto_121376 ) ) ( not ( = ?auto_121367 ?auto_121368 ) ) ( not ( = ?auto_121367 ?auto_121369 ) ) ( not ( = ?auto_121367 ?auto_121370 ) ) ( not ( = ?auto_121367 ?auto_121371 ) ) ( not ( = ?auto_121367 ?auto_121372 ) ) ( not ( = ?auto_121367 ?auto_121373 ) ) ( not ( = ?auto_121367 ?auto_121374 ) ) ( not ( = ?auto_121367 ?auto_121375 ) ) ( not ( = ?auto_121367 ?auto_121376 ) ) ( not ( = ?auto_121368 ?auto_121369 ) ) ( not ( = ?auto_121368 ?auto_121370 ) ) ( not ( = ?auto_121368 ?auto_121371 ) ) ( not ( = ?auto_121368 ?auto_121372 ) ) ( not ( = ?auto_121368 ?auto_121373 ) ) ( not ( = ?auto_121368 ?auto_121374 ) ) ( not ( = ?auto_121368 ?auto_121375 ) ) ( not ( = ?auto_121368 ?auto_121376 ) ) ( not ( = ?auto_121369 ?auto_121370 ) ) ( not ( = ?auto_121369 ?auto_121371 ) ) ( not ( = ?auto_121369 ?auto_121372 ) ) ( not ( = ?auto_121369 ?auto_121373 ) ) ( not ( = ?auto_121369 ?auto_121374 ) ) ( not ( = ?auto_121369 ?auto_121375 ) ) ( not ( = ?auto_121369 ?auto_121376 ) ) ( not ( = ?auto_121370 ?auto_121371 ) ) ( not ( = ?auto_121370 ?auto_121372 ) ) ( not ( = ?auto_121370 ?auto_121373 ) ) ( not ( = ?auto_121370 ?auto_121374 ) ) ( not ( = ?auto_121370 ?auto_121375 ) ) ( not ( = ?auto_121370 ?auto_121376 ) ) ( not ( = ?auto_121371 ?auto_121372 ) ) ( not ( = ?auto_121371 ?auto_121373 ) ) ( not ( = ?auto_121371 ?auto_121374 ) ) ( not ( = ?auto_121371 ?auto_121375 ) ) ( not ( = ?auto_121371 ?auto_121376 ) ) ( not ( = ?auto_121372 ?auto_121373 ) ) ( not ( = ?auto_121372 ?auto_121374 ) ) ( not ( = ?auto_121372 ?auto_121375 ) ) ( not ( = ?auto_121372 ?auto_121376 ) ) ( not ( = ?auto_121373 ?auto_121374 ) ) ( not ( = ?auto_121373 ?auto_121375 ) ) ( not ( = ?auto_121373 ?auto_121376 ) ) ( not ( = ?auto_121374 ?auto_121375 ) ) ( not ( = ?auto_121374 ?auto_121376 ) ) ( not ( = ?auto_121375 ?auto_121376 ) ) ( ON ?auto_121374 ?auto_121375 ) ( ON ?auto_121373 ?auto_121374 ) ( ON ?auto_121372 ?auto_121373 ) ( ON ?auto_121371 ?auto_121372 ) ( ON ?auto_121370 ?auto_121371 ) ( ON ?auto_121369 ?auto_121370 ) ( ON ?auto_121368 ?auto_121369 ) ( ON ?auto_121367 ?auto_121368 ) ( ON ?auto_121366 ?auto_121367 ) ( CLEAR ?auto_121366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121366 )
      ( MAKE-10PILE ?auto_121366 ?auto_121367 ?auto_121368 ?auto_121369 ?auto_121370 ?auto_121371 ?auto_121372 ?auto_121373 ?auto_121374 ?auto_121375 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_121409 - BLOCK
      ?auto_121410 - BLOCK
      ?auto_121411 - BLOCK
      ?auto_121412 - BLOCK
      ?auto_121413 - BLOCK
      ?auto_121414 - BLOCK
      ?auto_121415 - BLOCK
      ?auto_121416 - BLOCK
      ?auto_121417 - BLOCK
      ?auto_121418 - BLOCK
      ?auto_121419 - BLOCK
    )
    :vars
    (
      ?auto_121420 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_121418 ) ( ON ?auto_121419 ?auto_121420 ) ( CLEAR ?auto_121419 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121409 ) ( ON ?auto_121410 ?auto_121409 ) ( ON ?auto_121411 ?auto_121410 ) ( ON ?auto_121412 ?auto_121411 ) ( ON ?auto_121413 ?auto_121412 ) ( ON ?auto_121414 ?auto_121413 ) ( ON ?auto_121415 ?auto_121414 ) ( ON ?auto_121416 ?auto_121415 ) ( ON ?auto_121417 ?auto_121416 ) ( ON ?auto_121418 ?auto_121417 ) ( not ( = ?auto_121409 ?auto_121410 ) ) ( not ( = ?auto_121409 ?auto_121411 ) ) ( not ( = ?auto_121409 ?auto_121412 ) ) ( not ( = ?auto_121409 ?auto_121413 ) ) ( not ( = ?auto_121409 ?auto_121414 ) ) ( not ( = ?auto_121409 ?auto_121415 ) ) ( not ( = ?auto_121409 ?auto_121416 ) ) ( not ( = ?auto_121409 ?auto_121417 ) ) ( not ( = ?auto_121409 ?auto_121418 ) ) ( not ( = ?auto_121409 ?auto_121419 ) ) ( not ( = ?auto_121409 ?auto_121420 ) ) ( not ( = ?auto_121410 ?auto_121411 ) ) ( not ( = ?auto_121410 ?auto_121412 ) ) ( not ( = ?auto_121410 ?auto_121413 ) ) ( not ( = ?auto_121410 ?auto_121414 ) ) ( not ( = ?auto_121410 ?auto_121415 ) ) ( not ( = ?auto_121410 ?auto_121416 ) ) ( not ( = ?auto_121410 ?auto_121417 ) ) ( not ( = ?auto_121410 ?auto_121418 ) ) ( not ( = ?auto_121410 ?auto_121419 ) ) ( not ( = ?auto_121410 ?auto_121420 ) ) ( not ( = ?auto_121411 ?auto_121412 ) ) ( not ( = ?auto_121411 ?auto_121413 ) ) ( not ( = ?auto_121411 ?auto_121414 ) ) ( not ( = ?auto_121411 ?auto_121415 ) ) ( not ( = ?auto_121411 ?auto_121416 ) ) ( not ( = ?auto_121411 ?auto_121417 ) ) ( not ( = ?auto_121411 ?auto_121418 ) ) ( not ( = ?auto_121411 ?auto_121419 ) ) ( not ( = ?auto_121411 ?auto_121420 ) ) ( not ( = ?auto_121412 ?auto_121413 ) ) ( not ( = ?auto_121412 ?auto_121414 ) ) ( not ( = ?auto_121412 ?auto_121415 ) ) ( not ( = ?auto_121412 ?auto_121416 ) ) ( not ( = ?auto_121412 ?auto_121417 ) ) ( not ( = ?auto_121412 ?auto_121418 ) ) ( not ( = ?auto_121412 ?auto_121419 ) ) ( not ( = ?auto_121412 ?auto_121420 ) ) ( not ( = ?auto_121413 ?auto_121414 ) ) ( not ( = ?auto_121413 ?auto_121415 ) ) ( not ( = ?auto_121413 ?auto_121416 ) ) ( not ( = ?auto_121413 ?auto_121417 ) ) ( not ( = ?auto_121413 ?auto_121418 ) ) ( not ( = ?auto_121413 ?auto_121419 ) ) ( not ( = ?auto_121413 ?auto_121420 ) ) ( not ( = ?auto_121414 ?auto_121415 ) ) ( not ( = ?auto_121414 ?auto_121416 ) ) ( not ( = ?auto_121414 ?auto_121417 ) ) ( not ( = ?auto_121414 ?auto_121418 ) ) ( not ( = ?auto_121414 ?auto_121419 ) ) ( not ( = ?auto_121414 ?auto_121420 ) ) ( not ( = ?auto_121415 ?auto_121416 ) ) ( not ( = ?auto_121415 ?auto_121417 ) ) ( not ( = ?auto_121415 ?auto_121418 ) ) ( not ( = ?auto_121415 ?auto_121419 ) ) ( not ( = ?auto_121415 ?auto_121420 ) ) ( not ( = ?auto_121416 ?auto_121417 ) ) ( not ( = ?auto_121416 ?auto_121418 ) ) ( not ( = ?auto_121416 ?auto_121419 ) ) ( not ( = ?auto_121416 ?auto_121420 ) ) ( not ( = ?auto_121417 ?auto_121418 ) ) ( not ( = ?auto_121417 ?auto_121419 ) ) ( not ( = ?auto_121417 ?auto_121420 ) ) ( not ( = ?auto_121418 ?auto_121419 ) ) ( not ( = ?auto_121418 ?auto_121420 ) ) ( not ( = ?auto_121419 ?auto_121420 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121419 ?auto_121420 )
      ( !STACK ?auto_121419 ?auto_121418 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_121432 - BLOCK
      ?auto_121433 - BLOCK
      ?auto_121434 - BLOCK
      ?auto_121435 - BLOCK
      ?auto_121436 - BLOCK
      ?auto_121437 - BLOCK
      ?auto_121438 - BLOCK
      ?auto_121439 - BLOCK
      ?auto_121440 - BLOCK
      ?auto_121441 - BLOCK
      ?auto_121442 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_121441 ) ( ON-TABLE ?auto_121442 ) ( CLEAR ?auto_121442 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121432 ) ( ON ?auto_121433 ?auto_121432 ) ( ON ?auto_121434 ?auto_121433 ) ( ON ?auto_121435 ?auto_121434 ) ( ON ?auto_121436 ?auto_121435 ) ( ON ?auto_121437 ?auto_121436 ) ( ON ?auto_121438 ?auto_121437 ) ( ON ?auto_121439 ?auto_121438 ) ( ON ?auto_121440 ?auto_121439 ) ( ON ?auto_121441 ?auto_121440 ) ( not ( = ?auto_121432 ?auto_121433 ) ) ( not ( = ?auto_121432 ?auto_121434 ) ) ( not ( = ?auto_121432 ?auto_121435 ) ) ( not ( = ?auto_121432 ?auto_121436 ) ) ( not ( = ?auto_121432 ?auto_121437 ) ) ( not ( = ?auto_121432 ?auto_121438 ) ) ( not ( = ?auto_121432 ?auto_121439 ) ) ( not ( = ?auto_121432 ?auto_121440 ) ) ( not ( = ?auto_121432 ?auto_121441 ) ) ( not ( = ?auto_121432 ?auto_121442 ) ) ( not ( = ?auto_121433 ?auto_121434 ) ) ( not ( = ?auto_121433 ?auto_121435 ) ) ( not ( = ?auto_121433 ?auto_121436 ) ) ( not ( = ?auto_121433 ?auto_121437 ) ) ( not ( = ?auto_121433 ?auto_121438 ) ) ( not ( = ?auto_121433 ?auto_121439 ) ) ( not ( = ?auto_121433 ?auto_121440 ) ) ( not ( = ?auto_121433 ?auto_121441 ) ) ( not ( = ?auto_121433 ?auto_121442 ) ) ( not ( = ?auto_121434 ?auto_121435 ) ) ( not ( = ?auto_121434 ?auto_121436 ) ) ( not ( = ?auto_121434 ?auto_121437 ) ) ( not ( = ?auto_121434 ?auto_121438 ) ) ( not ( = ?auto_121434 ?auto_121439 ) ) ( not ( = ?auto_121434 ?auto_121440 ) ) ( not ( = ?auto_121434 ?auto_121441 ) ) ( not ( = ?auto_121434 ?auto_121442 ) ) ( not ( = ?auto_121435 ?auto_121436 ) ) ( not ( = ?auto_121435 ?auto_121437 ) ) ( not ( = ?auto_121435 ?auto_121438 ) ) ( not ( = ?auto_121435 ?auto_121439 ) ) ( not ( = ?auto_121435 ?auto_121440 ) ) ( not ( = ?auto_121435 ?auto_121441 ) ) ( not ( = ?auto_121435 ?auto_121442 ) ) ( not ( = ?auto_121436 ?auto_121437 ) ) ( not ( = ?auto_121436 ?auto_121438 ) ) ( not ( = ?auto_121436 ?auto_121439 ) ) ( not ( = ?auto_121436 ?auto_121440 ) ) ( not ( = ?auto_121436 ?auto_121441 ) ) ( not ( = ?auto_121436 ?auto_121442 ) ) ( not ( = ?auto_121437 ?auto_121438 ) ) ( not ( = ?auto_121437 ?auto_121439 ) ) ( not ( = ?auto_121437 ?auto_121440 ) ) ( not ( = ?auto_121437 ?auto_121441 ) ) ( not ( = ?auto_121437 ?auto_121442 ) ) ( not ( = ?auto_121438 ?auto_121439 ) ) ( not ( = ?auto_121438 ?auto_121440 ) ) ( not ( = ?auto_121438 ?auto_121441 ) ) ( not ( = ?auto_121438 ?auto_121442 ) ) ( not ( = ?auto_121439 ?auto_121440 ) ) ( not ( = ?auto_121439 ?auto_121441 ) ) ( not ( = ?auto_121439 ?auto_121442 ) ) ( not ( = ?auto_121440 ?auto_121441 ) ) ( not ( = ?auto_121440 ?auto_121442 ) ) ( not ( = ?auto_121441 ?auto_121442 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_121442 )
      ( !STACK ?auto_121442 ?auto_121441 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_121454 - BLOCK
      ?auto_121455 - BLOCK
      ?auto_121456 - BLOCK
      ?auto_121457 - BLOCK
      ?auto_121458 - BLOCK
      ?auto_121459 - BLOCK
      ?auto_121460 - BLOCK
      ?auto_121461 - BLOCK
      ?auto_121462 - BLOCK
      ?auto_121463 - BLOCK
      ?auto_121464 - BLOCK
    )
    :vars
    (
      ?auto_121465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121464 ?auto_121465 ) ( ON-TABLE ?auto_121454 ) ( ON ?auto_121455 ?auto_121454 ) ( ON ?auto_121456 ?auto_121455 ) ( ON ?auto_121457 ?auto_121456 ) ( ON ?auto_121458 ?auto_121457 ) ( ON ?auto_121459 ?auto_121458 ) ( ON ?auto_121460 ?auto_121459 ) ( ON ?auto_121461 ?auto_121460 ) ( ON ?auto_121462 ?auto_121461 ) ( not ( = ?auto_121454 ?auto_121455 ) ) ( not ( = ?auto_121454 ?auto_121456 ) ) ( not ( = ?auto_121454 ?auto_121457 ) ) ( not ( = ?auto_121454 ?auto_121458 ) ) ( not ( = ?auto_121454 ?auto_121459 ) ) ( not ( = ?auto_121454 ?auto_121460 ) ) ( not ( = ?auto_121454 ?auto_121461 ) ) ( not ( = ?auto_121454 ?auto_121462 ) ) ( not ( = ?auto_121454 ?auto_121463 ) ) ( not ( = ?auto_121454 ?auto_121464 ) ) ( not ( = ?auto_121454 ?auto_121465 ) ) ( not ( = ?auto_121455 ?auto_121456 ) ) ( not ( = ?auto_121455 ?auto_121457 ) ) ( not ( = ?auto_121455 ?auto_121458 ) ) ( not ( = ?auto_121455 ?auto_121459 ) ) ( not ( = ?auto_121455 ?auto_121460 ) ) ( not ( = ?auto_121455 ?auto_121461 ) ) ( not ( = ?auto_121455 ?auto_121462 ) ) ( not ( = ?auto_121455 ?auto_121463 ) ) ( not ( = ?auto_121455 ?auto_121464 ) ) ( not ( = ?auto_121455 ?auto_121465 ) ) ( not ( = ?auto_121456 ?auto_121457 ) ) ( not ( = ?auto_121456 ?auto_121458 ) ) ( not ( = ?auto_121456 ?auto_121459 ) ) ( not ( = ?auto_121456 ?auto_121460 ) ) ( not ( = ?auto_121456 ?auto_121461 ) ) ( not ( = ?auto_121456 ?auto_121462 ) ) ( not ( = ?auto_121456 ?auto_121463 ) ) ( not ( = ?auto_121456 ?auto_121464 ) ) ( not ( = ?auto_121456 ?auto_121465 ) ) ( not ( = ?auto_121457 ?auto_121458 ) ) ( not ( = ?auto_121457 ?auto_121459 ) ) ( not ( = ?auto_121457 ?auto_121460 ) ) ( not ( = ?auto_121457 ?auto_121461 ) ) ( not ( = ?auto_121457 ?auto_121462 ) ) ( not ( = ?auto_121457 ?auto_121463 ) ) ( not ( = ?auto_121457 ?auto_121464 ) ) ( not ( = ?auto_121457 ?auto_121465 ) ) ( not ( = ?auto_121458 ?auto_121459 ) ) ( not ( = ?auto_121458 ?auto_121460 ) ) ( not ( = ?auto_121458 ?auto_121461 ) ) ( not ( = ?auto_121458 ?auto_121462 ) ) ( not ( = ?auto_121458 ?auto_121463 ) ) ( not ( = ?auto_121458 ?auto_121464 ) ) ( not ( = ?auto_121458 ?auto_121465 ) ) ( not ( = ?auto_121459 ?auto_121460 ) ) ( not ( = ?auto_121459 ?auto_121461 ) ) ( not ( = ?auto_121459 ?auto_121462 ) ) ( not ( = ?auto_121459 ?auto_121463 ) ) ( not ( = ?auto_121459 ?auto_121464 ) ) ( not ( = ?auto_121459 ?auto_121465 ) ) ( not ( = ?auto_121460 ?auto_121461 ) ) ( not ( = ?auto_121460 ?auto_121462 ) ) ( not ( = ?auto_121460 ?auto_121463 ) ) ( not ( = ?auto_121460 ?auto_121464 ) ) ( not ( = ?auto_121460 ?auto_121465 ) ) ( not ( = ?auto_121461 ?auto_121462 ) ) ( not ( = ?auto_121461 ?auto_121463 ) ) ( not ( = ?auto_121461 ?auto_121464 ) ) ( not ( = ?auto_121461 ?auto_121465 ) ) ( not ( = ?auto_121462 ?auto_121463 ) ) ( not ( = ?auto_121462 ?auto_121464 ) ) ( not ( = ?auto_121462 ?auto_121465 ) ) ( not ( = ?auto_121463 ?auto_121464 ) ) ( not ( = ?auto_121463 ?auto_121465 ) ) ( not ( = ?auto_121464 ?auto_121465 ) ) ( CLEAR ?auto_121462 ) ( ON ?auto_121463 ?auto_121464 ) ( CLEAR ?auto_121463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_121454 ?auto_121455 ?auto_121456 ?auto_121457 ?auto_121458 ?auto_121459 ?auto_121460 ?auto_121461 ?auto_121462 ?auto_121463 )
      ( MAKE-11PILE ?auto_121454 ?auto_121455 ?auto_121456 ?auto_121457 ?auto_121458 ?auto_121459 ?auto_121460 ?auto_121461 ?auto_121462 ?auto_121463 ?auto_121464 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_121477 - BLOCK
      ?auto_121478 - BLOCK
      ?auto_121479 - BLOCK
      ?auto_121480 - BLOCK
      ?auto_121481 - BLOCK
      ?auto_121482 - BLOCK
      ?auto_121483 - BLOCK
      ?auto_121484 - BLOCK
      ?auto_121485 - BLOCK
      ?auto_121486 - BLOCK
      ?auto_121487 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121487 ) ( ON-TABLE ?auto_121477 ) ( ON ?auto_121478 ?auto_121477 ) ( ON ?auto_121479 ?auto_121478 ) ( ON ?auto_121480 ?auto_121479 ) ( ON ?auto_121481 ?auto_121480 ) ( ON ?auto_121482 ?auto_121481 ) ( ON ?auto_121483 ?auto_121482 ) ( ON ?auto_121484 ?auto_121483 ) ( ON ?auto_121485 ?auto_121484 ) ( not ( = ?auto_121477 ?auto_121478 ) ) ( not ( = ?auto_121477 ?auto_121479 ) ) ( not ( = ?auto_121477 ?auto_121480 ) ) ( not ( = ?auto_121477 ?auto_121481 ) ) ( not ( = ?auto_121477 ?auto_121482 ) ) ( not ( = ?auto_121477 ?auto_121483 ) ) ( not ( = ?auto_121477 ?auto_121484 ) ) ( not ( = ?auto_121477 ?auto_121485 ) ) ( not ( = ?auto_121477 ?auto_121486 ) ) ( not ( = ?auto_121477 ?auto_121487 ) ) ( not ( = ?auto_121478 ?auto_121479 ) ) ( not ( = ?auto_121478 ?auto_121480 ) ) ( not ( = ?auto_121478 ?auto_121481 ) ) ( not ( = ?auto_121478 ?auto_121482 ) ) ( not ( = ?auto_121478 ?auto_121483 ) ) ( not ( = ?auto_121478 ?auto_121484 ) ) ( not ( = ?auto_121478 ?auto_121485 ) ) ( not ( = ?auto_121478 ?auto_121486 ) ) ( not ( = ?auto_121478 ?auto_121487 ) ) ( not ( = ?auto_121479 ?auto_121480 ) ) ( not ( = ?auto_121479 ?auto_121481 ) ) ( not ( = ?auto_121479 ?auto_121482 ) ) ( not ( = ?auto_121479 ?auto_121483 ) ) ( not ( = ?auto_121479 ?auto_121484 ) ) ( not ( = ?auto_121479 ?auto_121485 ) ) ( not ( = ?auto_121479 ?auto_121486 ) ) ( not ( = ?auto_121479 ?auto_121487 ) ) ( not ( = ?auto_121480 ?auto_121481 ) ) ( not ( = ?auto_121480 ?auto_121482 ) ) ( not ( = ?auto_121480 ?auto_121483 ) ) ( not ( = ?auto_121480 ?auto_121484 ) ) ( not ( = ?auto_121480 ?auto_121485 ) ) ( not ( = ?auto_121480 ?auto_121486 ) ) ( not ( = ?auto_121480 ?auto_121487 ) ) ( not ( = ?auto_121481 ?auto_121482 ) ) ( not ( = ?auto_121481 ?auto_121483 ) ) ( not ( = ?auto_121481 ?auto_121484 ) ) ( not ( = ?auto_121481 ?auto_121485 ) ) ( not ( = ?auto_121481 ?auto_121486 ) ) ( not ( = ?auto_121481 ?auto_121487 ) ) ( not ( = ?auto_121482 ?auto_121483 ) ) ( not ( = ?auto_121482 ?auto_121484 ) ) ( not ( = ?auto_121482 ?auto_121485 ) ) ( not ( = ?auto_121482 ?auto_121486 ) ) ( not ( = ?auto_121482 ?auto_121487 ) ) ( not ( = ?auto_121483 ?auto_121484 ) ) ( not ( = ?auto_121483 ?auto_121485 ) ) ( not ( = ?auto_121483 ?auto_121486 ) ) ( not ( = ?auto_121483 ?auto_121487 ) ) ( not ( = ?auto_121484 ?auto_121485 ) ) ( not ( = ?auto_121484 ?auto_121486 ) ) ( not ( = ?auto_121484 ?auto_121487 ) ) ( not ( = ?auto_121485 ?auto_121486 ) ) ( not ( = ?auto_121485 ?auto_121487 ) ) ( not ( = ?auto_121486 ?auto_121487 ) ) ( CLEAR ?auto_121485 ) ( ON ?auto_121486 ?auto_121487 ) ( CLEAR ?auto_121486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_121477 ?auto_121478 ?auto_121479 ?auto_121480 ?auto_121481 ?auto_121482 ?auto_121483 ?auto_121484 ?auto_121485 ?auto_121486 )
      ( MAKE-11PILE ?auto_121477 ?auto_121478 ?auto_121479 ?auto_121480 ?auto_121481 ?auto_121482 ?auto_121483 ?auto_121484 ?auto_121485 ?auto_121486 ?auto_121487 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_121499 - BLOCK
      ?auto_121500 - BLOCK
      ?auto_121501 - BLOCK
      ?auto_121502 - BLOCK
      ?auto_121503 - BLOCK
      ?auto_121504 - BLOCK
      ?auto_121505 - BLOCK
      ?auto_121506 - BLOCK
      ?auto_121507 - BLOCK
      ?auto_121508 - BLOCK
      ?auto_121509 - BLOCK
    )
    :vars
    (
      ?auto_121510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121509 ?auto_121510 ) ( ON-TABLE ?auto_121499 ) ( ON ?auto_121500 ?auto_121499 ) ( ON ?auto_121501 ?auto_121500 ) ( ON ?auto_121502 ?auto_121501 ) ( ON ?auto_121503 ?auto_121502 ) ( ON ?auto_121504 ?auto_121503 ) ( ON ?auto_121505 ?auto_121504 ) ( ON ?auto_121506 ?auto_121505 ) ( not ( = ?auto_121499 ?auto_121500 ) ) ( not ( = ?auto_121499 ?auto_121501 ) ) ( not ( = ?auto_121499 ?auto_121502 ) ) ( not ( = ?auto_121499 ?auto_121503 ) ) ( not ( = ?auto_121499 ?auto_121504 ) ) ( not ( = ?auto_121499 ?auto_121505 ) ) ( not ( = ?auto_121499 ?auto_121506 ) ) ( not ( = ?auto_121499 ?auto_121507 ) ) ( not ( = ?auto_121499 ?auto_121508 ) ) ( not ( = ?auto_121499 ?auto_121509 ) ) ( not ( = ?auto_121499 ?auto_121510 ) ) ( not ( = ?auto_121500 ?auto_121501 ) ) ( not ( = ?auto_121500 ?auto_121502 ) ) ( not ( = ?auto_121500 ?auto_121503 ) ) ( not ( = ?auto_121500 ?auto_121504 ) ) ( not ( = ?auto_121500 ?auto_121505 ) ) ( not ( = ?auto_121500 ?auto_121506 ) ) ( not ( = ?auto_121500 ?auto_121507 ) ) ( not ( = ?auto_121500 ?auto_121508 ) ) ( not ( = ?auto_121500 ?auto_121509 ) ) ( not ( = ?auto_121500 ?auto_121510 ) ) ( not ( = ?auto_121501 ?auto_121502 ) ) ( not ( = ?auto_121501 ?auto_121503 ) ) ( not ( = ?auto_121501 ?auto_121504 ) ) ( not ( = ?auto_121501 ?auto_121505 ) ) ( not ( = ?auto_121501 ?auto_121506 ) ) ( not ( = ?auto_121501 ?auto_121507 ) ) ( not ( = ?auto_121501 ?auto_121508 ) ) ( not ( = ?auto_121501 ?auto_121509 ) ) ( not ( = ?auto_121501 ?auto_121510 ) ) ( not ( = ?auto_121502 ?auto_121503 ) ) ( not ( = ?auto_121502 ?auto_121504 ) ) ( not ( = ?auto_121502 ?auto_121505 ) ) ( not ( = ?auto_121502 ?auto_121506 ) ) ( not ( = ?auto_121502 ?auto_121507 ) ) ( not ( = ?auto_121502 ?auto_121508 ) ) ( not ( = ?auto_121502 ?auto_121509 ) ) ( not ( = ?auto_121502 ?auto_121510 ) ) ( not ( = ?auto_121503 ?auto_121504 ) ) ( not ( = ?auto_121503 ?auto_121505 ) ) ( not ( = ?auto_121503 ?auto_121506 ) ) ( not ( = ?auto_121503 ?auto_121507 ) ) ( not ( = ?auto_121503 ?auto_121508 ) ) ( not ( = ?auto_121503 ?auto_121509 ) ) ( not ( = ?auto_121503 ?auto_121510 ) ) ( not ( = ?auto_121504 ?auto_121505 ) ) ( not ( = ?auto_121504 ?auto_121506 ) ) ( not ( = ?auto_121504 ?auto_121507 ) ) ( not ( = ?auto_121504 ?auto_121508 ) ) ( not ( = ?auto_121504 ?auto_121509 ) ) ( not ( = ?auto_121504 ?auto_121510 ) ) ( not ( = ?auto_121505 ?auto_121506 ) ) ( not ( = ?auto_121505 ?auto_121507 ) ) ( not ( = ?auto_121505 ?auto_121508 ) ) ( not ( = ?auto_121505 ?auto_121509 ) ) ( not ( = ?auto_121505 ?auto_121510 ) ) ( not ( = ?auto_121506 ?auto_121507 ) ) ( not ( = ?auto_121506 ?auto_121508 ) ) ( not ( = ?auto_121506 ?auto_121509 ) ) ( not ( = ?auto_121506 ?auto_121510 ) ) ( not ( = ?auto_121507 ?auto_121508 ) ) ( not ( = ?auto_121507 ?auto_121509 ) ) ( not ( = ?auto_121507 ?auto_121510 ) ) ( not ( = ?auto_121508 ?auto_121509 ) ) ( not ( = ?auto_121508 ?auto_121510 ) ) ( not ( = ?auto_121509 ?auto_121510 ) ) ( ON ?auto_121508 ?auto_121509 ) ( CLEAR ?auto_121506 ) ( ON ?auto_121507 ?auto_121508 ) ( CLEAR ?auto_121507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_121499 ?auto_121500 ?auto_121501 ?auto_121502 ?auto_121503 ?auto_121504 ?auto_121505 ?auto_121506 ?auto_121507 )
      ( MAKE-11PILE ?auto_121499 ?auto_121500 ?auto_121501 ?auto_121502 ?auto_121503 ?auto_121504 ?auto_121505 ?auto_121506 ?auto_121507 ?auto_121508 ?auto_121509 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_121522 - BLOCK
      ?auto_121523 - BLOCK
      ?auto_121524 - BLOCK
      ?auto_121525 - BLOCK
      ?auto_121526 - BLOCK
      ?auto_121527 - BLOCK
      ?auto_121528 - BLOCK
      ?auto_121529 - BLOCK
      ?auto_121530 - BLOCK
      ?auto_121531 - BLOCK
      ?auto_121532 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121532 ) ( ON-TABLE ?auto_121522 ) ( ON ?auto_121523 ?auto_121522 ) ( ON ?auto_121524 ?auto_121523 ) ( ON ?auto_121525 ?auto_121524 ) ( ON ?auto_121526 ?auto_121525 ) ( ON ?auto_121527 ?auto_121526 ) ( ON ?auto_121528 ?auto_121527 ) ( ON ?auto_121529 ?auto_121528 ) ( not ( = ?auto_121522 ?auto_121523 ) ) ( not ( = ?auto_121522 ?auto_121524 ) ) ( not ( = ?auto_121522 ?auto_121525 ) ) ( not ( = ?auto_121522 ?auto_121526 ) ) ( not ( = ?auto_121522 ?auto_121527 ) ) ( not ( = ?auto_121522 ?auto_121528 ) ) ( not ( = ?auto_121522 ?auto_121529 ) ) ( not ( = ?auto_121522 ?auto_121530 ) ) ( not ( = ?auto_121522 ?auto_121531 ) ) ( not ( = ?auto_121522 ?auto_121532 ) ) ( not ( = ?auto_121523 ?auto_121524 ) ) ( not ( = ?auto_121523 ?auto_121525 ) ) ( not ( = ?auto_121523 ?auto_121526 ) ) ( not ( = ?auto_121523 ?auto_121527 ) ) ( not ( = ?auto_121523 ?auto_121528 ) ) ( not ( = ?auto_121523 ?auto_121529 ) ) ( not ( = ?auto_121523 ?auto_121530 ) ) ( not ( = ?auto_121523 ?auto_121531 ) ) ( not ( = ?auto_121523 ?auto_121532 ) ) ( not ( = ?auto_121524 ?auto_121525 ) ) ( not ( = ?auto_121524 ?auto_121526 ) ) ( not ( = ?auto_121524 ?auto_121527 ) ) ( not ( = ?auto_121524 ?auto_121528 ) ) ( not ( = ?auto_121524 ?auto_121529 ) ) ( not ( = ?auto_121524 ?auto_121530 ) ) ( not ( = ?auto_121524 ?auto_121531 ) ) ( not ( = ?auto_121524 ?auto_121532 ) ) ( not ( = ?auto_121525 ?auto_121526 ) ) ( not ( = ?auto_121525 ?auto_121527 ) ) ( not ( = ?auto_121525 ?auto_121528 ) ) ( not ( = ?auto_121525 ?auto_121529 ) ) ( not ( = ?auto_121525 ?auto_121530 ) ) ( not ( = ?auto_121525 ?auto_121531 ) ) ( not ( = ?auto_121525 ?auto_121532 ) ) ( not ( = ?auto_121526 ?auto_121527 ) ) ( not ( = ?auto_121526 ?auto_121528 ) ) ( not ( = ?auto_121526 ?auto_121529 ) ) ( not ( = ?auto_121526 ?auto_121530 ) ) ( not ( = ?auto_121526 ?auto_121531 ) ) ( not ( = ?auto_121526 ?auto_121532 ) ) ( not ( = ?auto_121527 ?auto_121528 ) ) ( not ( = ?auto_121527 ?auto_121529 ) ) ( not ( = ?auto_121527 ?auto_121530 ) ) ( not ( = ?auto_121527 ?auto_121531 ) ) ( not ( = ?auto_121527 ?auto_121532 ) ) ( not ( = ?auto_121528 ?auto_121529 ) ) ( not ( = ?auto_121528 ?auto_121530 ) ) ( not ( = ?auto_121528 ?auto_121531 ) ) ( not ( = ?auto_121528 ?auto_121532 ) ) ( not ( = ?auto_121529 ?auto_121530 ) ) ( not ( = ?auto_121529 ?auto_121531 ) ) ( not ( = ?auto_121529 ?auto_121532 ) ) ( not ( = ?auto_121530 ?auto_121531 ) ) ( not ( = ?auto_121530 ?auto_121532 ) ) ( not ( = ?auto_121531 ?auto_121532 ) ) ( ON ?auto_121531 ?auto_121532 ) ( CLEAR ?auto_121529 ) ( ON ?auto_121530 ?auto_121531 ) ( CLEAR ?auto_121530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_121522 ?auto_121523 ?auto_121524 ?auto_121525 ?auto_121526 ?auto_121527 ?auto_121528 ?auto_121529 ?auto_121530 )
      ( MAKE-11PILE ?auto_121522 ?auto_121523 ?auto_121524 ?auto_121525 ?auto_121526 ?auto_121527 ?auto_121528 ?auto_121529 ?auto_121530 ?auto_121531 ?auto_121532 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_121544 - BLOCK
      ?auto_121545 - BLOCK
      ?auto_121546 - BLOCK
      ?auto_121547 - BLOCK
      ?auto_121548 - BLOCK
      ?auto_121549 - BLOCK
      ?auto_121550 - BLOCK
      ?auto_121551 - BLOCK
      ?auto_121552 - BLOCK
      ?auto_121553 - BLOCK
      ?auto_121554 - BLOCK
    )
    :vars
    (
      ?auto_121555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121554 ?auto_121555 ) ( ON-TABLE ?auto_121544 ) ( ON ?auto_121545 ?auto_121544 ) ( ON ?auto_121546 ?auto_121545 ) ( ON ?auto_121547 ?auto_121546 ) ( ON ?auto_121548 ?auto_121547 ) ( ON ?auto_121549 ?auto_121548 ) ( ON ?auto_121550 ?auto_121549 ) ( not ( = ?auto_121544 ?auto_121545 ) ) ( not ( = ?auto_121544 ?auto_121546 ) ) ( not ( = ?auto_121544 ?auto_121547 ) ) ( not ( = ?auto_121544 ?auto_121548 ) ) ( not ( = ?auto_121544 ?auto_121549 ) ) ( not ( = ?auto_121544 ?auto_121550 ) ) ( not ( = ?auto_121544 ?auto_121551 ) ) ( not ( = ?auto_121544 ?auto_121552 ) ) ( not ( = ?auto_121544 ?auto_121553 ) ) ( not ( = ?auto_121544 ?auto_121554 ) ) ( not ( = ?auto_121544 ?auto_121555 ) ) ( not ( = ?auto_121545 ?auto_121546 ) ) ( not ( = ?auto_121545 ?auto_121547 ) ) ( not ( = ?auto_121545 ?auto_121548 ) ) ( not ( = ?auto_121545 ?auto_121549 ) ) ( not ( = ?auto_121545 ?auto_121550 ) ) ( not ( = ?auto_121545 ?auto_121551 ) ) ( not ( = ?auto_121545 ?auto_121552 ) ) ( not ( = ?auto_121545 ?auto_121553 ) ) ( not ( = ?auto_121545 ?auto_121554 ) ) ( not ( = ?auto_121545 ?auto_121555 ) ) ( not ( = ?auto_121546 ?auto_121547 ) ) ( not ( = ?auto_121546 ?auto_121548 ) ) ( not ( = ?auto_121546 ?auto_121549 ) ) ( not ( = ?auto_121546 ?auto_121550 ) ) ( not ( = ?auto_121546 ?auto_121551 ) ) ( not ( = ?auto_121546 ?auto_121552 ) ) ( not ( = ?auto_121546 ?auto_121553 ) ) ( not ( = ?auto_121546 ?auto_121554 ) ) ( not ( = ?auto_121546 ?auto_121555 ) ) ( not ( = ?auto_121547 ?auto_121548 ) ) ( not ( = ?auto_121547 ?auto_121549 ) ) ( not ( = ?auto_121547 ?auto_121550 ) ) ( not ( = ?auto_121547 ?auto_121551 ) ) ( not ( = ?auto_121547 ?auto_121552 ) ) ( not ( = ?auto_121547 ?auto_121553 ) ) ( not ( = ?auto_121547 ?auto_121554 ) ) ( not ( = ?auto_121547 ?auto_121555 ) ) ( not ( = ?auto_121548 ?auto_121549 ) ) ( not ( = ?auto_121548 ?auto_121550 ) ) ( not ( = ?auto_121548 ?auto_121551 ) ) ( not ( = ?auto_121548 ?auto_121552 ) ) ( not ( = ?auto_121548 ?auto_121553 ) ) ( not ( = ?auto_121548 ?auto_121554 ) ) ( not ( = ?auto_121548 ?auto_121555 ) ) ( not ( = ?auto_121549 ?auto_121550 ) ) ( not ( = ?auto_121549 ?auto_121551 ) ) ( not ( = ?auto_121549 ?auto_121552 ) ) ( not ( = ?auto_121549 ?auto_121553 ) ) ( not ( = ?auto_121549 ?auto_121554 ) ) ( not ( = ?auto_121549 ?auto_121555 ) ) ( not ( = ?auto_121550 ?auto_121551 ) ) ( not ( = ?auto_121550 ?auto_121552 ) ) ( not ( = ?auto_121550 ?auto_121553 ) ) ( not ( = ?auto_121550 ?auto_121554 ) ) ( not ( = ?auto_121550 ?auto_121555 ) ) ( not ( = ?auto_121551 ?auto_121552 ) ) ( not ( = ?auto_121551 ?auto_121553 ) ) ( not ( = ?auto_121551 ?auto_121554 ) ) ( not ( = ?auto_121551 ?auto_121555 ) ) ( not ( = ?auto_121552 ?auto_121553 ) ) ( not ( = ?auto_121552 ?auto_121554 ) ) ( not ( = ?auto_121552 ?auto_121555 ) ) ( not ( = ?auto_121553 ?auto_121554 ) ) ( not ( = ?auto_121553 ?auto_121555 ) ) ( not ( = ?auto_121554 ?auto_121555 ) ) ( ON ?auto_121553 ?auto_121554 ) ( ON ?auto_121552 ?auto_121553 ) ( CLEAR ?auto_121550 ) ( ON ?auto_121551 ?auto_121552 ) ( CLEAR ?auto_121551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_121544 ?auto_121545 ?auto_121546 ?auto_121547 ?auto_121548 ?auto_121549 ?auto_121550 ?auto_121551 )
      ( MAKE-11PILE ?auto_121544 ?auto_121545 ?auto_121546 ?auto_121547 ?auto_121548 ?auto_121549 ?auto_121550 ?auto_121551 ?auto_121552 ?auto_121553 ?auto_121554 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_121567 - BLOCK
      ?auto_121568 - BLOCK
      ?auto_121569 - BLOCK
      ?auto_121570 - BLOCK
      ?auto_121571 - BLOCK
      ?auto_121572 - BLOCK
      ?auto_121573 - BLOCK
      ?auto_121574 - BLOCK
      ?auto_121575 - BLOCK
      ?auto_121576 - BLOCK
      ?auto_121577 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121577 ) ( ON-TABLE ?auto_121567 ) ( ON ?auto_121568 ?auto_121567 ) ( ON ?auto_121569 ?auto_121568 ) ( ON ?auto_121570 ?auto_121569 ) ( ON ?auto_121571 ?auto_121570 ) ( ON ?auto_121572 ?auto_121571 ) ( ON ?auto_121573 ?auto_121572 ) ( not ( = ?auto_121567 ?auto_121568 ) ) ( not ( = ?auto_121567 ?auto_121569 ) ) ( not ( = ?auto_121567 ?auto_121570 ) ) ( not ( = ?auto_121567 ?auto_121571 ) ) ( not ( = ?auto_121567 ?auto_121572 ) ) ( not ( = ?auto_121567 ?auto_121573 ) ) ( not ( = ?auto_121567 ?auto_121574 ) ) ( not ( = ?auto_121567 ?auto_121575 ) ) ( not ( = ?auto_121567 ?auto_121576 ) ) ( not ( = ?auto_121567 ?auto_121577 ) ) ( not ( = ?auto_121568 ?auto_121569 ) ) ( not ( = ?auto_121568 ?auto_121570 ) ) ( not ( = ?auto_121568 ?auto_121571 ) ) ( not ( = ?auto_121568 ?auto_121572 ) ) ( not ( = ?auto_121568 ?auto_121573 ) ) ( not ( = ?auto_121568 ?auto_121574 ) ) ( not ( = ?auto_121568 ?auto_121575 ) ) ( not ( = ?auto_121568 ?auto_121576 ) ) ( not ( = ?auto_121568 ?auto_121577 ) ) ( not ( = ?auto_121569 ?auto_121570 ) ) ( not ( = ?auto_121569 ?auto_121571 ) ) ( not ( = ?auto_121569 ?auto_121572 ) ) ( not ( = ?auto_121569 ?auto_121573 ) ) ( not ( = ?auto_121569 ?auto_121574 ) ) ( not ( = ?auto_121569 ?auto_121575 ) ) ( not ( = ?auto_121569 ?auto_121576 ) ) ( not ( = ?auto_121569 ?auto_121577 ) ) ( not ( = ?auto_121570 ?auto_121571 ) ) ( not ( = ?auto_121570 ?auto_121572 ) ) ( not ( = ?auto_121570 ?auto_121573 ) ) ( not ( = ?auto_121570 ?auto_121574 ) ) ( not ( = ?auto_121570 ?auto_121575 ) ) ( not ( = ?auto_121570 ?auto_121576 ) ) ( not ( = ?auto_121570 ?auto_121577 ) ) ( not ( = ?auto_121571 ?auto_121572 ) ) ( not ( = ?auto_121571 ?auto_121573 ) ) ( not ( = ?auto_121571 ?auto_121574 ) ) ( not ( = ?auto_121571 ?auto_121575 ) ) ( not ( = ?auto_121571 ?auto_121576 ) ) ( not ( = ?auto_121571 ?auto_121577 ) ) ( not ( = ?auto_121572 ?auto_121573 ) ) ( not ( = ?auto_121572 ?auto_121574 ) ) ( not ( = ?auto_121572 ?auto_121575 ) ) ( not ( = ?auto_121572 ?auto_121576 ) ) ( not ( = ?auto_121572 ?auto_121577 ) ) ( not ( = ?auto_121573 ?auto_121574 ) ) ( not ( = ?auto_121573 ?auto_121575 ) ) ( not ( = ?auto_121573 ?auto_121576 ) ) ( not ( = ?auto_121573 ?auto_121577 ) ) ( not ( = ?auto_121574 ?auto_121575 ) ) ( not ( = ?auto_121574 ?auto_121576 ) ) ( not ( = ?auto_121574 ?auto_121577 ) ) ( not ( = ?auto_121575 ?auto_121576 ) ) ( not ( = ?auto_121575 ?auto_121577 ) ) ( not ( = ?auto_121576 ?auto_121577 ) ) ( ON ?auto_121576 ?auto_121577 ) ( ON ?auto_121575 ?auto_121576 ) ( CLEAR ?auto_121573 ) ( ON ?auto_121574 ?auto_121575 ) ( CLEAR ?auto_121574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_121567 ?auto_121568 ?auto_121569 ?auto_121570 ?auto_121571 ?auto_121572 ?auto_121573 ?auto_121574 )
      ( MAKE-11PILE ?auto_121567 ?auto_121568 ?auto_121569 ?auto_121570 ?auto_121571 ?auto_121572 ?auto_121573 ?auto_121574 ?auto_121575 ?auto_121576 ?auto_121577 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_121589 - BLOCK
      ?auto_121590 - BLOCK
      ?auto_121591 - BLOCK
      ?auto_121592 - BLOCK
      ?auto_121593 - BLOCK
      ?auto_121594 - BLOCK
      ?auto_121595 - BLOCK
      ?auto_121596 - BLOCK
      ?auto_121597 - BLOCK
      ?auto_121598 - BLOCK
      ?auto_121599 - BLOCK
    )
    :vars
    (
      ?auto_121600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121599 ?auto_121600 ) ( ON-TABLE ?auto_121589 ) ( ON ?auto_121590 ?auto_121589 ) ( ON ?auto_121591 ?auto_121590 ) ( ON ?auto_121592 ?auto_121591 ) ( ON ?auto_121593 ?auto_121592 ) ( ON ?auto_121594 ?auto_121593 ) ( not ( = ?auto_121589 ?auto_121590 ) ) ( not ( = ?auto_121589 ?auto_121591 ) ) ( not ( = ?auto_121589 ?auto_121592 ) ) ( not ( = ?auto_121589 ?auto_121593 ) ) ( not ( = ?auto_121589 ?auto_121594 ) ) ( not ( = ?auto_121589 ?auto_121595 ) ) ( not ( = ?auto_121589 ?auto_121596 ) ) ( not ( = ?auto_121589 ?auto_121597 ) ) ( not ( = ?auto_121589 ?auto_121598 ) ) ( not ( = ?auto_121589 ?auto_121599 ) ) ( not ( = ?auto_121589 ?auto_121600 ) ) ( not ( = ?auto_121590 ?auto_121591 ) ) ( not ( = ?auto_121590 ?auto_121592 ) ) ( not ( = ?auto_121590 ?auto_121593 ) ) ( not ( = ?auto_121590 ?auto_121594 ) ) ( not ( = ?auto_121590 ?auto_121595 ) ) ( not ( = ?auto_121590 ?auto_121596 ) ) ( not ( = ?auto_121590 ?auto_121597 ) ) ( not ( = ?auto_121590 ?auto_121598 ) ) ( not ( = ?auto_121590 ?auto_121599 ) ) ( not ( = ?auto_121590 ?auto_121600 ) ) ( not ( = ?auto_121591 ?auto_121592 ) ) ( not ( = ?auto_121591 ?auto_121593 ) ) ( not ( = ?auto_121591 ?auto_121594 ) ) ( not ( = ?auto_121591 ?auto_121595 ) ) ( not ( = ?auto_121591 ?auto_121596 ) ) ( not ( = ?auto_121591 ?auto_121597 ) ) ( not ( = ?auto_121591 ?auto_121598 ) ) ( not ( = ?auto_121591 ?auto_121599 ) ) ( not ( = ?auto_121591 ?auto_121600 ) ) ( not ( = ?auto_121592 ?auto_121593 ) ) ( not ( = ?auto_121592 ?auto_121594 ) ) ( not ( = ?auto_121592 ?auto_121595 ) ) ( not ( = ?auto_121592 ?auto_121596 ) ) ( not ( = ?auto_121592 ?auto_121597 ) ) ( not ( = ?auto_121592 ?auto_121598 ) ) ( not ( = ?auto_121592 ?auto_121599 ) ) ( not ( = ?auto_121592 ?auto_121600 ) ) ( not ( = ?auto_121593 ?auto_121594 ) ) ( not ( = ?auto_121593 ?auto_121595 ) ) ( not ( = ?auto_121593 ?auto_121596 ) ) ( not ( = ?auto_121593 ?auto_121597 ) ) ( not ( = ?auto_121593 ?auto_121598 ) ) ( not ( = ?auto_121593 ?auto_121599 ) ) ( not ( = ?auto_121593 ?auto_121600 ) ) ( not ( = ?auto_121594 ?auto_121595 ) ) ( not ( = ?auto_121594 ?auto_121596 ) ) ( not ( = ?auto_121594 ?auto_121597 ) ) ( not ( = ?auto_121594 ?auto_121598 ) ) ( not ( = ?auto_121594 ?auto_121599 ) ) ( not ( = ?auto_121594 ?auto_121600 ) ) ( not ( = ?auto_121595 ?auto_121596 ) ) ( not ( = ?auto_121595 ?auto_121597 ) ) ( not ( = ?auto_121595 ?auto_121598 ) ) ( not ( = ?auto_121595 ?auto_121599 ) ) ( not ( = ?auto_121595 ?auto_121600 ) ) ( not ( = ?auto_121596 ?auto_121597 ) ) ( not ( = ?auto_121596 ?auto_121598 ) ) ( not ( = ?auto_121596 ?auto_121599 ) ) ( not ( = ?auto_121596 ?auto_121600 ) ) ( not ( = ?auto_121597 ?auto_121598 ) ) ( not ( = ?auto_121597 ?auto_121599 ) ) ( not ( = ?auto_121597 ?auto_121600 ) ) ( not ( = ?auto_121598 ?auto_121599 ) ) ( not ( = ?auto_121598 ?auto_121600 ) ) ( not ( = ?auto_121599 ?auto_121600 ) ) ( ON ?auto_121598 ?auto_121599 ) ( ON ?auto_121597 ?auto_121598 ) ( ON ?auto_121596 ?auto_121597 ) ( CLEAR ?auto_121594 ) ( ON ?auto_121595 ?auto_121596 ) ( CLEAR ?auto_121595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_121589 ?auto_121590 ?auto_121591 ?auto_121592 ?auto_121593 ?auto_121594 ?auto_121595 )
      ( MAKE-11PILE ?auto_121589 ?auto_121590 ?auto_121591 ?auto_121592 ?auto_121593 ?auto_121594 ?auto_121595 ?auto_121596 ?auto_121597 ?auto_121598 ?auto_121599 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_121612 - BLOCK
      ?auto_121613 - BLOCK
      ?auto_121614 - BLOCK
      ?auto_121615 - BLOCK
      ?auto_121616 - BLOCK
      ?auto_121617 - BLOCK
      ?auto_121618 - BLOCK
      ?auto_121619 - BLOCK
      ?auto_121620 - BLOCK
      ?auto_121621 - BLOCK
      ?auto_121622 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121622 ) ( ON-TABLE ?auto_121612 ) ( ON ?auto_121613 ?auto_121612 ) ( ON ?auto_121614 ?auto_121613 ) ( ON ?auto_121615 ?auto_121614 ) ( ON ?auto_121616 ?auto_121615 ) ( ON ?auto_121617 ?auto_121616 ) ( not ( = ?auto_121612 ?auto_121613 ) ) ( not ( = ?auto_121612 ?auto_121614 ) ) ( not ( = ?auto_121612 ?auto_121615 ) ) ( not ( = ?auto_121612 ?auto_121616 ) ) ( not ( = ?auto_121612 ?auto_121617 ) ) ( not ( = ?auto_121612 ?auto_121618 ) ) ( not ( = ?auto_121612 ?auto_121619 ) ) ( not ( = ?auto_121612 ?auto_121620 ) ) ( not ( = ?auto_121612 ?auto_121621 ) ) ( not ( = ?auto_121612 ?auto_121622 ) ) ( not ( = ?auto_121613 ?auto_121614 ) ) ( not ( = ?auto_121613 ?auto_121615 ) ) ( not ( = ?auto_121613 ?auto_121616 ) ) ( not ( = ?auto_121613 ?auto_121617 ) ) ( not ( = ?auto_121613 ?auto_121618 ) ) ( not ( = ?auto_121613 ?auto_121619 ) ) ( not ( = ?auto_121613 ?auto_121620 ) ) ( not ( = ?auto_121613 ?auto_121621 ) ) ( not ( = ?auto_121613 ?auto_121622 ) ) ( not ( = ?auto_121614 ?auto_121615 ) ) ( not ( = ?auto_121614 ?auto_121616 ) ) ( not ( = ?auto_121614 ?auto_121617 ) ) ( not ( = ?auto_121614 ?auto_121618 ) ) ( not ( = ?auto_121614 ?auto_121619 ) ) ( not ( = ?auto_121614 ?auto_121620 ) ) ( not ( = ?auto_121614 ?auto_121621 ) ) ( not ( = ?auto_121614 ?auto_121622 ) ) ( not ( = ?auto_121615 ?auto_121616 ) ) ( not ( = ?auto_121615 ?auto_121617 ) ) ( not ( = ?auto_121615 ?auto_121618 ) ) ( not ( = ?auto_121615 ?auto_121619 ) ) ( not ( = ?auto_121615 ?auto_121620 ) ) ( not ( = ?auto_121615 ?auto_121621 ) ) ( not ( = ?auto_121615 ?auto_121622 ) ) ( not ( = ?auto_121616 ?auto_121617 ) ) ( not ( = ?auto_121616 ?auto_121618 ) ) ( not ( = ?auto_121616 ?auto_121619 ) ) ( not ( = ?auto_121616 ?auto_121620 ) ) ( not ( = ?auto_121616 ?auto_121621 ) ) ( not ( = ?auto_121616 ?auto_121622 ) ) ( not ( = ?auto_121617 ?auto_121618 ) ) ( not ( = ?auto_121617 ?auto_121619 ) ) ( not ( = ?auto_121617 ?auto_121620 ) ) ( not ( = ?auto_121617 ?auto_121621 ) ) ( not ( = ?auto_121617 ?auto_121622 ) ) ( not ( = ?auto_121618 ?auto_121619 ) ) ( not ( = ?auto_121618 ?auto_121620 ) ) ( not ( = ?auto_121618 ?auto_121621 ) ) ( not ( = ?auto_121618 ?auto_121622 ) ) ( not ( = ?auto_121619 ?auto_121620 ) ) ( not ( = ?auto_121619 ?auto_121621 ) ) ( not ( = ?auto_121619 ?auto_121622 ) ) ( not ( = ?auto_121620 ?auto_121621 ) ) ( not ( = ?auto_121620 ?auto_121622 ) ) ( not ( = ?auto_121621 ?auto_121622 ) ) ( ON ?auto_121621 ?auto_121622 ) ( ON ?auto_121620 ?auto_121621 ) ( ON ?auto_121619 ?auto_121620 ) ( CLEAR ?auto_121617 ) ( ON ?auto_121618 ?auto_121619 ) ( CLEAR ?auto_121618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_121612 ?auto_121613 ?auto_121614 ?auto_121615 ?auto_121616 ?auto_121617 ?auto_121618 )
      ( MAKE-11PILE ?auto_121612 ?auto_121613 ?auto_121614 ?auto_121615 ?auto_121616 ?auto_121617 ?auto_121618 ?auto_121619 ?auto_121620 ?auto_121621 ?auto_121622 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_121634 - BLOCK
      ?auto_121635 - BLOCK
      ?auto_121636 - BLOCK
      ?auto_121637 - BLOCK
      ?auto_121638 - BLOCK
      ?auto_121639 - BLOCK
      ?auto_121640 - BLOCK
      ?auto_121641 - BLOCK
      ?auto_121642 - BLOCK
      ?auto_121643 - BLOCK
      ?auto_121644 - BLOCK
    )
    :vars
    (
      ?auto_121645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121644 ?auto_121645 ) ( ON-TABLE ?auto_121634 ) ( ON ?auto_121635 ?auto_121634 ) ( ON ?auto_121636 ?auto_121635 ) ( ON ?auto_121637 ?auto_121636 ) ( ON ?auto_121638 ?auto_121637 ) ( not ( = ?auto_121634 ?auto_121635 ) ) ( not ( = ?auto_121634 ?auto_121636 ) ) ( not ( = ?auto_121634 ?auto_121637 ) ) ( not ( = ?auto_121634 ?auto_121638 ) ) ( not ( = ?auto_121634 ?auto_121639 ) ) ( not ( = ?auto_121634 ?auto_121640 ) ) ( not ( = ?auto_121634 ?auto_121641 ) ) ( not ( = ?auto_121634 ?auto_121642 ) ) ( not ( = ?auto_121634 ?auto_121643 ) ) ( not ( = ?auto_121634 ?auto_121644 ) ) ( not ( = ?auto_121634 ?auto_121645 ) ) ( not ( = ?auto_121635 ?auto_121636 ) ) ( not ( = ?auto_121635 ?auto_121637 ) ) ( not ( = ?auto_121635 ?auto_121638 ) ) ( not ( = ?auto_121635 ?auto_121639 ) ) ( not ( = ?auto_121635 ?auto_121640 ) ) ( not ( = ?auto_121635 ?auto_121641 ) ) ( not ( = ?auto_121635 ?auto_121642 ) ) ( not ( = ?auto_121635 ?auto_121643 ) ) ( not ( = ?auto_121635 ?auto_121644 ) ) ( not ( = ?auto_121635 ?auto_121645 ) ) ( not ( = ?auto_121636 ?auto_121637 ) ) ( not ( = ?auto_121636 ?auto_121638 ) ) ( not ( = ?auto_121636 ?auto_121639 ) ) ( not ( = ?auto_121636 ?auto_121640 ) ) ( not ( = ?auto_121636 ?auto_121641 ) ) ( not ( = ?auto_121636 ?auto_121642 ) ) ( not ( = ?auto_121636 ?auto_121643 ) ) ( not ( = ?auto_121636 ?auto_121644 ) ) ( not ( = ?auto_121636 ?auto_121645 ) ) ( not ( = ?auto_121637 ?auto_121638 ) ) ( not ( = ?auto_121637 ?auto_121639 ) ) ( not ( = ?auto_121637 ?auto_121640 ) ) ( not ( = ?auto_121637 ?auto_121641 ) ) ( not ( = ?auto_121637 ?auto_121642 ) ) ( not ( = ?auto_121637 ?auto_121643 ) ) ( not ( = ?auto_121637 ?auto_121644 ) ) ( not ( = ?auto_121637 ?auto_121645 ) ) ( not ( = ?auto_121638 ?auto_121639 ) ) ( not ( = ?auto_121638 ?auto_121640 ) ) ( not ( = ?auto_121638 ?auto_121641 ) ) ( not ( = ?auto_121638 ?auto_121642 ) ) ( not ( = ?auto_121638 ?auto_121643 ) ) ( not ( = ?auto_121638 ?auto_121644 ) ) ( not ( = ?auto_121638 ?auto_121645 ) ) ( not ( = ?auto_121639 ?auto_121640 ) ) ( not ( = ?auto_121639 ?auto_121641 ) ) ( not ( = ?auto_121639 ?auto_121642 ) ) ( not ( = ?auto_121639 ?auto_121643 ) ) ( not ( = ?auto_121639 ?auto_121644 ) ) ( not ( = ?auto_121639 ?auto_121645 ) ) ( not ( = ?auto_121640 ?auto_121641 ) ) ( not ( = ?auto_121640 ?auto_121642 ) ) ( not ( = ?auto_121640 ?auto_121643 ) ) ( not ( = ?auto_121640 ?auto_121644 ) ) ( not ( = ?auto_121640 ?auto_121645 ) ) ( not ( = ?auto_121641 ?auto_121642 ) ) ( not ( = ?auto_121641 ?auto_121643 ) ) ( not ( = ?auto_121641 ?auto_121644 ) ) ( not ( = ?auto_121641 ?auto_121645 ) ) ( not ( = ?auto_121642 ?auto_121643 ) ) ( not ( = ?auto_121642 ?auto_121644 ) ) ( not ( = ?auto_121642 ?auto_121645 ) ) ( not ( = ?auto_121643 ?auto_121644 ) ) ( not ( = ?auto_121643 ?auto_121645 ) ) ( not ( = ?auto_121644 ?auto_121645 ) ) ( ON ?auto_121643 ?auto_121644 ) ( ON ?auto_121642 ?auto_121643 ) ( ON ?auto_121641 ?auto_121642 ) ( ON ?auto_121640 ?auto_121641 ) ( CLEAR ?auto_121638 ) ( ON ?auto_121639 ?auto_121640 ) ( CLEAR ?auto_121639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121634 ?auto_121635 ?auto_121636 ?auto_121637 ?auto_121638 ?auto_121639 )
      ( MAKE-11PILE ?auto_121634 ?auto_121635 ?auto_121636 ?auto_121637 ?auto_121638 ?auto_121639 ?auto_121640 ?auto_121641 ?auto_121642 ?auto_121643 ?auto_121644 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_121657 - BLOCK
      ?auto_121658 - BLOCK
      ?auto_121659 - BLOCK
      ?auto_121660 - BLOCK
      ?auto_121661 - BLOCK
      ?auto_121662 - BLOCK
      ?auto_121663 - BLOCK
      ?auto_121664 - BLOCK
      ?auto_121665 - BLOCK
      ?auto_121666 - BLOCK
      ?auto_121667 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121667 ) ( ON-TABLE ?auto_121657 ) ( ON ?auto_121658 ?auto_121657 ) ( ON ?auto_121659 ?auto_121658 ) ( ON ?auto_121660 ?auto_121659 ) ( ON ?auto_121661 ?auto_121660 ) ( not ( = ?auto_121657 ?auto_121658 ) ) ( not ( = ?auto_121657 ?auto_121659 ) ) ( not ( = ?auto_121657 ?auto_121660 ) ) ( not ( = ?auto_121657 ?auto_121661 ) ) ( not ( = ?auto_121657 ?auto_121662 ) ) ( not ( = ?auto_121657 ?auto_121663 ) ) ( not ( = ?auto_121657 ?auto_121664 ) ) ( not ( = ?auto_121657 ?auto_121665 ) ) ( not ( = ?auto_121657 ?auto_121666 ) ) ( not ( = ?auto_121657 ?auto_121667 ) ) ( not ( = ?auto_121658 ?auto_121659 ) ) ( not ( = ?auto_121658 ?auto_121660 ) ) ( not ( = ?auto_121658 ?auto_121661 ) ) ( not ( = ?auto_121658 ?auto_121662 ) ) ( not ( = ?auto_121658 ?auto_121663 ) ) ( not ( = ?auto_121658 ?auto_121664 ) ) ( not ( = ?auto_121658 ?auto_121665 ) ) ( not ( = ?auto_121658 ?auto_121666 ) ) ( not ( = ?auto_121658 ?auto_121667 ) ) ( not ( = ?auto_121659 ?auto_121660 ) ) ( not ( = ?auto_121659 ?auto_121661 ) ) ( not ( = ?auto_121659 ?auto_121662 ) ) ( not ( = ?auto_121659 ?auto_121663 ) ) ( not ( = ?auto_121659 ?auto_121664 ) ) ( not ( = ?auto_121659 ?auto_121665 ) ) ( not ( = ?auto_121659 ?auto_121666 ) ) ( not ( = ?auto_121659 ?auto_121667 ) ) ( not ( = ?auto_121660 ?auto_121661 ) ) ( not ( = ?auto_121660 ?auto_121662 ) ) ( not ( = ?auto_121660 ?auto_121663 ) ) ( not ( = ?auto_121660 ?auto_121664 ) ) ( not ( = ?auto_121660 ?auto_121665 ) ) ( not ( = ?auto_121660 ?auto_121666 ) ) ( not ( = ?auto_121660 ?auto_121667 ) ) ( not ( = ?auto_121661 ?auto_121662 ) ) ( not ( = ?auto_121661 ?auto_121663 ) ) ( not ( = ?auto_121661 ?auto_121664 ) ) ( not ( = ?auto_121661 ?auto_121665 ) ) ( not ( = ?auto_121661 ?auto_121666 ) ) ( not ( = ?auto_121661 ?auto_121667 ) ) ( not ( = ?auto_121662 ?auto_121663 ) ) ( not ( = ?auto_121662 ?auto_121664 ) ) ( not ( = ?auto_121662 ?auto_121665 ) ) ( not ( = ?auto_121662 ?auto_121666 ) ) ( not ( = ?auto_121662 ?auto_121667 ) ) ( not ( = ?auto_121663 ?auto_121664 ) ) ( not ( = ?auto_121663 ?auto_121665 ) ) ( not ( = ?auto_121663 ?auto_121666 ) ) ( not ( = ?auto_121663 ?auto_121667 ) ) ( not ( = ?auto_121664 ?auto_121665 ) ) ( not ( = ?auto_121664 ?auto_121666 ) ) ( not ( = ?auto_121664 ?auto_121667 ) ) ( not ( = ?auto_121665 ?auto_121666 ) ) ( not ( = ?auto_121665 ?auto_121667 ) ) ( not ( = ?auto_121666 ?auto_121667 ) ) ( ON ?auto_121666 ?auto_121667 ) ( ON ?auto_121665 ?auto_121666 ) ( ON ?auto_121664 ?auto_121665 ) ( ON ?auto_121663 ?auto_121664 ) ( CLEAR ?auto_121661 ) ( ON ?auto_121662 ?auto_121663 ) ( CLEAR ?auto_121662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121657 ?auto_121658 ?auto_121659 ?auto_121660 ?auto_121661 ?auto_121662 )
      ( MAKE-11PILE ?auto_121657 ?auto_121658 ?auto_121659 ?auto_121660 ?auto_121661 ?auto_121662 ?auto_121663 ?auto_121664 ?auto_121665 ?auto_121666 ?auto_121667 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_121679 - BLOCK
      ?auto_121680 - BLOCK
      ?auto_121681 - BLOCK
      ?auto_121682 - BLOCK
      ?auto_121683 - BLOCK
      ?auto_121684 - BLOCK
      ?auto_121685 - BLOCK
      ?auto_121686 - BLOCK
      ?auto_121687 - BLOCK
      ?auto_121688 - BLOCK
      ?auto_121689 - BLOCK
    )
    :vars
    (
      ?auto_121690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121689 ?auto_121690 ) ( ON-TABLE ?auto_121679 ) ( ON ?auto_121680 ?auto_121679 ) ( ON ?auto_121681 ?auto_121680 ) ( ON ?auto_121682 ?auto_121681 ) ( not ( = ?auto_121679 ?auto_121680 ) ) ( not ( = ?auto_121679 ?auto_121681 ) ) ( not ( = ?auto_121679 ?auto_121682 ) ) ( not ( = ?auto_121679 ?auto_121683 ) ) ( not ( = ?auto_121679 ?auto_121684 ) ) ( not ( = ?auto_121679 ?auto_121685 ) ) ( not ( = ?auto_121679 ?auto_121686 ) ) ( not ( = ?auto_121679 ?auto_121687 ) ) ( not ( = ?auto_121679 ?auto_121688 ) ) ( not ( = ?auto_121679 ?auto_121689 ) ) ( not ( = ?auto_121679 ?auto_121690 ) ) ( not ( = ?auto_121680 ?auto_121681 ) ) ( not ( = ?auto_121680 ?auto_121682 ) ) ( not ( = ?auto_121680 ?auto_121683 ) ) ( not ( = ?auto_121680 ?auto_121684 ) ) ( not ( = ?auto_121680 ?auto_121685 ) ) ( not ( = ?auto_121680 ?auto_121686 ) ) ( not ( = ?auto_121680 ?auto_121687 ) ) ( not ( = ?auto_121680 ?auto_121688 ) ) ( not ( = ?auto_121680 ?auto_121689 ) ) ( not ( = ?auto_121680 ?auto_121690 ) ) ( not ( = ?auto_121681 ?auto_121682 ) ) ( not ( = ?auto_121681 ?auto_121683 ) ) ( not ( = ?auto_121681 ?auto_121684 ) ) ( not ( = ?auto_121681 ?auto_121685 ) ) ( not ( = ?auto_121681 ?auto_121686 ) ) ( not ( = ?auto_121681 ?auto_121687 ) ) ( not ( = ?auto_121681 ?auto_121688 ) ) ( not ( = ?auto_121681 ?auto_121689 ) ) ( not ( = ?auto_121681 ?auto_121690 ) ) ( not ( = ?auto_121682 ?auto_121683 ) ) ( not ( = ?auto_121682 ?auto_121684 ) ) ( not ( = ?auto_121682 ?auto_121685 ) ) ( not ( = ?auto_121682 ?auto_121686 ) ) ( not ( = ?auto_121682 ?auto_121687 ) ) ( not ( = ?auto_121682 ?auto_121688 ) ) ( not ( = ?auto_121682 ?auto_121689 ) ) ( not ( = ?auto_121682 ?auto_121690 ) ) ( not ( = ?auto_121683 ?auto_121684 ) ) ( not ( = ?auto_121683 ?auto_121685 ) ) ( not ( = ?auto_121683 ?auto_121686 ) ) ( not ( = ?auto_121683 ?auto_121687 ) ) ( not ( = ?auto_121683 ?auto_121688 ) ) ( not ( = ?auto_121683 ?auto_121689 ) ) ( not ( = ?auto_121683 ?auto_121690 ) ) ( not ( = ?auto_121684 ?auto_121685 ) ) ( not ( = ?auto_121684 ?auto_121686 ) ) ( not ( = ?auto_121684 ?auto_121687 ) ) ( not ( = ?auto_121684 ?auto_121688 ) ) ( not ( = ?auto_121684 ?auto_121689 ) ) ( not ( = ?auto_121684 ?auto_121690 ) ) ( not ( = ?auto_121685 ?auto_121686 ) ) ( not ( = ?auto_121685 ?auto_121687 ) ) ( not ( = ?auto_121685 ?auto_121688 ) ) ( not ( = ?auto_121685 ?auto_121689 ) ) ( not ( = ?auto_121685 ?auto_121690 ) ) ( not ( = ?auto_121686 ?auto_121687 ) ) ( not ( = ?auto_121686 ?auto_121688 ) ) ( not ( = ?auto_121686 ?auto_121689 ) ) ( not ( = ?auto_121686 ?auto_121690 ) ) ( not ( = ?auto_121687 ?auto_121688 ) ) ( not ( = ?auto_121687 ?auto_121689 ) ) ( not ( = ?auto_121687 ?auto_121690 ) ) ( not ( = ?auto_121688 ?auto_121689 ) ) ( not ( = ?auto_121688 ?auto_121690 ) ) ( not ( = ?auto_121689 ?auto_121690 ) ) ( ON ?auto_121688 ?auto_121689 ) ( ON ?auto_121687 ?auto_121688 ) ( ON ?auto_121686 ?auto_121687 ) ( ON ?auto_121685 ?auto_121686 ) ( ON ?auto_121684 ?auto_121685 ) ( CLEAR ?auto_121682 ) ( ON ?auto_121683 ?auto_121684 ) ( CLEAR ?auto_121683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121679 ?auto_121680 ?auto_121681 ?auto_121682 ?auto_121683 )
      ( MAKE-11PILE ?auto_121679 ?auto_121680 ?auto_121681 ?auto_121682 ?auto_121683 ?auto_121684 ?auto_121685 ?auto_121686 ?auto_121687 ?auto_121688 ?auto_121689 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_121702 - BLOCK
      ?auto_121703 - BLOCK
      ?auto_121704 - BLOCK
      ?auto_121705 - BLOCK
      ?auto_121706 - BLOCK
      ?auto_121707 - BLOCK
      ?auto_121708 - BLOCK
      ?auto_121709 - BLOCK
      ?auto_121710 - BLOCK
      ?auto_121711 - BLOCK
      ?auto_121712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121712 ) ( ON-TABLE ?auto_121702 ) ( ON ?auto_121703 ?auto_121702 ) ( ON ?auto_121704 ?auto_121703 ) ( ON ?auto_121705 ?auto_121704 ) ( not ( = ?auto_121702 ?auto_121703 ) ) ( not ( = ?auto_121702 ?auto_121704 ) ) ( not ( = ?auto_121702 ?auto_121705 ) ) ( not ( = ?auto_121702 ?auto_121706 ) ) ( not ( = ?auto_121702 ?auto_121707 ) ) ( not ( = ?auto_121702 ?auto_121708 ) ) ( not ( = ?auto_121702 ?auto_121709 ) ) ( not ( = ?auto_121702 ?auto_121710 ) ) ( not ( = ?auto_121702 ?auto_121711 ) ) ( not ( = ?auto_121702 ?auto_121712 ) ) ( not ( = ?auto_121703 ?auto_121704 ) ) ( not ( = ?auto_121703 ?auto_121705 ) ) ( not ( = ?auto_121703 ?auto_121706 ) ) ( not ( = ?auto_121703 ?auto_121707 ) ) ( not ( = ?auto_121703 ?auto_121708 ) ) ( not ( = ?auto_121703 ?auto_121709 ) ) ( not ( = ?auto_121703 ?auto_121710 ) ) ( not ( = ?auto_121703 ?auto_121711 ) ) ( not ( = ?auto_121703 ?auto_121712 ) ) ( not ( = ?auto_121704 ?auto_121705 ) ) ( not ( = ?auto_121704 ?auto_121706 ) ) ( not ( = ?auto_121704 ?auto_121707 ) ) ( not ( = ?auto_121704 ?auto_121708 ) ) ( not ( = ?auto_121704 ?auto_121709 ) ) ( not ( = ?auto_121704 ?auto_121710 ) ) ( not ( = ?auto_121704 ?auto_121711 ) ) ( not ( = ?auto_121704 ?auto_121712 ) ) ( not ( = ?auto_121705 ?auto_121706 ) ) ( not ( = ?auto_121705 ?auto_121707 ) ) ( not ( = ?auto_121705 ?auto_121708 ) ) ( not ( = ?auto_121705 ?auto_121709 ) ) ( not ( = ?auto_121705 ?auto_121710 ) ) ( not ( = ?auto_121705 ?auto_121711 ) ) ( not ( = ?auto_121705 ?auto_121712 ) ) ( not ( = ?auto_121706 ?auto_121707 ) ) ( not ( = ?auto_121706 ?auto_121708 ) ) ( not ( = ?auto_121706 ?auto_121709 ) ) ( not ( = ?auto_121706 ?auto_121710 ) ) ( not ( = ?auto_121706 ?auto_121711 ) ) ( not ( = ?auto_121706 ?auto_121712 ) ) ( not ( = ?auto_121707 ?auto_121708 ) ) ( not ( = ?auto_121707 ?auto_121709 ) ) ( not ( = ?auto_121707 ?auto_121710 ) ) ( not ( = ?auto_121707 ?auto_121711 ) ) ( not ( = ?auto_121707 ?auto_121712 ) ) ( not ( = ?auto_121708 ?auto_121709 ) ) ( not ( = ?auto_121708 ?auto_121710 ) ) ( not ( = ?auto_121708 ?auto_121711 ) ) ( not ( = ?auto_121708 ?auto_121712 ) ) ( not ( = ?auto_121709 ?auto_121710 ) ) ( not ( = ?auto_121709 ?auto_121711 ) ) ( not ( = ?auto_121709 ?auto_121712 ) ) ( not ( = ?auto_121710 ?auto_121711 ) ) ( not ( = ?auto_121710 ?auto_121712 ) ) ( not ( = ?auto_121711 ?auto_121712 ) ) ( ON ?auto_121711 ?auto_121712 ) ( ON ?auto_121710 ?auto_121711 ) ( ON ?auto_121709 ?auto_121710 ) ( ON ?auto_121708 ?auto_121709 ) ( ON ?auto_121707 ?auto_121708 ) ( CLEAR ?auto_121705 ) ( ON ?auto_121706 ?auto_121707 ) ( CLEAR ?auto_121706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121702 ?auto_121703 ?auto_121704 ?auto_121705 ?auto_121706 )
      ( MAKE-11PILE ?auto_121702 ?auto_121703 ?auto_121704 ?auto_121705 ?auto_121706 ?auto_121707 ?auto_121708 ?auto_121709 ?auto_121710 ?auto_121711 ?auto_121712 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_121724 - BLOCK
      ?auto_121725 - BLOCK
      ?auto_121726 - BLOCK
      ?auto_121727 - BLOCK
      ?auto_121728 - BLOCK
      ?auto_121729 - BLOCK
      ?auto_121730 - BLOCK
      ?auto_121731 - BLOCK
      ?auto_121732 - BLOCK
      ?auto_121733 - BLOCK
      ?auto_121734 - BLOCK
    )
    :vars
    (
      ?auto_121735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121734 ?auto_121735 ) ( ON-TABLE ?auto_121724 ) ( ON ?auto_121725 ?auto_121724 ) ( ON ?auto_121726 ?auto_121725 ) ( not ( = ?auto_121724 ?auto_121725 ) ) ( not ( = ?auto_121724 ?auto_121726 ) ) ( not ( = ?auto_121724 ?auto_121727 ) ) ( not ( = ?auto_121724 ?auto_121728 ) ) ( not ( = ?auto_121724 ?auto_121729 ) ) ( not ( = ?auto_121724 ?auto_121730 ) ) ( not ( = ?auto_121724 ?auto_121731 ) ) ( not ( = ?auto_121724 ?auto_121732 ) ) ( not ( = ?auto_121724 ?auto_121733 ) ) ( not ( = ?auto_121724 ?auto_121734 ) ) ( not ( = ?auto_121724 ?auto_121735 ) ) ( not ( = ?auto_121725 ?auto_121726 ) ) ( not ( = ?auto_121725 ?auto_121727 ) ) ( not ( = ?auto_121725 ?auto_121728 ) ) ( not ( = ?auto_121725 ?auto_121729 ) ) ( not ( = ?auto_121725 ?auto_121730 ) ) ( not ( = ?auto_121725 ?auto_121731 ) ) ( not ( = ?auto_121725 ?auto_121732 ) ) ( not ( = ?auto_121725 ?auto_121733 ) ) ( not ( = ?auto_121725 ?auto_121734 ) ) ( not ( = ?auto_121725 ?auto_121735 ) ) ( not ( = ?auto_121726 ?auto_121727 ) ) ( not ( = ?auto_121726 ?auto_121728 ) ) ( not ( = ?auto_121726 ?auto_121729 ) ) ( not ( = ?auto_121726 ?auto_121730 ) ) ( not ( = ?auto_121726 ?auto_121731 ) ) ( not ( = ?auto_121726 ?auto_121732 ) ) ( not ( = ?auto_121726 ?auto_121733 ) ) ( not ( = ?auto_121726 ?auto_121734 ) ) ( not ( = ?auto_121726 ?auto_121735 ) ) ( not ( = ?auto_121727 ?auto_121728 ) ) ( not ( = ?auto_121727 ?auto_121729 ) ) ( not ( = ?auto_121727 ?auto_121730 ) ) ( not ( = ?auto_121727 ?auto_121731 ) ) ( not ( = ?auto_121727 ?auto_121732 ) ) ( not ( = ?auto_121727 ?auto_121733 ) ) ( not ( = ?auto_121727 ?auto_121734 ) ) ( not ( = ?auto_121727 ?auto_121735 ) ) ( not ( = ?auto_121728 ?auto_121729 ) ) ( not ( = ?auto_121728 ?auto_121730 ) ) ( not ( = ?auto_121728 ?auto_121731 ) ) ( not ( = ?auto_121728 ?auto_121732 ) ) ( not ( = ?auto_121728 ?auto_121733 ) ) ( not ( = ?auto_121728 ?auto_121734 ) ) ( not ( = ?auto_121728 ?auto_121735 ) ) ( not ( = ?auto_121729 ?auto_121730 ) ) ( not ( = ?auto_121729 ?auto_121731 ) ) ( not ( = ?auto_121729 ?auto_121732 ) ) ( not ( = ?auto_121729 ?auto_121733 ) ) ( not ( = ?auto_121729 ?auto_121734 ) ) ( not ( = ?auto_121729 ?auto_121735 ) ) ( not ( = ?auto_121730 ?auto_121731 ) ) ( not ( = ?auto_121730 ?auto_121732 ) ) ( not ( = ?auto_121730 ?auto_121733 ) ) ( not ( = ?auto_121730 ?auto_121734 ) ) ( not ( = ?auto_121730 ?auto_121735 ) ) ( not ( = ?auto_121731 ?auto_121732 ) ) ( not ( = ?auto_121731 ?auto_121733 ) ) ( not ( = ?auto_121731 ?auto_121734 ) ) ( not ( = ?auto_121731 ?auto_121735 ) ) ( not ( = ?auto_121732 ?auto_121733 ) ) ( not ( = ?auto_121732 ?auto_121734 ) ) ( not ( = ?auto_121732 ?auto_121735 ) ) ( not ( = ?auto_121733 ?auto_121734 ) ) ( not ( = ?auto_121733 ?auto_121735 ) ) ( not ( = ?auto_121734 ?auto_121735 ) ) ( ON ?auto_121733 ?auto_121734 ) ( ON ?auto_121732 ?auto_121733 ) ( ON ?auto_121731 ?auto_121732 ) ( ON ?auto_121730 ?auto_121731 ) ( ON ?auto_121729 ?auto_121730 ) ( ON ?auto_121728 ?auto_121729 ) ( CLEAR ?auto_121726 ) ( ON ?auto_121727 ?auto_121728 ) ( CLEAR ?auto_121727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121724 ?auto_121725 ?auto_121726 ?auto_121727 )
      ( MAKE-11PILE ?auto_121724 ?auto_121725 ?auto_121726 ?auto_121727 ?auto_121728 ?auto_121729 ?auto_121730 ?auto_121731 ?auto_121732 ?auto_121733 ?auto_121734 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_121747 - BLOCK
      ?auto_121748 - BLOCK
      ?auto_121749 - BLOCK
      ?auto_121750 - BLOCK
      ?auto_121751 - BLOCK
      ?auto_121752 - BLOCK
      ?auto_121753 - BLOCK
      ?auto_121754 - BLOCK
      ?auto_121755 - BLOCK
      ?auto_121756 - BLOCK
      ?auto_121757 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121757 ) ( ON-TABLE ?auto_121747 ) ( ON ?auto_121748 ?auto_121747 ) ( ON ?auto_121749 ?auto_121748 ) ( not ( = ?auto_121747 ?auto_121748 ) ) ( not ( = ?auto_121747 ?auto_121749 ) ) ( not ( = ?auto_121747 ?auto_121750 ) ) ( not ( = ?auto_121747 ?auto_121751 ) ) ( not ( = ?auto_121747 ?auto_121752 ) ) ( not ( = ?auto_121747 ?auto_121753 ) ) ( not ( = ?auto_121747 ?auto_121754 ) ) ( not ( = ?auto_121747 ?auto_121755 ) ) ( not ( = ?auto_121747 ?auto_121756 ) ) ( not ( = ?auto_121747 ?auto_121757 ) ) ( not ( = ?auto_121748 ?auto_121749 ) ) ( not ( = ?auto_121748 ?auto_121750 ) ) ( not ( = ?auto_121748 ?auto_121751 ) ) ( not ( = ?auto_121748 ?auto_121752 ) ) ( not ( = ?auto_121748 ?auto_121753 ) ) ( not ( = ?auto_121748 ?auto_121754 ) ) ( not ( = ?auto_121748 ?auto_121755 ) ) ( not ( = ?auto_121748 ?auto_121756 ) ) ( not ( = ?auto_121748 ?auto_121757 ) ) ( not ( = ?auto_121749 ?auto_121750 ) ) ( not ( = ?auto_121749 ?auto_121751 ) ) ( not ( = ?auto_121749 ?auto_121752 ) ) ( not ( = ?auto_121749 ?auto_121753 ) ) ( not ( = ?auto_121749 ?auto_121754 ) ) ( not ( = ?auto_121749 ?auto_121755 ) ) ( not ( = ?auto_121749 ?auto_121756 ) ) ( not ( = ?auto_121749 ?auto_121757 ) ) ( not ( = ?auto_121750 ?auto_121751 ) ) ( not ( = ?auto_121750 ?auto_121752 ) ) ( not ( = ?auto_121750 ?auto_121753 ) ) ( not ( = ?auto_121750 ?auto_121754 ) ) ( not ( = ?auto_121750 ?auto_121755 ) ) ( not ( = ?auto_121750 ?auto_121756 ) ) ( not ( = ?auto_121750 ?auto_121757 ) ) ( not ( = ?auto_121751 ?auto_121752 ) ) ( not ( = ?auto_121751 ?auto_121753 ) ) ( not ( = ?auto_121751 ?auto_121754 ) ) ( not ( = ?auto_121751 ?auto_121755 ) ) ( not ( = ?auto_121751 ?auto_121756 ) ) ( not ( = ?auto_121751 ?auto_121757 ) ) ( not ( = ?auto_121752 ?auto_121753 ) ) ( not ( = ?auto_121752 ?auto_121754 ) ) ( not ( = ?auto_121752 ?auto_121755 ) ) ( not ( = ?auto_121752 ?auto_121756 ) ) ( not ( = ?auto_121752 ?auto_121757 ) ) ( not ( = ?auto_121753 ?auto_121754 ) ) ( not ( = ?auto_121753 ?auto_121755 ) ) ( not ( = ?auto_121753 ?auto_121756 ) ) ( not ( = ?auto_121753 ?auto_121757 ) ) ( not ( = ?auto_121754 ?auto_121755 ) ) ( not ( = ?auto_121754 ?auto_121756 ) ) ( not ( = ?auto_121754 ?auto_121757 ) ) ( not ( = ?auto_121755 ?auto_121756 ) ) ( not ( = ?auto_121755 ?auto_121757 ) ) ( not ( = ?auto_121756 ?auto_121757 ) ) ( ON ?auto_121756 ?auto_121757 ) ( ON ?auto_121755 ?auto_121756 ) ( ON ?auto_121754 ?auto_121755 ) ( ON ?auto_121753 ?auto_121754 ) ( ON ?auto_121752 ?auto_121753 ) ( ON ?auto_121751 ?auto_121752 ) ( CLEAR ?auto_121749 ) ( ON ?auto_121750 ?auto_121751 ) ( CLEAR ?auto_121750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121747 ?auto_121748 ?auto_121749 ?auto_121750 )
      ( MAKE-11PILE ?auto_121747 ?auto_121748 ?auto_121749 ?auto_121750 ?auto_121751 ?auto_121752 ?auto_121753 ?auto_121754 ?auto_121755 ?auto_121756 ?auto_121757 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_121769 - BLOCK
      ?auto_121770 - BLOCK
      ?auto_121771 - BLOCK
      ?auto_121772 - BLOCK
      ?auto_121773 - BLOCK
      ?auto_121774 - BLOCK
      ?auto_121775 - BLOCK
      ?auto_121776 - BLOCK
      ?auto_121777 - BLOCK
      ?auto_121778 - BLOCK
      ?auto_121779 - BLOCK
    )
    :vars
    (
      ?auto_121780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121779 ?auto_121780 ) ( ON-TABLE ?auto_121769 ) ( ON ?auto_121770 ?auto_121769 ) ( not ( = ?auto_121769 ?auto_121770 ) ) ( not ( = ?auto_121769 ?auto_121771 ) ) ( not ( = ?auto_121769 ?auto_121772 ) ) ( not ( = ?auto_121769 ?auto_121773 ) ) ( not ( = ?auto_121769 ?auto_121774 ) ) ( not ( = ?auto_121769 ?auto_121775 ) ) ( not ( = ?auto_121769 ?auto_121776 ) ) ( not ( = ?auto_121769 ?auto_121777 ) ) ( not ( = ?auto_121769 ?auto_121778 ) ) ( not ( = ?auto_121769 ?auto_121779 ) ) ( not ( = ?auto_121769 ?auto_121780 ) ) ( not ( = ?auto_121770 ?auto_121771 ) ) ( not ( = ?auto_121770 ?auto_121772 ) ) ( not ( = ?auto_121770 ?auto_121773 ) ) ( not ( = ?auto_121770 ?auto_121774 ) ) ( not ( = ?auto_121770 ?auto_121775 ) ) ( not ( = ?auto_121770 ?auto_121776 ) ) ( not ( = ?auto_121770 ?auto_121777 ) ) ( not ( = ?auto_121770 ?auto_121778 ) ) ( not ( = ?auto_121770 ?auto_121779 ) ) ( not ( = ?auto_121770 ?auto_121780 ) ) ( not ( = ?auto_121771 ?auto_121772 ) ) ( not ( = ?auto_121771 ?auto_121773 ) ) ( not ( = ?auto_121771 ?auto_121774 ) ) ( not ( = ?auto_121771 ?auto_121775 ) ) ( not ( = ?auto_121771 ?auto_121776 ) ) ( not ( = ?auto_121771 ?auto_121777 ) ) ( not ( = ?auto_121771 ?auto_121778 ) ) ( not ( = ?auto_121771 ?auto_121779 ) ) ( not ( = ?auto_121771 ?auto_121780 ) ) ( not ( = ?auto_121772 ?auto_121773 ) ) ( not ( = ?auto_121772 ?auto_121774 ) ) ( not ( = ?auto_121772 ?auto_121775 ) ) ( not ( = ?auto_121772 ?auto_121776 ) ) ( not ( = ?auto_121772 ?auto_121777 ) ) ( not ( = ?auto_121772 ?auto_121778 ) ) ( not ( = ?auto_121772 ?auto_121779 ) ) ( not ( = ?auto_121772 ?auto_121780 ) ) ( not ( = ?auto_121773 ?auto_121774 ) ) ( not ( = ?auto_121773 ?auto_121775 ) ) ( not ( = ?auto_121773 ?auto_121776 ) ) ( not ( = ?auto_121773 ?auto_121777 ) ) ( not ( = ?auto_121773 ?auto_121778 ) ) ( not ( = ?auto_121773 ?auto_121779 ) ) ( not ( = ?auto_121773 ?auto_121780 ) ) ( not ( = ?auto_121774 ?auto_121775 ) ) ( not ( = ?auto_121774 ?auto_121776 ) ) ( not ( = ?auto_121774 ?auto_121777 ) ) ( not ( = ?auto_121774 ?auto_121778 ) ) ( not ( = ?auto_121774 ?auto_121779 ) ) ( not ( = ?auto_121774 ?auto_121780 ) ) ( not ( = ?auto_121775 ?auto_121776 ) ) ( not ( = ?auto_121775 ?auto_121777 ) ) ( not ( = ?auto_121775 ?auto_121778 ) ) ( not ( = ?auto_121775 ?auto_121779 ) ) ( not ( = ?auto_121775 ?auto_121780 ) ) ( not ( = ?auto_121776 ?auto_121777 ) ) ( not ( = ?auto_121776 ?auto_121778 ) ) ( not ( = ?auto_121776 ?auto_121779 ) ) ( not ( = ?auto_121776 ?auto_121780 ) ) ( not ( = ?auto_121777 ?auto_121778 ) ) ( not ( = ?auto_121777 ?auto_121779 ) ) ( not ( = ?auto_121777 ?auto_121780 ) ) ( not ( = ?auto_121778 ?auto_121779 ) ) ( not ( = ?auto_121778 ?auto_121780 ) ) ( not ( = ?auto_121779 ?auto_121780 ) ) ( ON ?auto_121778 ?auto_121779 ) ( ON ?auto_121777 ?auto_121778 ) ( ON ?auto_121776 ?auto_121777 ) ( ON ?auto_121775 ?auto_121776 ) ( ON ?auto_121774 ?auto_121775 ) ( ON ?auto_121773 ?auto_121774 ) ( ON ?auto_121772 ?auto_121773 ) ( CLEAR ?auto_121770 ) ( ON ?auto_121771 ?auto_121772 ) ( CLEAR ?auto_121771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121769 ?auto_121770 ?auto_121771 )
      ( MAKE-11PILE ?auto_121769 ?auto_121770 ?auto_121771 ?auto_121772 ?auto_121773 ?auto_121774 ?auto_121775 ?auto_121776 ?auto_121777 ?auto_121778 ?auto_121779 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_121792 - BLOCK
      ?auto_121793 - BLOCK
      ?auto_121794 - BLOCK
      ?auto_121795 - BLOCK
      ?auto_121796 - BLOCK
      ?auto_121797 - BLOCK
      ?auto_121798 - BLOCK
      ?auto_121799 - BLOCK
      ?auto_121800 - BLOCK
      ?auto_121801 - BLOCK
      ?auto_121802 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121802 ) ( ON-TABLE ?auto_121792 ) ( ON ?auto_121793 ?auto_121792 ) ( not ( = ?auto_121792 ?auto_121793 ) ) ( not ( = ?auto_121792 ?auto_121794 ) ) ( not ( = ?auto_121792 ?auto_121795 ) ) ( not ( = ?auto_121792 ?auto_121796 ) ) ( not ( = ?auto_121792 ?auto_121797 ) ) ( not ( = ?auto_121792 ?auto_121798 ) ) ( not ( = ?auto_121792 ?auto_121799 ) ) ( not ( = ?auto_121792 ?auto_121800 ) ) ( not ( = ?auto_121792 ?auto_121801 ) ) ( not ( = ?auto_121792 ?auto_121802 ) ) ( not ( = ?auto_121793 ?auto_121794 ) ) ( not ( = ?auto_121793 ?auto_121795 ) ) ( not ( = ?auto_121793 ?auto_121796 ) ) ( not ( = ?auto_121793 ?auto_121797 ) ) ( not ( = ?auto_121793 ?auto_121798 ) ) ( not ( = ?auto_121793 ?auto_121799 ) ) ( not ( = ?auto_121793 ?auto_121800 ) ) ( not ( = ?auto_121793 ?auto_121801 ) ) ( not ( = ?auto_121793 ?auto_121802 ) ) ( not ( = ?auto_121794 ?auto_121795 ) ) ( not ( = ?auto_121794 ?auto_121796 ) ) ( not ( = ?auto_121794 ?auto_121797 ) ) ( not ( = ?auto_121794 ?auto_121798 ) ) ( not ( = ?auto_121794 ?auto_121799 ) ) ( not ( = ?auto_121794 ?auto_121800 ) ) ( not ( = ?auto_121794 ?auto_121801 ) ) ( not ( = ?auto_121794 ?auto_121802 ) ) ( not ( = ?auto_121795 ?auto_121796 ) ) ( not ( = ?auto_121795 ?auto_121797 ) ) ( not ( = ?auto_121795 ?auto_121798 ) ) ( not ( = ?auto_121795 ?auto_121799 ) ) ( not ( = ?auto_121795 ?auto_121800 ) ) ( not ( = ?auto_121795 ?auto_121801 ) ) ( not ( = ?auto_121795 ?auto_121802 ) ) ( not ( = ?auto_121796 ?auto_121797 ) ) ( not ( = ?auto_121796 ?auto_121798 ) ) ( not ( = ?auto_121796 ?auto_121799 ) ) ( not ( = ?auto_121796 ?auto_121800 ) ) ( not ( = ?auto_121796 ?auto_121801 ) ) ( not ( = ?auto_121796 ?auto_121802 ) ) ( not ( = ?auto_121797 ?auto_121798 ) ) ( not ( = ?auto_121797 ?auto_121799 ) ) ( not ( = ?auto_121797 ?auto_121800 ) ) ( not ( = ?auto_121797 ?auto_121801 ) ) ( not ( = ?auto_121797 ?auto_121802 ) ) ( not ( = ?auto_121798 ?auto_121799 ) ) ( not ( = ?auto_121798 ?auto_121800 ) ) ( not ( = ?auto_121798 ?auto_121801 ) ) ( not ( = ?auto_121798 ?auto_121802 ) ) ( not ( = ?auto_121799 ?auto_121800 ) ) ( not ( = ?auto_121799 ?auto_121801 ) ) ( not ( = ?auto_121799 ?auto_121802 ) ) ( not ( = ?auto_121800 ?auto_121801 ) ) ( not ( = ?auto_121800 ?auto_121802 ) ) ( not ( = ?auto_121801 ?auto_121802 ) ) ( ON ?auto_121801 ?auto_121802 ) ( ON ?auto_121800 ?auto_121801 ) ( ON ?auto_121799 ?auto_121800 ) ( ON ?auto_121798 ?auto_121799 ) ( ON ?auto_121797 ?auto_121798 ) ( ON ?auto_121796 ?auto_121797 ) ( ON ?auto_121795 ?auto_121796 ) ( CLEAR ?auto_121793 ) ( ON ?auto_121794 ?auto_121795 ) ( CLEAR ?auto_121794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121792 ?auto_121793 ?auto_121794 )
      ( MAKE-11PILE ?auto_121792 ?auto_121793 ?auto_121794 ?auto_121795 ?auto_121796 ?auto_121797 ?auto_121798 ?auto_121799 ?auto_121800 ?auto_121801 ?auto_121802 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_121814 - BLOCK
      ?auto_121815 - BLOCK
      ?auto_121816 - BLOCK
      ?auto_121817 - BLOCK
      ?auto_121818 - BLOCK
      ?auto_121819 - BLOCK
      ?auto_121820 - BLOCK
      ?auto_121821 - BLOCK
      ?auto_121822 - BLOCK
      ?auto_121823 - BLOCK
      ?auto_121824 - BLOCK
    )
    :vars
    (
      ?auto_121825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121824 ?auto_121825 ) ( ON-TABLE ?auto_121814 ) ( not ( = ?auto_121814 ?auto_121815 ) ) ( not ( = ?auto_121814 ?auto_121816 ) ) ( not ( = ?auto_121814 ?auto_121817 ) ) ( not ( = ?auto_121814 ?auto_121818 ) ) ( not ( = ?auto_121814 ?auto_121819 ) ) ( not ( = ?auto_121814 ?auto_121820 ) ) ( not ( = ?auto_121814 ?auto_121821 ) ) ( not ( = ?auto_121814 ?auto_121822 ) ) ( not ( = ?auto_121814 ?auto_121823 ) ) ( not ( = ?auto_121814 ?auto_121824 ) ) ( not ( = ?auto_121814 ?auto_121825 ) ) ( not ( = ?auto_121815 ?auto_121816 ) ) ( not ( = ?auto_121815 ?auto_121817 ) ) ( not ( = ?auto_121815 ?auto_121818 ) ) ( not ( = ?auto_121815 ?auto_121819 ) ) ( not ( = ?auto_121815 ?auto_121820 ) ) ( not ( = ?auto_121815 ?auto_121821 ) ) ( not ( = ?auto_121815 ?auto_121822 ) ) ( not ( = ?auto_121815 ?auto_121823 ) ) ( not ( = ?auto_121815 ?auto_121824 ) ) ( not ( = ?auto_121815 ?auto_121825 ) ) ( not ( = ?auto_121816 ?auto_121817 ) ) ( not ( = ?auto_121816 ?auto_121818 ) ) ( not ( = ?auto_121816 ?auto_121819 ) ) ( not ( = ?auto_121816 ?auto_121820 ) ) ( not ( = ?auto_121816 ?auto_121821 ) ) ( not ( = ?auto_121816 ?auto_121822 ) ) ( not ( = ?auto_121816 ?auto_121823 ) ) ( not ( = ?auto_121816 ?auto_121824 ) ) ( not ( = ?auto_121816 ?auto_121825 ) ) ( not ( = ?auto_121817 ?auto_121818 ) ) ( not ( = ?auto_121817 ?auto_121819 ) ) ( not ( = ?auto_121817 ?auto_121820 ) ) ( not ( = ?auto_121817 ?auto_121821 ) ) ( not ( = ?auto_121817 ?auto_121822 ) ) ( not ( = ?auto_121817 ?auto_121823 ) ) ( not ( = ?auto_121817 ?auto_121824 ) ) ( not ( = ?auto_121817 ?auto_121825 ) ) ( not ( = ?auto_121818 ?auto_121819 ) ) ( not ( = ?auto_121818 ?auto_121820 ) ) ( not ( = ?auto_121818 ?auto_121821 ) ) ( not ( = ?auto_121818 ?auto_121822 ) ) ( not ( = ?auto_121818 ?auto_121823 ) ) ( not ( = ?auto_121818 ?auto_121824 ) ) ( not ( = ?auto_121818 ?auto_121825 ) ) ( not ( = ?auto_121819 ?auto_121820 ) ) ( not ( = ?auto_121819 ?auto_121821 ) ) ( not ( = ?auto_121819 ?auto_121822 ) ) ( not ( = ?auto_121819 ?auto_121823 ) ) ( not ( = ?auto_121819 ?auto_121824 ) ) ( not ( = ?auto_121819 ?auto_121825 ) ) ( not ( = ?auto_121820 ?auto_121821 ) ) ( not ( = ?auto_121820 ?auto_121822 ) ) ( not ( = ?auto_121820 ?auto_121823 ) ) ( not ( = ?auto_121820 ?auto_121824 ) ) ( not ( = ?auto_121820 ?auto_121825 ) ) ( not ( = ?auto_121821 ?auto_121822 ) ) ( not ( = ?auto_121821 ?auto_121823 ) ) ( not ( = ?auto_121821 ?auto_121824 ) ) ( not ( = ?auto_121821 ?auto_121825 ) ) ( not ( = ?auto_121822 ?auto_121823 ) ) ( not ( = ?auto_121822 ?auto_121824 ) ) ( not ( = ?auto_121822 ?auto_121825 ) ) ( not ( = ?auto_121823 ?auto_121824 ) ) ( not ( = ?auto_121823 ?auto_121825 ) ) ( not ( = ?auto_121824 ?auto_121825 ) ) ( ON ?auto_121823 ?auto_121824 ) ( ON ?auto_121822 ?auto_121823 ) ( ON ?auto_121821 ?auto_121822 ) ( ON ?auto_121820 ?auto_121821 ) ( ON ?auto_121819 ?auto_121820 ) ( ON ?auto_121818 ?auto_121819 ) ( ON ?auto_121817 ?auto_121818 ) ( ON ?auto_121816 ?auto_121817 ) ( CLEAR ?auto_121814 ) ( ON ?auto_121815 ?auto_121816 ) ( CLEAR ?auto_121815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121814 ?auto_121815 )
      ( MAKE-11PILE ?auto_121814 ?auto_121815 ?auto_121816 ?auto_121817 ?auto_121818 ?auto_121819 ?auto_121820 ?auto_121821 ?auto_121822 ?auto_121823 ?auto_121824 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_121837 - BLOCK
      ?auto_121838 - BLOCK
      ?auto_121839 - BLOCK
      ?auto_121840 - BLOCK
      ?auto_121841 - BLOCK
      ?auto_121842 - BLOCK
      ?auto_121843 - BLOCK
      ?auto_121844 - BLOCK
      ?auto_121845 - BLOCK
      ?auto_121846 - BLOCK
      ?auto_121847 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121847 ) ( ON-TABLE ?auto_121837 ) ( not ( = ?auto_121837 ?auto_121838 ) ) ( not ( = ?auto_121837 ?auto_121839 ) ) ( not ( = ?auto_121837 ?auto_121840 ) ) ( not ( = ?auto_121837 ?auto_121841 ) ) ( not ( = ?auto_121837 ?auto_121842 ) ) ( not ( = ?auto_121837 ?auto_121843 ) ) ( not ( = ?auto_121837 ?auto_121844 ) ) ( not ( = ?auto_121837 ?auto_121845 ) ) ( not ( = ?auto_121837 ?auto_121846 ) ) ( not ( = ?auto_121837 ?auto_121847 ) ) ( not ( = ?auto_121838 ?auto_121839 ) ) ( not ( = ?auto_121838 ?auto_121840 ) ) ( not ( = ?auto_121838 ?auto_121841 ) ) ( not ( = ?auto_121838 ?auto_121842 ) ) ( not ( = ?auto_121838 ?auto_121843 ) ) ( not ( = ?auto_121838 ?auto_121844 ) ) ( not ( = ?auto_121838 ?auto_121845 ) ) ( not ( = ?auto_121838 ?auto_121846 ) ) ( not ( = ?auto_121838 ?auto_121847 ) ) ( not ( = ?auto_121839 ?auto_121840 ) ) ( not ( = ?auto_121839 ?auto_121841 ) ) ( not ( = ?auto_121839 ?auto_121842 ) ) ( not ( = ?auto_121839 ?auto_121843 ) ) ( not ( = ?auto_121839 ?auto_121844 ) ) ( not ( = ?auto_121839 ?auto_121845 ) ) ( not ( = ?auto_121839 ?auto_121846 ) ) ( not ( = ?auto_121839 ?auto_121847 ) ) ( not ( = ?auto_121840 ?auto_121841 ) ) ( not ( = ?auto_121840 ?auto_121842 ) ) ( not ( = ?auto_121840 ?auto_121843 ) ) ( not ( = ?auto_121840 ?auto_121844 ) ) ( not ( = ?auto_121840 ?auto_121845 ) ) ( not ( = ?auto_121840 ?auto_121846 ) ) ( not ( = ?auto_121840 ?auto_121847 ) ) ( not ( = ?auto_121841 ?auto_121842 ) ) ( not ( = ?auto_121841 ?auto_121843 ) ) ( not ( = ?auto_121841 ?auto_121844 ) ) ( not ( = ?auto_121841 ?auto_121845 ) ) ( not ( = ?auto_121841 ?auto_121846 ) ) ( not ( = ?auto_121841 ?auto_121847 ) ) ( not ( = ?auto_121842 ?auto_121843 ) ) ( not ( = ?auto_121842 ?auto_121844 ) ) ( not ( = ?auto_121842 ?auto_121845 ) ) ( not ( = ?auto_121842 ?auto_121846 ) ) ( not ( = ?auto_121842 ?auto_121847 ) ) ( not ( = ?auto_121843 ?auto_121844 ) ) ( not ( = ?auto_121843 ?auto_121845 ) ) ( not ( = ?auto_121843 ?auto_121846 ) ) ( not ( = ?auto_121843 ?auto_121847 ) ) ( not ( = ?auto_121844 ?auto_121845 ) ) ( not ( = ?auto_121844 ?auto_121846 ) ) ( not ( = ?auto_121844 ?auto_121847 ) ) ( not ( = ?auto_121845 ?auto_121846 ) ) ( not ( = ?auto_121845 ?auto_121847 ) ) ( not ( = ?auto_121846 ?auto_121847 ) ) ( ON ?auto_121846 ?auto_121847 ) ( ON ?auto_121845 ?auto_121846 ) ( ON ?auto_121844 ?auto_121845 ) ( ON ?auto_121843 ?auto_121844 ) ( ON ?auto_121842 ?auto_121843 ) ( ON ?auto_121841 ?auto_121842 ) ( ON ?auto_121840 ?auto_121841 ) ( ON ?auto_121839 ?auto_121840 ) ( CLEAR ?auto_121837 ) ( ON ?auto_121838 ?auto_121839 ) ( CLEAR ?auto_121838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121837 ?auto_121838 )
      ( MAKE-11PILE ?auto_121837 ?auto_121838 ?auto_121839 ?auto_121840 ?auto_121841 ?auto_121842 ?auto_121843 ?auto_121844 ?auto_121845 ?auto_121846 ?auto_121847 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_121859 - BLOCK
      ?auto_121860 - BLOCK
      ?auto_121861 - BLOCK
      ?auto_121862 - BLOCK
      ?auto_121863 - BLOCK
      ?auto_121864 - BLOCK
      ?auto_121865 - BLOCK
      ?auto_121866 - BLOCK
      ?auto_121867 - BLOCK
      ?auto_121868 - BLOCK
      ?auto_121869 - BLOCK
    )
    :vars
    (
      ?auto_121870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121869 ?auto_121870 ) ( not ( = ?auto_121859 ?auto_121860 ) ) ( not ( = ?auto_121859 ?auto_121861 ) ) ( not ( = ?auto_121859 ?auto_121862 ) ) ( not ( = ?auto_121859 ?auto_121863 ) ) ( not ( = ?auto_121859 ?auto_121864 ) ) ( not ( = ?auto_121859 ?auto_121865 ) ) ( not ( = ?auto_121859 ?auto_121866 ) ) ( not ( = ?auto_121859 ?auto_121867 ) ) ( not ( = ?auto_121859 ?auto_121868 ) ) ( not ( = ?auto_121859 ?auto_121869 ) ) ( not ( = ?auto_121859 ?auto_121870 ) ) ( not ( = ?auto_121860 ?auto_121861 ) ) ( not ( = ?auto_121860 ?auto_121862 ) ) ( not ( = ?auto_121860 ?auto_121863 ) ) ( not ( = ?auto_121860 ?auto_121864 ) ) ( not ( = ?auto_121860 ?auto_121865 ) ) ( not ( = ?auto_121860 ?auto_121866 ) ) ( not ( = ?auto_121860 ?auto_121867 ) ) ( not ( = ?auto_121860 ?auto_121868 ) ) ( not ( = ?auto_121860 ?auto_121869 ) ) ( not ( = ?auto_121860 ?auto_121870 ) ) ( not ( = ?auto_121861 ?auto_121862 ) ) ( not ( = ?auto_121861 ?auto_121863 ) ) ( not ( = ?auto_121861 ?auto_121864 ) ) ( not ( = ?auto_121861 ?auto_121865 ) ) ( not ( = ?auto_121861 ?auto_121866 ) ) ( not ( = ?auto_121861 ?auto_121867 ) ) ( not ( = ?auto_121861 ?auto_121868 ) ) ( not ( = ?auto_121861 ?auto_121869 ) ) ( not ( = ?auto_121861 ?auto_121870 ) ) ( not ( = ?auto_121862 ?auto_121863 ) ) ( not ( = ?auto_121862 ?auto_121864 ) ) ( not ( = ?auto_121862 ?auto_121865 ) ) ( not ( = ?auto_121862 ?auto_121866 ) ) ( not ( = ?auto_121862 ?auto_121867 ) ) ( not ( = ?auto_121862 ?auto_121868 ) ) ( not ( = ?auto_121862 ?auto_121869 ) ) ( not ( = ?auto_121862 ?auto_121870 ) ) ( not ( = ?auto_121863 ?auto_121864 ) ) ( not ( = ?auto_121863 ?auto_121865 ) ) ( not ( = ?auto_121863 ?auto_121866 ) ) ( not ( = ?auto_121863 ?auto_121867 ) ) ( not ( = ?auto_121863 ?auto_121868 ) ) ( not ( = ?auto_121863 ?auto_121869 ) ) ( not ( = ?auto_121863 ?auto_121870 ) ) ( not ( = ?auto_121864 ?auto_121865 ) ) ( not ( = ?auto_121864 ?auto_121866 ) ) ( not ( = ?auto_121864 ?auto_121867 ) ) ( not ( = ?auto_121864 ?auto_121868 ) ) ( not ( = ?auto_121864 ?auto_121869 ) ) ( not ( = ?auto_121864 ?auto_121870 ) ) ( not ( = ?auto_121865 ?auto_121866 ) ) ( not ( = ?auto_121865 ?auto_121867 ) ) ( not ( = ?auto_121865 ?auto_121868 ) ) ( not ( = ?auto_121865 ?auto_121869 ) ) ( not ( = ?auto_121865 ?auto_121870 ) ) ( not ( = ?auto_121866 ?auto_121867 ) ) ( not ( = ?auto_121866 ?auto_121868 ) ) ( not ( = ?auto_121866 ?auto_121869 ) ) ( not ( = ?auto_121866 ?auto_121870 ) ) ( not ( = ?auto_121867 ?auto_121868 ) ) ( not ( = ?auto_121867 ?auto_121869 ) ) ( not ( = ?auto_121867 ?auto_121870 ) ) ( not ( = ?auto_121868 ?auto_121869 ) ) ( not ( = ?auto_121868 ?auto_121870 ) ) ( not ( = ?auto_121869 ?auto_121870 ) ) ( ON ?auto_121868 ?auto_121869 ) ( ON ?auto_121867 ?auto_121868 ) ( ON ?auto_121866 ?auto_121867 ) ( ON ?auto_121865 ?auto_121866 ) ( ON ?auto_121864 ?auto_121865 ) ( ON ?auto_121863 ?auto_121864 ) ( ON ?auto_121862 ?auto_121863 ) ( ON ?auto_121861 ?auto_121862 ) ( ON ?auto_121860 ?auto_121861 ) ( ON ?auto_121859 ?auto_121860 ) ( CLEAR ?auto_121859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121859 )
      ( MAKE-11PILE ?auto_121859 ?auto_121860 ?auto_121861 ?auto_121862 ?auto_121863 ?auto_121864 ?auto_121865 ?auto_121866 ?auto_121867 ?auto_121868 ?auto_121869 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_121882 - BLOCK
      ?auto_121883 - BLOCK
      ?auto_121884 - BLOCK
      ?auto_121885 - BLOCK
      ?auto_121886 - BLOCK
      ?auto_121887 - BLOCK
      ?auto_121888 - BLOCK
      ?auto_121889 - BLOCK
      ?auto_121890 - BLOCK
      ?auto_121891 - BLOCK
      ?auto_121892 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121892 ) ( not ( = ?auto_121882 ?auto_121883 ) ) ( not ( = ?auto_121882 ?auto_121884 ) ) ( not ( = ?auto_121882 ?auto_121885 ) ) ( not ( = ?auto_121882 ?auto_121886 ) ) ( not ( = ?auto_121882 ?auto_121887 ) ) ( not ( = ?auto_121882 ?auto_121888 ) ) ( not ( = ?auto_121882 ?auto_121889 ) ) ( not ( = ?auto_121882 ?auto_121890 ) ) ( not ( = ?auto_121882 ?auto_121891 ) ) ( not ( = ?auto_121882 ?auto_121892 ) ) ( not ( = ?auto_121883 ?auto_121884 ) ) ( not ( = ?auto_121883 ?auto_121885 ) ) ( not ( = ?auto_121883 ?auto_121886 ) ) ( not ( = ?auto_121883 ?auto_121887 ) ) ( not ( = ?auto_121883 ?auto_121888 ) ) ( not ( = ?auto_121883 ?auto_121889 ) ) ( not ( = ?auto_121883 ?auto_121890 ) ) ( not ( = ?auto_121883 ?auto_121891 ) ) ( not ( = ?auto_121883 ?auto_121892 ) ) ( not ( = ?auto_121884 ?auto_121885 ) ) ( not ( = ?auto_121884 ?auto_121886 ) ) ( not ( = ?auto_121884 ?auto_121887 ) ) ( not ( = ?auto_121884 ?auto_121888 ) ) ( not ( = ?auto_121884 ?auto_121889 ) ) ( not ( = ?auto_121884 ?auto_121890 ) ) ( not ( = ?auto_121884 ?auto_121891 ) ) ( not ( = ?auto_121884 ?auto_121892 ) ) ( not ( = ?auto_121885 ?auto_121886 ) ) ( not ( = ?auto_121885 ?auto_121887 ) ) ( not ( = ?auto_121885 ?auto_121888 ) ) ( not ( = ?auto_121885 ?auto_121889 ) ) ( not ( = ?auto_121885 ?auto_121890 ) ) ( not ( = ?auto_121885 ?auto_121891 ) ) ( not ( = ?auto_121885 ?auto_121892 ) ) ( not ( = ?auto_121886 ?auto_121887 ) ) ( not ( = ?auto_121886 ?auto_121888 ) ) ( not ( = ?auto_121886 ?auto_121889 ) ) ( not ( = ?auto_121886 ?auto_121890 ) ) ( not ( = ?auto_121886 ?auto_121891 ) ) ( not ( = ?auto_121886 ?auto_121892 ) ) ( not ( = ?auto_121887 ?auto_121888 ) ) ( not ( = ?auto_121887 ?auto_121889 ) ) ( not ( = ?auto_121887 ?auto_121890 ) ) ( not ( = ?auto_121887 ?auto_121891 ) ) ( not ( = ?auto_121887 ?auto_121892 ) ) ( not ( = ?auto_121888 ?auto_121889 ) ) ( not ( = ?auto_121888 ?auto_121890 ) ) ( not ( = ?auto_121888 ?auto_121891 ) ) ( not ( = ?auto_121888 ?auto_121892 ) ) ( not ( = ?auto_121889 ?auto_121890 ) ) ( not ( = ?auto_121889 ?auto_121891 ) ) ( not ( = ?auto_121889 ?auto_121892 ) ) ( not ( = ?auto_121890 ?auto_121891 ) ) ( not ( = ?auto_121890 ?auto_121892 ) ) ( not ( = ?auto_121891 ?auto_121892 ) ) ( ON ?auto_121891 ?auto_121892 ) ( ON ?auto_121890 ?auto_121891 ) ( ON ?auto_121889 ?auto_121890 ) ( ON ?auto_121888 ?auto_121889 ) ( ON ?auto_121887 ?auto_121888 ) ( ON ?auto_121886 ?auto_121887 ) ( ON ?auto_121885 ?auto_121886 ) ( ON ?auto_121884 ?auto_121885 ) ( ON ?auto_121883 ?auto_121884 ) ( ON ?auto_121882 ?auto_121883 ) ( CLEAR ?auto_121882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121882 )
      ( MAKE-11PILE ?auto_121882 ?auto_121883 ?auto_121884 ?auto_121885 ?auto_121886 ?auto_121887 ?auto_121888 ?auto_121889 ?auto_121890 ?auto_121891 ?auto_121892 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_121904 - BLOCK
      ?auto_121905 - BLOCK
      ?auto_121906 - BLOCK
      ?auto_121907 - BLOCK
      ?auto_121908 - BLOCK
      ?auto_121909 - BLOCK
      ?auto_121910 - BLOCK
      ?auto_121911 - BLOCK
      ?auto_121912 - BLOCK
      ?auto_121913 - BLOCK
      ?auto_121914 - BLOCK
    )
    :vars
    (
      ?auto_121915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121904 ?auto_121905 ) ) ( not ( = ?auto_121904 ?auto_121906 ) ) ( not ( = ?auto_121904 ?auto_121907 ) ) ( not ( = ?auto_121904 ?auto_121908 ) ) ( not ( = ?auto_121904 ?auto_121909 ) ) ( not ( = ?auto_121904 ?auto_121910 ) ) ( not ( = ?auto_121904 ?auto_121911 ) ) ( not ( = ?auto_121904 ?auto_121912 ) ) ( not ( = ?auto_121904 ?auto_121913 ) ) ( not ( = ?auto_121904 ?auto_121914 ) ) ( not ( = ?auto_121905 ?auto_121906 ) ) ( not ( = ?auto_121905 ?auto_121907 ) ) ( not ( = ?auto_121905 ?auto_121908 ) ) ( not ( = ?auto_121905 ?auto_121909 ) ) ( not ( = ?auto_121905 ?auto_121910 ) ) ( not ( = ?auto_121905 ?auto_121911 ) ) ( not ( = ?auto_121905 ?auto_121912 ) ) ( not ( = ?auto_121905 ?auto_121913 ) ) ( not ( = ?auto_121905 ?auto_121914 ) ) ( not ( = ?auto_121906 ?auto_121907 ) ) ( not ( = ?auto_121906 ?auto_121908 ) ) ( not ( = ?auto_121906 ?auto_121909 ) ) ( not ( = ?auto_121906 ?auto_121910 ) ) ( not ( = ?auto_121906 ?auto_121911 ) ) ( not ( = ?auto_121906 ?auto_121912 ) ) ( not ( = ?auto_121906 ?auto_121913 ) ) ( not ( = ?auto_121906 ?auto_121914 ) ) ( not ( = ?auto_121907 ?auto_121908 ) ) ( not ( = ?auto_121907 ?auto_121909 ) ) ( not ( = ?auto_121907 ?auto_121910 ) ) ( not ( = ?auto_121907 ?auto_121911 ) ) ( not ( = ?auto_121907 ?auto_121912 ) ) ( not ( = ?auto_121907 ?auto_121913 ) ) ( not ( = ?auto_121907 ?auto_121914 ) ) ( not ( = ?auto_121908 ?auto_121909 ) ) ( not ( = ?auto_121908 ?auto_121910 ) ) ( not ( = ?auto_121908 ?auto_121911 ) ) ( not ( = ?auto_121908 ?auto_121912 ) ) ( not ( = ?auto_121908 ?auto_121913 ) ) ( not ( = ?auto_121908 ?auto_121914 ) ) ( not ( = ?auto_121909 ?auto_121910 ) ) ( not ( = ?auto_121909 ?auto_121911 ) ) ( not ( = ?auto_121909 ?auto_121912 ) ) ( not ( = ?auto_121909 ?auto_121913 ) ) ( not ( = ?auto_121909 ?auto_121914 ) ) ( not ( = ?auto_121910 ?auto_121911 ) ) ( not ( = ?auto_121910 ?auto_121912 ) ) ( not ( = ?auto_121910 ?auto_121913 ) ) ( not ( = ?auto_121910 ?auto_121914 ) ) ( not ( = ?auto_121911 ?auto_121912 ) ) ( not ( = ?auto_121911 ?auto_121913 ) ) ( not ( = ?auto_121911 ?auto_121914 ) ) ( not ( = ?auto_121912 ?auto_121913 ) ) ( not ( = ?auto_121912 ?auto_121914 ) ) ( not ( = ?auto_121913 ?auto_121914 ) ) ( ON ?auto_121904 ?auto_121915 ) ( not ( = ?auto_121914 ?auto_121915 ) ) ( not ( = ?auto_121913 ?auto_121915 ) ) ( not ( = ?auto_121912 ?auto_121915 ) ) ( not ( = ?auto_121911 ?auto_121915 ) ) ( not ( = ?auto_121910 ?auto_121915 ) ) ( not ( = ?auto_121909 ?auto_121915 ) ) ( not ( = ?auto_121908 ?auto_121915 ) ) ( not ( = ?auto_121907 ?auto_121915 ) ) ( not ( = ?auto_121906 ?auto_121915 ) ) ( not ( = ?auto_121905 ?auto_121915 ) ) ( not ( = ?auto_121904 ?auto_121915 ) ) ( ON ?auto_121905 ?auto_121904 ) ( ON ?auto_121906 ?auto_121905 ) ( ON ?auto_121907 ?auto_121906 ) ( ON ?auto_121908 ?auto_121907 ) ( ON ?auto_121909 ?auto_121908 ) ( ON ?auto_121910 ?auto_121909 ) ( ON ?auto_121911 ?auto_121910 ) ( ON ?auto_121912 ?auto_121911 ) ( ON ?auto_121913 ?auto_121912 ) ( ON ?auto_121914 ?auto_121913 ) ( CLEAR ?auto_121914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_121914 ?auto_121913 ?auto_121912 ?auto_121911 ?auto_121910 ?auto_121909 ?auto_121908 ?auto_121907 ?auto_121906 ?auto_121905 ?auto_121904 )
      ( MAKE-11PILE ?auto_121904 ?auto_121905 ?auto_121906 ?auto_121907 ?auto_121908 ?auto_121909 ?auto_121910 ?auto_121911 ?auto_121912 ?auto_121913 ?auto_121914 ) )
  )

)

