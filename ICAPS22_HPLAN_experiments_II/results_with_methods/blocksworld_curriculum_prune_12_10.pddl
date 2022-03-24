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
      ?auto_177791 - BLOCK
    )
    :vars
    (
      ?auto_177792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177791 ?auto_177792 ) ( CLEAR ?auto_177791 ) ( HAND-EMPTY ) ( not ( = ?auto_177791 ?auto_177792 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177791 ?auto_177792 )
      ( !PUTDOWN ?auto_177791 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_177798 - BLOCK
      ?auto_177799 - BLOCK
    )
    :vars
    (
      ?auto_177800 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_177798 ) ( ON ?auto_177799 ?auto_177800 ) ( CLEAR ?auto_177799 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177798 ) ( not ( = ?auto_177798 ?auto_177799 ) ) ( not ( = ?auto_177798 ?auto_177800 ) ) ( not ( = ?auto_177799 ?auto_177800 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177799 ?auto_177800 )
      ( !STACK ?auto_177799 ?auto_177798 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_177808 - BLOCK
      ?auto_177809 - BLOCK
    )
    :vars
    (
      ?auto_177810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177809 ?auto_177810 ) ( not ( = ?auto_177808 ?auto_177809 ) ) ( not ( = ?auto_177808 ?auto_177810 ) ) ( not ( = ?auto_177809 ?auto_177810 ) ) ( ON ?auto_177808 ?auto_177809 ) ( CLEAR ?auto_177808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177808 )
      ( MAKE-2PILE ?auto_177808 ?auto_177809 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177819 - BLOCK
      ?auto_177820 - BLOCK
      ?auto_177821 - BLOCK
    )
    :vars
    (
      ?auto_177822 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_177820 ) ( ON ?auto_177821 ?auto_177822 ) ( CLEAR ?auto_177821 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177819 ) ( ON ?auto_177820 ?auto_177819 ) ( not ( = ?auto_177819 ?auto_177820 ) ) ( not ( = ?auto_177819 ?auto_177821 ) ) ( not ( = ?auto_177819 ?auto_177822 ) ) ( not ( = ?auto_177820 ?auto_177821 ) ) ( not ( = ?auto_177820 ?auto_177822 ) ) ( not ( = ?auto_177821 ?auto_177822 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177821 ?auto_177822 )
      ( !STACK ?auto_177821 ?auto_177820 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177833 - BLOCK
      ?auto_177834 - BLOCK
      ?auto_177835 - BLOCK
    )
    :vars
    (
      ?auto_177836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177835 ?auto_177836 ) ( ON-TABLE ?auto_177833 ) ( not ( = ?auto_177833 ?auto_177834 ) ) ( not ( = ?auto_177833 ?auto_177835 ) ) ( not ( = ?auto_177833 ?auto_177836 ) ) ( not ( = ?auto_177834 ?auto_177835 ) ) ( not ( = ?auto_177834 ?auto_177836 ) ) ( not ( = ?auto_177835 ?auto_177836 ) ) ( CLEAR ?auto_177833 ) ( ON ?auto_177834 ?auto_177835 ) ( CLEAR ?auto_177834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177833 ?auto_177834 )
      ( MAKE-3PILE ?auto_177833 ?auto_177834 ?auto_177835 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177847 - BLOCK
      ?auto_177848 - BLOCK
      ?auto_177849 - BLOCK
    )
    :vars
    (
      ?auto_177850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177849 ?auto_177850 ) ( not ( = ?auto_177847 ?auto_177848 ) ) ( not ( = ?auto_177847 ?auto_177849 ) ) ( not ( = ?auto_177847 ?auto_177850 ) ) ( not ( = ?auto_177848 ?auto_177849 ) ) ( not ( = ?auto_177848 ?auto_177850 ) ) ( not ( = ?auto_177849 ?auto_177850 ) ) ( ON ?auto_177848 ?auto_177849 ) ( ON ?auto_177847 ?auto_177848 ) ( CLEAR ?auto_177847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177847 )
      ( MAKE-3PILE ?auto_177847 ?auto_177848 ?auto_177849 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177862 - BLOCK
      ?auto_177863 - BLOCK
      ?auto_177864 - BLOCK
      ?auto_177865 - BLOCK
    )
    :vars
    (
      ?auto_177866 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_177864 ) ( ON ?auto_177865 ?auto_177866 ) ( CLEAR ?auto_177865 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177862 ) ( ON ?auto_177863 ?auto_177862 ) ( ON ?auto_177864 ?auto_177863 ) ( not ( = ?auto_177862 ?auto_177863 ) ) ( not ( = ?auto_177862 ?auto_177864 ) ) ( not ( = ?auto_177862 ?auto_177865 ) ) ( not ( = ?auto_177862 ?auto_177866 ) ) ( not ( = ?auto_177863 ?auto_177864 ) ) ( not ( = ?auto_177863 ?auto_177865 ) ) ( not ( = ?auto_177863 ?auto_177866 ) ) ( not ( = ?auto_177864 ?auto_177865 ) ) ( not ( = ?auto_177864 ?auto_177866 ) ) ( not ( = ?auto_177865 ?auto_177866 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177865 ?auto_177866 )
      ( !STACK ?auto_177865 ?auto_177864 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177880 - BLOCK
      ?auto_177881 - BLOCK
      ?auto_177882 - BLOCK
      ?auto_177883 - BLOCK
    )
    :vars
    (
      ?auto_177884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177883 ?auto_177884 ) ( ON-TABLE ?auto_177880 ) ( ON ?auto_177881 ?auto_177880 ) ( not ( = ?auto_177880 ?auto_177881 ) ) ( not ( = ?auto_177880 ?auto_177882 ) ) ( not ( = ?auto_177880 ?auto_177883 ) ) ( not ( = ?auto_177880 ?auto_177884 ) ) ( not ( = ?auto_177881 ?auto_177882 ) ) ( not ( = ?auto_177881 ?auto_177883 ) ) ( not ( = ?auto_177881 ?auto_177884 ) ) ( not ( = ?auto_177882 ?auto_177883 ) ) ( not ( = ?auto_177882 ?auto_177884 ) ) ( not ( = ?auto_177883 ?auto_177884 ) ) ( CLEAR ?auto_177881 ) ( ON ?auto_177882 ?auto_177883 ) ( CLEAR ?auto_177882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177880 ?auto_177881 ?auto_177882 )
      ( MAKE-4PILE ?auto_177880 ?auto_177881 ?auto_177882 ?auto_177883 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177898 - BLOCK
      ?auto_177899 - BLOCK
      ?auto_177900 - BLOCK
      ?auto_177901 - BLOCK
    )
    :vars
    (
      ?auto_177902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177901 ?auto_177902 ) ( ON-TABLE ?auto_177898 ) ( not ( = ?auto_177898 ?auto_177899 ) ) ( not ( = ?auto_177898 ?auto_177900 ) ) ( not ( = ?auto_177898 ?auto_177901 ) ) ( not ( = ?auto_177898 ?auto_177902 ) ) ( not ( = ?auto_177899 ?auto_177900 ) ) ( not ( = ?auto_177899 ?auto_177901 ) ) ( not ( = ?auto_177899 ?auto_177902 ) ) ( not ( = ?auto_177900 ?auto_177901 ) ) ( not ( = ?auto_177900 ?auto_177902 ) ) ( not ( = ?auto_177901 ?auto_177902 ) ) ( ON ?auto_177900 ?auto_177901 ) ( CLEAR ?auto_177898 ) ( ON ?auto_177899 ?auto_177900 ) ( CLEAR ?auto_177899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177898 ?auto_177899 )
      ( MAKE-4PILE ?auto_177898 ?auto_177899 ?auto_177900 ?auto_177901 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177916 - BLOCK
      ?auto_177917 - BLOCK
      ?auto_177918 - BLOCK
      ?auto_177919 - BLOCK
    )
    :vars
    (
      ?auto_177920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177919 ?auto_177920 ) ( not ( = ?auto_177916 ?auto_177917 ) ) ( not ( = ?auto_177916 ?auto_177918 ) ) ( not ( = ?auto_177916 ?auto_177919 ) ) ( not ( = ?auto_177916 ?auto_177920 ) ) ( not ( = ?auto_177917 ?auto_177918 ) ) ( not ( = ?auto_177917 ?auto_177919 ) ) ( not ( = ?auto_177917 ?auto_177920 ) ) ( not ( = ?auto_177918 ?auto_177919 ) ) ( not ( = ?auto_177918 ?auto_177920 ) ) ( not ( = ?auto_177919 ?auto_177920 ) ) ( ON ?auto_177918 ?auto_177919 ) ( ON ?auto_177917 ?auto_177918 ) ( ON ?auto_177916 ?auto_177917 ) ( CLEAR ?auto_177916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177916 )
      ( MAKE-4PILE ?auto_177916 ?auto_177917 ?auto_177918 ?auto_177919 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177935 - BLOCK
      ?auto_177936 - BLOCK
      ?auto_177937 - BLOCK
      ?auto_177938 - BLOCK
      ?auto_177939 - BLOCK
    )
    :vars
    (
      ?auto_177940 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_177938 ) ( ON ?auto_177939 ?auto_177940 ) ( CLEAR ?auto_177939 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177935 ) ( ON ?auto_177936 ?auto_177935 ) ( ON ?auto_177937 ?auto_177936 ) ( ON ?auto_177938 ?auto_177937 ) ( not ( = ?auto_177935 ?auto_177936 ) ) ( not ( = ?auto_177935 ?auto_177937 ) ) ( not ( = ?auto_177935 ?auto_177938 ) ) ( not ( = ?auto_177935 ?auto_177939 ) ) ( not ( = ?auto_177935 ?auto_177940 ) ) ( not ( = ?auto_177936 ?auto_177937 ) ) ( not ( = ?auto_177936 ?auto_177938 ) ) ( not ( = ?auto_177936 ?auto_177939 ) ) ( not ( = ?auto_177936 ?auto_177940 ) ) ( not ( = ?auto_177937 ?auto_177938 ) ) ( not ( = ?auto_177937 ?auto_177939 ) ) ( not ( = ?auto_177937 ?auto_177940 ) ) ( not ( = ?auto_177938 ?auto_177939 ) ) ( not ( = ?auto_177938 ?auto_177940 ) ) ( not ( = ?auto_177939 ?auto_177940 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177939 ?auto_177940 )
      ( !STACK ?auto_177939 ?auto_177938 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177957 - BLOCK
      ?auto_177958 - BLOCK
      ?auto_177959 - BLOCK
      ?auto_177960 - BLOCK
      ?auto_177961 - BLOCK
    )
    :vars
    (
      ?auto_177962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177961 ?auto_177962 ) ( ON-TABLE ?auto_177957 ) ( ON ?auto_177958 ?auto_177957 ) ( ON ?auto_177959 ?auto_177958 ) ( not ( = ?auto_177957 ?auto_177958 ) ) ( not ( = ?auto_177957 ?auto_177959 ) ) ( not ( = ?auto_177957 ?auto_177960 ) ) ( not ( = ?auto_177957 ?auto_177961 ) ) ( not ( = ?auto_177957 ?auto_177962 ) ) ( not ( = ?auto_177958 ?auto_177959 ) ) ( not ( = ?auto_177958 ?auto_177960 ) ) ( not ( = ?auto_177958 ?auto_177961 ) ) ( not ( = ?auto_177958 ?auto_177962 ) ) ( not ( = ?auto_177959 ?auto_177960 ) ) ( not ( = ?auto_177959 ?auto_177961 ) ) ( not ( = ?auto_177959 ?auto_177962 ) ) ( not ( = ?auto_177960 ?auto_177961 ) ) ( not ( = ?auto_177960 ?auto_177962 ) ) ( not ( = ?auto_177961 ?auto_177962 ) ) ( CLEAR ?auto_177959 ) ( ON ?auto_177960 ?auto_177961 ) ( CLEAR ?auto_177960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177957 ?auto_177958 ?auto_177959 ?auto_177960 )
      ( MAKE-5PILE ?auto_177957 ?auto_177958 ?auto_177959 ?auto_177960 ?auto_177961 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177979 - BLOCK
      ?auto_177980 - BLOCK
      ?auto_177981 - BLOCK
      ?auto_177982 - BLOCK
      ?auto_177983 - BLOCK
    )
    :vars
    (
      ?auto_177984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177983 ?auto_177984 ) ( ON-TABLE ?auto_177979 ) ( ON ?auto_177980 ?auto_177979 ) ( not ( = ?auto_177979 ?auto_177980 ) ) ( not ( = ?auto_177979 ?auto_177981 ) ) ( not ( = ?auto_177979 ?auto_177982 ) ) ( not ( = ?auto_177979 ?auto_177983 ) ) ( not ( = ?auto_177979 ?auto_177984 ) ) ( not ( = ?auto_177980 ?auto_177981 ) ) ( not ( = ?auto_177980 ?auto_177982 ) ) ( not ( = ?auto_177980 ?auto_177983 ) ) ( not ( = ?auto_177980 ?auto_177984 ) ) ( not ( = ?auto_177981 ?auto_177982 ) ) ( not ( = ?auto_177981 ?auto_177983 ) ) ( not ( = ?auto_177981 ?auto_177984 ) ) ( not ( = ?auto_177982 ?auto_177983 ) ) ( not ( = ?auto_177982 ?auto_177984 ) ) ( not ( = ?auto_177983 ?auto_177984 ) ) ( ON ?auto_177982 ?auto_177983 ) ( CLEAR ?auto_177980 ) ( ON ?auto_177981 ?auto_177982 ) ( CLEAR ?auto_177981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177979 ?auto_177980 ?auto_177981 )
      ( MAKE-5PILE ?auto_177979 ?auto_177980 ?auto_177981 ?auto_177982 ?auto_177983 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_178001 - BLOCK
      ?auto_178002 - BLOCK
      ?auto_178003 - BLOCK
      ?auto_178004 - BLOCK
      ?auto_178005 - BLOCK
    )
    :vars
    (
      ?auto_178006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178005 ?auto_178006 ) ( ON-TABLE ?auto_178001 ) ( not ( = ?auto_178001 ?auto_178002 ) ) ( not ( = ?auto_178001 ?auto_178003 ) ) ( not ( = ?auto_178001 ?auto_178004 ) ) ( not ( = ?auto_178001 ?auto_178005 ) ) ( not ( = ?auto_178001 ?auto_178006 ) ) ( not ( = ?auto_178002 ?auto_178003 ) ) ( not ( = ?auto_178002 ?auto_178004 ) ) ( not ( = ?auto_178002 ?auto_178005 ) ) ( not ( = ?auto_178002 ?auto_178006 ) ) ( not ( = ?auto_178003 ?auto_178004 ) ) ( not ( = ?auto_178003 ?auto_178005 ) ) ( not ( = ?auto_178003 ?auto_178006 ) ) ( not ( = ?auto_178004 ?auto_178005 ) ) ( not ( = ?auto_178004 ?auto_178006 ) ) ( not ( = ?auto_178005 ?auto_178006 ) ) ( ON ?auto_178004 ?auto_178005 ) ( ON ?auto_178003 ?auto_178004 ) ( CLEAR ?auto_178001 ) ( ON ?auto_178002 ?auto_178003 ) ( CLEAR ?auto_178002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178001 ?auto_178002 )
      ( MAKE-5PILE ?auto_178001 ?auto_178002 ?auto_178003 ?auto_178004 ?auto_178005 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_178023 - BLOCK
      ?auto_178024 - BLOCK
      ?auto_178025 - BLOCK
      ?auto_178026 - BLOCK
      ?auto_178027 - BLOCK
    )
    :vars
    (
      ?auto_178028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178027 ?auto_178028 ) ( not ( = ?auto_178023 ?auto_178024 ) ) ( not ( = ?auto_178023 ?auto_178025 ) ) ( not ( = ?auto_178023 ?auto_178026 ) ) ( not ( = ?auto_178023 ?auto_178027 ) ) ( not ( = ?auto_178023 ?auto_178028 ) ) ( not ( = ?auto_178024 ?auto_178025 ) ) ( not ( = ?auto_178024 ?auto_178026 ) ) ( not ( = ?auto_178024 ?auto_178027 ) ) ( not ( = ?auto_178024 ?auto_178028 ) ) ( not ( = ?auto_178025 ?auto_178026 ) ) ( not ( = ?auto_178025 ?auto_178027 ) ) ( not ( = ?auto_178025 ?auto_178028 ) ) ( not ( = ?auto_178026 ?auto_178027 ) ) ( not ( = ?auto_178026 ?auto_178028 ) ) ( not ( = ?auto_178027 ?auto_178028 ) ) ( ON ?auto_178026 ?auto_178027 ) ( ON ?auto_178025 ?auto_178026 ) ( ON ?auto_178024 ?auto_178025 ) ( ON ?auto_178023 ?auto_178024 ) ( CLEAR ?auto_178023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_178023 )
      ( MAKE-5PILE ?auto_178023 ?auto_178024 ?auto_178025 ?auto_178026 ?auto_178027 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178046 - BLOCK
      ?auto_178047 - BLOCK
      ?auto_178048 - BLOCK
      ?auto_178049 - BLOCK
      ?auto_178050 - BLOCK
      ?auto_178051 - BLOCK
    )
    :vars
    (
      ?auto_178052 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_178050 ) ( ON ?auto_178051 ?auto_178052 ) ( CLEAR ?auto_178051 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_178046 ) ( ON ?auto_178047 ?auto_178046 ) ( ON ?auto_178048 ?auto_178047 ) ( ON ?auto_178049 ?auto_178048 ) ( ON ?auto_178050 ?auto_178049 ) ( not ( = ?auto_178046 ?auto_178047 ) ) ( not ( = ?auto_178046 ?auto_178048 ) ) ( not ( = ?auto_178046 ?auto_178049 ) ) ( not ( = ?auto_178046 ?auto_178050 ) ) ( not ( = ?auto_178046 ?auto_178051 ) ) ( not ( = ?auto_178046 ?auto_178052 ) ) ( not ( = ?auto_178047 ?auto_178048 ) ) ( not ( = ?auto_178047 ?auto_178049 ) ) ( not ( = ?auto_178047 ?auto_178050 ) ) ( not ( = ?auto_178047 ?auto_178051 ) ) ( not ( = ?auto_178047 ?auto_178052 ) ) ( not ( = ?auto_178048 ?auto_178049 ) ) ( not ( = ?auto_178048 ?auto_178050 ) ) ( not ( = ?auto_178048 ?auto_178051 ) ) ( not ( = ?auto_178048 ?auto_178052 ) ) ( not ( = ?auto_178049 ?auto_178050 ) ) ( not ( = ?auto_178049 ?auto_178051 ) ) ( not ( = ?auto_178049 ?auto_178052 ) ) ( not ( = ?auto_178050 ?auto_178051 ) ) ( not ( = ?auto_178050 ?auto_178052 ) ) ( not ( = ?auto_178051 ?auto_178052 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_178051 ?auto_178052 )
      ( !STACK ?auto_178051 ?auto_178050 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178072 - BLOCK
      ?auto_178073 - BLOCK
      ?auto_178074 - BLOCK
      ?auto_178075 - BLOCK
      ?auto_178076 - BLOCK
      ?auto_178077 - BLOCK
    )
    :vars
    (
      ?auto_178078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178077 ?auto_178078 ) ( ON-TABLE ?auto_178072 ) ( ON ?auto_178073 ?auto_178072 ) ( ON ?auto_178074 ?auto_178073 ) ( ON ?auto_178075 ?auto_178074 ) ( not ( = ?auto_178072 ?auto_178073 ) ) ( not ( = ?auto_178072 ?auto_178074 ) ) ( not ( = ?auto_178072 ?auto_178075 ) ) ( not ( = ?auto_178072 ?auto_178076 ) ) ( not ( = ?auto_178072 ?auto_178077 ) ) ( not ( = ?auto_178072 ?auto_178078 ) ) ( not ( = ?auto_178073 ?auto_178074 ) ) ( not ( = ?auto_178073 ?auto_178075 ) ) ( not ( = ?auto_178073 ?auto_178076 ) ) ( not ( = ?auto_178073 ?auto_178077 ) ) ( not ( = ?auto_178073 ?auto_178078 ) ) ( not ( = ?auto_178074 ?auto_178075 ) ) ( not ( = ?auto_178074 ?auto_178076 ) ) ( not ( = ?auto_178074 ?auto_178077 ) ) ( not ( = ?auto_178074 ?auto_178078 ) ) ( not ( = ?auto_178075 ?auto_178076 ) ) ( not ( = ?auto_178075 ?auto_178077 ) ) ( not ( = ?auto_178075 ?auto_178078 ) ) ( not ( = ?auto_178076 ?auto_178077 ) ) ( not ( = ?auto_178076 ?auto_178078 ) ) ( not ( = ?auto_178077 ?auto_178078 ) ) ( CLEAR ?auto_178075 ) ( ON ?auto_178076 ?auto_178077 ) ( CLEAR ?auto_178076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178072 ?auto_178073 ?auto_178074 ?auto_178075 ?auto_178076 )
      ( MAKE-6PILE ?auto_178072 ?auto_178073 ?auto_178074 ?auto_178075 ?auto_178076 ?auto_178077 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178098 - BLOCK
      ?auto_178099 - BLOCK
      ?auto_178100 - BLOCK
      ?auto_178101 - BLOCK
      ?auto_178102 - BLOCK
      ?auto_178103 - BLOCK
    )
    :vars
    (
      ?auto_178104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178103 ?auto_178104 ) ( ON-TABLE ?auto_178098 ) ( ON ?auto_178099 ?auto_178098 ) ( ON ?auto_178100 ?auto_178099 ) ( not ( = ?auto_178098 ?auto_178099 ) ) ( not ( = ?auto_178098 ?auto_178100 ) ) ( not ( = ?auto_178098 ?auto_178101 ) ) ( not ( = ?auto_178098 ?auto_178102 ) ) ( not ( = ?auto_178098 ?auto_178103 ) ) ( not ( = ?auto_178098 ?auto_178104 ) ) ( not ( = ?auto_178099 ?auto_178100 ) ) ( not ( = ?auto_178099 ?auto_178101 ) ) ( not ( = ?auto_178099 ?auto_178102 ) ) ( not ( = ?auto_178099 ?auto_178103 ) ) ( not ( = ?auto_178099 ?auto_178104 ) ) ( not ( = ?auto_178100 ?auto_178101 ) ) ( not ( = ?auto_178100 ?auto_178102 ) ) ( not ( = ?auto_178100 ?auto_178103 ) ) ( not ( = ?auto_178100 ?auto_178104 ) ) ( not ( = ?auto_178101 ?auto_178102 ) ) ( not ( = ?auto_178101 ?auto_178103 ) ) ( not ( = ?auto_178101 ?auto_178104 ) ) ( not ( = ?auto_178102 ?auto_178103 ) ) ( not ( = ?auto_178102 ?auto_178104 ) ) ( not ( = ?auto_178103 ?auto_178104 ) ) ( ON ?auto_178102 ?auto_178103 ) ( CLEAR ?auto_178100 ) ( ON ?auto_178101 ?auto_178102 ) ( CLEAR ?auto_178101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178098 ?auto_178099 ?auto_178100 ?auto_178101 )
      ( MAKE-6PILE ?auto_178098 ?auto_178099 ?auto_178100 ?auto_178101 ?auto_178102 ?auto_178103 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178124 - BLOCK
      ?auto_178125 - BLOCK
      ?auto_178126 - BLOCK
      ?auto_178127 - BLOCK
      ?auto_178128 - BLOCK
      ?auto_178129 - BLOCK
    )
    :vars
    (
      ?auto_178130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178129 ?auto_178130 ) ( ON-TABLE ?auto_178124 ) ( ON ?auto_178125 ?auto_178124 ) ( not ( = ?auto_178124 ?auto_178125 ) ) ( not ( = ?auto_178124 ?auto_178126 ) ) ( not ( = ?auto_178124 ?auto_178127 ) ) ( not ( = ?auto_178124 ?auto_178128 ) ) ( not ( = ?auto_178124 ?auto_178129 ) ) ( not ( = ?auto_178124 ?auto_178130 ) ) ( not ( = ?auto_178125 ?auto_178126 ) ) ( not ( = ?auto_178125 ?auto_178127 ) ) ( not ( = ?auto_178125 ?auto_178128 ) ) ( not ( = ?auto_178125 ?auto_178129 ) ) ( not ( = ?auto_178125 ?auto_178130 ) ) ( not ( = ?auto_178126 ?auto_178127 ) ) ( not ( = ?auto_178126 ?auto_178128 ) ) ( not ( = ?auto_178126 ?auto_178129 ) ) ( not ( = ?auto_178126 ?auto_178130 ) ) ( not ( = ?auto_178127 ?auto_178128 ) ) ( not ( = ?auto_178127 ?auto_178129 ) ) ( not ( = ?auto_178127 ?auto_178130 ) ) ( not ( = ?auto_178128 ?auto_178129 ) ) ( not ( = ?auto_178128 ?auto_178130 ) ) ( not ( = ?auto_178129 ?auto_178130 ) ) ( ON ?auto_178128 ?auto_178129 ) ( ON ?auto_178127 ?auto_178128 ) ( CLEAR ?auto_178125 ) ( ON ?auto_178126 ?auto_178127 ) ( CLEAR ?auto_178126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178124 ?auto_178125 ?auto_178126 )
      ( MAKE-6PILE ?auto_178124 ?auto_178125 ?auto_178126 ?auto_178127 ?auto_178128 ?auto_178129 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178150 - BLOCK
      ?auto_178151 - BLOCK
      ?auto_178152 - BLOCK
      ?auto_178153 - BLOCK
      ?auto_178154 - BLOCK
      ?auto_178155 - BLOCK
    )
    :vars
    (
      ?auto_178156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178155 ?auto_178156 ) ( ON-TABLE ?auto_178150 ) ( not ( = ?auto_178150 ?auto_178151 ) ) ( not ( = ?auto_178150 ?auto_178152 ) ) ( not ( = ?auto_178150 ?auto_178153 ) ) ( not ( = ?auto_178150 ?auto_178154 ) ) ( not ( = ?auto_178150 ?auto_178155 ) ) ( not ( = ?auto_178150 ?auto_178156 ) ) ( not ( = ?auto_178151 ?auto_178152 ) ) ( not ( = ?auto_178151 ?auto_178153 ) ) ( not ( = ?auto_178151 ?auto_178154 ) ) ( not ( = ?auto_178151 ?auto_178155 ) ) ( not ( = ?auto_178151 ?auto_178156 ) ) ( not ( = ?auto_178152 ?auto_178153 ) ) ( not ( = ?auto_178152 ?auto_178154 ) ) ( not ( = ?auto_178152 ?auto_178155 ) ) ( not ( = ?auto_178152 ?auto_178156 ) ) ( not ( = ?auto_178153 ?auto_178154 ) ) ( not ( = ?auto_178153 ?auto_178155 ) ) ( not ( = ?auto_178153 ?auto_178156 ) ) ( not ( = ?auto_178154 ?auto_178155 ) ) ( not ( = ?auto_178154 ?auto_178156 ) ) ( not ( = ?auto_178155 ?auto_178156 ) ) ( ON ?auto_178154 ?auto_178155 ) ( ON ?auto_178153 ?auto_178154 ) ( ON ?auto_178152 ?auto_178153 ) ( CLEAR ?auto_178150 ) ( ON ?auto_178151 ?auto_178152 ) ( CLEAR ?auto_178151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178150 ?auto_178151 )
      ( MAKE-6PILE ?auto_178150 ?auto_178151 ?auto_178152 ?auto_178153 ?auto_178154 ?auto_178155 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178176 - BLOCK
      ?auto_178177 - BLOCK
      ?auto_178178 - BLOCK
      ?auto_178179 - BLOCK
      ?auto_178180 - BLOCK
      ?auto_178181 - BLOCK
    )
    :vars
    (
      ?auto_178182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178181 ?auto_178182 ) ( not ( = ?auto_178176 ?auto_178177 ) ) ( not ( = ?auto_178176 ?auto_178178 ) ) ( not ( = ?auto_178176 ?auto_178179 ) ) ( not ( = ?auto_178176 ?auto_178180 ) ) ( not ( = ?auto_178176 ?auto_178181 ) ) ( not ( = ?auto_178176 ?auto_178182 ) ) ( not ( = ?auto_178177 ?auto_178178 ) ) ( not ( = ?auto_178177 ?auto_178179 ) ) ( not ( = ?auto_178177 ?auto_178180 ) ) ( not ( = ?auto_178177 ?auto_178181 ) ) ( not ( = ?auto_178177 ?auto_178182 ) ) ( not ( = ?auto_178178 ?auto_178179 ) ) ( not ( = ?auto_178178 ?auto_178180 ) ) ( not ( = ?auto_178178 ?auto_178181 ) ) ( not ( = ?auto_178178 ?auto_178182 ) ) ( not ( = ?auto_178179 ?auto_178180 ) ) ( not ( = ?auto_178179 ?auto_178181 ) ) ( not ( = ?auto_178179 ?auto_178182 ) ) ( not ( = ?auto_178180 ?auto_178181 ) ) ( not ( = ?auto_178180 ?auto_178182 ) ) ( not ( = ?auto_178181 ?auto_178182 ) ) ( ON ?auto_178180 ?auto_178181 ) ( ON ?auto_178179 ?auto_178180 ) ( ON ?auto_178178 ?auto_178179 ) ( ON ?auto_178177 ?auto_178178 ) ( ON ?auto_178176 ?auto_178177 ) ( CLEAR ?auto_178176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_178176 )
      ( MAKE-6PILE ?auto_178176 ?auto_178177 ?auto_178178 ?auto_178179 ?auto_178180 ?auto_178181 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178203 - BLOCK
      ?auto_178204 - BLOCK
      ?auto_178205 - BLOCK
      ?auto_178206 - BLOCK
      ?auto_178207 - BLOCK
      ?auto_178208 - BLOCK
      ?auto_178209 - BLOCK
    )
    :vars
    (
      ?auto_178210 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_178208 ) ( ON ?auto_178209 ?auto_178210 ) ( CLEAR ?auto_178209 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_178203 ) ( ON ?auto_178204 ?auto_178203 ) ( ON ?auto_178205 ?auto_178204 ) ( ON ?auto_178206 ?auto_178205 ) ( ON ?auto_178207 ?auto_178206 ) ( ON ?auto_178208 ?auto_178207 ) ( not ( = ?auto_178203 ?auto_178204 ) ) ( not ( = ?auto_178203 ?auto_178205 ) ) ( not ( = ?auto_178203 ?auto_178206 ) ) ( not ( = ?auto_178203 ?auto_178207 ) ) ( not ( = ?auto_178203 ?auto_178208 ) ) ( not ( = ?auto_178203 ?auto_178209 ) ) ( not ( = ?auto_178203 ?auto_178210 ) ) ( not ( = ?auto_178204 ?auto_178205 ) ) ( not ( = ?auto_178204 ?auto_178206 ) ) ( not ( = ?auto_178204 ?auto_178207 ) ) ( not ( = ?auto_178204 ?auto_178208 ) ) ( not ( = ?auto_178204 ?auto_178209 ) ) ( not ( = ?auto_178204 ?auto_178210 ) ) ( not ( = ?auto_178205 ?auto_178206 ) ) ( not ( = ?auto_178205 ?auto_178207 ) ) ( not ( = ?auto_178205 ?auto_178208 ) ) ( not ( = ?auto_178205 ?auto_178209 ) ) ( not ( = ?auto_178205 ?auto_178210 ) ) ( not ( = ?auto_178206 ?auto_178207 ) ) ( not ( = ?auto_178206 ?auto_178208 ) ) ( not ( = ?auto_178206 ?auto_178209 ) ) ( not ( = ?auto_178206 ?auto_178210 ) ) ( not ( = ?auto_178207 ?auto_178208 ) ) ( not ( = ?auto_178207 ?auto_178209 ) ) ( not ( = ?auto_178207 ?auto_178210 ) ) ( not ( = ?auto_178208 ?auto_178209 ) ) ( not ( = ?auto_178208 ?auto_178210 ) ) ( not ( = ?auto_178209 ?auto_178210 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_178209 ?auto_178210 )
      ( !STACK ?auto_178209 ?auto_178208 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178233 - BLOCK
      ?auto_178234 - BLOCK
      ?auto_178235 - BLOCK
      ?auto_178236 - BLOCK
      ?auto_178237 - BLOCK
      ?auto_178238 - BLOCK
      ?auto_178239 - BLOCK
    )
    :vars
    (
      ?auto_178240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178239 ?auto_178240 ) ( ON-TABLE ?auto_178233 ) ( ON ?auto_178234 ?auto_178233 ) ( ON ?auto_178235 ?auto_178234 ) ( ON ?auto_178236 ?auto_178235 ) ( ON ?auto_178237 ?auto_178236 ) ( not ( = ?auto_178233 ?auto_178234 ) ) ( not ( = ?auto_178233 ?auto_178235 ) ) ( not ( = ?auto_178233 ?auto_178236 ) ) ( not ( = ?auto_178233 ?auto_178237 ) ) ( not ( = ?auto_178233 ?auto_178238 ) ) ( not ( = ?auto_178233 ?auto_178239 ) ) ( not ( = ?auto_178233 ?auto_178240 ) ) ( not ( = ?auto_178234 ?auto_178235 ) ) ( not ( = ?auto_178234 ?auto_178236 ) ) ( not ( = ?auto_178234 ?auto_178237 ) ) ( not ( = ?auto_178234 ?auto_178238 ) ) ( not ( = ?auto_178234 ?auto_178239 ) ) ( not ( = ?auto_178234 ?auto_178240 ) ) ( not ( = ?auto_178235 ?auto_178236 ) ) ( not ( = ?auto_178235 ?auto_178237 ) ) ( not ( = ?auto_178235 ?auto_178238 ) ) ( not ( = ?auto_178235 ?auto_178239 ) ) ( not ( = ?auto_178235 ?auto_178240 ) ) ( not ( = ?auto_178236 ?auto_178237 ) ) ( not ( = ?auto_178236 ?auto_178238 ) ) ( not ( = ?auto_178236 ?auto_178239 ) ) ( not ( = ?auto_178236 ?auto_178240 ) ) ( not ( = ?auto_178237 ?auto_178238 ) ) ( not ( = ?auto_178237 ?auto_178239 ) ) ( not ( = ?auto_178237 ?auto_178240 ) ) ( not ( = ?auto_178238 ?auto_178239 ) ) ( not ( = ?auto_178238 ?auto_178240 ) ) ( not ( = ?auto_178239 ?auto_178240 ) ) ( CLEAR ?auto_178237 ) ( ON ?auto_178238 ?auto_178239 ) ( CLEAR ?auto_178238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_178233 ?auto_178234 ?auto_178235 ?auto_178236 ?auto_178237 ?auto_178238 )
      ( MAKE-7PILE ?auto_178233 ?auto_178234 ?auto_178235 ?auto_178236 ?auto_178237 ?auto_178238 ?auto_178239 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178263 - BLOCK
      ?auto_178264 - BLOCK
      ?auto_178265 - BLOCK
      ?auto_178266 - BLOCK
      ?auto_178267 - BLOCK
      ?auto_178268 - BLOCK
      ?auto_178269 - BLOCK
    )
    :vars
    (
      ?auto_178270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178269 ?auto_178270 ) ( ON-TABLE ?auto_178263 ) ( ON ?auto_178264 ?auto_178263 ) ( ON ?auto_178265 ?auto_178264 ) ( ON ?auto_178266 ?auto_178265 ) ( not ( = ?auto_178263 ?auto_178264 ) ) ( not ( = ?auto_178263 ?auto_178265 ) ) ( not ( = ?auto_178263 ?auto_178266 ) ) ( not ( = ?auto_178263 ?auto_178267 ) ) ( not ( = ?auto_178263 ?auto_178268 ) ) ( not ( = ?auto_178263 ?auto_178269 ) ) ( not ( = ?auto_178263 ?auto_178270 ) ) ( not ( = ?auto_178264 ?auto_178265 ) ) ( not ( = ?auto_178264 ?auto_178266 ) ) ( not ( = ?auto_178264 ?auto_178267 ) ) ( not ( = ?auto_178264 ?auto_178268 ) ) ( not ( = ?auto_178264 ?auto_178269 ) ) ( not ( = ?auto_178264 ?auto_178270 ) ) ( not ( = ?auto_178265 ?auto_178266 ) ) ( not ( = ?auto_178265 ?auto_178267 ) ) ( not ( = ?auto_178265 ?auto_178268 ) ) ( not ( = ?auto_178265 ?auto_178269 ) ) ( not ( = ?auto_178265 ?auto_178270 ) ) ( not ( = ?auto_178266 ?auto_178267 ) ) ( not ( = ?auto_178266 ?auto_178268 ) ) ( not ( = ?auto_178266 ?auto_178269 ) ) ( not ( = ?auto_178266 ?auto_178270 ) ) ( not ( = ?auto_178267 ?auto_178268 ) ) ( not ( = ?auto_178267 ?auto_178269 ) ) ( not ( = ?auto_178267 ?auto_178270 ) ) ( not ( = ?auto_178268 ?auto_178269 ) ) ( not ( = ?auto_178268 ?auto_178270 ) ) ( not ( = ?auto_178269 ?auto_178270 ) ) ( ON ?auto_178268 ?auto_178269 ) ( CLEAR ?auto_178266 ) ( ON ?auto_178267 ?auto_178268 ) ( CLEAR ?auto_178267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178263 ?auto_178264 ?auto_178265 ?auto_178266 ?auto_178267 )
      ( MAKE-7PILE ?auto_178263 ?auto_178264 ?auto_178265 ?auto_178266 ?auto_178267 ?auto_178268 ?auto_178269 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178293 - BLOCK
      ?auto_178294 - BLOCK
      ?auto_178295 - BLOCK
      ?auto_178296 - BLOCK
      ?auto_178297 - BLOCK
      ?auto_178298 - BLOCK
      ?auto_178299 - BLOCK
    )
    :vars
    (
      ?auto_178300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178299 ?auto_178300 ) ( ON-TABLE ?auto_178293 ) ( ON ?auto_178294 ?auto_178293 ) ( ON ?auto_178295 ?auto_178294 ) ( not ( = ?auto_178293 ?auto_178294 ) ) ( not ( = ?auto_178293 ?auto_178295 ) ) ( not ( = ?auto_178293 ?auto_178296 ) ) ( not ( = ?auto_178293 ?auto_178297 ) ) ( not ( = ?auto_178293 ?auto_178298 ) ) ( not ( = ?auto_178293 ?auto_178299 ) ) ( not ( = ?auto_178293 ?auto_178300 ) ) ( not ( = ?auto_178294 ?auto_178295 ) ) ( not ( = ?auto_178294 ?auto_178296 ) ) ( not ( = ?auto_178294 ?auto_178297 ) ) ( not ( = ?auto_178294 ?auto_178298 ) ) ( not ( = ?auto_178294 ?auto_178299 ) ) ( not ( = ?auto_178294 ?auto_178300 ) ) ( not ( = ?auto_178295 ?auto_178296 ) ) ( not ( = ?auto_178295 ?auto_178297 ) ) ( not ( = ?auto_178295 ?auto_178298 ) ) ( not ( = ?auto_178295 ?auto_178299 ) ) ( not ( = ?auto_178295 ?auto_178300 ) ) ( not ( = ?auto_178296 ?auto_178297 ) ) ( not ( = ?auto_178296 ?auto_178298 ) ) ( not ( = ?auto_178296 ?auto_178299 ) ) ( not ( = ?auto_178296 ?auto_178300 ) ) ( not ( = ?auto_178297 ?auto_178298 ) ) ( not ( = ?auto_178297 ?auto_178299 ) ) ( not ( = ?auto_178297 ?auto_178300 ) ) ( not ( = ?auto_178298 ?auto_178299 ) ) ( not ( = ?auto_178298 ?auto_178300 ) ) ( not ( = ?auto_178299 ?auto_178300 ) ) ( ON ?auto_178298 ?auto_178299 ) ( ON ?auto_178297 ?auto_178298 ) ( CLEAR ?auto_178295 ) ( ON ?auto_178296 ?auto_178297 ) ( CLEAR ?auto_178296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178293 ?auto_178294 ?auto_178295 ?auto_178296 )
      ( MAKE-7PILE ?auto_178293 ?auto_178294 ?auto_178295 ?auto_178296 ?auto_178297 ?auto_178298 ?auto_178299 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178323 - BLOCK
      ?auto_178324 - BLOCK
      ?auto_178325 - BLOCK
      ?auto_178326 - BLOCK
      ?auto_178327 - BLOCK
      ?auto_178328 - BLOCK
      ?auto_178329 - BLOCK
    )
    :vars
    (
      ?auto_178330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178329 ?auto_178330 ) ( ON-TABLE ?auto_178323 ) ( ON ?auto_178324 ?auto_178323 ) ( not ( = ?auto_178323 ?auto_178324 ) ) ( not ( = ?auto_178323 ?auto_178325 ) ) ( not ( = ?auto_178323 ?auto_178326 ) ) ( not ( = ?auto_178323 ?auto_178327 ) ) ( not ( = ?auto_178323 ?auto_178328 ) ) ( not ( = ?auto_178323 ?auto_178329 ) ) ( not ( = ?auto_178323 ?auto_178330 ) ) ( not ( = ?auto_178324 ?auto_178325 ) ) ( not ( = ?auto_178324 ?auto_178326 ) ) ( not ( = ?auto_178324 ?auto_178327 ) ) ( not ( = ?auto_178324 ?auto_178328 ) ) ( not ( = ?auto_178324 ?auto_178329 ) ) ( not ( = ?auto_178324 ?auto_178330 ) ) ( not ( = ?auto_178325 ?auto_178326 ) ) ( not ( = ?auto_178325 ?auto_178327 ) ) ( not ( = ?auto_178325 ?auto_178328 ) ) ( not ( = ?auto_178325 ?auto_178329 ) ) ( not ( = ?auto_178325 ?auto_178330 ) ) ( not ( = ?auto_178326 ?auto_178327 ) ) ( not ( = ?auto_178326 ?auto_178328 ) ) ( not ( = ?auto_178326 ?auto_178329 ) ) ( not ( = ?auto_178326 ?auto_178330 ) ) ( not ( = ?auto_178327 ?auto_178328 ) ) ( not ( = ?auto_178327 ?auto_178329 ) ) ( not ( = ?auto_178327 ?auto_178330 ) ) ( not ( = ?auto_178328 ?auto_178329 ) ) ( not ( = ?auto_178328 ?auto_178330 ) ) ( not ( = ?auto_178329 ?auto_178330 ) ) ( ON ?auto_178328 ?auto_178329 ) ( ON ?auto_178327 ?auto_178328 ) ( ON ?auto_178326 ?auto_178327 ) ( CLEAR ?auto_178324 ) ( ON ?auto_178325 ?auto_178326 ) ( CLEAR ?auto_178325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178323 ?auto_178324 ?auto_178325 )
      ( MAKE-7PILE ?auto_178323 ?auto_178324 ?auto_178325 ?auto_178326 ?auto_178327 ?auto_178328 ?auto_178329 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178353 - BLOCK
      ?auto_178354 - BLOCK
      ?auto_178355 - BLOCK
      ?auto_178356 - BLOCK
      ?auto_178357 - BLOCK
      ?auto_178358 - BLOCK
      ?auto_178359 - BLOCK
    )
    :vars
    (
      ?auto_178360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178359 ?auto_178360 ) ( ON-TABLE ?auto_178353 ) ( not ( = ?auto_178353 ?auto_178354 ) ) ( not ( = ?auto_178353 ?auto_178355 ) ) ( not ( = ?auto_178353 ?auto_178356 ) ) ( not ( = ?auto_178353 ?auto_178357 ) ) ( not ( = ?auto_178353 ?auto_178358 ) ) ( not ( = ?auto_178353 ?auto_178359 ) ) ( not ( = ?auto_178353 ?auto_178360 ) ) ( not ( = ?auto_178354 ?auto_178355 ) ) ( not ( = ?auto_178354 ?auto_178356 ) ) ( not ( = ?auto_178354 ?auto_178357 ) ) ( not ( = ?auto_178354 ?auto_178358 ) ) ( not ( = ?auto_178354 ?auto_178359 ) ) ( not ( = ?auto_178354 ?auto_178360 ) ) ( not ( = ?auto_178355 ?auto_178356 ) ) ( not ( = ?auto_178355 ?auto_178357 ) ) ( not ( = ?auto_178355 ?auto_178358 ) ) ( not ( = ?auto_178355 ?auto_178359 ) ) ( not ( = ?auto_178355 ?auto_178360 ) ) ( not ( = ?auto_178356 ?auto_178357 ) ) ( not ( = ?auto_178356 ?auto_178358 ) ) ( not ( = ?auto_178356 ?auto_178359 ) ) ( not ( = ?auto_178356 ?auto_178360 ) ) ( not ( = ?auto_178357 ?auto_178358 ) ) ( not ( = ?auto_178357 ?auto_178359 ) ) ( not ( = ?auto_178357 ?auto_178360 ) ) ( not ( = ?auto_178358 ?auto_178359 ) ) ( not ( = ?auto_178358 ?auto_178360 ) ) ( not ( = ?auto_178359 ?auto_178360 ) ) ( ON ?auto_178358 ?auto_178359 ) ( ON ?auto_178357 ?auto_178358 ) ( ON ?auto_178356 ?auto_178357 ) ( ON ?auto_178355 ?auto_178356 ) ( CLEAR ?auto_178353 ) ( ON ?auto_178354 ?auto_178355 ) ( CLEAR ?auto_178354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178353 ?auto_178354 )
      ( MAKE-7PILE ?auto_178353 ?auto_178354 ?auto_178355 ?auto_178356 ?auto_178357 ?auto_178358 ?auto_178359 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178383 - BLOCK
      ?auto_178384 - BLOCK
      ?auto_178385 - BLOCK
      ?auto_178386 - BLOCK
      ?auto_178387 - BLOCK
      ?auto_178388 - BLOCK
      ?auto_178389 - BLOCK
    )
    :vars
    (
      ?auto_178390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178389 ?auto_178390 ) ( not ( = ?auto_178383 ?auto_178384 ) ) ( not ( = ?auto_178383 ?auto_178385 ) ) ( not ( = ?auto_178383 ?auto_178386 ) ) ( not ( = ?auto_178383 ?auto_178387 ) ) ( not ( = ?auto_178383 ?auto_178388 ) ) ( not ( = ?auto_178383 ?auto_178389 ) ) ( not ( = ?auto_178383 ?auto_178390 ) ) ( not ( = ?auto_178384 ?auto_178385 ) ) ( not ( = ?auto_178384 ?auto_178386 ) ) ( not ( = ?auto_178384 ?auto_178387 ) ) ( not ( = ?auto_178384 ?auto_178388 ) ) ( not ( = ?auto_178384 ?auto_178389 ) ) ( not ( = ?auto_178384 ?auto_178390 ) ) ( not ( = ?auto_178385 ?auto_178386 ) ) ( not ( = ?auto_178385 ?auto_178387 ) ) ( not ( = ?auto_178385 ?auto_178388 ) ) ( not ( = ?auto_178385 ?auto_178389 ) ) ( not ( = ?auto_178385 ?auto_178390 ) ) ( not ( = ?auto_178386 ?auto_178387 ) ) ( not ( = ?auto_178386 ?auto_178388 ) ) ( not ( = ?auto_178386 ?auto_178389 ) ) ( not ( = ?auto_178386 ?auto_178390 ) ) ( not ( = ?auto_178387 ?auto_178388 ) ) ( not ( = ?auto_178387 ?auto_178389 ) ) ( not ( = ?auto_178387 ?auto_178390 ) ) ( not ( = ?auto_178388 ?auto_178389 ) ) ( not ( = ?auto_178388 ?auto_178390 ) ) ( not ( = ?auto_178389 ?auto_178390 ) ) ( ON ?auto_178388 ?auto_178389 ) ( ON ?auto_178387 ?auto_178388 ) ( ON ?auto_178386 ?auto_178387 ) ( ON ?auto_178385 ?auto_178386 ) ( ON ?auto_178384 ?auto_178385 ) ( ON ?auto_178383 ?auto_178384 ) ( CLEAR ?auto_178383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_178383 )
      ( MAKE-7PILE ?auto_178383 ?auto_178384 ?auto_178385 ?auto_178386 ?auto_178387 ?auto_178388 ?auto_178389 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_178414 - BLOCK
      ?auto_178415 - BLOCK
      ?auto_178416 - BLOCK
      ?auto_178417 - BLOCK
      ?auto_178418 - BLOCK
      ?auto_178419 - BLOCK
      ?auto_178420 - BLOCK
      ?auto_178421 - BLOCK
    )
    :vars
    (
      ?auto_178422 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_178420 ) ( ON ?auto_178421 ?auto_178422 ) ( CLEAR ?auto_178421 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_178414 ) ( ON ?auto_178415 ?auto_178414 ) ( ON ?auto_178416 ?auto_178415 ) ( ON ?auto_178417 ?auto_178416 ) ( ON ?auto_178418 ?auto_178417 ) ( ON ?auto_178419 ?auto_178418 ) ( ON ?auto_178420 ?auto_178419 ) ( not ( = ?auto_178414 ?auto_178415 ) ) ( not ( = ?auto_178414 ?auto_178416 ) ) ( not ( = ?auto_178414 ?auto_178417 ) ) ( not ( = ?auto_178414 ?auto_178418 ) ) ( not ( = ?auto_178414 ?auto_178419 ) ) ( not ( = ?auto_178414 ?auto_178420 ) ) ( not ( = ?auto_178414 ?auto_178421 ) ) ( not ( = ?auto_178414 ?auto_178422 ) ) ( not ( = ?auto_178415 ?auto_178416 ) ) ( not ( = ?auto_178415 ?auto_178417 ) ) ( not ( = ?auto_178415 ?auto_178418 ) ) ( not ( = ?auto_178415 ?auto_178419 ) ) ( not ( = ?auto_178415 ?auto_178420 ) ) ( not ( = ?auto_178415 ?auto_178421 ) ) ( not ( = ?auto_178415 ?auto_178422 ) ) ( not ( = ?auto_178416 ?auto_178417 ) ) ( not ( = ?auto_178416 ?auto_178418 ) ) ( not ( = ?auto_178416 ?auto_178419 ) ) ( not ( = ?auto_178416 ?auto_178420 ) ) ( not ( = ?auto_178416 ?auto_178421 ) ) ( not ( = ?auto_178416 ?auto_178422 ) ) ( not ( = ?auto_178417 ?auto_178418 ) ) ( not ( = ?auto_178417 ?auto_178419 ) ) ( not ( = ?auto_178417 ?auto_178420 ) ) ( not ( = ?auto_178417 ?auto_178421 ) ) ( not ( = ?auto_178417 ?auto_178422 ) ) ( not ( = ?auto_178418 ?auto_178419 ) ) ( not ( = ?auto_178418 ?auto_178420 ) ) ( not ( = ?auto_178418 ?auto_178421 ) ) ( not ( = ?auto_178418 ?auto_178422 ) ) ( not ( = ?auto_178419 ?auto_178420 ) ) ( not ( = ?auto_178419 ?auto_178421 ) ) ( not ( = ?auto_178419 ?auto_178422 ) ) ( not ( = ?auto_178420 ?auto_178421 ) ) ( not ( = ?auto_178420 ?auto_178422 ) ) ( not ( = ?auto_178421 ?auto_178422 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_178421 ?auto_178422 )
      ( !STACK ?auto_178421 ?auto_178420 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_178448 - BLOCK
      ?auto_178449 - BLOCK
      ?auto_178450 - BLOCK
      ?auto_178451 - BLOCK
      ?auto_178452 - BLOCK
      ?auto_178453 - BLOCK
      ?auto_178454 - BLOCK
      ?auto_178455 - BLOCK
    )
    :vars
    (
      ?auto_178456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178455 ?auto_178456 ) ( ON-TABLE ?auto_178448 ) ( ON ?auto_178449 ?auto_178448 ) ( ON ?auto_178450 ?auto_178449 ) ( ON ?auto_178451 ?auto_178450 ) ( ON ?auto_178452 ?auto_178451 ) ( ON ?auto_178453 ?auto_178452 ) ( not ( = ?auto_178448 ?auto_178449 ) ) ( not ( = ?auto_178448 ?auto_178450 ) ) ( not ( = ?auto_178448 ?auto_178451 ) ) ( not ( = ?auto_178448 ?auto_178452 ) ) ( not ( = ?auto_178448 ?auto_178453 ) ) ( not ( = ?auto_178448 ?auto_178454 ) ) ( not ( = ?auto_178448 ?auto_178455 ) ) ( not ( = ?auto_178448 ?auto_178456 ) ) ( not ( = ?auto_178449 ?auto_178450 ) ) ( not ( = ?auto_178449 ?auto_178451 ) ) ( not ( = ?auto_178449 ?auto_178452 ) ) ( not ( = ?auto_178449 ?auto_178453 ) ) ( not ( = ?auto_178449 ?auto_178454 ) ) ( not ( = ?auto_178449 ?auto_178455 ) ) ( not ( = ?auto_178449 ?auto_178456 ) ) ( not ( = ?auto_178450 ?auto_178451 ) ) ( not ( = ?auto_178450 ?auto_178452 ) ) ( not ( = ?auto_178450 ?auto_178453 ) ) ( not ( = ?auto_178450 ?auto_178454 ) ) ( not ( = ?auto_178450 ?auto_178455 ) ) ( not ( = ?auto_178450 ?auto_178456 ) ) ( not ( = ?auto_178451 ?auto_178452 ) ) ( not ( = ?auto_178451 ?auto_178453 ) ) ( not ( = ?auto_178451 ?auto_178454 ) ) ( not ( = ?auto_178451 ?auto_178455 ) ) ( not ( = ?auto_178451 ?auto_178456 ) ) ( not ( = ?auto_178452 ?auto_178453 ) ) ( not ( = ?auto_178452 ?auto_178454 ) ) ( not ( = ?auto_178452 ?auto_178455 ) ) ( not ( = ?auto_178452 ?auto_178456 ) ) ( not ( = ?auto_178453 ?auto_178454 ) ) ( not ( = ?auto_178453 ?auto_178455 ) ) ( not ( = ?auto_178453 ?auto_178456 ) ) ( not ( = ?auto_178454 ?auto_178455 ) ) ( not ( = ?auto_178454 ?auto_178456 ) ) ( not ( = ?auto_178455 ?auto_178456 ) ) ( CLEAR ?auto_178453 ) ( ON ?auto_178454 ?auto_178455 ) ( CLEAR ?auto_178454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178448 ?auto_178449 ?auto_178450 ?auto_178451 ?auto_178452 ?auto_178453 ?auto_178454 )
      ( MAKE-8PILE ?auto_178448 ?auto_178449 ?auto_178450 ?auto_178451 ?auto_178452 ?auto_178453 ?auto_178454 ?auto_178455 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_178482 - BLOCK
      ?auto_178483 - BLOCK
      ?auto_178484 - BLOCK
      ?auto_178485 - BLOCK
      ?auto_178486 - BLOCK
      ?auto_178487 - BLOCK
      ?auto_178488 - BLOCK
      ?auto_178489 - BLOCK
    )
    :vars
    (
      ?auto_178490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178489 ?auto_178490 ) ( ON-TABLE ?auto_178482 ) ( ON ?auto_178483 ?auto_178482 ) ( ON ?auto_178484 ?auto_178483 ) ( ON ?auto_178485 ?auto_178484 ) ( ON ?auto_178486 ?auto_178485 ) ( not ( = ?auto_178482 ?auto_178483 ) ) ( not ( = ?auto_178482 ?auto_178484 ) ) ( not ( = ?auto_178482 ?auto_178485 ) ) ( not ( = ?auto_178482 ?auto_178486 ) ) ( not ( = ?auto_178482 ?auto_178487 ) ) ( not ( = ?auto_178482 ?auto_178488 ) ) ( not ( = ?auto_178482 ?auto_178489 ) ) ( not ( = ?auto_178482 ?auto_178490 ) ) ( not ( = ?auto_178483 ?auto_178484 ) ) ( not ( = ?auto_178483 ?auto_178485 ) ) ( not ( = ?auto_178483 ?auto_178486 ) ) ( not ( = ?auto_178483 ?auto_178487 ) ) ( not ( = ?auto_178483 ?auto_178488 ) ) ( not ( = ?auto_178483 ?auto_178489 ) ) ( not ( = ?auto_178483 ?auto_178490 ) ) ( not ( = ?auto_178484 ?auto_178485 ) ) ( not ( = ?auto_178484 ?auto_178486 ) ) ( not ( = ?auto_178484 ?auto_178487 ) ) ( not ( = ?auto_178484 ?auto_178488 ) ) ( not ( = ?auto_178484 ?auto_178489 ) ) ( not ( = ?auto_178484 ?auto_178490 ) ) ( not ( = ?auto_178485 ?auto_178486 ) ) ( not ( = ?auto_178485 ?auto_178487 ) ) ( not ( = ?auto_178485 ?auto_178488 ) ) ( not ( = ?auto_178485 ?auto_178489 ) ) ( not ( = ?auto_178485 ?auto_178490 ) ) ( not ( = ?auto_178486 ?auto_178487 ) ) ( not ( = ?auto_178486 ?auto_178488 ) ) ( not ( = ?auto_178486 ?auto_178489 ) ) ( not ( = ?auto_178486 ?auto_178490 ) ) ( not ( = ?auto_178487 ?auto_178488 ) ) ( not ( = ?auto_178487 ?auto_178489 ) ) ( not ( = ?auto_178487 ?auto_178490 ) ) ( not ( = ?auto_178488 ?auto_178489 ) ) ( not ( = ?auto_178488 ?auto_178490 ) ) ( not ( = ?auto_178489 ?auto_178490 ) ) ( ON ?auto_178488 ?auto_178489 ) ( CLEAR ?auto_178486 ) ( ON ?auto_178487 ?auto_178488 ) ( CLEAR ?auto_178487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_178482 ?auto_178483 ?auto_178484 ?auto_178485 ?auto_178486 ?auto_178487 )
      ( MAKE-8PILE ?auto_178482 ?auto_178483 ?auto_178484 ?auto_178485 ?auto_178486 ?auto_178487 ?auto_178488 ?auto_178489 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_178516 - BLOCK
      ?auto_178517 - BLOCK
      ?auto_178518 - BLOCK
      ?auto_178519 - BLOCK
      ?auto_178520 - BLOCK
      ?auto_178521 - BLOCK
      ?auto_178522 - BLOCK
      ?auto_178523 - BLOCK
    )
    :vars
    (
      ?auto_178524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178523 ?auto_178524 ) ( ON-TABLE ?auto_178516 ) ( ON ?auto_178517 ?auto_178516 ) ( ON ?auto_178518 ?auto_178517 ) ( ON ?auto_178519 ?auto_178518 ) ( not ( = ?auto_178516 ?auto_178517 ) ) ( not ( = ?auto_178516 ?auto_178518 ) ) ( not ( = ?auto_178516 ?auto_178519 ) ) ( not ( = ?auto_178516 ?auto_178520 ) ) ( not ( = ?auto_178516 ?auto_178521 ) ) ( not ( = ?auto_178516 ?auto_178522 ) ) ( not ( = ?auto_178516 ?auto_178523 ) ) ( not ( = ?auto_178516 ?auto_178524 ) ) ( not ( = ?auto_178517 ?auto_178518 ) ) ( not ( = ?auto_178517 ?auto_178519 ) ) ( not ( = ?auto_178517 ?auto_178520 ) ) ( not ( = ?auto_178517 ?auto_178521 ) ) ( not ( = ?auto_178517 ?auto_178522 ) ) ( not ( = ?auto_178517 ?auto_178523 ) ) ( not ( = ?auto_178517 ?auto_178524 ) ) ( not ( = ?auto_178518 ?auto_178519 ) ) ( not ( = ?auto_178518 ?auto_178520 ) ) ( not ( = ?auto_178518 ?auto_178521 ) ) ( not ( = ?auto_178518 ?auto_178522 ) ) ( not ( = ?auto_178518 ?auto_178523 ) ) ( not ( = ?auto_178518 ?auto_178524 ) ) ( not ( = ?auto_178519 ?auto_178520 ) ) ( not ( = ?auto_178519 ?auto_178521 ) ) ( not ( = ?auto_178519 ?auto_178522 ) ) ( not ( = ?auto_178519 ?auto_178523 ) ) ( not ( = ?auto_178519 ?auto_178524 ) ) ( not ( = ?auto_178520 ?auto_178521 ) ) ( not ( = ?auto_178520 ?auto_178522 ) ) ( not ( = ?auto_178520 ?auto_178523 ) ) ( not ( = ?auto_178520 ?auto_178524 ) ) ( not ( = ?auto_178521 ?auto_178522 ) ) ( not ( = ?auto_178521 ?auto_178523 ) ) ( not ( = ?auto_178521 ?auto_178524 ) ) ( not ( = ?auto_178522 ?auto_178523 ) ) ( not ( = ?auto_178522 ?auto_178524 ) ) ( not ( = ?auto_178523 ?auto_178524 ) ) ( ON ?auto_178522 ?auto_178523 ) ( ON ?auto_178521 ?auto_178522 ) ( CLEAR ?auto_178519 ) ( ON ?auto_178520 ?auto_178521 ) ( CLEAR ?auto_178520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178516 ?auto_178517 ?auto_178518 ?auto_178519 ?auto_178520 )
      ( MAKE-8PILE ?auto_178516 ?auto_178517 ?auto_178518 ?auto_178519 ?auto_178520 ?auto_178521 ?auto_178522 ?auto_178523 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_178550 - BLOCK
      ?auto_178551 - BLOCK
      ?auto_178552 - BLOCK
      ?auto_178553 - BLOCK
      ?auto_178554 - BLOCK
      ?auto_178555 - BLOCK
      ?auto_178556 - BLOCK
      ?auto_178557 - BLOCK
    )
    :vars
    (
      ?auto_178558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178557 ?auto_178558 ) ( ON-TABLE ?auto_178550 ) ( ON ?auto_178551 ?auto_178550 ) ( ON ?auto_178552 ?auto_178551 ) ( not ( = ?auto_178550 ?auto_178551 ) ) ( not ( = ?auto_178550 ?auto_178552 ) ) ( not ( = ?auto_178550 ?auto_178553 ) ) ( not ( = ?auto_178550 ?auto_178554 ) ) ( not ( = ?auto_178550 ?auto_178555 ) ) ( not ( = ?auto_178550 ?auto_178556 ) ) ( not ( = ?auto_178550 ?auto_178557 ) ) ( not ( = ?auto_178550 ?auto_178558 ) ) ( not ( = ?auto_178551 ?auto_178552 ) ) ( not ( = ?auto_178551 ?auto_178553 ) ) ( not ( = ?auto_178551 ?auto_178554 ) ) ( not ( = ?auto_178551 ?auto_178555 ) ) ( not ( = ?auto_178551 ?auto_178556 ) ) ( not ( = ?auto_178551 ?auto_178557 ) ) ( not ( = ?auto_178551 ?auto_178558 ) ) ( not ( = ?auto_178552 ?auto_178553 ) ) ( not ( = ?auto_178552 ?auto_178554 ) ) ( not ( = ?auto_178552 ?auto_178555 ) ) ( not ( = ?auto_178552 ?auto_178556 ) ) ( not ( = ?auto_178552 ?auto_178557 ) ) ( not ( = ?auto_178552 ?auto_178558 ) ) ( not ( = ?auto_178553 ?auto_178554 ) ) ( not ( = ?auto_178553 ?auto_178555 ) ) ( not ( = ?auto_178553 ?auto_178556 ) ) ( not ( = ?auto_178553 ?auto_178557 ) ) ( not ( = ?auto_178553 ?auto_178558 ) ) ( not ( = ?auto_178554 ?auto_178555 ) ) ( not ( = ?auto_178554 ?auto_178556 ) ) ( not ( = ?auto_178554 ?auto_178557 ) ) ( not ( = ?auto_178554 ?auto_178558 ) ) ( not ( = ?auto_178555 ?auto_178556 ) ) ( not ( = ?auto_178555 ?auto_178557 ) ) ( not ( = ?auto_178555 ?auto_178558 ) ) ( not ( = ?auto_178556 ?auto_178557 ) ) ( not ( = ?auto_178556 ?auto_178558 ) ) ( not ( = ?auto_178557 ?auto_178558 ) ) ( ON ?auto_178556 ?auto_178557 ) ( ON ?auto_178555 ?auto_178556 ) ( ON ?auto_178554 ?auto_178555 ) ( CLEAR ?auto_178552 ) ( ON ?auto_178553 ?auto_178554 ) ( CLEAR ?auto_178553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178550 ?auto_178551 ?auto_178552 ?auto_178553 )
      ( MAKE-8PILE ?auto_178550 ?auto_178551 ?auto_178552 ?auto_178553 ?auto_178554 ?auto_178555 ?auto_178556 ?auto_178557 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_178584 - BLOCK
      ?auto_178585 - BLOCK
      ?auto_178586 - BLOCK
      ?auto_178587 - BLOCK
      ?auto_178588 - BLOCK
      ?auto_178589 - BLOCK
      ?auto_178590 - BLOCK
      ?auto_178591 - BLOCK
    )
    :vars
    (
      ?auto_178592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178591 ?auto_178592 ) ( ON-TABLE ?auto_178584 ) ( ON ?auto_178585 ?auto_178584 ) ( not ( = ?auto_178584 ?auto_178585 ) ) ( not ( = ?auto_178584 ?auto_178586 ) ) ( not ( = ?auto_178584 ?auto_178587 ) ) ( not ( = ?auto_178584 ?auto_178588 ) ) ( not ( = ?auto_178584 ?auto_178589 ) ) ( not ( = ?auto_178584 ?auto_178590 ) ) ( not ( = ?auto_178584 ?auto_178591 ) ) ( not ( = ?auto_178584 ?auto_178592 ) ) ( not ( = ?auto_178585 ?auto_178586 ) ) ( not ( = ?auto_178585 ?auto_178587 ) ) ( not ( = ?auto_178585 ?auto_178588 ) ) ( not ( = ?auto_178585 ?auto_178589 ) ) ( not ( = ?auto_178585 ?auto_178590 ) ) ( not ( = ?auto_178585 ?auto_178591 ) ) ( not ( = ?auto_178585 ?auto_178592 ) ) ( not ( = ?auto_178586 ?auto_178587 ) ) ( not ( = ?auto_178586 ?auto_178588 ) ) ( not ( = ?auto_178586 ?auto_178589 ) ) ( not ( = ?auto_178586 ?auto_178590 ) ) ( not ( = ?auto_178586 ?auto_178591 ) ) ( not ( = ?auto_178586 ?auto_178592 ) ) ( not ( = ?auto_178587 ?auto_178588 ) ) ( not ( = ?auto_178587 ?auto_178589 ) ) ( not ( = ?auto_178587 ?auto_178590 ) ) ( not ( = ?auto_178587 ?auto_178591 ) ) ( not ( = ?auto_178587 ?auto_178592 ) ) ( not ( = ?auto_178588 ?auto_178589 ) ) ( not ( = ?auto_178588 ?auto_178590 ) ) ( not ( = ?auto_178588 ?auto_178591 ) ) ( not ( = ?auto_178588 ?auto_178592 ) ) ( not ( = ?auto_178589 ?auto_178590 ) ) ( not ( = ?auto_178589 ?auto_178591 ) ) ( not ( = ?auto_178589 ?auto_178592 ) ) ( not ( = ?auto_178590 ?auto_178591 ) ) ( not ( = ?auto_178590 ?auto_178592 ) ) ( not ( = ?auto_178591 ?auto_178592 ) ) ( ON ?auto_178590 ?auto_178591 ) ( ON ?auto_178589 ?auto_178590 ) ( ON ?auto_178588 ?auto_178589 ) ( ON ?auto_178587 ?auto_178588 ) ( CLEAR ?auto_178585 ) ( ON ?auto_178586 ?auto_178587 ) ( CLEAR ?auto_178586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178584 ?auto_178585 ?auto_178586 )
      ( MAKE-8PILE ?auto_178584 ?auto_178585 ?auto_178586 ?auto_178587 ?auto_178588 ?auto_178589 ?auto_178590 ?auto_178591 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_178618 - BLOCK
      ?auto_178619 - BLOCK
      ?auto_178620 - BLOCK
      ?auto_178621 - BLOCK
      ?auto_178622 - BLOCK
      ?auto_178623 - BLOCK
      ?auto_178624 - BLOCK
      ?auto_178625 - BLOCK
    )
    :vars
    (
      ?auto_178626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178625 ?auto_178626 ) ( ON-TABLE ?auto_178618 ) ( not ( = ?auto_178618 ?auto_178619 ) ) ( not ( = ?auto_178618 ?auto_178620 ) ) ( not ( = ?auto_178618 ?auto_178621 ) ) ( not ( = ?auto_178618 ?auto_178622 ) ) ( not ( = ?auto_178618 ?auto_178623 ) ) ( not ( = ?auto_178618 ?auto_178624 ) ) ( not ( = ?auto_178618 ?auto_178625 ) ) ( not ( = ?auto_178618 ?auto_178626 ) ) ( not ( = ?auto_178619 ?auto_178620 ) ) ( not ( = ?auto_178619 ?auto_178621 ) ) ( not ( = ?auto_178619 ?auto_178622 ) ) ( not ( = ?auto_178619 ?auto_178623 ) ) ( not ( = ?auto_178619 ?auto_178624 ) ) ( not ( = ?auto_178619 ?auto_178625 ) ) ( not ( = ?auto_178619 ?auto_178626 ) ) ( not ( = ?auto_178620 ?auto_178621 ) ) ( not ( = ?auto_178620 ?auto_178622 ) ) ( not ( = ?auto_178620 ?auto_178623 ) ) ( not ( = ?auto_178620 ?auto_178624 ) ) ( not ( = ?auto_178620 ?auto_178625 ) ) ( not ( = ?auto_178620 ?auto_178626 ) ) ( not ( = ?auto_178621 ?auto_178622 ) ) ( not ( = ?auto_178621 ?auto_178623 ) ) ( not ( = ?auto_178621 ?auto_178624 ) ) ( not ( = ?auto_178621 ?auto_178625 ) ) ( not ( = ?auto_178621 ?auto_178626 ) ) ( not ( = ?auto_178622 ?auto_178623 ) ) ( not ( = ?auto_178622 ?auto_178624 ) ) ( not ( = ?auto_178622 ?auto_178625 ) ) ( not ( = ?auto_178622 ?auto_178626 ) ) ( not ( = ?auto_178623 ?auto_178624 ) ) ( not ( = ?auto_178623 ?auto_178625 ) ) ( not ( = ?auto_178623 ?auto_178626 ) ) ( not ( = ?auto_178624 ?auto_178625 ) ) ( not ( = ?auto_178624 ?auto_178626 ) ) ( not ( = ?auto_178625 ?auto_178626 ) ) ( ON ?auto_178624 ?auto_178625 ) ( ON ?auto_178623 ?auto_178624 ) ( ON ?auto_178622 ?auto_178623 ) ( ON ?auto_178621 ?auto_178622 ) ( ON ?auto_178620 ?auto_178621 ) ( CLEAR ?auto_178618 ) ( ON ?auto_178619 ?auto_178620 ) ( CLEAR ?auto_178619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178618 ?auto_178619 )
      ( MAKE-8PILE ?auto_178618 ?auto_178619 ?auto_178620 ?auto_178621 ?auto_178622 ?auto_178623 ?auto_178624 ?auto_178625 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_178652 - BLOCK
      ?auto_178653 - BLOCK
      ?auto_178654 - BLOCK
      ?auto_178655 - BLOCK
      ?auto_178656 - BLOCK
      ?auto_178657 - BLOCK
      ?auto_178658 - BLOCK
      ?auto_178659 - BLOCK
    )
    :vars
    (
      ?auto_178660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178659 ?auto_178660 ) ( not ( = ?auto_178652 ?auto_178653 ) ) ( not ( = ?auto_178652 ?auto_178654 ) ) ( not ( = ?auto_178652 ?auto_178655 ) ) ( not ( = ?auto_178652 ?auto_178656 ) ) ( not ( = ?auto_178652 ?auto_178657 ) ) ( not ( = ?auto_178652 ?auto_178658 ) ) ( not ( = ?auto_178652 ?auto_178659 ) ) ( not ( = ?auto_178652 ?auto_178660 ) ) ( not ( = ?auto_178653 ?auto_178654 ) ) ( not ( = ?auto_178653 ?auto_178655 ) ) ( not ( = ?auto_178653 ?auto_178656 ) ) ( not ( = ?auto_178653 ?auto_178657 ) ) ( not ( = ?auto_178653 ?auto_178658 ) ) ( not ( = ?auto_178653 ?auto_178659 ) ) ( not ( = ?auto_178653 ?auto_178660 ) ) ( not ( = ?auto_178654 ?auto_178655 ) ) ( not ( = ?auto_178654 ?auto_178656 ) ) ( not ( = ?auto_178654 ?auto_178657 ) ) ( not ( = ?auto_178654 ?auto_178658 ) ) ( not ( = ?auto_178654 ?auto_178659 ) ) ( not ( = ?auto_178654 ?auto_178660 ) ) ( not ( = ?auto_178655 ?auto_178656 ) ) ( not ( = ?auto_178655 ?auto_178657 ) ) ( not ( = ?auto_178655 ?auto_178658 ) ) ( not ( = ?auto_178655 ?auto_178659 ) ) ( not ( = ?auto_178655 ?auto_178660 ) ) ( not ( = ?auto_178656 ?auto_178657 ) ) ( not ( = ?auto_178656 ?auto_178658 ) ) ( not ( = ?auto_178656 ?auto_178659 ) ) ( not ( = ?auto_178656 ?auto_178660 ) ) ( not ( = ?auto_178657 ?auto_178658 ) ) ( not ( = ?auto_178657 ?auto_178659 ) ) ( not ( = ?auto_178657 ?auto_178660 ) ) ( not ( = ?auto_178658 ?auto_178659 ) ) ( not ( = ?auto_178658 ?auto_178660 ) ) ( not ( = ?auto_178659 ?auto_178660 ) ) ( ON ?auto_178658 ?auto_178659 ) ( ON ?auto_178657 ?auto_178658 ) ( ON ?auto_178656 ?auto_178657 ) ( ON ?auto_178655 ?auto_178656 ) ( ON ?auto_178654 ?auto_178655 ) ( ON ?auto_178653 ?auto_178654 ) ( ON ?auto_178652 ?auto_178653 ) ( CLEAR ?auto_178652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_178652 )
      ( MAKE-8PILE ?auto_178652 ?auto_178653 ?auto_178654 ?auto_178655 ?auto_178656 ?auto_178657 ?auto_178658 ?auto_178659 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_178687 - BLOCK
      ?auto_178688 - BLOCK
      ?auto_178689 - BLOCK
      ?auto_178690 - BLOCK
      ?auto_178691 - BLOCK
      ?auto_178692 - BLOCK
      ?auto_178693 - BLOCK
      ?auto_178694 - BLOCK
      ?auto_178695 - BLOCK
    )
    :vars
    (
      ?auto_178696 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_178694 ) ( ON ?auto_178695 ?auto_178696 ) ( CLEAR ?auto_178695 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_178687 ) ( ON ?auto_178688 ?auto_178687 ) ( ON ?auto_178689 ?auto_178688 ) ( ON ?auto_178690 ?auto_178689 ) ( ON ?auto_178691 ?auto_178690 ) ( ON ?auto_178692 ?auto_178691 ) ( ON ?auto_178693 ?auto_178692 ) ( ON ?auto_178694 ?auto_178693 ) ( not ( = ?auto_178687 ?auto_178688 ) ) ( not ( = ?auto_178687 ?auto_178689 ) ) ( not ( = ?auto_178687 ?auto_178690 ) ) ( not ( = ?auto_178687 ?auto_178691 ) ) ( not ( = ?auto_178687 ?auto_178692 ) ) ( not ( = ?auto_178687 ?auto_178693 ) ) ( not ( = ?auto_178687 ?auto_178694 ) ) ( not ( = ?auto_178687 ?auto_178695 ) ) ( not ( = ?auto_178687 ?auto_178696 ) ) ( not ( = ?auto_178688 ?auto_178689 ) ) ( not ( = ?auto_178688 ?auto_178690 ) ) ( not ( = ?auto_178688 ?auto_178691 ) ) ( not ( = ?auto_178688 ?auto_178692 ) ) ( not ( = ?auto_178688 ?auto_178693 ) ) ( not ( = ?auto_178688 ?auto_178694 ) ) ( not ( = ?auto_178688 ?auto_178695 ) ) ( not ( = ?auto_178688 ?auto_178696 ) ) ( not ( = ?auto_178689 ?auto_178690 ) ) ( not ( = ?auto_178689 ?auto_178691 ) ) ( not ( = ?auto_178689 ?auto_178692 ) ) ( not ( = ?auto_178689 ?auto_178693 ) ) ( not ( = ?auto_178689 ?auto_178694 ) ) ( not ( = ?auto_178689 ?auto_178695 ) ) ( not ( = ?auto_178689 ?auto_178696 ) ) ( not ( = ?auto_178690 ?auto_178691 ) ) ( not ( = ?auto_178690 ?auto_178692 ) ) ( not ( = ?auto_178690 ?auto_178693 ) ) ( not ( = ?auto_178690 ?auto_178694 ) ) ( not ( = ?auto_178690 ?auto_178695 ) ) ( not ( = ?auto_178690 ?auto_178696 ) ) ( not ( = ?auto_178691 ?auto_178692 ) ) ( not ( = ?auto_178691 ?auto_178693 ) ) ( not ( = ?auto_178691 ?auto_178694 ) ) ( not ( = ?auto_178691 ?auto_178695 ) ) ( not ( = ?auto_178691 ?auto_178696 ) ) ( not ( = ?auto_178692 ?auto_178693 ) ) ( not ( = ?auto_178692 ?auto_178694 ) ) ( not ( = ?auto_178692 ?auto_178695 ) ) ( not ( = ?auto_178692 ?auto_178696 ) ) ( not ( = ?auto_178693 ?auto_178694 ) ) ( not ( = ?auto_178693 ?auto_178695 ) ) ( not ( = ?auto_178693 ?auto_178696 ) ) ( not ( = ?auto_178694 ?auto_178695 ) ) ( not ( = ?auto_178694 ?auto_178696 ) ) ( not ( = ?auto_178695 ?auto_178696 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_178695 ?auto_178696 )
      ( !STACK ?auto_178695 ?auto_178694 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_178725 - BLOCK
      ?auto_178726 - BLOCK
      ?auto_178727 - BLOCK
      ?auto_178728 - BLOCK
      ?auto_178729 - BLOCK
      ?auto_178730 - BLOCK
      ?auto_178731 - BLOCK
      ?auto_178732 - BLOCK
      ?auto_178733 - BLOCK
    )
    :vars
    (
      ?auto_178734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178733 ?auto_178734 ) ( ON-TABLE ?auto_178725 ) ( ON ?auto_178726 ?auto_178725 ) ( ON ?auto_178727 ?auto_178726 ) ( ON ?auto_178728 ?auto_178727 ) ( ON ?auto_178729 ?auto_178728 ) ( ON ?auto_178730 ?auto_178729 ) ( ON ?auto_178731 ?auto_178730 ) ( not ( = ?auto_178725 ?auto_178726 ) ) ( not ( = ?auto_178725 ?auto_178727 ) ) ( not ( = ?auto_178725 ?auto_178728 ) ) ( not ( = ?auto_178725 ?auto_178729 ) ) ( not ( = ?auto_178725 ?auto_178730 ) ) ( not ( = ?auto_178725 ?auto_178731 ) ) ( not ( = ?auto_178725 ?auto_178732 ) ) ( not ( = ?auto_178725 ?auto_178733 ) ) ( not ( = ?auto_178725 ?auto_178734 ) ) ( not ( = ?auto_178726 ?auto_178727 ) ) ( not ( = ?auto_178726 ?auto_178728 ) ) ( not ( = ?auto_178726 ?auto_178729 ) ) ( not ( = ?auto_178726 ?auto_178730 ) ) ( not ( = ?auto_178726 ?auto_178731 ) ) ( not ( = ?auto_178726 ?auto_178732 ) ) ( not ( = ?auto_178726 ?auto_178733 ) ) ( not ( = ?auto_178726 ?auto_178734 ) ) ( not ( = ?auto_178727 ?auto_178728 ) ) ( not ( = ?auto_178727 ?auto_178729 ) ) ( not ( = ?auto_178727 ?auto_178730 ) ) ( not ( = ?auto_178727 ?auto_178731 ) ) ( not ( = ?auto_178727 ?auto_178732 ) ) ( not ( = ?auto_178727 ?auto_178733 ) ) ( not ( = ?auto_178727 ?auto_178734 ) ) ( not ( = ?auto_178728 ?auto_178729 ) ) ( not ( = ?auto_178728 ?auto_178730 ) ) ( not ( = ?auto_178728 ?auto_178731 ) ) ( not ( = ?auto_178728 ?auto_178732 ) ) ( not ( = ?auto_178728 ?auto_178733 ) ) ( not ( = ?auto_178728 ?auto_178734 ) ) ( not ( = ?auto_178729 ?auto_178730 ) ) ( not ( = ?auto_178729 ?auto_178731 ) ) ( not ( = ?auto_178729 ?auto_178732 ) ) ( not ( = ?auto_178729 ?auto_178733 ) ) ( not ( = ?auto_178729 ?auto_178734 ) ) ( not ( = ?auto_178730 ?auto_178731 ) ) ( not ( = ?auto_178730 ?auto_178732 ) ) ( not ( = ?auto_178730 ?auto_178733 ) ) ( not ( = ?auto_178730 ?auto_178734 ) ) ( not ( = ?auto_178731 ?auto_178732 ) ) ( not ( = ?auto_178731 ?auto_178733 ) ) ( not ( = ?auto_178731 ?auto_178734 ) ) ( not ( = ?auto_178732 ?auto_178733 ) ) ( not ( = ?auto_178732 ?auto_178734 ) ) ( not ( = ?auto_178733 ?auto_178734 ) ) ( CLEAR ?auto_178731 ) ( ON ?auto_178732 ?auto_178733 ) ( CLEAR ?auto_178732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_178725 ?auto_178726 ?auto_178727 ?auto_178728 ?auto_178729 ?auto_178730 ?auto_178731 ?auto_178732 )
      ( MAKE-9PILE ?auto_178725 ?auto_178726 ?auto_178727 ?auto_178728 ?auto_178729 ?auto_178730 ?auto_178731 ?auto_178732 ?auto_178733 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_178763 - BLOCK
      ?auto_178764 - BLOCK
      ?auto_178765 - BLOCK
      ?auto_178766 - BLOCK
      ?auto_178767 - BLOCK
      ?auto_178768 - BLOCK
      ?auto_178769 - BLOCK
      ?auto_178770 - BLOCK
      ?auto_178771 - BLOCK
    )
    :vars
    (
      ?auto_178772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178771 ?auto_178772 ) ( ON-TABLE ?auto_178763 ) ( ON ?auto_178764 ?auto_178763 ) ( ON ?auto_178765 ?auto_178764 ) ( ON ?auto_178766 ?auto_178765 ) ( ON ?auto_178767 ?auto_178766 ) ( ON ?auto_178768 ?auto_178767 ) ( not ( = ?auto_178763 ?auto_178764 ) ) ( not ( = ?auto_178763 ?auto_178765 ) ) ( not ( = ?auto_178763 ?auto_178766 ) ) ( not ( = ?auto_178763 ?auto_178767 ) ) ( not ( = ?auto_178763 ?auto_178768 ) ) ( not ( = ?auto_178763 ?auto_178769 ) ) ( not ( = ?auto_178763 ?auto_178770 ) ) ( not ( = ?auto_178763 ?auto_178771 ) ) ( not ( = ?auto_178763 ?auto_178772 ) ) ( not ( = ?auto_178764 ?auto_178765 ) ) ( not ( = ?auto_178764 ?auto_178766 ) ) ( not ( = ?auto_178764 ?auto_178767 ) ) ( not ( = ?auto_178764 ?auto_178768 ) ) ( not ( = ?auto_178764 ?auto_178769 ) ) ( not ( = ?auto_178764 ?auto_178770 ) ) ( not ( = ?auto_178764 ?auto_178771 ) ) ( not ( = ?auto_178764 ?auto_178772 ) ) ( not ( = ?auto_178765 ?auto_178766 ) ) ( not ( = ?auto_178765 ?auto_178767 ) ) ( not ( = ?auto_178765 ?auto_178768 ) ) ( not ( = ?auto_178765 ?auto_178769 ) ) ( not ( = ?auto_178765 ?auto_178770 ) ) ( not ( = ?auto_178765 ?auto_178771 ) ) ( not ( = ?auto_178765 ?auto_178772 ) ) ( not ( = ?auto_178766 ?auto_178767 ) ) ( not ( = ?auto_178766 ?auto_178768 ) ) ( not ( = ?auto_178766 ?auto_178769 ) ) ( not ( = ?auto_178766 ?auto_178770 ) ) ( not ( = ?auto_178766 ?auto_178771 ) ) ( not ( = ?auto_178766 ?auto_178772 ) ) ( not ( = ?auto_178767 ?auto_178768 ) ) ( not ( = ?auto_178767 ?auto_178769 ) ) ( not ( = ?auto_178767 ?auto_178770 ) ) ( not ( = ?auto_178767 ?auto_178771 ) ) ( not ( = ?auto_178767 ?auto_178772 ) ) ( not ( = ?auto_178768 ?auto_178769 ) ) ( not ( = ?auto_178768 ?auto_178770 ) ) ( not ( = ?auto_178768 ?auto_178771 ) ) ( not ( = ?auto_178768 ?auto_178772 ) ) ( not ( = ?auto_178769 ?auto_178770 ) ) ( not ( = ?auto_178769 ?auto_178771 ) ) ( not ( = ?auto_178769 ?auto_178772 ) ) ( not ( = ?auto_178770 ?auto_178771 ) ) ( not ( = ?auto_178770 ?auto_178772 ) ) ( not ( = ?auto_178771 ?auto_178772 ) ) ( ON ?auto_178770 ?auto_178771 ) ( CLEAR ?auto_178768 ) ( ON ?auto_178769 ?auto_178770 ) ( CLEAR ?auto_178769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178763 ?auto_178764 ?auto_178765 ?auto_178766 ?auto_178767 ?auto_178768 ?auto_178769 )
      ( MAKE-9PILE ?auto_178763 ?auto_178764 ?auto_178765 ?auto_178766 ?auto_178767 ?auto_178768 ?auto_178769 ?auto_178770 ?auto_178771 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_178801 - BLOCK
      ?auto_178802 - BLOCK
      ?auto_178803 - BLOCK
      ?auto_178804 - BLOCK
      ?auto_178805 - BLOCK
      ?auto_178806 - BLOCK
      ?auto_178807 - BLOCK
      ?auto_178808 - BLOCK
      ?auto_178809 - BLOCK
    )
    :vars
    (
      ?auto_178810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178809 ?auto_178810 ) ( ON-TABLE ?auto_178801 ) ( ON ?auto_178802 ?auto_178801 ) ( ON ?auto_178803 ?auto_178802 ) ( ON ?auto_178804 ?auto_178803 ) ( ON ?auto_178805 ?auto_178804 ) ( not ( = ?auto_178801 ?auto_178802 ) ) ( not ( = ?auto_178801 ?auto_178803 ) ) ( not ( = ?auto_178801 ?auto_178804 ) ) ( not ( = ?auto_178801 ?auto_178805 ) ) ( not ( = ?auto_178801 ?auto_178806 ) ) ( not ( = ?auto_178801 ?auto_178807 ) ) ( not ( = ?auto_178801 ?auto_178808 ) ) ( not ( = ?auto_178801 ?auto_178809 ) ) ( not ( = ?auto_178801 ?auto_178810 ) ) ( not ( = ?auto_178802 ?auto_178803 ) ) ( not ( = ?auto_178802 ?auto_178804 ) ) ( not ( = ?auto_178802 ?auto_178805 ) ) ( not ( = ?auto_178802 ?auto_178806 ) ) ( not ( = ?auto_178802 ?auto_178807 ) ) ( not ( = ?auto_178802 ?auto_178808 ) ) ( not ( = ?auto_178802 ?auto_178809 ) ) ( not ( = ?auto_178802 ?auto_178810 ) ) ( not ( = ?auto_178803 ?auto_178804 ) ) ( not ( = ?auto_178803 ?auto_178805 ) ) ( not ( = ?auto_178803 ?auto_178806 ) ) ( not ( = ?auto_178803 ?auto_178807 ) ) ( not ( = ?auto_178803 ?auto_178808 ) ) ( not ( = ?auto_178803 ?auto_178809 ) ) ( not ( = ?auto_178803 ?auto_178810 ) ) ( not ( = ?auto_178804 ?auto_178805 ) ) ( not ( = ?auto_178804 ?auto_178806 ) ) ( not ( = ?auto_178804 ?auto_178807 ) ) ( not ( = ?auto_178804 ?auto_178808 ) ) ( not ( = ?auto_178804 ?auto_178809 ) ) ( not ( = ?auto_178804 ?auto_178810 ) ) ( not ( = ?auto_178805 ?auto_178806 ) ) ( not ( = ?auto_178805 ?auto_178807 ) ) ( not ( = ?auto_178805 ?auto_178808 ) ) ( not ( = ?auto_178805 ?auto_178809 ) ) ( not ( = ?auto_178805 ?auto_178810 ) ) ( not ( = ?auto_178806 ?auto_178807 ) ) ( not ( = ?auto_178806 ?auto_178808 ) ) ( not ( = ?auto_178806 ?auto_178809 ) ) ( not ( = ?auto_178806 ?auto_178810 ) ) ( not ( = ?auto_178807 ?auto_178808 ) ) ( not ( = ?auto_178807 ?auto_178809 ) ) ( not ( = ?auto_178807 ?auto_178810 ) ) ( not ( = ?auto_178808 ?auto_178809 ) ) ( not ( = ?auto_178808 ?auto_178810 ) ) ( not ( = ?auto_178809 ?auto_178810 ) ) ( ON ?auto_178808 ?auto_178809 ) ( ON ?auto_178807 ?auto_178808 ) ( CLEAR ?auto_178805 ) ( ON ?auto_178806 ?auto_178807 ) ( CLEAR ?auto_178806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_178801 ?auto_178802 ?auto_178803 ?auto_178804 ?auto_178805 ?auto_178806 )
      ( MAKE-9PILE ?auto_178801 ?auto_178802 ?auto_178803 ?auto_178804 ?auto_178805 ?auto_178806 ?auto_178807 ?auto_178808 ?auto_178809 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_178839 - BLOCK
      ?auto_178840 - BLOCK
      ?auto_178841 - BLOCK
      ?auto_178842 - BLOCK
      ?auto_178843 - BLOCK
      ?auto_178844 - BLOCK
      ?auto_178845 - BLOCK
      ?auto_178846 - BLOCK
      ?auto_178847 - BLOCK
    )
    :vars
    (
      ?auto_178848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178847 ?auto_178848 ) ( ON-TABLE ?auto_178839 ) ( ON ?auto_178840 ?auto_178839 ) ( ON ?auto_178841 ?auto_178840 ) ( ON ?auto_178842 ?auto_178841 ) ( not ( = ?auto_178839 ?auto_178840 ) ) ( not ( = ?auto_178839 ?auto_178841 ) ) ( not ( = ?auto_178839 ?auto_178842 ) ) ( not ( = ?auto_178839 ?auto_178843 ) ) ( not ( = ?auto_178839 ?auto_178844 ) ) ( not ( = ?auto_178839 ?auto_178845 ) ) ( not ( = ?auto_178839 ?auto_178846 ) ) ( not ( = ?auto_178839 ?auto_178847 ) ) ( not ( = ?auto_178839 ?auto_178848 ) ) ( not ( = ?auto_178840 ?auto_178841 ) ) ( not ( = ?auto_178840 ?auto_178842 ) ) ( not ( = ?auto_178840 ?auto_178843 ) ) ( not ( = ?auto_178840 ?auto_178844 ) ) ( not ( = ?auto_178840 ?auto_178845 ) ) ( not ( = ?auto_178840 ?auto_178846 ) ) ( not ( = ?auto_178840 ?auto_178847 ) ) ( not ( = ?auto_178840 ?auto_178848 ) ) ( not ( = ?auto_178841 ?auto_178842 ) ) ( not ( = ?auto_178841 ?auto_178843 ) ) ( not ( = ?auto_178841 ?auto_178844 ) ) ( not ( = ?auto_178841 ?auto_178845 ) ) ( not ( = ?auto_178841 ?auto_178846 ) ) ( not ( = ?auto_178841 ?auto_178847 ) ) ( not ( = ?auto_178841 ?auto_178848 ) ) ( not ( = ?auto_178842 ?auto_178843 ) ) ( not ( = ?auto_178842 ?auto_178844 ) ) ( not ( = ?auto_178842 ?auto_178845 ) ) ( not ( = ?auto_178842 ?auto_178846 ) ) ( not ( = ?auto_178842 ?auto_178847 ) ) ( not ( = ?auto_178842 ?auto_178848 ) ) ( not ( = ?auto_178843 ?auto_178844 ) ) ( not ( = ?auto_178843 ?auto_178845 ) ) ( not ( = ?auto_178843 ?auto_178846 ) ) ( not ( = ?auto_178843 ?auto_178847 ) ) ( not ( = ?auto_178843 ?auto_178848 ) ) ( not ( = ?auto_178844 ?auto_178845 ) ) ( not ( = ?auto_178844 ?auto_178846 ) ) ( not ( = ?auto_178844 ?auto_178847 ) ) ( not ( = ?auto_178844 ?auto_178848 ) ) ( not ( = ?auto_178845 ?auto_178846 ) ) ( not ( = ?auto_178845 ?auto_178847 ) ) ( not ( = ?auto_178845 ?auto_178848 ) ) ( not ( = ?auto_178846 ?auto_178847 ) ) ( not ( = ?auto_178846 ?auto_178848 ) ) ( not ( = ?auto_178847 ?auto_178848 ) ) ( ON ?auto_178846 ?auto_178847 ) ( ON ?auto_178845 ?auto_178846 ) ( ON ?auto_178844 ?auto_178845 ) ( CLEAR ?auto_178842 ) ( ON ?auto_178843 ?auto_178844 ) ( CLEAR ?auto_178843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178839 ?auto_178840 ?auto_178841 ?auto_178842 ?auto_178843 )
      ( MAKE-9PILE ?auto_178839 ?auto_178840 ?auto_178841 ?auto_178842 ?auto_178843 ?auto_178844 ?auto_178845 ?auto_178846 ?auto_178847 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_178877 - BLOCK
      ?auto_178878 - BLOCK
      ?auto_178879 - BLOCK
      ?auto_178880 - BLOCK
      ?auto_178881 - BLOCK
      ?auto_178882 - BLOCK
      ?auto_178883 - BLOCK
      ?auto_178884 - BLOCK
      ?auto_178885 - BLOCK
    )
    :vars
    (
      ?auto_178886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178885 ?auto_178886 ) ( ON-TABLE ?auto_178877 ) ( ON ?auto_178878 ?auto_178877 ) ( ON ?auto_178879 ?auto_178878 ) ( not ( = ?auto_178877 ?auto_178878 ) ) ( not ( = ?auto_178877 ?auto_178879 ) ) ( not ( = ?auto_178877 ?auto_178880 ) ) ( not ( = ?auto_178877 ?auto_178881 ) ) ( not ( = ?auto_178877 ?auto_178882 ) ) ( not ( = ?auto_178877 ?auto_178883 ) ) ( not ( = ?auto_178877 ?auto_178884 ) ) ( not ( = ?auto_178877 ?auto_178885 ) ) ( not ( = ?auto_178877 ?auto_178886 ) ) ( not ( = ?auto_178878 ?auto_178879 ) ) ( not ( = ?auto_178878 ?auto_178880 ) ) ( not ( = ?auto_178878 ?auto_178881 ) ) ( not ( = ?auto_178878 ?auto_178882 ) ) ( not ( = ?auto_178878 ?auto_178883 ) ) ( not ( = ?auto_178878 ?auto_178884 ) ) ( not ( = ?auto_178878 ?auto_178885 ) ) ( not ( = ?auto_178878 ?auto_178886 ) ) ( not ( = ?auto_178879 ?auto_178880 ) ) ( not ( = ?auto_178879 ?auto_178881 ) ) ( not ( = ?auto_178879 ?auto_178882 ) ) ( not ( = ?auto_178879 ?auto_178883 ) ) ( not ( = ?auto_178879 ?auto_178884 ) ) ( not ( = ?auto_178879 ?auto_178885 ) ) ( not ( = ?auto_178879 ?auto_178886 ) ) ( not ( = ?auto_178880 ?auto_178881 ) ) ( not ( = ?auto_178880 ?auto_178882 ) ) ( not ( = ?auto_178880 ?auto_178883 ) ) ( not ( = ?auto_178880 ?auto_178884 ) ) ( not ( = ?auto_178880 ?auto_178885 ) ) ( not ( = ?auto_178880 ?auto_178886 ) ) ( not ( = ?auto_178881 ?auto_178882 ) ) ( not ( = ?auto_178881 ?auto_178883 ) ) ( not ( = ?auto_178881 ?auto_178884 ) ) ( not ( = ?auto_178881 ?auto_178885 ) ) ( not ( = ?auto_178881 ?auto_178886 ) ) ( not ( = ?auto_178882 ?auto_178883 ) ) ( not ( = ?auto_178882 ?auto_178884 ) ) ( not ( = ?auto_178882 ?auto_178885 ) ) ( not ( = ?auto_178882 ?auto_178886 ) ) ( not ( = ?auto_178883 ?auto_178884 ) ) ( not ( = ?auto_178883 ?auto_178885 ) ) ( not ( = ?auto_178883 ?auto_178886 ) ) ( not ( = ?auto_178884 ?auto_178885 ) ) ( not ( = ?auto_178884 ?auto_178886 ) ) ( not ( = ?auto_178885 ?auto_178886 ) ) ( ON ?auto_178884 ?auto_178885 ) ( ON ?auto_178883 ?auto_178884 ) ( ON ?auto_178882 ?auto_178883 ) ( ON ?auto_178881 ?auto_178882 ) ( CLEAR ?auto_178879 ) ( ON ?auto_178880 ?auto_178881 ) ( CLEAR ?auto_178880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178877 ?auto_178878 ?auto_178879 ?auto_178880 )
      ( MAKE-9PILE ?auto_178877 ?auto_178878 ?auto_178879 ?auto_178880 ?auto_178881 ?auto_178882 ?auto_178883 ?auto_178884 ?auto_178885 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_178915 - BLOCK
      ?auto_178916 - BLOCK
      ?auto_178917 - BLOCK
      ?auto_178918 - BLOCK
      ?auto_178919 - BLOCK
      ?auto_178920 - BLOCK
      ?auto_178921 - BLOCK
      ?auto_178922 - BLOCK
      ?auto_178923 - BLOCK
    )
    :vars
    (
      ?auto_178924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178923 ?auto_178924 ) ( ON-TABLE ?auto_178915 ) ( ON ?auto_178916 ?auto_178915 ) ( not ( = ?auto_178915 ?auto_178916 ) ) ( not ( = ?auto_178915 ?auto_178917 ) ) ( not ( = ?auto_178915 ?auto_178918 ) ) ( not ( = ?auto_178915 ?auto_178919 ) ) ( not ( = ?auto_178915 ?auto_178920 ) ) ( not ( = ?auto_178915 ?auto_178921 ) ) ( not ( = ?auto_178915 ?auto_178922 ) ) ( not ( = ?auto_178915 ?auto_178923 ) ) ( not ( = ?auto_178915 ?auto_178924 ) ) ( not ( = ?auto_178916 ?auto_178917 ) ) ( not ( = ?auto_178916 ?auto_178918 ) ) ( not ( = ?auto_178916 ?auto_178919 ) ) ( not ( = ?auto_178916 ?auto_178920 ) ) ( not ( = ?auto_178916 ?auto_178921 ) ) ( not ( = ?auto_178916 ?auto_178922 ) ) ( not ( = ?auto_178916 ?auto_178923 ) ) ( not ( = ?auto_178916 ?auto_178924 ) ) ( not ( = ?auto_178917 ?auto_178918 ) ) ( not ( = ?auto_178917 ?auto_178919 ) ) ( not ( = ?auto_178917 ?auto_178920 ) ) ( not ( = ?auto_178917 ?auto_178921 ) ) ( not ( = ?auto_178917 ?auto_178922 ) ) ( not ( = ?auto_178917 ?auto_178923 ) ) ( not ( = ?auto_178917 ?auto_178924 ) ) ( not ( = ?auto_178918 ?auto_178919 ) ) ( not ( = ?auto_178918 ?auto_178920 ) ) ( not ( = ?auto_178918 ?auto_178921 ) ) ( not ( = ?auto_178918 ?auto_178922 ) ) ( not ( = ?auto_178918 ?auto_178923 ) ) ( not ( = ?auto_178918 ?auto_178924 ) ) ( not ( = ?auto_178919 ?auto_178920 ) ) ( not ( = ?auto_178919 ?auto_178921 ) ) ( not ( = ?auto_178919 ?auto_178922 ) ) ( not ( = ?auto_178919 ?auto_178923 ) ) ( not ( = ?auto_178919 ?auto_178924 ) ) ( not ( = ?auto_178920 ?auto_178921 ) ) ( not ( = ?auto_178920 ?auto_178922 ) ) ( not ( = ?auto_178920 ?auto_178923 ) ) ( not ( = ?auto_178920 ?auto_178924 ) ) ( not ( = ?auto_178921 ?auto_178922 ) ) ( not ( = ?auto_178921 ?auto_178923 ) ) ( not ( = ?auto_178921 ?auto_178924 ) ) ( not ( = ?auto_178922 ?auto_178923 ) ) ( not ( = ?auto_178922 ?auto_178924 ) ) ( not ( = ?auto_178923 ?auto_178924 ) ) ( ON ?auto_178922 ?auto_178923 ) ( ON ?auto_178921 ?auto_178922 ) ( ON ?auto_178920 ?auto_178921 ) ( ON ?auto_178919 ?auto_178920 ) ( ON ?auto_178918 ?auto_178919 ) ( CLEAR ?auto_178916 ) ( ON ?auto_178917 ?auto_178918 ) ( CLEAR ?auto_178917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178915 ?auto_178916 ?auto_178917 )
      ( MAKE-9PILE ?auto_178915 ?auto_178916 ?auto_178917 ?auto_178918 ?auto_178919 ?auto_178920 ?auto_178921 ?auto_178922 ?auto_178923 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_178953 - BLOCK
      ?auto_178954 - BLOCK
      ?auto_178955 - BLOCK
      ?auto_178956 - BLOCK
      ?auto_178957 - BLOCK
      ?auto_178958 - BLOCK
      ?auto_178959 - BLOCK
      ?auto_178960 - BLOCK
      ?auto_178961 - BLOCK
    )
    :vars
    (
      ?auto_178962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178961 ?auto_178962 ) ( ON-TABLE ?auto_178953 ) ( not ( = ?auto_178953 ?auto_178954 ) ) ( not ( = ?auto_178953 ?auto_178955 ) ) ( not ( = ?auto_178953 ?auto_178956 ) ) ( not ( = ?auto_178953 ?auto_178957 ) ) ( not ( = ?auto_178953 ?auto_178958 ) ) ( not ( = ?auto_178953 ?auto_178959 ) ) ( not ( = ?auto_178953 ?auto_178960 ) ) ( not ( = ?auto_178953 ?auto_178961 ) ) ( not ( = ?auto_178953 ?auto_178962 ) ) ( not ( = ?auto_178954 ?auto_178955 ) ) ( not ( = ?auto_178954 ?auto_178956 ) ) ( not ( = ?auto_178954 ?auto_178957 ) ) ( not ( = ?auto_178954 ?auto_178958 ) ) ( not ( = ?auto_178954 ?auto_178959 ) ) ( not ( = ?auto_178954 ?auto_178960 ) ) ( not ( = ?auto_178954 ?auto_178961 ) ) ( not ( = ?auto_178954 ?auto_178962 ) ) ( not ( = ?auto_178955 ?auto_178956 ) ) ( not ( = ?auto_178955 ?auto_178957 ) ) ( not ( = ?auto_178955 ?auto_178958 ) ) ( not ( = ?auto_178955 ?auto_178959 ) ) ( not ( = ?auto_178955 ?auto_178960 ) ) ( not ( = ?auto_178955 ?auto_178961 ) ) ( not ( = ?auto_178955 ?auto_178962 ) ) ( not ( = ?auto_178956 ?auto_178957 ) ) ( not ( = ?auto_178956 ?auto_178958 ) ) ( not ( = ?auto_178956 ?auto_178959 ) ) ( not ( = ?auto_178956 ?auto_178960 ) ) ( not ( = ?auto_178956 ?auto_178961 ) ) ( not ( = ?auto_178956 ?auto_178962 ) ) ( not ( = ?auto_178957 ?auto_178958 ) ) ( not ( = ?auto_178957 ?auto_178959 ) ) ( not ( = ?auto_178957 ?auto_178960 ) ) ( not ( = ?auto_178957 ?auto_178961 ) ) ( not ( = ?auto_178957 ?auto_178962 ) ) ( not ( = ?auto_178958 ?auto_178959 ) ) ( not ( = ?auto_178958 ?auto_178960 ) ) ( not ( = ?auto_178958 ?auto_178961 ) ) ( not ( = ?auto_178958 ?auto_178962 ) ) ( not ( = ?auto_178959 ?auto_178960 ) ) ( not ( = ?auto_178959 ?auto_178961 ) ) ( not ( = ?auto_178959 ?auto_178962 ) ) ( not ( = ?auto_178960 ?auto_178961 ) ) ( not ( = ?auto_178960 ?auto_178962 ) ) ( not ( = ?auto_178961 ?auto_178962 ) ) ( ON ?auto_178960 ?auto_178961 ) ( ON ?auto_178959 ?auto_178960 ) ( ON ?auto_178958 ?auto_178959 ) ( ON ?auto_178957 ?auto_178958 ) ( ON ?auto_178956 ?auto_178957 ) ( ON ?auto_178955 ?auto_178956 ) ( CLEAR ?auto_178953 ) ( ON ?auto_178954 ?auto_178955 ) ( CLEAR ?auto_178954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178953 ?auto_178954 )
      ( MAKE-9PILE ?auto_178953 ?auto_178954 ?auto_178955 ?auto_178956 ?auto_178957 ?auto_178958 ?auto_178959 ?auto_178960 ?auto_178961 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_178991 - BLOCK
      ?auto_178992 - BLOCK
      ?auto_178993 - BLOCK
      ?auto_178994 - BLOCK
      ?auto_178995 - BLOCK
      ?auto_178996 - BLOCK
      ?auto_178997 - BLOCK
      ?auto_178998 - BLOCK
      ?auto_178999 - BLOCK
    )
    :vars
    (
      ?auto_179000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178999 ?auto_179000 ) ( not ( = ?auto_178991 ?auto_178992 ) ) ( not ( = ?auto_178991 ?auto_178993 ) ) ( not ( = ?auto_178991 ?auto_178994 ) ) ( not ( = ?auto_178991 ?auto_178995 ) ) ( not ( = ?auto_178991 ?auto_178996 ) ) ( not ( = ?auto_178991 ?auto_178997 ) ) ( not ( = ?auto_178991 ?auto_178998 ) ) ( not ( = ?auto_178991 ?auto_178999 ) ) ( not ( = ?auto_178991 ?auto_179000 ) ) ( not ( = ?auto_178992 ?auto_178993 ) ) ( not ( = ?auto_178992 ?auto_178994 ) ) ( not ( = ?auto_178992 ?auto_178995 ) ) ( not ( = ?auto_178992 ?auto_178996 ) ) ( not ( = ?auto_178992 ?auto_178997 ) ) ( not ( = ?auto_178992 ?auto_178998 ) ) ( not ( = ?auto_178992 ?auto_178999 ) ) ( not ( = ?auto_178992 ?auto_179000 ) ) ( not ( = ?auto_178993 ?auto_178994 ) ) ( not ( = ?auto_178993 ?auto_178995 ) ) ( not ( = ?auto_178993 ?auto_178996 ) ) ( not ( = ?auto_178993 ?auto_178997 ) ) ( not ( = ?auto_178993 ?auto_178998 ) ) ( not ( = ?auto_178993 ?auto_178999 ) ) ( not ( = ?auto_178993 ?auto_179000 ) ) ( not ( = ?auto_178994 ?auto_178995 ) ) ( not ( = ?auto_178994 ?auto_178996 ) ) ( not ( = ?auto_178994 ?auto_178997 ) ) ( not ( = ?auto_178994 ?auto_178998 ) ) ( not ( = ?auto_178994 ?auto_178999 ) ) ( not ( = ?auto_178994 ?auto_179000 ) ) ( not ( = ?auto_178995 ?auto_178996 ) ) ( not ( = ?auto_178995 ?auto_178997 ) ) ( not ( = ?auto_178995 ?auto_178998 ) ) ( not ( = ?auto_178995 ?auto_178999 ) ) ( not ( = ?auto_178995 ?auto_179000 ) ) ( not ( = ?auto_178996 ?auto_178997 ) ) ( not ( = ?auto_178996 ?auto_178998 ) ) ( not ( = ?auto_178996 ?auto_178999 ) ) ( not ( = ?auto_178996 ?auto_179000 ) ) ( not ( = ?auto_178997 ?auto_178998 ) ) ( not ( = ?auto_178997 ?auto_178999 ) ) ( not ( = ?auto_178997 ?auto_179000 ) ) ( not ( = ?auto_178998 ?auto_178999 ) ) ( not ( = ?auto_178998 ?auto_179000 ) ) ( not ( = ?auto_178999 ?auto_179000 ) ) ( ON ?auto_178998 ?auto_178999 ) ( ON ?auto_178997 ?auto_178998 ) ( ON ?auto_178996 ?auto_178997 ) ( ON ?auto_178995 ?auto_178996 ) ( ON ?auto_178994 ?auto_178995 ) ( ON ?auto_178993 ?auto_178994 ) ( ON ?auto_178992 ?auto_178993 ) ( ON ?auto_178991 ?auto_178992 ) ( CLEAR ?auto_178991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_178991 )
      ( MAKE-9PILE ?auto_178991 ?auto_178992 ?auto_178993 ?auto_178994 ?auto_178995 ?auto_178996 ?auto_178997 ?auto_178998 ?auto_178999 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_179030 - BLOCK
      ?auto_179031 - BLOCK
      ?auto_179032 - BLOCK
      ?auto_179033 - BLOCK
      ?auto_179034 - BLOCK
      ?auto_179035 - BLOCK
      ?auto_179036 - BLOCK
      ?auto_179037 - BLOCK
      ?auto_179038 - BLOCK
      ?auto_179039 - BLOCK
    )
    :vars
    (
      ?auto_179040 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_179038 ) ( ON ?auto_179039 ?auto_179040 ) ( CLEAR ?auto_179039 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_179030 ) ( ON ?auto_179031 ?auto_179030 ) ( ON ?auto_179032 ?auto_179031 ) ( ON ?auto_179033 ?auto_179032 ) ( ON ?auto_179034 ?auto_179033 ) ( ON ?auto_179035 ?auto_179034 ) ( ON ?auto_179036 ?auto_179035 ) ( ON ?auto_179037 ?auto_179036 ) ( ON ?auto_179038 ?auto_179037 ) ( not ( = ?auto_179030 ?auto_179031 ) ) ( not ( = ?auto_179030 ?auto_179032 ) ) ( not ( = ?auto_179030 ?auto_179033 ) ) ( not ( = ?auto_179030 ?auto_179034 ) ) ( not ( = ?auto_179030 ?auto_179035 ) ) ( not ( = ?auto_179030 ?auto_179036 ) ) ( not ( = ?auto_179030 ?auto_179037 ) ) ( not ( = ?auto_179030 ?auto_179038 ) ) ( not ( = ?auto_179030 ?auto_179039 ) ) ( not ( = ?auto_179030 ?auto_179040 ) ) ( not ( = ?auto_179031 ?auto_179032 ) ) ( not ( = ?auto_179031 ?auto_179033 ) ) ( not ( = ?auto_179031 ?auto_179034 ) ) ( not ( = ?auto_179031 ?auto_179035 ) ) ( not ( = ?auto_179031 ?auto_179036 ) ) ( not ( = ?auto_179031 ?auto_179037 ) ) ( not ( = ?auto_179031 ?auto_179038 ) ) ( not ( = ?auto_179031 ?auto_179039 ) ) ( not ( = ?auto_179031 ?auto_179040 ) ) ( not ( = ?auto_179032 ?auto_179033 ) ) ( not ( = ?auto_179032 ?auto_179034 ) ) ( not ( = ?auto_179032 ?auto_179035 ) ) ( not ( = ?auto_179032 ?auto_179036 ) ) ( not ( = ?auto_179032 ?auto_179037 ) ) ( not ( = ?auto_179032 ?auto_179038 ) ) ( not ( = ?auto_179032 ?auto_179039 ) ) ( not ( = ?auto_179032 ?auto_179040 ) ) ( not ( = ?auto_179033 ?auto_179034 ) ) ( not ( = ?auto_179033 ?auto_179035 ) ) ( not ( = ?auto_179033 ?auto_179036 ) ) ( not ( = ?auto_179033 ?auto_179037 ) ) ( not ( = ?auto_179033 ?auto_179038 ) ) ( not ( = ?auto_179033 ?auto_179039 ) ) ( not ( = ?auto_179033 ?auto_179040 ) ) ( not ( = ?auto_179034 ?auto_179035 ) ) ( not ( = ?auto_179034 ?auto_179036 ) ) ( not ( = ?auto_179034 ?auto_179037 ) ) ( not ( = ?auto_179034 ?auto_179038 ) ) ( not ( = ?auto_179034 ?auto_179039 ) ) ( not ( = ?auto_179034 ?auto_179040 ) ) ( not ( = ?auto_179035 ?auto_179036 ) ) ( not ( = ?auto_179035 ?auto_179037 ) ) ( not ( = ?auto_179035 ?auto_179038 ) ) ( not ( = ?auto_179035 ?auto_179039 ) ) ( not ( = ?auto_179035 ?auto_179040 ) ) ( not ( = ?auto_179036 ?auto_179037 ) ) ( not ( = ?auto_179036 ?auto_179038 ) ) ( not ( = ?auto_179036 ?auto_179039 ) ) ( not ( = ?auto_179036 ?auto_179040 ) ) ( not ( = ?auto_179037 ?auto_179038 ) ) ( not ( = ?auto_179037 ?auto_179039 ) ) ( not ( = ?auto_179037 ?auto_179040 ) ) ( not ( = ?auto_179038 ?auto_179039 ) ) ( not ( = ?auto_179038 ?auto_179040 ) ) ( not ( = ?auto_179039 ?auto_179040 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_179039 ?auto_179040 )
      ( !STACK ?auto_179039 ?auto_179038 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_179072 - BLOCK
      ?auto_179073 - BLOCK
      ?auto_179074 - BLOCK
      ?auto_179075 - BLOCK
      ?auto_179076 - BLOCK
      ?auto_179077 - BLOCK
      ?auto_179078 - BLOCK
      ?auto_179079 - BLOCK
      ?auto_179080 - BLOCK
      ?auto_179081 - BLOCK
    )
    :vars
    (
      ?auto_179082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179081 ?auto_179082 ) ( ON-TABLE ?auto_179072 ) ( ON ?auto_179073 ?auto_179072 ) ( ON ?auto_179074 ?auto_179073 ) ( ON ?auto_179075 ?auto_179074 ) ( ON ?auto_179076 ?auto_179075 ) ( ON ?auto_179077 ?auto_179076 ) ( ON ?auto_179078 ?auto_179077 ) ( ON ?auto_179079 ?auto_179078 ) ( not ( = ?auto_179072 ?auto_179073 ) ) ( not ( = ?auto_179072 ?auto_179074 ) ) ( not ( = ?auto_179072 ?auto_179075 ) ) ( not ( = ?auto_179072 ?auto_179076 ) ) ( not ( = ?auto_179072 ?auto_179077 ) ) ( not ( = ?auto_179072 ?auto_179078 ) ) ( not ( = ?auto_179072 ?auto_179079 ) ) ( not ( = ?auto_179072 ?auto_179080 ) ) ( not ( = ?auto_179072 ?auto_179081 ) ) ( not ( = ?auto_179072 ?auto_179082 ) ) ( not ( = ?auto_179073 ?auto_179074 ) ) ( not ( = ?auto_179073 ?auto_179075 ) ) ( not ( = ?auto_179073 ?auto_179076 ) ) ( not ( = ?auto_179073 ?auto_179077 ) ) ( not ( = ?auto_179073 ?auto_179078 ) ) ( not ( = ?auto_179073 ?auto_179079 ) ) ( not ( = ?auto_179073 ?auto_179080 ) ) ( not ( = ?auto_179073 ?auto_179081 ) ) ( not ( = ?auto_179073 ?auto_179082 ) ) ( not ( = ?auto_179074 ?auto_179075 ) ) ( not ( = ?auto_179074 ?auto_179076 ) ) ( not ( = ?auto_179074 ?auto_179077 ) ) ( not ( = ?auto_179074 ?auto_179078 ) ) ( not ( = ?auto_179074 ?auto_179079 ) ) ( not ( = ?auto_179074 ?auto_179080 ) ) ( not ( = ?auto_179074 ?auto_179081 ) ) ( not ( = ?auto_179074 ?auto_179082 ) ) ( not ( = ?auto_179075 ?auto_179076 ) ) ( not ( = ?auto_179075 ?auto_179077 ) ) ( not ( = ?auto_179075 ?auto_179078 ) ) ( not ( = ?auto_179075 ?auto_179079 ) ) ( not ( = ?auto_179075 ?auto_179080 ) ) ( not ( = ?auto_179075 ?auto_179081 ) ) ( not ( = ?auto_179075 ?auto_179082 ) ) ( not ( = ?auto_179076 ?auto_179077 ) ) ( not ( = ?auto_179076 ?auto_179078 ) ) ( not ( = ?auto_179076 ?auto_179079 ) ) ( not ( = ?auto_179076 ?auto_179080 ) ) ( not ( = ?auto_179076 ?auto_179081 ) ) ( not ( = ?auto_179076 ?auto_179082 ) ) ( not ( = ?auto_179077 ?auto_179078 ) ) ( not ( = ?auto_179077 ?auto_179079 ) ) ( not ( = ?auto_179077 ?auto_179080 ) ) ( not ( = ?auto_179077 ?auto_179081 ) ) ( not ( = ?auto_179077 ?auto_179082 ) ) ( not ( = ?auto_179078 ?auto_179079 ) ) ( not ( = ?auto_179078 ?auto_179080 ) ) ( not ( = ?auto_179078 ?auto_179081 ) ) ( not ( = ?auto_179078 ?auto_179082 ) ) ( not ( = ?auto_179079 ?auto_179080 ) ) ( not ( = ?auto_179079 ?auto_179081 ) ) ( not ( = ?auto_179079 ?auto_179082 ) ) ( not ( = ?auto_179080 ?auto_179081 ) ) ( not ( = ?auto_179080 ?auto_179082 ) ) ( not ( = ?auto_179081 ?auto_179082 ) ) ( CLEAR ?auto_179079 ) ( ON ?auto_179080 ?auto_179081 ) ( CLEAR ?auto_179080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_179072 ?auto_179073 ?auto_179074 ?auto_179075 ?auto_179076 ?auto_179077 ?auto_179078 ?auto_179079 ?auto_179080 )
      ( MAKE-10PILE ?auto_179072 ?auto_179073 ?auto_179074 ?auto_179075 ?auto_179076 ?auto_179077 ?auto_179078 ?auto_179079 ?auto_179080 ?auto_179081 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_179114 - BLOCK
      ?auto_179115 - BLOCK
      ?auto_179116 - BLOCK
      ?auto_179117 - BLOCK
      ?auto_179118 - BLOCK
      ?auto_179119 - BLOCK
      ?auto_179120 - BLOCK
      ?auto_179121 - BLOCK
      ?auto_179122 - BLOCK
      ?auto_179123 - BLOCK
    )
    :vars
    (
      ?auto_179124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179123 ?auto_179124 ) ( ON-TABLE ?auto_179114 ) ( ON ?auto_179115 ?auto_179114 ) ( ON ?auto_179116 ?auto_179115 ) ( ON ?auto_179117 ?auto_179116 ) ( ON ?auto_179118 ?auto_179117 ) ( ON ?auto_179119 ?auto_179118 ) ( ON ?auto_179120 ?auto_179119 ) ( not ( = ?auto_179114 ?auto_179115 ) ) ( not ( = ?auto_179114 ?auto_179116 ) ) ( not ( = ?auto_179114 ?auto_179117 ) ) ( not ( = ?auto_179114 ?auto_179118 ) ) ( not ( = ?auto_179114 ?auto_179119 ) ) ( not ( = ?auto_179114 ?auto_179120 ) ) ( not ( = ?auto_179114 ?auto_179121 ) ) ( not ( = ?auto_179114 ?auto_179122 ) ) ( not ( = ?auto_179114 ?auto_179123 ) ) ( not ( = ?auto_179114 ?auto_179124 ) ) ( not ( = ?auto_179115 ?auto_179116 ) ) ( not ( = ?auto_179115 ?auto_179117 ) ) ( not ( = ?auto_179115 ?auto_179118 ) ) ( not ( = ?auto_179115 ?auto_179119 ) ) ( not ( = ?auto_179115 ?auto_179120 ) ) ( not ( = ?auto_179115 ?auto_179121 ) ) ( not ( = ?auto_179115 ?auto_179122 ) ) ( not ( = ?auto_179115 ?auto_179123 ) ) ( not ( = ?auto_179115 ?auto_179124 ) ) ( not ( = ?auto_179116 ?auto_179117 ) ) ( not ( = ?auto_179116 ?auto_179118 ) ) ( not ( = ?auto_179116 ?auto_179119 ) ) ( not ( = ?auto_179116 ?auto_179120 ) ) ( not ( = ?auto_179116 ?auto_179121 ) ) ( not ( = ?auto_179116 ?auto_179122 ) ) ( not ( = ?auto_179116 ?auto_179123 ) ) ( not ( = ?auto_179116 ?auto_179124 ) ) ( not ( = ?auto_179117 ?auto_179118 ) ) ( not ( = ?auto_179117 ?auto_179119 ) ) ( not ( = ?auto_179117 ?auto_179120 ) ) ( not ( = ?auto_179117 ?auto_179121 ) ) ( not ( = ?auto_179117 ?auto_179122 ) ) ( not ( = ?auto_179117 ?auto_179123 ) ) ( not ( = ?auto_179117 ?auto_179124 ) ) ( not ( = ?auto_179118 ?auto_179119 ) ) ( not ( = ?auto_179118 ?auto_179120 ) ) ( not ( = ?auto_179118 ?auto_179121 ) ) ( not ( = ?auto_179118 ?auto_179122 ) ) ( not ( = ?auto_179118 ?auto_179123 ) ) ( not ( = ?auto_179118 ?auto_179124 ) ) ( not ( = ?auto_179119 ?auto_179120 ) ) ( not ( = ?auto_179119 ?auto_179121 ) ) ( not ( = ?auto_179119 ?auto_179122 ) ) ( not ( = ?auto_179119 ?auto_179123 ) ) ( not ( = ?auto_179119 ?auto_179124 ) ) ( not ( = ?auto_179120 ?auto_179121 ) ) ( not ( = ?auto_179120 ?auto_179122 ) ) ( not ( = ?auto_179120 ?auto_179123 ) ) ( not ( = ?auto_179120 ?auto_179124 ) ) ( not ( = ?auto_179121 ?auto_179122 ) ) ( not ( = ?auto_179121 ?auto_179123 ) ) ( not ( = ?auto_179121 ?auto_179124 ) ) ( not ( = ?auto_179122 ?auto_179123 ) ) ( not ( = ?auto_179122 ?auto_179124 ) ) ( not ( = ?auto_179123 ?auto_179124 ) ) ( ON ?auto_179122 ?auto_179123 ) ( CLEAR ?auto_179120 ) ( ON ?auto_179121 ?auto_179122 ) ( CLEAR ?auto_179121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_179114 ?auto_179115 ?auto_179116 ?auto_179117 ?auto_179118 ?auto_179119 ?auto_179120 ?auto_179121 )
      ( MAKE-10PILE ?auto_179114 ?auto_179115 ?auto_179116 ?auto_179117 ?auto_179118 ?auto_179119 ?auto_179120 ?auto_179121 ?auto_179122 ?auto_179123 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_179156 - BLOCK
      ?auto_179157 - BLOCK
      ?auto_179158 - BLOCK
      ?auto_179159 - BLOCK
      ?auto_179160 - BLOCK
      ?auto_179161 - BLOCK
      ?auto_179162 - BLOCK
      ?auto_179163 - BLOCK
      ?auto_179164 - BLOCK
      ?auto_179165 - BLOCK
    )
    :vars
    (
      ?auto_179166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179165 ?auto_179166 ) ( ON-TABLE ?auto_179156 ) ( ON ?auto_179157 ?auto_179156 ) ( ON ?auto_179158 ?auto_179157 ) ( ON ?auto_179159 ?auto_179158 ) ( ON ?auto_179160 ?auto_179159 ) ( ON ?auto_179161 ?auto_179160 ) ( not ( = ?auto_179156 ?auto_179157 ) ) ( not ( = ?auto_179156 ?auto_179158 ) ) ( not ( = ?auto_179156 ?auto_179159 ) ) ( not ( = ?auto_179156 ?auto_179160 ) ) ( not ( = ?auto_179156 ?auto_179161 ) ) ( not ( = ?auto_179156 ?auto_179162 ) ) ( not ( = ?auto_179156 ?auto_179163 ) ) ( not ( = ?auto_179156 ?auto_179164 ) ) ( not ( = ?auto_179156 ?auto_179165 ) ) ( not ( = ?auto_179156 ?auto_179166 ) ) ( not ( = ?auto_179157 ?auto_179158 ) ) ( not ( = ?auto_179157 ?auto_179159 ) ) ( not ( = ?auto_179157 ?auto_179160 ) ) ( not ( = ?auto_179157 ?auto_179161 ) ) ( not ( = ?auto_179157 ?auto_179162 ) ) ( not ( = ?auto_179157 ?auto_179163 ) ) ( not ( = ?auto_179157 ?auto_179164 ) ) ( not ( = ?auto_179157 ?auto_179165 ) ) ( not ( = ?auto_179157 ?auto_179166 ) ) ( not ( = ?auto_179158 ?auto_179159 ) ) ( not ( = ?auto_179158 ?auto_179160 ) ) ( not ( = ?auto_179158 ?auto_179161 ) ) ( not ( = ?auto_179158 ?auto_179162 ) ) ( not ( = ?auto_179158 ?auto_179163 ) ) ( not ( = ?auto_179158 ?auto_179164 ) ) ( not ( = ?auto_179158 ?auto_179165 ) ) ( not ( = ?auto_179158 ?auto_179166 ) ) ( not ( = ?auto_179159 ?auto_179160 ) ) ( not ( = ?auto_179159 ?auto_179161 ) ) ( not ( = ?auto_179159 ?auto_179162 ) ) ( not ( = ?auto_179159 ?auto_179163 ) ) ( not ( = ?auto_179159 ?auto_179164 ) ) ( not ( = ?auto_179159 ?auto_179165 ) ) ( not ( = ?auto_179159 ?auto_179166 ) ) ( not ( = ?auto_179160 ?auto_179161 ) ) ( not ( = ?auto_179160 ?auto_179162 ) ) ( not ( = ?auto_179160 ?auto_179163 ) ) ( not ( = ?auto_179160 ?auto_179164 ) ) ( not ( = ?auto_179160 ?auto_179165 ) ) ( not ( = ?auto_179160 ?auto_179166 ) ) ( not ( = ?auto_179161 ?auto_179162 ) ) ( not ( = ?auto_179161 ?auto_179163 ) ) ( not ( = ?auto_179161 ?auto_179164 ) ) ( not ( = ?auto_179161 ?auto_179165 ) ) ( not ( = ?auto_179161 ?auto_179166 ) ) ( not ( = ?auto_179162 ?auto_179163 ) ) ( not ( = ?auto_179162 ?auto_179164 ) ) ( not ( = ?auto_179162 ?auto_179165 ) ) ( not ( = ?auto_179162 ?auto_179166 ) ) ( not ( = ?auto_179163 ?auto_179164 ) ) ( not ( = ?auto_179163 ?auto_179165 ) ) ( not ( = ?auto_179163 ?auto_179166 ) ) ( not ( = ?auto_179164 ?auto_179165 ) ) ( not ( = ?auto_179164 ?auto_179166 ) ) ( not ( = ?auto_179165 ?auto_179166 ) ) ( ON ?auto_179164 ?auto_179165 ) ( ON ?auto_179163 ?auto_179164 ) ( CLEAR ?auto_179161 ) ( ON ?auto_179162 ?auto_179163 ) ( CLEAR ?auto_179162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179156 ?auto_179157 ?auto_179158 ?auto_179159 ?auto_179160 ?auto_179161 ?auto_179162 )
      ( MAKE-10PILE ?auto_179156 ?auto_179157 ?auto_179158 ?auto_179159 ?auto_179160 ?auto_179161 ?auto_179162 ?auto_179163 ?auto_179164 ?auto_179165 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_179198 - BLOCK
      ?auto_179199 - BLOCK
      ?auto_179200 - BLOCK
      ?auto_179201 - BLOCK
      ?auto_179202 - BLOCK
      ?auto_179203 - BLOCK
      ?auto_179204 - BLOCK
      ?auto_179205 - BLOCK
      ?auto_179206 - BLOCK
      ?auto_179207 - BLOCK
    )
    :vars
    (
      ?auto_179208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179207 ?auto_179208 ) ( ON-TABLE ?auto_179198 ) ( ON ?auto_179199 ?auto_179198 ) ( ON ?auto_179200 ?auto_179199 ) ( ON ?auto_179201 ?auto_179200 ) ( ON ?auto_179202 ?auto_179201 ) ( not ( = ?auto_179198 ?auto_179199 ) ) ( not ( = ?auto_179198 ?auto_179200 ) ) ( not ( = ?auto_179198 ?auto_179201 ) ) ( not ( = ?auto_179198 ?auto_179202 ) ) ( not ( = ?auto_179198 ?auto_179203 ) ) ( not ( = ?auto_179198 ?auto_179204 ) ) ( not ( = ?auto_179198 ?auto_179205 ) ) ( not ( = ?auto_179198 ?auto_179206 ) ) ( not ( = ?auto_179198 ?auto_179207 ) ) ( not ( = ?auto_179198 ?auto_179208 ) ) ( not ( = ?auto_179199 ?auto_179200 ) ) ( not ( = ?auto_179199 ?auto_179201 ) ) ( not ( = ?auto_179199 ?auto_179202 ) ) ( not ( = ?auto_179199 ?auto_179203 ) ) ( not ( = ?auto_179199 ?auto_179204 ) ) ( not ( = ?auto_179199 ?auto_179205 ) ) ( not ( = ?auto_179199 ?auto_179206 ) ) ( not ( = ?auto_179199 ?auto_179207 ) ) ( not ( = ?auto_179199 ?auto_179208 ) ) ( not ( = ?auto_179200 ?auto_179201 ) ) ( not ( = ?auto_179200 ?auto_179202 ) ) ( not ( = ?auto_179200 ?auto_179203 ) ) ( not ( = ?auto_179200 ?auto_179204 ) ) ( not ( = ?auto_179200 ?auto_179205 ) ) ( not ( = ?auto_179200 ?auto_179206 ) ) ( not ( = ?auto_179200 ?auto_179207 ) ) ( not ( = ?auto_179200 ?auto_179208 ) ) ( not ( = ?auto_179201 ?auto_179202 ) ) ( not ( = ?auto_179201 ?auto_179203 ) ) ( not ( = ?auto_179201 ?auto_179204 ) ) ( not ( = ?auto_179201 ?auto_179205 ) ) ( not ( = ?auto_179201 ?auto_179206 ) ) ( not ( = ?auto_179201 ?auto_179207 ) ) ( not ( = ?auto_179201 ?auto_179208 ) ) ( not ( = ?auto_179202 ?auto_179203 ) ) ( not ( = ?auto_179202 ?auto_179204 ) ) ( not ( = ?auto_179202 ?auto_179205 ) ) ( not ( = ?auto_179202 ?auto_179206 ) ) ( not ( = ?auto_179202 ?auto_179207 ) ) ( not ( = ?auto_179202 ?auto_179208 ) ) ( not ( = ?auto_179203 ?auto_179204 ) ) ( not ( = ?auto_179203 ?auto_179205 ) ) ( not ( = ?auto_179203 ?auto_179206 ) ) ( not ( = ?auto_179203 ?auto_179207 ) ) ( not ( = ?auto_179203 ?auto_179208 ) ) ( not ( = ?auto_179204 ?auto_179205 ) ) ( not ( = ?auto_179204 ?auto_179206 ) ) ( not ( = ?auto_179204 ?auto_179207 ) ) ( not ( = ?auto_179204 ?auto_179208 ) ) ( not ( = ?auto_179205 ?auto_179206 ) ) ( not ( = ?auto_179205 ?auto_179207 ) ) ( not ( = ?auto_179205 ?auto_179208 ) ) ( not ( = ?auto_179206 ?auto_179207 ) ) ( not ( = ?auto_179206 ?auto_179208 ) ) ( not ( = ?auto_179207 ?auto_179208 ) ) ( ON ?auto_179206 ?auto_179207 ) ( ON ?auto_179205 ?auto_179206 ) ( ON ?auto_179204 ?auto_179205 ) ( CLEAR ?auto_179202 ) ( ON ?auto_179203 ?auto_179204 ) ( CLEAR ?auto_179203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_179198 ?auto_179199 ?auto_179200 ?auto_179201 ?auto_179202 ?auto_179203 )
      ( MAKE-10PILE ?auto_179198 ?auto_179199 ?auto_179200 ?auto_179201 ?auto_179202 ?auto_179203 ?auto_179204 ?auto_179205 ?auto_179206 ?auto_179207 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_179240 - BLOCK
      ?auto_179241 - BLOCK
      ?auto_179242 - BLOCK
      ?auto_179243 - BLOCK
      ?auto_179244 - BLOCK
      ?auto_179245 - BLOCK
      ?auto_179246 - BLOCK
      ?auto_179247 - BLOCK
      ?auto_179248 - BLOCK
      ?auto_179249 - BLOCK
    )
    :vars
    (
      ?auto_179250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179249 ?auto_179250 ) ( ON-TABLE ?auto_179240 ) ( ON ?auto_179241 ?auto_179240 ) ( ON ?auto_179242 ?auto_179241 ) ( ON ?auto_179243 ?auto_179242 ) ( not ( = ?auto_179240 ?auto_179241 ) ) ( not ( = ?auto_179240 ?auto_179242 ) ) ( not ( = ?auto_179240 ?auto_179243 ) ) ( not ( = ?auto_179240 ?auto_179244 ) ) ( not ( = ?auto_179240 ?auto_179245 ) ) ( not ( = ?auto_179240 ?auto_179246 ) ) ( not ( = ?auto_179240 ?auto_179247 ) ) ( not ( = ?auto_179240 ?auto_179248 ) ) ( not ( = ?auto_179240 ?auto_179249 ) ) ( not ( = ?auto_179240 ?auto_179250 ) ) ( not ( = ?auto_179241 ?auto_179242 ) ) ( not ( = ?auto_179241 ?auto_179243 ) ) ( not ( = ?auto_179241 ?auto_179244 ) ) ( not ( = ?auto_179241 ?auto_179245 ) ) ( not ( = ?auto_179241 ?auto_179246 ) ) ( not ( = ?auto_179241 ?auto_179247 ) ) ( not ( = ?auto_179241 ?auto_179248 ) ) ( not ( = ?auto_179241 ?auto_179249 ) ) ( not ( = ?auto_179241 ?auto_179250 ) ) ( not ( = ?auto_179242 ?auto_179243 ) ) ( not ( = ?auto_179242 ?auto_179244 ) ) ( not ( = ?auto_179242 ?auto_179245 ) ) ( not ( = ?auto_179242 ?auto_179246 ) ) ( not ( = ?auto_179242 ?auto_179247 ) ) ( not ( = ?auto_179242 ?auto_179248 ) ) ( not ( = ?auto_179242 ?auto_179249 ) ) ( not ( = ?auto_179242 ?auto_179250 ) ) ( not ( = ?auto_179243 ?auto_179244 ) ) ( not ( = ?auto_179243 ?auto_179245 ) ) ( not ( = ?auto_179243 ?auto_179246 ) ) ( not ( = ?auto_179243 ?auto_179247 ) ) ( not ( = ?auto_179243 ?auto_179248 ) ) ( not ( = ?auto_179243 ?auto_179249 ) ) ( not ( = ?auto_179243 ?auto_179250 ) ) ( not ( = ?auto_179244 ?auto_179245 ) ) ( not ( = ?auto_179244 ?auto_179246 ) ) ( not ( = ?auto_179244 ?auto_179247 ) ) ( not ( = ?auto_179244 ?auto_179248 ) ) ( not ( = ?auto_179244 ?auto_179249 ) ) ( not ( = ?auto_179244 ?auto_179250 ) ) ( not ( = ?auto_179245 ?auto_179246 ) ) ( not ( = ?auto_179245 ?auto_179247 ) ) ( not ( = ?auto_179245 ?auto_179248 ) ) ( not ( = ?auto_179245 ?auto_179249 ) ) ( not ( = ?auto_179245 ?auto_179250 ) ) ( not ( = ?auto_179246 ?auto_179247 ) ) ( not ( = ?auto_179246 ?auto_179248 ) ) ( not ( = ?auto_179246 ?auto_179249 ) ) ( not ( = ?auto_179246 ?auto_179250 ) ) ( not ( = ?auto_179247 ?auto_179248 ) ) ( not ( = ?auto_179247 ?auto_179249 ) ) ( not ( = ?auto_179247 ?auto_179250 ) ) ( not ( = ?auto_179248 ?auto_179249 ) ) ( not ( = ?auto_179248 ?auto_179250 ) ) ( not ( = ?auto_179249 ?auto_179250 ) ) ( ON ?auto_179248 ?auto_179249 ) ( ON ?auto_179247 ?auto_179248 ) ( ON ?auto_179246 ?auto_179247 ) ( ON ?auto_179245 ?auto_179246 ) ( CLEAR ?auto_179243 ) ( ON ?auto_179244 ?auto_179245 ) ( CLEAR ?auto_179244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_179240 ?auto_179241 ?auto_179242 ?auto_179243 ?auto_179244 )
      ( MAKE-10PILE ?auto_179240 ?auto_179241 ?auto_179242 ?auto_179243 ?auto_179244 ?auto_179245 ?auto_179246 ?auto_179247 ?auto_179248 ?auto_179249 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_179282 - BLOCK
      ?auto_179283 - BLOCK
      ?auto_179284 - BLOCK
      ?auto_179285 - BLOCK
      ?auto_179286 - BLOCK
      ?auto_179287 - BLOCK
      ?auto_179288 - BLOCK
      ?auto_179289 - BLOCK
      ?auto_179290 - BLOCK
      ?auto_179291 - BLOCK
    )
    :vars
    (
      ?auto_179292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179291 ?auto_179292 ) ( ON-TABLE ?auto_179282 ) ( ON ?auto_179283 ?auto_179282 ) ( ON ?auto_179284 ?auto_179283 ) ( not ( = ?auto_179282 ?auto_179283 ) ) ( not ( = ?auto_179282 ?auto_179284 ) ) ( not ( = ?auto_179282 ?auto_179285 ) ) ( not ( = ?auto_179282 ?auto_179286 ) ) ( not ( = ?auto_179282 ?auto_179287 ) ) ( not ( = ?auto_179282 ?auto_179288 ) ) ( not ( = ?auto_179282 ?auto_179289 ) ) ( not ( = ?auto_179282 ?auto_179290 ) ) ( not ( = ?auto_179282 ?auto_179291 ) ) ( not ( = ?auto_179282 ?auto_179292 ) ) ( not ( = ?auto_179283 ?auto_179284 ) ) ( not ( = ?auto_179283 ?auto_179285 ) ) ( not ( = ?auto_179283 ?auto_179286 ) ) ( not ( = ?auto_179283 ?auto_179287 ) ) ( not ( = ?auto_179283 ?auto_179288 ) ) ( not ( = ?auto_179283 ?auto_179289 ) ) ( not ( = ?auto_179283 ?auto_179290 ) ) ( not ( = ?auto_179283 ?auto_179291 ) ) ( not ( = ?auto_179283 ?auto_179292 ) ) ( not ( = ?auto_179284 ?auto_179285 ) ) ( not ( = ?auto_179284 ?auto_179286 ) ) ( not ( = ?auto_179284 ?auto_179287 ) ) ( not ( = ?auto_179284 ?auto_179288 ) ) ( not ( = ?auto_179284 ?auto_179289 ) ) ( not ( = ?auto_179284 ?auto_179290 ) ) ( not ( = ?auto_179284 ?auto_179291 ) ) ( not ( = ?auto_179284 ?auto_179292 ) ) ( not ( = ?auto_179285 ?auto_179286 ) ) ( not ( = ?auto_179285 ?auto_179287 ) ) ( not ( = ?auto_179285 ?auto_179288 ) ) ( not ( = ?auto_179285 ?auto_179289 ) ) ( not ( = ?auto_179285 ?auto_179290 ) ) ( not ( = ?auto_179285 ?auto_179291 ) ) ( not ( = ?auto_179285 ?auto_179292 ) ) ( not ( = ?auto_179286 ?auto_179287 ) ) ( not ( = ?auto_179286 ?auto_179288 ) ) ( not ( = ?auto_179286 ?auto_179289 ) ) ( not ( = ?auto_179286 ?auto_179290 ) ) ( not ( = ?auto_179286 ?auto_179291 ) ) ( not ( = ?auto_179286 ?auto_179292 ) ) ( not ( = ?auto_179287 ?auto_179288 ) ) ( not ( = ?auto_179287 ?auto_179289 ) ) ( not ( = ?auto_179287 ?auto_179290 ) ) ( not ( = ?auto_179287 ?auto_179291 ) ) ( not ( = ?auto_179287 ?auto_179292 ) ) ( not ( = ?auto_179288 ?auto_179289 ) ) ( not ( = ?auto_179288 ?auto_179290 ) ) ( not ( = ?auto_179288 ?auto_179291 ) ) ( not ( = ?auto_179288 ?auto_179292 ) ) ( not ( = ?auto_179289 ?auto_179290 ) ) ( not ( = ?auto_179289 ?auto_179291 ) ) ( not ( = ?auto_179289 ?auto_179292 ) ) ( not ( = ?auto_179290 ?auto_179291 ) ) ( not ( = ?auto_179290 ?auto_179292 ) ) ( not ( = ?auto_179291 ?auto_179292 ) ) ( ON ?auto_179290 ?auto_179291 ) ( ON ?auto_179289 ?auto_179290 ) ( ON ?auto_179288 ?auto_179289 ) ( ON ?auto_179287 ?auto_179288 ) ( ON ?auto_179286 ?auto_179287 ) ( CLEAR ?auto_179284 ) ( ON ?auto_179285 ?auto_179286 ) ( CLEAR ?auto_179285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179282 ?auto_179283 ?auto_179284 ?auto_179285 )
      ( MAKE-10PILE ?auto_179282 ?auto_179283 ?auto_179284 ?auto_179285 ?auto_179286 ?auto_179287 ?auto_179288 ?auto_179289 ?auto_179290 ?auto_179291 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_179324 - BLOCK
      ?auto_179325 - BLOCK
      ?auto_179326 - BLOCK
      ?auto_179327 - BLOCK
      ?auto_179328 - BLOCK
      ?auto_179329 - BLOCK
      ?auto_179330 - BLOCK
      ?auto_179331 - BLOCK
      ?auto_179332 - BLOCK
      ?auto_179333 - BLOCK
    )
    :vars
    (
      ?auto_179334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179333 ?auto_179334 ) ( ON-TABLE ?auto_179324 ) ( ON ?auto_179325 ?auto_179324 ) ( not ( = ?auto_179324 ?auto_179325 ) ) ( not ( = ?auto_179324 ?auto_179326 ) ) ( not ( = ?auto_179324 ?auto_179327 ) ) ( not ( = ?auto_179324 ?auto_179328 ) ) ( not ( = ?auto_179324 ?auto_179329 ) ) ( not ( = ?auto_179324 ?auto_179330 ) ) ( not ( = ?auto_179324 ?auto_179331 ) ) ( not ( = ?auto_179324 ?auto_179332 ) ) ( not ( = ?auto_179324 ?auto_179333 ) ) ( not ( = ?auto_179324 ?auto_179334 ) ) ( not ( = ?auto_179325 ?auto_179326 ) ) ( not ( = ?auto_179325 ?auto_179327 ) ) ( not ( = ?auto_179325 ?auto_179328 ) ) ( not ( = ?auto_179325 ?auto_179329 ) ) ( not ( = ?auto_179325 ?auto_179330 ) ) ( not ( = ?auto_179325 ?auto_179331 ) ) ( not ( = ?auto_179325 ?auto_179332 ) ) ( not ( = ?auto_179325 ?auto_179333 ) ) ( not ( = ?auto_179325 ?auto_179334 ) ) ( not ( = ?auto_179326 ?auto_179327 ) ) ( not ( = ?auto_179326 ?auto_179328 ) ) ( not ( = ?auto_179326 ?auto_179329 ) ) ( not ( = ?auto_179326 ?auto_179330 ) ) ( not ( = ?auto_179326 ?auto_179331 ) ) ( not ( = ?auto_179326 ?auto_179332 ) ) ( not ( = ?auto_179326 ?auto_179333 ) ) ( not ( = ?auto_179326 ?auto_179334 ) ) ( not ( = ?auto_179327 ?auto_179328 ) ) ( not ( = ?auto_179327 ?auto_179329 ) ) ( not ( = ?auto_179327 ?auto_179330 ) ) ( not ( = ?auto_179327 ?auto_179331 ) ) ( not ( = ?auto_179327 ?auto_179332 ) ) ( not ( = ?auto_179327 ?auto_179333 ) ) ( not ( = ?auto_179327 ?auto_179334 ) ) ( not ( = ?auto_179328 ?auto_179329 ) ) ( not ( = ?auto_179328 ?auto_179330 ) ) ( not ( = ?auto_179328 ?auto_179331 ) ) ( not ( = ?auto_179328 ?auto_179332 ) ) ( not ( = ?auto_179328 ?auto_179333 ) ) ( not ( = ?auto_179328 ?auto_179334 ) ) ( not ( = ?auto_179329 ?auto_179330 ) ) ( not ( = ?auto_179329 ?auto_179331 ) ) ( not ( = ?auto_179329 ?auto_179332 ) ) ( not ( = ?auto_179329 ?auto_179333 ) ) ( not ( = ?auto_179329 ?auto_179334 ) ) ( not ( = ?auto_179330 ?auto_179331 ) ) ( not ( = ?auto_179330 ?auto_179332 ) ) ( not ( = ?auto_179330 ?auto_179333 ) ) ( not ( = ?auto_179330 ?auto_179334 ) ) ( not ( = ?auto_179331 ?auto_179332 ) ) ( not ( = ?auto_179331 ?auto_179333 ) ) ( not ( = ?auto_179331 ?auto_179334 ) ) ( not ( = ?auto_179332 ?auto_179333 ) ) ( not ( = ?auto_179332 ?auto_179334 ) ) ( not ( = ?auto_179333 ?auto_179334 ) ) ( ON ?auto_179332 ?auto_179333 ) ( ON ?auto_179331 ?auto_179332 ) ( ON ?auto_179330 ?auto_179331 ) ( ON ?auto_179329 ?auto_179330 ) ( ON ?auto_179328 ?auto_179329 ) ( ON ?auto_179327 ?auto_179328 ) ( CLEAR ?auto_179325 ) ( ON ?auto_179326 ?auto_179327 ) ( CLEAR ?auto_179326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179324 ?auto_179325 ?auto_179326 )
      ( MAKE-10PILE ?auto_179324 ?auto_179325 ?auto_179326 ?auto_179327 ?auto_179328 ?auto_179329 ?auto_179330 ?auto_179331 ?auto_179332 ?auto_179333 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_179366 - BLOCK
      ?auto_179367 - BLOCK
      ?auto_179368 - BLOCK
      ?auto_179369 - BLOCK
      ?auto_179370 - BLOCK
      ?auto_179371 - BLOCK
      ?auto_179372 - BLOCK
      ?auto_179373 - BLOCK
      ?auto_179374 - BLOCK
      ?auto_179375 - BLOCK
    )
    :vars
    (
      ?auto_179376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179375 ?auto_179376 ) ( ON-TABLE ?auto_179366 ) ( not ( = ?auto_179366 ?auto_179367 ) ) ( not ( = ?auto_179366 ?auto_179368 ) ) ( not ( = ?auto_179366 ?auto_179369 ) ) ( not ( = ?auto_179366 ?auto_179370 ) ) ( not ( = ?auto_179366 ?auto_179371 ) ) ( not ( = ?auto_179366 ?auto_179372 ) ) ( not ( = ?auto_179366 ?auto_179373 ) ) ( not ( = ?auto_179366 ?auto_179374 ) ) ( not ( = ?auto_179366 ?auto_179375 ) ) ( not ( = ?auto_179366 ?auto_179376 ) ) ( not ( = ?auto_179367 ?auto_179368 ) ) ( not ( = ?auto_179367 ?auto_179369 ) ) ( not ( = ?auto_179367 ?auto_179370 ) ) ( not ( = ?auto_179367 ?auto_179371 ) ) ( not ( = ?auto_179367 ?auto_179372 ) ) ( not ( = ?auto_179367 ?auto_179373 ) ) ( not ( = ?auto_179367 ?auto_179374 ) ) ( not ( = ?auto_179367 ?auto_179375 ) ) ( not ( = ?auto_179367 ?auto_179376 ) ) ( not ( = ?auto_179368 ?auto_179369 ) ) ( not ( = ?auto_179368 ?auto_179370 ) ) ( not ( = ?auto_179368 ?auto_179371 ) ) ( not ( = ?auto_179368 ?auto_179372 ) ) ( not ( = ?auto_179368 ?auto_179373 ) ) ( not ( = ?auto_179368 ?auto_179374 ) ) ( not ( = ?auto_179368 ?auto_179375 ) ) ( not ( = ?auto_179368 ?auto_179376 ) ) ( not ( = ?auto_179369 ?auto_179370 ) ) ( not ( = ?auto_179369 ?auto_179371 ) ) ( not ( = ?auto_179369 ?auto_179372 ) ) ( not ( = ?auto_179369 ?auto_179373 ) ) ( not ( = ?auto_179369 ?auto_179374 ) ) ( not ( = ?auto_179369 ?auto_179375 ) ) ( not ( = ?auto_179369 ?auto_179376 ) ) ( not ( = ?auto_179370 ?auto_179371 ) ) ( not ( = ?auto_179370 ?auto_179372 ) ) ( not ( = ?auto_179370 ?auto_179373 ) ) ( not ( = ?auto_179370 ?auto_179374 ) ) ( not ( = ?auto_179370 ?auto_179375 ) ) ( not ( = ?auto_179370 ?auto_179376 ) ) ( not ( = ?auto_179371 ?auto_179372 ) ) ( not ( = ?auto_179371 ?auto_179373 ) ) ( not ( = ?auto_179371 ?auto_179374 ) ) ( not ( = ?auto_179371 ?auto_179375 ) ) ( not ( = ?auto_179371 ?auto_179376 ) ) ( not ( = ?auto_179372 ?auto_179373 ) ) ( not ( = ?auto_179372 ?auto_179374 ) ) ( not ( = ?auto_179372 ?auto_179375 ) ) ( not ( = ?auto_179372 ?auto_179376 ) ) ( not ( = ?auto_179373 ?auto_179374 ) ) ( not ( = ?auto_179373 ?auto_179375 ) ) ( not ( = ?auto_179373 ?auto_179376 ) ) ( not ( = ?auto_179374 ?auto_179375 ) ) ( not ( = ?auto_179374 ?auto_179376 ) ) ( not ( = ?auto_179375 ?auto_179376 ) ) ( ON ?auto_179374 ?auto_179375 ) ( ON ?auto_179373 ?auto_179374 ) ( ON ?auto_179372 ?auto_179373 ) ( ON ?auto_179371 ?auto_179372 ) ( ON ?auto_179370 ?auto_179371 ) ( ON ?auto_179369 ?auto_179370 ) ( ON ?auto_179368 ?auto_179369 ) ( CLEAR ?auto_179366 ) ( ON ?auto_179367 ?auto_179368 ) ( CLEAR ?auto_179367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179366 ?auto_179367 )
      ( MAKE-10PILE ?auto_179366 ?auto_179367 ?auto_179368 ?auto_179369 ?auto_179370 ?auto_179371 ?auto_179372 ?auto_179373 ?auto_179374 ?auto_179375 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_179408 - BLOCK
      ?auto_179409 - BLOCK
      ?auto_179410 - BLOCK
      ?auto_179411 - BLOCK
      ?auto_179412 - BLOCK
      ?auto_179413 - BLOCK
      ?auto_179414 - BLOCK
      ?auto_179415 - BLOCK
      ?auto_179416 - BLOCK
      ?auto_179417 - BLOCK
    )
    :vars
    (
      ?auto_179418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179417 ?auto_179418 ) ( not ( = ?auto_179408 ?auto_179409 ) ) ( not ( = ?auto_179408 ?auto_179410 ) ) ( not ( = ?auto_179408 ?auto_179411 ) ) ( not ( = ?auto_179408 ?auto_179412 ) ) ( not ( = ?auto_179408 ?auto_179413 ) ) ( not ( = ?auto_179408 ?auto_179414 ) ) ( not ( = ?auto_179408 ?auto_179415 ) ) ( not ( = ?auto_179408 ?auto_179416 ) ) ( not ( = ?auto_179408 ?auto_179417 ) ) ( not ( = ?auto_179408 ?auto_179418 ) ) ( not ( = ?auto_179409 ?auto_179410 ) ) ( not ( = ?auto_179409 ?auto_179411 ) ) ( not ( = ?auto_179409 ?auto_179412 ) ) ( not ( = ?auto_179409 ?auto_179413 ) ) ( not ( = ?auto_179409 ?auto_179414 ) ) ( not ( = ?auto_179409 ?auto_179415 ) ) ( not ( = ?auto_179409 ?auto_179416 ) ) ( not ( = ?auto_179409 ?auto_179417 ) ) ( not ( = ?auto_179409 ?auto_179418 ) ) ( not ( = ?auto_179410 ?auto_179411 ) ) ( not ( = ?auto_179410 ?auto_179412 ) ) ( not ( = ?auto_179410 ?auto_179413 ) ) ( not ( = ?auto_179410 ?auto_179414 ) ) ( not ( = ?auto_179410 ?auto_179415 ) ) ( not ( = ?auto_179410 ?auto_179416 ) ) ( not ( = ?auto_179410 ?auto_179417 ) ) ( not ( = ?auto_179410 ?auto_179418 ) ) ( not ( = ?auto_179411 ?auto_179412 ) ) ( not ( = ?auto_179411 ?auto_179413 ) ) ( not ( = ?auto_179411 ?auto_179414 ) ) ( not ( = ?auto_179411 ?auto_179415 ) ) ( not ( = ?auto_179411 ?auto_179416 ) ) ( not ( = ?auto_179411 ?auto_179417 ) ) ( not ( = ?auto_179411 ?auto_179418 ) ) ( not ( = ?auto_179412 ?auto_179413 ) ) ( not ( = ?auto_179412 ?auto_179414 ) ) ( not ( = ?auto_179412 ?auto_179415 ) ) ( not ( = ?auto_179412 ?auto_179416 ) ) ( not ( = ?auto_179412 ?auto_179417 ) ) ( not ( = ?auto_179412 ?auto_179418 ) ) ( not ( = ?auto_179413 ?auto_179414 ) ) ( not ( = ?auto_179413 ?auto_179415 ) ) ( not ( = ?auto_179413 ?auto_179416 ) ) ( not ( = ?auto_179413 ?auto_179417 ) ) ( not ( = ?auto_179413 ?auto_179418 ) ) ( not ( = ?auto_179414 ?auto_179415 ) ) ( not ( = ?auto_179414 ?auto_179416 ) ) ( not ( = ?auto_179414 ?auto_179417 ) ) ( not ( = ?auto_179414 ?auto_179418 ) ) ( not ( = ?auto_179415 ?auto_179416 ) ) ( not ( = ?auto_179415 ?auto_179417 ) ) ( not ( = ?auto_179415 ?auto_179418 ) ) ( not ( = ?auto_179416 ?auto_179417 ) ) ( not ( = ?auto_179416 ?auto_179418 ) ) ( not ( = ?auto_179417 ?auto_179418 ) ) ( ON ?auto_179416 ?auto_179417 ) ( ON ?auto_179415 ?auto_179416 ) ( ON ?auto_179414 ?auto_179415 ) ( ON ?auto_179413 ?auto_179414 ) ( ON ?auto_179412 ?auto_179413 ) ( ON ?auto_179411 ?auto_179412 ) ( ON ?auto_179410 ?auto_179411 ) ( ON ?auto_179409 ?auto_179410 ) ( ON ?auto_179408 ?auto_179409 ) ( CLEAR ?auto_179408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_179408 )
      ( MAKE-10PILE ?auto_179408 ?auto_179409 ?auto_179410 ?auto_179411 ?auto_179412 ?auto_179413 ?auto_179414 ?auto_179415 ?auto_179416 ?auto_179417 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_179451 - BLOCK
      ?auto_179452 - BLOCK
      ?auto_179453 - BLOCK
      ?auto_179454 - BLOCK
      ?auto_179455 - BLOCK
      ?auto_179456 - BLOCK
      ?auto_179457 - BLOCK
      ?auto_179458 - BLOCK
      ?auto_179459 - BLOCK
      ?auto_179460 - BLOCK
      ?auto_179461 - BLOCK
    )
    :vars
    (
      ?auto_179462 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_179460 ) ( ON ?auto_179461 ?auto_179462 ) ( CLEAR ?auto_179461 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_179451 ) ( ON ?auto_179452 ?auto_179451 ) ( ON ?auto_179453 ?auto_179452 ) ( ON ?auto_179454 ?auto_179453 ) ( ON ?auto_179455 ?auto_179454 ) ( ON ?auto_179456 ?auto_179455 ) ( ON ?auto_179457 ?auto_179456 ) ( ON ?auto_179458 ?auto_179457 ) ( ON ?auto_179459 ?auto_179458 ) ( ON ?auto_179460 ?auto_179459 ) ( not ( = ?auto_179451 ?auto_179452 ) ) ( not ( = ?auto_179451 ?auto_179453 ) ) ( not ( = ?auto_179451 ?auto_179454 ) ) ( not ( = ?auto_179451 ?auto_179455 ) ) ( not ( = ?auto_179451 ?auto_179456 ) ) ( not ( = ?auto_179451 ?auto_179457 ) ) ( not ( = ?auto_179451 ?auto_179458 ) ) ( not ( = ?auto_179451 ?auto_179459 ) ) ( not ( = ?auto_179451 ?auto_179460 ) ) ( not ( = ?auto_179451 ?auto_179461 ) ) ( not ( = ?auto_179451 ?auto_179462 ) ) ( not ( = ?auto_179452 ?auto_179453 ) ) ( not ( = ?auto_179452 ?auto_179454 ) ) ( not ( = ?auto_179452 ?auto_179455 ) ) ( not ( = ?auto_179452 ?auto_179456 ) ) ( not ( = ?auto_179452 ?auto_179457 ) ) ( not ( = ?auto_179452 ?auto_179458 ) ) ( not ( = ?auto_179452 ?auto_179459 ) ) ( not ( = ?auto_179452 ?auto_179460 ) ) ( not ( = ?auto_179452 ?auto_179461 ) ) ( not ( = ?auto_179452 ?auto_179462 ) ) ( not ( = ?auto_179453 ?auto_179454 ) ) ( not ( = ?auto_179453 ?auto_179455 ) ) ( not ( = ?auto_179453 ?auto_179456 ) ) ( not ( = ?auto_179453 ?auto_179457 ) ) ( not ( = ?auto_179453 ?auto_179458 ) ) ( not ( = ?auto_179453 ?auto_179459 ) ) ( not ( = ?auto_179453 ?auto_179460 ) ) ( not ( = ?auto_179453 ?auto_179461 ) ) ( not ( = ?auto_179453 ?auto_179462 ) ) ( not ( = ?auto_179454 ?auto_179455 ) ) ( not ( = ?auto_179454 ?auto_179456 ) ) ( not ( = ?auto_179454 ?auto_179457 ) ) ( not ( = ?auto_179454 ?auto_179458 ) ) ( not ( = ?auto_179454 ?auto_179459 ) ) ( not ( = ?auto_179454 ?auto_179460 ) ) ( not ( = ?auto_179454 ?auto_179461 ) ) ( not ( = ?auto_179454 ?auto_179462 ) ) ( not ( = ?auto_179455 ?auto_179456 ) ) ( not ( = ?auto_179455 ?auto_179457 ) ) ( not ( = ?auto_179455 ?auto_179458 ) ) ( not ( = ?auto_179455 ?auto_179459 ) ) ( not ( = ?auto_179455 ?auto_179460 ) ) ( not ( = ?auto_179455 ?auto_179461 ) ) ( not ( = ?auto_179455 ?auto_179462 ) ) ( not ( = ?auto_179456 ?auto_179457 ) ) ( not ( = ?auto_179456 ?auto_179458 ) ) ( not ( = ?auto_179456 ?auto_179459 ) ) ( not ( = ?auto_179456 ?auto_179460 ) ) ( not ( = ?auto_179456 ?auto_179461 ) ) ( not ( = ?auto_179456 ?auto_179462 ) ) ( not ( = ?auto_179457 ?auto_179458 ) ) ( not ( = ?auto_179457 ?auto_179459 ) ) ( not ( = ?auto_179457 ?auto_179460 ) ) ( not ( = ?auto_179457 ?auto_179461 ) ) ( not ( = ?auto_179457 ?auto_179462 ) ) ( not ( = ?auto_179458 ?auto_179459 ) ) ( not ( = ?auto_179458 ?auto_179460 ) ) ( not ( = ?auto_179458 ?auto_179461 ) ) ( not ( = ?auto_179458 ?auto_179462 ) ) ( not ( = ?auto_179459 ?auto_179460 ) ) ( not ( = ?auto_179459 ?auto_179461 ) ) ( not ( = ?auto_179459 ?auto_179462 ) ) ( not ( = ?auto_179460 ?auto_179461 ) ) ( not ( = ?auto_179460 ?auto_179462 ) ) ( not ( = ?auto_179461 ?auto_179462 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_179461 ?auto_179462 )
      ( !STACK ?auto_179461 ?auto_179460 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_179497 - BLOCK
      ?auto_179498 - BLOCK
      ?auto_179499 - BLOCK
      ?auto_179500 - BLOCK
      ?auto_179501 - BLOCK
      ?auto_179502 - BLOCK
      ?auto_179503 - BLOCK
      ?auto_179504 - BLOCK
      ?auto_179505 - BLOCK
      ?auto_179506 - BLOCK
      ?auto_179507 - BLOCK
    )
    :vars
    (
      ?auto_179508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179507 ?auto_179508 ) ( ON-TABLE ?auto_179497 ) ( ON ?auto_179498 ?auto_179497 ) ( ON ?auto_179499 ?auto_179498 ) ( ON ?auto_179500 ?auto_179499 ) ( ON ?auto_179501 ?auto_179500 ) ( ON ?auto_179502 ?auto_179501 ) ( ON ?auto_179503 ?auto_179502 ) ( ON ?auto_179504 ?auto_179503 ) ( ON ?auto_179505 ?auto_179504 ) ( not ( = ?auto_179497 ?auto_179498 ) ) ( not ( = ?auto_179497 ?auto_179499 ) ) ( not ( = ?auto_179497 ?auto_179500 ) ) ( not ( = ?auto_179497 ?auto_179501 ) ) ( not ( = ?auto_179497 ?auto_179502 ) ) ( not ( = ?auto_179497 ?auto_179503 ) ) ( not ( = ?auto_179497 ?auto_179504 ) ) ( not ( = ?auto_179497 ?auto_179505 ) ) ( not ( = ?auto_179497 ?auto_179506 ) ) ( not ( = ?auto_179497 ?auto_179507 ) ) ( not ( = ?auto_179497 ?auto_179508 ) ) ( not ( = ?auto_179498 ?auto_179499 ) ) ( not ( = ?auto_179498 ?auto_179500 ) ) ( not ( = ?auto_179498 ?auto_179501 ) ) ( not ( = ?auto_179498 ?auto_179502 ) ) ( not ( = ?auto_179498 ?auto_179503 ) ) ( not ( = ?auto_179498 ?auto_179504 ) ) ( not ( = ?auto_179498 ?auto_179505 ) ) ( not ( = ?auto_179498 ?auto_179506 ) ) ( not ( = ?auto_179498 ?auto_179507 ) ) ( not ( = ?auto_179498 ?auto_179508 ) ) ( not ( = ?auto_179499 ?auto_179500 ) ) ( not ( = ?auto_179499 ?auto_179501 ) ) ( not ( = ?auto_179499 ?auto_179502 ) ) ( not ( = ?auto_179499 ?auto_179503 ) ) ( not ( = ?auto_179499 ?auto_179504 ) ) ( not ( = ?auto_179499 ?auto_179505 ) ) ( not ( = ?auto_179499 ?auto_179506 ) ) ( not ( = ?auto_179499 ?auto_179507 ) ) ( not ( = ?auto_179499 ?auto_179508 ) ) ( not ( = ?auto_179500 ?auto_179501 ) ) ( not ( = ?auto_179500 ?auto_179502 ) ) ( not ( = ?auto_179500 ?auto_179503 ) ) ( not ( = ?auto_179500 ?auto_179504 ) ) ( not ( = ?auto_179500 ?auto_179505 ) ) ( not ( = ?auto_179500 ?auto_179506 ) ) ( not ( = ?auto_179500 ?auto_179507 ) ) ( not ( = ?auto_179500 ?auto_179508 ) ) ( not ( = ?auto_179501 ?auto_179502 ) ) ( not ( = ?auto_179501 ?auto_179503 ) ) ( not ( = ?auto_179501 ?auto_179504 ) ) ( not ( = ?auto_179501 ?auto_179505 ) ) ( not ( = ?auto_179501 ?auto_179506 ) ) ( not ( = ?auto_179501 ?auto_179507 ) ) ( not ( = ?auto_179501 ?auto_179508 ) ) ( not ( = ?auto_179502 ?auto_179503 ) ) ( not ( = ?auto_179502 ?auto_179504 ) ) ( not ( = ?auto_179502 ?auto_179505 ) ) ( not ( = ?auto_179502 ?auto_179506 ) ) ( not ( = ?auto_179502 ?auto_179507 ) ) ( not ( = ?auto_179502 ?auto_179508 ) ) ( not ( = ?auto_179503 ?auto_179504 ) ) ( not ( = ?auto_179503 ?auto_179505 ) ) ( not ( = ?auto_179503 ?auto_179506 ) ) ( not ( = ?auto_179503 ?auto_179507 ) ) ( not ( = ?auto_179503 ?auto_179508 ) ) ( not ( = ?auto_179504 ?auto_179505 ) ) ( not ( = ?auto_179504 ?auto_179506 ) ) ( not ( = ?auto_179504 ?auto_179507 ) ) ( not ( = ?auto_179504 ?auto_179508 ) ) ( not ( = ?auto_179505 ?auto_179506 ) ) ( not ( = ?auto_179505 ?auto_179507 ) ) ( not ( = ?auto_179505 ?auto_179508 ) ) ( not ( = ?auto_179506 ?auto_179507 ) ) ( not ( = ?auto_179506 ?auto_179508 ) ) ( not ( = ?auto_179507 ?auto_179508 ) ) ( CLEAR ?auto_179505 ) ( ON ?auto_179506 ?auto_179507 ) ( CLEAR ?auto_179506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_179497 ?auto_179498 ?auto_179499 ?auto_179500 ?auto_179501 ?auto_179502 ?auto_179503 ?auto_179504 ?auto_179505 ?auto_179506 )
      ( MAKE-11PILE ?auto_179497 ?auto_179498 ?auto_179499 ?auto_179500 ?auto_179501 ?auto_179502 ?auto_179503 ?auto_179504 ?auto_179505 ?auto_179506 ?auto_179507 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_179543 - BLOCK
      ?auto_179544 - BLOCK
      ?auto_179545 - BLOCK
      ?auto_179546 - BLOCK
      ?auto_179547 - BLOCK
      ?auto_179548 - BLOCK
      ?auto_179549 - BLOCK
      ?auto_179550 - BLOCK
      ?auto_179551 - BLOCK
      ?auto_179552 - BLOCK
      ?auto_179553 - BLOCK
    )
    :vars
    (
      ?auto_179554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179553 ?auto_179554 ) ( ON-TABLE ?auto_179543 ) ( ON ?auto_179544 ?auto_179543 ) ( ON ?auto_179545 ?auto_179544 ) ( ON ?auto_179546 ?auto_179545 ) ( ON ?auto_179547 ?auto_179546 ) ( ON ?auto_179548 ?auto_179547 ) ( ON ?auto_179549 ?auto_179548 ) ( ON ?auto_179550 ?auto_179549 ) ( not ( = ?auto_179543 ?auto_179544 ) ) ( not ( = ?auto_179543 ?auto_179545 ) ) ( not ( = ?auto_179543 ?auto_179546 ) ) ( not ( = ?auto_179543 ?auto_179547 ) ) ( not ( = ?auto_179543 ?auto_179548 ) ) ( not ( = ?auto_179543 ?auto_179549 ) ) ( not ( = ?auto_179543 ?auto_179550 ) ) ( not ( = ?auto_179543 ?auto_179551 ) ) ( not ( = ?auto_179543 ?auto_179552 ) ) ( not ( = ?auto_179543 ?auto_179553 ) ) ( not ( = ?auto_179543 ?auto_179554 ) ) ( not ( = ?auto_179544 ?auto_179545 ) ) ( not ( = ?auto_179544 ?auto_179546 ) ) ( not ( = ?auto_179544 ?auto_179547 ) ) ( not ( = ?auto_179544 ?auto_179548 ) ) ( not ( = ?auto_179544 ?auto_179549 ) ) ( not ( = ?auto_179544 ?auto_179550 ) ) ( not ( = ?auto_179544 ?auto_179551 ) ) ( not ( = ?auto_179544 ?auto_179552 ) ) ( not ( = ?auto_179544 ?auto_179553 ) ) ( not ( = ?auto_179544 ?auto_179554 ) ) ( not ( = ?auto_179545 ?auto_179546 ) ) ( not ( = ?auto_179545 ?auto_179547 ) ) ( not ( = ?auto_179545 ?auto_179548 ) ) ( not ( = ?auto_179545 ?auto_179549 ) ) ( not ( = ?auto_179545 ?auto_179550 ) ) ( not ( = ?auto_179545 ?auto_179551 ) ) ( not ( = ?auto_179545 ?auto_179552 ) ) ( not ( = ?auto_179545 ?auto_179553 ) ) ( not ( = ?auto_179545 ?auto_179554 ) ) ( not ( = ?auto_179546 ?auto_179547 ) ) ( not ( = ?auto_179546 ?auto_179548 ) ) ( not ( = ?auto_179546 ?auto_179549 ) ) ( not ( = ?auto_179546 ?auto_179550 ) ) ( not ( = ?auto_179546 ?auto_179551 ) ) ( not ( = ?auto_179546 ?auto_179552 ) ) ( not ( = ?auto_179546 ?auto_179553 ) ) ( not ( = ?auto_179546 ?auto_179554 ) ) ( not ( = ?auto_179547 ?auto_179548 ) ) ( not ( = ?auto_179547 ?auto_179549 ) ) ( not ( = ?auto_179547 ?auto_179550 ) ) ( not ( = ?auto_179547 ?auto_179551 ) ) ( not ( = ?auto_179547 ?auto_179552 ) ) ( not ( = ?auto_179547 ?auto_179553 ) ) ( not ( = ?auto_179547 ?auto_179554 ) ) ( not ( = ?auto_179548 ?auto_179549 ) ) ( not ( = ?auto_179548 ?auto_179550 ) ) ( not ( = ?auto_179548 ?auto_179551 ) ) ( not ( = ?auto_179548 ?auto_179552 ) ) ( not ( = ?auto_179548 ?auto_179553 ) ) ( not ( = ?auto_179548 ?auto_179554 ) ) ( not ( = ?auto_179549 ?auto_179550 ) ) ( not ( = ?auto_179549 ?auto_179551 ) ) ( not ( = ?auto_179549 ?auto_179552 ) ) ( not ( = ?auto_179549 ?auto_179553 ) ) ( not ( = ?auto_179549 ?auto_179554 ) ) ( not ( = ?auto_179550 ?auto_179551 ) ) ( not ( = ?auto_179550 ?auto_179552 ) ) ( not ( = ?auto_179550 ?auto_179553 ) ) ( not ( = ?auto_179550 ?auto_179554 ) ) ( not ( = ?auto_179551 ?auto_179552 ) ) ( not ( = ?auto_179551 ?auto_179553 ) ) ( not ( = ?auto_179551 ?auto_179554 ) ) ( not ( = ?auto_179552 ?auto_179553 ) ) ( not ( = ?auto_179552 ?auto_179554 ) ) ( not ( = ?auto_179553 ?auto_179554 ) ) ( ON ?auto_179552 ?auto_179553 ) ( CLEAR ?auto_179550 ) ( ON ?auto_179551 ?auto_179552 ) ( CLEAR ?auto_179551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_179543 ?auto_179544 ?auto_179545 ?auto_179546 ?auto_179547 ?auto_179548 ?auto_179549 ?auto_179550 ?auto_179551 )
      ( MAKE-11PILE ?auto_179543 ?auto_179544 ?auto_179545 ?auto_179546 ?auto_179547 ?auto_179548 ?auto_179549 ?auto_179550 ?auto_179551 ?auto_179552 ?auto_179553 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_179589 - BLOCK
      ?auto_179590 - BLOCK
      ?auto_179591 - BLOCK
      ?auto_179592 - BLOCK
      ?auto_179593 - BLOCK
      ?auto_179594 - BLOCK
      ?auto_179595 - BLOCK
      ?auto_179596 - BLOCK
      ?auto_179597 - BLOCK
      ?auto_179598 - BLOCK
      ?auto_179599 - BLOCK
    )
    :vars
    (
      ?auto_179600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179599 ?auto_179600 ) ( ON-TABLE ?auto_179589 ) ( ON ?auto_179590 ?auto_179589 ) ( ON ?auto_179591 ?auto_179590 ) ( ON ?auto_179592 ?auto_179591 ) ( ON ?auto_179593 ?auto_179592 ) ( ON ?auto_179594 ?auto_179593 ) ( ON ?auto_179595 ?auto_179594 ) ( not ( = ?auto_179589 ?auto_179590 ) ) ( not ( = ?auto_179589 ?auto_179591 ) ) ( not ( = ?auto_179589 ?auto_179592 ) ) ( not ( = ?auto_179589 ?auto_179593 ) ) ( not ( = ?auto_179589 ?auto_179594 ) ) ( not ( = ?auto_179589 ?auto_179595 ) ) ( not ( = ?auto_179589 ?auto_179596 ) ) ( not ( = ?auto_179589 ?auto_179597 ) ) ( not ( = ?auto_179589 ?auto_179598 ) ) ( not ( = ?auto_179589 ?auto_179599 ) ) ( not ( = ?auto_179589 ?auto_179600 ) ) ( not ( = ?auto_179590 ?auto_179591 ) ) ( not ( = ?auto_179590 ?auto_179592 ) ) ( not ( = ?auto_179590 ?auto_179593 ) ) ( not ( = ?auto_179590 ?auto_179594 ) ) ( not ( = ?auto_179590 ?auto_179595 ) ) ( not ( = ?auto_179590 ?auto_179596 ) ) ( not ( = ?auto_179590 ?auto_179597 ) ) ( not ( = ?auto_179590 ?auto_179598 ) ) ( not ( = ?auto_179590 ?auto_179599 ) ) ( not ( = ?auto_179590 ?auto_179600 ) ) ( not ( = ?auto_179591 ?auto_179592 ) ) ( not ( = ?auto_179591 ?auto_179593 ) ) ( not ( = ?auto_179591 ?auto_179594 ) ) ( not ( = ?auto_179591 ?auto_179595 ) ) ( not ( = ?auto_179591 ?auto_179596 ) ) ( not ( = ?auto_179591 ?auto_179597 ) ) ( not ( = ?auto_179591 ?auto_179598 ) ) ( not ( = ?auto_179591 ?auto_179599 ) ) ( not ( = ?auto_179591 ?auto_179600 ) ) ( not ( = ?auto_179592 ?auto_179593 ) ) ( not ( = ?auto_179592 ?auto_179594 ) ) ( not ( = ?auto_179592 ?auto_179595 ) ) ( not ( = ?auto_179592 ?auto_179596 ) ) ( not ( = ?auto_179592 ?auto_179597 ) ) ( not ( = ?auto_179592 ?auto_179598 ) ) ( not ( = ?auto_179592 ?auto_179599 ) ) ( not ( = ?auto_179592 ?auto_179600 ) ) ( not ( = ?auto_179593 ?auto_179594 ) ) ( not ( = ?auto_179593 ?auto_179595 ) ) ( not ( = ?auto_179593 ?auto_179596 ) ) ( not ( = ?auto_179593 ?auto_179597 ) ) ( not ( = ?auto_179593 ?auto_179598 ) ) ( not ( = ?auto_179593 ?auto_179599 ) ) ( not ( = ?auto_179593 ?auto_179600 ) ) ( not ( = ?auto_179594 ?auto_179595 ) ) ( not ( = ?auto_179594 ?auto_179596 ) ) ( not ( = ?auto_179594 ?auto_179597 ) ) ( not ( = ?auto_179594 ?auto_179598 ) ) ( not ( = ?auto_179594 ?auto_179599 ) ) ( not ( = ?auto_179594 ?auto_179600 ) ) ( not ( = ?auto_179595 ?auto_179596 ) ) ( not ( = ?auto_179595 ?auto_179597 ) ) ( not ( = ?auto_179595 ?auto_179598 ) ) ( not ( = ?auto_179595 ?auto_179599 ) ) ( not ( = ?auto_179595 ?auto_179600 ) ) ( not ( = ?auto_179596 ?auto_179597 ) ) ( not ( = ?auto_179596 ?auto_179598 ) ) ( not ( = ?auto_179596 ?auto_179599 ) ) ( not ( = ?auto_179596 ?auto_179600 ) ) ( not ( = ?auto_179597 ?auto_179598 ) ) ( not ( = ?auto_179597 ?auto_179599 ) ) ( not ( = ?auto_179597 ?auto_179600 ) ) ( not ( = ?auto_179598 ?auto_179599 ) ) ( not ( = ?auto_179598 ?auto_179600 ) ) ( not ( = ?auto_179599 ?auto_179600 ) ) ( ON ?auto_179598 ?auto_179599 ) ( ON ?auto_179597 ?auto_179598 ) ( CLEAR ?auto_179595 ) ( ON ?auto_179596 ?auto_179597 ) ( CLEAR ?auto_179596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_179589 ?auto_179590 ?auto_179591 ?auto_179592 ?auto_179593 ?auto_179594 ?auto_179595 ?auto_179596 )
      ( MAKE-11PILE ?auto_179589 ?auto_179590 ?auto_179591 ?auto_179592 ?auto_179593 ?auto_179594 ?auto_179595 ?auto_179596 ?auto_179597 ?auto_179598 ?auto_179599 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_179635 - BLOCK
      ?auto_179636 - BLOCK
      ?auto_179637 - BLOCK
      ?auto_179638 - BLOCK
      ?auto_179639 - BLOCK
      ?auto_179640 - BLOCK
      ?auto_179641 - BLOCK
      ?auto_179642 - BLOCK
      ?auto_179643 - BLOCK
      ?auto_179644 - BLOCK
      ?auto_179645 - BLOCK
    )
    :vars
    (
      ?auto_179646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179645 ?auto_179646 ) ( ON-TABLE ?auto_179635 ) ( ON ?auto_179636 ?auto_179635 ) ( ON ?auto_179637 ?auto_179636 ) ( ON ?auto_179638 ?auto_179637 ) ( ON ?auto_179639 ?auto_179638 ) ( ON ?auto_179640 ?auto_179639 ) ( not ( = ?auto_179635 ?auto_179636 ) ) ( not ( = ?auto_179635 ?auto_179637 ) ) ( not ( = ?auto_179635 ?auto_179638 ) ) ( not ( = ?auto_179635 ?auto_179639 ) ) ( not ( = ?auto_179635 ?auto_179640 ) ) ( not ( = ?auto_179635 ?auto_179641 ) ) ( not ( = ?auto_179635 ?auto_179642 ) ) ( not ( = ?auto_179635 ?auto_179643 ) ) ( not ( = ?auto_179635 ?auto_179644 ) ) ( not ( = ?auto_179635 ?auto_179645 ) ) ( not ( = ?auto_179635 ?auto_179646 ) ) ( not ( = ?auto_179636 ?auto_179637 ) ) ( not ( = ?auto_179636 ?auto_179638 ) ) ( not ( = ?auto_179636 ?auto_179639 ) ) ( not ( = ?auto_179636 ?auto_179640 ) ) ( not ( = ?auto_179636 ?auto_179641 ) ) ( not ( = ?auto_179636 ?auto_179642 ) ) ( not ( = ?auto_179636 ?auto_179643 ) ) ( not ( = ?auto_179636 ?auto_179644 ) ) ( not ( = ?auto_179636 ?auto_179645 ) ) ( not ( = ?auto_179636 ?auto_179646 ) ) ( not ( = ?auto_179637 ?auto_179638 ) ) ( not ( = ?auto_179637 ?auto_179639 ) ) ( not ( = ?auto_179637 ?auto_179640 ) ) ( not ( = ?auto_179637 ?auto_179641 ) ) ( not ( = ?auto_179637 ?auto_179642 ) ) ( not ( = ?auto_179637 ?auto_179643 ) ) ( not ( = ?auto_179637 ?auto_179644 ) ) ( not ( = ?auto_179637 ?auto_179645 ) ) ( not ( = ?auto_179637 ?auto_179646 ) ) ( not ( = ?auto_179638 ?auto_179639 ) ) ( not ( = ?auto_179638 ?auto_179640 ) ) ( not ( = ?auto_179638 ?auto_179641 ) ) ( not ( = ?auto_179638 ?auto_179642 ) ) ( not ( = ?auto_179638 ?auto_179643 ) ) ( not ( = ?auto_179638 ?auto_179644 ) ) ( not ( = ?auto_179638 ?auto_179645 ) ) ( not ( = ?auto_179638 ?auto_179646 ) ) ( not ( = ?auto_179639 ?auto_179640 ) ) ( not ( = ?auto_179639 ?auto_179641 ) ) ( not ( = ?auto_179639 ?auto_179642 ) ) ( not ( = ?auto_179639 ?auto_179643 ) ) ( not ( = ?auto_179639 ?auto_179644 ) ) ( not ( = ?auto_179639 ?auto_179645 ) ) ( not ( = ?auto_179639 ?auto_179646 ) ) ( not ( = ?auto_179640 ?auto_179641 ) ) ( not ( = ?auto_179640 ?auto_179642 ) ) ( not ( = ?auto_179640 ?auto_179643 ) ) ( not ( = ?auto_179640 ?auto_179644 ) ) ( not ( = ?auto_179640 ?auto_179645 ) ) ( not ( = ?auto_179640 ?auto_179646 ) ) ( not ( = ?auto_179641 ?auto_179642 ) ) ( not ( = ?auto_179641 ?auto_179643 ) ) ( not ( = ?auto_179641 ?auto_179644 ) ) ( not ( = ?auto_179641 ?auto_179645 ) ) ( not ( = ?auto_179641 ?auto_179646 ) ) ( not ( = ?auto_179642 ?auto_179643 ) ) ( not ( = ?auto_179642 ?auto_179644 ) ) ( not ( = ?auto_179642 ?auto_179645 ) ) ( not ( = ?auto_179642 ?auto_179646 ) ) ( not ( = ?auto_179643 ?auto_179644 ) ) ( not ( = ?auto_179643 ?auto_179645 ) ) ( not ( = ?auto_179643 ?auto_179646 ) ) ( not ( = ?auto_179644 ?auto_179645 ) ) ( not ( = ?auto_179644 ?auto_179646 ) ) ( not ( = ?auto_179645 ?auto_179646 ) ) ( ON ?auto_179644 ?auto_179645 ) ( ON ?auto_179643 ?auto_179644 ) ( ON ?auto_179642 ?auto_179643 ) ( CLEAR ?auto_179640 ) ( ON ?auto_179641 ?auto_179642 ) ( CLEAR ?auto_179641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179635 ?auto_179636 ?auto_179637 ?auto_179638 ?auto_179639 ?auto_179640 ?auto_179641 )
      ( MAKE-11PILE ?auto_179635 ?auto_179636 ?auto_179637 ?auto_179638 ?auto_179639 ?auto_179640 ?auto_179641 ?auto_179642 ?auto_179643 ?auto_179644 ?auto_179645 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_179681 - BLOCK
      ?auto_179682 - BLOCK
      ?auto_179683 - BLOCK
      ?auto_179684 - BLOCK
      ?auto_179685 - BLOCK
      ?auto_179686 - BLOCK
      ?auto_179687 - BLOCK
      ?auto_179688 - BLOCK
      ?auto_179689 - BLOCK
      ?auto_179690 - BLOCK
      ?auto_179691 - BLOCK
    )
    :vars
    (
      ?auto_179692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179691 ?auto_179692 ) ( ON-TABLE ?auto_179681 ) ( ON ?auto_179682 ?auto_179681 ) ( ON ?auto_179683 ?auto_179682 ) ( ON ?auto_179684 ?auto_179683 ) ( ON ?auto_179685 ?auto_179684 ) ( not ( = ?auto_179681 ?auto_179682 ) ) ( not ( = ?auto_179681 ?auto_179683 ) ) ( not ( = ?auto_179681 ?auto_179684 ) ) ( not ( = ?auto_179681 ?auto_179685 ) ) ( not ( = ?auto_179681 ?auto_179686 ) ) ( not ( = ?auto_179681 ?auto_179687 ) ) ( not ( = ?auto_179681 ?auto_179688 ) ) ( not ( = ?auto_179681 ?auto_179689 ) ) ( not ( = ?auto_179681 ?auto_179690 ) ) ( not ( = ?auto_179681 ?auto_179691 ) ) ( not ( = ?auto_179681 ?auto_179692 ) ) ( not ( = ?auto_179682 ?auto_179683 ) ) ( not ( = ?auto_179682 ?auto_179684 ) ) ( not ( = ?auto_179682 ?auto_179685 ) ) ( not ( = ?auto_179682 ?auto_179686 ) ) ( not ( = ?auto_179682 ?auto_179687 ) ) ( not ( = ?auto_179682 ?auto_179688 ) ) ( not ( = ?auto_179682 ?auto_179689 ) ) ( not ( = ?auto_179682 ?auto_179690 ) ) ( not ( = ?auto_179682 ?auto_179691 ) ) ( not ( = ?auto_179682 ?auto_179692 ) ) ( not ( = ?auto_179683 ?auto_179684 ) ) ( not ( = ?auto_179683 ?auto_179685 ) ) ( not ( = ?auto_179683 ?auto_179686 ) ) ( not ( = ?auto_179683 ?auto_179687 ) ) ( not ( = ?auto_179683 ?auto_179688 ) ) ( not ( = ?auto_179683 ?auto_179689 ) ) ( not ( = ?auto_179683 ?auto_179690 ) ) ( not ( = ?auto_179683 ?auto_179691 ) ) ( not ( = ?auto_179683 ?auto_179692 ) ) ( not ( = ?auto_179684 ?auto_179685 ) ) ( not ( = ?auto_179684 ?auto_179686 ) ) ( not ( = ?auto_179684 ?auto_179687 ) ) ( not ( = ?auto_179684 ?auto_179688 ) ) ( not ( = ?auto_179684 ?auto_179689 ) ) ( not ( = ?auto_179684 ?auto_179690 ) ) ( not ( = ?auto_179684 ?auto_179691 ) ) ( not ( = ?auto_179684 ?auto_179692 ) ) ( not ( = ?auto_179685 ?auto_179686 ) ) ( not ( = ?auto_179685 ?auto_179687 ) ) ( not ( = ?auto_179685 ?auto_179688 ) ) ( not ( = ?auto_179685 ?auto_179689 ) ) ( not ( = ?auto_179685 ?auto_179690 ) ) ( not ( = ?auto_179685 ?auto_179691 ) ) ( not ( = ?auto_179685 ?auto_179692 ) ) ( not ( = ?auto_179686 ?auto_179687 ) ) ( not ( = ?auto_179686 ?auto_179688 ) ) ( not ( = ?auto_179686 ?auto_179689 ) ) ( not ( = ?auto_179686 ?auto_179690 ) ) ( not ( = ?auto_179686 ?auto_179691 ) ) ( not ( = ?auto_179686 ?auto_179692 ) ) ( not ( = ?auto_179687 ?auto_179688 ) ) ( not ( = ?auto_179687 ?auto_179689 ) ) ( not ( = ?auto_179687 ?auto_179690 ) ) ( not ( = ?auto_179687 ?auto_179691 ) ) ( not ( = ?auto_179687 ?auto_179692 ) ) ( not ( = ?auto_179688 ?auto_179689 ) ) ( not ( = ?auto_179688 ?auto_179690 ) ) ( not ( = ?auto_179688 ?auto_179691 ) ) ( not ( = ?auto_179688 ?auto_179692 ) ) ( not ( = ?auto_179689 ?auto_179690 ) ) ( not ( = ?auto_179689 ?auto_179691 ) ) ( not ( = ?auto_179689 ?auto_179692 ) ) ( not ( = ?auto_179690 ?auto_179691 ) ) ( not ( = ?auto_179690 ?auto_179692 ) ) ( not ( = ?auto_179691 ?auto_179692 ) ) ( ON ?auto_179690 ?auto_179691 ) ( ON ?auto_179689 ?auto_179690 ) ( ON ?auto_179688 ?auto_179689 ) ( ON ?auto_179687 ?auto_179688 ) ( CLEAR ?auto_179685 ) ( ON ?auto_179686 ?auto_179687 ) ( CLEAR ?auto_179686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_179681 ?auto_179682 ?auto_179683 ?auto_179684 ?auto_179685 ?auto_179686 )
      ( MAKE-11PILE ?auto_179681 ?auto_179682 ?auto_179683 ?auto_179684 ?auto_179685 ?auto_179686 ?auto_179687 ?auto_179688 ?auto_179689 ?auto_179690 ?auto_179691 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_179727 - BLOCK
      ?auto_179728 - BLOCK
      ?auto_179729 - BLOCK
      ?auto_179730 - BLOCK
      ?auto_179731 - BLOCK
      ?auto_179732 - BLOCK
      ?auto_179733 - BLOCK
      ?auto_179734 - BLOCK
      ?auto_179735 - BLOCK
      ?auto_179736 - BLOCK
      ?auto_179737 - BLOCK
    )
    :vars
    (
      ?auto_179738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179737 ?auto_179738 ) ( ON-TABLE ?auto_179727 ) ( ON ?auto_179728 ?auto_179727 ) ( ON ?auto_179729 ?auto_179728 ) ( ON ?auto_179730 ?auto_179729 ) ( not ( = ?auto_179727 ?auto_179728 ) ) ( not ( = ?auto_179727 ?auto_179729 ) ) ( not ( = ?auto_179727 ?auto_179730 ) ) ( not ( = ?auto_179727 ?auto_179731 ) ) ( not ( = ?auto_179727 ?auto_179732 ) ) ( not ( = ?auto_179727 ?auto_179733 ) ) ( not ( = ?auto_179727 ?auto_179734 ) ) ( not ( = ?auto_179727 ?auto_179735 ) ) ( not ( = ?auto_179727 ?auto_179736 ) ) ( not ( = ?auto_179727 ?auto_179737 ) ) ( not ( = ?auto_179727 ?auto_179738 ) ) ( not ( = ?auto_179728 ?auto_179729 ) ) ( not ( = ?auto_179728 ?auto_179730 ) ) ( not ( = ?auto_179728 ?auto_179731 ) ) ( not ( = ?auto_179728 ?auto_179732 ) ) ( not ( = ?auto_179728 ?auto_179733 ) ) ( not ( = ?auto_179728 ?auto_179734 ) ) ( not ( = ?auto_179728 ?auto_179735 ) ) ( not ( = ?auto_179728 ?auto_179736 ) ) ( not ( = ?auto_179728 ?auto_179737 ) ) ( not ( = ?auto_179728 ?auto_179738 ) ) ( not ( = ?auto_179729 ?auto_179730 ) ) ( not ( = ?auto_179729 ?auto_179731 ) ) ( not ( = ?auto_179729 ?auto_179732 ) ) ( not ( = ?auto_179729 ?auto_179733 ) ) ( not ( = ?auto_179729 ?auto_179734 ) ) ( not ( = ?auto_179729 ?auto_179735 ) ) ( not ( = ?auto_179729 ?auto_179736 ) ) ( not ( = ?auto_179729 ?auto_179737 ) ) ( not ( = ?auto_179729 ?auto_179738 ) ) ( not ( = ?auto_179730 ?auto_179731 ) ) ( not ( = ?auto_179730 ?auto_179732 ) ) ( not ( = ?auto_179730 ?auto_179733 ) ) ( not ( = ?auto_179730 ?auto_179734 ) ) ( not ( = ?auto_179730 ?auto_179735 ) ) ( not ( = ?auto_179730 ?auto_179736 ) ) ( not ( = ?auto_179730 ?auto_179737 ) ) ( not ( = ?auto_179730 ?auto_179738 ) ) ( not ( = ?auto_179731 ?auto_179732 ) ) ( not ( = ?auto_179731 ?auto_179733 ) ) ( not ( = ?auto_179731 ?auto_179734 ) ) ( not ( = ?auto_179731 ?auto_179735 ) ) ( not ( = ?auto_179731 ?auto_179736 ) ) ( not ( = ?auto_179731 ?auto_179737 ) ) ( not ( = ?auto_179731 ?auto_179738 ) ) ( not ( = ?auto_179732 ?auto_179733 ) ) ( not ( = ?auto_179732 ?auto_179734 ) ) ( not ( = ?auto_179732 ?auto_179735 ) ) ( not ( = ?auto_179732 ?auto_179736 ) ) ( not ( = ?auto_179732 ?auto_179737 ) ) ( not ( = ?auto_179732 ?auto_179738 ) ) ( not ( = ?auto_179733 ?auto_179734 ) ) ( not ( = ?auto_179733 ?auto_179735 ) ) ( not ( = ?auto_179733 ?auto_179736 ) ) ( not ( = ?auto_179733 ?auto_179737 ) ) ( not ( = ?auto_179733 ?auto_179738 ) ) ( not ( = ?auto_179734 ?auto_179735 ) ) ( not ( = ?auto_179734 ?auto_179736 ) ) ( not ( = ?auto_179734 ?auto_179737 ) ) ( not ( = ?auto_179734 ?auto_179738 ) ) ( not ( = ?auto_179735 ?auto_179736 ) ) ( not ( = ?auto_179735 ?auto_179737 ) ) ( not ( = ?auto_179735 ?auto_179738 ) ) ( not ( = ?auto_179736 ?auto_179737 ) ) ( not ( = ?auto_179736 ?auto_179738 ) ) ( not ( = ?auto_179737 ?auto_179738 ) ) ( ON ?auto_179736 ?auto_179737 ) ( ON ?auto_179735 ?auto_179736 ) ( ON ?auto_179734 ?auto_179735 ) ( ON ?auto_179733 ?auto_179734 ) ( ON ?auto_179732 ?auto_179733 ) ( CLEAR ?auto_179730 ) ( ON ?auto_179731 ?auto_179732 ) ( CLEAR ?auto_179731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_179727 ?auto_179728 ?auto_179729 ?auto_179730 ?auto_179731 )
      ( MAKE-11PILE ?auto_179727 ?auto_179728 ?auto_179729 ?auto_179730 ?auto_179731 ?auto_179732 ?auto_179733 ?auto_179734 ?auto_179735 ?auto_179736 ?auto_179737 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_179773 - BLOCK
      ?auto_179774 - BLOCK
      ?auto_179775 - BLOCK
      ?auto_179776 - BLOCK
      ?auto_179777 - BLOCK
      ?auto_179778 - BLOCK
      ?auto_179779 - BLOCK
      ?auto_179780 - BLOCK
      ?auto_179781 - BLOCK
      ?auto_179782 - BLOCK
      ?auto_179783 - BLOCK
    )
    :vars
    (
      ?auto_179784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179783 ?auto_179784 ) ( ON-TABLE ?auto_179773 ) ( ON ?auto_179774 ?auto_179773 ) ( ON ?auto_179775 ?auto_179774 ) ( not ( = ?auto_179773 ?auto_179774 ) ) ( not ( = ?auto_179773 ?auto_179775 ) ) ( not ( = ?auto_179773 ?auto_179776 ) ) ( not ( = ?auto_179773 ?auto_179777 ) ) ( not ( = ?auto_179773 ?auto_179778 ) ) ( not ( = ?auto_179773 ?auto_179779 ) ) ( not ( = ?auto_179773 ?auto_179780 ) ) ( not ( = ?auto_179773 ?auto_179781 ) ) ( not ( = ?auto_179773 ?auto_179782 ) ) ( not ( = ?auto_179773 ?auto_179783 ) ) ( not ( = ?auto_179773 ?auto_179784 ) ) ( not ( = ?auto_179774 ?auto_179775 ) ) ( not ( = ?auto_179774 ?auto_179776 ) ) ( not ( = ?auto_179774 ?auto_179777 ) ) ( not ( = ?auto_179774 ?auto_179778 ) ) ( not ( = ?auto_179774 ?auto_179779 ) ) ( not ( = ?auto_179774 ?auto_179780 ) ) ( not ( = ?auto_179774 ?auto_179781 ) ) ( not ( = ?auto_179774 ?auto_179782 ) ) ( not ( = ?auto_179774 ?auto_179783 ) ) ( not ( = ?auto_179774 ?auto_179784 ) ) ( not ( = ?auto_179775 ?auto_179776 ) ) ( not ( = ?auto_179775 ?auto_179777 ) ) ( not ( = ?auto_179775 ?auto_179778 ) ) ( not ( = ?auto_179775 ?auto_179779 ) ) ( not ( = ?auto_179775 ?auto_179780 ) ) ( not ( = ?auto_179775 ?auto_179781 ) ) ( not ( = ?auto_179775 ?auto_179782 ) ) ( not ( = ?auto_179775 ?auto_179783 ) ) ( not ( = ?auto_179775 ?auto_179784 ) ) ( not ( = ?auto_179776 ?auto_179777 ) ) ( not ( = ?auto_179776 ?auto_179778 ) ) ( not ( = ?auto_179776 ?auto_179779 ) ) ( not ( = ?auto_179776 ?auto_179780 ) ) ( not ( = ?auto_179776 ?auto_179781 ) ) ( not ( = ?auto_179776 ?auto_179782 ) ) ( not ( = ?auto_179776 ?auto_179783 ) ) ( not ( = ?auto_179776 ?auto_179784 ) ) ( not ( = ?auto_179777 ?auto_179778 ) ) ( not ( = ?auto_179777 ?auto_179779 ) ) ( not ( = ?auto_179777 ?auto_179780 ) ) ( not ( = ?auto_179777 ?auto_179781 ) ) ( not ( = ?auto_179777 ?auto_179782 ) ) ( not ( = ?auto_179777 ?auto_179783 ) ) ( not ( = ?auto_179777 ?auto_179784 ) ) ( not ( = ?auto_179778 ?auto_179779 ) ) ( not ( = ?auto_179778 ?auto_179780 ) ) ( not ( = ?auto_179778 ?auto_179781 ) ) ( not ( = ?auto_179778 ?auto_179782 ) ) ( not ( = ?auto_179778 ?auto_179783 ) ) ( not ( = ?auto_179778 ?auto_179784 ) ) ( not ( = ?auto_179779 ?auto_179780 ) ) ( not ( = ?auto_179779 ?auto_179781 ) ) ( not ( = ?auto_179779 ?auto_179782 ) ) ( not ( = ?auto_179779 ?auto_179783 ) ) ( not ( = ?auto_179779 ?auto_179784 ) ) ( not ( = ?auto_179780 ?auto_179781 ) ) ( not ( = ?auto_179780 ?auto_179782 ) ) ( not ( = ?auto_179780 ?auto_179783 ) ) ( not ( = ?auto_179780 ?auto_179784 ) ) ( not ( = ?auto_179781 ?auto_179782 ) ) ( not ( = ?auto_179781 ?auto_179783 ) ) ( not ( = ?auto_179781 ?auto_179784 ) ) ( not ( = ?auto_179782 ?auto_179783 ) ) ( not ( = ?auto_179782 ?auto_179784 ) ) ( not ( = ?auto_179783 ?auto_179784 ) ) ( ON ?auto_179782 ?auto_179783 ) ( ON ?auto_179781 ?auto_179782 ) ( ON ?auto_179780 ?auto_179781 ) ( ON ?auto_179779 ?auto_179780 ) ( ON ?auto_179778 ?auto_179779 ) ( ON ?auto_179777 ?auto_179778 ) ( CLEAR ?auto_179775 ) ( ON ?auto_179776 ?auto_179777 ) ( CLEAR ?auto_179776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179773 ?auto_179774 ?auto_179775 ?auto_179776 )
      ( MAKE-11PILE ?auto_179773 ?auto_179774 ?auto_179775 ?auto_179776 ?auto_179777 ?auto_179778 ?auto_179779 ?auto_179780 ?auto_179781 ?auto_179782 ?auto_179783 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_179819 - BLOCK
      ?auto_179820 - BLOCK
      ?auto_179821 - BLOCK
      ?auto_179822 - BLOCK
      ?auto_179823 - BLOCK
      ?auto_179824 - BLOCK
      ?auto_179825 - BLOCK
      ?auto_179826 - BLOCK
      ?auto_179827 - BLOCK
      ?auto_179828 - BLOCK
      ?auto_179829 - BLOCK
    )
    :vars
    (
      ?auto_179830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179829 ?auto_179830 ) ( ON-TABLE ?auto_179819 ) ( ON ?auto_179820 ?auto_179819 ) ( not ( = ?auto_179819 ?auto_179820 ) ) ( not ( = ?auto_179819 ?auto_179821 ) ) ( not ( = ?auto_179819 ?auto_179822 ) ) ( not ( = ?auto_179819 ?auto_179823 ) ) ( not ( = ?auto_179819 ?auto_179824 ) ) ( not ( = ?auto_179819 ?auto_179825 ) ) ( not ( = ?auto_179819 ?auto_179826 ) ) ( not ( = ?auto_179819 ?auto_179827 ) ) ( not ( = ?auto_179819 ?auto_179828 ) ) ( not ( = ?auto_179819 ?auto_179829 ) ) ( not ( = ?auto_179819 ?auto_179830 ) ) ( not ( = ?auto_179820 ?auto_179821 ) ) ( not ( = ?auto_179820 ?auto_179822 ) ) ( not ( = ?auto_179820 ?auto_179823 ) ) ( not ( = ?auto_179820 ?auto_179824 ) ) ( not ( = ?auto_179820 ?auto_179825 ) ) ( not ( = ?auto_179820 ?auto_179826 ) ) ( not ( = ?auto_179820 ?auto_179827 ) ) ( not ( = ?auto_179820 ?auto_179828 ) ) ( not ( = ?auto_179820 ?auto_179829 ) ) ( not ( = ?auto_179820 ?auto_179830 ) ) ( not ( = ?auto_179821 ?auto_179822 ) ) ( not ( = ?auto_179821 ?auto_179823 ) ) ( not ( = ?auto_179821 ?auto_179824 ) ) ( not ( = ?auto_179821 ?auto_179825 ) ) ( not ( = ?auto_179821 ?auto_179826 ) ) ( not ( = ?auto_179821 ?auto_179827 ) ) ( not ( = ?auto_179821 ?auto_179828 ) ) ( not ( = ?auto_179821 ?auto_179829 ) ) ( not ( = ?auto_179821 ?auto_179830 ) ) ( not ( = ?auto_179822 ?auto_179823 ) ) ( not ( = ?auto_179822 ?auto_179824 ) ) ( not ( = ?auto_179822 ?auto_179825 ) ) ( not ( = ?auto_179822 ?auto_179826 ) ) ( not ( = ?auto_179822 ?auto_179827 ) ) ( not ( = ?auto_179822 ?auto_179828 ) ) ( not ( = ?auto_179822 ?auto_179829 ) ) ( not ( = ?auto_179822 ?auto_179830 ) ) ( not ( = ?auto_179823 ?auto_179824 ) ) ( not ( = ?auto_179823 ?auto_179825 ) ) ( not ( = ?auto_179823 ?auto_179826 ) ) ( not ( = ?auto_179823 ?auto_179827 ) ) ( not ( = ?auto_179823 ?auto_179828 ) ) ( not ( = ?auto_179823 ?auto_179829 ) ) ( not ( = ?auto_179823 ?auto_179830 ) ) ( not ( = ?auto_179824 ?auto_179825 ) ) ( not ( = ?auto_179824 ?auto_179826 ) ) ( not ( = ?auto_179824 ?auto_179827 ) ) ( not ( = ?auto_179824 ?auto_179828 ) ) ( not ( = ?auto_179824 ?auto_179829 ) ) ( not ( = ?auto_179824 ?auto_179830 ) ) ( not ( = ?auto_179825 ?auto_179826 ) ) ( not ( = ?auto_179825 ?auto_179827 ) ) ( not ( = ?auto_179825 ?auto_179828 ) ) ( not ( = ?auto_179825 ?auto_179829 ) ) ( not ( = ?auto_179825 ?auto_179830 ) ) ( not ( = ?auto_179826 ?auto_179827 ) ) ( not ( = ?auto_179826 ?auto_179828 ) ) ( not ( = ?auto_179826 ?auto_179829 ) ) ( not ( = ?auto_179826 ?auto_179830 ) ) ( not ( = ?auto_179827 ?auto_179828 ) ) ( not ( = ?auto_179827 ?auto_179829 ) ) ( not ( = ?auto_179827 ?auto_179830 ) ) ( not ( = ?auto_179828 ?auto_179829 ) ) ( not ( = ?auto_179828 ?auto_179830 ) ) ( not ( = ?auto_179829 ?auto_179830 ) ) ( ON ?auto_179828 ?auto_179829 ) ( ON ?auto_179827 ?auto_179828 ) ( ON ?auto_179826 ?auto_179827 ) ( ON ?auto_179825 ?auto_179826 ) ( ON ?auto_179824 ?auto_179825 ) ( ON ?auto_179823 ?auto_179824 ) ( ON ?auto_179822 ?auto_179823 ) ( CLEAR ?auto_179820 ) ( ON ?auto_179821 ?auto_179822 ) ( CLEAR ?auto_179821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179819 ?auto_179820 ?auto_179821 )
      ( MAKE-11PILE ?auto_179819 ?auto_179820 ?auto_179821 ?auto_179822 ?auto_179823 ?auto_179824 ?auto_179825 ?auto_179826 ?auto_179827 ?auto_179828 ?auto_179829 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_179865 - BLOCK
      ?auto_179866 - BLOCK
      ?auto_179867 - BLOCK
      ?auto_179868 - BLOCK
      ?auto_179869 - BLOCK
      ?auto_179870 - BLOCK
      ?auto_179871 - BLOCK
      ?auto_179872 - BLOCK
      ?auto_179873 - BLOCK
      ?auto_179874 - BLOCK
      ?auto_179875 - BLOCK
    )
    :vars
    (
      ?auto_179876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179875 ?auto_179876 ) ( ON-TABLE ?auto_179865 ) ( not ( = ?auto_179865 ?auto_179866 ) ) ( not ( = ?auto_179865 ?auto_179867 ) ) ( not ( = ?auto_179865 ?auto_179868 ) ) ( not ( = ?auto_179865 ?auto_179869 ) ) ( not ( = ?auto_179865 ?auto_179870 ) ) ( not ( = ?auto_179865 ?auto_179871 ) ) ( not ( = ?auto_179865 ?auto_179872 ) ) ( not ( = ?auto_179865 ?auto_179873 ) ) ( not ( = ?auto_179865 ?auto_179874 ) ) ( not ( = ?auto_179865 ?auto_179875 ) ) ( not ( = ?auto_179865 ?auto_179876 ) ) ( not ( = ?auto_179866 ?auto_179867 ) ) ( not ( = ?auto_179866 ?auto_179868 ) ) ( not ( = ?auto_179866 ?auto_179869 ) ) ( not ( = ?auto_179866 ?auto_179870 ) ) ( not ( = ?auto_179866 ?auto_179871 ) ) ( not ( = ?auto_179866 ?auto_179872 ) ) ( not ( = ?auto_179866 ?auto_179873 ) ) ( not ( = ?auto_179866 ?auto_179874 ) ) ( not ( = ?auto_179866 ?auto_179875 ) ) ( not ( = ?auto_179866 ?auto_179876 ) ) ( not ( = ?auto_179867 ?auto_179868 ) ) ( not ( = ?auto_179867 ?auto_179869 ) ) ( not ( = ?auto_179867 ?auto_179870 ) ) ( not ( = ?auto_179867 ?auto_179871 ) ) ( not ( = ?auto_179867 ?auto_179872 ) ) ( not ( = ?auto_179867 ?auto_179873 ) ) ( not ( = ?auto_179867 ?auto_179874 ) ) ( not ( = ?auto_179867 ?auto_179875 ) ) ( not ( = ?auto_179867 ?auto_179876 ) ) ( not ( = ?auto_179868 ?auto_179869 ) ) ( not ( = ?auto_179868 ?auto_179870 ) ) ( not ( = ?auto_179868 ?auto_179871 ) ) ( not ( = ?auto_179868 ?auto_179872 ) ) ( not ( = ?auto_179868 ?auto_179873 ) ) ( not ( = ?auto_179868 ?auto_179874 ) ) ( not ( = ?auto_179868 ?auto_179875 ) ) ( not ( = ?auto_179868 ?auto_179876 ) ) ( not ( = ?auto_179869 ?auto_179870 ) ) ( not ( = ?auto_179869 ?auto_179871 ) ) ( not ( = ?auto_179869 ?auto_179872 ) ) ( not ( = ?auto_179869 ?auto_179873 ) ) ( not ( = ?auto_179869 ?auto_179874 ) ) ( not ( = ?auto_179869 ?auto_179875 ) ) ( not ( = ?auto_179869 ?auto_179876 ) ) ( not ( = ?auto_179870 ?auto_179871 ) ) ( not ( = ?auto_179870 ?auto_179872 ) ) ( not ( = ?auto_179870 ?auto_179873 ) ) ( not ( = ?auto_179870 ?auto_179874 ) ) ( not ( = ?auto_179870 ?auto_179875 ) ) ( not ( = ?auto_179870 ?auto_179876 ) ) ( not ( = ?auto_179871 ?auto_179872 ) ) ( not ( = ?auto_179871 ?auto_179873 ) ) ( not ( = ?auto_179871 ?auto_179874 ) ) ( not ( = ?auto_179871 ?auto_179875 ) ) ( not ( = ?auto_179871 ?auto_179876 ) ) ( not ( = ?auto_179872 ?auto_179873 ) ) ( not ( = ?auto_179872 ?auto_179874 ) ) ( not ( = ?auto_179872 ?auto_179875 ) ) ( not ( = ?auto_179872 ?auto_179876 ) ) ( not ( = ?auto_179873 ?auto_179874 ) ) ( not ( = ?auto_179873 ?auto_179875 ) ) ( not ( = ?auto_179873 ?auto_179876 ) ) ( not ( = ?auto_179874 ?auto_179875 ) ) ( not ( = ?auto_179874 ?auto_179876 ) ) ( not ( = ?auto_179875 ?auto_179876 ) ) ( ON ?auto_179874 ?auto_179875 ) ( ON ?auto_179873 ?auto_179874 ) ( ON ?auto_179872 ?auto_179873 ) ( ON ?auto_179871 ?auto_179872 ) ( ON ?auto_179870 ?auto_179871 ) ( ON ?auto_179869 ?auto_179870 ) ( ON ?auto_179868 ?auto_179869 ) ( ON ?auto_179867 ?auto_179868 ) ( CLEAR ?auto_179865 ) ( ON ?auto_179866 ?auto_179867 ) ( CLEAR ?auto_179866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179865 ?auto_179866 )
      ( MAKE-11PILE ?auto_179865 ?auto_179866 ?auto_179867 ?auto_179868 ?auto_179869 ?auto_179870 ?auto_179871 ?auto_179872 ?auto_179873 ?auto_179874 ?auto_179875 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_179911 - BLOCK
      ?auto_179912 - BLOCK
      ?auto_179913 - BLOCK
      ?auto_179914 - BLOCK
      ?auto_179915 - BLOCK
      ?auto_179916 - BLOCK
      ?auto_179917 - BLOCK
      ?auto_179918 - BLOCK
      ?auto_179919 - BLOCK
      ?auto_179920 - BLOCK
      ?auto_179921 - BLOCK
    )
    :vars
    (
      ?auto_179922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179921 ?auto_179922 ) ( not ( = ?auto_179911 ?auto_179912 ) ) ( not ( = ?auto_179911 ?auto_179913 ) ) ( not ( = ?auto_179911 ?auto_179914 ) ) ( not ( = ?auto_179911 ?auto_179915 ) ) ( not ( = ?auto_179911 ?auto_179916 ) ) ( not ( = ?auto_179911 ?auto_179917 ) ) ( not ( = ?auto_179911 ?auto_179918 ) ) ( not ( = ?auto_179911 ?auto_179919 ) ) ( not ( = ?auto_179911 ?auto_179920 ) ) ( not ( = ?auto_179911 ?auto_179921 ) ) ( not ( = ?auto_179911 ?auto_179922 ) ) ( not ( = ?auto_179912 ?auto_179913 ) ) ( not ( = ?auto_179912 ?auto_179914 ) ) ( not ( = ?auto_179912 ?auto_179915 ) ) ( not ( = ?auto_179912 ?auto_179916 ) ) ( not ( = ?auto_179912 ?auto_179917 ) ) ( not ( = ?auto_179912 ?auto_179918 ) ) ( not ( = ?auto_179912 ?auto_179919 ) ) ( not ( = ?auto_179912 ?auto_179920 ) ) ( not ( = ?auto_179912 ?auto_179921 ) ) ( not ( = ?auto_179912 ?auto_179922 ) ) ( not ( = ?auto_179913 ?auto_179914 ) ) ( not ( = ?auto_179913 ?auto_179915 ) ) ( not ( = ?auto_179913 ?auto_179916 ) ) ( not ( = ?auto_179913 ?auto_179917 ) ) ( not ( = ?auto_179913 ?auto_179918 ) ) ( not ( = ?auto_179913 ?auto_179919 ) ) ( not ( = ?auto_179913 ?auto_179920 ) ) ( not ( = ?auto_179913 ?auto_179921 ) ) ( not ( = ?auto_179913 ?auto_179922 ) ) ( not ( = ?auto_179914 ?auto_179915 ) ) ( not ( = ?auto_179914 ?auto_179916 ) ) ( not ( = ?auto_179914 ?auto_179917 ) ) ( not ( = ?auto_179914 ?auto_179918 ) ) ( not ( = ?auto_179914 ?auto_179919 ) ) ( not ( = ?auto_179914 ?auto_179920 ) ) ( not ( = ?auto_179914 ?auto_179921 ) ) ( not ( = ?auto_179914 ?auto_179922 ) ) ( not ( = ?auto_179915 ?auto_179916 ) ) ( not ( = ?auto_179915 ?auto_179917 ) ) ( not ( = ?auto_179915 ?auto_179918 ) ) ( not ( = ?auto_179915 ?auto_179919 ) ) ( not ( = ?auto_179915 ?auto_179920 ) ) ( not ( = ?auto_179915 ?auto_179921 ) ) ( not ( = ?auto_179915 ?auto_179922 ) ) ( not ( = ?auto_179916 ?auto_179917 ) ) ( not ( = ?auto_179916 ?auto_179918 ) ) ( not ( = ?auto_179916 ?auto_179919 ) ) ( not ( = ?auto_179916 ?auto_179920 ) ) ( not ( = ?auto_179916 ?auto_179921 ) ) ( not ( = ?auto_179916 ?auto_179922 ) ) ( not ( = ?auto_179917 ?auto_179918 ) ) ( not ( = ?auto_179917 ?auto_179919 ) ) ( not ( = ?auto_179917 ?auto_179920 ) ) ( not ( = ?auto_179917 ?auto_179921 ) ) ( not ( = ?auto_179917 ?auto_179922 ) ) ( not ( = ?auto_179918 ?auto_179919 ) ) ( not ( = ?auto_179918 ?auto_179920 ) ) ( not ( = ?auto_179918 ?auto_179921 ) ) ( not ( = ?auto_179918 ?auto_179922 ) ) ( not ( = ?auto_179919 ?auto_179920 ) ) ( not ( = ?auto_179919 ?auto_179921 ) ) ( not ( = ?auto_179919 ?auto_179922 ) ) ( not ( = ?auto_179920 ?auto_179921 ) ) ( not ( = ?auto_179920 ?auto_179922 ) ) ( not ( = ?auto_179921 ?auto_179922 ) ) ( ON ?auto_179920 ?auto_179921 ) ( ON ?auto_179919 ?auto_179920 ) ( ON ?auto_179918 ?auto_179919 ) ( ON ?auto_179917 ?auto_179918 ) ( ON ?auto_179916 ?auto_179917 ) ( ON ?auto_179915 ?auto_179916 ) ( ON ?auto_179914 ?auto_179915 ) ( ON ?auto_179913 ?auto_179914 ) ( ON ?auto_179912 ?auto_179913 ) ( ON ?auto_179911 ?auto_179912 ) ( CLEAR ?auto_179911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_179911 )
      ( MAKE-11PILE ?auto_179911 ?auto_179912 ?auto_179913 ?auto_179914 ?auto_179915 ?auto_179916 ?auto_179917 ?auto_179918 ?auto_179919 ?auto_179920 ?auto_179921 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_179958 - BLOCK
      ?auto_179959 - BLOCK
      ?auto_179960 - BLOCK
      ?auto_179961 - BLOCK
      ?auto_179962 - BLOCK
      ?auto_179963 - BLOCK
      ?auto_179964 - BLOCK
      ?auto_179965 - BLOCK
      ?auto_179966 - BLOCK
      ?auto_179967 - BLOCK
      ?auto_179968 - BLOCK
      ?auto_179969 - BLOCK
    )
    :vars
    (
      ?auto_179970 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_179968 ) ( ON ?auto_179969 ?auto_179970 ) ( CLEAR ?auto_179969 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_179958 ) ( ON ?auto_179959 ?auto_179958 ) ( ON ?auto_179960 ?auto_179959 ) ( ON ?auto_179961 ?auto_179960 ) ( ON ?auto_179962 ?auto_179961 ) ( ON ?auto_179963 ?auto_179962 ) ( ON ?auto_179964 ?auto_179963 ) ( ON ?auto_179965 ?auto_179964 ) ( ON ?auto_179966 ?auto_179965 ) ( ON ?auto_179967 ?auto_179966 ) ( ON ?auto_179968 ?auto_179967 ) ( not ( = ?auto_179958 ?auto_179959 ) ) ( not ( = ?auto_179958 ?auto_179960 ) ) ( not ( = ?auto_179958 ?auto_179961 ) ) ( not ( = ?auto_179958 ?auto_179962 ) ) ( not ( = ?auto_179958 ?auto_179963 ) ) ( not ( = ?auto_179958 ?auto_179964 ) ) ( not ( = ?auto_179958 ?auto_179965 ) ) ( not ( = ?auto_179958 ?auto_179966 ) ) ( not ( = ?auto_179958 ?auto_179967 ) ) ( not ( = ?auto_179958 ?auto_179968 ) ) ( not ( = ?auto_179958 ?auto_179969 ) ) ( not ( = ?auto_179958 ?auto_179970 ) ) ( not ( = ?auto_179959 ?auto_179960 ) ) ( not ( = ?auto_179959 ?auto_179961 ) ) ( not ( = ?auto_179959 ?auto_179962 ) ) ( not ( = ?auto_179959 ?auto_179963 ) ) ( not ( = ?auto_179959 ?auto_179964 ) ) ( not ( = ?auto_179959 ?auto_179965 ) ) ( not ( = ?auto_179959 ?auto_179966 ) ) ( not ( = ?auto_179959 ?auto_179967 ) ) ( not ( = ?auto_179959 ?auto_179968 ) ) ( not ( = ?auto_179959 ?auto_179969 ) ) ( not ( = ?auto_179959 ?auto_179970 ) ) ( not ( = ?auto_179960 ?auto_179961 ) ) ( not ( = ?auto_179960 ?auto_179962 ) ) ( not ( = ?auto_179960 ?auto_179963 ) ) ( not ( = ?auto_179960 ?auto_179964 ) ) ( not ( = ?auto_179960 ?auto_179965 ) ) ( not ( = ?auto_179960 ?auto_179966 ) ) ( not ( = ?auto_179960 ?auto_179967 ) ) ( not ( = ?auto_179960 ?auto_179968 ) ) ( not ( = ?auto_179960 ?auto_179969 ) ) ( not ( = ?auto_179960 ?auto_179970 ) ) ( not ( = ?auto_179961 ?auto_179962 ) ) ( not ( = ?auto_179961 ?auto_179963 ) ) ( not ( = ?auto_179961 ?auto_179964 ) ) ( not ( = ?auto_179961 ?auto_179965 ) ) ( not ( = ?auto_179961 ?auto_179966 ) ) ( not ( = ?auto_179961 ?auto_179967 ) ) ( not ( = ?auto_179961 ?auto_179968 ) ) ( not ( = ?auto_179961 ?auto_179969 ) ) ( not ( = ?auto_179961 ?auto_179970 ) ) ( not ( = ?auto_179962 ?auto_179963 ) ) ( not ( = ?auto_179962 ?auto_179964 ) ) ( not ( = ?auto_179962 ?auto_179965 ) ) ( not ( = ?auto_179962 ?auto_179966 ) ) ( not ( = ?auto_179962 ?auto_179967 ) ) ( not ( = ?auto_179962 ?auto_179968 ) ) ( not ( = ?auto_179962 ?auto_179969 ) ) ( not ( = ?auto_179962 ?auto_179970 ) ) ( not ( = ?auto_179963 ?auto_179964 ) ) ( not ( = ?auto_179963 ?auto_179965 ) ) ( not ( = ?auto_179963 ?auto_179966 ) ) ( not ( = ?auto_179963 ?auto_179967 ) ) ( not ( = ?auto_179963 ?auto_179968 ) ) ( not ( = ?auto_179963 ?auto_179969 ) ) ( not ( = ?auto_179963 ?auto_179970 ) ) ( not ( = ?auto_179964 ?auto_179965 ) ) ( not ( = ?auto_179964 ?auto_179966 ) ) ( not ( = ?auto_179964 ?auto_179967 ) ) ( not ( = ?auto_179964 ?auto_179968 ) ) ( not ( = ?auto_179964 ?auto_179969 ) ) ( not ( = ?auto_179964 ?auto_179970 ) ) ( not ( = ?auto_179965 ?auto_179966 ) ) ( not ( = ?auto_179965 ?auto_179967 ) ) ( not ( = ?auto_179965 ?auto_179968 ) ) ( not ( = ?auto_179965 ?auto_179969 ) ) ( not ( = ?auto_179965 ?auto_179970 ) ) ( not ( = ?auto_179966 ?auto_179967 ) ) ( not ( = ?auto_179966 ?auto_179968 ) ) ( not ( = ?auto_179966 ?auto_179969 ) ) ( not ( = ?auto_179966 ?auto_179970 ) ) ( not ( = ?auto_179967 ?auto_179968 ) ) ( not ( = ?auto_179967 ?auto_179969 ) ) ( not ( = ?auto_179967 ?auto_179970 ) ) ( not ( = ?auto_179968 ?auto_179969 ) ) ( not ( = ?auto_179968 ?auto_179970 ) ) ( not ( = ?auto_179969 ?auto_179970 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_179969 ?auto_179970 )
      ( !STACK ?auto_179969 ?auto_179968 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_179983 - BLOCK
      ?auto_179984 - BLOCK
      ?auto_179985 - BLOCK
      ?auto_179986 - BLOCK
      ?auto_179987 - BLOCK
      ?auto_179988 - BLOCK
      ?auto_179989 - BLOCK
      ?auto_179990 - BLOCK
      ?auto_179991 - BLOCK
      ?auto_179992 - BLOCK
      ?auto_179993 - BLOCK
      ?auto_179994 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_179993 ) ( ON-TABLE ?auto_179994 ) ( CLEAR ?auto_179994 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_179983 ) ( ON ?auto_179984 ?auto_179983 ) ( ON ?auto_179985 ?auto_179984 ) ( ON ?auto_179986 ?auto_179985 ) ( ON ?auto_179987 ?auto_179986 ) ( ON ?auto_179988 ?auto_179987 ) ( ON ?auto_179989 ?auto_179988 ) ( ON ?auto_179990 ?auto_179989 ) ( ON ?auto_179991 ?auto_179990 ) ( ON ?auto_179992 ?auto_179991 ) ( ON ?auto_179993 ?auto_179992 ) ( not ( = ?auto_179983 ?auto_179984 ) ) ( not ( = ?auto_179983 ?auto_179985 ) ) ( not ( = ?auto_179983 ?auto_179986 ) ) ( not ( = ?auto_179983 ?auto_179987 ) ) ( not ( = ?auto_179983 ?auto_179988 ) ) ( not ( = ?auto_179983 ?auto_179989 ) ) ( not ( = ?auto_179983 ?auto_179990 ) ) ( not ( = ?auto_179983 ?auto_179991 ) ) ( not ( = ?auto_179983 ?auto_179992 ) ) ( not ( = ?auto_179983 ?auto_179993 ) ) ( not ( = ?auto_179983 ?auto_179994 ) ) ( not ( = ?auto_179984 ?auto_179985 ) ) ( not ( = ?auto_179984 ?auto_179986 ) ) ( not ( = ?auto_179984 ?auto_179987 ) ) ( not ( = ?auto_179984 ?auto_179988 ) ) ( not ( = ?auto_179984 ?auto_179989 ) ) ( not ( = ?auto_179984 ?auto_179990 ) ) ( not ( = ?auto_179984 ?auto_179991 ) ) ( not ( = ?auto_179984 ?auto_179992 ) ) ( not ( = ?auto_179984 ?auto_179993 ) ) ( not ( = ?auto_179984 ?auto_179994 ) ) ( not ( = ?auto_179985 ?auto_179986 ) ) ( not ( = ?auto_179985 ?auto_179987 ) ) ( not ( = ?auto_179985 ?auto_179988 ) ) ( not ( = ?auto_179985 ?auto_179989 ) ) ( not ( = ?auto_179985 ?auto_179990 ) ) ( not ( = ?auto_179985 ?auto_179991 ) ) ( not ( = ?auto_179985 ?auto_179992 ) ) ( not ( = ?auto_179985 ?auto_179993 ) ) ( not ( = ?auto_179985 ?auto_179994 ) ) ( not ( = ?auto_179986 ?auto_179987 ) ) ( not ( = ?auto_179986 ?auto_179988 ) ) ( not ( = ?auto_179986 ?auto_179989 ) ) ( not ( = ?auto_179986 ?auto_179990 ) ) ( not ( = ?auto_179986 ?auto_179991 ) ) ( not ( = ?auto_179986 ?auto_179992 ) ) ( not ( = ?auto_179986 ?auto_179993 ) ) ( not ( = ?auto_179986 ?auto_179994 ) ) ( not ( = ?auto_179987 ?auto_179988 ) ) ( not ( = ?auto_179987 ?auto_179989 ) ) ( not ( = ?auto_179987 ?auto_179990 ) ) ( not ( = ?auto_179987 ?auto_179991 ) ) ( not ( = ?auto_179987 ?auto_179992 ) ) ( not ( = ?auto_179987 ?auto_179993 ) ) ( not ( = ?auto_179987 ?auto_179994 ) ) ( not ( = ?auto_179988 ?auto_179989 ) ) ( not ( = ?auto_179988 ?auto_179990 ) ) ( not ( = ?auto_179988 ?auto_179991 ) ) ( not ( = ?auto_179988 ?auto_179992 ) ) ( not ( = ?auto_179988 ?auto_179993 ) ) ( not ( = ?auto_179988 ?auto_179994 ) ) ( not ( = ?auto_179989 ?auto_179990 ) ) ( not ( = ?auto_179989 ?auto_179991 ) ) ( not ( = ?auto_179989 ?auto_179992 ) ) ( not ( = ?auto_179989 ?auto_179993 ) ) ( not ( = ?auto_179989 ?auto_179994 ) ) ( not ( = ?auto_179990 ?auto_179991 ) ) ( not ( = ?auto_179990 ?auto_179992 ) ) ( not ( = ?auto_179990 ?auto_179993 ) ) ( not ( = ?auto_179990 ?auto_179994 ) ) ( not ( = ?auto_179991 ?auto_179992 ) ) ( not ( = ?auto_179991 ?auto_179993 ) ) ( not ( = ?auto_179991 ?auto_179994 ) ) ( not ( = ?auto_179992 ?auto_179993 ) ) ( not ( = ?auto_179992 ?auto_179994 ) ) ( not ( = ?auto_179993 ?auto_179994 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_179994 )
      ( !STACK ?auto_179994 ?auto_179993 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_180007 - BLOCK
      ?auto_180008 - BLOCK
      ?auto_180009 - BLOCK
      ?auto_180010 - BLOCK
      ?auto_180011 - BLOCK
      ?auto_180012 - BLOCK
      ?auto_180013 - BLOCK
      ?auto_180014 - BLOCK
      ?auto_180015 - BLOCK
      ?auto_180016 - BLOCK
      ?auto_180017 - BLOCK
      ?auto_180018 - BLOCK
    )
    :vars
    (
      ?auto_180019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180018 ?auto_180019 ) ( ON-TABLE ?auto_180007 ) ( ON ?auto_180008 ?auto_180007 ) ( ON ?auto_180009 ?auto_180008 ) ( ON ?auto_180010 ?auto_180009 ) ( ON ?auto_180011 ?auto_180010 ) ( ON ?auto_180012 ?auto_180011 ) ( ON ?auto_180013 ?auto_180012 ) ( ON ?auto_180014 ?auto_180013 ) ( ON ?auto_180015 ?auto_180014 ) ( ON ?auto_180016 ?auto_180015 ) ( not ( = ?auto_180007 ?auto_180008 ) ) ( not ( = ?auto_180007 ?auto_180009 ) ) ( not ( = ?auto_180007 ?auto_180010 ) ) ( not ( = ?auto_180007 ?auto_180011 ) ) ( not ( = ?auto_180007 ?auto_180012 ) ) ( not ( = ?auto_180007 ?auto_180013 ) ) ( not ( = ?auto_180007 ?auto_180014 ) ) ( not ( = ?auto_180007 ?auto_180015 ) ) ( not ( = ?auto_180007 ?auto_180016 ) ) ( not ( = ?auto_180007 ?auto_180017 ) ) ( not ( = ?auto_180007 ?auto_180018 ) ) ( not ( = ?auto_180007 ?auto_180019 ) ) ( not ( = ?auto_180008 ?auto_180009 ) ) ( not ( = ?auto_180008 ?auto_180010 ) ) ( not ( = ?auto_180008 ?auto_180011 ) ) ( not ( = ?auto_180008 ?auto_180012 ) ) ( not ( = ?auto_180008 ?auto_180013 ) ) ( not ( = ?auto_180008 ?auto_180014 ) ) ( not ( = ?auto_180008 ?auto_180015 ) ) ( not ( = ?auto_180008 ?auto_180016 ) ) ( not ( = ?auto_180008 ?auto_180017 ) ) ( not ( = ?auto_180008 ?auto_180018 ) ) ( not ( = ?auto_180008 ?auto_180019 ) ) ( not ( = ?auto_180009 ?auto_180010 ) ) ( not ( = ?auto_180009 ?auto_180011 ) ) ( not ( = ?auto_180009 ?auto_180012 ) ) ( not ( = ?auto_180009 ?auto_180013 ) ) ( not ( = ?auto_180009 ?auto_180014 ) ) ( not ( = ?auto_180009 ?auto_180015 ) ) ( not ( = ?auto_180009 ?auto_180016 ) ) ( not ( = ?auto_180009 ?auto_180017 ) ) ( not ( = ?auto_180009 ?auto_180018 ) ) ( not ( = ?auto_180009 ?auto_180019 ) ) ( not ( = ?auto_180010 ?auto_180011 ) ) ( not ( = ?auto_180010 ?auto_180012 ) ) ( not ( = ?auto_180010 ?auto_180013 ) ) ( not ( = ?auto_180010 ?auto_180014 ) ) ( not ( = ?auto_180010 ?auto_180015 ) ) ( not ( = ?auto_180010 ?auto_180016 ) ) ( not ( = ?auto_180010 ?auto_180017 ) ) ( not ( = ?auto_180010 ?auto_180018 ) ) ( not ( = ?auto_180010 ?auto_180019 ) ) ( not ( = ?auto_180011 ?auto_180012 ) ) ( not ( = ?auto_180011 ?auto_180013 ) ) ( not ( = ?auto_180011 ?auto_180014 ) ) ( not ( = ?auto_180011 ?auto_180015 ) ) ( not ( = ?auto_180011 ?auto_180016 ) ) ( not ( = ?auto_180011 ?auto_180017 ) ) ( not ( = ?auto_180011 ?auto_180018 ) ) ( not ( = ?auto_180011 ?auto_180019 ) ) ( not ( = ?auto_180012 ?auto_180013 ) ) ( not ( = ?auto_180012 ?auto_180014 ) ) ( not ( = ?auto_180012 ?auto_180015 ) ) ( not ( = ?auto_180012 ?auto_180016 ) ) ( not ( = ?auto_180012 ?auto_180017 ) ) ( not ( = ?auto_180012 ?auto_180018 ) ) ( not ( = ?auto_180012 ?auto_180019 ) ) ( not ( = ?auto_180013 ?auto_180014 ) ) ( not ( = ?auto_180013 ?auto_180015 ) ) ( not ( = ?auto_180013 ?auto_180016 ) ) ( not ( = ?auto_180013 ?auto_180017 ) ) ( not ( = ?auto_180013 ?auto_180018 ) ) ( not ( = ?auto_180013 ?auto_180019 ) ) ( not ( = ?auto_180014 ?auto_180015 ) ) ( not ( = ?auto_180014 ?auto_180016 ) ) ( not ( = ?auto_180014 ?auto_180017 ) ) ( not ( = ?auto_180014 ?auto_180018 ) ) ( not ( = ?auto_180014 ?auto_180019 ) ) ( not ( = ?auto_180015 ?auto_180016 ) ) ( not ( = ?auto_180015 ?auto_180017 ) ) ( not ( = ?auto_180015 ?auto_180018 ) ) ( not ( = ?auto_180015 ?auto_180019 ) ) ( not ( = ?auto_180016 ?auto_180017 ) ) ( not ( = ?auto_180016 ?auto_180018 ) ) ( not ( = ?auto_180016 ?auto_180019 ) ) ( not ( = ?auto_180017 ?auto_180018 ) ) ( not ( = ?auto_180017 ?auto_180019 ) ) ( not ( = ?auto_180018 ?auto_180019 ) ) ( CLEAR ?auto_180016 ) ( ON ?auto_180017 ?auto_180018 ) ( CLEAR ?auto_180017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_180007 ?auto_180008 ?auto_180009 ?auto_180010 ?auto_180011 ?auto_180012 ?auto_180013 ?auto_180014 ?auto_180015 ?auto_180016 ?auto_180017 )
      ( MAKE-12PILE ?auto_180007 ?auto_180008 ?auto_180009 ?auto_180010 ?auto_180011 ?auto_180012 ?auto_180013 ?auto_180014 ?auto_180015 ?auto_180016 ?auto_180017 ?auto_180018 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_180032 - BLOCK
      ?auto_180033 - BLOCK
      ?auto_180034 - BLOCK
      ?auto_180035 - BLOCK
      ?auto_180036 - BLOCK
      ?auto_180037 - BLOCK
      ?auto_180038 - BLOCK
      ?auto_180039 - BLOCK
      ?auto_180040 - BLOCK
      ?auto_180041 - BLOCK
      ?auto_180042 - BLOCK
      ?auto_180043 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180043 ) ( ON-TABLE ?auto_180032 ) ( ON ?auto_180033 ?auto_180032 ) ( ON ?auto_180034 ?auto_180033 ) ( ON ?auto_180035 ?auto_180034 ) ( ON ?auto_180036 ?auto_180035 ) ( ON ?auto_180037 ?auto_180036 ) ( ON ?auto_180038 ?auto_180037 ) ( ON ?auto_180039 ?auto_180038 ) ( ON ?auto_180040 ?auto_180039 ) ( ON ?auto_180041 ?auto_180040 ) ( not ( = ?auto_180032 ?auto_180033 ) ) ( not ( = ?auto_180032 ?auto_180034 ) ) ( not ( = ?auto_180032 ?auto_180035 ) ) ( not ( = ?auto_180032 ?auto_180036 ) ) ( not ( = ?auto_180032 ?auto_180037 ) ) ( not ( = ?auto_180032 ?auto_180038 ) ) ( not ( = ?auto_180032 ?auto_180039 ) ) ( not ( = ?auto_180032 ?auto_180040 ) ) ( not ( = ?auto_180032 ?auto_180041 ) ) ( not ( = ?auto_180032 ?auto_180042 ) ) ( not ( = ?auto_180032 ?auto_180043 ) ) ( not ( = ?auto_180033 ?auto_180034 ) ) ( not ( = ?auto_180033 ?auto_180035 ) ) ( not ( = ?auto_180033 ?auto_180036 ) ) ( not ( = ?auto_180033 ?auto_180037 ) ) ( not ( = ?auto_180033 ?auto_180038 ) ) ( not ( = ?auto_180033 ?auto_180039 ) ) ( not ( = ?auto_180033 ?auto_180040 ) ) ( not ( = ?auto_180033 ?auto_180041 ) ) ( not ( = ?auto_180033 ?auto_180042 ) ) ( not ( = ?auto_180033 ?auto_180043 ) ) ( not ( = ?auto_180034 ?auto_180035 ) ) ( not ( = ?auto_180034 ?auto_180036 ) ) ( not ( = ?auto_180034 ?auto_180037 ) ) ( not ( = ?auto_180034 ?auto_180038 ) ) ( not ( = ?auto_180034 ?auto_180039 ) ) ( not ( = ?auto_180034 ?auto_180040 ) ) ( not ( = ?auto_180034 ?auto_180041 ) ) ( not ( = ?auto_180034 ?auto_180042 ) ) ( not ( = ?auto_180034 ?auto_180043 ) ) ( not ( = ?auto_180035 ?auto_180036 ) ) ( not ( = ?auto_180035 ?auto_180037 ) ) ( not ( = ?auto_180035 ?auto_180038 ) ) ( not ( = ?auto_180035 ?auto_180039 ) ) ( not ( = ?auto_180035 ?auto_180040 ) ) ( not ( = ?auto_180035 ?auto_180041 ) ) ( not ( = ?auto_180035 ?auto_180042 ) ) ( not ( = ?auto_180035 ?auto_180043 ) ) ( not ( = ?auto_180036 ?auto_180037 ) ) ( not ( = ?auto_180036 ?auto_180038 ) ) ( not ( = ?auto_180036 ?auto_180039 ) ) ( not ( = ?auto_180036 ?auto_180040 ) ) ( not ( = ?auto_180036 ?auto_180041 ) ) ( not ( = ?auto_180036 ?auto_180042 ) ) ( not ( = ?auto_180036 ?auto_180043 ) ) ( not ( = ?auto_180037 ?auto_180038 ) ) ( not ( = ?auto_180037 ?auto_180039 ) ) ( not ( = ?auto_180037 ?auto_180040 ) ) ( not ( = ?auto_180037 ?auto_180041 ) ) ( not ( = ?auto_180037 ?auto_180042 ) ) ( not ( = ?auto_180037 ?auto_180043 ) ) ( not ( = ?auto_180038 ?auto_180039 ) ) ( not ( = ?auto_180038 ?auto_180040 ) ) ( not ( = ?auto_180038 ?auto_180041 ) ) ( not ( = ?auto_180038 ?auto_180042 ) ) ( not ( = ?auto_180038 ?auto_180043 ) ) ( not ( = ?auto_180039 ?auto_180040 ) ) ( not ( = ?auto_180039 ?auto_180041 ) ) ( not ( = ?auto_180039 ?auto_180042 ) ) ( not ( = ?auto_180039 ?auto_180043 ) ) ( not ( = ?auto_180040 ?auto_180041 ) ) ( not ( = ?auto_180040 ?auto_180042 ) ) ( not ( = ?auto_180040 ?auto_180043 ) ) ( not ( = ?auto_180041 ?auto_180042 ) ) ( not ( = ?auto_180041 ?auto_180043 ) ) ( not ( = ?auto_180042 ?auto_180043 ) ) ( CLEAR ?auto_180041 ) ( ON ?auto_180042 ?auto_180043 ) ( CLEAR ?auto_180042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_180032 ?auto_180033 ?auto_180034 ?auto_180035 ?auto_180036 ?auto_180037 ?auto_180038 ?auto_180039 ?auto_180040 ?auto_180041 ?auto_180042 )
      ( MAKE-12PILE ?auto_180032 ?auto_180033 ?auto_180034 ?auto_180035 ?auto_180036 ?auto_180037 ?auto_180038 ?auto_180039 ?auto_180040 ?auto_180041 ?auto_180042 ?auto_180043 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_180056 - BLOCK
      ?auto_180057 - BLOCK
      ?auto_180058 - BLOCK
      ?auto_180059 - BLOCK
      ?auto_180060 - BLOCK
      ?auto_180061 - BLOCK
      ?auto_180062 - BLOCK
      ?auto_180063 - BLOCK
      ?auto_180064 - BLOCK
      ?auto_180065 - BLOCK
      ?auto_180066 - BLOCK
      ?auto_180067 - BLOCK
    )
    :vars
    (
      ?auto_180068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180067 ?auto_180068 ) ( ON-TABLE ?auto_180056 ) ( ON ?auto_180057 ?auto_180056 ) ( ON ?auto_180058 ?auto_180057 ) ( ON ?auto_180059 ?auto_180058 ) ( ON ?auto_180060 ?auto_180059 ) ( ON ?auto_180061 ?auto_180060 ) ( ON ?auto_180062 ?auto_180061 ) ( ON ?auto_180063 ?auto_180062 ) ( ON ?auto_180064 ?auto_180063 ) ( not ( = ?auto_180056 ?auto_180057 ) ) ( not ( = ?auto_180056 ?auto_180058 ) ) ( not ( = ?auto_180056 ?auto_180059 ) ) ( not ( = ?auto_180056 ?auto_180060 ) ) ( not ( = ?auto_180056 ?auto_180061 ) ) ( not ( = ?auto_180056 ?auto_180062 ) ) ( not ( = ?auto_180056 ?auto_180063 ) ) ( not ( = ?auto_180056 ?auto_180064 ) ) ( not ( = ?auto_180056 ?auto_180065 ) ) ( not ( = ?auto_180056 ?auto_180066 ) ) ( not ( = ?auto_180056 ?auto_180067 ) ) ( not ( = ?auto_180056 ?auto_180068 ) ) ( not ( = ?auto_180057 ?auto_180058 ) ) ( not ( = ?auto_180057 ?auto_180059 ) ) ( not ( = ?auto_180057 ?auto_180060 ) ) ( not ( = ?auto_180057 ?auto_180061 ) ) ( not ( = ?auto_180057 ?auto_180062 ) ) ( not ( = ?auto_180057 ?auto_180063 ) ) ( not ( = ?auto_180057 ?auto_180064 ) ) ( not ( = ?auto_180057 ?auto_180065 ) ) ( not ( = ?auto_180057 ?auto_180066 ) ) ( not ( = ?auto_180057 ?auto_180067 ) ) ( not ( = ?auto_180057 ?auto_180068 ) ) ( not ( = ?auto_180058 ?auto_180059 ) ) ( not ( = ?auto_180058 ?auto_180060 ) ) ( not ( = ?auto_180058 ?auto_180061 ) ) ( not ( = ?auto_180058 ?auto_180062 ) ) ( not ( = ?auto_180058 ?auto_180063 ) ) ( not ( = ?auto_180058 ?auto_180064 ) ) ( not ( = ?auto_180058 ?auto_180065 ) ) ( not ( = ?auto_180058 ?auto_180066 ) ) ( not ( = ?auto_180058 ?auto_180067 ) ) ( not ( = ?auto_180058 ?auto_180068 ) ) ( not ( = ?auto_180059 ?auto_180060 ) ) ( not ( = ?auto_180059 ?auto_180061 ) ) ( not ( = ?auto_180059 ?auto_180062 ) ) ( not ( = ?auto_180059 ?auto_180063 ) ) ( not ( = ?auto_180059 ?auto_180064 ) ) ( not ( = ?auto_180059 ?auto_180065 ) ) ( not ( = ?auto_180059 ?auto_180066 ) ) ( not ( = ?auto_180059 ?auto_180067 ) ) ( not ( = ?auto_180059 ?auto_180068 ) ) ( not ( = ?auto_180060 ?auto_180061 ) ) ( not ( = ?auto_180060 ?auto_180062 ) ) ( not ( = ?auto_180060 ?auto_180063 ) ) ( not ( = ?auto_180060 ?auto_180064 ) ) ( not ( = ?auto_180060 ?auto_180065 ) ) ( not ( = ?auto_180060 ?auto_180066 ) ) ( not ( = ?auto_180060 ?auto_180067 ) ) ( not ( = ?auto_180060 ?auto_180068 ) ) ( not ( = ?auto_180061 ?auto_180062 ) ) ( not ( = ?auto_180061 ?auto_180063 ) ) ( not ( = ?auto_180061 ?auto_180064 ) ) ( not ( = ?auto_180061 ?auto_180065 ) ) ( not ( = ?auto_180061 ?auto_180066 ) ) ( not ( = ?auto_180061 ?auto_180067 ) ) ( not ( = ?auto_180061 ?auto_180068 ) ) ( not ( = ?auto_180062 ?auto_180063 ) ) ( not ( = ?auto_180062 ?auto_180064 ) ) ( not ( = ?auto_180062 ?auto_180065 ) ) ( not ( = ?auto_180062 ?auto_180066 ) ) ( not ( = ?auto_180062 ?auto_180067 ) ) ( not ( = ?auto_180062 ?auto_180068 ) ) ( not ( = ?auto_180063 ?auto_180064 ) ) ( not ( = ?auto_180063 ?auto_180065 ) ) ( not ( = ?auto_180063 ?auto_180066 ) ) ( not ( = ?auto_180063 ?auto_180067 ) ) ( not ( = ?auto_180063 ?auto_180068 ) ) ( not ( = ?auto_180064 ?auto_180065 ) ) ( not ( = ?auto_180064 ?auto_180066 ) ) ( not ( = ?auto_180064 ?auto_180067 ) ) ( not ( = ?auto_180064 ?auto_180068 ) ) ( not ( = ?auto_180065 ?auto_180066 ) ) ( not ( = ?auto_180065 ?auto_180067 ) ) ( not ( = ?auto_180065 ?auto_180068 ) ) ( not ( = ?auto_180066 ?auto_180067 ) ) ( not ( = ?auto_180066 ?auto_180068 ) ) ( not ( = ?auto_180067 ?auto_180068 ) ) ( ON ?auto_180066 ?auto_180067 ) ( CLEAR ?auto_180064 ) ( ON ?auto_180065 ?auto_180066 ) ( CLEAR ?auto_180065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_180056 ?auto_180057 ?auto_180058 ?auto_180059 ?auto_180060 ?auto_180061 ?auto_180062 ?auto_180063 ?auto_180064 ?auto_180065 )
      ( MAKE-12PILE ?auto_180056 ?auto_180057 ?auto_180058 ?auto_180059 ?auto_180060 ?auto_180061 ?auto_180062 ?auto_180063 ?auto_180064 ?auto_180065 ?auto_180066 ?auto_180067 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_180081 - BLOCK
      ?auto_180082 - BLOCK
      ?auto_180083 - BLOCK
      ?auto_180084 - BLOCK
      ?auto_180085 - BLOCK
      ?auto_180086 - BLOCK
      ?auto_180087 - BLOCK
      ?auto_180088 - BLOCK
      ?auto_180089 - BLOCK
      ?auto_180090 - BLOCK
      ?auto_180091 - BLOCK
      ?auto_180092 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180092 ) ( ON-TABLE ?auto_180081 ) ( ON ?auto_180082 ?auto_180081 ) ( ON ?auto_180083 ?auto_180082 ) ( ON ?auto_180084 ?auto_180083 ) ( ON ?auto_180085 ?auto_180084 ) ( ON ?auto_180086 ?auto_180085 ) ( ON ?auto_180087 ?auto_180086 ) ( ON ?auto_180088 ?auto_180087 ) ( ON ?auto_180089 ?auto_180088 ) ( not ( = ?auto_180081 ?auto_180082 ) ) ( not ( = ?auto_180081 ?auto_180083 ) ) ( not ( = ?auto_180081 ?auto_180084 ) ) ( not ( = ?auto_180081 ?auto_180085 ) ) ( not ( = ?auto_180081 ?auto_180086 ) ) ( not ( = ?auto_180081 ?auto_180087 ) ) ( not ( = ?auto_180081 ?auto_180088 ) ) ( not ( = ?auto_180081 ?auto_180089 ) ) ( not ( = ?auto_180081 ?auto_180090 ) ) ( not ( = ?auto_180081 ?auto_180091 ) ) ( not ( = ?auto_180081 ?auto_180092 ) ) ( not ( = ?auto_180082 ?auto_180083 ) ) ( not ( = ?auto_180082 ?auto_180084 ) ) ( not ( = ?auto_180082 ?auto_180085 ) ) ( not ( = ?auto_180082 ?auto_180086 ) ) ( not ( = ?auto_180082 ?auto_180087 ) ) ( not ( = ?auto_180082 ?auto_180088 ) ) ( not ( = ?auto_180082 ?auto_180089 ) ) ( not ( = ?auto_180082 ?auto_180090 ) ) ( not ( = ?auto_180082 ?auto_180091 ) ) ( not ( = ?auto_180082 ?auto_180092 ) ) ( not ( = ?auto_180083 ?auto_180084 ) ) ( not ( = ?auto_180083 ?auto_180085 ) ) ( not ( = ?auto_180083 ?auto_180086 ) ) ( not ( = ?auto_180083 ?auto_180087 ) ) ( not ( = ?auto_180083 ?auto_180088 ) ) ( not ( = ?auto_180083 ?auto_180089 ) ) ( not ( = ?auto_180083 ?auto_180090 ) ) ( not ( = ?auto_180083 ?auto_180091 ) ) ( not ( = ?auto_180083 ?auto_180092 ) ) ( not ( = ?auto_180084 ?auto_180085 ) ) ( not ( = ?auto_180084 ?auto_180086 ) ) ( not ( = ?auto_180084 ?auto_180087 ) ) ( not ( = ?auto_180084 ?auto_180088 ) ) ( not ( = ?auto_180084 ?auto_180089 ) ) ( not ( = ?auto_180084 ?auto_180090 ) ) ( not ( = ?auto_180084 ?auto_180091 ) ) ( not ( = ?auto_180084 ?auto_180092 ) ) ( not ( = ?auto_180085 ?auto_180086 ) ) ( not ( = ?auto_180085 ?auto_180087 ) ) ( not ( = ?auto_180085 ?auto_180088 ) ) ( not ( = ?auto_180085 ?auto_180089 ) ) ( not ( = ?auto_180085 ?auto_180090 ) ) ( not ( = ?auto_180085 ?auto_180091 ) ) ( not ( = ?auto_180085 ?auto_180092 ) ) ( not ( = ?auto_180086 ?auto_180087 ) ) ( not ( = ?auto_180086 ?auto_180088 ) ) ( not ( = ?auto_180086 ?auto_180089 ) ) ( not ( = ?auto_180086 ?auto_180090 ) ) ( not ( = ?auto_180086 ?auto_180091 ) ) ( not ( = ?auto_180086 ?auto_180092 ) ) ( not ( = ?auto_180087 ?auto_180088 ) ) ( not ( = ?auto_180087 ?auto_180089 ) ) ( not ( = ?auto_180087 ?auto_180090 ) ) ( not ( = ?auto_180087 ?auto_180091 ) ) ( not ( = ?auto_180087 ?auto_180092 ) ) ( not ( = ?auto_180088 ?auto_180089 ) ) ( not ( = ?auto_180088 ?auto_180090 ) ) ( not ( = ?auto_180088 ?auto_180091 ) ) ( not ( = ?auto_180088 ?auto_180092 ) ) ( not ( = ?auto_180089 ?auto_180090 ) ) ( not ( = ?auto_180089 ?auto_180091 ) ) ( not ( = ?auto_180089 ?auto_180092 ) ) ( not ( = ?auto_180090 ?auto_180091 ) ) ( not ( = ?auto_180090 ?auto_180092 ) ) ( not ( = ?auto_180091 ?auto_180092 ) ) ( ON ?auto_180091 ?auto_180092 ) ( CLEAR ?auto_180089 ) ( ON ?auto_180090 ?auto_180091 ) ( CLEAR ?auto_180090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_180081 ?auto_180082 ?auto_180083 ?auto_180084 ?auto_180085 ?auto_180086 ?auto_180087 ?auto_180088 ?auto_180089 ?auto_180090 )
      ( MAKE-12PILE ?auto_180081 ?auto_180082 ?auto_180083 ?auto_180084 ?auto_180085 ?auto_180086 ?auto_180087 ?auto_180088 ?auto_180089 ?auto_180090 ?auto_180091 ?auto_180092 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_180105 - BLOCK
      ?auto_180106 - BLOCK
      ?auto_180107 - BLOCK
      ?auto_180108 - BLOCK
      ?auto_180109 - BLOCK
      ?auto_180110 - BLOCK
      ?auto_180111 - BLOCK
      ?auto_180112 - BLOCK
      ?auto_180113 - BLOCK
      ?auto_180114 - BLOCK
      ?auto_180115 - BLOCK
      ?auto_180116 - BLOCK
    )
    :vars
    (
      ?auto_180117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180116 ?auto_180117 ) ( ON-TABLE ?auto_180105 ) ( ON ?auto_180106 ?auto_180105 ) ( ON ?auto_180107 ?auto_180106 ) ( ON ?auto_180108 ?auto_180107 ) ( ON ?auto_180109 ?auto_180108 ) ( ON ?auto_180110 ?auto_180109 ) ( ON ?auto_180111 ?auto_180110 ) ( ON ?auto_180112 ?auto_180111 ) ( not ( = ?auto_180105 ?auto_180106 ) ) ( not ( = ?auto_180105 ?auto_180107 ) ) ( not ( = ?auto_180105 ?auto_180108 ) ) ( not ( = ?auto_180105 ?auto_180109 ) ) ( not ( = ?auto_180105 ?auto_180110 ) ) ( not ( = ?auto_180105 ?auto_180111 ) ) ( not ( = ?auto_180105 ?auto_180112 ) ) ( not ( = ?auto_180105 ?auto_180113 ) ) ( not ( = ?auto_180105 ?auto_180114 ) ) ( not ( = ?auto_180105 ?auto_180115 ) ) ( not ( = ?auto_180105 ?auto_180116 ) ) ( not ( = ?auto_180105 ?auto_180117 ) ) ( not ( = ?auto_180106 ?auto_180107 ) ) ( not ( = ?auto_180106 ?auto_180108 ) ) ( not ( = ?auto_180106 ?auto_180109 ) ) ( not ( = ?auto_180106 ?auto_180110 ) ) ( not ( = ?auto_180106 ?auto_180111 ) ) ( not ( = ?auto_180106 ?auto_180112 ) ) ( not ( = ?auto_180106 ?auto_180113 ) ) ( not ( = ?auto_180106 ?auto_180114 ) ) ( not ( = ?auto_180106 ?auto_180115 ) ) ( not ( = ?auto_180106 ?auto_180116 ) ) ( not ( = ?auto_180106 ?auto_180117 ) ) ( not ( = ?auto_180107 ?auto_180108 ) ) ( not ( = ?auto_180107 ?auto_180109 ) ) ( not ( = ?auto_180107 ?auto_180110 ) ) ( not ( = ?auto_180107 ?auto_180111 ) ) ( not ( = ?auto_180107 ?auto_180112 ) ) ( not ( = ?auto_180107 ?auto_180113 ) ) ( not ( = ?auto_180107 ?auto_180114 ) ) ( not ( = ?auto_180107 ?auto_180115 ) ) ( not ( = ?auto_180107 ?auto_180116 ) ) ( not ( = ?auto_180107 ?auto_180117 ) ) ( not ( = ?auto_180108 ?auto_180109 ) ) ( not ( = ?auto_180108 ?auto_180110 ) ) ( not ( = ?auto_180108 ?auto_180111 ) ) ( not ( = ?auto_180108 ?auto_180112 ) ) ( not ( = ?auto_180108 ?auto_180113 ) ) ( not ( = ?auto_180108 ?auto_180114 ) ) ( not ( = ?auto_180108 ?auto_180115 ) ) ( not ( = ?auto_180108 ?auto_180116 ) ) ( not ( = ?auto_180108 ?auto_180117 ) ) ( not ( = ?auto_180109 ?auto_180110 ) ) ( not ( = ?auto_180109 ?auto_180111 ) ) ( not ( = ?auto_180109 ?auto_180112 ) ) ( not ( = ?auto_180109 ?auto_180113 ) ) ( not ( = ?auto_180109 ?auto_180114 ) ) ( not ( = ?auto_180109 ?auto_180115 ) ) ( not ( = ?auto_180109 ?auto_180116 ) ) ( not ( = ?auto_180109 ?auto_180117 ) ) ( not ( = ?auto_180110 ?auto_180111 ) ) ( not ( = ?auto_180110 ?auto_180112 ) ) ( not ( = ?auto_180110 ?auto_180113 ) ) ( not ( = ?auto_180110 ?auto_180114 ) ) ( not ( = ?auto_180110 ?auto_180115 ) ) ( not ( = ?auto_180110 ?auto_180116 ) ) ( not ( = ?auto_180110 ?auto_180117 ) ) ( not ( = ?auto_180111 ?auto_180112 ) ) ( not ( = ?auto_180111 ?auto_180113 ) ) ( not ( = ?auto_180111 ?auto_180114 ) ) ( not ( = ?auto_180111 ?auto_180115 ) ) ( not ( = ?auto_180111 ?auto_180116 ) ) ( not ( = ?auto_180111 ?auto_180117 ) ) ( not ( = ?auto_180112 ?auto_180113 ) ) ( not ( = ?auto_180112 ?auto_180114 ) ) ( not ( = ?auto_180112 ?auto_180115 ) ) ( not ( = ?auto_180112 ?auto_180116 ) ) ( not ( = ?auto_180112 ?auto_180117 ) ) ( not ( = ?auto_180113 ?auto_180114 ) ) ( not ( = ?auto_180113 ?auto_180115 ) ) ( not ( = ?auto_180113 ?auto_180116 ) ) ( not ( = ?auto_180113 ?auto_180117 ) ) ( not ( = ?auto_180114 ?auto_180115 ) ) ( not ( = ?auto_180114 ?auto_180116 ) ) ( not ( = ?auto_180114 ?auto_180117 ) ) ( not ( = ?auto_180115 ?auto_180116 ) ) ( not ( = ?auto_180115 ?auto_180117 ) ) ( not ( = ?auto_180116 ?auto_180117 ) ) ( ON ?auto_180115 ?auto_180116 ) ( ON ?auto_180114 ?auto_180115 ) ( CLEAR ?auto_180112 ) ( ON ?auto_180113 ?auto_180114 ) ( CLEAR ?auto_180113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_180105 ?auto_180106 ?auto_180107 ?auto_180108 ?auto_180109 ?auto_180110 ?auto_180111 ?auto_180112 ?auto_180113 )
      ( MAKE-12PILE ?auto_180105 ?auto_180106 ?auto_180107 ?auto_180108 ?auto_180109 ?auto_180110 ?auto_180111 ?auto_180112 ?auto_180113 ?auto_180114 ?auto_180115 ?auto_180116 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_180130 - BLOCK
      ?auto_180131 - BLOCK
      ?auto_180132 - BLOCK
      ?auto_180133 - BLOCK
      ?auto_180134 - BLOCK
      ?auto_180135 - BLOCK
      ?auto_180136 - BLOCK
      ?auto_180137 - BLOCK
      ?auto_180138 - BLOCK
      ?auto_180139 - BLOCK
      ?auto_180140 - BLOCK
      ?auto_180141 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180141 ) ( ON-TABLE ?auto_180130 ) ( ON ?auto_180131 ?auto_180130 ) ( ON ?auto_180132 ?auto_180131 ) ( ON ?auto_180133 ?auto_180132 ) ( ON ?auto_180134 ?auto_180133 ) ( ON ?auto_180135 ?auto_180134 ) ( ON ?auto_180136 ?auto_180135 ) ( ON ?auto_180137 ?auto_180136 ) ( not ( = ?auto_180130 ?auto_180131 ) ) ( not ( = ?auto_180130 ?auto_180132 ) ) ( not ( = ?auto_180130 ?auto_180133 ) ) ( not ( = ?auto_180130 ?auto_180134 ) ) ( not ( = ?auto_180130 ?auto_180135 ) ) ( not ( = ?auto_180130 ?auto_180136 ) ) ( not ( = ?auto_180130 ?auto_180137 ) ) ( not ( = ?auto_180130 ?auto_180138 ) ) ( not ( = ?auto_180130 ?auto_180139 ) ) ( not ( = ?auto_180130 ?auto_180140 ) ) ( not ( = ?auto_180130 ?auto_180141 ) ) ( not ( = ?auto_180131 ?auto_180132 ) ) ( not ( = ?auto_180131 ?auto_180133 ) ) ( not ( = ?auto_180131 ?auto_180134 ) ) ( not ( = ?auto_180131 ?auto_180135 ) ) ( not ( = ?auto_180131 ?auto_180136 ) ) ( not ( = ?auto_180131 ?auto_180137 ) ) ( not ( = ?auto_180131 ?auto_180138 ) ) ( not ( = ?auto_180131 ?auto_180139 ) ) ( not ( = ?auto_180131 ?auto_180140 ) ) ( not ( = ?auto_180131 ?auto_180141 ) ) ( not ( = ?auto_180132 ?auto_180133 ) ) ( not ( = ?auto_180132 ?auto_180134 ) ) ( not ( = ?auto_180132 ?auto_180135 ) ) ( not ( = ?auto_180132 ?auto_180136 ) ) ( not ( = ?auto_180132 ?auto_180137 ) ) ( not ( = ?auto_180132 ?auto_180138 ) ) ( not ( = ?auto_180132 ?auto_180139 ) ) ( not ( = ?auto_180132 ?auto_180140 ) ) ( not ( = ?auto_180132 ?auto_180141 ) ) ( not ( = ?auto_180133 ?auto_180134 ) ) ( not ( = ?auto_180133 ?auto_180135 ) ) ( not ( = ?auto_180133 ?auto_180136 ) ) ( not ( = ?auto_180133 ?auto_180137 ) ) ( not ( = ?auto_180133 ?auto_180138 ) ) ( not ( = ?auto_180133 ?auto_180139 ) ) ( not ( = ?auto_180133 ?auto_180140 ) ) ( not ( = ?auto_180133 ?auto_180141 ) ) ( not ( = ?auto_180134 ?auto_180135 ) ) ( not ( = ?auto_180134 ?auto_180136 ) ) ( not ( = ?auto_180134 ?auto_180137 ) ) ( not ( = ?auto_180134 ?auto_180138 ) ) ( not ( = ?auto_180134 ?auto_180139 ) ) ( not ( = ?auto_180134 ?auto_180140 ) ) ( not ( = ?auto_180134 ?auto_180141 ) ) ( not ( = ?auto_180135 ?auto_180136 ) ) ( not ( = ?auto_180135 ?auto_180137 ) ) ( not ( = ?auto_180135 ?auto_180138 ) ) ( not ( = ?auto_180135 ?auto_180139 ) ) ( not ( = ?auto_180135 ?auto_180140 ) ) ( not ( = ?auto_180135 ?auto_180141 ) ) ( not ( = ?auto_180136 ?auto_180137 ) ) ( not ( = ?auto_180136 ?auto_180138 ) ) ( not ( = ?auto_180136 ?auto_180139 ) ) ( not ( = ?auto_180136 ?auto_180140 ) ) ( not ( = ?auto_180136 ?auto_180141 ) ) ( not ( = ?auto_180137 ?auto_180138 ) ) ( not ( = ?auto_180137 ?auto_180139 ) ) ( not ( = ?auto_180137 ?auto_180140 ) ) ( not ( = ?auto_180137 ?auto_180141 ) ) ( not ( = ?auto_180138 ?auto_180139 ) ) ( not ( = ?auto_180138 ?auto_180140 ) ) ( not ( = ?auto_180138 ?auto_180141 ) ) ( not ( = ?auto_180139 ?auto_180140 ) ) ( not ( = ?auto_180139 ?auto_180141 ) ) ( not ( = ?auto_180140 ?auto_180141 ) ) ( ON ?auto_180140 ?auto_180141 ) ( ON ?auto_180139 ?auto_180140 ) ( CLEAR ?auto_180137 ) ( ON ?auto_180138 ?auto_180139 ) ( CLEAR ?auto_180138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_180130 ?auto_180131 ?auto_180132 ?auto_180133 ?auto_180134 ?auto_180135 ?auto_180136 ?auto_180137 ?auto_180138 )
      ( MAKE-12PILE ?auto_180130 ?auto_180131 ?auto_180132 ?auto_180133 ?auto_180134 ?auto_180135 ?auto_180136 ?auto_180137 ?auto_180138 ?auto_180139 ?auto_180140 ?auto_180141 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_180154 - BLOCK
      ?auto_180155 - BLOCK
      ?auto_180156 - BLOCK
      ?auto_180157 - BLOCK
      ?auto_180158 - BLOCK
      ?auto_180159 - BLOCK
      ?auto_180160 - BLOCK
      ?auto_180161 - BLOCK
      ?auto_180162 - BLOCK
      ?auto_180163 - BLOCK
      ?auto_180164 - BLOCK
      ?auto_180165 - BLOCK
    )
    :vars
    (
      ?auto_180166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180165 ?auto_180166 ) ( ON-TABLE ?auto_180154 ) ( ON ?auto_180155 ?auto_180154 ) ( ON ?auto_180156 ?auto_180155 ) ( ON ?auto_180157 ?auto_180156 ) ( ON ?auto_180158 ?auto_180157 ) ( ON ?auto_180159 ?auto_180158 ) ( ON ?auto_180160 ?auto_180159 ) ( not ( = ?auto_180154 ?auto_180155 ) ) ( not ( = ?auto_180154 ?auto_180156 ) ) ( not ( = ?auto_180154 ?auto_180157 ) ) ( not ( = ?auto_180154 ?auto_180158 ) ) ( not ( = ?auto_180154 ?auto_180159 ) ) ( not ( = ?auto_180154 ?auto_180160 ) ) ( not ( = ?auto_180154 ?auto_180161 ) ) ( not ( = ?auto_180154 ?auto_180162 ) ) ( not ( = ?auto_180154 ?auto_180163 ) ) ( not ( = ?auto_180154 ?auto_180164 ) ) ( not ( = ?auto_180154 ?auto_180165 ) ) ( not ( = ?auto_180154 ?auto_180166 ) ) ( not ( = ?auto_180155 ?auto_180156 ) ) ( not ( = ?auto_180155 ?auto_180157 ) ) ( not ( = ?auto_180155 ?auto_180158 ) ) ( not ( = ?auto_180155 ?auto_180159 ) ) ( not ( = ?auto_180155 ?auto_180160 ) ) ( not ( = ?auto_180155 ?auto_180161 ) ) ( not ( = ?auto_180155 ?auto_180162 ) ) ( not ( = ?auto_180155 ?auto_180163 ) ) ( not ( = ?auto_180155 ?auto_180164 ) ) ( not ( = ?auto_180155 ?auto_180165 ) ) ( not ( = ?auto_180155 ?auto_180166 ) ) ( not ( = ?auto_180156 ?auto_180157 ) ) ( not ( = ?auto_180156 ?auto_180158 ) ) ( not ( = ?auto_180156 ?auto_180159 ) ) ( not ( = ?auto_180156 ?auto_180160 ) ) ( not ( = ?auto_180156 ?auto_180161 ) ) ( not ( = ?auto_180156 ?auto_180162 ) ) ( not ( = ?auto_180156 ?auto_180163 ) ) ( not ( = ?auto_180156 ?auto_180164 ) ) ( not ( = ?auto_180156 ?auto_180165 ) ) ( not ( = ?auto_180156 ?auto_180166 ) ) ( not ( = ?auto_180157 ?auto_180158 ) ) ( not ( = ?auto_180157 ?auto_180159 ) ) ( not ( = ?auto_180157 ?auto_180160 ) ) ( not ( = ?auto_180157 ?auto_180161 ) ) ( not ( = ?auto_180157 ?auto_180162 ) ) ( not ( = ?auto_180157 ?auto_180163 ) ) ( not ( = ?auto_180157 ?auto_180164 ) ) ( not ( = ?auto_180157 ?auto_180165 ) ) ( not ( = ?auto_180157 ?auto_180166 ) ) ( not ( = ?auto_180158 ?auto_180159 ) ) ( not ( = ?auto_180158 ?auto_180160 ) ) ( not ( = ?auto_180158 ?auto_180161 ) ) ( not ( = ?auto_180158 ?auto_180162 ) ) ( not ( = ?auto_180158 ?auto_180163 ) ) ( not ( = ?auto_180158 ?auto_180164 ) ) ( not ( = ?auto_180158 ?auto_180165 ) ) ( not ( = ?auto_180158 ?auto_180166 ) ) ( not ( = ?auto_180159 ?auto_180160 ) ) ( not ( = ?auto_180159 ?auto_180161 ) ) ( not ( = ?auto_180159 ?auto_180162 ) ) ( not ( = ?auto_180159 ?auto_180163 ) ) ( not ( = ?auto_180159 ?auto_180164 ) ) ( not ( = ?auto_180159 ?auto_180165 ) ) ( not ( = ?auto_180159 ?auto_180166 ) ) ( not ( = ?auto_180160 ?auto_180161 ) ) ( not ( = ?auto_180160 ?auto_180162 ) ) ( not ( = ?auto_180160 ?auto_180163 ) ) ( not ( = ?auto_180160 ?auto_180164 ) ) ( not ( = ?auto_180160 ?auto_180165 ) ) ( not ( = ?auto_180160 ?auto_180166 ) ) ( not ( = ?auto_180161 ?auto_180162 ) ) ( not ( = ?auto_180161 ?auto_180163 ) ) ( not ( = ?auto_180161 ?auto_180164 ) ) ( not ( = ?auto_180161 ?auto_180165 ) ) ( not ( = ?auto_180161 ?auto_180166 ) ) ( not ( = ?auto_180162 ?auto_180163 ) ) ( not ( = ?auto_180162 ?auto_180164 ) ) ( not ( = ?auto_180162 ?auto_180165 ) ) ( not ( = ?auto_180162 ?auto_180166 ) ) ( not ( = ?auto_180163 ?auto_180164 ) ) ( not ( = ?auto_180163 ?auto_180165 ) ) ( not ( = ?auto_180163 ?auto_180166 ) ) ( not ( = ?auto_180164 ?auto_180165 ) ) ( not ( = ?auto_180164 ?auto_180166 ) ) ( not ( = ?auto_180165 ?auto_180166 ) ) ( ON ?auto_180164 ?auto_180165 ) ( ON ?auto_180163 ?auto_180164 ) ( ON ?auto_180162 ?auto_180163 ) ( CLEAR ?auto_180160 ) ( ON ?auto_180161 ?auto_180162 ) ( CLEAR ?auto_180161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_180154 ?auto_180155 ?auto_180156 ?auto_180157 ?auto_180158 ?auto_180159 ?auto_180160 ?auto_180161 )
      ( MAKE-12PILE ?auto_180154 ?auto_180155 ?auto_180156 ?auto_180157 ?auto_180158 ?auto_180159 ?auto_180160 ?auto_180161 ?auto_180162 ?auto_180163 ?auto_180164 ?auto_180165 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_180179 - BLOCK
      ?auto_180180 - BLOCK
      ?auto_180181 - BLOCK
      ?auto_180182 - BLOCK
      ?auto_180183 - BLOCK
      ?auto_180184 - BLOCK
      ?auto_180185 - BLOCK
      ?auto_180186 - BLOCK
      ?auto_180187 - BLOCK
      ?auto_180188 - BLOCK
      ?auto_180189 - BLOCK
      ?auto_180190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180190 ) ( ON-TABLE ?auto_180179 ) ( ON ?auto_180180 ?auto_180179 ) ( ON ?auto_180181 ?auto_180180 ) ( ON ?auto_180182 ?auto_180181 ) ( ON ?auto_180183 ?auto_180182 ) ( ON ?auto_180184 ?auto_180183 ) ( ON ?auto_180185 ?auto_180184 ) ( not ( = ?auto_180179 ?auto_180180 ) ) ( not ( = ?auto_180179 ?auto_180181 ) ) ( not ( = ?auto_180179 ?auto_180182 ) ) ( not ( = ?auto_180179 ?auto_180183 ) ) ( not ( = ?auto_180179 ?auto_180184 ) ) ( not ( = ?auto_180179 ?auto_180185 ) ) ( not ( = ?auto_180179 ?auto_180186 ) ) ( not ( = ?auto_180179 ?auto_180187 ) ) ( not ( = ?auto_180179 ?auto_180188 ) ) ( not ( = ?auto_180179 ?auto_180189 ) ) ( not ( = ?auto_180179 ?auto_180190 ) ) ( not ( = ?auto_180180 ?auto_180181 ) ) ( not ( = ?auto_180180 ?auto_180182 ) ) ( not ( = ?auto_180180 ?auto_180183 ) ) ( not ( = ?auto_180180 ?auto_180184 ) ) ( not ( = ?auto_180180 ?auto_180185 ) ) ( not ( = ?auto_180180 ?auto_180186 ) ) ( not ( = ?auto_180180 ?auto_180187 ) ) ( not ( = ?auto_180180 ?auto_180188 ) ) ( not ( = ?auto_180180 ?auto_180189 ) ) ( not ( = ?auto_180180 ?auto_180190 ) ) ( not ( = ?auto_180181 ?auto_180182 ) ) ( not ( = ?auto_180181 ?auto_180183 ) ) ( not ( = ?auto_180181 ?auto_180184 ) ) ( not ( = ?auto_180181 ?auto_180185 ) ) ( not ( = ?auto_180181 ?auto_180186 ) ) ( not ( = ?auto_180181 ?auto_180187 ) ) ( not ( = ?auto_180181 ?auto_180188 ) ) ( not ( = ?auto_180181 ?auto_180189 ) ) ( not ( = ?auto_180181 ?auto_180190 ) ) ( not ( = ?auto_180182 ?auto_180183 ) ) ( not ( = ?auto_180182 ?auto_180184 ) ) ( not ( = ?auto_180182 ?auto_180185 ) ) ( not ( = ?auto_180182 ?auto_180186 ) ) ( not ( = ?auto_180182 ?auto_180187 ) ) ( not ( = ?auto_180182 ?auto_180188 ) ) ( not ( = ?auto_180182 ?auto_180189 ) ) ( not ( = ?auto_180182 ?auto_180190 ) ) ( not ( = ?auto_180183 ?auto_180184 ) ) ( not ( = ?auto_180183 ?auto_180185 ) ) ( not ( = ?auto_180183 ?auto_180186 ) ) ( not ( = ?auto_180183 ?auto_180187 ) ) ( not ( = ?auto_180183 ?auto_180188 ) ) ( not ( = ?auto_180183 ?auto_180189 ) ) ( not ( = ?auto_180183 ?auto_180190 ) ) ( not ( = ?auto_180184 ?auto_180185 ) ) ( not ( = ?auto_180184 ?auto_180186 ) ) ( not ( = ?auto_180184 ?auto_180187 ) ) ( not ( = ?auto_180184 ?auto_180188 ) ) ( not ( = ?auto_180184 ?auto_180189 ) ) ( not ( = ?auto_180184 ?auto_180190 ) ) ( not ( = ?auto_180185 ?auto_180186 ) ) ( not ( = ?auto_180185 ?auto_180187 ) ) ( not ( = ?auto_180185 ?auto_180188 ) ) ( not ( = ?auto_180185 ?auto_180189 ) ) ( not ( = ?auto_180185 ?auto_180190 ) ) ( not ( = ?auto_180186 ?auto_180187 ) ) ( not ( = ?auto_180186 ?auto_180188 ) ) ( not ( = ?auto_180186 ?auto_180189 ) ) ( not ( = ?auto_180186 ?auto_180190 ) ) ( not ( = ?auto_180187 ?auto_180188 ) ) ( not ( = ?auto_180187 ?auto_180189 ) ) ( not ( = ?auto_180187 ?auto_180190 ) ) ( not ( = ?auto_180188 ?auto_180189 ) ) ( not ( = ?auto_180188 ?auto_180190 ) ) ( not ( = ?auto_180189 ?auto_180190 ) ) ( ON ?auto_180189 ?auto_180190 ) ( ON ?auto_180188 ?auto_180189 ) ( ON ?auto_180187 ?auto_180188 ) ( CLEAR ?auto_180185 ) ( ON ?auto_180186 ?auto_180187 ) ( CLEAR ?auto_180186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_180179 ?auto_180180 ?auto_180181 ?auto_180182 ?auto_180183 ?auto_180184 ?auto_180185 ?auto_180186 )
      ( MAKE-12PILE ?auto_180179 ?auto_180180 ?auto_180181 ?auto_180182 ?auto_180183 ?auto_180184 ?auto_180185 ?auto_180186 ?auto_180187 ?auto_180188 ?auto_180189 ?auto_180190 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_180203 - BLOCK
      ?auto_180204 - BLOCK
      ?auto_180205 - BLOCK
      ?auto_180206 - BLOCK
      ?auto_180207 - BLOCK
      ?auto_180208 - BLOCK
      ?auto_180209 - BLOCK
      ?auto_180210 - BLOCK
      ?auto_180211 - BLOCK
      ?auto_180212 - BLOCK
      ?auto_180213 - BLOCK
      ?auto_180214 - BLOCK
    )
    :vars
    (
      ?auto_180215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180214 ?auto_180215 ) ( ON-TABLE ?auto_180203 ) ( ON ?auto_180204 ?auto_180203 ) ( ON ?auto_180205 ?auto_180204 ) ( ON ?auto_180206 ?auto_180205 ) ( ON ?auto_180207 ?auto_180206 ) ( ON ?auto_180208 ?auto_180207 ) ( not ( = ?auto_180203 ?auto_180204 ) ) ( not ( = ?auto_180203 ?auto_180205 ) ) ( not ( = ?auto_180203 ?auto_180206 ) ) ( not ( = ?auto_180203 ?auto_180207 ) ) ( not ( = ?auto_180203 ?auto_180208 ) ) ( not ( = ?auto_180203 ?auto_180209 ) ) ( not ( = ?auto_180203 ?auto_180210 ) ) ( not ( = ?auto_180203 ?auto_180211 ) ) ( not ( = ?auto_180203 ?auto_180212 ) ) ( not ( = ?auto_180203 ?auto_180213 ) ) ( not ( = ?auto_180203 ?auto_180214 ) ) ( not ( = ?auto_180203 ?auto_180215 ) ) ( not ( = ?auto_180204 ?auto_180205 ) ) ( not ( = ?auto_180204 ?auto_180206 ) ) ( not ( = ?auto_180204 ?auto_180207 ) ) ( not ( = ?auto_180204 ?auto_180208 ) ) ( not ( = ?auto_180204 ?auto_180209 ) ) ( not ( = ?auto_180204 ?auto_180210 ) ) ( not ( = ?auto_180204 ?auto_180211 ) ) ( not ( = ?auto_180204 ?auto_180212 ) ) ( not ( = ?auto_180204 ?auto_180213 ) ) ( not ( = ?auto_180204 ?auto_180214 ) ) ( not ( = ?auto_180204 ?auto_180215 ) ) ( not ( = ?auto_180205 ?auto_180206 ) ) ( not ( = ?auto_180205 ?auto_180207 ) ) ( not ( = ?auto_180205 ?auto_180208 ) ) ( not ( = ?auto_180205 ?auto_180209 ) ) ( not ( = ?auto_180205 ?auto_180210 ) ) ( not ( = ?auto_180205 ?auto_180211 ) ) ( not ( = ?auto_180205 ?auto_180212 ) ) ( not ( = ?auto_180205 ?auto_180213 ) ) ( not ( = ?auto_180205 ?auto_180214 ) ) ( not ( = ?auto_180205 ?auto_180215 ) ) ( not ( = ?auto_180206 ?auto_180207 ) ) ( not ( = ?auto_180206 ?auto_180208 ) ) ( not ( = ?auto_180206 ?auto_180209 ) ) ( not ( = ?auto_180206 ?auto_180210 ) ) ( not ( = ?auto_180206 ?auto_180211 ) ) ( not ( = ?auto_180206 ?auto_180212 ) ) ( not ( = ?auto_180206 ?auto_180213 ) ) ( not ( = ?auto_180206 ?auto_180214 ) ) ( not ( = ?auto_180206 ?auto_180215 ) ) ( not ( = ?auto_180207 ?auto_180208 ) ) ( not ( = ?auto_180207 ?auto_180209 ) ) ( not ( = ?auto_180207 ?auto_180210 ) ) ( not ( = ?auto_180207 ?auto_180211 ) ) ( not ( = ?auto_180207 ?auto_180212 ) ) ( not ( = ?auto_180207 ?auto_180213 ) ) ( not ( = ?auto_180207 ?auto_180214 ) ) ( not ( = ?auto_180207 ?auto_180215 ) ) ( not ( = ?auto_180208 ?auto_180209 ) ) ( not ( = ?auto_180208 ?auto_180210 ) ) ( not ( = ?auto_180208 ?auto_180211 ) ) ( not ( = ?auto_180208 ?auto_180212 ) ) ( not ( = ?auto_180208 ?auto_180213 ) ) ( not ( = ?auto_180208 ?auto_180214 ) ) ( not ( = ?auto_180208 ?auto_180215 ) ) ( not ( = ?auto_180209 ?auto_180210 ) ) ( not ( = ?auto_180209 ?auto_180211 ) ) ( not ( = ?auto_180209 ?auto_180212 ) ) ( not ( = ?auto_180209 ?auto_180213 ) ) ( not ( = ?auto_180209 ?auto_180214 ) ) ( not ( = ?auto_180209 ?auto_180215 ) ) ( not ( = ?auto_180210 ?auto_180211 ) ) ( not ( = ?auto_180210 ?auto_180212 ) ) ( not ( = ?auto_180210 ?auto_180213 ) ) ( not ( = ?auto_180210 ?auto_180214 ) ) ( not ( = ?auto_180210 ?auto_180215 ) ) ( not ( = ?auto_180211 ?auto_180212 ) ) ( not ( = ?auto_180211 ?auto_180213 ) ) ( not ( = ?auto_180211 ?auto_180214 ) ) ( not ( = ?auto_180211 ?auto_180215 ) ) ( not ( = ?auto_180212 ?auto_180213 ) ) ( not ( = ?auto_180212 ?auto_180214 ) ) ( not ( = ?auto_180212 ?auto_180215 ) ) ( not ( = ?auto_180213 ?auto_180214 ) ) ( not ( = ?auto_180213 ?auto_180215 ) ) ( not ( = ?auto_180214 ?auto_180215 ) ) ( ON ?auto_180213 ?auto_180214 ) ( ON ?auto_180212 ?auto_180213 ) ( ON ?auto_180211 ?auto_180212 ) ( ON ?auto_180210 ?auto_180211 ) ( CLEAR ?auto_180208 ) ( ON ?auto_180209 ?auto_180210 ) ( CLEAR ?auto_180209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180203 ?auto_180204 ?auto_180205 ?auto_180206 ?auto_180207 ?auto_180208 ?auto_180209 )
      ( MAKE-12PILE ?auto_180203 ?auto_180204 ?auto_180205 ?auto_180206 ?auto_180207 ?auto_180208 ?auto_180209 ?auto_180210 ?auto_180211 ?auto_180212 ?auto_180213 ?auto_180214 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_180228 - BLOCK
      ?auto_180229 - BLOCK
      ?auto_180230 - BLOCK
      ?auto_180231 - BLOCK
      ?auto_180232 - BLOCK
      ?auto_180233 - BLOCK
      ?auto_180234 - BLOCK
      ?auto_180235 - BLOCK
      ?auto_180236 - BLOCK
      ?auto_180237 - BLOCK
      ?auto_180238 - BLOCK
      ?auto_180239 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180239 ) ( ON-TABLE ?auto_180228 ) ( ON ?auto_180229 ?auto_180228 ) ( ON ?auto_180230 ?auto_180229 ) ( ON ?auto_180231 ?auto_180230 ) ( ON ?auto_180232 ?auto_180231 ) ( ON ?auto_180233 ?auto_180232 ) ( not ( = ?auto_180228 ?auto_180229 ) ) ( not ( = ?auto_180228 ?auto_180230 ) ) ( not ( = ?auto_180228 ?auto_180231 ) ) ( not ( = ?auto_180228 ?auto_180232 ) ) ( not ( = ?auto_180228 ?auto_180233 ) ) ( not ( = ?auto_180228 ?auto_180234 ) ) ( not ( = ?auto_180228 ?auto_180235 ) ) ( not ( = ?auto_180228 ?auto_180236 ) ) ( not ( = ?auto_180228 ?auto_180237 ) ) ( not ( = ?auto_180228 ?auto_180238 ) ) ( not ( = ?auto_180228 ?auto_180239 ) ) ( not ( = ?auto_180229 ?auto_180230 ) ) ( not ( = ?auto_180229 ?auto_180231 ) ) ( not ( = ?auto_180229 ?auto_180232 ) ) ( not ( = ?auto_180229 ?auto_180233 ) ) ( not ( = ?auto_180229 ?auto_180234 ) ) ( not ( = ?auto_180229 ?auto_180235 ) ) ( not ( = ?auto_180229 ?auto_180236 ) ) ( not ( = ?auto_180229 ?auto_180237 ) ) ( not ( = ?auto_180229 ?auto_180238 ) ) ( not ( = ?auto_180229 ?auto_180239 ) ) ( not ( = ?auto_180230 ?auto_180231 ) ) ( not ( = ?auto_180230 ?auto_180232 ) ) ( not ( = ?auto_180230 ?auto_180233 ) ) ( not ( = ?auto_180230 ?auto_180234 ) ) ( not ( = ?auto_180230 ?auto_180235 ) ) ( not ( = ?auto_180230 ?auto_180236 ) ) ( not ( = ?auto_180230 ?auto_180237 ) ) ( not ( = ?auto_180230 ?auto_180238 ) ) ( not ( = ?auto_180230 ?auto_180239 ) ) ( not ( = ?auto_180231 ?auto_180232 ) ) ( not ( = ?auto_180231 ?auto_180233 ) ) ( not ( = ?auto_180231 ?auto_180234 ) ) ( not ( = ?auto_180231 ?auto_180235 ) ) ( not ( = ?auto_180231 ?auto_180236 ) ) ( not ( = ?auto_180231 ?auto_180237 ) ) ( not ( = ?auto_180231 ?auto_180238 ) ) ( not ( = ?auto_180231 ?auto_180239 ) ) ( not ( = ?auto_180232 ?auto_180233 ) ) ( not ( = ?auto_180232 ?auto_180234 ) ) ( not ( = ?auto_180232 ?auto_180235 ) ) ( not ( = ?auto_180232 ?auto_180236 ) ) ( not ( = ?auto_180232 ?auto_180237 ) ) ( not ( = ?auto_180232 ?auto_180238 ) ) ( not ( = ?auto_180232 ?auto_180239 ) ) ( not ( = ?auto_180233 ?auto_180234 ) ) ( not ( = ?auto_180233 ?auto_180235 ) ) ( not ( = ?auto_180233 ?auto_180236 ) ) ( not ( = ?auto_180233 ?auto_180237 ) ) ( not ( = ?auto_180233 ?auto_180238 ) ) ( not ( = ?auto_180233 ?auto_180239 ) ) ( not ( = ?auto_180234 ?auto_180235 ) ) ( not ( = ?auto_180234 ?auto_180236 ) ) ( not ( = ?auto_180234 ?auto_180237 ) ) ( not ( = ?auto_180234 ?auto_180238 ) ) ( not ( = ?auto_180234 ?auto_180239 ) ) ( not ( = ?auto_180235 ?auto_180236 ) ) ( not ( = ?auto_180235 ?auto_180237 ) ) ( not ( = ?auto_180235 ?auto_180238 ) ) ( not ( = ?auto_180235 ?auto_180239 ) ) ( not ( = ?auto_180236 ?auto_180237 ) ) ( not ( = ?auto_180236 ?auto_180238 ) ) ( not ( = ?auto_180236 ?auto_180239 ) ) ( not ( = ?auto_180237 ?auto_180238 ) ) ( not ( = ?auto_180237 ?auto_180239 ) ) ( not ( = ?auto_180238 ?auto_180239 ) ) ( ON ?auto_180238 ?auto_180239 ) ( ON ?auto_180237 ?auto_180238 ) ( ON ?auto_180236 ?auto_180237 ) ( ON ?auto_180235 ?auto_180236 ) ( CLEAR ?auto_180233 ) ( ON ?auto_180234 ?auto_180235 ) ( CLEAR ?auto_180234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_180228 ?auto_180229 ?auto_180230 ?auto_180231 ?auto_180232 ?auto_180233 ?auto_180234 )
      ( MAKE-12PILE ?auto_180228 ?auto_180229 ?auto_180230 ?auto_180231 ?auto_180232 ?auto_180233 ?auto_180234 ?auto_180235 ?auto_180236 ?auto_180237 ?auto_180238 ?auto_180239 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_180252 - BLOCK
      ?auto_180253 - BLOCK
      ?auto_180254 - BLOCK
      ?auto_180255 - BLOCK
      ?auto_180256 - BLOCK
      ?auto_180257 - BLOCK
      ?auto_180258 - BLOCK
      ?auto_180259 - BLOCK
      ?auto_180260 - BLOCK
      ?auto_180261 - BLOCK
      ?auto_180262 - BLOCK
      ?auto_180263 - BLOCK
    )
    :vars
    (
      ?auto_180264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180263 ?auto_180264 ) ( ON-TABLE ?auto_180252 ) ( ON ?auto_180253 ?auto_180252 ) ( ON ?auto_180254 ?auto_180253 ) ( ON ?auto_180255 ?auto_180254 ) ( ON ?auto_180256 ?auto_180255 ) ( not ( = ?auto_180252 ?auto_180253 ) ) ( not ( = ?auto_180252 ?auto_180254 ) ) ( not ( = ?auto_180252 ?auto_180255 ) ) ( not ( = ?auto_180252 ?auto_180256 ) ) ( not ( = ?auto_180252 ?auto_180257 ) ) ( not ( = ?auto_180252 ?auto_180258 ) ) ( not ( = ?auto_180252 ?auto_180259 ) ) ( not ( = ?auto_180252 ?auto_180260 ) ) ( not ( = ?auto_180252 ?auto_180261 ) ) ( not ( = ?auto_180252 ?auto_180262 ) ) ( not ( = ?auto_180252 ?auto_180263 ) ) ( not ( = ?auto_180252 ?auto_180264 ) ) ( not ( = ?auto_180253 ?auto_180254 ) ) ( not ( = ?auto_180253 ?auto_180255 ) ) ( not ( = ?auto_180253 ?auto_180256 ) ) ( not ( = ?auto_180253 ?auto_180257 ) ) ( not ( = ?auto_180253 ?auto_180258 ) ) ( not ( = ?auto_180253 ?auto_180259 ) ) ( not ( = ?auto_180253 ?auto_180260 ) ) ( not ( = ?auto_180253 ?auto_180261 ) ) ( not ( = ?auto_180253 ?auto_180262 ) ) ( not ( = ?auto_180253 ?auto_180263 ) ) ( not ( = ?auto_180253 ?auto_180264 ) ) ( not ( = ?auto_180254 ?auto_180255 ) ) ( not ( = ?auto_180254 ?auto_180256 ) ) ( not ( = ?auto_180254 ?auto_180257 ) ) ( not ( = ?auto_180254 ?auto_180258 ) ) ( not ( = ?auto_180254 ?auto_180259 ) ) ( not ( = ?auto_180254 ?auto_180260 ) ) ( not ( = ?auto_180254 ?auto_180261 ) ) ( not ( = ?auto_180254 ?auto_180262 ) ) ( not ( = ?auto_180254 ?auto_180263 ) ) ( not ( = ?auto_180254 ?auto_180264 ) ) ( not ( = ?auto_180255 ?auto_180256 ) ) ( not ( = ?auto_180255 ?auto_180257 ) ) ( not ( = ?auto_180255 ?auto_180258 ) ) ( not ( = ?auto_180255 ?auto_180259 ) ) ( not ( = ?auto_180255 ?auto_180260 ) ) ( not ( = ?auto_180255 ?auto_180261 ) ) ( not ( = ?auto_180255 ?auto_180262 ) ) ( not ( = ?auto_180255 ?auto_180263 ) ) ( not ( = ?auto_180255 ?auto_180264 ) ) ( not ( = ?auto_180256 ?auto_180257 ) ) ( not ( = ?auto_180256 ?auto_180258 ) ) ( not ( = ?auto_180256 ?auto_180259 ) ) ( not ( = ?auto_180256 ?auto_180260 ) ) ( not ( = ?auto_180256 ?auto_180261 ) ) ( not ( = ?auto_180256 ?auto_180262 ) ) ( not ( = ?auto_180256 ?auto_180263 ) ) ( not ( = ?auto_180256 ?auto_180264 ) ) ( not ( = ?auto_180257 ?auto_180258 ) ) ( not ( = ?auto_180257 ?auto_180259 ) ) ( not ( = ?auto_180257 ?auto_180260 ) ) ( not ( = ?auto_180257 ?auto_180261 ) ) ( not ( = ?auto_180257 ?auto_180262 ) ) ( not ( = ?auto_180257 ?auto_180263 ) ) ( not ( = ?auto_180257 ?auto_180264 ) ) ( not ( = ?auto_180258 ?auto_180259 ) ) ( not ( = ?auto_180258 ?auto_180260 ) ) ( not ( = ?auto_180258 ?auto_180261 ) ) ( not ( = ?auto_180258 ?auto_180262 ) ) ( not ( = ?auto_180258 ?auto_180263 ) ) ( not ( = ?auto_180258 ?auto_180264 ) ) ( not ( = ?auto_180259 ?auto_180260 ) ) ( not ( = ?auto_180259 ?auto_180261 ) ) ( not ( = ?auto_180259 ?auto_180262 ) ) ( not ( = ?auto_180259 ?auto_180263 ) ) ( not ( = ?auto_180259 ?auto_180264 ) ) ( not ( = ?auto_180260 ?auto_180261 ) ) ( not ( = ?auto_180260 ?auto_180262 ) ) ( not ( = ?auto_180260 ?auto_180263 ) ) ( not ( = ?auto_180260 ?auto_180264 ) ) ( not ( = ?auto_180261 ?auto_180262 ) ) ( not ( = ?auto_180261 ?auto_180263 ) ) ( not ( = ?auto_180261 ?auto_180264 ) ) ( not ( = ?auto_180262 ?auto_180263 ) ) ( not ( = ?auto_180262 ?auto_180264 ) ) ( not ( = ?auto_180263 ?auto_180264 ) ) ( ON ?auto_180262 ?auto_180263 ) ( ON ?auto_180261 ?auto_180262 ) ( ON ?auto_180260 ?auto_180261 ) ( ON ?auto_180259 ?auto_180260 ) ( ON ?auto_180258 ?auto_180259 ) ( CLEAR ?auto_180256 ) ( ON ?auto_180257 ?auto_180258 ) ( CLEAR ?auto_180257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180252 ?auto_180253 ?auto_180254 ?auto_180255 ?auto_180256 ?auto_180257 )
      ( MAKE-12PILE ?auto_180252 ?auto_180253 ?auto_180254 ?auto_180255 ?auto_180256 ?auto_180257 ?auto_180258 ?auto_180259 ?auto_180260 ?auto_180261 ?auto_180262 ?auto_180263 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_180277 - BLOCK
      ?auto_180278 - BLOCK
      ?auto_180279 - BLOCK
      ?auto_180280 - BLOCK
      ?auto_180281 - BLOCK
      ?auto_180282 - BLOCK
      ?auto_180283 - BLOCK
      ?auto_180284 - BLOCK
      ?auto_180285 - BLOCK
      ?auto_180286 - BLOCK
      ?auto_180287 - BLOCK
      ?auto_180288 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180288 ) ( ON-TABLE ?auto_180277 ) ( ON ?auto_180278 ?auto_180277 ) ( ON ?auto_180279 ?auto_180278 ) ( ON ?auto_180280 ?auto_180279 ) ( ON ?auto_180281 ?auto_180280 ) ( not ( = ?auto_180277 ?auto_180278 ) ) ( not ( = ?auto_180277 ?auto_180279 ) ) ( not ( = ?auto_180277 ?auto_180280 ) ) ( not ( = ?auto_180277 ?auto_180281 ) ) ( not ( = ?auto_180277 ?auto_180282 ) ) ( not ( = ?auto_180277 ?auto_180283 ) ) ( not ( = ?auto_180277 ?auto_180284 ) ) ( not ( = ?auto_180277 ?auto_180285 ) ) ( not ( = ?auto_180277 ?auto_180286 ) ) ( not ( = ?auto_180277 ?auto_180287 ) ) ( not ( = ?auto_180277 ?auto_180288 ) ) ( not ( = ?auto_180278 ?auto_180279 ) ) ( not ( = ?auto_180278 ?auto_180280 ) ) ( not ( = ?auto_180278 ?auto_180281 ) ) ( not ( = ?auto_180278 ?auto_180282 ) ) ( not ( = ?auto_180278 ?auto_180283 ) ) ( not ( = ?auto_180278 ?auto_180284 ) ) ( not ( = ?auto_180278 ?auto_180285 ) ) ( not ( = ?auto_180278 ?auto_180286 ) ) ( not ( = ?auto_180278 ?auto_180287 ) ) ( not ( = ?auto_180278 ?auto_180288 ) ) ( not ( = ?auto_180279 ?auto_180280 ) ) ( not ( = ?auto_180279 ?auto_180281 ) ) ( not ( = ?auto_180279 ?auto_180282 ) ) ( not ( = ?auto_180279 ?auto_180283 ) ) ( not ( = ?auto_180279 ?auto_180284 ) ) ( not ( = ?auto_180279 ?auto_180285 ) ) ( not ( = ?auto_180279 ?auto_180286 ) ) ( not ( = ?auto_180279 ?auto_180287 ) ) ( not ( = ?auto_180279 ?auto_180288 ) ) ( not ( = ?auto_180280 ?auto_180281 ) ) ( not ( = ?auto_180280 ?auto_180282 ) ) ( not ( = ?auto_180280 ?auto_180283 ) ) ( not ( = ?auto_180280 ?auto_180284 ) ) ( not ( = ?auto_180280 ?auto_180285 ) ) ( not ( = ?auto_180280 ?auto_180286 ) ) ( not ( = ?auto_180280 ?auto_180287 ) ) ( not ( = ?auto_180280 ?auto_180288 ) ) ( not ( = ?auto_180281 ?auto_180282 ) ) ( not ( = ?auto_180281 ?auto_180283 ) ) ( not ( = ?auto_180281 ?auto_180284 ) ) ( not ( = ?auto_180281 ?auto_180285 ) ) ( not ( = ?auto_180281 ?auto_180286 ) ) ( not ( = ?auto_180281 ?auto_180287 ) ) ( not ( = ?auto_180281 ?auto_180288 ) ) ( not ( = ?auto_180282 ?auto_180283 ) ) ( not ( = ?auto_180282 ?auto_180284 ) ) ( not ( = ?auto_180282 ?auto_180285 ) ) ( not ( = ?auto_180282 ?auto_180286 ) ) ( not ( = ?auto_180282 ?auto_180287 ) ) ( not ( = ?auto_180282 ?auto_180288 ) ) ( not ( = ?auto_180283 ?auto_180284 ) ) ( not ( = ?auto_180283 ?auto_180285 ) ) ( not ( = ?auto_180283 ?auto_180286 ) ) ( not ( = ?auto_180283 ?auto_180287 ) ) ( not ( = ?auto_180283 ?auto_180288 ) ) ( not ( = ?auto_180284 ?auto_180285 ) ) ( not ( = ?auto_180284 ?auto_180286 ) ) ( not ( = ?auto_180284 ?auto_180287 ) ) ( not ( = ?auto_180284 ?auto_180288 ) ) ( not ( = ?auto_180285 ?auto_180286 ) ) ( not ( = ?auto_180285 ?auto_180287 ) ) ( not ( = ?auto_180285 ?auto_180288 ) ) ( not ( = ?auto_180286 ?auto_180287 ) ) ( not ( = ?auto_180286 ?auto_180288 ) ) ( not ( = ?auto_180287 ?auto_180288 ) ) ( ON ?auto_180287 ?auto_180288 ) ( ON ?auto_180286 ?auto_180287 ) ( ON ?auto_180285 ?auto_180286 ) ( ON ?auto_180284 ?auto_180285 ) ( ON ?auto_180283 ?auto_180284 ) ( CLEAR ?auto_180281 ) ( ON ?auto_180282 ?auto_180283 ) ( CLEAR ?auto_180282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_180277 ?auto_180278 ?auto_180279 ?auto_180280 ?auto_180281 ?auto_180282 )
      ( MAKE-12PILE ?auto_180277 ?auto_180278 ?auto_180279 ?auto_180280 ?auto_180281 ?auto_180282 ?auto_180283 ?auto_180284 ?auto_180285 ?auto_180286 ?auto_180287 ?auto_180288 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_180301 - BLOCK
      ?auto_180302 - BLOCK
      ?auto_180303 - BLOCK
      ?auto_180304 - BLOCK
      ?auto_180305 - BLOCK
      ?auto_180306 - BLOCK
      ?auto_180307 - BLOCK
      ?auto_180308 - BLOCK
      ?auto_180309 - BLOCK
      ?auto_180310 - BLOCK
      ?auto_180311 - BLOCK
      ?auto_180312 - BLOCK
    )
    :vars
    (
      ?auto_180313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180312 ?auto_180313 ) ( ON-TABLE ?auto_180301 ) ( ON ?auto_180302 ?auto_180301 ) ( ON ?auto_180303 ?auto_180302 ) ( ON ?auto_180304 ?auto_180303 ) ( not ( = ?auto_180301 ?auto_180302 ) ) ( not ( = ?auto_180301 ?auto_180303 ) ) ( not ( = ?auto_180301 ?auto_180304 ) ) ( not ( = ?auto_180301 ?auto_180305 ) ) ( not ( = ?auto_180301 ?auto_180306 ) ) ( not ( = ?auto_180301 ?auto_180307 ) ) ( not ( = ?auto_180301 ?auto_180308 ) ) ( not ( = ?auto_180301 ?auto_180309 ) ) ( not ( = ?auto_180301 ?auto_180310 ) ) ( not ( = ?auto_180301 ?auto_180311 ) ) ( not ( = ?auto_180301 ?auto_180312 ) ) ( not ( = ?auto_180301 ?auto_180313 ) ) ( not ( = ?auto_180302 ?auto_180303 ) ) ( not ( = ?auto_180302 ?auto_180304 ) ) ( not ( = ?auto_180302 ?auto_180305 ) ) ( not ( = ?auto_180302 ?auto_180306 ) ) ( not ( = ?auto_180302 ?auto_180307 ) ) ( not ( = ?auto_180302 ?auto_180308 ) ) ( not ( = ?auto_180302 ?auto_180309 ) ) ( not ( = ?auto_180302 ?auto_180310 ) ) ( not ( = ?auto_180302 ?auto_180311 ) ) ( not ( = ?auto_180302 ?auto_180312 ) ) ( not ( = ?auto_180302 ?auto_180313 ) ) ( not ( = ?auto_180303 ?auto_180304 ) ) ( not ( = ?auto_180303 ?auto_180305 ) ) ( not ( = ?auto_180303 ?auto_180306 ) ) ( not ( = ?auto_180303 ?auto_180307 ) ) ( not ( = ?auto_180303 ?auto_180308 ) ) ( not ( = ?auto_180303 ?auto_180309 ) ) ( not ( = ?auto_180303 ?auto_180310 ) ) ( not ( = ?auto_180303 ?auto_180311 ) ) ( not ( = ?auto_180303 ?auto_180312 ) ) ( not ( = ?auto_180303 ?auto_180313 ) ) ( not ( = ?auto_180304 ?auto_180305 ) ) ( not ( = ?auto_180304 ?auto_180306 ) ) ( not ( = ?auto_180304 ?auto_180307 ) ) ( not ( = ?auto_180304 ?auto_180308 ) ) ( not ( = ?auto_180304 ?auto_180309 ) ) ( not ( = ?auto_180304 ?auto_180310 ) ) ( not ( = ?auto_180304 ?auto_180311 ) ) ( not ( = ?auto_180304 ?auto_180312 ) ) ( not ( = ?auto_180304 ?auto_180313 ) ) ( not ( = ?auto_180305 ?auto_180306 ) ) ( not ( = ?auto_180305 ?auto_180307 ) ) ( not ( = ?auto_180305 ?auto_180308 ) ) ( not ( = ?auto_180305 ?auto_180309 ) ) ( not ( = ?auto_180305 ?auto_180310 ) ) ( not ( = ?auto_180305 ?auto_180311 ) ) ( not ( = ?auto_180305 ?auto_180312 ) ) ( not ( = ?auto_180305 ?auto_180313 ) ) ( not ( = ?auto_180306 ?auto_180307 ) ) ( not ( = ?auto_180306 ?auto_180308 ) ) ( not ( = ?auto_180306 ?auto_180309 ) ) ( not ( = ?auto_180306 ?auto_180310 ) ) ( not ( = ?auto_180306 ?auto_180311 ) ) ( not ( = ?auto_180306 ?auto_180312 ) ) ( not ( = ?auto_180306 ?auto_180313 ) ) ( not ( = ?auto_180307 ?auto_180308 ) ) ( not ( = ?auto_180307 ?auto_180309 ) ) ( not ( = ?auto_180307 ?auto_180310 ) ) ( not ( = ?auto_180307 ?auto_180311 ) ) ( not ( = ?auto_180307 ?auto_180312 ) ) ( not ( = ?auto_180307 ?auto_180313 ) ) ( not ( = ?auto_180308 ?auto_180309 ) ) ( not ( = ?auto_180308 ?auto_180310 ) ) ( not ( = ?auto_180308 ?auto_180311 ) ) ( not ( = ?auto_180308 ?auto_180312 ) ) ( not ( = ?auto_180308 ?auto_180313 ) ) ( not ( = ?auto_180309 ?auto_180310 ) ) ( not ( = ?auto_180309 ?auto_180311 ) ) ( not ( = ?auto_180309 ?auto_180312 ) ) ( not ( = ?auto_180309 ?auto_180313 ) ) ( not ( = ?auto_180310 ?auto_180311 ) ) ( not ( = ?auto_180310 ?auto_180312 ) ) ( not ( = ?auto_180310 ?auto_180313 ) ) ( not ( = ?auto_180311 ?auto_180312 ) ) ( not ( = ?auto_180311 ?auto_180313 ) ) ( not ( = ?auto_180312 ?auto_180313 ) ) ( ON ?auto_180311 ?auto_180312 ) ( ON ?auto_180310 ?auto_180311 ) ( ON ?auto_180309 ?auto_180310 ) ( ON ?auto_180308 ?auto_180309 ) ( ON ?auto_180307 ?auto_180308 ) ( ON ?auto_180306 ?auto_180307 ) ( CLEAR ?auto_180304 ) ( ON ?auto_180305 ?auto_180306 ) ( CLEAR ?auto_180305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180301 ?auto_180302 ?auto_180303 ?auto_180304 ?auto_180305 )
      ( MAKE-12PILE ?auto_180301 ?auto_180302 ?auto_180303 ?auto_180304 ?auto_180305 ?auto_180306 ?auto_180307 ?auto_180308 ?auto_180309 ?auto_180310 ?auto_180311 ?auto_180312 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_180326 - BLOCK
      ?auto_180327 - BLOCK
      ?auto_180328 - BLOCK
      ?auto_180329 - BLOCK
      ?auto_180330 - BLOCK
      ?auto_180331 - BLOCK
      ?auto_180332 - BLOCK
      ?auto_180333 - BLOCK
      ?auto_180334 - BLOCK
      ?auto_180335 - BLOCK
      ?auto_180336 - BLOCK
      ?auto_180337 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180337 ) ( ON-TABLE ?auto_180326 ) ( ON ?auto_180327 ?auto_180326 ) ( ON ?auto_180328 ?auto_180327 ) ( ON ?auto_180329 ?auto_180328 ) ( not ( = ?auto_180326 ?auto_180327 ) ) ( not ( = ?auto_180326 ?auto_180328 ) ) ( not ( = ?auto_180326 ?auto_180329 ) ) ( not ( = ?auto_180326 ?auto_180330 ) ) ( not ( = ?auto_180326 ?auto_180331 ) ) ( not ( = ?auto_180326 ?auto_180332 ) ) ( not ( = ?auto_180326 ?auto_180333 ) ) ( not ( = ?auto_180326 ?auto_180334 ) ) ( not ( = ?auto_180326 ?auto_180335 ) ) ( not ( = ?auto_180326 ?auto_180336 ) ) ( not ( = ?auto_180326 ?auto_180337 ) ) ( not ( = ?auto_180327 ?auto_180328 ) ) ( not ( = ?auto_180327 ?auto_180329 ) ) ( not ( = ?auto_180327 ?auto_180330 ) ) ( not ( = ?auto_180327 ?auto_180331 ) ) ( not ( = ?auto_180327 ?auto_180332 ) ) ( not ( = ?auto_180327 ?auto_180333 ) ) ( not ( = ?auto_180327 ?auto_180334 ) ) ( not ( = ?auto_180327 ?auto_180335 ) ) ( not ( = ?auto_180327 ?auto_180336 ) ) ( not ( = ?auto_180327 ?auto_180337 ) ) ( not ( = ?auto_180328 ?auto_180329 ) ) ( not ( = ?auto_180328 ?auto_180330 ) ) ( not ( = ?auto_180328 ?auto_180331 ) ) ( not ( = ?auto_180328 ?auto_180332 ) ) ( not ( = ?auto_180328 ?auto_180333 ) ) ( not ( = ?auto_180328 ?auto_180334 ) ) ( not ( = ?auto_180328 ?auto_180335 ) ) ( not ( = ?auto_180328 ?auto_180336 ) ) ( not ( = ?auto_180328 ?auto_180337 ) ) ( not ( = ?auto_180329 ?auto_180330 ) ) ( not ( = ?auto_180329 ?auto_180331 ) ) ( not ( = ?auto_180329 ?auto_180332 ) ) ( not ( = ?auto_180329 ?auto_180333 ) ) ( not ( = ?auto_180329 ?auto_180334 ) ) ( not ( = ?auto_180329 ?auto_180335 ) ) ( not ( = ?auto_180329 ?auto_180336 ) ) ( not ( = ?auto_180329 ?auto_180337 ) ) ( not ( = ?auto_180330 ?auto_180331 ) ) ( not ( = ?auto_180330 ?auto_180332 ) ) ( not ( = ?auto_180330 ?auto_180333 ) ) ( not ( = ?auto_180330 ?auto_180334 ) ) ( not ( = ?auto_180330 ?auto_180335 ) ) ( not ( = ?auto_180330 ?auto_180336 ) ) ( not ( = ?auto_180330 ?auto_180337 ) ) ( not ( = ?auto_180331 ?auto_180332 ) ) ( not ( = ?auto_180331 ?auto_180333 ) ) ( not ( = ?auto_180331 ?auto_180334 ) ) ( not ( = ?auto_180331 ?auto_180335 ) ) ( not ( = ?auto_180331 ?auto_180336 ) ) ( not ( = ?auto_180331 ?auto_180337 ) ) ( not ( = ?auto_180332 ?auto_180333 ) ) ( not ( = ?auto_180332 ?auto_180334 ) ) ( not ( = ?auto_180332 ?auto_180335 ) ) ( not ( = ?auto_180332 ?auto_180336 ) ) ( not ( = ?auto_180332 ?auto_180337 ) ) ( not ( = ?auto_180333 ?auto_180334 ) ) ( not ( = ?auto_180333 ?auto_180335 ) ) ( not ( = ?auto_180333 ?auto_180336 ) ) ( not ( = ?auto_180333 ?auto_180337 ) ) ( not ( = ?auto_180334 ?auto_180335 ) ) ( not ( = ?auto_180334 ?auto_180336 ) ) ( not ( = ?auto_180334 ?auto_180337 ) ) ( not ( = ?auto_180335 ?auto_180336 ) ) ( not ( = ?auto_180335 ?auto_180337 ) ) ( not ( = ?auto_180336 ?auto_180337 ) ) ( ON ?auto_180336 ?auto_180337 ) ( ON ?auto_180335 ?auto_180336 ) ( ON ?auto_180334 ?auto_180335 ) ( ON ?auto_180333 ?auto_180334 ) ( ON ?auto_180332 ?auto_180333 ) ( ON ?auto_180331 ?auto_180332 ) ( CLEAR ?auto_180329 ) ( ON ?auto_180330 ?auto_180331 ) ( CLEAR ?auto_180330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180326 ?auto_180327 ?auto_180328 ?auto_180329 ?auto_180330 )
      ( MAKE-12PILE ?auto_180326 ?auto_180327 ?auto_180328 ?auto_180329 ?auto_180330 ?auto_180331 ?auto_180332 ?auto_180333 ?auto_180334 ?auto_180335 ?auto_180336 ?auto_180337 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_180350 - BLOCK
      ?auto_180351 - BLOCK
      ?auto_180352 - BLOCK
      ?auto_180353 - BLOCK
      ?auto_180354 - BLOCK
      ?auto_180355 - BLOCK
      ?auto_180356 - BLOCK
      ?auto_180357 - BLOCK
      ?auto_180358 - BLOCK
      ?auto_180359 - BLOCK
      ?auto_180360 - BLOCK
      ?auto_180361 - BLOCK
    )
    :vars
    (
      ?auto_180362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180361 ?auto_180362 ) ( ON-TABLE ?auto_180350 ) ( ON ?auto_180351 ?auto_180350 ) ( ON ?auto_180352 ?auto_180351 ) ( not ( = ?auto_180350 ?auto_180351 ) ) ( not ( = ?auto_180350 ?auto_180352 ) ) ( not ( = ?auto_180350 ?auto_180353 ) ) ( not ( = ?auto_180350 ?auto_180354 ) ) ( not ( = ?auto_180350 ?auto_180355 ) ) ( not ( = ?auto_180350 ?auto_180356 ) ) ( not ( = ?auto_180350 ?auto_180357 ) ) ( not ( = ?auto_180350 ?auto_180358 ) ) ( not ( = ?auto_180350 ?auto_180359 ) ) ( not ( = ?auto_180350 ?auto_180360 ) ) ( not ( = ?auto_180350 ?auto_180361 ) ) ( not ( = ?auto_180350 ?auto_180362 ) ) ( not ( = ?auto_180351 ?auto_180352 ) ) ( not ( = ?auto_180351 ?auto_180353 ) ) ( not ( = ?auto_180351 ?auto_180354 ) ) ( not ( = ?auto_180351 ?auto_180355 ) ) ( not ( = ?auto_180351 ?auto_180356 ) ) ( not ( = ?auto_180351 ?auto_180357 ) ) ( not ( = ?auto_180351 ?auto_180358 ) ) ( not ( = ?auto_180351 ?auto_180359 ) ) ( not ( = ?auto_180351 ?auto_180360 ) ) ( not ( = ?auto_180351 ?auto_180361 ) ) ( not ( = ?auto_180351 ?auto_180362 ) ) ( not ( = ?auto_180352 ?auto_180353 ) ) ( not ( = ?auto_180352 ?auto_180354 ) ) ( not ( = ?auto_180352 ?auto_180355 ) ) ( not ( = ?auto_180352 ?auto_180356 ) ) ( not ( = ?auto_180352 ?auto_180357 ) ) ( not ( = ?auto_180352 ?auto_180358 ) ) ( not ( = ?auto_180352 ?auto_180359 ) ) ( not ( = ?auto_180352 ?auto_180360 ) ) ( not ( = ?auto_180352 ?auto_180361 ) ) ( not ( = ?auto_180352 ?auto_180362 ) ) ( not ( = ?auto_180353 ?auto_180354 ) ) ( not ( = ?auto_180353 ?auto_180355 ) ) ( not ( = ?auto_180353 ?auto_180356 ) ) ( not ( = ?auto_180353 ?auto_180357 ) ) ( not ( = ?auto_180353 ?auto_180358 ) ) ( not ( = ?auto_180353 ?auto_180359 ) ) ( not ( = ?auto_180353 ?auto_180360 ) ) ( not ( = ?auto_180353 ?auto_180361 ) ) ( not ( = ?auto_180353 ?auto_180362 ) ) ( not ( = ?auto_180354 ?auto_180355 ) ) ( not ( = ?auto_180354 ?auto_180356 ) ) ( not ( = ?auto_180354 ?auto_180357 ) ) ( not ( = ?auto_180354 ?auto_180358 ) ) ( not ( = ?auto_180354 ?auto_180359 ) ) ( not ( = ?auto_180354 ?auto_180360 ) ) ( not ( = ?auto_180354 ?auto_180361 ) ) ( not ( = ?auto_180354 ?auto_180362 ) ) ( not ( = ?auto_180355 ?auto_180356 ) ) ( not ( = ?auto_180355 ?auto_180357 ) ) ( not ( = ?auto_180355 ?auto_180358 ) ) ( not ( = ?auto_180355 ?auto_180359 ) ) ( not ( = ?auto_180355 ?auto_180360 ) ) ( not ( = ?auto_180355 ?auto_180361 ) ) ( not ( = ?auto_180355 ?auto_180362 ) ) ( not ( = ?auto_180356 ?auto_180357 ) ) ( not ( = ?auto_180356 ?auto_180358 ) ) ( not ( = ?auto_180356 ?auto_180359 ) ) ( not ( = ?auto_180356 ?auto_180360 ) ) ( not ( = ?auto_180356 ?auto_180361 ) ) ( not ( = ?auto_180356 ?auto_180362 ) ) ( not ( = ?auto_180357 ?auto_180358 ) ) ( not ( = ?auto_180357 ?auto_180359 ) ) ( not ( = ?auto_180357 ?auto_180360 ) ) ( not ( = ?auto_180357 ?auto_180361 ) ) ( not ( = ?auto_180357 ?auto_180362 ) ) ( not ( = ?auto_180358 ?auto_180359 ) ) ( not ( = ?auto_180358 ?auto_180360 ) ) ( not ( = ?auto_180358 ?auto_180361 ) ) ( not ( = ?auto_180358 ?auto_180362 ) ) ( not ( = ?auto_180359 ?auto_180360 ) ) ( not ( = ?auto_180359 ?auto_180361 ) ) ( not ( = ?auto_180359 ?auto_180362 ) ) ( not ( = ?auto_180360 ?auto_180361 ) ) ( not ( = ?auto_180360 ?auto_180362 ) ) ( not ( = ?auto_180361 ?auto_180362 ) ) ( ON ?auto_180360 ?auto_180361 ) ( ON ?auto_180359 ?auto_180360 ) ( ON ?auto_180358 ?auto_180359 ) ( ON ?auto_180357 ?auto_180358 ) ( ON ?auto_180356 ?auto_180357 ) ( ON ?auto_180355 ?auto_180356 ) ( ON ?auto_180354 ?auto_180355 ) ( CLEAR ?auto_180352 ) ( ON ?auto_180353 ?auto_180354 ) ( CLEAR ?auto_180353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180350 ?auto_180351 ?auto_180352 ?auto_180353 )
      ( MAKE-12PILE ?auto_180350 ?auto_180351 ?auto_180352 ?auto_180353 ?auto_180354 ?auto_180355 ?auto_180356 ?auto_180357 ?auto_180358 ?auto_180359 ?auto_180360 ?auto_180361 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_180375 - BLOCK
      ?auto_180376 - BLOCK
      ?auto_180377 - BLOCK
      ?auto_180378 - BLOCK
      ?auto_180379 - BLOCK
      ?auto_180380 - BLOCK
      ?auto_180381 - BLOCK
      ?auto_180382 - BLOCK
      ?auto_180383 - BLOCK
      ?auto_180384 - BLOCK
      ?auto_180385 - BLOCK
      ?auto_180386 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180386 ) ( ON-TABLE ?auto_180375 ) ( ON ?auto_180376 ?auto_180375 ) ( ON ?auto_180377 ?auto_180376 ) ( not ( = ?auto_180375 ?auto_180376 ) ) ( not ( = ?auto_180375 ?auto_180377 ) ) ( not ( = ?auto_180375 ?auto_180378 ) ) ( not ( = ?auto_180375 ?auto_180379 ) ) ( not ( = ?auto_180375 ?auto_180380 ) ) ( not ( = ?auto_180375 ?auto_180381 ) ) ( not ( = ?auto_180375 ?auto_180382 ) ) ( not ( = ?auto_180375 ?auto_180383 ) ) ( not ( = ?auto_180375 ?auto_180384 ) ) ( not ( = ?auto_180375 ?auto_180385 ) ) ( not ( = ?auto_180375 ?auto_180386 ) ) ( not ( = ?auto_180376 ?auto_180377 ) ) ( not ( = ?auto_180376 ?auto_180378 ) ) ( not ( = ?auto_180376 ?auto_180379 ) ) ( not ( = ?auto_180376 ?auto_180380 ) ) ( not ( = ?auto_180376 ?auto_180381 ) ) ( not ( = ?auto_180376 ?auto_180382 ) ) ( not ( = ?auto_180376 ?auto_180383 ) ) ( not ( = ?auto_180376 ?auto_180384 ) ) ( not ( = ?auto_180376 ?auto_180385 ) ) ( not ( = ?auto_180376 ?auto_180386 ) ) ( not ( = ?auto_180377 ?auto_180378 ) ) ( not ( = ?auto_180377 ?auto_180379 ) ) ( not ( = ?auto_180377 ?auto_180380 ) ) ( not ( = ?auto_180377 ?auto_180381 ) ) ( not ( = ?auto_180377 ?auto_180382 ) ) ( not ( = ?auto_180377 ?auto_180383 ) ) ( not ( = ?auto_180377 ?auto_180384 ) ) ( not ( = ?auto_180377 ?auto_180385 ) ) ( not ( = ?auto_180377 ?auto_180386 ) ) ( not ( = ?auto_180378 ?auto_180379 ) ) ( not ( = ?auto_180378 ?auto_180380 ) ) ( not ( = ?auto_180378 ?auto_180381 ) ) ( not ( = ?auto_180378 ?auto_180382 ) ) ( not ( = ?auto_180378 ?auto_180383 ) ) ( not ( = ?auto_180378 ?auto_180384 ) ) ( not ( = ?auto_180378 ?auto_180385 ) ) ( not ( = ?auto_180378 ?auto_180386 ) ) ( not ( = ?auto_180379 ?auto_180380 ) ) ( not ( = ?auto_180379 ?auto_180381 ) ) ( not ( = ?auto_180379 ?auto_180382 ) ) ( not ( = ?auto_180379 ?auto_180383 ) ) ( not ( = ?auto_180379 ?auto_180384 ) ) ( not ( = ?auto_180379 ?auto_180385 ) ) ( not ( = ?auto_180379 ?auto_180386 ) ) ( not ( = ?auto_180380 ?auto_180381 ) ) ( not ( = ?auto_180380 ?auto_180382 ) ) ( not ( = ?auto_180380 ?auto_180383 ) ) ( not ( = ?auto_180380 ?auto_180384 ) ) ( not ( = ?auto_180380 ?auto_180385 ) ) ( not ( = ?auto_180380 ?auto_180386 ) ) ( not ( = ?auto_180381 ?auto_180382 ) ) ( not ( = ?auto_180381 ?auto_180383 ) ) ( not ( = ?auto_180381 ?auto_180384 ) ) ( not ( = ?auto_180381 ?auto_180385 ) ) ( not ( = ?auto_180381 ?auto_180386 ) ) ( not ( = ?auto_180382 ?auto_180383 ) ) ( not ( = ?auto_180382 ?auto_180384 ) ) ( not ( = ?auto_180382 ?auto_180385 ) ) ( not ( = ?auto_180382 ?auto_180386 ) ) ( not ( = ?auto_180383 ?auto_180384 ) ) ( not ( = ?auto_180383 ?auto_180385 ) ) ( not ( = ?auto_180383 ?auto_180386 ) ) ( not ( = ?auto_180384 ?auto_180385 ) ) ( not ( = ?auto_180384 ?auto_180386 ) ) ( not ( = ?auto_180385 ?auto_180386 ) ) ( ON ?auto_180385 ?auto_180386 ) ( ON ?auto_180384 ?auto_180385 ) ( ON ?auto_180383 ?auto_180384 ) ( ON ?auto_180382 ?auto_180383 ) ( ON ?auto_180381 ?auto_180382 ) ( ON ?auto_180380 ?auto_180381 ) ( ON ?auto_180379 ?auto_180380 ) ( CLEAR ?auto_180377 ) ( ON ?auto_180378 ?auto_180379 ) ( CLEAR ?auto_180378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180375 ?auto_180376 ?auto_180377 ?auto_180378 )
      ( MAKE-12PILE ?auto_180375 ?auto_180376 ?auto_180377 ?auto_180378 ?auto_180379 ?auto_180380 ?auto_180381 ?auto_180382 ?auto_180383 ?auto_180384 ?auto_180385 ?auto_180386 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_180399 - BLOCK
      ?auto_180400 - BLOCK
      ?auto_180401 - BLOCK
      ?auto_180402 - BLOCK
      ?auto_180403 - BLOCK
      ?auto_180404 - BLOCK
      ?auto_180405 - BLOCK
      ?auto_180406 - BLOCK
      ?auto_180407 - BLOCK
      ?auto_180408 - BLOCK
      ?auto_180409 - BLOCK
      ?auto_180410 - BLOCK
    )
    :vars
    (
      ?auto_180411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180410 ?auto_180411 ) ( ON-TABLE ?auto_180399 ) ( ON ?auto_180400 ?auto_180399 ) ( not ( = ?auto_180399 ?auto_180400 ) ) ( not ( = ?auto_180399 ?auto_180401 ) ) ( not ( = ?auto_180399 ?auto_180402 ) ) ( not ( = ?auto_180399 ?auto_180403 ) ) ( not ( = ?auto_180399 ?auto_180404 ) ) ( not ( = ?auto_180399 ?auto_180405 ) ) ( not ( = ?auto_180399 ?auto_180406 ) ) ( not ( = ?auto_180399 ?auto_180407 ) ) ( not ( = ?auto_180399 ?auto_180408 ) ) ( not ( = ?auto_180399 ?auto_180409 ) ) ( not ( = ?auto_180399 ?auto_180410 ) ) ( not ( = ?auto_180399 ?auto_180411 ) ) ( not ( = ?auto_180400 ?auto_180401 ) ) ( not ( = ?auto_180400 ?auto_180402 ) ) ( not ( = ?auto_180400 ?auto_180403 ) ) ( not ( = ?auto_180400 ?auto_180404 ) ) ( not ( = ?auto_180400 ?auto_180405 ) ) ( not ( = ?auto_180400 ?auto_180406 ) ) ( not ( = ?auto_180400 ?auto_180407 ) ) ( not ( = ?auto_180400 ?auto_180408 ) ) ( not ( = ?auto_180400 ?auto_180409 ) ) ( not ( = ?auto_180400 ?auto_180410 ) ) ( not ( = ?auto_180400 ?auto_180411 ) ) ( not ( = ?auto_180401 ?auto_180402 ) ) ( not ( = ?auto_180401 ?auto_180403 ) ) ( not ( = ?auto_180401 ?auto_180404 ) ) ( not ( = ?auto_180401 ?auto_180405 ) ) ( not ( = ?auto_180401 ?auto_180406 ) ) ( not ( = ?auto_180401 ?auto_180407 ) ) ( not ( = ?auto_180401 ?auto_180408 ) ) ( not ( = ?auto_180401 ?auto_180409 ) ) ( not ( = ?auto_180401 ?auto_180410 ) ) ( not ( = ?auto_180401 ?auto_180411 ) ) ( not ( = ?auto_180402 ?auto_180403 ) ) ( not ( = ?auto_180402 ?auto_180404 ) ) ( not ( = ?auto_180402 ?auto_180405 ) ) ( not ( = ?auto_180402 ?auto_180406 ) ) ( not ( = ?auto_180402 ?auto_180407 ) ) ( not ( = ?auto_180402 ?auto_180408 ) ) ( not ( = ?auto_180402 ?auto_180409 ) ) ( not ( = ?auto_180402 ?auto_180410 ) ) ( not ( = ?auto_180402 ?auto_180411 ) ) ( not ( = ?auto_180403 ?auto_180404 ) ) ( not ( = ?auto_180403 ?auto_180405 ) ) ( not ( = ?auto_180403 ?auto_180406 ) ) ( not ( = ?auto_180403 ?auto_180407 ) ) ( not ( = ?auto_180403 ?auto_180408 ) ) ( not ( = ?auto_180403 ?auto_180409 ) ) ( not ( = ?auto_180403 ?auto_180410 ) ) ( not ( = ?auto_180403 ?auto_180411 ) ) ( not ( = ?auto_180404 ?auto_180405 ) ) ( not ( = ?auto_180404 ?auto_180406 ) ) ( not ( = ?auto_180404 ?auto_180407 ) ) ( not ( = ?auto_180404 ?auto_180408 ) ) ( not ( = ?auto_180404 ?auto_180409 ) ) ( not ( = ?auto_180404 ?auto_180410 ) ) ( not ( = ?auto_180404 ?auto_180411 ) ) ( not ( = ?auto_180405 ?auto_180406 ) ) ( not ( = ?auto_180405 ?auto_180407 ) ) ( not ( = ?auto_180405 ?auto_180408 ) ) ( not ( = ?auto_180405 ?auto_180409 ) ) ( not ( = ?auto_180405 ?auto_180410 ) ) ( not ( = ?auto_180405 ?auto_180411 ) ) ( not ( = ?auto_180406 ?auto_180407 ) ) ( not ( = ?auto_180406 ?auto_180408 ) ) ( not ( = ?auto_180406 ?auto_180409 ) ) ( not ( = ?auto_180406 ?auto_180410 ) ) ( not ( = ?auto_180406 ?auto_180411 ) ) ( not ( = ?auto_180407 ?auto_180408 ) ) ( not ( = ?auto_180407 ?auto_180409 ) ) ( not ( = ?auto_180407 ?auto_180410 ) ) ( not ( = ?auto_180407 ?auto_180411 ) ) ( not ( = ?auto_180408 ?auto_180409 ) ) ( not ( = ?auto_180408 ?auto_180410 ) ) ( not ( = ?auto_180408 ?auto_180411 ) ) ( not ( = ?auto_180409 ?auto_180410 ) ) ( not ( = ?auto_180409 ?auto_180411 ) ) ( not ( = ?auto_180410 ?auto_180411 ) ) ( ON ?auto_180409 ?auto_180410 ) ( ON ?auto_180408 ?auto_180409 ) ( ON ?auto_180407 ?auto_180408 ) ( ON ?auto_180406 ?auto_180407 ) ( ON ?auto_180405 ?auto_180406 ) ( ON ?auto_180404 ?auto_180405 ) ( ON ?auto_180403 ?auto_180404 ) ( ON ?auto_180402 ?auto_180403 ) ( CLEAR ?auto_180400 ) ( ON ?auto_180401 ?auto_180402 ) ( CLEAR ?auto_180401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180399 ?auto_180400 ?auto_180401 )
      ( MAKE-12PILE ?auto_180399 ?auto_180400 ?auto_180401 ?auto_180402 ?auto_180403 ?auto_180404 ?auto_180405 ?auto_180406 ?auto_180407 ?auto_180408 ?auto_180409 ?auto_180410 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_180424 - BLOCK
      ?auto_180425 - BLOCK
      ?auto_180426 - BLOCK
      ?auto_180427 - BLOCK
      ?auto_180428 - BLOCK
      ?auto_180429 - BLOCK
      ?auto_180430 - BLOCK
      ?auto_180431 - BLOCK
      ?auto_180432 - BLOCK
      ?auto_180433 - BLOCK
      ?auto_180434 - BLOCK
      ?auto_180435 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180435 ) ( ON-TABLE ?auto_180424 ) ( ON ?auto_180425 ?auto_180424 ) ( not ( = ?auto_180424 ?auto_180425 ) ) ( not ( = ?auto_180424 ?auto_180426 ) ) ( not ( = ?auto_180424 ?auto_180427 ) ) ( not ( = ?auto_180424 ?auto_180428 ) ) ( not ( = ?auto_180424 ?auto_180429 ) ) ( not ( = ?auto_180424 ?auto_180430 ) ) ( not ( = ?auto_180424 ?auto_180431 ) ) ( not ( = ?auto_180424 ?auto_180432 ) ) ( not ( = ?auto_180424 ?auto_180433 ) ) ( not ( = ?auto_180424 ?auto_180434 ) ) ( not ( = ?auto_180424 ?auto_180435 ) ) ( not ( = ?auto_180425 ?auto_180426 ) ) ( not ( = ?auto_180425 ?auto_180427 ) ) ( not ( = ?auto_180425 ?auto_180428 ) ) ( not ( = ?auto_180425 ?auto_180429 ) ) ( not ( = ?auto_180425 ?auto_180430 ) ) ( not ( = ?auto_180425 ?auto_180431 ) ) ( not ( = ?auto_180425 ?auto_180432 ) ) ( not ( = ?auto_180425 ?auto_180433 ) ) ( not ( = ?auto_180425 ?auto_180434 ) ) ( not ( = ?auto_180425 ?auto_180435 ) ) ( not ( = ?auto_180426 ?auto_180427 ) ) ( not ( = ?auto_180426 ?auto_180428 ) ) ( not ( = ?auto_180426 ?auto_180429 ) ) ( not ( = ?auto_180426 ?auto_180430 ) ) ( not ( = ?auto_180426 ?auto_180431 ) ) ( not ( = ?auto_180426 ?auto_180432 ) ) ( not ( = ?auto_180426 ?auto_180433 ) ) ( not ( = ?auto_180426 ?auto_180434 ) ) ( not ( = ?auto_180426 ?auto_180435 ) ) ( not ( = ?auto_180427 ?auto_180428 ) ) ( not ( = ?auto_180427 ?auto_180429 ) ) ( not ( = ?auto_180427 ?auto_180430 ) ) ( not ( = ?auto_180427 ?auto_180431 ) ) ( not ( = ?auto_180427 ?auto_180432 ) ) ( not ( = ?auto_180427 ?auto_180433 ) ) ( not ( = ?auto_180427 ?auto_180434 ) ) ( not ( = ?auto_180427 ?auto_180435 ) ) ( not ( = ?auto_180428 ?auto_180429 ) ) ( not ( = ?auto_180428 ?auto_180430 ) ) ( not ( = ?auto_180428 ?auto_180431 ) ) ( not ( = ?auto_180428 ?auto_180432 ) ) ( not ( = ?auto_180428 ?auto_180433 ) ) ( not ( = ?auto_180428 ?auto_180434 ) ) ( not ( = ?auto_180428 ?auto_180435 ) ) ( not ( = ?auto_180429 ?auto_180430 ) ) ( not ( = ?auto_180429 ?auto_180431 ) ) ( not ( = ?auto_180429 ?auto_180432 ) ) ( not ( = ?auto_180429 ?auto_180433 ) ) ( not ( = ?auto_180429 ?auto_180434 ) ) ( not ( = ?auto_180429 ?auto_180435 ) ) ( not ( = ?auto_180430 ?auto_180431 ) ) ( not ( = ?auto_180430 ?auto_180432 ) ) ( not ( = ?auto_180430 ?auto_180433 ) ) ( not ( = ?auto_180430 ?auto_180434 ) ) ( not ( = ?auto_180430 ?auto_180435 ) ) ( not ( = ?auto_180431 ?auto_180432 ) ) ( not ( = ?auto_180431 ?auto_180433 ) ) ( not ( = ?auto_180431 ?auto_180434 ) ) ( not ( = ?auto_180431 ?auto_180435 ) ) ( not ( = ?auto_180432 ?auto_180433 ) ) ( not ( = ?auto_180432 ?auto_180434 ) ) ( not ( = ?auto_180432 ?auto_180435 ) ) ( not ( = ?auto_180433 ?auto_180434 ) ) ( not ( = ?auto_180433 ?auto_180435 ) ) ( not ( = ?auto_180434 ?auto_180435 ) ) ( ON ?auto_180434 ?auto_180435 ) ( ON ?auto_180433 ?auto_180434 ) ( ON ?auto_180432 ?auto_180433 ) ( ON ?auto_180431 ?auto_180432 ) ( ON ?auto_180430 ?auto_180431 ) ( ON ?auto_180429 ?auto_180430 ) ( ON ?auto_180428 ?auto_180429 ) ( ON ?auto_180427 ?auto_180428 ) ( CLEAR ?auto_180425 ) ( ON ?auto_180426 ?auto_180427 ) ( CLEAR ?auto_180426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180424 ?auto_180425 ?auto_180426 )
      ( MAKE-12PILE ?auto_180424 ?auto_180425 ?auto_180426 ?auto_180427 ?auto_180428 ?auto_180429 ?auto_180430 ?auto_180431 ?auto_180432 ?auto_180433 ?auto_180434 ?auto_180435 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_180448 - BLOCK
      ?auto_180449 - BLOCK
      ?auto_180450 - BLOCK
      ?auto_180451 - BLOCK
      ?auto_180452 - BLOCK
      ?auto_180453 - BLOCK
      ?auto_180454 - BLOCK
      ?auto_180455 - BLOCK
      ?auto_180456 - BLOCK
      ?auto_180457 - BLOCK
      ?auto_180458 - BLOCK
      ?auto_180459 - BLOCK
    )
    :vars
    (
      ?auto_180460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180459 ?auto_180460 ) ( ON-TABLE ?auto_180448 ) ( not ( = ?auto_180448 ?auto_180449 ) ) ( not ( = ?auto_180448 ?auto_180450 ) ) ( not ( = ?auto_180448 ?auto_180451 ) ) ( not ( = ?auto_180448 ?auto_180452 ) ) ( not ( = ?auto_180448 ?auto_180453 ) ) ( not ( = ?auto_180448 ?auto_180454 ) ) ( not ( = ?auto_180448 ?auto_180455 ) ) ( not ( = ?auto_180448 ?auto_180456 ) ) ( not ( = ?auto_180448 ?auto_180457 ) ) ( not ( = ?auto_180448 ?auto_180458 ) ) ( not ( = ?auto_180448 ?auto_180459 ) ) ( not ( = ?auto_180448 ?auto_180460 ) ) ( not ( = ?auto_180449 ?auto_180450 ) ) ( not ( = ?auto_180449 ?auto_180451 ) ) ( not ( = ?auto_180449 ?auto_180452 ) ) ( not ( = ?auto_180449 ?auto_180453 ) ) ( not ( = ?auto_180449 ?auto_180454 ) ) ( not ( = ?auto_180449 ?auto_180455 ) ) ( not ( = ?auto_180449 ?auto_180456 ) ) ( not ( = ?auto_180449 ?auto_180457 ) ) ( not ( = ?auto_180449 ?auto_180458 ) ) ( not ( = ?auto_180449 ?auto_180459 ) ) ( not ( = ?auto_180449 ?auto_180460 ) ) ( not ( = ?auto_180450 ?auto_180451 ) ) ( not ( = ?auto_180450 ?auto_180452 ) ) ( not ( = ?auto_180450 ?auto_180453 ) ) ( not ( = ?auto_180450 ?auto_180454 ) ) ( not ( = ?auto_180450 ?auto_180455 ) ) ( not ( = ?auto_180450 ?auto_180456 ) ) ( not ( = ?auto_180450 ?auto_180457 ) ) ( not ( = ?auto_180450 ?auto_180458 ) ) ( not ( = ?auto_180450 ?auto_180459 ) ) ( not ( = ?auto_180450 ?auto_180460 ) ) ( not ( = ?auto_180451 ?auto_180452 ) ) ( not ( = ?auto_180451 ?auto_180453 ) ) ( not ( = ?auto_180451 ?auto_180454 ) ) ( not ( = ?auto_180451 ?auto_180455 ) ) ( not ( = ?auto_180451 ?auto_180456 ) ) ( not ( = ?auto_180451 ?auto_180457 ) ) ( not ( = ?auto_180451 ?auto_180458 ) ) ( not ( = ?auto_180451 ?auto_180459 ) ) ( not ( = ?auto_180451 ?auto_180460 ) ) ( not ( = ?auto_180452 ?auto_180453 ) ) ( not ( = ?auto_180452 ?auto_180454 ) ) ( not ( = ?auto_180452 ?auto_180455 ) ) ( not ( = ?auto_180452 ?auto_180456 ) ) ( not ( = ?auto_180452 ?auto_180457 ) ) ( not ( = ?auto_180452 ?auto_180458 ) ) ( not ( = ?auto_180452 ?auto_180459 ) ) ( not ( = ?auto_180452 ?auto_180460 ) ) ( not ( = ?auto_180453 ?auto_180454 ) ) ( not ( = ?auto_180453 ?auto_180455 ) ) ( not ( = ?auto_180453 ?auto_180456 ) ) ( not ( = ?auto_180453 ?auto_180457 ) ) ( not ( = ?auto_180453 ?auto_180458 ) ) ( not ( = ?auto_180453 ?auto_180459 ) ) ( not ( = ?auto_180453 ?auto_180460 ) ) ( not ( = ?auto_180454 ?auto_180455 ) ) ( not ( = ?auto_180454 ?auto_180456 ) ) ( not ( = ?auto_180454 ?auto_180457 ) ) ( not ( = ?auto_180454 ?auto_180458 ) ) ( not ( = ?auto_180454 ?auto_180459 ) ) ( not ( = ?auto_180454 ?auto_180460 ) ) ( not ( = ?auto_180455 ?auto_180456 ) ) ( not ( = ?auto_180455 ?auto_180457 ) ) ( not ( = ?auto_180455 ?auto_180458 ) ) ( not ( = ?auto_180455 ?auto_180459 ) ) ( not ( = ?auto_180455 ?auto_180460 ) ) ( not ( = ?auto_180456 ?auto_180457 ) ) ( not ( = ?auto_180456 ?auto_180458 ) ) ( not ( = ?auto_180456 ?auto_180459 ) ) ( not ( = ?auto_180456 ?auto_180460 ) ) ( not ( = ?auto_180457 ?auto_180458 ) ) ( not ( = ?auto_180457 ?auto_180459 ) ) ( not ( = ?auto_180457 ?auto_180460 ) ) ( not ( = ?auto_180458 ?auto_180459 ) ) ( not ( = ?auto_180458 ?auto_180460 ) ) ( not ( = ?auto_180459 ?auto_180460 ) ) ( ON ?auto_180458 ?auto_180459 ) ( ON ?auto_180457 ?auto_180458 ) ( ON ?auto_180456 ?auto_180457 ) ( ON ?auto_180455 ?auto_180456 ) ( ON ?auto_180454 ?auto_180455 ) ( ON ?auto_180453 ?auto_180454 ) ( ON ?auto_180452 ?auto_180453 ) ( ON ?auto_180451 ?auto_180452 ) ( ON ?auto_180450 ?auto_180451 ) ( CLEAR ?auto_180448 ) ( ON ?auto_180449 ?auto_180450 ) ( CLEAR ?auto_180449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180448 ?auto_180449 )
      ( MAKE-12PILE ?auto_180448 ?auto_180449 ?auto_180450 ?auto_180451 ?auto_180452 ?auto_180453 ?auto_180454 ?auto_180455 ?auto_180456 ?auto_180457 ?auto_180458 ?auto_180459 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_180473 - BLOCK
      ?auto_180474 - BLOCK
      ?auto_180475 - BLOCK
      ?auto_180476 - BLOCK
      ?auto_180477 - BLOCK
      ?auto_180478 - BLOCK
      ?auto_180479 - BLOCK
      ?auto_180480 - BLOCK
      ?auto_180481 - BLOCK
      ?auto_180482 - BLOCK
      ?auto_180483 - BLOCK
      ?auto_180484 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180484 ) ( ON-TABLE ?auto_180473 ) ( not ( = ?auto_180473 ?auto_180474 ) ) ( not ( = ?auto_180473 ?auto_180475 ) ) ( not ( = ?auto_180473 ?auto_180476 ) ) ( not ( = ?auto_180473 ?auto_180477 ) ) ( not ( = ?auto_180473 ?auto_180478 ) ) ( not ( = ?auto_180473 ?auto_180479 ) ) ( not ( = ?auto_180473 ?auto_180480 ) ) ( not ( = ?auto_180473 ?auto_180481 ) ) ( not ( = ?auto_180473 ?auto_180482 ) ) ( not ( = ?auto_180473 ?auto_180483 ) ) ( not ( = ?auto_180473 ?auto_180484 ) ) ( not ( = ?auto_180474 ?auto_180475 ) ) ( not ( = ?auto_180474 ?auto_180476 ) ) ( not ( = ?auto_180474 ?auto_180477 ) ) ( not ( = ?auto_180474 ?auto_180478 ) ) ( not ( = ?auto_180474 ?auto_180479 ) ) ( not ( = ?auto_180474 ?auto_180480 ) ) ( not ( = ?auto_180474 ?auto_180481 ) ) ( not ( = ?auto_180474 ?auto_180482 ) ) ( not ( = ?auto_180474 ?auto_180483 ) ) ( not ( = ?auto_180474 ?auto_180484 ) ) ( not ( = ?auto_180475 ?auto_180476 ) ) ( not ( = ?auto_180475 ?auto_180477 ) ) ( not ( = ?auto_180475 ?auto_180478 ) ) ( not ( = ?auto_180475 ?auto_180479 ) ) ( not ( = ?auto_180475 ?auto_180480 ) ) ( not ( = ?auto_180475 ?auto_180481 ) ) ( not ( = ?auto_180475 ?auto_180482 ) ) ( not ( = ?auto_180475 ?auto_180483 ) ) ( not ( = ?auto_180475 ?auto_180484 ) ) ( not ( = ?auto_180476 ?auto_180477 ) ) ( not ( = ?auto_180476 ?auto_180478 ) ) ( not ( = ?auto_180476 ?auto_180479 ) ) ( not ( = ?auto_180476 ?auto_180480 ) ) ( not ( = ?auto_180476 ?auto_180481 ) ) ( not ( = ?auto_180476 ?auto_180482 ) ) ( not ( = ?auto_180476 ?auto_180483 ) ) ( not ( = ?auto_180476 ?auto_180484 ) ) ( not ( = ?auto_180477 ?auto_180478 ) ) ( not ( = ?auto_180477 ?auto_180479 ) ) ( not ( = ?auto_180477 ?auto_180480 ) ) ( not ( = ?auto_180477 ?auto_180481 ) ) ( not ( = ?auto_180477 ?auto_180482 ) ) ( not ( = ?auto_180477 ?auto_180483 ) ) ( not ( = ?auto_180477 ?auto_180484 ) ) ( not ( = ?auto_180478 ?auto_180479 ) ) ( not ( = ?auto_180478 ?auto_180480 ) ) ( not ( = ?auto_180478 ?auto_180481 ) ) ( not ( = ?auto_180478 ?auto_180482 ) ) ( not ( = ?auto_180478 ?auto_180483 ) ) ( not ( = ?auto_180478 ?auto_180484 ) ) ( not ( = ?auto_180479 ?auto_180480 ) ) ( not ( = ?auto_180479 ?auto_180481 ) ) ( not ( = ?auto_180479 ?auto_180482 ) ) ( not ( = ?auto_180479 ?auto_180483 ) ) ( not ( = ?auto_180479 ?auto_180484 ) ) ( not ( = ?auto_180480 ?auto_180481 ) ) ( not ( = ?auto_180480 ?auto_180482 ) ) ( not ( = ?auto_180480 ?auto_180483 ) ) ( not ( = ?auto_180480 ?auto_180484 ) ) ( not ( = ?auto_180481 ?auto_180482 ) ) ( not ( = ?auto_180481 ?auto_180483 ) ) ( not ( = ?auto_180481 ?auto_180484 ) ) ( not ( = ?auto_180482 ?auto_180483 ) ) ( not ( = ?auto_180482 ?auto_180484 ) ) ( not ( = ?auto_180483 ?auto_180484 ) ) ( ON ?auto_180483 ?auto_180484 ) ( ON ?auto_180482 ?auto_180483 ) ( ON ?auto_180481 ?auto_180482 ) ( ON ?auto_180480 ?auto_180481 ) ( ON ?auto_180479 ?auto_180480 ) ( ON ?auto_180478 ?auto_180479 ) ( ON ?auto_180477 ?auto_180478 ) ( ON ?auto_180476 ?auto_180477 ) ( ON ?auto_180475 ?auto_180476 ) ( CLEAR ?auto_180473 ) ( ON ?auto_180474 ?auto_180475 ) ( CLEAR ?auto_180474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180473 ?auto_180474 )
      ( MAKE-12PILE ?auto_180473 ?auto_180474 ?auto_180475 ?auto_180476 ?auto_180477 ?auto_180478 ?auto_180479 ?auto_180480 ?auto_180481 ?auto_180482 ?auto_180483 ?auto_180484 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_180497 - BLOCK
      ?auto_180498 - BLOCK
      ?auto_180499 - BLOCK
      ?auto_180500 - BLOCK
      ?auto_180501 - BLOCK
      ?auto_180502 - BLOCK
      ?auto_180503 - BLOCK
      ?auto_180504 - BLOCK
      ?auto_180505 - BLOCK
      ?auto_180506 - BLOCK
      ?auto_180507 - BLOCK
      ?auto_180508 - BLOCK
    )
    :vars
    (
      ?auto_180509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180508 ?auto_180509 ) ( not ( = ?auto_180497 ?auto_180498 ) ) ( not ( = ?auto_180497 ?auto_180499 ) ) ( not ( = ?auto_180497 ?auto_180500 ) ) ( not ( = ?auto_180497 ?auto_180501 ) ) ( not ( = ?auto_180497 ?auto_180502 ) ) ( not ( = ?auto_180497 ?auto_180503 ) ) ( not ( = ?auto_180497 ?auto_180504 ) ) ( not ( = ?auto_180497 ?auto_180505 ) ) ( not ( = ?auto_180497 ?auto_180506 ) ) ( not ( = ?auto_180497 ?auto_180507 ) ) ( not ( = ?auto_180497 ?auto_180508 ) ) ( not ( = ?auto_180497 ?auto_180509 ) ) ( not ( = ?auto_180498 ?auto_180499 ) ) ( not ( = ?auto_180498 ?auto_180500 ) ) ( not ( = ?auto_180498 ?auto_180501 ) ) ( not ( = ?auto_180498 ?auto_180502 ) ) ( not ( = ?auto_180498 ?auto_180503 ) ) ( not ( = ?auto_180498 ?auto_180504 ) ) ( not ( = ?auto_180498 ?auto_180505 ) ) ( not ( = ?auto_180498 ?auto_180506 ) ) ( not ( = ?auto_180498 ?auto_180507 ) ) ( not ( = ?auto_180498 ?auto_180508 ) ) ( not ( = ?auto_180498 ?auto_180509 ) ) ( not ( = ?auto_180499 ?auto_180500 ) ) ( not ( = ?auto_180499 ?auto_180501 ) ) ( not ( = ?auto_180499 ?auto_180502 ) ) ( not ( = ?auto_180499 ?auto_180503 ) ) ( not ( = ?auto_180499 ?auto_180504 ) ) ( not ( = ?auto_180499 ?auto_180505 ) ) ( not ( = ?auto_180499 ?auto_180506 ) ) ( not ( = ?auto_180499 ?auto_180507 ) ) ( not ( = ?auto_180499 ?auto_180508 ) ) ( not ( = ?auto_180499 ?auto_180509 ) ) ( not ( = ?auto_180500 ?auto_180501 ) ) ( not ( = ?auto_180500 ?auto_180502 ) ) ( not ( = ?auto_180500 ?auto_180503 ) ) ( not ( = ?auto_180500 ?auto_180504 ) ) ( not ( = ?auto_180500 ?auto_180505 ) ) ( not ( = ?auto_180500 ?auto_180506 ) ) ( not ( = ?auto_180500 ?auto_180507 ) ) ( not ( = ?auto_180500 ?auto_180508 ) ) ( not ( = ?auto_180500 ?auto_180509 ) ) ( not ( = ?auto_180501 ?auto_180502 ) ) ( not ( = ?auto_180501 ?auto_180503 ) ) ( not ( = ?auto_180501 ?auto_180504 ) ) ( not ( = ?auto_180501 ?auto_180505 ) ) ( not ( = ?auto_180501 ?auto_180506 ) ) ( not ( = ?auto_180501 ?auto_180507 ) ) ( not ( = ?auto_180501 ?auto_180508 ) ) ( not ( = ?auto_180501 ?auto_180509 ) ) ( not ( = ?auto_180502 ?auto_180503 ) ) ( not ( = ?auto_180502 ?auto_180504 ) ) ( not ( = ?auto_180502 ?auto_180505 ) ) ( not ( = ?auto_180502 ?auto_180506 ) ) ( not ( = ?auto_180502 ?auto_180507 ) ) ( not ( = ?auto_180502 ?auto_180508 ) ) ( not ( = ?auto_180502 ?auto_180509 ) ) ( not ( = ?auto_180503 ?auto_180504 ) ) ( not ( = ?auto_180503 ?auto_180505 ) ) ( not ( = ?auto_180503 ?auto_180506 ) ) ( not ( = ?auto_180503 ?auto_180507 ) ) ( not ( = ?auto_180503 ?auto_180508 ) ) ( not ( = ?auto_180503 ?auto_180509 ) ) ( not ( = ?auto_180504 ?auto_180505 ) ) ( not ( = ?auto_180504 ?auto_180506 ) ) ( not ( = ?auto_180504 ?auto_180507 ) ) ( not ( = ?auto_180504 ?auto_180508 ) ) ( not ( = ?auto_180504 ?auto_180509 ) ) ( not ( = ?auto_180505 ?auto_180506 ) ) ( not ( = ?auto_180505 ?auto_180507 ) ) ( not ( = ?auto_180505 ?auto_180508 ) ) ( not ( = ?auto_180505 ?auto_180509 ) ) ( not ( = ?auto_180506 ?auto_180507 ) ) ( not ( = ?auto_180506 ?auto_180508 ) ) ( not ( = ?auto_180506 ?auto_180509 ) ) ( not ( = ?auto_180507 ?auto_180508 ) ) ( not ( = ?auto_180507 ?auto_180509 ) ) ( not ( = ?auto_180508 ?auto_180509 ) ) ( ON ?auto_180507 ?auto_180508 ) ( ON ?auto_180506 ?auto_180507 ) ( ON ?auto_180505 ?auto_180506 ) ( ON ?auto_180504 ?auto_180505 ) ( ON ?auto_180503 ?auto_180504 ) ( ON ?auto_180502 ?auto_180503 ) ( ON ?auto_180501 ?auto_180502 ) ( ON ?auto_180500 ?auto_180501 ) ( ON ?auto_180499 ?auto_180500 ) ( ON ?auto_180498 ?auto_180499 ) ( ON ?auto_180497 ?auto_180498 ) ( CLEAR ?auto_180497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180497 )
      ( MAKE-12PILE ?auto_180497 ?auto_180498 ?auto_180499 ?auto_180500 ?auto_180501 ?auto_180502 ?auto_180503 ?auto_180504 ?auto_180505 ?auto_180506 ?auto_180507 ?auto_180508 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_180522 - BLOCK
      ?auto_180523 - BLOCK
      ?auto_180524 - BLOCK
      ?auto_180525 - BLOCK
      ?auto_180526 - BLOCK
      ?auto_180527 - BLOCK
      ?auto_180528 - BLOCK
      ?auto_180529 - BLOCK
      ?auto_180530 - BLOCK
      ?auto_180531 - BLOCK
      ?auto_180532 - BLOCK
      ?auto_180533 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_180533 ) ( not ( = ?auto_180522 ?auto_180523 ) ) ( not ( = ?auto_180522 ?auto_180524 ) ) ( not ( = ?auto_180522 ?auto_180525 ) ) ( not ( = ?auto_180522 ?auto_180526 ) ) ( not ( = ?auto_180522 ?auto_180527 ) ) ( not ( = ?auto_180522 ?auto_180528 ) ) ( not ( = ?auto_180522 ?auto_180529 ) ) ( not ( = ?auto_180522 ?auto_180530 ) ) ( not ( = ?auto_180522 ?auto_180531 ) ) ( not ( = ?auto_180522 ?auto_180532 ) ) ( not ( = ?auto_180522 ?auto_180533 ) ) ( not ( = ?auto_180523 ?auto_180524 ) ) ( not ( = ?auto_180523 ?auto_180525 ) ) ( not ( = ?auto_180523 ?auto_180526 ) ) ( not ( = ?auto_180523 ?auto_180527 ) ) ( not ( = ?auto_180523 ?auto_180528 ) ) ( not ( = ?auto_180523 ?auto_180529 ) ) ( not ( = ?auto_180523 ?auto_180530 ) ) ( not ( = ?auto_180523 ?auto_180531 ) ) ( not ( = ?auto_180523 ?auto_180532 ) ) ( not ( = ?auto_180523 ?auto_180533 ) ) ( not ( = ?auto_180524 ?auto_180525 ) ) ( not ( = ?auto_180524 ?auto_180526 ) ) ( not ( = ?auto_180524 ?auto_180527 ) ) ( not ( = ?auto_180524 ?auto_180528 ) ) ( not ( = ?auto_180524 ?auto_180529 ) ) ( not ( = ?auto_180524 ?auto_180530 ) ) ( not ( = ?auto_180524 ?auto_180531 ) ) ( not ( = ?auto_180524 ?auto_180532 ) ) ( not ( = ?auto_180524 ?auto_180533 ) ) ( not ( = ?auto_180525 ?auto_180526 ) ) ( not ( = ?auto_180525 ?auto_180527 ) ) ( not ( = ?auto_180525 ?auto_180528 ) ) ( not ( = ?auto_180525 ?auto_180529 ) ) ( not ( = ?auto_180525 ?auto_180530 ) ) ( not ( = ?auto_180525 ?auto_180531 ) ) ( not ( = ?auto_180525 ?auto_180532 ) ) ( not ( = ?auto_180525 ?auto_180533 ) ) ( not ( = ?auto_180526 ?auto_180527 ) ) ( not ( = ?auto_180526 ?auto_180528 ) ) ( not ( = ?auto_180526 ?auto_180529 ) ) ( not ( = ?auto_180526 ?auto_180530 ) ) ( not ( = ?auto_180526 ?auto_180531 ) ) ( not ( = ?auto_180526 ?auto_180532 ) ) ( not ( = ?auto_180526 ?auto_180533 ) ) ( not ( = ?auto_180527 ?auto_180528 ) ) ( not ( = ?auto_180527 ?auto_180529 ) ) ( not ( = ?auto_180527 ?auto_180530 ) ) ( not ( = ?auto_180527 ?auto_180531 ) ) ( not ( = ?auto_180527 ?auto_180532 ) ) ( not ( = ?auto_180527 ?auto_180533 ) ) ( not ( = ?auto_180528 ?auto_180529 ) ) ( not ( = ?auto_180528 ?auto_180530 ) ) ( not ( = ?auto_180528 ?auto_180531 ) ) ( not ( = ?auto_180528 ?auto_180532 ) ) ( not ( = ?auto_180528 ?auto_180533 ) ) ( not ( = ?auto_180529 ?auto_180530 ) ) ( not ( = ?auto_180529 ?auto_180531 ) ) ( not ( = ?auto_180529 ?auto_180532 ) ) ( not ( = ?auto_180529 ?auto_180533 ) ) ( not ( = ?auto_180530 ?auto_180531 ) ) ( not ( = ?auto_180530 ?auto_180532 ) ) ( not ( = ?auto_180530 ?auto_180533 ) ) ( not ( = ?auto_180531 ?auto_180532 ) ) ( not ( = ?auto_180531 ?auto_180533 ) ) ( not ( = ?auto_180532 ?auto_180533 ) ) ( ON ?auto_180532 ?auto_180533 ) ( ON ?auto_180531 ?auto_180532 ) ( ON ?auto_180530 ?auto_180531 ) ( ON ?auto_180529 ?auto_180530 ) ( ON ?auto_180528 ?auto_180529 ) ( ON ?auto_180527 ?auto_180528 ) ( ON ?auto_180526 ?auto_180527 ) ( ON ?auto_180525 ?auto_180526 ) ( ON ?auto_180524 ?auto_180525 ) ( ON ?auto_180523 ?auto_180524 ) ( ON ?auto_180522 ?auto_180523 ) ( CLEAR ?auto_180522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180522 )
      ( MAKE-12PILE ?auto_180522 ?auto_180523 ?auto_180524 ?auto_180525 ?auto_180526 ?auto_180527 ?auto_180528 ?auto_180529 ?auto_180530 ?auto_180531 ?auto_180532 ?auto_180533 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_180546 - BLOCK
      ?auto_180547 - BLOCK
      ?auto_180548 - BLOCK
      ?auto_180549 - BLOCK
      ?auto_180550 - BLOCK
      ?auto_180551 - BLOCK
      ?auto_180552 - BLOCK
      ?auto_180553 - BLOCK
      ?auto_180554 - BLOCK
      ?auto_180555 - BLOCK
      ?auto_180556 - BLOCK
      ?auto_180557 - BLOCK
    )
    :vars
    (
      ?auto_180558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_180546 ?auto_180547 ) ) ( not ( = ?auto_180546 ?auto_180548 ) ) ( not ( = ?auto_180546 ?auto_180549 ) ) ( not ( = ?auto_180546 ?auto_180550 ) ) ( not ( = ?auto_180546 ?auto_180551 ) ) ( not ( = ?auto_180546 ?auto_180552 ) ) ( not ( = ?auto_180546 ?auto_180553 ) ) ( not ( = ?auto_180546 ?auto_180554 ) ) ( not ( = ?auto_180546 ?auto_180555 ) ) ( not ( = ?auto_180546 ?auto_180556 ) ) ( not ( = ?auto_180546 ?auto_180557 ) ) ( not ( = ?auto_180547 ?auto_180548 ) ) ( not ( = ?auto_180547 ?auto_180549 ) ) ( not ( = ?auto_180547 ?auto_180550 ) ) ( not ( = ?auto_180547 ?auto_180551 ) ) ( not ( = ?auto_180547 ?auto_180552 ) ) ( not ( = ?auto_180547 ?auto_180553 ) ) ( not ( = ?auto_180547 ?auto_180554 ) ) ( not ( = ?auto_180547 ?auto_180555 ) ) ( not ( = ?auto_180547 ?auto_180556 ) ) ( not ( = ?auto_180547 ?auto_180557 ) ) ( not ( = ?auto_180548 ?auto_180549 ) ) ( not ( = ?auto_180548 ?auto_180550 ) ) ( not ( = ?auto_180548 ?auto_180551 ) ) ( not ( = ?auto_180548 ?auto_180552 ) ) ( not ( = ?auto_180548 ?auto_180553 ) ) ( not ( = ?auto_180548 ?auto_180554 ) ) ( not ( = ?auto_180548 ?auto_180555 ) ) ( not ( = ?auto_180548 ?auto_180556 ) ) ( not ( = ?auto_180548 ?auto_180557 ) ) ( not ( = ?auto_180549 ?auto_180550 ) ) ( not ( = ?auto_180549 ?auto_180551 ) ) ( not ( = ?auto_180549 ?auto_180552 ) ) ( not ( = ?auto_180549 ?auto_180553 ) ) ( not ( = ?auto_180549 ?auto_180554 ) ) ( not ( = ?auto_180549 ?auto_180555 ) ) ( not ( = ?auto_180549 ?auto_180556 ) ) ( not ( = ?auto_180549 ?auto_180557 ) ) ( not ( = ?auto_180550 ?auto_180551 ) ) ( not ( = ?auto_180550 ?auto_180552 ) ) ( not ( = ?auto_180550 ?auto_180553 ) ) ( not ( = ?auto_180550 ?auto_180554 ) ) ( not ( = ?auto_180550 ?auto_180555 ) ) ( not ( = ?auto_180550 ?auto_180556 ) ) ( not ( = ?auto_180550 ?auto_180557 ) ) ( not ( = ?auto_180551 ?auto_180552 ) ) ( not ( = ?auto_180551 ?auto_180553 ) ) ( not ( = ?auto_180551 ?auto_180554 ) ) ( not ( = ?auto_180551 ?auto_180555 ) ) ( not ( = ?auto_180551 ?auto_180556 ) ) ( not ( = ?auto_180551 ?auto_180557 ) ) ( not ( = ?auto_180552 ?auto_180553 ) ) ( not ( = ?auto_180552 ?auto_180554 ) ) ( not ( = ?auto_180552 ?auto_180555 ) ) ( not ( = ?auto_180552 ?auto_180556 ) ) ( not ( = ?auto_180552 ?auto_180557 ) ) ( not ( = ?auto_180553 ?auto_180554 ) ) ( not ( = ?auto_180553 ?auto_180555 ) ) ( not ( = ?auto_180553 ?auto_180556 ) ) ( not ( = ?auto_180553 ?auto_180557 ) ) ( not ( = ?auto_180554 ?auto_180555 ) ) ( not ( = ?auto_180554 ?auto_180556 ) ) ( not ( = ?auto_180554 ?auto_180557 ) ) ( not ( = ?auto_180555 ?auto_180556 ) ) ( not ( = ?auto_180555 ?auto_180557 ) ) ( not ( = ?auto_180556 ?auto_180557 ) ) ( ON ?auto_180546 ?auto_180558 ) ( not ( = ?auto_180557 ?auto_180558 ) ) ( not ( = ?auto_180556 ?auto_180558 ) ) ( not ( = ?auto_180555 ?auto_180558 ) ) ( not ( = ?auto_180554 ?auto_180558 ) ) ( not ( = ?auto_180553 ?auto_180558 ) ) ( not ( = ?auto_180552 ?auto_180558 ) ) ( not ( = ?auto_180551 ?auto_180558 ) ) ( not ( = ?auto_180550 ?auto_180558 ) ) ( not ( = ?auto_180549 ?auto_180558 ) ) ( not ( = ?auto_180548 ?auto_180558 ) ) ( not ( = ?auto_180547 ?auto_180558 ) ) ( not ( = ?auto_180546 ?auto_180558 ) ) ( ON ?auto_180547 ?auto_180546 ) ( ON ?auto_180548 ?auto_180547 ) ( ON ?auto_180549 ?auto_180548 ) ( ON ?auto_180550 ?auto_180549 ) ( ON ?auto_180551 ?auto_180550 ) ( ON ?auto_180552 ?auto_180551 ) ( ON ?auto_180553 ?auto_180552 ) ( ON ?auto_180554 ?auto_180553 ) ( ON ?auto_180555 ?auto_180554 ) ( ON ?auto_180556 ?auto_180555 ) ( ON ?auto_180557 ?auto_180556 ) ( CLEAR ?auto_180557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_180557 ?auto_180556 ?auto_180555 ?auto_180554 ?auto_180553 ?auto_180552 ?auto_180551 ?auto_180550 ?auto_180549 ?auto_180548 ?auto_180547 ?auto_180546 )
      ( MAKE-12PILE ?auto_180546 ?auto_180547 ?auto_180548 ?auto_180549 ?auto_180550 ?auto_180551 ?auto_180552 ?auto_180553 ?auto_180554 ?auto_180555 ?auto_180556 ?auto_180557 ) )
  )

)

