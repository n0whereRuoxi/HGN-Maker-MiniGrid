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
      ?auto_774869 - BLOCK
    )
    :vars
    (
      ?auto_774870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_774869 ?auto_774870 ) ( CLEAR ?auto_774869 ) ( HAND-EMPTY ) ( not ( = ?auto_774869 ?auto_774870 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_774869 ?auto_774870 )
      ( !PUTDOWN ?auto_774869 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_774876 - BLOCK
      ?auto_774877 - BLOCK
    )
    :vars
    (
      ?auto_774878 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_774876 ) ( ON ?auto_774877 ?auto_774878 ) ( CLEAR ?auto_774877 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_774876 ) ( not ( = ?auto_774876 ?auto_774877 ) ) ( not ( = ?auto_774876 ?auto_774878 ) ) ( not ( = ?auto_774877 ?auto_774878 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_774877 ?auto_774878 )
      ( !STACK ?auto_774877 ?auto_774876 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_774886 - BLOCK
      ?auto_774887 - BLOCK
    )
    :vars
    (
      ?auto_774888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_774887 ?auto_774888 ) ( not ( = ?auto_774886 ?auto_774887 ) ) ( not ( = ?auto_774886 ?auto_774888 ) ) ( not ( = ?auto_774887 ?auto_774888 ) ) ( ON ?auto_774886 ?auto_774887 ) ( CLEAR ?auto_774886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_774886 )
      ( MAKE-2PILE ?auto_774886 ?auto_774887 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_774897 - BLOCK
      ?auto_774898 - BLOCK
      ?auto_774899 - BLOCK
    )
    :vars
    (
      ?auto_774900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_774898 ) ( ON ?auto_774899 ?auto_774900 ) ( CLEAR ?auto_774899 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_774897 ) ( ON ?auto_774898 ?auto_774897 ) ( not ( = ?auto_774897 ?auto_774898 ) ) ( not ( = ?auto_774897 ?auto_774899 ) ) ( not ( = ?auto_774897 ?auto_774900 ) ) ( not ( = ?auto_774898 ?auto_774899 ) ) ( not ( = ?auto_774898 ?auto_774900 ) ) ( not ( = ?auto_774899 ?auto_774900 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_774899 ?auto_774900 )
      ( !STACK ?auto_774899 ?auto_774898 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_774911 - BLOCK
      ?auto_774912 - BLOCK
      ?auto_774913 - BLOCK
    )
    :vars
    (
      ?auto_774914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_774913 ?auto_774914 ) ( ON-TABLE ?auto_774911 ) ( not ( = ?auto_774911 ?auto_774912 ) ) ( not ( = ?auto_774911 ?auto_774913 ) ) ( not ( = ?auto_774911 ?auto_774914 ) ) ( not ( = ?auto_774912 ?auto_774913 ) ) ( not ( = ?auto_774912 ?auto_774914 ) ) ( not ( = ?auto_774913 ?auto_774914 ) ) ( CLEAR ?auto_774911 ) ( ON ?auto_774912 ?auto_774913 ) ( CLEAR ?auto_774912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_774911 ?auto_774912 )
      ( MAKE-3PILE ?auto_774911 ?auto_774912 ?auto_774913 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_774925 - BLOCK
      ?auto_774926 - BLOCK
      ?auto_774927 - BLOCK
    )
    :vars
    (
      ?auto_774928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_774927 ?auto_774928 ) ( not ( = ?auto_774925 ?auto_774926 ) ) ( not ( = ?auto_774925 ?auto_774927 ) ) ( not ( = ?auto_774925 ?auto_774928 ) ) ( not ( = ?auto_774926 ?auto_774927 ) ) ( not ( = ?auto_774926 ?auto_774928 ) ) ( not ( = ?auto_774927 ?auto_774928 ) ) ( ON ?auto_774926 ?auto_774927 ) ( ON ?auto_774925 ?auto_774926 ) ( CLEAR ?auto_774925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_774925 )
      ( MAKE-3PILE ?auto_774925 ?auto_774926 ?auto_774927 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_774940 - BLOCK
      ?auto_774941 - BLOCK
      ?auto_774942 - BLOCK
      ?auto_774943 - BLOCK
    )
    :vars
    (
      ?auto_774944 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_774942 ) ( ON ?auto_774943 ?auto_774944 ) ( CLEAR ?auto_774943 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_774940 ) ( ON ?auto_774941 ?auto_774940 ) ( ON ?auto_774942 ?auto_774941 ) ( not ( = ?auto_774940 ?auto_774941 ) ) ( not ( = ?auto_774940 ?auto_774942 ) ) ( not ( = ?auto_774940 ?auto_774943 ) ) ( not ( = ?auto_774940 ?auto_774944 ) ) ( not ( = ?auto_774941 ?auto_774942 ) ) ( not ( = ?auto_774941 ?auto_774943 ) ) ( not ( = ?auto_774941 ?auto_774944 ) ) ( not ( = ?auto_774942 ?auto_774943 ) ) ( not ( = ?auto_774942 ?auto_774944 ) ) ( not ( = ?auto_774943 ?auto_774944 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_774943 ?auto_774944 )
      ( !STACK ?auto_774943 ?auto_774942 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_774958 - BLOCK
      ?auto_774959 - BLOCK
      ?auto_774960 - BLOCK
      ?auto_774961 - BLOCK
    )
    :vars
    (
      ?auto_774962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_774961 ?auto_774962 ) ( ON-TABLE ?auto_774958 ) ( ON ?auto_774959 ?auto_774958 ) ( not ( = ?auto_774958 ?auto_774959 ) ) ( not ( = ?auto_774958 ?auto_774960 ) ) ( not ( = ?auto_774958 ?auto_774961 ) ) ( not ( = ?auto_774958 ?auto_774962 ) ) ( not ( = ?auto_774959 ?auto_774960 ) ) ( not ( = ?auto_774959 ?auto_774961 ) ) ( not ( = ?auto_774959 ?auto_774962 ) ) ( not ( = ?auto_774960 ?auto_774961 ) ) ( not ( = ?auto_774960 ?auto_774962 ) ) ( not ( = ?auto_774961 ?auto_774962 ) ) ( CLEAR ?auto_774959 ) ( ON ?auto_774960 ?auto_774961 ) ( CLEAR ?auto_774960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_774958 ?auto_774959 ?auto_774960 )
      ( MAKE-4PILE ?auto_774958 ?auto_774959 ?auto_774960 ?auto_774961 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_774976 - BLOCK
      ?auto_774977 - BLOCK
      ?auto_774978 - BLOCK
      ?auto_774979 - BLOCK
    )
    :vars
    (
      ?auto_774980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_774979 ?auto_774980 ) ( ON-TABLE ?auto_774976 ) ( not ( = ?auto_774976 ?auto_774977 ) ) ( not ( = ?auto_774976 ?auto_774978 ) ) ( not ( = ?auto_774976 ?auto_774979 ) ) ( not ( = ?auto_774976 ?auto_774980 ) ) ( not ( = ?auto_774977 ?auto_774978 ) ) ( not ( = ?auto_774977 ?auto_774979 ) ) ( not ( = ?auto_774977 ?auto_774980 ) ) ( not ( = ?auto_774978 ?auto_774979 ) ) ( not ( = ?auto_774978 ?auto_774980 ) ) ( not ( = ?auto_774979 ?auto_774980 ) ) ( ON ?auto_774978 ?auto_774979 ) ( CLEAR ?auto_774976 ) ( ON ?auto_774977 ?auto_774978 ) ( CLEAR ?auto_774977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_774976 ?auto_774977 )
      ( MAKE-4PILE ?auto_774976 ?auto_774977 ?auto_774978 ?auto_774979 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_774994 - BLOCK
      ?auto_774995 - BLOCK
      ?auto_774996 - BLOCK
      ?auto_774997 - BLOCK
    )
    :vars
    (
      ?auto_774998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_774997 ?auto_774998 ) ( not ( = ?auto_774994 ?auto_774995 ) ) ( not ( = ?auto_774994 ?auto_774996 ) ) ( not ( = ?auto_774994 ?auto_774997 ) ) ( not ( = ?auto_774994 ?auto_774998 ) ) ( not ( = ?auto_774995 ?auto_774996 ) ) ( not ( = ?auto_774995 ?auto_774997 ) ) ( not ( = ?auto_774995 ?auto_774998 ) ) ( not ( = ?auto_774996 ?auto_774997 ) ) ( not ( = ?auto_774996 ?auto_774998 ) ) ( not ( = ?auto_774997 ?auto_774998 ) ) ( ON ?auto_774996 ?auto_774997 ) ( ON ?auto_774995 ?auto_774996 ) ( ON ?auto_774994 ?auto_774995 ) ( CLEAR ?auto_774994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_774994 )
      ( MAKE-4PILE ?auto_774994 ?auto_774995 ?auto_774996 ?auto_774997 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_775013 - BLOCK
      ?auto_775014 - BLOCK
      ?auto_775015 - BLOCK
      ?auto_775016 - BLOCK
      ?auto_775017 - BLOCK
    )
    :vars
    (
      ?auto_775018 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_775016 ) ( ON ?auto_775017 ?auto_775018 ) ( CLEAR ?auto_775017 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_775013 ) ( ON ?auto_775014 ?auto_775013 ) ( ON ?auto_775015 ?auto_775014 ) ( ON ?auto_775016 ?auto_775015 ) ( not ( = ?auto_775013 ?auto_775014 ) ) ( not ( = ?auto_775013 ?auto_775015 ) ) ( not ( = ?auto_775013 ?auto_775016 ) ) ( not ( = ?auto_775013 ?auto_775017 ) ) ( not ( = ?auto_775013 ?auto_775018 ) ) ( not ( = ?auto_775014 ?auto_775015 ) ) ( not ( = ?auto_775014 ?auto_775016 ) ) ( not ( = ?auto_775014 ?auto_775017 ) ) ( not ( = ?auto_775014 ?auto_775018 ) ) ( not ( = ?auto_775015 ?auto_775016 ) ) ( not ( = ?auto_775015 ?auto_775017 ) ) ( not ( = ?auto_775015 ?auto_775018 ) ) ( not ( = ?auto_775016 ?auto_775017 ) ) ( not ( = ?auto_775016 ?auto_775018 ) ) ( not ( = ?auto_775017 ?auto_775018 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_775017 ?auto_775018 )
      ( !STACK ?auto_775017 ?auto_775016 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_775035 - BLOCK
      ?auto_775036 - BLOCK
      ?auto_775037 - BLOCK
      ?auto_775038 - BLOCK
      ?auto_775039 - BLOCK
    )
    :vars
    (
      ?auto_775040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775039 ?auto_775040 ) ( ON-TABLE ?auto_775035 ) ( ON ?auto_775036 ?auto_775035 ) ( ON ?auto_775037 ?auto_775036 ) ( not ( = ?auto_775035 ?auto_775036 ) ) ( not ( = ?auto_775035 ?auto_775037 ) ) ( not ( = ?auto_775035 ?auto_775038 ) ) ( not ( = ?auto_775035 ?auto_775039 ) ) ( not ( = ?auto_775035 ?auto_775040 ) ) ( not ( = ?auto_775036 ?auto_775037 ) ) ( not ( = ?auto_775036 ?auto_775038 ) ) ( not ( = ?auto_775036 ?auto_775039 ) ) ( not ( = ?auto_775036 ?auto_775040 ) ) ( not ( = ?auto_775037 ?auto_775038 ) ) ( not ( = ?auto_775037 ?auto_775039 ) ) ( not ( = ?auto_775037 ?auto_775040 ) ) ( not ( = ?auto_775038 ?auto_775039 ) ) ( not ( = ?auto_775038 ?auto_775040 ) ) ( not ( = ?auto_775039 ?auto_775040 ) ) ( CLEAR ?auto_775037 ) ( ON ?auto_775038 ?auto_775039 ) ( CLEAR ?auto_775038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_775035 ?auto_775036 ?auto_775037 ?auto_775038 )
      ( MAKE-5PILE ?auto_775035 ?auto_775036 ?auto_775037 ?auto_775038 ?auto_775039 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_775057 - BLOCK
      ?auto_775058 - BLOCK
      ?auto_775059 - BLOCK
      ?auto_775060 - BLOCK
      ?auto_775061 - BLOCK
    )
    :vars
    (
      ?auto_775062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775061 ?auto_775062 ) ( ON-TABLE ?auto_775057 ) ( ON ?auto_775058 ?auto_775057 ) ( not ( = ?auto_775057 ?auto_775058 ) ) ( not ( = ?auto_775057 ?auto_775059 ) ) ( not ( = ?auto_775057 ?auto_775060 ) ) ( not ( = ?auto_775057 ?auto_775061 ) ) ( not ( = ?auto_775057 ?auto_775062 ) ) ( not ( = ?auto_775058 ?auto_775059 ) ) ( not ( = ?auto_775058 ?auto_775060 ) ) ( not ( = ?auto_775058 ?auto_775061 ) ) ( not ( = ?auto_775058 ?auto_775062 ) ) ( not ( = ?auto_775059 ?auto_775060 ) ) ( not ( = ?auto_775059 ?auto_775061 ) ) ( not ( = ?auto_775059 ?auto_775062 ) ) ( not ( = ?auto_775060 ?auto_775061 ) ) ( not ( = ?auto_775060 ?auto_775062 ) ) ( not ( = ?auto_775061 ?auto_775062 ) ) ( ON ?auto_775060 ?auto_775061 ) ( CLEAR ?auto_775058 ) ( ON ?auto_775059 ?auto_775060 ) ( CLEAR ?auto_775059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_775057 ?auto_775058 ?auto_775059 )
      ( MAKE-5PILE ?auto_775057 ?auto_775058 ?auto_775059 ?auto_775060 ?auto_775061 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_775079 - BLOCK
      ?auto_775080 - BLOCK
      ?auto_775081 - BLOCK
      ?auto_775082 - BLOCK
      ?auto_775083 - BLOCK
    )
    :vars
    (
      ?auto_775084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775083 ?auto_775084 ) ( ON-TABLE ?auto_775079 ) ( not ( = ?auto_775079 ?auto_775080 ) ) ( not ( = ?auto_775079 ?auto_775081 ) ) ( not ( = ?auto_775079 ?auto_775082 ) ) ( not ( = ?auto_775079 ?auto_775083 ) ) ( not ( = ?auto_775079 ?auto_775084 ) ) ( not ( = ?auto_775080 ?auto_775081 ) ) ( not ( = ?auto_775080 ?auto_775082 ) ) ( not ( = ?auto_775080 ?auto_775083 ) ) ( not ( = ?auto_775080 ?auto_775084 ) ) ( not ( = ?auto_775081 ?auto_775082 ) ) ( not ( = ?auto_775081 ?auto_775083 ) ) ( not ( = ?auto_775081 ?auto_775084 ) ) ( not ( = ?auto_775082 ?auto_775083 ) ) ( not ( = ?auto_775082 ?auto_775084 ) ) ( not ( = ?auto_775083 ?auto_775084 ) ) ( ON ?auto_775082 ?auto_775083 ) ( ON ?auto_775081 ?auto_775082 ) ( CLEAR ?auto_775079 ) ( ON ?auto_775080 ?auto_775081 ) ( CLEAR ?auto_775080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_775079 ?auto_775080 )
      ( MAKE-5PILE ?auto_775079 ?auto_775080 ?auto_775081 ?auto_775082 ?auto_775083 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_775101 - BLOCK
      ?auto_775102 - BLOCK
      ?auto_775103 - BLOCK
      ?auto_775104 - BLOCK
      ?auto_775105 - BLOCK
    )
    :vars
    (
      ?auto_775106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775105 ?auto_775106 ) ( not ( = ?auto_775101 ?auto_775102 ) ) ( not ( = ?auto_775101 ?auto_775103 ) ) ( not ( = ?auto_775101 ?auto_775104 ) ) ( not ( = ?auto_775101 ?auto_775105 ) ) ( not ( = ?auto_775101 ?auto_775106 ) ) ( not ( = ?auto_775102 ?auto_775103 ) ) ( not ( = ?auto_775102 ?auto_775104 ) ) ( not ( = ?auto_775102 ?auto_775105 ) ) ( not ( = ?auto_775102 ?auto_775106 ) ) ( not ( = ?auto_775103 ?auto_775104 ) ) ( not ( = ?auto_775103 ?auto_775105 ) ) ( not ( = ?auto_775103 ?auto_775106 ) ) ( not ( = ?auto_775104 ?auto_775105 ) ) ( not ( = ?auto_775104 ?auto_775106 ) ) ( not ( = ?auto_775105 ?auto_775106 ) ) ( ON ?auto_775104 ?auto_775105 ) ( ON ?auto_775103 ?auto_775104 ) ( ON ?auto_775102 ?auto_775103 ) ( ON ?auto_775101 ?auto_775102 ) ( CLEAR ?auto_775101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_775101 )
      ( MAKE-5PILE ?auto_775101 ?auto_775102 ?auto_775103 ?auto_775104 ?auto_775105 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_775124 - BLOCK
      ?auto_775125 - BLOCK
      ?auto_775126 - BLOCK
      ?auto_775127 - BLOCK
      ?auto_775128 - BLOCK
      ?auto_775129 - BLOCK
    )
    :vars
    (
      ?auto_775130 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_775128 ) ( ON ?auto_775129 ?auto_775130 ) ( CLEAR ?auto_775129 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_775124 ) ( ON ?auto_775125 ?auto_775124 ) ( ON ?auto_775126 ?auto_775125 ) ( ON ?auto_775127 ?auto_775126 ) ( ON ?auto_775128 ?auto_775127 ) ( not ( = ?auto_775124 ?auto_775125 ) ) ( not ( = ?auto_775124 ?auto_775126 ) ) ( not ( = ?auto_775124 ?auto_775127 ) ) ( not ( = ?auto_775124 ?auto_775128 ) ) ( not ( = ?auto_775124 ?auto_775129 ) ) ( not ( = ?auto_775124 ?auto_775130 ) ) ( not ( = ?auto_775125 ?auto_775126 ) ) ( not ( = ?auto_775125 ?auto_775127 ) ) ( not ( = ?auto_775125 ?auto_775128 ) ) ( not ( = ?auto_775125 ?auto_775129 ) ) ( not ( = ?auto_775125 ?auto_775130 ) ) ( not ( = ?auto_775126 ?auto_775127 ) ) ( not ( = ?auto_775126 ?auto_775128 ) ) ( not ( = ?auto_775126 ?auto_775129 ) ) ( not ( = ?auto_775126 ?auto_775130 ) ) ( not ( = ?auto_775127 ?auto_775128 ) ) ( not ( = ?auto_775127 ?auto_775129 ) ) ( not ( = ?auto_775127 ?auto_775130 ) ) ( not ( = ?auto_775128 ?auto_775129 ) ) ( not ( = ?auto_775128 ?auto_775130 ) ) ( not ( = ?auto_775129 ?auto_775130 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_775129 ?auto_775130 )
      ( !STACK ?auto_775129 ?auto_775128 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_775150 - BLOCK
      ?auto_775151 - BLOCK
      ?auto_775152 - BLOCK
      ?auto_775153 - BLOCK
      ?auto_775154 - BLOCK
      ?auto_775155 - BLOCK
    )
    :vars
    (
      ?auto_775156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775155 ?auto_775156 ) ( ON-TABLE ?auto_775150 ) ( ON ?auto_775151 ?auto_775150 ) ( ON ?auto_775152 ?auto_775151 ) ( ON ?auto_775153 ?auto_775152 ) ( not ( = ?auto_775150 ?auto_775151 ) ) ( not ( = ?auto_775150 ?auto_775152 ) ) ( not ( = ?auto_775150 ?auto_775153 ) ) ( not ( = ?auto_775150 ?auto_775154 ) ) ( not ( = ?auto_775150 ?auto_775155 ) ) ( not ( = ?auto_775150 ?auto_775156 ) ) ( not ( = ?auto_775151 ?auto_775152 ) ) ( not ( = ?auto_775151 ?auto_775153 ) ) ( not ( = ?auto_775151 ?auto_775154 ) ) ( not ( = ?auto_775151 ?auto_775155 ) ) ( not ( = ?auto_775151 ?auto_775156 ) ) ( not ( = ?auto_775152 ?auto_775153 ) ) ( not ( = ?auto_775152 ?auto_775154 ) ) ( not ( = ?auto_775152 ?auto_775155 ) ) ( not ( = ?auto_775152 ?auto_775156 ) ) ( not ( = ?auto_775153 ?auto_775154 ) ) ( not ( = ?auto_775153 ?auto_775155 ) ) ( not ( = ?auto_775153 ?auto_775156 ) ) ( not ( = ?auto_775154 ?auto_775155 ) ) ( not ( = ?auto_775154 ?auto_775156 ) ) ( not ( = ?auto_775155 ?auto_775156 ) ) ( CLEAR ?auto_775153 ) ( ON ?auto_775154 ?auto_775155 ) ( CLEAR ?auto_775154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_775150 ?auto_775151 ?auto_775152 ?auto_775153 ?auto_775154 )
      ( MAKE-6PILE ?auto_775150 ?auto_775151 ?auto_775152 ?auto_775153 ?auto_775154 ?auto_775155 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_775176 - BLOCK
      ?auto_775177 - BLOCK
      ?auto_775178 - BLOCK
      ?auto_775179 - BLOCK
      ?auto_775180 - BLOCK
      ?auto_775181 - BLOCK
    )
    :vars
    (
      ?auto_775182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775181 ?auto_775182 ) ( ON-TABLE ?auto_775176 ) ( ON ?auto_775177 ?auto_775176 ) ( ON ?auto_775178 ?auto_775177 ) ( not ( = ?auto_775176 ?auto_775177 ) ) ( not ( = ?auto_775176 ?auto_775178 ) ) ( not ( = ?auto_775176 ?auto_775179 ) ) ( not ( = ?auto_775176 ?auto_775180 ) ) ( not ( = ?auto_775176 ?auto_775181 ) ) ( not ( = ?auto_775176 ?auto_775182 ) ) ( not ( = ?auto_775177 ?auto_775178 ) ) ( not ( = ?auto_775177 ?auto_775179 ) ) ( not ( = ?auto_775177 ?auto_775180 ) ) ( not ( = ?auto_775177 ?auto_775181 ) ) ( not ( = ?auto_775177 ?auto_775182 ) ) ( not ( = ?auto_775178 ?auto_775179 ) ) ( not ( = ?auto_775178 ?auto_775180 ) ) ( not ( = ?auto_775178 ?auto_775181 ) ) ( not ( = ?auto_775178 ?auto_775182 ) ) ( not ( = ?auto_775179 ?auto_775180 ) ) ( not ( = ?auto_775179 ?auto_775181 ) ) ( not ( = ?auto_775179 ?auto_775182 ) ) ( not ( = ?auto_775180 ?auto_775181 ) ) ( not ( = ?auto_775180 ?auto_775182 ) ) ( not ( = ?auto_775181 ?auto_775182 ) ) ( ON ?auto_775180 ?auto_775181 ) ( CLEAR ?auto_775178 ) ( ON ?auto_775179 ?auto_775180 ) ( CLEAR ?auto_775179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_775176 ?auto_775177 ?auto_775178 ?auto_775179 )
      ( MAKE-6PILE ?auto_775176 ?auto_775177 ?auto_775178 ?auto_775179 ?auto_775180 ?auto_775181 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_775202 - BLOCK
      ?auto_775203 - BLOCK
      ?auto_775204 - BLOCK
      ?auto_775205 - BLOCK
      ?auto_775206 - BLOCK
      ?auto_775207 - BLOCK
    )
    :vars
    (
      ?auto_775208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775207 ?auto_775208 ) ( ON-TABLE ?auto_775202 ) ( ON ?auto_775203 ?auto_775202 ) ( not ( = ?auto_775202 ?auto_775203 ) ) ( not ( = ?auto_775202 ?auto_775204 ) ) ( not ( = ?auto_775202 ?auto_775205 ) ) ( not ( = ?auto_775202 ?auto_775206 ) ) ( not ( = ?auto_775202 ?auto_775207 ) ) ( not ( = ?auto_775202 ?auto_775208 ) ) ( not ( = ?auto_775203 ?auto_775204 ) ) ( not ( = ?auto_775203 ?auto_775205 ) ) ( not ( = ?auto_775203 ?auto_775206 ) ) ( not ( = ?auto_775203 ?auto_775207 ) ) ( not ( = ?auto_775203 ?auto_775208 ) ) ( not ( = ?auto_775204 ?auto_775205 ) ) ( not ( = ?auto_775204 ?auto_775206 ) ) ( not ( = ?auto_775204 ?auto_775207 ) ) ( not ( = ?auto_775204 ?auto_775208 ) ) ( not ( = ?auto_775205 ?auto_775206 ) ) ( not ( = ?auto_775205 ?auto_775207 ) ) ( not ( = ?auto_775205 ?auto_775208 ) ) ( not ( = ?auto_775206 ?auto_775207 ) ) ( not ( = ?auto_775206 ?auto_775208 ) ) ( not ( = ?auto_775207 ?auto_775208 ) ) ( ON ?auto_775206 ?auto_775207 ) ( ON ?auto_775205 ?auto_775206 ) ( CLEAR ?auto_775203 ) ( ON ?auto_775204 ?auto_775205 ) ( CLEAR ?auto_775204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_775202 ?auto_775203 ?auto_775204 )
      ( MAKE-6PILE ?auto_775202 ?auto_775203 ?auto_775204 ?auto_775205 ?auto_775206 ?auto_775207 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_775228 - BLOCK
      ?auto_775229 - BLOCK
      ?auto_775230 - BLOCK
      ?auto_775231 - BLOCK
      ?auto_775232 - BLOCK
      ?auto_775233 - BLOCK
    )
    :vars
    (
      ?auto_775234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775233 ?auto_775234 ) ( ON-TABLE ?auto_775228 ) ( not ( = ?auto_775228 ?auto_775229 ) ) ( not ( = ?auto_775228 ?auto_775230 ) ) ( not ( = ?auto_775228 ?auto_775231 ) ) ( not ( = ?auto_775228 ?auto_775232 ) ) ( not ( = ?auto_775228 ?auto_775233 ) ) ( not ( = ?auto_775228 ?auto_775234 ) ) ( not ( = ?auto_775229 ?auto_775230 ) ) ( not ( = ?auto_775229 ?auto_775231 ) ) ( not ( = ?auto_775229 ?auto_775232 ) ) ( not ( = ?auto_775229 ?auto_775233 ) ) ( not ( = ?auto_775229 ?auto_775234 ) ) ( not ( = ?auto_775230 ?auto_775231 ) ) ( not ( = ?auto_775230 ?auto_775232 ) ) ( not ( = ?auto_775230 ?auto_775233 ) ) ( not ( = ?auto_775230 ?auto_775234 ) ) ( not ( = ?auto_775231 ?auto_775232 ) ) ( not ( = ?auto_775231 ?auto_775233 ) ) ( not ( = ?auto_775231 ?auto_775234 ) ) ( not ( = ?auto_775232 ?auto_775233 ) ) ( not ( = ?auto_775232 ?auto_775234 ) ) ( not ( = ?auto_775233 ?auto_775234 ) ) ( ON ?auto_775232 ?auto_775233 ) ( ON ?auto_775231 ?auto_775232 ) ( ON ?auto_775230 ?auto_775231 ) ( CLEAR ?auto_775228 ) ( ON ?auto_775229 ?auto_775230 ) ( CLEAR ?auto_775229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_775228 ?auto_775229 )
      ( MAKE-6PILE ?auto_775228 ?auto_775229 ?auto_775230 ?auto_775231 ?auto_775232 ?auto_775233 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_775254 - BLOCK
      ?auto_775255 - BLOCK
      ?auto_775256 - BLOCK
      ?auto_775257 - BLOCK
      ?auto_775258 - BLOCK
      ?auto_775259 - BLOCK
    )
    :vars
    (
      ?auto_775260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775259 ?auto_775260 ) ( not ( = ?auto_775254 ?auto_775255 ) ) ( not ( = ?auto_775254 ?auto_775256 ) ) ( not ( = ?auto_775254 ?auto_775257 ) ) ( not ( = ?auto_775254 ?auto_775258 ) ) ( not ( = ?auto_775254 ?auto_775259 ) ) ( not ( = ?auto_775254 ?auto_775260 ) ) ( not ( = ?auto_775255 ?auto_775256 ) ) ( not ( = ?auto_775255 ?auto_775257 ) ) ( not ( = ?auto_775255 ?auto_775258 ) ) ( not ( = ?auto_775255 ?auto_775259 ) ) ( not ( = ?auto_775255 ?auto_775260 ) ) ( not ( = ?auto_775256 ?auto_775257 ) ) ( not ( = ?auto_775256 ?auto_775258 ) ) ( not ( = ?auto_775256 ?auto_775259 ) ) ( not ( = ?auto_775256 ?auto_775260 ) ) ( not ( = ?auto_775257 ?auto_775258 ) ) ( not ( = ?auto_775257 ?auto_775259 ) ) ( not ( = ?auto_775257 ?auto_775260 ) ) ( not ( = ?auto_775258 ?auto_775259 ) ) ( not ( = ?auto_775258 ?auto_775260 ) ) ( not ( = ?auto_775259 ?auto_775260 ) ) ( ON ?auto_775258 ?auto_775259 ) ( ON ?auto_775257 ?auto_775258 ) ( ON ?auto_775256 ?auto_775257 ) ( ON ?auto_775255 ?auto_775256 ) ( ON ?auto_775254 ?auto_775255 ) ( CLEAR ?auto_775254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_775254 )
      ( MAKE-6PILE ?auto_775254 ?auto_775255 ?auto_775256 ?auto_775257 ?auto_775258 ?auto_775259 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_775281 - BLOCK
      ?auto_775282 - BLOCK
      ?auto_775283 - BLOCK
      ?auto_775284 - BLOCK
      ?auto_775285 - BLOCK
      ?auto_775286 - BLOCK
      ?auto_775287 - BLOCK
    )
    :vars
    (
      ?auto_775288 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_775286 ) ( ON ?auto_775287 ?auto_775288 ) ( CLEAR ?auto_775287 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_775281 ) ( ON ?auto_775282 ?auto_775281 ) ( ON ?auto_775283 ?auto_775282 ) ( ON ?auto_775284 ?auto_775283 ) ( ON ?auto_775285 ?auto_775284 ) ( ON ?auto_775286 ?auto_775285 ) ( not ( = ?auto_775281 ?auto_775282 ) ) ( not ( = ?auto_775281 ?auto_775283 ) ) ( not ( = ?auto_775281 ?auto_775284 ) ) ( not ( = ?auto_775281 ?auto_775285 ) ) ( not ( = ?auto_775281 ?auto_775286 ) ) ( not ( = ?auto_775281 ?auto_775287 ) ) ( not ( = ?auto_775281 ?auto_775288 ) ) ( not ( = ?auto_775282 ?auto_775283 ) ) ( not ( = ?auto_775282 ?auto_775284 ) ) ( not ( = ?auto_775282 ?auto_775285 ) ) ( not ( = ?auto_775282 ?auto_775286 ) ) ( not ( = ?auto_775282 ?auto_775287 ) ) ( not ( = ?auto_775282 ?auto_775288 ) ) ( not ( = ?auto_775283 ?auto_775284 ) ) ( not ( = ?auto_775283 ?auto_775285 ) ) ( not ( = ?auto_775283 ?auto_775286 ) ) ( not ( = ?auto_775283 ?auto_775287 ) ) ( not ( = ?auto_775283 ?auto_775288 ) ) ( not ( = ?auto_775284 ?auto_775285 ) ) ( not ( = ?auto_775284 ?auto_775286 ) ) ( not ( = ?auto_775284 ?auto_775287 ) ) ( not ( = ?auto_775284 ?auto_775288 ) ) ( not ( = ?auto_775285 ?auto_775286 ) ) ( not ( = ?auto_775285 ?auto_775287 ) ) ( not ( = ?auto_775285 ?auto_775288 ) ) ( not ( = ?auto_775286 ?auto_775287 ) ) ( not ( = ?auto_775286 ?auto_775288 ) ) ( not ( = ?auto_775287 ?auto_775288 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_775287 ?auto_775288 )
      ( !STACK ?auto_775287 ?auto_775286 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_775311 - BLOCK
      ?auto_775312 - BLOCK
      ?auto_775313 - BLOCK
      ?auto_775314 - BLOCK
      ?auto_775315 - BLOCK
      ?auto_775316 - BLOCK
      ?auto_775317 - BLOCK
    )
    :vars
    (
      ?auto_775318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775317 ?auto_775318 ) ( ON-TABLE ?auto_775311 ) ( ON ?auto_775312 ?auto_775311 ) ( ON ?auto_775313 ?auto_775312 ) ( ON ?auto_775314 ?auto_775313 ) ( ON ?auto_775315 ?auto_775314 ) ( not ( = ?auto_775311 ?auto_775312 ) ) ( not ( = ?auto_775311 ?auto_775313 ) ) ( not ( = ?auto_775311 ?auto_775314 ) ) ( not ( = ?auto_775311 ?auto_775315 ) ) ( not ( = ?auto_775311 ?auto_775316 ) ) ( not ( = ?auto_775311 ?auto_775317 ) ) ( not ( = ?auto_775311 ?auto_775318 ) ) ( not ( = ?auto_775312 ?auto_775313 ) ) ( not ( = ?auto_775312 ?auto_775314 ) ) ( not ( = ?auto_775312 ?auto_775315 ) ) ( not ( = ?auto_775312 ?auto_775316 ) ) ( not ( = ?auto_775312 ?auto_775317 ) ) ( not ( = ?auto_775312 ?auto_775318 ) ) ( not ( = ?auto_775313 ?auto_775314 ) ) ( not ( = ?auto_775313 ?auto_775315 ) ) ( not ( = ?auto_775313 ?auto_775316 ) ) ( not ( = ?auto_775313 ?auto_775317 ) ) ( not ( = ?auto_775313 ?auto_775318 ) ) ( not ( = ?auto_775314 ?auto_775315 ) ) ( not ( = ?auto_775314 ?auto_775316 ) ) ( not ( = ?auto_775314 ?auto_775317 ) ) ( not ( = ?auto_775314 ?auto_775318 ) ) ( not ( = ?auto_775315 ?auto_775316 ) ) ( not ( = ?auto_775315 ?auto_775317 ) ) ( not ( = ?auto_775315 ?auto_775318 ) ) ( not ( = ?auto_775316 ?auto_775317 ) ) ( not ( = ?auto_775316 ?auto_775318 ) ) ( not ( = ?auto_775317 ?auto_775318 ) ) ( CLEAR ?auto_775315 ) ( ON ?auto_775316 ?auto_775317 ) ( CLEAR ?auto_775316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_775311 ?auto_775312 ?auto_775313 ?auto_775314 ?auto_775315 ?auto_775316 )
      ( MAKE-7PILE ?auto_775311 ?auto_775312 ?auto_775313 ?auto_775314 ?auto_775315 ?auto_775316 ?auto_775317 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_775341 - BLOCK
      ?auto_775342 - BLOCK
      ?auto_775343 - BLOCK
      ?auto_775344 - BLOCK
      ?auto_775345 - BLOCK
      ?auto_775346 - BLOCK
      ?auto_775347 - BLOCK
    )
    :vars
    (
      ?auto_775348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775347 ?auto_775348 ) ( ON-TABLE ?auto_775341 ) ( ON ?auto_775342 ?auto_775341 ) ( ON ?auto_775343 ?auto_775342 ) ( ON ?auto_775344 ?auto_775343 ) ( not ( = ?auto_775341 ?auto_775342 ) ) ( not ( = ?auto_775341 ?auto_775343 ) ) ( not ( = ?auto_775341 ?auto_775344 ) ) ( not ( = ?auto_775341 ?auto_775345 ) ) ( not ( = ?auto_775341 ?auto_775346 ) ) ( not ( = ?auto_775341 ?auto_775347 ) ) ( not ( = ?auto_775341 ?auto_775348 ) ) ( not ( = ?auto_775342 ?auto_775343 ) ) ( not ( = ?auto_775342 ?auto_775344 ) ) ( not ( = ?auto_775342 ?auto_775345 ) ) ( not ( = ?auto_775342 ?auto_775346 ) ) ( not ( = ?auto_775342 ?auto_775347 ) ) ( not ( = ?auto_775342 ?auto_775348 ) ) ( not ( = ?auto_775343 ?auto_775344 ) ) ( not ( = ?auto_775343 ?auto_775345 ) ) ( not ( = ?auto_775343 ?auto_775346 ) ) ( not ( = ?auto_775343 ?auto_775347 ) ) ( not ( = ?auto_775343 ?auto_775348 ) ) ( not ( = ?auto_775344 ?auto_775345 ) ) ( not ( = ?auto_775344 ?auto_775346 ) ) ( not ( = ?auto_775344 ?auto_775347 ) ) ( not ( = ?auto_775344 ?auto_775348 ) ) ( not ( = ?auto_775345 ?auto_775346 ) ) ( not ( = ?auto_775345 ?auto_775347 ) ) ( not ( = ?auto_775345 ?auto_775348 ) ) ( not ( = ?auto_775346 ?auto_775347 ) ) ( not ( = ?auto_775346 ?auto_775348 ) ) ( not ( = ?auto_775347 ?auto_775348 ) ) ( ON ?auto_775346 ?auto_775347 ) ( CLEAR ?auto_775344 ) ( ON ?auto_775345 ?auto_775346 ) ( CLEAR ?auto_775345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_775341 ?auto_775342 ?auto_775343 ?auto_775344 ?auto_775345 )
      ( MAKE-7PILE ?auto_775341 ?auto_775342 ?auto_775343 ?auto_775344 ?auto_775345 ?auto_775346 ?auto_775347 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_775371 - BLOCK
      ?auto_775372 - BLOCK
      ?auto_775373 - BLOCK
      ?auto_775374 - BLOCK
      ?auto_775375 - BLOCK
      ?auto_775376 - BLOCK
      ?auto_775377 - BLOCK
    )
    :vars
    (
      ?auto_775378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775377 ?auto_775378 ) ( ON-TABLE ?auto_775371 ) ( ON ?auto_775372 ?auto_775371 ) ( ON ?auto_775373 ?auto_775372 ) ( not ( = ?auto_775371 ?auto_775372 ) ) ( not ( = ?auto_775371 ?auto_775373 ) ) ( not ( = ?auto_775371 ?auto_775374 ) ) ( not ( = ?auto_775371 ?auto_775375 ) ) ( not ( = ?auto_775371 ?auto_775376 ) ) ( not ( = ?auto_775371 ?auto_775377 ) ) ( not ( = ?auto_775371 ?auto_775378 ) ) ( not ( = ?auto_775372 ?auto_775373 ) ) ( not ( = ?auto_775372 ?auto_775374 ) ) ( not ( = ?auto_775372 ?auto_775375 ) ) ( not ( = ?auto_775372 ?auto_775376 ) ) ( not ( = ?auto_775372 ?auto_775377 ) ) ( not ( = ?auto_775372 ?auto_775378 ) ) ( not ( = ?auto_775373 ?auto_775374 ) ) ( not ( = ?auto_775373 ?auto_775375 ) ) ( not ( = ?auto_775373 ?auto_775376 ) ) ( not ( = ?auto_775373 ?auto_775377 ) ) ( not ( = ?auto_775373 ?auto_775378 ) ) ( not ( = ?auto_775374 ?auto_775375 ) ) ( not ( = ?auto_775374 ?auto_775376 ) ) ( not ( = ?auto_775374 ?auto_775377 ) ) ( not ( = ?auto_775374 ?auto_775378 ) ) ( not ( = ?auto_775375 ?auto_775376 ) ) ( not ( = ?auto_775375 ?auto_775377 ) ) ( not ( = ?auto_775375 ?auto_775378 ) ) ( not ( = ?auto_775376 ?auto_775377 ) ) ( not ( = ?auto_775376 ?auto_775378 ) ) ( not ( = ?auto_775377 ?auto_775378 ) ) ( ON ?auto_775376 ?auto_775377 ) ( ON ?auto_775375 ?auto_775376 ) ( CLEAR ?auto_775373 ) ( ON ?auto_775374 ?auto_775375 ) ( CLEAR ?auto_775374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_775371 ?auto_775372 ?auto_775373 ?auto_775374 )
      ( MAKE-7PILE ?auto_775371 ?auto_775372 ?auto_775373 ?auto_775374 ?auto_775375 ?auto_775376 ?auto_775377 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_775401 - BLOCK
      ?auto_775402 - BLOCK
      ?auto_775403 - BLOCK
      ?auto_775404 - BLOCK
      ?auto_775405 - BLOCK
      ?auto_775406 - BLOCK
      ?auto_775407 - BLOCK
    )
    :vars
    (
      ?auto_775408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775407 ?auto_775408 ) ( ON-TABLE ?auto_775401 ) ( ON ?auto_775402 ?auto_775401 ) ( not ( = ?auto_775401 ?auto_775402 ) ) ( not ( = ?auto_775401 ?auto_775403 ) ) ( not ( = ?auto_775401 ?auto_775404 ) ) ( not ( = ?auto_775401 ?auto_775405 ) ) ( not ( = ?auto_775401 ?auto_775406 ) ) ( not ( = ?auto_775401 ?auto_775407 ) ) ( not ( = ?auto_775401 ?auto_775408 ) ) ( not ( = ?auto_775402 ?auto_775403 ) ) ( not ( = ?auto_775402 ?auto_775404 ) ) ( not ( = ?auto_775402 ?auto_775405 ) ) ( not ( = ?auto_775402 ?auto_775406 ) ) ( not ( = ?auto_775402 ?auto_775407 ) ) ( not ( = ?auto_775402 ?auto_775408 ) ) ( not ( = ?auto_775403 ?auto_775404 ) ) ( not ( = ?auto_775403 ?auto_775405 ) ) ( not ( = ?auto_775403 ?auto_775406 ) ) ( not ( = ?auto_775403 ?auto_775407 ) ) ( not ( = ?auto_775403 ?auto_775408 ) ) ( not ( = ?auto_775404 ?auto_775405 ) ) ( not ( = ?auto_775404 ?auto_775406 ) ) ( not ( = ?auto_775404 ?auto_775407 ) ) ( not ( = ?auto_775404 ?auto_775408 ) ) ( not ( = ?auto_775405 ?auto_775406 ) ) ( not ( = ?auto_775405 ?auto_775407 ) ) ( not ( = ?auto_775405 ?auto_775408 ) ) ( not ( = ?auto_775406 ?auto_775407 ) ) ( not ( = ?auto_775406 ?auto_775408 ) ) ( not ( = ?auto_775407 ?auto_775408 ) ) ( ON ?auto_775406 ?auto_775407 ) ( ON ?auto_775405 ?auto_775406 ) ( ON ?auto_775404 ?auto_775405 ) ( CLEAR ?auto_775402 ) ( ON ?auto_775403 ?auto_775404 ) ( CLEAR ?auto_775403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_775401 ?auto_775402 ?auto_775403 )
      ( MAKE-7PILE ?auto_775401 ?auto_775402 ?auto_775403 ?auto_775404 ?auto_775405 ?auto_775406 ?auto_775407 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_775431 - BLOCK
      ?auto_775432 - BLOCK
      ?auto_775433 - BLOCK
      ?auto_775434 - BLOCK
      ?auto_775435 - BLOCK
      ?auto_775436 - BLOCK
      ?auto_775437 - BLOCK
    )
    :vars
    (
      ?auto_775438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775437 ?auto_775438 ) ( ON-TABLE ?auto_775431 ) ( not ( = ?auto_775431 ?auto_775432 ) ) ( not ( = ?auto_775431 ?auto_775433 ) ) ( not ( = ?auto_775431 ?auto_775434 ) ) ( not ( = ?auto_775431 ?auto_775435 ) ) ( not ( = ?auto_775431 ?auto_775436 ) ) ( not ( = ?auto_775431 ?auto_775437 ) ) ( not ( = ?auto_775431 ?auto_775438 ) ) ( not ( = ?auto_775432 ?auto_775433 ) ) ( not ( = ?auto_775432 ?auto_775434 ) ) ( not ( = ?auto_775432 ?auto_775435 ) ) ( not ( = ?auto_775432 ?auto_775436 ) ) ( not ( = ?auto_775432 ?auto_775437 ) ) ( not ( = ?auto_775432 ?auto_775438 ) ) ( not ( = ?auto_775433 ?auto_775434 ) ) ( not ( = ?auto_775433 ?auto_775435 ) ) ( not ( = ?auto_775433 ?auto_775436 ) ) ( not ( = ?auto_775433 ?auto_775437 ) ) ( not ( = ?auto_775433 ?auto_775438 ) ) ( not ( = ?auto_775434 ?auto_775435 ) ) ( not ( = ?auto_775434 ?auto_775436 ) ) ( not ( = ?auto_775434 ?auto_775437 ) ) ( not ( = ?auto_775434 ?auto_775438 ) ) ( not ( = ?auto_775435 ?auto_775436 ) ) ( not ( = ?auto_775435 ?auto_775437 ) ) ( not ( = ?auto_775435 ?auto_775438 ) ) ( not ( = ?auto_775436 ?auto_775437 ) ) ( not ( = ?auto_775436 ?auto_775438 ) ) ( not ( = ?auto_775437 ?auto_775438 ) ) ( ON ?auto_775436 ?auto_775437 ) ( ON ?auto_775435 ?auto_775436 ) ( ON ?auto_775434 ?auto_775435 ) ( ON ?auto_775433 ?auto_775434 ) ( CLEAR ?auto_775431 ) ( ON ?auto_775432 ?auto_775433 ) ( CLEAR ?auto_775432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_775431 ?auto_775432 )
      ( MAKE-7PILE ?auto_775431 ?auto_775432 ?auto_775433 ?auto_775434 ?auto_775435 ?auto_775436 ?auto_775437 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_775461 - BLOCK
      ?auto_775462 - BLOCK
      ?auto_775463 - BLOCK
      ?auto_775464 - BLOCK
      ?auto_775465 - BLOCK
      ?auto_775466 - BLOCK
      ?auto_775467 - BLOCK
    )
    :vars
    (
      ?auto_775468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775467 ?auto_775468 ) ( not ( = ?auto_775461 ?auto_775462 ) ) ( not ( = ?auto_775461 ?auto_775463 ) ) ( not ( = ?auto_775461 ?auto_775464 ) ) ( not ( = ?auto_775461 ?auto_775465 ) ) ( not ( = ?auto_775461 ?auto_775466 ) ) ( not ( = ?auto_775461 ?auto_775467 ) ) ( not ( = ?auto_775461 ?auto_775468 ) ) ( not ( = ?auto_775462 ?auto_775463 ) ) ( not ( = ?auto_775462 ?auto_775464 ) ) ( not ( = ?auto_775462 ?auto_775465 ) ) ( not ( = ?auto_775462 ?auto_775466 ) ) ( not ( = ?auto_775462 ?auto_775467 ) ) ( not ( = ?auto_775462 ?auto_775468 ) ) ( not ( = ?auto_775463 ?auto_775464 ) ) ( not ( = ?auto_775463 ?auto_775465 ) ) ( not ( = ?auto_775463 ?auto_775466 ) ) ( not ( = ?auto_775463 ?auto_775467 ) ) ( not ( = ?auto_775463 ?auto_775468 ) ) ( not ( = ?auto_775464 ?auto_775465 ) ) ( not ( = ?auto_775464 ?auto_775466 ) ) ( not ( = ?auto_775464 ?auto_775467 ) ) ( not ( = ?auto_775464 ?auto_775468 ) ) ( not ( = ?auto_775465 ?auto_775466 ) ) ( not ( = ?auto_775465 ?auto_775467 ) ) ( not ( = ?auto_775465 ?auto_775468 ) ) ( not ( = ?auto_775466 ?auto_775467 ) ) ( not ( = ?auto_775466 ?auto_775468 ) ) ( not ( = ?auto_775467 ?auto_775468 ) ) ( ON ?auto_775466 ?auto_775467 ) ( ON ?auto_775465 ?auto_775466 ) ( ON ?auto_775464 ?auto_775465 ) ( ON ?auto_775463 ?auto_775464 ) ( ON ?auto_775462 ?auto_775463 ) ( ON ?auto_775461 ?auto_775462 ) ( CLEAR ?auto_775461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_775461 )
      ( MAKE-7PILE ?auto_775461 ?auto_775462 ?auto_775463 ?auto_775464 ?auto_775465 ?auto_775466 ?auto_775467 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_775492 - BLOCK
      ?auto_775493 - BLOCK
      ?auto_775494 - BLOCK
      ?auto_775495 - BLOCK
      ?auto_775496 - BLOCK
      ?auto_775497 - BLOCK
      ?auto_775498 - BLOCK
      ?auto_775499 - BLOCK
    )
    :vars
    (
      ?auto_775500 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_775498 ) ( ON ?auto_775499 ?auto_775500 ) ( CLEAR ?auto_775499 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_775492 ) ( ON ?auto_775493 ?auto_775492 ) ( ON ?auto_775494 ?auto_775493 ) ( ON ?auto_775495 ?auto_775494 ) ( ON ?auto_775496 ?auto_775495 ) ( ON ?auto_775497 ?auto_775496 ) ( ON ?auto_775498 ?auto_775497 ) ( not ( = ?auto_775492 ?auto_775493 ) ) ( not ( = ?auto_775492 ?auto_775494 ) ) ( not ( = ?auto_775492 ?auto_775495 ) ) ( not ( = ?auto_775492 ?auto_775496 ) ) ( not ( = ?auto_775492 ?auto_775497 ) ) ( not ( = ?auto_775492 ?auto_775498 ) ) ( not ( = ?auto_775492 ?auto_775499 ) ) ( not ( = ?auto_775492 ?auto_775500 ) ) ( not ( = ?auto_775493 ?auto_775494 ) ) ( not ( = ?auto_775493 ?auto_775495 ) ) ( not ( = ?auto_775493 ?auto_775496 ) ) ( not ( = ?auto_775493 ?auto_775497 ) ) ( not ( = ?auto_775493 ?auto_775498 ) ) ( not ( = ?auto_775493 ?auto_775499 ) ) ( not ( = ?auto_775493 ?auto_775500 ) ) ( not ( = ?auto_775494 ?auto_775495 ) ) ( not ( = ?auto_775494 ?auto_775496 ) ) ( not ( = ?auto_775494 ?auto_775497 ) ) ( not ( = ?auto_775494 ?auto_775498 ) ) ( not ( = ?auto_775494 ?auto_775499 ) ) ( not ( = ?auto_775494 ?auto_775500 ) ) ( not ( = ?auto_775495 ?auto_775496 ) ) ( not ( = ?auto_775495 ?auto_775497 ) ) ( not ( = ?auto_775495 ?auto_775498 ) ) ( not ( = ?auto_775495 ?auto_775499 ) ) ( not ( = ?auto_775495 ?auto_775500 ) ) ( not ( = ?auto_775496 ?auto_775497 ) ) ( not ( = ?auto_775496 ?auto_775498 ) ) ( not ( = ?auto_775496 ?auto_775499 ) ) ( not ( = ?auto_775496 ?auto_775500 ) ) ( not ( = ?auto_775497 ?auto_775498 ) ) ( not ( = ?auto_775497 ?auto_775499 ) ) ( not ( = ?auto_775497 ?auto_775500 ) ) ( not ( = ?auto_775498 ?auto_775499 ) ) ( not ( = ?auto_775498 ?auto_775500 ) ) ( not ( = ?auto_775499 ?auto_775500 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_775499 ?auto_775500 )
      ( !STACK ?auto_775499 ?auto_775498 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_775526 - BLOCK
      ?auto_775527 - BLOCK
      ?auto_775528 - BLOCK
      ?auto_775529 - BLOCK
      ?auto_775530 - BLOCK
      ?auto_775531 - BLOCK
      ?auto_775532 - BLOCK
      ?auto_775533 - BLOCK
    )
    :vars
    (
      ?auto_775534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775533 ?auto_775534 ) ( ON-TABLE ?auto_775526 ) ( ON ?auto_775527 ?auto_775526 ) ( ON ?auto_775528 ?auto_775527 ) ( ON ?auto_775529 ?auto_775528 ) ( ON ?auto_775530 ?auto_775529 ) ( ON ?auto_775531 ?auto_775530 ) ( not ( = ?auto_775526 ?auto_775527 ) ) ( not ( = ?auto_775526 ?auto_775528 ) ) ( not ( = ?auto_775526 ?auto_775529 ) ) ( not ( = ?auto_775526 ?auto_775530 ) ) ( not ( = ?auto_775526 ?auto_775531 ) ) ( not ( = ?auto_775526 ?auto_775532 ) ) ( not ( = ?auto_775526 ?auto_775533 ) ) ( not ( = ?auto_775526 ?auto_775534 ) ) ( not ( = ?auto_775527 ?auto_775528 ) ) ( not ( = ?auto_775527 ?auto_775529 ) ) ( not ( = ?auto_775527 ?auto_775530 ) ) ( not ( = ?auto_775527 ?auto_775531 ) ) ( not ( = ?auto_775527 ?auto_775532 ) ) ( not ( = ?auto_775527 ?auto_775533 ) ) ( not ( = ?auto_775527 ?auto_775534 ) ) ( not ( = ?auto_775528 ?auto_775529 ) ) ( not ( = ?auto_775528 ?auto_775530 ) ) ( not ( = ?auto_775528 ?auto_775531 ) ) ( not ( = ?auto_775528 ?auto_775532 ) ) ( not ( = ?auto_775528 ?auto_775533 ) ) ( not ( = ?auto_775528 ?auto_775534 ) ) ( not ( = ?auto_775529 ?auto_775530 ) ) ( not ( = ?auto_775529 ?auto_775531 ) ) ( not ( = ?auto_775529 ?auto_775532 ) ) ( not ( = ?auto_775529 ?auto_775533 ) ) ( not ( = ?auto_775529 ?auto_775534 ) ) ( not ( = ?auto_775530 ?auto_775531 ) ) ( not ( = ?auto_775530 ?auto_775532 ) ) ( not ( = ?auto_775530 ?auto_775533 ) ) ( not ( = ?auto_775530 ?auto_775534 ) ) ( not ( = ?auto_775531 ?auto_775532 ) ) ( not ( = ?auto_775531 ?auto_775533 ) ) ( not ( = ?auto_775531 ?auto_775534 ) ) ( not ( = ?auto_775532 ?auto_775533 ) ) ( not ( = ?auto_775532 ?auto_775534 ) ) ( not ( = ?auto_775533 ?auto_775534 ) ) ( CLEAR ?auto_775531 ) ( ON ?auto_775532 ?auto_775533 ) ( CLEAR ?auto_775532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_775526 ?auto_775527 ?auto_775528 ?auto_775529 ?auto_775530 ?auto_775531 ?auto_775532 )
      ( MAKE-8PILE ?auto_775526 ?auto_775527 ?auto_775528 ?auto_775529 ?auto_775530 ?auto_775531 ?auto_775532 ?auto_775533 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_775560 - BLOCK
      ?auto_775561 - BLOCK
      ?auto_775562 - BLOCK
      ?auto_775563 - BLOCK
      ?auto_775564 - BLOCK
      ?auto_775565 - BLOCK
      ?auto_775566 - BLOCK
      ?auto_775567 - BLOCK
    )
    :vars
    (
      ?auto_775568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775567 ?auto_775568 ) ( ON-TABLE ?auto_775560 ) ( ON ?auto_775561 ?auto_775560 ) ( ON ?auto_775562 ?auto_775561 ) ( ON ?auto_775563 ?auto_775562 ) ( ON ?auto_775564 ?auto_775563 ) ( not ( = ?auto_775560 ?auto_775561 ) ) ( not ( = ?auto_775560 ?auto_775562 ) ) ( not ( = ?auto_775560 ?auto_775563 ) ) ( not ( = ?auto_775560 ?auto_775564 ) ) ( not ( = ?auto_775560 ?auto_775565 ) ) ( not ( = ?auto_775560 ?auto_775566 ) ) ( not ( = ?auto_775560 ?auto_775567 ) ) ( not ( = ?auto_775560 ?auto_775568 ) ) ( not ( = ?auto_775561 ?auto_775562 ) ) ( not ( = ?auto_775561 ?auto_775563 ) ) ( not ( = ?auto_775561 ?auto_775564 ) ) ( not ( = ?auto_775561 ?auto_775565 ) ) ( not ( = ?auto_775561 ?auto_775566 ) ) ( not ( = ?auto_775561 ?auto_775567 ) ) ( not ( = ?auto_775561 ?auto_775568 ) ) ( not ( = ?auto_775562 ?auto_775563 ) ) ( not ( = ?auto_775562 ?auto_775564 ) ) ( not ( = ?auto_775562 ?auto_775565 ) ) ( not ( = ?auto_775562 ?auto_775566 ) ) ( not ( = ?auto_775562 ?auto_775567 ) ) ( not ( = ?auto_775562 ?auto_775568 ) ) ( not ( = ?auto_775563 ?auto_775564 ) ) ( not ( = ?auto_775563 ?auto_775565 ) ) ( not ( = ?auto_775563 ?auto_775566 ) ) ( not ( = ?auto_775563 ?auto_775567 ) ) ( not ( = ?auto_775563 ?auto_775568 ) ) ( not ( = ?auto_775564 ?auto_775565 ) ) ( not ( = ?auto_775564 ?auto_775566 ) ) ( not ( = ?auto_775564 ?auto_775567 ) ) ( not ( = ?auto_775564 ?auto_775568 ) ) ( not ( = ?auto_775565 ?auto_775566 ) ) ( not ( = ?auto_775565 ?auto_775567 ) ) ( not ( = ?auto_775565 ?auto_775568 ) ) ( not ( = ?auto_775566 ?auto_775567 ) ) ( not ( = ?auto_775566 ?auto_775568 ) ) ( not ( = ?auto_775567 ?auto_775568 ) ) ( ON ?auto_775566 ?auto_775567 ) ( CLEAR ?auto_775564 ) ( ON ?auto_775565 ?auto_775566 ) ( CLEAR ?auto_775565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_775560 ?auto_775561 ?auto_775562 ?auto_775563 ?auto_775564 ?auto_775565 )
      ( MAKE-8PILE ?auto_775560 ?auto_775561 ?auto_775562 ?auto_775563 ?auto_775564 ?auto_775565 ?auto_775566 ?auto_775567 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_775594 - BLOCK
      ?auto_775595 - BLOCK
      ?auto_775596 - BLOCK
      ?auto_775597 - BLOCK
      ?auto_775598 - BLOCK
      ?auto_775599 - BLOCK
      ?auto_775600 - BLOCK
      ?auto_775601 - BLOCK
    )
    :vars
    (
      ?auto_775602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775601 ?auto_775602 ) ( ON-TABLE ?auto_775594 ) ( ON ?auto_775595 ?auto_775594 ) ( ON ?auto_775596 ?auto_775595 ) ( ON ?auto_775597 ?auto_775596 ) ( not ( = ?auto_775594 ?auto_775595 ) ) ( not ( = ?auto_775594 ?auto_775596 ) ) ( not ( = ?auto_775594 ?auto_775597 ) ) ( not ( = ?auto_775594 ?auto_775598 ) ) ( not ( = ?auto_775594 ?auto_775599 ) ) ( not ( = ?auto_775594 ?auto_775600 ) ) ( not ( = ?auto_775594 ?auto_775601 ) ) ( not ( = ?auto_775594 ?auto_775602 ) ) ( not ( = ?auto_775595 ?auto_775596 ) ) ( not ( = ?auto_775595 ?auto_775597 ) ) ( not ( = ?auto_775595 ?auto_775598 ) ) ( not ( = ?auto_775595 ?auto_775599 ) ) ( not ( = ?auto_775595 ?auto_775600 ) ) ( not ( = ?auto_775595 ?auto_775601 ) ) ( not ( = ?auto_775595 ?auto_775602 ) ) ( not ( = ?auto_775596 ?auto_775597 ) ) ( not ( = ?auto_775596 ?auto_775598 ) ) ( not ( = ?auto_775596 ?auto_775599 ) ) ( not ( = ?auto_775596 ?auto_775600 ) ) ( not ( = ?auto_775596 ?auto_775601 ) ) ( not ( = ?auto_775596 ?auto_775602 ) ) ( not ( = ?auto_775597 ?auto_775598 ) ) ( not ( = ?auto_775597 ?auto_775599 ) ) ( not ( = ?auto_775597 ?auto_775600 ) ) ( not ( = ?auto_775597 ?auto_775601 ) ) ( not ( = ?auto_775597 ?auto_775602 ) ) ( not ( = ?auto_775598 ?auto_775599 ) ) ( not ( = ?auto_775598 ?auto_775600 ) ) ( not ( = ?auto_775598 ?auto_775601 ) ) ( not ( = ?auto_775598 ?auto_775602 ) ) ( not ( = ?auto_775599 ?auto_775600 ) ) ( not ( = ?auto_775599 ?auto_775601 ) ) ( not ( = ?auto_775599 ?auto_775602 ) ) ( not ( = ?auto_775600 ?auto_775601 ) ) ( not ( = ?auto_775600 ?auto_775602 ) ) ( not ( = ?auto_775601 ?auto_775602 ) ) ( ON ?auto_775600 ?auto_775601 ) ( ON ?auto_775599 ?auto_775600 ) ( CLEAR ?auto_775597 ) ( ON ?auto_775598 ?auto_775599 ) ( CLEAR ?auto_775598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_775594 ?auto_775595 ?auto_775596 ?auto_775597 ?auto_775598 )
      ( MAKE-8PILE ?auto_775594 ?auto_775595 ?auto_775596 ?auto_775597 ?auto_775598 ?auto_775599 ?auto_775600 ?auto_775601 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_775628 - BLOCK
      ?auto_775629 - BLOCK
      ?auto_775630 - BLOCK
      ?auto_775631 - BLOCK
      ?auto_775632 - BLOCK
      ?auto_775633 - BLOCK
      ?auto_775634 - BLOCK
      ?auto_775635 - BLOCK
    )
    :vars
    (
      ?auto_775636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775635 ?auto_775636 ) ( ON-TABLE ?auto_775628 ) ( ON ?auto_775629 ?auto_775628 ) ( ON ?auto_775630 ?auto_775629 ) ( not ( = ?auto_775628 ?auto_775629 ) ) ( not ( = ?auto_775628 ?auto_775630 ) ) ( not ( = ?auto_775628 ?auto_775631 ) ) ( not ( = ?auto_775628 ?auto_775632 ) ) ( not ( = ?auto_775628 ?auto_775633 ) ) ( not ( = ?auto_775628 ?auto_775634 ) ) ( not ( = ?auto_775628 ?auto_775635 ) ) ( not ( = ?auto_775628 ?auto_775636 ) ) ( not ( = ?auto_775629 ?auto_775630 ) ) ( not ( = ?auto_775629 ?auto_775631 ) ) ( not ( = ?auto_775629 ?auto_775632 ) ) ( not ( = ?auto_775629 ?auto_775633 ) ) ( not ( = ?auto_775629 ?auto_775634 ) ) ( not ( = ?auto_775629 ?auto_775635 ) ) ( not ( = ?auto_775629 ?auto_775636 ) ) ( not ( = ?auto_775630 ?auto_775631 ) ) ( not ( = ?auto_775630 ?auto_775632 ) ) ( not ( = ?auto_775630 ?auto_775633 ) ) ( not ( = ?auto_775630 ?auto_775634 ) ) ( not ( = ?auto_775630 ?auto_775635 ) ) ( not ( = ?auto_775630 ?auto_775636 ) ) ( not ( = ?auto_775631 ?auto_775632 ) ) ( not ( = ?auto_775631 ?auto_775633 ) ) ( not ( = ?auto_775631 ?auto_775634 ) ) ( not ( = ?auto_775631 ?auto_775635 ) ) ( not ( = ?auto_775631 ?auto_775636 ) ) ( not ( = ?auto_775632 ?auto_775633 ) ) ( not ( = ?auto_775632 ?auto_775634 ) ) ( not ( = ?auto_775632 ?auto_775635 ) ) ( not ( = ?auto_775632 ?auto_775636 ) ) ( not ( = ?auto_775633 ?auto_775634 ) ) ( not ( = ?auto_775633 ?auto_775635 ) ) ( not ( = ?auto_775633 ?auto_775636 ) ) ( not ( = ?auto_775634 ?auto_775635 ) ) ( not ( = ?auto_775634 ?auto_775636 ) ) ( not ( = ?auto_775635 ?auto_775636 ) ) ( ON ?auto_775634 ?auto_775635 ) ( ON ?auto_775633 ?auto_775634 ) ( ON ?auto_775632 ?auto_775633 ) ( CLEAR ?auto_775630 ) ( ON ?auto_775631 ?auto_775632 ) ( CLEAR ?auto_775631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_775628 ?auto_775629 ?auto_775630 ?auto_775631 )
      ( MAKE-8PILE ?auto_775628 ?auto_775629 ?auto_775630 ?auto_775631 ?auto_775632 ?auto_775633 ?auto_775634 ?auto_775635 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_775662 - BLOCK
      ?auto_775663 - BLOCK
      ?auto_775664 - BLOCK
      ?auto_775665 - BLOCK
      ?auto_775666 - BLOCK
      ?auto_775667 - BLOCK
      ?auto_775668 - BLOCK
      ?auto_775669 - BLOCK
    )
    :vars
    (
      ?auto_775670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775669 ?auto_775670 ) ( ON-TABLE ?auto_775662 ) ( ON ?auto_775663 ?auto_775662 ) ( not ( = ?auto_775662 ?auto_775663 ) ) ( not ( = ?auto_775662 ?auto_775664 ) ) ( not ( = ?auto_775662 ?auto_775665 ) ) ( not ( = ?auto_775662 ?auto_775666 ) ) ( not ( = ?auto_775662 ?auto_775667 ) ) ( not ( = ?auto_775662 ?auto_775668 ) ) ( not ( = ?auto_775662 ?auto_775669 ) ) ( not ( = ?auto_775662 ?auto_775670 ) ) ( not ( = ?auto_775663 ?auto_775664 ) ) ( not ( = ?auto_775663 ?auto_775665 ) ) ( not ( = ?auto_775663 ?auto_775666 ) ) ( not ( = ?auto_775663 ?auto_775667 ) ) ( not ( = ?auto_775663 ?auto_775668 ) ) ( not ( = ?auto_775663 ?auto_775669 ) ) ( not ( = ?auto_775663 ?auto_775670 ) ) ( not ( = ?auto_775664 ?auto_775665 ) ) ( not ( = ?auto_775664 ?auto_775666 ) ) ( not ( = ?auto_775664 ?auto_775667 ) ) ( not ( = ?auto_775664 ?auto_775668 ) ) ( not ( = ?auto_775664 ?auto_775669 ) ) ( not ( = ?auto_775664 ?auto_775670 ) ) ( not ( = ?auto_775665 ?auto_775666 ) ) ( not ( = ?auto_775665 ?auto_775667 ) ) ( not ( = ?auto_775665 ?auto_775668 ) ) ( not ( = ?auto_775665 ?auto_775669 ) ) ( not ( = ?auto_775665 ?auto_775670 ) ) ( not ( = ?auto_775666 ?auto_775667 ) ) ( not ( = ?auto_775666 ?auto_775668 ) ) ( not ( = ?auto_775666 ?auto_775669 ) ) ( not ( = ?auto_775666 ?auto_775670 ) ) ( not ( = ?auto_775667 ?auto_775668 ) ) ( not ( = ?auto_775667 ?auto_775669 ) ) ( not ( = ?auto_775667 ?auto_775670 ) ) ( not ( = ?auto_775668 ?auto_775669 ) ) ( not ( = ?auto_775668 ?auto_775670 ) ) ( not ( = ?auto_775669 ?auto_775670 ) ) ( ON ?auto_775668 ?auto_775669 ) ( ON ?auto_775667 ?auto_775668 ) ( ON ?auto_775666 ?auto_775667 ) ( ON ?auto_775665 ?auto_775666 ) ( CLEAR ?auto_775663 ) ( ON ?auto_775664 ?auto_775665 ) ( CLEAR ?auto_775664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_775662 ?auto_775663 ?auto_775664 )
      ( MAKE-8PILE ?auto_775662 ?auto_775663 ?auto_775664 ?auto_775665 ?auto_775666 ?auto_775667 ?auto_775668 ?auto_775669 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_775696 - BLOCK
      ?auto_775697 - BLOCK
      ?auto_775698 - BLOCK
      ?auto_775699 - BLOCK
      ?auto_775700 - BLOCK
      ?auto_775701 - BLOCK
      ?auto_775702 - BLOCK
      ?auto_775703 - BLOCK
    )
    :vars
    (
      ?auto_775704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775703 ?auto_775704 ) ( ON-TABLE ?auto_775696 ) ( not ( = ?auto_775696 ?auto_775697 ) ) ( not ( = ?auto_775696 ?auto_775698 ) ) ( not ( = ?auto_775696 ?auto_775699 ) ) ( not ( = ?auto_775696 ?auto_775700 ) ) ( not ( = ?auto_775696 ?auto_775701 ) ) ( not ( = ?auto_775696 ?auto_775702 ) ) ( not ( = ?auto_775696 ?auto_775703 ) ) ( not ( = ?auto_775696 ?auto_775704 ) ) ( not ( = ?auto_775697 ?auto_775698 ) ) ( not ( = ?auto_775697 ?auto_775699 ) ) ( not ( = ?auto_775697 ?auto_775700 ) ) ( not ( = ?auto_775697 ?auto_775701 ) ) ( not ( = ?auto_775697 ?auto_775702 ) ) ( not ( = ?auto_775697 ?auto_775703 ) ) ( not ( = ?auto_775697 ?auto_775704 ) ) ( not ( = ?auto_775698 ?auto_775699 ) ) ( not ( = ?auto_775698 ?auto_775700 ) ) ( not ( = ?auto_775698 ?auto_775701 ) ) ( not ( = ?auto_775698 ?auto_775702 ) ) ( not ( = ?auto_775698 ?auto_775703 ) ) ( not ( = ?auto_775698 ?auto_775704 ) ) ( not ( = ?auto_775699 ?auto_775700 ) ) ( not ( = ?auto_775699 ?auto_775701 ) ) ( not ( = ?auto_775699 ?auto_775702 ) ) ( not ( = ?auto_775699 ?auto_775703 ) ) ( not ( = ?auto_775699 ?auto_775704 ) ) ( not ( = ?auto_775700 ?auto_775701 ) ) ( not ( = ?auto_775700 ?auto_775702 ) ) ( not ( = ?auto_775700 ?auto_775703 ) ) ( not ( = ?auto_775700 ?auto_775704 ) ) ( not ( = ?auto_775701 ?auto_775702 ) ) ( not ( = ?auto_775701 ?auto_775703 ) ) ( not ( = ?auto_775701 ?auto_775704 ) ) ( not ( = ?auto_775702 ?auto_775703 ) ) ( not ( = ?auto_775702 ?auto_775704 ) ) ( not ( = ?auto_775703 ?auto_775704 ) ) ( ON ?auto_775702 ?auto_775703 ) ( ON ?auto_775701 ?auto_775702 ) ( ON ?auto_775700 ?auto_775701 ) ( ON ?auto_775699 ?auto_775700 ) ( ON ?auto_775698 ?auto_775699 ) ( CLEAR ?auto_775696 ) ( ON ?auto_775697 ?auto_775698 ) ( CLEAR ?auto_775697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_775696 ?auto_775697 )
      ( MAKE-8PILE ?auto_775696 ?auto_775697 ?auto_775698 ?auto_775699 ?auto_775700 ?auto_775701 ?auto_775702 ?auto_775703 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_775730 - BLOCK
      ?auto_775731 - BLOCK
      ?auto_775732 - BLOCK
      ?auto_775733 - BLOCK
      ?auto_775734 - BLOCK
      ?auto_775735 - BLOCK
      ?auto_775736 - BLOCK
      ?auto_775737 - BLOCK
    )
    :vars
    (
      ?auto_775738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775737 ?auto_775738 ) ( not ( = ?auto_775730 ?auto_775731 ) ) ( not ( = ?auto_775730 ?auto_775732 ) ) ( not ( = ?auto_775730 ?auto_775733 ) ) ( not ( = ?auto_775730 ?auto_775734 ) ) ( not ( = ?auto_775730 ?auto_775735 ) ) ( not ( = ?auto_775730 ?auto_775736 ) ) ( not ( = ?auto_775730 ?auto_775737 ) ) ( not ( = ?auto_775730 ?auto_775738 ) ) ( not ( = ?auto_775731 ?auto_775732 ) ) ( not ( = ?auto_775731 ?auto_775733 ) ) ( not ( = ?auto_775731 ?auto_775734 ) ) ( not ( = ?auto_775731 ?auto_775735 ) ) ( not ( = ?auto_775731 ?auto_775736 ) ) ( not ( = ?auto_775731 ?auto_775737 ) ) ( not ( = ?auto_775731 ?auto_775738 ) ) ( not ( = ?auto_775732 ?auto_775733 ) ) ( not ( = ?auto_775732 ?auto_775734 ) ) ( not ( = ?auto_775732 ?auto_775735 ) ) ( not ( = ?auto_775732 ?auto_775736 ) ) ( not ( = ?auto_775732 ?auto_775737 ) ) ( not ( = ?auto_775732 ?auto_775738 ) ) ( not ( = ?auto_775733 ?auto_775734 ) ) ( not ( = ?auto_775733 ?auto_775735 ) ) ( not ( = ?auto_775733 ?auto_775736 ) ) ( not ( = ?auto_775733 ?auto_775737 ) ) ( not ( = ?auto_775733 ?auto_775738 ) ) ( not ( = ?auto_775734 ?auto_775735 ) ) ( not ( = ?auto_775734 ?auto_775736 ) ) ( not ( = ?auto_775734 ?auto_775737 ) ) ( not ( = ?auto_775734 ?auto_775738 ) ) ( not ( = ?auto_775735 ?auto_775736 ) ) ( not ( = ?auto_775735 ?auto_775737 ) ) ( not ( = ?auto_775735 ?auto_775738 ) ) ( not ( = ?auto_775736 ?auto_775737 ) ) ( not ( = ?auto_775736 ?auto_775738 ) ) ( not ( = ?auto_775737 ?auto_775738 ) ) ( ON ?auto_775736 ?auto_775737 ) ( ON ?auto_775735 ?auto_775736 ) ( ON ?auto_775734 ?auto_775735 ) ( ON ?auto_775733 ?auto_775734 ) ( ON ?auto_775732 ?auto_775733 ) ( ON ?auto_775731 ?auto_775732 ) ( ON ?auto_775730 ?auto_775731 ) ( CLEAR ?auto_775730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_775730 )
      ( MAKE-8PILE ?auto_775730 ?auto_775731 ?auto_775732 ?auto_775733 ?auto_775734 ?auto_775735 ?auto_775736 ?auto_775737 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_775765 - BLOCK
      ?auto_775766 - BLOCK
      ?auto_775767 - BLOCK
      ?auto_775768 - BLOCK
      ?auto_775769 - BLOCK
      ?auto_775770 - BLOCK
      ?auto_775771 - BLOCK
      ?auto_775772 - BLOCK
      ?auto_775773 - BLOCK
    )
    :vars
    (
      ?auto_775774 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_775772 ) ( ON ?auto_775773 ?auto_775774 ) ( CLEAR ?auto_775773 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_775765 ) ( ON ?auto_775766 ?auto_775765 ) ( ON ?auto_775767 ?auto_775766 ) ( ON ?auto_775768 ?auto_775767 ) ( ON ?auto_775769 ?auto_775768 ) ( ON ?auto_775770 ?auto_775769 ) ( ON ?auto_775771 ?auto_775770 ) ( ON ?auto_775772 ?auto_775771 ) ( not ( = ?auto_775765 ?auto_775766 ) ) ( not ( = ?auto_775765 ?auto_775767 ) ) ( not ( = ?auto_775765 ?auto_775768 ) ) ( not ( = ?auto_775765 ?auto_775769 ) ) ( not ( = ?auto_775765 ?auto_775770 ) ) ( not ( = ?auto_775765 ?auto_775771 ) ) ( not ( = ?auto_775765 ?auto_775772 ) ) ( not ( = ?auto_775765 ?auto_775773 ) ) ( not ( = ?auto_775765 ?auto_775774 ) ) ( not ( = ?auto_775766 ?auto_775767 ) ) ( not ( = ?auto_775766 ?auto_775768 ) ) ( not ( = ?auto_775766 ?auto_775769 ) ) ( not ( = ?auto_775766 ?auto_775770 ) ) ( not ( = ?auto_775766 ?auto_775771 ) ) ( not ( = ?auto_775766 ?auto_775772 ) ) ( not ( = ?auto_775766 ?auto_775773 ) ) ( not ( = ?auto_775766 ?auto_775774 ) ) ( not ( = ?auto_775767 ?auto_775768 ) ) ( not ( = ?auto_775767 ?auto_775769 ) ) ( not ( = ?auto_775767 ?auto_775770 ) ) ( not ( = ?auto_775767 ?auto_775771 ) ) ( not ( = ?auto_775767 ?auto_775772 ) ) ( not ( = ?auto_775767 ?auto_775773 ) ) ( not ( = ?auto_775767 ?auto_775774 ) ) ( not ( = ?auto_775768 ?auto_775769 ) ) ( not ( = ?auto_775768 ?auto_775770 ) ) ( not ( = ?auto_775768 ?auto_775771 ) ) ( not ( = ?auto_775768 ?auto_775772 ) ) ( not ( = ?auto_775768 ?auto_775773 ) ) ( not ( = ?auto_775768 ?auto_775774 ) ) ( not ( = ?auto_775769 ?auto_775770 ) ) ( not ( = ?auto_775769 ?auto_775771 ) ) ( not ( = ?auto_775769 ?auto_775772 ) ) ( not ( = ?auto_775769 ?auto_775773 ) ) ( not ( = ?auto_775769 ?auto_775774 ) ) ( not ( = ?auto_775770 ?auto_775771 ) ) ( not ( = ?auto_775770 ?auto_775772 ) ) ( not ( = ?auto_775770 ?auto_775773 ) ) ( not ( = ?auto_775770 ?auto_775774 ) ) ( not ( = ?auto_775771 ?auto_775772 ) ) ( not ( = ?auto_775771 ?auto_775773 ) ) ( not ( = ?auto_775771 ?auto_775774 ) ) ( not ( = ?auto_775772 ?auto_775773 ) ) ( not ( = ?auto_775772 ?auto_775774 ) ) ( not ( = ?auto_775773 ?auto_775774 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_775773 ?auto_775774 )
      ( !STACK ?auto_775773 ?auto_775772 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_775803 - BLOCK
      ?auto_775804 - BLOCK
      ?auto_775805 - BLOCK
      ?auto_775806 - BLOCK
      ?auto_775807 - BLOCK
      ?auto_775808 - BLOCK
      ?auto_775809 - BLOCK
      ?auto_775810 - BLOCK
      ?auto_775811 - BLOCK
    )
    :vars
    (
      ?auto_775812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775811 ?auto_775812 ) ( ON-TABLE ?auto_775803 ) ( ON ?auto_775804 ?auto_775803 ) ( ON ?auto_775805 ?auto_775804 ) ( ON ?auto_775806 ?auto_775805 ) ( ON ?auto_775807 ?auto_775806 ) ( ON ?auto_775808 ?auto_775807 ) ( ON ?auto_775809 ?auto_775808 ) ( not ( = ?auto_775803 ?auto_775804 ) ) ( not ( = ?auto_775803 ?auto_775805 ) ) ( not ( = ?auto_775803 ?auto_775806 ) ) ( not ( = ?auto_775803 ?auto_775807 ) ) ( not ( = ?auto_775803 ?auto_775808 ) ) ( not ( = ?auto_775803 ?auto_775809 ) ) ( not ( = ?auto_775803 ?auto_775810 ) ) ( not ( = ?auto_775803 ?auto_775811 ) ) ( not ( = ?auto_775803 ?auto_775812 ) ) ( not ( = ?auto_775804 ?auto_775805 ) ) ( not ( = ?auto_775804 ?auto_775806 ) ) ( not ( = ?auto_775804 ?auto_775807 ) ) ( not ( = ?auto_775804 ?auto_775808 ) ) ( not ( = ?auto_775804 ?auto_775809 ) ) ( not ( = ?auto_775804 ?auto_775810 ) ) ( not ( = ?auto_775804 ?auto_775811 ) ) ( not ( = ?auto_775804 ?auto_775812 ) ) ( not ( = ?auto_775805 ?auto_775806 ) ) ( not ( = ?auto_775805 ?auto_775807 ) ) ( not ( = ?auto_775805 ?auto_775808 ) ) ( not ( = ?auto_775805 ?auto_775809 ) ) ( not ( = ?auto_775805 ?auto_775810 ) ) ( not ( = ?auto_775805 ?auto_775811 ) ) ( not ( = ?auto_775805 ?auto_775812 ) ) ( not ( = ?auto_775806 ?auto_775807 ) ) ( not ( = ?auto_775806 ?auto_775808 ) ) ( not ( = ?auto_775806 ?auto_775809 ) ) ( not ( = ?auto_775806 ?auto_775810 ) ) ( not ( = ?auto_775806 ?auto_775811 ) ) ( not ( = ?auto_775806 ?auto_775812 ) ) ( not ( = ?auto_775807 ?auto_775808 ) ) ( not ( = ?auto_775807 ?auto_775809 ) ) ( not ( = ?auto_775807 ?auto_775810 ) ) ( not ( = ?auto_775807 ?auto_775811 ) ) ( not ( = ?auto_775807 ?auto_775812 ) ) ( not ( = ?auto_775808 ?auto_775809 ) ) ( not ( = ?auto_775808 ?auto_775810 ) ) ( not ( = ?auto_775808 ?auto_775811 ) ) ( not ( = ?auto_775808 ?auto_775812 ) ) ( not ( = ?auto_775809 ?auto_775810 ) ) ( not ( = ?auto_775809 ?auto_775811 ) ) ( not ( = ?auto_775809 ?auto_775812 ) ) ( not ( = ?auto_775810 ?auto_775811 ) ) ( not ( = ?auto_775810 ?auto_775812 ) ) ( not ( = ?auto_775811 ?auto_775812 ) ) ( CLEAR ?auto_775809 ) ( ON ?auto_775810 ?auto_775811 ) ( CLEAR ?auto_775810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_775803 ?auto_775804 ?auto_775805 ?auto_775806 ?auto_775807 ?auto_775808 ?auto_775809 ?auto_775810 )
      ( MAKE-9PILE ?auto_775803 ?auto_775804 ?auto_775805 ?auto_775806 ?auto_775807 ?auto_775808 ?auto_775809 ?auto_775810 ?auto_775811 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_775841 - BLOCK
      ?auto_775842 - BLOCK
      ?auto_775843 - BLOCK
      ?auto_775844 - BLOCK
      ?auto_775845 - BLOCK
      ?auto_775846 - BLOCK
      ?auto_775847 - BLOCK
      ?auto_775848 - BLOCK
      ?auto_775849 - BLOCK
    )
    :vars
    (
      ?auto_775850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775849 ?auto_775850 ) ( ON-TABLE ?auto_775841 ) ( ON ?auto_775842 ?auto_775841 ) ( ON ?auto_775843 ?auto_775842 ) ( ON ?auto_775844 ?auto_775843 ) ( ON ?auto_775845 ?auto_775844 ) ( ON ?auto_775846 ?auto_775845 ) ( not ( = ?auto_775841 ?auto_775842 ) ) ( not ( = ?auto_775841 ?auto_775843 ) ) ( not ( = ?auto_775841 ?auto_775844 ) ) ( not ( = ?auto_775841 ?auto_775845 ) ) ( not ( = ?auto_775841 ?auto_775846 ) ) ( not ( = ?auto_775841 ?auto_775847 ) ) ( not ( = ?auto_775841 ?auto_775848 ) ) ( not ( = ?auto_775841 ?auto_775849 ) ) ( not ( = ?auto_775841 ?auto_775850 ) ) ( not ( = ?auto_775842 ?auto_775843 ) ) ( not ( = ?auto_775842 ?auto_775844 ) ) ( not ( = ?auto_775842 ?auto_775845 ) ) ( not ( = ?auto_775842 ?auto_775846 ) ) ( not ( = ?auto_775842 ?auto_775847 ) ) ( not ( = ?auto_775842 ?auto_775848 ) ) ( not ( = ?auto_775842 ?auto_775849 ) ) ( not ( = ?auto_775842 ?auto_775850 ) ) ( not ( = ?auto_775843 ?auto_775844 ) ) ( not ( = ?auto_775843 ?auto_775845 ) ) ( not ( = ?auto_775843 ?auto_775846 ) ) ( not ( = ?auto_775843 ?auto_775847 ) ) ( not ( = ?auto_775843 ?auto_775848 ) ) ( not ( = ?auto_775843 ?auto_775849 ) ) ( not ( = ?auto_775843 ?auto_775850 ) ) ( not ( = ?auto_775844 ?auto_775845 ) ) ( not ( = ?auto_775844 ?auto_775846 ) ) ( not ( = ?auto_775844 ?auto_775847 ) ) ( not ( = ?auto_775844 ?auto_775848 ) ) ( not ( = ?auto_775844 ?auto_775849 ) ) ( not ( = ?auto_775844 ?auto_775850 ) ) ( not ( = ?auto_775845 ?auto_775846 ) ) ( not ( = ?auto_775845 ?auto_775847 ) ) ( not ( = ?auto_775845 ?auto_775848 ) ) ( not ( = ?auto_775845 ?auto_775849 ) ) ( not ( = ?auto_775845 ?auto_775850 ) ) ( not ( = ?auto_775846 ?auto_775847 ) ) ( not ( = ?auto_775846 ?auto_775848 ) ) ( not ( = ?auto_775846 ?auto_775849 ) ) ( not ( = ?auto_775846 ?auto_775850 ) ) ( not ( = ?auto_775847 ?auto_775848 ) ) ( not ( = ?auto_775847 ?auto_775849 ) ) ( not ( = ?auto_775847 ?auto_775850 ) ) ( not ( = ?auto_775848 ?auto_775849 ) ) ( not ( = ?auto_775848 ?auto_775850 ) ) ( not ( = ?auto_775849 ?auto_775850 ) ) ( ON ?auto_775848 ?auto_775849 ) ( CLEAR ?auto_775846 ) ( ON ?auto_775847 ?auto_775848 ) ( CLEAR ?auto_775847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_775841 ?auto_775842 ?auto_775843 ?auto_775844 ?auto_775845 ?auto_775846 ?auto_775847 )
      ( MAKE-9PILE ?auto_775841 ?auto_775842 ?auto_775843 ?auto_775844 ?auto_775845 ?auto_775846 ?auto_775847 ?auto_775848 ?auto_775849 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_775879 - BLOCK
      ?auto_775880 - BLOCK
      ?auto_775881 - BLOCK
      ?auto_775882 - BLOCK
      ?auto_775883 - BLOCK
      ?auto_775884 - BLOCK
      ?auto_775885 - BLOCK
      ?auto_775886 - BLOCK
      ?auto_775887 - BLOCK
    )
    :vars
    (
      ?auto_775888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775887 ?auto_775888 ) ( ON-TABLE ?auto_775879 ) ( ON ?auto_775880 ?auto_775879 ) ( ON ?auto_775881 ?auto_775880 ) ( ON ?auto_775882 ?auto_775881 ) ( ON ?auto_775883 ?auto_775882 ) ( not ( = ?auto_775879 ?auto_775880 ) ) ( not ( = ?auto_775879 ?auto_775881 ) ) ( not ( = ?auto_775879 ?auto_775882 ) ) ( not ( = ?auto_775879 ?auto_775883 ) ) ( not ( = ?auto_775879 ?auto_775884 ) ) ( not ( = ?auto_775879 ?auto_775885 ) ) ( not ( = ?auto_775879 ?auto_775886 ) ) ( not ( = ?auto_775879 ?auto_775887 ) ) ( not ( = ?auto_775879 ?auto_775888 ) ) ( not ( = ?auto_775880 ?auto_775881 ) ) ( not ( = ?auto_775880 ?auto_775882 ) ) ( not ( = ?auto_775880 ?auto_775883 ) ) ( not ( = ?auto_775880 ?auto_775884 ) ) ( not ( = ?auto_775880 ?auto_775885 ) ) ( not ( = ?auto_775880 ?auto_775886 ) ) ( not ( = ?auto_775880 ?auto_775887 ) ) ( not ( = ?auto_775880 ?auto_775888 ) ) ( not ( = ?auto_775881 ?auto_775882 ) ) ( not ( = ?auto_775881 ?auto_775883 ) ) ( not ( = ?auto_775881 ?auto_775884 ) ) ( not ( = ?auto_775881 ?auto_775885 ) ) ( not ( = ?auto_775881 ?auto_775886 ) ) ( not ( = ?auto_775881 ?auto_775887 ) ) ( not ( = ?auto_775881 ?auto_775888 ) ) ( not ( = ?auto_775882 ?auto_775883 ) ) ( not ( = ?auto_775882 ?auto_775884 ) ) ( not ( = ?auto_775882 ?auto_775885 ) ) ( not ( = ?auto_775882 ?auto_775886 ) ) ( not ( = ?auto_775882 ?auto_775887 ) ) ( not ( = ?auto_775882 ?auto_775888 ) ) ( not ( = ?auto_775883 ?auto_775884 ) ) ( not ( = ?auto_775883 ?auto_775885 ) ) ( not ( = ?auto_775883 ?auto_775886 ) ) ( not ( = ?auto_775883 ?auto_775887 ) ) ( not ( = ?auto_775883 ?auto_775888 ) ) ( not ( = ?auto_775884 ?auto_775885 ) ) ( not ( = ?auto_775884 ?auto_775886 ) ) ( not ( = ?auto_775884 ?auto_775887 ) ) ( not ( = ?auto_775884 ?auto_775888 ) ) ( not ( = ?auto_775885 ?auto_775886 ) ) ( not ( = ?auto_775885 ?auto_775887 ) ) ( not ( = ?auto_775885 ?auto_775888 ) ) ( not ( = ?auto_775886 ?auto_775887 ) ) ( not ( = ?auto_775886 ?auto_775888 ) ) ( not ( = ?auto_775887 ?auto_775888 ) ) ( ON ?auto_775886 ?auto_775887 ) ( ON ?auto_775885 ?auto_775886 ) ( CLEAR ?auto_775883 ) ( ON ?auto_775884 ?auto_775885 ) ( CLEAR ?auto_775884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_775879 ?auto_775880 ?auto_775881 ?auto_775882 ?auto_775883 ?auto_775884 )
      ( MAKE-9PILE ?auto_775879 ?auto_775880 ?auto_775881 ?auto_775882 ?auto_775883 ?auto_775884 ?auto_775885 ?auto_775886 ?auto_775887 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_775917 - BLOCK
      ?auto_775918 - BLOCK
      ?auto_775919 - BLOCK
      ?auto_775920 - BLOCK
      ?auto_775921 - BLOCK
      ?auto_775922 - BLOCK
      ?auto_775923 - BLOCK
      ?auto_775924 - BLOCK
      ?auto_775925 - BLOCK
    )
    :vars
    (
      ?auto_775926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775925 ?auto_775926 ) ( ON-TABLE ?auto_775917 ) ( ON ?auto_775918 ?auto_775917 ) ( ON ?auto_775919 ?auto_775918 ) ( ON ?auto_775920 ?auto_775919 ) ( not ( = ?auto_775917 ?auto_775918 ) ) ( not ( = ?auto_775917 ?auto_775919 ) ) ( not ( = ?auto_775917 ?auto_775920 ) ) ( not ( = ?auto_775917 ?auto_775921 ) ) ( not ( = ?auto_775917 ?auto_775922 ) ) ( not ( = ?auto_775917 ?auto_775923 ) ) ( not ( = ?auto_775917 ?auto_775924 ) ) ( not ( = ?auto_775917 ?auto_775925 ) ) ( not ( = ?auto_775917 ?auto_775926 ) ) ( not ( = ?auto_775918 ?auto_775919 ) ) ( not ( = ?auto_775918 ?auto_775920 ) ) ( not ( = ?auto_775918 ?auto_775921 ) ) ( not ( = ?auto_775918 ?auto_775922 ) ) ( not ( = ?auto_775918 ?auto_775923 ) ) ( not ( = ?auto_775918 ?auto_775924 ) ) ( not ( = ?auto_775918 ?auto_775925 ) ) ( not ( = ?auto_775918 ?auto_775926 ) ) ( not ( = ?auto_775919 ?auto_775920 ) ) ( not ( = ?auto_775919 ?auto_775921 ) ) ( not ( = ?auto_775919 ?auto_775922 ) ) ( not ( = ?auto_775919 ?auto_775923 ) ) ( not ( = ?auto_775919 ?auto_775924 ) ) ( not ( = ?auto_775919 ?auto_775925 ) ) ( not ( = ?auto_775919 ?auto_775926 ) ) ( not ( = ?auto_775920 ?auto_775921 ) ) ( not ( = ?auto_775920 ?auto_775922 ) ) ( not ( = ?auto_775920 ?auto_775923 ) ) ( not ( = ?auto_775920 ?auto_775924 ) ) ( not ( = ?auto_775920 ?auto_775925 ) ) ( not ( = ?auto_775920 ?auto_775926 ) ) ( not ( = ?auto_775921 ?auto_775922 ) ) ( not ( = ?auto_775921 ?auto_775923 ) ) ( not ( = ?auto_775921 ?auto_775924 ) ) ( not ( = ?auto_775921 ?auto_775925 ) ) ( not ( = ?auto_775921 ?auto_775926 ) ) ( not ( = ?auto_775922 ?auto_775923 ) ) ( not ( = ?auto_775922 ?auto_775924 ) ) ( not ( = ?auto_775922 ?auto_775925 ) ) ( not ( = ?auto_775922 ?auto_775926 ) ) ( not ( = ?auto_775923 ?auto_775924 ) ) ( not ( = ?auto_775923 ?auto_775925 ) ) ( not ( = ?auto_775923 ?auto_775926 ) ) ( not ( = ?auto_775924 ?auto_775925 ) ) ( not ( = ?auto_775924 ?auto_775926 ) ) ( not ( = ?auto_775925 ?auto_775926 ) ) ( ON ?auto_775924 ?auto_775925 ) ( ON ?auto_775923 ?auto_775924 ) ( ON ?auto_775922 ?auto_775923 ) ( CLEAR ?auto_775920 ) ( ON ?auto_775921 ?auto_775922 ) ( CLEAR ?auto_775921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_775917 ?auto_775918 ?auto_775919 ?auto_775920 ?auto_775921 )
      ( MAKE-9PILE ?auto_775917 ?auto_775918 ?auto_775919 ?auto_775920 ?auto_775921 ?auto_775922 ?auto_775923 ?auto_775924 ?auto_775925 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_775955 - BLOCK
      ?auto_775956 - BLOCK
      ?auto_775957 - BLOCK
      ?auto_775958 - BLOCK
      ?auto_775959 - BLOCK
      ?auto_775960 - BLOCK
      ?auto_775961 - BLOCK
      ?auto_775962 - BLOCK
      ?auto_775963 - BLOCK
    )
    :vars
    (
      ?auto_775964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_775963 ?auto_775964 ) ( ON-TABLE ?auto_775955 ) ( ON ?auto_775956 ?auto_775955 ) ( ON ?auto_775957 ?auto_775956 ) ( not ( = ?auto_775955 ?auto_775956 ) ) ( not ( = ?auto_775955 ?auto_775957 ) ) ( not ( = ?auto_775955 ?auto_775958 ) ) ( not ( = ?auto_775955 ?auto_775959 ) ) ( not ( = ?auto_775955 ?auto_775960 ) ) ( not ( = ?auto_775955 ?auto_775961 ) ) ( not ( = ?auto_775955 ?auto_775962 ) ) ( not ( = ?auto_775955 ?auto_775963 ) ) ( not ( = ?auto_775955 ?auto_775964 ) ) ( not ( = ?auto_775956 ?auto_775957 ) ) ( not ( = ?auto_775956 ?auto_775958 ) ) ( not ( = ?auto_775956 ?auto_775959 ) ) ( not ( = ?auto_775956 ?auto_775960 ) ) ( not ( = ?auto_775956 ?auto_775961 ) ) ( not ( = ?auto_775956 ?auto_775962 ) ) ( not ( = ?auto_775956 ?auto_775963 ) ) ( not ( = ?auto_775956 ?auto_775964 ) ) ( not ( = ?auto_775957 ?auto_775958 ) ) ( not ( = ?auto_775957 ?auto_775959 ) ) ( not ( = ?auto_775957 ?auto_775960 ) ) ( not ( = ?auto_775957 ?auto_775961 ) ) ( not ( = ?auto_775957 ?auto_775962 ) ) ( not ( = ?auto_775957 ?auto_775963 ) ) ( not ( = ?auto_775957 ?auto_775964 ) ) ( not ( = ?auto_775958 ?auto_775959 ) ) ( not ( = ?auto_775958 ?auto_775960 ) ) ( not ( = ?auto_775958 ?auto_775961 ) ) ( not ( = ?auto_775958 ?auto_775962 ) ) ( not ( = ?auto_775958 ?auto_775963 ) ) ( not ( = ?auto_775958 ?auto_775964 ) ) ( not ( = ?auto_775959 ?auto_775960 ) ) ( not ( = ?auto_775959 ?auto_775961 ) ) ( not ( = ?auto_775959 ?auto_775962 ) ) ( not ( = ?auto_775959 ?auto_775963 ) ) ( not ( = ?auto_775959 ?auto_775964 ) ) ( not ( = ?auto_775960 ?auto_775961 ) ) ( not ( = ?auto_775960 ?auto_775962 ) ) ( not ( = ?auto_775960 ?auto_775963 ) ) ( not ( = ?auto_775960 ?auto_775964 ) ) ( not ( = ?auto_775961 ?auto_775962 ) ) ( not ( = ?auto_775961 ?auto_775963 ) ) ( not ( = ?auto_775961 ?auto_775964 ) ) ( not ( = ?auto_775962 ?auto_775963 ) ) ( not ( = ?auto_775962 ?auto_775964 ) ) ( not ( = ?auto_775963 ?auto_775964 ) ) ( ON ?auto_775962 ?auto_775963 ) ( ON ?auto_775961 ?auto_775962 ) ( ON ?auto_775960 ?auto_775961 ) ( ON ?auto_775959 ?auto_775960 ) ( CLEAR ?auto_775957 ) ( ON ?auto_775958 ?auto_775959 ) ( CLEAR ?auto_775958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_775955 ?auto_775956 ?auto_775957 ?auto_775958 )
      ( MAKE-9PILE ?auto_775955 ?auto_775956 ?auto_775957 ?auto_775958 ?auto_775959 ?auto_775960 ?auto_775961 ?auto_775962 ?auto_775963 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_775993 - BLOCK
      ?auto_775994 - BLOCK
      ?auto_775995 - BLOCK
      ?auto_775996 - BLOCK
      ?auto_775997 - BLOCK
      ?auto_775998 - BLOCK
      ?auto_775999 - BLOCK
      ?auto_776000 - BLOCK
      ?auto_776001 - BLOCK
    )
    :vars
    (
      ?auto_776002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_776001 ?auto_776002 ) ( ON-TABLE ?auto_775993 ) ( ON ?auto_775994 ?auto_775993 ) ( not ( = ?auto_775993 ?auto_775994 ) ) ( not ( = ?auto_775993 ?auto_775995 ) ) ( not ( = ?auto_775993 ?auto_775996 ) ) ( not ( = ?auto_775993 ?auto_775997 ) ) ( not ( = ?auto_775993 ?auto_775998 ) ) ( not ( = ?auto_775993 ?auto_775999 ) ) ( not ( = ?auto_775993 ?auto_776000 ) ) ( not ( = ?auto_775993 ?auto_776001 ) ) ( not ( = ?auto_775993 ?auto_776002 ) ) ( not ( = ?auto_775994 ?auto_775995 ) ) ( not ( = ?auto_775994 ?auto_775996 ) ) ( not ( = ?auto_775994 ?auto_775997 ) ) ( not ( = ?auto_775994 ?auto_775998 ) ) ( not ( = ?auto_775994 ?auto_775999 ) ) ( not ( = ?auto_775994 ?auto_776000 ) ) ( not ( = ?auto_775994 ?auto_776001 ) ) ( not ( = ?auto_775994 ?auto_776002 ) ) ( not ( = ?auto_775995 ?auto_775996 ) ) ( not ( = ?auto_775995 ?auto_775997 ) ) ( not ( = ?auto_775995 ?auto_775998 ) ) ( not ( = ?auto_775995 ?auto_775999 ) ) ( not ( = ?auto_775995 ?auto_776000 ) ) ( not ( = ?auto_775995 ?auto_776001 ) ) ( not ( = ?auto_775995 ?auto_776002 ) ) ( not ( = ?auto_775996 ?auto_775997 ) ) ( not ( = ?auto_775996 ?auto_775998 ) ) ( not ( = ?auto_775996 ?auto_775999 ) ) ( not ( = ?auto_775996 ?auto_776000 ) ) ( not ( = ?auto_775996 ?auto_776001 ) ) ( not ( = ?auto_775996 ?auto_776002 ) ) ( not ( = ?auto_775997 ?auto_775998 ) ) ( not ( = ?auto_775997 ?auto_775999 ) ) ( not ( = ?auto_775997 ?auto_776000 ) ) ( not ( = ?auto_775997 ?auto_776001 ) ) ( not ( = ?auto_775997 ?auto_776002 ) ) ( not ( = ?auto_775998 ?auto_775999 ) ) ( not ( = ?auto_775998 ?auto_776000 ) ) ( not ( = ?auto_775998 ?auto_776001 ) ) ( not ( = ?auto_775998 ?auto_776002 ) ) ( not ( = ?auto_775999 ?auto_776000 ) ) ( not ( = ?auto_775999 ?auto_776001 ) ) ( not ( = ?auto_775999 ?auto_776002 ) ) ( not ( = ?auto_776000 ?auto_776001 ) ) ( not ( = ?auto_776000 ?auto_776002 ) ) ( not ( = ?auto_776001 ?auto_776002 ) ) ( ON ?auto_776000 ?auto_776001 ) ( ON ?auto_775999 ?auto_776000 ) ( ON ?auto_775998 ?auto_775999 ) ( ON ?auto_775997 ?auto_775998 ) ( ON ?auto_775996 ?auto_775997 ) ( CLEAR ?auto_775994 ) ( ON ?auto_775995 ?auto_775996 ) ( CLEAR ?auto_775995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_775993 ?auto_775994 ?auto_775995 )
      ( MAKE-9PILE ?auto_775993 ?auto_775994 ?auto_775995 ?auto_775996 ?auto_775997 ?auto_775998 ?auto_775999 ?auto_776000 ?auto_776001 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_776031 - BLOCK
      ?auto_776032 - BLOCK
      ?auto_776033 - BLOCK
      ?auto_776034 - BLOCK
      ?auto_776035 - BLOCK
      ?auto_776036 - BLOCK
      ?auto_776037 - BLOCK
      ?auto_776038 - BLOCK
      ?auto_776039 - BLOCK
    )
    :vars
    (
      ?auto_776040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_776039 ?auto_776040 ) ( ON-TABLE ?auto_776031 ) ( not ( = ?auto_776031 ?auto_776032 ) ) ( not ( = ?auto_776031 ?auto_776033 ) ) ( not ( = ?auto_776031 ?auto_776034 ) ) ( not ( = ?auto_776031 ?auto_776035 ) ) ( not ( = ?auto_776031 ?auto_776036 ) ) ( not ( = ?auto_776031 ?auto_776037 ) ) ( not ( = ?auto_776031 ?auto_776038 ) ) ( not ( = ?auto_776031 ?auto_776039 ) ) ( not ( = ?auto_776031 ?auto_776040 ) ) ( not ( = ?auto_776032 ?auto_776033 ) ) ( not ( = ?auto_776032 ?auto_776034 ) ) ( not ( = ?auto_776032 ?auto_776035 ) ) ( not ( = ?auto_776032 ?auto_776036 ) ) ( not ( = ?auto_776032 ?auto_776037 ) ) ( not ( = ?auto_776032 ?auto_776038 ) ) ( not ( = ?auto_776032 ?auto_776039 ) ) ( not ( = ?auto_776032 ?auto_776040 ) ) ( not ( = ?auto_776033 ?auto_776034 ) ) ( not ( = ?auto_776033 ?auto_776035 ) ) ( not ( = ?auto_776033 ?auto_776036 ) ) ( not ( = ?auto_776033 ?auto_776037 ) ) ( not ( = ?auto_776033 ?auto_776038 ) ) ( not ( = ?auto_776033 ?auto_776039 ) ) ( not ( = ?auto_776033 ?auto_776040 ) ) ( not ( = ?auto_776034 ?auto_776035 ) ) ( not ( = ?auto_776034 ?auto_776036 ) ) ( not ( = ?auto_776034 ?auto_776037 ) ) ( not ( = ?auto_776034 ?auto_776038 ) ) ( not ( = ?auto_776034 ?auto_776039 ) ) ( not ( = ?auto_776034 ?auto_776040 ) ) ( not ( = ?auto_776035 ?auto_776036 ) ) ( not ( = ?auto_776035 ?auto_776037 ) ) ( not ( = ?auto_776035 ?auto_776038 ) ) ( not ( = ?auto_776035 ?auto_776039 ) ) ( not ( = ?auto_776035 ?auto_776040 ) ) ( not ( = ?auto_776036 ?auto_776037 ) ) ( not ( = ?auto_776036 ?auto_776038 ) ) ( not ( = ?auto_776036 ?auto_776039 ) ) ( not ( = ?auto_776036 ?auto_776040 ) ) ( not ( = ?auto_776037 ?auto_776038 ) ) ( not ( = ?auto_776037 ?auto_776039 ) ) ( not ( = ?auto_776037 ?auto_776040 ) ) ( not ( = ?auto_776038 ?auto_776039 ) ) ( not ( = ?auto_776038 ?auto_776040 ) ) ( not ( = ?auto_776039 ?auto_776040 ) ) ( ON ?auto_776038 ?auto_776039 ) ( ON ?auto_776037 ?auto_776038 ) ( ON ?auto_776036 ?auto_776037 ) ( ON ?auto_776035 ?auto_776036 ) ( ON ?auto_776034 ?auto_776035 ) ( ON ?auto_776033 ?auto_776034 ) ( CLEAR ?auto_776031 ) ( ON ?auto_776032 ?auto_776033 ) ( CLEAR ?auto_776032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_776031 ?auto_776032 )
      ( MAKE-9PILE ?auto_776031 ?auto_776032 ?auto_776033 ?auto_776034 ?auto_776035 ?auto_776036 ?auto_776037 ?auto_776038 ?auto_776039 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_776069 - BLOCK
      ?auto_776070 - BLOCK
      ?auto_776071 - BLOCK
      ?auto_776072 - BLOCK
      ?auto_776073 - BLOCK
      ?auto_776074 - BLOCK
      ?auto_776075 - BLOCK
      ?auto_776076 - BLOCK
      ?auto_776077 - BLOCK
    )
    :vars
    (
      ?auto_776078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_776077 ?auto_776078 ) ( not ( = ?auto_776069 ?auto_776070 ) ) ( not ( = ?auto_776069 ?auto_776071 ) ) ( not ( = ?auto_776069 ?auto_776072 ) ) ( not ( = ?auto_776069 ?auto_776073 ) ) ( not ( = ?auto_776069 ?auto_776074 ) ) ( not ( = ?auto_776069 ?auto_776075 ) ) ( not ( = ?auto_776069 ?auto_776076 ) ) ( not ( = ?auto_776069 ?auto_776077 ) ) ( not ( = ?auto_776069 ?auto_776078 ) ) ( not ( = ?auto_776070 ?auto_776071 ) ) ( not ( = ?auto_776070 ?auto_776072 ) ) ( not ( = ?auto_776070 ?auto_776073 ) ) ( not ( = ?auto_776070 ?auto_776074 ) ) ( not ( = ?auto_776070 ?auto_776075 ) ) ( not ( = ?auto_776070 ?auto_776076 ) ) ( not ( = ?auto_776070 ?auto_776077 ) ) ( not ( = ?auto_776070 ?auto_776078 ) ) ( not ( = ?auto_776071 ?auto_776072 ) ) ( not ( = ?auto_776071 ?auto_776073 ) ) ( not ( = ?auto_776071 ?auto_776074 ) ) ( not ( = ?auto_776071 ?auto_776075 ) ) ( not ( = ?auto_776071 ?auto_776076 ) ) ( not ( = ?auto_776071 ?auto_776077 ) ) ( not ( = ?auto_776071 ?auto_776078 ) ) ( not ( = ?auto_776072 ?auto_776073 ) ) ( not ( = ?auto_776072 ?auto_776074 ) ) ( not ( = ?auto_776072 ?auto_776075 ) ) ( not ( = ?auto_776072 ?auto_776076 ) ) ( not ( = ?auto_776072 ?auto_776077 ) ) ( not ( = ?auto_776072 ?auto_776078 ) ) ( not ( = ?auto_776073 ?auto_776074 ) ) ( not ( = ?auto_776073 ?auto_776075 ) ) ( not ( = ?auto_776073 ?auto_776076 ) ) ( not ( = ?auto_776073 ?auto_776077 ) ) ( not ( = ?auto_776073 ?auto_776078 ) ) ( not ( = ?auto_776074 ?auto_776075 ) ) ( not ( = ?auto_776074 ?auto_776076 ) ) ( not ( = ?auto_776074 ?auto_776077 ) ) ( not ( = ?auto_776074 ?auto_776078 ) ) ( not ( = ?auto_776075 ?auto_776076 ) ) ( not ( = ?auto_776075 ?auto_776077 ) ) ( not ( = ?auto_776075 ?auto_776078 ) ) ( not ( = ?auto_776076 ?auto_776077 ) ) ( not ( = ?auto_776076 ?auto_776078 ) ) ( not ( = ?auto_776077 ?auto_776078 ) ) ( ON ?auto_776076 ?auto_776077 ) ( ON ?auto_776075 ?auto_776076 ) ( ON ?auto_776074 ?auto_776075 ) ( ON ?auto_776073 ?auto_776074 ) ( ON ?auto_776072 ?auto_776073 ) ( ON ?auto_776071 ?auto_776072 ) ( ON ?auto_776070 ?auto_776071 ) ( ON ?auto_776069 ?auto_776070 ) ( CLEAR ?auto_776069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_776069 )
      ( MAKE-9PILE ?auto_776069 ?auto_776070 ?auto_776071 ?auto_776072 ?auto_776073 ?auto_776074 ?auto_776075 ?auto_776076 ?auto_776077 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_776108 - BLOCK
      ?auto_776109 - BLOCK
      ?auto_776110 - BLOCK
      ?auto_776111 - BLOCK
      ?auto_776112 - BLOCK
      ?auto_776113 - BLOCK
      ?auto_776114 - BLOCK
      ?auto_776115 - BLOCK
      ?auto_776116 - BLOCK
      ?auto_776117 - BLOCK
    )
    :vars
    (
      ?auto_776118 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_776116 ) ( ON ?auto_776117 ?auto_776118 ) ( CLEAR ?auto_776117 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_776108 ) ( ON ?auto_776109 ?auto_776108 ) ( ON ?auto_776110 ?auto_776109 ) ( ON ?auto_776111 ?auto_776110 ) ( ON ?auto_776112 ?auto_776111 ) ( ON ?auto_776113 ?auto_776112 ) ( ON ?auto_776114 ?auto_776113 ) ( ON ?auto_776115 ?auto_776114 ) ( ON ?auto_776116 ?auto_776115 ) ( not ( = ?auto_776108 ?auto_776109 ) ) ( not ( = ?auto_776108 ?auto_776110 ) ) ( not ( = ?auto_776108 ?auto_776111 ) ) ( not ( = ?auto_776108 ?auto_776112 ) ) ( not ( = ?auto_776108 ?auto_776113 ) ) ( not ( = ?auto_776108 ?auto_776114 ) ) ( not ( = ?auto_776108 ?auto_776115 ) ) ( not ( = ?auto_776108 ?auto_776116 ) ) ( not ( = ?auto_776108 ?auto_776117 ) ) ( not ( = ?auto_776108 ?auto_776118 ) ) ( not ( = ?auto_776109 ?auto_776110 ) ) ( not ( = ?auto_776109 ?auto_776111 ) ) ( not ( = ?auto_776109 ?auto_776112 ) ) ( not ( = ?auto_776109 ?auto_776113 ) ) ( not ( = ?auto_776109 ?auto_776114 ) ) ( not ( = ?auto_776109 ?auto_776115 ) ) ( not ( = ?auto_776109 ?auto_776116 ) ) ( not ( = ?auto_776109 ?auto_776117 ) ) ( not ( = ?auto_776109 ?auto_776118 ) ) ( not ( = ?auto_776110 ?auto_776111 ) ) ( not ( = ?auto_776110 ?auto_776112 ) ) ( not ( = ?auto_776110 ?auto_776113 ) ) ( not ( = ?auto_776110 ?auto_776114 ) ) ( not ( = ?auto_776110 ?auto_776115 ) ) ( not ( = ?auto_776110 ?auto_776116 ) ) ( not ( = ?auto_776110 ?auto_776117 ) ) ( not ( = ?auto_776110 ?auto_776118 ) ) ( not ( = ?auto_776111 ?auto_776112 ) ) ( not ( = ?auto_776111 ?auto_776113 ) ) ( not ( = ?auto_776111 ?auto_776114 ) ) ( not ( = ?auto_776111 ?auto_776115 ) ) ( not ( = ?auto_776111 ?auto_776116 ) ) ( not ( = ?auto_776111 ?auto_776117 ) ) ( not ( = ?auto_776111 ?auto_776118 ) ) ( not ( = ?auto_776112 ?auto_776113 ) ) ( not ( = ?auto_776112 ?auto_776114 ) ) ( not ( = ?auto_776112 ?auto_776115 ) ) ( not ( = ?auto_776112 ?auto_776116 ) ) ( not ( = ?auto_776112 ?auto_776117 ) ) ( not ( = ?auto_776112 ?auto_776118 ) ) ( not ( = ?auto_776113 ?auto_776114 ) ) ( not ( = ?auto_776113 ?auto_776115 ) ) ( not ( = ?auto_776113 ?auto_776116 ) ) ( not ( = ?auto_776113 ?auto_776117 ) ) ( not ( = ?auto_776113 ?auto_776118 ) ) ( not ( = ?auto_776114 ?auto_776115 ) ) ( not ( = ?auto_776114 ?auto_776116 ) ) ( not ( = ?auto_776114 ?auto_776117 ) ) ( not ( = ?auto_776114 ?auto_776118 ) ) ( not ( = ?auto_776115 ?auto_776116 ) ) ( not ( = ?auto_776115 ?auto_776117 ) ) ( not ( = ?auto_776115 ?auto_776118 ) ) ( not ( = ?auto_776116 ?auto_776117 ) ) ( not ( = ?auto_776116 ?auto_776118 ) ) ( not ( = ?auto_776117 ?auto_776118 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_776117 ?auto_776118 )
      ( !STACK ?auto_776117 ?auto_776116 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_776150 - BLOCK
      ?auto_776151 - BLOCK
      ?auto_776152 - BLOCK
      ?auto_776153 - BLOCK
      ?auto_776154 - BLOCK
      ?auto_776155 - BLOCK
      ?auto_776156 - BLOCK
      ?auto_776157 - BLOCK
      ?auto_776158 - BLOCK
      ?auto_776159 - BLOCK
    )
    :vars
    (
      ?auto_776160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_776159 ?auto_776160 ) ( ON-TABLE ?auto_776150 ) ( ON ?auto_776151 ?auto_776150 ) ( ON ?auto_776152 ?auto_776151 ) ( ON ?auto_776153 ?auto_776152 ) ( ON ?auto_776154 ?auto_776153 ) ( ON ?auto_776155 ?auto_776154 ) ( ON ?auto_776156 ?auto_776155 ) ( ON ?auto_776157 ?auto_776156 ) ( not ( = ?auto_776150 ?auto_776151 ) ) ( not ( = ?auto_776150 ?auto_776152 ) ) ( not ( = ?auto_776150 ?auto_776153 ) ) ( not ( = ?auto_776150 ?auto_776154 ) ) ( not ( = ?auto_776150 ?auto_776155 ) ) ( not ( = ?auto_776150 ?auto_776156 ) ) ( not ( = ?auto_776150 ?auto_776157 ) ) ( not ( = ?auto_776150 ?auto_776158 ) ) ( not ( = ?auto_776150 ?auto_776159 ) ) ( not ( = ?auto_776150 ?auto_776160 ) ) ( not ( = ?auto_776151 ?auto_776152 ) ) ( not ( = ?auto_776151 ?auto_776153 ) ) ( not ( = ?auto_776151 ?auto_776154 ) ) ( not ( = ?auto_776151 ?auto_776155 ) ) ( not ( = ?auto_776151 ?auto_776156 ) ) ( not ( = ?auto_776151 ?auto_776157 ) ) ( not ( = ?auto_776151 ?auto_776158 ) ) ( not ( = ?auto_776151 ?auto_776159 ) ) ( not ( = ?auto_776151 ?auto_776160 ) ) ( not ( = ?auto_776152 ?auto_776153 ) ) ( not ( = ?auto_776152 ?auto_776154 ) ) ( not ( = ?auto_776152 ?auto_776155 ) ) ( not ( = ?auto_776152 ?auto_776156 ) ) ( not ( = ?auto_776152 ?auto_776157 ) ) ( not ( = ?auto_776152 ?auto_776158 ) ) ( not ( = ?auto_776152 ?auto_776159 ) ) ( not ( = ?auto_776152 ?auto_776160 ) ) ( not ( = ?auto_776153 ?auto_776154 ) ) ( not ( = ?auto_776153 ?auto_776155 ) ) ( not ( = ?auto_776153 ?auto_776156 ) ) ( not ( = ?auto_776153 ?auto_776157 ) ) ( not ( = ?auto_776153 ?auto_776158 ) ) ( not ( = ?auto_776153 ?auto_776159 ) ) ( not ( = ?auto_776153 ?auto_776160 ) ) ( not ( = ?auto_776154 ?auto_776155 ) ) ( not ( = ?auto_776154 ?auto_776156 ) ) ( not ( = ?auto_776154 ?auto_776157 ) ) ( not ( = ?auto_776154 ?auto_776158 ) ) ( not ( = ?auto_776154 ?auto_776159 ) ) ( not ( = ?auto_776154 ?auto_776160 ) ) ( not ( = ?auto_776155 ?auto_776156 ) ) ( not ( = ?auto_776155 ?auto_776157 ) ) ( not ( = ?auto_776155 ?auto_776158 ) ) ( not ( = ?auto_776155 ?auto_776159 ) ) ( not ( = ?auto_776155 ?auto_776160 ) ) ( not ( = ?auto_776156 ?auto_776157 ) ) ( not ( = ?auto_776156 ?auto_776158 ) ) ( not ( = ?auto_776156 ?auto_776159 ) ) ( not ( = ?auto_776156 ?auto_776160 ) ) ( not ( = ?auto_776157 ?auto_776158 ) ) ( not ( = ?auto_776157 ?auto_776159 ) ) ( not ( = ?auto_776157 ?auto_776160 ) ) ( not ( = ?auto_776158 ?auto_776159 ) ) ( not ( = ?auto_776158 ?auto_776160 ) ) ( not ( = ?auto_776159 ?auto_776160 ) ) ( CLEAR ?auto_776157 ) ( ON ?auto_776158 ?auto_776159 ) ( CLEAR ?auto_776158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_776150 ?auto_776151 ?auto_776152 ?auto_776153 ?auto_776154 ?auto_776155 ?auto_776156 ?auto_776157 ?auto_776158 )
      ( MAKE-10PILE ?auto_776150 ?auto_776151 ?auto_776152 ?auto_776153 ?auto_776154 ?auto_776155 ?auto_776156 ?auto_776157 ?auto_776158 ?auto_776159 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_776192 - BLOCK
      ?auto_776193 - BLOCK
      ?auto_776194 - BLOCK
      ?auto_776195 - BLOCK
      ?auto_776196 - BLOCK
      ?auto_776197 - BLOCK
      ?auto_776198 - BLOCK
      ?auto_776199 - BLOCK
      ?auto_776200 - BLOCK
      ?auto_776201 - BLOCK
    )
    :vars
    (
      ?auto_776202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_776201 ?auto_776202 ) ( ON-TABLE ?auto_776192 ) ( ON ?auto_776193 ?auto_776192 ) ( ON ?auto_776194 ?auto_776193 ) ( ON ?auto_776195 ?auto_776194 ) ( ON ?auto_776196 ?auto_776195 ) ( ON ?auto_776197 ?auto_776196 ) ( ON ?auto_776198 ?auto_776197 ) ( not ( = ?auto_776192 ?auto_776193 ) ) ( not ( = ?auto_776192 ?auto_776194 ) ) ( not ( = ?auto_776192 ?auto_776195 ) ) ( not ( = ?auto_776192 ?auto_776196 ) ) ( not ( = ?auto_776192 ?auto_776197 ) ) ( not ( = ?auto_776192 ?auto_776198 ) ) ( not ( = ?auto_776192 ?auto_776199 ) ) ( not ( = ?auto_776192 ?auto_776200 ) ) ( not ( = ?auto_776192 ?auto_776201 ) ) ( not ( = ?auto_776192 ?auto_776202 ) ) ( not ( = ?auto_776193 ?auto_776194 ) ) ( not ( = ?auto_776193 ?auto_776195 ) ) ( not ( = ?auto_776193 ?auto_776196 ) ) ( not ( = ?auto_776193 ?auto_776197 ) ) ( not ( = ?auto_776193 ?auto_776198 ) ) ( not ( = ?auto_776193 ?auto_776199 ) ) ( not ( = ?auto_776193 ?auto_776200 ) ) ( not ( = ?auto_776193 ?auto_776201 ) ) ( not ( = ?auto_776193 ?auto_776202 ) ) ( not ( = ?auto_776194 ?auto_776195 ) ) ( not ( = ?auto_776194 ?auto_776196 ) ) ( not ( = ?auto_776194 ?auto_776197 ) ) ( not ( = ?auto_776194 ?auto_776198 ) ) ( not ( = ?auto_776194 ?auto_776199 ) ) ( not ( = ?auto_776194 ?auto_776200 ) ) ( not ( = ?auto_776194 ?auto_776201 ) ) ( not ( = ?auto_776194 ?auto_776202 ) ) ( not ( = ?auto_776195 ?auto_776196 ) ) ( not ( = ?auto_776195 ?auto_776197 ) ) ( not ( = ?auto_776195 ?auto_776198 ) ) ( not ( = ?auto_776195 ?auto_776199 ) ) ( not ( = ?auto_776195 ?auto_776200 ) ) ( not ( = ?auto_776195 ?auto_776201 ) ) ( not ( = ?auto_776195 ?auto_776202 ) ) ( not ( = ?auto_776196 ?auto_776197 ) ) ( not ( = ?auto_776196 ?auto_776198 ) ) ( not ( = ?auto_776196 ?auto_776199 ) ) ( not ( = ?auto_776196 ?auto_776200 ) ) ( not ( = ?auto_776196 ?auto_776201 ) ) ( not ( = ?auto_776196 ?auto_776202 ) ) ( not ( = ?auto_776197 ?auto_776198 ) ) ( not ( = ?auto_776197 ?auto_776199 ) ) ( not ( = ?auto_776197 ?auto_776200 ) ) ( not ( = ?auto_776197 ?auto_776201 ) ) ( not ( = ?auto_776197 ?auto_776202 ) ) ( not ( = ?auto_776198 ?auto_776199 ) ) ( not ( = ?auto_776198 ?auto_776200 ) ) ( not ( = ?auto_776198 ?auto_776201 ) ) ( not ( = ?auto_776198 ?auto_776202 ) ) ( not ( = ?auto_776199 ?auto_776200 ) ) ( not ( = ?auto_776199 ?auto_776201 ) ) ( not ( = ?auto_776199 ?auto_776202 ) ) ( not ( = ?auto_776200 ?auto_776201 ) ) ( not ( = ?auto_776200 ?auto_776202 ) ) ( not ( = ?auto_776201 ?auto_776202 ) ) ( ON ?auto_776200 ?auto_776201 ) ( CLEAR ?auto_776198 ) ( ON ?auto_776199 ?auto_776200 ) ( CLEAR ?auto_776199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_776192 ?auto_776193 ?auto_776194 ?auto_776195 ?auto_776196 ?auto_776197 ?auto_776198 ?auto_776199 )
      ( MAKE-10PILE ?auto_776192 ?auto_776193 ?auto_776194 ?auto_776195 ?auto_776196 ?auto_776197 ?auto_776198 ?auto_776199 ?auto_776200 ?auto_776201 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_776234 - BLOCK
      ?auto_776235 - BLOCK
      ?auto_776236 - BLOCK
      ?auto_776237 - BLOCK
      ?auto_776238 - BLOCK
      ?auto_776239 - BLOCK
      ?auto_776240 - BLOCK
      ?auto_776241 - BLOCK
      ?auto_776242 - BLOCK
      ?auto_776243 - BLOCK
    )
    :vars
    (
      ?auto_776244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_776243 ?auto_776244 ) ( ON-TABLE ?auto_776234 ) ( ON ?auto_776235 ?auto_776234 ) ( ON ?auto_776236 ?auto_776235 ) ( ON ?auto_776237 ?auto_776236 ) ( ON ?auto_776238 ?auto_776237 ) ( ON ?auto_776239 ?auto_776238 ) ( not ( = ?auto_776234 ?auto_776235 ) ) ( not ( = ?auto_776234 ?auto_776236 ) ) ( not ( = ?auto_776234 ?auto_776237 ) ) ( not ( = ?auto_776234 ?auto_776238 ) ) ( not ( = ?auto_776234 ?auto_776239 ) ) ( not ( = ?auto_776234 ?auto_776240 ) ) ( not ( = ?auto_776234 ?auto_776241 ) ) ( not ( = ?auto_776234 ?auto_776242 ) ) ( not ( = ?auto_776234 ?auto_776243 ) ) ( not ( = ?auto_776234 ?auto_776244 ) ) ( not ( = ?auto_776235 ?auto_776236 ) ) ( not ( = ?auto_776235 ?auto_776237 ) ) ( not ( = ?auto_776235 ?auto_776238 ) ) ( not ( = ?auto_776235 ?auto_776239 ) ) ( not ( = ?auto_776235 ?auto_776240 ) ) ( not ( = ?auto_776235 ?auto_776241 ) ) ( not ( = ?auto_776235 ?auto_776242 ) ) ( not ( = ?auto_776235 ?auto_776243 ) ) ( not ( = ?auto_776235 ?auto_776244 ) ) ( not ( = ?auto_776236 ?auto_776237 ) ) ( not ( = ?auto_776236 ?auto_776238 ) ) ( not ( = ?auto_776236 ?auto_776239 ) ) ( not ( = ?auto_776236 ?auto_776240 ) ) ( not ( = ?auto_776236 ?auto_776241 ) ) ( not ( = ?auto_776236 ?auto_776242 ) ) ( not ( = ?auto_776236 ?auto_776243 ) ) ( not ( = ?auto_776236 ?auto_776244 ) ) ( not ( = ?auto_776237 ?auto_776238 ) ) ( not ( = ?auto_776237 ?auto_776239 ) ) ( not ( = ?auto_776237 ?auto_776240 ) ) ( not ( = ?auto_776237 ?auto_776241 ) ) ( not ( = ?auto_776237 ?auto_776242 ) ) ( not ( = ?auto_776237 ?auto_776243 ) ) ( not ( = ?auto_776237 ?auto_776244 ) ) ( not ( = ?auto_776238 ?auto_776239 ) ) ( not ( = ?auto_776238 ?auto_776240 ) ) ( not ( = ?auto_776238 ?auto_776241 ) ) ( not ( = ?auto_776238 ?auto_776242 ) ) ( not ( = ?auto_776238 ?auto_776243 ) ) ( not ( = ?auto_776238 ?auto_776244 ) ) ( not ( = ?auto_776239 ?auto_776240 ) ) ( not ( = ?auto_776239 ?auto_776241 ) ) ( not ( = ?auto_776239 ?auto_776242 ) ) ( not ( = ?auto_776239 ?auto_776243 ) ) ( not ( = ?auto_776239 ?auto_776244 ) ) ( not ( = ?auto_776240 ?auto_776241 ) ) ( not ( = ?auto_776240 ?auto_776242 ) ) ( not ( = ?auto_776240 ?auto_776243 ) ) ( not ( = ?auto_776240 ?auto_776244 ) ) ( not ( = ?auto_776241 ?auto_776242 ) ) ( not ( = ?auto_776241 ?auto_776243 ) ) ( not ( = ?auto_776241 ?auto_776244 ) ) ( not ( = ?auto_776242 ?auto_776243 ) ) ( not ( = ?auto_776242 ?auto_776244 ) ) ( not ( = ?auto_776243 ?auto_776244 ) ) ( ON ?auto_776242 ?auto_776243 ) ( ON ?auto_776241 ?auto_776242 ) ( CLEAR ?auto_776239 ) ( ON ?auto_776240 ?auto_776241 ) ( CLEAR ?auto_776240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_776234 ?auto_776235 ?auto_776236 ?auto_776237 ?auto_776238 ?auto_776239 ?auto_776240 )
      ( MAKE-10PILE ?auto_776234 ?auto_776235 ?auto_776236 ?auto_776237 ?auto_776238 ?auto_776239 ?auto_776240 ?auto_776241 ?auto_776242 ?auto_776243 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_776276 - BLOCK
      ?auto_776277 - BLOCK
      ?auto_776278 - BLOCK
      ?auto_776279 - BLOCK
      ?auto_776280 - BLOCK
      ?auto_776281 - BLOCK
      ?auto_776282 - BLOCK
      ?auto_776283 - BLOCK
      ?auto_776284 - BLOCK
      ?auto_776285 - BLOCK
    )
    :vars
    (
      ?auto_776286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_776285 ?auto_776286 ) ( ON-TABLE ?auto_776276 ) ( ON ?auto_776277 ?auto_776276 ) ( ON ?auto_776278 ?auto_776277 ) ( ON ?auto_776279 ?auto_776278 ) ( ON ?auto_776280 ?auto_776279 ) ( not ( = ?auto_776276 ?auto_776277 ) ) ( not ( = ?auto_776276 ?auto_776278 ) ) ( not ( = ?auto_776276 ?auto_776279 ) ) ( not ( = ?auto_776276 ?auto_776280 ) ) ( not ( = ?auto_776276 ?auto_776281 ) ) ( not ( = ?auto_776276 ?auto_776282 ) ) ( not ( = ?auto_776276 ?auto_776283 ) ) ( not ( = ?auto_776276 ?auto_776284 ) ) ( not ( = ?auto_776276 ?auto_776285 ) ) ( not ( = ?auto_776276 ?auto_776286 ) ) ( not ( = ?auto_776277 ?auto_776278 ) ) ( not ( = ?auto_776277 ?auto_776279 ) ) ( not ( = ?auto_776277 ?auto_776280 ) ) ( not ( = ?auto_776277 ?auto_776281 ) ) ( not ( = ?auto_776277 ?auto_776282 ) ) ( not ( = ?auto_776277 ?auto_776283 ) ) ( not ( = ?auto_776277 ?auto_776284 ) ) ( not ( = ?auto_776277 ?auto_776285 ) ) ( not ( = ?auto_776277 ?auto_776286 ) ) ( not ( = ?auto_776278 ?auto_776279 ) ) ( not ( = ?auto_776278 ?auto_776280 ) ) ( not ( = ?auto_776278 ?auto_776281 ) ) ( not ( = ?auto_776278 ?auto_776282 ) ) ( not ( = ?auto_776278 ?auto_776283 ) ) ( not ( = ?auto_776278 ?auto_776284 ) ) ( not ( = ?auto_776278 ?auto_776285 ) ) ( not ( = ?auto_776278 ?auto_776286 ) ) ( not ( = ?auto_776279 ?auto_776280 ) ) ( not ( = ?auto_776279 ?auto_776281 ) ) ( not ( = ?auto_776279 ?auto_776282 ) ) ( not ( = ?auto_776279 ?auto_776283 ) ) ( not ( = ?auto_776279 ?auto_776284 ) ) ( not ( = ?auto_776279 ?auto_776285 ) ) ( not ( = ?auto_776279 ?auto_776286 ) ) ( not ( = ?auto_776280 ?auto_776281 ) ) ( not ( = ?auto_776280 ?auto_776282 ) ) ( not ( = ?auto_776280 ?auto_776283 ) ) ( not ( = ?auto_776280 ?auto_776284 ) ) ( not ( = ?auto_776280 ?auto_776285 ) ) ( not ( = ?auto_776280 ?auto_776286 ) ) ( not ( = ?auto_776281 ?auto_776282 ) ) ( not ( = ?auto_776281 ?auto_776283 ) ) ( not ( = ?auto_776281 ?auto_776284 ) ) ( not ( = ?auto_776281 ?auto_776285 ) ) ( not ( = ?auto_776281 ?auto_776286 ) ) ( not ( = ?auto_776282 ?auto_776283 ) ) ( not ( = ?auto_776282 ?auto_776284 ) ) ( not ( = ?auto_776282 ?auto_776285 ) ) ( not ( = ?auto_776282 ?auto_776286 ) ) ( not ( = ?auto_776283 ?auto_776284 ) ) ( not ( = ?auto_776283 ?auto_776285 ) ) ( not ( = ?auto_776283 ?auto_776286 ) ) ( not ( = ?auto_776284 ?auto_776285 ) ) ( not ( = ?auto_776284 ?auto_776286 ) ) ( not ( = ?auto_776285 ?auto_776286 ) ) ( ON ?auto_776284 ?auto_776285 ) ( ON ?auto_776283 ?auto_776284 ) ( ON ?auto_776282 ?auto_776283 ) ( CLEAR ?auto_776280 ) ( ON ?auto_776281 ?auto_776282 ) ( CLEAR ?auto_776281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_776276 ?auto_776277 ?auto_776278 ?auto_776279 ?auto_776280 ?auto_776281 )
      ( MAKE-10PILE ?auto_776276 ?auto_776277 ?auto_776278 ?auto_776279 ?auto_776280 ?auto_776281 ?auto_776282 ?auto_776283 ?auto_776284 ?auto_776285 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_776318 - BLOCK
      ?auto_776319 - BLOCK
      ?auto_776320 - BLOCK
      ?auto_776321 - BLOCK
      ?auto_776322 - BLOCK
      ?auto_776323 - BLOCK
      ?auto_776324 - BLOCK
      ?auto_776325 - BLOCK
      ?auto_776326 - BLOCK
      ?auto_776327 - BLOCK
    )
    :vars
    (
      ?auto_776328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_776327 ?auto_776328 ) ( ON-TABLE ?auto_776318 ) ( ON ?auto_776319 ?auto_776318 ) ( ON ?auto_776320 ?auto_776319 ) ( ON ?auto_776321 ?auto_776320 ) ( not ( = ?auto_776318 ?auto_776319 ) ) ( not ( = ?auto_776318 ?auto_776320 ) ) ( not ( = ?auto_776318 ?auto_776321 ) ) ( not ( = ?auto_776318 ?auto_776322 ) ) ( not ( = ?auto_776318 ?auto_776323 ) ) ( not ( = ?auto_776318 ?auto_776324 ) ) ( not ( = ?auto_776318 ?auto_776325 ) ) ( not ( = ?auto_776318 ?auto_776326 ) ) ( not ( = ?auto_776318 ?auto_776327 ) ) ( not ( = ?auto_776318 ?auto_776328 ) ) ( not ( = ?auto_776319 ?auto_776320 ) ) ( not ( = ?auto_776319 ?auto_776321 ) ) ( not ( = ?auto_776319 ?auto_776322 ) ) ( not ( = ?auto_776319 ?auto_776323 ) ) ( not ( = ?auto_776319 ?auto_776324 ) ) ( not ( = ?auto_776319 ?auto_776325 ) ) ( not ( = ?auto_776319 ?auto_776326 ) ) ( not ( = ?auto_776319 ?auto_776327 ) ) ( not ( = ?auto_776319 ?auto_776328 ) ) ( not ( = ?auto_776320 ?auto_776321 ) ) ( not ( = ?auto_776320 ?auto_776322 ) ) ( not ( = ?auto_776320 ?auto_776323 ) ) ( not ( = ?auto_776320 ?auto_776324 ) ) ( not ( = ?auto_776320 ?auto_776325 ) ) ( not ( = ?auto_776320 ?auto_776326 ) ) ( not ( = ?auto_776320 ?auto_776327 ) ) ( not ( = ?auto_776320 ?auto_776328 ) ) ( not ( = ?auto_776321 ?auto_776322 ) ) ( not ( = ?auto_776321 ?auto_776323 ) ) ( not ( = ?auto_776321 ?auto_776324 ) ) ( not ( = ?auto_776321 ?auto_776325 ) ) ( not ( = ?auto_776321 ?auto_776326 ) ) ( not ( = ?auto_776321 ?auto_776327 ) ) ( not ( = ?auto_776321 ?auto_776328 ) ) ( not ( = ?auto_776322 ?auto_776323 ) ) ( not ( = ?auto_776322 ?auto_776324 ) ) ( not ( = ?auto_776322 ?auto_776325 ) ) ( not ( = ?auto_776322 ?auto_776326 ) ) ( not ( = ?auto_776322 ?auto_776327 ) ) ( not ( = ?auto_776322 ?auto_776328 ) ) ( not ( = ?auto_776323 ?auto_776324 ) ) ( not ( = ?auto_776323 ?auto_776325 ) ) ( not ( = ?auto_776323 ?auto_776326 ) ) ( not ( = ?auto_776323 ?auto_776327 ) ) ( not ( = ?auto_776323 ?auto_776328 ) ) ( not ( = ?auto_776324 ?auto_776325 ) ) ( not ( = ?auto_776324 ?auto_776326 ) ) ( not ( = ?auto_776324 ?auto_776327 ) ) ( not ( = ?auto_776324 ?auto_776328 ) ) ( not ( = ?auto_776325 ?auto_776326 ) ) ( not ( = ?auto_776325 ?auto_776327 ) ) ( not ( = ?auto_776325 ?auto_776328 ) ) ( not ( = ?auto_776326 ?auto_776327 ) ) ( not ( = ?auto_776326 ?auto_776328 ) ) ( not ( = ?auto_776327 ?auto_776328 ) ) ( ON ?auto_776326 ?auto_776327 ) ( ON ?auto_776325 ?auto_776326 ) ( ON ?auto_776324 ?auto_776325 ) ( ON ?auto_776323 ?auto_776324 ) ( CLEAR ?auto_776321 ) ( ON ?auto_776322 ?auto_776323 ) ( CLEAR ?auto_776322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_776318 ?auto_776319 ?auto_776320 ?auto_776321 ?auto_776322 )
      ( MAKE-10PILE ?auto_776318 ?auto_776319 ?auto_776320 ?auto_776321 ?auto_776322 ?auto_776323 ?auto_776324 ?auto_776325 ?auto_776326 ?auto_776327 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_776360 - BLOCK
      ?auto_776361 - BLOCK
      ?auto_776362 - BLOCK
      ?auto_776363 - BLOCK
      ?auto_776364 - BLOCK
      ?auto_776365 - BLOCK
      ?auto_776366 - BLOCK
      ?auto_776367 - BLOCK
      ?auto_776368 - BLOCK
      ?auto_776369 - BLOCK
    )
    :vars
    (
      ?auto_776370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_776369 ?auto_776370 ) ( ON-TABLE ?auto_776360 ) ( ON ?auto_776361 ?auto_776360 ) ( ON ?auto_776362 ?auto_776361 ) ( not ( = ?auto_776360 ?auto_776361 ) ) ( not ( = ?auto_776360 ?auto_776362 ) ) ( not ( = ?auto_776360 ?auto_776363 ) ) ( not ( = ?auto_776360 ?auto_776364 ) ) ( not ( = ?auto_776360 ?auto_776365 ) ) ( not ( = ?auto_776360 ?auto_776366 ) ) ( not ( = ?auto_776360 ?auto_776367 ) ) ( not ( = ?auto_776360 ?auto_776368 ) ) ( not ( = ?auto_776360 ?auto_776369 ) ) ( not ( = ?auto_776360 ?auto_776370 ) ) ( not ( = ?auto_776361 ?auto_776362 ) ) ( not ( = ?auto_776361 ?auto_776363 ) ) ( not ( = ?auto_776361 ?auto_776364 ) ) ( not ( = ?auto_776361 ?auto_776365 ) ) ( not ( = ?auto_776361 ?auto_776366 ) ) ( not ( = ?auto_776361 ?auto_776367 ) ) ( not ( = ?auto_776361 ?auto_776368 ) ) ( not ( = ?auto_776361 ?auto_776369 ) ) ( not ( = ?auto_776361 ?auto_776370 ) ) ( not ( = ?auto_776362 ?auto_776363 ) ) ( not ( = ?auto_776362 ?auto_776364 ) ) ( not ( = ?auto_776362 ?auto_776365 ) ) ( not ( = ?auto_776362 ?auto_776366 ) ) ( not ( = ?auto_776362 ?auto_776367 ) ) ( not ( = ?auto_776362 ?auto_776368 ) ) ( not ( = ?auto_776362 ?auto_776369 ) ) ( not ( = ?auto_776362 ?auto_776370 ) ) ( not ( = ?auto_776363 ?auto_776364 ) ) ( not ( = ?auto_776363 ?auto_776365 ) ) ( not ( = ?auto_776363 ?auto_776366 ) ) ( not ( = ?auto_776363 ?auto_776367 ) ) ( not ( = ?auto_776363 ?auto_776368 ) ) ( not ( = ?auto_776363 ?auto_776369 ) ) ( not ( = ?auto_776363 ?auto_776370 ) ) ( not ( = ?auto_776364 ?auto_776365 ) ) ( not ( = ?auto_776364 ?auto_776366 ) ) ( not ( = ?auto_776364 ?auto_776367 ) ) ( not ( = ?auto_776364 ?auto_776368 ) ) ( not ( = ?auto_776364 ?auto_776369 ) ) ( not ( = ?auto_776364 ?auto_776370 ) ) ( not ( = ?auto_776365 ?auto_776366 ) ) ( not ( = ?auto_776365 ?auto_776367 ) ) ( not ( = ?auto_776365 ?auto_776368 ) ) ( not ( = ?auto_776365 ?auto_776369 ) ) ( not ( = ?auto_776365 ?auto_776370 ) ) ( not ( = ?auto_776366 ?auto_776367 ) ) ( not ( = ?auto_776366 ?auto_776368 ) ) ( not ( = ?auto_776366 ?auto_776369 ) ) ( not ( = ?auto_776366 ?auto_776370 ) ) ( not ( = ?auto_776367 ?auto_776368 ) ) ( not ( = ?auto_776367 ?auto_776369 ) ) ( not ( = ?auto_776367 ?auto_776370 ) ) ( not ( = ?auto_776368 ?auto_776369 ) ) ( not ( = ?auto_776368 ?auto_776370 ) ) ( not ( = ?auto_776369 ?auto_776370 ) ) ( ON ?auto_776368 ?auto_776369 ) ( ON ?auto_776367 ?auto_776368 ) ( ON ?auto_776366 ?auto_776367 ) ( ON ?auto_776365 ?auto_776366 ) ( ON ?auto_776364 ?auto_776365 ) ( CLEAR ?auto_776362 ) ( ON ?auto_776363 ?auto_776364 ) ( CLEAR ?auto_776363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_776360 ?auto_776361 ?auto_776362 ?auto_776363 )
      ( MAKE-10PILE ?auto_776360 ?auto_776361 ?auto_776362 ?auto_776363 ?auto_776364 ?auto_776365 ?auto_776366 ?auto_776367 ?auto_776368 ?auto_776369 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_776402 - BLOCK
      ?auto_776403 - BLOCK
      ?auto_776404 - BLOCK
      ?auto_776405 - BLOCK
      ?auto_776406 - BLOCK
      ?auto_776407 - BLOCK
      ?auto_776408 - BLOCK
      ?auto_776409 - BLOCK
      ?auto_776410 - BLOCK
      ?auto_776411 - BLOCK
    )
    :vars
    (
      ?auto_776412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_776411 ?auto_776412 ) ( ON-TABLE ?auto_776402 ) ( ON ?auto_776403 ?auto_776402 ) ( not ( = ?auto_776402 ?auto_776403 ) ) ( not ( = ?auto_776402 ?auto_776404 ) ) ( not ( = ?auto_776402 ?auto_776405 ) ) ( not ( = ?auto_776402 ?auto_776406 ) ) ( not ( = ?auto_776402 ?auto_776407 ) ) ( not ( = ?auto_776402 ?auto_776408 ) ) ( not ( = ?auto_776402 ?auto_776409 ) ) ( not ( = ?auto_776402 ?auto_776410 ) ) ( not ( = ?auto_776402 ?auto_776411 ) ) ( not ( = ?auto_776402 ?auto_776412 ) ) ( not ( = ?auto_776403 ?auto_776404 ) ) ( not ( = ?auto_776403 ?auto_776405 ) ) ( not ( = ?auto_776403 ?auto_776406 ) ) ( not ( = ?auto_776403 ?auto_776407 ) ) ( not ( = ?auto_776403 ?auto_776408 ) ) ( not ( = ?auto_776403 ?auto_776409 ) ) ( not ( = ?auto_776403 ?auto_776410 ) ) ( not ( = ?auto_776403 ?auto_776411 ) ) ( not ( = ?auto_776403 ?auto_776412 ) ) ( not ( = ?auto_776404 ?auto_776405 ) ) ( not ( = ?auto_776404 ?auto_776406 ) ) ( not ( = ?auto_776404 ?auto_776407 ) ) ( not ( = ?auto_776404 ?auto_776408 ) ) ( not ( = ?auto_776404 ?auto_776409 ) ) ( not ( = ?auto_776404 ?auto_776410 ) ) ( not ( = ?auto_776404 ?auto_776411 ) ) ( not ( = ?auto_776404 ?auto_776412 ) ) ( not ( = ?auto_776405 ?auto_776406 ) ) ( not ( = ?auto_776405 ?auto_776407 ) ) ( not ( = ?auto_776405 ?auto_776408 ) ) ( not ( = ?auto_776405 ?auto_776409 ) ) ( not ( = ?auto_776405 ?auto_776410 ) ) ( not ( = ?auto_776405 ?auto_776411 ) ) ( not ( = ?auto_776405 ?auto_776412 ) ) ( not ( = ?auto_776406 ?auto_776407 ) ) ( not ( = ?auto_776406 ?auto_776408 ) ) ( not ( = ?auto_776406 ?auto_776409 ) ) ( not ( = ?auto_776406 ?auto_776410 ) ) ( not ( = ?auto_776406 ?auto_776411 ) ) ( not ( = ?auto_776406 ?auto_776412 ) ) ( not ( = ?auto_776407 ?auto_776408 ) ) ( not ( = ?auto_776407 ?auto_776409 ) ) ( not ( = ?auto_776407 ?auto_776410 ) ) ( not ( = ?auto_776407 ?auto_776411 ) ) ( not ( = ?auto_776407 ?auto_776412 ) ) ( not ( = ?auto_776408 ?auto_776409 ) ) ( not ( = ?auto_776408 ?auto_776410 ) ) ( not ( = ?auto_776408 ?auto_776411 ) ) ( not ( = ?auto_776408 ?auto_776412 ) ) ( not ( = ?auto_776409 ?auto_776410 ) ) ( not ( = ?auto_776409 ?auto_776411 ) ) ( not ( = ?auto_776409 ?auto_776412 ) ) ( not ( = ?auto_776410 ?auto_776411 ) ) ( not ( = ?auto_776410 ?auto_776412 ) ) ( not ( = ?auto_776411 ?auto_776412 ) ) ( ON ?auto_776410 ?auto_776411 ) ( ON ?auto_776409 ?auto_776410 ) ( ON ?auto_776408 ?auto_776409 ) ( ON ?auto_776407 ?auto_776408 ) ( ON ?auto_776406 ?auto_776407 ) ( ON ?auto_776405 ?auto_776406 ) ( CLEAR ?auto_776403 ) ( ON ?auto_776404 ?auto_776405 ) ( CLEAR ?auto_776404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_776402 ?auto_776403 ?auto_776404 )
      ( MAKE-10PILE ?auto_776402 ?auto_776403 ?auto_776404 ?auto_776405 ?auto_776406 ?auto_776407 ?auto_776408 ?auto_776409 ?auto_776410 ?auto_776411 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_776444 - BLOCK
      ?auto_776445 - BLOCK
      ?auto_776446 - BLOCK
      ?auto_776447 - BLOCK
      ?auto_776448 - BLOCK
      ?auto_776449 - BLOCK
      ?auto_776450 - BLOCK
      ?auto_776451 - BLOCK
      ?auto_776452 - BLOCK
      ?auto_776453 - BLOCK
    )
    :vars
    (
      ?auto_776454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_776453 ?auto_776454 ) ( ON-TABLE ?auto_776444 ) ( not ( = ?auto_776444 ?auto_776445 ) ) ( not ( = ?auto_776444 ?auto_776446 ) ) ( not ( = ?auto_776444 ?auto_776447 ) ) ( not ( = ?auto_776444 ?auto_776448 ) ) ( not ( = ?auto_776444 ?auto_776449 ) ) ( not ( = ?auto_776444 ?auto_776450 ) ) ( not ( = ?auto_776444 ?auto_776451 ) ) ( not ( = ?auto_776444 ?auto_776452 ) ) ( not ( = ?auto_776444 ?auto_776453 ) ) ( not ( = ?auto_776444 ?auto_776454 ) ) ( not ( = ?auto_776445 ?auto_776446 ) ) ( not ( = ?auto_776445 ?auto_776447 ) ) ( not ( = ?auto_776445 ?auto_776448 ) ) ( not ( = ?auto_776445 ?auto_776449 ) ) ( not ( = ?auto_776445 ?auto_776450 ) ) ( not ( = ?auto_776445 ?auto_776451 ) ) ( not ( = ?auto_776445 ?auto_776452 ) ) ( not ( = ?auto_776445 ?auto_776453 ) ) ( not ( = ?auto_776445 ?auto_776454 ) ) ( not ( = ?auto_776446 ?auto_776447 ) ) ( not ( = ?auto_776446 ?auto_776448 ) ) ( not ( = ?auto_776446 ?auto_776449 ) ) ( not ( = ?auto_776446 ?auto_776450 ) ) ( not ( = ?auto_776446 ?auto_776451 ) ) ( not ( = ?auto_776446 ?auto_776452 ) ) ( not ( = ?auto_776446 ?auto_776453 ) ) ( not ( = ?auto_776446 ?auto_776454 ) ) ( not ( = ?auto_776447 ?auto_776448 ) ) ( not ( = ?auto_776447 ?auto_776449 ) ) ( not ( = ?auto_776447 ?auto_776450 ) ) ( not ( = ?auto_776447 ?auto_776451 ) ) ( not ( = ?auto_776447 ?auto_776452 ) ) ( not ( = ?auto_776447 ?auto_776453 ) ) ( not ( = ?auto_776447 ?auto_776454 ) ) ( not ( = ?auto_776448 ?auto_776449 ) ) ( not ( = ?auto_776448 ?auto_776450 ) ) ( not ( = ?auto_776448 ?auto_776451 ) ) ( not ( = ?auto_776448 ?auto_776452 ) ) ( not ( = ?auto_776448 ?auto_776453 ) ) ( not ( = ?auto_776448 ?auto_776454 ) ) ( not ( = ?auto_776449 ?auto_776450 ) ) ( not ( = ?auto_776449 ?auto_776451 ) ) ( not ( = ?auto_776449 ?auto_776452 ) ) ( not ( = ?auto_776449 ?auto_776453 ) ) ( not ( = ?auto_776449 ?auto_776454 ) ) ( not ( = ?auto_776450 ?auto_776451 ) ) ( not ( = ?auto_776450 ?auto_776452 ) ) ( not ( = ?auto_776450 ?auto_776453 ) ) ( not ( = ?auto_776450 ?auto_776454 ) ) ( not ( = ?auto_776451 ?auto_776452 ) ) ( not ( = ?auto_776451 ?auto_776453 ) ) ( not ( = ?auto_776451 ?auto_776454 ) ) ( not ( = ?auto_776452 ?auto_776453 ) ) ( not ( = ?auto_776452 ?auto_776454 ) ) ( not ( = ?auto_776453 ?auto_776454 ) ) ( ON ?auto_776452 ?auto_776453 ) ( ON ?auto_776451 ?auto_776452 ) ( ON ?auto_776450 ?auto_776451 ) ( ON ?auto_776449 ?auto_776450 ) ( ON ?auto_776448 ?auto_776449 ) ( ON ?auto_776447 ?auto_776448 ) ( ON ?auto_776446 ?auto_776447 ) ( CLEAR ?auto_776444 ) ( ON ?auto_776445 ?auto_776446 ) ( CLEAR ?auto_776445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_776444 ?auto_776445 )
      ( MAKE-10PILE ?auto_776444 ?auto_776445 ?auto_776446 ?auto_776447 ?auto_776448 ?auto_776449 ?auto_776450 ?auto_776451 ?auto_776452 ?auto_776453 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_776486 - BLOCK
      ?auto_776487 - BLOCK
      ?auto_776488 - BLOCK
      ?auto_776489 - BLOCK
      ?auto_776490 - BLOCK
      ?auto_776491 - BLOCK
      ?auto_776492 - BLOCK
      ?auto_776493 - BLOCK
      ?auto_776494 - BLOCK
      ?auto_776495 - BLOCK
    )
    :vars
    (
      ?auto_776496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_776495 ?auto_776496 ) ( not ( = ?auto_776486 ?auto_776487 ) ) ( not ( = ?auto_776486 ?auto_776488 ) ) ( not ( = ?auto_776486 ?auto_776489 ) ) ( not ( = ?auto_776486 ?auto_776490 ) ) ( not ( = ?auto_776486 ?auto_776491 ) ) ( not ( = ?auto_776486 ?auto_776492 ) ) ( not ( = ?auto_776486 ?auto_776493 ) ) ( not ( = ?auto_776486 ?auto_776494 ) ) ( not ( = ?auto_776486 ?auto_776495 ) ) ( not ( = ?auto_776486 ?auto_776496 ) ) ( not ( = ?auto_776487 ?auto_776488 ) ) ( not ( = ?auto_776487 ?auto_776489 ) ) ( not ( = ?auto_776487 ?auto_776490 ) ) ( not ( = ?auto_776487 ?auto_776491 ) ) ( not ( = ?auto_776487 ?auto_776492 ) ) ( not ( = ?auto_776487 ?auto_776493 ) ) ( not ( = ?auto_776487 ?auto_776494 ) ) ( not ( = ?auto_776487 ?auto_776495 ) ) ( not ( = ?auto_776487 ?auto_776496 ) ) ( not ( = ?auto_776488 ?auto_776489 ) ) ( not ( = ?auto_776488 ?auto_776490 ) ) ( not ( = ?auto_776488 ?auto_776491 ) ) ( not ( = ?auto_776488 ?auto_776492 ) ) ( not ( = ?auto_776488 ?auto_776493 ) ) ( not ( = ?auto_776488 ?auto_776494 ) ) ( not ( = ?auto_776488 ?auto_776495 ) ) ( not ( = ?auto_776488 ?auto_776496 ) ) ( not ( = ?auto_776489 ?auto_776490 ) ) ( not ( = ?auto_776489 ?auto_776491 ) ) ( not ( = ?auto_776489 ?auto_776492 ) ) ( not ( = ?auto_776489 ?auto_776493 ) ) ( not ( = ?auto_776489 ?auto_776494 ) ) ( not ( = ?auto_776489 ?auto_776495 ) ) ( not ( = ?auto_776489 ?auto_776496 ) ) ( not ( = ?auto_776490 ?auto_776491 ) ) ( not ( = ?auto_776490 ?auto_776492 ) ) ( not ( = ?auto_776490 ?auto_776493 ) ) ( not ( = ?auto_776490 ?auto_776494 ) ) ( not ( = ?auto_776490 ?auto_776495 ) ) ( not ( = ?auto_776490 ?auto_776496 ) ) ( not ( = ?auto_776491 ?auto_776492 ) ) ( not ( = ?auto_776491 ?auto_776493 ) ) ( not ( = ?auto_776491 ?auto_776494 ) ) ( not ( = ?auto_776491 ?auto_776495 ) ) ( not ( = ?auto_776491 ?auto_776496 ) ) ( not ( = ?auto_776492 ?auto_776493 ) ) ( not ( = ?auto_776492 ?auto_776494 ) ) ( not ( = ?auto_776492 ?auto_776495 ) ) ( not ( = ?auto_776492 ?auto_776496 ) ) ( not ( = ?auto_776493 ?auto_776494 ) ) ( not ( = ?auto_776493 ?auto_776495 ) ) ( not ( = ?auto_776493 ?auto_776496 ) ) ( not ( = ?auto_776494 ?auto_776495 ) ) ( not ( = ?auto_776494 ?auto_776496 ) ) ( not ( = ?auto_776495 ?auto_776496 ) ) ( ON ?auto_776494 ?auto_776495 ) ( ON ?auto_776493 ?auto_776494 ) ( ON ?auto_776492 ?auto_776493 ) ( ON ?auto_776491 ?auto_776492 ) ( ON ?auto_776490 ?auto_776491 ) ( ON ?auto_776489 ?auto_776490 ) ( ON ?auto_776488 ?auto_776489 ) ( ON ?auto_776487 ?auto_776488 ) ( ON ?auto_776486 ?auto_776487 ) ( CLEAR ?auto_776486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_776486 )
      ( MAKE-10PILE ?auto_776486 ?auto_776487 ?auto_776488 ?auto_776489 ?auto_776490 ?auto_776491 ?auto_776492 ?auto_776493 ?auto_776494 ?auto_776495 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_776529 - BLOCK
      ?auto_776530 - BLOCK
      ?auto_776531 - BLOCK
      ?auto_776532 - BLOCK
      ?auto_776533 - BLOCK
      ?auto_776534 - BLOCK
      ?auto_776535 - BLOCK
      ?auto_776536 - BLOCK
      ?auto_776537 - BLOCK
      ?auto_776538 - BLOCK
      ?auto_776539 - BLOCK
    )
    :vars
    (
      ?auto_776540 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_776538 ) ( ON ?auto_776539 ?auto_776540 ) ( CLEAR ?auto_776539 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_776529 ) ( ON ?auto_776530 ?auto_776529 ) ( ON ?auto_776531 ?auto_776530 ) ( ON ?auto_776532 ?auto_776531 ) ( ON ?auto_776533 ?auto_776532 ) ( ON ?auto_776534 ?auto_776533 ) ( ON ?auto_776535 ?auto_776534 ) ( ON ?auto_776536 ?auto_776535 ) ( ON ?auto_776537 ?auto_776536 ) ( ON ?auto_776538 ?auto_776537 ) ( not ( = ?auto_776529 ?auto_776530 ) ) ( not ( = ?auto_776529 ?auto_776531 ) ) ( not ( = ?auto_776529 ?auto_776532 ) ) ( not ( = ?auto_776529 ?auto_776533 ) ) ( not ( = ?auto_776529 ?auto_776534 ) ) ( not ( = ?auto_776529 ?auto_776535 ) ) ( not ( = ?auto_776529 ?auto_776536 ) ) ( not ( = ?auto_776529 ?auto_776537 ) ) ( not ( = ?auto_776529 ?auto_776538 ) ) ( not ( = ?auto_776529 ?auto_776539 ) ) ( not ( = ?auto_776529 ?auto_776540 ) ) ( not ( = ?auto_776530 ?auto_776531 ) ) ( not ( = ?auto_776530 ?auto_776532 ) ) ( not ( = ?auto_776530 ?auto_776533 ) ) ( not ( = ?auto_776530 ?auto_776534 ) ) ( not ( = ?auto_776530 ?auto_776535 ) ) ( not ( = ?auto_776530 ?auto_776536 ) ) ( not ( = ?auto_776530 ?auto_776537 ) ) ( not ( = ?auto_776530 ?auto_776538 ) ) ( not ( = ?auto_776530 ?auto_776539 ) ) ( not ( = ?auto_776530 ?auto_776540 ) ) ( not ( = ?auto_776531 ?auto_776532 ) ) ( not ( = ?auto_776531 ?auto_776533 ) ) ( not ( = ?auto_776531 ?auto_776534 ) ) ( not ( = ?auto_776531 ?auto_776535 ) ) ( not ( = ?auto_776531 ?auto_776536 ) ) ( not ( = ?auto_776531 ?auto_776537 ) ) ( not ( = ?auto_776531 ?auto_776538 ) ) ( not ( = ?auto_776531 ?auto_776539 ) ) ( not ( = ?auto_776531 ?auto_776540 ) ) ( not ( = ?auto_776532 ?auto_776533 ) ) ( not ( = ?auto_776532 ?auto_776534 ) ) ( not ( = ?auto_776532 ?auto_776535 ) ) ( not ( = ?auto_776532 ?auto_776536 ) ) ( not ( = ?auto_776532 ?auto_776537 ) ) ( not ( = ?auto_776532 ?auto_776538 ) ) ( not ( = ?auto_776532 ?auto_776539 ) ) ( not ( = ?auto_776532 ?auto_776540 ) ) ( not ( = ?auto_776533 ?auto_776534 ) ) ( not ( = ?auto_776533 ?auto_776535 ) ) ( not ( = ?auto_776533 ?auto_776536 ) ) ( not ( = ?auto_776533 ?auto_776537 ) ) ( not ( = ?auto_776533 ?auto_776538 ) ) ( not ( = ?auto_776533 ?auto_776539 ) ) ( not ( = ?auto_776533 ?auto_776540 ) ) ( not ( = ?auto_776534 ?auto_776535 ) ) ( not ( = ?auto_776534 ?auto_776536 ) ) ( not ( = ?auto_776534 ?auto_776537 ) ) ( not ( = ?auto_776534 ?auto_776538 ) ) ( not ( = ?auto_776534 ?auto_776539 ) ) ( not ( = ?auto_776534 ?auto_776540 ) ) ( not ( = ?auto_776535 ?auto_776536 ) ) ( not ( = ?auto_776535 ?auto_776537 ) ) ( not ( = ?auto_776535 ?auto_776538 ) ) ( not ( = ?auto_776535 ?auto_776539 ) ) ( not ( = ?auto_776535 ?auto_776540 ) ) ( not ( = ?auto_776536 ?auto_776537 ) ) ( not ( = ?auto_776536 ?auto_776538 ) ) ( not ( = ?auto_776536 ?auto_776539 ) ) ( not ( = ?auto_776536 ?auto_776540 ) ) ( not ( = ?auto_776537 ?auto_776538 ) ) ( not ( = ?auto_776537 ?auto_776539 ) ) ( not ( = ?auto_776537 ?auto_776540 ) ) ( not ( = ?auto_776538 ?auto_776539 ) ) ( not ( = ?auto_776538 ?auto_776540 ) ) ( not ( = ?auto_776539 ?auto_776540 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_776539 ?auto_776540 )
      ( !STACK ?auto_776539 ?auto_776538 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_776575 - BLOCK
      ?auto_776576 - BLOCK
      ?auto_776577 - BLOCK
      ?auto_776578 - BLOCK
      ?auto_776579 - BLOCK
      ?auto_776580 - BLOCK
      ?auto_776581 - BLOCK
      ?auto_776582 - BLOCK
      ?auto_776583 - BLOCK
      ?auto_776584 - BLOCK
      ?auto_776585 - BLOCK
    )
    :vars
    (
      ?auto_776586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_776585 ?auto_776586 ) ( ON-TABLE ?auto_776575 ) ( ON ?auto_776576 ?auto_776575 ) ( ON ?auto_776577 ?auto_776576 ) ( ON ?auto_776578 ?auto_776577 ) ( ON ?auto_776579 ?auto_776578 ) ( ON ?auto_776580 ?auto_776579 ) ( ON ?auto_776581 ?auto_776580 ) ( ON ?auto_776582 ?auto_776581 ) ( ON ?auto_776583 ?auto_776582 ) ( not ( = ?auto_776575 ?auto_776576 ) ) ( not ( = ?auto_776575 ?auto_776577 ) ) ( not ( = ?auto_776575 ?auto_776578 ) ) ( not ( = ?auto_776575 ?auto_776579 ) ) ( not ( = ?auto_776575 ?auto_776580 ) ) ( not ( = ?auto_776575 ?auto_776581 ) ) ( not ( = ?auto_776575 ?auto_776582 ) ) ( not ( = ?auto_776575 ?auto_776583 ) ) ( not ( = ?auto_776575 ?auto_776584 ) ) ( not ( = ?auto_776575 ?auto_776585 ) ) ( not ( = ?auto_776575 ?auto_776586 ) ) ( not ( = ?auto_776576 ?auto_776577 ) ) ( not ( = ?auto_776576 ?auto_776578 ) ) ( not ( = ?auto_776576 ?auto_776579 ) ) ( not ( = ?auto_776576 ?auto_776580 ) ) ( not ( = ?auto_776576 ?auto_776581 ) ) ( not ( = ?auto_776576 ?auto_776582 ) ) ( not ( = ?auto_776576 ?auto_776583 ) ) ( not ( = ?auto_776576 ?auto_776584 ) ) ( not ( = ?auto_776576 ?auto_776585 ) ) ( not ( = ?auto_776576 ?auto_776586 ) ) ( not ( = ?auto_776577 ?auto_776578 ) ) ( not ( = ?auto_776577 ?auto_776579 ) ) ( not ( = ?auto_776577 ?auto_776580 ) ) ( not ( = ?auto_776577 ?auto_776581 ) ) ( not ( = ?auto_776577 ?auto_776582 ) ) ( not ( = ?auto_776577 ?auto_776583 ) ) ( not ( = ?auto_776577 ?auto_776584 ) ) ( not ( = ?auto_776577 ?auto_776585 ) ) ( not ( = ?auto_776577 ?auto_776586 ) ) ( not ( = ?auto_776578 ?auto_776579 ) ) ( not ( = ?auto_776578 ?auto_776580 ) ) ( not ( = ?auto_776578 ?auto_776581 ) ) ( not ( = ?auto_776578 ?auto_776582 ) ) ( not ( = ?auto_776578 ?auto_776583 ) ) ( not ( = ?auto_776578 ?auto_776584 ) ) ( not ( = ?auto_776578 ?auto_776585 ) ) ( not ( = ?auto_776578 ?auto_776586 ) ) ( not ( = ?auto_776579 ?auto_776580 ) ) ( not ( = ?auto_776579 ?auto_776581 ) ) ( not ( = ?auto_776579 ?auto_776582 ) ) ( not ( = ?auto_776579 ?auto_776583 ) ) ( not ( = ?auto_776579 ?auto_776584 ) ) ( not ( = ?auto_776579 ?auto_776585 ) ) ( not ( = ?auto_776579 ?auto_776586 ) ) ( not ( = ?auto_776580 ?auto_776581 ) ) ( not ( = ?auto_776580 ?auto_776582 ) ) ( not ( = ?auto_776580 ?auto_776583 ) ) ( not ( = ?auto_776580 ?auto_776584 ) ) ( not ( = ?auto_776580 ?auto_776585 ) ) ( not ( = ?auto_776580 ?auto_776586 ) ) ( not ( = ?auto_776581 ?auto_776582 ) ) ( not ( = ?auto_776581 ?auto_776583 ) ) ( not ( = ?auto_776581 ?auto_776584 ) ) ( not ( = ?auto_776581 ?auto_776585 ) ) ( not ( = ?auto_776581 ?auto_776586 ) ) ( not ( = ?auto_776582 ?auto_776583 ) ) ( not ( = ?auto_776582 ?auto_776584 ) ) ( not ( = ?auto_776582 ?auto_776585 ) ) ( not ( = ?auto_776582 ?auto_776586 ) ) ( not ( = ?auto_776583 ?auto_776584 ) ) ( not ( = ?auto_776583 ?auto_776585 ) ) ( not ( = ?auto_776583 ?auto_776586 ) ) ( not ( = ?auto_776584 ?auto_776585 ) ) ( not ( = ?auto_776584 ?auto_776586 ) ) ( not ( = ?auto_776585 ?auto_776586 ) ) ( CLEAR ?auto_776583 ) ( ON ?auto_776584 ?auto_776585 ) ( CLEAR ?auto_776584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_776575 ?auto_776576 ?auto_776577 ?auto_776578 ?auto_776579 ?auto_776580 ?auto_776581 ?auto_776582 ?auto_776583 ?auto_776584 )
      ( MAKE-11PILE ?auto_776575 ?auto_776576 ?auto_776577 ?auto_776578 ?auto_776579 ?auto_776580 ?auto_776581 ?auto_776582 ?auto_776583 ?auto_776584 ?auto_776585 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_776621 - BLOCK
      ?auto_776622 - BLOCK
      ?auto_776623 - BLOCK
      ?auto_776624 - BLOCK
      ?auto_776625 - BLOCK
      ?auto_776626 - BLOCK
      ?auto_776627 - BLOCK
      ?auto_776628 - BLOCK
      ?auto_776629 - BLOCK
      ?auto_776630 - BLOCK
      ?auto_776631 - BLOCK
    )
    :vars
    (
      ?auto_776632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_776631 ?auto_776632 ) ( ON-TABLE ?auto_776621 ) ( ON ?auto_776622 ?auto_776621 ) ( ON ?auto_776623 ?auto_776622 ) ( ON ?auto_776624 ?auto_776623 ) ( ON ?auto_776625 ?auto_776624 ) ( ON ?auto_776626 ?auto_776625 ) ( ON ?auto_776627 ?auto_776626 ) ( ON ?auto_776628 ?auto_776627 ) ( not ( = ?auto_776621 ?auto_776622 ) ) ( not ( = ?auto_776621 ?auto_776623 ) ) ( not ( = ?auto_776621 ?auto_776624 ) ) ( not ( = ?auto_776621 ?auto_776625 ) ) ( not ( = ?auto_776621 ?auto_776626 ) ) ( not ( = ?auto_776621 ?auto_776627 ) ) ( not ( = ?auto_776621 ?auto_776628 ) ) ( not ( = ?auto_776621 ?auto_776629 ) ) ( not ( = ?auto_776621 ?auto_776630 ) ) ( not ( = ?auto_776621 ?auto_776631 ) ) ( not ( = ?auto_776621 ?auto_776632 ) ) ( not ( = ?auto_776622 ?auto_776623 ) ) ( not ( = ?auto_776622 ?auto_776624 ) ) ( not ( = ?auto_776622 ?auto_776625 ) ) ( not ( = ?auto_776622 ?auto_776626 ) ) ( not ( = ?auto_776622 ?auto_776627 ) ) ( not ( = ?auto_776622 ?auto_776628 ) ) ( not ( = ?auto_776622 ?auto_776629 ) ) ( not ( = ?auto_776622 ?auto_776630 ) ) ( not ( = ?auto_776622 ?auto_776631 ) ) ( not ( = ?auto_776622 ?auto_776632 ) ) ( not ( = ?auto_776623 ?auto_776624 ) ) ( not ( = ?auto_776623 ?auto_776625 ) ) ( not ( = ?auto_776623 ?auto_776626 ) ) ( not ( = ?auto_776623 ?auto_776627 ) ) ( not ( = ?auto_776623 ?auto_776628 ) ) ( not ( = ?auto_776623 ?auto_776629 ) ) ( not ( = ?auto_776623 ?auto_776630 ) ) ( not ( = ?auto_776623 ?auto_776631 ) ) ( not ( = ?auto_776623 ?auto_776632 ) ) ( not ( = ?auto_776624 ?auto_776625 ) ) ( not ( = ?auto_776624 ?auto_776626 ) ) ( not ( = ?auto_776624 ?auto_776627 ) ) ( not ( = ?auto_776624 ?auto_776628 ) ) ( not ( = ?auto_776624 ?auto_776629 ) ) ( not ( = ?auto_776624 ?auto_776630 ) ) ( not ( = ?auto_776624 ?auto_776631 ) ) ( not ( = ?auto_776624 ?auto_776632 ) ) ( not ( = ?auto_776625 ?auto_776626 ) ) ( not ( = ?auto_776625 ?auto_776627 ) ) ( not ( = ?auto_776625 ?auto_776628 ) ) ( not ( = ?auto_776625 ?auto_776629 ) ) ( not ( = ?auto_776625 ?auto_776630 ) ) ( not ( = ?auto_776625 ?auto_776631 ) ) ( not ( = ?auto_776625 ?auto_776632 ) ) ( not ( = ?auto_776626 ?auto_776627 ) ) ( not ( = ?auto_776626 ?auto_776628 ) ) ( not ( = ?auto_776626 ?auto_776629 ) ) ( not ( = ?auto_776626 ?auto_776630 ) ) ( not ( = ?auto_776626 ?auto_776631 ) ) ( not ( = ?auto_776626 ?auto_776632 ) ) ( not ( = ?auto_776627 ?auto_776628 ) ) ( not ( = ?auto_776627 ?auto_776629 ) ) ( not ( = ?auto_776627 ?auto_776630 ) ) ( not ( = ?auto_776627 ?auto_776631 ) ) ( not ( = ?auto_776627 ?auto_776632 ) ) ( not ( = ?auto_776628 ?auto_776629 ) ) ( not ( = ?auto_776628 ?auto_776630 ) ) ( not ( = ?auto_776628 ?auto_776631 ) ) ( not ( = ?auto_776628 ?auto_776632 ) ) ( not ( = ?auto_776629 ?auto_776630 ) ) ( not ( = ?auto_776629 ?auto_776631 ) ) ( not ( = ?auto_776629 ?auto_776632 ) ) ( not ( = ?auto_776630 ?auto_776631 ) ) ( not ( = ?auto_776630 ?auto_776632 ) ) ( not ( = ?auto_776631 ?auto_776632 ) ) ( ON ?auto_776630 ?auto_776631 ) ( CLEAR ?auto_776628 ) ( ON ?auto_776629 ?auto_776630 ) ( CLEAR ?auto_776629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_776621 ?auto_776622 ?auto_776623 ?auto_776624 ?auto_776625 ?auto_776626 ?auto_776627 ?auto_776628 ?auto_776629 )
      ( MAKE-11PILE ?auto_776621 ?auto_776622 ?auto_776623 ?auto_776624 ?auto_776625 ?auto_776626 ?auto_776627 ?auto_776628 ?auto_776629 ?auto_776630 ?auto_776631 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_776667 - BLOCK
      ?auto_776668 - BLOCK
      ?auto_776669 - BLOCK
      ?auto_776670 - BLOCK
      ?auto_776671 - BLOCK
      ?auto_776672 - BLOCK
      ?auto_776673 - BLOCK
      ?auto_776674 - BLOCK
      ?auto_776675 - BLOCK
      ?auto_776676 - BLOCK
      ?auto_776677 - BLOCK
    )
    :vars
    (
      ?auto_776678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_776677 ?auto_776678 ) ( ON-TABLE ?auto_776667 ) ( ON ?auto_776668 ?auto_776667 ) ( ON ?auto_776669 ?auto_776668 ) ( ON ?auto_776670 ?auto_776669 ) ( ON ?auto_776671 ?auto_776670 ) ( ON ?auto_776672 ?auto_776671 ) ( ON ?auto_776673 ?auto_776672 ) ( not ( = ?auto_776667 ?auto_776668 ) ) ( not ( = ?auto_776667 ?auto_776669 ) ) ( not ( = ?auto_776667 ?auto_776670 ) ) ( not ( = ?auto_776667 ?auto_776671 ) ) ( not ( = ?auto_776667 ?auto_776672 ) ) ( not ( = ?auto_776667 ?auto_776673 ) ) ( not ( = ?auto_776667 ?auto_776674 ) ) ( not ( = ?auto_776667 ?auto_776675 ) ) ( not ( = ?auto_776667 ?auto_776676 ) ) ( not ( = ?auto_776667 ?auto_776677 ) ) ( not ( = ?auto_776667 ?auto_776678 ) ) ( not ( = ?auto_776668 ?auto_776669 ) ) ( not ( = ?auto_776668 ?auto_776670 ) ) ( not ( = ?auto_776668 ?auto_776671 ) ) ( not ( = ?auto_776668 ?auto_776672 ) ) ( not ( = ?auto_776668 ?auto_776673 ) ) ( not ( = ?auto_776668 ?auto_776674 ) ) ( not ( = ?auto_776668 ?auto_776675 ) ) ( not ( = ?auto_776668 ?auto_776676 ) ) ( not ( = ?auto_776668 ?auto_776677 ) ) ( not ( = ?auto_776668 ?auto_776678 ) ) ( not ( = ?auto_776669 ?auto_776670 ) ) ( not ( = ?auto_776669 ?auto_776671 ) ) ( not ( = ?auto_776669 ?auto_776672 ) ) ( not ( = ?auto_776669 ?auto_776673 ) ) ( not ( = ?auto_776669 ?auto_776674 ) ) ( not ( = ?auto_776669 ?auto_776675 ) ) ( not ( = ?auto_776669 ?auto_776676 ) ) ( not ( = ?auto_776669 ?auto_776677 ) ) ( not ( = ?auto_776669 ?auto_776678 ) ) ( not ( = ?auto_776670 ?auto_776671 ) ) ( not ( = ?auto_776670 ?auto_776672 ) ) ( not ( = ?auto_776670 ?auto_776673 ) ) ( not ( = ?auto_776670 ?auto_776674 ) ) ( not ( = ?auto_776670 ?auto_776675 ) ) ( not ( = ?auto_776670 ?auto_776676 ) ) ( not ( = ?auto_776670 ?auto_776677 ) ) ( not ( = ?auto_776670 ?auto_776678 ) ) ( not ( = ?auto_776671 ?auto_776672 ) ) ( not ( = ?auto_776671 ?auto_776673 ) ) ( not ( = ?auto_776671 ?auto_776674 ) ) ( not ( = ?auto_776671 ?auto_776675 ) ) ( not ( = ?auto_776671 ?auto_776676 ) ) ( not ( = ?auto_776671 ?auto_776677 ) ) ( not ( = ?auto_776671 ?auto_776678 ) ) ( not ( = ?auto_776672 ?auto_776673 ) ) ( not ( = ?auto_776672 ?auto_776674 ) ) ( not ( = ?auto_776672 ?auto_776675 ) ) ( not ( = ?auto_776672 ?auto_776676 ) ) ( not ( = ?auto_776672 ?auto_776677 ) ) ( not ( = ?auto_776672 ?auto_776678 ) ) ( not ( = ?auto_776673 ?auto_776674 ) ) ( not ( = ?auto_776673 ?auto_776675 ) ) ( not ( = ?auto_776673 ?auto_776676 ) ) ( not ( = ?auto_776673 ?auto_776677 ) ) ( not ( = ?auto_776673 ?auto_776678 ) ) ( not ( = ?auto_776674 ?auto_776675 ) ) ( not ( = ?auto_776674 ?auto_776676 ) ) ( not ( = ?auto_776674 ?auto_776677 ) ) ( not ( = ?auto_776674 ?auto_776678 ) ) ( not ( = ?auto_776675 ?auto_776676 ) ) ( not ( = ?auto_776675 ?auto_776677 ) ) ( not ( = ?auto_776675 ?auto_776678 ) ) ( not ( = ?auto_776676 ?auto_776677 ) ) ( not ( = ?auto_776676 ?auto_776678 ) ) ( not ( = ?auto_776677 ?auto_776678 ) ) ( ON ?auto_776676 ?auto_776677 ) ( ON ?auto_776675 ?auto_776676 ) ( CLEAR ?auto_776673 ) ( ON ?auto_776674 ?auto_776675 ) ( CLEAR ?auto_776674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_776667 ?auto_776668 ?auto_776669 ?auto_776670 ?auto_776671 ?auto_776672 ?auto_776673 ?auto_776674 )
      ( MAKE-11PILE ?auto_776667 ?auto_776668 ?auto_776669 ?auto_776670 ?auto_776671 ?auto_776672 ?auto_776673 ?auto_776674 ?auto_776675 ?auto_776676 ?auto_776677 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_776713 - BLOCK
      ?auto_776714 - BLOCK
      ?auto_776715 - BLOCK
      ?auto_776716 - BLOCK
      ?auto_776717 - BLOCK
      ?auto_776718 - BLOCK
      ?auto_776719 - BLOCK
      ?auto_776720 - BLOCK
      ?auto_776721 - BLOCK
      ?auto_776722 - BLOCK
      ?auto_776723 - BLOCK
    )
    :vars
    (
      ?auto_776724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_776723 ?auto_776724 ) ( ON-TABLE ?auto_776713 ) ( ON ?auto_776714 ?auto_776713 ) ( ON ?auto_776715 ?auto_776714 ) ( ON ?auto_776716 ?auto_776715 ) ( ON ?auto_776717 ?auto_776716 ) ( ON ?auto_776718 ?auto_776717 ) ( not ( = ?auto_776713 ?auto_776714 ) ) ( not ( = ?auto_776713 ?auto_776715 ) ) ( not ( = ?auto_776713 ?auto_776716 ) ) ( not ( = ?auto_776713 ?auto_776717 ) ) ( not ( = ?auto_776713 ?auto_776718 ) ) ( not ( = ?auto_776713 ?auto_776719 ) ) ( not ( = ?auto_776713 ?auto_776720 ) ) ( not ( = ?auto_776713 ?auto_776721 ) ) ( not ( = ?auto_776713 ?auto_776722 ) ) ( not ( = ?auto_776713 ?auto_776723 ) ) ( not ( = ?auto_776713 ?auto_776724 ) ) ( not ( = ?auto_776714 ?auto_776715 ) ) ( not ( = ?auto_776714 ?auto_776716 ) ) ( not ( = ?auto_776714 ?auto_776717 ) ) ( not ( = ?auto_776714 ?auto_776718 ) ) ( not ( = ?auto_776714 ?auto_776719 ) ) ( not ( = ?auto_776714 ?auto_776720 ) ) ( not ( = ?auto_776714 ?auto_776721 ) ) ( not ( = ?auto_776714 ?auto_776722 ) ) ( not ( = ?auto_776714 ?auto_776723 ) ) ( not ( = ?auto_776714 ?auto_776724 ) ) ( not ( = ?auto_776715 ?auto_776716 ) ) ( not ( = ?auto_776715 ?auto_776717 ) ) ( not ( = ?auto_776715 ?auto_776718 ) ) ( not ( = ?auto_776715 ?auto_776719 ) ) ( not ( = ?auto_776715 ?auto_776720 ) ) ( not ( = ?auto_776715 ?auto_776721 ) ) ( not ( = ?auto_776715 ?auto_776722 ) ) ( not ( = ?auto_776715 ?auto_776723 ) ) ( not ( = ?auto_776715 ?auto_776724 ) ) ( not ( = ?auto_776716 ?auto_776717 ) ) ( not ( = ?auto_776716 ?auto_776718 ) ) ( not ( = ?auto_776716 ?auto_776719 ) ) ( not ( = ?auto_776716 ?auto_776720 ) ) ( not ( = ?auto_776716 ?auto_776721 ) ) ( not ( = ?auto_776716 ?auto_776722 ) ) ( not ( = ?auto_776716 ?auto_776723 ) ) ( not ( = ?auto_776716 ?auto_776724 ) ) ( not ( = ?auto_776717 ?auto_776718 ) ) ( not ( = ?auto_776717 ?auto_776719 ) ) ( not ( = ?auto_776717 ?auto_776720 ) ) ( not ( = ?auto_776717 ?auto_776721 ) ) ( not ( = ?auto_776717 ?auto_776722 ) ) ( not ( = ?auto_776717 ?auto_776723 ) ) ( not ( = ?auto_776717 ?auto_776724 ) ) ( not ( = ?auto_776718 ?auto_776719 ) ) ( not ( = ?auto_776718 ?auto_776720 ) ) ( not ( = ?auto_776718 ?auto_776721 ) ) ( not ( = ?auto_776718 ?auto_776722 ) ) ( not ( = ?auto_776718 ?auto_776723 ) ) ( not ( = ?auto_776718 ?auto_776724 ) ) ( not ( = ?auto_776719 ?auto_776720 ) ) ( not ( = ?auto_776719 ?auto_776721 ) ) ( not ( = ?auto_776719 ?auto_776722 ) ) ( not ( = ?auto_776719 ?auto_776723 ) ) ( not ( = ?auto_776719 ?auto_776724 ) ) ( not ( = ?auto_776720 ?auto_776721 ) ) ( not ( = ?auto_776720 ?auto_776722 ) ) ( not ( = ?auto_776720 ?auto_776723 ) ) ( not ( = ?auto_776720 ?auto_776724 ) ) ( not ( = ?auto_776721 ?auto_776722 ) ) ( not ( = ?auto_776721 ?auto_776723 ) ) ( not ( = ?auto_776721 ?auto_776724 ) ) ( not ( = ?auto_776722 ?auto_776723 ) ) ( not ( = ?auto_776722 ?auto_776724 ) ) ( not ( = ?auto_776723 ?auto_776724 ) ) ( ON ?auto_776722 ?auto_776723 ) ( ON ?auto_776721 ?auto_776722 ) ( ON ?auto_776720 ?auto_776721 ) ( CLEAR ?auto_776718 ) ( ON ?auto_776719 ?auto_776720 ) ( CLEAR ?auto_776719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_776713 ?auto_776714 ?auto_776715 ?auto_776716 ?auto_776717 ?auto_776718 ?auto_776719 )
      ( MAKE-11PILE ?auto_776713 ?auto_776714 ?auto_776715 ?auto_776716 ?auto_776717 ?auto_776718 ?auto_776719 ?auto_776720 ?auto_776721 ?auto_776722 ?auto_776723 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_776759 - BLOCK
      ?auto_776760 - BLOCK
      ?auto_776761 - BLOCK
      ?auto_776762 - BLOCK
      ?auto_776763 - BLOCK
      ?auto_776764 - BLOCK
      ?auto_776765 - BLOCK
      ?auto_776766 - BLOCK
      ?auto_776767 - BLOCK
      ?auto_776768 - BLOCK
      ?auto_776769 - BLOCK
    )
    :vars
    (
      ?auto_776770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_776769 ?auto_776770 ) ( ON-TABLE ?auto_776759 ) ( ON ?auto_776760 ?auto_776759 ) ( ON ?auto_776761 ?auto_776760 ) ( ON ?auto_776762 ?auto_776761 ) ( ON ?auto_776763 ?auto_776762 ) ( not ( = ?auto_776759 ?auto_776760 ) ) ( not ( = ?auto_776759 ?auto_776761 ) ) ( not ( = ?auto_776759 ?auto_776762 ) ) ( not ( = ?auto_776759 ?auto_776763 ) ) ( not ( = ?auto_776759 ?auto_776764 ) ) ( not ( = ?auto_776759 ?auto_776765 ) ) ( not ( = ?auto_776759 ?auto_776766 ) ) ( not ( = ?auto_776759 ?auto_776767 ) ) ( not ( = ?auto_776759 ?auto_776768 ) ) ( not ( = ?auto_776759 ?auto_776769 ) ) ( not ( = ?auto_776759 ?auto_776770 ) ) ( not ( = ?auto_776760 ?auto_776761 ) ) ( not ( = ?auto_776760 ?auto_776762 ) ) ( not ( = ?auto_776760 ?auto_776763 ) ) ( not ( = ?auto_776760 ?auto_776764 ) ) ( not ( = ?auto_776760 ?auto_776765 ) ) ( not ( = ?auto_776760 ?auto_776766 ) ) ( not ( = ?auto_776760 ?auto_776767 ) ) ( not ( = ?auto_776760 ?auto_776768 ) ) ( not ( = ?auto_776760 ?auto_776769 ) ) ( not ( = ?auto_776760 ?auto_776770 ) ) ( not ( = ?auto_776761 ?auto_776762 ) ) ( not ( = ?auto_776761 ?auto_776763 ) ) ( not ( = ?auto_776761 ?auto_776764 ) ) ( not ( = ?auto_776761 ?auto_776765 ) ) ( not ( = ?auto_776761 ?auto_776766 ) ) ( not ( = ?auto_776761 ?auto_776767 ) ) ( not ( = ?auto_776761 ?auto_776768 ) ) ( not ( = ?auto_776761 ?auto_776769 ) ) ( not ( = ?auto_776761 ?auto_776770 ) ) ( not ( = ?auto_776762 ?auto_776763 ) ) ( not ( = ?auto_776762 ?auto_776764 ) ) ( not ( = ?auto_776762 ?auto_776765 ) ) ( not ( = ?auto_776762 ?auto_776766 ) ) ( not ( = ?auto_776762 ?auto_776767 ) ) ( not ( = ?auto_776762 ?auto_776768 ) ) ( not ( = ?auto_776762 ?auto_776769 ) ) ( not ( = ?auto_776762 ?auto_776770 ) ) ( not ( = ?auto_776763 ?auto_776764 ) ) ( not ( = ?auto_776763 ?auto_776765 ) ) ( not ( = ?auto_776763 ?auto_776766 ) ) ( not ( = ?auto_776763 ?auto_776767 ) ) ( not ( = ?auto_776763 ?auto_776768 ) ) ( not ( = ?auto_776763 ?auto_776769 ) ) ( not ( = ?auto_776763 ?auto_776770 ) ) ( not ( = ?auto_776764 ?auto_776765 ) ) ( not ( = ?auto_776764 ?auto_776766 ) ) ( not ( = ?auto_776764 ?auto_776767 ) ) ( not ( = ?auto_776764 ?auto_776768 ) ) ( not ( = ?auto_776764 ?auto_776769 ) ) ( not ( = ?auto_776764 ?auto_776770 ) ) ( not ( = ?auto_776765 ?auto_776766 ) ) ( not ( = ?auto_776765 ?auto_776767 ) ) ( not ( = ?auto_776765 ?auto_776768 ) ) ( not ( = ?auto_776765 ?auto_776769 ) ) ( not ( = ?auto_776765 ?auto_776770 ) ) ( not ( = ?auto_776766 ?auto_776767 ) ) ( not ( = ?auto_776766 ?auto_776768 ) ) ( not ( = ?auto_776766 ?auto_776769 ) ) ( not ( = ?auto_776766 ?auto_776770 ) ) ( not ( = ?auto_776767 ?auto_776768 ) ) ( not ( = ?auto_776767 ?auto_776769 ) ) ( not ( = ?auto_776767 ?auto_776770 ) ) ( not ( = ?auto_776768 ?auto_776769 ) ) ( not ( = ?auto_776768 ?auto_776770 ) ) ( not ( = ?auto_776769 ?auto_776770 ) ) ( ON ?auto_776768 ?auto_776769 ) ( ON ?auto_776767 ?auto_776768 ) ( ON ?auto_776766 ?auto_776767 ) ( ON ?auto_776765 ?auto_776766 ) ( CLEAR ?auto_776763 ) ( ON ?auto_776764 ?auto_776765 ) ( CLEAR ?auto_776764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_776759 ?auto_776760 ?auto_776761 ?auto_776762 ?auto_776763 ?auto_776764 )
      ( MAKE-11PILE ?auto_776759 ?auto_776760 ?auto_776761 ?auto_776762 ?auto_776763 ?auto_776764 ?auto_776765 ?auto_776766 ?auto_776767 ?auto_776768 ?auto_776769 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_776805 - BLOCK
      ?auto_776806 - BLOCK
      ?auto_776807 - BLOCK
      ?auto_776808 - BLOCK
      ?auto_776809 - BLOCK
      ?auto_776810 - BLOCK
      ?auto_776811 - BLOCK
      ?auto_776812 - BLOCK
      ?auto_776813 - BLOCK
      ?auto_776814 - BLOCK
      ?auto_776815 - BLOCK
    )
    :vars
    (
      ?auto_776816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_776815 ?auto_776816 ) ( ON-TABLE ?auto_776805 ) ( ON ?auto_776806 ?auto_776805 ) ( ON ?auto_776807 ?auto_776806 ) ( ON ?auto_776808 ?auto_776807 ) ( not ( = ?auto_776805 ?auto_776806 ) ) ( not ( = ?auto_776805 ?auto_776807 ) ) ( not ( = ?auto_776805 ?auto_776808 ) ) ( not ( = ?auto_776805 ?auto_776809 ) ) ( not ( = ?auto_776805 ?auto_776810 ) ) ( not ( = ?auto_776805 ?auto_776811 ) ) ( not ( = ?auto_776805 ?auto_776812 ) ) ( not ( = ?auto_776805 ?auto_776813 ) ) ( not ( = ?auto_776805 ?auto_776814 ) ) ( not ( = ?auto_776805 ?auto_776815 ) ) ( not ( = ?auto_776805 ?auto_776816 ) ) ( not ( = ?auto_776806 ?auto_776807 ) ) ( not ( = ?auto_776806 ?auto_776808 ) ) ( not ( = ?auto_776806 ?auto_776809 ) ) ( not ( = ?auto_776806 ?auto_776810 ) ) ( not ( = ?auto_776806 ?auto_776811 ) ) ( not ( = ?auto_776806 ?auto_776812 ) ) ( not ( = ?auto_776806 ?auto_776813 ) ) ( not ( = ?auto_776806 ?auto_776814 ) ) ( not ( = ?auto_776806 ?auto_776815 ) ) ( not ( = ?auto_776806 ?auto_776816 ) ) ( not ( = ?auto_776807 ?auto_776808 ) ) ( not ( = ?auto_776807 ?auto_776809 ) ) ( not ( = ?auto_776807 ?auto_776810 ) ) ( not ( = ?auto_776807 ?auto_776811 ) ) ( not ( = ?auto_776807 ?auto_776812 ) ) ( not ( = ?auto_776807 ?auto_776813 ) ) ( not ( = ?auto_776807 ?auto_776814 ) ) ( not ( = ?auto_776807 ?auto_776815 ) ) ( not ( = ?auto_776807 ?auto_776816 ) ) ( not ( = ?auto_776808 ?auto_776809 ) ) ( not ( = ?auto_776808 ?auto_776810 ) ) ( not ( = ?auto_776808 ?auto_776811 ) ) ( not ( = ?auto_776808 ?auto_776812 ) ) ( not ( = ?auto_776808 ?auto_776813 ) ) ( not ( = ?auto_776808 ?auto_776814 ) ) ( not ( = ?auto_776808 ?auto_776815 ) ) ( not ( = ?auto_776808 ?auto_776816 ) ) ( not ( = ?auto_776809 ?auto_776810 ) ) ( not ( = ?auto_776809 ?auto_776811 ) ) ( not ( = ?auto_776809 ?auto_776812 ) ) ( not ( = ?auto_776809 ?auto_776813 ) ) ( not ( = ?auto_776809 ?auto_776814 ) ) ( not ( = ?auto_776809 ?auto_776815 ) ) ( not ( = ?auto_776809 ?auto_776816 ) ) ( not ( = ?auto_776810 ?auto_776811 ) ) ( not ( = ?auto_776810 ?auto_776812 ) ) ( not ( = ?auto_776810 ?auto_776813 ) ) ( not ( = ?auto_776810 ?auto_776814 ) ) ( not ( = ?auto_776810 ?auto_776815 ) ) ( not ( = ?auto_776810 ?auto_776816 ) ) ( not ( = ?auto_776811 ?auto_776812 ) ) ( not ( = ?auto_776811 ?auto_776813 ) ) ( not ( = ?auto_776811 ?auto_776814 ) ) ( not ( = ?auto_776811 ?auto_776815 ) ) ( not ( = ?auto_776811 ?auto_776816 ) ) ( not ( = ?auto_776812 ?auto_776813 ) ) ( not ( = ?auto_776812 ?auto_776814 ) ) ( not ( = ?auto_776812 ?auto_776815 ) ) ( not ( = ?auto_776812 ?auto_776816 ) ) ( not ( = ?auto_776813 ?auto_776814 ) ) ( not ( = ?auto_776813 ?auto_776815 ) ) ( not ( = ?auto_776813 ?auto_776816 ) ) ( not ( = ?auto_776814 ?auto_776815 ) ) ( not ( = ?auto_776814 ?auto_776816 ) ) ( not ( = ?auto_776815 ?auto_776816 ) ) ( ON ?auto_776814 ?auto_776815 ) ( ON ?auto_776813 ?auto_776814 ) ( ON ?auto_776812 ?auto_776813 ) ( ON ?auto_776811 ?auto_776812 ) ( ON ?auto_776810 ?auto_776811 ) ( CLEAR ?auto_776808 ) ( ON ?auto_776809 ?auto_776810 ) ( CLEAR ?auto_776809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_776805 ?auto_776806 ?auto_776807 ?auto_776808 ?auto_776809 )
      ( MAKE-11PILE ?auto_776805 ?auto_776806 ?auto_776807 ?auto_776808 ?auto_776809 ?auto_776810 ?auto_776811 ?auto_776812 ?auto_776813 ?auto_776814 ?auto_776815 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_776851 - BLOCK
      ?auto_776852 - BLOCK
      ?auto_776853 - BLOCK
      ?auto_776854 - BLOCK
      ?auto_776855 - BLOCK
      ?auto_776856 - BLOCK
      ?auto_776857 - BLOCK
      ?auto_776858 - BLOCK
      ?auto_776859 - BLOCK
      ?auto_776860 - BLOCK
      ?auto_776861 - BLOCK
    )
    :vars
    (
      ?auto_776862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_776861 ?auto_776862 ) ( ON-TABLE ?auto_776851 ) ( ON ?auto_776852 ?auto_776851 ) ( ON ?auto_776853 ?auto_776852 ) ( not ( = ?auto_776851 ?auto_776852 ) ) ( not ( = ?auto_776851 ?auto_776853 ) ) ( not ( = ?auto_776851 ?auto_776854 ) ) ( not ( = ?auto_776851 ?auto_776855 ) ) ( not ( = ?auto_776851 ?auto_776856 ) ) ( not ( = ?auto_776851 ?auto_776857 ) ) ( not ( = ?auto_776851 ?auto_776858 ) ) ( not ( = ?auto_776851 ?auto_776859 ) ) ( not ( = ?auto_776851 ?auto_776860 ) ) ( not ( = ?auto_776851 ?auto_776861 ) ) ( not ( = ?auto_776851 ?auto_776862 ) ) ( not ( = ?auto_776852 ?auto_776853 ) ) ( not ( = ?auto_776852 ?auto_776854 ) ) ( not ( = ?auto_776852 ?auto_776855 ) ) ( not ( = ?auto_776852 ?auto_776856 ) ) ( not ( = ?auto_776852 ?auto_776857 ) ) ( not ( = ?auto_776852 ?auto_776858 ) ) ( not ( = ?auto_776852 ?auto_776859 ) ) ( not ( = ?auto_776852 ?auto_776860 ) ) ( not ( = ?auto_776852 ?auto_776861 ) ) ( not ( = ?auto_776852 ?auto_776862 ) ) ( not ( = ?auto_776853 ?auto_776854 ) ) ( not ( = ?auto_776853 ?auto_776855 ) ) ( not ( = ?auto_776853 ?auto_776856 ) ) ( not ( = ?auto_776853 ?auto_776857 ) ) ( not ( = ?auto_776853 ?auto_776858 ) ) ( not ( = ?auto_776853 ?auto_776859 ) ) ( not ( = ?auto_776853 ?auto_776860 ) ) ( not ( = ?auto_776853 ?auto_776861 ) ) ( not ( = ?auto_776853 ?auto_776862 ) ) ( not ( = ?auto_776854 ?auto_776855 ) ) ( not ( = ?auto_776854 ?auto_776856 ) ) ( not ( = ?auto_776854 ?auto_776857 ) ) ( not ( = ?auto_776854 ?auto_776858 ) ) ( not ( = ?auto_776854 ?auto_776859 ) ) ( not ( = ?auto_776854 ?auto_776860 ) ) ( not ( = ?auto_776854 ?auto_776861 ) ) ( not ( = ?auto_776854 ?auto_776862 ) ) ( not ( = ?auto_776855 ?auto_776856 ) ) ( not ( = ?auto_776855 ?auto_776857 ) ) ( not ( = ?auto_776855 ?auto_776858 ) ) ( not ( = ?auto_776855 ?auto_776859 ) ) ( not ( = ?auto_776855 ?auto_776860 ) ) ( not ( = ?auto_776855 ?auto_776861 ) ) ( not ( = ?auto_776855 ?auto_776862 ) ) ( not ( = ?auto_776856 ?auto_776857 ) ) ( not ( = ?auto_776856 ?auto_776858 ) ) ( not ( = ?auto_776856 ?auto_776859 ) ) ( not ( = ?auto_776856 ?auto_776860 ) ) ( not ( = ?auto_776856 ?auto_776861 ) ) ( not ( = ?auto_776856 ?auto_776862 ) ) ( not ( = ?auto_776857 ?auto_776858 ) ) ( not ( = ?auto_776857 ?auto_776859 ) ) ( not ( = ?auto_776857 ?auto_776860 ) ) ( not ( = ?auto_776857 ?auto_776861 ) ) ( not ( = ?auto_776857 ?auto_776862 ) ) ( not ( = ?auto_776858 ?auto_776859 ) ) ( not ( = ?auto_776858 ?auto_776860 ) ) ( not ( = ?auto_776858 ?auto_776861 ) ) ( not ( = ?auto_776858 ?auto_776862 ) ) ( not ( = ?auto_776859 ?auto_776860 ) ) ( not ( = ?auto_776859 ?auto_776861 ) ) ( not ( = ?auto_776859 ?auto_776862 ) ) ( not ( = ?auto_776860 ?auto_776861 ) ) ( not ( = ?auto_776860 ?auto_776862 ) ) ( not ( = ?auto_776861 ?auto_776862 ) ) ( ON ?auto_776860 ?auto_776861 ) ( ON ?auto_776859 ?auto_776860 ) ( ON ?auto_776858 ?auto_776859 ) ( ON ?auto_776857 ?auto_776858 ) ( ON ?auto_776856 ?auto_776857 ) ( ON ?auto_776855 ?auto_776856 ) ( CLEAR ?auto_776853 ) ( ON ?auto_776854 ?auto_776855 ) ( CLEAR ?auto_776854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_776851 ?auto_776852 ?auto_776853 ?auto_776854 )
      ( MAKE-11PILE ?auto_776851 ?auto_776852 ?auto_776853 ?auto_776854 ?auto_776855 ?auto_776856 ?auto_776857 ?auto_776858 ?auto_776859 ?auto_776860 ?auto_776861 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_776897 - BLOCK
      ?auto_776898 - BLOCK
      ?auto_776899 - BLOCK
      ?auto_776900 - BLOCK
      ?auto_776901 - BLOCK
      ?auto_776902 - BLOCK
      ?auto_776903 - BLOCK
      ?auto_776904 - BLOCK
      ?auto_776905 - BLOCK
      ?auto_776906 - BLOCK
      ?auto_776907 - BLOCK
    )
    :vars
    (
      ?auto_776908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_776907 ?auto_776908 ) ( ON-TABLE ?auto_776897 ) ( ON ?auto_776898 ?auto_776897 ) ( not ( = ?auto_776897 ?auto_776898 ) ) ( not ( = ?auto_776897 ?auto_776899 ) ) ( not ( = ?auto_776897 ?auto_776900 ) ) ( not ( = ?auto_776897 ?auto_776901 ) ) ( not ( = ?auto_776897 ?auto_776902 ) ) ( not ( = ?auto_776897 ?auto_776903 ) ) ( not ( = ?auto_776897 ?auto_776904 ) ) ( not ( = ?auto_776897 ?auto_776905 ) ) ( not ( = ?auto_776897 ?auto_776906 ) ) ( not ( = ?auto_776897 ?auto_776907 ) ) ( not ( = ?auto_776897 ?auto_776908 ) ) ( not ( = ?auto_776898 ?auto_776899 ) ) ( not ( = ?auto_776898 ?auto_776900 ) ) ( not ( = ?auto_776898 ?auto_776901 ) ) ( not ( = ?auto_776898 ?auto_776902 ) ) ( not ( = ?auto_776898 ?auto_776903 ) ) ( not ( = ?auto_776898 ?auto_776904 ) ) ( not ( = ?auto_776898 ?auto_776905 ) ) ( not ( = ?auto_776898 ?auto_776906 ) ) ( not ( = ?auto_776898 ?auto_776907 ) ) ( not ( = ?auto_776898 ?auto_776908 ) ) ( not ( = ?auto_776899 ?auto_776900 ) ) ( not ( = ?auto_776899 ?auto_776901 ) ) ( not ( = ?auto_776899 ?auto_776902 ) ) ( not ( = ?auto_776899 ?auto_776903 ) ) ( not ( = ?auto_776899 ?auto_776904 ) ) ( not ( = ?auto_776899 ?auto_776905 ) ) ( not ( = ?auto_776899 ?auto_776906 ) ) ( not ( = ?auto_776899 ?auto_776907 ) ) ( not ( = ?auto_776899 ?auto_776908 ) ) ( not ( = ?auto_776900 ?auto_776901 ) ) ( not ( = ?auto_776900 ?auto_776902 ) ) ( not ( = ?auto_776900 ?auto_776903 ) ) ( not ( = ?auto_776900 ?auto_776904 ) ) ( not ( = ?auto_776900 ?auto_776905 ) ) ( not ( = ?auto_776900 ?auto_776906 ) ) ( not ( = ?auto_776900 ?auto_776907 ) ) ( not ( = ?auto_776900 ?auto_776908 ) ) ( not ( = ?auto_776901 ?auto_776902 ) ) ( not ( = ?auto_776901 ?auto_776903 ) ) ( not ( = ?auto_776901 ?auto_776904 ) ) ( not ( = ?auto_776901 ?auto_776905 ) ) ( not ( = ?auto_776901 ?auto_776906 ) ) ( not ( = ?auto_776901 ?auto_776907 ) ) ( not ( = ?auto_776901 ?auto_776908 ) ) ( not ( = ?auto_776902 ?auto_776903 ) ) ( not ( = ?auto_776902 ?auto_776904 ) ) ( not ( = ?auto_776902 ?auto_776905 ) ) ( not ( = ?auto_776902 ?auto_776906 ) ) ( not ( = ?auto_776902 ?auto_776907 ) ) ( not ( = ?auto_776902 ?auto_776908 ) ) ( not ( = ?auto_776903 ?auto_776904 ) ) ( not ( = ?auto_776903 ?auto_776905 ) ) ( not ( = ?auto_776903 ?auto_776906 ) ) ( not ( = ?auto_776903 ?auto_776907 ) ) ( not ( = ?auto_776903 ?auto_776908 ) ) ( not ( = ?auto_776904 ?auto_776905 ) ) ( not ( = ?auto_776904 ?auto_776906 ) ) ( not ( = ?auto_776904 ?auto_776907 ) ) ( not ( = ?auto_776904 ?auto_776908 ) ) ( not ( = ?auto_776905 ?auto_776906 ) ) ( not ( = ?auto_776905 ?auto_776907 ) ) ( not ( = ?auto_776905 ?auto_776908 ) ) ( not ( = ?auto_776906 ?auto_776907 ) ) ( not ( = ?auto_776906 ?auto_776908 ) ) ( not ( = ?auto_776907 ?auto_776908 ) ) ( ON ?auto_776906 ?auto_776907 ) ( ON ?auto_776905 ?auto_776906 ) ( ON ?auto_776904 ?auto_776905 ) ( ON ?auto_776903 ?auto_776904 ) ( ON ?auto_776902 ?auto_776903 ) ( ON ?auto_776901 ?auto_776902 ) ( ON ?auto_776900 ?auto_776901 ) ( CLEAR ?auto_776898 ) ( ON ?auto_776899 ?auto_776900 ) ( CLEAR ?auto_776899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_776897 ?auto_776898 ?auto_776899 )
      ( MAKE-11PILE ?auto_776897 ?auto_776898 ?auto_776899 ?auto_776900 ?auto_776901 ?auto_776902 ?auto_776903 ?auto_776904 ?auto_776905 ?auto_776906 ?auto_776907 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_776943 - BLOCK
      ?auto_776944 - BLOCK
      ?auto_776945 - BLOCK
      ?auto_776946 - BLOCK
      ?auto_776947 - BLOCK
      ?auto_776948 - BLOCK
      ?auto_776949 - BLOCK
      ?auto_776950 - BLOCK
      ?auto_776951 - BLOCK
      ?auto_776952 - BLOCK
      ?auto_776953 - BLOCK
    )
    :vars
    (
      ?auto_776954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_776953 ?auto_776954 ) ( ON-TABLE ?auto_776943 ) ( not ( = ?auto_776943 ?auto_776944 ) ) ( not ( = ?auto_776943 ?auto_776945 ) ) ( not ( = ?auto_776943 ?auto_776946 ) ) ( not ( = ?auto_776943 ?auto_776947 ) ) ( not ( = ?auto_776943 ?auto_776948 ) ) ( not ( = ?auto_776943 ?auto_776949 ) ) ( not ( = ?auto_776943 ?auto_776950 ) ) ( not ( = ?auto_776943 ?auto_776951 ) ) ( not ( = ?auto_776943 ?auto_776952 ) ) ( not ( = ?auto_776943 ?auto_776953 ) ) ( not ( = ?auto_776943 ?auto_776954 ) ) ( not ( = ?auto_776944 ?auto_776945 ) ) ( not ( = ?auto_776944 ?auto_776946 ) ) ( not ( = ?auto_776944 ?auto_776947 ) ) ( not ( = ?auto_776944 ?auto_776948 ) ) ( not ( = ?auto_776944 ?auto_776949 ) ) ( not ( = ?auto_776944 ?auto_776950 ) ) ( not ( = ?auto_776944 ?auto_776951 ) ) ( not ( = ?auto_776944 ?auto_776952 ) ) ( not ( = ?auto_776944 ?auto_776953 ) ) ( not ( = ?auto_776944 ?auto_776954 ) ) ( not ( = ?auto_776945 ?auto_776946 ) ) ( not ( = ?auto_776945 ?auto_776947 ) ) ( not ( = ?auto_776945 ?auto_776948 ) ) ( not ( = ?auto_776945 ?auto_776949 ) ) ( not ( = ?auto_776945 ?auto_776950 ) ) ( not ( = ?auto_776945 ?auto_776951 ) ) ( not ( = ?auto_776945 ?auto_776952 ) ) ( not ( = ?auto_776945 ?auto_776953 ) ) ( not ( = ?auto_776945 ?auto_776954 ) ) ( not ( = ?auto_776946 ?auto_776947 ) ) ( not ( = ?auto_776946 ?auto_776948 ) ) ( not ( = ?auto_776946 ?auto_776949 ) ) ( not ( = ?auto_776946 ?auto_776950 ) ) ( not ( = ?auto_776946 ?auto_776951 ) ) ( not ( = ?auto_776946 ?auto_776952 ) ) ( not ( = ?auto_776946 ?auto_776953 ) ) ( not ( = ?auto_776946 ?auto_776954 ) ) ( not ( = ?auto_776947 ?auto_776948 ) ) ( not ( = ?auto_776947 ?auto_776949 ) ) ( not ( = ?auto_776947 ?auto_776950 ) ) ( not ( = ?auto_776947 ?auto_776951 ) ) ( not ( = ?auto_776947 ?auto_776952 ) ) ( not ( = ?auto_776947 ?auto_776953 ) ) ( not ( = ?auto_776947 ?auto_776954 ) ) ( not ( = ?auto_776948 ?auto_776949 ) ) ( not ( = ?auto_776948 ?auto_776950 ) ) ( not ( = ?auto_776948 ?auto_776951 ) ) ( not ( = ?auto_776948 ?auto_776952 ) ) ( not ( = ?auto_776948 ?auto_776953 ) ) ( not ( = ?auto_776948 ?auto_776954 ) ) ( not ( = ?auto_776949 ?auto_776950 ) ) ( not ( = ?auto_776949 ?auto_776951 ) ) ( not ( = ?auto_776949 ?auto_776952 ) ) ( not ( = ?auto_776949 ?auto_776953 ) ) ( not ( = ?auto_776949 ?auto_776954 ) ) ( not ( = ?auto_776950 ?auto_776951 ) ) ( not ( = ?auto_776950 ?auto_776952 ) ) ( not ( = ?auto_776950 ?auto_776953 ) ) ( not ( = ?auto_776950 ?auto_776954 ) ) ( not ( = ?auto_776951 ?auto_776952 ) ) ( not ( = ?auto_776951 ?auto_776953 ) ) ( not ( = ?auto_776951 ?auto_776954 ) ) ( not ( = ?auto_776952 ?auto_776953 ) ) ( not ( = ?auto_776952 ?auto_776954 ) ) ( not ( = ?auto_776953 ?auto_776954 ) ) ( ON ?auto_776952 ?auto_776953 ) ( ON ?auto_776951 ?auto_776952 ) ( ON ?auto_776950 ?auto_776951 ) ( ON ?auto_776949 ?auto_776950 ) ( ON ?auto_776948 ?auto_776949 ) ( ON ?auto_776947 ?auto_776948 ) ( ON ?auto_776946 ?auto_776947 ) ( ON ?auto_776945 ?auto_776946 ) ( CLEAR ?auto_776943 ) ( ON ?auto_776944 ?auto_776945 ) ( CLEAR ?auto_776944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_776943 ?auto_776944 )
      ( MAKE-11PILE ?auto_776943 ?auto_776944 ?auto_776945 ?auto_776946 ?auto_776947 ?auto_776948 ?auto_776949 ?auto_776950 ?auto_776951 ?auto_776952 ?auto_776953 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_776989 - BLOCK
      ?auto_776990 - BLOCK
      ?auto_776991 - BLOCK
      ?auto_776992 - BLOCK
      ?auto_776993 - BLOCK
      ?auto_776994 - BLOCK
      ?auto_776995 - BLOCK
      ?auto_776996 - BLOCK
      ?auto_776997 - BLOCK
      ?auto_776998 - BLOCK
      ?auto_776999 - BLOCK
    )
    :vars
    (
      ?auto_777000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_776999 ?auto_777000 ) ( not ( = ?auto_776989 ?auto_776990 ) ) ( not ( = ?auto_776989 ?auto_776991 ) ) ( not ( = ?auto_776989 ?auto_776992 ) ) ( not ( = ?auto_776989 ?auto_776993 ) ) ( not ( = ?auto_776989 ?auto_776994 ) ) ( not ( = ?auto_776989 ?auto_776995 ) ) ( not ( = ?auto_776989 ?auto_776996 ) ) ( not ( = ?auto_776989 ?auto_776997 ) ) ( not ( = ?auto_776989 ?auto_776998 ) ) ( not ( = ?auto_776989 ?auto_776999 ) ) ( not ( = ?auto_776989 ?auto_777000 ) ) ( not ( = ?auto_776990 ?auto_776991 ) ) ( not ( = ?auto_776990 ?auto_776992 ) ) ( not ( = ?auto_776990 ?auto_776993 ) ) ( not ( = ?auto_776990 ?auto_776994 ) ) ( not ( = ?auto_776990 ?auto_776995 ) ) ( not ( = ?auto_776990 ?auto_776996 ) ) ( not ( = ?auto_776990 ?auto_776997 ) ) ( not ( = ?auto_776990 ?auto_776998 ) ) ( not ( = ?auto_776990 ?auto_776999 ) ) ( not ( = ?auto_776990 ?auto_777000 ) ) ( not ( = ?auto_776991 ?auto_776992 ) ) ( not ( = ?auto_776991 ?auto_776993 ) ) ( not ( = ?auto_776991 ?auto_776994 ) ) ( not ( = ?auto_776991 ?auto_776995 ) ) ( not ( = ?auto_776991 ?auto_776996 ) ) ( not ( = ?auto_776991 ?auto_776997 ) ) ( not ( = ?auto_776991 ?auto_776998 ) ) ( not ( = ?auto_776991 ?auto_776999 ) ) ( not ( = ?auto_776991 ?auto_777000 ) ) ( not ( = ?auto_776992 ?auto_776993 ) ) ( not ( = ?auto_776992 ?auto_776994 ) ) ( not ( = ?auto_776992 ?auto_776995 ) ) ( not ( = ?auto_776992 ?auto_776996 ) ) ( not ( = ?auto_776992 ?auto_776997 ) ) ( not ( = ?auto_776992 ?auto_776998 ) ) ( not ( = ?auto_776992 ?auto_776999 ) ) ( not ( = ?auto_776992 ?auto_777000 ) ) ( not ( = ?auto_776993 ?auto_776994 ) ) ( not ( = ?auto_776993 ?auto_776995 ) ) ( not ( = ?auto_776993 ?auto_776996 ) ) ( not ( = ?auto_776993 ?auto_776997 ) ) ( not ( = ?auto_776993 ?auto_776998 ) ) ( not ( = ?auto_776993 ?auto_776999 ) ) ( not ( = ?auto_776993 ?auto_777000 ) ) ( not ( = ?auto_776994 ?auto_776995 ) ) ( not ( = ?auto_776994 ?auto_776996 ) ) ( not ( = ?auto_776994 ?auto_776997 ) ) ( not ( = ?auto_776994 ?auto_776998 ) ) ( not ( = ?auto_776994 ?auto_776999 ) ) ( not ( = ?auto_776994 ?auto_777000 ) ) ( not ( = ?auto_776995 ?auto_776996 ) ) ( not ( = ?auto_776995 ?auto_776997 ) ) ( not ( = ?auto_776995 ?auto_776998 ) ) ( not ( = ?auto_776995 ?auto_776999 ) ) ( not ( = ?auto_776995 ?auto_777000 ) ) ( not ( = ?auto_776996 ?auto_776997 ) ) ( not ( = ?auto_776996 ?auto_776998 ) ) ( not ( = ?auto_776996 ?auto_776999 ) ) ( not ( = ?auto_776996 ?auto_777000 ) ) ( not ( = ?auto_776997 ?auto_776998 ) ) ( not ( = ?auto_776997 ?auto_776999 ) ) ( not ( = ?auto_776997 ?auto_777000 ) ) ( not ( = ?auto_776998 ?auto_776999 ) ) ( not ( = ?auto_776998 ?auto_777000 ) ) ( not ( = ?auto_776999 ?auto_777000 ) ) ( ON ?auto_776998 ?auto_776999 ) ( ON ?auto_776997 ?auto_776998 ) ( ON ?auto_776996 ?auto_776997 ) ( ON ?auto_776995 ?auto_776996 ) ( ON ?auto_776994 ?auto_776995 ) ( ON ?auto_776993 ?auto_776994 ) ( ON ?auto_776992 ?auto_776993 ) ( ON ?auto_776991 ?auto_776992 ) ( ON ?auto_776990 ?auto_776991 ) ( ON ?auto_776989 ?auto_776990 ) ( CLEAR ?auto_776989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_776989 )
      ( MAKE-11PILE ?auto_776989 ?auto_776990 ?auto_776991 ?auto_776992 ?auto_776993 ?auto_776994 ?auto_776995 ?auto_776996 ?auto_776997 ?auto_776998 ?auto_776999 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_777036 - BLOCK
      ?auto_777037 - BLOCK
      ?auto_777038 - BLOCK
      ?auto_777039 - BLOCK
      ?auto_777040 - BLOCK
      ?auto_777041 - BLOCK
      ?auto_777042 - BLOCK
      ?auto_777043 - BLOCK
      ?auto_777044 - BLOCK
      ?auto_777045 - BLOCK
      ?auto_777046 - BLOCK
      ?auto_777047 - BLOCK
    )
    :vars
    (
      ?auto_777048 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_777046 ) ( ON ?auto_777047 ?auto_777048 ) ( CLEAR ?auto_777047 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_777036 ) ( ON ?auto_777037 ?auto_777036 ) ( ON ?auto_777038 ?auto_777037 ) ( ON ?auto_777039 ?auto_777038 ) ( ON ?auto_777040 ?auto_777039 ) ( ON ?auto_777041 ?auto_777040 ) ( ON ?auto_777042 ?auto_777041 ) ( ON ?auto_777043 ?auto_777042 ) ( ON ?auto_777044 ?auto_777043 ) ( ON ?auto_777045 ?auto_777044 ) ( ON ?auto_777046 ?auto_777045 ) ( not ( = ?auto_777036 ?auto_777037 ) ) ( not ( = ?auto_777036 ?auto_777038 ) ) ( not ( = ?auto_777036 ?auto_777039 ) ) ( not ( = ?auto_777036 ?auto_777040 ) ) ( not ( = ?auto_777036 ?auto_777041 ) ) ( not ( = ?auto_777036 ?auto_777042 ) ) ( not ( = ?auto_777036 ?auto_777043 ) ) ( not ( = ?auto_777036 ?auto_777044 ) ) ( not ( = ?auto_777036 ?auto_777045 ) ) ( not ( = ?auto_777036 ?auto_777046 ) ) ( not ( = ?auto_777036 ?auto_777047 ) ) ( not ( = ?auto_777036 ?auto_777048 ) ) ( not ( = ?auto_777037 ?auto_777038 ) ) ( not ( = ?auto_777037 ?auto_777039 ) ) ( not ( = ?auto_777037 ?auto_777040 ) ) ( not ( = ?auto_777037 ?auto_777041 ) ) ( not ( = ?auto_777037 ?auto_777042 ) ) ( not ( = ?auto_777037 ?auto_777043 ) ) ( not ( = ?auto_777037 ?auto_777044 ) ) ( not ( = ?auto_777037 ?auto_777045 ) ) ( not ( = ?auto_777037 ?auto_777046 ) ) ( not ( = ?auto_777037 ?auto_777047 ) ) ( not ( = ?auto_777037 ?auto_777048 ) ) ( not ( = ?auto_777038 ?auto_777039 ) ) ( not ( = ?auto_777038 ?auto_777040 ) ) ( not ( = ?auto_777038 ?auto_777041 ) ) ( not ( = ?auto_777038 ?auto_777042 ) ) ( not ( = ?auto_777038 ?auto_777043 ) ) ( not ( = ?auto_777038 ?auto_777044 ) ) ( not ( = ?auto_777038 ?auto_777045 ) ) ( not ( = ?auto_777038 ?auto_777046 ) ) ( not ( = ?auto_777038 ?auto_777047 ) ) ( not ( = ?auto_777038 ?auto_777048 ) ) ( not ( = ?auto_777039 ?auto_777040 ) ) ( not ( = ?auto_777039 ?auto_777041 ) ) ( not ( = ?auto_777039 ?auto_777042 ) ) ( not ( = ?auto_777039 ?auto_777043 ) ) ( not ( = ?auto_777039 ?auto_777044 ) ) ( not ( = ?auto_777039 ?auto_777045 ) ) ( not ( = ?auto_777039 ?auto_777046 ) ) ( not ( = ?auto_777039 ?auto_777047 ) ) ( not ( = ?auto_777039 ?auto_777048 ) ) ( not ( = ?auto_777040 ?auto_777041 ) ) ( not ( = ?auto_777040 ?auto_777042 ) ) ( not ( = ?auto_777040 ?auto_777043 ) ) ( not ( = ?auto_777040 ?auto_777044 ) ) ( not ( = ?auto_777040 ?auto_777045 ) ) ( not ( = ?auto_777040 ?auto_777046 ) ) ( not ( = ?auto_777040 ?auto_777047 ) ) ( not ( = ?auto_777040 ?auto_777048 ) ) ( not ( = ?auto_777041 ?auto_777042 ) ) ( not ( = ?auto_777041 ?auto_777043 ) ) ( not ( = ?auto_777041 ?auto_777044 ) ) ( not ( = ?auto_777041 ?auto_777045 ) ) ( not ( = ?auto_777041 ?auto_777046 ) ) ( not ( = ?auto_777041 ?auto_777047 ) ) ( not ( = ?auto_777041 ?auto_777048 ) ) ( not ( = ?auto_777042 ?auto_777043 ) ) ( not ( = ?auto_777042 ?auto_777044 ) ) ( not ( = ?auto_777042 ?auto_777045 ) ) ( not ( = ?auto_777042 ?auto_777046 ) ) ( not ( = ?auto_777042 ?auto_777047 ) ) ( not ( = ?auto_777042 ?auto_777048 ) ) ( not ( = ?auto_777043 ?auto_777044 ) ) ( not ( = ?auto_777043 ?auto_777045 ) ) ( not ( = ?auto_777043 ?auto_777046 ) ) ( not ( = ?auto_777043 ?auto_777047 ) ) ( not ( = ?auto_777043 ?auto_777048 ) ) ( not ( = ?auto_777044 ?auto_777045 ) ) ( not ( = ?auto_777044 ?auto_777046 ) ) ( not ( = ?auto_777044 ?auto_777047 ) ) ( not ( = ?auto_777044 ?auto_777048 ) ) ( not ( = ?auto_777045 ?auto_777046 ) ) ( not ( = ?auto_777045 ?auto_777047 ) ) ( not ( = ?auto_777045 ?auto_777048 ) ) ( not ( = ?auto_777046 ?auto_777047 ) ) ( not ( = ?auto_777046 ?auto_777048 ) ) ( not ( = ?auto_777047 ?auto_777048 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_777047 ?auto_777048 )
      ( !STACK ?auto_777047 ?auto_777046 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_777086 - BLOCK
      ?auto_777087 - BLOCK
      ?auto_777088 - BLOCK
      ?auto_777089 - BLOCK
      ?auto_777090 - BLOCK
      ?auto_777091 - BLOCK
      ?auto_777092 - BLOCK
      ?auto_777093 - BLOCK
      ?auto_777094 - BLOCK
      ?auto_777095 - BLOCK
      ?auto_777096 - BLOCK
      ?auto_777097 - BLOCK
    )
    :vars
    (
      ?auto_777098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_777097 ?auto_777098 ) ( ON-TABLE ?auto_777086 ) ( ON ?auto_777087 ?auto_777086 ) ( ON ?auto_777088 ?auto_777087 ) ( ON ?auto_777089 ?auto_777088 ) ( ON ?auto_777090 ?auto_777089 ) ( ON ?auto_777091 ?auto_777090 ) ( ON ?auto_777092 ?auto_777091 ) ( ON ?auto_777093 ?auto_777092 ) ( ON ?auto_777094 ?auto_777093 ) ( ON ?auto_777095 ?auto_777094 ) ( not ( = ?auto_777086 ?auto_777087 ) ) ( not ( = ?auto_777086 ?auto_777088 ) ) ( not ( = ?auto_777086 ?auto_777089 ) ) ( not ( = ?auto_777086 ?auto_777090 ) ) ( not ( = ?auto_777086 ?auto_777091 ) ) ( not ( = ?auto_777086 ?auto_777092 ) ) ( not ( = ?auto_777086 ?auto_777093 ) ) ( not ( = ?auto_777086 ?auto_777094 ) ) ( not ( = ?auto_777086 ?auto_777095 ) ) ( not ( = ?auto_777086 ?auto_777096 ) ) ( not ( = ?auto_777086 ?auto_777097 ) ) ( not ( = ?auto_777086 ?auto_777098 ) ) ( not ( = ?auto_777087 ?auto_777088 ) ) ( not ( = ?auto_777087 ?auto_777089 ) ) ( not ( = ?auto_777087 ?auto_777090 ) ) ( not ( = ?auto_777087 ?auto_777091 ) ) ( not ( = ?auto_777087 ?auto_777092 ) ) ( not ( = ?auto_777087 ?auto_777093 ) ) ( not ( = ?auto_777087 ?auto_777094 ) ) ( not ( = ?auto_777087 ?auto_777095 ) ) ( not ( = ?auto_777087 ?auto_777096 ) ) ( not ( = ?auto_777087 ?auto_777097 ) ) ( not ( = ?auto_777087 ?auto_777098 ) ) ( not ( = ?auto_777088 ?auto_777089 ) ) ( not ( = ?auto_777088 ?auto_777090 ) ) ( not ( = ?auto_777088 ?auto_777091 ) ) ( not ( = ?auto_777088 ?auto_777092 ) ) ( not ( = ?auto_777088 ?auto_777093 ) ) ( not ( = ?auto_777088 ?auto_777094 ) ) ( not ( = ?auto_777088 ?auto_777095 ) ) ( not ( = ?auto_777088 ?auto_777096 ) ) ( not ( = ?auto_777088 ?auto_777097 ) ) ( not ( = ?auto_777088 ?auto_777098 ) ) ( not ( = ?auto_777089 ?auto_777090 ) ) ( not ( = ?auto_777089 ?auto_777091 ) ) ( not ( = ?auto_777089 ?auto_777092 ) ) ( not ( = ?auto_777089 ?auto_777093 ) ) ( not ( = ?auto_777089 ?auto_777094 ) ) ( not ( = ?auto_777089 ?auto_777095 ) ) ( not ( = ?auto_777089 ?auto_777096 ) ) ( not ( = ?auto_777089 ?auto_777097 ) ) ( not ( = ?auto_777089 ?auto_777098 ) ) ( not ( = ?auto_777090 ?auto_777091 ) ) ( not ( = ?auto_777090 ?auto_777092 ) ) ( not ( = ?auto_777090 ?auto_777093 ) ) ( not ( = ?auto_777090 ?auto_777094 ) ) ( not ( = ?auto_777090 ?auto_777095 ) ) ( not ( = ?auto_777090 ?auto_777096 ) ) ( not ( = ?auto_777090 ?auto_777097 ) ) ( not ( = ?auto_777090 ?auto_777098 ) ) ( not ( = ?auto_777091 ?auto_777092 ) ) ( not ( = ?auto_777091 ?auto_777093 ) ) ( not ( = ?auto_777091 ?auto_777094 ) ) ( not ( = ?auto_777091 ?auto_777095 ) ) ( not ( = ?auto_777091 ?auto_777096 ) ) ( not ( = ?auto_777091 ?auto_777097 ) ) ( not ( = ?auto_777091 ?auto_777098 ) ) ( not ( = ?auto_777092 ?auto_777093 ) ) ( not ( = ?auto_777092 ?auto_777094 ) ) ( not ( = ?auto_777092 ?auto_777095 ) ) ( not ( = ?auto_777092 ?auto_777096 ) ) ( not ( = ?auto_777092 ?auto_777097 ) ) ( not ( = ?auto_777092 ?auto_777098 ) ) ( not ( = ?auto_777093 ?auto_777094 ) ) ( not ( = ?auto_777093 ?auto_777095 ) ) ( not ( = ?auto_777093 ?auto_777096 ) ) ( not ( = ?auto_777093 ?auto_777097 ) ) ( not ( = ?auto_777093 ?auto_777098 ) ) ( not ( = ?auto_777094 ?auto_777095 ) ) ( not ( = ?auto_777094 ?auto_777096 ) ) ( not ( = ?auto_777094 ?auto_777097 ) ) ( not ( = ?auto_777094 ?auto_777098 ) ) ( not ( = ?auto_777095 ?auto_777096 ) ) ( not ( = ?auto_777095 ?auto_777097 ) ) ( not ( = ?auto_777095 ?auto_777098 ) ) ( not ( = ?auto_777096 ?auto_777097 ) ) ( not ( = ?auto_777096 ?auto_777098 ) ) ( not ( = ?auto_777097 ?auto_777098 ) ) ( CLEAR ?auto_777095 ) ( ON ?auto_777096 ?auto_777097 ) ( CLEAR ?auto_777096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_777086 ?auto_777087 ?auto_777088 ?auto_777089 ?auto_777090 ?auto_777091 ?auto_777092 ?auto_777093 ?auto_777094 ?auto_777095 ?auto_777096 )
      ( MAKE-12PILE ?auto_777086 ?auto_777087 ?auto_777088 ?auto_777089 ?auto_777090 ?auto_777091 ?auto_777092 ?auto_777093 ?auto_777094 ?auto_777095 ?auto_777096 ?auto_777097 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_777136 - BLOCK
      ?auto_777137 - BLOCK
      ?auto_777138 - BLOCK
      ?auto_777139 - BLOCK
      ?auto_777140 - BLOCK
      ?auto_777141 - BLOCK
      ?auto_777142 - BLOCK
      ?auto_777143 - BLOCK
      ?auto_777144 - BLOCK
      ?auto_777145 - BLOCK
      ?auto_777146 - BLOCK
      ?auto_777147 - BLOCK
    )
    :vars
    (
      ?auto_777148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_777147 ?auto_777148 ) ( ON-TABLE ?auto_777136 ) ( ON ?auto_777137 ?auto_777136 ) ( ON ?auto_777138 ?auto_777137 ) ( ON ?auto_777139 ?auto_777138 ) ( ON ?auto_777140 ?auto_777139 ) ( ON ?auto_777141 ?auto_777140 ) ( ON ?auto_777142 ?auto_777141 ) ( ON ?auto_777143 ?auto_777142 ) ( ON ?auto_777144 ?auto_777143 ) ( not ( = ?auto_777136 ?auto_777137 ) ) ( not ( = ?auto_777136 ?auto_777138 ) ) ( not ( = ?auto_777136 ?auto_777139 ) ) ( not ( = ?auto_777136 ?auto_777140 ) ) ( not ( = ?auto_777136 ?auto_777141 ) ) ( not ( = ?auto_777136 ?auto_777142 ) ) ( not ( = ?auto_777136 ?auto_777143 ) ) ( not ( = ?auto_777136 ?auto_777144 ) ) ( not ( = ?auto_777136 ?auto_777145 ) ) ( not ( = ?auto_777136 ?auto_777146 ) ) ( not ( = ?auto_777136 ?auto_777147 ) ) ( not ( = ?auto_777136 ?auto_777148 ) ) ( not ( = ?auto_777137 ?auto_777138 ) ) ( not ( = ?auto_777137 ?auto_777139 ) ) ( not ( = ?auto_777137 ?auto_777140 ) ) ( not ( = ?auto_777137 ?auto_777141 ) ) ( not ( = ?auto_777137 ?auto_777142 ) ) ( not ( = ?auto_777137 ?auto_777143 ) ) ( not ( = ?auto_777137 ?auto_777144 ) ) ( not ( = ?auto_777137 ?auto_777145 ) ) ( not ( = ?auto_777137 ?auto_777146 ) ) ( not ( = ?auto_777137 ?auto_777147 ) ) ( not ( = ?auto_777137 ?auto_777148 ) ) ( not ( = ?auto_777138 ?auto_777139 ) ) ( not ( = ?auto_777138 ?auto_777140 ) ) ( not ( = ?auto_777138 ?auto_777141 ) ) ( not ( = ?auto_777138 ?auto_777142 ) ) ( not ( = ?auto_777138 ?auto_777143 ) ) ( not ( = ?auto_777138 ?auto_777144 ) ) ( not ( = ?auto_777138 ?auto_777145 ) ) ( not ( = ?auto_777138 ?auto_777146 ) ) ( not ( = ?auto_777138 ?auto_777147 ) ) ( not ( = ?auto_777138 ?auto_777148 ) ) ( not ( = ?auto_777139 ?auto_777140 ) ) ( not ( = ?auto_777139 ?auto_777141 ) ) ( not ( = ?auto_777139 ?auto_777142 ) ) ( not ( = ?auto_777139 ?auto_777143 ) ) ( not ( = ?auto_777139 ?auto_777144 ) ) ( not ( = ?auto_777139 ?auto_777145 ) ) ( not ( = ?auto_777139 ?auto_777146 ) ) ( not ( = ?auto_777139 ?auto_777147 ) ) ( not ( = ?auto_777139 ?auto_777148 ) ) ( not ( = ?auto_777140 ?auto_777141 ) ) ( not ( = ?auto_777140 ?auto_777142 ) ) ( not ( = ?auto_777140 ?auto_777143 ) ) ( not ( = ?auto_777140 ?auto_777144 ) ) ( not ( = ?auto_777140 ?auto_777145 ) ) ( not ( = ?auto_777140 ?auto_777146 ) ) ( not ( = ?auto_777140 ?auto_777147 ) ) ( not ( = ?auto_777140 ?auto_777148 ) ) ( not ( = ?auto_777141 ?auto_777142 ) ) ( not ( = ?auto_777141 ?auto_777143 ) ) ( not ( = ?auto_777141 ?auto_777144 ) ) ( not ( = ?auto_777141 ?auto_777145 ) ) ( not ( = ?auto_777141 ?auto_777146 ) ) ( not ( = ?auto_777141 ?auto_777147 ) ) ( not ( = ?auto_777141 ?auto_777148 ) ) ( not ( = ?auto_777142 ?auto_777143 ) ) ( not ( = ?auto_777142 ?auto_777144 ) ) ( not ( = ?auto_777142 ?auto_777145 ) ) ( not ( = ?auto_777142 ?auto_777146 ) ) ( not ( = ?auto_777142 ?auto_777147 ) ) ( not ( = ?auto_777142 ?auto_777148 ) ) ( not ( = ?auto_777143 ?auto_777144 ) ) ( not ( = ?auto_777143 ?auto_777145 ) ) ( not ( = ?auto_777143 ?auto_777146 ) ) ( not ( = ?auto_777143 ?auto_777147 ) ) ( not ( = ?auto_777143 ?auto_777148 ) ) ( not ( = ?auto_777144 ?auto_777145 ) ) ( not ( = ?auto_777144 ?auto_777146 ) ) ( not ( = ?auto_777144 ?auto_777147 ) ) ( not ( = ?auto_777144 ?auto_777148 ) ) ( not ( = ?auto_777145 ?auto_777146 ) ) ( not ( = ?auto_777145 ?auto_777147 ) ) ( not ( = ?auto_777145 ?auto_777148 ) ) ( not ( = ?auto_777146 ?auto_777147 ) ) ( not ( = ?auto_777146 ?auto_777148 ) ) ( not ( = ?auto_777147 ?auto_777148 ) ) ( ON ?auto_777146 ?auto_777147 ) ( CLEAR ?auto_777144 ) ( ON ?auto_777145 ?auto_777146 ) ( CLEAR ?auto_777145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_777136 ?auto_777137 ?auto_777138 ?auto_777139 ?auto_777140 ?auto_777141 ?auto_777142 ?auto_777143 ?auto_777144 ?auto_777145 )
      ( MAKE-12PILE ?auto_777136 ?auto_777137 ?auto_777138 ?auto_777139 ?auto_777140 ?auto_777141 ?auto_777142 ?auto_777143 ?auto_777144 ?auto_777145 ?auto_777146 ?auto_777147 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_777186 - BLOCK
      ?auto_777187 - BLOCK
      ?auto_777188 - BLOCK
      ?auto_777189 - BLOCK
      ?auto_777190 - BLOCK
      ?auto_777191 - BLOCK
      ?auto_777192 - BLOCK
      ?auto_777193 - BLOCK
      ?auto_777194 - BLOCK
      ?auto_777195 - BLOCK
      ?auto_777196 - BLOCK
      ?auto_777197 - BLOCK
    )
    :vars
    (
      ?auto_777198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_777197 ?auto_777198 ) ( ON-TABLE ?auto_777186 ) ( ON ?auto_777187 ?auto_777186 ) ( ON ?auto_777188 ?auto_777187 ) ( ON ?auto_777189 ?auto_777188 ) ( ON ?auto_777190 ?auto_777189 ) ( ON ?auto_777191 ?auto_777190 ) ( ON ?auto_777192 ?auto_777191 ) ( ON ?auto_777193 ?auto_777192 ) ( not ( = ?auto_777186 ?auto_777187 ) ) ( not ( = ?auto_777186 ?auto_777188 ) ) ( not ( = ?auto_777186 ?auto_777189 ) ) ( not ( = ?auto_777186 ?auto_777190 ) ) ( not ( = ?auto_777186 ?auto_777191 ) ) ( not ( = ?auto_777186 ?auto_777192 ) ) ( not ( = ?auto_777186 ?auto_777193 ) ) ( not ( = ?auto_777186 ?auto_777194 ) ) ( not ( = ?auto_777186 ?auto_777195 ) ) ( not ( = ?auto_777186 ?auto_777196 ) ) ( not ( = ?auto_777186 ?auto_777197 ) ) ( not ( = ?auto_777186 ?auto_777198 ) ) ( not ( = ?auto_777187 ?auto_777188 ) ) ( not ( = ?auto_777187 ?auto_777189 ) ) ( not ( = ?auto_777187 ?auto_777190 ) ) ( not ( = ?auto_777187 ?auto_777191 ) ) ( not ( = ?auto_777187 ?auto_777192 ) ) ( not ( = ?auto_777187 ?auto_777193 ) ) ( not ( = ?auto_777187 ?auto_777194 ) ) ( not ( = ?auto_777187 ?auto_777195 ) ) ( not ( = ?auto_777187 ?auto_777196 ) ) ( not ( = ?auto_777187 ?auto_777197 ) ) ( not ( = ?auto_777187 ?auto_777198 ) ) ( not ( = ?auto_777188 ?auto_777189 ) ) ( not ( = ?auto_777188 ?auto_777190 ) ) ( not ( = ?auto_777188 ?auto_777191 ) ) ( not ( = ?auto_777188 ?auto_777192 ) ) ( not ( = ?auto_777188 ?auto_777193 ) ) ( not ( = ?auto_777188 ?auto_777194 ) ) ( not ( = ?auto_777188 ?auto_777195 ) ) ( not ( = ?auto_777188 ?auto_777196 ) ) ( not ( = ?auto_777188 ?auto_777197 ) ) ( not ( = ?auto_777188 ?auto_777198 ) ) ( not ( = ?auto_777189 ?auto_777190 ) ) ( not ( = ?auto_777189 ?auto_777191 ) ) ( not ( = ?auto_777189 ?auto_777192 ) ) ( not ( = ?auto_777189 ?auto_777193 ) ) ( not ( = ?auto_777189 ?auto_777194 ) ) ( not ( = ?auto_777189 ?auto_777195 ) ) ( not ( = ?auto_777189 ?auto_777196 ) ) ( not ( = ?auto_777189 ?auto_777197 ) ) ( not ( = ?auto_777189 ?auto_777198 ) ) ( not ( = ?auto_777190 ?auto_777191 ) ) ( not ( = ?auto_777190 ?auto_777192 ) ) ( not ( = ?auto_777190 ?auto_777193 ) ) ( not ( = ?auto_777190 ?auto_777194 ) ) ( not ( = ?auto_777190 ?auto_777195 ) ) ( not ( = ?auto_777190 ?auto_777196 ) ) ( not ( = ?auto_777190 ?auto_777197 ) ) ( not ( = ?auto_777190 ?auto_777198 ) ) ( not ( = ?auto_777191 ?auto_777192 ) ) ( not ( = ?auto_777191 ?auto_777193 ) ) ( not ( = ?auto_777191 ?auto_777194 ) ) ( not ( = ?auto_777191 ?auto_777195 ) ) ( not ( = ?auto_777191 ?auto_777196 ) ) ( not ( = ?auto_777191 ?auto_777197 ) ) ( not ( = ?auto_777191 ?auto_777198 ) ) ( not ( = ?auto_777192 ?auto_777193 ) ) ( not ( = ?auto_777192 ?auto_777194 ) ) ( not ( = ?auto_777192 ?auto_777195 ) ) ( not ( = ?auto_777192 ?auto_777196 ) ) ( not ( = ?auto_777192 ?auto_777197 ) ) ( not ( = ?auto_777192 ?auto_777198 ) ) ( not ( = ?auto_777193 ?auto_777194 ) ) ( not ( = ?auto_777193 ?auto_777195 ) ) ( not ( = ?auto_777193 ?auto_777196 ) ) ( not ( = ?auto_777193 ?auto_777197 ) ) ( not ( = ?auto_777193 ?auto_777198 ) ) ( not ( = ?auto_777194 ?auto_777195 ) ) ( not ( = ?auto_777194 ?auto_777196 ) ) ( not ( = ?auto_777194 ?auto_777197 ) ) ( not ( = ?auto_777194 ?auto_777198 ) ) ( not ( = ?auto_777195 ?auto_777196 ) ) ( not ( = ?auto_777195 ?auto_777197 ) ) ( not ( = ?auto_777195 ?auto_777198 ) ) ( not ( = ?auto_777196 ?auto_777197 ) ) ( not ( = ?auto_777196 ?auto_777198 ) ) ( not ( = ?auto_777197 ?auto_777198 ) ) ( ON ?auto_777196 ?auto_777197 ) ( ON ?auto_777195 ?auto_777196 ) ( CLEAR ?auto_777193 ) ( ON ?auto_777194 ?auto_777195 ) ( CLEAR ?auto_777194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_777186 ?auto_777187 ?auto_777188 ?auto_777189 ?auto_777190 ?auto_777191 ?auto_777192 ?auto_777193 ?auto_777194 )
      ( MAKE-12PILE ?auto_777186 ?auto_777187 ?auto_777188 ?auto_777189 ?auto_777190 ?auto_777191 ?auto_777192 ?auto_777193 ?auto_777194 ?auto_777195 ?auto_777196 ?auto_777197 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_777236 - BLOCK
      ?auto_777237 - BLOCK
      ?auto_777238 - BLOCK
      ?auto_777239 - BLOCK
      ?auto_777240 - BLOCK
      ?auto_777241 - BLOCK
      ?auto_777242 - BLOCK
      ?auto_777243 - BLOCK
      ?auto_777244 - BLOCK
      ?auto_777245 - BLOCK
      ?auto_777246 - BLOCK
      ?auto_777247 - BLOCK
    )
    :vars
    (
      ?auto_777248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_777247 ?auto_777248 ) ( ON-TABLE ?auto_777236 ) ( ON ?auto_777237 ?auto_777236 ) ( ON ?auto_777238 ?auto_777237 ) ( ON ?auto_777239 ?auto_777238 ) ( ON ?auto_777240 ?auto_777239 ) ( ON ?auto_777241 ?auto_777240 ) ( ON ?auto_777242 ?auto_777241 ) ( not ( = ?auto_777236 ?auto_777237 ) ) ( not ( = ?auto_777236 ?auto_777238 ) ) ( not ( = ?auto_777236 ?auto_777239 ) ) ( not ( = ?auto_777236 ?auto_777240 ) ) ( not ( = ?auto_777236 ?auto_777241 ) ) ( not ( = ?auto_777236 ?auto_777242 ) ) ( not ( = ?auto_777236 ?auto_777243 ) ) ( not ( = ?auto_777236 ?auto_777244 ) ) ( not ( = ?auto_777236 ?auto_777245 ) ) ( not ( = ?auto_777236 ?auto_777246 ) ) ( not ( = ?auto_777236 ?auto_777247 ) ) ( not ( = ?auto_777236 ?auto_777248 ) ) ( not ( = ?auto_777237 ?auto_777238 ) ) ( not ( = ?auto_777237 ?auto_777239 ) ) ( not ( = ?auto_777237 ?auto_777240 ) ) ( not ( = ?auto_777237 ?auto_777241 ) ) ( not ( = ?auto_777237 ?auto_777242 ) ) ( not ( = ?auto_777237 ?auto_777243 ) ) ( not ( = ?auto_777237 ?auto_777244 ) ) ( not ( = ?auto_777237 ?auto_777245 ) ) ( not ( = ?auto_777237 ?auto_777246 ) ) ( not ( = ?auto_777237 ?auto_777247 ) ) ( not ( = ?auto_777237 ?auto_777248 ) ) ( not ( = ?auto_777238 ?auto_777239 ) ) ( not ( = ?auto_777238 ?auto_777240 ) ) ( not ( = ?auto_777238 ?auto_777241 ) ) ( not ( = ?auto_777238 ?auto_777242 ) ) ( not ( = ?auto_777238 ?auto_777243 ) ) ( not ( = ?auto_777238 ?auto_777244 ) ) ( not ( = ?auto_777238 ?auto_777245 ) ) ( not ( = ?auto_777238 ?auto_777246 ) ) ( not ( = ?auto_777238 ?auto_777247 ) ) ( not ( = ?auto_777238 ?auto_777248 ) ) ( not ( = ?auto_777239 ?auto_777240 ) ) ( not ( = ?auto_777239 ?auto_777241 ) ) ( not ( = ?auto_777239 ?auto_777242 ) ) ( not ( = ?auto_777239 ?auto_777243 ) ) ( not ( = ?auto_777239 ?auto_777244 ) ) ( not ( = ?auto_777239 ?auto_777245 ) ) ( not ( = ?auto_777239 ?auto_777246 ) ) ( not ( = ?auto_777239 ?auto_777247 ) ) ( not ( = ?auto_777239 ?auto_777248 ) ) ( not ( = ?auto_777240 ?auto_777241 ) ) ( not ( = ?auto_777240 ?auto_777242 ) ) ( not ( = ?auto_777240 ?auto_777243 ) ) ( not ( = ?auto_777240 ?auto_777244 ) ) ( not ( = ?auto_777240 ?auto_777245 ) ) ( not ( = ?auto_777240 ?auto_777246 ) ) ( not ( = ?auto_777240 ?auto_777247 ) ) ( not ( = ?auto_777240 ?auto_777248 ) ) ( not ( = ?auto_777241 ?auto_777242 ) ) ( not ( = ?auto_777241 ?auto_777243 ) ) ( not ( = ?auto_777241 ?auto_777244 ) ) ( not ( = ?auto_777241 ?auto_777245 ) ) ( not ( = ?auto_777241 ?auto_777246 ) ) ( not ( = ?auto_777241 ?auto_777247 ) ) ( not ( = ?auto_777241 ?auto_777248 ) ) ( not ( = ?auto_777242 ?auto_777243 ) ) ( not ( = ?auto_777242 ?auto_777244 ) ) ( not ( = ?auto_777242 ?auto_777245 ) ) ( not ( = ?auto_777242 ?auto_777246 ) ) ( not ( = ?auto_777242 ?auto_777247 ) ) ( not ( = ?auto_777242 ?auto_777248 ) ) ( not ( = ?auto_777243 ?auto_777244 ) ) ( not ( = ?auto_777243 ?auto_777245 ) ) ( not ( = ?auto_777243 ?auto_777246 ) ) ( not ( = ?auto_777243 ?auto_777247 ) ) ( not ( = ?auto_777243 ?auto_777248 ) ) ( not ( = ?auto_777244 ?auto_777245 ) ) ( not ( = ?auto_777244 ?auto_777246 ) ) ( not ( = ?auto_777244 ?auto_777247 ) ) ( not ( = ?auto_777244 ?auto_777248 ) ) ( not ( = ?auto_777245 ?auto_777246 ) ) ( not ( = ?auto_777245 ?auto_777247 ) ) ( not ( = ?auto_777245 ?auto_777248 ) ) ( not ( = ?auto_777246 ?auto_777247 ) ) ( not ( = ?auto_777246 ?auto_777248 ) ) ( not ( = ?auto_777247 ?auto_777248 ) ) ( ON ?auto_777246 ?auto_777247 ) ( ON ?auto_777245 ?auto_777246 ) ( ON ?auto_777244 ?auto_777245 ) ( CLEAR ?auto_777242 ) ( ON ?auto_777243 ?auto_777244 ) ( CLEAR ?auto_777243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_777236 ?auto_777237 ?auto_777238 ?auto_777239 ?auto_777240 ?auto_777241 ?auto_777242 ?auto_777243 )
      ( MAKE-12PILE ?auto_777236 ?auto_777237 ?auto_777238 ?auto_777239 ?auto_777240 ?auto_777241 ?auto_777242 ?auto_777243 ?auto_777244 ?auto_777245 ?auto_777246 ?auto_777247 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_777286 - BLOCK
      ?auto_777287 - BLOCK
      ?auto_777288 - BLOCK
      ?auto_777289 - BLOCK
      ?auto_777290 - BLOCK
      ?auto_777291 - BLOCK
      ?auto_777292 - BLOCK
      ?auto_777293 - BLOCK
      ?auto_777294 - BLOCK
      ?auto_777295 - BLOCK
      ?auto_777296 - BLOCK
      ?auto_777297 - BLOCK
    )
    :vars
    (
      ?auto_777298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_777297 ?auto_777298 ) ( ON-TABLE ?auto_777286 ) ( ON ?auto_777287 ?auto_777286 ) ( ON ?auto_777288 ?auto_777287 ) ( ON ?auto_777289 ?auto_777288 ) ( ON ?auto_777290 ?auto_777289 ) ( ON ?auto_777291 ?auto_777290 ) ( not ( = ?auto_777286 ?auto_777287 ) ) ( not ( = ?auto_777286 ?auto_777288 ) ) ( not ( = ?auto_777286 ?auto_777289 ) ) ( not ( = ?auto_777286 ?auto_777290 ) ) ( not ( = ?auto_777286 ?auto_777291 ) ) ( not ( = ?auto_777286 ?auto_777292 ) ) ( not ( = ?auto_777286 ?auto_777293 ) ) ( not ( = ?auto_777286 ?auto_777294 ) ) ( not ( = ?auto_777286 ?auto_777295 ) ) ( not ( = ?auto_777286 ?auto_777296 ) ) ( not ( = ?auto_777286 ?auto_777297 ) ) ( not ( = ?auto_777286 ?auto_777298 ) ) ( not ( = ?auto_777287 ?auto_777288 ) ) ( not ( = ?auto_777287 ?auto_777289 ) ) ( not ( = ?auto_777287 ?auto_777290 ) ) ( not ( = ?auto_777287 ?auto_777291 ) ) ( not ( = ?auto_777287 ?auto_777292 ) ) ( not ( = ?auto_777287 ?auto_777293 ) ) ( not ( = ?auto_777287 ?auto_777294 ) ) ( not ( = ?auto_777287 ?auto_777295 ) ) ( not ( = ?auto_777287 ?auto_777296 ) ) ( not ( = ?auto_777287 ?auto_777297 ) ) ( not ( = ?auto_777287 ?auto_777298 ) ) ( not ( = ?auto_777288 ?auto_777289 ) ) ( not ( = ?auto_777288 ?auto_777290 ) ) ( not ( = ?auto_777288 ?auto_777291 ) ) ( not ( = ?auto_777288 ?auto_777292 ) ) ( not ( = ?auto_777288 ?auto_777293 ) ) ( not ( = ?auto_777288 ?auto_777294 ) ) ( not ( = ?auto_777288 ?auto_777295 ) ) ( not ( = ?auto_777288 ?auto_777296 ) ) ( not ( = ?auto_777288 ?auto_777297 ) ) ( not ( = ?auto_777288 ?auto_777298 ) ) ( not ( = ?auto_777289 ?auto_777290 ) ) ( not ( = ?auto_777289 ?auto_777291 ) ) ( not ( = ?auto_777289 ?auto_777292 ) ) ( not ( = ?auto_777289 ?auto_777293 ) ) ( not ( = ?auto_777289 ?auto_777294 ) ) ( not ( = ?auto_777289 ?auto_777295 ) ) ( not ( = ?auto_777289 ?auto_777296 ) ) ( not ( = ?auto_777289 ?auto_777297 ) ) ( not ( = ?auto_777289 ?auto_777298 ) ) ( not ( = ?auto_777290 ?auto_777291 ) ) ( not ( = ?auto_777290 ?auto_777292 ) ) ( not ( = ?auto_777290 ?auto_777293 ) ) ( not ( = ?auto_777290 ?auto_777294 ) ) ( not ( = ?auto_777290 ?auto_777295 ) ) ( not ( = ?auto_777290 ?auto_777296 ) ) ( not ( = ?auto_777290 ?auto_777297 ) ) ( not ( = ?auto_777290 ?auto_777298 ) ) ( not ( = ?auto_777291 ?auto_777292 ) ) ( not ( = ?auto_777291 ?auto_777293 ) ) ( not ( = ?auto_777291 ?auto_777294 ) ) ( not ( = ?auto_777291 ?auto_777295 ) ) ( not ( = ?auto_777291 ?auto_777296 ) ) ( not ( = ?auto_777291 ?auto_777297 ) ) ( not ( = ?auto_777291 ?auto_777298 ) ) ( not ( = ?auto_777292 ?auto_777293 ) ) ( not ( = ?auto_777292 ?auto_777294 ) ) ( not ( = ?auto_777292 ?auto_777295 ) ) ( not ( = ?auto_777292 ?auto_777296 ) ) ( not ( = ?auto_777292 ?auto_777297 ) ) ( not ( = ?auto_777292 ?auto_777298 ) ) ( not ( = ?auto_777293 ?auto_777294 ) ) ( not ( = ?auto_777293 ?auto_777295 ) ) ( not ( = ?auto_777293 ?auto_777296 ) ) ( not ( = ?auto_777293 ?auto_777297 ) ) ( not ( = ?auto_777293 ?auto_777298 ) ) ( not ( = ?auto_777294 ?auto_777295 ) ) ( not ( = ?auto_777294 ?auto_777296 ) ) ( not ( = ?auto_777294 ?auto_777297 ) ) ( not ( = ?auto_777294 ?auto_777298 ) ) ( not ( = ?auto_777295 ?auto_777296 ) ) ( not ( = ?auto_777295 ?auto_777297 ) ) ( not ( = ?auto_777295 ?auto_777298 ) ) ( not ( = ?auto_777296 ?auto_777297 ) ) ( not ( = ?auto_777296 ?auto_777298 ) ) ( not ( = ?auto_777297 ?auto_777298 ) ) ( ON ?auto_777296 ?auto_777297 ) ( ON ?auto_777295 ?auto_777296 ) ( ON ?auto_777294 ?auto_777295 ) ( ON ?auto_777293 ?auto_777294 ) ( CLEAR ?auto_777291 ) ( ON ?auto_777292 ?auto_777293 ) ( CLEAR ?auto_777292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_777286 ?auto_777287 ?auto_777288 ?auto_777289 ?auto_777290 ?auto_777291 ?auto_777292 )
      ( MAKE-12PILE ?auto_777286 ?auto_777287 ?auto_777288 ?auto_777289 ?auto_777290 ?auto_777291 ?auto_777292 ?auto_777293 ?auto_777294 ?auto_777295 ?auto_777296 ?auto_777297 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_777336 - BLOCK
      ?auto_777337 - BLOCK
      ?auto_777338 - BLOCK
      ?auto_777339 - BLOCK
      ?auto_777340 - BLOCK
      ?auto_777341 - BLOCK
      ?auto_777342 - BLOCK
      ?auto_777343 - BLOCK
      ?auto_777344 - BLOCK
      ?auto_777345 - BLOCK
      ?auto_777346 - BLOCK
      ?auto_777347 - BLOCK
    )
    :vars
    (
      ?auto_777348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_777347 ?auto_777348 ) ( ON-TABLE ?auto_777336 ) ( ON ?auto_777337 ?auto_777336 ) ( ON ?auto_777338 ?auto_777337 ) ( ON ?auto_777339 ?auto_777338 ) ( ON ?auto_777340 ?auto_777339 ) ( not ( = ?auto_777336 ?auto_777337 ) ) ( not ( = ?auto_777336 ?auto_777338 ) ) ( not ( = ?auto_777336 ?auto_777339 ) ) ( not ( = ?auto_777336 ?auto_777340 ) ) ( not ( = ?auto_777336 ?auto_777341 ) ) ( not ( = ?auto_777336 ?auto_777342 ) ) ( not ( = ?auto_777336 ?auto_777343 ) ) ( not ( = ?auto_777336 ?auto_777344 ) ) ( not ( = ?auto_777336 ?auto_777345 ) ) ( not ( = ?auto_777336 ?auto_777346 ) ) ( not ( = ?auto_777336 ?auto_777347 ) ) ( not ( = ?auto_777336 ?auto_777348 ) ) ( not ( = ?auto_777337 ?auto_777338 ) ) ( not ( = ?auto_777337 ?auto_777339 ) ) ( not ( = ?auto_777337 ?auto_777340 ) ) ( not ( = ?auto_777337 ?auto_777341 ) ) ( not ( = ?auto_777337 ?auto_777342 ) ) ( not ( = ?auto_777337 ?auto_777343 ) ) ( not ( = ?auto_777337 ?auto_777344 ) ) ( not ( = ?auto_777337 ?auto_777345 ) ) ( not ( = ?auto_777337 ?auto_777346 ) ) ( not ( = ?auto_777337 ?auto_777347 ) ) ( not ( = ?auto_777337 ?auto_777348 ) ) ( not ( = ?auto_777338 ?auto_777339 ) ) ( not ( = ?auto_777338 ?auto_777340 ) ) ( not ( = ?auto_777338 ?auto_777341 ) ) ( not ( = ?auto_777338 ?auto_777342 ) ) ( not ( = ?auto_777338 ?auto_777343 ) ) ( not ( = ?auto_777338 ?auto_777344 ) ) ( not ( = ?auto_777338 ?auto_777345 ) ) ( not ( = ?auto_777338 ?auto_777346 ) ) ( not ( = ?auto_777338 ?auto_777347 ) ) ( not ( = ?auto_777338 ?auto_777348 ) ) ( not ( = ?auto_777339 ?auto_777340 ) ) ( not ( = ?auto_777339 ?auto_777341 ) ) ( not ( = ?auto_777339 ?auto_777342 ) ) ( not ( = ?auto_777339 ?auto_777343 ) ) ( not ( = ?auto_777339 ?auto_777344 ) ) ( not ( = ?auto_777339 ?auto_777345 ) ) ( not ( = ?auto_777339 ?auto_777346 ) ) ( not ( = ?auto_777339 ?auto_777347 ) ) ( not ( = ?auto_777339 ?auto_777348 ) ) ( not ( = ?auto_777340 ?auto_777341 ) ) ( not ( = ?auto_777340 ?auto_777342 ) ) ( not ( = ?auto_777340 ?auto_777343 ) ) ( not ( = ?auto_777340 ?auto_777344 ) ) ( not ( = ?auto_777340 ?auto_777345 ) ) ( not ( = ?auto_777340 ?auto_777346 ) ) ( not ( = ?auto_777340 ?auto_777347 ) ) ( not ( = ?auto_777340 ?auto_777348 ) ) ( not ( = ?auto_777341 ?auto_777342 ) ) ( not ( = ?auto_777341 ?auto_777343 ) ) ( not ( = ?auto_777341 ?auto_777344 ) ) ( not ( = ?auto_777341 ?auto_777345 ) ) ( not ( = ?auto_777341 ?auto_777346 ) ) ( not ( = ?auto_777341 ?auto_777347 ) ) ( not ( = ?auto_777341 ?auto_777348 ) ) ( not ( = ?auto_777342 ?auto_777343 ) ) ( not ( = ?auto_777342 ?auto_777344 ) ) ( not ( = ?auto_777342 ?auto_777345 ) ) ( not ( = ?auto_777342 ?auto_777346 ) ) ( not ( = ?auto_777342 ?auto_777347 ) ) ( not ( = ?auto_777342 ?auto_777348 ) ) ( not ( = ?auto_777343 ?auto_777344 ) ) ( not ( = ?auto_777343 ?auto_777345 ) ) ( not ( = ?auto_777343 ?auto_777346 ) ) ( not ( = ?auto_777343 ?auto_777347 ) ) ( not ( = ?auto_777343 ?auto_777348 ) ) ( not ( = ?auto_777344 ?auto_777345 ) ) ( not ( = ?auto_777344 ?auto_777346 ) ) ( not ( = ?auto_777344 ?auto_777347 ) ) ( not ( = ?auto_777344 ?auto_777348 ) ) ( not ( = ?auto_777345 ?auto_777346 ) ) ( not ( = ?auto_777345 ?auto_777347 ) ) ( not ( = ?auto_777345 ?auto_777348 ) ) ( not ( = ?auto_777346 ?auto_777347 ) ) ( not ( = ?auto_777346 ?auto_777348 ) ) ( not ( = ?auto_777347 ?auto_777348 ) ) ( ON ?auto_777346 ?auto_777347 ) ( ON ?auto_777345 ?auto_777346 ) ( ON ?auto_777344 ?auto_777345 ) ( ON ?auto_777343 ?auto_777344 ) ( ON ?auto_777342 ?auto_777343 ) ( CLEAR ?auto_777340 ) ( ON ?auto_777341 ?auto_777342 ) ( CLEAR ?auto_777341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_777336 ?auto_777337 ?auto_777338 ?auto_777339 ?auto_777340 ?auto_777341 )
      ( MAKE-12PILE ?auto_777336 ?auto_777337 ?auto_777338 ?auto_777339 ?auto_777340 ?auto_777341 ?auto_777342 ?auto_777343 ?auto_777344 ?auto_777345 ?auto_777346 ?auto_777347 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_777386 - BLOCK
      ?auto_777387 - BLOCK
      ?auto_777388 - BLOCK
      ?auto_777389 - BLOCK
      ?auto_777390 - BLOCK
      ?auto_777391 - BLOCK
      ?auto_777392 - BLOCK
      ?auto_777393 - BLOCK
      ?auto_777394 - BLOCK
      ?auto_777395 - BLOCK
      ?auto_777396 - BLOCK
      ?auto_777397 - BLOCK
    )
    :vars
    (
      ?auto_777398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_777397 ?auto_777398 ) ( ON-TABLE ?auto_777386 ) ( ON ?auto_777387 ?auto_777386 ) ( ON ?auto_777388 ?auto_777387 ) ( ON ?auto_777389 ?auto_777388 ) ( not ( = ?auto_777386 ?auto_777387 ) ) ( not ( = ?auto_777386 ?auto_777388 ) ) ( not ( = ?auto_777386 ?auto_777389 ) ) ( not ( = ?auto_777386 ?auto_777390 ) ) ( not ( = ?auto_777386 ?auto_777391 ) ) ( not ( = ?auto_777386 ?auto_777392 ) ) ( not ( = ?auto_777386 ?auto_777393 ) ) ( not ( = ?auto_777386 ?auto_777394 ) ) ( not ( = ?auto_777386 ?auto_777395 ) ) ( not ( = ?auto_777386 ?auto_777396 ) ) ( not ( = ?auto_777386 ?auto_777397 ) ) ( not ( = ?auto_777386 ?auto_777398 ) ) ( not ( = ?auto_777387 ?auto_777388 ) ) ( not ( = ?auto_777387 ?auto_777389 ) ) ( not ( = ?auto_777387 ?auto_777390 ) ) ( not ( = ?auto_777387 ?auto_777391 ) ) ( not ( = ?auto_777387 ?auto_777392 ) ) ( not ( = ?auto_777387 ?auto_777393 ) ) ( not ( = ?auto_777387 ?auto_777394 ) ) ( not ( = ?auto_777387 ?auto_777395 ) ) ( not ( = ?auto_777387 ?auto_777396 ) ) ( not ( = ?auto_777387 ?auto_777397 ) ) ( not ( = ?auto_777387 ?auto_777398 ) ) ( not ( = ?auto_777388 ?auto_777389 ) ) ( not ( = ?auto_777388 ?auto_777390 ) ) ( not ( = ?auto_777388 ?auto_777391 ) ) ( not ( = ?auto_777388 ?auto_777392 ) ) ( not ( = ?auto_777388 ?auto_777393 ) ) ( not ( = ?auto_777388 ?auto_777394 ) ) ( not ( = ?auto_777388 ?auto_777395 ) ) ( not ( = ?auto_777388 ?auto_777396 ) ) ( not ( = ?auto_777388 ?auto_777397 ) ) ( not ( = ?auto_777388 ?auto_777398 ) ) ( not ( = ?auto_777389 ?auto_777390 ) ) ( not ( = ?auto_777389 ?auto_777391 ) ) ( not ( = ?auto_777389 ?auto_777392 ) ) ( not ( = ?auto_777389 ?auto_777393 ) ) ( not ( = ?auto_777389 ?auto_777394 ) ) ( not ( = ?auto_777389 ?auto_777395 ) ) ( not ( = ?auto_777389 ?auto_777396 ) ) ( not ( = ?auto_777389 ?auto_777397 ) ) ( not ( = ?auto_777389 ?auto_777398 ) ) ( not ( = ?auto_777390 ?auto_777391 ) ) ( not ( = ?auto_777390 ?auto_777392 ) ) ( not ( = ?auto_777390 ?auto_777393 ) ) ( not ( = ?auto_777390 ?auto_777394 ) ) ( not ( = ?auto_777390 ?auto_777395 ) ) ( not ( = ?auto_777390 ?auto_777396 ) ) ( not ( = ?auto_777390 ?auto_777397 ) ) ( not ( = ?auto_777390 ?auto_777398 ) ) ( not ( = ?auto_777391 ?auto_777392 ) ) ( not ( = ?auto_777391 ?auto_777393 ) ) ( not ( = ?auto_777391 ?auto_777394 ) ) ( not ( = ?auto_777391 ?auto_777395 ) ) ( not ( = ?auto_777391 ?auto_777396 ) ) ( not ( = ?auto_777391 ?auto_777397 ) ) ( not ( = ?auto_777391 ?auto_777398 ) ) ( not ( = ?auto_777392 ?auto_777393 ) ) ( not ( = ?auto_777392 ?auto_777394 ) ) ( not ( = ?auto_777392 ?auto_777395 ) ) ( not ( = ?auto_777392 ?auto_777396 ) ) ( not ( = ?auto_777392 ?auto_777397 ) ) ( not ( = ?auto_777392 ?auto_777398 ) ) ( not ( = ?auto_777393 ?auto_777394 ) ) ( not ( = ?auto_777393 ?auto_777395 ) ) ( not ( = ?auto_777393 ?auto_777396 ) ) ( not ( = ?auto_777393 ?auto_777397 ) ) ( not ( = ?auto_777393 ?auto_777398 ) ) ( not ( = ?auto_777394 ?auto_777395 ) ) ( not ( = ?auto_777394 ?auto_777396 ) ) ( not ( = ?auto_777394 ?auto_777397 ) ) ( not ( = ?auto_777394 ?auto_777398 ) ) ( not ( = ?auto_777395 ?auto_777396 ) ) ( not ( = ?auto_777395 ?auto_777397 ) ) ( not ( = ?auto_777395 ?auto_777398 ) ) ( not ( = ?auto_777396 ?auto_777397 ) ) ( not ( = ?auto_777396 ?auto_777398 ) ) ( not ( = ?auto_777397 ?auto_777398 ) ) ( ON ?auto_777396 ?auto_777397 ) ( ON ?auto_777395 ?auto_777396 ) ( ON ?auto_777394 ?auto_777395 ) ( ON ?auto_777393 ?auto_777394 ) ( ON ?auto_777392 ?auto_777393 ) ( ON ?auto_777391 ?auto_777392 ) ( CLEAR ?auto_777389 ) ( ON ?auto_777390 ?auto_777391 ) ( CLEAR ?auto_777390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_777386 ?auto_777387 ?auto_777388 ?auto_777389 ?auto_777390 )
      ( MAKE-12PILE ?auto_777386 ?auto_777387 ?auto_777388 ?auto_777389 ?auto_777390 ?auto_777391 ?auto_777392 ?auto_777393 ?auto_777394 ?auto_777395 ?auto_777396 ?auto_777397 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_777436 - BLOCK
      ?auto_777437 - BLOCK
      ?auto_777438 - BLOCK
      ?auto_777439 - BLOCK
      ?auto_777440 - BLOCK
      ?auto_777441 - BLOCK
      ?auto_777442 - BLOCK
      ?auto_777443 - BLOCK
      ?auto_777444 - BLOCK
      ?auto_777445 - BLOCK
      ?auto_777446 - BLOCK
      ?auto_777447 - BLOCK
    )
    :vars
    (
      ?auto_777448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_777447 ?auto_777448 ) ( ON-TABLE ?auto_777436 ) ( ON ?auto_777437 ?auto_777436 ) ( ON ?auto_777438 ?auto_777437 ) ( not ( = ?auto_777436 ?auto_777437 ) ) ( not ( = ?auto_777436 ?auto_777438 ) ) ( not ( = ?auto_777436 ?auto_777439 ) ) ( not ( = ?auto_777436 ?auto_777440 ) ) ( not ( = ?auto_777436 ?auto_777441 ) ) ( not ( = ?auto_777436 ?auto_777442 ) ) ( not ( = ?auto_777436 ?auto_777443 ) ) ( not ( = ?auto_777436 ?auto_777444 ) ) ( not ( = ?auto_777436 ?auto_777445 ) ) ( not ( = ?auto_777436 ?auto_777446 ) ) ( not ( = ?auto_777436 ?auto_777447 ) ) ( not ( = ?auto_777436 ?auto_777448 ) ) ( not ( = ?auto_777437 ?auto_777438 ) ) ( not ( = ?auto_777437 ?auto_777439 ) ) ( not ( = ?auto_777437 ?auto_777440 ) ) ( not ( = ?auto_777437 ?auto_777441 ) ) ( not ( = ?auto_777437 ?auto_777442 ) ) ( not ( = ?auto_777437 ?auto_777443 ) ) ( not ( = ?auto_777437 ?auto_777444 ) ) ( not ( = ?auto_777437 ?auto_777445 ) ) ( not ( = ?auto_777437 ?auto_777446 ) ) ( not ( = ?auto_777437 ?auto_777447 ) ) ( not ( = ?auto_777437 ?auto_777448 ) ) ( not ( = ?auto_777438 ?auto_777439 ) ) ( not ( = ?auto_777438 ?auto_777440 ) ) ( not ( = ?auto_777438 ?auto_777441 ) ) ( not ( = ?auto_777438 ?auto_777442 ) ) ( not ( = ?auto_777438 ?auto_777443 ) ) ( not ( = ?auto_777438 ?auto_777444 ) ) ( not ( = ?auto_777438 ?auto_777445 ) ) ( not ( = ?auto_777438 ?auto_777446 ) ) ( not ( = ?auto_777438 ?auto_777447 ) ) ( not ( = ?auto_777438 ?auto_777448 ) ) ( not ( = ?auto_777439 ?auto_777440 ) ) ( not ( = ?auto_777439 ?auto_777441 ) ) ( not ( = ?auto_777439 ?auto_777442 ) ) ( not ( = ?auto_777439 ?auto_777443 ) ) ( not ( = ?auto_777439 ?auto_777444 ) ) ( not ( = ?auto_777439 ?auto_777445 ) ) ( not ( = ?auto_777439 ?auto_777446 ) ) ( not ( = ?auto_777439 ?auto_777447 ) ) ( not ( = ?auto_777439 ?auto_777448 ) ) ( not ( = ?auto_777440 ?auto_777441 ) ) ( not ( = ?auto_777440 ?auto_777442 ) ) ( not ( = ?auto_777440 ?auto_777443 ) ) ( not ( = ?auto_777440 ?auto_777444 ) ) ( not ( = ?auto_777440 ?auto_777445 ) ) ( not ( = ?auto_777440 ?auto_777446 ) ) ( not ( = ?auto_777440 ?auto_777447 ) ) ( not ( = ?auto_777440 ?auto_777448 ) ) ( not ( = ?auto_777441 ?auto_777442 ) ) ( not ( = ?auto_777441 ?auto_777443 ) ) ( not ( = ?auto_777441 ?auto_777444 ) ) ( not ( = ?auto_777441 ?auto_777445 ) ) ( not ( = ?auto_777441 ?auto_777446 ) ) ( not ( = ?auto_777441 ?auto_777447 ) ) ( not ( = ?auto_777441 ?auto_777448 ) ) ( not ( = ?auto_777442 ?auto_777443 ) ) ( not ( = ?auto_777442 ?auto_777444 ) ) ( not ( = ?auto_777442 ?auto_777445 ) ) ( not ( = ?auto_777442 ?auto_777446 ) ) ( not ( = ?auto_777442 ?auto_777447 ) ) ( not ( = ?auto_777442 ?auto_777448 ) ) ( not ( = ?auto_777443 ?auto_777444 ) ) ( not ( = ?auto_777443 ?auto_777445 ) ) ( not ( = ?auto_777443 ?auto_777446 ) ) ( not ( = ?auto_777443 ?auto_777447 ) ) ( not ( = ?auto_777443 ?auto_777448 ) ) ( not ( = ?auto_777444 ?auto_777445 ) ) ( not ( = ?auto_777444 ?auto_777446 ) ) ( not ( = ?auto_777444 ?auto_777447 ) ) ( not ( = ?auto_777444 ?auto_777448 ) ) ( not ( = ?auto_777445 ?auto_777446 ) ) ( not ( = ?auto_777445 ?auto_777447 ) ) ( not ( = ?auto_777445 ?auto_777448 ) ) ( not ( = ?auto_777446 ?auto_777447 ) ) ( not ( = ?auto_777446 ?auto_777448 ) ) ( not ( = ?auto_777447 ?auto_777448 ) ) ( ON ?auto_777446 ?auto_777447 ) ( ON ?auto_777445 ?auto_777446 ) ( ON ?auto_777444 ?auto_777445 ) ( ON ?auto_777443 ?auto_777444 ) ( ON ?auto_777442 ?auto_777443 ) ( ON ?auto_777441 ?auto_777442 ) ( ON ?auto_777440 ?auto_777441 ) ( CLEAR ?auto_777438 ) ( ON ?auto_777439 ?auto_777440 ) ( CLEAR ?auto_777439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_777436 ?auto_777437 ?auto_777438 ?auto_777439 )
      ( MAKE-12PILE ?auto_777436 ?auto_777437 ?auto_777438 ?auto_777439 ?auto_777440 ?auto_777441 ?auto_777442 ?auto_777443 ?auto_777444 ?auto_777445 ?auto_777446 ?auto_777447 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_777486 - BLOCK
      ?auto_777487 - BLOCK
      ?auto_777488 - BLOCK
      ?auto_777489 - BLOCK
      ?auto_777490 - BLOCK
      ?auto_777491 - BLOCK
      ?auto_777492 - BLOCK
      ?auto_777493 - BLOCK
      ?auto_777494 - BLOCK
      ?auto_777495 - BLOCK
      ?auto_777496 - BLOCK
      ?auto_777497 - BLOCK
    )
    :vars
    (
      ?auto_777498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_777497 ?auto_777498 ) ( ON-TABLE ?auto_777486 ) ( ON ?auto_777487 ?auto_777486 ) ( not ( = ?auto_777486 ?auto_777487 ) ) ( not ( = ?auto_777486 ?auto_777488 ) ) ( not ( = ?auto_777486 ?auto_777489 ) ) ( not ( = ?auto_777486 ?auto_777490 ) ) ( not ( = ?auto_777486 ?auto_777491 ) ) ( not ( = ?auto_777486 ?auto_777492 ) ) ( not ( = ?auto_777486 ?auto_777493 ) ) ( not ( = ?auto_777486 ?auto_777494 ) ) ( not ( = ?auto_777486 ?auto_777495 ) ) ( not ( = ?auto_777486 ?auto_777496 ) ) ( not ( = ?auto_777486 ?auto_777497 ) ) ( not ( = ?auto_777486 ?auto_777498 ) ) ( not ( = ?auto_777487 ?auto_777488 ) ) ( not ( = ?auto_777487 ?auto_777489 ) ) ( not ( = ?auto_777487 ?auto_777490 ) ) ( not ( = ?auto_777487 ?auto_777491 ) ) ( not ( = ?auto_777487 ?auto_777492 ) ) ( not ( = ?auto_777487 ?auto_777493 ) ) ( not ( = ?auto_777487 ?auto_777494 ) ) ( not ( = ?auto_777487 ?auto_777495 ) ) ( not ( = ?auto_777487 ?auto_777496 ) ) ( not ( = ?auto_777487 ?auto_777497 ) ) ( not ( = ?auto_777487 ?auto_777498 ) ) ( not ( = ?auto_777488 ?auto_777489 ) ) ( not ( = ?auto_777488 ?auto_777490 ) ) ( not ( = ?auto_777488 ?auto_777491 ) ) ( not ( = ?auto_777488 ?auto_777492 ) ) ( not ( = ?auto_777488 ?auto_777493 ) ) ( not ( = ?auto_777488 ?auto_777494 ) ) ( not ( = ?auto_777488 ?auto_777495 ) ) ( not ( = ?auto_777488 ?auto_777496 ) ) ( not ( = ?auto_777488 ?auto_777497 ) ) ( not ( = ?auto_777488 ?auto_777498 ) ) ( not ( = ?auto_777489 ?auto_777490 ) ) ( not ( = ?auto_777489 ?auto_777491 ) ) ( not ( = ?auto_777489 ?auto_777492 ) ) ( not ( = ?auto_777489 ?auto_777493 ) ) ( not ( = ?auto_777489 ?auto_777494 ) ) ( not ( = ?auto_777489 ?auto_777495 ) ) ( not ( = ?auto_777489 ?auto_777496 ) ) ( not ( = ?auto_777489 ?auto_777497 ) ) ( not ( = ?auto_777489 ?auto_777498 ) ) ( not ( = ?auto_777490 ?auto_777491 ) ) ( not ( = ?auto_777490 ?auto_777492 ) ) ( not ( = ?auto_777490 ?auto_777493 ) ) ( not ( = ?auto_777490 ?auto_777494 ) ) ( not ( = ?auto_777490 ?auto_777495 ) ) ( not ( = ?auto_777490 ?auto_777496 ) ) ( not ( = ?auto_777490 ?auto_777497 ) ) ( not ( = ?auto_777490 ?auto_777498 ) ) ( not ( = ?auto_777491 ?auto_777492 ) ) ( not ( = ?auto_777491 ?auto_777493 ) ) ( not ( = ?auto_777491 ?auto_777494 ) ) ( not ( = ?auto_777491 ?auto_777495 ) ) ( not ( = ?auto_777491 ?auto_777496 ) ) ( not ( = ?auto_777491 ?auto_777497 ) ) ( not ( = ?auto_777491 ?auto_777498 ) ) ( not ( = ?auto_777492 ?auto_777493 ) ) ( not ( = ?auto_777492 ?auto_777494 ) ) ( not ( = ?auto_777492 ?auto_777495 ) ) ( not ( = ?auto_777492 ?auto_777496 ) ) ( not ( = ?auto_777492 ?auto_777497 ) ) ( not ( = ?auto_777492 ?auto_777498 ) ) ( not ( = ?auto_777493 ?auto_777494 ) ) ( not ( = ?auto_777493 ?auto_777495 ) ) ( not ( = ?auto_777493 ?auto_777496 ) ) ( not ( = ?auto_777493 ?auto_777497 ) ) ( not ( = ?auto_777493 ?auto_777498 ) ) ( not ( = ?auto_777494 ?auto_777495 ) ) ( not ( = ?auto_777494 ?auto_777496 ) ) ( not ( = ?auto_777494 ?auto_777497 ) ) ( not ( = ?auto_777494 ?auto_777498 ) ) ( not ( = ?auto_777495 ?auto_777496 ) ) ( not ( = ?auto_777495 ?auto_777497 ) ) ( not ( = ?auto_777495 ?auto_777498 ) ) ( not ( = ?auto_777496 ?auto_777497 ) ) ( not ( = ?auto_777496 ?auto_777498 ) ) ( not ( = ?auto_777497 ?auto_777498 ) ) ( ON ?auto_777496 ?auto_777497 ) ( ON ?auto_777495 ?auto_777496 ) ( ON ?auto_777494 ?auto_777495 ) ( ON ?auto_777493 ?auto_777494 ) ( ON ?auto_777492 ?auto_777493 ) ( ON ?auto_777491 ?auto_777492 ) ( ON ?auto_777490 ?auto_777491 ) ( ON ?auto_777489 ?auto_777490 ) ( CLEAR ?auto_777487 ) ( ON ?auto_777488 ?auto_777489 ) ( CLEAR ?auto_777488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_777486 ?auto_777487 ?auto_777488 )
      ( MAKE-12PILE ?auto_777486 ?auto_777487 ?auto_777488 ?auto_777489 ?auto_777490 ?auto_777491 ?auto_777492 ?auto_777493 ?auto_777494 ?auto_777495 ?auto_777496 ?auto_777497 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_777536 - BLOCK
      ?auto_777537 - BLOCK
      ?auto_777538 - BLOCK
      ?auto_777539 - BLOCK
      ?auto_777540 - BLOCK
      ?auto_777541 - BLOCK
      ?auto_777542 - BLOCK
      ?auto_777543 - BLOCK
      ?auto_777544 - BLOCK
      ?auto_777545 - BLOCK
      ?auto_777546 - BLOCK
      ?auto_777547 - BLOCK
    )
    :vars
    (
      ?auto_777548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_777547 ?auto_777548 ) ( ON-TABLE ?auto_777536 ) ( not ( = ?auto_777536 ?auto_777537 ) ) ( not ( = ?auto_777536 ?auto_777538 ) ) ( not ( = ?auto_777536 ?auto_777539 ) ) ( not ( = ?auto_777536 ?auto_777540 ) ) ( not ( = ?auto_777536 ?auto_777541 ) ) ( not ( = ?auto_777536 ?auto_777542 ) ) ( not ( = ?auto_777536 ?auto_777543 ) ) ( not ( = ?auto_777536 ?auto_777544 ) ) ( not ( = ?auto_777536 ?auto_777545 ) ) ( not ( = ?auto_777536 ?auto_777546 ) ) ( not ( = ?auto_777536 ?auto_777547 ) ) ( not ( = ?auto_777536 ?auto_777548 ) ) ( not ( = ?auto_777537 ?auto_777538 ) ) ( not ( = ?auto_777537 ?auto_777539 ) ) ( not ( = ?auto_777537 ?auto_777540 ) ) ( not ( = ?auto_777537 ?auto_777541 ) ) ( not ( = ?auto_777537 ?auto_777542 ) ) ( not ( = ?auto_777537 ?auto_777543 ) ) ( not ( = ?auto_777537 ?auto_777544 ) ) ( not ( = ?auto_777537 ?auto_777545 ) ) ( not ( = ?auto_777537 ?auto_777546 ) ) ( not ( = ?auto_777537 ?auto_777547 ) ) ( not ( = ?auto_777537 ?auto_777548 ) ) ( not ( = ?auto_777538 ?auto_777539 ) ) ( not ( = ?auto_777538 ?auto_777540 ) ) ( not ( = ?auto_777538 ?auto_777541 ) ) ( not ( = ?auto_777538 ?auto_777542 ) ) ( not ( = ?auto_777538 ?auto_777543 ) ) ( not ( = ?auto_777538 ?auto_777544 ) ) ( not ( = ?auto_777538 ?auto_777545 ) ) ( not ( = ?auto_777538 ?auto_777546 ) ) ( not ( = ?auto_777538 ?auto_777547 ) ) ( not ( = ?auto_777538 ?auto_777548 ) ) ( not ( = ?auto_777539 ?auto_777540 ) ) ( not ( = ?auto_777539 ?auto_777541 ) ) ( not ( = ?auto_777539 ?auto_777542 ) ) ( not ( = ?auto_777539 ?auto_777543 ) ) ( not ( = ?auto_777539 ?auto_777544 ) ) ( not ( = ?auto_777539 ?auto_777545 ) ) ( not ( = ?auto_777539 ?auto_777546 ) ) ( not ( = ?auto_777539 ?auto_777547 ) ) ( not ( = ?auto_777539 ?auto_777548 ) ) ( not ( = ?auto_777540 ?auto_777541 ) ) ( not ( = ?auto_777540 ?auto_777542 ) ) ( not ( = ?auto_777540 ?auto_777543 ) ) ( not ( = ?auto_777540 ?auto_777544 ) ) ( not ( = ?auto_777540 ?auto_777545 ) ) ( not ( = ?auto_777540 ?auto_777546 ) ) ( not ( = ?auto_777540 ?auto_777547 ) ) ( not ( = ?auto_777540 ?auto_777548 ) ) ( not ( = ?auto_777541 ?auto_777542 ) ) ( not ( = ?auto_777541 ?auto_777543 ) ) ( not ( = ?auto_777541 ?auto_777544 ) ) ( not ( = ?auto_777541 ?auto_777545 ) ) ( not ( = ?auto_777541 ?auto_777546 ) ) ( not ( = ?auto_777541 ?auto_777547 ) ) ( not ( = ?auto_777541 ?auto_777548 ) ) ( not ( = ?auto_777542 ?auto_777543 ) ) ( not ( = ?auto_777542 ?auto_777544 ) ) ( not ( = ?auto_777542 ?auto_777545 ) ) ( not ( = ?auto_777542 ?auto_777546 ) ) ( not ( = ?auto_777542 ?auto_777547 ) ) ( not ( = ?auto_777542 ?auto_777548 ) ) ( not ( = ?auto_777543 ?auto_777544 ) ) ( not ( = ?auto_777543 ?auto_777545 ) ) ( not ( = ?auto_777543 ?auto_777546 ) ) ( not ( = ?auto_777543 ?auto_777547 ) ) ( not ( = ?auto_777543 ?auto_777548 ) ) ( not ( = ?auto_777544 ?auto_777545 ) ) ( not ( = ?auto_777544 ?auto_777546 ) ) ( not ( = ?auto_777544 ?auto_777547 ) ) ( not ( = ?auto_777544 ?auto_777548 ) ) ( not ( = ?auto_777545 ?auto_777546 ) ) ( not ( = ?auto_777545 ?auto_777547 ) ) ( not ( = ?auto_777545 ?auto_777548 ) ) ( not ( = ?auto_777546 ?auto_777547 ) ) ( not ( = ?auto_777546 ?auto_777548 ) ) ( not ( = ?auto_777547 ?auto_777548 ) ) ( ON ?auto_777546 ?auto_777547 ) ( ON ?auto_777545 ?auto_777546 ) ( ON ?auto_777544 ?auto_777545 ) ( ON ?auto_777543 ?auto_777544 ) ( ON ?auto_777542 ?auto_777543 ) ( ON ?auto_777541 ?auto_777542 ) ( ON ?auto_777540 ?auto_777541 ) ( ON ?auto_777539 ?auto_777540 ) ( ON ?auto_777538 ?auto_777539 ) ( CLEAR ?auto_777536 ) ( ON ?auto_777537 ?auto_777538 ) ( CLEAR ?auto_777537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_777536 ?auto_777537 )
      ( MAKE-12PILE ?auto_777536 ?auto_777537 ?auto_777538 ?auto_777539 ?auto_777540 ?auto_777541 ?auto_777542 ?auto_777543 ?auto_777544 ?auto_777545 ?auto_777546 ?auto_777547 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_777586 - BLOCK
      ?auto_777587 - BLOCK
      ?auto_777588 - BLOCK
      ?auto_777589 - BLOCK
      ?auto_777590 - BLOCK
      ?auto_777591 - BLOCK
      ?auto_777592 - BLOCK
      ?auto_777593 - BLOCK
      ?auto_777594 - BLOCK
      ?auto_777595 - BLOCK
      ?auto_777596 - BLOCK
      ?auto_777597 - BLOCK
    )
    :vars
    (
      ?auto_777598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_777597 ?auto_777598 ) ( not ( = ?auto_777586 ?auto_777587 ) ) ( not ( = ?auto_777586 ?auto_777588 ) ) ( not ( = ?auto_777586 ?auto_777589 ) ) ( not ( = ?auto_777586 ?auto_777590 ) ) ( not ( = ?auto_777586 ?auto_777591 ) ) ( not ( = ?auto_777586 ?auto_777592 ) ) ( not ( = ?auto_777586 ?auto_777593 ) ) ( not ( = ?auto_777586 ?auto_777594 ) ) ( not ( = ?auto_777586 ?auto_777595 ) ) ( not ( = ?auto_777586 ?auto_777596 ) ) ( not ( = ?auto_777586 ?auto_777597 ) ) ( not ( = ?auto_777586 ?auto_777598 ) ) ( not ( = ?auto_777587 ?auto_777588 ) ) ( not ( = ?auto_777587 ?auto_777589 ) ) ( not ( = ?auto_777587 ?auto_777590 ) ) ( not ( = ?auto_777587 ?auto_777591 ) ) ( not ( = ?auto_777587 ?auto_777592 ) ) ( not ( = ?auto_777587 ?auto_777593 ) ) ( not ( = ?auto_777587 ?auto_777594 ) ) ( not ( = ?auto_777587 ?auto_777595 ) ) ( not ( = ?auto_777587 ?auto_777596 ) ) ( not ( = ?auto_777587 ?auto_777597 ) ) ( not ( = ?auto_777587 ?auto_777598 ) ) ( not ( = ?auto_777588 ?auto_777589 ) ) ( not ( = ?auto_777588 ?auto_777590 ) ) ( not ( = ?auto_777588 ?auto_777591 ) ) ( not ( = ?auto_777588 ?auto_777592 ) ) ( not ( = ?auto_777588 ?auto_777593 ) ) ( not ( = ?auto_777588 ?auto_777594 ) ) ( not ( = ?auto_777588 ?auto_777595 ) ) ( not ( = ?auto_777588 ?auto_777596 ) ) ( not ( = ?auto_777588 ?auto_777597 ) ) ( not ( = ?auto_777588 ?auto_777598 ) ) ( not ( = ?auto_777589 ?auto_777590 ) ) ( not ( = ?auto_777589 ?auto_777591 ) ) ( not ( = ?auto_777589 ?auto_777592 ) ) ( not ( = ?auto_777589 ?auto_777593 ) ) ( not ( = ?auto_777589 ?auto_777594 ) ) ( not ( = ?auto_777589 ?auto_777595 ) ) ( not ( = ?auto_777589 ?auto_777596 ) ) ( not ( = ?auto_777589 ?auto_777597 ) ) ( not ( = ?auto_777589 ?auto_777598 ) ) ( not ( = ?auto_777590 ?auto_777591 ) ) ( not ( = ?auto_777590 ?auto_777592 ) ) ( not ( = ?auto_777590 ?auto_777593 ) ) ( not ( = ?auto_777590 ?auto_777594 ) ) ( not ( = ?auto_777590 ?auto_777595 ) ) ( not ( = ?auto_777590 ?auto_777596 ) ) ( not ( = ?auto_777590 ?auto_777597 ) ) ( not ( = ?auto_777590 ?auto_777598 ) ) ( not ( = ?auto_777591 ?auto_777592 ) ) ( not ( = ?auto_777591 ?auto_777593 ) ) ( not ( = ?auto_777591 ?auto_777594 ) ) ( not ( = ?auto_777591 ?auto_777595 ) ) ( not ( = ?auto_777591 ?auto_777596 ) ) ( not ( = ?auto_777591 ?auto_777597 ) ) ( not ( = ?auto_777591 ?auto_777598 ) ) ( not ( = ?auto_777592 ?auto_777593 ) ) ( not ( = ?auto_777592 ?auto_777594 ) ) ( not ( = ?auto_777592 ?auto_777595 ) ) ( not ( = ?auto_777592 ?auto_777596 ) ) ( not ( = ?auto_777592 ?auto_777597 ) ) ( not ( = ?auto_777592 ?auto_777598 ) ) ( not ( = ?auto_777593 ?auto_777594 ) ) ( not ( = ?auto_777593 ?auto_777595 ) ) ( not ( = ?auto_777593 ?auto_777596 ) ) ( not ( = ?auto_777593 ?auto_777597 ) ) ( not ( = ?auto_777593 ?auto_777598 ) ) ( not ( = ?auto_777594 ?auto_777595 ) ) ( not ( = ?auto_777594 ?auto_777596 ) ) ( not ( = ?auto_777594 ?auto_777597 ) ) ( not ( = ?auto_777594 ?auto_777598 ) ) ( not ( = ?auto_777595 ?auto_777596 ) ) ( not ( = ?auto_777595 ?auto_777597 ) ) ( not ( = ?auto_777595 ?auto_777598 ) ) ( not ( = ?auto_777596 ?auto_777597 ) ) ( not ( = ?auto_777596 ?auto_777598 ) ) ( not ( = ?auto_777597 ?auto_777598 ) ) ( ON ?auto_777596 ?auto_777597 ) ( ON ?auto_777595 ?auto_777596 ) ( ON ?auto_777594 ?auto_777595 ) ( ON ?auto_777593 ?auto_777594 ) ( ON ?auto_777592 ?auto_777593 ) ( ON ?auto_777591 ?auto_777592 ) ( ON ?auto_777590 ?auto_777591 ) ( ON ?auto_777589 ?auto_777590 ) ( ON ?auto_777588 ?auto_777589 ) ( ON ?auto_777587 ?auto_777588 ) ( ON ?auto_777586 ?auto_777587 ) ( CLEAR ?auto_777586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_777586 )
      ( MAKE-12PILE ?auto_777586 ?auto_777587 ?auto_777588 ?auto_777589 ?auto_777590 ?auto_777591 ?auto_777592 ?auto_777593 ?auto_777594 ?auto_777595 ?auto_777596 ?auto_777597 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_777637 - BLOCK
      ?auto_777638 - BLOCK
      ?auto_777639 - BLOCK
      ?auto_777640 - BLOCK
      ?auto_777641 - BLOCK
      ?auto_777642 - BLOCK
      ?auto_777643 - BLOCK
      ?auto_777644 - BLOCK
      ?auto_777645 - BLOCK
      ?auto_777646 - BLOCK
      ?auto_777647 - BLOCK
      ?auto_777648 - BLOCK
      ?auto_777649 - BLOCK
    )
    :vars
    (
      ?auto_777650 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_777648 ) ( ON ?auto_777649 ?auto_777650 ) ( CLEAR ?auto_777649 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_777637 ) ( ON ?auto_777638 ?auto_777637 ) ( ON ?auto_777639 ?auto_777638 ) ( ON ?auto_777640 ?auto_777639 ) ( ON ?auto_777641 ?auto_777640 ) ( ON ?auto_777642 ?auto_777641 ) ( ON ?auto_777643 ?auto_777642 ) ( ON ?auto_777644 ?auto_777643 ) ( ON ?auto_777645 ?auto_777644 ) ( ON ?auto_777646 ?auto_777645 ) ( ON ?auto_777647 ?auto_777646 ) ( ON ?auto_777648 ?auto_777647 ) ( not ( = ?auto_777637 ?auto_777638 ) ) ( not ( = ?auto_777637 ?auto_777639 ) ) ( not ( = ?auto_777637 ?auto_777640 ) ) ( not ( = ?auto_777637 ?auto_777641 ) ) ( not ( = ?auto_777637 ?auto_777642 ) ) ( not ( = ?auto_777637 ?auto_777643 ) ) ( not ( = ?auto_777637 ?auto_777644 ) ) ( not ( = ?auto_777637 ?auto_777645 ) ) ( not ( = ?auto_777637 ?auto_777646 ) ) ( not ( = ?auto_777637 ?auto_777647 ) ) ( not ( = ?auto_777637 ?auto_777648 ) ) ( not ( = ?auto_777637 ?auto_777649 ) ) ( not ( = ?auto_777637 ?auto_777650 ) ) ( not ( = ?auto_777638 ?auto_777639 ) ) ( not ( = ?auto_777638 ?auto_777640 ) ) ( not ( = ?auto_777638 ?auto_777641 ) ) ( not ( = ?auto_777638 ?auto_777642 ) ) ( not ( = ?auto_777638 ?auto_777643 ) ) ( not ( = ?auto_777638 ?auto_777644 ) ) ( not ( = ?auto_777638 ?auto_777645 ) ) ( not ( = ?auto_777638 ?auto_777646 ) ) ( not ( = ?auto_777638 ?auto_777647 ) ) ( not ( = ?auto_777638 ?auto_777648 ) ) ( not ( = ?auto_777638 ?auto_777649 ) ) ( not ( = ?auto_777638 ?auto_777650 ) ) ( not ( = ?auto_777639 ?auto_777640 ) ) ( not ( = ?auto_777639 ?auto_777641 ) ) ( not ( = ?auto_777639 ?auto_777642 ) ) ( not ( = ?auto_777639 ?auto_777643 ) ) ( not ( = ?auto_777639 ?auto_777644 ) ) ( not ( = ?auto_777639 ?auto_777645 ) ) ( not ( = ?auto_777639 ?auto_777646 ) ) ( not ( = ?auto_777639 ?auto_777647 ) ) ( not ( = ?auto_777639 ?auto_777648 ) ) ( not ( = ?auto_777639 ?auto_777649 ) ) ( not ( = ?auto_777639 ?auto_777650 ) ) ( not ( = ?auto_777640 ?auto_777641 ) ) ( not ( = ?auto_777640 ?auto_777642 ) ) ( not ( = ?auto_777640 ?auto_777643 ) ) ( not ( = ?auto_777640 ?auto_777644 ) ) ( not ( = ?auto_777640 ?auto_777645 ) ) ( not ( = ?auto_777640 ?auto_777646 ) ) ( not ( = ?auto_777640 ?auto_777647 ) ) ( not ( = ?auto_777640 ?auto_777648 ) ) ( not ( = ?auto_777640 ?auto_777649 ) ) ( not ( = ?auto_777640 ?auto_777650 ) ) ( not ( = ?auto_777641 ?auto_777642 ) ) ( not ( = ?auto_777641 ?auto_777643 ) ) ( not ( = ?auto_777641 ?auto_777644 ) ) ( not ( = ?auto_777641 ?auto_777645 ) ) ( not ( = ?auto_777641 ?auto_777646 ) ) ( not ( = ?auto_777641 ?auto_777647 ) ) ( not ( = ?auto_777641 ?auto_777648 ) ) ( not ( = ?auto_777641 ?auto_777649 ) ) ( not ( = ?auto_777641 ?auto_777650 ) ) ( not ( = ?auto_777642 ?auto_777643 ) ) ( not ( = ?auto_777642 ?auto_777644 ) ) ( not ( = ?auto_777642 ?auto_777645 ) ) ( not ( = ?auto_777642 ?auto_777646 ) ) ( not ( = ?auto_777642 ?auto_777647 ) ) ( not ( = ?auto_777642 ?auto_777648 ) ) ( not ( = ?auto_777642 ?auto_777649 ) ) ( not ( = ?auto_777642 ?auto_777650 ) ) ( not ( = ?auto_777643 ?auto_777644 ) ) ( not ( = ?auto_777643 ?auto_777645 ) ) ( not ( = ?auto_777643 ?auto_777646 ) ) ( not ( = ?auto_777643 ?auto_777647 ) ) ( not ( = ?auto_777643 ?auto_777648 ) ) ( not ( = ?auto_777643 ?auto_777649 ) ) ( not ( = ?auto_777643 ?auto_777650 ) ) ( not ( = ?auto_777644 ?auto_777645 ) ) ( not ( = ?auto_777644 ?auto_777646 ) ) ( not ( = ?auto_777644 ?auto_777647 ) ) ( not ( = ?auto_777644 ?auto_777648 ) ) ( not ( = ?auto_777644 ?auto_777649 ) ) ( not ( = ?auto_777644 ?auto_777650 ) ) ( not ( = ?auto_777645 ?auto_777646 ) ) ( not ( = ?auto_777645 ?auto_777647 ) ) ( not ( = ?auto_777645 ?auto_777648 ) ) ( not ( = ?auto_777645 ?auto_777649 ) ) ( not ( = ?auto_777645 ?auto_777650 ) ) ( not ( = ?auto_777646 ?auto_777647 ) ) ( not ( = ?auto_777646 ?auto_777648 ) ) ( not ( = ?auto_777646 ?auto_777649 ) ) ( not ( = ?auto_777646 ?auto_777650 ) ) ( not ( = ?auto_777647 ?auto_777648 ) ) ( not ( = ?auto_777647 ?auto_777649 ) ) ( not ( = ?auto_777647 ?auto_777650 ) ) ( not ( = ?auto_777648 ?auto_777649 ) ) ( not ( = ?auto_777648 ?auto_777650 ) ) ( not ( = ?auto_777649 ?auto_777650 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_777649 ?auto_777650 )
      ( !STACK ?auto_777649 ?auto_777648 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_777691 - BLOCK
      ?auto_777692 - BLOCK
      ?auto_777693 - BLOCK
      ?auto_777694 - BLOCK
      ?auto_777695 - BLOCK
      ?auto_777696 - BLOCK
      ?auto_777697 - BLOCK
      ?auto_777698 - BLOCK
      ?auto_777699 - BLOCK
      ?auto_777700 - BLOCK
      ?auto_777701 - BLOCK
      ?auto_777702 - BLOCK
      ?auto_777703 - BLOCK
    )
    :vars
    (
      ?auto_777704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_777703 ?auto_777704 ) ( ON-TABLE ?auto_777691 ) ( ON ?auto_777692 ?auto_777691 ) ( ON ?auto_777693 ?auto_777692 ) ( ON ?auto_777694 ?auto_777693 ) ( ON ?auto_777695 ?auto_777694 ) ( ON ?auto_777696 ?auto_777695 ) ( ON ?auto_777697 ?auto_777696 ) ( ON ?auto_777698 ?auto_777697 ) ( ON ?auto_777699 ?auto_777698 ) ( ON ?auto_777700 ?auto_777699 ) ( ON ?auto_777701 ?auto_777700 ) ( not ( = ?auto_777691 ?auto_777692 ) ) ( not ( = ?auto_777691 ?auto_777693 ) ) ( not ( = ?auto_777691 ?auto_777694 ) ) ( not ( = ?auto_777691 ?auto_777695 ) ) ( not ( = ?auto_777691 ?auto_777696 ) ) ( not ( = ?auto_777691 ?auto_777697 ) ) ( not ( = ?auto_777691 ?auto_777698 ) ) ( not ( = ?auto_777691 ?auto_777699 ) ) ( not ( = ?auto_777691 ?auto_777700 ) ) ( not ( = ?auto_777691 ?auto_777701 ) ) ( not ( = ?auto_777691 ?auto_777702 ) ) ( not ( = ?auto_777691 ?auto_777703 ) ) ( not ( = ?auto_777691 ?auto_777704 ) ) ( not ( = ?auto_777692 ?auto_777693 ) ) ( not ( = ?auto_777692 ?auto_777694 ) ) ( not ( = ?auto_777692 ?auto_777695 ) ) ( not ( = ?auto_777692 ?auto_777696 ) ) ( not ( = ?auto_777692 ?auto_777697 ) ) ( not ( = ?auto_777692 ?auto_777698 ) ) ( not ( = ?auto_777692 ?auto_777699 ) ) ( not ( = ?auto_777692 ?auto_777700 ) ) ( not ( = ?auto_777692 ?auto_777701 ) ) ( not ( = ?auto_777692 ?auto_777702 ) ) ( not ( = ?auto_777692 ?auto_777703 ) ) ( not ( = ?auto_777692 ?auto_777704 ) ) ( not ( = ?auto_777693 ?auto_777694 ) ) ( not ( = ?auto_777693 ?auto_777695 ) ) ( not ( = ?auto_777693 ?auto_777696 ) ) ( not ( = ?auto_777693 ?auto_777697 ) ) ( not ( = ?auto_777693 ?auto_777698 ) ) ( not ( = ?auto_777693 ?auto_777699 ) ) ( not ( = ?auto_777693 ?auto_777700 ) ) ( not ( = ?auto_777693 ?auto_777701 ) ) ( not ( = ?auto_777693 ?auto_777702 ) ) ( not ( = ?auto_777693 ?auto_777703 ) ) ( not ( = ?auto_777693 ?auto_777704 ) ) ( not ( = ?auto_777694 ?auto_777695 ) ) ( not ( = ?auto_777694 ?auto_777696 ) ) ( not ( = ?auto_777694 ?auto_777697 ) ) ( not ( = ?auto_777694 ?auto_777698 ) ) ( not ( = ?auto_777694 ?auto_777699 ) ) ( not ( = ?auto_777694 ?auto_777700 ) ) ( not ( = ?auto_777694 ?auto_777701 ) ) ( not ( = ?auto_777694 ?auto_777702 ) ) ( not ( = ?auto_777694 ?auto_777703 ) ) ( not ( = ?auto_777694 ?auto_777704 ) ) ( not ( = ?auto_777695 ?auto_777696 ) ) ( not ( = ?auto_777695 ?auto_777697 ) ) ( not ( = ?auto_777695 ?auto_777698 ) ) ( not ( = ?auto_777695 ?auto_777699 ) ) ( not ( = ?auto_777695 ?auto_777700 ) ) ( not ( = ?auto_777695 ?auto_777701 ) ) ( not ( = ?auto_777695 ?auto_777702 ) ) ( not ( = ?auto_777695 ?auto_777703 ) ) ( not ( = ?auto_777695 ?auto_777704 ) ) ( not ( = ?auto_777696 ?auto_777697 ) ) ( not ( = ?auto_777696 ?auto_777698 ) ) ( not ( = ?auto_777696 ?auto_777699 ) ) ( not ( = ?auto_777696 ?auto_777700 ) ) ( not ( = ?auto_777696 ?auto_777701 ) ) ( not ( = ?auto_777696 ?auto_777702 ) ) ( not ( = ?auto_777696 ?auto_777703 ) ) ( not ( = ?auto_777696 ?auto_777704 ) ) ( not ( = ?auto_777697 ?auto_777698 ) ) ( not ( = ?auto_777697 ?auto_777699 ) ) ( not ( = ?auto_777697 ?auto_777700 ) ) ( not ( = ?auto_777697 ?auto_777701 ) ) ( not ( = ?auto_777697 ?auto_777702 ) ) ( not ( = ?auto_777697 ?auto_777703 ) ) ( not ( = ?auto_777697 ?auto_777704 ) ) ( not ( = ?auto_777698 ?auto_777699 ) ) ( not ( = ?auto_777698 ?auto_777700 ) ) ( not ( = ?auto_777698 ?auto_777701 ) ) ( not ( = ?auto_777698 ?auto_777702 ) ) ( not ( = ?auto_777698 ?auto_777703 ) ) ( not ( = ?auto_777698 ?auto_777704 ) ) ( not ( = ?auto_777699 ?auto_777700 ) ) ( not ( = ?auto_777699 ?auto_777701 ) ) ( not ( = ?auto_777699 ?auto_777702 ) ) ( not ( = ?auto_777699 ?auto_777703 ) ) ( not ( = ?auto_777699 ?auto_777704 ) ) ( not ( = ?auto_777700 ?auto_777701 ) ) ( not ( = ?auto_777700 ?auto_777702 ) ) ( not ( = ?auto_777700 ?auto_777703 ) ) ( not ( = ?auto_777700 ?auto_777704 ) ) ( not ( = ?auto_777701 ?auto_777702 ) ) ( not ( = ?auto_777701 ?auto_777703 ) ) ( not ( = ?auto_777701 ?auto_777704 ) ) ( not ( = ?auto_777702 ?auto_777703 ) ) ( not ( = ?auto_777702 ?auto_777704 ) ) ( not ( = ?auto_777703 ?auto_777704 ) ) ( CLEAR ?auto_777701 ) ( ON ?auto_777702 ?auto_777703 ) ( CLEAR ?auto_777702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_777691 ?auto_777692 ?auto_777693 ?auto_777694 ?auto_777695 ?auto_777696 ?auto_777697 ?auto_777698 ?auto_777699 ?auto_777700 ?auto_777701 ?auto_777702 )
      ( MAKE-13PILE ?auto_777691 ?auto_777692 ?auto_777693 ?auto_777694 ?auto_777695 ?auto_777696 ?auto_777697 ?auto_777698 ?auto_777699 ?auto_777700 ?auto_777701 ?auto_777702 ?auto_777703 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_777745 - BLOCK
      ?auto_777746 - BLOCK
      ?auto_777747 - BLOCK
      ?auto_777748 - BLOCK
      ?auto_777749 - BLOCK
      ?auto_777750 - BLOCK
      ?auto_777751 - BLOCK
      ?auto_777752 - BLOCK
      ?auto_777753 - BLOCK
      ?auto_777754 - BLOCK
      ?auto_777755 - BLOCK
      ?auto_777756 - BLOCK
      ?auto_777757 - BLOCK
    )
    :vars
    (
      ?auto_777758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_777757 ?auto_777758 ) ( ON-TABLE ?auto_777745 ) ( ON ?auto_777746 ?auto_777745 ) ( ON ?auto_777747 ?auto_777746 ) ( ON ?auto_777748 ?auto_777747 ) ( ON ?auto_777749 ?auto_777748 ) ( ON ?auto_777750 ?auto_777749 ) ( ON ?auto_777751 ?auto_777750 ) ( ON ?auto_777752 ?auto_777751 ) ( ON ?auto_777753 ?auto_777752 ) ( ON ?auto_777754 ?auto_777753 ) ( not ( = ?auto_777745 ?auto_777746 ) ) ( not ( = ?auto_777745 ?auto_777747 ) ) ( not ( = ?auto_777745 ?auto_777748 ) ) ( not ( = ?auto_777745 ?auto_777749 ) ) ( not ( = ?auto_777745 ?auto_777750 ) ) ( not ( = ?auto_777745 ?auto_777751 ) ) ( not ( = ?auto_777745 ?auto_777752 ) ) ( not ( = ?auto_777745 ?auto_777753 ) ) ( not ( = ?auto_777745 ?auto_777754 ) ) ( not ( = ?auto_777745 ?auto_777755 ) ) ( not ( = ?auto_777745 ?auto_777756 ) ) ( not ( = ?auto_777745 ?auto_777757 ) ) ( not ( = ?auto_777745 ?auto_777758 ) ) ( not ( = ?auto_777746 ?auto_777747 ) ) ( not ( = ?auto_777746 ?auto_777748 ) ) ( not ( = ?auto_777746 ?auto_777749 ) ) ( not ( = ?auto_777746 ?auto_777750 ) ) ( not ( = ?auto_777746 ?auto_777751 ) ) ( not ( = ?auto_777746 ?auto_777752 ) ) ( not ( = ?auto_777746 ?auto_777753 ) ) ( not ( = ?auto_777746 ?auto_777754 ) ) ( not ( = ?auto_777746 ?auto_777755 ) ) ( not ( = ?auto_777746 ?auto_777756 ) ) ( not ( = ?auto_777746 ?auto_777757 ) ) ( not ( = ?auto_777746 ?auto_777758 ) ) ( not ( = ?auto_777747 ?auto_777748 ) ) ( not ( = ?auto_777747 ?auto_777749 ) ) ( not ( = ?auto_777747 ?auto_777750 ) ) ( not ( = ?auto_777747 ?auto_777751 ) ) ( not ( = ?auto_777747 ?auto_777752 ) ) ( not ( = ?auto_777747 ?auto_777753 ) ) ( not ( = ?auto_777747 ?auto_777754 ) ) ( not ( = ?auto_777747 ?auto_777755 ) ) ( not ( = ?auto_777747 ?auto_777756 ) ) ( not ( = ?auto_777747 ?auto_777757 ) ) ( not ( = ?auto_777747 ?auto_777758 ) ) ( not ( = ?auto_777748 ?auto_777749 ) ) ( not ( = ?auto_777748 ?auto_777750 ) ) ( not ( = ?auto_777748 ?auto_777751 ) ) ( not ( = ?auto_777748 ?auto_777752 ) ) ( not ( = ?auto_777748 ?auto_777753 ) ) ( not ( = ?auto_777748 ?auto_777754 ) ) ( not ( = ?auto_777748 ?auto_777755 ) ) ( not ( = ?auto_777748 ?auto_777756 ) ) ( not ( = ?auto_777748 ?auto_777757 ) ) ( not ( = ?auto_777748 ?auto_777758 ) ) ( not ( = ?auto_777749 ?auto_777750 ) ) ( not ( = ?auto_777749 ?auto_777751 ) ) ( not ( = ?auto_777749 ?auto_777752 ) ) ( not ( = ?auto_777749 ?auto_777753 ) ) ( not ( = ?auto_777749 ?auto_777754 ) ) ( not ( = ?auto_777749 ?auto_777755 ) ) ( not ( = ?auto_777749 ?auto_777756 ) ) ( not ( = ?auto_777749 ?auto_777757 ) ) ( not ( = ?auto_777749 ?auto_777758 ) ) ( not ( = ?auto_777750 ?auto_777751 ) ) ( not ( = ?auto_777750 ?auto_777752 ) ) ( not ( = ?auto_777750 ?auto_777753 ) ) ( not ( = ?auto_777750 ?auto_777754 ) ) ( not ( = ?auto_777750 ?auto_777755 ) ) ( not ( = ?auto_777750 ?auto_777756 ) ) ( not ( = ?auto_777750 ?auto_777757 ) ) ( not ( = ?auto_777750 ?auto_777758 ) ) ( not ( = ?auto_777751 ?auto_777752 ) ) ( not ( = ?auto_777751 ?auto_777753 ) ) ( not ( = ?auto_777751 ?auto_777754 ) ) ( not ( = ?auto_777751 ?auto_777755 ) ) ( not ( = ?auto_777751 ?auto_777756 ) ) ( not ( = ?auto_777751 ?auto_777757 ) ) ( not ( = ?auto_777751 ?auto_777758 ) ) ( not ( = ?auto_777752 ?auto_777753 ) ) ( not ( = ?auto_777752 ?auto_777754 ) ) ( not ( = ?auto_777752 ?auto_777755 ) ) ( not ( = ?auto_777752 ?auto_777756 ) ) ( not ( = ?auto_777752 ?auto_777757 ) ) ( not ( = ?auto_777752 ?auto_777758 ) ) ( not ( = ?auto_777753 ?auto_777754 ) ) ( not ( = ?auto_777753 ?auto_777755 ) ) ( not ( = ?auto_777753 ?auto_777756 ) ) ( not ( = ?auto_777753 ?auto_777757 ) ) ( not ( = ?auto_777753 ?auto_777758 ) ) ( not ( = ?auto_777754 ?auto_777755 ) ) ( not ( = ?auto_777754 ?auto_777756 ) ) ( not ( = ?auto_777754 ?auto_777757 ) ) ( not ( = ?auto_777754 ?auto_777758 ) ) ( not ( = ?auto_777755 ?auto_777756 ) ) ( not ( = ?auto_777755 ?auto_777757 ) ) ( not ( = ?auto_777755 ?auto_777758 ) ) ( not ( = ?auto_777756 ?auto_777757 ) ) ( not ( = ?auto_777756 ?auto_777758 ) ) ( not ( = ?auto_777757 ?auto_777758 ) ) ( ON ?auto_777756 ?auto_777757 ) ( CLEAR ?auto_777754 ) ( ON ?auto_777755 ?auto_777756 ) ( CLEAR ?auto_777755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_777745 ?auto_777746 ?auto_777747 ?auto_777748 ?auto_777749 ?auto_777750 ?auto_777751 ?auto_777752 ?auto_777753 ?auto_777754 ?auto_777755 )
      ( MAKE-13PILE ?auto_777745 ?auto_777746 ?auto_777747 ?auto_777748 ?auto_777749 ?auto_777750 ?auto_777751 ?auto_777752 ?auto_777753 ?auto_777754 ?auto_777755 ?auto_777756 ?auto_777757 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_777799 - BLOCK
      ?auto_777800 - BLOCK
      ?auto_777801 - BLOCK
      ?auto_777802 - BLOCK
      ?auto_777803 - BLOCK
      ?auto_777804 - BLOCK
      ?auto_777805 - BLOCK
      ?auto_777806 - BLOCK
      ?auto_777807 - BLOCK
      ?auto_777808 - BLOCK
      ?auto_777809 - BLOCK
      ?auto_777810 - BLOCK
      ?auto_777811 - BLOCK
    )
    :vars
    (
      ?auto_777812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_777811 ?auto_777812 ) ( ON-TABLE ?auto_777799 ) ( ON ?auto_777800 ?auto_777799 ) ( ON ?auto_777801 ?auto_777800 ) ( ON ?auto_777802 ?auto_777801 ) ( ON ?auto_777803 ?auto_777802 ) ( ON ?auto_777804 ?auto_777803 ) ( ON ?auto_777805 ?auto_777804 ) ( ON ?auto_777806 ?auto_777805 ) ( ON ?auto_777807 ?auto_777806 ) ( not ( = ?auto_777799 ?auto_777800 ) ) ( not ( = ?auto_777799 ?auto_777801 ) ) ( not ( = ?auto_777799 ?auto_777802 ) ) ( not ( = ?auto_777799 ?auto_777803 ) ) ( not ( = ?auto_777799 ?auto_777804 ) ) ( not ( = ?auto_777799 ?auto_777805 ) ) ( not ( = ?auto_777799 ?auto_777806 ) ) ( not ( = ?auto_777799 ?auto_777807 ) ) ( not ( = ?auto_777799 ?auto_777808 ) ) ( not ( = ?auto_777799 ?auto_777809 ) ) ( not ( = ?auto_777799 ?auto_777810 ) ) ( not ( = ?auto_777799 ?auto_777811 ) ) ( not ( = ?auto_777799 ?auto_777812 ) ) ( not ( = ?auto_777800 ?auto_777801 ) ) ( not ( = ?auto_777800 ?auto_777802 ) ) ( not ( = ?auto_777800 ?auto_777803 ) ) ( not ( = ?auto_777800 ?auto_777804 ) ) ( not ( = ?auto_777800 ?auto_777805 ) ) ( not ( = ?auto_777800 ?auto_777806 ) ) ( not ( = ?auto_777800 ?auto_777807 ) ) ( not ( = ?auto_777800 ?auto_777808 ) ) ( not ( = ?auto_777800 ?auto_777809 ) ) ( not ( = ?auto_777800 ?auto_777810 ) ) ( not ( = ?auto_777800 ?auto_777811 ) ) ( not ( = ?auto_777800 ?auto_777812 ) ) ( not ( = ?auto_777801 ?auto_777802 ) ) ( not ( = ?auto_777801 ?auto_777803 ) ) ( not ( = ?auto_777801 ?auto_777804 ) ) ( not ( = ?auto_777801 ?auto_777805 ) ) ( not ( = ?auto_777801 ?auto_777806 ) ) ( not ( = ?auto_777801 ?auto_777807 ) ) ( not ( = ?auto_777801 ?auto_777808 ) ) ( not ( = ?auto_777801 ?auto_777809 ) ) ( not ( = ?auto_777801 ?auto_777810 ) ) ( not ( = ?auto_777801 ?auto_777811 ) ) ( not ( = ?auto_777801 ?auto_777812 ) ) ( not ( = ?auto_777802 ?auto_777803 ) ) ( not ( = ?auto_777802 ?auto_777804 ) ) ( not ( = ?auto_777802 ?auto_777805 ) ) ( not ( = ?auto_777802 ?auto_777806 ) ) ( not ( = ?auto_777802 ?auto_777807 ) ) ( not ( = ?auto_777802 ?auto_777808 ) ) ( not ( = ?auto_777802 ?auto_777809 ) ) ( not ( = ?auto_777802 ?auto_777810 ) ) ( not ( = ?auto_777802 ?auto_777811 ) ) ( not ( = ?auto_777802 ?auto_777812 ) ) ( not ( = ?auto_777803 ?auto_777804 ) ) ( not ( = ?auto_777803 ?auto_777805 ) ) ( not ( = ?auto_777803 ?auto_777806 ) ) ( not ( = ?auto_777803 ?auto_777807 ) ) ( not ( = ?auto_777803 ?auto_777808 ) ) ( not ( = ?auto_777803 ?auto_777809 ) ) ( not ( = ?auto_777803 ?auto_777810 ) ) ( not ( = ?auto_777803 ?auto_777811 ) ) ( not ( = ?auto_777803 ?auto_777812 ) ) ( not ( = ?auto_777804 ?auto_777805 ) ) ( not ( = ?auto_777804 ?auto_777806 ) ) ( not ( = ?auto_777804 ?auto_777807 ) ) ( not ( = ?auto_777804 ?auto_777808 ) ) ( not ( = ?auto_777804 ?auto_777809 ) ) ( not ( = ?auto_777804 ?auto_777810 ) ) ( not ( = ?auto_777804 ?auto_777811 ) ) ( not ( = ?auto_777804 ?auto_777812 ) ) ( not ( = ?auto_777805 ?auto_777806 ) ) ( not ( = ?auto_777805 ?auto_777807 ) ) ( not ( = ?auto_777805 ?auto_777808 ) ) ( not ( = ?auto_777805 ?auto_777809 ) ) ( not ( = ?auto_777805 ?auto_777810 ) ) ( not ( = ?auto_777805 ?auto_777811 ) ) ( not ( = ?auto_777805 ?auto_777812 ) ) ( not ( = ?auto_777806 ?auto_777807 ) ) ( not ( = ?auto_777806 ?auto_777808 ) ) ( not ( = ?auto_777806 ?auto_777809 ) ) ( not ( = ?auto_777806 ?auto_777810 ) ) ( not ( = ?auto_777806 ?auto_777811 ) ) ( not ( = ?auto_777806 ?auto_777812 ) ) ( not ( = ?auto_777807 ?auto_777808 ) ) ( not ( = ?auto_777807 ?auto_777809 ) ) ( not ( = ?auto_777807 ?auto_777810 ) ) ( not ( = ?auto_777807 ?auto_777811 ) ) ( not ( = ?auto_777807 ?auto_777812 ) ) ( not ( = ?auto_777808 ?auto_777809 ) ) ( not ( = ?auto_777808 ?auto_777810 ) ) ( not ( = ?auto_777808 ?auto_777811 ) ) ( not ( = ?auto_777808 ?auto_777812 ) ) ( not ( = ?auto_777809 ?auto_777810 ) ) ( not ( = ?auto_777809 ?auto_777811 ) ) ( not ( = ?auto_777809 ?auto_777812 ) ) ( not ( = ?auto_777810 ?auto_777811 ) ) ( not ( = ?auto_777810 ?auto_777812 ) ) ( not ( = ?auto_777811 ?auto_777812 ) ) ( ON ?auto_777810 ?auto_777811 ) ( ON ?auto_777809 ?auto_777810 ) ( CLEAR ?auto_777807 ) ( ON ?auto_777808 ?auto_777809 ) ( CLEAR ?auto_777808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_777799 ?auto_777800 ?auto_777801 ?auto_777802 ?auto_777803 ?auto_777804 ?auto_777805 ?auto_777806 ?auto_777807 ?auto_777808 )
      ( MAKE-13PILE ?auto_777799 ?auto_777800 ?auto_777801 ?auto_777802 ?auto_777803 ?auto_777804 ?auto_777805 ?auto_777806 ?auto_777807 ?auto_777808 ?auto_777809 ?auto_777810 ?auto_777811 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_777853 - BLOCK
      ?auto_777854 - BLOCK
      ?auto_777855 - BLOCK
      ?auto_777856 - BLOCK
      ?auto_777857 - BLOCK
      ?auto_777858 - BLOCK
      ?auto_777859 - BLOCK
      ?auto_777860 - BLOCK
      ?auto_777861 - BLOCK
      ?auto_777862 - BLOCK
      ?auto_777863 - BLOCK
      ?auto_777864 - BLOCK
      ?auto_777865 - BLOCK
    )
    :vars
    (
      ?auto_777866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_777865 ?auto_777866 ) ( ON-TABLE ?auto_777853 ) ( ON ?auto_777854 ?auto_777853 ) ( ON ?auto_777855 ?auto_777854 ) ( ON ?auto_777856 ?auto_777855 ) ( ON ?auto_777857 ?auto_777856 ) ( ON ?auto_777858 ?auto_777857 ) ( ON ?auto_777859 ?auto_777858 ) ( ON ?auto_777860 ?auto_777859 ) ( not ( = ?auto_777853 ?auto_777854 ) ) ( not ( = ?auto_777853 ?auto_777855 ) ) ( not ( = ?auto_777853 ?auto_777856 ) ) ( not ( = ?auto_777853 ?auto_777857 ) ) ( not ( = ?auto_777853 ?auto_777858 ) ) ( not ( = ?auto_777853 ?auto_777859 ) ) ( not ( = ?auto_777853 ?auto_777860 ) ) ( not ( = ?auto_777853 ?auto_777861 ) ) ( not ( = ?auto_777853 ?auto_777862 ) ) ( not ( = ?auto_777853 ?auto_777863 ) ) ( not ( = ?auto_777853 ?auto_777864 ) ) ( not ( = ?auto_777853 ?auto_777865 ) ) ( not ( = ?auto_777853 ?auto_777866 ) ) ( not ( = ?auto_777854 ?auto_777855 ) ) ( not ( = ?auto_777854 ?auto_777856 ) ) ( not ( = ?auto_777854 ?auto_777857 ) ) ( not ( = ?auto_777854 ?auto_777858 ) ) ( not ( = ?auto_777854 ?auto_777859 ) ) ( not ( = ?auto_777854 ?auto_777860 ) ) ( not ( = ?auto_777854 ?auto_777861 ) ) ( not ( = ?auto_777854 ?auto_777862 ) ) ( not ( = ?auto_777854 ?auto_777863 ) ) ( not ( = ?auto_777854 ?auto_777864 ) ) ( not ( = ?auto_777854 ?auto_777865 ) ) ( not ( = ?auto_777854 ?auto_777866 ) ) ( not ( = ?auto_777855 ?auto_777856 ) ) ( not ( = ?auto_777855 ?auto_777857 ) ) ( not ( = ?auto_777855 ?auto_777858 ) ) ( not ( = ?auto_777855 ?auto_777859 ) ) ( not ( = ?auto_777855 ?auto_777860 ) ) ( not ( = ?auto_777855 ?auto_777861 ) ) ( not ( = ?auto_777855 ?auto_777862 ) ) ( not ( = ?auto_777855 ?auto_777863 ) ) ( not ( = ?auto_777855 ?auto_777864 ) ) ( not ( = ?auto_777855 ?auto_777865 ) ) ( not ( = ?auto_777855 ?auto_777866 ) ) ( not ( = ?auto_777856 ?auto_777857 ) ) ( not ( = ?auto_777856 ?auto_777858 ) ) ( not ( = ?auto_777856 ?auto_777859 ) ) ( not ( = ?auto_777856 ?auto_777860 ) ) ( not ( = ?auto_777856 ?auto_777861 ) ) ( not ( = ?auto_777856 ?auto_777862 ) ) ( not ( = ?auto_777856 ?auto_777863 ) ) ( not ( = ?auto_777856 ?auto_777864 ) ) ( not ( = ?auto_777856 ?auto_777865 ) ) ( not ( = ?auto_777856 ?auto_777866 ) ) ( not ( = ?auto_777857 ?auto_777858 ) ) ( not ( = ?auto_777857 ?auto_777859 ) ) ( not ( = ?auto_777857 ?auto_777860 ) ) ( not ( = ?auto_777857 ?auto_777861 ) ) ( not ( = ?auto_777857 ?auto_777862 ) ) ( not ( = ?auto_777857 ?auto_777863 ) ) ( not ( = ?auto_777857 ?auto_777864 ) ) ( not ( = ?auto_777857 ?auto_777865 ) ) ( not ( = ?auto_777857 ?auto_777866 ) ) ( not ( = ?auto_777858 ?auto_777859 ) ) ( not ( = ?auto_777858 ?auto_777860 ) ) ( not ( = ?auto_777858 ?auto_777861 ) ) ( not ( = ?auto_777858 ?auto_777862 ) ) ( not ( = ?auto_777858 ?auto_777863 ) ) ( not ( = ?auto_777858 ?auto_777864 ) ) ( not ( = ?auto_777858 ?auto_777865 ) ) ( not ( = ?auto_777858 ?auto_777866 ) ) ( not ( = ?auto_777859 ?auto_777860 ) ) ( not ( = ?auto_777859 ?auto_777861 ) ) ( not ( = ?auto_777859 ?auto_777862 ) ) ( not ( = ?auto_777859 ?auto_777863 ) ) ( not ( = ?auto_777859 ?auto_777864 ) ) ( not ( = ?auto_777859 ?auto_777865 ) ) ( not ( = ?auto_777859 ?auto_777866 ) ) ( not ( = ?auto_777860 ?auto_777861 ) ) ( not ( = ?auto_777860 ?auto_777862 ) ) ( not ( = ?auto_777860 ?auto_777863 ) ) ( not ( = ?auto_777860 ?auto_777864 ) ) ( not ( = ?auto_777860 ?auto_777865 ) ) ( not ( = ?auto_777860 ?auto_777866 ) ) ( not ( = ?auto_777861 ?auto_777862 ) ) ( not ( = ?auto_777861 ?auto_777863 ) ) ( not ( = ?auto_777861 ?auto_777864 ) ) ( not ( = ?auto_777861 ?auto_777865 ) ) ( not ( = ?auto_777861 ?auto_777866 ) ) ( not ( = ?auto_777862 ?auto_777863 ) ) ( not ( = ?auto_777862 ?auto_777864 ) ) ( not ( = ?auto_777862 ?auto_777865 ) ) ( not ( = ?auto_777862 ?auto_777866 ) ) ( not ( = ?auto_777863 ?auto_777864 ) ) ( not ( = ?auto_777863 ?auto_777865 ) ) ( not ( = ?auto_777863 ?auto_777866 ) ) ( not ( = ?auto_777864 ?auto_777865 ) ) ( not ( = ?auto_777864 ?auto_777866 ) ) ( not ( = ?auto_777865 ?auto_777866 ) ) ( ON ?auto_777864 ?auto_777865 ) ( ON ?auto_777863 ?auto_777864 ) ( ON ?auto_777862 ?auto_777863 ) ( CLEAR ?auto_777860 ) ( ON ?auto_777861 ?auto_777862 ) ( CLEAR ?auto_777861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_777853 ?auto_777854 ?auto_777855 ?auto_777856 ?auto_777857 ?auto_777858 ?auto_777859 ?auto_777860 ?auto_777861 )
      ( MAKE-13PILE ?auto_777853 ?auto_777854 ?auto_777855 ?auto_777856 ?auto_777857 ?auto_777858 ?auto_777859 ?auto_777860 ?auto_777861 ?auto_777862 ?auto_777863 ?auto_777864 ?auto_777865 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_777907 - BLOCK
      ?auto_777908 - BLOCK
      ?auto_777909 - BLOCK
      ?auto_777910 - BLOCK
      ?auto_777911 - BLOCK
      ?auto_777912 - BLOCK
      ?auto_777913 - BLOCK
      ?auto_777914 - BLOCK
      ?auto_777915 - BLOCK
      ?auto_777916 - BLOCK
      ?auto_777917 - BLOCK
      ?auto_777918 - BLOCK
      ?auto_777919 - BLOCK
    )
    :vars
    (
      ?auto_777920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_777919 ?auto_777920 ) ( ON-TABLE ?auto_777907 ) ( ON ?auto_777908 ?auto_777907 ) ( ON ?auto_777909 ?auto_777908 ) ( ON ?auto_777910 ?auto_777909 ) ( ON ?auto_777911 ?auto_777910 ) ( ON ?auto_777912 ?auto_777911 ) ( ON ?auto_777913 ?auto_777912 ) ( not ( = ?auto_777907 ?auto_777908 ) ) ( not ( = ?auto_777907 ?auto_777909 ) ) ( not ( = ?auto_777907 ?auto_777910 ) ) ( not ( = ?auto_777907 ?auto_777911 ) ) ( not ( = ?auto_777907 ?auto_777912 ) ) ( not ( = ?auto_777907 ?auto_777913 ) ) ( not ( = ?auto_777907 ?auto_777914 ) ) ( not ( = ?auto_777907 ?auto_777915 ) ) ( not ( = ?auto_777907 ?auto_777916 ) ) ( not ( = ?auto_777907 ?auto_777917 ) ) ( not ( = ?auto_777907 ?auto_777918 ) ) ( not ( = ?auto_777907 ?auto_777919 ) ) ( not ( = ?auto_777907 ?auto_777920 ) ) ( not ( = ?auto_777908 ?auto_777909 ) ) ( not ( = ?auto_777908 ?auto_777910 ) ) ( not ( = ?auto_777908 ?auto_777911 ) ) ( not ( = ?auto_777908 ?auto_777912 ) ) ( not ( = ?auto_777908 ?auto_777913 ) ) ( not ( = ?auto_777908 ?auto_777914 ) ) ( not ( = ?auto_777908 ?auto_777915 ) ) ( not ( = ?auto_777908 ?auto_777916 ) ) ( not ( = ?auto_777908 ?auto_777917 ) ) ( not ( = ?auto_777908 ?auto_777918 ) ) ( not ( = ?auto_777908 ?auto_777919 ) ) ( not ( = ?auto_777908 ?auto_777920 ) ) ( not ( = ?auto_777909 ?auto_777910 ) ) ( not ( = ?auto_777909 ?auto_777911 ) ) ( not ( = ?auto_777909 ?auto_777912 ) ) ( not ( = ?auto_777909 ?auto_777913 ) ) ( not ( = ?auto_777909 ?auto_777914 ) ) ( not ( = ?auto_777909 ?auto_777915 ) ) ( not ( = ?auto_777909 ?auto_777916 ) ) ( not ( = ?auto_777909 ?auto_777917 ) ) ( not ( = ?auto_777909 ?auto_777918 ) ) ( not ( = ?auto_777909 ?auto_777919 ) ) ( not ( = ?auto_777909 ?auto_777920 ) ) ( not ( = ?auto_777910 ?auto_777911 ) ) ( not ( = ?auto_777910 ?auto_777912 ) ) ( not ( = ?auto_777910 ?auto_777913 ) ) ( not ( = ?auto_777910 ?auto_777914 ) ) ( not ( = ?auto_777910 ?auto_777915 ) ) ( not ( = ?auto_777910 ?auto_777916 ) ) ( not ( = ?auto_777910 ?auto_777917 ) ) ( not ( = ?auto_777910 ?auto_777918 ) ) ( not ( = ?auto_777910 ?auto_777919 ) ) ( not ( = ?auto_777910 ?auto_777920 ) ) ( not ( = ?auto_777911 ?auto_777912 ) ) ( not ( = ?auto_777911 ?auto_777913 ) ) ( not ( = ?auto_777911 ?auto_777914 ) ) ( not ( = ?auto_777911 ?auto_777915 ) ) ( not ( = ?auto_777911 ?auto_777916 ) ) ( not ( = ?auto_777911 ?auto_777917 ) ) ( not ( = ?auto_777911 ?auto_777918 ) ) ( not ( = ?auto_777911 ?auto_777919 ) ) ( not ( = ?auto_777911 ?auto_777920 ) ) ( not ( = ?auto_777912 ?auto_777913 ) ) ( not ( = ?auto_777912 ?auto_777914 ) ) ( not ( = ?auto_777912 ?auto_777915 ) ) ( not ( = ?auto_777912 ?auto_777916 ) ) ( not ( = ?auto_777912 ?auto_777917 ) ) ( not ( = ?auto_777912 ?auto_777918 ) ) ( not ( = ?auto_777912 ?auto_777919 ) ) ( not ( = ?auto_777912 ?auto_777920 ) ) ( not ( = ?auto_777913 ?auto_777914 ) ) ( not ( = ?auto_777913 ?auto_777915 ) ) ( not ( = ?auto_777913 ?auto_777916 ) ) ( not ( = ?auto_777913 ?auto_777917 ) ) ( not ( = ?auto_777913 ?auto_777918 ) ) ( not ( = ?auto_777913 ?auto_777919 ) ) ( not ( = ?auto_777913 ?auto_777920 ) ) ( not ( = ?auto_777914 ?auto_777915 ) ) ( not ( = ?auto_777914 ?auto_777916 ) ) ( not ( = ?auto_777914 ?auto_777917 ) ) ( not ( = ?auto_777914 ?auto_777918 ) ) ( not ( = ?auto_777914 ?auto_777919 ) ) ( not ( = ?auto_777914 ?auto_777920 ) ) ( not ( = ?auto_777915 ?auto_777916 ) ) ( not ( = ?auto_777915 ?auto_777917 ) ) ( not ( = ?auto_777915 ?auto_777918 ) ) ( not ( = ?auto_777915 ?auto_777919 ) ) ( not ( = ?auto_777915 ?auto_777920 ) ) ( not ( = ?auto_777916 ?auto_777917 ) ) ( not ( = ?auto_777916 ?auto_777918 ) ) ( not ( = ?auto_777916 ?auto_777919 ) ) ( not ( = ?auto_777916 ?auto_777920 ) ) ( not ( = ?auto_777917 ?auto_777918 ) ) ( not ( = ?auto_777917 ?auto_777919 ) ) ( not ( = ?auto_777917 ?auto_777920 ) ) ( not ( = ?auto_777918 ?auto_777919 ) ) ( not ( = ?auto_777918 ?auto_777920 ) ) ( not ( = ?auto_777919 ?auto_777920 ) ) ( ON ?auto_777918 ?auto_777919 ) ( ON ?auto_777917 ?auto_777918 ) ( ON ?auto_777916 ?auto_777917 ) ( ON ?auto_777915 ?auto_777916 ) ( CLEAR ?auto_777913 ) ( ON ?auto_777914 ?auto_777915 ) ( CLEAR ?auto_777914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_777907 ?auto_777908 ?auto_777909 ?auto_777910 ?auto_777911 ?auto_777912 ?auto_777913 ?auto_777914 )
      ( MAKE-13PILE ?auto_777907 ?auto_777908 ?auto_777909 ?auto_777910 ?auto_777911 ?auto_777912 ?auto_777913 ?auto_777914 ?auto_777915 ?auto_777916 ?auto_777917 ?auto_777918 ?auto_777919 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_777961 - BLOCK
      ?auto_777962 - BLOCK
      ?auto_777963 - BLOCK
      ?auto_777964 - BLOCK
      ?auto_777965 - BLOCK
      ?auto_777966 - BLOCK
      ?auto_777967 - BLOCK
      ?auto_777968 - BLOCK
      ?auto_777969 - BLOCK
      ?auto_777970 - BLOCK
      ?auto_777971 - BLOCK
      ?auto_777972 - BLOCK
      ?auto_777973 - BLOCK
    )
    :vars
    (
      ?auto_777974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_777973 ?auto_777974 ) ( ON-TABLE ?auto_777961 ) ( ON ?auto_777962 ?auto_777961 ) ( ON ?auto_777963 ?auto_777962 ) ( ON ?auto_777964 ?auto_777963 ) ( ON ?auto_777965 ?auto_777964 ) ( ON ?auto_777966 ?auto_777965 ) ( not ( = ?auto_777961 ?auto_777962 ) ) ( not ( = ?auto_777961 ?auto_777963 ) ) ( not ( = ?auto_777961 ?auto_777964 ) ) ( not ( = ?auto_777961 ?auto_777965 ) ) ( not ( = ?auto_777961 ?auto_777966 ) ) ( not ( = ?auto_777961 ?auto_777967 ) ) ( not ( = ?auto_777961 ?auto_777968 ) ) ( not ( = ?auto_777961 ?auto_777969 ) ) ( not ( = ?auto_777961 ?auto_777970 ) ) ( not ( = ?auto_777961 ?auto_777971 ) ) ( not ( = ?auto_777961 ?auto_777972 ) ) ( not ( = ?auto_777961 ?auto_777973 ) ) ( not ( = ?auto_777961 ?auto_777974 ) ) ( not ( = ?auto_777962 ?auto_777963 ) ) ( not ( = ?auto_777962 ?auto_777964 ) ) ( not ( = ?auto_777962 ?auto_777965 ) ) ( not ( = ?auto_777962 ?auto_777966 ) ) ( not ( = ?auto_777962 ?auto_777967 ) ) ( not ( = ?auto_777962 ?auto_777968 ) ) ( not ( = ?auto_777962 ?auto_777969 ) ) ( not ( = ?auto_777962 ?auto_777970 ) ) ( not ( = ?auto_777962 ?auto_777971 ) ) ( not ( = ?auto_777962 ?auto_777972 ) ) ( not ( = ?auto_777962 ?auto_777973 ) ) ( not ( = ?auto_777962 ?auto_777974 ) ) ( not ( = ?auto_777963 ?auto_777964 ) ) ( not ( = ?auto_777963 ?auto_777965 ) ) ( not ( = ?auto_777963 ?auto_777966 ) ) ( not ( = ?auto_777963 ?auto_777967 ) ) ( not ( = ?auto_777963 ?auto_777968 ) ) ( not ( = ?auto_777963 ?auto_777969 ) ) ( not ( = ?auto_777963 ?auto_777970 ) ) ( not ( = ?auto_777963 ?auto_777971 ) ) ( not ( = ?auto_777963 ?auto_777972 ) ) ( not ( = ?auto_777963 ?auto_777973 ) ) ( not ( = ?auto_777963 ?auto_777974 ) ) ( not ( = ?auto_777964 ?auto_777965 ) ) ( not ( = ?auto_777964 ?auto_777966 ) ) ( not ( = ?auto_777964 ?auto_777967 ) ) ( not ( = ?auto_777964 ?auto_777968 ) ) ( not ( = ?auto_777964 ?auto_777969 ) ) ( not ( = ?auto_777964 ?auto_777970 ) ) ( not ( = ?auto_777964 ?auto_777971 ) ) ( not ( = ?auto_777964 ?auto_777972 ) ) ( not ( = ?auto_777964 ?auto_777973 ) ) ( not ( = ?auto_777964 ?auto_777974 ) ) ( not ( = ?auto_777965 ?auto_777966 ) ) ( not ( = ?auto_777965 ?auto_777967 ) ) ( not ( = ?auto_777965 ?auto_777968 ) ) ( not ( = ?auto_777965 ?auto_777969 ) ) ( not ( = ?auto_777965 ?auto_777970 ) ) ( not ( = ?auto_777965 ?auto_777971 ) ) ( not ( = ?auto_777965 ?auto_777972 ) ) ( not ( = ?auto_777965 ?auto_777973 ) ) ( not ( = ?auto_777965 ?auto_777974 ) ) ( not ( = ?auto_777966 ?auto_777967 ) ) ( not ( = ?auto_777966 ?auto_777968 ) ) ( not ( = ?auto_777966 ?auto_777969 ) ) ( not ( = ?auto_777966 ?auto_777970 ) ) ( not ( = ?auto_777966 ?auto_777971 ) ) ( not ( = ?auto_777966 ?auto_777972 ) ) ( not ( = ?auto_777966 ?auto_777973 ) ) ( not ( = ?auto_777966 ?auto_777974 ) ) ( not ( = ?auto_777967 ?auto_777968 ) ) ( not ( = ?auto_777967 ?auto_777969 ) ) ( not ( = ?auto_777967 ?auto_777970 ) ) ( not ( = ?auto_777967 ?auto_777971 ) ) ( not ( = ?auto_777967 ?auto_777972 ) ) ( not ( = ?auto_777967 ?auto_777973 ) ) ( not ( = ?auto_777967 ?auto_777974 ) ) ( not ( = ?auto_777968 ?auto_777969 ) ) ( not ( = ?auto_777968 ?auto_777970 ) ) ( not ( = ?auto_777968 ?auto_777971 ) ) ( not ( = ?auto_777968 ?auto_777972 ) ) ( not ( = ?auto_777968 ?auto_777973 ) ) ( not ( = ?auto_777968 ?auto_777974 ) ) ( not ( = ?auto_777969 ?auto_777970 ) ) ( not ( = ?auto_777969 ?auto_777971 ) ) ( not ( = ?auto_777969 ?auto_777972 ) ) ( not ( = ?auto_777969 ?auto_777973 ) ) ( not ( = ?auto_777969 ?auto_777974 ) ) ( not ( = ?auto_777970 ?auto_777971 ) ) ( not ( = ?auto_777970 ?auto_777972 ) ) ( not ( = ?auto_777970 ?auto_777973 ) ) ( not ( = ?auto_777970 ?auto_777974 ) ) ( not ( = ?auto_777971 ?auto_777972 ) ) ( not ( = ?auto_777971 ?auto_777973 ) ) ( not ( = ?auto_777971 ?auto_777974 ) ) ( not ( = ?auto_777972 ?auto_777973 ) ) ( not ( = ?auto_777972 ?auto_777974 ) ) ( not ( = ?auto_777973 ?auto_777974 ) ) ( ON ?auto_777972 ?auto_777973 ) ( ON ?auto_777971 ?auto_777972 ) ( ON ?auto_777970 ?auto_777971 ) ( ON ?auto_777969 ?auto_777970 ) ( ON ?auto_777968 ?auto_777969 ) ( CLEAR ?auto_777966 ) ( ON ?auto_777967 ?auto_777968 ) ( CLEAR ?auto_777967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_777961 ?auto_777962 ?auto_777963 ?auto_777964 ?auto_777965 ?auto_777966 ?auto_777967 )
      ( MAKE-13PILE ?auto_777961 ?auto_777962 ?auto_777963 ?auto_777964 ?auto_777965 ?auto_777966 ?auto_777967 ?auto_777968 ?auto_777969 ?auto_777970 ?auto_777971 ?auto_777972 ?auto_777973 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_778015 - BLOCK
      ?auto_778016 - BLOCK
      ?auto_778017 - BLOCK
      ?auto_778018 - BLOCK
      ?auto_778019 - BLOCK
      ?auto_778020 - BLOCK
      ?auto_778021 - BLOCK
      ?auto_778022 - BLOCK
      ?auto_778023 - BLOCK
      ?auto_778024 - BLOCK
      ?auto_778025 - BLOCK
      ?auto_778026 - BLOCK
      ?auto_778027 - BLOCK
    )
    :vars
    (
      ?auto_778028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_778027 ?auto_778028 ) ( ON-TABLE ?auto_778015 ) ( ON ?auto_778016 ?auto_778015 ) ( ON ?auto_778017 ?auto_778016 ) ( ON ?auto_778018 ?auto_778017 ) ( ON ?auto_778019 ?auto_778018 ) ( not ( = ?auto_778015 ?auto_778016 ) ) ( not ( = ?auto_778015 ?auto_778017 ) ) ( not ( = ?auto_778015 ?auto_778018 ) ) ( not ( = ?auto_778015 ?auto_778019 ) ) ( not ( = ?auto_778015 ?auto_778020 ) ) ( not ( = ?auto_778015 ?auto_778021 ) ) ( not ( = ?auto_778015 ?auto_778022 ) ) ( not ( = ?auto_778015 ?auto_778023 ) ) ( not ( = ?auto_778015 ?auto_778024 ) ) ( not ( = ?auto_778015 ?auto_778025 ) ) ( not ( = ?auto_778015 ?auto_778026 ) ) ( not ( = ?auto_778015 ?auto_778027 ) ) ( not ( = ?auto_778015 ?auto_778028 ) ) ( not ( = ?auto_778016 ?auto_778017 ) ) ( not ( = ?auto_778016 ?auto_778018 ) ) ( not ( = ?auto_778016 ?auto_778019 ) ) ( not ( = ?auto_778016 ?auto_778020 ) ) ( not ( = ?auto_778016 ?auto_778021 ) ) ( not ( = ?auto_778016 ?auto_778022 ) ) ( not ( = ?auto_778016 ?auto_778023 ) ) ( not ( = ?auto_778016 ?auto_778024 ) ) ( not ( = ?auto_778016 ?auto_778025 ) ) ( not ( = ?auto_778016 ?auto_778026 ) ) ( not ( = ?auto_778016 ?auto_778027 ) ) ( not ( = ?auto_778016 ?auto_778028 ) ) ( not ( = ?auto_778017 ?auto_778018 ) ) ( not ( = ?auto_778017 ?auto_778019 ) ) ( not ( = ?auto_778017 ?auto_778020 ) ) ( not ( = ?auto_778017 ?auto_778021 ) ) ( not ( = ?auto_778017 ?auto_778022 ) ) ( not ( = ?auto_778017 ?auto_778023 ) ) ( not ( = ?auto_778017 ?auto_778024 ) ) ( not ( = ?auto_778017 ?auto_778025 ) ) ( not ( = ?auto_778017 ?auto_778026 ) ) ( not ( = ?auto_778017 ?auto_778027 ) ) ( not ( = ?auto_778017 ?auto_778028 ) ) ( not ( = ?auto_778018 ?auto_778019 ) ) ( not ( = ?auto_778018 ?auto_778020 ) ) ( not ( = ?auto_778018 ?auto_778021 ) ) ( not ( = ?auto_778018 ?auto_778022 ) ) ( not ( = ?auto_778018 ?auto_778023 ) ) ( not ( = ?auto_778018 ?auto_778024 ) ) ( not ( = ?auto_778018 ?auto_778025 ) ) ( not ( = ?auto_778018 ?auto_778026 ) ) ( not ( = ?auto_778018 ?auto_778027 ) ) ( not ( = ?auto_778018 ?auto_778028 ) ) ( not ( = ?auto_778019 ?auto_778020 ) ) ( not ( = ?auto_778019 ?auto_778021 ) ) ( not ( = ?auto_778019 ?auto_778022 ) ) ( not ( = ?auto_778019 ?auto_778023 ) ) ( not ( = ?auto_778019 ?auto_778024 ) ) ( not ( = ?auto_778019 ?auto_778025 ) ) ( not ( = ?auto_778019 ?auto_778026 ) ) ( not ( = ?auto_778019 ?auto_778027 ) ) ( not ( = ?auto_778019 ?auto_778028 ) ) ( not ( = ?auto_778020 ?auto_778021 ) ) ( not ( = ?auto_778020 ?auto_778022 ) ) ( not ( = ?auto_778020 ?auto_778023 ) ) ( not ( = ?auto_778020 ?auto_778024 ) ) ( not ( = ?auto_778020 ?auto_778025 ) ) ( not ( = ?auto_778020 ?auto_778026 ) ) ( not ( = ?auto_778020 ?auto_778027 ) ) ( not ( = ?auto_778020 ?auto_778028 ) ) ( not ( = ?auto_778021 ?auto_778022 ) ) ( not ( = ?auto_778021 ?auto_778023 ) ) ( not ( = ?auto_778021 ?auto_778024 ) ) ( not ( = ?auto_778021 ?auto_778025 ) ) ( not ( = ?auto_778021 ?auto_778026 ) ) ( not ( = ?auto_778021 ?auto_778027 ) ) ( not ( = ?auto_778021 ?auto_778028 ) ) ( not ( = ?auto_778022 ?auto_778023 ) ) ( not ( = ?auto_778022 ?auto_778024 ) ) ( not ( = ?auto_778022 ?auto_778025 ) ) ( not ( = ?auto_778022 ?auto_778026 ) ) ( not ( = ?auto_778022 ?auto_778027 ) ) ( not ( = ?auto_778022 ?auto_778028 ) ) ( not ( = ?auto_778023 ?auto_778024 ) ) ( not ( = ?auto_778023 ?auto_778025 ) ) ( not ( = ?auto_778023 ?auto_778026 ) ) ( not ( = ?auto_778023 ?auto_778027 ) ) ( not ( = ?auto_778023 ?auto_778028 ) ) ( not ( = ?auto_778024 ?auto_778025 ) ) ( not ( = ?auto_778024 ?auto_778026 ) ) ( not ( = ?auto_778024 ?auto_778027 ) ) ( not ( = ?auto_778024 ?auto_778028 ) ) ( not ( = ?auto_778025 ?auto_778026 ) ) ( not ( = ?auto_778025 ?auto_778027 ) ) ( not ( = ?auto_778025 ?auto_778028 ) ) ( not ( = ?auto_778026 ?auto_778027 ) ) ( not ( = ?auto_778026 ?auto_778028 ) ) ( not ( = ?auto_778027 ?auto_778028 ) ) ( ON ?auto_778026 ?auto_778027 ) ( ON ?auto_778025 ?auto_778026 ) ( ON ?auto_778024 ?auto_778025 ) ( ON ?auto_778023 ?auto_778024 ) ( ON ?auto_778022 ?auto_778023 ) ( ON ?auto_778021 ?auto_778022 ) ( CLEAR ?auto_778019 ) ( ON ?auto_778020 ?auto_778021 ) ( CLEAR ?auto_778020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_778015 ?auto_778016 ?auto_778017 ?auto_778018 ?auto_778019 ?auto_778020 )
      ( MAKE-13PILE ?auto_778015 ?auto_778016 ?auto_778017 ?auto_778018 ?auto_778019 ?auto_778020 ?auto_778021 ?auto_778022 ?auto_778023 ?auto_778024 ?auto_778025 ?auto_778026 ?auto_778027 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_778069 - BLOCK
      ?auto_778070 - BLOCK
      ?auto_778071 - BLOCK
      ?auto_778072 - BLOCK
      ?auto_778073 - BLOCK
      ?auto_778074 - BLOCK
      ?auto_778075 - BLOCK
      ?auto_778076 - BLOCK
      ?auto_778077 - BLOCK
      ?auto_778078 - BLOCK
      ?auto_778079 - BLOCK
      ?auto_778080 - BLOCK
      ?auto_778081 - BLOCK
    )
    :vars
    (
      ?auto_778082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_778081 ?auto_778082 ) ( ON-TABLE ?auto_778069 ) ( ON ?auto_778070 ?auto_778069 ) ( ON ?auto_778071 ?auto_778070 ) ( ON ?auto_778072 ?auto_778071 ) ( not ( = ?auto_778069 ?auto_778070 ) ) ( not ( = ?auto_778069 ?auto_778071 ) ) ( not ( = ?auto_778069 ?auto_778072 ) ) ( not ( = ?auto_778069 ?auto_778073 ) ) ( not ( = ?auto_778069 ?auto_778074 ) ) ( not ( = ?auto_778069 ?auto_778075 ) ) ( not ( = ?auto_778069 ?auto_778076 ) ) ( not ( = ?auto_778069 ?auto_778077 ) ) ( not ( = ?auto_778069 ?auto_778078 ) ) ( not ( = ?auto_778069 ?auto_778079 ) ) ( not ( = ?auto_778069 ?auto_778080 ) ) ( not ( = ?auto_778069 ?auto_778081 ) ) ( not ( = ?auto_778069 ?auto_778082 ) ) ( not ( = ?auto_778070 ?auto_778071 ) ) ( not ( = ?auto_778070 ?auto_778072 ) ) ( not ( = ?auto_778070 ?auto_778073 ) ) ( not ( = ?auto_778070 ?auto_778074 ) ) ( not ( = ?auto_778070 ?auto_778075 ) ) ( not ( = ?auto_778070 ?auto_778076 ) ) ( not ( = ?auto_778070 ?auto_778077 ) ) ( not ( = ?auto_778070 ?auto_778078 ) ) ( not ( = ?auto_778070 ?auto_778079 ) ) ( not ( = ?auto_778070 ?auto_778080 ) ) ( not ( = ?auto_778070 ?auto_778081 ) ) ( not ( = ?auto_778070 ?auto_778082 ) ) ( not ( = ?auto_778071 ?auto_778072 ) ) ( not ( = ?auto_778071 ?auto_778073 ) ) ( not ( = ?auto_778071 ?auto_778074 ) ) ( not ( = ?auto_778071 ?auto_778075 ) ) ( not ( = ?auto_778071 ?auto_778076 ) ) ( not ( = ?auto_778071 ?auto_778077 ) ) ( not ( = ?auto_778071 ?auto_778078 ) ) ( not ( = ?auto_778071 ?auto_778079 ) ) ( not ( = ?auto_778071 ?auto_778080 ) ) ( not ( = ?auto_778071 ?auto_778081 ) ) ( not ( = ?auto_778071 ?auto_778082 ) ) ( not ( = ?auto_778072 ?auto_778073 ) ) ( not ( = ?auto_778072 ?auto_778074 ) ) ( not ( = ?auto_778072 ?auto_778075 ) ) ( not ( = ?auto_778072 ?auto_778076 ) ) ( not ( = ?auto_778072 ?auto_778077 ) ) ( not ( = ?auto_778072 ?auto_778078 ) ) ( not ( = ?auto_778072 ?auto_778079 ) ) ( not ( = ?auto_778072 ?auto_778080 ) ) ( not ( = ?auto_778072 ?auto_778081 ) ) ( not ( = ?auto_778072 ?auto_778082 ) ) ( not ( = ?auto_778073 ?auto_778074 ) ) ( not ( = ?auto_778073 ?auto_778075 ) ) ( not ( = ?auto_778073 ?auto_778076 ) ) ( not ( = ?auto_778073 ?auto_778077 ) ) ( not ( = ?auto_778073 ?auto_778078 ) ) ( not ( = ?auto_778073 ?auto_778079 ) ) ( not ( = ?auto_778073 ?auto_778080 ) ) ( not ( = ?auto_778073 ?auto_778081 ) ) ( not ( = ?auto_778073 ?auto_778082 ) ) ( not ( = ?auto_778074 ?auto_778075 ) ) ( not ( = ?auto_778074 ?auto_778076 ) ) ( not ( = ?auto_778074 ?auto_778077 ) ) ( not ( = ?auto_778074 ?auto_778078 ) ) ( not ( = ?auto_778074 ?auto_778079 ) ) ( not ( = ?auto_778074 ?auto_778080 ) ) ( not ( = ?auto_778074 ?auto_778081 ) ) ( not ( = ?auto_778074 ?auto_778082 ) ) ( not ( = ?auto_778075 ?auto_778076 ) ) ( not ( = ?auto_778075 ?auto_778077 ) ) ( not ( = ?auto_778075 ?auto_778078 ) ) ( not ( = ?auto_778075 ?auto_778079 ) ) ( not ( = ?auto_778075 ?auto_778080 ) ) ( not ( = ?auto_778075 ?auto_778081 ) ) ( not ( = ?auto_778075 ?auto_778082 ) ) ( not ( = ?auto_778076 ?auto_778077 ) ) ( not ( = ?auto_778076 ?auto_778078 ) ) ( not ( = ?auto_778076 ?auto_778079 ) ) ( not ( = ?auto_778076 ?auto_778080 ) ) ( not ( = ?auto_778076 ?auto_778081 ) ) ( not ( = ?auto_778076 ?auto_778082 ) ) ( not ( = ?auto_778077 ?auto_778078 ) ) ( not ( = ?auto_778077 ?auto_778079 ) ) ( not ( = ?auto_778077 ?auto_778080 ) ) ( not ( = ?auto_778077 ?auto_778081 ) ) ( not ( = ?auto_778077 ?auto_778082 ) ) ( not ( = ?auto_778078 ?auto_778079 ) ) ( not ( = ?auto_778078 ?auto_778080 ) ) ( not ( = ?auto_778078 ?auto_778081 ) ) ( not ( = ?auto_778078 ?auto_778082 ) ) ( not ( = ?auto_778079 ?auto_778080 ) ) ( not ( = ?auto_778079 ?auto_778081 ) ) ( not ( = ?auto_778079 ?auto_778082 ) ) ( not ( = ?auto_778080 ?auto_778081 ) ) ( not ( = ?auto_778080 ?auto_778082 ) ) ( not ( = ?auto_778081 ?auto_778082 ) ) ( ON ?auto_778080 ?auto_778081 ) ( ON ?auto_778079 ?auto_778080 ) ( ON ?auto_778078 ?auto_778079 ) ( ON ?auto_778077 ?auto_778078 ) ( ON ?auto_778076 ?auto_778077 ) ( ON ?auto_778075 ?auto_778076 ) ( ON ?auto_778074 ?auto_778075 ) ( CLEAR ?auto_778072 ) ( ON ?auto_778073 ?auto_778074 ) ( CLEAR ?auto_778073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_778069 ?auto_778070 ?auto_778071 ?auto_778072 ?auto_778073 )
      ( MAKE-13PILE ?auto_778069 ?auto_778070 ?auto_778071 ?auto_778072 ?auto_778073 ?auto_778074 ?auto_778075 ?auto_778076 ?auto_778077 ?auto_778078 ?auto_778079 ?auto_778080 ?auto_778081 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_778123 - BLOCK
      ?auto_778124 - BLOCK
      ?auto_778125 - BLOCK
      ?auto_778126 - BLOCK
      ?auto_778127 - BLOCK
      ?auto_778128 - BLOCK
      ?auto_778129 - BLOCK
      ?auto_778130 - BLOCK
      ?auto_778131 - BLOCK
      ?auto_778132 - BLOCK
      ?auto_778133 - BLOCK
      ?auto_778134 - BLOCK
      ?auto_778135 - BLOCK
    )
    :vars
    (
      ?auto_778136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_778135 ?auto_778136 ) ( ON-TABLE ?auto_778123 ) ( ON ?auto_778124 ?auto_778123 ) ( ON ?auto_778125 ?auto_778124 ) ( not ( = ?auto_778123 ?auto_778124 ) ) ( not ( = ?auto_778123 ?auto_778125 ) ) ( not ( = ?auto_778123 ?auto_778126 ) ) ( not ( = ?auto_778123 ?auto_778127 ) ) ( not ( = ?auto_778123 ?auto_778128 ) ) ( not ( = ?auto_778123 ?auto_778129 ) ) ( not ( = ?auto_778123 ?auto_778130 ) ) ( not ( = ?auto_778123 ?auto_778131 ) ) ( not ( = ?auto_778123 ?auto_778132 ) ) ( not ( = ?auto_778123 ?auto_778133 ) ) ( not ( = ?auto_778123 ?auto_778134 ) ) ( not ( = ?auto_778123 ?auto_778135 ) ) ( not ( = ?auto_778123 ?auto_778136 ) ) ( not ( = ?auto_778124 ?auto_778125 ) ) ( not ( = ?auto_778124 ?auto_778126 ) ) ( not ( = ?auto_778124 ?auto_778127 ) ) ( not ( = ?auto_778124 ?auto_778128 ) ) ( not ( = ?auto_778124 ?auto_778129 ) ) ( not ( = ?auto_778124 ?auto_778130 ) ) ( not ( = ?auto_778124 ?auto_778131 ) ) ( not ( = ?auto_778124 ?auto_778132 ) ) ( not ( = ?auto_778124 ?auto_778133 ) ) ( not ( = ?auto_778124 ?auto_778134 ) ) ( not ( = ?auto_778124 ?auto_778135 ) ) ( not ( = ?auto_778124 ?auto_778136 ) ) ( not ( = ?auto_778125 ?auto_778126 ) ) ( not ( = ?auto_778125 ?auto_778127 ) ) ( not ( = ?auto_778125 ?auto_778128 ) ) ( not ( = ?auto_778125 ?auto_778129 ) ) ( not ( = ?auto_778125 ?auto_778130 ) ) ( not ( = ?auto_778125 ?auto_778131 ) ) ( not ( = ?auto_778125 ?auto_778132 ) ) ( not ( = ?auto_778125 ?auto_778133 ) ) ( not ( = ?auto_778125 ?auto_778134 ) ) ( not ( = ?auto_778125 ?auto_778135 ) ) ( not ( = ?auto_778125 ?auto_778136 ) ) ( not ( = ?auto_778126 ?auto_778127 ) ) ( not ( = ?auto_778126 ?auto_778128 ) ) ( not ( = ?auto_778126 ?auto_778129 ) ) ( not ( = ?auto_778126 ?auto_778130 ) ) ( not ( = ?auto_778126 ?auto_778131 ) ) ( not ( = ?auto_778126 ?auto_778132 ) ) ( not ( = ?auto_778126 ?auto_778133 ) ) ( not ( = ?auto_778126 ?auto_778134 ) ) ( not ( = ?auto_778126 ?auto_778135 ) ) ( not ( = ?auto_778126 ?auto_778136 ) ) ( not ( = ?auto_778127 ?auto_778128 ) ) ( not ( = ?auto_778127 ?auto_778129 ) ) ( not ( = ?auto_778127 ?auto_778130 ) ) ( not ( = ?auto_778127 ?auto_778131 ) ) ( not ( = ?auto_778127 ?auto_778132 ) ) ( not ( = ?auto_778127 ?auto_778133 ) ) ( not ( = ?auto_778127 ?auto_778134 ) ) ( not ( = ?auto_778127 ?auto_778135 ) ) ( not ( = ?auto_778127 ?auto_778136 ) ) ( not ( = ?auto_778128 ?auto_778129 ) ) ( not ( = ?auto_778128 ?auto_778130 ) ) ( not ( = ?auto_778128 ?auto_778131 ) ) ( not ( = ?auto_778128 ?auto_778132 ) ) ( not ( = ?auto_778128 ?auto_778133 ) ) ( not ( = ?auto_778128 ?auto_778134 ) ) ( not ( = ?auto_778128 ?auto_778135 ) ) ( not ( = ?auto_778128 ?auto_778136 ) ) ( not ( = ?auto_778129 ?auto_778130 ) ) ( not ( = ?auto_778129 ?auto_778131 ) ) ( not ( = ?auto_778129 ?auto_778132 ) ) ( not ( = ?auto_778129 ?auto_778133 ) ) ( not ( = ?auto_778129 ?auto_778134 ) ) ( not ( = ?auto_778129 ?auto_778135 ) ) ( not ( = ?auto_778129 ?auto_778136 ) ) ( not ( = ?auto_778130 ?auto_778131 ) ) ( not ( = ?auto_778130 ?auto_778132 ) ) ( not ( = ?auto_778130 ?auto_778133 ) ) ( not ( = ?auto_778130 ?auto_778134 ) ) ( not ( = ?auto_778130 ?auto_778135 ) ) ( not ( = ?auto_778130 ?auto_778136 ) ) ( not ( = ?auto_778131 ?auto_778132 ) ) ( not ( = ?auto_778131 ?auto_778133 ) ) ( not ( = ?auto_778131 ?auto_778134 ) ) ( not ( = ?auto_778131 ?auto_778135 ) ) ( not ( = ?auto_778131 ?auto_778136 ) ) ( not ( = ?auto_778132 ?auto_778133 ) ) ( not ( = ?auto_778132 ?auto_778134 ) ) ( not ( = ?auto_778132 ?auto_778135 ) ) ( not ( = ?auto_778132 ?auto_778136 ) ) ( not ( = ?auto_778133 ?auto_778134 ) ) ( not ( = ?auto_778133 ?auto_778135 ) ) ( not ( = ?auto_778133 ?auto_778136 ) ) ( not ( = ?auto_778134 ?auto_778135 ) ) ( not ( = ?auto_778134 ?auto_778136 ) ) ( not ( = ?auto_778135 ?auto_778136 ) ) ( ON ?auto_778134 ?auto_778135 ) ( ON ?auto_778133 ?auto_778134 ) ( ON ?auto_778132 ?auto_778133 ) ( ON ?auto_778131 ?auto_778132 ) ( ON ?auto_778130 ?auto_778131 ) ( ON ?auto_778129 ?auto_778130 ) ( ON ?auto_778128 ?auto_778129 ) ( ON ?auto_778127 ?auto_778128 ) ( CLEAR ?auto_778125 ) ( ON ?auto_778126 ?auto_778127 ) ( CLEAR ?auto_778126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_778123 ?auto_778124 ?auto_778125 ?auto_778126 )
      ( MAKE-13PILE ?auto_778123 ?auto_778124 ?auto_778125 ?auto_778126 ?auto_778127 ?auto_778128 ?auto_778129 ?auto_778130 ?auto_778131 ?auto_778132 ?auto_778133 ?auto_778134 ?auto_778135 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_778177 - BLOCK
      ?auto_778178 - BLOCK
      ?auto_778179 - BLOCK
      ?auto_778180 - BLOCK
      ?auto_778181 - BLOCK
      ?auto_778182 - BLOCK
      ?auto_778183 - BLOCK
      ?auto_778184 - BLOCK
      ?auto_778185 - BLOCK
      ?auto_778186 - BLOCK
      ?auto_778187 - BLOCK
      ?auto_778188 - BLOCK
      ?auto_778189 - BLOCK
    )
    :vars
    (
      ?auto_778190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_778189 ?auto_778190 ) ( ON-TABLE ?auto_778177 ) ( ON ?auto_778178 ?auto_778177 ) ( not ( = ?auto_778177 ?auto_778178 ) ) ( not ( = ?auto_778177 ?auto_778179 ) ) ( not ( = ?auto_778177 ?auto_778180 ) ) ( not ( = ?auto_778177 ?auto_778181 ) ) ( not ( = ?auto_778177 ?auto_778182 ) ) ( not ( = ?auto_778177 ?auto_778183 ) ) ( not ( = ?auto_778177 ?auto_778184 ) ) ( not ( = ?auto_778177 ?auto_778185 ) ) ( not ( = ?auto_778177 ?auto_778186 ) ) ( not ( = ?auto_778177 ?auto_778187 ) ) ( not ( = ?auto_778177 ?auto_778188 ) ) ( not ( = ?auto_778177 ?auto_778189 ) ) ( not ( = ?auto_778177 ?auto_778190 ) ) ( not ( = ?auto_778178 ?auto_778179 ) ) ( not ( = ?auto_778178 ?auto_778180 ) ) ( not ( = ?auto_778178 ?auto_778181 ) ) ( not ( = ?auto_778178 ?auto_778182 ) ) ( not ( = ?auto_778178 ?auto_778183 ) ) ( not ( = ?auto_778178 ?auto_778184 ) ) ( not ( = ?auto_778178 ?auto_778185 ) ) ( not ( = ?auto_778178 ?auto_778186 ) ) ( not ( = ?auto_778178 ?auto_778187 ) ) ( not ( = ?auto_778178 ?auto_778188 ) ) ( not ( = ?auto_778178 ?auto_778189 ) ) ( not ( = ?auto_778178 ?auto_778190 ) ) ( not ( = ?auto_778179 ?auto_778180 ) ) ( not ( = ?auto_778179 ?auto_778181 ) ) ( not ( = ?auto_778179 ?auto_778182 ) ) ( not ( = ?auto_778179 ?auto_778183 ) ) ( not ( = ?auto_778179 ?auto_778184 ) ) ( not ( = ?auto_778179 ?auto_778185 ) ) ( not ( = ?auto_778179 ?auto_778186 ) ) ( not ( = ?auto_778179 ?auto_778187 ) ) ( not ( = ?auto_778179 ?auto_778188 ) ) ( not ( = ?auto_778179 ?auto_778189 ) ) ( not ( = ?auto_778179 ?auto_778190 ) ) ( not ( = ?auto_778180 ?auto_778181 ) ) ( not ( = ?auto_778180 ?auto_778182 ) ) ( not ( = ?auto_778180 ?auto_778183 ) ) ( not ( = ?auto_778180 ?auto_778184 ) ) ( not ( = ?auto_778180 ?auto_778185 ) ) ( not ( = ?auto_778180 ?auto_778186 ) ) ( not ( = ?auto_778180 ?auto_778187 ) ) ( not ( = ?auto_778180 ?auto_778188 ) ) ( not ( = ?auto_778180 ?auto_778189 ) ) ( not ( = ?auto_778180 ?auto_778190 ) ) ( not ( = ?auto_778181 ?auto_778182 ) ) ( not ( = ?auto_778181 ?auto_778183 ) ) ( not ( = ?auto_778181 ?auto_778184 ) ) ( not ( = ?auto_778181 ?auto_778185 ) ) ( not ( = ?auto_778181 ?auto_778186 ) ) ( not ( = ?auto_778181 ?auto_778187 ) ) ( not ( = ?auto_778181 ?auto_778188 ) ) ( not ( = ?auto_778181 ?auto_778189 ) ) ( not ( = ?auto_778181 ?auto_778190 ) ) ( not ( = ?auto_778182 ?auto_778183 ) ) ( not ( = ?auto_778182 ?auto_778184 ) ) ( not ( = ?auto_778182 ?auto_778185 ) ) ( not ( = ?auto_778182 ?auto_778186 ) ) ( not ( = ?auto_778182 ?auto_778187 ) ) ( not ( = ?auto_778182 ?auto_778188 ) ) ( not ( = ?auto_778182 ?auto_778189 ) ) ( not ( = ?auto_778182 ?auto_778190 ) ) ( not ( = ?auto_778183 ?auto_778184 ) ) ( not ( = ?auto_778183 ?auto_778185 ) ) ( not ( = ?auto_778183 ?auto_778186 ) ) ( not ( = ?auto_778183 ?auto_778187 ) ) ( not ( = ?auto_778183 ?auto_778188 ) ) ( not ( = ?auto_778183 ?auto_778189 ) ) ( not ( = ?auto_778183 ?auto_778190 ) ) ( not ( = ?auto_778184 ?auto_778185 ) ) ( not ( = ?auto_778184 ?auto_778186 ) ) ( not ( = ?auto_778184 ?auto_778187 ) ) ( not ( = ?auto_778184 ?auto_778188 ) ) ( not ( = ?auto_778184 ?auto_778189 ) ) ( not ( = ?auto_778184 ?auto_778190 ) ) ( not ( = ?auto_778185 ?auto_778186 ) ) ( not ( = ?auto_778185 ?auto_778187 ) ) ( not ( = ?auto_778185 ?auto_778188 ) ) ( not ( = ?auto_778185 ?auto_778189 ) ) ( not ( = ?auto_778185 ?auto_778190 ) ) ( not ( = ?auto_778186 ?auto_778187 ) ) ( not ( = ?auto_778186 ?auto_778188 ) ) ( not ( = ?auto_778186 ?auto_778189 ) ) ( not ( = ?auto_778186 ?auto_778190 ) ) ( not ( = ?auto_778187 ?auto_778188 ) ) ( not ( = ?auto_778187 ?auto_778189 ) ) ( not ( = ?auto_778187 ?auto_778190 ) ) ( not ( = ?auto_778188 ?auto_778189 ) ) ( not ( = ?auto_778188 ?auto_778190 ) ) ( not ( = ?auto_778189 ?auto_778190 ) ) ( ON ?auto_778188 ?auto_778189 ) ( ON ?auto_778187 ?auto_778188 ) ( ON ?auto_778186 ?auto_778187 ) ( ON ?auto_778185 ?auto_778186 ) ( ON ?auto_778184 ?auto_778185 ) ( ON ?auto_778183 ?auto_778184 ) ( ON ?auto_778182 ?auto_778183 ) ( ON ?auto_778181 ?auto_778182 ) ( ON ?auto_778180 ?auto_778181 ) ( CLEAR ?auto_778178 ) ( ON ?auto_778179 ?auto_778180 ) ( CLEAR ?auto_778179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_778177 ?auto_778178 ?auto_778179 )
      ( MAKE-13PILE ?auto_778177 ?auto_778178 ?auto_778179 ?auto_778180 ?auto_778181 ?auto_778182 ?auto_778183 ?auto_778184 ?auto_778185 ?auto_778186 ?auto_778187 ?auto_778188 ?auto_778189 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_778231 - BLOCK
      ?auto_778232 - BLOCK
      ?auto_778233 - BLOCK
      ?auto_778234 - BLOCK
      ?auto_778235 - BLOCK
      ?auto_778236 - BLOCK
      ?auto_778237 - BLOCK
      ?auto_778238 - BLOCK
      ?auto_778239 - BLOCK
      ?auto_778240 - BLOCK
      ?auto_778241 - BLOCK
      ?auto_778242 - BLOCK
      ?auto_778243 - BLOCK
    )
    :vars
    (
      ?auto_778244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_778243 ?auto_778244 ) ( ON-TABLE ?auto_778231 ) ( not ( = ?auto_778231 ?auto_778232 ) ) ( not ( = ?auto_778231 ?auto_778233 ) ) ( not ( = ?auto_778231 ?auto_778234 ) ) ( not ( = ?auto_778231 ?auto_778235 ) ) ( not ( = ?auto_778231 ?auto_778236 ) ) ( not ( = ?auto_778231 ?auto_778237 ) ) ( not ( = ?auto_778231 ?auto_778238 ) ) ( not ( = ?auto_778231 ?auto_778239 ) ) ( not ( = ?auto_778231 ?auto_778240 ) ) ( not ( = ?auto_778231 ?auto_778241 ) ) ( not ( = ?auto_778231 ?auto_778242 ) ) ( not ( = ?auto_778231 ?auto_778243 ) ) ( not ( = ?auto_778231 ?auto_778244 ) ) ( not ( = ?auto_778232 ?auto_778233 ) ) ( not ( = ?auto_778232 ?auto_778234 ) ) ( not ( = ?auto_778232 ?auto_778235 ) ) ( not ( = ?auto_778232 ?auto_778236 ) ) ( not ( = ?auto_778232 ?auto_778237 ) ) ( not ( = ?auto_778232 ?auto_778238 ) ) ( not ( = ?auto_778232 ?auto_778239 ) ) ( not ( = ?auto_778232 ?auto_778240 ) ) ( not ( = ?auto_778232 ?auto_778241 ) ) ( not ( = ?auto_778232 ?auto_778242 ) ) ( not ( = ?auto_778232 ?auto_778243 ) ) ( not ( = ?auto_778232 ?auto_778244 ) ) ( not ( = ?auto_778233 ?auto_778234 ) ) ( not ( = ?auto_778233 ?auto_778235 ) ) ( not ( = ?auto_778233 ?auto_778236 ) ) ( not ( = ?auto_778233 ?auto_778237 ) ) ( not ( = ?auto_778233 ?auto_778238 ) ) ( not ( = ?auto_778233 ?auto_778239 ) ) ( not ( = ?auto_778233 ?auto_778240 ) ) ( not ( = ?auto_778233 ?auto_778241 ) ) ( not ( = ?auto_778233 ?auto_778242 ) ) ( not ( = ?auto_778233 ?auto_778243 ) ) ( not ( = ?auto_778233 ?auto_778244 ) ) ( not ( = ?auto_778234 ?auto_778235 ) ) ( not ( = ?auto_778234 ?auto_778236 ) ) ( not ( = ?auto_778234 ?auto_778237 ) ) ( not ( = ?auto_778234 ?auto_778238 ) ) ( not ( = ?auto_778234 ?auto_778239 ) ) ( not ( = ?auto_778234 ?auto_778240 ) ) ( not ( = ?auto_778234 ?auto_778241 ) ) ( not ( = ?auto_778234 ?auto_778242 ) ) ( not ( = ?auto_778234 ?auto_778243 ) ) ( not ( = ?auto_778234 ?auto_778244 ) ) ( not ( = ?auto_778235 ?auto_778236 ) ) ( not ( = ?auto_778235 ?auto_778237 ) ) ( not ( = ?auto_778235 ?auto_778238 ) ) ( not ( = ?auto_778235 ?auto_778239 ) ) ( not ( = ?auto_778235 ?auto_778240 ) ) ( not ( = ?auto_778235 ?auto_778241 ) ) ( not ( = ?auto_778235 ?auto_778242 ) ) ( not ( = ?auto_778235 ?auto_778243 ) ) ( not ( = ?auto_778235 ?auto_778244 ) ) ( not ( = ?auto_778236 ?auto_778237 ) ) ( not ( = ?auto_778236 ?auto_778238 ) ) ( not ( = ?auto_778236 ?auto_778239 ) ) ( not ( = ?auto_778236 ?auto_778240 ) ) ( not ( = ?auto_778236 ?auto_778241 ) ) ( not ( = ?auto_778236 ?auto_778242 ) ) ( not ( = ?auto_778236 ?auto_778243 ) ) ( not ( = ?auto_778236 ?auto_778244 ) ) ( not ( = ?auto_778237 ?auto_778238 ) ) ( not ( = ?auto_778237 ?auto_778239 ) ) ( not ( = ?auto_778237 ?auto_778240 ) ) ( not ( = ?auto_778237 ?auto_778241 ) ) ( not ( = ?auto_778237 ?auto_778242 ) ) ( not ( = ?auto_778237 ?auto_778243 ) ) ( not ( = ?auto_778237 ?auto_778244 ) ) ( not ( = ?auto_778238 ?auto_778239 ) ) ( not ( = ?auto_778238 ?auto_778240 ) ) ( not ( = ?auto_778238 ?auto_778241 ) ) ( not ( = ?auto_778238 ?auto_778242 ) ) ( not ( = ?auto_778238 ?auto_778243 ) ) ( not ( = ?auto_778238 ?auto_778244 ) ) ( not ( = ?auto_778239 ?auto_778240 ) ) ( not ( = ?auto_778239 ?auto_778241 ) ) ( not ( = ?auto_778239 ?auto_778242 ) ) ( not ( = ?auto_778239 ?auto_778243 ) ) ( not ( = ?auto_778239 ?auto_778244 ) ) ( not ( = ?auto_778240 ?auto_778241 ) ) ( not ( = ?auto_778240 ?auto_778242 ) ) ( not ( = ?auto_778240 ?auto_778243 ) ) ( not ( = ?auto_778240 ?auto_778244 ) ) ( not ( = ?auto_778241 ?auto_778242 ) ) ( not ( = ?auto_778241 ?auto_778243 ) ) ( not ( = ?auto_778241 ?auto_778244 ) ) ( not ( = ?auto_778242 ?auto_778243 ) ) ( not ( = ?auto_778242 ?auto_778244 ) ) ( not ( = ?auto_778243 ?auto_778244 ) ) ( ON ?auto_778242 ?auto_778243 ) ( ON ?auto_778241 ?auto_778242 ) ( ON ?auto_778240 ?auto_778241 ) ( ON ?auto_778239 ?auto_778240 ) ( ON ?auto_778238 ?auto_778239 ) ( ON ?auto_778237 ?auto_778238 ) ( ON ?auto_778236 ?auto_778237 ) ( ON ?auto_778235 ?auto_778236 ) ( ON ?auto_778234 ?auto_778235 ) ( ON ?auto_778233 ?auto_778234 ) ( CLEAR ?auto_778231 ) ( ON ?auto_778232 ?auto_778233 ) ( CLEAR ?auto_778232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_778231 ?auto_778232 )
      ( MAKE-13PILE ?auto_778231 ?auto_778232 ?auto_778233 ?auto_778234 ?auto_778235 ?auto_778236 ?auto_778237 ?auto_778238 ?auto_778239 ?auto_778240 ?auto_778241 ?auto_778242 ?auto_778243 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_778285 - BLOCK
      ?auto_778286 - BLOCK
      ?auto_778287 - BLOCK
      ?auto_778288 - BLOCK
      ?auto_778289 - BLOCK
      ?auto_778290 - BLOCK
      ?auto_778291 - BLOCK
      ?auto_778292 - BLOCK
      ?auto_778293 - BLOCK
      ?auto_778294 - BLOCK
      ?auto_778295 - BLOCK
      ?auto_778296 - BLOCK
      ?auto_778297 - BLOCK
    )
    :vars
    (
      ?auto_778298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_778297 ?auto_778298 ) ( not ( = ?auto_778285 ?auto_778286 ) ) ( not ( = ?auto_778285 ?auto_778287 ) ) ( not ( = ?auto_778285 ?auto_778288 ) ) ( not ( = ?auto_778285 ?auto_778289 ) ) ( not ( = ?auto_778285 ?auto_778290 ) ) ( not ( = ?auto_778285 ?auto_778291 ) ) ( not ( = ?auto_778285 ?auto_778292 ) ) ( not ( = ?auto_778285 ?auto_778293 ) ) ( not ( = ?auto_778285 ?auto_778294 ) ) ( not ( = ?auto_778285 ?auto_778295 ) ) ( not ( = ?auto_778285 ?auto_778296 ) ) ( not ( = ?auto_778285 ?auto_778297 ) ) ( not ( = ?auto_778285 ?auto_778298 ) ) ( not ( = ?auto_778286 ?auto_778287 ) ) ( not ( = ?auto_778286 ?auto_778288 ) ) ( not ( = ?auto_778286 ?auto_778289 ) ) ( not ( = ?auto_778286 ?auto_778290 ) ) ( not ( = ?auto_778286 ?auto_778291 ) ) ( not ( = ?auto_778286 ?auto_778292 ) ) ( not ( = ?auto_778286 ?auto_778293 ) ) ( not ( = ?auto_778286 ?auto_778294 ) ) ( not ( = ?auto_778286 ?auto_778295 ) ) ( not ( = ?auto_778286 ?auto_778296 ) ) ( not ( = ?auto_778286 ?auto_778297 ) ) ( not ( = ?auto_778286 ?auto_778298 ) ) ( not ( = ?auto_778287 ?auto_778288 ) ) ( not ( = ?auto_778287 ?auto_778289 ) ) ( not ( = ?auto_778287 ?auto_778290 ) ) ( not ( = ?auto_778287 ?auto_778291 ) ) ( not ( = ?auto_778287 ?auto_778292 ) ) ( not ( = ?auto_778287 ?auto_778293 ) ) ( not ( = ?auto_778287 ?auto_778294 ) ) ( not ( = ?auto_778287 ?auto_778295 ) ) ( not ( = ?auto_778287 ?auto_778296 ) ) ( not ( = ?auto_778287 ?auto_778297 ) ) ( not ( = ?auto_778287 ?auto_778298 ) ) ( not ( = ?auto_778288 ?auto_778289 ) ) ( not ( = ?auto_778288 ?auto_778290 ) ) ( not ( = ?auto_778288 ?auto_778291 ) ) ( not ( = ?auto_778288 ?auto_778292 ) ) ( not ( = ?auto_778288 ?auto_778293 ) ) ( not ( = ?auto_778288 ?auto_778294 ) ) ( not ( = ?auto_778288 ?auto_778295 ) ) ( not ( = ?auto_778288 ?auto_778296 ) ) ( not ( = ?auto_778288 ?auto_778297 ) ) ( not ( = ?auto_778288 ?auto_778298 ) ) ( not ( = ?auto_778289 ?auto_778290 ) ) ( not ( = ?auto_778289 ?auto_778291 ) ) ( not ( = ?auto_778289 ?auto_778292 ) ) ( not ( = ?auto_778289 ?auto_778293 ) ) ( not ( = ?auto_778289 ?auto_778294 ) ) ( not ( = ?auto_778289 ?auto_778295 ) ) ( not ( = ?auto_778289 ?auto_778296 ) ) ( not ( = ?auto_778289 ?auto_778297 ) ) ( not ( = ?auto_778289 ?auto_778298 ) ) ( not ( = ?auto_778290 ?auto_778291 ) ) ( not ( = ?auto_778290 ?auto_778292 ) ) ( not ( = ?auto_778290 ?auto_778293 ) ) ( not ( = ?auto_778290 ?auto_778294 ) ) ( not ( = ?auto_778290 ?auto_778295 ) ) ( not ( = ?auto_778290 ?auto_778296 ) ) ( not ( = ?auto_778290 ?auto_778297 ) ) ( not ( = ?auto_778290 ?auto_778298 ) ) ( not ( = ?auto_778291 ?auto_778292 ) ) ( not ( = ?auto_778291 ?auto_778293 ) ) ( not ( = ?auto_778291 ?auto_778294 ) ) ( not ( = ?auto_778291 ?auto_778295 ) ) ( not ( = ?auto_778291 ?auto_778296 ) ) ( not ( = ?auto_778291 ?auto_778297 ) ) ( not ( = ?auto_778291 ?auto_778298 ) ) ( not ( = ?auto_778292 ?auto_778293 ) ) ( not ( = ?auto_778292 ?auto_778294 ) ) ( not ( = ?auto_778292 ?auto_778295 ) ) ( not ( = ?auto_778292 ?auto_778296 ) ) ( not ( = ?auto_778292 ?auto_778297 ) ) ( not ( = ?auto_778292 ?auto_778298 ) ) ( not ( = ?auto_778293 ?auto_778294 ) ) ( not ( = ?auto_778293 ?auto_778295 ) ) ( not ( = ?auto_778293 ?auto_778296 ) ) ( not ( = ?auto_778293 ?auto_778297 ) ) ( not ( = ?auto_778293 ?auto_778298 ) ) ( not ( = ?auto_778294 ?auto_778295 ) ) ( not ( = ?auto_778294 ?auto_778296 ) ) ( not ( = ?auto_778294 ?auto_778297 ) ) ( not ( = ?auto_778294 ?auto_778298 ) ) ( not ( = ?auto_778295 ?auto_778296 ) ) ( not ( = ?auto_778295 ?auto_778297 ) ) ( not ( = ?auto_778295 ?auto_778298 ) ) ( not ( = ?auto_778296 ?auto_778297 ) ) ( not ( = ?auto_778296 ?auto_778298 ) ) ( not ( = ?auto_778297 ?auto_778298 ) ) ( ON ?auto_778296 ?auto_778297 ) ( ON ?auto_778295 ?auto_778296 ) ( ON ?auto_778294 ?auto_778295 ) ( ON ?auto_778293 ?auto_778294 ) ( ON ?auto_778292 ?auto_778293 ) ( ON ?auto_778291 ?auto_778292 ) ( ON ?auto_778290 ?auto_778291 ) ( ON ?auto_778289 ?auto_778290 ) ( ON ?auto_778288 ?auto_778289 ) ( ON ?auto_778287 ?auto_778288 ) ( ON ?auto_778286 ?auto_778287 ) ( ON ?auto_778285 ?auto_778286 ) ( CLEAR ?auto_778285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_778285 )
      ( MAKE-13PILE ?auto_778285 ?auto_778286 ?auto_778287 ?auto_778288 ?auto_778289 ?auto_778290 ?auto_778291 ?auto_778292 ?auto_778293 ?auto_778294 ?auto_778295 ?auto_778296 ?auto_778297 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_778340 - BLOCK
      ?auto_778341 - BLOCK
      ?auto_778342 - BLOCK
      ?auto_778343 - BLOCK
      ?auto_778344 - BLOCK
      ?auto_778345 - BLOCK
      ?auto_778346 - BLOCK
      ?auto_778347 - BLOCK
      ?auto_778348 - BLOCK
      ?auto_778349 - BLOCK
      ?auto_778350 - BLOCK
      ?auto_778351 - BLOCK
      ?auto_778352 - BLOCK
      ?auto_778353 - BLOCK
    )
    :vars
    (
      ?auto_778354 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_778352 ) ( ON ?auto_778353 ?auto_778354 ) ( CLEAR ?auto_778353 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_778340 ) ( ON ?auto_778341 ?auto_778340 ) ( ON ?auto_778342 ?auto_778341 ) ( ON ?auto_778343 ?auto_778342 ) ( ON ?auto_778344 ?auto_778343 ) ( ON ?auto_778345 ?auto_778344 ) ( ON ?auto_778346 ?auto_778345 ) ( ON ?auto_778347 ?auto_778346 ) ( ON ?auto_778348 ?auto_778347 ) ( ON ?auto_778349 ?auto_778348 ) ( ON ?auto_778350 ?auto_778349 ) ( ON ?auto_778351 ?auto_778350 ) ( ON ?auto_778352 ?auto_778351 ) ( not ( = ?auto_778340 ?auto_778341 ) ) ( not ( = ?auto_778340 ?auto_778342 ) ) ( not ( = ?auto_778340 ?auto_778343 ) ) ( not ( = ?auto_778340 ?auto_778344 ) ) ( not ( = ?auto_778340 ?auto_778345 ) ) ( not ( = ?auto_778340 ?auto_778346 ) ) ( not ( = ?auto_778340 ?auto_778347 ) ) ( not ( = ?auto_778340 ?auto_778348 ) ) ( not ( = ?auto_778340 ?auto_778349 ) ) ( not ( = ?auto_778340 ?auto_778350 ) ) ( not ( = ?auto_778340 ?auto_778351 ) ) ( not ( = ?auto_778340 ?auto_778352 ) ) ( not ( = ?auto_778340 ?auto_778353 ) ) ( not ( = ?auto_778340 ?auto_778354 ) ) ( not ( = ?auto_778341 ?auto_778342 ) ) ( not ( = ?auto_778341 ?auto_778343 ) ) ( not ( = ?auto_778341 ?auto_778344 ) ) ( not ( = ?auto_778341 ?auto_778345 ) ) ( not ( = ?auto_778341 ?auto_778346 ) ) ( not ( = ?auto_778341 ?auto_778347 ) ) ( not ( = ?auto_778341 ?auto_778348 ) ) ( not ( = ?auto_778341 ?auto_778349 ) ) ( not ( = ?auto_778341 ?auto_778350 ) ) ( not ( = ?auto_778341 ?auto_778351 ) ) ( not ( = ?auto_778341 ?auto_778352 ) ) ( not ( = ?auto_778341 ?auto_778353 ) ) ( not ( = ?auto_778341 ?auto_778354 ) ) ( not ( = ?auto_778342 ?auto_778343 ) ) ( not ( = ?auto_778342 ?auto_778344 ) ) ( not ( = ?auto_778342 ?auto_778345 ) ) ( not ( = ?auto_778342 ?auto_778346 ) ) ( not ( = ?auto_778342 ?auto_778347 ) ) ( not ( = ?auto_778342 ?auto_778348 ) ) ( not ( = ?auto_778342 ?auto_778349 ) ) ( not ( = ?auto_778342 ?auto_778350 ) ) ( not ( = ?auto_778342 ?auto_778351 ) ) ( not ( = ?auto_778342 ?auto_778352 ) ) ( not ( = ?auto_778342 ?auto_778353 ) ) ( not ( = ?auto_778342 ?auto_778354 ) ) ( not ( = ?auto_778343 ?auto_778344 ) ) ( not ( = ?auto_778343 ?auto_778345 ) ) ( not ( = ?auto_778343 ?auto_778346 ) ) ( not ( = ?auto_778343 ?auto_778347 ) ) ( not ( = ?auto_778343 ?auto_778348 ) ) ( not ( = ?auto_778343 ?auto_778349 ) ) ( not ( = ?auto_778343 ?auto_778350 ) ) ( not ( = ?auto_778343 ?auto_778351 ) ) ( not ( = ?auto_778343 ?auto_778352 ) ) ( not ( = ?auto_778343 ?auto_778353 ) ) ( not ( = ?auto_778343 ?auto_778354 ) ) ( not ( = ?auto_778344 ?auto_778345 ) ) ( not ( = ?auto_778344 ?auto_778346 ) ) ( not ( = ?auto_778344 ?auto_778347 ) ) ( not ( = ?auto_778344 ?auto_778348 ) ) ( not ( = ?auto_778344 ?auto_778349 ) ) ( not ( = ?auto_778344 ?auto_778350 ) ) ( not ( = ?auto_778344 ?auto_778351 ) ) ( not ( = ?auto_778344 ?auto_778352 ) ) ( not ( = ?auto_778344 ?auto_778353 ) ) ( not ( = ?auto_778344 ?auto_778354 ) ) ( not ( = ?auto_778345 ?auto_778346 ) ) ( not ( = ?auto_778345 ?auto_778347 ) ) ( not ( = ?auto_778345 ?auto_778348 ) ) ( not ( = ?auto_778345 ?auto_778349 ) ) ( not ( = ?auto_778345 ?auto_778350 ) ) ( not ( = ?auto_778345 ?auto_778351 ) ) ( not ( = ?auto_778345 ?auto_778352 ) ) ( not ( = ?auto_778345 ?auto_778353 ) ) ( not ( = ?auto_778345 ?auto_778354 ) ) ( not ( = ?auto_778346 ?auto_778347 ) ) ( not ( = ?auto_778346 ?auto_778348 ) ) ( not ( = ?auto_778346 ?auto_778349 ) ) ( not ( = ?auto_778346 ?auto_778350 ) ) ( not ( = ?auto_778346 ?auto_778351 ) ) ( not ( = ?auto_778346 ?auto_778352 ) ) ( not ( = ?auto_778346 ?auto_778353 ) ) ( not ( = ?auto_778346 ?auto_778354 ) ) ( not ( = ?auto_778347 ?auto_778348 ) ) ( not ( = ?auto_778347 ?auto_778349 ) ) ( not ( = ?auto_778347 ?auto_778350 ) ) ( not ( = ?auto_778347 ?auto_778351 ) ) ( not ( = ?auto_778347 ?auto_778352 ) ) ( not ( = ?auto_778347 ?auto_778353 ) ) ( not ( = ?auto_778347 ?auto_778354 ) ) ( not ( = ?auto_778348 ?auto_778349 ) ) ( not ( = ?auto_778348 ?auto_778350 ) ) ( not ( = ?auto_778348 ?auto_778351 ) ) ( not ( = ?auto_778348 ?auto_778352 ) ) ( not ( = ?auto_778348 ?auto_778353 ) ) ( not ( = ?auto_778348 ?auto_778354 ) ) ( not ( = ?auto_778349 ?auto_778350 ) ) ( not ( = ?auto_778349 ?auto_778351 ) ) ( not ( = ?auto_778349 ?auto_778352 ) ) ( not ( = ?auto_778349 ?auto_778353 ) ) ( not ( = ?auto_778349 ?auto_778354 ) ) ( not ( = ?auto_778350 ?auto_778351 ) ) ( not ( = ?auto_778350 ?auto_778352 ) ) ( not ( = ?auto_778350 ?auto_778353 ) ) ( not ( = ?auto_778350 ?auto_778354 ) ) ( not ( = ?auto_778351 ?auto_778352 ) ) ( not ( = ?auto_778351 ?auto_778353 ) ) ( not ( = ?auto_778351 ?auto_778354 ) ) ( not ( = ?auto_778352 ?auto_778353 ) ) ( not ( = ?auto_778352 ?auto_778354 ) ) ( not ( = ?auto_778353 ?auto_778354 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_778353 ?auto_778354 )
      ( !STACK ?auto_778353 ?auto_778352 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_778398 - BLOCK
      ?auto_778399 - BLOCK
      ?auto_778400 - BLOCK
      ?auto_778401 - BLOCK
      ?auto_778402 - BLOCK
      ?auto_778403 - BLOCK
      ?auto_778404 - BLOCK
      ?auto_778405 - BLOCK
      ?auto_778406 - BLOCK
      ?auto_778407 - BLOCK
      ?auto_778408 - BLOCK
      ?auto_778409 - BLOCK
      ?auto_778410 - BLOCK
      ?auto_778411 - BLOCK
    )
    :vars
    (
      ?auto_778412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_778411 ?auto_778412 ) ( ON-TABLE ?auto_778398 ) ( ON ?auto_778399 ?auto_778398 ) ( ON ?auto_778400 ?auto_778399 ) ( ON ?auto_778401 ?auto_778400 ) ( ON ?auto_778402 ?auto_778401 ) ( ON ?auto_778403 ?auto_778402 ) ( ON ?auto_778404 ?auto_778403 ) ( ON ?auto_778405 ?auto_778404 ) ( ON ?auto_778406 ?auto_778405 ) ( ON ?auto_778407 ?auto_778406 ) ( ON ?auto_778408 ?auto_778407 ) ( ON ?auto_778409 ?auto_778408 ) ( not ( = ?auto_778398 ?auto_778399 ) ) ( not ( = ?auto_778398 ?auto_778400 ) ) ( not ( = ?auto_778398 ?auto_778401 ) ) ( not ( = ?auto_778398 ?auto_778402 ) ) ( not ( = ?auto_778398 ?auto_778403 ) ) ( not ( = ?auto_778398 ?auto_778404 ) ) ( not ( = ?auto_778398 ?auto_778405 ) ) ( not ( = ?auto_778398 ?auto_778406 ) ) ( not ( = ?auto_778398 ?auto_778407 ) ) ( not ( = ?auto_778398 ?auto_778408 ) ) ( not ( = ?auto_778398 ?auto_778409 ) ) ( not ( = ?auto_778398 ?auto_778410 ) ) ( not ( = ?auto_778398 ?auto_778411 ) ) ( not ( = ?auto_778398 ?auto_778412 ) ) ( not ( = ?auto_778399 ?auto_778400 ) ) ( not ( = ?auto_778399 ?auto_778401 ) ) ( not ( = ?auto_778399 ?auto_778402 ) ) ( not ( = ?auto_778399 ?auto_778403 ) ) ( not ( = ?auto_778399 ?auto_778404 ) ) ( not ( = ?auto_778399 ?auto_778405 ) ) ( not ( = ?auto_778399 ?auto_778406 ) ) ( not ( = ?auto_778399 ?auto_778407 ) ) ( not ( = ?auto_778399 ?auto_778408 ) ) ( not ( = ?auto_778399 ?auto_778409 ) ) ( not ( = ?auto_778399 ?auto_778410 ) ) ( not ( = ?auto_778399 ?auto_778411 ) ) ( not ( = ?auto_778399 ?auto_778412 ) ) ( not ( = ?auto_778400 ?auto_778401 ) ) ( not ( = ?auto_778400 ?auto_778402 ) ) ( not ( = ?auto_778400 ?auto_778403 ) ) ( not ( = ?auto_778400 ?auto_778404 ) ) ( not ( = ?auto_778400 ?auto_778405 ) ) ( not ( = ?auto_778400 ?auto_778406 ) ) ( not ( = ?auto_778400 ?auto_778407 ) ) ( not ( = ?auto_778400 ?auto_778408 ) ) ( not ( = ?auto_778400 ?auto_778409 ) ) ( not ( = ?auto_778400 ?auto_778410 ) ) ( not ( = ?auto_778400 ?auto_778411 ) ) ( not ( = ?auto_778400 ?auto_778412 ) ) ( not ( = ?auto_778401 ?auto_778402 ) ) ( not ( = ?auto_778401 ?auto_778403 ) ) ( not ( = ?auto_778401 ?auto_778404 ) ) ( not ( = ?auto_778401 ?auto_778405 ) ) ( not ( = ?auto_778401 ?auto_778406 ) ) ( not ( = ?auto_778401 ?auto_778407 ) ) ( not ( = ?auto_778401 ?auto_778408 ) ) ( not ( = ?auto_778401 ?auto_778409 ) ) ( not ( = ?auto_778401 ?auto_778410 ) ) ( not ( = ?auto_778401 ?auto_778411 ) ) ( not ( = ?auto_778401 ?auto_778412 ) ) ( not ( = ?auto_778402 ?auto_778403 ) ) ( not ( = ?auto_778402 ?auto_778404 ) ) ( not ( = ?auto_778402 ?auto_778405 ) ) ( not ( = ?auto_778402 ?auto_778406 ) ) ( not ( = ?auto_778402 ?auto_778407 ) ) ( not ( = ?auto_778402 ?auto_778408 ) ) ( not ( = ?auto_778402 ?auto_778409 ) ) ( not ( = ?auto_778402 ?auto_778410 ) ) ( not ( = ?auto_778402 ?auto_778411 ) ) ( not ( = ?auto_778402 ?auto_778412 ) ) ( not ( = ?auto_778403 ?auto_778404 ) ) ( not ( = ?auto_778403 ?auto_778405 ) ) ( not ( = ?auto_778403 ?auto_778406 ) ) ( not ( = ?auto_778403 ?auto_778407 ) ) ( not ( = ?auto_778403 ?auto_778408 ) ) ( not ( = ?auto_778403 ?auto_778409 ) ) ( not ( = ?auto_778403 ?auto_778410 ) ) ( not ( = ?auto_778403 ?auto_778411 ) ) ( not ( = ?auto_778403 ?auto_778412 ) ) ( not ( = ?auto_778404 ?auto_778405 ) ) ( not ( = ?auto_778404 ?auto_778406 ) ) ( not ( = ?auto_778404 ?auto_778407 ) ) ( not ( = ?auto_778404 ?auto_778408 ) ) ( not ( = ?auto_778404 ?auto_778409 ) ) ( not ( = ?auto_778404 ?auto_778410 ) ) ( not ( = ?auto_778404 ?auto_778411 ) ) ( not ( = ?auto_778404 ?auto_778412 ) ) ( not ( = ?auto_778405 ?auto_778406 ) ) ( not ( = ?auto_778405 ?auto_778407 ) ) ( not ( = ?auto_778405 ?auto_778408 ) ) ( not ( = ?auto_778405 ?auto_778409 ) ) ( not ( = ?auto_778405 ?auto_778410 ) ) ( not ( = ?auto_778405 ?auto_778411 ) ) ( not ( = ?auto_778405 ?auto_778412 ) ) ( not ( = ?auto_778406 ?auto_778407 ) ) ( not ( = ?auto_778406 ?auto_778408 ) ) ( not ( = ?auto_778406 ?auto_778409 ) ) ( not ( = ?auto_778406 ?auto_778410 ) ) ( not ( = ?auto_778406 ?auto_778411 ) ) ( not ( = ?auto_778406 ?auto_778412 ) ) ( not ( = ?auto_778407 ?auto_778408 ) ) ( not ( = ?auto_778407 ?auto_778409 ) ) ( not ( = ?auto_778407 ?auto_778410 ) ) ( not ( = ?auto_778407 ?auto_778411 ) ) ( not ( = ?auto_778407 ?auto_778412 ) ) ( not ( = ?auto_778408 ?auto_778409 ) ) ( not ( = ?auto_778408 ?auto_778410 ) ) ( not ( = ?auto_778408 ?auto_778411 ) ) ( not ( = ?auto_778408 ?auto_778412 ) ) ( not ( = ?auto_778409 ?auto_778410 ) ) ( not ( = ?auto_778409 ?auto_778411 ) ) ( not ( = ?auto_778409 ?auto_778412 ) ) ( not ( = ?auto_778410 ?auto_778411 ) ) ( not ( = ?auto_778410 ?auto_778412 ) ) ( not ( = ?auto_778411 ?auto_778412 ) ) ( CLEAR ?auto_778409 ) ( ON ?auto_778410 ?auto_778411 ) ( CLEAR ?auto_778410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_778398 ?auto_778399 ?auto_778400 ?auto_778401 ?auto_778402 ?auto_778403 ?auto_778404 ?auto_778405 ?auto_778406 ?auto_778407 ?auto_778408 ?auto_778409 ?auto_778410 )
      ( MAKE-14PILE ?auto_778398 ?auto_778399 ?auto_778400 ?auto_778401 ?auto_778402 ?auto_778403 ?auto_778404 ?auto_778405 ?auto_778406 ?auto_778407 ?auto_778408 ?auto_778409 ?auto_778410 ?auto_778411 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_778456 - BLOCK
      ?auto_778457 - BLOCK
      ?auto_778458 - BLOCK
      ?auto_778459 - BLOCK
      ?auto_778460 - BLOCK
      ?auto_778461 - BLOCK
      ?auto_778462 - BLOCK
      ?auto_778463 - BLOCK
      ?auto_778464 - BLOCK
      ?auto_778465 - BLOCK
      ?auto_778466 - BLOCK
      ?auto_778467 - BLOCK
      ?auto_778468 - BLOCK
      ?auto_778469 - BLOCK
    )
    :vars
    (
      ?auto_778470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_778469 ?auto_778470 ) ( ON-TABLE ?auto_778456 ) ( ON ?auto_778457 ?auto_778456 ) ( ON ?auto_778458 ?auto_778457 ) ( ON ?auto_778459 ?auto_778458 ) ( ON ?auto_778460 ?auto_778459 ) ( ON ?auto_778461 ?auto_778460 ) ( ON ?auto_778462 ?auto_778461 ) ( ON ?auto_778463 ?auto_778462 ) ( ON ?auto_778464 ?auto_778463 ) ( ON ?auto_778465 ?auto_778464 ) ( ON ?auto_778466 ?auto_778465 ) ( not ( = ?auto_778456 ?auto_778457 ) ) ( not ( = ?auto_778456 ?auto_778458 ) ) ( not ( = ?auto_778456 ?auto_778459 ) ) ( not ( = ?auto_778456 ?auto_778460 ) ) ( not ( = ?auto_778456 ?auto_778461 ) ) ( not ( = ?auto_778456 ?auto_778462 ) ) ( not ( = ?auto_778456 ?auto_778463 ) ) ( not ( = ?auto_778456 ?auto_778464 ) ) ( not ( = ?auto_778456 ?auto_778465 ) ) ( not ( = ?auto_778456 ?auto_778466 ) ) ( not ( = ?auto_778456 ?auto_778467 ) ) ( not ( = ?auto_778456 ?auto_778468 ) ) ( not ( = ?auto_778456 ?auto_778469 ) ) ( not ( = ?auto_778456 ?auto_778470 ) ) ( not ( = ?auto_778457 ?auto_778458 ) ) ( not ( = ?auto_778457 ?auto_778459 ) ) ( not ( = ?auto_778457 ?auto_778460 ) ) ( not ( = ?auto_778457 ?auto_778461 ) ) ( not ( = ?auto_778457 ?auto_778462 ) ) ( not ( = ?auto_778457 ?auto_778463 ) ) ( not ( = ?auto_778457 ?auto_778464 ) ) ( not ( = ?auto_778457 ?auto_778465 ) ) ( not ( = ?auto_778457 ?auto_778466 ) ) ( not ( = ?auto_778457 ?auto_778467 ) ) ( not ( = ?auto_778457 ?auto_778468 ) ) ( not ( = ?auto_778457 ?auto_778469 ) ) ( not ( = ?auto_778457 ?auto_778470 ) ) ( not ( = ?auto_778458 ?auto_778459 ) ) ( not ( = ?auto_778458 ?auto_778460 ) ) ( not ( = ?auto_778458 ?auto_778461 ) ) ( not ( = ?auto_778458 ?auto_778462 ) ) ( not ( = ?auto_778458 ?auto_778463 ) ) ( not ( = ?auto_778458 ?auto_778464 ) ) ( not ( = ?auto_778458 ?auto_778465 ) ) ( not ( = ?auto_778458 ?auto_778466 ) ) ( not ( = ?auto_778458 ?auto_778467 ) ) ( not ( = ?auto_778458 ?auto_778468 ) ) ( not ( = ?auto_778458 ?auto_778469 ) ) ( not ( = ?auto_778458 ?auto_778470 ) ) ( not ( = ?auto_778459 ?auto_778460 ) ) ( not ( = ?auto_778459 ?auto_778461 ) ) ( not ( = ?auto_778459 ?auto_778462 ) ) ( not ( = ?auto_778459 ?auto_778463 ) ) ( not ( = ?auto_778459 ?auto_778464 ) ) ( not ( = ?auto_778459 ?auto_778465 ) ) ( not ( = ?auto_778459 ?auto_778466 ) ) ( not ( = ?auto_778459 ?auto_778467 ) ) ( not ( = ?auto_778459 ?auto_778468 ) ) ( not ( = ?auto_778459 ?auto_778469 ) ) ( not ( = ?auto_778459 ?auto_778470 ) ) ( not ( = ?auto_778460 ?auto_778461 ) ) ( not ( = ?auto_778460 ?auto_778462 ) ) ( not ( = ?auto_778460 ?auto_778463 ) ) ( not ( = ?auto_778460 ?auto_778464 ) ) ( not ( = ?auto_778460 ?auto_778465 ) ) ( not ( = ?auto_778460 ?auto_778466 ) ) ( not ( = ?auto_778460 ?auto_778467 ) ) ( not ( = ?auto_778460 ?auto_778468 ) ) ( not ( = ?auto_778460 ?auto_778469 ) ) ( not ( = ?auto_778460 ?auto_778470 ) ) ( not ( = ?auto_778461 ?auto_778462 ) ) ( not ( = ?auto_778461 ?auto_778463 ) ) ( not ( = ?auto_778461 ?auto_778464 ) ) ( not ( = ?auto_778461 ?auto_778465 ) ) ( not ( = ?auto_778461 ?auto_778466 ) ) ( not ( = ?auto_778461 ?auto_778467 ) ) ( not ( = ?auto_778461 ?auto_778468 ) ) ( not ( = ?auto_778461 ?auto_778469 ) ) ( not ( = ?auto_778461 ?auto_778470 ) ) ( not ( = ?auto_778462 ?auto_778463 ) ) ( not ( = ?auto_778462 ?auto_778464 ) ) ( not ( = ?auto_778462 ?auto_778465 ) ) ( not ( = ?auto_778462 ?auto_778466 ) ) ( not ( = ?auto_778462 ?auto_778467 ) ) ( not ( = ?auto_778462 ?auto_778468 ) ) ( not ( = ?auto_778462 ?auto_778469 ) ) ( not ( = ?auto_778462 ?auto_778470 ) ) ( not ( = ?auto_778463 ?auto_778464 ) ) ( not ( = ?auto_778463 ?auto_778465 ) ) ( not ( = ?auto_778463 ?auto_778466 ) ) ( not ( = ?auto_778463 ?auto_778467 ) ) ( not ( = ?auto_778463 ?auto_778468 ) ) ( not ( = ?auto_778463 ?auto_778469 ) ) ( not ( = ?auto_778463 ?auto_778470 ) ) ( not ( = ?auto_778464 ?auto_778465 ) ) ( not ( = ?auto_778464 ?auto_778466 ) ) ( not ( = ?auto_778464 ?auto_778467 ) ) ( not ( = ?auto_778464 ?auto_778468 ) ) ( not ( = ?auto_778464 ?auto_778469 ) ) ( not ( = ?auto_778464 ?auto_778470 ) ) ( not ( = ?auto_778465 ?auto_778466 ) ) ( not ( = ?auto_778465 ?auto_778467 ) ) ( not ( = ?auto_778465 ?auto_778468 ) ) ( not ( = ?auto_778465 ?auto_778469 ) ) ( not ( = ?auto_778465 ?auto_778470 ) ) ( not ( = ?auto_778466 ?auto_778467 ) ) ( not ( = ?auto_778466 ?auto_778468 ) ) ( not ( = ?auto_778466 ?auto_778469 ) ) ( not ( = ?auto_778466 ?auto_778470 ) ) ( not ( = ?auto_778467 ?auto_778468 ) ) ( not ( = ?auto_778467 ?auto_778469 ) ) ( not ( = ?auto_778467 ?auto_778470 ) ) ( not ( = ?auto_778468 ?auto_778469 ) ) ( not ( = ?auto_778468 ?auto_778470 ) ) ( not ( = ?auto_778469 ?auto_778470 ) ) ( ON ?auto_778468 ?auto_778469 ) ( CLEAR ?auto_778466 ) ( ON ?auto_778467 ?auto_778468 ) ( CLEAR ?auto_778467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_778456 ?auto_778457 ?auto_778458 ?auto_778459 ?auto_778460 ?auto_778461 ?auto_778462 ?auto_778463 ?auto_778464 ?auto_778465 ?auto_778466 ?auto_778467 )
      ( MAKE-14PILE ?auto_778456 ?auto_778457 ?auto_778458 ?auto_778459 ?auto_778460 ?auto_778461 ?auto_778462 ?auto_778463 ?auto_778464 ?auto_778465 ?auto_778466 ?auto_778467 ?auto_778468 ?auto_778469 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_778514 - BLOCK
      ?auto_778515 - BLOCK
      ?auto_778516 - BLOCK
      ?auto_778517 - BLOCK
      ?auto_778518 - BLOCK
      ?auto_778519 - BLOCK
      ?auto_778520 - BLOCK
      ?auto_778521 - BLOCK
      ?auto_778522 - BLOCK
      ?auto_778523 - BLOCK
      ?auto_778524 - BLOCK
      ?auto_778525 - BLOCK
      ?auto_778526 - BLOCK
      ?auto_778527 - BLOCK
    )
    :vars
    (
      ?auto_778528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_778527 ?auto_778528 ) ( ON-TABLE ?auto_778514 ) ( ON ?auto_778515 ?auto_778514 ) ( ON ?auto_778516 ?auto_778515 ) ( ON ?auto_778517 ?auto_778516 ) ( ON ?auto_778518 ?auto_778517 ) ( ON ?auto_778519 ?auto_778518 ) ( ON ?auto_778520 ?auto_778519 ) ( ON ?auto_778521 ?auto_778520 ) ( ON ?auto_778522 ?auto_778521 ) ( ON ?auto_778523 ?auto_778522 ) ( not ( = ?auto_778514 ?auto_778515 ) ) ( not ( = ?auto_778514 ?auto_778516 ) ) ( not ( = ?auto_778514 ?auto_778517 ) ) ( not ( = ?auto_778514 ?auto_778518 ) ) ( not ( = ?auto_778514 ?auto_778519 ) ) ( not ( = ?auto_778514 ?auto_778520 ) ) ( not ( = ?auto_778514 ?auto_778521 ) ) ( not ( = ?auto_778514 ?auto_778522 ) ) ( not ( = ?auto_778514 ?auto_778523 ) ) ( not ( = ?auto_778514 ?auto_778524 ) ) ( not ( = ?auto_778514 ?auto_778525 ) ) ( not ( = ?auto_778514 ?auto_778526 ) ) ( not ( = ?auto_778514 ?auto_778527 ) ) ( not ( = ?auto_778514 ?auto_778528 ) ) ( not ( = ?auto_778515 ?auto_778516 ) ) ( not ( = ?auto_778515 ?auto_778517 ) ) ( not ( = ?auto_778515 ?auto_778518 ) ) ( not ( = ?auto_778515 ?auto_778519 ) ) ( not ( = ?auto_778515 ?auto_778520 ) ) ( not ( = ?auto_778515 ?auto_778521 ) ) ( not ( = ?auto_778515 ?auto_778522 ) ) ( not ( = ?auto_778515 ?auto_778523 ) ) ( not ( = ?auto_778515 ?auto_778524 ) ) ( not ( = ?auto_778515 ?auto_778525 ) ) ( not ( = ?auto_778515 ?auto_778526 ) ) ( not ( = ?auto_778515 ?auto_778527 ) ) ( not ( = ?auto_778515 ?auto_778528 ) ) ( not ( = ?auto_778516 ?auto_778517 ) ) ( not ( = ?auto_778516 ?auto_778518 ) ) ( not ( = ?auto_778516 ?auto_778519 ) ) ( not ( = ?auto_778516 ?auto_778520 ) ) ( not ( = ?auto_778516 ?auto_778521 ) ) ( not ( = ?auto_778516 ?auto_778522 ) ) ( not ( = ?auto_778516 ?auto_778523 ) ) ( not ( = ?auto_778516 ?auto_778524 ) ) ( not ( = ?auto_778516 ?auto_778525 ) ) ( not ( = ?auto_778516 ?auto_778526 ) ) ( not ( = ?auto_778516 ?auto_778527 ) ) ( not ( = ?auto_778516 ?auto_778528 ) ) ( not ( = ?auto_778517 ?auto_778518 ) ) ( not ( = ?auto_778517 ?auto_778519 ) ) ( not ( = ?auto_778517 ?auto_778520 ) ) ( not ( = ?auto_778517 ?auto_778521 ) ) ( not ( = ?auto_778517 ?auto_778522 ) ) ( not ( = ?auto_778517 ?auto_778523 ) ) ( not ( = ?auto_778517 ?auto_778524 ) ) ( not ( = ?auto_778517 ?auto_778525 ) ) ( not ( = ?auto_778517 ?auto_778526 ) ) ( not ( = ?auto_778517 ?auto_778527 ) ) ( not ( = ?auto_778517 ?auto_778528 ) ) ( not ( = ?auto_778518 ?auto_778519 ) ) ( not ( = ?auto_778518 ?auto_778520 ) ) ( not ( = ?auto_778518 ?auto_778521 ) ) ( not ( = ?auto_778518 ?auto_778522 ) ) ( not ( = ?auto_778518 ?auto_778523 ) ) ( not ( = ?auto_778518 ?auto_778524 ) ) ( not ( = ?auto_778518 ?auto_778525 ) ) ( not ( = ?auto_778518 ?auto_778526 ) ) ( not ( = ?auto_778518 ?auto_778527 ) ) ( not ( = ?auto_778518 ?auto_778528 ) ) ( not ( = ?auto_778519 ?auto_778520 ) ) ( not ( = ?auto_778519 ?auto_778521 ) ) ( not ( = ?auto_778519 ?auto_778522 ) ) ( not ( = ?auto_778519 ?auto_778523 ) ) ( not ( = ?auto_778519 ?auto_778524 ) ) ( not ( = ?auto_778519 ?auto_778525 ) ) ( not ( = ?auto_778519 ?auto_778526 ) ) ( not ( = ?auto_778519 ?auto_778527 ) ) ( not ( = ?auto_778519 ?auto_778528 ) ) ( not ( = ?auto_778520 ?auto_778521 ) ) ( not ( = ?auto_778520 ?auto_778522 ) ) ( not ( = ?auto_778520 ?auto_778523 ) ) ( not ( = ?auto_778520 ?auto_778524 ) ) ( not ( = ?auto_778520 ?auto_778525 ) ) ( not ( = ?auto_778520 ?auto_778526 ) ) ( not ( = ?auto_778520 ?auto_778527 ) ) ( not ( = ?auto_778520 ?auto_778528 ) ) ( not ( = ?auto_778521 ?auto_778522 ) ) ( not ( = ?auto_778521 ?auto_778523 ) ) ( not ( = ?auto_778521 ?auto_778524 ) ) ( not ( = ?auto_778521 ?auto_778525 ) ) ( not ( = ?auto_778521 ?auto_778526 ) ) ( not ( = ?auto_778521 ?auto_778527 ) ) ( not ( = ?auto_778521 ?auto_778528 ) ) ( not ( = ?auto_778522 ?auto_778523 ) ) ( not ( = ?auto_778522 ?auto_778524 ) ) ( not ( = ?auto_778522 ?auto_778525 ) ) ( not ( = ?auto_778522 ?auto_778526 ) ) ( not ( = ?auto_778522 ?auto_778527 ) ) ( not ( = ?auto_778522 ?auto_778528 ) ) ( not ( = ?auto_778523 ?auto_778524 ) ) ( not ( = ?auto_778523 ?auto_778525 ) ) ( not ( = ?auto_778523 ?auto_778526 ) ) ( not ( = ?auto_778523 ?auto_778527 ) ) ( not ( = ?auto_778523 ?auto_778528 ) ) ( not ( = ?auto_778524 ?auto_778525 ) ) ( not ( = ?auto_778524 ?auto_778526 ) ) ( not ( = ?auto_778524 ?auto_778527 ) ) ( not ( = ?auto_778524 ?auto_778528 ) ) ( not ( = ?auto_778525 ?auto_778526 ) ) ( not ( = ?auto_778525 ?auto_778527 ) ) ( not ( = ?auto_778525 ?auto_778528 ) ) ( not ( = ?auto_778526 ?auto_778527 ) ) ( not ( = ?auto_778526 ?auto_778528 ) ) ( not ( = ?auto_778527 ?auto_778528 ) ) ( ON ?auto_778526 ?auto_778527 ) ( ON ?auto_778525 ?auto_778526 ) ( CLEAR ?auto_778523 ) ( ON ?auto_778524 ?auto_778525 ) ( CLEAR ?auto_778524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_778514 ?auto_778515 ?auto_778516 ?auto_778517 ?auto_778518 ?auto_778519 ?auto_778520 ?auto_778521 ?auto_778522 ?auto_778523 ?auto_778524 )
      ( MAKE-14PILE ?auto_778514 ?auto_778515 ?auto_778516 ?auto_778517 ?auto_778518 ?auto_778519 ?auto_778520 ?auto_778521 ?auto_778522 ?auto_778523 ?auto_778524 ?auto_778525 ?auto_778526 ?auto_778527 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_778572 - BLOCK
      ?auto_778573 - BLOCK
      ?auto_778574 - BLOCK
      ?auto_778575 - BLOCK
      ?auto_778576 - BLOCK
      ?auto_778577 - BLOCK
      ?auto_778578 - BLOCK
      ?auto_778579 - BLOCK
      ?auto_778580 - BLOCK
      ?auto_778581 - BLOCK
      ?auto_778582 - BLOCK
      ?auto_778583 - BLOCK
      ?auto_778584 - BLOCK
      ?auto_778585 - BLOCK
    )
    :vars
    (
      ?auto_778586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_778585 ?auto_778586 ) ( ON-TABLE ?auto_778572 ) ( ON ?auto_778573 ?auto_778572 ) ( ON ?auto_778574 ?auto_778573 ) ( ON ?auto_778575 ?auto_778574 ) ( ON ?auto_778576 ?auto_778575 ) ( ON ?auto_778577 ?auto_778576 ) ( ON ?auto_778578 ?auto_778577 ) ( ON ?auto_778579 ?auto_778578 ) ( ON ?auto_778580 ?auto_778579 ) ( not ( = ?auto_778572 ?auto_778573 ) ) ( not ( = ?auto_778572 ?auto_778574 ) ) ( not ( = ?auto_778572 ?auto_778575 ) ) ( not ( = ?auto_778572 ?auto_778576 ) ) ( not ( = ?auto_778572 ?auto_778577 ) ) ( not ( = ?auto_778572 ?auto_778578 ) ) ( not ( = ?auto_778572 ?auto_778579 ) ) ( not ( = ?auto_778572 ?auto_778580 ) ) ( not ( = ?auto_778572 ?auto_778581 ) ) ( not ( = ?auto_778572 ?auto_778582 ) ) ( not ( = ?auto_778572 ?auto_778583 ) ) ( not ( = ?auto_778572 ?auto_778584 ) ) ( not ( = ?auto_778572 ?auto_778585 ) ) ( not ( = ?auto_778572 ?auto_778586 ) ) ( not ( = ?auto_778573 ?auto_778574 ) ) ( not ( = ?auto_778573 ?auto_778575 ) ) ( not ( = ?auto_778573 ?auto_778576 ) ) ( not ( = ?auto_778573 ?auto_778577 ) ) ( not ( = ?auto_778573 ?auto_778578 ) ) ( not ( = ?auto_778573 ?auto_778579 ) ) ( not ( = ?auto_778573 ?auto_778580 ) ) ( not ( = ?auto_778573 ?auto_778581 ) ) ( not ( = ?auto_778573 ?auto_778582 ) ) ( not ( = ?auto_778573 ?auto_778583 ) ) ( not ( = ?auto_778573 ?auto_778584 ) ) ( not ( = ?auto_778573 ?auto_778585 ) ) ( not ( = ?auto_778573 ?auto_778586 ) ) ( not ( = ?auto_778574 ?auto_778575 ) ) ( not ( = ?auto_778574 ?auto_778576 ) ) ( not ( = ?auto_778574 ?auto_778577 ) ) ( not ( = ?auto_778574 ?auto_778578 ) ) ( not ( = ?auto_778574 ?auto_778579 ) ) ( not ( = ?auto_778574 ?auto_778580 ) ) ( not ( = ?auto_778574 ?auto_778581 ) ) ( not ( = ?auto_778574 ?auto_778582 ) ) ( not ( = ?auto_778574 ?auto_778583 ) ) ( not ( = ?auto_778574 ?auto_778584 ) ) ( not ( = ?auto_778574 ?auto_778585 ) ) ( not ( = ?auto_778574 ?auto_778586 ) ) ( not ( = ?auto_778575 ?auto_778576 ) ) ( not ( = ?auto_778575 ?auto_778577 ) ) ( not ( = ?auto_778575 ?auto_778578 ) ) ( not ( = ?auto_778575 ?auto_778579 ) ) ( not ( = ?auto_778575 ?auto_778580 ) ) ( not ( = ?auto_778575 ?auto_778581 ) ) ( not ( = ?auto_778575 ?auto_778582 ) ) ( not ( = ?auto_778575 ?auto_778583 ) ) ( not ( = ?auto_778575 ?auto_778584 ) ) ( not ( = ?auto_778575 ?auto_778585 ) ) ( not ( = ?auto_778575 ?auto_778586 ) ) ( not ( = ?auto_778576 ?auto_778577 ) ) ( not ( = ?auto_778576 ?auto_778578 ) ) ( not ( = ?auto_778576 ?auto_778579 ) ) ( not ( = ?auto_778576 ?auto_778580 ) ) ( not ( = ?auto_778576 ?auto_778581 ) ) ( not ( = ?auto_778576 ?auto_778582 ) ) ( not ( = ?auto_778576 ?auto_778583 ) ) ( not ( = ?auto_778576 ?auto_778584 ) ) ( not ( = ?auto_778576 ?auto_778585 ) ) ( not ( = ?auto_778576 ?auto_778586 ) ) ( not ( = ?auto_778577 ?auto_778578 ) ) ( not ( = ?auto_778577 ?auto_778579 ) ) ( not ( = ?auto_778577 ?auto_778580 ) ) ( not ( = ?auto_778577 ?auto_778581 ) ) ( not ( = ?auto_778577 ?auto_778582 ) ) ( not ( = ?auto_778577 ?auto_778583 ) ) ( not ( = ?auto_778577 ?auto_778584 ) ) ( not ( = ?auto_778577 ?auto_778585 ) ) ( not ( = ?auto_778577 ?auto_778586 ) ) ( not ( = ?auto_778578 ?auto_778579 ) ) ( not ( = ?auto_778578 ?auto_778580 ) ) ( not ( = ?auto_778578 ?auto_778581 ) ) ( not ( = ?auto_778578 ?auto_778582 ) ) ( not ( = ?auto_778578 ?auto_778583 ) ) ( not ( = ?auto_778578 ?auto_778584 ) ) ( not ( = ?auto_778578 ?auto_778585 ) ) ( not ( = ?auto_778578 ?auto_778586 ) ) ( not ( = ?auto_778579 ?auto_778580 ) ) ( not ( = ?auto_778579 ?auto_778581 ) ) ( not ( = ?auto_778579 ?auto_778582 ) ) ( not ( = ?auto_778579 ?auto_778583 ) ) ( not ( = ?auto_778579 ?auto_778584 ) ) ( not ( = ?auto_778579 ?auto_778585 ) ) ( not ( = ?auto_778579 ?auto_778586 ) ) ( not ( = ?auto_778580 ?auto_778581 ) ) ( not ( = ?auto_778580 ?auto_778582 ) ) ( not ( = ?auto_778580 ?auto_778583 ) ) ( not ( = ?auto_778580 ?auto_778584 ) ) ( not ( = ?auto_778580 ?auto_778585 ) ) ( not ( = ?auto_778580 ?auto_778586 ) ) ( not ( = ?auto_778581 ?auto_778582 ) ) ( not ( = ?auto_778581 ?auto_778583 ) ) ( not ( = ?auto_778581 ?auto_778584 ) ) ( not ( = ?auto_778581 ?auto_778585 ) ) ( not ( = ?auto_778581 ?auto_778586 ) ) ( not ( = ?auto_778582 ?auto_778583 ) ) ( not ( = ?auto_778582 ?auto_778584 ) ) ( not ( = ?auto_778582 ?auto_778585 ) ) ( not ( = ?auto_778582 ?auto_778586 ) ) ( not ( = ?auto_778583 ?auto_778584 ) ) ( not ( = ?auto_778583 ?auto_778585 ) ) ( not ( = ?auto_778583 ?auto_778586 ) ) ( not ( = ?auto_778584 ?auto_778585 ) ) ( not ( = ?auto_778584 ?auto_778586 ) ) ( not ( = ?auto_778585 ?auto_778586 ) ) ( ON ?auto_778584 ?auto_778585 ) ( ON ?auto_778583 ?auto_778584 ) ( ON ?auto_778582 ?auto_778583 ) ( CLEAR ?auto_778580 ) ( ON ?auto_778581 ?auto_778582 ) ( CLEAR ?auto_778581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_778572 ?auto_778573 ?auto_778574 ?auto_778575 ?auto_778576 ?auto_778577 ?auto_778578 ?auto_778579 ?auto_778580 ?auto_778581 )
      ( MAKE-14PILE ?auto_778572 ?auto_778573 ?auto_778574 ?auto_778575 ?auto_778576 ?auto_778577 ?auto_778578 ?auto_778579 ?auto_778580 ?auto_778581 ?auto_778582 ?auto_778583 ?auto_778584 ?auto_778585 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_778630 - BLOCK
      ?auto_778631 - BLOCK
      ?auto_778632 - BLOCK
      ?auto_778633 - BLOCK
      ?auto_778634 - BLOCK
      ?auto_778635 - BLOCK
      ?auto_778636 - BLOCK
      ?auto_778637 - BLOCK
      ?auto_778638 - BLOCK
      ?auto_778639 - BLOCK
      ?auto_778640 - BLOCK
      ?auto_778641 - BLOCK
      ?auto_778642 - BLOCK
      ?auto_778643 - BLOCK
    )
    :vars
    (
      ?auto_778644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_778643 ?auto_778644 ) ( ON-TABLE ?auto_778630 ) ( ON ?auto_778631 ?auto_778630 ) ( ON ?auto_778632 ?auto_778631 ) ( ON ?auto_778633 ?auto_778632 ) ( ON ?auto_778634 ?auto_778633 ) ( ON ?auto_778635 ?auto_778634 ) ( ON ?auto_778636 ?auto_778635 ) ( ON ?auto_778637 ?auto_778636 ) ( not ( = ?auto_778630 ?auto_778631 ) ) ( not ( = ?auto_778630 ?auto_778632 ) ) ( not ( = ?auto_778630 ?auto_778633 ) ) ( not ( = ?auto_778630 ?auto_778634 ) ) ( not ( = ?auto_778630 ?auto_778635 ) ) ( not ( = ?auto_778630 ?auto_778636 ) ) ( not ( = ?auto_778630 ?auto_778637 ) ) ( not ( = ?auto_778630 ?auto_778638 ) ) ( not ( = ?auto_778630 ?auto_778639 ) ) ( not ( = ?auto_778630 ?auto_778640 ) ) ( not ( = ?auto_778630 ?auto_778641 ) ) ( not ( = ?auto_778630 ?auto_778642 ) ) ( not ( = ?auto_778630 ?auto_778643 ) ) ( not ( = ?auto_778630 ?auto_778644 ) ) ( not ( = ?auto_778631 ?auto_778632 ) ) ( not ( = ?auto_778631 ?auto_778633 ) ) ( not ( = ?auto_778631 ?auto_778634 ) ) ( not ( = ?auto_778631 ?auto_778635 ) ) ( not ( = ?auto_778631 ?auto_778636 ) ) ( not ( = ?auto_778631 ?auto_778637 ) ) ( not ( = ?auto_778631 ?auto_778638 ) ) ( not ( = ?auto_778631 ?auto_778639 ) ) ( not ( = ?auto_778631 ?auto_778640 ) ) ( not ( = ?auto_778631 ?auto_778641 ) ) ( not ( = ?auto_778631 ?auto_778642 ) ) ( not ( = ?auto_778631 ?auto_778643 ) ) ( not ( = ?auto_778631 ?auto_778644 ) ) ( not ( = ?auto_778632 ?auto_778633 ) ) ( not ( = ?auto_778632 ?auto_778634 ) ) ( not ( = ?auto_778632 ?auto_778635 ) ) ( not ( = ?auto_778632 ?auto_778636 ) ) ( not ( = ?auto_778632 ?auto_778637 ) ) ( not ( = ?auto_778632 ?auto_778638 ) ) ( not ( = ?auto_778632 ?auto_778639 ) ) ( not ( = ?auto_778632 ?auto_778640 ) ) ( not ( = ?auto_778632 ?auto_778641 ) ) ( not ( = ?auto_778632 ?auto_778642 ) ) ( not ( = ?auto_778632 ?auto_778643 ) ) ( not ( = ?auto_778632 ?auto_778644 ) ) ( not ( = ?auto_778633 ?auto_778634 ) ) ( not ( = ?auto_778633 ?auto_778635 ) ) ( not ( = ?auto_778633 ?auto_778636 ) ) ( not ( = ?auto_778633 ?auto_778637 ) ) ( not ( = ?auto_778633 ?auto_778638 ) ) ( not ( = ?auto_778633 ?auto_778639 ) ) ( not ( = ?auto_778633 ?auto_778640 ) ) ( not ( = ?auto_778633 ?auto_778641 ) ) ( not ( = ?auto_778633 ?auto_778642 ) ) ( not ( = ?auto_778633 ?auto_778643 ) ) ( not ( = ?auto_778633 ?auto_778644 ) ) ( not ( = ?auto_778634 ?auto_778635 ) ) ( not ( = ?auto_778634 ?auto_778636 ) ) ( not ( = ?auto_778634 ?auto_778637 ) ) ( not ( = ?auto_778634 ?auto_778638 ) ) ( not ( = ?auto_778634 ?auto_778639 ) ) ( not ( = ?auto_778634 ?auto_778640 ) ) ( not ( = ?auto_778634 ?auto_778641 ) ) ( not ( = ?auto_778634 ?auto_778642 ) ) ( not ( = ?auto_778634 ?auto_778643 ) ) ( not ( = ?auto_778634 ?auto_778644 ) ) ( not ( = ?auto_778635 ?auto_778636 ) ) ( not ( = ?auto_778635 ?auto_778637 ) ) ( not ( = ?auto_778635 ?auto_778638 ) ) ( not ( = ?auto_778635 ?auto_778639 ) ) ( not ( = ?auto_778635 ?auto_778640 ) ) ( not ( = ?auto_778635 ?auto_778641 ) ) ( not ( = ?auto_778635 ?auto_778642 ) ) ( not ( = ?auto_778635 ?auto_778643 ) ) ( not ( = ?auto_778635 ?auto_778644 ) ) ( not ( = ?auto_778636 ?auto_778637 ) ) ( not ( = ?auto_778636 ?auto_778638 ) ) ( not ( = ?auto_778636 ?auto_778639 ) ) ( not ( = ?auto_778636 ?auto_778640 ) ) ( not ( = ?auto_778636 ?auto_778641 ) ) ( not ( = ?auto_778636 ?auto_778642 ) ) ( not ( = ?auto_778636 ?auto_778643 ) ) ( not ( = ?auto_778636 ?auto_778644 ) ) ( not ( = ?auto_778637 ?auto_778638 ) ) ( not ( = ?auto_778637 ?auto_778639 ) ) ( not ( = ?auto_778637 ?auto_778640 ) ) ( not ( = ?auto_778637 ?auto_778641 ) ) ( not ( = ?auto_778637 ?auto_778642 ) ) ( not ( = ?auto_778637 ?auto_778643 ) ) ( not ( = ?auto_778637 ?auto_778644 ) ) ( not ( = ?auto_778638 ?auto_778639 ) ) ( not ( = ?auto_778638 ?auto_778640 ) ) ( not ( = ?auto_778638 ?auto_778641 ) ) ( not ( = ?auto_778638 ?auto_778642 ) ) ( not ( = ?auto_778638 ?auto_778643 ) ) ( not ( = ?auto_778638 ?auto_778644 ) ) ( not ( = ?auto_778639 ?auto_778640 ) ) ( not ( = ?auto_778639 ?auto_778641 ) ) ( not ( = ?auto_778639 ?auto_778642 ) ) ( not ( = ?auto_778639 ?auto_778643 ) ) ( not ( = ?auto_778639 ?auto_778644 ) ) ( not ( = ?auto_778640 ?auto_778641 ) ) ( not ( = ?auto_778640 ?auto_778642 ) ) ( not ( = ?auto_778640 ?auto_778643 ) ) ( not ( = ?auto_778640 ?auto_778644 ) ) ( not ( = ?auto_778641 ?auto_778642 ) ) ( not ( = ?auto_778641 ?auto_778643 ) ) ( not ( = ?auto_778641 ?auto_778644 ) ) ( not ( = ?auto_778642 ?auto_778643 ) ) ( not ( = ?auto_778642 ?auto_778644 ) ) ( not ( = ?auto_778643 ?auto_778644 ) ) ( ON ?auto_778642 ?auto_778643 ) ( ON ?auto_778641 ?auto_778642 ) ( ON ?auto_778640 ?auto_778641 ) ( ON ?auto_778639 ?auto_778640 ) ( CLEAR ?auto_778637 ) ( ON ?auto_778638 ?auto_778639 ) ( CLEAR ?auto_778638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_778630 ?auto_778631 ?auto_778632 ?auto_778633 ?auto_778634 ?auto_778635 ?auto_778636 ?auto_778637 ?auto_778638 )
      ( MAKE-14PILE ?auto_778630 ?auto_778631 ?auto_778632 ?auto_778633 ?auto_778634 ?auto_778635 ?auto_778636 ?auto_778637 ?auto_778638 ?auto_778639 ?auto_778640 ?auto_778641 ?auto_778642 ?auto_778643 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_778688 - BLOCK
      ?auto_778689 - BLOCK
      ?auto_778690 - BLOCK
      ?auto_778691 - BLOCK
      ?auto_778692 - BLOCK
      ?auto_778693 - BLOCK
      ?auto_778694 - BLOCK
      ?auto_778695 - BLOCK
      ?auto_778696 - BLOCK
      ?auto_778697 - BLOCK
      ?auto_778698 - BLOCK
      ?auto_778699 - BLOCK
      ?auto_778700 - BLOCK
      ?auto_778701 - BLOCK
    )
    :vars
    (
      ?auto_778702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_778701 ?auto_778702 ) ( ON-TABLE ?auto_778688 ) ( ON ?auto_778689 ?auto_778688 ) ( ON ?auto_778690 ?auto_778689 ) ( ON ?auto_778691 ?auto_778690 ) ( ON ?auto_778692 ?auto_778691 ) ( ON ?auto_778693 ?auto_778692 ) ( ON ?auto_778694 ?auto_778693 ) ( not ( = ?auto_778688 ?auto_778689 ) ) ( not ( = ?auto_778688 ?auto_778690 ) ) ( not ( = ?auto_778688 ?auto_778691 ) ) ( not ( = ?auto_778688 ?auto_778692 ) ) ( not ( = ?auto_778688 ?auto_778693 ) ) ( not ( = ?auto_778688 ?auto_778694 ) ) ( not ( = ?auto_778688 ?auto_778695 ) ) ( not ( = ?auto_778688 ?auto_778696 ) ) ( not ( = ?auto_778688 ?auto_778697 ) ) ( not ( = ?auto_778688 ?auto_778698 ) ) ( not ( = ?auto_778688 ?auto_778699 ) ) ( not ( = ?auto_778688 ?auto_778700 ) ) ( not ( = ?auto_778688 ?auto_778701 ) ) ( not ( = ?auto_778688 ?auto_778702 ) ) ( not ( = ?auto_778689 ?auto_778690 ) ) ( not ( = ?auto_778689 ?auto_778691 ) ) ( not ( = ?auto_778689 ?auto_778692 ) ) ( not ( = ?auto_778689 ?auto_778693 ) ) ( not ( = ?auto_778689 ?auto_778694 ) ) ( not ( = ?auto_778689 ?auto_778695 ) ) ( not ( = ?auto_778689 ?auto_778696 ) ) ( not ( = ?auto_778689 ?auto_778697 ) ) ( not ( = ?auto_778689 ?auto_778698 ) ) ( not ( = ?auto_778689 ?auto_778699 ) ) ( not ( = ?auto_778689 ?auto_778700 ) ) ( not ( = ?auto_778689 ?auto_778701 ) ) ( not ( = ?auto_778689 ?auto_778702 ) ) ( not ( = ?auto_778690 ?auto_778691 ) ) ( not ( = ?auto_778690 ?auto_778692 ) ) ( not ( = ?auto_778690 ?auto_778693 ) ) ( not ( = ?auto_778690 ?auto_778694 ) ) ( not ( = ?auto_778690 ?auto_778695 ) ) ( not ( = ?auto_778690 ?auto_778696 ) ) ( not ( = ?auto_778690 ?auto_778697 ) ) ( not ( = ?auto_778690 ?auto_778698 ) ) ( not ( = ?auto_778690 ?auto_778699 ) ) ( not ( = ?auto_778690 ?auto_778700 ) ) ( not ( = ?auto_778690 ?auto_778701 ) ) ( not ( = ?auto_778690 ?auto_778702 ) ) ( not ( = ?auto_778691 ?auto_778692 ) ) ( not ( = ?auto_778691 ?auto_778693 ) ) ( not ( = ?auto_778691 ?auto_778694 ) ) ( not ( = ?auto_778691 ?auto_778695 ) ) ( not ( = ?auto_778691 ?auto_778696 ) ) ( not ( = ?auto_778691 ?auto_778697 ) ) ( not ( = ?auto_778691 ?auto_778698 ) ) ( not ( = ?auto_778691 ?auto_778699 ) ) ( not ( = ?auto_778691 ?auto_778700 ) ) ( not ( = ?auto_778691 ?auto_778701 ) ) ( not ( = ?auto_778691 ?auto_778702 ) ) ( not ( = ?auto_778692 ?auto_778693 ) ) ( not ( = ?auto_778692 ?auto_778694 ) ) ( not ( = ?auto_778692 ?auto_778695 ) ) ( not ( = ?auto_778692 ?auto_778696 ) ) ( not ( = ?auto_778692 ?auto_778697 ) ) ( not ( = ?auto_778692 ?auto_778698 ) ) ( not ( = ?auto_778692 ?auto_778699 ) ) ( not ( = ?auto_778692 ?auto_778700 ) ) ( not ( = ?auto_778692 ?auto_778701 ) ) ( not ( = ?auto_778692 ?auto_778702 ) ) ( not ( = ?auto_778693 ?auto_778694 ) ) ( not ( = ?auto_778693 ?auto_778695 ) ) ( not ( = ?auto_778693 ?auto_778696 ) ) ( not ( = ?auto_778693 ?auto_778697 ) ) ( not ( = ?auto_778693 ?auto_778698 ) ) ( not ( = ?auto_778693 ?auto_778699 ) ) ( not ( = ?auto_778693 ?auto_778700 ) ) ( not ( = ?auto_778693 ?auto_778701 ) ) ( not ( = ?auto_778693 ?auto_778702 ) ) ( not ( = ?auto_778694 ?auto_778695 ) ) ( not ( = ?auto_778694 ?auto_778696 ) ) ( not ( = ?auto_778694 ?auto_778697 ) ) ( not ( = ?auto_778694 ?auto_778698 ) ) ( not ( = ?auto_778694 ?auto_778699 ) ) ( not ( = ?auto_778694 ?auto_778700 ) ) ( not ( = ?auto_778694 ?auto_778701 ) ) ( not ( = ?auto_778694 ?auto_778702 ) ) ( not ( = ?auto_778695 ?auto_778696 ) ) ( not ( = ?auto_778695 ?auto_778697 ) ) ( not ( = ?auto_778695 ?auto_778698 ) ) ( not ( = ?auto_778695 ?auto_778699 ) ) ( not ( = ?auto_778695 ?auto_778700 ) ) ( not ( = ?auto_778695 ?auto_778701 ) ) ( not ( = ?auto_778695 ?auto_778702 ) ) ( not ( = ?auto_778696 ?auto_778697 ) ) ( not ( = ?auto_778696 ?auto_778698 ) ) ( not ( = ?auto_778696 ?auto_778699 ) ) ( not ( = ?auto_778696 ?auto_778700 ) ) ( not ( = ?auto_778696 ?auto_778701 ) ) ( not ( = ?auto_778696 ?auto_778702 ) ) ( not ( = ?auto_778697 ?auto_778698 ) ) ( not ( = ?auto_778697 ?auto_778699 ) ) ( not ( = ?auto_778697 ?auto_778700 ) ) ( not ( = ?auto_778697 ?auto_778701 ) ) ( not ( = ?auto_778697 ?auto_778702 ) ) ( not ( = ?auto_778698 ?auto_778699 ) ) ( not ( = ?auto_778698 ?auto_778700 ) ) ( not ( = ?auto_778698 ?auto_778701 ) ) ( not ( = ?auto_778698 ?auto_778702 ) ) ( not ( = ?auto_778699 ?auto_778700 ) ) ( not ( = ?auto_778699 ?auto_778701 ) ) ( not ( = ?auto_778699 ?auto_778702 ) ) ( not ( = ?auto_778700 ?auto_778701 ) ) ( not ( = ?auto_778700 ?auto_778702 ) ) ( not ( = ?auto_778701 ?auto_778702 ) ) ( ON ?auto_778700 ?auto_778701 ) ( ON ?auto_778699 ?auto_778700 ) ( ON ?auto_778698 ?auto_778699 ) ( ON ?auto_778697 ?auto_778698 ) ( ON ?auto_778696 ?auto_778697 ) ( CLEAR ?auto_778694 ) ( ON ?auto_778695 ?auto_778696 ) ( CLEAR ?auto_778695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_778688 ?auto_778689 ?auto_778690 ?auto_778691 ?auto_778692 ?auto_778693 ?auto_778694 ?auto_778695 )
      ( MAKE-14PILE ?auto_778688 ?auto_778689 ?auto_778690 ?auto_778691 ?auto_778692 ?auto_778693 ?auto_778694 ?auto_778695 ?auto_778696 ?auto_778697 ?auto_778698 ?auto_778699 ?auto_778700 ?auto_778701 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_778746 - BLOCK
      ?auto_778747 - BLOCK
      ?auto_778748 - BLOCK
      ?auto_778749 - BLOCK
      ?auto_778750 - BLOCK
      ?auto_778751 - BLOCK
      ?auto_778752 - BLOCK
      ?auto_778753 - BLOCK
      ?auto_778754 - BLOCK
      ?auto_778755 - BLOCK
      ?auto_778756 - BLOCK
      ?auto_778757 - BLOCK
      ?auto_778758 - BLOCK
      ?auto_778759 - BLOCK
    )
    :vars
    (
      ?auto_778760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_778759 ?auto_778760 ) ( ON-TABLE ?auto_778746 ) ( ON ?auto_778747 ?auto_778746 ) ( ON ?auto_778748 ?auto_778747 ) ( ON ?auto_778749 ?auto_778748 ) ( ON ?auto_778750 ?auto_778749 ) ( ON ?auto_778751 ?auto_778750 ) ( not ( = ?auto_778746 ?auto_778747 ) ) ( not ( = ?auto_778746 ?auto_778748 ) ) ( not ( = ?auto_778746 ?auto_778749 ) ) ( not ( = ?auto_778746 ?auto_778750 ) ) ( not ( = ?auto_778746 ?auto_778751 ) ) ( not ( = ?auto_778746 ?auto_778752 ) ) ( not ( = ?auto_778746 ?auto_778753 ) ) ( not ( = ?auto_778746 ?auto_778754 ) ) ( not ( = ?auto_778746 ?auto_778755 ) ) ( not ( = ?auto_778746 ?auto_778756 ) ) ( not ( = ?auto_778746 ?auto_778757 ) ) ( not ( = ?auto_778746 ?auto_778758 ) ) ( not ( = ?auto_778746 ?auto_778759 ) ) ( not ( = ?auto_778746 ?auto_778760 ) ) ( not ( = ?auto_778747 ?auto_778748 ) ) ( not ( = ?auto_778747 ?auto_778749 ) ) ( not ( = ?auto_778747 ?auto_778750 ) ) ( not ( = ?auto_778747 ?auto_778751 ) ) ( not ( = ?auto_778747 ?auto_778752 ) ) ( not ( = ?auto_778747 ?auto_778753 ) ) ( not ( = ?auto_778747 ?auto_778754 ) ) ( not ( = ?auto_778747 ?auto_778755 ) ) ( not ( = ?auto_778747 ?auto_778756 ) ) ( not ( = ?auto_778747 ?auto_778757 ) ) ( not ( = ?auto_778747 ?auto_778758 ) ) ( not ( = ?auto_778747 ?auto_778759 ) ) ( not ( = ?auto_778747 ?auto_778760 ) ) ( not ( = ?auto_778748 ?auto_778749 ) ) ( not ( = ?auto_778748 ?auto_778750 ) ) ( not ( = ?auto_778748 ?auto_778751 ) ) ( not ( = ?auto_778748 ?auto_778752 ) ) ( not ( = ?auto_778748 ?auto_778753 ) ) ( not ( = ?auto_778748 ?auto_778754 ) ) ( not ( = ?auto_778748 ?auto_778755 ) ) ( not ( = ?auto_778748 ?auto_778756 ) ) ( not ( = ?auto_778748 ?auto_778757 ) ) ( not ( = ?auto_778748 ?auto_778758 ) ) ( not ( = ?auto_778748 ?auto_778759 ) ) ( not ( = ?auto_778748 ?auto_778760 ) ) ( not ( = ?auto_778749 ?auto_778750 ) ) ( not ( = ?auto_778749 ?auto_778751 ) ) ( not ( = ?auto_778749 ?auto_778752 ) ) ( not ( = ?auto_778749 ?auto_778753 ) ) ( not ( = ?auto_778749 ?auto_778754 ) ) ( not ( = ?auto_778749 ?auto_778755 ) ) ( not ( = ?auto_778749 ?auto_778756 ) ) ( not ( = ?auto_778749 ?auto_778757 ) ) ( not ( = ?auto_778749 ?auto_778758 ) ) ( not ( = ?auto_778749 ?auto_778759 ) ) ( not ( = ?auto_778749 ?auto_778760 ) ) ( not ( = ?auto_778750 ?auto_778751 ) ) ( not ( = ?auto_778750 ?auto_778752 ) ) ( not ( = ?auto_778750 ?auto_778753 ) ) ( not ( = ?auto_778750 ?auto_778754 ) ) ( not ( = ?auto_778750 ?auto_778755 ) ) ( not ( = ?auto_778750 ?auto_778756 ) ) ( not ( = ?auto_778750 ?auto_778757 ) ) ( not ( = ?auto_778750 ?auto_778758 ) ) ( not ( = ?auto_778750 ?auto_778759 ) ) ( not ( = ?auto_778750 ?auto_778760 ) ) ( not ( = ?auto_778751 ?auto_778752 ) ) ( not ( = ?auto_778751 ?auto_778753 ) ) ( not ( = ?auto_778751 ?auto_778754 ) ) ( not ( = ?auto_778751 ?auto_778755 ) ) ( not ( = ?auto_778751 ?auto_778756 ) ) ( not ( = ?auto_778751 ?auto_778757 ) ) ( not ( = ?auto_778751 ?auto_778758 ) ) ( not ( = ?auto_778751 ?auto_778759 ) ) ( not ( = ?auto_778751 ?auto_778760 ) ) ( not ( = ?auto_778752 ?auto_778753 ) ) ( not ( = ?auto_778752 ?auto_778754 ) ) ( not ( = ?auto_778752 ?auto_778755 ) ) ( not ( = ?auto_778752 ?auto_778756 ) ) ( not ( = ?auto_778752 ?auto_778757 ) ) ( not ( = ?auto_778752 ?auto_778758 ) ) ( not ( = ?auto_778752 ?auto_778759 ) ) ( not ( = ?auto_778752 ?auto_778760 ) ) ( not ( = ?auto_778753 ?auto_778754 ) ) ( not ( = ?auto_778753 ?auto_778755 ) ) ( not ( = ?auto_778753 ?auto_778756 ) ) ( not ( = ?auto_778753 ?auto_778757 ) ) ( not ( = ?auto_778753 ?auto_778758 ) ) ( not ( = ?auto_778753 ?auto_778759 ) ) ( not ( = ?auto_778753 ?auto_778760 ) ) ( not ( = ?auto_778754 ?auto_778755 ) ) ( not ( = ?auto_778754 ?auto_778756 ) ) ( not ( = ?auto_778754 ?auto_778757 ) ) ( not ( = ?auto_778754 ?auto_778758 ) ) ( not ( = ?auto_778754 ?auto_778759 ) ) ( not ( = ?auto_778754 ?auto_778760 ) ) ( not ( = ?auto_778755 ?auto_778756 ) ) ( not ( = ?auto_778755 ?auto_778757 ) ) ( not ( = ?auto_778755 ?auto_778758 ) ) ( not ( = ?auto_778755 ?auto_778759 ) ) ( not ( = ?auto_778755 ?auto_778760 ) ) ( not ( = ?auto_778756 ?auto_778757 ) ) ( not ( = ?auto_778756 ?auto_778758 ) ) ( not ( = ?auto_778756 ?auto_778759 ) ) ( not ( = ?auto_778756 ?auto_778760 ) ) ( not ( = ?auto_778757 ?auto_778758 ) ) ( not ( = ?auto_778757 ?auto_778759 ) ) ( not ( = ?auto_778757 ?auto_778760 ) ) ( not ( = ?auto_778758 ?auto_778759 ) ) ( not ( = ?auto_778758 ?auto_778760 ) ) ( not ( = ?auto_778759 ?auto_778760 ) ) ( ON ?auto_778758 ?auto_778759 ) ( ON ?auto_778757 ?auto_778758 ) ( ON ?auto_778756 ?auto_778757 ) ( ON ?auto_778755 ?auto_778756 ) ( ON ?auto_778754 ?auto_778755 ) ( ON ?auto_778753 ?auto_778754 ) ( CLEAR ?auto_778751 ) ( ON ?auto_778752 ?auto_778753 ) ( CLEAR ?auto_778752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_778746 ?auto_778747 ?auto_778748 ?auto_778749 ?auto_778750 ?auto_778751 ?auto_778752 )
      ( MAKE-14PILE ?auto_778746 ?auto_778747 ?auto_778748 ?auto_778749 ?auto_778750 ?auto_778751 ?auto_778752 ?auto_778753 ?auto_778754 ?auto_778755 ?auto_778756 ?auto_778757 ?auto_778758 ?auto_778759 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_778804 - BLOCK
      ?auto_778805 - BLOCK
      ?auto_778806 - BLOCK
      ?auto_778807 - BLOCK
      ?auto_778808 - BLOCK
      ?auto_778809 - BLOCK
      ?auto_778810 - BLOCK
      ?auto_778811 - BLOCK
      ?auto_778812 - BLOCK
      ?auto_778813 - BLOCK
      ?auto_778814 - BLOCK
      ?auto_778815 - BLOCK
      ?auto_778816 - BLOCK
      ?auto_778817 - BLOCK
    )
    :vars
    (
      ?auto_778818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_778817 ?auto_778818 ) ( ON-TABLE ?auto_778804 ) ( ON ?auto_778805 ?auto_778804 ) ( ON ?auto_778806 ?auto_778805 ) ( ON ?auto_778807 ?auto_778806 ) ( ON ?auto_778808 ?auto_778807 ) ( not ( = ?auto_778804 ?auto_778805 ) ) ( not ( = ?auto_778804 ?auto_778806 ) ) ( not ( = ?auto_778804 ?auto_778807 ) ) ( not ( = ?auto_778804 ?auto_778808 ) ) ( not ( = ?auto_778804 ?auto_778809 ) ) ( not ( = ?auto_778804 ?auto_778810 ) ) ( not ( = ?auto_778804 ?auto_778811 ) ) ( not ( = ?auto_778804 ?auto_778812 ) ) ( not ( = ?auto_778804 ?auto_778813 ) ) ( not ( = ?auto_778804 ?auto_778814 ) ) ( not ( = ?auto_778804 ?auto_778815 ) ) ( not ( = ?auto_778804 ?auto_778816 ) ) ( not ( = ?auto_778804 ?auto_778817 ) ) ( not ( = ?auto_778804 ?auto_778818 ) ) ( not ( = ?auto_778805 ?auto_778806 ) ) ( not ( = ?auto_778805 ?auto_778807 ) ) ( not ( = ?auto_778805 ?auto_778808 ) ) ( not ( = ?auto_778805 ?auto_778809 ) ) ( not ( = ?auto_778805 ?auto_778810 ) ) ( not ( = ?auto_778805 ?auto_778811 ) ) ( not ( = ?auto_778805 ?auto_778812 ) ) ( not ( = ?auto_778805 ?auto_778813 ) ) ( not ( = ?auto_778805 ?auto_778814 ) ) ( not ( = ?auto_778805 ?auto_778815 ) ) ( not ( = ?auto_778805 ?auto_778816 ) ) ( not ( = ?auto_778805 ?auto_778817 ) ) ( not ( = ?auto_778805 ?auto_778818 ) ) ( not ( = ?auto_778806 ?auto_778807 ) ) ( not ( = ?auto_778806 ?auto_778808 ) ) ( not ( = ?auto_778806 ?auto_778809 ) ) ( not ( = ?auto_778806 ?auto_778810 ) ) ( not ( = ?auto_778806 ?auto_778811 ) ) ( not ( = ?auto_778806 ?auto_778812 ) ) ( not ( = ?auto_778806 ?auto_778813 ) ) ( not ( = ?auto_778806 ?auto_778814 ) ) ( not ( = ?auto_778806 ?auto_778815 ) ) ( not ( = ?auto_778806 ?auto_778816 ) ) ( not ( = ?auto_778806 ?auto_778817 ) ) ( not ( = ?auto_778806 ?auto_778818 ) ) ( not ( = ?auto_778807 ?auto_778808 ) ) ( not ( = ?auto_778807 ?auto_778809 ) ) ( not ( = ?auto_778807 ?auto_778810 ) ) ( not ( = ?auto_778807 ?auto_778811 ) ) ( not ( = ?auto_778807 ?auto_778812 ) ) ( not ( = ?auto_778807 ?auto_778813 ) ) ( not ( = ?auto_778807 ?auto_778814 ) ) ( not ( = ?auto_778807 ?auto_778815 ) ) ( not ( = ?auto_778807 ?auto_778816 ) ) ( not ( = ?auto_778807 ?auto_778817 ) ) ( not ( = ?auto_778807 ?auto_778818 ) ) ( not ( = ?auto_778808 ?auto_778809 ) ) ( not ( = ?auto_778808 ?auto_778810 ) ) ( not ( = ?auto_778808 ?auto_778811 ) ) ( not ( = ?auto_778808 ?auto_778812 ) ) ( not ( = ?auto_778808 ?auto_778813 ) ) ( not ( = ?auto_778808 ?auto_778814 ) ) ( not ( = ?auto_778808 ?auto_778815 ) ) ( not ( = ?auto_778808 ?auto_778816 ) ) ( not ( = ?auto_778808 ?auto_778817 ) ) ( not ( = ?auto_778808 ?auto_778818 ) ) ( not ( = ?auto_778809 ?auto_778810 ) ) ( not ( = ?auto_778809 ?auto_778811 ) ) ( not ( = ?auto_778809 ?auto_778812 ) ) ( not ( = ?auto_778809 ?auto_778813 ) ) ( not ( = ?auto_778809 ?auto_778814 ) ) ( not ( = ?auto_778809 ?auto_778815 ) ) ( not ( = ?auto_778809 ?auto_778816 ) ) ( not ( = ?auto_778809 ?auto_778817 ) ) ( not ( = ?auto_778809 ?auto_778818 ) ) ( not ( = ?auto_778810 ?auto_778811 ) ) ( not ( = ?auto_778810 ?auto_778812 ) ) ( not ( = ?auto_778810 ?auto_778813 ) ) ( not ( = ?auto_778810 ?auto_778814 ) ) ( not ( = ?auto_778810 ?auto_778815 ) ) ( not ( = ?auto_778810 ?auto_778816 ) ) ( not ( = ?auto_778810 ?auto_778817 ) ) ( not ( = ?auto_778810 ?auto_778818 ) ) ( not ( = ?auto_778811 ?auto_778812 ) ) ( not ( = ?auto_778811 ?auto_778813 ) ) ( not ( = ?auto_778811 ?auto_778814 ) ) ( not ( = ?auto_778811 ?auto_778815 ) ) ( not ( = ?auto_778811 ?auto_778816 ) ) ( not ( = ?auto_778811 ?auto_778817 ) ) ( not ( = ?auto_778811 ?auto_778818 ) ) ( not ( = ?auto_778812 ?auto_778813 ) ) ( not ( = ?auto_778812 ?auto_778814 ) ) ( not ( = ?auto_778812 ?auto_778815 ) ) ( not ( = ?auto_778812 ?auto_778816 ) ) ( not ( = ?auto_778812 ?auto_778817 ) ) ( not ( = ?auto_778812 ?auto_778818 ) ) ( not ( = ?auto_778813 ?auto_778814 ) ) ( not ( = ?auto_778813 ?auto_778815 ) ) ( not ( = ?auto_778813 ?auto_778816 ) ) ( not ( = ?auto_778813 ?auto_778817 ) ) ( not ( = ?auto_778813 ?auto_778818 ) ) ( not ( = ?auto_778814 ?auto_778815 ) ) ( not ( = ?auto_778814 ?auto_778816 ) ) ( not ( = ?auto_778814 ?auto_778817 ) ) ( not ( = ?auto_778814 ?auto_778818 ) ) ( not ( = ?auto_778815 ?auto_778816 ) ) ( not ( = ?auto_778815 ?auto_778817 ) ) ( not ( = ?auto_778815 ?auto_778818 ) ) ( not ( = ?auto_778816 ?auto_778817 ) ) ( not ( = ?auto_778816 ?auto_778818 ) ) ( not ( = ?auto_778817 ?auto_778818 ) ) ( ON ?auto_778816 ?auto_778817 ) ( ON ?auto_778815 ?auto_778816 ) ( ON ?auto_778814 ?auto_778815 ) ( ON ?auto_778813 ?auto_778814 ) ( ON ?auto_778812 ?auto_778813 ) ( ON ?auto_778811 ?auto_778812 ) ( ON ?auto_778810 ?auto_778811 ) ( CLEAR ?auto_778808 ) ( ON ?auto_778809 ?auto_778810 ) ( CLEAR ?auto_778809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_778804 ?auto_778805 ?auto_778806 ?auto_778807 ?auto_778808 ?auto_778809 )
      ( MAKE-14PILE ?auto_778804 ?auto_778805 ?auto_778806 ?auto_778807 ?auto_778808 ?auto_778809 ?auto_778810 ?auto_778811 ?auto_778812 ?auto_778813 ?auto_778814 ?auto_778815 ?auto_778816 ?auto_778817 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_778862 - BLOCK
      ?auto_778863 - BLOCK
      ?auto_778864 - BLOCK
      ?auto_778865 - BLOCK
      ?auto_778866 - BLOCK
      ?auto_778867 - BLOCK
      ?auto_778868 - BLOCK
      ?auto_778869 - BLOCK
      ?auto_778870 - BLOCK
      ?auto_778871 - BLOCK
      ?auto_778872 - BLOCK
      ?auto_778873 - BLOCK
      ?auto_778874 - BLOCK
      ?auto_778875 - BLOCK
    )
    :vars
    (
      ?auto_778876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_778875 ?auto_778876 ) ( ON-TABLE ?auto_778862 ) ( ON ?auto_778863 ?auto_778862 ) ( ON ?auto_778864 ?auto_778863 ) ( ON ?auto_778865 ?auto_778864 ) ( not ( = ?auto_778862 ?auto_778863 ) ) ( not ( = ?auto_778862 ?auto_778864 ) ) ( not ( = ?auto_778862 ?auto_778865 ) ) ( not ( = ?auto_778862 ?auto_778866 ) ) ( not ( = ?auto_778862 ?auto_778867 ) ) ( not ( = ?auto_778862 ?auto_778868 ) ) ( not ( = ?auto_778862 ?auto_778869 ) ) ( not ( = ?auto_778862 ?auto_778870 ) ) ( not ( = ?auto_778862 ?auto_778871 ) ) ( not ( = ?auto_778862 ?auto_778872 ) ) ( not ( = ?auto_778862 ?auto_778873 ) ) ( not ( = ?auto_778862 ?auto_778874 ) ) ( not ( = ?auto_778862 ?auto_778875 ) ) ( not ( = ?auto_778862 ?auto_778876 ) ) ( not ( = ?auto_778863 ?auto_778864 ) ) ( not ( = ?auto_778863 ?auto_778865 ) ) ( not ( = ?auto_778863 ?auto_778866 ) ) ( not ( = ?auto_778863 ?auto_778867 ) ) ( not ( = ?auto_778863 ?auto_778868 ) ) ( not ( = ?auto_778863 ?auto_778869 ) ) ( not ( = ?auto_778863 ?auto_778870 ) ) ( not ( = ?auto_778863 ?auto_778871 ) ) ( not ( = ?auto_778863 ?auto_778872 ) ) ( not ( = ?auto_778863 ?auto_778873 ) ) ( not ( = ?auto_778863 ?auto_778874 ) ) ( not ( = ?auto_778863 ?auto_778875 ) ) ( not ( = ?auto_778863 ?auto_778876 ) ) ( not ( = ?auto_778864 ?auto_778865 ) ) ( not ( = ?auto_778864 ?auto_778866 ) ) ( not ( = ?auto_778864 ?auto_778867 ) ) ( not ( = ?auto_778864 ?auto_778868 ) ) ( not ( = ?auto_778864 ?auto_778869 ) ) ( not ( = ?auto_778864 ?auto_778870 ) ) ( not ( = ?auto_778864 ?auto_778871 ) ) ( not ( = ?auto_778864 ?auto_778872 ) ) ( not ( = ?auto_778864 ?auto_778873 ) ) ( not ( = ?auto_778864 ?auto_778874 ) ) ( not ( = ?auto_778864 ?auto_778875 ) ) ( not ( = ?auto_778864 ?auto_778876 ) ) ( not ( = ?auto_778865 ?auto_778866 ) ) ( not ( = ?auto_778865 ?auto_778867 ) ) ( not ( = ?auto_778865 ?auto_778868 ) ) ( not ( = ?auto_778865 ?auto_778869 ) ) ( not ( = ?auto_778865 ?auto_778870 ) ) ( not ( = ?auto_778865 ?auto_778871 ) ) ( not ( = ?auto_778865 ?auto_778872 ) ) ( not ( = ?auto_778865 ?auto_778873 ) ) ( not ( = ?auto_778865 ?auto_778874 ) ) ( not ( = ?auto_778865 ?auto_778875 ) ) ( not ( = ?auto_778865 ?auto_778876 ) ) ( not ( = ?auto_778866 ?auto_778867 ) ) ( not ( = ?auto_778866 ?auto_778868 ) ) ( not ( = ?auto_778866 ?auto_778869 ) ) ( not ( = ?auto_778866 ?auto_778870 ) ) ( not ( = ?auto_778866 ?auto_778871 ) ) ( not ( = ?auto_778866 ?auto_778872 ) ) ( not ( = ?auto_778866 ?auto_778873 ) ) ( not ( = ?auto_778866 ?auto_778874 ) ) ( not ( = ?auto_778866 ?auto_778875 ) ) ( not ( = ?auto_778866 ?auto_778876 ) ) ( not ( = ?auto_778867 ?auto_778868 ) ) ( not ( = ?auto_778867 ?auto_778869 ) ) ( not ( = ?auto_778867 ?auto_778870 ) ) ( not ( = ?auto_778867 ?auto_778871 ) ) ( not ( = ?auto_778867 ?auto_778872 ) ) ( not ( = ?auto_778867 ?auto_778873 ) ) ( not ( = ?auto_778867 ?auto_778874 ) ) ( not ( = ?auto_778867 ?auto_778875 ) ) ( not ( = ?auto_778867 ?auto_778876 ) ) ( not ( = ?auto_778868 ?auto_778869 ) ) ( not ( = ?auto_778868 ?auto_778870 ) ) ( not ( = ?auto_778868 ?auto_778871 ) ) ( not ( = ?auto_778868 ?auto_778872 ) ) ( not ( = ?auto_778868 ?auto_778873 ) ) ( not ( = ?auto_778868 ?auto_778874 ) ) ( not ( = ?auto_778868 ?auto_778875 ) ) ( not ( = ?auto_778868 ?auto_778876 ) ) ( not ( = ?auto_778869 ?auto_778870 ) ) ( not ( = ?auto_778869 ?auto_778871 ) ) ( not ( = ?auto_778869 ?auto_778872 ) ) ( not ( = ?auto_778869 ?auto_778873 ) ) ( not ( = ?auto_778869 ?auto_778874 ) ) ( not ( = ?auto_778869 ?auto_778875 ) ) ( not ( = ?auto_778869 ?auto_778876 ) ) ( not ( = ?auto_778870 ?auto_778871 ) ) ( not ( = ?auto_778870 ?auto_778872 ) ) ( not ( = ?auto_778870 ?auto_778873 ) ) ( not ( = ?auto_778870 ?auto_778874 ) ) ( not ( = ?auto_778870 ?auto_778875 ) ) ( not ( = ?auto_778870 ?auto_778876 ) ) ( not ( = ?auto_778871 ?auto_778872 ) ) ( not ( = ?auto_778871 ?auto_778873 ) ) ( not ( = ?auto_778871 ?auto_778874 ) ) ( not ( = ?auto_778871 ?auto_778875 ) ) ( not ( = ?auto_778871 ?auto_778876 ) ) ( not ( = ?auto_778872 ?auto_778873 ) ) ( not ( = ?auto_778872 ?auto_778874 ) ) ( not ( = ?auto_778872 ?auto_778875 ) ) ( not ( = ?auto_778872 ?auto_778876 ) ) ( not ( = ?auto_778873 ?auto_778874 ) ) ( not ( = ?auto_778873 ?auto_778875 ) ) ( not ( = ?auto_778873 ?auto_778876 ) ) ( not ( = ?auto_778874 ?auto_778875 ) ) ( not ( = ?auto_778874 ?auto_778876 ) ) ( not ( = ?auto_778875 ?auto_778876 ) ) ( ON ?auto_778874 ?auto_778875 ) ( ON ?auto_778873 ?auto_778874 ) ( ON ?auto_778872 ?auto_778873 ) ( ON ?auto_778871 ?auto_778872 ) ( ON ?auto_778870 ?auto_778871 ) ( ON ?auto_778869 ?auto_778870 ) ( ON ?auto_778868 ?auto_778869 ) ( ON ?auto_778867 ?auto_778868 ) ( CLEAR ?auto_778865 ) ( ON ?auto_778866 ?auto_778867 ) ( CLEAR ?auto_778866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_778862 ?auto_778863 ?auto_778864 ?auto_778865 ?auto_778866 )
      ( MAKE-14PILE ?auto_778862 ?auto_778863 ?auto_778864 ?auto_778865 ?auto_778866 ?auto_778867 ?auto_778868 ?auto_778869 ?auto_778870 ?auto_778871 ?auto_778872 ?auto_778873 ?auto_778874 ?auto_778875 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_778920 - BLOCK
      ?auto_778921 - BLOCK
      ?auto_778922 - BLOCK
      ?auto_778923 - BLOCK
      ?auto_778924 - BLOCK
      ?auto_778925 - BLOCK
      ?auto_778926 - BLOCK
      ?auto_778927 - BLOCK
      ?auto_778928 - BLOCK
      ?auto_778929 - BLOCK
      ?auto_778930 - BLOCK
      ?auto_778931 - BLOCK
      ?auto_778932 - BLOCK
      ?auto_778933 - BLOCK
    )
    :vars
    (
      ?auto_778934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_778933 ?auto_778934 ) ( ON-TABLE ?auto_778920 ) ( ON ?auto_778921 ?auto_778920 ) ( ON ?auto_778922 ?auto_778921 ) ( not ( = ?auto_778920 ?auto_778921 ) ) ( not ( = ?auto_778920 ?auto_778922 ) ) ( not ( = ?auto_778920 ?auto_778923 ) ) ( not ( = ?auto_778920 ?auto_778924 ) ) ( not ( = ?auto_778920 ?auto_778925 ) ) ( not ( = ?auto_778920 ?auto_778926 ) ) ( not ( = ?auto_778920 ?auto_778927 ) ) ( not ( = ?auto_778920 ?auto_778928 ) ) ( not ( = ?auto_778920 ?auto_778929 ) ) ( not ( = ?auto_778920 ?auto_778930 ) ) ( not ( = ?auto_778920 ?auto_778931 ) ) ( not ( = ?auto_778920 ?auto_778932 ) ) ( not ( = ?auto_778920 ?auto_778933 ) ) ( not ( = ?auto_778920 ?auto_778934 ) ) ( not ( = ?auto_778921 ?auto_778922 ) ) ( not ( = ?auto_778921 ?auto_778923 ) ) ( not ( = ?auto_778921 ?auto_778924 ) ) ( not ( = ?auto_778921 ?auto_778925 ) ) ( not ( = ?auto_778921 ?auto_778926 ) ) ( not ( = ?auto_778921 ?auto_778927 ) ) ( not ( = ?auto_778921 ?auto_778928 ) ) ( not ( = ?auto_778921 ?auto_778929 ) ) ( not ( = ?auto_778921 ?auto_778930 ) ) ( not ( = ?auto_778921 ?auto_778931 ) ) ( not ( = ?auto_778921 ?auto_778932 ) ) ( not ( = ?auto_778921 ?auto_778933 ) ) ( not ( = ?auto_778921 ?auto_778934 ) ) ( not ( = ?auto_778922 ?auto_778923 ) ) ( not ( = ?auto_778922 ?auto_778924 ) ) ( not ( = ?auto_778922 ?auto_778925 ) ) ( not ( = ?auto_778922 ?auto_778926 ) ) ( not ( = ?auto_778922 ?auto_778927 ) ) ( not ( = ?auto_778922 ?auto_778928 ) ) ( not ( = ?auto_778922 ?auto_778929 ) ) ( not ( = ?auto_778922 ?auto_778930 ) ) ( not ( = ?auto_778922 ?auto_778931 ) ) ( not ( = ?auto_778922 ?auto_778932 ) ) ( not ( = ?auto_778922 ?auto_778933 ) ) ( not ( = ?auto_778922 ?auto_778934 ) ) ( not ( = ?auto_778923 ?auto_778924 ) ) ( not ( = ?auto_778923 ?auto_778925 ) ) ( not ( = ?auto_778923 ?auto_778926 ) ) ( not ( = ?auto_778923 ?auto_778927 ) ) ( not ( = ?auto_778923 ?auto_778928 ) ) ( not ( = ?auto_778923 ?auto_778929 ) ) ( not ( = ?auto_778923 ?auto_778930 ) ) ( not ( = ?auto_778923 ?auto_778931 ) ) ( not ( = ?auto_778923 ?auto_778932 ) ) ( not ( = ?auto_778923 ?auto_778933 ) ) ( not ( = ?auto_778923 ?auto_778934 ) ) ( not ( = ?auto_778924 ?auto_778925 ) ) ( not ( = ?auto_778924 ?auto_778926 ) ) ( not ( = ?auto_778924 ?auto_778927 ) ) ( not ( = ?auto_778924 ?auto_778928 ) ) ( not ( = ?auto_778924 ?auto_778929 ) ) ( not ( = ?auto_778924 ?auto_778930 ) ) ( not ( = ?auto_778924 ?auto_778931 ) ) ( not ( = ?auto_778924 ?auto_778932 ) ) ( not ( = ?auto_778924 ?auto_778933 ) ) ( not ( = ?auto_778924 ?auto_778934 ) ) ( not ( = ?auto_778925 ?auto_778926 ) ) ( not ( = ?auto_778925 ?auto_778927 ) ) ( not ( = ?auto_778925 ?auto_778928 ) ) ( not ( = ?auto_778925 ?auto_778929 ) ) ( not ( = ?auto_778925 ?auto_778930 ) ) ( not ( = ?auto_778925 ?auto_778931 ) ) ( not ( = ?auto_778925 ?auto_778932 ) ) ( not ( = ?auto_778925 ?auto_778933 ) ) ( not ( = ?auto_778925 ?auto_778934 ) ) ( not ( = ?auto_778926 ?auto_778927 ) ) ( not ( = ?auto_778926 ?auto_778928 ) ) ( not ( = ?auto_778926 ?auto_778929 ) ) ( not ( = ?auto_778926 ?auto_778930 ) ) ( not ( = ?auto_778926 ?auto_778931 ) ) ( not ( = ?auto_778926 ?auto_778932 ) ) ( not ( = ?auto_778926 ?auto_778933 ) ) ( not ( = ?auto_778926 ?auto_778934 ) ) ( not ( = ?auto_778927 ?auto_778928 ) ) ( not ( = ?auto_778927 ?auto_778929 ) ) ( not ( = ?auto_778927 ?auto_778930 ) ) ( not ( = ?auto_778927 ?auto_778931 ) ) ( not ( = ?auto_778927 ?auto_778932 ) ) ( not ( = ?auto_778927 ?auto_778933 ) ) ( not ( = ?auto_778927 ?auto_778934 ) ) ( not ( = ?auto_778928 ?auto_778929 ) ) ( not ( = ?auto_778928 ?auto_778930 ) ) ( not ( = ?auto_778928 ?auto_778931 ) ) ( not ( = ?auto_778928 ?auto_778932 ) ) ( not ( = ?auto_778928 ?auto_778933 ) ) ( not ( = ?auto_778928 ?auto_778934 ) ) ( not ( = ?auto_778929 ?auto_778930 ) ) ( not ( = ?auto_778929 ?auto_778931 ) ) ( not ( = ?auto_778929 ?auto_778932 ) ) ( not ( = ?auto_778929 ?auto_778933 ) ) ( not ( = ?auto_778929 ?auto_778934 ) ) ( not ( = ?auto_778930 ?auto_778931 ) ) ( not ( = ?auto_778930 ?auto_778932 ) ) ( not ( = ?auto_778930 ?auto_778933 ) ) ( not ( = ?auto_778930 ?auto_778934 ) ) ( not ( = ?auto_778931 ?auto_778932 ) ) ( not ( = ?auto_778931 ?auto_778933 ) ) ( not ( = ?auto_778931 ?auto_778934 ) ) ( not ( = ?auto_778932 ?auto_778933 ) ) ( not ( = ?auto_778932 ?auto_778934 ) ) ( not ( = ?auto_778933 ?auto_778934 ) ) ( ON ?auto_778932 ?auto_778933 ) ( ON ?auto_778931 ?auto_778932 ) ( ON ?auto_778930 ?auto_778931 ) ( ON ?auto_778929 ?auto_778930 ) ( ON ?auto_778928 ?auto_778929 ) ( ON ?auto_778927 ?auto_778928 ) ( ON ?auto_778926 ?auto_778927 ) ( ON ?auto_778925 ?auto_778926 ) ( ON ?auto_778924 ?auto_778925 ) ( CLEAR ?auto_778922 ) ( ON ?auto_778923 ?auto_778924 ) ( CLEAR ?auto_778923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_778920 ?auto_778921 ?auto_778922 ?auto_778923 )
      ( MAKE-14PILE ?auto_778920 ?auto_778921 ?auto_778922 ?auto_778923 ?auto_778924 ?auto_778925 ?auto_778926 ?auto_778927 ?auto_778928 ?auto_778929 ?auto_778930 ?auto_778931 ?auto_778932 ?auto_778933 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_778978 - BLOCK
      ?auto_778979 - BLOCK
      ?auto_778980 - BLOCK
      ?auto_778981 - BLOCK
      ?auto_778982 - BLOCK
      ?auto_778983 - BLOCK
      ?auto_778984 - BLOCK
      ?auto_778985 - BLOCK
      ?auto_778986 - BLOCK
      ?auto_778987 - BLOCK
      ?auto_778988 - BLOCK
      ?auto_778989 - BLOCK
      ?auto_778990 - BLOCK
      ?auto_778991 - BLOCK
    )
    :vars
    (
      ?auto_778992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_778991 ?auto_778992 ) ( ON-TABLE ?auto_778978 ) ( ON ?auto_778979 ?auto_778978 ) ( not ( = ?auto_778978 ?auto_778979 ) ) ( not ( = ?auto_778978 ?auto_778980 ) ) ( not ( = ?auto_778978 ?auto_778981 ) ) ( not ( = ?auto_778978 ?auto_778982 ) ) ( not ( = ?auto_778978 ?auto_778983 ) ) ( not ( = ?auto_778978 ?auto_778984 ) ) ( not ( = ?auto_778978 ?auto_778985 ) ) ( not ( = ?auto_778978 ?auto_778986 ) ) ( not ( = ?auto_778978 ?auto_778987 ) ) ( not ( = ?auto_778978 ?auto_778988 ) ) ( not ( = ?auto_778978 ?auto_778989 ) ) ( not ( = ?auto_778978 ?auto_778990 ) ) ( not ( = ?auto_778978 ?auto_778991 ) ) ( not ( = ?auto_778978 ?auto_778992 ) ) ( not ( = ?auto_778979 ?auto_778980 ) ) ( not ( = ?auto_778979 ?auto_778981 ) ) ( not ( = ?auto_778979 ?auto_778982 ) ) ( not ( = ?auto_778979 ?auto_778983 ) ) ( not ( = ?auto_778979 ?auto_778984 ) ) ( not ( = ?auto_778979 ?auto_778985 ) ) ( not ( = ?auto_778979 ?auto_778986 ) ) ( not ( = ?auto_778979 ?auto_778987 ) ) ( not ( = ?auto_778979 ?auto_778988 ) ) ( not ( = ?auto_778979 ?auto_778989 ) ) ( not ( = ?auto_778979 ?auto_778990 ) ) ( not ( = ?auto_778979 ?auto_778991 ) ) ( not ( = ?auto_778979 ?auto_778992 ) ) ( not ( = ?auto_778980 ?auto_778981 ) ) ( not ( = ?auto_778980 ?auto_778982 ) ) ( not ( = ?auto_778980 ?auto_778983 ) ) ( not ( = ?auto_778980 ?auto_778984 ) ) ( not ( = ?auto_778980 ?auto_778985 ) ) ( not ( = ?auto_778980 ?auto_778986 ) ) ( not ( = ?auto_778980 ?auto_778987 ) ) ( not ( = ?auto_778980 ?auto_778988 ) ) ( not ( = ?auto_778980 ?auto_778989 ) ) ( not ( = ?auto_778980 ?auto_778990 ) ) ( not ( = ?auto_778980 ?auto_778991 ) ) ( not ( = ?auto_778980 ?auto_778992 ) ) ( not ( = ?auto_778981 ?auto_778982 ) ) ( not ( = ?auto_778981 ?auto_778983 ) ) ( not ( = ?auto_778981 ?auto_778984 ) ) ( not ( = ?auto_778981 ?auto_778985 ) ) ( not ( = ?auto_778981 ?auto_778986 ) ) ( not ( = ?auto_778981 ?auto_778987 ) ) ( not ( = ?auto_778981 ?auto_778988 ) ) ( not ( = ?auto_778981 ?auto_778989 ) ) ( not ( = ?auto_778981 ?auto_778990 ) ) ( not ( = ?auto_778981 ?auto_778991 ) ) ( not ( = ?auto_778981 ?auto_778992 ) ) ( not ( = ?auto_778982 ?auto_778983 ) ) ( not ( = ?auto_778982 ?auto_778984 ) ) ( not ( = ?auto_778982 ?auto_778985 ) ) ( not ( = ?auto_778982 ?auto_778986 ) ) ( not ( = ?auto_778982 ?auto_778987 ) ) ( not ( = ?auto_778982 ?auto_778988 ) ) ( not ( = ?auto_778982 ?auto_778989 ) ) ( not ( = ?auto_778982 ?auto_778990 ) ) ( not ( = ?auto_778982 ?auto_778991 ) ) ( not ( = ?auto_778982 ?auto_778992 ) ) ( not ( = ?auto_778983 ?auto_778984 ) ) ( not ( = ?auto_778983 ?auto_778985 ) ) ( not ( = ?auto_778983 ?auto_778986 ) ) ( not ( = ?auto_778983 ?auto_778987 ) ) ( not ( = ?auto_778983 ?auto_778988 ) ) ( not ( = ?auto_778983 ?auto_778989 ) ) ( not ( = ?auto_778983 ?auto_778990 ) ) ( not ( = ?auto_778983 ?auto_778991 ) ) ( not ( = ?auto_778983 ?auto_778992 ) ) ( not ( = ?auto_778984 ?auto_778985 ) ) ( not ( = ?auto_778984 ?auto_778986 ) ) ( not ( = ?auto_778984 ?auto_778987 ) ) ( not ( = ?auto_778984 ?auto_778988 ) ) ( not ( = ?auto_778984 ?auto_778989 ) ) ( not ( = ?auto_778984 ?auto_778990 ) ) ( not ( = ?auto_778984 ?auto_778991 ) ) ( not ( = ?auto_778984 ?auto_778992 ) ) ( not ( = ?auto_778985 ?auto_778986 ) ) ( not ( = ?auto_778985 ?auto_778987 ) ) ( not ( = ?auto_778985 ?auto_778988 ) ) ( not ( = ?auto_778985 ?auto_778989 ) ) ( not ( = ?auto_778985 ?auto_778990 ) ) ( not ( = ?auto_778985 ?auto_778991 ) ) ( not ( = ?auto_778985 ?auto_778992 ) ) ( not ( = ?auto_778986 ?auto_778987 ) ) ( not ( = ?auto_778986 ?auto_778988 ) ) ( not ( = ?auto_778986 ?auto_778989 ) ) ( not ( = ?auto_778986 ?auto_778990 ) ) ( not ( = ?auto_778986 ?auto_778991 ) ) ( not ( = ?auto_778986 ?auto_778992 ) ) ( not ( = ?auto_778987 ?auto_778988 ) ) ( not ( = ?auto_778987 ?auto_778989 ) ) ( not ( = ?auto_778987 ?auto_778990 ) ) ( not ( = ?auto_778987 ?auto_778991 ) ) ( not ( = ?auto_778987 ?auto_778992 ) ) ( not ( = ?auto_778988 ?auto_778989 ) ) ( not ( = ?auto_778988 ?auto_778990 ) ) ( not ( = ?auto_778988 ?auto_778991 ) ) ( not ( = ?auto_778988 ?auto_778992 ) ) ( not ( = ?auto_778989 ?auto_778990 ) ) ( not ( = ?auto_778989 ?auto_778991 ) ) ( not ( = ?auto_778989 ?auto_778992 ) ) ( not ( = ?auto_778990 ?auto_778991 ) ) ( not ( = ?auto_778990 ?auto_778992 ) ) ( not ( = ?auto_778991 ?auto_778992 ) ) ( ON ?auto_778990 ?auto_778991 ) ( ON ?auto_778989 ?auto_778990 ) ( ON ?auto_778988 ?auto_778989 ) ( ON ?auto_778987 ?auto_778988 ) ( ON ?auto_778986 ?auto_778987 ) ( ON ?auto_778985 ?auto_778986 ) ( ON ?auto_778984 ?auto_778985 ) ( ON ?auto_778983 ?auto_778984 ) ( ON ?auto_778982 ?auto_778983 ) ( ON ?auto_778981 ?auto_778982 ) ( CLEAR ?auto_778979 ) ( ON ?auto_778980 ?auto_778981 ) ( CLEAR ?auto_778980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_778978 ?auto_778979 ?auto_778980 )
      ( MAKE-14PILE ?auto_778978 ?auto_778979 ?auto_778980 ?auto_778981 ?auto_778982 ?auto_778983 ?auto_778984 ?auto_778985 ?auto_778986 ?auto_778987 ?auto_778988 ?auto_778989 ?auto_778990 ?auto_778991 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_779036 - BLOCK
      ?auto_779037 - BLOCK
      ?auto_779038 - BLOCK
      ?auto_779039 - BLOCK
      ?auto_779040 - BLOCK
      ?auto_779041 - BLOCK
      ?auto_779042 - BLOCK
      ?auto_779043 - BLOCK
      ?auto_779044 - BLOCK
      ?auto_779045 - BLOCK
      ?auto_779046 - BLOCK
      ?auto_779047 - BLOCK
      ?auto_779048 - BLOCK
      ?auto_779049 - BLOCK
    )
    :vars
    (
      ?auto_779050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_779049 ?auto_779050 ) ( ON-TABLE ?auto_779036 ) ( not ( = ?auto_779036 ?auto_779037 ) ) ( not ( = ?auto_779036 ?auto_779038 ) ) ( not ( = ?auto_779036 ?auto_779039 ) ) ( not ( = ?auto_779036 ?auto_779040 ) ) ( not ( = ?auto_779036 ?auto_779041 ) ) ( not ( = ?auto_779036 ?auto_779042 ) ) ( not ( = ?auto_779036 ?auto_779043 ) ) ( not ( = ?auto_779036 ?auto_779044 ) ) ( not ( = ?auto_779036 ?auto_779045 ) ) ( not ( = ?auto_779036 ?auto_779046 ) ) ( not ( = ?auto_779036 ?auto_779047 ) ) ( not ( = ?auto_779036 ?auto_779048 ) ) ( not ( = ?auto_779036 ?auto_779049 ) ) ( not ( = ?auto_779036 ?auto_779050 ) ) ( not ( = ?auto_779037 ?auto_779038 ) ) ( not ( = ?auto_779037 ?auto_779039 ) ) ( not ( = ?auto_779037 ?auto_779040 ) ) ( not ( = ?auto_779037 ?auto_779041 ) ) ( not ( = ?auto_779037 ?auto_779042 ) ) ( not ( = ?auto_779037 ?auto_779043 ) ) ( not ( = ?auto_779037 ?auto_779044 ) ) ( not ( = ?auto_779037 ?auto_779045 ) ) ( not ( = ?auto_779037 ?auto_779046 ) ) ( not ( = ?auto_779037 ?auto_779047 ) ) ( not ( = ?auto_779037 ?auto_779048 ) ) ( not ( = ?auto_779037 ?auto_779049 ) ) ( not ( = ?auto_779037 ?auto_779050 ) ) ( not ( = ?auto_779038 ?auto_779039 ) ) ( not ( = ?auto_779038 ?auto_779040 ) ) ( not ( = ?auto_779038 ?auto_779041 ) ) ( not ( = ?auto_779038 ?auto_779042 ) ) ( not ( = ?auto_779038 ?auto_779043 ) ) ( not ( = ?auto_779038 ?auto_779044 ) ) ( not ( = ?auto_779038 ?auto_779045 ) ) ( not ( = ?auto_779038 ?auto_779046 ) ) ( not ( = ?auto_779038 ?auto_779047 ) ) ( not ( = ?auto_779038 ?auto_779048 ) ) ( not ( = ?auto_779038 ?auto_779049 ) ) ( not ( = ?auto_779038 ?auto_779050 ) ) ( not ( = ?auto_779039 ?auto_779040 ) ) ( not ( = ?auto_779039 ?auto_779041 ) ) ( not ( = ?auto_779039 ?auto_779042 ) ) ( not ( = ?auto_779039 ?auto_779043 ) ) ( not ( = ?auto_779039 ?auto_779044 ) ) ( not ( = ?auto_779039 ?auto_779045 ) ) ( not ( = ?auto_779039 ?auto_779046 ) ) ( not ( = ?auto_779039 ?auto_779047 ) ) ( not ( = ?auto_779039 ?auto_779048 ) ) ( not ( = ?auto_779039 ?auto_779049 ) ) ( not ( = ?auto_779039 ?auto_779050 ) ) ( not ( = ?auto_779040 ?auto_779041 ) ) ( not ( = ?auto_779040 ?auto_779042 ) ) ( not ( = ?auto_779040 ?auto_779043 ) ) ( not ( = ?auto_779040 ?auto_779044 ) ) ( not ( = ?auto_779040 ?auto_779045 ) ) ( not ( = ?auto_779040 ?auto_779046 ) ) ( not ( = ?auto_779040 ?auto_779047 ) ) ( not ( = ?auto_779040 ?auto_779048 ) ) ( not ( = ?auto_779040 ?auto_779049 ) ) ( not ( = ?auto_779040 ?auto_779050 ) ) ( not ( = ?auto_779041 ?auto_779042 ) ) ( not ( = ?auto_779041 ?auto_779043 ) ) ( not ( = ?auto_779041 ?auto_779044 ) ) ( not ( = ?auto_779041 ?auto_779045 ) ) ( not ( = ?auto_779041 ?auto_779046 ) ) ( not ( = ?auto_779041 ?auto_779047 ) ) ( not ( = ?auto_779041 ?auto_779048 ) ) ( not ( = ?auto_779041 ?auto_779049 ) ) ( not ( = ?auto_779041 ?auto_779050 ) ) ( not ( = ?auto_779042 ?auto_779043 ) ) ( not ( = ?auto_779042 ?auto_779044 ) ) ( not ( = ?auto_779042 ?auto_779045 ) ) ( not ( = ?auto_779042 ?auto_779046 ) ) ( not ( = ?auto_779042 ?auto_779047 ) ) ( not ( = ?auto_779042 ?auto_779048 ) ) ( not ( = ?auto_779042 ?auto_779049 ) ) ( not ( = ?auto_779042 ?auto_779050 ) ) ( not ( = ?auto_779043 ?auto_779044 ) ) ( not ( = ?auto_779043 ?auto_779045 ) ) ( not ( = ?auto_779043 ?auto_779046 ) ) ( not ( = ?auto_779043 ?auto_779047 ) ) ( not ( = ?auto_779043 ?auto_779048 ) ) ( not ( = ?auto_779043 ?auto_779049 ) ) ( not ( = ?auto_779043 ?auto_779050 ) ) ( not ( = ?auto_779044 ?auto_779045 ) ) ( not ( = ?auto_779044 ?auto_779046 ) ) ( not ( = ?auto_779044 ?auto_779047 ) ) ( not ( = ?auto_779044 ?auto_779048 ) ) ( not ( = ?auto_779044 ?auto_779049 ) ) ( not ( = ?auto_779044 ?auto_779050 ) ) ( not ( = ?auto_779045 ?auto_779046 ) ) ( not ( = ?auto_779045 ?auto_779047 ) ) ( not ( = ?auto_779045 ?auto_779048 ) ) ( not ( = ?auto_779045 ?auto_779049 ) ) ( not ( = ?auto_779045 ?auto_779050 ) ) ( not ( = ?auto_779046 ?auto_779047 ) ) ( not ( = ?auto_779046 ?auto_779048 ) ) ( not ( = ?auto_779046 ?auto_779049 ) ) ( not ( = ?auto_779046 ?auto_779050 ) ) ( not ( = ?auto_779047 ?auto_779048 ) ) ( not ( = ?auto_779047 ?auto_779049 ) ) ( not ( = ?auto_779047 ?auto_779050 ) ) ( not ( = ?auto_779048 ?auto_779049 ) ) ( not ( = ?auto_779048 ?auto_779050 ) ) ( not ( = ?auto_779049 ?auto_779050 ) ) ( ON ?auto_779048 ?auto_779049 ) ( ON ?auto_779047 ?auto_779048 ) ( ON ?auto_779046 ?auto_779047 ) ( ON ?auto_779045 ?auto_779046 ) ( ON ?auto_779044 ?auto_779045 ) ( ON ?auto_779043 ?auto_779044 ) ( ON ?auto_779042 ?auto_779043 ) ( ON ?auto_779041 ?auto_779042 ) ( ON ?auto_779040 ?auto_779041 ) ( ON ?auto_779039 ?auto_779040 ) ( ON ?auto_779038 ?auto_779039 ) ( CLEAR ?auto_779036 ) ( ON ?auto_779037 ?auto_779038 ) ( CLEAR ?auto_779037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_779036 ?auto_779037 )
      ( MAKE-14PILE ?auto_779036 ?auto_779037 ?auto_779038 ?auto_779039 ?auto_779040 ?auto_779041 ?auto_779042 ?auto_779043 ?auto_779044 ?auto_779045 ?auto_779046 ?auto_779047 ?auto_779048 ?auto_779049 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_779094 - BLOCK
      ?auto_779095 - BLOCK
      ?auto_779096 - BLOCK
      ?auto_779097 - BLOCK
      ?auto_779098 - BLOCK
      ?auto_779099 - BLOCK
      ?auto_779100 - BLOCK
      ?auto_779101 - BLOCK
      ?auto_779102 - BLOCK
      ?auto_779103 - BLOCK
      ?auto_779104 - BLOCK
      ?auto_779105 - BLOCK
      ?auto_779106 - BLOCK
      ?auto_779107 - BLOCK
    )
    :vars
    (
      ?auto_779108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_779107 ?auto_779108 ) ( not ( = ?auto_779094 ?auto_779095 ) ) ( not ( = ?auto_779094 ?auto_779096 ) ) ( not ( = ?auto_779094 ?auto_779097 ) ) ( not ( = ?auto_779094 ?auto_779098 ) ) ( not ( = ?auto_779094 ?auto_779099 ) ) ( not ( = ?auto_779094 ?auto_779100 ) ) ( not ( = ?auto_779094 ?auto_779101 ) ) ( not ( = ?auto_779094 ?auto_779102 ) ) ( not ( = ?auto_779094 ?auto_779103 ) ) ( not ( = ?auto_779094 ?auto_779104 ) ) ( not ( = ?auto_779094 ?auto_779105 ) ) ( not ( = ?auto_779094 ?auto_779106 ) ) ( not ( = ?auto_779094 ?auto_779107 ) ) ( not ( = ?auto_779094 ?auto_779108 ) ) ( not ( = ?auto_779095 ?auto_779096 ) ) ( not ( = ?auto_779095 ?auto_779097 ) ) ( not ( = ?auto_779095 ?auto_779098 ) ) ( not ( = ?auto_779095 ?auto_779099 ) ) ( not ( = ?auto_779095 ?auto_779100 ) ) ( not ( = ?auto_779095 ?auto_779101 ) ) ( not ( = ?auto_779095 ?auto_779102 ) ) ( not ( = ?auto_779095 ?auto_779103 ) ) ( not ( = ?auto_779095 ?auto_779104 ) ) ( not ( = ?auto_779095 ?auto_779105 ) ) ( not ( = ?auto_779095 ?auto_779106 ) ) ( not ( = ?auto_779095 ?auto_779107 ) ) ( not ( = ?auto_779095 ?auto_779108 ) ) ( not ( = ?auto_779096 ?auto_779097 ) ) ( not ( = ?auto_779096 ?auto_779098 ) ) ( not ( = ?auto_779096 ?auto_779099 ) ) ( not ( = ?auto_779096 ?auto_779100 ) ) ( not ( = ?auto_779096 ?auto_779101 ) ) ( not ( = ?auto_779096 ?auto_779102 ) ) ( not ( = ?auto_779096 ?auto_779103 ) ) ( not ( = ?auto_779096 ?auto_779104 ) ) ( not ( = ?auto_779096 ?auto_779105 ) ) ( not ( = ?auto_779096 ?auto_779106 ) ) ( not ( = ?auto_779096 ?auto_779107 ) ) ( not ( = ?auto_779096 ?auto_779108 ) ) ( not ( = ?auto_779097 ?auto_779098 ) ) ( not ( = ?auto_779097 ?auto_779099 ) ) ( not ( = ?auto_779097 ?auto_779100 ) ) ( not ( = ?auto_779097 ?auto_779101 ) ) ( not ( = ?auto_779097 ?auto_779102 ) ) ( not ( = ?auto_779097 ?auto_779103 ) ) ( not ( = ?auto_779097 ?auto_779104 ) ) ( not ( = ?auto_779097 ?auto_779105 ) ) ( not ( = ?auto_779097 ?auto_779106 ) ) ( not ( = ?auto_779097 ?auto_779107 ) ) ( not ( = ?auto_779097 ?auto_779108 ) ) ( not ( = ?auto_779098 ?auto_779099 ) ) ( not ( = ?auto_779098 ?auto_779100 ) ) ( not ( = ?auto_779098 ?auto_779101 ) ) ( not ( = ?auto_779098 ?auto_779102 ) ) ( not ( = ?auto_779098 ?auto_779103 ) ) ( not ( = ?auto_779098 ?auto_779104 ) ) ( not ( = ?auto_779098 ?auto_779105 ) ) ( not ( = ?auto_779098 ?auto_779106 ) ) ( not ( = ?auto_779098 ?auto_779107 ) ) ( not ( = ?auto_779098 ?auto_779108 ) ) ( not ( = ?auto_779099 ?auto_779100 ) ) ( not ( = ?auto_779099 ?auto_779101 ) ) ( not ( = ?auto_779099 ?auto_779102 ) ) ( not ( = ?auto_779099 ?auto_779103 ) ) ( not ( = ?auto_779099 ?auto_779104 ) ) ( not ( = ?auto_779099 ?auto_779105 ) ) ( not ( = ?auto_779099 ?auto_779106 ) ) ( not ( = ?auto_779099 ?auto_779107 ) ) ( not ( = ?auto_779099 ?auto_779108 ) ) ( not ( = ?auto_779100 ?auto_779101 ) ) ( not ( = ?auto_779100 ?auto_779102 ) ) ( not ( = ?auto_779100 ?auto_779103 ) ) ( not ( = ?auto_779100 ?auto_779104 ) ) ( not ( = ?auto_779100 ?auto_779105 ) ) ( not ( = ?auto_779100 ?auto_779106 ) ) ( not ( = ?auto_779100 ?auto_779107 ) ) ( not ( = ?auto_779100 ?auto_779108 ) ) ( not ( = ?auto_779101 ?auto_779102 ) ) ( not ( = ?auto_779101 ?auto_779103 ) ) ( not ( = ?auto_779101 ?auto_779104 ) ) ( not ( = ?auto_779101 ?auto_779105 ) ) ( not ( = ?auto_779101 ?auto_779106 ) ) ( not ( = ?auto_779101 ?auto_779107 ) ) ( not ( = ?auto_779101 ?auto_779108 ) ) ( not ( = ?auto_779102 ?auto_779103 ) ) ( not ( = ?auto_779102 ?auto_779104 ) ) ( not ( = ?auto_779102 ?auto_779105 ) ) ( not ( = ?auto_779102 ?auto_779106 ) ) ( not ( = ?auto_779102 ?auto_779107 ) ) ( not ( = ?auto_779102 ?auto_779108 ) ) ( not ( = ?auto_779103 ?auto_779104 ) ) ( not ( = ?auto_779103 ?auto_779105 ) ) ( not ( = ?auto_779103 ?auto_779106 ) ) ( not ( = ?auto_779103 ?auto_779107 ) ) ( not ( = ?auto_779103 ?auto_779108 ) ) ( not ( = ?auto_779104 ?auto_779105 ) ) ( not ( = ?auto_779104 ?auto_779106 ) ) ( not ( = ?auto_779104 ?auto_779107 ) ) ( not ( = ?auto_779104 ?auto_779108 ) ) ( not ( = ?auto_779105 ?auto_779106 ) ) ( not ( = ?auto_779105 ?auto_779107 ) ) ( not ( = ?auto_779105 ?auto_779108 ) ) ( not ( = ?auto_779106 ?auto_779107 ) ) ( not ( = ?auto_779106 ?auto_779108 ) ) ( not ( = ?auto_779107 ?auto_779108 ) ) ( ON ?auto_779106 ?auto_779107 ) ( ON ?auto_779105 ?auto_779106 ) ( ON ?auto_779104 ?auto_779105 ) ( ON ?auto_779103 ?auto_779104 ) ( ON ?auto_779102 ?auto_779103 ) ( ON ?auto_779101 ?auto_779102 ) ( ON ?auto_779100 ?auto_779101 ) ( ON ?auto_779099 ?auto_779100 ) ( ON ?auto_779098 ?auto_779099 ) ( ON ?auto_779097 ?auto_779098 ) ( ON ?auto_779096 ?auto_779097 ) ( ON ?auto_779095 ?auto_779096 ) ( ON ?auto_779094 ?auto_779095 ) ( CLEAR ?auto_779094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_779094 )
      ( MAKE-14PILE ?auto_779094 ?auto_779095 ?auto_779096 ?auto_779097 ?auto_779098 ?auto_779099 ?auto_779100 ?auto_779101 ?auto_779102 ?auto_779103 ?auto_779104 ?auto_779105 ?auto_779106 ?auto_779107 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_779153 - BLOCK
      ?auto_779154 - BLOCK
      ?auto_779155 - BLOCK
      ?auto_779156 - BLOCK
      ?auto_779157 - BLOCK
      ?auto_779158 - BLOCK
      ?auto_779159 - BLOCK
      ?auto_779160 - BLOCK
      ?auto_779161 - BLOCK
      ?auto_779162 - BLOCK
      ?auto_779163 - BLOCK
      ?auto_779164 - BLOCK
      ?auto_779165 - BLOCK
      ?auto_779166 - BLOCK
      ?auto_779167 - BLOCK
    )
    :vars
    (
      ?auto_779168 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_779166 ) ( ON ?auto_779167 ?auto_779168 ) ( CLEAR ?auto_779167 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_779153 ) ( ON ?auto_779154 ?auto_779153 ) ( ON ?auto_779155 ?auto_779154 ) ( ON ?auto_779156 ?auto_779155 ) ( ON ?auto_779157 ?auto_779156 ) ( ON ?auto_779158 ?auto_779157 ) ( ON ?auto_779159 ?auto_779158 ) ( ON ?auto_779160 ?auto_779159 ) ( ON ?auto_779161 ?auto_779160 ) ( ON ?auto_779162 ?auto_779161 ) ( ON ?auto_779163 ?auto_779162 ) ( ON ?auto_779164 ?auto_779163 ) ( ON ?auto_779165 ?auto_779164 ) ( ON ?auto_779166 ?auto_779165 ) ( not ( = ?auto_779153 ?auto_779154 ) ) ( not ( = ?auto_779153 ?auto_779155 ) ) ( not ( = ?auto_779153 ?auto_779156 ) ) ( not ( = ?auto_779153 ?auto_779157 ) ) ( not ( = ?auto_779153 ?auto_779158 ) ) ( not ( = ?auto_779153 ?auto_779159 ) ) ( not ( = ?auto_779153 ?auto_779160 ) ) ( not ( = ?auto_779153 ?auto_779161 ) ) ( not ( = ?auto_779153 ?auto_779162 ) ) ( not ( = ?auto_779153 ?auto_779163 ) ) ( not ( = ?auto_779153 ?auto_779164 ) ) ( not ( = ?auto_779153 ?auto_779165 ) ) ( not ( = ?auto_779153 ?auto_779166 ) ) ( not ( = ?auto_779153 ?auto_779167 ) ) ( not ( = ?auto_779153 ?auto_779168 ) ) ( not ( = ?auto_779154 ?auto_779155 ) ) ( not ( = ?auto_779154 ?auto_779156 ) ) ( not ( = ?auto_779154 ?auto_779157 ) ) ( not ( = ?auto_779154 ?auto_779158 ) ) ( not ( = ?auto_779154 ?auto_779159 ) ) ( not ( = ?auto_779154 ?auto_779160 ) ) ( not ( = ?auto_779154 ?auto_779161 ) ) ( not ( = ?auto_779154 ?auto_779162 ) ) ( not ( = ?auto_779154 ?auto_779163 ) ) ( not ( = ?auto_779154 ?auto_779164 ) ) ( not ( = ?auto_779154 ?auto_779165 ) ) ( not ( = ?auto_779154 ?auto_779166 ) ) ( not ( = ?auto_779154 ?auto_779167 ) ) ( not ( = ?auto_779154 ?auto_779168 ) ) ( not ( = ?auto_779155 ?auto_779156 ) ) ( not ( = ?auto_779155 ?auto_779157 ) ) ( not ( = ?auto_779155 ?auto_779158 ) ) ( not ( = ?auto_779155 ?auto_779159 ) ) ( not ( = ?auto_779155 ?auto_779160 ) ) ( not ( = ?auto_779155 ?auto_779161 ) ) ( not ( = ?auto_779155 ?auto_779162 ) ) ( not ( = ?auto_779155 ?auto_779163 ) ) ( not ( = ?auto_779155 ?auto_779164 ) ) ( not ( = ?auto_779155 ?auto_779165 ) ) ( not ( = ?auto_779155 ?auto_779166 ) ) ( not ( = ?auto_779155 ?auto_779167 ) ) ( not ( = ?auto_779155 ?auto_779168 ) ) ( not ( = ?auto_779156 ?auto_779157 ) ) ( not ( = ?auto_779156 ?auto_779158 ) ) ( not ( = ?auto_779156 ?auto_779159 ) ) ( not ( = ?auto_779156 ?auto_779160 ) ) ( not ( = ?auto_779156 ?auto_779161 ) ) ( not ( = ?auto_779156 ?auto_779162 ) ) ( not ( = ?auto_779156 ?auto_779163 ) ) ( not ( = ?auto_779156 ?auto_779164 ) ) ( not ( = ?auto_779156 ?auto_779165 ) ) ( not ( = ?auto_779156 ?auto_779166 ) ) ( not ( = ?auto_779156 ?auto_779167 ) ) ( not ( = ?auto_779156 ?auto_779168 ) ) ( not ( = ?auto_779157 ?auto_779158 ) ) ( not ( = ?auto_779157 ?auto_779159 ) ) ( not ( = ?auto_779157 ?auto_779160 ) ) ( not ( = ?auto_779157 ?auto_779161 ) ) ( not ( = ?auto_779157 ?auto_779162 ) ) ( not ( = ?auto_779157 ?auto_779163 ) ) ( not ( = ?auto_779157 ?auto_779164 ) ) ( not ( = ?auto_779157 ?auto_779165 ) ) ( not ( = ?auto_779157 ?auto_779166 ) ) ( not ( = ?auto_779157 ?auto_779167 ) ) ( not ( = ?auto_779157 ?auto_779168 ) ) ( not ( = ?auto_779158 ?auto_779159 ) ) ( not ( = ?auto_779158 ?auto_779160 ) ) ( not ( = ?auto_779158 ?auto_779161 ) ) ( not ( = ?auto_779158 ?auto_779162 ) ) ( not ( = ?auto_779158 ?auto_779163 ) ) ( not ( = ?auto_779158 ?auto_779164 ) ) ( not ( = ?auto_779158 ?auto_779165 ) ) ( not ( = ?auto_779158 ?auto_779166 ) ) ( not ( = ?auto_779158 ?auto_779167 ) ) ( not ( = ?auto_779158 ?auto_779168 ) ) ( not ( = ?auto_779159 ?auto_779160 ) ) ( not ( = ?auto_779159 ?auto_779161 ) ) ( not ( = ?auto_779159 ?auto_779162 ) ) ( not ( = ?auto_779159 ?auto_779163 ) ) ( not ( = ?auto_779159 ?auto_779164 ) ) ( not ( = ?auto_779159 ?auto_779165 ) ) ( not ( = ?auto_779159 ?auto_779166 ) ) ( not ( = ?auto_779159 ?auto_779167 ) ) ( not ( = ?auto_779159 ?auto_779168 ) ) ( not ( = ?auto_779160 ?auto_779161 ) ) ( not ( = ?auto_779160 ?auto_779162 ) ) ( not ( = ?auto_779160 ?auto_779163 ) ) ( not ( = ?auto_779160 ?auto_779164 ) ) ( not ( = ?auto_779160 ?auto_779165 ) ) ( not ( = ?auto_779160 ?auto_779166 ) ) ( not ( = ?auto_779160 ?auto_779167 ) ) ( not ( = ?auto_779160 ?auto_779168 ) ) ( not ( = ?auto_779161 ?auto_779162 ) ) ( not ( = ?auto_779161 ?auto_779163 ) ) ( not ( = ?auto_779161 ?auto_779164 ) ) ( not ( = ?auto_779161 ?auto_779165 ) ) ( not ( = ?auto_779161 ?auto_779166 ) ) ( not ( = ?auto_779161 ?auto_779167 ) ) ( not ( = ?auto_779161 ?auto_779168 ) ) ( not ( = ?auto_779162 ?auto_779163 ) ) ( not ( = ?auto_779162 ?auto_779164 ) ) ( not ( = ?auto_779162 ?auto_779165 ) ) ( not ( = ?auto_779162 ?auto_779166 ) ) ( not ( = ?auto_779162 ?auto_779167 ) ) ( not ( = ?auto_779162 ?auto_779168 ) ) ( not ( = ?auto_779163 ?auto_779164 ) ) ( not ( = ?auto_779163 ?auto_779165 ) ) ( not ( = ?auto_779163 ?auto_779166 ) ) ( not ( = ?auto_779163 ?auto_779167 ) ) ( not ( = ?auto_779163 ?auto_779168 ) ) ( not ( = ?auto_779164 ?auto_779165 ) ) ( not ( = ?auto_779164 ?auto_779166 ) ) ( not ( = ?auto_779164 ?auto_779167 ) ) ( not ( = ?auto_779164 ?auto_779168 ) ) ( not ( = ?auto_779165 ?auto_779166 ) ) ( not ( = ?auto_779165 ?auto_779167 ) ) ( not ( = ?auto_779165 ?auto_779168 ) ) ( not ( = ?auto_779166 ?auto_779167 ) ) ( not ( = ?auto_779166 ?auto_779168 ) ) ( not ( = ?auto_779167 ?auto_779168 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_779167 ?auto_779168 )
      ( !STACK ?auto_779167 ?auto_779166 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_779215 - BLOCK
      ?auto_779216 - BLOCK
      ?auto_779217 - BLOCK
      ?auto_779218 - BLOCK
      ?auto_779219 - BLOCK
      ?auto_779220 - BLOCK
      ?auto_779221 - BLOCK
      ?auto_779222 - BLOCK
      ?auto_779223 - BLOCK
      ?auto_779224 - BLOCK
      ?auto_779225 - BLOCK
      ?auto_779226 - BLOCK
      ?auto_779227 - BLOCK
      ?auto_779228 - BLOCK
      ?auto_779229 - BLOCK
    )
    :vars
    (
      ?auto_779230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_779229 ?auto_779230 ) ( ON-TABLE ?auto_779215 ) ( ON ?auto_779216 ?auto_779215 ) ( ON ?auto_779217 ?auto_779216 ) ( ON ?auto_779218 ?auto_779217 ) ( ON ?auto_779219 ?auto_779218 ) ( ON ?auto_779220 ?auto_779219 ) ( ON ?auto_779221 ?auto_779220 ) ( ON ?auto_779222 ?auto_779221 ) ( ON ?auto_779223 ?auto_779222 ) ( ON ?auto_779224 ?auto_779223 ) ( ON ?auto_779225 ?auto_779224 ) ( ON ?auto_779226 ?auto_779225 ) ( ON ?auto_779227 ?auto_779226 ) ( not ( = ?auto_779215 ?auto_779216 ) ) ( not ( = ?auto_779215 ?auto_779217 ) ) ( not ( = ?auto_779215 ?auto_779218 ) ) ( not ( = ?auto_779215 ?auto_779219 ) ) ( not ( = ?auto_779215 ?auto_779220 ) ) ( not ( = ?auto_779215 ?auto_779221 ) ) ( not ( = ?auto_779215 ?auto_779222 ) ) ( not ( = ?auto_779215 ?auto_779223 ) ) ( not ( = ?auto_779215 ?auto_779224 ) ) ( not ( = ?auto_779215 ?auto_779225 ) ) ( not ( = ?auto_779215 ?auto_779226 ) ) ( not ( = ?auto_779215 ?auto_779227 ) ) ( not ( = ?auto_779215 ?auto_779228 ) ) ( not ( = ?auto_779215 ?auto_779229 ) ) ( not ( = ?auto_779215 ?auto_779230 ) ) ( not ( = ?auto_779216 ?auto_779217 ) ) ( not ( = ?auto_779216 ?auto_779218 ) ) ( not ( = ?auto_779216 ?auto_779219 ) ) ( not ( = ?auto_779216 ?auto_779220 ) ) ( not ( = ?auto_779216 ?auto_779221 ) ) ( not ( = ?auto_779216 ?auto_779222 ) ) ( not ( = ?auto_779216 ?auto_779223 ) ) ( not ( = ?auto_779216 ?auto_779224 ) ) ( not ( = ?auto_779216 ?auto_779225 ) ) ( not ( = ?auto_779216 ?auto_779226 ) ) ( not ( = ?auto_779216 ?auto_779227 ) ) ( not ( = ?auto_779216 ?auto_779228 ) ) ( not ( = ?auto_779216 ?auto_779229 ) ) ( not ( = ?auto_779216 ?auto_779230 ) ) ( not ( = ?auto_779217 ?auto_779218 ) ) ( not ( = ?auto_779217 ?auto_779219 ) ) ( not ( = ?auto_779217 ?auto_779220 ) ) ( not ( = ?auto_779217 ?auto_779221 ) ) ( not ( = ?auto_779217 ?auto_779222 ) ) ( not ( = ?auto_779217 ?auto_779223 ) ) ( not ( = ?auto_779217 ?auto_779224 ) ) ( not ( = ?auto_779217 ?auto_779225 ) ) ( not ( = ?auto_779217 ?auto_779226 ) ) ( not ( = ?auto_779217 ?auto_779227 ) ) ( not ( = ?auto_779217 ?auto_779228 ) ) ( not ( = ?auto_779217 ?auto_779229 ) ) ( not ( = ?auto_779217 ?auto_779230 ) ) ( not ( = ?auto_779218 ?auto_779219 ) ) ( not ( = ?auto_779218 ?auto_779220 ) ) ( not ( = ?auto_779218 ?auto_779221 ) ) ( not ( = ?auto_779218 ?auto_779222 ) ) ( not ( = ?auto_779218 ?auto_779223 ) ) ( not ( = ?auto_779218 ?auto_779224 ) ) ( not ( = ?auto_779218 ?auto_779225 ) ) ( not ( = ?auto_779218 ?auto_779226 ) ) ( not ( = ?auto_779218 ?auto_779227 ) ) ( not ( = ?auto_779218 ?auto_779228 ) ) ( not ( = ?auto_779218 ?auto_779229 ) ) ( not ( = ?auto_779218 ?auto_779230 ) ) ( not ( = ?auto_779219 ?auto_779220 ) ) ( not ( = ?auto_779219 ?auto_779221 ) ) ( not ( = ?auto_779219 ?auto_779222 ) ) ( not ( = ?auto_779219 ?auto_779223 ) ) ( not ( = ?auto_779219 ?auto_779224 ) ) ( not ( = ?auto_779219 ?auto_779225 ) ) ( not ( = ?auto_779219 ?auto_779226 ) ) ( not ( = ?auto_779219 ?auto_779227 ) ) ( not ( = ?auto_779219 ?auto_779228 ) ) ( not ( = ?auto_779219 ?auto_779229 ) ) ( not ( = ?auto_779219 ?auto_779230 ) ) ( not ( = ?auto_779220 ?auto_779221 ) ) ( not ( = ?auto_779220 ?auto_779222 ) ) ( not ( = ?auto_779220 ?auto_779223 ) ) ( not ( = ?auto_779220 ?auto_779224 ) ) ( not ( = ?auto_779220 ?auto_779225 ) ) ( not ( = ?auto_779220 ?auto_779226 ) ) ( not ( = ?auto_779220 ?auto_779227 ) ) ( not ( = ?auto_779220 ?auto_779228 ) ) ( not ( = ?auto_779220 ?auto_779229 ) ) ( not ( = ?auto_779220 ?auto_779230 ) ) ( not ( = ?auto_779221 ?auto_779222 ) ) ( not ( = ?auto_779221 ?auto_779223 ) ) ( not ( = ?auto_779221 ?auto_779224 ) ) ( not ( = ?auto_779221 ?auto_779225 ) ) ( not ( = ?auto_779221 ?auto_779226 ) ) ( not ( = ?auto_779221 ?auto_779227 ) ) ( not ( = ?auto_779221 ?auto_779228 ) ) ( not ( = ?auto_779221 ?auto_779229 ) ) ( not ( = ?auto_779221 ?auto_779230 ) ) ( not ( = ?auto_779222 ?auto_779223 ) ) ( not ( = ?auto_779222 ?auto_779224 ) ) ( not ( = ?auto_779222 ?auto_779225 ) ) ( not ( = ?auto_779222 ?auto_779226 ) ) ( not ( = ?auto_779222 ?auto_779227 ) ) ( not ( = ?auto_779222 ?auto_779228 ) ) ( not ( = ?auto_779222 ?auto_779229 ) ) ( not ( = ?auto_779222 ?auto_779230 ) ) ( not ( = ?auto_779223 ?auto_779224 ) ) ( not ( = ?auto_779223 ?auto_779225 ) ) ( not ( = ?auto_779223 ?auto_779226 ) ) ( not ( = ?auto_779223 ?auto_779227 ) ) ( not ( = ?auto_779223 ?auto_779228 ) ) ( not ( = ?auto_779223 ?auto_779229 ) ) ( not ( = ?auto_779223 ?auto_779230 ) ) ( not ( = ?auto_779224 ?auto_779225 ) ) ( not ( = ?auto_779224 ?auto_779226 ) ) ( not ( = ?auto_779224 ?auto_779227 ) ) ( not ( = ?auto_779224 ?auto_779228 ) ) ( not ( = ?auto_779224 ?auto_779229 ) ) ( not ( = ?auto_779224 ?auto_779230 ) ) ( not ( = ?auto_779225 ?auto_779226 ) ) ( not ( = ?auto_779225 ?auto_779227 ) ) ( not ( = ?auto_779225 ?auto_779228 ) ) ( not ( = ?auto_779225 ?auto_779229 ) ) ( not ( = ?auto_779225 ?auto_779230 ) ) ( not ( = ?auto_779226 ?auto_779227 ) ) ( not ( = ?auto_779226 ?auto_779228 ) ) ( not ( = ?auto_779226 ?auto_779229 ) ) ( not ( = ?auto_779226 ?auto_779230 ) ) ( not ( = ?auto_779227 ?auto_779228 ) ) ( not ( = ?auto_779227 ?auto_779229 ) ) ( not ( = ?auto_779227 ?auto_779230 ) ) ( not ( = ?auto_779228 ?auto_779229 ) ) ( not ( = ?auto_779228 ?auto_779230 ) ) ( not ( = ?auto_779229 ?auto_779230 ) ) ( CLEAR ?auto_779227 ) ( ON ?auto_779228 ?auto_779229 ) ( CLEAR ?auto_779228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_779215 ?auto_779216 ?auto_779217 ?auto_779218 ?auto_779219 ?auto_779220 ?auto_779221 ?auto_779222 ?auto_779223 ?auto_779224 ?auto_779225 ?auto_779226 ?auto_779227 ?auto_779228 )
      ( MAKE-15PILE ?auto_779215 ?auto_779216 ?auto_779217 ?auto_779218 ?auto_779219 ?auto_779220 ?auto_779221 ?auto_779222 ?auto_779223 ?auto_779224 ?auto_779225 ?auto_779226 ?auto_779227 ?auto_779228 ?auto_779229 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_779277 - BLOCK
      ?auto_779278 - BLOCK
      ?auto_779279 - BLOCK
      ?auto_779280 - BLOCK
      ?auto_779281 - BLOCK
      ?auto_779282 - BLOCK
      ?auto_779283 - BLOCK
      ?auto_779284 - BLOCK
      ?auto_779285 - BLOCK
      ?auto_779286 - BLOCK
      ?auto_779287 - BLOCK
      ?auto_779288 - BLOCK
      ?auto_779289 - BLOCK
      ?auto_779290 - BLOCK
      ?auto_779291 - BLOCK
    )
    :vars
    (
      ?auto_779292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_779291 ?auto_779292 ) ( ON-TABLE ?auto_779277 ) ( ON ?auto_779278 ?auto_779277 ) ( ON ?auto_779279 ?auto_779278 ) ( ON ?auto_779280 ?auto_779279 ) ( ON ?auto_779281 ?auto_779280 ) ( ON ?auto_779282 ?auto_779281 ) ( ON ?auto_779283 ?auto_779282 ) ( ON ?auto_779284 ?auto_779283 ) ( ON ?auto_779285 ?auto_779284 ) ( ON ?auto_779286 ?auto_779285 ) ( ON ?auto_779287 ?auto_779286 ) ( ON ?auto_779288 ?auto_779287 ) ( not ( = ?auto_779277 ?auto_779278 ) ) ( not ( = ?auto_779277 ?auto_779279 ) ) ( not ( = ?auto_779277 ?auto_779280 ) ) ( not ( = ?auto_779277 ?auto_779281 ) ) ( not ( = ?auto_779277 ?auto_779282 ) ) ( not ( = ?auto_779277 ?auto_779283 ) ) ( not ( = ?auto_779277 ?auto_779284 ) ) ( not ( = ?auto_779277 ?auto_779285 ) ) ( not ( = ?auto_779277 ?auto_779286 ) ) ( not ( = ?auto_779277 ?auto_779287 ) ) ( not ( = ?auto_779277 ?auto_779288 ) ) ( not ( = ?auto_779277 ?auto_779289 ) ) ( not ( = ?auto_779277 ?auto_779290 ) ) ( not ( = ?auto_779277 ?auto_779291 ) ) ( not ( = ?auto_779277 ?auto_779292 ) ) ( not ( = ?auto_779278 ?auto_779279 ) ) ( not ( = ?auto_779278 ?auto_779280 ) ) ( not ( = ?auto_779278 ?auto_779281 ) ) ( not ( = ?auto_779278 ?auto_779282 ) ) ( not ( = ?auto_779278 ?auto_779283 ) ) ( not ( = ?auto_779278 ?auto_779284 ) ) ( not ( = ?auto_779278 ?auto_779285 ) ) ( not ( = ?auto_779278 ?auto_779286 ) ) ( not ( = ?auto_779278 ?auto_779287 ) ) ( not ( = ?auto_779278 ?auto_779288 ) ) ( not ( = ?auto_779278 ?auto_779289 ) ) ( not ( = ?auto_779278 ?auto_779290 ) ) ( not ( = ?auto_779278 ?auto_779291 ) ) ( not ( = ?auto_779278 ?auto_779292 ) ) ( not ( = ?auto_779279 ?auto_779280 ) ) ( not ( = ?auto_779279 ?auto_779281 ) ) ( not ( = ?auto_779279 ?auto_779282 ) ) ( not ( = ?auto_779279 ?auto_779283 ) ) ( not ( = ?auto_779279 ?auto_779284 ) ) ( not ( = ?auto_779279 ?auto_779285 ) ) ( not ( = ?auto_779279 ?auto_779286 ) ) ( not ( = ?auto_779279 ?auto_779287 ) ) ( not ( = ?auto_779279 ?auto_779288 ) ) ( not ( = ?auto_779279 ?auto_779289 ) ) ( not ( = ?auto_779279 ?auto_779290 ) ) ( not ( = ?auto_779279 ?auto_779291 ) ) ( not ( = ?auto_779279 ?auto_779292 ) ) ( not ( = ?auto_779280 ?auto_779281 ) ) ( not ( = ?auto_779280 ?auto_779282 ) ) ( not ( = ?auto_779280 ?auto_779283 ) ) ( not ( = ?auto_779280 ?auto_779284 ) ) ( not ( = ?auto_779280 ?auto_779285 ) ) ( not ( = ?auto_779280 ?auto_779286 ) ) ( not ( = ?auto_779280 ?auto_779287 ) ) ( not ( = ?auto_779280 ?auto_779288 ) ) ( not ( = ?auto_779280 ?auto_779289 ) ) ( not ( = ?auto_779280 ?auto_779290 ) ) ( not ( = ?auto_779280 ?auto_779291 ) ) ( not ( = ?auto_779280 ?auto_779292 ) ) ( not ( = ?auto_779281 ?auto_779282 ) ) ( not ( = ?auto_779281 ?auto_779283 ) ) ( not ( = ?auto_779281 ?auto_779284 ) ) ( not ( = ?auto_779281 ?auto_779285 ) ) ( not ( = ?auto_779281 ?auto_779286 ) ) ( not ( = ?auto_779281 ?auto_779287 ) ) ( not ( = ?auto_779281 ?auto_779288 ) ) ( not ( = ?auto_779281 ?auto_779289 ) ) ( not ( = ?auto_779281 ?auto_779290 ) ) ( not ( = ?auto_779281 ?auto_779291 ) ) ( not ( = ?auto_779281 ?auto_779292 ) ) ( not ( = ?auto_779282 ?auto_779283 ) ) ( not ( = ?auto_779282 ?auto_779284 ) ) ( not ( = ?auto_779282 ?auto_779285 ) ) ( not ( = ?auto_779282 ?auto_779286 ) ) ( not ( = ?auto_779282 ?auto_779287 ) ) ( not ( = ?auto_779282 ?auto_779288 ) ) ( not ( = ?auto_779282 ?auto_779289 ) ) ( not ( = ?auto_779282 ?auto_779290 ) ) ( not ( = ?auto_779282 ?auto_779291 ) ) ( not ( = ?auto_779282 ?auto_779292 ) ) ( not ( = ?auto_779283 ?auto_779284 ) ) ( not ( = ?auto_779283 ?auto_779285 ) ) ( not ( = ?auto_779283 ?auto_779286 ) ) ( not ( = ?auto_779283 ?auto_779287 ) ) ( not ( = ?auto_779283 ?auto_779288 ) ) ( not ( = ?auto_779283 ?auto_779289 ) ) ( not ( = ?auto_779283 ?auto_779290 ) ) ( not ( = ?auto_779283 ?auto_779291 ) ) ( not ( = ?auto_779283 ?auto_779292 ) ) ( not ( = ?auto_779284 ?auto_779285 ) ) ( not ( = ?auto_779284 ?auto_779286 ) ) ( not ( = ?auto_779284 ?auto_779287 ) ) ( not ( = ?auto_779284 ?auto_779288 ) ) ( not ( = ?auto_779284 ?auto_779289 ) ) ( not ( = ?auto_779284 ?auto_779290 ) ) ( not ( = ?auto_779284 ?auto_779291 ) ) ( not ( = ?auto_779284 ?auto_779292 ) ) ( not ( = ?auto_779285 ?auto_779286 ) ) ( not ( = ?auto_779285 ?auto_779287 ) ) ( not ( = ?auto_779285 ?auto_779288 ) ) ( not ( = ?auto_779285 ?auto_779289 ) ) ( not ( = ?auto_779285 ?auto_779290 ) ) ( not ( = ?auto_779285 ?auto_779291 ) ) ( not ( = ?auto_779285 ?auto_779292 ) ) ( not ( = ?auto_779286 ?auto_779287 ) ) ( not ( = ?auto_779286 ?auto_779288 ) ) ( not ( = ?auto_779286 ?auto_779289 ) ) ( not ( = ?auto_779286 ?auto_779290 ) ) ( not ( = ?auto_779286 ?auto_779291 ) ) ( not ( = ?auto_779286 ?auto_779292 ) ) ( not ( = ?auto_779287 ?auto_779288 ) ) ( not ( = ?auto_779287 ?auto_779289 ) ) ( not ( = ?auto_779287 ?auto_779290 ) ) ( not ( = ?auto_779287 ?auto_779291 ) ) ( not ( = ?auto_779287 ?auto_779292 ) ) ( not ( = ?auto_779288 ?auto_779289 ) ) ( not ( = ?auto_779288 ?auto_779290 ) ) ( not ( = ?auto_779288 ?auto_779291 ) ) ( not ( = ?auto_779288 ?auto_779292 ) ) ( not ( = ?auto_779289 ?auto_779290 ) ) ( not ( = ?auto_779289 ?auto_779291 ) ) ( not ( = ?auto_779289 ?auto_779292 ) ) ( not ( = ?auto_779290 ?auto_779291 ) ) ( not ( = ?auto_779290 ?auto_779292 ) ) ( not ( = ?auto_779291 ?auto_779292 ) ) ( ON ?auto_779290 ?auto_779291 ) ( CLEAR ?auto_779288 ) ( ON ?auto_779289 ?auto_779290 ) ( CLEAR ?auto_779289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_779277 ?auto_779278 ?auto_779279 ?auto_779280 ?auto_779281 ?auto_779282 ?auto_779283 ?auto_779284 ?auto_779285 ?auto_779286 ?auto_779287 ?auto_779288 ?auto_779289 )
      ( MAKE-15PILE ?auto_779277 ?auto_779278 ?auto_779279 ?auto_779280 ?auto_779281 ?auto_779282 ?auto_779283 ?auto_779284 ?auto_779285 ?auto_779286 ?auto_779287 ?auto_779288 ?auto_779289 ?auto_779290 ?auto_779291 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_779339 - BLOCK
      ?auto_779340 - BLOCK
      ?auto_779341 - BLOCK
      ?auto_779342 - BLOCK
      ?auto_779343 - BLOCK
      ?auto_779344 - BLOCK
      ?auto_779345 - BLOCK
      ?auto_779346 - BLOCK
      ?auto_779347 - BLOCK
      ?auto_779348 - BLOCK
      ?auto_779349 - BLOCK
      ?auto_779350 - BLOCK
      ?auto_779351 - BLOCK
      ?auto_779352 - BLOCK
      ?auto_779353 - BLOCK
    )
    :vars
    (
      ?auto_779354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_779353 ?auto_779354 ) ( ON-TABLE ?auto_779339 ) ( ON ?auto_779340 ?auto_779339 ) ( ON ?auto_779341 ?auto_779340 ) ( ON ?auto_779342 ?auto_779341 ) ( ON ?auto_779343 ?auto_779342 ) ( ON ?auto_779344 ?auto_779343 ) ( ON ?auto_779345 ?auto_779344 ) ( ON ?auto_779346 ?auto_779345 ) ( ON ?auto_779347 ?auto_779346 ) ( ON ?auto_779348 ?auto_779347 ) ( ON ?auto_779349 ?auto_779348 ) ( not ( = ?auto_779339 ?auto_779340 ) ) ( not ( = ?auto_779339 ?auto_779341 ) ) ( not ( = ?auto_779339 ?auto_779342 ) ) ( not ( = ?auto_779339 ?auto_779343 ) ) ( not ( = ?auto_779339 ?auto_779344 ) ) ( not ( = ?auto_779339 ?auto_779345 ) ) ( not ( = ?auto_779339 ?auto_779346 ) ) ( not ( = ?auto_779339 ?auto_779347 ) ) ( not ( = ?auto_779339 ?auto_779348 ) ) ( not ( = ?auto_779339 ?auto_779349 ) ) ( not ( = ?auto_779339 ?auto_779350 ) ) ( not ( = ?auto_779339 ?auto_779351 ) ) ( not ( = ?auto_779339 ?auto_779352 ) ) ( not ( = ?auto_779339 ?auto_779353 ) ) ( not ( = ?auto_779339 ?auto_779354 ) ) ( not ( = ?auto_779340 ?auto_779341 ) ) ( not ( = ?auto_779340 ?auto_779342 ) ) ( not ( = ?auto_779340 ?auto_779343 ) ) ( not ( = ?auto_779340 ?auto_779344 ) ) ( not ( = ?auto_779340 ?auto_779345 ) ) ( not ( = ?auto_779340 ?auto_779346 ) ) ( not ( = ?auto_779340 ?auto_779347 ) ) ( not ( = ?auto_779340 ?auto_779348 ) ) ( not ( = ?auto_779340 ?auto_779349 ) ) ( not ( = ?auto_779340 ?auto_779350 ) ) ( not ( = ?auto_779340 ?auto_779351 ) ) ( not ( = ?auto_779340 ?auto_779352 ) ) ( not ( = ?auto_779340 ?auto_779353 ) ) ( not ( = ?auto_779340 ?auto_779354 ) ) ( not ( = ?auto_779341 ?auto_779342 ) ) ( not ( = ?auto_779341 ?auto_779343 ) ) ( not ( = ?auto_779341 ?auto_779344 ) ) ( not ( = ?auto_779341 ?auto_779345 ) ) ( not ( = ?auto_779341 ?auto_779346 ) ) ( not ( = ?auto_779341 ?auto_779347 ) ) ( not ( = ?auto_779341 ?auto_779348 ) ) ( not ( = ?auto_779341 ?auto_779349 ) ) ( not ( = ?auto_779341 ?auto_779350 ) ) ( not ( = ?auto_779341 ?auto_779351 ) ) ( not ( = ?auto_779341 ?auto_779352 ) ) ( not ( = ?auto_779341 ?auto_779353 ) ) ( not ( = ?auto_779341 ?auto_779354 ) ) ( not ( = ?auto_779342 ?auto_779343 ) ) ( not ( = ?auto_779342 ?auto_779344 ) ) ( not ( = ?auto_779342 ?auto_779345 ) ) ( not ( = ?auto_779342 ?auto_779346 ) ) ( not ( = ?auto_779342 ?auto_779347 ) ) ( not ( = ?auto_779342 ?auto_779348 ) ) ( not ( = ?auto_779342 ?auto_779349 ) ) ( not ( = ?auto_779342 ?auto_779350 ) ) ( not ( = ?auto_779342 ?auto_779351 ) ) ( not ( = ?auto_779342 ?auto_779352 ) ) ( not ( = ?auto_779342 ?auto_779353 ) ) ( not ( = ?auto_779342 ?auto_779354 ) ) ( not ( = ?auto_779343 ?auto_779344 ) ) ( not ( = ?auto_779343 ?auto_779345 ) ) ( not ( = ?auto_779343 ?auto_779346 ) ) ( not ( = ?auto_779343 ?auto_779347 ) ) ( not ( = ?auto_779343 ?auto_779348 ) ) ( not ( = ?auto_779343 ?auto_779349 ) ) ( not ( = ?auto_779343 ?auto_779350 ) ) ( not ( = ?auto_779343 ?auto_779351 ) ) ( not ( = ?auto_779343 ?auto_779352 ) ) ( not ( = ?auto_779343 ?auto_779353 ) ) ( not ( = ?auto_779343 ?auto_779354 ) ) ( not ( = ?auto_779344 ?auto_779345 ) ) ( not ( = ?auto_779344 ?auto_779346 ) ) ( not ( = ?auto_779344 ?auto_779347 ) ) ( not ( = ?auto_779344 ?auto_779348 ) ) ( not ( = ?auto_779344 ?auto_779349 ) ) ( not ( = ?auto_779344 ?auto_779350 ) ) ( not ( = ?auto_779344 ?auto_779351 ) ) ( not ( = ?auto_779344 ?auto_779352 ) ) ( not ( = ?auto_779344 ?auto_779353 ) ) ( not ( = ?auto_779344 ?auto_779354 ) ) ( not ( = ?auto_779345 ?auto_779346 ) ) ( not ( = ?auto_779345 ?auto_779347 ) ) ( not ( = ?auto_779345 ?auto_779348 ) ) ( not ( = ?auto_779345 ?auto_779349 ) ) ( not ( = ?auto_779345 ?auto_779350 ) ) ( not ( = ?auto_779345 ?auto_779351 ) ) ( not ( = ?auto_779345 ?auto_779352 ) ) ( not ( = ?auto_779345 ?auto_779353 ) ) ( not ( = ?auto_779345 ?auto_779354 ) ) ( not ( = ?auto_779346 ?auto_779347 ) ) ( not ( = ?auto_779346 ?auto_779348 ) ) ( not ( = ?auto_779346 ?auto_779349 ) ) ( not ( = ?auto_779346 ?auto_779350 ) ) ( not ( = ?auto_779346 ?auto_779351 ) ) ( not ( = ?auto_779346 ?auto_779352 ) ) ( not ( = ?auto_779346 ?auto_779353 ) ) ( not ( = ?auto_779346 ?auto_779354 ) ) ( not ( = ?auto_779347 ?auto_779348 ) ) ( not ( = ?auto_779347 ?auto_779349 ) ) ( not ( = ?auto_779347 ?auto_779350 ) ) ( not ( = ?auto_779347 ?auto_779351 ) ) ( not ( = ?auto_779347 ?auto_779352 ) ) ( not ( = ?auto_779347 ?auto_779353 ) ) ( not ( = ?auto_779347 ?auto_779354 ) ) ( not ( = ?auto_779348 ?auto_779349 ) ) ( not ( = ?auto_779348 ?auto_779350 ) ) ( not ( = ?auto_779348 ?auto_779351 ) ) ( not ( = ?auto_779348 ?auto_779352 ) ) ( not ( = ?auto_779348 ?auto_779353 ) ) ( not ( = ?auto_779348 ?auto_779354 ) ) ( not ( = ?auto_779349 ?auto_779350 ) ) ( not ( = ?auto_779349 ?auto_779351 ) ) ( not ( = ?auto_779349 ?auto_779352 ) ) ( not ( = ?auto_779349 ?auto_779353 ) ) ( not ( = ?auto_779349 ?auto_779354 ) ) ( not ( = ?auto_779350 ?auto_779351 ) ) ( not ( = ?auto_779350 ?auto_779352 ) ) ( not ( = ?auto_779350 ?auto_779353 ) ) ( not ( = ?auto_779350 ?auto_779354 ) ) ( not ( = ?auto_779351 ?auto_779352 ) ) ( not ( = ?auto_779351 ?auto_779353 ) ) ( not ( = ?auto_779351 ?auto_779354 ) ) ( not ( = ?auto_779352 ?auto_779353 ) ) ( not ( = ?auto_779352 ?auto_779354 ) ) ( not ( = ?auto_779353 ?auto_779354 ) ) ( ON ?auto_779352 ?auto_779353 ) ( ON ?auto_779351 ?auto_779352 ) ( CLEAR ?auto_779349 ) ( ON ?auto_779350 ?auto_779351 ) ( CLEAR ?auto_779350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_779339 ?auto_779340 ?auto_779341 ?auto_779342 ?auto_779343 ?auto_779344 ?auto_779345 ?auto_779346 ?auto_779347 ?auto_779348 ?auto_779349 ?auto_779350 )
      ( MAKE-15PILE ?auto_779339 ?auto_779340 ?auto_779341 ?auto_779342 ?auto_779343 ?auto_779344 ?auto_779345 ?auto_779346 ?auto_779347 ?auto_779348 ?auto_779349 ?auto_779350 ?auto_779351 ?auto_779352 ?auto_779353 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_779401 - BLOCK
      ?auto_779402 - BLOCK
      ?auto_779403 - BLOCK
      ?auto_779404 - BLOCK
      ?auto_779405 - BLOCK
      ?auto_779406 - BLOCK
      ?auto_779407 - BLOCK
      ?auto_779408 - BLOCK
      ?auto_779409 - BLOCK
      ?auto_779410 - BLOCK
      ?auto_779411 - BLOCK
      ?auto_779412 - BLOCK
      ?auto_779413 - BLOCK
      ?auto_779414 - BLOCK
      ?auto_779415 - BLOCK
    )
    :vars
    (
      ?auto_779416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_779415 ?auto_779416 ) ( ON-TABLE ?auto_779401 ) ( ON ?auto_779402 ?auto_779401 ) ( ON ?auto_779403 ?auto_779402 ) ( ON ?auto_779404 ?auto_779403 ) ( ON ?auto_779405 ?auto_779404 ) ( ON ?auto_779406 ?auto_779405 ) ( ON ?auto_779407 ?auto_779406 ) ( ON ?auto_779408 ?auto_779407 ) ( ON ?auto_779409 ?auto_779408 ) ( ON ?auto_779410 ?auto_779409 ) ( not ( = ?auto_779401 ?auto_779402 ) ) ( not ( = ?auto_779401 ?auto_779403 ) ) ( not ( = ?auto_779401 ?auto_779404 ) ) ( not ( = ?auto_779401 ?auto_779405 ) ) ( not ( = ?auto_779401 ?auto_779406 ) ) ( not ( = ?auto_779401 ?auto_779407 ) ) ( not ( = ?auto_779401 ?auto_779408 ) ) ( not ( = ?auto_779401 ?auto_779409 ) ) ( not ( = ?auto_779401 ?auto_779410 ) ) ( not ( = ?auto_779401 ?auto_779411 ) ) ( not ( = ?auto_779401 ?auto_779412 ) ) ( not ( = ?auto_779401 ?auto_779413 ) ) ( not ( = ?auto_779401 ?auto_779414 ) ) ( not ( = ?auto_779401 ?auto_779415 ) ) ( not ( = ?auto_779401 ?auto_779416 ) ) ( not ( = ?auto_779402 ?auto_779403 ) ) ( not ( = ?auto_779402 ?auto_779404 ) ) ( not ( = ?auto_779402 ?auto_779405 ) ) ( not ( = ?auto_779402 ?auto_779406 ) ) ( not ( = ?auto_779402 ?auto_779407 ) ) ( not ( = ?auto_779402 ?auto_779408 ) ) ( not ( = ?auto_779402 ?auto_779409 ) ) ( not ( = ?auto_779402 ?auto_779410 ) ) ( not ( = ?auto_779402 ?auto_779411 ) ) ( not ( = ?auto_779402 ?auto_779412 ) ) ( not ( = ?auto_779402 ?auto_779413 ) ) ( not ( = ?auto_779402 ?auto_779414 ) ) ( not ( = ?auto_779402 ?auto_779415 ) ) ( not ( = ?auto_779402 ?auto_779416 ) ) ( not ( = ?auto_779403 ?auto_779404 ) ) ( not ( = ?auto_779403 ?auto_779405 ) ) ( not ( = ?auto_779403 ?auto_779406 ) ) ( not ( = ?auto_779403 ?auto_779407 ) ) ( not ( = ?auto_779403 ?auto_779408 ) ) ( not ( = ?auto_779403 ?auto_779409 ) ) ( not ( = ?auto_779403 ?auto_779410 ) ) ( not ( = ?auto_779403 ?auto_779411 ) ) ( not ( = ?auto_779403 ?auto_779412 ) ) ( not ( = ?auto_779403 ?auto_779413 ) ) ( not ( = ?auto_779403 ?auto_779414 ) ) ( not ( = ?auto_779403 ?auto_779415 ) ) ( not ( = ?auto_779403 ?auto_779416 ) ) ( not ( = ?auto_779404 ?auto_779405 ) ) ( not ( = ?auto_779404 ?auto_779406 ) ) ( not ( = ?auto_779404 ?auto_779407 ) ) ( not ( = ?auto_779404 ?auto_779408 ) ) ( not ( = ?auto_779404 ?auto_779409 ) ) ( not ( = ?auto_779404 ?auto_779410 ) ) ( not ( = ?auto_779404 ?auto_779411 ) ) ( not ( = ?auto_779404 ?auto_779412 ) ) ( not ( = ?auto_779404 ?auto_779413 ) ) ( not ( = ?auto_779404 ?auto_779414 ) ) ( not ( = ?auto_779404 ?auto_779415 ) ) ( not ( = ?auto_779404 ?auto_779416 ) ) ( not ( = ?auto_779405 ?auto_779406 ) ) ( not ( = ?auto_779405 ?auto_779407 ) ) ( not ( = ?auto_779405 ?auto_779408 ) ) ( not ( = ?auto_779405 ?auto_779409 ) ) ( not ( = ?auto_779405 ?auto_779410 ) ) ( not ( = ?auto_779405 ?auto_779411 ) ) ( not ( = ?auto_779405 ?auto_779412 ) ) ( not ( = ?auto_779405 ?auto_779413 ) ) ( not ( = ?auto_779405 ?auto_779414 ) ) ( not ( = ?auto_779405 ?auto_779415 ) ) ( not ( = ?auto_779405 ?auto_779416 ) ) ( not ( = ?auto_779406 ?auto_779407 ) ) ( not ( = ?auto_779406 ?auto_779408 ) ) ( not ( = ?auto_779406 ?auto_779409 ) ) ( not ( = ?auto_779406 ?auto_779410 ) ) ( not ( = ?auto_779406 ?auto_779411 ) ) ( not ( = ?auto_779406 ?auto_779412 ) ) ( not ( = ?auto_779406 ?auto_779413 ) ) ( not ( = ?auto_779406 ?auto_779414 ) ) ( not ( = ?auto_779406 ?auto_779415 ) ) ( not ( = ?auto_779406 ?auto_779416 ) ) ( not ( = ?auto_779407 ?auto_779408 ) ) ( not ( = ?auto_779407 ?auto_779409 ) ) ( not ( = ?auto_779407 ?auto_779410 ) ) ( not ( = ?auto_779407 ?auto_779411 ) ) ( not ( = ?auto_779407 ?auto_779412 ) ) ( not ( = ?auto_779407 ?auto_779413 ) ) ( not ( = ?auto_779407 ?auto_779414 ) ) ( not ( = ?auto_779407 ?auto_779415 ) ) ( not ( = ?auto_779407 ?auto_779416 ) ) ( not ( = ?auto_779408 ?auto_779409 ) ) ( not ( = ?auto_779408 ?auto_779410 ) ) ( not ( = ?auto_779408 ?auto_779411 ) ) ( not ( = ?auto_779408 ?auto_779412 ) ) ( not ( = ?auto_779408 ?auto_779413 ) ) ( not ( = ?auto_779408 ?auto_779414 ) ) ( not ( = ?auto_779408 ?auto_779415 ) ) ( not ( = ?auto_779408 ?auto_779416 ) ) ( not ( = ?auto_779409 ?auto_779410 ) ) ( not ( = ?auto_779409 ?auto_779411 ) ) ( not ( = ?auto_779409 ?auto_779412 ) ) ( not ( = ?auto_779409 ?auto_779413 ) ) ( not ( = ?auto_779409 ?auto_779414 ) ) ( not ( = ?auto_779409 ?auto_779415 ) ) ( not ( = ?auto_779409 ?auto_779416 ) ) ( not ( = ?auto_779410 ?auto_779411 ) ) ( not ( = ?auto_779410 ?auto_779412 ) ) ( not ( = ?auto_779410 ?auto_779413 ) ) ( not ( = ?auto_779410 ?auto_779414 ) ) ( not ( = ?auto_779410 ?auto_779415 ) ) ( not ( = ?auto_779410 ?auto_779416 ) ) ( not ( = ?auto_779411 ?auto_779412 ) ) ( not ( = ?auto_779411 ?auto_779413 ) ) ( not ( = ?auto_779411 ?auto_779414 ) ) ( not ( = ?auto_779411 ?auto_779415 ) ) ( not ( = ?auto_779411 ?auto_779416 ) ) ( not ( = ?auto_779412 ?auto_779413 ) ) ( not ( = ?auto_779412 ?auto_779414 ) ) ( not ( = ?auto_779412 ?auto_779415 ) ) ( not ( = ?auto_779412 ?auto_779416 ) ) ( not ( = ?auto_779413 ?auto_779414 ) ) ( not ( = ?auto_779413 ?auto_779415 ) ) ( not ( = ?auto_779413 ?auto_779416 ) ) ( not ( = ?auto_779414 ?auto_779415 ) ) ( not ( = ?auto_779414 ?auto_779416 ) ) ( not ( = ?auto_779415 ?auto_779416 ) ) ( ON ?auto_779414 ?auto_779415 ) ( ON ?auto_779413 ?auto_779414 ) ( ON ?auto_779412 ?auto_779413 ) ( CLEAR ?auto_779410 ) ( ON ?auto_779411 ?auto_779412 ) ( CLEAR ?auto_779411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_779401 ?auto_779402 ?auto_779403 ?auto_779404 ?auto_779405 ?auto_779406 ?auto_779407 ?auto_779408 ?auto_779409 ?auto_779410 ?auto_779411 )
      ( MAKE-15PILE ?auto_779401 ?auto_779402 ?auto_779403 ?auto_779404 ?auto_779405 ?auto_779406 ?auto_779407 ?auto_779408 ?auto_779409 ?auto_779410 ?auto_779411 ?auto_779412 ?auto_779413 ?auto_779414 ?auto_779415 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_779463 - BLOCK
      ?auto_779464 - BLOCK
      ?auto_779465 - BLOCK
      ?auto_779466 - BLOCK
      ?auto_779467 - BLOCK
      ?auto_779468 - BLOCK
      ?auto_779469 - BLOCK
      ?auto_779470 - BLOCK
      ?auto_779471 - BLOCK
      ?auto_779472 - BLOCK
      ?auto_779473 - BLOCK
      ?auto_779474 - BLOCK
      ?auto_779475 - BLOCK
      ?auto_779476 - BLOCK
      ?auto_779477 - BLOCK
    )
    :vars
    (
      ?auto_779478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_779477 ?auto_779478 ) ( ON-TABLE ?auto_779463 ) ( ON ?auto_779464 ?auto_779463 ) ( ON ?auto_779465 ?auto_779464 ) ( ON ?auto_779466 ?auto_779465 ) ( ON ?auto_779467 ?auto_779466 ) ( ON ?auto_779468 ?auto_779467 ) ( ON ?auto_779469 ?auto_779468 ) ( ON ?auto_779470 ?auto_779469 ) ( ON ?auto_779471 ?auto_779470 ) ( not ( = ?auto_779463 ?auto_779464 ) ) ( not ( = ?auto_779463 ?auto_779465 ) ) ( not ( = ?auto_779463 ?auto_779466 ) ) ( not ( = ?auto_779463 ?auto_779467 ) ) ( not ( = ?auto_779463 ?auto_779468 ) ) ( not ( = ?auto_779463 ?auto_779469 ) ) ( not ( = ?auto_779463 ?auto_779470 ) ) ( not ( = ?auto_779463 ?auto_779471 ) ) ( not ( = ?auto_779463 ?auto_779472 ) ) ( not ( = ?auto_779463 ?auto_779473 ) ) ( not ( = ?auto_779463 ?auto_779474 ) ) ( not ( = ?auto_779463 ?auto_779475 ) ) ( not ( = ?auto_779463 ?auto_779476 ) ) ( not ( = ?auto_779463 ?auto_779477 ) ) ( not ( = ?auto_779463 ?auto_779478 ) ) ( not ( = ?auto_779464 ?auto_779465 ) ) ( not ( = ?auto_779464 ?auto_779466 ) ) ( not ( = ?auto_779464 ?auto_779467 ) ) ( not ( = ?auto_779464 ?auto_779468 ) ) ( not ( = ?auto_779464 ?auto_779469 ) ) ( not ( = ?auto_779464 ?auto_779470 ) ) ( not ( = ?auto_779464 ?auto_779471 ) ) ( not ( = ?auto_779464 ?auto_779472 ) ) ( not ( = ?auto_779464 ?auto_779473 ) ) ( not ( = ?auto_779464 ?auto_779474 ) ) ( not ( = ?auto_779464 ?auto_779475 ) ) ( not ( = ?auto_779464 ?auto_779476 ) ) ( not ( = ?auto_779464 ?auto_779477 ) ) ( not ( = ?auto_779464 ?auto_779478 ) ) ( not ( = ?auto_779465 ?auto_779466 ) ) ( not ( = ?auto_779465 ?auto_779467 ) ) ( not ( = ?auto_779465 ?auto_779468 ) ) ( not ( = ?auto_779465 ?auto_779469 ) ) ( not ( = ?auto_779465 ?auto_779470 ) ) ( not ( = ?auto_779465 ?auto_779471 ) ) ( not ( = ?auto_779465 ?auto_779472 ) ) ( not ( = ?auto_779465 ?auto_779473 ) ) ( not ( = ?auto_779465 ?auto_779474 ) ) ( not ( = ?auto_779465 ?auto_779475 ) ) ( not ( = ?auto_779465 ?auto_779476 ) ) ( not ( = ?auto_779465 ?auto_779477 ) ) ( not ( = ?auto_779465 ?auto_779478 ) ) ( not ( = ?auto_779466 ?auto_779467 ) ) ( not ( = ?auto_779466 ?auto_779468 ) ) ( not ( = ?auto_779466 ?auto_779469 ) ) ( not ( = ?auto_779466 ?auto_779470 ) ) ( not ( = ?auto_779466 ?auto_779471 ) ) ( not ( = ?auto_779466 ?auto_779472 ) ) ( not ( = ?auto_779466 ?auto_779473 ) ) ( not ( = ?auto_779466 ?auto_779474 ) ) ( not ( = ?auto_779466 ?auto_779475 ) ) ( not ( = ?auto_779466 ?auto_779476 ) ) ( not ( = ?auto_779466 ?auto_779477 ) ) ( not ( = ?auto_779466 ?auto_779478 ) ) ( not ( = ?auto_779467 ?auto_779468 ) ) ( not ( = ?auto_779467 ?auto_779469 ) ) ( not ( = ?auto_779467 ?auto_779470 ) ) ( not ( = ?auto_779467 ?auto_779471 ) ) ( not ( = ?auto_779467 ?auto_779472 ) ) ( not ( = ?auto_779467 ?auto_779473 ) ) ( not ( = ?auto_779467 ?auto_779474 ) ) ( not ( = ?auto_779467 ?auto_779475 ) ) ( not ( = ?auto_779467 ?auto_779476 ) ) ( not ( = ?auto_779467 ?auto_779477 ) ) ( not ( = ?auto_779467 ?auto_779478 ) ) ( not ( = ?auto_779468 ?auto_779469 ) ) ( not ( = ?auto_779468 ?auto_779470 ) ) ( not ( = ?auto_779468 ?auto_779471 ) ) ( not ( = ?auto_779468 ?auto_779472 ) ) ( not ( = ?auto_779468 ?auto_779473 ) ) ( not ( = ?auto_779468 ?auto_779474 ) ) ( not ( = ?auto_779468 ?auto_779475 ) ) ( not ( = ?auto_779468 ?auto_779476 ) ) ( not ( = ?auto_779468 ?auto_779477 ) ) ( not ( = ?auto_779468 ?auto_779478 ) ) ( not ( = ?auto_779469 ?auto_779470 ) ) ( not ( = ?auto_779469 ?auto_779471 ) ) ( not ( = ?auto_779469 ?auto_779472 ) ) ( not ( = ?auto_779469 ?auto_779473 ) ) ( not ( = ?auto_779469 ?auto_779474 ) ) ( not ( = ?auto_779469 ?auto_779475 ) ) ( not ( = ?auto_779469 ?auto_779476 ) ) ( not ( = ?auto_779469 ?auto_779477 ) ) ( not ( = ?auto_779469 ?auto_779478 ) ) ( not ( = ?auto_779470 ?auto_779471 ) ) ( not ( = ?auto_779470 ?auto_779472 ) ) ( not ( = ?auto_779470 ?auto_779473 ) ) ( not ( = ?auto_779470 ?auto_779474 ) ) ( not ( = ?auto_779470 ?auto_779475 ) ) ( not ( = ?auto_779470 ?auto_779476 ) ) ( not ( = ?auto_779470 ?auto_779477 ) ) ( not ( = ?auto_779470 ?auto_779478 ) ) ( not ( = ?auto_779471 ?auto_779472 ) ) ( not ( = ?auto_779471 ?auto_779473 ) ) ( not ( = ?auto_779471 ?auto_779474 ) ) ( not ( = ?auto_779471 ?auto_779475 ) ) ( not ( = ?auto_779471 ?auto_779476 ) ) ( not ( = ?auto_779471 ?auto_779477 ) ) ( not ( = ?auto_779471 ?auto_779478 ) ) ( not ( = ?auto_779472 ?auto_779473 ) ) ( not ( = ?auto_779472 ?auto_779474 ) ) ( not ( = ?auto_779472 ?auto_779475 ) ) ( not ( = ?auto_779472 ?auto_779476 ) ) ( not ( = ?auto_779472 ?auto_779477 ) ) ( not ( = ?auto_779472 ?auto_779478 ) ) ( not ( = ?auto_779473 ?auto_779474 ) ) ( not ( = ?auto_779473 ?auto_779475 ) ) ( not ( = ?auto_779473 ?auto_779476 ) ) ( not ( = ?auto_779473 ?auto_779477 ) ) ( not ( = ?auto_779473 ?auto_779478 ) ) ( not ( = ?auto_779474 ?auto_779475 ) ) ( not ( = ?auto_779474 ?auto_779476 ) ) ( not ( = ?auto_779474 ?auto_779477 ) ) ( not ( = ?auto_779474 ?auto_779478 ) ) ( not ( = ?auto_779475 ?auto_779476 ) ) ( not ( = ?auto_779475 ?auto_779477 ) ) ( not ( = ?auto_779475 ?auto_779478 ) ) ( not ( = ?auto_779476 ?auto_779477 ) ) ( not ( = ?auto_779476 ?auto_779478 ) ) ( not ( = ?auto_779477 ?auto_779478 ) ) ( ON ?auto_779476 ?auto_779477 ) ( ON ?auto_779475 ?auto_779476 ) ( ON ?auto_779474 ?auto_779475 ) ( ON ?auto_779473 ?auto_779474 ) ( CLEAR ?auto_779471 ) ( ON ?auto_779472 ?auto_779473 ) ( CLEAR ?auto_779472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_779463 ?auto_779464 ?auto_779465 ?auto_779466 ?auto_779467 ?auto_779468 ?auto_779469 ?auto_779470 ?auto_779471 ?auto_779472 )
      ( MAKE-15PILE ?auto_779463 ?auto_779464 ?auto_779465 ?auto_779466 ?auto_779467 ?auto_779468 ?auto_779469 ?auto_779470 ?auto_779471 ?auto_779472 ?auto_779473 ?auto_779474 ?auto_779475 ?auto_779476 ?auto_779477 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_779525 - BLOCK
      ?auto_779526 - BLOCK
      ?auto_779527 - BLOCK
      ?auto_779528 - BLOCK
      ?auto_779529 - BLOCK
      ?auto_779530 - BLOCK
      ?auto_779531 - BLOCK
      ?auto_779532 - BLOCK
      ?auto_779533 - BLOCK
      ?auto_779534 - BLOCK
      ?auto_779535 - BLOCK
      ?auto_779536 - BLOCK
      ?auto_779537 - BLOCK
      ?auto_779538 - BLOCK
      ?auto_779539 - BLOCK
    )
    :vars
    (
      ?auto_779540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_779539 ?auto_779540 ) ( ON-TABLE ?auto_779525 ) ( ON ?auto_779526 ?auto_779525 ) ( ON ?auto_779527 ?auto_779526 ) ( ON ?auto_779528 ?auto_779527 ) ( ON ?auto_779529 ?auto_779528 ) ( ON ?auto_779530 ?auto_779529 ) ( ON ?auto_779531 ?auto_779530 ) ( ON ?auto_779532 ?auto_779531 ) ( not ( = ?auto_779525 ?auto_779526 ) ) ( not ( = ?auto_779525 ?auto_779527 ) ) ( not ( = ?auto_779525 ?auto_779528 ) ) ( not ( = ?auto_779525 ?auto_779529 ) ) ( not ( = ?auto_779525 ?auto_779530 ) ) ( not ( = ?auto_779525 ?auto_779531 ) ) ( not ( = ?auto_779525 ?auto_779532 ) ) ( not ( = ?auto_779525 ?auto_779533 ) ) ( not ( = ?auto_779525 ?auto_779534 ) ) ( not ( = ?auto_779525 ?auto_779535 ) ) ( not ( = ?auto_779525 ?auto_779536 ) ) ( not ( = ?auto_779525 ?auto_779537 ) ) ( not ( = ?auto_779525 ?auto_779538 ) ) ( not ( = ?auto_779525 ?auto_779539 ) ) ( not ( = ?auto_779525 ?auto_779540 ) ) ( not ( = ?auto_779526 ?auto_779527 ) ) ( not ( = ?auto_779526 ?auto_779528 ) ) ( not ( = ?auto_779526 ?auto_779529 ) ) ( not ( = ?auto_779526 ?auto_779530 ) ) ( not ( = ?auto_779526 ?auto_779531 ) ) ( not ( = ?auto_779526 ?auto_779532 ) ) ( not ( = ?auto_779526 ?auto_779533 ) ) ( not ( = ?auto_779526 ?auto_779534 ) ) ( not ( = ?auto_779526 ?auto_779535 ) ) ( not ( = ?auto_779526 ?auto_779536 ) ) ( not ( = ?auto_779526 ?auto_779537 ) ) ( not ( = ?auto_779526 ?auto_779538 ) ) ( not ( = ?auto_779526 ?auto_779539 ) ) ( not ( = ?auto_779526 ?auto_779540 ) ) ( not ( = ?auto_779527 ?auto_779528 ) ) ( not ( = ?auto_779527 ?auto_779529 ) ) ( not ( = ?auto_779527 ?auto_779530 ) ) ( not ( = ?auto_779527 ?auto_779531 ) ) ( not ( = ?auto_779527 ?auto_779532 ) ) ( not ( = ?auto_779527 ?auto_779533 ) ) ( not ( = ?auto_779527 ?auto_779534 ) ) ( not ( = ?auto_779527 ?auto_779535 ) ) ( not ( = ?auto_779527 ?auto_779536 ) ) ( not ( = ?auto_779527 ?auto_779537 ) ) ( not ( = ?auto_779527 ?auto_779538 ) ) ( not ( = ?auto_779527 ?auto_779539 ) ) ( not ( = ?auto_779527 ?auto_779540 ) ) ( not ( = ?auto_779528 ?auto_779529 ) ) ( not ( = ?auto_779528 ?auto_779530 ) ) ( not ( = ?auto_779528 ?auto_779531 ) ) ( not ( = ?auto_779528 ?auto_779532 ) ) ( not ( = ?auto_779528 ?auto_779533 ) ) ( not ( = ?auto_779528 ?auto_779534 ) ) ( not ( = ?auto_779528 ?auto_779535 ) ) ( not ( = ?auto_779528 ?auto_779536 ) ) ( not ( = ?auto_779528 ?auto_779537 ) ) ( not ( = ?auto_779528 ?auto_779538 ) ) ( not ( = ?auto_779528 ?auto_779539 ) ) ( not ( = ?auto_779528 ?auto_779540 ) ) ( not ( = ?auto_779529 ?auto_779530 ) ) ( not ( = ?auto_779529 ?auto_779531 ) ) ( not ( = ?auto_779529 ?auto_779532 ) ) ( not ( = ?auto_779529 ?auto_779533 ) ) ( not ( = ?auto_779529 ?auto_779534 ) ) ( not ( = ?auto_779529 ?auto_779535 ) ) ( not ( = ?auto_779529 ?auto_779536 ) ) ( not ( = ?auto_779529 ?auto_779537 ) ) ( not ( = ?auto_779529 ?auto_779538 ) ) ( not ( = ?auto_779529 ?auto_779539 ) ) ( not ( = ?auto_779529 ?auto_779540 ) ) ( not ( = ?auto_779530 ?auto_779531 ) ) ( not ( = ?auto_779530 ?auto_779532 ) ) ( not ( = ?auto_779530 ?auto_779533 ) ) ( not ( = ?auto_779530 ?auto_779534 ) ) ( not ( = ?auto_779530 ?auto_779535 ) ) ( not ( = ?auto_779530 ?auto_779536 ) ) ( not ( = ?auto_779530 ?auto_779537 ) ) ( not ( = ?auto_779530 ?auto_779538 ) ) ( not ( = ?auto_779530 ?auto_779539 ) ) ( not ( = ?auto_779530 ?auto_779540 ) ) ( not ( = ?auto_779531 ?auto_779532 ) ) ( not ( = ?auto_779531 ?auto_779533 ) ) ( not ( = ?auto_779531 ?auto_779534 ) ) ( not ( = ?auto_779531 ?auto_779535 ) ) ( not ( = ?auto_779531 ?auto_779536 ) ) ( not ( = ?auto_779531 ?auto_779537 ) ) ( not ( = ?auto_779531 ?auto_779538 ) ) ( not ( = ?auto_779531 ?auto_779539 ) ) ( not ( = ?auto_779531 ?auto_779540 ) ) ( not ( = ?auto_779532 ?auto_779533 ) ) ( not ( = ?auto_779532 ?auto_779534 ) ) ( not ( = ?auto_779532 ?auto_779535 ) ) ( not ( = ?auto_779532 ?auto_779536 ) ) ( not ( = ?auto_779532 ?auto_779537 ) ) ( not ( = ?auto_779532 ?auto_779538 ) ) ( not ( = ?auto_779532 ?auto_779539 ) ) ( not ( = ?auto_779532 ?auto_779540 ) ) ( not ( = ?auto_779533 ?auto_779534 ) ) ( not ( = ?auto_779533 ?auto_779535 ) ) ( not ( = ?auto_779533 ?auto_779536 ) ) ( not ( = ?auto_779533 ?auto_779537 ) ) ( not ( = ?auto_779533 ?auto_779538 ) ) ( not ( = ?auto_779533 ?auto_779539 ) ) ( not ( = ?auto_779533 ?auto_779540 ) ) ( not ( = ?auto_779534 ?auto_779535 ) ) ( not ( = ?auto_779534 ?auto_779536 ) ) ( not ( = ?auto_779534 ?auto_779537 ) ) ( not ( = ?auto_779534 ?auto_779538 ) ) ( not ( = ?auto_779534 ?auto_779539 ) ) ( not ( = ?auto_779534 ?auto_779540 ) ) ( not ( = ?auto_779535 ?auto_779536 ) ) ( not ( = ?auto_779535 ?auto_779537 ) ) ( not ( = ?auto_779535 ?auto_779538 ) ) ( not ( = ?auto_779535 ?auto_779539 ) ) ( not ( = ?auto_779535 ?auto_779540 ) ) ( not ( = ?auto_779536 ?auto_779537 ) ) ( not ( = ?auto_779536 ?auto_779538 ) ) ( not ( = ?auto_779536 ?auto_779539 ) ) ( not ( = ?auto_779536 ?auto_779540 ) ) ( not ( = ?auto_779537 ?auto_779538 ) ) ( not ( = ?auto_779537 ?auto_779539 ) ) ( not ( = ?auto_779537 ?auto_779540 ) ) ( not ( = ?auto_779538 ?auto_779539 ) ) ( not ( = ?auto_779538 ?auto_779540 ) ) ( not ( = ?auto_779539 ?auto_779540 ) ) ( ON ?auto_779538 ?auto_779539 ) ( ON ?auto_779537 ?auto_779538 ) ( ON ?auto_779536 ?auto_779537 ) ( ON ?auto_779535 ?auto_779536 ) ( ON ?auto_779534 ?auto_779535 ) ( CLEAR ?auto_779532 ) ( ON ?auto_779533 ?auto_779534 ) ( CLEAR ?auto_779533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_779525 ?auto_779526 ?auto_779527 ?auto_779528 ?auto_779529 ?auto_779530 ?auto_779531 ?auto_779532 ?auto_779533 )
      ( MAKE-15PILE ?auto_779525 ?auto_779526 ?auto_779527 ?auto_779528 ?auto_779529 ?auto_779530 ?auto_779531 ?auto_779532 ?auto_779533 ?auto_779534 ?auto_779535 ?auto_779536 ?auto_779537 ?auto_779538 ?auto_779539 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_779587 - BLOCK
      ?auto_779588 - BLOCK
      ?auto_779589 - BLOCK
      ?auto_779590 - BLOCK
      ?auto_779591 - BLOCK
      ?auto_779592 - BLOCK
      ?auto_779593 - BLOCK
      ?auto_779594 - BLOCK
      ?auto_779595 - BLOCK
      ?auto_779596 - BLOCK
      ?auto_779597 - BLOCK
      ?auto_779598 - BLOCK
      ?auto_779599 - BLOCK
      ?auto_779600 - BLOCK
      ?auto_779601 - BLOCK
    )
    :vars
    (
      ?auto_779602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_779601 ?auto_779602 ) ( ON-TABLE ?auto_779587 ) ( ON ?auto_779588 ?auto_779587 ) ( ON ?auto_779589 ?auto_779588 ) ( ON ?auto_779590 ?auto_779589 ) ( ON ?auto_779591 ?auto_779590 ) ( ON ?auto_779592 ?auto_779591 ) ( ON ?auto_779593 ?auto_779592 ) ( not ( = ?auto_779587 ?auto_779588 ) ) ( not ( = ?auto_779587 ?auto_779589 ) ) ( not ( = ?auto_779587 ?auto_779590 ) ) ( not ( = ?auto_779587 ?auto_779591 ) ) ( not ( = ?auto_779587 ?auto_779592 ) ) ( not ( = ?auto_779587 ?auto_779593 ) ) ( not ( = ?auto_779587 ?auto_779594 ) ) ( not ( = ?auto_779587 ?auto_779595 ) ) ( not ( = ?auto_779587 ?auto_779596 ) ) ( not ( = ?auto_779587 ?auto_779597 ) ) ( not ( = ?auto_779587 ?auto_779598 ) ) ( not ( = ?auto_779587 ?auto_779599 ) ) ( not ( = ?auto_779587 ?auto_779600 ) ) ( not ( = ?auto_779587 ?auto_779601 ) ) ( not ( = ?auto_779587 ?auto_779602 ) ) ( not ( = ?auto_779588 ?auto_779589 ) ) ( not ( = ?auto_779588 ?auto_779590 ) ) ( not ( = ?auto_779588 ?auto_779591 ) ) ( not ( = ?auto_779588 ?auto_779592 ) ) ( not ( = ?auto_779588 ?auto_779593 ) ) ( not ( = ?auto_779588 ?auto_779594 ) ) ( not ( = ?auto_779588 ?auto_779595 ) ) ( not ( = ?auto_779588 ?auto_779596 ) ) ( not ( = ?auto_779588 ?auto_779597 ) ) ( not ( = ?auto_779588 ?auto_779598 ) ) ( not ( = ?auto_779588 ?auto_779599 ) ) ( not ( = ?auto_779588 ?auto_779600 ) ) ( not ( = ?auto_779588 ?auto_779601 ) ) ( not ( = ?auto_779588 ?auto_779602 ) ) ( not ( = ?auto_779589 ?auto_779590 ) ) ( not ( = ?auto_779589 ?auto_779591 ) ) ( not ( = ?auto_779589 ?auto_779592 ) ) ( not ( = ?auto_779589 ?auto_779593 ) ) ( not ( = ?auto_779589 ?auto_779594 ) ) ( not ( = ?auto_779589 ?auto_779595 ) ) ( not ( = ?auto_779589 ?auto_779596 ) ) ( not ( = ?auto_779589 ?auto_779597 ) ) ( not ( = ?auto_779589 ?auto_779598 ) ) ( not ( = ?auto_779589 ?auto_779599 ) ) ( not ( = ?auto_779589 ?auto_779600 ) ) ( not ( = ?auto_779589 ?auto_779601 ) ) ( not ( = ?auto_779589 ?auto_779602 ) ) ( not ( = ?auto_779590 ?auto_779591 ) ) ( not ( = ?auto_779590 ?auto_779592 ) ) ( not ( = ?auto_779590 ?auto_779593 ) ) ( not ( = ?auto_779590 ?auto_779594 ) ) ( not ( = ?auto_779590 ?auto_779595 ) ) ( not ( = ?auto_779590 ?auto_779596 ) ) ( not ( = ?auto_779590 ?auto_779597 ) ) ( not ( = ?auto_779590 ?auto_779598 ) ) ( not ( = ?auto_779590 ?auto_779599 ) ) ( not ( = ?auto_779590 ?auto_779600 ) ) ( not ( = ?auto_779590 ?auto_779601 ) ) ( not ( = ?auto_779590 ?auto_779602 ) ) ( not ( = ?auto_779591 ?auto_779592 ) ) ( not ( = ?auto_779591 ?auto_779593 ) ) ( not ( = ?auto_779591 ?auto_779594 ) ) ( not ( = ?auto_779591 ?auto_779595 ) ) ( not ( = ?auto_779591 ?auto_779596 ) ) ( not ( = ?auto_779591 ?auto_779597 ) ) ( not ( = ?auto_779591 ?auto_779598 ) ) ( not ( = ?auto_779591 ?auto_779599 ) ) ( not ( = ?auto_779591 ?auto_779600 ) ) ( not ( = ?auto_779591 ?auto_779601 ) ) ( not ( = ?auto_779591 ?auto_779602 ) ) ( not ( = ?auto_779592 ?auto_779593 ) ) ( not ( = ?auto_779592 ?auto_779594 ) ) ( not ( = ?auto_779592 ?auto_779595 ) ) ( not ( = ?auto_779592 ?auto_779596 ) ) ( not ( = ?auto_779592 ?auto_779597 ) ) ( not ( = ?auto_779592 ?auto_779598 ) ) ( not ( = ?auto_779592 ?auto_779599 ) ) ( not ( = ?auto_779592 ?auto_779600 ) ) ( not ( = ?auto_779592 ?auto_779601 ) ) ( not ( = ?auto_779592 ?auto_779602 ) ) ( not ( = ?auto_779593 ?auto_779594 ) ) ( not ( = ?auto_779593 ?auto_779595 ) ) ( not ( = ?auto_779593 ?auto_779596 ) ) ( not ( = ?auto_779593 ?auto_779597 ) ) ( not ( = ?auto_779593 ?auto_779598 ) ) ( not ( = ?auto_779593 ?auto_779599 ) ) ( not ( = ?auto_779593 ?auto_779600 ) ) ( not ( = ?auto_779593 ?auto_779601 ) ) ( not ( = ?auto_779593 ?auto_779602 ) ) ( not ( = ?auto_779594 ?auto_779595 ) ) ( not ( = ?auto_779594 ?auto_779596 ) ) ( not ( = ?auto_779594 ?auto_779597 ) ) ( not ( = ?auto_779594 ?auto_779598 ) ) ( not ( = ?auto_779594 ?auto_779599 ) ) ( not ( = ?auto_779594 ?auto_779600 ) ) ( not ( = ?auto_779594 ?auto_779601 ) ) ( not ( = ?auto_779594 ?auto_779602 ) ) ( not ( = ?auto_779595 ?auto_779596 ) ) ( not ( = ?auto_779595 ?auto_779597 ) ) ( not ( = ?auto_779595 ?auto_779598 ) ) ( not ( = ?auto_779595 ?auto_779599 ) ) ( not ( = ?auto_779595 ?auto_779600 ) ) ( not ( = ?auto_779595 ?auto_779601 ) ) ( not ( = ?auto_779595 ?auto_779602 ) ) ( not ( = ?auto_779596 ?auto_779597 ) ) ( not ( = ?auto_779596 ?auto_779598 ) ) ( not ( = ?auto_779596 ?auto_779599 ) ) ( not ( = ?auto_779596 ?auto_779600 ) ) ( not ( = ?auto_779596 ?auto_779601 ) ) ( not ( = ?auto_779596 ?auto_779602 ) ) ( not ( = ?auto_779597 ?auto_779598 ) ) ( not ( = ?auto_779597 ?auto_779599 ) ) ( not ( = ?auto_779597 ?auto_779600 ) ) ( not ( = ?auto_779597 ?auto_779601 ) ) ( not ( = ?auto_779597 ?auto_779602 ) ) ( not ( = ?auto_779598 ?auto_779599 ) ) ( not ( = ?auto_779598 ?auto_779600 ) ) ( not ( = ?auto_779598 ?auto_779601 ) ) ( not ( = ?auto_779598 ?auto_779602 ) ) ( not ( = ?auto_779599 ?auto_779600 ) ) ( not ( = ?auto_779599 ?auto_779601 ) ) ( not ( = ?auto_779599 ?auto_779602 ) ) ( not ( = ?auto_779600 ?auto_779601 ) ) ( not ( = ?auto_779600 ?auto_779602 ) ) ( not ( = ?auto_779601 ?auto_779602 ) ) ( ON ?auto_779600 ?auto_779601 ) ( ON ?auto_779599 ?auto_779600 ) ( ON ?auto_779598 ?auto_779599 ) ( ON ?auto_779597 ?auto_779598 ) ( ON ?auto_779596 ?auto_779597 ) ( ON ?auto_779595 ?auto_779596 ) ( CLEAR ?auto_779593 ) ( ON ?auto_779594 ?auto_779595 ) ( CLEAR ?auto_779594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_779587 ?auto_779588 ?auto_779589 ?auto_779590 ?auto_779591 ?auto_779592 ?auto_779593 ?auto_779594 )
      ( MAKE-15PILE ?auto_779587 ?auto_779588 ?auto_779589 ?auto_779590 ?auto_779591 ?auto_779592 ?auto_779593 ?auto_779594 ?auto_779595 ?auto_779596 ?auto_779597 ?auto_779598 ?auto_779599 ?auto_779600 ?auto_779601 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_779649 - BLOCK
      ?auto_779650 - BLOCK
      ?auto_779651 - BLOCK
      ?auto_779652 - BLOCK
      ?auto_779653 - BLOCK
      ?auto_779654 - BLOCK
      ?auto_779655 - BLOCK
      ?auto_779656 - BLOCK
      ?auto_779657 - BLOCK
      ?auto_779658 - BLOCK
      ?auto_779659 - BLOCK
      ?auto_779660 - BLOCK
      ?auto_779661 - BLOCK
      ?auto_779662 - BLOCK
      ?auto_779663 - BLOCK
    )
    :vars
    (
      ?auto_779664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_779663 ?auto_779664 ) ( ON-TABLE ?auto_779649 ) ( ON ?auto_779650 ?auto_779649 ) ( ON ?auto_779651 ?auto_779650 ) ( ON ?auto_779652 ?auto_779651 ) ( ON ?auto_779653 ?auto_779652 ) ( ON ?auto_779654 ?auto_779653 ) ( not ( = ?auto_779649 ?auto_779650 ) ) ( not ( = ?auto_779649 ?auto_779651 ) ) ( not ( = ?auto_779649 ?auto_779652 ) ) ( not ( = ?auto_779649 ?auto_779653 ) ) ( not ( = ?auto_779649 ?auto_779654 ) ) ( not ( = ?auto_779649 ?auto_779655 ) ) ( not ( = ?auto_779649 ?auto_779656 ) ) ( not ( = ?auto_779649 ?auto_779657 ) ) ( not ( = ?auto_779649 ?auto_779658 ) ) ( not ( = ?auto_779649 ?auto_779659 ) ) ( not ( = ?auto_779649 ?auto_779660 ) ) ( not ( = ?auto_779649 ?auto_779661 ) ) ( not ( = ?auto_779649 ?auto_779662 ) ) ( not ( = ?auto_779649 ?auto_779663 ) ) ( not ( = ?auto_779649 ?auto_779664 ) ) ( not ( = ?auto_779650 ?auto_779651 ) ) ( not ( = ?auto_779650 ?auto_779652 ) ) ( not ( = ?auto_779650 ?auto_779653 ) ) ( not ( = ?auto_779650 ?auto_779654 ) ) ( not ( = ?auto_779650 ?auto_779655 ) ) ( not ( = ?auto_779650 ?auto_779656 ) ) ( not ( = ?auto_779650 ?auto_779657 ) ) ( not ( = ?auto_779650 ?auto_779658 ) ) ( not ( = ?auto_779650 ?auto_779659 ) ) ( not ( = ?auto_779650 ?auto_779660 ) ) ( not ( = ?auto_779650 ?auto_779661 ) ) ( not ( = ?auto_779650 ?auto_779662 ) ) ( not ( = ?auto_779650 ?auto_779663 ) ) ( not ( = ?auto_779650 ?auto_779664 ) ) ( not ( = ?auto_779651 ?auto_779652 ) ) ( not ( = ?auto_779651 ?auto_779653 ) ) ( not ( = ?auto_779651 ?auto_779654 ) ) ( not ( = ?auto_779651 ?auto_779655 ) ) ( not ( = ?auto_779651 ?auto_779656 ) ) ( not ( = ?auto_779651 ?auto_779657 ) ) ( not ( = ?auto_779651 ?auto_779658 ) ) ( not ( = ?auto_779651 ?auto_779659 ) ) ( not ( = ?auto_779651 ?auto_779660 ) ) ( not ( = ?auto_779651 ?auto_779661 ) ) ( not ( = ?auto_779651 ?auto_779662 ) ) ( not ( = ?auto_779651 ?auto_779663 ) ) ( not ( = ?auto_779651 ?auto_779664 ) ) ( not ( = ?auto_779652 ?auto_779653 ) ) ( not ( = ?auto_779652 ?auto_779654 ) ) ( not ( = ?auto_779652 ?auto_779655 ) ) ( not ( = ?auto_779652 ?auto_779656 ) ) ( not ( = ?auto_779652 ?auto_779657 ) ) ( not ( = ?auto_779652 ?auto_779658 ) ) ( not ( = ?auto_779652 ?auto_779659 ) ) ( not ( = ?auto_779652 ?auto_779660 ) ) ( not ( = ?auto_779652 ?auto_779661 ) ) ( not ( = ?auto_779652 ?auto_779662 ) ) ( not ( = ?auto_779652 ?auto_779663 ) ) ( not ( = ?auto_779652 ?auto_779664 ) ) ( not ( = ?auto_779653 ?auto_779654 ) ) ( not ( = ?auto_779653 ?auto_779655 ) ) ( not ( = ?auto_779653 ?auto_779656 ) ) ( not ( = ?auto_779653 ?auto_779657 ) ) ( not ( = ?auto_779653 ?auto_779658 ) ) ( not ( = ?auto_779653 ?auto_779659 ) ) ( not ( = ?auto_779653 ?auto_779660 ) ) ( not ( = ?auto_779653 ?auto_779661 ) ) ( not ( = ?auto_779653 ?auto_779662 ) ) ( not ( = ?auto_779653 ?auto_779663 ) ) ( not ( = ?auto_779653 ?auto_779664 ) ) ( not ( = ?auto_779654 ?auto_779655 ) ) ( not ( = ?auto_779654 ?auto_779656 ) ) ( not ( = ?auto_779654 ?auto_779657 ) ) ( not ( = ?auto_779654 ?auto_779658 ) ) ( not ( = ?auto_779654 ?auto_779659 ) ) ( not ( = ?auto_779654 ?auto_779660 ) ) ( not ( = ?auto_779654 ?auto_779661 ) ) ( not ( = ?auto_779654 ?auto_779662 ) ) ( not ( = ?auto_779654 ?auto_779663 ) ) ( not ( = ?auto_779654 ?auto_779664 ) ) ( not ( = ?auto_779655 ?auto_779656 ) ) ( not ( = ?auto_779655 ?auto_779657 ) ) ( not ( = ?auto_779655 ?auto_779658 ) ) ( not ( = ?auto_779655 ?auto_779659 ) ) ( not ( = ?auto_779655 ?auto_779660 ) ) ( not ( = ?auto_779655 ?auto_779661 ) ) ( not ( = ?auto_779655 ?auto_779662 ) ) ( not ( = ?auto_779655 ?auto_779663 ) ) ( not ( = ?auto_779655 ?auto_779664 ) ) ( not ( = ?auto_779656 ?auto_779657 ) ) ( not ( = ?auto_779656 ?auto_779658 ) ) ( not ( = ?auto_779656 ?auto_779659 ) ) ( not ( = ?auto_779656 ?auto_779660 ) ) ( not ( = ?auto_779656 ?auto_779661 ) ) ( not ( = ?auto_779656 ?auto_779662 ) ) ( not ( = ?auto_779656 ?auto_779663 ) ) ( not ( = ?auto_779656 ?auto_779664 ) ) ( not ( = ?auto_779657 ?auto_779658 ) ) ( not ( = ?auto_779657 ?auto_779659 ) ) ( not ( = ?auto_779657 ?auto_779660 ) ) ( not ( = ?auto_779657 ?auto_779661 ) ) ( not ( = ?auto_779657 ?auto_779662 ) ) ( not ( = ?auto_779657 ?auto_779663 ) ) ( not ( = ?auto_779657 ?auto_779664 ) ) ( not ( = ?auto_779658 ?auto_779659 ) ) ( not ( = ?auto_779658 ?auto_779660 ) ) ( not ( = ?auto_779658 ?auto_779661 ) ) ( not ( = ?auto_779658 ?auto_779662 ) ) ( not ( = ?auto_779658 ?auto_779663 ) ) ( not ( = ?auto_779658 ?auto_779664 ) ) ( not ( = ?auto_779659 ?auto_779660 ) ) ( not ( = ?auto_779659 ?auto_779661 ) ) ( not ( = ?auto_779659 ?auto_779662 ) ) ( not ( = ?auto_779659 ?auto_779663 ) ) ( not ( = ?auto_779659 ?auto_779664 ) ) ( not ( = ?auto_779660 ?auto_779661 ) ) ( not ( = ?auto_779660 ?auto_779662 ) ) ( not ( = ?auto_779660 ?auto_779663 ) ) ( not ( = ?auto_779660 ?auto_779664 ) ) ( not ( = ?auto_779661 ?auto_779662 ) ) ( not ( = ?auto_779661 ?auto_779663 ) ) ( not ( = ?auto_779661 ?auto_779664 ) ) ( not ( = ?auto_779662 ?auto_779663 ) ) ( not ( = ?auto_779662 ?auto_779664 ) ) ( not ( = ?auto_779663 ?auto_779664 ) ) ( ON ?auto_779662 ?auto_779663 ) ( ON ?auto_779661 ?auto_779662 ) ( ON ?auto_779660 ?auto_779661 ) ( ON ?auto_779659 ?auto_779660 ) ( ON ?auto_779658 ?auto_779659 ) ( ON ?auto_779657 ?auto_779658 ) ( ON ?auto_779656 ?auto_779657 ) ( CLEAR ?auto_779654 ) ( ON ?auto_779655 ?auto_779656 ) ( CLEAR ?auto_779655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_779649 ?auto_779650 ?auto_779651 ?auto_779652 ?auto_779653 ?auto_779654 ?auto_779655 )
      ( MAKE-15PILE ?auto_779649 ?auto_779650 ?auto_779651 ?auto_779652 ?auto_779653 ?auto_779654 ?auto_779655 ?auto_779656 ?auto_779657 ?auto_779658 ?auto_779659 ?auto_779660 ?auto_779661 ?auto_779662 ?auto_779663 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_779711 - BLOCK
      ?auto_779712 - BLOCK
      ?auto_779713 - BLOCK
      ?auto_779714 - BLOCK
      ?auto_779715 - BLOCK
      ?auto_779716 - BLOCK
      ?auto_779717 - BLOCK
      ?auto_779718 - BLOCK
      ?auto_779719 - BLOCK
      ?auto_779720 - BLOCK
      ?auto_779721 - BLOCK
      ?auto_779722 - BLOCK
      ?auto_779723 - BLOCK
      ?auto_779724 - BLOCK
      ?auto_779725 - BLOCK
    )
    :vars
    (
      ?auto_779726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_779725 ?auto_779726 ) ( ON-TABLE ?auto_779711 ) ( ON ?auto_779712 ?auto_779711 ) ( ON ?auto_779713 ?auto_779712 ) ( ON ?auto_779714 ?auto_779713 ) ( ON ?auto_779715 ?auto_779714 ) ( not ( = ?auto_779711 ?auto_779712 ) ) ( not ( = ?auto_779711 ?auto_779713 ) ) ( not ( = ?auto_779711 ?auto_779714 ) ) ( not ( = ?auto_779711 ?auto_779715 ) ) ( not ( = ?auto_779711 ?auto_779716 ) ) ( not ( = ?auto_779711 ?auto_779717 ) ) ( not ( = ?auto_779711 ?auto_779718 ) ) ( not ( = ?auto_779711 ?auto_779719 ) ) ( not ( = ?auto_779711 ?auto_779720 ) ) ( not ( = ?auto_779711 ?auto_779721 ) ) ( not ( = ?auto_779711 ?auto_779722 ) ) ( not ( = ?auto_779711 ?auto_779723 ) ) ( not ( = ?auto_779711 ?auto_779724 ) ) ( not ( = ?auto_779711 ?auto_779725 ) ) ( not ( = ?auto_779711 ?auto_779726 ) ) ( not ( = ?auto_779712 ?auto_779713 ) ) ( not ( = ?auto_779712 ?auto_779714 ) ) ( not ( = ?auto_779712 ?auto_779715 ) ) ( not ( = ?auto_779712 ?auto_779716 ) ) ( not ( = ?auto_779712 ?auto_779717 ) ) ( not ( = ?auto_779712 ?auto_779718 ) ) ( not ( = ?auto_779712 ?auto_779719 ) ) ( not ( = ?auto_779712 ?auto_779720 ) ) ( not ( = ?auto_779712 ?auto_779721 ) ) ( not ( = ?auto_779712 ?auto_779722 ) ) ( not ( = ?auto_779712 ?auto_779723 ) ) ( not ( = ?auto_779712 ?auto_779724 ) ) ( not ( = ?auto_779712 ?auto_779725 ) ) ( not ( = ?auto_779712 ?auto_779726 ) ) ( not ( = ?auto_779713 ?auto_779714 ) ) ( not ( = ?auto_779713 ?auto_779715 ) ) ( not ( = ?auto_779713 ?auto_779716 ) ) ( not ( = ?auto_779713 ?auto_779717 ) ) ( not ( = ?auto_779713 ?auto_779718 ) ) ( not ( = ?auto_779713 ?auto_779719 ) ) ( not ( = ?auto_779713 ?auto_779720 ) ) ( not ( = ?auto_779713 ?auto_779721 ) ) ( not ( = ?auto_779713 ?auto_779722 ) ) ( not ( = ?auto_779713 ?auto_779723 ) ) ( not ( = ?auto_779713 ?auto_779724 ) ) ( not ( = ?auto_779713 ?auto_779725 ) ) ( not ( = ?auto_779713 ?auto_779726 ) ) ( not ( = ?auto_779714 ?auto_779715 ) ) ( not ( = ?auto_779714 ?auto_779716 ) ) ( not ( = ?auto_779714 ?auto_779717 ) ) ( not ( = ?auto_779714 ?auto_779718 ) ) ( not ( = ?auto_779714 ?auto_779719 ) ) ( not ( = ?auto_779714 ?auto_779720 ) ) ( not ( = ?auto_779714 ?auto_779721 ) ) ( not ( = ?auto_779714 ?auto_779722 ) ) ( not ( = ?auto_779714 ?auto_779723 ) ) ( not ( = ?auto_779714 ?auto_779724 ) ) ( not ( = ?auto_779714 ?auto_779725 ) ) ( not ( = ?auto_779714 ?auto_779726 ) ) ( not ( = ?auto_779715 ?auto_779716 ) ) ( not ( = ?auto_779715 ?auto_779717 ) ) ( not ( = ?auto_779715 ?auto_779718 ) ) ( not ( = ?auto_779715 ?auto_779719 ) ) ( not ( = ?auto_779715 ?auto_779720 ) ) ( not ( = ?auto_779715 ?auto_779721 ) ) ( not ( = ?auto_779715 ?auto_779722 ) ) ( not ( = ?auto_779715 ?auto_779723 ) ) ( not ( = ?auto_779715 ?auto_779724 ) ) ( not ( = ?auto_779715 ?auto_779725 ) ) ( not ( = ?auto_779715 ?auto_779726 ) ) ( not ( = ?auto_779716 ?auto_779717 ) ) ( not ( = ?auto_779716 ?auto_779718 ) ) ( not ( = ?auto_779716 ?auto_779719 ) ) ( not ( = ?auto_779716 ?auto_779720 ) ) ( not ( = ?auto_779716 ?auto_779721 ) ) ( not ( = ?auto_779716 ?auto_779722 ) ) ( not ( = ?auto_779716 ?auto_779723 ) ) ( not ( = ?auto_779716 ?auto_779724 ) ) ( not ( = ?auto_779716 ?auto_779725 ) ) ( not ( = ?auto_779716 ?auto_779726 ) ) ( not ( = ?auto_779717 ?auto_779718 ) ) ( not ( = ?auto_779717 ?auto_779719 ) ) ( not ( = ?auto_779717 ?auto_779720 ) ) ( not ( = ?auto_779717 ?auto_779721 ) ) ( not ( = ?auto_779717 ?auto_779722 ) ) ( not ( = ?auto_779717 ?auto_779723 ) ) ( not ( = ?auto_779717 ?auto_779724 ) ) ( not ( = ?auto_779717 ?auto_779725 ) ) ( not ( = ?auto_779717 ?auto_779726 ) ) ( not ( = ?auto_779718 ?auto_779719 ) ) ( not ( = ?auto_779718 ?auto_779720 ) ) ( not ( = ?auto_779718 ?auto_779721 ) ) ( not ( = ?auto_779718 ?auto_779722 ) ) ( not ( = ?auto_779718 ?auto_779723 ) ) ( not ( = ?auto_779718 ?auto_779724 ) ) ( not ( = ?auto_779718 ?auto_779725 ) ) ( not ( = ?auto_779718 ?auto_779726 ) ) ( not ( = ?auto_779719 ?auto_779720 ) ) ( not ( = ?auto_779719 ?auto_779721 ) ) ( not ( = ?auto_779719 ?auto_779722 ) ) ( not ( = ?auto_779719 ?auto_779723 ) ) ( not ( = ?auto_779719 ?auto_779724 ) ) ( not ( = ?auto_779719 ?auto_779725 ) ) ( not ( = ?auto_779719 ?auto_779726 ) ) ( not ( = ?auto_779720 ?auto_779721 ) ) ( not ( = ?auto_779720 ?auto_779722 ) ) ( not ( = ?auto_779720 ?auto_779723 ) ) ( not ( = ?auto_779720 ?auto_779724 ) ) ( not ( = ?auto_779720 ?auto_779725 ) ) ( not ( = ?auto_779720 ?auto_779726 ) ) ( not ( = ?auto_779721 ?auto_779722 ) ) ( not ( = ?auto_779721 ?auto_779723 ) ) ( not ( = ?auto_779721 ?auto_779724 ) ) ( not ( = ?auto_779721 ?auto_779725 ) ) ( not ( = ?auto_779721 ?auto_779726 ) ) ( not ( = ?auto_779722 ?auto_779723 ) ) ( not ( = ?auto_779722 ?auto_779724 ) ) ( not ( = ?auto_779722 ?auto_779725 ) ) ( not ( = ?auto_779722 ?auto_779726 ) ) ( not ( = ?auto_779723 ?auto_779724 ) ) ( not ( = ?auto_779723 ?auto_779725 ) ) ( not ( = ?auto_779723 ?auto_779726 ) ) ( not ( = ?auto_779724 ?auto_779725 ) ) ( not ( = ?auto_779724 ?auto_779726 ) ) ( not ( = ?auto_779725 ?auto_779726 ) ) ( ON ?auto_779724 ?auto_779725 ) ( ON ?auto_779723 ?auto_779724 ) ( ON ?auto_779722 ?auto_779723 ) ( ON ?auto_779721 ?auto_779722 ) ( ON ?auto_779720 ?auto_779721 ) ( ON ?auto_779719 ?auto_779720 ) ( ON ?auto_779718 ?auto_779719 ) ( ON ?auto_779717 ?auto_779718 ) ( CLEAR ?auto_779715 ) ( ON ?auto_779716 ?auto_779717 ) ( CLEAR ?auto_779716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_779711 ?auto_779712 ?auto_779713 ?auto_779714 ?auto_779715 ?auto_779716 )
      ( MAKE-15PILE ?auto_779711 ?auto_779712 ?auto_779713 ?auto_779714 ?auto_779715 ?auto_779716 ?auto_779717 ?auto_779718 ?auto_779719 ?auto_779720 ?auto_779721 ?auto_779722 ?auto_779723 ?auto_779724 ?auto_779725 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_779773 - BLOCK
      ?auto_779774 - BLOCK
      ?auto_779775 - BLOCK
      ?auto_779776 - BLOCK
      ?auto_779777 - BLOCK
      ?auto_779778 - BLOCK
      ?auto_779779 - BLOCK
      ?auto_779780 - BLOCK
      ?auto_779781 - BLOCK
      ?auto_779782 - BLOCK
      ?auto_779783 - BLOCK
      ?auto_779784 - BLOCK
      ?auto_779785 - BLOCK
      ?auto_779786 - BLOCK
      ?auto_779787 - BLOCK
    )
    :vars
    (
      ?auto_779788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_779787 ?auto_779788 ) ( ON-TABLE ?auto_779773 ) ( ON ?auto_779774 ?auto_779773 ) ( ON ?auto_779775 ?auto_779774 ) ( ON ?auto_779776 ?auto_779775 ) ( not ( = ?auto_779773 ?auto_779774 ) ) ( not ( = ?auto_779773 ?auto_779775 ) ) ( not ( = ?auto_779773 ?auto_779776 ) ) ( not ( = ?auto_779773 ?auto_779777 ) ) ( not ( = ?auto_779773 ?auto_779778 ) ) ( not ( = ?auto_779773 ?auto_779779 ) ) ( not ( = ?auto_779773 ?auto_779780 ) ) ( not ( = ?auto_779773 ?auto_779781 ) ) ( not ( = ?auto_779773 ?auto_779782 ) ) ( not ( = ?auto_779773 ?auto_779783 ) ) ( not ( = ?auto_779773 ?auto_779784 ) ) ( not ( = ?auto_779773 ?auto_779785 ) ) ( not ( = ?auto_779773 ?auto_779786 ) ) ( not ( = ?auto_779773 ?auto_779787 ) ) ( not ( = ?auto_779773 ?auto_779788 ) ) ( not ( = ?auto_779774 ?auto_779775 ) ) ( not ( = ?auto_779774 ?auto_779776 ) ) ( not ( = ?auto_779774 ?auto_779777 ) ) ( not ( = ?auto_779774 ?auto_779778 ) ) ( not ( = ?auto_779774 ?auto_779779 ) ) ( not ( = ?auto_779774 ?auto_779780 ) ) ( not ( = ?auto_779774 ?auto_779781 ) ) ( not ( = ?auto_779774 ?auto_779782 ) ) ( not ( = ?auto_779774 ?auto_779783 ) ) ( not ( = ?auto_779774 ?auto_779784 ) ) ( not ( = ?auto_779774 ?auto_779785 ) ) ( not ( = ?auto_779774 ?auto_779786 ) ) ( not ( = ?auto_779774 ?auto_779787 ) ) ( not ( = ?auto_779774 ?auto_779788 ) ) ( not ( = ?auto_779775 ?auto_779776 ) ) ( not ( = ?auto_779775 ?auto_779777 ) ) ( not ( = ?auto_779775 ?auto_779778 ) ) ( not ( = ?auto_779775 ?auto_779779 ) ) ( not ( = ?auto_779775 ?auto_779780 ) ) ( not ( = ?auto_779775 ?auto_779781 ) ) ( not ( = ?auto_779775 ?auto_779782 ) ) ( not ( = ?auto_779775 ?auto_779783 ) ) ( not ( = ?auto_779775 ?auto_779784 ) ) ( not ( = ?auto_779775 ?auto_779785 ) ) ( not ( = ?auto_779775 ?auto_779786 ) ) ( not ( = ?auto_779775 ?auto_779787 ) ) ( not ( = ?auto_779775 ?auto_779788 ) ) ( not ( = ?auto_779776 ?auto_779777 ) ) ( not ( = ?auto_779776 ?auto_779778 ) ) ( not ( = ?auto_779776 ?auto_779779 ) ) ( not ( = ?auto_779776 ?auto_779780 ) ) ( not ( = ?auto_779776 ?auto_779781 ) ) ( not ( = ?auto_779776 ?auto_779782 ) ) ( not ( = ?auto_779776 ?auto_779783 ) ) ( not ( = ?auto_779776 ?auto_779784 ) ) ( not ( = ?auto_779776 ?auto_779785 ) ) ( not ( = ?auto_779776 ?auto_779786 ) ) ( not ( = ?auto_779776 ?auto_779787 ) ) ( not ( = ?auto_779776 ?auto_779788 ) ) ( not ( = ?auto_779777 ?auto_779778 ) ) ( not ( = ?auto_779777 ?auto_779779 ) ) ( not ( = ?auto_779777 ?auto_779780 ) ) ( not ( = ?auto_779777 ?auto_779781 ) ) ( not ( = ?auto_779777 ?auto_779782 ) ) ( not ( = ?auto_779777 ?auto_779783 ) ) ( not ( = ?auto_779777 ?auto_779784 ) ) ( not ( = ?auto_779777 ?auto_779785 ) ) ( not ( = ?auto_779777 ?auto_779786 ) ) ( not ( = ?auto_779777 ?auto_779787 ) ) ( not ( = ?auto_779777 ?auto_779788 ) ) ( not ( = ?auto_779778 ?auto_779779 ) ) ( not ( = ?auto_779778 ?auto_779780 ) ) ( not ( = ?auto_779778 ?auto_779781 ) ) ( not ( = ?auto_779778 ?auto_779782 ) ) ( not ( = ?auto_779778 ?auto_779783 ) ) ( not ( = ?auto_779778 ?auto_779784 ) ) ( not ( = ?auto_779778 ?auto_779785 ) ) ( not ( = ?auto_779778 ?auto_779786 ) ) ( not ( = ?auto_779778 ?auto_779787 ) ) ( not ( = ?auto_779778 ?auto_779788 ) ) ( not ( = ?auto_779779 ?auto_779780 ) ) ( not ( = ?auto_779779 ?auto_779781 ) ) ( not ( = ?auto_779779 ?auto_779782 ) ) ( not ( = ?auto_779779 ?auto_779783 ) ) ( not ( = ?auto_779779 ?auto_779784 ) ) ( not ( = ?auto_779779 ?auto_779785 ) ) ( not ( = ?auto_779779 ?auto_779786 ) ) ( not ( = ?auto_779779 ?auto_779787 ) ) ( not ( = ?auto_779779 ?auto_779788 ) ) ( not ( = ?auto_779780 ?auto_779781 ) ) ( not ( = ?auto_779780 ?auto_779782 ) ) ( not ( = ?auto_779780 ?auto_779783 ) ) ( not ( = ?auto_779780 ?auto_779784 ) ) ( not ( = ?auto_779780 ?auto_779785 ) ) ( not ( = ?auto_779780 ?auto_779786 ) ) ( not ( = ?auto_779780 ?auto_779787 ) ) ( not ( = ?auto_779780 ?auto_779788 ) ) ( not ( = ?auto_779781 ?auto_779782 ) ) ( not ( = ?auto_779781 ?auto_779783 ) ) ( not ( = ?auto_779781 ?auto_779784 ) ) ( not ( = ?auto_779781 ?auto_779785 ) ) ( not ( = ?auto_779781 ?auto_779786 ) ) ( not ( = ?auto_779781 ?auto_779787 ) ) ( not ( = ?auto_779781 ?auto_779788 ) ) ( not ( = ?auto_779782 ?auto_779783 ) ) ( not ( = ?auto_779782 ?auto_779784 ) ) ( not ( = ?auto_779782 ?auto_779785 ) ) ( not ( = ?auto_779782 ?auto_779786 ) ) ( not ( = ?auto_779782 ?auto_779787 ) ) ( not ( = ?auto_779782 ?auto_779788 ) ) ( not ( = ?auto_779783 ?auto_779784 ) ) ( not ( = ?auto_779783 ?auto_779785 ) ) ( not ( = ?auto_779783 ?auto_779786 ) ) ( not ( = ?auto_779783 ?auto_779787 ) ) ( not ( = ?auto_779783 ?auto_779788 ) ) ( not ( = ?auto_779784 ?auto_779785 ) ) ( not ( = ?auto_779784 ?auto_779786 ) ) ( not ( = ?auto_779784 ?auto_779787 ) ) ( not ( = ?auto_779784 ?auto_779788 ) ) ( not ( = ?auto_779785 ?auto_779786 ) ) ( not ( = ?auto_779785 ?auto_779787 ) ) ( not ( = ?auto_779785 ?auto_779788 ) ) ( not ( = ?auto_779786 ?auto_779787 ) ) ( not ( = ?auto_779786 ?auto_779788 ) ) ( not ( = ?auto_779787 ?auto_779788 ) ) ( ON ?auto_779786 ?auto_779787 ) ( ON ?auto_779785 ?auto_779786 ) ( ON ?auto_779784 ?auto_779785 ) ( ON ?auto_779783 ?auto_779784 ) ( ON ?auto_779782 ?auto_779783 ) ( ON ?auto_779781 ?auto_779782 ) ( ON ?auto_779780 ?auto_779781 ) ( ON ?auto_779779 ?auto_779780 ) ( ON ?auto_779778 ?auto_779779 ) ( CLEAR ?auto_779776 ) ( ON ?auto_779777 ?auto_779778 ) ( CLEAR ?auto_779777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_779773 ?auto_779774 ?auto_779775 ?auto_779776 ?auto_779777 )
      ( MAKE-15PILE ?auto_779773 ?auto_779774 ?auto_779775 ?auto_779776 ?auto_779777 ?auto_779778 ?auto_779779 ?auto_779780 ?auto_779781 ?auto_779782 ?auto_779783 ?auto_779784 ?auto_779785 ?auto_779786 ?auto_779787 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_779835 - BLOCK
      ?auto_779836 - BLOCK
      ?auto_779837 - BLOCK
      ?auto_779838 - BLOCK
      ?auto_779839 - BLOCK
      ?auto_779840 - BLOCK
      ?auto_779841 - BLOCK
      ?auto_779842 - BLOCK
      ?auto_779843 - BLOCK
      ?auto_779844 - BLOCK
      ?auto_779845 - BLOCK
      ?auto_779846 - BLOCK
      ?auto_779847 - BLOCK
      ?auto_779848 - BLOCK
      ?auto_779849 - BLOCK
    )
    :vars
    (
      ?auto_779850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_779849 ?auto_779850 ) ( ON-TABLE ?auto_779835 ) ( ON ?auto_779836 ?auto_779835 ) ( ON ?auto_779837 ?auto_779836 ) ( not ( = ?auto_779835 ?auto_779836 ) ) ( not ( = ?auto_779835 ?auto_779837 ) ) ( not ( = ?auto_779835 ?auto_779838 ) ) ( not ( = ?auto_779835 ?auto_779839 ) ) ( not ( = ?auto_779835 ?auto_779840 ) ) ( not ( = ?auto_779835 ?auto_779841 ) ) ( not ( = ?auto_779835 ?auto_779842 ) ) ( not ( = ?auto_779835 ?auto_779843 ) ) ( not ( = ?auto_779835 ?auto_779844 ) ) ( not ( = ?auto_779835 ?auto_779845 ) ) ( not ( = ?auto_779835 ?auto_779846 ) ) ( not ( = ?auto_779835 ?auto_779847 ) ) ( not ( = ?auto_779835 ?auto_779848 ) ) ( not ( = ?auto_779835 ?auto_779849 ) ) ( not ( = ?auto_779835 ?auto_779850 ) ) ( not ( = ?auto_779836 ?auto_779837 ) ) ( not ( = ?auto_779836 ?auto_779838 ) ) ( not ( = ?auto_779836 ?auto_779839 ) ) ( not ( = ?auto_779836 ?auto_779840 ) ) ( not ( = ?auto_779836 ?auto_779841 ) ) ( not ( = ?auto_779836 ?auto_779842 ) ) ( not ( = ?auto_779836 ?auto_779843 ) ) ( not ( = ?auto_779836 ?auto_779844 ) ) ( not ( = ?auto_779836 ?auto_779845 ) ) ( not ( = ?auto_779836 ?auto_779846 ) ) ( not ( = ?auto_779836 ?auto_779847 ) ) ( not ( = ?auto_779836 ?auto_779848 ) ) ( not ( = ?auto_779836 ?auto_779849 ) ) ( not ( = ?auto_779836 ?auto_779850 ) ) ( not ( = ?auto_779837 ?auto_779838 ) ) ( not ( = ?auto_779837 ?auto_779839 ) ) ( not ( = ?auto_779837 ?auto_779840 ) ) ( not ( = ?auto_779837 ?auto_779841 ) ) ( not ( = ?auto_779837 ?auto_779842 ) ) ( not ( = ?auto_779837 ?auto_779843 ) ) ( not ( = ?auto_779837 ?auto_779844 ) ) ( not ( = ?auto_779837 ?auto_779845 ) ) ( not ( = ?auto_779837 ?auto_779846 ) ) ( not ( = ?auto_779837 ?auto_779847 ) ) ( not ( = ?auto_779837 ?auto_779848 ) ) ( not ( = ?auto_779837 ?auto_779849 ) ) ( not ( = ?auto_779837 ?auto_779850 ) ) ( not ( = ?auto_779838 ?auto_779839 ) ) ( not ( = ?auto_779838 ?auto_779840 ) ) ( not ( = ?auto_779838 ?auto_779841 ) ) ( not ( = ?auto_779838 ?auto_779842 ) ) ( not ( = ?auto_779838 ?auto_779843 ) ) ( not ( = ?auto_779838 ?auto_779844 ) ) ( not ( = ?auto_779838 ?auto_779845 ) ) ( not ( = ?auto_779838 ?auto_779846 ) ) ( not ( = ?auto_779838 ?auto_779847 ) ) ( not ( = ?auto_779838 ?auto_779848 ) ) ( not ( = ?auto_779838 ?auto_779849 ) ) ( not ( = ?auto_779838 ?auto_779850 ) ) ( not ( = ?auto_779839 ?auto_779840 ) ) ( not ( = ?auto_779839 ?auto_779841 ) ) ( not ( = ?auto_779839 ?auto_779842 ) ) ( not ( = ?auto_779839 ?auto_779843 ) ) ( not ( = ?auto_779839 ?auto_779844 ) ) ( not ( = ?auto_779839 ?auto_779845 ) ) ( not ( = ?auto_779839 ?auto_779846 ) ) ( not ( = ?auto_779839 ?auto_779847 ) ) ( not ( = ?auto_779839 ?auto_779848 ) ) ( not ( = ?auto_779839 ?auto_779849 ) ) ( not ( = ?auto_779839 ?auto_779850 ) ) ( not ( = ?auto_779840 ?auto_779841 ) ) ( not ( = ?auto_779840 ?auto_779842 ) ) ( not ( = ?auto_779840 ?auto_779843 ) ) ( not ( = ?auto_779840 ?auto_779844 ) ) ( not ( = ?auto_779840 ?auto_779845 ) ) ( not ( = ?auto_779840 ?auto_779846 ) ) ( not ( = ?auto_779840 ?auto_779847 ) ) ( not ( = ?auto_779840 ?auto_779848 ) ) ( not ( = ?auto_779840 ?auto_779849 ) ) ( not ( = ?auto_779840 ?auto_779850 ) ) ( not ( = ?auto_779841 ?auto_779842 ) ) ( not ( = ?auto_779841 ?auto_779843 ) ) ( not ( = ?auto_779841 ?auto_779844 ) ) ( not ( = ?auto_779841 ?auto_779845 ) ) ( not ( = ?auto_779841 ?auto_779846 ) ) ( not ( = ?auto_779841 ?auto_779847 ) ) ( not ( = ?auto_779841 ?auto_779848 ) ) ( not ( = ?auto_779841 ?auto_779849 ) ) ( not ( = ?auto_779841 ?auto_779850 ) ) ( not ( = ?auto_779842 ?auto_779843 ) ) ( not ( = ?auto_779842 ?auto_779844 ) ) ( not ( = ?auto_779842 ?auto_779845 ) ) ( not ( = ?auto_779842 ?auto_779846 ) ) ( not ( = ?auto_779842 ?auto_779847 ) ) ( not ( = ?auto_779842 ?auto_779848 ) ) ( not ( = ?auto_779842 ?auto_779849 ) ) ( not ( = ?auto_779842 ?auto_779850 ) ) ( not ( = ?auto_779843 ?auto_779844 ) ) ( not ( = ?auto_779843 ?auto_779845 ) ) ( not ( = ?auto_779843 ?auto_779846 ) ) ( not ( = ?auto_779843 ?auto_779847 ) ) ( not ( = ?auto_779843 ?auto_779848 ) ) ( not ( = ?auto_779843 ?auto_779849 ) ) ( not ( = ?auto_779843 ?auto_779850 ) ) ( not ( = ?auto_779844 ?auto_779845 ) ) ( not ( = ?auto_779844 ?auto_779846 ) ) ( not ( = ?auto_779844 ?auto_779847 ) ) ( not ( = ?auto_779844 ?auto_779848 ) ) ( not ( = ?auto_779844 ?auto_779849 ) ) ( not ( = ?auto_779844 ?auto_779850 ) ) ( not ( = ?auto_779845 ?auto_779846 ) ) ( not ( = ?auto_779845 ?auto_779847 ) ) ( not ( = ?auto_779845 ?auto_779848 ) ) ( not ( = ?auto_779845 ?auto_779849 ) ) ( not ( = ?auto_779845 ?auto_779850 ) ) ( not ( = ?auto_779846 ?auto_779847 ) ) ( not ( = ?auto_779846 ?auto_779848 ) ) ( not ( = ?auto_779846 ?auto_779849 ) ) ( not ( = ?auto_779846 ?auto_779850 ) ) ( not ( = ?auto_779847 ?auto_779848 ) ) ( not ( = ?auto_779847 ?auto_779849 ) ) ( not ( = ?auto_779847 ?auto_779850 ) ) ( not ( = ?auto_779848 ?auto_779849 ) ) ( not ( = ?auto_779848 ?auto_779850 ) ) ( not ( = ?auto_779849 ?auto_779850 ) ) ( ON ?auto_779848 ?auto_779849 ) ( ON ?auto_779847 ?auto_779848 ) ( ON ?auto_779846 ?auto_779847 ) ( ON ?auto_779845 ?auto_779846 ) ( ON ?auto_779844 ?auto_779845 ) ( ON ?auto_779843 ?auto_779844 ) ( ON ?auto_779842 ?auto_779843 ) ( ON ?auto_779841 ?auto_779842 ) ( ON ?auto_779840 ?auto_779841 ) ( ON ?auto_779839 ?auto_779840 ) ( CLEAR ?auto_779837 ) ( ON ?auto_779838 ?auto_779839 ) ( CLEAR ?auto_779838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_779835 ?auto_779836 ?auto_779837 ?auto_779838 )
      ( MAKE-15PILE ?auto_779835 ?auto_779836 ?auto_779837 ?auto_779838 ?auto_779839 ?auto_779840 ?auto_779841 ?auto_779842 ?auto_779843 ?auto_779844 ?auto_779845 ?auto_779846 ?auto_779847 ?auto_779848 ?auto_779849 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_779897 - BLOCK
      ?auto_779898 - BLOCK
      ?auto_779899 - BLOCK
      ?auto_779900 - BLOCK
      ?auto_779901 - BLOCK
      ?auto_779902 - BLOCK
      ?auto_779903 - BLOCK
      ?auto_779904 - BLOCK
      ?auto_779905 - BLOCK
      ?auto_779906 - BLOCK
      ?auto_779907 - BLOCK
      ?auto_779908 - BLOCK
      ?auto_779909 - BLOCK
      ?auto_779910 - BLOCK
      ?auto_779911 - BLOCK
    )
    :vars
    (
      ?auto_779912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_779911 ?auto_779912 ) ( ON-TABLE ?auto_779897 ) ( ON ?auto_779898 ?auto_779897 ) ( not ( = ?auto_779897 ?auto_779898 ) ) ( not ( = ?auto_779897 ?auto_779899 ) ) ( not ( = ?auto_779897 ?auto_779900 ) ) ( not ( = ?auto_779897 ?auto_779901 ) ) ( not ( = ?auto_779897 ?auto_779902 ) ) ( not ( = ?auto_779897 ?auto_779903 ) ) ( not ( = ?auto_779897 ?auto_779904 ) ) ( not ( = ?auto_779897 ?auto_779905 ) ) ( not ( = ?auto_779897 ?auto_779906 ) ) ( not ( = ?auto_779897 ?auto_779907 ) ) ( not ( = ?auto_779897 ?auto_779908 ) ) ( not ( = ?auto_779897 ?auto_779909 ) ) ( not ( = ?auto_779897 ?auto_779910 ) ) ( not ( = ?auto_779897 ?auto_779911 ) ) ( not ( = ?auto_779897 ?auto_779912 ) ) ( not ( = ?auto_779898 ?auto_779899 ) ) ( not ( = ?auto_779898 ?auto_779900 ) ) ( not ( = ?auto_779898 ?auto_779901 ) ) ( not ( = ?auto_779898 ?auto_779902 ) ) ( not ( = ?auto_779898 ?auto_779903 ) ) ( not ( = ?auto_779898 ?auto_779904 ) ) ( not ( = ?auto_779898 ?auto_779905 ) ) ( not ( = ?auto_779898 ?auto_779906 ) ) ( not ( = ?auto_779898 ?auto_779907 ) ) ( not ( = ?auto_779898 ?auto_779908 ) ) ( not ( = ?auto_779898 ?auto_779909 ) ) ( not ( = ?auto_779898 ?auto_779910 ) ) ( not ( = ?auto_779898 ?auto_779911 ) ) ( not ( = ?auto_779898 ?auto_779912 ) ) ( not ( = ?auto_779899 ?auto_779900 ) ) ( not ( = ?auto_779899 ?auto_779901 ) ) ( not ( = ?auto_779899 ?auto_779902 ) ) ( not ( = ?auto_779899 ?auto_779903 ) ) ( not ( = ?auto_779899 ?auto_779904 ) ) ( not ( = ?auto_779899 ?auto_779905 ) ) ( not ( = ?auto_779899 ?auto_779906 ) ) ( not ( = ?auto_779899 ?auto_779907 ) ) ( not ( = ?auto_779899 ?auto_779908 ) ) ( not ( = ?auto_779899 ?auto_779909 ) ) ( not ( = ?auto_779899 ?auto_779910 ) ) ( not ( = ?auto_779899 ?auto_779911 ) ) ( not ( = ?auto_779899 ?auto_779912 ) ) ( not ( = ?auto_779900 ?auto_779901 ) ) ( not ( = ?auto_779900 ?auto_779902 ) ) ( not ( = ?auto_779900 ?auto_779903 ) ) ( not ( = ?auto_779900 ?auto_779904 ) ) ( not ( = ?auto_779900 ?auto_779905 ) ) ( not ( = ?auto_779900 ?auto_779906 ) ) ( not ( = ?auto_779900 ?auto_779907 ) ) ( not ( = ?auto_779900 ?auto_779908 ) ) ( not ( = ?auto_779900 ?auto_779909 ) ) ( not ( = ?auto_779900 ?auto_779910 ) ) ( not ( = ?auto_779900 ?auto_779911 ) ) ( not ( = ?auto_779900 ?auto_779912 ) ) ( not ( = ?auto_779901 ?auto_779902 ) ) ( not ( = ?auto_779901 ?auto_779903 ) ) ( not ( = ?auto_779901 ?auto_779904 ) ) ( not ( = ?auto_779901 ?auto_779905 ) ) ( not ( = ?auto_779901 ?auto_779906 ) ) ( not ( = ?auto_779901 ?auto_779907 ) ) ( not ( = ?auto_779901 ?auto_779908 ) ) ( not ( = ?auto_779901 ?auto_779909 ) ) ( not ( = ?auto_779901 ?auto_779910 ) ) ( not ( = ?auto_779901 ?auto_779911 ) ) ( not ( = ?auto_779901 ?auto_779912 ) ) ( not ( = ?auto_779902 ?auto_779903 ) ) ( not ( = ?auto_779902 ?auto_779904 ) ) ( not ( = ?auto_779902 ?auto_779905 ) ) ( not ( = ?auto_779902 ?auto_779906 ) ) ( not ( = ?auto_779902 ?auto_779907 ) ) ( not ( = ?auto_779902 ?auto_779908 ) ) ( not ( = ?auto_779902 ?auto_779909 ) ) ( not ( = ?auto_779902 ?auto_779910 ) ) ( not ( = ?auto_779902 ?auto_779911 ) ) ( not ( = ?auto_779902 ?auto_779912 ) ) ( not ( = ?auto_779903 ?auto_779904 ) ) ( not ( = ?auto_779903 ?auto_779905 ) ) ( not ( = ?auto_779903 ?auto_779906 ) ) ( not ( = ?auto_779903 ?auto_779907 ) ) ( not ( = ?auto_779903 ?auto_779908 ) ) ( not ( = ?auto_779903 ?auto_779909 ) ) ( not ( = ?auto_779903 ?auto_779910 ) ) ( not ( = ?auto_779903 ?auto_779911 ) ) ( not ( = ?auto_779903 ?auto_779912 ) ) ( not ( = ?auto_779904 ?auto_779905 ) ) ( not ( = ?auto_779904 ?auto_779906 ) ) ( not ( = ?auto_779904 ?auto_779907 ) ) ( not ( = ?auto_779904 ?auto_779908 ) ) ( not ( = ?auto_779904 ?auto_779909 ) ) ( not ( = ?auto_779904 ?auto_779910 ) ) ( not ( = ?auto_779904 ?auto_779911 ) ) ( not ( = ?auto_779904 ?auto_779912 ) ) ( not ( = ?auto_779905 ?auto_779906 ) ) ( not ( = ?auto_779905 ?auto_779907 ) ) ( not ( = ?auto_779905 ?auto_779908 ) ) ( not ( = ?auto_779905 ?auto_779909 ) ) ( not ( = ?auto_779905 ?auto_779910 ) ) ( not ( = ?auto_779905 ?auto_779911 ) ) ( not ( = ?auto_779905 ?auto_779912 ) ) ( not ( = ?auto_779906 ?auto_779907 ) ) ( not ( = ?auto_779906 ?auto_779908 ) ) ( not ( = ?auto_779906 ?auto_779909 ) ) ( not ( = ?auto_779906 ?auto_779910 ) ) ( not ( = ?auto_779906 ?auto_779911 ) ) ( not ( = ?auto_779906 ?auto_779912 ) ) ( not ( = ?auto_779907 ?auto_779908 ) ) ( not ( = ?auto_779907 ?auto_779909 ) ) ( not ( = ?auto_779907 ?auto_779910 ) ) ( not ( = ?auto_779907 ?auto_779911 ) ) ( not ( = ?auto_779907 ?auto_779912 ) ) ( not ( = ?auto_779908 ?auto_779909 ) ) ( not ( = ?auto_779908 ?auto_779910 ) ) ( not ( = ?auto_779908 ?auto_779911 ) ) ( not ( = ?auto_779908 ?auto_779912 ) ) ( not ( = ?auto_779909 ?auto_779910 ) ) ( not ( = ?auto_779909 ?auto_779911 ) ) ( not ( = ?auto_779909 ?auto_779912 ) ) ( not ( = ?auto_779910 ?auto_779911 ) ) ( not ( = ?auto_779910 ?auto_779912 ) ) ( not ( = ?auto_779911 ?auto_779912 ) ) ( ON ?auto_779910 ?auto_779911 ) ( ON ?auto_779909 ?auto_779910 ) ( ON ?auto_779908 ?auto_779909 ) ( ON ?auto_779907 ?auto_779908 ) ( ON ?auto_779906 ?auto_779907 ) ( ON ?auto_779905 ?auto_779906 ) ( ON ?auto_779904 ?auto_779905 ) ( ON ?auto_779903 ?auto_779904 ) ( ON ?auto_779902 ?auto_779903 ) ( ON ?auto_779901 ?auto_779902 ) ( ON ?auto_779900 ?auto_779901 ) ( CLEAR ?auto_779898 ) ( ON ?auto_779899 ?auto_779900 ) ( CLEAR ?auto_779899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_779897 ?auto_779898 ?auto_779899 )
      ( MAKE-15PILE ?auto_779897 ?auto_779898 ?auto_779899 ?auto_779900 ?auto_779901 ?auto_779902 ?auto_779903 ?auto_779904 ?auto_779905 ?auto_779906 ?auto_779907 ?auto_779908 ?auto_779909 ?auto_779910 ?auto_779911 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_779959 - BLOCK
      ?auto_779960 - BLOCK
      ?auto_779961 - BLOCK
      ?auto_779962 - BLOCK
      ?auto_779963 - BLOCK
      ?auto_779964 - BLOCK
      ?auto_779965 - BLOCK
      ?auto_779966 - BLOCK
      ?auto_779967 - BLOCK
      ?auto_779968 - BLOCK
      ?auto_779969 - BLOCK
      ?auto_779970 - BLOCK
      ?auto_779971 - BLOCK
      ?auto_779972 - BLOCK
      ?auto_779973 - BLOCK
    )
    :vars
    (
      ?auto_779974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_779973 ?auto_779974 ) ( ON-TABLE ?auto_779959 ) ( not ( = ?auto_779959 ?auto_779960 ) ) ( not ( = ?auto_779959 ?auto_779961 ) ) ( not ( = ?auto_779959 ?auto_779962 ) ) ( not ( = ?auto_779959 ?auto_779963 ) ) ( not ( = ?auto_779959 ?auto_779964 ) ) ( not ( = ?auto_779959 ?auto_779965 ) ) ( not ( = ?auto_779959 ?auto_779966 ) ) ( not ( = ?auto_779959 ?auto_779967 ) ) ( not ( = ?auto_779959 ?auto_779968 ) ) ( not ( = ?auto_779959 ?auto_779969 ) ) ( not ( = ?auto_779959 ?auto_779970 ) ) ( not ( = ?auto_779959 ?auto_779971 ) ) ( not ( = ?auto_779959 ?auto_779972 ) ) ( not ( = ?auto_779959 ?auto_779973 ) ) ( not ( = ?auto_779959 ?auto_779974 ) ) ( not ( = ?auto_779960 ?auto_779961 ) ) ( not ( = ?auto_779960 ?auto_779962 ) ) ( not ( = ?auto_779960 ?auto_779963 ) ) ( not ( = ?auto_779960 ?auto_779964 ) ) ( not ( = ?auto_779960 ?auto_779965 ) ) ( not ( = ?auto_779960 ?auto_779966 ) ) ( not ( = ?auto_779960 ?auto_779967 ) ) ( not ( = ?auto_779960 ?auto_779968 ) ) ( not ( = ?auto_779960 ?auto_779969 ) ) ( not ( = ?auto_779960 ?auto_779970 ) ) ( not ( = ?auto_779960 ?auto_779971 ) ) ( not ( = ?auto_779960 ?auto_779972 ) ) ( not ( = ?auto_779960 ?auto_779973 ) ) ( not ( = ?auto_779960 ?auto_779974 ) ) ( not ( = ?auto_779961 ?auto_779962 ) ) ( not ( = ?auto_779961 ?auto_779963 ) ) ( not ( = ?auto_779961 ?auto_779964 ) ) ( not ( = ?auto_779961 ?auto_779965 ) ) ( not ( = ?auto_779961 ?auto_779966 ) ) ( not ( = ?auto_779961 ?auto_779967 ) ) ( not ( = ?auto_779961 ?auto_779968 ) ) ( not ( = ?auto_779961 ?auto_779969 ) ) ( not ( = ?auto_779961 ?auto_779970 ) ) ( not ( = ?auto_779961 ?auto_779971 ) ) ( not ( = ?auto_779961 ?auto_779972 ) ) ( not ( = ?auto_779961 ?auto_779973 ) ) ( not ( = ?auto_779961 ?auto_779974 ) ) ( not ( = ?auto_779962 ?auto_779963 ) ) ( not ( = ?auto_779962 ?auto_779964 ) ) ( not ( = ?auto_779962 ?auto_779965 ) ) ( not ( = ?auto_779962 ?auto_779966 ) ) ( not ( = ?auto_779962 ?auto_779967 ) ) ( not ( = ?auto_779962 ?auto_779968 ) ) ( not ( = ?auto_779962 ?auto_779969 ) ) ( not ( = ?auto_779962 ?auto_779970 ) ) ( not ( = ?auto_779962 ?auto_779971 ) ) ( not ( = ?auto_779962 ?auto_779972 ) ) ( not ( = ?auto_779962 ?auto_779973 ) ) ( not ( = ?auto_779962 ?auto_779974 ) ) ( not ( = ?auto_779963 ?auto_779964 ) ) ( not ( = ?auto_779963 ?auto_779965 ) ) ( not ( = ?auto_779963 ?auto_779966 ) ) ( not ( = ?auto_779963 ?auto_779967 ) ) ( not ( = ?auto_779963 ?auto_779968 ) ) ( not ( = ?auto_779963 ?auto_779969 ) ) ( not ( = ?auto_779963 ?auto_779970 ) ) ( not ( = ?auto_779963 ?auto_779971 ) ) ( not ( = ?auto_779963 ?auto_779972 ) ) ( not ( = ?auto_779963 ?auto_779973 ) ) ( not ( = ?auto_779963 ?auto_779974 ) ) ( not ( = ?auto_779964 ?auto_779965 ) ) ( not ( = ?auto_779964 ?auto_779966 ) ) ( not ( = ?auto_779964 ?auto_779967 ) ) ( not ( = ?auto_779964 ?auto_779968 ) ) ( not ( = ?auto_779964 ?auto_779969 ) ) ( not ( = ?auto_779964 ?auto_779970 ) ) ( not ( = ?auto_779964 ?auto_779971 ) ) ( not ( = ?auto_779964 ?auto_779972 ) ) ( not ( = ?auto_779964 ?auto_779973 ) ) ( not ( = ?auto_779964 ?auto_779974 ) ) ( not ( = ?auto_779965 ?auto_779966 ) ) ( not ( = ?auto_779965 ?auto_779967 ) ) ( not ( = ?auto_779965 ?auto_779968 ) ) ( not ( = ?auto_779965 ?auto_779969 ) ) ( not ( = ?auto_779965 ?auto_779970 ) ) ( not ( = ?auto_779965 ?auto_779971 ) ) ( not ( = ?auto_779965 ?auto_779972 ) ) ( not ( = ?auto_779965 ?auto_779973 ) ) ( not ( = ?auto_779965 ?auto_779974 ) ) ( not ( = ?auto_779966 ?auto_779967 ) ) ( not ( = ?auto_779966 ?auto_779968 ) ) ( not ( = ?auto_779966 ?auto_779969 ) ) ( not ( = ?auto_779966 ?auto_779970 ) ) ( not ( = ?auto_779966 ?auto_779971 ) ) ( not ( = ?auto_779966 ?auto_779972 ) ) ( not ( = ?auto_779966 ?auto_779973 ) ) ( not ( = ?auto_779966 ?auto_779974 ) ) ( not ( = ?auto_779967 ?auto_779968 ) ) ( not ( = ?auto_779967 ?auto_779969 ) ) ( not ( = ?auto_779967 ?auto_779970 ) ) ( not ( = ?auto_779967 ?auto_779971 ) ) ( not ( = ?auto_779967 ?auto_779972 ) ) ( not ( = ?auto_779967 ?auto_779973 ) ) ( not ( = ?auto_779967 ?auto_779974 ) ) ( not ( = ?auto_779968 ?auto_779969 ) ) ( not ( = ?auto_779968 ?auto_779970 ) ) ( not ( = ?auto_779968 ?auto_779971 ) ) ( not ( = ?auto_779968 ?auto_779972 ) ) ( not ( = ?auto_779968 ?auto_779973 ) ) ( not ( = ?auto_779968 ?auto_779974 ) ) ( not ( = ?auto_779969 ?auto_779970 ) ) ( not ( = ?auto_779969 ?auto_779971 ) ) ( not ( = ?auto_779969 ?auto_779972 ) ) ( not ( = ?auto_779969 ?auto_779973 ) ) ( not ( = ?auto_779969 ?auto_779974 ) ) ( not ( = ?auto_779970 ?auto_779971 ) ) ( not ( = ?auto_779970 ?auto_779972 ) ) ( not ( = ?auto_779970 ?auto_779973 ) ) ( not ( = ?auto_779970 ?auto_779974 ) ) ( not ( = ?auto_779971 ?auto_779972 ) ) ( not ( = ?auto_779971 ?auto_779973 ) ) ( not ( = ?auto_779971 ?auto_779974 ) ) ( not ( = ?auto_779972 ?auto_779973 ) ) ( not ( = ?auto_779972 ?auto_779974 ) ) ( not ( = ?auto_779973 ?auto_779974 ) ) ( ON ?auto_779972 ?auto_779973 ) ( ON ?auto_779971 ?auto_779972 ) ( ON ?auto_779970 ?auto_779971 ) ( ON ?auto_779969 ?auto_779970 ) ( ON ?auto_779968 ?auto_779969 ) ( ON ?auto_779967 ?auto_779968 ) ( ON ?auto_779966 ?auto_779967 ) ( ON ?auto_779965 ?auto_779966 ) ( ON ?auto_779964 ?auto_779965 ) ( ON ?auto_779963 ?auto_779964 ) ( ON ?auto_779962 ?auto_779963 ) ( ON ?auto_779961 ?auto_779962 ) ( CLEAR ?auto_779959 ) ( ON ?auto_779960 ?auto_779961 ) ( CLEAR ?auto_779960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_779959 ?auto_779960 )
      ( MAKE-15PILE ?auto_779959 ?auto_779960 ?auto_779961 ?auto_779962 ?auto_779963 ?auto_779964 ?auto_779965 ?auto_779966 ?auto_779967 ?auto_779968 ?auto_779969 ?auto_779970 ?auto_779971 ?auto_779972 ?auto_779973 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_780021 - BLOCK
      ?auto_780022 - BLOCK
      ?auto_780023 - BLOCK
      ?auto_780024 - BLOCK
      ?auto_780025 - BLOCK
      ?auto_780026 - BLOCK
      ?auto_780027 - BLOCK
      ?auto_780028 - BLOCK
      ?auto_780029 - BLOCK
      ?auto_780030 - BLOCK
      ?auto_780031 - BLOCK
      ?auto_780032 - BLOCK
      ?auto_780033 - BLOCK
      ?auto_780034 - BLOCK
      ?auto_780035 - BLOCK
    )
    :vars
    (
      ?auto_780036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_780035 ?auto_780036 ) ( not ( = ?auto_780021 ?auto_780022 ) ) ( not ( = ?auto_780021 ?auto_780023 ) ) ( not ( = ?auto_780021 ?auto_780024 ) ) ( not ( = ?auto_780021 ?auto_780025 ) ) ( not ( = ?auto_780021 ?auto_780026 ) ) ( not ( = ?auto_780021 ?auto_780027 ) ) ( not ( = ?auto_780021 ?auto_780028 ) ) ( not ( = ?auto_780021 ?auto_780029 ) ) ( not ( = ?auto_780021 ?auto_780030 ) ) ( not ( = ?auto_780021 ?auto_780031 ) ) ( not ( = ?auto_780021 ?auto_780032 ) ) ( not ( = ?auto_780021 ?auto_780033 ) ) ( not ( = ?auto_780021 ?auto_780034 ) ) ( not ( = ?auto_780021 ?auto_780035 ) ) ( not ( = ?auto_780021 ?auto_780036 ) ) ( not ( = ?auto_780022 ?auto_780023 ) ) ( not ( = ?auto_780022 ?auto_780024 ) ) ( not ( = ?auto_780022 ?auto_780025 ) ) ( not ( = ?auto_780022 ?auto_780026 ) ) ( not ( = ?auto_780022 ?auto_780027 ) ) ( not ( = ?auto_780022 ?auto_780028 ) ) ( not ( = ?auto_780022 ?auto_780029 ) ) ( not ( = ?auto_780022 ?auto_780030 ) ) ( not ( = ?auto_780022 ?auto_780031 ) ) ( not ( = ?auto_780022 ?auto_780032 ) ) ( not ( = ?auto_780022 ?auto_780033 ) ) ( not ( = ?auto_780022 ?auto_780034 ) ) ( not ( = ?auto_780022 ?auto_780035 ) ) ( not ( = ?auto_780022 ?auto_780036 ) ) ( not ( = ?auto_780023 ?auto_780024 ) ) ( not ( = ?auto_780023 ?auto_780025 ) ) ( not ( = ?auto_780023 ?auto_780026 ) ) ( not ( = ?auto_780023 ?auto_780027 ) ) ( not ( = ?auto_780023 ?auto_780028 ) ) ( not ( = ?auto_780023 ?auto_780029 ) ) ( not ( = ?auto_780023 ?auto_780030 ) ) ( not ( = ?auto_780023 ?auto_780031 ) ) ( not ( = ?auto_780023 ?auto_780032 ) ) ( not ( = ?auto_780023 ?auto_780033 ) ) ( not ( = ?auto_780023 ?auto_780034 ) ) ( not ( = ?auto_780023 ?auto_780035 ) ) ( not ( = ?auto_780023 ?auto_780036 ) ) ( not ( = ?auto_780024 ?auto_780025 ) ) ( not ( = ?auto_780024 ?auto_780026 ) ) ( not ( = ?auto_780024 ?auto_780027 ) ) ( not ( = ?auto_780024 ?auto_780028 ) ) ( not ( = ?auto_780024 ?auto_780029 ) ) ( not ( = ?auto_780024 ?auto_780030 ) ) ( not ( = ?auto_780024 ?auto_780031 ) ) ( not ( = ?auto_780024 ?auto_780032 ) ) ( not ( = ?auto_780024 ?auto_780033 ) ) ( not ( = ?auto_780024 ?auto_780034 ) ) ( not ( = ?auto_780024 ?auto_780035 ) ) ( not ( = ?auto_780024 ?auto_780036 ) ) ( not ( = ?auto_780025 ?auto_780026 ) ) ( not ( = ?auto_780025 ?auto_780027 ) ) ( not ( = ?auto_780025 ?auto_780028 ) ) ( not ( = ?auto_780025 ?auto_780029 ) ) ( not ( = ?auto_780025 ?auto_780030 ) ) ( not ( = ?auto_780025 ?auto_780031 ) ) ( not ( = ?auto_780025 ?auto_780032 ) ) ( not ( = ?auto_780025 ?auto_780033 ) ) ( not ( = ?auto_780025 ?auto_780034 ) ) ( not ( = ?auto_780025 ?auto_780035 ) ) ( not ( = ?auto_780025 ?auto_780036 ) ) ( not ( = ?auto_780026 ?auto_780027 ) ) ( not ( = ?auto_780026 ?auto_780028 ) ) ( not ( = ?auto_780026 ?auto_780029 ) ) ( not ( = ?auto_780026 ?auto_780030 ) ) ( not ( = ?auto_780026 ?auto_780031 ) ) ( not ( = ?auto_780026 ?auto_780032 ) ) ( not ( = ?auto_780026 ?auto_780033 ) ) ( not ( = ?auto_780026 ?auto_780034 ) ) ( not ( = ?auto_780026 ?auto_780035 ) ) ( not ( = ?auto_780026 ?auto_780036 ) ) ( not ( = ?auto_780027 ?auto_780028 ) ) ( not ( = ?auto_780027 ?auto_780029 ) ) ( not ( = ?auto_780027 ?auto_780030 ) ) ( not ( = ?auto_780027 ?auto_780031 ) ) ( not ( = ?auto_780027 ?auto_780032 ) ) ( not ( = ?auto_780027 ?auto_780033 ) ) ( not ( = ?auto_780027 ?auto_780034 ) ) ( not ( = ?auto_780027 ?auto_780035 ) ) ( not ( = ?auto_780027 ?auto_780036 ) ) ( not ( = ?auto_780028 ?auto_780029 ) ) ( not ( = ?auto_780028 ?auto_780030 ) ) ( not ( = ?auto_780028 ?auto_780031 ) ) ( not ( = ?auto_780028 ?auto_780032 ) ) ( not ( = ?auto_780028 ?auto_780033 ) ) ( not ( = ?auto_780028 ?auto_780034 ) ) ( not ( = ?auto_780028 ?auto_780035 ) ) ( not ( = ?auto_780028 ?auto_780036 ) ) ( not ( = ?auto_780029 ?auto_780030 ) ) ( not ( = ?auto_780029 ?auto_780031 ) ) ( not ( = ?auto_780029 ?auto_780032 ) ) ( not ( = ?auto_780029 ?auto_780033 ) ) ( not ( = ?auto_780029 ?auto_780034 ) ) ( not ( = ?auto_780029 ?auto_780035 ) ) ( not ( = ?auto_780029 ?auto_780036 ) ) ( not ( = ?auto_780030 ?auto_780031 ) ) ( not ( = ?auto_780030 ?auto_780032 ) ) ( not ( = ?auto_780030 ?auto_780033 ) ) ( not ( = ?auto_780030 ?auto_780034 ) ) ( not ( = ?auto_780030 ?auto_780035 ) ) ( not ( = ?auto_780030 ?auto_780036 ) ) ( not ( = ?auto_780031 ?auto_780032 ) ) ( not ( = ?auto_780031 ?auto_780033 ) ) ( not ( = ?auto_780031 ?auto_780034 ) ) ( not ( = ?auto_780031 ?auto_780035 ) ) ( not ( = ?auto_780031 ?auto_780036 ) ) ( not ( = ?auto_780032 ?auto_780033 ) ) ( not ( = ?auto_780032 ?auto_780034 ) ) ( not ( = ?auto_780032 ?auto_780035 ) ) ( not ( = ?auto_780032 ?auto_780036 ) ) ( not ( = ?auto_780033 ?auto_780034 ) ) ( not ( = ?auto_780033 ?auto_780035 ) ) ( not ( = ?auto_780033 ?auto_780036 ) ) ( not ( = ?auto_780034 ?auto_780035 ) ) ( not ( = ?auto_780034 ?auto_780036 ) ) ( not ( = ?auto_780035 ?auto_780036 ) ) ( ON ?auto_780034 ?auto_780035 ) ( ON ?auto_780033 ?auto_780034 ) ( ON ?auto_780032 ?auto_780033 ) ( ON ?auto_780031 ?auto_780032 ) ( ON ?auto_780030 ?auto_780031 ) ( ON ?auto_780029 ?auto_780030 ) ( ON ?auto_780028 ?auto_780029 ) ( ON ?auto_780027 ?auto_780028 ) ( ON ?auto_780026 ?auto_780027 ) ( ON ?auto_780025 ?auto_780026 ) ( ON ?auto_780024 ?auto_780025 ) ( ON ?auto_780023 ?auto_780024 ) ( ON ?auto_780022 ?auto_780023 ) ( ON ?auto_780021 ?auto_780022 ) ( CLEAR ?auto_780021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_780021 )
      ( MAKE-15PILE ?auto_780021 ?auto_780022 ?auto_780023 ?auto_780024 ?auto_780025 ?auto_780026 ?auto_780027 ?auto_780028 ?auto_780029 ?auto_780030 ?auto_780031 ?auto_780032 ?auto_780033 ?auto_780034 ?auto_780035 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_780084 - BLOCK
      ?auto_780085 - BLOCK
      ?auto_780086 - BLOCK
      ?auto_780087 - BLOCK
      ?auto_780088 - BLOCK
      ?auto_780089 - BLOCK
      ?auto_780090 - BLOCK
      ?auto_780091 - BLOCK
      ?auto_780092 - BLOCK
      ?auto_780093 - BLOCK
      ?auto_780094 - BLOCK
      ?auto_780095 - BLOCK
      ?auto_780096 - BLOCK
      ?auto_780097 - BLOCK
      ?auto_780098 - BLOCK
      ?auto_780099 - BLOCK
    )
    :vars
    (
      ?auto_780100 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_780098 ) ( ON ?auto_780099 ?auto_780100 ) ( CLEAR ?auto_780099 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_780084 ) ( ON ?auto_780085 ?auto_780084 ) ( ON ?auto_780086 ?auto_780085 ) ( ON ?auto_780087 ?auto_780086 ) ( ON ?auto_780088 ?auto_780087 ) ( ON ?auto_780089 ?auto_780088 ) ( ON ?auto_780090 ?auto_780089 ) ( ON ?auto_780091 ?auto_780090 ) ( ON ?auto_780092 ?auto_780091 ) ( ON ?auto_780093 ?auto_780092 ) ( ON ?auto_780094 ?auto_780093 ) ( ON ?auto_780095 ?auto_780094 ) ( ON ?auto_780096 ?auto_780095 ) ( ON ?auto_780097 ?auto_780096 ) ( ON ?auto_780098 ?auto_780097 ) ( not ( = ?auto_780084 ?auto_780085 ) ) ( not ( = ?auto_780084 ?auto_780086 ) ) ( not ( = ?auto_780084 ?auto_780087 ) ) ( not ( = ?auto_780084 ?auto_780088 ) ) ( not ( = ?auto_780084 ?auto_780089 ) ) ( not ( = ?auto_780084 ?auto_780090 ) ) ( not ( = ?auto_780084 ?auto_780091 ) ) ( not ( = ?auto_780084 ?auto_780092 ) ) ( not ( = ?auto_780084 ?auto_780093 ) ) ( not ( = ?auto_780084 ?auto_780094 ) ) ( not ( = ?auto_780084 ?auto_780095 ) ) ( not ( = ?auto_780084 ?auto_780096 ) ) ( not ( = ?auto_780084 ?auto_780097 ) ) ( not ( = ?auto_780084 ?auto_780098 ) ) ( not ( = ?auto_780084 ?auto_780099 ) ) ( not ( = ?auto_780084 ?auto_780100 ) ) ( not ( = ?auto_780085 ?auto_780086 ) ) ( not ( = ?auto_780085 ?auto_780087 ) ) ( not ( = ?auto_780085 ?auto_780088 ) ) ( not ( = ?auto_780085 ?auto_780089 ) ) ( not ( = ?auto_780085 ?auto_780090 ) ) ( not ( = ?auto_780085 ?auto_780091 ) ) ( not ( = ?auto_780085 ?auto_780092 ) ) ( not ( = ?auto_780085 ?auto_780093 ) ) ( not ( = ?auto_780085 ?auto_780094 ) ) ( not ( = ?auto_780085 ?auto_780095 ) ) ( not ( = ?auto_780085 ?auto_780096 ) ) ( not ( = ?auto_780085 ?auto_780097 ) ) ( not ( = ?auto_780085 ?auto_780098 ) ) ( not ( = ?auto_780085 ?auto_780099 ) ) ( not ( = ?auto_780085 ?auto_780100 ) ) ( not ( = ?auto_780086 ?auto_780087 ) ) ( not ( = ?auto_780086 ?auto_780088 ) ) ( not ( = ?auto_780086 ?auto_780089 ) ) ( not ( = ?auto_780086 ?auto_780090 ) ) ( not ( = ?auto_780086 ?auto_780091 ) ) ( not ( = ?auto_780086 ?auto_780092 ) ) ( not ( = ?auto_780086 ?auto_780093 ) ) ( not ( = ?auto_780086 ?auto_780094 ) ) ( not ( = ?auto_780086 ?auto_780095 ) ) ( not ( = ?auto_780086 ?auto_780096 ) ) ( not ( = ?auto_780086 ?auto_780097 ) ) ( not ( = ?auto_780086 ?auto_780098 ) ) ( not ( = ?auto_780086 ?auto_780099 ) ) ( not ( = ?auto_780086 ?auto_780100 ) ) ( not ( = ?auto_780087 ?auto_780088 ) ) ( not ( = ?auto_780087 ?auto_780089 ) ) ( not ( = ?auto_780087 ?auto_780090 ) ) ( not ( = ?auto_780087 ?auto_780091 ) ) ( not ( = ?auto_780087 ?auto_780092 ) ) ( not ( = ?auto_780087 ?auto_780093 ) ) ( not ( = ?auto_780087 ?auto_780094 ) ) ( not ( = ?auto_780087 ?auto_780095 ) ) ( not ( = ?auto_780087 ?auto_780096 ) ) ( not ( = ?auto_780087 ?auto_780097 ) ) ( not ( = ?auto_780087 ?auto_780098 ) ) ( not ( = ?auto_780087 ?auto_780099 ) ) ( not ( = ?auto_780087 ?auto_780100 ) ) ( not ( = ?auto_780088 ?auto_780089 ) ) ( not ( = ?auto_780088 ?auto_780090 ) ) ( not ( = ?auto_780088 ?auto_780091 ) ) ( not ( = ?auto_780088 ?auto_780092 ) ) ( not ( = ?auto_780088 ?auto_780093 ) ) ( not ( = ?auto_780088 ?auto_780094 ) ) ( not ( = ?auto_780088 ?auto_780095 ) ) ( not ( = ?auto_780088 ?auto_780096 ) ) ( not ( = ?auto_780088 ?auto_780097 ) ) ( not ( = ?auto_780088 ?auto_780098 ) ) ( not ( = ?auto_780088 ?auto_780099 ) ) ( not ( = ?auto_780088 ?auto_780100 ) ) ( not ( = ?auto_780089 ?auto_780090 ) ) ( not ( = ?auto_780089 ?auto_780091 ) ) ( not ( = ?auto_780089 ?auto_780092 ) ) ( not ( = ?auto_780089 ?auto_780093 ) ) ( not ( = ?auto_780089 ?auto_780094 ) ) ( not ( = ?auto_780089 ?auto_780095 ) ) ( not ( = ?auto_780089 ?auto_780096 ) ) ( not ( = ?auto_780089 ?auto_780097 ) ) ( not ( = ?auto_780089 ?auto_780098 ) ) ( not ( = ?auto_780089 ?auto_780099 ) ) ( not ( = ?auto_780089 ?auto_780100 ) ) ( not ( = ?auto_780090 ?auto_780091 ) ) ( not ( = ?auto_780090 ?auto_780092 ) ) ( not ( = ?auto_780090 ?auto_780093 ) ) ( not ( = ?auto_780090 ?auto_780094 ) ) ( not ( = ?auto_780090 ?auto_780095 ) ) ( not ( = ?auto_780090 ?auto_780096 ) ) ( not ( = ?auto_780090 ?auto_780097 ) ) ( not ( = ?auto_780090 ?auto_780098 ) ) ( not ( = ?auto_780090 ?auto_780099 ) ) ( not ( = ?auto_780090 ?auto_780100 ) ) ( not ( = ?auto_780091 ?auto_780092 ) ) ( not ( = ?auto_780091 ?auto_780093 ) ) ( not ( = ?auto_780091 ?auto_780094 ) ) ( not ( = ?auto_780091 ?auto_780095 ) ) ( not ( = ?auto_780091 ?auto_780096 ) ) ( not ( = ?auto_780091 ?auto_780097 ) ) ( not ( = ?auto_780091 ?auto_780098 ) ) ( not ( = ?auto_780091 ?auto_780099 ) ) ( not ( = ?auto_780091 ?auto_780100 ) ) ( not ( = ?auto_780092 ?auto_780093 ) ) ( not ( = ?auto_780092 ?auto_780094 ) ) ( not ( = ?auto_780092 ?auto_780095 ) ) ( not ( = ?auto_780092 ?auto_780096 ) ) ( not ( = ?auto_780092 ?auto_780097 ) ) ( not ( = ?auto_780092 ?auto_780098 ) ) ( not ( = ?auto_780092 ?auto_780099 ) ) ( not ( = ?auto_780092 ?auto_780100 ) ) ( not ( = ?auto_780093 ?auto_780094 ) ) ( not ( = ?auto_780093 ?auto_780095 ) ) ( not ( = ?auto_780093 ?auto_780096 ) ) ( not ( = ?auto_780093 ?auto_780097 ) ) ( not ( = ?auto_780093 ?auto_780098 ) ) ( not ( = ?auto_780093 ?auto_780099 ) ) ( not ( = ?auto_780093 ?auto_780100 ) ) ( not ( = ?auto_780094 ?auto_780095 ) ) ( not ( = ?auto_780094 ?auto_780096 ) ) ( not ( = ?auto_780094 ?auto_780097 ) ) ( not ( = ?auto_780094 ?auto_780098 ) ) ( not ( = ?auto_780094 ?auto_780099 ) ) ( not ( = ?auto_780094 ?auto_780100 ) ) ( not ( = ?auto_780095 ?auto_780096 ) ) ( not ( = ?auto_780095 ?auto_780097 ) ) ( not ( = ?auto_780095 ?auto_780098 ) ) ( not ( = ?auto_780095 ?auto_780099 ) ) ( not ( = ?auto_780095 ?auto_780100 ) ) ( not ( = ?auto_780096 ?auto_780097 ) ) ( not ( = ?auto_780096 ?auto_780098 ) ) ( not ( = ?auto_780096 ?auto_780099 ) ) ( not ( = ?auto_780096 ?auto_780100 ) ) ( not ( = ?auto_780097 ?auto_780098 ) ) ( not ( = ?auto_780097 ?auto_780099 ) ) ( not ( = ?auto_780097 ?auto_780100 ) ) ( not ( = ?auto_780098 ?auto_780099 ) ) ( not ( = ?auto_780098 ?auto_780100 ) ) ( not ( = ?auto_780099 ?auto_780100 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_780099 ?auto_780100 )
      ( !STACK ?auto_780099 ?auto_780098 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_780150 - BLOCK
      ?auto_780151 - BLOCK
      ?auto_780152 - BLOCK
      ?auto_780153 - BLOCK
      ?auto_780154 - BLOCK
      ?auto_780155 - BLOCK
      ?auto_780156 - BLOCK
      ?auto_780157 - BLOCK
      ?auto_780158 - BLOCK
      ?auto_780159 - BLOCK
      ?auto_780160 - BLOCK
      ?auto_780161 - BLOCK
      ?auto_780162 - BLOCK
      ?auto_780163 - BLOCK
      ?auto_780164 - BLOCK
      ?auto_780165 - BLOCK
    )
    :vars
    (
      ?auto_780166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_780165 ?auto_780166 ) ( ON-TABLE ?auto_780150 ) ( ON ?auto_780151 ?auto_780150 ) ( ON ?auto_780152 ?auto_780151 ) ( ON ?auto_780153 ?auto_780152 ) ( ON ?auto_780154 ?auto_780153 ) ( ON ?auto_780155 ?auto_780154 ) ( ON ?auto_780156 ?auto_780155 ) ( ON ?auto_780157 ?auto_780156 ) ( ON ?auto_780158 ?auto_780157 ) ( ON ?auto_780159 ?auto_780158 ) ( ON ?auto_780160 ?auto_780159 ) ( ON ?auto_780161 ?auto_780160 ) ( ON ?auto_780162 ?auto_780161 ) ( ON ?auto_780163 ?auto_780162 ) ( not ( = ?auto_780150 ?auto_780151 ) ) ( not ( = ?auto_780150 ?auto_780152 ) ) ( not ( = ?auto_780150 ?auto_780153 ) ) ( not ( = ?auto_780150 ?auto_780154 ) ) ( not ( = ?auto_780150 ?auto_780155 ) ) ( not ( = ?auto_780150 ?auto_780156 ) ) ( not ( = ?auto_780150 ?auto_780157 ) ) ( not ( = ?auto_780150 ?auto_780158 ) ) ( not ( = ?auto_780150 ?auto_780159 ) ) ( not ( = ?auto_780150 ?auto_780160 ) ) ( not ( = ?auto_780150 ?auto_780161 ) ) ( not ( = ?auto_780150 ?auto_780162 ) ) ( not ( = ?auto_780150 ?auto_780163 ) ) ( not ( = ?auto_780150 ?auto_780164 ) ) ( not ( = ?auto_780150 ?auto_780165 ) ) ( not ( = ?auto_780150 ?auto_780166 ) ) ( not ( = ?auto_780151 ?auto_780152 ) ) ( not ( = ?auto_780151 ?auto_780153 ) ) ( not ( = ?auto_780151 ?auto_780154 ) ) ( not ( = ?auto_780151 ?auto_780155 ) ) ( not ( = ?auto_780151 ?auto_780156 ) ) ( not ( = ?auto_780151 ?auto_780157 ) ) ( not ( = ?auto_780151 ?auto_780158 ) ) ( not ( = ?auto_780151 ?auto_780159 ) ) ( not ( = ?auto_780151 ?auto_780160 ) ) ( not ( = ?auto_780151 ?auto_780161 ) ) ( not ( = ?auto_780151 ?auto_780162 ) ) ( not ( = ?auto_780151 ?auto_780163 ) ) ( not ( = ?auto_780151 ?auto_780164 ) ) ( not ( = ?auto_780151 ?auto_780165 ) ) ( not ( = ?auto_780151 ?auto_780166 ) ) ( not ( = ?auto_780152 ?auto_780153 ) ) ( not ( = ?auto_780152 ?auto_780154 ) ) ( not ( = ?auto_780152 ?auto_780155 ) ) ( not ( = ?auto_780152 ?auto_780156 ) ) ( not ( = ?auto_780152 ?auto_780157 ) ) ( not ( = ?auto_780152 ?auto_780158 ) ) ( not ( = ?auto_780152 ?auto_780159 ) ) ( not ( = ?auto_780152 ?auto_780160 ) ) ( not ( = ?auto_780152 ?auto_780161 ) ) ( not ( = ?auto_780152 ?auto_780162 ) ) ( not ( = ?auto_780152 ?auto_780163 ) ) ( not ( = ?auto_780152 ?auto_780164 ) ) ( not ( = ?auto_780152 ?auto_780165 ) ) ( not ( = ?auto_780152 ?auto_780166 ) ) ( not ( = ?auto_780153 ?auto_780154 ) ) ( not ( = ?auto_780153 ?auto_780155 ) ) ( not ( = ?auto_780153 ?auto_780156 ) ) ( not ( = ?auto_780153 ?auto_780157 ) ) ( not ( = ?auto_780153 ?auto_780158 ) ) ( not ( = ?auto_780153 ?auto_780159 ) ) ( not ( = ?auto_780153 ?auto_780160 ) ) ( not ( = ?auto_780153 ?auto_780161 ) ) ( not ( = ?auto_780153 ?auto_780162 ) ) ( not ( = ?auto_780153 ?auto_780163 ) ) ( not ( = ?auto_780153 ?auto_780164 ) ) ( not ( = ?auto_780153 ?auto_780165 ) ) ( not ( = ?auto_780153 ?auto_780166 ) ) ( not ( = ?auto_780154 ?auto_780155 ) ) ( not ( = ?auto_780154 ?auto_780156 ) ) ( not ( = ?auto_780154 ?auto_780157 ) ) ( not ( = ?auto_780154 ?auto_780158 ) ) ( not ( = ?auto_780154 ?auto_780159 ) ) ( not ( = ?auto_780154 ?auto_780160 ) ) ( not ( = ?auto_780154 ?auto_780161 ) ) ( not ( = ?auto_780154 ?auto_780162 ) ) ( not ( = ?auto_780154 ?auto_780163 ) ) ( not ( = ?auto_780154 ?auto_780164 ) ) ( not ( = ?auto_780154 ?auto_780165 ) ) ( not ( = ?auto_780154 ?auto_780166 ) ) ( not ( = ?auto_780155 ?auto_780156 ) ) ( not ( = ?auto_780155 ?auto_780157 ) ) ( not ( = ?auto_780155 ?auto_780158 ) ) ( not ( = ?auto_780155 ?auto_780159 ) ) ( not ( = ?auto_780155 ?auto_780160 ) ) ( not ( = ?auto_780155 ?auto_780161 ) ) ( not ( = ?auto_780155 ?auto_780162 ) ) ( not ( = ?auto_780155 ?auto_780163 ) ) ( not ( = ?auto_780155 ?auto_780164 ) ) ( not ( = ?auto_780155 ?auto_780165 ) ) ( not ( = ?auto_780155 ?auto_780166 ) ) ( not ( = ?auto_780156 ?auto_780157 ) ) ( not ( = ?auto_780156 ?auto_780158 ) ) ( not ( = ?auto_780156 ?auto_780159 ) ) ( not ( = ?auto_780156 ?auto_780160 ) ) ( not ( = ?auto_780156 ?auto_780161 ) ) ( not ( = ?auto_780156 ?auto_780162 ) ) ( not ( = ?auto_780156 ?auto_780163 ) ) ( not ( = ?auto_780156 ?auto_780164 ) ) ( not ( = ?auto_780156 ?auto_780165 ) ) ( not ( = ?auto_780156 ?auto_780166 ) ) ( not ( = ?auto_780157 ?auto_780158 ) ) ( not ( = ?auto_780157 ?auto_780159 ) ) ( not ( = ?auto_780157 ?auto_780160 ) ) ( not ( = ?auto_780157 ?auto_780161 ) ) ( not ( = ?auto_780157 ?auto_780162 ) ) ( not ( = ?auto_780157 ?auto_780163 ) ) ( not ( = ?auto_780157 ?auto_780164 ) ) ( not ( = ?auto_780157 ?auto_780165 ) ) ( not ( = ?auto_780157 ?auto_780166 ) ) ( not ( = ?auto_780158 ?auto_780159 ) ) ( not ( = ?auto_780158 ?auto_780160 ) ) ( not ( = ?auto_780158 ?auto_780161 ) ) ( not ( = ?auto_780158 ?auto_780162 ) ) ( not ( = ?auto_780158 ?auto_780163 ) ) ( not ( = ?auto_780158 ?auto_780164 ) ) ( not ( = ?auto_780158 ?auto_780165 ) ) ( not ( = ?auto_780158 ?auto_780166 ) ) ( not ( = ?auto_780159 ?auto_780160 ) ) ( not ( = ?auto_780159 ?auto_780161 ) ) ( not ( = ?auto_780159 ?auto_780162 ) ) ( not ( = ?auto_780159 ?auto_780163 ) ) ( not ( = ?auto_780159 ?auto_780164 ) ) ( not ( = ?auto_780159 ?auto_780165 ) ) ( not ( = ?auto_780159 ?auto_780166 ) ) ( not ( = ?auto_780160 ?auto_780161 ) ) ( not ( = ?auto_780160 ?auto_780162 ) ) ( not ( = ?auto_780160 ?auto_780163 ) ) ( not ( = ?auto_780160 ?auto_780164 ) ) ( not ( = ?auto_780160 ?auto_780165 ) ) ( not ( = ?auto_780160 ?auto_780166 ) ) ( not ( = ?auto_780161 ?auto_780162 ) ) ( not ( = ?auto_780161 ?auto_780163 ) ) ( not ( = ?auto_780161 ?auto_780164 ) ) ( not ( = ?auto_780161 ?auto_780165 ) ) ( not ( = ?auto_780161 ?auto_780166 ) ) ( not ( = ?auto_780162 ?auto_780163 ) ) ( not ( = ?auto_780162 ?auto_780164 ) ) ( not ( = ?auto_780162 ?auto_780165 ) ) ( not ( = ?auto_780162 ?auto_780166 ) ) ( not ( = ?auto_780163 ?auto_780164 ) ) ( not ( = ?auto_780163 ?auto_780165 ) ) ( not ( = ?auto_780163 ?auto_780166 ) ) ( not ( = ?auto_780164 ?auto_780165 ) ) ( not ( = ?auto_780164 ?auto_780166 ) ) ( not ( = ?auto_780165 ?auto_780166 ) ) ( CLEAR ?auto_780163 ) ( ON ?auto_780164 ?auto_780165 ) ( CLEAR ?auto_780164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_780150 ?auto_780151 ?auto_780152 ?auto_780153 ?auto_780154 ?auto_780155 ?auto_780156 ?auto_780157 ?auto_780158 ?auto_780159 ?auto_780160 ?auto_780161 ?auto_780162 ?auto_780163 ?auto_780164 )
      ( MAKE-16PILE ?auto_780150 ?auto_780151 ?auto_780152 ?auto_780153 ?auto_780154 ?auto_780155 ?auto_780156 ?auto_780157 ?auto_780158 ?auto_780159 ?auto_780160 ?auto_780161 ?auto_780162 ?auto_780163 ?auto_780164 ?auto_780165 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_780216 - BLOCK
      ?auto_780217 - BLOCK
      ?auto_780218 - BLOCK
      ?auto_780219 - BLOCK
      ?auto_780220 - BLOCK
      ?auto_780221 - BLOCK
      ?auto_780222 - BLOCK
      ?auto_780223 - BLOCK
      ?auto_780224 - BLOCK
      ?auto_780225 - BLOCK
      ?auto_780226 - BLOCK
      ?auto_780227 - BLOCK
      ?auto_780228 - BLOCK
      ?auto_780229 - BLOCK
      ?auto_780230 - BLOCK
      ?auto_780231 - BLOCK
    )
    :vars
    (
      ?auto_780232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_780231 ?auto_780232 ) ( ON-TABLE ?auto_780216 ) ( ON ?auto_780217 ?auto_780216 ) ( ON ?auto_780218 ?auto_780217 ) ( ON ?auto_780219 ?auto_780218 ) ( ON ?auto_780220 ?auto_780219 ) ( ON ?auto_780221 ?auto_780220 ) ( ON ?auto_780222 ?auto_780221 ) ( ON ?auto_780223 ?auto_780222 ) ( ON ?auto_780224 ?auto_780223 ) ( ON ?auto_780225 ?auto_780224 ) ( ON ?auto_780226 ?auto_780225 ) ( ON ?auto_780227 ?auto_780226 ) ( ON ?auto_780228 ?auto_780227 ) ( not ( = ?auto_780216 ?auto_780217 ) ) ( not ( = ?auto_780216 ?auto_780218 ) ) ( not ( = ?auto_780216 ?auto_780219 ) ) ( not ( = ?auto_780216 ?auto_780220 ) ) ( not ( = ?auto_780216 ?auto_780221 ) ) ( not ( = ?auto_780216 ?auto_780222 ) ) ( not ( = ?auto_780216 ?auto_780223 ) ) ( not ( = ?auto_780216 ?auto_780224 ) ) ( not ( = ?auto_780216 ?auto_780225 ) ) ( not ( = ?auto_780216 ?auto_780226 ) ) ( not ( = ?auto_780216 ?auto_780227 ) ) ( not ( = ?auto_780216 ?auto_780228 ) ) ( not ( = ?auto_780216 ?auto_780229 ) ) ( not ( = ?auto_780216 ?auto_780230 ) ) ( not ( = ?auto_780216 ?auto_780231 ) ) ( not ( = ?auto_780216 ?auto_780232 ) ) ( not ( = ?auto_780217 ?auto_780218 ) ) ( not ( = ?auto_780217 ?auto_780219 ) ) ( not ( = ?auto_780217 ?auto_780220 ) ) ( not ( = ?auto_780217 ?auto_780221 ) ) ( not ( = ?auto_780217 ?auto_780222 ) ) ( not ( = ?auto_780217 ?auto_780223 ) ) ( not ( = ?auto_780217 ?auto_780224 ) ) ( not ( = ?auto_780217 ?auto_780225 ) ) ( not ( = ?auto_780217 ?auto_780226 ) ) ( not ( = ?auto_780217 ?auto_780227 ) ) ( not ( = ?auto_780217 ?auto_780228 ) ) ( not ( = ?auto_780217 ?auto_780229 ) ) ( not ( = ?auto_780217 ?auto_780230 ) ) ( not ( = ?auto_780217 ?auto_780231 ) ) ( not ( = ?auto_780217 ?auto_780232 ) ) ( not ( = ?auto_780218 ?auto_780219 ) ) ( not ( = ?auto_780218 ?auto_780220 ) ) ( not ( = ?auto_780218 ?auto_780221 ) ) ( not ( = ?auto_780218 ?auto_780222 ) ) ( not ( = ?auto_780218 ?auto_780223 ) ) ( not ( = ?auto_780218 ?auto_780224 ) ) ( not ( = ?auto_780218 ?auto_780225 ) ) ( not ( = ?auto_780218 ?auto_780226 ) ) ( not ( = ?auto_780218 ?auto_780227 ) ) ( not ( = ?auto_780218 ?auto_780228 ) ) ( not ( = ?auto_780218 ?auto_780229 ) ) ( not ( = ?auto_780218 ?auto_780230 ) ) ( not ( = ?auto_780218 ?auto_780231 ) ) ( not ( = ?auto_780218 ?auto_780232 ) ) ( not ( = ?auto_780219 ?auto_780220 ) ) ( not ( = ?auto_780219 ?auto_780221 ) ) ( not ( = ?auto_780219 ?auto_780222 ) ) ( not ( = ?auto_780219 ?auto_780223 ) ) ( not ( = ?auto_780219 ?auto_780224 ) ) ( not ( = ?auto_780219 ?auto_780225 ) ) ( not ( = ?auto_780219 ?auto_780226 ) ) ( not ( = ?auto_780219 ?auto_780227 ) ) ( not ( = ?auto_780219 ?auto_780228 ) ) ( not ( = ?auto_780219 ?auto_780229 ) ) ( not ( = ?auto_780219 ?auto_780230 ) ) ( not ( = ?auto_780219 ?auto_780231 ) ) ( not ( = ?auto_780219 ?auto_780232 ) ) ( not ( = ?auto_780220 ?auto_780221 ) ) ( not ( = ?auto_780220 ?auto_780222 ) ) ( not ( = ?auto_780220 ?auto_780223 ) ) ( not ( = ?auto_780220 ?auto_780224 ) ) ( not ( = ?auto_780220 ?auto_780225 ) ) ( not ( = ?auto_780220 ?auto_780226 ) ) ( not ( = ?auto_780220 ?auto_780227 ) ) ( not ( = ?auto_780220 ?auto_780228 ) ) ( not ( = ?auto_780220 ?auto_780229 ) ) ( not ( = ?auto_780220 ?auto_780230 ) ) ( not ( = ?auto_780220 ?auto_780231 ) ) ( not ( = ?auto_780220 ?auto_780232 ) ) ( not ( = ?auto_780221 ?auto_780222 ) ) ( not ( = ?auto_780221 ?auto_780223 ) ) ( not ( = ?auto_780221 ?auto_780224 ) ) ( not ( = ?auto_780221 ?auto_780225 ) ) ( not ( = ?auto_780221 ?auto_780226 ) ) ( not ( = ?auto_780221 ?auto_780227 ) ) ( not ( = ?auto_780221 ?auto_780228 ) ) ( not ( = ?auto_780221 ?auto_780229 ) ) ( not ( = ?auto_780221 ?auto_780230 ) ) ( not ( = ?auto_780221 ?auto_780231 ) ) ( not ( = ?auto_780221 ?auto_780232 ) ) ( not ( = ?auto_780222 ?auto_780223 ) ) ( not ( = ?auto_780222 ?auto_780224 ) ) ( not ( = ?auto_780222 ?auto_780225 ) ) ( not ( = ?auto_780222 ?auto_780226 ) ) ( not ( = ?auto_780222 ?auto_780227 ) ) ( not ( = ?auto_780222 ?auto_780228 ) ) ( not ( = ?auto_780222 ?auto_780229 ) ) ( not ( = ?auto_780222 ?auto_780230 ) ) ( not ( = ?auto_780222 ?auto_780231 ) ) ( not ( = ?auto_780222 ?auto_780232 ) ) ( not ( = ?auto_780223 ?auto_780224 ) ) ( not ( = ?auto_780223 ?auto_780225 ) ) ( not ( = ?auto_780223 ?auto_780226 ) ) ( not ( = ?auto_780223 ?auto_780227 ) ) ( not ( = ?auto_780223 ?auto_780228 ) ) ( not ( = ?auto_780223 ?auto_780229 ) ) ( not ( = ?auto_780223 ?auto_780230 ) ) ( not ( = ?auto_780223 ?auto_780231 ) ) ( not ( = ?auto_780223 ?auto_780232 ) ) ( not ( = ?auto_780224 ?auto_780225 ) ) ( not ( = ?auto_780224 ?auto_780226 ) ) ( not ( = ?auto_780224 ?auto_780227 ) ) ( not ( = ?auto_780224 ?auto_780228 ) ) ( not ( = ?auto_780224 ?auto_780229 ) ) ( not ( = ?auto_780224 ?auto_780230 ) ) ( not ( = ?auto_780224 ?auto_780231 ) ) ( not ( = ?auto_780224 ?auto_780232 ) ) ( not ( = ?auto_780225 ?auto_780226 ) ) ( not ( = ?auto_780225 ?auto_780227 ) ) ( not ( = ?auto_780225 ?auto_780228 ) ) ( not ( = ?auto_780225 ?auto_780229 ) ) ( not ( = ?auto_780225 ?auto_780230 ) ) ( not ( = ?auto_780225 ?auto_780231 ) ) ( not ( = ?auto_780225 ?auto_780232 ) ) ( not ( = ?auto_780226 ?auto_780227 ) ) ( not ( = ?auto_780226 ?auto_780228 ) ) ( not ( = ?auto_780226 ?auto_780229 ) ) ( not ( = ?auto_780226 ?auto_780230 ) ) ( not ( = ?auto_780226 ?auto_780231 ) ) ( not ( = ?auto_780226 ?auto_780232 ) ) ( not ( = ?auto_780227 ?auto_780228 ) ) ( not ( = ?auto_780227 ?auto_780229 ) ) ( not ( = ?auto_780227 ?auto_780230 ) ) ( not ( = ?auto_780227 ?auto_780231 ) ) ( not ( = ?auto_780227 ?auto_780232 ) ) ( not ( = ?auto_780228 ?auto_780229 ) ) ( not ( = ?auto_780228 ?auto_780230 ) ) ( not ( = ?auto_780228 ?auto_780231 ) ) ( not ( = ?auto_780228 ?auto_780232 ) ) ( not ( = ?auto_780229 ?auto_780230 ) ) ( not ( = ?auto_780229 ?auto_780231 ) ) ( not ( = ?auto_780229 ?auto_780232 ) ) ( not ( = ?auto_780230 ?auto_780231 ) ) ( not ( = ?auto_780230 ?auto_780232 ) ) ( not ( = ?auto_780231 ?auto_780232 ) ) ( ON ?auto_780230 ?auto_780231 ) ( CLEAR ?auto_780228 ) ( ON ?auto_780229 ?auto_780230 ) ( CLEAR ?auto_780229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_780216 ?auto_780217 ?auto_780218 ?auto_780219 ?auto_780220 ?auto_780221 ?auto_780222 ?auto_780223 ?auto_780224 ?auto_780225 ?auto_780226 ?auto_780227 ?auto_780228 ?auto_780229 )
      ( MAKE-16PILE ?auto_780216 ?auto_780217 ?auto_780218 ?auto_780219 ?auto_780220 ?auto_780221 ?auto_780222 ?auto_780223 ?auto_780224 ?auto_780225 ?auto_780226 ?auto_780227 ?auto_780228 ?auto_780229 ?auto_780230 ?auto_780231 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_780282 - BLOCK
      ?auto_780283 - BLOCK
      ?auto_780284 - BLOCK
      ?auto_780285 - BLOCK
      ?auto_780286 - BLOCK
      ?auto_780287 - BLOCK
      ?auto_780288 - BLOCK
      ?auto_780289 - BLOCK
      ?auto_780290 - BLOCK
      ?auto_780291 - BLOCK
      ?auto_780292 - BLOCK
      ?auto_780293 - BLOCK
      ?auto_780294 - BLOCK
      ?auto_780295 - BLOCK
      ?auto_780296 - BLOCK
      ?auto_780297 - BLOCK
    )
    :vars
    (
      ?auto_780298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_780297 ?auto_780298 ) ( ON-TABLE ?auto_780282 ) ( ON ?auto_780283 ?auto_780282 ) ( ON ?auto_780284 ?auto_780283 ) ( ON ?auto_780285 ?auto_780284 ) ( ON ?auto_780286 ?auto_780285 ) ( ON ?auto_780287 ?auto_780286 ) ( ON ?auto_780288 ?auto_780287 ) ( ON ?auto_780289 ?auto_780288 ) ( ON ?auto_780290 ?auto_780289 ) ( ON ?auto_780291 ?auto_780290 ) ( ON ?auto_780292 ?auto_780291 ) ( ON ?auto_780293 ?auto_780292 ) ( not ( = ?auto_780282 ?auto_780283 ) ) ( not ( = ?auto_780282 ?auto_780284 ) ) ( not ( = ?auto_780282 ?auto_780285 ) ) ( not ( = ?auto_780282 ?auto_780286 ) ) ( not ( = ?auto_780282 ?auto_780287 ) ) ( not ( = ?auto_780282 ?auto_780288 ) ) ( not ( = ?auto_780282 ?auto_780289 ) ) ( not ( = ?auto_780282 ?auto_780290 ) ) ( not ( = ?auto_780282 ?auto_780291 ) ) ( not ( = ?auto_780282 ?auto_780292 ) ) ( not ( = ?auto_780282 ?auto_780293 ) ) ( not ( = ?auto_780282 ?auto_780294 ) ) ( not ( = ?auto_780282 ?auto_780295 ) ) ( not ( = ?auto_780282 ?auto_780296 ) ) ( not ( = ?auto_780282 ?auto_780297 ) ) ( not ( = ?auto_780282 ?auto_780298 ) ) ( not ( = ?auto_780283 ?auto_780284 ) ) ( not ( = ?auto_780283 ?auto_780285 ) ) ( not ( = ?auto_780283 ?auto_780286 ) ) ( not ( = ?auto_780283 ?auto_780287 ) ) ( not ( = ?auto_780283 ?auto_780288 ) ) ( not ( = ?auto_780283 ?auto_780289 ) ) ( not ( = ?auto_780283 ?auto_780290 ) ) ( not ( = ?auto_780283 ?auto_780291 ) ) ( not ( = ?auto_780283 ?auto_780292 ) ) ( not ( = ?auto_780283 ?auto_780293 ) ) ( not ( = ?auto_780283 ?auto_780294 ) ) ( not ( = ?auto_780283 ?auto_780295 ) ) ( not ( = ?auto_780283 ?auto_780296 ) ) ( not ( = ?auto_780283 ?auto_780297 ) ) ( not ( = ?auto_780283 ?auto_780298 ) ) ( not ( = ?auto_780284 ?auto_780285 ) ) ( not ( = ?auto_780284 ?auto_780286 ) ) ( not ( = ?auto_780284 ?auto_780287 ) ) ( not ( = ?auto_780284 ?auto_780288 ) ) ( not ( = ?auto_780284 ?auto_780289 ) ) ( not ( = ?auto_780284 ?auto_780290 ) ) ( not ( = ?auto_780284 ?auto_780291 ) ) ( not ( = ?auto_780284 ?auto_780292 ) ) ( not ( = ?auto_780284 ?auto_780293 ) ) ( not ( = ?auto_780284 ?auto_780294 ) ) ( not ( = ?auto_780284 ?auto_780295 ) ) ( not ( = ?auto_780284 ?auto_780296 ) ) ( not ( = ?auto_780284 ?auto_780297 ) ) ( not ( = ?auto_780284 ?auto_780298 ) ) ( not ( = ?auto_780285 ?auto_780286 ) ) ( not ( = ?auto_780285 ?auto_780287 ) ) ( not ( = ?auto_780285 ?auto_780288 ) ) ( not ( = ?auto_780285 ?auto_780289 ) ) ( not ( = ?auto_780285 ?auto_780290 ) ) ( not ( = ?auto_780285 ?auto_780291 ) ) ( not ( = ?auto_780285 ?auto_780292 ) ) ( not ( = ?auto_780285 ?auto_780293 ) ) ( not ( = ?auto_780285 ?auto_780294 ) ) ( not ( = ?auto_780285 ?auto_780295 ) ) ( not ( = ?auto_780285 ?auto_780296 ) ) ( not ( = ?auto_780285 ?auto_780297 ) ) ( not ( = ?auto_780285 ?auto_780298 ) ) ( not ( = ?auto_780286 ?auto_780287 ) ) ( not ( = ?auto_780286 ?auto_780288 ) ) ( not ( = ?auto_780286 ?auto_780289 ) ) ( not ( = ?auto_780286 ?auto_780290 ) ) ( not ( = ?auto_780286 ?auto_780291 ) ) ( not ( = ?auto_780286 ?auto_780292 ) ) ( not ( = ?auto_780286 ?auto_780293 ) ) ( not ( = ?auto_780286 ?auto_780294 ) ) ( not ( = ?auto_780286 ?auto_780295 ) ) ( not ( = ?auto_780286 ?auto_780296 ) ) ( not ( = ?auto_780286 ?auto_780297 ) ) ( not ( = ?auto_780286 ?auto_780298 ) ) ( not ( = ?auto_780287 ?auto_780288 ) ) ( not ( = ?auto_780287 ?auto_780289 ) ) ( not ( = ?auto_780287 ?auto_780290 ) ) ( not ( = ?auto_780287 ?auto_780291 ) ) ( not ( = ?auto_780287 ?auto_780292 ) ) ( not ( = ?auto_780287 ?auto_780293 ) ) ( not ( = ?auto_780287 ?auto_780294 ) ) ( not ( = ?auto_780287 ?auto_780295 ) ) ( not ( = ?auto_780287 ?auto_780296 ) ) ( not ( = ?auto_780287 ?auto_780297 ) ) ( not ( = ?auto_780287 ?auto_780298 ) ) ( not ( = ?auto_780288 ?auto_780289 ) ) ( not ( = ?auto_780288 ?auto_780290 ) ) ( not ( = ?auto_780288 ?auto_780291 ) ) ( not ( = ?auto_780288 ?auto_780292 ) ) ( not ( = ?auto_780288 ?auto_780293 ) ) ( not ( = ?auto_780288 ?auto_780294 ) ) ( not ( = ?auto_780288 ?auto_780295 ) ) ( not ( = ?auto_780288 ?auto_780296 ) ) ( not ( = ?auto_780288 ?auto_780297 ) ) ( not ( = ?auto_780288 ?auto_780298 ) ) ( not ( = ?auto_780289 ?auto_780290 ) ) ( not ( = ?auto_780289 ?auto_780291 ) ) ( not ( = ?auto_780289 ?auto_780292 ) ) ( not ( = ?auto_780289 ?auto_780293 ) ) ( not ( = ?auto_780289 ?auto_780294 ) ) ( not ( = ?auto_780289 ?auto_780295 ) ) ( not ( = ?auto_780289 ?auto_780296 ) ) ( not ( = ?auto_780289 ?auto_780297 ) ) ( not ( = ?auto_780289 ?auto_780298 ) ) ( not ( = ?auto_780290 ?auto_780291 ) ) ( not ( = ?auto_780290 ?auto_780292 ) ) ( not ( = ?auto_780290 ?auto_780293 ) ) ( not ( = ?auto_780290 ?auto_780294 ) ) ( not ( = ?auto_780290 ?auto_780295 ) ) ( not ( = ?auto_780290 ?auto_780296 ) ) ( not ( = ?auto_780290 ?auto_780297 ) ) ( not ( = ?auto_780290 ?auto_780298 ) ) ( not ( = ?auto_780291 ?auto_780292 ) ) ( not ( = ?auto_780291 ?auto_780293 ) ) ( not ( = ?auto_780291 ?auto_780294 ) ) ( not ( = ?auto_780291 ?auto_780295 ) ) ( not ( = ?auto_780291 ?auto_780296 ) ) ( not ( = ?auto_780291 ?auto_780297 ) ) ( not ( = ?auto_780291 ?auto_780298 ) ) ( not ( = ?auto_780292 ?auto_780293 ) ) ( not ( = ?auto_780292 ?auto_780294 ) ) ( not ( = ?auto_780292 ?auto_780295 ) ) ( not ( = ?auto_780292 ?auto_780296 ) ) ( not ( = ?auto_780292 ?auto_780297 ) ) ( not ( = ?auto_780292 ?auto_780298 ) ) ( not ( = ?auto_780293 ?auto_780294 ) ) ( not ( = ?auto_780293 ?auto_780295 ) ) ( not ( = ?auto_780293 ?auto_780296 ) ) ( not ( = ?auto_780293 ?auto_780297 ) ) ( not ( = ?auto_780293 ?auto_780298 ) ) ( not ( = ?auto_780294 ?auto_780295 ) ) ( not ( = ?auto_780294 ?auto_780296 ) ) ( not ( = ?auto_780294 ?auto_780297 ) ) ( not ( = ?auto_780294 ?auto_780298 ) ) ( not ( = ?auto_780295 ?auto_780296 ) ) ( not ( = ?auto_780295 ?auto_780297 ) ) ( not ( = ?auto_780295 ?auto_780298 ) ) ( not ( = ?auto_780296 ?auto_780297 ) ) ( not ( = ?auto_780296 ?auto_780298 ) ) ( not ( = ?auto_780297 ?auto_780298 ) ) ( ON ?auto_780296 ?auto_780297 ) ( ON ?auto_780295 ?auto_780296 ) ( CLEAR ?auto_780293 ) ( ON ?auto_780294 ?auto_780295 ) ( CLEAR ?auto_780294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_780282 ?auto_780283 ?auto_780284 ?auto_780285 ?auto_780286 ?auto_780287 ?auto_780288 ?auto_780289 ?auto_780290 ?auto_780291 ?auto_780292 ?auto_780293 ?auto_780294 )
      ( MAKE-16PILE ?auto_780282 ?auto_780283 ?auto_780284 ?auto_780285 ?auto_780286 ?auto_780287 ?auto_780288 ?auto_780289 ?auto_780290 ?auto_780291 ?auto_780292 ?auto_780293 ?auto_780294 ?auto_780295 ?auto_780296 ?auto_780297 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_780348 - BLOCK
      ?auto_780349 - BLOCK
      ?auto_780350 - BLOCK
      ?auto_780351 - BLOCK
      ?auto_780352 - BLOCK
      ?auto_780353 - BLOCK
      ?auto_780354 - BLOCK
      ?auto_780355 - BLOCK
      ?auto_780356 - BLOCK
      ?auto_780357 - BLOCK
      ?auto_780358 - BLOCK
      ?auto_780359 - BLOCK
      ?auto_780360 - BLOCK
      ?auto_780361 - BLOCK
      ?auto_780362 - BLOCK
      ?auto_780363 - BLOCK
    )
    :vars
    (
      ?auto_780364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_780363 ?auto_780364 ) ( ON-TABLE ?auto_780348 ) ( ON ?auto_780349 ?auto_780348 ) ( ON ?auto_780350 ?auto_780349 ) ( ON ?auto_780351 ?auto_780350 ) ( ON ?auto_780352 ?auto_780351 ) ( ON ?auto_780353 ?auto_780352 ) ( ON ?auto_780354 ?auto_780353 ) ( ON ?auto_780355 ?auto_780354 ) ( ON ?auto_780356 ?auto_780355 ) ( ON ?auto_780357 ?auto_780356 ) ( ON ?auto_780358 ?auto_780357 ) ( not ( = ?auto_780348 ?auto_780349 ) ) ( not ( = ?auto_780348 ?auto_780350 ) ) ( not ( = ?auto_780348 ?auto_780351 ) ) ( not ( = ?auto_780348 ?auto_780352 ) ) ( not ( = ?auto_780348 ?auto_780353 ) ) ( not ( = ?auto_780348 ?auto_780354 ) ) ( not ( = ?auto_780348 ?auto_780355 ) ) ( not ( = ?auto_780348 ?auto_780356 ) ) ( not ( = ?auto_780348 ?auto_780357 ) ) ( not ( = ?auto_780348 ?auto_780358 ) ) ( not ( = ?auto_780348 ?auto_780359 ) ) ( not ( = ?auto_780348 ?auto_780360 ) ) ( not ( = ?auto_780348 ?auto_780361 ) ) ( not ( = ?auto_780348 ?auto_780362 ) ) ( not ( = ?auto_780348 ?auto_780363 ) ) ( not ( = ?auto_780348 ?auto_780364 ) ) ( not ( = ?auto_780349 ?auto_780350 ) ) ( not ( = ?auto_780349 ?auto_780351 ) ) ( not ( = ?auto_780349 ?auto_780352 ) ) ( not ( = ?auto_780349 ?auto_780353 ) ) ( not ( = ?auto_780349 ?auto_780354 ) ) ( not ( = ?auto_780349 ?auto_780355 ) ) ( not ( = ?auto_780349 ?auto_780356 ) ) ( not ( = ?auto_780349 ?auto_780357 ) ) ( not ( = ?auto_780349 ?auto_780358 ) ) ( not ( = ?auto_780349 ?auto_780359 ) ) ( not ( = ?auto_780349 ?auto_780360 ) ) ( not ( = ?auto_780349 ?auto_780361 ) ) ( not ( = ?auto_780349 ?auto_780362 ) ) ( not ( = ?auto_780349 ?auto_780363 ) ) ( not ( = ?auto_780349 ?auto_780364 ) ) ( not ( = ?auto_780350 ?auto_780351 ) ) ( not ( = ?auto_780350 ?auto_780352 ) ) ( not ( = ?auto_780350 ?auto_780353 ) ) ( not ( = ?auto_780350 ?auto_780354 ) ) ( not ( = ?auto_780350 ?auto_780355 ) ) ( not ( = ?auto_780350 ?auto_780356 ) ) ( not ( = ?auto_780350 ?auto_780357 ) ) ( not ( = ?auto_780350 ?auto_780358 ) ) ( not ( = ?auto_780350 ?auto_780359 ) ) ( not ( = ?auto_780350 ?auto_780360 ) ) ( not ( = ?auto_780350 ?auto_780361 ) ) ( not ( = ?auto_780350 ?auto_780362 ) ) ( not ( = ?auto_780350 ?auto_780363 ) ) ( not ( = ?auto_780350 ?auto_780364 ) ) ( not ( = ?auto_780351 ?auto_780352 ) ) ( not ( = ?auto_780351 ?auto_780353 ) ) ( not ( = ?auto_780351 ?auto_780354 ) ) ( not ( = ?auto_780351 ?auto_780355 ) ) ( not ( = ?auto_780351 ?auto_780356 ) ) ( not ( = ?auto_780351 ?auto_780357 ) ) ( not ( = ?auto_780351 ?auto_780358 ) ) ( not ( = ?auto_780351 ?auto_780359 ) ) ( not ( = ?auto_780351 ?auto_780360 ) ) ( not ( = ?auto_780351 ?auto_780361 ) ) ( not ( = ?auto_780351 ?auto_780362 ) ) ( not ( = ?auto_780351 ?auto_780363 ) ) ( not ( = ?auto_780351 ?auto_780364 ) ) ( not ( = ?auto_780352 ?auto_780353 ) ) ( not ( = ?auto_780352 ?auto_780354 ) ) ( not ( = ?auto_780352 ?auto_780355 ) ) ( not ( = ?auto_780352 ?auto_780356 ) ) ( not ( = ?auto_780352 ?auto_780357 ) ) ( not ( = ?auto_780352 ?auto_780358 ) ) ( not ( = ?auto_780352 ?auto_780359 ) ) ( not ( = ?auto_780352 ?auto_780360 ) ) ( not ( = ?auto_780352 ?auto_780361 ) ) ( not ( = ?auto_780352 ?auto_780362 ) ) ( not ( = ?auto_780352 ?auto_780363 ) ) ( not ( = ?auto_780352 ?auto_780364 ) ) ( not ( = ?auto_780353 ?auto_780354 ) ) ( not ( = ?auto_780353 ?auto_780355 ) ) ( not ( = ?auto_780353 ?auto_780356 ) ) ( not ( = ?auto_780353 ?auto_780357 ) ) ( not ( = ?auto_780353 ?auto_780358 ) ) ( not ( = ?auto_780353 ?auto_780359 ) ) ( not ( = ?auto_780353 ?auto_780360 ) ) ( not ( = ?auto_780353 ?auto_780361 ) ) ( not ( = ?auto_780353 ?auto_780362 ) ) ( not ( = ?auto_780353 ?auto_780363 ) ) ( not ( = ?auto_780353 ?auto_780364 ) ) ( not ( = ?auto_780354 ?auto_780355 ) ) ( not ( = ?auto_780354 ?auto_780356 ) ) ( not ( = ?auto_780354 ?auto_780357 ) ) ( not ( = ?auto_780354 ?auto_780358 ) ) ( not ( = ?auto_780354 ?auto_780359 ) ) ( not ( = ?auto_780354 ?auto_780360 ) ) ( not ( = ?auto_780354 ?auto_780361 ) ) ( not ( = ?auto_780354 ?auto_780362 ) ) ( not ( = ?auto_780354 ?auto_780363 ) ) ( not ( = ?auto_780354 ?auto_780364 ) ) ( not ( = ?auto_780355 ?auto_780356 ) ) ( not ( = ?auto_780355 ?auto_780357 ) ) ( not ( = ?auto_780355 ?auto_780358 ) ) ( not ( = ?auto_780355 ?auto_780359 ) ) ( not ( = ?auto_780355 ?auto_780360 ) ) ( not ( = ?auto_780355 ?auto_780361 ) ) ( not ( = ?auto_780355 ?auto_780362 ) ) ( not ( = ?auto_780355 ?auto_780363 ) ) ( not ( = ?auto_780355 ?auto_780364 ) ) ( not ( = ?auto_780356 ?auto_780357 ) ) ( not ( = ?auto_780356 ?auto_780358 ) ) ( not ( = ?auto_780356 ?auto_780359 ) ) ( not ( = ?auto_780356 ?auto_780360 ) ) ( not ( = ?auto_780356 ?auto_780361 ) ) ( not ( = ?auto_780356 ?auto_780362 ) ) ( not ( = ?auto_780356 ?auto_780363 ) ) ( not ( = ?auto_780356 ?auto_780364 ) ) ( not ( = ?auto_780357 ?auto_780358 ) ) ( not ( = ?auto_780357 ?auto_780359 ) ) ( not ( = ?auto_780357 ?auto_780360 ) ) ( not ( = ?auto_780357 ?auto_780361 ) ) ( not ( = ?auto_780357 ?auto_780362 ) ) ( not ( = ?auto_780357 ?auto_780363 ) ) ( not ( = ?auto_780357 ?auto_780364 ) ) ( not ( = ?auto_780358 ?auto_780359 ) ) ( not ( = ?auto_780358 ?auto_780360 ) ) ( not ( = ?auto_780358 ?auto_780361 ) ) ( not ( = ?auto_780358 ?auto_780362 ) ) ( not ( = ?auto_780358 ?auto_780363 ) ) ( not ( = ?auto_780358 ?auto_780364 ) ) ( not ( = ?auto_780359 ?auto_780360 ) ) ( not ( = ?auto_780359 ?auto_780361 ) ) ( not ( = ?auto_780359 ?auto_780362 ) ) ( not ( = ?auto_780359 ?auto_780363 ) ) ( not ( = ?auto_780359 ?auto_780364 ) ) ( not ( = ?auto_780360 ?auto_780361 ) ) ( not ( = ?auto_780360 ?auto_780362 ) ) ( not ( = ?auto_780360 ?auto_780363 ) ) ( not ( = ?auto_780360 ?auto_780364 ) ) ( not ( = ?auto_780361 ?auto_780362 ) ) ( not ( = ?auto_780361 ?auto_780363 ) ) ( not ( = ?auto_780361 ?auto_780364 ) ) ( not ( = ?auto_780362 ?auto_780363 ) ) ( not ( = ?auto_780362 ?auto_780364 ) ) ( not ( = ?auto_780363 ?auto_780364 ) ) ( ON ?auto_780362 ?auto_780363 ) ( ON ?auto_780361 ?auto_780362 ) ( ON ?auto_780360 ?auto_780361 ) ( CLEAR ?auto_780358 ) ( ON ?auto_780359 ?auto_780360 ) ( CLEAR ?auto_780359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_780348 ?auto_780349 ?auto_780350 ?auto_780351 ?auto_780352 ?auto_780353 ?auto_780354 ?auto_780355 ?auto_780356 ?auto_780357 ?auto_780358 ?auto_780359 )
      ( MAKE-16PILE ?auto_780348 ?auto_780349 ?auto_780350 ?auto_780351 ?auto_780352 ?auto_780353 ?auto_780354 ?auto_780355 ?auto_780356 ?auto_780357 ?auto_780358 ?auto_780359 ?auto_780360 ?auto_780361 ?auto_780362 ?auto_780363 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_780414 - BLOCK
      ?auto_780415 - BLOCK
      ?auto_780416 - BLOCK
      ?auto_780417 - BLOCK
      ?auto_780418 - BLOCK
      ?auto_780419 - BLOCK
      ?auto_780420 - BLOCK
      ?auto_780421 - BLOCK
      ?auto_780422 - BLOCK
      ?auto_780423 - BLOCK
      ?auto_780424 - BLOCK
      ?auto_780425 - BLOCK
      ?auto_780426 - BLOCK
      ?auto_780427 - BLOCK
      ?auto_780428 - BLOCK
      ?auto_780429 - BLOCK
    )
    :vars
    (
      ?auto_780430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_780429 ?auto_780430 ) ( ON-TABLE ?auto_780414 ) ( ON ?auto_780415 ?auto_780414 ) ( ON ?auto_780416 ?auto_780415 ) ( ON ?auto_780417 ?auto_780416 ) ( ON ?auto_780418 ?auto_780417 ) ( ON ?auto_780419 ?auto_780418 ) ( ON ?auto_780420 ?auto_780419 ) ( ON ?auto_780421 ?auto_780420 ) ( ON ?auto_780422 ?auto_780421 ) ( ON ?auto_780423 ?auto_780422 ) ( not ( = ?auto_780414 ?auto_780415 ) ) ( not ( = ?auto_780414 ?auto_780416 ) ) ( not ( = ?auto_780414 ?auto_780417 ) ) ( not ( = ?auto_780414 ?auto_780418 ) ) ( not ( = ?auto_780414 ?auto_780419 ) ) ( not ( = ?auto_780414 ?auto_780420 ) ) ( not ( = ?auto_780414 ?auto_780421 ) ) ( not ( = ?auto_780414 ?auto_780422 ) ) ( not ( = ?auto_780414 ?auto_780423 ) ) ( not ( = ?auto_780414 ?auto_780424 ) ) ( not ( = ?auto_780414 ?auto_780425 ) ) ( not ( = ?auto_780414 ?auto_780426 ) ) ( not ( = ?auto_780414 ?auto_780427 ) ) ( not ( = ?auto_780414 ?auto_780428 ) ) ( not ( = ?auto_780414 ?auto_780429 ) ) ( not ( = ?auto_780414 ?auto_780430 ) ) ( not ( = ?auto_780415 ?auto_780416 ) ) ( not ( = ?auto_780415 ?auto_780417 ) ) ( not ( = ?auto_780415 ?auto_780418 ) ) ( not ( = ?auto_780415 ?auto_780419 ) ) ( not ( = ?auto_780415 ?auto_780420 ) ) ( not ( = ?auto_780415 ?auto_780421 ) ) ( not ( = ?auto_780415 ?auto_780422 ) ) ( not ( = ?auto_780415 ?auto_780423 ) ) ( not ( = ?auto_780415 ?auto_780424 ) ) ( not ( = ?auto_780415 ?auto_780425 ) ) ( not ( = ?auto_780415 ?auto_780426 ) ) ( not ( = ?auto_780415 ?auto_780427 ) ) ( not ( = ?auto_780415 ?auto_780428 ) ) ( not ( = ?auto_780415 ?auto_780429 ) ) ( not ( = ?auto_780415 ?auto_780430 ) ) ( not ( = ?auto_780416 ?auto_780417 ) ) ( not ( = ?auto_780416 ?auto_780418 ) ) ( not ( = ?auto_780416 ?auto_780419 ) ) ( not ( = ?auto_780416 ?auto_780420 ) ) ( not ( = ?auto_780416 ?auto_780421 ) ) ( not ( = ?auto_780416 ?auto_780422 ) ) ( not ( = ?auto_780416 ?auto_780423 ) ) ( not ( = ?auto_780416 ?auto_780424 ) ) ( not ( = ?auto_780416 ?auto_780425 ) ) ( not ( = ?auto_780416 ?auto_780426 ) ) ( not ( = ?auto_780416 ?auto_780427 ) ) ( not ( = ?auto_780416 ?auto_780428 ) ) ( not ( = ?auto_780416 ?auto_780429 ) ) ( not ( = ?auto_780416 ?auto_780430 ) ) ( not ( = ?auto_780417 ?auto_780418 ) ) ( not ( = ?auto_780417 ?auto_780419 ) ) ( not ( = ?auto_780417 ?auto_780420 ) ) ( not ( = ?auto_780417 ?auto_780421 ) ) ( not ( = ?auto_780417 ?auto_780422 ) ) ( not ( = ?auto_780417 ?auto_780423 ) ) ( not ( = ?auto_780417 ?auto_780424 ) ) ( not ( = ?auto_780417 ?auto_780425 ) ) ( not ( = ?auto_780417 ?auto_780426 ) ) ( not ( = ?auto_780417 ?auto_780427 ) ) ( not ( = ?auto_780417 ?auto_780428 ) ) ( not ( = ?auto_780417 ?auto_780429 ) ) ( not ( = ?auto_780417 ?auto_780430 ) ) ( not ( = ?auto_780418 ?auto_780419 ) ) ( not ( = ?auto_780418 ?auto_780420 ) ) ( not ( = ?auto_780418 ?auto_780421 ) ) ( not ( = ?auto_780418 ?auto_780422 ) ) ( not ( = ?auto_780418 ?auto_780423 ) ) ( not ( = ?auto_780418 ?auto_780424 ) ) ( not ( = ?auto_780418 ?auto_780425 ) ) ( not ( = ?auto_780418 ?auto_780426 ) ) ( not ( = ?auto_780418 ?auto_780427 ) ) ( not ( = ?auto_780418 ?auto_780428 ) ) ( not ( = ?auto_780418 ?auto_780429 ) ) ( not ( = ?auto_780418 ?auto_780430 ) ) ( not ( = ?auto_780419 ?auto_780420 ) ) ( not ( = ?auto_780419 ?auto_780421 ) ) ( not ( = ?auto_780419 ?auto_780422 ) ) ( not ( = ?auto_780419 ?auto_780423 ) ) ( not ( = ?auto_780419 ?auto_780424 ) ) ( not ( = ?auto_780419 ?auto_780425 ) ) ( not ( = ?auto_780419 ?auto_780426 ) ) ( not ( = ?auto_780419 ?auto_780427 ) ) ( not ( = ?auto_780419 ?auto_780428 ) ) ( not ( = ?auto_780419 ?auto_780429 ) ) ( not ( = ?auto_780419 ?auto_780430 ) ) ( not ( = ?auto_780420 ?auto_780421 ) ) ( not ( = ?auto_780420 ?auto_780422 ) ) ( not ( = ?auto_780420 ?auto_780423 ) ) ( not ( = ?auto_780420 ?auto_780424 ) ) ( not ( = ?auto_780420 ?auto_780425 ) ) ( not ( = ?auto_780420 ?auto_780426 ) ) ( not ( = ?auto_780420 ?auto_780427 ) ) ( not ( = ?auto_780420 ?auto_780428 ) ) ( not ( = ?auto_780420 ?auto_780429 ) ) ( not ( = ?auto_780420 ?auto_780430 ) ) ( not ( = ?auto_780421 ?auto_780422 ) ) ( not ( = ?auto_780421 ?auto_780423 ) ) ( not ( = ?auto_780421 ?auto_780424 ) ) ( not ( = ?auto_780421 ?auto_780425 ) ) ( not ( = ?auto_780421 ?auto_780426 ) ) ( not ( = ?auto_780421 ?auto_780427 ) ) ( not ( = ?auto_780421 ?auto_780428 ) ) ( not ( = ?auto_780421 ?auto_780429 ) ) ( not ( = ?auto_780421 ?auto_780430 ) ) ( not ( = ?auto_780422 ?auto_780423 ) ) ( not ( = ?auto_780422 ?auto_780424 ) ) ( not ( = ?auto_780422 ?auto_780425 ) ) ( not ( = ?auto_780422 ?auto_780426 ) ) ( not ( = ?auto_780422 ?auto_780427 ) ) ( not ( = ?auto_780422 ?auto_780428 ) ) ( not ( = ?auto_780422 ?auto_780429 ) ) ( not ( = ?auto_780422 ?auto_780430 ) ) ( not ( = ?auto_780423 ?auto_780424 ) ) ( not ( = ?auto_780423 ?auto_780425 ) ) ( not ( = ?auto_780423 ?auto_780426 ) ) ( not ( = ?auto_780423 ?auto_780427 ) ) ( not ( = ?auto_780423 ?auto_780428 ) ) ( not ( = ?auto_780423 ?auto_780429 ) ) ( not ( = ?auto_780423 ?auto_780430 ) ) ( not ( = ?auto_780424 ?auto_780425 ) ) ( not ( = ?auto_780424 ?auto_780426 ) ) ( not ( = ?auto_780424 ?auto_780427 ) ) ( not ( = ?auto_780424 ?auto_780428 ) ) ( not ( = ?auto_780424 ?auto_780429 ) ) ( not ( = ?auto_780424 ?auto_780430 ) ) ( not ( = ?auto_780425 ?auto_780426 ) ) ( not ( = ?auto_780425 ?auto_780427 ) ) ( not ( = ?auto_780425 ?auto_780428 ) ) ( not ( = ?auto_780425 ?auto_780429 ) ) ( not ( = ?auto_780425 ?auto_780430 ) ) ( not ( = ?auto_780426 ?auto_780427 ) ) ( not ( = ?auto_780426 ?auto_780428 ) ) ( not ( = ?auto_780426 ?auto_780429 ) ) ( not ( = ?auto_780426 ?auto_780430 ) ) ( not ( = ?auto_780427 ?auto_780428 ) ) ( not ( = ?auto_780427 ?auto_780429 ) ) ( not ( = ?auto_780427 ?auto_780430 ) ) ( not ( = ?auto_780428 ?auto_780429 ) ) ( not ( = ?auto_780428 ?auto_780430 ) ) ( not ( = ?auto_780429 ?auto_780430 ) ) ( ON ?auto_780428 ?auto_780429 ) ( ON ?auto_780427 ?auto_780428 ) ( ON ?auto_780426 ?auto_780427 ) ( ON ?auto_780425 ?auto_780426 ) ( CLEAR ?auto_780423 ) ( ON ?auto_780424 ?auto_780425 ) ( CLEAR ?auto_780424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_780414 ?auto_780415 ?auto_780416 ?auto_780417 ?auto_780418 ?auto_780419 ?auto_780420 ?auto_780421 ?auto_780422 ?auto_780423 ?auto_780424 )
      ( MAKE-16PILE ?auto_780414 ?auto_780415 ?auto_780416 ?auto_780417 ?auto_780418 ?auto_780419 ?auto_780420 ?auto_780421 ?auto_780422 ?auto_780423 ?auto_780424 ?auto_780425 ?auto_780426 ?auto_780427 ?auto_780428 ?auto_780429 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_780480 - BLOCK
      ?auto_780481 - BLOCK
      ?auto_780482 - BLOCK
      ?auto_780483 - BLOCK
      ?auto_780484 - BLOCK
      ?auto_780485 - BLOCK
      ?auto_780486 - BLOCK
      ?auto_780487 - BLOCK
      ?auto_780488 - BLOCK
      ?auto_780489 - BLOCK
      ?auto_780490 - BLOCK
      ?auto_780491 - BLOCK
      ?auto_780492 - BLOCK
      ?auto_780493 - BLOCK
      ?auto_780494 - BLOCK
      ?auto_780495 - BLOCK
    )
    :vars
    (
      ?auto_780496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_780495 ?auto_780496 ) ( ON-TABLE ?auto_780480 ) ( ON ?auto_780481 ?auto_780480 ) ( ON ?auto_780482 ?auto_780481 ) ( ON ?auto_780483 ?auto_780482 ) ( ON ?auto_780484 ?auto_780483 ) ( ON ?auto_780485 ?auto_780484 ) ( ON ?auto_780486 ?auto_780485 ) ( ON ?auto_780487 ?auto_780486 ) ( ON ?auto_780488 ?auto_780487 ) ( not ( = ?auto_780480 ?auto_780481 ) ) ( not ( = ?auto_780480 ?auto_780482 ) ) ( not ( = ?auto_780480 ?auto_780483 ) ) ( not ( = ?auto_780480 ?auto_780484 ) ) ( not ( = ?auto_780480 ?auto_780485 ) ) ( not ( = ?auto_780480 ?auto_780486 ) ) ( not ( = ?auto_780480 ?auto_780487 ) ) ( not ( = ?auto_780480 ?auto_780488 ) ) ( not ( = ?auto_780480 ?auto_780489 ) ) ( not ( = ?auto_780480 ?auto_780490 ) ) ( not ( = ?auto_780480 ?auto_780491 ) ) ( not ( = ?auto_780480 ?auto_780492 ) ) ( not ( = ?auto_780480 ?auto_780493 ) ) ( not ( = ?auto_780480 ?auto_780494 ) ) ( not ( = ?auto_780480 ?auto_780495 ) ) ( not ( = ?auto_780480 ?auto_780496 ) ) ( not ( = ?auto_780481 ?auto_780482 ) ) ( not ( = ?auto_780481 ?auto_780483 ) ) ( not ( = ?auto_780481 ?auto_780484 ) ) ( not ( = ?auto_780481 ?auto_780485 ) ) ( not ( = ?auto_780481 ?auto_780486 ) ) ( not ( = ?auto_780481 ?auto_780487 ) ) ( not ( = ?auto_780481 ?auto_780488 ) ) ( not ( = ?auto_780481 ?auto_780489 ) ) ( not ( = ?auto_780481 ?auto_780490 ) ) ( not ( = ?auto_780481 ?auto_780491 ) ) ( not ( = ?auto_780481 ?auto_780492 ) ) ( not ( = ?auto_780481 ?auto_780493 ) ) ( not ( = ?auto_780481 ?auto_780494 ) ) ( not ( = ?auto_780481 ?auto_780495 ) ) ( not ( = ?auto_780481 ?auto_780496 ) ) ( not ( = ?auto_780482 ?auto_780483 ) ) ( not ( = ?auto_780482 ?auto_780484 ) ) ( not ( = ?auto_780482 ?auto_780485 ) ) ( not ( = ?auto_780482 ?auto_780486 ) ) ( not ( = ?auto_780482 ?auto_780487 ) ) ( not ( = ?auto_780482 ?auto_780488 ) ) ( not ( = ?auto_780482 ?auto_780489 ) ) ( not ( = ?auto_780482 ?auto_780490 ) ) ( not ( = ?auto_780482 ?auto_780491 ) ) ( not ( = ?auto_780482 ?auto_780492 ) ) ( not ( = ?auto_780482 ?auto_780493 ) ) ( not ( = ?auto_780482 ?auto_780494 ) ) ( not ( = ?auto_780482 ?auto_780495 ) ) ( not ( = ?auto_780482 ?auto_780496 ) ) ( not ( = ?auto_780483 ?auto_780484 ) ) ( not ( = ?auto_780483 ?auto_780485 ) ) ( not ( = ?auto_780483 ?auto_780486 ) ) ( not ( = ?auto_780483 ?auto_780487 ) ) ( not ( = ?auto_780483 ?auto_780488 ) ) ( not ( = ?auto_780483 ?auto_780489 ) ) ( not ( = ?auto_780483 ?auto_780490 ) ) ( not ( = ?auto_780483 ?auto_780491 ) ) ( not ( = ?auto_780483 ?auto_780492 ) ) ( not ( = ?auto_780483 ?auto_780493 ) ) ( not ( = ?auto_780483 ?auto_780494 ) ) ( not ( = ?auto_780483 ?auto_780495 ) ) ( not ( = ?auto_780483 ?auto_780496 ) ) ( not ( = ?auto_780484 ?auto_780485 ) ) ( not ( = ?auto_780484 ?auto_780486 ) ) ( not ( = ?auto_780484 ?auto_780487 ) ) ( not ( = ?auto_780484 ?auto_780488 ) ) ( not ( = ?auto_780484 ?auto_780489 ) ) ( not ( = ?auto_780484 ?auto_780490 ) ) ( not ( = ?auto_780484 ?auto_780491 ) ) ( not ( = ?auto_780484 ?auto_780492 ) ) ( not ( = ?auto_780484 ?auto_780493 ) ) ( not ( = ?auto_780484 ?auto_780494 ) ) ( not ( = ?auto_780484 ?auto_780495 ) ) ( not ( = ?auto_780484 ?auto_780496 ) ) ( not ( = ?auto_780485 ?auto_780486 ) ) ( not ( = ?auto_780485 ?auto_780487 ) ) ( not ( = ?auto_780485 ?auto_780488 ) ) ( not ( = ?auto_780485 ?auto_780489 ) ) ( not ( = ?auto_780485 ?auto_780490 ) ) ( not ( = ?auto_780485 ?auto_780491 ) ) ( not ( = ?auto_780485 ?auto_780492 ) ) ( not ( = ?auto_780485 ?auto_780493 ) ) ( not ( = ?auto_780485 ?auto_780494 ) ) ( not ( = ?auto_780485 ?auto_780495 ) ) ( not ( = ?auto_780485 ?auto_780496 ) ) ( not ( = ?auto_780486 ?auto_780487 ) ) ( not ( = ?auto_780486 ?auto_780488 ) ) ( not ( = ?auto_780486 ?auto_780489 ) ) ( not ( = ?auto_780486 ?auto_780490 ) ) ( not ( = ?auto_780486 ?auto_780491 ) ) ( not ( = ?auto_780486 ?auto_780492 ) ) ( not ( = ?auto_780486 ?auto_780493 ) ) ( not ( = ?auto_780486 ?auto_780494 ) ) ( not ( = ?auto_780486 ?auto_780495 ) ) ( not ( = ?auto_780486 ?auto_780496 ) ) ( not ( = ?auto_780487 ?auto_780488 ) ) ( not ( = ?auto_780487 ?auto_780489 ) ) ( not ( = ?auto_780487 ?auto_780490 ) ) ( not ( = ?auto_780487 ?auto_780491 ) ) ( not ( = ?auto_780487 ?auto_780492 ) ) ( not ( = ?auto_780487 ?auto_780493 ) ) ( not ( = ?auto_780487 ?auto_780494 ) ) ( not ( = ?auto_780487 ?auto_780495 ) ) ( not ( = ?auto_780487 ?auto_780496 ) ) ( not ( = ?auto_780488 ?auto_780489 ) ) ( not ( = ?auto_780488 ?auto_780490 ) ) ( not ( = ?auto_780488 ?auto_780491 ) ) ( not ( = ?auto_780488 ?auto_780492 ) ) ( not ( = ?auto_780488 ?auto_780493 ) ) ( not ( = ?auto_780488 ?auto_780494 ) ) ( not ( = ?auto_780488 ?auto_780495 ) ) ( not ( = ?auto_780488 ?auto_780496 ) ) ( not ( = ?auto_780489 ?auto_780490 ) ) ( not ( = ?auto_780489 ?auto_780491 ) ) ( not ( = ?auto_780489 ?auto_780492 ) ) ( not ( = ?auto_780489 ?auto_780493 ) ) ( not ( = ?auto_780489 ?auto_780494 ) ) ( not ( = ?auto_780489 ?auto_780495 ) ) ( not ( = ?auto_780489 ?auto_780496 ) ) ( not ( = ?auto_780490 ?auto_780491 ) ) ( not ( = ?auto_780490 ?auto_780492 ) ) ( not ( = ?auto_780490 ?auto_780493 ) ) ( not ( = ?auto_780490 ?auto_780494 ) ) ( not ( = ?auto_780490 ?auto_780495 ) ) ( not ( = ?auto_780490 ?auto_780496 ) ) ( not ( = ?auto_780491 ?auto_780492 ) ) ( not ( = ?auto_780491 ?auto_780493 ) ) ( not ( = ?auto_780491 ?auto_780494 ) ) ( not ( = ?auto_780491 ?auto_780495 ) ) ( not ( = ?auto_780491 ?auto_780496 ) ) ( not ( = ?auto_780492 ?auto_780493 ) ) ( not ( = ?auto_780492 ?auto_780494 ) ) ( not ( = ?auto_780492 ?auto_780495 ) ) ( not ( = ?auto_780492 ?auto_780496 ) ) ( not ( = ?auto_780493 ?auto_780494 ) ) ( not ( = ?auto_780493 ?auto_780495 ) ) ( not ( = ?auto_780493 ?auto_780496 ) ) ( not ( = ?auto_780494 ?auto_780495 ) ) ( not ( = ?auto_780494 ?auto_780496 ) ) ( not ( = ?auto_780495 ?auto_780496 ) ) ( ON ?auto_780494 ?auto_780495 ) ( ON ?auto_780493 ?auto_780494 ) ( ON ?auto_780492 ?auto_780493 ) ( ON ?auto_780491 ?auto_780492 ) ( ON ?auto_780490 ?auto_780491 ) ( CLEAR ?auto_780488 ) ( ON ?auto_780489 ?auto_780490 ) ( CLEAR ?auto_780489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_780480 ?auto_780481 ?auto_780482 ?auto_780483 ?auto_780484 ?auto_780485 ?auto_780486 ?auto_780487 ?auto_780488 ?auto_780489 )
      ( MAKE-16PILE ?auto_780480 ?auto_780481 ?auto_780482 ?auto_780483 ?auto_780484 ?auto_780485 ?auto_780486 ?auto_780487 ?auto_780488 ?auto_780489 ?auto_780490 ?auto_780491 ?auto_780492 ?auto_780493 ?auto_780494 ?auto_780495 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_780546 - BLOCK
      ?auto_780547 - BLOCK
      ?auto_780548 - BLOCK
      ?auto_780549 - BLOCK
      ?auto_780550 - BLOCK
      ?auto_780551 - BLOCK
      ?auto_780552 - BLOCK
      ?auto_780553 - BLOCK
      ?auto_780554 - BLOCK
      ?auto_780555 - BLOCK
      ?auto_780556 - BLOCK
      ?auto_780557 - BLOCK
      ?auto_780558 - BLOCK
      ?auto_780559 - BLOCK
      ?auto_780560 - BLOCK
      ?auto_780561 - BLOCK
    )
    :vars
    (
      ?auto_780562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_780561 ?auto_780562 ) ( ON-TABLE ?auto_780546 ) ( ON ?auto_780547 ?auto_780546 ) ( ON ?auto_780548 ?auto_780547 ) ( ON ?auto_780549 ?auto_780548 ) ( ON ?auto_780550 ?auto_780549 ) ( ON ?auto_780551 ?auto_780550 ) ( ON ?auto_780552 ?auto_780551 ) ( ON ?auto_780553 ?auto_780552 ) ( not ( = ?auto_780546 ?auto_780547 ) ) ( not ( = ?auto_780546 ?auto_780548 ) ) ( not ( = ?auto_780546 ?auto_780549 ) ) ( not ( = ?auto_780546 ?auto_780550 ) ) ( not ( = ?auto_780546 ?auto_780551 ) ) ( not ( = ?auto_780546 ?auto_780552 ) ) ( not ( = ?auto_780546 ?auto_780553 ) ) ( not ( = ?auto_780546 ?auto_780554 ) ) ( not ( = ?auto_780546 ?auto_780555 ) ) ( not ( = ?auto_780546 ?auto_780556 ) ) ( not ( = ?auto_780546 ?auto_780557 ) ) ( not ( = ?auto_780546 ?auto_780558 ) ) ( not ( = ?auto_780546 ?auto_780559 ) ) ( not ( = ?auto_780546 ?auto_780560 ) ) ( not ( = ?auto_780546 ?auto_780561 ) ) ( not ( = ?auto_780546 ?auto_780562 ) ) ( not ( = ?auto_780547 ?auto_780548 ) ) ( not ( = ?auto_780547 ?auto_780549 ) ) ( not ( = ?auto_780547 ?auto_780550 ) ) ( not ( = ?auto_780547 ?auto_780551 ) ) ( not ( = ?auto_780547 ?auto_780552 ) ) ( not ( = ?auto_780547 ?auto_780553 ) ) ( not ( = ?auto_780547 ?auto_780554 ) ) ( not ( = ?auto_780547 ?auto_780555 ) ) ( not ( = ?auto_780547 ?auto_780556 ) ) ( not ( = ?auto_780547 ?auto_780557 ) ) ( not ( = ?auto_780547 ?auto_780558 ) ) ( not ( = ?auto_780547 ?auto_780559 ) ) ( not ( = ?auto_780547 ?auto_780560 ) ) ( not ( = ?auto_780547 ?auto_780561 ) ) ( not ( = ?auto_780547 ?auto_780562 ) ) ( not ( = ?auto_780548 ?auto_780549 ) ) ( not ( = ?auto_780548 ?auto_780550 ) ) ( not ( = ?auto_780548 ?auto_780551 ) ) ( not ( = ?auto_780548 ?auto_780552 ) ) ( not ( = ?auto_780548 ?auto_780553 ) ) ( not ( = ?auto_780548 ?auto_780554 ) ) ( not ( = ?auto_780548 ?auto_780555 ) ) ( not ( = ?auto_780548 ?auto_780556 ) ) ( not ( = ?auto_780548 ?auto_780557 ) ) ( not ( = ?auto_780548 ?auto_780558 ) ) ( not ( = ?auto_780548 ?auto_780559 ) ) ( not ( = ?auto_780548 ?auto_780560 ) ) ( not ( = ?auto_780548 ?auto_780561 ) ) ( not ( = ?auto_780548 ?auto_780562 ) ) ( not ( = ?auto_780549 ?auto_780550 ) ) ( not ( = ?auto_780549 ?auto_780551 ) ) ( not ( = ?auto_780549 ?auto_780552 ) ) ( not ( = ?auto_780549 ?auto_780553 ) ) ( not ( = ?auto_780549 ?auto_780554 ) ) ( not ( = ?auto_780549 ?auto_780555 ) ) ( not ( = ?auto_780549 ?auto_780556 ) ) ( not ( = ?auto_780549 ?auto_780557 ) ) ( not ( = ?auto_780549 ?auto_780558 ) ) ( not ( = ?auto_780549 ?auto_780559 ) ) ( not ( = ?auto_780549 ?auto_780560 ) ) ( not ( = ?auto_780549 ?auto_780561 ) ) ( not ( = ?auto_780549 ?auto_780562 ) ) ( not ( = ?auto_780550 ?auto_780551 ) ) ( not ( = ?auto_780550 ?auto_780552 ) ) ( not ( = ?auto_780550 ?auto_780553 ) ) ( not ( = ?auto_780550 ?auto_780554 ) ) ( not ( = ?auto_780550 ?auto_780555 ) ) ( not ( = ?auto_780550 ?auto_780556 ) ) ( not ( = ?auto_780550 ?auto_780557 ) ) ( not ( = ?auto_780550 ?auto_780558 ) ) ( not ( = ?auto_780550 ?auto_780559 ) ) ( not ( = ?auto_780550 ?auto_780560 ) ) ( not ( = ?auto_780550 ?auto_780561 ) ) ( not ( = ?auto_780550 ?auto_780562 ) ) ( not ( = ?auto_780551 ?auto_780552 ) ) ( not ( = ?auto_780551 ?auto_780553 ) ) ( not ( = ?auto_780551 ?auto_780554 ) ) ( not ( = ?auto_780551 ?auto_780555 ) ) ( not ( = ?auto_780551 ?auto_780556 ) ) ( not ( = ?auto_780551 ?auto_780557 ) ) ( not ( = ?auto_780551 ?auto_780558 ) ) ( not ( = ?auto_780551 ?auto_780559 ) ) ( not ( = ?auto_780551 ?auto_780560 ) ) ( not ( = ?auto_780551 ?auto_780561 ) ) ( not ( = ?auto_780551 ?auto_780562 ) ) ( not ( = ?auto_780552 ?auto_780553 ) ) ( not ( = ?auto_780552 ?auto_780554 ) ) ( not ( = ?auto_780552 ?auto_780555 ) ) ( not ( = ?auto_780552 ?auto_780556 ) ) ( not ( = ?auto_780552 ?auto_780557 ) ) ( not ( = ?auto_780552 ?auto_780558 ) ) ( not ( = ?auto_780552 ?auto_780559 ) ) ( not ( = ?auto_780552 ?auto_780560 ) ) ( not ( = ?auto_780552 ?auto_780561 ) ) ( not ( = ?auto_780552 ?auto_780562 ) ) ( not ( = ?auto_780553 ?auto_780554 ) ) ( not ( = ?auto_780553 ?auto_780555 ) ) ( not ( = ?auto_780553 ?auto_780556 ) ) ( not ( = ?auto_780553 ?auto_780557 ) ) ( not ( = ?auto_780553 ?auto_780558 ) ) ( not ( = ?auto_780553 ?auto_780559 ) ) ( not ( = ?auto_780553 ?auto_780560 ) ) ( not ( = ?auto_780553 ?auto_780561 ) ) ( not ( = ?auto_780553 ?auto_780562 ) ) ( not ( = ?auto_780554 ?auto_780555 ) ) ( not ( = ?auto_780554 ?auto_780556 ) ) ( not ( = ?auto_780554 ?auto_780557 ) ) ( not ( = ?auto_780554 ?auto_780558 ) ) ( not ( = ?auto_780554 ?auto_780559 ) ) ( not ( = ?auto_780554 ?auto_780560 ) ) ( not ( = ?auto_780554 ?auto_780561 ) ) ( not ( = ?auto_780554 ?auto_780562 ) ) ( not ( = ?auto_780555 ?auto_780556 ) ) ( not ( = ?auto_780555 ?auto_780557 ) ) ( not ( = ?auto_780555 ?auto_780558 ) ) ( not ( = ?auto_780555 ?auto_780559 ) ) ( not ( = ?auto_780555 ?auto_780560 ) ) ( not ( = ?auto_780555 ?auto_780561 ) ) ( not ( = ?auto_780555 ?auto_780562 ) ) ( not ( = ?auto_780556 ?auto_780557 ) ) ( not ( = ?auto_780556 ?auto_780558 ) ) ( not ( = ?auto_780556 ?auto_780559 ) ) ( not ( = ?auto_780556 ?auto_780560 ) ) ( not ( = ?auto_780556 ?auto_780561 ) ) ( not ( = ?auto_780556 ?auto_780562 ) ) ( not ( = ?auto_780557 ?auto_780558 ) ) ( not ( = ?auto_780557 ?auto_780559 ) ) ( not ( = ?auto_780557 ?auto_780560 ) ) ( not ( = ?auto_780557 ?auto_780561 ) ) ( not ( = ?auto_780557 ?auto_780562 ) ) ( not ( = ?auto_780558 ?auto_780559 ) ) ( not ( = ?auto_780558 ?auto_780560 ) ) ( not ( = ?auto_780558 ?auto_780561 ) ) ( not ( = ?auto_780558 ?auto_780562 ) ) ( not ( = ?auto_780559 ?auto_780560 ) ) ( not ( = ?auto_780559 ?auto_780561 ) ) ( not ( = ?auto_780559 ?auto_780562 ) ) ( not ( = ?auto_780560 ?auto_780561 ) ) ( not ( = ?auto_780560 ?auto_780562 ) ) ( not ( = ?auto_780561 ?auto_780562 ) ) ( ON ?auto_780560 ?auto_780561 ) ( ON ?auto_780559 ?auto_780560 ) ( ON ?auto_780558 ?auto_780559 ) ( ON ?auto_780557 ?auto_780558 ) ( ON ?auto_780556 ?auto_780557 ) ( ON ?auto_780555 ?auto_780556 ) ( CLEAR ?auto_780553 ) ( ON ?auto_780554 ?auto_780555 ) ( CLEAR ?auto_780554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_780546 ?auto_780547 ?auto_780548 ?auto_780549 ?auto_780550 ?auto_780551 ?auto_780552 ?auto_780553 ?auto_780554 )
      ( MAKE-16PILE ?auto_780546 ?auto_780547 ?auto_780548 ?auto_780549 ?auto_780550 ?auto_780551 ?auto_780552 ?auto_780553 ?auto_780554 ?auto_780555 ?auto_780556 ?auto_780557 ?auto_780558 ?auto_780559 ?auto_780560 ?auto_780561 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_780612 - BLOCK
      ?auto_780613 - BLOCK
      ?auto_780614 - BLOCK
      ?auto_780615 - BLOCK
      ?auto_780616 - BLOCK
      ?auto_780617 - BLOCK
      ?auto_780618 - BLOCK
      ?auto_780619 - BLOCK
      ?auto_780620 - BLOCK
      ?auto_780621 - BLOCK
      ?auto_780622 - BLOCK
      ?auto_780623 - BLOCK
      ?auto_780624 - BLOCK
      ?auto_780625 - BLOCK
      ?auto_780626 - BLOCK
      ?auto_780627 - BLOCK
    )
    :vars
    (
      ?auto_780628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_780627 ?auto_780628 ) ( ON-TABLE ?auto_780612 ) ( ON ?auto_780613 ?auto_780612 ) ( ON ?auto_780614 ?auto_780613 ) ( ON ?auto_780615 ?auto_780614 ) ( ON ?auto_780616 ?auto_780615 ) ( ON ?auto_780617 ?auto_780616 ) ( ON ?auto_780618 ?auto_780617 ) ( not ( = ?auto_780612 ?auto_780613 ) ) ( not ( = ?auto_780612 ?auto_780614 ) ) ( not ( = ?auto_780612 ?auto_780615 ) ) ( not ( = ?auto_780612 ?auto_780616 ) ) ( not ( = ?auto_780612 ?auto_780617 ) ) ( not ( = ?auto_780612 ?auto_780618 ) ) ( not ( = ?auto_780612 ?auto_780619 ) ) ( not ( = ?auto_780612 ?auto_780620 ) ) ( not ( = ?auto_780612 ?auto_780621 ) ) ( not ( = ?auto_780612 ?auto_780622 ) ) ( not ( = ?auto_780612 ?auto_780623 ) ) ( not ( = ?auto_780612 ?auto_780624 ) ) ( not ( = ?auto_780612 ?auto_780625 ) ) ( not ( = ?auto_780612 ?auto_780626 ) ) ( not ( = ?auto_780612 ?auto_780627 ) ) ( not ( = ?auto_780612 ?auto_780628 ) ) ( not ( = ?auto_780613 ?auto_780614 ) ) ( not ( = ?auto_780613 ?auto_780615 ) ) ( not ( = ?auto_780613 ?auto_780616 ) ) ( not ( = ?auto_780613 ?auto_780617 ) ) ( not ( = ?auto_780613 ?auto_780618 ) ) ( not ( = ?auto_780613 ?auto_780619 ) ) ( not ( = ?auto_780613 ?auto_780620 ) ) ( not ( = ?auto_780613 ?auto_780621 ) ) ( not ( = ?auto_780613 ?auto_780622 ) ) ( not ( = ?auto_780613 ?auto_780623 ) ) ( not ( = ?auto_780613 ?auto_780624 ) ) ( not ( = ?auto_780613 ?auto_780625 ) ) ( not ( = ?auto_780613 ?auto_780626 ) ) ( not ( = ?auto_780613 ?auto_780627 ) ) ( not ( = ?auto_780613 ?auto_780628 ) ) ( not ( = ?auto_780614 ?auto_780615 ) ) ( not ( = ?auto_780614 ?auto_780616 ) ) ( not ( = ?auto_780614 ?auto_780617 ) ) ( not ( = ?auto_780614 ?auto_780618 ) ) ( not ( = ?auto_780614 ?auto_780619 ) ) ( not ( = ?auto_780614 ?auto_780620 ) ) ( not ( = ?auto_780614 ?auto_780621 ) ) ( not ( = ?auto_780614 ?auto_780622 ) ) ( not ( = ?auto_780614 ?auto_780623 ) ) ( not ( = ?auto_780614 ?auto_780624 ) ) ( not ( = ?auto_780614 ?auto_780625 ) ) ( not ( = ?auto_780614 ?auto_780626 ) ) ( not ( = ?auto_780614 ?auto_780627 ) ) ( not ( = ?auto_780614 ?auto_780628 ) ) ( not ( = ?auto_780615 ?auto_780616 ) ) ( not ( = ?auto_780615 ?auto_780617 ) ) ( not ( = ?auto_780615 ?auto_780618 ) ) ( not ( = ?auto_780615 ?auto_780619 ) ) ( not ( = ?auto_780615 ?auto_780620 ) ) ( not ( = ?auto_780615 ?auto_780621 ) ) ( not ( = ?auto_780615 ?auto_780622 ) ) ( not ( = ?auto_780615 ?auto_780623 ) ) ( not ( = ?auto_780615 ?auto_780624 ) ) ( not ( = ?auto_780615 ?auto_780625 ) ) ( not ( = ?auto_780615 ?auto_780626 ) ) ( not ( = ?auto_780615 ?auto_780627 ) ) ( not ( = ?auto_780615 ?auto_780628 ) ) ( not ( = ?auto_780616 ?auto_780617 ) ) ( not ( = ?auto_780616 ?auto_780618 ) ) ( not ( = ?auto_780616 ?auto_780619 ) ) ( not ( = ?auto_780616 ?auto_780620 ) ) ( not ( = ?auto_780616 ?auto_780621 ) ) ( not ( = ?auto_780616 ?auto_780622 ) ) ( not ( = ?auto_780616 ?auto_780623 ) ) ( not ( = ?auto_780616 ?auto_780624 ) ) ( not ( = ?auto_780616 ?auto_780625 ) ) ( not ( = ?auto_780616 ?auto_780626 ) ) ( not ( = ?auto_780616 ?auto_780627 ) ) ( not ( = ?auto_780616 ?auto_780628 ) ) ( not ( = ?auto_780617 ?auto_780618 ) ) ( not ( = ?auto_780617 ?auto_780619 ) ) ( not ( = ?auto_780617 ?auto_780620 ) ) ( not ( = ?auto_780617 ?auto_780621 ) ) ( not ( = ?auto_780617 ?auto_780622 ) ) ( not ( = ?auto_780617 ?auto_780623 ) ) ( not ( = ?auto_780617 ?auto_780624 ) ) ( not ( = ?auto_780617 ?auto_780625 ) ) ( not ( = ?auto_780617 ?auto_780626 ) ) ( not ( = ?auto_780617 ?auto_780627 ) ) ( not ( = ?auto_780617 ?auto_780628 ) ) ( not ( = ?auto_780618 ?auto_780619 ) ) ( not ( = ?auto_780618 ?auto_780620 ) ) ( not ( = ?auto_780618 ?auto_780621 ) ) ( not ( = ?auto_780618 ?auto_780622 ) ) ( not ( = ?auto_780618 ?auto_780623 ) ) ( not ( = ?auto_780618 ?auto_780624 ) ) ( not ( = ?auto_780618 ?auto_780625 ) ) ( not ( = ?auto_780618 ?auto_780626 ) ) ( not ( = ?auto_780618 ?auto_780627 ) ) ( not ( = ?auto_780618 ?auto_780628 ) ) ( not ( = ?auto_780619 ?auto_780620 ) ) ( not ( = ?auto_780619 ?auto_780621 ) ) ( not ( = ?auto_780619 ?auto_780622 ) ) ( not ( = ?auto_780619 ?auto_780623 ) ) ( not ( = ?auto_780619 ?auto_780624 ) ) ( not ( = ?auto_780619 ?auto_780625 ) ) ( not ( = ?auto_780619 ?auto_780626 ) ) ( not ( = ?auto_780619 ?auto_780627 ) ) ( not ( = ?auto_780619 ?auto_780628 ) ) ( not ( = ?auto_780620 ?auto_780621 ) ) ( not ( = ?auto_780620 ?auto_780622 ) ) ( not ( = ?auto_780620 ?auto_780623 ) ) ( not ( = ?auto_780620 ?auto_780624 ) ) ( not ( = ?auto_780620 ?auto_780625 ) ) ( not ( = ?auto_780620 ?auto_780626 ) ) ( not ( = ?auto_780620 ?auto_780627 ) ) ( not ( = ?auto_780620 ?auto_780628 ) ) ( not ( = ?auto_780621 ?auto_780622 ) ) ( not ( = ?auto_780621 ?auto_780623 ) ) ( not ( = ?auto_780621 ?auto_780624 ) ) ( not ( = ?auto_780621 ?auto_780625 ) ) ( not ( = ?auto_780621 ?auto_780626 ) ) ( not ( = ?auto_780621 ?auto_780627 ) ) ( not ( = ?auto_780621 ?auto_780628 ) ) ( not ( = ?auto_780622 ?auto_780623 ) ) ( not ( = ?auto_780622 ?auto_780624 ) ) ( not ( = ?auto_780622 ?auto_780625 ) ) ( not ( = ?auto_780622 ?auto_780626 ) ) ( not ( = ?auto_780622 ?auto_780627 ) ) ( not ( = ?auto_780622 ?auto_780628 ) ) ( not ( = ?auto_780623 ?auto_780624 ) ) ( not ( = ?auto_780623 ?auto_780625 ) ) ( not ( = ?auto_780623 ?auto_780626 ) ) ( not ( = ?auto_780623 ?auto_780627 ) ) ( not ( = ?auto_780623 ?auto_780628 ) ) ( not ( = ?auto_780624 ?auto_780625 ) ) ( not ( = ?auto_780624 ?auto_780626 ) ) ( not ( = ?auto_780624 ?auto_780627 ) ) ( not ( = ?auto_780624 ?auto_780628 ) ) ( not ( = ?auto_780625 ?auto_780626 ) ) ( not ( = ?auto_780625 ?auto_780627 ) ) ( not ( = ?auto_780625 ?auto_780628 ) ) ( not ( = ?auto_780626 ?auto_780627 ) ) ( not ( = ?auto_780626 ?auto_780628 ) ) ( not ( = ?auto_780627 ?auto_780628 ) ) ( ON ?auto_780626 ?auto_780627 ) ( ON ?auto_780625 ?auto_780626 ) ( ON ?auto_780624 ?auto_780625 ) ( ON ?auto_780623 ?auto_780624 ) ( ON ?auto_780622 ?auto_780623 ) ( ON ?auto_780621 ?auto_780622 ) ( ON ?auto_780620 ?auto_780621 ) ( CLEAR ?auto_780618 ) ( ON ?auto_780619 ?auto_780620 ) ( CLEAR ?auto_780619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_780612 ?auto_780613 ?auto_780614 ?auto_780615 ?auto_780616 ?auto_780617 ?auto_780618 ?auto_780619 )
      ( MAKE-16PILE ?auto_780612 ?auto_780613 ?auto_780614 ?auto_780615 ?auto_780616 ?auto_780617 ?auto_780618 ?auto_780619 ?auto_780620 ?auto_780621 ?auto_780622 ?auto_780623 ?auto_780624 ?auto_780625 ?auto_780626 ?auto_780627 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_780678 - BLOCK
      ?auto_780679 - BLOCK
      ?auto_780680 - BLOCK
      ?auto_780681 - BLOCK
      ?auto_780682 - BLOCK
      ?auto_780683 - BLOCK
      ?auto_780684 - BLOCK
      ?auto_780685 - BLOCK
      ?auto_780686 - BLOCK
      ?auto_780687 - BLOCK
      ?auto_780688 - BLOCK
      ?auto_780689 - BLOCK
      ?auto_780690 - BLOCK
      ?auto_780691 - BLOCK
      ?auto_780692 - BLOCK
      ?auto_780693 - BLOCK
    )
    :vars
    (
      ?auto_780694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_780693 ?auto_780694 ) ( ON-TABLE ?auto_780678 ) ( ON ?auto_780679 ?auto_780678 ) ( ON ?auto_780680 ?auto_780679 ) ( ON ?auto_780681 ?auto_780680 ) ( ON ?auto_780682 ?auto_780681 ) ( ON ?auto_780683 ?auto_780682 ) ( not ( = ?auto_780678 ?auto_780679 ) ) ( not ( = ?auto_780678 ?auto_780680 ) ) ( not ( = ?auto_780678 ?auto_780681 ) ) ( not ( = ?auto_780678 ?auto_780682 ) ) ( not ( = ?auto_780678 ?auto_780683 ) ) ( not ( = ?auto_780678 ?auto_780684 ) ) ( not ( = ?auto_780678 ?auto_780685 ) ) ( not ( = ?auto_780678 ?auto_780686 ) ) ( not ( = ?auto_780678 ?auto_780687 ) ) ( not ( = ?auto_780678 ?auto_780688 ) ) ( not ( = ?auto_780678 ?auto_780689 ) ) ( not ( = ?auto_780678 ?auto_780690 ) ) ( not ( = ?auto_780678 ?auto_780691 ) ) ( not ( = ?auto_780678 ?auto_780692 ) ) ( not ( = ?auto_780678 ?auto_780693 ) ) ( not ( = ?auto_780678 ?auto_780694 ) ) ( not ( = ?auto_780679 ?auto_780680 ) ) ( not ( = ?auto_780679 ?auto_780681 ) ) ( not ( = ?auto_780679 ?auto_780682 ) ) ( not ( = ?auto_780679 ?auto_780683 ) ) ( not ( = ?auto_780679 ?auto_780684 ) ) ( not ( = ?auto_780679 ?auto_780685 ) ) ( not ( = ?auto_780679 ?auto_780686 ) ) ( not ( = ?auto_780679 ?auto_780687 ) ) ( not ( = ?auto_780679 ?auto_780688 ) ) ( not ( = ?auto_780679 ?auto_780689 ) ) ( not ( = ?auto_780679 ?auto_780690 ) ) ( not ( = ?auto_780679 ?auto_780691 ) ) ( not ( = ?auto_780679 ?auto_780692 ) ) ( not ( = ?auto_780679 ?auto_780693 ) ) ( not ( = ?auto_780679 ?auto_780694 ) ) ( not ( = ?auto_780680 ?auto_780681 ) ) ( not ( = ?auto_780680 ?auto_780682 ) ) ( not ( = ?auto_780680 ?auto_780683 ) ) ( not ( = ?auto_780680 ?auto_780684 ) ) ( not ( = ?auto_780680 ?auto_780685 ) ) ( not ( = ?auto_780680 ?auto_780686 ) ) ( not ( = ?auto_780680 ?auto_780687 ) ) ( not ( = ?auto_780680 ?auto_780688 ) ) ( not ( = ?auto_780680 ?auto_780689 ) ) ( not ( = ?auto_780680 ?auto_780690 ) ) ( not ( = ?auto_780680 ?auto_780691 ) ) ( not ( = ?auto_780680 ?auto_780692 ) ) ( not ( = ?auto_780680 ?auto_780693 ) ) ( not ( = ?auto_780680 ?auto_780694 ) ) ( not ( = ?auto_780681 ?auto_780682 ) ) ( not ( = ?auto_780681 ?auto_780683 ) ) ( not ( = ?auto_780681 ?auto_780684 ) ) ( not ( = ?auto_780681 ?auto_780685 ) ) ( not ( = ?auto_780681 ?auto_780686 ) ) ( not ( = ?auto_780681 ?auto_780687 ) ) ( not ( = ?auto_780681 ?auto_780688 ) ) ( not ( = ?auto_780681 ?auto_780689 ) ) ( not ( = ?auto_780681 ?auto_780690 ) ) ( not ( = ?auto_780681 ?auto_780691 ) ) ( not ( = ?auto_780681 ?auto_780692 ) ) ( not ( = ?auto_780681 ?auto_780693 ) ) ( not ( = ?auto_780681 ?auto_780694 ) ) ( not ( = ?auto_780682 ?auto_780683 ) ) ( not ( = ?auto_780682 ?auto_780684 ) ) ( not ( = ?auto_780682 ?auto_780685 ) ) ( not ( = ?auto_780682 ?auto_780686 ) ) ( not ( = ?auto_780682 ?auto_780687 ) ) ( not ( = ?auto_780682 ?auto_780688 ) ) ( not ( = ?auto_780682 ?auto_780689 ) ) ( not ( = ?auto_780682 ?auto_780690 ) ) ( not ( = ?auto_780682 ?auto_780691 ) ) ( not ( = ?auto_780682 ?auto_780692 ) ) ( not ( = ?auto_780682 ?auto_780693 ) ) ( not ( = ?auto_780682 ?auto_780694 ) ) ( not ( = ?auto_780683 ?auto_780684 ) ) ( not ( = ?auto_780683 ?auto_780685 ) ) ( not ( = ?auto_780683 ?auto_780686 ) ) ( not ( = ?auto_780683 ?auto_780687 ) ) ( not ( = ?auto_780683 ?auto_780688 ) ) ( not ( = ?auto_780683 ?auto_780689 ) ) ( not ( = ?auto_780683 ?auto_780690 ) ) ( not ( = ?auto_780683 ?auto_780691 ) ) ( not ( = ?auto_780683 ?auto_780692 ) ) ( not ( = ?auto_780683 ?auto_780693 ) ) ( not ( = ?auto_780683 ?auto_780694 ) ) ( not ( = ?auto_780684 ?auto_780685 ) ) ( not ( = ?auto_780684 ?auto_780686 ) ) ( not ( = ?auto_780684 ?auto_780687 ) ) ( not ( = ?auto_780684 ?auto_780688 ) ) ( not ( = ?auto_780684 ?auto_780689 ) ) ( not ( = ?auto_780684 ?auto_780690 ) ) ( not ( = ?auto_780684 ?auto_780691 ) ) ( not ( = ?auto_780684 ?auto_780692 ) ) ( not ( = ?auto_780684 ?auto_780693 ) ) ( not ( = ?auto_780684 ?auto_780694 ) ) ( not ( = ?auto_780685 ?auto_780686 ) ) ( not ( = ?auto_780685 ?auto_780687 ) ) ( not ( = ?auto_780685 ?auto_780688 ) ) ( not ( = ?auto_780685 ?auto_780689 ) ) ( not ( = ?auto_780685 ?auto_780690 ) ) ( not ( = ?auto_780685 ?auto_780691 ) ) ( not ( = ?auto_780685 ?auto_780692 ) ) ( not ( = ?auto_780685 ?auto_780693 ) ) ( not ( = ?auto_780685 ?auto_780694 ) ) ( not ( = ?auto_780686 ?auto_780687 ) ) ( not ( = ?auto_780686 ?auto_780688 ) ) ( not ( = ?auto_780686 ?auto_780689 ) ) ( not ( = ?auto_780686 ?auto_780690 ) ) ( not ( = ?auto_780686 ?auto_780691 ) ) ( not ( = ?auto_780686 ?auto_780692 ) ) ( not ( = ?auto_780686 ?auto_780693 ) ) ( not ( = ?auto_780686 ?auto_780694 ) ) ( not ( = ?auto_780687 ?auto_780688 ) ) ( not ( = ?auto_780687 ?auto_780689 ) ) ( not ( = ?auto_780687 ?auto_780690 ) ) ( not ( = ?auto_780687 ?auto_780691 ) ) ( not ( = ?auto_780687 ?auto_780692 ) ) ( not ( = ?auto_780687 ?auto_780693 ) ) ( not ( = ?auto_780687 ?auto_780694 ) ) ( not ( = ?auto_780688 ?auto_780689 ) ) ( not ( = ?auto_780688 ?auto_780690 ) ) ( not ( = ?auto_780688 ?auto_780691 ) ) ( not ( = ?auto_780688 ?auto_780692 ) ) ( not ( = ?auto_780688 ?auto_780693 ) ) ( not ( = ?auto_780688 ?auto_780694 ) ) ( not ( = ?auto_780689 ?auto_780690 ) ) ( not ( = ?auto_780689 ?auto_780691 ) ) ( not ( = ?auto_780689 ?auto_780692 ) ) ( not ( = ?auto_780689 ?auto_780693 ) ) ( not ( = ?auto_780689 ?auto_780694 ) ) ( not ( = ?auto_780690 ?auto_780691 ) ) ( not ( = ?auto_780690 ?auto_780692 ) ) ( not ( = ?auto_780690 ?auto_780693 ) ) ( not ( = ?auto_780690 ?auto_780694 ) ) ( not ( = ?auto_780691 ?auto_780692 ) ) ( not ( = ?auto_780691 ?auto_780693 ) ) ( not ( = ?auto_780691 ?auto_780694 ) ) ( not ( = ?auto_780692 ?auto_780693 ) ) ( not ( = ?auto_780692 ?auto_780694 ) ) ( not ( = ?auto_780693 ?auto_780694 ) ) ( ON ?auto_780692 ?auto_780693 ) ( ON ?auto_780691 ?auto_780692 ) ( ON ?auto_780690 ?auto_780691 ) ( ON ?auto_780689 ?auto_780690 ) ( ON ?auto_780688 ?auto_780689 ) ( ON ?auto_780687 ?auto_780688 ) ( ON ?auto_780686 ?auto_780687 ) ( ON ?auto_780685 ?auto_780686 ) ( CLEAR ?auto_780683 ) ( ON ?auto_780684 ?auto_780685 ) ( CLEAR ?auto_780684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_780678 ?auto_780679 ?auto_780680 ?auto_780681 ?auto_780682 ?auto_780683 ?auto_780684 )
      ( MAKE-16PILE ?auto_780678 ?auto_780679 ?auto_780680 ?auto_780681 ?auto_780682 ?auto_780683 ?auto_780684 ?auto_780685 ?auto_780686 ?auto_780687 ?auto_780688 ?auto_780689 ?auto_780690 ?auto_780691 ?auto_780692 ?auto_780693 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_780744 - BLOCK
      ?auto_780745 - BLOCK
      ?auto_780746 - BLOCK
      ?auto_780747 - BLOCK
      ?auto_780748 - BLOCK
      ?auto_780749 - BLOCK
      ?auto_780750 - BLOCK
      ?auto_780751 - BLOCK
      ?auto_780752 - BLOCK
      ?auto_780753 - BLOCK
      ?auto_780754 - BLOCK
      ?auto_780755 - BLOCK
      ?auto_780756 - BLOCK
      ?auto_780757 - BLOCK
      ?auto_780758 - BLOCK
      ?auto_780759 - BLOCK
    )
    :vars
    (
      ?auto_780760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_780759 ?auto_780760 ) ( ON-TABLE ?auto_780744 ) ( ON ?auto_780745 ?auto_780744 ) ( ON ?auto_780746 ?auto_780745 ) ( ON ?auto_780747 ?auto_780746 ) ( ON ?auto_780748 ?auto_780747 ) ( not ( = ?auto_780744 ?auto_780745 ) ) ( not ( = ?auto_780744 ?auto_780746 ) ) ( not ( = ?auto_780744 ?auto_780747 ) ) ( not ( = ?auto_780744 ?auto_780748 ) ) ( not ( = ?auto_780744 ?auto_780749 ) ) ( not ( = ?auto_780744 ?auto_780750 ) ) ( not ( = ?auto_780744 ?auto_780751 ) ) ( not ( = ?auto_780744 ?auto_780752 ) ) ( not ( = ?auto_780744 ?auto_780753 ) ) ( not ( = ?auto_780744 ?auto_780754 ) ) ( not ( = ?auto_780744 ?auto_780755 ) ) ( not ( = ?auto_780744 ?auto_780756 ) ) ( not ( = ?auto_780744 ?auto_780757 ) ) ( not ( = ?auto_780744 ?auto_780758 ) ) ( not ( = ?auto_780744 ?auto_780759 ) ) ( not ( = ?auto_780744 ?auto_780760 ) ) ( not ( = ?auto_780745 ?auto_780746 ) ) ( not ( = ?auto_780745 ?auto_780747 ) ) ( not ( = ?auto_780745 ?auto_780748 ) ) ( not ( = ?auto_780745 ?auto_780749 ) ) ( not ( = ?auto_780745 ?auto_780750 ) ) ( not ( = ?auto_780745 ?auto_780751 ) ) ( not ( = ?auto_780745 ?auto_780752 ) ) ( not ( = ?auto_780745 ?auto_780753 ) ) ( not ( = ?auto_780745 ?auto_780754 ) ) ( not ( = ?auto_780745 ?auto_780755 ) ) ( not ( = ?auto_780745 ?auto_780756 ) ) ( not ( = ?auto_780745 ?auto_780757 ) ) ( not ( = ?auto_780745 ?auto_780758 ) ) ( not ( = ?auto_780745 ?auto_780759 ) ) ( not ( = ?auto_780745 ?auto_780760 ) ) ( not ( = ?auto_780746 ?auto_780747 ) ) ( not ( = ?auto_780746 ?auto_780748 ) ) ( not ( = ?auto_780746 ?auto_780749 ) ) ( not ( = ?auto_780746 ?auto_780750 ) ) ( not ( = ?auto_780746 ?auto_780751 ) ) ( not ( = ?auto_780746 ?auto_780752 ) ) ( not ( = ?auto_780746 ?auto_780753 ) ) ( not ( = ?auto_780746 ?auto_780754 ) ) ( not ( = ?auto_780746 ?auto_780755 ) ) ( not ( = ?auto_780746 ?auto_780756 ) ) ( not ( = ?auto_780746 ?auto_780757 ) ) ( not ( = ?auto_780746 ?auto_780758 ) ) ( not ( = ?auto_780746 ?auto_780759 ) ) ( not ( = ?auto_780746 ?auto_780760 ) ) ( not ( = ?auto_780747 ?auto_780748 ) ) ( not ( = ?auto_780747 ?auto_780749 ) ) ( not ( = ?auto_780747 ?auto_780750 ) ) ( not ( = ?auto_780747 ?auto_780751 ) ) ( not ( = ?auto_780747 ?auto_780752 ) ) ( not ( = ?auto_780747 ?auto_780753 ) ) ( not ( = ?auto_780747 ?auto_780754 ) ) ( not ( = ?auto_780747 ?auto_780755 ) ) ( not ( = ?auto_780747 ?auto_780756 ) ) ( not ( = ?auto_780747 ?auto_780757 ) ) ( not ( = ?auto_780747 ?auto_780758 ) ) ( not ( = ?auto_780747 ?auto_780759 ) ) ( not ( = ?auto_780747 ?auto_780760 ) ) ( not ( = ?auto_780748 ?auto_780749 ) ) ( not ( = ?auto_780748 ?auto_780750 ) ) ( not ( = ?auto_780748 ?auto_780751 ) ) ( not ( = ?auto_780748 ?auto_780752 ) ) ( not ( = ?auto_780748 ?auto_780753 ) ) ( not ( = ?auto_780748 ?auto_780754 ) ) ( not ( = ?auto_780748 ?auto_780755 ) ) ( not ( = ?auto_780748 ?auto_780756 ) ) ( not ( = ?auto_780748 ?auto_780757 ) ) ( not ( = ?auto_780748 ?auto_780758 ) ) ( not ( = ?auto_780748 ?auto_780759 ) ) ( not ( = ?auto_780748 ?auto_780760 ) ) ( not ( = ?auto_780749 ?auto_780750 ) ) ( not ( = ?auto_780749 ?auto_780751 ) ) ( not ( = ?auto_780749 ?auto_780752 ) ) ( not ( = ?auto_780749 ?auto_780753 ) ) ( not ( = ?auto_780749 ?auto_780754 ) ) ( not ( = ?auto_780749 ?auto_780755 ) ) ( not ( = ?auto_780749 ?auto_780756 ) ) ( not ( = ?auto_780749 ?auto_780757 ) ) ( not ( = ?auto_780749 ?auto_780758 ) ) ( not ( = ?auto_780749 ?auto_780759 ) ) ( not ( = ?auto_780749 ?auto_780760 ) ) ( not ( = ?auto_780750 ?auto_780751 ) ) ( not ( = ?auto_780750 ?auto_780752 ) ) ( not ( = ?auto_780750 ?auto_780753 ) ) ( not ( = ?auto_780750 ?auto_780754 ) ) ( not ( = ?auto_780750 ?auto_780755 ) ) ( not ( = ?auto_780750 ?auto_780756 ) ) ( not ( = ?auto_780750 ?auto_780757 ) ) ( not ( = ?auto_780750 ?auto_780758 ) ) ( not ( = ?auto_780750 ?auto_780759 ) ) ( not ( = ?auto_780750 ?auto_780760 ) ) ( not ( = ?auto_780751 ?auto_780752 ) ) ( not ( = ?auto_780751 ?auto_780753 ) ) ( not ( = ?auto_780751 ?auto_780754 ) ) ( not ( = ?auto_780751 ?auto_780755 ) ) ( not ( = ?auto_780751 ?auto_780756 ) ) ( not ( = ?auto_780751 ?auto_780757 ) ) ( not ( = ?auto_780751 ?auto_780758 ) ) ( not ( = ?auto_780751 ?auto_780759 ) ) ( not ( = ?auto_780751 ?auto_780760 ) ) ( not ( = ?auto_780752 ?auto_780753 ) ) ( not ( = ?auto_780752 ?auto_780754 ) ) ( not ( = ?auto_780752 ?auto_780755 ) ) ( not ( = ?auto_780752 ?auto_780756 ) ) ( not ( = ?auto_780752 ?auto_780757 ) ) ( not ( = ?auto_780752 ?auto_780758 ) ) ( not ( = ?auto_780752 ?auto_780759 ) ) ( not ( = ?auto_780752 ?auto_780760 ) ) ( not ( = ?auto_780753 ?auto_780754 ) ) ( not ( = ?auto_780753 ?auto_780755 ) ) ( not ( = ?auto_780753 ?auto_780756 ) ) ( not ( = ?auto_780753 ?auto_780757 ) ) ( not ( = ?auto_780753 ?auto_780758 ) ) ( not ( = ?auto_780753 ?auto_780759 ) ) ( not ( = ?auto_780753 ?auto_780760 ) ) ( not ( = ?auto_780754 ?auto_780755 ) ) ( not ( = ?auto_780754 ?auto_780756 ) ) ( not ( = ?auto_780754 ?auto_780757 ) ) ( not ( = ?auto_780754 ?auto_780758 ) ) ( not ( = ?auto_780754 ?auto_780759 ) ) ( not ( = ?auto_780754 ?auto_780760 ) ) ( not ( = ?auto_780755 ?auto_780756 ) ) ( not ( = ?auto_780755 ?auto_780757 ) ) ( not ( = ?auto_780755 ?auto_780758 ) ) ( not ( = ?auto_780755 ?auto_780759 ) ) ( not ( = ?auto_780755 ?auto_780760 ) ) ( not ( = ?auto_780756 ?auto_780757 ) ) ( not ( = ?auto_780756 ?auto_780758 ) ) ( not ( = ?auto_780756 ?auto_780759 ) ) ( not ( = ?auto_780756 ?auto_780760 ) ) ( not ( = ?auto_780757 ?auto_780758 ) ) ( not ( = ?auto_780757 ?auto_780759 ) ) ( not ( = ?auto_780757 ?auto_780760 ) ) ( not ( = ?auto_780758 ?auto_780759 ) ) ( not ( = ?auto_780758 ?auto_780760 ) ) ( not ( = ?auto_780759 ?auto_780760 ) ) ( ON ?auto_780758 ?auto_780759 ) ( ON ?auto_780757 ?auto_780758 ) ( ON ?auto_780756 ?auto_780757 ) ( ON ?auto_780755 ?auto_780756 ) ( ON ?auto_780754 ?auto_780755 ) ( ON ?auto_780753 ?auto_780754 ) ( ON ?auto_780752 ?auto_780753 ) ( ON ?auto_780751 ?auto_780752 ) ( ON ?auto_780750 ?auto_780751 ) ( CLEAR ?auto_780748 ) ( ON ?auto_780749 ?auto_780750 ) ( CLEAR ?auto_780749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_780744 ?auto_780745 ?auto_780746 ?auto_780747 ?auto_780748 ?auto_780749 )
      ( MAKE-16PILE ?auto_780744 ?auto_780745 ?auto_780746 ?auto_780747 ?auto_780748 ?auto_780749 ?auto_780750 ?auto_780751 ?auto_780752 ?auto_780753 ?auto_780754 ?auto_780755 ?auto_780756 ?auto_780757 ?auto_780758 ?auto_780759 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_780810 - BLOCK
      ?auto_780811 - BLOCK
      ?auto_780812 - BLOCK
      ?auto_780813 - BLOCK
      ?auto_780814 - BLOCK
      ?auto_780815 - BLOCK
      ?auto_780816 - BLOCK
      ?auto_780817 - BLOCK
      ?auto_780818 - BLOCK
      ?auto_780819 - BLOCK
      ?auto_780820 - BLOCK
      ?auto_780821 - BLOCK
      ?auto_780822 - BLOCK
      ?auto_780823 - BLOCK
      ?auto_780824 - BLOCK
      ?auto_780825 - BLOCK
    )
    :vars
    (
      ?auto_780826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_780825 ?auto_780826 ) ( ON-TABLE ?auto_780810 ) ( ON ?auto_780811 ?auto_780810 ) ( ON ?auto_780812 ?auto_780811 ) ( ON ?auto_780813 ?auto_780812 ) ( not ( = ?auto_780810 ?auto_780811 ) ) ( not ( = ?auto_780810 ?auto_780812 ) ) ( not ( = ?auto_780810 ?auto_780813 ) ) ( not ( = ?auto_780810 ?auto_780814 ) ) ( not ( = ?auto_780810 ?auto_780815 ) ) ( not ( = ?auto_780810 ?auto_780816 ) ) ( not ( = ?auto_780810 ?auto_780817 ) ) ( not ( = ?auto_780810 ?auto_780818 ) ) ( not ( = ?auto_780810 ?auto_780819 ) ) ( not ( = ?auto_780810 ?auto_780820 ) ) ( not ( = ?auto_780810 ?auto_780821 ) ) ( not ( = ?auto_780810 ?auto_780822 ) ) ( not ( = ?auto_780810 ?auto_780823 ) ) ( not ( = ?auto_780810 ?auto_780824 ) ) ( not ( = ?auto_780810 ?auto_780825 ) ) ( not ( = ?auto_780810 ?auto_780826 ) ) ( not ( = ?auto_780811 ?auto_780812 ) ) ( not ( = ?auto_780811 ?auto_780813 ) ) ( not ( = ?auto_780811 ?auto_780814 ) ) ( not ( = ?auto_780811 ?auto_780815 ) ) ( not ( = ?auto_780811 ?auto_780816 ) ) ( not ( = ?auto_780811 ?auto_780817 ) ) ( not ( = ?auto_780811 ?auto_780818 ) ) ( not ( = ?auto_780811 ?auto_780819 ) ) ( not ( = ?auto_780811 ?auto_780820 ) ) ( not ( = ?auto_780811 ?auto_780821 ) ) ( not ( = ?auto_780811 ?auto_780822 ) ) ( not ( = ?auto_780811 ?auto_780823 ) ) ( not ( = ?auto_780811 ?auto_780824 ) ) ( not ( = ?auto_780811 ?auto_780825 ) ) ( not ( = ?auto_780811 ?auto_780826 ) ) ( not ( = ?auto_780812 ?auto_780813 ) ) ( not ( = ?auto_780812 ?auto_780814 ) ) ( not ( = ?auto_780812 ?auto_780815 ) ) ( not ( = ?auto_780812 ?auto_780816 ) ) ( not ( = ?auto_780812 ?auto_780817 ) ) ( not ( = ?auto_780812 ?auto_780818 ) ) ( not ( = ?auto_780812 ?auto_780819 ) ) ( not ( = ?auto_780812 ?auto_780820 ) ) ( not ( = ?auto_780812 ?auto_780821 ) ) ( not ( = ?auto_780812 ?auto_780822 ) ) ( not ( = ?auto_780812 ?auto_780823 ) ) ( not ( = ?auto_780812 ?auto_780824 ) ) ( not ( = ?auto_780812 ?auto_780825 ) ) ( not ( = ?auto_780812 ?auto_780826 ) ) ( not ( = ?auto_780813 ?auto_780814 ) ) ( not ( = ?auto_780813 ?auto_780815 ) ) ( not ( = ?auto_780813 ?auto_780816 ) ) ( not ( = ?auto_780813 ?auto_780817 ) ) ( not ( = ?auto_780813 ?auto_780818 ) ) ( not ( = ?auto_780813 ?auto_780819 ) ) ( not ( = ?auto_780813 ?auto_780820 ) ) ( not ( = ?auto_780813 ?auto_780821 ) ) ( not ( = ?auto_780813 ?auto_780822 ) ) ( not ( = ?auto_780813 ?auto_780823 ) ) ( not ( = ?auto_780813 ?auto_780824 ) ) ( not ( = ?auto_780813 ?auto_780825 ) ) ( not ( = ?auto_780813 ?auto_780826 ) ) ( not ( = ?auto_780814 ?auto_780815 ) ) ( not ( = ?auto_780814 ?auto_780816 ) ) ( not ( = ?auto_780814 ?auto_780817 ) ) ( not ( = ?auto_780814 ?auto_780818 ) ) ( not ( = ?auto_780814 ?auto_780819 ) ) ( not ( = ?auto_780814 ?auto_780820 ) ) ( not ( = ?auto_780814 ?auto_780821 ) ) ( not ( = ?auto_780814 ?auto_780822 ) ) ( not ( = ?auto_780814 ?auto_780823 ) ) ( not ( = ?auto_780814 ?auto_780824 ) ) ( not ( = ?auto_780814 ?auto_780825 ) ) ( not ( = ?auto_780814 ?auto_780826 ) ) ( not ( = ?auto_780815 ?auto_780816 ) ) ( not ( = ?auto_780815 ?auto_780817 ) ) ( not ( = ?auto_780815 ?auto_780818 ) ) ( not ( = ?auto_780815 ?auto_780819 ) ) ( not ( = ?auto_780815 ?auto_780820 ) ) ( not ( = ?auto_780815 ?auto_780821 ) ) ( not ( = ?auto_780815 ?auto_780822 ) ) ( not ( = ?auto_780815 ?auto_780823 ) ) ( not ( = ?auto_780815 ?auto_780824 ) ) ( not ( = ?auto_780815 ?auto_780825 ) ) ( not ( = ?auto_780815 ?auto_780826 ) ) ( not ( = ?auto_780816 ?auto_780817 ) ) ( not ( = ?auto_780816 ?auto_780818 ) ) ( not ( = ?auto_780816 ?auto_780819 ) ) ( not ( = ?auto_780816 ?auto_780820 ) ) ( not ( = ?auto_780816 ?auto_780821 ) ) ( not ( = ?auto_780816 ?auto_780822 ) ) ( not ( = ?auto_780816 ?auto_780823 ) ) ( not ( = ?auto_780816 ?auto_780824 ) ) ( not ( = ?auto_780816 ?auto_780825 ) ) ( not ( = ?auto_780816 ?auto_780826 ) ) ( not ( = ?auto_780817 ?auto_780818 ) ) ( not ( = ?auto_780817 ?auto_780819 ) ) ( not ( = ?auto_780817 ?auto_780820 ) ) ( not ( = ?auto_780817 ?auto_780821 ) ) ( not ( = ?auto_780817 ?auto_780822 ) ) ( not ( = ?auto_780817 ?auto_780823 ) ) ( not ( = ?auto_780817 ?auto_780824 ) ) ( not ( = ?auto_780817 ?auto_780825 ) ) ( not ( = ?auto_780817 ?auto_780826 ) ) ( not ( = ?auto_780818 ?auto_780819 ) ) ( not ( = ?auto_780818 ?auto_780820 ) ) ( not ( = ?auto_780818 ?auto_780821 ) ) ( not ( = ?auto_780818 ?auto_780822 ) ) ( not ( = ?auto_780818 ?auto_780823 ) ) ( not ( = ?auto_780818 ?auto_780824 ) ) ( not ( = ?auto_780818 ?auto_780825 ) ) ( not ( = ?auto_780818 ?auto_780826 ) ) ( not ( = ?auto_780819 ?auto_780820 ) ) ( not ( = ?auto_780819 ?auto_780821 ) ) ( not ( = ?auto_780819 ?auto_780822 ) ) ( not ( = ?auto_780819 ?auto_780823 ) ) ( not ( = ?auto_780819 ?auto_780824 ) ) ( not ( = ?auto_780819 ?auto_780825 ) ) ( not ( = ?auto_780819 ?auto_780826 ) ) ( not ( = ?auto_780820 ?auto_780821 ) ) ( not ( = ?auto_780820 ?auto_780822 ) ) ( not ( = ?auto_780820 ?auto_780823 ) ) ( not ( = ?auto_780820 ?auto_780824 ) ) ( not ( = ?auto_780820 ?auto_780825 ) ) ( not ( = ?auto_780820 ?auto_780826 ) ) ( not ( = ?auto_780821 ?auto_780822 ) ) ( not ( = ?auto_780821 ?auto_780823 ) ) ( not ( = ?auto_780821 ?auto_780824 ) ) ( not ( = ?auto_780821 ?auto_780825 ) ) ( not ( = ?auto_780821 ?auto_780826 ) ) ( not ( = ?auto_780822 ?auto_780823 ) ) ( not ( = ?auto_780822 ?auto_780824 ) ) ( not ( = ?auto_780822 ?auto_780825 ) ) ( not ( = ?auto_780822 ?auto_780826 ) ) ( not ( = ?auto_780823 ?auto_780824 ) ) ( not ( = ?auto_780823 ?auto_780825 ) ) ( not ( = ?auto_780823 ?auto_780826 ) ) ( not ( = ?auto_780824 ?auto_780825 ) ) ( not ( = ?auto_780824 ?auto_780826 ) ) ( not ( = ?auto_780825 ?auto_780826 ) ) ( ON ?auto_780824 ?auto_780825 ) ( ON ?auto_780823 ?auto_780824 ) ( ON ?auto_780822 ?auto_780823 ) ( ON ?auto_780821 ?auto_780822 ) ( ON ?auto_780820 ?auto_780821 ) ( ON ?auto_780819 ?auto_780820 ) ( ON ?auto_780818 ?auto_780819 ) ( ON ?auto_780817 ?auto_780818 ) ( ON ?auto_780816 ?auto_780817 ) ( ON ?auto_780815 ?auto_780816 ) ( CLEAR ?auto_780813 ) ( ON ?auto_780814 ?auto_780815 ) ( CLEAR ?auto_780814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_780810 ?auto_780811 ?auto_780812 ?auto_780813 ?auto_780814 )
      ( MAKE-16PILE ?auto_780810 ?auto_780811 ?auto_780812 ?auto_780813 ?auto_780814 ?auto_780815 ?auto_780816 ?auto_780817 ?auto_780818 ?auto_780819 ?auto_780820 ?auto_780821 ?auto_780822 ?auto_780823 ?auto_780824 ?auto_780825 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_780876 - BLOCK
      ?auto_780877 - BLOCK
      ?auto_780878 - BLOCK
      ?auto_780879 - BLOCK
      ?auto_780880 - BLOCK
      ?auto_780881 - BLOCK
      ?auto_780882 - BLOCK
      ?auto_780883 - BLOCK
      ?auto_780884 - BLOCK
      ?auto_780885 - BLOCK
      ?auto_780886 - BLOCK
      ?auto_780887 - BLOCK
      ?auto_780888 - BLOCK
      ?auto_780889 - BLOCK
      ?auto_780890 - BLOCK
      ?auto_780891 - BLOCK
    )
    :vars
    (
      ?auto_780892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_780891 ?auto_780892 ) ( ON-TABLE ?auto_780876 ) ( ON ?auto_780877 ?auto_780876 ) ( ON ?auto_780878 ?auto_780877 ) ( not ( = ?auto_780876 ?auto_780877 ) ) ( not ( = ?auto_780876 ?auto_780878 ) ) ( not ( = ?auto_780876 ?auto_780879 ) ) ( not ( = ?auto_780876 ?auto_780880 ) ) ( not ( = ?auto_780876 ?auto_780881 ) ) ( not ( = ?auto_780876 ?auto_780882 ) ) ( not ( = ?auto_780876 ?auto_780883 ) ) ( not ( = ?auto_780876 ?auto_780884 ) ) ( not ( = ?auto_780876 ?auto_780885 ) ) ( not ( = ?auto_780876 ?auto_780886 ) ) ( not ( = ?auto_780876 ?auto_780887 ) ) ( not ( = ?auto_780876 ?auto_780888 ) ) ( not ( = ?auto_780876 ?auto_780889 ) ) ( not ( = ?auto_780876 ?auto_780890 ) ) ( not ( = ?auto_780876 ?auto_780891 ) ) ( not ( = ?auto_780876 ?auto_780892 ) ) ( not ( = ?auto_780877 ?auto_780878 ) ) ( not ( = ?auto_780877 ?auto_780879 ) ) ( not ( = ?auto_780877 ?auto_780880 ) ) ( not ( = ?auto_780877 ?auto_780881 ) ) ( not ( = ?auto_780877 ?auto_780882 ) ) ( not ( = ?auto_780877 ?auto_780883 ) ) ( not ( = ?auto_780877 ?auto_780884 ) ) ( not ( = ?auto_780877 ?auto_780885 ) ) ( not ( = ?auto_780877 ?auto_780886 ) ) ( not ( = ?auto_780877 ?auto_780887 ) ) ( not ( = ?auto_780877 ?auto_780888 ) ) ( not ( = ?auto_780877 ?auto_780889 ) ) ( not ( = ?auto_780877 ?auto_780890 ) ) ( not ( = ?auto_780877 ?auto_780891 ) ) ( not ( = ?auto_780877 ?auto_780892 ) ) ( not ( = ?auto_780878 ?auto_780879 ) ) ( not ( = ?auto_780878 ?auto_780880 ) ) ( not ( = ?auto_780878 ?auto_780881 ) ) ( not ( = ?auto_780878 ?auto_780882 ) ) ( not ( = ?auto_780878 ?auto_780883 ) ) ( not ( = ?auto_780878 ?auto_780884 ) ) ( not ( = ?auto_780878 ?auto_780885 ) ) ( not ( = ?auto_780878 ?auto_780886 ) ) ( not ( = ?auto_780878 ?auto_780887 ) ) ( not ( = ?auto_780878 ?auto_780888 ) ) ( not ( = ?auto_780878 ?auto_780889 ) ) ( not ( = ?auto_780878 ?auto_780890 ) ) ( not ( = ?auto_780878 ?auto_780891 ) ) ( not ( = ?auto_780878 ?auto_780892 ) ) ( not ( = ?auto_780879 ?auto_780880 ) ) ( not ( = ?auto_780879 ?auto_780881 ) ) ( not ( = ?auto_780879 ?auto_780882 ) ) ( not ( = ?auto_780879 ?auto_780883 ) ) ( not ( = ?auto_780879 ?auto_780884 ) ) ( not ( = ?auto_780879 ?auto_780885 ) ) ( not ( = ?auto_780879 ?auto_780886 ) ) ( not ( = ?auto_780879 ?auto_780887 ) ) ( not ( = ?auto_780879 ?auto_780888 ) ) ( not ( = ?auto_780879 ?auto_780889 ) ) ( not ( = ?auto_780879 ?auto_780890 ) ) ( not ( = ?auto_780879 ?auto_780891 ) ) ( not ( = ?auto_780879 ?auto_780892 ) ) ( not ( = ?auto_780880 ?auto_780881 ) ) ( not ( = ?auto_780880 ?auto_780882 ) ) ( not ( = ?auto_780880 ?auto_780883 ) ) ( not ( = ?auto_780880 ?auto_780884 ) ) ( not ( = ?auto_780880 ?auto_780885 ) ) ( not ( = ?auto_780880 ?auto_780886 ) ) ( not ( = ?auto_780880 ?auto_780887 ) ) ( not ( = ?auto_780880 ?auto_780888 ) ) ( not ( = ?auto_780880 ?auto_780889 ) ) ( not ( = ?auto_780880 ?auto_780890 ) ) ( not ( = ?auto_780880 ?auto_780891 ) ) ( not ( = ?auto_780880 ?auto_780892 ) ) ( not ( = ?auto_780881 ?auto_780882 ) ) ( not ( = ?auto_780881 ?auto_780883 ) ) ( not ( = ?auto_780881 ?auto_780884 ) ) ( not ( = ?auto_780881 ?auto_780885 ) ) ( not ( = ?auto_780881 ?auto_780886 ) ) ( not ( = ?auto_780881 ?auto_780887 ) ) ( not ( = ?auto_780881 ?auto_780888 ) ) ( not ( = ?auto_780881 ?auto_780889 ) ) ( not ( = ?auto_780881 ?auto_780890 ) ) ( not ( = ?auto_780881 ?auto_780891 ) ) ( not ( = ?auto_780881 ?auto_780892 ) ) ( not ( = ?auto_780882 ?auto_780883 ) ) ( not ( = ?auto_780882 ?auto_780884 ) ) ( not ( = ?auto_780882 ?auto_780885 ) ) ( not ( = ?auto_780882 ?auto_780886 ) ) ( not ( = ?auto_780882 ?auto_780887 ) ) ( not ( = ?auto_780882 ?auto_780888 ) ) ( not ( = ?auto_780882 ?auto_780889 ) ) ( not ( = ?auto_780882 ?auto_780890 ) ) ( not ( = ?auto_780882 ?auto_780891 ) ) ( not ( = ?auto_780882 ?auto_780892 ) ) ( not ( = ?auto_780883 ?auto_780884 ) ) ( not ( = ?auto_780883 ?auto_780885 ) ) ( not ( = ?auto_780883 ?auto_780886 ) ) ( not ( = ?auto_780883 ?auto_780887 ) ) ( not ( = ?auto_780883 ?auto_780888 ) ) ( not ( = ?auto_780883 ?auto_780889 ) ) ( not ( = ?auto_780883 ?auto_780890 ) ) ( not ( = ?auto_780883 ?auto_780891 ) ) ( not ( = ?auto_780883 ?auto_780892 ) ) ( not ( = ?auto_780884 ?auto_780885 ) ) ( not ( = ?auto_780884 ?auto_780886 ) ) ( not ( = ?auto_780884 ?auto_780887 ) ) ( not ( = ?auto_780884 ?auto_780888 ) ) ( not ( = ?auto_780884 ?auto_780889 ) ) ( not ( = ?auto_780884 ?auto_780890 ) ) ( not ( = ?auto_780884 ?auto_780891 ) ) ( not ( = ?auto_780884 ?auto_780892 ) ) ( not ( = ?auto_780885 ?auto_780886 ) ) ( not ( = ?auto_780885 ?auto_780887 ) ) ( not ( = ?auto_780885 ?auto_780888 ) ) ( not ( = ?auto_780885 ?auto_780889 ) ) ( not ( = ?auto_780885 ?auto_780890 ) ) ( not ( = ?auto_780885 ?auto_780891 ) ) ( not ( = ?auto_780885 ?auto_780892 ) ) ( not ( = ?auto_780886 ?auto_780887 ) ) ( not ( = ?auto_780886 ?auto_780888 ) ) ( not ( = ?auto_780886 ?auto_780889 ) ) ( not ( = ?auto_780886 ?auto_780890 ) ) ( not ( = ?auto_780886 ?auto_780891 ) ) ( not ( = ?auto_780886 ?auto_780892 ) ) ( not ( = ?auto_780887 ?auto_780888 ) ) ( not ( = ?auto_780887 ?auto_780889 ) ) ( not ( = ?auto_780887 ?auto_780890 ) ) ( not ( = ?auto_780887 ?auto_780891 ) ) ( not ( = ?auto_780887 ?auto_780892 ) ) ( not ( = ?auto_780888 ?auto_780889 ) ) ( not ( = ?auto_780888 ?auto_780890 ) ) ( not ( = ?auto_780888 ?auto_780891 ) ) ( not ( = ?auto_780888 ?auto_780892 ) ) ( not ( = ?auto_780889 ?auto_780890 ) ) ( not ( = ?auto_780889 ?auto_780891 ) ) ( not ( = ?auto_780889 ?auto_780892 ) ) ( not ( = ?auto_780890 ?auto_780891 ) ) ( not ( = ?auto_780890 ?auto_780892 ) ) ( not ( = ?auto_780891 ?auto_780892 ) ) ( ON ?auto_780890 ?auto_780891 ) ( ON ?auto_780889 ?auto_780890 ) ( ON ?auto_780888 ?auto_780889 ) ( ON ?auto_780887 ?auto_780888 ) ( ON ?auto_780886 ?auto_780887 ) ( ON ?auto_780885 ?auto_780886 ) ( ON ?auto_780884 ?auto_780885 ) ( ON ?auto_780883 ?auto_780884 ) ( ON ?auto_780882 ?auto_780883 ) ( ON ?auto_780881 ?auto_780882 ) ( ON ?auto_780880 ?auto_780881 ) ( CLEAR ?auto_780878 ) ( ON ?auto_780879 ?auto_780880 ) ( CLEAR ?auto_780879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_780876 ?auto_780877 ?auto_780878 ?auto_780879 )
      ( MAKE-16PILE ?auto_780876 ?auto_780877 ?auto_780878 ?auto_780879 ?auto_780880 ?auto_780881 ?auto_780882 ?auto_780883 ?auto_780884 ?auto_780885 ?auto_780886 ?auto_780887 ?auto_780888 ?auto_780889 ?auto_780890 ?auto_780891 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_780942 - BLOCK
      ?auto_780943 - BLOCK
      ?auto_780944 - BLOCK
      ?auto_780945 - BLOCK
      ?auto_780946 - BLOCK
      ?auto_780947 - BLOCK
      ?auto_780948 - BLOCK
      ?auto_780949 - BLOCK
      ?auto_780950 - BLOCK
      ?auto_780951 - BLOCK
      ?auto_780952 - BLOCK
      ?auto_780953 - BLOCK
      ?auto_780954 - BLOCK
      ?auto_780955 - BLOCK
      ?auto_780956 - BLOCK
      ?auto_780957 - BLOCK
    )
    :vars
    (
      ?auto_780958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_780957 ?auto_780958 ) ( ON-TABLE ?auto_780942 ) ( ON ?auto_780943 ?auto_780942 ) ( not ( = ?auto_780942 ?auto_780943 ) ) ( not ( = ?auto_780942 ?auto_780944 ) ) ( not ( = ?auto_780942 ?auto_780945 ) ) ( not ( = ?auto_780942 ?auto_780946 ) ) ( not ( = ?auto_780942 ?auto_780947 ) ) ( not ( = ?auto_780942 ?auto_780948 ) ) ( not ( = ?auto_780942 ?auto_780949 ) ) ( not ( = ?auto_780942 ?auto_780950 ) ) ( not ( = ?auto_780942 ?auto_780951 ) ) ( not ( = ?auto_780942 ?auto_780952 ) ) ( not ( = ?auto_780942 ?auto_780953 ) ) ( not ( = ?auto_780942 ?auto_780954 ) ) ( not ( = ?auto_780942 ?auto_780955 ) ) ( not ( = ?auto_780942 ?auto_780956 ) ) ( not ( = ?auto_780942 ?auto_780957 ) ) ( not ( = ?auto_780942 ?auto_780958 ) ) ( not ( = ?auto_780943 ?auto_780944 ) ) ( not ( = ?auto_780943 ?auto_780945 ) ) ( not ( = ?auto_780943 ?auto_780946 ) ) ( not ( = ?auto_780943 ?auto_780947 ) ) ( not ( = ?auto_780943 ?auto_780948 ) ) ( not ( = ?auto_780943 ?auto_780949 ) ) ( not ( = ?auto_780943 ?auto_780950 ) ) ( not ( = ?auto_780943 ?auto_780951 ) ) ( not ( = ?auto_780943 ?auto_780952 ) ) ( not ( = ?auto_780943 ?auto_780953 ) ) ( not ( = ?auto_780943 ?auto_780954 ) ) ( not ( = ?auto_780943 ?auto_780955 ) ) ( not ( = ?auto_780943 ?auto_780956 ) ) ( not ( = ?auto_780943 ?auto_780957 ) ) ( not ( = ?auto_780943 ?auto_780958 ) ) ( not ( = ?auto_780944 ?auto_780945 ) ) ( not ( = ?auto_780944 ?auto_780946 ) ) ( not ( = ?auto_780944 ?auto_780947 ) ) ( not ( = ?auto_780944 ?auto_780948 ) ) ( not ( = ?auto_780944 ?auto_780949 ) ) ( not ( = ?auto_780944 ?auto_780950 ) ) ( not ( = ?auto_780944 ?auto_780951 ) ) ( not ( = ?auto_780944 ?auto_780952 ) ) ( not ( = ?auto_780944 ?auto_780953 ) ) ( not ( = ?auto_780944 ?auto_780954 ) ) ( not ( = ?auto_780944 ?auto_780955 ) ) ( not ( = ?auto_780944 ?auto_780956 ) ) ( not ( = ?auto_780944 ?auto_780957 ) ) ( not ( = ?auto_780944 ?auto_780958 ) ) ( not ( = ?auto_780945 ?auto_780946 ) ) ( not ( = ?auto_780945 ?auto_780947 ) ) ( not ( = ?auto_780945 ?auto_780948 ) ) ( not ( = ?auto_780945 ?auto_780949 ) ) ( not ( = ?auto_780945 ?auto_780950 ) ) ( not ( = ?auto_780945 ?auto_780951 ) ) ( not ( = ?auto_780945 ?auto_780952 ) ) ( not ( = ?auto_780945 ?auto_780953 ) ) ( not ( = ?auto_780945 ?auto_780954 ) ) ( not ( = ?auto_780945 ?auto_780955 ) ) ( not ( = ?auto_780945 ?auto_780956 ) ) ( not ( = ?auto_780945 ?auto_780957 ) ) ( not ( = ?auto_780945 ?auto_780958 ) ) ( not ( = ?auto_780946 ?auto_780947 ) ) ( not ( = ?auto_780946 ?auto_780948 ) ) ( not ( = ?auto_780946 ?auto_780949 ) ) ( not ( = ?auto_780946 ?auto_780950 ) ) ( not ( = ?auto_780946 ?auto_780951 ) ) ( not ( = ?auto_780946 ?auto_780952 ) ) ( not ( = ?auto_780946 ?auto_780953 ) ) ( not ( = ?auto_780946 ?auto_780954 ) ) ( not ( = ?auto_780946 ?auto_780955 ) ) ( not ( = ?auto_780946 ?auto_780956 ) ) ( not ( = ?auto_780946 ?auto_780957 ) ) ( not ( = ?auto_780946 ?auto_780958 ) ) ( not ( = ?auto_780947 ?auto_780948 ) ) ( not ( = ?auto_780947 ?auto_780949 ) ) ( not ( = ?auto_780947 ?auto_780950 ) ) ( not ( = ?auto_780947 ?auto_780951 ) ) ( not ( = ?auto_780947 ?auto_780952 ) ) ( not ( = ?auto_780947 ?auto_780953 ) ) ( not ( = ?auto_780947 ?auto_780954 ) ) ( not ( = ?auto_780947 ?auto_780955 ) ) ( not ( = ?auto_780947 ?auto_780956 ) ) ( not ( = ?auto_780947 ?auto_780957 ) ) ( not ( = ?auto_780947 ?auto_780958 ) ) ( not ( = ?auto_780948 ?auto_780949 ) ) ( not ( = ?auto_780948 ?auto_780950 ) ) ( not ( = ?auto_780948 ?auto_780951 ) ) ( not ( = ?auto_780948 ?auto_780952 ) ) ( not ( = ?auto_780948 ?auto_780953 ) ) ( not ( = ?auto_780948 ?auto_780954 ) ) ( not ( = ?auto_780948 ?auto_780955 ) ) ( not ( = ?auto_780948 ?auto_780956 ) ) ( not ( = ?auto_780948 ?auto_780957 ) ) ( not ( = ?auto_780948 ?auto_780958 ) ) ( not ( = ?auto_780949 ?auto_780950 ) ) ( not ( = ?auto_780949 ?auto_780951 ) ) ( not ( = ?auto_780949 ?auto_780952 ) ) ( not ( = ?auto_780949 ?auto_780953 ) ) ( not ( = ?auto_780949 ?auto_780954 ) ) ( not ( = ?auto_780949 ?auto_780955 ) ) ( not ( = ?auto_780949 ?auto_780956 ) ) ( not ( = ?auto_780949 ?auto_780957 ) ) ( not ( = ?auto_780949 ?auto_780958 ) ) ( not ( = ?auto_780950 ?auto_780951 ) ) ( not ( = ?auto_780950 ?auto_780952 ) ) ( not ( = ?auto_780950 ?auto_780953 ) ) ( not ( = ?auto_780950 ?auto_780954 ) ) ( not ( = ?auto_780950 ?auto_780955 ) ) ( not ( = ?auto_780950 ?auto_780956 ) ) ( not ( = ?auto_780950 ?auto_780957 ) ) ( not ( = ?auto_780950 ?auto_780958 ) ) ( not ( = ?auto_780951 ?auto_780952 ) ) ( not ( = ?auto_780951 ?auto_780953 ) ) ( not ( = ?auto_780951 ?auto_780954 ) ) ( not ( = ?auto_780951 ?auto_780955 ) ) ( not ( = ?auto_780951 ?auto_780956 ) ) ( not ( = ?auto_780951 ?auto_780957 ) ) ( not ( = ?auto_780951 ?auto_780958 ) ) ( not ( = ?auto_780952 ?auto_780953 ) ) ( not ( = ?auto_780952 ?auto_780954 ) ) ( not ( = ?auto_780952 ?auto_780955 ) ) ( not ( = ?auto_780952 ?auto_780956 ) ) ( not ( = ?auto_780952 ?auto_780957 ) ) ( not ( = ?auto_780952 ?auto_780958 ) ) ( not ( = ?auto_780953 ?auto_780954 ) ) ( not ( = ?auto_780953 ?auto_780955 ) ) ( not ( = ?auto_780953 ?auto_780956 ) ) ( not ( = ?auto_780953 ?auto_780957 ) ) ( not ( = ?auto_780953 ?auto_780958 ) ) ( not ( = ?auto_780954 ?auto_780955 ) ) ( not ( = ?auto_780954 ?auto_780956 ) ) ( not ( = ?auto_780954 ?auto_780957 ) ) ( not ( = ?auto_780954 ?auto_780958 ) ) ( not ( = ?auto_780955 ?auto_780956 ) ) ( not ( = ?auto_780955 ?auto_780957 ) ) ( not ( = ?auto_780955 ?auto_780958 ) ) ( not ( = ?auto_780956 ?auto_780957 ) ) ( not ( = ?auto_780956 ?auto_780958 ) ) ( not ( = ?auto_780957 ?auto_780958 ) ) ( ON ?auto_780956 ?auto_780957 ) ( ON ?auto_780955 ?auto_780956 ) ( ON ?auto_780954 ?auto_780955 ) ( ON ?auto_780953 ?auto_780954 ) ( ON ?auto_780952 ?auto_780953 ) ( ON ?auto_780951 ?auto_780952 ) ( ON ?auto_780950 ?auto_780951 ) ( ON ?auto_780949 ?auto_780950 ) ( ON ?auto_780948 ?auto_780949 ) ( ON ?auto_780947 ?auto_780948 ) ( ON ?auto_780946 ?auto_780947 ) ( ON ?auto_780945 ?auto_780946 ) ( CLEAR ?auto_780943 ) ( ON ?auto_780944 ?auto_780945 ) ( CLEAR ?auto_780944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_780942 ?auto_780943 ?auto_780944 )
      ( MAKE-16PILE ?auto_780942 ?auto_780943 ?auto_780944 ?auto_780945 ?auto_780946 ?auto_780947 ?auto_780948 ?auto_780949 ?auto_780950 ?auto_780951 ?auto_780952 ?auto_780953 ?auto_780954 ?auto_780955 ?auto_780956 ?auto_780957 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_781008 - BLOCK
      ?auto_781009 - BLOCK
      ?auto_781010 - BLOCK
      ?auto_781011 - BLOCK
      ?auto_781012 - BLOCK
      ?auto_781013 - BLOCK
      ?auto_781014 - BLOCK
      ?auto_781015 - BLOCK
      ?auto_781016 - BLOCK
      ?auto_781017 - BLOCK
      ?auto_781018 - BLOCK
      ?auto_781019 - BLOCK
      ?auto_781020 - BLOCK
      ?auto_781021 - BLOCK
      ?auto_781022 - BLOCK
      ?auto_781023 - BLOCK
    )
    :vars
    (
      ?auto_781024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_781023 ?auto_781024 ) ( ON-TABLE ?auto_781008 ) ( not ( = ?auto_781008 ?auto_781009 ) ) ( not ( = ?auto_781008 ?auto_781010 ) ) ( not ( = ?auto_781008 ?auto_781011 ) ) ( not ( = ?auto_781008 ?auto_781012 ) ) ( not ( = ?auto_781008 ?auto_781013 ) ) ( not ( = ?auto_781008 ?auto_781014 ) ) ( not ( = ?auto_781008 ?auto_781015 ) ) ( not ( = ?auto_781008 ?auto_781016 ) ) ( not ( = ?auto_781008 ?auto_781017 ) ) ( not ( = ?auto_781008 ?auto_781018 ) ) ( not ( = ?auto_781008 ?auto_781019 ) ) ( not ( = ?auto_781008 ?auto_781020 ) ) ( not ( = ?auto_781008 ?auto_781021 ) ) ( not ( = ?auto_781008 ?auto_781022 ) ) ( not ( = ?auto_781008 ?auto_781023 ) ) ( not ( = ?auto_781008 ?auto_781024 ) ) ( not ( = ?auto_781009 ?auto_781010 ) ) ( not ( = ?auto_781009 ?auto_781011 ) ) ( not ( = ?auto_781009 ?auto_781012 ) ) ( not ( = ?auto_781009 ?auto_781013 ) ) ( not ( = ?auto_781009 ?auto_781014 ) ) ( not ( = ?auto_781009 ?auto_781015 ) ) ( not ( = ?auto_781009 ?auto_781016 ) ) ( not ( = ?auto_781009 ?auto_781017 ) ) ( not ( = ?auto_781009 ?auto_781018 ) ) ( not ( = ?auto_781009 ?auto_781019 ) ) ( not ( = ?auto_781009 ?auto_781020 ) ) ( not ( = ?auto_781009 ?auto_781021 ) ) ( not ( = ?auto_781009 ?auto_781022 ) ) ( not ( = ?auto_781009 ?auto_781023 ) ) ( not ( = ?auto_781009 ?auto_781024 ) ) ( not ( = ?auto_781010 ?auto_781011 ) ) ( not ( = ?auto_781010 ?auto_781012 ) ) ( not ( = ?auto_781010 ?auto_781013 ) ) ( not ( = ?auto_781010 ?auto_781014 ) ) ( not ( = ?auto_781010 ?auto_781015 ) ) ( not ( = ?auto_781010 ?auto_781016 ) ) ( not ( = ?auto_781010 ?auto_781017 ) ) ( not ( = ?auto_781010 ?auto_781018 ) ) ( not ( = ?auto_781010 ?auto_781019 ) ) ( not ( = ?auto_781010 ?auto_781020 ) ) ( not ( = ?auto_781010 ?auto_781021 ) ) ( not ( = ?auto_781010 ?auto_781022 ) ) ( not ( = ?auto_781010 ?auto_781023 ) ) ( not ( = ?auto_781010 ?auto_781024 ) ) ( not ( = ?auto_781011 ?auto_781012 ) ) ( not ( = ?auto_781011 ?auto_781013 ) ) ( not ( = ?auto_781011 ?auto_781014 ) ) ( not ( = ?auto_781011 ?auto_781015 ) ) ( not ( = ?auto_781011 ?auto_781016 ) ) ( not ( = ?auto_781011 ?auto_781017 ) ) ( not ( = ?auto_781011 ?auto_781018 ) ) ( not ( = ?auto_781011 ?auto_781019 ) ) ( not ( = ?auto_781011 ?auto_781020 ) ) ( not ( = ?auto_781011 ?auto_781021 ) ) ( not ( = ?auto_781011 ?auto_781022 ) ) ( not ( = ?auto_781011 ?auto_781023 ) ) ( not ( = ?auto_781011 ?auto_781024 ) ) ( not ( = ?auto_781012 ?auto_781013 ) ) ( not ( = ?auto_781012 ?auto_781014 ) ) ( not ( = ?auto_781012 ?auto_781015 ) ) ( not ( = ?auto_781012 ?auto_781016 ) ) ( not ( = ?auto_781012 ?auto_781017 ) ) ( not ( = ?auto_781012 ?auto_781018 ) ) ( not ( = ?auto_781012 ?auto_781019 ) ) ( not ( = ?auto_781012 ?auto_781020 ) ) ( not ( = ?auto_781012 ?auto_781021 ) ) ( not ( = ?auto_781012 ?auto_781022 ) ) ( not ( = ?auto_781012 ?auto_781023 ) ) ( not ( = ?auto_781012 ?auto_781024 ) ) ( not ( = ?auto_781013 ?auto_781014 ) ) ( not ( = ?auto_781013 ?auto_781015 ) ) ( not ( = ?auto_781013 ?auto_781016 ) ) ( not ( = ?auto_781013 ?auto_781017 ) ) ( not ( = ?auto_781013 ?auto_781018 ) ) ( not ( = ?auto_781013 ?auto_781019 ) ) ( not ( = ?auto_781013 ?auto_781020 ) ) ( not ( = ?auto_781013 ?auto_781021 ) ) ( not ( = ?auto_781013 ?auto_781022 ) ) ( not ( = ?auto_781013 ?auto_781023 ) ) ( not ( = ?auto_781013 ?auto_781024 ) ) ( not ( = ?auto_781014 ?auto_781015 ) ) ( not ( = ?auto_781014 ?auto_781016 ) ) ( not ( = ?auto_781014 ?auto_781017 ) ) ( not ( = ?auto_781014 ?auto_781018 ) ) ( not ( = ?auto_781014 ?auto_781019 ) ) ( not ( = ?auto_781014 ?auto_781020 ) ) ( not ( = ?auto_781014 ?auto_781021 ) ) ( not ( = ?auto_781014 ?auto_781022 ) ) ( not ( = ?auto_781014 ?auto_781023 ) ) ( not ( = ?auto_781014 ?auto_781024 ) ) ( not ( = ?auto_781015 ?auto_781016 ) ) ( not ( = ?auto_781015 ?auto_781017 ) ) ( not ( = ?auto_781015 ?auto_781018 ) ) ( not ( = ?auto_781015 ?auto_781019 ) ) ( not ( = ?auto_781015 ?auto_781020 ) ) ( not ( = ?auto_781015 ?auto_781021 ) ) ( not ( = ?auto_781015 ?auto_781022 ) ) ( not ( = ?auto_781015 ?auto_781023 ) ) ( not ( = ?auto_781015 ?auto_781024 ) ) ( not ( = ?auto_781016 ?auto_781017 ) ) ( not ( = ?auto_781016 ?auto_781018 ) ) ( not ( = ?auto_781016 ?auto_781019 ) ) ( not ( = ?auto_781016 ?auto_781020 ) ) ( not ( = ?auto_781016 ?auto_781021 ) ) ( not ( = ?auto_781016 ?auto_781022 ) ) ( not ( = ?auto_781016 ?auto_781023 ) ) ( not ( = ?auto_781016 ?auto_781024 ) ) ( not ( = ?auto_781017 ?auto_781018 ) ) ( not ( = ?auto_781017 ?auto_781019 ) ) ( not ( = ?auto_781017 ?auto_781020 ) ) ( not ( = ?auto_781017 ?auto_781021 ) ) ( not ( = ?auto_781017 ?auto_781022 ) ) ( not ( = ?auto_781017 ?auto_781023 ) ) ( not ( = ?auto_781017 ?auto_781024 ) ) ( not ( = ?auto_781018 ?auto_781019 ) ) ( not ( = ?auto_781018 ?auto_781020 ) ) ( not ( = ?auto_781018 ?auto_781021 ) ) ( not ( = ?auto_781018 ?auto_781022 ) ) ( not ( = ?auto_781018 ?auto_781023 ) ) ( not ( = ?auto_781018 ?auto_781024 ) ) ( not ( = ?auto_781019 ?auto_781020 ) ) ( not ( = ?auto_781019 ?auto_781021 ) ) ( not ( = ?auto_781019 ?auto_781022 ) ) ( not ( = ?auto_781019 ?auto_781023 ) ) ( not ( = ?auto_781019 ?auto_781024 ) ) ( not ( = ?auto_781020 ?auto_781021 ) ) ( not ( = ?auto_781020 ?auto_781022 ) ) ( not ( = ?auto_781020 ?auto_781023 ) ) ( not ( = ?auto_781020 ?auto_781024 ) ) ( not ( = ?auto_781021 ?auto_781022 ) ) ( not ( = ?auto_781021 ?auto_781023 ) ) ( not ( = ?auto_781021 ?auto_781024 ) ) ( not ( = ?auto_781022 ?auto_781023 ) ) ( not ( = ?auto_781022 ?auto_781024 ) ) ( not ( = ?auto_781023 ?auto_781024 ) ) ( ON ?auto_781022 ?auto_781023 ) ( ON ?auto_781021 ?auto_781022 ) ( ON ?auto_781020 ?auto_781021 ) ( ON ?auto_781019 ?auto_781020 ) ( ON ?auto_781018 ?auto_781019 ) ( ON ?auto_781017 ?auto_781018 ) ( ON ?auto_781016 ?auto_781017 ) ( ON ?auto_781015 ?auto_781016 ) ( ON ?auto_781014 ?auto_781015 ) ( ON ?auto_781013 ?auto_781014 ) ( ON ?auto_781012 ?auto_781013 ) ( ON ?auto_781011 ?auto_781012 ) ( ON ?auto_781010 ?auto_781011 ) ( CLEAR ?auto_781008 ) ( ON ?auto_781009 ?auto_781010 ) ( CLEAR ?auto_781009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_781008 ?auto_781009 )
      ( MAKE-16PILE ?auto_781008 ?auto_781009 ?auto_781010 ?auto_781011 ?auto_781012 ?auto_781013 ?auto_781014 ?auto_781015 ?auto_781016 ?auto_781017 ?auto_781018 ?auto_781019 ?auto_781020 ?auto_781021 ?auto_781022 ?auto_781023 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_781074 - BLOCK
      ?auto_781075 - BLOCK
      ?auto_781076 - BLOCK
      ?auto_781077 - BLOCK
      ?auto_781078 - BLOCK
      ?auto_781079 - BLOCK
      ?auto_781080 - BLOCK
      ?auto_781081 - BLOCK
      ?auto_781082 - BLOCK
      ?auto_781083 - BLOCK
      ?auto_781084 - BLOCK
      ?auto_781085 - BLOCK
      ?auto_781086 - BLOCK
      ?auto_781087 - BLOCK
      ?auto_781088 - BLOCK
      ?auto_781089 - BLOCK
    )
    :vars
    (
      ?auto_781090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_781089 ?auto_781090 ) ( not ( = ?auto_781074 ?auto_781075 ) ) ( not ( = ?auto_781074 ?auto_781076 ) ) ( not ( = ?auto_781074 ?auto_781077 ) ) ( not ( = ?auto_781074 ?auto_781078 ) ) ( not ( = ?auto_781074 ?auto_781079 ) ) ( not ( = ?auto_781074 ?auto_781080 ) ) ( not ( = ?auto_781074 ?auto_781081 ) ) ( not ( = ?auto_781074 ?auto_781082 ) ) ( not ( = ?auto_781074 ?auto_781083 ) ) ( not ( = ?auto_781074 ?auto_781084 ) ) ( not ( = ?auto_781074 ?auto_781085 ) ) ( not ( = ?auto_781074 ?auto_781086 ) ) ( not ( = ?auto_781074 ?auto_781087 ) ) ( not ( = ?auto_781074 ?auto_781088 ) ) ( not ( = ?auto_781074 ?auto_781089 ) ) ( not ( = ?auto_781074 ?auto_781090 ) ) ( not ( = ?auto_781075 ?auto_781076 ) ) ( not ( = ?auto_781075 ?auto_781077 ) ) ( not ( = ?auto_781075 ?auto_781078 ) ) ( not ( = ?auto_781075 ?auto_781079 ) ) ( not ( = ?auto_781075 ?auto_781080 ) ) ( not ( = ?auto_781075 ?auto_781081 ) ) ( not ( = ?auto_781075 ?auto_781082 ) ) ( not ( = ?auto_781075 ?auto_781083 ) ) ( not ( = ?auto_781075 ?auto_781084 ) ) ( not ( = ?auto_781075 ?auto_781085 ) ) ( not ( = ?auto_781075 ?auto_781086 ) ) ( not ( = ?auto_781075 ?auto_781087 ) ) ( not ( = ?auto_781075 ?auto_781088 ) ) ( not ( = ?auto_781075 ?auto_781089 ) ) ( not ( = ?auto_781075 ?auto_781090 ) ) ( not ( = ?auto_781076 ?auto_781077 ) ) ( not ( = ?auto_781076 ?auto_781078 ) ) ( not ( = ?auto_781076 ?auto_781079 ) ) ( not ( = ?auto_781076 ?auto_781080 ) ) ( not ( = ?auto_781076 ?auto_781081 ) ) ( not ( = ?auto_781076 ?auto_781082 ) ) ( not ( = ?auto_781076 ?auto_781083 ) ) ( not ( = ?auto_781076 ?auto_781084 ) ) ( not ( = ?auto_781076 ?auto_781085 ) ) ( not ( = ?auto_781076 ?auto_781086 ) ) ( not ( = ?auto_781076 ?auto_781087 ) ) ( not ( = ?auto_781076 ?auto_781088 ) ) ( not ( = ?auto_781076 ?auto_781089 ) ) ( not ( = ?auto_781076 ?auto_781090 ) ) ( not ( = ?auto_781077 ?auto_781078 ) ) ( not ( = ?auto_781077 ?auto_781079 ) ) ( not ( = ?auto_781077 ?auto_781080 ) ) ( not ( = ?auto_781077 ?auto_781081 ) ) ( not ( = ?auto_781077 ?auto_781082 ) ) ( not ( = ?auto_781077 ?auto_781083 ) ) ( not ( = ?auto_781077 ?auto_781084 ) ) ( not ( = ?auto_781077 ?auto_781085 ) ) ( not ( = ?auto_781077 ?auto_781086 ) ) ( not ( = ?auto_781077 ?auto_781087 ) ) ( not ( = ?auto_781077 ?auto_781088 ) ) ( not ( = ?auto_781077 ?auto_781089 ) ) ( not ( = ?auto_781077 ?auto_781090 ) ) ( not ( = ?auto_781078 ?auto_781079 ) ) ( not ( = ?auto_781078 ?auto_781080 ) ) ( not ( = ?auto_781078 ?auto_781081 ) ) ( not ( = ?auto_781078 ?auto_781082 ) ) ( not ( = ?auto_781078 ?auto_781083 ) ) ( not ( = ?auto_781078 ?auto_781084 ) ) ( not ( = ?auto_781078 ?auto_781085 ) ) ( not ( = ?auto_781078 ?auto_781086 ) ) ( not ( = ?auto_781078 ?auto_781087 ) ) ( not ( = ?auto_781078 ?auto_781088 ) ) ( not ( = ?auto_781078 ?auto_781089 ) ) ( not ( = ?auto_781078 ?auto_781090 ) ) ( not ( = ?auto_781079 ?auto_781080 ) ) ( not ( = ?auto_781079 ?auto_781081 ) ) ( not ( = ?auto_781079 ?auto_781082 ) ) ( not ( = ?auto_781079 ?auto_781083 ) ) ( not ( = ?auto_781079 ?auto_781084 ) ) ( not ( = ?auto_781079 ?auto_781085 ) ) ( not ( = ?auto_781079 ?auto_781086 ) ) ( not ( = ?auto_781079 ?auto_781087 ) ) ( not ( = ?auto_781079 ?auto_781088 ) ) ( not ( = ?auto_781079 ?auto_781089 ) ) ( not ( = ?auto_781079 ?auto_781090 ) ) ( not ( = ?auto_781080 ?auto_781081 ) ) ( not ( = ?auto_781080 ?auto_781082 ) ) ( not ( = ?auto_781080 ?auto_781083 ) ) ( not ( = ?auto_781080 ?auto_781084 ) ) ( not ( = ?auto_781080 ?auto_781085 ) ) ( not ( = ?auto_781080 ?auto_781086 ) ) ( not ( = ?auto_781080 ?auto_781087 ) ) ( not ( = ?auto_781080 ?auto_781088 ) ) ( not ( = ?auto_781080 ?auto_781089 ) ) ( not ( = ?auto_781080 ?auto_781090 ) ) ( not ( = ?auto_781081 ?auto_781082 ) ) ( not ( = ?auto_781081 ?auto_781083 ) ) ( not ( = ?auto_781081 ?auto_781084 ) ) ( not ( = ?auto_781081 ?auto_781085 ) ) ( not ( = ?auto_781081 ?auto_781086 ) ) ( not ( = ?auto_781081 ?auto_781087 ) ) ( not ( = ?auto_781081 ?auto_781088 ) ) ( not ( = ?auto_781081 ?auto_781089 ) ) ( not ( = ?auto_781081 ?auto_781090 ) ) ( not ( = ?auto_781082 ?auto_781083 ) ) ( not ( = ?auto_781082 ?auto_781084 ) ) ( not ( = ?auto_781082 ?auto_781085 ) ) ( not ( = ?auto_781082 ?auto_781086 ) ) ( not ( = ?auto_781082 ?auto_781087 ) ) ( not ( = ?auto_781082 ?auto_781088 ) ) ( not ( = ?auto_781082 ?auto_781089 ) ) ( not ( = ?auto_781082 ?auto_781090 ) ) ( not ( = ?auto_781083 ?auto_781084 ) ) ( not ( = ?auto_781083 ?auto_781085 ) ) ( not ( = ?auto_781083 ?auto_781086 ) ) ( not ( = ?auto_781083 ?auto_781087 ) ) ( not ( = ?auto_781083 ?auto_781088 ) ) ( not ( = ?auto_781083 ?auto_781089 ) ) ( not ( = ?auto_781083 ?auto_781090 ) ) ( not ( = ?auto_781084 ?auto_781085 ) ) ( not ( = ?auto_781084 ?auto_781086 ) ) ( not ( = ?auto_781084 ?auto_781087 ) ) ( not ( = ?auto_781084 ?auto_781088 ) ) ( not ( = ?auto_781084 ?auto_781089 ) ) ( not ( = ?auto_781084 ?auto_781090 ) ) ( not ( = ?auto_781085 ?auto_781086 ) ) ( not ( = ?auto_781085 ?auto_781087 ) ) ( not ( = ?auto_781085 ?auto_781088 ) ) ( not ( = ?auto_781085 ?auto_781089 ) ) ( not ( = ?auto_781085 ?auto_781090 ) ) ( not ( = ?auto_781086 ?auto_781087 ) ) ( not ( = ?auto_781086 ?auto_781088 ) ) ( not ( = ?auto_781086 ?auto_781089 ) ) ( not ( = ?auto_781086 ?auto_781090 ) ) ( not ( = ?auto_781087 ?auto_781088 ) ) ( not ( = ?auto_781087 ?auto_781089 ) ) ( not ( = ?auto_781087 ?auto_781090 ) ) ( not ( = ?auto_781088 ?auto_781089 ) ) ( not ( = ?auto_781088 ?auto_781090 ) ) ( not ( = ?auto_781089 ?auto_781090 ) ) ( ON ?auto_781088 ?auto_781089 ) ( ON ?auto_781087 ?auto_781088 ) ( ON ?auto_781086 ?auto_781087 ) ( ON ?auto_781085 ?auto_781086 ) ( ON ?auto_781084 ?auto_781085 ) ( ON ?auto_781083 ?auto_781084 ) ( ON ?auto_781082 ?auto_781083 ) ( ON ?auto_781081 ?auto_781082 ) ( ON ?auto_781080 ?auto_781081 ) ( ON ?auto_781079 ?auto_781080 ) ( ON ?auto_781078 ?auto_781079 ) ( ON ?auto_781077 ?auto_781078 ) ( ON ?auto_781076 ?auto_781077 ) ( ON ?auto_781075 ?auto_781076 ) ( ON ?auto_781074 ?auto_781075 ) ( CLEAR ?auto_781074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_781074 )
      ( MAKE-16PILE ?auto_781074 ?auto_781075 ?auto_781076 ?auto_781077 ?auto_781078 ?auto_781079 ?auto_781080 ?auto_781081 ?auto_781082 ?auto_781083 ?auto_781084 ?auto_781085 ?auto_781086 ?auto_781087 ?auto_781088 ?auto_781089 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_781141 - BLOCK
      ?auto_781142 - BLOCK
      ?auto_781143 - BLOCK
      ?auto_781144 - BLOCK
      ?auto_781145 - BLOCK
      ?auto_781146 - BLOCK
      ?auto_781147 - BLOCK
      ?auto_781148 - BLOCK
      ?auto_781149 - BLOCK
      ?auto_781150 - BLOCK
      ?auto_781151 - BLOCK
      ?auto_781152 - BLOCK
      ?auto_781153 - BLOCK
      ?auto_781154 - BLOCK
      ?auto_781155 - BLOCK
      ?auto_781156 - BLOCK
      ?auto_781157 - BLOCK
    )
    :vars
    (
      ?auto_781158 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_781156 ) ( ON ?auto_781157 ?auto_781158 ) ( CLEAR ?auto_781157 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_781141 ) ( ON ?auto_781142 ?auto_781141 ) ( ON ?auto_781143 ?auto_781142 ) ( ON ?auto_781144 ?auto_781143 ) ( ON ?auto_781145 ?auto_781144 ) ( ON ?auto_781146 ?auto_781145 ) ( ON ?auto_781147 ?auto_781146 ) ( ON ?auto_781148 ?auto_781147 ) ( ON ?auto_781149 ?auto_781148 ) ( ON ?auto_781150 ?auto_781149 ) ( ON ?auto_781151 ?auto_781150 ) ( ON ?auto_781152 ?auto_781151 ) ( ON ?auto_781153 ?auto_781152 ) ( ON ?auto_781154 ?auto_781153 ) ( ON ?auto_781155 ?auto_781154 ) ( ON ?auto_781156 ?auto_781155 ) ( not ( = ?auto_781141 ?auto_781142 ) ) ( not ( = ?auto_781141 ?auto_781143 ) ) ( not ( = ?auto_781141 ?auto_781144 ) ) ( not ( = ?auto_781141 ?auto_781145 ) ) ( not ( = ?auto_781141 ?auto_781146 ) ) ( not ( = ?auto_781141 ?auto_781147 ) ) ( not ( = ?auto_781141 ?auto_781148 ) ) ( not ( = ?auto_781141 ?auto_781149 ) ) ( not ( = ?auto_781141 ?auto_781150 ) ) ( not ( = ?auto_781141 ?auto_781151 ) ) ( not ( = ?auto_781141 ?auto_781152 ) ) ( not ( = ?auto_781141 ?auto_781153 ) ) ( not ( = ?auto_781141 ?auto_781154 ) ) ( not ( = ?auto_781141 ?auto_781155 ) ) ( not ( = ?auto_781141 ?auto_781156 ) ) ( not ( = ?auto_781141 ?auto_781157 ) ) ( not ( = ?auto_781141 ?auto_781158 ) ) ( not ( = ?auto_781142 ?auto_781143 ) ) ( not ( = ?auto_781142 ?auto_781144 ) ) ( not ( = ?auto_781142 ?auto_781145 ) ) ( not ( = ?auto_781142 ?auto_781146 ) ) ( not ( = ?auto_781142 ?auto_781147 ) ) ( not ( = ?auto_781142 ?auto_781148 ) ) ( not ( = ?auto_781142 ?auto_781149 ) ) ( not ( = ?auto_781142 ?auto_781150 ) ) ( not ( = ?auto_781142 ?auto_781151 ) ) ( not ( = ?auto_781142 ?auto_781152 ) ) ( not ( = ?auto_781142 ?auto_781153 ) ) ( not ( = ?auto_781142 ?auto_781154 ) ) ( not ( = ?auto_781142 ?auto_781155 ) ) ( not ( = ?auto_781142 ?auto_781156 ) ) ( not ( = ?auto_781142 ?auto_781157 ) ) ( not ( = ?auto_781142 ?auto_781158 ) ) ( not ( = ?auto_781143 ?auto_781144 ) ) ( not ( = ?auto_781143 ?auto_781145 ) ) ( not ( = ?auto_781143 ?auto_781146 ) ) ( not ( = ?auto_781143 ?auto_781147 ) ) ( not ( = ?auto_781143 ?auto_781148 ) ) ( not ( = ?auto_781143 ?auto_781149 ) ) ( not ( = ?auto_781143 ?auto_781150 ) ) ( not ( = ?auto_781143 ?auto_781151 ) ) ( not ( = ?auto_781143 ?auto_781152 ) ) ( not ( = ?auto_781143 ?auto_781153 ) ) ( not ( = ?auto_781143 ?auto_781154 ) ) ( not ( = ?auto_781143 ?auto_781155 ) ) ( not ( = ?auto_781143 ?auto_781156 ) ) ( not ( = ?auto_781143 ?auto_781157 ) ) ( not ( = ?auto_781143 ?auto_781158 ) ) ( not ( = ?auto_781144 ?auto_781145 ) ) ( not ( = ?auto_781144 ?auto_781146 ) ) ( not ( = ?auto_781144 ?auto_781147 ) ) ( not ( = ?auto_781144 ?auto_781148 ) ) ( not ( = ?auto_781144 ?auto_781149 ) ) ( not ( = ?auto_781144 ?auto_781150 ) ) ( not ( = ?auto_781144 ?auto_781151 ) ) ( not ( = ?auto_781144 ?auto_781152 ) ) ( not ( = ?auto_781144 ?auto_781153 ) ) ( not ( = ?auto_781144 ?auto_781154 ) ) ( not ( = ?auto_781144 ?auto_781155 ) ) ( not ( = ?auto_781144 ?auto_781156 ) ) ( not ( = ?auto_781144 ?auto_781157 ) ) ( not ( = ?auto_781144 ?auto_781158 ) ) ( not ( = ?auto_781145 ?auto_781146 ) ) ( not ( = ?auto_781145 ?auto_781147 ) ) ( not ( = ?auto_781145 ?auto_781148 ) ) ( not ( = ?auto_781145 ?auto_781149 ) ) ( not ( = ?auto_781145 ?auto_781150 ) ) ( not ( = ?auto_781145 ?auto_781151 ) ) ( not ( = ?auto_781145 ?auto_781152 ) ) ( not ( = ?auto_781145 ?auto_781153 ) ) ( not ( = ?auto_781145 ?auto_781154 ) ) ( not ( = ?auto_781145 ?auto_781155 ) ) ( not ( = ?auto_781145 ?auto_781156 ) ) ( not ( = ?auto_781145 ?auto_781157 ) ) ( not ( = ?auto_781145 ?auto_781158 ) ) ( not ( = ?auto_781146 ?auto_781147 ) ) ( not ( = ?auto_781146 ?auto_781148 ) ) ( not ( = ?auto_781146 ?auto_781149 ) ) ( not ( = ?auto_781146 ?auto_781150 ) ) ( not ( = ?auto_781146 ?auto_781151 ) ) ( not ( = ?auto_781146 ?auto_781152 ) ) ( not ( = ?auto_781146 ?auto_781153 ) ) ( not ( = ?auto_781146 ?auto_781154 ) ) ( not ( = ?auto_781146 ?auto_781155 ) ) ( not ( = ?auto_781146 ?auto_781156 ) ) ( not ( = ?auto_781146 ?auto_781157 ) ) ( not ( = ?auto_781146 ?auto_781158 ) ) ( not ( = ?auto_781147 ?auto_781148 ) ) ( not ( = ?auto_781147 ?auto_781149 ) ) ( not ( = ?auto_781147 ?auto_781150 ) ) ( not ( = ?auto_781147 ?auto_781151 ) ) ( not ( = ?auto_781147 ?auto_781152 ) ) ( not ( = ?auto_781147 ?auto_781153 ) ) ( not ( = ?auto_781147 ?auto_781154 ) ) ( not ( = ?auto_781147 ?auto_781155 ) ) ( not ( = ?auto_781147 ?auto_781156 ) ) ( not ( = ?auto_781147 ?auto_781157 ) ) ( not ( = ?auto_781147 ?auto_781158 ) ) ( not ( = ?auto_781148 ?auto_781149 ) ) ( not ( = ?auto_781148 ?auto_781150 ) ) ( not ( = ?auto_781148 ?auto_781151 ) ) ( not ( = ?auto_781148 ?auto_781152 ) ) ( not ( = ?auto_781148 ?auto_781153 ) ) ( not ( = ?auto_781148 ?auto_781154 ) ) ( not ( = ?auto_781148 ?auto_781155 ) ) ( not ( = ?auto_781148 ?auto_781156 ) ) ( not ( = ?auto_781148 ?auto_781157 ) ) ( not ( = ?auto_781148 ?auto_781158 ) ) ( not ( = ?auto_781149 ?auto_781150 ) ) ( not ( = ?auto_781149 ?auto_781151 ) ) ( not ( = ?auto_781149 ?auto_781152 ) ) ( not ( = ?auto_781149 ?auto_781153 ) ) ( not ( = ?auto_781149 ?auto_781154 ) ) ( not ( = ?auto_781149 ?auto_781155 ) ) ( not ( = ?auto_781149 ?auto_781156 ) ) ( not ( = ?auto_781149 ?auto_781157 ) ) ( not ( = ?auto_781149 ?auto_781158 ) ) ( not ( = ?auto_781150 ?auto_781151 ) ) ( not ( = ?auto_781150 ?auto_781152 ) ) ( not ( = ?auto_781150 ?auto_781153 ) ) ( not ( = ?auto_781150 ?auto_781154 ) ) ( not ( = ?auto_781150 ?auto_781155 ) ) ( not ( = ?auto_781150 ?auto_781156 ) ) ( not ( = ?auto_781150 ?auto_781157 ) ) ( not ( = ?auto_781150 ?auto_781158 ) ) ( not ( = ?auto_781151 ?auto_781152 ) ) ( not ( = ?auto_781151 ?auto_781153 ) ) ( not ( = ?auto_781151 ?auto_781154 ) ) ( not ( = ?auto_781151 ?auto_781155 ) ) ( not ( = ?auto_781151 ?auto_781156 ) ) ( not ( = ?auto_781151 ?auto_781157 ) ) ( not ( = ?auto_781151 ?auto_781158 ) ) ( not ( = ?auto_781152 ?auto_781153 ) ) ( not ( = ?auto_781152 ?auto_781154 ) ) ( not ( = ?auto_781152 ?auto_781155 ) ) ( not ( = ?auto_781152 ?auto_781156 ) ) ( not ( = ?auto_781152 ?auto_781157 ) ) ( not ( = ?auto_781152 ?auto_781158 ) ) ( not ( = ?auto_781153 ?auto_781154 ) ) ( not ( = ?auto_781153 ?auto_781155 ) ) ( not ( = ?auto_781153 ?auto_781156 ) ) ( not ( = ?auto_781153 ?auto_781157 ) ) ( not ( = ?auto_781153 ?auto_781158 ) ) ( not ( = ?auto_781154 ?auto_781155 ) ) ( not ( = ?auto_781154 ?auto_781156 ) ) ( not ( = ?auto_781154 ?auto_781157 ) ) ( not ( = ?auto_781154 ?auto_781158 ) ) ( not ( = ?auto_781155 ?auto_781156 ) ) ( not ( = ?auto_781155 ?auto_781157 ) ) ( not ( = ?auto_781155 ?auto_781158 ) ) ( not ( = ?auto_781156 ?auto_781157 ) ) ( not ( = ?auto_781156 ?auto_781158 ) ) ( not ( = ?auto_781157 ?auto_781158 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_781157 ?auto_781158 )
      ( !STACK ?auto_781157 ?auto_781156 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_781211 - BLOCK
      ?auto_781212 - BLOCK
      ?auto_781213 - BLOCK
      ?auto_781214 - BLOCK
      ?auto_781215 - BLOCK
      ?auto_781216 - BLOCK
      ?auto_781217 - BLOCK
      ?auto_781218 - BLOCK
      ?auto_781219 - BLOCK
      ?auto_781220 - BLOCK
      ?auto_781221 - BLOCK
      ?auto_781222 - BLOCK
      ?auto_781223 - BLOCK
      ?auto_781224 - BLOCK
      ?auto_781225 - BLOCK
      ?auto_781226 - BLOCK
      ?auto_781227 - BLOCK
    )
    :vars
    (
      ?auto_781228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_781227 ?auto_781228 ) ( ON-TABLE ?auto_781211 ) ( ON ?auto_781212 ?auto_781211 ) ( ON ?auto_781213 ?auto_781212 ) ( ON ?auto_781214 ?auto_781213 ) ( ON ?auto_781215 ?auto_781214 ) ( ON ?auto_781216 ?auto_781215 ) ( ON ?auto_781217 ?auto_781216 ) ( ON ?auto_781218 ?auto_781217 ) ( ON ?auto_781219 ?auto_781218 ) ( ON ?auto_781220 ?auto_781219 ) ( ON ?auto_781221 ?auto_781220 ) ( ON ?auto_781222 ?auto_781221 ) ( ON ?auto_781223 ?auto_781222 ) ( ON ?auto_781224 ?auto_781223 ) ( ON ?auto_781225 ?auto_781224 ) ( not ( = ?auto_781211 ?auto_781212 ) ) ( not ( = ?auto_781211 ?auto_781213 ) ) ( not ( = ?auto_781211 ?auto_781214 ) ) ( not ( = ?auto_781211 ?auto_781215 ) ) ( not ( = ?auto_781211 ?auto_781216 ) ) ( not ( = ?auto_781211 ?auto_781217 ) ) ( not ( = ?auto_781211 ?auto_781218 ) ) ( not ( = ?auto_781211 ?auto_781219 ) ) ( not ( = ?auto_781211 ?auto_781220 ) ) ( not ( = ?auto_781211 ?auto_781221 ) ) ( not ( = ?auto_781211 ?auto_781222 ) ) ( not ( = ?auto_781211 ?auto_781223 ) ) ( not ( = ?auto_781211 ?auto_781224 ) ) ( not ( = ?auto_781211 ?auto_781225 ) ) ( not ( = ?auto_781211 ?auto_781226 ) ) ( not ( = ?auto_781211 ?auto_781227 ) ) ( not ( = ?auto_781211 ?auto_781228 ) ) ( not ( = ?auto_781212 ?auto_781213 ) ) ( not ( = ?auto_781212 ?auto_781214 ) ) ( not ( = ?auto_781212 ?auto_781215 ) ) ( not ( = ?auto_781212 ?auto_781216 ) ) ( not ( = ?auto_781212 ?auto_781217 ) ) ( not ( = ?auto_781212 ?auto_781218 ) ) ( not ( = ?auto_781212 ?auto_781219 ) ) ( not ( = ?auto_781212 ?auto_781220 ) ) ( not ( = ?auto_781212 ?auto_781221 ) ) ( not ( = ?auto_781212 ?auto_781222 ) ) ( not ( = ?auto_781212 ?auto_781223 ) ) ( not ( = ?auto_781212 ?auto_781224 ) ) ( not ( = ?auto_781212 ?auto_781225 ) ) ( not ( = ?auto_781212 ?auto_781226 ) ) ( not ( = ?auto_781212 ?auto_781227 ) ) ( not ( = ?auto_781212 ?auto_781228 ) ) ( not ( = ?auto_781213 ?auto_781214 ) ) ( not ( = ?auto_781213 ?auto_781215 ) ) ( not ( = ?auto_781213 ?auto_781216 ) ) ( not ( = ?auto_781213 ?auto_781217 ) ) ( not ( = ?auto_781213 ?auto_781218 ) ) ( not ( = ?auto_781213 ?auto_781219 ) ) ( not ( = ?auto_781213 ?auto_781220 ) ) ( not ( = ?auto_781213 ?auto_781221 ) ) ( not ( = ?auto_781213 ?auto_781222 ) ) ( not ( = ?auto_781213 ?auto_781223 ) ) ( not ( = ?auto_781213 ?auto_781224 ) ) ( not ( = ?auto_781213 ?auto_781225 ) ) ( not ( = ?auto_781213 ?auto_781226 ) ) ( not ( = ?auto_781213 ?auto_781227 ) ) ( not ( = ?auto_781213 ?auto_781228 ) ) ( not ( = ?auto_781214 ?auto_781215 ) ) ( not ( = ?auto_781214 ?auto_781216 ) ) ( not ( = ?auto_781214 ?auto_781217 ) ) ( not ( = ?auto_781214 ?auto_781218 ) ) ( not ( = ?auto_781214 ?auto_781219 ) ) ( not ( = ?auto_781214 ?auto_781220 ) ) ( not ( = ?auto_781214 ?auto_781221 ) ) ( not ( = ?auto_781214 ?auto_781222 ) ) ( not ( = ?auto_781214 ?auto_781223 ) ) ( not ( = ?auto_781214 ?auto_781224 ) ) ( not ( = ?auto_781214 ?auto_781225 ) ) ( not ( = ?auto_781214 ?auto_781226 ) ) ( not ( = ?auto_781214 ?auto_781227 ) ) ( not ( = ?auto_781214 ?auto_781228 ) ) ( not ( = ?auto_781215 ?auto_781216 ) ) ( not ( = ?auto_781215 ?auto_781217 ) ) ( not ( = ?auto_781215 ?auto_781218 ) ) ( not ( = ?auto_781215 ?auto_781219 ) ) ( not ( = ?auto_781215 ?auto_781220 ) ) ( not ( = ?auto_781215 ?auto_781221 ) ) ( not ( = ?auto_781215 ?auto_781222 ) ) ( not ( = ?auto_781215 ?auto_781223 ) ) ( not ( = ?auto_781215 ?auto_781224 ) ) ( not ( = ?auto_781215 ?auto_781225 ) ) ( not ( = ?auto_781215 ?auto_781226 ) ) ( not ( = ?auto_781215 ?auto_781227 ) ) ( not ( = ?auto_781215 ?auto_781228 ) ) ( not ( = ?auto_781216 ?auto_781217 ) ) ( not ( = ?auto_781216 ?auto_781218 ) ) ( not ( = ?auto_781216 ?auto_781219 ) ) ( not ( = ?auto_781216 ?auto_781220 ) ) ( not ( = ?auto_781216 ?auto_781221 ) ) ( not ( = ?auto_781216 ?auto_781222 ) ) ( not ( = ?auto_781216 ?auto_781223 ) ) ( not ( = ?auto_781216 ?auto_781224 ) ) ( not ( = ?auto_781216 ?auto_781225 ) ) ( not ( = ?auto_781216 ?auto_781226 ) ) ( not ( = ?auto_781216 ?auto_781227 ) ) ( not ( = ?auto_781216 ?auto_781228 ) ) ( not ( = ?auto_781217 ?auto_781218 ) ) ( not ( = ?auto_781217 ?auto_781219 ) ) ( not ( = ?auto_781217 ?auto_781220 ) ) ( not ( = ?auto_781217 ?auto_781221 ) ) ( not ( = ?auto_781217 ?auto_781222 ) ) ( not ( = ?auto_781217 ?auto_781223 ) ) ( not ( = ?auto_781217 ?auto_781224 ) ) ( not ( = ?auto_781217 ?auto_781225 ) ) ( not ( = ?auto_781217 ?auto_781226 ) ) ( not ( = ?auto_781217 ?auto_781227 ) ) ( not ( = ?auto_781217 ?auto_781228 ) ) ( not ( = ?auto_781218 ?auto_781219 ) ) ( not ( = ?auto_781218 ?auto_781220 ) ) ( not ( = ?auto_781218 ?auto_781221 ) ) ( not ( = ?auto_781218 ?auto_781222 ) ) ( not ( = ?auto_781218 ?auto_781223 ) ) ( not ( = ?auto_781218 ?auto_781224 ) ) ( not ( = ?auto_781218 ?auto_781225 ) ) ( not ( = ?auto_781218 ?auto_781226 ) ) ( not ( = ?auto_781218 ?auto_781227 ) ) ( not ( = ?auto_781218 ?auto_781228 ) ) ( not ( = ?auto_781219 ?auto_781220 ) ) ( not ( = ?auto_781219 ?auto_781221 ) ) ( not ( = ?auto_781219 ?auto_781222 ) ) ( not ( = ?auto_781219 ?auto_781223 ) ) ( not ( = ?auto_781219 ?auto_781224 ) ) ( not ( = ?auto_781219 ?auto_781225 ) ) ( not ( = ?auto_781219 ?auto_781226 ) ) ( not ( = ?auto_781219 ?auto_781227 ) ) ( not ( = ?auto_781219 ?auto_781228 ) ) ( not ( = ?auto_781220 ?auto_781221 ) ) ( not ( = ?auto_781220 ?auto_781222 ) ) ( not ( = ?auto_781220 ?auto_781223 ) ) ( not ( = ?auto_781220 ?auto_781224 ) ) ( not ( = ?auto_781220 ?auto_781225 ) ) ( not ( = ?auto_781220 ?auto_781226 ) ) ( not ( = ?auto_781220 ?auto_781227 ) ) ( not ( = ?auto_781220 ?auto_781228 ) ) ( not ( = ?auto_781221 ?auto_781222 ) ) ( not ( = ?auto_781221 ?auto_781223 ) ) ( not ( = ?auto_781221 ?auto_781224 ) ) ( not ( = ?auto_781221 ?auto_781225 ) ) ( not ( = ?auto_781221 ?auto_781226 ) ) ( not ( = ?auto_781221 ?auto_781227 ) ) ( not ( = ?auto_781221 ?auto_781228 ) ) ( not ( = ?auto_781222 ?auto_781223 ) ) ( not ( = ?auto_781222 ?auto_781224 ) ) ( not ( = ?auto_781222 ?auto_781225 ) ) ( not ( = ?auto_781222 ?auto_781226 ) ) ( not ( = ?auto_781222 ?auto_781227 ) ) ( not ( = ?auto_781222 ?auto_781228 ) ) ( not ( = ?auto_781223 ?auto_781224 ) ) ( not ( = ?auto_781223 ?auto_781225 ) ) ( not ( = ?auto_781223 ?auto_781226 ) ) ( not ( = ?auto_781223 ?auto_781227 ) ) ( not ( = ?auto_781223 ?auto_781228 ) ) ( not ( = ?auto_781224 ?auto_781225 ) ) ( not ( = ?auto_781224 ?auto_781226 ) ) ( not ( = ?auto_781224 ?auto_781227 ) ) ( not ( = ?auto_781224 ?auto_781228 ) ) ( not ( = ?auto_781225 ?auto_781226 ) ) ( not ( = ?auto_781225 ?auto_781227 ) ) ( not ( = ?auto_781225 ?auto_781228 ) ) ( not ( = ?auto_781226 ?auto_781227 ) ) ( not ( = ?auto_781226 ?auto_781228 ) ) ( not ( = ?auto_781227 ?auto_781228 ) ) ( CLEAR ?auto_781225 ) ( ON ?auto_781226 ?auto_781227 ) ( CLEAR ?auto_781226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_781211 ?auto_781212 ?auto_781213 ?auto_781214 ?auto_781215 ?auto_781216 ?auto_781217 ?auto_781218 ?auto_781219 ?auto_781220 ?auto_781221 ?auto_781222 ?auto_781223 ?auto_781224 ?auto_781225 ?auto_781226 )
      ( MAKE-17PILE ?auto_781211 ?auto_781212 ?auto_781213 ?auto_781214 ?auto_781215 ?auto_781216 ?auto_781217 ?auto_781218 ?auto_781219 ?auto_781220 ?auto_781221 ?auto_781222 ?auto_781223 ?auto_781224 ?auto_781225 ?auto_781226 ?auto_781227 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_781281 - BLOCK
      ?auto_781282 - BLOCK
      ?auto_781283 - BLOCK
      ?auto_781284 - BLOCK
      ?auto_781285 - BLOCK
      ?auto_781286 - BLOCK
      ?auto_781287 - BLOCK
      ?auto_781288 - BLOCK
      ?auto_781289 - BLOCK
      ?auto_781290 - BLOCK
      ?auto_781291 - BLOCK
      ?auto_781292 - BLOCK
      ?auto_781293 - BLOCK
      ?auto_781294 - BLOCK
      ?auto_781295 - BLOCK
      ?auto_781296 - BLOCK
      ?auto_781297 - BLOCK
    )
    :vars
    (
      ?auto_781298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_781297 ?auto_781298 ) ( ON-TABLE ?auto_781281 ) ( ON ?auto_781282 ?auto_781281 ) ( ON ?auto_781283 ?auto_781282 ) ( ON ?auto_781284 ?auto_781283 ) ( ON ?auto_781285 ?auto_781284 ) ( ON ?auto_781286 ?auto_781285 ) ( ON ?auto_781287 ?auto_781286 ) ( ON ?auto_781288 ?auto_781287 ) ( ON ?auto_781289 ?auto_781288 ) ( ON ?auto_781290 ?auto_781289 ) ( ON ?auto_781291 ?auto_781290 ) ( ON ?auto_781292 ?auto_781291 ) ( ON ?auto_781293 ?auto_781292 ) ( ON ?auto_781294 ?auto_781293 ) ( not ( = ?auto_781281 ?auto_781282 ) ) ( not ( = ?auto_781281 ?auto_781283 ) ) ( not ( = ?auto_781281 ?auto_781284 ) ) ( not ( = ?auto_781281 ?auto_781285 ) ) ( not ( = ?auto_781281 ?auto_781286 ) ) ( not ( = ?auto_781281 ?auto_781287 ) ) ( not ( = ?auto_781281 ?auto_781288 ) ) ( not ( = ?auto_781281 ?auto_781289 ) ) ( not ( = ?auto_781281 ?auto_781290 ) ) ( not ( = ?auto_781281 ?auto_781291 ) ) ( not ( = ?auto_781281 ?auto_781292 ) ) ( not ( = ?auto_781281 ?auto_781293 ) ) ( not ( = ?auto_781281 ?auto_781294 ) ) ( not ( = ?auto_781281 ?auto_781295 ) ) ( not ( = ?auto_781281 ?auto_781296 ) ) ( not ( = ?auto_781281 ?auto_781297 ) ) ( not ( = ?auto_781281 ?auto_781298 ) ) ( not ( = ?auto_781282 ?auto_781283 ) ) ( not ( = ?auto_781282 ?auto_781284 ) ) ( not ( = ?auto_781282 ?auto_781285 ) ) ( not ( = ?auto_781282 ?auto_781286 ) ) ( not ( = ?auto_781282 ?auto_781287 ) ) ( not ( = ?auto_781282 ?auto_781288 ) ) ( not ( = ?auto_781282 ?auto_781289 ) ) ( not ( = ?auto_781282 ?auto_781290 ) ) ( not ( = ?auto_781282 ?auto_781291 ) ) ( not ( = ?auto_781282 ?auto_781292 ) ) ( not ( = ?auto_781282 ?auto_781293 ) ) ( not ( = ?auto_781282 ?auto_781294 ) ) ( not ( = ?auto_781282 ?auto_781295 ) ) ( not ( = ?auto_781282 ?auto_781296 ) ) ( not ( = ?auto_781282 ?auto_781297 ) ) ( not ( = ?auto_781282 ?auto_781298 ) ) ( not ( = ?auto_781283 ?auto_781284 ) ) ( not ( = ?auto_781283 ?auto_781285 ) ) ( not ( = ?auto_781283 ?auto_781286 ) ) ( not ( = ?auto_781283 ?auto_781287 ) ) ( not ( = ?auto_781283 ?auto_781288 ) ) ( not ( = ?auto_781283 ?auto_781289 ) ) ( not ( = ?auto_781283 ?auto_781290 ) ) ( not ( = ?auto_781283 ?auto_781291 ) ) ( not ( = ?auto_781283 ?auto_781292 ) ) ( not ( = ?auto_781283 ?auto_781293 ) ) ( not ( = ?auto_781283 ?auto_781294 ) ) ( not ( = ?auto_781283 ?auto_781295 ) ) ( not ( = ?auto_781283 ?auto_781296 ) ) ( not ( = ?auto_781283 ?auto_781297 ) ) ( not ( = ?auto_781283 ?auto_781298 ) ) ( not ( = ?auto_781284 ?auto_781285 ) ) ( not ( = ?auto_781284 ?auto_781286 ) ) ( not ( = ?auto_781284 ?auto_781287 ) ) ( not ( = ?auto_781284 ?auto_781288 ) ) ( not ( = ?auto_781284 ?auto_781289 ) ) ( not ( = ?auto_781284 ?auto_781290 ) ) ( not ( = ?auto_781284 ?auto_781291 ) ) ( not ( = ?auto_781284 ?auto_781292 ) ) ( not ( = ?auto_781284 ?auto_781293 ) ) ( not ( = ?auto_781284 ?auto_781294 ) ) ( not ( = ?auto_781284 ?auto_781295 ) ) ( not ( = ?auto_781284 ?auto_781296 ) ) ( not ( = ?auto_781284 ?auto_781297 ) ) ( not ( = ?auto_781284 ?auto_781298 ) ) ( not ( = ?auto_781285 ?auto_781286 ) ) ( not ( = ?auto_781285 ?auto_781287 ) ) ( not ( = ?auto_781285 ?auto_781288 ) ) ( not ( = ?auto_781285 ?auto_781289 ) ) ( not ( = ?auto_781285 ?auto_781290 ) ) ( not ( = ?auto_781285 ?auto_781291 ) ) ( not ( = ?auto_781285 ?auto_781292 ) ) ( not ( = ?auto_781285 ?auto_781293 ) ) ( not ( = ?auto_781285 ?auto_781294 ) ) ( not ( = ?auto_781285 ?auto_781295 ) ) ( not ( = ?auto_781285 ?auto_781296 ) ) ( not ( = ?auto_781285 ?auto_781297 ) ) ( not ( = ?auto_781285 ?auto_781298 ) ) ( not ( = ?auto_781286 ?auto_781287 ) ) ( not ( = ?auto_781286 ?auto_781288 ) ) ( not ( = ?auto_781286 ?auto_781289 ) ) ( not ( = ?auto_781286 ?auto_781290 ) ) ( not ( = ?auto_781286 ?auto_781291 ) ) ( not ( = ?auto_781286 ?auto_781292 ) ) ( not ( = ?auto_781286 ?auto_781293 ) ) ( not ( = ?auto_781286 ?auto_781294 ) ) ( not ( = ?auto_781286 ?auto_781295 ) ) ( not ( = ?auto_781286 ?auto_781296 ) ) ( not ( = ?auto_781286 ?auto_781297 ) ) ( not ( = ?auto_781286 ?auto_781298 ) ) ( not ( = ?auto_781287 ?auto_781288 ) ) ( not ( = ?auto_781287 ?auto_781289 ) ) ( not ( = ?auto_781287 ?auto_781290 ) ) ( not ( = ?auto_781287 ?auto_781291 ) ) ( not ( = ?auto_781287 ?auto_781292 ) ) ( not ( = ?auto_781287 ?auto_781293 ) ) ( not ( = ?auto_781287 ?auto_781294 ) ) ( not ( = ?auto_781287 ?auto_781295 ) ) ( not ( = ?auto_781287 ?auto_781296 ) ) ( not ( = ?auto_781287 ?auto_781297 ) ) ( not ( = ?auto_781287 ?auto_781298 ) ) ( not ( = ?auto_781288 ?auto_781289 ) ) ( not ( = ?auto_781288 ?auto_781290 ) ) ( not ( = ?auto_781288 ?auto_781291 ) ) ( not ( = ?auto_781288 ?auto_781292 ) ) ( not ( = ?auto_781288 ?auto_781293 ) ) ( not ( = ?auto_781288 ?auto_781294 ) ) ( not ( = ?auto_781288 ?auto_781295 ) ) ( not ( = ?auto_781288 ?auto_781296 ) ) ( not ( = ?auto_781288 ?auto_781297 ) ) ( not ( = ?auto_781288 ?auto_781298 ) ) ( not ( = ?auto_781289 ?auto_781290 ) ) ( not ( = ?auto_781289 ?auto_781291 ) ) ( not ( = ?auto_781289 ?auto_781292 ) ) ( not ( = ?auto_781289 ?auto_781293 ) ) ( not ( = ?auto_781289 ?auto_781294 ) ) ( not ( = ?auto_781289 ?auto_781295 ) ) ( not ( = ?auto_781289 ?auto_781296 ) ) ( not ( = ?auto_781289 ?auto_781297 ) ) ( not ( = ?auto_781289 ?auto_781298 ) ) ( not ( = ?auto_781290 ?auto_781291 ) ) ( not ( = ?auto_781290 ?auto_781292 ) ) ( not ( = ?auto_781290 ?auto_781293 ) ) ( not ( = ?auto_781290 ?auto_781294 ) ) ( not ( = ?auto_781290 ?auto_781295 ) ) ( not ( = ?auto_781290 ?auto_781296 ) ) ( not ( = ?auto_781290 ?auto_781297 ) ) ( not ( = ?auto_781290 ?auto_781298 ) ) ( not ( = ?auto_781291 ?auto_781292 ) ) ( not ( = ?auto_781291 ?auto_781293 ) ) ( not ( = ?auto_781291 ?auto_781294 ) ) ( not ( = ?auto_781291 ?auto_781295 ) ) ( not ( = ?auto_781291 ?auto_781296 ) ) ( not ( = ?auto_781291 ?auto_781297 ) ) ( not ( = ?auto_781291 ?auto_781298 ) ) ( not ( = ?auto_781292 ?auto_781293 ) ) ( not ( = ?auto_781292 ?auto_781294 ) ) ( not ( = ?auto_781292 ?auto_781295 ) ) ( not ( = ?auto_781292 ?auto_781296 ) ) ( not ( = ?auto_781292 ?auto_781297 ) ) ( not ( = ?auto_781292 ?auto_781298 ) ) ( not ( = ?auto_781293 ?auto_781294 ) ) ( not ( = ?auto_781293 ?auto_781295 ) ) ( not ( = ?auto_781293 ?auto_781296 ) ) ( not ( = ?auto_781293 ?auto_781297 ) ) ( not ( = ?auto_781293 ?auto_781298 ) ) ( not ( = ?auto_781294 ?auto_781295 ) ) ( not ( = ?auto_781294 ?auto_781296 ) ) ( not ( = ?auto_781294 ?auto_781297 ) ) ( not ( = ?auto_781294 ?auto_781298 ) ) ( not ( = ?auto_781295 ?auto_781296 ) ) ( not ( = ?auto_781295 ?auto_781297 ) ) ( not ( = ?auto_781295 ?auto_781298 ) ) ( not ( = ?auto_781296 ?auto_781297 ) ) ( not ( = ?auto_781296 ?auto_781298 ) ) ( not ( = ?auto_781297 ?auto_781298 ) ) ( ON ?auto_781296 ?auto_781297 ) ( CLEAR ?auto_781294 ) ( ON ?auto_781295 ?auto_781296 ) ( CLEAR ?auto_781295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_781281 ?auto_781282 ?auto_781283 ?auto_781284 ?auto_781285 ?auto_781286 ?auto_781287 ?auto_781288 ?auto_781289 ?auto_781290 ?auto_781291 ?auto_781292 ?auto_781293 ?auto_781294 ?auto_781295 )
      ( MAKE-17PILE ?auto_781281 ?auto_781282 ?auto_781283 ?auto_781284 ?auto_781285 ?auto_781286 ?auto_781287 ?auto_781288 ?auto_781289 ?auto_781290 ?auto_781291 ?auto_781292 ?auto_781293 ?auto_781294 ?auto_781295 ?auto_781296 ?auto_781297 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_781351 - BLOCK
      ?auto_781352 - BLOCK
      ?auto_781353 - BLOCK
      ?auto_781354 - BLOCK
      ?auto_781355 - BLOCK
      ?auto_781356 - BLOCK
      ?auto_781357 - BLOCK
      ?auto_781358 - BLOCK
      ?auto_781359 - BLOCK
      ?auto_781360 - BLOCK
      ?auto_781361 - BLOCK
      ?auto_781362 - BLOCK
      ?auto_781363 - BLOCK
      ?auto_781364 - BLOCK
      ?auto_781365 - BLOCK
      ?auto_781366 - BLOCK
      ?auto_781367 - BLOCK
    )
    :vars
    (
      ?auto_781368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_781367 ?auto_781368 ) ( ON-TABLE ?auto_781351 ) ( ON ?auto_781352 ?auto_781351 ) ( ON ?auto_781353 ?auto_781352 ) ( ON ?auto_781354 ?auto_781353 ) ( ON ?auto_781355 ?auto_781354 ) ( ON ?auto_781356 ?auto_781355 ) ( ON ?auto_781357 ?auto_781356 ) ( ON ?auto_781358 ?auto_781357 ) ( ON ?auto_781359 ?auto_781358 ) ( ON ?auto_781360 ?auto_781359 ) ( ON ?auto_781361 ?auto_781360 ) ( ON ?auto_781362 ?auto_781361 ) ( ON ?auto_781363 ?auto_781362 ) ( not ( = ?auto_781351 ?auto_781352 ) ) ( not ( = ?auto_781351 ?auto_781353 ) ) ( not ( = ?auto_781351 ?auto_781354 ) ) ( not ( = ?auto_781351 ?auto_781355 ) ) ( not ( = ?auto_781351 ?auto_781356 ) ) ( not ( = ?auto_781351 ?auto_781357 ) ) ( not ( = ?auto_781351 ?auto_781358 ) ) ( not ( = ?auto_781351 ?auto_781359 ) ) ( not ( = ?auto_781351 ?auto_781360 ) ) ( not ( = ?auto_781351 ?auto_781361 ) ) ( not ( = ?auto_781351 ?auto_781362 ) ) ( not ( = ?auto_781351 ?auto_781363 ) ) ( not ( = ?auto_781351 ?auto_781364 ) ) ( not ( = ?auto_781351 ?auto_781365 ) ) ( not ( = ?auto_781351 ?auto_781366 ) ) ( not ( = ?auto_781351 ?auto_781367 ) ) ( not ( = ?auto_781351 ?auto_781368 ) ) ( not ( = ?auto_781352 ?auto_781353 ) ) ( not ( = ?auto_781352 ?auto_781354 ) ) ( not ( = ?auto_781352 ?auto_781355 ) ) ( not ( = ?auto_781352 ?auto_781356 ) ) ( not ( = ?auto_781352 ?auto_781357 ) ) ( not ( = ?auto_781352 ?auto_781358 ) ) ( not ( = ?auto_781352 ?auto_781359 ) ) ( not ( = ?auto_781352 ?auto_781360 ) ) ( not ( = ?auto_781352 ?auto_781361 ) ) ( not ( = ?auto_781352 ?auto_781362 ) ) ( not ( = ?auto_781352 ?auto_781363 ) ) ( not ( = ?auto_781352 ?auto_781364 ) ) ( not ( = ?auto_781352 ?auto_781365 ) ) ( not ( = ?auto_781352 ?auto_781366 ) ) ( not ( = ?auto_781352 ?auto_781367 ) ) ( not ( = ?auto_781352 ?auto_781368 ) ) ( not ( = ?auto_781353 ?auto_781354 ) ) ( not ( = ?auto_781353 ?auto_781355 ) ) ( not ( = ?auto_781353 ?auto_781356 ) ) ( not ( = ?auto_781353 ?auto_781357 ) ) ( not ( = ?auto_781353 ?auto_781358 ) ) ( not ( = ?auto_781353 ?auto_781359 ) ) ( not ( = ?auto_781353 ?auto_781360 ) ) ( not ( = ?auto_781353 ?auto_781361 ) ) ( not ( = ?auto_781353 ?auto_781362 ) ) ( not ( = ?auto_781353 ?auto_781363 ) ) ( not ( = ?auto_781353 ?auto_781364 ) ) ( not ( = ?auto_781353 ?auto_781365 ) ) ( not ( = ?auto_781353 ?auto_781366 ) ) ( not ( = ?auto_781353 ?auto_781367 ) ) ( not ( = ?auto_781353 ?auto_781368 ) ) ( not ( = ?auto_781354 ?auto_781355 ) ) ( not ( = ?auto_781354 ?auto_781356 ) ) ( not ( = ?auto_781354 ?auto_781357 ) ) ( not ( = ?auto_781354 ?auto_781358 ) ) ( not ( = ?auto_781354 ?auto_781359 ) ) ( not ( = ?auto_781354 ?auto_781360 ) ) ( not ( = ?auto_781354 ?auto_781361 ) ) ( not ( = ?auto_781354 ?auto_781362 ) ) ( not ( = ?auto_781354 ?auto_781363 ) ) ( not ( = ?auto_781354 ?auto_781364 ) ) ( not ( = ?auto_781354 ?auto_781365 ) ) ( not ( = ?auto_781354 ?auto_781366 ) ) ( not ( = ?auto_781354 ?auto_781367 ) ) ( not ( = ?auto_781354 ?auto_781368 ) ) ( not ( = ?auto_781355 ?auto_781356 ) ) ( not ( = ?auto_781355 ?auto_781357 ) ) ( not ( = ?auto_781355 ?auto_781358 ) ) ( not ( = ?auto_781355 ?auto_781359 ) ) ( not ( = ?auto_781355 ?auto_781360 ) ) ( not ( = ?auto_781355 ?auto_781361 ) ) ( not ( = ?auto_781355 ?auto_781362 ) ) ( not ( = ?auto_781355 ?auto_781363 ) ) ( not ( = ?auto_781355 ?auto_781364 ) ) ( not ( = ?auto_781355 ?auto_781365 ) ) ( not ( = ?auto_781355 ?auto_781366 ) ) ( not ( = ?auto_781355 ?auto_781367 ) ) ( not ( = ?auto_781355 ?auto_781368 ) ) ( not ( = ?auto_781356 ?auto_781357 ) ) ( not ( = ?auto_781356 ?auto_781358 ) ) ( not ( = ?auto_781356 ?auto_781359 ) ) ( not ( = ?auto_781356 ?auto_781360 ) ) ( not ( = ?auto_781356 ?auto_781361 ) ) ( not ( = ?auto_781356 ?auto_781362 ) ) ( not ( = ?auto_781356 ?auto_781363 ) ) ( not ( = ?auto_781356 ?auto_781364 ) ) ( not ( = ?auto_781356 ?auto_781365 ) ) ( not ( = ?auto_781356 ?auto_781366 ) ) ( not ( = ?auto_781356 ?auto_781367 ) ) ( not ( = ?auto_781356 ?auto_781368 ) ) ( not ( = ?auto_781357 ?auto_781358 ) ) ( not ( = ?auto_781357 ?auto_781359 ) ) ( not ( = ?auto_781357 ?auto_781360 ) ) ( not ( = ?auto_781357 ?auto_781361 ) ) ( not ( = ?auto_781357 ?auto_781362 ) ) ( not ( = ?auto_781357 ?auto_781363 ) ) ( not ( = ?auto_781357 ?auto_781364 ) ) ( not ( = ?auto_781357 ?auto_781365 ) ) ( not ( = ?auto_781357 ?auto_781366 ) ) ( not ( = ?auto_781357 ?auto_781367 ) ) ( not ( = ?auto_781357 ?auto_781368 ) ) ( not ( = ?auto_781358 ?auto_781359 ) ) ( not ( = ?auto_781358 ?auto_781360 ) ) ( not ( = ?auto_781358 ?auto_781361 ) ) ( not ( = ?auto_781358 ?auto_781362 ) ) ( not ( = ?auto_781358 ?auto_781363 ) ) ( not ( = ?auto_781358 ?auto_781364 ) ) ( not ( = ?auto_781358 ?auto_781365 ) ) ( not ( = ?auto_781358 ?auto_781366 ) ) ( not ( = ?auto_781358 ?auto_781367 ) ) ( not ( = ?auto_781358 ?auto_781368 ) ) ( not ( = ?auto_781359 ?auto_781360 ) ) ( not ( = ?auto_781359 ?auto_781361 ) ) ( not ( = ?auto_781359 ?auto_781362 ) ) ( not ( = ?auto_781359 ?auto_781363 ) ) ( not ( = ?auto_781359 ?auto_781364 ) ) ( not ( = ?auto_781359 ?auto_781365 ) ) ( not ( = ?auto_781359 ?auto_781366 ) ) ( not ( = ?auto_781359 ?auto_781367 ) ) ( not ( = ?auto_781359 ?auto_781368 ) ) ( not ( = ?auto_781360 ?auto_781361 ) ) ( not ( = ?auto_781360 ?auto_781362 ) ) ( not ( = ?auto_781360 ?auto_781363 ) ) ( not ( = ?auto_781360 ?auto_781364 ) ) ( not ( = ?auto_781360 ?auto_781365 ) ) ( not ( = ?auto_781360 ?auto_781366 ) ) ( not ( = ?auto_781360 ?auto_781367 ) ) ( not ( = ?auto_781360 ?auto_781368 ) ) ( not ( = ?auto_781361 ?auto_781362 ) ) ( not ( = ?auto_781361 ?auto_781363 ) ) ( not ( = ?auto_781361 ?auto_781364 ) ) ( not ( = ?auto_781361 ?auto_781365 ) ) ( not ( = ?auto_781361 ?auto_781366 ) ) ( not ( = ?auto_781361 ?auto_781367 ) ) ( not ( = ?auto_781361 ?auto_781368 ) ) ( not ( = ?auto_781362 ?auto_781363 ) ) ( not ( = ?auto_781362 ?auto_781364 ) ) ( not ( = ?auto_781362 ?auto_781365 ) ) ( not ( = ?auto_781362 ?auto_781366 ) ) ( not ( = ?auto_781362 ?auto_781367 ) ) ( not ( = ?auto_781362 ?auto_781368 ) ) ( not ( = ?auto_781363 ?auto_781364 ) ) ( not ( = ?auto_781363 ?auto_781365 ) ) ( not ( = ?auto_781363 ?auto_781366 ) ) ( not ( = ?auto_781363 ?auto_781367 ) ) ( not ( = ?auto_781363 ?auto_781368 ) ) ( not ( = ?auto_781364 ?auto_781365 ) ) ( not ( = ?auto_781364 ?auto_781366 ) ) ( not ( = ?auto_781364 ?auto_781367 ) ) ( not ( = ?auto_781364 ?auto_781368 ) ) ( not ( = ?auto_781365 ?auto_781366 ) ) ( not ( = ?auto_781365 ?auto_781367 ) ) ( not ( = ?auto_781365 ?auto_781368 ) ) ( not ( = ?auto_781366 ?auto_781367 ) ) ( not ( = ?auto_781366 ?auto_781368 ) ) ( not ( = ?auto_781367 ?auto_781368 ) ) ( ON ?auto_781366 ?auto_781367 ) ( ON ?auto_781365 ?auto_781366 ) ( CLEAR ?auto_781363 ) ( ON ?auto_781364 ?auto_781365 ) ( CLEAR ?auto_781364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_781351 ?auto_781352 ?auto_781353 ?auto_781354 ?auto_781355 ?auto_781356 ?auto_781357 ?auto_781358 ?auto_781359 ?auto_781360 ?auto_781361 ?auto_781362 ?auto_781363 ?auto_781364 )
      ( MAKE-17PILE ?auto_781351 ?auto_781352 ?auto_781353 ?auto_781354 ?auto_781355 ?auto_781356 ?auto_781357 ?auto_781358 ?auto_781359 ?auto_781360 ?auto_781361 ?auto_781362 ?auto_781363 ?auto_781364 ?auto_781365 ?auto_781366 ?auto_781367 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_781421 - BLOCK
      ?auto_781422 - BLOCK
      ?auto_781423 - BLOCK
      ?auto_781424 - BLOCK
      ?auto_781425 - BLOCK
      ?auto_781426 - BLOCK
      ?auto_781427 - BLOCK
      ?auto_781428 - BLOCK
      ?auto_781429 - BLOCK
      ?auto_781430 - BLOCK
      ?auto_781431 - BLOCK
      ?auto_781432 - BLOCK
      ?auto_781433 - BLOCK
      ?auto_781434 - BLOCK
      ?auto_781435 - BLOCK
      ?auto_781436 - BLOCK
      ?auto_781437 - BLOCK
    )
    :vars
    (
      ?auto_781438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_781437 ?auto_781438 ) ( ON-TABLE ?auto_781421 ) ( ON ?auto_781422 ?auto_781421 ) ( ON ?auto_781423 ?auto_781422 ) ( ON ?auto_781424 ?auto_781423 ) ( ON ?auto_781425 ?auto_781424 ) ( ON ?auto_781426 ?auto_781425 ) ( ON ?auto_781427 ?auto_781426 ) ( ON ?auto_781428 ?auto_781427 ) ( ON ?auto_781429 ?auto_781428 ) ( ON ?auto_781430 ?auto_781429 ) ( ON ?auto_781431 ?auto_781430 ) ( ON ?auto_781432 ?auto_781431 ) ( not ( = ?auto_781421 ?auto_781422 ) ) ( not ( = ?auto_781421 ?auto_781423 ) ) ( not ( = ?auto_781421 ?auto_781424 ) ) ( not ( = ?auto_781421 ?auto_781425 ) ) ( not ( = ?auto_781421 ?auto_781426 ) ) ( not ( = ?auto_781421 ?auto_781427 ) ) ( not ( = ?auto_781421 ?auto_781428 ) ) ( not ( = ?auto_781421 ?auto_781429 ) ) ( not ( = ?auto_781421 ?auto_781430 ) ) ( not ( = ?auto_781421 ?auto_781431 ) ) ( not ( = ?auto_781421 ?auto_781432 ) ) ( not ( = ?auto_781421 ?auto_781433 ) ) ( not ( = ?auto_781421 ?auto_781434 ) ) ( not ( = ?auto_781421 ?auto_781435 ) ) ( not ( = ?auto_781421 ?auto_781436 ) ) ( not ( = ?auto_781421 ?auto_781437 ) ) ( not ( = ?auto_781421 ?auto_781438 ) ) ( not ( = ?auto_781422 ?auto_781423 ) ) ( not ( = ?auto_781422 ?auto_781424 ) ) ( not ( = ?auto_781422 ?auto_781425 ) ) ( not ( = ?auto_781422 ?auto_781426 ) ) ( not ( = ?auto_781422 ?auto_781427 ) ) ( not ( = ?auto_781422 ?auto_781428 ) ) ( not ( = ?auto_781422 ?auto_781429 ) ) ( not ( = ?auto_781422 ?auto_781430 ) ) ( not ( = ?auto_781422 ?auto_781431 ) ) ( not ( = ?auto_781422 ?auto_781432 ) ) ( not ( = ?auto_781422 ?auto_781433 ) ) ( not ( = ?auto_781422 ?auto_781434 ) ) ( not ( = ?auto_781422 ?auto_781435 ) ) ( not ( = ?auto_781422 ?auto_781436 ) ) ( not ( = ?auto_781422 ?auto_781437 ) ) ( not ( = ?auto_781422 ?auto_781438 ) ) ( not ( = ?auto_781423 ?auto_781424 ) ) ( not ( = ?auto_781423 ?auto_781425 ) ) ( not ( = ?auto_781423 ?auto_781426 ) ) ( not ( = ?auto_781423 ?auto_781427 ) ) ( not ( = ?auto_781423 ?auto_781428 ) ) ( not ( = ?auto_781423 ?auto_781429 ) ) ( not ( = ?auto_781423 ?auto_781430 ) ) ( not ( = ?auto_781423 ?auto_781431 ) ) ( not ( = ?auto_781423 ?auto_781432 ) ) ( not ( = ?auto_781423 ?auto_781433 ) ) ( not ( = ?auto_781423 ?auto_781434 ) ) ( not ( = ?auto_781423 ?auto_781435 ) ) ( not ( = ?auto_781423 ?auto_781436 ) ) ( not ( = ?auto_781423 ?auto_781437 ) ) ( not ( = ?auto_781423 ?auto_781438 ) ) ( not ( = ?auto_781424 ?auto_781425 ) ) ( not ( = ?auto_781424 ?auto_781426 ) ) ( not ( = ?auto_781424 ?auto_781427 ) ) ( not ( = ?auto_781424 ?auto_781428 ) ) ( not ( = ?auto_781424 ?auto_781429 ) ) ( not ( = ?auto_781424 ?auto_781430 ) ) ( not ( = ?auto_781424 ?auto_781431 ) ) ( not ( = ?auto_781424 ?auto_781432 ) ) ( not ( = ?auto_781424 ?auto_781433 ) ) ( not ( = ?auto_781424 ?auto_781434 ) ) ( not ( = ?auto_781424 ?auto_781435 ) ) ( not ( = ?auto_781424 ?auto_781436 ) ) ( not ( = ?auto_781424 ?auto_781437 ) ) ( not ( = ?auto_781424 ?auto_781438 ) ) ( not ( = ?auto_781425 ?auto_781426 ) ) ( not ( = ?auto_781425 ?auto_781427 ) ) ( not ( = ?auto_781425 ?auto_781428 ) ) ( not ( = ?auto_781425 ?auto_781429 ) ) ( not ( = ?auto_781425 ?auto_781430 ) ) ( not ( = ?auto_781425 ?auto_781431 ) ) ( not ( = ?auto_781425 ?auto_781432 ) ) ( not ( = ?auto_781425 ?auto_781433 ) ) ( not ( = ?auto_781425 ?auto_781434 ) ) ( not ( = ?auto_781425 ?auto_781435 ) ) ( not ( = ?auto_781425 ?auto_781436 ) ) ( not ( = ?auto_781425 ?auto_781437 ) ) ( not ( = ?auto_781425 ?auto_781438 ) ) ( not ( = ?auto_781426 ?auto_781427 ) ) ( not ( = ?auto_781426 ?auto_781428 ) ) ( not ( = ?auto_781426 ?auto_781429 ) ) ( not ( = ?auto_781426 ?auto_781430 ) ) ( not ( = ?auto_781426 ?auto_781431 ) ) ( not ( = ?auto_781426 ?auto_781432 ) ) ( not ( = ?auto_781426 ?auto_781433 ) ) ( not ( = ?auto_781426 ?auto_781434 ) ) ( not ( = ?auto_781426 ?auto_781435 ) ) ( not ( = ?auto_781426 ?auto_781436 ) ) ( not ( = ?auto_781426 ?auto_781437 ) ) ( not ( = ?auto_781426 ?auto_781438 ) ) ( not ( = ?auto_781427 ?auto_781428 ) ) ( not ( = ?auto_781427 ?auto_781429 ) ) ( not ( = ?auto_781427 ?auto_781430 ) ) ( not ( = ?auto_781427 ?auto_781431 ) ) ( not ( = ?auto_781427 ?auto_781432 ) ) ( not ( = ?auto_781427 ?auto_781433 ) ) ( not ( = ?auto_781427 ?auto_781434 ) ) ( not ( = ?auto_781427 ?auto_781435 ) ) ( not ( = ?auto_781427 ?auto_781436 ) ) ( not ( = ?auto_781427 ?auto_781437 ) ) ( not ( = ?auto_781427 ?auto_781438 ) ) ( not ( = ?auto_781428 ?auto_781429 ) ) ( not ( = ?auto_781428 ?auto_781430 ) ) ( not ( = ?auto_781428 ?auto_781431 ) ) ( not ( = ?auto_781428 ?auto_781432 ) ) ( not ( = ?auto_781428 ?auto_781433 ) ) ( not ( = ?auto_781428 ?auto_781434 ) ) ( not ( = ?auto_781428 ?auto_781435 ) ) ( not ( = ?auto_781428 ?auto_781436 ) ) ( not ( = ?auto_781428 ?auto_781437 ) ) ( not ( = ?auto_781428 ?auto_781438 ) ) ( not ( = ?auto_781429 ?auto_781430 ) ) ( not ( = ?auto_781429 ?auto_781431 ) ) ( not ( = ?auto_781429 ?auto_781432 ) ) ( not ( = ?auto_781429 ?auto_781433 ) ) ( not ( = ?auto_781429 ?auto_781434 ) ) ( not ( = ?auto_781429 ?auto_781435 ) ) ( not ( = ?auto_781429 ?auto_781436 ) ) ( not ( = ?auto_781429 ?auto_781437 ) ) ( not ( = ?auto_781429 ?auto_781438 ) ) ( not ( = ?auto_781430 ?auto_781431 ) ) ( not ( = ?auto_781430 ?auto_781432 ) ) ( not ( = ?auto_781430 ?auto_781433 ) ) ( not ( = ?auto_781430 ?auto_781434 ) ) ( not ( = ?auto_781430 ?auto_781435 ) ) ( not ( = ?auto_781430 ?auto_781436 ) ) ( not ( = ?auto_781430 ?auto_781437 ) ) ( not ( = ?auto_781430 ?auto_781438 ) ) ( not ( = ?auto_781431 ?auto_781432 ) ) ( not ( = ?auto_781431 ?auto_781433 ) ) ( not ( = ?auto_781431 ?auto_781434 ) ) ( not ( = ?auto_781431 ?auto_781435 ) ) ( not ( = ?auto_781431 ?auto_781436 ) ) ( not ( = ?auto_781431 ?auto_781437 ) ) ( not ( = ?auto_781431 ?auto_781438 ) ) ( not ( = ?auto_781432 ?auto_781433 ) ) ( not ( = ?auto_781432 ?auto_781434 ) ) ( not ( = ?auto_781432 ?auto_781435 ) ) ( not ( = ?auto_781432 ?auto_781436 ) ) ( not ( = ?auto_781432 ?auto_781437 ) ) ( not ( = ?auto_781432 ?auto_781438 ) ) ( not ( = ?auto_781433 ?auto_781434 ) ) ( not ( = ?auto_781433 ?auto_781435 ) ) ( not ( = ?auto_781433 ?auto_781436 ) ) ( not ( = ?auto_781433 ?auto_781437 ) ) ( not ( = ?auto_781433 ?auto_781438 ) ) ( not ( = ?auto_781434 ?auto_781435 ) ) ( not ( = ?auto_781434 ?auto_781436 ) ) ( not ( = ?auto_781434 ?auto_781437 ) ) ( not ( = ?auto_781434 ?auto_781438 ) ) ( not ( = ?auto_781435 ?auto_781436 ) ) ( not ( = ?auto_781435 ?auto_781437 ) ) ( not ( = ?auto_781435 ?auto_781438 ) ) ( not ( = ?auto_781436 ?auto_781437 ) ) ( not ( = ?auto_781436 ?auto_781438 ) ) ( not ( = ?auto_781437 ?auto_781438 ) ) ( ON ?auto_781436 ?auto_781437 ) ( ON ?auto_781435 ?auto_781436 ) ( ON ?auto_781434 ?auto_781435 ) ( CLEAR ?auto_781432 ) ( ON ?auto_781433 ?auto_781434 ) ( CLEAR ?auto_781433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_781421 ?auto_781422 ?auto_781423 ?auto_781424 ?auto_781425 ?auto_781426 ?auto_781427 ?auto_781428 ?auto_781429 ?auto_781430 ?auto_781431 ?auto_781432 ?auto_781433 )
      ( MAKE-17PILE ?auto_781421 ?auto_781422 ?auto_781423 ?auto_781424 ?auto_781425 ?auto_781426 ?auto_781427 ?auto_781428 ?auto_781429 ?auto_781430 ?auto_781431 ?auto_781432 ?auto_781433 ?auto_781434 ?auto_781435 ?auto_781436 ?auto_781437 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_781491 - BLOCK
      ?auto_781492 - BLOCK
      ?auto_781493 - BLOCK
      ?auto_781494 - BLOCK
      ?auto_781495 - BLOCK
      ?auto_781496 - BLOCK
      ?auto_781497 - BLOCK
      ?auto_781498 - BLOCK
      ?auto_781499 - BLOCK
      ?auto_781500 - BLOCK
      ?auto_781501 - BLOCK
      ?auto_781502 - BLOCK
      ?auto_781503 - BLOCK
      ?auto_781504 - BLOCK
      ?auto_781505 - BLOCK
      ?auto_781506 - BLOCK
      ?auto_781507 - BLOCK
    )
    :vars
    (
      ?auto_781508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_781507 ?auto_781508 ) ( ON-TABLE ?auto_781491 ) ( ON ?auto_781492 ?auto_781491 ) ( ON ?auto_781493 ?auto_781492 ) ( ON ?auto_781494 ?auto_781493 ) ( ON ?auto_781495 ?auto_781494 ) ( ON ?auto_781496 ?auto_781495 ) ( ON ?auto_781497 ?auto_781496 ) ( ON ?auto_781498 ?auto_781497 ) ( ON ?auto_781499 ?auto_781498 ) ( ON ?auto_781500 ?auto_781499 ) ( ON ?auto_781501 ?auto_781500 ) ( not ( = ?auto_781491 ?auto_781492 ) ) ( not ( = ?auto_781491 ?auto_781493 ) ) ( not ( = ?auto_781491 ?auto_781494 ) ) ( not ( = ?auto_781491 ?auto_781495 ) ) ( not ( = ?auto_781491 ?auto_781496 ) ) ( not ( = ?auto_781491 ?auto_781497 ) ) ( not ( = ?auto_781491 ?auto_781498 ) ) ( not ( = ?auto_781491 ?auto_781499 ) ) ( not ( = ?auto_781491 ?auto_781500 ) ) ( not ( = ?auto_781491 ?auto_781501 ) ) ( not ( = ?auto_781491 ?auto_781502 ) ) ( not ( = ?auto_781491 ?auto_781503 ) ) ( not ( = ?auto_781491 ?auto_781504 ) ) ( not ( = ?auto_781491 ?auto_781505 ) ) ( not ( = ?auto_781491 ?auto_781506 ) ) ( not ( = ?auto_781491 ?auto_781507 ) ) ( not ( = ?auto_781491 ?auto_781508 ) ) ( not ( = ?auto_781492 ?auto_781493 ) ) ( not ( = ?auto_781492 ?auto_781494 ) ) ( not ( = ?auto_781492 ?auto_781495 ) ) ( not ( = ?auto_781492 ?auto_781496 ) ) ( not ( = ?auto_781492 ?auto_781497 ) ) ( not ( = ?auto_781492 ?auto_781498 ) ) ( not ( = ?auto_781492 ?auto_781499 ) ) ( not ( = ?auto_781492 ?auto_781500 ) ) ( not ( = ?auto_781492 ?auto_781501 ) ) ( not ( = ?auto_781492 ?auto_781502 ) ) ( not ( = ?auto_781492 ?auto_781503 ) ) ( not ( = ?auto_781492 ?auto_781504 ) ) ( not ( = ?auto_781492 ?auto_781505 ) ) ( not ( = ?auto_781492 ?auto_781506 ) ) ( not ( = ?auto_781492 ?auto_781507 ) ) ( not ( = ?auto_781492 ?auto_781508 ) ) ( not ( = ?auto_781493 ?auto_781494 ) ) ( not ( = ?auto_781493 ?auto_781495 ) ) ( not ( = ?auto_781493 ?auto_781496 ) ) ( not ( = ?auto_781493 ?auto_781497 ) ) ( not ( = ?auto_781493 ?auto_781498 ) ) ( not ( = ?auto_781493 ?auto_781499 ) ) ( not ( = ?auto_781493 ?auto_781500 ) ) ( not ( = ?auto_781493 ?auto_781501 ) ) ( not ( = ?auto_781493 ?auto_781502 ) ) ( not ( = ?auto_781493 ?auto_781503 ) ) ( not ( = ?auto_781493 ?auto_781504 ) ) ( not ( = ?auto_781493 ?auto_781505 ) ) ( not ( = ?auto_781493 ?auto_781506 ) ) ( not ( = ?auto_781493 ?auto_781507 ) ) ( not ( = ?auto_781493 ?auto_781508 ) ) ( not ( = ?auto_781494 ?auto_781495 ) ) ( not ( = ?auto_781494 ?auto_781496 ) ) ( not ( = ?auto_781494 ?auto_781497 ) ) ( not ( = ?auto_781494 ?auto_781498 ) ) ( not ( = ?auto_781494 ?auto_781499 ) ) ( not ( = ?auto_781494 ?auto_781500 ) ) ( not ( = ?auto_781494 ?auto_781501 ) ) ( not ( = ?auto_781494 ?auto_781502 ) ) ( not ( = ?auto_781494 ?auto_781503 ) ) ( not ( = ?auto_781494 ?auto_781504 ) ) ( not ( = ?auto_781494 ?auto_781505 ) ) ( not ( = ?auto_781494 ?auto_781506 ) ) ( not ( = ?auto_781494 ?auto_781507 ) ) ( not ( = ?auto_781494 ?auto_781508 ) ) ( not ( = ?auto_781495 ?auto_781496 ) ) ( not ( = ?auto_781495 ?auto_781497 ) ) ( not ( = ?auto_781495 ?auto_781498 ) ) ( not ( = ?auto_781495 ?auto_781499 ) ) ( not ( = ?auto_781495 ?auto_781500 ) ) ( not ( = ?auto_781495 ?auto_781501 ) ) ( not ( = ?auto_781495 ?auto_781502 ) ) ( not ( = ?auto_781495 ?auto_781503 ) ) ( not ( = ?auto_781495 ?auto_781504 ) ) ( not ( = ?auto_781495 ?auto_781505 ) ) ( not ( = ?auto_781495 ?auto_781506 ) ) ( not ( = ?auto_781495 ?auto_781507 ) ) ( not ( = ?auto_781495 ?auto_781508 ) ) ( not ( = ?auto_781496 ?auto_781497 ) ) ( not ( = ?auto_781496 ?auto_781498 ) ) ( not ( = ?auto_781496 ?auto_781499 ) ) ( not ( = ?auto_781496 ?auto_781500 ) ) ( not ( = ?auto_781496 ?auto_781501 ) ) ( not ( = ?auto_781496 ?auto_781502 ) ) ( not ( = ?auto_781496 ?auto_781503 ) ) ( not ( = ?auto_781496 ?auto_781504 ) ) ( not ( = ?auto_781496 ?auto_781505 ) ) ( not ( = ?auto_781496 ?auto_781506 ) ) ( not ( = ?auto_781496 ?auto_781507 ) ) ( not ( = ?auto_781496 ?auto_781508 ) ) ( not ( = ?auto_781497 ?auto_781498 ) ) ( not ( = ?auto_781497 ?auto_781499 ) ) ( not ( = ?auto_781497 ?auto_781500 ) ) ( not ( = ?auto_781497 ?auto_781501 ) ) ( not ( = ?auto_781497 ?auto_781502 ) ) ( not ( = ?auto_781497 ?auto_781503 ) ) ( not ( = ?auto_781497 ?auto_781504 ) ) ( not ( = ?auto_781497 ?auto_781505 ) ) ( not ( = ?auto_781497 ?auto_781506 ) ) ( not ( = ?auto_781497 ?auto_781507 ) ) ( not ( = ?auto_781497 ?auto_781508 ) ) ( not ( = ?auto_781498 ?auto_781499 ) ) ( not ( = ?auto_781498 ?auto_781500 ) ) ( not ( = ?auto_781498 ?auto_781501 ) ) ( not ( = ?auto_781498 ?auto_781502 ) ) ( not ( = ?auto_781498 ?auto_781503 ) ) ( not ( = ?auto_781498 ?auto_781504 ) ) ( not ( = ?auto_781498 ?auto_781505 ) ) ( not ( = ?auto_781498 ?auto_781506 ) ) ( not ( = ?auto_781498 ?auto_781507 ) ) ( not ( = ?auto_781498 ?auto_781508 ) ) ( not ( = ?auto_781499 ?auto_781500 ) ) ( not ( = ?auto_781499 ?auto_781501 ) ) ( not ( = ?auto_781499 ?auto_781502 ) ) ( not ( = ?auto_781499 ?auto_781503 ) ) ( not ( = ?auto_781499 ?auto_781504 ) ) ( not ( = ?auto_781499 ?auto_781505 ) ) ( not ( = ?auto_781499 ?auto_781506 ) ) ( not ( = ?auto_781499 ?auto_781507 ) ) ( not ( = ?auto_781499 ?auto_781508 ) ) ( not ( = ?auto_781500 ?auto_781501 ) ) ( not ( = ?auto_781500 ?auto_781502 ) ) ( not ( = ?auto_781500 ?auto_781503 ) ) ( not ( = ?auto_781500 ?auto_781504 ) ) ( not ( = ?auto_781500 ?auto_781505 ) ) ( not ( = ?auto_781500 ?auto_781506 ) ) ( not ( = ?auto_781500 ?auto_781507 ) ) ( not ( = ?auto_781500 ?auto_781508 ) ) ( not ( = ?auto_781501 ?auto_781502 ) ) ( not ( = ?auto_781501 ?auto_781503 ) ) ( not ( = ?auto_781501 ?auto_781504 ) ) ( not ( = ?auto_781501 ?auto_781505 ) ) ( not ( = ?auto_781501 ?auto_781506 ) ) ( not ( = ?auto_781501 ?auto_781507 ) ) ( not ( = ?auto_781501 ?auto_781508 ) ) ( not ( = ?auto_781502 ?auto_781503 ) ) ( not ( = ?auto_781502 ?auto_781504 ) ) ( not ( = ?auto_781502 ?auto_781505 ) ) ( not ( = ?auto_781502 ?auto_781506 ) ) ( not ( = ?auto_781502 ?auto_781507 ) ) ( not ( = ?auto_781502 ?auto_781508 ) ) ( not ( = ?auto_781503 ?auto_781504 ) ) ( not ( = ?auto_781503 ?auto_781505 ) ) ( not ( = ?auto_781503 ?auto_781506 ) ) ( not ( = ?auto_781503 ?auto_781507 ) ) ( not ( = ?auto_781503 ?auto_781508 ) ) ( not ( = ?auto_781504 ?auto_781505 ) ) ( not ( = ?auto_781504 ?auto_781506 ) ) ( not ( = ?auto_781504 ?auto_781507 ) ) ( not ( = ?auto_781504 ?auto_781508 ) ) ( not ( = ?auto_781505 ?auto_781506 ) ) ( not ( = ?auto_781505 ?auto_781507 ) ) ( not ( = ?auto_781505 ?auto_781508 ) ) ( not ( = ?auto_781506 ?auto_781507 ) ) ( not ( = ?auto_781506 ?auto_781508 ) ) ( not ( = ?auto_781507 ?auto_781508 ) ) ( ON ?auto_781506 ?auto_781507 ) ( ON ?auto_781505 ?auto_781506 ) ( ON ?auto_781504 ?auto_781505 ) ( ON ?auto_781503 ?auto_781504 ) ( CLEAR ?auto_781501 ) ( ON ?auto_781502 ?auto_781503 ) ( CLEAR ?auto_781502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_781491 ?auto_781492 ?auto_781493 ?auto_781494 ?auto_781495 ?auto_781496 ?auto_781497 ?auto_781498 ?auto_781499 ?auto_781500 ?auto_781501 ?auto_781502 )
      ( MAKE-17PILE ?auto_781491 ?auto_781492 ?auto_781493 ?auto_781494 ?auto_781495 ?auto_781496 ?auto_781497 ?auto_781498 ?auto_781499 ?auto_781500 ?auto_781501 ?auto_781502 ?auto_781503 ?auto_781504 ?auto_781505 ?auto_781506 ?auto_781507 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_781561 - BLOCK
      ?auto_781562 - BLOCK
      ?auto_781563 - BLOCK
      ?auto_781564 - BLOCK
      ?auto_781565 - BLOCK
      ?auto_781566 - BLOCK
      ?auto_781567 - BLOCK
      ?auto_781568 - BLOCK
      ?auto_781569 - BLOCK
      ?auto_781570 - BLOCK
      ?auto_781571 - BLOCK
      ?auto_781572 - BLOCK
      ?auto_781573 - BLOCK
      ?auto_781574 - BLOCK
      ?auto_781575 - BLOCK
      ?auto_781576 - BLOCK
      ?auto_781577 - BLOCK
    )
    :vars
    (
      ?auto_781578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_781577 ?auto_781578 ) ( ON-TABLE ?auto_781561 ) ( ON ?auto_781562 ?auto_781561 ) ( ON ?auto_781563 ?auto_781562 ) ( ON ?auto_781564 ?auto_781563 ) ( ON ?auto_781565 ?auto_781564 ) ( ON ?auto_781566 ?auto_781565 ) ( ON ?auto_781567 ?auto_781566 ) ( ON ?auto_781568 ?auto_781567 ) ( ON ?auto_781569 ?auto_781568 ) ( ON ?auto_781570 ?auto_781569 ) ( not ( = ?auto_781561 ?auto_781562 ) ) ( not ( = ?auto_781561 ?auto_781563 ) ) ( not ( = ?auto_781561 ?auto_781564 ) ) ( not ( = ?auto_781561 ?auto_781565 ) ) ( not ( = ?auto_781561 ?auto_781566 ) ) ( not ( = ?auto_781561 ?auto_781567 ) ) ( not ( = ?auto_781561 ?auto_781568 ) ) ( not ( = ?auto_781561 ?auto_781569 ) ) ( not ( = ?auto_781561 ?auto_781570 ) ) ( not ( = ?auto_781561 ?auto_781571 ) ) ( not ( = ?auto_781561 ?auto_781572 ) ) ( not ( = ?auto_781561 ?auto_781573 ) ) ( not ( = ?auto_781561 ?auto_781574 ) ) ( not ( = ?auto_781561 ?auto_781575 ) ) ( not ( = ?auto_781561 ?auto_781576 ) ) ( not ( = ?auto_781561 ?auto_781577 ) ) ( not ( = ?auto_781561 ?auto_781578 ) ) ( not ( = ?auto_781562 ?auto_781563 ) ) ( not ( = ?auto_781562 ?auto_781564 ) ) ( not ( = ?auto_781562 ?auto_781565 ) ) ( not ( = ?auto_781562 ?auto_781566 ) ) ( not ( = ?auto_781562 ?auto_781567 ) ) ( not ( = ?auto_781562 ?auto_781568 ) ) ( not ( = ?auto_781562 ?auto_781569 ) ) ( not ( = ?auto_781562 ?auto_781570 ) ) ( not ( = ?auto_781562 ?auto_781571 ) ) ( not ( = ?auto_781562 ?auto_781572 ) ) ( not ( = ?auto_781562 ?auto_781573 ) ) ( not ( = ?auto_781562 ?auto_781574 ) ) ( not ( = ?auto_781562 ?auto_781575 ) ) ( not ( = ?auto_781562 ?auto_781576 ) ) ( not ( = ?auto_781562 ?auto_781577 ) ) ( not ( = ?auto_781562 ?auto_781578 ) ) ( not ( = ?auto_781563 ?auto_781564 ) ) ( not ( = ?auto_781563 ?auto_781565 ) ) ( not ( = ?auto_781563 ?auto_781566 ) ) ( not ( = ?auto_781563 ?auto_781567 ) ) ( not ( = ?auto_781563 ?auto_781568 ) ) ( not ( = ?auto_781563 ?auto_781569 ) ) ( not ( = ?auto_781563 ?auto_781570 ) ) ( not ( = ?auto_781563 ?auto_781571 ) ) ( not ( = ?auto_781563 ?auto_781572 ) ) ( not ( = ?auto_781563 ?auto_781573 ) ) ( not ( = ?auto_781563 ?auto_781574 ) ) ( not ( = ?auto_781563 ?auto_781575 ) ) ( not ( = ?auto_781563 ?auto_781576 ) ) ( not ( = ?auto_781563 ?auto_781577 ) ) ( not ( = ?auto_781563 ?auto_781578 ) ) ( not ( = ?auto_781564 ?auto_781565 ) ) ( not ( = ?auto_781564 ?auto_781566 ) ) ( not ( = ?auto_781564 ?auto_781567 ) ) ( not ( = ?auto_781564 ?auto_781568 ) ) ( not ( = ?auto_781564 ?auto_781569 ) ) ( not ( = ?auto_781564 ?auto_781570 ) ) ( not ( = ?auto_781564 ?auto_781571 ) ) ( not ( = ?auto_781564 ?auto_781572 ) ) ( not ( = ?auto_781564 ?auto_781573 ) ) ( not ( = ?auto_781564 ?auto_781574 ) ) ( not ( = ?auto_781564 ?auto_781575 ) ) ( not ( = ?auto_781564 ?auto_781576 ) ) ( not ( = ?auto_781564 ?auto_781577 ) ) ( not ( = ?auto_781564 ?auto_781578 ) ) ( not ( = ?auto_781565 ?auto_781566 ) ) ( not ( = ?auto_781565 ?auto_781567 ) ) ( not ( = ?auto_781565 ?auto_781568 ) ) ( not ( = ?auto_781565 ?auto_781569 ) ) ( not ( = ?auto_781565 ?auto_781570 ) ) ( not ( = ?auto_781565 ?auto_781571 ) ) ( not ( = ?auto_781565 ?auto_781572 ) ) ( not ( = ?auto_781565 ?auto_781573 ) ) ( not ( = ?auto_781565 ?auto_781574 ) ) ( not ( = ?auto_781565 ?auto_781575 ) ) ( not ( = ?auto_781565 ?auto_781576 ) ) ( not ( = ?auto_781565 ?auto_781577 ) ) ( not ( = ?auto_781565 ?auto_781578 ) ) ( not ( = ?auto_781566 ?auto_781567 ) ) ( not ( = ?auto_781566 ?auto_781568 ) ) ( not ( = ?auto_781566 ?auto_781569 ) ) ( not ( = ?auto_781566 ?auto_781570 ) ) ( not ( = ?auto_781566 ?auto_781571 ) ) ( not ( = ?auto_781566 ?auto_781572 ) ) ( not ( = ?auto_781566 ?auto_781573 ) ) ( not ( = ?auto_781566 ?auto_781574 ) ) ( not ( = ?auto_781566 ?auto_781575 ) ) ( not ( = ?auto_781566 ?auto_781576 ) ) ( not ( = ?auto_781566 ?auto_781577 ) ) ( not ( = ?auto_781566 ?auto_781578 ) ) ( not ( = ?auto_781567 ?auto_781568 ) ) ( not ( = ?auto_781567 ?auto_781569 ) ) ( not ( = ?auto_781567 ?auto_781570 ) ) ( not ( = ?auto_781567 ?auto_781571 ) ) ( not ( = ?auto_781567 ?auto_781572 ) ) ( not ( = ?auto_781567 ?auto_781573 ) ) ( not ( = ?auto_781567 ?auto_781574 ) ) ( not ( = ?auto_781567 ?auto_781575 ) ) ( not ( = ?auto_781567 ?auto_781576 ) ) ( not ( = ?auto_781567 ?auto_781577 ) ) ( not ( = ?auto_781567 ?auto_781578 ) ) ( not ( = ?auto_781568 ?auto_781569 ) ) ( not ( = ?auto_781568 ?auto_781570 ) ) ( not ( = ?auto_781568 ?auto_781571 ) ) ( not ( = ?auto_781568 ?auto_781572 ) ) ( not ( = ?auto_781568 ?auto_781573 ) ) ( not ( = ?auto_781568 ?auto_781574 ) ) ( not ( = ?auto_781568 ?auto_781575 ) ) ( not ( = ?auto_781568 ?auto_781576 ) ) ( not ( = ?auto_781568 ?auto_781577 ) ) ( not ( = ?auto_781568 ?auto_781578 ) ) ( not ( = ?auto_781569 ?auto_781570 ) ) ( not ( = ?auto_781569 ?auto_781571 ) ) ( not ( = ?auto_781569 ?auto_781572 ) ) ( not ( = ?auto_781569 ?auto_781573 ) ) ( not ( = ?auto_781569 ?auto_781574 ) ) ( not ( = ?auto_781569 ?auto_781575 ) ) ( not ( = ?auto_781569 ?auto_781576 ) ) ( not ( = ?auto_781569 ?auto_781577 ) ) ( not ( = ?auto_781569 ?auto_781578 ) ) ( not ( = ?auto_781570 ?auto_781571 ) ) ( not ( = ?auto_781570 ?auto_781572 ) ) ( not ( = ?auto_781570 ?auto_781573 ) ) ( not ( = ?auto_781570 ?auto_781574 ) ) ( not ( = ?auto_781570 ?auto_781575 ) ) ( not ( = ?auto_781570 ?auto_781576 ) ) ( not ( = ?auto_781570 ?auto_781577 ) ) ( not ( = ?auto_781570 ?auto_781578 ) ) ( not ( = ?auto_781571 ?auto_781572 ) ) ( not ( = ?auto_781571 ?auto_781573 ) ) ( not ( = ?auto_781571 ?auto_781574 ) ) ( not ( = ?auto_781571 ?auto_781575 ) ) ( not ( = ?auto_781571 ?auto_781576 ) ) ( not ( = ?auto_781571 ?auto_781577 ) ) ( not ( = ?auto_781571 ?auto_781578 ) ) ( not ( = ?auto_781572 ?auto_781573 ) ) ( not ( = ?auto_781572 ?auto_781574 ) ) ( not ( = ?auto_781572 ?auto_781575 ) ) ( not ( = ?auto_781572 ?auto_781576 ) ) ( not ( = ?auto_781572 ?auto_781577 ) ) ( not ( = ?auto_781572 ?auto_781578 ) ) ( not ( = ?auto_781573 ?auto_781574 ) ) ( not ( = ?auto_781573 ?auto_781575 ) ) ( not ( = ?auto_781573 ?auto_781576 ) ) ( not ( = ?auto_781573 ?auto_781577 ) ) ( not ( = ?auto_781573 ?auto_781578 ) ) ( not ( = ?auto_781574 ?auto_781575 ) ) ( not ( = ?auto_781574 ?auto_781576 ) ) ( not ( = ?auto_781574 ?auto_781577 ) ) ( not ( = ?auto_781574 ?auto_781578 ) ) ( not ( = ?auto_781575 ?auto_781576 ) ) ( not ( = ?auto_781575 ?auto_781577 ) ) ( not ( = ?auto_781575 ?auto_781578 ) ) ( not ( = ?auto_781576 ?auto_781577 ) ) ( not ( = ?auto_781576 ?auto_781578 ) ) ( not ( = ?auto_781577 ?auto_781578 ) ) ( ON ?auto_781576 ?auto_781577 ) ( ON ?auto_781575 ?auto_781576 ) ( ON ?auto_781574 ?auto_781575 ) ( ON ?auto_781573 ?auto_781574 ) ( ON ?auto_781572 ?auto_781573 ) ( CLEAR ?auto_781570 ) ( ON ?auto_781571 ?auto_781572 ) ( CLEAR ?auto_781571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_781561 ?auto_781562 ?auto_781563 ?auto_781564 ?auto_781565 ?auto_781566 ?auto_781567 ?auto_781568 ?auto_781569 ?auto_781570 ?auto_781571 )
      ( MAKE-17PILE ?auto_781561 ?auto_781562 ?auto_781563 ?auto_781564 ?auto_781565 ?auto_781566 ?auto_781567 ?auto_781568 ?auto_781569 ?auto_781570 ?auto_781571 ?auto_781572 ?auto_781573 ?auto_781574 ?auto_781575 ?auto_781576 ?auto_781577 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_781631 - BLOCK
      ?auto_781632 - BLOCK
      ?auto_781633 - BLOCK
      ?auto_781634 - BLOCK
      ?auto_781635 - BLOCK
      ?auto_781636 - BLOCK
      ?auto_781637 - BLOCK
      ?auto_781638 - BLOCK
      ?auto_781639 - BLOCK
      ?auto_781640 - BLOCK
      ?auto_781641 - BLOCK
      ?auto_781642 - BLOCK
      ?auto_781643 - BLOCK
      ?auto_781644 - BLOCK
      ?auto_781645 - BLOCK
      ?auto_781646 - BLOCK
      ?auto_781647 - BLOCK
    )
    :vars
    (
      ?auto_781648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_781647 ?auto_781648 ) ( ON-TABLE ?auto_781631 ) ( ON ?auto_781632 ?auto_781631 ) ( ON ?auto_781633 ?auto_781632 ) ( ON ?auto_781634 ?auto_781633 ) ( ON ?auto_781635 ?auto_781634 ) ( ON ?auto_781636 ?auto_781635 ) ( ON ?auto_781637 ?auto_781636 ) ( ON ?auto_781638 ?auto_781637 ) ( ON ?auto_781639 ?auto_781638 ) ( not ( = ?auto_781631 ?auto_781632 ) ) ( not ( = ?auto_781631 ?auto_781633 ) ) ( not ( = ?auto_781631 ?auto_781634 ) ) ( not ( = ?auto_781631 ?auto_781635 ) ) ( not ( = ?auto_781631 ?auto_781636 ) ) ( not ( = ?auto_781631 ?auto_781637 ) ) ( not ( = ?auto_781631 ?auto_781638 ) ) ( not ( = ?auto_781631 ?auto_781639 ) ) ( not ( = ?auto_781631 ?auto_781640 ) ) ( not ( = ?auto_781631 ?auto_781641 ) ) ( not ( = ?auto_781631 ?auto_781642 ) ) ( not ( = ?auto_781631 ?auto_781643 ) ) ( not ( = ?auto_781631 ?auto_781644 ) ) ( not ( = ?auto_781631 ?auto_781645 ) ) ( not ( = ?auto_781631 ?auto_781646 ) ) ( not ( = ?auto_781631 ?auto_781647 ) ) ( not ( = ?auto_781631 ?auto_781648 ) ) ( not ( = ?auto_781632 ?auto_781633 ) ) ( not ( = ?auto_781632 ?auto_781634 ) ) ( not ( = ?auto_781632 ?auto_781635 ) ) ( not ( = ?auto_781632 ?auto_781636 ) ) ( not ( = ?auto_781632 ?auto_781637 ) ) ( not ( = ?auto_781632 ?auto_781638 ) ) ( not ( = ?auto_781632 ?auto_781639 ) ) ( not ( = ?auto_781632 ?auto_781640 ) ) ( not ( = ?auto_781632 ?auto_781641 ) ) ( not ( = ?auto_781632 ?auto_781642 ) ) ( not ( = ?auto_781632 ?auto_781643 ) ) ( not ( = ?auto_781632 ?auto_781644 ) ) ( not ( = ?auto_781632 ?auto_781645 ) ) ( not ( = ?auto_781632 ?auto_781646 ) ) ( not ( = ?auto_781632 ?auto_781647 ) ) ( not ( = ?auto_781632 ?auto_781648 ) ) ( not ( = ?auto_781633 ?auto_781634 ) ) ( not ( = ?auto_781633 ?auto_781635 ) ) ( not ( = ?auto_781633 ?auto_781636 ) ) ( not ( = ?auto_781633 ?auto_781637 ) ) ( not ( = ?auto_781633 ?auto_781638 ) ) ( not ( = ?auto_781633 ?auto_781639 ) ) ( not ( = ?auto_781633 ?auto_781640 ) ) ( not ( = ?auto_781633 ?auto_781641 ) ) ( not ( = ?auto_781633 ?auto_781642 ) ) ( not ( = ?auto_781633 ?auto_781643 ) ) ( not ( = ?auto_781633 ?auto_781644 ) ) ( not ( = ?auto_781633 ?auto_781645 ) ) ( not ( = ?auto_781633 ?auto_781646 ) ) ( not ( = ?auto_781633 ?auto_781647 ) ) ( not ( = ?auto_781633 ?auto_781648 ) ) ( not ( = ?auto_781634 ?auto_781635 ) ) ( not ( = ?auto_781634 ?auto_781636 ) ) ( not ( = ?auto_781634 ?auto_781637 ) ) ( not ( = ?auto_781634 ?auto_781638 ) ) ( not ( = ?auto_781634 ?auto_781639 ) ) ( not ( = ?auto_781634 ?auto_781640 ) ) ( not ( = ?auto_781634 ?auto_781641 ) ) ( not ( = ?auto_781634 ?auto_781642 ) ) ( not ( = ?auto_781634 ?auto_781643 ) ) ( not ( = ?auto_781634 ?auto_781644 ) ) ( not ( = ?auto_781634 ?auto_781645 ) ) ( not ( = ?auto_781634 ?auto_781646 ) ) ( not ( = ?auto_781634 ?auto_781647 ) ) ( not ( = ?auto_781634 ?auto_781648 ) ) ( not ( = ?auto_781635 ?auto_781636 ) ) ( not ( = ?auto_781635 ?auto_781637 ) ) ( not ( = ?auto_781635 ?auto_781638 ) ) ( not ( = ?auto_781635 ?auto_781639 ) ) ( not ( = ?auto_781635 ?auto_781640 ) ) ( not ( = ?auto_781635 ?auto_781641 ) ) ( not ( = ?auto_781635 ?auto_781642 ) ) ( not ( = ?auto_781635 ?auto_781643 ) ) ( not ( = ?auto_781635 ?auto_781644 ) ) ( not ( = ?auto_781635 ?auto_781645 ) ) ( not ( = ?auto_781635 ?auto_781646 ) ) ( not ( = ?auto_781635 ?auto_781647 ) ) ( not ( = ?auto_781635 ?auto_781648 ) ) ( not ( = ?auto_781636 ?auto_781637 ) ) ( not ( = ?auto_781636 ?auto_781638 ) ) ( not ( = ?auto_781636 ?auto_781639 ) ) ( not ( = ?auto_781636 ?auto_781640 ) ) ( not ( = ?auto_781636 ?auto_781641 ) ) ( not ( = ?auto_781636 ?auto_781642 ) ) ( not ( = ?auto_781636 ?auto_781643 ) ) ( not ( = ?auto_781636 ?auto_781644 ) ) ( not ( = ?auto_781636 ?auto_781645 ) ) ( not ( = ?auto_781636 ?auto_781646 ) ) ( not ( = ?auto_781636 ?auto_781647 ) ) ( not ( = ?auto_781636 ?auto_781648 ) ) ( not ( = ?auto_781637 ?auto_781638 ) ) ( not ( = ?auto_781637 ?auto_781639 ) ) ( not ( = ?auto_781637 ?auto_781640 ) ) ( not ( = ?auto_781637 ?auto_781641 ) ) ( not ( = ?auto_781637 ?auto_781642 ) ) ( not ( = ?auto_781637 ?auto_781643 ) ) ( not ( = ?auto_781637 ?auto_781644 ) ) ( not ( = ?auto_781637 ?auto_781645 ) ) ( not ( = ?auto_781637 ?auto_781646 ) ) ( not ( = ?auto_781637 ?auto_781647 ) ) ( not ( = ?auto_781637 ?auto_781648 ) ) ( not ( = ?auto_781638 ?auto_781639 ) ) ( not ( = ?auto_781638 ?auto_781640 ) ) ( not ( = ?auto_781638 ?auto_781641 ) ) ( not ( = ?auto_781638 ?auto_781642 ) ) ( not ( = ?auto_781638 ?auto_781643 ) ) ( not ( = ?auto_781638 ?auto_781644 ) ) ( not ( = ?auto_781638 ?auto_781645 ) ) ( not ( = ?auto_781638 ?auto_781646 ) ) ( not ( = ?auto_781638 ?auto_781647 ) ) ( not ( = ?auto_781638 ?auto_781648 ) ) ( not ( = ?auto_781639 ?auto_781640 ) ) ( not ( = ?auto_781639 ?auto_781641 ) ) ( not ( = ?auto_781639 ?auto_781642 ) ) ( not ( = ?auto_781639 ?auto_781643 ) ) ( not ( = ?auto_781639 ?auto_781644 ) ) ( not ( = ?auto_781639 ?auto_781645 ) ) ( not ( = ?auto_781639 ?auto_781646 ) ) ( not ( = ?auto_781639 ?auto_781647 ) ) ( not ( = ?auto_781639 ?auto_781648 ) ) ( not ( = ?auto_781640 ?auto_781641 ) ) ( not ( = ?auto_781640 ?auto_781642 ) ) ( not ( = ?auto_781640 ?auto_781643 ) ) ( not ( = ?auto_781640 ?auto_781644 ) ) ( not ( = ?auto_781640 ?auto_781645 ) ) ( not ( = ?auto_781640 ?auto_781646 ) ) ( not ( = ?auto_781640 ?auto_781647 ) ) ( not ( = ?auto_781640 ?auto_781648 ) ) ( not ( = ?auto_781641 ?auto_781642 ) ) ( not ( = ?auto_781641 ?auto_781643 ) ) ( not ( = ?auto_781641 ?auto_781644 ) ) ( not ( = ?auto_781641 ?auto_781645 ) ) ( not ( = ?auto_781641 ?auto_781646 ) ) ( not ( = ?auto_781641 ?auto_781647 ) ) ( not ( = ?auto_781641 ?auto_781648 ) ) ( not ( = ?auto_781642 ?auto_781643 ) ) ( not ( = ?auto_781642 ?auto_781644 ) ) ( not ( = ?auto_781642 ?auto_781645 ) ) ( not ( = ?auto_781642 ?auto_781646 ) ) ( not ( = ?auto_781642 ?auto_781647 ) ) ( not ( = ?auto_781642 ?auto_781648 ) ) ( not ( = ?auto_781643 ?auto_781644 ) ) ( not ( = ?auto_781643 ?auto_781645 ) ) ( not ( = ?auto_781643 ?auto_781646 ) ) ( not ( = ?auto_781643 ?auto_781647 ) ) ( not ( = ?auto_781643 ?auto_781648 ) ) ( not ( = ?auto_781644 ?auto_781645 ) ) ( not ( = ?auto_781644 ?auto_781646 ) ) ( not ( = ?auto_781644 ?auto_781647 ) ) ( not ( = ?auto_781644 ?auto_781648 ) ) ( not ( = ?auto_781645 ?auto_781646 ) ) ( not ( = ?auto_781645 ?auto_781647 ) ) ( not ( = ?auto_781645 ?auto_781648 ) ) ( not ( = ?auto_781646 ?auto_781647 ) ) ( not ( = ?auto_781646 ?auto_781648 ) ) ( not ( = ?auto_781647 ?auto_781648 ) ) ( ON ?auto_781646 ?auto_781647 ) ( ON ?auto_781645 ?auto_781646 ) ( ON ?auto_781644 ?auto_781645 ) ( ON ?auto_781643 ?auto_781644 ) ( ON ?auto_781642 ?auto_781643 ) ( ON ?auto_781641 ?auto_781642 ) ( CLEAR ?auto_781639 ) ( ON ?auto_781640 ?auto_781641 ) ( CLEAR ?auto_781640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_781631 ?auto_781632 ?auto_781633 ?auto_781634 ?auto_781635 ?auto_781636 ?auto_781637 ?auto_781638 ?auto_781639 ?auto_781640 )
      ( MAKE-17PILE ?auto_781631 ?auto_781632 ?auto_781633 ?auto_781634 ?auto_781635 ?auto_781636 ?auto_781637 ?auto_781638 ?auto_781639 ?auto_781640 ?auto_781641 ?auto_781642 ?auto_781643 ?auto_781644 ?auto_781645 ?auto_781646 ?auto_781647 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_781701 - BLOCK
      ?auto_781702 - BLOCK
      ?auto_781703 - BLOCK
      ?auto_781704 - BLOCK
      ?auto_781705 - BLOCK
      ?auto_781706 - BLOCK
      ?auto_781707 - BLOCK
      ?auto_781708 - BLOCK
      ?auto_781709 - BLOCK
      ?auto_781710 - BLOCK
      ?auto_781711 - BLOCK
      ?auto_781712 - BLOCK
      ?auto_781713 - BLOCK
      ?auto_781714 - BLOCK
      ?auto_781715 - BLOCK
      ?auto_781716 - BLOCK
      ?auto_781717 - BLOCK
    )
    :vars
    (
      ?auto_781718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_781717 ?auto_781718 ) ( ON-TABLE ?auto_781701 ) ( ON ?auto_781702 ?auto_781701 ) ( ON ?auto_781703 ?auto_781702 ) ( ON ?auto_781704 ?auto_781703 ) ( ON ?auto_781705 ?auto_781704 ) ( ON ?auto_781706 ?auto_781705 ) ( ON ?auto_781707 ?auto_781706 ) ( ON ?auto_781708 ?auto_781707 ) ( not ( = ?auto_781701 ?auto_781702 ) ) ( not ( = ?auto_781701 ?auto_781703 ) ) ( not ( = ?auto_781701 ?auto_781704 ) ) ( not ( = ?auto_781701 ?auto_781705 ) ) ( not ( = ?auto_781701 ?auto_781706 ) ) ( not ( = ?auto_781701 ?auto_781707 ) ) ( not ( = ?auto_781701 ?auto_781708 ) ) ( not ( = ?auto_781701 ?auto_781709 ) ) ( not ( = ?auto_781701 ?auto_781710 ) ) ( not ( = ?auto_781701 ?auto_781711 ) ) ( not ( = ?auto_781701 ?auto_781712 ) ) ( not ( = ?auto_781701 ?auto_781713 ) ) ( not ( = ?auto_781701 ?auto_781714 ) ) ( not ( = ?auto_781701 ?auto_781715 ) ) ( not ( = ?auto_781701 ?auto_781716 ) ) ( not ( = ?auto_781701 ?auto_781717 ) ) ( not ( = ?auto_781701 ?auto_781718 ) ) ( not ( = ?auto_781702 ?auto_781703 ) ) ( not ( = ?auto_781702 ?auto_781704 ) ) ( not ( = ?auto_781702 ?auto_781705 ) ) ( not ( = ?auto_781702 ?auto_781706 ) ) ( not ( = ?auto_781702 ?auto_781707 ) ) ( not ( = ?auto_781702 ?auto_781708 ) ) ( not ( = ?auto_781702 ?auto_781709 ) ) ( not ( = ?auto_781702 ?auto_781710 ) ) ( not ( = ?auto_781702 ?auto_781711 ) ) ( not ( = ?auto_781702 ?auto_781712 ) ) ( not ( = ?auto_781702 ?auto_781713 ) ) ( not ( = ?auto_781702 ?auto_781714 ) ) ( not ( = ?auto_781702 ?auto_781715 ) ) ( not ( = ?auto_781702 ?auto_781716 ) ) ( not ( = ?auto_781702 ?auto_781717 ) ) ( not ( = ?auto_781702 ?auto_781718 ) ) ( not ( = ?auto_781703 ?auto_781704 ) ) ( not ( = ?auto_781703 ?auto_781705 ) ) ( not ( = ?auto_781703 ?auto_781706 ) ) ( not ( = ?auto_781703 ?auto_781707 ) ) ( not ( = ?auto_781703 ?auto_781708 ) ) ( not ( = ?auto_781703 ?auto_781709 ) ) ( not ( = ?auto_781703 ?auto_781710 ) ) ( not ( = ?auto_781703 ?auto_781711 ) ) ( not ( = ?auto_781703 ?auto_781712 ) ) ( not ( = ?auto_781703 ?auto_781713 ) ) ( not ( = ?auto_781703 ?auto_781714 ) ) ( not ( = ?auto_781703 ?auto_781715 ) ) ( not ( = ?auto_781703 ?auto_781716 ) ) ( not ( = ?auto_781703 ?auto_781717 ) ) ( not ( = ?auto_781703 ?auto_781718 ) ) ( not ( = ?auto_781704 ?auto_781705 ) ) ( not ( = ?auto_781704 ?auto_781706 ) ) ( not ( = ?auto_781704 ?auto_781707 ) ) ( not ( = ?auto_781704 ?auto_781708 ) ) ( not ( = ?auto_781704 ?auto_781709 ) ) ( not ( = ?auto_781704 ?auto_781710 ) ) ( not ( = ?auto_781704 ?auto_781711 ) ) ( not ( = ?auto_781704 ?auto_781712 ) ) ( not ( = ?auto_781704 ?auto_781713 ) ) ( not ( = ?auto_781704 ?auto_781714 ) ) ( not ( = ?auto_781704 ?auto_781715 ) ) ( not ( = ?auto_781704 ?auto_781716 ) ) ( not ( = ?auto_781704 ?auto_781717 ) ) ( not ( = ?auto_781704 ?auto_781718 ) ) ( not ( = ?auto_781705 ?auto_781706 ) ) ( not ( = ?auto_781705 ?auto_781707 ) ) ( not ( = ?auto_781705 ?auto_781708 ) ) ( not ( = ?auto_781705 ?auto_781709 ) ) ( not ( = ?auto_781705 ?auto_781710 ) ) ( not ( = ?auto_781705 ?auto_781711 ) ) ( not ( = ?auto_781705 ?auto_781712 ) ) ( not ( = ?auto_781705 ?auto_781713 ) ) ( not ( = ?auto_781705 ?auto_781714 ) ) ( not ( = ?auto_781705 ?auto_781715 ) ) ( not ( = ?auto_781705 ?auto_781716 ) ) ( not ( = ?auto_781705 ?auto_781717 ) ) ( not ( = ?auto_781705 ?auto_781718 ) ) ( not ( = ?auto_781706 ?auto_781707 ) ) ( not ( = ?auto_781706 ?auto_781708 ) ) ( not ( = ?auto_781706 ?auto_781709 ) ) ( not ( = ?auto_781706 ?auto_781710 ) ) ( not ( = ?auto_781706 ?auto_781711 ) ) ( not ( = ?auto_781706 ?auto_781712 ) ) ( not ( = ?auto_781706 ?auto_781713 ) ) ( not ( = ?auto_781706 ?auto_781714 ) ) ( not ( = ?auto_781706 ?auto_781715 ) ) ( not ( = ?auto_781706 ?auto_781716 ) ) ( not ( = ?auto_781706 ?auto_781717 ) ) ( not ( = ?auto_781706 ?auto_781718 ) ) ( not ( = ?auto_781707 ?auto_781708 ) ) ( not ( = ?auto_781707 ?auto_781709 ) ) ( not ( = ?auto_781707 ?auto_781710 ) ) ( not ( = ?auto_781707 ?auto_781711 ) ) ( not ( = ?auto_781707 ?auto_781712 ) ) ( not ( = ?auto_781707 ?auto_781713 ) ) ( not ( = ?auto_781707 ?auto_781714 ) ) ( not ( = ?auto_781707 ?auto_781715 ) ) ( not ( = ?auto_781707 ?auto_781716 ) ) ( not ( = ?auto_781707 ?auto_781717 ) ) ( not ( = ?auto_781707 ?auto_781718 ) ) ( not ( = ?auto_781708 ?auto_781709 ) ) ( not ( = ?auto_781708 ?auto_781710 ) ) ( not ( = ?auto_781708 ?auto_781711 ) ) ( not ( = ?auto_781708 ?auto_781712 ) ) ( not ( = ?auto_781708 ?auto_781713 ) ) ( not ( = ?auto_781708 ?auto_781714 ) ) ( not ( = ?auto_781708 ?auto_781715 ) ) ( not ( = ?auto_781708 ?auto_781716 ) ) ( not ( = ?auto_781708 ?auto_781717 ) ) ( not ( = ?auto_781708 ?auto_781718 ) ) ( not ( = ?auto_781709 ?auto_781710 ) ) ( not ( = ?auto_781709 ?auto_781711 ) ) ( not ( = ?auto_781709 ?auto_781712 ) ) ( not ( = ?auto_781709 ?auto_781713 ) ) ( not ( = ?auto_781709 ?auto_781714 ) ) ( not ( = ?auto_781709 ?auto_781715 ) ) ( not ( = ?auto_781709 ?auto_781716 ) ) ( not ( = ?auto_781709 ?auto_781717 ) ) ( not ( = ?auto_781709 ?auto_781718 ) ) ( not ( = ?auto_781710 ?auto_781711 ) ) ( not ( = ?auto_781710 ?auto_781712 ) ) ( not ( = ?auto_781710 ?auto_781713 ) ) ( not ( = ?auto_781710 ?auto_781714 ) ) ( not ( = ?auto_781710 ?auto_781715 ) ) ( not ( = ?auto_781710 ?auto_781716 ) ) ( not ( = ?auto_781710 ?auto_781717 ) ) ( not ( = ?auto_781710 ?auto_781718 ) ) ( not ( = ?auto_781711 ?auto_781712 ) ) ( not ( = ?auto_781711 ?auto_781713 ) ) ( not ( = ?auto_781711 ?auto_781714 ) ) ( not ( = ?auto_781711 ?auto_781715 ) ) ( not ( = ?auto_781711 ?auto_781716 ) ) ( not ( = ?auto_781711 ?auto_781717 ) ) ( not ( = ?auto_781711 ?auto_781718 ) ) ( not ( = ?auto_781712 ?auto_781713 ) ) ( not ( = ?auto_781712 ?auto_781714 ) ) ( not ( = ?auto_781712 ?auto_781715 ) ) ( not ( = ?auto_781712 ?auto_781716 ) ) ( not ( = ?auto_781712 ?auto_781717 ) ) ( not ( = ?auto_781712 ?auto_781718 ) ) ( not ( = ?auto_781713 ?auto_781714 ) ) ( not ( = ?auto_781713 ?auto_781715 ) ) ( not ( = ?auto_781713 ?auto_781716 ) ) ( not ( = ?auto_781713 ?auto_781717 ) ) ( not ( = ?auto_781713 ?auto_781718 ) ) ( not ( = ?auto_781714 ?auto_781715 ) ) ( not ( = ?auto_781714 ?auto_781716 ) ) ( not ( = ?auto_781714 ?auto_781717 ) ) ( not ( = ?auto_781714 ?auto_781718 ) ) ( not ( = ?auto_781715 ?auto_781716 ) ) ( not ( = ?auto_781715 ?auto_781717 ) ) ( not ( = ?auto_781715 ?auto_781718 ) ) ( not ( = ?auto_781716 ?auto_781717 ) ) ( not ( = ?auto_781716 ?auto_781718 ) ) ( not ( = ?auto_781717 ?auto_781718 ) ) ( ON ?auto_781716 ?auto_781717 ) ( ON ?auto_781715 ?auto_781716 ) ( ON ?auto_781714 ?auto_781715 ) ( ON ?auto_781713 ?auto_781714 ) ( ON ?auto_781712 ?auto_781713 ) ( ON ?auto_781711 ?auto_781712 ) ( ON ?auto_781710 ?auto_781711 ) ( CLEAR ?auto_781708 ) ( ON ?auto_781709 ?auto_781710 ) ( CLEAR ?auto_781709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_781701 ?auto_781702 ?auto_781703 ?auto_781704 ?auto_781705 ?auto_781706 ?auto_781707 ?auto_781708 ?auto_781709 )
      ( MAKE-17PILE ?auto_781701 ?auto_781702 ?auto_781703 ?auto_781704 ?auto_781705 ?auto_781706 ?auto_781707 ?auto_781708 ?auto_781709 ?auto_781710 ?auto_781711 ?auto_781712 ?auto_781713 ?auto_781714 ?auto_781715 ?auto_781716 ?auto_781717 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_781771 - BLOCK
      ?auto_781772 - BLOCK
      ?auto_781773 - BLOCK
      ?auto_781774 - BLOCK
      ?auto_781775 - BLOCK
      ?auto_781776 - BLOCK
      ?auto_781777 - BLOCK
      ?auto_781778 - BLOCK
      ?auto_781779 - BLOCK
      ?auto_781780 - BLOCK
      ?auto_781781 - BLOCK
      ?auto_781782 - BLOCK
      ?auto_781783 - BLOCK
      ?auto_781784 - BLOCK
      ?auto_781785 - BLOCK
      ?auto_781786 - BLOCK
      ?auto_781787 - BLOCK
    )
    :vars
    (
      ?auto_781788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_781787 ?auto_781788 ) ( ON-TABLE ?auto_781771 ) ( ON ?auto_781772 ?auto_781771 ) ( ON ?auto_781773 ?auto_781772 ) ( ON ?auto_781774 ?auto_781773 ) ( ON ?auto_781775 ?auto_781774 ) ( ON ?auto_781776 ?auto_781775 ) ( ON ?auto_781777 ?auto_781776 ) ( not ( = ?auto_781771 ?auto_781772 ) ) ( not ( = ?auto_781771 ?auto_781773 ) ) ( not ( = ?auto_781771 ?auto_781774 ) ) ( not ( = ?auto_781771 ?auto_781775 ) ) ( not ( = ?auto_781771 ?auto_781776 ) ) ( not ( = ?auto_781771 ?auto_781777 ) ) ( not ( = ?auto_781771 ?auto_781778 ) ) ( not ( = ?auto_781771 ?auto_781779 ) ) ( not ( = ?auto_781771 ?auto_781780 ) ) ( not ( = ?auto_781771 ?auto_781781 ) ) ( not ( = ?auto_781771 ?auto_781782 ) ) ( not ( = ?auto_781771 ?auto_781783 ) ) ( not ( = ?auto_781771 ?auto_781784 ) ) ( not ( = ?auto_781771 ?auto_781785 ) ) ( not ( = ?auto_781771 ?auto_781786 ) ) ( not ( = ?auto_781771 ?auto_781787 ) ) ( not ( = ?auto_781771 ?auto_781788 ) ) ( not ( = ?auto_781772 ?auto_781773 ) ) ( not ( = ?auto_781772 ?auto_781774 ) ) ( not ( = ?auto_781772 ?auto_781775 ) ) ( not ( = ?auto_781772 ?auto_781776 ) ) ( not ( = ?auto_781772 ?auto_781777 ) ) ( not ( = ?auto_781772 ?auto_781778 ) ) ( not ( = ?auto_781772 ?auto_781779 ) ) ( not ( = ?auto_781772 ?auto_781780 ) ) ( not ( = ?auto_781772 ?auto_781781 ) ) ( not ( = ?auto_781772 ?auto_781782 ) ) ( not ( = ?auto_781772 ?auto_781783 ) ) ( not ( = ?auto_781772 ?auto_781784 ) ) ( not ( = ?auto_781772 ?auto_781785 ) ) ( not ( = ?auto_781772 ?auto_781786 ) ) ( not ( = ?auto_781772 ?auto_781787 ) ) ( not ( = ?auto_781772 ?auto_781788 ) ) ( not ( = ?auto_781773 ?auto_781774 ) ) ( not ( = ?auto_781773 ?auto_781775 ) ) ( not ( = ?auto_781773 ?auto_781776 ) ) ( not ( = ?auto_781773 ?auto_781777 ) ) ( not ( = ?auto_781773 ?auto_781778 ) ) ( not ( = ?auto_781773 ?auto_781779 ) ) ( not ( = ?auto_781773 ?auto_781780 ) ) ( not ( = ?auto_781773 ?auto_781781 ) ) ( not ( = ?auto_781773 ?auto_781782 ) ) ( not ( = ?auto_781773 ?auto_781783 ) ) ( not ( = ?auto_781773 ?auto_781784 ) ) ( not ( = ?auto_781773 ?auto_781785 ) ) ( not ( = ?auto_781773 ?auto_781786 ) ) ( not ( = ?auto_781773 ?auto_781787 ) ) ( not ( = ?auto_781773 ?auto_781788 ) ) ( not ( = ?auto_781774 ?auto_781775 ) ) ( not ( = ?auto_781774 ?auto_781776 ) ) ( not ( = ?auto_781774 ?auto_781777 ) ) ( not ( = ?auto_781774 ?auto_781778 ) ) ( not ( = ?auto_781774 ?auto_781779 ) ) ( not ( = ?auto_781774 ?auto_781780 ) ) ( not ( = ?auto_781774 ?auto_781781 ) ) ( not ( = ?auto_781774 ?auto_781782 ) ) ( not ( = ?auto_781774 ?auto_781783 ) ) ( not ( = ?auto_781774 ?auto_781784 ) ) ( not ( = ?auto_781774 ?auto_781785 ) ) ( not ( = ?auto_781774 ?auto_781786 ) ) ( not ( = ?auto_781774 ?auto_781787 ) ) ( not ( = ?auto_781774 ?auto_781788 ) ) ( not ( = ?auto_781775 ?auto_781776 ) ) ( not ( = ?auto_781775 ?auto_781777 ) ) ( not ( = ?auto_781775 ?auto_781778 ) ) ( not ( = ?auto_781775 ?auto_781779 ) ) ( not ( = ?auto_781775 ?auto_781780 ) ) ( not ( = ?auto_781775 ?auto_781781 ) ) ( not ( = ?auto_781775 ?auto_781782 ) ) ( not ( = ?auto_781775 ?auto_781783 ) ) ( not ( = ?auto_781775 ?auto_781784 ) ) ( not ( = ?auto_781775 ?auto_781785 ) ) ( not ( = ?auto_781775 ?auto_781786 ) ) ( not ( = ?auto_781775 ?auto_781787 ) ) ( not ( = ?auto_781775 ?auto_781788 ) ) ( not ( = ?auto_781776 ?auto_781777 ) ) ( not ( = ?auto_781776 ?auto_781778 ) ) ( not ( = ?auto_781776 ?auto_781779 ) ) ( not ( = ?auto_781776 ?auto_781780 ) ) ( not ( = ?auto_781776 ?auto_781781 ) ) ( not ( = ?auto_781776 ?auto_781782 ) ) ( not ( = ?auto_781776 ?auto_781783 ) ) ( not ( = ?auto_781776 ?auto_781784 ) ) ( not ( = ?auto_781776 ?auto_781785 ) ) ( not ( = ?auto_781776 ?auto_781786 ) ) ( not ( = ?auto_781776 ?auto_781787 ) ) ( not ( = ?auto_781776 ?auto_781788 ) ) ( not ( = ?auto_781777 ?auto_781778 ) ) ( not ( = ?auto_781777 ?auto_781779 ) ) ( not ( = ?auto_781777 ?auto_781780 ) ) ( not ( = ?auto_781777 ?auto_781781 ) ) ( not ( = ?auto_781777 ?auto_781782 ) ) ( not ( = ?auto_781777 ?auto_781783 ) ) ( not ( = ?auto_781777 ?auto_781784 ) ) ( not ( = ?auto_781777 ?auto_781785 ) ) ( not ( = ?auto_781777 ?auto_781786 ) ) ( not ( = ?auto_781777 ?auto_781787 ) ) ( not ( = ?auto_781777 ?auto_781788 ) ) ( not ( = ?auto_781778 ?auto_781779 ) ) ( not ( = ?auto_781778 ?auto_781780 ) ) ( not ( = ?auto_781778 ?auto_781781 ) ) ( not ( = ?auto_781778 ?auto_781782 ) ) ( not ( = ?auto_781778 ?auto_781783 ) ) ( not ( = ?auto_781778 ?auto_781784 ) ) ( not ( = ?auto_781778 ?auto_781785 ) ) ( not ( = ?auto_781778 ?auto_781786 ) ) ( not ( = ?auto_781778 ?auto_781787 ) ) ( not ( = ?auto_781778 ?auto_781788 ) ) ( not ( = ?auto_781779 ?auto_781780 ) ) ( not ( = ?auto_781779 ?auto_781781 ) ) ( not ( = ?auto_781779 ?auto_781782 ) ) ( not ( = ?auto_781779 ?auto_781783 ) ) ( not ( = ?auto_781779 ?auto_781784 ) ) ( not ( = ?auto_781779 ?auto_781785 ) ) ( not ( = ?auto_781779 ?auto_781786 ) ) ( not ( = ?auto_781779 ?auto_781787 ) ) ( not ( = ?auto_781779 ?auto_781788 ) ) ( not ( = ?auto_781780 ?auto_781781 ) ) ( not ( = ?auto_781780 ?auto_781782 ) ) ( not ( = ?auto_781780 ?auto_781783 ) ) ( not ( = ?auto_781780 ?auto_781784 ) ) ( not ( = ?auto_781780 ?auto_781785 ) ) ( not ( = ?auto_781780 ?auto_781786 ) ) ( not ( = ?auto_781780 ?auto_781787 ) ) ( not ( = ?auto_781780 ?auto_781788 ) ) ( not ( = ?auto_781781 ?auto_781782 ) ) ( not ( = ?auto_781781 ?auto_781783 ) ) ( not ( = ?auto_781781 ?auto_781784 ) ) ( not ( = ?auto_781781 ?auto_781785 ) ) ( not ( = ?auto_781781 ?auto_781786 ) ) ( not ( = ?auto_781781 ?auto_781787 ) ) ( not ( = ?auto_781781 ?auto_781788 ) ) ( not ( = ?auto_781782 ?auto_781783 ) ) ( not ( = ?auto_781782 ?auto_781784 ) ) ( not ( = ?auto_781782 ?auto_781785 ) ) ( not ( = ?auto_781782 ?auto_781786 ) ) ( not ( = ?auto_781782 ?auto_781787 ) ) ( not ( = ?auto_781782 ?auto_781788 ) ) ( not ( = ?auto_781783 ?auto_781784 ) ) ( not ( = ?auto_781783 ?auto_781785 ) ) ( not ( = ?auto_781783 ?auto_781786 ) ) ( not ( = ?auto_781783 ?auto_781787 ) ) ( not ( = ?auto_781783 ?auto_781788 ) ) ( not ( = ?auto_781784 ?auto_781785 ) ) ( not ( = ?auto_781784 ?auto_781786 ) ) ( not ( = ?auto_781784 ?auto_781787 ) ) ( not ( = ?auto_781784 ?auto_781788 ) ) ( not ( = ?auto_781785 ?auto_781786 ) ) ( not ( = ?auto_781785 ?auto_781787 ) ) ( not ( = ?auto_781785 ?auto_781788 ) ) ( not ( = ?auto_781786 ?auto_781787 ) ) ( not ( = ?auto_781786 ?auto_781788 ) ) ( not ( = ?auto_781787 ?auto_781788 ) ) ( ON ?auto_781786 ?auto_781787 ) ( ON ?auto_781785 ?auto_781786 ) ( ON ?auto_781784 ?auto_781785 ) ( ON ?auto_781783 ?auto_781784 ) ( ON ?auto_781782 ?auto_781783 ) ( ON ?auto_781781 ?auto_781782 ) ( ON ?auto_781780 ?auto_781781 ) ( ON ?auto_781779 ?auto_781780 ) ( CLEAR ?auto_781777 ) ( ON ?auto_781778 ?auto_781779 ) ( CLEAR ?auto_781778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_781771 ?auto_781772 ?auto_781773 ?auto_781774 ?auto_781775 ?auto_781776 ?auto_781777 ?auto_781778 )
      ( MAKE-17PILE ?auto_781771 ?auto_781772 ?auto_781773 ?auto_781774 ?auto_781775 ?auto_781776 ?auto_781777 ?auto_781778 ?auto_781779 ?auto_781780 ?auto_781781 ?auto_781782 ?auto_781783 ?auto_781784 ?auto_781785 ?auto_781786 ?auto_781787 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_781841 - BLOCK
      ?auto_781842 - BLOCK
      ?auto_781843 - BLOCK
      ?auto_781844 - BLOCK
      ?auto_781845 - BLOCK
      ?auto_781846 - BLOCK
      ?auto_781847 - BLOCK
      ?auto_781848 - BLOCK
      ?auto_781849 - BLOCK
      ?auto_781850 - BLOCK
      ?auto_781851 - BLOCK
      ?auto_781852 - BLOCK
      ?auto_781853 - BLOCK
      ?auto_781854 - BLOCK
      ?auto_781855 - BLOCK
      ?auto_781856 - BLOCK
      ?auto_781857 - BLOCK
    )
    :vars
    (
      ?auto_781858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_781857 ?auto_781858 ) ( ON-TABLE ?auto_781841 ) ( ON ?auto_781842 ?auto_781841 ) ( ON ?auto_781843 ?auto_781842 ) ( ON ?auto_781844 ?auto_781843 ) ( ON ?auto_781845 ?auto_781844 ) ( ON ?auto_781846 ?auto_781845 ) ( not ( = ?auto_781841 ?auto_781842 ) ) ( not ( = ?auto_781841 ?auto_781843 ) ) ( not ( = ?auto_781841 ?auto_781844 ) ) ( not ( = ?auto_781841 ?auto_781845 ) ) ( not ( = ?auto_781841 ?auto_781846 ) ) ( not ( = ?auto_781841 ?auto_781847 ) ) ( not ( = ?auto_781841 ?auto_781848 ) ) ( not ( = ?auto_781841 ?auto_781849 ) ) ( not ( = ?auto_781841 ?auto_781850 ) ) ( not ( = ?auto_781841 ?auto_781851 ) ) ( not ( = ?auto_781841 ?auto_781852 ) ) ( not ( = ?auto_781841 ?auto_781853 ) ) ( not ( = ?auto_781841 ?auto_781854 ) ) ( not ( = ?auto_781841 ?auto_781855 ) ) ( not ( = ?auto_781841 ?auto_781856 ) ) ( not ( = ?auto_781841 ?auto_781857 ) ) ( not ( = ?auto_781841 ?auto_781858 ) ) ( not ( = ?auto_781842 ?auto_781843 ) ) ( not ( = ?auto_781842 ?auto_781844 ) ) ( not ( = ?auto_781842 ?auto_781845 ) ) ( not ( = ?auto_781842 ?auto_781846 ) ) ( not ( = ?auto_781842 ?auto_781847 ) ) ( not ( = ?auto_781842 ?auto_781848 ) ) ( not ( = ?auto_781842 ?auto_781849 ) ) ( not ( = ?auto_781842 ?auto_781850 ) ) ( not ( = ?auto_781842 ?auto_781851 ) ) ( not ( = ?auto_781842 ?auto_781852 ) ) ( not ( = ?auto_781842 ?auto_781853 ) ) ( not ( = ?auto_781842 ?auto_781854 ) ) ( not ( = ?auto_781842 ?auto_781855 ) ) ( not ( = ?auto_781842 ?auto_781856 ) ) ( not ( = ?auto_781842 ?auto_781857 ) ) ( not ( = ?auto_781842 ?auto_781858 ) ) ( not ( = ?auto_781843 ?auto_781844 ) ) ( not ( = ?auto_781843 ?auto_781845 ) ) ( not ( = ?auto_781843 ?auto_781846 ) ) ( not ( = ?auto_781843 ?auto_781847 ) ) ( not ( = ?auto_781843 ?auto_781848 ) ) ( not ( = ?auto_781843 ?auto_781849 ) ) ( not ( = ?auto_781843 ?auto_781850 ) ) ( not ( = ?auto_781843 ?auto_781851 ) ) ( not ( = ?auto_781843 ?auto_781852 ) ) ( not ( = ?auto_781843 ?auto_781853 ) ) ( not ( = ?auto_781843 ?auto_781854 ) ) ( not ( = ?auto_781843 ?auto_781855 ) ) ( not ( = ?auto_781843 ?auto_781856 ) ) ( not ( = ?auto_781843 ?auto_781857 ) ) ( not ( = ?auto_781843 ?auto_781858 ) ) ( not ( = ?auto_781844 ?auto_781845 ) ) ( not ( = ?auto_781844 ?auto_781846 ) ) ( not ( = ?auto_781844 ?auto_781847 ) ) ( not ( = ?auto_781844 ?auto_781848 ) ) ( not ( = ?auto_781844 ?auto_781849 ) ) ( not ( = ?auto_781844 ?auto_781850 ) ) ( not ( = ?auto_781844 ?auto_781851 ) ) ( not ( = ?auto_781844 ?auto_781852 ) ) ( not ( = ?auto_781844 ?auto_781853 ) ) ( not ( = ?auto_781844 ?auto_781854 ) ) ( not ( = ?auto_781844 ?auto_781855 ) ) ( not ( = ?auto_781844 ?auto_781856 ) ) ( not ( = ?auto_781844 ?auto_781857 ) ) ( not ( = ?auto_781844 ?auto_781858 ) ) ( not ( = ?auto_781845 ?auto_781846 ) ) ( not ( = ?auto_781845 ?auto_781847 ) ) ( not ( = ?auto_781845 ?auto_781848 ) ) ( not ( = ?auto_781845 ?auto_781849 ) ) ( not ( = ?auto_781845 ?auto_781850 ) ) ( not ( = ?auto_781845 ?auto_781851 ) ) ( not ( = ?auto_781845 ?auto_781852 ) ) ( not ( = ?auto_781845 ?auto_781853 ) ) ( not ( = ?auto_781845 ?auto_781854 ) ) ( not ( = ?auto_781845 ?auto_781855 ) ) ( not ( = ?auto_781845 ?auto_781856 ) ) ( not ( = ?auto_781845 ?auto_781857 ) ) ( not ( = ?auto_781845 ?auto_781858 ) ) ( not ( = ?auto_781846 ?auto_781847 ) ) ( not ( = ?auto_781846 ?auto_781848 ) ) ( not ( = ?auto_781846 ?auto_781849 ) ) ( not ( = ?auto_781846 ?auto_781850 ) ) ( not ( = ?auto_781846 ?auto_781851 ) ) ( not ( = ?auto_781846 ?auto_781852 ) ) ( not ( = ?auto_781846 ?auto_781853 ) ) ( not ( = ?auto_781846 ?auto_781854 ) ) ( not ( = ?auto_781846 ?auto_781855 ) ) ( not ( = ?auto_781846 ?auto_781856 ) ) ( not ( = ?auto_781846 ?auto_781857 ) ) ( not ( = ?auto_781846 ?auto_781858 ) ) ( not ( = ?auto_781847 ?auto_781848 ) ) ( not ( = ?auto_781847 ?auto_781849 ) ) ( not ( = ?auto_781847 ?auto_781850 ) ) ( not ( = ?auto_781847 ?auto_781851 ) ) ( not ( = ?auto_781847 ?auto_781852 ) ) ( not ( = ?auto_781847 ?auto_781853 ) ) ( not ( = ?auto_781847 ?auto_781854 ) ) ( not ( = ?auto_781847 ?auto_781855 ) ) ( not ( = ?auto_781847 ?auto_781856 ) ) ( not ( = ?auto_781847 ?auto_781857 ) ) ( not ( = ?auto_781847 ?auto_781858 ) ) ( not ( = ?auto_781848 ?auto_781849 ) ) ( not ( = ?auto_781848 ?auto_781850 ) ) ( not ( = ?auto_781848 ?auto_781851 ) ) ( not ( = ?auto_781848 ?auto_781852 ) ) ( not ( = ?auto_781848 ?auto_781853 ) ) ( not ( = ?auto_781848 ?auto_781854 ) ) ( not ( = ?auto_781848 ?auto_781855 ) ) ( not ( = ?auto_781848 ?auto_781856 ) ) ( not ( = ?auto_781848 ?auto_781857 ) ) ( not ( = ?auto_781848 ?auto_781858 ) ) ( not ( = ?auto_781849 ?auto_781850 ) ) ( not ( = ?auto_781849 ?auto_781851 ) ) ( not ( = ?auto_781849 ?auto_781852 ) ) ( not ( = ?auto_781849 ?auto_781853 ) ) ( not ( = ?auto_781849 ?auto_781854 ) ) ( not ( = ?auto_781849 ?auto_781855 ) ) ( not ( = ?auto_781849 ?auto_781856 ) ) ( not ( = ?auto_781849 ?auto_781857 ) ) ( not ( = ?auto_781849 ?auto_781858 ) ) ( not ( = ?auto_781850 ?auto_781851 ) ) ( not ( = ?auto_781850 ?auto_781852 ) ) ( not ( = ?auto_781850 ?auto_781853 ) ) ( not ( = ?auto_781850 ?auto_781854 ) ) ( not ( = ?auto_781850 ?auto_781855 ) ) ( not ( = ?auto_781850 ?auto_781856 ) ) ( not ( = ?auto_781850 ?auto_781857 ) ) ( not ( = ?auto_781850 ?auto_781858 ) ) ( not ( = ?auto_781851 ?auto_781852 ) ) ( not ( = ?auto_781851 ?auto_781853 ) ) ( not ( = ?auto_781851 ?auto_781854 ) ) ( not ( = ?auto_781851 ?auto_781855 ) ) ( not ( = ?auto_781851 ?auto_781856 ) ) ( not ( = ?auto_781851 ?auto_781857 ) ) ( not ( = ?auto_781851 ?auto_781858 ) ) ( not ( = ?auto_781852 ?auto_781853 ) ) ( not ( = ?auto_781852 ?auto_781854 ) ) ( not ( = ?auto_781852 ?auto_781855 ) ) ( not ( = ?auto_781852 ?auto_781856 ) ) ( not ( = ?auto_781852 ?auto_781857 ) ) ( not ( = ?auto_781852 ?auto_781858 ) ) ( not ( = ?auto_781853 ?auto_781854 ) ) ( not ( = ?auto_781853 ?auto_781855 ) ) ( not ( = ?auto_781853 ?auto_781856 ) ) ( not ( = ?auto_781853 ?auto_781857 ) ) ( not ( = ?auto_781853 ?auto_781858 ) ) ( not ( = ?auto_781854 ?auto_781855 ) ) ( not ( = ?auto_781854 ?auto_781856 ) ) ( not ( = ?auto_781854 ?auto_781857 ) ) ( not ( = ?auto_781854 ?auto_781858 ) ) ( not ( = ?auto_781855 ?auto_781856 ) ) ( not ( = ?auto_781855 ?auto_781857 ) ) ( not ( = ?auto_781855 ?auto_781858 ) ) ( not ( = ?auto_781856 ?auto_781857 ) ) ( not ( = ?auto_781856 ?auto_781858 ) ) ( not ( = ?auto_781857 ?auto_781858 ) ) ( ON ?auto_781856 ?auto_781857 ) ( ON ?auto_781855 ?auto_781856 ) ( ON ?auto_781854 ?auto_781855 ) ( ON ?auto_781853 ?auto_781854 ) ( ON ?auto_781852 ?auto_781853 ) ( ON ?auto_781851 ?auto_781852 ) ( ON ?auto_781850 ?auto_781851 ) ( ON ?auto_781849 ?auto_781850 ) ( ON ?auto_781848 ?auto_781849 ) ( CLEAR ?auto_781846 ) ( ON ?auto_781847 ?auto_781848 ) ( CLEAR ?auto_781847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_781841 ?auto_781842 ?auto_781843 ?auto_781844 ?auto_781845 ?auto_781846 ?auto_781847 )
      ( MAKE-17PILE ?auto_781841 ?auto_781842 ?auto_781843 ?auto_781844 ?auto_781845 ?auto_781846 ?auto_781847 ?auto_781848 ?auto_781849 ?auto_781850 ?auto_781851 ?auto_781852 ?auto_781853 ?auto_781854 ?auto_781855 ?auto_781856 ?auto_781857 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_781911 - BLOCK
      ?auto_781912 - BLOCK
      ?auto_781913 - BLOCK
      ?auto_781914 - BLOCK
      ?auto_781915 - BLOCK
      ?auto_781916 - BLOCK
      ?auto_781917 - BLOCK
      ?auto_781918 - BLOCK
      ?auto_781919 - BLOCK
      ?auto_781920 - BLOCK
      ?auto_781921 - BLOCK
      ?auto_781922 - BLOCK
      ?auto_781923 - BLOCK
      ?auto_781924 - BLOCK
      ?auto_781925 - BLOCK
      ?auto_781926 - BLOCK
      ?auto_781927 - BLOCK
    )
    :vars
    (
      ?auto_781928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_781927 ?auto_781928 ) ( ON-TABLE ?auto_781911 ) ( ON ?auto_781912 ?auto_781911 ) ( ON ?auto_781913 ?auto_781912 ) ( ON ?auto_781914 ?auto_781913 ) ( ON ?auto_781915 ?auto_781914 ) ( not ( = ?auto_781911 ?auto_781912 ) ) ( not ( = ?auto_781911 ?auto_781913 ) ) ( not ( = ?auto_781911 ?auto_781914 ) ) ( not ( = ?auto_781911 ?auto_781915 ) ) ( not ( = ?auto_781911 ?auto_781916 ) ) ( not ( = ?auto_781911 ?auto_781917 ) ) ( not ( = ?auto_781911 ?auto_781918 ) ) ( not ( = ?auto_781911 ?auto_781919 ) ) ( not ( = ?auto_781911 ?auto_781920 ) ) ( not ( = ?auto_781911 ?auto_781921 ) ) ( not ( = ?auto_781911 ?auto_781922 ) ) ( not ( = ?auto_781911 ?auto_781923 ) ) ( not ( = ?auto_781911 ?auto_781924 ) ) ( not ( = ?auto_781911 ?auto_781925 ) ) ( not ( = ?auto_781911 ?auto_781926 ) ) ( not ( = ?auto_781911 ?auto_781927 ) ) ( not ( = ?auto_781911 ?auto_781928 ) ) ( not ( = ?auto_781912 ?auto_781913 ) ) ( not ( = ?auto_781912 ?auto_781914 ) ) ( not ( = ?auto_781912 ?auto_781915 ) ) ( not ( = ?auto_781912 ?auto_781916 ) ) ( not ( = ?auto_781912 ?auto_781917 ) ) ( not ( = ?auto_781912 ?auto_781918 ) ) ( not ( = ?auto_781912 ?auto_781919 ) ) ( not ( = ?auto_781912 ?auto_781920 ) ) ( not ( = ?auto_781912 ?auto_781921 ) ) ( not ( = ?auto_781912 ?auto_781922 ) ) ( not ( = ?auto_781912 ?auto_781923 ) ) ( not ( = ?auto_781912 ?auto_781924 ) ) ( not ( = ?auto_781912 ?auto_781925 ) ) ( not ( = ?auto_781912 ?auto_781926 ) ) ( not ( = ?auto_781912 ?auto_781927 ) ) ( not ( = ?auto_781912 ?auto_781928 ) ) ( not ( = ?auto_781913 ?auto_781914 ) ) ( not ( = ?auto_781913 ?auto_781915 ) ) ( not ( = ?auto_781913 ?auto_781916 ) ) ( not ( = ?auto_781913 ?auto_781917 ) ) ( not ( = ?auto_781913 ?auto_781918 ) ) ( not ( = ?auto_781913 ?auto_781919 ) ) ( not ( = ?auto_781913 ?auto_781920 ) ) ( not ( = ?auto_781913 ?auto_781921 ) ) ( not ( = ?auto_781913 ?auto_781922 ) ) ( not ( = ?auto_781913 ?auto_781923 ) ) ( not ( = ?auto_781913 ?auto_781924 ) ) ( not ( = ?auto_781913 ?auto_781925 ) ) ( not ( = ?auto_781913 ?auto_781926 ) ) ( not ( = ?auto_781913 ?auto_781927 ) ) ( not ( = ?auto_781913 ?auto_781928 ) ) ( not ( = ?auto_781914 ?auto_781915 ) ) ( not ( = ?auto_781914 ?auto_781916 ) ) ( not ( = ?auto_781914 ?auto_781917 ) ) ( not ( = ?auto_781914 ?auto_781918 ) ) ( not ( = ?auto_781914 ?auto_781919 ) ) ( not ( = ?auto_781914 ?auto_781920 ) ) ( not ( = ?auto_781914 ?auto_781921 ) ) ( not ( = ?auto_781914 ?auto_781922 ) ) ( not ( = ?auto_781914 ?auto_781923 ) ) ( not ( = ?auto_781914 ?auto_781924 ) ) ( not ( = ?auto_781914 ?auto_781925 ) ) ( not ( = ?auto_781914 ?auto_781926 ) ) ( not ( = ?auto_781914 ?auto_781927 ) ) ( not ( = ?auto_781914 ?auto_781928 ) ) ( not ( = ?auto_781915 ?auto_781916 ) ) ( not ( = ?auto_781915 ?auto_781917 ) ) ( not ( = ?auto_781915 ?auto_781918 ) ) ( not ( = ?auto_781915 ?auto_781919 ) ) ( not ( = ?auto_781915 ?auto_781920 ) ) ( not ( = ?auto_781915 ?auto_781921 ) ) ( not ( = ?auto_781915 ?auto_781922 ) ) ( not ( = ?auto_781915 ?auto_781923 ) ) ( not ( = ?auto_781915 ?auto_781924 ) ) ( not ( = ?auto_781915 ?auto_781925 ) ) ( not ( = ?auto_781915 ?auto_781926 ) ) ( not ( = ?auto_781915 ?auto_781927 ) ) ( not ( = ?auto_781915 ?auto_781928 ) ) ( not ( = ?auto_781916 ?auto_781917 ) ) ( not ( = ?auto_781916 ?auto_781918 ) ) ( not ( = ?auto_781916 ?auto_781919 ) ) ( not ( = ?auto_781916 ?auto_781920 ) ) ( not ( = ?auto_781916 ?auto_781921 ) ) ( not ( = ?auto_781916 ?auto_781922 ) ) ( not ( = ?auto_781916 ?auto_781923 ) ) ( not ( = ?auto_781916 ?auto_781924 ) ) ( not ( = ?auto_781916 ?auto_781925 ) ) ( not ( = ?auto_781916 ?auto_781926 ) ) ( not ( = ?auto_781916 ?auto_781927 ) ) ( not ( = ?auto_781916 ?auto_781928 ) ) ( not ( = ?auto_781917 ?auto_781918 ) ) ( not ( = ?auto_781917 ?auto_781919 ) ) ( not ( = ?auto_781917 ?auto_781920 ) ) ( not ( = ?auto_781917 ?auto_781921 ) ) ( not ( = ?auto_781917 ?auto_781922 ) ) ( not ( = ?auto_781917 ?auto_781923 ) ) ( not ( = ?auto_781917 ?auto_781924 ) ) ( not ( = ?auto_781917 ?auto_781925 ) ) ( not ( = ?auto_781917 ?auto_781926 ) ) ( not ( = ?auto_781917 ?auto_781927 ) ) ( not ( = ?auto_781917 ?auto_781928 ) ) ( not ( = ?auto_781918 ?auto_781919 ) ) ( not ( = ?auto_781918 ?auto_781920 ) ) ( not ( = ?auto_781918 ?auto_781921 ) ) ( not ( = ?auto_781918 ?auto_781922 ) ) ( not ( = ?auto_781918 ?auto_781923 ) ) ( not ( = ?auto_781918 ?auto_781924 ) ) ( not ( = ?auto_781918 ?auto_781925 ) ) ( not ( = ?auto_781918 ?auto_781926 ) ) ( not ( = ?auto_781918 ?auto_781927 ) ) ( not ( = ?auto_781918 ?auto_781928 ) ) ( not ( = ?auto_781919 ?auto_781920 ) ) ( not ( = ?auto_781919 ?auto_781921 ) ) ( not ( = ?auto_781919 ?auto_781922 ) ) ( not ( = ?auto_781919 ?auto_781923 ) ) ( not ( = ?auto_781919 ?auto_781924 ) ) ( not ( = ?auto_781919 ?auto_781925 ) ) ( not ( = ?auto_781919 ?auto_781926 ) ) ( not ( = ?auto_781919 ?auto_781927 ) ) ( not ( = ?auto_781919 ?auto_781928 ) ) ( not ( = ?auto_781920 ?auto_781921 ) ) ( not ( = ?auto_781920 ?auto_781922 ) ) ( not ( = ?auto_781920 ?auto_781923 ) ) ( not ( = ?auto_781920 ?auto_781924 ) ) ( not ( = ?auto_781920 ?auto_781925 ) ) ( not ( = ?auto_781920 ?auto_781926 ) ) ( not ( = ?auto_781920 ?auto_781927 ) ) ( not ( = ?auto_781920 ?auto_781928 ) ) ( not ( = ?auto_781921 ?auto_781922 ) ) ( not ( = ?auto_781921 ?auto_781923 ) ) ( not ( = ?auto_781921 ?auto_781924 ) ) ( not ( = ?auto_781921 ?auto_781925 ) ) ( not ( = ?auto_781921 ?auto_781926 ) ) ( not ( = ?auto_781921 ?auto_781927 ) ) ( not ( = ?auto_781921 ?auto_781928 ) ) ( not ( = ?auto_781922 ?auto_781923 ) ) ( not ( = ?auto_781922 ?auto_781924 ) ) ( not ( = ?auto_781922 ?auto_781925 ) ) ( not ( = ?auto_781922 ?auto_781926 ) ) ( not ( = ?auto_781922 ?auto_781927 ) ) ( not ( = ?auto_781922 ?auto_781928 ) ) ( not ( = ?auto_781923 ?auto_781924 ) ) ( not ( = ?auto_781923 ?auto_781925 ) ) ( not ( = ?auto_781923 ?auto_781926 ) ) ( not ( = ?auto_781923 ?auto_781927 ) ) ( not ( = ?auto_781923 ?auto_781928 ) ) ( not ( = ?auto_781924 ?auto_781925 ) ) ( not ( = ?auto_781924 ?auto_781926 ) ) ( not ( = ?auto_781924 ?auto_781927 ) ) ( not ( = ?auto_781924 ?auto_781928 ) ) ( not ( = ?auto_781925 ?auto_781926 ) ) ( not ( = ?auto_781925 ?auto_781927 ) ) ( not ( = ?auto_781925 ?auto_781928 ) ) ( not ( = ?auto_781926 ?auto_781927 ) ) ( not ( = ?auto_781926 ?auto_781928 ) ) ( not ( = ?auto_781927 ?auto_781928 ) ) ( ON ?auto_781926 ?auto_781927 ) ( ON ?auto_781925 ?auto_781926 ) ( ON ?auto_781924 ?auto_781925 ) ( ON ?auto_781923 ?auto_781924 ) ( ON ?auto_781922 ?auto_781923 ) ( ON ?auto_781921 ?auto_781922 ) ( ON ?auto_781920 ?auto_781921 ) ( ON ?auto_781919 ?auto_781920 ) ( ON ?auto_781918 ?auto_781919 ) ( ON ?auto_781917 ?auto_781918 ) ( CLEAR ?auto_781915 ) ( ON ?auto_781916 ?auto_781917 ) ( CLEAR ?auto_781916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_781911 ?auto_781912 ?auto_781913 ?auto_781914 ?auto_781915 ?auto_781916 )
      ( MAKE-17PILE ?auto_781911 ?auto_781912 ?auto_781913 ?auto_781914 ?auto_781915 ?auto_781916 ?auto_781917 ?auto_781918 ?auto_781919 ?auto_781920 ?auto_781921 ?auto_781922 ?auto_781923 ?auto_781924 ?auto_781925 ?auto_781926 ?auto_781927 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_781981 - BLOCK
      ?auto_781982 - BLOCK
      ?auto_781983 - BLOCK
      ?auto_781984 - BLOCK
      ?auto_781985 - BLOCK
      ?auto_781986 - BLOCK
      ?auto_781987 - BLOCK
      ?auto_781988 - BLOCK
      ?auto_781989 - BLOCK
      ?auto_781990 - BLOCK
      ?auto_781991 - BLOCK
      ?auto_781992 - BLOCK
      ?auto_781993 - BLOCK
      ?auto_781994 - BLOCK
      ?auto_781995 - BLOCK
      ?auto_781996 - BLOCK
      ?auto_781997 - BLOCK
    )
    :vars
    (
      ?auto_781998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_781997 ?auto_781998 ) ( ON-TABLE ?auto_781981 ) ( ON ?auto_781982 ?auto_781981 ) ( ON ?auto_781983 ?auto_781982 ) ( ON ?auto_781984 ?auto_781983 ) ( not ( = ?auto_781981 ?auto_781982 ) ) ( not ( = ?auto_781981 ?auto_781983 ) ) ( not ( = ?auto_781981 ?auto_781984 ) ) ( not ( = ?auto_781981 ?auto_781985 ) ) ( not ( = ?auto_781981 ?auto_781986 ) ) ( not ( = ?auto_781981 ?auto_781987 ) ) ( not ( = ?auto_781981 ?auto_781988 ) ) ( not ( = ?auto_781981 ?auto_781989 ) ) ( not ( = ?auto_781981 ?auto_781990 ) ) ( not ( = ?auto_781981 ?auto_781991 ) ) ( not ( = ?auto_781981 ?auto_781992 ) ) ( not ( = ?auto_781981 ?auto_781993 ) ) ( not ( = ?auto_781981 ?auto_781994 ) ) ( not ( = ?auto_781981 ?auto_781995 ) ) ( not ( = ?auto_781981 ?auto_781996 ) ) ( not ( = ?auto_781981 ?auto_781997 ) ) ( not ( = ?auto_781981 ?auto_781998 ) ) ( not ( = ?auto_781982 ?auto_781983 ) ) ( not ( = ?auto_781982 ?auto_781984 ) ) ( not ( = ?auto_781982 ?auto_781985 ) ) ( not ( = ?auto_781982 ?auto_781986 ) ) ( not ( = ?auto_781982 ?auto_781987 ) ) ( not ( = ?auto_781982 ?auto_781988 ) ) ( not ( = ?auto_781982 ?auto_781989 ) ) ( not ( = ?auto_781982 ?auto_781990 ) ) ( not ( = ?auto_781982 ?auto_781991 ) ) ( not ( = ?auto_781982 ?auto_781992 ) ) ( not ( = ?auto_781982 ?auto_781993 ) ) ( not ( = ?auto_781982 ?auto_781994 ) ) ( not ( = ?auto_781982 ?auto_781995 ) ) ( not ( = ?auto_781982 ?auto_781996 ) ) ( not ( = ?auto_781982 ?auto_781997 ) ) ( not ( = ?auto_781982 ?auto_781998 ) ) ( not ( = ?auto_781983 ?auto_781984 ) ) ( not ( = ?auto_781983 ?auto_781985 ) ) ( not ( = ?auto_781983 ?auto_781986 ) ) ( not ( = ?auto_781983 ?auto_781987 ) ) ( not ( = ?auto_781983 ?auto_781988 ) ) ( not ( = ?auto_781983 ?auto_781989 ) ) ( not ( = ?auto_781983 ?auto_781990 ) ) ( not ( = ?auto_781983 ?auto_781991 ) ) ( not ( = ?auto_781983 ?auto_781992 ) ) ( not ( = ?auto_781983 ?auto_781993 ) ) ( not ( = ?auto_781983 ?auto_781994 ) ) ( not ( = ?auto_781983 ?auto_781995 ) ) ( not ( = ?auto_781983 ?auto_781996 ) ) ( not ( = ?auto_781983 ?auto_781997 ) ) ( not ( = ?auto_781983 ?auto_781998 ) ) ( not ( = ?auto_781984 ?auto_781985 ) ) ( not ( = ?auto_781984 ?auto_781986 ) ) ( not ( = ?auto_781984 ?auto_781987 ) ) ( not ( = ?auto_781984 ?auto_781988 ) ) ( not ( = ?auto_781984 ?auto_781989 ) ) ( not ( = ?auto_781984 ?auto_781990 ) ) ( not ( = ?auto_781984 ?auto_781991 ) ) ( not ( = ?auto_781984 ?auto_781992 ) ) ( not ( = ?auto_781984 ?auto_781993 ) ) ( not ( = ?auto_781984 ?auto_781994 ) ) ( not ( = ?auto_781984 ?auto_781995 ) ) ( not ( = ?auto_781984 ?auto_781996 ) ) ( not ( = ?auto_781984 ?auto_781997 ) ) ( not ( = ?auto_781984 ?auto_781998 ) ) ( not ( = ?auto_781985 ?auto_781986 ) ) ( not ( = ?auto_781985 ?auto_781987 ) ) ( not ( = ?auto_781985 ?auto_781988 ) ) ( not ( = ?auto_781985 ?auto_781989 ) ) ( not ( = ?auto_781985 ?auto_781990 ) ) ( not ( = ?auto_781985 ?auto_781991 ) ) ( not ( = ?auto_781985 ?auto_781992 ) ) ( not ( = ?auto_781985 ?auto_781993 ) ) ( not ( = ?auto_781985 ?auto_781994 ) ) ( not ( = ?auto_781985 ?auto_781995 ) ) ( not ( = ?auto_781985 ?auto_781996 ) ) ( not ( = ?auto_781985 ?auto_781997 ) ) ( not ( = ?auto_781985 ?auto_781998 ) ) ( not ( = ?auto_781986 ?auto_781987 ) ) ( not ( = ?auto_781986 ?auto_781988 ) ) ( not ( = ?auto_781986 ?auto_781989 ) ) ( not ( = ?auto_781986 ?auto_781990 ) ) ( not ( = ?auto_781986 ?auto_781991 ) ) ( not ( = ?auto_781986 ?auto_781992 ) ) ( not ( = ?auto_781986 ?auto_781993 ) ) ( not ( = ?auto_781986 ?auto_781994 ) ) ( not ( = ?auto_781986 ?auto_781995 ) ) ( not ( = ?auto_781986 ?auto_781996 ) ) ( not ( = ?auto_781986 ?auto_781997 ) ) ( not ( = ?auto_781986 ?auto_781998 ) ) ( not ( = ?auto_781987 ?auto_781988 ) ) ( not ( = ?auto_781987 ?auto_781989 ) ) ( not ( = ?auto_781987 ?auto_781990 ) ) ( not ( = ?auto_781987 ?auto_781991 ) ) ( not ( = ?auto_781987 ?auto_781992 ) ) ( not ( = ?auto_781987 ?auto_781993 ) ) ( not ( = ?auto_781987 ?auto_781994 ) ) ( not ( = ?auto_781987 ?auto_781995 ) ) ( not ( = ?auto_781987 ?auto_781996 ) ) ( not ( = ?auto_781987 ?auto_781997 ) ) ( not ( = ?auto_781987 ?auto_781998 ) ) ( not ( = ?auto_781988 ?auto_781989 ) ) ( not ( = ?auto_781988 ?auto_781990 ) ) ( not ( = ?auto_781988 ?auto_781991 ) ) ( not ( = ?auto_781988 ?auto_781992 ) ) ( not ( = ?auto_781988 ?auto_781993 ) ) ( not ( = ?auto_781988 ?auto_781994 ) ) ( not ( = ?auto_781988 ?auto_781995 ) ) ( not ( = ?auto_781988 ?auto_781996 ) ) ( not ( = ?auto_781988 ?auto_781997 ) ) ( not ( = ?auto_781988 ?auto_781998 ) ) ( not ( = ?auto_781989 ?auto_781990 ) ) ( not ( = ?auto_781989 ?auto_781991 ) ) ( not ( = ?auto_781989 ?auto_781992 ) ) ( not ( = ?auto_781989 ?auto_781993 ) ) ( not ( = ?auto_781989 ?auto_781994 ) ) ( not ( = ?auto_781989 ?auto_781995 ) ) ( not ( = ?auto_781989 ?auto_781996 ) ) ( not ( = ?auto_781989 ?auto_781997 ) ) ( not ( = ?auto_781989 ?auto_781998 ) ) ( not ( = ?auto_781990 ?auto_781991 ) ) ( not ( = ?auto_781990 ?auto_781992 ) ) ( not ( = ?auto_781990 ?auto_781993 ) ) ( not ( = ?auto_781990 ?auto_781994 ) ) ( not ( = ?auto_781990 ?auto_781995 ) ) ( not ( = ?auto_781990 ?auto_781996 ) ) ( not ( = ?auto_781990 ?auto_781997 ) ) ( not ( = ?auto_781990 ?auto_781998 ) ) ( not ( = ?auto_781991 ?auto_781992 ) ) ( not ( = ?auto_781991 ?auto_781993 ) ) ( not ( = ?auto_781991 ?auto_781994 ) ) ( not ( = ?auto_781991 ?auto_781995 ) ) ( not ( = ?auto_781991 ?auto_781996 ) ) ( not ( = ?auto_781991 ?auto_781997 ) ) ( not ( = ?auto_781991 ?auto_781998 ) ) ( not ( = ?auto_781992 ?auto_781993 ) ) ( not ( = ?auto_781992 ?auto_781994 ) ) ( not ( = ?auto_781992 ?auto_781995 ) ) ( not ( = ?auto_781992 ?auto_781996 ) ) ( not ( = ?auto_781992 ?auto_781997 ) ) ( not ( = ?auto_781992 ?auto_781998 ) ) ( not ( = ?auto_781993 ?auto_781994 ) ) ( not ( = ?auto_781993 ?auto_781995 ) ) ( not ( = ?auto_781993 ?auto_781996 ) ) ( not ( = ?auto_781993 ?auto_781997 ) ) ( not ( = ?auto_781993 ?auto_781998 ) ) ( not ( = ?auto_781994 ?auto_781995 ) ) ( not ( = ?auto_781994 ?auto_781996 ) ) ( not ( = ?auto_781994 ?auto_781997 ) ) ( not ( = ?auto_781994 ?auto_781998 ) ) ( not ( = ?auto_781995 ?auto_781996 ) ) ( not ( = ?auto_781995 ?auto_781997 ) ) ( not ( = ?auto_781995 ?auto_781998 ) ) ( not ( = ?auto_781996 ?auto_781997 ) ) ( not ( = ?auto_781996 ?auto_781998 ) ) ( not ( = ?auto_781997 ?auto_781998 ) ) ( ON ?auto_781996 ?auto_781997 ) ( ON ?auto_781995 ?auto_781996 ) ( ON ?auto_781994 ?auto_781995 ) ( ON ?auto_781993 ?auto_781994 ) ( ON ?auto_781992 ?auto_781993 ) ( ON ?auto_781991 ?auto_781992 ) ( ON ?auto_781990 ?auto_781991 ) ( ON ?auto_781989 ?auto_781990 ) ( ON ?auto_781988 ?auto_781989 ) ( ON ?auto_781987 ?auto_781988 ) ( ON ?auto_781986 ?auto_781987 ) ( CLEAR ?auto_781984 ) ( ON ?auto_781985 ?auto_781986 ) ( CLEAR ?auto_781985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_781981 ?auto_781982 ?auto_781983 ?auto_781984 ?auto_781985 )
      ( MAKE-17PILE ?auto_781981 ?auto_781982 ?auto_781983 ?auto_781984 ?auto_781985 ?auto_781986 ?auto_781987 ?auto_781988 ?auto_781989 ?auto_781990 ?auto_781991 ?auto_781992 ?auto_781993 ?auto_781994 ?auto_781995 ?auto_781996 ?auto_781997 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_782051 - BLOCK
      ?auto_782052 - BLOCK
      ?auto_782053 - BLOCK
      ?auto_782054 - BLOCK
      ?auto_782055 - BLOCK
      ?auto_782056 - BLOCK
      ?auto_782057 - BLOCK
      ?auto_782058 - BLOCK
      ?auto_782059 - BLOCK
      ?auto_782060 - BLOCK
      ?auto_782061 - BLOCK
      ?auto_782062 - BLOCK
      ?auto_782063 - BLOCK
      ?auto_782064 - BLOCK
      ?auto_782065 - BLOCK
      ?auto_782066 - BLOCK
      ?auto_782067 - BLOCK
    )
    :vars
    (
      ?auto_782068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_782067 ?auto_782068 ) ( ON-TABLE ?auto_782051 ) ( ON ?auto_782052 ?auto_782051 ) ( ON ?auto_782053 ?auto_782052 ) ( not ( = ?auto_782051 ?auto_782052 ) ) ( not ( = ?auto_782051 ?auto_782053 ) ) ( not ( = ?auto_782051 ?auto_782054 ) ) ( not ( = ?auto_782051 ?auto_782055 ) ) ( not ( = ?auto_782051 ?auto_782056 ) ) ( not ( = ?auto_782051 ?auto_782057 ) ) ( not ( = ?auto_782051 ?auto_782058 ) ) ( not ( = ?auto_782051 ?auto_782059 ) ) ( not ( = ?auto_782051 ?auto_782060 ) ) ( not ( = ?auto_782051 ?auto_782061 ) ) ( not ( = ?auto_782051 ?auto_782062 ) ) ( not ( = ?auto_782051 ?auto_782063 ) ) ( not ( = ?auto_782051 ?auto_782064 ) ) ( not ( = ?auto_782051 ?auto_782065 ) ) ( not ( = ?auto_782051 ?auto_782066 ) ) ( not ( = ?auto_782051 ?auto_782067 ) ) ( not ( = ?auto_782051 ?auto_782068 ) ) ( not ( = ?auto_782052 ?auto_782053 ) ) ( not ( = ?auto_782052 ?auto_782054 ) ) ( not ( = ?auto_782052 ?auto_782055 ) ) ( not ( = ?auto_782052 ?auto_782056 ) ) ( not ( = ?auto_782052 ?auto_782057 ) ) ( not ( = ?auto_782052 ?auto_782058 ) ) ( not ( = ?auto_782052 ?auto_782059 ) ) ( not ( = ?auto_782052 ?auto_782060 ) ) ( not ( = ?auto_782052 ?auto_782061 ) ) ( not ( = ?auto_782052 ?auto_782062 ) ) ( not ( = ?auto_782052 ?auto_782063 ) ) ( not ( = ?auto_782052 ?auto_782064 ) ) ( not ( = ?auto_782052 ?auto_782065 ) ) ( not ( = ?auto_782052 ?auto_782066 ) ) ( not ( = ?auto_782052 ?auto_782067 ) ) ( not ( = ?auto_782052 ?auto_782068 ) ) ( not ( = ?auto_782053 ?auto_782054 ) ) ( not ( = ?auto_782053 ?auto_782055 ) ) ( not ( = ?auto_782053 ?auto_782056 ) ) ( not ( = ?auto_782053 ?auto_782057 ) ) ( not ( = ?auto_782053 ?auto_782058 ) ) ( not ( = ?auto_782053 ?auto_782059 ) ) ( not ( = ?auto_782053 ?auto_782060 ) ) ( not ( = ?auto_782053 ?auto_782061 ) ) ( not ( = ?auto_782053 ?auto_782062 ) ) ( not ( = ?auto_782053 ?auto_782063 ) ) ( not ( = ?auto_782053 ?auto_782064 ) ) ( not ( = ?auto_782053 ?auto_782065 ) ) ( not ( = ?auto_782053 ?auto_782066 ) ) ( not ( = ?auto_782053 ?auto_782067 ) ) ( not ( = ?auto_782053 ?auto_782068 ) ) ( not ( = ?auto_782054 ?auto_782055 ) ) ( not ( = ?auto_782054 ?auto_782056 ) ) ( not ( = ?auto_782054 ?auto_782057 ) ) ( not ( = ?auto_782054 ?auto_782058 ) ) ( not ( = ?auto_782054 ?auto_782059 ) ) ( not ( = ?auto_782054 ?auto_782060 ) ) ( not ( = ?auto_782054 ?auto_782061 ) ) ( not ( = ?auto_782054 ?auto_782062 ) ) ( not ( = ?auto_782054 ?auto_782063 ) ) ( not ( = ?auto_782054 ?auto_782064 ) ) ( not ( = ?auto_782054 ?auto_782065 ) ) ( not ( = ?auto_782054 ?auto_782066 ) ) ( not ( = ?auto_782054 ?auto_782067 ) ) ( not ( = ?auto_782054 ?auto_782068 ) ) ( not ( = ?auto_782055 ?auto_782056 ) ) ( not ( = ?auto_782055 ?auto_782057 ) ) ( not ( = ?auto_782055 ?auto_782058 ) ) ( not ( = ?auto_782055 ?auto_782059 ) ) ( not ( = ?auto_782055 ?auto_782060 ) ) ( not ( = ?auto_782055 ?auto_782061 ) ) ( not ( = ?auto_782055 ?auto_782062 ) ) ( not ( = ?auto_782055 ?auto_782063 ) ) ( not ( = ?auto_782055 ?auto_782064 ) ) ( not ( = ?auto_782055 ?auto_782065 ) ) ( not ( = ?auto_782055 ?auto_782066 ) ) ( not ( = ?auto_782055 ?auto_782067 ) ) ( not ( = ?auto_782055 ?auto_782068 ) ) ( not ( = ?auto_782056 ?auto_782057 ) ) ( not ( = ?auto_782056 ?auto_782058 ) ) ( not ( = ?auto_782056 ?auto_782059 ) ) ( not ( = ?auto_782056 ?auto_782060 ) ) ( not ( = ?auto_782056 ?auto_782061 ) ) ( not ( = ?auto_782056 ?auto_782062 ) ) ( not ( = ?auto_782056 ?auto_782063 ) ) ( not ( = ?auto_782056 ?auto_782064 ) ) ( not ( = ?auto_782056 ?auto_782065 ) ) ( not ( = ?auto_782056 ?auto_782066 ) ) ( not ( = ?auto_782056 ?auto_782067 ) ) ( not ( = ?auto_782056 ?auto_782068 ) ) ( not ( = ?auto_782057 ?auto_782058 ) ) ( not ( = ?auto_782057 ?auto_782059 ) ) ( not ( = ?auto_782057 ?auto_782060 ) ) ( not ( = ?auto_782057 ?auto_782061 ) ) ( not ( = ?auto_782057 ?auto_782062 ) ) ( not ( = ?auto_782057 ?auto_782063 ) ) ( not ( = ?auto_782057 ?auto_782064 ) ) ( not ( = ?auto_782057 ?auto_782065 ) ) ( not ( = ?auto_782057 ?auto_782066 ) ) ( not ( = ?auto_782057 ?auto_782067 ) ) ( not ( = ?auto_782057 ?auto_782068 ) ) ( not ( = ?auto_782058 ?auto_782059 ) ) ( not ( = ?auto_782058 ?auto_782060 ) ) ( not ( = ?auto_782058 ?auto_782061 ) ) ( not ( = ?auto_782058 ?auto_782062 ) ) ( not ( = ?auto_782058 ?auto_782063 ) ) ( not ( = ?auto_782058 ?auto_782064 ) ) ( not ( = ?auto_782058 ?auto_782065 ) ) ( not ( = ?auto_782058 ?auto_782066 ) ) ( not ( = ?auto_782058 ?auto_782067 ) ) ( not ( = ?auto_782058 ?auto_782068 ) ) ( not ( = ?auto_782059 ?auto_782060 ) ) ( not ( = ?auto_782059 ?auto_782061 ) ) ( not ( = ?auto_782059 ?auto_782062 ) ) ( not ( = ?auto_782059 ?auto_782063 ) ) ( not ( = ?auto_782059 ?auto_782064 ) ) ( not ( = ?auto_782059 ?auto_782065 ) ) ( not ( = ?auto_782059 ?auto_782066 ) ) ( not ( = ?auto_782059 ?auto_782067 ) ) ( not ( = ?auto_782059 ?auto_782068 ) ) ( not ( = ?auto_782060 ?auto_782061 ) ) ( not ( = ?auto_782060 ?auto_782062 ) ) ( not ( = ?auto_782060 ?auto_782063 ) ) ( not ( = ?auto_782060 ?auto_782064 ) ) ( not ( = ?auto_782060 ?auto_782065 ) ) ( not ( = ?auto_782060 ?auto_782066 ) ) ( not ( = ?auto_782060 ?auto_782067 ) ) ( not ( = ?auto_782060 ?auto_782068 ) ) ( not ( = ?auto_782061 ?auto_782062 ) ) ( not ( = ?auto_782061 ?auto_782063 ) ) ( not ( = ?auto_782061 ?auto_782064 ) ) ( not ( = ?auto_782061 ?auto_782065 ) ) ( not ( = ?auto_782061 ?auto_782066 ) ) ( not ( = ?auto_782061 ?auto_782067 ) ) ( not ( = ?auto_782061 ?auto_782068 ) ) ( not ( = ?auto_782062 ?auto_782063 ) ) ( not ( = ?auto_782062 ?auto_782064 ) ) ( not ( = ?auto_782062 ?auto_782065 ) ) ( not ( = ?auto_782062 ?auto_782066 ) ) ( not ( = ?auto_782062 ?auto_782067 ) ) ( not ( = ?auto_782062 ?auto_782068 ) ) ( not ( = ?auto_782063 ?auto_782064 ) ) ( not ( = ?auto_782063 ?auto_782065 ) ) ( not ( = ?auto_782063 ?auto_782066 ) ) ( not ( = ?auto_782063 ?auto_782067 ) ) ( not ( = ?auto_782063 ?auto_782068 ) ) ( not ( = ?auto_782064 ?auto_782065 ) ) ( not ( = ?auto_782064 ?auto_782066 ) ) ( not ( = ?auto_782064 ?auto_782067 ) ) ( not ( = ?auto_782064 ?auto_782068 ) ) ( not ( = ?auto_782065 ?auto_782066 ) ) ( not ( = ?auto_782065 ?auto_782067 ) ) ( not ( = ?auto_782065 ?auto_782068 ) ) ( not ( = ?auto_782066 ?auto_782067 ) ) ( not ( = ?auto_782066 ?auto_782068 ) ) ( not ( = ?auto_782067 ?auto_782068 ) ) ( ON ?auto_782066 ?auto_782067 ) ( ON ?auto_782065 ?auto_782066 ) ( ON ?auto_782064 ?auto_782065 ) ( ON ?auto_782063 ?auto_782064 ) ( ON ?auto_782062 ?auto_782063 ) ( ON ?auto_782061 ?auto_782062 ) ( ON ?auto_782060 ?auto_782061 ) ( ON ?auto_782059 ?auto_782060 ) ( ON ?auto_782058 ?auto_782059 ) ( ON ?auto_782057 ?auto_782058 ) ( ON ?auto_782056 ?auto_782057 ) ( ON ?auto_782055 ?auto_782056 ) ( CLEAR ?auto_782053 ) ( ON ?auto_782054 ?auto_782055 ) ( CLEAR ?auto_782054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_782051 ?auto_782052 ?auto_782053 ?auto_782054 )
      ( MAKE-17PILE ?auto_782051 ?auto_782052 ?auto_782053 ?auto_782054 ?auto_782055 ?auto_782056 ?auto_782057 ?auto_782058 ?auto_782059 ?auto_782060 ?auto_782061 ?auto_782062 ?auto_782063 ?auto_782064 ?auto_782065 ?auto_782066 ?auto_782067 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_782121 - BLOCK
      ?auto_782122 - BLOCK
      ?auto_782123 - BLOCK
      ?auto_782124 - BLOCK
      ?auto_782125 - BLOCK
      ?auto_782126 - BLOCK
      ?auto_782127 - BLOCK
      ?auto_782128 - BLOCK
      ?auto_782129 - BLOCK
      ?auto_782130 - BLOCK
      ?auto_782131 - BLOCK
      ?auto_782132 - BLOCK
      ?auto_782133 - BLOCK
      ?auto_782134 - BLOCK
      ?auto_782135 - BLOCK
      ?auto_782136 - BLOCK
      ?auto_782137 - BLOCK
    )
    :vars
    (
      ?auto_782138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_782137 ?auto_782138 ) ( ON-TABLE ?auto_782121 ) ( ON ?auto_782122 ?auto_782121 ) ( not ( = ?auto_782121 ?auto_782122 ) ) ( not ( = ?auto_782121 ?auto_782123 ) ) ( not ( = ?auto_782121 ?auto_782124 ) ) ( not ( = ?auto_782121 ?auto_782125 ) ) ( not ( = ?auto_782121 ?auto_782126 ) ) ( not ( = ?auto_782121 ?auto_782127 ) ) ( not ( = ?auto_782121 ?auto_782128 ) ) ( not ( = ?auto_782121 ?auto_782129 ) ) ( not ( = ?auto_782121 ?auto_782130 ) ) ( not ( = ?auto_782121 ?auto_782131 ) ) ( not ( = ?auto_782121 ?auto_782132 ) ) ( not ( = ?auto_782121 ?auto_782133 ) ) ( not ( = ?auto_782121 ?auto_782134 ) ) ( not ( = ?auto_782121 ?auto_782135 ) ) ( not ( = ?auto_782121 ?auto_782136 ) ) ( not ( = ?auto_782121 ?auto_782137 ) ) ( not ( = ?auto_782121 ?auto_782138 ) ) ( not ( = ?auto_782122 ?auto_782123 ) ) ( not ( = ?auto_782122 ?auto_782124 ) ) ( not ( = ?auto_782122 ?auto_782125 ) ) ( not ( = ?auto_782122 ?auto_782126 ) ) ( not ( = ?auto_782122 ?auto_782127 ) ) ( not ( = ?auto_782122 ?auto_782128 ) ) ( not ( = ?auto_782122 ?auto_782129 ) ) ( not ( = ?auto_782122 ?auto_782130 ) ) ( not ( = ?auto_782122 ?auto_782131 ) ) ( not ( = ?auto_782122 ?auto_782132 ) ) ( not ( = ?auto_782122 ?auto_782133 ) ) ( not ( = ?auto_782122 ?auto_782134 ) ) ( not ( = ?auto_782122 ?auto_782135 ) ) ( not ( = ?auto_782122 ?auto_782136 ) ) ( not ( = ?auto_782122 ?auto_782137 ) ) ( not ( = ?auto_782122 ?auto_782138 ) ) ( not ( = ?auto_782123 ?auto_782124 ) ) ( not ( = ?auto_782123 ?auto_782125 ) ) ( not ( = ?auto_782123 ?auto_782126 ) ) ( not ( = ?auto_782123 ?auto_782127 ) ) ( not ( = ?auto_782123 ?auto_782128 ) ) ( not ( = ?auto_782123 ?auto_782129 ) ) ( not ( = ?auto_782123 ?auto_782130 ) ) ( not ( = ?auto_782123 ?auto_782131 ) ) ( not ( = ?auto_782123 ?auto_782132 ) ) ( not ( = ?auto_782123 ?auto_782133 ) ) ( not ( = ?auto_782123 ?auto_782134 ) ) ( not ( = ?auto_782123 ?auto_782135 ) ) ( not ( = ?auto_782123 ?auto_782136 ) ) ( not ( = ?auto_782123 ?auto_782137 ) ) ( not ( = ?auto_782123 ?auto_782138 ) ) ( not ( = ?auto_782124 ?auto_782125 ) ) ( not ( = ?auto_782124 ?auto_782126 ) ) ( not ( = ?auto_782124 ?auto_782127 ) ) ( not ( = ?auto_782124 ?auto_782128 ) ) ( not ( = ?auto_782124 ?auto_782129 ) ) ( not ( = ?auto_782124 ?auto_782130 ) ) ( not ( = ?auto_782124 ?auto_782131 ) ) ( not ( = ?auto_782124 ?auto_782132 ) ) ( not ( = ?auto_782124 ?auto_782133 ) ) ( not ( = ?auto_782124 ?auto_782134 ) ) ( not ( = ?auto_782124 ?auto_782135 ) ) ( not ( = ?auto_782124 ?auto_782136 ) ) ( not ( = ?auto_782124 ?auto_782137 ) ) ( not ( = ?auto_782124 ?auto_782138 ) ) ( not ( = ?auto_782125 ?auto_782126 ) ) ( not ( = ?auto_782125 ?auto_782127 ) ) ( not ( = ?auto_782125 ?auto_782128 ) ) ( not ( = ?auto_782125 ?auto_782129 ) ) ( not ( = ?auto_782125 ?auto_782130 ) ) ( not ( = ?auto_782125 ?auto_782131 ) ) ( not ( = ?auto_782125 ?auto_782132 ) ) ( not ( = ?auto_782125 ?auto_782133 ) ) ( not ( = ?auto_782125 ?auto_782134 ) ) ( not ( = ?auto_782125 ?auto_782135 ) ) ( not ( = ?auto_782125 ?auto_782136 ) ) ( not ( = ?auto_782125 ?auto_782137 ) ) ( not ( = ?auto_782125 ?auto_782138 ) ) ( not ( = ?auto_782126 ?auto_782127 ) ) ( not ( = ?auto_782126 ?auto_782128 ) ) ( not ( = ?auto_782126 ?auto_782129 ) ) ( not ( = ?auto_782126 ?auto_782130 ) ) ( not ( = ?auto_782126 ?auto_782131 ) ) ( not ( = ?auto_782126 ?auto_782132 ) ) ( not ( = ?auto_782126 ?auto_782133 ) ) ( not ( = ?auto_782126 ?auto_782134 ) ) ( not ( = ?auto_782126 ?auto_782135 ) ) ( not ( = ?auto_782126 ?auto_782136 ) ) ( not ( = ?auto_782126 ?auto_782137 ) ) ( not ( = ?auto_782126 ?auto_782138 ) ) ( not ( = ?auto_782127 ?auto_782128 ) ) ( not ( = ?auto_782127 ?auto_782129 ) ) ( not ( = ?auto_782127 ?auto_782130 ) ) ( not ( = ?auto_782127 ?auto_782131 ) ) ( not ( = ?auto_782127 ?auto_782132 ) ) ( not ( = ?auto_782127 ?auto_782133 ) ) ( not ( = ?auto_782127 ?auto_782134 ) ) ( not ( = ?auto_782127 ?auto_782135 ) ) ( not ( = ?auto_782127 ?auto_782136 ) ) ( not ( = ?auto_782127 ?auto_782137 ) ) ( not ( = ?auto_782127 ?auto_782138 ) ) ( not ( = ?auto_782128 ?auto_782129 ) ) ( not ( = ?auto_782128 ?auto_782130 ) ) ( not ( = ?auto_782128 ?auto_782131 ) ) ( not ( = ?auto_782128 ?auto_782132 ) ) ( not ( = ?auto_782128 ?auto_782133 ) ) ( not ( = ?auto_782128 ?auto_782134 ) ) ( not ( = ?auto_782128 ?auto_782135 ) ) ( not ( = ?auto_782128 ?auto_782136 ) ) ( not ( = ?auto_782128 ?auto_782137 ) ) ( not ( = ?auto_782128 ?auto_782138 ) ) ( not ( = ?auto_782129 ?auto_782130 ) ) ( not ( = ?auto_782129 ?auto_782131 ) ) ( not ( = ?auto_782129 ?auto_782132 ) ) ( not ( = ?auto_782129 ?auto_782133 ) ) ( not ( = ?auto_782129 ?auto_782134 ) ) ( not ( = ?auto_782129 ?auto_782135 ) ) ( not ( = ?auto_782129 ?auto_782136 ) ) ( not ( = ?auto_782129 ?auto_782137 ) ) ( not ( = ?auto_782129 ?auto_782138 ) ) ( not ( = ?auto_782130 ?auto_782131 ) ) ( not ( = ?auto_782130 ?auto_782132 ) ) ( not ( = ?auto_782130 ?auto_782133 ) ) ( not ( = ?auto_782130 ?auto_782134 ) ) ( not ( = ?auto_782130 ?auto_782135 ) ) ( not ( = ?auto_782130 ?auto_782136 ) ) ( not ( = ?auto_782130 ?auto_782137 ) ) ( not ( = ?auto_782130 ?auto_782138 ) ) ( not ( = ?auto_782131 ?auto_782132 ) ) ( not ( = ?auto_782131 ?auto_782133 ) ) ( not ( = ?auto_782131 ?auto_782134 ) ) ( not ( = ?auto_782131 ?auto_782135 ) ) ( not ( = ?auto_782131 ?auto_782136 ) ) ( not ( = ?auto_782131 ?auto_782137 ) ) ( not ( = ?auto_782131 ?auto_782138 ) ) ( not ( = ?auto_782132 ?auto_782133 ) ) ( not ( = ?auto_782132 ?auto_782134 ) ) ( not ( = ?auto_782132 ?auto_782135 ) ) ( not ( = ?auto_782132 ?auto_782136 ) ) ( not ( = ?auto_782132 ?auto_782137 ) ) ( not ( = ?auto_782132 ?auto_782138 ) ) ( not ( = ?auto_782133 ?auto_782134 ) ) ( not ( = ?auto_782133 ?auto_782135 ) ) ( not ( = ?auto_782133 ?auto_782136 ) ) ( not ( = ?auto_782133 ?auto_782137 ) ) ( not ( = ?auto_782133 ?auto_782138 ) ) ( not ( = ?auto_782134 ?auto_782135 ) ) ( not ( = ?auto_782134 ?auto_782136 ) ) ( not ( = ?auto_782134 ?auto_782137 ) ) ( not ( = ?auto_782134 ?auto_782138 ) ) ( not ( = ?auto_782135 ?auto_782136 ) ) ( not ( = ?auto_782135 ?auto_782137 ) ) ( not ( = ?auto_782135 ?auto_782138 ) ) ( not ( = ?auto_782136 ?auto_782137 ) ) ( not ( = ?auto_782136 ?auto_782138 ) ) ( not ( = ?auto_782137 ?auto_782138 ) ) ( ON ?auto_782136 ?auto_782137 ) ( ON ?auto_782135 ?auto_782136 ) ( ON ?auto_782134 ?auto_782135 ) ( ON ?auto_782133 ?auto_782134 ) ( ON ?auto_782132 ?auto_782133 ) ( ON ?auto_782131 ?auto_782132 ) ( ON ?auto_782130 ?auto_782131 ) ( ON ?auto_782129 ?auto_782130 ) ( ON ?auto_782128 ?auto_782129 ) ( ON ?auto_782127 ?auto_782128 ) ( ON ?auto_782126 ?auto_782127 ) ( ON ?auto_782125 ?auto_782126 ) ( ON ?auto_782124 ?auto_782125 ) ( CLEAR ?auto_782122 ) ( ON ?auto_782123 ?auto_782124 ) ( CLEAR ?auto_782123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_782121 ?auto_782122 ?auto_782123 )
      ( MAKE-17PILE ?auto_782121 ?auto_782122 ?auto_782123 ?auto_782124 ?auto_782125 ?auto_782126 ?auto_782127 ?auto_782128 ?auto_782129 ?auto_782130 ?auto_782131 ?auto_782132 ?auto_782133 ?auto_782134 ?auto_782135 ?auto_782136 ?auto_782137 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_782191 - BLOCK
      ?auto_782192 - BLOCK
      ?auto_782193 - BLOCK
      ?auto_782194 - BLOCK
      ?auto_782195 - BLOCK
      ?auto_782196 - BLOCK
      ?auto_782197 - BLOCK
      ?auto_782198 - BLOCK
      ?auto_782199 - BLOCK
      ?auto_782200 - BLOCK
      ?auto_782201 - BLOCK
      ?auto_782202 - BLOCK
      ?auto_782203 - BLOCK
      ?auto_782204 - BLOCK
      ?auto_782205 - BLOCK
      ?auto_782206 - BLOCK
      ?auto_782207 - BLOCK
    )
    :vars
    (
      ?auto_782208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_782207 ?auto_782208 ) ( ON-TABLE ?auto_782191 ) ( not ( = ?auto_782191 ?auto_782192 ) ) ( not ( = ?auto_782191 ?auto_782193 ) ) ( not ( = ?auto_782191 ?auto_782194 ) ) ( not ( = ?auto_782191 ?auto_782195 ) ) ( not ( = ?auto_782191 ?auto_782196 ) ) ( not ( = ?auto_782191 ?auto_782197 ) ) ( not ( = ?auto_782191 ?auto_782198 ) ) ( not ( = ?auto_782191 ?auto_782199 ) ) ( not ( = ?auto_782191 ?auto_782200 ) ) ( not ( = ?auto_782191 ?auto_782201 ) ) ( not ( = ?auto_782191 ?auto_782202 ) ) ( not ( = ?auto_782191 ?auto_782203 ) ) ( not ( = ?auto_782191 ?auto_782204 ) ) ( not ( = ?auto_782191 ?auto_782205 ) ) ( not ( = ?auto_782191 ?auto_782206 ) ) ( not ( = ?auto_782191 ?auto_782207 ) ) ( not ( = ?auto_782191 ?auto_782208 ) ) ( not ( = ?auto_782192 ?auto_782193 ) ) ( not ( = ?auto_782192 ?auto_782194 ) ) ( not ( = ?auto_782192 ?auto_782195 ) ) ( not ( = ?auto_782192 ?auto_782196 ) ) ( not ( = ?auto_782192 ?auto_782197 ) ) ( not ( = ?auto_782192 ?auto_782198 ) ) ( not ( = ?auto_782192 ?auto_782199 ) ) ( not ( = ?auto_782192 ?auto_782200 ) ) ( not ( = ?auto_782192 ?auto_782201 ) ) ( not ( = ?auto_782192 ?auto_782202 ) ) ( not ( = ?auto_782192 ?auto_782203 ) ) ( not ( = ?auto_782192 ?auto_782204 ) ) ( not ( = ?auto_782192 ?auto_782205 ) ) ( not ( = ?auto_782192 ?auto_782206 ) ) ( not ( = ?auto_782192 ?auto_782207 ) ) ( not ( = ?auto_782192 ?auto_782208 ) ) ( not ( = ?auto_782193 ?auto_782194 ) ) ( not ( = ?auto_782193 ?auto_782195 ) ) ( not ( = ?auto_782193 ?auto_782196 ) ) ( not ( = ?auto_782193 ?auto_782197 ) ) ( not ( = ?auto_782193 ?auto_782198 ) ) ( not ( = ?auto_782193 ?auto_782199 ) ) ( not ( = ?auto_782193 ?auto_782200 ) ) ( not ( = ?auto_782193 ?auto_782201 ) ) ( not ( = ?auto_782193 ?auto_782202 ) ) ( not ( = ?auto_782193 ?auto_782203 ) ) ( not ( = ?auto_782193 ?auto_782204 ) ) ( not ( = ?auto_782193 ?auto_782205 ) ) ( not ( = ?auto_782193 ?auto_782206 ) ) ( not ( = ?auto_782193 ?auto_782207 ) ) ( not ( = ?auto_782193 ?auto_782208 ) ) ( not ( = ?auto_782194 ?auto_782195 ) ) ( not ( = ?auto_782194 ?auto_782196 ) ) ( not ( = ?auto_782194 ?auto_782197 ) ) ( not ( = ?auto_782194 ?auto_782198 ) ) ( not ( = ?auto_782194 ?auto_782199 ) ) ( not ( = ?auto_782194 ?auto_782200 ) ) ( not ( = ?auto_782194 ?auto_782201 ) ) ( not ( = ?auto_782194 ?auto_782202 ) ) ( not ( = ?auto_782194 ?auto_782203 ) ) ( not ( = ?auto_782194 ?auto_782204 ) ) ( not ( = ?auto_782194 ?auto_782205 ) ) ( not ( = ?auto_782194 ?auto_782206 ) ) ( not ( = ?auto_782194 ?auto_782207 ) ) ( not ( = ?auto_782194 ?auto_782208 ) ) ( not ( = ?auto_782195 ?auto_782196 ) ) ( not ( = ?auto_782195 ?auto_782197 ) ) ( not ( = ?auto_782195 ?auto_782198 ) ) ( not ( = ?auto_782195 ?auto_782199 ) ) ( not ( = ?auto_782195 ?auto_782200 ) ) ( not ( = ?auto_782195 ?auto_782201 ) ) ( not ( = ?auto_782195 ?auto_782202 ) ) ( not ( = ?auto_782195 ?auto_782203 ) ) ( not ( = ?auto_782195 ?auto_782204 ) ) ( not ( = ?auto_782195 ?auto_782205 ) ) ( not ( = ?auto_782195 ?auto_782206 ) ) ( not ( = ?auto_782195 ?auto_782207 ) ) ( not ( = ?auto_782195 ?auto_782208 ) ) ( not ( = ?auto_782196 ?auto_782197 ) ) ( not ( = ?auto_782196 ?auto_782198 ) ) ( not ( = ?auto_782196 ?auto_782199 ) ) ( not ( = ?auto_782196 ?auto_782200 ) ) ( not ( = ?auto_782196 ?auto_782201 ) ) ( not ( = ?auto_782196 ?auto_782202 ) ) ( not ( = ?auto_782196 ?auto_782203 ) ) ( not ( = ?auto_782196 ?auto_782204 ) ) ( not ( = ?auto_782196 ?auto_782205 ) ) ( not ( = ?auto_782196 ?auto_782206 ) ) ( not ( = ?auto_782196 ?auto_782207 ) ) ( not ( = ?auto_782196 ?auto_782208 ) ) ( not ( = ?auto_782197 ?auto_782198 ) ) ( not ( = ?auto_782197 ?auto_782199 ) ) ( not ( = ?auto_782197 ?auto_782200 ) ) ( not ( = ?auto_782197 ?auto_782201 ) ) ( not ( = ?auto_782197 ?auto_782202 ) ) ( not ( = ?auto_782197 ?auto_782203 ) ) ( not ( = ?auto_782197 ?auto_782204 ) ) ( not ( = ?auto_782197 ?auto_782205 ) ) ( not ( = ?auto_782197 ?auto_782206 ) ) ( not ( = ?auto_782197 ?auto_782207 ) ) ( not ( = ?auto_782197 ?auto_782208 ) ) ( not ( = ?auto_782198 ?auto_782199 ) ) ( not ( = ?auto_782198 ?auto_782200 ) ) ( not ( = ?auto_782198 ?auto_782201 ) ) ( not ( = ?auto_782198 ?auto_782202 ) ) ( not ( = ?auto_782198 ?auto_782203 ) ) ( not ( = ?auto_782198 ?auto_782204 ) ) ( not ( = ?auto_782198 ?auto_782205 ) ) ( not ( = ?auto_782198 ?auto_782206 ) ) ( not ( = ?auto_782198 ?auto_782207 ) ) ( not ( = ?auto_782198 ?auto_782208 ) ) ( not ( = ?auto_782199 ?auto_782200 ) ) ( not ( = ?auto_782199 ?auto_782201 ) ) ( not ( = ?auto_782199 ?auto_782202 ) ) ( not ( = ?auto_782199 ?auto_782203 ) ) ( not ( = ?auto_782199 ?auto_782204 ) ) ( not ( = ?auto_782199 ?auto_782205 ) ) ( not ( = ?auto_782199 ?auto_782206 ) ) ( not ( = ?auto_782199 ?auto_782207 ) ) ( not ( = ?auto_782199 ?auto_782208 ) ) ( not ( = ?auto_782200 ?auto_782201 ) ) ( not ( = ?auto_782200 ?auto_782202 ) ) ( not ( = ?auto_782200 ?auto_782203 ) ) ( not ( = ?auto_782200 ?auto_782204 ) ) ( not ( = ?auto_782200 ?auto_782205 ) ) ( not ( = ?auto_782200 ?auto_782206 ) ) ( not ( = ?auto_782200 ?auto_782207 ) ) ( not ( = ?auto_782200 ?auto_782208 ) ) ( not ( = ?auto_782201 ?auto_782202 ) ) ( not ( = ?auto_782201 ?auto_782203 ) ) ( not ( = ?auto_782201 ?auto_782204 ) ) ( not ( = ?auto_782201 ?auto_782205 ) ) ( not ( = ?auto_782201 ?auto_782206 ) ) ( not ( = ?auto_782201 ?auto_782207 ) ) ( not ( = ?auto_782201 ?auto_782208 ) ) ( not ( = ?auto_782202 ?auto_782203 ) ) ( not ( = ?auto_782202 ?auto_782204 ) ) ( not ( = ?auto_782202 ?auto_782205 ) ) ( not ( = ?auto_782202 ?auto_782206 ) ) ( not ( = ?auto_782202 ?auto_782207 ) ) ( not ( = ?auto_782202 ?auto_782208 ) ) ( not ( = ?auto_782203 ?auto_782204 ) ) ( not ( = ?auto_782203 ?auto_782205 ) ) ( not ( = ?auto_782203 ?auto_782206 ) ) ( not ( = ?auto_782203 ?auto_782207 ) ) ( not ( = ?auto_782203 ?auto_782208 ) ) ( not ( = ?auto_782204 ?auto_782205 ) ) ( not ( = ?auto_782204 ?auto_782206 ) ) ( not ( = ?auto_782204 ?auto_782207 ) ) ( not ( = ?auto_782204 ?auto_782208 ) ) ( not ( = ?auto_782205 ?auto_782206 ) ) ( not ( = ?auto_782205 ?auto_782207 ) ) ( not ( = ?auto_782205 ?auto_782208 ) ) ( not ( = ?auto_782206 ?auto_782207 ) ) ( not ( = ?auto_782206 ?auto_782208 ) ) ( not ( = ?auto_782207 ?auto_782208 ) ) ( ON ?auto_782206 ?auto_782207 ) ( ON ?auto_782205 ?auto_782206 ) ( ON ?auto_782204 ?auto_782205 ) ( ON ?auto_782203 ?auto_782204 ) ( ON ?auto_782202 ?auto_782203 ) ( ON ?auto_782201 ?auto_782202 ) ( ON ?auto_782200 ?auto_782201 ) ( ON ?auto_782199 ?auto_782200 ) ( ON ?auto_782198 ?auto_782199 ) ( ON ?auto_782197 ?auto_782198 ) ( ON ?auto_782196 ?auto_782197 ) ( ON ?auto_782195 ?auto_782196 ) ( ON ?auto_782194 ?auto_782195 ) ( ON ?auto_782193 ?auto_782194 ) ( CLEAR ?auto_782191 ) ( ON ?auto_782192 ?auto_782193 ) ( CLEAR ?auto_782192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_782191 ?auto_782192 )
      ( MAKE-17PILE ?auto_782191 ?auto_782192 ?auto_782193 ?auto_782194 ?auto_782195 ?auto_782196 ?auto_782197 ?auto_782198 ?auto_782199 ?auto_782200 ?auto_782201 ?auto_782202 ?auto_782203 ?auto_782204 ?auto_782205 ?auto_782206 ?auto_782207 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_782261 - BLOCK
      ?auto_782262 - BLOCK
      ?auto_782263 - BLOCK
      ?auto_782264 - BLOCK
      ?auto_782265 - BLOCK
      ?auto_782266 - BLOCK
      ?auto_782267 - BLOCK
      ?auto_782268 - BLOCK
      ?auto_782269 - BLOCK
      ?auto_782270 - BLOCK
      ?auto_782271 - BLOCK
      ?auto_782272 - BLOCK
      ?auto_782273 - BLOCK
      ?auto_782274 - BLOCK
      ?auto_782275 - BLOCK
      ?auto_782276 - BLOCK
      ?auto_782277 - BLOCK
    )
    :vars
    (
      ?auto_782278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_782277 ?auto_782278 ) ( not ( = ?auto_782261 ?auto_782262 ) ) ( not ( = ?auto_782261 ?auto_782263 ) ) ( not ( = ?auto_782261 ?auto_782264 ) ) ( not ( = ?auto_782261 ?auto_782265 ) ) ( not ( = ?auto_782261 ?auto_782266 ) ) ( not ( = ?auto_782261 ?auto_782267 ) ) ( not ( = ?auto_782261 ?auto_782268 ) ) ( not ( = ?auto_782261 ?auto_782269 ) ) ( not ( = ?auto_782261 ?auto_782270 ) ) ( not ( = ?auto_782261 ?auto_782271 ) ) ( not ( = ?auto_782261 ?auto_782272 ) ) ( not ( = ?auto_782261 ?auto_782273 ) ) ( not ( = ?auto_782261 ?auto_782274 ) ) ( not ( = ?auto_782261 ?auto_782275 ) ) ( not ( = ?auto_782261 ?auto_782276 ) ) ( not ( = ?auto_782261 ?auto_782277 ) ) ( not ( = ?auto_782261 ?auto_782278 ) ) ( not ( = ?auto_782262 ?auto_782263 ) ) ( not ( = ?auto_782262 ?auto_782264 ) ) ( not ( = ?auto_782262 ?auto_782265 ) ) ( not ( = ?auto_782262 ?auto_782266 ) ) ( not ( = ?auto_782262 ?auto_782267 ) ) ( not ( = ?auto_782262 ?auto_782268 ) ) ( not ( = ?auto_782262 ?auto_782269 ) ) ( not ( = ?auto_782262 ?auto_782270 ) ) ( not ( = ?auto_782262 ?auto_782271 ) ) ( not ( = ?auto_782262 ?auto_782272 ) ) ( not ( = ?auto_782262 ?auto_782273 ) ) ( not ( = ?auto_782262 ?auto_782274 ) ) ( not ( = ?auto_782262 ?auto_782275 ) ) ( not ( = ?auto_782262 ?auto_782276 ) ) ( not ( = ?auto_782262 ?auto_782277 ) ) ( not ( = ?auto_782262 ?auto_782278 ) ) ( not ( = ?auto_782263 ?auto_782264 ) ) ( not ( = ?auto_782263 ?auto_782265 ) ) ( not ( = ?auto_782263 ?auto_782266 ) ) ( not ( = ?auto_782263 ?auto_782267 ) ) ( not ( = ?auto_782263 ?auto_782268 ) ) ( not ( = ?auto_782263 ?auto_782269 ) ) ( not ( = ?auto_782263 ?auto_782270 ) ) ( not ( = ?auto_782263 ?auto_782271 ) ) ( not ( = ?auto_782263 ?auto_782272 ) ) ( not ( = ?auto_782263 ?auto_782273 ) ) ( not ( = ?auto_782263 ?auto_782274 ) ) ( not ( = ?auto_782263 ?auto_782275 ) ) ( not ( = ?auto_782263 ?auto_782276 ) ) ( not ( = ?auto_782263 ?auto_782277 ) ) ( not ( = ?auto_782263 ?auto_782278 ) ) ( not ( = ?auto_782264 ?auto_782265 ) ) ( not ( = ?auto_782264 ?auto_782266 ) ) ( not ( = ?auto_782264 ?auto_782267 ) ) ( not ( = ?auto_782264 ?auto_782268 ) ) ( not ( = ?auto_782264 ?auto_782269 ) ) ( not ( = ?auto_782264 ?auto_782270 ) ) ( not ( = ?auto_782264 ?auto_782271 ) ) ( not ( = ?auto_782264 ?auto_782272 ) ) ( not ( = ?auto_782264 ?auto_782273 ) ) ( not ( = ?auto_782264 ?auto_782274 ) ) ( not ( = ?auto_782264 ?auto_782275 ) ) ( not ( = ?auto_782264 ?auto_782276 ) ) ( not ( = ?auto_782264 ?auto_782277 ) ) ( not ( = ?auto_782264 ?auto_782278 ) ) ( not ( = ?auto_782265 ?auto_782266 ) ) ( not ( = ?auto_782265 ?auto_782267 ) ) ( not ( = ?auto_782265 ?auto_782268 ) ) ( not ( = ?auto_782265 ?auto_782269 ) ) ( not ( = ?auto_782265 ?auto_782270 ) ) ( not ( = ?auto_782265 ?auto_782271 ) ) ( not ( = ?auto_782265 ?auto_782272 ) ) ( not ( = ?auto_782265 ?auto_782273 ) ) ( not ( = ?auto_782265 ?auto_782274 ) ) ( not ( = ?auto_782265 ?auto_782275 ) ) ( not ( = ?auto_782265 ?auto_782276 ) ) ( not ( = ?auto_782265 ?auto_782277 ) ) ( not ( = ?auto_782265 ?auto_782278 ) ) ( not ( = ?auto_782266 ?auto_782267 ) ) ( not ( = ?auto_782266 ?auto_782268 ) ) ( not ( = ?auto_782266 ?auto_782269 ) ) ( not ( = ?auto_782266 ?auto_782270 ) ) ( not ( = ?auto_782266 ?auto_782271 ) ) ( not ( = ?auto_782266 ?auto_782272 ) ) ( not ( = ?auto_782266 ?auto_782273 ) ) ( not ( = ?auto_782266 ?auto_782274 ) ) ( not ( = ?auto_782266 ?auto_782275 ) ) ( not ( = ?auto_782266 ?auto_782276 ) ) ( not ( = ?auto_782266 ?auto_782277 ) ) ( not ( = ?auto_782266 ?auto_782278 ) ) ( not ( = ?auto_782267 ?auto_782268 ) ) ( not ( = ?auto_782267 ?auto_782269 ) ) ( not ( = ?auto_782267 ?auto_782270 ) ) ( not ( = ?auto_782267 ?auto_782271 ) ) ( not ( = ?auto_782267 ?auto_782272 ) ) ( not ( = ?auto_782267 ?auto_782273 ) ) ( not ( = ?auto_782267 ?auto_782274 ) ) ( not ( = ?auto_782267 ?auto_782275 ) ) ( not ( = ?auto_782267 ?auto_782276 ) ) ( not ( = ?auto_782267 ?auto_782277 ) ) ( not ( = ?auto_782267 ?auto_782278 ) ) ( not ( = ?auto_782268 ?auto_782269 ) ) ( not ( = ?auto_782268 ?auto_782270 ) ) ( not ( = ?auto_782268 ?auto_782271 ) ) ( not ( = ?auto_782268 ?auto_782272 ) ) ( not ( = ?auto_782268 ?auto_782273 ) ) ( not ( = ?auto_782268 ?auto_782274 ) ) ( not ( = ?auto_782268 ?auto_782275 ) ) ( not ( = ?auto_782268 ?auto_782276 ) ) ( not ( = ?auto_782268 ?auto_782277 ) ) ( not ( = ?auto_782268 ?auto_782278 ) ) ( not ( = ?auto_782269 ?auto_782270 ) ) ( not ( = ?auto_782269 ?auto_782271 ) ) ( not ( = ?auto_782269 ?auto_782272 ) ) ( not ( = ?auto_782269 ?auto_782273 ) ) ( not ( = ?auto_782269 ?auto_782274 ) ) ( not ( = ?auto_782269 ?auto_782275 ) ) ( not ( = ?auto_782269 ?auto_782276 ) ) ( not ( = ?auto_782269 ?auto_782277 ) ) ( not ( = ?auto_782269 ?auto_782278 ) ) ( not ( = ?auto_782270 ?auto_782271 ) ) ( not ( = ?auto_782270 ?auto_782272 ) ) ( not ( = ?auto_782270 ?auto_782273 ) ) ( not ( = ?auto_782270 ?auto_782274 ) ) ( not ( = ?auto_782270 ?auto_782275 ) ) ( not ( = ?auto_782270 ?auto_782276 ) ) ( not ( = ?auto_782270 ?auto_782277 ) ) ( not ( = ?auto_782270 ?auto_782278 ) ) ( not ( = ?auto_782271 ?auto_782272 ) ) ( not ( = ?auto_782271 ?auto_782273 ) ) ( not ( = ?auto_782271 ?auto_782274 ) ) ( not ( = ?auto_782271 ?auto_782275 ) ) ( not ( = ?auto_782271 ?auto_782276 ) ) ( not ( = ?auto_782271 ?auto_782277 ) ) ( not ( = ?auto_782271 ?auto_782278 ) ) ( not ( = ?auto_782272 ?auto_782273 ) ) ( not ( = ?auto_782272 ?auto_782274 ) ) ( not ( = ?auto_782272 ?auto_782275 ) ) ( not ( = ?auto_782272 ?auto_782276 ) ) ( not ( = ?auto_782272 ?auto_782277 ) ) ( not ( = ?auto_782272 ?auto_782278 ) ) ( not ( = ?auto_782273 ?auto_782274 ) ) ( not ( = ?auto_782273 ?auto_782275 ) ) ( not ( = ?auto_782273 ?auto_782276 ) ) ( not ( = ?auto_782273 ?auto_782277 ) ) ( not ( = ?auto_782273 ?auto_782278 ) ) ( not ( = ?auto_782274 ?auto_782275 ) ) ( not ( = ?auto_782274 ?auto_782276 ) ) ( not ( = ?auto_782274 ?auto_782277 ) ) ( not ( = ?auto_782274 ?auto_782278 ) ) ( not ( = ?auto_782275 ?auto_782276 ) ) ( not ( = ?auto_782275 ?auto_782277 ) ) ( not ( = ?auto_782275 ?auto_782278 ) ) ( not ( = ?auto_782276 ?auto_782277 ) ) ( not ( = ?auto_782276 ?auto_782278 ) ) ( not ( = ?auto_782277 ?auto_782278 ) ) ( ON ?auto_782276 ?auto_782277 ) ( ON ?auto_782275 ?auto_782276 ) ( ON ?auto_782274 ?auto_782275 ) ( ON ?auto_782273 ?auto_782274 ) ( ON ?auto_782272 ?auto_782273 ) ( ON ?auto_782271 ?auto_782272 ) ( ON ?auto_782270 ?auto_782271 ) ( ON ?auto_782269 ?auto_782270 ) ( ON ?auto_782268 ?auto_782269 ) ( ON ?auto_782267 ?auto_782268 ) ( ON ?auto_782266 ?auto_782267 ) ( ON ?auto_782265 ?auto_782266 ) ( ON ?auto_782264 ?auto_782265 ) ( ON ?auto_782263 ?auto_782264 ) ( ON ?auto_782262 ?auto_782263 ) ( ON ?auto_782261 ?auto_782262 ) ( CLEAR ?auto_782261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_782261 )
      ( MAKE-17PILE ?auto_782261 ?auto_782262 ?auto_782263 ?auto_782264 ?auto_782265 ?auto_782266 ?auto_782267 ?auto_782268 ?auto_782269 ?auto_782270 ?auto_782271 ?auto_782272 ?auto_782273 ?auto_782274 ?auto_782275 ?auto_782276 ?auto_782277 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_782332 - BLOCK
      ?auto_782333 - BLOCK
      ?auto_782334 - BLOCK
      ?auto_782335 - BLOCK
      ?auto_782336 - BLOCK
      ?auto_782337 - BLOCK
      ?auto_782338 - BLOCK
      ?auto_782339 - BLOCK
      ?auto_782340 - BLOCK
      ?auto_782341 - BLOCK
      ?auto_782342 - BLOCK
      ?auto_782343 - BLOCK
      ?auto_782344 - BLOCK
      ?auto_782345 - BLOCK
      ?auto_782346 - BLOCK
      ?auto_782347 - BLOCK
      ?auto_782348 - BLOCK
      ?auto_782349 - BLOCK
    )
    :vars
    (
      ?auto_782350 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_782348 ) ( ON ?auto_782349 ?auto_782350 ) ( CLEAR ?auto_782349 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_782332 ) ( ON ?auto_782333 ?auto_782332 ) ( ON ?auto_782334 ?auto_782333 ) ( ON ?auto_782335 ?auto_782334 ) ( ON ?auto_782336 ?auto_782335 ) ( ON ?auto_782337 ?auto_782336 ) ( ON ?auto_782338 ?auto_782337 ) ( ON ?auto_782339 ?auto_782338 ) ( ON ?auto_782340 ?auto_782339 ) ( ON ?auto_782341 ?auto_782340 ) ( ON ?auto_782342 ?auto_782341 ) ( ON ?auto_782343 ?auto_782342 ) ( ON ?auto_782344 ?auto_782343 ) ( ON ?auto_782345 ?auto_782344 ) ( ON ?auto_782346 ?auto_782345 ) ( ON ?auto_782347 ?auto_782346 ) ( ON ?auto_782348 ?auto_782347 ) ( not ( = ?auto_782332 ?auto_782333 ) ) ( not ( = ?auto_782332 ?auto_782334 ) ) ( not ( = ?auto_782332 ?auto_782335 ) ) ( not ( = ?auto_782332 ?auto_782336 ) ) ( not ( = ?auto_782332 ?auto_782337 ) ) ( not ( = ?auto_782332 ?auto_782338 ) ) ( not ( = ?auto_782332 ?auto_782339 ) ) ( not ( = ?auto_782332 ?auto_782340 ) ) ( not ( = ?auto_782332 ?auto_782341 ) ) ( not ( = ?auto_782332 ?auto_782342 ) ) ( not ( = ?auto_782332 ?auto_782343 ) ) ( not ( = ?auto_782332 ?auto_782344 ) ) ( not ( = ?auto_782332 ?auto_782345 ) ) ( not ( = ?auto_782332 ?auto_782346 ) ) ( not ( = ?auto_782332 ?auto_782347 ) ) ( not ( = ?auto_782332 ?auto_782348 ) ) ( not ( = ?auto_782332 ?auto_782349 ) ) ( not ( = ?auto_782332 ?auto_782350 ) ) ( not ( = ?auto_782333 ?auto_782334 ) ) ( not ( = ?auto_782333 ?auto_782335 ) ) ( not ( = ?auto_782333 ?auto_782336 ) ) ( not ( = ?auto_782333 ?auto_782337 ) ) ( not ( = ?auto_782333 ?auto_782338 ) ) ( not ( = ?auto_782333 ?auto_782339 ) ) ( not ( = ?auto_782333 ?auto_782340 ) ) ( not ( = ?auto_782333 ?auto_782341 ) ) ( not ( = ?auto_782333 ?auto_782342 ) ) ( not ( = ?auto_782333 ?auto_782343 ) ) ( not ( = ?auto_782333 ?auto_782344 ) ) ( not ( = ?auto_782333 ?auto_782345 ) ) ( not ( = ?auto_782333 ?auto_782346 ) ) ( not ( = ?auto_782333 ?auto_782347 ) ) ( not ( = ?auto_782333 ?auto_782348 ) ) ( not ( = ?auto_782333 ?auto_782349 ) ) ( not ( = ?auto_782333 ?auto_782350 ) ) ( not ( = ?auto_782334 ?auto_782335 ) ) ( not ( = ?auto_782334 ?auto_782336 ) ) ( not ( = ?auto_782334 ?auto_782337 ) ) ( not ( = ?auto_782334 ?auto_782338 ) ) ( not ( = ?auto_782334 ?auto_782339 ) ) ( not ( = ?auto_782334 ?auto_782340 ) ) ( not ( = ?auto_782334 ?auto_782341 ) ) ( not ( = ?auto_782334 ?auto_782342 ) ) ( not ( = ?auto_782334 ?auto_782343 ) ) ( not ( = ?auto_782334 ?auto_782344 ) ) ( not ( = ?auto_782334 ?auto_782345 ) ) ( not ( = ?auto_782334 ?auto_782346 ) ) ( not ( = ?auto_782334 ?auto_782347 ) ) ( not ( = ?auto_782334 ?auto_782348 ) ) ( not ( = ?auto_782334 ?auto_782349 ) ) ( not ( = ?auto_782334 ?auto_782350 ) ) ( not ( = ?auto_782335 ?auto_782336 ) ) ( not ( = ?auto_782335 ?auto_782337 ) ) ( not ( = ?auto_782335 ?auto_782338 ) ) ( not ( = ?auto_782335 ?auto_782339 ) ) ( not ( = ?auto_782335 ?auto_782340 ) ) ( not ( = ?auto_782335 ?auto_782341 ) ) ( not ( = ?auto_782335 ?auto_782342 ) ) ( not ( = ?auto_782335 ?auto_782343 ) ) ( not ( = ?auto_782335 ?auto_782344 ) ) ( not ( = ?auto_782335 ?auto_782345 ) ) ( not ( = ?auto_782335 ?auto_782346 ) ) ( not ( = ?auto_782335 ?auto_782347 ) ) ( not ( = ?auto_782335 ?auto_782348 ) ) ( not ( = ?auto_782335 ?auto_782349 ) ) ( not ( = ?auto_782335 ?auto_782350 ) ) ( not ( = ?auto_782336 ?auto_782337 ) ) ( not ( = ?auto_782336 ?auto_782338 ) ) ( not ( = ?auto_782336 ?auto_782339 ) ) ( not ( = ?auto_782336 ?auto_782340 ) ) ( not ( = ?auto_782336 ?auto_782341 ) ) ( not ( = ?auto_782336 ?auto_782342 ) ) ( not ( = ?auto_782336 ?auto_782343 ) ) ( not ( = ?auto_782336 ?auto_782344 ) ) ( not ( = ?auto_782336 ?auto_782345 ) ) ( not ( = ?auto_782336 ?auto_782346 ) ) ( not ( = ?auto_782336 ?auto_782347 ) ) ( not ( = ?auto_782336 ?auto_782348 ) ) ( not ( = ?auto_782336 ?auto_782349 ) ) ( not ( = ?auto_782336 ?auto_782350 ) ) ( not ( = ?auto_782337 ?auto_782338 ) ) ( not ( = ?auto_782337 ?auto_782339 ) ) ( not ( = ?auto_782337 ?auto_782340 ) ) ( not ( = ?auto_782337 ?auto_782341 ) ) ( not ( = ?auto_782337 ?auto_782342 ) ) ( not ( = ?auto_782337 ?auto_782343 ) ) ( not ( = ?auto_782337 ?auto_782344 ) ) ( not ( = ?auto_782337 ?auto_782345 ) ) ( not ( = ?auto_782337 ?auto_782346 ) ) ( not ( = ?auto_782337 ?auto_782347 ) ) ( not ( = ?auto_782337 ?auto_782348 ) ) ( not ( = ?auto_782337 ?auto_782349 ) ) ( not ( = ?auto_782337 ?auto_782350 ) ) ( not ( = ?auto_782338 ?auto_782339 ) ) ( not ( = ?auto_782338 ?auto_782340 ) ) ( not ( = ?auto_782338 ?auto_782341 ) ) ( not ( = ?auto_782338 ?auto_782342 ) ) ( not ( = ?auto_782338 ?auto_782343 ) ) ( not ( = ?auto_782338 ?auto_782344 ) ) ( not ( = ?auto_782338 ?auto_782345 ) ) ( not ( = ?auto_782338 ?auto_782346 ) ) ( not ( = ?auto_782338 ?auto_782347 ) ) ( not ( = ?auto_782338 ?auto_782348 ) ) ( not ( = ?auto_782338 ?auto_782349 ) ) ( not ( = ?auto_782338 ?auto_782350 ) ) ( not ( = ?auto_782339 ?auto_782340 ) ) ( not ( = ?auto_782339 ?auto_782341 ) ) ( not ( = ?auto_782339 ?auto_782342 ) ) ( not ( = ?auto_782339 ?auto_782343 ) ) ( not ( = ?auto_782339 ?auto_782344 ) ) ( not ( = ?auto_782339 ?auto_782345 ) ) ( not ( = ?auto_782339 ?auto_782346 ) ) ( not ( = ?auto_782339 ?auto_782347 ) ) ( not ( = ?auto_782339 ?auto_782348 ) ) ( not ( = ?auto_782339 ?auto_782349 ) ) ( not ( = ?auto_782339 ?auto_782350 ) ) ( not ( = ?auto_782340 ?auto_782341 ) ) ( not ( = ?auto_782340 ?auto_782342 ) ) ( not ( = ?auto_782340 ?auto_782343 ) ) ( not ( = ?auto_782340 ?auto_782344 ) ) ( not ( = ?auto_782340 ?auto_782345 ) ) ( not ( = ?auto_782340 ?auto_782346 ) ) ( not ( = ?auto_782340 ?auto_782347 ) ) ( not ( = ?auto_782340 ?auto_782348 ) ) ( not ( = ?auto_782340 ?auto_782349 ) ) ( not ( = ?auto_782340 ?auto_782350 ) ) ( not ( = ?auto_782341 ?auto_782342 ) ) ( not ( = ?auto_782341 ?auto_782343 ) ) ( not ( = ?auto_782341 ?auto_782344 ) ) ( not ( = ?auto_782341 ?auto_782345 ) ) ( not ( = ?auto_782341 ?auto_782346 ) ) ( not ( = ?auto_782341 ?auto_782347 ) ) ( not ( = ?auto_782341 ?auto_782348 ) ) ( not ( = ?auto_782341 ?auto_782349 ) ) ( not ( = ?auto_782341 ?auto_782350 ) ) ( not ( = ?auto_782342 ?auto_782343 ) ) ( not ( = ?auto_782342 ?auto_782344 ) ) ( not ( = ?auto_782342 ?auto_782345 ) ) ( not ( = ?auto_782342 ?auto_782346 ) ) ( not ( = ?auto_782342 ?auto_782347 ) ) ( not ( = ?auto_782342 ?auto_782348 ) ) ( not ( = ?auto_782342 ?auto_782349 ) ) ( not ( = ?auto_782342 ?auto_782350 ) ) ( not ( = ?auto_782343 ?auto_782344 ) ) ( not ( = ?auto_782343 ?auto_782345 ) ) ( not ( = ?auto_782343 ?auto_782346 ) ) ( not ( = ?auto_782343 ?auto_782347 ) ) ( not ( = ?auto_782343 ?auto_782348 ) ) ( not ( = ?auto_782343 ?auto_782349 ) ) ( not ( = ?auto_782343 ?auto_782350 ) ) ( not ( = ?auto_782344 ?auto_782345 ) ) ( not ( = ?auto_782344 ?auto_782346 ) ) ( not ( = ?auto_782344 ?auto_782347 ) ) ( not ( = ?auto_782344 ?auto_782348 ) ) ( not ( = ?auto_782344 ?auto_782349 ) ) ( not ( = ?auto_782344 ?auto_782350 ) ) ( not ( = ?auto_782345 ?auto_782346 ) ) ( not ( = ?auto_782345 ?auto_782347 ) ) ( not ( = ?auto_782345 ?auto_782348 ) ) ( not ( = ?auto_782345 ?auto_782349 ) ) ( not ( = ?auto_782345 ?auto_782350 ) ) ( not ( = ?auto_782346 ?auto_782347 ) ) ( not ( = ?auto_782346 ?auto_782348 ) ) ( not ( = ?auto_782346 ?auto_782349 ) ) ( not ( = ?auto_782346 ?auto_782350 ) ) ( not ( = ?auto_782347 ?auto_782348 ) ) ( not ( = ?auto_782347 ?auto_782349 ) ) ( not ( = ?auto_782347 ?auto_782350 ) ) ( not ( = ?auto_782348 ?auto_782349 ) ) ( not ( = ?auto_782348 ?auto_782350 ) ) ( not ( = ?auto_782349 ?auto_782350 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_782349 ?auto_782350 )
      ( !STACK ?auto_782349 ?auto_782348 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_782369 - BLOCK
      ?auto_782370 - BLOCK
      ?auto_782371 - BLOCK
      ?auto_782372 - BLOCK
      ?auto_782373 - BLOCK
      ?auto_782374 - BLOCK
      ?auto_782375 - BLOCK
      ?auto_782376 - BLOCK
      ?auto_782377 - BLOCK
      ?auto_782378 - BLOCK
      ?auto_782379 - BLOCK
      ?auto_782380 - BLOCK
      ?auto_782381 - BLOCK
      ?auto_782382 - BLOCK
      ?auto_782383 - BLOCK
      ?auto_782384 - BLOCK
      ?auto_782385 - BLOCK
      ?auto_782386 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_782385 ) ( ON-TABLE ?auto_782386 ) ( CLEAR ?auto_782386 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_782369 ) ( ON ?auto_782370 ?auto_782369 ) ( ON ?auto_782371 ?auto_782370 ) ( ON ?auto_782372 ?auto_782371 ) ( ON ?auto_782373 ?auto_782372 ) ( ON ?auto_782374 ?auto_782373 ) ( ON ?auto_782375 ?auto_782374 ) ( ON ?auto_782376 ?auto_782375 ) ( ON ?auto_782377 ?auto_782376 ) ( ON ?auto_782378 ?auto_782377 ) ( ON ?auto_782379 ?auto_782378 ) ( ON ?auto_782380 ?auto_782379 ) ( ON ?auto_782381 ?auto_782380 ) ( ON ?auto_782382 ?auto_782381 ) ( ON ?auto_782383 ?auto_782382 ) ( ON ?auto_782384 ?auto_782383 ) ( ON ?auto_782385 ?auto_782384 ) ( not ( = ?auto_782369 ?auto_782370 ) ) ( not ( = ?auto_782369 ?auto_782371 ) ) ( not ( = ?auto_782369 ?auto_782372 ) ) ( not ( = ?auto_782369 ?auto_782373 ) ) ( not ( = ?auto_782369 ?auto_782374 ) ) ( not ( = ?auto_782369 ?auto_782375 ) ) ( not ( = ?auto_782369 ?auto_782376 ) ) ( not ( = ?auto_782369 ?auto_782377 ) ) ( not ( = ?auto_782369 ?auto_782378 ) ) ( not ( = ?auto_782369 ?auto_782379 ) ) ( not ( = ?auto_782369 ?auto_782380 ) ) ( not ( = ?auto_782369 ?auto_782381 ) ) ( not ( = ?auto_782369 ?auto_782382 ) ) ( not ( = ?auto_782369 ?auto_782383 ) ) ( not ( = ?auto_782369 ?auto_782384 ) ) ( not ( = ?auto_782369 ?auto_782385 ) ) ( not ( = ?auto_782369 ?auto_782386 ) ) ( not ( = ?auto_782370 ?auto_782371 ) ) ( not ( = ?auto_782370 ?auto_782372 ) ) ( not ( = ?auto_782370 ?auto_782373 ) ) ( not ( = ?auto_782370 ?auto_782374 ) ) ( not ( = ?auto_782370 ?auto_782375 ) ) ( not ( = ?auto_782370 ?auto_782376 ) ) ( not ( = ?auto_782370 ?auto_782377 ) ) ( not ( = ?auto_782370 ?auto_782378 ) ) ( not ( = ?auto_782370 ?auto_782379 ) ) ( not ( = ?auto_782370 ?auto_782380 ) ) ( not ( = ?auto_782370 ?auto_782381 ) ) ( not ( = ?auto_782370 ?auto_782382 ) ) ( not ( = ?auto_782370 ?auto_782383 ) ) ( not ( = ?auto_782370 ?auto_782384 ) ) ( not ( = ?auto_782370 ?auto_782385 ) ) ( not ( = ?auto_782370 ?auto_782386 ) ) ( not ( = ?auto_782371 ?auto_782372 ) ) ( not ( = ?auto_782371 ?auto_782373 ) ) ( not ( = ?auto_782371 ?auto_782374 ) ) ( not ( = ?auto_782371 ?auto_782375 ) ) ( not ( = ?auto_782371 ?auto_782376 ) ) ( not ( = ?auto_782371 ?auto_782377 ) ) ( not ( = ?auto_782371 ?auto_782378 ) ) ( not ( = ?auto_782371 ?auto_782379 ) ) ( not ( = ?auto_782371 ?auto_782380 ) ) ( not ( = ?auto_782371 ?auto_782381 ) ) ( not ( = ?auto_782371 ?auto_782382 ) ) ( not ( = ?auto_782371 ?auto_782383 ) ) ( not ( = ?auto_782371 ?auto_782384 ) ) ( not ( = ?auto_782371 ?auto_782385 ) ) ( not ( = ?auto_782371 ?auto_782386 ) ) ( not ( = ?auto_782372 ?auto_782373 ) ) ( not ( = ?auto_782372 ?auto_782374 ) ) ( not ( = ?auto_782372 ?auto_782375 ) ) ( not ( = ?auto_782372 ?auto_782376 ) ) ( not ( = ?auto_782372 ?auto_782377 ) ) ( not ( = ?auto_782372 ?auto_782378 ) ) ( not ( = ?auto_782372 ?auto_782379 ) ) ( not ( = ?auto_782372 ?auto_782380 ) ) ( not ( = ?auto_782372 ?auto_782381 ) ) ( not ( = ?auto_782372 ?auto_782382 ) ) ( not ( = ?auto_782372 ?auto_782383 ) ) ( not ( = ?auto_782372 ?auto_782384 ) ) ( not ( = ?auto_782372 ?auto_782385 ) ) ( not ( = ?auto_782372 ?auto_782386 ) ) ( not ( = ?auto_782373 ?auto_782374 ) ) ( not ( = ?auto_782373 ?auto_782375 ) ) ( not ( = ?auto_782373 ?auto_782376 ) ) ( not ( = ?auto_782373 ?auto_782377 ) ) ( not ( = ?auto_782373 ?auto_782378 ) ) ( not ( = ?auto_782373 ?auto_782379 ) ) ( not ( = ?auto_782373 ?auto_782380 ) ) ( not ( = ?auto_782373 ?auto_782381 ) ) ( not ( = ?auto_782373 ?auto_782382 ) ) ( not ( = ?auto_782373 ?auto_782383 ) ) ( not ( = ?auto_782373 ?auto_782384 ) ) ( not ( = ?auto_782373 ?auto_782385 ) ) ( not ( = ?auto_782373 ?auto_782386 ) ) ( not ( = ?auto_782374 ?auto_782375 ) ) ( not ( = ?auto_782374 ?auto_782376 ) ) ( not ( = ?auto_782374 ?auto_782377 ) ) ( not ( = ?auto_782374 ?auto_782378 ) ) ( not ( = ?auto_782374 ?auto_782379 ) ) ( not ( = ?auto_782374 ?auto_782380 ) ) ( not ( = ?auto_782374 ?auto_782381 ) ) ( not ( = ?auto_782374 ?auto_782382 ) ) ( not ( = ?auto_782374 ?auto_782383 ) ) ( not ( = ?auto_782374 ?auto_782384 ) ) ( not ( = ?auto_782374 ?auto_782385 ) ) ( not ( = ?auto_782374 ?auto_782386 ) ) ( not ( = ?auto_782375 ?auto_782376 ) ) ( not ( = ?auto_782375 ?auto_782377 ) ) ( not ( = ?auto_782375 ?auto_782378 ) ) ( not ( = ?auto_782375 ?auto_782379 ) ) ( not ( = ?auto_782375 ?auto_782380 ) ) ( not ( = ?auto_782375 ?auto_782381 ) ) ( not ( = ?auto_782375 ?auto_782382 ) ) ( not ( = ?auto_782375 ?auto_782383 ) ) ( not ( = ?auto_782375 ?auto_782384 ) ) ( not ( = ?auto_782375 ?auto_782385 ) ) ( not ( = ?auto_782375 ?auto_782386 ) ) ( not ( = ?auto_782376 ?auto_782377 ) ) ( not ( = ?auto_782376 ?auto_782378 ) ) ( not ( = ?auto_782376 ?auto_782379 ) ) ( not ( = ?auto_782376 ?auto_782380 ) ) ( not ( = ?auto_782376 ?auto_782381 ) ) ( not ( = ?auto_782376 ?auto_782382 ) ) ( not ( = ?auto_782376 ?auto_782383 ) ) ( not ( = ?auto_782376 ?auto_782384 ) ) ( not ( = ?auto_782376 ?auto_782385 ) ) ( not ( = ?auto_782376 ?auto_782386 ) ) ( not ( = ?auto_782377 ?auto_782378 ) ) ( not ( = ?auto_782377 ?auto_782379 ) ) ( not ( = ?auto_782377 ?auto_782380 ) ) ( not ( = ?auto_782377 ?auto_782381 ) ) ( not ( = ?auto_782377 ?auto_782382 ) ) ( not ( = ?auto_782377 ?auto_782383 ) ) ( not ( = ?auto_782377 ?auto_782384 ) ) ( not ( = ?auto_782377 ?auto_782385 ) ) ( not ( = ?auto_782377 ?auto_782386 ) ) ( not ( = ?auto_782378 ?auto_782379 ) ) ( not ( = ?auto_782378 ?auto_782380 ) ) ( not ( = ?auto_782378 ?auto_782381 ) ) ( not ( = ?auto_782378 ?auto_782382 ) ) ( not ( = ?auto_782378 ?auto_782383 ) ) ( not ( = ?auto_782378 ?auto_782384 ) ) ( not ( = ?auto_782378 ?auto_782385 ) ) ( not ( = ?auto_782378 ?auto_782386 ) ) ( not ( = ?auto_782379 ?auto_782380 ) ) ( not ( = ?auto_782379 ?auto_782381 ) ) ( not ( = ?auto_782379 ?auto_782382 ) ) ( not ( = ?auto_782379 ?auto_782383 ) ) ( not ( = ?auto_782379 ?auto_782384 ) ) ( not ( = ?auto_782379 ?auto_782385 ) ) ( not ( = ?auto_782379 ?auto_782386 ) ) ( not ( = ?auto_782380 ?auto_782381 ) ) ( not ( = ?auto_782380 ?auto_782382 ) ) ( not ( = ?auto_782380 ?auto_782383 ) ) ( not ( = ?auto_782380 ?auto_782384 ) ) ( not ( = ?auto_782380 ?auto_782385 ) ) ( not ( = ?auto_782380 ?auto_782386 ) ) ( not ( = ?auto_782381 ?auto_782382 ) ) ( not ( = ?auto_782381 ?auto_782383 ) ) ( not ( = ?auto_782381 ?auto_782384 ) ) ( not ( = ?auto_782381 ?auto_782385 ) ) ( not ( = ?auto_782381 ?auto_782386 ) ) ( not ( = ?auto_782382 ?auto_782383 ) ) ( not ( = ?auto_782382 ?auto_782384 ) ) ( not ( = ?auto_782382 ?auto_782385 ) ) ( not ( = ?auto_782382 ?auto_782386 ) ) ( not ( = ?auto_782383 ?auto_782384 ) ) ( not ( = ?auto_782383 ?auto_782385 ) ) ( not ( = ?auto_782383 ?auto_782386 ) ) ( not ( = ?auto_782384 ?auto_782385 ) ) ( not ( = ?auto_782384 ?auto_782386 ) ) ( not ( = ?auto_782385 ?auto_782386 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_782386 )
      ( !STACK ?auto_782386 ?auto_782385 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_782405 - BLOCK
      ?auto_782406 - BLOCK
      ?auto_782407 - BLOCK
      ?auto_782408 - BLOCK
      ?auto_782409 - BLOCK
      ?auto_782410 - BLOCK
      ?auto_782411 - BLOCK
      ?auto_782412 - BLOCK
      ?auto_782413 - BLOCK
      ?auto_782414 - BLOCK
      ?auto_782415 - BLOCK
      ?auto_782416 - BLOCK
      ?auto_782417 - BLOCK
      ?auto_782418 - BLOCK
      ?auto_782419 - BLOCK
      ?auto_782420 - BLOCK
      ?auto_782421 - BLOCK
      ?auto_782422 - BLOCK
    )
    :vars
    (
      ?auto_782423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_782422 ?auto_782423 ) ( ON-TABLE ?auto_782405 ) ( ON ?auto_782406 ?auto_782405 ) ( ON ?auto_782407 ?auto_782406 ) ( ON ?auto_782408 ?auto_782407 ) ( ON ?auto_782409 ?auto_782408 ) ( ON ?auto_782410 ?auto_782409 ) ( ON ?auto_782411 ?auto_782410 ) ( ON ?auto_782412 ?auto_782411 ) ( ON ?auto_782413 ?auto_782412 ) ( ON ?auto_782414 ?auto_782413 ) ( ON ?auto_782415 ?auto_782414 ) ( ON ?auto_782416 ?auto_782415 ) ( ON ?auto_782417 ?auto_782416 ) ( ON ?auto_782418 ?auto_782417 ) ( ON ?auto_782419 ?auto_782418 ) ( ON ?auto_782420 ?auto_782419 ) ( not ( = ?auto_782405 ?auto_782406 ) ) ( not ( = ?auto_782405 ?auto_782407 ) ) ( not ( = ?auto_782405 ?auto_782408 ) ) ( not ( = ?auto_782405 ?auto_782409 ) ) ( not ( = ?auto_782405 ?auto_782410 ) ) ( not ( = ?auto_782405 ?auto_782411 ) ) ( not ( = ?auto_782405 ?auto_782412 ) ) ( not ( = ?auto_782405 ?auto_782413 ) ) ( not ( = ?auto_782405 ?auto_782414 ) ) ( not ( = ?auto_782405 ?auto_782415 ) ) ( not ( = ?auto_782405 ?auto_782416 ) ) ( not ( = ?auto_782405 ?auto_782417 ) ) ( not ( = ?auto_782405 ?auto_782418 ) ) ( not ( = ?auto_782405 ?auto_782419 ) ) ( not ( = ?auto_782405 ?auto_782420 ) ) ( not ( = ?auto_782405 ?auto_782421 ) ) ( not ( = ?auto_782405 ?auto_782422 ) ) ( not ( = ?auto_782405 ?auto_782423 ) ) ( not ( = ?auto_782406 ?auto_782407 ) ) ( not ( = ?auto_782406 ?auto_782408 ) ) ( not ( = ?auto_782406 ?auto_782409 ) ) ( not ( = ?auto_782406 ?auto_782410 ) ) ( not ( = ?auto_782406 ?auto_782411 ) ) ( not ( = ?auto_782406 ?auto_782412 ) ) ( not ( = ?auto_782406 ?auto_782413 ) ) ( not ( = ?auto_782406 ?auto_782414 ) ) ( not ( = ?auto_782406 ?auto_782415 ) ) ( not ( = ?auto_782406 ?auto_782416 ) ) ( not ( = ?auto_782406 ?auto_782417 ) ) ( not ( = ?auto_782406 ?auto_782418 ) ) ( not ( = ?auto_782406 ?auto_782419 ) ) ( not ( = ?auto_782406 ?auto_782420 ) ) ( not ( = ?auto_782406 ?auto_782421 ) ) ( not ( = ?auto_782406 ?auto_782422 ) ) ( not ( = ?auto_782406 ?auto_782423 ) ) ( not ( = ?auto_782407 ?auto_782408 ) ) ( not ( = ?auto_782407 ?auto_782409 ) ) ( not ( = ?auto_782407 ?auto_782410 ) ) ( not ( = ?auto_782407 ?auto_782411 ) ) ( not ( = ?auto_782407 ?auto_782412 ) ) ( not ( = ?auto_782407 ?auto_782413 ) ) ( not ( = ?auto_782407 ?auto_782414 ) ) ( not ( = ?auto_782407 ?auto_782415 ) ) ( not ( = ?auto_782407 ?auto_782416 ) ) ( not ( = ?auto_782407 ?auto_782417 ) ) ( not ( = ?auto_782407 ?auto_782418 ) ) ( not ( = ?auto_782407 ?auto_782419 ) ) ( not ( = ?auto_782407 ?auto_782420 ) ) ( not ( = ?auto_782407 ?auto_782421 ) ) ( not ( = ?auto_782407 ?auto_782422 ) ) ( not ( = ?auto_782407 ?auto_782423 ) ) ( not ( = ?auto_782408 ?auto_782409 ) ) ( not ( = ?auto_782408 ?auto_782410 ) ) ( not ( = ?auto_782408 ?auto_782411 ) ) ( not ( = ?auto_782408 ?auto_782412 ) ) ( not ( = ?auto_782408 ?auto_782413 ) ) ( not ( = ?auto_782408 ?auto_782414 ) ) ( not ( = ?auto_782408 ?auto_782415 ) ) ( not ( = ?auto_782408 ?auto_782416 ) ) ( not ( = ?auto_782408 ?auto_782417 ) ) ( not ( = ?auto_782408 ?auto_782418 ) ) ( not ( = ?auto_782408 ?auto_782419 ) ) ( not ( = ?auto_782408 ?auto_782420 ) ) ( not ( = ?auto_782408 ?auto_782421 ) ) ( not ( = ?auto_782408 ?auto_782422 ) ) ( not ( = ?auto_782408 ?auto_782423 ) ) ( not ( = ?auto_782409 ?auto_782410 ) ) ( not ( = ?auto_782409 ?auto_782411 ) ) ( not ( = ?auto_782409 ?auto_782412 ) ) ( not ( = ?auto_782409 ?auto_782413 ) ) ( not ( = ?auto_782409 ?auto_782414 ) ) ( not ( = ?auto_782409 ?auto_782415 ) ) ( not ( = ?auto_782409 ?auto_782416 ) ) ( not ( = ?auto_782409 ?auto_782417 ) ) ( not ( = ?auto_782409 ?auto_782418 ) ) ( not ( = ?auto_782409 ?auto_782419 ) ) ( not ( = ?auto_782409 ?auto_782420 ) ) ( not ( = ?auto_782409 ?auto_782421 ) ) ( not ( = ?auto_782409 ?auto_782422 ) ) ( not ( = ?auto_782409 ?auto_782423 ) ) ( not ( = ?auto_782410 ?auto_782411 ) ) ( not ( = ?auto_782410 ?auto_782412 ) ) ( not ( = ?auto_782410 ?auto_782413 ) ) ( not ( = ?auto_782410 ?auto_782414 ) ) ( not ( = ?auto_782410 ?auto_782415 ) ) ( not ( = ?auto_782410 ?auto_782416 ) ) ( not ( = ?auto_782410 ?auto_782417 ) ) ( not ( = ?auto_782410 ?auto_782418 ) ) ( not ( = ?auto_782410 ?auto_782419 ) ) ( not ( = ?auto_782410 ?auto_782420 ) ) ( not ( = ?auto_782410 ?auto_782421 ) ) ( not ( = ?auto_782410 ?auto_782422 ) ) ( not ( = ?auto_782410 ?auto_782423 ) ) ( not ( = ?auto_782411 ?auto_782412 ) ) ( not ( = ?auto_782411 ?auto_782413 ) ) ( not ( = ?auto_782411 ?auto_782414 ) ) ( not ( = ?auto_782411 ?auto_782415 ) ) ( not ( = ?auto_782411 ?auto_782416 ) ) ( not ( = ?auto_782411 ?auto_782417 ) ) ( not ( = ?auto_782411 ?auto_782418 ) ) ( not ( = ?auto_782411 ?auto_782419 ) ) ( not ( = ?auto_782411 ?auto_782420 ) ) ( not ( = ?auto_782411 ?auto_782421 ) ) ( not ( = ?auto_782411 ?auto_782422 ) ) ( not ( = ?auto_782411 ?auto_782423 ) ) ( not ( = ?auto_782412 ?auto_782413 ) ) ( not ( = ?auto_782412 ?auto_782414 ) ) ( not ( = ?auto_782412 ?auto_782415 ) ) ( not ( = ?auto_782412 ?auto_782416 ) ) ( not ( = ?auto_782412 ?auto_782417 ) ) ( not ( = ?auto_782412 ?auto_782418 ) ) ( not ( = ?auto_782412 ?auto_782419 ) ) ( not ( = ?auto_782412 ?auto_782420 ) ) ( not ( = ?auto_782412 ?auto_782421 ) ) ( not ( = ?auto_782412 ?auto_782422 ) ) ( not ( = ?auto_782412 ?auto_782423 ) ) ( not ( = ?auto_782413 ?auto_782414 ) ) ( not ( = ?auto_782413 ?auto_782415 ) ) ( not ( = ?auto_782413 ?auto_782416 ) ) ( not ( = ?auto_782413 ?auto_782417 ) ) ( not ( = ?auto_782413 ?auto_782418 ) ) ( not ( = ?auto_782413 ?auto_782419 ) ) ( not ( = ?auto_782413 ?auto_782420 ) ) ( not ( = ?auto_782413 ?auto_782421 ) ) ( not ( = ?auto_782413 ?auto_782422 ) ) ( not ( = ?auto_782413 ?auto_782423 ) ) ( not ( = ?auto_782414 ?auto_782415 ) ) ( not ( = ?auto_782414 ?auto_782416 ) ) ( not ( = ?auto_782414 ?auto_782417 ) ) ( not ( = ?auto_782414 ?auto_782418 ) ) ( not ( = ?auto_782414 ?auto_782419 ) ) ( not ( = ?auto_782414 ?auto_782420 ) ) ( not ( = ?auto_782414 ?auto_782421 ) ) ( not ( = ?auto_782414 ?auto_782422 ) ) ( not ( = ?auto_782414 ?auto_782423 ) ) ( not ( = ?auto_782415 ?auto_782416 ) ) ( not ( = ?auto_782415 ?auto_782417 ) ) ( not ( = ?auto_782415 ?auto_782418 ) ) ( not ( = ?auto_782415 ?auto_782419 ) ) ( not ( = ?auto_782415 ?auto_782420 ) ) ( not ( = ?auto_782415 ?auto_782421 ) ) ( not ( = ?auto_782415 ?auto_782422 ) ) ( not ( = ?auto_782415 ?auto_782423 ) ) ( not ( = ?auto_782416 ?auto_782417 ) ) ( not ( = ?auto_782416 ?auto_782418 ) ) ( not ( = ?auto_782416 ?auto_782419 ) ) ( not ( = ?auto_782416 ?auto_782420 ) ) ( not ( = ?auto_782416 ?auto_782421 ) ) ( not ( = ?auto_782416 ?auto_782422 ) ) ( not ( = ?auto_782416 ?auto_782423 ) ) ( not ( = ?auto_782417 ?auto_782418 ) ) ( not ( = ?auto_782417 ?auto_782419 ) ) ( not ( = ?auto_782417 ?auto_782420 ) ) ( not ( = ?auto_782417 ?auto_782421 ) ) ( not ( = ?auto_782417 ?auto_782422 ) ) ( not ( = ?auto_782417 ?auto_782423 ) ) ( not ( = ?auto_782418 ?auto_782419 ) ) ( not ( = ?auto_782418 ?auto_782420 ) ) ( not ( = ?auto_782418 ?auto_782421 ) ) ( not ( = ?auto_782418 ?auto_782422 ) ) ( not ( = ?auto_782418 ?auto_782423 ) ) ( not ( = ?auto_782419 ?auto_782420 ) ) ( not ( = ?auto_782419 ?auto_782421 ) ) ( not ( = ?auto_782419 ?auto_782422 ) ) ( not ( = ?auto_782419 ?auto_782423 ) ) ( not ( = ?auto_782420 ?auto_782421 ) ) ( not ( = ?auto_782420 ?auto_782422 ) ) ( not ( = ?auto_782420 ?auto_782423 ) ) ( not ( = ?auto_782421 ?auto_782422 ) ) ( not ( = ?auto_782421 ?auto_782423 ) ) ( not ( = ?auto_782422 ?auto_782423 ) ) ( CLEAR ?auto_782420 ) ( ON ?auto_782421 ?auto_782422 ) ( CLEAR ?auto_782421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_782405 ?auto_782406 ?auto_782407 ?auto_782408 ?auto_782409 ?auto_782410 ?auto_782411 ?auto_782412 ?auto_782413 ?auto_782414 ?auto_782415 ?auto_782416 ?auto_782417 ?auto_782418 ?auto_782419 ?auto_782420 ?auto_782421 )
      ( MAKE-18PILE ?auto_782405 ?auto_782406 ?auto_782407 ?auto_782408 ?auto_782409 ?auto_782410 ?auto_782411 ?auto_782412 ?auto_782413 ?auto_782414 ?auto_782415 ?auto_782416 ?auto_782417 ?auto_782418 ?auto_782419 ?auto_782420 ?auto_782421 ?auto_782422 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_782442 - BLOCK
      ?auto_782443 - BLOCK
      ?auto_782444 - BLOCK
      ?auto_782445 - BLOCK
      ?auto_782446 - BLOCK
      ?auto_782447 - BLOCK
      ?auto_782448 - BLOCK
      ?auto_782449 - BLOCK
      ?auto_782450 - BLOCK
      ?auto_782451 - BLOCK
      ?auto_782452 - BLOCK
      ?auto_782453 - BLOCK
      ?auto_782454 - BLOCK
      ?auto_782455 - BLOCK
      ?auto_782456 - BLOCK
      ?auto_782457 - BLOCK
      ?auto_782458 - BLOCK
      ?auto_782459 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_782459 ) ( ON-TABLE ?auto_782442 ) ( ON ?auto_782443 ?auto_782442 ) ( ON ?auto_782444 ?auto_782443 ) ( ON ?auto_782445 ?auto_782444 ) ( ON ?auto_782446 ?auto_782445 ) ( ON ?auto_782447 ?auto_782446 ) ( ON ?auto_782448 ?auto_782447 ) ( ON ?auto_782449 ?auto_782448 ) ( ON ?auto_782450 ?auto_782449 ) ( ON ?auto_782451 ?auto_782450 ) ( ON ?auto_782452 ?auto_782451 ) ( ON ?auto_782453 ?auto_782452 ) ( ON ?auto_782454 ?auto_782453 ) ( ON ?auto_782455 ?auto_782454 ) ( ON ?auto_782456 ?auto_782455 ) ( ON ?auto_782457 ?auto_782456 ) ( not ( = ?auto_782442 ?auto_782443 ) ) ( not ( = ?auto_782442 ?auto_782444 ) ) ( not ( = ?auto_782442 ?auto_782445 ) ) ( not ( = ?auto_782442 ?auto_782446 ) ) ( not ( = ?auto_782442 ?auto_782447 ) ) ( not ( = ?auto_782442 ?auto_782448 ) ) ( not ( = ?auto_782442 ?auto_782449 ) ) ( not ( = ?auto_782442 ?auto_782450 ) ) ( not ( = ?auto_782442 ?auto_782451 ) ) ( not ( = ?auto_782442 ?auto_782452 ) ) ( not ( = ?auto_782442 ?auto_782453 ) ) ( not ( = ?auto_782442 ?auto_782454 ) ) ( not ( = ?auto_782442 ?auto_782455 ) ) ( not ( = ?auto_782442 ?auto_782456 ) ) ( not ( = ?auto_782442 ?auto_782457 ) ) ( not ( = ?auto_782442 ?auto_782458 ) ) ( not ( = ?auto_782442 ?auto_782459 ) ) ( not ( = ?auto_782443 ?auto_782444 ) ) ( not ( = ?auto_782443 ?auto_782445 ) ) ( not ( = ?auto_782443 ?auto_782446 ) ) ( not ( = ?auto_782443 ?auto_782447 ) ) ( not ( = ?auto_782443 ?auto_782448 ) ) ( not ( = ?auto_782443 ?auto_782449 ) ) ( not ( = ?auto_782443 ?auto_782450 ) ) ( not ( = ?auto_782443 ?auto_782451 ) ) ( not ( = ?auto_782443 ?auto_782452 ) ) ( not ( = ?auto_782443 ?auto_782453 ) ) ( not ( = ?auto_782443 ?auto_782454 ) ) ( not ( = ?auto_782443 ?auto_782455 ) ) ( not ( = ?auto_782443 ?auto_782456 ) ) ( not ( = ?auto_782443 ?auto_782457 ) ) ( not ( = ?auto_782443 ?auto_782458 ) ) ( not ( = ?auto_782443 ?auto_782459 ) ) ( not ( = ?auto_782444 ?auto_782445 ) ) ( not ( = ?auto_782444 ?auto_782446 ) ) ( not ( = ?auto_782444 ?auto_782447 ) ) ( not ( = ?auto_782444 ?auto_782448 ) ) ( not ( = ?auto_782444 ?auto_782449 ) ) ( not ( = ?auto_782444 ?auto_782450 ) ) ( not ( = ?auto_782444 ?auto_782451 ) ) ( not ( = ?auto_782444 ?auto_782452 ) ) ( not ( = ?auto_782444 ?auto_782453 ) ) ( not ( = ?auto_782444 ?auto_782454 ) ) ( not ( = ?auto_782444 ?auto_782455 ) ) ( not ( = ?auto_782444 ?auto_782456 ) ) ( not ( = ?auto_782444 ?auto_782457 ) ) ( not ( = ?auto_782444 ?auto_782458 ) ) ( not ( = ?auto_782444 ?auto_782459 ) ) ( not ( = ?auto_782445 ?auto_782446 ) ) ( not ( = ?auto_782445 ?auto_782447 ) ) ( not ( = ?auto_782445 ?auto_782448 ) ) ( not ( = ?auto_782445 ?auto_782449 ) ) ( not ( = ?auto_782445 ?auto_782450 ) ) ( not ( = ?auto_782445 ?auto_782451 ) ) ( not ( = ?auto_782445 ?auto_782452 ) ) ( not ( = ?auto_782445 ?auto_782453 ) ) ( not ( = ?auto_782445 ?auto_782454 ) ) ( not ( = ?auto_782445 ?auto_782455 ) ) ( not ( = ?auto_782445 ?auto_782456 ) ) ( not ( = ?auto_782445 ?auto_782457 ) ) ( not ( = ?auto_782445 ?auto_782458 ) ) ( not ( = ?auto_782445 ?auto_782459 ) ) ( not ( = ?auto_782446 ?auto_782447 ) ) ( not ( = ?auto_782446 ?auto_782448 ) ) ( not ( = ?auto_782446 ?auto_782449 ) ) ( not ( = ?auto_782446 ?auto_782450 ) ) ( not ( = ?auto_782446 ?auto_782451 ) ) ( not ( = ?auto_782446 ?auto_782452 ) ) ( not ( = ?auto_782446 ?auto_782453 ) ) ( not ( = ?auto_782446 ?auto_782454 ) ) ( not ( = ?auto_782446 ?auto_782455 ) ) ( not ( = ?auto_782446 ?auto_782456 ) ) ( not ( = ?auto_782446 ?auto_782457 ) ) ( not ( = ?auto_782446 ?auto_782458 ) ) ( not ( = ?auto_782446 ?auto_782459 ) ) ( not ( = ?auto_782447 ?auto_782448 ) ) ( not ( = ?auto_782447 ?auto_782449 ) ) ( not ( = ?auto_782447 ?auto_782450 ) ) ( not ( = ?auto_782447 ?auto_782451 ) ) ( not ( = ?auto_782447 ?auto_782452 ) ) ( not ( = ?auto_782447 ?auto_782453 ) ) ( not ( = ?auto_782447 ?auto_782454 ) ) ( not ( = ?auto_782447 ?auto_782455 ) ) ( not ( = ?auto_782447 ?auto_782456 ) ) ( not ( = ?auto_782447 ?auto_782457 ) ) ( not ( = ?auto_782447 ?auto_782458 ) ) ( not ( = ?auto_782447 ?auto_782459 ) ) ( not ( = ?auto_782448 ?auto_782449 ) ) ( not ( = ?auto_782448 ?auto_782450 ) ) ( not ( = ?auto_782448 ?auto_782451 ) ) ( not ( = ?auto_782448 ?auto_782452 ) ) ( not ( = ?auto_782448 ?auto_782453 ) ) ( not ( = ?auto_782448 ?auto_782454 ) ) ( not ( = ?auto_782448 ?auto_782455 ) ) ( not ( = ?auto_782448 ?auto_782456 ) ) ( not ( = ?auto_782448 ?auto_782457 ) ) ( not ( = ?auto_782448 ?auto_782458 ) ) ( not ( = ?auto_782448 ?auto_782459 ) ) ( not ( = ?auto_782449 ?auto_782450 ) ) ( not ( = ?auto_782449 ?auto_782451 ) ) ( not ( = ?auto_782449 ?auto_782452 ) ) ( not ( = ?auto_782449 ?auto_782453 ) ) ( not ( = ?auto_782449 ?auto_782454 ) ) ( not ( = ?auto_782449 ?auto_782455 ) ) ( not ( = ?auto_782449 ?auto_782456 ) ) ( not ( = ?auto_782449 ?auto_782457 ) ) ( not ( = ?auto_782449 ?auto_782458 ) ) ( not ( = ?auto_782449 ?auto_782459 ) ) ( not ( = ?auto_782450 ?auto_782451 ) ) ( not ( = ?auto_782450 ?auto_782452 ) ) ( not ( = ?auto_782450 ?auto_782453 ) ) ( not ( = ?auto_782450 ?auto_782454 ) ) ( not ( = ?auto_782450 ?auto_782455 ) ) ( not ( = ?auto_782450 ?auto_782456 ) ) ( not ( = ?auto_782450 ?auto_782457 ) ) ( not ( = ?auto_782450 ?auto_782458 ) ) ( not ( = ?auto_782450 ?auto_782459 ) ) ( not ( = ?auto_782451 ?auto_782452 ) ) ( not ( = ?auto_782451 ?auto_782453 ) ) ( not ( = ?auto_782451 ?auto_782454 ) ) ( not ( = ?auto_782451 ?auto_782455 ) ) ( not ( = ?auto_782451 ?auto_782456 ) ) ( not ( = ?auto_782451 ?auto_782457 ) ) ( not ( = ?auto_782451 ?auto_782458 ) ) ( not ( = ?auto_782451 ?auto_782459 ) ) ( not ( = ?auto_782452 ?auto_782453 ) ) ( not ( = ?auto_782452 ?auto_782454 ) ) ( not ( = ?auto_782452 ?auto_782455 ) ) ( not ( = ?auto_782452 ?auto_782456 ) ) ( not ( = ?auto_782452 ?auto_782457 ) ) ( not ( = ?auto_782452 ?auto_782458 ) ) ( not ( = ?auto_782452 ?auto_782459 ) ) ( not ( = ?auto_782453 ?auto_782454 ) ) ( not ( = ?auto_782453 ?auto_782455 ) ) ( not ( = ?auto_782453 ?auto_782456 ) ) ( not ( = ?auto_782453 ?auto_782457 ) ) ( not ( = ?auto_782453 ?auto_782458 ) ) ( not ( = ?auto_782453 ?auto_782459 ) ) ( not ( = ?auto_782454 ?auto_782455 ) ) ( not ( = ?auto_782454 ?auto_782456 ) ) ( not ( = ?auto_782454 ?auto_782457 ) ) ( not ( = ?auto_782454 ?auto_782458 ) ) ( not ( = ?auto_782454 ?auto_782459 ) ) ( not ( = ?auto_782455 ?auto_782456 ) ) ( not ( = ?auto_782455 ?auto_782457 ) ) ( not ( = ?auto_782455 ?auto_782458 ) ) ( not ( = ?auto_782455 ?auto_782459 ) ) ( not ( = ?auto_782456 ?auto_782457 ) ) ( not ( = ?auto_782456 ?auto_782458 ) ) ( not ( = ?auto_782456 ?auto_782459 ) ) ( not ( = ?auto_782457 ?auto_782458 ) ) ( not ( = ?auto_782457 ?auto_782459 ) ) ( not ( = ?auto_782458 ?auto_782459 ) ) ( CLEAR ?auto_782457 ) ( ON ?auto_782458 ?auto_782459 ) ( CLEAR ?auto_782458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_782442 ?auto_782443 ?auto_782444 ?auto_782445 ?auto_782446 ?auto_782447 ?auto_782448 ?auto_782449 ?auto_782450 ?auto_782451 ?auto_782452 ?auto_782453 ?auto_782454 ?auto_782455 ?auto_782456 ?auto_782457 ?auto_782458 )
      ( MAKE-18PILE ?auto_782442 ?auto_782443 ?auto_782444 ?auto_782445 ?auto_782446 ?auto_782447 ?auto_782448 ?auto_782449 ?auto_782450 ?auto_782451 ?auto_782452 ?auto_782453 ?auto_782454 ?auto_782455 ?auto_782456 ?auto_782457 ?auto_782458 ?auto_782459 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_782478 - BLOCK
      ?auto_782479 - BLOCK
      ?auto_782480 - BLOCK
      ?auto_782481 - BLOCK
      ?auto_782482 - BLOCK
      ?auto_782483 - BLOCK
      ?auto_782484 - BLOCK
      ?auto_782485 - BLOCK
      ?auto_782486 - BLOCK
      ?auto_782487 - BLOCK
      ?auto_782488 - BLOCK
      ?auto_782489 - BLOCK
      ?auto_782490 - BLOCK
      ?auto_782491 - BLOCK
      ?auto_782492 - BLOCK
      ?auto_782493 - BLOCK
      ?auto_782494 - BLOCK
      ?auto_782495 - BLOCK
    )
    :vars
    (
      ?auto_782496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_782495 ?auto_782496 ) ( ON-TABLE ?auto_782478 ) ( ON ?auto_782479 ?auto_782478 ) ( ON ?auto_782480 ?auto_782479 ) ( ON ?auto_782481 ?auto_782480 ) ( ON ?auto_782482 ?auto_782481 ) ( ON ?auto_782483 ?auto_782482 ) ( ON ?auto_782484 ?auto_782483 ) ( ON ?auto_782485 ?auto_782484 ) ( ON ?auto_782486 ?auto_782485 ) ( ON ?auto_782487 ?auto_782486 ) ( ON ?auto_782488 ?auto_782487 ) ( ON ?auto_782489 ?auto_782488 ) ( ON ?auto_782490 ?auto_782489 ) ( ON ?auto_782491 ?auto_782490 ) ( ON ?auto_782492 ?auto_782491 ) ( not ( = ?auto_782478 ?auto_782479 ) ) ( not ( = ?auto_782478 ?auto_782480 ) ) ( not ( = ?auto_782478 ?auto_782481 ) ) ( not ( = ?auto_782478 ?auto_782482 ) ) ( not ( = ?auto_782478 ?auto_782483 ) ) ( not ( = ?auto_782478 ?auto_782484 ) ) ( not ( = ?auto_782478 ?auto_782485 ) ) ( not ( = ?auto_782478 ?auto_782486 ) ) ( not ( = ?auto_782478 ?auto_782487 ) ) ( not ( = ?auto_782478 ?auto_782488 ) ) ( not ( = ?auto_782478 ?auto_782489 ) ) ( not ( = ?auto_782478 ?auto_782490 ) ) ( not ( = ?auto_782478 ?auto_782491 ) ) ( not ( = ?auto_782478 ?auto_782492 ) ) ( not ( = ?auto_782478 ?auto_782493 ) ) ( not ( = ?auto_782478 ?auto_782494 ) ) ( not ( = ?auto_782478 ?auto_782495 ) ) ( not ( = ?auto_782478 ?auto_782496 ) ) ( not ( = ?auto_782479 ?auto_782480 ) ) ( not ( = ?auto_782479 ?auto_782481 ) ) ( not ( = ?auto_782479 ?auto_782482 ) ) ( not ( = ?auto_782479 ?auto_782483 ) ) ( not ( = ?auto_782479 ?auto_782484 ) ) ( not ( = ?auto_782479 ?auto_782485 ) ) ( not ( = ?auto_782479 ?auto_782486 ) ) ( not ( = ?auto_782479 ?auto_782487 ) ) ( not ( = ?auto_782479 ?auto_782488 ) ) ( not ( = ?auto_782479 ?auto_782489 ) ) ( not ( = ?auto_782479 ?auto_782490 ) ) ( not ( = ?auto_782479 ?auto_782491 ) ) ( not ( = ?auto_782479 ?auto_782492 ) ) ( not ( = ?auto_782479 ?auto_782493 ) ) ( not ( = ?auto_782479 ?auto_782494 ) ) ( not ( = ?auto_782479 ?auto_782495 ) ) ( not ( = ?auto_782479 ?auto_782496 ) ) ( not ( = ?auto_782480 ?auto_782481 ) ) ( not ( = ?auto_782480 ?auto_782482 ) ) ( not ( = ?auto_782480 ?auto_782483 ) ) ( not ( = ?auto_782480 ?auto_782484 ) ) ( not ( = ?auto_782480 ?auto_782485 ) ) ( not ( = ?auto_782480 ?auto_782486 ) ) ( not ( = ?auto_782480 ?auto_782487 ) ) ( not ( = ?auto_782480 ?auto_782488 ) ) ( not ( = ?auto_782480 ?auto_782489 ) ) ( not ( = ?auto_782480 ?auto_782490 ) ) ( not ( = ?auto_782480 ?auto_782491 ) ) ( not ( = ?auto_782480 ?auto_782492 ) ) ( not ( = ?auto_782480 ?auto_782493 ) ) ( not ( = ?auto_782480 ?auto_782494 ) ) ( not ( = ?auto_782480 ?auto_782495 ) ) ( not ( = ?auto_782480 ?auto_782496 ) ) ( not ( = ?auto_782481 ?auto_782482 ) ) ( not ( = ?auto_782481 ?auto_782483 ) ) ( not ( = ?auto_782481 ?auto_782484 ) ) ( not ( = ?auto_782481 ?auto_782485 ) ) ( not ( = ?auto_782481 ?auto_782486 ) ) ( not ( = ?auto_782481 ?auto_782487 ) ) ( not ( = ?auto_782481 ?auto_782488 ) ) ( not ( = ?auto_782481 ?auto_782489 ) ) ( not ( = ?auto_782481 ?auto_782490 ) ) ( not ( = ?auto_782481 ?auto_782491 ) ) ( not ( = ?auto_782481 ?auto_782492 ) ) ( not ( = ?auto_782481 ?auto_782493 ) ) ( not ( = ?auto_782481 ?auto_782494 ) ) ( not ( = ?auto_782481 ?auto_782495 ) ) ( not ( = ?auto_782481 ?auto_782496 ) ) ( not ( = ?auto_782482 ?auto_782483 ) ) ( not ( = ?auto_782482 ?auto_782484 ) ) ( not ( = ?auto_782482 ?auto_782485 ) ) ( not ( = ?auto_782482 ?auto_782486 ) ) ( not ( = ?auto_782482 ?auto_782487 ) ) ( not ( = ?auto_782482 ?auto_782488 ) ) ( not ( = ?auto_782482 ?auto_782489 ) ) ( not ( = ?auto_782482 ?auto_782490 ) ) ( not ( = ?auto_782482 ?auto_782491 ) ) ( not ( = ?auto_782482 ?auto_782492 ) ) ( not ( = ?auto_782482 ?auto_782493 ) ) ( not ( = ?auto_782482 ?auto_782494 ) ) ( not ( = ?auto_782482 ?auto_782495 ) ) ( not ( = ?auto_782482 ?auto_782496 ) ) ( not ( = ?auto_782483 ?auto_782484 ) ) ( not ( = ?auto_782483 ?auto_782485 ) ) ( not ( = ?auto_782483 ?auto_782486 ) ) ( not ( = ?auto_782483 ?auto_782487 ) ) ( not ( = ?auto_782483 ?auto_782488 ) ) ( not ( = ?auto_782483 ?auto_782489 ) ) ( not ( = ?auto_782483 ?auto_782490 ) ) ( not ( = ?auto_782483 ?auto_782491 ) ) ( not ( = ?auto_782483 ?auto_782492 ) ) ( not ( = ?auto_782483 ?auto_782493 ) ) ( not ( = ?auto_782483 ?auto_782494 ) ) ( not ( = ?auto_782483 ?auto_782495 ) ) ( not ( = ?auto_782483 ?auto_782496 ) ) ( not ( = ?auto_782484 ?auto_782485 ) ) ( not ( = ?auto_782484 ?auto_782486 ) ) ( not ( = ?auto_782484 ?auto_782487 ) ) ( not ( = ?auto_782484 ?auto_782488 ) ) ( not ( = ?auto_782484 ?auto_782489 ) ) ( not ( = ?auto_782484 ?auto_782490 ) ) ( not ( = ?auto_782484 ?auto_782491 ) ) ( not ( = ?auto_782484 ?auto_782492 ) ) ( not ( = ?auto_782484 ?auto_782493 ) ) ( not ( = ?auto_782484 ?auto_782494 ) ) ( not ( = ?auto_782484 ?auto_782495 ) ) ( not ( = ?auto_782484 ?auto_782496 ) ) ( not ( = ?auto_782485 ?auto_782486 ) ) ( not ( = ?auto_782485 ?auto_782487 ) ) ( not ( = ?auto_782485 ?auto_782488 ) ) ( not ( = ?auto_782485 ?auto_782489 ) ) ( not ( = ?auto_782485 ?auto_782490 ) ) ( not ( = ?auto_782485 ?auto_782491 ) ) ( not ( = ?auto_782485 ?auto_782492 ) ) ( not ( = ?auto_782485 ?auto_782493 ) ) ( not ( = ?auto_782485 ?auto_782494 ) ) ( not ( = ?auto_782485 ?auto_782495 ) ) ( not ( = ?auto_782485 ?auto_782496 ) ) ( not ( = ?auto_782486 ?auto_782487 ) ) ( not ( = ?auto_782486 ?auto_782488 ) ) ( not ( = ?auto_782486 ?auto_782489 ) ) ( not ( = ?auto_782486 ?auto_782490 ) ) ( not ( = ?auto_782486 ?auto_782491 ) ) ( not ( = ?auto_782486 ?auto_782492 ) ) ( not ( = ?auto_782486 ?auto_782493 ) ) ( not ( = ?auto_782486 ?auto_782494 ) ) ( not ( = ?auto_782486 ?auto_782495 ) ) ( not ( = ?auto_782486 ?auto_782496 ) ) ( not ( = ?auto_782487 ?auto_782488 ) ) ( not ( = ?auto_782487 ?auto_782489 ) ) ( not ( = ?auto_782487 ?auto_782490 ) ) ( not ( = ?auto_782487 ?auto_782491 ) ) ( not ( = ?auto_782487 ?auto_782492 ) ) ( not ( = ?auto_782487 ?auto_782493 ) ) ( not ( = ?auto_782487 ?auto_782494 ) ) ( not ( = ?auto_782487 ?auto_782495 ) ) ( not ( = ?auto_782487 ?auto_782496 ) ) ( not ( = ?auto_782488 ?auto_782489 ) ) ( not ( = ?auto_782488 ?auto_782490 ) ) ( not ( = ?auto_782488 ?auto_782491 ) ) ( not ( = ?auto_782488 ?auto_782492 ) ) ( not ( = ?auto_782488 ?auto_782493 ) ) ( not ( = ?auto_782488 ?auto_782494 ) ) ( not ( = ?auto_782488 ?auto_782495 ) ) ( not ( = ?auto_782488 ?auto_782496 ) ) ( not ( = ?auto_782489 ?auto_782490 ) ) ( not ( = ?auto_782489 ?auto_782491 ) ) ( not ( = ?auto_782489 ?auto_782492 ) ) ( not ( = ?auto_782489 ?auto_782493 ) ) ( not ( = ?auto_782489 ?auto_782494 ) ) ( not ( = ?auto_782489 ?auto_782495 ) ) ( not ( = ?auto_782489 ?auto_782496 ) ) ( not ( = ?auto_782490 ?auto_782491 ) ) ( not ( = ?auto_782490 ?auto_782492 ) ) ( not ( = ?auto_782490 ?auto_782493 ) ) ( not ( = ?auto_782490 ?auto_782494 ) ) ( not ( = ?auto_782490 ?auto_782495 ) ) ( not ( = ?auto_782490 ?auto_782496 ) ) ( not ( = ?auto_782491 ?auto_782492 ) ) ( not ( = ?auto_782491 ?auto_782493 ) ) ( not ( = ?auto_782491 ?auto_782494 ) ) ( not ( = ?auto_782491 ?auto_782495 ) ) ( not ( = ?auto_782491 ?auto_782496 ) ) ( not ( = ?auto_782492 ?auto_782493 ) ) ( not ( = ?auto_782492 ?auto_782494 ) ) ( not ( = ?auto_782492 ?auto_782495 ) ) ( not ( = ?auto_782492 ?auto_782496 ) ) ( not ( = ?auto_782493 ?auto_782494 ) ) ( not ( = ?auto_782493 ?auto_782495 ) ) ( not ( = ?auto_782493 ?auto_782496 ) ) ( not ( = ?auto_782494 ?auto_782495 ) ) ( not ( = ?auto_782494 ?auto_782496 ) ) ( not ( = ?auto_782495 ?auto_782496 ) ) ( ON ?auto_782494 ?auto_782495 ) ( CLEAR ?auto_782492 ) ( ON ?auto_782493 ?auto_782494 ) ( CLEAR ?auto_782493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_782478 ?auto_782479 ?auto_782480 ?auto_782481 ?auto_782482 ?auto_782483 ?auto_782484 ?auto_782485 ?auto_782486 ?auto_782487 ?auto_782488 ?auto_782489 ?auto_782490 ?auto_782491 ?auto_782492 ?auto_782493 )
      ( MAKE-18PILE ?auto_782478 ?auto_782479 ?auto_782480 ?auto_782481 ?auto_782482 ?auto_782483 ?auto_782484 ?auto_782485 ?auto_782486 ?auto_782487 ?auto_782488 ?auto_782489 ?auto_782490 ?auto_782491 ?auto_782492 ?auto_782493 ?auto_782494 ?auto_782495 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_782515 - BLOCK
      ?auto_782516 - BLOCK
      ?auto_782517 - BLOCK
      ?auto_782518 - BLOCK
      ?auto_782519 - BLOCK
      ?auto_782520 - BLOCK
      ?auto_782521 - BLOCK
      ?auto_782522 - BLOCK
      ?auto_782523 - BLOCK
      ?auto_782524 - BLOCK
      ?auto_782525 - BLOCK
      ?auto_782526 - BLOCK
      ?auto_782527 - BLOCK
      ?auto_782528 - BLOCK
      ?auto_782529 - BLOCK
      ?auto_782530 - BLOCK
      ?auto_782531 - BLOCK
      ?auto_782532 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_782532 ) ( ON-TABLE ?auto_782515 ) ( ON ?auto_782516 ?auto_782515 ) ( ON ?auto_782517 ?auto_782516 ) ( ON ?auto_782518 ?auto_782517 ) ( ON ?auto_782519 ?auto_782518 ) ( ON ?auto_782520 ?auto_782519 ) ( ON ?auto_782521 ?auto_782520 ) ( ON ?auto_782522 ?auto_782521 ) ( ON ?auto_782523 ?auto_782522 ) ( ON ?auto_782524 ?auto_782523 ) ( ON ?auto_782525 ?auto_782524 ) ( ON ?auto_782526 ?auto_782525 ) ( ON ?auto_782527 ?auto_782526 ) ( ON ?auto_782528 ?auto_782527 ) ( ON ?auto_782529 ?auto_782528 ) ( not ( = ?auto_782515 ?auto_782516 ) ) ( not ( = ?auto_782515 ?auto_782517 ) ) ( not ( = ?auto_782515 ?auto_782518 ) ) ( not ( = ?auto_782515 ?auto_782519 ) ) ( not ( = ?auto_782515 ?auto_782520 ) ) ( not ( = ?auto_782515 ?auto_782521 ) ) ( not ( = ?auto_782515 ?auto_782522 ) ) ( not ( = ?auto_782515 ?auto_782523 ) ) ( not ( = ?auto_782515 ?auto_782524 ) ) ( not ( = ?auto_782515 ?auto_782525 ) ) ( not ( = ?auto_782515 ?auto_782526 ) ) ( not ( = ?auto_782515 ?auto_782527 ) ) ( not ( = ?auto_782515 ?auto_782528 ) ) ( not ( = ?auto_782515 ?auto_782529 ) ) ( not ( = ?auto_782515 ?auto_782530 ) ) ( not ( = ?auto_782515 ?auto_782531 ) ) ( not ( = ?auto_782515 ?auto_782532 ) ) ( not ( = ?auto_782516 ?auto_782517 ) ) ( not ( = ?auto_782516 ?auto_782518 ) ) ( not ( = ?auto_782516 ?auto_782519 ) ) ( not ( = ?auto_782516 ?auto_782520 ) ) ( not ( = ?auto_782516 ?auto_782521 ) ) ( not ( = ?auto_782516 ?auto_782522 ) ) ( not ( = ?auto_782516 ?auto_782523 ) ) ( not ( = ?auto_782516 ?auto_782524 ) ) ( not ( = ?auto_782516 ?auto_782525 ) ) ( not ( = ?auto_782516 ?auto_782526 ) ) ( not ( = ?auto_782516 ?auto_782527 ) ) ( not ( = ?auto_782516 ?auto_782528 ) ) ( not ( = ?auto_782516 ?auto_782529 ) ) ( not ( = ?auto_782516 ?auto_782530 ) ) ( not ( = ?auto_782516 ?auto_782531 ) ) ( not ( = ?auto_782516 ?auto_782532 ) ) ( not ( = ?auto_782517 ?auto_782518 ) ) ( not ( = ?auto_782517 ?auto_782519 ) ) ( not ( = ?auto_782517 ?auto_782520 ) ) ( not ( = ?auto_782517 ?auto_782521 ) ) ( not ( = ?auto_782517 ?auto_782522 ) ) ( not ( = ?auto_782517 ?auto_782523 ) ) ( not ( = ?auto_782517 ?auto_782524 ) ) ( not ( = ?auto_782517 ?auto_782525 ) ) ( not ( = ?auto_782517 ?auto_782526 ) ) ( not ( = ?auto_782517 ?auto_782527 ) ) ( not ( = ?auto_782517 ?auto_782528 ) ) ( not ( = ?auto_782517 ?auto_782529 ) ) ( not ( = ?auto_782517 ?auto_782530 ) ) ( not ( = ?auto_782517 ?auto_782531 ) ) ( not ( = ?auto_782517 ?auto_782532 ) ) ( not ( = ?auto_782518 ?auto_782519 ) ) ( not ( = ?auto_782518 ?auto_782520 ) ) ( not ( = ?auto_782518 ?auto_782521 ) ) ( not ( = ?auto_782518 ?auto_782522 ) ) ( not ( = ?auto_782518 ?auto_782523 ) ) ( not ( = ?auto_782518 ?auto_782524 ) ) ( not ( = ?auto_782518 ?auto_782525 ) ) ( not ( = ?auto_782518 ?auto_782526 ) ) ( not ( = ?auto_782518 ?auto_782527 ) ) ( not ( = ?auto_782518 ?auto_782528 ) ) ( not ( = ?auto_782518 ?auto_782529 ) ) ( not ( = ?auto_782518 ?auto_782530 ) ) ( not ( = ?auto_782518 ?auto_782531 ) ) ( not ( = ?auto_782518 ?auto_782532 ) ) ( not ( = ?auto_782519 ?auto_782520 ) ) ( not ( = ?auto_782519 ?auto_782521 ) ) ( not ( = ?auto_782519 ?auto_782522 ) ) ( not ( = ?auto_782519 ?auto_782523 ) ) ( not ( = ?auto_782519 ?auto_782524 ) ) ( not ( = ?auto_782519 ?auto_782525 ) ) ( not ( = ?auto_782519 ?auto_782526 ) ) ( not ( = ?auto_782519 ?auto_782527 ) ) ( not ( = ?auto_782519 ?auto_782528 ) ) ( not ( = ?auto_782519 ?auto_782529 ) ) ( not ( = ?auto_782519 ?auto_782530 ) ) ( not ( = ?auto_782519 ?auto_782531 ) ) ( not ( = ?auto_782519 ?auto_782532 ) ) ( not ( = ?auto_782520 ?auto_782521 ) ) ( not ( = ?auto_782520 ?auto_782522 ) ) ( not ( = ?auto_782520 ?auto_782523 ) ) ( not ( = ?auto_782520 ?auto_782524 ) ) ( not ( = ?auto_782520 ?auto_782525 ) ) ( not ( = ?auto_782520 ?auto_782526 ) ) ( not ( = ?auto_782520 ?auto_782527 ) ) ( not ( = ?auto_782520 ?auto_782528 ) ) ( not ( = ?auto_782520 ?auto_782529 ) ) ( not ( = ?auto_782520 ?auto_782530 ) ) ( not ( = ?auto_782520 ?auto_782531 ) ) ( not ( = ?auto_782520 ?auto_782532 ) ) ( not ( = ?auto_782521 ?auto_782522 ) ) ( not ( = ?auto_782521 ?auto_782523 ) ) ( not ( = ?auto_782521 ?auto_782524 ) ) ( not ( = ?auto_782521 ?auto_782525 ) ) ( not ( = ?auto_782521 ?auto_782526 ) ) ( not ( = ?auto_782521 ?auto_782527 ) ) ( not ( = ?auto_782521 ?auto_782528 ) ) ( not ( = ?auto_782521 ?auto_782529 ) ) ( not ( = ?auto_782521 ?auto_782530 ) ) ( not ( = ?auto_782521 ?auto_782531 ) ) ( not ( = ?auto_782521 ?auto_782532 ) ) ( not ( = ?auto_782522 ?auto_782523 ) ) ( not ( = ?auto_782522 ?auto_782524 ) ) ( not ( = ?auto_782522 ?auto_782525 ) ) ( not ( = ?auto_782522 ?auto_782526 ) ) ( not ( = ?auto_782522 ?auto_782527 ) ) ( not ( = ?auto_782522 ?auto_782528 ) ) ( not ( = ?auto_782522 ?auto_782529 ) ) ( not ( = ?auto_782522 ?auto_782530 ) ) ( not ( = ?auto_782522 ?auto_782531 ) ) ( not ( = ?auto_782522 ?auto_782532 ) ) ( not ( = ?auto_782523 ?auto_782524 ) ) ( not ( = ?auto_782523 ?auto_782525 ) ) ( not ( = ?auto_782523 ?auto_782526 ) ) ( not ( = ?auto_782523 ?auto_782527 ) ) ( not ( = ?auto_782523 ?auto_782528 ) ) ( not ( = ?auto_782523 ?auto_782529 ) ) ( not ( = ?auto_782523 ?auto_782530 ) ) ( not ( = ?auto_782523 ?auto_782531 ) ) ( not ( = ?auto_782523 ?auto_782532 ) ) ( not ( = ?auto_782524 ?auto_782525 ) ) ( not ( = ?auto_782524 ?auto_782526 ) ) ( not ( = ?auto_782524 ?auto_782527 ) ) ( not ( = ?auto_782524 ?auto_782528 ) ) ( not ( = ?auto_782524 ?auto_782529 ) ) ( not ( = ?auto_782524 ?auto_782530 ) ) ( not ( = ?auto_782524 ?auto_782531 ) ) ( not ( = ?auto_782524 ?auto_782532 ) ) ( not ( = ?auto_782525 ?auto_782526 ) ) ( not ( = ?auto_782525 ?auto_782527 ) ) ( not ( = ?auto_782525 ?auto_782528 ) ) ( not ( = ?auto_782525 ?auto_782529 ) ) ( not ( = ?auto_782525 ?auto_782530 ) ) ( not ( = ?auto_782525 ?auto_782531 ) ) ( not ( = ?auto_782525 ?auto_782532 ) ) ( not ( = ?auto_782526 ?auto_782527 ) ) ( not ( = ?auto_782526 ?auto_782528 ) ) ( not ( = ?auto_782526 ?auto_782529 ) ) ( not ( = ?auto_782526 ?auto_782530 ) ) ( not ( = ?auto_782526 ?auto_782531 ) ) ( not ( = ?auto_782526 ?auto_782532 ) ) ( not ( = ?auto_782527 ?auto_782528 ) ) ( not ( = ?auto_782527 ?auto_782529 ) ) ( not ( = ?auto_782527 ?auto_782530 ) ) ( not ( = ?auto_782527 ?auto_782531 ) ) ( not ( = ?auto_782527 ?auto_782532 ) ) ( not ( = ?auto_782528 ?auto_782529 ) ) ( not ( = ?auto_782528 ?auto_782530 ) ) ( not ( = ?auto_782528 ?auto_782531 ) ) ( not ( = ?auto_782528 ?auto_782532 ) ) ( not ( = ?auto_782529 ?auto_782530 ) ) ( not ( = ?auto_782529 ?auto_782531 ) ) ( not ( = ?auto_782529 ?auto_782532 ) ) ( not ( = ?auto_782530 ?auto_782531 ) ) ( not ( = ?auto_782530 ?auto_782532 ) ) ( not ( = ?auto_782531 ?auto_782532 ) ) ( ON ?auto_782531 ?auto_782532 ) ( CLEAR ?auto_782529 ) ( ON ?auto_782530 ?auto_782531 ) ( CLEAR ?auto_782530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_782515 ?auto_782516 ?auto_782517 ?auto_782518 ?auto_782519 ?auto_782520 ?auto_782521 ?auto_782522 ?auto_782523 ?auto_782524 ?auto_782525 ?auto_782526 ?auto_782527 ?auto_782528 ?auto_782529 ?auto_782530 )
      ( MAKE-18PILE ?auto_782515 ?auto_782516 ?auto_782517 ?auto_782518 ?auto_782519 ?auto_782520 ?auto_782521 ?auto_782522 ?auto_782523 ?auto_782524 ?auto_782525 ?auto_782526 ?auto_782527 ?auto_782528 ?auto_782529 ?auto_782530 ?auto_782531 ?auto_782532 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_782551 - BLOCK
      ?auto_782552 - BLOCK
      ?auto_782553 - BLOCK
      ?auto_782554 - BLOCK
      ?auto_782555 - BLOCK
      ?auto_782556 - BLOCK
      ?auto_782557 - BLOCK
      ?auto_782558 - BLOCK
      ?auto_782559 - BLOCK
      ?auto_782560 - BLOCK
      ?auto_782561 - BLOCK
      ?auto_782562 - BLOCK
      ?auto_782563 - BLOCK
      ?auto_782564 - BLOCK
      ?auto_782565 - BLOCK
      ?auto_782566 - BLOCK
      ?auto_782567 - BLOCK
      ?auto_782568 - BLOCK
    )
    :vars
    (
      ?auto_782569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_782568 ?auto_782569 ) ( ON-TABLE ?auto_782551 ) ( ON ?auto_782552 ?auto_782551 ) ( ON ?auto_782553 ?auto_782552 ) ( ON ?auto_782554 ?auto_782553 ) ( ON ?auto_782555 ?auto_782554 ) ( ON ?auto_782556 ?auto_782555 ) ( ON ?auto_782557 ?auto_782556 ) ( ON ?auto_782558 ?auto_782557 ) ( ON ?auto_782559 ?auto_782558 ) ( ON ?auto_782560 ?auto_782559 ) ( ON ?auto_782561 ?auto_782560 ) ( ON ?auto_782562 ?auto_782561 ) ( ON ?auto_782563 ?auto_782562 ) ( ON ?auto_782564 ?auto_782563 ) ( not ( = ?auto_782551 ?auto_782552 ) ) ( not ( = ?auto_782551 ?auto_782553 ) ) ( not ( = ?auto_782551 ?auto_782554 ) ) ( not ( = ?auto_782551 ?auto_782555 ) ) ( not ( = ?auto_782551 ?auto_782556 ) ) ( not ( = ?auto_782551 ?auto_782557 ) ) ( not ( = ?auto_782551 ?auto_782558 ) ) ( not ( = ?auto_782551 ?auto_782559 ) ) ( not ( = ?auto_782551 ?auto_782560 ) ) ( not ( = ?auto_782551 ?auto_782561 ) ) ( not ( = ?auto_782551 ?auto_782562 ) ) ( not ( = ?auto_782551 ?auto_782563 ) ) ( not ( = ?auto_782551 ?auto_782564 ) ) ( not ( = ?auto_782551 ?auto_782565 ) ) ( not ( = ?auto_782551 ?auto_782566 ) ) ( not ( = ?auto_782551 ?auto_782567 ) ) ( not ( = ?auto_782551 ?auto_782568 ) ) ( not ( = ?auto_782551 ?auto_782569 ) ) ( not ( = ?auto_782552 ?auto_782553 ) ) ( not ( = ?auto_782552 ?auto_782554 ) ) ( not ( = ?auto_782552 ?auto_782555 ) ) ( not ( = ?auto_782552 ?auto_782556 ) ) ( not ( = ?auto_782552 ?auto_782557 ) ) ( not ( = ?auto_782552 ?auto_782558 ) ) ( not ( = ?auto_782552 ?auto_782559 ) ) ( not ( = ?auto_782552 ?auto_782560 ) ) ( not ( = ?auto_782552 ?auto_782561 ) ) ( not ( = ?auto_782552 ?auto_782562 ) ) ( not ( = ?auto_782552 ?auto_782563 ) ) ( not ( = ?auto_782552 ?auto_782564 ) ) ( not ( = ?auto_782552 ?auto_782565 ) ) ( not ( = ?auto_782552 ?auto_782566 ) ) ( not ( = ?auto_782552 ?auto_782567 ) ) ( not ( = ?auto_782552 ?auto_782568 ) ) ( not ( = ?auto_782552 ?auto_782569 ) ) ( not ( = ?auto_782553 ?auto_782554 ) ) ( not ( = ?auto_782553 ?auto_782555 ) ) ( not ( = ?auto_782553 ?auto_782556 ) ) ( not ( = ?auto_782553 ?auto_782557 ) ) ( not ( = ?auto_782553 ?auto_782558 ) ) ( not ( = ?auto_782553 ?auto_782559 ) ) ( not ( = ?auto_782553 ?auto_782560 ) ) ( not ( = ?auto_782553 ?auto_782561 ) ) ( not ( = ?auto_782553 ?auto_782562 ) ) ( not ( = ?auto_782553 ?auto_782563 ) ) ( not ( = ?auto_782553 ?auto_782564 ) ) ( not ( = ?auto_782553 ?auto_782565 ) ) ( not ( = ?auto_782553 ?auto_782566 ) ) ( not ( = ?auto_782553 ?auto_782567 ) ) ( not ( = ?auto_782553 ?auto_782568 ) ) ( not ( = ?auto_782553 ?auto_782569 ) ) ( not ( = ?auto_782554 ?auto_782555 ) ) ( not ( = ?auto_782554 ?auto_782556 ) ) ( not ( = ?auto_782554 ?auto_782557 ) ) ( not ( = ?auto_782554 ?auto_782558 ) ) ( not ( = ?auto_782554 ?auto_782559 ) ) ( not ( = ?auto_782554 ?auto_782560 ) ) ( not ( = ?auto_782554 ?auto_782561 ) ) ( not ( = ?auto_782554 ?auto_782562 ) ) ( not ( = ?auto_782554 ?auto_782563 ) ) ( not ( = ?auto_782554 ?auto_782564 ) ) ( not ( = ?auto_782554 ?auto_782565 ) ) ( not ( = ?auto_782554 ?auto_782566 ) ) ( not ( = ?auto_782554 ?auto_782567 ) ) ( not ( = ?auto_782554 ?auto_782568 ) ) ( not ( = ?auto_782554 ?auto_782569 ) ) ( not ( = ?auto_782555 ?auto_782556 ) ) ( not ( = ?auto_782555 ?auto_782557 ) ) ( not ( = ?auto_782555 ?auto_782558 ) ) ( not ( = ?auto_782555 ?auto_782559 ) ) ( not ( = ?auto_782555 ?auto_782560 ) ) ( not ( = ?auto_782555 ?auto_782561 ) ) ( not ( = ?auto_782555 ?auto_782562 ) ) ( not ( = ?auto_782555 ?auto_782563 ) ) ( not ( = ?auto_782555 ?auto_782564 ) ) ( not ( = ?auto_782555 ?auto_782565 ) ) ( not ( = ?auto_782555 ?auto_782566 ) ) ( not ( = ?auto_782555 ?auto_782567 ) ) ( not ( = ?auto_782555 ?auto_782568 ) ) ( not ( = ?auto_782555 ?auto_782569 ) ) ( not ( = ?auto_782556 ?auto_782557 ) ) ( not ( = ?auto_782556 ?auto_782558 ) ) ( not ( = ?auto_782556 ?auto_782559 ) ) ( not ( = ?auto_782556 ?auto_782560 ) ) ( not ( = ?auto_782556 ?auto_782561 ) ) ( not ( = ?auto_782556 ?auto_782562 ) ) ( not ( = ?auto_782556 ?auto_782563 ) ) ( not ( = ?auto_782556 ?auto_782564 ) ) ( not ( = ?auto_782556 ?auto_782565 ) ) ( not ( = ?auto_782556 ?auto_782566 ) ) ( not ( = ?auto_782556 ?auto_782567 ) ) ( not ( = ?auto_782556 ?auto_782568 ) ) ( not ( = ?auto_782556 ?auto_782569 ) ) ( not ( = ?auto_782557 ?auto_782558 ) ) ( not ( = ?auto_782557 ?auto_782559 ) ) ( not ( = ?auto_782557 ?auto_782560 ) ) ( not ( = ?auto_782557 ?auto_782561 ) ) ( not ( = ?auto_782557 ?auto_782562 ) ) ( not ( = ?auto_782557 ?auto_782563 ) ) ( not ( = ?auto_782557 ?auto_782564 ) ) ( not ( = ?auto_782557 ?auto_782565 ) ) ( not ( = ?auto_782557 ?auto_782566 ) ) ( not ( = ?auto_782557 ?auto_782567 ) ) ( not ( = ?auto_782557 ?auto_782568 ) ) ( not ( = ?auto_782557 ?auto_782569 ) ) ( not ( = ?auto_782558 ?auto_782559 ) ) ( not ( = ?auto_782558 ?auto_782560 ) ) ( not ( = ?auto_782558 ?auto_782561 ) ) ( not ( = ?auto_782558 ?auto_782562 ) ) ( not ( = ?auto_782558 ?auto_782563 ) ) ( not ( = ?auto_782558 ?auto_782564 ) ) ( not ( = ?auto_782558 ?auto_782565 ) ) ( not ( = ?auto_782558 ?auto_782566 ) ) ( not ( = ?auto_782558 ?auto_782567 ) ) ( not ( = ?auto_782558 ?auto_782568 ) ) ( not ( = ?auto_782558 ?auto_782569 ) ) ( not ( = ?auto_782559 ?auto_782560 ) ) ( not ( = ?auto_782559 ?auto_782561 ) ) ( not ( = ?auto_782559 ?auto_782562 ) ) ( not ( = ?auto_782559 ?auto_782563 ) ) ( not ( = ?auto_782559 ?auto_782564 ) ) ( not ( = ?auto_782559 ?auto_782565 ) ) ( not ( = ?auto_782559 ?auto_782566 ) ) ( not ( = ?auto_782559 ?auto_782567 ) ) ( not ( = ?auto_782559 ?auto_782568 ) ) ( not ( = ?auto_782559 ?auto_782569 ) ) ( not ( = ?auto_782560 ?auto_782561 ) ) ( not ( = ?auto_782560 ?auto_782562 ) ) ( not ( = ?auto_782560 ?auto_782563 ) ) ( not ( = ?auto_782560 ?auto_782564 ) ) ( not ( = ?auto_782560 ?auto_782565 ) ) ( not ( = ?auto_782560 ?auto_782566 ) ) ( not ( = ?auto_782560 ?auto_782567 ) ) ( not ( = ?auto_782560 ?auto_782568 ) ) ( not ( = ?auto_782560 ?auto_782569 ) ) ( not ( = ?auto_782561 ?auto_782562 ) ) ( not ( = ?auto_782561 ?auto_782563 ) ) ( not ( = ?auto_782561 ?auto_782564 ) ) ( not ( = ?auto_782561 ?auto_782565 ) ) ( not ( = ?auto_782561 ?auto_782566 ) ) ( not ( = ?auto_782561 ?auto_782567 ) ) ( not ( = ?auto_782561 ?auto_782568 ) ) ( not ( = ?auto_782561 ?auto_782569 ) ) ( not ( = ?auto_782562 ?auto_782563 ) ) ( not ( = ?auto_782562 ?auto_782564 ) ) ( not ( = ?auto_782562 ?auto_782565 ) ) ( not ( = ?auto_782562 ?auto_782566 ) ) ( not ( = ?auto_782562 ?auto_782567 ) ) ( not ( = ?auto_782562 ?auto_782568 ) ) ( not ( = ?auto_782562 ?auto_782569 ) ) ( not ( = ?auto_782563 ?auto_782564 ) ) ( not ( = ?auto_782563 ?auto_782565 ) ) ( not ( = ?auto_782563 ?auto_782566 ) ) ( not ( = ?auto_782563 ?auto_782567 ) ) ( not ( = ?auto_782563 ?auto_782568 ) ) ( not ( = ?auto_782563 ?auto_782569 ) ) ( not ( = ?auto_782564 ?auto_782565 ) ) ( not ( = ?auto_782564 ?auto_782566 ) ) ( not ( = ?auto_782564 ?auto_782567 ) ) ( not ( = ?auto_782564 ?auto_782568 ) ) ( not ( = ?auto_782564 ?auto_782569 ) ) ( not ( = ?auto_782565 ?auto_782566 ) ) ( not ( = ?auto_782565 ?auto_782567 ) ) ( not ( = ?auto_782565 ?auto_782568 ) ) ( not ( = ?auto_782565 ?auto_782569 ) ) ( not ( = ?auto_782566 ?auto_782567 ) ) ( not ( = ?auto_782566 ?auto_782568 ) ) ( not ( = ?auto_782566 ?auto_782569 ) ) ( not ( = ?auto_782567 ?auto_782568 ) ) ( not ( = ?auto_782567 ?auto_782569 ) ) ( not ( = ?auto_782568 ?auto_782569 ) ) ( ON ?auto_782567 ?auto_782568 ) ( ON ?auto_782566 ?auto_782567 ) ( CLEAR ?auto_782564 ) ( ON ?auto_782565 ?auto_782566 ) ( CLEAR ?auto_782565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_782551 ?auto_782552 ?auto_782553 ?auto_782554 ?auto_782555 ?auto_782556 ?auto_782557 ?auto_782558 ?auto_782559 ?auto_782560 ?auto_782561 ?auto_782562 ?auto_782563 ?auto_782564 ?auto_782565 )
      ( MAKE-18PILE ?auto_782551 ?auto_782552 ?auto_782553 ?auto_782554 ?auto_782555 ?auto_782556 ?auto_782557 ?auto_782558 ?auto_782559 ?auto_782560 ?auto_782561 ?auto_782562 ?auto_782563 ?auto_782564 ?auto_782565 ?auto_782566 ?auto_782567 ?auto_782568 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_782588 - BLOCK
      ?auto_782589 - BLOCK
      ?auto_782590 - BLOCK
      ?auto_782591 - BLOCK
      ?auto_782592 - BLOCK
      ?auto_782593 - BLOCK
      ?auto_782594 - BLOCK
      ?auto_782595 - BLOCK
      ?auto_782596 - BLOCK
      ?auto_782597 - BLOCK
      ?auto_782598 - BLOCK
      ?auto_782599 - BLOCK
      ?auto_782600 - BLOCK
      ?auto_782601 - BLOCK
      ?auto_782602 - BLOCK
      ?auto_782603 - BLOCK
      ?auto_782604 - BLOCK
      ?auto_782605 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_782605 ) ( ON-TABLE ?auto_782588 ) ( ON ?auto_782589 ?auto_782588 ) ( ON ?auto_782590 ?auto_782589 ) ( ON ?auto_782591 ?auto_782590 ) ( ON ?auto_782592 ?auto_782591 ) ( ON ?auto_782593 ?auto_782592 ) ( ON ?auto_782594 ?auto_782593 ) ( ON ?auto_782595 ?auto_782594 ) ( ON ?auto_782596 ?auto_782595 ) ( ON ?auto_782597 ?auto_782596 ) ( ON ?auto_782598 ?auto_782597 ) ( ON ?auto_782599 ?auto_782598 ) ( ON ?auto_782600 ?auto_782599 ) ( ON ?auto_782601 ?auto_782600 ) ( not ( = ?auto_782588 ?auto_782589 ) ) ( not ( = ?auto_782588 ?auto_782590 ) ) ( not ( = ?auto_782588 ?auto_782591 ) ) ( not ( = ?auto_782588 ?auto_782592 ) ) ( not ( = ?auto_782588 ?auto_782593 ) ) ( not ( = ?auto_782588 ?auto_782594 ) ) ( not ( = ?auto_782588 ?auto_782595 ) ) ( not ( = ?auto_782588 ?auto_782596 ) ) ( not ( = ?auto_782588 ?auto_782597 ) ) ( not ( = ?auto_782588 ?auto_782598 ) ) ( not ( = ?auto_782588 ?auto_782599 ) ) ( not ( = ?auto_782588 ?auto_782600 ) ) ( not ( = ?auto_782588 ?auto_782601 ) ) ( not ( = ?auto_782588 ?auto_782602 ) ) ( not ( = ?auto_782588 ?auto_782603 ) ) ( not ( = ?auto_782588 ?auto_782604 ) ) ( not ( = ?auto_782588 ?auto_782605 ) ) ( not ( = ?auto_782589 ?auto_782590 ) ) ( not ( = ?auto_782589 ?auto_782591 ) ) ( not ( = ?auto_782589 ?auto_782592 ) ) ( not ( = ?auto_782589 ?auto_782593 ) ) ( not ( = ?auto_782589 ?auto_782594 ) ) ( not ( = ?auto_782589 ?auto_782595 ) ) ( not ( = ?auto_782589 ?auto_782596 ) ) ( not ( = ?auto_782589 ?auto_782597 ) ) ( not ( = ?auto_782589 ?auto_782598 ) ) ( not ( = ?auto_782589 ?auto_782599 ) ) ( not ( = ?auto_782589 ?auto_782600 ) ) ( not ( = ?auto_782589 ?auto_782601 ) ) ( not ( = ?auto_782589 ?auto_782602 ) ) ( not ( = ?auto_782589 ?auto_782603 ) ) ( not ( = ?auto_782589 ?auto_782604 ) ) ( not ( = ?auto_782589 ?auto_782605 ) ) ( not ( = ?auto_782590 ?auto_782591 ) ) ( not ( = ?auto_782590 ?auto_782592 ) ) ( not ( = ?auto_782590 ?auto_782593 ) ) ( not ( = ?auto_782590 ?auto_782594 ) ) ( not ( = ?auto_782590 ?auto_782595 ) ) ( not ( = ?auto_782590 ?auto_782596 ) ) ( not ( = ?auto_782590 ?auto_782597 ) ) ( not ( = ?auto_782590 ?auto_782598 ) ) ( not ( = ?auto_782590 ?auto_782599 ) ) ( not ( = ?auto_782590 ?auto_782600 ) ) ( not ( = ?auto_782590 ?auto_782601 ) ) ( not ( = ?auto_782590 ?auto_782602 ) ) ( not ( = ?auto_782590 ?auto_782603 ) ) ( not ( = ?auto_782590 ?auto_782604 ) ) ( not ( = ?auto_782590 ?auto_782605 ) ) ( not ( = ?auto_782591 ?auto_782592 ) ) ( not ( = ?auto_782591 ?auto_782593 ) ) ( not ( = ?auto_782591 ?auto_782594 ) ) ( not ( = ?auto_782591 ?auto_782595 ) ) ( not ( = ?auto_782591 ?auto_782596 ) ) ( not ( = ?auto_782591 ?auto_782597 ) ) ( not ( = ?auto_782591 ?auto_782598 ) ) ( not ( = ?auto_782591 ?auto_782599 ) ) ( not ( = ?auto_782591 ?auto_782600 ) ) ( not ( = ?auto_782591 ?auto_782601 ) ) ( not ( = ?auto_782591 ?auto_782602 ) ) ( not ( = ?auto_782591 ?auto_782603 ) ) ( not ( = ?auto_782591 ?auto_782604 ) ) ( not ( = ?auto_782591 ?auto_782605 ) ) ( not ( = ?auto_782592 ?auto_782593 ) ) ( not ( = ?auto_782592 ?auto_782594 ) ) ( not ( = ?auto_782592 ?auto_782595 ) ) ( not ( = ?auto_782592 ?auto_782596 ) ) ( not ( = ?auto_782592 ?auto_782597 ) ) ( not ( = ?auto_782592 ?auto_782598 ) ) ( not ( = ?auto_782592 ?auto_782599 ) ) ( not ( = ?auto_782592 ?auto_782600 ) ) ( not ( = ?auto_782592 ?auto_782601 ) ) ( not ( = ?auto_782592 ?auto_782602 ) ) ( not ( = ?auto_782592 ?auto_782603 ) ) ( not ( = ?auto_782592 ?auto_782604 ) ) ( not ( = ?auto_782592 ?auto_782605 ) ) ( not ( = ?auto_782593 ?auto_782594 ) ) ( not ( = ?auto_782593 ?auto_782595 ) ) ( not ( = ?auto_782593 ?auto_782596 ) ) ( not ( = ?auto_782593 ?auto_782597 ) ) ( not ( = ?auto_782593 ?auto_782598 ) ) ( not ( = ?auto_782593 ?auto_782599 ) ) ( not ( = ?auto_782593 ?auto_782600 ) ) ( not ( = ?auto_782593 ?auto_782601 ) ) ( not ( = ?auto_782593 ?auto_782602 ) ) ( not ( = ?auto_782593 ?auto_782603 ) ) ( not ( = ?auto_782593 ?auto_782604 ) ) ( not ( = ?auto_782593 ?auto_782605 ) ) ( not ( = ?auto_782594 ?auto_782595 ) ) ( not ( = ?auto_782594 ?auto_782596 ) ) ( not ( = ?auto_782594 ?auto_782597 ) ) ( not ( = ?auto_782594 ?auto_782598 ) ) ( not ( = ?auto_782594 ?auto_782599 ) ) ( not ( = ?auto_782594 ?auto_782600 ) ) ( not ( = ?auto_782594 ?auto_782601 ) ) ( not ( = ?auto_782594 ?auto_782602 ) ) ( not ( = ?auto_782594 ?auto_782603 ) ) ( not ( = ?auto_782594 ?auto_782604 ) ) ( not ( = ?auto_782594 ?auto_782605 ) ) ( not ( = ?auto_782595 ?auto_782596 ) ) ( not ( = ?auto_782595 ?auto_782597 ) ) ( not ( = ?auto_782595 ?auto_782598 ) ) ( not ( = ?auto_782595 ?auto_782599 ) ) ( not ( = ?auto_782595 ?auto_782600 ) ) ( not ( = ?auto_782595 ?auto_782601 ) ) ( not ( = ?auto_782595 ?auto_782602 ) ) ( not ( = ?auto_782595 ?auto_782603 ) ) ( not ( = ?auto_782595 ?auto_782604 ) ) ( not ( = ?auto_782595 ?auto_782605 ) ) ( not ( = ?auto_782596 ?auto_782597 ) ) ( not ( = ?auto_782596 ?auto_782598 ) ) ( not ( = ?auto_782596 ?auto_782599 ) ) ( not ( = ?auto_782596 ?auto_782600 ) ) ( not ( = ?auto_782596 ?auto_782601 ) ) ( not ( = ?auto_782596 ?auto_782602 ) ) ( not ( = ?auto_782596 ?auto_782603 ) ) ( not ( = ?auto_782596 ?auto_782604 ) ) ( not ( = ?auto_782596 ?auto_782605 ) ) ( not ( = ?auto_782597 ?auto_782598 ) ) ( not ( = ?auto_782597 ?auto_782599 ) ) ( not ( = ?auto_782597 ?auto_782600 ) ) ( not ( = ?auto_782597 ?auto_782601 ) ) ( not ( = ?auto_782597 ?auto_782602 ) ) ( not ( = ?auto_782597 ?auto_782603 ) ) ( not ( = ?auto_782597 ?auto_782604 ) ) ( not ( = ?auto_782597 ?auto_782605 ) ) ( not ( = ?auto_782598 ?auto_782599 ) ) ( not ( = ?auto_782598 ?auto_782600 ) ) ( not ( = ?auto_782598 ?auto_782601 ) ) ( not ( = ?auto_782598 ?auto_782602 ) ) ( not ( = ?auto_782598 ?auto_782603 ) ) ( not ( = ?auto_782598 ?auto_782604 ) ) ( not ( = ?auto_782598 ?auto_782605 ) ) ( not ( = ?auto_782599 ?auto_782600 ) ) ( not ( = ?auto_782599 ?auto_782601 ) ) ( not ( = ?auto_782599 ?auto_782602 ) ) ( not ( = ?auto_782599 ?auto_782603 ) ) ( not ( = ?auto_782599 ?auto_782604 ) ) ( not ( = ?auto_782599 ?auto_782605 ) ) ( not ( = ?auto_782600 ?auto_782601 ) ) ( not ( = ?auto_782600 ?auto_782602 ) ) ( not ( = ?auto_782600 ?auto_782603 ) ) ( not ( = ?auto_782600 ?auto_782604 ) ) ( not ( = ?auto_782600 ?auto_782605 ) ) ( not ( = ?auto_782601 ?auto_782602 ) ) ( not ( = ?auto_782601 ?auto_782603 ) ) ( not ( = ?auto_782601 ?auto_782604 ) ) ( not ( = ?auto_782601 ?auto_782605 ) ) ( not ( = ?auto_782602 ?auto_782603 ) ) ( not ( = ?auto_782602 ?auto_782604 ) ) ( not ( = ?auto_782602 ?auto_782605 ) ) ( not ( = ?auto_782603 ?auto_782604 ) ) ( not ( = ?auto_782603 ?auto_782605 ) ) ( not ( = ?auto_782604 ?auto_782605 ) ) ( ON ?auto_782604 ?auto_782605 ) ( ON ?auto_782603 ?auto_782604 ) ( CLEAR ?auto_782601 ) ( ON ?auto_782602 ?auto_782603 ) ( CLEAR ?auto_782602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_782588 ?auto_782589 ?auto_782590 ?auto_782591 ?auto_782592 ?auto_782593 ?auto_782594 ?auto_782595 ?auto_782596 ?auto_782597 ?auto_782598 ?auto_782599 ?auto_782600 ?auto_782601 ?auto_782602 )
      ( MAKE-18PILE ?auto_782588 ?auto_782589 ?auto_782590 ?auto_782591 ?auto_782592 ?auto_782593 ?auto_782594 ?auto_782595 ?auto_782596 ?auto_782597 ?auto_782598 ?auto_782599 ?auto_782600 ?auto_782601 ?auto_782602 ?auto_782603 ?auto_782604 ?auto_782605 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_782624 - BLOCK
      ?auto_782625 - BLOCK
      ?auto_782626 - BLOCK
      ?auto_782627 - BLOCK
      ?auto_782628 - BLOCK
      ?auto_782629 - BLOCK
      ?auto_782630 - BLOCK
      ?auto_782631 - BLOCK
      ?auto_782632 - BLOCK
      ?auto_782633 - BLOCK
      ?auto_782634 - BLOCK
      ?auto_782635 - BLOCK
      ?auto_782636 - BLOCK
      ?auto_782637 - BLOCK
      ?auto_782638 - BLOCK
      ?auto_782639 - BLOCK
      ?auto_782640 - BLOCK
      ?auto_782641 - BLOCK
    )
    :vars
    (
      ?auto_782642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_782641 ?auto_782642 ) ( ON-TABLE ?auto_782624 ) ( ON ?auto_782625 ?auto_782624 ) ( ON ?auto_782626 ?auto_782625 ) ( ON ?auto_782627 ?auto_782626 ) ( ON ?auto_782628 ?auto_782627 ) ( ON ?auto_782629 ?auto_782628 ) ( ON ?auto_782630 ?auto_782629 ) ( ON ?auto_782631 ?auto_782630 ) ( ON ?auto_782632 ?auto_782631 ) ( ON ?auto_782633 ?auto_782632 ) ( ON ?auto_782634 ?auto_782633 ) ( ON ?auto_782635 ?auto_782634 ) ( ON ?auto_782636 ?auto_782635 ) ( not ( = ?auto_782624 ?auto_782625 ) ) ( not ( = ?auto_782624 ?auto_782626 ) ) ( not ( = ?auto_782624 ?auto_782627 ) ) ( not ( = ?auto_782624 ?auto_782628 ) ) ( not ( = ?auto_782624 ?auto_782629 ) ) ( not ( = ?auto_782624 ?auto_782630 ) ) ( not ( = ?auto_782624 ?auto_782631 ) ) ( not ( = ?auto_782624 ?auto_782632 ) ) ( not ( = ?auto_782624 ?auto_782633 ) ) ( not ( = ?auto_782624 ?auto_782634 ) ) ( not ( = ?auto_782624 ?auto_782635 ) ) ( not ( = ?auto_782624 ?auto_782636 ) ) ( not ( = ?auto_782624 ?auto_782637 ) ) ( not ( = ?auto_782624 ?auto_782638 ) ) ( not ( = ?auto_782624 ?auto_782639 ) ) ( not ( = ?auto_782624 ?auto_782640 ) ) ( not ( = ?auto_782624 ?auto_782641 ) ) ( not ( = ?auto_782624 ?auto_782642 ) ) ( not ( = ?auto_782625 ?auto_782626 ) ) ( not ( = ?auto_782625 ?auto_782627 ) ) ( not ( = ?auto_782625 ?auto_782628 ) ) ( not ( = ?auto_782625 ?auto_782629 ) ) ( not ( = ?auto_782625 ?auto_782630 ) ) ( not ( = ?auto_782625 ?auto_782631 ) ) ( not ( = ?auto_782625 ?auto_782632 ) ) ( not ( = ?auto_782625 ?auto_782633 ) ) ( not ( = ?auto_782625 ?auto_782634 ) ) ( not ( = ?auto_782625 ?auto_782635 ) ) ( not ( = ?auto_782625 ?auto_782636 ) ) ( not ( = ?auto_782625 ?auto_782637 ) ) ( not ( = ?auto_782625 ?auto_782638 ) ) ( not ( = ?auto_782625 ?auto_782639 ) ) ( not ( = ?auto_782625 ?auto_782640 ) ) ( not ( = ?auto_782625 ?auto_782641 ) ) ( not ( = ?auto_782625 ?auto_782642 ) ) ( not ( = ?auto_782626 ?auto_782627 ) ) ( not ( = ?auto_782626 ?auto_782628 ) ) ( not ( = ?auto_782626 ?auto_782629 ) ) ( not ( = ?auto_782626 ?auto_782630 ) ) ( not ( = ?auto_782626 ?auto_782631 ) ) ( not ( = ?auto_782626 ?auto_782632 ) ) ( not ( = ?auto_782626 ?auto_782633 ) ) ( not ( = ?auto_782626 ?auto_782634 ) ) ( not ( = ?auto_782626 ?auto_782635 ) ) ( not ( = ?auto_782626 ?auto_782636 ) ) ( not ( = ?auto_782626 ?auto_782637 ) ) ( not ( = ?auto_782626 ?auto_782638 ) ) ( not ( = ?auto_782626 ?auto_782639 ) ) ( not ( = ?auto_782626 ?auto_782640 ) ) ( not ( = ?auto_782626 ?auto_782641 ) ) ( not ( = ?auto_782626 ?auto_782642 ) ) ( not ( = ?auto_782627 ?auto_782628 ) ) ( not ( = ?auto_782627 ?auto_782629 ) ) ( not ( = ?auto_782627 ?auto_782630 ) ) ( not ( = ?auto_782627 ?auto_782631 ) ) ( not ( = ?auto_782627 ?auto_782632 ) ) ( not ( = ?auto_782627 ?auto_782633 ) ) ( not ( = ?auto_782627 ?auto_782634 ) ) ( not ( = ?auto_782627 ?auto_782635 ) ) ( not ( = ?auto_782627 ?auto_782636 ) ) ( not ( = ?auto_782627 ?auto_782637 ) ) ( not ( = ?auto_782627 ?auto_782638 ) ) ( not ( = ?auto_782627 ?auto_782639 ) ) ( not ( = ?auto_782627 ?auto_782640 ) ) ( not ( = ?auto_782627 ?auto_782641 ) ) ( not ( = ?auto_782627 ?auto_782642 ) ) ( not ( = ?auto_782628 ?auto_782629 ) ) ( not ( = ?auto_782628 ?auto_782630 ) ) ( not ( = ?auto_782628 ?auto_782631 ) ) ( not ( = ?auto_782628 ?auto_782632 ) ) ( not ( = ?auto_782628 ?auto_782633 ) ) ( not ( = ?auto_782628 ?auto_782634 ) ) ( not ( = ?auto_782628 ?auto_782635 ) ) ( not ( = ?auto_782628 ?auto_782636 ) ) ( not ( = ?auto_782628 ?auto_782637 ) ) ( not ( = ?auto_782628 ?auto_782638 ) ) ( not ( = ?auto_782628 ?auto_782639 ) ) ( not ( = ?auto_782628 ?auto_782640 ) ) ( not ( = ?auto_782628 ?auto_782641 ) ) ( not ( = ?auto_782628 ?auto_782642 ) ) ( not ( = ?auto_782629 ?auto_782630 ) ) ( not ( = ?auto_782629 ?auto_782631 ) ) ( not ( = ?auto_782629 ?auto_782632 ) ) ( not ( = ?auto_782629 ?auto_782633 ) ) ( not ( = ?auto_782629 ?auto_782634 ) ) ( not ( = ?auto_782629 ?auto_782635 ) ) ( not ( = ?auto_782629 ?auto_782636 ) ) ( not ( = ?auto_782629 ?auto_782637 ) ) ( not ( = ?auto_782629 ?auto_782638 ) ) ( not ( = ?auto_782629 ?auto_782639 ) ) ( not ( = ?auto_782629 ?auto_782640 ) ) ( not ( = ?auto_782629 ?auto_782641 ) ) ( not ( = ?auto_782629 ?auto_782642 ) ) ( not ( = ?auto_782630 ?auto_782631 ) ) ( not ( = ?auto_782630 ?auto_782632 ) ) ( not ( = ?auto_782630 ?auto_782633 ) ) ( not ( = ?auto_782630 ?auto_782634 ) ) ( not ( = ?auto_782630 ?auto_782635 ) ) ( not ( = ?auto_782630 ?auto_782636 ) ) ( not ( = ?auto_782630 ?auto_782637 ) ) ( not ( = ?auto_782630 ?auto_782638 ) ) ( not ( = ?auto_782630 ?auto_782639 ) ) ( not ( = ?auto_782630 ?auto_782640 ) ) ( not ( = ?auto_782630 ?auto_782641 ) ) ( not ( = ?auto_782630 ?auto_782642 ) ) ( not ( = ?auto_782631 ?auto_782632 ) ) ( not ( = ?auto_782631 ?auto_782633 ) ) ( not ( = ?auto_782631 ?auto_782634 ) ) ( not ( = ?auto_782631 ?auto_782635 ) ) ( not ( = ?auto_782631 ?auto_782636 ) ) ( not ( = ?auto_782631 ?auto_782637 ) ) ( not ( = ?auto_782631 ?auto_782638 ) ) ( not ( = ?auto_782631 ?auto_782639 ) ) ( not ( = ?auto_782631 ?auto_782640 ) ) ( not ( = ?auto_782631 ?auto_782641 ) ) ( not ( = ?auto_782631 ?auto_782642 ) ) ( not ( = ?auto_782632 ?auto_782633 ) ) ( not ( = ?auto_782632 ?auto_782634 ) ) ( not ( = ?auto_782632 ?auto_782635 ) ) ( not ( = ?auto_782632 ?auto_782636 ) ) ( not ( = ?auto_782632 ?auto_782637 ) ) ( not ( = ?auto_782632 ?auto_782638 ) ) ( not ( = ?auto_782632 ?auto_782639 ) ) ( not ( = ?auto_782632 ?auto_782640 ) ) ( not ( = ?auto_782632 ?auto_782641 ) ) ( not ( = ?auto_782632 ?auto_782642 ) ) ( not ( = ?auto_782633 ?auto_782634 ) ) ( not ( = ?auto_782633 ?auto_782635 ) ) ( not ( = ?auto_782633 ?auto_782636 ) ) ( not ( = ?auto_782633 ?auto_782637 ) ) ( not ( = ?auto_782633 ?auto_782638 ) ) ( not ( = ?auto_782633 ?auto_782639 ) ) ( not ( = ?auto_782633 ?auto_782640 ) ) ( not ( = ?auto_782633 ?auto_782641 ) ) ( not ( = ?auto_782633 ?auto_782642 ) ) ( not ( = ?auto_782634 ?auto_782635 ) ) ( not ( = ?auto_782634 ?auto_782636 ) ) ( not ( = ?auto_782634 ?auto_782637 ) ) ( not ( = ?auto_782634 ?auto_782638 ) ) ( not ( = ?auto_782634 ?auto_782639 ) ) ( not ( = ?auto_782634 ?auto_782640 ) ) ( not ( = ?auto_782634 ?auto_782641 ) ) ( not ( = ?auto_782634 ?auto_782642 ) ) ( not ( = ?auto_782635 ?auto_782636 ) ) ( not ( = ?auto_782635 ?auto_782637 ) ) ( not ( = ?auto_782635 ?auto_782638 ) ) ( not ( = ?auto_782635 ?auto_782639 ) ) ( not ( = ?auto_782635 ?auto_782640 ) ) ( not ( = ?auto_782635 ?auto_782641 ) ) ( not ( = ?auto_782635 ?auto_782642 ) ) ( not ( = ?auto_782636 ?auto_782637 ) ) ( not ( = ?auto_782636 ?auto_782638 ) ) ( not ( = ?auto_782636 ?auto_782639 ) ) ( not ( = ?auto_782636 ?auto_782640 ) ) ( not ( = ?auto_782636 ?auto_782641 ) ) ( not ( = ?auto_782636 ?auto_782642 ) ) ( not ( = ?auto_782637 ?auto_782638 ) ) ( not ( = ?auto_782637 ?auto_782639 ) ) ( not ( = ?auto_782637 ?auto_782640 ) ) ( not ( = ?auto_782637 ?auto_782641 ) ) ( not ( = ?auto_782637 ?auto_782642 ) ) ( not ( = ?auto_782638 ?auto_782639 ) ) ( not ( = ?auto_782638 ?auto_782640 ) ) ( not ( = ?auto_782638 ?auto_782641 ) ) ( not ( = ?auto_782638 ?auto_782642 ) ) ( not ( = ?auto_782639 ?auto_782640 ) ) ( not ( = ?auto_782639 ?auto_782641 ) ) ( not ( = ?auto_782639 ?auto_782642 ) ) ( not ( = ?auto_782640 ?auto_782641 ) ) ( not ( = ?auto_782640 ?auto_782642 ) ) ( not ( = ?auto_782641 ?auto_782642 ) ) ( ON ?auto_782640 ?auto_782641 ) ( ON ?auto_782639 ?auto_782640 ) ( ON ?auto_782638 ?auto_782639 ) ( CLEAR ?auto_782636 ) ( ON ?auto_782637 ?auto_782638 ) ( CLEAR ?auto_782637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_782624 ?auto_782625 ?auto_782626 ?auto_782627 ?auto_782628 ?auto_782629 ?auto_782630 ?auto_782631 ?auto_782632 ?auto_782633 ?auto_782634 ?auto_782635 ?auto_782636 ?auto_782637 )
      ( MAKE-18PILE ?auto_782624 ?auto_782625 ?auto_782626 ?auto_782627 ?auto_782628 ?auto_782629 ?auto_782630 ?auto_782631 ?auto_782632 ?auto_782633 ?auto_782634 ?auto_782635 ?auto_782636 ?auto_782637 ?auto_782638 ?auto_782639 ?auto_782640 ?auto_782641 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_782661 - BLOCK
      ?auto_782662 - BLOCK
      ?auto_782663 - BLOCK
      ?auto_782664 - BLOCK
      ?auto_782665 - BLOCK
      ?auto_782666 - BLOCK
      ?auto_782667 - BLOCK
      ?auto_782668 - BLOCK
      ?auto_782669 - BLOCK
      ?auto_782670 - BLOCK
      ?auto_782671 - BLOCK
      ?auto_782672 - BLOCK
      ?auto_782673 - BLOCK
      ?auto_782674 - BLOCK
      ?auto_782675 - BLOCK
      ?auto_782676 - BLOCK
      ?auto_782677 - BLOCK
      ?auto_782678 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_782678 ) ( ON-TABLE ?auto_782661 ) ( ON ?auto_782662 ?auto_782661 ) ( ON ?auto_782663 ?auto_782662 ) ( ON ?auto_782664 ?auto_782663 ) ( ON ?auto_782665 ?auto_782664 ) ( ON ?auto_782666 ?auto_782665 ) ( ON ?auto_782667 ?auto_782666 ) ( ON ?auto_782668 ?auto_782667 ) ( ON ?auto_782669 ?auto_782668 ) ( ON ?auto_782670 ?auto_782669 ) ( ON ?auto_782671 ?auto_782670 ) ( ON ?auto_782672 ?auto_782671 ) ( ON ?auto_782673 ?auto_782672 ) ( not ( = ?auto_782661 ?auto_782662 ) ) ( not ( = ?auto_782661 ?auto_782663 ) ) ( not ( = ?auto_782661 ?auto_782664 ) ) ( not ( = ?auto_782661 ?auto_782665 ) ) ( not ( = ?auto_782661 ?auto_782666 ) ) ( not ( = ?auto_782661 ?auto_782667 ) ) ( not ( = ?auto_782661 ?auto_782668 ) ) ( not ( = ?auto_782661 ?auto_782669 ) ) ( not ( = ?auto_782661 ?auto_782670 ) ) ( not ( = ?auto_782661 ?auto_782671 ) ) ( not ( = ?auto_782661 ?auto_782672 ) ) ( not ( = ?auto_782661 ?auto_782673 ) ) ( not ( = ?auto_782661 ?auto_782674 ) ) ( not ( = ?auto_782661 ?auto_782675 ) ) ( not ( = ?auto_782661 ?auto_782676 ) ) ( not ( = ?auto_782661 ?auto_782677 ) ) ( not ( = ?auto_782661 ?auto_782678 ) ) ( not ( = ?auto_782662 ?auto_782663 ) ) ( not ( = ?auto_782662 ?auto_782664 ) ) ( not ( = ?auto_782662 ?auto_782665 ) ) ( not ( = ?auto_782662 ?auto_782666 ) ) ( not ( = ?auto_782662 ?auto_782667 ) ) ( not ( = ?auto_782662 ?auto_782668 ) ) ( not ( = ?auto_782662 ?auto_782669 ) ) ( not ( = ?auto_782662 ?auto_782670 ) ) ( not ( = ?auto_782662 ?auto_782671 ) ) ( not ( = ?auto_782662 ?auto_782672 ) ) ( not ( = ?auto_782662 ?auto_782673 ) ) ( not ( = ?auto_782662 ?auto_782674 ) ) ( not ( = ?auto_782662 ?auto_782675 ) ) ( not ( = ?auto_782662 ?auto_782676 ) ) ( not ( = ?auto_782662 ?auto_782677 ) ) ( not ( = ?auto_782662 ?auto_782678 ) ) ( not ( = ?auto_782663 ?auto_782664 ) ) ( not ( = ?auto_782663 ?auto_782665 ) ) ( not ( = ?auto_782663 ?auto_782666 ) ) ( not ( = ?auto_782663 ?auto_782667 ) ) ( not ( = ?auto_782663 ?auto_782668 ) ) ( not ( = ?auto_782663 ?auto_782669 ) ) ( not ( = ?auto_782663 ?auto_782670 ) ) ( not ( = ?auto_782663 ?auto_782671 ) ) ( not ( = ?auto_782663 ?auto_782672 ) ) ( not ( = ?auto_782663 ?auto_782673 ) ) ( not ( = ?auto_782663 ?auto_782674 ) ) ( not ( = ?auto_782663 ?auto_782675 ) ) ( not ( = ?auto_782663 ?auto_782676 ) ) ( not ( = ?auto_782663 ?auto_782677 ) ) ( not ( = ?auto_782663 ?auto_782678 ) ) ( not ( = ?auto_782664 ?auto_782665 ) ) ( not ( = ?auto_782664 ?auto_782666 ) ) ( not ( = ?auto_782664 ?auto_782667 ) ) ( not ( = ?auto_782664 ?auto_782668 ) ) ( not ( = ?auto_782664 ?auto_782669 ) ) ( not ( = ?auto_782664 ?auto_782670 ) ) ( not ( = ?auto_782664 ?auto_782671 ) ) ( not ( = ?auto_782664 ?auto_782672 ) ) ( not ( = ?auto_782664 ?auto_782673 ) ) ( not ( = ?auto_782664 ?auto_782674 ) ) ( not ( = ?auto_782664 ?auto_782675 ) ) ( not ( = ?auto_782664 ?auto_782676 ) ) ( not ( = ?auto_782664 ?auto_782677 ) ) ( not ( = ?auto_782664 ?auto_782678 ) ) ( not ( = ?auto_782665 ?auto_782666 ) ) ( not ( = ?auto_782665 ?auto_782667 ) ) ( not ( = ?auto_782665 ?auto_782668 ) ) ( not ( = ?auto_782665 ?auto_782669 ) ) ( not ( = ?auto_782665 ?auto_782670 ) ) ( not ( = ?auto_782665 ?auto_782671 ) ) ( not ( = ?auto_782665 ?auto_782672 ) ) ( not ( = ?auto_782665 ?auto_782673 ) ) ( not ( = ?auto_782665 ?auto_782674 ) ) ( not ( = ?auto_782665 ?auto_782675 ) ) ( not ( = ?auto_782665 ?auto_782676 ) ) ( not ( = ?auto_782665 ?auto_782677 ) ) ( not ( = ?auto_782665 ?auto_782678 ) ) ( not ( = ?auto_782666 ?auto_782667 ) ) ( not ( = ?auto_782666 ?auto_782668 ) ) ( not ( = ?auto_782666 ?auto_782669 ) ) ( not ( = ?auto_782666 ?auto_782670 ) ) ( not ( = ?auto_782666 ?auto_782671 ) ) ( not ( = ?auto_782666 ?auto_782672 ) ) ( not ( = ?auto_782666 ?auto_782673 ) ) ( not ( = ?auto_782666 ?auto_782674 ) ) ( not ( = ?auto_782666 ?auto_782675 ) ) ( not ( = ?auto_782666 ?auto_782676 ) ) ( not ( = ?auto_782666 ?auto_782677 ) ) ( not ( = ?auto_782666 ?auto_782678 ) ) ( not ( = ?auto_782667 ?auto_782668 ) ) ( not ( = ?auto_782667 ?auto_782669 ) ) ( not ( = ?auto_782667 ?auto_782670 ) ) ( not ( = ?auto_782667 ?auto_782671 ) ) ( not ( = ?auto_782667 ?auto_782672 ) ) ( not ( = ?auto_782667 ?auto_782673 ) ) ( not ( = ?auto_782667 ?auto_782674 ) ) ( not ( = ?auto_782667 ?auto_782675 ) ) ( not ( = ?auto_782667 ?auto_782676 ) ) ( not ( = ?auto_782667 ?auto_782677 ) ) ( not ( = ?auto_782667 ?auto_782678 ) ) ( not ( = ?auto_782668 ?auto_782669 ) ) ( not ( = ?auto_782668 ?auto_782670 ) ) ( not ( = ?auto_782668 ?auto_782671 ) ) ( not ( = ?auto_782668 ?auto_782672 ) ) ( not ( = ?auto_782668 ?auto_782673 ) ) ( not ( = ?auto_782668 ?auto_782674 ) ) ( not ( = ?auto_782668 ?auto_782675 ) ) ( not ( = ?auto_782668 ?auto_782676 ) ) ( not ( = ?auto_782668 ?auto_782677 ) ) ( not ( = ?auto_782668 ?auto_782678 ) ) ( not ( = ?auto_782669 ?auto_782670 ) ) ( not ( = ?auto_782669 ?auto_782671 ) ) ( not ( = ?auto_782669 ?auto_782672 ) ) ( not ( = ?auto_782669 ?auto_782673 ) ) ( not ( = ?auto_782669 ?auto_782674 ) ) ( not ( = ?auto_782669 ?auto_782675 ) ) ( not ( = ?auto_782669 ?auto_782676 ) ) ( not ( = ?auto_782669 ?auto_782677 ) ) ( not ( = ?auto_782669 ?auto_782678 ) ) ( not ( = ?auto_782670 ?auto_782671 ) ) ( not ( = ?auto_782670 ?auto_782672 ) ) ( not ( = ?auto_782670 ?auto_782673 ) ) ( not ( = ?auto_782670 ?auto_782674 ) ) ( not ( = ?auto_782670 ?auto_782675 ) ) ( not ( = ?auto_782670 ?auto_782676 ) ) ( not ( = ?auto_782670 ?auto_782677 ) ) ( not ( = ?auto_782670 ?auto_782678 ) ) ( not ( = ?auto_782671 ?auto_782672 ) ) ( not ( = ?auto_782671 ?auto_782673 ) ) ( not ( = ?auto_782671 ?auto_782674 ) ) ( not ( = ?auto_782671 ?auto_782675 ) ) ( not ( = ?auto_782671 ?auto_782676 ) ) ( not ( = ?auto_782671 ?auto_782677 ) ) ( not ( = ?auto_782671 ?auto_782678 ) ) ( not ( = ?auto_782672 ?auto_782673 ) ) ( not ( = ?auto_782672 ?auto_782674 ) ) ( not ( = ?auto_782672 ?auto_782675 ) ) ( not ( = ?auto_782672 ?auto_782676 ) ) ( not ( = ?auto_782672 ?auto_782677 ) ) ( not ( = ?auto_782672 ?auto_782678 ) ) ( not ( = ?auto_782673 ?auto_782674 ) ) ( not ( = ?auto_782673 ?auto_782675 ) ) ( not ( = ?auto_782673 ?auto_782676 ) ) ( not ( = ?auto_782673 ?auto_782677 ) ) ( not ( = ?auto_782673 ?auto_782678 ) ) ( not ( = ?auto_782674 ?auto_782675 ) ) ( not ( = ?auto_782674 ?auto_782676 ) ) ( not ( = ?auto_782674 ?auto_782677 ) ) ( not ( = ?auto_782674 ?auto_782678 ) ) ( not ( = ?auto_782675 ?auto_782676 ) ) ( not ( = ?auto_782675 ?auto_782677 ) ) ( not ( = ?auto_782675 ?auto_782678 ) ) ( not ( = ?auto_782676 ?auto_782677 ) ) ( not ( = ?auto_782676 ?auto_782678 ) ) ( not ( = ?auto_782677 ?auto_782678 ) ) ( ON ?auto_782677 ?auto_782678 ) ( ON ?auto_782676 ?auto_782677 ) ( ON ?auto_782675 ?auto_782676 ) ( CLEAR ?auto_782673 ) ( ON ?auto_782674 ?auto_782675 ) ( CLEAR ?auto_782674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_782661 ?auto_782662 ?auto_782663 ?auto_782664 ?auto_782665 ?auto_782666 ?auto_782667 ?auto_782668 ?auto_782669 ?auto_782670 ?auto_782671 ?auto_782672 ?auto_782673 ?auto_782674 )
      ( MAKE-18PILE ?auto_782661 ?auto_782662 ?auto_782663 ?auto_782664 ?auto_782665 ?auto_782666 ?auto_782667 ?auto_782668 ?auto_782669 ?auto_782670 ?auto_782671 ?auto_782672 ?auto_782673 ?auto_782674 ?auto_782675 ?auto_782676 ?auto_782677 ?auto_782678 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_782697 - BLOCK
      ?auto_782698 - BLOCK
      ?auto_782699 - BLOCK
      ?auto_782700 - BLOCK
      ?auto_782701 - BLOCK
      ?auto_782702 - BLOCK
      ?auto_782703 - BLOCK
      ?auto_782704 - BLOCK
      ?auto_782705 - BLOCK
      ?auto_782706 - BLOCK
      ?auto_782707 - BLOCK
      ?auto_782708 - BLOCK
      ?auto_782709 - BLOCK
      ?auto_782710 - BLOCK
      ?auto_782711 - BLOCK
      ?auto_782712 - BLOCK
      ?auto_782713 - BLOCK
      ?auto_782714 - BLOCK
    )
    :vars
    (
      ?auto_782715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_782714 ?auto_782715 ) ( ON-TABLE ?auto_782697 ) ( ON ?auto_782698 ?auto_782697 ) ( ON ?auto_782699 ?auto_782698 ) ( ON ?auto_782700 ?auto_782699 ) ( ON ?auto_782701 ?auto_782700 ) ( ON ?auto_782702 ?auto_782701 ) ( ON ?auto_782703 ?auto_782702 ) ( ON ?auto_782704 ?auto_782703 ) ( ON ?auto_782705 ?auto_782704 ) ( ON ?auto_782706 ?auto_782705 ) ( ON ?auto_782707 ?auto_782706 ) ( ON ?auto_782708 ?auto_782707 ) ( not ( = ?auto_782697 ?auto_782698 ) ) ( not ( = ?auto_782697 ?auto_782699 ) ) ( not ( = ?auto_782697 ?auto_782700 ) ) ( not ( = ?auto_782697 ?auto_782701 ) ) ( not ( = ?auto_782697 ?auto_782702 ) ) ( not ( = ?auto_782697 ?auto_782703 ) ) ( not ( = ?auto_782697 ?auto_782704 ) ) ( not ( = ?auto_782697 ?auto_782705 ) ) ( not ( = ?auto_782697 ?auto_782706 ) ) ( not ( = ?auto_782697 ?auto_782707 ) ) ( not ( = ?auto_782697 ?auto_782708 ) ) ( not ( = ?auto_782697 ?auto_782709 ) ) ( not ( = ?auto_782697 ?auto_782710 ) ) ( not ( = ?auto_782697 ?auto_782711 ) ) ( not ( = ?auto_782697 ?auto_782712 ) ) ( not ( = ?auto_782697 ?auto_782713 ) ) ( not ( = ?auto_782697 ?auto_782714 ) ) ( not ( = ?auto_782697 ?auto_782715 ) ) ( not ( = ?auto_782698 ?auto_782699 ) ) ( not ( = ?auto_782698 ?auto_782700 ) ) ( not ( = ?auto_782698 ?auto_782701 ) ) ( not ( = ?auto_782698 ?auto_782702 ) ) ( not ( = ?auto_782698 ?auto_782703 ) ) ( not ( = ?auto_782698 ?auto_782704 ) ) ( not ( = ?auto_782698 ?auto_782705 ) ) ( not ( = ?auto_782698 ?auto_782706 ) ) ( not ( = ?auto_782698 ?auto_782707 ) ) ( not ( = ?auto_782698 ?auto_782708 ) ) ( not ( = ?auto_782698 ?auto_782709 ) ) ( not ( = ?auto_782698 ?auto_782710 ) ) ( not ( = ?auto_782698 ?auto_782711 ) ) ( not ( = ?auto_782698 ?auto_782712 ) ) ( not ( = ?auto_782698 ?auto_782713 ) ) ( not ( = ?auto_782698 ?auto_782714 ) ) ( not ( = ?auto_782698 ?auto_782715 ) ) ( not ( = ?auto_782699 ?auto_782700 ) ) ( not ( = ?auto_782699 ?auto_782701 ) ) ( not ( = ?auto_782699 ?auto_782702 ) ) ( not ( = ?auto_782699 ?auto_782703 ) ) ( not ( = ?auto_782699 ?auto_782704 ) ) ( not ( = ?auto_782699 ?auto_782705 ) ) ( not ( = ?auto_782699 ?auto_782706 ) ) ( not ( = ?auto_782699 ?auto_782707 ) ) ( not ( = ?auto_782699 ?auto_782708 ) ) ( not ( = ?auto_782699 ?auto_782709 ) ) ( not ( = ?auto_782699 ?auto_782710 ) ) ( not ( = ?auto_782699 ?auto_782711 ) ) ( not ( = ?auto_782699 ?auto_782712 ) ) ( not ( = ?auto_782699 ?auto_782713 ) ) ( not ( = ?auto_782699 ?auto_782714 ) ) ( not ( = ?auto_782699 ?auto_782715 ) ) ( not ( = ?auto_782700 ?auto_782701 ) ) ( not ( = ?auto_782700 ?auto_782702 ) ) ( not ( = ?auto_782700 ?auto_782703 ) ) ( not ( = ?auto_782700 ?auto_782704 ) ) ( not ( = ?auto_782700 ?auto_782705 ) ) ( not ( = ?auto_782700 ?auto_782706 ) ) ( not ( = ?auto_782700 ?auto_782707 ) ) ( not ( = ?auto_782700 ?auto_782708 ) ) ( not ( = ?auto_782700 ?auto_782709 ) ) ( not ( = ?auto_782700 ?auto_782710 ) ) ( not ( = ?auto_782700 ?auto_782711 ) ) ( not ( = ?auto_782700 ?auto_782712 ) ) ( not ( = ?auto_782700 ?auto_782713 ) ) ( not ( = ?auto_782700 ?auto_782714 ) ) ( not ( = ?auto_782700 ?auto_782715 ) ) ( not ( = ?auto_782701 ?auto_782702 ) ) ( not ( = ?auto_782701 ?auto_782703 ) ) ( not ( = ?auto_782701 ?auto_782704 ) ) ( not ( = ?auto_782701 ?auto_782705 ) ) ( not ( = ?auto_782701 ?auto_782706 ) ) ( not ( = ?auto_782701 ?auto_782707 ) ) ( not ( = ?auto_782701 ?auto_782708 ) ) ( not ( = ?auto_782701 ?auto_782709 ) ) ( not ( = ?auto_782701 ?auto_782710 ) ) ( not ( = ?auto_782701 ?auto_782711 ) ) ( not ( = ?auto_782701 ?auto_782712 ) ) ( not ( = ?auto_782701 ?auto_782713 ) ) ( not ( = ?auto_782701 ?auto_782714 ) ) ( not ( = ?auto_782701 ?auto_782715 ) ) ( not ( = ?auto_782702 ?auto_782703 ) ) ( not ( = ?auto_782702 ?auto_782704 ) ) ( not ( = ?auto_782702 ?auto_782705 ) ) ( not ( = ?auto_782702 ?auto_782706 ) ) ( not ( = ?auto_782702 ?auto_782707 ) ) ( not ( = ?auto_782702 ?auto_782708 ) ) ( not ( = ?auto_782702 ?auto_782709 ) ) ( not ( = ?auto_782702 ?auto_782710 ) ) ( not ( = ?auto_782702 ?auto_782711 ) ) ( not ( = ?auto_782702 ?auto_782712 ) ) ( not ( = ?auto_782702 ?auto_782713 ) ) ( not ( = ?auto_782702 ?auto_782714 ) ) ( not ( = ?auto_782702 ?auto_782715 ) ) ( not ( = ?auto_782703 ?auto_782704 ) ) ( not ( = ?auto_782703 ?auto_782705 ) ) ( not ( = ?auto_782703 ?auto_782706 ) ) ( not ( = ?auto_782703 ?auto_782707 ) ) ( not ( = ?auto_782703 ?auto_782708 ) ) ( not ( = ?auto_782703 ?auto_782709 ) ) ( not ( = ?auto_782703 ?auto_782710 ) ) ( not ( = ?auto_782703 ?auto_782711 ) ) ( not ( = ?auto_782703 ?auto_782712 ) ) ( not ( = ?auto_782703 ?auto_782713 ) ) ( not ( = ?auto_782703 ?auto_782714 ) ) ( not ( = ?auto_782703 ?auto_782715 ) ) ( not ( = ?auto_782704 ?auto_782705 ) ) ( not ( = ?auto_782704 ?auto_782706 ) ) ( not ( = ?auto_782704 ?auto_782707 ) ) ( not ( = ?auto_782704 ?auto_782708 ) ) ( not ( = ?auto_782704 ?auto_782709 ) ) ( not ( = ?auto_782704 ?auto_782710 ) ) ( not ( = ?auto_782704 ?auto_782711 ) ) ( not ( = ?auto_782704 ?auto_782712 ) ) ( not ( = ?auto_782704 ?auto_782713 ) ) ( not ( = ?auto_782704 ?auto_782714 ) ) ( not ( = ?auto_782704 ?auto_782715 ) ) ( not ( = ?auto_782705 ?auto_782706 ) ) ( not ( = ?auto_782705 ?auto_782707 ) ) ( not ( = ?auto_782705 ?auto_782708 ) ) ( not ( = ?auto_782705 ?auto_782709 ) ) ( not ( = ?auto_782705 ?auto_782710 ) ) ( not ( = ?auto_782705 ?auto_782711 ) ) ( not ( = ?auto_782705 ?auto_782712 ) ) ( not ( = ?auto_782705 ?auto_782713 ) ) ( not ( = ?auto_782705 ?auto_782714 ) ) ( not ( = ?auto_782705 ?auto_782715 ) ) ( not ( = ?auto_782706 ?auto_782707 ) ) ( not ( = ?auto_782706 ?auto_782708 ) ) ( not ( = ?auto_782706 ?auto_782709 ) ) ( not ( = ?auto_782706 ?auto_782710 ) ) ( not ( = ?auto_782706 ?auto_782711 ) ) ( not ( = ?auto_782706 ?auto_782712 ) ) ( not ( = ?auto_782706 ?auto_782713 ) ) ( not ( = ?auto_782706 ?auto_782714 ) ) ( not ( = ?auto_782706 ?auto_782715 ) ) ( not ( = ?auto_782707 ?auto_782708 ) ) ( not ( = ?auto_782707 ?auto_782709 ) ) ( not ( = ?auto_782707 ?auto_782710 ) ) ( not ( = ?auto_782707 ?auto_782711 ) ) ( not ( = ?auto_782707 ?auto_782712 ) ) ( not ( = ?auto_782707 ?auto_782713 ) ) ( not ( = ?auto_782707 ?auto_782714 ) ) ( not ( = ?auto_782707 ?auto_782715 ) ) ( not ( = ?auto_782708 ?auto_782709 ) ) ( not ( = ?auto_782708 ?auto_782710 ) ) ( not ( = ?auto_782708 ?auto_782711 ) ) ( not ( = ?auto_782708 ?auto_782712 ) ) ( not ( = ?auto_782708 ?auto_782713 ) ) ( not ( = ?auto_782708 ?auto_782714 ) ) ( not ( = ?auto_782708 ?auto_782715 ) ) ( not ( = ?auto_782709 ?auto_782710 ) ) ( not ( = ?auto_782709 ?auto_782711 ) ) ( not ( = ?auto_782709 ?auto_782712 ) ) ( not ( = ?auto_782709 ?auto_782713 ) ) ( not ( = ?auto_782709 ?auto_782714 ) ) ( not ( = ?auto_782709 ?auto_782715 ) ) ( not ( = ?auto_782710 ?auto_782711 ) ) ( not ( = ?auto_782710 ?auto_782712 ) ) ( not ( = ?auto_782710 ?auto_782713 ) ) ( not ( = ?auto_782710 ?auto_782714 ) ) ( not ( = ?auto_782710 ?auto_782715 ) ) ( not ( = ?auto_782711 ?auto_782712 ) ) ( not ( = ?auto_782711 ?auto_782713 ) ) ( not ( = ?auto_782711 ?auto_782714 ) ) ( not ( = ?auto_782711 ?auto_782715 ) ) ( not ( = ?auto_782712 ?auto_782713 ) ) ( not ( = ?auto_782712 ?auto_782714 ) ) ( not ( = ?auto_782712 ?auto_782715 ) ) ( not ( = ?auto_782713 ?auto_782714 ) ) ( not ( = ?auto_782713 ?auto_782715 ) ) ( not ( = ?auto_782714 ?auto_782715 ) ) ( ON ?auto_782713 ?auto_782714 ) ( ON ?auto_782712 ?auto_782713 ) ( ON ?auto_782711 ?auto_782712 ) ( ON ?auto_782710 ?auto_782711 ) ( CLEAR ?auto_782708 ) ( ON ?auto_782709 ?auto_782710 ) ( CLEAR ?auto_782709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_782697 ?auto_782698 ?auto_782699 ?auto_782700 ?auto_782701 ?auto_782702 ?auto_782703 ?auto_782704 ?auto_782705 ?auto_782706 ?auto_782707 ?auto_782708 ?auto_782709 )
      ( MAKE-18PILE ?auto_782697 ?auto_782698 ?auto_782699 ?auto_782700 ?auto_782701 ?auto_782702 ?auto_782703 ?auto_782704 ?auto_782705 ?auto_782706 ?auto_782707 ?auto_782708 ?auto_782709 ?auto_782710 ?auto_782711 ?auto_782712 ?auto_782713 ?auto_782714 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_782734 - BLOCK
      ?auto_782735 - BLOCK
      ?auto_782736 - BLOCK
      ?auto_782737 - BLOCK
      ?auto_782738 - BLOCK
      ?auto_782739 - BLOCK
      ?auto_782740 - BLOCK
      ?auto_782741 - BLOCK
      ?auto_782742 - BLOCK
      ?auto_782743 - BLOCK
      ?auto_782744 - BLOCK
      ?auto_782745 - BLOCK
      ?auto_782746 - BLOCK
      ?auto_782747 - BLOCK
      ?auto_782748 - BLOCK
      ?auto_782749 - BLOCK
      ?auto_782750 - BLOCK
      ?auto_782751 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_782751 ) ( ON-TABLE ?auto_782734 ) ( ON ?auto_782735 ?auto_782734 ) ( ON ?auto_782736 ?auto_782735 ) ( ON ?auto_782737 ?auto_782736 ) ( ON ?auto_782738 ?auto_782737 ) ( ON ?auto_782739 ?auto_782738 ) ( ON ?auto_782740 ?auto_782739 ) ( ON ?auto_782741 ?auto_782740 ) ( ON ?auto_782742 ?auto_782741 ) ( ON ?auto_782743 ?auto_782742 ) ( ON ?auto_782744 ?auto_782743 ) ( ON ?auto_782745 ?auto_782744 ) ( not ( = ?auto_782734 ?auto_782735 ) ) ( not ( = ?auto_782734 ?auto_782736 ) ) ( not ( = ?auto_782734 ?auto_782737 ) ) ( not ( = ?auto_782734 ?auto_782738 ) ) ( not ( = ?auto_782734 ?auto_782739 ) ) ( not ( = ?auto_782734 ?auto_782740 ) ) ( not ( = ?auto_782734 ?auto_782741 ) ) ( not ( = ?auto_782734 ?auto_782742 ) ) ( not ( = ?auto_782734 ?auto_782743 ) ) ( not ( = ?auto_782734 ?auto_782744 ) ) ( not ( = ?auto_782734 ?auto_782745 ) ) ( not ( = ?auto_782734 ?auto_782746 ) ) ( not ( = ?auto_782734 ?auto_782747 ) ) ( not ( = ?auto_782734 ?auto_782748 ) ) ( not ( = ?auto_782734 ?auto_782749 ) ) ( not ( = ?auto_782734 ?auto_782750 ) ) ( not ( = ?auto_782734 ?auto_782751 ) ) ( not ( = ?auto_782735 ?auto_782736 ) ) ( not ( = ?auto_782735 ?auto_782737 ) ) ( not ( = ?auto_782735 ?auto_782738 ) ) ( not ( = ?auto_782735 ?auto_782739 ) ) ( not ( = ?auto_782735 ?auto_782740 ) ) ( not ( = ?auto_782735 ?auto_782741 ) ) ( not ( = ?auto_782735 ?auto_782742 ) ) ( not ( = ?auto_782735 ?auto_782743 ) ) ( not ( = ?auto_782735 ?auto_782744 ) ) ( not ( = ?auto_782735 ?auto_782745 ) ) ( not ( = ?auto_782735 ?auto_782746 ) ) ( not ( = ?auto_782735 ?auto_782747 ) ) ( not ( = ?auto_782735 ?auto_782748 ) ) ( not ( = ?auto_782735 ?auto_782749 ) ) ( not ( = ?auto_782735 ?auto_782750 ) ) ( not ( = ?auto_782735 ?auto_782751 ) ) ( not ( = ?auto_782736 ?auto_782737 ) ) ( not ( = ?auto_782736 ?auto_782738 ) ) ( not ( = ?auto_782736 ?auto_782739 ) ) ( not ( = ?auto_782736 ?auto_782740 ) ) ( not ( = ?auto_782736 ?auto_782741 ) ) ( not ( = ?auto_782736 ?auto_782742 ) ) ( not ( = ?auto_782736 ?auto_782743 ) ) ( not ( = ?auto_782736 ?auto_782744 ) ) ( not ( = ?auto_782736 ?auto_782745 ) ) ( not ( = ?auto_782736 ?auto_782746 ) ) ( not ( = ?auto_782736 ?auto_782747 ) ) ( not ( = ?auto_782736 ?auto_782748 ) ) ( not ( = ?auto_782736 ?auto_782749 ) ) ( not ( = ?auto_782736 ?auto_782750 ) ) ( not ( = ?auto_782736 ?auto_782751 ) ) ( not ( = ?auto_782737 ?auto_782738 ) ) ( not ( = ?auto_782737 ?auto_782739 ) ) ( not ( = ?auto_782737 ?auto_782740 ) ) ( not ( = ?auto_782737 ?auto_782741 ) ) ( not ( = ?auto_782737 ?auto_782742 ) ) ( not ( = ?auto_782737 ?auto_782743 ) ) ( not ( = ?auto_782737 ?auto_782744 ) ) ( not ( = ?auto_782737 ?auto_782745 ) ) ( not ( = ?auto_782737 ?auto_782746 ) ) ( not ( = ?auto_782737 ?auto_782747 ) ) ( not ( = ?auto_782737 ?auto_782748 ) ) ( not ( = ?auto_782737 ?auto_782749 ) ) ( not ( = ?auto_782737 ?auto_782750 ) ) ( not ( = ?auto_782737 ?auto_782751 ) ) ( not ( = ?auto_782738 ?auto_782739 ) ) ( not ( = ?auto_782738 ?auto_782740 ) ) ( not ( = ?auto_782738 ?auto_782741 ) ) ( not ( = ?auto_782738 ?auto_782742 ) ) ( not ( = ?auto_782738 ?auto_782743 ) ) ( not ( = ?auto_782738 ?auto_782744 ) ) ( not ( = ?auto_782738 ?auto_782745 ) ) ( not ( = ?auto_782738 ?auto_782746 ) ) ( not ( = ?auto_782738 ?auto_782747 ) ) ( not ( = ?auto_782738 ?auto_782748 ) ) ( not ( = ?auto_782738 ?auto_782749 ) ) ( not ( = ?auto_782738 ?auto_782750 ) ) ( not ( = ?auto_782738 ?auto_782751 ) ) ( not ( = ?auto_782739 ?auto_782740 ) ) ( not ( = ?auto_782739 ?auto_782741 ) ) ( not ( = ?auto_782739 ?auto_782742 ) ) ( not ( = ?auto_782739 ?auto_782743 ) ) ( not ( = ?auto_782739 ?auto_782744 ) ) ( not ( = ?auto_782739 ?auto_782745 ) ) ( not ( = ?auto_782739 ?auto_782746 ) ) ( not ( = ?auto_782739 ?auto_782747 ) ) ( not ( = ?auto_782739 ?auto_782748 ) ) ( not ( = ?auto_782739 ?auto_782749 ) ) ( not ( = ?auto_782739 ?auto_782750 ) ) ( not ( = ?auto_782739 ?auto_782751 ) ) ( not ( = ?auto_782740 ?auto_782741 ) ) ( not ( = ?auto_782740 ?auto_782742 ) ) ( not ( = ?auto_782740 ?auto_782743 ) ) ( not ( = ?auto_782740 ?auto_782744 ) ) ( not ( = ?auto_782740 ?auto_782745 ) ) ( not ( = ?auto_782740 ?auto_782746 ) ) ( not ( = ?auto_782740 ?auto_782747 ) ) ( not ( = ?auto_782740 ?auto_782748 ) ) ( not ( = ?auto_782740 ?auto_782749 ) ) ( not ( = ?auto_782740 ?auto_782750 ) ) ( not ( = ?auto_782740 ?auto_782751 ) ) ( not ( = ?auto_782741 ?auto_782742 ) ) ( not ( = ?auto_782741 ?auto_782743 ) ) ( not ( = ?auto_782741 ?auto_782744 ) ) ( not ( = ?auto_782741 ?auto_782745 ) ) ( not ( = ?auto_782741 ?auto_782746 ) ) ( not ( = ?auto_782741 ?auto_782747 ) ) ( not ( = ?auto_782741 ?auto_782748 ) ) ( not ( = ?auto_782741 ?auto_782749 ) ) ( not ( = ?auto_782741 ?auto_782750 ) ) ( not ( = ?auto_782741 ?auto_782751 ) ) ( not ( = ?auto_782742 ?auto_782743 ) ) ( not ( = ?auto_782742 ?auto_782744 ) ) ( not ( = ?auto_782742 ?auto_782745 ) ) ( not ( = ?auto_782742 ?auto_782746 ) ) ( not ( = ?auto_782742 ?auto_782747 ) ) ( not ( = ?auto_782742 ?auto_782748 ) ) ( not ( = ?auto_782742 ?auto_782749 ) ) ( not ( = ?auto_782742 ?auto_782750 ) ) ( not ( = ?auto_782742 ?auto_782751 ) ) ( not ( = ?auto_782743 ?auto_782744 ) ) ( not ( = ?auto_782743 ?auto_782745 ) ) ( not ( = ?auto_782743 ?auto_782746 ) ) ( not ( = ?auto_782743 ?auto_782747 ) ) ( not ( = ?auto_782743 ?auto_782748 ) ) ( not ( = ?auto_782743 ?auto_782749 ) ) ( not ( = ?auto_782743 ?auto_782750 ) ) ( not ( = ?auto_782743 ?auto_782751 ) ) ( not ( = ?auto_782744 ?auto_782745 ) ) ( not ( = ?auto_782744 ?auto_782746 ) ) ( not ( = ?auto_782744 ?auto_782747 ) ) ( not ( = ?auto_782744 ?auto_782748 ) ) ( not ( = ?auto_782744 ?auto_782749 ) ) ( not ( = ?auto_782744 ?auto_782750 ) ) ( not ( = ?auto_782744 ?auto_782751 ) ) ( not ( = ?auto_782745 ?auto_782746 ) ) ( not ( = ?auto_782745 ?auto_782747 ) ) ( not ( = ?auto_782745 ?auto_782748 ) ) ( not ( = ?auto_782745 ?auto_782749 ) ) ( not ( = ?auto_782745 ?auto_782750 ) ) ( not ( = ?auto_782745 ?auto_782751 ) ) ( not ( = ?auto_782746 ?auto_782747 ) ) ( not ( = ?auto_782746 ?auto_782748 ) ) ( not ( = ?auto_782746 ?auto_782749 ) ) ( not ( = ?auto_782746 ?auto_782750 ) ) ( not ( = ?auto_782746 ?auto_782751 ) ) ( not ( = ?auto_782747 ?auto_782748 ) ) ( not ( = ?auto_782747 ?auto_782749 ) ) ( not ( = ?auto_782747 ?auto_782750 ) ) ( not ( = ?auto_782747 ?auto_782751 ) ) ( not ( = ?auto_782748 ?auto_782749 ) ) ( not ( = ?auto_782748 ?auto_782750 ) ) ( not ( = ?auto_782748 ?auto_782751 ) ) ( not ( = ?auto_782749 ?auto_782750 ) ) ( not ( = ?auto_782749 ?auto_782751 ) ) ( not ( = ?auto_782750 ?auto_782751 ) ) ( ON ?auto_782750 ?auto_782751 ) ( ON ?auto_782749 ?auto_782750 ) ( ON ?auto_782748 ?auto_782749 ) ( ON ?auto_782747 ?auto_782748 ) ( CLEAR ?auto_782745 ) ( ON ?auto_782746 ?auto_782747 ) ( CLEAR ?auto_782746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_782734 ?auto_782735 ?auto_782736 ?auto_782737 ?auto_782738 ?auto_782739 ?auto_782740 ?auto_782741 ?auto_782742 ?auto_782743 ?auto_782744 ?auto_782745 ?auto_782746 )
      ( MAKE-18PILE ?auto_782734 ?auto_782735 ?auto_782736 ?auto_782737 ?auto_782738 ?auto_782739 ?auto_782740 ?auto_782741 ?auto_782742 ?auto_782743 ?auto_782744 ?auto_782745 ?auto_782746 ?auto_782747 ?auto_782748 ?auto_782749 ?auto_782750 ?auto_782751 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_782770 - BLOCK
      ?auto_782771 - BLOCK
      ?auto_782772 - BLOCK
      ?auto_782773 - BLOCK
      ?auto_782774 - BLOCK
      ?auto_782775 - BLOCK
      ?auto_782776 - BLOCK
      ?auto_782777 - BLOCK
      ?auto_782778 - BLOCK
      ?auto_782779 - BLOCK
      ?auto_782780 - BLOCK
      ?auto_782781 - BLOCK
      ?auto_782782 - BLOCK
      ?auto_782783 - BLOCK
      ?auto_782784 - BLOCK
      ?auto_782785 - BLOCK
      ?auto_782786 - BLOCK
      ?auto_782787 - BLOCK
    )
    :vars
    (
      ?auto_782788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_782787 ?auto_782788 ) ( ON-TABLE ?auto_782770 ) ( ON ?auto_782771 ?auto_782770 ) ( ON ?auto_782772 ?auto_782771 ) ( ON ?auto_782773 ?auto_782772 ) ( ON ?auto_782774 ?auto_782773 ) ( ON ?auto_782775 ?auto_782774 ) ( ON ?auto_782776 ?auto_782775 ) ( ON ?auto_782777 ?auto_782776 ) ( ON ?auto_782778 ?auto_782777 ) ( ON ?auto_782779 ?auto_782778 ) ( ON ?auto_782780 ?auto_782779 ) ( not ( = ?auto_782770 ?auto_782771 ) ) ( not ( = ?auto_782770 ?auto_782772 ) ) ( not ( = ?auto_782770 ?auto_782773 ) ) ( not ( = ?auto_782770 ?auto_782774 ) ) ( not ( = ?auto_782770 ?auto_782775 ) ) ( not ( = ?auto_782770 ?auto_782776 ) ) ( not ( = ?auto_782770 ?auto_782777 ) ) ( not ( = ?auto_782770 ?auto_782778 ) ) ( not ( = ?auto_782770 ?auto_782779 ) ) ( not ( = ?auto_782770 ?auto_782780 ) ) ( not ( = ?auto_782770 ?auto_782781 ) ) ( not ( = ?auto_782770 ?auto_782782 ) ) ( not ( = ?auto_782770 ?auto_782783 ) ) ( not ( = ?auto_782770 ?auto_782784 ) ) ( not ( = ?auto_782770 ?auto_782785 ) ) ( not ( = ?auto_782770 ?auto_782786 ) ) ( not ( = ?auto_782770 ?auto_782787 ) ) ( not ( = ?auto_782770 ?auto_782788 ) ) ( not ( = ?auto_782771 ?auto_782772 ) ) ( not ( = ?auto_782771 ?auto_782773 ) ) ( not ( = ?auto_782771 ?auto_782774 ) ) ( not ( = ?auto_782771 ?auto_782775 ) ) ( not ( = ?auto_782771 ?auto_782776 ) ) ( not ( = ?auto_782771 ?auto_782777 ) ) ( not ( = ?auto_782771 ?auto_782778 ) ) ( not ( = ?auto_782771 ?auto_782779 ) ) ( not ( = ?auto_782771 ?auto_782780 ) ) ( not ( = ?auto_782771 ?auto_782781 ) ) ( not ( = ?auto_782771 ?auto_782782 ) ) ( not ( = ?auto_782771 ?auto_782783 ) ) ( not ( = ?auto_782771 ?auto_782784 ) ) ( not ( = ?auto_782771 ?auto_782785 ) ) ( not ( = ?auto_782771 ?auto_782786 ) ) ( not ( = ?auto_782771 ?auto_782787 ) ) ( not ( = ?auto_782771 ?auto_782788 ) ) ( not ( = ?auto_782772 ?auto_782773 ) ) ( not ( = ?auto_782772 ?auto_782774 ) ) ( not ( = ?auto_782772 ?auto_782775 ) ) ( not ( = ?auto_782772 ?auto_782776 ) ) ( not ( = ?auto_782772 ?auto_782777 ) ) ( not ( = ?auto_782772 ?auto_782778 ) ) ( not ( = ?auto_782772 ?auto_782779 ) ) ( not ( = ?auto_782772 ?auto_782780 ) ) ( not ( = ?auto_782772 ?auto_782781 ) ) ( not ( = ?auto_782772 ?auto_782782 ) ) ( not ( = ?auto_782772 ?auto_782783 ) ) ( not ( = ?auto_782772 ?auto_782784 ) ) ( not ( = ?auto_782772 ?auto_782785 ) ) ( not ( = ?auto_782772 ?auto_782786 ) ) ( not ( = ?auto_782772 ?auto_782787 ) ) ( not ( = ?auto_782772 ?auto_782788 ) ) ( not ( = ?auto_782773 ?auto_782774 ) ) ( not ( = ?auto_782773 ?auto_782775 ) ) ( not ( = ?auto_782773 ?auto_782776 ) ) ( not ( = ?auto_782773 ?auto_782777 ) ) ( not ( = ?auto_782773 ?auto_782778 ) ) ( not ( = ?auto_782773 ?auto_782779 ) ) ( not ( = ?auto_782773 ?auto_782780 ) ) ( not ( = ?auto_782773 ?auto_782781 ) ) ( not ( = ?auto_782773 ?auto_782782 ) ) ( not ( = ?auto_782773 ?auto_782783 ) ) ( not ( = ?auto_782773 ?auto_782784 ) ) ( not ( = ?auto_782773 ?auto_782785 ) ) ( not ( = ?auto_782773 ?auto_782786 ) ) ( not ( = ?auto_782773 ?auto_782787 ) ) ( not ( = ?auto_782773 ?auto_782788 ) ) ( not ( = ?auto_782774 ?auto_782775 ) ) ( not ( = ?auto_782774 ?auto_782776 ) ) ( not ( = ?auto_782774 ?auto_782777 ) ) ( not ( = ?auto_782774 ?auto_782778 ) ) ( not ( = ?auto_782774 ?auto_782779 ) ) ( not ( = ?auto_782774 ?auto_782780 ) ) ( not ( = ?auto_782774 ?auto_782781 ) ) ( not ( = ?auto_782774 ?auto_782782 ) ) ( not ( = ?auto_782774 ?auto_782783 ) ) ( not ( = ?auto_782774 ?auto_782784 ) ) ( not ( = ?auto_782774 ?auto_782785 ) ) ( not ( = ?auto_782774 ?auto_782786 ) ) ( not ( = ?auto_782774 ?auto_782787 ) ) ( not ( = ?auto_782774 ?auto_782788 ) ) ( not ( = ?auto_782775 ?auto_782776 ) ) ( not ( = ?auto_782775 ?auto_782777 ) ) ( not ( = ?auto_782775 ?auto_782778 ) ) ( not ( = ?auto_782775 ?auto_782779 ) ) ( not ( = ?auto_782775 ?auto_782780 ) ) ( not ( = ?auto_782775 ?auto_782781 ) ) ( not ( = ?auto_782775 ?auto_782782 ) ) ( not ( = ?auto_782775 ?auto_782783 ) ) ( not ( = ?auto_782775 ?auto_782784 ) ) ( not ( = ?auto_782775 ?auto_782785 ) ) ( not ( = ?auto_782775 ?auto_782786 ) ) ( not ( = ?auto_782775 ?auto_782787 ) ) ( not ( = ?auto_782775 ?auto_782788 ) ) ( not ( = ?auto_782776 ?auto_782777 ) ) ( not ( = ?auto_782776 ?auto_782778 ) ) ( not ( = ?auto_782776 ?auto_782779 ) ) ( not ( = ?auto_782776 ?auto_782780 ) ) ( not ( = ?auto_782776 ?auto_782781 ) ) ( not ( = ?auto_782776 ?auto_782782 ) ) ( not ( = ?auto_782776 ?auto_782783 ) ) ( not ( = ?auto_782776 ?auto_782784 ) ) ( not ( = ?auto_782776 ?auto_782785 ) ) ( not ( = ?auto_782776 ?auto_782786 ) ) ( not ( = ?auto_782776 ?auto_782787 ) ) ( not ( = ?auto_782776 ?auto_782788 ) ) ( not ( = ?auto_782777 ?auto_782778 ) ) ( not ( = ?auto_782777 ?auto_782779 ) ) ( not ( = ?auto_782777 ?auto_782780 ) ) ( not ( = ?auto_782777 ?auto_782781 ) ) ( not ( = ?auto_782777 ?auto_782782 ) ) ( not ( = ?auto_782777 ?auto_782783 ) ) ( not ( = ?auto_782777 ?auto_782784 ) ) ( not ( = ?auto_782777 ?auto_782785 ) ) ( not ( = ?auto_782777 ?auto_782786 ) ) ( not ( = ?auto_782777 ?auto_782787 ) ) ( not ( = ?auto_782777 ?auto_782788 ) ) ( not ( = ?auto_782778 ?auto_782779 ) ) ( not ( = ?auto_782778 ?auto_782780 ) ) ( not ( = ?auto_782778 ?auto_782781 ) ) ( not ( = ?auto_782778 ?auto_782782 ) ) ( not ( = ?auto_782778 ?auto_782783 ) ) ( not ( = ?auto_782778 ?auto_782784 ) ) ( not ( = ?auto_782778 ?auto_782785 ) ) ( not ( = ?auto_782778 ?auto_782786 ) ) ( not ( = ?auto_782778 ?auto_782787 ) ) ( not ( = ?auto_782778 ?auto_782788 ) ) ( not ( = ?auto_782779 ?auto_782780 ) ) ( not ( = ?auto_782779 ?auto_782781 ) ) ( not ( = ?auto_782779 ?auto_782782 ) ) ( not ( = ?auto_782779 ?auto_782783 ) ) ( not ( = ?auto_782779 ?auto_782784 ) ) ( not ( = ?auto_782779 ?auto_782785 ) ) ( not ( = ?auto_782779 ?auto_782786 ) ) ( not ( = ?auto_782779 ?auto_782787 ) ) ( not ( = ?auto_782779 ?auto_782788 ) ) ( not ( = ?auto_782780 ?auto_782781 ) ) ( not ( = ?auto_782780 ?auto_782782 ) ) ( not ( = ?auto_782780 ?auto_782783 ) ) ( not ( = ?auto_782780 ?auto_782784 ) ) ( not ( = ?auto_782780 ?auto_782785 ) ) ( not ( = ?auto_782780 ?auto_782786 ) ) ( not ( = ?auto_782780 ?auto_782787 ) ) ( not ( = ?auto_782780 ?auto_782788 ) ) ( not ( = ?auto_782781 ?auto_782782 ) ) ( not ( = ?auto_782781 ?auto_782783 ) ) ( not ( = ?auto_782781 ?auto_782784 ) ) ( not ( = ?auto_782781 ?auto_782785 ) ) ( not ( = ?auto_782781 ?auto_782786 ) ) ( not ( = ?auto_782781 ?auto_782787 ) ) ( not ( = ?auto_782781 ?auto_782788 ) ) ( not ( = ?auto_782782 ?auto_782783 ) ) ( not ( = ?auto_782782 ?auto_782784 ) ) ( not ( = ?auto_782782 ?auto_782785 ) ) ( not ( = ?auto_782782 ?auto_782786 ) ) ( not ( = ?auto_782782 ?auto_782787 ) ) ( not ( = ?auto_782782 ?auto_782788 ) ) ( not ( = ?auto_782783 ?auto_782784 ) ) ( not ( = ?auto_782783 ?auto_782785 ) ) ( not ( = ?auto_782783 ?auto_782786 ) ) ( not ( = ?auto_782783 ?auto_782787 ) ) ( not ( = ?auto_782783 ?auto_782788 ) ) ( not ( = ?auto_782784 ?auto_782785 ) ) ( not ( = ?auto_782784 ?auto_782786 ) ) ( not ( = ?auto_782784 ?auto_782787 ) ) ( not ( = ?auto_782784 ?auto_782788 ) ) ( not ( = ?auto_782785 ?auto_782786 ) ) ( not ( = ?auto_782785 ?auto_782787 ) ) ( not ( = ?auto_782785 ?auto_782788 ) ) ( not ( = ?auto_782786 ?auto_782787 ) ) ( not ( = ?auto_782786 ?auto_782788 ) ) ( not ( = ?auto_782787 ?auto_782788 ) ) ( ON ?auto_782786 ?auto_782787 ) ( ON ?auto_782785 ?auto_782786 ) ( ON ?auto_782784 ?auto_782785 ) ( ON ?auto_782783 ?auto_782784 ) ( ON ?auto_782782 ?auto_782783 ) ( CLEAR ?auto_782780 ) ( ON ?auto_782781 ?auto_782782 ) ( CLEAR ?auto_782781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_782770 ?auto_782771 ?auto_782772 ?auto_782773 ?auto_782774 ?auto_782775 ?auto_782776 ?auto_782777 ?auto_782778 ?auto_782779 ?auto_782780 ?auto_782781 )
      ( MAKE-18PILE ?auto_782770 ?auto_782771 ?auto_782772 ?auto_782773 ?auto_782774 ?auto_782775 ?auto_782776 ?auto_782777 ?auto_782778 ?auto_782779 ?auto_782780 ?auto_782781 ?auto_782782 ?auto_782783 ?auto_782784 ?auto_782785 ?auto_782786 ?auto_782787 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_782807 - BLOCK
      ?auto_782808 - BLOCK
      ?auto_782809 - BLOCK
      ?auto_782810 - BLOCK
      ?auto_782811 - BLOCK
      ?auto_782812 - BLOCK
      ?auto_782813 - BLOCK
      ?auto_782814 - BLOCK
      ?auto_782815 - BLOCK
      ?auto_782816 - BLOCK
      ?auto_782817 - BLOCK
      ?auto_782818 - BLOCK
      ?auto_782819 - BLOCK
      ?auto_782820 - BLOCK
      ?auto_782821 - BLOCK
      ?auto_782822 - BLOCK
      ?auto_782823 - BLOCK
      ?auto_782824 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_782824 ) ( ON-TABLE ?auto_782807 ) ( ON ?auto_782808 ?auto_782807 ) ( ON ?auto_782809 ?auto_782808 ) ( ON ?auto_782810 ?auto_782809 ) ( ON ?auto_782811 ?auto_782810 ) ( ON ?auto_782812 ?auto_782811 ) ( ON ?auto_782813 ?auto_782812 ) ( ON ?auto_782814 ?auto_782813 ) ( ON ?auto_782815 ?auto_782814 ) ( ON ?auto_782816 ?auto_782815 ) ( ON ?auto_782817 ?auto_782816 ) ( not ( = ?auto_782807 ?auto_782808 ) ) ( not ( = ?auto_782807 ?auto_782809 ) ) ( not ( = ?auto_782807 ?auto_782810 ) ) ( not ( = ?auto_782807 ?auto_782811 ) ) ( not ( = ?auto_782807 ?auto_782812 ) ) ( not ( = ?auto_782807 ?auto_782813 ) ) ( not ( = ?auto_782807 ?auto_782814 ) ) ( not ( = ?auto_782807 ?auto_782815 ) ) ( not ( = ?auto_782807 ?auto_782816 ) ) ( not ( = ?auto_782807 ?auto_782817 ) ) ( not ( = ?auto_782807 ?auto_782818 ) ) ( not ( = ?auto_782807 ?auto_782819 ) ) ( not ( = ?auto_782807 ?auto_782820 ) ) ( not ( = ?auto_782807 ?auto_782821 ) ) ( not ( = ?auto_782807 ?auto_782822 ) ) ( not ( = ?auto_782807 ?auto_782823 ) ) ( not ( = ?auto_782807 ?auto_782824 ) ) ( not ( = ?auto_782808 ?auto_782809 ) ) ( not ( = ?auto_782808 ?auto_782810 ) ) ( not ( = ?auto_782808 ?auto_782811 ) ) ( not ( = ?auto_782808 ?auto_782812 ) ) ( not ( = ?auto_782808 ?auto_782813 ) ) ( not ( = ?auto_782808 ?auto_782814 ) ) ( not ( = ?auto_782808 ?auto_782815 ) ) ( not ( = ?auto_782808 ?auto_782816 ) ) ( not ( = ?auto_782808 ?auto_782817 ) ) ( not ( = ?auto_782808 ?auto_782818 ) ) ( not ( = ?auto_782808 ?auto_782819 ) ) ( not ( = ?auto_782808 ?auto_782820 ) ) ( not ( = ?auto_782808 ?auto_782821 ) ) ( not ( = ?auto_782808 ?auto_782822 ) ) ( not ( = ?auto_782808 ?auto_782823 ) ) ( not ( = ?auto_782808 ?auto_782824 ) ) ( not ( = ?auto_782809 ?auto_782810 ) ) ( not ( = ?auto_782809 ?auto_782811 ) ) ( not ( = ?auto_782809 ?auto_782812 ) ) ( not ( = ?auto_782809 ?auto_782813 ) ) ( not ( = ?auto_782809 ?auto_782814 ) ) ( not ( = ?auto_782809 ?auto_782815 ) ) ( not ( = ?auto_782809 ?auto_782816 ) ) ( not ( = ?auto_782809 ?auto_782817 ) ) ( not ( = ?auto_782809 ?auto_782818 ) ) ( not ( = ?auto_782809 ?auto_782819 ) ) ( not ( = ?auto_782809 ?auto_782820 ) ) ( not ( = ?auto_782809 ?auto_782821 ) ) ( not ( = ?auto_782809 ?auto_782822 ) ) ( not ( = ?auto_782809 ?auto_782823 ) ) ( not ( = ?auto_782809 ?auto_782824 ) ) ( not ( = ?auto_782810 ?auto_782811 ) ) ( not ( = ?auto_782810 ?auto_782812 ) ) ( not ( = ?auto_782810 ?auto_782813 ) ) ( not ( = ?auto_782810 ?auto_782814 ) ) ( not ( = ?auto_782810 ?auto_782815 ) ) ( not ( = ?auto_782810 ?auto_782816 ) ) ( not ( = ?auto_782810 ?auto_782817 ) ) ( not ( = ?auto_782810 ?auto_782818 ) ) ( not ( = ?auto_782810 ?auto_782819 ) ) ( not ( = ?auto_782810 ?auto_782820 ) ) ( not ( = ?auto_782810 ?auto_782821 ) ) ( not ( = ?auto_782810 ?auto_782822 ) ) ( not ( = ?auto_782810 ?auto_782823 ) ) ( not ( = ?auto_782810 ?auto_782824 ) ) ( not ( = ?auto_782811 ?auto_782812 ) ) ( not ( = ?auto_782811 ?auto_782813 ) ) ( not ( = ?auto_782811 ?auto_782814 ) ) ( not ( = ?auto_782811 ?auto_782815 ) ) ( not ( = ?auto_782811 ?auto_782816 ) ) ( not ( = ?auto_782811 ?auto_782817 ) ) ( not ( = ?auto_782811 ?auto_782818 ) ) ( not ( = ?auto_782811 ?auto_782819 ) ) ( not ( = ?auto_782811 ?auto_782820 ) ) ( not ( = ?auto_782811 ?auto_782821 ) ) ( not ( = ?auto_782811 ?auto_782822 ) ) ( not ( = ?auto_782811 ?auto_782823 ) ) ( not ( = ?auto_782811 ?auto_782824 ) ) ( not ( = ?auto_782812 ?auto_782813 ) ) ( not ( = ?auto_782812 ?auto_782814 ) ) ( not ( = ?auto_782812 ?auto_782815 ) ) ( not ( = ?auto_782812 ?auto_782816 ) ) ( not ( = ?auto_782812 ?auto_782817 ) ) ( not ( = ?auto_782812 ?auto_782818 ) ) ( not ( = ?auto_782812 ?auto_782819 ) ) ( not ( = ?auto_782812 ?auto_782820 ) ) ( not ( = ?auto_782812 ?auto_782821 ) ) ( not ( = ?auto_782812 ?auto_782822 ) ) ( not ( = ?auto_782812 ?auto_782823 ) ) ( not ( = ?auto_782812 ?auto_782824 ) ) ( not ( = ?auto_782813 ?auto_782814 ) ) ( not ( = ?auto_782813 ?auto_782815 ) ) ( not ( = ?auto_782813 ?auto_782816 ) ) ( not ( = ?auto_782813 ?auto_782817 ) ) ( not ( = ?auto_782813 ?auto_782818 ) ) ( not ( = ?auto_782813 ?auto_782819 ) ) ( not ( = ?auto_782813 ?auto_782820 ) ) ( not ( = ?auto_782813 ?auto_782821 ) ) ( not ( = ?auto_782813 ?auto_782822 ) ) ( not ( = ?auto_782813 ?auto_782823 ) ) ( not ( = ?auto_782813 ?auto_782824 ) ) ( not ( = ?auto_782814 ?auto_782815 ) ) ( not ( = ?auto_782814 ?auto_782816 ) ) ( not ( = ?auto_782814 ?auto_782817 ) ) ( not ( = ?auto_782814 ?auto_782818 ) ) ( not ( = ?auto_782814 ?auto_782819 ) ) ( not ( = ?auto_782814 ?auto_782820 ) ) ( not ( = ?auto_782814 ?auto_782821 ) ) ( not ( = ?auto_782814 ?auto_782822 ) ) ( not ( = ?auto_782814 ?auto_782823 ) ) ( not ( = ?auto_782814 ?auto_782824 ) ) ( not ( = ?auto_782815 ?auto_782816 ) ) ( not ( = ?auto_782815 ?auto_782817 ) ) ( not ( = ?auto_782815 ?auto_782818 ) ) ( not ( = ?auto_782815 ?auto_782819 ) ) ( not ( = ?auto_782815 ?auto_782820 ) ) ( not ( = ?auto_782815 ?auto_782821 ) ) ( not ( = ?auto_782815 ?auto_782822 ) ) ( not ( = ?auto_782815 ?auto_782823 ) ) ( not ( = ?auto_782815 ?auto_782824 ) ) ( not ( = ?auto_782816 ?auto_782817 ) ) ( not ( = ?auto_782816 ?auto_782818 ) ) ( not ( = ?auto_782816 ?auto_782819 ) ) ( not ( = ?auto_782816 ?auto_782820 ) ) ( not ( = ?auto_782816 ?auto_782821 ) ) ( not ( = ?auto_782816 ?auto_782822 ) ) ( not ( = ?auto_782816 ?auto_782823 ) ) ( not ( = ?auto_782816 ?auto_782824 ) ) ( not ( = ?auto_782817 ?auto_782818 ) ) ( not ( = ?auto_782817 ?auto_782819 ) ) ( not ( = ?auto_782817 ?auto_782820 ) ) ( not ( = ?auto_782817 ?auto_782821 ) ) ( not ( = ?auto_782817 ?auto_782822 ) ) ( not ( = ?auto_782817 ?auto_782823 ) ) ( not ( = ?auto_782817 ?auto_782824 ) ) ( not ( = ?auto_782818 ?auto_782819 ) ) ( not ( = ?auto_782818 ?auto_782820 ) ) ( not ( = ?auto_782818 ?auto_782821 ) ) ( not ( = ?auto_782818 ?auto_782822 ) ) ( not ( = ?auto_782818 ?auto_782823 ) ) ( not ( = ?auto_782818 ?auto_782824 ) ) ( not ( = ?auto_782819 ?auto_782820 ) ) ( not ( = ?auto_782819 ?auto_782821 ) ) ( not ( = ?auto_782819 ?auto_782822 ) ) ( not ( = ?auto_782819 ?auto_782823 ) ) ( not ( = ?auto_782819 ?auto_782824 ) ) ( not ( = ?auto_782820 ?auto_782821 ) ) ( not ( = ?auto_782820 ?auto_782822 ) ) ( not ( = ?auto_782820 ?auto_782823 ) ) ( not ( = ?auto_782820 ?auto_782824 ) ) ( not ( = ?auto_782821 ?auto_782822 ) ) ( not ( = ?auto_782821 ?auto_782823 ) ) ( not ( = ?auto_782821 ?auto_782824 ) ) ( not ( = ?auto_782822 ?auto_782823 ) ) ( not ( = ?auto_782822 ?auto_782824 ) ) ( not ( = ?auto_782823 ?auto_782824 ) ) ( ON ?auto_782823 ?auto_782824 ) ( ON ?auto_782822 ?auto_782823 ) ( ON ?auto_782821 ?auto_782822 ) ( ON ?auto_782820 ?auto_782821 ) ( ON ?auto_782819 ?auto_782820 ) ( CLEAR ?auto_782817 ) ( ON ?auto_782818 ?auto_782819 ) ( CLEAR ?auto_782818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_782807 ?auto_782808 ?auto_782809 ?auto_782810 ?auto_782811 ?auto_782812 ?auto_782813 ?auto_782814 ?auto_782815 ?auto_782816 ?auto_782817 ?auto_782818 )
      ( MAKE-18PILE ?auto_782807 ?auto_782808 ?auto_782809 ?auto_782810 ?auto_782811 ?auto_782812 ?auto_782813 ?auto_782814 ?auto_782815 ?auto_782816 ?auto_782817 ?auto_782818 ?auto_782819 ?auto_782820 ?auto_782821 ?auto_782822 ?auto_782823 ?auto_782824 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_782843 - BLOCK
      ?auto_782844 - BLOCK
      ?auto_782845 - BLOCK
      ?auto_782846 - BLOCK
      ?auto_782847 - BLOCK
      ?auto_782848 - BLOCK
      ?auto_782849 - BLOCK
      ?auto_782850 - BLOCK
      ?auto_782851 - BLOCK
      ?auto_782852 - BLOCK
      ?auto_782853 - BLOCK
      ?auto_782854 - BLOCK
      ?auto_782855 - BLOCK
      ?auto_782856 - BLOCK
      ?auto_782857 - BLOCK
      ?auto_782858 - BLOCK
      ?auto_782859 - BLOCK
      ?auto_782860 - BLOCK
    )
    :vars
    (
      ?auto_782861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_782860 ?auto_782861 ) ( ON-TABLE ?auto_782843 ) ( ON ?auto_782844 ?auto_782843 ) ( ON ?auto_782845 ?auto_782844 ) ( ON ?auto_782846 ?auto_782845 ) ( ON ?auto_782847 ?auto_782846 ) ( ON ?auto_782848 ?auto_782847 ) ( ON ?auto_782849 ?auto_782848 ) ( ON ?auto_782850 ?auto_782849 ) ( ON ?auto_782851 ?auto_782850 ) ( ON ?auto_782852 ?auto_782851 ) ( not ( = ?auto_782843 ?auto_782844 ) ) ( not ( = ?auto_782843 ?auto_782845 ) ) ( not ( = ?auto_782843 ?auto_782846 ) ) ( not ( = ?auto_782843 ?auto_782847 ) ) ( not ( = ?auto_782843 ?auto_782848 ) ) ( not ( = ?auto_782843 ?auto_782849 ) ) ( not ( = ?auto_782843 ?auto_782850 ) ) ( not ( = ?auto_782843 ?auto_782851 ) ) ( not ( = ?auto_782843 ?auto_782852 ) ) ( not ( = ?auto_782843 ?auto_782853 ) ) ( not ( = ?auto_782843 ?auto_782854 ) ) ( not ( = ?auto_782843 ?auto_782855 ) ) ( not ( = ?auto_782843 ?auto_782856 ) ) ( not ( = ?auto_782843 ?auto_782857 ) ) ( not ( = ?auto_782843 ?auto_782858 ) ) ( not ( = ?auto_782843 ?auto_782859 ) ) ( not ( = ?auto_782843 ?auto_782860 ) ) ( not ( = ?auto_782843 ?auto_782861 ) ) ( not ( = ?auto_782844 ?auto_782845 ) ) ( not ( = ?auto_782844 ?auto_782846 ) ) ( not ( = ?auto_782844 ?auto_782847 ) ) ( not ( = ?auto_782844 ?auto_782848 ) ) ( not ( = ?auto_782844 ?auto_782849 ) ) ( not ( = ?auto_782844 ?auto_782850 ) ) ( not ( = ?auto_782844 ?auto_782851 ) ) ( not ( = ?auto_782844 ?auto_782852 ) ) ( not ( = ?auto_782844 ?auto_782853 ) ) ( not ( = ?auto_782844 ?auto_782854 ) ) ( not ( = ?auto_782844 ?auto_782855 ) ) ( not ( = ?auto_782844 ?auto_782856 ) ) ( not ( = ?auto_782844 ?auto_782857 ) ) ( not ( = ?auto_782844 ?auto_782858 ) ) ( not ( = ?auto_782844 ?auto_782859 ) ) ( not ( = ?auto_782844 ?auto_782860 ) ) ( not ( = ?auto_782844 ?auto_782861 ) ) ( not ( = ?auto_782845 ?auto_782846 ) ) ( not ( = ?auto_782845 ?auto_782847 ) ) ( not ( = ?auto_782845 ?auto_782848 ) ) ( not ( = ?auto_782845 ?auto_782849 ) ) ( not ( = ?auto_782845 ?auto_782850 ) ) ( not ( = ?auto_782845 ?auto_782851 ) ) ( not ( = ?auto_782845 ?auto_782852 ) ) ( not ( = ?auto_782845 ?auto_782853 ) ) ( not ( = ?auto_782845 ?auto_782854 ) ) ( not ( = ?auto_782845 ?auto_782855 ) ) ( not ( = ?auto_782845 ?auto_782856 ) ) ( not ( = ?auto_782845 ?auto_782857 ) ) ( not ( = ?auto_782845 ?auto_782858 ) ) ( not ( = ?auto_782845 ?auto_782859 ) ) ( not ( = ?auto_782845 ?auto_782860 ) ) ( not ( = ?auto_782845 ?auto_782861 ) ) ( not ( = ?auto_782846 ?auto_782847 ) ) ( not ( = ?auto_782846 ?auto_782848 ) ) ( not ( = ?auto_782846 ?auto_782849 ) ) ( not ( = ?auto_782846 ?auto_782850 ) ) ( not ( = ?auto_782846 ?auto_782851 ) ) ( not ( = ?auto_782846 ?auto_782852 ) ) ( not ( = ?auto_782846 ?auto_782853 ) ) ( not ( = ?auto_782846 ?auto_782854 ) ) ( not ( = ?auto_782846 ?auto_782855 ) ) ( not ( = ?auto_782846 ?auto_782856 ) ) ( not ( = ?auto_782846 ?auto_782857 ) ) ( not ( = ?auto_782846 ?auto_782858 ) ) ( not ( = ?auto_782846 ?auto_782859 ) ) ( not ( = ?auto_782846 ?auto_782860 ) ) ( not ( = ?auto_782846 ?auto_782861 ) ) ( not ( = ?auto_782847 ?auto_782848 ) ) ( not ( = ?auto_782847 ?auto_782849 ) ) ( not ( = ?auto_782847 ?auto_782850 ) ) ( not ( = ?auto_782847 ?auto_782851 ) ) ( not ( = ?auto_782847 ?auto_782852 ) ) ( not ( = ?auto_782847 ?auto_782853 ) ) ( not ( = ?auto_782847 ?auto_782854 ) ) ( not ( = ?auto_782847 ?auto_782855 ) ) ( not ( = ?auto_782847 ?auto_782856 ) ) ( not ( = ?auto_782847 ?auto_782857 ) ) ( not ( = ?auto_782847 ?auto_782858 ) ) ( not ( = ?auto_782847 ?auto_782859 ) ) ( not ( = ?auto_782847 ?auto_782860 ) ) ( not ( = ?auto_782847 ?auto_782861 ) ) ( not ( = ?auto_782848 ?auto_782849 ) ) ( not ( = ?auto_782848 ?auto_782850 ) ) ( not ( = ?auto_782848 ?auto_782851 ) ) ( not ( = ?auto_782848 ?auto_782852 ) ) ( not ( = ?auto_782848 ?auto_782853 ) ) ( not ( = ?auto_782848 ?auto_782854 ) ) ( not ( = ?auto_782848 ?auto_782855 ) ) ( not ( = ?auto_782848 ?auto_782856 ) ) ( not ( = ?auto_782848 ?auto_782857 ) ) ( not ( = ?auto_782848 ?auto_782858 ) ) ( not ( = ?auto_782848 ?auto_782859 ) ) ( not ( = ?auto_782848 ?auto_782860 ) ) ( not ( = ?auto_782848 ?auto_782861 ) ) ( not ( = ?auto_782849 ?auto_782850 ) ) ( not ( = ?auto_782849 ?auto_782851 ) ) ( not ( = ?auto_782849 ?auto_782852 ) ) ( not ( = ?auto_782849 ?auto_782853 ) ) ( not ( = ?auto_782849 ?auto_782854 ) ) ( not ( = ?auto_782849 ?auto_782855 ) ) ( not ( = ?auto_782849 ?auto_782856 ) ) ( not ( = ?auto_782849 ?auto_782857 ) ) ( not ( = ?auto_782849 ?auto_782858 ) ) ( not ( = ?auto_782849 ?auto_782859 ) ) ( not ( = ?auto_782849 ?auto_782860 ) ) ( not ( = ?auto_782849 ?auto_782861 ) ) ( not ( = ?auto_782850 ?auto_782851 ) ) ( not ( = ?auto_782850 ?auto_782852 ) ) ( not ( = ?auto_782850 ?auto_782853 ) ) ( not ( = ?auto_782850 ?auto_782854 ) ) ( not ( = ?auto_782850 ?auto_782855 ) ) ( not ( = ?auto_782850 ?auto_782856 ) ) ( not ( = ?auto_782850 ?auto_782857 ) ) ( not ( = ?auto_782850 ?auto_782858 ) ) ( not ( = ?auto_782850 ?auto_782859 ) ) ( not ( = ?auto_782850 ?auto_782860 ) ) ( not ( = ?auto_782850 ?auto_782861 ) ) ( not ( = ?auto_782851 ?auto_782852 ) ) ( not ( = ?auto_782851 ?auto_782853 ) ) ( not ( = ?auto_782851 ?auto_782854 ) ) ( not ( = ?auto_782851 ?auto_782855 ) ) ( not ( = ?auto_782851 ?auto_782856 ) ) ( not ( = ?auto_782851 ?auto_782857 ) ) ( not ( = ?auto_782851 ?auto_782858 ) ) ( not ( = ?auto_782851 ?auto_782859 ) ) ( not ( = ?auto_782851 ?auto_782860 ) ) ( not ( = ?auto_782851 ?auto_782861 ) ) ( not ( = ?auto_782852 ?auto_782853 ) ) ( not ( = ?auto_782852 ?auto_782854 ) ) ( not ( = ?auto_782852 ?auto_782855 ) ) ( not ( = ?auto_782852 ?auto_782856 ) ) ( not ( = ?auto_782852 ?auto_782857 ) ) ( not ( = ?auto_782852 ?auto_782858 ) ) ( not ( = ?auto_782852 ?auto_782859 ) ) ( not ( = ?auto_782852 ?auto_782860 ) ) ( not ( = ?auto_782852 ?auto_782861 ) ) ( not ( = ?auto_782853 ?auto_782854 ) ) ( not ( = ?auto_782853 ?auto_782855 ) ) ( not ( = ?auto_782853 ?auto_782856 ) ) ( not ( = ?auto_782853 ?auto_782857 ) ) ( not ( = ?auto_782853 ?auto_782858 ) ) ( not ( = ?auto_782853 ?auto_782859 ) ) ( not ( = ?auto_782853 ?auto_782860 ) ) ( not ( = ?auto_782853 ?auto_782861 ) ) ( not ( = ?auto_782854 ?auto_782855 ) ) ( not ( = ?auto_782854 ?auto_782856 ) ) ( not ( = ?auto_782854 ?auto_782857 ) ) ( not ( = ?auto_782854 ?auto_782858 ) ) ( not ( = ?auto_782854 ?auto_782859 ) ) ( not ( = ?auto_782854 ?auto_782860 ) ) ( not ( = ?auto_782854 ?auto_782861 ) ) ( not ( = ?auto_782855 ?auto_782856 ) ) ( not ( = ?auto_782855 ?auto_782857 ) ) ( not ( = ?auto_782855 ?auto_782858 ) ) ( not ( = ?auto_782855 ?auto_782859 ) ) ( not ( = ?auto_782855 ?auto_782860 ) ) ( not ( = ?auto_782855 ?auto_782861 ) ) ( not ( = ?auto_782856 ?auto_782857 ) ) ( not ( = ?auto_782856 ?auto_782858 ) ) ( not ( = ?auto_782856 ?auto_782859 ) ) ( not ( = ?auto_782856 ?auto_782860 ) ) ( not ( = ?auto_782856 ?auto_782861 ) ) ( not ( = ?auto_782857 ?auto_782858 ) ) ( not ( = ?auto_782857 ?auto_782859 ) ) ( not ( = ?auto_782857 ?auto_782860 ) ) ( not ( = ?auto_782857 ?auto_782861 ) ) ( not ( = ?auto_782858 ?auto_782859 ) ) ( not ( = ?auto_782858 ?auto_782860 ) ) ( not ( = ?auto_782858 ?auto_782861 ) ) ( not ( = ?auto_782859 ?auto_782860 ) ) ( not ( = ?auto_782859 ?auto_782861 ) ) ( not ( = ?auto_782860 ?auto_782861 ) ) ( ON ?auto_782859 ?auto_782860 ) ( ON ?auto_782858 ?auto_782859 ) ( ON ?auto_782857 ?auto_782858 ) ( ON ?auto_782856 ?auto_782857 ) ( ON ?auto_782855 ?auto_782856 ) ( ON ?auto_782854 ?auto_782855 ) ( CLEAR ?auto_782852 ) ( ON ?auto_782853 ?auto_782854 ) ( CLEAR ?auto_782853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_782843 ?auto_782844 ?auto_782845 ?auto_782846 ?auto_782847 ?auto_782848 ?auto_782849 ?auto_782850 ?auto_782851 ?auto_782852 ?auto_782853 )
      ( MAKE-18PILE ?auto_782843 ?auto_782844 ?auto_782845 ?auto_782846 ?auto_782847 ?auto_782848 ?auto_782849 ?auto_782850 ?auto_782851 ?auto_782852 ?auto_782853 ?auto_782854 ?auto_782855 ?auto_782856 ?auto_782857 ?auto_782858 ?auto_782859 ?auto_782860 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_782880 - BLOCK
      ?auto_782881 - BLOCK
      ?auto_782882 - BLOCK
      ?auto_782883 - BLOCK
      ?auto_782884 - BLOCK
      ?auto_782885 - BLOCK
      ?auto_782886 - BLOCK
      ?auto_782887 - BLOCK
      ?auto_782888 - BLOCK
      ?auto_782889 - BLOCK
      ?auto_782890 - BLOCK
      ?auto_782891 - BLOCK
      ?auto_782892 - BLOCK
      ?auto_782893 - BLOCK
      ?auto_782894 - BLOCK
      ?auto_782895 - BLOCK
      ?auto_782896 - BLOCK
      ?auto_782897 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_782897 ) ( ON-TABLE ?auto_782880 ) ( ON ?auto_782881 ?auto_782880 ) ( ON ?auto_782882 ?auto_782881 ) ( ON ?auto_782883 ?auto_782882 ) ( ON ?auto_782884 ?auto_782883 ) ( ON ?auto_782885 ?auto_782884 ) ( ON ?auto_782886 ?auto_782885 ) ( ON ?auto_782887 ?auto_782886 ) ( ON ?auto_782888 ?auto_782887 ) ( ON ?auto_782889 ?auto_782888 ) ( not ( = ?auto_782880 ?auto_782881 ) ) ( not ( = ?auto_782880 ?auto_782882 ) ) ( not ( = ?auto_782880 ?auto_782883 ) ) ( not ( = ?auto_782880 ?auto_782884 ) ) ( not ( = ?auto_782880 ?auto_782885 ) ) ( not ( = ?auto_782880 ?auto_782886 ) ) ( not ( = ?auto_782880 ?auto_782887 ) ) ( not ( = ?auto_782880 ?auto_782888 ) ) ( not ( = ?auto_782880 ?auto_782889 ) ) ( not ( = ?auto_782880 ?auto_782890 ) ) ( not ( = ?auto_782880 ?auto_782891 ) ) ( not ( = ?auto_782880 ?auto_782892 ) ) ( not ( = ?auto_782880 ?auto_782893 ) ) ( not ( = ?auto_782880 ?auto_782894 ) ) ( not ( = ?auto_782880 ?auto_782895 ) ) ( not ( = ?auto_782880 ?auto_782896 ) ) ( not ( = ?auto_782880 ?auto_782897 ) ) ( not ( = ?auto_782881 ?auto_782882 ) ) ( not ( = ?auto_782881 ?auto_782883 ) ) ( not ( = ?auto_782881 ?auto_782884 ) ) ( not ( = ?auto_782881 ?auto_782885 ) ) ( not ( = ?auto_782881 ?auto_782886 ) ) ( not ( = ?auto_782881 ?auto_782887 ) ) ( not ( = ?auto_782881 ?auto_782888 ) ) ( not ( = ?auto_782881 ?auto_782889 ) ) ( not ( = ?auto_782881 ?auto_782890 ) ) ( not ( = ?auto_782881 ?auto_782891 ) ) ( not ( = ?auto_782881 ?auto_782892 ) ) ( not ( = ?auto_782881 ?auto_782893 ) ) ( not ( = ?auto_782881 ?auto_782894 ) ) ( not ( = ?auto_782881 ?auto_782895 ) ) ( not ( = ?auto_782881 ?auto_782896 ) ) ( not ( = ?auto_782881 ?auto_782897 ) ) ( not ( = ?auto_782882 ?auto_782883 ) ) ( not ( = ?auto_782882 ?auto_782884 ) ) ( not ( = ?auto_782882 ?auto_782885 ) ) ( not ( = ?auto_782882 ?auto_782886 ) ) ( not ( = ?auto_782882 ?auto_782887 ) ) ( not ( = ?auto_782882 ?auto_782888 ) ) ( not ( = ?auto_782882 ?auto_782889 ) ) ( not ( = ?auto_782882 ?auto_782890 ) ) ( not ( = ?auto_782882 ?auto_782891 ) ) ( not ( = ?auto_782882 ?auto_782892 ) ) ( not ( = ?auto_782882 ?auto_782893 ) ) ( not ( = ?auto_782882 ?auto_782894 ) ) ( not ( = ?auto_782882 ?auto_782895 ) ) ( not ( = ?auto_782882 ?auto_782896 ) ) ( not ( = ?auto_782882 ?auto_782897 ) ) ( not ( = ?auto_782883 ?auto_782884 ) ) ( not ( = ?auto_782883 ?auto_782885 ) ) ( not ( = ?auto_782883 ?auto_782886 ) ) ( not ( = ?auto_782883 ?auto_782887 ) ) ( not ( = ?auto_782883 ?auto_782888 ) ) ( not ( = ?auto_782883 ?auto_782889 ) ) ( not ( = ?auto_782883 ?auto_782890 ) ) ( not ( = ?auto_782883 ?auto_782891 ) ) ( not ( = ?auto_782883 ?auto_782892 ) ) ( not ( = ?auto_782883 ?auto_782893 ) ) ( not ( = ?auto_782883 ?auto_782894 ) ) ( not ( = ?auto_782883 ?auto_782895 ) ) ( not ( = ?auto_782883 ?auto_782896 ) ) ( not ( = ?auto_782883 ?auto_782897 ) ) ( not ( = ?auto_782884 ?auto_782885 ) ) ( not ( = ?auto_782884 ?auto_782886 ) ) ( not ( = ?auto_782884 ?auto_782887 ) ) ( not ( = ?auto_782884 ?auto_782888 ) ) ( not ( = ?auto_782884 ?auto_782889 ) ) ( not ( = ?auto_782884 ?auto_782890 ) ) ( not ( = ?auto_782884 ?auto_782891 ) ) ( not ( = ?auto_782884 ?auto_782892 ) ) ( not ( = ?auto_782884 ?auto_782893 ) ) ( not ( = ?auto_782884 ?auto_782894 ) ) ( not ( = ?auto_782884 ?auto_782895 ) ) ( not ( = ?auto_782884 ?auto_782896 ) ) ( not ( = ?auto_782884 ?auto_782897 ) ) ( not ( = ?auto_782885 ?auto_782886 ) ) ( not ( = ?auto_782885 ?auto_782887 ) ) ( not ( = ?auto_782885 ?auto_782888 ) ) ( not ( = ?auto_782885 ?auto_782889 ) ) ( not ( = ?auto_782885 ?auto_782890 ) ) ( not ( = ?auto_782885 ?auto_782891 ) ) ( not ( = ?auto_782885 ?auto_782892 ) ) ( not ( = ?auto_782885 ?auto_782893 ) ) ( not ( = ?auto_782885 ?auto_782894 ) ) ( not ( = ?auto_782885 ?auto_782895 ) ) ( not ( = ?auto_782885 ?auto_782896 ) ) ( not ( = ?auto_782885 ?auto_782897 ) ) ( not ( = ?auto_782886 ?auto_782887 ) ) ( not ( = ?auto_782886 ?auto_782888 ) ) ( not ( = ?auto_782886 ?auto_782889 ) ) ( not ( = ?auto_782886 ?auto_782890 ) ) ( not ( = ?auto_782886 ?auto_782891 ) ) ( not ( = ?auto_782886 ?auto_782892 ) ) ( not ( = ?auto_782886 ?auto_782893 ) ) ( not ( = ?auto_782886 ?auto_782894 ) ) ( not ( = ?auto_782886 ?auto_782895 ) ) ( not ( = ?auto_782886 ?auto_782896 ) ) ( not ( = ?auto_782886 ?auto_782897 ) ) ( not ( = ?auto_782887 ?auto_782888 ) ) ( not ( = ?auto_782887 ?auto_782889 ) ) ( not ( = ?auto_782887 ?auto_782890 ) ) ( not ( = ?auto_782887 ?auto_782891 ) ) ( not ( = ?auto_782887 ?auto_782892 ) ) ( not ( = ?auto_782887 ?auto_782893 ) ) ( not ( = ?auto_782887 ?auto_782894 ) ) ( not ( = ?auto_782887 ?auto_782895 ) ) ( not ( = ?auto_782887 ?auto_782896 ) ) ( not ( = ?auto_782887 ?auto_782897 ) ) ( not ( = ?auto_782888 ?auto_782889 ) ) ( not ( = ?auto_782888 ?auto_782890 ) ) ( not ( = ?auto_782888 ?auto_782891 ) ) ( not ( = ?auto_782888 ?auto_782892 ) ) ( not ( = ?auto_782888 ?auto_782893 ) ) ( not ( = ?auto_782888 ?auto_782894 ) ) ( not ( = ?auto_782888 ?auto_782895 ) ) ( not ( = ?auto_782888 ?auto_782896 ) ) ( not ( = ?auto_782888 ?auto_782897 ) ) ( not ( = ?auto_782889 ?auto_782890 ) ) ( not ( = ?auto_782889 ?auto_782891 ) ) ( not ( = ?auto_782889 ?auto_782892 ) ) ( not ( = ?auto_782889 ?auto_782893 ) ) ( not ( = ?auto_782889 ?auto_782894 ) ) ( not ( = ?auto_782889 ?auto_782895 ) ) ( not ( = ?auto_782889 ?auto_782896 ) ) ( not ( = ?auto_782889 ?auto_782897 ) ) ( not ( = ?auto_782890 ?auto_782891 ) ) ( not ( = ?auto_782890 ?auto_782892 ) ) ( not ( = ?auto_782890 ?auto_782893 ) ) ( not ( = ?auto_782890 ?auto_782894 ) ) ( not ( = ?auto_782890 ?auto_782895 ) ) ( not ( = ?auto_782890 ?auto_782896 ) ) ( not ( = ?auto_782890 ?auto_782897 ) ) ( not ( = ?auto_782891 ?auto_782892 ) ) ( not ( = ?auto_782891 ?auto_782893 ) ) ( not ( = ?auto_782891 ?auto_782894 ) ) ( not ( = ?auto_782891 ?auto_782895 ) ) ( not ( = ?auto_782891 ?auto_782896 ) ) ( not ( = ?auto_782891 ?auto_782897 ) ) ( not ( = ?auto_782892 ?auto_782893 ) ) ( not ( = ?auto_782892 ?auto_782894 ) ) ( not ( = ?auto_782892 ?auto_782895 ) ) ( not ( = ?auto_782892 ?auto_782896 ) ) ( not ( = ?auto_782892 ?auto_782897 ) ) ( not ( = ?auto_782893 ?auto_782894 ) ) ( not ( = ?auto_782893 ?auto_782895 ) ) ( not ( = ?auto_782893 ?auto_782896 ) ) ( not ( = ?auto_782893 ?auto_782897 ) ) ( not ( = ?auto_782894 ?auto_782895 ) ) ( not ( = ?auto_782894 ?auto_782896 ) ) ( not ( = ?auto_782894 ?auto_782897 ) ) ( not ( = ?auto_782895 ?auto_782896 ) ) ( not ( = ?auto_782895 ?auto_782897 ) ) ( not ( = ?auto_782896 ?auto_782897 ) ) ( ON ?auto_782896 ?auto_782897 ) ( ON ?auto_782895 ?auto_782896 ) ( ON ?auto_782894 ?auto_782895 ) ( ON ?auto_782893 ?auto_782894 ) ( ON ?auto_782892 ?auto_782893 ) ( ON ?auto_782891 ?auto_782892 ) ( CLEAR ?auto_782889 ) ( ON ?auto_782890 ?auto_782891 ) ( CLEAR ?auto_782890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_782880 ?auto_782881 ?auto_782882 ?auto_782883 ?auto_782884 ?auto_782885 ?auto_782886 ?auto_782887 ?auto_782888 ?auto_782889 ?auto_782890 )
      ( MAKE-18PILE ?auto_782880 ?auto_782881 ?auto_782882 ?auto_782883 ?auto_782884 ?auto_782885 ?auto_782886 ?auto_782887 ?auto_782888 ?auto_782889 ?auto_782890 ?auto_782891 ?auto_782892 ?auto_782893 ?auto_782894 ?auto_782895 ?auto_782896 ?auto_782897 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_782916 - BLOCK
      ?auto_782917 - BLOCK
      ?auto_782918 - BLOCK
      ?auto_782919 - BLOCK
      ?auto_782920 - BLOCK
      ?auto_782921 - BLOCK
      ?auto_782922 - BLOCK
      ?auto_782923 - BLOCK
      ?auto_782924 - BLOCK
      ?auto_782925 - BLOCK
      ?auto_782926 - BLOCK
      ?auto_782927 - BLOCK
      ?auto_782928 - BLOCK
      ?auto_782929 - BLOCK
      ?auto_782930 - BLOCK
      ?auto_782931 - BLOCK
      ?auto_782932 - BLOCK
      ?auto_782933 - BLOCK
    )
    :vars
    (
      ?auto_782934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_782933 ?auto_782934 ) ( ON-TABLE ?auto_782916 ) ( ON ?auto_782917 ?auto_782916 ) ( ON ?auto_782918 ?auto_782917 ) ( ON ?auto_782919 ?auto_782918 ) ( ON ?auto_782920 ?auto_782919 ) ( ON ?auto_782921 ?auto_782920 ) ( ON ?auto_782922 ?auto_782921 ) ( ON ?auto_782923 ?auto_782922 ) ( ON ?auto_782924 ?auto_782923 ) ( not ( = ?auto_782916 ?auto_782917 ) ) ( not ( = ?auto_782916 ?auto_782918 ) ) ( not ( = ?auto_782916 ?auto_782919 ) ) ( not ( = ?auto_782916 ?auto_782920 ) ) ( not ( = ?auto_782916 ?auto_782921 ) ) ( not ( = ?auto_782916 ?auto_782922 ) ) ( not ( = ?auto_782916 ?auto_782923 ) ) ( not ( = ?auto_782916 ?auto_782924 ) ) ( not ( = ?auto_782916 ?auto_782925 ) ) ( not ( = ?auto_782916 ?auto_782926 ) ) ( not ( = ?auto_782916 ?auto_782927 ) ) ( not ( = ?auto_782916 ?auto_782928 ) ) ( not ( = ?auto_782916 ?auto_782929 ) ) ( not ( = ?auto_782916 ?auto_782930 ) ) ( not ( = ?auto_782916 ?auto_782931 ) ) ( not ( = ?auto_782916 ?auto_782932 ) ) ( not ( = ?auto_782916 ?auto_782933 ) ) ( not ( = ?auto_782916 ?auto_782934 ) ) ( not ( = ?auto_782917 ?auto_782918 ) ) ( not ( = ?auto_782917 ?auto_782919 ) ) ( not ( = ?auto_782917 ?auto_782920 ) ) ( not ( = ?auto_782917 ?auto_782921 ) ) ( not ( = ?auto_782917 ?auto_782922 ) ) ( not ( = ?auto_782917 ?auto_782923 ) ) ( not ( = ?auto_782917 ?auto_782924 ) ) ( not ( = ?auto_782917 ?auto_782925 ) ) ( not ( = ?auto_782917 ?auto_782926 ) ) ( not ( = ?auto_782917 ?auto_782927 ) ) ( not ( = ?auto_782917 ?auto_782928 ) ) ( not ( = ?auto_782917 ?auto_782929 ) ) ( not ( = ?auto_782917 ?auto_782930 ) ) ( not ( = ?auto_782917 ?auto_782931 ) ) ( not ( = ?auto_782917 ?auto_782932 ) ) ( not ( = ?auto_782917 ?auto_782933 ) ) ( not ( = ?auto_782917 ?auto_782934 ) ) ( not ( = ?auto_782918 ?auto_782919 ) ) ( not ( = ?auto_782918 ?auto_782920 ) ) ( not ( = ?auto_782918 ?auto_782921 ) ) ( not ( = ?auto_782918 ?auto_782922 ) ) ( not ( = ?auto_782918 ?auto_782923 ) ) ( not ( = ?auto_782918 ?auto_782924 ) ) ( not ( = ?auto_782918 ?auto_782925 ) ) ( not ( = ?auto_782918 ?auto_782926 ) ) ( not ( = ?auto_782918 ?auto_782927 ) ) ( not ( = ?auto_782918 ?auto_782928 ) ) ( not ( = ?auto_782918 ?auto_782929 ) ) ( not ( = ?auto_782918 ?auto_782930 ) ) ( not ( = ?auto_782918 ?auto_782931 ) ) ( not ( = ?auto_782918 ?auto_782932 ) ) ( not ( = ?auto_782918 ?auto_782933 ) ) ( not ( = ?auto_782918 ?auto_782934 ) ) ( not ( = ?auto_782919 ?auto_782920 ) ) ( not ( = ?auto_782919 ?auto_782921 ) ) ( not ( = ?auto_782919 ?auto_782922 ) ) ( not ( = ?auto_782919 ?auto_782923 ) ) ( not ( = ?auto_782919 ?auto_782924 ) ) ( not ( = ?auto_782919 ?auto_782925 ) ) ( not ( = ?auto_782919 ?auto_782926 ) ) ( not ( = ?auto_782919 ?auto_782927 ) ) ( not ( = ?auto_782919 ?auto_782928 ) ) ( not ( = ?auto_782919 ?auto_782929 ) ) ( not ( = ?auto_782919 ?auto_782930 ) ) ( not ( = ?auto_782919 ?auto_782931 ) ) ( not ( = ?auto_782919 ?auto_782932 ) ) ( not ( = ?auto_782919 ?auto_782933 ) ) ( not ( = ?auto_782919 ?auto_782934 ) ) ( not ( = ?auto_782920 ?auto_782921 ) ) ( not ( = ?auto_782920 ?auto_782922 ) ) ( not ( = ?auto_782920 ?auto_782923 ) ) ( not ( = ?auto_782920 ?auto_782924 ) ) ( not ( = ?auto_782920 ?auto_782925 ) ) ( not ( = ?auto_782920 ?auto_782926 ) ) ( not ( = ?auto_782920 ?auto_782927 ) ) ( not ( = ?auto_782920 ?auto_782928 ) ) ( not ( = ?auto_782920 ?auto_782929 ) ) ( not ( = ?auto_782920 ?auto_782930 ) ) ( not ( = ?auto_782920 ?auto_782931 ) ) ( not ( = ?auto_782920 ?auto_782932 ) ) ( not ( = ?auto_782920 ?auto_782933 ) ) ( not ( = ?auto_782920 ?auto_782934 ) ) ( not ( = ?auto_782921 ?auto_782922 ) ) ( not ( = ?auto_782921 ?auto_782923 ) ) ( not ( = ?auto_782921 ?auto_782924 ) ) ( not ( = ?auto_782921 ?auto_782925 ) ) ( not ( = ?auto_782921 ?auto_782926 ) ) ( not ( = ?auto_782921 ?auto_782927 ) ) ( not ( = ?auto_782921 ?auto_782928 ) ) ( not ( = ?auto_782921 ?auto_782929 ) ) ( not ( = ?auto_782921 ?auto_782930 ) ) ( not ( = ?auto_782921 ?auto_782931 ) ) ( not ( = ?auto_782921 ?auto_782932 ) ) ( not ( = ?auto_782921 ?auto_782933 ) ) ( not ( = ?auto_782921 ?auto_782934 ) ) ( not ( = ?auto_782922 ?auto_782923 ) ) ( not ( = ?auto_782922 ?auto_782924 ) ) ( not ( = ?auto_782922 ?auto_782925 ) ) ( not ( = ?auto_782922 ?auto_782926 ) ) ( not ( = ?auto_782922 ?auto_782927 ) ) ( not ( = ?auto_782922 ?auto_782928 ) ) ( not ( = ?auto_782922 ?auto_782929 ) ) ( not ( = ?auto_782922 ?auto_782930 ) ) ( not ( = ?auto_782922 ?auto_782931 ) ) ( not ( = ?auto_782922 ?auto_782932 ) ) ( not ( = ?auto_782922 ?auto_782933 ) ) ( not ( = ?auto_782922 ?auto_782934 ) ) ( not ( = ?auto_782923 ?auto_782924 ) ) ( not ( = ?auto_782923 ?auto_782925 ) ) ( not ( = ?auto_782923 ?auto_782926 ) ) ( not ( = ?auto_782923 ?auto_782927 ) ) ( not ( = ?auto_782923 ?auto_782928 ) ) ( not ( = ?auto_782923 ?auto_782929 ) ) ( not ( = ?auto_782923 ?auto_782930 ) ) ( not ( = ?auto_782923 ?auto_782931 ) ) ( not ( = ?auto_782923 ?auto_782932 ) ) ( not ( = ?auto_782923 ?auto_782933 ) ) ( not ( = ?auto_782923 ?auto_782934 ) ) ( not ( = ?auto_782924 ?auto_782925 ) ) ( not ( = ?auto_782924 ?auto_782926 ) ) ( not ( = ?auto_782924 ?auto_782927 ) ) ( not ( = ?auto_782924 ?auto_782928 ) ) ( not ( = ?auto_782924 ?auto_782929 ) ) ( not ( = ?auto_782924 ?auto_782930 ) ) ( not ( = ?auto_782924 ?auto_782931 ) ) ( not ( = ?auto_782924 ?auto_782932 ) ) ( not ( = ?auto_782924 ?auto_782933 ) ) ( not ( = ?auto_782924 ?auto_782934 ) ) ( not ( = ?auto_782925 ?auto_782926 ) ) ( not ( = ?auto_782925 ?auto_782927 ) ) ( not ( = ?auto_782925 ?auto_782928 ) ) ( not ( = ?auto_782925 ?auto_782929 ) ) ( not ( = ?auto_782925 ?auto_782930 ) ) ( not ( = ?auto_782925 ?auto_782931 ) ) ( not ( = ?auto_782925 ?auto_782932 ) ) ( not ( = ?auto_782925 ?auto_782933 ) ) ( not ( = ?auto_782925 ?auto_782934 ) ) ( not ( = ?auto_782926 ?auto_782927 ) ) ( not ( = ?auto_782926 ?auto_782928 ) ) ( not ( = ?auto_782926 ?auto_782929 ) ) ( not ( = ?auto_782926 ?auto_782930 ) ) ( not ( = ?auto_782926 ?auto_782931 ) ) ( not ( = ?auto_782926 ?auto_782932 ) ) ( not ( = ?auto_782926 ?auto_782933 ) ) ( not ( = ?auto_782926 ?auto_782934 ) ) ( not ( = ?auto_782927 ?auto_782928 ) ) ( not ( = ?auto_782927 ?auto_782929 ) ) ( not ( = ?auto_782927 ?auto_782930 ) ) ( not ( = ?auto_782927 ?auto_782931 ) ) ( not ( = ?auto_782927 ?auto_782932 ) ) ( not ( = ?auto_782927 ?auto_782933 ) ) ( not ( = ?auto_782927 ?auto_782934 ) ) ( not ( = ?auto_782928 ?auto_782929 ) ) ( not ( = ?auto_782928 ?auto_782930 ) ) ( not ( = ?auto_782928 ?auto_782931 ) ) ( not ( = ?auto_782928 ?auto_782932 ) ) ( not ( = ?auto_782928 ?auto_782933 ) ) ( not ( = ?auto_782928 ?auto_782934 ) ) ( not ( = ?auto_782929 ?auto_782930 ) ) ( not ( = ?auto_782929 ?auto_782931 ) ) ( not ( = ?auto_782929 ?auto_782932 ) ) ( not ( = ?auto_782929 ?auto_782933 ) ) ( not ( = ?auto_782929 ?auto_782934 ) ) ( not ( = ?auto_782930 ?auto_782931 ) ) ( not ( = ?auto_782930 ?auto_782932 ) ) ( not ( = ?auto_782930 ?auto_782933 ) ) ( not ( = ?auto_782930 ?auto_782934 ) ) ( not ( = ?auto_782931 ?auto_782932 ) ) ( not ( = ?auto_782931 ?auto_782933 ) ) ( not ( = ?auto_782931 ?auto_782934 ) ) ( not ( = ?auto_782932 ?auto_782933 ) ) ( not ( = ?auto_782932 ?auto_782934 ) ) ( not ( = ?auto_782933 ?auto_782934 ) ) ( ON ?auto_782932 ?auto_782933 ) ( ON ?auto_782931 ?auto_782932 ) ( ON ?auto_782930 ?auto_782931 ) ( ON ?auto_782929 ?auto_782930 ) ( ON ?auto_782928 ?auto_782929 ) ( ON ?auto_782927 ?auto_782928 ) ( ON ?auto_782926 ?auto_782927 ) ( CLEAR ?auto_782924 ) ( ON ?auto_782925 ?auto_782926 ) ( CLEAR ?auto_782925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_782916 ?auto_782917 ?auto_782918 ?auto_782919 ?auto_782920 ?auto_782921 ?auto_782922 ?auto_782923 ?auto_782924 ?auto_782925 )
      ( MAKE-18PILE ?auto_782916 ?auto_782917 ?auto_782918 ?auto_782919 ?auto_782920 ?auto_782921 ?auto_782922 ?auto_782923 ?auto_782924 ?auto_782925 ?auto_782926 ?auto_782927 ?auto_782928 ?auto_782929 ?auto_782930 ?auto_782931 ?auto_782932 ?auto_782933 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_782953 - BLOCK
      ?auto_782954 - BLOCK
      ?auto_782955 - BLOCK
      ?auto_782956 - BLOCK
      ?auto_782957 - BLOCK
      ?auto_782958 - BLOCK
      ?auto_782959 - BLOCK
      ?auto_782960 - BLOCK
      ?auto_782961 - BLOCK
      ?auto_782962 - BLOCK
      ?auto_782963 - BLOCK
      ?auto_782964 - BLOCK
      ?auto_782965 - BLOCK
      ?auto_782966 - BLOCK
      ?auto_782967 - BLOCK
      ?auto_782968 - BLOCK
      ?auto_782969 - BLOCK
      ?auto_782970 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_782970 ) ( ON-TABLE ?auto_782953 ) ( ON ?auto_782954 ?auto_782953 ) ( ON ?auto_782955 ?auto_782954 ) ( ON ?auto_782956 ?auto_782955 ) ( ON ?auto_782957 ?auto_782956 ) ( ON ?auto_782958 ?auto_782957 ) ( ON ?auto_782959 ?auto_782958 ) ( ON ?auto_782960 ?auto_782959 ) ( ON ?auto_782961 ?auto_782960 ) ( not ( = ?auto_782953 ?auto_782954 ) ) ( not ( = ?auto_782953 ?auto_782955 ) ) ( not ( = ?auto_782953 ?auto_782956 ) ) ( not ( = ?auto_782953 ?auto_782957 ) ) ( not ( = ?auto_782953 ?auto_782958 ) ) ( not ( = ?auto_782953 ?auto_782959 ) ) ( not ( = ?auto_782953 ?auto_782960 ) ) ( not ( = ?auto_782953 ?auto_782961 ) ) ( not ( = ?auto_782953 ?auto_782962 ) ) ( not ( = ?auto_782953 ?auto_782963 ) ) ( not ( = ?auto_782953 ?auto_782964 ) ) ( not ( = ?auto_782953 ?auto_782965 ) ) ( not ( = ?auto_782953 ?auto_782966 ) ) ( not ( = ?auto_782953 ?auto_782967 ) ) ( not ( = ?auto_782953 ?auto_782968 ) ) ( not ( = ?auto_782953 ?auto_782969 ) ) ( not ( = ?auto_782953 ?auto_782970 ) ) ( not ( = ?auto_782954 ?auto_782955 ) ) ( not ( = ?auto_782954 ?auto_782956 ) ) ( not ( = ?auto_782954 ?auto_782957 ) ) ( not ( = ?auto_782954 ?auto_782958 ) ) ( not ( = ?auto_782954 ?auto_782959 ) ) ( not ( = ?auto_782954 ?auto_782960 ) ) ( not ( = ?auto_782954 ?auto_782961 ) ) ( not ( = ?auto_782954 ?auto_782962 ) ) ( not ( = ?auto_782954 ?auto_782963 ) ) ( not ( = ?auto_782954 ?auto_782964 ) ) ( not ( = ?auto_782954 ?auto_782965 ) ) ( not ( = ?auto_782954 ?auto_782966 ) ) ( not ( = ?auto_782954 ?auto_782967 ) ) ( not ( = ?auto_782954 ?auto_782968 ) ) ( not ( = ?auto_782954 ?auto_782969 ) ) ( not ( = ?auto_782954 ?auto_782970 ) ) ( not ( = ?auto_782955 ?auto_782956 ) ) ( not ( = ?auto_782955 ?auto_782957 ) ) ( not ( = ?auto_782955 ?auto_782958 ) ) ( not ( = ?auto_782955 ?auto_782959 ) ) ( not ( = ?auto_782955 ?auto_782960 ) ) ( not ( = ?auto_782955 ?auto_782961 ) ) ( not ( = ?auto_782955 ?auto_782962 ) ) ( not ( = ?auto_782955 ?auto_782963 ) ) ( not ( = ?auto_782955 ?auto_782964 ) ) ( not ( = ?auto_782955 ?auto_782965 ) ) ( not ( = ?auto_782955 ?auto_782966 ) ) ( not ( = ?auto_782955 ?auto_782967 ) ) ( not ( = ?auto_782955 ?auto_782968 ) ) ( not ( = ?auto_782955 ?auto_782969 ) ) ( not ( = ?auto_782955 ?auto_782970 ) ) ( not ( = ?auto_782956 ?auto_782957 ) ) ( not ( = ?auto_782956 ?auto_782958 ) ) ( not ( = ?auto_782956 ?auto_782959 ) ) ( not ( = ?auto_782956 ?auto_782960 ) ) ( not ( = ?auto_782956 ?auto_782961 ) ) ( not ( = ?auto_782956 ?auto_782962 ) ) ( not ( = ?auto_782956 ?auto_782963 ) ) ( not ( = ?auto_782956 ?auto_782964 ) ) ( not ( = ?auto_782956 ?auto_782965 ) ) ( not ( = ?auto_782956 ?auto_782966 ) ) ( not ( = ?auto_782956 ?auto_782967 ) ) ( not ( = ?auto_782956 ?auto_782968 ) ) ( not ( = ?auto_782956 ?auto_782969 ) ) ( not ( = ?auto_782956 ?auto_782970 ) ) ( not ( = ?auto_782957 ?auto_782958 ) ) ( not ( = ?auto_782957 ?auto_782959 ) ) ( not ( = ?auto_782957 ?auto_782960 ) ) ( not ( = ?auto_782957 ?auto_782961 ) ) ( not ( = ?auto_782957 ?auto_782962 ) ) ( not ( = ?auto_782957 ?auto_782963 ) ) ( not ( = ?auto_782957 ?auto_782964 ) ) ( not ( = ?auto_782957 ?auto_782965 ) ) ( not ( = ?auto_782957 ?auto_782966 ) ) ( not ( = ?auto_782957 ?auto_782967 ) ) ( not ( = ?auto_782957 ?auto_782968 ) ) ( not ( = ?auto_782957 ?auto_782969 ) ) ( not ( = ?auto_782957 ?auto_782970 ) ) ( not ( = ?auto_782958 ?auto_782959 ) ) ( not ( = ?auto_782958 ?auto_782960 ) ) ( not ( = ?auto_782958 ?auto_782961 ) ) ( not ( = ?auto_782958 ?auto_782962 ) ) ( not ( = ?auto_782958 ?auto_782963 ) ) ( not ( = ?auto_782958 ?auto_782964 ) ) ( not ( = ?auto_782958 ?auto_782965 ) ) ( not ( = ?auto_782958 ?auto_782966 ) ) ( not ( = ?auto_782958 ?auto_782967 ) ) ( not ( = ?auto_782958 ?auto_782968 ) ) ( not ( = ?auto_782958 ?auto_782969 ) ) ( not ( = ?auto_782958 ?auto_782970 ) ) ( not ( = ?auto_782959 ?auto_782960 ) ) ( not ( = ?auto_782959 ?auto_782961 ) ) ( not ( = ?auto_782959 ?auto_782962 ) ) ( not ( = ?auto_782959 ?auto_782963 ) ) ( not ( = ?auto_782959 ?auto_782964 ) ) ( not ( = ?auto_782959 ?auto_782965 ) ) ( not ( = ?auto_782959 ?auto_782966 ) ) ( not ( = ?auto_782959 ?auto_782967 ) ) ( not ( = ?auto_782959 ?auto_782968 ) ) ( not ( = ?auto_782959 ?auto_782969 ) ) ( not ( = ?auto_782959 ?auto_782970 ) ) ( not ( = ?auto_782960 ?auto_782961 ) ) ( not ( = ?auto_782960 ?auto_782962 ) ) ( not ( = ?auto_782960 ?auto_782963 ) ) ( not ( = ?auto_782960 ?auto_782964 ) ) ( not ( = ?auto_782960 ?auto_782965 ) ) ( not ( = ?auto_782960 ?auto_782966 ) ) ( not ( = ?auto_782960 ?auto_782967 ) ) ( not ( = ?auto_782960 ?auto_782968 ) ) ( not ( = ?auto_782960 ?auto_782969 ) ) ( not ( = ?auto_782960 ?auto_782970 ) ) ( not ( = ?auto_782961 ?auto_782962 ) ) ( not ( = ?auto_782961 ?auto_782963 ) ) ( not ( = ?auto_782961 ?auto_782964 ) ) ( not ( = ?auto_782961 ?auto_782965 ) ) ( not ( = ?auto_782961 ?auto_782966 ) ) ( not ( = ?auto_782961 ?auto_782967 ) ) ( not ( = ?auto_782961 ?auto_782968 ) ) ( not ( = ?auto_782961 ?auto_782969 ) ) ( not ( = ?auto_782961 ?auto_782970 ) ) ( not ( = ?auto_782962 ?auto_782963 ) ) ( not ( = ?auto_782962 ?auto_782964 ) ) ( not ( = ?auto_782962 ?auto_782965 ) ) ( not ( = ?auto_782962 ?auto_782966 ) ) ( not ( = ?auto_782962 ?auto_782967 ) ) ( not ( = ?auto_782962 ?auto_782968 ) ) ( not ( = ?auto_782962 ?auto_782969 ) ) ( not ( = ?auto_782962 ?auto_782970 ) ) ( not ( = ?auto_782963 ?auto_782964 ) ) ( not ( = ?auto_782963 ?auto_782965 ) ) ( not ( = ?auto_782963 ?auto_782966 ) ) ( not ( = ?auto_782963 ?auto_782967 ) ) ( not ( = ?auto_782963 ?auto_782968 ) ) ( not ( = ?auto_782963 ?auto_782969 ) ) ( not ( = ?auto_782963 ?auto_782970 ) ) ( not ( = ?auto_782964 ?auto_782965 ) ) ( not ( = ?auto_782964 ?auto_782966 ) ) ( not ( = ?auto_782964 ?auto_782967 ) ) ( not ( = ?auto_782964 ?auto_782968 ) ) ( not ( = ?auto_782964 ?auto_782969 ) ) ( not ( = ?auto_782964 ?auto_782970 ) ) ( not ( = ?auto_782965 ?auto_782966 ) ) ( not ( = ?auto_782965 ?auto_782967 ) ) ( not ( = ?auto_782965 ?auto_782968 ) ) ( not ( = ?auto_782965 ?auto_782969 ) ) ( not ( = ?auto_782965 ?auto_782970 ) ) ( not ( = ?auto_782966 ?auto_782967 ) ) ( not ( = ?auto_782966 ?auto_782968 ) ) ( not ( = ?auto_782966 ?auto_782969 ) ) ( not ( = ?auto_782966 ?auto_782970 ) ) ( not ( = ?auto_782967 ?auto_782968 ) ) ( not ( = ?auto_782967 ?auto_782969 ) ) ( not ( = ?auto_782967 ?auto_782970 ) ) ( not ( = ?auto_782968 ?auto_782969 ) ) ( not ( = ?auto_782968 ?auto_782970 ) ) ( not ( = ?auto_782969 ?auto_782970 ) ) ( ON ?auto_782969 ?auto_782970 ) ( ON ?auto_782968 ?auto_782969 ) ( ON ?auto_782967 ?auto_782968 ) ( ON ?auto_782966 ?auto_782967 ) ( ON ?auto_782965 ?auto_782966 ) ( ON ?auto_782964 ?auto_782965 ) ( ON ?auto_782963 ?auto_782964 ) ( CLEAR ?auto_782961 ) ( ON ?auto_782962 ?auto_782963 ) ( CLEAR ?auto_782962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_782953 ?auto_782954 ?auto_782955 ?auto_782956 ?auto_782957 ?auto_782958 ?auto_782959 ?auto_782960 ?auto_782961 ?auto_782962 )
      ( MAKE-18PILE ?auto_782953 ?auto_782954 ?auto_782955 ?auto_782956 ?auto_782957 ?auto_782958 ?auto_782959 ?auto_782960 ?auto_782961 ?auto_782962 ?auto_782963 ?auto_782964 ?auto_782965 ?auto_782966 ?auto_782967 ?auto_782968 ?auto_782969 ?auto_782970 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_782989 - BLOCK
      ?auto_782990 - BLOCK
      ?auto_782991 - BLOCK
      ?auto_782992 - BLOCK
      ?auto_782993 - BLOCK
      ?auto_782994 - BLOCK
      ?auto_782995 - BLOCK
      ?auto_782996 - BLOCK
      ?auto_782997 - BLOCK
      ?auto_782998 - BLOCK
      ?auto_782999 - BLOCK
      ?auto_783000 - BLOCK
      ?auto_783001 - BLOCK
      ?auto_783002 - BLOCK
      ?auto_783003 - BLOCK
      ?auto_783004 - BLOCK
      ?auto_783005 - BLOCK
      ?auto_783006 - BLOCK
    )
    :vars
    (
      ?auto_783007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_783006 ?auto_783007 ) ( ON-TABLE ?auto_782989 ) ( ON ?auto_782990 ?auto_782989 ) ( ON ?auto_782991 ?auto_782990 ) ( ON ?auto_782992 ?auto_782991 ) ( ON ?auto_782993 ?auto_782992 ) ( ON ?auto_782994 ?auto_782993 ) ( ON ?auto_782995 ?auto_782994 ) ( ON ?auto_782996 ?auto_782995 ) ( not ( = ?auto_782989 ?auto_782990 ) ) ( not ( = ?auto_782989 ?auto_782991 ) ) ( not ( = ?auto_782989 ?auto_782992 ) ) ( not ( = ?auto_782989 ?auto_782993 ) ) ( not ( = ?auto_782989 ?auto_782994 ) ) ( not ( = ?auto_782989 ?auto_782995 ) ) ( not ( = ?auto_782989 ?auto_782996 ) ) ( not ( = ?auto_782989 ?auto_782997 ) ) ( not ( = ?auto_782989 ?auto_782998 ) ) ( not ( = ?auto_782989 ?auto_782999 ) ) ( not ( = ?auto_782989 ?auto_783000 ) ) ( not ( = ?auto_782989 ?auto_783001 ) ) ( not ( = ?auto_782989 ?auto_783002 ) ) ( not ( = ?auto_782989 ?auto_783003 ) ) ( not ( = ?auto_782989 ?auto_783004 ) ) ( not ( = ?auto_782989 ?auto_783005 ) ) ( not ( = ?auto_782989 ?auto_783006 ) ) ( not ( = ?auto_782989 ?auto_783007 ) ) ( not ( = ?auto_782990 ?auto_782991 ) ) ( not ( = ?auto_782990 ?auto_782992 ) ) ( not ( = ?auto_782990 ?auto_782993 ) ) ( not ( = ?auto_782990 ?auto_782994 ) ) ( not ( = ?auto_782990 ?auto_782995 ) ) ( not ( = ?auto_782990 ?auto_782996 ) ) ( not ( = ?auto_782990 ?auto_782997 ) ) ( not ( = ?auto_782990 ?auto_782998 ) ) ( not ( = ?auto_782990 ?auto_782999 ) ) ( not ( = ?auto_782990 ?auto_783000 ) ) ( not ( = ?auto_782990 ?auto_783001 ) ) ( not ( = ?auto_782990 ?auto_783002 ) ) ( not ( = ?auto_782990 ?auto_783003 ) ) ( not ( = ?auto_782990 ?auto_783004 ) ) ( not ( = ?auto_782990 ?auto_783005 ) ) ( not ( = ?auto_782990 ?auto_783006 ) ) ( not ( = ?auto_782990 ?auto_783007 ) ) ( not ( = ?auto_782991 ?auto_782992 ) ) ( not ( = ?auto_782991 ?auto_782993 ) ) ( not ( = ?auto_782991 ?auto_782994 ) ) ( not ( = ?auto_782991 ?auto_782995 ) ) ( not ( = ?auto_782991 ?auto_782996 ) ) ( not ( = ?auto_782991 ?auto_782997 ) ) ( not ( = ?auto_782991 ?auto_782998 ) ) ( not ( = ?auto_782991 ?auto_782999 ) ) ( not ( = ?auto_782991 ?auto_783000 ) ) ( not ( = ?auto_782991 ?auto_783001 ) ) ( not ( = ?auto_782991 ?auto_783002 ) ) ( not ( = ?auto_782991 ?auto_783003 ) ) ( not ( = ?auto_782991 ?auto_783004 ) ) ( not ( = ?auto_782991 ?auto_783005 ) ) ( not ( = ?auto_782991 ?auto_783006 ) ) ( not ( = ?auto_782991 ?auto_783007 ) ) ( not ( = ?auto_782992 ?auto_782993 ) ) ( not ( = ?auto_782992 ?auto_782994 ) ) ( not ( = ?auto_782992 ?auto_782995 ) ) ( not ( = ?auto_782992 ?auto_782996 ) ) ( not ( = ?auto_782992 ?auto_782997 ) ) ( not ( = ?auto_782992 ?auto_782998 ) ) ( not ( = ?auto_782992 ?auto_782999 ) ) ( not ( = ?auto_782992 ?auto_783000 ) ) ( not ( = ?auto_782992 ?auto_783001 ) ) ( not ( = ?auto_782992 ?auto_783002 ) ) ( not ( = ?auto_782992 ?auto_783003 ) ) ( not ( = ?auto_782992 ?auto_783004 ) ) ( not ( = ?auto_782992 ?auto_783005 ) ) ( not ( = ?auto_782992 ?auto_783006 ) ) ( not ( = ?auto_782992 ?auto_783007 ) ) ( not ( = ?auto_782993 ?auto_782994 ) ) ( not ( = ?auto_782993 ?auto_782995 ) ) ( not ( = ?auto_782993 ?auto_782996 ) ) ( not ( = ?auto_782993 ?auto_782997 ) ) ( not ( = ?auto_782993 ?auto_782998 ) ) ( not ( = ?auto_782993 ?auto_782999 ) ) ( not ( = ?auto_782993 ?auto_783000 ) ) ( not ( = ?auto_782993 ?auto_783001 ) ) ( not ( = ?auto_782993 ?auto_783002 ) ) ( not ( = ?auto_782993 ?auto_783003 ) ) ( not ( = ?auto_782993 ?auto_783004 ) ) ( not ( = ?auto_782993 ?auto_783005 ) ) ( not ( = ?auto_782993 ?auto_783006 ) ) ( not ( = ?auto_782993 ?auto_783007 ) ) ( not ( = ?auto_782994 ?auto_782995 ) ) ( not ( = ?auto_782994 ?auto_782996 ) ) ( not ( = ?auto_782994 ?auto_782997 ) ) ( not ( = ?auto_782994 ?auto_782998 ) ) ( not ( = ?auto_782994 ?auto_782999 ) ) ( not ( = ?auto_782994 ?auto_783000 ) ) ( not ( = ?auto_782994 ?auto_783001 ) ) ( not ( = ?auto_782994 ?auto_783002 ) ) ( not ( = ?auto_782994 ?auto_783003 ) ) ( not ( = ?auto_782994 ?auto_783004 ) ) ( not ( = ?auto_782994 ?auto_783005 ) ) ( not ( = ?auto_782994 ?auto_783006 ) ) ( not ( = ?auto_782994 ?auto_783007 ) ) ( not ( = ?auto_782995 ?auto_782996 ) ) ( not ( = ?auto_782995 ?auto_782997 ) ) ( not ( = ?auto_782995 ?auto_782998 ) ) ( not ( = ?auto_782995 ?auto_782999 ) ) ( not ( = ?auto_782995 ?auto_783000 ) ) ( not ( = ?auto_782995 ?auto_783001 ) ) ( not ( = ?auto_782995 ?auto_783002 ) ) ( not ( = ?auto_782995 ?auto_783003 ) ) ( not ( = ?auto_782995 ?auto_783004 ) ) ( not ( = ?auto_782995 ?auto_783005 ) ) ( not ( = ?auto_782995 ?auto_783006 ) ) ( not ( = ?auto_782995 ?auto_783007 ) ) ( not ( = ?auto_782996 ?auto_782997 ) ) ( not ( = ?auto_782996 ?auto_782998 ) ) ( not ( = ?auto_782996 ?auto_782999 ) ) ( not ( = ?auto_782996 ?auto_783000 ) ) ( not ( = ?auto_782996 ?auto_783001 ) ) ( not ( = ?auto_782996 ?auto_783002 ) ) ( not ( = ?auto_782996 ?auto_783003 ) ) ( not ( = ?auto_782996 ?auto_783004 ) ) ( not ( = ?auto_782996 ?auto_783005 ) ) ( not ( = ?auto_782996 ?auto_783006 ) ) ( not ( = ?auto_782996 ?auto_783007 ) ) ( not ( = ?auto_782997 ?auto_782998 ) ) ( not ( = ?auto_782997 ?auto_782999 ) ) ( not ( = ?auto_782997 ?auto_783000 ) ) ( not ( = ?auto_782997 ?auto_783001 ) ) ( not ( = ?auto_782997 ?auto_783002 ) ) ( not ( = ?auto_782997 ?auto_783003 ) ) ( not ( = ?auto_782997 ?auto_783004 ) ) ( not ( = ?auto_782997 ?auto_783005 ) ) ( not ( = ?auto_782997 ?auto_783006 ) ) ( not ( = ?auto_782997 ?auto_783007 ) ) ( not ( = ?auto_782998 ?auto_782999 ) ) ( not ( = ?auto_782998 ?auto_783000 ) ) ( not ( = ?auto_782998 ?auto_783001 ) ) ( not ( = ?auto_782998 ?auto_783002 ) ) ( not ( = ?auto_782998 ?auto_783003 ) ) ( not ( = ?auto_782998 ?auto_783004 ) ) ( not ( = ?auto_782998 ?auto_783005 ) ) ( not ( = ?auto_782998 ?auto_783006 ) ) ( not ( = ?auto_782998 ?auto_783007 ) ) ( not ( = ?auto_782999 ?auto_783000 ) ) ( not ( = ?auto_782999 ?auto_783001 ) ) ( not ( = ?auto_782999 ?auto_783002 ) ) ( not ( = ?auto_782999 ?auto_783003 ) ) ( not ( = ?auto_782999 ?auto_783004 ) ) ( not ( = ?auto_782999 ?auto_783005 ) ) ( not ( = ?auto_782999 ?auto_783006 ) ) ( not ( = ?auto_782999 ?auto_783007 ) ) ( not ( = ?auto_783000 ?auto_783001 ) ) ( not ( = ?auto_783000 ?auto_783002 ) ) ( not ( = ?auto_783000 ?auto_783003 ) ) ( not ( = ?auto_783000 ?auto_783004 ) ) ( not ( = ?auto_783000 ?auto_783005 ) ) ( not ( = ?auto_783000 ?auto_783006 ) ) ( not ( = ?auto_783000 ?auto_783007 ) ) ( not ( = ?auto_783001 ?auto_783002 ) ) ( not ( = ?auto_783001 ?auto_783003 ) ) ( not ( = ?auto_783001 ?auto_783004 ) ) ( not ( = ?auto_783001 ?auto_783005 ) ) ( not ( = ?auto_783001 ?auto_783006 ) ) ( not ( = ?auto_783001 ?auto_783007 ) ) ( not ( = ?auto_783002 ?auto_783003 ) ) ( not ( = ?auto_783002 ?auto_783004 ) ) ( not ( = ?auto_783002 ?auto_783005 ) ) ( not ( = ?auto_783002 ?auto_783006 ) ) ( not ( = ?auto_783002 ?auto_783007 ) ) ( not ( = ?auto_783003 ?auto_783004 ) ) ( not ( = ?auto_783003 ?auto_783005 ) ) ( not ( = ?auto_783003 ?auto_783006 ) ) ( not ( = ?auto_783003 ?auto_783007 ) ) ( not ( = ?auto_783004 ?auto_783005 ) ) ( not ( = ?auto_783004 ?auto_783006 ) ) ( not ( = ?auto_783004 ?auto_783007 ) ) ( not ( = ?auto_783005 ?auto_783006 ) ) ( not ( = ?auto_783005 ?auto_783007 ) ) ( not ( = ?auto_783006 ?auto_783007 ) ) ( ON ?auto_783005 ?auto_783006 ) ( ON ?auto_783004 ?auto_783005 ) ( ON ?auto_783003 ?auto_783004 ) ( ON ?auto_783002 ?auto_783003 ) ( ON ?auto_783001 ?auto_783002 ) ( ON ?auto_783000 ?auto_783001 ) ( ON ?auto_782999 ?auto_783000 ) ( ON ?auto_782998 ?auto_782999 ) ( CLEAR ?auto_782996 ) ( ON ?auto_782997 ?auto_782998 ) ( CLEAR ?auto_782997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_782989 ?auto_782990 ?auto_782991 ?auto_782992 ?auto_782993 ?auto_782994 ?auto_782995 ?auto_782996 ?auto_782997 )
      ( MAKE-18PILE ?auto_782989 ?auto_782990 ?auto_782991 ?auto_782992 ?auto_782993 ?auto_782994 ?auto_782995 ?auto_782996 ?auto_782997 ?auto_782998 ?auto_782999 ?auto_783000 ?auto_783001 ?auto_783002 ?auto_783003 ?auto_783004 ?auto_783005 ?auto_783006 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_783026 - BLOCK
      ?auto_783027 - BLOCK
      ?auto_783028 - BLOCK
      ?auto_783029 - BLOCK
      ?auto_783030 - BLOCK
      ?auto_783031 - BLOCK
      ?auto_783032 - BLOCK
      ?auto_783033 - BLOCK
      ?auto_783034 - BLOCK
      ?auto_783035 - BLOCK
      ?auto_783036 - BLOCK
      ?auto_783037 - BLOCK
      ?auto_783038 - BLOCK
      ?auto_783039 - BLOCK
      ?auto_783040 - BLOCK
      ?auto_783041 - BLOCK
      ?auto_783042 - BLOCK
      ?auto_783043 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_783043 ) ( ON-TABLE ?auto_783026 ) ( ON ?auto_783027 ?auto_783026 ) ( ON ?auto_783028 ?auto_783027 ) ( ON ?auto_783029 ?auto_783028 ) ( ON ?auto_783030 ?auto_783029 ) ( ON ?auto_783031 ?auto_783030 ) ( ON ?auto_783032 ?auto_783031 ) ( ON ?auto_783033 ?auto_783032 ) ( not ( = ?auto_783026 ?auto_783027 ) ) ( not ( = ?auto_783026 ?auto_783028 ) ) ( not ( = ?auto_783026 ?auto_783029 ) ) ( not ( = ?auto_783026 ?auto_783030 ) ) ( not ( = ?auto_783026 ?auto_783031 ) ) ( not ( = ?auto_783026 ?auto_783032 ) ) ( not ( = ?auto_783026 ?auto_783033 ) ) ( not ( = ?auto_783026 ?auto_783034 ) ) ( not ( = ?auto_783026 ?auto_783035 ) ) ( not ( = ?auto_783026 ?auto_783036 ) ) ( not ( = ?auto_783026 ?auto_783037 ) ) ( not ( = ?auto_783026 ?auto_783038 ) ) ( not ( = ?auto_783026 ?auto_783039 ) ) ( not ( = ?auto_783026 ?auto_783040 ) ) ( not ( = ?auto_783026 ?auto_783041 ) ) ( not ( = ?auto_783026 ?auto_783042 ) ) ( not ( = ?auto_783026 ?auto_783043 ) ) ( not ( = ?auto_783027 ?auto_783028 ) ) ( not ( = ?auto_783027 ?auto_783029 ) ) ( not ( = ?auto_783027 ?auto_783030 ) ) ( not ( = ?auto_783027 ?auto_783031 ) ) ( not ( = ?auto_783027 ?auto_783032 ) ) ( not ( = ?auto_783027 ?auto_783033 ) ) ( not ( = ?auto_783027 ?auto_783034 ) ) ( not ( = ?auto_783027 ?auto_783035 ) ) ( not ( = ?auto_783027 ?auto_783036 ) ) ( not ( = ?auto_783027 ?auto_783037 ) ) ( not ( = ?auto_783027 ?auto_783038 ) ) ( not ( = ?auto_783027 ?auto_783039 ) ) ( not ( = ?auto_783027 ?auto_783040 ) ) ( not ( = ?auto_783027 ?auto_783041 ) ) ( not ( = ?auto_783027 ?auto_783042 ) ) ( not ( = ?auto_783027 ?auto_783043 ) ) ( not ( = ?auto_783028 ?auto_783029 ) ) ( not ( = ?auto_783028 ?auto_783030 ) ) ( not ( = ?auto_783028 ?auto_783031 ) ) ( not ( = ?auto_783028 ?auto_783032 ) ) ( not ( = ?auto_783028 ?auto_783033 ) ) ( not ( = ?auto_783028 ?auto_783034 ) ) ( not ( = ?auto_783028 ?auto_783035 ) ) ( not ( = ?auto_783028 ?auto_783036 ) ) ( not ( = ?auto_783028 ?auto_783037 ) ) ( not ( = ?auto_783028 ?auto_783038 ) ) ( not ( = ?auto_783028 ?auto_783039 ) ) ( not ( = ?auto_783028 ?auto_783040 ) ) ( not ( = ?auto_783028 ?auto_783041 ) ) ( not ( = ?auto_783028 ?auto_783042 ) ) ( not ( = ?auto_783028 ?auto_783043 ) ) ( not ( = ?auto_783029 ?auto_783030 ) ) ( not ( = ?auto_783029 ?auto_783031 ) ) ( not ( = ?auto_783029 ?auto_783032 ) ) ( not ( = ?auto_783029 ?auto_783033 ) ) ( not ( = ?auto_783029 ?auto_783034 ) ) ( not ( = ?auto_783029 ?auto_783035 ) ) ( not ( = ?auto_783029 ?auto_783036 ) ) ( not ( = ?auto_783029 ?auto_783037 ) ) ( not ( = ?auto_783029 ?auto_783038 ) ) ( not ( = ?auto_783029 ?auto_783039 ) ) ( not ( = ?auto_783029 ?auto_783040 ) ) ( not ( = ?auto_783029 ?auto_783041 ) ) ( not ( = ?auto_783029 ?auto_783042 ) ) ( not ( = ?auto_783029 ?auto_783043 ) ) ( not ( = ?auto_783030 ?auto_783031 ) ) ( not ( = ?auto_783030 ?auto_783032 ) ) ( not ( = ?auto_783030 ?auto_783033 ) ) ( not ( = ?auto_783030 ?auto_783034 ) ) ( not ( = ?auto_783030 ?auto_783035 ) ) ( not ( = ?auto_783030 ?auto_783036 ) ) ( not ( = ?auto_783030 ?auto_783037 ) ) ( not ( = ?auto_783030 ?auto_783038 ) ) ( not ( = ?auto_783030 ?auto_783039 ) ) ( not ( = ?auto_783030 ?auto_783040 ) ) ( not ( = ?auto_783030 ?auto_783041 ) ) ( not ( = ?auto_783030 ?auto_783042 ) ) ( not ( = ?auto_783030 ?auto_783043 ) ) ( not ( = ?auto_783031 ?auto_783032 ) ) ( not ( = ?auto_783031 ?auto_783033 ) ) ( not ( = ?auto_783031 ?auto_783034 ) ) ( not ( = ?auto_783031 ?auto_783035 ) ) ( not ( = ?auto_783031 ?auto_783036 ) ) ( not ( = ?auto_783031 ?auto_783037 ) ) ( not ( = ?auto_783031 ?auto_783038 ) ) ( not ( = ?auto_783031 ?auto_783039 ) ) ( not ( = ?auto_783031 ?auto_783040 ) ) ( not ( = ?auto_783031 ?auto_783041 ) ) ( not ( = ?auto_783031 ?auto_783042 ) ) ( not ( = ?auto_783031 ?auto_783043 ) ) ( not ( = ?auto_783032 ?auto_783033 ) ) ( not ( = ?auto_783032 ?auto_783034 ) ) ( not ( = ?auto_783032 ?auto_783035 ) ) ( not ( = ?auto_783032 ?auto_783036 ) ) ( not ( = ?auto_783032 ?auto_783037 ) ) ( not ( = ?auto_783032 ?auto_783038 ) ) ( not ( = ?auto_783032 ?auto_783039 ) ) ( not ( = ?auto_783032 ?auto_783040 ) ) ( not ( = ?auto_783032 ?auto_783041 ) ) ( not ( = ?auto_783032 ?auto_783042 ) ) ( not ( = ?auto_783032 ?auto_783043 ) ) ( not ( = ?auto_783033 ?auto_783034 ) ) ( not ( = ?auto_783033 ?auto_783035 ) ) ( not ( = ?auto_783033 ?auto_783036 ) ) ( not ( = ?auto_783033 ?auto_783037 ) ) ( not ( = ?auto_783033 ?auto_783038 ) ) ( not ( = ?auto_783033 ?auto_783039 ) ) ( not ( = ?auto_783033 ?auto_783040 ) ) ( not ( = ?auto_783033 ?auto_783041 ) ) ( not ( = ?auto_783033 ?auto_783042 ) ) ( not ( = ?auto_783033 ?auto_783043 ) ) ( not ( = ?auto_783034 ?auto_783035 ) ) ( not ( = ?auto_783034 ?auto_783036 ) ) ( not ( = ?auto_783034 ?auto_783037 ) ) ( not ( = ?auto_783034 ?auto_783038 ) ) ( not ( = ?auto_783034 ?auto_783039 ) ) ( not ( = ?auto_783034 ?auto_783040 ) ) ( not ( = ?auto_783034 ?auto_783041 ) ) ( not ( = ?auto_783034 ?auto_783042 ) ) ( not ( = ?auto_783034 ?auto_783043 ) ) ( not ( = ?auto_783035 ?auto_783036 ) ) ( not ( = ?auto_783035 ?auto_783037 ) ) ( not ( = ?auto_783035 ?auto_783038 ) ) ( not ( = ?auto_783035 ?auto_783039 ) ) ( not ( = ?auto_783035 ?auto_783040 ) ) ( not ( = ?auto_783035 ?auto_783041 ) ) ( not ( = ?auto_783035 ?auto_783042 ) ) ( not ( = ?auto_783035 ?auto_783043 ) ) ( not ( = ?auto_783036 ?auto_783037 ) ) ( not ( = ?auto_783036 ?auto_783038 ) ) ( not ( = ?auto_783036 ?auto_783039 ) ) ( not ( = ?auto_783036 ?auto_783040 ) ) ( not ( = ?auto_783036 ?auto_783041 ) ) ( not ( = ?auto_783036 ?auto_783042 ) ) ( not ( = ?auto_783036 ?auto_783043 ) ) ( not ( = ?auto_783037 ?auto_783038 ) ) ( not ( = ?auto_783037 ?auto_783039 ) ) ( not ( = ?auto_783037 ?auto_783040 ) ) ( not ( = ?auto_783037 ?auto_783041 ) ) ( not ( = ?auto_783037 ?auto_783042 ) ) ( not ( = ?auto_783037 ?auto_783043 ) ) ( not ( = ?auto_783038 ?auto_783039 ) ) ( not ( = ?auto_783038 ?auto_783040 ) ) ( not ( = ?auto_783038 ?auto_783041 ) ) ( not ( = ?auto_783038 ?auto_783042 ) ) ( not ( = ?auto_783038 ?auto_783043 ) ) ( not ( = ?auto_783039 ?auto_783040 ) ) ( not ( = ?auto_783039 ?auto_783041 ) ) ( not ( = ?auto_783039 ?auto_783042 ) ) ( not ( = ?auto_783039 ?auto_783043 ) ) ( not ( = ?auto_783040 ?auto_783041 ) ) ( not ( = ?auto_783040 ?auto_783042 ) ) ( not ( = ?auto_783040 ?auto_783043 ) ) ( not ( = ?auto_783041 ?auto_783042 ) ) ( not ( = ?auto_783041 ?auto_783043 ) ) ( not ( = ?auto_783042 ?auto_783043 ) ) ( ON ?auto_783042 ?auto_783043 ) ( ON ?auto_783041 ?auto_783042 ) ( ON ?auto_783040 ?auto_783041 ) ( ON ?auto_783039 ?auto_783040 ) ( ON ?auto_783038 ?auto_783039 ) ( ON ?auto_783037 ?auto_783038 ) ( ON ?auto_783036 ?auto_783037 ) ( ON ?auto_783035 ?auto_783036 ) ( CLEAR ?auto_783033 ) ( ON ?auto_783034 ?auto_783035 ) ( CLEAR ?auto_783034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_783026 ?auto_783027 ?auto_783028 ?auto_783029 ?auto_783030 ?auto_783031 ?auto_783032 ?auto_783033 ?auto_783034 )
      ( MAKE-18PILE ?auto_783026 ?auto_783027 ?auto_783028 ?auto_783029 ?auto_783030 ?auto_783031 ?auto_783032 ?auto_783033 ?auto_783034 ?auto_783035 ?auto_783036 ?auto_783037 ?auto_783038 ?auto_783039 ?auto_783040 ?auto_783041 ?auto_783042 ?auto_783043 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_783062 - BLOCK
      ?auto_783063 - BLOCK
      ?auto_783064 - BLOCK
      ?auto_783065 - BLOCK
      ?auto_783066 - BLOCK
      ?auto_783067 - BLOCK
      ?auto_783068 - BLOCK
      ?auto_783069 - BLOCK
      ?auto_783070 - BLOCK
      ?auto_783071 - BLOCK
      ?auto_783072 - BLOCK
      ?auto_783073 - BLOCK
      ?auto_783074 - BLOCK
      ?auto_783075 - BLOCK
      ?auto_783076 - BLOCK
      ?auto_783077 - BLOCK
      ?auto_783078 - BLOCK
      ?auto_783079 - BLOCK
    )
    :vars
    (
      ?auto_783080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_783079 ?auto_783080 ) ( ON-TABLE ?auto_783062 ) ( ON ?auto_783063 ?auto_783062 ) ( ON ?auto_783064 ?auto_783063 ) ( ON ?auto_783065 ?auto_783064 ) ( ON ?auto_783066 ?auto_783065 ) ( ON ?auto_783067 ?auto_783066 ) ( ON ?auto_783068 ?auto_783067 ) ( not ( = ?auto_783062 ?auto_783063 ) ) ( not ( = ?auto_783062 ?auto_783064 ) ) ( not ( = ?auto_783062 ?auto_783065 ) ) ( not ( = ?auto_783062 ?auto_783066 ) ) ( not ( = ?auto_783062 ?auto_783067 ) ) ( not ( = ?auto_783062 ?auto_783068 ) ) ( not ( = ?auto_783062 ?auto_783069 ) ) ( not ( = ?auto_783062 ?auto_783070 ) ) ( not ( = ?auto_783062 ?auto_783071 ) ) ( not ( = ?auto_783062 ?auto_783072 ) ) ( not ( = ?auto_783062 ?auto_783073 ) ) ( not ( = ?auto_783062 ?auto_783074 ) ) ( not ( = ?auto_783062 ?auto_783075 ) ) ( not ( = ?auto_783062 ?auto_783076 ) ) ( not ( = ?auto_783062 ?auto_783077 ) ) ( not ( = ?auto_783062 ?auto_783078 ) ) ( not ( = ?auto_783062 ?auto_783079 ) ) ( not ( = ?auto_783062 ?auto_783080 ) ) ( not ( = ?auto_783063 ?auto_783064 ) ) ( not ( = ?auto_783063 ?auto_783065 ) ) ( not ( = ?auto_783063 ?auto_783066 ) ) ( not ( = ?auto_783063 ?auto_783067 ) ) ( not ( = ?auto_783063 ?auto_783068 ) ) ( not ( = ?auto_783063 ?auto_783069 ) ) ( not ( = ?auto_783063 ?auto_783070 ) ) ( not ( = ?auto_783063 ?auto_783071 ) ) ( not ( = ?auto_783063 ?auto_783072 ) ) ( not ( = ?auto_783063 ?auto_783073 ) ) ( not ( = ?auto_783063 ?auto_783074 ) ) ( not ( = ?auto_783063 ?auto_783075 ) ) ( not ( = ?auto_783063 ?auto_783076 ) ) ( not ( = ?auto_783063 ?auto_783077 ) ) ( not ( = ?auto_783063 ?auto_783078 ) ) ( not ( = ?auto_783063 ?auto_783079 ) ) ( not ( = ?auto_783063 ?auto_783080 ) ) ( not ( = ?auto_783064 ?auto_783065 ) ) ( not ( = ?auto_783064 ?auto_783066 ) ) ( not ( = ?auto_783064 ?auto_783067 ) ) ( not ( = ?auto_783064 ?auto_783068 ) ) ( not ( = ?auto_783064 ?auto_783069 ) ) ( not ( = ?auto_783064 ?auto_783070 ) ) ( not ( = ?auto_783064 ?auto_783071 ) ) ( not ( = ?auto_783064 ?auto_783072 ) ) ( not ( = ?auto_783064 ?auto_783073 ) ) ( not ( = ?auto_783064 ?auto_783074 ) ) ( not ( = ?auto_783064 ?auto_783075 ) ) ( not ( = ?auto_783064 ?auto_783076 ) ) ( not ( = ?auto_783064 ?auto_783077 ) ) ( not ( = ?auto_783064 ?auto_783078 ) ) ( not ( = ?auto_783064 ?auto_783079 ) ) ( not ( = ?auto_783064 ?auto_783080 ) ) ( not ( = ?auto_783065 ?auto_783066 ) ) ( not ( = ?auto_783065 ?auto_783067 ) ) ( not ( = ?auto_783065 ?auto_783068 ) ) ( not ( = ?auto_783065 ?auto_783069 ) ) ( not ( = ?auto_783065 ?auto_783070 ) ) ( not ( = ?auto_783065 ?auto_783071 ) ) ( not ( = ?auto_783065 ?auto_783072 ) ) ( not ( = ?auto_783065 ?auto_783073 ) ) ( not ( = ?auto_783065 ?auto_783074 ) ) ( not ( = ?auto_783065 ?auto_783075 ) ) ( not ( = ?auto_783065 ?auto_783076 ) ) ( not ( = ?auto_783065 ?auto_783077 ) ) ( not ( = ?auto_783065 ?auto_783078 ) ) ( not ( = ?auto_783065 ?auto_783079 ) ) ( not ( = ?auto_783065 ?auto_783080 ) ) ( not ( = ?auto_783066 ?auto_783067 ) ) ( not ( = ?auto_783066 ?auto_783068 ) ) ( not ( = ?auto_783066 ?auto_783069 ) ) ( not ( = ?auto_783066 ?auto_783070 ) ) ( not ( = ?auto_783066 ?auto_783071 ) ) ( not ( = ?auto_783066 ?auto_783072 ) ) ( not ( = ?auto_783066 ?auto_783073 ) ) ( not ( = ?auto_783066 ?auto_783074 ) ) ( not ( = ?auto_783066 ?auto_783075 ) ) ( not ( = ?auto_783066 ?auto_783076 ) ) ( not ( = ?auto_783066 ?auto_783077 ) ) ( not ( = ?auto_783066 ?auto_783078 ) ) ( not ( = ?auto_783066 ?auto_783079 ) ) ( not ( = ?auto_783066 ?auto_783080 ) ) ( not ( = ?auto_783067 ?auto_783068 ) ) ( not ( = ?auto_783067 ?auto_783069 ) ) ( not ( = ?auto_783067 ?auto_783070 ) ) ( not ( = ?auto_783067 ?auto_783071 ) ) ( not ( = ?auto_783067 ?auto_783072 ) ) ( not ( = ?auto_783067 ?auto_783073 ) ) ( not ( = ?auto_783067 ?auto_783074 ) ) ( not ( = ?auto_783067 ?auto_783075 ) ) ( not ( = ?auto_783067 ?auto_783076 ) ) ( not ( = ?auto_783067 ?auto_783077 ) ) ( not ( = ?auto_783067 ?auto_783078 ) ) ( not ( = ?auto_783067 ?auto_783079 ) ) ( not ( = ?auto_783067 ?auto_783080 ) ) ( not ( = ?auto_783068 ?auto_783069 ) ) ( not ( = ?auto_783068 ?auto_783070 ) ) ( not ( = ?auto_783068 ?auto_783071 ) ) ( not ( = ?auto_783068 ?auto_783072 ) ) ( not ( = ?auto_783068 ?auto_783073 ) ) ( not ( = ?auto_783068 ?auto_783074 ) ) ( not ( = ?auto_783068 ?auto_783075 ) ) ( not ( = ?auto_783068 ?auto_783076 ) ) ( not ( = ?auto_783068 ?auto_783077 ) ) ( not ( = ?auto_783068 ?auto_783078 ) ) ( not ( = ?auto_783068 ?auto_783079 ) ) ( not ( = ?auto_783068 ?auto_783080 ) ) ( not ( = ?auto_783069 ?auto_783070 ) ) ( not ( = ?auto_783069 ?auto_783071 ) ) ( not ( = ?auto_783069 ?auto_783072 ) ) ( not ( = ?auto_783069 ?auto_783073 ) ) ( not ( = ?auto_783069 ?auto_783074 ) ) ( not ( = ?auto_783069 ?auto_783075 ) ) ( not ( = ?auto_783069 ?auto_783076 ) ) ( not ( = ?auto_783069 ?auto_783077 ) ) ( not ( = ?auto_783069 ?auto_783078 ) ) ( not ( = ?auto_783069 ?auto_783079 ) ) ( not ( = ?auto_783069 ?auto_783080 ) ) ( not ( = ?auto_783070 ?auto_783071 ) ) ( not ( = ?auto_783070 ?auto_783072 ) ) ( not ( = ?auto_783070 ?auto_783073 ) ) ( not ( = ?auto_783070 ?auto_783074 ) ) ( not ( = ?auto_783070 ?auto_783075 ) ) ( not ( = ?auto_783070 ?auto_783076 ) ) ( not ( = ?auto_783070 ?auto_783077 ) ) ( not ( = ?auto_783070 ?auto_783078 ) ) ( not ( = ?auto_783070 ?auto_783079 ) ) ( not ( = ?auto_783070 ?auto_783080 ) ) ( not ( = ?auto_783071 ?auto_783072 ) ) ( not ( = ?auto_783071 ?auto_783073 ) ) ( not ( = ?auto_783071 ?auto_783074 ) ) ( not ( = ?auto_783071 ?auto_783075 ) ) ( not ( = ?auto_783071 ?auto_783076 ) ) ( not ( = ?auto_783071 ?auto_783077 ) ) ( not ( = ?auto_783071 ?auto_783078 ) ) ( not ( = ?auto_783071 ?auto_783079 ) ) ( not ( = ?auto_783071 ?auto_783080 ) ) ( not ( = ?auto_783072 ?auto_783073 ) ) ( not ( = ?auto_783072 ?auto_783074 ) ) ( not ( = ?auto_783072 ?auto_783075 ) ) ( not ( = ?auto_783072 ?auto_783076 ) ) ( not ( = ?auto_783072 ?auto_783077 ) ) ( not ( = ?auto_783072 ?auto_783078 ) ) ( not ( = ?auto_783072 ?auto_783079 ) ) ( not ( = ?auto_783072 ?auto_783080 ) ) ( not ( = ?auto_783073 ?auto_783074 ) ) ( not ( = ?auto_783073 ?auto_783075 ) ) ( not ( = ?auto_783073 ?auto_783076 ) ) ( not ( = ?auto_783073 ?auto_783077 ) ) ( not ( = ?auto_783073 ?auto_783078 ) ) ( not ( = ?auto_783073 ?auto_783079 ) ) ( not ( = ?auto_783073 ?auto_783080 ) ) ( not ( = ?auto_783074 ?auto_783075 ) ) ( not ( = ?auto_783074 ?auto_783076 ) ) ( not ( = ?auto_783074 ?auto_783077 ) ) ( not ( = ?auto_783074 ?auto_783078 ) ) ( not ( = ?auto_783074 ?auto_783079 ) ) ( not ( = ?auto_783074 ?auto_783080 ) ) ( not ( = ?auto_783075 ?auto_783076 ) ) ( not ( = ?auto_783075 ?auto_783077 ) ) ( not ( = ?auto_783075 ?auto_783078 ) ) ( not ( = ?auto_783075 ?auto_783079 ) ) ( not ( = ?auto_783075 ?auto_783080 ) ) ( not ( = ?auto_783076 ?auto_783077 ) ) ( not ( = ?auto_783076 ?auto_783078 ) ) ( not ( = ?auto_783076 ?auto_783079 ) ) ( not ( = ?auto_783076 ?auto_783080 ) ) ( not ( = ?auto_783077 ?auto_783078 ) ) ( not ( = ?auto_783077 ?auto_783079 ) ) ( not ( = ?auto_783077 ?auto_783080 ) ) ( not ( = ?auto_783078 ?auto_783079 ) ) ( not ( = ?auto_783078 ?auto_783080 ) ) ( not ( = ?auto_783079 ?auto_783080 ) ) ( ON ?auto_783078 ?auto_783079 ) ( ON ?auto_783077 ?auto_783078 ) ( ON ?auto_783076 ?auto_783077 ) ( ON ?auto_783075 ?auto_783076 ) ( ON ?auto_783074 ?auto_783075 ) ( ON ?auto_783073 ?auto_783074 ) ( ON ?auto_783072 ?auto_783073 ) ( ON ?auto_783071 ?auto_783072 ) ( ON ?auto_783070 ?auto_783071 ) ( CLEAR ?auto_783068 ) ( ON ?auto_783069 ?auto_783070 ) ( CLEAR ?auto_783069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_783062 ?auto_783063 ?auto_783064 ?auto_783065 ?auto_783066 ?auto_783067 ?auto_783068 ?auto_783069 )
      ( MAKE-18PILE ?auto_783062 ?auto_783063 ?auto_783064 ?auto_783065 ?auto_783066 ?auto_783067 ?auto_783068 ?auto_783069 ?auto_783070 ?auto_783071 ?auto_783072 ?auto_783073 ?auto_783074 ?auto_783075 ?auto_783076 ?auto_783077 ?auto_783078 ?auto_783079 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_783099 - BLOCK
      ?auto_783100 - BLOCK
      ?auto_783101 - BLOCK
      ?auto_783102 - BLOCK
      ?auto_783103 - BLOCK
      ?auto_783104 - BLOCK
      ?auto_783105 - BLOCK
      ?auto_783106 - BLOCK
      ?auto_783107 - BLOCK
      ?auto_783108 - BLOCK
      ?auto_783109 - BLOCK
      ?auto_783110 - BLOCK
      ?auto_783111 - BLOCK
      ?auto_783112 - BLOCK
      ?auto_783113 - BLOCK
      ?auto_783114 - BLOCK
      ?auto_783115 - BLOCK
      ?auto_783116 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_783116 ) ( ON-TABLE ?auto_783099 ) ( ON ?auto_783100 ?auto_783099 ) ( ON ?auto_783101 ?auto_783100 ) ( ON ?auto_783102 ?auto_783101 ) ( ON ?auto_783103 ?auto_783102 ) ( ON ?auto_783104 ?auto_783103 ) ( ON ?auto_783105 ?auto_783104 ) ( not ( = ?auto_783099 ?auto_783100 ) ) ( not ( = ?auto_783099 ?auto_783101 ) ) ( not ( = ?auto_783099 ?auto_783102 ) ) ( not ( = ?auto_783099 ?auto_783103 ) ) ( not ( = ?auto_783099 ?auto_783104 ) ) ( not ( = ?auto_783099 ?auto_783105 ) ) ( not ( = ?auto_783099 ?auto_783106 ) ) ( not ( = ?auto_783099 ?auto_783107 ) ) ( not ( = ?auto_783099 ?auto_783108 ) ) ( not ( = ?auto_783099 ?auto_783109 ) ) ( not ( = ?auto_783099 ?auto_783110 ) ) ( not ( = ?auto_783099 ?auto_783111 ) ) ( not ( = ?auto_783099 ?auto_783112 ) ) ( not ( = ?auto_783099 ?auto_783113 ) ) ( not ( = ?auto_783099 ?auto_783114 ) ) ( not ( = ?auto_783099 ?auto_783115 ) ) ( not ( = ?auto_783099 ?auto_783116 ) ) ( not ( = ?auto_783100 ?auto_783101 ) ) ( not ( = ?auto_783100 ?auto_783102 ) ) ( not ( = ?auto_783100 ?auto_783103 ) ) ( not ( = ?auto_783100 ?auto_783104 ) ) ( not ( = ?auto_783100 ?auto_783105 ) ) ( not ( = ?auto_783100 ?auto_783106 ) ) ( not ( = ?auto_783100 ?auto_783107 ) ) ( not ( = ?auto_783100 ?auto_783108 ) ) ( not ( = ?auto_783100 ?auto_783109 ) ) ( not ( = ?auto_783100 ?auto_783110 ) ) ( not ( = ?auto_783100 ?auto_783111 ) ) ( not ( = ?auto_783100 ?auto_783112 ) ) ( not ( = ?auto_783100 ?auto_783113 ) ) ( not ( = ?auto_783100 ?auto_783114 ) ) ( not ( = ?auto_783100 ?auto_783115 ) ) ( not ( = ?auto_783100 ?auto_783116 ) ) ( not ( = ?auto_783101 ?auto_783102 ) ) ( not ( = ?auto_783101 ?auto_783103 ) ) ( not ( = ?auto_783101 ?auto_783104 ) ) ( not ( = ?auto_783101 ?auto_783105 ) ) ( not ( = ?auto_783101 ?auto_783106 ) ) ( not ( = ?auto_783101 ?auto_783107 ) ) ( not ( = ?auto_783101 ?auto_783108 ) ) ( not ( = ?auto_783101 ?auto_783109 ) ) ( not ( = ?auto_783101 ?auto_783110 ) ) ( not ( = ?auto_783101 ?auto_783111 ) ) ( not ( = ?auto_783101 ?auto_783112 ) ) ( not ( = ?auto_783101 ?auto_783113 ) ) ( not ( = ?auto_783101 ?auto_783114 ) ) ( not ( = ?auto_783101 ?auto_783115 ) ) ( not ( = ?auto_783101 ?auto_783116 ) ) ( not ( = ?auto_783102 ?auto_783103 ) ) ( not ( = ?auto_783102 ?auto_783104 ) ) ( not ( = ?auto_783102 ?auto_783105 ) ) ( not ( = ?auto_783102 ?auto_783106 ) ) ( not ( = ?auto_783102 ?auto_783107 ) ) ( not ( = ?auto_783102 ?auto_783108 ) ) ( not ( = ?auto_783102 ?auto_783109 ) ) ( not ( = ?auto_783102 ?auto_783110 ) ) ( not ( = ?auto_783102 ?auto_783111 ) ) ( not ( = ?auto_783102 ?auto_783112 ) ) ( not ( = ?auto_783102 ?auto_783113 ) ) ( not ( = ?auto_783102 ?auto_783114 ) ) ( not ( = ?auto_783102 ?auto_783115 ) ) ( not ( = ?auto_783102 ?auto_783116 ) ) ( not ( = ?auto_783103 ?auto_783104 ) ) ( not ( = ?auto_783103 ?auto_783105 ) ) ( not ( = ?auto_783103 ?auto_783106 ) ) ( not ( = ?auto_783103 ?auto_783107 ) ) ( not ( = ?auto_783103 ?auto_783108 ) ) ( not ( = ?auto_783103 ?auto_783109 ) ) ( not ( = ?auto_783103 ?auto_783110 ) ) ( not ( = ?auto_783103 ?auto_783111 ) ) ( not ( = ?auto_783103 ?auto_783112 ) ) ( not ( = ?auto_783103 ?auto_783113 ) ) ( not ( = ?auto_783103 ?auto_783114 ) ) ( not ( = ?auto_783103 ?auto_783115 ) ) ( not ( = ?auto_783103 ?auto_783116 ) ) ( not ( = ?auto_783104 ?auto_783105 ) ) ( not ( = ?auto_783104 ?auto_783106 ) ) ( not ( = ?auto_783104 ?auto_783107 ) ) ( not ( = ?auto_783104 ?auto_783108 ) ) ( not ( = ?auto_783104 ?auto_783109 ) ) ( not ( = ?auto_783104 ?auto_783110 ) ) ( not ( = ?auto_783104 ?auto_783111 ) ) ( not ( = ?auto_783104 ?auto_783112 ) ) ( not ( = ?auto_783104 ?auto_783113 ) ) ( not ( = ?auto_783104 ?auto_783114 ) ) ( not ( = ?auto_783104 ?auto_783115 ) ) ( not ( = ?auto_783104 ?auto_783116 ) ) ( not ( = ?auto_783105 ?auto_783106 ) ) ( not ( = ?auto_783105 ?auto_783107 ) ) ( not ( = ?auto_783105 ?auto_783108 ) ) ( not ( = ?auto_783105 ?auto_783109 ) ) ( not ( = ?auto_783105 ?auto_783110 ) ) ( not ( = ?auto_783105 ?auto_783111 ) ) ( not ( = ?auto_783105 ?auto_783112 ) ) ( not ( = ?auto_783105 ?auto_783113 ) ) ( not ( = ?auto_783105 ?auto_783114 ) ) ( not ( = ?auto_783105 ?auto_783115 ) ) ( not ( = ?auto_783105 ?auto_783116 ) ) ( not ( = ?auto_783106 ?auto_783107 ) ) ( not ( = ?auto_783106 ?auto_783108 ) ) ( not ( = ?auto_783106 ?auto_783109 ) ) ( not ( = ?auto_783106 ?auto_783110 ) ) ( not ( = ?auto_783106 ?auto_783111 ) ) ( not ( = ?auto_783106 ?auto_783112 ) ) ( not ( = ?auto_783106 ?auto_783113 ) ) ( not ( = ?auto_783106 ?auto_783114 ) ) ( not ( = ?auto_783106 ?auto_783115 ) ) ( not ( = ?auto_783106 ?auto_783116 ) ) ( not ( = ?auto_783107 ?auto_783108 ) ) ( not ( = ?auto_783107 ?auto_783109 ) ) ( not ( = ?auto_783107 ?auto_783110 ) ) ( not ( = ?auto_783107 ?auto_783111 ) ) ( not ( = ?auto_783107 ?auto_783112 ) ) ( not ( = ?auto_783107 ?auto_783113 ) ) ( not ( = ?auto_783107 ?auto_783114 ) ) ( not ( = ?auto_783107 ?auto_783115 ) ) ( not ( = ?auto_783107 ?auto_783116 ) ) ( not ( = ?auto_783108 ?auto_783109 ) ) ( not ( = ?auto_783108 ?auto_783110 ) ) ( not ( = ?auto_783108 ?auto_783111 ) ) ( not ( = ?auto_783108 ?auto_783112 ) ) ( not ( = ?auto_783108 ?auto_783113 ) ) ( not ( = ?auto_783108 ?auto_783114 ) ) ( not ( = ?auto_783108 ?auto_783115 ) ) ( not ( = ?auto_783108 ?auto_783116 ) ) ( not ( = ?auto_783109 ?auto_783110 ) ) ( not ( = ?auto_783109 ?auto_783111 ) ) ( not ( = ?auto_783109 ?auto_783112 ) ) ( not ( = ?auto_783109 ?auto_783113 ) ) ( not ( = ?auto_783109 ?auto_783114 ) ) ( not ( = ?auto_783109 ?auto_783115 ) ) ( not ( = ?auto_783109 ?auto_783116 ) ) ( not ( = ?auto_783110 ?auto_783111 ) ) ( not ( = ?auto_783110 ?auto_783112 ) ) ( not ( = ?auto_783110 ?auto_783113 ) ) ( not ( = ?auto_783110 ?auto_783114 ) ) ( not ( = ?auto_783110 ?auto_783115 ) ) ( not ( = ?auto_783110 ?auto_783116 ) ) ( not ( = ?auto_783111 ?auto_783112 ) ) ( not ( = ?auto_783111 ?auto_783113 ) ) ( not ( = ?auto_783111 ?auto_783114 ) ) ( not ( = ?auto_783111 ?auto_783115 ) ) ( not ( = ?auto_783111 ?auto_783116 ) ) ( not ( = ?auto_783112 ?auto_783113 ) ) ( not ( = ?auto_783112 ?auto_783114 ) ) ( not ( = ?auto_783112 ?auto_783115 ) ) ( not ( = ?auto_783112 ?auto_783116 ) ) ( not ( = ?auto_783113 ?auto_783114 ) ) ( not ( = ?auto_783113 ?auto_783115 ) ) ( not ( = ?auto_783113 ?auto_783116 ) ) ( not ( = ?auto_783114 ?auto_783115 ) ) ( not ( = ?auto_783114 ?auto_783116 ) ) ( not ( = ?auto_783115 ?auto_783116 ) ) ( ON ?auto_783115 ?auto_783116 ) ( ON ?auto_783114 ?auto_783115 ) ( ON ?auto_783113 ?auto_783114 ) ( ON ?auto_783112 ?auto_783113 ) ( ON ?auto_783111 ?auto_783112 ) ( ON ?auto_783110 ?auto_783111 ) ( ON ?auto_783109 ?auto_783110 ) ( ON ?auto_783108 ?auto_783109 ) ( ON ?auto_783107 ?auto_783108 ) ( CLEAR ?auto_783105 ) ( ON ?auto_783106 ?auto_783107 ) ( CLEAR ?auto_783106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_783099 ?auto_783100 ?auto_783101 ?auto_783102 ?auto_783103 ?auto_783104 ?auto_783105 ?auto_783106 )
      ( MAKE-18PILE ?auto_783099 ?auto_783100 ?auto_783101 ?auto_783102 ?auto_783103 ?auto_783104 ?auto_783105 ?auto_783106 ?auto_783107 ?auto_783108 ?auto_783109 ?auto_783110 ?auto_783111 ?auto_783112 ?auto_783113 ?auto_783114 ?auto_783115 ?auto_783116 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_783135 - BLOCK
      ?auto_783136 - BLOCK
      ?auto_783137 - BLOCK
      ?auto_783138 - BLOCK
      ?auto_783139 - BLOCK
      ?auto_783140 - BLOCK
      ?auto_783141 - BLOCK
      ?auto_783142 - BLOCK
      ?auto_783143 - BLOCK
      ?auto_783144 - BLOCK
      ?auto_783145 - BLOCK
      ?auto_783146 - BLOCK
      ?auto_783147 - BLOCK
      ?auto_783148 - BLOCK
      ?auto_783149 - BLOCK
      ?auto_783150 - BLOCK
      ?auto_783151 - BLOCK
      ?auto_783152 - BLOCK
    )
    :vars
    (
      ?auto_783153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_783152 ?auto_783153 ) ( ON-TABLE ?auto_783135 ) ( ON ?auto_783136 ?auto_783135 ) ( ON ?auto_783137 ?auto_783136 ) ( ON ?auto_783138 ?auto_783137 ) ( ON ?auto_783139 ?auto_783138 ) ( ON ?auto_783140 ?auto_783139 ) ( not ( = ?auto_783135 ?auto_783136 ) ) ( not ( = ?auto_783135 ?auto_783137 ) ) ( not ( = ?auto_783135 ?auto_783138 ) ) ( not ( = ?auto_783135 ?auto_783139 ) ) ( not ( = ?auto_783135 ?auto_783140 ) ) ( not ( = ?auto_783135 ?auto_783141 ) ) ( not ( = ?auto_783135 ?auto_783142 ) ) ( not ( = ?auto_783135 ?auto_783143 ) ) ( not ( = ?auto_783135 ?auto_783144 ) ) ( not ( = ?auto_783135 ?auto_783145 ) ) ( not ( = ?auto_783135 ?auto_783146 ) ) ( not ( = ?auto_783135 ?auto_783147 ) ) ( not ( = ?auto_783135 ?auto_783148 ) ) ( not ( = ?auto_783135 ?auto_783149 ) ) ( not ( = ?auto_783135 ?auto_783150 ) ) ( not ( = ?auto_783135 ?auto_783151 ) ) ( not ( = ?auto_783135 ?auto_783152 ) ) ( not ( = ?auto_783135 ?auto_783153 ) ) ( not ( = ?auto_783136 ?auto_783137 ) ) ( not ( = ?auto_783136 ?auto_783138 ) ) ( not ( = ?auto_783136 ?auto_783139 ) ) ( not ( = ?auto_783136 ?auto_783140 ) ) ( not ( = ?auto_783136 ?auto_783141 ) ) ( not ( = ?auto_783136 ?auto_783142 ) ) ( not ( = ?auto_783136 ?auto_783143 ) ) ( not ( = ?auto_783136 ?auto_783144 ) ) ( not ( = ?auto_783136 ?auto_783145 ) ) ( not ( = ?auto_783136 ?auto_783146 ) ) ( not ( = ?auto_783136 ?auto_783147 ) ) ( not ( = ?auto_783136 ?auto_783148 ) ) ( not ( = ?auto_783136 ?auto_783149 ) ) ( not ( = ?auto_783136 ?auto_783150 ) ) ( not ( = ?auto_783136 ?auto_783151 ) ) ( not ( = ?auto_783136 ?auto_783152 ) ) ( not ( = ?auto_783136 ?auto_783153 ) ) ( not ( = ?auto_783137 ?auto_783138 ) ) ( not ( = ?auto_783137 ?auto_783139 ) ) ( not ( = ?auto_783137 ?auto_783140 ) ) ( not ( = ?auto_783137 ?auto_783141 ) ) ( not ( = ?auto_783137 ?auto_783142 ) ) ( not ( = ?auto_783137 ?auto_783143 ) ) ( not ( = ?auto_783137 ?auto_783144 ) ) ( not ( = ?auto_783137 ?auto_783145 ) ) ( not ( = ?auto_783137 ?auto_783146 ) ) ( not ( = ?auto_783137 ?auto_783147 ) ) ( not ( = ?auto_783137 ?auto_783148 ) ) ( not ( = ?auto_783137 ?auto_783149 ) ) ( not ( = ?auto_783137 ?auto_783150 ) ) ( not ( = ?auto_783137 ?auto_783151 ) ) ( not ( = ?auto_783137 ?auto_783152 ) ) ( not ( = ?auto_783137 ?auto_783153 ) ) ( not ( = ?auto_783138 ?auto_783139 ) ) ( not ( = ?auto_783138 ?auto_783140 ) ) ( not ( = ?auto_783138 ?auto_783141 ) ) ( not ( = ?auto_783138 ?auto_783142 ) ) ( not ( = ?auto_783138 ?auto_783143 ) ) ( not ( = ?auto_783138 ?auto_783144 ) ) ( not ( = ?auto_783138 ?auto_783145 ) ) ( not ( = ?auto_783138 ?auto_783146 ) ) ( not ( = ?auto_783138 ?auto_783147 ) ) ( not ( = ?auto_783138 ?auto_783148 ) ) ( not ( = ?auto_783138 ?auto_783149 ) ) ( not ( = ?auto_783138 ?auto_783150 ) ) ( not ( = ?auto_783138 ?auto_783151 ) ) ( not ( = ?auto_783138 ?auto_783152 ) ) ( not ( = ?auto_783138 ?auto_783153 ) ) ( not ( = ?auto_783139 ?auto_783140 ) ) ( not ( = ?auto_783139 ?auto_783141 ) ) ( not ( = ?auto_783139 ?auto_783142 ) ) ( not ( = ?auto_783139 ?auto_783143 ) ) ( not ( = ?auto_783139 ?auto_783144 ) ) ( not ( = ?auto_783139 ?auto_783145 ) ) ( not ( = ?auto_783139 ?auto_783146 ) ) ( not ( = ?auto_783139 ?auto_783147 ) ) ( not ( = ?auto_783139 ?auto_783148 ) ) ( not ( = ?auto_783139 ?auto_783149 ) ) ( not ( = ?auto_783139 ?auto_783150 ) ) ( not ( = ?auto_783139 ?auto_783151 ) ) ( not ( = ?auto_783139 ?auto_783152 ) ) ( not ( = ?auto_783139 ?auto_783153 ) ) ( not ( = ?auto_783140 ?auto_783141 ) ) ( not ( = ?auto_783140 ?auto_783142 ) ) ( not ( = ?auto_783140 ?auto_783143 ) ) ( not ( = ?auto_783140 ?auto_783144 ) ) ( not ( = ?auto_783140 ?auto_783145 ) ) ( not ( = ?auto_783140 ?auto_783146 ) ) ( not ( = ?auto_783140 ?auto_783147 ) ) ( not ( = ?auto_783140 ?auto_783148 ) ) ( not ( = ?auto_783140 ?auto_783149 ) ) ( not ( = ?auto_783140 ?auto_783150 ) ) ( not ( = ?auto_783140 ?auto_783151 ) ) ( not ( = ?auto_783140 ?auto_783152 ) ) ( not ( = ?auto_783140 ?auto_783153 ) ) ( not ( = ?auto_783141 ?auto_783142 ) ) ( not ( = ?auto_783141 ?auto_783143 ) ) ( not ( = ?auto_783141 ?auto_783144 ) ) ( not ( = ?auto_783141 ?auto_783145 ) ) ( not ( = ?auto_783141 ?auto_783146 ) ) ( not ( = ?auto_783141 ?auto_783147 ) ) ( not ( = ?auto_783141 ?auto_783148 ) ) ( not ( = ?auto_783141 ?auto_783149 ) ) ( not ( = ?auto_783141 ?auto_783150 ) ) ( not ( = ?auto_783141 ?auto_783151 ) ) ( not ( = ?auto_783141 ?auto_783152 ) ) ( not ( = ?auto_783141 ?auto_783153 ) ) ( not ( = ?auto_783142 ?auto_783143 ) ) ( not ( = ?auto_783142 ?auto_783144 ) ) ( not ( = ?auto_783142 ?auto_783145 ) ) ( not ( = ?auto_783142 ?auto_783146 ) ) ( not ( = ?auto_783142 ?auto_783147 ) ) ( not ( = ?auto_783142 ?auto_783148 ) ) ( not ( = ?auto_783142 ?auto_783149 ) ) ( not ( = ?auto_783142 ?auto_783150 ) ) ( not ( = ?auto_783142 ?auto_783151 ) ) ( not ( = ?auto_783142 ?auto_783152 ) ) ( not ( = ?auto_783142 ?auto_783153 ) ) ( not ( = ?auto_783143 ?auto_783144 ) ) ( not ( = ?auto_783143 ?auto_783145 ) ) ( not ( = ?auto_783143 ?auto_783146 ) ) ( not ( = ?auto_783143 ?auto_783147 ) ) ( not ( = ?auto_783143 ?auto_783148 ) ) ( not ( = ?auto_783143 ?auto_783149 ) ) ( not ( = ?auto_783143 ?auto_783150 ) ) ( not ( = ?auto_783143 ?auto_783151 ) ) ( not ( = ?auto_783143 ?auto_783152 ) ) ( not ( = ?auto_783143 ?auto_783153 ) ) ( not ( = ?auto_783144 ?auto_783145 ) ) ( not ( = ?auto_783144 ?auto_783146 ) ) ( not ( = ?auto_783144 ?auto_783147 ) ) ( not ( = ?auto_783144 ?auto_783148 ) ) ( not ( = ?auto_783144 ?auto_783149 ) ) ( not ( = ?auto_783144 ?auto_783150 ) ) ( not ( = ?auto_783144 ?auto_783151 ) ) ( not ( = ?auto_783144 ?auto_783152 ) ) ( not ( = ?auto_783144 ?auto_783153 ) ) ( not ( = ?auto_783145 ?auto_783146 ) ) ( not ( = ?auto_783145 ?auto_783147 ) ) ( not ( = ?auto_783145 ?auto_783148 ) ) ( not ( = ?auto_783145 ?auto_783149 ) ) ( not ( = ?auto_783145 ?auto_783150 ) ) ( not ( = ?auto_783145 ?auto_783151 ) ) ( not ( = ?auto_783145 ?auto_783152 ) ) ( not ( = ?auto_783145 ?auto_783153 ) ) ( not ( = ?auto_783146 ?auto_783147 ) ) ( not ( = ?auto_783146 ?auto_783148 ) ) ( not ( = ?auto_783146 ?auto_783149 ) ) ( not ( = ?auto_783146 ?auto_783150 ) ) ( not ( = ?auto_783146 ?auto_783151 ) ) ( not ( = ?auto_783146 ?auto_783152 ) ) ( not ( = ?auto_783146 ?auto_783153 ) ) ( not ( = ?auto_783147 ?auto_783148 ) ) ( not ( = ?auto_783147 ?auto_783149 ) ) ( not ( = ?auto_783147 ?auto_783150 ) ) ( not ( = ?auto_783147 ?auto_783151 ) ) ( not ( = ?auto_783147 ?auto_783152 ) ) ( not ( = ?auto_783147 ?auto_783153 ) ) ( not ( = ?auto_783148 ?auto_783149 ) ) ( not ( = ?auto_783148 ?auto_783150 ) ) ( not ( = ?auto_783148 ?auto_783151 ) ) ( not ( = ?auto_783148 ?auto_783152 ) ) ( not ( = ?auto_783148 ?auto_783153 ) ) ( not ( = ?auto_783149 ?auto_783150 ) ) ( not ( = ?auto_783149 ?auto_783151 ) ) ( not ( = ?auto_783149 ?auto_783152 ) ) ( not ( = ?auto_783149 ?auto_783153 ) ) ( not ( = ?auto_783150 ?auto_783151 ) ) ( not ( = ?auto_783150 ?auto_783152 ) ) ( not ( = ?auto_783150 ?auto_783153 ) ) ( not ( = ?auto_783151 ?auto_783152 ) ) ( not ( = ?auto_783151 ?auto_783153 ) ) ( not ( = ?auto_783152 ?auto_783153 ) ) ( ON ?auto_783151 ?auto_783152 ) ( ON ?auto_783150 ?auto_783151 ) ( ON ?auto_783149 ?auto_783150 ) ( ON ?auto_783148 ?auto_783149 ) ( ON ?auto_783147 ?auto_783148 ) ( ON ?auto_783146 ?auto_783147 ) ( ON ?auto_783145 ?auto_783146 ) ( ON ?auto_783144 ?auto_783145 ) ( ON ?auto_783143 ?auto_783144 ) ( ON ?auto_783142 ?auto_783143 ) ( CLEAR ?auto_783140 ) ( ON ?auto_783141 ?auto_783142 ) ( CLEAR ?auto_783141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_783135 ?auto_783136 ?auto_783137 ?auto_783138 ?auto_783139 ?auto_783140 ?auto_783141 )
      ( MAKE-18PILE ?auto_783135 ?auto_783136 ?auto_783137 ?auto_783138 ?auto_783139 ?auto_783140 ?auto_783141 ?auto_783142 ?auto_783143 ?auto_783144 ?auto_783145 ?auto_783146 ?auto_783147 ?auto_783148 ?auto_783149 ?auto_783150 ?auto_783151 ?auto_783152 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_783172 - BLOCK
      ?auto_783173 - BLOCK
      ?auto_783174 - BLOCK
      ?auto_783175 - BLOCK
      ?auto_783176 - BLOCK
      ?auto_783177 - BLOCK
      ?auto_783178 - BLOCK
      ?auto_783179 - BLOCK
      ?auto_783180 - BLOCK
      ?auto_783181 - BLOCK
      ?auto_783182 - BLOCK
      ?auto_783183 - BLOCK
      ?auto_783184 - BLOCK
      ?auto_783185 - BLOCK
      ?auto_783186 - BLOCK
      ?auto_783187 - BLOCK
      ?auto_783188 - BLOCK
      ?auto_783189 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_783189 ) ( ON-TABLE ?auto_783172 ) ( ON ?auto_783173 ?auto_783172 ) ( ON ?auto_783174 ?auto_783173 ) ( ON ?auto_783175 ?auto_783174 ) ( ON ?auto_783176 ?auto_783175 ) ( ON ?auto_783177 ?auto_783176 ) ( not ( = ?auto_783172 ?auto_783173 ) ) ( not ( = ?auto_783172 ?auto_783174 ) ) ( not ( = ?auto_783172 ?auto_783175 ) ) ( not ( = ?auto_783172 ?auto_783176 ) ) ( not ( = ?auto_783172 ?auto_783177 ) ) ( not ( = ?auto_783172 ?auto_783178 ) ) ( not ( = ?auto_783172 ?auto_783179 ) ) ( not ( = ?auto_783172 ?auto_783180 ) ) ( not ( = ?auto_783172 ?auto_783181 ) ) ( not ( = ?auto_783172 ?auto_783182 ) ) ( not ( = ?auto_783172 ?auto_783183 ) ) ( not ( = ?auto_783172 ?auto_783184 ) ) ( not ( = ?auto_783172 ?auto_783185 ) ) ( not ( = ?auto_783172 ?auto_783186 ) ) ( not ( = ?auto_783172 ?auto_783187 ) ) ( not ( = ?auto_783172 ?auto_783188 ) ) ( not ( = ?auto_783172 ?auto_783189 ) ) ( not ( = ?auto_783173 ?auto_783174 ) ) ( not ( = ?auto_783173 ?auto_783175 ) ) ( not ( = ?auto_783173 ?auto_783176 ) ) ( not ( = ?auto_783173 ?auto_783177 ) ) ( not ( = ?auto_783173 ?auto_783178 ) ) ( not ( = ?auto_783173 ?auto_783179 ) ) ( not ( = ?auto_783173 ?auto_783180 ) ) ( not ( = ?auto_783173 ?auto_783181 ) ) ( not ( = ?auto_783173 ?auto_783182 ) ) ( not ( = ?auto_783173 ?auto_783183 ) ) ( not ( = ?auto_783173 ?auto_783184 ) ) ( not ( = ?auto_783173 ?auto_783185 ) ) ( not ( = ?auto_783173 ?auto_783186 ) ) ( not ( = ?auto_783173 ?auto_783187 ) ) ( not ( = ?auto_783173 ?auto_783188 ) ) ( not ( = ?auto_783173 ?auto_783189 ) ) ( not ( = ?auto_783174 ?auto_783175 ) ) ( not ( = ?auto_783174 ?auto_783176 ) ) ( not ( = ?auto_783174 ?auto_783177 ) ) ( not ( = ?auto_783174 ?auto_783178 ) ) ( not ( = ?auto_783174 ?auto_783179 ) ) ( not ( = ?auto_783174 ?auto_783180 ) ) ( not ( = ?auto_783174 ?auto_783181 ) ) ( not ( = ?auto_783174 ?auto_783182 ) ) ( not ( = ?auto_783174 ?auto_783183 ) ) ( not ( = ?auto_783174 ?auto_783184 ) ) ( not ( = ?auto_783174 ?auto_783185 ) ) ( not ( = ?auto_783174 ?auto_783186 ) ) ( not ( = ?auto_783174 ?auto_783187 ) ) ( not ( = ?auto_783174 ?auto_783188 ) ) ( not ( = ?auto_783174 ?auto_783189 ) ) ( not ( = ?auto_783175 ?auto_783176 ) ) ( not ( = ?auto_783175 ?auto_783177 ) ) ( not ( = ?auto_783175 ?auto_783178 ) ) ( not ( = ?auto_783175 ?auto_783179 ) ) ( not ( = ?auto_783175 ?auto_783180 ) ) ( not ( = ?auto_783175 ?auto_783181 ) ) ( not ( = ?auto_783175 ?auto_783182 ) ) ( not ( = ?auto_783175 ?auto_783183 ) ) ( not ( = ?auto_783175 ?auto_783184 ) ) ( not ( = ?auto_783175 ?auto_783185 ) ) ( not ( = ?auto_783175 ?auto_783186 ) ) ( not ( = ?auto_783175 ?auto_783187 ) ) ( not ( = ?auto_783175 ?auto_783188 ) ) ( not ( = ?auto_783175 ?auto_783189 ) ) ( not ( = ?auto_783176 ?auto_783177 ) ) ( not ( = ?auto_783176 ?auto_783178 ) ) ( not ( = ?auto_783176 ?auto_783179 ) ) ( not ( = ?auto_783176 ?auto_783180 ) ) ( not ( = ?auto_783176 ?auto_783181 ) ) ( not ( = ?auto_783176 ?auto_783182 ) ) ( not ( = ?auto_783176 ?auto_783183 ) ) ( not ( = ?auto_783176 ?auto_783184 ) ) ( not ( = ?auto_783176 ?auto_783185 ) ) ( not ( = ?auto_783176 ?auto_783186 ) ) ( not ( = ?auto_783176 ?auto_783187 ) ) ( not ( = ?auto_783176 ?auto_783188 ) ) ( not ( = ?auto_783176 ?auto_783189 ) ) ( not ( = ?auto_783177 ?auto_783178 ) ) ( not ( = ?auto_783177 ?auto_783179 ) ) ( not ( = ?auto_783177 ?auto_783180 ) ) ( not ( = ?auto_783177 ?auto_783181 ) ) ( not ( = ?auto_783177 ?auto_783182 ) ) ( not ( = ?auto_783177 ?auto_783183 ) ) ( not ( = ?auto_783177 ?auto_783184 ) ) ( not ( = ?auto_783177 ?auto_783185 ) ) ( not ( = ?auto_783177 ?auto_783186 ) ) ( not ( = ?auto_783177 ?auto_783187 ) ) ( not ( = ?auto_783177 ?auto_783188 ) ) ( not ( = ?auto_783177 ?auto_783189 ) ) ( not ( = ?auto_783178 ?auto_783179 ) ) ( not ( = ?auto_783178 ?auto_783180 ) ) ( not ( = ?auto_783178 ?auto_783181 ) ) ( not ( = ?auto_783178 ?auto_783182 ) ) ( not ( = ?auto_783178 ?auto_783183 ) ) ( not ( = ?auto_783178 ?auto_783184 ) ) ( not ( = ?auto_783178 ?auto_783185 ) ) ( not ( = ?auto_783178 ?auto_783186 ) ) ( not ( = ?auto_783178 ?auto_783187 ) ) ( not ( = ?auto_783178 ?auto_783188 ) ) ( not ( = ?auto_783178 ?auto_783189 ) ) ( not ( = ?auto_783179 ?auto_783180 ) ) ( not ( = ?auto_783179 ?auto_783181 ) ) ( not ( = ?auto_783179 ?auto_783182 ) ) ( not ( = ?auto_783179 ?auto_783183 ) ) ( not ( = ?auto_783179 ?auto_783184 ) ) ( not ( = ?auto_783179 ?auto_783185 ) ) ( not ( = ?auto_783179 ?auto_783186 ) ) ( not ( = ?auto_783179 ?auto_783187 ) ) ( not ( = ?auto_783179 ?auto_783188 ) ) ( not ( = ?auto_783179 ?auto_783189 ) ) ( not ( = ?auto_783180 ?auto_783181 ) ) ( not ( = ?auto_783180 ?auto_783182 ) ) ( not ( = ?auto_783180 ?auto_783183 ) ) ( not ( = ?auto_783180 ?auto_783184 ) ) ( not ( = ?auto_783180 ?auto_783185 ) ) ( not ( = ?auto_783180 ?auto_783186 ) ) ( not ( = ?auto_783180 ?auto_783187 ) ) ( not ( = ?auto_783180 ?auto_783188 ) ) ( not ( = ?auto_783180 ?auto_783189 ) ) ( not ( = ?auto_783181 ?auto_783182 ) ) ( not ( = ?auto_783181 ?auto_783183 ) ) ( not ( = ?auto_783181 ?auto_783184 ) ) ( not ( = ?auto_783181 ?auto_783185 ) ) ( not ( = ?auto_783181 ?auto_783186 ) ) ( not ( = ?auto_783181 ?auto_783187 ) ) ( not ( = ?auto_783181 ?auto_783188 ) ) ( not ( = ?auto_783181 ?auto_783189 ) ) ( not ( = ?auto_783182 ?auto_783183 ) ) ( not ( = ?auto_783182 ?auto_783184 ) ) ( not ( = ?auto_783182 ?auto_783185 ) ) ( not ( = ?auto_783182 ?auto_783186 ) ) ( not ( = ?auto_783182 ?auto_783187 ) ) ( not ( = ?auto_783182 ?auto_783188 ) ) ( not ( = ?auto_783182 ?auto_783189 ) ) ( not ( = ?auto_783183 ?auto_783184 ) ) ( not ( = ?auto_783183 ?auto_783185 ) ) ( not ( = ?auto_783183 ?auto_783186 ) ) ( not ( = ?auto_783183 ?auto_783187 ) ) ( not ( = ?auto_783183 ?auto_783188 ) ) ( not ( = ?auto_783183 ?auto_783189 ) ) ( not ( = ?auto_783184 ?auto_783185 ) ) ( not ( = ?auto_783184 ?auto_783186 ) ) ( not ( = ?auto_783184 ?auto_783187 ) ) ( not ( = ?auto_783184 ?auto_783188 ) ) ( not ( = ?auto_783184 ?auto_783189 ) ) ( not ( = ?auto_783185 ?auto_783186 ) ) ( not ( = ?auto_783185 ?auto_783187 ) ) ( not ( = ?auto_783185 ?auto_783188 ) ) ( not ( = ?auto_783185 ?auto_783189 ) ) ( not ( = ?auto_783186 ?auto_783187 ) ) ( not ( = ?auto_783186 ?auto_783188 ) ) ( not ( = ?auto_783186 ?auto_783189 ) ) ( not ( = ?auto_783187 ?auto_783188 ) ) ( not ( = ?auto_783187 ?auto_783189 ) ) ( not ( = ?auto_783188 ?auto_783189 ) ) ( ON ?auto_783188 ?auto_783189 ) ( ON ?auto_783187 ?auto_783188 ) ( ON ?auto_783186 ?auto_783187 ) ( ON ?auto_783185 ?auto_783186 ) ( ON ?auto_783184 ?auto_783185 ) ( ON ?auto_783183 ?auto_783184 ) ( ON ?auto_783182 ?auto_783183 ) ( ON ?auto_783181 ?auto_783182 ) ( ON ?auto_783180 ?auto_783181 ) ( ON ?auto_783179 ?auto_783180 ) ( CLEAR ?auto_783177 ) ( ON ?auto_783178 ?auto_783179 ) ( CLEAR ?auto_783178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_783172 ?auto_783173 ?auto_783174 ?auto_783175 ?auto_783176 ?auto_783177 ?auto_783178 )
      ( MAKE-18PILE ?auto_783172 ?auto_783173 ?auto_783174 ?auto_783175 ?auto_783176 ?auto_783177 ?auto_783178 ?auto_783179 ?auto_783180 ?auto_783181 ?auto_783182 ?auto_783183 ?auto_783184 ?auto_783185 ?auto_783186 ?auto_783187 ?auto_783188 ?auto_783189 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_783208 - BLOCK
      ?auto_783209 - BLOCK
      ?auto_783210 - BLOCK
      ?auto_783211 - BLOCK
      ?auto_783212 - BLOCK
      ?auto_783213 - BLOCK
      ?auto_783214 - BLOCK
      ?auto_783215 - BLOCK
      ?auto_783216 - BLOCK
      ?auto_783217 - BLOCK
      ?auto_783218 - BLOCK
      ?auto_783219 - BLOCK
      ?auto_783220 - BLOCK
      ?auto_783221 - BLOCK
      ?auto_783222 - BLOCK
      ?auto_783223 - BLOCK
      ?auto_783224 - BLOCK
      ?auto_783225 - BLOCK
    )
    :vars
    (
      ?auto_783226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_783225 ?auto_783226 ) ( ON-TABLE ?auto_783208 ) ( ON ?auto_783209 ?auto_783208 ) ( ON ?auto_783210 ?auto_783209 ) ( ON ?auto_783211 ?auto_783210 ) ( ON ?auto_783212 ?auto_783211 ) ( not ( = ?auto_783208 ?auto_783209 ) ) ( not ( = ?auto_783208 ?auto_783210 ) ) ( not ( = ?auto_783208 ?auto_783211 ) ) ( not ( = ?auto_783208 ?auto_783212 ) ) ( not ( = ?auto_783208 ?auto_783213 ) ) ( not ( = ?auto_783208 ?auto_783214 ) ) ( not ( = ?auto_783208 ?auto_783215 ) ) ( not ( = ?auto_783208 ?auto_783216 ) ) ( not ( = ?auto_783208 ?auto_783217 ) ) ( not ( = ?auto_783208 ?auto_783218 ) ) ( not ( = ?auto_783208 ?auto_783219 ) ) ( not ( = ?auto_783208 ?auto_783220 ) ) ( not ( = ?auto_783208 ?auto_783221 ) ) ( not ( = ?auto_783208 ?auto_783222 ) ) ( not ( = ?auto_783208 ?auto_783223 ) ) ( not ( = ?auto_783208 ?auto_783224 ) ) ( not ( = ?auto_783208 ?auto_783225 ) ) ( not ( = ?auto_783208 ?auto_783226 ) ) ( not ( = ?auto_783209 ?auto_783210 ) ) ( not ( = ?auto_783209 ?auto_783211 ) ) ( not ( = ?auto_783209 ?auto_783212 ) ) ( not ( = ?auto_783209 ?auto_783213 ) ) ( not ( = ?auto_783209 ?auto_783214 ) ) ( not ( = ?auto_783209 ?auto_783215 ) ) ( not ( = ?auto_783209 ?auto_783216 ) ) ( not ( = ?auto_783209 ?auto_783217 ) ) ( not ( = ?auto_783209 ?auto_783218 ) ) ( not ( = ?auto_783209 ?auto_783219 ) ) ( not ( = ?auto_783209 ?auto_783220 ) ) ( not ( = ?auto_783209 ?auto_783221 ) ) ( not ( = ?auto_783209 ?auto_783222 ) ) ( not ( = ?auto_783209 ?auto_783223 ) ) ( not ( = ?auto_783209 ?auto_783224 ) ) ( not ( = ?auto_783209 ?auto_783225 ) ) ( not ( = ?auto_783209 ?auto_783226 ) ) ( not ( = ?auto_783210 ?auto_783211 ) ) ( not ( = ?auto_783210 ?auto_783212 ) ) ( not ( = ?auto_783210 ?auto_783213 ) ) ( not ( = ?auto_783210 ?auto_783214 ) ) ( not ( = ?auto_783210 ?auto_783215 ) ) ( not ( = ?auto_783210 ?auto_783216 ) ) ( not ( = ?auto_783210 ?auto_783217 ) ) ( not ( = ?auto_783210 ?auto_783218 ) ) ( not ( = ?auto_783210 ?auto_783219 ) ) ( not ( = ?auto_783210 ?auto_783220 ) ) ( not ( = ?auto_783210 ?auto_783221 ) ) ( not ( = ?auto_783210 ?auto_783222 ) ) ( not ( = ?auto_783210 ?auto_783223 ) ) ( not ( = ?auto_783210 ?auto_783224 ) ) ( not ( = ?auto_783210 ?auto_783225 ) ) ( not ( = ?auto_783210 ?auto_783226 ) ) ( not ( = ?auto_783211 ?auto_783212 ) ) ( not ( = ?auto_783211 ?auto_783213 ) ) ( not ( = ?auto_783211 ?auto_783214 ) ) ( not ( = ?auto_783211 ?auto_783215 ) ) ( not ( = ?auto_783211 ?auto_783216 ) ) ( not ( = ?auto_783211 ?auto_783217 ) ) ( not ( = ?auto_783211 ?auto_783218 ) ) ( not ( = ?auto_783211 ?auto_783219 ) ) ( not ( = ?auto_783211 ?auto_783220 ) ) ( not ( = ?auto_783211 ?auto_783221 ) ) ( not ( = ?auto_783211 ?auto_783222 ) ) ( not ( = ?auto_783211 ?auto_783223 ) ) ( not ( = ?auto_783211 ?auto_783224 ) ) ( not ( = ?auto_783211 ?auto_783225 ) ) ( not ( = ?auto_783211 ?auto_783226 ) ) ( not ( = ?auto_783212 ?auto_783213 ) ) ( not ( = ?auto_783212 ?auto_783214 ) ) ( not ( = ?auto_783212 ?auto_783215 ) ) ( not ( = ?auto_783212 ?auto_783216 ) ) ( not ( = ?auto_783212 ?auto_783217 ) ) ( not ( = ?auto_783212 ?auto_783218 ) ) ( not ( = ?auto_783212 ?auto_783219 ) ) ( not ( = ?auto_783212 ?auto_783220 ) ) ( not ( = ?auto_783212 ?auto_783221 ) ) ( not ( = ?auto_783212 ?auto_783222 ) ) ( not ( = ?auto_783212 ?auto_783223 ) ) ( not ( = ?auto_783212 ?auto_783224 ) ) ( not ( = ?auto_783212 ?auto_783225 ) ) ( not ( = ?auto_783212 ?auto_783226 ) ) ( not ( = ?auto_783213 ?auto_783214 ) ) ( not ( = ?auto_783213 ?auto_783215 ) ) ( not ( = ?auto_783213 ?auto_783216 ) ) ( not ( = ?auto_783213 ?auto_783217 ) ) ( not ( = ?auto_783213 ?auto_783218 ) ) ( not ( = ?auto_783213 ?auto_783219 ) ) ( not ( = ?auto_783213 ?auto_783220 ) ) ( not ( = ?auto_783213 ?auto_783221 ) ) ( not ( = ?auto_783213 ?auto_783222 ) ) ( not ( = ?auto_783213 ?auto_783223 ) ) ( not ( = ?auto_783213 ?auto_783224 ) ) ( not ( = ?auto_783213 ?auto_783225 ) ) ( not ( = ?auto_783213 ?auto_783226 ) ) ( not ( = ?auto_783214 ?auto_783215 ) ) ( not ( = ?auto_783214 ?auto_783216 ) ) ( not ( = ?auto_783214 ?auto_783217 ) ) ( not ( = ?auto_783214 ?auto_783218 ) ) ( not ( = ?auto_783214 ?auto_783219 ) ) ( not ( = ?auto_783214 ?auto_783220 ) ) ( not ( = ?auto_783214 ?auto_783221 ) ) ( not ( = ?auto_783214 ?auto_783222 ) ) ( not ( = ?auto_783214 ?auto_783223 ) ) ( not ( = ?auto_783214 ?auto_783224 ) ) ( not ( = ?auto_783214 ?auto_783225 ) ) ( not ( = ?auto_783214 ?auto_783226 ) ) ( not ( = ?auto_783215 ?auto_783216 ) ) ( not ( = ?auto_783215 ?auto_783217 ) ) ( not ( = ?auto_783215 ?auto_783218 ) ) ( not ( = ?auto_783215 ?auto_783219 ) ) ( not ( = ?auto_783215 ?auto_783220 ) ) ( not ( = ?auto_783215 ?auto_783221 ) ) ( not ( = ?auto_783215 ?auto_783222 ) ) ( not ( = ?auto_783215 ?auto_783223 ) ) ( not ( = ?auto_783215 ?auto_783224 ) ) ( not ( = ?auto_783215 ?auto_783225 ) ) ( not ( = ?auto_783215 ?auto_783226 ) ) ( not ( = ?auto_783216 ?auto_783217 ) ) ( not ( = ?auto_783216 ?auto_783218 ) ) ( not ( = ?auto_783216 ?auto_783219 ) ) ( not ( = ?auto_783216 ?auto_783220 ) ) ( not ( = ?auto_783216 ?auto_783221 ) ) ( not ( = ?auto_783216 ?auto_783222 ) ) ( not ( = ?auto_783216 ?auto_783223 ) ) ( not ( = ?auto_783216 ?auto_783224 ) ) ( not ( = ?auto_783216 ?auto_783225 ) ) ( not ( = ?auto_783216 ?auto_783226 ) ) ( not ( = ?auto_783217 ?auto_783218 ) ) ( not ( = ?auto_783217 ?auto_783219 ) ) ( not ( = ?auto_783217 ?auto_783220 ) ) ( not ( = ?auto_783217 ?auto_783221 ) ) ( not ( = ?auto_783217 ?auto_783222 ) ) ( not ( = ?auto_783217 ?auto_783223 ) ) ( not ( = ?auto_783217 ?auto_783224 ) ) ( not ( = ?auto_783217 ?auto_783225 ) ) ( not ( = ?auto_783217 ?auto_783226 ) ) ( not ( = ?auto_783218 ?auto_783219 ) ) ( not ( = ?auto_783218 ?auto_783220 ) ) ( not ( = ?auto_783218 ?auto_783221 ) ) ( not ( = ?auto_783218 ?auto_783222 ) ) ( not ( = ?auto_783218 ?auto_783223 ) ) ( not ( = ?auto_783218 ?auto_783224 ) ) ( not ( = ?auto_783218 ?auto_783225 ) ) ( not ( = ?auto_783218 ?auto_783226 ) ) ( not ( = ?auto_783219 ?auto_783220 ) ) ( not ( = ?auto_783219 ?auto_783221 ) ) ( not ( = ?auto_783219 ?auto_783222 ) ) ( not ( = ?auto_783219 ?auto_783223 ) ) ( not ( = ?auto_783219 ?auto_783224 ) ) ( not ( = ?auto_783219 ?auto_783225 ) ) ( not ( = ?auto_783219 ?auto_783226 ) ) ( not ( = ?auto_783220 ?auto_783221 ) ) ( not ( = ?auto_783220 ?auto_783222 ) ) ( not ( = ?auto_783220 ?auto_783223 ) ) ( not ( = ?auto_783220 ?auto_783224 ) ) ( not ( = ?auto_783220 ?auto_783225 ) ) ( not ( = ?auto_783220 ?auto_783226 ) ) ( not ( = ?auto_783221 ?auto_783222 ) ) ( not ( = ?auto_783221 ?auto_783223 ) ) ( not ( = ?auto_783221 ?auto_783224 ) ) ( not ( = ?auto_783221 ?auto_783225 ) ) ( not ( = ?auto_783221 ?auto_783226 ) ) ( not ( = ?auto_783222 ?auto_783223 ) ) ( not ( = ?auto_783222 ?auto_783224 ) ) ( not ( = ?auto_783222 ?auto_783225 ) ) ( not ( = ?auto_783222 ?auto_783226 ) ) ( not ( = ?auto_783223 ?auto_783224 ) ) ( not ( = ?auto_783223 ?auto_783225 ) ) ( not ( = ?auto_783223 ?auto_783226 ) ) ( not ( = ?auto_783224 ?auto_783225 ) ) ( not ( = ?auto_783224 ?auto_783226 ) ) ( not ( = ?auto_783225 ?auto_783226 ) ) ( ON ?auto_783224 ?auto_783225 ) ( ON ?auto_783223 ?auto_783224 ) ( ON ?auto_783222 ?auto_783223 ) ( ON ?auto_783221 ?auto_783222 ) ( ON ?auto_783220 ?auto_783221 ) ( ON ?auto_783219 ?auto_783220 ) ( ON ?auto_783218 ?auto_783219 ) ( ON ?auto_783217 ?auto_783218 ) ( ON ?auto_783216 ?auto_783217 ) ( ON ?auto_783215 ?auto_783216 ) ( ON ?auto_783214 ?auto_783215 ) ( CLEAR ?auto_783212 ) ( ON ?auto_783213 ?auto_783214 ) ( CLEAR ?auto_783213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_783208 ?auto_783209 ?auto_783210 ?auto_783211 ?auto_783212 ?auto_783213 )
      ( MAKE-18PILE ?auto_783208 ?auto_783209 ?auto_783210 ?auto_783211 ?auto_783212 ?auto_783213 ?auto_783214 ?auto_783215 ?auto_783216 ?auto_783217 ?auto_783218 ?auto_783219 ?auto_783220 ?auto_783221 ?auto_783222 ?auto_783223 ?auto_783224 ?auto_783225 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_783245 - BLOCK
      ?auto_783246 - BLOCK
      ?auto_783247 - BLOCK
      ?auto_783248 - BLOCK
      ?auto_783249 - BLOCK
      ?auto_783250 - BLOCK
      ?auto_783251 - BLOCK
      ?auto_783252 - BLOCK
      ?auto_783253 - BLOCK
      ?auto_783254 - BLOCK
      ?auto_783255 - BLOCK
      ?auto_783256 - BLOCK
      ?auto_783257 - BLOCK
      ?auto_783258 - BLOCK
      ?auto_783259 - BLOCK
      ?auto_783260 - BLOCK
      ?auto_783261 - BLOCK
      ?auto_783262 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_783262 ) ( ON-TABLE ?auto_783245 ) ( ON ?auto_783246 ?auto_783245 ) ( ON ?auto_783247 ?auto_783246 ) ( ON ?auto_783248 ?auto_783247 ) ( ON ?auto_783249 ?auto_783248 ) ( not ( = ?auto_783245 ?auto_783246 ) ) ( not ( = ?auto_783245 ?auto_783247 ) ) ( not ( = ?auto_783245 ?auto_783248 ) ) ( not ( = ?auto_783245 ?auto_783249 ) ) ( not ( = ?auto_783245 ?auto_783250 ) ) ( not ( = ?auto_783245 ?auto_783251 ) ) ( not ( = ?auto_783245 ?auto_783252 ) ) ( not ( = ?auto_783245 ?auto_783253 ) ) ( not ( = ?auto_783245 ?auto_783254 ) ) ( not ( = ?auto_783245 ?auto_783255 ) ) ( not ( = ?auto_783245 ?auto_783256 ) ) ( not ( = ?auto_783245 ?auto_783257 ) ) ( not ( = ?auto_783245 ?auto_783258 ) ) ( not ( = ?auto_783245 ?auto_783259 ) ) ( not ( = ?auto_783245 ?auto_783260 ) ) ( not ( = ?auto_783245 ?auto_783261 ) ) ( not ( = ?auto_783245 ?auto_783262 ) ) ( not ( = ?auto_783246 ?auto_783247 ) ) ( not ( = ?auto_783246 ?auto_783248 ) ) ( not ( = ?auto_783246 ?auto_783249 ) ) ( not ( = ?auto_783246 ?auto_783250 ) ) ( not ( = ?auto_783246 ?auto_783251 ) ) ( not ( = ?auto_783246 ?auto_783252 ) ) ( not ( = ?auto_783246 ?auto_783253 ) ) ( not ( = ?auto_783246 ?auto_783254 ) ) ( not ( = ?auto_783246 ?auto_783255 ) ) ( not ( = ?auto_783246 ?auto_783256 ) ) ( not ( = ?auto_783246 ?auto_783257 ) ) ( not ( = ?auto_783246 ?auto_783258 ) ) ( not ( = ?auto_783246 ?auto_783259 ) ) ( not ( = ?auto_783246 ?auto_783260 ) ) ( not ( = ?auto_783246 ?auto_783261 ) ) ( not ( = ?auto_783246 ?auto_783262 ) ) ( not ( = ?auto_783247 ?auto_783248 ) ) ( not ( = ?auto_783247 ?auto_783249 ) ) ( not ( = ?auto_783247 ?auto_783250 ) ) ( not ( = ?auto_783247 ?auto_783251 ) ) ( not ( = ?auto_783247 ?auto_783252 ) ) ( not ( = ?auto_783247 ?auto_783253 ) ) ( not ( = ?auto_783247 ?auto_783254 ) ) ( not ( = ?auto_783247 ?auto_783255 ) ) ( not ( = ?auto_783247 ?auto_783256 ) ) ( not ( = ?auto_783247 ?auto_783257 ) ) ( not ( = ?auto_783247 ?auto_783258 ) ) ( not ( = ?auto_783247 ?auto_783259 ) ) ( not ( = ?auto_783247 ?auto_783260 ) ) ( not ( = ?auto_783247 ?auto_783261 ) ) ( not ( = ?auto_783247 ?auto_783262 ) ) ( not ( = ?auto_783248 ?auto_783249 ) ) ( not ( = ?auto_783248 ?auto_783250 ) ) ( not ( = ?auto_783248 ?auto_783251 ) ) ( not ( = ?auto_783248 ?auto_783252 ) ) ( not ( = ?auto_783248 ?auto_783253 ) ) ( not ( = ?auto_783248 ?auto_783254 ) ) ( not ( = ?auto_783248 ?auto_783255 ) ) ( not ( = ?auto_783248 ?auto_783256 ) ) ( not ( = ?auto_783248 ?auto_783257 ) ) ( not ( = ?auto_783248 ?auto_783258 ) ) ( not ( = ?auto_783248 ?auto_783259 ) ) ( not ( = ?auto_783248 ?auto_783260 ) ) ( not ( = ?auto_783248 ?auto_783261 ) ) ( not ( = ?auto_783248 ?auto_783262 ) ) ( not ( = ?auto_783249 ?auto_783250 ) ) ( not ( = ?auto_783249 ?auto_783251 ) ) ( not ( = ?auto_783249 ?auto_783252 ) ) ( not ( = ?auto_783249 ?auto_783253 ) ) ( not ( = ?auto_783249 ?auto_783254 ) ) ( not ( = ?auto_783249 ?auto_783255 ) ) ( not ( = ?auto_783249 ?auto_783256 ) ) ( not ( = ?auto_783249 ?auto_783257 ) ) ( not ( = ?auto_783249 ?auto_783258 ) ) ( not ( = ?auto_783249 ?auto_783259 ) ) ( not ( = ?auto_783249 ?auto_783260 ) ) ( not ( = ?auto_783249 ?auto_783261 ) ) ( not ( = ?auto_783249 ?auto_783262 ) ) ( not ( = ?auto_783250 ?auto_783251 ) ) ( not ( = ?auto_783250 ?auto_783252 ) ) ( not ( = ?auto_783250 ?auto_783253 ) ) ( not ( = ?auto_783250 ?auto_783254 ) ) ( not ( = ?auto_783250 ?auto_783255 ) ) ( not ( = ?auto_783250 ?auto_783256 ) ) ( not ( = ?auto_783250 ?auto_783257 ) ) ( not ( = ?auto_783250 ?auto_783258 ) ) ( not ( = ?auto_783250 ?auto_783259 ) ) ( not ( = ?auto_783250 ?auto_783260 ) ) ( not ( = ?auto_783250 ?auto_783261 ) ) ( not ( = ?auto_783250 ?auto_783262 ) ) ( not ( = ?auto_783251 ?auto_783252 ) ) ( not ( = ?auto_783251 ?auto_783253 ) ) ( not ( = ?auto_783251 ?auto_783254 ) ) ( not ( = ?auto_783251 ?auto_783255 ) ) ( not ( = ?auto_783251 ?auto_783256 ) ) ( not ( = ?auto_783251 ?auto_783257 ) ) ( not ( = ?auto_783251 ?auto_783258 ) ) ( not ( = ?auto_783251 ?auto_783259 ) ) ( not ( = ?auto_783251 ?auto_783260 ) ) ( not ( = ?auto_783251 ?auto_783261 ) ) ( not ( = ?auto_783251 ?auto_783262 ) ) ( not ( = ?auto_783252 ?auto_783253 ) ) ( not ( = ?auto_783252 ?auto_783254 ) ) ( not ( = ?auto_783252 ?auto_783255 ) ) ( not ( = ?auto_783252 ?auto_783256 ) ) ( not ( = ?auto_783252 ?auto_783257 ) ) ( not ( = ?auto_783252 ?auto_783258 ) ) ( not ( = ?auto_783252 ?auto_783259 ) ) ( not ( = ?auto_783252 ?auto_783260 ) ) ( not ( = ?auto_783252 ?auto_783261 ) ) ( not ( = ?auto_783252 ?auto_783262 ) ) ( not ( = ?auto_783253 ?auto_783254 ) ) ( not ( = ?auto_783253 ?auto_783255 ) ) ( not ( = ?auto_783253 ?auto_783256 ) ) ( not ( = ?auto_783253 ?auto_783257 ) ) ( not ( = ?auto_783253 ?auto_783258 ) ) ( not ( = ?auto_783253 ?auto_783259 ) ) ( not ( = ?auto_783253 ?auto_783260 ) ) ( not ( = ?auto_783253 ?auto_783261 ) ) ( not ( = ?auto_783253 ?auto_783262 ) ) ( not ( = ?auto_783254 ?auto_783255 ) ) ( not ( = ?auto_783254 ?auto_783256 ) ) ( not ( = ?auto_783254 ?auto_783257 ) ) ( not ( = ?auto_783254 ?auto_783258 ) ) ( not ( = ?auto_783254 ?auto_783259 ) ) ( not ( = ?auto_783254 ?auto_783260 ) ) ( not ( = ?auto_783254 ?auto_783261 ) ) ( not ( = ?auto_783254 ?auto_783262 ) ) ( not ( = ?auto_783255 ?auto_783256 ) ) ( not ( = ?auto_783255 ?auto_783257 ) ) ( not ( = ?auto_783255 ?auto_783258 ) ) ( not ( = ?auto_783255 ?auto_783259 ) ) ( not ( = ?auto_783255 ?auto_783260 ) ) ( not ( = ?auto_783255 ?auto_783261 ) ) ( not ( = ?auto_783255 ?auto_783262 ) ) ( not ( = ?auto_783256 ?auto_783257 ) ) ( not ( = ?auto_783256 ?auto_783258 ) ) ( not ( = ?auto_783256 ?auto_783259 ) ) ( not ( = ?auto_783256 ?auto_783260 ) ) ( not ( = ?auto_783256 ?auto_783261 ) ) ( not ( = ?auto_783256 ?auto_783262 ) ) ( not ( = ?auto_783257 ?auto_783258 ) ) ( not ( = ?auto_783257 ?auto_783259 ) ) ( not ( = ?auto_783257 ?auto_783260 ) ) ( not ( = ?auto_783257 ?auto_783261 ) ) ( not ( = ?auto_783257 ?auto_783262 ) ) ( not ( = ?auto_783258 ?auto_783259 ) ) ( not ( = ?auto_783258 ?auto_783260 ) ) ( not ( = ?auto_783258 ?auto_783261 ) ) ( not ( = ?auto_783258 ?auto_783262 ) ) ( not ( = ?auto_783259 ?auto_783260 ) ) ( not ( = ?auto_783259 ?auto_783261 ) ) ( not ( = ?auto_783259 ?auto_783262 ) ) ( not ( = ?auto_783260 ?auto_783261 ) ) ( not ( = ?auto_783260 ?auto_783262 ) ) ( not ( = ?auto_783261 ?auto_783262 ) ) ( ON ?auto_783261 ?auto_783262 ) ( ON ?auto_783260 ?auto_783261 ) ( ON ?auto_783259 ?auto_783260 ) ( ON ?auto_783258 ?auto_783259 ) ( ON ?auto_783257 ?auto_783258 ) ( ON ?auto_783256 ?auto_783257 ) ( ON ?auto_783255 ?auto_783256 ) ( ON ?auto_783254 ?auto_783255 ) ( ON ?auto_783253 ?auto_783254 ) ( ON ?auto_783252 ?auto_783253 ) ( ON ?auto_783251 ?auto_783252 ) ( CLEAR ?auto_783249 ) ( ON ?auto_783250 ?auto_783251 ) ( CLEAR ?auto_783250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_783245 ?auto_783246 ?auto_783247 ?auto_783248 ?auto_783249 ?auto_783250 )
      ( MAKE-18PILE ?auto_783245 ?auto_783246 ?auto_783247 ?auto_783248 ?auto_783249 ?auto_783250 ?auto_783251 ?auto_783252 ?auto_783253 ?auto_783254 ?auto_783255 ?auto_783256 ?auto_783257 ?auto_783258 ?auto_783259 ?auto_783260 ?auto_783261 ?auto_783262 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_783281 - BLOCK
      ?auto_783282 - BLOCK
      ?auto_783283 - BLOCK
      ?auto_783284 - BLOCK
      ?auto_783285 - BLOCK
      ?auto_783286 - BLOCK
      ?auto_783287 - BLOCK
      ?auto_783288 - BLOCK
      ?auto_783289 - BLOCK
      ?auto_783290 - BLOCK
      ?auto_783291 - BLOCK
      ?auto_783292 - BLOCK
      ?auto_783293 - BLOCK
      ?auto_783294 - BLOCK
      ?auto_783295 - BLOCK
      ?auto_783296 - BLOCK
      ?auto_783297 - BLOCK
      ?auto_783298 - BLOCK
    )
    :vars
    (
      ?auto_783299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_783298 ?auto_783299 ) ( ON-TABLE ?auto_783281 ) ( ON ?auto_783282 ?auto_783281 ) ( ON ?auto_783283 ?auto_783282 ) ( ON ?auto_783284 ?auto_783283 ) ( not ( = ?auto_783281 ?auto_783282 ) ) ( not ( = ?auto_783281 ?auto_783283 ) ) ( not ( = ?auto_783281 ?auto_783284 ) ) ( not ( = ?auto_783281 ?auto_783285 ) ) ( not ( = ?auto_783281 ?auto_783286 ) ) ( not ( = ?auto_783281 ?auto_783287 ) ) ( not ( = ?auto_783281 ?auto_783288 ) ) ( not ( = ?auto_783281 ?auto_783289 ) ) ( not ( = ?auto_783281 ?auto_783290 ) ) ( not ( = ?auto_783281 ?auto_783291 ) ) ( not ( = ?auto_783281 ?auto_783292 ) ) ( not ( = ?auto_783281 ?auto_783293 ) ) ( not ( = ?auto_783281 ?auto_783294 ) ) ( not ( = ?auto_783281 ?auto_783295 ) ) ( not ( = ?auto_783281 ?auto_783296 ) ) ( not ( = ?auto_783281 ?auto_783297 ) ) ( not ( = ?auto_783281 ?auto_783298 ) ) ( not ( = ?auto_783281 ?auto_783299 ) ) ( not ( = ?auto_783282 ?auto_783283 ) ) ( not ( = ?auto_783282 ?auto_783284 ) ) ( not ( = ?auto_783282 ?auto_783285 ) ) ( not ( = ?auto_783282 ?auto_783286 ) ) ( not ( = ?auto_783282 ?auto_783287 ) ) ( not ( = ?auto_783282 ?auto_783288 ) ) ( not ( = ?auto_783282 ?auto_783289 ) ) ( not ( = ?auto_783282 ?auto_783290 ) ) ( not ( = ?auto_783282 ?auto_783291 ) ) ( not ( = ?auto_783282 ?auto_783292 ) ) ( not ( = ?auto_783282 ?auto_783293 ) ) ( not ( = ?auto_783282 ?auto_783294 ) ) ( not ( = ?auto_783282 ?auto_783295 ) ) ( not ( = ?auto_783282 ?auto_783296 ) ) ( not ( = ?auto_783282 ?auto_783297 ) ) ( not ( = ?auto_783282 ?auto_783298 ) ) ( not ( = ?auto_783282 ?auto_783299 ) ) ( not ( = ?auto_783283 ?auto_783284 ) ) ( not ( = ?auto_783283 ?auto_783285 ) ) ( not ( = ?auto_783283 ?auto_783286 ) ) ( not ( = ?auto_783283 ?auto_783287 ) ) ( not ( = ?auto_783283 ?auto_783288 ) ) ( not ( = ?auto_783283 ?auto_783289 ) ) ( not ( = ?auto_783283 ?auto_783290 ) ) ( not ( = ?auto_783283 ?auto_783291 ) ) ( not ( = ?auto_783283 ?auto_783292 ) ) ( not ( = ?auto_783283 ?auto_783293 ) ) ( not ( = ?auto_783283 ?auto_783294 ) ) ( not ( = ?auto_783283 ?auto_783295 ) ) ( not ( = ?auto_783283 ?auto_783296 ) ) ( not ( = ?auto_783283 ?auto_783297 ) ) ( not ( = ?auto_783283 ?auto_783298 ) ) ( not ( = ?auto_783283 ?auto_783299 ) ) ( not ( = ?auto_783284 ?auto_783285 ) ) ( not ( = ?auto_783284 ?auto_783286 ) ) ( not ( = ?auto_783284 ?auto_783287 ) ) ( not ( = ?auto_783284 ?auto_783288 ) ) ( not ( = ?auto_783284 ?auto_783289 ) ) ( not ( = ?auto_783284 ?auto_783290 ) ) ( not ( = ?auto_783284 ?auto_783291 ) ) ( not ( = ?auto_783284 ?auto_783292 ) ) ( not ( = ?auto_783284 ?auto_783293 ) ) ( not ( = ?auto_783284 ?auto_783294 ) ) ( not ( = ?auto_783284 ?auto_783295 ) ) ( not ( = ?auto_783284 ?auto_783296 ) ) ( not ( = ?auto_783284 ?auto_783297 ) ) ( not ( = ?auto_783284 ?auto_783298 ) ) ( not ( = ?auto_783284 ?auto_783299 ) ) ( not ( = ?auto_783285 ?auto_783286 ) ) ( not ( = ?auto_783285 ?auto_783287 ) ) ( not ( = ?auto_783285 ?auto_783288 ) ) ( not ( = ?auto_783285 ?auto_783289 ) ) ( not ( = ?auto_783285 ?auto_783290 ) ) ( not ( = ?auto_783285 ?auto_783291 ) ) ( not ( = ?auto_783285 ?auto_783292 ) ) ( not ( = ?auto_783285 ?auto_783293 ) ) ( not ( = ?auto_783285 ?auto_783294 ) ) ( not ( = ?auto_783285 ?auto_783295 ) ) ( not ( = ?auto_783285 ?auto_783296 ) ) ( not ( = ?auto_783285 ?auto_783297 ) ) ( not ( = ?auto_783285 ?auto_783298 ) ) ( not ( = ?auto_783285 ?auto_783299 ) ) ( not ( = ?auto_783286 ?auto_783287 ) ) ( not ( = ?auto_783286 ?auto_783288 ) ) ( not ( = ?auto_783286 ?auto_783289 ) ) ( not ( = ?auto_783286 ?auto_783290 ) ) ( not ( = ?auto_783286 ?auto_783291 ) ) ( not ( = ?auto_783286 ?auto_783292 ) ) ( not ( = ?auto_783286 ?auto_783293 ) ) ( not ( = ?auto_783286 ?auto_783294 ) ) ( not ( = ?auto_783286 ?auto_783295 ) ) ( not ( = ?auto_783286 ?auto_783296 ) ) ( not ( = ?auto_783286 ?auto_783297 ) ) ( not ( = ?auto_783286 ?auto_783298 ) ) ( not ( = ?auto_783286 ?auto_783299 ) ) ( not ( = ?auto_783287 ?auto_783288 ) ) ( not ( = ?auto_783287 ?auto_783289 ) ) ( not ( = ?auto_783287 ?auto_783290 ) ) ( not ( = ?auto_783287 ?auto_783291 ) ) ( not ( = ?auto_783287 ?auto_783292 ) ) ( not ( = ?auto_783287 ?auto_783293 ) ) ( not ( = ?auto_783287 ?auto_783294 ) ) ( not ( = ?auto_783287 ?auto_783295 ) ) ( not ( = ?auto_783287 ?auto_783296 ) ) ( not ( = ?auto_783287 ?auto_783297 ) ) ( not ( = ?auto_783287 ?auto_783298 ) ) ( not ( = ?auto_783287 ?auto_783299 ) ) ( not ( = ?auto_783288 ?auto_783289 ) ) ( not ( = ?auto_783288 ?auto_783290 ) ) ( not ( = ?auto_783288 ?auto_783291 ) ) ( not ( = ?auto_783288 ?auto_783292 ) ) ( not ( = ?auto_783288 ?auto_783293 ) ) ( not ( = ?auto_783288 ?auto_783294 ) ) ( not ( = ?auto_783288 ?auto_783295 ) ) ( not ( = ?auto_783288 ?auto_783296 ) ) ( not ( = ?auto_783288 ?auto_783297 ) ) ( not ( = ?auto_783288 ?auto_783298 ) ) ( not ( = ?auto_783288 ?auto_783299 ) ) ( not ( = ?auto_783289 ?auto_783290 ) ) ( not ( = ?auto_783289 ?auto_783291 ) ) ( not ( = ?auto_783289 ?auto_783292 ) ) ( not ( = ?auto_783289 ?auto_783293 ) ) ( not ( = ?auto_783289 ?auto_783294 ) ) ( not ( = ?auto_783289 ?auto_783295 ) ) ( not ( = ?auto_783289 ?auto_783296 ) ) ( not ( = ?auto_783289 ?auto_783297 ) ) ( not ( = ?auto_783289 ?auto_783298 ) ) ( not ( = ?auto_783289 ?auto_783299 ) ) ( not ( = ?auto_783290 ?auto_783291 ) ) ( not ( = ?auto_783290 ?auto_783292 ) ) ( not ( = ?auto_783290 ?auto_783293 ) ) ( not ( = ?auto_783290 ?auto_783294 ) ) ( not ( = ?auto_783290 ?auto_783295 ) ) ( not ( = ?auto_783290 ?auto_783296 ) ) ( not ( = ?auto_783290 ?auto_783297 ) ) ( not ( = ?auto_783290 ?auto_783298 ) ) ( not ( = ?auto_783290 ?auto_783299 ) ) ( not ( = ?auto_783291 ?auto_783292 ) ) ( not ( = ?auto_783291 ?auto_783293 ) ) ( not ( = ?auto_783291 ?auto_783294 ) ) ( not ( = ?auto_783291 ?auto_783295 ) ) ( not ( = ?auto_783291 ?auto_783296 ) ) ( not ( = ?auto_783291 ?auto_783297 ) ) ( not ( = ?auto_783291 ?auto_783298 ) ) ( not ( = ?auto_783291 ?auto_783299 ) ) ( not ( = ?auto_783292 ?auto_783293 ) ) ( not ( = ?auto_783292 ?auto_783294 ) ) ( not ( = ?auto_783292 ?auto_783295 ) ) ( not ( = ?auto_783292 ?auto_783296 ) ) ( not ( = ?auto_783292 ?auto_783297 ) ) ( not ( = ?auto_783292 ?auto_783298 ) ) ( not ( = ?auto_783292 ?auto_783299 ) ) ( not ( = ?auto_783293 ?auto_783294 ) ) ( not ( = ?auto_783293 ?auto_783295 ) ) ( not ( = ?auto_783293 ?auto_783296 ) ) ( not ( = ?auto_783293 ?auto_783297 ) ) ( not ( = ?auto_783293 ?auto_783298 ) ) ( not ( = ?auto_783293 ?auto_783299 ) ) ( not ( = ?auto_783294 ?auto_783295 ) ) ( not ( = ?auto_783294 ?auto_783296 ) ) ( not ( = ?auto_783294 ?auto_783297 ) ) ( not ( = ?auto_783294 ?auto_783298 ) ) ( not ( = ?auto_783294 ?auto_783299 ) ) ( not ( = ?auto_783295 ?auto_783296 ) ) ( not ( = ?auto_783295 ?auto_783297 ) ) ( not ( = ?auto_783295 ?auto_783298 ) ) ( not ( = ?auto_783295 ?auto_783299 ) ) ( not ( = ?auto_783296 ?auto_783297 ) ) ( not ( = ?auto_783296 ?auto_783298 ) ) ( not ( = ?auto_783296 ?auto_783299 ) ) ( not ( = ?auto_783297 ?auto_783298 ) ) ( not ( = ?auto_783297 ?auto_783299 ) ) ( not ( = ?auto_783298 ?auto_783299 ) ) ( ON ?auto_783297 ?auto_783298 ) ( ON ?auto_783296 ?auto_783297 ) ( ON ?auto_783295 ?auto_783296 ) ( ON ?auto_783294 ?auto_783295 ) ( ON ?auto_783293 ?auto_783294 ) ( ON ?auto_783292 ?auto_783293 ) ( ON ?auto_783291 ?auto_783292 ) ( ON ?auto_783290 ?auto_783291 ) ( ON ?auto_783289 ?auto_783290 ) ( ON ?auto_783288 ?auto_783289 ) ( ON ?auto_783287 ?auto_783288 ) ( ON ?auto_783286 ?auto_783287 ) ( CLEAR ?auto_783284 ) ( ON ?auto_783285 ?auto_783286 ) ( CLEAR ?auto_783285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_783281 ?auto_783282 ?auto_783283 ?auto_783284 ?auto_783285 )
      ( MAKE-18PILE ?auto_783281 ?auto_783282 ?auto_783283 ?auto_783284 ?auto_783285 ?auto_783286 ?auto_783287 ?auto_783288 ?auto_783289 ?auto_783290 ?auto_783291 ?auto_783292 ?auto_783293 ?auto_783294 ?auto_783295 ?auto_783296 ?auto_783297 ?auto_783298 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_783318 - BLOCK
      ?auto_783319 - BLOCK
      ?auto_783320 - BLOCK
      ?auto_783321 - BLOCK
      ?auto_783322 - BLOCK
      ?auto_783323 - BLOCK
      ?auto_783324 - BLOCK
      ?auto_783325 - BLOCK
      ?auto_783326 - BLOCK
      ?auto_783327 - BLOCK
      ?auto_783328 - BLOCK
      ?auto_783329 - BLOCK
      ?auto_783330 - BLOCK
      ?auto_783331 - BLOCK
      ?auto_783332 - BLOCK
      ?auto_783333 - BLOCK
      ?auto_783334 - BLOCK
      ?auto_783335 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_783335 ) ( ON-TABLE ?auto_783318 ) ( ON ?auto_783319 ?auto_783318 ) ( ON ?auto_783320 ?auto_783319 ) ( ON ?auto_783321 ?auto_783320 ) ( not ( = ?auto_783318 ?auto_783319 ) ) ( not ( = ?auto_783318 ?auto_783320 ) ) ( not ( = ?auto_783318 ?auto_783321 ) ) ( not ( = ?auto_783318 ?auto_783322 ) ) ( not ( = ?auto_783318 ?auto_783323 ) ) ( not ( = ?auto_783318 ?auto_783324 ) ) ( not ( = ?auto_783318 ?auto_783325 ) ) ( not ( = ?auto_783318 ?auto_783326 ) ) ( not ( = ?auto_783318 ?auto_783327 ) ) ( not ( = ?auto_783318 ?auto_783328 ) ) ( not ( = ?auto_783318 ?auto_783329 ) ) ( not ( = ?auto_783318 ?auto_783330 ) ) ( not ( = ?auto_783318 ?auto_783331 ) ) ( not ( = ?auto_783318 ?auto_783332 ) ) ( not ( = ?auto_783318 ?auto_783333 ) ) ( not ( = ?auto_783318 ?auto_783334 ) ) ( not ( = ?auto_783318 ?auto_783335 ) ) ( not ( = ?auto_783319 ?auto_783320 ) ) ( not ( = ?auto_783319 ?auto_783321 ) ) ( not ( = ?auto_783319 ?auto_783322 ) ) ( not ( = ?auto_783319 ?auto_783323 ) ) ( not ( = ?auto_783319 ?auto_783324 ) ) ( not ( = ?auto_783319 ?auto_783325 ) ) ( not ( = ?auto_783319 ?auto_783326 ) ) ( not ( = ?auto_783319 ?auto_783327 ) ) ( not ( = ?auto_783319 ?auto_783328 ) ) ( not ( = ?auto_783319 ?auto_783329 ) ) ( not ( = ?auto_783319 ?auto_783330 ) ) ( not ( = ?auto_783319 ?auto_783331 ) ) ( not ( = ?auto_783319 ?auto_783332 ) ) ( not ( = ?auto_783319 ?auto_783333 ) ) ( not ( = ?auto_783319 ?auto_783334 ) ) ( not ( = ?auto_783319 ?auto_783335 ) ) ( not ( = ?auto_783320 ?auto_783321 ) ) ( not ( = ?auto_783320 ?auto_783322 ) ) ( not ( = ?auto_783320 ?auto_783323 ) ) ( not ( = ?auto_783320 ?auto_783324 ) ) ( not ( = ?auto_783320 ?auto_783325 ) ) ( not ( = ?auto_783320 ?auto_783326 ) ) ( not ( = ?auto_783320 ?auto_783327 ) ) ( not ( = ?auto_783320 ?auto_783328 ) ) ( not ( = ?auto_783320 ?auto_783329 ) ) ( not ( = ?auto_783320 ?auto_783330 ) ) ( not ( = ?auto_783320 ?auto_783331 ) ) ( not ( = ?auto_783320 ?auto_783332 ) ) ( not ( = ?auto_783320 ?auto_783333 ) ) ( not ( = ?auto_783320 ?auto_783334 ) ) ( not ( = ?auto_783320 ?auto_783335 ) ) ( not ( = ?auto_783321 ?auto_783322 ) ) ( not ( = ?auto_783321 ?auto_783323 ) ) ( not ( = ?auto_783321 ?auto_783324 ) ) ( not ( = ?auto_783321 ?auto_783325 ) ) ( not ( = ?auto_783321 ?auto_783326 ) ) ( not ( = ?auto_783321 ?auto_783327 ) ) ( not ( = ?auto_783321 ?auto_783328 ) ) ( not ( = ?auto_783321 ?auto_783329 ) ) ( not ( = ?auto_783321 ?auto_783330 ) ) ( not ( = ?auto_783321 ?auto_783331 ) ) ( not ( = ?auto_783321 ?auto_783332 ) ) ( not ( = ?auto_783321 ?auto_783333 ) ) ( not ( = ?auto_783321 ?auto_783334 ) ) ( not ( = ?auto_783321 ?auto_783335 ) ) ( not ( = ?auto_783322 ?auto_783323 ) ) ( not ( = ?auto_783322 ?auto_783324 ) ) ( not ( = ?auto_783322 ?auto_783325 ) ) ( not ( = ?auto_783322 ?auto_783326 ) ) ( not ( = ?auto_783322 ?auto_783327 ) ) ( not ( = ?auto_783322 ?auto_783328 ) ) ( not ( = ?auto_783322 ?auto_783329 ) ) ( not ( = ?auto_783322 ?auto_783330 ) ) ( not ( = ?auto_783322 ?auto_783331 ) ) ( not ( = ?auto_783322 ?auto_783332 ) ) ( not ( = ?auto_783322 ?auto_783333 ) ) ( not ( = ?auto_783322 ?auto_783334 ) ) ( not ( = ?auto_783322 ?auto_783335 ) ) ( not ( = ?auto_783323 ?auto_783324 ) ) ( not ( = ?auto_783323 ?auto_783325 ) ) ( not ( = ?auto_783323 ?auto_783326 ) ) ( not ( = ?auto_783323 ?auto_783327 ) ) ( not ( = ?auto_783323 ?auto_783328 ) ) ( not ( = ?auto_783323 ?auto_783329 ) ) ( not ( = ?auto_783323 ?auto_783330 ) ) ( not ( = ?auto_783323 ?auto_783331 ) ) ( not ( = ?auto_783323 ?auto_783332 ) ) ( not ( = ?auto_783323 ?auto_783333 ) ) ( not ( = ?auto_783323 ?auto_783334 ) ) ( not ( = ?auto_783323 ?auto_783335 ) ) ( not ( = ?auto_783324 ?auto_783325 ) ) ( not ( = ?auto_783324 ?auto_783326 ) ) ( not ( = ?auto_783324 ?auto_783327 ) ) ( not ( = ?auto_783324 ?auto_783328 ) ) ( not ( = ?auto_783324 ?auto_783329 ) ) ( not ( = ?auto_783324 ?auto_783330 ) ) ( not ( = ?auto_783324 ?auto_783331 ) ) ( not ( = ?auto_783324 ?auto_783332 ) ) ( not ( = ?auto_783324 ?auto_783333 ) ) ( not ( = ?auto_783324 ?auto_783334 ) ) ( not ( = ?auto_783324 ?auto_783335 ) ) ( not ( = ?auto_783325 ?auto_783326 ) ) ( not ( = ?auto_783325 ?auto_783327 ) ) ( not ( = ?auto_783325 ?auto_783328 ) ) ( not ( = ?auto_783325 ?auto_783329 ) ) ( not ( = ?auto_783325 ?auto_783330 ) ) ( not ( = ?auto_783325 ?auto_783331 ) ) ( not ( = ?auto_783325 ?auto_783332 ) ) ( not ( = ?auto_783325 ?auto_783333 ) ) ( not ( = ?auto_783325 ?auto_783334 ) ) ( not ( = ?auto_783325 ?auto_783335 ) ) ( not ( = ?auto_783326 ?auto_783327 ) ) ( not ( = ?auto_783326 ?auto_783328 ) ) ( not ( = ?auto_783326 ?auto_783329 ) ) ( not ( = ?auto_783326 ?auto_783330 ) ) ( not ( = ?auto_783326 ?auto_783331 ) ) ( not ( = ?auto_783326 ?auto_783332 ) ) ( not ( = ?auto_783326 ?auto_783333 ) ) ( not ( = ?auto_783326 ?auto_783334 ) ) ( not ( = ?auto_783326 ?auto_783335 ) ) ( not ( = ?auto_783327 ?auto_783328 ) ) ( not ( = ?auto_783327 ?auto_783329 ) ) ( not ( = ?auto_783327 ?auto_783330 ) ) ( not ( = ?auto_783327 ?auto_783331 ) ) ( not ( = ?auto_783327 ?auto_783332 ) ) ( not ( = ?auto_783327 ?auto_783333 ) ) ( not ( = ?auto_783327 ?auto_783334 ) ) ( not ( = ?auto_783327 ?auto_783335 ) ) ( not ( = ?auto_783328 ?auto_783329 ) ) ( not ( = ?auto_783328 ?auto_783330 ) ) ( not ( = ?auto_783328 ?auto_783331 ) ) ( not ( = ?auto_783328 ?auto_783332 ) ) ( not ( = ?auto_783328 ?auto_783333 ) ) ( not ( = ?auto_783328 ?auto_783334 ) ) ( not ( = ?auto_783328 ?auto_783335 ) ) ( not ( = ?auto_783329 ?auto_783330 ) ) ( not ( = ?auto_783329 ?auto_783331 ) ) ( not ( = ?auto_783329 ?auto_783332 ) ) ( not ( = ?auto_783329 ?auto_783333 ) ) ( not ( = ?auto_783329 ?auto_783334 ) ) ( not ( = ?auto_783329 ?auto_783335 ) ) ( not ( = ?auto_783330 ?auto_783331 ) ) ( not ( = ?auto_783330 ?auto_783332 ) ) ( not ( = ?auto_783330 ?auto_783333 ) ) ( not ( = ?auto_783330 ?auto_783334 ) ) ( not ( = ?auto_783330 ?auto_783335 ) ) ( not ( = ?auto_783331 ?auto_783332 ) ) ( not ( = ?auto_783331 ?auto_783333 ) ) ( not ( = ?auto_783331 ?auto_783334 ) ) ( not ( = ?auto_783331 ?auto_783335 ) ) ( not ( = ?auto_783332 ?auto_783333 ) ) ( not ( = ?auto_783332 ?auto_783334 ) ) ( not ( = ?auto_783332 ?auto_783335 ) ) ( not ( = ?auto_783333 ?auto_783334 ) ) ( not ( = ?auto_783333 ?auto_783335 ) ) ( not ( = ?auto_783334 ?auto_783335 ) ) ( ON ?auto_783334 ?auto_783335 ) ( ON ?auto_783333 ?auto_783334 ) ( ON ?auto_783332 ?auto_783333 ) ( ON ?auto_783331 ?auto_783332 ) ( ON ?auto_783330 ?auto_783331 ) ( ON ?auto_783329 ?auto_783330 ) ( ON ?auto_783328 ?auto_783329 ) ( ON ?auto_783327 ?auto_783328 ) ( ON ?auto_783326 ?auto_783327 ) ( ON ?auto_783325 ?auto_783326 ) ( ON ?auto_783324 ?auto_783325 ) ( ON ?auto_783323 ?auto_783324 ) ( CLEAR ?auto_783321 ) ( ON ?auto_783322 ?auto_783323 ) ( CLEAR ?auto_783322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_783318 ?auto_783319 ?auto_783320 ?auto_783321 ?auto_783322 )
      ( MAKE-18PILE ?auto_783318 ?auto_783319 ?auto_783320 ?auto_783321 ?auto_783322 ?auto_783323 ?auto_783324 ?auto_783325 ?auto_783326 ?auto_783327 ?auto_783328 ?auto_783329 ?auto_783330 ?auto_783331 ?auto_783332 ?auto_783333 ?auto_783334 ?auto_783335 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_783354 - BLOCK
      ?auto_783355 - BLOCK
      ?auto_783356 - BLOCK
      ?auto_783357 - BLOCK
      ?auto_783358 - BLOCK
      ?auto_783359 - BLOCK
      ?auto_783360 - BLOCK
      ?auto_783361 - BLOCK
      ?auto_783362 - BLOCK
      ?auto_783363 - BLOCK
      ?auto_783364 - BLOCK
      ?auto_783365 - BLOCK
      ?auto_783366 - BLOCK
      ?auto_783367 - BLOCK
      ?auto_783368 - BLOCK
      ?auto_783369 - BLOCK
      ?auto_783370 - BLOCK
      ?auto_783371 - BLOCK
    )
    :vars
    (
      ?auto_783372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_783371 ?auto_783372 ) ( ON-TABLE ?auto_783354 ) ( ON ?auto_783355 ?auto_783354 ) ( ON ?auto_783356 ?auto_783355 ) ( not ( = ?auto_783354 ?auto_783355 ) ) ( not ( = ?auto_783354 ?auto_783356 ) ) ( not ( = ?auto_783354 ?auto_783357 ) ) ( not ( = ?auto_783354 ?auto_783358 ) ) ( not ( = ?auto_783354 ?auto_783359 ) ) ( not ( = ?auto_783354 ?auto_783360 ) ) ( not ( = ?auto_783354 ?auto_783361 ) ) ( not ( = ?auto_783354 ?auto_783362 ) ) ( not ( = ?auto_783354 ?auto_783363 ) ) ( not ( = ?auto_783354 ?auto_783364 ) ) ( not ( = ?auto_783354 ?auto_783365 ) ) ( not ( = ?auto_783354 ?auto_783366 ) ) ( not ( = ?auto_783354 ?auto_783367 ) ) ( not ( = ?auto_783354 ?auto_783368 ) ) ( not ( = ?auto_783354 ?auto_783369 ) ) ( not ( = ?auto_783354 ?auto_783370 ) ) ( not ( = ?auto_783354 ?auto_783371 ) ) ( not ( = ?auto_783354 ?auto_783372 ) ) ( not ( = ?auto_783355 ?auto_783356 ) ) ( not ( = ?auto_783355 ?auto_783357 ) ) ( not ( = ?auto_783355 ?auto_783358 ) ) ( not ( = ?auto_783355 ?auto_783359 ) ) ( not ( = ?auto_783355 ?auto_783360 ) ) ( not ( = ?auto_783355 ?auto_783361 ) ) ( not ( = ?auto_783355 ?auto_783362 ) ) ( not ( = ?auto_783355 ?auto_783363 ) ) ( not ( = ?auto_783355 ?auto_783364 ) ) ( not ( = ?auto_783355 ?auto_783365 ) ) ( not ( = ?auto_783355 ?auto_783366 ) ) ( not ( = ?auto_783355 ?auto_783367 ) ) ( not ( = ?auto_783355 ?auto_783368 ) ) ( not ( = ?auto_783355 ?auto_783369 ) ) ( not ( = ?auto_783355 ?auto_783370 ) ) ( not ( = ?auto_783355 ?auto_783371 ) ) ( not ( = ?auto_783355 ?auto_783372 ) ) ( not ( = ?auto_783356 ?auto_783357 ) ) ( not ( = ?auto_783356 ?auto_783358 ) ) ( not ( = ?auto_783356 ?auto_783359 ) ) ( not ( = ?auto_783356 ?auto_783360 ) ) ( not ( = ?auto_783356 ?auto_783361 ) ) ( not ( = ?auto_783356 ?auto_783362 ) ) ( not ( = ?auto_783356 ?auto_783363 ) ) ( not ( = ?auto_783356 ?auto_783364 ) ) ( not ( = ?auto_783356 ?auto_783365 ) ) ( not ( = ?auto_783356 ?auto_783366 ) ) ( not ( = ?auto_783356 ?auto_783367 ) ) ( not ( = ?auto_783356 ?auto_783368 ) ) ( not ( = ?auto_783356 ?auto_783369 ) ) ( not ( = ?auto_783356 ?auto_783370 ) ) ( not ( = ?auto_783356 ?auto_783371 ) ) ( not ( = ?auto_783356 ?auto_783372 ) ) ( not ( = ?auto_783357 ?auto_783358 ) ) ( not ( = ?auto_783357 ?auto_783359 ) ) ( not ( = ?auto_783357 ?auto_783360 ) ) ( not ( = ?auto_783357 ?auto_783361 ) ) ( not ( = ?auto_783357 ?auto_783362 ) ) ( not ( = ?auto_783357 ?auto_783363 ) ) ( not ( = ?auto_783357 ?auto_783364 ) ) ( not ( = ?auto_783357 ?auto_783365 ) ) ( not ( = ?auto_783357 ?auto_783366 ) ) ( not ( = ?auto_783357 ?auto_783367 ) ) ( not ( = ?auto_783357 ?auto_783368 ) ) ( not ( = ?auto_783357 ?auto_783369 ) ) ( not ( = ?auto_783357 ?auto_783370 ) ) ( not ( = ?auto_783357 ?auto_783371 ) ) ( not ( = ?auto_783357 ?auto_783372 ) ) ( not ( = ?auto_783358 ?auto_783359 ) ) ( not ( = ?auto_783358 ?auto_783360 ) ) ( not ( = ?auto_783358 ?auto_783361 ) ) ( not ( = ?auto_783358 ?auto_783362 ) ) ( not ( = ?auto_783358 ?auto_783363 ) ) ( not ( = ?auto_783358 ?auto_783364 ) ) ( not ( = ?auto_783358 ?auto_783365 ) ) ( not ( = ?auto_783358 ?auto_783366 ) ) ( not ( = ?auto_783358 ?auto_783367 ) ) ( not ( = ?auto_783358 ?auto_783368 ) ) ( not ( = ?auto_783358 ?auto_783369 ) ) ( not ( = ?auto_783358 ?auto_783370 ) ) ( not ( = ?auto_783358 ?auto_783371 ) ) ( not ( = ?auto_783358 ?auto_783372 ) ) ( not ( = ?auto_783359 ?auto_783360 ) ) ( not ( = ?auto_783359 ?auto_783361 ) ) ( not ( = ?auto_783359 ?auto_783362 ) ) ( not ( = ?auto_783359 ?auto_783363 ) ) ( not ( = ?auto_783359 ?auto_783364 ) ) ( not ( = ?auto_783359 ?auto_783365 ) ) ( not ( = ?auto_783359 ?auto_783366 ) ) ( not ( = ?auto_783359 ?auto_783367 ) ) ( not ( = ?auto_783359 ?auto_783368 ) ) ( not ( = ?auto_783359 ?auto_783369 ) ) ( not ( = ?auto_783359 ?auto_783370 ) ) ( not ( = ?auto_783359 ?auto_783371 ) ) ( not ( = ?auto_783359 ?auto_783372 ) ) ( not ( = ?auto_783360 ?auto_783361 ) ) ( not ( = ?auto_783360 ?auto_783362 ) ) ( not ( = ?auto_783360 ?auto_783363 ) ) ( not ( = ?auto_783360 ?auto_783364 ) ) ( not ( = ?auto_783360 ?auto_783365 ) ) ( not ( = ?auto_783360 ?auto_783366 ) ) ( not ( = ?auto_783360 ?auto_783367 ) ) ( not ( = ?auto_783360 ?auto_783368 ) ) ( not ( = ?auto_783360 ?auto_783369 ) ) ( not ( = ?auto_783360 ?auto_783370 ) ) ( not ( = ?auto_783360 ?auto_783371 ) ) ( not ( = ?auto_783360 ?auto_783372 ) ) ( not ( = ?auto_783361 ?auto_783362 ) ) ( not ( = ?auto_783361 ?auto_783363 ) ) ( not ( = ?auto_783361 ?auto_783364 ) ) ( not ( = ?auto_783361 ?auto_783365 ) ) ( not ( = ?auto_783361 ?auto_783366 ) ) ( not ( = ?auto_783361 ?auto_783367 ) ) ( not ( = ?auto_783361 ?auto_783368 ) ) ( not ( = ?auto_783361 ?auto_783369 ) ) ( not ( = ?auto_783361 ?auto_783370 ) ) ( not ( = ?auto_783361 ?auto_783371 ) ) ( not ( = ?auto_783361 ?auto_783372 ) ) ( not ( = ?auto_783362 ?auto_783363 ) ) ( not ( = ?auto_783362 ?auto_783364 ) ) ( not ( = ?auto_783362 ?auto_783365 ) ) ( not ( = ?auto_783362 ?auto_783366 ) ) ( not ( = ?auto_783362 ?auto_783367 ) ) ( not ( = ?auto_783362 ?auto_783368 ) ) ( not ( = ?auto_783362 ?auto_783369 ) ) ( not ( = ?auto_783362 ?auto_783370 ) ) ( not ( = ?auto_783362 ?auto_783371 ) ) ( not ( = ?auto_783362 ?auto_783372 ) ) ( not ( = ?auto_783363 ?auto_783364 ) ) ( not ( = ?auto_783363 ?auto_783365 ) ) ( not ( = ?auto_783363 ?auto_783366 ) ) ( not ( = ?auto_783363 ?auto_783367 ) ) ( not ( = ?auto_783363 ?auto_783368 ) ) ( not ( = ?auto_783363 ?auto_783369 ) ) ( not ( = ?auto_783363 ?auto_783370 ) ) ( not ( = ?auto_783363 ?auto_783371 ) ) ( not ( = ?auto_783363 ?auto_783372 ) ) ( not ( = ?auto_783364 ?auto_783365 ) ) ( not ( = ?auto_783364 ?auto_783366 ) ) ( not ( = ?auto_783364 ?auto_783367 ) ) ( not ( = ?auto_783364 ?auto_783368 ) ) ( not ( = ?auto_783364 ?auto_783369 ) ) ( not ( = ?auto_783364 ?auto_783370 ) ) ( not ( = ?auto_783364 ?auto_783371 ) ) ( not ( = ?auto_783364 ?auto_783372 ) ) ( not ( = ?auto_783365 ?auto_783366 ) ) ( not ( = ?auto_783365 ?auto_783367 ) ) ( not ( = ?auto_783365 ?auto_783368 ) ) ( not ( = ?auto_783365 ?auto_783369 ) ) ( not ( = ?auto_783365 ?auto_783370 ) ) ( not ( = ?auto_783365 ?auto_783371 ) ) ( not ( = ?auto_783365 ?auto_783372 ) ) ( not ( = ?auto_783366 ?auto_783367 ) ) ( not ( = ?auto_783366 ?auto_783368 ) ) ( not ( = ?auto_783366 ?auto_783369 ) ) ( not ( = ?auto_783366 ?auto_783370 ) ) ( not ( = ?auto_783366 ?auto_783371 ) ) ( not ( = ?auto_783366 ?auto_783372 ) ) ( not ( = ?auto_783367 ?auto_783368 ) ) ( not ( = ?auto_783367 ?auto_783369 ) ) ( not ( = ?auto_783367 ?auto_783370 ) ) ( not ( = ?auto_783367 ?auto_783371 ) ) ( not ( = ?auto_783367 ?auto_783372 ) ) ( not ( = ?auto_783368 ?auto_783369 ) ) ( not ( = ?auto_783368 ?auto_783370 ) ) ( not ( = ?auto_783368 ?auto_783371 ) ) ( not ( = ?auto_783368 ?auto_783372 ) ) ( not ( = ?auto_783369 ?auto_783370 ) ) ( not ( = ?auto_783369 ?auto_783371 ) ) ( not ( = ?auto_783369 ?auto_783372 ) ) ( not ( = ?auto_783370 ?auto_783371 ) ) ( not ( = ?auto_783370 ?auto_783372 ) ) ( not ( = ?auto_783371 ?auto_783372 ) ) ( ON ?auto_783370 ?auto_783371 ) ( ON ?auto_783369 ?auto_783370 ) ( ON ?auto_783368 ?auto_783369 ) ( ON ?auto_783367 ?auto_783368 ) ( ON ?auto_783366 ?auto_783367 ) ( ON ?auto_783365 ?auto_783366 ) ( ON ?auto_783364 ?auto_783365 ) ( ON ?auto_783363 ?auto_783364 ) ( ON ?auto_783362 ?auto_783363 ) ( ON ?auto_783361 ?auto_783362 ) ( ON ?auto_783360 ?auto_783361 ) ( ON ?auto_783359 ?auto_783360 ) ( ON ?auto_783358 ?auto_783359 ) ( CLEAR ?auto_783356 ) ( ON ?auto_783357 ?auto_783358 ) ( CLEAR ?auto_783357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_783354 ?auto_783355 ?auto_783356 ?auto_783357 )
      ( MAKE-18PILE ?auto_783354 ?auto_783355 ?auto_783356 ?auto_783357 ?auto_783358 ?auto_783359 ?auto_783360 ?auto_783361 ?auto_783362 ?auto_783363 ?auto_783364 ?auto_783365 ?auto_783366 ?auto_783367 ?auto_783368 ?auto_783369 ?auto_783370 ?auto_783371 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_783391 - BLOCK
      ?auto_783392 - BLOCK
      ?auto_783393 - BLOCK
      ?auto_783394 - BLOCK
      ?auto_783395 - BLOCK
      ?auto_783396 - BLOCK
      ?auto_783397 - BLOCK
      ?auto_783398 - BLOCK
      ?auto_783399 - BLOCK
      ?auto_783400 - BLOCK
      ?auto_783401 - BLOCK
      ?auto_783402 - BLOCK
      ?auto_783403 - BLOCK
      ?auto_783404 - BLOCK
      ?auto_783405 - BLOCK
      ?auto_783406 - BLOCK
      ?auto_783407 - BLOCK
      ?auto_783408 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_783408 ) ( ON-TABLE ?auto_783391 ) ( ON ?auto_783392 ?auto_783391 ) ( ON ?auto_783393 ?auto_783392 ) ( not ( = ?auto_783391 ?auto_783392 ) ) ( not ( = ?auto_783391 ?auto_783393 ) ) ( not ( = ?auto_783391 ?auto_783394 ) ) ( not ( = ?auto_783391 ?auto_783395 ) ) ( not ( = ?auto_783391 ?auto_783396 ) ) ( not ( = ?auto_783391 ?auto_783397 ) ) ( not ( = ?auto_783391 ?auto_783398 ) ) ( not ( = ?auto_783391 ?auto_783399 ) ) ( not ( = ?auto_783391 ?auto_783400 ) ) ( not ( = ?auto_783391 ?auto_783401 ) ) ( not ( = ?auto_783391 ?auto_783402 ) ) ( not ( = ?auto_783391 ?auto_783403 ) ) ( not ( = ?auto_783391 ?auto_783404 ) ) ( not ( = ?auto_783391 ?auto_783405 ) ) ( not ( = ?auto_783391 ?auto_783406 ) ) ( not ( = ?auto_783391 ?auto_783407 ) ) ( not ( = ?auto_783391 ?auto_783408 ) ) ( not ( = ?auto_783392 ?auto_783393 ) ) ( not ( = ?auto_783392 ?auto_783394 ) ) ( not ( = ?auto_783392 ?auto_783395 ) ) ( not ( = ?auto_783392 ?auto_783396 ) ) ( not ( = ?auto_783392 ?auto_783397 ) ) ( not ( = ?auto_783392 ?auto_783398 ) ) ( not ( = ?auto_783392 ?auto_783399 ) ) ( not ( = ?auto_783392 ?auto_783400 ) ) ( not ( = ?auto_783392 ?auto_783401 ) ) ( not ( = ?auto_783392 ?auto_783402 ) ) ( not ( = ?auto_783392 ?auto_783403 ) ) ( not ( = ?auto_783392 ?auto_783404 ) ) ( not ( = ?auto_783392 ?auto_783405 ) ) ( not ( = ?auto_783392 ?auto_783406 ) ) ( not ( = ?auto_783392 ?auto_783407 ) ) ( not ( = ?auto_783392 ?auto_783408 ) ) ( not ( = ?auto_783393 ?auto_783394 ) ) ( not ( = ?auto_783393 ?auto_783395 ) ) ( not ( = ?auto_783393 ?auto_783396 ) ) ( not ( = ?auto_783393 ?auto_783397 ) ) ( not ( = ?auto_783393 ?auto_783398 ) ) ( not ( = ?auto_783393 ?auto_783399 ) ) ( not ( = ?auto_783393 ?auto_783400 ) ) ( not ( = ?auto_783393 ?auto_783401 ) ) ( not ( = ?auto_783393 ?auto_783402 ) ) ( not ( = ?auto_783393 ?auto_783403 ) ) ( not ( = ?auto_783393 ?auto_783404 ) ) ( not ( = ?auto_783393 ?auto_783405 ) ) ( not ( = ?auto_783393 ?auto_783406 ) ) ( not ( = ?auto_783393 ?auto_783407 ) ) ( not ( = ?auto_783393 ?auto_783408 ) ) ( not ( = ?auto_783394 ?auto_783395 ) ) ( not ( = ?auto_783394 ?auto_783396 ) ) ( not ( = ?auto_783394 ?auto_783397 ) ) ( not ( = ?auto_783394 ?auto_783398 ) ) ( not ( = ?auto_783394 ?auto_783399 ) ) ( not ( = ?auto_783394 ?auto_783400 ) ) ( not ( = ?auto_783394 ?auto_783401 ) ) ( not ( = ?auto_783394 ?auto_783402 ) ) ( not ( = ?auto_783394 ?auto_783403 ) ) ( not ( = ?auto_783394 ?auto_783404 ) ) ( not ( = ?auto_783394 ?auto_783405 ) ) ( not ( = ?auto_783394 ?auto_783406 ) ) ( not ( = ?auto_783394 ?auto_783407 ) ) ( not ( = ?auto_783394 ?auto_783408 ) ) ( not ( = ?auto_783395 ?auto_783396 ) ) ( not ( = ?auto_783395 ?auto_783397 ) ) ( not ( = ?auto_783395 ?auto_783398 ) ) ( not ( = ?auto_783395 ?auto_783399 ) ) ( not ( = ?auto_783395 ?auto_783400 ) ) ( not ( = ?auto_783395 ?auto_783401 ) ) ( not ( = ?auto_783395 ?auto_783402 ) ) ( not ( = ?auto_783395 ?auto_783403 ) ) ( not ( = ?auto_783395 ?auto_783404 ) ) ( not ( = ?auto_783395 ?auto_783405 ) ) ( not ( = ?auto_783395 ?auto_783406 ) ) ( not ( = ?auto_783395 ?auto_783407 ) ) ( not ( = ?auto_783395 ?auto_783408 ) ) ( not ( = ?auto_783396 ?auto_783397 ) ) ( not ( = ?auto_783396 ?auto_783398 ) ) ( not ( = ?auto_783396 ?auto_783399 ) ) ( not ( = ?auto_783396 ?auto_783400 ) ) ( not ( = ?auto_783396 ?auto_783401 ) ) ( not ( = ?auto_783396 ?auto_783402 ) ) ( not ( = ?auto_783396 ?auto_783403 ) ) ( not ( = ?auto_783396 ?auto_783404 ) ) ( not ( = ?auto_783396 ?auto_783405 ) ) ( not ( = ?auto_783396 ?auto_783406 ) ) ( not ( = ?auto_783396 ?auto_783407 ) ) ( not ( = ?auto_783396 ?auto_783408 ) ) ( not ( = ?auto_783397 ?auto_783398 ) ) ( not ( = ?auto_783397 ?auto_783399 ) ) ( not ( = ?auto_783397 ?auto_783400 ) ) ( not ( = ?auto_783397 ?auto_783401 ) ) ( not ( = ?auto_783397 ?auto_783402 ) ) ( not ( = ?auto_783397 ?auto_783403 ) ) ( not ( = ?auto_783397 ?auto_783404 ) ) ( not ( = ?auto_783397 ?auto_783405 ) ) ( not ( = ?auto_783397 ?auto_783406 ) ) ( not ( = ?auto_783397 ?auto_783407 ) ) ( not ( = ?auto_783397 ?auto_783408 ) ) ( not ( = ?auto_783398 ?auto_783399 ) ) ( not ( = ?auto_783398 ?auto_783400 ) ) ( not ( = ?auto_783398 ?auto_783401 ) ) ( not ( = ?auto_783398 ?auto_783402 ) ) ( not ( = ?auto_783398 ?auto_783403 ) ) ( not ( = ?auto_783398 ?auto_783404 ) ) ( not ( = ?auto_783398 ?auto_783405 ) ) ( not ( = ?auto_783398 ?auto_783406 ) ) ( not ( = ?auto_783398 ?auto_783407 ) ) ( not ( = ?auto_783398 ?auto_783408 ) ) ( not ( = ?auto_783399 ?auto_783400 ) ) ( not ( = ?auto_783399 ?auto_783401 ) ) ( not ( = ?auto_783399 ?auto_783402 ) ) ( not ( = ?auto_783399 ?auto_783403 ) ) ( not ( = ?auto_783399 ?auto_783404 ) ) ( not ( = ?auto_783399 ?auto_783405 ) ) ( not ( = ?auto_783399 ?auto_783406 ) ) ( not ( = ?auto_783399 ?auto_783407 ) ) ( not ( = ?auto_783399 ?auto_783408 ) ) ( not ( = ?auto_783400 ?auto_783401 ) ) ( not ( = ?auto_783400 ?auto_783402 ) ) ( not ( = ?auto_783400 ?auto_783403 ) ) ( not ( = ?auto_783400 ?auto_783404 ) ) ( not ( = ?auto_783400 ?auto_783405 ) ) ( not ( = ?auto_783400 ?auto_783406 ) ) ( not ( = ?auto_783400 ?auto_783407 ) ) ( not ( = ?auto_783400 ?auto_783408 ) ) ( not ( = ?auto_783401 ?auto_783402 ) ) ( not ( = ?auto_783401 ?auto_783403 ) ) ( not ( = ?auto_783401 ?auto_783404 ) ) ( not ( = ?auto_783401 ?auto_783405 ) ) ( not ( = ?auto_783401 ?auto_783406 ) ) ( not ( = ?auto_783401 ?auto_783407 ) ) ( not ( = ?auto_783401 ?auto_783408 ) ) ( not ( = ?auto_783402 ?auto_783403 ) ) ( not ( = ?auto_783402 ?auto_783404 ) ) ( not ( = ?auto_783402 ?auto_783405 ) ) ( not ( = ?auto_783402 ?auto_783406 ) ) ( not ( = ?auto_783402 ?auto_783407 ) ) ( not ( = ?auto_783402 ?auto_783408 ) ) ( not ( = ?auto_783403 ?auto_783404 ) ) ( not ( = ?auto_783403 ?auto_783405 ) ) ( not ( = ?auto_783403 ?auto_783406 ) ) ( not ( = ?auto_783403 ?auto_783407 ) ) ( not ( = ?auto_783403 ?auto_783408 ) ) ( not ( = ?auto_783404 ?auto_783405 ) ) ( not ( = ?auto_783404 ?auto_783406 ) ) ( not ( = ?auto_783404 ?auto_783407 ) ) ( not ( = ?auto_783404 ?auto_783408 ) ) ( not ( = ?auto_783405 ?auto_783406 ) ) ( not ( = ?auto_783405 ?auto_783407 ) ) ( not ( = ?auto_783405 ?auto_783408 ) ) ( not ( = ?auto_783406 ?auto_783407 ) ) ( not ( = ?auto_783406 ?auto_783408 ) ) ( not ( = ?auto_783407 ?auto_783408 ) ) ( ON ?auto_783407 ?auto_783408 ) ( ON ?auto_783406 ?auto_783407 ) ( ON ?auto_783405 ?auto_783406 ) ( ON ?auto_783404 ?auto_783405 ) ( ON ?auto_783403 ?auto_783404 ) ( ON ?auto_783402 ?auto_783403 ) ( ON ?auto_783401 ?auto_783402 ) ( ON ?auto_783400 ?auto_783401 ) ( ON ?auto_783399 ?auto_783400 ) ( ON ?auto_783398 ?auto_783399 ) ( ON ?auto_783397 ?auto_783398 ) ( ON ?auto_783396 ?auto_783397 ) ( ON ?auto_783395 ?auto_783396 ) ( CLEAR ?auto_783393 ) ( ON ?auto_783394 ?auto_783395 ) ( CLEAR ?auto_783394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_783391 ?auto_783392 ?auto_783393 ?auto_783394 )
      ( MAKE-18PILE ?auto_783391 ?auto_783392 ?auto_783393 ?auto_783394 ?auto_783395 ?auto_783396 ?auto_783397 ?auto_783398 ?auto_783399 ?auto_783400 ?auto_783401 ?auto_783402 ?auto_783403 ?auto_783404 ?auto_783405 ?auto_783406 ?auto_783407 ?auto_783408 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_783427 - BLOCK
      ?auto_783428 - BLOCK
      ?auto_783429 - BLOCK
      ?auto_783430 - BLOCK
      ?auto_783431 - BLOCK
      ?auto_783432 - BLOCK
      ?auto_783433 - BLOCK
      ?auto_783434 - BLOCK
      ?auto_783435 - BLOCK
      ?auto_783436 - BLOCK
      ?auto_783437 - BLOCK
      ?auto_783438 - BLOCK
      ?auto_783439 - BLOCK
      ?auto_783440 - BLOCK
      ?auto_783441 - BLOCK
      ?auto_783442 - BLOCK
      ?auto_783443 - BLOCK
      ?auto_783444 - BLOCK
    )
    :vars
    (
      ?auto_783445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_783444 ?auto_783445 ) ( ON-TABLE ?auto_783427 ) ( ON ?auto_783428 ?auto_783427 ) ( not ( = ?auto_783427 ?auto_783428 ) ) ( not ( = ?auto_783427 ?auto_783429 ) ) ( not ( = ?auto_783427 ?auto_783430 ) ) ( not ( = ?auto_783427 ?auto_783431 ) ) ( not ( = ?auto_783427 ?auto_783432 ) ) ( not ( = ?auto_783427 ?auto_783433 ) ) ( not ( = ?auto_783427 ?auto_783434 ) ) ( not ( = ?auto_783427 ?auto_783435 ) ) ( not ( = ?auto_783427 ?auto_783436 ) ) ( not ( = ?auto_783427 ?auto_783437 ) ) ( not ( = ?auto_783427 ?auto_783438 ) ) ( not ( = ?auto_783427 ?auto_783439 ) ) ( not ( = ?auto_783427 ?auto_783440 ) ) ( not ( = ?auto_783427 ?auto_783441 ) ) ( not ( = ?auto_783427 ?auto_783442 ) ) ( not ( = ?auto_783427 ?auto_783443 ) ) ( not ( = ?auto_783427 ?auto_783444 ) ) ( not ( = ?auto_783427 ?auto_783445 ) ) ( not ( = ?auto_783428 ?auto_783429 ) ) ( not ( = ?auto_783428 ?auto_783430 ) ) ( not ( = ?auto_783428 ?auto_783431 ) ) ( not ( = ?auto_783428 ?auto_783432 ) ) ( not ( = ?auto_783428 ?auto_783433 ) ) ( not ( = ?auto_783428 ?auto_783434 ) ) ( not ( = ?auto_783428 ?auto_783435 ) ) ( not ( = ?auto_783428 ?auto_783436 ) ) ( not ( = ?auto_783428 ?auto_783437 ) ) ( not ( = ?auto_783428 ?auto_783438 ) ) ( not ( = ?auto_783428 ?auto_783439 ) ) ( not ( = ?auto_783428 ?auto_783440 ) ) ( not ( = ?auto_783428 ?auto_783441 ) ) ( not ( = ?auto_783428 ?auto_783442 ) ) ( not ( = ?auto_783428 ?auto_783443 ) ) ( not ( = ?auto_783428 ?auto_783444 ) ) ( not ( = ?auto_783428 ?auto_783445 ) ) ( not ( = ?auto_783429 ?auto_783430 ) ) ( not ( = ?auto_783429 ?auto_783431 ) ) ( not ( = ?auto_783429 ?auto_783432 ) ) ( not ( = ?auto_783429 ?auto_783433 ) ) ( not ( = ?auto_783429 ?auto_783434 ) ) ( not ( = ?auto_783429 ?auto_783435 ) ) ( not ( = ?auto_783429 ?auto_783436 ) ) ( not ( = ?auto_783429 ?auto_783437 ) ) ( not ( = ?auto_783429 ?auto_783438 ) ) ( not ( = ?auto_783429 ?auto_783439 ) ) ( not ( = ?auto_783429 ?auto_783440 ) ) ( not ( = ?auto_783429 ?auto_783441 ) ) ( not ( = ?auto_783429 ?auto_783442 ) ) ( not ( = ?auto_783429 ?auto_783443 ) ) ( not ( = ?auto_783429 ?auto_783444 ) ) ( not ( = ?auto_783429 ?auto_783445 ) ) ( not ( = ?auto_783430 ?auto_783431 ) ) ( not ( = ?auto_783430 ?auto_783432 ) ) ( not ( = ?auto_783430 ?auto_783433 ) ) ( not ( = ?auto_783430 ?auto_783434 ) ) ( not ( = ?auto_783430 ?auto_783435 ) ) ( not ( = ?auto_783430 ?auto_783436 ) ) ( not ( = ?auto_783430 ?auto_783437 ) ) ( not ( = ?auto_783430 ?auto_783438 ) ) ( not ( = ?auto_783430 ?auto_783439 ) ) ( not ( = ?auto_783430 ?auto_783440 ) ) ( not ( = ?auto_783430 ?auto_783441 ) ) ( not ( = ?auto_783430 ?auto_783442 ) ) ( not ( = ?auto_783430 ?auto_783443 ) ) ( not ( = ?auto_783430 ?auto_783444 ) ) ( not ( = ?auto_783430 ?auto_783445 ) ) ( not ( = ?auto_783431 ?auto_783432 ) ) ( not ( = ?auto_783431 ?auto_783433 ) ) ( not ( = ?auto_783431 ?auto_783434 ) ) ( not ( = ?auto_783431 ?auto_783435 ) ) ( not ( = ?auto_783431 ?auto_783436 ) ) ( not ( = ?auto_783431 ?auto_783437 ) ) ( not ( = ?auto_783431 ?auto_783438 ) ) ( not ( = ?auto_783431 ?auto_783439 ) ) ( not ( = ?auto_783431 ?auto_783440 ) ) ( not ( = ?auto_783431 ?auto_783441 ) ) ( not ( = ?auto_783431 ?auto_783442 ) ) ( not ( = ?auto_783431 ?auto_783443 ) ) ( not ( = ?auto_783431 ?auto_783444 ) ) ( not ( = ?auto_783431 ?auto_783445 ) ) ( not ( = ?auto_783432 ?auto_783433 ) ) ( not ( = ?auto_783432 ?auto_783434 ) ) ( not ( = ?auto_783432 ?auto_783435 ) ) ( not ( = ?auto_783432 ?auto_783436 ) ) ( not ( = ?auto_783432 ?auto_783437 ) ) ( not ( = ?auto_783432 ?auto_783438 ) ) ( not ( = ?auto_783432 ?auto_783439 ) ) ( not ( = ?auto_783432 ?auto_783440 ) ) ( not ( = ?auto_783432 ?auto_783441 ) ) ( not ( = ?auto_783432 ?auto_783442 ) ) ( not ( = ?auto_783432 ?auto_783443 ) ) ( not ( = ?auto_783432 ?auto_783444 ) ) ( not ( = ?auto_783432 ?auto_783445 ) ) ( not ( = ?auto_783433 ?auto_783434 ) ) ( not ( = ?auto_783433 ?auto_783435 ) ) ( not ( = ?auto_783433 ?auto_783436 ) ) ( not ( = ?auto_783433 ?auto_783437 ) ) ( not ( = ?auto_783433 ?auto_783438 ) ) ( not ( = ?auto_783433 ?auto_783439 ) ) ( not ( = ?auto_783433 ?auto_783440 ) ) ( not ( = ?auto_783433 ?auto_783441 ) ) ( not ( = ?auto_783433 ?auto_783442 ) ) ( not ( = ?auto_783433 ?auto_783443 ) ) ( not ( = ?auto_783433 ?auto_783444 ) ) ( not ( = ?auto_783433 ?auto_783445 ) ) ( not ( = ?auto_783434 ?auto_783435 ) ) ( not ( = ?auto_783434 ?auto_783436 ) ) ( not ( = ?auto_783434 ?auto_783437 ) ) ( not ( = ?auto_783434 ?auto_783438 ) ) ( not ( = ?auto_783434 ?auto_783439 ) ) ( not ( = ?auto_783434 ?auto_783440 ) ) ( not ( = ?auto_783434 ?auto_783441 ) ) ( not ( = ?auto_783434 ?auto_783442 ) ) ( not ( = ?auto_783434 ?auto_783443 ) ) ( not ( = ?auto_783434 ?auto_783444 ) ) ( not ( = ?auto_783434 ?auto_783445 ) ) ( not ( = ?auto_783435 ?auto_783436 ) ) ( not ( = ?auto_783435 ?auto_783437 ) ) ( not ( = ?auto_783435 ?auto_783438 ) ) ( not ( = ?auto_783435 ?auto_783439 ) ) ( not ( = ?auto_783435 ?auto_783440 ) ) ( not ( = ?auto_783435 ?auto_783441 ) ) ( not ( = ?auto_783435 ?auto_783442 ) ) ( not ( = ?auto_783435 ?auto_783443 ) ) ( not ( = ?auto_783435 ?auto_783444 ) ) ( not ( = ?auto_783435 ?auto_783445 ) ) ( not ( = ?auto_783436 ?auto_783437 ) ) ( not ( = ?auto_783436 ?auto_783438 ) ) ( not ( = ?auto_783436 ?auto_783439 ) ) ( not ( = ?auto_783436 ?auto_783440 ) ) ( not ( = ?auto_783436 ?auto_783441 ) ) ( not ( = ?auto_783436 ?auto_783442 ) ) ( not ( = ?auto_783436 ?auto_783443 ) ) ( not ( = ?auto_783436 ?auto_783444 ) ) ( not ( = ?auto_783436 ?auto_783445 ) ) ( not ( = ?auto_783437 ?auto_783438 ) ) ( not ( = ?auto_783437 ?auto_783439 ) ) ( not ( = ?auto_783437 ?auto_783440 ) ) ( not ( = ?auto_783437 ?auto_783441 ) ) ( not ( = ?auto_783437 ?auto_783442 ) ) ( not ( = ?auto_783437 ?auto_783443 ) ) ( not ( = ?auto_783437 ?auto_783444 ) ) ( not ( = ?auto_783437 ?auto_783445 ) ) ( not ( = ?auto_783438 ?auto_783439 ) ) ( not ( = ?auto_783438 ?auto_783440 ) ) ( not ( = ?auto_783438 ?auto_783441 ) ) ( not ( = ?auto_783438 ?auto_783442 ) ) ( not ( = ?auto_783438 ?auto_783443 ) ) ( not ( = ?auto_783438 ?auto_783444 ) ) ( not ( = ?auto_783438 ?auto_783445 ) ) ( not ( = ?auto_783439 ?auto_783440 ) ) ( not ( = ?auto_783439 ?auto_783441 ) ) ( not ( = ?auto_783439 ?auto_783442 ) ) ( not ( = ?auto_783439 ?auto_783443 ) ) ( not ( = ?auto_783439 ?auto_783444 ) ) ( not ( = ?auto_783439 ?auto_783445 ) ) ( not ( = ?auto_783440 ?auto_783441 ) ) ( not ( = ?auto_783440 ?auto_783442 ) ) ( not ( = ?auto_783440 ?auto_783443 ) ) ( not ( = ?auto_783440 ?auto_783444 ) ) ( not ( = ?auto_783440 ?auto_783445 ) ) ( not ( = ?auto_783441 ?auto_783442 ) ) ( not ( = ?auto_783441 ?auto_783443 ) ) ( not ( = ?auto_783441 ?auto_783444 ) ) ( not ( = ?auto_783441 ?auto_783445 ) ) ( not ( = ?auto_783442 ?auto_783443 ) ) ( not ( = ?auto_783442 ?auto_783444 ) ) ( not ( = ?auto_783442 ?auto_783445 ) ) ( not ( = ?auto_783443 ?auto_783444 ) ) ( not ( = ?auto_783443 ?auto_783445 ) ) ( not ( = ?auto_783444 ?auto_783445 ) ) ( ON ?auto_783443 ?auto_783444 ) ( ON ?auto_783442 ?auto_783443 ) ( ON ?auto_783441 ?auto_783442 ) ( ON ?auto_783440 ?auto_783441 ) ( ON ?auto_783439 ?auto_783440 ) ( ON ?auto_783438 ?auto_783439 ) ( ON ?auto_783437 ?auto_783438 ) ( ON ?auto_783436 ?auto_783437 ) ( ON ?auto_783435 ?auto_783436 ) ( ON ?auto_783434 ?auto_783435 ) ( ON ?auto_783433 ?auto_783434 ) ( ON ?auto_783432 ?auto_783433 ) ( ON ?auto_783431 ?auto_783432 ) ( ON ?auto_783430 ?auto_783431 ) ( CLEAR ?auto_783428 ) ( ON ?auto_783429 ?auto_783430 ) ( CLEAR ?auto_783429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_783427 ?auto_783428 ?auto_783429 )
      ( MAKE-18PILE ?auto_783427 ?auto_783428 ?auto_783429 ?auto_783430 ?auto_783431 ?auto_783432 ?auto_783433 ?auto_783434 ?auto_783435 ?auto_783436 ?auto_783437 ?auto_783438 ?auto_783439 ?auto_783440 ?auto_783441 ?auto_783442 ?auto_783443 ?auto_783444 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_783464 - BLOCK
      ?auto_783465 - BLOCK
      ?auto_783466 - BLOCK
      ?auto_783467 - BLOCK
      ?auto_783468 - BLOCK
      ?auto_783469 - BLOCK
      ?auto_783470 - BLOCK
      ?auto_783471 - BLOCK
      ?auto_783472 - BLOCK
      ?auto_783473 - BLOCK
      ?auto_783474 - BLOCK
      ?auto_783475 - BLOCK
      ?auto_783476 - BLOCK
      ?auto_783477 - BLOCK
      ?auto_783478 - BLOCK
      ?auto_783479 - BLOCK
      ?auto_783480 - BLOCK
      ?auto_783481 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_783481 ) ( ON-TABLE ?auto_783464 ) ( ON ?auto_783465 ?auto_783464 ) ( not ( = ?auto_783464 ?auto_783465 ) ) ( not ( = ?auto_783464 ?auto_783466 ) ) ( not ( = ?auto_783464 ?auto_783467 ) ) ( not ( = ?auto_783464 ?auto_783468 ) ) ( not ( = ?auto_783464 ?auto_783469 ) ) ( not ( = ?auto_783464 ?auto_783470 ) ) ( not ( = ?auto_783464 ?auto_783471 ) ) ( not ( = ?auto_783464 ?auto_783472 ) ) ( not ( = ?auto_783464 ?auto_783473 ) ) ( not ( = ?auto_783464 ?auto_783474 ) ) ( not ( = ?auto_783464 ?auto_783475 ) ) ( not ( = ?auto_783464 ?auto_783476 ) ) ( not ( = ?auto_783464 ?auto_783477 ) ) ( not ( = ?auto_783464 ?auto_783478 ) ) ( not ( = ?auto_783464 ?auto_783479 ) ) ( not ( = ?auto_783464 ?auto_783480 ) ) ( not ( = ?auto_783464 ?auto_783481 ) ) ( not ( = ?auto_783465 ?auto_783466 ) ) ( not ( = ?auto_783465 ?auto_783467 ) ) ( not ( = ?auto_783465 ?auto_783468 ) ) ( not ( = ?auto_783465 ?auto_783469 ) ) ( not ( = ?auto_783465 ?auto_783470 ) ) ( not ( = ?auto_783465 ?auto_783471 ) ) ( not ( = ?auto_783465 ?auto_783472 ) ) ( not ( = ?auto_783465 ?auto_783473 ) ) ( not ( = ?auto_783465 ?auto_783474 ) ) ( not ( = ?auto_783465 ?auto_783475 ) ) ( not ( = ?auto_783465 ?auto_783476 ) ) ( not ( = ?auto_783465 ?auto_783477 ) ) ( not ( = ?auto_783465 ?auto_783478 ) ) ( not ( = ?auto_783465 ?auto_783479 ) ) ( not ( = ?auto_783465 ?auto_783480 ) ) ( not ( = ?auto_783465 ?auto_783481 ) ) ( not ( = ?auto_783466 ?auto_783467 ) ) ( not ( = ?auto_783466 ?auto_783468 ) ) ( not ( = ?auto_783466 ?auto_783469 ) ) ( not ( = ?auto_783466 ?auto_783470 ) ) ( not ( = ?auto_783466 ?auto_783471 ) ) ( not ( = ?auto_783466 ?auto_783472 ) ) ( not ( = ?auto_783466 ?auto_783473 ) ) ( not ( = ?auto_783466 ?auto_783474 ) ) ( not ( = ?auto_783466 ?auto_783475 ) ) ( not ( = ?auto_783466 ?auto_783476 ) ) ( not ( = ?auto_783466 ?auto_783477 ) ) ( not ( = ?auto_783466 ?auto_783478 ) ) ( not ( = ?auto_783466 ?auto_783479 ) ) ( not ( = ?auto_783466 ?auto_783480 ) ) ( not ( = ?auto_783466 ?auto_783481 ) ) ( not ( = ?auto_783467 ?auto_783468 ) ) ( not ( = ?auto_783467 ?auto_783469 ) ) ( not ( = ?auto_783467 ?auto_783470 ) ) ( not ( = ?auto_783467 ?auto_783471 ) ) ( not ( = ?auto_783467 ?auto_783472 ) ) ( not ( = ?auto_783467 ?auto_783473 ) ) ( not ( = ?auto_783467 ?auto_783474 ) ) ( not ( = ?auto_783467 ?auto_783475 ) ) ( not ( = ?auto_783467 ?auto_783476 ) ) ( not ( = ?auto_783467 ?auto_783477 ) ) ( not ( = ?auto_783467 ?auto_783478 ) ) ( not ( = ?auto_783467 ?auto_783479 ) ) ( not ( = ?auto_783467 ?auto_783480 ) ) ( not ( = ?auto_783467 ?auto_783481 ) ) ( not ( = ?auto_783468 ?auto_783469 ) ) ( not ( = ?auto_783468 ?auto_783470 ) ) ( not ( = ?auto_783468 ?auto_783471 ) ) ( not ( = ?auto_783468 ?auto_783472 ) ) ( not ( = ?auto_783468 ?auto_783473 ) ) ( not ( = ?auto_783468 ?auto_783474 ) ) ( not ( = ?auto_783468 ?auto_783475 ) ) ( not ( = ?auto_783468 ?auto_783476 ) ) ( not ( = ?auto_783468 ?auto_783477 ) ) ( not ( = ?auto_783468 ?auto_783478 ) ) ( not ( = ?auto_783468 ?auto_783479 ) ) ( not ( = ?auto_783468 ?auto_783480 ) ) ( not ( = ?auto_783468 ?auto_783481 ) ) ( not ( = ?auto_783469 ?auto_783470 ) ) ( not ( = ?auto_783469 ?auto_783471 ) ) ( not ( = ?auto_783469 ?auto_783472 ) ) ( not ( = ?auto_783469 ?auto_783473 ) ) ( not ( = ?auto_783469 ?auto_783474 ) ) ( not ( = ?auto_783469 ?auto_783475 ) ) ( not ( = ?auto_783469 ?auto_783476 ) ) ( not ( = ?auto_783469 ?auto_783477 ) ) ( not ( = ?auto_783469 ?auto_783478 ) ) ( not ( = ?auto_783469 ?auto_783479 ) ) ( not ( = ?auto_783469 ?auto_783480 ) ) ( not ( = ?auto_783469 ?auto_783481 ) ) ( not ( = ?auto_783470 ?auto_783471 ) ) ( not ( = ?auto_783470 ?auto_783472 ) ) ( not ( = ?auto_783470 ?auto_783473 ) ) ( not ( = ?auto_783470 ?auto_783474 ) ) ( not ( = ?auto_783470 ?auto_783475 ) ) ( not ( = ?auto_783470 ?auto_783476 ) ) ( not ( = ?auto_783470 ?auto_783477 ) ) ( not ( = ?auto_783470 ?auto_783478 ) ) ( not ( = ?auto_783470 ?auto_783479 ) ) ( not ( = ?auto_783470 ?auto_783480 ) ) ( not ( = ?auto_783470 ?auto_783481 ) ) ( not ( = ?auto_783471 ?auto_783472 ) ) ( not ( = ?auto_783471 ?auto_783473 ) ) ( not ( = ?auto_783471 ?auto_783474 ) ) ( not ( = ?auto_783471 ?auto_783475 ) ) ( not ( = ?auto_783471 ?auto_783476 ) ) ( not ( = ?auto_783471 ?auto_783477 ) ) ( not ( = ?auto_783471 ?auto_783478 ) ) ( not ( = ?auto_783471 ?auto_783479 ) ) ( not ( = ?auto_783471 ?auto_783480 ) ) ( not ( = ?auto_783471 ?auto_783481 ) ) ( not ( = ?auto_783472 ?auto_783473 ) ) ( not ( = ?auto_783472 ?auto_783474 ) ) ( not ( = ?auto_783472 ?auto_783475 ) ) ( not ( = ?auto_783472 ?auto_783476 ) ) ( not ( = ?auto_783472 ?auto_783477 ) ) ( not ( = ?auto_783472 ?auto_783478 ) ) ( not ( = ?auto_783472 ?auto_783479 ) ) ( not ( = ?auto_783472 ?auto_783480 ) ) ( not ( = ?auto_783472 ?auto_783481 ) ) ( not ( = ?auto_783473 ?auto_783474 ) ) ( not ( = ?auto_783473 ?auto_783475 ) ) ( not ( = ?auto_783473 ?auto_783476 ) ) ( not ( = ?auto_783473 ?auto_783477 ) ) ( not ( = ?auto_783473 ?auto_783478 ) ) ( not ( = ?auto_783473 ?auto_783479 ) ) ( not ( = ?auto_783473 ?auto_783480 ) ) ( not ( = ?auto_783473 ?auto_783481 ) ) ( not ( = ?auto_783474 ?auto_783475 ) ) ( not ( = ?auto_783474 ?auto_783476 ) ) ( not ( = ?auto_783474 ?auto_783477 ) ) ( not ( = ?auto_783474 ?auto_783478 ) ) ( not ( = ?auto_783474 ?auto_783479 ) ) ( not ( = ?auto_783474 ?auto_783480 ) ) ( not ( = ?auto_783474 ?auto_783481 ) ) ( not ( = ?auto_783475 ?auto_783476 ) ) ( not ( = ?auto_783475 ?auto_783477 ) ) ( not ( = ?auto_783475 ?auto_783478 ) ) ( not ( = ?auto_783475 ?auto_783479 ) ) ( not ( = ?auto_783475 ?auto_783480 ) ) ( not ( = ?auto_783475 ?auto_783481 ) ) ( not ( = ?auto_783476 ?auto_783477 ) ) ( not ( = ?auto_783476 ?auto_783478 ) ) ( not ( = ?auto_783476 ?auto_783479 ) ) ( not ( = ?auto_783476 ?auto_783480 ) ) ( not ( = ?auto_783476 ?auto_783481 ) ) ( not ( = ?auto_783477 ?auto_783478 ) ) ( not ( = ?auto_783477 ?auto_783479 ) ) ( not ( = ?auto_783477 ?auto_783480 ) ) ( not ( = ?auto_783477 ?auto_783481 ) ) ( not ( = ?auto_783478 ?auto_783479 ) ) ( not ( = ?auto_783478 ?auto_783480 ) ) ( not ( = ?auto_783478 ?auto_783481 ) ) ( not ( = ?auto_783479 ?auto_783480 ) ) ( not ( = ?auto_783479 ?auto_783481 ) ) ( not ( = ?auto_783480 ?auto_783481 ) ) ( ON ?auto_783480 ?auto_783481 ) ( ON ?auto_783479 ?auto_783480 ) ( ON ?auto_783478 ?auto_783479 ) ( ON ?auto_783477 ?auto_783478 ) ( ON ?auto_783476 ?auto_783477 ) ( ON ?auto_783475 ?auto_783476 ) ( ON ?auto_783474 ?auto_783475 ) ( ON ?auto_783473 ?auto_783474 ) ( ON ?auto_783472 ?auto_783473 ) ( ON ?auto_783471 ?auto_783472 ) ( ON ?auto_783470 ?auto_783471 ) ( ON ?auto_783469 ?auto_783470 ) ( ON ?auto_783468 ?auto_783469 ) ( ON ?auto_783467 ?auto_783468 ) ( CLEAR ?auto_783465 ) ( ON ?auto_783466 ?auto_783467 ) ( CLEAR ?auto_783466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_783464 ?auto_783465 ?auto_783466 )
      ( MAKE-18PILE ?auto_783464 ?auto_783465 ?auto_783466 ?auto_783467 ?auto_783468 ?auto_783469 ?auto_783470 ?auto_783471 ?auto_783472 ?auto_783473 ?auto_783474 ?auto_783475 ?auto_783476 ?auto_783477 ?auto_783478 ?auto_783479 ?auto_783480 ?auto_783481 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_783500 - BLOCK
      ?auto_783501 - BLOCK
      ?auto_783502 - BLOCK
      ?auto_783503 - BLOCK
      ?auto_783504 - BLOCK
      ?auto_783505 - BLOCK
      ?auto_783506 - BLOCK
      ?auto_783507 - BLOCK
      ?auto_783508 - BLOCK
      ?auto_783509 - BLOCK
      ?auto_783510 - BLOCK
      ?auto_783511 - BLOCK
      ?auto_783512 - BLOCK
      ?auto_783513 - BLOCK
      ?auto_783514 - BLOCK
      ?auto_783515 - BLOCK
      ?auto_783516 - BLOCK
      ?auto_783517 - BLOCK
    )
    :vars
    (
      ?auto_783518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_783517 ?auto_783518 ) ( ON-TABLE ?auto_783500 ) ( not ( = ?auto_783500 ?auto_783501 ) ) ( not ( = ?auto_783500 ?auto_783502 ) ) ( not ( = ?auto_783500 ?auto_783503 ) ) ( not ( = ?auto_783500 ?auto_783504 ) ) ( not ( = ?auto_783500 ?auto_783505 ) ) ( not ( = ?auto_783500 ?auto_783506 ) ) ( not ( = ?auto_783500 ?auto_783507 ) ) ( not ( = ?auto_783500 ?auto_783508 ) ) ( not ( = ?auto_783500 ?auto_783509 ) ) ( not ( = ?auto_783500 ?auto_783510 ) ) ( not ( = ?auto_783500 ?auto_783511 ) ) ( not ( = ?auto_783500 ?auto_783512 ) ) ( not ( = ?auto_783500 ?auto_783513 ) ) ( not ( = ?auto_783500 ?auto_783514 ) ) ( not ( = ?auto_783500 ?auto_783515 ) ) ( not ( = ?auto_783500 ?auto_783516 ) ) ( not ( = ?auto_783500 ?auto_783517 ) ) ( not ( = ?auto_783500 ?auto_783518 ) ) ( not ( = ?auto_783501 ?auto_783502 ) ) ( not ( = ?auto_783501 ?auto_783503 ) ) ( not ( = ?auto_783501 ?auto_783504 ) ) ( not ( = ?auto_783501 ?auto_783505 ) ) ( not ( = ?auto_783501 ?auto_783506 ) ) ( not ( = ?auto_783501 ?auto_783507 ) ) ( not ( = ?auto_783501 ?auto_783508 ) ) ( not ( = ?auto_783501 ?auto_783509 ) ) ( not ( = ?auto_783501 ?auto_783510 ) ) ( not ( = ?auto_783501 ?auto_783511 ) ) ( not ( = ?auto_783501 ?auto_783512 ) ) ( not ( = ?auto_783501 ?auto_783513 ) ) ( not ( = ?auto_783501 ?auto_783514 ) ) ( not ( = ?auto_783501 ?auto_783515 ) ) ( not ( = ?auto_783501 ?auto_783516 ) ) ( not ( = ?auto_783501 ?auto_783517 ) ) ( not ( = ?auto_783501 ?auto_783518 ) ) ( not ( = ?auto_783502 ?auto_783503 ) ) ( not ( = ?auto_783502 ?auto_783504 ) ) ( not ( = ?auto_783502 ?auto_783505 ) ) ( not ( = ?auto_783502 ?auto_783506 ) ) ( not ( = ?auto_783502 ?auto_783507 ) ) ( not ( = ?auto_783502 ?auto_783508 ) ) ( not ( = ?auto_783502 ?auto_783509 ) ) ( not ( = ?auto_783502 ?auto_783510 ) ) ( not ( = ?auto_783502 ?auto_783511 ) ) ( not ( = ?auto_783502 ?auto_783512 ) ) ( not ( = ?auto_783502 ?auto_783513 ) ) ( not ( = ?auto_783502 ?auto_783514 ) ) ( not ( = ?auto_783502 ?auto_783515 ) ) ( not ( = ?auto_783502 ?auto_783516 ) ) ( not ( = ?auto_783502 ?auto_783517 ) ) ( not ( = ?auto_783502 ?auto_783518 ) ) ( not ( = ?auto_783503 ?auto_783504 ) ) ( not ( = ?auto_783503 ?auto_783505 ) ) ( not ( = ?auto_783503 ?auto_783506 ) ) ( not ( = ?auto_783503 ?auto_783507 ) ) ( not ( = ?auto_783503 ?auto_783508 ) ) ( not ( = ?auto_783503 ?auto_783509 ) ) ( not ( = ?auto_783503 ?auto_783510 ) ) ( not ( = ?auto_783503 ?auto_783511 ) ) ( not ( = ?auto_783503 ?auto_783512 ) ) ( not ( = ?auto_783503 ?auto_783513 ) ) ( not ( = ?auto_783503 ?auto_783514 ) ) ( not ( = ?auto_783503 ?auto_783515 ) ) ( not ( = ?auto_783503 ?auto_783516 ) ) ( not ( = ?auto_783503 ?auto_783517 ) ) ( not ( = ?auto_783503 ?auto_783518 ) ) ( not ( = ?auto_783504 ?auto_783505 ) ) ( not ( = ?auto_783504 ?auto_783506 ) ) ( not ( = ?auto_783504 ?auto_783507 ) ) ( not ( = ?auto_783504 ?auto_783508 ) ) ( not ( = ?auto_783504 ?auto_783509 ) ) ( not ( = ?auto_783504 ?auto_783510 ) ) ( not ( = ?auto_783504 ?auto_783511 ) ) ( not ( = ?auto_783504 ?auto_783512 ) ) ( not ( = ?auto_783504 ?auto_783513 ) ) ( not ( = ?auto_783504 ?auto_783514 ) ) ( not ( = ?auto_783504 ?auto_783515 ) ) ( not ( = ?auto_783504 ?auto_783516 ) ) ( not ( = ?auto_783504 ?auto_783517 ) ) ( not ( = ?auto_783504 ?auto_783518 ) ) ( not ( = ?auto_783505 ?auto_783506 ) ) ( not ( = ?auto_783505 ?auto_783507 ) ) ( not ( = ?auto_783505 ?auto_783508 ) ) ( not ( = ?auto_783505 ?auto_783509 ) ) ( not ( = ?auto_783505 ?auto_783510 ) ) ( not ( = ?auto_783505 ?auto_783511 ) ) ( not ( = ?auto_783505 ?auto_783512 ) ) ( not ( = ?auto_783505 ?auto_783513 ) ) ( not ( = ?auto_783505 ?auto_783514 ) ) ( not ( = ?auto_783505 ?auto_783515 ) ) ( not ( = ?auto_783505 ?auto_783516 ) ) ( not ( = ?auto_783505 ?auto_783517 ) ) ( not ( = ?auto_783505 ?auto_783518 ) ) ( not ( = ?auto_783506 ?auto_783507 ) ) ( not ( = ?auto_783506 ?auto_783508 ) ) ( not ( = ?auto_783506 ?auto_783509 ) ) ( not ( = ?auto_783506 ?auto_783510 ) ) ( not ( = ?auto_783506 ?auto_783511 ) ) ( not ( = ?auto_783506 ?auto_783512 ) ) ( not ( = ?auto_783506 ?auto_783513 ) ) ( not ( = ?auto_783506 ?auto_783514 ) ) ( not ( = ?auto_783506 ?auto_783515 ) ) ( not ( = ?auto_783506 ?auto_783516 ) ) ( not ( = ?auto_783506 ?auto_783517 ) ) ( not ( = ?auto_783506 ?auto_783518 ) ) ( not ( = ?auto_783507 ?auto_783508 ) ) ( not ( = ?auto_783507 ?auto_783509 ) ) ( not ( = ?auto_783507 ?auto_783510 ) ) ( not ( = ?auto_783507 ?auto_783511 ) ) ( not ( = ?auto_783507 ?auto_783512 ) ) ( not ( = ?auto_783507 ?auto_783513 ) ) ( not ( = ?auto_783507 ?auto_783514 ) ) ( not ( = ?auto_783507 ?auto_783515 ) ) ( not ( = ?auto_783507 ?auto_783516 ) ) ( not ( = ?auto_783507 ?auto_783517 ) ) ( not ( = ?auto_783507 ?auto_783518 ) ) ( not ( = ?auto_783508 ?auto_783509 ) ) ( not ( = ?auto_783508 ?auto_783510 ) ) ( not ( = ?auto_783508 ?auto_783511 ) ) ( not ( = ?auto_783508 ?auto_783512 ) ) ( not ( = ?auto_783508 ?auto_783513 ) ) ( not ( = ?auto_783508 ?auto_783514 ) ) ( not ( = ?auto_783508 ?auto_783515 ) ) ( not ( = ?auto_783508 ?auto_783516 ) ) ( not ( = ?auto_783508 ?auto_783517 ) ) ( not ( = ?auto_783508 ?auto_783518 ) ) ( not ( = ?auto_783509 ?auto_783510 ) ) ( not ( = ?auto_783509 ?auto_783511 ) ) ( not ( = ?auto_783509 ?auto_783512 ) ) ( not ( = ?auto_783509 ?auto_783513 ) ) ( not ( = ?auto_783509 ?auto_783514 ) ) ( not ( = ?auto_783509 ?auto_783515 ) ) ( not ( = ?auto_783509 ?auto_783516 ) ) ( not ( = ?auto_783509 ?auto_783517 ) ) ( not ( = ?auto_783509 ?auto_783518 ) ) ( not ( = ?auto_783510 ?auto_783511 ) ) ( not ( = ?auto_783510 ?auto_783512 ) ) ( not ( = ?auto_783510 ?auto_783513 ) ) ( not ( = ?auto_783510 ?auto_783514 ) ) ( not ( = ?auto_783510 ?auto_783515 ) ) ( not ( = ?auto_783510 ?auto_783516 ) ) ( not ( = ?auto_783510 ?auto_783517 ) ) ( not ( = ?auto_783510 ?auto_783518 ) ) ( not ( = ?auto_783511 ?auto_783512 ) ) ( not ( = ?auto_783511 ?auto_783513 ) ) ( not ( = ?auto_783511 ?auto_783514 ) ) ( not ( = ?auto_783511 ?auto_783515 ) ) ( not ( = ?auto_783511 ?auto_783516 ) ) ( not ( = ?auto_783511 ?auto_783517 ) ) ( not ( = ?auto_783511 ?auto_783518 ) ) ( not ( = ?auto_783512 ?auto_783513 ) ) ( not ( = ?auto_783512 ?auto_783514 ) ) ( not ( = ?auto_783512 ?auto_783515 ) ) ( not ( = ?auto_783512 ?auto_783516 ) ) ( not ( = ?auto_783512 ?auto_783517 ) ) ( not ( = ?auto_783512 ?auto_783518 ) ) ( not ( = ?auto_783513 ?auto_783514 ) ) ( not ( = ?auto_783513 ?auto_783515 ) ) ( not ( = ?auto_783513 ?auto_783516 ) ) ( not ( = ?auto_783513 ?auto_783517 ) ) ( not ( = ?auto_783513 ?auto_783518 ) ) ( not ( = ?auto_783514 ?auto_783515 ) ) ( not ( = ?auto_783514 ?auto_783516 ) ) ( not ( = ?auto_783514 ?auto_783517 ) ) ( not ( = ?auto_783514 ?auto_783518 ) ) ( not ( = ?auto_783515 ?auto_783516 ) ) ( not ( = ?auto_783515 ?auto_783517 ) ) ( not ( = ?auto_783515 ?auto_783518 ) ) ( not ( = ?auto_783516 ?auto_783517 ) ) ( not ( = ?auto_783516 ?auto_783518 ) ) ( not ( = ?auto_783517 ?auto_783518 ) ) ( ON ?auto_783516 ?auto_783517 ) ( ON ?auto_783515 ?auto_783516 ) ( ON ?auto_783514 ?auto_783515 ) ( ON ?auto_783513 ?auto_783514 ) ( ON ?auto_783512 ?auto_783513 ) ( ON ?auto_783511 ?auto_783512 ) ( ON ?auto_783510 ?auto_783511 ) ( ON ?auto_783509 ?auto_783510 ) ( ON ?auto_783508 ?auto_783509 ) ( ON ?auto_783507 ?auto_783508 ) ( ON ?auto_783506 ?auto_783507 ) ( ON ?auto_783505 ?auto_783506 ) ( ON ?auto_783504 ?auto_783505 ) ( ON ?auto_783503 ?auto_783504 ) ( ON ?auto_783502 ?auto_783503 ) ( CLEAR ?auto_783500 ) ( ON ?auto_783501 ?auto_783502 ) ( CLEAR ?auto_783501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_783500 ?auto_783501 )
      ( MAKE-18PILE ?auto_783500 ?auto_783501 ?auto_783502 ?auto_783503 ?auto_783504 ?auto_783505 ?auto_783506 ?auto_783507 ?auto_783508 ?auto_783509 ?auto_783510 ?auto_783511 ?auto_783512 ?auto_783513 ?auto_783514 ?auto_783515 ?auto_783516 ?auto_783517 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_783537 - BLOCK
      ?auto_783538 - BLOCK
      ?auto_783539 - BLOCK
      ?auto_783540 - BLOCK
      ?auto_783541 - BLOCK
      ?auto_783542 - BLOCK
      ?auto_783543 - BLOCK
      ?auto_783544 - BLOCK
      ?auto_783545 - BLOCK
      ?auto_783546 - BLOCK
      ?auto_783547 - BLOCK
      ?auto_783548 - BLOCK
      ?auto_783549 - BLOCK
      ?auto_783550 - BLOCK
      ?auto_783551 - BLOCK
      ?auto_783552 - BLOCK
      ?auto_783553 - BLOCK
      ?auto_783554 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_783554 ) ( ON-TABLE ?auto_783537 ) ( not ( = ?auto_783537 ?auto_783538 ) ) ( not ( = ?auto_783537 ?auto_783539 ) ) ( not ( = ?auto_783537 ?auto_783540 ) ) ( not ( = ?auto_783537 ?auto_783541 ) ) ( not ( = ?auto_783537 ?auto_783542 ) ) ( not ( = ?auto_783537 ?auto_783543 ) ) ( not ( = ?auto_783537 ?auto_783544 ) ) ( not ( = ?auto_783537 ?auto_783545 ) ) ( not ( = ?auto_783537 ?auto_783546 ) ) ( not ( = ?auto_783537 ?auto_783547 ) ) ( not ( = ?auto_783537 ?auto_783548 ) ) ( not ( = ?auto_783537 ?auto_783549 ) ) ( not ( = ?auto_783537 ?auto_783550 ) ) ( not ( = ?auto_783537 ?auto_783551 ) ) ( not ( = ?auto_783537 ?auto_783552 ) ) ( not ( = ?auto_783537 ?auto_783553 ) ) ( not ( = ?auto_783537 ?auto_783554 ) ) ( not ( = ?auto_783538 ?auto_783539 ) ) ( not ( = ?auto_783538 ?auto_783540 ) ) ( not ( = ?auto_783538 ?auto_783541 ) ) ( not ( = ?auto_783538 ?auto_783542 ) ) ( not ( = ?auto_783538 ?auto_783543 ) ) ( not ( = ?auto_783538 ?auto_783544 ) ) ( not ( = ?auto_783538 ?auto_783545 ) ) ( not ( = ?auto_783538 ?auto_783546 ) ) ( not ( = ?auto_783538 ?auto_783547 ) ) ( not ( = ?auto_783538 ?auto_783548 ) ) ( not ( = ?auto_783538 ?auto_783549 ) ) ( not ( = ?auto_783538 ?auto_783550 ) ) ( not ( = ?auto_783538 ?auto_783551 ) ) ( not ( = ?auto_783538 ?auto_783552 ) ) ( not ( = ?auto_783538 ?auto_783553 ) ) ( not ( = ?auto_783538 ?auto_783554 ) ) ( not ( = ?auto_783539 ?auto_783540 ) ) ( not ( = ?auto_783539 ?auto_783541 ) ) ( not ( = ?auto_783539 ?auto_783542 ) ) ( not ( = ?auto_783539 ?auto_783543 ) ) ( not ( = ?auto_783539 ?auto_783544 ) ) ( not ( = ?auto_783539 ?auto_783545 ) ) ( not ( = ?auto_783539 ?auto_783546 ) ) ( not ( = ?auto_783539 ?auto_783547 ) ) ( not ( = ?auto_783539 ?auto_783548 ) ) ( not ( = ?auto_783539 ?auto_783549 ) ) ( not ( = ?auto_783539 ?auto_783550 ) ) ( not ( = ?auto_783539 ?auto_783551 ) ) ( not ( = ?auto_783539 ?auto_783552 ) ) ( not ( = ?auto_783539 ?auto_783553 ) ) ( not ( = ?auto_783539 ?auto_783554 ) ) ( not ( = ?auto_783540 ?auto_783541 ) ) ( not ( = ?auto_783540 ?auto_783542 ) ) ( not ( = ?auto_783540 ?auto_783543 ) ) ( not ( = ?auto_783540 ?auto_783544 ) ) ( not ( = ?auto_783540 ?auto_783545 ) ) ( not ( = ?auto_783540 ?auto_783546 ) ) ( not ( = ?auto_783540 ?auto_783547 ) ) ( not ( = ?auto_783540 ?auto_783548 ) ) ( not ( = ?auto_783540 ?auto_783549 ) ) ( not ( = ?auto_783540 ?auto_783550 ) ) ( not ( = ?auto_783540 ?auto_783551 ) ) ( not ( = ?auto_783540 ?auto_783552 ) ) ( not ( = ?auto_783540 ?auto_783553 ) ) ( not ( = ?auto_783540 ?auto_783554 ) ) ( not ( = ?auto_783541 ?auto_783542 ) ) ( not ( = ?auto_783541 ?auto_783543 ) ) ( not ( = ?auto_783541 ?auto_783544 ) ) ( not ( = ?auto_783541 ?auto_783545 ) ) ( not ( = ?auto_783541 ?auto_783546 ) ) ( not ( = ?auto_783541 ?auto_783547 ) ) ( not ( = ?auto_783541 ?auto_783548 ) ) ( not ( = ?auto_783541 ?auto_783549 ) ) ( not ( = ?auto_783541 ?auto_783550 ) ) ( not ( = ?auto_783541 ?auto_783551 ) ) ( not ( = ?auto_783541 ?auto_783552 ) ) ( not ( = ?auto_783541 ?auto_783553 ) ) ( not ( = ?auto_783541 ?auto_783554 ) ) ( not ( = ?auto_783542 ?auto_783543 ) ) ( not ( = ?auto_783542 ?auto_783544 ) ) ( not ( = ?auto_783542 ?auto_783545 ) ) ( not ( = ?auto_783542 ?auto_783546 ) ) ( not ( = ?auto_783542 ?auto_783547 ) ) ( not ( = ?auto_783542 ?auto_783548 ) ) ( not ( = ?auto_783542 ?auto_783549 ) ) ( not ( = ?auto_783542 ?auto_783550 ) ) ( not ( = ?auto_783542 ?auto_783551 ) ) ( not ( = ?auto_783542 ?auto_783552 ) ) ( not ( = ?auto_783542 ?auto_783553 ) ) ( not ( = ?auto_783542 ?auto_783554 ) ) ( not ( = ?auto_783543 ?auto_783544 ) ) ( not ( = ?auto_783543 ?auto_783545 ) ) ( not ( = ?auto_783543 ?auto_783546 ) ) ( not ( = ?auto_783543 ?auto_783547 ) ) ( not ( = ?auto_783543 ?auto_783548 ) ) ( not ( = ?auto_783543 ?auto_783549 ) ) ( not ( = ?auto_783543 ?auto_783550 ) ) ( not ( = ?auto_783543 ?auto_783551 ) ) ( not ( = ?auto_783543 ?auto_783552 ) ) ( not ( = ?auto_783543 ?auto_783553 ) ) ( not ( = ?auto_783543 ?auto_783554 ) ) ( not ( = ?auto_783544 ?auto_783545 ) ) ( not ( = ?auto_783544 ?auto_783546 ) ) ( not ( = ?auto_783544 ?auto_783547 ) ) ( not ( = ?auto_783544 ?auto_783548 ) ) ( not ( = ?auto_783544 ?auto_783549 ) ) ( not ( = ?auto_783544 ?auto_783550 ) ) ( not ( = ?auto_783544 ?auto_783551 ) ) ( not ( = ?auto_783544 ?auto_783552 ) ) ( not ( = ?auto_783544 ?auto_783553 ) ) ( not ( = ?auto_783544 ?auto_783554 ) ) ( not ( = ?auto_783545 ?auto_783546 ) ) ( not ( = ?auto_783545 ?auto_783547 ) ) ( not ( = ?auto_783545 ?auto_783548 ) ) ( not ( = ?auto_783545 ?auto_783549 ) ) ( not ( = ?auto_783545 ?auto_783550 ) ) ( not ( = ?auto_783545 ?auto_783551 ) ) ( not ( = ?auto_783545 ?auto_783552 ) ) ( not ( = ?auto_783545 ?auto_783553 ) ) ( not ( = ?auto_783545 ?auto_783554 ) ) ( not ( = ?auto_783546 ?auto_783547 ) ) ( not ( = ?auto_783546 ?auto_783548 ) ) ( not ( = ?auto_783546 ?auto_783549 ) ) ( not ( = ?auto_783546 ?auto_783550 ) ) ( not ( = ?auto_783546 ?auto_783551 ) ) ( not ( = ?auto_783546 ?auto_783552 ) ) ( not ( = ?auto_783546 ?auto_783553 ) ) ( not ( = ?auto_783546 ?auto_783554 ) ) ( not ( = ?auto_783547 ?auto_783548 ) ) ( not ( = ?auto_783547 ?auto_783549 ) ) ( not ( = ?auto_783547 ?auto_783550 ) ) ( not ( = ?auto_783547 ?auto_783551 ) ) ( not ( = ?auto_783547 ?auto_783552 ) ) ( not ( = ?auto_783547 ?auto_783553 ) ) ( not ( = ?auto_783547 ?auto_783554 ) ) ( not ( = ?auto_783548 ?auto_783549 ) ) ( not ( = ?auto_783548 ?auto_783550 ) ) ( not ( = ?auto_783548 ?auto_783551 ) ) ( not ( = ?auto_783548 ?auto_783552 ) ) ( not ( = ?auto_783548 ?auto_783553 ) ) ( not ( = ?auto_783548 ?auto_783554 ) ) ( not ( = ?auto_783549 ?auto_783550 ) ) ( not ( = ?auto_783549 ?auto_783551 ) ) ( not ( = ?auto_783549 ?auto_783552 ) ) ( not ( = ?auto_783549 ?auto_783553 ) ) ( not ( = ?auto_783549 ?auto_783554 ) ) ( not ( = ?auto_783550 ?auto_783551 ) ) ( not ( = ?auto_783550 ?auto_783552 ) ) ( not ( = ?auto_783550 ?auto_783553 ) ) ( not ( = ?auto_783550 ?auto_783554 ) ) ( not ( = ?auto_783551 ?auto_783552 ) ) ( not ( = ?auto_783551 ?auto_783553 ) ) ( not ( = ?auto_783551 ?auto_783554 ) ) ( not ( = ?auto_783552 ?auto_783553 ) ) ( not ( = ?auto_783552 ?auto_783554 ) ) ( not ( = ?auto_783553 ?auto_783554 ) ) ( ON ?auto_783553 ?auto_783554 ) ( ON ?auto_783552 ?auto_783553 ) ( ON ?auto_783551 ?auto_783552 ) ( ON ?auto_783550 ?auto_783551 ) ( ON ?auto_783549 ?auto_783550 ) ( ON ?auto_783548 ?auto_783549 ) ( ON ?auto_783547 ?auto_783548 ) ( ON ?auto_783546 ?auto_783547 ) ( ON ?auto_783545 ?auto_783546 ) ( ON ?auto_783544 ?auto_783545 ) ( ON ?auto_783543 ?auto_783544 ) ( ON ?auto_783542 ?auto_783543 ) ( ON ?auto_783541 ?auto_783542 ) ( ON ?auto_783540 ?auto_783541 ) ( ON ?auto_783539 ?auto_783540 ) ( CLEAR ?auto_783537 ) ( ON ?auto_783538 ?auto_783539 ) ( CLEAR ?auto_783538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_783537 ?auto_783538 )
      ( MAKE-18PILE ?auto_783537 ?auto_783538 ?auto_783539 ?auto_783540 ?auto_783541 ?auto_783542 ?auto_783543 ?auto_783544 ?auto_783545 ?auto_783546 ?auto_783547 ?auto_783548 ?auto_783549 ?auto_783550 ?auto_783551 ?auto_783552 ?auto_783553 ?auto_783554 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_783573 - BLOCK
      ?auto_783574 - BLOCK
      ?auto_783575 - BLOCK
      ?auto_783576 - BLOCK
      ?auto_783577 - BLOCK
      ?auto_783578 - BLOCK
      ?auto_783579 - BLOCK
      ?auto_783580 - BLOCK
      ?auto_783581 - BLOCK
      ?auto_783582 - BLOCK
      ?auto_783583 - BLOCK
      ?auto_783584 - BLOCK
      ?auto_783585 - BLOCK
      ?auto_783586 - BLOCK
      ?auto_783587 - BLOCK
      ?auto_783588 - BLOCK
      ?auto_783589 - BLOCK
      ?auto_783590 - BLOCK
    )
    :vars
    (
      ?auto_783591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_783590 ?auto_783591 ) ( not ( = ?auto_783573 ?auto_783574 ) ) ( not ( = ?auto_783573 ?auto_783575 ) ) ( not ( = ?auto_783573 ?auto_783576 ) ) ( not ( = ?auto_783573 ?auto_783577 ) ) ( not ( = ?auto_783573 ?auto_783578 ) ) ( not ( = ?auto_783573 ?auto_783579 ) ) ( not ( = ?auto_783573 ?auto_783580 ) ) ( not ( = ?auto_783573 ?auto_783581 ) ) ( not ( = ?auto_783573 ?auto_783582 ) ) ( not ( = ?auto_783573 ?auto_783583 ) ) ( not ( = ?auto_783573 ?auto_783584 ) ) ( not ( = ?auto_783573 ?auto_783585 ) ) ( not ( = ?auto_783573 ?auto_783586 ) ) ( not ( = ?auto_783573 ?auto_783587 ) ) ( not ( = ?auto_783573 ?auto_783588 ) ) ( not ( = ?auto_783573 ?auto_783589 ) ) ( not ( = ?auto_783573 ?auto_783590 ) ) ( not ( = ?auto_783573 ?auto_783591 ) ) ( not ( = ?auto_783574 ?auto_783575 ) ) ( not ( = ?auto_783574 ?auto_783576 ) ) ( not ( = ?auto_783574 ?auto_783577 ) ) ( not ( = ?auto_783574 ?auto_783578 ) ) ( not ( = ?auto_783574 ?auto_783579 ) ) ( not ( = ?auto_783574 ?auto_783580 ) ) ( not ( = ?auto_783574 ?auto_783581 ) ) ( not ( = ?auto_783574 ?auto_783582 ) ) ( not ( = ?auto_783574 ?auto_783583 ) ) ( not ( = ?auto_783574 ?auto_783584 ) ) ( not ( = ?auto_783574 ?auto_783585 ) ) ( not ( = ?auto_783574 ?auto_783586 ) ) ( not ( = ?auto_783574 ?auto_783587 ) ) ( not ( = ?auto_783574 ?auto_783588 ) ) ( not ( = ?auto_783574 ?auto_783589 ) ) ( not ( = ?auto_783574 ?auto_783590 ) ) ( not ( = ?auto_783574 ?auto_783591 ) ) ( not ( = ?auto_783575 ?auto_783576 ) ) ( not ( = ?auto_783575 ?auto_783577 ) ) ( not ( = ?auto_783575 ?auto_783578 ) ) ( not ( = ?auto_783575 ?auto_783579 ) ) ( not ( = ?auto_783575 ?auto_783580 ) ) ( not ( = ?auto_783575 ?auto_783581 ) ) ( not ( = ?auto_783575 ?auto_783582 ) ) ( not ( = ?auto_783575 ?auto_783583 ) ) ( not ( = ?auto_783575 ?auto_783584 ) ) ( not ( = ?auto_783575 ?auto_783585 ) ) ( not ( = ?auto_783575 ?auto_783586 ) ) ( not ( = ?auto_783575 ?auto_783587 ) ) ( not ( = ?auto_783575 ?auto_783588 ) ) ( not ( = ?auto_783575 ?auto_783589 ) ) ( not ( = ?auto_783575 ?auto_783590 ) ) ( not ( = ?auto_783575 ?auto_783591 ) ) ( not ( = ?auto_783576 ?auto_783577 ) ) ( not ( = ?auto_783576 ?auto_783578 ) ) ( not ( = ?auto_783576 ?auto_783579 ) ) ( not ( = ?auto_783576 ?auto_783580 ) ) ( not ( = ?auto_783576 ?auto_783581 ) ) ( not ( = ?auto_783576 ?auto_783582 ) ) ( not ( = ?auto_783576 ?auto_783583 ) ) ( not ( = ?auto_783576 ?auto_783584 ) ) ( not ( = ?auto_783576 ?auto_783585 ) ) ( not ( = ?auto_783576 ?auto_783586 ) ) ( not ( = ?auto_783576 ?auto_783587 ) ) ( not ( = ?auto_783576 ?auto_783588 ) ) ( not ( = ?auto_783576 ?auto_783589 ) ) ( not ( = ?auto_783576 ?auto_783590 ) ) ( not ( = ?auto_783576 ?auto_783591 ) ) ( not ( = ?auto_783577 ?auto_783578 ) ) ( not ( = ?auto_783577 ?auto_783579 ) ) ( not ( = ?auto_783577 ?auto_783580 ) ) ( not ( = ?auto_783577 ?auto_783581 ) ) ( not ( = ?auto_783577 ?auto_783582 ) ) ( not ( = ?auto_783577 ?auto_783583 ) ) ( not ( = ?auto_783577 ?auto_783584 ) ) ( not ( = ?auto_783577 ?auto_783585 ) ) ( not ( = ?auto_783577 ?auto_783586 ) ) ( not ( = ?auto_783577 ?auto_783587 ) ) ( not ( = ?auto_783577 ?auto_783588 ) ) ( not ( = ?auto_783577 ?auto_783589 ) ) ( not ( = ?auto_783577 ?auto_783590 ) ) ( not ( = ?auto_783577 ?auto_783591 ) ) ( not ( = ?auto_783578 ?auto_783579 ) ) ( not ( = ?auto_783578 ?auto_783580 ) ) ( not ( = ?auto_783578 ?auto_783581 ) ) ( not ( = ?auto_783578 ?auto_783582 ) ) ( not ( = ?auto_783578 ?auto_783583 ) ) ( not ( = ?auto_783578 ?auto_783584 ) ) ( not ( = ?auto_783578 ?auto_783585 ) ) ( not ( = ?auto_783578 ?auto_783586 ) ) ( not ( = ?auto_783578 ?auto_783587 ) ) ( not ( = ?auto_783578 ?auto_783588 ) ) ( not ( = ?auto_783578 ?auto_783589 ) ) ( not ( = ?auto_783578 ?auto_783590 ) ) ( not ( = ?auto_783578 ?auto_783591 ) ) ( not ( = ?auto_783579 ?auto_783580 ) ) ( not ( = ?auto_783579 ?auto_783581 ) ) ( not ( = ?auto_783579 ?auto_783582 ) ) ( not ( = ?auto_783579 ?auto_783583 ) ) ( not ( = ?auto_783579 ?auto_783584 ) ) ( not ( = ?auto_783579 ?auto_783585 ) ) ( not ( = ?auto_783579 ?auto_783586 ) ) ( not ( = ?auto_783579 ?auto_783587 ) ) ( not ( = ?auto_783579 ?auto_783588 ) ) ( not ( = ?auto_783579 ?auto_783589 ) ) ( not ( = ?auto_783579 ?auto_783590 ) ) ( not ( = ?auto_783579 ?auto_783591 ) ) ( not ( = ?auto_783580 ?auto_783581 ) ) ( not ( = ?auto_783580 ?auto_783582 ) ) ( not ( = ?auto_783580 ?auto_783583 ) ) ( not ( = ?auto_783580 ?auto_783584 ) ) ( not ( = ?auto_783580 ?auto_783585 ) ) ( not ( = ?auto_783580 ?auto_783586 ) ) ( not ( = ?auto_783580 ?auto_783587 ) ) ( not ( = ?auto_783580 ?auto_783588 ) ) ( not ( = ?auto_783580 ?auto_783589 ) ) ( not ( = ?auto_783580 ?auto_783590 ) ) ( not ( = ?auto_783580 ?auto_783591 ) ) ( not ( = ?auto_783581 ?auto_783582 ) ) ( not ( = ?auto_783581 ?auto_783583 ) ) ( not ( = ?auto_783581 ?auto_783584 ) ) ( not ( = ?auto_783581 ?auto_783585 ) ) ( not ( = ?auto_783581 ?auto_783586 ) ) ( not ( = ?auto_783581 ?auto_783587 ) ) ( not ( = ?auto_783581 ?auto_783588 ) ) ( not ( = ?auto_783581 ?auto_783589 ) ) ( not ( = ?auto_783581 ?auto_783590 ) ) ( not ( = ?auto_783581 ?auto_783591 ) ) ( not ( = ?auto_783582 ?auto_783583 ) ) ( not ( = ?auto_783582 ?auto_783584 ) ) ( not ( = ?auto_783582 ?auto_783585 ) ) ( not ( = ?auto_783582 ?auto_783586 ) ) ( not ( = ?auto_783582 ?auto_783587 ) ) ( not ( = ?auto_783582 ?auto_783588 ) ) ( not ( = ?auto_783582 ?auto_783589 ) ) ( not ( = ?auto_783582 ?auto_783590 ) ) ( not ( = ?auto_783582 ?auto_783591 ) ) ( not ( = ?auto_783583 ?auto_783584 ) ) ( not ( = ?auto_783583 ?auto_783585 ) ) ( not ( = ?auto_783583 ?auto_783586 ) ) ( not ( = ?auto_783583 ?auto_783587 ) ) ( not ( = ?auto_783583 ?auto_783588 ) ) ( not ( = ?auto_783583 ?auto_783589 ) ) ( not ( = ?auto_783583 ?auto_783590 ) ) ( not ( = ?auto_783583 ?auto_783591 ) ) ( not ( = ?auto_783584 ?auto_783585 ) ) ( not ( = ?auto_783584 ?auto_783586 ) ) ( not ( = ?auto_783584 ?auto_783587 ) ) ( not ( = ?auto_783584 ?auto_783588 ) ) ( not ( = ?auto_783584 ?auto_783589 ) ) ( not ( = ?auto_783584 ?auto_783590 ) ) ( not ( = ?auto_783584 ?auto_783591 ) ) ( not ( = ?auto_783585 ?auto_783586 ) ) ( not ( = ?auto_783585 ?auto_783587 ) ) ( not ( = ?auto_783585 ?auto_783588 ) ) ( not ( = ?auto_783585 ?auto_783589 ) ) ( not ( = ?auto_783585 ?auto_783590 ) ) ( not ( = ?auto_783585 ?auto_783591 ) ) ( not ( = ?auto_783586 ?auto_783587 ) ) ( not ( = ?auto_783586 ?auto_783588 ) ) ( not ( = ?auto_783586 ?auto_783589 ) ) ( not ( = ?auto_783586 ?auto_783590 ) ) ( not ( = ?auto_783586 ?auto_783591 ) ) ( not ( = ?auto_783587 ?auto_783588 ) ) ( not ( = ?auto_783587 ?auto_783589 ) ) ( not ( = ?auto_783587 ?auto_783590 ) ) ( not ( = ?auto_783587 ?auto_783591 ) ) ( not ( = ?auto_783588 ?auto_783589 ) ) ( not ( = ?auto_783588 ?auto_783590 ) ) ( not ( = ?auto_783588 ?auto_783591 ) ) ( not ( = ?auto_783589 ?auto_783590 ) ) ( not ( = ?auto_783589 ?auto_783591 ) ) ( not ( = ?auto_783590 ?auto_783591 ) ) ( ON ?auto_783589 ?auto_783590 ) ( ON ?auto_783588 ?auto_783589 ) ( ON ?auto_783587 ?auto_783588 ) ( ON ?auto_783586 ?auto_783587 ) ( ON ?auto_783585 ?auto_783586 ) ( ON ?auto_783584 ?auto_783585 ) ( ON ?auto_783583 ?auto_783584 ) ( ON ?auto_783582 ?auto_783583 ) ( ON ?auto_783581 ?auto_783582 ) ( ON ?auto_783580 ?auto_783581 ) ( ON ?auto_783579 ?auto_783580 ) ( ON ?auto_783578 ?auto_783579 ) ( ON ?auto_783577 ?auto_783578 ) ( ON ?auto_783576 ?auto_783577 ) ( ON ?auto_783575 ?auto_783576 ) ( ON ?auto_783574 ?auto_783575 ) ( ON ?auto_783573 ?auto_783574 ) ( CLEAR ?auto_783573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_783573 )
      ( MAKE-18PILE ?auto_783573 ?auto_783574 ?auto_783575 ?auto_783576 ?auto_783577 ?auto_783578 ?auto_783579 ?auto_783580 ?auto_783581 ?auto_783582 ?auto_783583 ?auto_783584 ?auto_783585 ?auto_783586 ?auto_783587 ?auto_783588 ?auto_783589 ?auto_783590 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_783610 - BLOCK
      ?auto_783611 - BLOCK
      ?auto_783612 - BLOCK
      ?auto_783613 - BLOCK
      ?auto_783614 - BLOCK
      ?auto_783615 - BLOCK
      ?auto_783616 - BLOCK
      ?auto_783617 - BLOCK
      ?auto_783618 - BLOCK
      ?auto_783619 - BLOCK
      ?auto_783620 - BLOCK
      ?auto_783621 - BLOCK
      ?auto_783622 - BLOCK
      ?auto_783623 - BLOCK
      ?auto_783624 - BLOCK
      ?auto_783625 - BLOCK
      ?auto_783626 - BLOCK
      ?auto_783627 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_783627 ) ( not ( = ?auto_783610 ?auto_783611 ) ) ( not ( = ?auto_783610 ?auto_783612 ) ) ( not ( = ?auto_783610 ?auto_783613 ) ) ( not ( = ?auto_783610 ?auto_783614 ) ) ( not ( = ?auto_783610 ?auto_783615 ) ) ( not ( = ?auto_783610 ?auto_783616 ) ) ( not ( = ?auto_783610 ?auto_783617 ) ) ( not ( = ?auto_783610 ?auto_783618 ) ) ( not ( = ?auto_783610 ?auto_783619 ) ) ( not ( = ?auto_783610 ?auto_783620 ) ) ( not ( = ?auto_783610 ?auto_783621 ) ) ( not ( = ?auto_783610 ?auto_783622 ) ) ( not ( = ?auto_783610 ?auto_783623 ) ) ( not ( = ?auto_783610 ?auto_783624 ) ) ( not ( = ?auto_783610 ?auto_783625 ) ) ( not ( = ?auto_783610 ?auto_783626 ) ) ( not ( = ?auto_783610 ?auto_783627 ) ) ( not ( = ?auto_783611 ?auto_783612 ) ) ( not ( = ?auto_783611 ?auto_783613 ) ) ( not ( = ?auto_783611 ?auto_783614 ) ) ( not ( = ?auto_783611 ?auto_783615 ) ) ( not ( = ?auto_783611 ?auto_783616 ) ) ( not ( = ?auto_783611 ?auto_783617 ) ) ( not ( = ?auto_783611 ?auto_783618 ) ) ( not ( = ?auto_783611 ?auto_783619 ) ) ( not ( = ?auto_783611 ?auto_783620 ) ) ( not ( = ?auto_783611 ?auto_783621 ) ) ( not ( = ?auto_783611 ?auto_783622 ) ) ( not ( = ?auto_783611 ?auto_783623 ) ) ( not ( = ?auto_783611 ?auto_783624 ) ) ( not ( = ?auto_783611 ?auto_783625 ) ) ( not ( = ?auto_783611 ?auto_783626 ) ) ( not ( = ?auto_783611 ?auto_783627 ) ) ( not ( = ?auto_783612 ?auto_783613 ) ) ( not ( = ?auto_783612 ?auto_783614 ) ) ( not ( = ?auto_783612 ?auto_783615 ) ) ( not ( = ?auto_783612 ?auto_783616 ) ) ( not ( = ?auto_783612 ?auto_783617 ) ) ( not ( = ?auto_783612 ?auto_783618 ) ) ( not ( = ?auto_783612 ?auto_783619 ) ) ( not ( = ?auto_783612 ?auto_783620 ) ) ( not ( = ?auto_783612 ?auto_783621 ) ) ( not ( = ?auto_783612 ?auto_783622 ) ) ( not ( = ?auto_783612 ?auto_783623 ) ) ( not ( = ?auto_783612 ?auto_783624 ) ) ( not ( = ?auto_783612 ?auto_783625 ) ) ( not ( = ?auto_783612 ?auto_783626 ) ) ( not ( = ?auto_783612 ?auto_783627 ) ) ( not ( = ?auto_783613 ?auto_783614 ) ) ( not ( = ?auto_783613 ?auto_783615 ) ) ( not ( = ?auto_783613 ?auto_783616 ) ) ( not ( = ?auto_783613 ?auto_783617 ) ) ( not ( = ?auto_783613 ?auto_783618 ) ) ( not ( = ?auto_783613 ?auto_783619 ) ) ( not ( = ?auto_783613 ?auto_783620 ) ) ( not ( = ?auto_783613 ?auto_783621 ) ) ( not ( = ?auto_783613 ?auto_783622 ) ) ( not ( = ?auto_783613 ?auto_783623 ) ) ( not ( = ?auto_783613 ?auto_783624 ) ) ( not ( = ?auto_783613 ?auto_783625 ) ) ( not ( = ?auto_783613 ?auto_783626 ) ) ( not ( = ?auto_783613 ?auto_783627 ) ) ( not ( = ?auto_783614 ?auto_783615 ) ) ( not ( = ?auto_783614 ?auto_783616 ) ) ( not ( = ?auto_783614 ?auto_783617 ) ) ( not ( = ?auto_783614 ?auto_783618 ) ) ( not ( = ?auto_783614 ?auto_783619 ) ) ( not ( = ?auto_783614 ?auto_783620 ) ) ( not ( = ?auto_783614 ?auto_783621 ) ) ( not ( = ?auto_783614 ?auto_783622 ) ) ( not ( = ?auto_783614 ?auto_783623 ) ) ( not ( = ?auto_783614 ?auto_783624 ) ) ( not ( = ?auto_783614 ?auto_783625 ) ) ( not ( = ?auto_783614 ?auto_783626 ) ) ( not ( = ?auto_783614 ?auto_783627 ) ) ( not ( = ?auto_783615 ?auto_783616 ) ) ( not ( = ?auto_783615 ?auto_783617 ) ) ( not ( = ?auto_783615 ?auto_783618 ) ) ( not ( = ?auto_783615 ?auto_783619 ) ) ( not ( = ?auto_783615 ?auto_783620 ) ) ( not ( = ?auto_783615 ?auto_783621 ) ) ( not ( = ?auto_783615 ?auto_783622 ) ) ( not ( = ?auto_783615 ?auto_783623 ) ) ( not ( = ?auto_783615 ?auto_783624 ) ) ( not ( = ?auto_783615 ?auto_783625 ) ) ( not ( = ?auto_783615 ?auto_783626 ) ) ( not ( = ?auto_783615 ?auto_783627 ) ) ( not ( = ?auto_783616 ?auto_783617 ) ) ( not ( = ?auto_783616 ?auto_783618 ) ) ( not ( = ?auto_783616 ?auto_783619 ) ) ( not ( = ?auto_783616 ?auto_783620 ) ) ( not ( = ?auto_783616 ?auto_783621 ) ) ( not ( = ?auto_783616 ?auto_783622 ) ) ( not ( = ?auto_783616 ?auto_783623 ) ) ( not ( = ?auto_783616 ?auto_783624 ) ) ( not ( = ?auto_783616 ?auto_783625 ) ) ( not ( = ?auto_783616 ?auto_783626 ) ) ( not ( = ?auto_783616 ?auto_783627 ) ) ( not ( = ?auto_783617 ?auto_783618 ) ) ( not ( = ?auto_783617 ?auto_783619 ) ) ( not ( = ?auto_783617 ?auto_783620 ) ) ( not ( = ?auto_783617 ?auto_783621 ) ) ( not ( = ?auto_783617 ?auto_783622 ) ) ( not ( = ?auto_783617 ?auto_783623 ) ) ( not ( = ?auto_783617 ?auto_783624 ) ) ( not ( = ?auto_783617 ?auto_783625 ) ) ( not ( = ?auto_783617 ?auto_783626 ) ) ( not ( = ?auto_783617 ?auto_783627 ) ) ( not ( = ?auto_783618 ?auto_783619 ) ) ( not ( = ?auto_783618 ?auto_783620 ) ) ( not ( = ?auto_783618 ?auto_783621 ) ) ( not ( = ?auto_783618 ?auto_783622 ) ) ( not ( = ?auto_783618 ?auto_783623 ) ) ( not ( = ?auto_783618 ?auto_783624 ) ) ( not ( = ?auto_783618 ?auto_783625 ) ) ( not ( = ?auto_783618 ?auto_783626 ) ) ( not ( = ?auto_783618 ?auto_783627 ) ) ( not ( = ?auto_783619 ?auto_783620 ) ) ( not ( = ?auto_783619 ?auto_783621 ) ) ( not ( = ?auto_783619 ?auto_783622 ) ) ( not ( = ?auto_783619 ?auto_783623 ) ) ( not ( = ?auto_783619 ?auto_783624 ) ) ( not ( = ?auto_783619 ?auto_783625 ) ) ( not ( = ?auto_783619 ?auto_783626 ) ) ( not ( = ?auto_783619 ?auto_783627 ) ) ( not ( = ?auto_783620 ?auto_783621 ) ) ( not ( = ?auto_783620 ?auto_783622 ) ) ( not ( = ?auto_783620 ?auto_783623 ) ) ( not ( = ?auto_783620 ?auto_783624 ) ) ( not ( = ?auto_783620 ?auto_783625 ) ) ( not ( = ?auto_783620 ?auto_783626 ) ) ( not ( = ?auto_783620 ?auto_783627 ) ) ( not ( = ?auto_783621 ?auto_783622 ) ) ( not ( = ?auto_783621 ?auto_783623 ) ) ( not ( = ?auto_783621 ?auto_783624 ) ) ( not ( = ?auto_783621 ?auto_783625 ) ) ( not ( = ?auto_783621 ?auto_783626 ) ) ( not ( = ?auto_783621 ?auto_783627 ) ) ( not ( = ?auto_783622 ?auto_783623 ) ) ( not ( = ?auto_783622 ?auto_783624 ) ) ( not ( = ?auto_783622 ?auto_783625 ) ) ( not ( = ?auto_783622 ?auto_783626 ) ) ( not ( = ?auto_783622 ?auto_783627 ) ) ( not ( = ?auto_783623 ?auto_783624 ) ) ( not ( = ?auto_783623 ?auto_783625 ) ) ( not ( = ?auto_783623 ?auto_783626 ) ) ( not ( = ?auto_783623 ?auto_783627 ) ) ( not ( = ?auto_783624 ?auto_783625 ) ) ( not ( = ?auto_783624 ?auto_783626 ) ) ( not ( = ?auto_783624 ?auto_783627 ) ) ( not ( = ?auto_783625 ?auto_783626 ) ) ( not ( = ?auto_783625 ?auto_783627 ) ) ( not ( = ?auto_783626 ?auto_783627 ) ) ( ON ?auto_783626 ?auto_783627 ) ( ON ?auto_783625 ?auto_783626 ) ( ON ?auto_783624 ?auto_783625 ) ( ON ?auto_783623 ?auto_783624 ) ( ON ?auto_783622 ?auto_783623 ) ( ON ?auto_783621 ?auto_783622 ) ( ON ?auto_783620 ?auto_783621 ) ( ON ?auto_783619 ?auto_783620 ) ( ON ?auto_783618 ?auto_783619 ) ( ON ?auto_783617 ?auto_783618 ) ( ON ?auto_783616 ?auto_783617 ) ( ON ?auto_783615 ?auto_783616 ) ( ON ?auto_783614 ?auto_783615 ) ( ON ?auto_783613 ?auto_783614 ) ( ON ?auto_783612 ?auto_783613 ) ( ON ?auto_783611 ?auto_783612 ) ( ON ?auto_783610 ?auto_783611 ) ( CLEAR ?auto_783610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_783610 )
      ( MAKE-18PILE ?auto_783610 ?auto_783611 ?auto_783612 ?auto_783613 ?auto_783614 ?auto_783615 ?auto_783616 ?auto_783617 ?auto_783618 ?auto_783619 ?auto_783620 ?auto_783621 ?auto_783622 ?auto_783623 ?auto_783624 ?auto_783625 ?auto_783626 ?auto_783627 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_783646 - BLOCK
      ?auto_783647 - BLOCK
      ?auto_783648 - BLOCK
      ?auto_783649 - BLOCK
      ?auto_783650 - BLOCK
      ?auto_783651 - BLOCK
      ?auto_783652 - BLOCK
      ?auto_783653 - BLOCK
      ?auto_783654 - BLOCK
      ?auto_783655 - BLOCK
      ?auto_783656 - BLOCK
      ?auto_783657 - BLOCK
      ?auto_783658 - BLOCK
      ?auto_783659 - BLOCK
      ?auto_783660 - BLOCK
      ?auto_783661 - BLOCK
      ?auto_783662 - BLOCK
      ?auto_783663 - BLOCK
    )
    :vars
    (
      ?auto_783664 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_783646 ?auto_783647 ) ) ( not ( = ?auto_783646 ?auto_783648 ) ) ( not ( = ?auto_783646 ?auto_783649 ) ) ( not ( = ?auto_783646 ?auto_783650 ) ) ( not ( = ?auto_783646 ?auto_783651 ) ) ( not ( = ?auto_783646 ?auto_783652 ) ) ( not ( = ?auto_783646 ?auto_783653 ) ) ( not ( = ?auto_783646 ?auto_783654 ) ) ( not ( = ?auto_783646 ?auto_783655 ) ) ( not ( = ?auto_783646 ?auto_783656 ) ) ( not ( = ?auto_783646 ?auto_783657 ) ) ( not ( = ?auto_783646 ?auto_783658 ) ) ( not ( = ?auto_783646 ?auto_783659 ) ) ( not ( = ?auto_783646 ?auto_783660 ) ) ( not ( = ?auto_783646 ?auto_783661 ) ) ( not ( = ?auto_783646 ?auto_783662 ) ) ( not ( = ?auto_783646 ?auto_783663 ) ) ( not ( = ?auto_783647 ?auto_783648 ) ) ( not ( = ?auto_783647 ?auto_783649 ) ) ( not ( = ?auto_783647 ?auto_783650 ) ) ( not ( = ?auto_783647 ?auto_783651 ) ) ( not ( = ?auto_783647 ?auto_783652 ) ) ( not ( = ?auto_783647 ?auto_783653 ) ) ( not ( = ?auto_783647 ?auto_783654 ) ) ( not ( = ?auto_783647 ?auto_783655 ) ) ( not ( = ?auto_783647 ?auto_783656 ) ) ( not ( = ?auto_783647 ?auto_783657 ) ) ( not ( = ?auto_783647 ?auto_783658 ) ) ( not ( = ?auto_783647 ?auto_783659 ) ) ( not ( = ?auto_783647 ?auto_783660 ) ) ( not ( = ?auto_783647 ?auto_783661 ) ) ( not ( = ?auto_783647 ?auto_783662 ) ) ( not ( = ?auto_783647 ?auto_783663 ) ) ( not ( = ?auto_783648 ?auto_783649 ) ) ( not ( = ?auto_783648 ?auto_783650 ) ) ( not ( = ?auto_783648 ?auto_783651 ) ) ( not ( = ?auto_783648 ?auto_783652 ) ) ( not ( = ?auto_783648 ?auto_783653 ) ) ( not ( = ?auto_783648 ?auto_783654 ) ) ( not ( = ?auto_783648 ?auto_783655 ) ) ( not ( = ?auto_783648 ?auto_783656 ) ) ( not ( = ?auto_783648 ?auto_783657 ) ) ( not ( = ?auto_783648 ?auto_783658 ) ) ( not ( = ?auto_783648 ?auto_783659 ) ) ( not ( = ?auto_783648 ?auto_783660 ) ) ( not ( = ?auto_783648 ?auto_783661 ) ) ( not ( = ?auto_783648 ?auto_783662 ) ) ( not ( = ?auto_783648 ?auto_783663 ) ) ( not ( = ?auto_783649 ?auto_783650 ) ) ( not ( = ?auto_783649 ?auto_783651 ) ) ( not ( = ?auto_783649 ?auto_783652 ) ) ( not ( = ?auto_783649 ?auto_783653 ) ) ( not ( = ?auto_783649 ?auto_783654 ) ) ( not ( = ?auto_783649 ?auto_783655 ) ) ( not ( = ?auto_783649 ?auto_783656 ) ) ( not ( = ?auto_783649 ?auto_783657 ) ) ( not ( = ?auto_783649 ?auto_783658 ) ) ( not ( = ?auto_783649 ?auto_783659 ) ) ( not ( = ?auto_783649 ?auto_783660 ) ) ( not ( = ?auto_783649 ?auto_783661 ) ) ( not ( = ?auto_783649 ?auto_783662 ) ) ( not ( = ?auto_783649 ?auto_783663 ) ) ( not ( = ?auto_783650 ?auto_783651 ) ) ( not ( = ?auto_783650 ?auto_783652 ) ) ( not ( = ?auto_783650 ?auto_783653 ) ) ( not ( = ?auto_783650 ?auto_783654 ) ) ( not ( = ?auto_783650 ?auto_783655 ) ) ( not ( = ?auto_783650 ?auto_783656 ) ) ( not ( = ?auto_783650 ?auto_783657 ) ) ( not ( = ?auto_783650 ?auto_783658 ) ) ( not ( = ?auto_783650 ?auto_783659 ) ) ( not ( = ?auto_783650 ?auto_783660 ) ) ( not ( = ?auto_783650 ?auto_783661 ) ) ( not ( = ?auto_783650 ?auto_783662 ) ) ( not ( = ?auto_783650 ?auto_783663 ) ) ( not ( = ?auto_783651 ?auto_783652 ) ) ( not ( = ?auto_783651 ?auto_783653 ) ) ( not ( = ?auto_783651 ?auto_783654 ) ) ( not ( = ?auto_783651 ?auto_783655 ) ) ( not ( = ?auto_783651 ?auto_783656 ) ) ( not ( = ?auto_783651 ?auto_783657 ) ) ( not ( = ?auto_783651 ?auto_783658 ) ) ( not ( = ?auto_783651 ?auto_783659 ) ) ( not ( = ?auto_783651 ?auto_783660 ) ) ( not ( = ?auto_783651 ?auto_783661 ) ) ( not ( = ?auto_783651 ?auto_783662 ) ) ( not ( = ?auto_783651 ?auto_783663 ) ) ( not ( = ?auto_783652 ?auto_783653 ) ) ( not ( = ?auto_783652 ?auto_783654 ) ) ( not ( = ?auto_783652 ?auto_783655 ) ) ( not ( = ?auto_783652 ?auto_783656 ) ) ( not ( = ?auto_783652 ?auto_783657 ) ) ( not ( = ?auto_783652 ?auto_783658 ) ) ( not ( = ?auto_783652 ?auto_783659 ) ) ( not ( = ?auto_783652 ?auto_783660 ) ) ( not ( = ?auto_783652 ?auto_783661 ) ) ( not ( = ?auto_783652 ?auto_783662 ) ) ( not ( = ?auto_783652 ?auto_783663 ) ) ( not ( = ?auto_783653 ?auto_783654 ) ) ( not ( = ?auto_783653 ?auto_783655 ) ) ( not ( = ?auto_783653 ?auto_783656 ) ) ( not ( = ?auto_783653 ?auto_783657 ) ) ( not ( = ?auto_783653 ?auto_783658 ) ) ( not ( = ?auto_783653 ?auto_783659 ) ) ( not ( = ?auto_783653 ?auto_783660 ) ) ( not ( = ?auto_783653 ?auto_783661 ) ) ( not ( = ?auto_783653 ?auto_783662 ) ) ( not ( = ?auto_783653 ?auto_783663 ) ) ( not ( = ?auto_783654 ?auto_783655 ) ) ( not ( = ?auto_783654 ?auto_783656 ) ) ( not ( = ?auto_783654 ?auto_783657 ) ) ( not ( = ?auto_783654 ?auto_783658 ) ) ( not ( = ?auto_783654 ?auto_783659 ) ) ( not ( = ?auto_783654 ?auto_783660 ) ) ( not ( = ?auto_783654 ?auto_783661 ) ) ( not ( = ?auto_783654 ?auto_783662 ) ) ( not ( = ?auto_783654 ?auto_783663 ) ) ( not ( = ?auto_783655 ?auto_783656 ) ) ( not ( = ?auto_783655 ?auto_783657 ) ) ( not ( = ?auto_783655 ?auto_783658 ) ) ( not ( = ?auto_783655 ?auto_783659 ) ) ( not ( = ?auto_783655 ?auto_783660 ) ) ( not ( = ?auto_783655 ?auto_783661 ) ) ( not ( = ?auto_783655 ?auto_783662 ) ) ( not ( = ?auto_783655 ?auto_783663 ) ) ( not ( = ?auto_783656 ?auto_783657 ) ) ( not ( = ?auto_783656 ?auto_783658 ) ) ( not ( = ?auto_783656 ?auto_783659 ) ) ( not ( = ?auto_783656 ?auto_783660 ) ) ( not ( = ?auto_783656 ?auto_783661 ) ) ( not ( = ?auto_783656 ?auto_783662 ) ) ( not ( = ?auto_783656 ?auto_783663 ) ) ( not ( = ?auto_783657 ?auto_783658 ) ) ( not ( = ?auto_783657 ?auto_783659 ) ) ( not ( = ?auto_783657 ?auto_783660 ) ) ( not ( = ?auto_783657 ?auto_783661 ) ) ( not ( = ?auto_783657 ?auto_783662 ) ) ( not ( = ?auto_783657 ?auto_783663 ) ) ( not ( = ?auto_783658 ?auto_783659 ) ) ( not ( = ?auto_783658 ?auto_783660 ) ) ( not ( = ?auto_783658 ?auto_783661 ) ) ( not ( = ?auto_783658 ?auto_783662 ) ) ( not ( = ?auto_783658 ?auto_783663 ) ) ( not ( = ?auto_783659 ?auto_783660 ) ) ( not ( = ?auto_783659 ?auto_783661 ) ) ( not ( = ?auto_783659 ?auto_783662 ) ) ( not ( = ?auto_783659 ?auto_783663 ) ) ( not ( = ?auto_783660 ?auto_783661 ) ) ( not ( = ?auto_783660 ?auto_783662 ) ) ( not ( = ?auto_783660 ?auto_783663 ) ) ( not ( = ?auto_783661 ?auto_783662 ) ) ( not ( = ?auto_783661 ?auto_783663 ) ) ( not ( = ?auto_783662 ?auto_783663 ) ) ( ON ?auto_783646 ?auto_783664 ) ( not ( = ?auto_783663 ?auto_783664 ) ) ( not ( = ?auto_783662 ?auto_783664 ) ) ( not ( = ?auto_783661 ?auto_783664 ) ) ( not ( = ?auto_783660 ?auto_783664 ) ) ( not ( = ?auto_783659 ?auto_783664 ) ) ( not ( = ?auto_783658 ?auto_783664 ) ) ( not ( = ?auto_783657 ?auto_783664 ) ) ( not ( = ?auto_783656 ?auto_783664 ) ) ( not ( = ?auto_783655 ?auto_783664 ) ) ( not ( = ?auto_783654 ?auto_783664 ) ) ( not ( = ?auto_783653 ?auto_783664 ) ) ( not ( = ?auto_783652 ?auto_783664 ) ) ( not ( = ?auto_783651 ?auto_783664 ) ) ( not ( = ?auto_783650 ?auto_783664 ) ) ( not ( = ?auto_783649 ?auto_783664 ) ) ( not ( = ?auto_783648 ?auto_783664 ) ) ( not ( = ?auto_783647 ?auto_783664 ) ) ( not ( = ?auto_783646 ?auto_783664 ) ) ( ON ?auto_783647 ?auto_783646 ) ( ON ?auto_783648 ?auto_783647 ) ( ON ?auto_783649 ?auto_783648 ) ( ON ?auto_783650 ?auto_783649 ) ( ON ?auto_783651 ?auto_783650 ) ( ON ?auto_783652 ?auto_783651 ) ( ON ?auto_783653 ?auto_783652 ) ( ON ?auto_783654 ?auto_783653 ) ( ON ?auto_783655 ?auto_783654 ) ( ON ?auto_783656 ?auto_783655 ) ( ON ?auto_783657 ?auto_783656 ) ( ON ?auto_783658 ?auto_783657 ) ( ON ?auto_783659 ?auto_783658 ) ( ON ?auto_783660 ?auto_783659 ) ( ON ?auto_783661 ?auto_783660 ) ( ON ?auto_783662 ?auto_783661 ) ( ON ?auto_783663 ?auto_783662 ) ( CLEAR ?auto_783663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-18PILE ?auto_783663 ?auto_783662 ?auto_783661 ?auto_783660 ?auto_783659 ?auto_783658 ?auto_783657 ?auto_783656 ?auto_783655 ?auto_783654 ?auto_783653 ?auto_783652 ?auto_783651 ?auto_783650 ?auto_783649 ?auto_783648 ?auto_783647 ?auto_783646 )
      ( MAKE-18PILE ?auto_783646 ?auto_783647 ?auto_783648 ?auto_783649 ?auto_783650 ?auto_783651 ?auto_783652 ?auto_783653 ?auto_783654 ?auto_783655 ?auto_783656 ?auto_783657 ?auto_783658 ?auto_783659 ?auto_783660 ?auto_783661 ?auto_783662 ?auto_783663 ) )
  )

)

