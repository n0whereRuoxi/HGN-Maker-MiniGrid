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
      ?auto_365837 - BLOCK
    )
    :vars
    (
      ?auto_365838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_365837 ?auto_365838 ) ( CLEAR ?auto_365837 ) ( HAND-EMPTY ) ( not ( = ?auto_365837 ?auto_365838 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_365837 ?auto_365838 )
      ( !PUTDOWN ?auto_365837 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_365844 - BLOCK
      ?auto_365845 - BLOCK
    )
    :vars
    (
      ?auto_365846 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_365844 ) ( ON ?auto_365845 ?auto_365846 ) ( CLEAR ?auto_365845 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_365844 ) ( not ( = ?auto_365844 ?auto_365845 ) ) ( not ( = ?auto_365844 ?auto_365846 ) ) ( not ( = ?auto_365845 ?auto_365846 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_365845 ?auto_365846 )
      ( !STACK ?auto_365845 ?auto_365844 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_365854 - BLOCK
      ?auto_365855 - BLOCK
    )
    :vars
    (
      ?auto_365856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_365855 ?auto_365856 ) ( not ( = ?auto_365854 ?auto_365855 ) ) ( not ( = ?auto_365854 ?auto_365856 ) ) ( not ( = ?auto_365855 ?auto_365856 ) ) ( ON ?auto_365854 ?auto_365855 ) ( CLEAR ?auto_365854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_365854 )
      ( MAKE-2PILE ?auto_365854 ?auto_365855 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_365865 - BLOCK
      ?auto_365866 - BLOCK
      ?auto_365867 - BLOCK
    )
    :vars
    (
      ?auto_365868 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_365866 ) ( ON ?auto_365867 ?auto_365868 ) ( CLEAR ?auto_365867 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_365865 ) ( ON ?auto_365866 ?auto_365865 ) ( not ( = ?auto_365865 ?auto_365866 ) ) ( not ( = ?auto_365865 ?auto_365867 ) ) ( not ( = ?auto_365865 ?auto_365868 ) ) ( not ( = ?auto_365866 ?auto_365867 ) ) ( not ( = ?auto_365866 ?auto_365868 ) ) ( not ( = ?auto_365867 ?auto_365868 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_365867 ?auto_365868 )
      ( !STACK ?auto_365867 ?auto_365866 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_365879 - BLOCK
      ?auto_365880 - BLOCK
      ?auto_365881 - BLOCK
    )
    :vars
    (
      ?auto_365882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_365881 ?auto_365882 ) ( ON-TABLE ?auto_365879 ) ( not ( = ?auto_365879 ?auto_365880 ) ) ( not ( = ?auto_365879 ?auto_365881 ) ) ( not ( = ?auto_365879 ?auto_365882 ) ) ( not ( = ?auto_365880 ?auto_365881 ) ) ( not ( = ?auto_365880 ?auto_365882 ) ) ( not ( = ?auto_365881 ?auto_365882 ) ) ( CLEAR ?auto_365879 ) ( ON ?auto_365880 ?auto_365881 ) ( CLEAR ?auto_365880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_365879 ?auto_365880 )
      ( MAKE-3PILE ?auto_365879 ?auto_365880 ?auto_365881 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_365893 - BLOCK
      ?auto_365894 - BLOCK
      ?auto_365895 - BLOCK
    )
    :vars
    (
      ?auto_365896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_365895 ?auto_365896 ) ( not ( = ?auto_365893 ?auto_365894 ) ) ( not ( = ?auto_365893 ?auto_365895 ) ) ( not ( = ?auto_365893 ?auto_365896 ) ) ( not ( = ?auto_365894 ?auto_365895 ) ) ( not ( = ?auto_365894 ?auto_365896 ) ) ( not ( = ?auto_365895 ?auto_365896 ) ) ( ON ?auto_365894 ?auto_365895 ) ( ON ?auto_365893 ?auto_365894 ) ( CLEAR ?auto_365893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_365893 )
      ( MAKE-3PILE ?auto_365893 ?auto_365894 ?auto_365895 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_365908 - BLOCK
      ?auto_365909 - BLOCK
      ?auto_365910 - BLOCK
      ?auto_365911 - BLOCK
    )
    :vars
    (
      ?auto_365912 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_365910 ) ( ON ?auto_365911 ?auto_365912 ) ( CLEAR ?auto_365911 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_365908 ) ( ON ?auto_365909 ?auto_365908 ) ( ON ?auto_365910 ?auto_365909 ) ( not ( = ?auto_365908 ?auto_365909 ) ) ( not ( = ?auto_365908 ?auto_365910 ) ) ( not ( = ?auto_365908 ?auto_365911 ) ) ( not ( = ?auto_365908 ?auto_365912 ) ) ( not ( = ?auto_365909 ?auto_365910 ) ) ( not ( = ?auto_365909 ?auto_365911 ) ) ( not ( = ?auto_365909 ?auto_365912 ) ) ( not ( = ?auto_365910 ?auto_365911 ) ) ( not ( = ?auto_365910 ?auto_365912 ) ) ( not ( = ?auto_365911 ?auto_365912 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_365911 ?auto_365912 )
      ( !STACK ?auto_365911 ?auto_365910 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_365926 - BLOCK
      ?auto_365927 - BLOCK
      ?auto_365928 - BLOCK
      ?auto_365929 - BLOCK
    )
    :vars
    (
      ?auto_365930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_365929 ?auto_365930 ) ( ON-TABLE ?auto_365926 ) ( ON ?auto_365927 ?auto_365926 ) ( not ( = ?auto_365926 ?auto_365927 ) ) ( not ( = ?auto_365926 ?auto_365928 ) ) ( not ( = ?auto_365926 ?auto_365929 ) ) ( not ( = ?auto_365926 ?auto_365930 ) ) ( not ( = ?auto_365927 ?auto_365928 ) ) ( not ( = ?auto_365927 ?auto_365929 ) ) ( not ( = ?auto_365927 ?auto_365930 ) ) ( not ( = ?auto_365928 ?auto_365929 ) ) ( not ( = ?auto_365928 ?auto_365930 ) ) ( not ( = ?auto_365929 ?auto_365930 ) ) ( CLEAR ?auto_365927 ) ( ON ?auto_365928 ?auto_365929 ) ( CLEAR ?auto_365928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_365926 ?auto_365927 ?auto_365928 )
      ( MAKE-4PILE ?auto_365926 ?auto_365927 ?auto_365928 ?auto_365929 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_365944 - BLOCK
      ?auto_365945 - BLOCK
      ?auto_365946 - BLOCK
      ?auto_365947 - BLOCK
    )
    :vars
    (
      ?auto_365948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_365947 ?auto_365948 ) ( ON-TABLE ?auto_365944 ) ( not ( = ?auto_365944 ?auto_365945 ) ) ( not ( = ?auto_365944 ?auto_365946 ) ) ( not ( = ?auto_365944 ?auto_365947 ) ) ( not ( = ?auto_365944 ?auto_365948 ) ) ( not ( = ?auto_365945 ?auto_365946 ) ) ( not ( = ?auto_365945 ?auto_365947 ) ) ( not ( = ?auto_365945 ?auto_365948 ) ) ( not ( = ?auto_365946 ?auto_365947 ) ) ( not ( = ?auto_365946 ?auto_365948 ) ) ( not ( = ?auto_365947 ?auto_365948 ) ) ( ON ?auto_365946 ?auto_365947 ) ( CLEAR ?auto_365944 ) ( ON ?auto_365945 ?auto_365946 ) ( CLEAR ?auto_365945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_365944 ?auto_365945 )
      ( MAKE-4PILE ?auto_365944 ?auto_365945 ?auto_365946 ?auto_365947 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_365962 - BLOCK
      ?auto_365963 - BLOCK
      ?auto_365964 - BLOCK
      ?auto_365965 - BLOCK
    )
    :vars
    (
      ?auto_365966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_365965 ?auto_365966 ) ( not ( = ?auto_365962 ?auto_365963 ) ) ( not ( = ?auto_365962 ?auto_365964 ) ) ( not ( = ?auto_365962 ?auto_365965 ) ) ( not ( = ?auto_365962 ?auto_365966 ) ) ( not ( = ?auto_365963 ?auto_365964 ) ) ( not ( = ?auto_365963 ?auto_365965 ) ) ( not ( = ?auto_365963 ?auto_365966 ) ) ( not ( = ?auto_365964 ?auto_365965 ) ) ( not ( = ?auto_365964 ?auto_365966 ) ) ( not ( = ?auto_365965 ?auto_365966 ) ) ( ON ?auto_365964 ?auto_365965 ) ( ON ?auto_365963 ?auto_365964 ) ( ON ?auto_365962 ?auto_365963 ) ( CLEAR ?auto_365962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_365962 )
      ( MAKE-4PILE ?auto_365962 ?auto_365963 ?auto_365964 ?auto_365965 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_365981 - BLOCK
      ?auto_365982 - BLOCK
      ?auto_365983 - BLOCK
      ?auto_365984 - BLOCK
      ?auto_365985 - BLOCK
    )
    :vars
    (
      ?auto_365986 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_365984 ) ( ON ?auto_365985 ?auto_365986 ) ( CLEAR ?auto_365985 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_365981 ) ( ON ?auto_365982 ?auto_365981 ) ( ON ?auto_365983 ?auto_365982 ) ( ON ?auto_365984 ?auto_365983 ) ( not ( = ?auto_365981 ?auto_365982 ) ) ( not ( = ?auto_365981 ?auto_365983 ) ) ( not ( = ?auto_365981 ?auto_365984 ) ) ( not ( = ?auto_365981 ?auto_365985 ) ) ( not ( = ?auto_365981 ?auto_365986 ) ) ( not ( = ?auto_365982 ?auto_365983 ) ) ( not ( = ?auto_365982 ?auto_365984 ) ) ( not ( = ?auto_365982 ?auto_365985 ) ) ( not ( = ?auto_365982 ?auto_365986 ) ) ( not ( = ?auto_365983 ?auto_365984 ) ) ( not ( = ?auto_365983 ?auto_365985 ) ) ( not ( = ?auto_365983 ?auto_365986 ) ) ( not ( = ?auto_365984 ?auto_365985 ) ) ( not ( = ?auto_365984 ?auto_365986 ) ) ( not ( = ?auto_365985 ?auto_365986 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_365985 ?auto_365986 )
      ( !STACK ?auto_365985 ?auto_365984 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_366003 - BLOCK
      ?auto_366004 - BLOCK
      ?auto_366005 - BLOCK
      ?auto_366006 - BLOCK
      ?auto_366007 - BLOCK
    )
    :vars
    (
      ?auto_366008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366007 ?auto_366008 ) ( ON-TABLE ?auto_366003 ) ( ON ?auto_366004 ?auto_366003 ) ( ON ?auto_366005 ?auto_366004 ) ( not ( = ?auto_366003 ?auto_366004 ) ) ( not ( = ?auto_366003 ?auto_366005 ) ) ( not ( = ?auto_366003 ?auto_366006 ) ) ( not ( = ?auto_366003 ?auto_366007 ) ) ( not ( = ?auto_366003 ?auto_366008 ) ) ( not ( = ?auto_366004 ?auto_366005 ) ) ( not ( = ?auto_366004 ?auto_366006 ) ) ( not ( = ?auto_366004 ?auto_366007 ) ) ( not ( = ?auto_366004 ?auto_366008 ) ) ( not ( = ?auto_366005 ?auto_366006 ) ) ( not ( = ?auto_366005 ?auto_366007 ) ) ( not ( = ?auto_366005 ?auto_366008 ) ) ( not ( = ?auto_366006 ?auto_366007 ) ) ( not ( = ?auto_366006 ?auto_366008 ) ) ( not ( = ?auto_366007 ?auto_366008 ) ) ( CLEAR ?auto_366005 ) ( ON ?auto_366006 ?auto_366007 ) ( CLEAR ?auto_366006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_366003 ?auto_366004 ?auto_366005 ?auto_366006 )
      ( MAKE-5PILE ?auto_366003 ?auto_366004 ?auto_366005 ?auto_366006 ?auto_366007 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_366025 - BLOCK
      ?auto_366026 - BLOCK
      ?auto_366027 - BLOCK
      ?auto_366028 - BLOCK
      ?auto_366029 - BLOCK
    )
    :vars
    (
      ?auto_366030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366029 ?auto_366030 ) ( ON-TABLE ?auto_366025 ) ( ON ?auto_366026 ?auto_366025 ) ( not ( = ?auto_366025 ?auto_366026 ) ) ( not ( = ?auto_366025 ?auto_366027 ) ) ( not ( = ?auto_366025 ?auto_366028 ) ) ( not ( = ?auto_366025 ?auto_366029 ) ) ( not ( = ?auto_366025 ?auto_366030 ) ) ( not ( = ?auto_366026 ?auto_366027 ) ) ( not ( = ?auto_366026 ?auto_366028 ) ) ( not ( = ?auto_366026 ?auto_366029 ) ) ( not ( = ?auto_366026 ?auto_366030 ) ) ( not ( = ?auto_366027 ?auto_366028 ) ) ( not ( = ?auto_366027 ?auto_366029 ) ) ( not ( = ?auto_366027 ?auto_366030 ) ) ( not ( = ?auto_366028 ?auto_366029 ) ) ( not ( = ?auto_366028 ?auto_366030 ) ) ( not ( = ?auto_366029 ?auto_366030 ) ) ( ON ?auto_366028 ?auto_366029 ) ( CLEAR ?auto_366026 ) ( ON ?auto_366027 ?auto_366028 ) ( CLEAR ?auto_366027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_366025 ?auto_366026 ?auto_366027 )
      ( MAKE-5PILE ?auto_366025 ?auto_366026 ?auto_366027 ?auto_366028 ?auto_366029 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_366047 - BLOCK
      ?auto_366048 - BLOCK
      ?auto_366049 - BLOCK
      ?auto_366050 - BLOCK
      ?auto_366051 - BLOCK
    )
    :vars
    (
      ?auto_366052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366051 ?auto_366052 ) ( ON-TABLE ?auto_366047 ) ( not ( = ?auto_366047 ?auto_366048 ) ) ( not ( = ?auto_366047 ?auto_366049 ) ) ( not ( = ?auto_366047 ?auto_366050 ) ) ( not ( = ?auto_366047 ?auto_366051 ) ) ( not ( = ?auto_366047 ?auto_366052 ) ) ( not ( = ?auto_366048 ?auto_366049 ) ) ( not ( = ?auto_366048 ?auto_366050 ) ) ( not ( = ?auto_366048 ?auto_366051 ) ) ( not ( = ?auto_366048 ?auto_366052 ) ) ( not ( = ?auto_366049 ?auto_366050 ) ) ( not ( = ?auto_366049 ?auto_366051 ) ) ( not ( = ?auto_366049 ?auto_366052 ) ) ( not ( = ?auto_366050 ?auto_366051 ) ) ( not ( = ?auto_366050 ?auto_366052 ) ) ( not ( = ?auto_366051 ?auto_366052 ) ) ( ON ?auto_366050 ?auto_366051 ) ( ON ?auto_366049 ?auto_366050 ) ( CLEAR ?auto_366047 ) ( ON ?auto_366048 ?auto_366049 ) ( CLEAR ?auto_366048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_366047 ?auto_366048 )
      ( MAKE-5PILE ?auto_366047 ?auto_366048 ?auto_366049 ?auto_366050 ?auto_366051 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_366069 - BLOCK
      ?auto_366070 - BLOCK
      ?auto_366071 - BLOCK
      ?auto_366072 - BLOCK
      ?auto_366073 - BLOCK
    )
    :vars
    (
      ?auto_366074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366073 ?auto_366074 ) ( not ( = ?auto_366069 ?auto_366070 ) ) ( not ( = ?auto_366069 ?auto_366071 ) ) ( not ( = ?auto_366069 ?auto_366072 ) ) ( not ( = ?auto_366069 ?auto_366073 ) ) ( not ( = ?auto_366069 ?auto_366074 ) ) ( not ( = ?auto_366070 ?auto_366071 ) ) ( not ( = ?auto_366070 ?auto_366072 ) ) ( not ( = ?auto_366070 ?auto_366073 ) ) ( not ( = ?auto_366070 ?auto_366074 ) ) ( not ( = ?auto_366071 ?auto_366072 ) ) ( not ( = ?auto_366071 ?auto_366073 ) ) ( not ( = ?auto_366071 ?auto_366074 ) ) ( not ( = ?auto_366072 ?auto_366073 ) ) ( not ( = ?auto_366072 ?auto_366074 ) ) ( not ( = ?auto_366073 ?auto_366074 ) ) ( ON ?auto_366072 ?auto_366073 ) ( ON ?auto_366071 ?auto_366072 ) ( ON ?auto_366070 ?auto_366071 ) ( ON ?auto_366069 ?auto_366070 ) ( CLEAR ?auto_366069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_366069 )
      ( MAKE-5PILE ?auto_366069 ?auto_366070 ?auto_366071 ?auto_366072 ?auto_366073 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_366092 - BLOCK
      ?auto_366093 - BLOCK
      ?auto_366094 - BLOCK
      ?auto_366095 - BLOCK
      ?auto_366096 - BLOCK
      ?auto_366097 - BLOCK
    )
    :vars
    (
      ?auto_366098 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_366096 ) ( ON ?auto_366097 ?auto_366098 ) ( CLEAR ?auto_366097 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_366092 ) ( ON ?auto_366093 ?auto_366092 ) ( ON ?auto_366094 ?auto_366093 ) ( ON ?auto_366095 ?auto_366094 ) ( ON ?auto_366096 ?auto_366095 ) ( not ( = ?auto_366092 ?auto_366093 ) ) ( not ( = ?auto_366092 ?auto_366094 ) ) ( not ( = ?auto_366092 ?auto_366095 ) ) ( not ( = ?auto_366092 ?auto_366096 ) ) ( not ( = ?auto_366092 ?auto_366097 ) ) ( not ( = ?auto_366092 ?auto_366098 ) ) ( not ( = ?auto_366093 ?auto_366094 ) ) ( not ( = ?auto_366093 ?auto_366095 ) ) ( not ( = ?auto_366093 ?auto_366096 ) ) ( not ( = ?auto_366093 ?auto_366097 ) ) ( not ( = ?auto_366093 ?auto_366098 ) ) ( not ( = ?auto_366094 ?auto_366095 ) ) ( not ( = ?auto_366094 ?auto_366096 ) ) ( not ( = ?auto_366094 ?auto_366097 ) ) ( not ( = ?auto_366094 ?auto_366098 ) ) ( not ( = ?auto_366095 ?auto_366096 ) ) ( not ( = ?auto_366095 ?auto_366097 ) ) ( not ( = ?auto_366095 ?auto_366098 ) ) ( not ( = ?auto_366096 ?auto_366097 ) ) ( not ( = ?auto_366096 ?auto_366098 ) ) ( not ( = ?auto_366097 ?auto_366098 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_366097 ?auto_366098 )
      ( !STACK ?auto_366097 ?auto_366096 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_366118 - BLOCK
      ?auto_366119 - BLOCK
      ?auto_366120 - BLOCK
      ?auto_366121 - BLOCK
      ?auto_366122 - BLOCK
      ?auto_366123 - BLOCK
    )
    :vars
    (
      ?auto_366124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366123 ?auto_366124 ) ( ON-TABLE ?auto_366118 ) ( ON ?auto_366119 ?auto_366118 ) ( ON ?auto_366120 ?auto_366119 ) ( ON ?auto_366121 ?auto_366120 ) ( not ( = ?auto_366118 ?auto_366119 ) ) ( not ( = ?auto_366118 ?auto_366120 ) ) ( not ( = ?auto_366118 ?auto_366121 ) ) ( not ( = ?auto_366118 ?auto_366122 ) ) ( not ( = ?auto_366118 ?auto_366123 ) ) ( not ( = ?auto_366118 ?auto_366124 ) ) ( not ( = ?auto_366119 ?auto_366120 ) ) ( not ( = ?auto_366119 ?auto_366121 ) ) ( not ( = ?auto_366119 ?auto_366122 ) ) ( not ( = ?auto_366119 ?auto_366123 ) ) ( not ( = ?auto_366119 ?auto_366124 ) ) ( not ( = ?auto_366120 ?auto_366121 ) ) ( not ( = ?auto_366120 ?auto_366122 ) ) ( not ( = ?auto_366120 ?auto_366123 ) ) ( not ( = ?auto_366120 ?auto_366124 ) ) ( not ( = ?auto_366121 ?auto_366122 ) ) ( not ( = ?auto_366121 ?auto_366123 ) ) ( not ( = ?auto_366121 ?auto_366124 ) ) ( not ( = ?auto_366122 ?auto_366123 ) ) ( not ( = ?auto_366122 ?auto_366124 ) ) ( not ( = ?auto_366123 ?auto_366124 ) ) ( CLEAR ?auto_366121 ) ( ON ?auto_366122 ?auto_366123 ) ( CLEAR ?auto_366122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_366118 ?auto_366119 ?auto_366120 ?auto_366121 ?auto_366122 )
      ( MAKE-6PILE ?auto_366118 ?auto_366119 ?auto_366120 ?auto_366121 ?auto_366122 ?auto_366123 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_366144 - BLOCK
      ?auto_366145 - BLOCK
      ?auto_366146 - BLOCK
      ?auto_366147 - BLOCK
      ?auto_366148 - BLOCK
      ?auto_366149 - BLOCK
    )
    :vars
    (
      ?auto_366150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366149 ?auto_366150 ) ( ON-TABLE ?auto_366144 ) ( ON ?auto_366145 ?auto_366144 ) ( ON ?auto_366146 ?auto_366145 ) ( not ( = ?auto_366144 ?auto_366145 ) ) ( not ( = ?auto_366144 ?auto_366146 ) ) ( not ( = ?auto_366144 ?auto_366147 ) ) ( not ( = ?auto_366144 ?auto_366148 ) ) ( not ( = ?auto_366144 ?auto_366149 ) ) ( not ( = ?auto_366144 ?auto_366150 ) ) ( not ( = ?auto_366145 ?auto_366146 ) ) ( not ( = ?auto_366145 ?auto_366147 ) ) ( not ( = ?auto_366145 ?auto_366148 ) ) ( not ( = ?auto_366145 ?auto_366149 ) ) ( not ( = ?auto_366145 ?auto_366150 ) ) ( not ( = ?auto_366146 ?auto_366147 ) ) ( not ( = ?auto_366146 ?auto_366148 ) ) ( not ( = ?auto_366146 ?auto_366149 ) ) ( not ( = ?auto_366146 ?auto_366150 ) ) ( not ( = ?auto_366147 ?auto_366148 ) ) ( not ( = ?auto_366147 ?auto_366149 ) ) ( not ( = ?auto_366147 ?auto_366150 ) ) ( not ( = ?auto_366148 ?auto_366149 ) ) ( not ( = ?auto_366148 ?auto_366150 ) ) ( not ( = ?auto_366149 ?auto_366150 ) ) ( ON ?auto_366148 ?auto_366149 ) ( CLEAR ?auto_366146 ) ( ON ?auto_366147 ?auto_366148 ) ( CLEAR ?auto_366147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_366144 ?auto_366145 ?auto_366146 ?auto_366147 )
      ( MAKE-6PILE ?auto_366144 ?auto_366145 ?auto_366146 ?auto_366147 ?auto_366148 ?auto_366149 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_366170 - BLOCK
      ?auto_366171 - BLOCK
      ?auto_366172 - BLOCK
      ?auto_366173 - BLOCK
      ?auto_366174 - BLOCK
      ?auto_366175 - BLOCK
    )
    :vars
    (
      ?auto_366176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366175 ?auto_366176 ) ( ON-TABLE ?auto_366170 ) ( ON ?auto_366171 ?auto_366170 ) ( not ( = ?auto_366170 ?auto_366171 ) ) ( not ( = ?auto_366170 ?auto_366172 ) ) ( not ( = ?auto_366170 ?auto_366173 ) ) ( not ( = ?auto_366170 ?auto_366174 ) ) ( not ( = ?auto_366170 ?auto_366175 ) ) ( not ( = ?auto_366170 ?auto_366176 ) ) ( not ( = ?auto_366171 ?auto_366172 ) ) ( not ( = ?auto_366171 ?auto_366173 ) ) ( not ( = ?auto_366171 ?auto_366174 ) ) ( not ( = ?auto_366171 ?auto_366175 ) ) ( not ( = ?auto_366171 ?auto_366176 ) ) ( not ( = ?auto_366172 ?auto_366173 ) ) ( not ( = ?auto_366172 ?auto_366174 ) ) ( not ( = ?auto_366172 ?auto_366175 ) ) ( not ( = ?auto_366172 ?auto_366176 ) ) ( not ( = ?auto_366173 ?auto_366174 ) ) ( not ( = ?auto_366173 ?auto_366175 ) ) ( not ( = ?auto_366173 ?auto_366176 ) ) ( not ( = ?auto_366174 ?auto_366175 ) ) ( not ( = ?auto_366174 ?auto_366176 ) ) ( not ( = ?auto_366175 ?auto_366176 ) ) ( ON ?auto_366174 ?auto_366175 ) ( ON ?auto_366173 ?auto_366174 ) ( CLEAR ?auto_366171 ) ( ON ?auto_366172 ?auto_366173 ) ( CLEAR ?auto_366172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_366170 ?auto_366171 ?auto_366172 )
      ( MAKE-6PILE ?auto_366170 ?auto_366171 ?auto_366172 ?auto_366173 ?auto_366174 ?auto_366175 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_366196 - BLOCK
      ?auto_366197 - BLOCK
      ?auto_366198 - BLOCK
      ?auto_366199 - BLOCK
      ?auto_366200 - BLOCK
      ?auto_366201 - BLOCK
    )
    :vars
    (
      ?auto_366202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366201 ?auto_366202 ) ( ON-TABLE ?auto_366196 ) ( not ( = ?auto_366196 ?auto_366197 ) ) ( not ( = ?auto_366196 ?auto_366198 ) ) ( not ( = ?auto_366196 ?auto_366199 ) ) ( not ( = ?auto_366196 ?auto_366200 ) ) ( not ( = ?auto_366196 ?auto_366201 ) ) ( not ( = ?auto_366196 ?auto_366202 ) ) ( not ( = ?auto_366197 ?auto_366198 ) ) ( not ( = ?auto_366197 ?auto_366199 ) ) ( not ( = ?auto_366197 ?auto_366200 ) ) ( not ( = ?auto_366197 ?auto_366201 ) ) ( not ( = ?auto_366197 ?auto_366202 ) ) ( not ( = ?auto_366198 ?auto_366199 ) ) ( not ( = ?auto_366198 ?auto_366200 ) ) ( not ( = ?auto_366198 ?auto_366201 ) ) ( not ( = ?auto_366198 ?auto_366202 ) ) ( not ( = ?auto_366199 ?auto_366200 ) ) ( not ( = ?auto_366199 ?auto_366201 ) ) ( not ( = ?auto_366199 ?auto_366202 ) ) ( not ( = ?auto_366200 ?auto_366201 ) ) ( not ( = ?auto_366200 ?auto_366202 ) ) ( not ( = ?auto_366201 ?auto_366202 ) ) ( ON ?auto_366200 ?auto_366201 ) ( ON ?auto_366199 ?auto_366200 ) ( ON ?auto_366198 ?auto_366199 ) ( CLEAR ?auto_366196 ) ( ON ?auto_366197 ?auto_366198 ) ( CLEAR ?auto_366197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_366196 ?auto_366197 )
      ( MAKE-6PILE ?auto_366196 ?auto_366197 ?auto_366198 ?auto_366199 ?auto_366200 ?auto_366201 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_366222 - BLOCK
      ?auto_366223 - BLOCK
      ?auto_366224 - BLOCK
      ?auto_366225 - BLOCK
      ?auto_366226 - BLOCK
      ?auto_366227 - BLOCK
    )
    :vars
    (
      ?auto_366228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366227 ?auto_366228 ) ( not ( = ?auto_366222 ?auto_366223 ) ) ( not ( = ?auto_366222 ?auto_366224 ) ) ( not ( = ?auto_366222 ?auto_366225 ) ) ( not ( = ?auto_366222 ?auto_366226 ) ) ( not ( = ?auto_366222 ?auto_366227 ) ) ( not ( = ?auto_366222 ?auto_366228 ) ) ( not ( = ?auto_366223 ?auto_366224 ) ) ( not ( = ?auto_366223 ?auto_366225 ) ) ( not ( = ?auto_366223 ?auto_366226 ) ) ( not ( = ?auto_366223 ?auto_366227 ) ) ( not ( = ?auto_366223 ?auto_366228 ) ) ( not ( = ?auto_366224 ?auto_366225 ) ) ( not ( = ?auto_366224 ?auto_366226 ) ) ( not ( = ?auto_366224 ?auto_366227 ) ) ( not ( = ?auto_366224 ?auto_366228 ) ) ( not ( = ?auto_366225 ?auto_366226 ) ) ( not ( = ?auto_366225 ?auto_366227 ) ) ( not ( = ?auto_366225 ?auto_366228 ) ) ( not ( = ?auto_366226 ?auto_366227 ) ) ( not ( = ?auto_366226 ?auto_366228 ) ) ( not ( = ?auto_366227 ?auto_366228 ) ) ( ON ?auto_366226 ?auto_366227 ) ( ON ?auto_366225 ?auto_366226 ) ( ON ?auto_366224 ?auto_366225 ) ( ON ?auto_366223 ?auto_366224 ) ( ON ?auto_366222 ?auto_366223 ) ( CLEAR ?auto_366222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_366222 )
      ( MAKE-6PILE ?auto_366222 ?auto_366223 ?auto_366224 ?auto_366225 ?auto_366226 ?auto_366227 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_366249 - BLOCK
      ?auto_366250 - BLOCK
      ?auto_366251 - BLOCK
      ?auto_366252 - BLOCK
      ?auto_366253 - BLOCK
      ?auto_366254 - BLOCK
      ?auto_366255 - BLOCK
    )
    :vars
    (
      ?auto_366256 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_366254 ) ( ON ?auto_366255 ?auto_366256 ) ( CLEAR ?auto_366255 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_366249 ) ( ON ?auto_366250 ?auto_366249 ) ( ON ?auto_366251 ?auto_366250 ) ( ON ?auto_366252 ?auto_366251 ) ( ON ?auto_366253 ?auto_366252 ) ( ON ?auto_366254 ?auto_366253 ) ( not ( = ?auto_366249 ?auto_366250 ) ) ( not ( = ?auto_366249 ?auto_366251 ) ) ( not ( = ?auto_366249 ?auto_366252 ) ) ( not ( = ?auto_366249 ?auto_366253 ) ) ( not ( = ?auto_366249 ?auto_366254 ) ) ( not ( = ?auto_366249 ?auto_366255 ) ) ( not ( = ?auto_366249 ?auto_366256 ) ) ( not ( = ?auto_366250 ?auto_366251 ) ) ( not ( = ?auto_366250 ?auto_366252 ) ) ( not ( = ?auto_366250 ?auto_366253 ) ) ( not ( = ?auto_366250 ?auto_366254 ) ) ( not ( = ?auto_366250 ?auto_366255 ) ) ( not ( = ?auto_366250 ?auto_366256 ) ) ( not ( = ?auto_366251 ?auto_366252 ) ) ( not ( = ?auto_366251 ?auto_366253 ) ) ( not ( = ?auto_366251 ?auto_366254 ) ) ( not ( = ?auto_366251 ?auto_366255 ) ) ( not ( = ?auto_366251 ?auto_366256 ) ) ( not ( = ?auto_366252 ?auto_366253 ) ) ( not ( = ?auto_366252 ?auto_366254 ) ) ( not ( = ?auto_366252 ?auto_366255 ) ) ( not ( = ?auto_366252 ?auto_366256 ) ) ( not ( = ?auto_366253 ?auto_366254 ) ) ( not ( = ?auto_366253 ?auto_366255 ) ) ( not ( = ?auto_366253 ?auto_366256 ) ) ( not ( = ?auto_366254 ?auto_366255 ) ) ( not ( = ?auto_366254 ?auto_366256 ) ) ( not ( = ?auto_366255 ?auto_366256 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_366255 ?auto_366256 )
      ( !STACK ?auto_366255 ?auto_366254 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_366279 - BLOCK
      ?auto_366280 - BLOCK
      ?auto_366281 - BLOCK
      ?auto_366282 - BLOCK
      ?auto_366283 - BLOCK
      ?auto_366284 - BLOCK
      ?auto_366285 - BLOCK
    )
    :vars
    (
      ?auto_366286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366285 ?auto_366286 ) ( ON-TABLE ?auto_366279 ) ( ON ?auto_366280 ?auto_366279 ) ( ON ?auto_366281 ?auto_366280 ) ( ON ?auto_366282 ?auto_366281 ) ( ON ?auto_366283 ?auto_366282 ) ( not ( = ?auto_366279 ?auto_366280 ) ) ( not ( = ?auto_366279 ?auto_366281 ) ) ( not ( = ?auto_366279 ?auto_366282 ) ) ( not ( = ?auto_366279 ?auto_366283 ) ) ( not ( = ?auto_366279 ?auto_366284 ) ) ( not ( = ?auto_366279 ?auto_366285 ) ) ( not ( = ?auto_366279 ?auto_366286 ) ) ( not ( = ?auto_366280 ?auto_366281 ) ) ( not ( = ?auto_366280 ?auto_366282 ) ) ( not ( = ?auto_366280 ?auto_366283 ) ) ( not ( = ?auto_366280 ?auto_366284 ) ) ( not ( = ?auto_366280 ?auto_366285 ) ) ( not ( = ?auto_366280 ?auto_366286 ) ) ( not ( = ?auto_366281 ?auto_366282 ) ) ( not ( = ?auto_366281 ?auto_366283 ) ) ( not ( = ?auto_366281 ?auto_366284 ) ) ( not ( = ?auto_366281 ?auto_366285 ) ) ( not ( = ?auto_366281 ?auto_366286 ) ) ( not ( = ?auto_366282 ?auto_366283 ) ) ( not ( = ?auto_366282 ?auto_366284 ) ) ( not ( = ?auto_366282 ?auto_366285 ) ) ( not ( = ?auto_366282 ?auto_366286 ) ) ( not ( = ?auto_366283 ?auto_366284 ) ) ( not ( = ?auto_366283 ?auto_366285 ) ) ( not ( = ?auto_366283 ?auto_366286 ) ) ( not ( = ?auto_366284 ?auto_366285 ) ) ( not ( = ?auto_366284 ?auto_366286 ) ) ( not ( = ?auto_366285 ?auto_366286 ) ) ( CLEAR ?auto_366283 ) ( ON ?auto_366284 ?auto_366285 ) ( CLEAR ?auto_366284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_366279 ?auto_366280 ?auto_366281 ?auto_366282 ?auto_366283 ?auto_366284 )
      ( MAKE-7PILE ?auto_366279 ?auto_366280 ?auto_366281 ?auto_366282 ?auto_366283 ?auto_366284 ?auto_366285 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_366309 - BLOCK
      ?auto_366310 - BLOCK
      ?auto_366311 - BLOCK
      ?auto_366312 - BLOCK
      ?auto_366313 - BLOCK
      ?auto_366314 - BLOCK
      ?auto_366315 - BLOCK
    )
    :vars
    (
      ?auto_366316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366315 ?auto_366316 ) ( ON-TABLE ?auto_366309 ) ( ON ?auto_366310 ?auto_366309 ) ( ON ?auto_366311 ?auto_366310 ) ( ON ?auto_366312 ?auto_366311 ) ( not ( = ?auto_366309 ?auto_366310 ) ) ( not ( = ?auto_366309 ?auto_366311 ) ) ( not ( = ?auto_366309 ?auto_366312 ) ) ( not ( = ?auto_366309 ?auto_366313 ) ) ( not ( = ?auto_366309 ?auto_366314 ) ) ( not ( = ?auto_366309 ?auto_366315 ) ) ( not ( = ?auto_366309 ?auto_366316 ) ) ( not ( = ?auto_366310 ?auto_366311 ) ) ( not ( = ?auto_366310 ?auto_366312 ) ) ( not ( = ?auto_366310 ?auto_366313 ) ) ( not ( = ?auto_366310 ?auto_366314 ) ) ( not ( = ?auto_366310 ?auto_366315 ) ) ( not ( = ?auto_366310 ?auto_366316 ) ) ( not ( = ?auto_366311 ?auto_366312 ) ) ( not ( = ?auto_366311 ?auto_366313 ) ) ( not ( = ?auto_366311 ?auto_366314 ) ) ( not ( = ?auto_366311 ?auto_366315 ) ) ( not ( = ?auto_366311 ?auto_366316 ) ) ( not ( = ?auto_366312 ?auto_366313 ) ) ( not ( = ?auto_366312 ?auto_366314 ) ) ( not ( = ?auto_366312 ?auto_366315 ) ) ( not ( = ?auto_366312 ?auto_366316 ) ) ( not ( = ?auto_366313 ?auto_366314 ) ) ( not ( = ?auto_366313 ?auto_366315 ) ) ( not ( = ?auto_366313 ?auto_366316 ) ) ( not ( = ?auto_366314 ?auto_366315 ) ) ( not ( = ?auto_366314 ?auto_366316 ) ) ( not ( = ?auto_366315 ?auto_366316 ) ) ( ON ?auto_366314 ?auto_366315 ) ( CLEAR ?auto_366312 ) ( ON ?auto_366313 ?auto_366314 ) ( CLEAR ?auto_366313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_366309 ?auto_366310 ?auto_366311 ?auto_366312 ?auto_366313 )
      ( MAKE-7PILE ?auto_366309 ?auto_366310 ?auto_366311 ?auto_366312 ?auto_366313 ?auto_366314 ?auto_366315 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_366339 - BLOCK
      ?auto_366340 - BLOCK
      ?auto_366341 - BLOCK
      ?auto_366342 - BLOCK
      ?auto_366343 - BLOCK
      ?auto_366344 - BLOCK
      ?auto_366345 - BLOCK
    )
    :vars
    (
      ?auto_366346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366345 ?auto_366346 ) ( ON-TABLE ?auto_366339 ) ( ON ?auto_366340 ?auto_366339 ) ( ON ?auto_366341 ?auto_366340 ) ( not ( = ?auto_366339 ?auto_366340 ) ) ( not ( = ?auto_366339 ?auto_366341 ) ) ( not ( = ?auto_366339 ?auto_366342 ) ) ( not ( = ?auto_366339 ?auto_366343 ) ) ( not ( = ?auto_366339 ?auto_366344 ) ) ( not ( = ?auto_366339 ?auto_366345 ) ) ( not ( = ?auto_366339 ?auto_366346 ) ) ( not ( = ?auto_366340 ?auto_366341 ) ) ( not ( = ?auto_366340 ?auto_366342 ) ) ( not ( = ?auto_366340 ?auto_366343 ) ) ( not ( = ?auto_366340 ?auto_366344 ) ) ( not ( = ?auto_366340 ?auto_366345 ) ) ( not ( = ?auto_366340 ?auto_366346 ) ) ( not ( = ?auto_366341 ?auto_366342 ) ) ( not ( = ?auto_366341 ?auto_366343 ) ) ( not ( = ?auto_366341 ?auto_366344 ) ) ( not ( = ?auto_366341 ?auto_366345 ) ) ( not ( = ?auto_366341 ?auto_366346 ) ) ( not ( = ?auto_366342 ?auto_366343 ) ) ( not ( = ?auto_366342 ?auto_366344 ) ) ( not ( = ?auto_366342 ?auto_366345 ) ) ( not ( = ?auto_366342 ?auto_366346 ) ) ( not ( = ?auto_366343 ?auto_366344 ) ) ( not ( = ?auto_366343 ?auto_366345 ) ) ( not ( = ?auto_366343 ?auto_366346 ) ) ( not ( = ?auto_366344 ?auto_366345 ) ) ( not ( = ?auto_366344 ?auto_366346 ) ) ( not ( = ?auto_366345 ?auto_366346 ) ) ( ON ?auto_366344 ?auto_366345 ) ( ON ?auto_366343 ?auto_366344 ) ( CLEAR ?auto_366341 ) ( ON ?auto_366342 ?auto_366343 ) ( CLEAR ?auto_366342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_366339 ?auto_366340 ?auto_366341 ?auto_366342 )
      ( MAKE-7PILE ?auto_366339 ?auto_366340 ?auto_366341 ?auto_366342 ?auto_366343 ?auto_366344 ?auto_366345 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_366369 - BLOCK
      ?auto_366370 - BLOCK
      ?auto_366371 - BLOCK
      ?auto_366372 - BLOCK
      ?auto_366373 - BLOCK
      ?auto_366374 - BLOCK
      ?auto_366375 - BLOCK
    )
    :vars
    (
      ?auto_366376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366375 ?auto_366376 ) ( ON-TABLE ?auto_366369 ) ( ON ?auto_366370 ?auto_366369 ) ( not ( = ?auto_366369 ?auto_366370 ) ) ( not ( = ?auto_366369 ?auto_366371 ) ) ( not ( = ?auto_366369 ?auto_366372 ) ) ( not ( = ?auto_366369 ?auto_366373 ) ) ( not ( = ?auto_366369 ?auto_366374 ) ) ( not ( = ?auto_366369 ?auto_366375 ) ) ( not ( = ?auto_366369 ?auto_366376 ) ) ( not ( = ?auto_366370 ?auto_366371 ) ) ( not ( = ?auto_366370 ?auto_366372 ) ) ( not ( = ?auto_366370 ?auto_366373 ) ) ( not ( = ?auto_366370 ?auto_366374 ) ) ( not ( = ?auto_366370 ?auto_366375 ) ) ( not ( = ?auto_366370 ?auto_366376 ) ) ( not ( = ?auto_366371 ?auto_366372 ) ) ( not ( = ?auto_366371 ?auto_366373 ) ) ( not ( = ?auto_366371 ?auto_366374 ) ) ( not ( = ?auto_366371 ?auto_366375 ) ) ( not ( = ?auto_366371 ?auto_366376 ) ) ( not ( = ?auto_366372 ?auto_366373 ) ) ( not ( = ?auto_366372 ?auto_366374 ) ) ( not ( = ?auto_366372 ?auto_366375 ) ) ( not ( = ?auto_366372 ?auto_366376 ) ) ( not ( = ?auto_366373 ?auto_366374 ) ) ( not ( = ?auto_366373 ?auto_366375 ) ) ( not ( = ?auto_366373 ?auto_366376 ) ) ( not ( = ?auto_366374 ?auto_366375 ) ) ( not ( = ?auto_366374 ?auto_366376 ) ) ( not ( = ?auto_366375 ?auto_366376 ) ) ( ON ?auto_366374 ?auto_366375 ) ( ON ?auto_366373 ?auto_366374 ) ( ON ?auto_366372 ?auto_366373 ) ( CLEAR ?auto_366370 ) ( ON ?auto_366371 ?auto_366372 ) ( CLEAR ?auto_366371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_366369 ?auto_366370 ?auto_366371 )
      ( MAKE-7PILE ?auto_366369 ?auto_366370 ?auto_366371 ?auto_366372 ?auto_366373 ?auto_366374 ?auto_366375 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_366399 - BLOCK
      ?auto_366400 - BLOCK
      ?auto_366401 - BLOCK
      ?auto_366402 - BLOCK
      ?auto_366403 - BLOCK
      ?auto_366404 - BLOCK
      ?auto_366405 - BLOCK
    )
    :vars
    (
      ?auto_366406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366405 ?auto_366406 ) ( ON-TABLE ?auto_366399 ) ( not ( = ?auto_366399 ?auto_366400 ) ) ( not ( = ?auto_366399 ?auto_366401 ) ) ( not ( = ?auto_366399 ?auto_366402 ) ) ( not ( = ?auto_366399 ?auto_366403 ) ) ( not ( = ?auto_366399 ?auto_366404 ) ) ( not ( = ?auto_366399 ?auto_366405 ) ) ( not ( = ?auto_366399 ?auto_366406 ) ) ( not ( = ?auto_366400 ?auto_366401 ) ) ( not ( = ?auto_366400 ?auto_366402 ) ) ( not ( = ?auto_366400 ?auto_366403 ) ) ( not ( = ?auto_366400 ?auto_366404 ) ) ( not ( = ?auto_366400 ?auto_366405 ) ) ( not ( = ?auto_366400 ?auto_366406 ) ) ( not ( = ?auto_366401 ?auto_366402 ) ) ( not ( = ?auto_366401 ?auto_366403 ) ) ( not ( = ?auto_366401 ?auto_366404 ) ) ( not ( = ?auto_366401 ?auto_366405 ) ) ( not ( = ?auto_366401 ?auto_366406 ) ) ( not ( = ?auto_366402 ?auto_366403 ) ) ( not ( = ?auto_366402 ?auto_366404 ) ) ( not ( = ?auto_366402 ?auto_366405 ) ) ( not ( = ?auto_366402 ?auto_366406 ) ) ( not ( = ?auto_366403 ?auto_366404 ) ) ( not ( = ?auto_366403 ?auto_366405 ) ) ( not ( = ?auto_366403 ?auto_366406 ) ) ( not ( = ?auto_366404 ?auto_366405 ) ) ( not ( = ?auto_366404 ?auto_366406 ) ) ( not ( = ?auto_366405 ?auto_366406 ) ) ( ON ?auto_366404 ?auto_366405 ) ( ON ?auto_366403 ?auto_366404 ) ( ON ?auto_366402 ?auto_366403 ) ( ON ?auto_366401 ?auto_366402 ) ( CLEAR ?auto_366399 ) ( ON ?auto_366400 ?auto_366401 ) ( CLEAR ?auto_366400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_366399 ?auto_366400 )
      ( MAKE-7PILE ?auto_366399 ?auto_366400 ?auto_366401 ?auto_366402 ?auto_366403 ?auto_366404 ?auto_366405 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_366429 - BLOCK
      ?auto_366430 - BLOCK
      ?auto_366431 - BLOCK
      ?auto_366432 - BLOCK
      ?auto_366433 - BLOCK
      ?auto_366434 - BLOCK
      ?auto_366435 - BLOCK
    )
    :vars
    (
      ?auto_366436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366435 ?auto_366436 ) ( not ( = ?auto_366429 ?auto_366430 ) ) ( not ( = ?auto_366429 ?auto_366431 ) ) ( not ( = ?auto_366429 ?auto_366432 ) ) ( not ( = ?auto_366429 ?auto_366433 ) ) ( not ( = ?auto_366429 ?auto_366434 ) ) ( not ( = ?auto_366429 ?auto_366435 ) ) ( not ( = ?auto_366429 ?auto_366436 ) ) ( not ( = ?auto_366430 ?auto_366431 ) ) ( not ( = ?auto_366430 ?auto_366432 ) ) ( not ( = ?auto_366430 ?auto_366433 ) ) ( not ( = ?auto_366430 ?auto_366434 ) ) ( not ( = ?auto_366430 ?auto_366435 ) ) ( not ( = ?auto_366430 ?auto_366436 ) ) ( not ( = ?auto_366431 ?auto_366432 ) ) ( not ( = ?auto_366431 ?auto_366433 ) ) ( not ( = ?auto_366431 ?auto_366434 ) ) ( not ( = ?auto_366431 ?auto_366435 ) ) ( not ( = ?auto_366431 ?auto_366436 ) ) ( not ( = ?auto_366432 ?auto_366433 ) ) ( not ( = ?auto_366432 ?auto_366434 ) ) ( not ( = ?auto_366432 ?auto_366435 ) ) ( not ( = ?auto_366432 ?auto_366436 ) ) ( not ( = ?auto_366433 ?auto_366434 ) ) ( not ( = ?auto_366433 ?auto_366435 ) ) ( not ( = ?auto_366433 ?auto_366436 ) ) ( not ( = ?auto_366434 ?auto_366435 ) ) ( not ( = ?auto_366434 ?auto_366436 ) ) ( not ( = ?auto_366435 ?auto_366436 ) ) ( ON ?auto_366434 ?auto_366435 ) ( ON ?auto_366433 ?auto_366434 ) ( ON ?auto_366432 ?auto_366433 ) ( ON ?auto_366431 ?auto_366432 ) ( ON ?auto_366430 ?auto_366431 ) ( ON ?auto_366429 ?auto_366430 ) ( CLEAR ?auto_366429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_366429 )
      ( MAKE-7PILE ?auto_366429 ?auto_366430 ?auto_366431 ?auto_366432 ?auto_366433 ?auto_366434 ?auto_366435 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_366460 - BLOCK
      ?auto_366461 - BLOCK
      ?auto_366462 - BLOCK
      ?auto_366463 - BLOCK
      ?auto_366464 - BLOCK
      ?auto_366465 - BLOCK
      ?auto_366466 - BLOCK
      ?auto_366467 - BLOCK
    )
    :vars
    (
      ?auto_366468 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_366466 ) ( ON ?auto_366467 ?auto_366468 ) ( CLEAR ?auto_366467 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_366460 ) ( ON ?auto_366461 ?auto_366460 ) ( ON ?auto_366462 ?auto_366461 ) ( ON ?auto_366463 ?auto_366462 ) ( ON ?auto_366464 ?auto_366463 ) ( ON ?auto_366465 ?auto_366464 ) ( ON ?auto_366466 ?auto_366465 ) ( not ( = ?auto_366460 ?auto_366461 ) ) ( not ( = ?auto_366460 ?auto_366462 ) ) ( not ( = ?auto_366460 ?auto_366463 ) ) ( not ( = ?auto_366460 ?auto_366464 ) ) ( not ( = ?auto_366460 ?auto_366465 ) ) ( not ( = ?auto_366460 ?auto_366466 ) ) ( not ( = ?auto_366460 ?auto_366467 ) ) ( not ( = ?auto_366460 ?auto_366468 ) ) ( not ( = ?auto_366461 ?auto_366462 ) ) ( not ( = ?auto_366461 ?auto_366463 ) ) ( not ( = ?auto_366461 ?auto_366464 ) ) ( not ( = ?auto_366461 ?auto_366465 ) ) ( not ( = ?auto_366461 ?auto_366466 ) ) ( not ( = ?auto_366461 ?auto_366467 ) ) ( not ( = ?auto_366461 ?auto_366468 ) ) ( not ( = ?auto_366462 ?auto_366463 ) ) ( not ( = ?auto_366462 ?auto_366464 ) ) ( not ( = ?auto_366462 ?auto_366465 ) ) ( not ( = ?auto_366462 ?auto_366466 ) ) ( not ( = ?auto_366462 ?auto_366467 ) ) ( not ( = ?auto_366462 ?auto_366468 ) ) ( not ( = ?auto_366463 ?auto_366464 ) ) ( not ( = ?auto_366463 ?auto_366465 ) ) ( not ( = ?auto_366463 ?auto_366466 ) ) ( not ( = ?auto_366463 ?auto_366467 ) ) ( not ( = ?auto_366463 ?auto_366468 ) ) ( not ( = ?auto_366464 ?auto_366465 ) ) ( not ( = ?auto_366464 ?auto_366466 ) ) ( not ( = ?auto_366464 ?auto_366467 ) ) ( not ( = ?auto_366464 ?auto_366468 ) ) ( not ( = ?auto_366465 ?auto_366466 ) ) ( not ( = ?auto_366465 ?auto_366467 ) ) ( not ( = ?auto_366465 ?auto_366468 ) ) ( not ( = ?auto_366466 ?auto_366467 ) ) ( not ( = ?auto_366466 ?auto_366468 ) ) ( not ( = ?auto_366467 ?auto_366468 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_366467 ?auto_366468 )
      ( !STACK ?auto_366467 ?auto_366466 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_366494 - BLOCK
      ?auto_366495 - BLOCK
      ?auto_366496 - BLOCK
      ?auto_366497 - BLOCK
      ?auto_366498 - BLOCK
      ?auto_366499 - BLOCK
      ?auto_366500 - BLOCK
      ?auto_366501 - BLOCK
    )
    :vars
    (
      ?auto_366502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366501 ?auto_366502 ) ( ON-TABLE ?auto_366494 ) ( ON ?auto_366495 ?auto_366494 ) ( ON ?auto_366496 ?auto_366495 ) ( ON ?auto_366497 ?auto_366496 ) ( ON ?auto_366498 ?auto_366497 ) ( ON ?auto_366499 ?auto_366498 ) ( not ( = ?auto_366494 ?auto_366495 ) ) ( not ( = ?auto_366494 ?auto_366496 ) ) ( not ( = ?auto_366494 ?auto_366497 ) ) ( not ( = ?auto_366494 ?auto_366498 ) ) ( not ( = ?auto_366494 ?auto_366499 ) ) ( not ( = ?auto_366494 ?auto_366500 ) ) ( not ( = ?auto_366494 ?auto_366501 ) ) ( not ( = ?auto_366494 ?auto_366502 ) ) ( not ( = ?auto_366495 ?auto_366496 ) ) ( not ( = ?auto_366495 ?auto_366497 ) ) ( not ( = ?auto_366495 ?auto_366498 ) ) ( not ( = ?auto_366495 ?auto_366499 ) ) ( not ( = ?auto_366495 ?auto_366500 ) ) ( not ( = ?auto_366495 ?auto_366501 ) ) ( not ( = ?auto_366495 ?auto_366502 ) ) ( not ( = ?auto_366496 ?auto_366497 ) ) ( not ( = ?auto_366496 ?auto_366498 ) ) ( not ( = ?auto_366496 ?auto_366499 ) ) ( not ( = ?auto_366496 ?auto_366500 ) ) ( not ( = ?auto_366496 ?auto_366501 ) ) ( not ( = ?auto_366496 ?auto_366502 ) ) ( not ( = ?auto_366497 ?auto_366498 ) ) ( not ( = ?auto_366497 ?auto_366499 ) ) ( not ( = ?auto_366497 ?auto_366500 ) ) ( not ( = ?auto_366497 ?auto_366501 ) ) ( not ( = ?auto_366497 ?auto_366502 ) ) ( not ( = ?auto_366498 ?auto_366499 ) ) ( not ( = ?auto_366498 ?auto_366500 ) ) ( not ( = ?auto_366498 ?auto_366501 ) ) ( not ( = ?auto_366498 ?auto_366502 ) ) ( not ( = ?auto_366499 ?auto_366500 ) ) ( not ( = ?auto_366499 ?auto_366501 ) ) ( not ( = ?auto_366499 ?auto_366502 ) ) ( not ( = ?auto_366500 ?auto_366501 ) ) ( not ( = ?auto_366500 ?auto_366502 ) ) ( not ( = ?auto_366501 ?auto_366502 ) ) ( CLEAR ?auto_366499 ) ( ON ?auto_366500 ?auto_366501 ) ( CLEAR ?auto_366500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_366494 ?auto_366495 ?auto_366496 ?auto_366497 ?auto_366498 ?auto_366499 ?auto_366500 )
      ( MAKE-8PILE ?auto_366494 ?auto_366495 ?auto_366496 ?auto_366497 ?auto_366498 ?auto_366499 ?auto_366500 ?auto_366501 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_366528 - BLOCK
      ?auto_366529 - BLOCK
      ?auto_366530 - BLOCK
      ?auto_366531 - BLOCK
      ?auto_366532 - BLOCK
      ?auto_366533 - BLOCK
      ?auto_366534 - BLOCK
      ?auto_366535 - BLOCK
    )
    :vars
    (
      ?auto_366536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366535 ?auto_366536 ) ( ON-TABLE ?auto_366528 ) ( ON ?auto_366529 ?auto_366528 ) ( ON ?auto_366530 ?auto_366529 ) ( ON ?auto_366531 ?auto_366530 ) ( ON ?auto_366532 ?auto_366531 ) ( not ( = ?auto_366528 ?auto_366529 ) ) ( not ( = ?auto_366528 ?auto_366530 ) ) ( not ( = ?auto_366528 ?auto_366531 ) ) ( not ( = ?auto_366528 ?auto_366532 ) ) ( not ( = ?auto_366528 ?auto_366533 ) ) ( not ( = ?auto_366528 ?auto_366534 ) ) ( not ( = ?auto_366528 ?auto_366535 ) ) ( not ( = ?auto_366528 ?auto_366536 ) ) ( not ( = ?auto_366529 ?auto_366530 ) ) ( not ( = ?auto_366529 ?auto_366531 ) ) ( not ( = ?auto_366529 ?auto_366532 ) ) ( not ( = ?auto_366529 ?auto_366533 ) ) ( not ( = ?auto_366529 ?auto_366534 ) ) ( not ( = ?auto_366529 ?auto_366535 ) ) ( not ( = ?auto_366529 ?auto_366536 ) ) ( not ( = ?auto_366530 ?auto_366531 ) ) ( not ( = ?auto_366530 ?auto_366532 ) ) ( not ( = ?auto_366530 ?auto_366533 ) ) ( not ( = ?auto_366530 ?auto_366534 ) ) ( not ( = ?auto_366530 ?auto_366535 ) ) ( not ( = ?auto_366530 ?auto_366536 ) ) ( not ( = ?auto_366531 ?auto_366532 ) ) ( not ( = ?auto_366531 ?auto_366533 ) ) ( not ( = ?auto_366531 ?auto_366534 ) ) ( not ( = ?auto_366531 ?auto_366535 ) ) ( not ( = ?auto_366531 ?auto_366536 ) ) ( not ( = ?auto_366532 ?auto_366533 ) ) ( not ( = ?auto_366532 ?auto_366534 ) ) ( not ( = ?auto_366532 ?auto_366535 ) ) ( not ( = ?auto_366532 ?auto_366536 ) ) ( not ( = ?auto_366533 ?auto_366534 ) ) ( not ( = ?auto_366533 ?auto_366535 ) ) ( not ( = ?auto_366533 ?auto_366536 ) ) ( not ( = ?auto_366534 ?auto_366535 ) ) ( not ( = ?auto_366534 ?auto_366536 ) ) ( not ( = ?auto_366535 ?auto_366536 ) ) ( ON ?auto_366534 ?auto_366535 ) ( CLEAR ?auto_366532 ) ( ON ?auto_366533 ?auto_366534 ) ( CLEAR ?auto_366533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_366528 ?auto_366529 ?auto_366530 ?auto_366531 ?auto_366532 ?auto_366533 )
      ( MAKE-8PILE ?auto_366528 ?auto_366529 ?auto_366530 ?auto_366531 ?auto_366532 ?auto_366533 ?auto_366534 ?auto_366535 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_366562 - BLOCK
      ?auto_366563 - BLOCK
      ?auto_366564 - BLOCK
      ?auto_366565 - BLOCK
      ?auto_366566 - BLOCK
      ?auto_366567 - BLOCK
      ?auto_366568 - BLOCK
      ?auto_366569 - BLOCK
    )
    :vars
    (
      ?auto_366570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366569 ?auto_366570 ) ( ON-TABLE ?auto_366562 ) ( ON ?auto_366563 ?auto_366562 ) ( ON ?auto_366564 ?auto_366563 ) ( ON ?auto_366565 ?auto_366564 ) ( not ( = ?auto_366562 ?auto_366563 ) ) ( not ( = ?auto_366562 ?auto_366564 ) ) ( not ( = ?auto_366562 ?auto_366565 ) ) ( not ( = ?auto_366562 ?auto_366566 ) ) ( not ( = ?auto_366562 ?auto_366567 ) ) ( not ( = ?auto_366562 ?auto_366568 ) ) ( not ( = ?auto_366562 ?auto_366569 ) ) ( not ( = ?auto_366562 ?auto_366570 ) ) ( not ( = ?auto_366563 ?auto_366564 ) ) ( not ( = ?auto_366563 ?auto_366565 ) ) ( not ( = ?auto_366563 ?auto_366566 ) ) ( not ( = ?auto_366563 ?auto_366567 ) ) ( not ( = ?auto_366563 ?auto_366568 ) ) ( not ( = ?auto_366563 ?auto_366569 ) ) ( not ( = ?auto_366563 ?auto_366570 ) ) ( not ( = ?auto_366564 ?auto_366565 ) ) ( not ( = ?auto_366564 ?auto_366566 ) ) ( not ( = ?auto_366564 ?auto_366567 ) ) ( not ( = ?auto_366564 ?auto_366568 ) ) ( not ( = ?auto_366564 ?auto_366569 ) ) ( not ( = ?auto_366564 ?auto_366570 ) ) ( not ( = ?auto_366565 ?auto_366566 ) ) ( not ( = ?auto_366565 ?auto_366567 ) ) ( not ( = ?auto_366565 ?auto_366568 ) ) ( not ( = ?auto_366565 ?auto_366569 ) ) ( not ( = ?auto_366565 ?auto_366570 ) ) ( not ( = ?auto_366566 ?auto_366567 ) ) ( not ( = ?auto_366566 ?auto_366568 ) ) ( not ( = ?auto_366566 ?auto_366569 ) ) ( not ( = ?auto_366566 ?auto_366570 ) ) ( not ( = ?auto_366567 ?auto_366568 ) ) ( not ( = ?auto_366567 ?auto_366569 ) ) ( not ( = ?auto_366567 ?auto_366570 ) ) ( not ( = ?auto_366568 ?auto_366569 ) ) ( not ( = ?auto_366568 ?auto_366570 ) ) ( not ( = ?auto_366569 ?auto_366570 ) ) ( ON ?auto_366568 ?auto_366569 ) ( ON ?auto_366567 ?auto_366568 ) ( CLEAR ?auto_366565 ) ( ON ?auto_366566 ?auto_366567 ) ( CLEAR ?auto_366566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_366562 ?auto_366563 ?auto_366564 ?auto_366565 ?auto_366566 )
      ( MAKE-8PILE ?auto_366562 ?auto_366563 ?auto_366564 ?auto_366565 ?auto_366566 ?auto_366567 ?auto_366568 ?auto_366569 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_366596 - BLOCK
      ?auto_366597 - BLOCK
      ?auto_366598 - BLOCK
      ?auto_366599 - BLOCK
      ?auto_366600 - BLOCK
      ?auto_366601 - BLOCK
      ?auto_366602 - BLOCK
      ?auto_366603 - BLOCK
    )
    :vars
    (
      ?auto_366604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366603 ?auto_366604 ) ( ON-TABLE ?auto_366596 ) ( ON ?auto_366597 ?auto_366596 ) ( ON ?auto_366598 ?auto_366597 ) ( not ( = ?auto_366596 ?auto_366597 ) ) ( not ( = ?auto_366596 ?auto_366598 ) ) ( not ( = ?auto_366596 ?auto_366599 ) ) ( not ( = ?auto_366596 ?auto_366600 ) ) ( not ( = ?auto_366596 ?auto_366601 ) ) ( not ( = ?auto_366596 ?auto_366602 ) ) ( not ( = ?auto_366596 ?auto_366603 ) ) ( not ( = ?auto_366596 ?auto_366604 ) ) ( not ( = ?auto_366597 ?auto_366598 ) ) ( not ( = ?auto_366597 ?auto_366599 ) ) ( not ( = ?auto_366597 ?auto_366600 ) ) ( not ( = ?auto_366597 ?auto_366601 ) ) ( not ( = ?auto_366597 ?auto_366602 ) ) ( not ( = ?auto_366597 ?auto_366603 ) ) ( not ( = ?auto_366597 ?auto_366604 ) ) ( not ( = ?auto_366598 ?auto_366599 ) ) ( not ( = ?auto_366598 ?auto_366600 ) ) ( not ( = ?auto_366598 ?auto_366601 ) ) ( not ( = ?auto_366598 ?auto_366602 ) ) ( not ( = ?auto_366598 ?auto_366603 ) ) ( not ( = ?auto_366598 ?auto_366604 ) ) ( not ( = ?auto_366599 ?auto_366600 ) ) ( not ( = ?auto_366599 ?auto_366601 ) ) ( not ( = ?auto_366599 ?auto_366602 ) ) ( not ( = ?auto_366599 ?auto_366603 ) ) ( not ( = ?auto_366599 ?auto_366604 ) ) ( not ( = ?auto_366600 ?auto_366601 ) ) ( not ( = ?auto_366600 ?auto_366602 ) ) ( not ( = ?auto_366600 ?auto_366603 ) ) ( not ( = ?auto_366600 ?auto_366604 ) ) ( not ( = ?auto_366601 ?auto_366602 ) ) ( not ( = ?auto_366601 ?auto_366603 ) ) ( not ( = ?auto_366601 ?auto_366604 ) ) ( not ( = ?auto_366602 ?auto_366603 ) ) ( not ( = ?auto_366602 ?auto_366604 ) ) ( not ( = ?auto_366603 ?auto_366604 ) ) ( ON ?auto_366602 ?auto_366603 ) ( ON ?auto_366601 ?auto_366602 ) ( ON ?auto_366600 ?auto_366601 ) ( CLEAR ?auto_366598 ) ( ON ?auto_366599 ?auto_366600 ) ( CLEAR ?auto_366599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_366596 ?auto_366597 ?auto_366598 ?auto_366599 )
      ( MAKE-8PILE ?auto_366596 ?auto_366597 ?auto_366598 ?auto_366599 ?auto_366600 ?auto_366601 ?auto_366602 ?auto_366603 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_366630 - BLOCK
      ?auto_366631 - BLOCK
      ?auto_366632 - BLOCK
      ?auto_366633 - BLOCK
      ?auto_366634 - BLOCK
      ?auto_366635 - BLOCK
      ?auto_366636 - BLOCK
      ?auto_366637 - BLOCK
    )
    :vars
    (
      ?auto_366638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366637 ?auto_366638 ) ( ON-TABLE ?auto_366630 ) ( ON ?auto_366631 ?auto_366630 ) ( not ( = ?auto_366630 ?auto_366631 ) ) ( not ( = ?auto_366630 ?auto_366632 ) ) ( not ( = ?auto_366630 ?auto_366633 ) ) ( not ( = ?auto_366630 ?auto_366634 ) ) ( not ( = ?auto_366630 ?auto_366635 ) ) ( not ( = ?auto_366630 ?auto_366636 ) ) ( not ( = ?auto_366630 ?auto_366637 ) ) ( not ( = ?auto_366630 ?auto_366638 ) ) ( not ( = ?auto_366631 ?auto_366632 ) ) ( not ( = ?auto_366631 ?auto_366633 ) ) ( not ( = ?auto_366631 ?auto_366634 ) ) ( not ( = ?auto_366631 ?auto_366635 ) ) ( not ( = ?auto_366631 ?auto_366636 ) ) ( not ( = ?auto_366631 ?auto_366637 ) ) ( not ( = ?auto_366631 ?auto_366638 ) ) ( not ( = ?auto_366632 ?auto_366633 ) ) ( not ( = ?auto_366632 ?auto_366634 ) ) ( not ( = ?auto_366632 ?auto_366635 ) ) ( not ( = ?auto_366632 ?auto_366636 ) ) ( not ( = ?auto_366632 ?auto_366637 ) ) ( not ( = ?auto_366632 ?auto_366638 ) ) ( not ( = ?auto_366633 ?auto_366634 ) ) ( not ( = ?auto_366633 ?auto_366635 ) ) ( not ( = ?auto_366633 ?auto_366636 ) ) ( not ( = ?auto_366633 ?auto_366637 ) ) ( not ( = ?auto_366633 ?auto_366638 ) ) ( not ( = ?auto_366634 ?auto_366635 ) ) ( not ( = ?auto_366634 ?auto_366636 ) ) ( not ( = ?auto_366634 ?auto_366637 ) ) ( not ( = ?auto_366634 ?auto_366638 ) ) ( not ( = ?auto_366635 ?auto_366636 ) ) ( not ( = ?auto_366635 ?auto_366637 ) ) ( not ( = ?auto_366635 ?auto_366638 ) ) ( not ( = ?auto_366636 ?auto_366637 ) ) ( not ( = ?auto_366636 ?auto_366638 ) ) ( not ( = ?auto_366637 ?auto_366638 ) ) ( ON ?auto_366636 ?auto_366637 ) ( ON ?auto_366635 ?auto_366636 ) ( ON ?auto_366634 ?auto_366635 ) ( ON ?auto_366633 ?auto_366634 ) ( CLEAR ?auto_366631 ) ( ON ?auto_366632 ?auto_366633 ) ( CLEAR ?auto_366632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_366630 ?auto_366631 ?auto_366632 )
      ( MAKE-8PILE ?auto_366630 ?auto_366631 ?auto_366632 ?auto_366633 ?auto_366634 ?auto_366635 ?auto_366636 ?auto_366637 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_366664 - BLOCK
      ?auto_366665 - BLOCK
      ?auto_366666 - BLOCK
      ?auto_366667 - BLOCK
      ?auto_366668 - BLOCK
      ?auto_366669 - BLOCK
      ?auto_366670 - BLOCK
      ?auto_366671 - BLOCK
    )
    :vars
    (
      ?auto_366672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366671 ?auto_366672 ) ( ON-TABLE ?auto_366664 ) ( not ( = ?auto_366664 ?auto_366665 ) ) ( not ( = ?auto_366664 ?auto_366666 ) ) ( not ( = ?auto_366664 ?auto_366667 ) ) ( not ( = ?auto_366664 ?auto_366668 ) ) ( not ( = ?auto_366664 ?auto_366669 ) ) ( not ( = ?auto_366664 ?auto_366670 ) ) ( not ( = ?auto_366664 ?auto_366671 ) ) ( not ( = ?auto_366664 ?auto_366672 ) ) ( not ( = ?auto_366665 ?auto_366666 ) ) ( not ( = ?auto_366665 ?auto_366667 ) ) ( not ( = ?auto_366665 ?auto_366668 ) ) ( not ( = ?auto_366665 ?auto_366669 ) ) ( not ( = ?auto_366665 ?auto_366670 ) ) ( not ( = ?auto_366665 ?auto_366671 ) ) ( not ( = ?auto_366665 ?auto_366672 ) ) ( not ( = ?auto_366666 ?auto_366667 ) ) ( not ( = ?auto_366666 ?auto_366668 ) ) ( not ( = ?auto_366666 ?auto_366669 ) ) ( not ( = ?auto_366666 ?auto_366670 ) ) ( not ( = ?auto_366666 ?auto_366671 ) ) ( not ( = ?auto_366666 ?auto_366672 ) ) ( not ( = ?auto_366667 ?auto_366668 ) ) ( not ( = ?auto_366667 ?auto_366669 ) ) ( not ( = ?auto_366667 ?auto_366670 ) ) ( not ( = ?auto_366667 ?auto_366671 ) ) ( not ( = ?auto_366667 ?auto_366672 ) ) ( not ( = ?auto_366668 ?auto_366669 ) ) ( not ( = ?auto_366668 ?auto_366670 ) ) ( not ( = ?auto_366668 ?auto_366671 ) ) ( not ( = ?auto_366668 ?auto_366672 ) ) ( not ( = ?auto_366669 ?auto_366670 ) ) ( not ( = ?auto_366669 ?auto_366671 ) ) ( not ( = ?auto_366669 ?auto_366672 ) ) ( not ( = ?auto_366670 ?auto_366671 ) ) ( not ( = ?auto_366670 ?auto_366672 ) ) ( not ( = ?auto_366671 ?auto_366672 ) ) ( ON ?auto_366670 ?auto_366671 ) ( ON ?auto_366669 ?auto_366670 ) ( ON ?auto_366668 ?auto_366669 ) ( ON ?auto_366667 ?auto_366668 ) ( ON ?auto_366666 ?auto_366667 ) ( CLEAR ?auto_366664 ) ( ON ?auto_366665 ?auto_366666 ) ( CLEAR ?auto_366665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_366664 ?auto_366665 )
      ( MAKE-8PILE ?auto_366664 ?auto_366665 ?auto_366666 ?auto_366667 ?auto_366668 ?auto_366669 ?auto_366670 ?auto_366671 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_366698 - BLOCK
      ?auto_366699 - BLOCK
      ?auto_366700 - BLOCK
      ?auto_366701 - BLOCK
      ?auto_366702 - BLOCK
      ?auto_366703 - BLOCK
      ?auto_366704 - BLOCK
      ?auto_366705 - BLOCK
    )
    :vars
    (
      ?auto_366706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366705 ?auto_366706 ) ( not ( = ?auto_366698 ?auto_366699 ) ) ( not ( = ?auto_366698 ?auto_366700 ) ) ( not ( = ?auto_366698 ?auto_366701 ) ) ( not ( = ?auto_366698 ?auto_366702 ) ) ( not ( = ?auto_366698 ?auto_366703 ) ) ( not ( = ?auto_366698 ?auto_366704 ) ) ( not ( = ?auto_366698 ?auto_366705 ) ) ( not ( = ?auto_366698 ?auto_366706 ) ) ( not ( = ?auto_366699 ?auto_366700 ) ) ( not ( = ?auto_366699 ?auto_366701 ) ) ( not ( = ?auto_366699 ?auto_366702 ) ) ( not ( = ?auto_366699 ?auto_366703 ) ) ( not ( = ?auto_366699 ?auto_366704 ) ) ( not ( = ?auto_366699 ?auto_366705 ) ) ( not ( = ?auto_366699 ?auto_366706 ) ) ( not ( = ?auto_366700 ?auto_366701 ) ) ( not ( = ?auto_366700 ?auto_366702 ) ) ( not ( = ?auto_366700 ?auto_366703 ) ) ( not ( = ?auto_366700 ?auto_366704 ) ) ( not ( = ?auto_366700 ?auto_366705 ) ) ( not ( = ?auto_366700 ?auto_366706 ) ) ( not ( = ?auto_366701 ?auto_366702 ) ) ( not ( = ?auto_366701 ?auto_366703 ) ) ( not ( = ?auto_366701 ?auto_366704 ) ) ( not ( = ?auto_366701 ?auto_366705 ) ) ( not ( = ?auto_366701 ?auto_366706 ) ) ( not ( = ?auto_366702 ?auto_366703 ) ) ( not ( = ?auto_366702 ?auto_366704 ) ) ( not ( = ?auto_366702 ?auto_366705 ) ) ( not ( = ?auto_366702 ?auto_366706 ) ) ( not ( = ?auto_366703 ?auto_366704 ) ) ( not ( = ?auto_366703 ?auto_366705 ) ) ( not ( = ?auto_366703 ?auto_366706 ) ) ( not ( = ?auto_366704 ?auto_366705 ) ) ( not ( = ?auto_366704 ?auto_366706 ) ) ( not ( = ?auto_366705 ?auto_366706 ) ) ( ON ?auto_366704 ?auto_366705 ) ( ON ?auto_366703 ?auto_366704 ) ( ON ?auto_366702 ?auto_366703 ) ( ON ?auto_366701 ?auto_366702 ) ( ON ?auto_366700 ?auto_366701 ) ( ON ?auto_366699 ?auto_366700 ) ( ON ?auto_366698 ?auto_366699 ) ( CLEAR ?auto_366698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_366698 )
      ( MAKE-8PILE ?auto_366698 ?auto_366699 ?auto_366700 ?auto_366701 ?auto_366702 ?auto_366703 ?auto_366704 ?auto_366705 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_366733 - BLOCK
      ?auto_366734 - BLOCK
      ?auto_366735 - BLOCK
      ?auto_366736 - BLOCK
      ?auto_366737 - BLOCK
      ?auto_366738 - BLOCK
      ?auto_366739 - BLOCK
      ?auto_366740 - BLOCK
      ?auto_366741 - BLOCK
    )
    :vars
    (
      ?auto_366742 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_366740 ) ( ON ?auto_366741 ?auto_366742 ) ( CLEAR ?auto_366741 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_366733 ) ( ON ?auto_366734 ?auto_366733 ) ( ON ?auto_366735 ?auto_366734 ) ( ON ?auto_366736 ?auto_366735 ) ( ON ?auto_366737 ?auto_366736 ) ( ON ?auto_366738 ?auto_366737 ) ( ON ?auto_366739 ?auto_366738 ) ( ON ?auto_366740 ?auto_366739 ) ( not ( = ?auto_366733 ?auto_366734 ) ) ( not ( = ?auto_366733 ?auto_366735 ) ) ( not ( = ?auto_366733 ?auto_366736 ) ) ( not ( = ?auto_366733 ?auto_366737 ) ) ( not ( = ?auto_366733 ?auto_366738 ) ) ( not ( = ?auto_366733 ?auto_366739 ) ) ( not ( = ?auto_366733 ?auto_366740 ) ) ( not ( = ?auto_366733 ?auto_366741 ) ) ( not ( = ?auto_366733 ?auto_366742 ) ) ( not ( = ?auto_366734 ?auto_366735 ) ) ( not ( = ?auto_366734 ?auto_366736 ) ) ( not ( = ?auto_366734 ?auto_366737 ) ) ( not ( = ?auto_366734 ?auto_366738 ) ) ( not ( = ?auto_366734 ?auto_366739 ) ) ( not ( = ?auto_366734 ?auto_366740 ) ) ( not ( = ?auto_366734 ?auto_366741 ) ) ( not ( = ?auto_366734 ?auto_366742 ) ) ( not ( = ?auto_366735 ?auto_366736 ) ) ( not ( = ?auto_366735 ?auto_366737 ) ) ( not ( = ?auto_366735 ?auto_366738 ) ) ( not ( = ?auto_366735 ?auto_366739 ) ) ( not ( = ?auto_366735 ?auto_366740 ) ) ( not ( = ?auto_366735 ?auto_366741 ) ) ( not ( = ?auto_366735 ?auto_366742 ) ) ( not ( = ?auto_366736 ?auto_366737 ) ) ( not ( = ?auto_366736 ?auto_366738 ) ) ( not ( = ?auto_366736 ?auto_366739 ) ) ( not ( = ?auto_366736 ?auto_366740 ) ) ( not ( = ?auto_366736 ?auto_366741 ) ) ( not ( = ?auto_366736 ?auto_366742 ) ) ( not ( = ?auto_366737 ?auto_366738 ) ) ( not ( = ?auto_366737 ?auto_366739 ) ) ( not ( = ?auto_366737 ?auto_366740 ) ) ( not ( = ?auto_366737 ?auto_366741 ) ) ( not ( = ?auto_366737 ?auto_366742 ) ) ( not ( = ?auto_366738 ?auto_366739 ) ) ( not ( = ?auto_366738 ?auto_366740 ) ) ( not ( = ?auto_366738 ?auto_366741 ) ) ( not ( = ?auto_366738 ?auto_366742 ) ) ( not ( = ?auto_366739 ?auto_366740 ) ) ( not ( = ?auto_366739 ?auto_366741 ) ) ( not ( = ?auto_366739 ?auto_366742 ) ) ( not ( = ?auto_366740 ?auto_366741 ) ) ( not ( = ?auto_366740 ?auto_366742 ) ) ( not ( = ?auto_366741 ?auto_366742 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_366741 ?auto_366742 )
      ( !STACK ?auto_366741 ?auto_366740 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_366771 - BLOCK
      ?auto_366772 - BLOCK
      ?auto_366773 - BLOCK
      ?auto_366774 - BLOCK
      ?auto_366775 - BLOCK
      ?auto_366776 - BLOCK
      ?auto_366777 - BLOCK
      ?auto_366778 - BLOCK
      ?auto_366779 - BLOCK
    )
    :vars
    (
      ?auto_366780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366779 ?auto_366780 ) ( ON-TABLE ?auto_366771 ) ( ON ?auto_366772 ?auto_366771 ) ( ON ?auto_366773 ?auto_366772 ) ( ON ?auto_366774 ?auto_366773 ) ( ON ?auto_366775 ?auto_366774 ) ( ON ?auto_366776 ?auto_366775 ) ( ON ?auto_366777 ?auto_366776 ) ( not ( = ?auto_366771 ?auto_366772 ) ) ( not ( = ?auto_366771 ?auto_366773 ) ) ( not ( = ?auto_366771 ?auto_366774 ) ) ( not ( = ?auto_366771 ?auto_366775 ) ) ( not ( = ?auto_366771 ?auto_366776 ) ) ( not ( = ?auto_366771 ?auto_366777 ) ) ( not ( = ?auto_366771 ?auto_366778 ) ) ( not ( = ?auto_366771 ?auto_366779 ) ) ( not ( = ?auto_366771 ?auto_366780 ) ) ( not ( = ?auto_366772 ?auto_366773 ) ) ( not ( = ?auto_366772 ?auto_366774 ) ) ( not ( = ?auto_366772 ?auto_366775 ) ) ( not ( = ?auto_366772 ?auto_366776 ) ) ( not ( = ?auto_366772 ?auto_366777 ) ) ( not ( = ?auto_366772 ?auto_366778 ) ) ( not ( = ?auto_366772 ?auto_366779 ) ) ( not ( = ?auto_366772 ?auto_366780 ) ) ( not ( = ?auto_366773 ?auto_366774 ) ) ( not ( = ?auto_366773 ?auto_366775 ) ) ( not ( = ?auto_366773 ?auto_366776 ) ) ( not ( = ?auto_366773 ?auto_366777 ) ) ( not ( = ?auto_366773 ?auto_366778 ) ) ( not ( = ?auto_366773 ?auto_366779 ) ) ( not ( = ?auto_366773 ?auto_366780 ) ) ( not ( = ?auto_366774 ?auto_366775 ) ) ( not ( = ?auto_366774 ?auto_366776 ) ) ( not ( = ?auto_366774 ?auto_366777 ) ) ( not ( = ?auto_366774 ?auto_366778 ) ) ( not ( = ?auto_366774 ?auto_366779 ) ) ( not ( = ?auto_366774 ?auto_366780 ) ) ( not ( = ?auto_366775 ?auto_366776 ) ) ( not ( = ?auto_366775 ?auto_366777 ) ) ( not ( = ?auto_366775 ?auto_366778 ) ) ( not ( = ?auto_366775 ?auto_366779 ) ) ( not ( = ?auto_366775 ?auto_366780 ) ) ( not ( = ?auto_366776 ?auto_366777 ) ) ( not ( = ?auto_366776 ?auto_366778 ) ) ( not ( = ?auto_366776 ?auto_366779 ) ) ( not ( = ?auto_366776 ?auto_366780 ) ) ( not ( = ?auto_366777 ?auto_366778 ) ) ( not ( = ?auto_366777 ?auto_366779 ) ) ( not ( = ?auto_366777 ?auto_366780 ) ) ( not ( = ?auto_366778 ?auto_366779 ) ) ( not ( = ?auto_366778 ?auto_366780 ) ) ( not ( = ?auto_366779 ?auto_366780 ) ) ( CLEAR ?auto_366777 ) ( ON ?auto_366778 ?auto_366779 ) ( CLEAR ?auto_366778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_366771 ?auto_366772 ?auto_366773 ?auto_366774 ?auto_366775 ?auto_366776 ?auto_366777 ?auto_366778 )
      ( MAKE-9PILE ?auto_366771 ?auto_366772 ?auto_366773 ?auto_366774 ?auto_366775 ?auto_366776 ?auto_366777 ?auto_366778 ?auto_366779 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_366809 - BLOCK
      ?auto_366810 - BLOCK
      ?auto_366811 - BLOCK
      ?auto_366812 - BLOCK
      ?auto_366813 - BLOCK
      ?auto_366814 - BLOCK
      ?auto_366815 - BLOCK
      ?auto_366816 - BLOCK
      ?auto_366817 - BLOCK
    )
    :vars
    (
      ?auto_366818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366817 ?auto_366818 ) ( ON-TABLE ?auto_366809 ) ( ON ?auto_366810 ?auto_366809 ) ( ON ?auto_366811 ?auto_366810 ) ( ON ?auto_366812 ?auto_366811 ) ( ON ?auto_366813 ?auto_366812 ) ( ON ?auto_366814 ?auto_366813 ) ( not ( = ?auto_366809 ?auto_366810 ) ) ( not ( = ?auto_366809 ?auto_366811 ) ) ( not ( = ?auto_366809 ?auto_366812 ) ) ( not ( = ?auto_366809 ?auto_366813 ) ) ( not ( = ?auto_366809 ?auto_366814 ) ) ( not ( = ?auto_366809 ?auto_366815 ) ) ( not ( = ?auto_366809 ?auto_366816 ) ) ( not ( = ?auto_366809 ?auto_366817 ) ) ( not ( = ?auto_366809 ?auto_366818 ) ) ( not ( = ?auto_366810 ?auto_366811 ) ) ( not ( = ?auto_366810 ?auto_366812 ) ) ( not ( = ?auto_366810 ?auto_366813 ) ) ( not ( = ?auto_366810 ?auto_366814 ) ) ( not ( = ?auto_366810 ?auto_366815 ) ) ( not ( = ?auto_366810 ?auto_366816 ) ) ( not ( = ?auto_366810 ?auto_366817 ) ) ( not ( = ?auto_366810 ?auto_366818 ) ) ( not ( = ?auto_366811 ?auto_366812 ) ) ( not ( = ?auto_366811 ?auto_366813 ) ) ( not ( = ?auto_366811 ?auto_366814 ) ) ( not ( = ?auto_366811 ?auto_366815 ) ) ( not ( = ?auto_366811 ?auto_366816 ) ) ( not ( = ?auto_366811 ?auto_366817 ) ) ( not ( = ?auto_366811 ?auto_366818 ) ) ( not ( = ?auto_366812 ?auto_366813 ) ) ( not ( = ?auto_366812 ?auto_366814 ) ) ( not ( = ?auto_366812 ?auto_366815 ) ) ( not ( = ?auto_366812 ?auto_366816 ) ) ( not ( = ?auto_366812 ?auto_366817 ) ) ( not ( = ?auto_366812 ?auto_366818 ) ) ( not ( = ?auto_366813 ?auto_366814 ) ) ( not ( = ?auto_366813 ?auto_366815 ) ) ( not ( = ?auto_366813 ?auto_366816 ) ) ( not ( = ?auto_366813 ?auto_366817 ) ) ( not ( = ?auto_366813 ?auto_366818 ) ) ( not ( = ?auto_366814 ?auto_366815 ) ) ( not ( = ?auto_366814 ?auto_366816 ) ) ( not ( = ?auto_366814 ?auto_366817 ) ) ( not ( = ?auto_366814 ?auto_366818 ) ) ( not ( = ?auto_366815 ?auto_366816 ) ) ( not ( = ?auto_366815 ?auto_366817 ) ) ( not ( = ?auto_366815 ?auto_366818 ) ) ( not ( = ?auto_366816 ?auto_366817 ) ) ( not ( = ?auto_366816 ?auto_366818 ) ) ( not ( = ?auto_366817 ?auto_366818 ) ) ( ON ?auto_366816 ?auto_366817 ) ( CLEAR ?auto_366814 ) ( ON ?auto_366815 ?auto_366816 ) ( CLEAR ?auto_366815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_366809 ?auto_366810 ?auto_366811 ?auto_366812 ?auto_366813 ?auto_366814 ?auto_366815 )
      ( MAKE-9PILE ?auto_366809 ?auto_366810 ?auto_366811 ?auto_366812 ?auto_366813 ?auto_366814 ?auto_366815 ?auto_366816 ?auto_366817 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_366847 - BLOCK
      ?auto_366848 - BLOCK
      ?auto_366849 - BLOCK
      ?auto_366850 - BLOCK
      ?auto_366851 - BLOCK
      ?auto_366852 - BLOCK
      ?auto_366853 - BLOCK
      ?auto_366854 - BLOCK
      ?auto_366855 - BLOCK
    )
    :vars
    (
      ?auto_366856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366855 ?auto_366856 ) ( ON-TABLE ?auto_366847 ) ( ON ?auto_366848 ?auto_366847 ) ( ON ?auto_366849 ?auto_366848 ) ( ON ?auto_366850 ?auto_366849 ) ( ON ?auto_366851 ?auto_366850 ) ( not ( = ?auto_366847 ?auto_366848 ) ) ( not ( = ?auto_366847 ?auto_366849 ) ) ( not ( = ?auto_366847 ?auto_366850 ) ) ( not ( = ?auto_366847 ?auto_366851 ) ) ( not ( = ?auto_366847 ?auto_366852 ) ) ( not ( = ?auto_366847 ?auto_366853 ) ) ( not ( = ?auto_366847 ?auto_366854 ) ) ( not ( = ?auto_366847 ?auto_366855 ) ) ( not ( = ?auto_366847 ?auto_366856 ) ) ( not ( = ?auto_366848 ?auto_366849 ) ) ( not ( = ?auto_366848 ?auto_366850 ) ) ( not ( = ?auto_366848 ?auto_366851 ) ) ( not ( = ?auto_366848 ?auto_366852 ) ) ( not ( = ?auto_366848 ?auto_366853 ) ) ( not ( = ?auto_366848 ?auto_366854 ) ) ( not ( = ?auto_366848 ?auto_366855 ) ) ( not ( = ?auto_366848 ?auto_366856 ) ) ( not ( = ?auto_366849 ?auto_366850 ) ) ( not ( = ?auto_366849 ?auto_366851 ) ) ( not ( = ?auto_366849 ?auto_366852 ) ) ( not ( = ?auto_366849 ?auto_366853 ) ) ( not ( = ?auto_366849 ?auto_366854 ) ) ( not ( = ?auto_366849 ?auto_366855 ) ) ( not ( = ?auto_366849 ?auto_366856 ) ) ( not ( = ?auto_366850 ?auto_366851 ) ) ( not ( = ?auto_366850 ?auto_366852 ) ) ( not ( = ?auto_366850 ?auto_366853 ) ) ( not ( = ?auto_366850 ?auto_366854 ) ) ( not ( = ?auto_366850 ?auto_366855 ) ) ( not ( = ?auto_366850 ?auto_366856 ) ) ( not ( = ?auto_366851 ?auto_366852 ) ) ( not ( = ?auto_366851 ?auto_366853 ) ) ( not ( = ?auto_366851 ?auto_366854 ) ) ( not ( = ?auto_366851 ?auto_366855 ) ) ( not ( = ?auto_366851 ?auto_366856 ) ) ( not ( = ?auto_366852 ?auto_366853 ) ) ( not ( = ?auto_366852 ?auto_366854 ) ) ( not ( = ?auto_366852 ?auto_366855 ) ) ( not ( = ?auto_366852 ?auto_366856 ) ) ( not ( = ?auto_366853 ?auto_366854 ) ) ( not ( = ?auto_366853 ?auto_366855 ) ) ( not ( = ?auto_366853 ?auto_366856 ) ) ( not ( = ?auto_366854 ?auto_366855 ) ) ( not ( = ?auto_366854 ?auto_366856 ) ) ( not ( = ?auto_366855 ?auto_366856 ) ) ( ON ?auto_366854 ?auto_366855 ) ( ON ?auto_366853 ?auto_366854 ) ( CLEAR ?auto_366851 ) ( ON ?auto_366852 ?auto_366853 ) ( CLEAR ?auto_366852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_366847 ?auto_366848 ?auto_366849 ?auto_366850 ?auto_366851 ?auto_366852 )
      ( MAKE-9PILE ?auto_366847 ?auto_366848 ?auto_366849 ?auto_366850 ?auto_366851 ?auto_366852 ?auto_366853 ?auto_366854 ?auto_366855 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_366885 - BLOCK
      ?auto_366886 - BLOCK
      ?auto_366887 - BLOCK
      ?auto_366888 - BLOCK
      ?auto_366889 - BLOCK
      ?auto_366890 - BLOCK
      ?auto_366891 - BLOCK
      ?auto_366892 - BLOCK
      ?auto_366893 - BLOCK
    )
    :vars
    (
      ?auto_366894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366893 ?auto_366894 ) ( ON-TABLE ?auto_366885 ) ( ON ?auto_366886 ?auto_366885 ) ( ON ?auto_366887 ?auto_366886 ) ( ON ?auto_366888 ?auto_366887 ) ( not ( = ?auto_366885 ?auto_366886 ) ) ( not ( = ?auto_366885 ?auto_366887 ) ) ( not ( = ?auto_366885 ?auto_366888 ) ) ( not ( = ?auto_366885 ?auto_366889 ) ) ( not ( = ?auto_366885 ?auto_366890 ) ) ( not ( = ?auto_366885 ?auto_366891 ) ) ( not ( = ?auto_366885 ?auto_366892 ) ) ( not ( = ?auto_366885 ?auto_366893 ) ) ( not ( = ?auto_366885 ?auto_366894 ) ) ( not ( = ?auto_366886 ?auto_366887 ) ) ( not ( = ?auto_366886 ?auto_366888 ) ) ( not ( = ?auto_366886 ?auto_366889 ) ) ( not ( = ?auto_366886 ?auto_366890 ) ) ( not ( = ?auto_366886 ?auto_366891 ) ) ( not ( = ?auto_366886 ?auto_366892 ) ) ( not ( = ?auto_366886 ?auto_366893 ) ) ( not ( = ?auto_366886 ?auto_366894 ) ) ( not ( = ?auto_366887 ?auto_366888 ) ) ( not ( = ?auto_366887 ?auto_366889 ) ) ( not ( = ?auto_366887 ?auto_366890 ) ) ( not ( = ?auto_366887 ?auto_366891 ) ) ( not ( = ?auto_366887 ?auto_366892 ) ) ( not ( = ?auto_366887 ?auto_366893 ) ) ( not ( = ?auto_366887 ?auto_366894 ) ) ( not ( = ?auto_366888 ?auto_366889 ) ) ( not ( = ?auto_366888 ?auto_366890 ) ) ( not ( = ?auto_366888 ?auto_366891 ) ) ( not ( = ?auto_366888 ?auto_366892 ) ) ( not ( = ?auto_366888 ?auto_366893 ) ) ( not ( = ?auto_366888 ?auto_366894 ) ) ( not ( = ?auto_366889 ?auto_366890 ) ) ( not ( = ?auto_366889 ?auto_366891 ) ) ( not ( = ?auto_366889 ?auto_366892 ) ) ( not ( = ?auto_366889 ?auto_366893 ) ) ( not ( = ?auto_366889 ?auto_366894 ) ) ( not ( = ?auto_366890 ?auto_366891 ) ) ( not ( = ?auto_366890 ?auto_366892 ) ) ( not ( = ?auto_366890 ?auto_366893 ) ) ( not ( = ?auto_366890 ?auto_366894 ) ) ( not ( = ?auto_366891 ?auto_366892 ) ) ( not ( = ?auto_366891 ?auto_366893 ) ) ( not ( = ?auto_366891 ?auto_366894 ) ) ( not ( = ?auto_366892 ?auto_366893 ) ) ( not ( = ?auto_366892 ?auto_366894 ) ) ( not ( = ?auto_366893 ?auto_366894 ) ) ( ON ?auto_366892 ?auto_366893 ) ( ON ?auto_366891 ?auto_366892 ) ( ON ?auto_366890 ?auto_366891 ) ( CLEAR ?auto_366888 ) ( ON ?auto_366889 ?auto_366890 ) ( CLEAR ?auto_366889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_366885 ?auto_366886 ?auto_366887 ?auto_366888 ?auto_366889 )
      ( MAKE-9PILE ?auto_366885 ?auto_366886 ?auto_366887 ?auto_366888 ?auto_366889 ?auto_366890 ?auto_366891 ?auto_366892 ?auto_366893 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_366923 - BLOCK
      ?auto_366924 - BLOCK
      ?auto_366925 - BLOCK
      ?auto_366926 - BLOCK
      ?auto_366927 - BLOCK
      ?auto_366928 - BLOCK
      ?auto_366929 - BLOCK
      ?auto_366930 - BLOCK
      ?auto_366931 - BLOCK
    )
    :vars
    (
      ?auto_366932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366931 ?auto_366932 ) ( ON-TABLE ?auto_366923 ) ( ON ?auto_366924 ?auto_366923 ) ( ON ?auto_366925 ?auto_366924 ) ( not ( = ?auto_366923 ?auto_366924 ) ) ( not ( = ?auto_366923 ?auto_366925 ) ) ( not ( = ?auto_366923 ?auto_366926 ) ) ( not ( = ?auto_366923 ?auto_366927 ) ) ( not ( = ?auto_366923 ?auto_366928 ) ) ( not ( = ?auto_366923 ?auto_366929 ) ) ( not ( = ?auto_366923 ?auto_366930 ) ) ( not ( = ?auto_366923 ?auto_366931 ) ) ( not ( = ?auto_366923 ?auto_366932 ) ) ( not ( = ?auto_366924 ?auto_366925 ) ) ( not ( = ?auto_366924 ?auto_366926 ) ) ( not ( = ?auto_366924 ?auto_366927 ) ) ( not ( = ?auto_366924 ?auto_366928 ) ) ( not ( = ?auto_366924 ?auto_366929 ) ) ( not ( = ?auto_366924 ?auto_366930 ) ) ( not ( = ?auto_366924 ?auto_366931 ) ) ( not ( = ?auto_366924 ?auto_366932 ) ) ( not ( = ?auto_366925 ?auto_366926 ) ) ( not ( = ?auto_366925 ?auto_366927 ) ) ( not ( = ?auto_366925 ?auto_366928 ) ) ( not ( = ?auto_366925 ?auto_366929 ) ) ( not ( = ?auto_366925 ?auto_366930 ) ) ( not ( = ?auto_366925 ?auto_366931 ) ) ( not ( = ?auto_366925 ?auto_366932 ) ) ( not ( = ?auto_366926 ?auto_366927 ) ) ( not ( = ?auto_366926 ?auto_366928 ) ) ( not ( = ?auto_366926 ?auto_366929 ) ) ( not ( = ?auto_366926 ?auto_366930 ) ) ( not ( = ?auto_366926 ?auto_366931 ) ) ( not ( = ?auto_366926 ?auto_366932 ) ) ( not ( = ?auto_366927 ?auto_366928 ) ) ( not ( = ?auto_366927 ?auto_366929 ) ) ( not ( = ?auto_366927 ?auto_366930 ) ) ( not ( = ?auto_366927 ?auto_366931 ) ) ( not ( = ?auto_366927 ?auto_366932 ) ) ( not ( = ?auto_366928 ?auto_366929 ) ) ( not ( = ?auto_366928 ?auto_366930 ) ) ( not ( = ?auto_366928 ?auto_366931 ) ) ( not ( = ?auto_366928 ?auto_366932 ) ) ( not ( = ?auto_366929 ?auto_366930 ) ) ( not ( = ?auto_366929 ?auto_366931 ) ) ( not ( = ?auto_366929 ?auto_366932 ) ) ( not ( = ?auto_366930 ?auto_366931 ) ) ( not ( = ?auto_366930 ?auto_366932 ) ) ( not ( = ?auto_366931 ?auto_366932 ) ) ( ON ?auto_366930 ?auto_366931 ) ( ON ?auto_366929 ?auto_366930 ) ( ON ?auto_366928 ?auto_366929 ) ( ON ?auto_366927 ?auto_366928 ) ( CLEAR ?auto_366925 ) ( ON ?auto_366926 ?auto_366927 ) ( CLEAR ?auto_366926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_366923 ?auto_366924 ?auto_366925 ?auto_366926 )
      ( MAKE-9PILE ?auto_366923 ?auto_366924 ?auto_366925 ?auto_366926 ?auto_366927 ?auto_366928 ?auto_366929 ?auto_366930 ?auto_366931 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_366961 - BLOCK
      ?auto_366962 - BLOCK
      ?auto_366963 - BLOCK
      ?auto_366964 - BLOCK
      ?auto_366965 - BLOCK
      ?auto_366966 - BLOCK
      ?auto_366967 - BLOCK
      ?auto_366968 - BLOCK
      ?auto_366969 - BLOCK
    )
    :vars
    (
      ?auto_366970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_366969 ?auto_366970 ) ( ON-TABLE ?auto_366961 ) ( ON ?auto_366962 ?auto_366961 ) ( not ( = ?auto_366961 ?auto_366962 ) ) ( not ( = ?auto_366961 ?auto_366963 ) ) ( not ( = ?auto_366961 ?auto_366964 ) ) ( not ( = ?auto_366961 ?auto_366965 ) ) ( not ( = ?auto_366961 ?auto_366966 ) ) ( not ( = ?auto_366961 ?auto_366967 ) ) ( not ( = ?auto_366961 ?auto_366968 ) ) ( not ( = ?auto_366961 ?auto_366969 ) ) ( not ( = ?auto_366961 ?auto_366970 ) ) ( not ( = ?auto_366962 ?auto_366963 ) ) ( not ( = ?auto_366962 ?auto_366964 ) ) ( not ( = ?auto_366962 ?auto_366965 ) ) ( not ( = ?auto_366962 ?auto_366966 ) ) ( not ( = ?auto_366962 ?auto_366967 ) ) ( not ( = ?auto_366962 ?auto_366968 ) ) ( not ( = ?auto_366962 ?auto_366969 ) ) ( not ( = ?auto_366962 ?auto_366970 ) ) ( not ( = ?auto_366963 ?auto_366964 ) ) ( not ( = ?auto_366963 ?auto_366965 ) ) ( not ( = ?auto_366963 ?auto_366966 ) ) ( not ( = ?auto_366963 ?auto_366967 ) ) ( not ( = ?auto_366963 ?auto_366968 ) ) ( not ( = ?auto_366963 ?auto_366969 ) ) ( not ( = ?auto_366963 ?auto_366970 ) ) ( not ( = ?auto_366964 ?auto_366965 ) ) ( not ( = ?auto_366964 ?auto_366966 ) ) ( not ( = ?auto_366964 ?auto_366967 ) ) ( not ( = ?auto_366964 ?auto_366968 ) ) ( not ( = ?auto_366964 ?auto_366969 ) ) ( not ( = ?auto_366964 ?auto_366970 ) ) ( not ( = ?auto_366965 ?auto_366966 ) ) ( not ( = ?auto_366965 ?auto_366967 ) ) ( not ( = ?auto_366965 ?auto_366968 ) ) ( not ( = ?auto_366965 ?auto_366969 ) ) ( not ( = ?auto_366965 ?auto_366970 ) ) ( not ( = ?auto_366966 ?auto_366967 ) ) ( not ( = ?auto_366966 ?auto_366968 ) ) ( not ( = ?auto_366966 ?auto_366969 ) ) ( not ( = ?auto_366966 ?auto_366970 ) ) ( not ( = ?auto_366967 ?auto_366968 ) ) ( not ( = ?auto_366967 ?auto_366969 ) ) ( not ( = ?auto_366967 ?auto_366970 ) ) ( not ( = ?auto_366968 ?auto_366969 ) ) ( not ( = ?auto_366968 ?auto_366970 ) ) ( not ( = ?auto_366969 ?auto_366970 ) ) ( ON ?auto_366968 ?auto_366969 ) ( ON ?auto_366967 ?auto_366968 ) ( ON ?auto_366966 ?auto_366967 ) ( ON ?auto_366965 ?auto_366966 ) ( ON ?auto_366964 ?auto_366965 ) ( CLEAR ?auto_366962 ) ( ON ?auto_366963 ?auto_366964 ) ( CLEAR ?auto_366963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_366961 ?auto_366962 ?auto_366963 )
      ( MAKE-9PILE ?auto_366961 ?auto_366962 ?auto_366963 ?auto_366964 ?auto_366965 ?auto_366966 ?auto_366967 ?auto_366968 ?auto_366969 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_366999 - BLOCK
      ?auto_367000 - BLOCK
      ?auto_367001 - BLOCK
      ?auto_367002 - BLOCK
      ?auto_367003 - BLOCK
      ?auto_367004 - BLOCK
      ?auto_367005 - BLOCK
      ?auto_367006 - BLOCK
      ?auto_367007 - BLOCK
    )
    :vars
    (
      ?auto_367008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_367007 ?auto_367008 ) ( ON-TABLE ?auto_366999 ) ( not ( = ?auto_366999 ?auto_367000 ) ) ( not ( = ?auto_366999 ?auto_367001 ) ) ( not ( = ?auto_366999 ?auto_367002 ) ) ( not ( = ?auto_366999 ?auto_367003 ) ) ( not ( = ?auto_366999 ?auto_367004 ) ) ( not ( = ?auto_366999 ?auto_367005 ) ) ( not ( = ?auto_366999 ?auto_367006 ) ) ( not ( = ?auto_366999 ?auto_367007 ) ) ( not ( = ?auto_366999 ?auto_367008 ) ) ( not ( = ?auto_367000 ?auto_367001 ) ) ( not ( = ?auto_367000 ?auto_367002 ) ) ( not ( = ?auto_367000 ?auto_367003 ) ) ( not ( = ?auto_367000 ?auto_367004 ) ) ( not ( = ?auto_367000 ?auto_367005 ) ) ( not ( = ?auto_367000 ?auto_367006 ) ) ( not ( = ?auto_367000 ?auto_367007 ) ) ( not ( = ?auto_367000 ?auto_367008 ) ) ( not ( = ?auto_367001 ?auto_367002 ) ) ( not ( = ?auto_367001 ?auto_367003 ) ) ( not ( = ?auto_367001 ?auto_367004 ) ) ( not ( = ?auto_367001 ?auto_367005 ) ) ( not ( = ?auto_367001 ?auto_367006 ) ) ( not ( = ?auto_367001 ?auto_367007 ) ) ( not ( = ?auto_367001 ?auto_367008 ) ) ( not ( = ?auto_367002 ?auto_367003 ) ) ( not ( = ?auto_367002 ?auto_367004 ) ) ( not ( = ?auto_367002 ?auto_367005 ) ) ( not ( = ?auto_367002 ?auto_367006 ) ) ( not ( = ?auto_367002 ?auto_367007 ) ) ( not ( = ?auto_367002 ?auto_367008 ) ) ( not ( = ?auto_367003 ?auto_367004 ) ) ( not ( = ?auto_367003 ?auto_367005 ) ) ( not ( = ?auto_367003 ?auto_367006 ) ) ( not ( = ?auto_367003 ?auto_367007 ) ) ( not ( = ?auto_367003 ?auto_367008 ) ) ( not ( = ?auto_367004 ?auto_367005 ) ) ( not ( = ?auto_367004 ?auto_367006 ) ) ( not ( = ?auto_367004 ?auto_367007 ) ) ( not ( = ?auto_367004 ?auto_367008 ) ) ( not ( = ?auto_367005 ?auto_367006 ) ) ( not ( = ?auto_367005 ?auto_367007 ) ) ( not ( = ?auto_367005 ?auto_367008 ) ) ( not ( = ?auto_367006 ?auto_367007 ) ) ( not ( = ?auto_367006 ?auto_367008 ) ) ( not ( = ?auto_367007 ?auto_367008 ) ) ( ON ?auto_367006 ?auto_367007 ) ( ON ?auto_367005 ?auto_367006 ) ( ON ?auto_367004 ?auto_367005 ) ( ON ?auto_367003 ?auto_367004 ) ( ON ?auto_367002 ?auto_367003 ) ( ON ?auto_367001 ?auto_367002 ) ( CLEAR ?auto_366999 ) ( ON ?auto_367000 ?auto_367001 ) ( CLEAR ?auto_367000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_366999 ?auto_367000 )
      ( MAKE-9PILE ?auto_366999 ?auto_367000 ?auto_367001 ?auto_367002 ?auto_367003 ?auto_367004 ?auto_367005 ?auto_367006 ?auto_367007 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_367037 - BLOCK
      ?auto_367038 - BLOCK
      ?auto_367039 - BLOCK
      ?auto_367040 - BLOCK
      ?auto_367041 - BLOCK
      ?auto_367042 - BLOCK
      ?auto_367043 - BLOCK
      ?auto_367044 - BLOCK
      ?auto_367045 - BLOCK
    )
    :vars
    (
      ?auto_367046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_367045 ?auto_367046 ) ( not ( = ?auto_367037 ?auto_367038 ) ) ( not ( = ?auto_367037 ?auto_367039 ) ) ( not ( = ?auto_367037 ?auto_367040 ) ) ( not ( = ?auto_367037 ?auto_367041 ) ) ( not ( = ?auto_367037 ?auto_367042 ) ) ( not ( = ?auto_367037 ?auto_367043 ) ) ( not ( = ?auto_367037 ?auto_367044 ) ) ( not ( = ?auto_367037 ?auto_367045 ) ) ( not ( = ?auto_367037 ?auto_367046 ) ) ( not ( = ?auto_367038 ?auto_367039 ) ) ( not ( = ?auto_367038 ?auto_367040 ) ) ( not ( = ?auto_367038 ?auto_367041 ) ) ( not ( = ?auto_367038 ?auto_367042 ) ) ( not ( = ?auto_367038 ?auto_367043 ) ) ( not ( = ?auto_367038 ?auto_367044 ) ) ( not ( = ?auto_367038 ?auto_367045 ) ) ( not ( = ?auto_367038 ?auto_367046 ) ) ( not ( = ?auto_367039 ?auto_367040 ) ) ( not ( = ?auto_367039 ?auto_367041 ) ) ( not ( = ?auto_367039 ?auto_367042 ) ) ( not ( = ?auto_367039 ?auto_367043 ) ) ( not ( = ?auto_367039 ?auto_367044 ) ) ( not ( = ?auto_367039 ?auto_367045 ) ) ( not ( = ?auto_367039 ?auto_367046 ) ) ( not ( = ?auto_367040 ?auto_367041 ) ) ( not ( = ?auto_367040 ?auto_367042 ) ) ( not ( = ?auto_367040 ?auto_367043 ) ) ( not ( = ?auto_367040 ?auto_367044 ) ) ( not ( = ?auto_367040 ?auto_367045 ) ) ( not ( = ?auto_367040 ?auto_367046 ) ) ( not ( = ?auto_367041 ?auto_367042 ) ) ( not ( = ?auto_367041 ?auto_367043 ) ) ( not ( = ?auto_367041 ?auto_367044 ) ) ( not ( = ?auto_367041 ?auto_367045 ) ) ( not ( = ?auto_367041 ?auto_367046 ) ) ( not ( = ?auto_367042 ?auto_367043 ) ) ( not ( = ?auto_367042 ?auto_367044 ) ) ( not ( = ?auto_367042 ?auto_367045 ) ) ( not ( = ?auto_367042 ?auto_367046 ) ) ( not ( = ?auto_367043 ?auto_367044 ) ) ( not ( = ?auto_367043 ?auto_367045 ) ) ( not ( = ?auto_367043 ?auto_367046 ) ) ( not ( = ?auto_367044 ?auto_367045 ) ) ( not ( = ?auto_367044 ?auto_367046 ) ) ( not ( = ?auto_367045 ?auto_367046 ) ) ( ON ?auto_367044 ?auto_367045 ) ( ON ?auto_367043 ?auto_367044 ) ( ON ?auto_367042 ?auto_367043 ) ( ON ?auto_367041 ?auto_367042 ) ( ON ?auto_367040 ?auto_367041 ) ( ON ?auto_367039 ?auto_367040 ) ( ON ?auto_367038 ?auto_367039 ) ( ON ?auto_367037 ?auto_367038 ) ( CLEAR ?auto_367037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_367037 )
      ( MAKE-9PILE ?auto_367037 ?auto_367038 ?auto_367039 ?auto_367040 ?auto_367041 ?auto_367042 ?auto_367043 ?auto_367044 ?auto_367045 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_367076 - BLOCK
      ?auto_367077 - BLOCK
      ?auto_367078 - BLOCK
      ?auto_367079 - BLOCK
      ?auto_367080 - BLOCK
      ?auto_367081 - BLOCK
      ?auto_367082 - BLOCK
      ?auto_367083 - BLOCK
      ?auto_367084 - BLOCK
      ?auto_367085 - BLOCK
    )
    :vars
    (
      ?auto_367086 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_367084 ) ( ON ?auto_367085 ?auto_367086 ) ( CLEAR ?auto_367085 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_367076 ) ( ON ?auto_367077 ?auto_367076 ) ( ON ?auto_367078 ?auto_367077 ) ( ON ?auto_367079 ?auto_367078 ) ( ON ?auto_367080 ?auto_367079 ) ( ON ?auto_367081 ?auto_367080 ) ( ON ?auto_367082 ?auto_367081 ) ( ON ?auto_367083 ?auto_367082 ) ( ON ?auto_367084 ?auto_367083 ) ( not ( = ?auto_367076 ?auto_367077 ) ) ( not ( = ?auto_367076 ?auto_367078 ) ) ( not ( = ?auto_367076 ?auto_367079 ) ) ( not ( = ?auto_367076 ?auto_367080 ) ) ( not ( = ?auto_367076 ?auto_367081 ) ) ( not ( = ?auto_367076 ?auto_367082 ) ) ( not ( = ?auto_367076 ?auto_367083 ) ) ( not ( = ?auto_367076 ?auto_367084 ) ) ( not ( = ?auto_367076 ?auto_367085 ) ) ( not ( = ?auto_367076 ?auto_367086 ) ) ( not ( = ?auto_367077 ?auto_367078 ) ) ( not ( = ?auto_367077 ?auto_367079 ) ) ( not ( = ?auto_367077 ?auto_367080 ) ) ( not ( = ?auto_367077 ?auto_367081 ) ) ( not ( = ?auto_367077 ?auto_367082 ) ) ( not ( = ?auto_367077 ?auto_367083 ) ) ( not ( = ?auto_367077 ?auto_367084 ) ) ( not ( = ?auto_367077 ?auto_367085 ) ) ( not ( = ?auto_367077 ?auto_367086 ) ) ( not ( = ?auto_367078 ?auto_367079 ) ) ( not ( = ?auto_367078 ?auto_367080 ) ) ( not ( = ?auto_367078 ?auto_367081 ) ) ( not ( = ?auto_367078 ?auto_367082 ) ) ( not ( = ?auto_367078 ?auto_367083 ) ) ( not ( = ?auto_367078 ?auto_367084 ) ) ( not ( = ?auto_367078 ?auto_367085 ) ) ( not ( = ?auto_367078 ?auto_367086 ) ) ( not ( = ?auto_367079 ?auto_367080 ) ) ( not ( = ?auto_367079 ?auto_367081 ) ) ( not ( = ?auto_367079 ?auto_367082 ) ) ( not ( = ?auto_367079 ?auto_367083 ) ) ( not ( = ?auto_367079 ?auto_367084 ) ) ( not ( = ?auto_367079 ?auto_367085 ) ) ( not ( = ?auto_367079 ?auto_367086 ) ) ( not ( = ?auto_367080 ?auto_367081 ) ) ( not ( = ?auto_367080 ?auto_367082 ) ) ( not ( = ?auto_367080 ?auto_367083 ) ) ( not ( = ?auto_367080 ?auto_367084 ) ) ( not ( = ?auto_367080 ?auto_367085 ) ) ( not ( = ?auto_367080 ?auto_367086 ) ) ( not ( = ?auto_367081 ?auto_367082 ) ) ( not ( = ?auto_367081 ?auto_367083 ) ) ( not ( = ?auto_367081 ?auto_367084 ) ) ( not ( = ?auto_367081 ?auto_367085 ) ) ( not ( = ?auto_367081 ?auto_367086 ) ) ( not ( = ?auto_367082 ?auto_367083 ) ) ( not ( = ?auto_367082 ?auto_367084 ) ) ( not ( = ?auto_367082 ?auto_367085 ) ) ( not ( = ?auto_367082 ?auto_367086 ) ) ( not ( = ?auto_367083 ?auto_367084 ) ) ( not ( = ?auto_367083 ?auto_367085 ) ) ( not ( = ?auto_367083 ?auto_367086 ) ) ( not ( = ?auto_367084 ?auto_367085 ) ) ( not ( = ?auto_367084 ?auto_367086 ) ) ( not ( = ?auto_367085 ?auto_367086 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_367085 ?auto_367086 )
      ( !STACK ?auto_367085 ?auto_367084 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_367118 - BLOCK
      ?auto_367119 - BLOCK
      ?auto_367120 - BLOCK
      ?auto_367121 - BLOCK
      ?auto_367122 - BLOCK
      ?auto_367123 - BLOCK
      ?auto_367124 - BLOCK
      ?auto_367125 - BLOCK
      ?auto_367126 - BLOCK
      ?auto_367127 - BLOCK
    )
    :vars
    (
      ?auto_367128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_367127 ?auto_367128 ) ( ON-TABLE ?auto_367118 ) ( ON ?auto_367119 ?auto_367118 ) ( ON ?auto_367120 ?auto_367119 ) ( ON ?auto_367121 ?auto_367120 ) ( ON ?auto_367122 ?auto_367121 ) ( ON ?auto_367123 ?auto_367122 ) ( ON ?auto_367124 ?auto_367123 ) ( ON ?auto_367125 ?auto_367124 ) ( not ( = ?auto_367118 ?auto_367119 ) ) ( not ( = ?auto_367118 ?auto_367120 ) ) ( not ( = ?auto_367118 ?auto_367121 ) ) ( not ( = ?auto_367118 ?auto_367122 ) ) ( not ( = ?auto_367118 ?auto_367123 ) ) ( not ( = ?auto_367118 ?auto_367124 ) ) ( not ( = ?auto_367118 ?auto_367125 ) ) ( not ( = ?auto_367118 ?auto_367126 ) ) ( not ( = ?auto_367118 ?auto_367127 ) ) ( not ( = ?auto_367118 ?auto_367128 ) ) ( not ( = ?auto_367119 ?auto_367120 ) ) ( not ( = ?auto_367119 ?auto_367121 ) ) ( not ( = ?auto_367119 ?auto_367122 ) ) ( not ( = ?auto_367119 ?auto_367123 ) ) ( not ( = ?auto_367119 ?auto_367124 ) ) ( not ( = ?auto_367119 ?auto_367125 ) ) ( not ( = ?auto_367119 ?auto_367126 ) ) ( not ( = ?auto_367119 ?auto_367127 ) ) ( not ( = ?auto_367119 ?auto_367128 ) ) ( not ( = ?auto_367120 ?auto_367121 ) ) ( not ( = ?auto_367120 ?auto_367122 ) ) ( not ( = ?auto_367120 ?auto_367123 ) ) ( not ( = ?auto_367120 ?auto_367124 ) ) ( not ( = ?auto_367120 ?auto_367125 ) ) ( not ( = ?auto_367120 ?auto_367126 ) ) ( not ( = ?auto_367120 ?auto_367127 ) ) ( not ( = ?auto_367120 ?auto_367128 ) ) ( not ( = ?auto_367121 ?auto_367122 ) ) ( not ( = ?auto_367121 ?auto_367123 ) ) ( not ( = ?auto_367121 ?auto_367124 ) ) ( not ( = ?auto_367121 ?auto_367125 ) ) ( not ( = ?auto_367121 ?auto_367126 ) ) ( not ( = ?auto_367121 ?auto_367127 ) ) ( not ( = ?auto_367121 ?auto_367128 ) ) ( not ( = ?auto_367122 ?auto_367123 ) ) ( not ( = ?auto_367122 ?auto_367124 ) ) ( not ( = ?auto_367122 ?auto_367125 ) ) ( not ( = ?auto_367122 ?auto_367126 ) ) ( not ( = ?auto_367122 ?auto_367127 ) ) ( not ( = ?auto_367122 ?auto_367128 ) ) ( not ( = ?auto_367123 ?auto_367124 ) ) ( not ( = ?auto_367123 ?auto_367125 ) ) ( not ( = ?auto_367123 ?auto_367126 ) ) ( not ( = ?auto_367123 ?auto_367127 ) ) ( not ( = ?auto_367123 ?auto_367128 ) ) ( not ( = ?auto_367124 ?auto_367125 ) ) ( not ( = ?auto_367124 ?auto_367126 ) ) ( not ( = ?auto_367124 ?auto_367127 ) ) ( not ( = ?auto_367124 ?auto_367128 ) ) ( not ( = ?auto_367125 ?auto_367126 ) ) ( not ( = ?auto_367125 ?auto_367127 ) ) ( not ( = ?auto_367125 ?auto_367128 ) ) ( not ( = ?auto_367126 ?auto_367127 ) ) ( not ( = ?auto_367126 ?auto_367128 ) ) ( not ( = ?auto_367127 ?auto_367128 ) ) ( CLEAR ?auto_367125 ) ( ON ?auto_367126 ?auto_367127 ) ( CLEAR ?auto_367126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_367118 ?auto_367119 ?auto_367120 ?auto_367121 ?auto_367122 ?auto_367123 ?auto_367124 ?auto_367125 ?auto_367126 )
      ( MAKE-10PILE ?auto_367118 ?auto_367119 ?auto_367120 ?auto_367121 ?auto_367122 ?auto_367123 ?auto_367124 ?auto_367125 ?auto_367126 ?auto_367127 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_367160 - BLOCK
      ?auto_367161 - BLOCK
      ?auto_367162 - BLOCK
      ?auto_367163 - BLOCK
      ?auto_367164 - BLOCK
      ?auto_367165 - BLOCK
      ?auto_367166 - BLOCK
      ?auto_367167 - BLOCK
      ?auto_367168 - BLOCK
      ?auto_367169 - BLOCK
    )
    :vars
    (
      ?auto_367170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_367169 ?auto_367170 ) ( ON-TABLE ?auto_367160 ) ( ON ?auto_367161 ?auto_367160 ) ( ON ?auto_367162 ?auto_367161 ) ( ON ?auto_367163 ?auto_367162 ) ( ON ?auto_367164 ?auto_367163 ) ( ON ?auto_367165 ?auto_367164 ) ( ON ?auto_367166 ?auto_367165 ) ( not ( = ?auto_367160 ?auto_367161 ) ) ( not ( = ?auto_367160 ?auto_367162 ) ) ( not ( = ?auto_367160 ?auto_367163 ) ) ( not ( = ?auto_367160 ?auto_367164 ) ) ( not ( = ?auto_367160 ?auto_367165 ) ) ( not ( = ?auto_367160 ?auto_367166 ) ) ( not ( = ?auto_367160 ?auto_367167 ) ) ( not ( = ?auto_367160 ?auto_367168 ) ) ( not ( = ?auto_367160 ?auto_367169 ) ) ( not ( = ?auto_367160 ?auto_367170 ) ) ( not ( = ?auto_367161 ?auto_367162 ) ) ( not ( = ?auto_367161 ?auto_367163 ) ) ( not ( = ?auto_367161 ?auto_367164 ) ) ( not ( = ?auto_367161 ?auto_367165 ) ) ( not ( = ?auto_367161 ?auto_367166 ) ) ( not ( = ?auto_367161 ?auto_367167 ) ) ( not ( = ?auto_367161 ?auto_367168 ) ) ( not ( = ?auto_367161 ?auto_367169 ) ) ( not ( = ?auto_367161 ?auto_367170 ) ) ( not ( = ?auto_367162 ?auto_367163 ) ) ( not ( = ?auto_367162 ?auto_367164 ) ) ( not ( = ?auto_367162 ?auto_367165 ) ) ( not ( = ?auto_367162 ?auto_367166 ) ) ( not ( = ?auto_367162 ?auto_367167 ) ) ( not ( = ?auto_367162 ?auto_367168 ) ) ( not ( = ?auto_367162 ?auto_367169 ) ) ( not ( = ?auto_367162 ?auto_367170 ) ) ( not ( = ?auto_367163 ?auto_367164 ) ) ( not ( = ?auto_367163 ?auto_367165 ) ) ( not ( = ?auto_367163 ?auto_367166 ) ) ( not ( = ?auto_367163 ?auto_367167 ) ) ( not ( = ?auto_367163 ?auto_367168 ) ) ( not ( = ?auto_367163 ?auto_367169 ) ) ( not ( = ?auto_367163 ?auto_367170 ) ) ( not ( = ?auto_367164 ?auto_367165 ) ) ( not ( = ?auto_367164 ?auto_367166 ) ) ( not ( = ?auto_367164 ?auto_367167 ) ) ( not ( = ?auto_367164 ?auto_367168 ) ) ( not ( = ?auto_367164 ?auto_367169 ) ) ( not ( = ?auto_367164 ?auto_367170 ) ) ( not ( = ?auto_367165 ?auto_367166 ) ) ( not ( = ?auto_367165 ?auto_367167 ) ) ( not ( = ?auto_367165 ?auto_367168 ) ) ( not ( = ?auto_367165 ?auto_367169 ) ) ( not ( = ?auto_367165 ?auto_367170 ) ) ( not ( = ?auto_367166 ?auto_367167 ) ) ( not ( = ?auto_367166 ?auto_367168 ) ) ( not ( = ?auto_367166 ?auto_367169 ) ) ( not ( = ?auto_367166 ?auto_367170 ) ) ( not ( = ?auto_367167 ?auto_367168 ) ) ( not ( = ?auto_367167 ?auto_367169 ) ) ( not ( = ?auto_367167 ?auto_367170 ) ) ( not ( = ?auto_367168 ?auto_367169 ) ) ( not ( = ?auto_367168 ?auto_367170 ) ) ( not ( = ?auto_367169 ?auto_367170 ) ) ( ON ?auto_367168 ?auto_367169 ) ( CLEAR ?auto_367166 ) ( ON ?auto_367167 ?auto_367168 ) ( CLEAR ?auto_367167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_367160 ?auto_367161 ?auto_367162 ?auto_367163 ?auto_367164 ?auto_367165 ?auto_367166 ?auto_367167 )
      ( MAKE-10PILE ?auto_367160 ?auto_367161 ?auto_367162 ?auto_367163 ?auto_367164 ?auto_367165 ?auto_367166 ?auto_367167 ?auto_367168 ?auto_367169 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_367202 - BLOCK
      ?auto_367203 - BLOCK
      ?auto_367204 - BLOCK
      ?auto_367205 - BLOCK
      ?auto_367206 - BLOCK
      ?auto_367207 - BLOCK
      ?auto_367208 - BLOCK
      ?auto_367209 - BLOCK
      ?auto_367210 - BLOCK
      ?auto_367211 - BLOCK
    )
    :vars
    (
      ?auto_367212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_367211 ?auto_367212 ) ( ON-TABLE ?auto_367202 ) ( ON ?auto_367203 ?auto_367202 ) ( ON ?auto_367204 ?auto_367203 ) ( ON ?auto_367205 ?auto_367204 ) ( ON ?auto_367206 ?auto_367205 ) ( ON ?auto_367207 ?auto_367206 ) ( not ( = ?auto_367202 ?auto_367203 ) ) ( not ( = ?auto_367202 ?auto_367204 ) ) ( not ( = ?auto_367202 ?auto_367205 ) ) ( not ( = ?auto_367202 ?auto_367206 ) ) ( not ( = ?auto_367202 ?auto_367207 ) ) ( not ( = ?auto_367202 ?auto_367208 ) ) ( not ( = ?auto_367202 ?auto_367209 ) ) ( not ( = ?auto_367202 ?auto_367210 ) ) ( not ( = ?auto_367202 ?auto_367211 ) ) ( not ( = ?auto_367202 ?auto_367212 ) ) ( not ( = ?auto_367203 ?auto_367204 ) ) ( not ( = ?auto_367203 ?auto_367205 ) ) ( not ( = ?auto_367203 ?auto_367206 ) ) ( not ( = ?auto_367203 ?auto_367207 ) ) ( not ( = ?auto_367203 ?auto_367208 ) ) ( not ( = ?auto_367203 ?auto_367209 ) ) ( not ( = ?auto_367203 ?auto_367210 ) ) ( not ( = ?auto_367203 ?auto_367211 ) ) ( not ( = ?auto_367203 ?auto_367212 ) ) ( not ( = ?auto_367204 ?auto_367205 ) ) ( not ( = ?auto_367204 ?auto_367206 ) ) ( not ( = ?auto_367204 ?auto_367207 ) ) ( not ( = ?auto_367204 ?auto_367208 ) ) ( not ( = ?auto_367204 ?auto_367209 ) ) ( not ( = ?auto_367204 ?auto_367210 ) ) ( not ( = ?auto_367204 ?auto_367211 ) ) ( not ( = ?auto_367204 ?auto_367212 ) ) ( not ( = ?auto_367205 ?auto_367206 ) ) ( not ( = ?auto_367205 ?auto_367207 ) ) ( not ( = ?auto_367205 ?auto_367208 ) ) ( not ( = ?auto_367205 ?auto_367209 ) ) ( not ( = ?auto_367205 ?auto_367210 ) ) ( not ( = ?auto_367205 ?auto_367211 ) ) ( not ( = ?auto_367205 ?auto_367212 ) ) ( not ( = ?auto_367206 ?auto_367207 ) ) ( not ( = ?auto_367206 ?auto_367208 ) ) ( not ( = ?auto_367206 ?auto_367209 ) ) ( not ( = ?auto_367206 ?auto_367210 ) ) ( not ( = ?auto_367206 ?auto_367211 ) ) ( not ( = ?auto_367206 ?auto_367212 ) ) ( not ( = ?auto_367207 ?auto_367208 ) ) ( not ( = ?auto_367207 ?auto_367209 ) ) ( not ( = ?auto_367207 ?auto_367210 ) ) ( not ( = ?auto_367207 ?auto_367211 ) ) ( not ( = ?auto_367207 ?auto_367212 ) ) ( not ( = ?auto_367208 ?auto_367209 ) ) ( not ( = ?auto_367208 ?auto_367210 ) ) ( not ( = ?auto_367208 ?auto_367211 ) ) ( not ( = ?auto_367208 ?auto_367212 ) ) ( not ( = ?auto_367209 ?auto_367210 ) ) ( not ( = ?auto_367209 ?auto_367211 ) ) ( not ( = ?auto_367209 ?auto_367212 ) ) ( not ( = ?auto_367210 ?auto_367211 ) ) ( not ( = ?auto_367210 ?auto_367212 ) ) ( not ( = ?auto_367211 ?auto_367212 ) ) ( ON ?auto_367210 ?auto_367211 ) ( ON ?auto_367209 ?auto_367210 ) ( CLEAR ?auto_367207 ) ( ON ?auto_367208 ?auto_367209 ) ( CLEAR ?auto_367208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_367202 ?auto_367203 ?auto_367204 ?auto_367205 ?auto_367206 ?auto_367207 ?auto_367208 )
      ( MAKE-10PILE ?auto_367202 ?auto_367203 ?auto_367204 ?auto_367205 ?auto_367206 ?auto_367207 ?auto_367208 ?auto_367209 ?auto_367210 ?auto_367211 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_367244 - BLOCK
      ?auto_367245 - BLOCK
      ?auto_367246 - BLOCK
      ?auto_367247 - BLOCK
      ?auto_367248 - BLOCK
      ?auto_367249 - BLOCK
      ?auto_367250 - BLOCK
      ?auto_367251 - BLOCK
      ?auto_367252 - BLOCK
      ?auto_367253 - BLOCK
    )
    :vars
    (
      ?auto_367254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_367253 ?auto_367254 ) ( ON-TABLE ?auto_367244 ) ( ON ?auto_367245 ?auto_367244 ) ( ON ?auto_367246 ?auto_367245 ) ( ON ?auto_367247 ?auto_367246 ) ( ON ?auto_367248 ?auto_367247 ) ( not ( = ?auto_367244 ?auto_367245 ) ) ( not ( = ?auto_367244 ?auto_367246 ) ) ( not ( = ?auto_367244 ?auto_367247 ) ) ( not ( = ?auto_367244 ?auto_367248 ) ) ( not ( = ?auto_367244 ?auto_367249 ) ) ( not ( = ?auto_367244 ?auto_367250 ) ) ( not ( = ?auto_367244 ?auto_367251 ) ) ( not ( = ?auto_367244 ?auto_367252 ) ) ( not ( = ?auto_367244 ?auto_367253 ) ) ( not ( = ?auto_367244 ?auto_367254 ) ) ( not ( = ?auto_367245 ?auto_367246 ) ) ( not ( = ?auto_367245 ?auto_367247 ) ) ( not ( = ?auto_367245 ?auto_367248 ) ) ( not ( = ?auto_367245 ?auto_367249 ) ) ( not ( = ?auto_367245 ?auto_367250 ) ) ( not ( = ?auto_367245 ?auto_367251 ) ) ( not ( = ?auto_367245 ?auto_367252 ) ) ( not ( = ?auto_367245 ?auto_367253 ) ) ( not ( = ?auto_367245 ?auto_367254 ) ) ( not ( = ?auto_367246 ?auto_367247 ) ) ( not ( = ?auto_367246 ?auto_367248 ) ) ( not ( = ?auto_367246 ?auto_367249 ) ) ( not ( = ?auto_367246 ?auto_367250 ) ) ( not ( = ?auto_367246 ?auto_367251 ) ) ( not ( = ?auto_367246 ?auto_367252 ) ) ( not ( = ?auto_367246 ?auto_367253 ) ) ( not ( = ?auto_367246 ?auto_367254 ) ) ( not ( = ?auto_367247 ?auto_367248 ) ) ( not ( = ?auto_367247 ?auto_367249 ) ) ( not ( = ?auto_367247 ?auto_367250 ) ) ( not ( = ?auto_367247 ?auto_367251 ) ) ( not ( = ?auto_367247 ?auto_367252 ) ) ( not ( = ?auto_367247 ?auto_367253 ) ) ( not ( = ?auto_367247 ?auto_367254 ) ) ( not ( = ?auto_367248 ?auto_367249 ) ) ( not ( = ?auto_367248 ?auto_367250 ) ) ( not ( = ?auto_367248 ?auto_367251 ) ) ( not ( = ?auto_367248 ?auto_367252 ) ) ( not ( = ?auto_367248 ?auto_367253 ) ) ( not ( = ?auto_367248 ?auto_367254 ) ) ( not ( = ?auto_367249 ?auto_367250 ) ) ( not ( = ?auto_367249 ?auto_367251 ) ) ( not ( = ?auto_367249 ?auto_367252 ) ) ( not ( = ?auto_367249 ?auto_367253 ) ) ( not ( = ?auto_367249 ?auto_367254 ) ) ( not ( = ?auto_367250 ?auto_367251 ) ) ( not ( = ?auto_367250 ?auto_367252 ) ) ( not ( = ?auto_367250 ?auto_367253 ) ) ( not ( = ?auto_367250 ?auto_367254 ) ) ( not ( = ?auto_367251 ?auto_367252 ) ) ( not ( = ?auto_367251 ?auto_367253 ) ) ( not ( = ?auto_367251 ?auto_367254 ) ) ( not ( = ?auto_367252 ?auto_367253 ) ) ( not ( = ?auto_367252 ?auto_367254 ) ) ( not ( = ?auto_367253 ?auto_367254 ) ) ( ON ?auto_367252 ?auto_367253 ) ( ON ?auto_367251 ?auto_367252 ) ( ON ?auto_367250 ?auto_367251 ) ( CLEAR ?auto_367248 ) ( ON ?auto_367249 ?auto_367250 ) ( CLEAR ?auto_367249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_367244 ?auto_367245 ?auto_367246 ?auto_367247 ?auto_367248 ?auto_367249 )
      ( MAKE-10PILE ?auto_367244 ?auto_367245 ?auto_367246 ?auto_367247 ?auto_367248 ?auto_367249 ?auto_367250 ?auto_367251 ?auto_367252 ?auto_367253 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_367286 - BLOCK
      ?auto_367287 - BLOCK
      ?auto_367288 - BLOCK
      ?auto_367289 - BLOCK
      ?auto_367290 - BLOCK
      ?auto_367291 - BLOCK
      ?auto_367292 - BLOCK
      ?auto_367293 - BLOCK
      ?auto_367294 - BLOCK
      ?auto_367295 - BLOCK
    )
    :vars
    (
      ?auto_367296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_367295 ?auto_367296 ) ( ON-TABLE ?auto_367286 ) ( ON ?auto_367287 ?auto_367286 ) ( ON ?auto_367288 ?auto_367287 ) ( ON ?auto_367289 ?auto_367288 ) ( not ( = ?auto_367286 ?auto_367287 ) ) ( not ( = ?auto_367286 ?auto_367288 ) ) ( not ( = ?auto_367286 ?auto_367289 ) ) ( not ( = ?auto_367286 ?auto_367290 ) ) ( not ( = ?auto_367286 ?auto_367291 ) ) ( not ( = ?auto_367286 ?auto_367292 ) ) ( not ( = ?auto_367286 ?auto_367293 ) ) ( not ( = ?auto_367286 ?auto_367294 ) ) ( not ( = ?auto_367286 ?auto_367295 ) ) ( not ( = ?auto_367286 ?auto_367296 ) ) ( not ( = ?auto_367287 ?auto_367288 ) ) ( not ( = ?auto_367287 ?auto_367289 ) ) ( not ( = ?auto_367287 ?auto_367290 ) ) ( not ( = ?auto_367287 ?auto_367291 ) ) ( not ( = ?auto_367287 ?auto_367292 ) ) ( not ( = ?auto_367287 ?auto_367293 ) ) ( not ( = ?auto_367287 ?auto_367294 ) ) ( not ( = ?auto_367287 ?auto_367295 ) ) ( not ( = ?auto_367287 ?auto_367296 ) ) ( not ( = ?auto_367288 ?auto_367289 ) ) ( not ( = ?auto_367288 ?auto_367290 ) ) ( not ( = ?auto_367288 ?auto_367291 ) ) ( not ( = ?auto_367288 ?auto_367292 ) ) ( not ( = ?auto_367288 ?auto_367293 ) ) ( not ( = ?auto_367288 ?auto_367294 ) ) ( not ( = ?auto_367288 ?auto_367295 ) ) ( not ( = ?auto_367288 ?auto_367296 ) ) ( not ( = ?auto_367289 ?auto_367290 ) ) ( not ( = ?auto_367289 ?auto_367291 ) ) ( not ( = ?auto_367289 ?auto_367292 ) ) ( not ( = ?auto_367289 ?auto_367293 ) ) ( not ( = ?auto_367289 ?auto_367294 ) ) ( not ( = ?auto_367289 ?auto_367295 ) ) ( not ( = ?auto_367289 ?auto_367296 ) ) ( not ( = ?auto_367290 ?auto_367291 ) ) ( not ( = ?auto_367290 ?auto_367292 ) ) ( not ( = ?auto_367290 ?auto_367293 ) ) ( not ( = ?auto_367290 ?auto_367294 ) ) ( not ( = ?auto_367290 ?auto_367295 ) ) ( not ( = ?auto_367290 ?auto_367296 ) ) ( not ( = ?auto_367291 ?auto_367292 ) ) ( not ( = ?auto_367291 ?auto_367293 ) ) ( not ( = ?auto_367291 ?auto_367294 ) ) ( not ( = ?auto_367291 ?auto_367295 ) ) ( not ( = ?auto_367291 ?auto_367296 ) ) ( not ( = ?auto_367292 ?auto_367293 ) ) ( not ( = ?auto_367292 ?auto_367294 ) ) ( not ( = ?auto_367292 ?auto_367295 ) ) ( not ( = ?auto_367292 ?auto_367296 ) ) ( not ( = ?auto_367293 ?auto_367294 ) ) ( not ( = ?auto_367293 ?auto_367295 ) ) ( not ( = ?auto_367293 ?auto_367296 ) ) ( not ( = ?auto_367294 ?auto_367295 ) ) ( not ( = ?auto_367294 ?auto_367296 ) ) ( not ( = ?auto_367295 ?auto_367296 ) ) ( ON ?auto_367294 ?auto_367295 ) ( ON ?auto_367293 ?auto_367294 ) ( ON ?auto_367292 ?auto_367293 ) ( ON ?auto_367291 ?auto_367292 ) ( CLEAR ?auto_367289 ) ( ON ?auto_367290 ?auto_367291 ) ( CLEAR ?auto_367290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_367286 ?auto_367287 ?auto_367288 ?auto_367289 ?auto_367290 )
      ( MAKE-10PILE ?auto_367286 ?auto_367287 ?auto_367288 ?auto_367289 ?auto_367290 ?auto_367291 ?auto_367292 ?auto_367293 ?auto_367294 ?auto_367295 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_367328 - BLOCK
      ?auto_367329 - BLOCK
      ?auto_367330 - BLOCK
      ?auto_367331 - BLOCK
      ?auto_367332 - BLOCK
      ?auto_367333 - BLOCK
      ?auto_367334 - BLOCK
      ?auto_367335 - BLOCK
      ?auto_367336 - BLOCK
      ?auto_367337 - BLOCK
    )
    :vars
    (
      ?auto_367338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_367337 ?auto_367338 ) ( ON-TABLE ?auto_367328 ) ( ON ?auto_367329 ?auto_367328 ) ( ON ?auto_367330 ?auto_367329 ) ( not ( = ?auto_367328 ?auto_367329 ) ) ( not ( = ?auto_367328 ?auto_367330 ) ) ( not ( = ?auto_367328 ?auto_367331 ) ) ( not ( = ?auto_367328 ?auto_367332 ) ) ( not ( = ?auto_367328 ?auto_367333 ) ) ( not ( = ?auto_367328 ?auto_367334 ) ) ( not ( = ?auto_367328 ?auto_367335 ) ) ( not ( = ?auto_367328 ?auto_367336 ) ) ( not ( = ?auto_367328 ?auto_367337 ) ) ( not ( = ?auto_367328 ?auto_367338 ) ) ( not ( = ?auto_367329 ?auto_367330 ) ) ( not ( = ?auto_367329 ?auto_367331 ) ) ( not ( = ?auto_367329 ?auto_367332 ) ) ( not ( = ?auto_367329 ?auto_367333 ) ) ( not ( = ?auto_367329 ?auto_367334 ) ) ( not ( = ?auto_367329 ?auto_367335 ) ) ( not ( = ?auto_367329 ?auto_367336 ) ) ( not ( = ?auto_367329 ?auto_367337 ) ) ( not ( = ?auto_367329 ?auto_367338 ) ) ( not ( = ?auto_367330 ?auto_367331 ) ) ( not ( = ?auto_367330 ?auto_367332 ) ) ( not ( = ?auto_367330 ?auto_367333 ) ) ( not ( = ?auto_367330 ?auto_367334 ) ) ( not ( = ?auto_367330 ?auto_367335 ) ) ( not ( = ?auto_367330 ?auto_367336 ) ) ( not ( = ?auto_367330 ?auto_367337 ) ) ( not ( = ?auto_367330 ?auto_367338 ) ) ( not ( = ?auto_367331 ?auto_367332 ) ) ( not ( = ?auto_367331 ?auto_367333 ) ) ( not ( = ?auto_367331 ?auto_367334 ) ) ( not ( = ?auto_367331 ?auto_367335 ) ) ( not ( = ?auto_367331 ?auto_367336 ) ) ( not ( = ?auto_367331 ?auto_367337 ) ) ( not ( = ?auto_367331 ?auto_367338 ) ) ( not ( = ?auto_367332 ?auto_367333 ) ) ( not ( = ?auto_367332 ?auto_367334 ) ) ( not ( = ?auto_367332 ?auto_367335 ) ) ( not ( = ?auto_367332 ?auto_367336 ) ) ( not ( = ?auto_367332 ?auto_367337 ) ) ( not ( = ?auto_367332 ?auto_367338 ) ) ( not ( = ?auto_367333 ?auto_367334 ) ) ( not ( = ?auto_367333 ?auto_367335 ) ) ( not ( = ?auto_367333 ?auto_367336 ) ) ( not ( = ?auto_367333 ?auto_367337 ) ) ( not ( = ?auto_367333 ?auto_367338 ) ) ( not ( = ?auto_367334 ?auto_367335 ) ) ( not ( = ?auto_367334 ?auto_367336 ) ) ( not ( = ?auto_367334 ?auto_367337 ) ) ( not ( = ?auto_367334 ?auto_367338 ) ) ( not ( = ?auto_367335 ?auto_367336 ) ) ( not ( = ?auto_367335 ?auto_367337 ) ) ( not ( = ?auto_367335 ?auto_367338 ) ) ( not ( = ?auto_367336 ?auto_367337 ) ) ( not ( = ?auto_367336 ?auto_367338 ) ) ( not ( = ?auto_367337 ?auto_367338 ) ) ( ON ?auto_367336 ?auto_367337 ) ( ON ?auto_367335 ?auto_367336 ) ( ON ?auto_367334 ?auto_367335 ) ( ON ?auto_367333 ?auto_367334 ) ( ON ?auto_367332 ?auto_367333 ) ( CLEAR ?auto_367330 ) ( ON ?auto_367331 ?auto_367332 ) ( CLEAR ?auto_367331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_367328 ?auto_367329 ?auto_367330 ?auto_367331 )
      ( MAKE-10PILE ?auto_367328 ?auto_367329 ?auto_367330 ?auto_367331 ?auto_367332 ?auto_367333 ?auto_367334 ?auto_367335 ?auto_367336 ?auto_367337 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_367370 - BLOCK
      ?auto_367371 - BLOCK
      ?auto_367372 - BLOCK
      ?auto_367373 - BLOCK
      ?auto_367374 - BLOCK
      ?auto_367375 - BLOCK
      ?auto_367376 - BLOCK
      ?auto_367377 - BLOCK
      ?auto_367378 - BLOCK
      ?auto_367379 - BLOCK
    )
    :vars
    (
      ?auto_367380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_367379 ?auto_367380 ) ( ON-TABLE ?auto_367370 ) ( ON ?auto_367371 ?auto_367370 ) ( not ( = ?auto_367370 ?auto_367371 ) ) ( not ( = ?auto_367370 ?auto_367372 ) ) ( not ( = ?auto_367370 ?auto_367373 ) ) ( not ( = ?auto_367370 ?auto_367374 ) ) ( not ( = ?auto_367370 ?auto_367375 ) ) ( not ( = ?auto_367370 ?auto_367376 ) ) ( not ( = ?auto_367370 ?auto_367377 ) ) ( not ( = ?auto_367370 ?auto_367378 ) ) ( not ( = ?auto_367370 ?auto_367379 ) ) ( not ( = ?auto_367370 ?auto_367380 ) ) ( not ( = ?auto_367371 ?auto_367372 ) ) ( not ( = ?auto_367371 ?auto_367373 ) ) ( not ( = ?auto_367371 ?auto_367374 ) ) ( not ( = ?auto_367371 ?auto_367375 ) ) ( not ( = ?auto_367371 ?auto_367376 ) ) ( not ( = ?auto_367371 ?auto_367377 ) ) ( not ( = ?auto_367371 ?auto_367378 ) ) ( not ( = ?auto_367371 ?auto_367379 ) ) ( not ( = ?auto_367371 ?auto_367380 ) ) ( not ( = ?auto_367372 ?auto_367373 ) ) ( not ( = ?auto_367372 ?auto_367374 ) ) ( not ( = ?auto_367372 ?auto_367375 ) ) ( not ( = ?auto_367372 ?auto_367376 ) ) ( not ( = ?auto_367372 ?auto_367377 ) ) ( not ( = ?auto_367372 ?auto_367378 ) ) ( not ( = ?auto_367372 ?auto_367379 ) ) ( not ( = ?auto_367372 ?auto_367380 ) ) ( not ( = ?auto_367373 ?auto_367374 ) ) ( not ( = ?auto_367373 ?auto_367375 ) ) ( not ( = ?auto_367373 ?auto_367376 ) ) ( not ( = ?auto_367373 ?auto_367377 ) ) ( not ( = ?auto_367373 ?auto_367378 ) ) ( not ( = ?auto_367373 ?auto_367379 ) ) ( not ( = ?auto_367373 ?auto_367380 ) ) ( not ( = ?auto_367374 ?auto_367375 ) ) ( not ( = ?auto_367374 ?auto_367376 ) ) ( not ( = ?auto_367374 ?auto_367377 ) ) ( not ( = ?auto_367374 ?auto_367378 ) ) ( not ( = ?auto_367374 ?auto_367379 ) ) ( not ( = ?auto_367374 ?auto_367380 ) ) ( not ( = ?auto_367375 ?auto_367376 ) ) ( not ( = ?auto_367375 ?auto_367377 ) ) ( not ( = ?auto_367375 ?auto_367378 ) ) ( not ( = ?auto_367375 ?auto_367379 ) ) ( not ( = ?auto_367375 ?auto_367380 ) ) ( not ( = ?auto_367376 ?auto_367377 ) ) ( not ( = ?auto_367376 ?auto_367378 ) ) ( not ( = ?auto_367376 ?auto_367379 ) ) ( not ( = ?auto_367376 ?auto_367380 ) ) ( not ( = ?auto_367377 ?auto_367378 ) ) ( not ( = ?auto_367377 ?auto_367379 ) ) ( not ( = ?auto_367377 ?auto_367380 ) ) ( not ( = ?auto_367378 ?auto_367379 ) ) ( not ( = ?auto_367378 ?auto_367380 ) ) ( not ( = ?auto_367379 ?auto_367380 ) ) ( ON ?auto_367378 ?auto_367379 ) ( ON ?auto_367377 ?auto_367378 ) ( ON ?auto_367376 ?auto_367377 ) ( ON ?auto_367375 ?auto_367376 ) ( ON ?auto_367374 ?auto_367375 ) ( ON ?auto_367373 ?auto_367374 ) ( CLEAR ?auto_367371 ) ( ON ?auto_367372 ?auto_367373 ) ( CLEAR ?auto_367372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_367370 ?auto_367371 ?auto_367372 )
      ( MAKE-10PILE ?auto_367370 ?auto_367371 ?auto_367372 ?auto_367373 ?auto_367374 ?auto_367375 ?auto_367376 ?auto_367377 ?auto_367378 ?auto_367379 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_367412 - BLOCK
      ?auto_367413 - BLOCK
      ?auto_367414 - BLOCK
      ?auto_367415 - BLOCK
      ?auto_367416 - BLOCK
      ?auto_367417 - BLOCK
      ?auto_367418 - BLOCK
      ?auto_367419 - BLOCK
      ?auto_367420 - BLOCK
      ?auto_367421 - BLOCK
    )
    :vars
    (
      ?auto_367422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_367421 ?auto_367422 ) ( ON-TABLE ?auto_367412 ) ( not ( = ?auto_367412 ?auto_367413 ) ) ( not ( = ?auto_367412 ?auto_367414 ) ) ( not ( = ?auto_367412 ?auto_367415 ) ) ( not ( = ?auto_367412 ?auto_367416 ) ) ( not ( = ?auto_367412 ?auto_367417 ) ) ( not ( = ?auto_367412 ?auto_367418 ) ) ( not ( = ?auto_367412 ?auto_367419 ) ) ( not ( = ?auto_367412 ?auto_367420 ) ) ( not ( = ?auto_367412 ?auto_367421 ) ) ( not ( = ?auto_367412 ?auto_367422 ) ) ( not ( = ?auto_367413 ?auto_367414 ) ) ( not ( = ?auto_367413 ?auto_367415 ) ) ( not ( = ?auto_367413 ?auto_367416 ) ) ( not ( = ?auto_367413 ?auto_367417 ) ) ( not ( = ?auto_367413 ?auto_367418 ) ) ( not ( = ?auto_367413 ?auto_367419 ) ) ( not ( = ?auto_367413 ?auto_367420 ) ) ( not ( = ?auto_367413 ?auto_367421 ) ) ( not ( = ?auto_367413 ?auto_367422 ) ) ( not ( = ?auto_367414 ?auto_367415 ) ) ( not ( = ?auto_367414 ?auto_367416 ) ) ( not ( = ?auto_367414 ?auto_367417 ) ) ( not ( = ?auto_367414 ?auto_367418 ) ) ( not ( = ?auto_367414 ?auto_367419 ) ) ( not ( = ?auto_367414 ?auto_367420 ) ) ( not ( = ?auto_367414 ?auto_367421 ) ) ( not ( = ?auto_367414 ?auto_367422 ) ) ( not ( = ?auto_367415 ?auto_367416 ) ) ( not ( = ?auto_367415 ?auto_367417 ) ) ( not ( = ?auto_367415 ?auto_367418 ) ) ( not ( = ?auto_367415 ?auto_367419 ) ) ( not ( = ?auto_367415 ?auto_367420 ) ) ( not ( = ?auto_367415 ?auto_367421 ) ) ( not ( = ?auto_367415 ?auto_367422 ) ) ( not ( = ?auto_367416 ?auto_367417 ) ) ( not ( = ?auto_367416 ?auto_367418 ) ) ( not ( = ?auto_367416 ?auto_367419 ) ) ( not ( = ?auto_367416 ?auto_367420 ) ) ( not ( = ?auto_367416 ?auto_367421 ) ) ( not ( = ?auto_367416 ?auto_367422 ) ) ( not ( = ?auto_367417 ?auto_367418 ) ) ( not ( = ?auto_367417 ?auto_367419 ) ) ( not ( = ?auto_367417 ?auto_367420 ) ) ( not ( = ?auto_367417 ?auto_367421 ) ) ( not ( = ?auto_367417 ?auto_367422 ) ) ( not ( = ?auto_367418 ?auto_367419 ) ) ( not ( = ?auto_367418 ?auto_367420 ) ) ( not ( = ?auto_367418 ?auto_367421 ) ) ( not ( = ?auto_367418 ?auto_367422 ) ) ( not ( = ?auto_367419 ?auto_367420 ) ) ( not ( = ?auto_367419 ?auto_367421 ) ) ( not ( = ?auto_367419 ?auto_367422 ) ) ( not ( = ?auto_367420 ?auto_367421 ) ) ( not ( = ?auto_367420 ?auto_367422 ) ) ( not ( = ?auto_367421 ?auto_367422 ) ) ( ON ?auto_367420 ?auto_367421 ) ( ON ?auto_367419 ?auto_367420 ) ( ON ?auto_367418 ?auto_367419 ) ( ON ?auto_367417 ?auto_367418 ) ( ON ?auto_367416 ?auto_367417 ) ( ON ?auto_367415 ?auto_367416 ) ( ON ?auto_367414 ?auto_367415 ) ( CLEAR ?auto_367412 ) ( ON ?auto_367413 ?auto_367414 ) ( CLEAR ?auto_367413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_367412 ?auto_367413 )
      ( MAKE-10PILE ?auto_367412 ?auto_367413 ?auto_367414 ?auto_367415 ?auto_367416 ?auto_367417 ?auto_367418 ?auto_367419 ?auto_367420 ?auto_367421 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_367454 - BLOCK
      ?auto_367455 - BLOCK
      ?auto_367456 - BLOCK
      ?auto_367457 - BLOCK
      ?auto_367458 - BLOCK
      ?auto_367459 - BLOCK
      ?auto_367460 - BLOCK
      ?auto_367461 - BLOCK
      ?auto_367462 - BLOCK
      ?auto_367463 - BLOCK
    )
    :vars
    (
      ?auto_367464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_367463 ?auto_367464 ) ( not ( = ?auto_367454 ?auto_367455 ) ) ( not ( = ?auto_367454 ?auto_367456 ) ) ( not ( = ?auto_367454 ?auto_367457 ) ) ( not ( = ?auto_367454 ?auto_367458 ) ) ( not ( = ?auto_367454 ?auto_367459 ) ) ( not ( = ?auto_367454 ?auto_367460 ) ) ( not ( = ?auto_367454 ?auto_367461 ) ) ( not ( = ?auto_367454 ?auto_367462 ) ) ( not ( = ?auto_367454 ?auto_367463 ) ) ( not ( = ?auto_367454 ?auto_367464 ) ) ( not ( = ?auto_367455 ?auto_367456 ) ) ( not ( = ?auto_367455 ?auto_367457 ) ) ( not ( = ?auto_367455 ?auto_367458 ) ) ( not ( = ?auto_367455 ?auto_367459 ) ) ( not ( = ?auto_367455 ?auto_367460 ) ) ( not ( = ?auto_367455 ?auto_367461 ) ) ( not ( = ?auto_367455 ?auto_367462 ) ) ( not ( = ?auto_367455 ?auto_367463 ) ) ( not ( = ?auto_367455 ?auto_367464 ) ) ( not ( = ?auto_367456 ?auto_367457 ) ) ( not ( = ?auto_367456 ?auto_367458 ) ) ( not ( = ?auto_367456 ?auto_367459 ) ) ( not ( = ?auto_367456 ?auto_367460 ) ) ( not ( = ?auto_367456 ?auto_367461 ) ) ( not ( = ?auto_367456 ?auto_367462 ) ) ( not ( = ?auto_367456 ?auto_367463 ) ) ( not ( = ?auto_367456 ?auto_367464 ) ) ( not ( = ?auto_367457 ?auto_367458 ) ) ( not ( = ?auto_367457 ?auto_367459 ) ) ( not ( = ?auto_367457 ?auto_367460 ) ) ( not ( = ?auto_367457 ?auto_367461 ) ) ( not ( = ?auto_367457 ?auto_367462 ) ) ( not ( = ?auto_367457 ?auto_367463 ) ) ( not ( = ?auto_367457 ?auto_367464 ) ) ( not ( = ?auto_367458 ?auto_367459 ) ) ( not ( = ?auto_367458 ?auto_367460 ) ) ( not ( = ?auto_367458 ?auto_367461 ) ) ( not ( = ?auto_367458 ?auto_367462 ) ) ( not ( = ?auto_367458 ?auto_367463 ) ) ( not ( = ?auto_367458 ?auto_367464 ) ) ( not ( = ?auto_367459 ?auto_367460 ) ) ( not ( = ?auto_367459 ?auto_367461 ) ) ( not ( = ?auto_367459 ?auto_367462 ) ) ( not ( = ?auto_367459 ?auto_367463 ) ) ( not ( = ?auto_367459 ?auto_367464 ) ) ( not ( = ?auto_367460 ?auto_367461 ) ) ( not ( = ?auto_367460 ?auto_367462 ) ) ( not ( = ?auto_367460 ?auto_367463 ) ) ( not ( = ?auto_367460 ?auto_367464 ) ) ( not ( = ?auto_367461 ?auto_367462 ) ) ( not ( = ?auto_367461 ?auto_367463 ) ) ( not ( = ?auto_367461 ?auto_367464 ) ) ( not ( = ?auto_367462 ?auto_367463 ) ) ( not ( = ?auto_367462 ?auto_367464 ) ) ( not ( = ?auto_367463 ?auto_367464 ) ) ( ON ?auto_367462 ?auto_367463 ) ( ON ?auto_367461 ?auto_367462 ) ( ON ?auto_367460 ?auto_367461 ) ( ON ?auto_367459 ?auto_367460 ) ( ON ?auto_367458 ?auto_367459 ) ( ON ?auto_367457 ?auto_367458 ) ( ON ?auto_367456 ?auto_367457 ) ( ON ?auto_367455 ?auto_367456 ) ( ON ?auto_367454 ?auto_367455 ) ( CLEAR ?auto_367454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_367454 )
      ( MAKE-10PILE ?auto_367454 ?auto_367455 ?auto_367456 ?auto_367457 ?auto_367458 ?auto_367459 ?auto_367460 ?auto_367461 ?auto_367462 ?auto_367463 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_367497 - BLOCK
      ?auto_367498 - BLOCK
      ?auto_367499 - BLOCK
      ?auto_367500 - BLOCK
      ?auto_367501 - BLOCK
      ?auto_367502 - BLOCK
      ?auto_367503 - BLOCK
      ?auto_367504 - BLOCK
      ?auto_367505 - BLOCK
      ?auto_367506 - BLOCK
      ?auto_367507 - BLOCK
    )
    :vars
    (
      ?auto_367508 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_367506 ) ( ON ?auto_367507 ?auto_367508 ) ( CLEAR ?auto_367507 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_367497 ) ( ON ?auto_367498 ?auto_367497 ) ( ON ?auto_367499 ?auto_367498 ) ( ON ?auto_367500 ?auto_367499 ) ( ON ?auto_367501 ?auto_367500 ) ( ON ?auto_367502 ?auto_367501 ) ( ON ?auto_367503 ?auto_367502 ) ( ON ?auto_367504 ?auto_367503 ) ( ON ?auto_367505 ?auto_367504 ) ( ON ?auto_367506 ?auto_367505 ) ( not ( = ?auto_367497 ?auto_367498 ) ) ( not ( = ?auto_367497 ?auto_367499 ) ) ( not ( = ?auto_367497 ?auto_367500 ) ) ( not ( = ?auto_367497 ?auto_367501 ) ) ( not ( = ?auto_367497 ?auto_367502 ) ) ( not ( = ?auto_367497 ?auto_367503 ) ) ( not ( = ?auto_367497 ?auto_367504 ) ) ( not ( = ?auto_367497 ?auto_367505 ) ) ( not ( = ?auto_367497 ?auto_367506 ) ) ( not ( = ?auto_367497 ?auto_367507 ) ) ( not ( = ?auto_367497 ?auto_367508 ) ) ( not ( = ?auto_367498 ?auto_367499 ) ) ( not ( = ?auto_367498 ?auto_367500 ) ) ( not ( = ?auto_367498 ?auto_367501 ) ) ( not ( = ?auto_367498 ?auto_367502 ) ) ( not ( = ?auto_367498 ?auto_367503 ) ) ( not ( = ?auto_367498 ?auto_367504 ) ) ( not ( = ?auto_367498 ?auto_367505 ) ) ( not ( = ?auto_367498 ?auto_367506 ) ) ( not ( = ?auto_367498 ?auto_367507 ) ) ( not ( = ?auto_367498 ?auto_367508 ) ) ( not ( = ?auto_367499 ?auto_367500 ) ) ( not ( = ?auto_367499 ?auto_367501 ) ) ( not ( = ?auto_367499 ?auto_367502 ) ) ( not ( = ?auto_367499 ?auto_367503 ) ) ( not ( = ?auto_367499 ?auto_367504 ) ) ( not ( = ?auto_367499 ?auto_367505 ) ) ( not ( = ?auto_367499 ?auto_367506 ) ) ( not ( = ?auto_367499 ?auto_367507 ) ) ( not ( = ?auto_367499 ?auto_367508 ) ) ( not ( = ?auto_367500 ?auto_367501 ) ) ( not ( = ?auto_367500 ?auto_367502 ) ) ( not ( = ?auto_367500 ?auto_367503 ) ) ( not ( = ?auto_367500 ?auto_367504 ) ) ( not ( = ?auto_367500 ?auto_367505 ) ) ( not ( = ?auto_367500 ?auto_367506 ) ) ( not ( = ?auto_367500 ?auto_367507 ) ) ( not ( = ?auto_367500 ?auto_367508 ) ) ( not ( = ?auto_367501 ?auto_367502 ) ) ( not ( = ?auto_367501 ?auto_367503 ) ) ( not ( = ?auto_367501 ?auto_367504 ) ) ( not ( = ?auto_367501 ?auto_367505 ) ) ( not ( = ?auto_367501 ?auto_367506 ) ) ( not ( = ?auto_367501 ?auto_367507 ) ) ( not ( = ?auto_367501 ?auto_367508 ) ) ( not ( = ?auto_367502 ?auto_367503 ) ) ( not ( = ?auto_367502 ?auto_367504 ) ) ( not ( = ?auto_367502 ?auto_367505 ) ) ( not ( = ?auto_367502 ?auto_367506 ) ) ( not ( = ?auto_367502 ?auto_367507 ) ) ( not ( = ?auto_367502 ?auto_367508 ) ) ( not ( = ?auto_367503 ?auto_367504 ) ) ( not ( = ?auto_367503 ?auto_367505 ) ) ( not ( = ?auto_367503 ?auto_367506 ) ) ( not ( = ?auto_367503 ?auto_367507 ) ) ( not ( = ?auto_367503 ?auto_367508 ) ) ( not ( = ?auto_367504 ?auto_367505 ) ) ( not ( = ?auto_367504 ?auto_367506 ) ) ( not ( = ?auto_367504 ?auto_367507 ) ) ( not ( = ?auto_367504 ?auto_367508 ) ) ( not ( = ?auto_367505 ?auto_367506 ) ) ( not ( = ?auto_367505 ?auto_367507 ) ) ( not ( = ?auto_367505 ?auto_367508 ) ) ( not ( = ?auto_367506 ?auto_367507 ) ) ( not ( = ?auto_367506 ?auto_367508 ) ) ( not ( = ?auto_367507 ?auto_367508 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_367507 ?auto_367508 )
      ( !STACK ?auto_367507 ?auto_367506 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_367543 - BLOCK
      ?auto_367544 - BLOCK
      ?auto_367545 - BLOCK
      ?auto_367546 - BLOCK
      ?auto_367547 - BLOCK
      ?auto_367548 - BLOCK
      ?auto_367549 - BLOCK
      ?auto_367550 - BLOCK
      ?auto_367551 - BLOCK
      ?auto_367552 - BLOCK
      ?auto_367553 - BLOCK
    )
    :vars
    (
      ?auto_367554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_367553 ?auto_367554 ) ( ON-TABLE ?auto_367543 ) ( ON ?auto_367544 ?auto_367543 ) ( ON ?auto_367545 ?auto_367544 ) ( ON ?auto_367546 ?auto_367545 ) ( ON ?auto_367547 ?auto_367546 ) ( ON ?auto_367548 ?auto_367547 ) ( ON ?auto_367549 ?auto_367548 ) ( ON ?auto_367550 ?auto_367549 ) ( ON ?auto_367551 ?auto_367550 ) ( not ( = ?auto_367543 ?auto_367544 ) ) ( not ( = ?auto_367543 ?auto_367545 ) ) ( not ( = ?auto_367543 ?auto_367546 ) ) ( not ( = ?auto_367543 ?auto_367547 ) ) ( not ( = ?auto_367543 ?auto_367548 ) ) ( not ( = ?auto_367543 ?auto_367549 ) ) ( not ( = ?auto_367543 ?auto_367550 ) ) ( not ( = ?auto_367543 ?auto_367551 ) ) ( not ( = ?auto_367543 ?auto_367552 ) ) ( not ( = ?auto_367543 ?auto_367553 ) ) ( not ( = ?auto_367543 ?auto_367554 ) ) ( not ( = ?auto_367544 ?auto_367545 ) ) ( not ( = ?auto_367544 ?auto_367546 ) ) ( not ( = ?auto_367544 ?auto_367547 ) ) ( not ( = ?auto_367544 ?auto_367548 ) ) ( not ( = ?auto_367544 ?auto_367549 ) ) ( not ( = ?auto_367544 ?auto_367550 ) ) ( not ( = ?auto_367544 ?auto_367551 ) ) ( not ( = ?auto_367544 ?auto_367552 ) ) ( not ( = ?auto_367544 ?auto_367553 ) ) ( not ( = ?auto_367544 ?auto_367554 ) ) ( not ( = ?auto_367545 ?auto_367546 ) ) ( not ( = ?auto_367545 ?auto_367547 ) ) ( not ( = ?auto_367545 ?auto_367548 ) ) ( not ( = ?auto_367545 ?auto_367549 ) ) ( not ( = ?auto_367545 ?auto_367550 ) ) ( not ( = ?auto_367545 ?auto_367551 ) ) ( not ( = ?auto_367545 ?auto_367552 ) ) ( not ( = ?auto_367545 ?auto_367553 ) ) ( not ( = ?auto_367545 ?auto_367554 ) ) ( not ( = ?auto_367546 ?auto_367547 ) ) ( not ( = ?auto_367546 ?auto_367548 ) ) ( not ( = ?auto_367546 ?auto_367549 ) ) ( not ( = ?auto_367546 ?auto_367550 ) ) ( not ( = ?auto_367546 ?auto_367551 ) ) ( not ( = ?auto_367546 ?auto_367552 ) ) ( not ( = ?auto_367546 ?auto_367553 ) ) ( not ( = ?auto_367546 ?auto_367554 ) ) ( not ( = ?auto_367547 ?auto_367548 ) ) ( not ( = ?auto_367547 ?auto_367549 ) ) ( not ( = ?auto_367547 ?auto_367550 ) ) ( not ( = ?auto_367547 ?auto_367551 ) ) ( not ( = ?auto_367547 ?auto_367552 ) ) ( not ( = ?auto_367547 ?auto_367553 ) ) ( not ( = ?auto_367547 ?auto_367554 ) ) ( not ( = ?auto_367548 ?auto_367549 ) ) ( not ( = ?auto_367548 ?auto_367550 ) ) ( not ( = ?auto_367548 ?auto_367551 ) ) ( not ( = ?auto_367548 ?auto_367552 ) ) ( not ( = ?auto_367548 ?auto_367553 ) ) ( not ( = ?auto_367548 ?auto_367554 ) ) ( not ( = ?auto_367549 ?auto_367550 ) ) ( not ( = ?auto_367549 ?auto_367551 ) ) ( not ( = ?auto_367549 ?auto_367552 ) ) ( not ( = ?auto_367549 ?auto_367553 ) ) ( not ( = ?auto_367549 ?auto_367554 ) ) ( not ( = ?auto_367550 ?auto_367551 ) ) ( not ( = ?auto_367550 ?auto_367552 ) ) ( not ( = ?auto_367550 ?auto_367553 ) ) ( not ( = ?auto_367550 ?auto_367554 ) ) ( not ( = ?auto_367551 ?auto_367552 ) ) ( not ( = ?auto_367551 ?auto_367553 ) ) ( not ( = ?auto_367551 ?auto_367554 ) ) ( not ( = ?auto_367552 ?auto_367553 ) ) ( not ( = ?auto_367552 ?auto_367554 ) ) ( not ( = ?auto_367553 ?auto_367554 ) ) ( CLEAR ?auto_367551 ) ( ON ?auto_367552 ?auto_367553 ) ( CLEAR ?auto_367552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_367543 ?auto_367544 ?auto_367545 ?auto_367546 ?auto_367547 ?auto_367548 ?auto_367549 ?auto_367550 ?auto_367551 ?auto_367552 )
      ( MAKE-11PILE ?auto_367543 ?auto_367544 ?auto_367545 ?auto_367546 ?auto_367547 ?auto_367548 ?auto_367549 ?auto_367550 ?auto_367551 ?auto_367552 ?auto_367553 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_367589 - BLOCK
      ?auto_367590 - BLOCK
      ?auto_367591 - BLOCK
      ?auto_367592 - BLOCK
      ?auto_367593 - BLOCK
      ?auto_367594 - BLOCK
      ?auto_367595 - BLOCK
      ?auto_367596 - BLOCK
      ?auto_367597 - BLOCK
      ?auto_367598 - BLOCK
      ?auto_367599 - BLOCK
    )
    :vars
    (
      ?auto_367600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_367599 ?auto_367600 ) ( ON-TABLE ?auto_367589 ) ( ON ?auto_367590 ?auto_367589 ) ( ON ?auto_367591 ?auto_367590 ) ( ON ?auto_367592 ?auto_367591 ) ( ON ?auto_367593 ?auto_367592 ) ( ON ?auto_367594 ?auto_367593 ) ( ON ?auto_367595 ?auto_367594 ) ( ON ?auto_367596 ?auto_367595 ) ( not ( = ?auto_367589 ?auto_367590 ) ) ( not ( = ?auto_367589 ?auto_367591 ) ) ( not ( = ?auto_367589 ?auto_367592 ) ) ( not ( = ?auto_367589 ?auto_367593 ) ) ( not ( = ?auto_367589 ?auto_367594 ) ) ( not ( = ?auto_367589 ?auto_367595 ) ) ( not ( = ?auto_367589 ?auto_367596 ) ) ( not ( = ?auto_367589 ?auto_367597 ) ) ( not ( = ?auto_367589 ?auto_367598 ) ) ( not ( = ?auto_367589 ?auto_367599 ) ) ( not ( = ?auto_367589 ?auto_367600 ) ) ( not ( = ?auto_367590 ?auto_367591 ) ) ( not ( = ?auto_367590 ?auto_367592 ) ) ( not ( = ?auto_367590 ?auto_367593 ) ) ( not ( = ?auto_367590 ?auto_367594 ) ) ( not ( = ?auto_367590 ?auto_367595 ) ) ( not ( = ?auto_367590 ?auto_367596 ) ) ( not ( = ?auto_367590 ?auto_367597 ) ) ( not ( = ?auto_367590 ?auto_367598 ) ) ( not ( = ?auto_367590 ?auto_367599 ) ) ( not ( = ?auto_367590 ?auto_367600 ) ) ( not ( = ?auto_367591 ?auto_367592 ) ) ( not ( = ?auto_367591 ?auto_367593 ) ) ( not ( = ?auto_367591 ?auto_367594 ) ) ( not ( = ?auto_367591 ?auto_367595 ) ) ( not ( = ?auto_367591 ?auto_367596 ) ) ( not ( = ?auto_367591 ?auto_367597 ) ) ( not ( = ?auto_367591 ?auto_367598 ) ) ( not ( = ?auto_367591 ?auto_367599 ) ) ( not ( = ?auto_367591 ?auto_367600 ) ) ( not ( = ?auto_367592 ?auto_367593 ) ) ( not ( = ?auto_367592 ?auto_367594 ) ) ( not ( = ?auto_367592 ?auto_367595 ) ) ( not ( = ?auto_367592 ?auto_367596 ) ) ( not ( = ?auto_367592 ?auto_367597 ) ) ( not ( = ?auto_367592 ?auto_367598 ) ) ( not ( = ?auto_367592 ?auto_367599 ) ) ( not ( = ?auto_367592 ?auto_367600 ) ) ( not ( = ?auto_367593 ?auto_367594 ) ) ( not ( = ?auto_367593 ?auto_367595 ) ) ( not ( = ?auto_367593 ?auto_367596 ) ) ( not ( = ?auto_367593 ?auto_367597 ) ) ( not ( = ?auto_367593 ?auto_367598 ) ) ( not ( = ?auto_367593 ?auto_367599 ) ) ( not ( = ?auto_367593 ?auto_367600 ) ) ( not ( = ?auto_367594 ?auto_367595 ) ) ( not ( = ?auto_367594 ?auto_367596 ) ) ( not ( = ?auto_367594 ?auto_367597 ) ) ( not ( = ?auto_367594 ?auto_367598 ) ) ( not ( = ?auto_367594 ?auto_367599 ) ) ( not ( = ?auto_367594 ?auto_367600 ) ) ( not ( = ?auto_367595 ?auto_367596 ) ) ( not ( = ?auto_367595 ?auto_367597 ) ) ( not ( = ?auto_367595 ?auto_367598 ) ) ( not ( = ?auto_367595 ?auto_367599 ) ) ( not ( = ?auto_367595 ?auto_367600 ) ) ( not ( = ?auto_367596 ?auto_367597 ) ) ( not ( = ?auto_367596 ?auto_367598 ) ) ( not ( = ?auto_367596 ?auto_367599 ) ) ( not ( = ?auto_367596 ?auto_367600 ) ) ( not ( = ?auto_367597 ?auto_367598 ) ) ( not ( = ?auto_367597 ?auto_367599 ) ) ( not ( = ?auto_367597 ?auto_367600 ) ) ( not ( = ?auto_367598 ?auto_367599 ) ) ( not ( = ?auto_367598 ?auto_367600 ) ) ( not ( = ?auto_367599 ?auto_367600 ) ) ( ON ?auto_367598 ?auto_367599 ) ( CLEAR ?auto_367596 ) ( ON ?auto_367597 ?auto_367598 ) ( CLEAR ?auto_367597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_367589 ?auto_367590 ?auto_367591 ?auto_367592 ?auto_367593 ?auto_367594 ?auto_367595 ?auto_367596 ?auto_367597 )
      ( MAKE-11PILE ?auto_367589 ?auto_367590 ?auto_367591 ?auto_367592 ?auto_367593 ?auto_367594 ?auto_367595 ?auto_367596 ?auto_367597 ?auto_367598 ?auto_367599 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_367635 - BLOCK
      ?auto_367636 - BLOCK
      ?auto_367637 - BLOCK
      ?auto_367638 - BLOCK
      ?auto_367639 - BLOCK
      ?auto_367640 - BLOCK
      ?auto_367641 - BLOCK
      ?auto_367642 - BLOCK
      ?auto_367643 - BLOCK
      ?auto_367644 - BLOCK
      ?auto_367645 - BLOCK
    )
    :vars
    (
      ?auto_367646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_367645 ?auto_367646 ) ( ON-TABLE ?auto_367635 ) ( ON ?auto_367636 ?auto_367635 ) ( ON ?auto_367637 ?auto_367636 ) ( ON ?auto_367638 ?auto_367637 ) ( ON ?auto_367639 ?auto_367638 ) ( ON ?auto_367640 ?auto_367639 ) ( ON ?auto_367641 ?auto_367640 ) ( not ( = ?auto_367635 ?auto_367636 ) ) ( not ( = ?auto_367635 ?auto_367637 ) ) ( not ( = ?auto_367635 ?auto_367638 ) ) ( not ( = ?auto_367635 ?auto_367639 ) ) ( not ( = ?auto_367635 ?auto_367640 ) ) ( not ( = ?auto_367635 ?auto_367641 ) ) ( not ( = ?auto_367635 ?auto_367642 ) ) ( not ( = ?auto_367635 ?auto_367643 ) ) ( not ( = ?auto_367635 ?auto_367644 ) ) ( not ( = ?auto_367635 ?auto_367645 ) ) ( not ( = ?auto_367635 ?auto_367646 ) ) ( not ( = ?auto_367636 ?auto_367637 ) ) ( not ( = ?auto_367636 ?auto_367638 ) ) ( not ( = ?auto_367636 ?auto_367639 ) ) ( not ( = ?auto_367636 ?auto_367640 ) ) ( not ( = ?auto_367636 ?auto_367641 ) ) ( not ( = ?auto_367636 ?auto_367642 ) ) ( not ( = ?auto_367636 ?auto_367643 ) ) ( not ( = ?auto_367636 ?auto_367644 ) ) ( not ( = ?auto_367636 ?auto_367645 ) ) ( not ( = ?auto_367636 ?auto_367646 ) ) ( not ( = ?auto_367637 ?auto_367638 ) ) ( not ( = ?auto_367637 ?auto_367639 ) ) ( not ( = ?auto_367637 ?auto_367640 ) ) ( not ( = ?auto_367637 ?auto_367641 ) ) ( not ( = ?auto_367637 ?auto_367642 ) ) ( not ( = ?auto_367637 ?auto_367643 ) ) ( not ( = ?auto_367637 ?auto_367644 ) ) ( not ( = ?auto_367637 ?auto_367645 ) ) ( not ( = ?auto_367637 ?auto_367646 ) ) ( not ( = ?auto_367638 ?auto_367639 ) ) ( not ( = ?auto_367638 ?auto_367640 ) ) ( not ( = ?auto_367638 ?auto_367641 ) ) ( not ( = ?auto_367638 ?auto_367642 ) ) ( not ( = ?auto_367638 ?auto_367643 ) ) ( not ( = ?auto_367638 ?auto_367644 ) ) ( not ( = ?auto_367638 ?auto_367645 ) ) ( not ( = ?auto_367638 ?auto_367646 ) ) ( not ( = ?auto_367639 ?auto_367640 ) ) ( not ( = ?auto_367639 ?auto_367641 ) ) ( not ( = ?auto_367639 ?auto_367642 ) ) ( not ( = ?auto_367639 ?auto_367643 ) ) ( not ( = ?auto_367639 ?auto_367644 ) ) ( not ( = ?auto_367639 ?auto_367645 ) ) ( not ( = ?auto_367639 ?auto_367646 ) ) ( not ( = ?auto_367640 ?auto_367641 ) ) ( not ( = ?auto_367640 ?auto_367642 ) ) ( not ( = ?auto_367640 ?auto_367643 ) ) ( not ( = ?auto_367640 ?auto_367644 ) ) ( not ( = ?auto_367640 ?auto_367645 ) ) ( not ( = ?auto_367640 ?auto_367646 ) ) ( not ( = ?auto_367641 ?auto_367642 ) ) ( not ( = ?auto_367641 ?auto_367643 ) ) ( not ( = ?auto_367641 ?auto_367644 ) ) ( not ( = ?auto_367641 ?auto_367645 ) ) ( not ( = ?auto_367641 ?auto_367646 ) ) ( not ( = ?auto_367642 ?auto_367643 ) ) ( not ( = ?auto_367642 ?auto_367644 ) ) ( not ( = ?auto_367642 ?auto_367645 ) ) ( not ( = ?auto_367642 ?auto_367646 ) ) ( not ( = ?auto_367643 ?auto_367644 ) ) ( not ( = ?auto_367643 ?auto_367645 ) ) ( not ( = ?auto_367643 ?auto_367646 ) ) ( not ( = ?auto_367644 ?auto_367645 ) ) ( not ( = ?auto_367644 ?auto_367646 ) ) ( not ( = ?auto_367645 ?auto_367646 ) ) ( ON ?auto_367644 ?auto_367645 ) ( ON ?auto_367643 ?auto_367644 ) ( CLEAR ?auto_367641 ) ( ON ?auto_367642 ?auto_367643 ) ( CLEAR ?auto_367642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_367635 ?auto_367636 ?auto_367637 ?auto_367638 ?auto_367639 ?auto_367640 ?auto_367641 ?auto_367642 )
      ( MAKE-11PILE ?auto_367635 ?auto_367636 ?auto_367637 ?auto_367638 ?auto_367639 ?auto_367640 ?auto_367641 ?auto_367642 ?auto_367643 ?auto_367644 ?auto_367645 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_367681 - BLOCK
      ?auto_367682 - BLOCK
      ?auto_367683 - BLOCK
      ?auto_367684 - BLOCK
      ?auto_367685 - BLOCK
      ?auto_367686 - BLOCK
      ?auto_367687 - BLOCK
      ?auto_367688 - BLOCK
      ?auto_367689 - BLOCK
      ?auto_367690 - BLOCK
      ?auto_367691 - BLOCK
    )
    :vars
    (
      ?auto_367692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_367691 ?auto_367692 ) ( ON-TABLE ?auto_367681 ) ( ON ?auto_367682 ?auto_367681 ) ( ON ?auto_367683 ?auto_367682 ) ( ON ?auto_367684 ?auto_367683 ) ( ON ?auto_367685 ?auto_367684 ) ( ON ?auto_367686 ?auto_367685 ) ( not ( = ?auto_367681 ?auto_367682 ) ) ( not ( = ?auto_367681 ?auto_367683 ) ) ( not ( = ?auto_367681 ?auto_367684 ) ) ( not ( = ?auto_367681 ?auto_367685 ) ) ( not ( = ?auto_367681 ?auto_367686 ) ) ( not ( = ?auto_367681 ?auto_367687 ) ) ( not ( = ?auto_367681 ?auto_367688 ) ) ( not ( = ?auto_367681 ?auto_367689 ) ) ( not ( = ?auto_367681 ?auto_367690 ) ) ( not ( = ?auto_367681 ?auto_367691 ) ) ( not ( = ?auto_367681 ?auto_367692 ) ) ( not ( = ?auto_367682 ?auto_367683 ) ) ( not ( = ?auto_367682 ?auto_367684 ) ) ( not ( = ?auto_367682 ?auto_367685 ) ) ( not ( = ?auto_367682 ?auto_367686 ) ) ( not ( = ?auto_367682 ?auto_367687 ) ) ( not ( = ?auto_367682 ?auto_367688 ) ) ( not ( = ?auto_367682 ?auto_367689 ) ) ( not ( = ?auto_367682 ?auto_367690 ) ) ( not ( = ?auto_367682 ?auto_367691 ) ) ( not ( = ?auto_367682 ?auto_367692 ) ) ( not ( = ?auto_367683 ?auto_367684 ) ) ( not ( = ?auto_367683 ?auto_367685 ) ) ( not ( = ?auto_367683 ?auto_367686 ) ) ( not ( = ?auto_367683 ?auto_367687 ) ) ( not ( = ?auto_367683 ?auto_367688 ) ) ( not ( = ?auto_367683 ?auto_367689 ) ) ( not ( = ?auto_367683 ?auto_367690 ) ) ( not ( = ?auto_367683 ?auto_367691 ) ) ( not ( = ?auto_367683 ?auto_367692 ) ) ( not ( = ?auto_367684 ?auto_367685 ) ) ( not ( = ?auto_367684 ?auto_367686 ) ) ( not ( = ?auto_367684 ?auto_367687 ) ) ( not ( = ?auto_367684 ?auto_367688 ) ) ( not ( = ?auto_367684 ?auto_367689 ) ) ( not ( = ?auto_367684 ?auto_367690 ) ) ( not ( = ?auto_367684 ?auto_367691 ) ) ( not ( = ?auto_367684 ?auto_367692 ) ) ( not ( = ?auto_367685 ?auto_367686 ) ) ( not ( = ?auto_367685 ?auto_367687 ) ) ( not ( = ?auto_367685 ?auto_367688 ) ) ( not ( = ?auto_367685 ?auto_367689 ) ) ( not ( = ?auto_367685 ?auto_367690 ) ) ( not ( = ?auto_367685 ?auto_367691 ) ) ( not ( = ?auto_367685 ?auto_367692 ) ) ( not ( = ?auto_367686 ?auto_367687 ) ) ( not ( = ?auto_367686 ?auto_367688 ) ) ( not ( = ?auto_367686 ?auto_367689 ) ) ( not ( = ?auto_367686 ?auto_367690 ) ) ( not ( = ?auto_367686 ?auto_367691 ) ) ( not ( = ?auto_367686 ?auto_367692 ) ) ( not ( = ?auto_367687 ?auto_367688 ) ) ( not ( = ?auto_367687 ?auto_367689 ) ) ( not ( = ?auto_367687 ?auto_367690 ) ) ( not ( = ?auto_367687 ?auto_367691 ) ) ( not ( = ?auto_367687 ?auto_367692 ) ) ( not ( = ?auto_367688 ?auto_367689 ) ) ( not ( = ?auto_367688 ?auto_367690 ) ) ( not ( = ?auto_367688 ?auto_367691 ) ) ( not ( = ?auto_367688 ?auto_367692 ) ) ( not ( = ?auto_367689 ?auto_367690 ) ) ( not ( = ?auto_367689 ?auto_367691 ) ) ( not ( = ?auto_367689 ?auto_367692 ) ) ( not ( = ?auto_367690 ?auto_367691 ) ) ( not ( = ?auto_367690 ?auto_367692 ) ) ( not ( = ?auto_367691 ?auto_367692 ) ) ( ON ?auto_367690 ?auto_367691 ) ( ON ?auto_367689 ?auto_367690 ) ( ON ?auto_367688 ?auto_367689 ) ( CLEAR ?auto_367686 ) ( ON ?auto_367687 ?auto_367688 ) ( CLEAR ?auto_367687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_367681 ?auto_367682 ?auto_367683 ?auto_367684 ?auto_367685 ?auto_367686 ?auto_367687 )
      ( MAKE-11PILE ?auto_367681 ?auto_367682 ?auto_367683 ?auto_367684 ?auto_367685 ?auto_367686 ?auto_367687 ?auto_367688 ?auto_367689 ?auto_367690 ?auto_367691 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_367727 - BLOCK
      ?auto_367728 - BLOCK
      ?auto_367729 - BLOCK
      ?auto_367730 - BLOCK
      ?auto_367731 - BLOCK
      ?auto_367732 - BLOCK
      ?auto_367733 - BLOCK
      ?auto_367734 - BLOCK
      ?auto_367735 - BLOCK
      ?auto_367736 - BLOCK
      ?auto_367737 - BLOCK
    )
    :vars
    (
      ?auto_367738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_367737 ?auto_367738 ) ( ON-TABLE ?auto_367727 ) ( ON ?auto_367728 ?auto_367727 ) ( ON ?auto_367729 ?auto_367728 ) ( ON ?auto_367730 ?auto_367729 ) ( ON ?auto_367731 ?auto_367730 ) ( not ( = ?auto_367727 ?auto_367728 ) ) ( not ( = ?auto_367727 ?auto_367729 ) ) ( not ( = ?auto_367727 ?auto_367730 ) ) ( not ( = ?auto_367727 ?auto_367731 ) ) ( not ( = ?auto_367727 ?auto_367732 ) ) ( not ( = ?auto_367727 ?auto_367733 ) ) ( not ( = ?auto_367727 ?auto_367734 ) ) ( not ( = ?auto_367727 ?auto_367735 ) ) ( not ( = ?auto_367727 ?auto_367736 ) ) ( not ( = ?auto_367727 ?auto_367737 ) ) ( not ( = ?auto_367727 ?auto_367738 ) ) ( not ( = ?auto_367728 ?auto_367729 ) ) ( not ( = ?auto_367728 ?auto_367730 ) ) ( not ( = ?auto_367728 ?auto_367731 ) ) ( not ( = ?auto_367728 ?auto_367732 ) ) ( not ( = ?auto_367728 ?auto_367733 ) ) ( not ( = ?auto_367728 ?auto_367734 ) ) ( not ( = ?auto_367728 ?auto_367735 ) ) ( not ( = ?auto_367728 ?auto_367736 ) ) ( not ( = ?auto_367728 ?auto_367737 ) ) ( not ( = ?auto_367728 ?auto_367738 ) ) ( not ( = ?auto_367729 ?auto_367730 ) ) ( not ( = ?auto_367729 ?auto_367731 ) ) ( not ( = ?auto_367729 ?auto_367732 ) ) ( not ( = ?auto_367729 ?auto_367733 ) ) ( not ( = ?auto_367729 ?auto_367734 ) ) ( not ( = ?auto_367729 ?auto_367735 ) ) ( not ( = ?auto_367729 ?auto_367736 ) ) ( not ( = ?auto_367729 ?auto_367737 ) ) ( not ( = ?auto_367729 ?auto_367738 ) ) ( not ( = ?auto_367730 ?auto_367731 ) ) ( not ( = ?auto_367730 ?auto_367732 ) ) ( not ( = ?auto_367730 ?auto_367733 ) ) ( not ( = ?auto_367730 ?auto_367734 ) ) ( not ( = ?auto_367730 ?auto_367735 ) ) ( not ( = ?auto_367730 ?auto_367736 ) ) ( not ( = ?auto_367730 ?auto_367737 ) ) ( not ( = ?auto_367730 ?auto_367738 ) ) ( not ( = ?auto_367731 ?auto_367732 ) ) ( not ( = ?auto_367731 ?auto_367733 ) ) ( not ( = ?auto_367731 ?auto_367734 ) ) ( not ( = ?auto_367731 ?auto_367735 ) ) ( not ( = ?auto_367731 ?auto_367736 ) ) ( not ( = ?auto_367731 ?auto_367737 ) ) ( not ( = ?auto_367731 ?auto_367738 ) ) ( not ( = ?auto_367732 ?auto_367733 ) ) ( not ( = ?auto_367732 ?auto_367734 ) ) ( not ( = ?auto_367732 ?auto_367735 ) ) ( not ( = ?auto_367732 ?auto_367736 ) ) ( not ( = ?auto_367732 ?auto_367737 ) ) ( not ( = ?auto_367732 ?auto_367738 ) ) ( not ( = ?auto_367733 ?auto_367734 ) ) ( not ( = ?auto_367733 ?auto_367735 ) ) ( not ( = ?auto_367733 ?auto_367736 ) ) ( not ( = ?auto_367733 ?auto_367737 ) ) ( not ( = ?auto_367733 ?auto_367738 ) ) ( not ( = ?auto_367734 ?auto_367735 ) ) ( not ( = ?auto_367734 ?auto_367736 ) ) ( not ( = ?auto_367734 ?auto_367737 ) ) ( not ( = ?auto_367734 ?auto_367738 ) ) ( not ( = ?auto_367735 ?auto_367736 ) ) ( not ( = ?auto_367735 ?auto_367737 ) ) ( not ( = ?auto_367735 ?auto_367738 ) ) ( not ( = ?auto_367736 ?auto_367737 ) ) ( not ( = ?auto_367736 ?auto_367738 ) ) ( not ( = ?auto_367737 ?auto_367738 ) ) ( ON ?auto_367736 ?auto_367737 ) ( ON ?auto_367735 ?auto_367736 ) ( ON ?auto_367734 ?auto_367735 ) ( ON ?auto_367733 ?auto_367734 ) ( CLEAR ?auto_367731 ) ( ON ?auto_367732 ?auto_367733 ) ( CLEAR ?auto_367732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_367727 ?auto_367728 ?auto_367729 ?auto_367730 ?auto_367731 ?auto_367732 )
      ( MAKE-11PILE ?auto_367727 ?auto_367728 ?auto_367729 ?auto_367730 ?auto_367731 ?auto_367732 ?auto_367733 ?auto_367734 ?auto_367735 ?auto_367736 ?auto_367737 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_367773 - BLOCK
      ?auto_367774 - BLOCK
      ?auto_367775 - BLOCK
      ?auto_367776 - BLOCK
      ?auto_367777 - BLOCK
      ?auto_367778 - BLOCK
      ?auto_367779 - BLOCK
      ?auto_367780 - BLOCK
      ?auto_367781 - BLOCK
      ?auto_367782 - BLOCK
      ?auto_367783 - BLOCK
    )
    :vars
    (
      ?auto_367784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_367783 ?auto_367784 ) ( ON-TABLE ?auto_367773 ) ( ON ?auto_367774 ?auto_367773 ) ( ON ?auto_367775 ?auto_367774 ) ( ON ?auto_367776 ?auto_367775 ) ( not ( = ?auto_367773 ?auto_367774 ) ) ( not ( = ?auto_367773 ?auto_367775 ) ) ( not ( = ?auto_367773 ?auto_367776 ) ) ( not ( = ?auto_367773 ?auto_367777 ) ) ( not ( = ?auto_367773 ?auto_367778 ) ) ( not ( = ?auto_367773 ?auto_367779 ) ) ( not ( = ?auto_367773 ?auto_367780 ) ) ( not ( = ?auto_367773 ?auto_367781 ) ) ( not ( = ?auto_367773 ?auto_367782 ) ) ( not ( = ?auto_367773 ?auto_367783 ) ) ( not ( = ?auto_367773 ?auto_367784 ) ) ( not ( = ?auto_367774 ?auto_367775 ) ) ( not ( = ?auto_367774 ?auto_367776 ) ) ( not ( = ?auto_367774 ?auto_367777 ) ) ( not ( = ?auto_367774 ?auto_367778 ) ) ( not ( = ?auto_367774 ?auto_367779 ) ) ( not ( = ?auto_367774 ?auto_367780 ) ) ( not ( = ?auto_367774 ?auto_367781 ) ) ( not ( = ?auto_367774 ?auto_367782 ) ) ( not ( = ?auto_367774 ?auto_367783 ) ) ( not ( = ?auto_367774 ?auto_367784 ) ) ( not ( = ?auto_367775 ?auto_367776 ) ) ( not ( = ?auto_367775 ?auto_367777 ) ) ( not ( = ?auto_367775 ?auto_367778 ) ) ( not ( = ?auto_367775 ?auto_367779 ) ) ( not ( = ?auto_367775 ?auto_367780 ) ) ( not ( = ?auto_367775 ?auto_367781 ) ) ( not ( = ?auto_367775 ?auto_367782 ) ) ( not ( = ?auto_367775 ?auto_367783 ) ) ( not ( = ?auto_367775 ?auto_367784 ) ) ( not ( = ?auto_367776 ?auto_367777 ) ) ( not ( = ?auto_367776 ?auto_367778 ) ) ( not ( = ?auto_367776 ?auto_367779 ) ) ( not ( = ?auto_367776 ?auto_367780 ) ) ( not ( = ?auto_367776 ?auto_367781 ) ) ( not ( = ?auto_367776 ?auto_367782 ) ) ( not ( = ?auto_367776 ?auto_367783 ) ) ( not ( = ?auto_367776 ?auto_367784 ) ) ( not ( = ?auto_367777 ?auto_367778 ) ) ( not ( = ?auto_367777 ?auto_367779 ) ) ( not ( = ?auto_367777 ?auto_367780 ) ) ( not ( = ?auto_367777 ?auto_367781 ) ) ( not ( = ?auto_367777 ?auto_367782 ) ) ( not ( = ?auto_367777 ?auto_367783 ) ) ( not ( = ?auto_367777 ?auto_367784 ) ) ( not ( = ?auto_367778 ?auto_367779 ) ) ( not ( = ?auto_367778 ?auto_367780 ) ) ( not ( = ?auto_367778 ?auto_367781 ) ) ( not ( = ?auto_367778 ?auto_367782 ) ) ( not ( = ?auto_367778 ?auto_367783 ) ) ( not ( = ?auto_367778 ?auto_367784 ) ) ( not ( = ?auto_367779 ?auto_367780 ) ) ( not ( = ?auto_367779 ?auto_367781 ) ) ( not ( = ?auto_367779 ?auto_367782 ) ) ( not ( = ?auto_367779 ?auto_367783 ) ) ( not ( = ?auto_367779 ?auto_367784 ) ) ( not ( = ?auto_367780 ?auto_367781 ) ) ( not ( = ?auto_367780 ?auto_367782 ) ) ( not ( = ?auto_367780 ?auto_367783 ) ) ( not ( = ?auto_367780 ?auto_367784 ) ) ( not ( = ?auto_367781 ?auto_367782 ) ) ( not ( = ?auto_367781 ?auto_367783 ) ) ( not ( = ?auto_367781 ?auto_367784 ) ) ( not ( = ?auto_367782 ?auto_367783 ) ) ( not ( = ?auto_367782 ?auto_367784 ) ) ( not ( = ?auto_367783 ?auto_367784 ) ) ( ON ?auto_367782 ?auto_367783 ) ( ON ?auto_367781 ?auto_367782 ) ( ON ?auto_367780 ?auto_367781 ) ( ON ?auto_367779 ?auto_367780 ) ( ON ?auto_367778 ?auto_367779 ) ( CLEAR ?auto_367776 ) ( ON ?auto_367777 ?auto_367778 ) ( CLEAR ?auto_367777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_367773 ?auto_367774 ?auto_367775 ?auto_367776 ?auto_367777 )
      ( MAKE-11PILE ?auto_367773 ?auto_367774 ?auto_367775 ?auto_367776 ?auto_367777 ?auto_367778 ?auto_367779 ?auto_367780 ?auto_367781 ?auto_367782 ?auto_367783 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_367819 - BLOCK
      ?auto_367820 - BLOCK
      ?auto_367821 - BLOCK
      ?auto_367822 - BLOCK
      ?auto_367823 - BLOCK
      ?auto_367824 - BLOCK
      ?auto_367825 - BLOCK
      ?auto_367826 - BLOCK
      ?auto_367827 - BLOCK
      ?auto_367828 - BLOCK
      ?auto_367829 - BLOCK
    )
    :vars
    (
      ?auto_367830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_367829 ?auto_367830 ) ( ON-TABLE ?auto_367819 ) ( ON ?auto_367820 ?auto_367819 ) ( ON ?auto_367821 ?auto_367820 ) ( not ( = ?auto_367819 ?auto_367820 ) ) ( not ( = ?auto_367819 ?auto_367821 ) ) ( not ( = ?auto_367819 ?auto_367822 ) ) ( not ( = ?auto_367819 ?auto_367823 ) ) ( not ( = ?auto_367819 ?auto_367824 ) ) ( not ( = ?auto_367819 ?auto_367825 ) ) ( not ( = ?auto_367819 ?auto_367826 ) ) ( not ( = ?auto_367819 ?auto_367827 ) ) ( not ( = ?auto_367819 ?auto_367828 ) ) ( not ( = ?auto_367819 ?auto_367829 ) ) ( not ( = ?auto_367819 ?auto_367830 ) ) ( not ( = ?auto_367820 ?auto_367821 ) ) ( not ( = ?auto_367820 ?auto_367822 ) ) ( not ( = ?auto_367820 ?auto_367823 ) ) ( not ( = ?auto_367820 ?auto_367824 ) ) ( not ( = ?auto_367820 ?auto_367825 ) ) ( not ( = ?auto_367820 ?auto_367826 ) ) ( not ( = ?auto_367820 ?auto_367827 ) ) ( not ( = ?auto_367820 ?auto_367828 ) ) ( not ( = ?auto_367820 ?auto_367829 ) ) ( not ( = ?auto_367820 ?auto_367830 ) ) ( not ( = ?auto_367821 ?auto_367822 ) ) ( not ( = ?auto_367821 ?auto_367823 ) ) ( not ( = ?auto_367821 ?auto_367824 ) ) ( not ( = ?auto_367821 ?auto_367825 ) ) ( not ( = ?auto_367821 ?auto_367826 ) ) ( not ( = ?auto_367821 ?auto_367827 ) ) ( not ( = ?auto_367821 ?auto_367828 ) ) ( not ( = ?auto_367821 ?auto_367829 ) ) ( not ( = ?auto_367821 ?auto_367830 ) ) ( not ( = ?auto_367822 ?auto_367823 ) ) ( not ( = ?auto_367822 ?auto_367824 ) ) ( not ( = ?auto_367822 ?auto_367825 ) ) ( not ( = ?auto_367822 ?auto_367826 ) ) ( not ( = ?auto_367822 ?auto_367827 ) ) ( not ( = ?auto_367822 ?auto_367828 ) ) ( not ( = ?auto_367822 ?auto_367829 ) ) ( not ( = ?auto_367822 ?auto_367830 ) ) ( not ( = ?auto_367823 ?auto_367824 ) ) ( not ( = ?auto_367823 ?auto_367825 ) ) ( not ( = ?auto_367823 ?auto_367826 ) ) ( not ( = ?auto_367823 ?auto_367827 ) ) ( not ( = ?auto_367823 ?auto_367828 ) ) ( not ( = ?auto_367823 ?auto_367829 ) ) ( not ( = ?auto_367823 ?auto_367830 ) ) ( not ( = ?auto_367824 ?auto_367825 ) ) ( not ( = ?auto_367824 ?auto_367826 ) ) ( not ( = ?auto_367824 ?auto_367827 ) ) ( not ( = ?auto_367824 ?auto_367828 ) ) ( not ( = ?auto_367824 ?auto_367829 ) ) ( not ( = ?auto_367824 ?auto_367830 ) ) ( not ( = ?auto_367825 ?auto_367826 ) ) ( not ( = ?auto_367825 ?auto_367827 ) ) ( not ( = ?auto_367825 ?auto_367828 ) ) ( not ( = ?auto_367825 ?auto_367829 ) ) ( not ( = ?auto_367825 ?auto_367830 ) ) ( not ( = ?auto_367826 ?auto_367827 ) ) ( not ( = ?auto_367826 ?auto_367828 ) ) ( not ( = ?auto_367826 ?auto_367829 ) ) ( not ( = ?auto_367826 ?auto_367830 ) ) ( not ( = ?auto_367827 ?auto_367828 ) ) ( not ( = ?auto_367827 ?auto_367829 ) ) ( not ( = ?auto_367827 ?auto_367830 ) ) ( not ( = ?auto_367828 ?auto_367829 ) ) ( not ( = ?auto_367828 ?auto_367830 ) ) ( not ( = ?auto_367829 ?auto_367830 ) ) ( ON ?auto_367828 ?auto_367829 ) ( ON ?auto_367827 ?auto_367828 ) ( ON ?auto_367826 ?auto_367827 ) ( ON ?auto_367825 ?auto_367826 ) ( ON ?auto_367824 ?auto_367825 ) ( ON ?auto_367823 ?auto_367824 ) ( CLEAR ?auto_367821 ) ( ON ?auto_367822 ?auto_367823 ) ( CLEAR ?auto_367822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_367819 ?auto_367820 ?auto_367821 ?auto_367822 )
      ( MAKE-11PILE ?auto_367819 ?auto_367820 ?auto_367821 ?auto_367822 ?auto_367823 ?auto_367824 ?auto_367825 ?auto_367826 ?auto_367827 ?auto_367828 ?auto_367829 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_367865 - BLOCK
      ?auto_367866 - BLOCK
      ?auto_367867 - BLOCK
      ?auto_367868 - BLOCK
      ?auto_367869 - BLOCK
      ?auto_367870 - BLOCK
      ?auto_367871 - BLOCK
      ?auto_367872 - BLOCK
      ?auto_367873 - BLOCK
      ?auto_367874 - BLOCK
      ?auto_367875 - BLOCK
    )
    :vars
    (
      ?auto_367876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_367875 ?auto_367876 ) ( ON-TABLE ?auto_367865 ) ( ON ?auto_367866 ?auto_367865 ) ( not ( = ?auto_367865 ?auto_367866 ) ) ( not ( = ?auto_367865 ?auto_367867 ) ) ( not ( = ?auto_367865 ?auto_367868 ) ) ( not ( = ?auto_367865 ?auto_367869 ) ) ( not ( = ?auto_367865 ?auto_367870 ) ) ( not ( = ?auto_367865 ?auto_367871 ) ) ( not ( = ?auto_367865 ?auto_367872 ) ) ( not ( = ?auto_367865 ?auto_367873 ) ) ( not ( = ?auto_367865 ?auto_367874 ) ) ( not ( = ?auto_367865 ?auto_367875 ) ) ( not ( = ?auto_367865 ?auto_367876 ) ) ( not ( = ?auto_367866 ?auto_367867 ) ) ( not ( = ?auto_367866 ?auto_367868 ) ) ( not ( = ?auto_367866 ?auto_367869 ) ) ( not ( = ?auto_367866 ?auto_367870 ) ) ( not ( = ?auto_367866 ?auto_367871 ) ) ( not ( = ?auto_367866 ?auto_367872 ) ) ( not ( = ?auto_367866 ?auto_367873 ) ) ( not ( = ?auto_367866 ?auto_367874 ) ) ( not ( = ?auto_367866 ?auto_367875 ) ) ( not ( = ?auto_367866 ?auto_367876 ) ) ( not ( = ?auto_367867 ?auto_367868 ) ) ( not ( = ?auto_367867 ?auto_367869 ) ) ( not ( = ?auto_367867 ?auto_367870 ) ) ( not ( = ?auto_367867 ?auto_367871 ) ) ( not ( = ?auto_367867 ?auto_367872 ) ) ( not ( = ?auto_367867 ?auto_367873 ) ) ( not ( = ?auto_367867 ?auto_367874 ) ) ( not ( = ?auto_367867 ?auto_367875 ) ) ( not ( = ?auto_367867 ?auto_367876 ) ) ( not ( = ?auto_367868 ?auto_367869 ) ) ( not ( = ?auto_367868 ?auto_367870 ) ) ( not ( = ?auto_367868 ?auto_367871 ) ) ( not ( = ?auto_367868 ?auto_367872 ) ) ( not ( = ?auto_367868 ?auto_367873 ) ) ( not ( = ?auto_367868 ?auto_367874 ) ) ( not ( = ?auto_367868 ?auto_367875 ) ) ( not ( = ?auto_367868 ?auto_367876 ) ) ( not ( = ?auto_367869 ?auto_367870 ) ) ( not ( = ?auto_367869 ?auto_367871 ) ) ( not ( = ?auto_367869 ?auto_367872 ) ) ( not ( = ?auto_367869 ?auto_367873 ) ) ( not ( = ?auto_367869 ?auto_367874 ) ) ( not ( = ?auto_367869 ?auto_367875 ) ) ( not ( = ?auto_367869 ?auto_367876 ) ) ( not ( = ?auto_367870 ?auto_367871 ) ) ( not ( = ?auto_367870 ?auto_367872 ) ) ( not ( = ?auto_367870 ?auto_367873 ) ) ( not ( = ?auto_367870 ?auto_367874 ) ) ( not ( = ?auto_367870 ?auto_367875 ) ) ( not ( = ?auto_367870 ?auto_367876 ) ) ( not ( = ?auto_367871 ?auto_367872 ) ) ( not ( = ?auto_367871 ?auto_367873 ) ) ( not ( = ?auto_367871 ?auto_367874 ) ) ( not ( = ?auto_367871 ?auto_367875 ) ) ( not ( = ?auto_367871 ?auto_367876 ) ) ( not ( = ?auto_367872 ?auto_367873 ) ) ( not ( = ?auto_367872 ?auto_367874 ) ) ( not ( = ?auto_367872 ?auto_367875 ) ) ( not ( = ?auto_367872 ?auto_367876 ) ) ( not ( = ?auto_367873 ?auto_367874 ) ) ( not ( = ?auto_367873 ?auto_367875 ) ) ( not ( = ?auto_367873 ?auto_367876 ) ) ( not ( = ?auto_367874 ?auto_367875 ) ) ( not ( = ?auto_367874 ?auto_367876 ) ) ( not ( = ?auto_367875 ?auto_367876 ) ) ( ON ?auto_367874 ?auto_367875 ) ( ON ?auto_367873 ?auto_367874 ) ( ON ?auto_367872 ?auto_367873 ) ( ON ?auto_367871 ?auto_367872 ) ( ON ?auto_367870 ?auto_367871 ) ( ON ?auto_367869 ?auto_367870 ) ( ON ?auto_367868 ?auto_367869 ) ( CLEAR ?auto_367866 ) ( ON ?auto_367867 ?auto_367868 ) ( CLEAR ?auto_367867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_367865 ?auto_367866 ?auto_367867 )
      ( MAKE-11PILE ?auto_367865 ?auto_367866 ?auto_367867 ?auto_367868 ?auto_367869 ?auto_367870 ?auto_367871 ?auto_367872 ?auto_367873 ?auto_367874 ?auto_367875 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_367911 - BLOCK
      ?auto_367912 - BLOCK
      ?auto_367913 - BLOCK
      ?auto_367914 - BLOCK
      ?auto_367915 - BLOCK
      ?auto_367916 - BLOCK
      ?auto_367917 - BLOCK
      ?auto_367918 - BLOCK
      ?auto_367919 - BLOCK
      ?auto_367920 - BLOCK
      ?auto_367921 - BLOCK
    )
    :vars
    (
      ?auto_367922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_367921 ?auto_367922 ) ( ON-TABLE ?auto_367911 ) ( not ( = ?auto_367911 ?auto_367912 ) ) ( not ( = ?auto_367911 ?auto_367913 ) ) ( not ( = ?auto_367911 ?auto_367914 ) ) ( not ( = ?auto_367911 ?auto_367915 ) ) ( not ( = ?auto_367911 ?auto_367916 ) ) ( not ( = ?auto_367911 ?auto_367917 ) ) ( not ( = ?auto_367911 ?auto_367918 ) ) ( not ( = ?auto_367911 ?auto_367919 ) ) ( not ( = ?auto_367911 ?auto_367920 ) ) ( not ( = ?auto_367911 ?auto_367921 ) ) ( not ( = ?auto_367911 ?auto_367922 ) ) ( not ( = ?auto_367912 ?auto_367913 ) ) ( not ( = ?auto_367912 ?auto_367914 ) ) ( not ( = ?auto_367912 ?auto_367915 ) ) ( not ( = ?auto_367912 ?auto_367916 ) ) ( not ( = ?auto_367912 ?auto_367917 ) ) ( not ( = ?auto_367912 ?auto_367918 ) ) ( not ( = ?auto_367912 ?auto_367919 ) ) ( not ( = ?auto_367912 ?auto_367920 ) ) ( not ( = ?auto_367912 ?auto_367921 ) ) ( not ( = ?auto_367912 ?auto_367922 ) ) ( not ( = ?auto_367913 ?auto_367914 ) ) ( not ( = ?auto_367913 ?auto_367915 ) ) ( not ( = ?auto_367913 ?auto_367916 ) ) ( not ( = ?auto_367913 ?auto_367917 ) ) ( not ( = ?auto_367913 ?auto_367918 ) ) ( not ( = ?auto_367913 ?auto_367919 ) ) ( not ( = ?auto_367913 ?auto_367920 ) ) ( not ( = ?auto_367913 ?auto_367921 ) ) ( not ( = ?auto_367913 ?auto_367922 ) ) ( not ( = ?auto_367914 ?auto_367915 ) ) ( not ( = ?auto_367914 ?auto_367916 ) ) ( not ( = ?auto_367914 ?auto_367917 ) ) ( not ( = ?auto_367914 ?auto_367918 ) ) ( not ( = ?auto_367914 ?auto_367919 ) ) ( not ( = ?auto_367914 ?auto_367920 ) ) ( not ( = ?auto_367914 ?auto_367921 ) ) ( not ( = ?auto_367914 ?auto_367922 ) ) ( not ( = ?auto_367915 ?auto_367916 ) ) ( not ( = ?auto_367915 ?auto_367917 ) ) ( not ( = ?auto_367915 ?auto_367918 ) ) ( not ( = ?auto_367915 ?auto_367919 ) ) ( not ( = ?auto_367915 ?auto_367920 ) ) ( not ( = ?auto_367915 ?auto_367921 ) ) ( not ( = ?auto_367915 ?auto_367922 ) ) ( not ( = ?auto_367916 ?auto_367917 ) ) ( not ( = ?auto_367916 ?auto_367918 ) ) ( not ( = ?auto_367916 ?auto_367919 ) ) ( not ( = ?auto_367916 ?auto_367920 ) ) ( not ( = ?auto_367916 ?auto_367921 ) ) ( not ( = ?auto_367916 ?auto_367922 ) ) ( not ( = ?auto_367917 ?auto_367918 ) ) ( not ( = ?auto_367917 ?auto_367919 ) ) ( not ( = ?auto_367917 ?auto_367920 ) ) ( not ( = ?auto_367917 ?auto_367921 ) ) ( not ( = ?auto_367917 ?auto_367922 ) ) ( not ( = ?auto_367918 ?auto_367919 ) ) ( not ( = ?auto_367918 ?auto_367920 ) ) ( not ( = ?auto_367918 ?auto_367921 ) ) ( not ( = ?auto_367918 ?auto_367922 ) ) ( not ( = ?auto_367919 ?auto_367920 ) ) ( not ( = ?auto_367919 ?auto_367921 ) ) ( not ( = ?auto_367919 ?auto_367922 ) ) ( not ( = ?auto_367920 ?auto_367921 ) ) ( not ( = ?auto_367920 ?auto_367922 ) ) ( not ( = ?auto_367921 ?auto_367922 ) ) ( ON ?auto_367920 ?auto_367921 ) ( ON ?auto_367919 ?auto_367920 ) ( ON ?auto_367918 ?auto_367919 ) ( ON ?auto_367917 ?auto_367918 ) ( ON ?auto_367916 ?auto_367917 ) ( ON ?auto_367915 ?auto_367916 ) ( ON ?auto_367914 ?auto_367915 ) ( ON ?auto_367913 ?auto_367914 ) ( CLEAR ?auto_367911 ) ( ON ?auto_367912 ?auto_367913 ) ( CLEAR ?auto_367912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_367911 ?auto_367912 )
      ( MAKE-11PILE ?auto_367911 ?auto_367912 ?auto_367913 ?auto_367914 ?auto_367915 ?auto_367916 ?auto_367917 ?auto_367918 ?auto_367919 ?auto_367920 ?auto_367921 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_367957 - BLOCK
      ?auto_367958 - BLOCK
      ?auto_367959 - BLOCK
      ?auto_367960 - BLOCK
      ?auto_367961 - BLOCK
      ?auto_367962 - BLOCK
      ?auto_367963 - BLOCK
      ?auto_367964 - BLOCK
      ?auto_367965 - BLOCK
      ?auto_367966 - BLOCK
      ?auto_367967 - BLOCK
    )
    :vars
    (
      ?auto_367968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_367967 ?auto_367968 ) ( not ( = ?auto_367957 ?auto_367958 ) ) ( not ( = ?auto_367957 ?auto_367959 ) ) ( not ( = ?auto_367957 ?auto_367960 ) ) ( not ( = ?auto_367957 ?auto_367961 ) ) ( not ( = ?auto_367957 ?auto_367962 ) ) ( not ( = ?auto_367957 ?auto_367963 ) ) ( not ( = ?auto_367957 ?auto_367964 ) ) ( not ( = ?auto_367957 ?auto_367965 ) ) ( not ( = ?auto_367957 ?auto_367966 ) ) ( not ( = ?auto_367957 ?auto_367967 ) ) ( not ( = ?auto_367957 ?auto_367968 ) ) ( not ( = ?auto_367958 ?auto_367959 ) ) ( not ( = ?auto_367958 ?auto_367960 ) ) ( not ( = ?auto_367958 ?auto_367961 ) ) ( not ( = ?auto_367958 ?auto_367962 ) ) ( not ( = ?auto_367958 ?auto_367963 ) ) ( not ( = ?auto_367958 ?auto_367964 ) ) ( not ( = ?auto_367958 ?auto_367965 ) ) ( not ( = ?auto_367958 ?auto_367966 ) ) ( not ( = ?auto_367958 ?auto_367967 ) ) ( not ( = ?auto_367958 ?auto_367968 ) ) ( not ( = ?auto_367959 ?auto_367960 ) ) ( not ( = ?auto_367959 ?auto_367961 ) ) ( not ( = ?auto_367959 ?auto_367962 ) ) ( not ( = ?auto_367959 ?auto_367963 ) ) ( not ( = ?auto_367959 ?auto_367964 ) ) ( not ( = ?auto_367959 ?auto_367965 ) ) ( not ( = ?auto_367959 ?auto_367966 ) ) ( not ( = ?auto_367959 ?auto_367967 ) ) ( not ( = ?auto_367959 ?auto_367968 ) ) ( not ( = ?auto_367960 ?auto_367961 ) ) ( not ( = ?auto_367960 ?auto_367962 ) ) ( not ( = ?auto_367960 ?auto_367963 ) ) ( not ( = ?auto_367960 ?auto_367964 ) ) ( not ( = ?auto_367960 ?auto_367965 ) ) ( not ( = ?auto_367960 ?auto_367966 ) ) ( not ( = ?auto_367960 ?auto_367967 ) ) ( not ( = ?auto_367960 ?auto_367968 ) ) ( not ( = ?auto_367961 ?auto_367962 ) ) ( not ( = ?auto_367961 ?auto_367963 ) ) ( not ( = ?auto_367961 ?auto_367964 ) ) ( not ( = ?auto_367961 ?auto_367965 ) ) ( not ( = ?auto_367961 ?auto_367966 ) ) ( not ( = ?auto_367961 ?auto_367967 ) ) ( not ( = ?auto_367961 ?auto_367968 ) ) ( not ( = ?auto_367962 ?auto_367963 ) ) ( not ( = ?auto_367962 ?auto_367964 ) ) ( not ( = ?auto_367962 ?auto_367965 ) ) ( not ( = ?auto_367962 ?auto_367966 ) ) ( not ( = ?auto_367962 ?auto_367967 ) ) ( not ( = ?auto_367962 ?auto_367968 ) ) ( not ( = ?auto_367963 ?auto_367964 ) ) ( not ( = ?auto_367963 ?auto_367965 ) ) ( not ( = ?auto_367963 ?auto_367966 ) ) ( not ( = ?auto_367963 ?auto_367967 ) ) ( not ( = ?auto_367963 ?auto_367968 ) ) ( not ( = ?auto_367964 ?auto_367965 ) ) ( not ( = ?auto_367964 ?auto_367966 ) ) ( not ( = ?auto_367964 ?auto_367967 ) ) ( not ( = ?auto_367964 ?auto_367968 ) ) ( not ( = ?auto_367965 ?auto_367966 ) ) ( not ( = ?auto_367965 ?auto_367967 ) ) ( not ( = ?auto_367965 ?auto_367968 ) ) ( not ( = ?auto_367966 ?auto_367967 ) ) ( not ( = ?auto_367966 ?auto_367968 ) ) ( not ( = ?auto_367967 ?auto_367968 ) ) ( ON ?auto_367966 ?auto_367967 ) ( ON ?auto_367965 ?auto_367966 ) ( ON ?auto_367964 ?auto_367965 ) ( ON ?auto_367963 ?auto_367964 ) ( ON ?auto_367962 ?auto_367963 ) ( ON ?auto_367961 ?auto_367962 ) ( ON ?auto_367960 ?auto_367961 ) ( ON ?auto_367959 ?auto_367960 ) ( ON ?auto_367958 ?auto_367959 ) ( ON ?auto_367957 ?auto_367958 ) ( CLEAR ?auto_367957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_367957 )
      ( MAKE-11PILE ?auto_367957 ?auto_367958 ?auto_367959 ?auto_367960 ?auto_367961 ?auto_367962 ?auto_367963 ?auto_367964 ?auto_367965 ?auto_367966 ?auto_367967 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_368004 - BLOCK
      ?auto_368005 - BLOCK
      ?auto_368006 - BLOCK
      ?auto_368007 - BLOCK
      ?auto_368008 - BLOCK
      ?auto_368009 - BLOCK
      ?auto_368010 - BLOCK
      ?auto_368011 - BLOCK
      ?auto_368012 - BLOCK
      ?auto_368013 - BLOCK
      ?auto_368014 - BLOCK
      ?auto_368015 - BLOCK
    )
    :vars
    (
      ?auto_368016 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_368014 ) ( ON ?auto_368015 ?auto_368016 ) ( CLEAR ?auto_368015 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_368004 ) ( ON ?auto_368005 ?auto_368004 ) ( ON ?auto_368006 ?auto_368005 ) ( ON ?auto_368007 ?auto_368006 ) ( ON ?auto_368008 ?auto_368007 ) ( ON ?auto_368009 ?auto_368008 ) ( ON ?auto_368010 ?auto_368009 ) ( ON ?auto_368011 ?auto_368010 ) ( ON ?auto_368012 ?auto_368011 ) ( ON ?auto_368013 ?auto_368012 ) ( ON ?auto_368014 ?auto_368013 ) ( not ( = ?auto_368004 ?auto_368005 ) ) ( not ( = ?auto_368004 ?auto_368006 ) ) ( not ( = ?auto_368004 ?auto_368007 ) ) ( not ( = ?auto_368004 ?auto_368008 ) ) ( not ( = ?auto_368004 ?auto_368009 ) ) ( not ( = ?auto_368004 ?auto_368010 ) ) ( not ( = ?auto_368004 ?auto_368011 ) ) ( not ( = ?auto_368004 ?auto_368012 ) ) ( not ( = ?auto_368004 ?auto_368013 ) ) ( not ( = ?auto_368004 ?auto_368014 ) ) ( not ( = ?auto_368004 ?auto_368015 ) ) ( not ( = ?auto_368004 ?auto_368016 ) ) ( not ( = ?auto_368005 ?auto_368006 ) ) ( not ( = ?auto_368005 ?auto_368007 ) ) ( not ( = ?auto_368005 ?auto_368008 ) ) ( not ( = ?auto_368005 ?auto_368009 ) ) ( not ( = ?auto_368005 ?auto_368010 ) ) ( not ( = ?auto_368005 ?auto_368011 ) ) ( not ( = ?auto_368005 ?auto_368012 ) ) ( not ( = ?auto_368005 ?auto_368013 ) ) ( not ( = ?auto_368005 ?auto_368014 ) ) ( not ( = ?auto_368005 ?auto_368015 ) ) ( not ( = ?auto_368005 ?auto_368016 ) ) ( not ( = ?auto_368006 ?auto_368007 ) ) ( not ( = ?auto_368006 ?auto_368008 ) ) ( not ( = ?auto_368006 ?auto_368009 ) ) ( not ( = ?auto_368006 ?auto_368010 ) ) ( not ( = ?auto_368006 ?auto_368011 ) ) ( not ( = ?auto_368006 ?auto_368012 ) ) ( not ( = ?auto_368006 ?auto_368013 ) ) ( not ( = ?auto_368006 ?auto_368014 ) ) ( not ( = ?auto_368006 ?auto_368015 ) ) ( not ( = ?auto_368006 ?auto_368016 ) ) ( not ( = ?auto_368007 ?auto_368008 ) ) ( not ( = ?auto_368007 ?auto_368009 ) ) ( not ( = ?auto_368007 ?auto_368010 ) ) ( not ( = ?auto_368007 ?auto_368011 ) ) ( not ( = ?auto_368007 ?auto_368012 ) ) ( not ( = ?auto_368007 ?auto_368013 ) ) ( not ( = ?auto_368007 ?auto_368014 ) ) ( not ( = ?auto_368007 ?auto_368015 ) ) ( not ( = ?auto_368007 ?auto_368016 ) ) ( not ( = ?auto_368008 ?auto_368009 ) ) ( not ( = ?auto_368008 ?auto_368010 ) ) ( not ( = ?auto_368008 ?auto_368011 ) ) ( not ( = ?auto_368008 ?auto_368012 ) ) ( not ( = ?auto_368008 ?auto_368013 ) ) ( not ( = ?auto_368008 ?auto_368014 ) ) ( not ( = ?auto_368008 ?auto_368015 ) ) ( not ( = ?auto_368008 ?auto_368016 ) ) ( not ( = ?auto_368009 ?auto_368010 ) ) ( not ( = ?auto_368009 ?auto_368011 ) ) ( not ( = ?auto_368009 ?auto_368012 ) ) ( not ( = ?auto_368009 ?auto_368013 ) ) ( not ( = ?auto_368009 ?auto_368014 ) ) ( not ( = ?auto_368009 ?auto_368015 ) ) ( not ( = ?auto_368009 ?auto_368016 ) ) ( not ( = ?auto_368010 ?auto_368011 ) ) ( not ( = ?auto_368010 ?auto_368012 ) ) ( not ( = ?auto_368010 ?auto_368013 ) ) ( not ( = ?auto_368010 ?auto_368014 ) ) ( not ( = ?auto_368010 ?auto_368015 ) ) ( not ( = ?auto_368010 ?auto_368016 ) ) ( not ( = ?auto_368011 ?auto_368012 ) ) ( not ( = ?auto_368011 ?auto_368013 ) ) ( not ( = ?auto_368011 ?auto_368014 ) ) ( not ( = ?auto_368011 ?auto_368015 ) ) ( not ( = ?auto_368011 ?auto_368016 ) ) ( not ( = ?auto_368012 ?auto_368013 ) ) ( not ( = ?auto_368012 ?auto_368014 ) ) ( not ( = ?auto_368012 ?auto_368015 ) ) ( not ( = ?auto_368012 ?auto_368016 ) ) ( not ( = ?auto_368013 ?auto_368014 ) ) ( not ( = ?auto_368013 ?auto_368015 ) ) ( not ( = ?auto_368013 ?auto_368016 ) ) ( not ( = ?auto_368014 ?auto_368015 ) ) ( not ( = ?auto_368014 ?auto_368016 ) ) ( not ( = ?auto_368015 ?auto_368016 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_368015 ?auto_368016 )
      ( !STACK ?auto_368015 ?auto_368014 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_368054 - BLOCK
      ?auto_368055 - BLOCK
      ?auto_368056 - BLOCK
      ?auto_368057 - BLOCK
      ?auto_368058 - BLOCK
      ?auto_368059 - BLOCK
      ?auto_368060 - BLOCK
      ?auto_368061 - BLOCK
      ?auto_368062 - BLOCK
      ?auto_368063 - BLOCK
      ?auto_368064 - BLOCK
      ?auto_368065 - BLOCK
    )
    :vars
    (
      ?auto_368066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_368065 ?auto_368066 ) ( ON-TABLE ?auto_368054 ) ( ON ?auto_368055 ?auto_368054 ) ( ON ?auto_368056 ?auto_368055 ) ( ON ?auto_368057 ?auto_368056 ) ( ON ?auto_368058 ?auto_368057 ) ( ON ?auto_368059 ?auto_368058 ) ( ON ?auto_368060 ?auto_368059 ) ( ON ?auto_368061 ?auto_368060 ) ( ON ?auto_368062 ?auto_368061 ) ( ON ?auto_368063 ?auto_368062 ) ( not ( = ?auto_368054 ?auto_368055 ) ) ( not ( = ?auto_368054 ?auto_368056 ) ) ( not ( = ?auto_368054 ?auto_368057 ) ) ( not ( = ?auto_368054 ?auto_368058 ) ) ( not ( = ?auto_368054 ?auto_368059 ) ) ( not ( = ?auto_368054 ?auto_368060 ) ) ( not ( = ?auto_368054 ?auto_368061 ) ) ( not ( = ?auto_368054 ?auto_368062 ) ) ( not ( = ?auto_368054 ?auto_368063 ) ) ( not ( = ?auto_368054 ?auto_368064 ) ) ( not ( = ?auto_368054 ?auto_368065 ) ) ( not ( = ?auto_368054 ?auto_368066 ) ) ( not ( = ?auto_368055 ?auto_368056 ) ) ( not ( = ?auto_368055 ?auto_368057 ) ) ( not ( = ?auto_368055 ?auto_368058 ) ) ( not ( = ?auto_368055 ?auto_368059 ) ) ( not ( = ?auto_368055 ?auto_368060 ) ) ( not ( = ?auto_368055 ?auto_368061 ) ) ( not ( = ?auto_368055 ?auto_368062 ) ) ( not ( = ?auto_368055 ?auto_368063 ) ) ( not ( = ?auto_368055 ?auto_368064 ) ) ( not ( = ?auto_368055 ?auto_368065 ) ) ( not ( = ?auto_368055 ?auto_368066 ) ) ( not ( = ?auto_368056 ?auto_368057 ) ) ( not ( = ?auto_368056 ?auto_368058 ) ) ( not ( = ?auto_368056 ?auto_368059 ) ) ( not ( = ?auto_368056 ?auto_368060 ) ) ( not ( = ?auto_368056 ?auto_368061 ) ) ( not ( = ?auto_368056 ?auto_368062 ) ) ( not ( = ?auto_368056 ?auto_368063 ) ) ( not ( = ?auto_368056 ?auto_368064 ) ) ( not ( = ?auto_368056 ?auto_368065 ) ) ( not ( = ?auto_368056 ?auto_368066 ) ) ( not ( = ?auto_368057 ?auto_368058 ) ) ( not ( = ?auto_368057 ?auto_368059 ) ) ( not ( = ?auto_368057 ?auto_368060 ) ) ( not ( = ?auto_368057 ?auto_368061 ) ) ( not ( = ?auto_368057 ?auto_368062 ) ) ( not ( = ?auto_368057 ?auto_368063 ) ) ( not ( = ?auto_368057 ?auto_368064 ) ) ( not ( = ?auto_368057 ?auto_368065 ) ) ( not ( = ?auto_368057 ?auto_368066 ) ) ( not ( = ?auto_368058 ?auto_368059 ) ) ( not ( = ?auto_368058 ?auto_368060 ) ) ( not ( = ?auto_368058 ?auto_368061 ) ) ( not ( = ?auto_368058 ?auto_368062 ) ) ( not ( = ?auto_368058 ?auto_368063 ) ) ( not ( = ?auto_368058 ?auto_368064 ) ) ( not ( = ?auto_368058 ?auto_368065 ) ) ( not ( = ?auto_368058 ?auto_368066 ) ) ( not ( = ?auto_368059 ?auto_368060 ) ) ( not ( = ?auto_368059 ?auto_368061 ) ) ( not ( = ?auto_368059 ?auto_368062 ) ) ( not ( = ?auto_368059 ?auto_368063 ) ) ( not ( = ?auto_368059 ?auto_368064 ) ) ( not ( = ?auto_368059 ?auto_368065 ) ) ( not ( = ?auto_368059 ?auto_368066 ) ) ( not ( = ?auto_368060 ?auto_368061 ) ) ( not ( = ?auto_368060 ?auto_368062 ) ) ( not ( = ?auto_368060 ?auto_368063 ) ) ( not ( = ?auto_368060 ?auto_368064 ) ) ( not ( = ?auto_368060 ?auto_368065 ) ) ( not ( = ?auto_368060 ?auto_368066 ) ) ( not ( = ?auto_368061 ?auto_368062 ) ) ( not ( = ?auto_368061 ?auto_368063 ) ) ( not ( = ?auto_368061 ?auto_368064 ) ) ( not ( = ?auto_368061 ?auto_368065 ) ) ( not ( = ?auto_368061 ?auto_368066 ) ) ( not ( = ?auto_368062 ?auto_368063 ) ) ( not ( = ?auto_368062 ?auto_368064 ) ) ( not ( = ?auto_368062 ?auto_368065 ) ) ( not ( = ?auto_368062 ?auto_368066 ) ) ( not ( = ?auto_368063 ?auto_368064 ) ) ( not ( = ?auto_368063 ?auto_368065 ) ) ( not ( = ?auto_368063 ?auto_368066 ) ) ( not ( = ?auto_368064 ?auto_368065 ) ) ( not ( = ?auto_368064 ?auto_368066 ) ) ( not ( = ?auto_368065 ?auto_368066 ) ) ( CLEAR ?auto_368063 ) ( ON ?auto_368064 ?auto_368065 ) ( CLEAR ?auto_368064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_368054 ?auto_368055 ?auto_368056 ?auto_368057 ?auto_368058 ?auto_368059 ?auto_368060 ?auto_368061 ?auto_368062 ?auto_368063 ?auto_368064 )
      ( MAKE-12PILE ?auto_368054 ?auto_368055 ?auto_368056 ?auto_368057 ?auto_368058 ?auto_368059 ?auto_368060 ?auto_368061 ?auto_368062 ?auto_368063 ?auto_368064 ?auto_368065 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_368104 - BLOCK
      ?auto_368105 - BLOCK
      ?auto_368106 - BLOCK
      ?auto_368107 - BLOCK
      ?auto_368108 - BLOCK
      ?auto_368109 - BLOCK
      ?auto_368110 - BLOCK
      ?auto_368111 - BLOCK
      ?auto_368112 - BLOCK
      ?auto_368113 - BLOCK
      ?auto_368114 - BLOCK
      ?auto_368115 - BLOCK
    )
    :vars
    (
      ?auto_368116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_368115 ?auto_368116 ) ( ON-TABLE ?auto_368104 ) ( ON ?auto_368105 ?auto_368104 ) ( ON ?auto_368106 ?auto_368105 ) ( ON ?auto_368107 ?auto_368106 ) ( ON ?auto_368108 ?auto_368107 ) ( ON ?auto_368109 ?auto_368108 ) ( ON ?auto_368110 ?auto_368109 ) ( ON ?auto_368111 ?auto_368110 ) ( ON ?auto_368112 ?auto_368111 ) ( not ( = ?auto_368104 ?auto_368105 ) ) ( not ( = ?auto_368104 ?auto_368106 ) ) ( not ( = ?auto_368104 ?auto_368107 ) ) ( not ( = ?auto_368104 ?auto_368108 ) ) ( not ( = ?auto_368104 ?auto_368109 ) ) ( not ( = ?auto_368104 ?auto_368110 ) ) ( not ( = ?auto_368104 ?auto_368111 ) ) ( not ( = ?auto_368104 ?auto_368112 ) ) ( not ( = ?auto_368104 ?auto_368113 ) ) ( not ( = ?auto_368104 ?auto_368114 ) ) ( not ( = ?auto_368104 ?auto_368115 ) ) ( not ( = ?auto_368104 ?auto_368116 ) ) ( not ( = ?auto_368105 ?auto_368106 ) ) ( not ( = ?auto_368105 ?auto_368107 ) ) ( not ( = ?auto_368105 ?auto_368108 ) ) ( not ( = ?auto_368105 ?auto_368109 ) ) ( not ( = ?auto_368105 ?auto_368110 ) ) ( not ( = ?auto_368105 ?auto_368111 ) ) ( not ( = ?auto_368105 ?auto_368112 ) ) ( not ( = ?auto_368105 ?auto_368113 ) ) ( not ( = ?auto_368105 ?auto_368114 ) ) ( not ( = ?auto_368105 ?auto_368115 ) ) ( not ( = ?auto_368105 ?auto_368116 ) ) ( not ( = ?auto_368106 ?auto_368107 ) ) ( not ( = ?auto_368106 ?auto_368108 ) ) ( not ( = ?auto_368106 ?auto_368109 ) ) ( not ( = ?auto_368106 ?auto_368110 ) ) ( not ( = ?auto_368106 ?auto_368111 ) ) ( not ( = ?auto_368106 ?auto_368112 ) ) ( not ( = ?auto_368106 ?auto_368113 ) ) ( not ( = ?auto_368106 ?auto_368114 ) ) ( not ( = ?auto_368106 ?auto_368115 ) ) ( not ( = ?auto_368106 ?auto_368116 ) ) ( not ( = ?auto_368107 ?auto_368108 ) ) ( not ( = ?auto_368107 ?auto_368109 ) ) ( not ( = ?auto_368107 ?auto_368110 ) ) ( not ( = ?auto_368107 ?auto_368111 ) ) ( not ( = ?auto_368107 ?auto_368112 ) ) ( not ( = ?auto_368107 ?auto_368113 ) ) ( not ( = ?auto_368107 ?auto_368114 ) ) ( not ( = ?auto_368107 ?auto_368115 ) ) ( not ( = ?auto_368107 ?auto_368116 ) ) ( not ( = ?auto_368108 ?auto_368109 ) ) ( not ( = ?auto_368108 ?auto_368110 ) ) ( not ( = ?auto_368108 ?auto_368111 ) ) ( not ( = ?auto_368108 ?auto_368112 ) ) ( not ( = ?auto_368108 ?auto_368113 ) ) ( not ( = ?auto_368108 ?auto_368114 ) ) ( not ( = ?auto_368108 ?auto_368115 ) ) ( not ( = ?auto_368108 ?auto_368116 ) ) ( not ( = ?auto_368109 ?auto_368110 ) ) ( not ( = ?auto_368109 ?auto_368111 ) ) ( not ( = ?auto_368109 ?auto_368112 ) ) ( not ( = ?auto_368109 ?auto_368113 ) ) ( not ( = ?auto_368109 ?auto_368114 ) ) ( not ( = ?auto_368109 ?auto_368115 ) ) ( not ( = ?auto_368109 ?auto_368116 ) ) ( not ( = ?auto_368110 ?auto_368111 ) ) ( not ( = ?auto_368110 ?auto_368112 ) ) ( not ( = ?auto_368110 ?auto_368113 ) ) ( not ( = ?auto_368110 ?auto_368114 ) ) ( not ( = ?auto_368110 ?auto_368115 ) ) ( not ( = ?auto_368110 ?auto_368116 ) ) ( not ( = ?auto_368111 ?auto_368112 ) ) ( not ( = ?auto_368111 ?auto_368113 ) ) ( not ( = ?auto_368111 ?auto_368114 ) ) ( not ( = ?auto_368111 ?auto_368115 ) ) ( not ( = ?auto_368111 ?auto_368116 ) ) ( not ( = ?auto_368112 ?auto_368113 ) ) ( not ( = ?auto_368112 ?auto_368114 ) ) ( not ( = ?auto_368112 ?auto_368115 ) ) ( not ( = ?auto_368112 ?auto_368116 ) ) ( not ( = ?auto_368113 ?auto_368114 ) ) ( not ( = ?auto_368113 ?auto_368115 ) ) ( not ( = ?auto_368113 ?auto_368116 ) ) ( not ( = ?auto_368114 ?auto_368115 ) ) ( not ( = ?auto_368114 ?auto_368116 ) ) ( not ( = ?auto_368115 ?auto_368116 ) ) ( ON ?auto_368114 ?auto_368115 ) ( CLEAR ?auto_368112 ) ( ON ?auto_368113 ?auto_368114 ) ( CLEAR ?auto_368113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_368104 ?auto_368105 ?auto_368106 ?auto_368107 ?auto_368108 ?auto_368109 ?auto_368110 ?auto_368111 ?auto_368112 ?auto_368113 )
      ( MAKE-12PILE ?auto_368104 ?auto_368105 ?auto_368106 ?auto_368107 ?auto_368108 ?auto_368109 ?auto_368110 ?auto_368111 ?auto_368112 ?auto_368113 ?auto_368114 ?auto_368115 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_368154 - BLOCK
      ?auto_368155 - BLOCK
      ?auto_368156 - BLOCK
      ?auto_368157 - BLOCK
      ?auto_368158 - BLOCK
      ?auto_368159 - BLOCK
      ?auto_368160 - BLOCK
      ?auto_368161 - BLOCK
      ?auto_368162 - BLOCK
      ?auto_368163 - BLOCK
      ?auto_368164 - BLOCK
      ?auto_368165 - BLOCK
    )
    :vars
    (
      ?auto_368166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_368165 ?auto_368166 ) ( ON-TABLE ?auto_368154 ) ( ON ?auto_368155 ?auto_368154 ) ( ON ?auto_368156 ?auto_368155 ) ( ON ?auto_368157 ?auto_368156 ) ( ON ?auto_368158 ?auto_368157 ) ( ON ?auto_368159 ?auto_368158 ) ( ON ?auto_368160 ?auto_368159 ) ( ON ?auto_368161 ?auto_368160 ) ( not ( = ?auto_368154 ?auto_368155 ) ) ( not ( = ?auto_368154 ?auto_368156 ) ) ( not ( = ?auto_368154 ?auto_368157 ) ) ( not ( = ?auto_368154 ?auto_368158 ) ) ( not ( = ?auto_368154 ?auto_368159 ) ) ( not ( = ?auto_368154 ?auto_368160 ) ) ( not ( = ?auto_368154 ?auto_368161 ) ) ( not ( = ?auto_368154 ?auto_368162 ) ) ( not ( = ?auto_368154 ?auto_368163 ) ) ( not ( = ?auto_368154 ?auto_368164 ) ) ( not ( = ?auto_368154 ?auto_368165 ) ) ( not ( = ?auto_368154 ?auto_368166 ) ) ( not ( = ?auto_368155 ?auto_368156 ) ) ( not ( = ?auto_368155 ?auto_368157 ) ) ( not ( = ?auto_368155 ?auto_368158 ) ) ( not ( = ?auto_368155 ?auto_368159 ) ) ( not ( = ?auto_368155 ?auto_368160 ) ) ( not ( = ?auto_368155 ?auto_368161 ) ) ( not ( = ?auto_368155 ?auto_368162 ) ) ( not ( = ?auto_368155 ?auto_368163 ) ) ( not ( = ?auto_368155 ?auto_368164 ) ) ( not ( = ?auto_368155 ?auto_368165 ) ) ( not ( = ?auto_368155 ?auto_368166 ) ) ( not ( = ?auto_368156 ?auto_368157 ) ) ( not ( = ?auto_368156 ?auto_368158 ) ) ( not ( = ?auto_368156 ?auto_368159 ) ) ( not ( = ?auto_368156 ?auto_368160 ) ) ( not ( = ?auto_368156 ?auto_368161 ) ) ( not ( = ?auto_368156 ?auto_368162 ) ) ( not ( = ?auto_368156 ?auto_368163 ) ) ( not ( = ?auto_368156 ?auto_368164 ) ) ( not ( = ?auto_368156 ?auto_368165 ) ) ( not ( = ?auto_368156 ?auto_368166 ) ) ( not ( = ?auto_368157 ?auto_368158 ) ) ( not ( = ?auto_368157 ?auto_368159 ) ) ( not ( = ?auto_368157 ?auto_368160 ) ) ( not ( = ?auto_368157 ?auto_368161 ) ) ( not ( = ?auto_368157 ?auto_368162 ) ) ( not ( = ?auto_368157 ?auto_368163 ) ) ( not ( = ?auto_368157 ?auto_368164 ) ) ( not ( = ?auto_368157 ?auto_368165 ) ) ( not ( = ?auto_368157 ?auto_368166 ) ) ( not ( = ?auto_368158 ?auto_368159 ) ) ( not ( = ?auto_368158 ?auto_368160 ) ) ( not ( = ?auto_368158 ?auto_368161 ) ) ( not ( = ?auto_368158 ?auto_368162 ) ) ( not ( = ?auto_368158 ?auto_368163 ) ) ( not ( = ?auto_368158 ?auto_368164 ) ) ( not ( = ?auto_368158 ?auto_368165 ) ) ( not ( = ?auto_368158 ?auto_368166 ) ) ( not ( = ?auto_368159 ?auto_368160 ) ) ( not ( = ?auto_368159 ?auto_368161 ) ) ( not ( = ?auto_368159 ?auto_368162 ) ) ( not ( = ?auto_368159 ?auto_368163 ) ) ( not ( = ?auto_368159 ?auto_368164 ) ) ( not ( = ?auto_368159 ?auto_368165 ) ) ( not ( = ?auto_368159 ?auto_368166 ) ) ( not ( = ?auto_368160 ?auto_368161 ) ) ( not ( = ?auto_368160 ?auto_368162 ) ) ( not ( = ?auto_368160 ?auto_368163 ) ) ( not ( = ?auto_368160 ?auto_368164 ) ) ( not ( = ?auto_368160 ?auto_368165 ) ) ( not ( = ?auto_368160 ?auto_368166 ) ) ( not ( = ?auto_368161 ?auto_368162 ) ) ( not ( = ?auto_368161 ?auto_368163 ) ) ( not ( = ?auto_368161 ?auto_368164 ) ) ( not ( = ?auto_368161 ?auto_368165 ) ) ( not ( = ?auto_368161 ?auto_368166 ) ) ( not ( = ?auto_368162 ?auto_368163 ) ) ( not ( = ?auto_368162 ?auto_368164 ) ) ( not ( = ?auto_368162 ?auto_368165 ) ) ( not ( = ?auto_368162 ?auto_368166 ) ) ( not ( = ?auto_368163 ?auto_368164 ) ) ( not ( = ?auto_368163 ?auto_368165 ) ) ( not ( = ?auto_368163 ?auto_368166 ) ) ( not ( = ?auto_368164 ?auto_368165 ) ) ( not ( = ?auto_368164 ?auto_368166 ) ) ( not ( = ?auto_368165 ?auto_368166 ) ) ( ON ?auto_368164 ?auto_368165 ) ( ON ?auto_368163 ?auto_368164 ) ( CLEAR ?auto_368161 ) ( ON ?auto_368162 ?auto_368163 ) ( CLEAR ?auto_368162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_368154 ?auto_368155 ?auto_368156 ?auto_368157 ?auto_368158 ?auto_368159 ?auto_368160 ?auto_368161 ?auto_368162 )
      ( MAKE-12PILE ?auto_368154 ?auto_368155 ?auto_368156 ?auto_368157 ?auto_368158 ?auto_368159 ?auto_368160 ?auto_368161 ?auto_368162 ?auto_368163 ?auto_368164 ?auto_368165 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_368204 - BLOCK
      ?auto_368205 - BLOCK
      ?auto_368206 - BLOCK
      ?auto_368207 - BLOCK
      ?auto_368208 - BLOCK
      ?auto_368209 - BLOCK
      ?auto_368210 - BLOCK
      ?auto_368211 - BLOCK
      ?auto_368212 - BLOCK
      ?auto_368213 - BLOCK
      ?auto_368214 - BLOCK
      ?auto_368215 - BLOCK
    )
    :vars
    (
      ?auto_368216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_368215 ?auto_368216 ) ( ON-TABLE ?auto_368204 ) ( ON ?auto_368205 ?auto_368204 ) ( ON ?auto_368206 ?auto_368205 ) ( ON ?auto_368207 ?auto_368206 ) ( ON ?auto_368208 ?auto_368207 ) ( ON ?auto_368209 ?auto_368208 ) ( ON ?auto_368210 ?auto_368209 ) ( not ( = ?auto_368204 ?auto_368205 ) ) ( not ( = ?auto_368204 ?auto_368206 ) ) ( not ( = ?auto_368204 ?auto_368207 ) ) ( not ( = ?auto_368204 ?auto_368208 ) ) ( not ( = ?auto_368204 ?auto_368209 ) ) ( not ( = ?auto_368204 ?auto_368210 ) ) ( not ( = ?auto_368204 ?auto_368211 ) ) ( not ( = ?auto_368204 ?auto_368212 ) ) ( not ( = ?auto_368204 ?auto_368213 ) ) ( not ( = ?auto_368204 ?auto_368214 ) ) ( not ( = ?auto_368204 ?auto_368215 ) ) ( not ( = ?auto_368204 ?auto_368216 ) ) ( not ( = ?auto_368205 ?auto_368206 ) ) ( not ( = ?auto_368205 ?auto_368207 ) ) ( not ( = ?auto_368205 ?auto_368208 ) ) ( not ( = ?auto_368205 ?auto_368209 ) ) ( not ( = ?auto_368205 ?auto_368210 ) ) ( not ( = ?auto_368205 ?auto_368211 ) ) ( not ( = ?auto_368205 ?auto_368212 ) ) ( not ( = ?auto_368205 ?auto_368213 ) ) ( not ( = ?auto_368205 ?auto_368214 ) ) ( not ( = ?auto_368205 ?auto_368215 ) ) ( not ( = ?auto_368205 ?auto_368216 ) ) ( not ( = ?auto_368206 ?auto_368207 ) ) ( not ( = ?auto_368206 ?auto_368208 ) ) ( not ( = ?auto_368206 ?auto_368209 ) ) ( not ( = ?auto_368206 ?auto_368210 ) ) ( not ( = ?auto_368206 ?auto_368211 ) ) ( not ( = ?auto_368206 ?auto_368212 ) ) ( not ( = ?auto_368206 ?auto_368213 ) ) ( not ( = ?auto_368206 ?auto_368214 ) ) ( not ( = ?auto_368206 ?auto_368215 ) ) ( not ( = ?auto_368206 ?auto_368216 ) ) ( not ( = ?auto_368207 ?auto_368208 ) ) ( not ( = ?auto_368207 ?auto_368209 ) ) ( not ( = ?auto_368207 ?auto_368210 ) ) ( not ( = ?auto_368207 ?auto_368211 ) ) ( not ( = ?auto_368207 ?auto_368212 ) ) ( not ( = ?auto_368207 ?auto_368213 ) ) ( not ( = ?auto_368207 ?auto_368214 ) ) ( not ( = ?auto_368207 ?auto_368215 ) ) ( not ( = ?auto_368207 ?auto_368216 ) ) ( not ( = ?auto_368208 ?auto_368209 ) ) ( not ( = ?auto_368208 ?auto_368210 ) ) ( not ( = ?auto_368208 ?auto_368211 ) ) ( not ( = ?auto_368208 ?auto_368212 ) ) ( not ( = ?auto_368208 ?auto_368213 ) ) ( not ( = ?auto_368208 ?auto_368214 ) ) ( not ( = ?auto_368208 ?auto_368215 ) ) ( not ( = ?auto_368208 ?auto_368216 ) ) ( not ( = ?auto_368209 ?auto_368210 ) ) ( not ( = ?auto_368209 ?auto_368211 ) ) ( not ( = ?auto_368209 ?auto_368212 ) ) ( not ( = ?auto_368209 ?auto_368213 ) ) ( not ( = ?auto_368209 ?auto_368214 ) ) ( not ( = ?auto_368209 ?auto_368215 ) ) ( not ( = ?auto_368209 ?auto_368216 ) ) ( not ( = ?auto_368210 ?auto_368211 ) ) ( not ( = ?auto_368210 ?auto_368212 ) ) ( not ( = ?auto_368210 ?auto_368213 ) ) ( not ( = ?auto_368210 ?auto_368214 ) ) ( not ( = ?auto_368210 ?auto_368215 ) ) ( not ( = ?auto_368210 ?auto_368216 ) ) ( not ( = ?auto_368211 ?auto_368212 ) ) ( not ( = ?auto_368211 ?auto_368213 ) ) ( not ( = ?auto_368211 ?auto_368214 ) ) ( not ( = ?auto_368211 ?auto_368215 ) ) ( not ( = ?auto_368211 ?auto_368216 ) ) ( not ( = ?auto_368212 ?auto_368213 ) ) ( not ( = ?auto_368212 ?auto_368214 ) ) ( not ( = ?auto_368212 ?auto_368215 ) ) ( not ( = ?auto_368212 ?auto_368216 ) ) ( not ( = ?auto_368213 ?auto_368214 ) ) ( not ( = ?auto_368213 ?auto_368215 ) ) ( not ( = ?auto_368213 ?auto_368216 ) ) ( not ( = ?auto_368214 ?auto_368215 ) ) ( not ( = ?auto_368214 ?auto_368216 ) ) ( not ( = ?auto_368215 ?auto_368216 ) ) ( ON ?auto_368214 ?auto_368215 ) ( ON ?auto_368213 ?auto_368214 ) ( ON ?auto_368212 ?auto_368213 ) ( CLEAR ?auto_368210 ) ( ON ?auto_368211 ?auto_368212 ) ( CLEAR ?auto_368211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_368204 ?auto_368205 ?auto_368206 ?auto_368207 ?auto_368208 ?auto_368209 ?auto_368210 ?auto_368211 )
      ( MAKE-12PILE ?auto_368204 ?auto_368205 ?auto_368206 ?auto_368207 ?auto_368208 ?auto_368209 ?auto_368210 ?auto_368211 ?auto_368212 ?auto_368213 ?auto_368214 ?auto_368215 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_368254 - BLOCK
      ?auto_368255 - BLOCK
      ?auto_368256 - BLOCK
      ?auto_368257 - BLOCK
      ?auto_368258 - BLOCK
      ?auto_368259 - BLOCK
      ?auto_368260 - BLOCK
      ?auto_368261 - BLOCK
      ?auto_368262 - BLOCK
      ?auto_368263 - BLOCK
      ?auto_368264 - BLOCK
      ?auto_368265 - BLOCK
    )
    :vars
    (
      ?auto_368266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_368265 ?auto_368266 ) ( ON-TABLE ?auto_368254 ) ( ON ?auto_368255 ?auto_368254 ) ( ON ?auto_368256 ?auto_368255 ) ( ON ?auto_368257 ?auto_368256 ) ( ON ?auto_368258 ?auto_368257 ) ( ON ?auto_368259 ?auto_368258 ) ( not ( = ?auto_368254 ?auto_368255 ) ) ( not ( = ?auto_368254 ?auto_368256 ) ) ( not ( = ?auto_368254 ?auto_368257 ) ) ( not ( = ?auto_368254 ?auto_368258 ) ) ( not ( = ?auto_368254 ?auto_368259 ) ) ( not ( = ?auto_368254 ?auto_368260 ) ) ( not ( = ?auto_368254 ?auto_368261 ) ) ( not ( = ?auto_368254 ?auto_368262 ) ) ( not ( = ?auto_368254 ?auto_368263 ) ) ( not ( = ?auto_368254 ?auto_368264 ) ) ( not ( = ?auto_368254 ?auto_368265 ) ) ( not ( = ?auto_368254 ?auto_368266 ) ) ( not ( = ?auto_368255 ?auto_368256 ) ) ( not ( = ?auto_368255 ?auto_368257 ) ) ( not ( = ?auto_368255 ?auto_368258 ) ) ( not ( = ?auto_368255 ?auto_368259 ) ) ( not ( = ?auto_368255 ?auto_368260 ) ) ( not ( = ?auto_368255 ?auto_368261 ) ) ( not ( = ?auto_368255 ?auto_368262 ) ) ( not ( = ?auto_368255 ?auto_368263 ) ) ( not ( = ?auto_368255 ?auto_368264 ) ) ( not ( = ?auto_368255 ?auto_368265 ) ) ( not ( = ?auto_368255 ?auto_368266 ) ) ( not ( = ?auto_368256 ?auto_368257 ) ) ( not ( = ?auto_368256 ?auto_368258 ) ) ( not ( = ?auto_368256 ?auto_368259 ) ) ( not ( = ?auto_368256 ?auto_368260 ) ) ( not ( = ?auto_368256 ?auto_368261 ) ) ( not ( = ?auto_368256 ?auto_368262 ) ) ( not ( = ?auto_368256 ?auto_368263 ) ) ( not ( = ?auto_368256 ?auto_368264 ) ) ( not ( = ?auto_368256 ?auto_368265 ) ) ( not ( = ?auto_368256 ?auto_368266 ) ) ( not ( = ?auto_368257 ?auto_368258 ) ) ( not ( = ?auto_368257 ?auto_368259 ) ) ( not ( = ?auto_368257 ?auto_368260 ) ) ( not ( = ?auto_368257 ?auto_368261 ) ) ( not ( = ?auto_368257 ?auto_368262 ) ) ( not ( = ?auto_368257 ?auto_368263 ) ) ( not ( = ?auto_368257 ?auto_368264 ) ) ( not ( = ?auto_368257 ?auto_368265 ) ) ( not ( = ?auto_368257 ?auto_368266 ) ) ( not ( = ?auto_368258 ?auto_368259 ) ) ( not ( = ?auto_368258 ?auto_368260 ) ) ( not ( = ?auto_368258 ?auto_368261 ) ) ( not ( = ?auto_368258 ?auto_368262 ) ) ( not ( = ?auto_368258 ?auto_368263 ) ) ( not ( = ?auto_368258 ?auto_368264 ) ) ( not ( = ?auto_368258 ?auto_368265 ) ) ( not ( = ?auto_368258 ?auto_368266 ) ) ( not ( = ?auto_368259 ?auto_368260 ) ) ( not ( = ?auto_368259 ?auto_368261 ) ) ( not ( = ?auto_368259 ?auto_368262 ) ) ( not ( = ?auto_368259 ?auto_368263 ) ) ( not ( = ?auto_368259 ?auto_368264 ) ) ( not ( = ?auto_368259 ?auto_368265 ) ) ( not ( = ?auto_368259 ?auto_368266 ) ) ( not ( = ?auto_368260 ?auto_368261 ) ) ( not ( = ?auto_368260 ?auto_368262 ) ) ( not ( = ?auto_368260 ?auto_368263 ) ) ( not ( = ?auto_368260 ?auto_368264 ) ) ( not ( = ?auto_368260 ?auto_368265 ) ) ( not ( = ?auto_368260 ?auto_368266 ) ) ( not ( = ?auto_368261 ?auto_368262 ) ) ( not ( = ?auto_368261 ?auto_368263 ) ) ( not ( = ?auto_368261 ?auto_368264 ) ) ( not ( = ?auto_368261 ?auto_368265 ) ) ( not ( = ?auto_368261 ?auto_368266 ) ) ( not ( = ?auto_368262 ?auto_368263 ) ) ( not ( = ?auto_368262 ?auto_368264 ) ) ( not ( = ?auto_368262 ?auto_368265 ) ) ( not ( = ?auto_368262 ?auto_368266 ) ) ( not ( = ?auto_368263 ?auto_368264 ) ) ( not ( = ?auto_368263 ?auto_368265 ) ) ( not ( = ?auto_368263 ?auto_368266 ) ) ( not ( = ?auto_368264 ?auto_368265 ) ) ( not ( = ?auto_368264 ?auto_368266 ) ) ( not ( = ?auto_368265 ?auto_368266 ) ) ( ON ?auto_368264 ?auto_368265 ) ( ON ?auto_368263 ?auto_368264 ) ( ON ?auto_368262 ?auto_368263 ) ( ON ?auto_368261 ?auto_368262 ) ( CLEAR ?auto_368259 ) ( ON ?auto_368260 ?auto_368261 ) ( CLEAR ?auto_368260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_368254 ?auto_368255 ?auto_368256 ?auto_368257 ?auto_368258 ?auto_368259 ?auto_368260 )
      ( MAKE-12PILE ?auto_368254 ?auto_368255 ?auto_368256 ?auto_368257 ?auto_368258 ?auto_368259 ?auto_368260 ?auto_368261 ?auto_368262 ?auto_368263 ?auto_368264 ?auto_368265 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_368304 - BLOCK
      ?auto_368305 - BLOCK
      ?auto_368306 - BLOCK
      ?auto_368307 - BLOCK
      ?auto_368308 - BLOCK
      ?auto_368309 - BLOCK
      ?auto_368310 - BLOCK
      ?auto_368311 - BLOCK
      ?auto_368312 - BLOCK
      ?auto_368313 - BLOCK
      ?auto_368314 - BLOCK
      ?auto_368315 - BLOCK
    )
    :vars
    (
      ?auto_368316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_368315 ?auto_368316 ) ( ON-TABLE ?auto_368304 ) ( ON ?auto_368305 ?auto_368304 ) ( ON ?auto_368306 ?auto_368305 ) ( ON ?auto_368307 ?auto_368306 ) ( ON ?auto_368308 ?auto_368307 ) ( not ( = ?auto_368304 ?auto_368305 ) ) ( not ( = ?auto_368304 ?auto_368306 ) ) ( not ( = ?auto_368304 ?auto_368307 ) ) ( not ( = ?auto_368304 ?auto_368308 ) ) ( not ( = ?auto_368304 ?auto_368309 ) ) ( not ( = ?auto_368304 ?auto_368310 ) ) ( not ( = ?auto_368304 ?auto_368311 ) ) ( not ( = ?auto_368304 ?auto_368312 ) ) ( not ( = ?auto_368304 ?auto_368313 ) ) ( not ( = ?auto_368304 ?auto_368314 ) ) ( not ( = ?auto_368304 ?auto_368315 ) ) ( not ( = ?auto_368304 ?auto_368316 ) ) ( not ( = ?auto_368305 ?auto_368306 ) ) ( not ( = ?auto_368305 ?auto_368307 ) ) ( not ( = ?auto_368305 ?auto_368308 ) ) ( not ( = ?auto_368305 ?auto_368309 ) ) ( not ( = ?auto_368305 ?auto_368310 ) ) ( not ( = ?auto_368305 ?auto_368311 ) ) ( not ( = ?auto_368305 ?auto_368312 ) ) ( not ( = ?auto_368305 ?auto_368313 ) ) ( not ( = ?auto_368305 ?auto_368314 ) ) ( not ( = ?auto_368305 ?auto_368315 ) ) ( not ( = ?auto_368305 ?auto_368316 ) ) ( not ( = ?auto_368306 ?auto_368307 ) ) ( not ( = ?auto_368306 ?auto_368308 ) ) ( not ( = ?auto_368306 ?auto_368309 ) ) ( not ( = ?auto_368306 ?auto_368310 ) ) ( not ( = ?auto_368306 ?auto_368311 ) ) ( not ( = ?auto_368306 ?auto_368312 ) ) ( not ( = ?auto_368306 ?auto_368313 ) ) ( not ( = ?auto_368306 ?auto_368314 ) ) ( not ( = ?auto_368306 ?auto_368315 ) ) ( not ( = ?auto_368306 ?auto_368316 ) ) ( not ( = ?auto_368307 ?auto_368308 ) ) ( not ( = ?auto_368307 ?auto_368309 ) ) ( not ( = ?auto_368307 ?auto_368310 ) ) ( not ( = ?auto_368307 ?auto_368311 ) ) ( not ( = ?auto_368307 ?auto_368312 ) ) ( not ( = ?auto_368307 ?auto_368313 ) ) ( not ( = ?auto_368307 ?auto_368314 ) ) ( not ( = ?auto_368307 ?auto_368315 ) ) ( not ( = ?auto_368307 ?auto_368316 ) ) ( not ( = ?auto_368308 ?auto_368309 ) ) ( not ( = ?auto_368308 ?auto_368310 ) ) ( not ( = ?auto_368308 ?auto_368311 ) ) ( not ( = ?auto_368308 ?auto_368312 ) ) ( not ( = ?auto_368308 ?auto_368313 ) ) ( not ( = ?auto_368308 ?auto_368314 ) ) ( not ( = ?auto_368308 ?auto_368315 ) ) ( not ( = ?auto_368308 ?auto_368316 ) ) ( not ( = ?auto_368309 ?auto_368310 ) ) ( not ( = ?auto_368309 ?auto_368311 ) ) ( not ( = ?auto_368309 ?auto_368312 ) ) ( not ( = ?auto_368309 ?auto_368313 ) ) ( not ( = ?auto_368309 ?auto_368314 ) ) ( not ( = ?auto_368309 ?auto_368315 ) ) ( not ( = ?auto_368309 ?auto_368316 ) ) ( not ( = ?auto_368310 ?auto_368311 ) ) ( not ( = ?auto_368310 ?auto_368312 ) ) ( not ( = ?auto_368310 ?auto_368313 ) ) ( not ( = ?auto_368310 ?auto_368314 ) ) ( not ( = ?auto_368310 ?auto_368315 ) ) ( not ( = ?auto_368310 ?auto_368316 ) ) ( not ( = ?auto_368311 ?auto_368312 ) ) ( not ( = ?auto_368311 ?auto_368313 ) ) ( not ( = ?auto_368311 ?auto_368314 ) ) ( not ( = ?auto_368311 ?auto_368315 ) ) ( not ( = ?auto_368311 ?auto_368316 ) ) ( not ( = ?auto_368312 ?auto_368313 ) ) ( not ( = ?auto_368312 ?auto_368314 ) ) ( not ( = ?auto_368312 ?auto_368315 ) ) ( not ( = ?auto_368312 ?auto_368316 ) ) ( not ( = ?auto_368313 ?auto_368314 ) ) ( not ( = ?auto_368313 ?auto_368315 ) ) ( not ( = ?auto_368313 ?auto_368316 ) ) ( not ( = ?auto_368314 ?auto_368315 ) ) ( not ( = ?auto_368314 ?auto_368316 ) ) ( not ( = ?auto_368315 ?auto_368316 ) ) ( ON ?auto_368314 ?auto_368315 ) ( ON ?auto_368313 ?auto_368314 ) ( ON ?auto_368312 ?auto_368313 ) ( ON ?auto_368311 ?auto_368312 ) ( ON ?auto_368310 ?auto_368311 ) ( CLEAR ?auto_368308 ) ( ON ?auto_368309 ?auto_368310 ) ( CLEAR ?auto_368309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_368304 ?auto_368305 ?auto_368306 ?auto_368307 ?auto_368308 ?auto_368309 )
      ( MAKE-12PILE ?auto_368304 ?auto_368305 ?auto_368306 ?auto_368307 ?auto_368308 ?auto_368309 ?auto_368310 ?auto_368311 ?auto_368312 ?auto_368313 ?auto_368314 ?auto_368315 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_368354 - BLOCK
      ?auto_368355 - BLOCK
      ?auto_368356 - BLOCK
      ?auto_368357 - BLOCK
      ?auto_368358 - BLOCK
      ?auto_368359 - BLOCK
      ?auto_368360 - BLOCK
      ?auto_368361 - BLOCK
      ?auto_368362 - BLOCK
      ?auto_368363 - BLOCK
      ?auto_368364 - BLOCK
      ?auto_368365 - BLOCK
    )
    :vars
    (
      ?auto_368366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_368365 ?auto_368366 ) ( ON-TABLE ?auto_368354 ) ( ON ?auto_368355 ?auto_368354 ) ( ON ?auto_368356 ?auto_368355 ) ( ON ?auto_368357 ?auto_368356 ) ( not ( = ?auto_368354 ?auto_368355 ) ) ( not ( = ?auto_368354 ?auto_368356 ) ) ( not ( = ?auto_368354 ?auto_368357 ) ) ( not ( = ?auto_368354 ?auto_368358 ) ) ( not ( = ?auto_368354 ?auto_368359 ) ) ( not ( = ?auto_368354 ?auto_368360 ) ) ( not ( = ?auto_368354 ?auto_368361 ) ) ( not ( = ?auto_368354 ?auto_368362 ) ) ( not ( = ?auto_368354 ?auto_368363 ) ) ( not ( = ?auto_368354 ?auto_368364 ) ) ( not ( = ?auto_368354 ?auto_368365 ) ) ( not ( = ?auto_368354 ?auto_368366 ) ) ( not ( = ?auto_368355 ?auto_368356 ) ) ( not ( = ?auto_368355 ?auto_368357 ) ) ( not ( = ?auto_368355 ?auto_368358 ) ) ( not ( = ?auto_368355 ?auto_368359 ) ) ( not ( = ?auto_368355 ?auto_368360 ) ) ( not ( = ?auto_368355 ?auto_368361 ) ) ( not ( = ?auto_368355 ?auto_368362 ) ) ( not ( = ?auto_368355 ?auto_368363 ) ) ( not ( = ?auto_368355 ?auto_368364 ) ) ( not ( = ?auto_368355 ?auto_368365 ) ) ( not ( = ?auto_368355 ?auto_368366 ) ) ( not ( = ?auto_368356 ?auto_368357 ) ) ( not ( = ?auto_368356 ?auto_368358 ) ) ( not ( = ?auto_368356 ?auto_368359 ) ) ( not ( = ?auto_368356 ?auto_368360 ) ) ( not ( = ?auto_368356 ?auto_368361 ) ) ( not ( = ?auto_368356 ?auto_368362 ) ) ( not ( = ?auto_368356 ?auto_368363 ) ) ( not ( = ?auto_368356 ?auto_368364 ) ) ( not ( = ?auto_368356 ?auto_368365 ) ) ( not ( = ?auto_368356 ?auto_368366 ) ) ( not ( = ?auto_368357 ?auto_368358 ) ) ( not ( = ?auto_368357 ?auto_368359 ) ) ( not ( = ?auto_368357 ?auto_368360 ) ) ( not ( = ?auto_368357 ?auto_368361 ) ) ( not ( = ?auto_368357 ?auto_368362 ) ) ( not ( = ?auto_368357 ?auto_368363 ) ) ( not ( = ?auto_368357 ?auto_368364 ) ) ( not ( = ?auto_368357 ?auto_368365 ) ) ( not ( = ?auto_368357 ?auto_368366 ) ) ( not ( = ?auto_368358 ?auto_368359 ) ) ( not ( = ?auto_368358 ?auto_368360 ) ) ( not ( = ?auto_368358 ?auto_368361 ) ) ( not ( = ?auto_368358 ?auto_368362 ) ) ( not ( = ?auto_368358 ?auto_368363 ) ) ( not ( = ?auto_368358 ?auto_368364 ) ) ( not ( = ?auto_368358 ?auto_368365 ) ) ( not ( = ?auto_368358 ?auto_368366 ) ) ( not ( = ?auto_368359 ?auto_368360 ) ) ( not ( = ?auto_368359 ?auto_368361 ) ) ( not ( = ?auto_368359 ?auto_368362 ) ) ( not ( = ?auto_368359 ?auto_368363 ) ) ( not ( = ?auto_368359 ?auto_368364 ) ) ( not ( = ?auto_368359 ?auto_368365 ) ) ( not ( = ?auto_368359 ?auto_368366 ) ) ( not ( = ?auto_368360 ?auto_368361 ) ) ( not ( = ?auto_368360 ?auto_368362 ) ) ( not ( = ?auto_368360 ?auto_368363 ) ) ( not ( = ?auto_368360 ?auto_368364 ) ) ( not ( = ?auto_368360 ?auto_368365 ) ) ( not ( = ?auto_368360 ?auto_368366 ) ) ( not ( = ?auto_368361 ?auto_368362 ) ) ( not ( = ?auto_368361 ?auto_368363 ) ) ( not ( = ?auto_368361 ?auto_368364 ) ) ( not ( = ?auto_368361 ?auto_368365 ) ) ( not ( = ?auto_368361 ?auto_368366 ) ) ( not ( = ?auto_368362 ?auto_368363 ) ) ( not ( = ?auto_368362 ?auto_368364 ) ) ( not ( = ?auto_368362 ?auto_368365 ) ) ( not ( = ?auto_368362 ?auto_368366 ) ) ( not ( = ?auto_368363 ?auto_368364 ) ) ( not ( = ?auto_368363 ?auto_368365 ) ) ( not ( = ?auto_368363 ?auto_368366 ) ) ( not ( = ?auto_368364 ?auto_368365 ) ) ( not ( = ?auto_368364 ?auto_368366 ) ) ( not ( = ?auto_368365 ?auto_368366 ) ) ( ON ?auto_368364 ?auto_368365 ) ( ON ?auto_368363 ?auto_368364 ) ( ON ?auto_368362 ?auto_368363 ) ( ON ?auto_368361 ?auto_368362 ) ( ON ?auto_368360 ?auto_368361 ) ( ON ?auto_368359 ?auto_368360 ) ( CLEAR ?auto_368357 ) ( ON ?auto_368358 ?auto_368359 ) ( CLEAR ?auto_368358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_368354 ?auto_368355 ?auto_368356 ?auto_368357 ?auto_368358 )
      ( MAKE-12PILE ?auto_368354 ?auto_368355 ?auto_368356 ?auto_368357 ?auto_368358 ?auto_368359 ?auto_368360 ?auto_368361 ?auto_368362 ?auto_368363 ?auto_368364 ?auto_368365 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_368404 - BLOCK
      ?auto_368405 - BLOCK
      ?auto_368406 - BLOCK
      ?auto_368407 - BLOCK
      ?auto_368408 - BLOCK
      ?auto_368409 - BLOCK
      ?auto_368410 - BLOCK
      ?auto_368411 - BLOCK
      ?auto_368412 - BLOCK
      ?auto_368413 - BLOCK
      ?auto_368414 - BLOCK
      ?auto_368415 - BLOCK
    )
    :vars
    (
      ?auto_368416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_368415 ?auto_368416 ) ( ON-TABLE ?auto_368404 ) ( ON ?auto_368405 ?auto_368404 ) ( ON ?auto_368406 ?auto_368405 ) ( not ( = ?auto_368404 ?auto_368405 ) ) ( not ( = ?auto_368404 ?auto_368406 ) ) ( not ( = ?auto_368404 ?auto_368407 ) ) ( not ( = ?auto_368404 ?auto_368408 ) ) ( not ( = ?auto_368404 ?auto_368409 ) ) ( not ( = ?auto_368404 ?auto_368410 ) ) ( not ( = ?auto_368404 ?auto_368411 ) ) ( not ( = ?auto_368404 ?auto_368412 ) ) ( not ( = ?auto_368404 ?auto_368413 ) ) ( not ( = ?auto_368404 ?auto_368414 ) ) ( not ( = ?auto_368404 ?auto_368415 ) ) ( not ( = ?auto_368404 ?auto_368416 ) ) ( not ( = ?auto_368405 ?auto_368406 ) ) ( not ( = ?auto_368405 ?auto_368407 ) ) ( not ( = ?auto_368405 ?auto_368408 ) ) ( not ( = ?auto_368405 ?auto_368409 ) ) ( not ( = ?auto_368405 ?auto_368410 ) ) ( not ( = ?auto_368405 ?auto_368411 ) ) ( not ( = ?auto_368405 ?auto_368412 ) ) ( not ( = ?auto_368405 ?auto_368413 ) ) ( not ( = ?auto_368405 ?auto_368414 ) ) ( not ( = ?auto_368405 ?auto_368415 ) ) ( not ( = ?auto_368405 ?auto_368416 ) ) ( not ( = ?auto_368406 ?auto_368407 ) ) ( not ( = ?auto_368406 ?auto_368408 ) ) ( not ( = ?auto_368406 ?auto_368409 ) ) ( not ( = ?auto_368406 ?auto_368410 ) ) ( not ( = ?auto_368406 ?auto_368411 ) ) ( not ( = ?auto_368406 ?auto_368412 ) ) ( not ( = ?auto_368406 ?auto_368413 ) ) ( not ( = ?auto_368406 ?auto_368414 ) ) ( not ( = ?auto_368406 ?auto_368415 ) ) ( not ( = ?auto_368406 ?auto_368416 ) ) ( not ( = ?auto_368407 ?auto_368408 ) ) ( not ( = ?auto_368407 ?auto_368409 ) ) ( not ( = ?auto_368407 ?auto_368410 ) ) ( not ( = ?auto_368407 ?auto_368411 ) ) ( not ( = ?auto_368407 ?auto_368412 ) ) ( not ( = ?auto_368407 ?auto_368413 ) ) ( not ( = ?auto_368407 ?auto_368414 ) ) ( not ( = ?auto_368407 ?auto_368415 ) ) ( not ( = ?auto_368407 ?auto_368416 ) ) ( not ( = ?auto_368408 ?auto_368409 ) ) ( not ( = ?auto_368408 ?auto_368410 ) ) ( not ( = ?auto_368408 ?auto_368411 ) ) ( not ( = ?auto_368408 ?auto_368412 ) ) ( not ( = ?auto_368408 ?auto_368413 ) ) ( not ( = ?auto_368408 ?auto_368414 ) ) ( not ( = ?auto_368408 ?auto_368415 ) ) ( not ( = ?auto_368408 ?auto_368416 ) ) ( not ( = ?auto_368409 ?auto_368410 ) ) ( not ( = ?auto_368409 ?auto_368411 ) ) ( not ( = ?auto_368409 ?auto_368412 ) ) ( not ( = ?auto_368409 ?auto_368413 ) ) ( not ( = ?auto_368409 ?auto_368414 ) ) ( not ( = ?auto_368409 ?auto_368415 ) ) ( not ( = ?auto_368409 ?auto_368416 ) ) ( not ( = ?auto_368410 ?auto_368411 ) ) ( not ( = ?auto_368410 ?auto_368412 ) ) ( not ( = ?auto_368410 ?auto_368413 ) ) ( not ( = ?auto_368410 ?auto_368414 ) ) ( not ( = ?auto_368410 ?auto_368415 ) ) ( not ( = ?auto_368410 ?auto_368416 ) ) ( not ( = ?auto_368411 ?auto_368412 ) ) ( not ( = ?auto_368411 ?auto_368413 ) ) ( not ( = ?auto_368411 ?auto_368414 ) ) ( not ( = ?auto_368411 ?auto_368415 ) ) ( not ( = ?auto_368411 ?auto_368416 ) ) ( not ( = ?auto_368412 ?auto_368413 ) ) ( not ( = ?auto_368412 ?auto_368414 ) ) ( not ( = ?auto_368412 ?auto_368415 ) ) ( not ( = ?auto_368412 ?auto_368416 ) ) ( not ( = ?auto_368413 ?auto_368414 ) ) ( not ( = ?auto_368413 ?auto_368415 ) ) ( not ( = ?auto_368413 ?auto_368416 ) ) ( not ( = ?auto_368414 ?auto_368415 ) ) ( not ( = ?auto_368414 ?auto_368416 ) ) ( not ( = ?auto_368415 ?auto_368416 ) ) ( ON ?auto_368414 ?auto_368415 ) ( ON ?auto_368413 ?auto_368414 ) ( ON ?auto_368412 ?auto_368413 ) ( ON ?auto_368411 ?auto_368412 ) ( ON ?auto_368410 ?auto_368411 ) ( ON ?auto_368409 ?auto_368410 ) ( ON ?auto_368408 ?auto_368409 ) ( CLEAR ?auto_368406 ) ( ON ?auto_368407 ?auto_368408 ) ( CLEAR ?auto_368407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_368404 ?auto_368405 ?auto_368406 ?auto_368407 )
      ( MAKE-12PILE ?auto_368404 ?auto_368405 ?auto_368406 ?auto_368407 ?auto_368408 ?auto_368409 ?auto_368410 ?auto_368411 ?auto_368412 ?auto_368413 ?auto_368414 ?auto_368415 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_368454 - BLOCK
      ?auto_368455 - BLOCK
      ?auto_368456 - BLOCK
      ?auto_368457 - BLOCK
      ?auto_368458 - BLOCK
      ?auto_368459 - BLOCK
      ?auto_368460 - BLOCK
      ?auto_368461 - BLOCK
      ?auto_368462 - BLOCK
      ?auto_368463 - BLOCK
      ?auto_368464 - BLOCK
      ?auto_368465 - BLOCK
    )
    :vars
    (
      ?auto_368466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_368465 ?auto_368466 ) ( ON-TABLE ?auto_368454 ) ( ON ?auto_368455 ?auto_368454 ) ( not ( = ?auto_368454 ?auto_368455 ) ) ( not ( = ?auto_368454 ?auto_368456 ) ) ( not ( = ?auto_368454 ?auto_368457 ) ) ( not ( = ?auto_368454 ?auto_368458 ) ) ( not ( = ?auto_368454 ?auto_368459 ) ) ( not ( = ?auto_368454 ?auto_368460 ) ) ( not ( = ?auto_368454 ?auto_368461 ) ) ( not ( = ?auto_368454 ?auto_368462 ) ) ( not ( = ?auto_368454 ?auto_368463 ) ) ( not ( = ?auto_368454 ?auto_368464 ) ) ( not ( = ?auto_368454 ?auto_368465 ) ) ( not ( = ?auto_368454 ?auto_368466 ) ) ( not ( = ?auto_368455 ?auto_368456 ) ) ( not ( = ?auto_368455 ?auto_368457 ) ) ( not ( = ?auto_368455 ?auto_368458 ) ) ( not ( = ?auto_368455 ?auto_368459 ) ) ( not ( = ?auto_368455 ?auto_368460 ) ) ( not ( = ?auto_368455 ?auto_368461 ) ) ( not ( = ?auto_368455 ?auto_368462 ) ) ( not ( = ?auto_368455 ?auto_368463 ) ) ( not ( = ?auto_368455 ?auto_368464 ) ) ( not ( = ?auto_368455 ?auto_368465 ) ) ( not ( = ?auto_368455 ?auto_368466 ) ) ( not ( = ?auto_368456 ?auto_368457 ) ) ( not ( = ?auto_368456 ?auto_368458 ) ) ( not ( = ?auto_368456 ?auto_368459 ) ) ( not ( = ?auto_368456 ?auto_368460 ) ) ( not ( = ?auto_368456 ?auto_368461 ) ) ( not ( = ?auto_368456 ?auto_368462 ) ) ( not ( = ?auto_368456 ?auto_368463 ) ) ( not ( = ?auto_368456 ?auto_368464 ) ) ( not ( = ?auto_368456 ?auto_368465 ) ) ( not ( = ?auto_368456 ?auto_368466 ) ) ( not ( = ?auto_368457 ?auto_368458 ) ) ( not ( = ?auto_368457 ?auto_368459 ) ) ( not ( = ?auto_368457 ?auto_368460 ) ) ( not ( = ?auto_368457 ?auto_368461 ) ) ( not ( = ?auto_368457 ?auto_368462 ) ) ( not ( = ?auto_368457 ?auto_368463 ) ) ( not ( = ?auto_368457 ?auto_368464 ) ) ( not ( = ?auto_368457 ?auto_368465 ) ) ( not ( = ?auto_368457 ?auto_368466 ) ) ( not ( = ?auto_368458 ?auto_368459 ) ) ( not ( = ?auto_368458 ?auto_368460 ) ) ( not ( = ?auto_368458 ?auto_368461 ) ) ( not ( = ?auto_368458 ?auto_368462 ) ) ( not ( = ?auto_368458 ?auto_368463 ) ) ( not ( = ?auto_368458 ?auto_368464 ) ) ( not ( = ?auto_368458 ?auto_368465 ) ) ( not ( = ?auto_368458 ?auto_368466 ) ) ( not ( = ?auto_368459 ?auto_368460 ) ) ( not ( = ?auto_368459 ?auto_368461 ) ) ( not ( = ?auto_368459 ?auto_368462 ) ) ( not ( = ?auto_368459 ?auto_368463 ) ) ( not ( = ?auto_368459 ?auto_368464 ) ) ( not ( = ?auto_368459 ?auto_368465 ) ) ( not ( = ?auto_368459 ?auto_368466 ) ) ( not ( = ?auto_368460 ?auto_368461 ) ) ( not ( = ?auto_368460 ?auto_368462 ) ) ( not ( = ?auto_368460 ?auto_368463 ) ) ( not ( = ?auto_368460 ?auto_368464 ) ) ( not ( = ?auto_368460 ?auto_368465 ) ) ( not ( = ?auto_368460 ?auto_368466 ) ) ( not ( = ?auto_368461 ?auto_368462 ) ) ( not ( = ?auto_368461 ?auto_368463 ) ) ( not ( = ?auto_368461 ?auto_368464 ) ) ( not ( = ?auto_368461 ?auto_368465 ) ) ( not ( = ?auto_368461 ?auto_368466 ) ) ( not ( = ?auto_368462 ?auto_368463 ) ) ( not ( = ?auto_368462 ?auto_368464 ) ) ( not ( = ?auto_368462 ?auto_368465 ) ) ( not ( = ?auto_368462 ?auto_368466 ) ) ( not ( = ?auto_368463 ?auto_368464 ) ) ( not ( = ?auto_368463 ?auto_368465 ) ) ( not ( = ?auto_368463 ?auto_368466 ) ) ( not ( = ?auto_368464 ?auto_368465 ) ) ( not ( = ?auto_368464 ?auto_368466 ) ) ( not ( = ?auto_368465 ?auto_368466 ) ) ( ON ?auto_368464 ?auto_368465 ) ( ON ?auto_368463 ?auto_368464 ) ( ON ?auto_368462 ?auto_368463 ) ( ON ?auto_368461 ?auto_368462 ) ( ON ?auto_368460 ?auto_368461 ) ( ON ?auto_368459 ?auto_368460 ) ( ON ?auto_368458 ?auto_368459 ) ( ON ?auto_368457 ?auto_368458 ) ( CLEAR ?auto_368455 ) ( ON ?auto_368456 ?auto_368457 ) ( CLEAR ?auto_368456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_368454 ?auto_368455 ?auto_368456 )
      ( MAKE-12PILE ?auto_368454 ?auto_368455 ?auto_368456 ?auto_368457 ?auto_368458 ?auto_368459 ?auto_368460 ?auto_368461 ?auto_368462 ?auto_368463 ?auto_368464 ?auto_368465 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_368504 - BLOCK
      ?auto_368505 - BLOCK
      ?auto_368506 - BLOCK
      ?auto_368507 - BLOCK
      ?auto_368508 - BLOCK
      ?auto_368509 - BLOCK
      ?auto_368510 - BLOCK
      ?auto_368511 - BLOCK
      ?auto_368512 - BLOCK
      ?auto_368513 - BLOCK
      ?auto_368514 - BLOCK
      ?auto_368515 - BLOCK
    )
    :vars
    (
      ?auto_368516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_368515 ?auto_368516 ) ( ON-TABLE ?auto_368504 ) ( not ( = ?auto_368504 ?auto_368505 ) ) ( not ( = ?auto_368504 ?auto_368506 ) ) ( not ( = ?auto_368504 ?auto_368507 ) ) ( not ( = ?auto_368504 ?auto_368508 ) ) ( not ( = ?auto_368504 ?auto_368509 ) ) ( not ( = ?auto_368504 ?auto_368510 ) ) ( not ( = ?auto_368504 ?auto_368511 ) ) ( not ( = ?auto_368504 ?auto_368512 ) ) ( not ( = ?auto_368504 ?auto_368513 ) ) ( not ( = ?auto_368504 ?auto_368514 ) ) ( not ( = ?auto_368504 ?auto_368515 ) ) ( not ( = ?auto_368504 ?auto_368516 ) ) ( not ( = ?auto_368505 ?auto_368506 ) ) ( not ( = ?auto_368505 ?auto_368507 ) ) ( not ( = ?auto_368505 ?auto_368508 ) ) ( not ( = ?auto_368505 ?auto_368509 ) ) ( not ( = ?auto_368505 ?auto_368510 ) ) ( not ( = ?auto_368505 ?auto_368511 ) ) ( not ( = ?auto_368505 ?auto_368512 ) ) ( not ( = ?auto_368505 ?auto_368513 ) ) ( not ( = ?auto_368505 ?auto_368514 ) ) ( not ( = ?auto_368505 ?auto_368515 ) ) ( not ( = ?auto_368505 ?auto_368516 ) ) ( not ( = ?auto_368506 ?auto_368507 ) ) ( not ( = ?auto_368506 ?auto_368508 ) ) ( not ( = ?auto_368506 ?auto_368509 ) ) ( not ( = ?auto_368506 ?auto_368510 ) ) ( not ( = ?auto_368506 ?auto_368511 ) ) ( not ( = ?auto_368506 ?auto_368512 ) ) ( not ( = ?auto_368506 ?auto_368513 ) ) ( not ( = ?auto_368506 ?auto_368514 ) ) ( not ( = ?auto_368506 ?auto_368515 ) ) ( not ( = ?auto_368506 ?auto_368516 ) ) ( not ( = ?auto_368507 ?auto_368508 ) ) ( not ( = ?auto_368507 ?auto_368509 ) ) ( not ( = ?auto_368507 ?auto_368510 ) ) ( not ( = ?auto_368507 ?auto_368511 ) ) ( not ( = ?auto_368507 ?auto_368512 ) ) ( not ( = ?auto_368507 ?auto_368513 ) ) ( not ( = ?auto_368507 ?auto_368514 ) ) ( not ( = ?auto_368507 ?auto_368515 ) ) ( not ( = ?auto_368507 ?auto_368516 ) ) ( not ( = ?auto_368508 ?auto_368509 ) ) ( not ( = ?auto_368508 ?auto_368510 ) ) ( not ( = ?auto_368508 ?auto_368511 ) ) ( not ( = ?auto_368508 ?auto_368512 ) ) ( not ( = ?auto_368508 ?auto_368513 ) ) ( not ( = ?auto_368508 ?auto_368514 ) ) ( not ( = ?auto_368508 ?auto_368515 ) ) ( not ( = ?auto_368508 ?auto_368516 ) ) ( not ( = ?auto_368509 ?auto_368510 ) ) ( not ( = ?auto_368509 ?auto_368511 ) ) ( not ( = ?auto_368509 ?auto_368512 ) ) ( not ( = ?auto_368509 ?auto_368513 ) ) ( not ( = ?auto_368509 ?auto_368514 ) ) ( not ( = ?auto_368509 ?auto_368515 ) ) ( not ( = ?auto_368509 ?auto_368516 ) ) ( not ( = ?auto_368510 ?auto_368511 ) ) ( not ( = ?auto_368510 ?auto_368512 ) ) ( not ( = ?auto_368510 ?auto_368513 ) ) ( not ( = ?auto_368510 ?auto_368514 ) ) ( not ( = ?auto_368510 ?auto_368515 ) ) ( not ( = ?auto_368510 ?auto_368516 ) ) ( not ( = ?auto_368511 ?auto_368512 ) ) ( not ( = ?auto_368511 ?auto_368513 ) ) ( not ( = ?auto_368511 ?auto_368514 ) ) ( not ( = ?auto_368511 ?auto_368515 ) ) ( not ( = ?auto_368511 ?auto_368516 ) ) ( not ( = ?auto_368512 ?auto_368513 ) ) ( not ( = ?auto_368512 ?auto_368514 ) ) ( not ( = ?auto_368512 ?auto_368515 ) ) ( not ( = ?auto_368512 ?auto_368516 ) ) ( not ( = ?auto_368513 ?auto_368514 ) ) ( not ( = ?auto_368513 ?auto_368515 ) ) ( not ( = ?auto_368513 ?auto_368516 ) ) ( not ( = ?auto_368514 ?auto_368515 ) ) ( not ( = ?auto_368514 ?auto_368516 ) ) ( not ( = ?auto_368515 ?auto_368516 ) ) ( ON ?auto_368514 ?auto_368515 ) ( ON ?auto_368513 ?auto_368514 ) ( ON ?auto_368512 ?auto_368513 ) ( ON ?auto_368511 ?auto_368512 ) ( ON ?auto_368510 ?auto_368511 ) ( ON ?auto_368509 ?auto_368510 ) ( ON ?auto_368508 ?auto_368509 ) ( ON ?auto_368507 ?auto_368508 ) ( ON ?auto_368506 ?auto_368507 ) ( CLEAR ?auto_368504 ) ( ON ?auto_368505 ?auto_368506 ) ( CLEAR ?auto_368505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_368504 ?auto_368505 )
      ( MAKE-12PILE ?auto_368504 ?auto_368505 ?auto_368506 ?auto_368507 ?auto_368508 ?auto_368509 ?auto_368510 ?auto_368511 ?auto_368512 ?auto_368513 ?auto_368514 ?auto_368515 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_368554 - BLOCK
      ?auto_368555 - BLOCK
      ?auto_368556 - BLOCK
      ?auto_368557 - BLOCK
      ?auto_368558 - BLOCK
      ?auto_368559 - BLOCK
      ?auto_368560 - BLOCK
      ?auto_368561 - BLOCK
      ?auto_368562 - BLOCK
      ?auto_368563 - BLOCK
      ?auto_368564 - BLOCK
      ?auto_368565 - BLOCK
    )
    :vars
    (
      ?auto_368566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_368565 ?auto_368566 ) ( not ( = ?auto_368554 ?auto_368555 ) ) ( not ( = ?auto_368554 ?auto_368556 ) ) ( not ( = ?auto_368554 ?auto_368557 ) ) ( not ( = ?auto_368554 ?auto_368558 ) ) ( not ( = ?auto_368554 ?auto_368559 ) ) ( not ( = ?auto_368554 ?auto_368560 ) ) ( not ( = ?auto_368554 ?auto_368561 ) ) ( not ( = ?auto_368554 ?auto_368562 ) ) ( not ( = ?auto_368554 ?auto_368563 ) ) ( not ( = ?auto_368554 ?auto_368564 ) ) ( not ( = ?auto_368554 ?auto_368565 ) ) ( not ( = ?auto_368554 ?auto_368566 ) ) ( not ( = ?auto_368555 ?auto_368556 ) ) ( not ( = ?auto_368555 ?auto_368557 ) ) ( not ( = ?auto_368555 ?auto_368558 ) ) ( not ( = ?auto_368555 ?auto_368559 ) ) ( not ( = ?auto_368555 ?auto_368560 ) ) ( not ( = ?auto_368555 ?auto_368561 ) ) ( not ( = ?auto_368555 ?auto_368562 ) ) ( not ( = ?auto_368555 ?auto_368563 ) ) ( not ( = ?auto_368555 ?auto_368564 ) ) ( not ( = ?auto_368555 ?auto_368565 ) ) ( not ( = ?auto_368555 ?auto_368566 ) ) ( not ( = ?auto_368556 ?auto_368557 ) ) ( not ( = ?auto_368556 ?auto_368558 ) ) ( not ( = ?auto_368556 ?auto_368559 ) ) ( not ( = ?auto_368556 ?auto_368560 ) ) ( not ( = ?auto_368556 ?auto_368561 ) ) ( not ( = ?auto_368556 ?auto_368562 ) ) ( not ( = ?auto_368556 ?auto_368563 ) ) ( not ( = ?auto_368556 ?auto_368564 ) ) ( not ( = ?auto_368556 ?auto_368565 ) ) ( not ( = ?auto_368556 ?auto_368566 ) ) ( not ( = ?auto_368557 ?auto_368558 ) ) ( not ( = ?auto_368557 ?auto_368559 ) ) ( not ( = ?auto_368557 ?auto_368560 ) ) ( not ( = ?auto_368557 ?auto_368561 ) ) ( not ( = ?auto_368557 ?auto_368562 ) ) ( not ( = ?auto_368557 ?auto_368563 ) ) ( not ( = ?auto_368557 ?auto_368564 ) ) ( not ( = ?auto_368557 ?auto_368565 ) ) ( not ( = ?auto_368557 ?auto_368566 ) ) ( not ( = ?auto_368558 ?auto_368559 ) ) ( not ( = ?auto_368558 ?auto_368560 ) ) ( not ( = ?auto_368558 ?auto_368561 ) ) ( not ( = ?auto_368558 ?auto_368562 ) ) ( not ( = ?auto_368558 ?auto_368563 ) ) ( not ( = ?auto_368558 ?auto_368564 ) ) ( not ( = ?auto_368558 ?auto_368565 ) ) ( not ( = ?auto_368558 ?auto_368566 ) ) ( not ( = ?auto_368559 ?auto_368560 ) ) ( not ( = ?auto_368559 ?auto_368561 ) ) ( not ( = ?auto_368559 ?auto_368562 ) ) ( not ( = ?auto_368559 ?auto_368563 ) ) ( not ( = ?auto_368559 ?auto_368564 ) ) ( not ( = ?auto_368559 ?auto_368565 ) ) ( not ( = ?auto_368559 ?auto_368566 ) ) ( not ( = ?auto_368560 ?auto_368561 ) ) ( not ( = ?auto_368560 ?auto_368562 ) ) ( not ( = ?auto_368560 ?auto_368563 ) ) ( not ( = ?auto_368560 ?auto_368564 ) ) ( not ( = ?auto_368560 ?auto_368565 ) ) ( not ( = ?auto_368560 ?auto_368566 ) ) ( not ( = ?auto_368561 ?auto_368562 ) ) ( not ( = ?auto_368561 ?auto_368563 ) ) ( not ( = ?auto_368561 ?auto_368564 ) ) ( not ( = ?auto_368561 ?auto_368565 ) ) ( not ( = ?auto_368561 ?auto_368566 ) ) ( not ( = ?auto_368562 ?auto_368563 ) ) ( not ( = ?auto_368562 ?auto_368564 ) ) ( not ( = ?auto_368562 ?auto_368565 ) ) ( not ( = ?auto_368562 ?auto_368566 ) ) ( not ( = ?auto_368563 ?auto_368564 ) ) ( not ( = ?auto_368563 ?auto_368565 ) ) ( not ( = ?auto_368563 ?auto_368566 ) ) ( not ( = ?auto_368564 ?auto_368565 ) ) ( not ( = ?auto_368564 ?auto_368566 ) ) ( not ( = ?auto_368565 ?auto_368566 ) ) ( ON ?auto_368564 ?auto_368565 ) ( ON ?auto_368563 ?auto_368564 ) ( ON ?auto_368562 ?auto_368563 ) ( ON ?auto_368561 ?auto_368562 ) ( ON ?auto_368560 ?auto_368561 ) ( ON ?auto_368559 ?auto_368560 ) ( ON ?auto_368558 ?auto_368559 ) ( ON ?auto_368557 ?auto_368558 ) ( ON ?auto_368556 ?auto_368557 ) ( ON ?auto_368555 ?auto_368556 ) ( ON ?auto_368554 ?auto_368555 ) ( CLEAR ?auto_368554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_368554 )
      ( MAKE-12PILE ?auto_368554 ?auto_368555 ?auto_368556 ?auto_368557 ?auto_368558 ?auto_368559 ?auto_368560 ?auto_368561 ?auto_368562 ?auto_368563 ?auto_368564 ?auto_368565 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_368605 - BLOCK
      ?auto_368606 - BLOCK
      ?auto_368607 - BLOCK
      ?auto_368608 - BLOCK
      ?auto_368609 - BLOCK
      ?auto_368610 - BLOCK
      ?auto_368611 - BLOCK
      ?auto_368612 - BLOCK
      ?auto_368613 - BLOCK
      ?auto_368614 - BLOCK
      ?auto_368615 - BLOCK
      ?auto_368616 - BLOCK
      ?auto_368617 - BLOCK
    )
    :vars
    (
      ?auto_368618 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_368616 ) ( ON ?auto_368617 ?auto_368618 ) ( CLEAR ?auto_368617 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_368605 ) ( ON ?auto_368606 ?auto_368605 ) ( ON ?auto_368607 ?auto_368606 ) ( ON ?auto_368608 ?auto_368607 ) ( ON ?auto_368609 ?auto_368608 ) ( ON ?auto_368610 ?auto_368609 ) ( ON ?auto_368611 ?auto_368610 ) ( ON ?auto_368612 ?auto_368611 ) ( ON ?auto_368613 ?auto_368612 ) ( ON ?auto_368614 ?auto_368613 ) ( ON ?auto_368615 ?auto_368614 ) ( ON ?auto_368616 ?auto_368615 ) ( not ( = ?auto_368605 ?auto_368606 ) ) ( not ( = ?auto_368605 ?auto_368607 ) ) ( not ( = ?auto_368605 ?auto_368608 ) ) ( not ( = ?auto_368605 ?auto_368609 ) ) ( not ( = ?auto_368605 ?auto_368610 ) ) ( not ( = ?auto_368605 ?auto_368611 ) ) ( not ( = ?auto_368605 ?auto_368612 ) ) ( not ( = ?auto_368605 ?auto_368613 ) ) ( not ( = ?auto_368605 ?auto_368614 ) ) ( not ( = ?auto_368605 ?auto_368615 ) ) ( not ( = ?auto_368605 ?auto_368616 ) ) ( not ( = ?auto_368605 ?auto_368617 ) ) ( not ( = ?auto_368605 ?auto_368618 ) ) ( not ( = ?auto_368606 ?auto_368607 ) ) ( not ( = ?auto_368606 ?auto_368608 ) ) ( not ( = ?auto_368606 ?auto_368609 ) ) ( not ( = ?auto_368606 ?auto_368610 ) ) ( not ( = ?auto_368606 ?auto_368611 ) ) ( not ( = ?auto_368606 ?auto_368612 ) ) ( not ( = ?auto_368606 ?auto_368613 ) ) ( not ( = ?auto_368606 ?auto_368614 ) ) ( not ( = ?auto_368606 ?auto_368615 ) ) ( not ( = ?auto_368606 ?auto_368616 ) ) ( not ( = ?auto_368606 ?auto_368617 ) ) ( not ( = ?auto_368606 ?auto_368618 ) ) ( not ( = ?auto_368607 ?auto_368608 ) ) ( not ( = ?auto_368607 ?auto_368609 ) ) ( not ( = ?auto_368607 ?auto_368610 ) ) ( not ( = ?auto_368607 ?auto_368611 ) ) ( not ( = ?auto_368607 ?auto_368612 ) ) ( not ( = ?auto_368607 ?auto_368613 ) ) ( not ( = ?auto_368607 ?auto_368614 ) ) ( not ( = ?auto_368607 ?auto_368615 ) ) ( not ( = ?auto_368607 ?auto_368616 ) ) ( not ( = ?auto_368607 ?auto_368617 ) ) ( not ( = ?auto_368607 ?auto_368618 ) ) ( not ( = ?auto_368608 ?auto_368609 ) ) ( not ( = ?auto_368608 ?auto_368610 ) ) ( not ( = ?auto_368608 ?auto_368611 ) ) ( not ( = ?auto_368608 ?auto_368612 ) ) ( not ( = ?auto_368608 ?auto_368613 ) ) ( not ( = ?auto_368608 ?auto_368614 ) ) ( not ( = ?auto_368608 ?auto_368615 ) ) ( not ( = ?auto_368608 ?auto_368616 ) ) ( not ( = ?auto_368608 ?auto_368617 ) ) ( not ( = ?auto_368608 ?auto_368618 ) ) ( not ( = ?auto_368609 ?auto_368610 ) ) ( not ( = ?auto_368609 ?auto_368611 ) ) ( not ( = ?auto_368609 ?auto_368612 ) ) ( not ( = ?auto_368609 ?auto_368613 ) ) ( not ( = ?auto_368609 ?auto_368614 ) ) ( not ( = ?auto_368609 ?auto_368615 ) ) ( not ( = ?auto_368609 ?auto_368616 ) ) ( not ( = ?auto_368609 ?auto_368617 ) ) ( not ( = ?auto_368609 ?auto_368618 ) ) ( not ( = ?auto_368610 ?auto_368611 ) ) ( not ( = ?auto_368610 ?auto_368612 ) ) ( not ( = ?auto_368610 ?auto_368613 ) ) ( not ( = ?auto_368610 ?auto_368614 ) ) ( not ( = ?auto_368610 ?auto_368615 ) ) ( not ( = ?auto_368610 ?auto_368616 ) ) ( not ( = ?auto_368610 ?auto_368617 ) ) ( not ( = ?auto_368610 ?auto_368618 ) ) ( not ( = ?auto_368611 ?auto_368612 ) ) ( not ( = ?auto_368611 ?auto_368613 ) ) ( not ( = ?auto_368611 ?auto_368614 ) ) ( not ( = ?auto_368611 ?auto_368615 ) ) ( not ( = ?auto_368611 ?auto_368616 ) ) ( not ( = ?auto_368611 ?auto_368617 ) ) ( not ( = ?auto_368611 ?auto_368618 ) ) ( not ( = ?auto_368612 ?auto_368613 ) ) ( not ( = ?auto_368612 ?auto_368614 ) ) ( not ( = ?auto_368612 ?auto_368615 ) ) ( not ( = ?auto_368612 ?auto_368616 ) ) ( not ( = ?auto_368612 ?auto_368617 ) ) ( not ( = ?auto_368612 ?auto_368618 ) ) ( not ( = ?auto_368613 ?auto_368614 ) ) ( not ( = ?auto_368613 ?auto_368615 ) ) ( not ( = ?auto_368613 ?auto_368616 ) ) ( not ( = ?auto_368613 ?auto_368617 ) ) ( not ( = ?auto_368613 ?auto_368618 ) ) ( not ( = ?auto_368614 ?auto_368615 ) ) ( not ( = ?auto_368614 ?auto_368616 ) ) ( not ( = ?auto_368614 ?auto_368617 ) ) ( not ( = ?auto_368614 ?auto_368618 ) ) ( not ( = ?auto_368615 ?auto_368616 ) ) ( not ( = ?auto_368615 ?auto_368617 ) ) ( not ( = ?auto_368615 ?auto_368618 ) ) ( not ( = ?auto_368616 ?auto_368617 ) ) ( not ( = ?auto_368616 ?auto_368618 ) ) ( not ( = ?auto_368617 ?auto_368618 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_368617 ?auto_368618 )
      ( !STACK ?auto_368617 ?auto_368616 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_368659 - BLOCK
      ?auto_368660 - BLOCK
      ?auto_368661 - BLOCK
      ?auto_368662 - BLOCK
      ?auto_368663 - BLOCK
      ?auto_368664 - BLOCK
      ?auto_368665 - BLOCK
      ?auto_368666 - BLOCK
      ?auto_368667 - BLOCK
      ?auto_368668 - BLOCK
      ?auto_368669 - BLOCK
      ?auto_368670 - BLOCK
      ?auto_368671 - BLOCK
    )
    :vars
    (
      ?auto_368672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_368671 ?auto_368672 ) ( ON-TABLE ?auto_368659 ) ( ON ?auto_368660 ?auto_368659 ) ( ON ?auto_368661 ?auto_368660 ) ( ON ?auto_368662 ?auto_368661 ) ( ON ?auto_368663 ?auto_368662 ) ( ON ?auto_368664 ?auto_368663 ) ( ON ?auto_368665 ?auto_368664 ) ( ON ?auto_368666 ?auto_368665 ) ( ON ?auto_368667 ?auto_368666 ) ( ON ?auto_368668 ?auto_368667 ) ( ON ?auto_368669 ?auto_368668 ) ( not ( = ?auto_368659 ?auto_368660 ) ) ( not ( = ?auto_368659 ?auto_368661 ) ) ( not ( = ?auto_368659 ?auto_368662 ) ) ( not ( = ?auto_368659 ?auto_368663 ) ) ( not ( = ?auto_368659 ?auto_368664 ) ) ( not ( = ?auto_368659 ?auto_368665 ) ) ( not ( = ?auto_368659 ?auto_368666 ) ) ( not ( = ?auto_368659 ?auto_368667 ) ) ( not ( = ?auto_368659 ?auto_368668 ) ) ( not ( = ?auto_368659 ?auto_368669 ) ) ( not ( = ?auto_368659 ?auto_368670 ) ) ( not ( = ?auto_368659 ?auto_368671 ) ) ( not ( = ?auto_368659 ?auto_368672 ) ) ( not ( = ?auto_368660 ?auto_368661 ) ) ( not ( = ?auto_368660 ?auto_368662 ) ) ( not ( = ?auto_368660 ?auto_368663 ) ) ( not ( = ?auto_368660 ?auto_368664 ) ) ( not ( = ?auto_368660 ?auto_368665 ) ) ( not ( = ?auto_368660 ?auto_368666 ) ) ( not ( = ?auto_368660 ?auto_368667 ) ) ( not ( = ?auto_368660 ?auto_368668 ) ) ( not ( = ?auto_368660 ?auto_368669 ) ) ( not ( = ?auto_368660 ?auto_368670 ) ) ( not ( = ?auto_368660 ?auto_368671 ) ) ( not ( = ?auto_368660 ?auto_368672 ) ) ( not ( = ?auto_368661 ?auto_368662 ) ) ( not ( = ?auto_368661 ?auto_368663 ) ) ( not ( = ?auto_368661 ?auto_368664 ) ) ( not ( = ?auto_368661 ?auto_368665 ) ) ( not ( = ?auto_368661 ?auto_368666 ) ) ( not ( = ?auto_368661 ?auto_368667 ) ) ( not ( = ?auto_368661 ?auto_368668 ) ) ( not ( = ?auto_368661 ?auto_368669 ) ) ( not ( = ?auto_368661 ?auto_368670 ) ) ( not ( = ?auto_368661 ?auto_368671 ) ) ( not ( = ?auto_368661 ?auto_368672 ) ) ( not ( = ?auto_368662 ?auto_368663 ) ) ( not ( = ?auto_368662 ?auto_368664 ) ) ( not ( = ?auto_368662 ?auto_368665 ) ) ( not ( = ?auto_368662 ?auto_368666 ) ) ( not ( = ?auto_368662 ?auto_368667 ) ) ( not ( = ?auto_368662 ?auto_368668 ) ) ( not ( = ?auto_368662 ?auto_368669 ) ) ( not ( = ?auto_368662 ?auto_368670 ) ) ( not ( = ?auto_368662 ?auto_368671 ) ) ( not ( = ?auto_368662 ?auto_368672 ) ) ( not ( = ?auto_368663 ?auto_368664 ) ) ( not ( = ?auto_368663 ?auto_368665 ) ) ( not ( = ?auto_368663 ?auto_368666 ) ) ( not ( = ?auto_368663 ?auto_368667 ) ) ( not ( = ?auto_368663 ?auto_368668 ) ) ( not ( = ?auto_368663 ?auto_368669 ) ) ( not ( = ?auto_368663 ?auto_368670 ) ) ( not ( = ?auto_368663 ?auto_368671 ) ) ( not ( = ?auto_368663 ?auto_368672 ) ) ( not ( = ?auto_368664 ?auto_368665 ) ) ( not ( = ?auto_368664 ?auto_368666 ) ) ( not ( = ?auto_368664 ?auto_368667 ) ) ( not ( = ?auto_368664 ?auto_368668 ) ) ( not ( = ?auto_368664 ?auto_368669 ) ) ( not ( = ?auto_368664 ?auto_368670 ) ) ( not ( = ?auto_368664 ?auto_368671 ) ) ( not ( = ?auto_368664 ?auto_368672 ) ) ( not ( = ?auto_368665 ?auto_368666 ) ) ( not ( = ?auto_368665 ?auto_368667 ) ) ( not ( = ?auto_368665 ?auto_368668 ) ) ( not ( = ?auto_368665 ?auto_368669 ) ) ( not ( = ?auto_368665 ?auto_368670 ) ) ( not ( = ?auto_368665 ?auto_368671 ) ) ( not ( = ?auto_368665 ?auto_368672 ) ) ( not ( = ?auto_368666 ?auto_368667 ) ) ( not ( = ?auto_368666 ?auto_368668 ) ) ( not ( = ?auto_368666 ?auto_368669 ) ) ( not ( = ?auto_368666 ?auto_368670 ) ) ( not ( = ?auto_368666 ?auto_368671 ) ) ( not ( = ?auto_368666 ?auto_368672 ) ) ( not ( = ?auto_368667 ?auto_368668 ) ) ( not ( = ?auto_368667 ?auto_368669 ) ) ( not ( = ?auto_368667 ?auto_368670 ) ) ( not ( = ?auto_368667 ?auto_368671 ) ) ( not ( = ?auto_368667 ?auto_368672 ) ) ( not ( = ?auto_368668 ?auto_368669 ) ) ( not ( = ?auto_368668 ?auto_368670 ) ) ( not ( = ?auto_368668 ?auto_368671 ) ) ( not ( = ?auto_368668 ?auto_368672 ) ) ( not ( = ?auto_368669 ?auto_368670 ) ) ( not ( = ?auto_368669 ?auto_368671 ) ) ( not ( = ?auto_368669 ?auto_368672 ) ) ( not ( = ?auto_368670 ?auto_368671 ) ) ( not ( = ?auto_368670 ?auto_368672 ) ) ( not ( = ?auto_368671 ?auto_368672 ) ) ( CLEAR ?auto_368669 ) ( ON ?auto_368670 ?auto_368671 ) ( CLEAR ?auto_368670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_368659 ?auto_368660 ?auto_368661 ?auto_368662 ?auto_368663 ?auto_368664 ?auto_368665 ?auto_368666 ?auto_368667 ?auto_368668 ?auto_368669 ?auto_368670 )
      ( MAKE-13PILE ?auto_368659 ?auto_368660 ?auto_368661 ?auto_368662 ?auto_368663 ?auto_368664 ?auto_368665 ?auto_368666 ?auto_368667 ?auto_368668 ?auto_368669 ?auto_368670 ?auto_368671 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_368713 - BLOCK
      ?auto_368714 - BLOCK
      ?auto_368715 - BLOCK
      ?auto_368716 - BLOCK
      ?auto_368717 - BLOCK
      ?auto_368718 - BLOCK
      ?auto_368719 - BLOCK
      ?auto_368720 - BLOCK
      ?auto_368721 - BLOCK
      ?auto_368722 - BLOCK
      ?auto_368723 - BLOCK
      ?auto_368724 - BLOCK
      ?auto_368725 - BLOCK
    )
    :vars
    (
      ?auto_368726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_368725 ?auto_368726 ) ( ON-TABLE ?auto_368713 ) ( ON ?auto_368714 ?auto_368713 ) ( ON ?auto_368715 ?auto_368714 ) ( ON ?auto_368716 ?auto_368715 ) ( ON ?auto_368717 ?auto_368716 ) ( ON ?auto_368718 ?auto_368717 ) ( ON ?auto_368719 ?auto_368718 ) ( ON ?auto_368720 ?auto_368719 ) ( ON ?auto_368721 ?auto_368720 ) ( ON ?auto_368722 ?auto_368721 ) ( not ( = ?auto_368713 ?auto_368714 ) ) ( not ( = ?auto_368713 ?auto_368715 ) ) ( not ( = ?auto_368713 ?auto_368716 ) ) ( not ( = ?auto_368713 ?auto_368717 ) ) ( not ( = ?auto_368713 ?auto_368718 ) ) ( not ( = ?auto_368713 ?auto_368719 ) ) ( not ( = ?auto_368713 ?auto_368720 ) ) ( not ( = ?auto_368713 ?auto_368721 ) ) ( not ( = ?auto_368713 ?auto_368722 ) ) ( not ( = ?auto_368713 ?auto_368723 ) ) ( not ( = ?auto_368713 ?auto_368724 ) ) ( not ( = ?auto_368713 ?auto_368725 ) ) ( not ( = ?auto_368713 ?auto_368726 ) ) ( not ( = ?auto_368714 ?auto_368715 ) ) ( not ( = ?auto_368714 ?auto_368716 ) ) ( not ( = ?auto_368714 ?auto_368717 ) ) ( not ( = ?auto_368714 ?auto_368718 ) ) ( not ( = ?auto_368714 ?auto_368719 ) ) ( not ( = ?auto_368714 ?auto_368720 ) ) ( not ( = ?auto_368714 ?auto_368721 ) ) ( not ( = ?auto_368714 ?auto_368722 ) ) ( not ( = ?auto_368714 ?auto_368723 ) ) ( not ( = ?auto_368714 ?auto_368724 ) ) ( not ( = ?auto_368714 ?auto_368725 ) ) ( not ( = ?auto_368714 ?auto_368726 ) ) ( not ( = ?auto_368715 ?auto_368716 ) ) ( not ( = ?auto_368715 ?auto_368717 ) ) ( not ( = ?auto_368715 ?auto_368718 ) ) ( not ( = ?auto_368715 ?auto_368719 ) ) ( not ( = ?auto_368715 ?auto_368720 ) ) ( not ( = ?auto_368715 ?auto_368721 ) ) ( not ( = ?auto_368715 ?auto_368722 ) ) ( not ( = ?auto_368715 ?auto_368723 ) ) ( not ( = ?auto_368715 ?auto_368724 ) ) ( not ( = ?auto_368715 ?auto_368725 ) ) ( not ( = ?auto_368715 ?auto_368726 ) ) ( not ( = ?auto_368716 ?auto_368717 ) ) ( not ( = ?auto_368716 ?auto_368718 ) ) ( not ( = ?auto_368716 ?auto_368719 ) ) ( not ( = ?auto_368716 ?auto_368720 ) ) ( not ( = ?auto_368716 ?auto_368721 ) ) ( not ( = ?auto_368716 ?auto_368722 ) ) ( not ( = ?auto_368716 ?auto_368723 ) ) ( not ( = ?auto_368716 ?auto_368724 ) ) ( not ( = ?auto_368716 ?auto_368725 ) ) ( not ( = ?auto_368716 ?auto_368726 ) ) ( not ( = ?auto_368717 ?auto_368718 ) ) ( not ( = ?auto_368717 ?auto_368719 ) ) ( not ( = ?auto_368717 ?auto_368720 ) ) ( not ( = ?auto_368717 ?auto_368721 ) ) ( not ( = ?auto_368717 ?auto_368722 ) ) ( not ( = ?auto_368717 ?auto_368723 ) ) ( not ( = ?auto_368717 ?auto_368724 ) ) ( not ( = ?auto_368717 ?auto_368725 ) ) ( not ( = ?auto_368717 ?auto_368726 ) ) ( not ( = ?auto_368718 ?auto_368719 ) ) ( not ( = ?auto_368718 ?auto_368720 ) ) ( not ( = ?auto_368718 ?auto_368721 ) ) ( not ( = ?auto_368718 ?auto_368722 ) ) ( not ( = ?auto_368718 ?auto_368723 ) ) ( not ( = ?auto_368718 ?auto_368724 ) ) ( not ( = ?auto_368718 ?auto_368725 ) ) ( not ( = ?auto_368718 ?auto_368726 ) ) ( not ( = ?auto_368719 ?auto_368720 ) ) ( not ( = ?auto_368719 ?auto_368721 ) ) ( not ( = ?auto_368719 ?auto_368722 ) ) ( not ( = ?auto_368719 ?auto_368723 ) ) ( not ( = ?auto_368719 ?auto_368724 ) ) ( not ( = ?auto_368719 ?auto_368725 ) ) ( not ( = ?auto_368719 ?auto_368726 ) ) ( not ( = ?auto_368720 ?auto_368721 ) ) ( not ( = ?auto_368720 ?auto_368722 ) ) ( not ( = ?auto_368720 ?auto_368723 ) ) ( not ( = ?auto_368720 ?auto_368724 ) ) ( not ( = ?auto_368720 ?auto_368725 ) ) ( not ( = ?auto_368720 ?auto_368726 ) ) ( not ( = ?auto_368721 ?auto_368722 ) ) ( not ( = ?auto_368721 ?auto_368723 ) ) ( not ( = ?auto_368721 ?auto_368724 ) ) ( not ( = ?auto_368721 ?auto_368725 ) ) ( not ( = ?auto_368721 ?auto_368726 ) ) ( not ( = ?auto_368722 ?auto_368723 ) ) ( not ( = ?auto_368722 ?auto_368724 ) ) ( not ( = ?auto_368722 ?auto_368725 ) ) ( not ( = ?auto_368722 ?auto_368726 ) ) ( not ( = ?auto_368723 ?auto_368724 ) ) ( not ( = ?auto_368723 ?auto_368725 ) ) ( not ( = ?auto_368723 ?auto_368726 ) ) ( not ( = ?auto_368724 ?auto_368725 ) ) ( not ( = ?auto_368724 ?auto_368726 ) ) ( not ( = ?auto_368725 ?auto_368726 ) ) ( ON ?auto_368724 ?auto_368725 ) ( CLEAR ?auto_368722 ) ( ON ?auto_368723 ?auto_368724 ) ( CLEAR ?auto_368723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_368713 ?auto_368714 ?auto_368715 ?auto_368716 ?auto_368717 ?auto_368718 ?auto_368719 ?auto_368720 ?auto_368721 ?auto_368722 ?auto_368723 )
      ( MAKE-13PILE ?auto_368713 ?auto_368714 ?auto_368715 ?auto_368716 ?auto_368717 ?auto_368718 ?auto_368719 ?auto_368720 ?auto_368721 ?auto_368722 ?auto_368723 ?auto_368724 ?auto_368725 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_368767 - BLOCK
      ?auto_368768 - BLOCK
      ?auto_368769 - BLOCK
      ?auto_368770 - BLOCK
      ?auto_368771 - BLOCK
      ?auto_368772 - BLOCK
      ?auto_368773 - BLOCK
      ?auto_368774 - BLOCK
      ?auto_368775 - BLOCK
      ?auto_368776 - BLOCK
      ?auto_368777 - BLOCK
      ?auto_368778 - BLOCK
      ?auto_368779 - BLOCK
    )
    :vars
    (
      ?auto_368780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_368779 ?auto_368780 ) ( ON-TABLE ?auto_368767 ) ( ON ?auto_368768 ?auto_368767 ) ( ON ?auto_368769 ?auto_368768 ) ( ON ?auto_368770 ?auto_368769 ) ( ON ?auto_368771 ?auto_368770 ) ( ON ?auto_368772 ?auto_368771 ) ( ON ?auto_368773 ?auto_368772 ) ( ON ?auto_368774 ?auto_368773 ) ( ON ?auto_368775 ?auto_368774 ) ( not ( = ?auto_368767 ?auto_368768 ) ) ( not ( = ?auto_368767 ?auto_368769 ) ) ( not ( = ?auto_368767 ?auto_368770 ) ) ( not ( = ?auto_368767 ?auto_368771 ) ) ( not ( = ?auto_368767 ?auto_368772 ) ) ( not ( = ?auto_368767 ?auto_368773 ) ) ( not ( = ?auto_368767 ?auto_368774 ) ) ( not ( = ?auto_368767 ?auto_368775 ) ) ( not ( = ?auto_368767 ?auto_368776 ) ) ( not ( = ?auto_368767 ?auto_368777 ) ) ( not ( = ?auto_368767 ?auto_368778 ) ) ( not ( = ?auto_368767 ?auto_368779 ) ) ( not ( = ?auto_368767 ?auto_368780 ) ) ( not ( = ?auto_368768 ?auto_368769 ) ) ( not ( = ?auto_368768 ?auto_368770 ) ) ( not ( = ?auto_368768 ?auto_368771 ) ) ( not ( = ?auto_368768 ?auto_368772 ) ) ( not ( = ?auto_368768 ?auto_368773 ) ) ( not ( = ?auto_368768 ?auto_368774 ) ) ( not ( = ?auto_368768 ?auto_368775 ) ) ( not ( = ?auto_368768 ?auto_368776 ) ) ( not ( = ?auto_368768 ?auto_368777 ) ) ( not ( = ?auto_368768 ?auto_368778 ) ) ( not ( = ?auto_368768 ?auto_368779 ) ) ( not ( = ?auto_368768 ?auto_368780 ) ) ( not ( = ?auto_368769 ?auto_368770 ) ) ( not ( = ?auto_368769 ?auto_368771 ) ) ( not ( = ?auto_368769 ?auto_368772 ) ) ( not ( = ?auto_368769 ?auto_368773 ) ) ( not ( = ?auto_368769 ?auto_368774 ) ) ( not ( = ?auto_368769 ?auto_368775 ) ) ( not ( = ?auto_368769 ?auto_368776 ) ) ( not ( = ?auto_368769 ?auto_368777 ) ) ( not ( = ?auto_368769 ?auto_368778 ) ) ( not ( = ?auto_368769 ?auto_368779 ) ) ( not ( = ?auto_368769 ?auto_368780 ) ) ( not ( = ?auto_368770 ?auto_368771 ) ) ( not ( = ?auto_368770 ?auto_368772 ) ) ( not ( = ?auto_368770 ?auto_368773 ) ) ( not ( = ?auto_368770 ?auto_368774 ) ) ( not ( = ?auto_368770 ?auto_368775 ) ) ( not ( = ?auto_368770 ?auto_368776 ) ) ( not ( = ?auto_368770 ?auto_368777 ) ) ( not ( = ?auto_368770 ?auto_368778 ) ) ( not ( = ?auto_368770 ?auto_368779 ) ) ( not ( = ?auto_368770 ?auto_368780 ) ) ( not ( = ?auto_368771 ?auto_368772 ) ) ( not ( = ?auto_368771 ?auto_368773 ) ) ( not ( = ?auto_368771 ?auto_368774 ) ) ( not ( = ?auto_368771 ?auto_368775 ) ) ( not ( = ?auto_368771 ?auto_368776 ) ) ( not ( = ?auto_368771 ?auto_368777 ) ) ( not ( = ?auto_368771 ?auto_368778 ) ) ( not ( = ?auto_368771 ?auto_368779 ) ) ( not ( = ?auto_368771 ?auto_368780 ) ) ( not ( = ?auto_368772 ?auto_368773 ) ) ( not ( = ?auto_368772 ?auto_368774 ) ) ( not ( = ?auto_368772 ?auto_368775 ) ) ( not ( = ?auto_368772 ?auto_368776 ) ) ( not ( = ?auto_368772 ?auto_368777 ) ) ( not ( = ?auto_368772 ?auto_368778 ) ) ( not ( = ?auto_368772 ?auto_368779 ) ) ( not ( = ?auto_368772 ?auto_368780 ) ) ( not ( = ?auto_368773 ?auto_368774 ) ) ( not ( = ?auto_368773 ?auto_368775 ) ) ( not ( = ?auto_368773 ?auto_368776 ) ) ( not ( = ?auto_368773 ?auto_368777 ) ) ( not ( = ?auto_368773 ?auto_368778 ) ) ( not ( = ?auto_368773 ?auto_368779 ) ) ( not ( = ?auto_368773 ?auto_368780 ) ) ( not ( = ?auto_368774 ?auto_368775 ) ) ( not ( = ?auto_368774 ?auto_368776 ) ) ( not ( = ?auto_368774 ?auto_368777 ) ) ( not ( = ?auto_368774 ?auto_368778 ) ) ( not ( = ?auto_368774 ?auto_368779 ) ) ( not ( = ?auto_368774 ?auto_368780 ) ) ( not ( = ?auto_368775 ?auto_368776 ) ) ( not ( = ?auto_368775 ?auto_368777 ) ) ( not ( = ?auto_368775 ?auto_368778 ) ) ( not ( = ?auto_368775 ?auto_368779 ) ) ( not ( = ?auto_368775 ?auto_368780 ) ) ( not ( = ?auto_368776 ?auto_368777 ) ) ( not ( = ?auto_368776 ?auto_368778 ) ) ( not ( = ?auto_368776 ?auto_368779 ) ) ( not ( = ?auto_368776 ?auto_368780 ) ) ( not ( = ?auto_368777 ?auto_368778 ) ) ( not ( = ?auto_368777 ?auto_368779 ) ) ( not ( = ?auto_368777 ?auto_368780 ) ) ( not ( = ?auto_368778 ?auto_368779 ) ) ( not ( = ?auto_368778 ?auto_368780 ) ) ( not ( = ?auto_368779 ?auto_368780 ) ) ( ON ?auto_368778 ?auto_368779 ) ( ON ?auto_368777 ?auto_368778 ) ( CLEAR ?auto_368775 ) ( ON ?auto_368776 ?auto_368777 ) ( CLEAR ?auto_368776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_368767 ?auto_368768 ?auto_368769 ?auto_368770 ?auto_368771 ?auto_368772 ?auto_368773 ?auto_368774 ?auto_368775 ?auto_368776 )
      ( MAKE-13PILE ?auto_368767 ?auto_368768 ?auto_368769 ?auto_368770 ?auto_368771 ?auto_368772 ?auto_368773 ?auto_368774 ?auto_368775 ?auto_368776 ?auto_368777 ?auto_368778 ?auto_368779 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_368821 - BLOCK
      ?auto_368822 - BLOCK
      ?auto_368823 - BLOCK
      ?auto_368824 - BLOCK
      ?auto_368825 - BLOCK
      ?auto_368826 - BLOCK
      ?auto_368827 - BLOCK
      ?auto_368828 - BLOCK
      ?auto_368829 - BLOCK
      ?auto_368830 - BLOCK
      ?auto_368831 - BLOCK
      ?auto_368832 - BLOCK
      ?auto_368833 - BLOCK
    )
    :vars
    (
      ?auto_368834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_368833 ?auto_368834 ) ( ON-TABLE ?auto_368821 ) ( ON ?auto_368822 ?auto_368821 ) ( ON ?auto_368823 ?auto_368822 ) ( ON ?auto_368824 ?auto_368823 ) ( ON ?auto_368825 ?auto_368824 ) ( ON ?auto_368826 ?auto_368825 ) ( ON ?auto_368827 ?auto_368826 ) ( ON ?auto_368828 ?auto_368827 ) ( not ( = ?auto_368821 ?auto_368822 ) ) ( not ( = ?auto_368821 ?auto_368823 ) ) ( not ( = ?auto_368821 ?auto_368824 ) ) ( not ( = ?auto_368821 ?auto_368825 ) ) ( not ( = ?auto_368821 ?auto_368826 ) ) ( not ( = ?auto_368821 ?auto_368827 ) ) ( not ( = ?auto_368821 ?auto_368828 ) ) ( not ( = ?auto_368821 ?auto_368829 ) ) ( not ( = ?auto_368821 ?auto_368830 ) ) ( not ( = ?auto_368821 ?auto_368831 ) ) ( not ( = ?auto_368821 ?auto_368832 ) ) ( not ( = ?auto_368821 ?auto_368833 ) ) ( not ( = ?auto_368821 ?auto_368834 ) ) ( not ( = ?auto_368822 ?auto_368823 ) ) ( not ( = ?auto_368822 ?auto_368824 ) ) ( not ( = ?auto_368822 ?auto_368825 ) ) ( not ( = ?auto_368822 ?auto_368826 ) ) ( not ( = ?auto_368822 ?auto_368827 ) ) ( not ( = ?auto_368822 ?auto_368828 ) ) ( not ( = ?auto_368822 ?auto_368829 ) ) ( not ( = ?auto_368822 ?auto_368830 ) ) ( not ( = ?auto_368822 ?auto_368831 ) ) ( not ( = ?auto_368822 ?auto_368832 ) ) ( not ( = ?auto_368822 ?auto_368833 ) ) ( not ( = ?auto_368822 ?auto_368834 ) ) ( not ( = ?auto_368823 ?auto_368824 ) ) ( not ( = ?auto_368823 ?auto_368825 ) ) ( not ( = ?auto_368823 ?auto_368826 ) ) ( not ( = ?auto_368823 ?auto_368827 ) ) ( not ( = ?auto_368823 ?auto_368828 ) ) ( not ( = ?auto_368823 ?auto_368829 ) ) ( not ( = ?auto_368823 ?auto_368830 ) ) ( not ( = ?auto_368823 ?auto_368831 ) ) ( not ( = ?auto_368823 ?auto_368832 ) ) ( not ( = ?auto_368823 ?auto_368833 ) ) ( not ( = ?auto_368823 ?auto_368834 ) ) ( not ( = ?auto_368824 ?auto_368825 ) ) ( not ( = ?auto_368824 ?auto_368826 ) ) ( not ( = ?auto_368824 ?auto_368827 ) ) ( not ( = ?auto_368824 ?auto_368828 ) ) ( not ( = ?auto_368824 ?auto_368829 ) ) ( not ( = ?auto_368824 ?auto_368830 ) ) ( not ( = ?auto_368824 ?auto_368831 ) ) ( not ( = ?auto_368824 ?auto_368832 ) ) ( not ( = ?auto_368824 ?auto_368833 ) ) ( not ( = ?auto_368824 ?auto_368834 ) ) ( not ( = ?auto_368825 ?auto_368826 ) ) ( not ( = ?auto_368825 ?auto_368827 ) ) ( not ( = ?auto_368825 ?auto_368828 ) ) ( not ( = ?auto_368825 ?auto_368829 ) ) ( not ( = ?auto_368825 ?auto_368830 ) ) ( not ( = ?auto_368825 ?auto_368831 ) ) ( not ( = ?auto_368825 ?auto_368832 ) ) ( not ( = ?auto_368825 ?auto_368833 ) ) ( not ( = ?auto_368825 ?auto_368834 ) ) ( not ( = ?auto_368826 ?auto_368827 ) ) ( not ( = ?auto_368826 ?auto_368828 ) ) ( not ( = ?auto_368826 ?auto_368829 ) ) ( not ( = ?auto_368826 ?auto_368830 ) ) ( not ( = ?auto_368826 ?auto_368831 ) ) ( not ( = ?auto_368826 ?auto_368832 ) ) ( not ( = ?auto_368826 ?auto_368833 ) ) ( not ( = ?auto_368826 ?auto_368834 ) ) ( not ( = ?auto_368827 ?auto_368828 ) ) ( not ( = ?auto_368827 ?auto_368829 ) ) ( not ( = ?auto_368827 ?auto_368830 ) ) ( not ( = ?auto_368827 ?auto_368831 ) ) ( not ( = ?auto_368827 ?auto_368832 ) ) ( not ( = ?auto_368827 ?auto_368833 ) ) ( not ( = ?auto_368827 ?auto_368834 ) ) ( not ( = ?auto_368828 ?auto_368829 ) ) ( not ( = ?auto_368828 ?auto_368830 ) ) ( not ( = ?auto_368828 ?auto_368831 ) ) ( not ( = ?auto_368828 ?auto_368832 ) ) ( not ( = ?auto_368828 ?auto_368833 ) ) ( not ( = ?auto_368828 ?auto_368834 ) ) ( not ( = ?auto_368829 ?auto_368830 ) ) ( not ( = ?auto_368829 ?auto_368831 ) ) ( not ( = ?auto_368829 ?auto_368832 ) ) ( not ( = ?auto_368829 ?auto_368833 ) ) ( not ( = ?auto_368829 ?auto_368834 ) ) ( not ( = ?auto_368830 ?auto_368831 ) ) ( not ( = ?auto_368830 ?auto_368832 ) ) ( not ( = ?auto_368830 ?auto_368833 ) ) ( not ( = ?auto_368830 ?auto_368834 ) ) ( not ( = ?auto_368831 ?auto_368832 ) ) ( not ( = ?auto_368831 ?auto_368833 ) ) ( not ( = ?auto_368831 ?auto_368834 ) ) ( not ( = ?auto_368832 ?auto_368833 ) ) ( not ( = ?auto_368832 ?auto_368834 ) ) ( not ( = ?auto_368833 ?auto_368834 ) ) ( ON ?auto_368832 ?auto_368833 ) ( ON ?auto_368831 ?auto_368832 ) ( ON ?auto_368830 ?auto_368831 ) ( CLEAR ?auto_368828 ) ( ON ?auto_368829 ?auto_368830 ) ( CLEAR ?auto_368829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_368821 ?auto_368822 ?auto_368823 ?auto_368824 ?auto_368825 ?auto_368826 ?auto_368827 ?auto_368828 ?auto_368829 )
      ( MAKE-13PILE ?auto_368821 ?auto_368822 ?auto_368823 ?auto_368824 ?auto_368825 ?auto_368826 ?auto_368827 ?auto_368828 ?auto_368829 ?auto_368830 ?auto_368831 ?auto_368832 ?auto_368833 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_368875 - BLOCK
      ?auto_368876 - BLOCK
      ?auto_368877 - BLOCK
      ?auto_368878 - BLOCK
      ?auto_368879 - BLOCK
      ?auto_368880 - BLOCK
      ?auto_368881 - BLOCK
      ?auto_368882 - BLOCK
      ?auto_368883 - BLOCK
      ?auto_368884 - BLOCK
      ?auto_368885 - BLOCK
      ?auto_368886 - BLOCK
      ?auto_368887 - BLOCK
    )
    :vars
    (
      ?auto_368888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_368887 ?auto_368888 ) ( ON-TABLE ?auto_368875 ) ( ON ?auto_368876 ?auto_368875 ) ( ON ?auto_368877 ?auto_368876 ) ( ON ?auto_368878 ?auto_368877 ) ( ON ?auto_368879 ?auto_368878 ) ( ON ?auto_368880 ?auto_368879 ) ( ON ?auto_368881 ?auto_368880 ) ( not ( = ?auto_368875 ?auto_368876 ) ) ( not ( = ?auto_368875 ?auto_368877 ) ) ( not ( = ?auto_368875 ?auto_368878 ) ) ( not ( = ?auto_368875 ?auto_368879 ) ) ( not ( = ?auto_368875 ?auto_368880 ) ) ( not ( = ?auto_368875 ?auto_368881 ) ) ( not ( = ?auto_368875 ?auto_368882 ) ) ( not ( = ?auto_368875 ?auto_368883 ) ) ( not ( = ?auto_368875 ?auto_368884 ) ) ( not ( = ?auto_368875 ?auto_368885 ) ) ( not ( = ?auto_368875 ?auto_368886 ) ) ( not ( = ?auto_368875 ?auto_368887 ) ) ( not ( = ?auto_368875 ?auto_368888 ) ) ( not ( = ?auto_368876 ?auto_368877 ) ) ( not ( = ?auto_368876 ?auto_368878 ) ) ( not ( = ?auto_368876 ?auto_368879 ) ) ( not ( = ?auto_368876 ?auto_368880 ) ) ( not ( = ?auto_368876 ?auto_368881 ) ) ( not ( = ?auto_368876 ?auto_368882 ) ) ( not ( = ?auto_368876 ?auto_368883 ) ) ( not ( = ?auto_368876 ?auto_368884 ) ) ( not ( = ?auto_368876 ?auto_368885 ) ) ( not ( = ?auto_368876 ?auto_368886 ) ) ( not ( = ?auto_368876 ?auto_368887 ) ) ( not ( = ?auto_368876 ?auto_368888 ) ) ( not ( = ?auto_368877 ?auto_368878 ) ) ( not ( = ?auto_368877 ?auto_368879 ) ) ( not ( = ?auto_368877 ?auto_368880 ) ) ( not ( = ?auto_368877 ?auto_368881 ) ) ( not ( = ?auto_368877 ?auto_368882 ) ) ( not ( = ?auto_368877 ?auto_368883 ) ) ( not ( = ?auto_368877 ?auto_368884 ) ) ( not ( = ?auto_368877 ?auto_368885 ) ) ( not ( = ?auto_368877 ?auto_368886 ) ) ( not ( = ?auto_368877 ?auto_368887 ) ) ( not ( = ?auto_368877 ?auto_368888 ) ) ( not ( = ?auto_368878 ?auto_368879 ) ) ( not ( = ?auto_368878 ?auto_368880 ) ) ( not ( = ?auto_368878 ?auto_368881 ) ) ( not ( = ?auto_368878 ?auto_368882 ) ) ( not ( = ?auto_368878 ?auto_368883 ) ) ( not ( = ?auto_368878 ?auto_368884 ) ) ( not ( = ?auto_368878 ?auto_368885 ) ) ( not ( = ?auto_368878 ?auto_368886 ) ) ( not ( = ?auto_368878 ?auto_368887 ) ) ( not ( = ?auto_368878 ?auto_368888 ) ) ( not ( = ?auto_368879 ?auto_368880 ) ) ( not ( = ?auto_368879 ?auto_368881 ) ) ( not ( = ?auto_368879 ?auto_368882 ) ) ( not ( = ?auto_368879 ?auto_368883 ) ) ( not ( = ?auto_368879 ?auto_368884 ) ) ( not ( = ?auto_368879 ?auto_368885 ) ) ( not ( = ?auto_368879 ?auto_368886 ) ) ( not ( = ?auto_368879 ?auto_368887 ) ) ( not ( = ?auto_368879 ?auto_368888 ) ) ( not ( = ?auto_368880 ?auto_368881 ) ) ( not ( = ?auto_368880 ?auto_368882 ) ) ( not ( = ?auto_368880 ?auto_368883 ) ) ( not ( = ?auto_368880 ?auto_368884 ) ) ( not ( = ?auto_368880 ?auto_368885 ) ) ( not ( = ?auto_368880 ?auto_368886 ) ) ( not ( = ?auto_368880 ?auto_368887 ) ) ( not ( = ?auto_368880 ?auto_368888 ) ) ( not ( = ?auto_368881 ?auto_368882 ) ) ( not ( = ?auto_368881 ?auto_368883 ) ) ( not ( = ?auto_368881 ?auto_368884 ) ) ( not ( = ?auto_368881 ?auto_368885 ) ) ( not ( = ?auto_368881 ?auto_368886 ) ) ( not ( = ?auto_368881 ?auto_368887 ) ) ( not ( = ?auto_368881 ?auto_368888 ) ) ( not ( = ?auto_368882 ?auto_368883 ) ) ( not ( = ?auto_368882 ?auto_368884 ) ) ( not ( = ?auto_368882 ?auto_368885 ) ) ( not ( = ?auto_368882 ?auto_368886 ) ) ( not ( = ?auto_368882 ?auto_368887 ) ) ( not ( = ?auto_368882 ?auto_368888 ) ) ( not ( = ?auto_368883 ?auto_368884 ) ) ( not ( = ?auto_368883 ?auto_368885 ) ) ( not ( = ?auto_368883 ?auto_368886 ) ) ( not ( = ?auto_368883 ?auto_368887 ) ) ( not ( = ?auto_368883 ?auto_368888 ) ) ( not ( = ?auto_368884 ?auto_368885 ) ) ( not ( = ?auto_368884 ?auto_368886 ) ) ( not ( = ?auto_368884 ?auto_368887 ) ) ( not ( = ?auto_368884 ?auto_368888 ) ) ( not ( = ?auto_368885 ?auto_368886 ) ) ( not ( = ?auto_368885 ?auto_368887 ) ) ( not ( = ?auto_368885 ?auto_368888 ) ) ( not ( = ?auto_368886 ?auto_368887 ) ) ( not ( = ?auto_368886 ?auto_368888 ) ) ( not ( = ?auto_368887 ?auto_368888 ) ) ( ON ?auto_368886 ?auto_368887 ) ( ON ?auto_368885 ?auto_368886 ) ( ON ?auto_368884 ?auto_368885 ) ( ON ?auto_368883 ?auto_368884 ) ( CLEAR ?auto_368881 ) ( ON ?auto_368882 ?auto_368883 ) ( CLEAR ?auto_368882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_368875 ?auto_368876 ?auto_368877 ?auto_368878 ?auto_368879 ?auto_368880 ?auto_368881 ?auto_368882 )
      ( MAKE-13PILE ?auto_368875 ?auto_368876 ?auto_368877 ?auto_368878 ?auto_368879 ?auto_368880 ?auto_368881 ?auto_368882 ?auto_368883 ?auto_368884 ?auto_368885 ?auto_368886 ?auto_368887 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_368929 - BLOCK
      ?auto_368930 - BLOCK
      ?auto_368931 - BLOCK
      ?auto_368932 - BLOCK
      ?auto_368933 - BLOCK
      ?auto_368934 - BLOCK
      ?auto_368935 - BLOCK
      ?auto_368936 - BLOCK
      ?auto_368937 - BLOCK
      ?auto_368938 - BLOCK
      ?auto_368939 - BLOCK
      ?auto_368940 - BLOCK
      ?auto_368941 - BLOCK
    )
    :vars
    (
      ?auto_368942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_368941 ?auto_368942 ) ( ON-TABLE ?auto_368929 ) ( ON ?auto_368930 ?auto_368929 ) ( ON ?auto_368931 ?auto_368930 ) ( ON ?auto_368932 ?auto_368931 ) ( ON ?auto_368933 ?auto_368932 ) ( ON ?auto_368934 ?auto_368933 ) ( not ( = ?auto_368929 ?auto_368930 ) ) ( not ( = ?auto_368929 ?auto_368931 ) ) ( not ( = ?auto_368929 ?auto_368932 ) ) ( not ( = ?auto_368929 ?auto_368933 ) ) ( not ( = ?auto_368929 ?auto_368934 ) ) ( not ( = ?auto_368929 ?auto_368935 ) ) ( not ( = ?auto_368929 ?auto_368936 ) ) ( not ( = ?auto_368929 ?auto_368937 ) ) ( not ( = ?auto_368929 ?auto_368938 ) ) ( not ( = ?auto_368929 ?auto_368939 ) ) ( not ( = ?auto_368929 ?auto_368940 ) ) ( not ( = ?auto_368929 ?auto_368941 ) ) ( not ( = ?auto_368929 ?auto_368942 ) ) ( not ( = ?auto_368930 ?auto_368931 ) ) ( not ( = ?auto_368930 ?auto_368932 ) ) ( not ( = ?auto_368930 ?auto_368933 ) ) ( not ( = ?auto_368930 ?auto_368934 ) ) ( not ( = ?auto_368930 ?auto_368935 ) ) ( not ( = ?auto_368930 ?auto_368936 ) ) ( not ( = ?auto_368930 ?auto_368937 ) ) ( not ( = ?auto_368930 ?auto_368938 ) ) ( not ( = ?auto_368930 ?auto_368939 ) ) ( not ( = ?auto_368930 ?auto_368940 ) ) ( not ( = ?auto_368930 ?auto_368941 ) ) ( not ( = ?auto_368930 ?auto_368942 ) ) ( not ( = ?auto_368931 ?auto_368932 ) ) ( not ( = ?auto_368931 ?auto_368933 ) ) ( not ( = ?auto_368931 ?auto_368934 ) ) ( not ( = ?auto_368931 ?auto_368935 ) ) ( not ( = ?auto_368931 ?auto_368936 ) ) ( not ( = ?auto_368931 ?auto_368937 ) ) ( not ( = ?auto_368931 ?auto_368938 ) ) ( not ( = ?auto_368931 ?auto_368939 ) ) ( not ( = ?auto_368931 ?auto_368940 ) ) ( not ( = ?auto_368931 ?auto_368941 ) ) ( not ( = ?auto_368931 ?auto_368942 ) ) ( not ( = ?auto_368932 ?auto_368933 ) ) ( not ( = ?auto_368932 ?auto_368934 ) ) ( not ( = ?auto_368932 ?auto_368935 ) ) ( not ( = ?auto_368932 ?auto_368936 ) ) ( not ( = ?auto_368932 ?auto_368937 ) ) ( not ( = ?auto_368932 ?auto_368938 ) ) ( not ( = ?auto_368932 ?auto_368939 ) ) ( not ( = ?auto_368932 ?auto_368940 ) ) ( not ( = ?auto_368932 ?auto_368941 ) ) ( not ( = ?auto_368932 ?auto_368942 ) ) ( not ( = ?auto_368933 ?auto_368934 ) ) ( not ( = ?auto_368933 ?auto_368935 ) ) ( not ( = ?auto_368933 ?auto_368936 ) ) ( not ( = ?auto_368933 ?auto_368937 ) ) ( not ( = ?auto_368933 ?auto_368938 ) ) ( not ( = ?auto_368933 ?auto_368939 ) ) ( not ( = ?auto_368933 ?auto_368940 ) ) ( not ( = ?auto_368933 ?auto_368941 ) ) ( not ( = ?auto_368933 ?auto_368942 ) ) ( not ( = ?auto_368934 ?auto_368935 ) ) ( not ( = ?auto_368934 ?auto_368936 ) ) ( not ( = ?auto_368934 ?auto_368937 ) ) ( not ( = ?auto_368934 ?auto_368938 ) ) ( not ( = ?auto_368934 ?auto_368939 ) ) ( not ( = ?auto_368934 ?auto_368940 ) ) ( not ( = ?auto_368934 ?auto_368941 ) ) ( not ( = ?auto_368934 ?auto_368942 ) ) ( not ( = ?auto_368935 ?auto_368936 ) ) ( not ( = ?auto_368935 ?auto_368937 ) ) ( not ( = ?auto_368935 ?auto_368938 ) ) ( not ( = ?auto_368935 ?auto_368939 ) ) ( not ( = ?auto_368935 ?auto_368940 ) ) ( not ( = ?auto_368935 ?auto_368941 ) ) ( not ( = ?auto_368935 ?auto_368942 ) ) ( not ( = ?auto_368936 ?auto_368937 ) ) ( not ( = ?auto_368936 ?auto_368938 ) ) ( not ( = ?auto_368936 ?auto_368939 ) ) ( not ( = ?auto_368936 ?auto_368940 ) ) ( not ( = ?auto_368936 ?auto_368941 ) ) ( not ( = ?auto_368936 ?auto_368942 ) ) ( not ( = ?auto_368937 ?auto_368938 ) ) ( not ( = ?auto_368937 ?auto_368939 ) ) ( not ( = ?auto_368937 ?auto_368940 ) ) ( not ( = ?auto_368937 ?auto_368941 ) ) ( not ( = ?auto_368937 ?auto_368942 ) ) ( not ( = ?auto_368938 ?auto_368939 ) ) ( not ( = ?auto_368938 ?auto_368940 ) ) ( not ( = ?auto_368938 ?auto_368941 ) ) ( not ( = ?auto_368938 ?auto_368942 ) ) ( not ( = ?auto_368939 ?auto_368940 ) ) ( not ( = ?auto_368939 ?auto_368941 ) ) ( not ( = ?auto_368939 ?auto_368942 ) ) ( not ( = ?auto_368940 ?auto_368941 ) ) ( not ( = ?auto_368940 ?auto_368942 ) ) ( not ( = ?auto_368941 ?auto_368942 ) ) ( ON ?auto_368940 ?auto_368941 ) ( ON ?auto_368939 ?auto_368940 ) ( ON ?auto_368938 ?auto_368939 ) ( ON ?auto_368937 ?auto_368938 ) ( ON ?auto_368936 ?auto_368937 ) ( CLEAR ?auto_368934 ) ( ON ?auto_368935 ?auto_368936 ) ( CLEAR ?auto_368935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_368929 ?auto_368930 ?auto_368931 ?auto_368932 ?auto_368933 ?auto_368934 ?auto_368935 )
      ( MAKE-13PILE ?auto_368929 ?auto_368930 ?auto_368931 ?auto_368932 ?auto_368933 ?auto_368934 ?auto_368935 ?auto_368936 ?auto_368937 ?auto_368938 ?auto_368939 ?auto_368940 ?auto_368941 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_368983 - BLOCK
      ?auto_368984 - BLOCK
      ?auto_368985 - BLOCK
      ?auto_368986 - BLOCK
      ?auto_368987 - BLOCK
      ?auto_368988 - BLOCK
      ?auto_368989 - BLOCK
      ?auto_368990 - BLOCK
      ?auto_368991 - BLOCK
      ?auto_368992 - BLOCK
      ?auto_368993 - BLOCK
      ?auto_368994 - BLOCK
      ?auto_368995 - BLOCK
    )
    :vars
    (
      ?auto_368996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_368995 ?auto_368996 ) ( ON-TABLE ?auto_368983 ) ( ON ?auto_368984 ?auto_368983 ) ( ON ?auto_368985 ?auto_368984 ) ( ON ?auto_368986 ?auto_368985 ) ( ON ?auto_368987 ?auto_368986 ) ( not ( = ?auto_368983 ?auto_368984 ) ) ( not ( = ?auto_368983 ?auto_368985 ) ) ( not ( = ?auto_368983 ?auto_368986 ) ) ( not ( = ?auto_368983 ?auto_368987 ) ) ( not ( = ?auto_368983 ?auto_368988 ) ) ( not ( = ?auto_368983 ?auto_368989 ) ) ( not ( = ?auto_368983 ?auto_368990 ) ) ( not ( = ?auto_368983 ?auto_368991 ) ) ( not ( = ?auto_368983 ?auto_368992 ) ) ( not ( = ?auto_368983 ?auto_368993 ) ) ( not ( = ?auto_368983 ?auto_368994 ) ) ( not ( = ?auto_368983 ?auto_368995 ) ) ( not ( = ?auto_368983 ?auto_368996 ) ) ( not ( = ?auto_368984 ?auto_368985 ) ) ( not ( = ?auto_368984 ?auto_368986 ) ) ( not ( = ?auto_368984 ?auto_368987 ) ) ( not ( = ?auto_368984 ?auto_368988 ) ) ( not ( = ?auto_368984 ?auto_368989 ) ) ( not ( = ?auto_368984 ?auto_368990 ) ) ( not ( = ?auto_368984 ?auto_368991 ) ) ( not ( = ?auto_368984 ?auto_368992 ) ) ( not ( = ?auto_368984 ?auto_368993 ) ) ( not ( = ?auto_368984 ?auto_368994 ) ) ( not ( = ?auto_368984 ?auto_368995 ) ) ( not ( = ?auto_368984 ?auto_368996 ) ) ( not ( = ?auto_368985 ?auto_368986 ) ) ( not ( = ?auto_368985 ?auto_368987 ) ) ( not ( = ?auto_368985 ?auto_368988 ) ) ( not ( = ?auto_368985 ?auto_368989 ) ) ( not ( = ?auto_368985 ?auto_368990 ) ) ( not ( = ?auto_368985 ?auto_368991 ) ) ( not ( = ?auto_368985 ?auto_368992 ) ) ( not ( = ?auto_368985 ?auto_368993 ) ) ( not ( = ?auto_368985 ?auto_368994 ) ) ( not ( = ?auto_368985 ?auto_368995 ) ) ( not ( = ?auto_368985 ?auto_368996 ) ) ( not ( = ?auto_368986 ?auto_368987 ) ) ( not ( = ?auto_368986 ?auto_368988 ) ) ( not ( = ?auto_368986 ?auto_368989 ) ) ( not ( = ?auto_368986 ?auto_368990 ) ) ( not ( = ?auto_368986 ?auto_368991 ) ) ( not ( = ?auto_368986 ?auto_368992 ) ) ( not ( = ?auto_368986 ?auto_368993 ) ) ( not ( = ?auto_368986 ?auto_368994 ) ) ( not ( = ?auto_368986 ?auto_368995 ) ) ( not ( = ?auto_368986 ?auto_368996 ) ) ( not ( = ?auto_368987 ?auto_368988 ) ) ( not ( = ?auto_368987 ?auto_368989 ) ) ( not ( = ?auto_368987 ?auto_368990 ) ) ( not ( = ?auto_368987 ?auto_368991 ) ) ( not ( = ?auto_368987 ?auto_368992 ) ) ( not ( = ?auto_368987 ?auto_368993 ) ) ( not ( = ?auto_368987 ?auto_368994 ) ) ( not ( = ?auto_368987 ?auto_368995 ) ) ( not ( = ?auto_368987 ?auto_368996 ) ) ( not ( = ?auto_368988 ?auto_368989 ) ) ( not ( = ?auto_368988 ?auto_368990 ) ) ( not ( = ?auto_368988 ?auto_368991 ) ) ( not ( = ?auto_368988 ?auto_368992 ) ) ( not ( = ?auto_368988 ?auto_368993 ) ) ( not ( = ?auto_368988 ?auto_368994 ) ) ( not ( = ?auto_368988 ?auto_368995 ) ) ( not ( = ?auto_368988 ?auto_368996 ) ) ( not ( = ?auto_368989 ?auto_368990 ) ) ( not ( = ?auto_368989 ?auto_368991 ) ) ( not ( = ?auto_368989 ?auto_368992 ) ) ( not ( = ?auto_368989 ?auto_368993 ) ) ( not ( = ?auto_368989 ?auto_368994 ) ) ( not ( = ?auto_368989 ?auto_368995 ) ) ( not ( = ?auto_368989 ?auto_368996 ) ) ( not ( = ?auto_368990 ?auto_368991 ) ) ( not ( = ?auto_368990 ?auto_368992 ) ) ( not ( = ?auto_368990 ?auto_368993 ) ) ( not ( = ?auto_368990 ?auto_368994 ) ) ( not ( = ?auto_368990 ?auto_368995 ) ) ( not ( = ?auto_368990 ?auto_368996 ) ) ( not ( = ?auto_368991 ?auto_368992 ) ) ( not ( = ?auto_368991 ?auto_368993 ) ) ( not ( = ?auto_368991 ?auto_368994 ) ) ( not ( = ?auto_368991 ?auto_368995 ) ) ( not ( = ?auto_368991 ?auto_368996 ) ) ( not ( = ?auto_368992 ?auto_368993 ) ) ( not ( = ?auto_368992 ?auto_368994 ) ) ( not ( = ?auto_368992 ?auto_368995 ) ) ( not ( = ?auto_368992 ?auto_368996 ) ) ( not ( = ?auto_368993 ?auto_368994 ) ) ( not ( = ?auto_368993 ?auto_368995 ) ) ( not ( = ?auto_368993 ?auto_368996 ) ) ( not ( = ?auto_368994 ?auto_368995 ) ) ( not ( = ?auto_368994 ?auto_368996 ) ) ( not ( = ?auto_368995 ?auto_368996 ) ) ( ON ?auto_368994 ?auto_368995 ) ( ON ?auto_368993 ?auto_368994 ) ( ON ?auto_368992 ?auto_368993 ) ( ON ?auto_368991 ?auto_368992 ) ( ON ?auto_368990 ?auto_368991 ) ( ON ?auto_368989 ?auto_368990 ) ( CLEAR ?auto_368987 ) ( ON ?auto_368988 ?auto_368989 ) ( CLEAR ?auto_368988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_368983 ?auto_368984 ?auto_368985 ?auto_368986 ?auto_368987 ?auto_368988 )
      ( MAKE-13PILE ?auto_368983 ?auto_368984 ?auto_368985 ?auto_368986 ?auto_368987 ?auto_368988 ?auto_368989 ?auto_368990 ?auto_368991 ?auto_368992 ?auto_368993 ?auto_368994 ?auto_368995 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_369037 - BLOCK
      ?auto_369038 - BLOCK
      ?auto_369039 - BLOCK
      ?auto_369040 - BLOCK
      ?auto_369041 - BLOCK
      ?auto_369042 - BLOCK
      ?auto_369043 - BLOCK
      ?auto_369044 - BLOCK
      ?auto_369045 - BLOCK
      ?auto_369046 - BLOCK
      ?auto_369047 - BLOCK
      ?auto_369048 - BLOCK
      ?auto_369049 - BLOCK
    )
    :vars
    (
      ?auto_369050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_369049 ?auto_369050 ) ( ON-TABLE ?auto_369037 ) ( ON ?auto_369038 ?auto_369037 ) ( ON ?auto_369039 ?auto_369038 ) ( ON ?auto_369040 ?auto_369039 ) ( not ( = ?auto_369037 ?auto_369038 ) ) ( not ( = ?auto_369037 ?auto_369039 ) ) ( not ( = ?auto_369037 ?auto_369040 ) ) ( not ( = ?auto_369037 ?auto_369041 ) ) ( not ( = ?auto_369037 ?auto_369042 ) ) ( not ( = ?auto_369037 ?auto_369043 ) ) ( not ( = ?auto_369037 ?auto_369044 ) ) ( not ( = ?auto_369037 ?auto_369045 ) ) ( not ( = ?auto_369037 ?auto_369046 ) ) ( not ( = ?auto_369037 ?auto_369047 ) ) ( not ( = ?auto_369037 ?auto_369048 ) ) ( not ( = ?auto_369037 ?auto_369049 ) ) ( not ( = ?auto_369037 ?auto_369050 ) ) ( not ( = ?auto_369038 ?auto_369039 ) ) ( not ( = ?auto_369038 ?auto_369040 ) ) ( not ( = ?auto_369038 ?auto_369041 ) ) ( not ( = ?auto_369038 ?auto_369042 ) ) ( not ( = ?auto_369038 ?auto_369043 ) ) ( not ( = ?auto_369038 ?auto_369044 ) ) ( not ( = ?auto_369038 ?auto_369045 ) ) ( not ( = ?auto_369038 ?auto_369046 ) ) ( not ( = ?auto_369038 ?auto_369047 ) ) ( not ( = ?auto_369038 ?auto_369048 ) ) ( not ( = ?auto_369038 ?auto_369049 ) ) ( not ( = ?auto_369038 ?auto_369050 ) ) ( not ( = ?auto_369039 ?auto_369040 ) ) ( not ( = ?auto_369039 ?auto_369041 ) ) ( not ( = ?auto_369039 ?auto_369042 ) ) ( not ( = ?auto_369039 ?auto_369043 ) ) ( not ( = ?auto_369039 ?auto_369044 ) ) ( not ( = ?auto_369039 ?auto_369045 ) ) ( not ( = ?auto_369039 ?auto_369046 ) ) ( not ( = ?auto_369039 ?auto_369047 ) ) ( not ( = ?auto_369039 ?auto_369048 ) ) ( not ( = ?auto_369039 ?auto_369049 ) ) ( not ( = ?auto_369039 ?auto_369050 ) ) ( not ( = ?auto_369040 ?auto_369041 ) ) ( not ( = ?auto_369040 ?auto_369042 ) ) ( not ( = ?auto_369040 ?auto_369043 ) ) ( not ( = ?auto_369040 ?auto_369044 ) ) ( not ( = ?auto_369040 ?auto_369045 ) ) ( not ( = ?auto_369040 ?auto_369046 ) ) ( not ( = ?auto_369040 ?auto_369047 ) ) ( not ( = ?auto_369040 ?auto_369048 ) ) ( not ( = ?auto_369040 ?auto_369049 ) ) ( not ( = ?auto_369040 ?auto_369050 ) ) ( not ( = ?auto_369041 ?auto_369042 ) ) ( not ( = ?auto_369041 ?auto_369043 ) ) ( not ( = ?auto_369041 ?auto_369044 ) ) ( not ( = ?auto_369041 ?auto_369045 ) ) ( not ( = ?auto_369041 ?auto_369046 ) ) ( not ( = ?auto_369041 ?auto_369047 ) ) ( not ( = ?auto_369041 ?auto_369048 ) ) ( not ( = ?auto_369041 ?auto_369049 ) ) ( not ( = ?auto_369041 ?auto_369050 ) ) ( not ( = ?auto_369042 ?auto_369043 ) ) ( not ( = ?auto_369042 ?auto_369044 ) ) ( not ( = ?auto_369042 ?auto_369045 ) ) ( not ( = ?auto_369042 ?auto_369046 ) ) ( not ( = ?auto_369042 ?auto_369047 ) ) ( not ( = ?auto_369042 ?auto_369048 ) ) ( not ( = ?auto_369042 ?auto_369049 ) ) ( not ( = ?auto_369042 ?auto_369050 ) ) ( not ( = ?auto_369043 ?auto_369044 ) ) ( not ( = ?auto_369043 ?auto_369045 ) ) ( not ( = ?auto_369043 ?auto_369046 ) ) ( not ( = ?auto_369043 ?auto_369047 ) ) ( not ( = ?auto_369043 ?auto_369048 ) ) ( not ( = ?auto_369043 ?auto_369049 ) ) ( not ( = ?auto_369043 ?auto_369050 ) ) ( not ( = ?auto_369044 ?auto_369045 ) ) ( not ( = ?auto_369044 ?auto_369046 ) ) ( not ( = ?auto_369044 ?auto_369047 ) ) ( not ( = ?auto_369044 ?auto_369048 ) ) ( not ( = ?auto_369044 ?auto_369049 ) ) ( not ( = ?auto_369044 ?auto_369050 ) ) ( not ( = ?auto_369045 ?auto_369046 ) ) ( not ( = ?auto_369045 ?auto_369047 ) ) ( not ( = ?auto_369045 ?auto_369048 ) ) ( not ( = ?auto_369045 ?auto_369049 ) ) ( not ( = ?auto_369045 ?auto_369050 ) ) ( not ( = ?auto_369046 ?auto_369047 ) ) ( not ( = ?auto_369046 ?auto_369048 ) ) ( not ( = ?auto_369046 ?auto_369049 ) ) ( not ( = ?auto_369046 ?auto_369050 ) ) ( not ( = ?auto_369047 ?auto_369048 ) ) ( not ( = ?auto_369047 ?auto_369049 ) ) ( not ( = ?auto_369047 ?auto_369050 ) ) ( not ( = ?auto_369048 ?auto_369049 ) ) ( not ( = ?auto_369048 ?auto_369050 ) ) ( not ( = ?auto_369049 ?auto_369050 ) ) ( ON ?auto_369048 ?auto_369049 ) ( ON ?auto_369047 ?auto_369048 ) ( ON ?auto_369046 ?auto_369047 ) ( ON ?auto_369045 ?auto_369046 ) ( ON ?auto_369044 ?auto_369045 ) ( ON ?auto_369043 ?auto_369044 ) ( ON ?auto_369042 ?auto_369043 ) ( CLEAR ?auto_369040 ) ( ON ?auto_369041 ?auto_369042 ) ( CLEAR ?auto_369041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_369037 ?auto_369038 ?auto_369039 ?auto_369040 ?auto_369041 )
      ( MAKE-13PILE ?auto_369037 ?auto_369038 ?auto_369039 ?auto_369040 ?auto_369041 ?auto_369042 ?auto_369043 ?auto_369044 ?auto_369045 ?auto_369046 ?auto_369047 ?auto_369048 ?auto_369049 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_369091 - BLOCK
      ?auto_369092 - BLOCK
      ?auto_369093 - BLOCK
      ?auto_369094 - BLOCK
      ?auto_369095 - BLOCK
      ?auto_369096 - BLOCK
      ?auto_369097 - BLOCK
      ?auto_369098 - BLOCK
      ?auto_369099 - BLOCK
      ?auto_369100 - BLOCK
      ?auto_369101 - BLOCK
      ?auto_369102 - BLOCK
      ?auto_369103 - BLOCK
    )
    :vars
    (
      ?auto_369104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_369103 ?auto_369104 ) ( ON-TABLE ?auto_369091 ) ( ON ?auto_369092 ?auto_369091 ) ( ON ?auto_369093 ?auto_369092 ) ( not ( = ?auto_369091 ?auto_369092 ) ) ( not ( = ?auto_369091 ?auto_369093 ) ) ( not ( = ?auto_369091 ?auto_369094 ) ) ( not ( = ?auto_369091 ?auto_369095 ) ) ( not ( = ?auto_369091 ?auto_369096 ) ) ( not ( = ?auto_369091 ?auto_369097 ) ) ( not ( = ?auto_369091 ?auto_369098 ) ) ( not ( = ?auto_369091 ?auto_369099 ) ) ( not ( = ?auto_369091 ?auto_369100 ) ) ( not ( = ?auto_369091 ?auto_369101 ) ) ( not ( = ?auto_369091 ?auto_369102 ) ) ( not ( = ?auto_369091 ?auto_369103 ) ) ( not ( = ?auto_369091 ?auto_369104 ) ) ( not ( = ?auto_369092 ?auto_369093 ) ) ( not ( = ?auto_369092 ?auto_369094 ) ) ( not ( = ?auto_369092 ?auto_369095 ) ) ( not ( = ?auto_369092 ?auto_369096 ) ) ( not ( = ?auto_369092 ?auto_369097 ) ) ( not ( = ?auto_369092 ?auto_369098 ) ) ( not ( = ?auto_369092 ?auto_369099 ) ) ( not ( = ?auto_369092 ?auto_369100 ) ) ( not ( = ?auto_369092 ?auto_369101 ) ) ( not ( = ?auto_369092 ?auto_369102 ) ) ( not ( = ?auto_369092 ?auto_369103 ) ) ( not ( = ?auto_369092 ?auto_369104 ) ) ( not ( = ?auto_369093 ?auto_369094 ) ) ( not ( = ?auto_369093 ?auto_369095 ) ) ( not ( = ?auto_369093 ?auto_369096 ) ) ( not ( = ?auto_369093 ?auto_369097 ) ) ( not ( = ?auto_369093 ?auto_369098 ) ) ( not ( = ?auto_369093 ?auto_369099 ) ) ( not ( = ?auto_369093 ?auto_369100 ) ) ( not ( = ?auto_369093 ?auto_369101 ) ) ( not ( = ?auto_369093 ?auto_369102 ) ) ( not ( = ?auto_369093 ?auto_369103 ) ) ( not ( = ?auto_369093 ?auto_369104 ) ) ( not ( = ?auto_369094 ?auto_369095 ) ) ( not ( = ?auto_369094 ?auto_369096 ) ) ( not ( = ?auto_369094 ?auto_369097 ) ) ( not ( = ?auto_369094 ?auto_369098 ) ) ( not ( = ?auto_369094 ?auto_369099 ) ) ( not ( = ?auto_369094 ?auto_369100 ) ) ( not ( = ?auto_369094 ?auto_369101 ) ) ( not ( = ?auto_369094 ?auto_369102 ) ) ( not ( = ?auto_369094 ?auto_369103 ) ) ( not ( = ?auto_369094 ?auto_369104 ) ) ( not ( = ?auto_369095 ?auto_369096 ) ) ( not ( = ?auto_369095 ?auto_369097 ) ) ( not ( = ?auto_369095 ?auto_369098 ) ) ( not ( = ?auto_369095 ?auto_369099 ) ) ( not ( = ?auto_369095 ?auto_369100 ) ) ( not ( = ?auto_369095 ?auto_369101 ) ) ( not ( = ?auto_369095 ?auto_369102 ) ) ( not ( = ?auto_369095 ?auto_369103 ) ) ( not ( = ?auto_369095 ?auto_369104 ) ) ( not ( = ?auto_369096 ?auto_369097 ) ) ( not ( = ?auto_369096 ?auto_369098 ) ) ( not ( = ?auto_369096 ?auto_369099 ) ) ( not ( = ?auto_369096 ?auto_369100 ) ) ( not ( = ?auto_369096 ?auto_369101 ) ) ( not ( = ?auto_369096 ?auto_369102 ) ) ( not ( = ?auto_369096 ?auto_369103 ) ) ( not ( = ?auto_369096 ?auto_369104 ) ) ( not ( = ?auto_369097 ?auto_369098 ) ) ( not ( = ?auto_369097 ?auto_369099 ) ) ( not ( = ?auto_369097 ?auto_369100 ) ) ( not ( = ?auto_369097 ?auto_369101 ) ) ( not ( = ?auto_369097 ?auto_369102 ) ) ( not ( = ?auto_369097 ?auto_369103 ) ) ( not ( = ?auto_369097 ?auto_369104 ) ) ( not ( = ?auto_369098 ?auto_369099 ) ) ( not ( = ?auto_369098 ?auto_369100 ) ) ( not ( = ?auto_369098 ?auto_369101 ) ) ( not ( = ?auto_369098 ?auto_369102 ) ) ( not ( = ?auto_369098 ?auto_369103 ) ) ( not ( = ?auto_369098 ?auto_369104 ) ) ( not ( = ?auto_369099 ?auto_369100 ) ) ( not ( = ?auto_369099 ?auto_369101 ) ) ( not ( = ?auto_369099 ?auto_369102 ) ) ( not ( = ?auto_369099 ?auto_369103 ) ) ( not ( = ?auto_369099 ?auto_369104 ) ) ( not ( = ?auto_369100 ?auto_369101 ) ) ( not ( = ?auto_369100 ?auto_369102 ) ) ( not ( = ?auto_369100 ?auto_369103 ) ) ( not ( = ?auto_369100 ?auto_369104 ) ) ( not ( = ?auto_369101 ?auto_369102 ) ) ( not ( = ?auto_369101 ?auto_369103 ) ) ( not ( = ?auto_369101 ?auto_369104 ) ) ( not ( = ?auto_369102 ?auto_369103 ) ) ( not ( = ?auto_369102 ?auto_369104 ) ) ( not ( = ?auto_369103 ?auto_369104 ) ) ( ON ?auto_369102 ?auto_369103 ) ( ON ?auto_369101 ?auto_369102 ) ( ON ?auto_369100 ?auto_369101 ) ( ON ?auto_369099 ?auto_369100 ) ( ON ?auto_369098 ?auto_369099 ) ( ON ?auto_369097 ?auto_369098 ) ( ON ?auto_369096 ?auto_369097 ) ( ON ?auto_369095 ?auto_369096 ) ( CLEAR ?auto_369093 ) ( ON ?auto_369094 ?auto_369095 ) ( CLEAR ?auto_369094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_369091 ?auto_369092 ?auto_369093 ?auto_369094 )
      ( MAKE-13PILE ?auto_369091 ?auto_369092 ?auto_369093 ?auto_369094 ?auto_369095 ?auto_369096 ?auto_369097 ?auto_369098 ?auto_369099 ?auto_369100 ?auto_369101 ?auto_369102 ?auto_369103 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_369145 - BLOCK
      ?auto_369146 - BLOCK
      ?auto_369147 - BLOCK
      ?auto_369148 - BLOCK
      ?auto_369149 - BLOCK
      ?auto_369150 - BLOCK
      ?auto_369151 - BLOCK
      ?auto_369152 - BLOCK
      ?auto_369153 - BLOCK
      ?auto_369154 - BLOCK
      ?auto_369155 - BLOCK
      ?auto_369156 - BLOCK
      ?auto_369157 - BLOCK
    )
    :vars
    (
      ?auto_369158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_369157 ?auto_369158 ) ( ON-TABLE ?auto_369145 ) ( ON ?auto_369146 ?auto_369145 ) ( not ( = ?auto_369145 ?auto_369146 ) ) ( not ( = ?auto_369145 ?auto_369147 ) ) ( not ( = ?auto_369145 ?auto_369148 ) ) ( not ( = ?auto_369145 ?auto_369149 ) ) ( not ( = ?auto_369145 ?auto_369150 ) ) ( not ( = ?auto_369145 ?auto_369151 ) ) ( not ( = ?auto_369145 ?auto_369152 ) ) ( not ( = ?auto_369145 ?auto_369153 ) ) ( not ( = ?auto_369145 ?auto_369154 ) ) ( not ( = ?auto_369145 ?auto_369155 ) ) ( not ( = ?auto_369145 ?auto_369156 ) ) ( not ( = ?auto_369145 ?auto_369157 ) ) ( not ( = ?auto_369145 ?auto_369158 ) ) ( not ( = ?auto_369146 ?auto_369147 ) ) ( not ( = ?auto_369146 ?auto_369148 ) ) ( not ( = ?auto_369146 ?auto_369149 ) ) ( not ( = ?auto_369146 ?auto_369150 ) ) ( not ( = ?auto_369146 ?auto_369151 ) ) ( not ( = ?auto_369146 ?auto_369152 ) ) ( not ( = ?auto_369146 ?auto_369153 ) ) ( not ( = ?auto_369146 ?auto_369154 ) ) ( not ( = ?auto_369146 ?auto_369155 ) ) ( not ( = ?auto_369146 ?auto_369156 ) ) ( not ( = ?auto_369146 ?auto_369157 ) ) ( not ( = ?auto_369146 ?auto_369158 ) ) ( not ( = ?auto_369147 ?auto_369148 ) ) ( not ( = ?auto_369147 ?auto_369149 ) ) ( not ( = ?auto_369147 ?auto_369150 ) ) ( not ( = ?auto_369147 ?auto_369151 ) ) ( not ( = ?auto_369147 ?auto_369152 ) ) ( not ( = ?auto_369147 ?auto_369153 ) ) ( not ( = ?auto_369147 ?auto_369154 ) ) ( not ( = ?auto_369147 ?auto_369155 ) ) ( not ( = ?auto_369147 ?auto_369156 ) ) ( not ( = ?auto_369147 ?auto_369157 ) ) ( not ( = ?auto_369147 ?auto_369158 ) ) ( not ( = ?auto_369148 ?auto_369149 ) ) ( not ( = ?auto_369148 ?auto_369150 ) ) ( not ( = ?auto_369148 ?auto_369151 ) ) ( not ( = ?auto_369148 ?auto_369152 ) ) ( not ( = ?auto_369148 ?auto_369153 ) ) ( not ( = ?auto_369148 ?auto_369154 ) ) ( not ( = ?auto_369148 ?auto_369155 ) ) ( not ( = ?auto_369148 ?auto_369156 ) ) ( not ( = ?auto_369148 ?auto_369157 ) ) ( not ( = ?auto_369148 ?auto_369158 ) ) ( not ( = ?auto_369149 ?auto_369150 ) ) ( not ( = ?auto_369149 ?auto_369151 ) ) ( not ( = ?auto_369149 ?auto_369152 ) ) ( not ( = ?auto_369149 ?auto_369153 ) ) ( not ( = ?auto_369149 ?auto_369154 ) ) ( not ( = ?auto_369149 ?auto_369155 ) ) ( not ( = ?auto_369149 ?auto_369156 ) ) ( not ( = ?auto_369149 ?auto_369157 ) ) ( not ( = ?auto_369149 ?auto_369158 ) ) ( not ( = ?auto_369150 ?auto_369151 ) ) ( not ( = ?auto_369150 ?auto_369152 ) ) ( not ( = ?auto_369150 ?auto_369153 ) ) ( not ( = ?auto_369150 ?auto_369154 ) ) ( not ( = ?auto_369150 ?auto_369155 ) ) ( not ( = ?auto_369150 ?auto_369156 ) ) ( not ( = ?auto_369150 ?auto_369157 ) ) ( not ( = ?auto_369150 ?auto_369158 ) ) ( not ( = ?auto_369151 ?auto_369152 ) ) ( not ( = ?auto_369151 ?auto_369153 ) ) ( not ( = ?auto_369151 ?auto_369154 ) ) ( not ( = ?auto_369151 ?auto_369155 ) ) ( not ( = ?auto_369151 ?auto_369156 ) ) ( not ( = ?auto_369151 ?auto_369157 ) ) ( not ( = ?auto_369151 ?auto_369158 ) ) ( not ( = ?auto_369152 ?auto_369153 ) ) ( not ( = ?auto_369152 ?auto_369154 ) ) ( not ( = ?auto_369152 ?auto_369155 ) ) ( not ( = ?auto_369152 ?auto_369156 ) ) ( not ( = ?auto_369152 ?auto_369157 ) ) ( not ( = ?auto_369152 ?auto_369158 ) ) ( not ( = ?auto_369153 ?auto_369154 ) ) ( not ( = ?auto_369153 ?auto_369155 ) ) ( not ( = ?auto_369153 ?auto_369156 ) ) ( not ( = ?auto_369153 ?auto_369157 ) ) ( not ( = ?auto_369153 ?auto_369158 ) ) ( not ( = ?auto_369154 ?auto_369155 ) ) ( not ( = ?auto_369154 ?auto_369156 ) ) ( not ( = ?auto_369154 ?auto_369157 ) ) ( not ( = ?auto_369154 ?auto_369158 ) ) ( not ( = ?auto_369155 ?auto_369156 ) ) ( not ( = ?auto_369155 ?auto_369157 ) ) ( not ( = ?auto_369155 ?auto_369158 ) ) ( not ( = ?auto_369156 ?auto_369157 ) ) ( not ( = ?auto_369156 ?auto_369158 ) ) ( not ( = ?auto_369157 ?auto_369158 ) ) ( ON ?auto_369156 ?auto_369157 ) ( ON ?auto_369155 ?auto_369156 ) ( ON ?auto_369154 ?auto_369155 ) ( ON ?auto_369153 ?auto_369154 ) ( ON ?auto_369152 ?auto_369153 ) ( ON ?auto_369151 ?auto_369152 ) ( ON ?auto_369150 ?auto_369151 ) ( ON ?auto_369149 ?auto_369150 ) ( ON ?auto_369148 ?auto_369149 ) ( CLEAR ?auto_369146 ) ( ON ?auto_369147 ?auto_369148 ) ( CLEAR ?auto_369147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_369145 ?auto_369146 ?auto_369147 )
      ( MAKE-13PILE ?auto_369145 ?auto_369146 ?auto_369147 ?auto_369148 ?auto_369149 ?auto_369150 ?auto_369151 ?auto_369152 ?auto_369153 ?auto_369154 ?auto_369155 ?auto_369156 ?auto_369157 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_369199 - BLOCK
      ?auto_369200 - BLOCK
      ?auto_369201 - BLOCK
      ?auto_369202 - BLOCK
      ?auto_369203 - BLOCK
      ?auto_369204 - BLOCK
      ?auto_369205 - BLOCK
      ?auto_369206 - BLOCK
      ?auto_369207 - BLOCK
      ?auto_369208 - BLOCK
      ?auto_369209 - BLOCK
      ?auto_369210 - BLOCK
      ?auto_369211 - BLOCK
    )
    :vars
    (
      ?auto_369212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_369211 ?auto_369212 ) ( ON-TABLE ?auto_369199 ) ( not ( = ?auto_369199 ?auto_369200 ) ) ( not ( = ?auto_369199 ?auto_369201 ) ) ( not ( = ?auto_369199 ?auto_369202 ) ) ( not ( = ?auto_369199 ?auto_369203 ) ) ( not ( = ?auto_369199 ?auto_369204 ) ) ( not ( = ?auto_369199 ?auto_369205 ) ) ( not ( = ?auto_369199 ?auto_369206 ) ) ( not ( = ?auto_369199 ?auto_369207 ) ) ( not ( = ?auto_369199 ?auto_369208 ) ) ( not ( = ?auto_369199 ?auto_369209 ) ) ( not ( = ?auto_369199 ?auto_369210 ) ) ( not ( = ?auto_369199 ?auto_369211 ) ) ( not ( = ?auto_369199 ?auto_369212 ) ) ( not ( = ?auto_369200 ?auto_369201 ) ) ( not ( = ?auto_369200 ?auto_369202 ) ) ( not ( = ?auto_369200 ?auto_369203 ) ) ( not ( = ?auto_369200 ?auto_369204 ) ) ( not ( = ?auto_369200 ?auto_369205 ) ) ( not ( = ?auto_369200 ?auto_369206 ) ) ( not ( = ?auto_369200 ?auto_369207 ) ) ( not ( = ?auto_369200 ?auto_369208 ) ) ( not ( = ?auto_369200 ?auto_369209 ) ) ( not ( = ?auto_369200 ?auto_369210 ) ) ( not ( = ?auto_369200 ?auto_369211 ) ) ( not ( = ?auto_369200 ?auto_369212 ) ) ( not ( = ?auto_369201 ?auto_369202 ) ) ( not ( = ?auto_369201 ?auto_369203 ) ) ( not ( = ?auto_369201 ?auto_369204 ) ) ( not ( = ?auto_369201 ?auto_369205 ) ) ( not ( = ?auto_369201 ?auto_369206 ) ) ( not ( = ?auto_369201 ?auto_369207 ) ) ( not ( = ?auto_369201 ?auto_369208 ) ) ( not ( = ?auto_369201 ?auto_369209 ) ) ( not ( = ?auto_369201 ?auto_369210 ) ) ( not ( = ?auto_369201 ?auto_369211 ) ) ( not ( = ?auto_369201 ?auto_369212 ) ) ( not ( = ?auto_369202 ?auto_369203 ) ) ( not ( = ?auto_369202 ?auto_369204 ) ) ( not ( = ?auto_369202 ?auto_369205 ) ) ( not ( = ?auto_369202 ?auto_369206 ) ) ( not ( = ?auto_369202 ?auto_369207 ) ) ( not ( = ?auto_369202 ?auto_369208 ) ) ( not ( = ?auto_369202 ?auto_369209 ) ) ( not ( = ?auto_369202 ?auto_369210 ) ) ( not ( = ?auto_369202 ?auto_369211 ) ) ( not ( = ?auto_369202 ?auto_369212 ) ) ( not ( = ?auto_369203 ?auto_369204 ) ) ( not ( = ?auto_369203 ?auto_369205 ) ) ( not ( = ?auto_369203 ?auto_369206 ) ) ( not ( = ?auto_369203 ?auto_369207 ) ) ( not ( = ?auto_369203 ?auto_369208 ) ) ( not ( = ?auto_369203 ?auto_369209 ) ) ( not ( = ?auto_369203 ?auto_369210 ) ) ( not ( = ?auto_369203 ?auto_369211 ) ) ( not ( = ?auto_369203 ?auto_369212 ) ) ( not ( = ?auto_369204 ?auto_369205 ) ) ( not ( = ?auto_369204 ?auto_369206 ) ) ( not ( = ?auto_369204 ?auto_369207 ) ) ( not ( = ?auto_369204 ?auto_369208 ) ) ( not ( = ?auto_369204 ?auto_369209 ) ) ( not ( = ?auto_369204 ?auto_369210 ) ) ( not ( = ?auto_369204 ?auto_369211 ) ) ( not ( = ?auto_369204 ?auto_369212 ) ) ( not ( = ?auto_369205 ?auto_369206 ) ) ( not ( = ?auto_369205 ?auto_369207 ) ) ( not ( = ?auto_369205 ?auto_369208 ) ) ( not ( = ?auto_369205 ?auto_369209 ) ) ( not ( = ?auto_369205 ?auto_369210 ) ) ( not ( = ?auto_369205 ?auto_369211 ) ) ( not ( = ?auto_369205 ?auto_369212 ) ) ( not ( = ?auto_369206 ?auto_369207 ) ) ( not ( = ?auto_369206 ?auto_369208 ) ) ( not ( = ?auto_369206 ?auto_369209 ) ) ( not ( = ?auto_369206 ?auto_369210 ) ) ( not ( = ?auto_369206 ?auto_369211 ) ) ( not ( = ?auto_369206 ?auto_369212 ) ) ( not ( = ?auto_369207 ?auto_369208 ) ) ( not ( = ?auto_369207 ?auto_369209 ) ) ( not ( = ?auto_369207 ?auto_369210 ) ) ( not ( = ?auto_369207 ?auto_369211 ) ) ( not ( = ?auto_369207 ?auto_369212 ) ) ( not ( = ?auto_369208 ?auto_369209 ) ) ( not ( = ?auto_369208 ?auto_369210 ) ) ( not ( = ?auto_369208 ?auto_369211 ) ) ( not ( = ?auto_369208 ?auto_369212 ) ) ( not ( = ?auto_369209 ?auto_369210 ) ) ( not ( = ?auto_369209 ?auto_369211 ) ) ( not ( = ?auto_369209 ?auto_369212 ) ) ( not ( = ?auto_369210 ?auto_369211 ) ) ( not ( = ?auto_369210 ?auto_369212 ) ) ( not ( = ?auto_369211 ?auto_369212 ) ) ( ON ?auto_369210 ?auto_369211 ) ( ON ?auto_369209 ?auto_369210 ) ( ON ?auto_369208 ?auto_369209 ) ( ON ?auto_369207 ?auto_369208 ) ( ON ?auto_369206 ?auto_369207 ) ( ON ?auto_369205 ?auto_369206 ) ( ON ?auto_369204 ?auto_369205 ) ( ON ?auto_369203 ?auto_369204 ) ( ON ?auto_369202 ?auto_369203 ) ( ON ?auto_369201 ?auto_369202 ) ( CLEAR ?auto_369199 ) ( ON ?auto_369200 ?auto_369201 ) ( CLEAR ?auto_369200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_369199 ?auto_369200 )
      ( MAKE-13PILE ?auto_369199 ?auto_369200 ?auto_369201 ?auto_369202 ?auto_369203 ?auto_369204 ?auto_369205 ?auto_369206 ?auto_369207 ?auto_369208 ?auto_369209 ?auto_369210 ?auto_369211 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_369253 - BLOCK
      ?auto_369254 - BLOCK
      ?auto_369255 - BLOCK
      ?auto_369256 - BLOCK
      ?auto_369257 - BLOCK
      ?auto_369258 - BLOCK
      ?auto_369259 - BLOCK
      ?auto_369260 - BLOCK
      ?auto_369261 - BLOCK
      ?auto_369262 - BLOCK
      ?auto_369263 - BLOCK
      ?auto_369264 - BLOCK
      ?auto_369265 - BLOCK
    )
    :vars
    (
      ?auto_369266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_369265 ?auto_369266 ) ( not ( = ?auto_369253 ?auto_369254 ) ) ( not ( = ?auto_369253 ?auto_369255 ) ) ( not ( = ?auto_369253 ?auto_369256 ) ) ( not ( = ?auto_369253 ?auto_369257 ) ) ( not ( = ?auto_369253 ?auto_369258 ) ) ( not ( = ?auto_369253 ?auto_369259 ) ) ( not ( = ?auto_369253 ?auto_369260 ) ) ( not ( = ?auto_369253 ?auto_369261 ) ) ( not ( = ?auto_369253 ?auto_369262 ) ) ( not ( = ?auto_369253 ?auto_369263 ) ) ( not ( = ?auto_369253 ?auto_369264 ) ) ( not ( = ?auto_369253 ?auto_369265 ) ) ( not ( = ?auto_369253 ?auto_369266 ) ) ( not ( = ?auto_369254 ?auto_369255 ) ) ( not ( = ?auto_369254 ?auto_369256 ) ) ( not ( = ?auto_369254 ?auto_369257 ) ) ( not ( = ?auto_369254 ?auto_369258 ) ) ( not ( = ?auto_369254 ?auto_369259 ) ) ( not ( = ?auto_369254 ?auto_369260 ) ) ( not ( = ?auto_369254 ?auto_369261 ) ) ( not ( = ?auto_369254 ?auto_369262 ) ) ( not ( = ?auto_369254 ?auto_369263 ) ) ( not ( = ?auto_369254 ?auto_369264 ) ) ( not ( = ?auto_369254 ?auto_369265 ) ) ( not ( = ?auto_369254 ?auto_369266 ) ) ( not ( = ?auto_369255 ?auto_369256 ) ) ( not ( = ?auto_369255 ?auto_369257 ) ) ( not ( = ?auto_369255 ?auto_369258 ) ) ( not ( = ?auto_369255 ?auto_369259 ) ) ( not ( = ?auto_369255 ?auto_369260 ) ) ( not ( = ?auto_369255 ?auto_369261 ) ) ( not ( = ?auto_369255 ?auto_369262 ) ) ( not ( = ?auto_369255 ?auto_369263 ) ) ( not ( = ?auto_369255 ?auto_369264 ) ) ( not ( = ?auto_369255 ?auto_369265 ) ) ( not ( = ?auto_369255 ?auto_369266 ) ) ( not ( = ?auto_369256 ?auto_369257 ) ) ( not ( = ?auto_369256 ?auto_369258 ) ) ( not ( = ?auto_369256 ?auto_369259 ) ) ( not ( = ?auto_369256 ?auto_369260 ) ) ( not ( = ?auto_369256 ?auto_369261 ) ) ( not ( = ?auto_369256 ?auto_369262 ) ) ( not ( = ?auto_369256 ?auto_369263 ) ) ( not ( = ?auto_369256 ?auto_369264 ) ) ( not ( = ?auto_369256 ?auto_369265 ) ) ( not ( = ?auto_369256 ?auto_369266 ) ) ( not ( = ?auto_369257 ?auto_369258 ) ) ( not ( = ?auto_369257 ?auto_369259 ) ) ( not ( = ?auto_369257 ?auto_369260 ) ) ( not ( = ?auto_369257 ?auto_369261 ) ) ( not ( = ?auto_369257 ?auto_369262 ) ) ( not ( = ?auto_369257 ?auto_369263 ) ) ( not ( = ?auto_369257 ?auto_369264 ) ) ( not ( = ?auto_369257 ?auto_369265 ) ) ( not ( = ?auto_369257 ?auto_369266 ) ) ( not ( = ?auto_369258 ?auto_369259 ) ) ( not ( = ?auto_369258 ?auto_369260 ) ) ( not ( = ?auto_369258 ?auto_369261 ) ) ( not ( = ?auto_369258 ?auto_369262 ) ) ( not ( = ?auto_369258 ?auto_369263 ) ) ( not ( = ?auto_369258 ?auto_369264 ) ) ( not ( = ?auto_369258 ?auto_369265 ) ) ( not ( = ?auto_369258 ?auto_369266 ) ) ( not ( = ?auto_369259 ?auto_369260 ) ) ( not ( = ?auto_369259 ?auto_369261 ) ) ( not ( = ?auto_369259 ?auto_369262 ) ) ( not ( = ?auto_369259 ?auto_369263 ) ) ( not ( = ?auto_369259 ?auto_369264 ) ) ( not ( = ?auto_369259 ?auto_369265 ) ) ( not ( = ?auto_369259 ?auto_369266 ) ) ( not ( = ?auto_369260 ?auto_369261 ) ) ( not ( = ?auto_369260 ?auto_369262 ) ) ( not ( = ?auto_369260 ?auto_369263 ) ) ( not ( = ?auto_369260 ?auto_369264 ) ) ( not ( = ?auto_369260 ?auto_369265 ) ) ( not ( = ?auto_369260 ?auto_369266 ) ) ( not ( = ?auto_369261 ?auto_369262 ) ) ( not ( = ?auto_369261 ?auto_369263 ) ) ( not ( = ?auto_369261 ?auto_369264 ) ) ( not ( = ?auto_369261 ?auto_369265 ) ) ( not ( = ?auto_369261 ?auto_369266 ) ) ( not ( = ?auto_369262 ?auto_369263 ) ) ( not ( = ?auto_369262 ?auto_369264 ) ) ( not ( = ?auto_369262 ?auto_369265 ) ) ( not ( = ?auto_369262 ?auto_369266 ) ) ( not ( = ?auto_369263 ?auto_369264 ) ) ( not ( = ?auto_369263 ?auto_369265 ) ) ( not ( = ?auto_369263 ?auto_369266 ) ) ( not ( = ?auto_369264 ?auto_369265 ) ) ( not ( = ?auto_369264 ?auto_369266 ) ) ( not ( = ?auto_369265 ?auto_369266 ) ) ( ON ?auto_369264 ?auto_369265 ) ( ON ?auto_369263 ?auto_369264 ) ( ON ?auto_369262 ?auto_369263 ) ( ON ?auto_369261 ?auto_369262 ) ( ON ?auto_369260 ?auto_369261 ) ( ON ?auto_369259 ?auto_369260 ) ( ON ?auto_369258 ?auto_369259 ) ( ON ?auto_369257 ?auto_369258 ) ( ON ?auto_369256 ?auto_369257 ) ( ON ?auto_369255 ?auto_369256 ) ( ON ?auto_369254 ?auto_369255 ) ( ON ?auto_369253 ?auto_369254 ) ( CLEAR ?auto_369253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_369253 )
      ( MAKE-13PILE ?auto_369253 ?auto_369254 ?auto_369255 ?auto_369256 ?auto_369257 ?auto_369258 ?auto_369259 ?auto_369260 ?auto_369261 ?auto_369262 ?auto_369263 ?auto_369264 ?auto_369265 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_369308 - BLOCK
      ?auto_369309 - BLOCK
      ?auto_369310 - BLOCK
      ?auto_369311 - BLOCK
      ?auto_369312 - BLOCK
      ?auto_369313 - BLOCK
      ?auto_369314 - BLOCK
      ?auto_369315 - BLOCK
      ?auto_369316 - BLOCK
      ?auto_369317 - BLOCK
      ?auto_369318 - BLOCK
      ?auto_369319 - BLOCK
      ?auto_369320 - BLOCK
      ?auto_369321 - BLOCK
    )
    :vars
    (
      ?auto_369322 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_369320 ) ( ON ?auto_369321 ?auto_369322 ) ( CLEAR ?auto_369321 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_369308 ) ( ON ?auto_369309 ?auto_369308 ) ( ON ?auto_369310 ?auto_369309 ) ( ON ?auto_369311 ?auto_369310 ) ( ON ?auto_369312 ?auto_369311 ) ( ON ?auto_369313 ?auto_369312 ) ( ON ?auto_369314 ?auto_369313 ) ( ON ?auto_369315 ?auto_369314 ) ( ON ?auto_369316 ?auto_369315 ) ( ON ?auto_369317 ?auto_369316 ) ( ON ?auto_369318 ?auto_369317 ) ( ON ?auto_369319 ?auto_369318 ) ( ON ?auto_369320 ?auto_369319 ) ( not ( = ?auto_369308 ?auto_369309 ) ) ( not ( = ?auto_369308 ?auto_369310 ) ) ( not ( = ?auto_369308 ?auto_369311 ) ) ( not ( = ?auto_369308 ?auto_369312 ) ) ( not ( = ?auto_369308 ?auto_369313 ) ) ( not ( = ?auto_369308 ?auto_369314 ) ) ( not ( = ?auto_369308 ?auto_369315 ) ) ( not ( = ?auto_369308 ?auto_369316 ) ) ( not ( = ?auto_369308 ?auto_369317 ) ) ( not ( = ?auto_369308 ?auto_369318 ) ) ( not ( = ?auto_369308 ?auto_369319 ) ) ( not ( = ?auto_369308 ?auto_369320 ) ) ( not ( = ?auto_369308 ?auto_369321 ) ) ( not ( = ?auto_369308 ?auto_369322 ) ) ( not ( = ?auto_369309 ?auto_369310 ) ) ( not ( = ?auto_369309 ?auto_369311 ) ) ( not ( = ?auto_369309 ?auto_369312 ) ) ( not ( = ?auto_369309 ?auto_369313 ) ) ( not ( = ?auto_369309 ?auto_369314 ) ) ( not ( = ?auto_369309 ?auto_369315 ) ) ( not ( = ?auto_369309 ?auto_369316 ) ) ( not ( = ?auto_369309 ?auto_369317 ) ) ( not ( = ?auto_369309 ?auto_369318 ) ) ( not ( = ?auto_369309 ?auto_369319 ) ) ( not ( = ?auto_369309 ?auto_369320 ) ) ( not ( = ?auto_369309 ?auto_369321 ) ) ( not ( = ?auto_369309 ?auto_369322 ) ) ( not ( = ?auto_369310 ?auto_369311 ) ) ( not ( = ?auto_369310 ?auto_369312 ) ) ( not ( = ?auto_369310 ?auto_369313 ) ) ( not ( = ?auto_369310 ?auto_369314 ) ) ( not ( = ?auto_369310 ?auto_369315 ) ) ( not ( = ?auto_369310 ?auto_369316 ) ) ( not ( = ?auto_369310 ?auto_369317 ) ) ( not ( = ?auto_369310 ?auto_369318 ) ) ( not ( = ?auto_369310 ?auto_369319 ) ) ( not ( = ?auto_369310 ?auto_369320 ) ) ( not ( = ?auto_369310 ?auto_369321 ) ) ( not ( = ?auto_369310 ?auto_369322 ) ) ( not ( = ?auto_369311 ?auto_369312 ) ) ( not ( = ?auto_369311 ?auto_369313 ) ) ( not ( = ?auto_369311 ?auto_369314 ) ) ( not ( = ?auto_369311 ?auto_369315 ) ) ( not ( = ?auto_369311 ?auto_369316 ) ) ( not ( = ?auto_369311 ?auto_369317 ) ) ( not ( = ?auto_369311 ?auto_369318 ) ) ( not ( = ?auto_369311 ?auto_369319 ) ) ( not ( = ?auto_369311 ?auto_369320 ) ) ( not ( = ?auto_369311 ?auto_369321 ) ) ( not ( = ?auto_369311 ?auto_369322 ) ) ( not ( = ?auto_369312 ?auto_369313 ) ) ( not ( = ?auto_369312 ?auto_369314 ) ) ( not ( = ?auto_369312 ?auto_369315 ) ) ( not ( = ?auto_369312 ?auto_369316 ) ) ( not ( = ?auto_369312 ?auto_369317 ) ) ( not ( = ?auto_369312 ?auto_369318 ) ) ( not ( = ?auto_369312 ?auto_369319 ) ) ( not ( = ?auto_369312 ?auto_369320 ) ) ( not ( = ?auto_369312 ?auto_369321 ) ) ( not ( = ?auto_369312 ?auto_369322 ) ) ( not ( = ?auto_369313 ?auto_369314 ) ) ( not ( = ?auto_369313 ?auto_369315 ) ) ( not ( = ?auto_369313 ?auto_369316 ) ) ( not ( = ?auto_369313 ?auto_369317 ) ) ( not ( = ?auto_369313 ?auto_369318 ) ) ( not ( = ?auto_369313 ?auto_369319 ) ) ( not ( = ?auto_369313 ?auto_369320 ) ) ( not ( = ?auto_369313 ?auto_369321 ) ) ( not ( = ?auto_369313 ?auto_369322 ) ) ( not ( = ?auto_369314 ?auto_369315 ) ) ( not ( = ?auto_369314 ?auto_369316 ) ) ( not ( = ?auto_369314 ?auto_369317 ) ) ( not ( = ?auto_369314 ?auto_369318 ) ) ( not ( = ?auto_369314 ?auto_369319 ) ) ( not ( = ?auto_369314 ?auto_369320 ) ) ( not ( = ?auto_369314 ?auto_369321 ) ) ( not ( = ?auto_369314 ?auto_369322 ) ) ( not ( = ?auto_369315 ?auto_369316 ) ) ( not ( = ?auto_369315 ?auto_369317 ) ) ( not ( = ?auto_369315 ?auto_369318 ) ) ( not ( = ?auto_369315 ?auto_369319 ) ) ( not ( = ?auto_369315 ?auto_369320 ) ) ( not ( = ?auto_369315 ?auto_369321 ) ) ( not ( = ?auto_369315 ?auto_369322 ) ) ( not ( = ?auto_369316 ?auto_369317 ) ) ( not ( = ?auto_369316 ?auto_369318 ) ) ( not ( = ?auto_369316 ?auto_369319 ) ) ( not ( = ?auto_369316 ?auto_369320 ) ) ( not ( = ?auto_369316 ?auto_369321 ) ) ( not ( = ?auto_369316 ?auto_369322 ) ) ( not ( = ?auto_369317 ?auto_369318 ) ) ( not ( = ?auto_369317 ?auto_369319 ) ) ( not ( = ?auto_369317 ?auto_369320 ) ) ( not ( = ?auto_369317 ?auto_369321 ) ) ( not ( = ?auto_369317 ?auto_369322 ) ) ( not ( = ?auto_369318 ?auto_369319 ) ) ( not ( = ?auto_369318 ?auto_369320 ) ) ( not ( = ?auto_369318 ?auto_369321 ) ) ( not ( = ?auto_369318 ?auto_369322 ) ) ( not ( = ?auto_369319 ?auto_369320 ) ) ( not ( = ?auto_369319 ?auto_369321 ) ) ( not ( = ?auto_369319 ?auto_369322 ) ) ( not ( = ?auto_369320 ?auto_369321 ) ) ( not ( = ?auto_369320 ?auto_369322 ) ) ( not ( = ?auto_369321 ?auto_369322 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_369321 ?auto_369322 )
      ( !STACK ?auto_369321 ?auto_369320 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_369366 - BLOCK
      ?auto_369367 - BLOCK
      ?auto_369368 - BLOCK
      ?auto_369369 - BLOCK
      ?auto_369370 - BLOCK
      ?auto_369371 - BLOCK
      ?auto_369372 - BLOCK
      ?auto_369373 - BLOCK
      ?auto_369374 - BLOCK
      ?auto_369375 - BLOCK
      ?auto_369376 - BLOCK
      ?auto_369377 - BLOCK
      ?auto_369378 - BLOCK
      ?auto_369379 - BLOCK
    )
    :vars
    (
      ?auto_369380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_369379 ?auto_369380 ) ( ON-TABLE ?auto_369366 ) ( ON ?auto_369367 ?auto_369366 ) ( ON ?auto_369368 ?auto_369367 ) ( ON ?auto_369369 ?auto_369368 ) ( ON ?auto_369370 ?auto_369369 ) ( ON ?auto_369371 ?auto_369370 ) ( ON ?auto_369372 ?auto_369371 ) ( ON ?auto_369373 ?auto_369372 ) ( ON ?auto_369374 ?auto_369373 ) ( ON ?auto_369375 ?auto_369374 ) ( ON ?auto_369376 ?auto_369375 ) ( ON ?auto_369377 ?auto_369376 ) ( not ( = ?auto_369366 ?auto_369367 ) ) ( not ( = ?auto_369366 ?auto_369368 ) ) ( not ( = ?auto_369366 ?auto_369369 ) ) ( not ( = ?auto_369366 ?auto_369370 ) ) ( not ( = ?auto_369366 ?auto_369371 ) ) ( not ( = ?auto_369366 ?auto_369372 ) ) ( not ( = ?auto_369366 ?auto_369373 ) ) ( not ( = ?auto_369366 ?auto_369374 ) ) ( not ( = ?auto_369366 ?auto_369375 ) ) ( not ( = ?auto_369366 ?auto_369376 ) ) ( not ( = ?auto_369366 ?auto_369377 ) ) ( not ( = ?auto_369366 ?auto_369378 ) ) ( not ( = ?auto_369366 ?auto_369379 ) ) ( not ( = ?auto_369366 ?auto_369380 ) ) ( not ( = ?auto_369367 ?auto_369368 ) ) ( not ( = ?auto_369367 ?auto_369369 ) ) ( not ( = ?auto_369367 ?auto_369370 ) ) ( not ( = ?auto_369367 ?auto_369371 ) ) ( not ( = ?auto_369367 ?auto_369372 ) ) ( not ( = ?auto_369367 ?auto_369373 ) ) ( not ( = ?auto_369367 ?auto_369374 ) ) ( not ( = ?auto_369367 ?auto_369375 ) ) ( not ( = ?auto_369367 ?auto_369376 ) ) ( not ( = ?auto_369367 ?auto_369377 ) ) ( not ( = ?auto_369367 ?auto_369378 ) ) ( not ( = ?auto_369367 ?auto_369379 ) ) ( not ( = ?auto_369367 ?auto_369380 ) ) ( not ( = ?auto_369368 ?auto_369369 ) ) ( not ( = ?auto_369368 ?auto_369370 ) ) ( not ( = ?auto_369368 ?auto_369371 ) ) ( not ( = ?auto_369368 ?auto_369372 ) ) ( not ( = ?auto_369368 ?auto_369373 ) ) ( not ( = ?auto_369368 ?auto_369374 ) ) ( not ( = ?auto_369368 ?auto_369375 ) ) ( not ( = ?auto_369368 ?auto_369376 ) ) ( not ( = ?auto_369368 ?auto_369377 ) ) ( not ( = ?auto_369368 ?auto_369378 ) ) ( not ( = ?auto_369368 ?auto_369379 ) ) ( not ( = ?auto_369368 ?auto_369380 ) ) ( not ( = ?auto_369369 ?auto_369370 ) ) ( not ( = ?auto_369369 ?auto_369371 ) ) ( not ( = ?auto_369369 ?auto_369372 ) ) ( not ( = ?auto_369369 ?auto_369373 ) ) ( not ( = ?auto_369369 ?auto_369374 ) ) ( not ( = ?auto_369369 ?auto_369375 ) ) ( not ( = ?auto_369369 ?auto_369376 ) ) ( not ( = ?auto_369369 ?auto_369377 ) ) ( not ( = ?auto_369369 ?auto_369378 ) ) ( not ( = ?auto_369369 ?auto_369379 ) ) ( not ( = ?auto_369369 ?auto_369380 ) ) ( not ( = ?auto_369370 ?auto_369371 ) ) ( not ( = ?auto_369370 ?auto_369372 ) ) ( not ( = ?auto_369370 ?auto_369373 ) ) ( not ( = ?auto_369370 ?auto_369374 ) ) ( not ( = ?auto_369370 ?auto_369375 ) ) ( not ( = ?auto_369370 ?auto_369376 ) ) ( not ( = ?auto_369370 ?auto_369377 ) ) ( not ( = ?auto_369370 ?auto_369378 ) ) ( not ( = ?auto_369370 ?auto_369379 ) ) ( not ( = ?auto_369370 ?auto_369380 ) ) ( not ( = ?auto_369371 ?auto_369372 ) ) ( not ( = ?auto_369371 ?auto_369373 ) ) ( not ( = ?auto_369371 ?auto_369374 ) ) ( not ( = ?auto_369371 ?auto_369375 ) ) ( not ( = ?auto_369371 ?auto_369376 ) ) ( not ( = ?auto_369371 ?auto_369377 ) ) ( not ( = ?auto_369371 ?auto_369378 ) ) ( not ( = ?auto_369371 ?auto_369379 ) ) ( not ( = ?auto_369371 ?auto_369380 ) ) ( not ( = ?auto_369372 ?auto_369373 ) ) ( not ( = ?auto_369372 ?auto_369374 ) ) ( not ( = ?auto_369372 ?auto_369375 ) ) ( not ( = ?auto_369372 ?auto_369376 ) ) ( not ( = ?auto_369372 ?auto_369377 ) ) ( not ( = ?auto_369372 ?auto_369378 ) ) ( not ( = ?auto_369372 ?auto_369379 ) ) ( not ( = ?auto_369372 ?auto_369380 ) ) ( not ( = ?auto_369373 ?auto_369374 ) ) ( not ( = ?auto_369373 ?auto_369375 ) ) ( not ( = ?auto_369373 ?auto_369376 ) ) ( not ( = ?auto_369373 ?auto_369377 ) ) ( not ( = ?auto_369373 ?auto_369378 ) ) ( not ( = ?auto_369373 ?auto_369379 ) ) ( not ( = ?auto_369373 ?auto_369380 ) ) ( not ( = ?auto_369374 ?auto_369375 ) ) ( not ( = ?auto_369374 ?auto_369376 ) ) ( not ( = ?auto_369374 ?auto_369377 ) ) ( not ( = ?auto_369374 ?auto_369378 ) ) ( not ( = ?auto_369374 ?auto_369379 ) ) ( not ( = ?auto_369374 ?auto_369380 ) ) ( not ( = ?auto_369375 ?auto_369376 ) ) ( not ( = ?auto_369375 ?auto_369377 ) ) ( not ( = ?auto_369375 ?auto_369378 ) ) ( not ( = ?auto_369375 ?auto_369379 ) ) ( not ( = ?auto_369375 ?auto_369380 ) ) ( not ( = ?auto_369376 ?auto_369377 ) ) ( not ( = ?auto_369376 ?auto_369378 ) ) ( not ( = ?auto_369376 ?auto_369379 ) ) ( not ( = ?auto_369376 ?auto_369380 ) ) ( not ( = ?auto_369377 ?auto_369378 ) ) ( not ( = ?auto_369377 ?auto_369379 ) ) ( not ( = ?auto_369377 ?auto_369380 ) ) ( not ( = ?auto_369378 ?auto_369379 ) ) ( not ( = ?auto_369378 ?auto_369380 ) ) ( not ( = ?auto_369379 ?auto_369380 ) ) ( CLEAR ?auto_369377 ) ( ON ?auto_369378 ?auto_369379 ) ( CLEAR ?auto_369378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_369366 ?auto_369367 ?auto_369368 ?auto_369369 ?auto_369370 ?auto_369371 ?auto_369372 ?auto_369373 ?auto_369374 ?auto_369375 ?auto_369376 ?auto_369377 ?auto_369378 )
      ( MAKE-14PILE ?auto_369366 ?auto_369367 ?auto_369368 ?auto_369369 ?auto_369370 ?auto_369371 ?auto_369372 ?auto_369373 ?auto_369374 ?auto_369375 ?auto_369376 ?auto_369377 ?auto_369378 ?auto_369379 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_369424 - BLOCK
      ?auto_369425 - BLOCK
      ?auto_369426 - BLOCK
      ?auto_369427 - BLOCK
      ?auto_369428 - BLOCK
      ?auto_369429 - BLOCK
      ?auto_369430 - BLOCK
      ?auto_369431 - BLOCK
      ?auto_369432 - BLOCK
      ?auto_369433 - BLOCK
      ?auto_369434 - BLOCK
      ?auto_369435 - BLOCK
      ?auto_369436 - BLOCK
      ?auto_369437 - BLOCK
    )
    :vars
    (
      ?auto_369438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_369437 ?auto_369438 ) ( ON-TABLE ?auto_369424 ) ( ON ?auto_369425 ?auto_369424 ) ( ON ?auto_369426 ?auto_369425 ) ( ON ?auto_369427 ?auto_369426 ) ( ON ?auto_369428 ?auto_369427 ) ( ON ?auto_369429 ?auto_369428 ) ( ON ?auto_369430 ?auto_369429 ) ( ON ?auto_369431 ?auto_369430 ) ( ON ?auto_369432 ?auto_369431 ) ( ON ?auto_369433 ?auto_369432 ) ( ON ?auto_369434 ?auto_369433 ) ( not ( = ?auto_369424 ?auto_369425 ) ) ( not ( = ?auto_369424 ?auto_369426 ) ) ( not ( = ?auto_369424 ?auto_369427 ) ) ( not ( = ?auto_369424 ?auto_369428 ) ) ( not ( = ?auto_369424 ?auto_369429 ) ) ( not ( = ?auto_369424 ?auto_369430 ) ) ( not ( = ?auto_369424 ?auto_369431 ) ) ( not ( = ?auto_369424 ?auto_369432 ) ) ( not ( = ?auto_369424 ?auto_369433 ) ) ( not ( = ?auto_369424 ?auto_369434 ) ) ( not ( = ?auto_369424 ?auto_369435 ) ) ( not ( = ?auto_369424 ?auto_369436 ) ) ( not ( = ?auto_369424 ?auto_369437 ) ) ( not ( = ?auto_369424 ?auto_369438 ) ) ( not ( = ?auto_369425 ?auto_369426 ) ) ( not ( = ?auto_369425 ?auto_369427 ) ) ( not ( = ?auto_369425 ?auto_369428 ) ) ( not ( = ?auto_369425 ?auto_369429 ) ) ( not ( = ?auto_369425 ?auto_369430 ) ) ( not ( = ?auto_369425 ?auto_369431 ) ) ( not ( = ?auto_369425 ?auto_369432 ) ) ( not ( = ?auto_369425 ?auto_369433 ) ) ( not ( = ?auto_369425 ?auto_369434 ) ) ( not ( = ?auto_369425 ?auto_369435 ) ) ( not ( = ?auto_369425 ?auto_369436 ) ) ( not ( = ?auto_369425 ?auto_369437 ) ) ( not ( = ?auto_369425 ?auto_369438 ) ) ( not ( = ?auto_369426 ?auto_369427 ) ) ( not ( = ?auto_369426 ?auto_369428 ) ) ( not ( = ?auto_369426 ?auto_369429 ) ) ( not ( = ?auto_369426 ?auto_369430 ) ) ( not ( = ?auto_369426 ?auto_369431 ) ) ( not ( = ?auto_369426 ?auto_369432 ) ) ( not ( = ?auto_369426 ?auto_369433 ) ) ( not ( = ?auto_369426 ?auto_369434 ) ) ( not ( = ?auto_369426 ?auto_369435 ) ) ( not ( = ?auto_369426 ?auto_369436 ) ) ( not ( = ?auto_369426 ?auto_369437 ) ) ( not ( = ?auto_369426 ?auto_369438 ) ) ( not ( = ?auto_369427 ?auto_369428 ) ) ( not ( = ?auto_369427 ?auto_369429 ) ) ( not ( = ?auto_369427 ?auto_369430 ) ) ( not ( = ?auto_369427 ?auto_369431 ) ) ( not ( = ?auto_369427 ?auto_369432 ) ) ( not ( = ?auto_369427 ?auto_369433 ) ) ( not ( = ?auto_369427 ?auto_369434 ) ) ( not ( = ?auto_369427 ?auto_369435 ) ) ( not ( = ?auto_369427 ?auto_369436 ) ) ( not ( = ?auto_369427 ?auto_369437 ) ) ( not ( = ?auto_369427 ?auto_369438 ) ) ( not ( = ?auto_369428 ?auto_369429 ) ) ( not ( = ?auto_369428 ?auto_369430 ) ) ( not ( = ?auto_369428 ?auto_369431 ) ) ( not ( = ?auto_369428 ?auto_369432 ) ) ( not ( = ?auto_369428 ?auto_369433 ) ) ( not ( = ?auto_369428 ?auto_369434 ) ) ( not ( = ?auto_369428 ?auto_369435 ) ) ( not ( = ?auto_369428 ?auto_369436 ) ) ( not ( = ?auto_369428 ?auto_369437 ) ) ( not ( = ?auto_369428 ?auto_369438 ) ) ( not ( = ?auto_369429 ?auto_369430 ) ) ( not ( = ?auto_369429 ?auto_369431 ) ) ( not ( = ?auto_369429 ?auto_369432 ) ) ( not ( = ?auto_369429 ?auto_369433 ) ) ( not ( = ?auto_369429 ?auto_369434 ) ) ( not ( = ?auto_369429 ?auto_369435 ) ) ( not ( = ?auto_369429 ?auto_369436 ) ) ( not ( = ?auto_369429 ?auto_369437 ) ) ( not ( = ?auto_369429 ?auto_369438 ) ) ( not ( = ?auto_369430 ?auto_369431 ) ) ( not ( = ?auto_369430 ?auto_369432 ) ) ( not ( = ?auto_369430 ?auto_369433 ) ) ( not ( = ?auto_369430 ?auto_369434 ) ) ( not ( = ?auto_369430 ?auto_369435 ) ) ( not ( = ?auto_369430 ?auto_369436 ) ) ( not ( = ?auto_369430 ?auto_369437 ) ) ( not ( = ?auto_369430 ?auto_369438 ) ) ( not ( = ?auto_369431 ?auto_369432 ) ) ( not ( = ?auto_369431 ?auto_369433 ) ) ( not ( = ?auto_369431 ?auto_369434 ) ) ( not ( = ?auto_369431 ?auto_369435 ) ) ( not ( = ?auto_369431 ?auto_369436 ) ) ( not ( = ?auto_369431 ?auto_369437 ) ) ( not ( = ?auto_369431 ?auto_369438 ) ) ( not ( = ?auto_369432 ?auto_369433 ) ) ( not ( = ?auto_369432 ?auto_369434 ) ) ( not ( = ?auto_369432 ?auto_369435 ) ) ( not ( = ?auto_369432 ?auto_369436 ) ) ( not ( = ?auto_369432 ?auto_369437 ) ) ( not ( = ?auto_369432 ?auto_369438 ) ) ( not ( = ?auto_369433 ?auto_369434 ) ) ( not ( = ?auto_369433 ?auto_369435 ) ) ( not ( = ?auto_369433 ?auto_369436 ) ) ( not ( = ?auto_369433 ?auto_369437 ) ) ( not ( = ?auto_369433 ?auto_369438 ) ) ( not ( = ?auto_369434 ?auto_369435 ) ) ( not ( = ?auto_369434 ?auto_369436 ) ) ( not ( = ?auto_369434 ?auto_369437 ) ) ( not ( = ?auto_369434 ?auto_369438 ) ) ( not ( = ?auto_369435 ?auto_369436 ) ) ( not ( = ?auto_369435 ?auto_369437 ) ) ( not ( = ?auto_369435 ?auto_369438 ) ) ( not ( = ?auto_369436 ?auto_369437 ) ) ( not ( = ?auto_369436 ?auto_369438 ) ) ( not ( = ?auto_369437 ?auto_369438 ) ) ( ON ?auto_369436 ?auto_369437 ) ( CLEAR ?auto_369434 ) ( ON ?auto_369435 ?auto_369436 ) ( CLEAR ?auto_369435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_369424 ?auto_369425 ?auto_369426 ?auto_369427 ?auto_369428 ?auto_369429 ?auto_369430 ?auto_369431 ?auto_369432 ?auto_369433 ?auto_369434 ?auto_369435 )
      ( MAKE-14PILE ?auto_369424 ?auto_369425 ?auto_369426 ?auto_369427 ?auto_369428 ?auto_369429 ?auto_369430 ?auto_369431 ?auto_369432 ?auto_369433 ?auto_369434 ?auto_369435 ?auto_369436 ?auto_369437 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_369482 - BLOCK
      ?auto_369483 - BLOCK
      ?auto_369484 - BLOCK
      ?auto_369485 - BLOCK
      ?auto_369486 - BLOCK
      ?auto_369487 - BLOCK
      ?auto_369488 - BLOCK
      ?auto_369489 - BLOCK
      ?auto_369490 - BLOCK
      ?auto_369491 - BLOCK
      ?auto_369492 - BLOCK
      ?auto_369493 - BLOCK
      ?auto_369494 - BLOCK
      ?auto_369495 - BLOCK
    )
    :vars
    (
      ?auto_369496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_369495 ?auto_369496 ) ( ON-TABLE ?auto_369482 ) ( ON ?auto_369483 ?auto_369482 ) ( ON ?auto_369484 ?auto_369483 ) ( ON ?auto_369485 ?auto_369484 ) ( ON ?auto_369486 ?auto_369485 ) ( ON ?auto_369487 ?auto_369486 ) ( ON ?auto_369488 ?auto_369487 ) ( ON ?auto_369489 ?auto_369488 ) ( ON ?auto_369490 ?auto_369489 ) ( ON ?auto_369491 ?auto_369490 ) ( not ( = ?auto_369482 ?auto_369483 ) ) ( not ( = ?auto_369482 ?auto_369484 ) ) ( not ( = ?auto_369482 ?auto_369485 ) ) ( not ( = ?auto_369482 ?auto_369486 ) ) ( not ( = ?auto_369482 ?auto_369487 ) ) ( not ( = ?auto_369482 ?auto_369488 ) ) ( not ( = ?auto_369482 ?auto_369489 ) ) ( not ( = ?auto_369482 ?auto_369490 ) ) ( not ( = ?auto_369482 ?auto_369491 ) ) ( not ( = ?auto_369482 ?auto_369492 ) ) ( not ( = ?auto_369482 ?auto_369493 ) ) ( not ( = ?auto_369482 ?auto_369494 ) ) ( not ( = ?auto_369482 ?auto_369495 ) ) ( not ( = ?auto_369482 ?auto_369496 ) ) ( not ( = ?auto_369483 ?auto_369484 ) ) ( not ( = ?auto_369483 ?auto_369485 ) ) ( not ( = ?auto_369483 ?auto_369486 ) ) ( not ( = ?auto_369483 ?auto_369487 ) ) ( not ( = ?auto_369483 ?auto_369488 ) ) ( not ( = ?auto_369483 ?auto_369489 ) ) ( not ( = ?auto_369483 ?auto_369490 ) ) ( not ( = ?auto_369483 ?auto_369491 ) ) ( not ( = ?auto_369483 ?auto_369492 ) ) ( not ( = ?auto_369483 ?auto_369493 ) ) ( not ( = ?auto_369483 ?auto_369494 ) ) ( not ( = ?auto_369483 ?auto_369495 ) ) ( not ( = ?auto_369483 ?auto_369496 ) ) ( not ( = ?auto_369484 ?auto_369485 ) ) ( not ( = ?auto_369484 ?auto_369486 ) ) ( not ( = ?auto_369484 ?auto_369487 ) ) ( not ( = ?auto_369484 ?auto_369488 ) ) ( not ( = ?auto_369484 ?auto_369489 ) ) ( not ( = ?auto_369484 ?auto_369490 ) ) ( not ( = ?auto_369484 ?auto_369491 ) ) ( not ( = ?auto_369484 ?auto_369492 ) ) ( not ( = ?auto_369484 ?auto_369493 ) ) ( not ( = ?auto_369484 ?auto_369494 ) ) ( not ( = ?auto_369484 ?auto_369495 ) ) ( not ( = ?auto_369484 ?auto_369496 ) ) ( not ( = ?auto_369485 ?auto_369486 ) ) ( not ( = ?auto_369485 ?auto_369487 ) ) ( not ( = ?auto_369485 ?auto_369488 ) ) ( not ( = ?auto_369485 ?auto_369489 ) ) ( not ( = ?auto_369485 ?auto_369490 ) ) ( not ( = ?auto_369485 ?auto_369491 ) ) ( not ( = ?auto_369485 ?auto_369492 ) ) ( not ( = ?auto_369485 ?auto_369493 ) ) ( not ( = ?auto_369485 ?auto_369494 ) ) ( not ( = ?auto_369485 ?auto_369495 ) ) ( not ( = ?auto_369485 ?auto_369496 ) ) ( not ( = ?auto_369486 ?auto_369487 ) ) ( not ( = ?auto_369486 ?auto_369488 ) ) ( not ( = ?auto_369486 ?auto_369489 ) ) ( not ( = ?auto_369486 ?auto_369490 ) ) ( not ( = ?auto_369486 ?auto_369491 ) ) ( not ( = ?auto_369486 ?auto_369492 ) ) ( not ( = ?auto_369486 ?auto_369493 ) ) ( not ( = ?auto_369486 ?auto_369494 ) ) ( not ( = ?auto_369486 ?auto_369495 ) ) ( not ( = ?auto_369486 ?auto_369496 ) ) ( not ( = ?auto_369487 ?auto_369488 ) ) ( not ( = ?auto_369487 ?auto_369489 ) ) ( not ( = ?auto_369487 ?auto_369490 ) ) ( not ( = ?auto_369487 ?auto_369491 ) ) ( not ( = ?auto_369487 ?auto_369492 ) ) ( not ( = ?auto_369487 ?auto_369493 ) ) ( not ( = ?auto_369487 ?auto_369494 ) ) ( not ( = ?auto_369487 ?auto_369495 ) ) ( not ( = ?auto_369487 ?auto_369496 ) ) ( not ( = ?auto_369488 ?auto_369489 ) ) ( not ( = ?auto_369488 ?auto_369490 ) ) ( not ( = ?auto_369488 ?auto_369491 ) ) ( not ( = ?auto_369488 ?auto_369492 ) ) ( not ( = ?auto_369488 ?auto_369493 ) ) ( not ( = ?auto_369488 ?auto_369494 ) ) ( not ( = ?auto_369488 ?auto_369495 ) ) ( not ( = ?auto_369488 ?auto_369496 ) ) ( not ( = ?auto_369489 ?auto_369490 ) ) ( not ( = ?auto_369489 ?auto_369491 ) ) ( not ( = ?auto_369489 ?auto_369492 ) ) ( not ( = ?auto_369489 ?auto_369493 ) ) ( not ( = ?auto_369489 ?auto_369494 ) ) ( not ( = ?auto_369489 ?auto_369495 ) ) ( not ( = ?auto_369489 ?auto_369496 ) ) ( not ( = ?auto_369490 ?auto_369491 ) ) ( not ( = ?auto_369490 ?auto_369492 ) ) ( not ( = ?auto_369490 ?auto_369493 ) ) ( not ( = ?auto_369490 ?auto_369494 ) ) ( not ( = ?auto_369490 ?auto_369495 ) ) ( not ( = ?auto_369490 ?auto_369496 ) ) ( not ( = ?auto_369491 ?auto_369492 ) ) ( not ( = ?auto_369491 ?auto_369493 ) ) ( not ( = ?auto_369491 ?auto_369494 ) ) ( not ( = ?auto_369491 ?auto_369495 ) ) ( not ( = ?auto_369491 ?auto_369496 ) ) ( not ( = ?auto_369492 ?auto_369493 ) ) ( not ( = ?auto_369492 ?auto_369494 ) ) ( not ( = ?auto_369492 ?auto_369495 ) ) ( not ( = ?auto_369492 ?auto_369496 ) ) ( not ( = ?auto_369493 ?auto_369494 ) ) ( not ( = ?auto_369493 ?auto_369495 ) ) ( not ( = ?auto_369493 ?auto_369496 ) ) ( not ( = ?auto_369494 ?auto_369495 ) ) ( not ( = ?auto_369494 ?auto_369496 ) ) ( not ( = ?auto_369495 ?auto_369496 ) ) ( ON ?auto_369494 ?auto_369495 ) ( ON ?auto_369493 ?auto_369494 ) ( CLEAR ?auto_369491 ) ( ON ?auto_369492 ?auto_369493 ) ( CLEAR ?auto_369492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_369482 ?auto_369483 ?auto_369484 ?auto_369485 ?auto_369486 ?auto_369487 ?auto_369488 ?auto_369489 ?auto_369490 ?auto_369491 ?auto_369492 )
      ( MAKE-14PILE ?auto_369482 ?auto_369483 ?auto_369484 ?auto_369485 ?auto_369486 ?auto_369487 ?auto_369488 ?auto_369489 ?auto_369490 ?auto_369491 ?auto_369492 ?auto_369493 ?auto_369494 ?auto_369495 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_369540 - BLOCK
      ?auto_369541 - BLOCK
      ?auto_369542 - BLOCK
      ?auto_369543 - BLOCK
      ?auto_369544 - BLOCK
      ?auto_369545 - BLOCK
      ?auto_369546 - BLOCK
      ?auto_369547 - BLOCK
      ?auto_369548 - BLOCK
      ?auto_369549 - BLOCK
      ?auto_369550 - BLOCK
      ?auto_369551 - BLOCK
      ?auto_369552 - BLOCK
      ?auto_369553 - BLOCK
    )
    :vars
    (
      ?auto_369554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_369553 ?auto_369554 ) ( ON-TABLE ?auto_369540 ) ( ON ?auto_369541 ?auto_369540 ) ( ON ?auto_369542 ?auto_369541 ) ( ON ?auto_369543 ?auto_369542 ) ( ON ?auto_369544 ?auto_369543 ) ( ON ?auto_369545 ?auto_369544 ) ( ON ?auto_369546 ?auto_369545 ) ( ON ?auto_369547 ?auto_369546 ) ( ON ?auto_369548 ?auto_369547 ) ( not ( = ?auto_369540 ?auto_369541 ) ) ( not ( = ?auto_369540 ?auto_369542 ) ) ( not ( = ?auto_369540 ?auto_369543 ) ) ( not ( = ?auto_369540 ?auto_369544 ) ) ( not ( = ?auto_369540 ?auto_369545 ) ) ( not ( = ?auto_369540 ?auto_369546 ) ) ( not ( = ?auto_369540 ?auto_369547 ) ) ( not ( = ?auto_369540 ?auto_369548 ) ) ( not ( = ?auto_369540 ?auto_369549 ) ) ( not ( = ?auto_369540 ?auto_369550 ) ) ( not ( = ?auto_369540 ?auto_369551 ) ) ( not ( = ?auto_369540 ?auto_369552 ) ) ( not ( = ?auto_369540 ?auto_369553 ) ) ( not ( = ?auto_369540 ?auto_369554 ) ) ( not ( = ?auto_369541 ?auto_369542 ) ) ( not ( = ?auto_369541 ?auto_369543 ) ) ( not ( = ?auto_369541 ?auto_369544 ) ) ( not ( = ?auto_369541 ?auto_369545 ) ) ( not ( = ?auto_369541 ?auto_369546 ) ) ( not ( = ?auto_369541 ?auto_369547 ) ) ( not ( = ?auto_369541 ?auto_369548 ) ) ( not ( = ?auto_369541 ?auto_369549 ) ) ( not ( = ?auto_369541 ?auto_369550 ) ) ( not ( = ?auto_369541 ?auto_369551 ) ) ( not ( = ?auto_369541 ?auto_369552 ) ) ( not ( = ?auto_369541 ?auto_369553 ) ) ( not ( = ?auto_369541 ?auto_369554 ) ) ( not ( = ?auto_369542 ?auto_369543 ) ) ( not ( = ?auto_369542 ?auto_369544 ) ) ( not ( = ?auto_369542 ?auto_369545 ) ) ( not ( = ?auto_369542 ?auto_369546 ) ) ( not ( = ?auto_369542 ?auto_369547 ) ) ( not ( = ?auto_369542 ?auto_369548 ) ) ( not ( = ?auto_369542 ?auto_369549 ) ) ( not ( = ?auto_369542 ?auto_369550 ) ) ( not ( = ?auto_369542 ?auto_369551 ) ) ( not ( = ?auto_369542 ?auto_369552 ) ) ( not ( = ?auto_369542 ?auto_369553 ) ) ( not ( = ?auto_369542 ?auto_369554 ) ) ( not ( = ?auto_369543 ?auto_369544 ) ) ( not ( = ?auto_369543 ?auto_369545 ) ) ( not ( = ?auto_369543 ?auto_369546 ) ) ( not ( = ?auto_369543 ?auto_369547 ) ) ( not ( = ?auto_369543 ?auto_369548 ) ) ( not ( = ?auto_369543 ?auto_369549 ) ) ( not ( = ?auto_369543 ?auto_369550 ) ) ( not ( = ?auto_369543 ?auto_369551 ) ) ( not ( = ?auto_369543 ?auto_369552 ) ) ( not ( = ?auto_369543 ?auto_369553 ) ) ( not ( = ?auto_369543 ?auto_369554 ) ) ( not ( = ?auto_369544 ?auto_369545 ) ) ( not ( = ?auto_369544 ?auto_369546 ) ) ( not ( = ?auto_369544 ?auto_369547 ) ) ( not ( = ?auto_369544 ?auto_369548 ) ) ( not ( = ?auto_369544 ?auto_369549 ) ) ( not ( = ?auto_369544 ?auto_369550 ) ) ( not ( = ?auto_369544 ?auto_369551 ) ) ( not ( = ?auto_369544 ?auto_369552 ) ) ( not ( = ?auto_369544 ?auto_369553 ) ) ( not ( = ?auto_369544 ?auto_369554 ) ) ( not ( = ?auto_369545 ?auto_369546 ) ) ( not ( = ?auto_369545 ?auto_369547 ) ) ( not ( = ?auto_369545 ?auto_369548 ) ) ( not ( = ?auto_369545 ?auto_369549 ) ) ( not ( = ?auto_369545 ?auto_369550 ) ) ( not ( = ?auto_369545 ?auto_369551 ) ) ( not ( = ?auto_369545 ?auto_369552 ) ) ( not ( = ?auto_369545 ?auto_369553 ) ) ( not ( = ?auto_369545 ?auto_369554 ) ) ( not ( = ?auto_369546 ?auto_369547 ) ) ( not ( = ?auto_369546 ?auto_369548 ) ) ( not ( = ?auto_369546 ?auto_369549 ) ) ( not ( = ?auto_369546 ?auto_369550 ) ) ( not ( = ?auto_369546 ?auto_369551 ) ) ( not ( = ?auto_369546 ?auto_369552 ) ) ( not ( = ?auto_369546 ?auto_369553 ) ) ( not ( = ?auto_369546 ?auto_369554 ) ) ( not ( = ?auto_369547 ?auto_369548 ) ) ( not ( = ?auto_369547 ?auto_369549 ) ) ( not ( = ?auto_369547 ?auto_369550 ) ) ( not ( = ?auto_369547 ?auto_369551 ) ) ( not ( = ?auto_369547 ?auto_369552 ) ) ( not ( = ?auto_369547 ?auto_369553 ) ) ( not ( = ?auto_369547 ?auto_369554 ) ) ( not ( = ?auto_369548 ?auto_369549 ) ) ( not ( = ?auto_369548 ?auto_369550 ) ) ( not ( = ?auto_369548 ?auto_369551 ) ) ( not ( = ?auto_369548 ?auto_369552 ) ) ( not ( = ?auto_369548 ?auto_369553 ) ) ( not ( = ?auto_369548 ?auto_369554 ) ) ( not ( = ?auto_369549 ?auto_369550 ) ) ( not ( = ?auto_369549 ?auto_369551 ) ) ( not ( = ?auto_369549 ?auto_369552 ) ) ( not ( = ?auto_369549 ?auto_369553 ) ) ( not ( = ?auto_369549 ?auto_369554 ) ) ( not ( = ?auto_369550 ?auto_369551 ) ) ( not ( = ?auto_369550 ?auto_369552 ) ) ( not ( = ?auto_369550 ?auto_369553 ) ) ( not ( = ?auto_369550 ?auto_369554 ) ) ( not ( = ?auto_369551 ?auto_369552 ) ) ( not ( = ?auto_369551 ?auto_369553 ) ) ( not ( = ?auto_369551 ?auto_369554 ) ) ( not ( = ?auto_369552 ?auto_369553 ) ) ( not ( = ?auto_369552 ?auto_369554 ) ) ( not ( = ?auto_369553 ?auto_369554 ) ) ( ON ?auto_369552 ?auto_369553 ) ( ON ?auto_369551 ?auto_369552 ) ( ON ?auto_369550 ?auto_369551 ) ( CLEAR ?auto_369548 ) ( ON ?auto_369549 ?auto_369550 ) ( CLEAR ?auto_369549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_369540 ?auto_369541 ?auto_369542 ?auto_369543 ?auto_369544 ?auto_369545 ?auto_369546 ?auto_369547 ?auto_369548 ?auto_369549 )
      ( MAKE-14PILE ?auto_369540 ?auto_369541 ?auto_369542 ?auto_369543 ?auto_369544 ?auto_369545 ?auto_369546 ?auto_369547 ?auto_369548 ?auto_369549 ?auto_369550 ?auto_369551 ?auto_369552 ?auto_369553 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_369598 - BLOCK
      ?auto_369599 - BLOCK
      ?auto_369600 - BLOCK
      ?auto_369601 - BLOCK
      ?auto_369602 - BLOCK
      ?auto_369603 - BLOCK
      ?auto_369604 - BLOCK
      ?auto_369605 - BLOCK
      ?auto_369606 - BLOCK
      ?auto_369607 - BLOCK
      ?auto_369608 - BLOCK
      ?auto_369609 - BLOCK
      ?auto_369610 - BLOCK
      ?auto_369611 - BLOCK
    )
    :vars
    (
      ?auto_369612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_369611 ?auto_369612 ) ( ON-TABLE ?auto_369598 ) ( ON ?auto_369599 ?auto_369598 ) ( ON ?auto_369600 ?auto_369599 ) ( ON ?auto_369601 ?auto_369600 ) ( ON ?auto_369602 ?auto_369601 ) ( ON ?auto_369603 ?auto_369602 ) ( ON ?auto_369604 ?auto_369603 ) ( ON ?auto_369605 ?auto_369604 ) ( not ( = ?auto_369598 ?auto_369599 ) ) ( not ( = ?auto_369598 ?auto_369600 ) ) ( not ( = ?auto_369598 ?auto_369601 ) ) ( not ( = ?auto_369598 ?auto_369602 ) ) ( not ( = ?auto_369598 ?auto_369603 ) ) ( not ( = ?auto_369598 ?auto_369604 ) ) ( not ( = ?auto_369598 ?auto_369605 ) ) ( not ( = ?auto_369598 ?auto_369606 ) ) ( not ( = ?auto_369598 ?auto_369607 ) ) ( not ( = ?auto_369598 ?auto_369608 ) ) ( not ( = ?auto_369598 ?auto_369609 ) ) ( not ( = ?auto_369598 ?auto_369610 ) ) ( not ( = ?auto_369598 ?auto_369611 ) ) ( not ( = ?auto_369598 ?auto_369612 ) ) ( not ( = ?auto_369599 ?auto_369600 ) ) ( not ( = ?auto_369599 ?auto_369601 ) ) ( not ( = ?auto_369599 ?auto_369602 ) ) ( not ( = ?auto_369599 ?auto_369603 ) ) ( not ( = ?auto_369599 ?auto_369604 ) ) ( not ( = ?auto_369599 ?auto_369605 ) ) ( not ( = ?auto_369599 ?auto_369606 ) ) ( not ( = ?auto_369599 ?auto_369607 ) ) ( not ( = ?auto_369599 ?auto_369608 ) ) ( not ( = ?auto_369599 ?auto_369609 ) ) ( not ( = ?auto_369599 ?auto_369610 ) ) ( not ( = ?auto_369599 ?auto_369611 ) ) ( not ( = ?auto_369599 ?auto_369612 ) ) ( not ( = ?auto_369600 ?auto_369601 ) ) ( not ( = ?auto_369600 ?auto_369602 ) ) ( not ( = ?auto_369600 ?auto_369603 ) ) ( not ( = ?auto_369600 ?auto_369604 ) ) ( not ( = ?auto_369600 ?auto_369605 ) ) ( not ( = ?auto_369600 ?auto_369606 ) ) ( not ( = ?auto_369600 ?auto_369607 ) ) ( not ( = ?auto_369600 ?auto_369608 ) ) ( not ( = ?auto_369600 ?auto_369609 ) ) ( not ( = ?auto_369600 ?auto_369610 ) ) ( not ( = ?auto_369600 ?auto_369611 ) ) ( not ( = ?auto_369600 ?auto_369612 ) ) ( not ( = ?auto_369601 ?auto_369602 ) ) ( not ( = ?auto_369601 ?auto_369603 ) ) ( not ( = ?auto_369601 ?auto_369604 ) ) ( not ( = ?auto_369601 ?auto_369605 ) ) ( not ( = ?auto_369601 ?auto_369606 ) ) ( not ( = ?auto_369601 ?auto_369607 ) ) ( not ( = ?auto_369601 ?auto_369608 ) ) ( not ( = ?auto_369601 ?auto_369609 ) ) ( not ( = ?auto_369601 ?auto_369610 ) ) ( not ( = ?auto_369601 ?auto_369611 ) ) ( not ( = ?auto_369601 ?auto_369612 ) ) ( not ( = ?auto_369602 ?auto_369603 ) ) ( not ( = ?auto_369602 ?auto_369604 ) ) ( not ( = ?auto_369602 ?auto_369605 ) ) ( not ( = ?auto_369602 ?auto_369606 ) ) ( not ( = ?auto_369602 ?auto_369607 ) ) ( not ( = ?auto_369602 ?auto_369608 ) ) ( not ( = ?auto_369602 ?auto_369609 ) ) ( not ( = ?auto_369602 ?auto_369610 ) ) ( not ( = ?auto_369602 ?auto_369611 ) ) ( not ( = ?auto_369602 ?auto_369612 ) ) ( not ( = ?auto_369603 ?auto_369604 ) ) ( not ( = ?auto_369603 ?auto_369605 ) ) ( not ( = ?auto_369603 ?auto_369606 ) ) ( not ( = ?auto_369603 ?auto_369607 ) ) ( not ( = ?auto_369603 ?auto_369608 ) ) ( not ( = ?auto_369603 ?auto_369609 ) ) ( not ( = ?auto_369603 ?auto_369610 ) ) ( not ( = ?auto_369603 ?auto_369611 ) ) ( not ( = ?auto_369603 ?auto_369612 ) ) ( not ( = ?auto_369604 ?auto_369605 ) ) ( not ( = ?auto_369604 ?auto_369606 ) ) ( not ( = ?auto_369604 ?auto_369607 ) ) ( not ( = ?auto_369604 ?auto_369608 ) ) ( not ( = ?auto_369604 ?auto_369609 ) ) ( not ( = ?auto_369604 ?auto_369610 ) ) ( not ( = ?auto_369604 ?auto_369611 ) ) ( not ( = ?auto_369604 ?auto_369612 ) ) ( not ( = ?auto_369605 ?auto_369606 ) ) ( not ( = ?auto_369605 ?auto_369607 ) ) ( not ( = ?auto_369605 ?auto_369608 ) ) ( not ( = ?auto_369605 ?auto_369609 ) ) ( not ( = ?auto_369605 ?auto_369610 ) ) ( not ( = ?auto_369605 ?auto_369611 ) ) ( not ( = ?auto_369605 ?auto_369612 ) ) ( not ( = ?auto_369606 ?auto_369607 ) ) ( not ( = ?auto_369606 ?auto_369608 ) ) ( not ( = ?auto_369606 ?auto_369609 ) ) ( not ( = ?auto_369606 ?auto_369610 ) ) ( not ( = ?auto_369606 ?auto_369611 ) ) ( not ( = ?auto_369606 ?auto_369612 ) ) ( not ( = ?auto_369607 ?auto_369608 ) ) ( not ( = ?auto_369607 ?auto_369609 ) ) ( not ( = ?auto_369607 ?auto_369610 ) ) ( not ( = ?auto_369607 ?auto_369611 ) ) ( not ( = ?auto_369607 ?auto_369612 ) ) ( not ( = ?auto_369608 ?auto_369609 ) ) ( not ( = ?auto_369608 ?auto_369610 ) ) ( not ( = ?auto_369608 ?auto_369611 ) ) ( not ( = ?auto_369608 ?auto_369612 ) ) ( not ( = ?auto_369609 ?auto_369610 ) ) ( not ( = ?auto_369609 ?auto_369611 ) ) ( not ( = ?auto_369609 ?auto_369612 ) ) ( not ( = ?auto_369610 ?auto_369611 ) ) ( not ( = ?auto_369610 ?auto_369612 ) ) ( not ( = ?auto_369611 ?auto_369612 ) ) ( ON ?auto_369610 ?auto_369611 ) ( ON ?auto_369609 ?auto_369610 ) ( ON ?auto_369608 ?auto_369609 ) ( ON ?auto_369607 ?auto_369608 ) ( CLEAR ?auto_369605 ) ( ON ?auto_369606 ?auto_369607 ) ( CLEAR ?auto_369606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_369598 ?auto_369599 ?auto_369600 ?auto_369601 ?auto_369602 ?auto_369603 ?auto_369604 ?auto_369605 ?auto_369606 )
      ( MAKE-14PILE ?auto_369598 ?auto_369599 ?auto_369600 ?auto_369601 ?auto_369602 ?auto_369603 ?auto_369604 ?auto_369605 ?auto_369606 ?auto_369607 ?auto_369608 ?auto_369609 ?auto_369610 ?auto_369611 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_369656 - BLOCK
      ?auto_369657 - BLOCK
      ?auto_369658 - BLOCK
      ?auto_369659 - BLOCK
      ?auto_369660 - BLOCK
      ?auto_369661 - BLOCK
      ?auto_369662 - BLOCK
      ?auto_369663 - BLOCK
      ?auto_369664 - BLOCK
      ?auto_369665 - BLOCK
      ?auto_369666 - BLOCK
      ?auto_369667 - BLOCK
      ?auto_369668 - BLOCK
      ?auto_369669 - BLOCK
    )
    :vars
    (
      ?auto_369670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_369669 ?auto_369670 ) ( ON-TABLE ?auto_369656 ) ( ON ?auto_369657 ?auto_369656 ) ( ON ?auto_369658 ?auto_369657 ) ( ON ?auto_369659 ?auto_369658 ) ( ON ?auto_369660 ?auto_369659 ) ( ON ?auto_369661 ?auto_369660 ) ( ON ?auto_369662 ?auto_369661 ) ( not ( = ?auto_369656 ?auto_369657 ) ) ( not ( = ?auto_369656 ?auto_369658 ) ) ( not ( = ?auto_369656 ?auto_369659 ) ) ( not ( = ?auto_369656 ?auto_369660 ) ) ( not ( = ?auto_369656 ?auto_369661 ) ) ( not ( = ?auto_369656 ?auto_369662 ) ) ( not ( = ?auto_369656 ?auto_369663 ) ) ( not ( = ?auto_369656 ?auto_369664 ) ) ( not ( = ?auto_369656 ?auto_369665 ) ) ( not ( = ?auto_369656 ?auto_369666 ) ) ( not ( = ?auto_369656 ?auto_369667 ) ) ( not ( = ?auto_369656 ?auto_369668 ) ) ( not ( = ?auto_369656 ?auto_369669 ) ) ( not ( = ?auto_369656 ?auto_369670 ) ) ( not ( = ?auto_369657 ?auto_369658 ) ) ( not ( = ?auto_369657 ?auto_369659 ) ) ( not ( = ?auto_369657 ?auto_369660 ) ) ( not ( = ?auto_369657 ?auto_369661 ) ) ( not ( = ?auto_369657 ?auto_369662 ) ) ( not ( = ?auto_369657 ?auto_369663 ) ) ( not ( = ?auto_369657 ?auto_369664 ) ) ( not ( = ?auto_369657 ?auto_369665 ) ) ( not ( = ?auto_369657 ?auto_369666 ) ) ( not ( = ?auto_369657 ?auto_369667 ) ) ( not ( = ?auto_369657 ?auto_369668 ) ) ( not ( = ?auto_369657 ?auto_369669 ) ) ( not ( = ?auto_369657 ?auto_369670 ) ) ( not ( = ?auto_369658 ?auto_369659 ) ) ( not ( = ?auto_369658 ?auto_369660 ) ) ( not ( = ?auto_369658 ?auto_369661 ) ) ( not ( = ?auto_369658 ?auto_369662 ) ) ( not ( = ?auto_369658 ?auto_369663 ) ) ( not ( = ?auto_369658 ?auto_369664 ) ) ( not ( = ?auto_369658 ?auto_369665 ) ) ( not ( = ?auto_369658 ?auto_369666 ) ) ( not ( = ?auto_369658 ?auto_369667 ) ) ( not ( = ?auto_369658 ?auto_369668 ) ) ( not ( = ?auto_369658 ?auto_369669 ) ) ( not ( = ?auto_369658 ?auto_369670 ) ) ( not ( = ?auto_369659 ?auto_369660 ) ) ( not ( = ?auto_369659 ?auto_369661 ) ) ( not ( = ?auto_369659 ?auto_369662 ) ) ( not ( = ?auto_369659 ?auto_369663 ) ) ( not ( = ?auto_369659 ?auto_369664 ) ) ( not ( = ?auto_369659 ?auto_369665 ) ) ( not ( = ?auto_369659 ?auto_369666 ) ) ( not ( = ?auto_369659 ?auto_369667 ) ) ( not ( = ?auto_369659 ?auto_369668 ) ) ( not ( = ?auto_369659 ?auto_369669 ) ) ( not ( = ?auto_369659 ?auto_369670 ) ) ( not ( = ?auto_369660 ?auto_369661 ) ) ( not ( = ?auto_369660 ?auto_369662 ) ) ( not ( = ?auto_369660 ?auto_369663 ) ) ( not ( = ?auto_369660 ?auto_369664 ) ) ( not ( = ?auto_369660 ?auto_369665 ) ) ( not ( = ?auto_369660 ?auto_369666 ) ) ( not ( = ?auto_369660 ?auto_369667 ) ) ( not ( = ?auto_369660 ?auto_369668 ) ) ( not ( = ?auto_369660 ?auto_369669 ) ) ( not ( = ?auto_369660 ?auto_369670 ) ) ( not ( = ?auto_369661 ?auto_369662 ) ) ( not ( = ?auto_369661 ?auto_369663 ) ) ( not ( = ?auto_369661 ?auto_369664 ) ) ( not ( = ?auto_369661 ?auto_369665 ) ) ( not ( = ?auto_369661 ?auto_369666 ) ) ( not ( = ?auto_369661 ?auto_369667 ) ) ( not ( = ?auto_369661 ?auto_369668 ) ) ( not ( = ?auto_369661 ?auto_369669 ) ) ( not ( = ?auto_369661 ?auto_369670 ) ) ( not ( = ?auto_369662 ?auto_369663 ) ) ( not ( = ?auto_369662 ?auto_369664 ) ) ( not ( = ?auto_369662 ?auto_369665 ) ) ( not ( = ?auto_369662 ?auto_369666 ) ) ( not ( = ?auto_369662 ?auto_369667 ) ) ( not ( = ?auto_369662 ?auto_369668 ) ) ( not ( = ?auto_369662 ?auto_369669 ) ) ( not ( = ?auto_369662 ?auto_369670 ) ) ( not ( = ?auto_369663 ?auto_369664 ) ) ( not ( = ?auto_369663 ?auto_369665 ) ) ( not ( = ?auto_369663 ?auto_369666 ) ) ( not ( = ?auto_369663 ?auto_369667 ) ) ( not ( = ?auto_369663 ?auto_369668 ) ) ( not ( = ?auto_369663 ?auto_369669 ) ) ( not ( = ?auto_369663 ?auto_369670 ) ) ( not ( = ?auto_369664 ?auto_369665 ) ) ( not ( = ?auto_369664 ?auto_369666 ) ) ( not ( = ?auto_369664 ?auto_369667 ) ) ( not ( = ?auto_369664 ?auto_369668 ) ) ( not ( = ?auto_369664 ?auto_369669 ) ) ( not ( = ?auto_369664 ?auto_369670 ) ) ( not ( = ?auto_369665 ?auto_369666 ) ) ( not ( = ?auto_369665 ?auto_369667 ) ) ( not ( = ?auto_369665 ?auto_369668 ) ) ( not ( = ?auto_369665 ?auto_369669 ) ) ( not ( = ?auto_369665 ?auto_369670 ) ) ( not ( = ?auto_369666 ?auto_369667 ) ) ( not ( = ?auto_369666 ?auto_369668 ) ) ( not ( = ?auto_369666 ?auto_369669 ) ) ( not ( = ?auto_369666 ?auto_369670 ) ) ( not ( = ?auto_369667 ?auto_369668 ) ) ( not ( = ?auto_369667 ?auto_369669 ) ) ( not ( = ?auto_369667 ?auto_369670 ) ) ( not ( = ?auto_369668 ?auto_369669 ) ) ( not ( = ?auto_369668 ?auto_369670 ) ) ( not ( = ?auto_369669 ?auto_369670 ) ) ( ON ?auto_369668 ?auto_369669 ) ( ON ?auto_369667 ?auto_369668 ) ( ON ?auto_369666 ?auto_369667 ) ( ON ?auto_369665 ?auto_369666 ) ( ON ?auto_369664 ?auto_369665 ) ( CLEAR ?auto_369662 ) ( ON ?auto_369663 ?auto_369664 ) ( CLEAR ?auto_369663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_369656 ?auto_369657 ?auto_369658 ?auto_369659 ?auto_369660 ?auto_369661 ?auto_369662 ?auto_369663 )
      ( MAKE-14PILE ?auto_369656 ?auto_369657 ?auto_369658 ?auto_369659 ?auto_369660 ?auto_369661 ?auto_369662 ?auto_369663 ?auto_369664 ?auto_369665 ?auto_369666 ?auto_369667 ?auto_369668 ?auto_369669 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_369714 - BLOCK
      ?auto_369715 - BLOCK
      ?auto_369716 - BLOCK
      ?auto_369717 - BLOCK
      ?auto_369718 - BLOCK
      ?auto_369719 - BLOCK
      ?auto_369720 - BLOCK
      ?auto_369721 - BLOCK
      ?auto_369722 - BLOCK
      ?auto_369723 - BLOCK
      ?auto_369724 - BLOCK
      ?auto_369725 - BLOCK
      ?auto_369726 - BLOCK
      ?auto_369727 - BLOCK
    )
    :vars
    (
      ?auto_369728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_369727 ?auto_369728 ) ( ON-TABLE ?auto_369714 ) ( ON ?auto_369715 ?auto_369714 ) ( ON ?auto_369716 ?auto_369715 ) ( ON ?auto_369717 ?auto_369716 ) ( ON ?auto_369718 ?auto_369717 ) ( ON ?auto_369719 ?auto_369718 ) ( not ( = ?auto_369714 ?auto_369715 ) ) ( not ( = ?auto_369714 ?auto_369716 ) ) ( not ( = ?auto_369714 ?auto_369717 ) ) ( not ( = ?auto_369714 ?auto_369718 ) ) ( not ( = ?auto_369714 ?auto_369719 ) ) ( not ( = ?auto_369714 ?auto_369720 ) ) ( not ( = ?auto_369714 ?auto_369721 ) ) ( not ( = ?auto_369714 ?auto_369722 ) ) ( not ( = ?auto_369714 ?auto_369723 ) ) ( not ( = ?auto_369714 ?auto_369724 ) ) ( not ( = ?auto_369714 ?auto_369725 ) ) ( not ( = ?auto_369714 ?auto_369726 ) ) ( not ( = ?auto_369714 ?auto_369727 ) ) ( not ( = ?auto_369714 ?auto_369728 ) ) ( not ( = ?auto_369715 ?auto_369716 ) ) ( not ( = ?auto_369715 ?auto_369717 ) ) ( not ( = ?auto_369715 ?auto_369718 ) ) ( not ( = ?auto_369715 ?auto_369719 ) ) ( not ( = ?auto_369715 ?auto_369720 ) ) ( not ( = ?auto_369715 ?auto_369721 ) ) ( not ( = ?auto_369715 ?auto_369722 ) ) ( not ( = ?auto_369715 ?auto_369723 ) ) ( not ( = ?auto_369715 ?auto_369724 ) ) ( not ( = ?auto_369715 ?auto_369725 ) ) ( not ( = ?auto_369715 ?auto_369726 ) ) ( not ( = ?auto_369715 ?auto_369727 ) ) ( not ( = ?auto_369715 ?auto_369728 ) ) ( not ( = ?auto_369716 ?auto_369717 ) ) ( not ( = ?auto_369716 ?auto_369718 ) ) ( not ( = ?auto_369716 ?auto_369719 ) ) ( not ( = ?auto_369716 ?auto_369720 ) ) ( not ( = ?auto_369716 ?auto_369721 ) ) ( not ( = ?auto_369716 ?auto_369722 ) ) ( not ( = ?auto_369716 ?auto_369723 ) ) ( not ( = ?auto_369716 ?auto_369724 ) ) ( not ( = ?auto_369716 ?auto_369725 ) ) ( not ( = ?auto_369716 ?auto_369726 ) ) ( not ( = ?auto_369716 ?auto_369727 ) ) ( not ( = ?auto_369716 ?auto_369728 ) ) ( not ( = ?auto_369717 ?auto_369718 ) ) ( not ( = ?auto_369717 ?auto_369719 ) ) ( not ( = ?auto_369717 ?auto_369720 ) ) ( not ( = ?auto_369717 ?auto_369721 ) ) ( not ( = ?auto_369717 ?auto_369722 ) ) ( not ( = ?auto_369717 ?auto_369723 ) ) ( not ( = ?auto_369717 ?auto_369724 ) ) ( not ( = ?auto_369717 ?auto_369725 ) ) ( not ( = ?auto_369717 ?auto_369726 ) ) ( not ( = ?auto_369717 ?auto_369727 ) ) ( not ( = ?auto_369717 ?auto_369728 ) ) ( not ( = ?auto_369718 ?auto_369719 ) ) ( not ( = ?auto_369718 ?auto_369720 ) ) ( not ( = ?auto_369718 ?auto_369721 ) ) ( not ( = ?auto_369718 ?auto_369722 ) ) ( not ( = ?auto_369718 ?auto_369723 ) ) ( not ( = ?auto_369718 ?auto_369724 ) ) ( not ( = ?auto_369718 ?auto_369725 ) ) ( not ( = ?auto_369718 ?auto_369726 ) ) ( not ( = ?auto_369718 ?auto_369727 ) ) ( not ( = ?auto_369718 ?auto_369728 ) ) ( not ( = ?auto_369719 ?auto_369720 ) ) ( not ( = ?auto_369719 ?auto_369721 ) ) ( not ( = ?auto_369719 ?auto_369722 ) ) ( not ( = ?auto_369719 ?auto_369723 ) ) ( not ( = ?auto_369719 ?auto_369724 ) ) ( not ( = ?auto_369719 ?auto_369725 ) ) ( not ( = ?auto_369719 ?auto_369726 ) ) ( not ( = ?auto_369719 ?auto_369727 ) ) ( not ( = ?auto_369719 ?auto_369728 ) ) ( not ( = ?auto_369720 ?auto_369721 ) ) ( not ( = ?auto_369720 ?auto_369722 ) ) ( not ( = ?auto_369720 ?auto_369723 ) ) ( not ( = ?auto_369720 ?auto_369724 ) ) ( not ( = ?auto_369720 ?auto_369725 ) ) ( not ( = ?auto_369720 ?auto_369726 ) ) ( not ( = ?auto_369720 ?auto_369727 ) ) ( not ( = ?auto_369720 ?auto_369728 ) ) ( not ( = ?auto_369721 ?auto_369722 ) ) ( not ( = ?auto_369721 ?auto_369723 ) ) ( not ( = ?auto_369721 ?auto_369724 ) ) ( not ( = ?auto_369721 ?auto_369725 ) ) ( not ( = ?auto_369721 ?auto_369726 ) ) ( not ( = ?auto_369721 ?auto_369727 ) ) ( not ( = ?auto_369721 ?auto_369728 ) ) ( not ( = ?auto_369722 ?auto_369723 ) ) ( not ( = ?auto_369722 ?auto_369724 ) ) ( not ( = ?auto_369722 ?auto_369725 ) ) ( not ( = ?auto_369722 ?auto_369726 ) ) ( not ( = ?auto_369722 ?auto_369727 ) ) ( not ( = ?auto_369722 ?auto_369728 ) ) ( not ( = ?auto_369723 ?auto_369724 ) ) ( not ( = ?auto_369723 ?auto_369725 ) ) ( not ( = ?auto_369723 ?auto_369726 ) ) ( not ( = ?auto_369723 ?auto_369727 ) ) ( not ( = ?auto_369723 ?auto_369728 ) ) ( not ( = ?auto_369724 ?auto_369725 ) ) ( not ( = ?auto_369724 ?auto_369726 ) ) ( not ( = ?auto_369724 ?auto_369727 ) ) ( not ( = ?auto_369724 ?auto_369728 ) ) ( not ( = ?auto_369725 ?auto_369726 ) ) ( not ( = ?auto_369725 ?auto_369727 ) ) ( not ( = ?auto_369725 ?auto_369728 ) ) ( not ( = ?auto_369726 ?auto_369727 ) ) ( not ( = ?auto_369726 ?auto_369728 ) ) ( not ( = ?auto_369727 ?auto_369728 ) ) ( ON ?auto_369726 ?auto_369727 ) ( ON ?auto_369725 ?auto_369726 ) ( ON ?auto_369724 ?auto_369725 ) ( ON ?auto_369723 ?auto_369724 ) ( ON ?auto_369722 ?auto_369723 ) ( ON ?auto_369721 ?auto_369722 ) ( CLEAR ?auto_369719 ) ( ON ?auto_369720 ?auto_369721 ) ( CLEAR ?auto_369720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_369714 ?auto_369715 ?auto_369716 ?auto_369717 ?auto_369718 ?auto_369719 ?auto_369720 )
      ( MAKE-14PILE ?auto_369714 ?auto_369715 ?auto_369716 ?auto_369717 ?auto_369718 ?auto_369719 ?auto_369720 ?auto_369721 ?auto_369722 ?auto_369723 ?auto_369724 ?auto_369725 ?auto_369726 ?auto_369727 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_369772 - BLOCK
      ?auto_369773 - BLOCK
      ?auto_369774 - BLOCK
      ?auto_369775 - BLOCK
      ?auto_369776 - BLOCK
      ?auto_369777 - BLOCK
      ?auto_369778 - BLOCK
      ?auto_369779 - BLOCK
      ?auto_369780 - BLOCK
      ?auto_369781 - BLOCK
      ?auto_369782 - BLOCK
      ?auto_369783 - BLOCK
      ?auto_369784 - BLOCK
      ?auto_369785 - BLOCK
    )
    :vars
    (
      ?auto_369786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_369785 ?auto_369786 ) ( ON-TABLE ?auto_369772 ) ( ON ?auto_369773 ?auto_369772 ) ( ON ?auto_369774 ?auto_369773 ) ( ON ?auto_369775 ?auto_369774 ) ( ON ?auto_369776 ?auto_369775 ) ( not ( = ?auto_369772 ?auto_369773 ) ) ( not ( = ?auto_369772 ?auto_369774 ) ) ( not ( = ?auto_369772 ?auto_369775 ) ) ( not ( = ?auto_369772 ?auto_369776 ) ) ( not ( = ?auto_369772 ?auto_369777 ) ) ( not ( = ?auto_369772 ?auto_369778 ) ) ( not ( = ?auto_369772 ?auto_369779 ) ) ( not ( = ?auto_369772 ?auto_369780 ) ) ( not ( = ?auto_369772 ?auto_369781 ) ) ( not ( = ?auto_369772 ?auto_369782 ) ) ( not ( = ?auto_369772 ?auto_369783 ) ) ( not ( = ?auto_369772 ?auto_369784 ) ) ( not ( = ?auto_369772 ?auto_369785 ) ) ( not ( = ?auto_369772 ?auto_369786 ) ) ( not ( = ?auto_369773 ?auto_369774 ) ) ( not ( = ?auto_369773 ?auto_369775 ) ) ( not ( = ?auto_369773 ?auto_369776 ) ) ( not ( = ?auto_369773 ?auto_369777 ) ) ( not ( = ?auto_369773 ?auto_369778 ) ) ( not ( = ?auto_369773 ?auto_369779 ) ) ( not ( = ?auto_369773 ?auto_369780 ) ) ( not ( = ?auto_369773 ?auto_369781 ) ) ( not ( = ?auto_369773 ?auto_369782 ) ) ( not ( = ?auto_369773 ?auto_369783 ) ) ( not ( = ?auto_369773 ?auto_369784 ) ) ( not ( = ?auto_369773 ?auto_369785 ) ) ( not ( = ?auto_369773 ?auto_369786 ) ) ( not ( = ?auto_369774 ?auto_369775 ) ) ( not ( = ?auto_369774 ?auto_369776 ) ) ( not ( = ?auto_369774 ?auto_369777 ) ) ( not ( = ?auto_369774 ?auto_369778 ) ) ( not ( = ?auto_369774 ?auto_369779 ) ) ( not ( = ?auto_369774 ?auto_369780 ) ) ( not ( = ?auto_369774 ?auto_369781 ) ) ( not ( = ?auto_369774 ?auto_369782 ) ) ( not ( = ?auto_369774 ?auto_369783 ) ) ( not ( = ?auto_369774 ?auto_369784 ) ) ( not ( = ?auto_369774 ?auto_369785 ) ) ( not ( = ?auto_369774 ?auto_369786 ) ) ( not ( = ?auto_369775 ?auto_369776 ) ) ( not ( = ?auto_369775 ?auto_369777 ) ) ( not ( = ?auto_369775 ?auto_369778 ) ) ( not ( = ?auto_369775 ?auto_369779 ) ) ( not ( = ?auto_369775 ?auto_369780 ) ) ( not ( = ?auto_369775 ?auto_369781 ) ) ( not ( = ?auto_369775 ?auto_369782 ) ) ( not ( = ?auto_369775 ?auto_369783 ) ) ( not ( = ?auto_369775 ?auto_369784 ) ) ( not ( = ?auto_369775 ?auto_369785 ) ) ( not ( = ?auto_369775 ?auto_369786 ) ) ( not ( = ?auto_369776 ?auto_369777 ) ) ( not ( = ?auto_369776 ?auto_369778 ) ) ( not ( = ?auto_369776 ?auto_369779 ) ) ( not ( = ?auto_369776 ?auto_369780 ) ) ( not ( = ?auto_369776 ?auto_369781 ) ) ( not ( = ?auto_369776 ?auto_369782 ) ) ( not ( = ?auto_369776 ?auto_369783 ) ) ( not ( = ?auto_369776 ?auto_369784 ) ) ( not ( = ?auto_369776 ?auto_369785 ) ) ( not ( = ?auto_369776 ?auto_369786 ) ) ( not ( = ?auto_369777 ?auto_369778 ) ) ( not ( = ?auto_369777 ?auto_369779 ) ) ( not ( = ?auto_369777 ?auto_369780 ) ) ( not ( = ?auto_369777 ?auto_369781 ) ) ( not ( = ?auto_369777 ?auto_369782 ) ) ( not ( = ?auto_369777 ?auto_369783 ) ) ( not ( = ?auto_369777 ?auto_369784 ) ) ( not ( = ?auto_369777 ?auto_369785 ) ) ( not ( = ?auto_369777 ?auto_369786 ) ) ( not ( = ?auto_369778 ?auto_369779 ) ) ( not ( = ?auto_369778 ?auto_369780 ) ) ( not ( = ?auto_369778 ?auto_369781 ) ) ( not ( = ?auto_369778 ?auto_369782 ) ) ( not ( = ?auto_369778 ?auto_369783 ) ) ( not ( = ?auto_369778 ?auto_369784 ) ) ( not ( = ?auto_369778 ?auto_369785 ) ) ( not ( = ?auto_369778 ?auto_369786 ) ) ( not ( = ?auto_369779 ?auto_369780 ) ) ( not ( = ?auto_369779 ?auto_369781 ) ) ( not ( = ?auto_369779 ?auto_369782 ) ) ( not ( = ?auto_369779 ?auto_369783 ) ) ( not ( = ?auto_369779 ?auto_369784 ) ) ( not ( = ?auto_369779 ?auto_369785 ) ) ( not ( = ?auto_369779 ?auto_369786 ) ) ( not ( = ?auto_369780 ?auto_369781 ) ) ( not ( = ?auto_369780 ?auto_369782 ) ) ( not ( = ?auto_369780 ?auto_369783 ) ) ( not ( = ?auto_369780 ?auto_369784 ) ) ( not ( = ?auto_369780 ?auto_369785 ) ) ( not ( = ?auto_369780 ?auto_369786 ) ) ( not ( = ?auto_369781 ?auto_369782 ) ) ( not ( = ?auto_369781 ?auto_369783 ) ) ( not ( = ?auto_369781 ?auto_369784 ) ) ( not ( = ?auto_369781 ?auto_369785 ) ) ( not ( = ?auto_369781 ?auto_369786 ) ) ( not ( = ?auto_369782 ?auto_369783 ) ) ( not ( = ?auto_369782 ?auto_369784 ) ) ( not ( = ?auto_369782 ?auto_369785 ) ) ( not ( = ?auto_369782 ?auto_369786 ) ) ( not ( = ?auto_369783 ?auto_369784 ) ) ( not ( = ?auto_369783 ?auto_369785 ) ) ( not ( = ?auto_369783 ?auto_369786 ) ) ( not ( = ?auto_369784 ?auto_369785 ) ) ( not ( = ?auto_369784 ?auto_369786 ) ) ( not ( = ?auto_369785 ?auto_369786 ) ) ( ON ?auto_369784 ?auto_369785 ) ( ON ?auto_369783 ?auto_369784 ) ( ON ?auto_369782 ?auto_369783 ) ( ON ?auto_369781 ?auto_369782 ) ( ON ?auto_369780 ?auto_369781 ) ( ON ?auto_369779 ?auto_369780 ) ( ON ?auto_369778 ?auto_369779 ) ( CLEAR ?auto_369776 ) ( ON ?auto_369777 ?auto_369778 ) ( CLEAR ?auto_369777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_369772 ?auto_369773 ?auto_369774 ?auto_369775 ?auto_369776 ?auto_369777 )
      ( MAKE-14PILE ?auto_369772 ?auto_369773 ?auto_369774 ?auto_369775 ?auto_369776 ?auto_369777 ?auto_369778 ?auto_369779 ?auto_369780 ?auto_369781 ?auto_369782 ?auto_369783 ?auto_369784 ?auto_369785 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_369830 - BLOCK
      ?auto_369831 - BLOCK
      ?auto_369832 - BLOCK
      ?auto_369833 - BLOCK
      ?auto_369834 - BLOCK
      ?auto_369835 - BLOCK
      ?auto_369836 - BLOCK
      ?auto_369837 - BLOCK
      ?auto_369838 - BLOCK
      ?auto_369839 - BLOCK
      ?auto_369840 - BLOCK
      ?auto_369841 - BLOCK
      ?auto_369842 - BLOCK
      ?auto_369843 - BLOCK
    )
    :vars
    (
      ?auto_369844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_369843 ?auto_369844 ) ( ON-TABLE ?auto_369830 ) ( ON ?auto_369831 ?auto_369830 ) ( ON ?auto_369832 ?auto_369831 ) ( ON ?auto_369833 ?auto_369832 ) ( not ( = ?auto_369830 ?auto_369831 ) ) ( not ( = ?auto_369830 ?auto_369832 ) ) ( not ( = ?auto_369830 ?auto_369833 ) ) ( not ( = ?auto_369830 ?auto_369834 ) ) ( not ( = ?auto_369830 ?auto_369835 ) ) ( not ( = ?auto_369830 ?auto_369836 ) ) ( not ( = ?auto_369830 ?auto_369837 ) ) ( not ( = ?auto_369830 ?auto_369838 ) ) ( not ( = ?auto_369830 ?auto_369839 ) ) ( not ( = ?auto_369830 ?auto_369840 ) ) ( not ( = ?auto_369830 ?auto_369841 ) ) ( not ( = ?auto_369830 ?auto_369842 ) ) ( not ( = ?auto_369830 ?auto_369843 ) ) ( not ( = ?auto_369830 ?auto_369844 ) ) ( not ( = ?auto_369831 ?auto_369832 ) ) ( not ( = ?auto_369831 ?auto_369833 ) ) ( not ( = ?auto_369831 ?auto_369834 ) ) ( not ( = ?auto_369831 ?auto_369835 ) ) ( not ( = ?auto_369831 ?auto_369836 ) ) ( not ( = ?auto_369831 ?auto_369837 ) ) ( not ( = ?auto_369831 ?auto_369838 ) ) ( not ( = ?auto_369831 ?auto_369839 ) ) ( not ( = ?auto_369831 ?auto_369840 ) ) ( not ( = ?auto_369831 ?auto_369841 ) ) ( not ( = ?auto_369831 ?auto_369842 ) ) ( not ( = ?auto_369831 ?auto_369843 ) ) ( not ( = ?auto_369831 ?auto_369844 ) ) ( not ( = ?auto_369832 ?auto_369833 ) ) ( not ( = ?auto_369832 ?auto_369834 ) ) ( not ( = ?auto_369832 ?auto_369835 ) ) ( not ( = ?auto_369832 ?auto_369836 ) ) ( not ( = ?auto_369832 ?auto_369837 ) ) ( not ( = ?auto_369832 ?auto_369838 ) ) ( not ( = ?auto_369832 ?auto_369839 ) ) ( not ( = ?auto_369832 ?auto_369840 ) ) ( not ( = ?auto_369832 ?auto_369841 ) ) ( not ( = ?auto_369832 ?auto_369842 ) ) ( not ( = ?auto_369832 ?auto_369843 ) ) ( not ( = ?auto_369832 ?auto_369844 ) ) ( not ( = ?auto_369833 ?auto_369834 ) ) ( not ( = ?auto_369833 ?auto_369835 ) ) ( not ( = ?auto_369833 ?auto_369836 ) ) ( not ( = ?auto_369833 ?auto_369837 ) ) ( not ( = ?auto_369833 ?auto_369838 ) ) ( not ( = ?auto_369833 ?auto_369839 ) ) ( not ( = ?auto_369833 ?auto_369840 ) ) ( not ( = ?auto_369833 ?auto_369841 ) ) ( not ( = ?auto_369833 ?auto_369842 ) ) ( not ( = ?auto_369833 ?auto_369843 ) ) ( not ( = ?auto_369833 ?auto_369844 ) ) ( not ( = ?auto_369834 ?auto_369835 ) ) ( not ( = ?auto_369834 ?auto_369836 ) ) ( not ( = ?auto_369834 ?auto_369837 ) ) ( not ( = ?auto_369834 ?auto_369838 ) ) ( not ( = ?auto_369834 ?auto_369839 ) ) ( not ( = ?auto_369834 ?auto_369840 ) ) ( not ( = ?auto_369834 ?auto_369841 ) ) ( not ( = ?auto_369834 ?auto_369842 ) ) ( not ( = ?auto_369834 ?auto_369843 ) ) ( not ( = ?auto_369834 ?auto_369844 ) ) ( not ( = ?auto_369835 ?auto_369836 ) ) ( not ( = ?auto_369835 ?auto_369837 ) ) ( not ( = ?auto_369835 ?auto_369838 ) ) ( not ( = ?auto_369835 ?auto_369839 ) ) ( not ( = ?auto_369835 ?auto_369840 ) ) ( not ( = ?auto_369835 ?auto_369841 ) ) ( not ( = ?auto_369835 ?auto_369842 ) ) ( not ( = ?auto_369835 ?auto_369843 ) ) ( not ( = ?auto_369835 ?auto_369844 ) ) ( not ( = ?auto_369836 ?auto_369837 ) ) ( not ( = ?auto_369836 ?auto_369838 ) ) ( not ( = ?auto_369836 ?auto_369839 ) ) ( not ( = ?auto_369836 ?auto_369840 ) ) ( not ( = ?auto_369836 ?auto_369841 ) ) ( not ( = ?auto_369836 ?auto_369842 ) ) ( not ( = ?auto_369836 ?auto_369843 ) ) ( not ( = ?auto_369836 ?auto_369844 ) ) ( not ( = ?auto_369837 ?auto_369838 ) ) ( not ( = ?auto_369837 ?auto_369839 ) ) ( not ( = ?auto_369837 ?auto_369840 ) ) ( not ( = ?auto_369837 ?auto_369841 ) ) ( not ( = ?auto_369837 ?auto_369842 ) ) ( not ( = ?auto_369837 ?auto_369843 ) ) ( not ( = ?auto_369837 ?auto_369844 ) ) ( not ( = ?auto_369838 ?auto_369839 ) ) ( not ( = ?auto_369838 ?auto_369840 ) ) ( not ( = ?auto_369838 ?auto_369841 ) ) ( not ( = ?auto_369838 ?auto_369842 ) ) ( not ( = ?auto_369838 ?auto_369843 ) ) ( not ( = ?auto_369838 ?auto_369844 ) ) ( not ( = ?auto_369839 ?auto_369840 ) ) ( not ( = ?auto_369839 ?auto_369841 ) ) ( not ( = ?auto_369839 ?auto_369842 ) ) ( not ( = ?auto_369839 ?auto_369843 ) ) ( not ( = ?auto_369839 ?auto_369844 ) ) ( not ( = ?auto_369840 ?auto_369841 ) ) ( not ( = ?auto_369840 ?auto_369842 ) ) ( not ( = ?auto_369840 ?auto_369843 ) ) ( not ( = ?auto_369840 ?auto_369844 ) ) ( not ( = ?auto_369841 ?auto_369842 ) ) ( not ( = ?auto_369841 ?auto_369843 ) ) ( not ( = ?auto_369841 ?auto_369844 ) ) ( not ( = ?auto_369842 ?auto_369843 ) ) ( not ( = ?auto_369842 ?auto_369844 ) ) ( not ( = ?auto_369843 ?auto_369844 ) ) ( ON ?auto_369842 ?auto_369843 ) ( ON ?auto_369841 ?auto_369842 ) ( ON ?auto_369840 ?auto_369841 ) ( ON ?auto_369839 ?auto_369840 ) ( ON ?auto_369838 ?auto_369839 ) ( ON ?auto_369837 ?auto_369838 ) ( ON ?auto_369836 ?auto_369837 ) ( ON ?auto_369835 ?auto_369836 ) ( CLEAR ?auto_369833 ) ( ON ?auto_369834 ?auto_369835 ) ( CLEAR ?auto_369834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_369830 ?auto_369831 ?auto_369832 ?auto_369833 ?auto_369834 )
      ( MAKE-14PILE ?auto_369830 ?auto_369831 ?auto_369832 ?auto_369833 ?auto_369834 ?auto_369835 ?auto_369836 ?auto_369837 ?auto_369838 ?auto_369839 ?auto_369840 ?auto_369841 ?auto_369842 ?auto_369843 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_369888 - BLOCK
      ?auto_369889 - BLOCK
      ?auto_369890 - BLOCK
      ?auto_369891 - BLOCK
      ?auto_369892 - BLOCK
      ?auto_369893 - BLOCK
      ?auto_369894 - BLOCK
      ?auto_369895 - BLOCK
      ?auto_369896 - BLOCK
      ?auto_369897 - BLOCK
      ?auto_369898 - BLOCK
      ?auto_369899 - BLOCK
      ?auto_369900 - BLOCK
      ?auto_369901 - BLOCK
    )
    :vars
    (
      ?auto_369902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_369901 ?auto_369902 ) ( ON-TABLE ?auto_369888 ) ( ON ?auto_369889 ?auto_369888 ) ( ON ?auto_369890 ?auto_369889 ) ( not ( = ?auto_369888 ?auto_369889 ) ) ( not ( = ?auto_369888 ?auto_369890 ) ) ( not ( = ?auto_369888 ?auto_369891 ) ) ( not ( = ?auto_369888 ?auto_369892 ) ) ( not ( = ?auto_369888 ?auto_369893 ) ) ( not ( = ?auto_369888 ?auto_369894 ) ) ( not ( = ?auto_369888 ?auto_369895 ) ) ( not ( = ?auto_369888 ?auto_369896 ) ) ( not ( = ?auto_369888 ?auto_369897 ) ) ( not ( = ?auto_369888 ?auto_369898 ) ) ( not ( = ?auto_369888 ?auto_369899 ) ) ( not ( = ?auto_369888 ?auto_369900 ) ) ( not ( = ?auto_369888 ?auto_369901 ) ) ( not ( = ?auto_369888 ?auto_369902 ) ) ( not ( = ?auto_369889 ?auto_369890 ) ) ( not ( = ?auto_369889 ?auto_369891 ) ) ( not ( = ?auto_369889 ?auto_369892 ) ) ( not ( = ?auto_369889 ?auto_369893 ) ) ( not ( = ?auto_369889 ?auto_369894 ) ) ( not ( = ?auto_369889 ?auto_369895 ) ) ( not ( = ?auto_369889 ?auto_369896 ) ) ( not ( = ?auto_369889 ?auto_369897 ) ) ( not ( = ?auto_369889 ?auto_369898 ) ) ( not ( = ?auto_369889 ?auto_369899 ) ) ( not ( = ?auto_369889 ?auto_369900 ) ) ( not ( = ?auto_369889 ?auto_369901 ) ) ( not ( = ?auto_369889 ?auto_369902 ) ) ( not ( = ?auto_369890 ?auto_369891 ) ) ( not ( = ?auto_369890 ?auto_369892 ) ) ( not ( = ?auto_369890 ?auto_369893 ) ) ( not ( = ?auto_369890 ?auto_369894 ) ) ( not ( = ?auto_369890 ?auto_369895 ) ) ( not ( = ?auto_369890 ?auto_369896 ) ) ( not ( = ?auto_369890 ?auto_369897 ) ) ( not ( = ?auto_369890 ?auto_369898 ) ) ( not ( = ?auto_369890 ?auto_369899 ) ) ( not ( = ?auto_369890 ?auto_369900 ) ) ( not ( = ?auto_369890 ?auto_369901 ) ) ( not ( = ?auto_369890 ?auto_369902 ) ) ( not ( = ?auto_369891 ?auto_369892 ) ) ( not ( = ?auto_369891 ?auto_369893 ) ) ( not ( = ?auto_369891 ?auto_369894 ) ) ( not ( = ?auto_369891 ?auto_369895 ) ) ( not ( = ?auto_369891 ?auto_369896 ) ) ( not ( = ?auto_369891 ?auto_369897 ) ) ( not ( = ?auto_369891 ?auto_369898 ) ) ( not ( = ?auto_369891 ?auto_369899 ) ) ( not ( = ?auto_369891 ?auto_369900 ) ) ( not ( = ?auto_369891 ?auto_369901 ) ) ( not ( = ?auto_369891 ?auto_369902 ) ) ( not ( = ?auto_369892 ?auto_369893 ) ) ( not ( = ?auto_369892 ?auto_369894 ) ) ( not ( = ?auto_369892 ?auto_369895 ) ) ( not ( = ?auto_369892 ?auto_369896 ) ) ( not ( = ?auto_369892 ?auto_369897 ) ) ( not ( = ?auto_369892 ?auto_369898 ) ) ( not ( = ?auto_369892 ?auto_369899 ) ) ( not ( = ?auto_369892 ?auto_369900 ) ) ( not ( = ?auto_369892 ?auto_369901 ) ) ( not ( = ?auto_369892 ?auto_369902 ) ) ( not ( = ?auto_369893 ?auto_369894 ) ) ( not ( = ?auto_369893 ?auto_369895 ) ) ( not ( = ?auto_369893 ?auto_369896 ) ) ( not ( = ?auto_369893 ?auto_369897 ) ) ( not ( = ?auto_369893 ?auto_369898 ) ) ( not ( = ?auto_369893 ?auto_369899 ) ) ( not ( = ?auto_369893 ?auto_369900 ) ) ( not ( = ?auto_369893 ?auto_369901 ) ) ( not ( = ?auto_369893 ?auto_369902 ) ) ( not ( = ?auto_369894 ?auto_369895 ) ) ( not ( = ?auto_369894 ?auto_369896 ) ) ( not ( = ?auto_369894 ?auto_369897 ) ) ( not ( = ?auto_369894 ?auto_369898 ) ) ( not ( = ?auto_369894 ?auto_369899 ) ) ( not ( = ?auto_369894 ?auto_369900 ) ) ( not ( = ?auto_369894 ?auto_369901 ) ) ( not ( = ?auto_369894 ?auto_369902 ) ) ( not ( = ?auto_369895 ?auto_369896 ) ) ( not ( = ?auto_369895 ?auto_369897 ) ) ( not ( = ?auto_369895 ?auto_369898 ) ) ( not ( = ?auto_369895 ?auto_369899 ) ) ( not ( = ?auto_369895 ?auto_369900 ) ) ( not ( = ?auto_369895 ?auto_369901 ) ) ( not ( = ?auto_369895 ?auto_369902 ) ) ( not ( = ?auto_369896 ?auto_369897 ) ) ( not ( = ?auto_369896 ?auto_369898 ) ) ( not ( = ?auto_369896 ?auto_369899 ) ) ( not ( = ?auto_369896 ?auto_369900 ) ) ( not ( = ?auto_369896 ?auto_369901 ) ) ( not ( = ?auto_369896 ?auto_369902 ) ) ( not ( = ?auto_369897 ?auto_369898 ) ) ( not ( = ?auto_369897 ?auto_369899 ) ) ( not ( = ?auto_369897 ?auto_369900 ) ) ( not ( = ?auto_369897 ?auto_369901 ) ) ( not ( = ?auto_369897 ?auto_369902 ) ) ( not ( = ?auto_369898 ?auto_369899 ) ) ( not ( = ?auto_369898 ?auto_369900 ) ) ( not ( = ?auto_369898 ?auto_369901 ) ) ( not ( = ?auto_369898 ?auto_369902 ) ) ( not ( = ?auto_369899 ?auto_369900 ) ) ( not ( = ?auto_369899 ?auto_369901 ) ) ( not ( = ?auto_369899 ?auto_369902 ) ) ( not ( = ?auto_369900 ?auto_369901 ) ) ( not ( = ?auto_369900 ?auto_369902 ) ) ( not ( = ?auto_369901 ?auto_369902 ) ) ( ON ?auto_369900 ?auto_369901 ) ( ON ?auto_369899 ?auto_369900 ) ( ON ?auto_369898 ?auto_369899 ) ( ON ?auto_369897 ?auto_369898 ) ( ON ?auto_369896 ?auto_369897 ) ( ON ?auto_369895 ?auto_369896 ) ( ON ?auto_369894 ?auto_369895 ) ( ON ?auto_369893 ?auto_369894 ) ( ON ?auto_369892 ?auto_369893 ) ( CLEAR ?auto_369890 ) ( ON ?auto_369891 ?auto_369892 ) ( CLEAR ?auto_369891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_369888 ?auto_369889 ?auto_369890 ?auto_369891 )
      ( MAKE-14PILE ?auto_369888 ?auto_369889 ?auto_369890 ?auto_369891 ?auto_369892 ?auto_369893 ?auto_369894 ?auto_369895 ?auto_369896 ?auto_369897 ?auto_369898 ?auto_369899 ?auto_369900 ?auto_369901 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_369946 - BLOCK
      ?auto_369947 - BLOCK
      ?auto_369948 - BLOCK
      ?auto_369949 - BLOCK
      ?auto_369950 - BLOCK
      ?auto_369951 - BLOCK
      ?auto_369952 - BLOCK
      ?auto_369953 - BLOCK
      ?auto_369954 - BLOCK
      ?auto_369955 - BLOCK
      ?auto_369956 - BLOCK
      ?auto_369957 - BLOCK
      ?auto_369958 - BLOCK
      ?auto_369959 - BLOCK
    )
    :vars
    (
      ?auto_369960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_369959 ?auto_369960 ) ( ON-TABLE ?auto_369946 ) ( ON ?auto_369947 ?auto_369946 ) ( not ( = ?auto_369946 ?auto_369947 ) ) ( not ( = ?auto_369946 ?auto_369948 ) ) ( not ( = ?auto_369946 ?auto_369949 ) ) ( not ( = ?auto_369946 ?auto_369950 ) ) ( not ( = ?auto_369946 ?auto_369951 ) ) ( not ( = ?auto_369946 ?auto_369952 ) ) ( not ( = ?auto_369946 ?auto_369953 ) ) ( not ( = ?auto_369946 ?auto_369954 ) ) ( not ( = ?auto_369946 ?auto_369955 ) ) ( not ( = ?auto_369946 ?auto_369956 ) ) ( not ( = ?auto_369946 ?auto_369957 ) ) ( not ( = ?auto_369946 ?auto_369958 ) ) ( not ( = ?auto_369946 ?auto_369959 ) ) ( not ( = ?auto_369946 ?auto_369960 ) ) ( not ( = ?auto_369947 ?auto_369948 ) ) ( not ( = ?auto_369947 ?auto_369949 ) ) ( not ( = ?auto_369947 ?auto_369950 ) ) ( not ( = ?auto_369947 ?auto_369951 ) ) ( not ( = ?auto_369947 ?auto_369952 ) ) ( not ( = ?auto_369947 ?auto_369953 ) ) ( not ( = ?auto_369947 ?auto_369954 ) ) ( not ( = ?auto_369947 ?auto_369955 ) ) ( not ( = ?auto_369947 ?auto_369956 ) ) ( not ( = ?auto_369947 ?auto_369957 ) ) ( not ( = ?auto_369947 ?auto_369958 ) ) ( not ( = ?auto_369947 ?auto_369959 ) ) ( not ( = ?auto_369947 ?auto_369960 ) ) ( not ( = ?auto_369948 ?auto_369949 ) ) ( not ( = ?auto_369948 ?auto_369950 ) ) ( not ( = ?auto_369948 ?auto_369951 ) ) ( not ( = ?auto_369948 ?auto_369952 ) ) ( not ( = ?auto_369948 ?auto_369953 ) ) ( not ( = ?auto_369948 ?auto_369954 ) ) ( not ( = ?auto_369948 ?auto_369955 ) ) ( not ( = ?auto_369948 ?auto_369956 ) ) ( not ( = ?auto_369948 ?auto_369957 ) ) ( not ( = ?auto_369948 ?auto_369958 ) ) ( not ( = ?auto_369948 ?auto_369959 ) ) ( not ( = ?auto_369948 ?auto_369960 ) ) ( not ( = ?auto_369949 ?auto_369950 ) ) ( not ( = ?auto_369949 ?auto_369951 ) ) ( not ( = ?auto_369949 ?auto_369952 ) ) ( not ( = ?auto_369949 ?auto_369953 ) ) ( not ( = ?auto_369949 ?auto_369954 ) ) ( not ( = ?auto_369949 ?auto_369955 ) ) ( not ( = ?auto_369949 ?auto_369956 ) ) ( not ( = ?auto_369949 ?auto_369957 ) ) ( not ( = ?auto_369949 ?auto_369958 ) ) ( not ( = ?auto_369949 ?auto_369959 ) ) ( not ( = ?auto_369949 ?auto_369960 ) ) ( not ( = ?auto_369950 ?auto_369951 ) ) ( not ( = ?auto_369950 ?auto_369952 ) ) ( not ( = ?auto_369950 ?auto_369953 ) ) ( not ( = ?auto_369950 ?auto_369954 ) ) ( not ( = ?auto_369950 ?auto_369955 ) ) ( not ( = ?auto_369950 ?auto_369956 ) ) ( not ( = ?auto_369950 ?auto_369957 ) ) ( not ( = ?auto_369950 ?auto_369958 ) ) ( not ( = ?auto_369950 ?auto_369959 ) ) ( not ( = ?auto_369950 ?auto_369960 ) ) ( not ( = ?auto_369951 ?auto_369952 ) ) ( not ( = ?auto_369951 ?auto_369953 ) ) ( not ( = ?auto_369951 ?auto_369954 ) ) ( not ( = ?auto_369951 ?auto_369955 ) ) ( not ( = ?auto_369951 ?auto_369956 ) ) ( not ( = ?auto_369951 ?auto_369957 ) ) ( not ( = ?auto_369951 ?auto_369958 ) ) ( not ( = ?auto_369951 ?auto_369959 ) ) ( not ( = ?auto_369951 ?auto_369960 ) ) ( not ( = ?auto_369952 ?auto_369953 ) ) ( not ( = ?auto_369952 ?auto_369954 ) ) ( not ( = ?auto_369952 ?auto_369955 ) ) ( not ( = ?auto_369952 ?auto_369956 ) ) ( not ( = ?auto_369952 ?auto_369957 ) ) ( not ( = ?auto_369952 ?auto_369958 ) ) ( not ( = ?auto_369952 ?auto_369959 ) ) ( not ( = ?auto_369952 ?auto_369960 ) ) ( not ( = ?auto_369953 ?auto_369954 ) ) ( not ( = ?auto_369953 ?auto_369955 ) ) ( not ( = ?auto_369953 ?auto_369956 ) ) ( not ( = ?auto_369953 ?auto_369957 ) ) ( not ( = ?auto_369953 ?auto_369958 ) ) ( not ( = ?auto_369953 ?auto_369959 ) ) ( not ( = ?auto_369953 ?auto_369960 ) ) ( not ( = ?auto_369954 ?auto_369955 ) ) ( not ( = ?auto_369954 ?auto_369956 ) ) ( not ( = ?auto_369954 ?auto_369957 ) ) ( not ( = ?auto_369954 ?auto_369958 ) ) ( not ( = ?auto_369954 ?auto_369959 ) ) ( not ( = ?auto_369954 ?auto_369960 ) ) ( not ( = ?auto_369955 ?auto_369956 ) ) ( not ( = ?auto_369955 ?auto_369957 ) ) ( not ( = ?auto_369955 ?auto_369958 ) ) ( not ( = ?auto_369955 ?auto_369959 ) ) ( not ( = ?auto_369955 ?auto_369960 ) ) ( not ( = ?auto_369956 ?auto_369957 ) ) ( not ( = ?auto_369956 ?auto_369958 ) ) ( not ( = ?auto_369956 ?auto_369959 ) ) ( not ( = ?auto_369956 ?auto_369960 ) ) ( not ( = ?auto_369957 ?auto_369958 ) ) ( not ( = ?auto_369957 ?auto_369959 ) ) ( not ( = ?auto_369957 ?auto_369960 ) ) ( not ( = ?auto_369958 ?auto_369959 ) ) ( not ( = ?auto_369958 ?auto_369960 ) ) ( not ( = ?auto_369959 ?auto_369960 ) ) ( ON ?auto_369958 ?auto_369959 ) ( ON ?auto_369957 ?auto_369958 ) ( ON ?auto_369956 ?auto_369957 ) ( ON ?auto_369955 ?auto_369956 ) ( ON ?auto_369954 ?auto_369955 ) ( ON ?auto_369953 ?auto_369954 ) ( ON ?auto_369952 ?auto_369953 ) ( ON ?auto_369951 ?auto_369952 ) ( ON ?auto_369950 ?auto_369951 ) ( ON ?auto_369949 ?auto_369950 ) ( CLEAR ?auto_369947 ) ( ON ?auto_369948 ?auto_369949 ) ( CLEAR ?auto_369948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_369946 ?auto_369947 ?auto_369948 )
      ( MAKE-14PILE ?auto_369946 ?auto_369947 ?auto_369948 ?auto_369949 ?auto_369950 ?auto_369951 ?auto_369952 ?auto_369953 ?auto_369954 ?auto_369955 ?auto_369956 ?auto_369957 ?auto_369958 ?auto_369959 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_370004 - BLOCK
      ?auto_370005 - BLOCK
      ?auto_370006 - BLOCK
      ?auto_370007 - BLOCK
      ?auto_370008 - BLOCK
      ?auto_370009 - BLOCK
      ?auto_370010 - BLOCK
      ?auto_370011 - BLOCK
      ?auto_370012 - BLOCK
      ?auto_370013 - BLOCK
      ?auto_370014 - BLOCK
      ?auto_370015 - BLOCK
      ?auto_370016 - BLOCK
      ?auto_370017 - BLOCK
    )
    :vars
    (
      ?auto_370018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_370017 ?auto_370018 ) ( ON-TABLE ?auto_370004 ) ( not ( = ?auto_370004 ?auto_370005 ) ) ( not ( = ?auto_370004 ?auto_370006 ) ) ( not ( = ?auto_370004 ?auto_370007 ) ) ( not ( = ?auto_370004 ?auto_370008 ) ) ( not ( = ?auto_370004 ?auto_370009 ) ) ( not ( = ?auto_370004 ?auto_370010 ) ) ( not ( = ?auto_370004 ?auto_370011 ) ) ( not ( = ?auto_370004 ?auto_370012 ) ) ( not ( = ?auto_370004 ?auto_370013 ) ) ( not ( = ?auto_370004 ?auto_370014 ) ) ( not ( = ?auto_370004 ?auto_370015 ) ) ( not ( = ?auto_370004 ?auto_370016 ) ) ( not ( = ?auto_370004 ?auto_370017 ) ) ( not ( = ?auto_370004 ?auto_370018 ) ) ( not ( = ?auto_370005 ?auto_370006 ) ) ( not ( = ?auto_370005 ?auto_370007 ) ) ( not ( = ?auto_370005 ?auto_370008 ) ) ( not ( = ?auto_370005 ?auto_370009 ) ) ( not ( = ?auto_370005 ?auto_370010 ) ) ( not ( = ?auto_370005 ?auto_370011 ) ) ( not ( = ?auto_370005 ?auto_370012 ) ) ( not ( = ?auto_370005 ?auto_370013 ) ) ( not ( = ?auto_370005 ?auto_370014 ) ) ( not ( = ?auto_370005 ?auto_370015 ) ) ( not ( = ?auto_370005 ?auto_370016 ) ) ( not ( = ?auto_370005 ?auto_370017 ) ) ( not ( = ?auto_370005 ?auto_370018 ) ) ( not ( = ?auto_370006 ?auto_370007 ) ) ( not ( = ?auto_370006 ?auto_370008 ) ) ( not ( = ?auto_370006 ?auto_370009 ) ) ( not ( = ?auto_370006 ?auto_370010 ) ) ( not ( = ?auto_370006 ?auto_370011 ) ) ( not ( = ?auto_370006 ?auto_370012 ) ) ( not ( = ?auto_370006 ?auto_370013 ) ) ( not ( = ?auto_370006 ?auto_370014 ) ) ( not ( = ?auto_370006 ?auto_370015 ) ) ( not ( = ?auto_370006 ?auto_370016 ) ) ( not ( = ?auto_370006 ?auto_370017 ) ) ( not ( = ?auto_370006 ?auto_370018 ) ) ( not ( = ?auto_370007 ?auto_370008 ) ) ( not ( = ?auto_370007 ?auto_370009 ) ) ( not ( = ?auto_370007 ?auto_370010 ) ) ( not ( = ?auto_370007 ?auto_370011 ) ) ( not ( = ?auto_370007 ?auto_370012 ) ) ( not ( = ?auto_370007 ?auto_370013 ) ) ( not ( = ?auto_370007 ?auto_370014 ) ) ( not ( = ?auto_370007 ?auto_370015 ) ) ( not ( = ?auto_370007 ?auto_370016 ) ) ( not ( = ?auto_370007 ?auto_370017 ) ) ( not ( = ?auto_370007 ?auto_370018 ) ) ( not ( = ?auto_370008 ?auto_370009 ) ) ( not ( = ?auto_370008 ?auto_370010 ) ) ( not ( = ?auto_370008 ?auto_370011 ) ) ( not ( = ?auto_370008 ?auto_370012 ) ) ( not ( = ?auto_370008 ?auto_370013 ) ) ( not ( = ?auto_370008 ?auto_370014 ) ) ( not ( = ?auto_370008 ?auto_370015 ) ) ( not ( = ?auto_370008 ?auto_370016 ) ) ( not ( = ?auto_370008 ?auto_370017 ) ) ( not ( = ?auto_370008 ?auto_370018 ) ) ( not ( = ?auto_370009 ?auto_370010 ) ) ( not ( = ?auto_370009 ?auto_370011 ) ) ( not ( = ?auto_370009 ?auto_370012 ) ) ( not ( = ?auto_370009 ?auto_370013 ) ) ( not ( = ?auto_370009 ?auto_370014 ) ) ( not ( = ?auto_370009 ?auto_370015 ) ) ( not ( = ?auto_370009 ?auto_370016 ) ) ( not ( = ?auto_370009 ?auto_370017 ) ) ( not ( = ?auto_370009 ?auto_370018 ) ) ( not ( = ?auto_370010 ?auto_370011 ) ) ( not ( = ?auto_370010 ?auto_370012 ) ) ( not ( = ?auto_370010 ?auto_370013 ) ) ( not ( = ?auto_370010 ?auto_370014 ) ) ( not ( = ?auto_370010 ?auto_370015 ) ) ( not ( = ?auto_370010 ?auto_370016 ) ) ( not ( = ?auto_370010 ?auto_370017 ) ) ( not ( = ?auto_370010 ?auto_370018 ) ) ( not ( = ?auto_370011 ?auto_370012 ) ) ( not ( = ?auto_370011 ?auto_370013 ) ) ( not ( = ?auto_370011 ?auto_370014 ) ) ( not ( = ?auto_370011 ?auto_370015 ) ) ( not ( = ?auto_370011 ?auto_370016 ) ) ( not ( = ?auto_370011 ?auto_370017 ) ) ( not ( = ?auto_370011 ?auto_370018 ) ) ( not ( = ?auto_370012 ?auto_370013 ) ) ( not ( = ?auto_370012 ?auto_370014 ) ) ( not ( = ?auto_370012 ?auto_370015 ) ) ( not ( = ?auto_370012 ?auto_370016 ) ) ( not ( = ?auto_370012 ?auto_370017 ) ) ( not ( = ?auto_370012 ?auto_370018 ) ) ( not ( = ?auto_370013 ?auto_370014 ) ) ( not ( = ?auto_370013 ?auto_370015 ) ) ( not ( = ?auto_370013 ?auto_370016 ) ) ( not ( = ?auto_370013 ?auto_370017 ) ) ( not ( = ?auto_370013 ?auto_370018 ) ) ( not ( = ?auto_370014 ?auto_370015 ) ) ( not ( = ?auto_370014 ?auto_370016 ) ) ( not ( = ?auto_370014 ?auto_370017 ) ) ( not ( = ?auto_370014 ?auto_370018 ) ) ( not ( = ?auto_370015 ?auto_370016 ) ) ( not ( = ?auto_370015 ?auto_370017 ) ) ( not ( = ?auto_370015 ?auto_370018 ) ) ( not ( = ?auto_370016 ?auto_370017 ) ) ( not ( = ?auto_370016 ?auto_370018 ) ) ( not ( = ?auto_370017 ?auto_370018 ) ) ( ON ?auto_370016 ?auto_370017 ) ( ON ?auto_370015 ?auto_370016 ) ( ON ?auto_370014 ?auto_370015 ) ( ON ?auto_370013 ?auto_370014 ) ( ON ?auto_370012 ?auto_370013 ) ( ON ?auto_370011 ?auto_370012 ) ( ON ?auto_370010 ?auto_370011 ) ( ON ?auto_370009 ?auto_370010 ) ( ON ?auto_370008 ?auto_370009 ) ( ON ?auto_370007 ?auto_370008 ) ( ON ?auto_370006 ?auto_370007 ) ( CLEAR ?auto_370004 ) ( ON ?auto_370005 ?auto_370006 ) ( CLEAR ?auto_370005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_370004 ?auto_370005 )
      ( MAKE-14PILE ?auto_370004 ?auto_370005 ?auto_370006 ?auto_370007 ?auto_370008 ?auto_370009 ?auto_370010 ?auto_370011 ?auto_370012 ?auto_370013 ?auto_370014 ?auto_370015 ?auto_370016 ?auto_370017 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_370062 - BLOCK
      ?auto_370063 - BLOCK
      ?auto_370064 - BLOCK
      ?auto_370065 - BLOCK
      ?auto_370066 - BLOCK
      ?auto_370067 - BLOCK
      ?auto_370068 - BLOCK
      ?auto_370069 - BLOCK
      ?auto_370070 - BLOCK
      ?auto_370071 - BLOCK
      ?auto_370072 - BLOCK
      ?auto_370073 - BLOCK
      ?auto_370074 - BLOCK
      ?auto_370075 - BLOCK
    )
    :vars
    (
      ?auto_370076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_370075 ?auto_370076 ) ( not ( = ?auto_370062 ?auto_370063 ) ) ( not ( = ?auto_370062 ?auto_370064 ) ) ( not ( = ?auto_370062 ?auto_370065 ) ) ( not ( = ?auto_370062 ?auto_370066 ) ) ( not ( = ?auto_370062 ?auto_370067 ) ) ( not ( = ?auto_370062 ?auto_370068 ) ) ( not ( = ?auto_370062 ?auto_370069 ) ) ( not ( = ?auto_370062 ?auto_370070 ) ) ( not ( = ?auto_370062 ?auto_370071 ) ) ( not ( = ?auto_370062 ?auto_370072 ) ) ( not ( = ?auto_370062 ?auto_370073 ) ) ( not ( = ?auto_370062 ?auto_370074 ) ) ( not ( = ?auto_370062 ?auto_370075 ) ) ( not ( = ?auto_370062 ?auto_370076 ) ) ( not ( = ?auto_370063 ?auto_370064 ) ) ( not ( = ?auto_370063 ?auto_370065 ) ) ( not ( = ?auto_370063 ?auto_370066 ) ) ( not ( = ?auto_370063 ?auto_370067 ) ) ( not ( = ?auto_370063 ?auto_370068 ) ) ( not ( = ?auto_370063 ?auto_370069 ) ) ( not ( = ?auto_370063 ?auto_370070 ) ) ( not ( = ?auto_370063 ?auto_370071 ) ) ( not ( = ?auto_370063 ?auto_370072 ) ) ( not ( = ?auto_370063 ?auto_370073 ) ) ( not ( = ?auto_370063 ?auto_370074 ) ) ( not ( = ?auto_370063 ?auto_370075 ) ) ( not ( = ?auto_370063 ?auto_370076 ) ) ( not ( = ?auto_370064 ?auto_370065 ) ) ( not ( = ?auto_370064 ?auto_370066 ) ) ( not ( = ?auto_370064 ?auto_370067 ) ) ( not ( = ?auto_370064 ?auto_370068 ) ) ( not ( = ?auto_370064 ?auto_370069 ) ) ( not ( = ?auto_370064 ?auto_370070 ) ) ( not ( = ?auto_370064 ?auto_370071 ) ) ( not ( = ?auto_370064 ?auto_370072 ) ) ( not ( = ?auto_370064 ?auto_370073 ) ) ( not ( = ?auto_370064 ?auto_370074 ) ) ( not ( = ?auto_370064 ?auto_370075 ) ) ( not ( = ?auto_370064 ?auto_370076 ) ) ( not ( = ?auto_370065 ?auto_370066 ) ) ( not ( = ?auto_370065 ?auto_370067 ) ) ( not ( = ?auto_370065 ?auto_370068 ) ) ( not ( = ?auto_370065 ?auto_370069 ) ) ( not ( = ?auto_370065 ?auto_370070 ) ) ( not ( = ?auto_370065 ?auto_370071 ) ) ( not ( = ?auto_370065 ?auto_370072 ) ) ( not ( = ?auto_370065 ?auto_370073 ) ) ( not ( = ?auto_370065 ?auto_370074 ) ) ( not ( = ?auto_370065 ?auto_370075 ) ) ( not ( = ?auto_370065 ?auto_370076 ) ) ( not ( = ?auto_370066 ?auto_370067 ) ) ( not ( = ?auto_370066 ?auto_370068 ) ) ( not ( = ?auto_370066 ?auto_370069 ) ) ( not ( = ?auto_370066 ?auto_370070 ) ) ( not ( = ?auto_370066 ?auto_370071 ) ) ( not ( = ?auto_370066 ?auto_370072 ) ) ( not ( = ?auto_370066 ?auto_370073 ) ) ( not ( = ?auto_370066 ?auto_370074 ) ) ( not ( = ?auto_370066 ?auto_370075 ) ) ( not ( = ?auto_370066 ?auto_370076 ) ) ( not ( = ?auto_370067 ?auto_370068 ) ) ( not ( = ?auto_370067 ?auto_370069 ) ) ( not ( = ?auto_370067 ?auto_370070 ) ) ( not ( = ?auto_370067 ?auto_370071 ) ) ( not ( = ?auto_370067 ?auto_370072 ) ) ( not ( = ?auto_370067 ?auto_370073 ) ) ( not ( = ?auto_370067 ?auto_370074 ) ) ( not ( = ?auto_370067 ?auto_370075 ) ) ( not ( = ?auto_370067 ?auto_370076 ) ) ( not ( = ?auto_370068 ?auto_370069 ) ) ( not ( = ?auto_370068 ?auto_370070 ) ) ( not ( = ?auto_370068 ?auto_370071 ) ) ( not ( = ?auto_370068 ?auto_370072 ) ) ( not ( = ?auto_370068 ?auto_370073 ) ) ( not ( = ?auto_370068 ?auto_370074 ) ) ( not ( = ?auto_370068 ?auto_370075 ) ) ( not ( = ?auto_370068 ?auto_370076 ) ) ( not ( = ?auto_370069 ?auto_370070 ) ) ( not ( = ?auto_370069 ?auto_370071 ) ) ( not ( = ?auto_370069 ?auto_370072 ) ) ( not ( = ?auto_370069 ?auto_370073 ) ) ( not ( = ?auto_370069 ?auto_370074 ) ) ( not ( = ?auto_370069 ?auto_370075 ) ) ( not ( = ?auto_370069 ?auto_370076 ) ) ( not ( = ?auto_370070 ?auto_370071 ) ) ( not ( = ?auto_370070 ?auto_370072 ) ) ( not ( = ?auto_370070 ?auto_370073 ) ) ( not ( = ?auto_370070 ?auto_370074 ) ) ( not ( = ?auto_370070 ?auto_370075 ) ) ( not ( = ?auto_370070 ?auto_370076 ) ) ( not ( = ?auto_370071 ?auto_370072 ) ) ( not ( = ?auto_370071 ?auto_370073 ) ) ( not ( = ?auto_370071 ?auto_370074 ) ) ( not ( = ?auto_370071 ?auto_370075 ) ) ( not ( = ?auto_370071 ?auto_370076 ) ) ( not ( = ?auto_370072 ?auto_370073 ) ) ( not ( = ?auto_370072 ?auto_370074 ) ) ( not ( = ?auto_370072 ?auto_370075 ) ) ( not ( = ?auto_370072 ?auto_370076 ) ) ( not ( = ?auto_370073 ?auto_370074 ) ) ( not ( = ?auto_370073 ?auto_370075 ) ) ( not ( = ?auto_370073 ?auto_370076 ) ) ( not ( = ?auto_370074 ?auto_370075 ) ) ( not ( = ?auto_370074 ?auto_370076 ) ) ( not ( = ?auto_370075 ?auto_370076 ) ) ( ON ?auto_370074 ?auto_370075 ) ( ON ?auto_370073 ?auto_370074 ) ( ON ?auto_370072 ?auto_370073 ) ( ON ?auto_370071 ?auto_370072 ) ( ON ?auto_370070 ?auto_370071 ) ( ON ?auto_370069 ?auto_370070 ) ( ON ?auto_370068 ?auto_370069 ) ( ON ?auto_370067 ?auto_370068 ) ( ON ?auto_370066 ?auto_370067 ) ( ON ?auto_370065 ?auto_370066 ) ( ON ?auto_370064 ?auto_370065 ) ( ON ?auto_370063 ?auto_370064 ) ( ON ?auto_370062 ?auto_370063 ) ( CLEAR ?auto_370062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_370062 )
      ( MAKE-14PILE ?auto_370062 ?auto_370063 ?auto_370064 ?auto_370065 ?auto_370066 ?auto_370067 ?auto_370068 ?auto_370069 ?auto_370070 ?auto_370071 ?auto_370072 ?auto_370073 ?auto_370074 ?auto_370075 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370121 - BLOCK
      ?auto_370122 - BLOCK
      ?auto_370123 - BLOCK
      ?auto_370124 - BLOCK
      ?auto_370125 - BLOCK
      ?auto_370126 - BLOCK
      ?auto_370127 - BLOCK
      ?auto_370128 - BLOCK
      ?auto_370129 - BLOCK
      ?auto_370130 - BLOCK
      ?auto_370131 - BLOCK
      ?auto_370132 - BLOCK
      ?auto_370133 - BLOCK
      ?auto_370134 - BLOCK
      ?auto_370135 - BLOCK
    )
    :vars
    (
      ?auto_370136 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_370134 ) ( ON ?auto_370135 ?auto_370136 ) ( CLEAR ?auto_370135 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_370121 ) ( ON ?auto_370122 ?auto_370121 ) ( ON ?auto_370123 ?auto_370122 ) ( ON ?auto_370124 ?auto_370123 ) ( ON ?auto_370125 ?auto_370124 ) ( ON ?auto_370126 ?auto_370125 ) ( ON ?auto_370127 ?auto_370126 ) ( ON ?auto_370128 ?auto_370127 ) ( ON ?auto_370129 ?auto_370128 ) ( ON ?auto_370130 ?auto_370129 ) ( ON ?auto_370131 ?auto_370130 ) ( ON ?auto_370132 ?auto_370131 ) ( ON ?auto_370133 ?auto_370132 ) ( ON ?auto_370134 ?auto_370133 ) ( not ( = ?auto_370121 ?auto_370122 ) ) ( not ( = ?auto_370121 ?auto_370123 ) ) ( not ( = ?auto_370121 ?auto_370124 ) ) ( not ( = ?auto_370121 ?auto_370125 ) ) ( not ( = ?auto_370121 ?auto_370126 ) ) ( not ( = ?auto_370121 ?auto_370127 ) ) ( not ( = ?auto_370121 ?auto_370128 ) ) ( not ( = ?auto_370121 ?auto_370129 ) ) ( not ( = ?auto_370121 ?auto_370130 ) ) ( not ( = ?auto_370121 ?auto_370131 ) ) ( not ( = ?auto_370121 ?auto_370132 ) ) ( not ( = ?auto_370121 ?auto_370133 ) ) ( not ( = ?auto_370121 ?auto_370134 ) ) ( not ( = ?auto_370121 ?auto_370135 ) ) ( not ( = ?auto_370121 ?auto_370136 ) ) ( not ( = ?auto_370122 ?auto_370123 ) ) ( not ( = ?auto_370122 ?auto_370124 ) ) ( not ( = ?auto_370122 ?auto_370125 ) ) ( not ( = ?auto_370122 ?auto_370126 ) ) ( not ( = ?auto_370122 ?auto_370127 ) ) ( not ( = ?auto_370122 ?auto_370128 ) ) ( not ( = ?auto_370122 ?auto_370129 ) ) ( not ( = ?auto_370122 ?auto_370130 ) ) ( not ( = ?auto_370122 ?auto_370131 ) ) ( not ( = ?auto_370122 ?auto_370132 ) ) ( not ( = ?auto_370122 ?auto_370133 ) ) ( not ( = ?auto_370122 ?auto_370134 ) ) ( not ( = ?auto_370122 ?auto_370135 ) ) ( not ( = ?auto_370122 ?auto_370136 ) ) ( not ( = ?auto_370123 ?auto_370124 ) ) ( not ( = ?auto_370123 ?auto_370125 ) ) ( not ( = ?auto_370123 ?auto_370126 ) ) ( not ( = ?auto_370123 ?auto_370127 ) ) ( not ( = ?auto_370123 ?auto_370128 ) ) ( not ( = ?auto_370123 ?auto_370129 ) ) ( not ( = ?auto_370123 ?auto_370130 ) ) ( not ( = ?auto_370123 ?auto_370131 ) ) ( not ( = ?auto_370123 ?auto_370132 ) ) ( not ( = ?auto_370123 ?auto_370133 ) ) ( not ( = ?auto_370123 ?auto_370134 ) ) ( not ( = ?auto_370123 ?auto_370135 ) ) ( not ( = ?auto_370123 ?auto_370136 ) ) ( not ( = ?auto_370124 ?auto_370125 ) ) ( not ( = ?auto_370124 ?auto_370126 ) ) ( not ( = ?auto_370124 ?auto_370127 ) ) ( not ( = ?auto_370124 ?auto_370128 ) ) ( not ( = ?auto_370124 ?auto_370129 ) ) ( not ( = ?auto_370124 ?auto_370130 ) ) ( not ( = ?auto_370124 ?auto_370131 ) ) ( not ( = ?auto_370124 ?auto_370132 ) ) ( not ( = ?auto_370124 ?auto_370133 ) ) ( not ( = ?auto_370124 ?auto_370134 ) ) ( not ( = ?auto_370124 ?auto_370135 ) ) ( not ( = ?auto_370124 ?auto_370136 ) ) ( not ( = ?auto_370125 ?auto_370126 ) ) ( not ( = ?auto_370125 ?auto_370127 ) ) ( not ( = ?auto_370125 ?auto_370128 ) ) ( not ( = ?auto_370125 ?auto_370129 ) ) ( not ( = ?auto_370125 ?auto_370130 ) ) ( not ( = ?auto_370125 ?auto_370131 ) ) ( not ( = ?auto_370125 ?auto_370132 ) ) ( not ( = ?auto_370125 ?auto_370133 ) ) ( not ( = ?auto_370125 ?auto_370134 ) ) ( not ( = ?auto_370125 ?auto_370135 ) ) ( not ( = ?auto_370125 ?auto_370136 ) ) ( not ( = ?auto_370126 ?auto_370127 ) ) ( not ( = ?auto_370126 ?auto_370128 ) ) ( not ( = ?auto_370126 ?auto_370129 ) ) ( not ( = ?auto_370126 ?auto_370130 ) ) ( not ( = ?auto_370126 ?auto_370131 ) ) ( not ( = ?auto_370126 ?auto_370132 ) ) ( not ( = ?auto_370126 ?auto_370133 ) ) ( not ( = ?auto_370126 ?auto_370134 ) ) ( not ( = ?auto_370126 ?auto_370135 ) ) ( not ( = ?auto_370126 ?auto_370136 ) ) ( not ( = ?auto_370127 ?auto_370128 ) ) ( not ( = ?auto_370127 ?auto_370129 ) ) ( not ( = ?auto_370127 ?auto_370130 ) ) ( not ( = ?auto_370127 ?auto_370131 ) ) ( not ( = ?auto_370127 ?auto_370132 ) ) ( not ( = ?auto_370127 ?auto_370133 ) ) ( not ( = ?auto_370127 ?auto_370134 ) ) ( not ( = ?auto_370127 ?auto_370135 ) ) ( not ( = ?auto_370127 ?auto_370136 ) ) ( not ( = ?auto_370128 ?auto_370129 ) ) ( not ( = ?auto_370128 ?auto_370130 ) ) ( not ( = ?auto_370128 ?auto_370131 ) ) ( not ( = ?auto_370128 ?auto_370132 ) ) ( not ( = ?auto_370128 ?auto_370133 ) ) ( not ( = ?auto_370128 ?auto_370134 ) ) ( not ( = ?auto_370128 ?auto_370135 ) ) ( not ( = ?auto_370128 ?auto_370136 ) ) ( not ( = ?auto_370129 ?auto_370130 ) ) ( not ( = ?auto_370129 ?auto_370131 ) ) ( not ( = ?auto_370129 ?auto_370132 ) ) ( not ( = ?auto_370129 ?auto_370133 ) ) ( not ( = ?auto_370129 ?auto_370134 ) ) ( not ( = ?auto_370129 ?auto_370135 ) ) ( not ( = ?auto_370129 ?auto_370136 ) ) ( not ( = ?auto_370130 ?auto_370131 ) ) ( not ( = ?auto_370130 ?auto_370132 ) ) ( not ( = ?auto_370130 ?auto_370133 ) ) ( not ( = ?auto_370130 ?auto_370134 ) ) ( not ( = ?auto_370130 ?auto_370135 ) ) ( not ( = ?auto_370130 ?auto_370136 ) ) ( not ( = ?auto_370131 ?auto_370132 ) ) ( not ( = ?auto_370131 ?auto_370133 ) ) ( not ( = ?auto_370131 ?auto_370134 ) ) ( not ( = ?auto_370131 ?auto_370135 ) ) ( not ( = ?auto_370131 ?auto_370136 ) ) ( not ( = ?auto_370132 ?auto_370133 ) ) ( not ( = ?auto_370132 ?auto_370134 ) ) ( not ( = ?auto_370132 ?auto_370135 ) ) ( not ( = ?auto_370132 ?auto_370136 ) ) ( not ( = ?auto_370133 ?auto_370134 ) ) ( not ( = ?auto_370133 ?auto_370135 ) ) ( not ( = ?auto_370133 ?auto_370136 ) ) ( not ( = ?auto_370134 ?auto_370135 ) ) ( not ( = ?auto_370134 ?auto_370136 ) ) ( not ( = ?auto_370135 ?auto_370136 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_370135 ?auto_370136 )
      ( !STACK ?auto_370135 ?auto_370134 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370152 - BLOCK
      ?auto_370153 - BLOCK
      ?auto_370154 - BLOCK
      ?auto_370155 - BLOCK
      ?auto_370156 - BLOCK
      ?auto_370157 - BLOCK
      ?auto_370158 - BLOCK
      ?auto_370159 - BLOCK
      ?auto_370160 - BLOCK
      ?auto_370161 - BLOCK
      ?auto_370162 - BLOCK
      ?auto_370163 - BLOCK
      ?auto_370164 - BLOCK
      ?auto_370165 - BLOCK
      ?auto_370166 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_370165 ) ( ON-TABLE ?auto_370166 ) ( CLEAR ?auto_370166 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_370152 ) ( ON ?auto_370153 ?auto_370152 ) ( ON ?auto_370154 ?auto_370153 ) ( ON ?auto_370155 ?auto_370154 ) ( ON ?auto_370156 ?auto_370155 ) ( ON ?auto_370157 ?auto_370156 ) ( ON ?auto_370158 ?auto_370157 ) ( ON ?auto_370159 ?auto_370158 ) ( ON ?auto_370160 ?auto_370159 ) ( ON ?auto_370161 ?auto_370160 ) ( ON ?auto_370162 ?auto_370161 ) ( ON ?auto_370163 ?auto_370162 ) ( ON ?auto_370164 ?auto_370163 ) ( ON ?auto_370165 ?auto_370164 ) ( not ( = ?auto_370152 ?auto_370153 ) ) ( not ( = ?auto_370152 ?auto_370154 ) ) ( not ( = ?auto_370152 ?auto_370155 ) ) ( not ( = ?auto_370152 ?auto_370156 ) ) ( not ( = ?auto_370152 ?auto_370157 ) ) ( not ( = ?auto_370152 ?auto_370158 ) ) ( not ( = ?auto_370152 ?auto_370159 ) ) ( not ( = ?auto_370152 ?auto_370160 ) ) ( not ( = ?auto_370152 ?auto_370161 ) ) ( not ( = ?auto_370152 ?auto_370162 ) ) ( not ( = ?auto_370152 ?auto_370163 ) ) ( not ( = ?auto_370152 ?auto_370164 ) ) ( not ( = ?auto_370152 ?auto_370165 ) ) ( not ( = ?auto_370152 ?auto_370166 ) ) ( not ( = ?auto_370153 ?auto_370154 ) ) ( not ( = ?auto_370153 ?auto_370155 ) ) ( not ( = ?auto_370153 ?auto_370156 ) ) ( not ( = ?auto_370153 ?auto_370157 ) ) ( not ( = ?auto_370153 ?auto_370158 ) ) ( not ( = ?auto_370153 ?auto_370159 ) ) ( not ( = ?auto_370153 ?auto_370160 ) ) ( not ( = ?auto_370153 ?auto_370161 ) ) ( not ( = ?auto_370153 ?auto_370162 ) ) ( not ( = ?auto_370153 ?auto_370163 ) ) ( not ( = ?auto_370153 ?auto_370164 ) ) ( not ( = ?auto_370153 ?auto_370165 ) ) ( not ( = ?auto_370153 ?auto_370166 ) ) ( not ( = ?auto_370154 ?auto_370155 ) ) ( not ( = ?auto_370154 ?auto_370156 ) ) ( not ( = ?auto_370154 ?auto_370157 ) ) ( not ( = ?auto_370154 ?auto_370158 ) ) ( not ( = ?auto_370154 ?auto_370159 ) ) ( not ( = ?auto_370154 ?auto_370160 ) ) ( not ( = ?auto_370154 ?auto_370161 ) ) ( not ( = ?auto_370154 ?auto_370162 ) ) ( not ( = ?auto_370154 ?auto_370163 ) ) ( not ( = ?auto_370154 ?auto_370164 ) ) ( not ( = ?auto_370154 ?auto_370165 ) ) ( not ( = ?auto_370154 ?auto_370166 ) ) ( not ( = ?auto_370155 ?auto_370156 ) ) ( not ( = ?auto_370155 ?auto_370157 ) ) ( not ( = ?auto_370155 ?auto_370158 ) ) ( not ( = ?auto_370155 ?auto_370159 ) ) ( not ( = ?auto_370155 ?auto_370160 ) ) ( not ( = ?auto_370155 ?auto_370161 ) ) ( not ( = ?auto_370155 ?auto_370162 ) ) ( not ( = ?auto_370155 ?auto_370163 ) ) ( not ( = ?auto_370155 ?auto_370164 ) ) ( not ( = ?auto_370155 ?auto_370165 ) ) ( not ( = ?auto_370155 ?auto_370166 ) ) ( not ( = ?auto_370156 ?auto_370157 ) ) ( not ( = ?auto_370156 ?auto_370158 ) ) ( not ( = ?auto_370156 ?auto_370159 ) ) ( not ( = ?auto_370156 ?auto_370160 ) ) ( not ( = ?auto_370156 ?auto_370161 ) ) ( not ( = ?auto_370156 ?auto_370162 ) ) ( not ( = ?auto_370156 ?auto_370163 ) ) ( not ( = ?auto_370156 ?auto_370164 ) ) ( not ( = ?auto_370156 ?auto_370165 ) ) ( not ( = ?auto_370156 ?auto_370166 ) ) ( not ( = ?auto_370157 ?auto_370158 ) ) ( not ( = ?auto_370157 ?auto_370159 ) ) ( not ( = ?auto_370157 ?auto_370160 ) ) ( not ( = ?auto_370157 ?auto_370161 ) ) ( not ( = ?auto_370157 ?auto_370162 ) ) ( not ( = ?auto_370157 ?auto_370163 ) ) ( not ( = ?auto_370157 ?auto_370164 ) ) ( not ( = ?auto_370157 ?auto_370165 ) ) ( not ( = ?auto_370157 ?auto_370166 ) ) ( not ( = ?auto_370158 ?auto_370159 ) ) ( not ( = ?auto_370158 ?auto_370160 ) ) ( not ( = ?auto_370158 ?auto_370161 ) ) ( not ( = ?auto_370158 ?auto_370162 ) ) ( not ( = ?auto_370158 ?auto_370163 ) ) ( not ( = ?auto_370158 ?auto_370164 ) ) ( not ( = ?auto_370158 ?auto_370165 ) ) ( not ( = ?auto_370158 ?auto_370166 ) ) ( not ( = ?auto_370159 ?auto_370160 ) ) ( not ( = ?auto_370159 ?auto_370161 ) ) ( not ( = ?auto_370159 ?auto_370162 ) ) ( not ( = ?auto_370159 ?auto_370163 ) ) ( not ( = ?auto_370159 ?auto_370164 ) ) ( not ( = ?auto_370159 ?auto_370165 ) ) ( not ( = ?auto_370159 ?auto_370166 ) ) ( not ( = ?auto_370160 ?auto_370161 ) ) ( not ( = ?auto_370160 ?auto_370162 ) ) ( not ( = ?auto_370160 ?auto_370163 ) ) ( not ( = ?auto_370160 ?auto_370164 ) ) ( not ( = ?auto_370160 ?auto_370165 ) ) ( not ( = ?auto_370160 ?auto_370166 ) ) ( not ( = ?auto_370161 ?auto_370162 ) ) ( not ( = ?auto_370161 ?auto_370163 ) ) ( not ( = ?auto_370161 ?auto_370164 ) ) ( not ( = ?auto_370161 ?auto_370165 ) ) ( not ( = ?auto_370161 ?auto_370166 ) ) ( not ( = ?auto_370162 ?auto_370163 ) ) ( not ( = ?auto_370162 ?auto_370164 ) ) ( not ( = ?auto_370162 ?auto_370165 ) ) ( not ( = ?auto_370162 ?auto_370166 ) ) ( not ( = ?auto_370163 ?auto_370164 ) ) ( not ( = ?auto_370163 ?auto_370165 ) ) ( not ( = ?auto_370163 ?auto_370166 ) ) ( not ( = ?auto_370164 ?auto_370165 ) ) ( not ( = ?auto_370164 ?auto_370166 ) ) ( not ( = ?auto_370165 ?auto_370166 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_370166 )
      ( !STACK ?auto_370166 ?auto_370165 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370182 - BLOCK
      ?auto_370183 - BLOCK
      ?auto_370184 - BLOCK
      ?auto_370185 - BLOCK
      ?auto_370186 - BLOCK
      ?auto_370187 - BLOCK
      ?auto_370188 - BLOCK
      ?auto_370189 - BLOCK
      ?auto_370190 - BLOCK
      ?auto_370191 - BLOCK
      ?auto_370192 - BLOCK
      ?auto_370193 - BLOCK
      ?auto_370194 - BLOCK
      ?auto_370195 - BLOCK
      ?auto_370196 - BLOCK
    )
    :vars
    (
      ?auto_370197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_370196 ?auto_370197 ) ( ON-TABLE ?auto_370182 ) ( ON ?auto_370183 ?auto_370182 ) ( ON ?auto_370184 ?auto_370183 ) ( ON ?auto_370185 ?auto_370184 ) ( ON ?auto_370186 ?auto_370185 ) ( ON ?auto_370187 ?auto_370186 ) ( ON ?auto_370188 ?auto_370187 ) ( ON ?auto_370189 ?auto_370188 ) ( ON ?auto_370190 ?auto_370189 ) ( ON ?auto_370191 ?auto_370190 ) ( ON ?auto_370192 ?auto_370191 ) ( ON ?auto_370193 ?auto_370192 ) ( ON ?auto_370194 ?auto_370193 ) ( not ( = ?auto_370182 ?auto_370183 ) ) ( not ( = ?auto_370182 ?auto_370184 ) ) ( not ( = ?auto_370182 ?auto_370185 ) ) ( not ( = ?auto_370182 ?auto_370186 ) ) ( not ( = ?auto_370182 ?auto_370187 ) ) ( not ( = ?auto_370182 ?auto_370188 ) ) ( not ( = ?auto_370182 ?auto_370189 ) ) ( not ( = ?auto_370182 ?auto_370190 ) ) ( not ( = ?auto_370182 ?auto_370191 ) ) ( not ( = ?auto_370182 ?auto_370192 ) ) ( not ( = ?auto_370182 ?auto_370193 ) ) ( not ( = ?auto_370182 ?auto_370194 ) ) ( not ( = ?auto_370182 ?auto_370195 ) ) ( not ( = ?auto_370182 ?auto_370196 ) ) ( not ( = ?auto_370182 ?auto_370197 ) ) ( not ( = ?auto_370183 ?auto_370184 ) ) ( not ( = ?auto_370183 ?auto_370185 ) ) ( not ( = ?auto_370183 ?auto_370186 ) ) ( not ( = ?auto_370183 ?auto_370187 ) ) ( not ( = ?auto_370183 ?auto_370188 ) ) ( not ( = ?auto_370183 ?auto_370189 ) ) ( not ( = ?auto_370183 ?auto_370190 ) ) ( not ( = ?auto_370183 ?auto_370191 ) ) ( not ( = ?auto_370183 ?auto_370192 ) ) ( not ( = ?auto_370183 ?auto_370193 ) ) ( not ( = ?auto_370183 ?auto_370194 ) ) ( not ( = ?auto_370183 ?auto_370195 ) ) ( not ( = ?auto_370183 ?auto_370196 ) ) ( not ( = ?auto_370183 ?auto_370197 ) ) ( not ( = ?auto_370184 ?auto_370185 ) ) ( not ( = ?auto_370184 ?auto_370186 ) ) ( not ( = ?auto_370184 ?auto_370187 ) ) ( not ( = ?auto_370184 ?auto_370188 ) ) ( not ( = ?auto_370184 ?auto_370189 ) ) ( not ( = ?auto_370184 ?auto_370190 ) ) ( not ( = ?auto_370184 ?auto_370191 ) ) ( not ( = ?auto_370184 ?auto_370192 ) ) ( not ( = ?auto_370184 ?auto_370193 ) ) ( not ( = ?auto_370184 ?auto_370194 ) ) ( not ( = ?auto_370184 ?auto_370195 ) ) ( not ( = ?auto_370184 ?auto_370196 ) ) ( not ( = ?auto_370184 ?auto_370197 ) ) ( not ( = ?auto_370185 ?auto_370186 ) ) ( not ( = ?auto_370185 ?auto_370187 ) ) ( not ( = ?auto_370185 ?auto_370188 ) ) ( not ( = ?auto_370185 ?auto_370189 ) ) ( not ( = ?auto_370185 ?auto_370190 ) ) ( not ( = ?auto_370185 ?auto_370191 ) ) ( not ( = ?auto_370185 ?auto_370192 ) ) ( not ( = ?auto_370185 ?auto_370193 ) ) ( not ( = ?auto_370185 ?auto_370194 ) ) ( not ( = ?auto_370185 ?auto_370195 ) ) ( not ( = ?auto_370185 ?auto_370196 ) ) ( not ( = ?auto_370185 ?auto_370197 ) ) ( not ( = ?auto_370186 ?auto_370187 ) ) ( not ( = ?auto_370186 ?auto_370188 ) ) ( not ( = ?auto_370186 ?auto_370189 ) ) ( not ( = ?auto_370186 ?auto_370190 ) ) ( not ( = ?auto_370186 ?auto_370191 ) ) ( not ( = ?auto_370186 ?auto_370192 ) ) ( not ( = ?auto_370186 ?auto_370193 ) ) ( not ( = ?auto_370186 ?auto_370194 ) ) ( not ( = ?auto_370186 ?auto_370195 ) ) ( not ( = ?auto_370186 ?auto_370196 ) ) ( not ( = ?auto_370186 ?auto_370197 ) ) ( not ( = ?auto_370187 ?auto_370188 ) ) ( not ( = ?auto_370187 ?auto_370189 ) ) ( not ( = ?auto_370187 ?auto_370190 ) ) ( not ( = ?auto_370187 ?auto_370191 ) ) ( not ( = ?auto_370187 ?auto_370192 ) ) ( not ( = ?auto_370187 ?auto_370193 ) ) ( not ( = ?auto_370187 ?auto_370194 ) ) ( not ( = ?auto_370187 ?auto_370195 ) ) ( not ( = ?auto_370187 ?auto_370196 ) ) ( not ( = ?auto_370187 ?auto_370197 ) ) ( not ( = ?auto_370188 ?auto_370189 ) ) ( not ( = ?auto_370188 ?auto_370190 ) ) ( not ( = ?auto_370188 ?auto_370191 ) ) ( not ( = ?auto_370188 ?auto_370192 ) ) ( not ( = ?auto_370188 ?auto_370193 ) ) ( not ( = ?auto_370188 ?auto_370194 ) ) ( not ( = ?auto_370188 ?auto_370195 ) ) ( not ( = ?auto_370188 ?auto_370196 ) ) ( not ( = ?auto_370188 ?auto_370197 ) ) ( not ( = ?auto_370189 ?auto_370190 ) ) ( not ( = ?auto_370189 ?auto_370191 ) ) ( not ( = ?auto_370189 ?auto_370192 ) ) ( not ( = ?auto_370189 ?auto_370193 ) ) ( not ( = ?auto_370189 ?auto_370194 ) ) ( not ( = ?auto_370189 ?auto_370195 ) ) ( not ( = ?auto_370189 ?auto_370196 ) ) ( not ( = ?auto_370189 ?auto_370197 ) ) ( not ( = ?auto_370190 ?auto_370191 ) ) ( not ( = ?auto_370190 ?auto_370192 ) ) ( not ( = ?auto_370190 ?auto_370193 ) ) ( not ( = ?auto_370190 ?auto_370194 ) ) ( not ( = ?auto_370190 ?auto_370195 ) ) ( not ( = ?auto_370190 ?auto_370196 ) ) ( not ( = ?auto_370190 ?auto_370197 ) ) ( not ( = ?auto_370191 ?auto_370192 ) ) ( not ( = ?auto_370191 ?auto_370193 ) ) ( not ( = ?auto_370191 ?auto_370194 ) ) ( not ( = ?auto_370191 ?auto_370195 ) ) ( not ( = ?auto_370191 ?auto_370196 ) ) ( not ( = ?auto_370191 ?auto_370197 ) ) ( not ( = ?auto_370192 ?auto_370193 ) ) ( not ( = ?auto_370192 ?auto_370194 ) ) ( not ( = ?auto_370192 ?auto_370195 ) ) ( not ( = ?auto_370192 ?auto_370196 ) ) ( not ( = ?auto_370192 ?auto_370197 ) ) ( not ( = ?auto_370193 ?auto_370194 ) ) ( not ( = ?auto_370193 ?auto_370195 ) ) ( not ( = ?auto_370193 ?auto_370196 ) ) ( not ( = ?auto_370193 ?auto_370197 ) ) ( not ( = ?auto_370194 ?auto_370195 ) ) ( not ( = ?auto_370194 ?auto_370196 ) ) ( not ( = ?auto_370194 ?auto_370197 ) ) ( not ( = ?auto_370195 ?auto_370196 ) ) ( not ( = ?auto_370195 ?auto_370197 ) ) ( not ( = ?auto_370196 ?auto_370197 ) ) ( CLEAR ?auto_370194 ) ( ON ?auto_370195 ?auto_370196 ) ( CLEAR ?auto_370195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_370182 ?auto_370183 ?auto_370184 ?auto_370185 ?auto_370186 ?auto_370187 ?auto_370188 ?auto_370189 ?auto_370190 ?auto_370191 ?auto_370192 ?auto_370193 ?auto_370194 ?auto_370195 )
      ( MAKE-15PILE ?auto_370182 ?auto_370183 ?auto_370184 ?auto_370185 ?auto_370186 ?auto_370187 ?auto_370188 ?auto_370189 ?auto_370190 ?auto_370191 ?auto_370192 ?auto_370193 ?auto_370194 ?auto_370195 ?auto_370196 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370213 - BLOCK
      ?auto_370214 - BLOCK
      ?auto_370215 - BLOCK
      ?auto_370216 - BLOCK
      ?auto_370217 - BLOCK
      ?auto_370218 - BLOCK
      ?auto_370219 - BLOCK
      ?auto_370220 - BLOCK
      ?auto_370221 - BLOCK
      ?auto_370222 - BLOCK
      ?auto_370223 - BLOCK
      ?auto_370224 - BLOCK
      ?auto_370225 - BLOCK
      ?auto_370226 - BLOCK
      ?auto_370227 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_370227 ) ( ON-TABLE ?auto_370213 ) ( ON ?auto_370214 ?auto_370213 ) ( ON ?auto_370215 ?auto_370214 ) ( ON ?auto_370216 ?auto_370215 ) ( ON ?auto_370217 ?auto_370216 ) ( ON ?auto_370218 ?auto_370217 ) ( ON ?auto_370219 ?auto_370218 ) ( ON ?auto_370220 ?auto_370219 ) ( ON ?auto_370221 ?auto_370220 ) ( ON ?auto_370222 ?auto_370221 ) ( ON ?auto_370223 ?auto_370222 ) ( ON ?auto_370224 ?auto_370223 ) ( ON ?auto_370225 ?auto_370224 ) ( not ( = ?auto_370213 ?auto_370214 ) ) ( not ( = ?auto_370213 ?auto_370215 ) ) ( not ( = ?auto_370213 ?auto_370216 ) ) ( not ( = ?auto_370213 ?auto_370217 ) ) ( not ( = ?auto_370213 ?auto_370218 ) ) ( not ( = ?auto_370213 ?auto_370219 ) ) ( not ( = ?auto_370213 ?auto_370220 ) ) ( not ( = ?auto_370213 ?auto_370221 ) ) ( not ( = ?auto_370213 ?auto_370222 ) ) ( not ( = ?auto_370213 ?auto_370223 ) ) ( not ( = ?auto_370213 ?auto_370224 ) ) ( not ( = ?auto_370213 ?auto_370225 ) ) ( not ( = ?auto_370213 ?auto_370226 ) ) ( not ( = ?auto_370213 ?auto_370227 ) ) ( not ( = ?auto_370214 ?auto_370215 ) ) ( not ( = ?auto_370214 ?auto_370216 ) ) ( not ( = ?auto_370214 ?auto_370217 ) ) ( not ( = ?auto_370214 ?auto_370218 ) ) ( not ( = ?auto_370214 ?auto_370219 ) ) ( not ( = ?auto_370214 ?auto_370220 ) ) ( not ( = ?auto_370214 ?auto_370221 ) ) ( not ( = ?auto_370214 ?auto_370222 ) ) ( not ( = ?auto_370214 ?auto_370223 ) ) ( not ( = ?auto_370214 ?auto_370224 ) ) ( not ( = ?auto_370214 ?auto_370225 ) ) ( not ( = ?auto_370214 ?auto_370226 ) ) ( not ( = ?auto_370214 ?auto_370227 ) ) ( not ( = ?auto_370215 ?auto_370216 ) ) ( not ( = ?auto_370215 ?auto_370217 ) ) ( not ( = ?auto_370215 ?auto_370218 ) ) ( not ( = ?auto_370215 ?auto_370219 ) ) ( not ( = ?auto_370215 ?auto_370220 ) ) ( not ( = ?auto_370215 ?auto_370221 ) ) ( not ( = ?auto_370215 ?auto_370222 ) ) ( not ( = ?auto_370215 ?auto_370223 ) ) ( not ( = ?auto_370215 ?auto_370224 ) ) ( not ( = ?auto_370215 ?auto_370225 ) ) ( not ( = ?auto_370215 ?auto_370226 ) ) ( not ( = ?auto_370215 ?auto_370227 ) ) ( not ( = ?auto_370216 ?auto_370217 ) ) ( not ( = ?auto_370216 ?auto_370218 ) ) ( not ( = ?auto_370216 ?auto_370219 ) ) ( not ( = ?auto_370216 ?auto_370220 ) ) ( not ( = ?auto_370216 ?auto_370221 ) ) ( not ( = ?auto_370216 ?auto_370222 ) ) ( not ( = ?auto_370216 ?auto_370223 ) ) ( not ( = ?auto_370216 ?auto_370224 ) ) ( not ( = ?auto_370216 ?auto_370225 ) ) ( not ( = ?auto_370216 ?auto_370226 ) ) ( not ( = ?auto_370216 ?auto_370227 ) ) ( not ( = ?auto_370217 ?auto_370218 ) ) ( not ( = ?auto_370217 ?auto_370219 ) ) ( not ( = ?auto_370217 ?auto_370220 ) ) ( not ( = ?auto_370217 ?auto_370221 ) ) ( not ( = ?auto_370217 ?auto_370222 ) ) ( not ( = ?auto_370217 ?auto_370223 ) ) ( not ( = ?auto_370217 ?auto_370224 ) ) ( not ( = ?auto_370217 ?auto_370225 ) ) ( not ( = ?auto_370217 ?auto_370226 ) ) ( not ( = ?auto_370217 ?auto_370227 ) ) ( not ( = ?auto_370218 ?auto_370219 ) ) ( not ( = ?auto_370218 ?auto_370220 ) ) ( not ( = ?auto_370218 ?auto_370221 ) ) ( not ( = ?auto_370218 ?auto_370222 ) ) ( not ( = ?auto_370218 ?auto_370223 ) ) ( not ( = ?auto_370218 ?auto_370224 ) ) ( not ( = ?auto_370218 ?auto_370225 ) ) ( not ( = ?auto_370218 ?auto_370226 ) ) ( not ( = ?auto_370218 ?auto_370227 ) ) ( not ( = ?auto_370219 ?auto_370220 ) ) ( not ( = ?auto_370219 ?auto_370221 ) ) ( not ( = ?auto_370219 ?auto_370222 ) ) ( not ( = ?auto_370219 ?auto_370223 ) ) ( not ( = ?auto_370219 ?auto_370224 ) ) ( not ( = ?auto_370219 ?auto_370225 ) ) ( not ( = ?auto_370219 ?auto_370226 ) ) ( not ( = ?auto_370219 ?auto_370227 ) ) ( not ( = ?auto_370220 ?auto_370221 ) ) ( not ( = ?auto_370220 ?auto_370222 ) ) ( not ( = ?auto_370220 ?auto_370223 ) ) ( not ( = ?auto_370220 ?auto_370224 ) ) ( not ( = ?auto_370220 ?auto_370225 ) ) ( not ( = ?auto_370220 ?auto_370226 ) ) ( not ( = ?auto_370220 ?auto_370227 ) ) ( not ( = ?auto_370221 ?auto_370222 ) ) ( not ( = ?auto_370221 ?auto_370223 ) ) ( not ( = ?auto_370221 ?auto_370224 ) ) ( not ( = ?auto_370221 ?auto_370225 ) ) ( not ( = ?auto_370221 ?auto_370226 ) ) ( not ( = ?auto_370221 ?auto_370227 ) ) ( not ( = ?auto_370222 ?auto_370223 ) ) ( not ( = ?auto_370222 ?auto_370224 ) ) ( not ( = ?auto_370222 ?auto_370225 ) ) ( not ( = ?auto_370222 ?auto_370226 ) ) ( not ( = ?auto_370222 ?auto_370227 ) ) ( not ( = ?auto_370223 ?auto_370224 ) ) ( not ( = ?auto_370223 ?auto_370225 ) ) ( not ( = ?auto_370223 ?auto_370226 ) ) ( not ( = ?auto_370223 ?auto_370227 ) ) ( not ( = ?auto_370224 ?auto_370225 ) ) ( not ( = ?auto_370224 ?auto_370226 ) ) ( not ( = ?auto_370224 ?auto_370227 ) ) ( not ( = ?auto_370225 ?auto_370226 ) ) ( not ( = ?auto_370225 ?auto_370227 ) ) ( not ( = ?auto_370226 ?auto_370227 ) ) ( CLEAR ?auto_370225 ) ( ON ?auto_370226 ?auto_370227 ) ( CLEAR ?auto_370226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_370213 ?auto_370214 ?auto_370215 ?auto_370216 ?auto_370217 ?auto_370218 ?auto_370219 ?auto_370220 ?auto_370221 ?auto_370222 ?auto_370223 ?auto_370224 ?auto_370225 ?auto_370226 )
      ( MAKE-15PILE ?auto_370213 ?auto_370214 ?auto_370215 ?auto_370216 ?auto_370217 ?auto_370218 ?auto_370219 ?auto_370220 ?auto_370221 ?auto_370222 ?auto_370223 ?auto_370224 ?auto_370225 ?auto_370226 ?auto_370227 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370243 - BLOCK
      ?auto_370244 - BLOCK
      ?auto_370245 - BLOCK
      ?auto_370246 - BLOCK
      ?auto_370247 - BLOCK
      ?auto_370248 - BLOCK
      ?auto_370249 - BLOCK
      ?auto_370250 - BLOCK
      ?auto_370251 - BLOCK
      ?auto_370252 - BLOCK
      ?auto_370253 - BLOCK
      ?auto_370254 - BLOCK
      ?auto_370255 - BLOCK
      ?auto_370256 - BLOCK
      ?auto_370257 - BLOCK
    )
    :vars
    (
      ?auto_370258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_370257 ?auto_370258 ) ( ON-TABLE ?auto_370243 ) ( ON ?auto_370244 ?auto_370243 ) ( ON ?auto_370245 ?auto_370244 ) ( ON ?auto_370246 ?auto_370245 ) ( ON ?auto_370247 ?auto_370246 ) ( ON ?auto_370248 ?auto_370247 ) ( ON ?auto_370249 ?auto_370248 ) ( ON ?auto_370250 ?auto_370249 ) ( ON ?auto_370251 ?auto_370250 ) ( ON ?auto_370252 ?auto_370251 ) ( ON ?auto_370253 ?auto_370252 ) ( ON ?auto_370254 ?auto_370253 ) ( not ( = ?auto_370243 ?auto_370244 ) ) ( not ( = ?auto_370243 ?auto_370245 ) ) ( not ( = ?auto_370243 ?auto_370246 ) ) ( not ( = ?auto_370243 ?auto_370247 ) ) ( not ( = ?auto_370243 ?auto_370248 ) ) ( not ( = ?auto_370243 ?auto_370249 ) ) ( not ( = ?auto_370243 ?auto_370250 ) ) ( not ( = ?auto_370243 ?auto_370251 ) ) ( not ( = ?auto_370243 ?auto_370252 ) ) ( not ( = ?auto_370243 ?auto_370253 ) ) ( not ( = ?auto_370243 ?auto_370254 ) ) ( not ( = ?auto_370243 ?auto_370255 ) ) ( not ( = ?auto_370243 ?auto_370256 ) ) ( not ( = ?auto_370243 ?auto_370257 ) ) ( not ( = ?auto_370243 ?auto_370258 ) ) ( not ( = ?auto_370244 ?auto_370245 ) ) ( not ( = ?auto_370244 ?auto_370246 ) ) ( not ( = ?auto_370244 ?auto_370247 ) ) ( not ( = ?auto_370244 ?auto_370248 ) ) ( not ( = ?auto_370244 ?auto_370249 ) ) ( not ( = ?auto_370244 ?auto_370250 ) ) ( not ( = ?auto_370244 ?auto_370251 ) ) ( not ( = ?auto_370244 ?auto_370252 ) ) ( not ( = ?auto_370244 ?auto_370253 ) ) ( not ( = ?auto_370244 ?auto_370254 ) ) ( not ( = ?auto_370244 ?auto_370255 ) ) ( not ( = ?auto_370244 ?auto_370256 ) ) ( not ( = ?auto_370244 ?auto_370257 ) ) ( not ( = ?auto_370244 ?auto_370258 ) ) ( not ( = ?auto_370245 ?auto_370246 ) ) ( not ( = ?auto_370245 ?auto_370247 ) ) ( not ( = ?auto_370245 ?auto_370248 ) ) ( not ( = ?auto_370245 ?auto_370249 ) ) ( not ( = ?auto_370245 ?auto_370250 ) ) ( not ( = ?auto_370245 ?auto_370251 ) ) ( not ( = ?auto_370245 ?auto_370252 ) ) ( not ( = ?auto_370245 ?auto_370253 ) ) ( not ( = ?auto_370245 ?auto_370254 ) ) ( not ( = ?auto_370245 ?auto_370255 ) ) ( not ( = ?auto_370245 ?auto_370256 ) ) ( not ( = ?auto_370245 ?auto_370257 ) ) ( not ( = ?auto_370245 ?auto_370258 ) ) ( not ( = ?auto_370246 ?auto_370247 ) ) ( not ( = ?auto_370246 ?auto_370248 ) ) ( not ( = ?auto_370246 ?auto_370249 ) ) ( not ( = ?auto_370246 ?auto_370250 ) ) ( not ( = ?auto_370246 ?auto_370251 ) ) ( not ( = ?auto_370246 ?auto_370252 ) ) ( not ( = ?auto_370246 ?auto_370253 ) ) ( not ( = ?auto_370246 ?auto_370254 ) ) ( not ( = ?auto_370246 ?auto_370255 ) ) ( not ( = ?auto_370246 ?auto_370256 ) ) ( not ( = ?auto_370246 ?auto_370257 ) ) ( not ( = ?auto_370246 ?auto_370258 ) ) ( not ( = ?auto_370247 ?auto_370248 ) ) ( not ( = ?auto_370247 ?auto_370249 ) ) ( not ( = ?auto_370247 ?auto_370250 ) ) ( not ( = ?auto_370247 ?auto_370251 ) ) ( not ( = ?auto_370247 ?auto_370252 ) ) ( not ( = ?auto_370247 ?auto_370253 ) ) ( not ( = ?auto_370247 ?auto_370254 ) ) ( not ( = ?auto_370247 ?auto_370255 ) ) ( not ( = ?auto_370247 ?auto_370256 ) ) ( not ( = ?auto_370247 ?auto_370257 ) ) ( not ( = ?auto_370247 ?auto_370258 ) ) ( not ( = ?auto_370248 ?auto_370249 ) ) ( not ( = ?auto_370248 ?auto_370250 ) ) ( not ( = ?auto_370248 ?auto_370251 ) ) ( not ( = ?auto_370248 ?auto_370252 ) ) ( not ( = ?auto_370248 ?auto_370253 ) ) ( not ( = ?auto_370248 ?auto_370254 ) ) ( not ( = ?auto_370248 ?auto_370255 ) ) ( not ( = ?auto_370248 ?auto_370256 ) ) ( not ( = ?auto_370248 ?auto_370257 ) ) ( not ( = ?auto_370248 ?auto_370258 ) ) ( not ( = ?auto_370249 ?auto_370250 ) ) ( not ( = ?auto_370249 ?auto_370251 ) ) ( not ( = ?auto_370249 ?auto_370252 ) ) ( not ( = ?auto_370249 ?auto_370253 ) ) ( not ( = ?auto_370249 ?auto_370254 ) ) ( not ( = ?auto_370249 ?auto_370255 ) ) ( not ( = ?auto_370249 ?auto_370256 ) ) ( not ( = ?auto_370249 ?auto_370257 ) ) ( not ( = ?auto_370249 ?auto_370258 ) ) ( not ( = ?auto_370250 ?auto_370251 ) ) ( not ( = ?auto_370250 ?auto_370252 ) ) ( not ( = ?auto_370250 ?auto_370253 ) ) ( not ( = ?auto_370250 ?auto_370254 ) ) ( not ( = ?auto_370250 ?auto_370255 ) ) ( not ( = ?auto_370250 ?auto_370256 ) ) ( not ( = ?auto_370250 ?auto_370257 ) ) ( not ( = ?auto_370250 ?auto_370258 ) ) ( not ( = ?auto_370251 ?auto_370252 ) ) ( not ( = ?auto_370251 ?auto_370253 ) ) ( not ( = ?auto_370251 ?auto_370254 ) ) ( not ( = ?auto_370251 ?auto_370255 ) ) ( not ( = ?auto_370251 ?auto_370256 ) ) ( not ( = ?auto_370251 ?auto_370257 ) ) ( not ( = ?auto_370251 ?auto_370258 ) ) ( not ( = ?auto_370252 ?auto_370253 ) ) ( not ( = ?auto_370252 ?auto_370254 ) ) ( not ( = ?auto_370252 ?auto_370255 ) ) ( not ( = ?auto_370252 ?auto_370256 ) ) ( not ( = ?auto_370252 ?auto_370257 ) ) ( not ( = ?auto_370252 ?auto_370258 ) ) ( not ( = ?auto_370253 ?auto_370254 ) ) ( not ( = ?auto_370253 ?auto_370255 ) ) ( not ( = ?auto_370253 ?auto_370256 ) ) ( not ( = ?auto_370253 ?auto_370257 ) ) ( not ( = ?auto_370253 ?auto_370258 ) ) ( not ( = ?auto_370254 ?auto_370255 ) ) ( not ( = ?auto_370254 ?auto_370256 ) ) ( not ( = ?auto_370254 ?auto_370257 ) ) ( not ( = ?auto_370254 ?auto_370258 ) ) ( not ( = ?auto_370255 ?auto_370256 ) ) ( not ( = ?auto_370255 ?auto_370257 ) ) ( not ( = ?auto_370255 ?auto_370258 ) ) ( not ( = ?auto_370256 ?auto_370257 ) ) ( not ( = ?auto_370256 ?auto_370258 ) ) ( not ( = ?auto_370257 ?auto_370258 ) ) ( ON ?auto_370256 ?auto_370257 ) ( CLEAR ?auto_370254 ) ( ON ?auto_370255 ?auto_370256 ) ( CLEAR ?auto_370255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_370243 ?auto_370244 ?auto_370245 ?auto_370246 ?auto_370247 ?auto_370248 ?auto_370249 ?auto_370250 ?auto_370251 ?auto_370252 ?auto_370253 ?auto_370254 ?auto_370255 )
      ( MAKE-15PILE ?auto_370243 ?auto_370244 ?auto_370245 ?auto_370246 ?auto_370247 ?auto_370248 ?auto_370249 ?auto_370250 ?auto_370251 ?auto_370252 ?auto_370253 ?auto_370254 ?auto_370255 ?auto_370256 ?auto_370257 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370274 - BLOCK
      ?auto_370275 - BLOCK
      ?auto_370276 - BLOCK
      ?auto_370277 - BLOCK
      ?auto_370278 - BLOCK
      ?auto_370279 - BLOCK
      ?auto_370280 - BLOCK
      ?auto_370281 - BLOCK
      ?auto_370282 - BLOCK
      ?auto_370283 - BLOCK
      ?auto_370284 - BLOCK
      ?auto_370285 - BLOCK
      ?auto_370286 - BLOCK
      ?auto_370287 - BLOCK
      ?auto_370288 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_370288 ) ( ON-TABLE ?auto_370274 ) ( ON ?auto_370275 ?auto_370274 ) ( ON ?auto_370276 ?auto_370275 ) ( ON ?auto_370277 ?auto_370276 ) ( ON ?auto_370278 ?auto_370277 ) ( ON ?auto_370279 ?auto_370278 ) ( ON ?auto_370280 ?auto_370279 ) ( ON ?auto_370281 ?auto_370280 ) ( ON ?auto_370282 ?auto_370281 ) ( ON ?auto_370283 ?auto_370282 ) ( ON ?auto_370284 ?auto_370283 ) ( ON ?auto_370285 ?auto_370284 ) ( not ( = ?auto_370274 ?auto_370275 ) ) ( not ( = ?auto_370274 ?auto_370276 ) ) ( not ( = ?auto_370274 ?auto_370277 ) ) ( not ( = ?auto_370274 ?auto_370278 ) ) ( not ( = ?auto_370274 ?auto_370279 ) ) ( not ( = ?auto_370274 ?auto_370280 ) ) ( not ( = ?auto_370274 ?auto_370281 ) ) ( not ( = ?auto_370274 ?auto_370282 ) ) ( not ( = ?auto_370274 ?auto_370283 ) ) ( not ( = ?auto_370274 ?auto_370284 ) ) ( not ( = ?auto_370274 ?auto_370285 ) ) ( not ( = ?auto_370274 ?auto_370286 ) ) ( not ( = ?auto_370274 ?auto_370287 ) ) ( not ( = ?auto_370274 ?auto_370288 ) ) ( not ( = ?auto_370275 ?auto_370276 ) ) ( not ( = ?auto_370275 ?auto_370277 ) ) ( not ( = ?auto_370275 ?auto_370278 ) ) ( not ( = ?auto_370275 ?auto_370279 ) ) ( not ( = ?auto_370275 ?auto_370280 ) ) ( not ( = ?auto_370275 ?auto_370281 ) ) ( not ( = ?auto_370275 ?auto_370282 ) ) ( not ( = ?auto_370275 ?auto_370283 ) ) ( not ( = ?auto_370275 ?auto_370284 ) ) ( not ( = ?auto_370275 ?auto_370285 ) ) ( not ( = ?auto_370275 ?auto_370286 ) ) ( not ( = ?auto_370275 ?auto_370287 ) ) ( not ( = ?auto_370275 ?auto_370288 ) ) ( not ( = ?auto_370276 ?auto_370277 ) ) ( not ( = ?auto_370276 ?auto_370278 ) ) ( not ( = ?auto_370276 ?auto_370279 ) ) ( not ( = ?auto_370276 ?auto_370280 ) ) ( not ( = ?auto_370276 ?auto_370281 ) ) ( not ( = ?auto_370276 ?auto_370282 ) ) ( not ( = ?auto_370276 ?auto_370283 ) ) ( not ( = ?auto_370276 ?auto_370284 ) ) ( not ( = ?auto_370276 ?auto_370285 ) ) ( not ( = ?auto_370276 ?auto_370286 ) ) ( not ( = ?auto_370276 ?auto_370287 ) ) ( not ( = ?auto_370276 ?auto_370288 ) ) ( not ( = ?auto_370277 ?auto_370278 ) ) ( not ( = ?auto_370277 ?auto_370279 ) ) ( not ( = ?auto_370277 ?auto_370280 ) ) ( not ( = ?auto_370277 ?auto_370281 ) ) ( not ( = ?auto_370277 ?auto_370282 ) ) ( not ( = ?auto_370277 ?auto_370283 ) ) ( not ( = ?auto_370277 ?auto_370284 ) ) ( not ( = ?auto_370277 ?auto_370285 ) ) ( not ( = ?auto_370277 ?auto_370286 ) ) ( not ( = ?auto_370277 ?auto_370287 ) ) ( not ( = ?auto_370277 ?auto_370288 ) ) ( not ( = ?auto_370278 ?auto_370279 ) ) ( not ( = ?auto_370278 ?auto_370280 ) ) ( not ( = ?auto_370278 ?auto_370281 ) ) ( not ( = ?auto_370278 ?auto_370282 ) ) ( not ( = ?auto_370278 ?auto_370283 ) ) ( not ( = ?auto_370278 ?auto_370284 ) ) ( not ( = ?auto_370278 ?auto_370285 ) ) ( not ( = ?auto_370278 ?auto_370286 ) ) ( not ( = ?auto_370278 ?auto_370287 ) ) ( not ( = ?auto_370278 ?auto_370288 ) ) ( not ( = ?auto_370279 ?auto_370280 ) ) ( not ( = ?auto_370279 ?auto_370281 ) ) ( not ( = ?auto_370279 ?auto_370282 ) ) ( not ( = ?auto_370279 ?auto_370283 ) ) ( not ( = ?auto_370279 ?auto_370284 ) ) ( not ( = ?auto_370279 ?auto_370285 ) ) ( not ( = ?auto_370279 ?auto_370286 ) ) ( not ( = ?auto_370279 ?auto_370287 ) ) ( not ( = ?auto_370279 ?auto_370288 ) ) ( not ( = ?auto_370280 ?auto_370281 ) ) ( not ( = ?auto_370280 ?auto_370282 ) ) ( not ( = ?auto_370280 ?auto_370283 ) ) ( not ( = ?auto_370280 ?auto_370284 ) ) ( not ( = ?auto_370280 ?auto_370285 ) ) ( not ( = ?auto_370280 ?auto_370286 ) ) ( not ( = ?auto_370280 ?auto_370287 ) ) ( not ( = ?auto_370280 ?auto_370288 ) ) ( not ( = ?auto_370281 ?auto_370282 ) ) ( not ( = ?auto_370281 ?auto_370283 ) ) ( not ( = ?auto_370281 ?auto_370284 ) ) ( not ( = ?auto_370281 ?auto_370285 ) ) ( not ( = ?auto_370281 ?auto_370286 ) ) ( not ( = ?auto_370281 ?auto_370287 ) ) ( not ( = ?auto_370281 ?auto_370288 ) ) ( not ( = ?auto_370282 ?auto_370283 ) ) ( not ( = ?auto_370282 ?auto_370284 ) ) ( not ( = ?auto_370282 ?auto_370285 ) ) ( not ( = ?auto_370282 ?auto_370286 ) ) ( not ( = ?auto_370282 ?auto_370287 ) ) ( not ( = ?auto_370282 ?auto_370288 ) ) ( not ( = ?auto_370283 ?auto_370284 ) ) ( not ( = ?auto_370283 ?auto_370285 ) ) ( not ( = ?auto_370283 ?auto_370286 ) ) ( not ( = ?auto_370283 ?auto_370287 ) ) ( not ( = ?auto_370283 ?auto_370288 ) ) ( not ( = ?auto_370284 ?auto_370285 ) ) ( not ( = ?auto_370284 ?auto_370286 ) ) ( not ( = ?auto_370284 ?auto_370287 ) ) ( not ( = ?auto_370284 ?auto_370288 ) ) ( not ( = ?auto_370285 ?auto_370286 ) ) ( not ( = ?auto_370285 ?auto_370287 ) ) ( not ( = ?auto_370285 ?auto_370288 ) ) ( not ( = ?auto_370286 ?auto_370287 ) ) ( not ( = ?auto_370286 ?auto_370288 ) ) ( not ( = ?auto_370287 ?auto_370288 ) ) ( ON ?auto_370287 ?auto_370288 ) ( CLEAR ?auto_370285 ) ( ON ?auto_370286 ?auto_370287 ) ( CLEAR ?auto_370286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_370274 ?auto_370275 ?auto_370276 ?auto_370277 ?auto_370278 ?auto_370279 ?auto_370280 ?auto_370281 ?auto_370282 ?auto_370283 ?auto_370284 ?auto_370285 ?auto_370286 )
      ( MAKE-15PILE ?auto_370274 ?auto_370275 ?auto_370276 ?auto_370277 ?auto_370278 ?auto_370279 ?auto_370280 ?auto_370281 ?auto_370282 ?auto_370283 ?auto_370284 ?auto_370285 ?auto_370286 ?auto_370287 ?auto_370288 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370304 - BLOCK
      ?auto_370305 - BLOCK
      ?auto_370306 - BLOCK
      ?auto_370307 - BLOCK
      ?auto_370308 - BLOCK
      ?auto_370309 - BLOCK
      ?auto_370310 - BLOCK
      ?auto_370311 - BLOCK
      ?auto_370312 - BLOCK
      ?auto_370313 - BLOCK
      ?auto_370314 - BLOCK
      ?auto_370315 - BLOCK
      ?auto_370316 - BLOCK
      ?auto_370317 - BLOCK
      ?auto_370318 - BLOCK
    )
    :vars
    (
      ?auto_370319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_370318 ?auto_370319 ) ( ON-TABLE ?auto_370304 ) ( ON ?auto_370305 ?auto_370304 ) ( ON ?auto_370306 ?auto_370305 ) ( ON ?auto_370307 ?auto_370306 ) ( ON ?auto_370308 ?auto_370307 ) ( ON ?auto_370309 ?auto_370308 ) ( ON ?auto_370310 ?auto_370309 ) ( ON ?auto_370311 ?auto_370310 ) ( ON ?auto_370312 ?auto_370311 ) ( ON ?auto_370313 ?auto_370312 ) ( ON ?auto_370314 ?auto_370313 ) ( not ( = ?auto_370304 ?auto_370305 ) ) ( not ( = ?auto_370304 ?auto_370306 ) ) ( not ( = ?auto_370304 ?auto_370307 ) ) ( not ( = ?auto_370304 ?auto_370308 ) ) ( not ( = ?auto_370304 ?auto_370309 ) ) ( not ( = ?auto_370304 ?auto_370310 ) ) ( not ( = ?auto_370304 ?auto_370311 ) ) ( not ( = ?auto_370304 ?auto_370312 ) ) ( not ( = ?auto_370304 ?auto_370313 ) ) ( not ( = ?auto_370304 ?auto_370314 ) ) ( not ( = ?auto_370304 ?auto_370315 ) ) ( not ( = ?auto_370304 ?auto_370316 ) ) ( not ( = ?auto_370304 ?auto_370317 ) ) ( not ( = ?auto_370304 ?auto_370318 ) ) ( not ( = ?auto_370304 ?auto_370319 ) ) ( not ( = ?auto_370305 ?auto_370306 ) ) ( not ( = ?auto_370305 ?auto_370307 ) ) ( not ( = ?auto_370305 ?auto_370308 ) ) ( not ( = ?auto_370305 ?auto_370309 ) ) ( not ( = ?auto_370305 ?auto_370310 ) ) ( not ( = ?auto_370305 ?auto_370311 ) ) ( not ( = ?auto_370305 ?auto_370312 ) ) ( not ( = ?auto_370305 ?auto_370313 ) ) ( not ( = ?auto_370305 ?auto_370314 ) ) ( not ( = ?auto_370305 ?auto_370315 ) ) ( not ( = ?auto_370305 ?auto_370316 ) ) ( not ( = ?auto_370305 ?auto_370317 ) ) ( not ( = ?auto_370305 ?auto_370318 ) ) ( not ( = ?auto_370305 ?auto_370319 ) ) ( not ( = ?auto_370306 ?auto_370307 ) ) ( not ( = ?auto_370306 ?auto_370308 ) ) ( not ( = ?auto_370306 ?auto_370309 ) ) ( not ( = ?auto_370306 ?auto_370310 ) ) ( not ( = ?auto_370306 ?auto_370311 ) ) ( not ( = ?auto_370306 ?auto_370312 ) ) ( not ( = ?auto_370306 ?auto_370313 ) ) ( not ( = ?auto_370306 ?auto_370314 ) ) ( not ( = ?auto_370306 ?auto_370315 ) ) ( not ( = ?auto_370306 ?auto_370316 ) ) ( not ( = ?auto_370306 ?auto_370317 ) ) ( not ( = ?auto_370306 ?auto_370318 ) ) ( not ( = ?auto_370306 ?auto_370319 ) ) ( not ( = ?auto_370307 ?auto_370308 ) ) ( not ( = ?auto_370307 ?auto_370309 ) ) ( not ( = ?auto_370307 ?auto_370310 ) ) ( not ( = ?auto_370307 ?auto_370311 ) ) ( not ( = ?auto_370307 ?auto_370312 ) ) ( not ( = ?auto_370307 ?auto_370313 ) ) ( not ( = ?auto_370307 ?auto_370314 ) ) ( not ( = ?auto_370307 ?auto_370315 ) ) ( not ( = ?auto_370307 ?auto_370316 ) ) ( not ( = ?auto_370307 ?auto_370317 ) ) ( not ( = ?auto_370307 ?auto_370318 ) ) ( not ( = ?auto_370307 ?auto_370319 ) ) ( not ( = ?auto_370308 ?auto_370309 ) ) ( not ( = ?auto_370308 ?auto_370310 ) ) ( not ( = ?auto_370308 ?auto_370311 ) ) ( not ( = ?auto_370308 ?auto_370312 ) ) ( not ( = ?auto_370308 ?auto_370313 ) ) ( not ( = ?auto_370308 ?auto_370314 ) ) ( not ( = ?auto_370308 ?auto_370315 ) ) ( not ( = ?auto_370308 ?auto_370316 ) ) ( not ( = ?auto_370308 ?auto_370317 ) ) ( not ( = ?auto_370308 ?auto_370318 ) ) ( not ( = ?auto_370308 ?auto_370319 ) ) ( not ( = ?auto_370309 ?auto_370310 ) ) ( not ( = ?auto_370309 ?auto_370311 ) ) ( not ( = ?auto_370309 ?auto_370312 ) ) ( not ( = ?auto_370309 ?auto_370313 ) ) ( not ( = ?auto_370309 ?auto_370314 ) ) ( not ( = ?auto_370309 ?auto_370315 ) ) ( not ( = ?auto_370309 ?auto_370316 ) ) ( not ( = ?auto_370309 ?auto_370317 ) ) ( not ( = ?auto_370309 ?auto_370318 ) ) ( not ( = ?auto_370309 ?auto_370319 ) ) ( not ( = ?auto_370310 ?auto_370311 ) ) ( not ( = ?auto_370310 ?auto_370312 ) ) ( not ( = ?auto_370310 ?auto_370313 ) ) ( not ( = ?auto_370310 ?auto_370314 ) ) ( not ( = ?auto_370310 ?auto_370315 ) ) ( not ( = ?auto_370310 ?auto_370316 ) ) ( not ( = ?auto_370310 ?auto_370317 ) ) ( not ( = ?auto_370310 ?auto_370318 ) ) ( not ( = ?auto_370310 ?auto_370319 ) ) ( not ( = ?auto_370311 ?auto_370312 ) ) ( not ( = ?auto_370311 ?auto_370313 ) ) ( not ( = ?auto_370311 ?auto_370314 ) ) ( not ( = ?auto_370311 ?auto_370315 ) ) ( not ( = ?auto_370311 ?auto_370316 ) ) ( not ( = ?auto_370311 ?auto_370317 ) ) ( not ( = ?auto_370311 ?auto_370318 ) ) ( not ( = ?auto_370311 ?auto_370319 ) ) ( not ( = ?auto_370312 ?auto_370313 ) ) ( not ( = ?auto_370312 ?auto_370314 ) ) ( not ( = ?auto_370312 ?auto_370315 ) ) ( not ( = ?auto_370312 ?auto_370316 ) ) ( not ( = ?auto_370312 ?auto_370317 ) ) ( not ( = ?auto_370312 ?auto_370318 ) ) ( not ( = ?auto_370312 ?auto_370319 ) ) ( not ( = ?auto_370313 ?auto_370314 ) ) ( not ( = ?auto_370313 ?auto_370315 ) ) ( not ( = ?auto_370313 ?auto_370316 ) ) ( not ( = ?auto_370313 ?auto_370317 ) ) ( not ( = ?auto_370313 ?auto_370318 ) ) ( not ( = ?auto_370313 ?auto_370319 ) ) ( not ( = ?auto_370314 ?auto_370315 ) ) ( not ( = ?auto_370314 ?auto_370316 ) ) ( not ( = ?auto_370314 ?auto_370317 ) ) ( not ( = ?auto_370314 ?auto_370318 ) ) ( not ( = ?auto_370314 ?auto_370319 ) ) ( not ( = ?auto_370315 ?auto_370316 ) ) ( not ( = ?auto_370315 ?auto_370317 ) ) ( not ( = ?auto_370315 ?auto_370318 ) ) ( not ( = ?auto_370315 ?auto_370319 ) ) ( not ( = ?auto_370316 ?auto_370317 ) ) ( not ( = ?auto_370316 ?auto_370318 ) ) ( not ( = ?auto_370316 ?auto_370319 ) ) ( not ( = ?auto_370317 ?auto_370318 ) ) ( not ( = ?auto_370317 ?auto_370319 ) ) ( not ( = ?auto_370318 ?auto_370319 ) ) ( ON ?auto_370317 ?auto_370318 ) ( ON ?auto_370316 ?auto_370317 ) ( CLEAR ?auto_370314 ) ( ON ?auto_370315 ?auto_370316 ) ( CLEAR ?auto_370315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_370304 ?auto_370305 ?auto_370306 ?auto_370307 ?auto_370308 ?auto_370309 ?auto_370310 ?auto_370311 ?auto_370312 ?auto_370313 ?auto_370314 ?auto_370315 )
      ( MAKE-15PILE ?auto_370304 ?auto_370305 ?auto_370306 ?auto_370307 ?auto_370308 ?auto_370309 ?auto_370310 ?auto_370311 ?auto_370312 ?auto_370313 ?auto_370314 ?auto_370315 ?auto_370316 ?auto_370317 ?auto_370318 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370335 - BLOCK
      ?auto_370336 - BLOCK
      ?auto_370337 - BLOCK
      ?auto_370338 - BLOCK
      ?auto_370339 - BLOCK
      ?auto_370340 - BLOCK
      ?auto_370341 - BLOCK
      ?auto_370342 - BLOCK
      ?auto_370343 - BLOCK
      ?auto_370344 - BLOCK
      ?auto_370345 - BLOCK
      ?auto_370346 - BLOCK
      ?auto_370347 - BLOCK
      ?auto_370348 - BLOCK
      ?auto_370349 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_370349 ) ( ON-TABLE ?auto_370335 ) ( ON ?auto_370336 ?auto_370335 ) ( ON ?auto_370337 ?auto_370336 ) ( ON ?auto_370338 ?auto_370337 ) ( ON ?auto_370339 ?auto_370338 ) ( ON ?auto_370340 ?auto_370339 ) ( ON ?auto_370341 ?auto_370340 ) ( ON ?auto_370342 ?auto_370341 ) ( ON ?auto_370343 ?auto_370342 ) ( ON ?auto_370344 ?auto_370343 ) ( ON ?auto_370345 ?auto_370344 ) ( not ( = ?auto_370335 ?auto_370336 ) ) ( not ( = ?auto_370335 ?auto_370337 ) ) ( not ( = ?auto_370335 ?auto_370338 ) ) ( not ( = ?auto_370335 ?auto_370339 ) ) ( not ( = ?auto_370335 ?auto_370340 ) ) ( not ( = ?auto_370335 ?auto_370341 ) ) ( not ( = ?auto_370335 ?auto_370342 ) ) ( not ( = ?auto_370335 ?auto_370343 ) ) ( not ( = ?auto_370335 ?auto_370344 ) ) ( not ( = ?auto_370335 ?auto_370345 ) ) ( not ( = ?auto_370335 ?auto_370346 ) ) ( not ( = ?auto_370335 ?auto_370347 ) ) ( not ( = ?auto_370335 ?auto_370348 ) ) ( not ( = ?auto_370335 ?auto_370349 ) ) ( not ( = ?auto_370336 ?auto_370337 ) ) ( not ( = ?auto_370336 ?auto_370338 ) ) ( not ( = ?auto_370336 ?auto_370339 ) ) ( not ( = ?auto_370336 ?auto_370340 ) ) ( not ( = ?auto_370336 ?auto_370341 ) ) ( not ( = ?auto_370336 ?auto_370342 ) ) ( not ( = ?auto_370336 ?auto_370343 ) ) ( not ( = ?auto_370336 ?auto_370344 ) ) ( not ( = ?auto_370336 ?auto_370345 ) ) ( not ( = ?auto_370336 ?auto_370346 ) ) ( not ( = ?auto_370336 ?auto_370347 ) ) ( not ( = ?auto_370336 ?auto_370348 ) ) ( not ( = ?auto_370336 ?auto_370349 ) ) ( not ( = ?auto_370337 ?auto_370338 ) ) ( not ( = ?auto_370337 ?auto_370339 ) ) ( not ( = ?auto_370337 ?auto_370340 ) ) ( not ( = ?auto_370337 ?auto_370341 ) ) ( not ( = ?auto_370337 ?auto_370342 ) ) ( not ( = ?auto_370337 ?auto_370343 ) ) ( not ( = ?auto_370337 ?auto_370344 ) ) ( not ( = ?auto_370337 ?auto_370345 ) ) ( not ( = ?auto_370337 ?auto_370346 ) ) ( not ( = ?auto_370337 ?auto_370347 ) ) ( not ( = ?auto_370337 ?auto_370348 ) ) ( not ( = ?auto_370337 ?auto_370349 ) ) ( not ( = ?auto_370338 ?auto_370339 ) ) ( not ( = ?auto_370338 ?auto_370340 ) ) ( not ( = ?auto_370338 ?auto_370341 ) ) ( not ( = ?auto_370338 ?auto_370342 ) ) ( not ( = ?auto_370338 ?auto_370343 ) ) ( not ( = ?auto_370338 ?auto_370344 ) ) ( not ( = ?auto_370338 ?auto_370345 ) ) ( not ( = ?auto_370338 ?auto_370346 ) ) ( not ( = ?auto_370338 ?auto_370347 ) ) ( not ( = ?auto_370338 ?auto_370348 ) ) ( not ( = ?auto_370338 ?auto_370349 ) ) ( not ( = ?auto_370339 ?auto_370340 ) ) ( not ( = ?auto_370339 ?auto_370341 ) ) ( not ( = ?auto_370339 ?auto_370342 ) ) ( not ( = ?auto_370339 ?auto_370343 ) ) ( not ( = ?auto_370339 ?auto_370344 ) ) ( not ( = ?auto_370339 ?auto_370345 ) ) ( not ( = ?auto_370339 ?auto_370346 ) ) ( not ( = ?auto_370339 ?auto_370347 ) ) ( not ( = ?auto_370339 ?auto_370348 ) ) ( not ( = ?auto_370339 ?auto_370349 ) ) ( not ( = ?auto_370340 ?auto_370341 ) ) ( not ( = ?auto_370340 ?auto_370342 ) ) ( not ( = ?auto_370340 ?auto_370343 ) ) ( not ( = ?auto_370340 ?auto_370344 ) ) ( not ( = ?auto_370340 ?auto_370345 ) ) ( not ( = ?auto_370340 ?auto_370346 ) ) ( not ( = ?auto_370340 ?auto_370347 ) ) ( not ( = ?auto_370340 ?auto_370348 ) ) ( not ( = ?auto_370340 ?auto_370349 ) ) ( not ( = ?auto_370341 ?auto_370342 ) ) ( not ( = ?auto_370341 ?auto_370343 ) ) ( not ( = ?auto_370341 ?auto_370344 ) ) ( not ( = ?auto_370341 ?auto_370345 ) ) ( not ( = ?auto_370341 ?auto_370346 ) ) ( not ( = ?auto_370341 ?auto_370347 ) ) ( not ( = ?auto_370341 ?auto_370348 ) ) ( not ( = ?auto_370341 ?auto_370349 ) ) ( not ( = ?auto_370342 ?auto_370343 ) ) ( not ( = ?auto_370342 ?auto_370344 ) ) ( not ( = ?auto_370342 ?auto_370345 ) ) ( not ( = ?auto_370342 ?auto_370346 ) ) ( not ( = ?auto_370342 ?auto_370347 ) ) ( not ( = ?auto_370342 ?auto_370348 ) ) ( not ( = ?auto_370342 ?auto_370349 ) ) ( not ( = ?auto_370343 ?auto_370344 ) ) ( not ( = ?auto_370343 ?auto_370345 ) ) ( not ( = ?auto_370343 ?auto_370346 ) ) ( not ( = ?auto_370343 ?auto_370347 ) ) ( not ( = ?auto_370343 ?auto_370348 ) ) ( not ( = ?auto_370343 ?auto_370349 ) ) ( not ( = ?auto_370344 ?auto_370345 ) ) ( not ( = ?auto_370344 ?auto_370346 ) ) ( not ( = ?auto_370344 ?auto_370347 ) ) ( not ( = ?auto_370344 ?auto_370348 ) ) ( not ( = ?auto_370344 ?auto_370349 ) ) ( not ( = ?auto_370345 ?auto_370346 ) ) ( not ( = ?auto_370345 ?auto_370347 ) ) ( not ( = ?auto_370345 ?auto_370348 ) ) ( not ( = ?auto_370345 ?auto_370349 ) ) ( not ( = ?auto_370346 ?auto_370347 ) ) ( not ( = ?auto_370346 ?auto_370348 ) ) ( not ( = ?auto_370346 ?auto_370349 ) ) ( not ( = ?auto_370347 ?auto_370348 ) ) ( not ( = ?auto_370347 ?auto_370349 ) ) ( not ( = ?auto_370348 ?auto_370349 ) ) ( ON ?auto_370348 ?auto_370349 ) ( ON ?auto_370347 ?auto_370348 ) ( CLEAR ?auto_370345 ) ( ON ?auto_370346 ?auto_370347 ) ( CLEAR ?auto_370346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_370335 ?auto_370336 ?auto_370337 ?auto_370338 ?auto_370339 ?auto_370340 ?auto_370341 ?auto_370342 ?auto_370343 ?auto_370344 ?auto_370345 ?auto_370346 )
      ( MAKE-15PILE ?auto_370335 ?auto_370336 ?auto_370337 ?auto_370338 ?auto_370339 ?auto_370340 ?auto_370341 ?auto_370342 ?auto_370343 ?auto_370344 ?auto_370345 ?auto_370346 ?auto_370347 ?auto_370348 ?auto_370349 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370365 - BLOCK
      ?auto_370366 - BLOCK
      ?auto_370367 - BLOCK
      ?auto_370368 - BLOCK
      ?auto_370369 - BLOCK
      ?auto_370370 - BLOCK
      ?auto_370371 - BLOCK
      ?auto_370372 - BLOCK
      ?auto_370373 - BLOCK
      ?auto_370374 - BLOCK
      ?auto_370375 - BLOCK
      ?auto_370376 - BLOCK
      ?auto_370377 - BLOCK
      ?auto_370378 - BLOCK
      ?auto_370379 - BLOCK
    )
    :vars
    (
      ?auto_370380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_370379 ?auto_370380 ) ( ON-TABLE ?auto_370365 ) ( ON ?auto_370366 ?auto_370365 ) ( ON ?auto_370367 ?auto_370366 ) ( ON ?auto_370368 ?auto_370367 ) ( ON ?auto_370369 ?auto_370368 ) ( ON ?auto_370370 ?auto_370369 ) ( ON ?auto_370371 ?auto_370370 ) ( ON ?auto_370372 ?auto_370371 ) ( ON ?auto_370373 ?auto_370372 ) ( ON ?auto_370374 ?auto_370373 ) ( not ( = ?auto_370365 ?auto_370366 ) ) ( not ( = ?auto_370365 ?auto_370367 ) ) ( not ( = ?auto_370365 ?auto_370368 ) ) ( not ( = ?auto_370365 ?auto_370369 ) ) ( not ( = ?auto_370365 ?auto_370370 ) ) ( not ( = ?auto_370365 ?auto_370371 ) ) ( not ( = ?auto_370365 ?auto_370372 ) ) ( not ( = ?auto_370365 ?auto_370373 ) ) ( not ( = ?auto_370365 ?auto_370374 ) ) ( not ( = ?auto_370365 ?auto_370375 ) ) ( not ( = ?auto_370365 ?auto_370376 ) ) ( not ( = ?auto_370365 ?auto_370377 ) ) ( not ( = ?auto_370365 ?auto_370378 ) ) ( not ( = ?auto_370365 ?auto_370379 ) ) ( not ( = ?auto_370365 ?auto_370380 ) ) ( not ( = ?auto_370366 ?auto_370367 ) ) ( not ( = ?auto_370366 ?auto_370368 ) ) ( not ( = ?auto_370366 ?auto_370369 ) ) ( not ( = ?auto_370366 ?auto_370370 ) ) ( not ( = ?auto_370366 ?auto_370371 ) ) ( not ( = ?auto_370366 ?auto_370372 ) ) ( not ( = ?auto_370366 ?auto_370373 ) ) ( not ( = ?auto_370366 ?auto_370374 ) ) ( not ( = ?auto_370366 ?auto_370375 ) ) ( not ( = ?auto_370366 ?auto_370376 ) ) ( not ( = ?auto_370366 ?auto_370377 ) ) ( not ( = ?auto_370366 ?auto_370378 ) ) ( not ( = ?auto_370366 ?auto_370379 ) ) ( not ( = ?auto_370366 ?auto_370380 ) ) ( not ( = ?auto_370367 ?auto_370368 ) ) ( not ( = ?auto_370367 ?auto_370369 ) ) ( not ( = ?auto_370367 ?auto_370370 ) ) ( not ( = ?auto_370367 ?auto_370371 ) ) ( not ( = ?auto_370367 ?auto_370372 ) ) ( not ( = ?auto_370367 ?auto_370373 ) ) ( not ( = ?auto_370367 ?auto_370374 ) ) ( not ( = ?auto_370367 ?auto_370375 ) ) ( not ( = ?auto_370367 ?auto_370376 ) ) ( not ( = ?auto_370367 ?auto_370377 ) ) ( not ( = ?auto_370367 ?auto_370378 ) ) ( not ( = ?auto_370367 ?auto_370379 ) ) ( not ( = ?auto_370367 ?auto_370380 ) ) ( not ( = ?auto_370368 ?auto_370369 ) ) ( not ( = ?auto_370368 ?auto_370370 ) ) ( not ( = ?auto_370368 ?auto_370371 ) ) ( not ( = ?auto_370368 ?auto_370372 ) ) ( not ( = ?auto_370368 ?auto_370373 ) ) ( not ( = ?auto_370368 ?auto_370374 ) ) ( not ( = ?auto_370368 ?auto_370375 ) ) ( not ( = ?auto_370368 ?auto_370376 ) ) ( not ( = ?auto_370368 ?auto_370377 ) ) ( not ( = ?auto_370368 ?auto_370378 ) ) ( not ( = ?auto_370368 ?auto_370379 ) ) ( not ( = ?auto_370368 ?auto_370380 ) ) ( not ( = ?auto_370369 ?auto_370370 ) ) ( not ( = ?auto_370369 ?auto_370371 ) ) ( not ( = ?auto_370369 ?auto_370372 ) ) ( not ( = ?auto_370369 ?auto_370373 ) ) ( not ( = ?auto_370369 ?auto_370374 ) ) ( not ( = ?auto_370369 ?auto_370375 ) ) ( not ( = ?auto_370369 ?auto_370376 ) ) ( not ( = ?auto_370369 ?auto_370377 ) ) ( not ( = ?auto_370369 ?auto_370378 ) ) ( not ( = ?auto_370369 ?auto_370379 ) ) ( not ( = ?auto_370369 ?auto_370380 ) ) ( not ( = ?auto_370370 ?auto_370371 ) ) ( not ( = ?auto_370370 ?auto_370372 ) ) ( not ( = ?auto_370370 ?auto_370373 ) ) ( not ( = ?auto_370370 ?auto_370374 ) ) ( not ( = ?auto_370370 ?auto_370375 ) ) ( not ( = ?auto_370370 ?auto_370376 ) ) ( not ( = ?auto_370370 ?auto_370377 ) ) ( not ( = ?auto_370370 ?auto_370378 ) ) ( not ( = ?auto_370370 ?auto_370379 ) ) ( not ( = ?auto_370370 ?auto_370380 ) ) ( not ( = ?auto_370371 ?auto_370372 ) ) ( not ( = ?auto_370371 ?auto_370373 ) ) ( not ( = ?auto_370371 ?auto_370374 ) ) ( not ( = ?auto_370371 ?auto_370375 ) ) ( not ( = ?auto_370371 ?auto_370376 ) ) ( not ( = ?auto_370371 ?auto_370377 ) ) ( not ( = ?auto_370371 ?auto_370378 ) ) ( not ( = ?auto_370371 ?auto_370379 ) ) ( not ( = ?auto_370371 ?auto_370380 ) ) ( not ( = ?auto_370372 ?auto_370373 ) ) ( not ( = ?auto_370372 ?auto_370374 ) ) ( not ( = ?auto_370372 ?auto_370375 ) ) ( not ( = ?auto_370372 ?auto_370376 ) ) ( not ( = ?auto_370372 ?auto_370377 ) ) ( not ( = ?auto_370372 ?auto_370378 ) ) ( not ( = ?auto_370372 ?auto_370379 ) ) ( not ( = ?auto_370372 ?auto_370380 ) ) ( not ( = ?auto_370373 ?auto_370374 ) ) ( not ( = ?auto_370373 ?auto_370375 ) ) ( not ( = ?auto_370373 ?auto_370376 ) ) ( not ( = ?auto_370373 ?auto_370377 ) ) ( not ( = ?auto_370373 ?auto_370378 ) ) ( not ( = ?auto_370373 ?auto_370379 ) ) ( not ( = ?auto_370373 ?auto_370380 ) ) ( not ( = ?auto_370374 ?auto_370375 ) ) ( not ( = ?auto_370374 ?auto_370376 ) ) ( not ( = ?auto_370374 ?auto_370377 ) ) ( not ( = ?auto_370374 ?auto_370378 ) ) ( not ( = ?auto_370374 ?auto_370379 ) ) ( not ( = ?auto_370374 ?auto_370380 ) ) ( not ( = ?auto_370375 ?auto_370376 ) ) ( not ( = ?auto_370375 ?auto_370377 ) ) ( not ( = ?auto_370375 ?auto_370378 ) ) ( not ( = ?auto_370375 ?auto_370379 ) ) ( not ( = ?auto_370375 ?auto_370380 ) ) ( not ( = ?auto_370376 ?auto_370377 ) ) ( not ( = ?auto_370376 ?auto_370378 ) ) ( not ( = ?auto_370376 ?auto_370379 ) ) ( not ( = ?auto_370376 ?auto_370380 ) ) ( not ( = ?auto_370377 ?auto_370378 ) ) ( not ( = ?auto_370377 ?auto_370379 ) ) ( not ( = ?auto_370377 ?auto_370380 ) ) ( not ( = ?auto_370378 ?auto_370379 ) ) ( not ( = ?auto_370378 ?auto_370380 ) ) ( not ( = ?auto_370379 ?auto_370380 ) ) ( ON ?auto_370378 ?auto_370379 ) ( ON ?auto_370377 ?auto_370378 ) ( ON ?auto_370376 ?auto_370377 ) ( CLEAR ?auto_370374 ) ( ON ?auto_370375 ?auto_370376 ) ( CLEAR ?auto_370375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_370365 ?auto_370366 ?auto_370367 ?auto_370368 ?auto_370369 ?auto_370370 ?auto_370371 ?auto_370372 ?auto_370373 ?auto_370374 ?auto_370375 )
      ( MAKE-15PILE ?auto_370365 ?auto_370366 ?auto_370367 ?auto_370368 ?auto_370369 ?auto_370370 ?auto_370371 ?auto_370372 ?auto_370373 ?auto_370374 ?auto_370375 ?auto_370376 ?auto_370377 ?auto_370378 ?auto_370379 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370396 - BLOCK
      ?auto_370397 - BLOCK
      ?auto_370398 - BLOCK
      ?auto_370399 - BLOCK
      ?auto_370400 - BLOCK
      ?auto_370401 - BLOCK
      ?auto_370402 - BLOCK
      ?auto_370403 - BLOCK
      ?auto_370404 - BLOCK
      ?auto_370405 - BLOCK
      ?auto_370406 - BLOCK
      ?auto_370407 - BLOCK
      ?auto_370408 - BLOCK
      ?auto_370409 - BLOCK
      ?auto_370410 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_370410 ) ( ON-TABLE ?auto_370396 ) ( ON ?auto_370397 ?auto_370396 ) ( ON ?auto_370398 ?auto_370397 ) ( ON ?auto_370399 ?auto_370398 ) ( ON ?auto_370400 ?auto_370399 ) ( ON ?auto_370401 ?auto_370400 ) ( ON ?auto_370402 ?auto_370401 ) ( ON ?auto_370403 ?auto_370402 ) ( ON ?auto_370404 ?auto_370403 ) ( ON ?auto_370405 ?auto_370404 ) ( not ( = ?auto_370396 ?auto_370397 ) ) ( not ( = ?auto_370396 ?auto_370398 ) ) ( not ( = ?auto_370396 ?auto_370399 ) ) ( not ( = ?auto_370396 ?auto_370400 ) ) ( not ( = ?auto_370396 ?auto_370401 ) ) ( not ( = ?auto_370396 ?auto_370402 ) ) ( not ( = ?auto_370396 ?auto_370403 ) ) ( not ( = ?auto_370396 ?auto_370404 ) ) ( not ( = ?auto_370396 ?auto_370405 ) ) ( not ( = ?auto_370396 ?auto_370406 ) ) ( not ( = ?auto_370396 ?auto_370407 ) ) ( not ( = ?auto_370396 ?auto_370408 ) ) ( not ( = ?auto_370396 ?auto_370409 ) ) ( not ( = ?auto_370396 ?auto_370410 ) ) ( not ( = ?auto_370397 ?auto_370398 ) ) ( not ( = ?auto_370397 ?auto_370399 ) ) ( not ( = ?auto_370397 ?auto_370400 ) ) ( not ( = ?auto_370397 ?auto_370401 ) ) ( not ( = ?auto_370397 ?auto_370402 ) ) ( not ( = ?auto_370397 ?auto_370403 ) ) ( not ( = ?auto_370397 ?auto_370404 ) ) ( not ( = ?auto_370397 ?auto_370405 ) ) ( not ( = ?auto_370397 ?auto_370406 ) ) ( not ( = ?auto_370397 ?auto_370407 ) ) ( not ( = ?auto_370397 ?auto_370408 ) ) ( not ( = ?auto_370397 ?auto_370409 ) ) ( not ( = ?auto_370397 ?auto_370410 ) ) ( not ( = ?auto_370398 ?auto_370399 ) ) ( not ( = ?auto_370398 ?auto_370400 ) ) ( not ( = ?auto_370398 ?auto_370401 ) ) ( not ( = ?auto_370398 ?auto_370402 ) ) ( not ( = ?auto_370398 ?auto_370403 ) ) ( not ( = ?auto_370398 ?auto_370404 ) ) ( not ( = ?auto_370398 ?auto_370405 ) ) ( not ( = ?auto_370398 ?auto_370406 ) ) ( not ( = ?auto_370398 ?auto_370407 ) ) ( not ( = ?auto_370398 ?auto_370408 ) ) ( not ( = ?auto_370398 ?auto_370409 ) ) ( not ( = ?auto_370398 ?auto_370410 ) ) ( not ( = ?auto_370399 ?auto_370400 ) ) ( not ( = ?auto_370399 ?auto_370401 ) ) ( not ( = ?auto_370399 ?auto_370402 ) ) ( not ( = ?auto_370399 ?auto_370403 ) ) ( not ( = ?auto_370399 ?auto_370404 ) ) ( not ( = ?auto_370399 ?auto_370405 ) ) ( not ( = ?auto_370399 ?auto_370406 ) ) ( not ( = ?auto_370399 ?auto_370407 ) ) ( not ( = ?auto_370399 ?auto_370408 ) ) ( not ( = ?auto_370399 ?auto_370409 ) ) ( not ( = ?auto_370399 ?auto_370410 ) ) ( not ( = ?auto_370400 ?auto_370401 ) ) ( not ( = ?auto_370400 ?auto_370402 ) ) ( not ( = ?auto_370400 ?auto_370403 ) ) ( not ( = ?auto_370400 ?auto_370404 ) ) ( not ( = ?auto_370400 ?auto_370405 ) ) ( not ( = ?auto_370400 ?auto_370406 ) ) ( not ( = ?auto_370400 ?auto_370407 ) ) ( not ( = ?auto_370400 ?auto_370408 ) ) ( not ( = ?auto_370400 ?auto_370409 ) ) ( not ( = ?auto_370400 ?auto_370410 ) ) ( not ( = ?auto_370401 ?auto_370402 ) ) ( not ( = ?auto_370401 ?auto_370403 ) ) ( not ( = ?auto_370401 ?auto_370404 ) ) ( not ( = ?auto_370401 ?auto_370405 ) ) ( not ( = ?auto_370401 ?auto_370406 ) ) ( not ( = ?auto_370401 ?auto_370407 ) ) ( not ( = ?auto_370401 ?auto_370408 ) ) ( not ( = ?auto_370401 ?auto_370409 ) ) ( not ( = ?auto_370401 ?auto_370410 ) ) ( not ( = ?auto_370402 ?auto_370403 ) ) ( not ( = ?auto_370402 ?auto_370404 ) ) ( not ( = ?auto_370402 ?auto_370405 ) ) ( not ( = ?auto_370402 ?auto_370406 ) ) ( not ( = ?auto_370402 ?auto_370407 ) ) ( not ( = ?auto_370402 ?auto_370408 ) ) ( not ( = ?auto_370402 ?auto_370409 ) ) ( not ( = ?auto_370402 ?auto_370410 ) ) ( not ( = ?auto_370403 ?auto_370404 ) ) ( not ( = ?auto_370403 ?auto_370405 ) ) ( not ( = ?auto_370403 ?auto_370406 ) ) ( not ( = ?auto_370403 ?auto_370407 ) ) ( not ( = ?auto_370403 ?auto_370408 ) ) ( not ( = ?auto_370403 ?auto_370409 ) ) ( not ( = ?auto_370403 ?auto_370410 ) ) ( not ( = ?auto_370404 ?auto_370405 ) ) ( not ( = ?auto_370404 ?auto_370406 ) ) ( not ( = ?auto_370404 ?auto_370407 ) ) ( not ( = ?auto_370404 ?auto_370408 ) ) ( not ( = ?auto_370404 ?auto_370409 ) ) ( not ( = ?auto_370404 ?auto_370410 ) ) ( not ( = ?auto_370405 ?auto_370406 ) ) ( not ( = ?auto_370405 ?auto_370407 ) ) ( not ( = ?auto_370405 ?auto_370408 ) ) ( not ( = ?auto_370405 ?auto_370409 ) ) ( not ( = ?auto_370405 ?auto_370410 ) ) ( not ( = ?auto_370406 ?auto_370407 ) ) ( not ( = ?auto_370406 ?auto_370408 ) ) ( not ( = ?auto_370406 ?auto_370409 ) ) ( not ( = ?auto_370406 ?auto_370410 ) ) ( not ( = ?auto_370407 ?auto_370408 ) ) ( not ( = ?auto_370407 ?auto_370409 ) ) ( not ( = ?auto_370407 ?auto_370410 ) ) ( not ( = ?auto_370408 ?auto_370409 ) ) ( not ( = ?auto_370408 ?auto_370410 ) ) ( not ( = ?auto_370409 ?auto_370410 ) ) ( ON ?auto_370409 ?auto_370410 ) ( ON ?auto_370408 ?auto_370409 ) ( ON ?auto_370407 ?auto_370408 ) ( CLEAR ?auto_370405 ) ( ON ?auto_370406 ?auto_370407 ) ( CLEAR ?auto_370406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_370396 ?auto_370397 ?auto_370398 ?auto_370399 ?auto_370400 ?auto_370401 ?auto_370402 ?auto_370403 ?auto_370404 ?auto_370405 ?auto_370406 )
      ( MAKE-15PILE ?auto_370396 ?auto_370397 ?auto_370398 ?auto_370399 ?auto_370400 ?auto_370401 ?auto_370402 ?auto_370403 ?auto_370404 ?auto_370405 ?auto_370406 ?auto_370407 ?auto_370408 ?auto_370409 ?auto_370410 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370426 - BLOCK
      ?auto_370427 - BLOCK
      ?auto_370428 - BLOCK
      ?auto_370429 - BLOCK
      ?auto_370430 - BLOCK
      ?auto_370431 - BLOCK
      ?auto_370432 - BLOCK
      ?auto_370433 - BLOCK
      ?auto_370434 - BLOCK
      ?auto_370435 - BLOCK
      ?auto_370436 - BLOCK
      ?auto_370437 - BLOCK
      ?auto_370438 - BLOCK
      ?auto_370439 - BLOCK
      ?auto_370440 - BLOCK
    )
    :vars
    (
      ?auto_370441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_370440 ?auto_370441 ) ( ON-TABLE ?auto_370426 ) ( ON ?auto_370427 ?auto_370426 ) ( ON ?auto_370428 ?auto_370427 ) ( ON ?auto_370429 ?auto_370428 ) ( ON ?auto_370430 ?auto_370429 ) ( ON ?auto_370431 ?auto_370430 ) ( ON ?auto_370432 ?auto_370431 ) ( ON ?auto_370433 ?auto_370432 ) ( ON ?auto_370434 ?auto_370433 ) ( not ( = ?auto_370426 ?auto_370427 ) ) ( not ( = ?auto_370426 ?auto_370428 ) ) ( not ( = ?auto_370426 ?auto_370429 ) ) ( not ( = ?auto_370426 ?auto_370430 ) ) ( not ( = ?auto_370426 ?auto_370431 ) ) ( not ( = ?auto_370426 ?auto_370432 ) ) ( not ( = ?auto_370426 ?auto_370433 ) ) ( not ( = ?auto_370426 ?auto_370434 ) ) ( not ( = ?auto_370426 ?auto_370435 ) ) ( not ( = ?auto_370426 ?auto_370436 ) ) ( not ( = ?auto_370426 ?auto_370437 ) ) ( not ( = ?auto_370426 ?auto_370438 ) ) ( not ( = ?auto_370426 ?auto_370439 ) ) ( not ( = ?auto_370426 ?auto_370440 ) ) ( not ( = ?auto_370426 ?auto_370441 ) ) ( not ( = ?auto_370427 ?auto_370428 ) ) ( not ( = ?auto_370427 ?auto_370429 ) ) ( not ( = ?auto_370427 ?auto_370430 ) ) ( not ( = ?auto_370427 ?auto_370431 ) ) ( not ( = ?auto_370427 ?auto_370432 ) ) ( not ( = ?auto_370427 ?auto_370433 ) ) ( not ( = ?auto_370427 ?auto_370434 ) ) ( not ( = ?auto_370427 ?auto_370435 ) ) ( not ( = ?auto_370427 ?auto_370436 ) ) ( not ( = ?auto_370427 ?auto_370437 ) ) ( not ( = ?auto_370427 ?auto_370438 ) ) ( not ( = ?auto_370427 ?auto_370439 ) ) ( not ( = ?auto_370427 ?auto_370440 ) ) ( not ( = ?auto_370427 ?auto_370441 ) ) ( not ( = ?auto_370428 ?auto_370429 ) ) ( not ( = ?auto_370428 ?auto_370430 ) ) ( not ( = ?auto_370428 ?auto_370431 ) ) ( not ( = ?auto_370428 ?auto_370432 ) ) ( not ( = ?auto_370428 ?auto_370433 ) ) ( not ( = ?auto_370428 ?auto_370434 ) ) ( not ( = ?auto_370428 ?auto_370435 ) ) ( not ( = ?auto_370428 ?auto_370436 ) ) ( not ( = ?auto_370428 ?auto_370437 ) ) ( not ( = ?auto_370428 ?auto_370438 ) ) ( not ( = ?auto_370428 ?auto_370439 ) ) ( not ( = ?auto_370428 ?auto_370440 ) ) ( not ( = ?auto_370428 ?auto_370441 ) ) ( not ( = ?auto_370429 ?auto_370430 ) ) ( not ( = ?auto_370429 ?auto_370431 ) ) ( not ( = ?auto_370429 ?auto_370432 ) ) ( not ( = ?auto_370429 ?auto_370433 ) ) ( not ( = ?auto_370429 ?auto_370434 ) ) ( not ( = ?auto_370429 ?auto_370435 ) ) ( not ( = ?auto_370429 ?auto_370436 ) ) ( not ( = ?auto_370429 ?auto_370437 ) ) ( not ( = ?auto_370429 ?auto_370438 ) ) ( not ( = ?auto_370429 ?auto_370439 ) ) ( not ( = ?auto_370429 ?auto_370440 ) ) ( not ( = ?auto_370429 ?auto_370441 ) ) ( not ( = ?auto_370430 ?auto_370431 ) ) ( not ( = ?auto_370430 ?auto_370432 ) ) ( not ( = ?auto_370430 ?auto_370433 ) ) ( not ( = ?auto_370430 ?auto_370434 ) ) ( not ( = ?auto_370430 ?auto_370435 ) ) ( not ( = ?auto_370430 ?auto_370436 ) ) ( not ( = ?auto_370430 ?auto_370437 ) ) ( not ( = ?auto_370430 ?auto_370438 ) ) ( not ( = ?auto_370430 ?auto_370439 ) ) ( not ( = ?auto_370430 ?auto_370440 ) ) ( not ( = ?auto_370430 ?auto_370441 ) ) ( not ( = ?auto_370431 ?auto_370432 ) ) ( not ( = ?auto_370431 ?auto_370433 ) ) ( not ( = ?auto_370431 ?auto_370434 ) ) ( not ( = ?auto_370431 ?auto_370435 ) ) ( not ( = ?auto_370431 ?auto_370436 ) ) ( not ( = ?auto_370431 ?auto_370437 ) ) ( not ( = ?auto_370431 ?auto_370438 ) ) ( not ( = ?auto_370431 ?auto_370439 ) ) ( not ( = ?auto_370431 ?auto_370440 ) ) ( not ( = ?auto_370431 ?auto_370441 ) ) ( not ( = ?auto_370432 ?auto_370433 ) ) ( not ( = ?auto_370432 ?auto_370434 ) ) ( not ( = ?auto_370432 ?auto_370435 ) ) ( not ( = ?auto_370432 ?auto_370436 ) ) ( not ( = ?auto_370432 ?auto_370437 ) ) ( not ( = ?auto_370432 ?auto_370438 ) ) ( not ( = ?auto_370432 ?auto_370439 ) ) ( not ( = ?auto_370432 ?auto_370440 ) ) ( not ( = ?auto_370432 ?auto_370441 ) ) ( not ( = ?auto_370433 ?auto_370434 ) ) ( not ( = ?auto_370433 ?auto_370435 ) ) ( not ( = ?auto_370433 ?auto_370436 ) ) ( not ( = ?auto_370433 ?auto_370437 ) ) ( not ( = ?auto_370433 ?auto_370438 ) ) ( not ( = ?auto_370433 ?auto_370439 ) ) ( not ( = ?auto_370433 ?auto_370440 ) ) ( not ( = ?auto_370433 ?auto_370441 ) ) ( not ( = ?auto_370434 ?auto_370435 ) ) ( not ( = ?auto_370434 ?auto_370436 ) ) ( not ( = ?auto_370434 ?auto_370437 ) ) ( not ( = ?auto_370434 ?auto_370438 ) ) ( not ( = ?auto_370434 ?auto_370439 ) ) ( not ( = ?auto_370434 ?auto_370440 ) ) ( not ( = ?auto_370434 ?auto_370441 ) ) ( not ( = ?auto_370435 ?auto_370436 ) ) ( not ( = ?auto_370435 ?auto_370437 ) ) ( not ( = ?auto_370435 ?auto_370438 ) ) ( not ( = ?auto_370435 ?auto_370439 ) ) ( not ( = ?auto_370435 ?auto_370440 ) ) ( not ( = ?auto_370435 ?auto_370441 ) ) ( not ( = ?auto_370436 ?auto_370437 ) ) ( not ( = ?auto_370436 ?auto_370438 ) ) ( not ( = ?auto_370436 ?auto_370439 ) ) ( not ( = ?auto_370436 ?auto_370440 ) ) ( not ( = ?auto_370436 ?auto_370441 ) ) ( not ( = ?auto_370437 ?auto_370438 ) ) ( not ( = ?auto_370437 ?auto_370439 ) ) ( not ( = ?auto_370437 ?auto_370440 ) ) ( not ( = ?auto_370437 ?auto_370441 ) ) ( not ( = ?auto_370438 ?auto_370439 ) ) ( not ( = ?auto_370438 ?auto_370440 ) ) ( not ( = ?auto_370438 ?auto_370441 ) ) ( not ( = ?auto_370439 ?auto_370440 ) ) ( not ( = ?auto_370439 ?auto_370441 ) ) ( not ( = ?auto_370440 ?auto_370441 ) ) ( ON ?auto_370439 ?auto_370440 ) ( ON ?auto_370438 ?auto_370439 ) ( ON ?auto_370437 ?auto_370438 ) ( ON ?auto_370436 ?auto_370437 ) ( CLEAR ?auto_370434 ) ( ON ?auto_370435 ?auto_370436 ) ( CLEAR ?auto_370435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_370426 ?auto_370427 ?auto_370428 ?auto_370429 ?auto_370430 ?auto_370431 ?auto_370432 ?auto_370433 ?auto_370434 ?auto_370435 )
      ( MAKE-15PILE ?auto_370426 ?auto_370427 ?auto_370428 ?auto_370429 ?auto_370430 ?auto_370431 ?auto_370432 ?auto_370433 ?auto_370434 ?auto_370435 ?auto_370436 ?auto_370437 ?auto_370438 ?auto_370439 ?auto_370440 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370457 - BLOCK
      ?auto_370458 - BLOCK
      ?auto_370459 - BLOCK
      ?auto_370460 - BLOCK
      ?auto_370461 - BLOCK
      ?auto_370462 - BLOCK
      ?auto_370463 - BLOCK
      ?auto_370464 - BLOCK
      ?auto_370465 - BLOCK
      ?auto_370466 - BLOCK
      ?auto_370467 - BLOCK
      ?auto_370468 - BLOCK
      ?auto_370469 - BLOCK
      ?auto_370470 - BLOCK
      ?auto_370471 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_370471 ) ( ON-TABLE ?auto_370457 ) ( ON ?auto_370458 ?auto_370457 ) ( ON ?auto_370459 ?auto_370458 ) ( ON ?auto_370460 ?auto_370459 ) ( ON ?auto_370461 ?auto_370460 ) ( ON ?auto_370462 ?auto_370461 ) ( ON ?auto_370463 ?auto_370462 ) ( ON ?auto_370464 ?auto_370463 ) ( ON ?auto_370465 ?auto_370464 ) ( not ( = ?auto_370457 ?auto_370458 ) ) ( not ( = ?auto_370457 ?auto_370459 ) ) ( not ( = ?auto_370457 ?auto_370460 ) ) ( not ( = ?auto_370457 ?auto_370461 ) ) ( not ( = ?auto_370457 ?auto_370462 ) ) ( not ( = ?auto_370457 ?auto_370463 ) ) ( not ( = ?auto_370457 ?auto_370464 ) ) ( not ( = ?auto_370457 ?auto_370465 ) ) ( not ( = ?auto_370457 ?auto_370466 ) ) ( not ( = ?auto_370457 ?auto_370467 ) ) ( not ( = ?auto_370457 ?auto_370468 ) ) ( not ( = ?auto_370457 ?auto_370469 ) ) ( not ( = ?auto_370457 ?auto_370470 ) ) ( not ( = ?auto_370457 ?auto_370471 ) ) ( not ( = ?auto_370458 ?auto_370459 ) ) ( not ( = ?auto_370458 ?auto_370460 ) ) ( not ( = ?auto_370458 ?auto_370461 ) ) ( not ( = ?auto_370458 ?auto_370462 ) ) ( not ( = ?auto_370458 ?auto_370463 ) ) ( not ( = ?auto_370458 ?auto_370464 ) ) ( not ( = ?auto_370458 ?auto_370465 ) ) ( not ( = ?auto_370458 ?auto_370466 ) ) ( not ( = ?auto_370458 ?auto_370467 ) ) ( not ( = ?auto_370458 ?auto_370468 ) ) ( not ( = ?auto_370458 ?auto_370469 ) ) ( not ( = ?auto_370458 ?auto_370470 ) ) ( not ( = ?auto_370458 ?auto_370471 ) ) ( not ( = ?auto_370459 ?auto_370460 ) ) ( not ( = ?auto_370459 ?auto_370461 ) ) ( not ( = ?auto_370459 ?auto_370462 ) ) ( not ( = ?auto_370459 ?auto_370463 ) ) ( not ( = ?auto_370459 ?auto_370464 ) ) ( not ( = ?auto_370459 ?auto_370465 ) ) ( not ( = ?auto_370459 ?auto_370466 ) ) ( not ( = ?auto_370459 ?auto_370467 ) ) ( not ( = ?auto_370459 ?auto_370468 ) ) ( not ( = ?auto_370459 ?auto_370469 ) ) ( not ( = ?auto_370459 ?auto_370470 ) ) ( not ( = ?auto_370459 ?auto_370471 ) ) ( not ( = ?auto_370460 ?auto_370461 ) ) ( not ( = ?auto_370460 ?auto_370462 ) ) ( not ( = ?auto_370460 ?auto_370463 ) ) ( not ( = ?auto_370460 ?auto_370464 ) ) ( not ( = ?auto_370460 ?auto_370465 ) ) ( not ( = ?auto_370460 ?auto_370466 ) ) ( not ( = ?auto_370460 ?auto_370467 ) ) ( not ( = ?auto_370460 ?auto_370468 ) ) ( not ( = ?auto_370460 ?auto_370469 ) ) ( not ( = ?auto_370460 ?auto_370470 ) ) ( not ( = ?auto_370460 ?auto_370471 ) ) ( not ( = ?auto_370461 ?auto_370462 ) ) ( not ( = ?auto_370461 ?auto_370463 ) ) ( not ( = ?auto_370461 ?auto_370464 ) ) ( not ( = ?auto_370461 ?auto_370465 ) ) ( not ( = ?auto_370461 ?auto_370466 ) ) ( not ( = ?auto_370461 ?auto_370467 ) ) ( not ( = ?auto_370461 ?auto_370468 ) ) ( not ( = ?auto_370461 ?auto_370469 ) ) ( not ( = ?auto_370461 ?auto_370470 ) ) ( not ( = ?auto_370461 ?auto_370471 ) ) ( not ( = ?auto_370462 ?auto_370463 ) ) ( not ( = ?auto_370462 ?auto_370464 ) ) ( not ( = ?auto_370462 ?auto_370465 ) ) ( not ( = ?auto_370462 ?auto_370466 ) ) ( not ( = ?auto_370462 ?auto_370467 ) ) ( not ( = ?auto_370462 ?auto_370468 ) ) ( not ( = ?auto_370462 ?auto_370469 ) ) ( not ( = ?auto_370462 ?auto_370470 ) ) ( not ( = ?auto_370462 ?auto_370471 ) ) ( not ( = ?auto_370463 ?auto_370464 ) ) ( not ( = ?auto_370463 ?auto_370465 ) ) ( not ( = ?auto_370463 ?auto_370466 ) ) ( not ( = ?auto_370463 ?auto_370467 ) ) ( not ( = ?auto_370463 ?auto_370468 ) ) ( not ( = ?auto_370463 ?auto_370469 ) ) ( not ( = ?auto_370463 ?auto_370470 ) ) ( not ( = ?auto_370463 ?auto_370471 ) ) ( not ( = ?auto_370464 ?auto_370465 ) ) ( not ( = ?auto_370464 ?auto_370466 ) ) ( not ( = ?auto_370464 ?auto_370467 ) ) ( not ( = ?auto_370464 ?auto_370468 ) ) ( not ( = ?auto_370464 ?auto_370469 ) ) ( not ( = ?auto_370464 ?auto_370470 ) ) ( not ( = ?auto_370464 ?auto_370471 ) ) ( not ( = ?auto_370465 ?auto_370466 ) ) ( not ( = ?auto_370465 ?auto_370467 ) ) ( not ( = ?auto_370465 ?auto_370468 ) ) ( not ( = ?auto_370465 ?auto_370469 ) ) ( not ( = ?auto_370465 ?auto_370470 ) ) ( not ( = ?auto_370465 ?auto_370471 ) ) ( not ( = ?auto_370466 ?auto_370467 ) ) ( not ( = ?auto_370466 ?auto_370468 ) ) ( not ( = ?auto_370466 ?auto_370469 ) ) ( not ( = ?auto_370466 ?auto_370470 ) ) ( not ( = ?auto_370466 ?auto_370471 ) ) ( not ( = ?auto_370467 ?auto_370468 ) ) ( not ( = ?auto_370467 ?auto_370469 ) ) ( not ( = ?auto_370467 ?auto_370470 ) ) ( not ( = ?auto_370467 ?auto_370471 ) ) ( not ( = ?auto_370468 ?auto_370469 ) ) ( not ( = ?auto_370468 ?auto_370470 ) ) ( not ( = ?auto_370468 ?auto_370471 ) ) ( not ( = ?auto_370469 ?auto_370470 ) ) ( not ( = ?auto_370469 ?auto_370471 ) ) ( not ( = ?auto_370470 ?auto_370471 ) ) ( ON ?auto_370470 ?auto_370471 ) ( ON ?auto_370469 ?auto_370470 ) ( ON ?auto_370468 ?auto_370469 ) ( ON ?auto_370467 ?auto_370468 ) ( CLEAR ?auto_370465 ) ( ON ?auto_370466 ?auto_370467 ) ( CLEAR ?auto_370466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_370457 ?auto_370458 ?auto_370459 ?auto_370460 ?auto_370461 ?auto_370462 ?auto_370463 ?auto_370464 ?auto_370465 ?auto_370466 )
      ( MAKE-15PILE ?auto_370457 ?auto_370458 ?auto_370459 ?auto_370460 ?auto_370461 ?auto_370462 ?auto_370463 ?auto_370464 ?auto_370465 ?auto_370466 ?auto_370467 ?auto_370468 ?auto_370469 ?auto_370470 ?auto_370471 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370487 - BLOCK
      ?auto_370488 - BLOCK
      ?auto_370489 - BLOCK
      ?auto_370490 - BLOCK
      ?auto_370491 - BLOCK
      ?auto_370492 - BLOCK
      ?auto_370493 - BLOCK
      ?auto_370494 - BLOCK
      ?auto_370495 - BLOCK
      ?auto_370496 - BLOCK
      ?auto_370497 - BLOCK
      ?auto_370498 - BLOCK
      ?auto_370499 - BLOCK
      ?auto_370500 - BLOCK
      ?auto_370501 - BLOCK
    )
    :vars
    (
      ?auto_370502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_370501 ?auto_370502 ) ( ON-TABLE ?auto_370487 ) ( ON ?auto_370488 ?auto_370487 ) ( ON ?auto_370489 ?auto_370488 ) ( ON ?auto_370490 ?auto_370489 ) ( ON ?auto_370491 ?auto_370490 ) ( ON ?auto_370492 ?auto_370491 ) ( ON ?auto_370493 ?auto_370492 ) ( ON ?auto_370494 ?auto_370493 ) ( not ( = ?auto_370487 ?auto_370488 ) ) ( not ( = ?auto_370487 ?auto_370489 ) ) ( not ( = ?auto_370487 ?auto_370490 ) ) ( not ( = ?auto_370487 ?auto_370491 ) ) ( not ( = ?auto_370487 ?auto_370492 ) ) ( not ( = ?auto_370487 ?auto_370493 ) ) ( not ( = ?auto_370487 ?auto_370494 ) ) ( not ( = ?auto_370487 ?auto_370495 ) ) ( not ( = ?auto_370487 ?auto_370496 ) ) ( not ( = ?auto_370487 ?auto_370497 ) ) ( not ( = ?auto_370487 ?auto_370498 ) ) ( not ( = ?auto_370487 ?auto_370499 ) ) ( not ( = ?auto_370487 ?auto_370500 ) ) ( not ( = ?auto_370487 ?auto_370501 ) ) ( not ( = ?auto_370487 ?auto_370502 ) ) ( not ( = ?auto_370488 ?auto_370489 ) ) ( not ( = ?auto_370488 ?auto_370490 ) ) ( not ( = ?auto_370488 ?auto_370491 ) ) ( not ( = ?auto_370488 ?auto_370492 ) ) ( not ( = ?auto_370488 ?auto_370493 ) ) ( not ( = ?auto_370488 ?auto_370494 ) ) ( not ( = ?auto_370488 ?auto_370495 ) ) ( not ( = ?auto_370488 ?auto_370496 ) ) ( not ( = ?auto_370488 ?auto_370497 ) ) ( not ( = ?auto_370488 ?auto_370498 ) ) ( not ( = ?auto_370488 ?auto_370499 ) ) ( not ( = ?auto_370488 ?auto_370500 ) ) ( not ( = ?auto_370488 ?auto_370501 ) ) ( not ( = ?auto_370488 ?auto_370502 ) ) ( not ( = ?auto_370489 ?auto_370490 ) ) ( not ( = ?auto_370489 ?auto_370491 ) ) ( not ( = ?auto_370489 ?auto_370492 ) ) ( not ( = ?auto_370489 ?auto_370493 ) ) ( not ( = ?auto_370489 ?auto_370494 ) ) ( not ( = ?auto_370489 ?auto_370495 ) ) ( not ( = ?auto_370489 ?auto_370496 ) ) ( not ( = ?auto_370489 ?auto_370497 ) ) ( not ( = ?auto_370489 ?auto_370498 ) ) ( not ( = ?auto_370489 ?auto_370499 ) ) ( not ( = ?auto_370489 ?auto_370500 ) ) ( not ( = ?auto_370489 ?auto_370501 ) ) ( not ( = ?auto_370489 ?auto_370502 ) ) ( not ( = ?auto_370490 ?auto_370491 ) ) ( not ( = ?auto_370490 ?auto_370492 ) ) ( not ( = ?auto_370490 ?auto_370493 ) ) ( not ( = ?auto_370490 ?auto_370494 ) ) ( not ( = ?auto_370490 ?auto_370495 ) ) ( not ( = ?auto_370490 ?auto_370496 ) ) ( not ( = ?auto_370490 ?auto_370497 ) ) ( not ( = ?auto_370490 ?auto_370498 ) ) ( not ( = ?auto_370490 ?auto_370499 ) ) ( not ( = ?auto_370490 ?auto_370500 ) ) ( not ( = ?auto_370490 ?auto_370501 ) ) ( not ( = ?auto_370490 ?auto_370502 ) ) ( not ( = ?auto_370491 ?auto_370492 ) ) ( not ( = ?auto_370491 ?auto_370493 ) ) ( not ( = ?auto_370491 ?auto_370494 ) ) ( not ( = ?auto_370491 ?auto_370495 ) ) ( not ( = ?auto_370491 ?auto_370496 ) ) ( not ( = ?auto_370491 ?auto_370497 ) ) ( not ( = ?auto_370491 ?auto_370498 ) ) ( not ( = ?auto_370491 ?auto_370499 ) ) ( not ( = ?auto_370491 ?auto_370500 ) ) ( not ( = ?auto_370491 ?auto_370501 ) ) ( not ( = ?auto_370491 ?auto_370502 ) ) ( not ( = ?auto_370492 ?auto_370493 ) ) ( not ( = ?auto_370492 ?auto_370494 ) ) ( not ( = ?auto_370492 ?auto_370495 ) ) ( not ( = ?auto_370492 ?auto_370496 ) ) ( not ( = ?auto_370492 ?auto_370497 ) ) ( not ( = ?auto_370492 ?auto_370498 ) ) ( not ( = ?auto_370492 ?auto_370499 ) ) ( not ( = ?auto_370492 ?auto_370500 ) ) ( not ( = ?auto_370492 ?auto_370501 ) ) ( not ( = ?auto_370492 ?auto_370502 ) ) ( not ( = ?auto_370493 ?auto_370494 ) ) ( not ( = ?auto_370493 ?auto_370495 ) ) ( not ( = ?auto_370493 ?auto_370496 ) ) ( not ( = ?auto_370493 ?auto_370497 ) ) ( not ( = ?auto_370493 ?auto_370498 ) ) ( not ( = ?auto_370493 ?auto_370499 ) ) ( not ( = ?auto_370493 ?auto_370500 ) ) ( not ( = ?auto_370493 ?auto_370501 ) ) ( not ( = ?auto_370493 ?auto_370502 ) ) ( not ( = ?auto_370494 ?auto_370495 ) ) ( not ( = ?auto_370494 ?auto_370496 ) ) ( not ( = ?auto_370494 ?auto_370497 ) ) ( not ( = ?auto_370494 ?auto_370498 ) ) ( not ( = ?auto_370494 ?auto_370499 ) ) ( not ( = ?auto_370494 ?auto_370500 ) ) ( not ( = ?auto_370494 ?auto_370501 ) ) ( not ( = ?auto_370494 ?auto_370502 ) ) ( not ( = ?auto_370495 ?auto_370496 ) ) ( not ( = ?auto_370495 ?auto_370497 ) ) ( not ( = ?auto_370495 ?auto_370498 ) ) ( not ( = ?auto_370495 ?auto_370499 ) ) ( not ( = ?auto_370495 ?auto_370500 ) ) ( not ( = ?auto_370495 ?auto_370501 ) ) ( not ( = ?auto_370495 ?auto_370502 ) ) ( not ( = ?auto_370496 ?auto_370497 ) ) ( not ( = ?auto_370496 ?auto_370498 ) ) ( not ( = ?auto_370496 ?auto_370499 ) ) ( not ( = ?auto_370496 ?auto_370500 ) ) ( not ( = ?auto_370496 ?auto_370501 ) ) ( not ( = ?auto_370496 ?auto_370502 ) ) ( not ( = ?auto_370497 ?auto_370498 ) ) ( not ( = ?auto_370497 ?auto_370499 ) ) ( not ( = ?auto_370497 ?auto_370500 ) ) ( not ( = ?auto_370497 ?auto_370501 ) ) ( not ( = ?auto_370497 ?auto_370502 ) ) ( not ( = ?auto_370498 ?auto_370499 ) ) ( not ( = ?auto_370498 ?auto_370500 ) ) ( not ( = ?auto_370498 ?auto_370501 ) ) ( not ( = ?auto_370498 ?auto_370502 ) ) ( not ( = ?auto_370499 ?auto_370500 ) ) ( not ( = ?auto_370499 ?auto_370501 ) ) ( not ( = ?auto_370499 ?auto_370502 ) ) ( not ( = ?auto_370500 ?auto_370501 ) ) ( not ( = ?auto_370500 ?auto_370502 ) ) ( not ( = ?auto_370501 ?auto_370502 ) ) ( ON ?auto_370500 ?auto_370501 ) ( ON ?auto_370499 ?auto_370500 ) ( ON ?auto_370498 ?auto_370499 ) ( ON ?auto_370497 ?auto_370498 ) ( ON ?auto_370496 ?auto_370497 ) ( CLEAR ?auto_370494 ) ( ON ?auto_370495 ?auto_370496 ) ( CLEAR ?auto_370495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_370487 ?auto_370488 ?auto_370489 ?auto_370490 ?auto_370491 ?auto_370492 ?auto_370493 ?auto_370494 ?auto_370495 )
      ( MAKE-15PILE ?auto_370487 ?auto_370488 ?auto_370489 ?auto_370490 ?auto_370491 ?auto_370492 ?auto_370493 ?auto_370494 ?auto_370495 ?auto_370496 ?auto_370497 ?auto_370498 ?auto_370499 ?auto_370500 ?auto_370501 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370518 - BLOCK
      ?auto_370519 - BLOCK
      ?auto_370520 - BLOCK
      ?auto_370521 - BLOCK
      ?auto_370522 - BLOCK
      ?auto_370523 - BLOCK
      ?auto_370524 - BLOCK
      ?auto_370525 - BLOCK
      ?auto_370526 - BLOCK
      ?auto_370527 - BLOCK
      ?auto_370528 - BLOCK
      ?auto_370529 - BLOCK
      ?auto_370530 - BLOCK
      ?auto_370531 - BLOCK
      ?auto_370532 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_370532 ) ( ON-TABLE ?auto_370518 ) ( ON ?auto_370519 ?auto_370518 ) ( ON ?auto_370520 ?auto_370519 ) ( ON ?auto_370521 ?auto_370520 ) ( ON ?auto_370522 ?auto_370521 ) ( ON ?auto_370523 ?auto_370522 ) ( ON ?auto_370524 ?auto_370523 ) ( ON ?auto_370525 ?auto_370524 ) ( not ( = ?auto_370518 ?auto_370519 ) ) ( not ( = ?auto_370518 ?auto_370520 ) ) ( not ( = ?auto_370518 ?auto_370521 ) ) ( not ( = ?auto_370518 ?auto_370522 ) ) ( not ( = ?auto_370518 ?auto_370523 ) ) ( not ( = ?auto_370518 ?auto_370524 ) ) ( not ( = ?auto_370518 ?auto_370525 ) ) ( not ( = ?auto_370518 ?auto_370526 ) ) ( not ( = ?auto_370518 ?auto_370527 ) ) ( not ( = ?auto_370518 ?auto_370528 ) ) ( not ( = ?auto_370518 ?auto_370529 ) ) ( not ( = ?auto_370518 ?auto_370530 ) ) ( not ( = ?auto_370518 ?auto_370531 ) ) ( not ( = ?auto_370518 ?auto_370532 ) ) ( not ( = ?auto_370519 ?auto_370520 ) ) ( not ( = ?auto_370519 ?auto_370521 ) ) ( not ( = ?auto_370519 ?auto_370522 ) ) ( not ( = ?auto_370519 ?auto_370523 ) ) ( not ( = ?auto_370519 ?auto_370524 ) ) ( not ( = ?auto_370519 ?auto_370525 ) ) ( not ( = ?auto_370519 ?auto_370526 ) ) ( not ( = ?auto_370519 ?auto_370527 ) ) ( not ( = ?auto_370519 ?auto_370528 ) ) ( not ( = ?auto_370519 ?auto_370529 ) ) ( not ( = ?auto_370519 ?auto_370530 ) ) ( not ( = ?auto_370519 ?auto_370531 ) ) ( not ( = ?auto_370519 ?auto_370532 ) ) ( not ( = ?auto_370520 ?auto_370521 ) ) ( not ( = ?auto_370520 ?auto_370522 ) ) ( not ( = ?auto_370520 ?auto_370523 ) ) ( not ( = ?auto_370520 ?auto_370524 ) ) ( not ( = ?auto_370520 ?auto_370525 ) ) ( not ( = ?auto_370520 ?auto_370526 ) ) ( not ( = ?auto_370520 ?auto_370527 ) ) ( not ( = ?auto_370520 ?auto_370528 ) ) ( not ( = ?auto_370520 ?auto_370529 ) ) ( not ( = ?auto_370520 ?auto_370530 ) ) ( not ( = ?auto_370520 ?auto_370531 ) ) ( not ( = ?auto_370520 ?auto_370532 ) ) ( not ( = ?auto_370521 ?auto_370522 ) ) ( not ( = ?auto_370521 ?auto_370523 ) ) ( not ( = ?auto_370521 ?auto_370524 ) ) ( not ( = ?auto_370521 ?auto_370525 ) ) ( not ( = ?auto_370521 ?auto_370526 ) ) ( not ( = ?auto_370521 ?auto_370527 ) ) ( not ( = ?auto_370521 ?auto_370528 ) ) ( not ( = ?auto_370521 ?auto_370529 ) ) ( not ( = ?auto_370521 ?auto_370530 ) ) ( not ( = ?auto_370521 ?auto_370531 ) ) ( not ( = ?auto_370521 ?auto_370532 ) ) ( not ( = ?auto_370522 ?auto_370523 ) ) ( not ( = ?auto_370522 ?auto_370524 ) ) ( not ( = ?auto_370522 ?auto_370525 ) ) ( not ( = ?auto_370522 ?auto_370526 ) ) ( not ( = ?auto_370522 ?auto_370527 ) ) ( not ( = ?auto_370522 ?auto_370528 ) ) ( not ( = ?auto_370522 ?auto_370529 ) ) ( not ( = ?auto_370522 ?auto_370530 ) ) ( not ( = ?auto_370522 ?auto_370531 ) ) ( not ( = ?auto_370522 ?auto_370532 ) ) ( not ( = ?auto_370523 ?auto_370524 ) ) ( not ( = ?auto_370523 ?auto_370525 ) ) ( not ( = ?auto_370523 ?auto_370526 ) ) ( not ( = ?auto_370523 ?auto_370527 ) ) ( not ( = ?auto_370523 ?auto_370528 ) ) ( not ( = ?auto_370523 ?auto_370529 ) ) ( not ( = ?auto_370523 ?auto_370530 ) ) ( not ( = ?auto_370523 ?auto_370531 ) ) ( not ( = ?auto_370523 ?auto_370532 ) ) ( not ( = ?auto_370524 ?auto_370525 ) ) ( not ( = ?auto_370524 ?auto_370526 ) ) ( not ( = ?auto_370524 ?auto_370527 ) ) ( not ( = ?auto_370524 ?auto_370528 ) ) ( not ( = ?auto_370524 ?auto_370529 ) ) ( not ( = ?auto_370524 ?auto_370530 ) ) ( not ( = ?auto_370524 ?auto_370531 ) ) ( not ( = ?auto_370524 ?auto_370532 ) ) ( not ( = ?auto_370525 ?auto_370526 ) ) ( not ( = ?auto_370525 ?auto_370527 ) ) ( not ( = ?auto_370525 ?auto_370528 ) ) ( not ( = ?auto_370525 ?auto_370529 ) ) ( not ( = ?auto_370525 ?auto_370530 ) ) ( not ( = ?auto_370525 ?auto_370531 ) ) ( not ( = ?auto_370525 ?auto_370532 ) ) ( not ( = ?auto_370526 ?auto_370527 ) ) ( not ( = ?auto_370526 ?auto_370528 ) ) ( not ( = ?auto_370526 ?auto_370529 ) ) ( not ( = ?auto_370526 ?auto_370530 ) ) ( not ( = ?auto_370526 ?auto_370531 ) ) ( not ( = ?auto_370526 ?auto_370532 ) ) ( not ( = ?auto_370527 ?auto_370528 ) ) ( not ( = ?auto_370527 ?auto_370529 ) ) ( not ( = ?auto_370527 ?auto_370530 ) ) ( not ( = ?auto_370527 ?auto_370531 ) ) ( not ( = ?auto_370527 ?auto_370532 ) ) ( not ( = ?auto_370528 ?auto_370529 ) ) ( not ( = ?auto_370528 ?auto_370530 ) ) ( not ( = ?auto_370528 ?auto_370531 ) ) ( not ( = ?auto_370528 ?auto_370532 ) ) ( not ( = ?auto_370529 ?auto_370530 ) ) ( not ( = ?auto_370529 ?auto_370531 ) ) ( not ( = ?auto_370529 ?auto_370532 ) ) ( not ( = ?auto_370530 ?auto_370531 ) ) ( not ( = ?auto_370530 ?auto_370532 ) ) ( not ( = ?auto_370531 ?auto_370532 ) ) ( ON ?auto_370531 ?auto_370532 ) ( ON ?auto_370530 ?auto_370531 ) ( ON ?auto_370529 ?auto_370530 ) ( ON ?auto_370528 ?auto_370529 ) ( ON ?auto_370527 ?auto_370528 ) ( CLEAR ?auto_370525 ) ( ON ?auto_370526 ?auto_370527 ) ( CLEAR ?auto_370526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_370518 ?auto_370519 ?auto_370520 ?auto_370521 ?auto_370522 ?auto_370523 ?auto_370524 ?auto_370525 ?auto_370526 )
      ( MAKE-15PILE ?auto_370518 ?auto_370519 ?auto_370520 ?auto_370521 ?auto_370522 ?auto_370523 ?auto_370524 ?auto_370525 ?auto_370526 ?auto_370527 ?auto_370528 ?auto_370529 ?auto_370530 ?auto_370531 ?auto_370532 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370548 - BLOCK
      ?auto_370549 - BLOCK
      ?auto_370550 - BLOCK
      ?auto_370551 - BLOCK
      ?auto_370552 - BLOCK
      ?auto_370553 - BLOCK
      ?auto_370554 - BLOCK
      ?auto_370555 - BLOCK
      ?auto_370556 - BLOCK
      ?auto_370557 - BLOCK
      ?auto_370558 - BLOCK
      ?auto_370559 - BLOCK
      ?auto_370560 - BLOCK
      ?auto_370561 - BLOCK
      ?auto_370562 - BLOCK
    )
    :vars
    (
      ?auto_370563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_370562 ?auto_370563 ) ( ON-TABLE ?auto_370548 ) ( ON ?auto_370549 ?auto_370548 ) ( ON ?auto_370550 ?auto_370549 ) ( ON ?auto_370551 ?auto_370550 ) ( ON ?auto_370552 ?auto_370551 ) ( ON ?auto_370553 ?auto_370552 ) ( ON ?auto_370554 ?auto_370553 ) ( not ( = ?auto_370548 ?auto_370549 ) ) ( not ( = ?auto_370548 ?auto_370550 ) ) ( not ( = ?auto_370548 ?auto_370551 ) ) ( not ( = ?auto_370548 ?auto_370552 ) ) ( not ( = ?auto_370548 ?auto_370553 ) ) ( not ( = ?auto_370548 ?auto_370554 ) ) ( not ( = ?auto_370548 ?auto_370555 ) ) ( not ( = ?auto_370548 ?auto_370556 ) ) ( not ( = ?auto_370548 ?auto_370557 ) ) ( not ( = ?auto_370548 ?auto_370558 ) ) ( not ( = ?auto_370548 ?auto_370559 ) ) ( not ( = ?auto_370548 ?auto_370560 ) ) ( not ( = ?auto_370548 ?auto_370561 ) ) ( not ( = ?auto_370548 ?auto_370562 ) ) ( not ( = ?auto_370548 ?auto_370563 ) ) ( not ( = ?auto_370549 ?auto_370550 ) ) ( not ( = ?auto_370549 ?auto_370551 ) ) ( not ( = ?auto_370549 ?auto_370552 ) ) ( not ( = ?auto_370549 ?auto_370553 ) ) ( not ( = ?auto_370549 ?auto_370554 ) ) ( not ( = ?auto_370549 ?auto_370555 ) ) ( not ( = ?auto_370549 ?auto_370556 ) ) ( not ( = ?auto_370549 ?auto_370557 ) ) ( not ( = ?auto_370549 ?auto_370558 ) ) ( not ( = ?auto_370549 ?auto_370559 ) ) ( not ( = ?auto_370549 ?auto_370560 ) ) ( not ( = ?auto_370549 ?auto_370561 ) ) ( not ( = ?auto_370549 ?auto_370562 ) ) ( not ( = ?auto_370549 ?auto_370563 ) ) ( not ( = ?auto_370550 ?auto_370551 ) ) ( not ( = ?auto_370550 ?auto_370552 ) ) ( not ( = ?auto_370550 ?auto_370553 ) ) ( not ( = ?auto_370550 ?auto_370554 ) ) ( not ( = ?auto_370550 ?auto_370555 ) ) ( not ( = ?auto_370550 ?auto_370556 ) ) ( not ( = ?auto_370550 ?auto_370557 ) ) ( not ( = ?auto_370550 ?auto_370558 ) ) ( not ( = ?auto_370550 ?auto_370559 ) ) ( not ( = ?auto_370550 ?auto_370560 ) ) ( not ( = ?auto_370550 ?auto_370561 ) ) ( not ( = ?auto_370550 ?auto_370562 ) ) ( not ( = ?auto_370550 ?auto_370563 ) ) ( not ( = ?auto_370551 ?auto_370552 ) ) ( not ( = ?auto_370551 ?auto_370553 ) ) ( not ( = ?auto_370551 ?auto_370554 ) ) ( not ( = ?auto_370551 ?auto_370555 ) ) ( not ( = ?auto_370551 ?auto_370556 ) ) ( not ( = ?auto_370551 ?auto_370557 ) ) ( not ( = ?auto_370551 ?auto_370558 ) ) ( not ( = ?auto_370551 ?auto_370559 ) ) ( not ( = ?auto_370551 ?auto_370560 ) ) ( not ( = ?auto_370551 ?auto_370561 ) ) ( not ( = ?auto_370551 ?auto_370562 ) ) ( not ( = ?auto_370551 ?auto_370563 ) ) ( not ( = ?auto_370552 ?auto_370553 ) ) ( not ( = ?auto_370552 ?auto_370554 ) ) ( not ( = ?auto_370552 ?auto_370555 ) ) ( not ( = ?auto_370552 ?auto_370556 ) ) ( not ( = ?auto_370552 ?auto_370557 ) ) ( not ( = ?auto_370552 ?auto_370558 ) ) ( not ( = ?auto_370552 ?auto_370559 ) ) ( not ( = ?auto_370552 ?auto_370560 ) ) ( not ( = ?auto_370552 ?auto_370561 ) ) ( not ( = ?auto_370552 ?auto_370562 ) ) ( not ( = ?auto_370552 ?auto_370563 ) ) ( not ( = ?auto_370553 ?auto_370554 ) ) ( not ( = ?auto_370553 ?auto_370555 ) ) ( not ( = ?auto_370553 ?auto_370556 ) ) ( not ( = ?auto_370553 ?auto_370557 ) ) ( not ( = ?auto_370553 ?auto_370558 ) ) ( not ( = ?auto_370553 ?auto_370559 ) ) ( not ( = ?auto_370553 ?auto_370560 ) ) ( not ( = ?auto_370553 ?auto_370561 ) ) ( not ( = ?auto_370553 ?auto_370562 ) ) ( not ( = ?auto_370553 ?auto_370563 ) ) ( not ( = ?auto_370554 ?auto_370555 ) ) ( not ( = ?auto_370554 ?auto_370556 ) ) ( not ( = ?auto_370554 ?auto_370557 ) ) ( not ( = ?auto_370554 ?auto_370558 ) ) ( not ( = ?auto_370554 ?auto_370559 ) ) ( not ( = ?auto_370554 ?auto_370560 ) ) ( not ( = ?auto_370554 ?auto_370561 ) ) ( not ( = ?auto_370554 ?auto_370562 ) ) ( not ( = ?auto_370554 ?auto_370563 ) ) ( not ( = ?auto_370555 ?auto_370556 ) ) ( not ( = ?auto_370555 ?auto_370557 ) ) ( not ( = ?auto_370555 ?auto_370558 ) ) ( not ( = ?auto_370555 ?auto_370559 ) ) ( not ( = ?auto_370555 ?auto_370560 ) ) ( not ( = ?auto_370555 ?auto_370561 ) ) ( not ( = ?auto_370555 ?auto_370562 ) ) ( not ( = ?auto_370555 ?auto_370563 ) ) ( not ( = ?auto_370556 ?auto_370557 ) ) ( not ( = ?auto_370556 ?auto_370558 ) ) ( not ( = ?auto_370556 ?auto_370559 ) ) ( not ( = ?auto_370556 ?auto_370560 ) ) ( not ( = ?auto_370556 ?auto_370561 ) ) ( not ( = ?auto_370556 ?auto_370562 ) ) ( not ( = ?auto_370556 ?auto_370563 ) ) ( not ( = ?auto_370557 ?auto_370558 ) ) ( not ( = ?auto_370557 ?auto_370559 ) ) ( not ( = ?auto_370557 ?auto_370560 ) ) ( not ( = ?auto_370557 ?auto_370561 ) ) ( not ( = ?auto_370557 ?auto_370562 ) ) ( not ( = ?auto_370557 ?auto_370563 ) ) ( not ( = ?auto_370558 ?auto_370559 ) ) ( not ( = ?auto_370558 ?auto_370560 ) ) ( not ( = ?auto_370558 ?auto_370561 ) ) ( not ( = ?auto_370558 ?auto_370562 ) ) ( not ( = ?auto_370558 ?auto_370563 ) ) ( not ( = ?auto_370559 ?auto_370560 ) ) ( not ( = ?auto_370559 ?auto_370561 ) ) ( not ( = ?auto_370559 ?auto_370562 ) ) ( not ( = ?auto_370559 ?auto_370563 ) ) ( not ( = ?auto_370560 ?auto_370561 ) ) ( not ( = ?auto_370560 ?auto_370562 ) ) ( not ( = ?auto_370560 ?auto_370563 ) ) ( not ( = ?auto_370561 ?auto_370562 ) ) ( not ( = ?auto_370561 ?auto_370563 ) ) ( not ( = ?auto_370562 ?auto_370563 ) ) ( ON ?auto_370561 ?auto_370562 ) ( ON ?auto_370560 ?auto_370561 ) ( ON ?auto_370559 ?auto_370560 ) ( ON ?auto_370558 ?auto_370559 ) ( ON ?auto_370557 ?auto_370558 ) ( ON ?auto_370556 ?auto_370557 ) ( CLEAR ?auto_370554 ) ( ON ?auto_370555 ?auto_370556 ) ( CLEAR ?auto_370555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_370548 ?auto_370549 ?auto_370550 ?auto_370551 ?auto_370552 ?auto_370553 ?auto_370554 ?auto_370555 )
      ( MAKE-15PILE ?auto_370548 ?auto_370549 ?auto_370550 ?auto_370551 ?auto_370552 ?auto_370553 ?auto_370554 ?auto_370555 ?auto_370556 ?auto_370557 ?auto_370558 ?auto_370559 ?auto_370560 ?auto_370561 ?auto_370562 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370579 - BLOCK
      ?auto_370580 - BLOCK
      ?auto_370581 - BLOCK
      ?auto_370582 - BLOCK
      ?auto_370583 - BLOCK
      ?auto_370584 - BLOCK
      ?auto_370585 - BLOCK
      ?auto_370586 - BLOCK
      ?auto_370587 - BLOCK
      ?auto_370588 - BLOCK
      ?auto_370589 - BLOCK
      ?auto_370590 - BLOCK
      ?auto_370591 - BLOCK
      ?auto_370592 - BLOCK
      ?auto_370593 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_370593 ) ( ON-TABLE ?auto_370579 ) ( ON ?auto_370580 ?auto_370579 ) ( ON ?auto_370581 ?auto_370580 ) ( ON ?auto_370582 ?auto_370581 ) ( ON ?auto_370583 ?auto_370582 ) ( ON ?auto_370584 ?auto_370583 ) ( ON ?auto_370585 ?auto_370584 ) ( not ( = ?auto_370579 ?auto_370580 ) ) ( not ( = ?auto_370579 ?auto_370581 ) ) ( not ( = ?auto_370579 ?auto_370582 ) ) ( not ( = ?auto_370579 ?auto_370583 ) ) ( not ( = ?auto_370579 ?auto_370584 ) ) ( not ( = ?auto_370579 ?auto_370585 ) ) ( not ( = ?auto_370579 ?auto_370586 ) ) ( not ( = ?auto_370579 ?auto_370587 ) ) ( not ( = ?auto_370579 ?auto_370588 ) ) ( not ( = ?auto_370579 ?auto_370589 ) ) ( not ( = ?auto_370579 ?auto_370590 ) ) ( not ( = ?auto_370579 ?auto_370591 ) ) ( not ( = ?auto_370579 ?auto_370592 ) ) ( not ( = ?auto_370579 ?auto_370593 ) ) ( not ( = ?auto_370580 ?auto_370581 ) ) ( not ( = ?auto_370580 ?auto_370582 ) ) ( not ( = ?auto_370580 ?auto_370583 ) ) ( not ( = ?auto_370580 ?auto_370584 ) ) ( not ( = ?auto_370580 ?auto_370585 ) ) ( not ( = ?auto_370580 ?auto_370586 ) ) ( not ( = ?auto_370580 ?auto_370587 ) ) ( not ( = ?auto_370580 ?auto_370588 ) ) ( not ( = ?auto_370580 ?auto_370589 ) ) ( not ( = ?auto_370580 ?auto_370590 ) ) ( not ( = ?auto_370580 ?auto_370591 ) ) ( not ( = ?auto_370580 ?auto_370592 ) ) ( not ( = ?auto_370580 ?auto_370593 ) ) ( not ( = ?auto_370581 ?auto_370582 ) ) ( not ( = ?auto_370581 ?auto_370583 ) ) ( not ( = ?auto_370581 ?auto_370584 ) ) ( not ( = ?auto_370581 ?auto_370585 ) ) ( not ( = ?auto_370581 ?auto_370586 ) ) ( not ( = ?auto_370581 ?auto_370587 ) ) ( not ( = ?auto_370581 ?auto_370588 ) ) ( not ( = ?auto_370581 ?auto_370589 ) ) ( not ( = ?auto_370581 ?auto_370590 ) ) ( not ( = ?auto_370581 ?auto_370591 ) ) ( not ( = ?auto_370581 ?auto_370592 ) ) ( not ( = ?auto_370581 ?auto_370593 ) ) ( not ( = ?auto_370582 ?auto_370583 ) ) ( not ( = ?auto_370582 ?auto_370584 ) ) ( not ( = ?auto_370582 ?auto_370585 ) ) ( not ( = ?auto_370582 ?auto_370586 ) ) ( not ( = ?auto_370582 ?auto_370587 ) ) ( not ( = ?auto_370582 ?auto_370588 ) ) ( not ( = ?auto_370582 ?auto_370589 ) ) ( not ( = ?auto_370582 ?auto_370590 ) ) ( not ( = ?auto_370582 ?auto_370591 ) ) ( not ( = ?auto_370582 ?auto_370592 ) ) ( not ( = ?auto_370582 ?auto_370593 ) ) ( not ( = ?auto_370583 ?auto_370584 ) ) ( not ( = ?auto_370583 ?auto_370585 ) ) ( not ( = ?auto_370583 ?auto_370586 ) ) ( not ( = ?auto_370583 ?auto_370587 ) ) ( not ( = ?auto_370583 ?auto_370588 ) ) ( not ( = ?auto_370583 ?auto_370589 ) ) ( not ( = ?auto_370583 ?auto_370590 ) ) ( not ( = ?auto_370583 ?auto_370591 ) ) ( not ( = ?auto_370583 ?auto_370592 ) ) ( not ( = ?auto_370583 ?auto_370593 ) ) ( not ( = ?auto_370584 ?auto_370585 ) ) ( not ( = ?auto_370584 ?auto_370586 ) ) ( not ( = ?auto_370584 ?auto_370587 ) ) ( not ( = ?auto_370584 ?auto_370588 ) ) ( not ( = ?auto_370584 ?auto_370589 ) ) ( not ( = ?auto_370584 ?auto_370590 ) ) ( not ( = ?auto_370584 ?auto_370591 ) ) ( not ( = ?auto_370584 ?auto_370592 ) ) ( not ( = ?auto_370584 ?auto_370593 ) ) ( not ( = ?auto_370585 ?auto_370586 ) ) ( not ( = ?auto_370585 ?auto_370587 ) ) ( not ( = ?auto_370585 ?auto_370588 ) ) ( not ( = ?auto_370585 ?auto_370589 ) ) ( not ( = ?auto_370585 ?auto_370590 ) ) ( not ( = ?auto_370585 ?auto_370591 ) ) ( not ( = ?auto_370585 ?auto_370592 ) ) ( not ( = ?auto_370585 ?auto_370593 ) ) ( not ( = ?auto_370586 ?auto_370587 ) ) ( not ( = ?auto_370586 ?auto_370588 ) ) ( not ( = ?auto_370586 ?auto_370589 ) ) ( not ( = ?auto_370586 ?auto_370590 ) ) ( not ( = ?auto_370586 ?auto_370591 ) ) ( not ( = ?auto_370586 ?auto_370592 ) ) ( not ( = ?auto_370586 ?auto_370593 ) ) ( not ( = ?auto_370587 ?auto_370588 ) ) ( not ( = ?auto_370587 ?auto_370589 ) ) ( not ( = ?auto_370587 ?auto_370590 ) ) ( not ( = ?auto_370587 ?auto_370591 ) ) ( not ( = ?auto_370587 ?auto_370592 ) ) ( not ( = ?auto_370587 ?auto_370593 ) ) ( not ( = ?auto_370588 ?auto_370589 ) ) ( not ( = ?auto_370588 ?auto_370590 ) ) ( not ( = ?auto_370588 ?auto_370591 ) ) ( not ( = ?auto_370588 ?auto_370592 ) ) ( not ( = ?auto_370588 ?auto_370593 ) ) ( not ( = ?auto_370589 ?auto_370590 ) ) ( not ( = ?auto_370589 ?auto_370591 ) ) ( not ( = ?auto_370589 ?auto_370592 ) ) ( not ( = ?auto_370589 ?auto_370593 ) ) ( not ( = ?auto_370590 ?auto_370591 ) ) ( not ( = ?auto_370590 ?auto_370592 ) ) ( not ( = ?auto_370590 ?auto_370593 ) ) ( not ( = ?auto_370591 ?auto_370592 ) ) ( not ( = ?auto_370591 ?auto_370593 ) ) ( not ( = ?auto_370592 ?auto_370593 ) ) ( ON ?auto_370592 ?auto_370593 ) ( ON ?auto_370591 ?auto_370592 ) ( ON ?auto_370590 ?auto_370591 ) ( ON ?auto_370589 ?auto_370590 ) ( ON ?auto_370588 ?auto_370589 ) ( ON ?auto_370587 ?auto_370588 ) ( CLEAR ?auto_370585 ) ( ON ?auto_370586 ?auto_370587 ) ( CLEAR ?auto_370586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_370579 ?auto_370580 ?auto_370581 ?auto_370582 ?auto_370583 ?auto_370584 ?auto_370585 ?auto_370586 )
      ( MAKE-15PILE ?auto_370579 ?auto_370580 ?auto_370581 ?auto_370582 ?auto_370583 ?auto_370584 ?auto_370585 ?auto_370586 ?auto_370587 ?auto_370588 ?auto_370589 ?auto_370590 ?auto_370591 ?auto_370592 ?auto_370593 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370609 - BLOCK
      ?auto_370610 - BLOCK
      ?auto_370611 - BLOCK
      ?auto_370612 - BLOCK
      ?auto_370613 - BLOCK
      ?auto_370614 - BLOCK
      ?auto_370615 - BLOCK
      ?auto_370616 - BLOCK
      ?auto_370617 - BLOCK
      ?auto_370618 - BLOCK
      ?auto_370619 - BLOCK
      ?auto_370620 - BLOCK
      ?auto_370621 - BLOCK
      ?auto_370622 - BLOCK
      ?auto_370623 - BLOCK
    )
    :vars
    (
      ?auto_370624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_370623 ?auto_370624 ) ( ON-TABLE ?auto_370609 ) ( ON ?auto_370610 ?auto_370609 ) ( ON ?auto_370611 ?auto_370610 ) ( ON ?auto_370612 ?auto_370611 ) ( ON ?auto_370613 ?auto_370612 ) ( ON ?auto_370614 ?auto_370613 ) ( not ( = ?auto_370609 ?auto_370610 ) ) ( not ( = ?auto_370609 ?auto_370611 ) ) ( not ( = ?auto_370609 ?auto_370612 ) ) ( not ( = ?auto_370609 ?auto_370613 ) ) ( not ( = ?auto_370609 ?auto_370614 ) ) ( not ( = ?auto_370609 ?auto_370615 ) ) ( not ( = ?auto_370609 ?auto_370616 ) ) ( not ( = ?auto_370609 ?auto_370617 ) ) ( not ( = ?auto_370609 ?auto_370618 ) ) ( not ( = ?auto_370609 ?auto_370619 ) ) ( not ( = ?auto_370609 ?auto_370620 ) ) ( not ( = ?auto_370609 ?auto_370621 ) ) ( not ( = ?auto_370609 ?auto_370622 ) ) ( not ( = ?auto_370609 ?auto_370623 ) ) ( not ( = ?auto_370609 ?auto_370624 ) ) ( not ( = ?auto_370610 ?auto_370611 ) ) ( not ( = ?auto_370610 ?auto_370612 ) ) ( not ( = ?auto_370610 ?auto_370613 ) ) ( not ( = ?auto_370610 ?auto_370614 ) ) ( not ( = ?auto_370610 ?auto_370615 ) ) ( not ( = ?auto_370610 ?auto_370616 ) ) ( not ( = ?auto_370610 ?auto_370617 ) ) ( not ( = ?auto_370610 ?auto_370618 ) ) ( not ( = ?auto_370610 ?auto_370619 ) ) ( not ( = ?auto_370610 ?auto_370620 ) ) ( not ( = ?auto_370610 ?auto_370621 ) ) ( not ( = ?auto_370610 ?auto_370622 ) ) ( not ( = ?auto_370610 ?auto_370623 ) ) ( not ( = ?auto_370610 ?auto_370624 ) ) ( not ( = ?auto_370611 ?auto_370612 ) ) ( not ( = ?auto_370611 ?auto_370613 ) ) ( not ( = ?auto_370611 ?auto_370614 ) ) ( not ( = ?auto_370611 ?auto_370615 ) ) ( not ( = ?auto_370611 ?auto_370616 ) ) ( not ( = ?auto_370611 ?auto_370617 ) ) ( not ( = ?auto_370611 ?auto_370618 ) ) ( not ( = ?auto_370611 ?auto_370619 ) ) ( not ( = ?auto_370611 ?auto_370620 ) ) ( not ( = ?auto_370611 ?auto_370621 ) ) ( not ( = ?auto_370611 ?auto_370622 ) ) ( not ( = ?auto_370611 ?auto_370623 ) ) ( not ( = ?auto_370611 ?auto_370624 ) ) ( not ( = ?auto_370612 ?auto_370613 ) ) ( not ( = ?auto_370612 ?auto_370614 ) ) ( not ( = ?auto_370612 ?auto_370615 ) ) ( not ( = ?auto_370612 ?auto_370616 ) ) ( not ( = ?auto_370612 ?auto_370617 ) ) ( not ( = ?auto_370612 ?auto_370618 ) ) ( not ( = ?auto_370612 ?auto_370619 ) ) ( not ( = ?auto_370612 ?auto_370620 ) ) ( not ( = ?auto_370612 ?auto_370621 ) ) ( not ( = ?auto_370612 ?auto_370622 ) ) ( not ( = ?auto_370612 ?auto_370623 ) ) ( not ( = ?auto_370612 ?auto_370624 ) ) ( not ( = ?auto_370613 ?auto_370614 ) ) ( not ( = ?auto_370613 ?auto_370615 ) ) ( not ( = ?auto_370613 ?auto_370616 ) ) ( not ( = ?auto_370613 ?auto_370617 ) ) ( not ( = ?auto_370613 ?auto_370618 ) ) ( not ( = ?auto_370613 ?auto_370619 ) ) ( not ( = ?auto_370613 ?auto_370620 ) ) ( not ( = ?auto_370613 ?auto_370621 ) ) ( not ( = ?auto_370613 ?auto_370622 ) ) ( not ( = ?auto_370613 ?auto_370623 ) ) ( not ( = ?auto_370613 ?auto_370624 ) ) ( not ( = ?auto_370614 ?auto_370615 ) ) ( not ( = ?auto_370614 ?auto_370616 ) ) ( not ( = ?auto_370614 ?auto_370617 ) ) ( not ( = ?auto_370614 ?auto_370618 ) ) ( not ( = ?auto_370614 ?auto_370619 ) ) ( not ( = ?auto_370614 ?auto_370620 ) ) ( not ( = ?auto_370614 ?auto_370621 ) ) ( not ( = ?auto_370614 ?auto_370622 ) ) ( not ( = ?auto_370614 ?auto_370623 ) ) ( not ( = ?auto_370614 ?auto_370624 ) ) ( not ( = ?auto_370615 ?auto_370616 ) ) ( not ( = ?auto_370615 ?auto_370617 ) ) ( not ( = ?auto_370615 ?auto_370618 ) ) ( not ( = ?auto_370615 ?auto_370619 ) ) ( not ( = ?auto_370615 ?auto_370620 ) ) ( not ( = ?auto_370615 ?auto_370621 ) ) ( not ( = ?auto_370615 ?auto_370622 ) ) ( not ( = ?auto_370615 ?auto_370623 ) ) ( not ( = ?auto_370615 ?auto_370624 ) ) ( not ( = ?auto_370616 ?auto_370617 ) ) ( not ( = ?auto_370616 ?auto_370618 ) ) ( not ( = ?auto_370616 ?auto_370619 ) ) ( not ( = ?auto_370616 ?auto_370620 ) ) ( not ( = ?auto_370616 ?auto_370621 ) ) ( not ( = ?auto_370616 ?auto_370622 ) ) ( not ( = ?auto_370616 ?auto_370623 ) ) ( not ( = ?auto_370616 ?auto_370624 ) ) ( not ( = ?auto_370617 ?auto_370618 ) ) ( not ( = ?auto_370617 ?auto_370619 ) ) ( not ( = ?auto_370617 ?auto_370620 ) ) ( not ( = ?auto_370617 ?auto_370621 ) ) ( not ( = ?auto_370617 ?auto_370622 ) ) ( not ( = ?auto_370617 ?auto_370623 ) ) ( not ( = ?auto_370617 ?auto_370624 ) ) ( not ( = ?auto_370618 ?auto_370619 ) ) ( not ( = ?auto_370618 ?auto_370620 ) ) ( not ( = ?auto_370618 ?auto_370621 ) ) ( not ( = ?auto_370618 ?auto_370622 ) ) ( not ( = ?auto_370618 ?auto_370623 ) ) ( not ( = ?auto_370618 ?auto_370624 ) ) ( not ( = ?auto_370619 ?auto_370620 ) ) ( not ( = ?auto_370619 ?auto_370621 ) ) ( not ( = ?auto_370619 ?auto_370622 ) ) ( not ( = ?auto_370619 ?auto_370623 ) ) ( not ( = ?auto_370619 ?auto_370624 ) ) ( not ( = ?auto_370620 ?auto_370621 ) ) ( not ( = ?auto_370620 ?auto_370622 ) ) ( not ( = ?auto_370620 ?auto_370623 ) ) ( not ( = ?auto_370620 ?auto_370624 ) ) ( not ( = ?auto_370621 ?auto_370622 ) ) ( not ( = ?auto_370621 ?auto_370623 ) ) ( not ( = ?auto_370621 ?auto_370624 ) ) ( not ( = ?auto_370622 ?auto_370623 ) ) ( not ( = ?auto_370622 ?auto_370624 ) ) ( not ( = ?auto_370623 ?auto_370624 ) ) ( ON ?auto_370622 ?auto_370623 ) ( ON ?auto_370621 ?auto_370622 ) ( ON ?auto_370620 ?auto_370621 ) ( ON ?auto_370619 ?auto_370620 ) ( ON ?auto_370618 ?auto_370619 ) ( ON ?auto_370617 ?auto_370618 ) ( ON ?auto_370616 ?auto_370617 ) ( CLEAR ?auto_370614 ) ( ON ?auto_370615 ?auto_370616 ) ( CLEAR ?auto_370615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_370609 ?auto_370610 ?auto_370611 ?auto_370612 ?auto_370613 ?auto_370614 ?auto_370615 )
      ( MAKE-15PILE ?auto_370609 ?auto_370610 ?auto_370611 ?auto_370612 ?auto_370613 ?auto_370614 ?auto_370615 ?auto_370616 ?auto_370617 ?auto_370618 ?auto_370619 ?auto_370620 ?auto_370621 ?auto_370622 ?auto_370623 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370640 - BLOCK
      ?auto_370641 - BLOCK
      ?auto_370642 - BLOCK
      ?auto_370643 - BLOCK
      ?auto_370644 - BLOCK
      ?auto_370645 - BLOCK
      ?auto_370646 - BLOCK
      ?auto_370647 - BLOCK
      ?auto_370648 - BLOCK
      ?auto_370649 - BLOCK
      ?auto_370650 - BLOCK
      ?auto_370651 - BLOCK
      ?auto_370652 - BLOCK
      ?auto_370653 - BLOCK
      ?auto_370654 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_370654 ) ( ON-TABLE ?auto_370640 ) ( ON ?auto_370641 ?auto_370640 ) ( ON ?auto_370642 ?auto_370641 ) ( ON ?auto_370643 ?auto_370642 ) ( ON ?auto_370644 ?auto_370643 ) ( ON ?auto_370645 ?auto_370644 ) ( not ( = ?auto_370640 ?auto_370641 ) ) ( not ( = ?auto_370640 ?auto_370642 ) ) ( not ( = ?auto_370640 ?auto_370643 ) ) ( not ( = ?auto_370640 ?auto_370644 ) ) ( not ( = ?auto_370640 ?auto_370645 ) ) ( not ( = ?auto_370640 ?auto_370646 ) ) ( not ( = ?auto_370640 ?auto_370647 ) ) ( not ( = ?auto_370640 ?auto_370648 ) ) ( not ( = ?auto_370640 ?auto_370649 ) ) ( not ( = ?auto_370640 ?auto_370650 ) ) ( not ( = ?auto_370640 ?auto_370651 ) ) ( not ( = ?auto_370640 ?auto_370652 ) ) ( not ( = ?auto_370640 ?auto_370653 ) ) ( not ( = ?auto_370640 ?auto_370654 ) ) ( not ( = ?auto_370641 ?auto_370642 ) ) ( not ( = ?auto_370641 ?auto_370643 ) ) ( not ( = ?auto_370641 ?auto_370644 ) ) ( not ( = ?auto_370641 ?auto_370645 ) ) ( not ( = ?auto_370641 ?auto_370646 ) ) ( not ( = ?auto_370641 ?auto_370647 ) ) ( not ( = ?auto_370641 ?auto_370648 ) ) ( not ( = ?auto_370641 ?auto_370649 ) ) ( not ( = ?auto_370641 ?auto_370650 ) ) ( not ( = ?auto_370641 ?auto_370651 ) ) ( not ( = ?auto_370641 ?auto_370652 ) ) ( not ( = ?auto_370641 ?auto_370653 ) ) ( not ( = ?auto_370641 ?auto_370654 ) ) ( not ( = ?auto_370642 ?auto_370643 ) ) ( not ( = ?auto_370642 ?auto_370644 ) ) ( not ( = ?auto_370642 ?auto_370645 ) ) ( not ( = ?auto_370642 ?auto_370646 ) ) ( not ( = ?auto_370642 ?auto_370647 ) ) ( not ( = ?auto_370642 ?auto_370648 ) ) ( not ( = ?auto_370642 ?auto_370649 ) ) ( not ( = ?auto_370642 ?auto_370650 ) ) ( not ( = ?auto_370642 ?auto_370651 ) ) ( not ( = ?auto_370642 ?auto_370652 ) ) ( not ( = ?auto_370642 ?auto_370653 ) ) ( not ( = ?auto_370642 ?auto_370654 ) ) ( not ( = ?auto_370643 ?auto_370644 ) ) ( not ( = ?auto_370643 ?auto_370645 ) ) ( not ( = ?auto_370643 ?auto_370646 ) ) ( not ( = ?auto_370643 ?auto_370647 ) ) ( not ( = ?auto_370643 ?auto_370648 ) ) ( not ( = ?auto_370643 ?auto_370649 ) ) ( not ( = ?auto_370643 ?auto_370650 ) ) ( not ( = ?auto_370643 ?auto_370651 ) ) ( not ( = ?auto_370643 ?auto_370652 ) ) ( not ( = ?auto_370643 ?auto_370653 ) ) ( not ( = ?auto_370643 ?auto_370654 ) ) ( not ( = ?auto_370644 ?auto_370645 ) ) ( not ( = ?auto_370644 ?auto_370646 ) ) ( not ( = ?auto_370644 ?auto_370647 ) ) ( not ( = ?auto_370644 ?auto_370648 ) ) ( not ( = ?auto_370644 ?auto_370649 ) ) ( not ( = ?auto_370644 ?auto_370650 ) ) ( not ( = ?auto_370644 ?auto_370651 ) ) ( not ( = ?auto_370644 ?auto_370652 ) ) ( not ( = ?auto_370644 ?auto_370653 ) ) ( not ( = ?auto_370644 ?auto_370654 ) ) ( not ( = ?auto_370645 ?auto_370646 ) ) ( not ( = ?auto_370645 ?auto_370647 ) ) ( not ( = ?auto_370645 ?auto_370648 ) ) ( not ( = ?auto_370645 ?auto_370649 ) ) ( not ( = ?auto_370645 ?auto_370650 ) ) ( not ( = ?auto_370645 ?auto_370651 ) ) ( not ( = ?auto_370645 ?auto_370652 ) ) ( not ( = ?auto_370645 ?auto_370653 ) ) ( not ( = ?auto_370645 ?auto_370654 ) ) ( not ( = ?auto_370646 ?auto_370647 ) ) ( not ( = ?auto_370646 ?auto_370648 ) ) ( not ( = ?auto_370646 ?auto_370649 ) ) ( not ( = ?auto_370646 ?auto_370650 ) ) ( not ( = ?auto_370646 ?auto_370651 ) ) ( not ( = ?auto_370646 ?auto_370652 ) ) ( not ( = ?auto_370646 ?auto_370653 ) ) ( not ( = ?auto_370646 ?auto_370654 ) ) ( not ( = ?auto_370647 ?auto_370648 ) ) ( not ( = ?auto_370647 ?auto_370649 ) ) ( not ( = ?auto_370647 ?auto_370650 ) ) ( not ( = ?auto_370647 ?auto_370651 ) ) ( not ( = ?auto_370647 ?auto_370652 ) ) ( not ( = ?auto_370647 ?auto_370653 ) ) ( not ( = ?auto_370647 ?auto_370654 ) ) ( not ( = ?auto_370648 ?auto_370649 ) ) ( not ( = ?auto_370648 ?auto_370650 ) ) ( not ( = ?auto_370648 ?auto_370651 ) ) ( not ( = ?auto_370648 ?auto_370652 ) ) ( not ( = ?auto_370648 ?auto_370653 ) ) ( not ( = ?auto_370648 ?auto_370654 ) ) ( not ( = ?auto_370649 ?auto_370650 ) ) ( not ( = ?auto_370649 ?auto_370651 ) ) ( not ( = ?auto_370649 ?auto_370652 ) ) ( not ( = ?auto_370649 ?auto_370653 ) ) ( not ( = ?auto_370649 ?auto_370654 ) ) ( not ( = ?auto_370650 ?auto_370651 ) ) ( not ( = ?auto_370650 ?auto_370652 ) ) ( not ( = ?auto_370650 ?auto_370653 ) ) ( not ( = ?auto_370650 ?auto_370654 ) ) ( not ( = ?auto_370651 ?auto_370652 ) ) ( not ( = ?auto_370651 ?auto_370653 ) ) ( not ( = ?auto_370651 ?auto_370654 ) ) ( not ( = ?auto_370652 ?auto_370653 ) ) ( not ( = ?auto_370652 ?auto_370654 ) ) ( not ( = ?auto_370653 ?auto_370654 ) ) ( ON ?auto_370653 ?auto_370654 ) ( ON ?auto_370652 ?auto_370653 ) ( ON ?auto_370651 ?auto_370652 ) ( ON ?auto_370650 ?auto_370651 ) ( ON ?auto_370649 ?auto_370650 ) ( ON ?auto_370648 ?auto_370649 ) ( ON ?auto_370647 ?auto_370648 ) ( CLEAR ?auto_370645 ) ( ON ?auto_370646 ?auto_370647 ) ( CLEAR ?auto_370646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_370640 ?auto_370641 ?auto_370642 ?auto_370643 ?auto_370644 ?auto_370645 ?auto_370646 )
      ( MAKE-15PILE ?auto_370640 ?auto_370641 ?auto_370642 ?auto_370643 ?auto_370644 ?auto_370645 ?auto_370646 ?auto_370647 ?auto_370648 ?auto_370649 ?auto_370650 ?auto_370651 ?auto_370652 ?auto_370653 ?auto_370654 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370670 - BLOCK
      ?auto_370671 - BLOCK
      ?auto_370672 - BLOCK
      ?auto_370673 - BLOCK
      ?auto_370674 - BLOCK
      ?auto_370675 - BLOCK
      ?auto_370676 - BLOCK
      ?auto_370677 - BLOCK
      ?auto_370678 - BLOCK
      ?auto_370679 - BLOCK
      ?auto_370680 - BLOCK
      ?auto_370681 - BLOCK
      ?auto_370682 - BLOCK
      ?auto_370683 - BLOCK
      ?auto_370684 - BLOCK
    )
    :vars
    (
      ?auto_370685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_370684 ?auto_370685 ) ( ON-TABLE ?auto_370670 ) ( ON ?auto_370671 ?auto_370670 ) ( ON ?auto_370672 ?auto_370671 ) ( ON ?auto_370673 ?auto_370672 ) ( ON ?auto_370674 ?auto_370673 ) ( not ( = ?auto_370670 ?auto_370671 ) ) ( not ( = ?auto_370670 ?auto_370672 ) ) ( not ( = ?auto_370670 ?auto_370673 ) ) ( not ( = ?auto_370670 ?auto_370674 ) ) ( not ( = ?auto_370670 ?auto_370675 ) ) ( not ( = ?auto_370670 ?auto_370676 ) ) ( not ( = ?auto_370670 ?auto_370677 ) ) ( not ( = ?auto_370670 ?auto_370678 ) ) ( not ( = ?auto_370670 ?auto_370679 ) ) ( not ( = ?auto_370670 ?auto_370680 ) ) ( not ( = ?auto_370670 ?auto_370681 ) ) ( not ( = ?auto_370670 ?auto_370682 ) ) ( not ( = ?auto_370670 ?auto_370683 ) ) ( not ( = ?auto_370670 ?auto_370684 ) ) ( not ( = ?auto_370670 ?auto_370685 ) ) ( not ( = ?auto_370671 ?auto_370672 ) ) ( not ( = ?auto_370671 ?auto_370673 ) ) ( not ( = ?auto_370671 ?auto_370674 ) ) ( not ( = ?auto_370671 ?auto_370675 ) ) ( not ( = ?auto_370671 ?auto_370676 ) ) ( not ( = ?auto_370671 ?auto_370677 ) ) ( not ( = ?auto_370671 ?auto_370678 ) ) ( not ( = ?auto_370671 ?auto_370679 ) ) ( not ( = ?auto_370671 ?auto_370680 ) ) ( not ( = ?auto_370671 ?auto_370681 ) ) ( not ( = ?auto_370671 ?auto_370682 ) ) ( not ( = ?auto_370671 ?auto_370683 ) ) ( not ( = ?auto_370671 ?auto_370684 ) ) ( not ( = ?auto_370671 ?auto_370685 ) ) ( not ( = ?auto_370672 ?auto_370673 ) ) ( not ( = ?auto_370672 ?auto_370674 ) ) ( not ( = ?auto_370672 ?auto_370675 ) ) ( not ( = ?auto_370672 ?auto_370676 ) ) ( not ( = ?auto_370672 ?auto_370677 ) ) ( not ( = ?auto_370672 ?auto_370678 ) ) ( not ( = ?auto_370672 ?auto_370679 ) ) ( not ( = ?auto_370672 ?auto_370680 ) ) ( not ( = ?auto_370672 ?auto_370681 ) ) ( not ( = ?auto_370672 ?auto_370682 ) ) ( not ( = ?auto_370672 ?auto_370683 ) ) ( not ( = ?auto_370672 ?auto_370684 ) ) ( not ( = ?auto_370672 ?auto_370685 ) ) ( not ( = ?auto_370673 ?auto_370674 ) ) ( not ( = ?auto_370673 ?auto_370675 ) ) ( not ( = ?auto_370673 ?auto_370676 ) ) ( not ( = ?auto_370673 ?auto_370677 ) ) ( not ( = ?auto_370673 ?auto_370678 ) ) ( not ( = ?auto_370673 ?auto_370679 ) ) ( not ( = ?auto_370673 ?auto_370680 ) ) ( not ( = ?auto_370673 ?auto_370681 ) ) ( not ( = ?auto_370673 ?auto_370682 ) ) ( not ( = ?auto_370673 ?auto_370683 ) ) ( not ( = ?auto_370673 ?auto_370684 ) ) ( not ( = ?auto_370673 ?auto_370685 ) ) ( not ( = ?auto_370674 ?auto_370675 ) ) ( not ( = ?auto_370674 ?auto_370676 ) ) ( not ( = ?auto_370674 ?auto_370677 ) ) ( not ( = ?auto_370674 ?auto_370678 ) ) ( not ( = ?auto_370674 ?auto_370679 ) ) ( not ( = ?auto_370674 ?auto_370680 ) ) ( not ( = ?auto_370674 ?auto_370681 ) ) ( not ( = ?auto_370674 ?auto_370682 ) ) ( not ( = ?auto_370674 ?auto_370683 ) ) ( not ( = ?auto_370674 ?auto_370684 ) ) ( not ( = ?auto_370674 ?auto_370685 ) ) ( not ( = ?auto_370675 ?auto_370676 ) ) ( not ( = ?auto_370675 ?auto_370677 ) ) ( not ( = ?auto_370675 ?auto_370678 ) ) ( not ( = ?auto_370675 ?auto_370679 ) ) ( not ( = ?auto_370675 ?auto_370680 ) ) ( not ( = ?auto_370675 ?auto_370681 ) ) ( not ( = ?auto_370675 ?auto_370682 ) ) ( not ( = ?auto_370675 ?auto_370683 ) ) ( not ( = ?auto_370675 ?auto_370684 ) ) ( not ( = ?auto_370675 ?auto_370685 ) ) ( not ( = ?auto_370676 ?auto_370677 ) ) ( not ( = ?auto_370676 ?auto_370678 ) ) ( not ( = ?auto_370676 ?auto_370679 ) ) ( not ( = ?auto_370676 ?auto_370680 ) ) ( not ( = ?auto_370676 ?auto_370681 ) ) ( not ( = ?auto_370676 ?auto_370682 ) ) ( not ( = ?auto_370676 ?auto_370683 ) ) ( not ( = ?auto_370676 ?auto_370684 ) ) ( not ( = ?auto_370676 ?auto_370685 ) ) ( not ( = ?auto_370677 ?auto_370678 ) ) ( not ( = ?auto_370677 ?auto_370679 ) ) ( not ( = ?auto_370677 ?auto_370680 ) ) ( not ( = ?auto_370677 ?auto_370681 ) ) ( not ( = ?auto_370677 ?auto_370682 ) ) ( not ( = ?auto_370677 ?auto_370683 ) ) ( not ( = ?auto_370677 ?auto_370684 ) ) ( not ( = ?auto_370677 ?auto_370685 ) ) ( not ( = ?auto_370678 ?auto_370679 ) ) ( not ( = ?auto_370678 ?auto_370680 ) ) ( not ( = ?auto_370678 ?auto_370681 ) ) ( not ( = ?auto_370678 ?auto_370682 ) ) ( not ( = ?auto_370678 ?auto_370683 ) ) ( not ( = ?auto_370678 ?auto_370684 ) ) ( not ( = ?auto_370678 ?auto_370685 ) ) ( not ( = ?auto_370679 ?auto_370680 ) ) ( not ( = ?auto_370679 ?auto_370681 ) ) ( not ( = ?auto_370679 ?auto_370682 ) ) ( not ( = ?auto_370679 ?auto_370683 ) ) ( not ( = ?auto_370679 ?auto_370684 ) ) ( not ( = ?auto_370679 ?auto_370685 ) ) ( not ( = ?auto_370680 ?auto_370681 ) ) ( not ( = ?auto_370680 ?auto_370682 ) ) ( not ( = ?auto_370680 ?auto_370683 ) ) ( not ( = ?auto_370680 ?auto_370684 ) ) ( not ( = ?auto_370680 ?auto_370685 ) ) ( not ( = ?auto_370681 ?auto_370682 ) ) ( not ( = ?auto_370681 ?auto_370683 ) ) ( not ( = ?auto_370681 ?auto_370684 ) ) ( not ( = ?auto_370681 ?auto_370685 ) ) ( not ( = ?auto_370682 ?auto_370683 ) ) ( not ( = ?auto_370682 ?auto_370684 ) ) ( not ( = ?auto_370682 ?auto_370685 ) ) ( not ( = ?auto_370683 ?auto_370684 ) ) ( not ( = ?auto_370683 ?auto_370685 ) ) ( not ( = ?auto_370684 ?auto_370685 ) ) ( ON ?auto_370683 ?auto_370684 ) ( ON ?auto_370682 ?auto_370683 ) ( ON ?auto_370681 ?auto_370682 ) ( ON ?auto_370680 ?auto_370681 ) ( ON ?auto_370679 ?auto_370680 ) ( ON ?auto_370678 ?auto_370679 ) ( ON ?auto_370677 ?auto_370678 ) ( ON ?auto_370676 ?auto_370677 ) ( CLEAR ?auto_370674 ) ( ON ?auto_370675 ?auto_370676 ) ( CLEAR ?auto_370675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_370670 ?auto_370671 ?auto_370672 ?auto_370673 ?auto_370674 ?auto_370675 )
      ( MAKE-15PILE ?auto_370670 ?auto_370671 ?auto_370672 ?auto_370673 ?auto_370674 ?auto_370675 ?auto_370676 ?auto_370677 ?auto_370678 ?auto_370679 ?auto_370680 ?auto_370681 ?auto_370682 ?auto_370683 ?auto_370684 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370701 - BLOCK
      ?auto_370702 - BLOCK
      ?auto_370703 - BLOCK
      ?auto_370704 - BLOCK
      ?auto_370705 - BLOCK
      ?auto_370706 - BLOCK
      ?auto_370707 - BLOCK
      ?auto_370708 - BLOCK
      ?auto_370709 - BLOCK
      ?auto_370710 - BLOCK
      ?auto_370711 - BLOCK
      ?auto_370712 - BLOCK
      ?auto_370713 - BLOCK
      ?auto_370714 - BLOCK
      ?auto_370715 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_370715 ) ( ON-TABLE ?auto_370701 ) ( ON ?auto_370702 ?auto_370701 ) ( ON ?auto_370703 ?auto_370702 ) ( ON ?auto_370704 ?auto_370703 ) ( ON ?auto_370705 ?auto_370704 ) ( not ( = ?auto_370701 ?auto_370702 ) ) ( not ( = ?auto_370701 ?auto_370703 ) ) ( not ( = ?auto_370701 ?auto_370704 ) ) ( not ( = ?auto_370701 ?auto_370705 ) ) ( not ( = ?auto_370701 ?auto_370706 ) ) ( not ( = ?auto_370701 ?auto_370707 ) ) ( not ( = ?auto_370701 ?auto_370708 ) ) ( not ( = ?auto_370701 ?auto_370709 ) ) ( not ( = ?auto_370701 ?auto_370710 ) ) ( not ( = ?auto_370701 ?auto_370711 ) ) ( not ( = ?auto_370701 ?auto_370712 ) ) ( not ( = ?auto_370701 ?auto_370713 ) ) ( not ( = ?auto_370701 ?auto_370714 ) ) ( not ( = ?auto_370701 ?auto_370715 ) ) ( not ( = ?auto_370702 ?auto_370703 ) ) ( not ( = ?auto_370702 ?auto_370704 ) ) ( not ( = ?auto_370702 ?auto_370705 ) ) ( not ( = ?auto_370702 ?auto_370706 ) ) ( not ( = ?auto_370702 ?auto_370707 ) ) ( not ( = ?auto_370702 ?auto_370708 ) ) ( not ( = ?auto_370702 ?auto_370709 ) ) ( not ( = ?auto_370702 ?auto_370710 ) ) ( not ( = ?auto_370702 ?auto_370711 ) ) ( not ( = ?auto_370702 ?auto_370712 ) ) ( not ( = ?auto_370702 ?auto_370713 ) ) ( not ( = ?auto_370702 ?auto_370714 ) ) ( not ( = ?auto_370702 ?auto_370715 ) ) ( not ( = ?auto_370703 ?auto_370704 ) ) ( not ( = ?auto_370703 ?auto_370705 ) ) ( not ( = ?auto_370703 ?auto_370706 ) ) ( not ( = ?auto_370703 ?auto_370707 ) ) ( not ( = ?auto_370703 ?auto_370708 ) ) ( not ( = ?auto_370703 ?auto_370709 ) ) ( not ( = ?auto_370703 ?auto_370710 ) ) ( not ( = ?auto_370703 ?auto_370711 ) ) ( not ( = ?auto_370703 ?auto_370712 ) ) ( not ( = ?auto_370703 ?auto_370713 ) ) ( not ( = ?auto_370703 ?auto_370714 ) ) ( not ( = ?auto_370703 ?auto_370715 ) ) ( not ( = ?auto_370704 ?auto_370705 ) ) ( not ( = ?auto_370704 ?auto_370706 ) ) ( not ( = ?auto_370704 ?auto_370707 ) ) ( not ( = ?auto_370704 ?auto_370708 ) ) ( not ( = ?auto_370704 ?auto_370709 ) ) ( not ( = ?auto_370704 ?auto_370710 ) ) ( not ( = ?auto_370704 ?auto_370711 ) ) ( not ( = ?auto_370704 ?auto_370712 ) ) ( not ( = ?auto_370704 ?auto_370713 ) ) ( not ( = ?auto_370704 ?auto_370714 ) ) ( not ( = ?auto_370704 ?auto_370715 ) ) ( not ( = ?auto_370705 ?auto_370706 ) ) ( not ( = ?auto_370705 ?auto_370707 ) ) ( not ( = ?auto_370705 ?auto_370708 ) ) ( not ( = ?auto_370705 ?auto_370709 ) ) ( not ( = ?auto_370705 ?auto_370710 ) ) ( not ( = ?auto_370705 ?auto_370711 ) ) ( not ( = ?auto_370705 ?auto_370712 ) ) ( not ( = ?auto_370705 ?auto_370713 ) ) ( not ( = ?auto_370705 ?auto_370714 ) ) ( not ( = ?auto_370705 ?auto_370715 ) ) ( not ( = ?auto_370706 ?auto_370707 ) ) ( not ( = ?auto_370706 ?auto_370708 ) ) ( not ( = ?auto_370706 ?auto_370709 ) ) ( not ( = ?auto_370706 ?auto_370710 ) ) ( not ( = ?auto_370706 ?auto_370711 ) ) ( not ( = ?auto_370706 ?auto_370712 ) ) ( not ( = ?auto_370706 ?auto_370713 ) ) ( not ( = ?auto_370706 ?auto_370714 ) ) ( not ( = ?auto_370706 ?auto_370715 ) ) ( not ( = ?auto_370707 ?auto_370708 ) ) ( not ( = ?auto_370707 ?auto_370709 ) ) ( not ( = ?auto_370707 ?auto_370710 ) ) ( not ( = ?auto_370707 ?auto_370711 ) ) ( not ( = ?auto_370707 ?auto_370712 ) ) ( not ( = ?auto_370707 ?auto_370713 ) ) ( not ( = ?auto_370707 ?auto_370714 ) ) ( not ( = ?auto_370707 ?auto_370715 ) ) ( not ( = ?auto_370708 ?auto_370709 ) ) ( not ( = ?auto_370708 ?auto_370710 ) ) ( not ( = ?auto_370708 ?auto_370711 ) ) ( not ( = ?auto_370708 ?auto_370712 ) ) ( not ( = ?auto_370708 ?auto_370713 ) ) ( not ( = ?auto_370708 ?auto_370714 ) ) ( not ( = ?auto_370708 ?auto_370715 ) ) ( not ( = ?auto_370709 ?auto_370710 ) ) ( not ( = ?auto_370709 ?auto_370711 ) ) ( not ( = ?auto_370709 ?auto_370712 ) ) ( not ( = ?auto_370709 ?auto_370713 ) ) ( not ( = ?auto_370709 ?auto_370714 ) ) ( not ( = ?auto_370709 ?auto_370715 ) ) ( not ( = ?auto_370710 ?auto_370711 ) ) ( not ( = ?auto_370710 ?auto_370712 ) ) ( not ( = ?auto_370710 ?auto_370713 ) ) ( not ( = ?auto_370710 ?auto_370714 ) ) ( not ( = ?auto_370710 ?auto_370715 ) ) ( not ( = ?auto_370711 ?auto_370712 ) ) ( not ( = ?auto_370711 ?auto_370713 ) ) ( not ( = ?auto_370711 ?auto_370714 ) ) ( not ( = ?auto_370711 ?auto_370715 ) ) ( not ( = ?auto_370712 ?auto_370713 ) ) ( not ( = ?auto_370712 ?auto_370714 ) ) ( not ( = ?auto_370712 ?auto_370715 ) ) ( not ( = ?auto_370713 ?auto_370714 ) ) ( not ( = ?auto_370713 ?auto_370715 ) ) ( not ( = ?auto_370714 ?auto_370715 ) ) ( ON ?auto_370714 ?auto_370715 ) ( ON ?auto_370713 ?auto_370714 ) ( ON ?auto_370712 ?auto_370713 ) ( ON ?auto_370711 ?auto_370712 ) ( ON ?auto_370710 ?auto_370711 ) ( ON ?auto_370709 ?auto_370710 ) ( ON ?auto_370708 ?auto_370709 ) ( ON ?auto_370707 ?auto_370708 ) ( CLEAR ?auto_370705 ) ( ON ?auto_370706 ?auto_370707 ) ( CLEAR ?auto_370706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_370701 ?auto_370702 ?auto_370703 ?auto_370704 ?auto_370705 ?auto_370706 )
      ( MAKE-15PILE ?auto_370701 ?auto_370702 ?auto_370703 ?auto_370704 ?auto_370705 ?auto_370706 ?auto_370707 ?auto_370708 ?auto_370709 ?auto_370710 ?auto_370711 ?auto_370712 ?auto_370713 ?auto_370714 ?auto_370715 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370731 - BLOCK
      ?auto_370732 - BLOCK
      ?auto_370733 - BLOCK
      ?auto_370734 - BLOCK
      ?auto_370735 - BLOCK
      ?auto_370736 - BLOCK
      ?auto_370737 - BLOCK
      ?auto_370738 - BLOCK
      ?auto_370739 - BLOCK
      ?auto_370740 - BLOCK
      ?auto_370741 - BLOCK
      ?auto_370742 - BLOCK
      ?auto_370743 - BLOCK
      ?auto_370744 - BLOCK
      ?auto_370745 - BLOCK
    )
    :vars
    (
      ?auto_370746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_370745 ?auto_370746 ) ( ON-TABLE ?auto_370731 ) ( ON ?auto_370732 ?auto_370731 ) ( ON ?auto_370733 ?auto_370732 ) ( ON ?auto_370734 ?auto_370733 ) ( not ( = ?auto_370731 ?auto_370732 ) ) ( not ( = ?auto_370731 ?auto_370733 ) ) ( not ( = ?auto_370731 ?auto_370734 ) ) ( not ( = ?auto_370731 ?auto_370735 ) ) ( not ( = ?auto_370731 ?auto_370736 ) ) ( not ( = ?auto_370731 ?auto_370737 ) ) ( not ( = ?auto_370731 ?auto_370738 ) ) ( not ( = ?auto_370731 ?auto_370739 ) ) ( not ( = ?auto_370731 ?auto_370740 ) ) ( not ( = ?auto_370731 ?auto_370741 ) ) ( not ( = ?auto_370731 ?auto_370742 ) ) ( not ( = ?auto_370731 ?auto_370743 ) ) ( not ( = ?auto_370731 ?auto_370744 ) ) ( not ( = ?auto_370731 ?auto_370745 ) ) ( not ( = ?auto_370731 ?auto_370746 ) ) ( not ( = ?auto_370732 ?auto_370733 ) ) ( not ( = ?auto_370732 ?auto_370734 ) ) ( not ( = ?auto_370732 ?auto_370735 ) ) ( not ( = ?auto_370732 ?auto_370736 ) ) ( not ( = ?auto_370732 ?auto_370737 ) ) ( not ( = ?auto_370732 ?auto_370738 ) ) ( not ( = ?auto_370732 ?auto_370739 ) ) ( not ( = ?auto_370732 ?auto_370740 ) ) ( not ( = ?auto_370732 ?auto_370741 ) ) ( not ( = ?auto_370732 ?auto_370742 ) ) ( not ( = ?auto_370732 ?auto_370743 ) ) ( not ( = ?auto_370732 ?auto_370744 ) ) ( not ( = ?auto_370732 ?auto_370745 ) ) ( not ( = ?auto_370732 ?auto_370746 ) ) ( not ( = ?auto_370733 ?auto_370734 ) ) ( not ( = ?auto_370733 ?auto_370735 ) ) ( not ( = ?auto_370733 ?auto_370736 ) ) ( not ( = ?auto_370733 ?auto_370737 ) ) ( not ( = ?auto_370733 ?auto_370738 ) ) ( not ( = ?auto_370733 ?auto_370739 ) ) ( not ( = ?auto_370733 ?auto_370740 ) ) ( not ( = ?auto_370733 ?auto_370741 ) ) ( not ( = ?auto_370733 ?auto_370742 ) ) ( not ( = ?auto_370733 ?auto_370743 ) ) ( not ( = ?auto_370733 ?auto_370744 ) ) ( not ( = ?auto_370733 ?auto_370745 ) ) ( not ( = ?auto_370733 ?auto_370746 ) ) ( not ( = ?auto_370734 ?auto_370735 ) ) ( not ( = ?auto_370734 ?auto_370736 ) ) ( not ( = ?auto_370734 ?auto_370737 ) ) ( not ( = ?auto_370734 ?auto_370738 ) ) ( not ( = ?auto_370734 ?auto_370739 ) ) ( not ( = ?auto_370734 ?auto_370740 ) ) ( not ( = ?auto_370734 ?auto_370741 ) ) ( not ( = ?auto_370734 ?auto_370742 ) ) ( not ( = ?auto_370734 ?auto_370743 ) ) ( not ( = ?auto_370734 ?auto_370744 ) ) ( not ( = ?auto_370734 ?auto_370745 ) ) ( not ( = ?auto_370734 ?auto_370746 ) ) ( not ( = ?auto_370735 ?auto_370736 ) ) ( not ( = ?auto_370735 ?auto_370737 ) ) ( not ( = ?auto_370735 ?auto_370738 ) ) ( not ( = ?auto_370735 ?auto_370739 ) ) ( not ( = ?auto_370735 ?auto_370740 ) ) ( not ( = ?auto_370735 ?auto_370741 ) ) ( not ( = ?auto_370735 ?auto_370742 ) ) ( not ( = ?auto_370735 ?auto_370743 ) ) ( not ( = ?auto_370735 ?auto_370744 ) ) ( not ( = ?auto_370735 ?auto_370745 ) ) ( not ( = ?auto_370735 ?auto_370746 ) ) ( not ( = ?auto_370736 ?auto_370737 ) ) ( not ( = ?auto_370736 ?auto_370738 ) ) ( not ( = ?auto_370736 ?auto_370739 ) ) ( not ( = ?auto_370736 ?auto_370740 ) ) ( not ( = ?auto_370736 ?auto_370741 ) ) ( not ( = ?auto_370736 ?auto_370742 ) ) ( not ( = ?auto_370736 ?auto_370743 ) ) ( not ( = ?auto_370736 ?auto_370744 ) ) ( not ( = ?auto_370736 ?auto_370745 ) ) ( not ( = ?auto_370736 ?auto_370746 ) ) ( not ( = ?auto_370737 ?auto_370738 ) ) ( not ( = ?auto_370737 ?auto_370739 ) ) ( not ( = ?auto_370737 ?auto_370740 ) ) ( not ( = ?auto_370737 ?auto_370741 ) ) ( not ( = ?auto_370737 ?auto_370742 ) ) ( not ( = ?auto_370737 ?auto_370743 ) ) ( not ( = ?auto_370737 ?auto_370744 ) ) ( not ( = ?auto_370737 ?auto_370745 ) ) ( not ( = ?auto_370737 ?auto_370746 ) ) ( not ( = ?auto_370738 ?auto_370739 ) ) ( not ( = ?auto_370738 ?auto_370740 ) ) ( not ( = ?auto_370738 ?auto_370741 ) ) ( not ( = ?auto_370738 ?auto_370742 ) ) ( not ( = ?auto_370738 ?auto_370743 ) ) ( not ( = ?auto_370738 ?auto_370744 ) ) ( not ( = ?auto_370738 ?auto_370745 ) ) ( not ( = ?auto_370738 ?auto_370746 ) ) ( not ( = ?auto_370739 ?auto_370740 ) ) ( not ( = ?auto_370739 ?auto_370741 ) ) ( not ( = ?auto_370739 ?auto_370742 ) ) ( not ( = ?auto_370739 ?auto_370743 ) ) ( not ( = ?auto_370739 ?auto_370744 ) ) ( not ( = ?auto_370739 ?auto_370745 ) ) ( not ( = ?auto_370739 ?auto_370746 ) ) ( not ( = ?auto_370740 ?auto_370741 ) ) ( not ( = ?auto_370740 ?auto_370742 ) ) ( not ( = ?auto_370740 ?auto_370743 ) ) ( not ( = ?auto_370740 ?auto_370744 ) ) ( not ( = ?auto_370740 ?auto_370745 ) ) ( not ( = ?auto_370740 ?auto_370746 ) ) ( not ( = ?auto_370741 ?auto_370742 ) ) ( not ( = ?auto_370741 ?auto_370743 ) ) ( not ( = ?auto_370741 ?auto_370744 ) ) ( not ( = ?auto_370741 ?auto_370745 ) ) ( not ( = ?auto_370741 ?auto_370746 ) ) ( not ( = ?auto_370742 ?auto_370743 ) ) ( not ( = ?auto_370742 ?auto_370744 ) ) ( not ( = ?auto_370742 ?auto_370745 ) ) ( not ( = ?auto_370742 ?auto_370746 ) ) ( not ( = ?auto_370743 ?auto_370744 ) ) ( not ( = ?auto_370743 ?auto_370745 ) ) ( not ( = ?auto_370743 ?auto_370746 ) ) ( not ( = ?auto_370744 ?auto_370745 ) ) ( not ( = ?auto_370744 ?auto_370746 ) ) ( not ( = ?auto_370745 ?auto_370746 ) ) ( ON ?auto_370744 ?auto_370745 ) ( ON ?auto_370743 ?auto_370744 ) ( ON ?auto_370742 ?auto_370743 ) ( ON ?auto_370741 ?auto_370742 ) ( ON ?auto_370740 ?auto_370741 ) ( ON ?auto_370739 ?auto_370740 ) ( ON ?auto_370738 ?auto_370739 ) ( ON ?auto_370737 ?auto_370738 ) ( ON ?auto_370736 ?auto_370737 ) ( CLEAR ?auto_370734 ) ( ON ?auto_370735 ?auto_370736 ) ( CLEAR ?auto_370735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_370731 ?auto_370732 ?auto_370733 ?auto_370734 ?auto_370735 )
      ( MAKE-15PILE ?auto_370731 ?auto_370732 ?auto_370733 ?auto_370734 ?auto_370735 ?auto_370736 ?auto_370737 ?auto_370738 ?auto_370739 ?auto_370740 ?auto_370741 ?auto_370742 ?auto_370743 ?auto_370744 ?auto_370745 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370762 - BLOCK
      ?auto_370763 - BLOCK
      ?auto_370764 - BLOCK
      ?auto_370765 - BLOCK
      ?auto_370766 - BLOCK
      ?auto_370767 - BLOCK
      ?auto_370768 - BLOCK
      ?auto_370769 - BLOCK
      ?auto_370770 - BLOCK
      ?auto_370771 - BLOCK
      ?auto_370772 - BLOCK
      ?auto_370773 - BLOCK
      ?auto_370774 - BLOCK
      ?auto_370775 - BLOCK
      ?auto_370776 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_370776 ) ( ON-TABLE ?auto_370762 ) ( ON ?auto_370763 ?auto_370762 ) ( ON ?auto_370764 ?auto_370763 ) ( ON ?auto_370765 ?auto_370764 ) ( not ( = ?auto_370762 ?auto_370763 ) ) ( not ( = ?auto_370762 ?auto_370764 ) ) ( not ( = ?auto_370762 ?auto_370765 ) ) ( not ( = ?auto_370762 ?auto_370766 ) ) ( not ( = ?auto_370762 ?auto_370767 ) ) ( not ( = ?auto_370762 ?auto_370768 ) ) ( not ( = ?auto_370762 ?auto_370769 ) ) ( not ( = ?auto_370762 ?auto_370770 ) ) ( not ( = ?auto_370762 ?auto_370771 ) ) ( not ( = ?auto_370762 ?auto_370772 ) ) ( not ( = ?auto_370762 ?auto_370773 ) ) ( not ( = ?auto_370762 ?auto_370774 ) ) ( not ( = ?auto_370762 ?auto_370775 ) ) ( not ( = ?auto_370762 ?auto_370776 ) ) ( not ( = ?auto_370763 ?auto_370764 ) ) ( not ( = ?auto_370763 ?auto_370765 ) ) ( not ( = ?auto_370763 ?auto_370766 ) ) ( not ( = ?auto_370763 ?auto_370767 ) ) ( not ( = ?auto_370763 ?auto_370768 ) ) ( not ( = ?auto_370763 ?auto_370769 ) ) ( not ( = ?auto_370763 ?auto_370770 ) ) ( not ( = ?auto_370763 ?auto_370771 ) ) ( not ( = ?auto_370763 ?auto_370772 ) ) ( not ( = ?auto_370763 ?auto_370773 ) ) ( not ( = ?auto_370763 ?auto_370774 ) ) ( not ( = ?auto_370763 ?auto_370775 ) ) ( not ( = ?auto_370763 ?auto_370776 ) ) ( not ( = ?auto_370764 ?auto_370765 ) ) ( not ( = ?auto_370764 ?auto_370766 ) ) ( not ( = ?auto_370764 ?auto_370767 ) ) ( not ( = ?auto_370764 ?auto_370768 ) ) ( not ( = ?auto_370764 ?auto_370769 ) ) ( not ( = ?auto_370764 ?auto_370770 ) ) ( not ( = ?auto_370764 ?auto_370771 ) ) ( not ( = ?auto_370764 ?auto_370772 ) ) ( not ( = ?auto_370764 ?auto_370773 ) ) ( not ( = ?auto_370764 ?auto_370774 ) ) ( not ( = ?auto_370764 ?auto_370775 ) ) ( not ( = ?auto_370764 ?auto_370776 ) ) ( not ( = ?auto_370765 ?auto_370766 ) ) ( not ( = ?auto_370765 ?auto_370767 ) ) ( not ( = ?auto_370765 ?auto_370768 ) ) ( not ( = ?auto_370765 ?auto_370769 ) ) ( not ( = ?auto_370765 ?auto_370770 ) ) ( not ( = ?auto_370765 ?auto_370771 ) ) ( not ( = ?auto_370765 ?auto_370772 ) ) ( not ( = ?auto_370765 ?auto_370773 ) ) ( not ( = ?auto_370765 ?auto_370774 ) ) ( not ( = ?auto_370765 ?auto_370775 ) ) ( not ( = ?auto_370765 ?auto_370776 ) ) ( not ( = ?auto_370766 ?auto_370767 ) ) ( not ( = ?auto_370766 ?auto_370768 ) ) ( not ( = ?auto_370766 ?auto_370769 ) ) ( not ( = ?auto_370766 ?auto_370770 ) ) ( not ( = ?auto_370766 ?auto_370771 ) ) ( not ( = ?auto_370766 ?auto_370772 ) ) ( not ( = ?auto_370766 ?auto_370773 ) ) ( not ( = ?auto_370766 ?auto_370774 ) ) ( not ( = ?auto_370766 ?auto_370775 ) ) ( not ( = ?auto_370766 ?auto_370776 ) ) ( not ( = ?auto_370767 ?auto_370768 ) ) ( not ( = ?auto_370767 ?auto_370769 ) ) ( not ( = ?auto_370767 ?auto_370770 ) ) ( not ( = ?auto_370767 ?auto_370771 ) ) ( not ( = ?auto_370767 ?auto_370772 ) ) ( not ( = ?auto_370767 ?auto_370773 ) ) ( not ( = ?auto_370767 ?auto_370774 ) ) ( not ( = ?auto_370767 ?auto_370775 ) ) ( not ( = ?auto_370767 ?auto_370776 ) ) ( not ( = ?auto_370768 ?auto_370769 ) ) ( not ( = ?auto_370768 ?auto_370770 ) ) ( not ( = ?auto_370768 ?auto_370771 ) ) ( not ( = ?auto_370768 ?auto_370772 ) ) ( not ( = ?auto_370768 ?auto_370773 ) ) ( not ( = ?auto_370768 ?auto_370774 ) ) ( not ( = ?auto_370768 ?auto_370775 ) ) ( not ( = ?auto_370768 ?auto_370776 ) ) ( not ( = ?auto_370769 ?auto_370770 ) ) ( not ( = ?auto_370769 ?auto_370771 ) ) ( not ( = ?auto_370769 ?auto_370772 ) ) ( not ( = ?auto_370769 ?auto_370773 ) ) ( not ( = ?auto_370769 ?auto_370774 ) ) ( not ( = ?auto_370769 ?auto_370775 ) ) ( not ( = ?auto_370769 ?auto_370776 ) ) ( not ( = ?auto_370770 ?auto_370771 ) ) ( not ( = ?auto_370770 ?auto_370772 ) ) ( not ( = ?auto_370770 ?auto_370773 ) ) ( not ( = ?auto_370770 ?auto_370774 ) ) ( not ( = ?auto_370770 ?auto_370775 ) ) ( not ( = ?auto_370770 ?auto_370776 ) ) ( not ( = ?auto_370771 ?auto_370772 ) ) ( not ( = ?auto_370771 ?auto_370773 ) ) ( not ( = ?auto_370771 ?auto_370774 ) ) ( not ( = ?auto_370771 ?auto_370775 ) ) ( not ( = ?auto_370771 ?auto_370776 ) ) ( not ( = ?auto_370772 ?auto_370773 ) ) ( not ( = ?auto_370772 ?auto_370774 ) ) ( not ( = ?auto_370772 ?auto_370775 ) ) ( not ( = ?auto_370772 ?auto_370776 ) ) ( not ( = ?auto_370773 ?auto_370774 ) ) ( not ( = ?auto_370773 ?auto_370775 ) ) ( not ( = ?auto_370773 ?auto_370776 ) ) ( not ( = ?auto_370774 ?auto_370775 ) ) ( not ( = ?auto_370774 ?auto_370776 ) ) ( not ( = ?auto_370775 ?auto_370776 ) ) ( ON ?auto_370775 ?auto_370776 ) ( ON ?auto_370774 ?auto_370775 ) ( ON ?auto_370773 ?auto_370774 ) ( ON ?auto_370772 ?auto_370773 ) ( ON ?auto_370771 ?auto_370772 ) ( ON ?auto_370770 ?auto_370771 ) ( ON ?auto_370769 ?auto_370770 ) ( ON ?auto_370768 ?auto_370769 ) ( ON ?auto_370767 ?auto_370768 ) ( CLEAR ?auto_370765 ) ( ON ?auto_370766 ?auto_370767 ) ( CLEAR ?auto_370766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_370762 ?auto_370763 ?auto_370764 ?auto_370765 ?auto_370766 )
      ( MAKE-15PILE ?auto_370762 ?auto_370763 ?auto_370764 ?auto_370765 ?auto_370766 ?auto_370767 ?auto_370768 ?auto_370769 ?auto_370770 ?auto_370771 ?auto_370772 ?auto_370773 ?auto_370774 ?auto_370775 ?auto_370776 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370792 - BLOCK
      ?auto_370793 - BLOCK
      ?auto_370794 - BLOCK
      ?auto_370795 - BLOCK
      ?auto_370796 - BLOCK
      ?auto_370797 - BLOCK
      ?auto_370798 - BLOCK
      ?auto_370799 - BLOCK
      ?auto_370800 - BLOCK
      ?auto_370801 - BLOCK
      ?auto_370802 - BLOCK
      ?auto_370803 - BLOCK
      ?auto_370804 - BLOCK
      ?auto_370805 - BLOCK
      ?auto_370806 - BLOCK
    )
    :vars
    (
      ?auto_370807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_370806 ?auto_370807 ) ( ON-TABLE ?auto_370792 ) ( ON ?auto_370793 ?auto_370792 ) ( ON ?auto_370794 ?auto_370793 ) ( not ( = ?auto_370792 ?auto_370793 ) ) ( not ( = ?auto_370792 ?auto_370794 ) ) ( not ( = ?auto_370792 ?auto_370795 ) ) ( not ( = ?auto_370792 ?auto_370796 ) ) ( not ( = ?auto_370792 ?auto_370797 ) ) ( not ( = ?auto_370792 ?auto_370798 ) ) ( not ( = ?auto_370792 ?auto_370799 ) ) ( not ( = ?auto_370792 ?auto_370800 ) ) ( not ( = ?auto_370792 ?auto_370801 ) ) ( not ( = ?auto_370792 ?auto_370802 ) ) ( not ( = ?auto_370792 ?auto_370803 ) ) ( not ( = ?auto_370792 ?auto_370804 ) ) ( not ( = ?auto_370792 ?auto_370805 ) ) ( not ( = ?auto_370792 ?auto_370806 ) ) ( not ( = ?auto_370792 ?auto_370807 ) ) ( not ( = ?auto_370793 ?auto_370794 ) ) ( not ( = ?auto_370793 ?auto_370795 ) ) ( not ( = ?auto_370793 ?auto_370796 ) ) ( not ( = ?auto_370793 ?auto_370797 ) ) ( not ( = ?auto_370793 ?auto_370798 ) ) ( not ( = ?auto_370793 ?auto_370799 ) ) ( not ( = ?auto_370793 ?auto_370800 ) ) ( not ( = ?auto_370793 ?auto_370801 ) ) ( not ( = ?auto_370793 ?auto_370802 ) ) ( not ( = ?auto_370793 ?auto_370803 ) ) ( not ( = ?auto_370793 ?auto_370804 ) ) ( not ( = ?auto_370793 ?auto_370805 ) ) ( not ( = ?auto_370793 ?auto_370806 ) ) ( not ( = ?auto_370793 ?auto_370807 ) ) ( not ( = ?auto_370794 ?auto_370795 ) ) ( not ( = ?auto_370794 ?auto_370796 ) ) ( not ( = ?auto_370794 ?auto_370797 ) ) ( not ( = ?auto_370794 ?auto_370798 ) ) ( not ( = ?auto_370794 ?auto_370799 ) ) ( not ( = ?auto_370794 ?auto_370800 ) ) ( not ( = ?auto_370794 ?auto_370801 ) ) ( not ( = ?auto_370794 ?auto_370802 ) ) ( not ( = ?auto_370794 ?auto_370803 ) ) ( not ( = ?auto_370794 ?auto_370804 ) ) ( not ( = ?auto_370794 ?auto_370805 ) ) ( not ( = ?auto_370794 ?auto_370806 ) ) ( not ( = ?auto_370794 ?auto_370807 ) ) ( not ( = ?auto_370795 ?auto_370796 ) ) ( not ( = ?auto_370795 ?auto_370797 ) ) ( not ( = ?auto_370795 ?auto_370798 ) ) ( not ( = ?auto_370795 ?auto_370799 ) ) ( not ( = ?auto_370795 ?auto_370800 ) ) ( not ( = ?auto_370795 ?auto_370801 ) ) ( not ( = ?auto_370795 ?auto_370802 ) ) ( not ( = ?auto_370795 ?auto_370803 ) ) ( not ( = ?auto_370795 ?auto_370804 ) ) ( not ( = ?auto_370795 ?auto_370805 ) ) ( not ( = ?auto_370795 ?auto_370806 ) ) ( not ( = ?auto_370795 ?auto_370807 ) ) ( not ( = ?auto_370796 ?auto_370797 ) ) ( not ( = ?auto_370796 ?auto_370798 ) ) ( not ( = ?auto_370796 ?auto_370799 ) ) ( not ( = ?auto_370796 ?auto_370800 ) ) ( not ( = ?auto_370796 ?auto_370801 ) ) ( not ( = ?auto_370796 ?auto_370802 ) ) ( not ( = ?auto_370796 ?auto_370803 ) ) ( not ( = ?auto_370796 ?auto_370804 ) ) ( not ( = ?auto_370796 ?auto_370805 ) ) ( not ( = ?auto_370796 ?auto_370806 ) ) ( not ( = ?auto_370796 ?auto_370807 ) ) ( not ( = ?auto_370797 ?auto_370798 ) ) ( not ( = ?auto_370797 ?auto_370799 ) ) ( not ( = ?auto_370797 ?auto_370800 ) ) ( not ( = ?auto_370797 ?auto_370801 ) ) ( not ( = ?auto_370797 ?auto_370802 ) ) ( not ( = ?auto_370797 ?auto_370803 ) ) ( not ( = ?auto_370797 ?auto_370804 ) ) ( not ( = ?auto_370797 ?auto_370805 ) ) ( not ( = ?auto_370797 ?auto_370806 ) ) ( not ( = ?auto_370797 ?auto_370807 ) ) ( not ( = ?auto_370798 ?auto_370799 ) ) ( not ( = ?auto_370798 ?auto_370800 ) ) ( not ( = ?auto_370798 ?auto_370801 ) ) ( not ( = ?auto_370798 ?auto_370802 ) ) ( not ( = ?auto_370798 ?auto_370803 ) ) ( not ( = ?auto_370798 ?auto_370804 ) ) ( not ( = ?auto_370798 ?auto_370805 ) ) ( not ( = ?auto_370798 ?auto_370806 ) ) ( not ( = ?auto_370798 ?auto_370807 ) ) ( not ( = ?auto_370799 ?auto_370800 ) ) ( not ( = ?auto_370799 ?auto_370801 ) ) ( not ( = ?auto_370799 ?auto_370802 ) ) ( not ( = ?auto_370799 ?auto_370803 ) ) ( not ( = ?auto_370799 ?auto_370804 ) ) ( not ( = ?auto_370799 ?auto_370805 ) ) ( not ( = ?auto_370799 ?auto_370806 ) ) ( not ( = ?auto_370799 ?auto_370807 ) ) ( not ( = ?auto_370800 ?auto_370801 ) ) ( not ( = ?auto_370800 ?auto_370802 ) ) ( not ( = ?auto_370800 ?auto_370803 ) ) ( not ( = ?auto_370800 ?auto_370804 ) ) ( not ( = ?auto_370800 ?auto_370805 ) ) ( not ( = ?auto_370800 ?auto_370806 ) ) ( not ( = ?auto_370800 ?auto_370807 ) ) ( not ( = ?auto_370801 ?auto_370802 ) ) ( not ( = ?auto_370801 ?auto_370803 ) ) ( not ( = ?auto_370801 ?auto_370804 ) ) ( not ( = ?auto_370801 ?auto_370805 ) ) ( not ( = ?auto_370801 ?auto_370806 ) ) ( not ( = ?auto_370801 ?auto_370807 ) ) ( not ( = ?auto_370802 ?auto_370803 ) ) ( not ( = ?auto_370802 ?auto_370804 ) ) ( not ( = ?auto_370802 ?auto_370805 ) ) ( not ( = ?auto_370802 ?auto_370806 ) ) ( not ( = ?auto_370802 ?auto_370807 ) ) ( not ( = ?auto_370803 ?auto_370804 ) ) ( not ( = ?auto_370803 ?auto_370805 ) ) ( not ( = ?auto_370803 ?auto_370806 ) ) ( not ( = ?auto_370803 ?auto_370807 ) ) ( not ( = ?auto_370804 ?auto_370805 ) ) ( not ( = ?auto_370804 ?auto_370806 ) ) ( not ( = ?auto_370804 ?auto_370807 ) ) ( not ( = ?auto_370805 ?auto_370806 ) ) ( not ( = ?auto_370805 ?auto_370807 ) ) ( not ( = ?auto_370806 ?auto_370807 ) ) ( ON ?auto_370805 ?auto_370806 ) ( ON ?auto_370804 ?auto_370805 ) ( ON ?auto_370803 ?auto_370804 ) ( ON ?auto_370802 ?auto_370803 ) ( ON ?auto_370801 ?auto_370802 ) ( ON ?auto_370800 ?auto_370801 ) ( ON ?auto_370799 ?auto_370800 ) ( ON ?auto_370798 ?auto_370799 ) ( ON ?auto_370797 ?auto_370798 ) ( ON ?auto_370796 ?auto_370797 ) ( CLEAR ?auto_370794 ) ( ON ?auto_370795 ?auto_370796 ) ( CLEAR ?auto_370795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_370792 ?auto_370793 ?auto_370794 ?auto_370795 )
      ( MAKE-15PILE ?auto_370792 ?auto_370793 ?auto_370794 ?auto_370795 ?auto_370796 ?auto_370797 ?auto_370798 ?auto_370799 ?auto_370800 ?auto_370801 ?auto_370802 ?auto_370803 ?auto_370804 ?auto_370805 ?auto_370806 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370823 - BLOCK
      ?auto_370824 - BLOCK
      ?auto_370825 - BLOCK
      ?auto_370826 - BLOCK
      ?auto_370827 - BLOCK
      ?auto_370828 - BLOCK
      ?auto_370829 - BLOCK
      ?auto_370830 - BLOCK
      ?auto_370831 - BLOCK
      ?auto_370832 - BLOCK
      ?auto_370833 - BLOCK
      ?auto_370834 - BLOCK
      ?auto_370835 - BLOCK
      ?auto_370836 - BLOCK
      ?auto_370837 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_370837 ) ( ON-TABLE ?auto_370823 ) ( ON ?auto_370824 ?auto_370823 ) ( ON ?auto_370825 ?auto_370824 ) ( not ( = ?auto_370823 ?auto_370824 ) ) ( not ( = ?auto_370823 ?auto_370825 ) ) ( not ( = ?auto_370823 ?auto_370826 ) ) ( not ( = ?auto_370823 ?auto_370827 ) ) ( not ( = ?auto_370823 ?auto_370828 ) ) ( not ( = ?auto_370823 ?auto_370829 ) ) ( not ( = ?auto_370823 ?auto_370830 ) ) ( not ( = ?auto_370823 ?auto_370831 ) ) ( not ( = ?auto_370823 ?auto_370832 ) ) ( not ( = ?auto_370823 ?auto_370833 ) ) ( not ( = ?auto_370823 ?auto_370834 ) ) ( not ( = ?auto_370823 ?auto_370835 ) ) ( not ( = ?auto_370823 ?auto_370836 ) ) ( not ( = ?auto_370823 ?auto_370837 ) ) ( not ( = ?auto_370824 ?auto_370825 ) ) ( not ( = ?auto_370824 ?auto_370826 ) ) ( not ( = ?auto_370824 ?auto_370827 ) ) ( not ( = ?auto_370824 ?auto_370828 ) ) ( not ( = ?auto_370824 ?auto_370829 ) ) ( not ( = ?auto_370824 ?auto_370830 ) ) ( not ( = ?auto_370824 ?auto_370831 ) ) ( not ( = ?auto_370824 ?auto_370832 ) ) ( not ( = ?auto_370824 ?auto_370833 ) ) ( not ( = ?auto_370824 ?auto_370834 ) ) ( not ( = ?auto_370824 ?auto_370835 ) ) ( not ( = ?auto_370824 ?auto_370836 ) ) ( not ( = ?auto_370824 ?auto_370837 ) ) ( not ( = ?auto_370825 ?auto_370826 ) ) ( not ( = ?auto_370825 ?auto_370827 ) ) ( not ( = ?auto_370825 ?auto_370828 ) ) ( not ( = ?auto_370825 ?auto_370829 ) ) ( not ( = ?auto_370825 ?auto_370830 ) ) ( not ( = ?auto_370825 ?auto_370831 ) ) ( not ( = ?auto_370825 ?auto_370832 ) ) ( not ( = ?auto_370825 ?auto_370833 ) ) ( not ( = ?auto_370825 ?auto_370834 ) ) ( not ( = ?auto_370825 ?auto_370835 ) ) ( not ( = ?auto_370825 ?auto_370836 ) ) ( not ( = ?auto_370825 ?auto_370837 ) ) ( not ( = ?auto_370826 ?auto_370827 ) ) ( not ( = ?auto_370826 ?auto_370828 ) ) ( not ( = ?auto_370826 ?auto_370829 ) ) ( not ( = ?auto_370826 ?auto_370830 ) ) ( not ( = ?auto_370826 ?auto_370831 ) ) ( not ( = ?auto_370826 ?auto_370832 ) ) ( not ( = ?auto_370826 ?auto_370833 ) ) ( not ( = ?auto_370826 ?auto_370834 ) ) ( not ( = ?auto_370826 ?auto_370835 ) ) ( not ( = ?auto_370826 ?auto_370836 ) ) ( not ( = ?auto_370826 ?auto_370837 ) ) ( not ( = ?auto_370827 ?auto_370828 ) ) ( not ( = ?auto_370827 ?auto_370829 ) ) ( not ( = ?auto_370827 ?auto_370830 ) ) ( not ( = ?auto_370827 ?auto_370831 ) ) ( not ( = ?auto_370827 ?auto_370832 ) ) ( not ( = ?auto_370827 ?auto_370833 ) ) ( not ( = ?auto_370827 ?auto_370834 ) ) ( not ( = ?auto_370827 ?auto_370835 ) ) ( not ( = ?auto_370827 ?auto_370836 ) ) ( not ( = ?auto_370827 ?auto_370837 ) ) ( not ( = ?auto_370828 ?auto_370829 ) ) ( not ( = ?auto_370828 ?auto_370830 ) ) ( not ( = ?auto_370828 ?auto_370831 ) ) ( not ( = ?auto_370828 ?auto_370832 ) ) ( not ( = ?auto_370828 ?auto_370833 ) ) ( not ( = ?auto_370828 ?auto_370834 ) ) ( not ( = ?auto_370828 ?auto_370835 ) ) ( not ( = ?auto_370828 ?auto_370836 ) ) ( not ( = ?auto_370828 ?auto_370837 ) ) ( not ( = ?auto_370829 ?auto_370830 ) ) ( not ( = ?auto_370829 ?auto_370831 ) ) ( not ( = ?auto_370829 ?auto_370832 ) ) ( not ( = ?auto_370829 ?auto_370833 ) ) ( not ( = ?auto_370829 ?auto_370834 ) ) ( not ( = ?auto_370829 ?auto_370835 ) ) ( not ( = ?auto_370829 ?auto_370836 ) ) ( not ( = ?auto_370829 ?auto_370837 ) ) ( not ( = ?auto_370830 ?auto_370831 ) ) ( not ( = ?auto_370830 ?auto_370832 ) ) ( not ( = ?auto_370830 ?auto_370833 ) ) ( not ( = ?auto_370830 ?auto_370834 ) ) ( not ( = ?auto_370830 ?auto_370835 ) ) ( not ( = ?auto_370830 ?auto_370836 ) ) ( not ( = ?auto_370830 ?auto_370837 ) ) ( not ( = ?auto_370831 ?auto_370832 ) ) ( not ( = ?auto_370831 ?auto_370833 ) ) ( not ( = ?auto_370831 ?auto_370834 ) ) ( not ( = ?auto_370831 ?auto_370835 ) ) ( not ( = ?auto_370831 ?auto_370836 ) ) ( not ( = ?auto_370831 ?auto_370837 ) ) ( not ( = ?auto_370832 ?auto_370833 ) ) ( not ( = ?auto_370832 ?auto_370834 ) ) ( not ( = ?auto_370832 ?auto_370835 ) ) ( not ( = ?auto_370832 ?auto_370836 ) ) ( not ( = ?auto_370832 ?auto_370837 ) ) ( not ( = ?auto_370833 ?auto_370834 ) ) ( not ( = ?auto_370833 ?auto_370835 ) ) ( not ( = ?auto_370833 ?auto_370836 ) ) ( not ( = ?auto_370833 ?auto_370837 ) ) ( not ( = ?auto_370834 ?auto_370835 ) ) ( not ( = ?auto_370834 ?auto_370836 ) ) ( not ( = ?auto_370834 ?auto_370837 ) ) ( not ( = ?auto_370835 ?auto_370836 ) ) ( not ( = ?auto_370835 ?auto_370837 ) ) ( not ( = ?auto_370836 ?auto_370837 ) ) ( ON ?auto_370836 ?auto_370837 ) ( ON ?auto_370835 ?auto_370836 ) ( ON ?auto_370834 ?auto_370835 ) ( ON ?auto_370833 ?auto_370834 ) ( ON ?auto_370832 ?auto_370833 ) ( ON ?auto_370831 ?auto_370832 ) ( ON ?auto_370830 ?auto_370831 ) ( ON ?auto_370829 ?auto_370830 ) ( ON ?auto_370828 ?auto_370829 ) ( ON ?auto_370827 ?auto_370828 ) ( CLEAR ?auto_370825 ) ( ON ?auto_370826 ?auto_370827 ) ( CLEAR ?auto_370826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_370823 ?auto_370824 ?auto_370825 ?auto_370826 )
      ( MAKE-15PILE ?auto_370823 ?auto_370824 ?auto_370825 ?auto_370826 ?auto_370827 ?auto_370828 ?auto_370829 ?auto_370830 ?auto_370831 ?auto_370832 ?auto_370833 ?auto_370834 ?auto_370835 ?auto_370836 ?auto_370837 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370853 - BLOCK
      ?auto_370854 - BLOCK
      ?auto_370855 - BLOCK
      ?auto_370856 - BLOCK
      ?auto_370857 - BLOCK
      ?auto_370858 - BLOCK
      ?auto_370859 - BLOCK
      ?auto_370860 - BLOCK
      ?auto_370861 - BLOCK
      ?auto_370862 - BLOCK
      ?auto_370863 - BLOCK
      ?auto_370864 - BLOCK
      ?auto_370865 - BLOCK
      ?auto_370866 - BLOCK
      ?auto_370867 - BLOCK
    )
    :vars
    (
      ?auto_370868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_370867 ?auto_370868 ) ( ON-TABLE ?auto_370853 ) ( ON ?auto_370854 ?auto_370853 ) ( not ( = ?auto_370853 ?auto_370854 ) ) ( not ( = ?auto_370853 ?auto_370855 ) ) ( not ( = ?auto_370853 ?auto_370856 ) ) ( not ( = ?auto_370853 ?auto_370857 ) ) ( not ( = ?auto_370853 ?auto_370858 ) ) ( not ( = ?auto_370853 ?auto_370859 ) ) ( not ( = ?auto_370853 ?auto_370860 ) ) ( not ( = ?auto_370853 ?auto_370861 ) ) ( not ( = ?auto_370853 ?auto_370862 ) ) ( not ( = ?auto_370853 ?auto_370863 ) ) ( not ( = ?auto_370853 ?auto_370864 ) ) ( not ( = ?auto_370853 ?auto_370865 ) ) ( not ( = ?auto_370853 ?auto_370866 ) ) ( not ( = ?auto_370853 ?auto_370867 ) ) ( not ( = ?auto_370853 ?auto_370868 ) ) ( not ( = ?auto_370854 ?auto_370855 ) ) ( not ( = ?auto_370854 ?auto_370856 ) ) ( not ( = ?auto_370854 ?auto_370857 ) ) ( not ( = ?auto_370854 ?auto_370858 ) ) ( not ( = ?auto_370854 ?auto_370859 ) ) ( not ( = ?auto_370854 ?auto_370860 ) ) ( not ( = ?auto_370854 ?auto_370861 ) ) ( not ( = ?auto_370854 ?auto_370862 ) ) ( not ( = ?auto_370854 ?auto_370863 ) ) ( not ( = ?auto_370854 ?auto_370864 ) ) ( not ( = ?auto_370854 ?auto_370865 ) ) ( not ( = ?auto_370854 ?auto_370866 ) ) ( not ( = ?auto_370854 ?auto_370867 ) ) ( not ( = ?auto_370854 ?auto_370868 ) ) ( not ( = ?auto_370855 ?auto_370856 ) ) ( not ( = ?auto_370855 ?auto_370857 ) ) ( not ( = ?auto_370855 ?auto_370858 ) ) ( not ( = ?auto_370855 ?auto_370859 ) ) ( not ( = ?auto_370855 ?auto_370860 ) ) ( not ( = ?auto_370855 ?auto_370861 ) ) ( not ( = ?auto_370855 ?auto_370862 ) ) ( not ( = ?auto_370855 ?auto_370863 ) ) ( not ( = ?auto_370855 ?auto_370864 ) ) ( not ( = ?auto_370855 ?auto_370865 ) ) ( not ( = ?auto_370855 ?auto_370866 ) ) ( not ( = ?auto_370855 ?auto_370867 ) ) ( not ( = ?auto_370855 ?auto_370868 ) ) ( not ( = ?auto_370856 ?auto_370857 ) ) ( not ( = ?auto_370856 ?auto_370858 ) ) ( not ( = ?auto_370856 ?auto_370859 ) ) ( not ( = ?auto_370856 ?auto_370860 ) ) ( not ( = ?auto_370856 ?auto_370861 ) ) ( not ( = ?auto_370856 ?auto_370862 ) ) ( not ( = ?auto_370856 ?auto_370863 ) ) ( not ( = ?auto_370856 ?auto_370864 ) ) ( not ( = ?auto_370856 ?auto_370865 ) ) ( not ( = ?auto_370856 ?auto_370866 ) ) ( not ( = ?auto_370856 ?auto_370867 ) ) ( not ( = ?auto_370856 ?auto_370868 ) ) ( not ( = ?auto_370857 ?auto_370858 ) ) ( not ( = ?auto_370857 ?auto_370859 ) ) ( not ( = ?auto_370857 ?auto_370860 ) ) ( not ( = ?auto_370857 ?auto_370861 ) ) ( not ( = ?auto_370857 ?auto_370862 ) ) ( not ( = ?auto_370857 ?auto_370863 ) ) ( not ( = ?auto_370857 ?auto_370864 ) ) ( not ( = ?auto_370857 ?auto_370865 ) ) ( not ( = ?auto_370857 ?auto_370866 ) ) ( not ( = ?auto_370857 ?auto_370867 ) ) ( not ( = ?auto_370857 ?auto_370868 ) ) ( not ( = ?auto_370858 ?auto_370859 ) ) ( not ( = ?auto_370858 ?auto_370860 ) ) ( not ( = ?auto_370858 ?auto_370861 ) ) ( not ( = ?auto_370858 ?auto_370862 ) ) ( not ( = ?auto_370858 ?auto_370863 ) ) ( not ( = ?auto_370858 ?auto_370864 ) ) ( not ( = ?auto_370858 ?auto_370865 ) ) ( not ( = ?auto_370858 ?auto_370866 ) ) ( not ( = ?auto_370858 ?auto_370867 ) ) ( not ( = ?auto_370858 ?auto_370868 ) ) ( not ( = ?auto_370859 ?auto_370860 ) ) ( not ( = ?auto_370859 ?auto_370861 ) ) ( not ( = ?auto_370859 ?auto_370862 ) ) ( not ( = ?auto_370859 ?auto_370863 ) ) ( not ( = ?auto_370859 ?auto_370864 ) ) ( not ( = ?auto_370859 ?auto_370865 ) ) ( not ( = ?auto_370859 ?auto_370866 ) ) ( not ( = ?auto_370859 ?auto_370867 ) ) ( not ( = ?auto_370859 ?auto_370868 ) ) ( not ( = ?auto_370860 ?auto_370861 ) ) ( not ( = ?auto_370860 ?auto_370862 ) ) ( not ( = ?auto_370860 ?auto_370863 ) ) ( not ( = ?auto_370860 ?auto_370864 ) ) ( not ( = ?auto_370860 ?auto_370865 ) ) ( not ( = ?auto_370860 ?auto_370866 ) ) ( not ( = ?auto_370860 ?auto_370867 ) ) ( not ( = ?auto_370860 ?auto_370868 ) ) ( not ( = ?auto_370861 ?auto_370862 ) ) ( not ( = ?auto_370861 ?auto_370863 ) ) ( not ( = ?auto_370861 ?auto_370864 ) ) ( not ( = ?auto_370861 ?auto_370865 ) ) ( not ( = ?auto_370861 ?auto_370866 ) ) ( not ( = ?auto_370861 ?auto_370867 ) ) ( not ( = ?auto_370861 ?auto_370868 ) ) ( not ( = ?auto_370862 ?auto_370863 ) ) ( not ( = ?auto_370862 ?auto_370864 ) ) ( not ( = ?auto_370862 ?auto_370865 ) ) ( not ( = ?auto_370862 ?auto_370866 ) ) ( not ( = ?auto_370862 ?auto_370867 ) ) ( not ( = ?auto_370862 ?auto_370868 ) ) ( not ( = ?auto_370863 ?auto_370864 ) ) ( not ( = ?auto_370863 ?auto_370865 ) ) ( not ( = ?auto_370863 ?auto_370866 ) ) ( not ( = ?auto_370863 ?auto_370867 ) ) ( not ( = ?auto_370863 ?auto_370868 ) ) ( not ( = ?auto_370864 ?auto_370865 ) ) ( not ( = ?auto_370864 ?auto_370866 ) ) ( not ( = ?auto_370864 ?auto_370867 ) ) ( not ( = ?auto_370864 ?auto_370868 ) ) ( not ( = ?auto_370865 ?auto_370866 ) ) ( not ( = ?auto_370865 ?auto_370867 ) ) ( not ( = ?auto_370865 ?auto_370868 ) ) ( not ( = ?auto_370866 ?auto_370867 ) ) ( not ( = ?auto_370866 ?auto_370868 ) ) ( not ( = ?auto_370867 ?auto_370868 ) ) ( ON ?auto_370866 ?auto_370867 ) ( ON ?auto_370865 ?auto_370866 ) ( ON ?auto_370864 ?auto_370865 ) ( ON ?auto_370863 ?auto_370864 ) ( ON ?auto_370862 ?auto_370863 ) ( ON ?auto_370861 ?auto_370862 ) ( ON ?auto_370860 ?auto_370861 ) ( ON ?auto_370859 ?auto_370860 ) ( ON ?auto_370858 ?auto_370859 ) ( ON ?auto_370857 ?auto_370858 ) ( ON ?auto_370856 ?auto_370857 ) ( CLEAR ?auto_370854 ) ( ON ?auto_370855 ?auto_370856 ) ( CLEAR ?auto_370855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_370853 ?auto_370854 ?auto_370855 )
      ( MAKE-15PILE ?auto_370853 ?auto_370854 ?auto_370855 ?auto_370856 ?auto_370857 ?auto_370858 ?auto_370859 ?auto_370860 ?auto_370861 ?auto_370862 ?auto_370863 ?auto_370864 ?auto_370865 ?auto_370866 ?auto_370867 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370884 - BLOCK
      ?auto_370885 - BLOCK
      ?auto_370886 - BLOCK
      ?auto_370887 - BLOCK
      ?auto_370888 - BLOCK
      ?auto_370889 - BLOCK
      ?auto_370890 - BLOCK
      ?auto_370891 - BLOCK
      ?auto_370892 - BLOCK
      ?auto_370893 - BLOCK
      ?auto_370894 - BLOCK
      ?auto_370895 - BLOCK
      ?auto_370896 - BLOCK
      ?auto_370897 - BLOCK
      ?auto_370898 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_370898 ) ( ON-TABLE ?auto_370884 ) ( ON ?auto_370885 ?auto_370884 ) ( not ( = ?auto_370884 ?auto_370885 ) ) ( not ( = ?auto_370884 ?auto_370886 ) ) ( not ( = ?auto_370884 ?auto_370887 ) ) ( not ( = ?auto_370884 ?auto_370888 ) ) ( not ( = ?auto_370884 ?auto_370889 ) ) ( not ( = ?auto_370884 ?auto_370890 ) ) ( not ( = ?auto_370884 ?auto_370891 ) ) ( not ( = ?auto_370884 ?auto_370892 ) ) ( not ( = ?auto_370884 ?auto_370893 ) ) ( not ( = ?auto_370884 ?auto_370894 ) ) ( not ( = ?auto_370884 ?auto_370895 ) ) ( not ( = ?auto_370884 ?auto_370896 ) ) ( not ( = ?auto_370884 ?auto_370897 ) ) ( not ( = ?auto_370884 ?auto_370898 ) ) ( not ( = ?auto_370885 ?auto_370886 ) ) ( not ( = ?auto_370885 ?auto_370887 ) ) ( not ( = ?auto_370885 ?auto_370888 ) ) ( not ( = ?auto_370885 ?auto_370889 ) ) ( not ( = ?auto_370885 ?auto_370890 ) ) ( not ( = ?auto_370885 ?auto_370891 ) ) ( not ( = ?auto_370885 ?auto_370892 ) ) ( not ( = ?auto_370885 ?auto_370893 ) ) ( not ( = ?auto_370885 ?auto_370894 ) ) ( not ( = ?auto_370885 ?auto_370895 ) ) ( not ( = ?auto_370885 ?auto_370896 ) ) ( not ( = ?auto_370885 ?auto_370897 ) ) ( not ( = ?auto_370885 ?auto_370898 ) ) ( not ( = ?auto_370886 ?auto_370887 ) ) ( not ( = ?auto_370886 ?auto_370888 ) ) ( not ( = ?auto_370886 ?auto_370889 ) ) ( not ( = ?auto_370886 ?auto_370890 ) ) ( not ( = ?auto_370886 ?auto_370891 ) ) ( not ( = ?auto_370886 ?auto_370892 ) ) ( not ( = ?auto_370886 ?auto_370893 ) ) ( not ( = ?auto_370886 ?auto_370894 ) ) ( not ( = ?auto_370886 ?auto_370895 ) ) ( not ( = ?auto_370886 ?auto_370896 ) ) ( not ( = ?auto_370886 ?auto_370897 ) ) ( not ( = ?auto_370886 ?auto_370898 ) ) ( not ( = ?auto_370887 ?auto_370888 ) ) ( not ( = ?auto_370887 ?auto_370889 ) ) ( not ( = ?auto_370887 ?auto_370890 ) ) ( not ( = ?auto_370887 ?auto_370891 ) ) ( not ( = ?auto_370887 ?auto_370892 ) ) ( not ( = ?auto_370887 ?auto_370893 ) ) ( not ( = ?auto_370887 ?auto_370894 ) ) ( not ( = ?auto_370887 ?auto_370895 ) ) ( not ( = ?auto_370887 ?auto_370896 ) ) ( not ( = ?auto_370887 ?auto_370897 ) ) ( not ( = ?auto_370887 ?auto_370898 ) ) ( not ( = ?auto_370888 ?auto_370889 ) ) ( not ( = ?auto_370888 ?auto_370890 ) ) ( not ( = ?auto_370888 ?auto_370891 ) ) ( not ( = ?auto_370888 ?auto_370892 ) ) ( not ( = ?auto_370888 ?auto_370893 ) ) ( not ( = ?auto_370888 ?auto_370894 ) ) ( not ( = ?auto_370888 ?auto_370895 ) ) ( not ( = ?auto_370888 ?auto_370896 ) ) ( not ( = ?auto_370888 ?auto_370897 ) ) ( not ( = ?auto_370888 ?auto_370898 ) ) ( not ( = ?auto_370889 ?auto_370890 ) ) ( not ( = ?auto_370889 ?auto_370891 ) ) ( not ( = ?auto_370889 ?auto_370892 ) ) ( not ( = ?auto_370889 ?auto_370893 ) ) ( not ( = ?auto_370889 ?auto_370894 ) ) ( not ( = ?auto_370889 ?auto_370895 ) ) ( not ( = ?auto_370889 ?auto_370896 ) ) ( not ( = ?auto_370889 ?auto_370897 ) ) ( not ( = ?auto_370889 ?auto_370898 ) ) ( not ( = ?auto_370890 ?auto_370891 ) ) ( not ( = ?auto_370890 ?auto_370892 ) ) ( not ( = ?auto_370890 ?auto_370893 ) ) ( not ( = ?auto_370890 ?auto_370894 ) ) ( not ( = ?auto_370890 ?auto_370895 ) ) ( not ( = ?auto_370890 ?auto_370896 ) ) ( not ( = ?auto_370890 ?auto_370897 ) ) ( not ( = ?auto_370890 ?auto_370898 ) ) ( not ( = ?auto_370891 ?auto_370892 ) ) ( not ( = ?auto_370891 ?auto_370893 ) ) ( not ( = ?auto_370891 ?auto_370894 ) ) ( not ( = ?auto_370891 ?auto_370895 ) ) ( not ( = ?auto_370891 ?auto_370896 ) ) ( not ( = ?auto_370891 ?auto_370897 ) ) ( not ( = ?auto_370891 ?auto_370898 ) ) ( not ( = ?auto_370892 ?auto_370893 ) ) ( not ( = ?auto_370892 ?auto_370894 ) ) ( not ( = ?auto_370892 ?auto_370895 ) ) ( not ( = ?auto_370892 ?auto_370896 ) ) ( not ( = ?auto_370892 ?auto_370897 ) ) ( not ( = ?auto_370892 ?auto_370898 ) ) ( not ( = ?auto_370893 ?auto_370894 ) ) ( not ( = ?auto_370893 ?auto_370895 ) ) ( not ( = ?auto_370893 ?auto_370896 ) ) ( not ( = ?auto_370893 ?auto_370897 ) ) ( not ( = ?auto_370893 ?auto_370898 ) ) ( not ( = ?auto_370894 ?auto_370895 ) ) ( not ( = ?auto_370894 ?auto_370896 ) ) ( not ( = ?auto_370894 ?auto_370897 ) ) ( not ( = ?auto_370894 ?auto_370898 ) ) ( not ( = ?auto_370895 ?auto_370896 ) ) ( not ( = ?auto_370895 ?auto_370897 ) ) ( not ( = ?auto_370895 ?auto_370898 ) ) ( not ( = ?auto_370896 ?auto_370897 ) ) ( not ( = ?auto_370896 ?auto_370898 ) ) ( not ( = ?auto_370897 ?auto_370898 ) ) ( ON ?auto_370897 ?auto_370898 ) ( ON ?auto_370896 ?auto_370897 ) ( ON ?auto_370895 ?auto_370896 ) ( ON ?auto_370894 ?auto_370895 ) ( ON ?auto_370893 ?auto_370894 ) ( ON ?auto_370892 ?auto_370893 ) ( ON ?auto_370891 ?auto_370892 ) ( ON ?auto_370890 ?auto_370891 ) ( ON ?auto_370889 ?auto_370890 ) ( ON ?auto_370888 ?auto_370889 ) ( ON ?auto_370887 ?auto_370888 ) ( CLEAR ?auto_370885 ) ( ON ?auto_370886 ?auto_370887 ) ( CLEAR ?auto_370886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_370884 ?auto_370885 ?auto_370886 )
      ( MAKE-15PILE ?auto_370884 ?auto_370885 ?auto_370886 ?auto_370887 ?auto_370888 ?auto_370889 ?auto_370890 ?auto_370891 ?auto_370892 ?auto_370893 ?auto_370894 ?auto_370895 ?auto_370896 ?auto_370897 ?auto_370898 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370914 - BLOCK
      ?auto_370915 - BLOCK
      ?auto_370916 - BLOCK
      ?auto_370917 - BLOCK
      ?auto_370918 - BLOCK
      ?auto_370919 - BLOCK
      ?auto_370920 - BLOCK
      ?auto_370921 - BLOCK
      ?auto_370922 - BLOCK
      ?auto_370923 - BLOCK
      ?auto_370924 - BLOCK
      ?auto_370925 - BLOCK
      ?auto_370926 - BLOCK
      ?auto_370927 - BLOCK
      ?auto_370928 - BLOCK
    )
    :vars
    (
      ?auto_370929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_370928 ?auto_370929 ) ( ON-TABLE ?auto_370914 ) ( not ( = ?auto_370914 ?auto_370915 ) ) ( not ( = ?auto_370914 ?auto_370916 ) ) ( not ( = ?auto_370914 ?auto_370917 ) ) ( not ( = ?auto_370914 ?auto_370918 ) ) ( not ( = ?auto_370914 ?auto_370919 ) ) ( not ( = ?auto_370914 ?auto_370920 ) ) ( not ( = ?auto_370914 ?auto_370921 ) ) ( not ( = ?auto_370914 ?auto_370922 ) ) ( not ( = ?auto_370914 ?auto_370923 ) ) ( not ( = ?auto_370914 ?auto_370924 ) ) ( not ( = ?auto_370914 ?auto_370925 ) ) ( not ( = ?auto_370914 ?auto_370926 ) ) ( not ( = ?auto_370914 ?auto_370927 ) ) ( not ( = ?auto_370914 ?auto_370928 ) ) ( not ( = ?auto_370914 ?auto_370929 ) ) ( not ( = ?auto_370915 ?auto_370916 ) ) ( not ( = ?auto_370915 ?auto_370917 ) ) ( not ( = ?auto_370915 ?auto_370918 ) ) ( not ( = ?auto_370915 ?auto_370919 ) ) ( not ( = ?auto_370915 ?auto_370920 ) ) ( not ( = ?auto_370915 ?auto_370921 ) ) ( not ( = ?auto_370915 ?auto_370922 ) ) ( not ( = ?auto_370915 ?auto_370923 ) ) ( not ( = ?auto_370915 ?auto_370924 ) ) ( not ( = ?auto_370915 ?auto_370925 ) ) ( not ( = ?auto_370915 ?auto_370926 ) ) ( not ( = ?auto_370915 ?auto_370927 ) ) ( not ( = ?auto_370915 ?auto_370928 ) ) ( not ( = ?auto_370915 ?auto_370929 ) ) ( not ( = ?auto_370916 ?auto_370917 ) ) ( not ( = ?auto_370916 ?auto_370918 ) ) ( not ( = ?auto_370916 ?auto_370919 ) ) ( not ( = ?auto_370916 ?auto_370920 ) ) ( not ( = ?auto_370916 ?auto_370921 ) ) ( not ( = ?auto_370916 ?auto_370922 ) ) ( not ( = ?auto_370916 ?auto_370923 ) ) ( not ( = ?auto_370916 ?auto_370924 ) ) ( not ( = ?auto_370916 ?auto_370925 ) ) ( not ( = ?auto_370916 ?auto_370926 ) ) ( not ( = ?auto_370916 ?auto_370927 ) ) ( not ( = ?auto_370916 ?auto_370928 ) ) ( not ( = ?auto_370916 ?auto_370929 ) ) ( not ( = ?auto_370917 ?auto_370918 ) ) ( not ( = ?auto_370917 ?auto_370919 ) ) ( not ( = ?auto_370917 ?auto_370920 ) ) ( not ( = ?auto_370917 ?auto_370921 ) ) ( not ( = ?auto_370917 ?auto_370922 ) ) ( not ( = ?auto_370917 ?auto_370923 ) ) ( not ( = ?auto_370917 ?auto_370924 ) ) ( not ( = ?auto_370917 ?auto_370925 ) ) ( not ( = ?auto_370917 ?auto_370926 ) ) ( not ( = ?auto_370917 ?auto_370927 ) ) ( not ( = ?auto_370917 ?auto_370928 ) ) ( not ( = ?auto_370917 ?auto_370929 ) ) ( not ( = ?auto_370918 ?auto_370919 ) ) ( not ( = ?auto_370918 ?auto_370920 ) ) ( not ( = ?auto_370918 ?auto_370921 ) ) ( not ( = ?auto_370918 ?auto_370922 ) ) ( not ( = ?auto_370918 ?auto_370923 ) ) ( not ( = ?auto_370918 ?auto_370924 ) ) ( not ( = ?auto_370918 ?auto_370925 ) ) ( not ( = ?auto_370918 ?auto_370926 ) ) ( not ( = ?auto_370918 ?auto_370927 ) ) ( not ( = ?auto_370918 ?auto_370928 ) ) ( not ( = ?auto_370918 ?auto_370929 ) ) ( not ( = ?auto_370919 ?auto_370920 ) ) ( not ( = ?auto_370919 ?auto_370921 ) ) ( not ( = ?auto_370919 ?auto_370922 ) ) ( not ( = ?auto_370919 ?auto_370923 ) ) ( not ( = ?auto_370919 ?auto_370924 ) ) ( not ( = ?auto_370919 ?auto_370925 ) ) ( not ( = ?auto_370919 ?auto_370926 ) ) ( not ( = ?auto_370919 ?auto_370927 ) ) ( not ( = ?auto_370919 ?auto_370928 ) ) ( not ( = ?auto_370919 ?auto_370929 ) ) ( not ( = ?auto_370920 ?auto_370921 ) ) ( not ( = ?auto_370920 ?auto_370922 ) ) ( not ( = ?auto_370920 ?auto_370923 ) ) ( not ( = ?auto_370920 ?auto_370924 ) ) ( not ( = ?auto_370920 ?auto_370925 ) ) ( not ( = ?auto_370920 ?auto_370926 ) ) ( not ( = ?auto_370920 ?auto_370927 ) ) ( not ( = ?auto_370920 ?auto_370928 ) ) ( not ( = ?auto_370920 ?auto_370929 ) ) ( not ( = ?auto_370921 ?auto_370922 ) ) ( not ( = ?auto_370921 ?auto_370923 ) ) ( not ( = ?auto_370921 ?auto_370924 ) ) ( not ( = ?auto_370921 ?auto_370925 ) ) ( not ( = ?auto_370921 ?auto_370926 ) ) ( not ( = ?auto_370921 ?auto_370927 ) ) ( not ( = ?auto_370921 ?auto_370928 ) ) ( not ( = ?auto_370921 ?auto_370929 ) ) ( not ( = ?auto_370922 ?auto_370923 ) ) ( not ( = ?auto_370922 ?auto_370924 ) ) ( not ( = ?auto_370922 ?auto_370925 ) ) ( not ( = ?auto_370922 ?auto_370926 ) ) ( not ( = ?auto_370922 ?auto_370927 ) ) ( not ( = ?auto_370922 ?auto_370928 ) ) ( not ( = ?auto_370922 ?auto_370929 ) ) ( not ( = ?auto_370923 ?auto_370924 ) ) ( not ( = ?auto_370923 ?auto_370925 ) ) ( not ( = ?auto_370923 ?auto_370926 ) ) ( not ( = ?auto_370923 ?auto_370927 ) ) ( not ( = ?auto_370923 ?auto_370928 ) ) ( not ( = ?auto_370923 ?auto_370929 ) ) ( not ( = ?auto_370924 ?auto_370925 ) ) ( not ( = ?auto_370924 ?auto_370926 ) ) ( not ( = ?auto_370924 ?auto_370927 ) ) ( not ( = ?auto_370924 ?auto_370928 ) ) ( not ( = ?auto_370924 ?auto_370929 ) ) ( not ( = ?auto_370925 ?auto_370926 ) ) ( not ( = ?auto_370925 ?auto_370927 ) ) ( not ( = ?auto_370925 ?auto_370928 ) ) ( not ( = ?auto_370925 ?auto_370929 ) ) ( not ( = ?auto_370926 ?auto_370927 ) ) ( not ( = ?auto_370926 ?auto_370928 ) ) ( not ( = ?auto_370926 ?auto_370929 ) ) ( not ( = ?auto_370927 ?auto_370928 ) ) ( not ( = ?auto_370927 ?auto_370929 ) ) ( not ( = ?auto_370928 ?auto_370929 ) ) ( ON ?auto_370927 ?auto_370928 ) ( ON ?auto_370926 ?auto_370927 ) ( ON ?auto_370925 ?auto_370926 ) ( ON ?auto_370924 ?auto_370925 ) ( ON ?auto_370923 ?auto_370924 ) ( ON ?auto_370922 ?auto_370923 ) ( ON ?auto_370921 ?auto_370922 ) ( ON ?auto_370920 ?auto_370921 ) ( ON ?auto_370919 ?auto_370920 ) ( ON ?auto_370918 ?auto_370919 ) ( ON ?auto_370917 ?auto_370918 ) ( ON ?auto_370916 ?auto_370917 ) ( CLEAR ?auto_370914 ) ( ON ?auto_370915 ?auto_370916 ) ( CLEAR ?auto_370915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_370914 ?auto_370915 )
      ( MAKE-15PILE ?auto_370914 ?auto_370915 ?auto_370916 ?auto_370917 ?auto_370918 ?auto_370919 ?auto_370920 ?auto_370921 ?auto_370922 ?auto_370923 ?auto_370924 ?auto_370925 ?auto_370926 ?auto_370927 ?auto_370928 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370945 - BLOCK
      ?auto_370946 - BLOCK
      ?auto_370947 - BLOCK
      ?auto_370948 - BLOCK
      ?auto_370949 - BLOCK
      ?auto_370950 - BLOCK
      ?auto_370951 - BLOCK
      ?auto_370952 - BLOCK
      ?auto_370953 - BLOCK
      ?auto_370954 - BLOCK
      ?auto_370955 - BLOCK
      ?auto_370956 - BLOCK
      ?auto_370957 - BLOCK
      ?auto_370958 - BLOCK
      ?auto_370959 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_370959 ) ( ON-TABLE ?auto_370945 ) ( not ( = ?auto_370945 ?auto_370946 ) ) ( not ( = ?auto_370945 ?auto_370947 ) ) ( not ( = ?auto_370945 ?auto_370948 ) ) ( not ( = ?auto_370945 ?auto_370949 ) ) ( not ( = ?auto_370945 ?auto_370950 ) ) ( not ( = ?auto_370945 ?auto_370951 ) ) ( not ( = ?auto_370945 ?auto_370952 ) ) ( not ( = ?auto_370945 ?auto_370953 ) ) ( not ( = ?auto_370945 ?auto_370954 ) ) ( not ( = ?auto_370945 ?auto_370955 ) ) ( not ( = ?auto_370945 ?auto_370956 ) ) ( not ( = ?auto_370945 ?auto_370957 ) ) ( not ( = ?auto_370945 ?auto_370958 ) ) ( not ( = ?auto_370945 ?auto_370959 ) ) ( not ( = ?auto_370946 ?auto_370947 ) ) ( not ( = ?auto_370946 ?auto_370948 ) ) ( not ( = ?auto_370946 ?auto_370949 ) ) ( not ( = ?auto_370946 ?auto_370950 ) ) ( not ( = ?auto_370946 ?auto_370951 ) ) ( not ( = ?auto_370946 ?auto_370952 ) ) ( not ( = ?auto_370946 ?auto_370953 ) ) ( not ( = ?auto_370946 ?auto_370954 ) ) ( not ( = ?auto_370946 ?auto_370955 ) ) ( not ( = ?auto_370946 ?auto_370956 ) ) ( not ( = ?auto_370946 ?auto_370957 ) ) ( not ( = ?auto_370946 ?auto_370958 ) ) ( not ( = ?auto_370946 ?auto_370959 ) ) ( not ( = ?auto_370947 ?auto_370948 ) ) ( not ( = ?auto_370947 ?auto_370949 ) ) ( not ( = ?auto_370947 ?auto_370950 ) ) ( not ( = ?auto_370947 ?auto_370951 ) ) ( not ( = ?auto_370947 ?auto_370952 ) ) ( not ( = ?auto_370947 ?auto_370953 ) ) ( not ( = ?auto_370947 ?auto_370954 ) ) ( not ( = ?auto_370947 ?auto_370955 ) ) ( not ( = ?auto_370947 ?auto_370956 ) ) ( not ( = ?auto_370947 ?auto_370957 ) ) ( not ( = ?auto_370947 ?auto_370958 ) ) ( not ( = ?auto_370947 ?auto_370959 ) ) ( not ( = ?auto_370948 ?auto_370949 ) ) ( not ( = ?auto_370948 ?auto_370950 ) ) ( not ( = ?auto_370948 ?auto_370951 ) ) ( not ( = ?auto_370948 ?auto_370952 ) ) ( not ( = ?auto_370948 ?auto_370953 ) ) ( not ( = ?auto_370948 ?auto_370954 ) ) ( not ( = ?auto_370948 ?auto_370955 ) ) ( not ( = ?auto_370948 ?auto_370956 ) ) ( not ( = ?auto_370948 ?auto_370957 ) ) ( not ( = ?auto_370948 ?auto_370958 ) ) ( not ( = ?auto_370948 ?auto_370959 ) ) ( not ( = ?auto_370949 ?auto_370950 ) ) ( not ( = ?auto_370949 ?auto_370951 ) ) ( not ( = ?auto_370949 ?auto_370952 ) ) ( not ( = ?auto_370949 ?auto_370953 ) ) ( not ( = ?auto_370949 ?auto_370954 ) ) ( not ( = ?auto_370949 ?auto_370955 ) ) ( not ( = ?auto_370949 ?auto_370956 ) ) ( not ( = ?auto_370949 ?auto_370957 ) ) ( not ( = ?auto_370949 ?auto_370958 ) ) ( not ( = ?auto_370949 ?auto_370959 ) ) ( not ( = ?auto_370950 ?auto_370951 ) ) ( not ( = ?auto_370950 ?auto_370952 ) ) ( not ( = ?auto_370950 ?auto_370953 ) ) ( not ( = ?auto_370950 ?auto_370954 ) ) ( not ( = ?auto_370950 ?auto_370955 ) ) ( not ( = ?auto_370950 ?auto_370956 ) ) ( not ( = ?auto_370950 ?auto_370957 ) ) ( not ( = ?auto_370950 ?auto_370958 ) ) ( not ( = ?auto_370950 ?auto_370959 ) ) ( not ( = ?auto_370951 ?auto_370952 ) ) ( not ( = ?auto_370951 ?auto_370953 ) ) ( not ( = ?auto_370951 ?auto_370954 ) ) ( not ( = ?auto_370951 ?auto_370955 ) ) ( not ( = ?auto_370951 ?auto_370956 ) ) ( not ( = ?auto_370951 ?auto_370957 ) ) ( not ( = ?auto_370951 ?auto_370958 ) ) ( not ( = ?auto_370951 ?auto_370959 ) ) ( not ( = ?auto_370952 ?auto_370953 ) ) ( not ( = ?auto_370952 ?auto_370954 ) ) ( not ( = ?auto_370952 ?auto_370955 ) ) ( not ( = ?auto_370952 ?auto_370956 ) ) ( not ( = ?auto_370952 ?auto_370957 ) ) ( not ( = ?auto_370952 ?auto_370958 ) ) ( not ( = ?auto_370952 ?auto_370959 ) ) ( not ( = ?auto_370953 ?auto_370954 ) ) ( not ( = ?auto_370953 ?auto_370955 ) ) ( not ( = ?auto_370953 ?auto_370956 ) ) ( not ( = ?auto_370953 ?auto_370957 ) ) ( not ( = ?auto_370953 ?auto_370958 ) ) ( not ( = ?auto_370953 ?auto_370959 ) ) ( not ( = ?auto_370954 ?auto_370955 ) ) ( not ( = ?auto_370954 ?auto_370956 ) ) ( not ( = ?auto_370954 ?auto_370957 ) ) ( not ( = ?auto_370954 ?auto_370958 ) ) ( not ( = ?auto_370954 ?auto_370959 ) ) ( not ( = ?auto_370955 ?auto_370956 ) ) ( not ( = ?auto_370955 ?auto_370957 ) ) ( not ( = ?auto_370955 ?auto_370958 ) ) ( not ( = ?auto_370955 ?auto_370959 ) ) ( not ( = ?auto_370956 ?auto_370957 ) ) ( not ( = ?auto_370956 ?auto_370958 ) ) ( not ( = ?auto_370956 ?auto_370959 ) ) ( not ( = ?auto_370957 ?auto_370958 ) ) ( not ( = ?auto_370957 ?auto_370959 ) ) ( not ( = ?auto_370958 ?auto_370959 ) ) ( ON ?auto_370958 ?auto_370959 ) ( ON ?auto_370957 ?auto_370958 ) ( ON ?auto_370956 ?auto_370957 ) ( ON ?auto_370955 ?auto_370956 ) ( ON ?auto_370954 ?auto_370955 ) ( ON ?auto_370953 ?auto_370954 ) ( ON ?auto_370952 ?auto_370953 ) ( ON ?auto_370951 ?auto_370952 ) ( ON ?auto_370950 ?auto_370951 ) ( ON ?auto_370949 ?auto_370950 ) ( ON ?auto_370948 ?auto_370949 ) ( ON ?auto_370947 ?auto_370948 ) ( CLEAR ?auto_370945 ) ( ON ?auto_370946 ?auto_370947 ) ( CLEAR ?auto_370946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_370945 ?auto_370946 )
      ( MAKE-15PILE ?auto_370945 ?auto_370946 ?auto_370947 ?auto_370948 ?auto_370949 ?auto_370950 ?auto_370951 ?auto_370952 ?auto_370953 ?auto_370954 ?auto_370955 ?auto_370956 ?auto_370957 ?auto_370958 ?auto_370959 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_370975 - BLOCK
      ?auto_370976 - BLOCK
      ?auto_370977 - BLOCK
      ?auto_370978 - BLOCK
      ?auto_370979 - BLOCK
      ?auto_370980 - BLOCK
      ?auto_370981 - BLOCK
      ?auto_370982 - BLOCK
      ?auto_370983 - BLOCK
      ?auto_370984 - BLOCK
      ?auto_370985 - BLOCK
      ?auto_370986 - BLOCK
      ?auto_370987 - BLOCK
      ?auto_370988 - BLOCK
      ?auto_370989 - BLOCK
    )
    :vars
    (
      ?auto_370990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_370989 ?auto_370990 ) ( not ( = ?auto_370975 ?auto_370976 ) ) ( not ( = ?auto_370975 ?auto_370977 ) ) ( not ( = ?auto_370975 ?auto_370978 ) ) ( not ( = ?auto_370975 ?auto_370979 ) ) ( not ( = ?auto_370975 ?auto_370980 ) ) ( not ( = ?auto_370975 ?auto_370981 ) ) ( not ( = ?auto_370975 ?auto_370982 ) ) ( not ( = ?auto_370975 ?auto_370983 ) ) ( not ( = ?auto_370975 ?auto_370984 ) ) ( not ( = ?auto_370975 ?auto_370985 ) ) ( not ( = ?auto_370975 ?auto_370986 ) ) ( not ( = ?auto_370975 ?auto_370987 ) ) ( not ( = ?auto_370975 ?auto_370988 ) ) ( not ( = ?auto_370975 ?auto_370989 ) ) ( not ( = ?auto_370975 ?auto_370990 ) ) ( not ( = ?auto_370976 ?auto_370977 ) ) ( not ( = ?auto_370976 ?auto_370978 ) ) ( not ( = ?auto_370976 ?auto_370979 ) ) ( not ( = ?auto_370976 ?auto_370980 ) ) ( not ( = ?auto_370976 ?auto_370981 ) ) ( not ( = ?auto_370976 ?auto_370982 ) ) ( not ( = ?auto_370976 ?auto_370983 ) ) ( not ( = ?auto_370976 ?auto_370984 ) ) ( not ( = ?auto_370976 ?auto_370985 ) ) ( not ( = ?auto_370976 ?auto_370986 ) ) ( not ( = ?auto_370976 ?auto_370987 ) ) ( not ( = ?auto_370976 ?auto_370988 ) ) ( not ( = ?auto_370976 ?auto_370989 ) ) ( not ( = ?auto_370976 ?auto_370990 ) ) ( not ( = ?auto_370977 ?auto_370978 ) ) ( not ( = ?auto_370977 ?auto_370979 ) ) ( not ( = ?auto_370977 ?auto_370980 ) ) ( not ( = ?auto_370977 ?auto_370981 ) ) ( not ( = ?auto_370977 ?auto_370982 ) ) ( not ( = ?auto_370977 ?auto_370983 ) ) ( not ( = ?auto_370977 ?auto_370984 ) ) ( not ( = ?auto_370977 ?auto_370985 ) ) ( not ( = ?auto_370977 ?auto_370986 ) ) ( not ( = ?auto_370977 ?auto_370987 ) ) ( not ( = ?auto_370977 ?auto_370988 ) ) ( not ( = ?auto_370977 ?auto_370989 ) ) ( not ( = ?auto_370977 ?auto_370990 ) ) ( not ( = ?auto_370978 ?auto_370979 ) ) ( not ( = ?auto_370978 ?auto_370980 ) ) ( not ( = ?auto_370978 ?auto_370981 ) ) ( not ( = ?auto_370978 ?auto_370982 ) ) ( not ( = ?auto_370978 ?auto_370983 ) ) ( not ( = ?auto_370978 ?auto_370984 ) ) ( not ( = ?auto_370978 ?auto_370985 ) ) ( not ( = ?auto_370978 ?auto_370986 ) ) ( not ( = ?auto_370978 ?auto_370987 ) ) ( not ( = ?auto_370978 ?auto_370988 ) ) ( not ( = ?auto_370978 ?auto_370989 ) ) ( not ( = ?auto_370978 ?auto_370990 ) ) ( not ( = ?auto_370979 ?auto_370980 ) ) ( not ( = ?auto_370979 ?auto_370981 ) ) ( not ( = ?auto_370979 ?auto_370982 ) ) ( not ( = ?auto_370979 ?auto_370983 ) ) ( not ( = ?auto_370979 ?auto_370984 ) ) ( not ( = ?auto_370979 ?auto_370985 ) ) ( not ( = ?auto_370979 ?auto_370986 ) ) ( not ( = ?auto_370979 ?auto_370987 ) ) ( not ( = ?auto_370979 ?auto_370988 ) ) ( not ( = ?auto_370979 ?auto_370989 ) ) ( not ( = ?auto_370979 ?auto_370990 ) ) ( not ( = ?auto_370980 ?auto_370981 ) ) ( not ( = ?auto_370980 ?auto_370982 ) ) ( not ( = ?auto_370980 ?auto_370983 ) ) ( not ( = ?auto_370980 ?auto_370984 ) ) ( not ( = ?auto_370980 ?auto_370985 ) ) ( not ( = ?auto_370980 ?auto_370986 ) ) ( not ( = ?auto_370980 ?auto_370987 ) ) ( not ( = ?auto_370980 ?auto_370988 ) ) ( not ( = ?auto_370980 ?auto_370989 ) ) ( not ( = ?auto_370980 ?auto_370990 ) ) ( not ( = ?auto_370981 ?auto_370982 ) ) ( not ( = ?auto_370981 ?auto_370983 ) ) ( not ( = ?auto_370981 ?auto_370984 ) ) ( not ( = ?auto_370981 ?auto_370985 ) ) ( not ( = ?auto_370981 ?auto_370986 ) ) ( not ( = ?auto_370981 ?auto_370987 ) ) ( not ( = ?auto_370981 ?auto_370988 ) ) ( not ( = ?auto_370981 ?auto_370989 ) ) ( not ( = ?auto_370981 ?auto_370990 ) ) ( not ( = ?auto_370982 ?auto_370983 ) ) ( not ( = ?auto_370982 ?auto_370984 ) ) ( not ( = ?auto_370982 ?auto_370985 ) ) ( not ( = ?auto_370982 ?auto_370986 ) ) ( not ( = ?auto_370982 ?auto_370987 ) ) ( not ( = ?auto_370982 ?auto_370988 ) ) ( not ( = ?auto_370982 ?auto_370989 ) ) ( not ( = ?auto_370982 ?auto_370990 ) ) ( not ( = ?auto_370983 ?auto_370984 ) ) ( not ( = ?auto_370983 ?auto_370985 ) ) ( not ( = ?auto_370983 ?auto_370986 ) ) ( not ( = ?auto_370983 ?auto_370987 ) ) ( not ( = ?auto_370983 ?auto_370988 ) ) ( not ( = ?auto_370983 ?auto_370989 ) ) ( not ( = ?auto_370983 ?auto_370990 ) ) ( not ( = ?auto_370984 ?auto_370985 ) ) ( not ( = ?auto_370984 ?auto_370986 ) ) ( not ( = ?auto_370984 ?auto_370987 ) ) ( not ( = ?auto_370984 ?auto_370988 ) ) ( not ( = ?auto_370984 ?auto_370989 ) ) ( not ( = ?auto_370984 ?auto_370990 ) ) ( not ( = ?auto_370985 ?auto_370986 ) ) ( not ( = ?auto_370985 ?auto_370987 ) ) ( not ( = ?auto_370985 ?auto_370988 ) ) ( not ( = ?auto_370985 ?auto_370989 ) ) ( not ( = ?auto_370985 ?auto_370990 ) ) ( not ( = ?auto_370986 ?auto_370987 ) ) ( not ( = ?auto_370986 ?auto_370988 ) ) ( not ( = ?auto_370986 ?auto_370989 ) ) ( not ( = ?auto_370986 ?auto_370990 ) ) ( not ( = ?auto_370987 ?auto_370988 ) ) ( not ( = ?auto_370987 ?auto_370989 ) ) ( not ( = ?auto_370987 ?auto_370990 ) ) ( not ( = ?auto_370988 ?auto_370989 ) ) ( not ( = ?auto_370988 ?auto_370990 ) ) ( not ( = ?auto_370989 ?auto_370990 ) ) ( ON ?auto_370988 ?auto_370989 ) ( ON ?auto_370987 ?auto_370988 ) ( ON ?auto_370986 ?auto_370987 ) ( ON ?auto_370985 ?auto_370986 ) ( ON ?auto_370984 ?auto_370985 ) ( ON ?auto_370983 ?auto_370984 ) ( ON ?auto_370982 ?auto_370983 ) ( ON ?auto_370981 ?auto_370982 ) ( ON ?auto_370980 ?auto_370981 ) ( ON ?auto_370979 ?auto_370980 ) ( ON ?auto_370978 ?auto_370979 ) ( ON ?auto_370977 ?auto_370978 ) ( ON ?auto_370976 ?auto_370977 ) ( ON ?auto_370975 ?auto_370976 ) ( CLEAR ?auto_370975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_370975 )
      ( MAKE-15PILE ?auto_370975 ?auto_370976 ?auto_370977 ?auto_370978 ?auto_370979 ?auto_370980 ?auto_370981 ?auto_370982 ?auto_370983 ?auto_370984 ?auto_370985 ?auto_370986 ?auto_370987 ?auto_370988 ?auto_370989 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_371006 - BLOCK
      ?auto_371007 - BLOCK
      ?auto_371008 - BLOCK
      ?auto_371009 - BLOCK
      ?auto_371010 - BLOCK
      ?auto_371011 - BLOCK
      ?auto_371012 - BLOCK
      ?auto_371013 - BLOCK
      ?auto_371014 - BLOCK
      ?auto_371015 - BLOCK
      ?auto_371016 - BLOCK
      ?auto_371017 - BLOCK
      ?auto_371018 - BLOCK
      ?auto_371019 - BLOCK
      ?auto_371020 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_371020 ) ( not ( = ?auto_371006 ?auto_371007 ) ) ( not ( = ?auto_371006 ?auto_371008 ) ) ( not ( = ?auto_371006 ?auto_371009 ) ) ( not ( = ?auto_371006 ?auto_371010 ) ) ( not ( = ?auto_371006 ?auto_371011 ) ) ( not ( = ?auto_371006 ?auto_371012 ) ) ( not ( = ?auto_371006 ?auto_371013 ) ) ( not ( = ?auto_371006 ?auto_371014 ) ) ( not ( = ?auto_371006 ?auto_371015 ) ) ( not ( = ?auto_371006 ?auto_371016 ) ) ( not ( = ?auto_371006 ?auto_371017 ) ) ( not ( = ?auto_371006 ?auto_371018 ) ) ( not ( = ?auto_371006 ?auto_371019 ) ) ( not ( = ?auto_371006 ?auto_371020 ) ) ( not ( = ?auto_371007 ?auto_371008 ) ) ( not ( = ?auto_371007 ?auto_371009 ) ) ( not ( = ?auto_371007 ?auto_371010 ) ) ( not ( = ?auto_371007 ?auto_371011 ) ) ( not ( = ?auto_371007 ?auto_371012 ) ) ( not ( = ?auto_371007 ?auto_371013 ) ) ( not ( = ?auto_371007 ?auto_371014 ) ) ( not ( = ?auto_371007 ?auto_371015 ) ) ( not ( = ?auto_371007 ?auto_371016 ) ) ( not ( = ?auto_371007 ?auto_371017 ) ) ( not ( = ?auto_371007 ?auto_371018 ) ) ( not ( = ?auto_371007 ?auto_371019 ) ) ( not ( = ?auto_371007 ?auto_371020 ) ) ( not ( = ?auto_371008 ?auto_371009 ) ) ( not ( = ?auto_371008 ?auto_371010 ) ) ( not ( = ?auto_371008 ?auto_371011 ) ) ( not ( = ?auto_371008 ?auto_371012 ) ) ( not ( = ?auto_371008 ?auto_371013 ) ) ( not ( = ?auto_371008 ?auto_371014 ) ) ( not ( = ?auto_371008 ?auto_371015 ) ) ( not ( = ?auto_371008 ?auto_371016 ) ) ( not ( = ?auto_371008 ?auto_371017 ) ) ( not ( = ?auto_371008 ?auto_371018 ) ) ( not ( = ?auto_371008 ?auto_371019 ) ) ( not ( = ?auto_371008 ?auto_371020 ) ) ( not ( = ?auto_371009 ?auto_371010 ) ) ( not ( = ?auto_371009 ?auto_371011 ) ) ( not ( = ?auto_371009 ?auto_371012 ) ) ( not ( = ?auto_371009 ?auto_371013 ) ) ( not ( = ?auto_371009 ?auto_371014 ) ) ( not ( = ?auto_371009 ?auto_371015 ) ) ( not ( = ?auto_371009 ?auto_371016 ) ) ( not ( = ?auto_371009 ?auto_371017 ) ) ( not ( = ?auto_371009 ?auto_371018 ) ) ( not ( = ?auto_371009 ?auto_371019 ) ) ( not ( = ?auto_371009 ?auto_371020 ) ) ( not ( = ?auto_371010 ?auto_371011 ) ) ( not ( = ?auto_371010 ?auto_371012 ) ) ( not ( = ?auto_371010 ?auto_371013 ) ) ( not ( = ?auto_371010 ?auto_371014 ) ) ( not ( = ?auto_371010 ?auto_371015 ) ) ( not ( = ?auto_371010 ?auto_371016 ) ) ( not ( = ?auto_371010 ?auto_371017 ) ) ( not ( = ?auto_371010 ?auto_371018 ) ) ( not ( = ?auto_371010 ?auto_371019 ) ) ( not ( = ?auto_371010 ?auto_371020 ) ) ( not ( = ?auto_371011 ?auto_371012 ) ) ( not ( = ?auto_371011 ?auto_371013 ) ) ( not ( = ?auto_371011 ?auto_371014 ) ) ( not ( = ?auto_371011 ?auto_371015 ) ) ( not ( = ?auto_371011 ?auto_371016 ) ) ( not ( = ?auto_371011 ?auto_371017 ) ) ( not ( = ?auto_371011 ?auto_371018 ) ) ( not ( = ?auto_371011 ?auto_371019 ) ) ( not ( = ?auto_371011 ?auto_371020 ) ) ( not ( = ?auto_371012 ?auto_371013 ) ) ( not ( = ?auto_371012 ?auto_371014 ) ) ( not ( = ?auto_371012 ?auto_371015 ) ) ( not ( = ?auto_371012 ?auto_371016 ) ) ( not ( = ?auto_371012 ?auto_371017 ) ) ( not ( = ?auto_371012 ?auto_371018 ) ) ( not ( = ?auto_371012 ?auto_371019 ) ) ( not ( = ?auto_371012 ?auto_371020 ) ) ( not ( = ?auto_371013 ?auto_371014 ) ) ( not ( = ?auto_371013 ?auto_371015 ) ) ( not ( = ?auto_371013 ?auto_371016 ) ) ( not ( = ?auto_371013 ?auto_371017 ) ) ( not ( = ?auto_371013 ?auto_371018 ) ) ( not ( = ?auto_371013 ?auto_371019 ) ) ( not ( = ?auto_371013 ?auto_371020 ) ) ( not ( = ?auto_371014 ?auto_371015 ) ) ( not ( = ?auto_371014 ?auto_371016 ) ) ( not ( = ?auto_371014 ?auto_371017 ) ) ( not ( = ?auto_371014 ?auto_371018 ) ) ( not ( = ?auto_371014 ?auto_371019 ) ) ( not ( = ?auto_371014 ?auto_371020 ) ) ( not ( = ?auto_371015 ?auto_371016 ) ) ( not ( = ?auto_371015 ?auto_371017 ) ) ( not ( = ?auto_371015 ?auto_371018 ) ) ( not ( = ?auto_371015 ?auto_371019 ) ) ( not ( = ?auto_371015 ?auto_371020 ) ) ( not ( = ?auto_371016 ?auto_371017 ) ) ( not ( = ?auto_371016 ?auto_371018 ) ) ( not ( = ?auto_371016 ?auto_371019 ) ) ( not ( = ?auto_371016 ?auto_371020 ) ) ( not ( = ?auto_371017 ?auto_371018 ) ) ( not ( = ?auto_371017 ?auto_371019 ) ) ( not ( = ?auto_371017 ?auto_371020 ) ) ( not ( = ?auto_371018 ?auto_371019 ) ) ( not ( = ?auto_371018 ?auto_371020 ) ) ( not ( = ?auto_371019 ?auto_371020 ) ) ( ON ?auto_371019 ?auto_371020 ) ( ON ?auto_371018 ?auto_371019 ) ( ON ?auto_371017 ?auto_371018 ) ( ON ?auto_371016 ?auto_371017 ) ( ON ?auto_371015 ?auto_371016 ) ( ON ?auto_371014 ?auto_371015 ) ( ON ?auto_371013 ?auto_371014 ) ( ON ?auto_371012 ?auto_371013 ) ( ON ?auto_371011 ?auto_371012 ) ( ON ?auto_371010 ?auto_371011 ) ( ON ?auto_371009 ?auto_371010 ) ( ON ?auto_371008 ?auto_371009 ) ( ON ?auto_371007 ?auto_371008 ) ( ON ?auto_371006 ?auto_371007 ) ( CLEAR ?auto_371006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_371006 )
      ( MAKE-15PILE ?auto_371006 ?auto_371007 ?auto_371008 ?auto_371009 ?auto_371010 ?auto_371011 ?auto_371012 ?auto_371013 ?auto_371014 ?auto_371015 ?auto_371016 ?auto_371017 ?auto_371018 ?auto_371019 ?auto_371020 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_371036 - BLOCK
      ?auto_371037 - BLOCK
      ?auto_371038 - BLOCK
      ?auto_371039 - BLOCK
      ?auto_371040 - BLOCK
      ?auto_371041 - BLOCK
      ?auto_371042 - BLOCK
      ?auto_371043 - BLOCK
      ?auto_371044 - BLOCK
      ?auto_371045 - BLOCK
      ?auto_371046 - BLOCK
      ?auto_371047 - BLOCK
      ?auto_371048 - BLOCK
      ?auto_371049 - BLOCK
      ?auto_371050 - BLOCK
    )
    :vars
    (
      ?auto_371051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_371036 ?auto_371037 ) ) ( not ( = ?auto_371036 ?auto_371038 ) ) ( not ( = ?auto_371036 ?auto_371039 ) ) ( not ( = ?auto_371036 ?auto_371040 ) ) ( not ( = ?auto_371036 ?auto_371041 ) ) ( not ( = ?auto_371036 ?auto_371042 ) ) ( not ( = ?auto_371036 ?auto_371043 ) ) ( not ( = ?auto_371036 ?auto_371044 ) ) ( not ( = ?auto_371036 ?auto_371045 ) ) ( not ( = ?auto_371036 ?auto_371046 ) ) ( not ( = ?auto_371036 ?auto_371047 ) ) ( not ( = ?auto_371036 ?auto_371048 ) ) ( not ( = ?auto_371036 ?auto_371049 ) ) ( not ( = ?auto_371036 ?auto_371050 ) ) ( not ( = ?auto_371037 ?auto_371038 ) ) ( not ( = ?auto_371037 ?auto_371039 ) ) ( not ( = ?auto_371037 ?auto_371040 ) ) ( not ( = ?auto_371037 ?auto_371041 ) ) ( not ( = ?auto_371037 ?auto_371042 ) ) ( not ( = ?auto_371037 ?auto_371043 ) ) ( not ( = ?auto_371037 ?auto_371044 ) ) ( not ( = ?auto_371037 ?auto_371045 ) ) ( not ( = ?auto_371037 ?auto_371046 ) ) ( not ( = ?auto_371037 ?auto_371047 ) ) ( not ( = ?auto_371037 ?auto_371048 ) ) ( not ( = ?auto_371037 ?auto_371049 ) ) ( not ( = ?auto_371037 ?auto_371050 ) ) ( not ( = ?auto_371038 ?auto_371039 ) ) ( not ( = ?auto_371038 ?auto_371040 ) ) ( not ( = ?auto_371038 ?auto_371041 ) ) ( not ( = ?auto_371038 ?auto_371042 ) ) ( not ( = ?auto_371038 ?auto_371043 ) ) ( not ( = ?auto_371038 ?auto_371044 ) ) ( not ( = ?auto_371038 ?auto_371045 ) ) ( not ( = ?auto_371038 ?auto_371046 ) ) ( not ( = ?auto_371038 ?auto_371047 ) ) ( not ( = ?auto_371038 ?auto_371048 ) ) ( not ( = ?auto_371038 ?auto_371049 ) ) ( not ( = ?auto_371038 ?auto_371050 ) ) ( not ( = ?auto_371039 ?auto_371040 ) ) ( not ( = ?auto_371039 ?auto_371041 ) ) ( not ( = ?auto_371039 ?auto_371042 ) ) ( not ( = ?auto_371039 ?auto_371043 ) ) ( not ( = ?auto_371039 ?auto_371044 ) ) ( not ( = ?auto_371039 ?auto_371045 ) ) ( not ( = ?auto_371039 ?auto_371046 ) ) ( not ( = ?auto_371039 ?auto_371047 ) ) ( not ( = ?auto_371039 ?auto_371048 ) ) ( not ( = ?auto_371039 ?auto_371049 ) ) ( not ( = ?auto_371039 ?auto_371050 ) ) ( not ( = ?auto_371040 ?auto_371041 ) ) ( not ( = ?auto_371040 ?auto_371042 ) ) ( not ( = ?auto_371040 ?auto_371043 ) ) ( not ( = ?auto_371040 ?auto_371044 ) ) ( not ( = ?auto_371040 ?auto_371045 ) ) ( not ( = ?auto_371040 ?auto_371046 ) ) ( not ( = ?auto_371040 ?auto_371047 ) ) ( not ( = ?auto_371040 ?auto_371048 ) ) ( not ( = ?auto_371040 ?auto_371049 ) ) ( not ( = ?auto_371040 ?auto_371050 ) ) ( not ( = ?auto_371041 ?auto_371042 ) ) ( not ( = ?auto_371041 ?auto_371043 ) ) ( not ( = ?auto_371041 ?auto_371044 ) ) ( not ( = ?auto_371041 ?auto_371045 ) ) ( not ( = ?auto_371041 ?auto_371046 ) ) ( not ( = ?auto_371041 ?auto_371047 ) ) ( not ( = ?auto_371041 ?auto_371048 ) ) ( not ( = ?auto_371041 ?auto_371049 ) ) ( not ( = ?auto_371041 ?auto_371050 ) ) ( not ( = ?auto_371042 ?auto_371043 ) ) ( not ( = ?auto_371042 ?auto_371044 ) ) ( not ( = ?auto_371042 ?auto_371045 ) ) ( not ( = ?auto_371042 ?auto_371046 ) ) ( not ( = ?auto_371042 ?auto_371047 ) ) ( not ( = ?auto_371042 ?auto_371048 ) ) ( not ( = ?auto_371042 ?auto_371049 ) ) ( not ( = ?auto_371042 ?auto_371050 ) ) ( not ( = ?auto_371043 ?auto_371044 ) ) ( not ( = ?auto_371043 ?auto_371045 ) ) ( not ( = ?auto_371043 ?auto_371046 ) ) ( not ( = ?auto_371043 ?auto_371047 ) ) ( not ( = ?auto_371043 ?auto_371048 ) ) ( not ( = ?auto_371043 ?auto_371049 ) ) ( not ( = ?auto_371043 ?auto_371050 ) ) ( not ( = ?auto_371044 ?auto_371045 ) ) ( not ( = ?auto_371044 ?auto_371046 ) ) ( not ( = ?auto_371044 ?auto_371047 ) ) ( not ( = ?auto_371044 ?auto_371048 ) ) ( not ( = ?auto_371044 ?auto_371049 ) ) ( not ( = ?auto_371044 ?auto_371050 ) ) ( not ( = ?auto_371045 ?auto_371046 ) ) ( not ( = ?auto_371045 ?auto_371047 ) ) ( not ( = ?auto_371045 ?auto_371048 ) ) ( not ( = ?auto_371045 ?auto_371049 ) ) ( not ( = ?auto_371045 ?auto_371050 ) ) ( not ( = ?auto_371046 ?auto_371047 ) ) ( not ( = ?auto_371046 ?auto_371048 ) ) ( not ( = ?auto_371046 ?auto_371049 ) ) ( not ( = ?auto_371046 ?auto_371050 ) ) ( not ( = ?auto_371047 ?auto_371048 ) ) ( not ( = ?auto_371047 ?auto_371049 ) ) ( not ( = ?auto_371047 ?auto_371050 ) ) ( not ( = ?auto_371048 ?auto_371049 ) ) ( not ( = ?auto_371048 ?auto_371050 ) ) ( not ( = ?auto_371049 ?auto_371050 ) ) ( ON ?auto_371036 ?auto_371051 ) ( not ( = ?auto_371050 ?auto_371051 ) ) ( not ( = ?auto_371049 ?auto_371051 ) ) ( not ( = ?auto_371048 ?auto_371051 ) ) ( not ( = ?auto_371047 ?auto_371051 ) ) ( not ( = ?auto_371046 ?auto_371051 ) ) ( not ( = ?auto_371045 ?auto_371051 ) ) ( not ( = ?auto_371044 ?auto_371051 ) ) ( not ( = ?auto_371043 ?auto_371051 ) ) ( not ( = ?auto_371042 ?auto_371051 ) ) ( not ( = ?auto_371041 ?auto_371051 ) ) ( not ( = ?auto_371040 ?auto_371051 ) ) ( not ( = ?auto_371039 ?auto_371051 ) ) ( not ( = ?auto_371038 ?auto_371051 ) ) ( not ( = ?auto_371037 ?auto_371051 ) ) ( not ( = ?auto_371036 ?auto_371051 ) ) ( ON ?auto_371037 ?auto_371036 ) ( ON ?auto_371038 ?auto_371037 ) ( ON ?auto_371039 ?auto_371038 ) ( ON ?auto_371040 ?auto_371039 ) ( ON ?auto_371041 ?auto_371040 ) ( ON ?auto_371042 ?auto_371041 ) ( ON ?auto_371043 ?auto_371042 ) ( ON ?auto_371044 ?auto_371043 ) ( ON ?auto_371045 ?auto_371044 ) ( ON ?auto_371046 ?auto_371045 ) ( ON ?auto_371047 ?auto_371046 ) ( ON ?auto_371048 ?auto_371047 ) ( ON ?auto_371049 ?auto_371048 ) ( ON ?auto_371050 ?auto_371049 ) ( CLEAR ?auto_371050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_371050 ?auto_371049 ?auto_371048 ?auto_371047 ?auto_371046 ?auto_371045 ?auto_371044 ?auto_371043 ?auto_371042 ?auto_371041 ?auto_371040 ?auto_371039 ?auto_371038 ?auto_371037 ?auto_371036 )
      ( MAKE-15PILE ?auto_371036 ?auto_371037 ?auto_371038 ?auto_371039 ?auto_371040 ?auto_371041 ?auto_371042 ?auto_371043 ?auto_371044 ?auto_371045 ?auto_371046 ?auto_371047 ?auto_371048 ?auto_371049 ?auto_371050 ) )
  )

)

