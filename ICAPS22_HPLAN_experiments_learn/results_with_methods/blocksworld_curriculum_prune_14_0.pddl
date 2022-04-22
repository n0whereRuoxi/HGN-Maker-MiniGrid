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
      ?auto_274921 - BLOCK
    )
    :vars
    (
      ?auto_274922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_274921 ?auto_274922 ) ( CLEAR ?auto_274921 ) ( HAND-EMPTY ) ( not ( = ?auto_274921 ?auto_274922 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_274921 ?auto_274922 )
      ( !PUTDOWN ?auto_274921 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_274928 - BLOCK
      ?auto_274929 - BLOCK
    )
    :vars
    (
      ?auto_274930 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_274928 ) ( ON ?auto_274929 ?auto_274930 ) ( CLEAR ?auto_274929 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_274928 ) ( not ( = ?auto_274928 ?auto_274929 ) ) ( not ( = ?auto_274928 ?auto_274930 ) ) ( not ( = ?auto_274929 ?auto_274930 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_274929 ?auto_274930 )
      ( !STACK ?auto_274929 ?auto_274928 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_274938 - BLOCK
      ?auto_274939 - BLOCK
    )
    :vars
    (
      ?auto_274940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_274939 ?auto_274940 ) ( not ( = ?auto_274938 ?auto_274939 ) ) ( not ( = ?auto_274938 ?auto_274940 ) ) ( not ( = ?auto_274939 ?auto_274940 ) ) ( ON ?auto_274938 ?auto_274939 ) ( CLEAR ?auto_274938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_274938 )
      ( MAKE-2PILE ?auto_274938 ?auto_274939 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_274949 - BLOCK
      ?auto_274950 - BLOCK
      ?auto_274951 - BLOCK
    )
    :vars
    (
      ?auto_274952 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_274950 ) ( ON ?auto_274951 ?auto_274952 ) ( CLEAR ?auto_274951 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_274949 ) ( ON ?auto_274950 ?auto_274949 ) ( not ( = ?auto_274949 ?auto_274950 ) ) ( not ( = ?auto_274949 ?auto_274951 ) ) ( not ( = ?auto_274949 ?auto_274952 ) ) ( not ( = ?auto_274950 ?auto_274951 ) ) ( not ( = ?auto_274950 ?auto_274952 ) ) ( not ( = ?auto_274951 ?auto_274952 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_274951 ?auto_274952 )
      ( !STACK ?auto_274951 ?auto_274950 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_274963 - BLOCK
      ?auto_274964 - BLOCK
      ?auto_274965 - BLOCK
    )
    :vars
    (
      ?auto_274966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_274965 ?auto_274966 ) ( ON-TABLE ?auto_274963 ) ( not ( = ?auto_274963 ?auto_274964 ) ) ( not ( = ?auto_274963 ?auto_274965 ) ) ( not ( = ?auto_274963 ?auto_274966 ) ) ( not ( = ?auto_274964 ?auto_274965 ) ) ( not ( = ?auto_274964 ?auto_274966 ) ) ( not ( = ?auto_274965 ?auto_274966 ) ) ( CLEAR ?auto_274963 ) ( ON ?auto_274964 ?auto_274965 ) ( CLEAR ?auto_274964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_274963 ?auto_274964 )
      ( MAKE-3PILE ?auto_274963 ?auto_274964 ?auto_274965 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_274977 - BLOCK
      ?auto_274978 - BLOCK
      ?auto_274979 - BLOCK
    )
    :vars
    (
      ?auto_274980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_274979 ?auto_274980 ) ( not ( = ?auto_274977 ?auto_274978 ) ) ( not ( = ?auto_274977 ?auto_274979 ) ) ( not ( = ?auto_274977 ?auto_274980 ) ) ( not ( = ?auto_274978 ?auto_274979 ) ) ( not ( = ?auto_274978 ?auto_274980 ) ) ( not ( = ?auto_274979 ?auto_274980 ) ) ( ON ?auto_274978 ?auto_274979 ) ( ON ?auto_274977 ?auto_274978 ) ( CLEAR ?auto_274977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_274977 )
      ( MAKE-3PILE ?auto_274977 ?auto_274978 ?auto_274979 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_274992 - BLOCK
      ?auto_274993 - BLOCK
      ?auto_274994 - BLOCK
      ?auto_274995 - BLOCK
    )
    :vars
    (
      ?auto_274996 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_274994 ) ( ON ?auto_274995 ?auto_274996 ) ( CLEAR ?auto_274995 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_274992 ) ( ON ?auto_274993 ?auto_274992 ) ( ON ?auto_274994 ?auto_274993 ) ( not ( = ?auto_274992 ?auto_274993 ) ) ( not ( = ?auto_274992 ?auto_274994 ) ) ( not ( = ?auto_274992 ?auto_274995 ) ) ( not ( = ?auto_274992 ?auto_274996 ) ) ( not ( = ?auto_274993 ?auto_274994 ) ) ( not ( = ?auto_274993 ?auto_274995 ) ) ( not ( = ?auto_274993 ?auto_274996 ) ) ( not ( = ?auto_274994 ?auto_274995 ) ) ( not ( = ?auto_274994 ?auto_274996 ) ) ( not ( = ?auto_274995 ?auto_274996 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_274995 ?auto_274996 )
      ( !STACK ?auto_274995 ?auto_274994 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_275010 - BLOCK
      ?auto_275011 - BLOCK
      ?auto_275012 - BLOCK
      ?auto_275013 - BLOCK
    )
    :vars
    (
      ?auto_275014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275013 ?auto_275014 ) ( ON-TABLE ?auto_275010 ) ( ON ?auto_275011 ?auto_275010 ) ( not ( = ?auto_275010 ?auto_275011 ) ) ( not ( = ?auto_275010 ?auto_275012 ) ) ( not ( = ?auto_275010 ?auto_275013 ) ) ( not ( = ?auto_275010 ?auto_275014 ) ) ( not ( = ?auto_275011 ?auto_275012 ) ) ( not ( = ?auto_275011 ?auto_275013 ) ) ( not ( = ?auto_275011 ?auto_275014 ) ) ( not ( = ?auto_275012 ?auto_275013 ) ) ( not ( = ?auto_275012 ?auto_275014 ) ) ( not ( = ?auto_275013 ?auto_275014 ) ) ( CLEAR ?auto_275011 ) ( ON ?auto_275012 ?auto_275013 ) ( CLEAR ?auto_275012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_275010 ?auto_275011 ?auto_275012 )
      ( MAKE-4PILE ?auto_275010 ?auto_275011 ?auto_275012 ?auto_275013 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_275028 - BLOCK
      ?auto_275029 - BLOCK
      ?auto_275030 - BLOCK
      ?auto_275031 - BLOCK
    )
    :vars
    (
      ?auto_275032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275031 ?auto_275032 ) ( ON-TABLE ?auto_275028 ) ( not ( = ?auto_275028 ?auto_275029 ) ) ( not ( = ?auto_275028 ?auto_275030 ) ) ( not ( = ?auto_275028 ?auto_275031 ) ) ( not ( = ?auto_275028 ?auto_275032 ) ) ( not ( = ?auto_275029 ?auto_275030 ) ) ( not ( = ?auto_275029 ?auto_275031 ) ) ( not ( = ?auto_275029 ?auto_275032 ) ) ( not ( = ?auto_275030 ?auto_275031 ) ) ( not ( = ?auto_275030 ?auto_275032 ) ) ( not ( = ?auto_275031 ?auto_275032 ) ) ( ON ?auto_275030 ?auto_275031 ) ( CLEAR ?auto_275028 ) ( ON ?auto_275029 ?auto_275030 ) ( CLEAR ?auto_275029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_275028 ?auto_275029 )
      ( MAKE-4PILE ?auto_275028 ?auto_275029 ?auto_275030 ?auto_275031 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_275046 - BLOCK
      ?auto_275047 - BLOCK
      ?auto_275048 - BLOCK
      ?auto_275049 - BLOCK
    )
    :vars
    (
      ?auto_275050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275049 ?auto_275050 ) ( not ( = ?auto_275046 ?auto_275047 ) ) ( not ( = ?auto_275046 ?auto_275048 ) ) ( not ( = ?auto_275046 ?auto_275049 ) ) ( not ( = ?auto_275046 ?auto_275050 ) ) ( not ( = ?auto_275047 ?auto_275048 ) ) ( not ( = ?auto_275047 ?auto_275049 ) ) ( not ( = ?auto_275047 ?auto_275050 ) ) ( not ( = ?auto_275048 ?auto_275049 ) ) ( not ( = ?auto_275048 ?auto_275050 ) ) ( not ( = ?auto_275049 ?auto_275050 ) ) ( ON ?auto_275048 ?auto_275049 ) ( ON ?auto_275047 ?auto_275048 ) ( ON ?auto_275046 ?auto_275047 ) ( CLEAR ?auto_275046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_275046 )
      ( MAKE-4PILE ?auto_275046 ?auto_275047 ?auto_275048 ?auto_275049 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_275065 - BLOCK
      ?auto_275066 - BLOCK
      ?auto_275067 - BLOCK
      ?auto_275068 - BLOCK
      ?auto_275069 - BLOCK
    )
    :vars
    (
      ?auto_275070 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_275068 ) ( ON ?auto_275069 ?auto_275070 ) ( CLEAR ?auto_275069 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_275065 ) ( ON ?auto_275066 ?auto_275065 ) ( ON ?auto_275067 ?auto_275066 ) ( ON ?auto_275068 ?auto_275067 ) ( not ( = ?auto_275065 ?auto_275066 ) ) ( not ( = ?auto_275065 ?auto_275067 ) ) ( not ( = ?auto_275065 ?auto_275068 ) ) ( not ( = ?auto_275065 ?auto_275069 ) ) ( not ( = ?auto_275065 ?auto_275070 ) ) ( not ( = ?auto_275066 ?auto_275067 ) ) ( not ( = ?auto_275066 ?auto_275068 ) ) ( not ( = ?auto_275066 ?auto_275069 ) ) ( not ( = ?auto_275066 ?auto_275070 ) ) ( not ( = ?auto_275067 ?auto_275068 ) ) ( not ( = ?auto_275067 ?auto_275069 ) ) ( not ( = ?auto_275067 ?auto_275070 ) ) ( not ( = ?auto_275068 ?auto_275069 ) ) ( not ( = ?auto_275068 ?auto_275070 ) ) ( not ( = ?auto_275069 ?auto_275070 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_275069 ?auto_275070 )
      ( !STACK ?auto_275069 ?auto_275068 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_275087 - BLOCK
      ?auto_275088 - BLOCK
      ?auto_275089 - BLOCK
      ?auto_275090 - BLOCK
      ?auto_275091 - BLOCK
    )
    :vars
    (
      ?auto_275092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275091 ?auto_275092 ) ( ON-TABLE ?auto_275087 ) ( ON ?auto_275088 ?auto_275087 ) ( ON ?auto_275089 ?auto_275088 ) ( not ( = ?auto_275087 ?auto_275088 ) ) ( not ( = ?auto_275087 ?auto_275089 ) ) ( not ( = ?auto_275087 ?auto_275090 ) ) ( not ( = ?auto_275087 ?auto_275091 ) ) ( not ( = ?auto_275087 ?auto_275092 ) ) ( not ( = ?auto_275088 ?auto_275089 ) ) ( not ( = ?auto_275088 ?auto_275090 ) ) ( not ( = ?auto_275088 ?auto_275091 ) ) ( not ( = ?auto_275088 ?auto_275092 ) ) ( not ( = ?auto_275089 ?auto_275090 ) ) ( not ( = ?auto_275089 ?auto_275091 ) ) ( not ( = ?auto_275089 ?auto_275092 ) ) ( not ( = ?auto_275090 ?auto_275091 ) ) ( not ( = ?auto_275090 ?auto_275092 ) ) ( not ( = ?auto_275091 ?auto_275092 ) ) ( CLEAR ?auto_275089 ) ( ON ?auto_275090 ?auto_275091 ) ( CLEAR ?auto_275090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_275087 ?auto_275088 ?auto_275089 ?auto_275090 )
      ( MAKE-5PILE ?auto_275087 ?auto_275088 ?auto_275089 ?auto_275090 ?auto_275091 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_275109 - BLOCK
      ?auto_275110 - BLOCK
      ?auto_275111 - BLOCK
      ?auto_275112 - BLOCK
      ?auto_275113 - BLOCK
    )
    :vars
    (
      ?auto_275114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275113 ?auto_275114 ) ( ON-TABLE ?auto_275109 ) ( ON ?auto_275110 ?auto_275109 ) ( not ( = ?auto_275109 ?auto_275110 ) ) ( not ( = ?auto_275109 ?auto_275111 ) ) ( not ( = ?auto_275109 ?auto_275112 ) ) ( not ( = ?auto_275109 ?auto_275113 ) ) ( not ( = ?auto_275109 ?auto_275114 ) ) ( not ( = ?auto_275110 ?auto_275111 ) ) ( not ( = ?auto_275110 ?auto_275112 ) ) ( not ( = ?auto_275110 ?auto_275113 ) ) ( not ( = ?auto_275110 ?auto_275114 ) ) ( not ( = ?auto_275111 ?auto_275112 ) ) ( not ( = ?auto_275111 ?auto_275113 ) ) ( not ( = ?auto_275111 ?auto_275114 ) ) ( not ( = ?auto_275112 ?auto_275113 ) ) ( not ( = ?auto_275112 ?auto_275114 ) ) ( not ( = ?auto_275113 ?auto_275114 ) ) ( ON ?auto_275112 ?auto_275113 ) ( CLEAR ?auto_275110 ) ( ON ?auto_275111 ?auto_275112 ) ( CLEAR ?auto_275111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_275109 ?auto_275110 ?auto_275111 )
      ( MAKE-5PILE ?auto_275109 ?auto_275110 ?auto_275111 ?auto_275112 ?auto_275113 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_275131 - BLOCK
      ?auto_275132 - BLOCK
      ?auto_275133 - BLOCK
      ?auto_275134 - BLOCK
      ?auto_275135 - BLOCK
    )
    :vars
    (
      ?auto_275136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275135 ?auto_275136 ) ( ON-TABLE ?auto_275131 ) ( not ( = ?auto_275131 ?auto_275132 ) ) ( not ( = ?auto_275131 ?auto_275133 ) ) ( not ( = ?auto_275131 ?auto_275134 ) ) ( not ( = ?auto_275131 ?auto_275135 ) ) ( not ( = ?auto_275131 ?auto_275136 ) ) ( not ( = ?auto_275132 ?auto_275133 ) ) ( not ( = ?auto_275132 ?auto_275134 ) ) ( not ( = ?auto_275132 ?auto_275135 ) ) ( not ( = ?auto_275132 ?auto_275136 ) ) ( not ( = ?auto_275133 ?auto_275134 ) ) ( not ( = ?auto_275133 ?auto_275135 ) ) ( not ( = ?auto_275133 ?auto_275136 ) ) ( not ( = ?auto_275134 ?auto_275135 ) ) ( not ( = ?auto_275134 ?auto_275136 ) ) ( not ( = ?auto_275135 ?auto_275136 ) ) ( ON ?auto_275134 ?auto_275135 ) ( ON ?auto_275133 ?auto_275134 ) ( CLEAR ?auto_275131 ) ( ON ?auto_275132 ?auto_275133 ) ( CLEAR ?auto_275132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_275131 ?auto_275132 )
      ( MAKE-5PILE ?auto_275131 ?auto_275132 ?auto_275133 ?auto_275134 ?auto_275135 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_275153 - BLOCK
      ?auto_275154 - BLOCK
      ?auto_275155 - BLOCK
      ?auto_275156 - BLOCK
      ?auto_275157 - BLOCK
    )
    :vars
    (
      ?auto_275158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275157 ?auto_275158 ) ( not ( = ?auto_275153 ?auto_275154 ) ) ( not ( = ?auto_275153 ?auto_275155 ) ) ( not ( = ?auto_275153 ?auto_275156 ) ) ( not ( = ?auto_275153 ?auto_275157 ) ) ( not ( = ?auto_275153 ?auto_275158 ) ) ( not ( = ?auto_275154 ?auto_275155 ) ) ( not ( = ?auto_275154 ?auto_275156 ) ) ( not ( = ?auto_275154 ?auto_275157 ) ) ( not ( = ?auto_275154 ?auto_275158 ) ) ( not ( = ?auto_275155 ?auto_275156 ) ) ( not ( = ?auto_275155 ?auto_275157 ) ) ( not ( = ?auto_275155 ?auto_275158 ) ) ( not ( = ?auto_275156 ?auto_275157 ) ) ( not ( = ?auto_275156 ?auto_275158 ) ) ( not ( = ?auto_275157 ?auto_275158 ) ) ( ON ?auto_275156 ?auto_275157 ) ( ON ?auto_275155 ?auto_275156 ) ( ON ?auto_275154 ?auto_275155 ) ( ON ?auto_275153 ?auto_275154 ) ( CLEAR ?auto_275153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_275153 )
      ( MAKE-5PILE ?auto_275153 ?auto_275154 ?auto_275155 ?auto_275156 ?auto_275157 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_275176 - BLOCK
      ?auto_275177 - BLOCK
      ?auto_275178 - BLOCK
      ?auto_275179 - BLOCK
      ?auto_275180 - BLOCK
      ?auto_275181 - BLOCK
    )
    :vars
    (
      ?auto_275182 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_275180 ) ( ON ?auto_275181 ?auto_275182 ) ( CLEAR ?auto_275181 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_275176 ) ( ON ?auto_275177 ?auto_275176 ) ( ON ?auto_275178 ?auto_275177 ) ( ON ?auto_275179 ?auto_275178 ) ( ON ?auto_275180 ?auto_275179 ) ( not ( = ?auto_275176 ?auto_275177 ) ) ( not ( = ?auto_275176 ?auto_275178 ) ) ( not ( = ?auto_275176 ?auto_275179 ) ) ( not ( = ?auto_275176 ?auto_275180 ) ) ( not ( = ?auto_275176 ?auto_275181 ) ) ( not ( = ?auto_275176 ?auto_275182 ) ) ( not ( = ?auto_275177 ?auto_275178 ) ) ( not ( = ?auto_275177 ?auto_275179 ) ) ( not ( = ?auto_275177 ?auto_275180 ) ) ( not ( = ?auto_275177 ?auto_275181 ) ) ( not ( = ?auto_275177 ?auto_275182 ) ) ( not ( = ?auto_275178 ?auto_275179 ) ) ( not ( = ?auto_275178 ?auto_275180 ) ) ( not ( = ?auto_275178 ?auto_275181 ) ) ( not ( = ?auto_275178 ?auto_275182 ) ) ( not ( = ?auto_275179 ?auto_275180 ) ) ( not ( = ?auto_275179 ?auto_275181 ) ) ( not ( = ?auto_275179 ?auto_275182 ) ) ( not ( = ?auto_275180 ?auto_275181 ) ) ( not ( = ?auto_275180 ?auto_275182 ) ) ( not ( = ?auto_275181 ?auto_275182 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_275181 ?auto_275182 )
      ( !STACK ?auto_275181 ?auto_275180 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_275202 - BLOCK
      ?auto_275203 - BLOCK
      ?auto_275204 - BLOCK
      ?auto_275205 - BLOCK
      ?auto_275206 - BLOCK
      ?auto_275207 - BLOCK
    )
    :vars
    (
      ?auto_275208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275207 ?auto_275208 ) ( ON-TABLE ?auto_275202 ) ( ON ?auto_275203 ?auto_275202 ) ( ON ?auto_275204 ?auto_275203 ) ( ON ?auto_275205 ?auto_275204 ) ( not ( = ?auto_275202 ?auto_275203 ) ) ( not ( = ?auto_275202 ?auto_275204 ) ) ( not ( = ?auto_275202 ?auto_275205 ) ) ( not ( = ?auto_275202 ?auto_275206 ) ) ( not ( = ?auto_275202 ?auto_275207 ) ) ( not ( = ?auto_275202 ?auto_275208 ) ) ( not ( = ?auto_275203 ?auto_275204 ) ) ( not ( = ?auto_275203 ?auto_275205 ) ) ( not ( = ?auto_275203 ?auto_275206 ) ) ( not ( = ?auto_275203 ?auto_275207 ) ) ( not ( = ?auto_275203 ?auto_275208 ) ) ( not ( = ?auto_275204 ?auto_275205 ) ) ( not ( = ?auto_275204 ?auto_275206 ) ) ( not ( = ?auto_275204 ?auto_275207 ) ) ( not ( = ?auto_275204 ?auto_275208 ) ) ( not ( = ?auto_275205 ?auto_275206 ) ) ( not ( = ?auto_275205 ?auto_275207 ) ) ( not ( = ?auto_275205 ?auto_275208 ) ) ( not ( = ?auto_275206 ?auto_275207 ) ) ( not ( = ?auto_275206 ?auto_275208 ) ) ( not ( = ?auto_275207 ?auto_275208 ) ) ( CLEAR ?auto_275205 ) ( ON ?auto_275206 ?auto_275207 ) ( CLEAR ?auto_275206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_275202 ?auto_275203 ?auto_275204 ?auto_275205 ?auto_275206 )
      ( MAKE-6PILE ?auto_275202 ?auto_275203 ?auto_275204 ?auto_275205 ?auto_275206 ?auto_275207 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_275228 - BLOCK
      ?auto_275229 - BLOCK
      ?auto_275230 - BLOCK
      ?auto_275231 - BLOCK
      ?auto_275232 - BLOCK
      ?auto_275233 - BLOCK
    )
    :vars
    (
      ?auto_275234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275233 ?auto_275234 ) ( ON-TABLE ?auto_275228 ) ( ON ?auto_275229 ?auto_275228 ) ( ON ?auto_275230 ?auto_275229 ) ( not ( = ?auto_275228 ?auto_275229 ) ) ( not ( = ?auto_275228 ?auto_275230 ) ) ( not ( = ?auto_275228 ?auto_275231 ) ) ( not ( = ?auto_275228 ?auto_275232 ) ) ( not ( = ?auto_275228 ?auto_275233 ) ) ( not ( = ?auto_275228 ?auto_275234 ) ) ( not ( = ?auto_275229 ?auto_275230 ) ) ( not ( = ?auto_275229 ?auto_275231 ) ) ( not ( = ?auto_275229 ?auto_275232 ) ) ( not ( = ?auto_275229 ?auto_275233 ) ) ( not ( = ?auto_275229 ?auto_275234 ) ) ( not ( = ?auto_275230 ?auto_275231 ) ) ( not ( = ?auto_275230 ?auto_275232 ) ) ( not ( = ?auto_275230 ?auto_275233 ) ) ( not ( = ?auto_275230 ?auto_275234 ) ) ( not ( = ?auto_275231 ?auto_275232 ) ) ( not ( = ?auto_275231 ?auto_275233 ) ) ( not ( = ?auto_275231 ?auto_275234 ) ) ( not ( = ?auto_275232 ?auto_275233 ) ) ( not ( = ?auto_275232 ?auto_275234 ) ) ( not ( = ?auto_275233 ?auto_275234 ) ) ( ON ?auto_275232 ?auto_275233 ) ( CLEAR ?auto_275230 ) ( ON ?auto_275231 ?auto_275232 ) ( CLEAR ?auto_275231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_275228 ?auto_275229 ?auto_275230 ?auto_275231 )
      ( MAKE-6PILE ?auto_275228 ?auto_275229 ?auto_275230 ?auto_275231 ?auto_275232 ?auto_275233 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_275254 - BLOCK
      ?auto_275255 - BLOCK
      ?auto_275256 - BLOCK
      ?auto_275257 - BLOCK
      ?auto_275258 - BLOCK
      ?auto_275259 - BLOCK
    )
    :vars
    (
      ?auto_275260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275259 ?auto_275260 ) ( ON-TABLE ?auto_275254 ) ( ON ?auto_275255 ?auto_275254 ) ( not ( = ?auto_275254 ?auto_275255 ) ) ( not ( = ?auto_275254 ?auto_275256 ) ) ( not ( = ?auto_275254 ?auto_275257 ) ) ( not ( = ?auto_275254 ?auto_275258 ) ) ( not ( = ?auto_275254 ?auto_275259 ) ) ( not ( = ?auto_275254 ?auto_275260 ) ) ( not ( = ?auto_275255 ?auto_275256 ) ) ( not ( = ?auto_275255 ?auto_275257 ) ) ( not ( = ?auto_275255 ?auto_275258 ) ) ( not ( = ?auto_275255 ?auto_275259 ) ) ( not ( = ?auto_275255 ?auto_275260 ) ) ( not ( = ?auto_275256 ?auto_275257 ) ) ( not ( = ?auto_275256 ?auto_275258 ) ) ( not ( = ?auto_275256 ?auto_275259 ) ) ( not ( = ?auto_275256 ?auto_275260 ) ) ( not ( = ?auto_275257 ?auto_275258 ) ) ( not ( = ?auto_275257 ?auto_275259 ) ) ( not ( = ?auto_275257 ?auto_275260 ) ) ( not ( = ?auto_275258 ?auto_275259 ) ) ( not ( = ?auto_275258 ?auto_275260 ) ) ( not ( = ?auto_275259 ?auto_275260 ) ) ( ON ?auto_275258 ?auto_275259 ) ( ON ?auto_275257 ?auto_275258 ) ( CLEAR ?auto_275255 ) ( ON ?auto_275256 ?auto_275257 ) ( CLEAR ?auto_275256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_275254 ?auto_275255 ?auto_275256 )
      ( MAKE-6PILE ?auto_275254 ?auto_275255 ?auto_275256 ?auto_275257 ?auto_275258 ?auto_275259 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_275280 - BLOCK
      ?auto_275281 - BLOCK
      ?auto_275282 - BLOCK
      ?auto_275283 - BLOCK
      ?auto_275284 - BLOCK
      ?auto_275285 - BLOCK
    )
    :vars
    (
      ?auto_275286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275285 ?auto_275286 ) ( ON-TABLE ?auto_275280 ) ( not ( = ?auto_275280 ?auto_275281 ) ) ( not ( = ?auto_275280 ?auto_275282 ) ) ( not ( = ?auto_275280 ?auto_275283 ) ) ( not ( = ?auto_275280 ?auto_275284 ) ) ( not ( = ?auto_275280 ?auto_275285 ) ) ( not ( = ?auto_275280 ?auto_275286 ) ) ( not ( = ?auto_275281 ?auto_275282 ) ) ( not ( = ?auto_275281 ?auto_275283 ) ) ( not ( = ?auto_275281 ?auto_275284 ) ) ( not ( = ?auto_275281 ?auto_275285 ) ) ( not ( = ?auto_275281 ?auto_275286 ) ) ( not ( = ?auto_275282 ?auto_275283 ) ) ( not ( = ?auto_275282 ?auto_275284 ) ) ( not ( = ?auto_275282 ?auto_275285 ) ) ( not ( = ?auto_275282 ?auto_275286 ) ) ( not ( = ?auto_275283 ?auto_275284 ) ) ( not ( = ?auto_275283 ?auto_275285 ) ) ( not ( = ?auto_275283 ?auto_275286 ) ) ( not ( = ?auto_275284 ?auto_275285 ) ) ( not ( = ?auto_275284 ?auto_275286 ) ) ( not ( = ?auto_275285 ?auto_275286 ) ) ( ON ?auto_275284 ?auto_275285 ) ( ON ?auto_275283 ?auto_275284 ) ( ON ?auto_275282 ?auto_275283 ) ( CLEAR ?auto_275280 ) ( ON ?auto_275281 ?auto_275282 ) ( CLEAR ?auto_275281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_275280 ?auto_275281 )
      ( MAKE-6PILE ?auto_275280 ?auto_275281 ?auto_275282 ?auto_275283 ?auto_275284 ?auto_275285 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_275306 - BLOCK
      ?auto_275307 - BLOCK
      ?auto_275308 - BLOCK
      ?auto_275309 - BLOCK
      ?auto_275310 - BLOCK
      ?auto_275311 - BLOCK
    )
    :vars
    (
      ?auto_275312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275311 ?auto_275312 ) ( not ( = ?auto_275306 ?auto_275307 ) ) ( not ( = ?auto_275306 ?auto_275308 ) ) ( not ( = ?auto_275306 ?auto_275309 ) ) ( not ( = ?auto_275306 ?auto_275310 ) ) ( not ( = ?auto_275306 ?auto_275311 ) ) ( not ( = ?auto_275306 ?auto_275312 ) ) ( not ( = ?auto_275307 ?auto_275308 ) ) ( not ( = ?auto_275307 ?auto_275309 ) ) ( not ( = ?auto_275307 ?auto_275310 ) ) ( not ( = ?auto_275307 ?auto_275311 ) ) ( not ( = ?auto_275307 ?auto_275312 ) ) ( not ( = ?auto_275308 ?auto_275309 ) ) ( not ( = ?auto_275308 ?auto_275310 ) ) ( not ( = ?auto_275308 ?auto_275311 ) ) ( not ( = ?auto_275308 ?auto_275312 ) ) ( not ( = ?auto_275309 ?auto_275310 ) ) ( not ( = ?auto_275309 ?auto_275311 ) ) ( not ( = ?auto_275309 ?auto_275312 ) ) ( not ( = ?auto_275310 ?auto_275311 ) ) ( not ( = ?auto_275310 ?auto_275312 ) ) ( not ( = ?auto_275311 ?auto_275312 ) ) ( ON ?auto_275310 ?auto_275311 ) ( ON ?auto_275309 ?auto_275310 ) ( ON ?auto_275308 ?auto_275309 ) ( ON ?auto_275307 ?auto_275308 ) ( ON ?auto_275306 ?auto_275307 ) ( CLEAR ?auto_275306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_275306 )
      ( MAKE-6PILE ?auto_275306 ?auto_275307 ?auto_275308 ?auto_275309 ?auto_275310 ?auto_275311 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_275333 - BLOCK
      ?auto_275334 - BLOCK
      ?auto_275335 - BLOCK
      ?auto_275336 - BLOCK
      ?auto_275337 - BLOCK
      ?auto_275338 - BLOCK
      ?auto_275339 - BLOCK
    )
    :vars
    (
      ?auto_275340 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_275338 ) ( ON ?auto_275339 ?auto_275340 ) ( CLEAR ?auto_275339 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_275333 ) ( ON ?auto_275334 ?auto_275333 ) ( ON ?auto_275335 ?auto_275334 ) ( ON ?auto_275336 ?auto_275335 ) ( ON ?auto_275337 ?auto_275336 ) ( ON ?auto_275338 ?auto_275337 ) ( not ( = ?auto_275333 ?auto_275334 ) ) ( not ( = ?auto_275333 ?auto_275335 ) ) ( not ( = ?auto_275333 ?auto_275336 ) ) ( not ( = ?auto_275333 ?auto_275337 ) ) ( not ( = ?auto_275333 ?auto_275338 ) ) ( not ( = ?auto_275333 ?auto_275339 ) ) ( not ( = ?auto_275333 ?auto_275340 ) ) ( not ( = ?auto_275334 ?auto_275335 ) ) ( not ( = ?auto_275334 ?auto_275336 ) ) ( not ( = ?auto_275334 ?auto_275337 ) ) ( not ( = ?auto_275334 ?auto_275338 ) ) ( not ( = ?auto_275334 ?auto_275339 ) ) ( not ( = ?auto_275334 ?auto_275340 ) ) ( not ( = ?auto_275335 ?auto_275336 ) ) ( not ( = ?auto_275335 ?auto_275337 ) ) ( not ( = ?auto_275335 ?auto_275338 ) ) ( not ( = ?auto_275335 ?auto_275339 ) ) ( not ( = ?auto_275335 ?auto_275340 ) ) ( not ( = ?auto_275336 ?auto_275337 ) ) ( not ( = ?auto_275336 ?auto_275338 ) ) ( not ( = ?auto_275336 ?auto_275339 ) ) ( not ( = ?auto_275336 ?auto_275340 ) ) ( not ( = ?auto_275337 ?auto_275338 ) ) ( not ( = ?auto_275337 ?auto_275339 ) ) ( not ( = ?auto_275337 ?auto_275340 ) ) ( not ( = ?auto_275338 ?auto_275339 ) ) ( not ( = ?auto_275338 ?auto_275340 ) ) ( not ( = ?auto_275339 ?auto_275340 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_275339 ?auto_275340 )
      ( !STACK ?auto_275339 ?auto_275338 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_275363 - BLOCK
      ?auto_275364 - BLOCK
      ?auto_275365 - BLOCK
      ?auto_275366 - BLOCK
      ?auto_275367 - BLOCK
      ?auto_275368 - BLOCK
      ?auto_275369 - BLOCK
    )
    :vars
    (
      ?auto_275370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275369 ?auto_275370 ) ( ON-TABLE ?auto_275363 ) ( ON ?auto_275364 ?auto_275363 ) ( ON ?auto_275365 ?auto_275364 ) ( ON ?auto_275366 ?auto_275365 ) ( ON ?auto_275367 ?auto_275366 ) ( not ( = ?auto_275363 ?auto_275364 ) ) ( not ( = ?auto_275363 ?auto_275365 ) ) ( not ( = ?auto_275363 ?auto_275366 ) ) ( not ( = ?auto_275363 ?auto_275367 ) ) ( not ( = ?auto_275363 ?auto_275368 ) ) ( not ( = ?auto_275363 ?auto_275369 ) ) ( not ( = ?auto_275363 ?auto_275370 ) ) ( not ( = ?auto_275364 ?auto_275365 ) ) ( not ( = ?auto_275364 ?auto_275366 ) ) ( not ( = ?auto_275364 ?auto_275367 ) ) ( not ( = ?auto_275364 ?auto_275368 ) ) ( not ( = ?auto_275364 ?auto_275369 ) ) ( not ( = ?auto_275364 ?auto_275370 ) ) ( not ( = ?auto_275365 ?auto_275366 ) ) ( not ( = ?auto_275365 ?auto_275367 ) ) ( not ( = ?auto_275365 ?auto_275368 ) ) ( not ( = ?auto_275365 ?auto_275369 ) ) ( not ( = ?auto_275365 ?auto_275370 ) ) ( not ( = ?auto_275366 ?auto_275367 ) ) ( not ( = ?auto_275366 ?auto_275368 ) ) ( not ( = ?auto_275366 ?auto_275369 ) ) ( not ( = ?auto_275366 ?auto_275370 ) ) ( not ( = ?auto_275367 ?auto_275368 ) ) ( not ( = ?auto_275367 ?auto_275369 ) ) ( not ( = ?auto_275367 ?auto_275370 ) ) ( not ( = ?auto_275368 ?auto_275369 ) ) ( not ( = ?auto_275368 ?auto_275370 ) ) ( not ( = ?auto_275369 ?auto_275370 ) ) ( CLEAR ?auto_275367 ) ( ON ?auto_275368 ?auto_275369 ) ( CLEAR ?auto_275368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_275363 ?auto_275364 ?auto_275365 ?auto_275366 ?auto_275367 ?auto_275368 )
      ( MAKE-7PILE ?auto_275363 ?auto_275364 ?auto_275365 ?auto_275366 ?auto_275367 ?auto_275368 ?auto_275369 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_275393 - BLOCK
      ?auto_275394 - BLOCK
      ?auto_275395 - BLOCK
      ?auto_275396 - BLOCK
      ?auto_275397 - BLOCK
      ?auto_275398 - BLOCK
      ?auto_275399 - BLOCK
    )
    :vars
    (
      ?auto_275400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275399 ?auto_275400 ) ( ON-TABLE ?auto_275393 ) ( ON ?auto_275394 ?auto_275393 ) ( ON ?auto_275395 ?auto_275394 ) ( ON ?auto_275396 ?auto_275395 ) ( not ( = ?auto_275393 ?auto_275394 ) ) ( not ( = ?auto_275393 ?auto_275395 ) ) ( not ( = ?auto_275393 ?auto_275396 ) ) ( not ( = ?auto_275393 ?auto_275397 ) ) ( not ( = ?auto_275393 ?auto_275398 ) ) ( not ( = ?auto_275393 ?auto_275399 ) ) ( not ( = ?auto_275393 ?auto_275400 ) ) ( not ( = ?auto_275394 ?auto_275395 ) ) ( not ( = ?auto_275394 ?auto_275396 ) ) ( not ( = ?auto_275394 ?auto_275397 ) ) ( not ( = ?auto_275394 ?auto_275398 ) ) ( not ( = ?auto_275394 ?auto_275399 ) ) ( not ( = ?auto_275394 ?auto_275400 ) ) ( not ( = ?auto_275395 ?auto_275396 ) ) ( not ( = ?auto_275395 ?auto_275397 ) ) ( not ( = ?auto_275395 ?auto_275398 ) ) ( not ( = ?auto_275395 ?auto_275399 ) ) ( not ( = ?auto_275395 ?auto_275400 ) ) ( not ( = ?auto_275396 ?auto_275397 ) ) ( not ( = ?auto_275396 ?auto_275398 ) ) ( not ( = ?auto_275396 ?auto_275399 ) ) ( not ( = ?auto_275396 ?auto_275400 ) ) ( not ( = ?auto_275397 ?auto_275398 ) ) ( not ( = ?auto_275397 ?auto_275399 ) ) ( not ( = ?auto_275397 ?auto_275400 ) ) ( not ( = ?auto_275398 ?auto_275399 ) ) ( not ( = ?auto_275398 ?auto_275400 ) ) ( not ( = ?auto_275399 ?auto_275400 ) ) ( ON ?auto_275398 ?auto_275399 ) ( CLEAR ?auto_275396 ) ( ON ?auto_275397 ?auto_275398 ) ( CLEAR ?auto_275397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_275393 ?auto_275394 ?auto_275395 ?auto_275396 ?auto_275397 )
      ( MAKE-7PILE ?auto_275393 ?auto_275394 ?auto_275395 ?auto_275396 ?auto_275397 ?auto_275398 ?auto_275399 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_275423 - BLOCK
      ?auto_275424 - BLOCK
      ?auto_275425 - BLOCK
      ?auto_275426 - BLOCK
      ?auto_275427 - BLOCK
      ?auto_275428 - BLOCK
      ?auto_275429 - BLOCK
    )
    :vars
    (
      ?auto_275430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275429 ?auto_275430 ) ( ON-TABLE ?auto_275423 ) ( ON ?auto_275424 ?auto_275423 ) ( ON ?auto_275425 ?auto_275424 ) ( not ( = ?auto_275423 ?auto_275424 ) ) ( not ( = ?auto_275423 ?auto_275425 ) ) ( not ( = ?auto_275423 ?auto_275426 ) ) ( not ( = ?auto_275423 ?auto_275427 ) ) ( not ( = ?auto_275423 ?auto_275428 ) ) ( not ( = ?auto_275423 ?auto_275429 ) ) ( not ( = ?auto_275423 ?auto_275430 ) ) ( not ( = ?auto_275424 ?auto_275425 ) ) ( not ( = ?auto_275424 ?auto_275426 ) ) ( not ( = ?auto_275424 ?auto_275427 ) ) ( not ( = ?auto_275424 ?auto_275428 ) ) ( not ( = ?auto_275424 ?auto_275429 ) ) ( not ( = ?auto_275424 ?auto_275430 ) ) ( not ( = ?auto_275425 ?auto_275426 ) ) ( not ( = ?auto_275425 ?auto_275427 ) ) ( not ( = ?auto_275425 ?auto_275428 ) ) ( not ( = ?auto_275425 ?auto_275429 ) ) ( not ( = ?auto_275425 ?auto_275430 ) ) ( not ( = ?auto_275426 ?auto_275427 ) ) ( not ( = ?auto_275426 ?auto_275428 ) ) ( not ( = ?auto_275426 ?auto_275429 ) ) ( not ( = ?auto_275426 ?auto_275430 ) ) ( not ( = ?auto_275427 ?auto_275428 ) ) ( not ( = ?auto_275427 ?auto_275429 ) ) ( not ( = ?auto_275427 ?auto_275430 ) ) ( not ( = ?auto_275428 ?auto_275429 ) ) ( not ( = ?auto_275428 ?auto_275430 ) ) ( not ( = ?auto_275429 ?auto_275430 ) ) ( ON ?auto_275428 ?auto_275429 ) ( ON ?auto_275427 ?auto_275428 ) ( CLEAR ?auto_275425 ) ( ON ?auto_275426 ?auto_275427 ) ( CLEAR ?auto_275426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_275423 ?auto_275424 ?auto_275425 ?auto_275426 )
      ( MAKE-7PILE ?auto_275423 ?auto_275424 ?auto_275425 ?auto_275426 ?auto_275427 ?auto_275428 ?auto_275429 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_275453 - BLOCK
      ?auto_275454 - BLOCK
      ?auto_275455 - BLOCK
      ?auto_275456 - BLOCK
      ?auto_275457 - BLOCK
      ?auto_275458 - BLOCK
      ?auto_275459 - BLOCK
    )
    :vars
    (
      ?auto_275460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275459 ?auto_275460 ) ( ON-TABLE ?auto_275453 ) ( ON ?auto_275454 ?auto_275453 ) ( not ( = ?auto_275453 ?auto_275454 ) ) ( not ( = ?auto_275453 ?auto_275455 ) ) ( not ( = ?auto_275453 ?auto_275456 ) ) ( not ( = ?auto_275453 ?auto_275457 ) ) ( not ( = ?auto_275453 ?auto_275458 ) ) ( not ( = ?auto_275453 ?auto_275459 ) ) ( not ( = ?auto_275453 ?auto_275460 ) ) ( not ( = ?auto_275454 ?auto_275455 ) ) ( not ( = ?auto_275454 ?auto_275456 ) ) ( not ( = ?auto_275454 ?auto_275457 ) ) ( not ( = ?auto_275454 ?auto_275458 ) ) ( not ( = ?auto_275454 ?auto_275459 ) ) ( not ( = ?auto_275454 ?auto_275460 ) ) ( not ( = ?auto_275455 ?auto_275456 ) ) ( not ( = ?auto_275455 ?auto_275457 ) ) ( not ( = ?auto_275455 ?auto_275458 ) ) ( not ( = ?auto_275455 ?auto_275459 ) ) ( not ( = ?auto_275455 ?auto_275460 ) ) ( not ( = ?auto_275456 ?auto_275457 ) ) ( not ( = ?auto_275456 ?auto_275458 ) ) ( not ( = ?auto_275456 ?auto_275459 ) ) ( not ( = ?auto_275456 ?auto_275460 ) ) ( not ( = ?auto_275457 ?auto_275458 ) ) ( not ( = ?auto_275457 ?auto_275459 ) ) ( not ( = ?auto_275457 ?auto_275460 ) ) ( not ( = ?auto_275458 ?auto_275459 ) ) ( not ( = ?auto_275458 ?auto_275460 ) ) ( not ( = ?auto_275459 ?auto_275460 ) ) ( ON ?auto_275458 ?auto_275459 ) ( ON ?auto_275457 ?auto_275458 ) ( ON ?auto_275456 ?auto_275457 ) ( CLEAR ?auto_275454 ) ( ON ?auto_275455 ?auto_275456 ) ( CLEAR ?auto_275455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_275453 ?auto_275454 ?auto_275455 )
      ( MAKE-7PILE ?auto_275453 ?auto_275454 ?auto_275455 ?auto_275456 ?auto_275457 ?auto_275458 ?auto_275459 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_275483 - BLOCK
      ?auto_275484 - BLOCK
      ?auto_275485 - BLOCK
      ?auto_275486 - BLOCK
      ?auto_275487 - BLOCK
      ?auto_275488 - BLOCK
      ?auto_275489 - BLOCK
    )
    :vars
    (
      ?auto_275490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275489 ?auto_275490 ) ( ON-TABLE ?auto_275483 ) ( not ( = ?auto_275483 ?auto_275484 ) ) ( not ( = ?auto_275483 ?auto_275485 ) ) ( not ( = ?auto_275483 ?auto_275486 ) ) ( not ( = ?auto_275483 ?auto_275487 ) ) ( not ( = ?auto_275483 ?auto_275488 ) ) ( not ( = ?auto_275483 ?auto_275489 ) ) ( not ( = ?auto_275483 ?auto_275490 ) ) ( not ( = ?auto_275484 ?auto_275485 ) ) ( not ( = ?auto_275484 ?auto_275486 ) ) ( not ( = ?auto_275484 ?auto_275487 ) ) ( not ( = ?auto_275484 ?auto_275488 ) ) ( not ( = ?auto_275484 ?auto_275489 ) ) ( not ( = ?auto_275484 ?auto_275490 ) ) ( not ( = ?auto_275485 ?auto_275486 ) ) ( not ( = ?auto_275485 ?auto_275487 ) ) ( not ( = ?auto_275485 ?auto_275488 ) ) ( not ( = ?auto_275485 ?auto_275489 ) ) ( not ( = ?auto_275485 ?auto_275490 ) ) ( not ( = ?auto_275486 ?auto_275487 ) ) ( not ( = ?auto_275486 ?auto_275488 ) ) ( not ( = ?auto_275486 ?auto_275489 ) ) ( not ( = ?auto_275486 ?auto_275490 ) ) ( not ( = ?auto_275487 ?auto_275488 ) ) ( not ( = ?auto_275487 ?auto_275489 ) ) ( not ( = ?auto_275487 ?auto_275490 ) ) ( not ( = ?auto_275488 ?auto_275489 ) ) ( not ( = ?auto_275488 ?auto_275490 ) ) ( not ( = ?auto_275489 ?auto_275490 ) ) ( ON ?auto_275488 ?auto_275489 ) ( ON ?auto_275487 ?auto_275488 ) ( ON ?auto_275486 ?auto_275487 ) ( ON ?auto_275485 ?auto_275486 ) ( CLEAR ?auto_275483 ) ( ON ?auto_275484 ?auto_275485 ) ( CLEAR ?auto_275484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_275483 ?auto_275484 )
      ( MAKE-7PILE ?auto_275483 ?auto_275484 ?auto_275485 ?auto_275486 ?auto_275487 ?auto_275488 ?auto_275489 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_275513 - BLOCK
      ?auto_275514 - BLOCK
      ?auto_275515 - BLOCK
      ?auto_275516 - BLOCK
      ?auto_275517 - BLOCK
      ?auto_275518 - BLOCK
      ?auto_275519 - BLOCK
    )
    :vars
    (
      ?auto_275520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275519 ?auto_275520 ) ( not ( = ?auto_275513 ?auto_275514 ) ) ( not ( = ?auto_275513 ?auto_275515 ) ) ( not ( = ?auto_275513 ?auto_275516 ) ) ( not ( = ?auto_275513 ?auto_275517 ) ) ( not ( = ?auto_275513 ?auto_275518 ) ) ( not ( = ?auto_275513 ?auto_275519 ) ) ( not ( = ?auto_275513 ?auto_275520 ) ) ( not ( = ?auto_275514 ?auto_275515 ) ) ( not ( = ?auto_275514 ?auto_275516 ) ) ( not ( = ?auto_275514 ?auto_275517 ) ) ( not ( = ?auto_275514 ?auto_275518 ) ) ( not ( = ?auto_275514 ?auto_275519 ) ) ( not ( = ?auto_275514 ?auto_275520 ) ) ( not ( = ?auto_275515 ?auto_275516 ) ) ( not ( = ?auto_275515 ?auto_275517 ) ) ( not ( = ?auto_275515 ?auto_275518 ) ) ( not ( = ?auto_275515 ?auto_275519 ) ) ( not ( = ?auto_275515 ?auto_275520 ) ) ( not ( = ?auto_275516 ?auto_275517 ) ) ( not ( = ?auto_275516 ?auto_275518 ) ) ( not ( = ?auto_275516 ?auto_275519 ) ) ( not ( = ?auto_275516 ?auto_275520 ) ) ( not ( = ?auto_275517 ?auto_275518 ) ) ( not ( = ?auto_275517 ?auto_275519 ) ) ( not ( = ?auto_275517 ?auto_275520 ) ) ( not ( = ?auto_275518 ?auto_275519 ) ) ( not ( = ?auto_275518 ?auto_275520 ) ) ( not ( = ?auto_275519 ?auto_275520 ) ) ( ON ?auto_275518 ?auto_275519 ) ( ON ?auto_275517 ?auto_275518 ) ( ON ?auto_275516 ?auto_275517 ) ( ON ?auto_275515 ?auto_275516 ) ( ON ?auto_275514 ?auto_275515 ) ( ON ?auto_275513 ?auto_275514 ) ( CLEAR ?auto_275513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_275513 )
      ( MAKE-7PILE ?auto_275513 ?auto_275514 ?auto_275515 ?auto_275516 ?auto_275517 ?auto_275518 ?auto_275519 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_275544 - BLOCK
      ?auto_275545 - BLOCK
      ?auto_275546 - BLOCK
      ?auto_275547 - BLOCK
      ?auto_275548 - BLOCK
      ?auto_275549 - BLOCK
      ?auto_275550 - BLOCK
      ?auto_275551 - BLOCK
    )
    :vars
    (
      ?auto_275552 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_275550 ) ( ON ?auto_275551 ?auto_275552 ) ( CLEAR ?auto_275551 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_275544 ) ( ON ?auto_275545 ?auto_275544 ) ( ON ?auto_275546 ?auto_275545 ) ( ON ?auto_275547 ?auto_275546 ) ( ON ?auto_275548 ?auto_275547 ) ( ON ?auto_275549 ?auto_275548 ) ( ON ?auto_275550 ?auto_275549 ) ( not ( = ?auto_275544 ?auto_275545 ) ) ( not ( = ?auto_275544 ?auto_275546 ) ) ( not ( = ?auto_275544 ?auto_275547 ) ) ( not ( = ?auto_275544 ?auto_275548 ) ) ( not ( = ?auto_275544 ?auto_275549 ) ) ( not ( = ?auto_275544 ?auto_275550 ) ) ( not ( = ?auto_275544 ?auto_275551 ) ) ( not ( = ?auto_275544 ?auto_275552 ) ) ( not ( = ?auto_275545 ?auto_275546 ) ) ( not ( = ?auto_275545 ?auto_275547 ) ) ( not ( = ?auto_275545 ?auto_275548 ) ) ( not ( = ?auto_275545 ?auto_275549 ) ) ( not ( = ?auto_275545 ?auto_275550 ) ) ( not ( = ?auto_275545 ?auto_275551 ) ) ( not ( = ?auto_275545 ?auto_275552 ) ) ( not ( = ?auto_275546 ?auto_275547 ) ) ( not ( = ?auto_275546 ?auto_275548 ) ) ( not ( = ?auto_275546 ?auto_275549 ) ) ( not ( = ?auto_275546 ?auto_275550 ) ) ( not ( = ?auto_275546 ?auto_275551 ) ) ( not ( = ?auto_275546 ?auto_275552 ) ) ( not ( = ?auto_275547 ?auto_275548 ) ) ( not ( = ?auto_275547 ?auto_275549 ) ) ( not ( = ?auto_275547 ?auto_275550 ) ) ( not ( = ?auto_275547 ?auto_275551 ) ) ( not ( = ?auto_275547 ?auto_275552 ) ) ( not ( = ?auto_275548 ?auto_275549 ) ) ( not ( = ?auto_275548 ?auto_275550 ) ) ( not ( = ?auto_275548 ?auto_275551 ) ) ( not ( = ?auto_275548 ?auto_275552 ) ) ( not ( = ?auto_275549 ?auto_275550 ) ) ( not ( = ?auto_275549 ?auto_275551 ) ) ( not ( = ?auto_275549 ?auto_275552 ) ) ( not ( = ?auto_275550 ?auto_275551 ) ) ( not ( = ?auto_275550 ?auto_275552 ) ) ( not ( = ?auto_275551 ?auto_275552 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_275551 ?auto_275552 )
      ( !STACK ?auto_275551 ?auto_275550 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_275578 - BLOCK
      ?auto_275579 - BLOCK
      ?auto_275580 - BLOCK
      ?auto_275581 - BLOCK
      ?auto_275582 - BLOCK
      ?auto_275583 - BLOCK
      ?auto_275584 - BLOCK
      ?auto_275585 - BLOCK
    )
    :vars
    (
      ?auto_275586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275585 ?auto_275586 ) ( ON-TABLE ?auto_275578 ) ( ON ?auto_275579 ?auto_275578 ) ( ON ?auto_275580 ?auto_275579 ) ( ON ?auto_275581 ?auto_275580 ) ( ON ?auto_275582 ?auto_275581 ) ( ON ?auto_275583 ?auto_275582 ) ( not ( = ?auto_275578 ?auto_275579 ) ) ( not ( = ?auto_275578 ?auto_275580 ) ) ( not ( = ?auto_275578 ?auto_275581 ) ) ( not ( = ?auto_275578 ?auto_275582 ) ) ( not ( = ?auto_275578 ?auto_275583 ) ) ( not ( = ?auto_275578 ?auto_275584 ) ) ( not ( = ?auto_275578 ?auto_275585 ) ) ( not ( = ?auto_275578 ?auto_275586 ) ) ( not ( = ?auto_275579 ?auto_275580 ) ) ( not ( = ?auto_275579 ?auto_275581 ) ) ( not ( = ?auto_275579 ?auto_275582 ) ) ( not ( = ?auto_275579 ?auto_275583 ) ) ( not ( = ?auto_275579 ?auto_275584 ) ) ( not ( = ?auto_275579 ?auto_275585 ) ) ( not ( = ?auto_275579 ?auto_275586 ) ) ( not ( = ?auto_275580 ?auto_275581 ) ) ( not ( = ?auto_275580 ?auto_275582 ) ) ( not ( = ?auto_275580 ?auto_275583 ) ) ( not ( = ?auto_275580 ?auto_275584 ) ) ( not ( = ?auto_275580 ?auto_275585 ) ) ( not ( = ?auto_275580 ?auto_275586 ) ) ( not ( = ?auto_275581 ?auto_275582 ) ) ( not ( = ?auto_275581 ?auto_275583 ) ) ( not ( = ?auto_275581 ?auto_275584 ) ) ( not ( = ?auto_275581 ?auto_275585 ) ) ( not ( = ?auto_275581 ?auto_275586 ) ) ( not ( = ?auto_275582 ?auto_275583 ) ) ( not ( = ?auto_275582 ?auto_275584 ) ) ( not ( = ?auto_275582 ?auto_275585 ) ) ( not ( = ?auto_275582 ?auto_275586 ) ) ( not ( = ?auto_275583 ?auto_275584 ) ) ( not ( = ?auto_275583 ?auto_275585 ) ) ( not ( = ?auto_275583 ?auto_275586 ) ) ( not ( = ?auto_275584 ?auto_275585 ) ) ( not ( = ?auto_275584 ?auto_275586 ) ) ( not ( = ?auto_275585 ?auto_275586 ) ) ( CLEAR ?auto_275583 ) ( ON ?auto_275584 ?auto_275585 ) ( CLEAR ?auto_275584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_275578 ?auto_275579 ?auto_275580 ?auto_275581 ?auto_275582 ?auto_275583 ?auto_275584 )
      ( MAKE-8PILE ?auto_275578 ?auto_275579 ?auto_275580 ?auto_275581 ?auto_275582 ?auto_275583 ?auto_275584 ?auto_275585 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_275612 - BLOCK
      ?auto_275613 - BLOCK
      ?auto_275614 - BLOCK
      ?auto_275615 - BLOCK
      ?auto_275616 - BLOCK
      ?auto_275617 - BLOCK
      ?auto_275618 - BLOCK
      ?auto_275619 - BLOCK
    )
    :vars
    (
      ?auto_275620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275619 ?auto_275620 ) ( ON-TABLE ?auto_275612 ) ( ON ?auto_275613 ?auto_275612 ) ( ON ?auto_275614 ?auto_275613 ) ( ON ?auto_275615 ?auto_275614 ) ( ON ?auto_275616 ?auto_275615 ) ( not ( = ?auto_275612 ?auto_275613 ) ) ( not ( = ?auto_275612 ?auto_275614 ) ) ( not ( = ?auto_275612 ?auto_275615 ) ) ( not ( = ?auto_275612 ?auto_275616 ) ) ( not ( = ?auto_275612 ?auto_275617 ) ) ( not ( = ?auto_275612 ?auto_275618 ) ) ( not ( = ?auto_275612 ?auto_275619 ) ) ( not ( = ?auto_275612 ?auto_275620 ) ) ( not ( = ?auto_275613 ?auto_275614 ) ) ( not ( = ?auto_275613 ?auto_275615 ) ) ( not ( = ?auto_275613 ?auto_275616 ) ) ( not ( = ?auto_275613 ?auto_275617 ) ) ( not ( = ?auto_275613 ?auto_275618 ) ) ( not ( = ?auto_275613 ?auto_275619 ) ) ( not ( = ?auto_275613 ?auto_275620 ) ) ( not ( = ?auto_275614 ?auto_275615 ) ) ( not ( = ?auto_275614 ?auto_275616 ) ) ( not ( = ?auto_275614 ?auto_275617 ) ) ( not ( = ?auto_275614 ?auto_275618 ) ) ( not ( = ?auto_275614 ?auto_275619 ) ) ( not ( = ?auto_275614 ?auto_275620 ) ) ( not ( = ?auto_275615 ?auto_275616 ) ) ( not ( = ?auto_275615 ?auto_275617 ) ) ( not ( = ?auto_275615 ?auto_275618 ) ) ( not ( = ?auto_275615 ?auto_275619 ) ) ( not ( = ?auto_275615 ?auto_275620 ) ) ( not ( = ?auto_275616 ?auto_275617 ) ) ( not ( = ?auto_275616 ?auto_275618 ) ) ( not ( = ?auto_275616 ?auto_275619 ) ) ( not ( = ?auto_275616 ?auto_275620 ) ) ( not ( = ?auto_275617 ?auto_275618 ) ) ( not ( = ?auto_275617 ?auto_275619 ) ) ( not ( = ?auto_275617 ?auto_275620 ) ) ( not ( = ?auto_275618 ?auto_275619 ) ) ( not ( = ?auto_275618 ?auto_275620 ) ) ( not ( = ?auto_275619 ?auto_275620 ) ) ( ON ?auto_275618 ?auto_275619 ) ( CLEAR ?auto_275616 ) ( ON ?auto_275617 ?auto_275618 ) ( CLEAR ?auto_275617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_275612 ?auto_275613 ?auto_275614 ?auto_275615 ?auto_275616 ?auto_275617 )
      ( MAKE-8PILE ?auto_275612 ?auto_275613 ?auto_275614 ?auto_275615 ?auto_275616 ?auto_275617 ?auto_275618 ?auto_275619 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_275646 - BLOCK
      ?auto_275647 - BLOCK
      ?auto_275648 - BLOCK
      ?auto_275649 - BLOCK
      ?auto_275650 - BLOCK
      ?auto_275651 - BLOCK
      ?auto_275652 - BLOCK
      ?auto_275653 - BLOCK
    )
    :vars
    (
      ?auto_275654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275653 ?auto_275654 ) ( ON-TABLE ?auto_275646 ) ( ON ?auto_275647 ?auto_275646 ) ( ON ?auto_275648 ?auto_275647 ) ( ON ?auto_275649 ?auto_275648 ) ( not ( = ?auto_275646 ?auto_275647 ) ) ( not ( = ?auto_275646 ?auto_275648 ) ) ( not ( = ?auto_275646 ?auto_275649 ) ) ( not ( = ?auto_275646 ?auto_275650 ) ) ( not ( = ?auto_275646 ?auto_275651 ) ) ( not ( = ?auto_275646 ?auto_275652 ) ) ( not ( = ?auto_275646 ?auto_275653 ) ) ( not ( = ?auto_275646 ?auto_275654 ) ) ( not ( = ?auto_275647 ?auto_275648 ) ) ( not ( = ?auto_275647 ?auto_275649 ) ) ( not ( = ?auto_275647 ?auto_275650 ) ) ( not ( = ?auto_275647 ?auto_275651 ) ) ( not ( = ?auto_275647 ?auto_275652 ) ) ( not ( = ?auto_275647 ?auto_275653 ) ) ( not ( = ?auto_275647 ?auto_275654 ) ) ( not ( = ?auto_275648 ?auto_275649 ) ) ( not ( = ?auto_275648 ?auto_275650 ) ) ( not ( = ?auto_275648 ?auto_275651 ) ) ( not ( = ?auto_275648 ?auto_275652 ) ) ( not ( = ?auto_275648 ?auto_275653 ) ) ( not ( = ?auto_275648 ?auto_275654 ) ) ( not ( = ?auto_275649 ?auto_275650 ) ) ( not ( = ?auto_275649 ?auto_275651 ) ) ( not ( = ?auto_275649 ?auto_275652 ) ) ( not ( = ?auto_275649 ?auto_275653 ) ) ( not ( = ?auto_275649 ?auto_275654 ) ) ( not ( = ?auto_275650 ?auto_275651 ) ) ( not ( = ?auto_275650 ?auto_275652 ) ) ( not ( = ?auto_275650 ?auto_275653 ) ) ( not ( = ?auto_275650 ?auto_275654 ) ) ( not ( = ?auto_275651 ?auto_275652 ) ) ( not ( = ?auto_275651 ?auto_275653 ) ) ( not ( = ?auto_275651 ?auto_275654 ) ) ( not ( = ?auto_275652 ?auto_275653 ) ) ( not ( = ?auto_275652 ?auto_275654 ) ) ( not ( = ?auto_275653 ?auto_275654 ) ) ( ON ?auto_275652 ?auto_275653 ) ( ON ?auto_275651 ?auto_275652 ) ( CLEAR ?auto_275649 ) ( ON ?auto_275650 ?auto_275651 ) ( CLEAR ?auto_275650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_275646 ?auto_275647 ?auto_275648 ?auto_275649 ?auto_275650 )
      ( MAKE-8PILE ?auto_275646 ?auto_275647 ?auto_275648 ?auto_275649 ?auto_275650 ?auto_275651 ?auto_275652 ?auto_275653 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_275680 - BLOCK
      ?auto_275681 - BLOCK
      ?auto_275682 - BLOCK
      ?auto_275683 - BLOCK
      ?auto_275684 - BLOCK
      ?auto_275685 - BLOCK
      ?auto_275686 - BLOCK
      ?auto_275687 - BLOCK
    )
    :vars
    (
      ?auto_275688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275687 ?auto_275688 ) ( ON-TABLE ?auto_275680 ) ( ON ?auto_275681 ?auto_275680 ) ( ON ?auto_275682 ?auto_275681 ) ( not ( = ?auto_275680 ?auto_275681 ) ) ( not ( = ?auto_275680 ?auto_275682 ) ) ( not ( = ?auto_275680 ?auto_275683 ) ) ( not ( = ?auto_275680 ?auto_275684 ) ) ( not ( = ?auto_275680 ?auto_275685 ) ) ( not ( = ?auto_275680 ?auto_275686 ) ) ( not ( = ?auto_275680 ?auto_275687 ) ) ( not ( = ?auto_275680 ?auto_275688 ) ) ( not ( = ?auto_275681 ?auto_275682 ) ) ( not ( = ?auto_275681 ?auto_275683 ) ) ( not ( = ?auto_275681 ?auto_275684 ) ) ( not ( = ?auto_275681 ?auto_275685 ) ) ( not ( = ?auto_275681 ?auto_275686 ) ) ( not ( = ?auto_275681 ?auto_275687 ) ) ( not ( = ?auto_275681 ?auto_275688 ) ) ( not ( = ?auto_275682 ?auto_275683 ) ) ( not ( = ?auto_275682 ?auto_275684 ) ) ( not ( = ?auto_275682 ?auto_275685 ) ) ( not ( = ?auto_275682 ?auto_275686 ) ) ( not ( = ?auto_275682 ?auto_275687 ) ) ( not ( = ?auto_275682 ?auto_275688 ) ) ( not ( = ?auto_275683 ?auto_275684 ) ) ( not ( = ?auto_275683 ?auto_275685 ) ) ( not ( = ?auto_275683 ?auto_275686 ) ) ( not ( = ?auto_275683 ?auto_275687 ) ) ( not ( = ?auto_275683 ?auto_275688 ) ) ( not ( = ?auto_275684 ?auto_275685 ) ) ( not ( = ?auto_275684 ?auto_275686 ) ) ( not ( = ?auto_275684 ?auto_275687 ) ) ( not ( = ?auto_275684 ?auto_275688 ) ) ( not ( = ?auto_275685 ?auto_275686 ) ) ( not ( = ?auto_275685 ?auto_275687 ) ) ( not ( = ?auto_275685 ?auto_275688 ) ) ( not ( = ?auto_275686 ?auto_275687 ) ) ( not ( = ?auto_275686 ?auto_275688 ) ) ( not ( = ?auto_275687 ?auto_275688 ) ) ( ON ?auto_275686 ?auto_275687 ) ( ON ?auto_275685 ?auto_275686 ) ( ON ?auto_275684 ?auto_275685 ) ( CLEAR ?auto_275682 ) ( ON ?auto_275683 ?auto_275684 ) ( CLEAR ?auto_275683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_275680 ?auto_275681 ?auto_275682 ?auto_275683 )
      ( MAKE-8PILE ?auto_275680 ?auto_275681 ?auto_275682 ?auto_275683 ?auto_275684 ?auto_275685 ?auto_275686 ?auto_275687 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_275714 - BLOCK
      ?auto_275715 - BLOCK
      ?auto_275716 - BLOCK
      ?auto_275717 - BLOCK
      ?auto_275718 - BLOCK
      ?auto_275719 - BLOCK
      ?auto_275720 - BLOCK
      ?auto_275721 - BLOCK
    )
    :vars
    (
      ?auto_275722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275721 ?auto_275722 ) ( ON-TABLE ?auto_275714 ) ( ON ?auto_275715 ?auto_275714 ) ( not ( = ?auto_275714 ?auto_275715 ) ) ( not ( = ?auto_275714 ?auto_275716 ) ) ( not ( = ?auto_275714 ?auto_275717 ) ) ( not ( = ?auto_275714 ?auto_275718 ) ) ( not ( = ?auto_275714 ?auto_275719 ) ) ( not ( = ?auto_275714 ?auto_275720 ) ) ( not ( = ?auto_275714 ?auto_275721 ) ) ( not ( = ?auto_275714 ?auto_275722 ) ) ( not ( = ?auto_275715 ?auto_275716 ) ) ( not ( = ?auto_275715 ?auto_275717 ) ) ( not ( = ?auto_275715 ?auto_275718 ) ) ( not ( = ?auto_275715 ?auto_275719 ) ) ( not ( = ?auto_275715 ?auto_275720 ) ) ( not ( = ?auto_275715 ?auto_275721 ) ) ( not ( = ?auto_275715 ?auto_275722 ) ) ( not ( = ?auto_275716 ?auto_275717 ) ) ( not ( = ?auto_275716 ?auto_275718 ) ) ( not ( = ?auto_275716 ?auto_275719 ) ) ( not ( = ?auto_275716 ?auto_275720 ) ) ( not ( = ?auto_275716 ?auto_275721 ) ) ( not ( = ?auto_275716 ?auto_275722 ) ) ( not ( = ?auto_275717 ?auto_275718 ) ) ( not ( = ?auto_275717 ?auto_275719 ) ) ( not ( = ?auto_275717 ?auto_275720 ) ) ( not ( = ?auto_275717 ?auto_275721 ) ) ( not ( = ?auto_275717 ?auto_275722 ) ) ( not ( = ?auto_275718 ?auto_275719 ) ) ( not ( = ?auto_275718 ?auto_275720 ) ) ( not ( = ?auto_275718 ?auto_275721 ) ) ( not ( = ?auto_275718 ?auto_275722 ) ) ( not ( = ?auto_275719 ?auto_275720 ) ) ( not ( = ?auto_275719 ?auto_275721 ) ) ( not ( = ?auto_275719 ?auto_275722 ) ) ( not ( = ?auto_275720 ?auto_275721 ) ) ( not ( = ?auto_275720 ?auto_275722 ) ) ( not ( = ?auto_275721 ?auto_275722 ) ) ( ON ?auto_275720 ?auto_275721 ) ( ON ?auto_275719 ?auto_275720 ) ( ON ?auto_275718 ?auto_275719 ) ( ON ?auto_275717 ?auto_275718 ) ( CLEAR ?auto_275715 ) ( ON ?auto_275716 ?auto_275717 ) ( CLEAR ?auto_275716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_275714 ?auto_275715 ?auto_275716 )
      ( MAKE-8PILE ?auto_275714 ?auto_275715 ?auto_275716 ?auto_275717 ?auto_275718 ?auto_275719 ?auto_275720 ?auto_275721 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_275748 - BLOCK
      ?auto_275749 - BLOCK
      ?auto_275750 - BLOCK
      ?auto_275751 - BLOCK
      ?auto_275752 - BLOCK
      ?auto_275753 - BLOCK
      ?auto_275754 - BLOCK
      ?auto_275755 - BLOCK
    )
    :vars
    (
      ?auto_275756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275755 ?auto_275756 ) ( ON-TABLE ?auto_275748 ) ( not ( = ?auto_275748 ?auto_275749 ) ) ( not ( = ?auto_275748 ?auto_275750 ) ) ( not ( = ?auto_275748 ?auto_275751 ) ) ( not ( = ?auto_275748 ?auto_275752 ) ) ( not ( = ?auto_275748 ?auto_275753 ) ) ( not ( = ?auto_275748 ?auto_275754 ) ) ( not ( = ?auto_275748 ?auto_275755 ) ) ( not ( = ?auto_275748 ?auto_275756 ) ) ( not ( = ?auto_275749 ?auto_275750 ) ) ( not ( = ?auto_275749 ?auto_275751 ) ) ( not ( = ?auto_275749 ?auto_275752 ) ) ( not ( = ?auto_275749 ?auto_275753 ) ) ( not ( = ?auto_275749 ?auto_275754 ) ) ( not ( = ?auto_275749 ?auto_275755 ) ) ( not ( = ?auto_275749 ?auto_275756 ) ) ( not ( = ?auto_275750 ?auto_275751 ) ) ( not ( = ?auto_275750 ?auto_275752 ) ) ( not ( = ?auto_275750 ?auto_275753 ) ) ( not ( = ?auto_275750 ?auto_275754 ) ) ( not ( = ?auto_275750 ?auto_275755 ) ) ( not ( = ?auto_275750 ?auto_275756 ) ) ( not ( = ?auto_275751 ?auto_275752 ) ) ( not ( = ?auto_275751 ?auto_275753 ) ) ( not ( = ?auto_275751 ?auto_275754 ) ) ( not ( = ?auto_275751 ?auto_275755 ) ) ( not ( = ?auto_275751 ?auto_275756 ) ) ( not ( = ?auto_275752 ?auto_275753 ) ) ( not ( = ?auto_275752 ?auto_275754 ) ) ( not ( = ?auto_275752 ?auto_275755 ) ) ( not ( = ?auto_275752 ?auto_275756 ) ) ( not ( = ?auto_275753 ?auto_275754 ) ) ( not ( = ?auto_275753 ?auto_275755 ) ) ( not ( = ?auto_275753 ?auto_275756 ) ) ( not ( = ?auto_275754 ?auto_275755 ) ) ( not ( = ?auto_275754 ?auto_275756 ) ) ( not ( = ?auto_275755 ?auto_275756 ) ) ( ON ?auto_275754 ?auto_275755 ) ( ON ?auto_275753 ?auto_275754 ) ( ON ?auto_275752 ?auto_275753 ) ( ON ?auto_275751 ?auto_275752 ) ( ON ?auto_275750 ?auto_275751 ) ( CLEAR ?auto_275748 ) ( ON ?auto_275749 ?auto_275750 ) ( CLEAR ?auto_275749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_275748 ?auto_275749 )
      ( MAKE-8PILE ?auto_275748 ?auto_275749 ?auto_275750 ?auto_275751 ?auto_275752 ?auto_275753 ?auto_275754 ?auto_275755 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_275782 - BLOCK
      ?auto_275783 - BLOCK
      ?auto_275784 - BLOCK
      ?auto_275785 - BLOCK
      ?auto_275786 - BLOCK
      ?auto_275787 - BLOCK
      ?auto_275788 - BLOCK
      ?auto_275789 - BLOCK
    )
    :vars
    (
      ?auto_275790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275789 ?auto_275790 ) ( not ( = ?auto_275782 ?auto_275783 ) ) ( not ( = ?auto_275782 ?auto_275784 ) ) ( not ( = ?auto_275782 ?auto_275785 ) ) ( not ( = ?auto_275782 ?auto_275786 ) ) ( not ( = ?auto_275782 ?auto_275787 ) ) ( not ( = ?auto_275782 ?auto_275788 ) ) ( not ( = ?auto_275782 ?auto_275789 ) ) ( not ( = ?auto_275782 ?auto_275790 ) ) ( not ( = ?auto_275783 ?auto_275784 ) ) ( not ( = ?auto_275783 ?auto_275785 ) ) ( not ( = ?auto_275783 ?auto_275786 ) ) ( not ( = ?auto_275783 ?auto_275787 ) ) ( not ( = ?auto_275783 ?auto_275788 ) ) ( not ( = ?auto_275783 ?auto_275789 ) ) ( not ( = ?auto_275783 ?auto_275790 ) ) ( not ( = ?auto_275784 ?auto_275785 ) ) ( not ( = ?auto_275784 ?auto_275786 ) ) ( not ( = ?auto_275784 ?auto_275787 ) ) ( not ( = ?auto_275784 ?auto_275788 ) ) ( not ( = ?auto_275784 ?auto_275789 ) ) ( not ( = ?auto_275784 ?auto_275790 ) ) ( not ( = ?auto_275785 ?auto_275786 ) ) ( not ( = ?auto_275785 ?auto_275787 ) ) ( not ( = ?auto_275785 ?auto_275788 ) ) ( not ( = ?auto_275785 ?auto_275789 ) ) ( not ( = ?auto_275785 ?auto_275790 ) ) ( not ( = ?auto_275786 ?auto_275787 ) ) ( not ( = ?auto_275786 ?auto_275788 ) ) ( not ( = ?auto_275786 ?auto_275789 ) ) ( not ( = ?auto_275786 ?auto_275790 ) ) ( not ( = ?auto_275787 ?auto_275788 ) ) ( not ( = ?auto_275787 ?auto_275789 ) ) ( not ( = ?auto_275787 ?auto_275790 ) ) ( not ( = ?auto_275788 ?auto_275789 ) ) ( not ( = ?auto_275788 ?auto_275790 ) ) ( not ( = ?auto_275789 ?auto_275790 ) ) ( ON ?auto_275788 ?auto_275789 ) ( ON ?auto_275787 ?auto_275788 ) ( ON ?auto_275786 ?auto_275787 ) ( ON ?auto_275785 ?auto_275786 ) ( ON ?auto_275784 ?auto_275785 ) ( ON ?auto_275783 ?auto_275784 ) ( ON ?auto_275782 ?auto_275783 ) ( CLEAR ?auto_275782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_275782 )
      ( MAKE-8PILE ?auto_275782 ?auto_275783 ?auto_275784 ?auto_275785 ?auto_275786 ?auto_275787 ?auto_275788 ?auto_275789 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_275817 - BLOCK
      ?auto_275818 - BLOCK
      ?auto_275819 - BLOCK
      ?auto_275820 - BLOCK
      ?auto_275821 - BLOCK
      ?auto_275822 - BLOCK
      ?auto_275823 - BLOCK
      ?auto_275824 - BLOCK
      ?auto_275825 - BLOCK
    )
    :vars
    (
      ?auto_275826 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_275824 ) ( ON ?auto_275825 ?auto_275826 ) ( CLEAR ?auto_275825 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_275817 ) ( ON ?auto_275818 ?auto_275817 ) ( ON ?auto_275819 ?auto_275818 ) ( ON ?auto_275820 ?auto_275819 ) ( ON ?auto_275821 ?auto_275820 ) ( ON ?auto_275822 ?auto_275821 ) ( ON ?auto_275823 ?auto_275822 ) ( ON ?auto_275824 ?auto_275823 ) ( not ( = ?auto_275817 ?auto_275818 ) ) ( not ( = ?auto_275817 ?auto_275819 ) ) ( not ( = ?auto_275817 ?auto_275820 ) ) ( not ( = ?auto_275817 ?auto_275821 ) ) ( not ( = ?auto_275817 ?auto_275822 ) ) ( not ( = ?auto_275817 ?auto_275823 ) ) ( not ( = ?auto_275817 ?auto_275824 ) ) ( not ( = ?auto_275817 ?auto_275825 ) ) ( not ( = ?auto_275817 ?auto_275826 ) ) ( not ( = ?auto_275818 ?auto_275819 ) ) ( not ( = ?auto_275818 ?auto_275820 ) ) ( not ( = ?auto_275818 ?auto_275821 ) ) ( not ( = ?auto_275818 ?auto_275822 ) ) ( not ( = ?auto_275818 ?auto_275823 ) ) ( not ( = ?auto_275818 ?auto_275824 ) ) ( not ( = ?auto_275818 ?auto_275825 ) ) ( not ( = ?auto_275818 ?auto_275826 ) ) ( not ( = ?auto_275819 ?auto_275820 ) ) ( not ( = ?auto_275819 ?auto_275821 ) ) ( not ( = ?auto_275819 ?auto_275822 ) ) ( not ( = ?auto_275819 ?auto_275823 ) ) ( not ( = ?auto_275819 ?auto_275824 ) ) ( not ( = ?auto_275819 ?auto_275825 ) ) ( not ( = ?auto_275819 ?auto_275826 ) ) ( not ( = ?auto_275820 ?auto_275821 ) ) ( not ( = ?auto_275820 ?auto_275822 ) ) ( not ( = ?auto_275820 ?auto_275823 ) ) ( not ( = ?auto_275820 ?auto_275824 ) ) ( not ( = ?auto_275820 ?auto_275825 ) ) ( not ( = ?auto_275820 ?auto_275826 ) ) ( not ( = ?auto_275821 ?auto_275822 ) ) ( not ( = ?auto_275821 ?auto_275823 ) ) ( not ( = ?auto_275821 ?auto_275824 ) ) ( not ( = ?auto_275821 ?auto_275825 ) ) ( not ( = ?auto_275821 ?auto_275826 ) ) ( not ( = ?auto_275822 ?auto_275823 ) ) ( not ( = ?auto_275822 ?auto_275824 ) ) ( not ( = ?auto_275822 ?auto_275825 ) ) ( not ( = ?auto_275822 ?auto_275826 ) ) ( not ( = ?auto_275823 ?auto_275824 ) ) ( not ( = ?auto_275823 ?auto_275825 ) ) ( not ( = ?auto_275823 ?auto_275826 ) ) ( not ( = ?auto_275824 ?auto_275825 ) ) ( not ( = ?auto_275824 ?auto_275826 ) ) ( not ( = ?auto_275825 ?auto_275826 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_275825 ?auto_275826 )
      ( !STACK ?auto_275825 ?auto_275824 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_275855 - BLOCK
      ?auto_275856 - BLOCK
      ?auto_275857 - BLOCK
      ?auto_275858 - BLOCK
      ?auto_275859 - BLOCK
      ?auto_275860 - BLOCK
      ?auto_275861 - BLOCK
      ?auto_275862 - BLOCK
      ?auto_275863 - BLOCK
    )
    :vars
    (
      ?auto_275864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275863 ?auto_275864 ) ( ON-TABLE ?auto_275855 ) ( ON ?auto_275856 ?auto_275855 ) ( ON ?auto_275857 ?auto_275856 ) ( ON ?auto_275858 ?auto_275857 ) ( ON ?auto_275859 ?auto_275858 ) ( ON ?auto_275860 ?auto_275859 ) ( ON ?auto_275861 ?auto_275860 ) ( not ( = ?auto_275855 ?auto_275856 ) ) ( not ( = ?auto_275855 ?auto_275857 ) ) ( not ( = ?auto_275855 ?auto_275858 ) ) ( not ( = ?auto_275855 ?auto_275859 ) ) ( not ( = ?auto_275855 ?auto_275860 ) ) ( not ( = ?auto_275855 ?auto_275861 ) ) ( not ( = ?auto_275855 ?auto_275862 ) ) ( not ( = ?auto_275855 ?auto_275863 ) ) ( not ( = ?auto_275855 ?auto_275864 ) ) ( not ( = ?auto_275856 ?auto_275857 ) ) ( not ( = ?auto_275856 ?auto_275858 ) ) ( not ( = ?auto_275856 ?auto_275859 ) ) ( not ( = ?auto_275856 ?auto_275860 ) ) ( not ( = ?auto_275856 ?auto_275861 ) ) ( not ( = ?auto_275856 ?auto_275862 ) ) ( not ( = ?auto_275856 ?auto_275863 ) ) ( not ( = ?auto_275856 ?auto_275864 ) ) ( not ( = ?auto_275857 ?auto_275858 ) ) ( not ( = ?auto_275857 ?auto_275859 ) ) ( not ( = ?auto_275857 ?auto_275860 ) ) ( not ( = ?auto_275857 ?auto_275861 ) ) ( not ( = ?auto_275857 ?auto_275862 ) ) ( not ( = ?auto_275857 ?auto_275863 ) ) ( not ( = ?auto_275857 ?auto_275864 ) ) ( not ( = ?auto_275858 ?auto_275859 ) ) ( not ( = ?auto_275858 ?auto_275860 ) ) ( not ( = ?auto_275858 ?auto_275861 ) ) ( not ( = ?auto_275858 ?auto_275862 ) ) ( not ( = ?auto_275858 ?auto_275863 ) ) ( not ( = ?auto_275858 ?auto_275864 ) ) ( not ( = ?auto_275859 ?auto_275860 ) ) ( not ( = ?auto_275859 ?auto_275861 ) ) ( not ( = ?auto_275859 ?auto_275862 ) ) ( not ( = ?auto_275859 ?auto_275863 ) ) ( not ( = ?auto_275859 ?auto_275864 ) ) ( not ( = ?auto_275860 ?auto_275861 ) ) ( not ( = ?auto_275860 ?auto_275862 ) ) ( not ( = ?auto_275860 ?auto_275863 ) ) ( not ( = ?auto_275860 ?auto_275864 ) ) ( not ( = ?auto_275861 ?auto_275862 ) ) ( not ( = ?auto_275861 ?auto_275863 ) ) ( not ( = ?auto_275861 ?auto_275864 ) ) ( not ( = ?auto_275862 ?auto_275863 ) ) ( not ( = ?auto_275862 ?auto_275864 ) ) ( not ( = ?auto_275863 ?auto_275864 ) ) ( CLEAR ?auto_275861 ) ( ON ?auto_275862 ?auto_275863 ) ( CLEAR ?auto_275862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_275855 ?auto_275856 ?auto_275857 ?auto_275858 ?auto_275859 ?auto_275860 ?auto_275861 ?auto_275862 )
      ( MAKE-9PILE ?auto_275855 ?auto_275856 ?auto_275857 ?auto_275858 ?auto_275859 ?auto_275860 ?auto_275861 ?auto_275862 ?auto_275863 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_275893 - BLOCK
      ?auto_275894 - BLOCK
      ?auto_275895 - BLOCK
      ?auto_275896 - BLOCK
      ?auto_275897 - BLOCK
      ?auto_275898 - BLOCK
      ?auto_275899 - BLOCK
      ?auto_275900 - BLOCK
      ?auto_275901 - BLOCK
    )
    :vars
    (
      ?auto_275902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275901 ?auto_275902 ) ( ON-TABLE ?auto_275893 ) ( ON ?auto_275894 ?auto_275893 ) ( ON ?auto_275895 ?auto_275894 ) ( ON ?auto_275896 ?auto_275895 ) ( ON ?auto_275897 ?auto_275896 ) ( ON ?auto_275898 ?auto_275897 ) ( not ( = ?auto_275893 ?auto_275894 ) ) ( not ( = ?auto_275893 ?auto_275895 ) ) ( not ( = ?auto_275893 ?auto_275896 ) ) ( not ( = ?auto_275893 ?auto_275897 ) ) ( not ( = ?auto_275893 ?auto_275898 ) ) ( not ( = ?auto_275893 ?auto_275899 ) ) ( not ( = ?auto_275893 ?auto_275900 ) ) ( not ( = ?auto_275893 ?auto_275901 ) ) ( not ( = ?auto_275893 ?auto_275902 ) ) ( not ( = ?auto_275894 ?auto_275895 ) ) ( not ( = ?auto_275894 ?auto_275896 ) ) ( not ( = ?auto_275894 ?auto_275897 ) ) ( not ( = ?auto_275894 ?auto_275898 ) ) ( not ( = ?auto_275894 ?auto_275899 ) ) ( not ( = ?auto_275894 ?auto_275900 ) ) ( not ( = ?auto_275894 ?auto_275901 ) ) ( not ( = ?auto_275894 ?auto_275902 ) ) ( not ( = ?auto_275895 ?auto_275896 ) ) ( not ( = ?auto_275895 ?auto_275897 ) ) ( not ( = ?auto_275895 ?auto_275898 ) ) ( not ( = ?auto_275895 ?auto_275899 ) ) ( not ( = ?auto_275895 ?auto_275900 ) ) ( not ( = ?auto_275895 ?auto_275901 ) ) ( not ( = ?auto_275895 ?auto_275902 ) ) ( not ( = ?auto_275896 ?auto_275897 ) ) ( not ( = ?auto_275896 ?auto_275898 ) ) ( not ( = ?auto_275896 ?auto_275899 ) ) ( not ( = ?auto_275896 ?auto_275900 ) ) ( not ( = ?auto_275896 ?auto_275901 ) ) ( not ( = ?auto_275896 ?auto_275902 ) ) ( not ( = ?auto_275897 ?auto_275898 ) ) ( not ( = ?auto_275897 ?auto_275899 ) ) ( not ( = ?auto_275897 ?auto_275900 ) ) ( not ( = ?auto_275897 ?auto_275901 ) ) ( not ( = ?auto_275897 ?auto_275902 ) ) ( not ( = ?auto_275898 ?auto_275899 ) ) ( not ( = ?auto_275898 ?auto_275900 ) ) ( not ( = ?auto_275898 ?auto_275901 ) ) ( not ( = ?auto_275898 ?auto_275902 ) ) ( not ( = ?auto_275899 ?auto_275900 ) ) ( not ( = ?auto_275899 ?auto_275901 ) ) ( not ( = ?auto_275899 ?auto_275902 ) ) ( not ( = ?auto_275900 ?auto_275901 ) ) ( not ( = ?auto_275900 ?auto_275902 ) ) ( not ( = ?auto_275901 ?auto_275902 ) ) ( ON ?auto_275900 ?auto_275901 ) ( CLEAR ?auto_275898 ) ( ON ?auto_275899 ?auto_275900 ) ( CLEAR ?auto_275899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_275893 ?auto_275894 ?auto_275895 ?auto_275896 ?auto_275897 ?auto_275898 ?auto_275899 )
      ( MAKE-9PILE ?auto_275893 ?auto_275894 ?auto_275895 ?auto_275896 ?auto_275897 ?auto_275898 ?auto_275899 ?auto_275900 ?auto_275901 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_275931 - BLOCK
      ?auto_275932 - BLOCK
      ?auto_275933 - BLOCK
      ?auto_275934 - BLOCK
      ?auto_275935 - BLOCK
      ?auto_275936 - BLOCK
      ?auto_275937 - BLOCK
      ?auto_275938 - BLOCK
      ?auto_275939 - BLOCK
    )
    :vars
    (
      ?auto_275940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275939 ?auto_275940 ) ( ON-TABLE ?auto_275931 ) ( ON ?auto_275932 ?auto_275931 ) ( ON ?auto_275933 ?auto_275932 ) ( ON ?auto_275934 ?auto_275933 ) ( ON ?auto_275935 ?auto_275934 ) ( not ( = ?auto_275931 ?auto_275932 ) ) ( not ( = ?auto_275931 ?auto_275933 ) ) ( not ( = ?auto_275931 ?auto_275934 ) ) ( not ( = ?auto_275931 ?auto_275935 ) ) ( not ( = ?auto_275931 ?auto_275936 ) ) ( not ( = ?auto_275931 ?auto_275937 ) ) ( not ( = ?auto_275931 ?auto_275938 ) ) ( not ( = ?auto_275931 ?auto_275939 ) ) ( not ( = ?auto_275931 ?auto_275940 ) ) ( not ( = ?auto_275932 ?auto_275933 ) ) ( not ( = ?auto_275932 ?auto_275934 ) ) ( not ( = ?auto_275932 ?auto_275935 ) ) ( not ( = ?auto_275932 ?auto_275936 ) ) ( not ( = ?auto_275932 ?auto_275937 ) ) ( not ( = ?auto_275932 ?auto_275938 ) ) ( not ( = ?auto_275932 ?auto_275939 ) ) ( not ( = ?auto_275932 ?auto_275940 ) ) ( not ( = ?auto_275933 ?auto_275934 ) ) ( not ( = ?auto_275933 ?auto_275935 ) ) ( not ( = ?auto_275933 ?auto_275936 ) ) ( not ( = ?auto_275933 ?auto_275937 ) ) ( not ( = ?auto_275933 ?auto_275938 ) ) ( not ( = ?auto_275933 ?auto_275939 ) ) ( not ( = ?auto_275933 ?auto_275940 ) ) ( not ( = ?auto_275934 ?auto_275935 ) ) ( not ( = ?auto_275934 ?auto_275936 ) ) ( not ( = ?auto_275934 ?auto_275937 ) ) ( not ( = ?auto_275934 ?auto_275938 ) ) ( not ( = ?auto_275934 ?auto_275939 ) ) ( not ( = ?auto_275934 ?auto_275940 ) ) ( not ( = ?auto_275935 ?auto_275936 ) ) ( not ( = ?auto_275935 ?auto_275937 ) ) ( not ( = ?auto_275935 ?auto_275938 ) ) ( not ( = ?auto_275935 ?auto_275939 ) ) ( not ( = ?auto_275935 ?auto_275940 ) ) ( not ( = ?auto_275936 ?auto_275937 ) ) ( not ( = ?auto_275936 ?auto_275938 ) ) ( not ( = ?auto_275936 ?auto_275939 ) ) ( not ( = ?auto_275936 ?auto_275940 ) ) ( not ( = ?auto_275937 ?auto_275938 ) ) ( not ( = ?auto_275937 ?auto_275939 ) ) ( not ( = ?auto_275937 ?auto_275940 ) ) ( not ( = ?auto_275938 ?auto_275939 ) ) ( not ( = ?auto_275938 ?auto_275940 ) ) ( not ( = ?auto_275939 ?auto_275940 ) ) ( ON ?auto_275938 ?auto_275939 ) ( ON ?auto_275937 ?auto_275938 ) ( CLEAR ?auto_275935 ) ( ON ?auto_275936 ?auto_275937 ) ( CLEAR ?auto_275936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_275931 ?auto_275932 ?auto_275933 ?auto_275934 ?auto_275935 ?auto_275936 )
      ( MAKE-9PILE ?auto_275931 ?auto_275932 ?auto_275933 ?auto_275934 ?auto_275935 ?auto_275936 ?auto_275937 ?auto_275938 ?auto_275939 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_275969 - BLOCK
      ?auto_275970 - BLOCK
      ?auto_275971 - BLOCK
      ?auto_275972 - BLOCK
      ?auto_275973 - BLOCK
      ?auto_275974 - BLOCK
      ?auto_275975 - BLOCK
      ?auto_275976 - BLOCK
      ?auto_275977 - BLOCK
    )
    :vars
    (
      ?auto_275978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_275977 ?auto_275978 ) ( ON-TABLE ?auto_275969 ) ( ON ?auto_275970 ?auto_275969 ) ( ON ?auto_275971 ?auto_275970 ) ( ON ?auto_275972 ?auto_275971 ) ( not ( = ?auto_275969 ?auto_275970 ) ) ( not ( = ?auto_275969 ?auto_275971 ) ) ( not ( = ?auto_275969 ?auto_275972 ) ) ( not ( = ?auto_275969 ?auto_275973 ) ) ( not ( = ?auto_275969 ?auto_275974 ) ) ( not ( = ?auto_275969 ?auto_275975 ) ) ( not ( = ?auto_275969 ?auto_275976 ) ) ( not ( = ?auto_275969 ?auto_275977 ) ) ( not ( = ?auto_275969 ?auto_275978 ) ) ( not ( = ?auto_275970 ?auto_275971 ) ) ( not ( = ?auto_275970 ?auto_275972 ) ) ( not ( = ?auto_275970 ?auto_275973 ) ) ( not ( = ?auto_275970 ?auto_275974 ) ) ( not ( = ?auto_275970 ?auto_275975 ) ) ( not ( = ?auto_275970 ?auto_275976 ) ) ( not ( = ?auto_275970 ?auto_275977 ) ) ( not ( = ?auto_275970 ?auto_275978 ) ) ( not ( = ?auto_275971 ?auto_275972 ) ) ( not ( = ?auto_275971 ?auto_275973 ) ) ( not ( = ?auto_275971 ?auto_275974 ) ) ( not ( = ?auto_275971 ?auto_275975 ) ) ( not ( = ?auto_275971 ?auto_275976 ) ) ( not ( = ?auto_275971 ?auto_275977 ) ) ( not ( = ?auto_275971 ?auto_275978 ) ) ( not ( = ?auto_275972 ?auto_275973 ) ) ( not ( = ?auto_275972 ?auto_275974 ) ) ( not ( = ?auto_275972 ?auto_275975 ) ) ( not ( = ?auto_275972 ?auto_275976 ) ) ( not ( = ?auto_275972 ?auto_275977 ) ) ( not ( = ?auto_275972 ?auto_275978 ) ) ( not ( = ?auto_275973 ?auto_275974 ) ) ( not ( = ?auto_275973 ?auto_275975 ) ) ( not ( = ?auto_275973 ?auto_275976 ) ) ( not ( = ?auto_275973 ?auto_275977 ) ) ( not ( = ?auto_275973 ?auto_275978 ) ) ( not ( = ?auto_275974 ?auto_275975 ) ) ( not ( = ?auto_275974 ?auto_275976 ) ) ( not ( = ?auto_275974 ?auto_275977 ) ) ( not ( = ?auto_275974 ?auto_275978 ) ) ( not ( = ?auto_275975 ?auto_275976 ) ) ( not ( = ?auto_275975 ?auto_275977 ) ) ( not ( = ?auto_275975 ?auto_275978 ) ) ( not ( = ?auto_275976 ?auto_275977 ) ) ( not ( = ?auto_275976 ?auto_275978 ) ) ( not ( = ?auto_275977 ?auto_275978 ) ) ( ON ?auto_275976 ?auto_275977 ) ( ON ?auto_275975 ?auto_275976 ) ( ON ?auto_275974 ?auto_275975 ) ( CLEAR ?auto_275972 ) ( ON ?auto_275973 ?auto_275974 ) ( CLEAR ?auto_275973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_275969 ?auto_275970 ?auto_275971 ?auto_275972 ?auto_275973 )
      ( MAKE-9PILE ?auto_275969 ?auto_275970 ?auto_275971 ?auto_275972 ?auto_275973 ?auto_275974 ?auto_275975 ?auto_275976 ?auto_275977 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_276007 - BLOCK
      ?auto_276008 - BLOCK
      ?auto_276009 - BLOCK
      ?auto_276010 - BLOCK
      ?auto_276011 - BLOCK
      ?auto_276012 - BLOCK
      ?auto_276013 - BLOCK
      ?auto_276014 - BLOCK
      ?auto_276015 - BLOCK
    )
    :vars
    (
      ?auto_276016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_276015 ?auto_276016 ) ( ON-TABLE ?auto_276007 ) ( ON ?auto_276008 ?auto_276007 ) ( ON ?auto_276009 ?auto_276008 ) ( not ( = ?auto_276007 ?auto_276008 ) ) ( not ( = ?auto_276007 ?auto_276009 ) ) ( not ( = ?auto_276007 ?auto_276010 ) ) ( not ( = ?auto_276007 ?auto_276011 ) ) ( not ( = ?auto_276007 ?auto_276012 ) ) ( not ( = ?auto_276007 ?auto_276013 ) ) ( not ( = ?auto_276007 ?auto_276014 ) ) ( not ( = ?auto_276007 ?auto_276015 ) ) ( not ( = ?auto_276007 ?auto_276016 ) ) ( not ( = ?auto_276008 ?auto_276009 ) ) ( not ( = ?auto_276008 ?auto_276010 ) ) ( not ( = ?auto_276008 ?auto_276011 ) ) ( not ( = ?auto_276008 ?auto_276012 ) ) ( not ( = ?auto_276008 ?auto_276013 ) ) ( not ( = ?auto_276008 ?auto_276014 ) ) ( not ( = ?auto_276008 ?auto_276015 ) ) ( not ( = ?auto_276008 ?auto_276016 ) ) ( not ( = ?auto_276009 ?auto_276010 ) ) ( not ( = ?auto_276009 ?auto_276011 ) ) ( not ( = ?auto_276009 ?auto_276012 ) ) ( not ( = ?auto_276009 ?auto_276013 ) ) ( not ( = ?auto_276009 ?auto_276014 ) ) ( not ( = ?auto_276009 ?auto_276015 ) ) ( not ( = ?auto_276009 ?auto_276016 ) ) ( not ( = ?auto_276010 ?auto_276011 ) ) ( not ( = ?auto_276010 ?auto_276012 ) ) ( not ( = ?auto_276010 ?auto_276013 ) ) ( not ( = ?auto_276010 ?auto_276014 ) ) ( not ( = ?auto_276010 ?auto_276015 ) ) ( not ( = ?auto_276010 ?auto_276016 ) ) ( not ( = ?auto_276011 ?auto_276012 ) ) ( not ( = ?auto_276011 ?auto_276013 ) ) ( not ( = ?auto_276011 ?auto_276014 ) ) ( not ( = ?auto_276011 ?auto_276015 ) ) ( not ( = ?auto_276011 ?auto_276016 ) ) ( not ( = ?auto_276012 ?auto_276013 ) ) ( not ( = ?auto_276012 ?auto_276014 ) ) ( not ( = ?auto_276012 ?auto_276015 ) ) ( not ( = ?auto_276012 ?auto_276016 ) ) ( not ( = ?auto_276013 ?auto_276014 ) ) ( not ( = ?auto_276013 ?auto_276015 ) ) ( not ( = ?auto_276013 ?auto_276016 ) ) ( not ( = ?auto_276014 ?auto_276015 ) ) ( not ( = ?auto_276014 ?auto_276016 ) ) ( not ( = ?auto_276015 ?auto_276016 ) ) ( ON ?auto_276014 ?auto_276015 ) ( ON ?auto_276013 ?auto_276014 ) ( ON ?auto_276012 ?auto_276013 ) ( ON ?auto_276011 ?auto_276012 ) ( CLEAR ?auto_276009 ) ( ON ?auto_276010 ?auto_276011 ) ( CLEAR ?auto_276010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_276007 ?auto_276008 ?auto_276009 ?auto_276010 )
      ( MAKE-9PILE ?auto_276007 ?auto_276008 ?auto_276009 ?auto_276010 ?auto_276011 ?auto_276012 ?auto_276013 ?auto_276014 ?auto_276015 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_276045 - BLOCK
      ?auto_276046 - BLOCK
      ?auto_276047 - BLOCK
      ?auto_276048 - BLOCK
      ?auto_276049 - BLOCK
      ?auto_276050 - BLOCK
      ?auto_276051 - BLOCK
      ?auto_276052 - BLOCK
      ?auto_276053 - BLOCK
    )
    :vars
    (
      ?auto_276054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_276053 ?auto_276054 ) ( ON-TABLE ?auto_276045 ) ( ON ?auto_276046 ?auto_276045 ) ( not ( = ?auto_276045 ?auto_276046 ) ) ( not ( = ?auto_276045 ?auto_276047 ) ) ( not ( = ?auto_276045 ?auto_276048 ) ) ( not ( = ?auto_276045 ?auto_276049 ) ) ( not ( = ?auto_276045 ?auto_276050 ) ) ( not ( = ?auto_276045 ?auto_276051 ) ) ( not ( = ?auto_276045 ?auto_276052 ) ) ( not ( = ?auto_276045 ?auto_276053 ) ) ( not ( = ?auto_276045 ?auto_276054 ) ) ( not ( = ?auto_276046 ?auto_276047 ) ) ( not ( = ?auto_276046 ?auto_276048 ) ) ( not ( = ?auto_276046 ?auto_276049 ) ) ( not ( = ?auto_276046 ?auto_276050 ) ) ( not ( = ?auto_276046 ?auto_276051 ) ) ( not ( = ?auto_276046 ?auto_276052 ) ) ( not ( = ?auto_276046 ?auto_276053 ) ) ( not ( = ?auto_276046 ?auto_276054 ) ) ( not ( = ?auto_276047 ?auto_276048 ) ) ( not ( = ?auto_276047 ?auto_276049 ) ) ( not ( = ?auto_276047 ?auto_276050 ) ) ( not ( = ?auto_276047 ?auto_276051 ) ) ( not ( = ?auto_276047 ?auto_276052 ) ) ( not ( = ?auto_276047 ?auto_276053 ) ) ( not ( = ?auto_276047 ?auto_276054 ) ) ( not ( = ?auto_276048 ?auto_276049 ) ) ( not ( = ?auto_276048 ?auto_276050 ) ) ( not ( = ?auto_276048 ?auto_276051 ) ) ( not ( = ?auto_276048 ?auto_276052 ) ) ( not ( = ?auto_276048 ?auto_276053 ) ) ( not ( = ?auto_276048 ?auto_276054 ) ) ( not ( = ?auto_276049 ?auto_276050 ) ) ( not ( = ?auto_276049 ?auto_276051 ) ) ( not ( = ?auto_276049 ?auto_276052 ) ) ( not ( = ?auto_276049 ?auto_276053 ) ) ( not ( = ?auto_276049 ?auto_276054 ) ) ( not ( = ?auto_276050 ?auto_276051 ) ) ( not ( = ?auto_276050 ?auto_276052 ) ) ( not ( = ?auto_276050 ?auto_276053 ) ) ( not ( = ?auto_276050 ?auto_276054 ) ) ( not ( = ?auto_276051 ?auto_276052 ) ) ( not ( = ?auto_276051 ?auto_276053 ) ) ( not ( = ?auto_276051 ?auto_276054 ) ) ( not ( = ?auto_276052 ?auto_276053 ) ) ( not ( = ?auto_276052 ?auto_276054 ) ) ( not ( = ?auto_276053 ?auto_276054 ) ) ( ON ?auto_276052 ?auto_276053 ) ( ON ?auto_276051 ?auto_276052 ) ( ON ?auto_276050 ?auto_276051 ) ( ON ?auto_276049 ?auto_276050 ) ( ON ?auto_276048 ?auto_276049 ) ( CLEAR ?auto_276046 ) ( ON ?auto_276047 ?auto_276048 ) ( CLEAR ?auto_276047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_276045 ?auto_276046 ?auto_276047 )
      ( MAKE-9PILE ?auto_276045 ?auto_276046 ?auto_276047 ?auto_276048 ?auto_276049 ?auto_276050 ?auto_276051 ?auto_276052 ?auto_276053 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_276083 - BLOCK
      ?auto_276084 - BLOCK
      ?auto_276085 - BLOCK
      ?auto_276086 - BLOCK
      ?auto_276087 - BLOCK
      ?auto_276088 - BLOCK
      ?auto_276089 - BLOCK
      ?auto_276090 - BLOCK
      ?auto_276091 - BLOCK
    )
    :vars
    (
      ?auto_276092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_276091 ?auto_276092 ) ( ON-TABLE ?auto_276083 ) ( not ( = ?auto_276083 ?auto_276084 ) ) ( not ( = ?auto_276083 ?auto_276085 ) ) ( not ( = ?auto_276083 ?auto_276086 ) ) ( not ( = ?auto_276083 ?auto_276087 ) ) ( not ( = ?auto_276083 ?auto_276088 ) ) ( not ( = ?auto_276083 ?auto_276089 ) ) ( not ( = ?auto_276083 ?auto_276090 ) ) ( not ( = ?auto_276083 ?auto_276091 ) ) ( not ( = ?auto_276083 ?auto_276092 ) ) ( not ( = ?auto_276084 ?auto_276085 ) ) ( not ( = ?auto_276084 ?auto_276086 ) ) ( not ( = ?auto_276084 ?auto_276087 ) ) ( not ( = ?auto_276084 ?auto_276088 ) ) ( not ( = ?auto_276084 ?auto_276089 ) ) ( not ( = ?auto_276084 ?auto_276090 ) ) ( not ( = ?auto_276084 ?auto_276091 ) ) ( not ( = ?auto_276084 ?auto_276092 ) ) ( not ( = ?auto_276085 ?auto_276086 ) ) ( not ( = ?auto_276085 ?auto_276087 ) ) ( not ( = ?auto_276085 ?auto_276088 ) ) ( not ( = ?auto_276085 ?auto_276089 ) ) ( not ( = ?auto_276085 ?auto_276090 ) ) ( not ( = ?auto_276085 ?auto_276091 ) ) ( not ( = ?auto_276085 ?auto_276092 ) ) ( not ( = ?auto_276086 ?auto_276087 ) ) ( not ( = ?auto_276086 ?auto_276088 ) ) ( not ( = ?auto_276086 ?auto_276089 ) ) ( not ( = ?auto_276086 ?auto_276090 ) ) ( not ( = ?auto_276086 ?auto_276091 ) ) ( not ( = ?auto_276086 ?auto_276092 ) ) ( not ( = ?auto_276087 ?auto_276088 ) ) ( not ( = ?auto_276087 ?auto_276089 ) ) ( not ( = ?auto_276087 ?auto_276090 ) ) ( not ( = ?auto_276087 ?auto_276091 ) ) ( not ( = ?auto_276087 ?auto_276092 ) ) ( not ( = ?auto_276088 ?auto_276089 ) ) ( not ( = ?auto_276088 ?auto_276090 ) ) ( not ( = ?auto_276088 ?auto_276091 ) ) ( not ( = ?auto_276088 ?auto_276092 ) ) ( not ( = ?auto_276089 ?auto_276090 ) ) ( not ( = ?auto_276089 ?auto_276091 ) ) ( not ( = ?auto_276089 ?auto_276092 ) ) ( not ( = ?auto_276090 ?auto_276091 ) ) ( not ( = ?auto_276090 ?auto_276092 ) ) ( not ( = ?auto_276091 ?auto_276092 ) ) ( ON ?auto_276090 ?auto_276091 ) ( ON ?auto_276089 ?auto_276090 ) ( ON ?auto_276088 ?auto_276089 ) ( ON ?auto_276087 ?auto_276088 ) ( ON ?auto_276086 ?auto_276087 ) ( ON ?auto_276085 ?auto_276086 ) ( CLEAR ?auto_276083 ) ( ON ?auto_276084 ?auto_276085 ) ( CLEAR ?auto_276084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_276083 ?auto_276084 )
      ( MAKE-9PILE ?auto_276083 ?auto_276084 ?auto_276085 ?auto_276086 ?auto_276087 ?auto_276088 ?auto_276089 ?auto_276090 ?auto_276091 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_276121 - BLOCK
      ?auto_276122 - BLOCK
      ?auto_276123 - BLOCK
      ?auto_276124 - BLOCK
      ?auto_276125 - BLOCK
      ?auto_276126 - BLOCK
      ?auto_276127 - BLOCK
      ?auto_276128 - BLOCK
      ?auto_276129 - BLOCK
    )
    :vars
    (
      ?auto_276130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_276129 ?auto_276130 ) ( not ( = ?auto_276121 ?auto_276122 ) ) ( not ( = ?auto_276121 ?auto_276123 ) ) ( not ( = ?auto_276121 ?auto_276124 ) ) ( not ( = ?auto_276121 ?auto_276125 ) ) ( not ( = ?auto_276121 ?auto_276126 ) ) ( not ( = ?auto_276121 ?auto_276127 ) ) ( not ( = ?auto_276121 ?auto_276128 ) ) ( not ( = ?auto_276121 ?auto_276129 ) ) ( not ( = ?auto_276121 ?auto_276130 ) ) ( not ( = ?auto_276122 ?auto_276123 ) ) ( not ( = ?auto_276122 ?auto_276124 ) ) ( not ( = ?auto_276122 ?auto_276125 ) ) ( not ( = ?auto_276122 ?auto_276126 ) ) ( not ( = ?auto_276122 ?auto_276127 ) ) ( not ( = ?auto_276122 ?auto_276128 ) ) ( not ( = ?auto_276122 ?auto_276129 ) ) ( not ( = ?auto_276122 ?auto_276130 ) ) ( not ( = ?auto_276123 ?auto_276124 ) ) ( not ( = ?auto_276123 ?auto_276125 ) ) ( not ( = ?auto_276123 ?auto_276126 ) ) ( not ( = ?auto_276123 ?auto_276127 ) ) ( not ( = ?auto_276123 ?auto_276128 ) ) ( not ( = ?auto_276123 ?auto_276129 ) ) ( not ( = ?auto_276123 ?auto_276130 ) ) ( not ( = ?auto_276124 ?auto_276125 ) ) ( not ( = ?auto_276124 ?auto_276126 ) ) ( not ( = ?auto_276124 ?auto_276127 ) ) ( not ( = ?auto_276124 ?auto_276128 ) ) ( not ( = ?auto_276124 ?auto_276129 ) ) ( not ( = ?auto_276124 ?auto_276130 ) ) ( not ( = ?auto_276125 ?auto_276126 ) ) ( not ( = ?auto_276125 ?auto_276127 ) ) ( not ( = ?auto_276125 ?auto_276128 ) ) ( not ( = ?auto_276125 ?auto_276129 ) ) ( not ( = ?auto_276125 ?auto_276130 ) ) ( not ( = ?auto_276126 ?auto_276127 ) ) ( not ( = ?auto_276126 ?auto_276128 ) ) ( not ( = ?auto_276126 ?auto_276129 ) ) ( not ( = ?auto_276126 ?auto_276130 ) ) ( not ( = ?auto_276127 ?auto_276128 ) ) ( not ( = ?auto_276127 ?auto_276129 ) ) ( not ( = ?auto_276127 ?auto_276130 ) ) ( not ( = ?auto_276128 ?auto_276129 ) ) ( not ( = ?auto_276128 ?auto_276130 ) ) ( not ( = ?auto_276129 ?auto_276130 ) ) ( ON ?auto_276128 ?auto_276129 ) ( ON ?auto_276127 ?auto_276128 ) ( ON ?auto_276126 ?auto_276127 ) ( ON ?auto_276125 ?auto_276126 ) ( ON ?auto_276124 ?auto_276125 ) ( ON ?auto_276123 ?auto_276124 ) ( ON ?auto_276122 ?auto_276123 ) ( ON ?auto_276121 ?auto_276122 ) ( CLEAR ?auto_276121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_276121 )
      ( MAKE-9PILE ?auto_276121 ?auto_276122 ?auto_276123 ?auto_276124 ?auto_276125 ?auto_276126 ?auto_276127 ?auto_276128 ?auto_276129 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_276160 - BLOCK
      ?auto_276161 - BLOCK
      ?auto_276162 - BLOCK
      ?auto_276163 - BLOCK
      ?auto_276164 - BLOCK
      ?auto_276165 - BLOCK
      ?auto_276166 - BLOCK
      ?auto_276167 - BLOCK
      ?auto_276168 - BLOCK
      ?auto_276169 - BLOCK
    )
    :vars
    (
      ?auto_276170 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_276168 ) ( ON ?auto_276169 ?auto_276170 ) ( CLEAR ?auto_276169 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_276160 ) ( ON ?auto_276161 ?auto_276160 ) ( ON ?auto_276162 ?auto_276161 ) ( ON ?auto_276163 ?auto_276162 ) ( ON ?auto_276164 ?auto_276163 ) ( ON ?auto_276165 ?auto_276164 ) ( ON ?auto_276166 ?auto_276165 ) ( ON ?auto_276167 ?auto_276166 ) ( ON ?auto_276168 ?auto_276167 ) ( not ( = ?auto_276160 ?auto_276161 ) ) ( not ( = ?auto_276160 ?auto_276162 ) ) ( not ( = ?auto_276160 ?auto_276163 ) ) ( not ( = ?auto_276160 ?auto_276164 ) ) ( not ( = ?auto_276160 ?auto_276165 ) ) ( not ( = ?auto_276160 ?auto_276166 ) ) ( not ( = ?auto_276160 ?auto_276167 ) ) ( not ( = ?auto_276160 ?auto_276168 ) ) ( not ( = ?auto_276160 ?auto_276169 ) ) ( not ( = ?auto_276160 ?auto_276170 ) ) ( not ( = ?auto_276161 ?auto_276162 ) ) ( not ( = ?auto_276161 ?auto_276163 ) ) ( not ( = ?auto_276161 ?auto_276164 ) ) ( not ( = ?auto_276161 ?auto_276165 ) ) ( not ( = ?auto_276161 ?auto_276166 ) ) ( not ( = ?auto_276161 ?auto_276167 ) ) ( not ( = ?auto_276161 ?auto_276168 ) ) ( not ( = ?auto_276161 ?auto_276169 ) ) ( not ( = ?auto_276161 ?auto_276170 ) ) ( not ( = ?auto_276162 ?auto_276163 ) ) ( not ( = ?auto_276162 ?auto_276164 ) ) ( not ( = ?auto_276162 ?auto_276165 ) ) ( not ( = ?auto_276162 ?auto_276166 ) ) ( not ( = ?auto_276162 ?auto_276167 ) ) ( not ( = ?auto_276162 ?auto_276168 ) ) ( not ( = ?auto_276162 ?auto_276169 ) ) ( not ( = ?auto_276162 ?auto_276170 ) ) ( not ( = ?auto_276163 ?auto_276164 ) ) ( not ( = ?auto_276163 ?auto_276165 ) ) ( not ( = ?auto_276163 ?auto_276166 ) ) ( not ( = ?auto_276163 ?auto_276167 ) ) ( not ( = ?auto_276163 ?auto_276168 ) ) ( not ( = ?auto_276163 ?auto_276169 ) ) ( not ( = ?auto_276163 ?auto_276170 ) ) ( not ( = ?auto_276164 ?auto_276165 ) ) ( not ( = ?auto_276164 ?auto_276166 ) ) ( not ( = ?auto_276164 ?auto_276167 ) ) ( not ( = ?auto_276164 ?auto_276168 ) ) ( not ( = ?auto_276164 ?auto_276169 ) ) ( not ( = ?auto_276164 ?auto_276170 ) ) ( not ( = ?auto_276165 ?auto_276166 ) ) ( not ( = ?auto_276165 ?auto_276167 ) ) ( not ( = ?auto_276165 ?auto_276168 ) ) ( not ( = ?auto_276165 ?auto_276169 ) ) ( not ( = ?auto_276165 ?auto_276170 ) ) ( not ( = ?auto_276166 ?auto_276167 ) ) ( not ( = ?auto_276166 ?auto_276168 ) ) ( not ( = ?auto_276166 ?auto_276169 ) ) ( not ( = ?auto_276166 ?auto_276170 ) ) ( not ( = ?auto_276167 ?auto_276168 ) ) ( not ( = ?auto_276167 ?auto_276169 ) ) ( not ( = ?auto_276167 ?auto_276170 ) ) ( not ( = ?auto_276168 ?auto_276169 ) ) ( not ( = ?auto_276168 ?auto_276170 ) ) ( not ( = ?auto_276169 ?auto_276170 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_276169 ?auto_276170 )
      ( !STACK ?auto_276169 ?auto_276168 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_276202 - BLOCK
      ?auto_276203 - BLOCK
      ?auto_276204 - BLOCK
      ?auto_276205 - BLOCK
      ?auto_276206 - BLOCK
      ?auto_276207 - BLOCK
      ?auto_276208 - BLOCK
      ?auto_276209 - BLOCK
      ?auto_276210 - BLOCK
      ?auto_276211 - BLOCK
    )
    :vars
    (
      ?auto_276212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_276211 ?auto_276212 ) ( ON-TABLE ?auto_276202 ) ( ON ?auto_276203 ?auto_276202 ) ( ON ?auto_276204 ?auto_276203 ) ( ON ?auto_276205 ?auto_276204 ) ( ON ?auto_276206 ?auto_276205 ) ( ON ?auto_276207 ?auto_276206 ) ( ON ?auto_276208 ?auto_276207 ) ( ON ?auto_276209 ?auto_276208 ) ( not ( = ?auto_276202 ?auto_276203 ) ) ( not ( = ?auto_276202 ?auto_276204 ) ) ( not ( = ?auto_276202 ?auto_276205 ) ) ( not ( = ?auto_276202 ?auto_276206 ) ) ( not ( = ?auto_276202 ?auto_276207 ) ) ( not ( = ?auto_276202 ?auto_276208 ) ) ( not ( = ?auto_276202 ?auto_276209 ) ) ( not ( = ?auto_276202 ?auto_276210 ) ) ( not ( = ?auto_276202 ?auto_276211 ) ) ( not ( = ?auto_276202 ?auto_276212 ) ) ( not ( = ?auto_276203 ?auto_276204 ) ) ( not ( = ?auto_276203 ?auto_276205 ) ) ( not ( = ?auto_276203 ?auto_276206 ) ) ( not ( = ?auto_276203 ?auto_276207 ) ) ( not ( = ?auto_276203 ?auto_276208 ) ) ( not ( = ?auto_276203 ?auto_276209 ) ) ( not ( = ?auto_276203 ?auto_276210 ) ) ( not ( = ?auto_276203 ?auto_276211 ) ) ( not ( = ?auto_276203 ?auto_276212 ) ) ( not ( = ?auto_276204 ?auto_276205 ) ) ( not ( = ?auto_276204 ?auto_276206 ) ) ( not ( = ?auto_276204 ?auto_276207 ) ) ( not ( = ?auto_276204 ?auto_276208 ) ) ( not ( = ?auto_276204 ?auto_276209 ) ) ( not ( = ?auto_276204 ?auto_276210 ) ) ( not ( = ?auto_276204 ?auto_276211 ) ) ( not ( = ?auto_276204 ?auto_276212 ) ) ( not ( = ?auto_276205 ?auto_276206 ) ) ( not ( = ?auto_276205 ?auto_276207 ) ) ( not ( = ?auto_276205 ?auto_276208 ) ) ( not ( = ?auto_276205 ?auto_276209 ) ) ( not ( = ?auto_276205 ?auto_276210 ) ) ( not ( = ?auto_276205 ?auto_276211 ) ) ( not ( = ?auto_276205 ?auto_276212 ) ) ( not ( = ?auto_276206 ?auto_276207 ) ) ( not ( = ?auto_276206 ?auto_276208 ) ) ( not ( = ?auto_276206 ?auto_276209 ) ) ( not ( = ?auto_276206 ?auto_276210 ) ) ( not ( = ?auto_276206 ?auto_276211 ) ) ( not ( = ?auto_276206 ?auto_276212 ) ) ( not ( = ?auto_276207 ?auto_276208 ) ) ( not ( = ?auto_276207 ?auto_276209 ) ) ( not ( = ?auto_276207 ?auto_276210 ) ) ( not ( = ?auto_276207 ?auto_276211 ) ) ( not ( = ?auto_276207 ?auto_276212 ) ) ( not ( = ?auto_276208 ?auto_276209 ) ) ( not ( = ?auto_276208 ?auto_276210 ) ) ( not ( = ?auto_276208 ?auto_276211 ) ) ( not ( = ?auto_276208 ?auto_276212 ) ) ( not ( = ?auto_276209 ?auto_276210 ) ) ( not ( = ?auto_276209 ?auto_276211 ) ) ( not ( = ?auto_276209 ?auto_276212 ) ) ( not ( = ?auto_276210 ?auto_276211 ) ) ( not ( = ?auto_276210 ?auto_276212 ) ) ( not ( = ?auto_276211 ?auto_276212 ) ) ( CLEAR ?auto_276209 ) ( ON ?auto_276210 ?auto_276211 ) ( CLEAR ?auto_276210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_276202 ?auto_276203 ?auto_276204 ?auto_276205 ?auto_276206 ?auto_276207 ?auto_276208 ?auto_276209 ?auto_276210 )
      ( MAKE-10PILE ?auto_276202 ?auto_276203 ?auto_276204 ?auto_276205 ?auto_276206 ?auto_276207 ?auto_276208 ?auto_276209 ?auto_276210 ?auto_276211 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_276244 - BLOCK
      ?auto_276245 - BLOCK
      ?auto_276246 - BLOCK
      ?auto_276247 - BLOCK
      ?auto_276248 - BLOCK
      ?auto_276249 - BLOCK
      ?auto_276250 - BLOCK
      ?auto_276251 - BLOCK
      ?auto_276252 - BLOCK
      ?auto_276253 - BLOCK
    )
    :vars
    (
      ?auto_276254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_276253 ?auto_276254 ) ( ON-TABLE ?auto_276244 ) ( ON ?auto_276245 ?auto_276244 ) ( ON ?auto_276246 ?auto_276245 ) ( ON ?auto_276247 ?auto_276246 ) ( ON ?auto_276248 ?auto_276247 ) ( ON ?auto_276249 ?auto_276248 ) ( ON ?auto_276250 ?auto_276249 ) ( not ( = ?auto_276244 ?auto_276245 ) ) ( not ( = ?auto_276244 ?auto_276246 ) ) ( not ( = ?auto_276244 ?auto_276247 ) ) ( not ( = ?auto_276244 ?auto_276248 ) ) ( not ( = ?auto_276244 ?auto_276249 ) ) ( not ( = ?auto_276244 ?auto_276250 ) ) ( not ( = ?auto_276244 ?auto_276251 ) ) ( not ( = ?auto_276244 ?auto_276252 ) ) ( not ( = ?auto_276244 ?auto_276253 ) ) ( not ( = ?auto_276244 ?auto_276254 ) ) ( not ( = ?auto_276245 ?auto_276246 ) ) ( not ( = ?auto_276245 ?auto_276247 ) ) ( not ( = ?auto_276245 ?auto_276248 ) ) ( not ( = ?auto_276245 ?auto_276249 ) ) ( not ( = ?auto_276245 ?auto_276250 ) ) ( not ( = ?auto_276245 ?auto_276251 ) ) ( not ( = ?auto_276245 ?auto_276252 ) ) ( not ( = ?auto_276245 ?auto_276253 ) ) ( not ( = ?auto_276245 ?auto_276254 ) ) ( not ( = ?auto_276246 ?auto_276247 ) ) ( not ( = ?auto_276246 ?auto_276248 ) ) ( not ( = ?auto_276246 ?auto_276249 ) ) ( not ( = ?auto_276246 ?auto_276250 ) ) ( not ( = ?auto_276246 ?auto_276251 ) ) ( not ( = ?auto_276246 ?auto_276252 ) ) ( not ( = ?auto_276246 ?auto_276253 ) ) ( not ( = ?auto_276246 ?auto_276254 ) ) ( not ( = ?auto_276247 ?auto_276248 ) ) ( not ( = ?auto_276247 ?auto_276249 ) ) ( not ( = ?auto_276247 ?auto_276250 ) ) ( not ( = ?auto_276247 ?auto_276251 ) ) ( not ( = ?auto_276247 ?auto_276252 ) ) ( not ( = ?auto_276247 ?auto_276253 ) ) ( not ( = ?auto_276247 ?auto_276254 ) ) ( not ( = ?auto_276248 ?auto_276249 ) ) ( not ( = ?auto_276248 ?auto_276250 ) ) ( not ( = ?auto_276248 ?auto_276251 ) ) ( not ( = ?auto_276248 ?auto_276252 ) ) ( not ( = ?auto_276248 ?auto_276253 ) ) ( not ( = ?auto_276248 ?auto_276254 ) ) ( not ( = ?auto_276249 ?auto_276250 ) ) ( not ( = ?auto_276249 ?auto_276251 ) ) ( not ( = ?auto_276249 ?auto_276252 ) ) ( not ( = ?auto_276249 ?auto_276253 ) ) ( not ( = ?auto_276249 ?auto_276254 ) ) ( not ( = ?auto_276250 ?auto_276251 ) ) ( not ( = ?auto_276250 ?auto_276252 ) ) ( not ( = ?auto_276250 ?auto_276253 ) ) ( not ( = ?auto_276250 ?auto_276254 ) ) ( not ( = ?auto_276251 ?auto_276252 ) ) ( not ( = ?auto_276251 ?auto_276253 ) ) ( not ( = ?auto_276251 ?auto_276254 ) ) ( not ( = ?auto_276252 ?auto_276253 ) ) ( not ( = ?auto_276252 ?auto_276254 ) ) ( not ( = ?auto_276253 ?auto_276254 ) ) ( ON ?auto_276252 ?auto_276253 ) ( CLEAR ?auto_276250 ) ( ON ?auto_276251 ?auto_276252 ) ( CLEAR ?auto_276251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_276244 ?auto_276245 ?auto_276246 ?auto_276247 ?auto_276248 ?auto_276249 ?auto_276250 ?auto_276251 )
      ( MAKE-10PILE ?auto_276244 ?auto_276245 ?auto_276246 ?auto_276247 ?auto_276248 ?auto_276249 ?auto_276250 ?auto_276251 ?auto_276252 ?auto_276253 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_276286 - BLOCK
      ?auto_276287 - BLOCK
      ?auto_276288 - BLOCK
      ?auto_276289 - BLOCK
      ?auto_276290 - BLOCK
      ?auto_276291 - BLOCK
      ?auto_276292 - BLOCK
      ?auto_276293 - BLOCK
      ?auto_276294 - BLOCK
      ?auto_276295 - BLOCK
    )
    :vars
    (
      ?auto_276296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_276295 ?auto_276296 ) ( ON-TABLE ?auto_276286 ) ( ON ?auto_276287 ?auto_276286 ) ( ON ?auto_276288 ?auto_276287 ) ( ON ?auto_276289 ?auto_276288 ) ( ON ?auto_276290 ?auto_276289 ) ( ON ?auto_276291 ?auto_276290 ) ( not ( = ?auto_276286 ?auto_276287 ) ) ( not ( = ?auto_276286 ?auto_276288 ) ) ( not ( = ?auto_276286 ?auto_276289 ) ) ( not ( = ?auto_276286 ?auto_276290 ) ) ( not ( = ?auto_276286 ?auto_276291 ) ) ( not ( = ?auto_276286 ?auto_276292 ) ) ( not ( = ?auto_276286 ?auto_276293 ) ) ( not ( = ?auto_276286 ?auto_276294 ) ) ( not ( = ?auto_276286 ?auto_276295 ) ) ( not ( = ?auto_276286 ?auto_276296 ) ) ( not ( = ?auto_276287 ?auto_276288 ) ) ( not ( = ?auto_276287 ?auto_276289 ) ) ( not ( = ?auto_276287 ?auto_276290 ) ) ( not ( = ?auto_276287 ?auto_276291 ) ) ( not ( = ?auto_276287 ?auto_276292 ) ) ( not ( = ?auto_276287 ?auto_276293 ) ) ( not ( = ?auto_276287 ?auto_276294 ) ) ( not ( = ?auto_276287 ?auto_276295 ) ) ( not ( = ?auto_276287 ?auto_276296 ) ) ( not ( = ?auto_276288 ?auto_276289 ) ) ( not ( = ?auto_276288 ?auto_276290 ) ) ( not ( = ?auto_276288 ?auto_276291 ) ) ( not ( = ?auto_276288 ?auto_276292 ) ) ( not ( = ?auto_276288 ?auto_276293 ) ) ( not ( = ?auto_276288 ?auto_276294 ) ) ( not ( = ?auto_276288 ?auto_276295 ) ) ( not ( = ?auto_276288 ?auto_276296 ) ) ( not ( = ?auto_276289 ?auto_276290 ) ) ( not ( = ?auto_276289 ?auto_276291 ) ) ( not ( = ?auto_276289 ?auto_276292 ) ) ( not ( = ?auto_276289 ?auto_276293 ) ) ( not ( = ?auto_276289 ?auto_276294 ) ) ( not ( = ?auto_276289 ?auto_276295 ) ) ( not ( = ?auto_276289 ?auto_276296 ) ) ( not ( = ?auto_276290 ?auto_276291 ) ) ( not ( = ?auto_276290 ?auto_276292 ) ) ( not ( = ?auto_276290 ?auto_276293 ) ) ( not ( = ?auto_276290 ?auto_276294 ) ) ( not ( = ?auto_276290 ?auto_276295 ) ) ( not ( = ?auto_276290 ?auto_276296 ) ) ( not ( = ?auto_276291 ?auto_276292 ) ) ( not ( = ?auto_276291 ?auto_276293 ) ) ( not ( = ?auto_276291 ?auto_276294 ) ) ( not ( = ?auto_276291 ?auto_276295 ) ) ( not ( = ?auto_276291 ?auto_276296 ) ) ( not ( = ?auto_276292 ?auto_276293 ) ) ( not ( = ?auto_276292 ?auto_276294 ) ) ( not ( = ?auto_276292 ?auto_276295 ) ) ( not ( = ?auto_276292 ?auto_276296 ) ) ( not ( = ?auto_276293 ?auto_276294 ) ) ( not ( = ?auto_276293 ?auto_276295 ) ) ( not ( = ?auto_276293 ?auto_276296 ) ) ( not ( = ?auto_276294 ?auto_276295 ) ) ( not ( = ?auto_276294 ?auto_276296 ) ) ( not ( = ?auto_276295 ?auto_276296 ) ) ( ON ?auto_276294 ?auto_276295 ) ( ON ?auto_276293 ?auto_276294 ) ( CLEAR ?auto_276291 ) ( ON ?auto_276292 ?auto_276293 ) ( CLEAR ?auto_276292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_276286 ?auto_276287 ?auto_276288 ?auto_276289 ?auto_276290 ?auto_276291 ?auto_276292 )
      ( MAKE-10PILE ?auto_276286 ?auto_276287 ?auto_276288 ?auto_276289 ?auto_276290 ?auto_276291 ?auto_276292 ?auto_276293 ?auto_276294 ?auto_276295 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_276328 - BLOCK
      ?auto_276329 - BLOCK
      ?auto_276330 - BLOCK
      ?auto_276331 - BLOCK
      ?auto_276332 - BLOCK
      ?auto_276333 - BLOCK
      ?auto_276334 - BLOCK
      ?auto_276335 - BLOCK
      ?auto_276336 - BLOCK
      ?auto_276337 - BLOCK
    )
    :vars
    (
      ?auto_276338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_276337 ?auto_276338 ) ( ON-TABLE ?auto_276328 ) ( ON ?auto_276329 ?auto_276328 ) ( ON ?auto_276330 ?auto_276329 ) ( ON ?auto_276331 ?auto_276330 ) ( ON ?auto_276332 ?auto_276331 ) ( not ( = ?auto_276328 ?auto_276329 ) ) ( not ( = ?auto_276328 ?auto_276330 ) ) ( not ( = ?auto_276328 ?auto_276331 ) ) ( not ( = ?auto_276328 ?auto_276332 ) ) ( not ( = ?auto_276328 ?auto_276333 ) ) ( not ( = ?auto_276328 ?auto_276334 ) ) ( not ( = ?auto_276328 ?auto_276335 ) ) ( not ( = ?auto_276328 ?auto_276336 ) ) ( not ( = ?auto_276328 ?auto_276337 ) ) ( not ( = ?auto_276328 ?auto_276338 ) ) ( not ( = ?auto_276329 ?auto_276330 ) ) ( not ( = ?auto_276329 ?auto_276331 ) ) ( not ( = ?auto_276329 ?auto_276332 ) ) ( not ( = ?auto_276329 ?auto_276333 ) ) ( not ( = ?auto_276329 ?auto_276334 ) ) ( not ( = ?auto_276329 ?auto_276335 ) ) ( not ( = ?auto_276329 ?auto_276336 ) ) ( not ( = ?auto_276329 ?auto_276337 ) ) ( not ( = ?auto_276329 ?auto_276338 ) ) ( not ( = ?auto_276330 ?auto_276331 ) ) ( not ( = ?auto_276330 ?auto_276332 ) ) ( not ( = ?auto_276330 ?auto_276333 ) ) ( not ( = ?auto_276330 ?auto_276334 ) ) ( not ( = ?auto_276330 ?auto_276335 ) ) ( not ( = ?auto_276330 ?auto_276336 ) ) ( not ( = ?auto_276330 ?auto_276337 ) ) ( not ( = ?auto_276330 ?auto_276338 ) ) ( not ( = ?auto_276331 ?auto_276332 ) ) ( not ( = ?auto_276331 ?auto_276333 ) ) ( not ( = ?auto_276331 ?auto_276334 ) ) ( not ( = ?auto_276331 ?auto_276335 ) ) ( not ( = ?auto_276331 ?auto_276336 ) ) ( not ( = ?auto_276331 ?auto_276337 ) ) ( not ( = ?auto_276331 ?auto_276338 ) ) ( not ( = ?auto_276332 ?auto_276333 ) ) ( not ( = ?auto_276332 ?auto_276334 ) ) ( not ( = ?auto_276332 ?auto_276335 ) ) ( not ( = ?auto_276332 ?auto_276336 ) ) ( not ( = ?auto_276332 ?auto_276337 ) ) ( not ( = ?auto_276332 ?auto_276338 ) ) ( not ( = ?auto_276333 ?auto_276334 ) ) ( not ( = ?auto_276333 ?auto_276335 ) ) ( not ( = ?auto_276333 ?auto_276336 ) ) ( not ( = ?auto_276333 ?auto_276337 ) ) ( not ( = ?auto_276333 ?auto_276338 ) ) ( not ( = ?auto_276334 ?auto_276335 ) ) ( not ( = ?auto_276334 ?auto_276336 ) ) ( not ( = ?auto_276334 ?auto_276337 ) ) ( not ( = ?auto_276334 ?auto_276338 ) ) ( not ( = ?auto_276335 ?auto_276336 ) ) ( not ( = ?auto_276335 ?auto_276337 ) ) ( not ( = ?auto_276335 ?auto_276338 ) ) ( not ( = ?auto_276336 ?auto_276337 ) ) ( not ( = ?auto_276336 ?auto_276338 ) ) ( not ( = ?auto_276337 ?auto_276338 ) ) ( ON ?auto_276336 ?auto_276337 ) ( ON ?auto_276335 ?auto_276336 ) ( ON ?auto_276334 ?auto_276335 ) ( CLEAR ?auto_276332 ) ( ON ?auto_276333 ?auto_276334 ) ( CLEAR ?auto_276333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_276328 ?auto_276329 ?auto_276330 ?auto_276331 ?auto_276332 ?auto_276333 )
      ( MAKE-10PILE ?auto_276328 ?auto_276329 ?auto_276330 ?auto_276331 ?auto_276332 ?auto_276333 ?auto_276334 ?auto_276335 ?auto_276336 ?auto_276337 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_276370 - BLOCK
      ?auto_276371 - BLOCK
      ?auto_276372 - BLOCK
      ?auto_276373 - BLOCK
      ?auto_276374 - BLOCK
      ?auto_276375 - BLOCK
      ?auto_276376 - BLOCK
      ?auto_276377 - BLOCK
      ?auto_276378 - BLOCK
      ?auto_276379 - BLOCK
    )
    :vars
    (
      ?auto_276380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_276379 ?auto_276380 ) ( ON-TABLE ?auto_276370 ) ( ON ?auto_276371 ?auto_276370 ) ( ON ?auto_276372 ?auto_276371 ) ( ON ?auto_276373 ?auto_276372 ) ( not ( = ?auto_276370 ?auto_276371 ) ) ( not ( = ?auto_276370 ?auto_276372 ) ) ( not ( = ?auto_276370 ?auto_276373 ) ) ( not ( = ?auto_276370 ?auto_276374 ) ) ( not ( = ?auto_276370 ?auto_276375 ) ) ( not ( = ?auto_276370 ?auto_276376 ) ) ( not ( = ?auto_276370 ?auto_276377 ) ) ( not ( = ?auto_276370 ?auto_276378 ) ) ( not ( = ?auto_276370 ?auto_276379 ) ) ( not ( = ?auto_276370 ?auto_276380 ) ) ( not ( = ?auto_276371 ?auto_276372 ) ) ( not ( = ?auto_276371 ?auto_276373 ) ) ( not ( = ?auto_276371 ?auto_276374 ) ) ( not ( = ?auto_276371 ?auto_276375 ) ) ( not ( = ?auto_276371 ?auto_276376 ) ) ( not ( = ?auto_276371 ?auto_276377 ) ) ( not ( = ?auto_276371 ?auto_276378 ) ) ( not ( = ?auto_276371 ?auto_276379 ) ) ( not ( = ?auto_276371 ?auto_276380 ) ) ( not ( = ?auto_276372 ?auto_276373 ) ) ( not ( = ?auto_276372 ?auto_276374 ) ) ( not ( = ?auto_276372 ?auto_276375 ) ) ( not ( = ?auto_276372 ?auto_276376 ) ) ( not ( = ?auto_276372 ?auto_276377 ) ) ( not ( = ?auto_276372 ?auto_276378 ) ) ( not ( = ?auto_276372 ?auto_276379 ) ) ( not ( = ?auto_276372 ?auto_276380 ) ) ( not ( = ?auto_276373 ?auto_276374 ) ) ( not ( = ?auto_276373 ?auto_276375 ) ) ( not ( = ?auto_276373 ?auto_276376 ) ) ( not ( = ?auto_276373 ?auto_276377 ) ) ( not ( = ?auto_276373 ?auto_276378 ) ) ( not ( = ?auto_276373 ?auto_276379 ) ) ( not ( = ?auto_276373 ?auto_276380 ) ) ( not ( = ?auto_276374 ?auto_276375 ) ) ( not ( = ?auto_276374 ?auto_276376 ) ) ( not ( = ?auto_276374 ?auto_276377 ) ) ( not ( = ?auto_276374 ?auto_276378 ) ) ( not ( = ?auto_276374 ?auto_276379 ) ) ( not ( = ?auto_276374 ?auto_276380 ) ) ( not ( = ?auto_276375 ?auto_276376 ) ) ( not ( = ?auto_276375 ?auto_276377 ) ) ( not ( = ?auto_276375 ?auto_276378 ) ) ( not ( = ?auto_276375 ?auto_276379 ) ) ( not ( = ?auto_276375 ?auto_276380 ) ) ( not ( = ?auto_276376 ?auto_276377 ) ) ( not ( = ?auto_276376 ?auto_276378 ) ) ( not ( = ?auto_276376 ?auto_276379 ) ) ( not ( = ?auto_276376 ?auto_276380 ) ) ( not ( = ?auto_276377 ?auto_276378 ) ) ( not ( = ?auto_276377 ?auto_276379 ) ) ( not ( = ?auto_276377 ?auto_276380 ) ) ( not ( = ?auto_276378 ?auto_276379 ) ) ( not ( = ?auto_276378 ?auto_276380 ) ) ( not ( = ?auto_276379 ?auto_276380 ) ) ( ON ?auto_276378 ?auto_276379 ) ( ON ?auto_276377 ?auto_276378 ) ( ON ?auto_276376 ?auto_276377 ) ( ON ?auto_276375 ?auto_276376 ) ( CLEAR ?auto_276373 ) ( ON ?auto_276374 ?auto_276375 ) ( CLEAR ?auto_276374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_276370 ?auto_276371 ?auto_276372 ?auto_276373 ?auto_276374 )
      ( MAKE-10PILE ?auto_276370 ?auto_276371 ?auto_276372 ?auto_276373 ?auto_276374 ?auto_276375 ?auto_276376 ?auto_276377 ?auto_276378 ?auto_276379 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_276412 - BLOCK
      ?auto_276413 - BLOCK
      ?auto_276414 - BLOCK
      ?auto_276415 - BLOCK
      ?auto_276416 - BLOCK
      ?auto_276417 - BLOCK
      ?auto_276418 - BLOCK
      ?auto_276419 - BLOCK
      ?auto_276420 - BLOCK
      ?auto_276421 - BLOCK
    )
    :vars
    (
      ?auto_276422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_276421 ?auto_276422 ) ( ON-TABLE ?auto_276412 ) ( ON ?auto_276413 ?auto_276412 ) ( ON ?auto_276414 ?auto_276413 ) ( not ( = ?auto_276412 ?auto_276413 ) ) ( not ( = ?auto_276412 ?auto_276414 ) ) ( not ( = ?auto_276412 ?auto_276415 ) ) ( not ( = ?auto_276412 ?auto_276416 ) ) ( not ( = ?auto_276412 ?auto_276417 ) ) ( not ( = ?auto_276412 ?auto_276418 ) ) ( not ( = ?auto_276412 ?auto_276419 ) ) ( not ( = ?auto_276412 ?auto_276420 ) ) ( not ( = ?auto_276412 ?auto_276421 ) ) ( not ( = ?auto_276412 ?auto_276422 ) ) ( not ( = ?auto_276413 ?auto_276414 ) ) ( not ( = ?auto_276413 ?auto_276415 ) ) ( not ( = ?auto_276413 ?auto_276416 ) ) ( not ( = ?auto_276413 ?auto_276417 ) ) ( not ( = ?auto_276413 ?auto_276418 ) ) ( not ( = ?auto_276413 ?auto_276419 ) ) ( not ( = ?auto_276413 ?auto_276420 ) ) ( not ( = ?auto_276413 ?auto_276421 ) ) ( not ( = ?auto_276413 ?auto_276422 ) ) ( not ( = ?auto_276414 ?auto_276415 ) ) ( not ( = ?auto_276414 ?auto_276416 ) ) ( not ( = ?auto_276414 ?auto_276417 ) ) ( not ( = ?auto_276414 ?auto_276418 ) ) ( not ( = ?auto_276414 ?auto_276419 ) ) ( not ( = ?auto_276414 ?auto_276420 ) ) ( not ( = ?auto_276414 ?auto_276421 ) ) ( not ( = ?auto_276414 ?auto_276422 ) ) ( not ( = ?auto_276415 ?auto_276416 ) ) ( not ( = ?auto_276415 ?auto_276417 ) ) ( not ( = ?auto_276415 ?auto_276418 ) ) ( not ( = ?auto_276415 ?auto_276419 ) ) ( not ( = ?auto_276415 ?auto_276420 ) ) ( not ( = ?auto_276415 ?auto_276421 ) ) ( not ( = ?auto_276415 ?auto_276422 ) ) ( not ( = ?auto_276416 ?auto_276417 ) ) ( not ( = ?auto_276416 ?auto_276418 ) ) ( not ( = ?auto_276416 ?auto_276419 ) ) ( not ( = ?auto_276416 ?auto_276420 ) ) ( not ( = ?auto_276416 ?auto_276421 ) ) ( not ( = ?auto_276416 ?auto_276422 ) ) ( not ( = ?auto_276417 ?auto_276418 ) ) ( not ( = ?auto_276417 ?auto_276419 ) ) ( not ( = ?auto_276417 ?auto_276420 ) ) ( not ( = ?auto_276417 ?auto_276421 ) ) ( not ( = ?auto_276417 ?auto_276422 ) ) ( not ( = ?auto_276418 ?auto_276419 ) ) ( not ( = ?auto_276418 ?auto_276420 ) ) ( not ( = ?auto_276418 ?auto_276421 ) ) ( not ( = ?auto_276418 ?auto_276422 ) ) ( not ( = ?auto_276419 ?auto_276420 ) ) ( not ( = ?auto_276419 ?auto_276421 ) ) ( not ( = ?auto_276419 ?auto_276422 ) ) ( not ( = ?auto_276420 ?auto_276421 ) ) ( not ( = ?auto_276420 ?auto_276422 ) ) ( not ( = ?auto_276421 ?auto_276422 ) ) ( ON ?auto_276420 ?auto_276421 ) ( ON ?auto_276419 ?auto_276420 ) ( ON ?auto_276418 ?auto_276419 ) ( ON ?auto_276417 ?auto_276418 ) ( ON ?auto_276416 ?auto_276417 ) ( CLEAR ?auto_276414 ) ( ON ?auto_276415 ?auto_276416 ) ( CLEAR ?auto_276415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_276412 ?auto_276413 ?auto_276414 ?auto_276415 )
      ( MAKE-10PILE ?auto_276412 ?auto_276413 ?auto_276414 ?auto_276415 ?auto_276416 ?auto_276417 ?auto_276418 ?auto_276419 ?auto_276420 ?auto_276421 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_276454 - BLOCK
      ?auto_276455 - BLOCK
      ?auto_276456 - BLOCK
      ?auto_276457 - BLOCK
      ?auto_276458 - BLOCK
      ?auto_276459 - BLOCK
      ?auto_276460 - BLOCK
      ?auto_276461 - BLOCK
      ?auto_276462 - BLOCK
      ?auto_276463 - BLOCK
    )
    :vars
    (
      ?auto_276464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_276463 ?auto_276464 ) ( ON-TABLE ?auto_276454 ) ( ON ?auto_276455 ?auto_276454 ) ( not ( = ?auto_276454 ?auto_276455 ) ) ( not ( = ?auto_276454 ?auto_276456 ) ) ( not ( = ?auto_276454 ?auto_276457 ) ) ( not ( = ?auto_276454 ?auto_276458 ) ) ( not ( = ?auto_276454 ?auto_276459 ) ) ( not ( = ?auto_276454 ?auto_276460 ) ) ( not ( = ?auto_276454 ?auto_276461 ) ) ( not ( = ?auto_276454 ?auto_276462 ) ) ( not ( = ?auto_276454 ?auto_276463 ) ) ( not ( = ?auto_276454 ?auto_276464 ) ) ( not ( = ?auto_276455 ?auto_276456 ) ) ( not ( = ?auto_276455 ?auto_276457 ) ) ( not ( = ?auto_276455 ?auto_276458 ) ) ( not ( = ?auto_276455 ?auto_276459 ) ) ( not ( = ?auto_276455 ?auto_276460 ) ) ( not ( = ?auto_276455 ?auto_276461 ) ) ( not ( = ?auto_276455 ?auto_276462 ) ) ( not ( = ?auto_276455 ?auto_276463 ) ) ( not ( = ?auto_276455 ?auto_276464 ) ) ( not ( = ?auto_276456 ?auto_276457 ) ) ( not ( = ?auto_276456 ?auto_276458 ) ) ( not ( = ?auto_276456 ?auto_276459 ) ) ( not ( = ?auto_276456 ?auto_276460 ) ) ( not ( = ?auto_276456 ?auto_276461 ) ) ( not ( = ?auto_276456 ?auto_276462 ) ) ( not ( = ?auto_276456 ?auto_276463 ) ) ( not ( = ?auto_276456 ?auto_276464 ) ) ( not ( = ?auto_276457 ?auto_276458 ) ) ( not ( = ?auto_276457 ?auto_276459 ) ) ( not ( = ?auto_276457 ?auto_276460 ) ) ( not ( = ?auto_276457 ?auto_276461 ) ) ( not ( = ?auto_276457 ?auto_276462 ) ) ( not ( = ?auto_276457 ?auto_276463 ) ) ( not ( = ?auto_276457 ?auto_276464 ) ) ( not ( = ?auto_276458 ?auto_276459 ) ) ( not ( = ?auto_276458 ?auto_276460 ) ) ( not ( = ?auto_276458 ?auto_276461 ) ) ( not ( = ?auto_276458 ?auto_276462 ) ) ( not ( = ?auto_276458 ?auto_276463 ) ) ( not ( = ?auto_276458 ?auto_276464 ) ) ( not ( = ?auto_276459 ?auto_276460 ) ) ( not ( = ?auto_276459 ?auto_276461 ) ) ( not ( = ?auto_276459 ?auto_276462 ) ) ( not ( = ?auto_276459 ?auto_276463 ) ) ( not ( = ?auto_276459 ?auto_276464 ) ) ( not ( = ?auto_276460 ?auto_276461 ) ) ( not ( = ?auto_276460 ?auto_276462 ) ) ( not ( = ?auto_276460 ?auto_276463 ) ) ( not ( = ?auto_276460 ?auto_276464 ) ) ( not ( = ?auto_276461 ?auto_276462 ) ) ( not ( = ?auto_276461 ?auto_276463 ) ) ( not ( = ?auto_276461 ?auto_276464 ) ) ( not ( = ?auto_276462 ?auto_276463 ) ) ( not ( = ?auto_276462 ?auto_276464 ) ) ( not ( = ?auto_276463 ?auto_276464 ) ) ( ON ?auto_276462 ?auto_276463 ) ( ON ?auto_276461 ?auto_276462 ) ( ON ?auto_276460 ?auto_276461 ) ( ON ?auto_276459 ?auto_276460 ) ( ON ?auto_276458 ?auto_276459 ) ( ON ?auto_276457 ?auto_276458 ) ( CLEAR ?auto_276455 ) ( ON ?auto_276456 ?auto_276457 ) ( CLEAR ?auto_276456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_276454 ?auto_276455 ?auto_276456 )
      ( MAKE-10PILE ?auto_276454 ?auto_276455 ?auto_276456 ?auto_276457 ?auto_276458 ?auto_276459 ?auto_276460 ?auto_276461 ?auto_276462 ?auto_276463 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_276496 - BLOCK
      ?auto_276497 - BLOCK
      ?auto_276498 - BLOCK
      ?auto_276499 - BLOCK
      ?auto_276500 - BLOCK
      ?auto_276501 - BLOCK
      ?auto_276502 - BLOCK
      ?auto_276503 - BLOCK
      ?auto_276504 - BLOCK
      ?auto_276505 - BLOCK
    )
    :vars
    (
      ?auto_276506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_276505 ?auto_276506 ) ( ON-TABLE ?auto_276496 ) ( not ( = ?auto_276496 ?auto_276497 ) ) ( not ( = ?auto_276496 ?auto_276498 ) ) ( not ( = ?auto_276496 ?auto_276499 ) ) ( not ( = ?auto_276496 ?auto_276500 ) ) ( not ( = ?auto_276496 ?auto_276501 ) ) ( not ( = ?auto_276496 ?auto_276502 ) ) ( not ( = ?auto_276496 ?auto_276503 ) ) ( not ( = ?auto_276496 ?auto_276504 ) ) ( not ( = ?auto_276496 ?auto_276505 ) ) ( not ( = ?auto_276496 ?auto_276506 ) ) ( not ( = ?auto_276497 ?auto_276498 ) ) ( not ( = ?auto_276497 ?auto_276499 ) ) ( not ( = ?auto_276497 ?auto_276500 ) ) ( not ( = ?auto_276497 ?auto_276501 ) ) ( not ( = ?auto_276497 ?auto_276502 ) ) ( not ( = ?auto_276497 ?auto_276503 ) ) ( not ( = ?auto_276497 ?auto_276504 ) ) ( not ( = ?auto_276497 ?auto_276505 ) ) ( not ( = ?auto_276497 ?auto_276506 ) ) ( not ( = ?auto_276498 ?auto_276499 ) ) ( not ( = ?auto_276498 ?auto_276500 ) ) ( not ( = ?auto_276498 ?auto_276501 ) ) ( not ( = ?auto_276498 ?auto_276502 ) ) ( not ( = ?auto_276498 ?auto_276503 ) ) ( not ( = ?auto_276498 ?auto_276504 ) ) ( not ( = ?auto_276498 ?auto_276505 ) ) ( not ( = ?auto_276498 ?auto_276506 ) ) ( not ( = ?auto_276499 ?auto_276500 ) ) ( not ( = ?auto_276499 ?auto_276501 ) ) ( not ( = ?auto_276499 ?auto_276502 ) ) ( not ( = ?auto_276499 ?auto_276503 ) ) ( not ( = ?auto_276499 ?auto_276504 ) ) ( not ( = ?auto_276499 ?auto_276505 ) ) ( not ( = ?auto_276499 ?auto_276506 ) ) ( not ( = ?auto_276500 ?auto_276501 ) ) ( not ( = ?auto_276500 ?auto_276502 ) ) ( not ( = ?auto_276500 ?auto_276503 ) ) ( not ( = ?auto_276500 ?auto_276504 ) ) ( not ( = ?auto_276500 ?auto_276505 ) ) ( not ( = ?auto_276500 ?auto_276506 ) ) ( not ( = ?auto_276501 ?auto_276502 ) ) ( not ( = ?auto_276501 ?auto_276503 ) ) ( not ( = ?auto_276501 ?auto_276504 ) ) ( not ( = ?auto_276501 ?auto_276505 ) ) ( not ( = ?auto_276501 ?auto_276506 ) ) ( not ( = ?auto_276502 ?auto_276503 ) ) ( not ( = ?auto_276502 ?auto_276504 ) ) ( not ( = ?auto_276502 ?auto_276505 ) ) ( not ( = ?auto_276502 ?auto_276506 ) ) ( not ( = ?auto_276503 ?auto_276504 ) ) ( not ( = ?auto_276503 ?auto_276505 ) ) ( not ( = ?auto_276503 ?auto_276506 ) ) ( not ( = ?auto_276504 ?auto_276505 ) ) ( not ( = ?auto_276504 ?auto_276506 ) ) ( not ( = ?auto_276505 ?auto_276506 ) ) ( ON ?auto_276504 ?auto_276505 ) ( ON ?auto_276503 ?auto_276504 ) ( ON ?auto_276502 ?auto_276503 ) ( ON ?auto_276501 ?auto_276502 ) ( ON ?auto_276500 ?auto_276501 ) ( ON ?auto_276499 ?auto_276500 ) ( ON ?auto_276498 ?auto_276499 ) ( CLEAR ?auto_276496 ) ( ON ?auto_276497 ?auto_276498 ) ( CLEAR ?auto_276497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_276496 ?auto_276497 )
      ( MAKE-10PILE ?auto_276496 ?auto_276497 ?auto_276498 ?auto_276499 ?auto_276500 ?auto_276501 ?auto_276502 ?auto_276503 ?auto_276504 ?auto_276505 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_276538 - BLOCK
      ?auto_276539 - BLOCK
      ?auto_276540 - BLOCK
      ?auto_276541 - BLOCK
      ?auto_276542 - BLOCK
      ?auto_276543 - BLOCK
      ?auto_276544 - BLOCK
      ?auto_276545 - BLOCK
      ?auto_276546 - BLOCK
      ?auto_276547 - BLOCK
    )
    :vars
    (
      ?auto_276548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_276547 ?auto_276548 ) ( not ( = ?auto_276538 ?auto_276539 ) ) ( not ( = ?auto_276538 ?auto_276540 ) ) ( not ( = ?auto_276538 ?auto_276541 ) ) ( not ( = ?auto_276538 ?auto_276542 ) ) ( not ( = ?auto_276538 ?auto_276543 ) ) ( not ( = ?auto_276538 ?auto_276544 ) ) ( not ( = ?auto_276538 ?auto_276545 ) ) ( not ( = ?auto_276538 ?auto_276546 ) ) ( not ( = ?auto_276538 ?auto_276547 ) ) ( not ( = ?auto_276538 ?auto_276548 ) ) ( not ( = ?auto_276539 ?auto_276540 ) ) ( not ( = ?auto_276539 ?auto_276541 ) ) ( not ( = ?auto_276539 ?auto_276542 ) ) ( not ( = ?auto_276539 ?auto_276543 ) ) ( not ( = ?auto_276539 ?auto_276544 ) ) ( not ( = ?auto_276539 ?auto_276545 ) ) ( not ( = ?auto_276539 ?auto_276546 ) ) ( not ( = ?auto_276539 ?auto_276547 ) ) ( not ( = ?auto_276539 ?auto_276548 ) ) ( not ( = ?auto_276540 ?auto_276541 ) ) ( not ( = ?auto_276540 ?auto_276542 ) ) ( not ( = ?auto_276540 ?auto_276543 ) ) ( not ( = ?auto_276540 ?auto_276544 ) ) ( not ( = ?auto_276540 ?auto_276545 ) ) ( not ( = ?auto_276540 ?auto_276546 ) ) ( not ( = ?auto_276540 ?auto_276547 ) ) ( not ( = ?auto_276540 ?auto_276548 ) ) ( not ( = ?auto_276541 ?auto_276542 ) ) ( not ( = ?auto_276541 ?auto_276543 ) ) ( not ( = ?auto_276541 ?auto_276544 ) ) ( not ( = ?auto_276541 ?auto_276545 ) ) ( not ( = ?auto_276541 ?auto_276546 ) ) ( not ( = ?auto_276541 ?auto_276547 ) ) ( not ( = ?auto_276541 ?auto_276548 ) ) ( not ( = ?auto_276542 ?auto_276543 ) ) ( not ( = ?auto_276542 ?auto_276544 ) ) ( not ( = ?auto_276542 ?auto_276545 ) ) ( not ( = ?auto_276542 ?auto_276546 ) ) ( not ( = ?auto_276542 ?auto_276547 ) ) ( not ( = ?auto_276542 ?auto_276548 ) ) ( not ( = ?auto_276543 ?auto_276544 ) ) ( not ( = ?auto_276543 ?auto_276545 ) ) ( not ( = ?auto_276543 ?auto_276546 ) ) ( not ( = ?auto_276543 ?auto_276547 ) ) ( not ( = ?auto_276543 ?auto_276548 ) ) ( not ( = ?auto_276544 ?auto_276545 ) ) ( not ( = ?auto_276544 ?auto_276546 ) ) ( not ( = ?auto_276544 ?auto_276547 ) ) ( not ( = ?auto_276544 ?auto_276548 ) ) ( not ( = ?auto_276545 ?auto_276546 ) ) ( not ( = ?auto_276545 ?auto_276547 ) ) ( not ( = ?auto_276545 ?auto_276548 ) ) ( not ( = ?auto_276546 ?auto_276547 ) ) ( not ( = ?auto_276546 ?auto_276548 ) ) ( not ( = ?auto_276547 ?auto_276548 ) ) ( ON ?auto_276546 ?auto_276547 ) ( ON ?auto_276545 ?auto_276546 ) ( ON ?auto_276544 ?auto_276545 ) ( ON ?auto_276543 ?auto_276544 ) ( ON ?auto_276542 ?auto_276543 ) ( ON ?auto_276541 ?auto_276542 ) ( ON ?auto_276540 ?auto_276541 ) ( ON ?auto_276539 ?auto_276540 ) ( ON ?auto_276538 ?auto_276539 ) ( CLEAR ?auto_276538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_276538 )
      ( MAKE-10PILE ?auto_276538 ?auto_276539 ?auto_276540 ?auto_276541 ?auto_276542 ?auto_276543 ?auto_276544 ?auto_276545 ?auto_276546 ?auto_276547 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_276581 - BLOCK
      ?auto_276582 - BLOCK
      ?auto_276583 - BLOCK
      ?auto_276584 - BLOCK
      ?auto_276585 - BLOCK
      ?auto_276586 - BLOCK
      ?auto_276587 - BLOCK
      ?auto_276588 - BLOCK
      ?auto_276589 - BLOCK
      ?auto_276590 - BLOCK
      ?auto_276591 - BLOCK
    )
    :vars
    (
      ?auto_276592 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_276590 ) ( ON ?auto_276591 ?auto_276592 ) ( CLEAR ?auto_276591 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_276581 ) ( ON ?auto_276582 ?auto_276581 ) ( ON ?auto_276583 ?auto_276582 ) ( ON ?auto_276584 ?auto_276583 ) ( ON ?auto_276585 ?auto_276584 ) ( ON ?auto_276586 ?auto_276585 ) ( ON ?auto_276587 ?auto_276586 ) ( ON ?auto_276588 ?auto_276587 ) ( ON ?auto_276589 ?auto_276588 ) ( ON ?auto_276590 ?auto_276589 ) ( not ( = ?auto_276581 ?auto_276582 ) ) ( not ( = ?auto_276581 ?auto_276583 ) ) ( not ( = ?auto_276581 ?auto_276584 ) ) ( not ( = ?auto_276581 ?auto_276585 ) ) ( not ( = ?auto_276581 ?auto_276586 ) ) ( not ( = ?auto_276581 ?auto_276587 ) ) ( not ( = ?auto_276581 ?auto_276588 ) ) ( not ( = ?auto_276581 ?auto_276589 ) ) ( not ( = ?auto_276581 ?auto_276590 ) ) ( not ( = ?auto_276581 ?auto_276591 ) ) ( not ( = ?auto_276581 ?auto_276592 ) ) ( not ( = ?auto_276582 ?auto_276583 ) ) ( not ( = ?auto_276582 ?auto_276584 ) ) ( not ( = ?auto_276582 ?auto_276585 ) ) ( not ( = ?auto_276582 ?auto_276586 ) ) ( not ( = ?auto_276582 ?auto_276587 ) ) ( not ( = ?auto_276582 ?auto_276588 ) ) ( not ( = ?auto_276582 ?auto_276589 ) ) ( not ( = ?auto_276582 ?auto_276590 ) ) ( not ( = ?auto_276582 ?auto_276591 ) ) ( not ( = ?auto_276582 ?auto_276592 ) ) ( not ( = ?auto_276583 ?auto_276584 ) ) ( not ( = ?auto_276583 ?auto_276585 ) ) ( not ( = ?auto_276583 ?auto_276586 ) ) ( not ( = ?auto_276583 ?auto_276587 ) ) ( not ( = ?auto_276583 ?auto_276588 ) ) ( not ( = ?auto_276583 ?auto_276589 ) ) ( not ( = ?auto_276583 ?auto_276590 ) ) ( not ( = ?auto_276583 ?auto_276591 ) ) ( not ( = ?auto_276583 ?auto_276592 ) ) ( not ( = ?auto_276584 ?auto_276585 ) ) ( not ( = ?auto_276584 ?auto_276586 ) ) ( not ( = ?auto_276584 ?auto_276587 ) ) ( not ( = ?auto_276584 ?auto_276588 ) ) ( not ( = ?auto_276584 ?auto_276589 ) ) ( not ( = ?auto_276584 ?auto_276590 ) ) ( not ( = ?auto_276584 ?auto_276591 ) ) ( not ( = ?auto_276584 ?auto_276592 ) ) ( not ( = ?auto_276585 ?auto_276586 ) ) ( not ( = ?auto_276585 ?auto_276587 ) ) ( not ( = ?auto_276585 ?auto_276588 ) ) ( not ( = ?auto_276585 ?auto_276589 ) ) ( not ( = ?auto_276585 ?auto_276590 ) ) ( not ( = ?auto_276585 ?auto_276591 ) ) ( not ( = ?auto_276585 ?auto_276592 ) ) ( not ( = ?auto_276586 ?auto_276587 ) ) ( not ( = ?auto_276586 ?auto_276588 ) ) ( not ( = ?auto_276586 ?auto_276589 ) ) ( not ( = ?auto_276586 ?auto_276590 ) ) ( not ( = ?auto_276586 ?auto_276591 ) ) ( not ( = ?auto_276586 ?auto_276592 ) ) ( not ( = ?auto_276587 ?auto_276588 ) ) ( not ( = ?auto_276587 ?auto_276589 ) ) ( not ( = ?auto_276587 ?auto_276590 ) ) ( not ( = ?auto_276587 ?auto_276591 ) ) ( not ( = ?auto_276587 ?auto_276592 ) ) ( not ( = ?auto_276588 ?auto_276589 ) ) ( not ( = ?auto_276588 ?auto_276590 ) ) ( not ( = ?auto_276588 ?auto_276591 ) ) ( not ( = ?auto_276588 ?auto_276592 ) ) ( not ( = ?auto_276589 ?auto_276590 ) ) ( not ( = ?auto_276589 ?auto_276591 ) ) ( not ( = ?auto_276589 ?auto_276592 ) ) ( not ( = ?auto_276590 ?auto_276591 ) ) ( not ( = ?auto_276590 ?auto_276592 ) ) ( not ( = ?auto_276591 ?auto_276592 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_276591 ?auto_276592 )
      ( !STACK ?auto_276591 ?auto_276590 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_276627 - BLOCK
      ?auto_276628 - BLOCK
      ?auto_276629 - BLOCK
      ?auto_276630 - BLOCK
      ?auto_276631 - BLOCK
      ?auto_276632 - BLOCK
      ?auto_276633 - BLOCK
      ?auto_276634 - BLOCK
      ?auto_276635 - BLOCK
      ?auto_276636 - BLOCK
      ?auto_276637 - BLOCK
    )
    :vars
    (
      ?auto_276638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_276637 ?auto_276638 ) ( ON-TABLE ?auto_276627 ) ( ON ?auto_276628 ?auto_276627 ) ( ON ?auto_276629 ?auto_276628 ) ( ON ?auto_276630 ?auto_276629 ) ( ON ?auto_276631 ?auto_276630 ) ( ON ?auto_276632 ?auto_276631 ) ( ON ?auto_276633 ?auto_276632 ) ( ON ?auto_276634 ?auto_276633 ) ( ON ?auto_276635 ?auto_276634 ) ( not ( = ?auto_276627 ?auto_276628 ) ) ( not ( = ?auto_276627 ?auto_276629 ) ) ( not ( = ?auto_276627 ?auto_276630 ) ) ( not ( = ?auto_276627 ?auto_276631 ) ) ( not ( = ?auto_276627 ?auto_276632 ) ) ( not ( = ?auto_276627 ?auto_276633 ) ) ( not ( = ?auto_276627 ?auto_276634 ) ) ( not ( = ?auto_276627 ?auto_276635 ) ) ( not ( = ?auto_276627 ?auto_276636 ) ) ( not ( = ?auto_276627 ?auto_276637 ) ) ( not ( = ?auto_276627 ?auto_276638 ) ) ( not ( = ?auto_276628 ?auto_276629 ) ) ( not ( = ?auto_276628 ?auto_276630 ) ) ( not ( = ?auto_276628 ?auto_276631 ) ) ( not ( = ?auto_276628 ?auto_276632 ) ) ( not ( = ?auto_276628 ?auto_276633 ) ) ( not ( = ?auto_276628 ?auto_276634 ) ) ( not ( = ?auto_276628 ?auto_276635 ) ) ( not ( = ?auto_276628 ?auto_276636 ) ) ( not ( = ?auto_276628 ?auto_276637 ) ) ( not ( = ?auto_276628 ?auto_276638 ) ) ( not ( = ?auto_276629 ?auto_276630 ) ) ( not ( = ?auto_276629 ?auto_276631 ) ) ( not ( = ?auto_276629 ?auto_276632 ) ) ( not ( = ?auto_276629 ?auto_276633 ) ) ( not ( = ?auto_276629 ?auto_276634 ) ) ( not ( = ?auto_276629 ?auto_276635 ) ) ( not ( = ?auto_276629 ?auto_276636 ) ) ( not ( = ?auto_276629 ?auto_276637 ) ) ( not ( = ?auto_276629 ?auto_276638 ) ) ( not ( = ?auto_276630 ?auto_276631 ) ) ( not ( = ?auto_276630 ?auto_276632 ) ) ( not ( = ?auto_276630 ?auto_276633 ) ) ( not ( = ?auto_276630 ?auto_276634 ) ) ( not ( = ?auto_276630 ?auto_276635 ) ) ( not ( = ?auto_276630 ?auto_276636 ) ) ( not ( = ?auto_276630 ?auto_276637 ) ) ( not ( = ?auto_276630 ?auto_276638 ) ) ( not ( = ?auto_276631 ?auto_276632 ) ) ( not ( = ?auto_276631 ?auto_276633 ) ) ( not ( = ?auto_276631 ?auto_276634 ) ) ( not ( = ?auto_276631 ?auto_276635 ) ) ( not ( = ?auto_276631 ?auto_276636 ) ) ( not ( = ?auto_276631 ?auto_276637 ) ) ( not ( = ?auto_276631 ?auto_276638 ) ) ( not ( = ?auto_276632 ?auto_276633 ) ) ( not ( = ?auto_276632 ?auto_276634 ) ) ( not ( = ?auto_276632 ?auto_276635 ) ) ( not ( = ?auto_276632 ?auto_276636 ) ) ( not ( = ?auto_276632 ?auto_276637 ) ) ( not ( = ?auto_276632 ?auto_276638 ) ) ( not ( = ?auto_276633 ?auto_276634 ) ) ( not ( = ?auto_276633 ?auto_276635 ) ) ( not ( = ?auto_276633 ?auto_276636 ) ) ( not ( = ?auto_276633 ?auto_276637 ) ) ( not ( = ?auto_276633 ?auto_276638 ) ) ( not ( = ?auto_276634 ?auto_276635 ) ) ( not ( = ?auto_276634 ?auto_276636 ) ) ( not ( = ?auto_276634 ?auto_276637 ) ) ( not ( = ?auto_276634 ?auto_276638 ) ) ( not ( = ?auto_276635 ?auto_276636 ) ) ( not ( = ?auto_276635 ?auto_276637 ) ) ( not ( = ?auto_276635 ?auto_276638 ) ) ( not ( = ?auto_276636 ?auto_276637 ) ) ( not ( = ?auto_276636 ?auto_276638 ) ) ( not ( = ?auto_276637 ?auto_276638 ) ) ( CLEAR ?auto_276635 ) ( ON ?auto_276636 ?auto_276637 ) ( CLEAR ?auto_276636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_276627 ?auto_276628 ?auto_276629 ?auto_276630 ?auto_276631 ?auto_276632 ?auto_276633 ?auto_276634 ?auto_276635 ?auto_276636 )
      ( MAKE-11PILE ?auto_276627 ?auto_276628 ?auto_276629 ?auto_276630 ?auto_276631 ?auto_276632 ?auto_276633 ?auto_276634 ?auto_276635 ?auto_276636 ?auto_276637 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_276673 - BLOCK
      ?auto_276674 - BLOCK
      ?auto_276675 - BLOCK
      ?auto_276676 - BLOCK
      ?auto_276677 - BLOCK
      ?auto_276678 - BLOCK
      ?auto_276679 - BLOCK
      ?auto_276680 - BLOCK
      ?auto_276681 - BLOCK
      ?auto_276682 - BLOCK
      ?auto_276683 - BLOCK
    )
    :vars
    (
      ?auto_276684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_276683 ?auto_276684 ) ( ON-TABLE ?auto_276673 ) ( ON ?auto_276674 ?auto_276673 ) ( ON ?auto_276675 ?auto_276674 ) ( ON ?auto_276676 ?auto_276675 ) ( ON ?auto_276677 ?auto_276676 ) ( ON ?auto_276678 ?auto_276677 ) ( ON ?auto_276679 ?auto_276678 ) ( ON ?auto_276680 ?auto_276679 ) ( not ( = ?auto_276673 ?auto_276674 ) ) ( not ( = ?auto_276673 ?auto_276675 ) ) ( not ( = ?auto_276673 ?auto_276676 ) ) ( not ( = ?auto_276673 ?auto_276677 ) ) ( not ( = ?auto_276673 ?auto_276678 ) ) ( not ( = ?auto_276673 ?auto_276679 ) ) ( not ( = ?auto_276673 ?auto_276680 ) ) ( not ( = ?auto_276673 ?auto_276681 ) ) ( not ( = ?auto_276673 ?auto_276682 ) ) ( not ( = ?auto_276673 ?auto_276683 ) ) ( not ( = ?auto_276673 ?auto_276684 ) ) ( not ( = ?auto_276674 ?auto_276675 ) ) ( not ( = ?auto_276674 ?auto_276676 ) ) ( not ( = ?auto_276674 ?auto_276677 ) ) ( not ( = ?auto_276674 ?auto_276678 ) ) ( not ( = ?auto_276674 ?auto_276679 ) ) ( not ( = ?auto_276674 ?auto_276680 ) ) ( not ( = ?auto_276674 ?auto_276681 ) ) ( not ( = ?auto_276674 ?auto_276682 ) ) ( not ( = ?auto_276674 ?auto_276683 ) ) ( not ( = ?auto_276674 ?auto_276684 ) ) ( not ( = ?auto_276675 ?auto_276676 ) ) ( not ( = ?auto_276675 ?auto_276677 ) ) ( not ( = ?auto_276675 ?auto_276678 ) ) ( not ( = ?auto_276675 ?auto_276679 ) ) ( not ( = ?auto_276675 ?auto_276680 ) ) ( not ( = ?auto_276675 ?auto_276681 ) ) ( not ( = ?auto_276675 ?auto_276682 ) ) ( not ( = ?auto_276675 ?auto_276683 ) ) ( not ( = ?auto_276675 ?auto_276684 ) ) ( not ( = ?auto_276676 ?auto_276677 ) ) ( not ( = ?auto_276676 ?auto_276678 ) ) ( not ( = ?auto_276676 ?auto_276679 ) ) ( not ( = ?auto_276676 ?auto_276680 ) ) ( not ( = ?auto_276676 ?auto_276681 ) ) ( not ( = ?auto_276676 ?auto_276682 ) ) ( not ( = ?auto_276676 ?auto_276683 ) ) ( not ( = ?auto_276676 ?auto_276684 ) ) ( not ( = ?auto_276677 ?auto_276678 ) ) ( not ( = ?auto_276677 ?auto_276679 ) ) ( not ( = ?auto_276677 ?auto_276680 ) ) ( not ( = ?auto_276677 ?auto_276681 ) ) ( not ( = ?auto_276677 ?auto_276682 ) ) ( not ( = ?auto_276677 ?auto_276683 ) ) ( not ( = ?auto_276677 ?auto_276684 ) ) ( not ( = ?auto_276678 ?auto_276679 ) ) ( not ( = ?auto_276678 ?auto_276680 ) ) ( not ( = ?auto_276678 ?auto_276681 ) ) ( not ( = ?auto_276678 ?auto_276682 ) ) ( not ( = ?auto_276678 ?auto_276683 ) ) ( not ( = ?auto_276678 ?auto_276684 ) ) ( not ( = ?auto_276679 ?auto_276680 ) ) ( not ( = ?auto_276679 ?auto_276681 ) ) ( not ( = ?auto_276679 ?auto_276682 ) ) ( not ( = ?auto_276679 ?auto_276683 ) ) ( not ( = ?auto_276679 ?auto_276684 ) ) ( not ( = ?auto_276680 ?auto_276681 ) ) ( not ( = ?auto_276680 ?auto_276682 ) ) ( not ( = ?auto_276680 ?auto_276683 ) ) ( not ( = ?auto_276680 ?auto_276684 ) ) ( not ( = ?auto_276681 ?auto_276682 ) ) ( not ( = ?auto_276681 ?auto_276683 ) ) ( not ( = ?auto_276681 ?auto_276684 ) ) ( not ( = ?auto_276682 ?auto_276683 ) ) ( not ( = ?auto_276682 ?auto_276684 ) ) ( not ( = ?auto_276683 ?auto_276684 ) ) ( ON ?auto_276682 ?auto_276683 ) ( CLEAR ?auto_276680 ) ( ON ?auto_276681 ?auto_276682 ) ( CLEAR ?auto_276681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_276673 ?auto_276674 ?auto_276675 ?auto_276676 ?auto_276677 ?auto_276678 ?auto_276679 ?auto_276680 ?auto_276681 )
      ( MAKE-11PILE ?auto_276673 ?auto_276674 ?auto_276675 ?auto_276676 ?auto_276677 ?auto_276678 ?auto_276679 ?auto_276680 ?auto_276681 ?auto_276682 ?auto_276683 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_276719 - BLOCK
      ?auto_276720 - BLOCK
      ?auto_276721 - BLOCK
      ?auto_276722 - BLOCK
      ?auto_276723 - BLOCK
      ?auto_276724 - BLOCK
      ?auto_276725 - BLOCK
      ?auto_276726 - BLOCK
      ?auto_276727 - BLOCK
      ?auto_276728 - BLOCK
      ?auto_276729 - BLOCK
    )
    :vars
    (
      ?auto_276730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_276729 ?auto_276730 ) ( ON-TABLE ?auto_276719 ) ( ON ?auto_276720 ?auto_276719 ) ( ON ?auto_276721 ?auto_276720 ) ( ON ?auto_276722 ?auto_276721 ) ( ON ?auto_276723 ?auto_276722 ) ( ON ?auto_276724 ?auto_276723 ) ( ON ?auto_276725 ?auto_276724 ) ( not ( = ?auto_276719 ?auto_276720 ) ) ( not ( = ?auto_276719 ?auto_276721 ) ) ( not ( = ?auto_276719 ?auto_276722 ) ) ( not ( = ?auto_276719 ?auto_276723 ) ) ( not ( = ?auto_276719 ?auto_276724 ) ) ( not ( = ?auto_276719 ?auto_276725 ) ) ( not ( = ?auto_276719 ?auto_276726 ) ) ( not ( = ?auto_276719 ?auto_276727 ) ) ( not ( = ?auto_276719 ?auto_276728 ) ) ( not ( = ?auto_276719 ?auto_276729 ) ) ( not ( = ?auto_276719 ?auto_276730 ) ) ( not ( = ?auto_276720 ?auto_276721 ) ) ( not ( = ?auto_276720 ?auto_276722 ) ) ( not ( = ?auto_276720 ?auto_276723 ) ) ( not ( = ?auto_276720 ?auto_276724 ) ) ( not ( = ?auto_276720 ?auto_276725 ) ) ( not ( = ?auto_276720 ?auto_276726 ) ) ( not ( = ?auto_276720 ?auto_276727 ) ) ( not ( = ?auto_276720 ?auto_276728 ) ) ( not ( = ?auto_276720 ?auto_276729 ) ) ( not ( = ?auto_276720 ?auto_276730 ) ) ( not ( = ?auto_276721 ?auto_276722 ) ) ( not ( = ?auto_276721 ?auto_276723 ) ) ( not ( = ?auto_276721 ?auto_276724 ) ) ( not ( = ?auto_276721 ?auto_276725 ) ) ( not ( = ?auto_276721 ?auto_276726 ) ) ( not ( = ?auto_276721 ?auto_276727 ) ) ( not ( = ?auto_276721 ?auto_276728 ) ) ( not ( = ?auto_276721 ?auto_276729 ) ) ( not ( = ?auto_276721 ?auto_276730 ) ) ( not ( = ?auto_276722 ?auto_276723 ) ) ( not ( = ?auto_276722 ?auto_276724 ) ) ( not ( = ?auto_276722 ?auto_276725 ) ) ( not ( = ?auto_276722 ?auto_276726 ) ) ( not ( = ?auto_276722 ?auto_276727 ) ) ( not ( = ?auto_276722 ?auto_276728 ) ) ( not ( = ?auto_276722 ?auto_276729 ) ) ( not ( = ?auto_276722 ?auto_276730 ) ) ( not ( = ?auto_276723 ?auto_276724 ) ) ( not ( = ?auto_276723 ?auto_276725 ) ) ( not ( = ?auto_276723 ?auto_276726 ) ) ( not ( = ?auto_276723 ?auto_276727 ) ) ( not ( = ?auto_276723 ?auto_276728 ) ) ( not ( = ?auto_276723 ?auto_276729 ) ) ( not ( = ?auto_276723 ?auto_276730 ) ) ( not ( = ?auto_276724 ?auto_276725 ) ) ( not ( = ?auto_276724 ?auto_276726 ) ) ( not ( = ?auto_276724 ?auto_276727 ) ) ( not ( = ?auto_276724 ?auto_276728 ) ) ( not ( = ?auto_276724 ?auto_276729 ) ) ( not ( = ?auto_276724 ?auto_276730 ) ) ( not ( = ?auto_276725 ?auto_276726 ) ) ( not ( = ?auto_276725 ?auto_276727 ) ) ( not ( = ?auto_276725 ?auto_276728 ) ) ( not ( = ?auto_276725 ?auto_276729 ) ) ( not ( = ?auto_276725 ?auto_276730 ) ) ( not ( = ?auto_276726 ?auto_276727 ) ) ( not ( = ?auto_276726 ?auto_276728 ) ) ( not ( = ?auto_276726 ?auto_276729 ) ) ( not ( = ?auto_276726 ?auto_276730 ) ) ( not ( = ?auto_276727 ?auto_276728 ) ) ( not ( = ?auto_276727 ?auto_276729 ) ) ( not ( = ?auto_276727 ?auto_276730 ) ) ( not ( = ?auto_276728 ?auto_276729 ) ) ( not ( = ?auto_276728 ?auto_276730 ) ) ( not ( = ?auto_276729 ?auto_276730 ) ) ( ON ?auto_276728 ?auto_276729 ) ( ON ?auto_276727 ?auto_276728 ) ( CLEAR ?auto_276725 ) ( ON ?auto_276726 ?auto_276727 ) ( CLEAR ?auto_276726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_276719 ?auto_276720 ?auto_276721 ?auto_276722 ?auto_276723 ?auto_276724 ?auto_276725 ?auto_276726 )
      ( MAKE-11PILE ?auto_276719 ?auto_276720 ?auto_276721 ?auto_276722 ?auto_276723 ?auto_276724 ?auto_276725 ?auto_276726 ?auto_276727 ?auto_276728 ?auto_276729 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_276765 - BLOCK
      ?auto_276766 - BLOCK
      ?auto_276767 - BLOCK
      ?auto_276768 - BLOCK
      ?auto_276769 - BLOCK
      ?auto_276770 - BLOCK
      ?auto_276771 - BLOCK
      ?auto_276772 - BLOCK
      ?auto_276773 - BLOCK
      ?auto_276774 - BLOCK
      ?auto_276775 - BLOCK
    )
    :vars
    (
      ?auto_276776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_276775 ?auto_276776 ) ( ON-TABLE ?auto_276765 ) ( ON ?auto_276766 ?auto_276765 ) ( ON ?auto_276767 ?auto_276766 ) ( ON ?auto_276768 ?auto_276767 ) ( ON ?auto_276769 ?auto_276768 ) ( ON ?auto_276770 ?auto_276769 ) ( not ( = ?auto_276765 ?auto_276766 ) ) ( not ( = ?auto_276765 ?auto_276767 ) ) ( not ( = ?auto_276765 ?auto_276768 ) ) ( not ( = ?auto_276765 ?auto_276769 ) ) ( not ( = ?auto_276765 ?auto_276770 ) ) ( not ( = ?auto_276765 ?auto_276771 ) ) ( not ( = ?auto_276765 ?auto_276772 ) ) ( not ( = ?auto_276765 ?auto_276773 ) ) ( not ( = ?auto_276765 ?auto_276774 ) ) ( not ( = ?auto_276765 ?auto_276775 ) ) ( not ( = ?auto_276765 ?auto_276776 ) ) ( not ( = ?auto_276766 ?auto_276767 ) ) ( not ( = ?auto_276766 ?auto_276768 ) ) ( not ( = ?auto_276766 ?auto_276769 ) ) ( not ( = ?auto_276766 ?auto_276770 ) ) ( not ( = ?auto_276766 ?auto_276771 ) ) ( not ( = ?auto_276766 ?auto_276772 ) ) ( not ( = ?auto_276766 ?auto_276773 ) ) ( not ( = ?auto_276766 ?auto_276774 ) ) ( not ( = ?auto_276766 ?auto_276775 ) ) ( not ( = ?auto_276766 ?auto_276776 ) ) ( not ( = ?auto_276767 ?auto_276768 ) ) ( not ( = ?auto_276767 ?auto_276769 ) ) ( not ( = ?auto_276767 ?auto_276770 ) ) ( not ( = ?auto_276767 ?auto_276771 ) ) ( not ( = ?auto_276767 ?auto_276772 ) ) ( not ( = ?auto_276767 ?auto_276773 ) ) ( not ( = ?auto_276767 ?auto_276774 ) ) ( not ( = ?auto_276767 ?auto_276775 ) ) ( not ( = ?auto_276767 ?auto_276776 ) ) ( not ( = ?auto_276768 ?auto_276769 ) ) ( not ( = ?auto_276768 ?auto_276770 ) ) ( not ( = ?auto_276768 ?auto_276771 ) ) ( not ( = ?auto_276768 ?auto_276772 ) ) ( not ( = ?auto_276768 ?auto_276773 ) ) ( not ( = ?auto_276768 ?auto_276774 ) ) ( not ( = ?auto_276768 ?auto_276775 ) ) ( not ( = ?auto_276768 ?auto_276776 ) ) ( not ( = ?auto_276769 ?auto_276770 ) ) ( not ( = ?auto_276769 ?auto_276771 ) ) ( not ( = ?auto_276769 ?auto_276772 ) ) ( not ( = ?auto_276769 ?auto_276773 ) ) ( not ( = ?auto_276769 ?auto_276774 ) ) ( not ( = ?auto_276769 ?auto_276775 ) ) ( not ( = ?auto_276769 ?auto_276776 ) ) ( not ( = ?auto_276770 ?auto_276771 ) ) ( not ( = ?auto_276770 ?auto_276772 ) ) ( not ( = ?auto_276770 ?auto_276773 ) ) ( not ( = ?auto_276770 ?auto_276774 ) ) ( not ( = ?auto_276770 ?auto_276775 ) ) ( not ( = ?auto_276770 ?auto_276776 ) ) ( not ( = ?auto_276771 ?auto_276772 ) ) ( not ( = ?auto_276771 ?auto_276773 ) ) ( not ( = ?auto_276771 ?auto_276774 ) ) ( not ( = ?auto_276771 ?auto_276775 ) ) ( not ( = ?auto_276771 ?auto_276776 ) ) ( not ( = ?auto_276772 ?auto_276773 ) ) ( not ( = ?auto_276772 ?auto_276774 ) ) ( not ( = ?auto_276772 ?auto_276775 ) ) ( not ( = ?auto_276772 ?auto_276776 ) ) ( not ( = ?auto_276773 ?auto_276774 ) ) ( not ( = ?auto_276773 ?auto_276775 ) ) ( not ( = ?auto_276773 ?auto_276776 ) ) ( not ( = ?auto_276774 ?auto_276775 ) ) ( not ( = ?auto_276774 ?auto_276776 ) ) ( not ( = ?auto_276775 ?auto_276776 ) ) ( ON ?auto_276774 ?auto_276775 ) ( ON ?auto_276773 ?auto_276774 ) ( ON ?auto_276772 ?auto_276773 ) ( CLEAR ?auto_276770 ) ( ON ?auto_276771 ?auto_276772 ) ( CLEAR ?auto_276771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_276765 ?auto_276766 ?auto_276767 ?auto_276768 ?auto_276769 ?auto_276770 ?auto_276771 )
      ( MAKE-11PILE ?auto_276765 ?auto_276766 ?auto_276767 ?auto_276768 ?auto_276769 ?auto_276770 ?auto_276771 ?auto_276772 ?auto_276773 ?auto_276774 ?auto_276775 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_276811 - BLOCK
      ?auto_276812 - BLOCK
      ?auto_276813 - BLOCK
      ?auto_276814 - BLOCK
      ?auto_276815 - BLOCK
      ?auto_276816 - BLOCK
      ?auto_276817 - BLOCK
      ?auto_276818 - BLOCK
      ?auto_276819 - BLOCK
      ?auto_276820 - BLOCK
      ?auto_276821 - BLOCK
    )
    :vars
    (
      ?auto_276822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_276821 ?auto_276822 ) ( ON-TABLE ?auto_276811 ) ( ON ?auto_276812 ?auto_276811 ) ( ON ?auto_276813 ?auto_276812 ) ( ON ?auto_276814 ?auto_276813 ) ( ON ?auto_276815 ?auto_276814 ) ( not ( = ?auto_276811 ?auto_276812 ) ) ( not ( = ?auto_276811 ?auto_276813 ) ) ( not ( = ?auto_276811 ?auto_276814 ) ) ( not ( = ?auto_276811 ?auto_276815 ) ) ( not ( = ?auto_276811 ?auto_276816 ) ) ( not ( = ?auto_276811 ?auto_276817 ) ) ( not ( = ?auto_276811 ?auto_276818 ) ) ( not ( = ?auto_276811 ?auto_276819 ) ) ( not ( = ?auto_276811 ?auto_276820 ) ) ( not ( = ?auto_276811 ?auto_276821 ) ) ( not ( = ?auto_276811 ?auto_276822 ) ) ( not ( = ?auto_276812 ?auto_276813 ) ) ( not ( = ?auto_276812 ?auto_276814 ) ) ( not ( = ?auto_276812 ?auto_276815 ) ) ( not ( = ?auto_276812 ?auto_276816 ) ) ( not ( = ?auto_276812 ?auto_276817 ) ) ( not ( = ?auto_276812 ?auto_276818 ) ) ( not ( = ?auto_276812 ?auto_276819 ) ) ( not ( = ?auto_276812 ?auto_276820 ) ) ( not ( = ?auto_276812 ?auto_276821 ) ) ( not ( = ?auto_276812 ?auto_276822 ) ) ( not ( = ?auto_276813 ?auto_276814 ) ) ( not ( = ?auto_276813 ?auto_276815 ) ) ( not ( = ?auto_276813 ?auto_276816 ) ) ( not ( = ?auto_276813 ?auto_276817 ) ) ( not ( = ?auto_276813 ?auto_276818 ) ) ( not ( = ?auto_276813 ?auto_276819 ) ) ( not ( = ?auto_276813 ?auto_276820 ) ) ( not ( = ?auto_276813 ?auto_276821 ) ) ( not ( = ?auto_276813 ?auto_276822 ) ) ( not ( = ?auto_276814 ?auto_276815 ) ) ( not ( = ?auto_276814 ?auto_276816 ) ) ( not ( = ?auto_276814 ?auto_276817 ) ) ( not ( = ?auto_276814 ?auto_276818 ) ) ( not ( = ?auto_276814 ?auto_276819 ) ) ( not ( = ?auto_276814 ?auto_276820 ) ) ( not ( = ?auto_276814 ?auto_276821 ) ) ( not ( = ?auto_276814 ?auto_276822 ) ) ( not ( = ?auto_276815 ?auto_276816 ) ) ( not ( = ?auto_276815 ?auto_276817 ) ) ( not ( = ?auto_276815 ?auto_276818 ) ) ( not ( = ?auto_276815 ?auto_276819 ) ) ( not ( = ?auto_276815 ?auto_276820 ) ) ( not ( = ?auto_276815 ?auto_276821 ) ) ( not ( = ?auto_276815 ?auto_276822 ) ) ( not ( = ?auto_276816 ?auto_276817 ) ) ( not ( = ?auto_276816 ?auto_276818 ) ) ( not ( = ?auto_276816 ?auto_276819 ) ) ( not ( = ?auto_276816 ?auto_276820 ) ) ( not ( = ?auto_276816 ?auto_276821 ) ) ( not ( = ?auto_276816 ?auto_276822 ) ) ( not ( = ?auto_276817 ?auto_276818 ) ) ( not ( = ?auto_276817 ?auto_276819 ) ) ( not ( = ?auto_276817 ?auto_276820 ) ) ( not ( = ?auto_276817 ?auto_276821 ) ) ( not ( = ?auto_276817 ?auto_276822 ) ) ( not ( = ?auto_276818 ?auto_276819 ) ) ( not ( = ?auto_276818 ?auto_276820 ) ) ( not ( = ?auto_276818 ?auto_276821 ) ) ( not ( = ?auto_276818 ?auto_276822 ) ) ( not ( = ?auto_276819 ?auto_276820 ) ) ( not ( = ?auto_276819 ?auto_276821 ) ) ( not ( = ?auto_276819 ?auto_276822 ) ) ( not ( = ?auto_276820 ?auto_276821 ) ) ( not ( = ?auto_276820 ?auto_276822 ) ) ( not ( = ?auto_276821 ?auto_276822 ) ) ( ON ?auto_276820 ?auto_276821 ) ( ON ?auto_276819 ?auto_276820 ) ( ON ?auto_276818 ?auto_276819 ) ( ON ?auto_276817 ?auto_276818 ) ( CLEAR ?auto_276815 ) ( ON ?auto_276816 ?auto_276817 ) ( CLEAR ?auto_276816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_276811 ?auto_276812 ?auto_276813 ?auto_276814 ?auto_276815 ?auto_276816 )
      ( MAKE-11PILE ?auto_276811 ?auto_276812 ?auto_276813 ?auto_276814 ?auto_276815 ?auto_276816 ?auto_276817 ?auto_276818 ?auto_276819 ?auto_276820 ?auto_276821 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_276857 - BLOCK
      ?auto_276858 - BLOCK
      ?auto_276859 - BLOCK
      ?auto_276860 - BLOCK
      ?auto_276861 - BLOCK
      ?auto_276862 - BLOCK
      ?auto_276863 - BLOCK
      ?auto_276864 - BLOCK
      ?auto_276865 - BLOCK
      ?auto_276866 - BLOCK
      ?auto_276867 - BLOCK
    )
    :vars
    (
      ?auto_276868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_276867 ?auto_276868 ) ( ON-TABLE ?auto_276857 ) ( ON ?auto_276858 ?auto_276857 ) ( ON ?auto_276859 ?auto_276858 ) ( ON ?auto_276860 ?auto_276859 ) ( not ( = ?auto_276857 ?auto_276858 ) ) ( not ( = ?auto_276857 ?auto_276859 ) ) ( not ( = ?auto_276857 ?auto_276860 ) ) ( not ( = ?auto_276857 ?auto_276861 ) ) ( not ( = ?auto_276857 ?auto_276862 ) ) ( not ( = ?auto_276857 ?auto_276863 ) ) ( not ( = ?auto_276857 ?auto_276864 ) ) ( not ( = ?auto_276857 ?auto_276865 ) ) ( not ( = ?auto_276857 ?auto_276866 ) ) ( not ( = ?auto_276857 ?auto_276867 ) ) ( not ( = ?auto_276857 ?auto_276868 ) ) ( not ( = ?auto_276858 ?auto_276859 ) ) ( not ( = ?auto_276858 ?auto_276860 ) ) ( not ( = ?auto_276858 ?auto_276861 ) ) ( not ( = ?auto_276858 ?auto_276862 ) ) ( not ( = ?auto_276858 ?auto_276863 ) ) ( not ( = ?auto_276858 ?auto_276864 ) ) ( not ( = ?auto_276858 ?auto_276865 ) ) ( not ( = ?auto_276858 ?auto_276866 ) ) ( not ( = ?auto_276858 ?auto_276867 ) ) ( not ( = ?auto_276858 ?auto_276868 ) ) ( not ( = ?auto_276859 ?auto_276860 ) ) ( not ( = ?auto_276859 ?auto_276861 ) ) ( not ( = ?auto_276859 ?auto_276862 ) ) ( not ( = ?auto_276859 ?auto_276863 ) ) ( not ( = ?auto_276859 ?auto_276864 ) ) ( not ( = ?auto_276859 ?auto_276865 ) ) ( not ( = ?auto_276859 ?auto_276866 ) ) ( not ( = ?auto_276859 ?auto_276867 ) ) ( not ( = ?auto_276859 ?auto_276868 ) ) ( not ( = ?auto_276860 ?auto_276861 ) ) ( not ( = ?auto_276860 ?auto_276862 ) ) ( not ( = ?auto_276860 ?auto_276863 ) ) ( not ( = ?auto_276860 ?auto_276864 ) ) ( not ( = ?auto_276860 ?auto_276865 ) ) ( not ( = ?auto_276860 ?auto_276866 ) ) ( not ( = ?auto_276860 ?auto_276867 ) ) ( not ( = ?auto_276860 ?auto_276868 ) ) ( not ( = ?auto_276861 ?auto_276862 ) ) ( not ( = ?auto_276861 ?auto_276863 ) ) ( not ( = ?auto_276861 ?auto_276864 ) ) ( not ( = ?auto_276861 ?auto_276865 ) ) ( not ( = ?auto_276861 ?auto_276866 ) ) ( not ( = ?auto_276861 ?auto_276867 ) ) ( not ( = ?auto_276861 ?auto_276868 ) ) ( not ( = ?auto_276862 ?auto_276863 ) ) ( not ( = ?auto_276862 ?auto_276864 ) ) ( not ( = ?auto_276862 ?auto_276865 ) ) ( not ( = ?auto_276862 ?auto_276866 ) ) ( not ( = ?auto_276862 ?auto_276867 ) ) ( not ( = ?auto_276862 ?auto_276868 ) ) ( not ( = ?auto_276863 ?auto_276864 ) ) ( not ( = ?auto_276863 ?auto_276865 ) ) ( not ( = ?auto_276863 ?auto_276866 ) ) ( not ( = ?auto_276863 ?auto_276867 ) ) ( not ( = ?auto_276863 ?auto_276868 ) ) ( not ( = ?auto_276864 ?auto_276865 ) ) ( not ( = ?auto_276864 ?auto_276866 ) ) ( not ( = ?auto_276864 ?auto_276867 ) ) ( not ( = ?auto_276864 ?auto_276868 ) ) ( not ( = ?auto_276865 ?auto_276866 ) ) ( not ( = ?auto_276865 ?auto_276867 ) ) ( not ( = ?auto_276865 ?auto_276868 ) ) ( not ( = ?auto_276866 ?auto_276867 ) ) ( not ( = ?auto_276866 ?auto_276868 ) ) ( not ( = ?auto_276867 ?auto_276868 ) ) ( ON ?auto_276866 ?auto_276867 ) ( ON ?auto_276865 ?auto_276866 ) ( ON ?auto_276864 ?auto_276865 ) ( ON ?auto_276863 ?auto_276864 ) ( ON ?auto_276862 ?auto_276863 ) ( CLEAR ?auto_276860 ) ( ON ?auto_276861 ?auto_276862 ) ( CLEAR ?auto_276861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_276857 ?auto_276858 ?auto_276859 ?auto_276860 ?auto_276861 )
      ( MAKE-11PILE ?auto_276857 ?auto_276858 ?auto_276859 ?auto_276860 ?auto_276861 ?auto_276862 ?auto_276863 ?auto_276864 ?auto_276865 ?auto_276866 ?auto_276867 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_276903 - BLOCK
      ?auto_276904 - BLOCK
      ?auto_276905 - BLOCK
      ?auto_276906 - BLOCK
      ?auto_276907 - BLOCK
      ?auto_276908 - BLOCK
      ?auto_276909 - BLOCK
      ?auto_276910 - BLOCK
      ?auto_276911 - BLOCK
      ?auto_276912 - BLOCK
      ?auto_276913 - BLOCK
    )
    :vars
    (
      ?auto_276914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_276913 ?auto_276914 ) ( ON-TABLE ?auto_276903 ) ( ON ?auto_276904 ?auto_276903 ) ( ON ?auto_276905 ?auto_276904 ) ( not ( = ?auto_276903 ?auto_276904 ) ) ( not ( = ?auto_276903 ?auto_276905 ) ) ( not ( = ?auto_276903 ?auto_276906 ) ) ( not ( = ?auto_276903 ?auto_276907 ) ) ( not ( = ?auto_276903 ?auto_276908 ) ) ( not ( = ?auto_276903 ?auto_276909 ) ) ( not ( = ?auto_276903 ?auto_276910 ) ) ( not ( = ?auto_276903 ?auto_276911 ) ) ( not ( = ?auto_276903 ?auto_276912 ) ) ( not ( = ?auto_276903 ?auto_276913 ) ) ( not ( = ?auto_276903 ?auto_276914 ) ) ( not ( = ?auto_276904 ?auto_276905 ) ) ( not ( = ?auto_276904 ?auto_276906 ) ) ( not ( = ?auto_276904 ?auto_276907 ) ) ( not ( = ?auto_276904 ?auto_276908 ) ) ( not ( = ?auto_276904 ?auto_276909 ) ) ( not ( = ?auto_276904 ?auto_276910 ) ) ( not ( = ?auto_276904 ?auto_276911 ) ) ( not ( = ?auto_276904 ?auto_276912 ) ) ( not ( = ?auto_276904 ?auto_276913 ) ) ( not ( = ?auto_276904 ?auto_276914 ) ) ( not ( = ?auto_276905 ?auto_276906 ) ) ( not ( = ?auto_276905 ?auto_276907 ) ) ( not ( = ?auto_276905 ?auto_276908 ) ) ( not ( = ?auto_276905 ?auto_276909 ) ) ( not ( = ?auto_276905 ?auto_276910 ) ) ( not ( = ?auto_276905 ?auto_276911 ) ) ( not ( = ?auto_276905 ?auto_276912 ) ) ( not ( = ?auto_276905 ?auto_276913 ) ) ( not ( = ?auto_276905 ?auto_276914 ) ) ( not ( = ?auto_276906 ?auto_276907 ) ) ( not ( = ?auto_276906 ?auto_276908 ) ) ( not ( = ?auto_276906 ?auto_276909 ) ) ( not ( = ?auto_276906 ?auto_276910 ) ) ( not ( = ?auto_276906 ?auto_276911 ) ) ( not ( = ?auto_276906 ?auto_276912 ) ) ( not ( = ?auto_276906 ?auto_276913 ) ) ( not ( = ?auto_276906 ?auto_276914 ) ) ( not ( = ?auto_276907 ?auto_276908 ) ) ( not ( = ?auto_276907 ?auto_276909 ) ) ( not ( = ?auto_276907 ?auto_276910 ) ) ( not ( = ?auto_276907 ?auto_276911 ) ) ( not ( = ?auto_276907 ?auto_276912 ) ) ( not ( = ?auto_276907 ?auto_276913 ) ) ( not ( = ?auto_276907 ?auto_276914 ) ) ( not ( = ?auto_276908 ?auto_276909 ) ) ( not ( = ?auto_276908 ?auto_276910 ) ) ( not ( = ?auto_276908 ?auto_276911 ) ) ( not ( = ?auto_276908 ?auto_276912 ) ) ( not ( = ?auto_276908 ?auto_276913 ) ) ( not ( = ?auto_276908 ?auto_276914 ) ) ( not ( = ?auto_276909 ?auto_276910 ) ) ( not ( = ?auto_276909 ?auto_276911 ) ) ( not ( = ?auto_276909 ?auto_276912 ) ) ( not ( = ?auto_276909 ?auto_276913 ) ) ( not ( = ?auto_276909 ?auto_276914 ) ) ( not ( = ?auto_276910 ?auto_276911 ) ) ( not ( = ?auto_276910 ?auto_276912 ) ) ( not ( = ?auto_276910 ?auto_276913 ) ) ( not ( = ?auto_276910 ?auto_276914 ) ) ( not ( = ?auto_276911 ?auto_276912 ) ) ( not ( = ?auto_276911 ?auto_276913 ) ) ( not ( = ?auto_276911 ?auto_276914 ) ) ( not ( = ?auto_276912 ?auto_276913 ) ) ( not ( = ?auto_276912 ?auto_276914 ) ) ( not ( = ?auto_276913 ?auto_276914 ) ) ( ON ?auto_276912 ?auto_276913 ) ( ON ?auto_276911 ?auto_276912 ) ( ON ?auto_276910 ?auto_276911 ) ( ON ?auto_276909 ?auto_276910 ) ( ON ?auto_276908 ?auto_276909 ) ( ON ?auto_276907 ?auto_276908 ) ( CLEAR ?auto_276905 ) ( ON ?auto_276906 ?auto_276907 ) ( CLEAR ?auto_276906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_276903 ?auto_276904 ?auto_276905 ?auto_276906 )
      ( MAKE-11PILE ?auto_276903 ?auto_276904 ?auto_276905 ?auto_276906 ?auto_276907 ?auto_276908 ?auto_276909 ?auto_276910 ?auto_276911 ?auto_276912 ?auto_276913 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_276949 - BLOCK
      ?auto_276950 - BLOCK
      ?auto_276951 - BLOCK
      ?auto_276952 - BLOCK
      ?auto_276953 - BLOCK
      ?auto_276954 - BLOCK
      ?auto_276955 - BLOCK
      ?auto_276956 - BLOCK
      ?auto_276957 - BLOCK
      ?auto_276958 - BLOCK
      ?auto_276959 - BLOCK
    )
    :vars
    (
      ?auto_276960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_276959 ?auto_276960 ) ( ON-TABLE ?auto_276949 ) ( ON ?auto_276950 ?auto_276949 ) ( not ( = ?auto_276949 ?auto_276950 ) ) ( not ( = ?auto_276949 ?auto_276951 ) ) ( not ( = ?auto_276949 ?auto_276952 ) ) ( not ( = ?auto_276949 ?auto_276953 ) ) ( not ( = ?auto_276949 ?auto_276954 ) ) ( not ( = ?auto_276949 ?auto_276955 ) ) ( not ( = ?auto_276949 ?auto_276956 ) ) ( not ( = ?auto_276949 ?auto_276957 ) ) ( not ( = ?auto_276949 ?auto_276958 ) ) ( not ( = ?auto_276949 ?auto_276959 ) ) ( not ( = ?auto_276949 ?auto_276960 ) ) ( not ( = ?auto_276950 ?auto_276951 ) ) ( not ( = ?auto_276950 ?auto_276952 ) ) ( not ( = ?auto_276950 ?auto_276953 ) ) ( not ( = ?auto_276950 ?auto_276954 ) ) ( not ( = ?auto_276950 ?auto_276955 ) ) ( not ( = ?auto_276950 ?auto_276956 ) ) ( not ( = ?auto_276950 ?auto_276957 ) ) ( not ( = ?auto_276950 ?auto_276958 ) ) ( not ( = ?auto_276950 ?auto_276959 ) ) ( not ( = ?auto_276950 ?auto_276960 ) ) ( not ( = ?auto_276951 ?auto_276952 ) ) ( not ( = ?auto_276951 ?auto_276953 ) ) ( not ( = ?auto_276951 ?auto_276954 ) ) ( not ( = ?auto_276951 ?auto_276955 ) ) ( not ( = ?auto_276951 ?auto_276956 ) ) ( not ( = ?auto_276951 ?auto_276957 ) ) ( not ( = ?auto_276951 ?auto_276958 ) ) ( not ( = ?auto_276951 ?auto_276959 ) ) ( not ( = ?auto_276951 ?auto_276960 ) ) ( not ( = ?auto_276952 ?auto_276953 ) ) ( not ( = ?auto_276952 ?auto_276954 ) ) ( not ( = ?auto_276952 ?auto_276955 ) ) ( not ( = ?auto_276952 ?auto_276956 ) ) ( not ( = ?auto_276952 ?auto_276957 ) ) ( not ( = ?auto_276952 ?auto_276958 ) ) ( not ( = ?auto_276952 ?auto_276959 ) ) ( not ( = ?auto_276952 ?auto_276960 ) ) ( not ( = ?auto_276953 ?auto_276954 ) ) ( not ( = ?auto_276953 ?auto_276955 ) ) ( not ( = ?auto_276953 ?auto_276956 ) ) ( not ( = ?auto_276953 ?auto_276957 ) ) ( not ( = ?auto_276953 ?auto_276958 ) ) ( not ( = ?auto_276953 ?auto_276959 ) ) ( not ( = ?auto_276953 ?auto_276960 ) ) ( not ( = ?auto_276954 ?auto_276955 ) ) ( not ( = ?auto_276954 ?auto_276956 ) ) ( not ( = ?auto_276954 ?auto_276957 ) ) ( not ( = ?auto_276954 ?auto_276958 ) ) ( not ( = ?auto_276954 ?auto_276959 ) ) ( not ( = ?auto_276954 ?auto_276960 ) ) ( not ( = ?auto_276955 ?auto_276956 ) ) ( not ( = ?auto_276955 ?auto_276957 ) ) ( not ( = ?auto_276955 ?auto_276958 ) ) ( not ( = ?auto_276955 ?auto_276959 ) ) ( not ( = ?auto_276955 ?auto_276960 ) ) ( not ( = ?auto_276956 ?auto_276957 ) ) ( not ( = ?auto_276956 ?auto_276958 ) ) ( not ( = ?auto_276956 ?auto_276959 ) ) ( not ( = ?auto_276956 ?auto_276960 ) ) ( not ( = ?auto_276957 ?auto_276958 ) ) ( not ( = ?auto_276957 ?auto_276959 ) ) ( not ( = ?auto_276957 ?auto_276960 ) ) ( not ( = ?auto_276958 ?auto_276959 ) ) ( not ( = ?auto_276958 ?auto_276960 ) ) ( not ( = ?auto_276959 ?auto_276960 ) ) ( ON ?auto_276958 ?auto_276959 ) ( ON ?auto_276957 ?auto_276958 ) ( ON ?auto_276956 ?auto_276957 ) ( ON ?auto_276955 ?auto_276956 ) ( ON ?auto_276954 ?auto_276955 ) ( ON ?auto_276953 ?auto_276954 ) ( ON ?auto_276952 ?auto_276953 ) ( CLEAR ?auto_276950 ) ( ON ?auto_276951 ?auto_276952 ) ( CLEAR ?auto_276951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_276949 ?auto_276950 ?auto_276951 )
      ( MAKE-11PILE ?auto_276949 ?auto_276950 ?auto_276951 ?auto_276952 ?auto_276953 ?auto_276954 ?auto_276955 ?auto_276956 ?auto_276957 ?auto_276958 ?auto_276959 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_276995 - BLOCK
      ?auto_276996 - BLOCK
      ?auto_276997 - BLOCK
      ?auto_276998 - BLOCK
      ?auto_276999 - BLOCK
      ?auto_277000 - BLOCK
      ?auto_277001 - BLOCK
      ?auto_277002 - BLOCK
      ?auto_277003 - BLOCK
      ?auto_277004 - BLOCK
      ?auto_277005 - BLOCK
    )
    :vars
    (
      ?auto_277006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_277005 ?auto_277006 ) ( ON-TABLE ?auto_276995 ) ( not ( = ?auto_276995 ?auto_276996 ) ) ( not ( = ?auto_276995 ?auto_276997 ) ) ( not ( = ?auto_276995 ?auto_276998 ) ) ( not ( = ?auto_276995 ?auto_276999 ) ) ( not ( = ?auto_276995 ?auto_277000 ) ) ( not ( = ?auto_276995 ?auto_277001 ) ) ( not ( = ?auto_276995 ?auto_277002 ) ) ( not ( = ?auto_276995 ?auto_277003 ) ) ( not ( = ?auto_276995 ?auto_277004 ) ) ( not ( = ?auto_276995 ?auto_277005 ) ) ( not ( = ?auto_276995 ?auto_277006 ) ) ( not ( = ?auto_276996 ?auto_276997 ) ) ( not ( = ?auto_276996 ?auto_276998 ) ) ( not ( = ?auto_276996 ?auto_276999 ) ) ( not ( = ?auto_276996 ?auto_277000 ) ) ( not ( = ?auto_276996 ?auto_277001 ) ) ( not ( = ?auto_276996 ?auto_277002 ) ) ( not ( = ?auto_276996 ?auto_277003 ) ) ( not ( = ?auto_276996 ?auto_277004 ) ) ( not ( = ?auto_276996 ?auto_277005 ) ) ( not ( = ?auto_276996 ?auto_277006 ) ) ( not ( = ?auto_276997 ?auto_276998 ) ) ( not ( = ?auto_276997 ?auto_276999 ) ) ( not ( = ?auto_276997 ?auto_277000 ) ) ( not ( = ?auto_276997 ?auto_277001 ) ) ( not ( = ?auto_276997 ?auto_277002 ) ) ( not ( = ?auto_276997 ?auto_277003 ) ) ( not ( = ?auto_276997 ?auto_277004 ) ) ( not ( = ?auto_276997 ?auto_277005 ) ) ( not ( = ?auto_276997 ?auto_277006 ) ) ( not ( = ?auto_276998 ?auto_276999 ) ) ( not ( = ?auto_276998 ?auto_277000 ) ) ( not ( = ?auto_276998 ?auto_277001 ) ) ( not ( = ?auto_276998 ?auto_277002 ) ) ( not ( = ?auto_276998 ?auto_277003 ) ) ( not ( = ?auto_276998 ?auto_277004 ) ) ( not ( = ?auto_276998 ?auto_277005 ) ) ( not ( = ?auto_276998 ?auto_277006 ) ) ( not ( = ?auto_276999 ?auto_277000 ) ) ( not ( = ?auto_276999 ?auto_277001 ) ) ( not ( = ?auto_276999 ?auto_277002 ) ) ( not ( = ?auto_276999 ?auto_277003 ) ) ( not ( = ?auto_276999 ?auto_277004 ) ) ( not ( = ?auto_276999 ?auto_277005 ) ) ( not ( = ?auto_276999 ?auto_277006 ) ) ( not ( = ?auto_277000 ?auto_277001 ) ) ( not ( = ?auto_277000 ?auto_277002 ) ) ( not ( = ?auto_277000 ?auto_277003 ) ) ( not ( = ?auto_277000 ?auto_277004 ) ) ( not ( = ?auto_277000 ?auto_277005 ) ) ( not ( = ?auto_277000 ?auto_277006 ) ) ( not ( = ?auto_277001 ?auto_277002 ) ) ( not ( = ?auto_277001 ?auto_277003 ) ) ( not ( = ?auto_277001 ?auto_277004 ) ) ( not ( = ?auto_277001 ?auto_277005 ) ) ( not ( = ?auto_277001 ?auto_277006 ) ) ( not ( = ?auto_277002 ?auto_277003 ) ) ( not ( = ?auto_277002 ?auto_277004 ) ) ( not ( = ?auto_277002 ?auto_277005 ) ) ( not ( = ?auto_277002 ?auto_277006 ) ) ( not ( = ?auto_277003 ?auto_277004 ) ) ( not ( = ?auto_277003 ?auto_277005 ) ) ( not ( = ?auto_277003 ?auto_277006 ) ) ( not ( = ?auto_277004 ?auto_277005 ) ) ( not ( = ?auto_277004 ?auto_277006 ) ) ( not ( = ?auto_277005 ?auto_277006 ) ) ( ON ?auto_277004 ?auto_277005 ) ( ON ?auto_277003 ?auto_277004 ) ( ON ?auto_277002 ?auto_277003 ) ( ON ?auto_277001 ?auto_277002 ) ( ON ?auto_277000 ?auto_277001 ) ( ON ?auto_276999 ?auto_277000 ) ( ON ?auto_276998 ?auto_276999 ) ( ON ?auto_276997 ?auto_276998 ) ( CLEAR ?auto_276995 ) ( ON ?auto_276996 ?auto_276997 ) ( CLEAR ?auto_276996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_276995 ?auto_276996 )
      ( MAKE-11PILE ?auto_276995 ?auto_276996 ?auto_276997 ?auto_276998 ?auto_276999 ?auto_277000 ?auto_277001 ?auto_277002 ?auto_277003 ?auto_277004 ?auto_277005 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_277041 - BLOCK
      ?auto_277042 - BLOCK
      ?auto_277043 - BLOCK
      ?auto_277044 - BLOCK
      ?auto_277045 - BLOCK
      ?auto_277046 - BLOCK
      ?auto_277047 - BLOCK
      ?auto_277048 - BLOCK
      ?auto_277049 - BLOCK
      ?auto_277050 - BLOCK
      ?auto_277051 - BLOCK
    )
    :vars
    (
      ?auto_277052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_277051 ?auto_277052 ) ( not ( = ?auto_277041 ?auto_277042 ) ) ( not ( = ?auto_277041 ?auto_277043 ) ) ( not ( = ?auto_277041 ?auto_277044 ) ) ( not ( = ?auto_277041 ?auto_277045 ) ) ( not ( = ?auto_277041 ?auto_277046 ) ) ( not ( = ?auto_277041 ?auto_277047 ) ) ( not ( = ?auto_277041 ?auto_277048 ) ) ( not ( = ?auto_277041 ?auto_277049 ) ) ( not ( = ?auto_277041 ?auto_277050 ) ) ( not ( = ?auto_277041 ?auto_277051 ) ) ( not ( = ?auto_277041 ?auto_277052 ) ) ( not ( = ?auto_277042 ?auto_277043 ) ) ( not ( = ?auto_277042 ?auto_277044 ) ) ( not ( = ?auto_277042 ?auto_277045 ) ) ( not ( = ?auto_277042 ?auto_277046 ) ) ( not ( = ?auto_277042 ?auto_277047 ) ) ( not ( = ?auto_277042 ?auto_277048 ) ) ( not ( = ?auto_277042 ?auto_277049 ) ) ( not ( = ?auto_277042 ?auto_277050 ) ) ( not ( = ?auto_277042 ?auto_277051 ) ) ( not ( = ?auto_277042 ?auto_277052 ) ) ( not ( = ?auto_277043 ?auto_277044 ) ) ( not ( = ?auto_277043 ?auto_277045 ) ) ( not ( = ?auto_277043 ?auto_277046 ) ) ( not ( = ?auto_277043 ?auto_277047 ) ) ( not ( = ?auto_277043 ?auto_277048 ) ) ( not ( = ?auto_277043 ?auto_277049 ) ) ( not ( = ?auto_277043 ?auto_277050 ) ) ( not ( = ?auto_277043 ?auto_277051 ) ) ( not ( = ?auto_277043 ?auto_277052 ) ) ( not ( = ?auto_277044 ?auto_277045 ) ) ( not ( = ?auto_277044 ?auto_277046 ) ) ( not ( = ?auto_277044 ?auto_277047 ) ) ( not ( = ?auto_277044 ?auto_277048 ) ) ( not ( = ?auto_277044 ?auto_277049 ) ) ( not ( = ?auto_277044 ?auto_277050 ) ) ( not ( = ?auto_277044 ?auto_277051 ) ) ( not ( = ?auto_277044 ?auto_277052 ) ) ( not ( = ?auto_277045 ?auto_277046 ) ) ( not ( = ?auto_277045 ?auto_277047 ) ) ( not ( = ?auto_277045 ?auto_277048 ) ) ( not ( = ?auto_277045 ?auto_277049 ) ) ( not ( = ?auto_277045 ?auto_277050 ) ) ( not ( = ?auto_277045 ?auto_277051 ) ) ( not ( = ?auto_277045 ?auto_277052 ) ) ( not ( = ?auto_277046 ?auto_277047 ) ) ( not ( = ?auto_277046 ?auto_277048 ) ) ( not ( = ?auto_277046 ?auto_277049 ) ) ( not ( = ?auto_277046 ?auto_277050 ) ) ( not ( = ?auto_277046 ?auto_277051 ) ) ( not ( = ?auto_277046 ?auto_277052 ) ) ( not ( = ?auto_277047 ?auto_277048 ) ) ( not ( = ?auto_277047 ?auto_277049 ) ) ( not ( = ?auto_277047 ?auto_277050 ) ) ( not ( = ?auto_277047 ?auto_277051 ) ) ( not ( = ?auto_277047 ?auto_277052 ) ) ( not ( = ?auto_277048 ?auto_277049 ) ) ( not ( = ?auto_277048 ?auto_277050 ) ) ( not ( = ?auto_277048 ?auto_277051 ) ) ( not ( = ?auto_277048 ?auto_277052 ) ) ( not ( = ?auto_277049 ?auto_277050 ) ) ( not ( = ?auto_277049 ?auto_277051 ) ) ( not ( = ?auto_277049 ?auto_277052 ) ) ( not ( = ?auto_277050 ?auto_277051 ) ) ( not ( = ?auto_277050 ?auto_277052 ) ) ( not ( = ?auto_277051 ?auto_277052 ) ) ( ON ?auto_277050 ?auto_277051 ) ( ON ?auto_277049 ?auto_277050 ) ( ON ?auto_277048 ?auto_277049 ) ( ON ?auto_277047 ?auto_277048 ) ( ON ?auto_277046 ?auto_277047 ) ( ON ?auto_277045 ?auto_277046 ) ( ON ?auto_277044 ?auto_277045 ) ( ON ?auto_277043 ?auto_277044 ) ( ON ?auto_277042 ?auto_277043 ) ( ON ?auto_277041 ?auto_277042 ) ( CLEAR ?auto_277041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_277041 )
      ( MAKE-11PILE ?auto_277041 ?auto_277042 ?auto_277043 ?auto_277044 ?auto_277045 ?auto_277046 ?auto_277047 ?auto_277048 ?auto_277049 ?auto_277050 ?auto_277051 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_277088 - BLOCK
      ?auto_277089 - BLOCK
      ?auto_277090 - BLOCK
      ?auto_277091 - BLOCK
      ?auto_277092 - BLOCK
      ?auto_277093 - BLOCK
      ?auto_277094 - BLOCK
      ?auto_277095 - BLOCK
      ?auto_277096 - BLOCK
      ?auto_277097 - BLOCK
      ?auto_277098 - BLOCK
      ?auto_277099 - BLOCK
    )
    :vars
    (
      ?auto_277100 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_277098 ) ( ON ?auto_277099 ?auto_277100 ) ( CLEAR ?auto_277099 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_277088 ) ( ON ?auto_277089 ?auto_277088 ) ( ON ?auto_277090 ?auto_277089 ) ( ON ?auto_277091 ?auto_277090 ) ( ON ?auto_277092 ?auto_277091 ) ( ON ?auto_277093 ?auto_277092 ) ( ON ?auto_277094 ?auto_277093 ) ( ON ?auto_277095 ?auto_277094 ) ( ON ?auto_277096 ?auto_277095 ) ( ON ?auto_277097 ?auto_277096 ) ( ON ?auto_277098 ?auto_277097 ) ( not ( = ?auto_277088 ?auto_277089 ) ) ( not ( = ?auto_277088 ?auto_277090 ) ) ( not ( = ?auto_277088 ?auto_277091 ) ) ( not ( = ?auto_277088 ?auto_277092 ) ) ( not ( = ?auto_277088 ?auto_277093 ) ) ( not ( = ?auto_277088 ?auto_277094 ) ) ( not ( = ?auto_277088 ?auto_277095 ) ) ( not ( = ?auto_277088 ?auto_277096 ) ) ( not ( = ?auto_277088 ?auto_277097 ) ) ( not ( = ?auto_277088 ?auto_277098 ) ) ( not ( = ?auto_277088 ?auto_277099 ) ) ( not ( = ?auto_277088 ?auto_277100 ) ) ( not ( = ?auto_277089 ?auto_277090 ) ) ( not ( = ?auto_277089 ?auto_277091 ) ) ( not ( = ?auto_277089 ?auto_277092 ) ) ( not ( = ?auto_277089 ?auto_277093 ) ) ( not ( = ?auto_277089 ?auto_277094 ) ) ( not ( = ?auto_277089 ?auto_277095 ) ) ( not ( = ?auto_277089 ?auto_277096 ) ) ( not ( = ?auto_277089 ?auto_277097 ) ) ( not ( = ?auto_277089 ?auto_277098 ) ) ( not ( = ?auto_277089 ?auto_277099 ) ) ( not ( = ?auto_277089 ?auto_277100 ) ) ( not ( = ?auto_277090 ?auto_277091 ) ) ( not ( = ?auto_277090 ?auto_277092 ) ) ( not ( = ?auto_277090 ?auto_277093 ) ) ( not ( = ?auto_277090 ?auto_277094 ) ) ( not ( = ?auto_277090 ?auto_277095 ) ) ( not ( = ?auto_277090 ?auto_277096 ) ) ( not ( = ?auto_277090 ?auto_277097 ) ) ( not ( = ?auto_277090 ?auto_277098 ) ) ( not ( = ?auto_277090 ?auto_277099 ) ) ( not ( = ?auto_277090 ?auto_277100 ) ) ( not ( = ?auto_277091 ?auto_277092 ) ) ( not ( = ?auto_277091 ?auto_277093 ) ) ( not ( = ?auto_277091 ?auto_277094 ) ) ( not ( = ?auto_277091 ?auto_277095 ) ) ( not ( = ?auto_277091 ?auto_277096 ) ) ( not ( = ?auto_277091 ?auto_277097 ) ) ( not ( = ?auto_277091 ?auto_277098 ) ) ( not ( = ?auto_277091 ?auto_277099 ) ) ( not ( = ?auto_277091 ?auto_277100 ) ) ( not ( = ?auto_277092 ?auto_277093 ) ) ( not ( = ?auto_277092 ?auto_277094 ) ) ( not ( = ?auto_277092 ?auto_277095 ) ) ( not ( = ?auto_277092 ?auto_277096 ) ) ( not ( = ?auto_277092 ?auto_277097 ) ) ( not ( = ?auto_277092 ?auto_277098 ) ) ( not ( = ?auto_277092 ?auto_277099 ) ) ( not ( = ?auto_277092 ?auto_277100 ) ) ( not ( = ?auto_277093 ?auto_277094 ) ) ( not ( = ?auto_277093 ?auto_277095 ) ) ( not ( = ?auto_277093 ?auto_277096 ) ) ( not ( = ?auto_277093 ?auto_277097 ) ) ( not ( = ?auto_277093 ?auto_277098 ) ) ( not ( = ?auto_277093 ?auto_277099 ) ) ( not ( = ?auto_277093 ?auto_277100 ) ) ( not ( = ?auto_277094 ?auto_277095 ) ) ( not ( = ?auto_277094 ?auto_277096 ) ) ( not ( = ?auto_277094 ?auto_277097 ) ) ( not ( = ?auto_277094 ?auto_277098 ) ) ( not ( = ?auto_277094 ?auto_277099 ) ) ( not ( = ?auto_277094 ?auto_277100 ) ) ( not ( = ?auto_277095 ?auto_277096 ) ) ( not ( = ?auto_277095 ?auto_277097 ) ) ( not ( = ?auto_277095 ?auto_277098 ) ) ( not ( = ?auto_277095 ?auto_277099 ) ) ( not ( = ?auto_277095 ?auto_277100 ) ) ( not ( = ?auto_277096 ?auto_277097 ) ) ( not ( = ?auto_277096 ?auto_277098 ) ) ( not ( = ?auto_277096 ?auto_277099 ) ) ( not ( = ?auto_277096 ?auto_277100 ) ) ( not ( = ?auto_277097 ?auto_277098 ) ) ( not ( = ?auto_277097 ?auto_277099 ) ) ( not ( = ?auto_277097 ?auto_277100 ) ) ( not ( = ?auto_277098 ?auto_277099 ) ) ( not ( = ?auto_277098 ?auto_277100 ) ) ( not ( = ?auto_277099 ?auto_277100 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_277099 ?auto_277100 )
      ( !STACK ?auto_277099 ?auto_277098 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_277138 - BLOCK
      ?auto_277139 - BLOCK
      ?auto_277140 - BLOCK
      ?auto_277141 - BLOCK
      ?auto_277142 - BLOCK
      ?auto_277143 - BLOCK
      ?auto_277144 - BLOCK
      ?auto_277145 - BLOCK
      ?auto_277146 - BLOCK
      ?auto_277147 - BLOCK
      ?auto_277148 - BLOCK
      ?auto_277149 - BLOCK
    )
    :vars
    (
      ?auto_277150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_277149 ?auto_277150 ) ( ON-TABLE ?auto_277138 ) ( ON ?auto_277139 ?auto_277138 ) ( ON ?auto_277140 ?auto_277139 ) ( ON ?auto_277141 ?auto_277140 ) ( ON ?auto_277142 ?auto_277141 ) ( ON ?auto_277143 ?auto_277142 ) ( ON ?auto_277144 ?auto_277143 ) ( ON ?auto_277145 ?auto_277144 ) ( ON ?auto_277146 ?auto_277145 ) ( ON ?auto_277147 ?auto_277146 ) ( not ( = ?auto_277138 ?auto_277139 ) ) ( not ( = ?auto_277138 ?auto_277140 ) ) ( not ( = ?auto_277138 ?auto_277141 ) ) ( not ( = ?auto_277138 ?auto_277142 ) ) ( not ( = ?auto_277138 ?auto_277143 ) ) ( not ( = ?auto_277138 ?auto_277144 ) ) ( not ( = ?auto_277138 ?auto_277145 ) ) ( not ( = ?auto_277138 ?auto_277146 ) ) ( not ( = ?auto_277138 ?auto_277147 ) ) ( not ( = ?auto_277138 ?auto_277148 ) ) ( not ( = ?auto_277138 ?auto_277149 ) ) ( not ( = ?auto_277138 ?auto_277150 ) ) ( not ( = ?auto_277139 ?auto_277140 ) ) ( not ( = ?auto_277139 ?auto_277141 ) ) ( not ( = ?auto_277139 ?auto_277142 ) ) ( not ( = ?auto_277139 ?auto_277143 ) ) ( not ( = ?auto_277139 ?auto_277144 ) ) ( not ( = ?auto_277139 ?auto_277145 ) ) ( not ( = ?auto_277139 ?auto_277146 ) ) ( not ( = ?auto_277139 ?auto_277147 ) ) ( not ( = ?auto_277139 ?auto_277148 ) ) ( not ( = ?auto_277139 ?auto_277149 ) ) ( not ( = ?auto_277139 ?auto_277150 ) ) ( not ( = ?auto_277140 ?auto_277141 ) ) ( not ( = ?auto_277140 ?auto_277142 ) ) ( not ( = ?auto_277140 ?auto_277143 ) ) ( not ( = ?auto_277140 ?auto_277144 ) ) ( not ( = ?auto_277140 ?auto_277145 ) ) ( not ( = ?auto_277140 ?auto_277146 ) ) ( not ( = ?auto_277140 ?auto_277147 ) ) ( not ( = ?auto_277140 ?auto_277148 ) ) ( not ( = ?auto_277140 ?auto_277149 ) ) ( not ( = ?auto_277140 ?auto_277150 ) ) ( not ( = ?auto_277141 ?auto_277142 ) ) ( not ( = ?auto_277141 ?auto_277143 ) ) ( not ( = ?auto_277141 ?auto_277144 ) ) ( not ( = ?auto_277141 ?auto_277145 ) ) ( not ( = ?auto_277141 ?auto_277146 ) ) ( not ( = ?auto_277141 ?auto_277147 ) ) ( not ( = ?auto_277141 ?auto_277148 ) ) ( not ( = ?auto_277141 ?auto_277149 ) ) ( not ( = ?auto_277141 ?auto_277150 ) ) ( not ( = ?auto_277142 ?auto_277143 ) ) ( not ( = ?auto_277142 ?auto_277144 ) ) ( not ( = ?auto_277142 ?auto_277145 ) ) ( not ( = ?auto_277142 ?auto_277146 ) ) ( not ( = ?auto_277142 ?auto_277147 ) ) ( not ( = ?auto_277142 ?auto_277148 ) ) ( not ( = ?auto_277142 ?auto_277149 ) ) ( not ( = ?auto_277142 ?auto_277150 ) ) ( not ( = ?auto_277143 ?auto_277144 ) ) ( not ( = ?auto_277143 ?auto_277145 ) ) ( not ( = ?auto_277143 ?auto_277146 ) ) ( not ( = ?auto_277143 ?auto_277147 ) ) ( not ( = ?auto_277143 ?auto_277148 ) ) ( not ( = ?auto_277143 ?auto_277149 ) ) ( not ( = ?auto_277143 ?auto_277150 ) ) ( not ( = ?auto_277144 ?auto_277145 ) ) ( not ( = ?auto_277144 ?auto_277146 ) ) ( not ( = ?auto_277144 ?auto_277147 ) ) ( not ( = ?auto_277144 ?auto_277148 ) ) ( not ( = ?auto_277144 ?auto_277149 ) ) ( not ( = ?auto_277144 ?auto_277150 ) ) ( not ( = ?auto_277145 ?auto_277146 ) ) ( not ( = ?auto_277145 ?auto_277147 ) ) ( not ( = ?auto_277145 ?auto_277148 ) ) ( not ( = ?auto_277145 ?auto_277149 ) ) ( not ( = ?auto_277145 ?auto_277150 ) ) ( not ( = ?auto_277146 ?auto_277147 ) ) ( not ( = ?auto_277146 ?auto_277148 ) ) ( not ( = ?auto_277146 ?auto_277149 ) ) ( not ( = ?auto_277146 ?auto_277150 ) ) ( not ( = ?auto_277147 ?auto_277148 ) ) ( not ( = ?auto_277147 ?auto_277149 ) ) ( not ( = ?auto_277147 ?auto_277150 ) ) ( not ( = ?auto_277148 ?auto_277149 ) ) ( not ( = ?auto_277148 ?auto_277150 ) ) ( not ( = ?auto_277149 ?auto_277150 ) ) ( CLEAR ?auto_277147 ) ( ON ?auto_277148 ?auto_277149 ) ( CLEAR ?auto_277148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_277138 ?auto_277139 ?auto_277140 ?auto_277141 ?auto_277142 ?auto_277143 ?auto_277144 ?auto_277145 ?auto_277146 ?auto_277147 ?auto_277148 )
      ( MAKE-12PILE ?auto_277138 ?auto_277139 ?auto_277140 ?auto_277141 ?auto_277142 ?auto_277143 ?auto_277144 ?auto_277145 ?auto_277146 ?auto_277147 ?auto_277148 ?auto_277149 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_277188 - BLOCK
      ?auto_277189 - BLOCK
      ?auto_277190 - BLOCK
      ?auto_277191 - BLOCK
      ?auto_277192 - BLOCK
      ?auto_277193 - BLOCK
      ?auto_277194 - BLOCK
      ?auto_277195 - BLOCK
      ?auto_277196 - BLOCK
      ?auto_277197 - BLOCK
      ?auto_277198 - BLOCK
      ?auto_277199 - BLOCK
    )
    :vars
    (
      ?auto_277200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_277199 ?auto_277200 ) ( ON-TABLE ?auto_277188 ) ( ON ?auto_277189 ?auto_277188 ) ( ON ?auto_277190 ?auto_277189 ) ( ON ?auto_277191 ?auto_277190 ) ( ON ?auto_277192 ?auto_277191 ) ( ON ?auto_277193 ?auto_277192 ) ( ON ?auto_277194 ?auto_277193 ) ( ON ?auto_277195 ?auto_277194 ) ( ON ?auto_277196 ?auto_277195 ) ( not ( = ?auto_277188 ?auto_277189 ) ) ( not ( = ?auto_277188 ?auto_277190 ) ) ( not ( = ?auto_277188 ?auto_277191 ) ) ( not ( = ?auto_277188 ?auto_277192 ) ) ( not ( = ?auto_277188 ?auto_277193 ) ) ( not ( = ?auto_277188 ?auto_277194 ) ) ( not ( = ?auto_277188 ?auto_277195 ) ) ( not ( = ?auto_277188 ?auto_277196 ) ) ( not ( = ?auto_277188 ?auto_277197 ) ) ( not ( = ?auto_277188 ?auto_277198 ) ) ( not ( = ?auto_277188 ?auto_277199 ) ) ( not ( = ?auto_277188 ?auto_277200 ) ) ( not ( = ?auto_277189 ?auto_277190 ) ) ( not ( = ?auto_277189 ?auto_277191 ) ) ( not ( = ?auto_277189 ?auto_277192 ) ) ( not ( = ?auto_277189 ?auto_277193 ) ) ( not ( = ?auto_277189 ?auto_277194 ) ) ( not ( = ?auto_277189 ?auto_277195 ) ) ( not ( = ?auto_277189 ?auto_277196 ) ) ( not ( = ?auto_277189 ?auto_277197 ) ) ( not ( = ?auto_277189 ?auto_277198 ) ) ( not ( = ?auto_277189 ?auto_277199 ) ) ( not ( = ?auto_277189 ?auto_277200 ) ) ( not ( = ?auto_277190 ?auto_277191 ) ) ( not ( = ?auto_277190 ?auto_277192 ) ) ( not ( = ?auto_277190 ?auto_277193 ) ) ( not ( = ?auto_277190 ?auto_277194 ) ) ( not ( = ?auto_277190 ?auto_277195 ) ) ( not ( = ?auto_277190 ?auto_277196 ) ) ( not ( = ?auto_277190 ?auto_277197 ) ) ( not ( = ?auto_277190 ?auto_277198 ) ) ( not ( = ?auto_277190 ?auto_277199 ) ) ( not ( = ?auto_277190 ?auto_277200 ) ) ( not ( = ?auto_277191 ?auto_277192 ) ) ( not ( = ?auto_277191 ?auto_277193 ) ) ( not ( = ?auto_277191 ?auto_277194 ) ) ( not ( = ?auto_277191 ?auto_277195 ) ) ( not ( = ?auto_277191 ?auto_277196 ) ) ( not ( = ?auto_277191 ?auto_277197 ) ) ( not ( = ?auto_277191 ?auto_277198 ) ) ( not ( = ?auto_277191 ?auto_277199 ) ) ( not ( = ?auto_277191 ?auto_277200 ) ) ( not ( = ?auto_277192 ?auto_277193 ) ) ( not ( = ?auto_277192 ?auto_277194 ) ) ( not ( = ?auto_277192 ?auto_277195 ) ) ( not ( = ?auto_277192 ?auto_277196 ) ) ( not ( = ?auto_277192 ?auto_277197 ) ) ( not ( = ?auto_277192 ?auto_277198 ) ) ( not ( = ?auto_277192 ?auto_277199 ) ) ( not ( = ?auto_277192 ?auto_277200 ) ) ( not ( = ?auto_277193 ?auto_277194 ) ) ( not ( = ?auto_277193 ?auto_277195 ) ) ( not ( = ?auto_277193 ?auto_277196 ) ) ( not ( = ?auto_277193 ?auto_277197 ) ) ( not ( = ?auto_277193 ?auto_277198 ) ) ( not ( = ?auto_277193 ?auto_277199 ) ) ( not ( = ?auto_277193 ?auto_277200 ) ) ( not ( = ?auto_277194 ?auto_277195 ) ) ( not ( = ?auto_277194 ?auto_277196 ) ) ( not ( = ?auto_277194 ?auto_277197 ) ) ( not ( = ?auto_277194 ?auto_277198 ) ) ( not ( = ?auto_277194 ?auto_277199 ) ) ( not ( = ?auto_277194 ?auto_277200 ) ) ( not ( = ?auto_277195 ?auto_277196 ) ) ( not ( = ?auto_277195 ?auto_277197 ) ) ( not ( = ?auto_277195 ?auto_277198 ) ) ( not ( = ?auto_277195 ?auto_277199 ) ) ( not ( = ?auto_277195 ?auto_277200 ) ) ( not ( = ?auto_277196 ?auto_277197 ) ) ( not ( = ?auto_277196 ?auto_277198 ) ) ( not ( = ?auto_277196 ?auto_277199 ) ) ( not ( = ?auto_277196 ?auto_277200 ) ) ( not ( = ?auto_277197 ?auto_277198 ) ) ( not ( = ?auto_277197 ?auto_277199 ) ) ( not ( = ?auto_277197 ?auto_277200 ) ) ( not ( = ?auto_277198 ?auto_277199 ) ) ( not ( = ?auto_277198 ?auto_277200 ) ) ( not ( = ?auto_277199 ?auto_277200 ) ) ( ON ?auto_277198 ?auto_277199 ) ( CLEAR ?auto_277196 ) ( ON ?auto_277197 ?auto_277198 ) ( CLEAR ?auto_277197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_277188 ?auto_277189 ?auto_277190 ?auto_277191 ?auto_277192 ?auto_277193 ?auto_277194 ?auto_277195 ?auto_277196 ?auto_277197 )
      ( MAKE-12PILE ?auto_277188 ?auto_277189 ?auto_277190 ?auto_277191 ?auto_277192 ?auto_277193 ?auto_277194 ?auto_277195 ?auto_277196 ?auto_277197 ?auto_277198 ?auto_277199 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_277238 - BLOCK
      ?auto_277239 - BLOCK
      ?auto_277240 - BLOCK
      ?auto_277241 - BLOCK
      ?auto_277242 - BLOCK
      ?auto_277243 - BLOCK
      ?auto_277244 - BLOCK
      ?auto_277245 - BLOCK
      ?auto_277246 - BLOCK
      ?auto_277247 - BLOCK
      ?auto_277248 - BLOCK
      ?auto_277249 - BLOCK
    )
    :vars
    (
      ?auto_277250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_277249 ?auto_277250 ) ( ON-TABLE ?auto_277238 ) ( ON ?auto_277239 ?auto_277238 ) ( ON ?auto_277240 ?auto_277239 ) ( ON ?auto_277241 ?auto_277240 ) ( ON ?auto_277242 ?auto_277241 ) ( ON ?auto_277243 ?auto_277242 ) ( ON ?auto_277244 ?auto_277243 ) ( ON ?auto_277245 ?auto_277244 ) ( not ( = ?auto_277238 ?auto_277239 ) ) ( not ( = ?auto_277238 ?auto_277240 ) ) ( not ( = ?auto_277238 ?auto_277241 ) ) ( not ( = ?auto_277238 ?auto_277242 ) ) ( not ( = ?auto_277238 ?auto_277243 ) ) ( not ( = ?auto_277238 ?auto_277244 ) ) ( not ( = ?auto_277238 ?auto_277245 ) ) ( not ( = ?auto_277238 ?auto_277246 ) ) ( not ( = ?auto_277238 ?auto_277247 ) ) ( not ( = ?auto_277238 ?auto_277248 ) ) ( not ( = ?auto_277238 ?auto_277249 ) ) ( not ( = ?auto_277238 ?auto_277250 ) ) ( not ( = ?auto_277239 ?auto_277240 ) ) ( not ( = ?auto_277239 ?auto_277241 ) ) ( not ( = ?auto_277239 ?auto_277242 ) ) ( not ( = ?auto_277239 ?auto_277243 ) ) ( not ( = ?auto_277239 ?auto_277244 ) ) ( not ( = ?auto_277239 ?auto_277245 ) ) ( not ( = ?auto_277239 ?auto_277246 ) ) ( not ( = ?auto_277239 ?auto_277247 ) ) ( not ( = ?auto_277239 ?auto_277248 ) ) ( not ( = ?auto_277239 ?auto_277249 ) ) ( not ( = ?auto_277239 ?auto_277250 ) ) ( not ( = ?auto_277240 ?auto_277241 ) ) ( not ( = ?auto_277240 ?auto_277242 ) ) ( not ( = ?auto_277240 ?auto_277243 ) ) ( not ( = ?auto_277240 ?auto_277244 ) ) ( not ( = ?auto_277240 ?auto_277245 ) ) ( not ( = ?auto_277240 ?auto_277246 ) ) ( not ( = ?auto_277240 ?auto_277247 ) ) ( not ( = ?auto_277240 ?auto_277248 ) ) ( not ( = ?auto_277240 ?auto_277249 ) ) ( not ( = ?auto_277240 ?auto_277250 ) ) ( not ( = ?auto_277241 ?auto_277242 ) ) ( not ( = ?auto_277241 ?auto_277243 ) ) ( not ( = ?auto_277241 ?auto_277244 ) ) ( not ( = ?auto_277241 ?auto_277245 ) ) ( not ( = ?auto_277241 ?auto_277246 ) ) ( not ( = ?auto_277241 ?auto_277247 ) ) ( not ( = ?auto_277241 ?auto_277248 ) ) ( not ( = ?auto_277241 ?auto_277249 ) ) ( not ( = ?auto_277241 ?auto_277250 ) ) ( not ( = ?auto_277242 ?auto_277243 ) ) ( not ( = ?auto_277242 ?auto_277244 ) ) ( not ( = ?auto_277242 ?auto_277245 ) ) ( not ( = ?auto_277242 ?auto_277246 ) ) ( not ( = ?auto_277242 ?auto_277247 ) ) ( not ( = ?auto_277242 ?auto_277248 ) ) ( not ( = ?auto_277242 ?auto_277249 ) ) ( not ( = ?auto_277242 ?auto_277250 ) ) ( not ( = ?auto_277243 ?auto_277244 ) ) ( not ( = ?auto_277243 ?auto_277245 ) ) ( not ( = ?auto_277243 ?auto_277246 ) ) ( not ( = ?auto_277243 ?auto_277247 ) ) ( not ( = ?auto_277243 ?auto_277248 ) ) ( not ( = ?auto_277243 ?auto_277249 ) ) ( not ( = ?auto_277243 ?auto_277250 ) ) ( not ( = ?auto_277244 ?auto_277245 ) ) ( not ( = ?auto_277244 ?auto_277246 ) ) ( not ( = ?auto_277244 ?auto_277247 ) ) ( not ( = ?auto_277244 ?auto_277248 ) ) ( not ( = ?auto_277244 ?auto_277249 ) ) ( not ( = ?auto_277244 ?auto_277250 ) ) ( not ( = ?auto_277245 ?auto_277246 ) ) ( not ( = ?auto_277245 ?auto_277247 ) ) ( not ( = ?auto_277245 ?auto_277248 ) ) ( not ( = ?auto_277245 ?auto_277249 ) ) ( not ( = ?auto_277245 ?auto_277250 ) ) ( not ( = ?auto_277246 ?auto_277247 ) ) ( not ( = ?auto_277246 ?auto_277248 ) ) ( not ( = ?auto_277246 ?auto_277249 ) ) ( not ( = ?auto_277246 ?auto_277250 ) ) ( not ( = ?auto_277247 ?auto_277248 ) ) ( not ( = ?auto_277247 ?auto_277249 ) ) ( not ( = ?auto_277247 ?auto_277250 ) ) ( not ( = ?auto_277248 ?auto_277249 ) ) ( not ( = ?auto_277248 ?auto_277250 ) ) ( not ( = ?auto_277249 ?auto_277250 ) ) ( ON ?auto_277248 ?auto_277249 ) ( ON ?auto_277247 ?auto_277248 ) ( CLEAR ?auto_277245 ) ( ON ?auto_277246 ?auto_277247 ) ( CLEAR ?auto_277246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_277238 ?auto_277239 ?auto_277240 ?auto_277241 ?auto_277242 ?auto_277243 ?auto_277244 ?auto_277245 ?auto_277246 )
      ( MAKE-12PILE ?auto_277238 ?auto_277239 ?auto_277240 ?auto_277241 ?auto_277242 ?auto_277243 ?auto_277244 ?auto_277245 ?auto_277246 ?auto_277247 ?auto_277248 ?auto_277249 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_277288 - BLOCK
      ?auto_277289 - BLOCK
      ?auto_277290 - BLOCK
      ?auto_277291 - BLOCK
      ?auto_277292 - BLOCK
      ?auto_277293 - BLOCK
      ?auto_277294 - BLOCK
      ?auto_277295 - BLOCK
      ?auto_277296 - BLOCK
      ?auto_277297 - BLOCK
      ?auto_277298 - BLOCK
      ?auto_277299 - BLOCK
    )
    :vars
    (
      ?auto_277300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_277299 ?auto_277300 ) ( ON-TABLE ?auto_277288 ) ( ON ?auto_277289 ?auto_277288 ) ( ON ?auto_277290 ?auto_277289 ) ( ON ?auto_277291 ?auto_277290 ) ( ON ?auto_277292 ?auto_277291 ) ( ON ?auto_277293 ?auto_277292 ) ( ON ?auto_277294 ?auto_277293 ) ( not ( = ?auto_277288 ?auto_277289 ) ) ( not ( = ?auto_277288 ?auto_277290 ) ) ( not ( = ?auto_277288 ?auto_277291 ) ) ( not ( = ?auto_277288 ?auto_277292 ) ) ( not ( = ?auto_277288 ?auto_277293 ) ) ( not ( = ?auto_277288 ?auto_277294 ) ) ( not ( = ?auto_277288 ?auto_277295 ) ) ( not ( = ?auto_277288 ?auto_277296 ) ) ( not ( = ?auto_277288 ?auto_277297 ) ) ( not ( = ?auto_277288 ?auto_277298 ) ) ( not ( = ?auto_277288 ?auto_277299 ) ) ( not ( = ?auto_277288 ?auto_277300 ) ) ( not ( = ?auto_277289 ?auto_277290 ) ) ( not ( = ?auto_277289 ?auto_277291 ) ) ( not ( = ?auto_277289 ?auto_277292 ) ) ( not ( = ?auto_277289 ?auto_277293 ) ) ( not ( = ?auto_277289 ?auto_277294 ) ) ( not ( = ?auto_277289 ?auto_277295 ) ) ( not ( = ?auto_277289 ?auto_277296 ) ) ( not ( = ?auto_277289 ?auto_277297 ) ) ( not ( = ?auto_277289 ?auto_277298 ) ) ( not ( = ?auto_277289 ?auto_277299 ) ) ( not ( = ?auto_277289 ?auto_277300 ) ) ( not ( = ?auto_277290 ?auto_277291 ) ) ( not ( = ?auto_277290 ?auto_277292 ) ) ( not ( = ?auto_277290 ?auto_277293 ) ) ( not ( = ?auto_277290 ?auto_277294 ) ) ( not ( = ?auto_277290 ?auto_277295 ) ) ( not ( = ?auto_277290 ?auto_277296 ) ) ( not ( = ?auto_277290 ?auto_277297 ) ) ( not ( = ?auto_277290 ?auto_277298 ) ) ( not ( = ?auto_277290 ?auto_277299 ) ) ( not ( = ?auto_277290 ?auto_277300 ) ) ( not ( = ?auto_277291 ?auto_277292 ) ) ( not ( = ?auto_277291 ?auto_277293 ) ) ( not ( = ?auto_277291 ?auto_277294 ) ) ( not ( = ?auto_277291 ?auto_277295 ) ) ( not ( = ?auto_277291 ?auto_277296 ) ) ( not ( = ?auto_277291 ?auto_277297 ) ) ( not ( = ?auto_277291 ?auto_277298 ) ) ( not ( = ?auto_277291 ?auto_277299 ) ) ( not ( = ?auto_277291 ?auto_277300 ) ) ( not ( = ?auto_277292 ?auto_277293 ) ) ( not ( = ?auto_277292 ?auto_277294 ) ) ( not ( = ?auto_277292 ?auto_277295 ) ) ( not ( = ?auto_277292 ?auto_277296 ) ) ( not ( = ?auto_277292 ?auto_277297 ) ) ( not ( = ?auto_277292 ?auto_277298 ) ) ( not ( = ?auto_277292 ?auto_277299 ) ) ( not ( = ?auto_277292 ?auto_277300 ) ) ( not ( = ?auto_277293 ?auto_277294 ) ) ( not ( = ?auto_277293 ?auto_277295 ) ) ( not ( = ?auto_277293 ?auto_277296 ) ) ( not ( = ?auto_277293 ?auto_277297 ) ) ( not ( = ?auto_277293 ?auto_277298 ) ) ( not ( = ?auto_277293 ?auto_277299 ) ) ( not ( = ?auto_277293 ?auto_277300 ) ) ( not ( = ?auto_277294 ?auto_277295 ) ) ( not ( = ?auto_277294 ?auto_277296 ) ) ( not ( = ?auto_277294 ?auto_277297 ) ) ( not ( = ?auto_277294 ?auto_277298 ) ) ( not ( = ?auto_277294 ?auto_277299 ) ) ( not ( = ?auto_277294 ?auto_277300 ) ) ( not ( = ?auto_277295 ?auto_277296 ) ) ( not ( = ?auto_277295 ?auto_277297 ) ) ( not ( = ?auto_277295 ?auto_277298 ) ) ( not ( = ?auto_277295 ?auto_277299 ) ) ( not ( = ?auto_277295 ?auto_277300 ) ) ( not ( = ?auto_277296 ?auto_277297 ) ) ( not ( = ?auto_277296 ?auto_277298 ) ) ( not ( = ?auto_277296 ?auto_277299 ) ) ( not ( = ?auto_277296 ?auto_277300 ) ) ( not ( = ?auto_277297 ?auto_277298 ) ) ( not ( = ?auto_277297 ?auto_277299 ) ) ( not ( = ?auto_277297 ?auto_277300 ) ) ( not ( = ?auto_277298 ?auto_277299 ) ) ( not ( = ?auto_277298 ?auto_277300 ) ) ( not ( = ?auto_277299 ?auto_277300 ) ) ( ON ?auto_277298 ?auto_277299 ) ( ON ?auto_277297 ?auto_277298 ) ( ON ?auto_277296 ?auto_277297 ) ( CLEAR ?auto_277294 ) ( ON ?auto_277295 ?auto_277296 ) ( CLEAR ?auto_277295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_277288 ?auto_277289 ?auto_277290 ?auto_277291 ?auto_277292 ?auto_277293 ?auto_277294 ?auto_277295 )
      ( MAKE-12PILE ?auto_277288 ?auto_277289 ?auto_277290 ?auto_277291 ?auto_277292 ?auto_277293 ?auto_277294 ?auto_277295 ?auto_277296 ?auto_277297 ?auto_277298 ?auto_277299 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_277338 - BLOCK
      ?auto_277339 - BLOCK
      ?auto_277340 - BLOCK
      ?auto_277341 - BLOCK
      ?auto_277342 - BLOCK
      ?auto_277343 - BLOCK
      ?auto_277344 - BLOCK
      ?auto_277345 - BLOCK
      ?auto_277346 - BLOCK
      ?auto_277347 - BLOCK
      ?auto_277348 - BLOCK
      ?auto_277349 - BLOCK
    )
    :vars
    (
      ?auto_277350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_277349 ?auto_277350 ) ( ON-TABLE ?auto_277338 ) ( ON ?auto_277339 ?auto_277338 ) ( ON ?auto_277340 ?auto_277339 ) ( ON ?auto_277341 ?auto_277340 ) ( ON ?auto_277342 ?auto_277341 ) ( ON ?auto_277343 ?auto_277342 ) ( not ( = ?auto_277338 ?auto_277339 ) ) ( not ( = ?auto_277338 ?auto_277340 ) ) ( not ( = ?auto_277338 ?auto_277341 ) ) ( not ( = ?auto_277338 ?auto_277342 ) ) ( not ( = ?auto_277338 ?auto_277343 ) ) ( not ( = ?auto_277338 ?auto_277344 ) ) ( not ( = ?auto_277338 ?auto_277345 ) ) ( not ( = ?auto_277338 ?auto_277346 ) ) ( not ( = ?auto_277338 ?auto_277347 ) ) ( not ( = ?auto_277338 ?auto_277348 ) ) ( not ( = ?auto_277338 ?auto_277349 ) ) ( not ( = ?auto_277338 ?auto_277350 ) ) ( not ( = ?auto_277339 ?auto_277340 ) ) ( not ( = ?auto_277339 ?auto_277341 ) ) ( not ( = ?auto_277339 ?auto_277342 ) ) ( not ( = ?auto_277339 ?auto_277343 ) ) ( not ( = ?auto_277339 ?auto_277344 ) ) ( not ( = ?auto_277339 ?auto_277345 ) ) ( not ( = ?auto_277339 ?auto_277346 ) ) ( not ( = ?auto_277339 ?auto_277347 ) ) ( not ( = ?auto_277339 ?auto_277348 ) ) ( not ( = ?auto_277339 ?auto_277349 ) ) ( not ( = ?auto_277339 ?auto_277350 ) ) ( not ( = ?auto_277340 ?auto_277341 ) ) ( not ( = ?auto_277340 ?auto_277342 ) ) ( not ( = ?auto_277340 ?auto_277343 ) ) ( not ( = ?auto_277340 ?auto_277344 ) ) ( not ( = ?auto_277340 ?auto_277345 ) ) ( not ( = ?auto_277340 ?auto_277346 ) ) ( not ( = ?auto_277340 ?auto_277347 ) ) ( not ( = ?auto_277340 ?auto_277348 ) ) ( not ( = ?auto_277340 ?auto_277349 ) ) ( not ( = ?auto_277340 ?auto_277350 ) ) ( not ( = ?auto_277341 ?auto_277342 ) ) ( not ( = ?auto_277341 ?auto_277343 ) ) ( not ( = ?auto_277341 ?auto_277344 ) ) ( not ( = ?auto_277341 ?auto_277345 ) ) ( not ( = ?auto_277341 ?auto_277346 ) ) ( not ( = ?auto_277341 ?auto_277347 ) ) ( not ( = ?auto_277341 ?auto_277348 ) ) ( not ( = ?auto_277341 ?auto_277349 ) ) ( not ( = ?auto_277341 ?auto_277350 ) ) ( not ( = ?auto_277342 ?auto_277343 ) ) ( not ( = ?auto_277342 ?auto_277344 ) ) ( not ( = ?auto_277342 ?auto_277345 ) ) ( not ( = ?auto_277342 ?auto_277346 ) ) ( not ( = ?auto_277342 ?auto_277347 ) ) ( not ( = ?auto_277342 ?auto_277348 ) ) ( not ( = ?auto_277342 ?auto_277349 ) ) ( not ( = ?auto_277342 ?auto_277350 ) ) ( not ( = ?auto_277343 ?auto_277344 ) ) ( not ( = ?auto_277343 ?auto_277345 ) ) ( not ( = ?auto_277343 ?auto_277346 ) ) ( not ( = ?auto_277343 ?auto_277347 ) ) ( not ( = ?auto_277343 ?auto_277348 ) ) ( not ( = ?auto_277343 ?auto_277349 ) ) ( not ( = ?auto_277343 ?auto_277350 ) ) ( not ( = ?auto_277344 ?auto_277345 ) ) ( not ( = ?auto_277344 ?auto_277346 ) ) ( not ( = ?auto_277344 ?auto_277347 ) ) ( not ( = ?auto_277344 ?auto_277348 ) ) ( not ( = ?auto_277344 ?auto_277349 ) ) ( not ( = ?auto_277344 ?auto_277350 ) ) ( not ( = ?auto_277345 ?auto_277346 ) ) ( not ( = ?auto_277345 ?auto_277347 ) ) ( not ( = ?auto_277345 ?auto_277348 ) ) ( not ( = ?auto_277345 ?auto_277349 ) ) ( not ( = ?auto_277345 ?auto_277350 ) ) ( not ( = ?auto_277346 ?auto_277347 ) ) ( not ( = ?auto_277346 ?auto_277348 ) ) ( not ( = ?auto_277346 ?auto_277349 ) ) ( not ( = ?auto_277346 ?auto_277350 ) ) ( not ( = ?auto_277347 ?auto_277348 ) ) ( not ( = ?auto_277347 ?auto_277349 ) ) ( not ( = ?auto_277347 ?auto_277350 ) ) ( not ( = ?auto_277348 ?auto_277349 ) ) ( not ( = ?auto_277348 ?auto_277350 ) ) ( not ( = ?auto_277349 ?auto_277350 ) ) ( ON ?auto_277348 ?auto_277349 ) ( ON ?auto_277347 ?auto_277348 ) ( ON ?auto_277346 ?auto_277347 ) ( ON ?auto_277345 ?auto_277346 ) ( CLEAR ?auto_277343 ) ( ON ?auto_277344 ?auto_277345 ) ( CLEAR ?auto_277344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_277338 ?auto_277339 ?auto_277340 ?auto_277341 ?auto_277342 ?auto_277343 ?auto_277344 )
      ( MAKE-12PILE ?auto_277338 ?auto_277339 ?auto_277340 ?auto_277341 ?auto_277342 ?auto_277343 ?auto_277344 ?auto_277345 ?auto_277346 ?auto_277347 ?auto_277348 ?auto_277349 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_277388 - BLOCK
      ?auto_277389 - BLOCK
      ?auto_277390 - BLOCK
      ?auto_277391 - BLOCK
      ?auto_277392 - BLOCK
      ?auto_277393 - BLOCK
      ?auto_277394 - BLOCK
      ?auto_277395 - BLOCK
      ?auto_277396 - BLOCK
      ?auto_277397 - BLOCK
      ?auto_277398 - BLOCK
      ?auto_277399 - BLOCK
    )
    :vars
    (
      ?auto_277400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_277399 ?auto_277400 ) ( ON-TABLE ?auto_277388 ) ( ON ?auto_277389 ?auto_277388 ) ( ON ?auto_277390 ?auto_277389 ) ( ON ?auto_277391 ?auto_277390 ) ( ON ?auto_277392 ?auto_277391 ) ( not ( = ?auto_277388 ?auto_277389 ) ) ( not ( = ?auto_277388 ?auto_277390 ) ) ( not ( = ?auto_277388 ?auto_277391 ) ) ( not ( = ?auto_277388 ?auto_277392 ) ) ( not ( = ?auto_277388 ?auto_277393 ) ) ( not ( = ?auto_277388 ?auto_277394 ) ) ( not ( = ?auto_277388 ?auto_277395 ) ) ( not ( = ?auto_277388 ?auto_277396 ) ) ( not ( = ?auto_277388 ?auto_277397 ) ) ( not ( = ?auto_277388 ?auto_277398 ) ) ( not ( = ?auto_277388 ?auto_277399 ) ) ( not ( = ?auto_277388 ?auto_277400 ) ) ( not ( = ?auto_277389 ?auto_277390 ) ) ( not ( = ?auto_277389 ?auto_277391 ) ) ( not ( = ?auto_277389 ?auto_277392 ) ) ( not ( = ?auto_277389 ?auto_277393 ) ) ( not ( = ?auto_277389 ?auto_277394 ) ) ( not ( = ?auto_277389 ?auto_277395 ) ) ( not ( = ?auto_277389 ?auto_277396 ) ) ( not ( = ?auto_277389 ?auto_277397 ) ) ( not ( = ?auto_277389 ?auto_277398 ) ) ( not ( = ?auto_277389 ?auto_277399 ) ) ( not ( = ?auto_277389 ?auto_277400 ) ) ( not ( = ?auto_277390 ?auto_277391 ) ) ( not ( = ?auto_277390 ?auto_277392 ) ) ( not ( = ?auto_277390 ?auto_277393 ) ) ( not ( = ?auto_277390 ?auto_277394 ) ) ( not ( = ?auto_277390 ?auto_277395 ) ) ( not ( = ?auto_277390 ?auto_277396 ) ) ( not ( = ?auto_277390 ?auto_277397 ) ) ( not ( = ?auto_277390 ?auto_277398 ) ) ( not ( = ?auto_277390 ?auto_277399 ) ) ( not ( = ?auto_277390 ?auto_277400 ) ) ( not ( = ?auto_277391 ?auto_277392 ) ) ( not ( = ?auto_277391 ?auto_277393 ) ) ( not ( = ?auto_277391 ?auto_277394 ) ) ( not ( = ?auto_277391 ?auto_277395 ) ) ( not ( = ?auto_277391 ?auto_277396 ) ) ( not ( = ?auto_277391 ?auto_277397 ) ) ( not ( = ?auto_277391 ?auto_277398 ) ) ( not ( = ?auto_277391 ?auto_277399 ) ) ( not ( = ?auto_277391 ?auto_277400 ) ) ( not ( = ?auto_277392 ?auto_277393 ) ) ( not ( = ?auto_277392 ?auto_277394 ) ) ( not ( = ?auto_277392 ?auto_277395 ) ) ( not ( = ?auto_277392 ?auto_277396 ) ) ( not ( = ?auto_277392 ?auto_277397 ) ) ( not ( = ?auto_277392 ?auto_277398 ) ) ( not ( = ?auto_277392 ?auto_277399 ) ) ( not ( = ?auto_277392 ?auto_277400 ) ) ( not ( = ?auto_277393 ?auto_277394 ) ) ( not ( = ?auto_277393 ?auto_277395 ) ) ( not ( = ?auto_277393 ?auto_277396 ) ) ( not ( = ?auto_277393 ?auto_277397 ) ) ( not ( = ?auto_277393 ?auto_277398 ) ) ( not ( = ?auto_277393 ?auto_277399 ) ) ( not ( = ?auto_277393 ?auto_277400 ) ) ( not ( = ?auto_277394 ?auto_277395 ) ) ( not ( = ?auto_277394 ?auto_277396 ) ) ( not ( = ?auto_277394 ?auto_277397 ) ) ( not ( = ?auto_277394 ?auto_277398 ) ) ( not ( = ?auto_277394 ?auto_277399 ) ) ( not ( = ?auto_277394 ?auto_277400 ) ) ( not ( = ?auto_277395 ?auto_277396 ) ) ( not ( = ?auto_277395 ?auto_277397 ) ) ( not ( = ?auto_277395 ?auto_277398 ) ) ( not ( = ?auto_277395 ?auto_277399 ) ) ( not ( = ?auto_277395 ?auto_277400 ) ) ( not ( = ?auto_277396 ?auto_277397 ) ) ( not ( = ?auto_277396 ?auto_277398 ) ) ( not ( = ?auto_277396 ?auto_277399 ) ) ( not ( = ?auto_277396 ?auto_277400 ) ) ( not ( = ?auto_277397 ?auto_277398 ) ) ( not ( = ?auto_277397 ?auto_277399 ) ) ( not ( = ?auto_277397 ?auto_277400 ) ) ( not ( = ?auto_277398 ?auto_277399 ) ) ( not ( = ?auto_277398 ?auto_277400 ) ) ( not ( = ?auto_277399 ?auto_277400 ) ) ( ON ?auto_277398 ?auto_277399 ) ( ON ?auto_277397 ?auto_277398 ) ( ON ?auto_277396 ?auto_277397 ) ( ON ?auto_277395 ?auto_277396 ) ( ON ?auto_277394 ?auto_277395 ) ( CLEAR ?auto_277392 ) ( ON ?auto_277393 ?auto_277394 ) ( CLEAR ?auto_277393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_277388 ?auto_277389 ?auto_277390 ?auto_277391 ?auto_277392 ?auto_277393 )
      ( MAKE-12PILE ?auto_277388 ?auto_277389 ?auto_277390 ?auto_277391 ?auto_277392 ?auto_277393 ?auto_277394 ?auto_277395 ?auto_277396 ?auto_277397 ?auto_277398 ?auto_277399 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_277438 - BLOCK
      ?auto_277439 - BLOCK
      ?auto_277440 - BLOCK
      ?auto_277441 - BLOCK
      ?auto_277442 - BLOCK
      ?auto_277443 - BLOCK
      ?auto_277444 - BLOCK
      ?auto_277445 - BLOCK
      ?auto_277446 - BLOCK
      ?auto_277447 - BLOCK
      ?auto_277448 - BLOCK
      ?auto_277449 - BLOCK
    )
    :vars
    (
      ?auto_277450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_277449 ?auto_277450 ) ( ON-TABLE ?auto_277438 ) ( ON ?auto_277439 ?auto_277438 ) ( ON ?auto_277440 ?auto_277439 ) ( ON ?auto_277441 ?auto_277440 ) ( not ( = ?auto_277438 ?auto_277439 ) ) ( not ( = ?auto_277438 ?auto_277440 ) ) ( not ( = ?auto_277438 ?auto_277441 ) ) ( not ( = ?auto_277438 ?auto_277442 ) ) ( not ( = ?auto_277438 ?auto_277443 ) ) ( not ( = ?auto_277438 ?auto_277444 ) ) ( not ( = ?auto_277438 ?auto_277445 ) ) ( not ( = ?auto_277438 ?auto_277446 ) ) ( not ( = ?auto_277438 ?auto_277447 ) ) ( not ( = ?auto_277438 ?auto_277448 ) ) ( not ( = ?auto_277438 ?auto_277449 ) ) ( not ( = ?auto_277438 ?auto_277450 ) ) ( not ( = ?auto_277439 ?auto_277440 ) ) ( not ( = ?auto_277439 ?auto_277441 ) ) ( not ( = ?auto_277439 ?auto_277442 ) ) ( not ( = ?auto_277439 ?auto_277443 ) ) ( not ( = ?auto_277439 ?auto_277444 ) ) ( not ( = ?auto_277439 ?auto_277445 ) ) ( not ( = ?auto_277439 ?auto_277446 ) ) ( not ( = ?auto_277439 ?auto_277447 ) ) ( not ( = ?auto_277439 ?auto_277448 ) ) ( not ( = ?auto_277439 ?auto_277449 ) ) ( not ( = ?auto_277439 ?auto_277450 ) ) ( not ( = ?auto_277440 ?auto_277441 ) ) ( not ( = ?auto_277440 ?auto_277442 ) ) ( not ( = ?auto_277440 ?auto_277443 ) ) ( not ( = ?auto_277440 ?auto_277444 ) ) ( not ( = ?auto_277440 ?auto_277445 ) ) ( not ( = ?auto_277440 ?auto_277446 ) ) ( not ( = ?auto_277440 ?auto_277447 ) ) ( not ( = ?auto_277440 ?auto_277448 ) ) ( not ( = ?auto_277440 ?auto_277449 ) ) ( not ( = ?auto_277440 ?auto_277450 ) ) ( not ( = ?auto_277441 ?auto_277442 ) ) ( not ( = ?auto_277441 ?auto_277443 ) ) ( not ( = ?auto_277441 ?auto_277444 ) ) ( not ( = ?auto_277441 ?auto_277445 ) ) ( not ( = ?auto_277441 ?auto_277446 ) ) ( not ( = ?auto_277441 ?auto_277447 ) ) ( not ( = ?auto_277441 ?auto_277448 ) ) ( not ( = ?auto_277441 ?auto_277449 ) ) ( not ( = ?auto_277441 ?auto_277450 ) ) ( not ( = ?auto_277442 ?auto_277443 ) ) ( not ( = ?auto_277442 ?auto_277444 ) ) ( not ( = ?auto_277442 ?auto_277445 ) ) ( not ( = ?auto_277442 ?auto_277446 ) ) ( not ( = ?auto_277442 ?auto_277447 ) ) ( not ( = ?auto_277442 ?auto_277448 ) ) ( not ( = ?auto_277442 ?auto_277449 ) ) ( not ( = ?auto_277442 ?auto_277450 ) ) ( not ( = ?auto_277443 ?auto_277444 ) ) ( not ( = ?auto_277443 ?auto_277445 ) ) ( not ( = ?auto_277443 ?auto_277446 ) ) ( not ( = ?auto_277443 ?auto_277447 ) ) ( not ( = ?auto_277443 ?auto_277448 ) ) ( not ( = ?auto_277443 ?auto_277449 ) ) ( not ( = ?auto_277443 ?auto_277450 ) ) ( not ( = ?auto_277444 ?auto_277445 ) ) ( not ( = ?auto_277444 ?auto_277446 ) ) ( not ( = ?auto_277444 ?auto_277447 ) ) ( not ( = ?auto_277444 ?auto_277448 ) ) ( not ( = ?auto_277444 ?auto_277449 ) ) ( not ( = ?auto_277444 ?auto_277450 ) ) ( not ( = ?auto_277445 ?auto_277446 ) ) ( not ( = ?auto_277445 ?auto_277447 ) ) ( not ( = ?auto_277445 ?auto_277448 ) ) ( not ( = ?auto_277445 ?auto_277449 ) ) ( not ( = ?auto_277445 ?auto_277450 ) ) ( not ( = ?auto_277446 ?auto_277447 ) ) ( not ( = ?auto_277446 ?auto_277448 ) ) ( not ( = ?auto_277446 ?auto_277449 ) ) ( not ( = ?auto_277446 ?auto_277450 ) ) ( not ( = ?auto_277447 ?auto_277448 ) ) ( not ( = ?auto_277447 ?auto_277449 ) ) ( not ( = ?auto_277447 ?auto_277450 ) ) ( not ( = ?auto_277448 ?auto_277449 ) ) ( not ( = ?auto_277448 ?auto_277450 ) ) ( not ( = ?auto_277449 ?auto_277450 ) ) ( ON ?auto_277448 ?auto_277449 ) ( ON ?auto_277447 ?auto_277448 ) ( ON ?auto_277446 ?auto_277447 ) ( ON ?auto_277445 ?auto_277446 ) ( ON ?auto_277444 ?auto_277445 ) ( ON ?auto_277443 ?auto_277444 ) ( CLEAR ?auto_277441 ) ( ON ?auto_277442 ?auto_277443 ) ( CLEAR ?auto_277442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_277438 ?auto_277439 ?auto_277440 ?auto_277441 ?auto_277442 )
      ( MAKE-12PILE ?auto_277438 ?auto_277439 ?auto_277440 ?auto_277441 ?auto_277442 ?auto_277443 ?auto_277444 ?auto_277445 ?auto_277446 ?auto_277447 ?auto_277448 ?auto_277449 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_277488 - BLOCK
      ?auto_277489 - BLOCK
      ?auto_277490 - BLOCK
      ?auto_277491 - BLOCK
      ?auto_277492 - BLOCK
      ?auto_277493 - BLOCK
      ?auto_277494 - BLOCK
      ?auto_277495 - BLOCK
      ?auto_277496 - BLOCK
      ?auto_277497 - BLOCK
      ?auto_277498 - BLOCK
      ?auto_277499 - BLOCK
    )
    :vars
    (
      ?auto_277500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_277499 ?auto_277500 ) ( ON-TABLE ?auto_277488 ) ( ON ?auto_277489 ?auto_277488 ) ( ON ?auto_277490 ?auto_277489 ) ( not ( = ?auto_277488 ?auto_277489 ) ) ( not ( = ?auto_277488 ?auto_277490 ) ) ( not ( = ?auto_277488 ?auto_277491 ) ) ( not ( = ?auto_277488 ?auto_277492 ) ) ( not ( = ?auto_277488 ?auto_277493 ) ) ( not ( = ?auto_277488 ?auto_277494 ) ) ( not ( = ?auto_277488 ?auto_277495 ) ) ( not ( = ?auto_277488 ?auto_277496 ) ) ( not ( = ?auto_277488 ?auto_277497 ) ) ( not ( = ?auto_277488 ?auto_277498 ) ) ( not ( = ?auto_277488 ?auto_277499 ) ) ( not ( = ?auto_277488 ?auto_277500 ) ) ( not ( = ?auto_277489 ?auto_277490 ) ) ( not ( = ?auto_277489 ?auto_277491 ) ) ( not ( = ?auto_277489 ?auto_277492 ) ) ( not ( = ?auto_277489 ?auto_277493 ) ) ( not ( = ?auto_277489 ?auto_277494 ) ) ( not ( = ?auto_277489 ?auto_277495 ) ) ( not ( = ?auto_277489 ?auto_277496 ) ) ( not ( = ?auto_277489 ?auto_277497 ) ) ( not ( = ?auto_277489 ?auto_277498 ) ) ( not ( = ?auto_277489 ?auto_277499 ) ) ( not ( = ?auto_277489 ?auto_277500 ) ) ( not ( = ?auto_277490 ?auto_277491 ) ) ( not ( = ?auto_277490 ?auto_277492 ) ) ( not ( = ?auto_277490 ?auto_277493 ) ) ( not ( = ?auto_277490 ?auto_277494 ) ) ( not ( = ?auto_277490 ?auto_277495 ) ) ( not ( = ?auto_277490 ?auto_277496 ) ) ( not ( = ?auto_277490 ?auto_277497 ) ) ( not ( = ?auto_277490 ?auto_277498 ) ) ( not ( = ?auto_277490 ?auto_277499 ) ) ( not ( = ?auto_277490 ?auto_277500 ) ) ( not ( = ?auto_277491 ?auto_277492 ) ) ( not ( = ?auto_277491 ?auto_277493 ) ) ( not ( = ?auto_277491 ?auto_277494 ) ) ( not ( = ?auto_277491 ?auto_277495 ) ) ( not ( = ?auto_277491 ?auto_277496 ) ) ( not ( = ?auto_277491 ?auto_277497 ) ) ( not ( = ?auto_277491 ?auto_277498 ) ) ( not ( = ?auto_277491 ?auto_277499 ) ) ( not ( = ?auto_277491 ?auto_277500 ) ) ( not ( = ?auto_277492 ?auto_277493 ) ) ( not ( = ?auto_277492 ?auto_277494 ) ) ( not ( = ?auto_277492 ?auto_277495 ) ) ( not ( = ?auto_277492 ?auto_277496 ) ) ( not ( = ?auto_277492 ?auto_277497 ) ) ( not ( = ?auto_277492 ?auto_277498 ) ) ( not ( = ?auto_277492 ?auto_277499 ) ) ( not ( = ?auto_277492 ?auto_277500 ) ) ( not ( = ?auto_277493 ?auto_277494 ) ) ( not ( = ?auto_277493 ?auto_277495 ) ) ( not ( = ?auto_277493 ?auto_277496 ) ) ( not ( = ?auto_277493 ?auto_277497 ) ) ( not ( = ?auto_277493 ?auto_277498 ) ) ( not ( = ?auto_277493 ?auto_277499 ) ) ( not ( = ?auto_277493 ?auto_277500 ) ) ( not ( = ?auto_277494 ?auto_277495 ) ) ( not ( = ?auto_277494 ?auto_277496 ) ) ( not ( = ?auto_277494 ?auto_277497 ) ) ( not ( = ?auto_277494 ?auto_277498 ) ) ( not ( = ?auto_277494 ?auto_277499 ) ) ( not ( = ?auto_277494 ?auto_277500 ) ) ( not ( = ?auto_277495 ?auto_277496 ) ) ( not ( = ?auto_277495 ?auto_277497 ) ) ( not ( = ?auto_277495 ?auto_277498 ) ) ( not ( = ?auto_277495 ?auto_277499 ) ) ( not ( = ?auto_277495 ?auto_277500 ) ) ( not ( = ?auto_277496 ?auto_277497 ) ) ( not ( = ?auto_277496 ?auto_277498 ) ) ( not ( = ?auto_277496 ?auto_277499 ) ) ( not ( = ?auto_277496 ?auto_277500 ) ) ( not ( = ?auto_277497 ?auto_277498 ) ) ( not ( = ?auto_277497 ?auto_277499 ) ) ( not ( = ?auto_277497 ?auto_277500 ) ) ( not ( = ?auto_277498 ?auto_277499 ) ) ( not ( = ?auto_277498 ?auto_277500 ) ) ( not ( = ?auto_277499 ?auto_277500 ) ) ( ON ?auto_277498 ?auto_277499 ) ( ON ?auto_277497 ?auto_277498 ) ( ON ?auto_277496 ?auto_277497 ) ( ON ?auto_277495 ?auto_277496 ) ( ON ?auto_277494 ?auto_277495 ) ( ON ?auto_277493 ?auto_277494 ) ( ON ?auto_277492 ?auto_277493 ) ( CLEAR ?auto_277490 ) ( ON ?auto_277491 ?auto_277492 ) ( CLEAR ?auto_277491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_277488 ?auto_277489 ?auto_277490 ?auto_277491 )
      ( MAKE-12PILE ?auto_277488 ?auto_277489 ?auto_277490 ?auto_277491 ?auto_277492 ?auto_277493 ?auto_277494 ?auto_277495 ?auto_277496 ?auto_277497 ?auto_277498 ?auto_277499 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_277538 - BLOCK
      ?auto_277539 - BLOCK
      ?auto_277540 - BLOCK
      ?auto_277541 - BLOCK
      ?auto_277542 - BLOCK
      ?auto_277543 - BLOCK
      ?auto_277544 - BLOCK
      ?auto_277545 - BLOCK
      ?auto_277546 - BLOCK
      ?auto_277547 - BLOCK
      ?auto_277548 - BLOCK
      ?auto_277549 - BLOCK
    )
    :vars
    (
      ?auto_277550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_277549 ?auto_277550 ) ( ON-TABLE ?auto_277538 ) ( ON ?auto_277539 ?auto_277538 ) ( not ( = ?auto_277538 ?auto_277539 ) ) ( not ( = ?auto_277538 ?auto_277540 ) ) ( not ( = ?auto_277538 ?auto_277541 ) ) ( not ( = ?auto_277538 ?auto_277542 ) ) ( not ( = ?auto_277538 ?auto_277543 ) ) ( not ( = ?auto_277538 ?auto_277544 ) ) ( not ( = ?auto_277538 ?auto_277545 ) ) ( not ( = ?auto_277538 ?auto_277546 ) ) ( not ( = ?auto_277538 ?auto_277547 ) ) ( not ( = ?auto_277538 ?auto_277548 ) ) ( not ( = ?auto_277538 ?auto_277549 ) ) ( not ( = ?auto_277538 ?auto_277550 ) ) ( not ( = ?auto_277539 ?auto_277540 ) ) ( not ( = ?auto_277539 ?auto_277541 ) ) ( not ( = ?auto_277539 ?auto_277542 ) ) ( not ( = ?auto_277539 ?auto_277543 ) ) ( not ( = ?auto_277539 ?auto_277544 ) ) ( not ( = ?auto_277539 ?auto_277545 ) ) ( not ( = ?auto_277539 ?auto_277546 ) ) ( not ( = ?auto_277539 ?auto_277547 ) ) ( not ( = ?auto_277539 ?auto_277548 ) ) ( not ( = ?auto_277539 ?auto_277549 ) ) ( not ( = ?auto_277539 ?auto_277550 ) ) ( not ( = ?auto_277540 ?auto_277541 ) ) ( not ( = ?auto_277540 ?auto_277542 ) ) ( not ( = ?auto_277540 ?auto_277543 ) ) ( not ( = ?auto_277540 ?auto_277544 ) ) ( not ( = ?auto_277540 ?auto_277545 ) ) ( not ( = ?auto_277540 ?auto_277546 ) ) ( not ( = ?auto_277540 ?auto_277547 ) ) ( not ( = ?auto_277540 ?auto_277548 ) ) ( not ( = ?auto_277540 ?auto_277549 ) ) ( not ( = ?auto_277540 ?auto_277550 ) ) ( not ( = ?auto_277541 ?auto_277542 ) ) ( not ( = ?auto_277541 ?auto_277543 ) ) ( not ( = ?auto_277541 ?auto_277544 ) ) ( not ( = ?auto_277541 ?auto_277545 ) ) ( not ( = ?auto_277541 ?auto_277546 ) ) ( not ( = ?auto_277541 ?auto_277547 ) ) ( not ( = ?auto_277541 ?auto_277548 ) ) ( not ( = ?auto_277541 ?auto_277549 ) ) ( not ( = ?auto_277541 ?auto_277550 ) ) ( not ( = ?auto_277542 ?auto_277543 ) ) ( not ( = ?auto_277542 ?auto_277544 ) ) ( not ( = ?auto_277542 ?auto_277545 ) ) ( not ( = ?auto_277542 ?auto_277546 ) ) ( not ( = ?auto_277542 ?auto_277547 ) ) ( not ( = ?auto_277542 ?auto_277548 ) ) ( not ( = ?auto_277542 ?auto_277549 ) ) ( not ( = ?auto_277542 ?auto_277550 ) ) ( not ( = ?auto_277543 ?auto_277544 ) ) ( not ( = ?auto_277543 ?auto_277545 ) ) ( not ( = ?auto_277543 ?auto_277546 ) ) ( not ( = ?auto_277543 ?auto_277547 ) ) ( not ( = ?auto_277543 ?auto_277548 ) ) ( not ( = ?auto_277543 ?auto_277549 ) ) ( not ( = ?auto_277543 ?auto_277550 ) ) ( not ( = ?auto_277544 ?auto_277545 ) ) ( not ( = ?auto_277544 ?auto_277546 ) ) ( not ( = ?auto_277544 ?auto_277547 ) ) ( not ( = ?auto_277544 ?auto_277548 ) ) ( not ( = ?auto_277544 ?auto_277549 ) ) ( not ( = ?auto_277544 ?auto_277550 ) ) ( not ( = ?auto_277545 ?auto_277546 ) ) ( not ( = ?auto_277545 ?auto_277547 ) ) ( not ( = ?auto_277545 ?auto_277548 ) ) ( not ( = ?auto_277545 ?auto_277549 ) ) ( not ( = ?auto_277545 ?auto_277550 ) ) ( not ( = ?auto_277546 ?auto_277547 ) ) ( not ( = ?auto_277546 ?auto_277548 ) ) ( not ( = ?auto_277546 ?auto_277549 ) ) ( not ( = ?auto_277546 ?auto_277550 ) ) ( not ( = ?auto_277547 ?auto_277548 ) ) ( not ( = ?auto_277547 ?auto_277549 ) ) ( not ( = ?auto_277547 ?auto_277550 ) ) ( not ( = ?auto_277548 ?auto_277549 ) ) ( not ( = ?auto_277548 ?auto_277550 ) ) ( not ( = ?auto_277549 ?auto_277550 ) ) ( ON ?auto_277548 ?auto_277549 ) ( ON ?auto_277547 ?auto_277548 ) ( ON ?auto_277546 ?auto_277547 ) ( ON ?auto_277545 ?auto_277546 ) ( ON ?auto_277544 ?auto_277545 ) ( ON ?auto_277543 ?auto_277544 ) ( ON ?auto_277542 ?auto_277543 ) ( ON ?auto_277541 ?auto_277542 ) ( CLEAR ?auto_277539 ) ( ON ?auto_277540 ?auto_277541 ) ( CLEAR ?auto_277540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_277538 ?auto_277539 ?auto_277540 )
      ( MAKE-12PILE ?auto_277538 ?auto_277539 ?auto_277540 ?auto_277541 ?auto_277542 ?auto_277543 ?auto_277544 ?auto_277545 ?auto_277546 ?auto_277547 ?auto_277548 ?auto_277549 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_277588 - BLOCK
      ?auto_277589 - BLOCK
      ?auto_277590 - BLOCK
      ?auto_277591 - BLOCK
      ?auto_277592 - BLOCK
      ?auto_277593 - BLOCK
      ?auto_277594 - BLOCK
      ?auto_277595 - BLOCK
      ?auto_277596 - BLOCK
      ?auto_277597 - BLOCK
      ?auto_277598 - BLOCK
      ?auto_277599 - BLOCK
    )
    :vars
    (
      ?auto_277600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_277599 ?auto_277600 ) ( ON-TABLE ?auto_277588 ) ( not ( = ?auto_277588 ?auto_277589 ) ) ( not ( = ?auto_277588 ?auto_277590 ) ) ( not ( = ?auto_277588 ?auto_277591 ) ) ( not ( = ?auto_277588 ?auto_277592 ) ) ( not ( = ?auto_277588 ?auto_277593 ) ) ( not ( = ?auto_277588 ?auto_277594 ) ) ( not ( = ?auto_277588 ?auto_277595 ) ) ( not ( = ?auto_277588 ?auto_277596 ) ) ( not ( = ?auto_277588 ?auto_277597 ) ) ( not ( = ?auto_277588 ?auto_277598 ) ) ( not ( = ?auto_277588 ?auto_277599 ) ) ( not ( = ?auto_277588 ?auto_277600 ) ) ( not ( = ?auto_277589 ?auto_277590 ) ) ( not ( = ?auto_277589 ?auto_277591 ) ) ( not ( = ?auto_277589 ?auto_277592 ) ) ( not ( = ?auto_277589 ?auto_277593 ) ) ( not ( = ?auto_277589 ?auto_277594 ) ) ( not ( = ?auto_277589 ?auto_277595 ) ) ( not ( = ?auto_277589 ?auto_277596 ) ) ( not ( = ?auto_277589 ?auto_277597 ) ) ( not ( = ?auto_277589 ?auto_277598 ) ) ( not ( = ?auto_277589 ?auto_277599 ) ) ( not ( = ?auto_277589 ?auto_277600 ) ) ( not ( = ?auto_277590 ?auto_277591 ) ) ( not ( = ?auto_277590 ?auto_277592 ) ) ( not ( = ?auto_277590 ?auto_277593 ) ) ( not ( = ?auto_277590 ?auto_277594 ) ) ( not ( = ?auto_277590 ?auto_277595 ) ) ( not ( = ?auto_277590 ?auto_277596 ) ) ( not ( = ?auto_277590 ?auto_277597 ) ) ( not ( = ?auto_277590 ?auto_277598 ) ) ( not ( = ?auto_277590 ?auto_277599 ) ) ( not ( = ?auto_277590 ?auto_277600 ) ) ( not ( = ?auto_277591 ?auto_277592 ) ) ( not ( = ?auto_277591 ?auto_277593 ) ) ( not ( = ?auto_277591 ?auto_277594 ) ) ( not ( = ?auto_277591 ?auto_277595 ) ) ( not ( = ?auto_277591 ?auto_277596 ) ) ( not ( = ?auto_277591 ?auto_277597 ) ) ( not ( = ?auto_277591 ?auto_277598 ) ) ( not ( = ?auto_277591 ?auto_277599 ) ) ( not ( = ?auto_277591 ?auto_277600 ) ) ( not ( = ?auto_277592 ?auto_277593 ) ) ( not ( = ?auto_277592 ?auto_277594 ) ) ( not ( = ?auto_277592 ?auto_277595 ) ) ( not ( = ?auto_277592 ?auto_277596 ) ) ( not ( = ?auto_277592 ?auto_277597 ) ) ( not ( = ?auto_277592 ?auto_277598 ) ) ( not ( = ?auto_277592 ?auto_277599 ) ) ( not ( = ?auto_277592 ?auto_277600 ) ) ( not ( = ?auto_277593 ?auto_277594 ) ) ( not ( = ?auto_277593 ?auto_277595 ) ) ( not ( = ?auto_277593 ?auto_277596 ) ) ( not ( = ?auto_277593 ?auto_277597 ) ) ( not ( = ?auto_277593 ?auto_277598 ) ) ( not ( = ?auto_277593 ?auto_277599 ) ) ( not ( = ?auto_277593 ?auto_277600 ) ) ( not ( = ?auto_277594 ?auto_277595 ) ) ( not ( = ?auto_277594 ?auto_277596 ) ) ( not ( = ?auto_277594 ?auto_277597 ) ) ( not ( = ?auto_277594 ?auto_277598 ) ) ( not ( = ?auto_277594 ?auto_277599 ) ) ( not ( = ?auto_277594 ?auto_277600 ) ) ( not ( = ?auto_277595 ?auto_277596 ) ) ( not ( = ?auto_277595 ?auto_277597 ) ) ( not ( = ?auto_277595 ?auto_277598 ) ) ( not ( = ?auto_277595 ?auto_277599 ) ) ( not ( = ?auto_277595 ?auto_277600 ) ) ( not ( = ?auto_277596 ?auto_277597 ) ) ( not ( = ?auto_277596 ?auto_277598 ) ) ( not ( = ?auto_277596 ?auto_277599 ) ) ( not ( = ?auto_277596 ?auto_277600 ) ) ( not ( = ?auto_277597 ?auto_277598 ) ) ( not ( = ?auto_277597 ?auto_277599 ) ) ( not ( = ?auto_277597 ?auto_277600 ) ) ( not ( = ?auto_277598 ?auto_277599 ) ) ( not ( = ?auto_277598 ?auto_277600 ) ) ( not ( = ?auto_277599 ?auto_277600 ) ) ( ON ?auto_277598 ?auto_277599 ) ( ON ?auto_277597 ?auto_277598 ) ( ON ?auto_277596 ?auto_277597 ) ( ON ?auto_277595 ?auto_277596 ) ( ON ?auto_277594 ?auto_277595 ) ( ON ?auto_277593 ?auto_277594 ) ( ON ?auto_277592 ?auto_277593 ) ( ON ?auto_277591 ?auto_277592 ) ( ON ?auto_277590 ?auto_277591 ) ( CLEAR ?auto_277588 ) ( ON ?auto_277589 ?auto_277590 ) ( CLEAR ?auto_277589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_277588 ?auto_277589 )
      ( MAKE-12PILE ?auto_277588 ?auto_277589 ?auto_277590 ?auto_277591 ?auto_277592 ?auto_277593 ?auto_277594 ?auto_277595 ?auto_277596 ?auto_277597 ?auto_277598 ?auto_277599 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_277638 - BLOCK
      ?auto_277639 - BLOCK
      ?auto_277640 - BLOCK
      ?auto_277641 - BLOCK
      ?auto_277642 - BLOCK
      ?auto_277643 - BLOCK
      ?auto_277644 - BLOCK
      ?auto_277645 - BLOCK
      ?auto_277646 - BLOCK
      ?auto_277647 - BLOCK
      ?auto_277648 - BLOCK
      ?auto_277649 - BLOCK
    )
    :vars
    (
      ?auto_277650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_277649 ?auto_277650 ) ( not ( = ?auto_277638 ?auto_277639 ) ) ( not ( = ?auto_277638 ?auto_277640 ) ) ( not ( = ?auto_277638 ?auto_277641 ) ) ( not ( = ?auto_277638 ?auto_277642 ) ) ( not ( = ?auto_277638 ?auto_277643 ) ) ( not ( = ?auto_277638 ?auto_277644 ) ) ( not ( = ?auto_277638 ?auto_277645 ) ) ( not ( = ?auto_277638 ?auto_277646 ) ) ( not ( = ?auto_277638 ?auto_277647 ) ) ( not ( = ?auto_277638 ?auto_277648 ) ) ( not ( = ?auto_277638 ?auto_277649 ) ) ( not ( = ?auto_277638 ?auto_277650 ) ) ( not ( = ?auto_277639 ?auto_277640 ) ) ( not ( = ?auto_277639 ?auto_277641 ) ) ( not ( = ?auto_277639 ?auto_277642 ) ) ( not ( = ?auto_277639 ?auto_277643 ) ) ( not ( = ?auto_277639 ?auto_277644 ) ) ( not ( = ?auto_277639 ?auto_277645 ) ) ( not ( = ?auto_277639 ?auto_277646 ) ) ( not ( = ?auto_277639 ?auto_277647 ) ) ( not ( = ?auto_277639 ?auto_277648 ) ) ( not ( = ?auto_277639 ?auto_277649 ) ) ( not ( = ?auto_277639 ?auto_277650 ) ) ( not ( = ?auto_277640 ?auto_277641 ) ) ( not ( = ?auto_277640 ?auto_277642 ) ) ( not ( = ?auto_277640 ?auto_277643 ) ) ( not ( = ?auto_277640 ?auto_277644 ) ) ( not ( = ?auto_277640 ?auto_277645 ) ) ( not ( = ?auto_277640 ?auto_277646 ) ) ( not ( = ?auto_277640 ?auto_277647 ) ) ( not ( = ?auto_277640 ?auto_277648 ) ) ( not ( = ?auto_277640 ?auto_277649 ) ) ( not ( = ?auto_277640 ?auto_277650 ) ) ( not ( = ?auto_277641 ?auto_277642 ) ) ( not ( = ?auto_277641 ?auto_277643 ) ) ( not ( = ?auto_277641 ?auto_277644 ) ) ( not ( = ?auto_277641 ?auto_277645 ) ) ( not ( = ?auto_277641 ?auto_277646 ) ) ( not ( = ?auto_277641 ?auto_277647 ) ) ( not ( = ?auto_277641 ?auto_277648 ) ) ( not ( = ?auto_277641 ?auto_277649 ) ) ( not ( = ?auto_277641 ?auto_277650 ) ) ( not ( = ?auto_277642 ?auto_277643 ) ) ( not ( = ?auto_277642 ?auto_277644 ) ) ( not ( = ?auto_277642 ?auto_277645 ) ) ( not ( = ?auto_277642 ?auto_277646 ) ) ( not ( = ?auto_277642 ?auto_277647 ) ) ( not ( = ?auto_277642 ?auto_277648 ) ) ( not ( = ?auto_277642 ?auto_277649 ) ) ( not ( = ?auto_277642 ?auto_277650 ) ) ( not ( = ?auto_277643 ?auto_277644 ) ) ( not ( = ?auto_277643 ?auto_277645 ) ) ( not ( = ?auto_277643 ?auto_277646 ) ) ( not ( = ?auto_277643 ?auto_277647 ) ) ( not ( = ?auto_277643 ?auto_277648 ) ) ( not ( = ?auto_277643 ?auto_277649 ) ) ( not ( = ?auto_277643 ?auto_277650 ) ) ( not ( = ?auto_277644 ?auto_277645 ) ) ( not ( = ?auto_277644 ?auto_277646 ) ) ( not ( = ?auto_277644 ?auto_277647 ) ) ( not ( = ?auto_277644 ?auto_277648 ) ) ( not ( = ?auto_277644 ?auto_277649 ) ) ( not ( = ?auto_277644 ?auto_277650 ) ) ( not ( = ?auto_277645 ?auto_277646 ) ) ( not ( = ?auto_277645 ?auto_277647 ) ) ( not ( = ?auto_277645 ?auto_277648 ) ) ( not ( = ?auto_277645 ?auto_277649 ) ) ( not ( = ?auto_277645 ?auto_277650 ) ) ( not ( = ?auto_277646 ?auto_277647 ) ) ( not ( = ?auto_277646 ?auto_277648 ) ) ( not ( = ?auto_277646 ?auto_277649 ) ) ( not ( = ?auto_277646 ?auto_277650 ) ) ( not ( = ?auto_277647 ?auto_277648 ) ) ( not ( = ?auto_277647 ?auto_277649 ) ) ( not ( = ?auto_277647 ?auto_277650 ) ) ( not ( = ?auto_277648 ?auto_277649 ) ) ( not ( = ?auto_277648 ?auto_277650 ) ) ( not ( = ?auto_277649 ?auto_277650 ) ) ( ON ?auto_277648 ?auto_277649 ) ( ON ?auto_277647 ?auto_277648 ) ( ON ?auto_277646 ?auto_277647 ) ( ON ?auto_277645 ?auto_277646 ) ( ON ?auto_277644 ?auto_277645 ) ( ON ?auto_277643 ?auto_277644 ) ( ON ?auto_277642 ?auto_277643 ) ( ON ?auto_277641 ?auto_277642 ) ( ON ?auto_277640 ?auto_277641 ) ( ON ?auto_277639 ?auto_277640 ) ( ON ?auto_277638 ?auto_277639 ) ( CLEAR ?auto_277638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_277638 )
      ( MAKE-12PILE ?auto_277638 ?auto_277639 ?auto_277640 ?auto_277641 ?auto_277642 ?auto_277643 ?auto_277644 ?auto_277645 ?auto_277646 ?auto_277647 ?auto_277648 ?auto_277649 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_277689 - BLOCK
      ?auto_277690 - BLOCK
      ?auto_277691 - BLOCK
      ?auto_277692 - BLOCK
      ?auto_277693 - BLOCK
      ?auto_277694 - BLOCK
      ?auto_277695 - BLOCK
      ?auto_277696 - BLOCK
      ?auto_277697 - BLOCK
      ?auto_277698 - BLOCK
      ?auto_277699 - BLOCK
      ?auto_277700 - BLOCK
      ?auto_277701 - BLOCK
    )
    :vars
    (
      ?auto_277702 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_277700 ) ( ON ?auto_277701 ?auto_277702 ) ( CLEAR ?auto_277701 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_277689 ) ( ON ?auto_277690 ?auto_277689 ) ( ON ?auto_277691 ?auto_277690 ) ( ON ?auto_277692 ?auto_277691 ) ( ON ?auto_277693 ?auto_277692 ) ( ON ?auto_277694 ?auto_277693 ) ( ON ?auto_277695 ?auto_277694 ) ( ON ?auto_277696 ?auto_277695 ) ( ON ?auto_277697 ?auto_277696 ) ( ON ?auto_277698 ?auto_277697 ) ( ON ?auto_277699 ?auto_277698 ) ( ON ?auto_277700 ?auto_277699 ) ( not ( = ?auto_277689 ?auto_277690 ) ) ( not ( = ?auto_277689 ?auto_277691 ) ) ( not ( = ?auto_277689 ?auto_277692 ) ) ( not ( = ?auto_277689 ?auto_277693 ) ) ( not ( = ?auto_277689 ?auto_277694 ) ) ( not ( = ?auto_277689 ?auto_277695 ) ) ( not ( = ?auto_277689 ?auto_277696 ) ) ( not ( = ?auto_277689 ?auto_277697 ) ) ( not ( = ?auto_277689 ?auto_277698 ) ) ( not ( = ?auto_277689 ?auto_277699 ) ) ( not ( = ?auto_277689 ?auto_277700 ) ) ( not ( = ?auto_277689 ?auto_277701 ) ) ( not ( = ?auto_277689 ?auto_277702 ) ) ( not ( = ?auto_277690 ?auto_277691 ) ) ( not ( = ?auto_277690 ?auto_277692 ) ) ( not ( = ?auto_277690 ?auto_277693 ) ) ( not ( = ?auto_277690 ?auto_277694 ) ) ( not ( = ?auto_277690 ?auto_277695 ) ) ( not ( = ?auto_277690 ?auto_277696 ) ) ( not ( = ?auto_277690 ?auto_277697 ) ) ( not ( = ?auto_277690 ?auto_277698 ) ) ( not ( = ?auto_277690 ?auto_277699 ) ) ( not ( = ?auto_277690 ?auto_277700 ) ) ( not ( = ?auto_277690 ?auto_277701 ) ) ( not ( = ?auto_277690 ?auto_277702 ) ) ( not ( = ?auto_277691 ?auto_277692 ) ) ( not ( = ?auto_277691 ?auto_277693 ) ) ( not ( = ?auto_277691 ?auto_277694 ) ) ( not ( = ?auto_277691 ?auto_277695 ) ) ( not ( = ?auto_277691 ?auto_277696 ) ) ( not ( = ?auto_277691 ?auto_277697 ) ) ( not ( = ?auto_277691 ?auto_277698 ) ) ( not ( = ?auto_277691 ?auto_277699 ) ) ( not ( = ?auto_277691 ?auto_277700 ) ) ( not ( = ?auto_277691 ?auto_277701 ) ) ( not ( = ?auto_277691 ?auto_277702 ) ) ( not ( = ?auto_277692 ?auto_277693 ) ) ( not ( = ?auto_277692 ?auto_277694 ) ) ( not ( = ?auto_277692 ?auto_277695 ) ) ( not ( = ?auto_277692 ?auto_277696 ) ) ( not ( = ?auto_277692 ?auto_277697 ) ) ( not ( = ?auto_277692 ?auto_277698 ) ) ( not ( = ?auto_277692 ?auto_277699 ) ) ( not ( = ?auto_277692 ?auto_277700 ) ) ( not ( = ?auto_277692 ?auto_277701 ) ) ( not ( = ?auto_277692 ?auto_277702 ) ) ( not ( = ?auto_277693 ?auto_277694 ) ) ( not ( = ?auto_277693 ?auto_277695 ) ) ( not ( = ?auto_277693 ?auto_277696 ) ) ( not ( = ?auto_277693 ?auto_277697 ) ) ( not ( = ?auto_277693 ?auto_277698 ) ) ( not ( = ?auto_277693 ?auto_277699 ) ) ( not ( = ?auto_277693 ?auto_277700 ) ) ( not ( = ?auto_277693 ?auto_277701 ) ) ( not ( = ?auto_277693 ?auto_277702 ) ) ( not ( = ?auto_277694 ?auto_277695 ) ) ( not ( = ?auto_277694 ?auto_277696 ) ) ( not ( = ?auto_277694 ?auto_277697 ) ) ( not ( = ?auto_277694 ?auto_277698 ) ) ( not ( = ?auto_277694 ?auto_277699 ) ) ( not ( = ?auto_277694 ?auto_277700 ) ) ( not ( = ?auto_277694 ?auto_277701 ) ) ( not ( = ?auto_277694 ?auto_277702 ) ) ( not ( = ?auto_277695 ?auto_277696 ) ) ( not ( = ?auto_277695 ?auto_277697 ) ) ( not ( = ?auto_277695 ?auto_277698 ) ) ( not ( = ?auto_277695 ?auto_277699 ) ) ( not ( = ?auto_277695 ?auto_277700 ) ) ( not ( = ?auto_277695 ?auto_277701 ) ) ( not ( = ?auto_277695 ?auto_277702 ) ) ( not ( = ?auto_277696 ?auto_277697 ) ) ( not ( = ?auto_277696 ?auto_277698 ) ) ( not ( = ?auto_277696 ?auto_277699 ) ) ( not ( = ?auto_277696 ?auto_277700 ) ) ( not ( = ?auto_277696 ?auto_277701 ) ) ( not ( = ?auto_277696 ?auto_277702 ) ) ( not ( = ?auto_277697 ?auto_277698 ) ) ( not ( = ?auto_277697 ?auto_277699 ) ) ( not ( = ?auto_277697 ?auto_277700 ) ) ( not ( = ?auto_277697 ?auto_277701 ) ) ( not ( = ?auto_277697 ?auto_277702 ) ) ( not ( = ?auto_277698 ?auto_277699 ) ) ( not ( = ?auto_277698 ?auto_277700 ) ) ( not ( = ?auto_277698 ?auto_277701 ) ) ( not ( = ?auto_277698 ?auto_277702 ) ) ( not ( = ?auto_277699 ?auto_277700 ) ) ( not ( = ?auto_277699 ?auto_277701 ) ) ( not ( = ?auto_277699 ?auto_277702 ) ) ( not ( = ?auto_277700 ?auto_277701 ) ) ( not ( = ?auto_277700 ?auto_277702 ) ) ( not ( = ?auto_277701 ?auto_277702 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_277701 ?auto_277702 )
      ( !STACK ?auto_277701 ?auto_277700 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_277743 - BLOCK
      ?auto_277744 - BLOCK
      ?auto_277745 - BLOCK
      ?auto_277746 - BLOCK
      ?auto_277747 - BLOCK
      ?auto_277748 - BLOCK
      ?auto_277749 - BLOCK
      ?auto_277750 - BLOCK
      ?auto_277751 - BLOCK
      ?auto_277752 - BLOCK
      ?auto_277753 - BLOCK
      ?auto_277754 - BLOCK
      ?auto_277755 - BLOCK
    )
    :vars
    (
      ?auto_277756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_277755 ?auto_277756 ) ( ON-TABLE ?auto_277743 ) ( ON ?auto_277744 ?auto_277743 ) ( ON ?auto_277745 ?auto_277744 ) ( ON ?auto_277746 ?auto_277745 ) ( ON ?auto_277747 ?auto_277746 ) ( ON ?auto_277748 ?auto_277747 ) ( ON ?auto_277749 ?auto_277748 ) ( ON ?auto_277750 ?auto_277749 ) ( ON ?auto_277751 ?auto_277750 ) ( ON ?auto_277752 ?auto_277751 ) ( ON ?auto_277753 ?auto_277752 ) ( not ( = ?auto_277743 ?auto_277744 ) ) ( not ( = ?auto_277743 ?auto_277745 ) ) ( not ( = ?auto_277743 ?auto_277746 ) ) ( not ( = ?auto_277743 ?auto_277747 ) ) ( not ( = ?auto_277743 ?auto_277748 ) ) ( not ( = ?auto_277743 ?auto_277749 ) ) ( not ( = ?auto_277743 ?auto_277750 ) ) ( not ( = ?auto_277743 ?auto_277751 ) ) ( not ( = ?auto_277743 ?auto_277752 ) ) ( not ( = ?auto_277743 ?auto_277753 ) ) ( not ( = ?auto_277743 ?auto_277754 ) ) ( not ( = ?auto_277743 ?auto_277755 ) ) ( not ( = ?auto_277743 ?auto_277756 ) ) ( not ( = ?auto_277744 ?auto_277745 ) ) ( not ( = ?auto_277744 ?auto_277746 ) ) ( not ( = ?auto_277744 ?auto_277747 ) ) ( not ( = ?auto_277744 ?auto_277748 ) ) ( not ( = ?auto_277744 ?auto_277749 ) ) ( not ( = ?auto_277744 ?auto_277750 ) ) ( not ( = ?auto_277744 ?auto_277751 ) ) ( not ( = ?auto_277744 ?auto_277752 ) ) ( not ( = ?auto_277744 ?auto_277753 ) ) ( not ( = ?auto_277744 ?auto_277754 ) ) ( not ( = ?auto_277744 ?auto_277755 ) ) ( not ( = ?auto_277744 ?auto_277756 ) ) ( not ( = ?auto_277745 ?auto_277746 ) ) ( not ( = ?auto_277745 ?auto_277747 ) ) ( not ( = ?auto_277745 ?auto_277748 ) ) ( not ( = ?auto_277745 ?auto_277749 ) ) ( not ( = ?auto_277745 ?auto_277750 ) ) ( not ( = ?auto_277745 ?auto_277751 ) ) ( not ( = ?auto_277745 ?auto_277752 ) ) ( not ( = ?auto_277745 ?auto_277753 ) ) ( not ( = ?auto_277745 ?auto_277754 ) ) ( not ( = ?auto_277745 ?auto_277755 ) ) ( not ( = ?auto_277745 ?auto_277756 ) ) ( not ( = ?auto_277746 ?auto_277747 ) ) ( not ( = ?auto_277746 ?auto_277748 ) ) ( not ( = ?auto_277746 ?auto_277749 ) ) ( not ( = ?auto_277746 ?auto_277750 ) ) ( not ( = ?auto_277746 ?auto_277751 ) ) ( not ( = ?auto_277746 ?auto_277752 ) ) ( not ( = ?auto_277746 ?auto_277753 ) ) ( not ( = ?auto_277746 ?auto_277754 ) ) ( not ( = ?auto_277746 ?auto_277755 ) ) ( not ( = ?auto_277746 ?auto_277756 ) ) ( not ( = ?auto_277747 ?auto_277748 ) ) ( not ( = ?auto_277747 ?auto_277749 ) ) ( not ( = ?auto_277747 ?auto_277750 ) ) ( not ( = ?auto_277747 ?auto_277751 ) ) ( not ( = ?auto_277747 ?auto_277752 ) ) ( not ( = ?auto_277747 ?auto_277753 ) ) ( not ( = ?auto_277747 ?auto_277754 ) ) ( not ( = ?auto_277747 ?auto_277755 ) ) ( not ( = ?auto_277747 ?auto_277756 ) ) ( not ( = ?auto_277748 ?auto_277749 ) ) ( not ( = ?auto_277748 ?auto_277750 ) ) ( not ( = ?auto_277748 ?auto_277751 ) ) ( not ( = ?auto_277748 ?auto_277752 ) ) ( not ( = ?auto_277748 ?auto_277753 ) ) ( not ( = ?auto_277748 ?auto_277754 ) ) ( not ( = ?auto_277748 ?auto_277755 ) ) ( not ( = ?auto_277748 ?auto_277756 ) ) ( not ( = ?auto_277749 ?auto_277750 ) ) ( not ( = ?auto_277749 ?auto_277751 ) ) ( not ( = ?auto_277749 ?auto_277752 ) ) ( not ( = ?auto_277749 ?auto_277753 ) ) ( not ( = ?auto_277749 ?auto_277754 ) ) ( not ( = ?auto_277749 ?auto_277755 ) ) ( not ( = ?auto_277749 ?auto_277756 ) ) ( not ( = ?auto_277750 ?auto_277751 ) ) ( not ( = ?auto_277750 ?auto_277752 ) ) ( not ( = ?auto_277750 ?auto_277753 ) ) ( not ( = ?auto_277750 ?auto_277754 ) ) ( not ( = ?auto_277750 ?auto_277755 ) ) ( not ( = ?auto_277750 ?auto_277756 ) ) ( not ( = ?auto_277751 ?auto_277752 ) ) ( not ( = ?auto_277751 ?auto_277753 ) ) ( not ( = ?auto_277751 ?auto_277754 ) ) ( not ( = ?auto_277751 ?auto_277755 ) ) ( not ( = ?auto_277751 ?auto_277756 ) ) ( not ( = ?auto_277752 ?auto_277753 ) ) ( not ( = ?auto_277752 ?auto_277754 ) ) ( not ( = ?auto_277752 ?auto_277755 ) ) ( not ( = ?auto_277752 ?auto_277756 ) ) ( not ( = ?auto_277753 ?auto_277754 ) ) ( not ( = ?auto_277753 ?auto_277755 ) ) ( not ( = ?auto_277753 ?auto_277756 ) ) ( not ( = ?auto_277754 ?auto_277755 ) ) ( not ( = ?auto_277754 ?auto_277756 ) ) ( not ( = ?auto_277755 ?auto_277756 ) ) ( CLEAR ?auto_277753 ) ( ON ?auto_277754 ?auto_277755 ) ( CLEAR ?auto_277754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_277743 ?auto_277744 ?auto_277745 ?auto_277746 ?auto_277747 ?auto_277748 ?auto_277749 ?auto_277750 ?auto_277751 ?auto_277752 ?auto_277753 ?auto_277754 )
      ( MAKE-13PILE ?auto_277743 ?auto_277744 ?auto_277745 ?auto_277746 ?auto_277747 ?auto_277748 ?auto_277749 ?auto_277750 ?auto_277751 ?auto_277752 ?auto_277753 ?auto_277754 ?auto_277755 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_277797 - BLOCK
      ?auto_277798 - BLOCK
      ?auto_277799 - BLOCK
      ?auto_277800 - BLOCK
      ?auto_277801 - BLOCK
      ?auto_277802 - BLOCK
      ?auto_277803 - BLOCK
      ?auto_277804 - BLOCK
      ?auto_277805 - BLOCK
      ?auto_277806 - BLOCK
      ?auto_277807 - BLOCK
      ?auto_277808 - BLOCK
      ?auto_277809 - BLOCK
    )
    :vars
    (
      ?auto_277810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_277809 ?auto_277810 ) ( ON-TABLE ?auto_277797 ) ( ON ?auto_277798 ?auto_277797 ) ( ON ?auto_277799 ?auto_277798 ) ( ON ?auto_277800 ?auto_277799 ) ( ON ?auto_277801 ?auto_277800 ) ( ON ?auto_277802 ?auto_277801 ) ( ON ?auto_277803 ?auto_277802 ) ( ON ?auto_277804 ?auto_277803 ) ( ON ?auto_277805 ?auto_277804 ) ( ON ?auto_277806 ?auto_277805 ) ( not ( = ?auto_277797 ?auto_277798 ) ) ( not ( = ?auto_277797 ?auto_277799 ) ) ( not ( = ?auto_277797 ?auto_277800 ) ) ( not ( = ?auto_277797 ?auto_277801 ) ) ( not ( = ?auto_277797 ?auto_277802 ) ) ( not ( = ?auto_277797 ?auto_277803 ) ) ( not ( = ?auto_277797 ?auto_277804 ) ) ( not ( = ?auto_277797 ?auto_277805 ) ) ( not ( = ?auto_277797 ?auto_277806 ) ) ( not ( = ?auto_277797 ?auto_277807 ) ) ( not ( = ?auto_277797 ?auto_277808 ) ) ( not ( = ?auto_277797 ?auto_277809 ) ) ( not ( = ?auto_277797 ?auto_277810 ) ) ( not ( = ?auto_277798 ?auto_277799 ) ) ( not ( = ?auto_277798 ?auto_277800 ) ) ( not ( = ?auto_277798 ?auto_277801 ) ) ( not ( = ?auto_277798 ?auto_277802 ) ) ( not ( = ?auto_277798 ?auto_277803 ) ) ( not ( = ?auto_277798 ?auto_277804 ) ) ( not ( = ?auto_277798 ?auto_277805 ) ) ( not ( = ?auto_277798 ?auto_277806 ) ) ( not ( = ?auto_277798 ?auto_277807 ) ) ( not ( = ?auto_277798 ?auto_277808 ) ) ( not ( = ?auto_277798 ?auto_277809 ) ) ( not ( = ?auto_277798 ?auto_277810 ) ) ( not ( = ?auto_277799 ?auto_277800 ) ) ( not ( = ?auto_277799 ?auto_277801 ) ) ( not ( = ?auto_277799 ?auto_277802 ) ) ( not ( = ?auto_277799 ?auto_277803 ) ) ( not ( = ?auto_277799 ?auto_277804 ) ) ( not ( = ?auto_277799 ?auto_277805 ) ) ( not ( = ?auto_277799 ?auto_277806 ) ) ( not ( = ?auto_277799 ?auto_277807 ) ) ( not ( = ?auto_277799 ?auto_277808 ) ) ( not ( = ?auto_277799 ?auto_277809 ) ) ( not ( = ?auto_277799 ?auto_277810 ) ) ( not ( = ?auto_277800 ?auto_277801 ) ) ( not ( = ?auto_277800 ?auto_277802 ) ) ( not ( = ?auto_277800 ?auto_277803 ) ) ( not ( = ?auto_277800 ?auto_277804 ) ) ( not ( = ?auto_277800 ?auto_277805 ) ) ( not ( = ?auto_277800 ?auto_277806 ) ) ( not ( = ?auto_277800 ?auto_277807 ) ) ( not ( = ?auto_277800 ?auto_277808 ) ) ( not ( = ?auto_277800 ?auto_277809 ) ) ( not ( = ?auto_277800 ?auto_277810 ) ) ( not ( = ?auto_277801 ?auto_277802 ) ) ( not ( = ?auto_277801 ?auto_277803 ) ) ( not ( = ?auto_277801 ?auto_277804 ) ) ( not ( = ?auto_277801 ?auto_277805 ) ) ( not ( = ?auto_277801 ?auto_277806 ) ) ( not ( = ?auto_277801 ?auto_277807 ) ) ( not ( = ?auto_277801 ?auto_277808 ) ) ( not ( = ?auto_277801 ?auto_277809 ) ) ( not ( = ?auto_277801 ?auto_277810 ) ) ( not ( = ?auto_277802 ?auto_277803 ) ) ( not ( = ?auto_277802 ?auto_277804 ) ) ( not ( = ?auto_277802 ?auto_277805 ) ) ( not ( = ?auto_277802 ?auto_277806 ) ) ( not ( = ?auto_277802 ?auto_277807 ) ) ( not ( = ?auto_277802 ?auto_277808 ) ) ( not ( = ?auto_277802 ?auto_277809 ) ) ( not ( = ?auto_277802 ?auto_277810 ) ) ( not ( = ?auto_277803 ?auto_277804 ) ) ( not ( = ?auto_277803 ?auto_277805 ) ) ( not ( = ?auto_277803 ?auto_277806 ) ) ( not ( = ?auto_277803 ?auto_277807 ) ) ( not ( = ?auto_277803 ?auto_277808 ) ) ( not ( = ?auto_277803 ?auto_277809 ) ) ( not ( = ?auto_277803 ?auto_277810 ) ) ( not ( = ?auto_277804 ?auto_277805 ) ) ( not ( = ?auto_277804 ?auto_277806 ) ) ( not ( = ?auto_277804 ?auto_277807 ) ) ( not ( = ?auto_277804 ?auto_277808 ) ) ( not ( = ?auto_277804 ?auto_277809 ) ) ( not ( = ?auto_277804 ?auto_277810 ) ) ( not ( = ?auto_277805 ?auto_277806 ) ) ( not ( = ?auto_277805 ?auto_277807 ) ) ( not ( = ?auto_277805 ?auto_277808 ) ) ( not ( = ?auto_277805 ?auto_277809 ) ) ( not ( = ?auto_277805 ?auto_277810 ) ) ( not ( = ?auto_277806 ?auto_277807 ) ) ( not ( = ?auto_277806 ?auto_277808 ) ) ( not ( = ?auto_277806 ?auto_277809 ) ) ( not ( = ?auto_277806 ?auto_277810 ) ) ( not ( = ?auto_277807 ?auto_277808 ) ) ( not ( = ?auto_277807 ?auto_277809 ) ) ( not ( = ?auto_277807 ?auto_277810 ) ) ( not ( = ?auto_277808 ?auto_277809 ) ) ( not ( = ?auto_277808 ?auto_277810 ) ) ( not ( = ?auto_277809 ?auto_277810 ) ) ( ON ?auto_277808 ?auto_277809 ) ( CLEAR ?auto_277806 ) ( ON ?auto_277807 ?auto_277808 ) ( CLEAR ?auto_277807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_277797 ?auto_277798 ?auto_277799 ?auto_277800 ?auto_277801 ?auto_277802 ?auto_277803 ?auto_277804 ?auto_277805 ?auto_277806 ?auto_277807 )
      ( MAKE-13PILE ?auto_277797 ?auto_277798 ?auto_277799 ?auto_277800 ?auto_277801 ?auto_277802 ?auto_277803 ?auto_277804 ?auto_277805 ?auto_277806 ?auto_277807 ?auto_277808 ?auto_277809 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_277851 - BLOCK
      ?auto_277852 - BLOCK
      ?auto_277853 - BLOCK
      ?auto_277854 - BLOCK
      ?auto_277855 - BLOCK
      ?auto_277856 - BLOCK
      ?auto_277857 - BLOCK
      ?auto_277858 - BLOCK
      ?auto_277859 - BLOCK
      ?auto_277860 - BLOCK
      ?auto_277861 - BLOCK
      ?auto_277862 - BLOCK
      ?auto_277863 - BLOCK
    )
    :vars
    (
      ?auto_277864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_277863 ?auto_277864 ) ( ON-TABLE ?auto_277851 ) ( ON ?auto_277852 ?auto_277851 ) ( ON ?auto_277853 ?auto_277852 ) ( ON ?auto_277854 ?auto_277853 ) ( ON ?auto_277855 ?auto_277854 ) ( ON ?auto_277856 ?auto_277855 ) ( ON ?auto_277857 ?auto_277856 ) ( ON ?auto_277858 ?auto_277857 ) ( ON ?auto_277859 ?auto_277858 ) ( not ( = ?auto_277851 ?auto_277852 ) ) ( not ( = ?auto_277851 ?auto_277853 ) ) ( not ( = ?auto_277851 ?auto_277854 ) ) ( not ( = ?auto_277851 ?auto_277855 ) ) ( not ( = ?auto_277851 ?auto_277856 ) ) ( not ( = ?auto_277851 ?auto_277857 ) ) ( not ( = ?auto_277851 ?auto_277858 ) ) ( not ( = ?auto_277851 ?auto_277859 ) ) ( not ( = ?auto_277851 ?auto_277860 ) ) ( not ( = ?auto_277851 ?auto_277861 ) ) ( not ( = ?auto_277851 ?auto_277862 ) ) ( not ( = ?auto_277851 ?auto_277863 ) ) ( not ( = ?auto_277851 ?auto_277864 ) ) ( not ( = ?auto_277852 ?auto_277853 ) ) ( not ( = ?auto_277852 ?auto_277854 ) ) ( not ( = ?auto_277852 ?auto_277855 ) ) ( not ( = ?auto_277852 ?auto_277856 ) ) ( not ( = ?auto_277852 ?auto_277857 ) ) ( not ( = ?auto_277852 ?auto_277858 ) ) ( not ( = ?auto_277852 ?auto_277859 ) ) ( not ( = ?auto_277852 ?auto_277860 ) ) ( not ( = ?auto_277852 ?auto_277861 ) ) ( not ( = ?auto_277852 ?auto_277862 ) ) ( not ( = ?auto_277852 ?auto_277863 ) ) ( not ( = ?auto_277852 ?auto_277864 ) ) ( not ( = ?auto_277853 ?auto_277854 ) ) ( not ( = ?auto_277853 ?auto_277855 ) ) ( not ( = ?auto_277853 ?auto_277856 ) ) ( not ( = ?auto_277853 ?auto_277857 ) ) ( not ( = ?auto_277853 ?auto_277858 ) ) ( not ( = ?auto_277853 ?auto_277859 ) ) ( not ( = ?auto_277853 ?auto_277860 ) ) ( not ( = ?auto_277853 ?auto_277861 ) ) ( not ( = ?auto_277853 ?auto_277862 ) ) ( not ( = ?auto_277853 ?auto_277863 ) ) ( not ( = ?auto_277853 ?auto_277864 ) ) ( not ( = ?auto_277854 ?auto_277855 ) ) ( not ( = ?auto_277854 ?auto_277856 ) ) ( not ( = ?auto_277854 ?auto_277857 ) ) ( not ( = ?auto_277854 ?auto_277858 ) ) ( not ( = ?auto_277854 ?auto_277859 ) ) ( not ( = ?auto_277854 ?auto_277860 ) ) ( not ( = ?auto_277854 ?auto_277861 ) ) ( not ( = ?auto_277854 ?auto_277862 ) ) ( not ( = ?auto_277854 ?auto_277863 ) ) ( not ( = ?auto_277854 ?auto_277864 ) ) ( not ( = ?auto_277855 ?auto_277856 ) ) ( not ( = ?auto_277855 ?auto_277857 ) ) ( not ( = ?auto_277855 ?auto_277858 ) ) ( not ( = ?auto_277855 ?auto_277859 ) ) ( not ( = ?auto_277855 ?auto_277860 ) ) ( not ( = ?auto_277855 ?auto_277861 ) ) ( not ( = ?auto_277855 ?auto_277862 ) ) ( not ( = ?auto_277855 ?auto_277863 ) ) ( not ( = ?auto_277855 ?auto_277864 ) ) ( not ( = ?auto_277856 ?auto_277857 ) ) ( not ( = ?auto_277856 ?auto_277858 ) ) ( not ( = ?auto_277856 ?auto_277859 ) ) ( not ( = ?auto_277856 ?auto_277860 ) ) ( not ( = ?auto_277856 ?auto_277861 ) ) ( not ( = ?auto_277856 ?auto_277862 ) ) ( not ( = ?auto_277856 ?auto_277863 ) ) ( not ( = ?auto_277856 ?auto_277864 ) ) ( not ( = ?auto_277857 ?auto_277858 ) ) ( not ( = ?auto_277857 ?auto_277859 ) ) ( not ( = ?auto_277857 ?auto_277860 ) ) ( not ( = ?auto_277857 ?auto_277861 ) ) ( not ( = ?auto_277857 ?auto_277862 ) ) ( not ( = ?auto_277857 ?auto_277863 ) ) ( not ( = ?auto_277857 ?auto_277864 ) ) ( not ( = ?auto_277858 ?auto_277859 ) ) ( not ( = ?auto_277858 ?auto_277860 ) ) ( not ( = ?auto_277858 ?auto_277861 ) ) ( not ( = ?auto_277858 ?auto_277862 ) ) ( not ( = ?auto_277858 ?auto_277863 ) ) ( not ( = ?auto_277858 ?auto_277864 ) ) ( not ( = ?auto_277859 ?auto_277860 ) ) ( not ( = ?auto_277859 ?auto_277861 ) ) ( not ( = ?auto_277859 ?auto_277862 ) ) ( not ( = ?auto_277859 ?auto_277863 ) ) ( not ( = ?auto_277859 ?auto_277864 ) ) ( not ( = ?auto_277860 ?auto_277861 ) ) ( not ( = ?auto_277860 ?auto_277862 ) ) ( not ( = ?auto_277860 ?auto_277863 ) ) ( not ( = ?auto_277860 ?auto_277864 ) ) ( not ( = ?auto_277861 ?auto_277862 ) ) ( not ( = ?auto_277861 ?auto_277863 ) ) ( not ( = ?auto_277861 ?auto_277864 ) ) ( not ( = ?auto_277862 ?auto_277863 ) ) ( not ( = ?auto_277862 ?auto_277864 ) ) ( not ( = ?auto_277863 ?auto_277864 ) ) ( ON ?auto_277862 ?auto_277863 ) ( ON ?auto_277861 ?auto_277862 ) ( CLEAR ?auto_277859 ) ( ON ?auto_277860 ?auto_277861 ) ( CLEAR ?auto_277860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_277851 ?auto_277852 ?auto_277853 ?auto_277854 ?auto_277855 ?auto_277856 ?auto_277857 ?auto_277858 ?auto_277859 ?auto_277860 )
      ( MAKE-13PILE ?auto_277851 ?auto_277852 ?auto_277853 ?auto_277854 ?auto_277855 ?auto_277856 ?auto_277857 ?auto_277858 ?auto_277859 ?auto_277860 ?auto_277861 ?auto_277862 ?auto_277863 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_277905 - BLOCK
      ?auto_277906 - BLOCK
      ?auto_277907 - BLOCK
      ?auto_277908 - BLOCK
      ?auto_277909 - BLOCK
      ?auto_277910 - BLOCK
      ?auto_277911 - BLOCK
      ?auto_277912 - BLOCK
      ?auto_277913 - BLOCK
      ?auto_277914 - BLOCK
      ?auto_277915 - BLOCK
      ?auto_277916 - BLOCK
      ?auto_277917 - BLOCK
    )
    :vars
    (
      ?auto_277918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_277917 ?auto_277918 ) ( ON-TABLE ?auto_277905 ) ( ON ?auto_277906 ?auto_277905 ) ( ON ?auto_277907 ?auto_277906 ) ( ON ?auto_277908 ?auto_277907 ) ( ON ?auto_277909 ?auto_277908 ) ( ON ?auto_277910 ?auto_277909 ) ( ON ?auto_277911 ?auto_277910 ) ( ON ?auto_277912 ?auto_277911 ) ( not ( = ?auto_277905 ?auto_277906 ) ) ( not ( = ?auto_277905 ?auto_277907 ) ) ( not ( = ?auto_277905 ?auto_277908 ) ) ( not ( = ?auto_277905 ?auto_277909 ) ) ( not ( = ?auto_277905 ?auto_277910 ) ) ( not ( = ?auto_277905 ?auto_277911 ) ) ( not ( = ?auto_277905 ?auto_277912 ) ) ( not ( = ?auto_277905 ?auto_277913 ) ) ( not ( = ?auto_277905 ?auto_277914 ) ) ( not ( = ?auto_277905 ?auto_277915 ) ) ( not ( = ?auto_277905 ?auto_277916 ) ) ( not ( = ?auto_277905 ?auto_277917 ) ) ( not ( = ?auto_277905 ?auto_277918 ) ) ( not ( = ?auto_277906 ?auto_277907 ) ) ( not ( = ?auto_277906 ?auto_277908 ) ) ( not ( = ?auto_277906 ?auto_277909 ) ) ( not ( = ?auto_277906 ?auto_277910 ) ) ( not ( = ?auto_277906 ?auto_277911 ) ) ( not ( = ?auto_277906 ?auto_277912 ) ) ( not ( = ?auto_277906 ?auto_277913 ) ) ( not ( = ?auto_277906 ?auto_277914 ) ) ( not ( = ?auto_277906 ?auto_277915 ) ) ( not ( = ?auto_277906 ?auto_277916 ) ) ( not ( = ?auto_277906 ?auto_277917 ) ) ( not ( = ?auto_277906 ?auto_277918 ) ) ( not ( = ?auto_277907 ?auto_277908 ) ) ( not ( = ?auto_277907 ?auto_277909 ) ) ( not ( = ?auto_277907 ?auto_277910 ) ) ( not ( = ?auto_277907 ?auto_277911 ) ) ( not ( = ?auto_277907 ?auto_277912 ) ) ( not ( = ?auto_277907 ?auto_277913 ) ) ( not ( = ?auto_277907 ?auto_277914 ) ) ( not ( = ?auto_277907 ?auto_277915 ) ) ( not ( = ?auto_277907 ?auto_277916 ) ) ( not ( = ?auto_277907 ?auto_277917 ) ) ( not ( = ?auto_277907 ?auto_277918 ) ) ( not ( = ?auto_277908 ?auto_277909 ) ) ( not ( = ?auto_277908 ?auto_277910 ) ) ( not ( = ?auto_277908 ?auto_277911 ) ) ( not ( = ?auto_277908 ?auto_277912 ) ) ( not ( = ?auto_277908 ?auto_277913 ) ) ( not ( = ?auto_277908 ?auto_277914 ) ) ( not ( = ?auto_277908 ?auto_277915 ) ) ( not ( = ?auto_277908 ?auto_277916 ) ) ( not ( = ?auto_277908 ?auto_277917 ) ) ( not ( = ?auto_277908 ?auto_277918 ) ) ( not ( = ?auto_277909 ?auto_277910 ) ) ( not ( = ?auto_277909 ?auto_277911 ) ) ( not ( = ?auto_277909 ?auto_277912 ) ) ( not ( = ?auto_277909 ?auto_277913 ) ) ( not ( = ?auto_277909 ?auto_277914 ) ) ( not ( = ?auto_277909 ?auto_277915 ) ) ( not ( = ?auto_277909 ?auto_277916 ) ) ( not ( = ?auto_277909 ?auto_277917 ) ) ( not ( = ?auto_277909 ?auto_277918 ) ) ( not ( = ?auto_277910 ?auto_277911 ) ) ( not ( = ?auto_277910 ?auto_277912 ) ) ( not ( = ?auto_277910 ?auto_277913 ) ) ( not ( = ?auto_277910 ?auto_277914 ) ) ( not ( = ?auto_277910 ?auto_277915 ) ) ( not ( = ?auto_277910 ?auto_277916 ) ) ( not ( = ?auto_277910 ?auto_277917 ) ) ( not ( = ?auto_277910 ?auto_277918 ) ) ( not ( = ?auto_277911 ?auto_277912 ) ) ( not ( = ?auto_277911 ?auto_277913 ) ) ( not ( = ?auto_277911 ?auto_277914 ) ) ( not ( = ?auto_277911 ?auto_277915 ) ) ( not ( = ?auto_277911 ?auto_277916 ) ) ( not ( = ?auto_277911 ?auto_277917 ) ) ( not ( = ?auto_277911 ?auto_277918 ) ) ( not ( = ?auto_277912 ?auto_277913 ) ) ( not ( = ?auto_277912 ?auto_277914 ) ) ( not ( = ?auto_277912 ?auto_277915 ) ) ( not ( = ?auto_277912 ?auto_277916 ) ) ( not ( = ?auto_277912 ?auto_277917 ) ) ( not ( = ?auto_277912 ?auto_277918 ) ) ( not ( = ?auto_277913 ?auto_277914 ) ) ( not ( = ?auto_277913 ?auto_277915 ) ) ( not ( = ?auto_277913 ?auto_277916 ) ) ( not ( = ?auto_277913 ?auto_277917 ) ) ( not ( = ?auto_277913 ?auto_277918 ) ) ( not ( = ?auto_277914 ?auto_277915 ) ) ( not ( = ?auto_277914 ?auto_277916 ) ) ( not ( = ?auto_277914 ?auto_277917 ) ) ( not ( = ?auto_277914 ?auto_277918 ) ) ( not ( = ?auto_277915 ?auto_277916 ) ) ( not ( = ?auto_277915 ?auto_277917 ) ) ( not ( = ?auto_277915 ?auto_277918 ) ) ( not ( = ?auto_277916 ?auto_277917 ) ) ( not ( = ?auto_277916 ?auto_277918 ) ) ( not ( = ?auto_277917 ?auto_277918 ) ) ( ON ?auto_277916 ?auto_277917 ) ( ON ?auto_277915 ?auto_277916 ) ( ON ?auto_277914 ?auto_277915 ) ( CLEAR ?auto_277912 ) ( ON ?auto_277913 ?auto_277914 ) ( CLEAR ?auto_277913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_277905 ?auto_277906 ?auto_277907 ?auto_277908 ?auto_277909 ?auto_277910 ?auto_277911 ?auto_277912 ?auto_277913 )
      ( MAKE-13PILE ?auto_277905 ?auto_277906 ?auto_277907 ?auto_277908 ?auto_277909 ?auto_277910 ?auto_277911 ?auto_277912 ?auto_277913 ?auto_277914 ?auto_277915 ?auto_277916 ?auto_277917 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_277959 - BLOCK
      ?auto_277960 - BLOCK
      ?auto_277961 - BLOCK
      ?auto_277962 - BLOCK
      ?auto_277963 - BLOCK
      ?auto_277964 - BLOCK
      ?auto_277965 - BLOCK
      ?auto_277966 - BLOCK
      ?auto_277967 - BLOCK
      ?auto_277968 - BLOCK
      ?auto_277969 - BLOCK
      ?auto_277970 - BLOCK
      ?auto_277971 - BLOCK
    )
    :vars
    (
      ?auto_277972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_277971 ?auto_277972 ) ( ON-TABLE ?auto_277959 ) ( ON ?auto_277960 ?auto_277959 ) ( ON ?auto_277961 ?auto_277960 ) ( ON ?auto_277962 ?auto_277961 ) ( ON ?auto_277963 ?auto_277962 ) ( ON ?auto_277964 ?auto_277963 ) ( ON ?auto_277965 ?auto_277964 ) ( not ( = ?auto_277959 ?auto_277960 ) ) ( not ( = ?auto_277959 ?auto_277961 ) ) ( not ( = ?auto_277959 ?auto_277962 ) ) ( not ( = ?auto_277959 ?auto_277963 ) ) ( not ( = ?auto_277959 ?auto_277964 ) ) ( not ( = ?auto_277959 ?auto_277965 ) ) ( not ( = ?auto_277959 ?auto_277966 ) ) ( not ( = ?auto_277959 ?auto_277967 ) ) ( not ( = ?auto_277959 ?auto_277968 ) ) ( not ( = ?auto_277959 ?auto_277969 ) ) ( not ( = ?auto_277959 ?auto_277970 ) ) ( not ( = ?auto_277959 ?auto_277971 ) ) ( not ( = ?auto_277959 ?auto_277972 ) ) ( not ( = ?auto_277960 ?auto_277961 ) ) ( not ( = ?auto_277960 ?auto_277962 ) ) ( not ( = ?auto_277960 ?auto_277963 ) ) ( not ( = ?auto_277960 ?auto_277964 ) ) ( not ( = ?auto_277960 ?auto_277965 ) ) ( not ( = ?auto_277960 ?auto_277966 ) ) ( not ( = ?auto_277960 ?auto_277967 ) ) ( not ( = ?auto_277960 ?auto_277968 ) ) ( not ( = ?auto_277960 ?auto_277969 ) ) ( not ( = ?auto_277960 ?auto_277970 ) ) ( not ( = ?auto_277960 ?auto_277971 ) ) ( not ( = ?auto_277960 ?auto_277972 ) ) ( not ( = ?auto_277961 ?auto_277962 ) ) ( not ( = ?auto_277961 ?auto_277963 ) ) ( not ( = ?auto_277961 ?auto_277964 ) ) ( not ( = ?auto_277961 ?auto_277965 ) ) ( not ( = ?auto_277961 ?auto_277966 ) ) ( not ( = ?auto_277961 ?auto_277967 ) ) ( not ( = ?auto_277961 ?auto_277968 ) ) ( not ( = ?auto_277961 ?auto_277969 ) ) ( not ( = ?auto_277961 ?auto_277970 ) ) ( not ( = ?auto_277961 ?auto_277971 ) ) ( not ( = ?auto_277961 ?auto_277972 ) ) ( not ( = ?auto_277962 ?auto_277963 ) ) ( not ( = ?auto_277962 ?auto_277964 ) ) ( not ( = ?auto_277962 ?auto_277965 ) ) ( not ( = ?auto_277962 ?auto_277966 ) ) ( not ( = ?auto_277962 ?auto_277967 ) ) ( not ( = ?auto_277962 ?auto_277968 ) ) ( not ( = ?auto_277962 ?auto_277969 ) ) ( not ( = ?auto_277962 ?auto_277970 ) ) ( not ( = ?auto_277962 ?auto_277971 ) ) ( not ( = ?auto_277962 ?auto_277972 ) ) ( not ( = ?auto_277963 ?auto_277964 ) ) ( not ( = ?auto_277963 ?auto_277965 ) ) ( not ( = ?auto_277963 ?auto_277966 ) ) ( not ( = ?auto_277963 ?auto_277967 ) ) ( not ( = ?auto_277963 ?auto_277968 ) ) ( not ( = ?auto_277963 ?auto_277969 ) ) ( not ( = ?auto_277963 ?auto_277970 ) ) ( not ( = ?auto_277963 ?auto_277971 ) ) ( not ( = ?auto_277963 ?auto_277972 ) ) ( not ( = ?auto_277964 ?auto_277965 ) ) ( not ( = ?auto_277964 ?auto_277966 ) ) ( not ( = ?auto_277964 ?auto_277967 ) ) ( not ( = ?auto_277964 ?auto_277968 ) ) ( not ( = ?auto_277964 ?auto_277969 ) ) ( not ( = ?auto_277964 ?auto_277970 ) ) ( not ( = ?auto_277964 ?auto_277971 ) ) ( not ( = ?auto_277964 ?auto_277972 ) ) ( not ( = ?auto_277965 ?auto_277966 ) ) ( not ( = ?auto_277965 ?auto_277967 ) ) ( not ( = ?auto_277965 ?auto_277968 ) ) ( not ( = ?auto_277965 ?auto_277969 ) ) ( not ( = ?auto_277965 ?auto_277970 ) ) ( not ( = ?auto_277965 ?auto_277971 ) ) ( not ( = ?auto_277965 ?auto_277972 ) ) ( not ( = ?auto_277966 ?auto_277967 ) ) ( not ( = ?auto_277966 ?auto_277968 ) ) ( not ( = ?auto_277966 ?auto_277969 ) ) ( not ( = ?auto_277966 ?auto_277970 ) ) ( not ( = ?auto_277966 ?auto_277971 ) ) ( not ( = ?auto_277966 ?auto_277972 ) ) ( not ( = ?auto_277967 ?auto_277968 ) ) ( not ( = ?auto_277967 ?auto_277969 ) ) ( not ( = ?auto_277967 ?auto_277970 ) ) ( not ( = ?auto_277967 ?auto_277971 ) ) ( not ( = ?auto_277967 ?auto_277972 ) ) ( not ( = ?auto_277968 ?auto_277969 ) ) ( not ( = ?auto_277968 ?auto_277970 ) ) ( not ( = ?auto_277968 ?auto_277971 ) ) ( not ( = ?auto_277968 ?auto_277972 ) ) ( not ( = ?auto_277969 ?auto_277970 ) ) ( not ( = ?auto_277969 ?auto_277971 ) ) ( not ( = ?auto_277969 ?auto_277972 ) ) ( not ( = ?auto_277970 ?auto_277971 ) ) ( not ( = ?auto_277970 ?auto_277972 ) ) ( not ( = ?auto_277971 ?auto_277972 ) ) ( ON ?auto_277970 ?auto_277971 ) ( ON ?auto_277969 ?auto_277970 ) ( ON ?auto_277968 ?auto_277969 ) ( ON ?auto_277967 ?auto_277968 ) ( CLEAR ?auto_277965 ) ( ON ?auto_277966 ?auto_277967 ) ( CLEAR ?auto_277966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_277959 ?auto_277960 ?auto_277961 ?auto_277962 ?auto_277963 ?auto_277964 ?auto_277965 ?auto_277966 )
      ( MAKE-13PILE ?auto_277959 ?auto_277960 ?auto_277961 ?auto_277962 ?auto_277963 ?auto_277964 ?auto_277965 ?auto_277966 ?auto_277967 ?auto_277968 ?auto_277969 ?auto_277970 ?auto_277971 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_278013 - BLOCK
      ?auto_278014 - BLOCK
      ?auto_278015 - BLOCK
      ?auto_278016 - BLOCK
      ?auto_278017 - BLOCK
      ?auto_278018 - BLOCK
      ?auto_278019 - BLOCK
      ?auto_278020 - BLOCK
      ?auto_278021 - BLOCK
      ?auto_278022 - BLOCK
      ?auto_278023 - BLOCK
      ?auto_278024 - BLOCK
      ?auto_278025 - BLOCK
    )
    :vars
    (
      ?auto_278026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_278025 ?auto_278026 ) ( ON-TABLE ?auto_278013 ) ( ON ?auto_278014 ?auto_278013 ) ( ON ?auto_278015 ?auto_278014 ) ( ON ?auto_278016 ?auto_278015 ) ( ON ?auto_278017 ?auto_278016 ) ( ON ?auto_278018 ?auto_278017 ) ( not ( = ?auto_278013 ?auto_278014 ) ) ( not ( = ?auto_278013 ?auto_278015 ) ) ( not ( = ?auto_278013 ?auto_278016 ) ) ( not ( = ?auto_278013 ?auto_278017 ) ) ( not ( = ?auto_278013 ?auto_278018 ) ) ( not ( = ?auto_278013 ?auto_278019 ) ) ( not ( = ?auto_278013 ?auto_278020 ) ) ( not ( = ?auto_278013 ?auto_278021 ) ) ( not ( = ?auto_278013 ?auto_278022 ) ) ( not ( = ?auto_278013 ?auto_278023 ) ) ( not ( = ?auto_278013 ?auto_278024 ) ) ( not ( = ?auto_278013 ?auto_278025 ) ) ( not ( = ?auto_278013 ?auto_278026 ) ) ( not ( = ?auto_278014 ?auto_278015 ) ) ( not ( = ?auto_278014 ?auto_278016 ) ) ( not ( = ?auto_278014 ?auto_278017 ) ) ( not ( = ?auto_278014 ?auto_278018 ) ) ( not ( = ?auto_278014 ?auto_278019 ) ) ( not ( = ?auto_278014 ?auto_278020 ) ) ( not ( = ?auto_278014 ?auto_278021 ) ) ( not ( = ?auto_278014 ?auto_278022 ) ) ( not ( = ?auto_278014 ?auto_278023 ) ) ( not ( = ?auto_278014 ?auto_278024 ) ) ( not ( = ?auto_278014 ?auto_278025 ) ) ( not ( = ?auto_278014 ?auto_278026 ) ) ( not ( = ?auto_278015 ?auto_278016 ) ) ( not ( = ?auto_278015 ?auto_278017 ) ) ( not ( = ?auto_278015 ?auto_278018 ) ) ( not ( = ?auto_278015 ?auto_278019 ) ) ( not ( = ?auto_278015 ?auto_278020 ) ) ( not ( = ?auto_278015 ?auto_278021 ) ) ( not ( = ?auto_278015 ?auto_278022 ) ) ( not ( = ?auto_278015 ?auto_278023 ) ) ( not ( = ?auto_278015 ?auto_278024 ) ) ( not ( = ?auto_278015 ?auto_278025 ) ) ( not ( = ?auto_278015 ?auto_278026 ) ) ( not ( = ?auto_278016 ?auto_278017 ) ) ( not ( = ?auto_278016 ?auto_278018 ) ) ( not ( = ?auto_278016 ?auto_278019 ) ) ( not ( = ?auto_278016 ?auto_278020 ) ) ( not ( = ?auto_278016 ?auto_278021 ) ) ( not ( = ?auto_278016 ?auto_278022 ) ) ( not ( = ?auto_278016 ?auto_278023 ) ) ( not ( = ?auto_278016 ?auto_278024 ) ) ( not ( = ?auto_278016 ?auto_278025 ) ) ( not ( = ?auto_278016 ?auto_278026 ) ) ( not ( = ?auto_278017 ?auto_278018 ) ) ( not ( = ?auto_278017 ?auto_278019 ) ) ( not ( = ?auto_278017 ?auto_278020 ) ) ( not ( = ?auto_278017 ?auto_278021 ) ) ( not ( = ?auto_278017 ?auto_278022 ) ) ( not ( = ?auto_278017 ?auto_278023 ) ) ( not ( = ?auto_278017 ?auto_278024 ) ) ( not ( = ?auto_278017 ?auto_278025 ) ) ( not ( = ?auto_278017 ?auto_278026 ) ) ( not ( = ?auto_278018 ?auto_278019 ) ) ( not ( = ?auto_278018 ?auto_278020 ) ) ( not ( = ?auto_278018 ?auto_278021 ) ) ( not ( = ?auto_278018 ?auto_278022 ) ) ( not ( = ?auto_278018 ?auto_278023 ) ) ( not ( = ?auto_278018 ?auto_278024 ) ) ( not ( = ?auto_278018 ?auto_278025 ) ) ( not ( = ?auto_278018 ?auto_278026 ) ) ( not ( = ?auto_278019 ?auto_278020 ) ) ( not ( = ?auto_278019 ?auto_278021 ) ) ( not ( = ?auto_278019 ?auto_278022 ) ) ( not ( = ?auto_278019 ?auto_278023 ) ) ( not ( = ?auto_278019 ?auto_278024 ) ) ( not ( = ?auto_278019 ?auto_278025 ) ) ( not ( = ?auto_278019 ?auto_278026 ) ) ( not ( = ?auto_278020 ?auto_278021 ) ) ( not ( = ?auto_278020 ?auto_278022 ) ) ( not ( = ?auto_278020 ?auto_278023 ) ) ( not ( = ?auto_278020 ?auto_278024 ) ) ( not ( = ?auto_278020 ?auto_278025 ) ) ( not ( = ?auto_278020 ?auto_278026 ) ) ( not ( = ?auto_278021 ?auto_278022 ) ) ( not ( = ?auto_278021 ?auto_278023 ) ) ( not ( = ?auto_278021 ?auto_278024 ) ) ( not ( = ?auto_278021 ?auto_278025 ) ) ( not ( = ?auto_278021 ?auto_278026 ) ) ( not ( = ?auto_278022 ?auto_278023 ) ) ( not ( = ?auto_278022 ?auto_278024 ) ) ( not ( = ?auto_278022 ?auto_278025 ) ) ( not ( = ?auto_278022 ?auto_278026 ) ) ( not ( = ?auto_278023 ?auto_278024 ) ) ( not ( = ?auto_278023 ?auto_278025 ) ) ( not ( = ?auto_278023 ?auto_278026 ) ) ( not ( = ?auto_278024 ?auto_278025 ) ) ( not ( = ?auto_278024 ?auto_278026 ) ) ( not ( = ?auto_278025 ?auto_278026 ) ) ( ON ?auto_278024 ?auto_278025 ) ( ON ?auto_278023 ?auto_278024 ) ( ON ?auto_278022 ?auto_278023 ) ( ON ?auto_278021 ?auto_278022 ) ( ON ?auto_278020 ?auto_278021 ) ( CLEAR ?auto_278018 ) ( ON ?auto_278019 ?auto_278020 ) ( CLEAR ?auto_278019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_278013 ?auto_278014 ?auto_278015 ?auto_278016 ?auto_278017 ?auto_278018 ?auto_278019 )
      ( MAKE-13PILE ?auto_278013 ?auto_278014 ?auto_278015 ?auto_278016 ?auto_278017 ?auto_278018 ?auto_278019 ?auto_278020 ?auto_278021 ?auto_278022 ?auto_278023 ?auto_278024 ?auto_278025 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_278067 - BLOCK
      ?auto_278068 - BLOCK
      ?auto_278069 - BLOCK
      ?auto_278070 - BLOCK
      ?auto_278071 - BLOCK
      ?auto_278072 - BLOCK
      ?auto_278073 - BLOCK
      ?auto_278074 - BLOCK
      ?auto_278075 - BLOCK
      ?auto_278076 - BLOCK
      ?auto_278077 - BLOCK
      ?auto_278078 - BLOCK
      ?auto_278079 - BLOCK
    )
    :vars
    (
      ?auto_278080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_278079 ?auto_278080 ) ( ON-TABLE ?auto_278067 ) ( ON ?auto_278068 ?auto_278067 ) ( ON ?auto_278069 ?auto_278068 ) ( ON ?auto_278070 ?auto_278069 ) ( ON ?auto_278071 ?auto_278070 ) ( not ( = ?auto_278067 ?auto_278068 ) ) ( not ( = ?auto_278067 ?auto_278069 ) ) ( not ( = ?auto_278067 ?auto_278070 ) ) ( not ( = ?auto_278067 ?auto_278071 ) ) ( not ( = ?auto_278067 ?auto_278072 ) ) ( not ( = ?auto_278067 ?auto_278073 ) ) ( not ( = ?auto_278067 ?auto_278074 ) ) ( not ( = ?auto_278067 ?auto_278075 ) ) ( not ( = ?auto_278067 ?auto_278076 ) ) ( not ( = ?auto_278067 ?auto_278077 ) ) ( not ( = ?auto_278067 ?auto_278078 ) ) ( not ( = ?auto_278067 ?auto_278079 ) ) ( not ( = ?auto_278067 ?auto_278080 ) ) ( not ( = ?auto_278068 ?auto_278069 ) ) ( not ( = ?auto_278068 ?auto_278070 ) ) ( not ( = ?auto_278068 ?auto_278071 ) ) ( not ( = ?auto_278068 ?auto_278072 ) ) ( not ( = ?auto_278068 ?auto_278073 ) ) ( not ( = ?auto_278068 ?auto_278074 ) ) ( not ( = ?auto_278068 ?auto_278075 ) ) ( not ( = ?auto_278068 ?auto_278076 ) ) ( not ( = ?auto_278068 ?auto_278077 ) ) ( not ( = ?auto_278068 ?auto_278078 ) ) ( not ( = ?auto_278068 ?auto_278079 ) ) ( not ( = ?auto_278068 ?auto_278080 ) ) ( not ( = ?auto_278069 ?auto_278070 ) ) ( not ( = ?auto_278069 ?auto_278071 ) ) ( not ( = ?auto_278069 ?auto_278072 ) ) ( not ( = ?auto_278069 ?auto_278073 ) ) ( not ( = ?auto_278069 ?auto_278074 ) ) ( not ( = ?auto_278069 ?auto_278075 ) ) ( not ( = ?auto_278069 ?auto_278076 ) ) ( not ( = ?auto_278069 ?auto_278077 ) ) ( not ( = ?auto_278069 ?auto_278078 ) ) ( not ( = ?auto_278069 ?auto_278079 ) ) ( not ( = ?auto_278069 ?auto_278080 ) ) ( not ( = ?auto_278070 ?auto_278071 ) ) ( not ( = ?auto_278070 ?auto_278072 ) ) ( not ( = ?auto_278070 ?auto_278073 ) ) ( not ( = ?auto_278070 ?auto_278074 ) ) ( not ( = ?auto_278070 ?auto_278075 ) ) ( not ( = ?auto_278070 ?auto_278076 ) ) ( not ( = ?auto_278070 ?auto_278077 ) ) ( not ( = ?auto_278070 ?auto_278078 ) ) ( not ( = ?auto_278070 ?auto_278079 ) ) ( not ( = ?auto_278070 ?auto_278080 ) ) ( not ( = ?auto_278071 ?auto_278072 ) ) ( not ( = ?auto_278071 ?auto_278073 ) ) ( not ( = ?auto_278071 ?auto_278074 ) ) ( not ( = ?auto_278071 ?auto_278075 ) ) ( not ( = ?auto_278071 ?auto_278076 ) ) ( not ( = ?auto_278071 ?auto_278077 ) ) ( not ( = ?auto_278071 ?auto_278078 ) ) ( not ( = ?auto_278071 ?auto_278079 ) ) ( not ( = ?auto_278071 ?auto_278080 ) ) ( not ( = ?auto_278072 ?auto_278073 ) ) ( not ( = ?auto_278072 ?auto_278074 ) ) ( not ( = ?auto_278072 ?auto_278075 ) ) ( not ( = ?auto_278072 ?auto_278076 ) ) ( not ( = ?auto_278072 ?auto_278077 ) ) ( not ( = ?auto_278072 ?auto_278078 ) ) ( not ( = ?auto_278072 ?auto_278079 ) ) ( not ( = ?auto_278072 ?auto_278080 ) ) ( not ( = ?auto_278073 ?auto_278074 ) ) ( not ( = ?auto_278073 ?auto_278075 ) ) ( not ( = ?auto_278073 ?auto_278076 ) ) ( not ( = ?auto_278073 ?auto_278077 ) ) ( not ( = ?auto_278073 ?auto_278078 ) ) ( not ( = ?auto_278073 ?auto_278079 ) ) ( not ( = ?auto_278073 ?auto_278080 ) ) ( not ( = ?auto_278074 ?auto_278075 ) ) ( not ( = ?auto_278074 ?auto_278076 ) ) ( not ( = ?auto_278074 ?auto_278077 ) ) ( not ( = ?auto_278074 ?auto_278078 ) ) ( not ( = ?auto_278074 ?auto_278079 ) ) ( not ( = ?auto_278074 ?auto_278080 ) ) ( not ( = ?auto_278075 ?auto_278076 ) ) ( not ( = ?auto_278075 ?auto_278077 ) ) ( not ( = ?auto_278075 ?auto_278078 ) ) ( not ( = ?auto_278075 ?auto_278079 ) ) ( not ( = ?auto_278075 ?auto_278080 ) ) ( not ( = ?auto_278076 ?auto_278077 ) ) ( not ( = ?auto_278076 ?auto_278078 ) ) ( not ( = ?auto_278076 ?auto_278079 ) ) ( not ( = ?auto_278076 ?auto_278080 ) ) ( not ( = ?auto_278077 ?auto_278078 ) ) ( not ( = ?auto_278077 ?auto_278079 ) ) ( not ( = ?auto_278077 ?auto_278080 ) ) ( not ( = ?auto_278078 ?auto_278079 ) ) ( not ( = ?auto_278078 ?auto_278080 ) ) ( not ( = ?auto_278079 ?auto_278080 ) ) ( ON ?auto_278078 ?auto_278079 ) ( ON ?auto_278077 ?auto_278078 ) ( ON ?auto_278076 ?auto_278077 ) ( ON ?auto_278075 ?auto_278076 ) ( ON ?auto_278074 ?auto_278075 ) ( ON ?auto_278073 ?auto_278074 ) ( CLEAR ?auto_278071 ) ( ON ?auto_278072 ?auto_278073 ) ( CLEAR ?auto_278072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_278067 ?auto_278068 ?auto_278069 ?auto_278070 ?auto_278071 ?auto_278072 )
      ( MAKE-13PILE ?auto_278067 ?auto_278068 ?auto_278069 ?auto_278070 ?auto_278071 ?auto_278072 ?auto_278073 ?auto_278074 ?auto_278075 ?auto_278076 ?auto_278077 ?auto_278078 ?auto_278079 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_278121 - BLOCK
      ?auto_278122 - BLOCK
      ?auto_278123 - BLOCK
      ?auto_278124 - BLOCK
      ?auto_278125 - BLOCK
      ?auto_278126 - BLOCK
      ?auto_278127 - BLOCK
      ?auto_278128 - BLOCK
      ?auto_278129 - BLOCK
      ?auto_278130 - BLOCK
      ?auto_278131 - BLOCK
      ?auto_278132 - BLOCK
      ?auto_278133 - BLOCK
    )
    :vars
    (
      ?auto_278134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_278133 ?auto_278134 ) ( ON-TABLE ?auto_278121 ) ( ON ?auto_278122 ?auto_278121 ) ( ON ?auto_278123 ?auto_278122 ) ( ON ?auto_278124 ?auto_278123 ) ( not ( = ?auto_278121 ?auto_278122 ) ) ( not ( = ?auto_278121 ?auto_278123 ) ) ( not ( = ?auto_278121 ?auto_278124 ) ) ( not ( = ?auto_278121 ?auto_278125 ) ) ( not ( = ?auto_278121 ?auto_278126 ) ) ( not ( = ?auto_278121 ?auto_278127 ) ) ( not ( = ?auto_278121 ?auto_278128 ) ) ( not ( = ?auto_278121 ?auto_278129 ) ) ( not ( = ?auto_278121 ?auto_278130 ) ) ( not ( = ?auto_278121 ?auto_278131 ) ) ( not ( = ?auto_278121 ?auto_278132 ) ) ( not ( = ?auto_278121 ?auto_278133 ) ) ( not ( = ?auto_278121 ?auto_278134 ) ) ( not ( = ?auto_278122 ?auto_278123 ) ) ( not ( = ?auto_278122 ?auto_278124 ) ) ( not ( = ?auto_278122 ?auto_278125 ) ) ( not ( = ?auto_278122 ?auto_278126 ) ) ( not ( = ?auto_278122 ?auto_278127 ) ) ( not ( = ?auto_278122 ?auto_278128 ) ) ( not ( = ?auto_278122 ?auto_278129 ) ) ( not ( = ?auto_278122 ?auto_278130 ) ) ( not ( = ?auto_278122 ?auto_278131 ) ) ( not ( = ?auto_278122 ?auto_278132 ) ) ( not ( = ?auto_278122 ?auto_278133 ) ) ( not ( = ?auto_278122 ?auto_278134 ) ) ( not ( = ?auto_278123 ?auto_278124 ) ) ( not ( = ?auto_278123 ?auto_278125 ) ) ( not ( = ?auto_278123 ?auto_278126 ) ) ( not ( = ?auto_278123 ?auto_278127 ) ) ( not ( = ?auto_278123 ?auto_278128 ) ) ( not ( = ?auto_278123 ?auto_278129 ) ) ( not ( = ?auto_278123 ?auto_278130 ) ) ( not ( = ?auto_278123 ?auto_278131 ) ) ( not ( = ?auto_278123 ?auto_278132 ) ) ( not ( = ?auto_278123 ?auto_278133 ) ) ( not ( = ?auto_278123 ?auto_278134 ) ) ( not ( = ?auto_278124 ?auto_278125 ) ) ( not ( = ?auto_278124 ?auto_278126 ) ) ( not ( = ?auto_278124 ?auto_278127 ) ) ( not ( = ?auto_278124 ?auto_278128 ) ) ( not ( = ?auto_278124 ?auto_278129 ) ) ( not ( = ?auto_278124 ?auto_278130 ) ) ( not ( = ?auto_278124 ?auto_278131 ) ) ( not ( = ?auto_278124 ?auto_278132 ) ) ( not ( = ?auto_278124 ?auto_278133 ) ) ( not ( = ?auto_278124 ?auto_278134 ) ) ( not ( = ?auto_278125 ?auto_278126 ) ) ( not ( = ?auto_278125 ?auto_278127 ) ) ( not ( = ?auto_278125 ?auto_278128 ) ) ( not ( = ?auto_278125 ?auto_278129 ) ) ( not ( = ?auto_278125 ?auto_278130 ) ) ( not ( = ?auto_278125 ?auto_278131 ) ) ( not ( = ?auto_278125 ?auto_278132 ) ) ( not ( = ?auto_278125 ?auto_278133 ) ) ( not ( = ?auto_278125 ?auto_278134 ) ) ( not ( = ?auto_278126 ?auto_278127 ) ) ( not ( = ?auto_278126 ?auto_278128 ) ) ( not ( = ?auto_278126 ?auto_278129 ) ) ( not ( = ?auto_278126 ?auto_278130 ) ) ( not ( = ?auto_278126 ?auto_278131 ) ) ( not ( = ?auto_278126 ?auto_278132 ) ) ( not ( = ?auto_278126 ?auto_278133 ) ) ( not ( = ?auto_278126 ?auto_278134 ) ) ( not ( = ?auto_278127 ?auto_278128 ) ) ( not ( = ?auto_278127 ?auto_278129 ) ) ( not ( = ?auto_278127 ?auto_278130 ) ) ( not ( = ?auto_278127 ?auto_278131 ) ) ( not ( = ?auto_278127 ?auto_278132 ) ) ( not ( = ?auto_278127 ?auto_278133 ) ) ( not ( = ?auto_278127 ?auto_278134 ) ) ( not ( = ?auto_278128 ?auto_278129 ) ) ( not ( = ?auto_278128 ?auto_278130 ) ) ( not ( = ?auto_278128 ?auto_278131 ) ) ( not ( = ?auto_278128 ?auto_278132 ) ) ( not ( = ?auto_278128 ?auto_278133 ) ) ( not ( = ?auto_278128 ?auto_278134 ) ) ( not ( = ?auto_278129 ?auto_278130 ) ) ( not ( = ?auto_278129 ?auto_278131 ) ) ( not ( = ?auto_278129 ?auto_278132 ) ) ( not ( = ?auto_278129 ?auto_278133 ) ) ( not ( = ?auto_278129 ?auto_278134 ) ) ( not ( = ?auto_278130 ?auto_278131 ) ) ( not ( = ?auto_278130 ?auto_278132 ) ) ( not ( = ?auto_278130 ?auto_278133 ) ) ( not ( = ?auto_278130 ?auto_278134 ) ) ( not ( = ?auto_278131 ?auto_278132 ) ) ( not ( = ?auto_278131 ?auto_278133 ) ) ( not ( = ?auto_278131 ?auto_278134 ) ) ( not ( = ?auto_278132 ?auto_278133 ) ) ( not ( = ?auto_278132 ?auto_278134 ) ) ( not ( = ?auto_278133 ?auto_278134 ) ) ( ON ?auto_278132 ?auto_278133 ) ( ON ?auto_278131 ?auto_278132 ) ( ON ?auto_278130 ?auto_278131 ) ( ON ?auto_278129 ?auto_278130 ) ( ON ?auto_278128 ?auto_278129 ) ( ON ?auto_278127 ?auto_278128 ) ( ON ?auto_278126 ?auto_278127 ) ( CLEAR ?auto_278124 ) ( ON ?auto_278125 ?auto_278126 ) ( CLEAR ?auto_278125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_278121 ?auto_278122 ?auto_278123 ?auto_278124 ?auto_278125 )
      ( MAKE-13PILE ?auto_278121 ?auto_278122 ?auto_278123 ?auto_278124 ?auto_278125 ?auto_278126 ?auto_278127 ?auto_278128 ?auto_278129 ?auto_278130 ?auto_278131 ?auto_278132 ?auto_278133 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_278175 - BLOCK
      ?auto_278176 - BLOCK
      ?auto_278177 - BLOCK
      ?auto_278178 - BLOCK
      ?auto_278179 - BLOCK
      ?auto_278180 - BLOCK
      ?auto_278181 - BLOCK
      ?auto_278182 - BLOCK
      ?auto_278183 - BLOCK
      ?auto_278184 - BLOCK
      ?auto_278185 - BLOCK
      ?auto_278186 - BLOCK
      ?auto_278187 - BLOCK
    )
    :vars
    (
      ?auto_278188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_278187 ?auto_278188 ) ( ON-TABLE ?auto_278175 ) ( ON ?auto_278176 ?auto_278175 ) ( ON ?auto_278177 ?auto_278176 ) ( not ( = ?auto_278175 ?auto_278176 ) ) ( not ( = ?auto_278175 ?auto_278177 ) ) ( not ( = ?auto_278175 ?auto_278178 ) ) ( not ( = ?auto_278175 ?auto_278179 ) ) ( not ( = ?auto_278175 ?auto_278180 ) ) ( not ( = ?auto_278175 ?auto_278181 ) ) ( not ( = ?auto_278175 ?auto_278182 ) ) ( not ( = ?auto_278175 ?auto_278183 ) ) ( not ( = ?auto_278175 ?auto_278184 ) ) ( not ( = ?auto_278175 ?auto_278185 ) ) ( not ( = ?auto_278175 ?auto_278186 ) ) ( not ( = ?auto_278175 ?auto_278187 ) ) ( not ( = ?auto_278175 ?auto_278188 ) ) ( not ( = ?auto_278176 ?auto_278177 ) ) ( not ( = ?auto_278176 ?auto_278178 ) ) ( not ( = ?auto_278176 ?auto_278179 ) ) ( not ( = ?auto_278176 ?auto_278180 ) ) ( not ( = ?auto_278176 ?auto_278181 ) ) ( not ( = ?auto_278176 ?auto_278182 ) ) ( not ( = ?auto_278176 ?auto_278183 ) ) ( not ( = ?auto_278176 ?auto_278184 ) ) ( not ( = ?auto_278176 ?auto_278185 ) ) ( not ( = ?auto_278176 ?auto_278186 ) ) ( not ( = ?auto_278176 ?auto_278187 ) ) ( not ( = ?auto_278176 ?auto_278188 ) ) ( not ( = ?auto_278177 ?auto_278178 ) ) ( not ( = ?auto_278177 ?auto_278179 ) ) ( not ( = ?auto_278177 ?auto_278180 ) ) ( not ( = ?auto_278177 ?auto_278181 ) ) ( not ( = ?auto_278177 ?auto_278182 ) ) ( not ( = ?auto_278177 ?auto_278183 ) ) ( not ( = ?auto_278177 ?auto_278184 ) ) ( not ( = ?auto_278177 ?auto_278185 ) ) ( not ( = ?auto_278177 ?auto_278186 ) ) ( not ( = ?auto_278177 ?auto_278187 ) ) ( not ( = ?auto_278177 ?auto_278188 ) ) ( not ( = ?auto_278178 ?auto_278179 ) ) ( not ( = ?auto_278178 ?auto_278180 ) ) ( not ( = ?auto_278178 ?auto_278181 ) ) ( not ( = ?auto_278178 ?auto_278182 ) ) ( not ( = ?auto_278178 ?auto_278183 ) ) ( not ( = ?auto_278178 ?auto_278184 ) ) ( not ( = ?auto_278178 ?auto_278185 ) ) ( not ( = ?auto_278178 ?auto_278186 ) ) ( not ( = ?auto_278178 ?auto_278187 ) ) ( not ( = ?auto_278178 ?auto_278188 ) ) ( not ( = ?auto_278179 ?auto_278180 ) ) ( not ( = ?auto_278179 ?auto_278181 ) ) ( not ( = ?auto_278179 ?auto_278182 ) ) ( not ( = ?auto_278179 ?auto_278183 ) ) ( not ( = ?auto_278179 ?auto_278184 ) ) ( not ( = ?auto_278179 ?auto_278185 ) ) ( not ( = ?auto_278179 ?auto_278186 ) ) ( not ( = ?auto_278179 ?auto_278187 ) ) ( not ( = ?auto_278179 ?auto_278188 ) ) ( not ( = ?auto_278180 ?auto_278181 ) ) ( not ( = ?auto_278180 ?auto_278182 ) ) ( not ( = ?auto_278180 ?auto_278183 ) ) ( not ( = ?auto_278180 ?auto_278184 ) ) ( not ( = ?auto_278180 ?auto_278185 ) ) ( not ( = ?auto_278180 ?auto_278186 ) ) ( not ( = ?auto_278180 ?auto_278187 ) ) ( not ( = ?auto_278180 ?auto_278188 ) ) ( not ( = ?auto_278181 ?auto_278182 ) ) ( not ( = ?auto_278181 ?auto_278183 ) ) ( not ( = ?auto_278181 ?auto_278184 ) ) ( not ( = ?auto_278181 ?auto_278185 ) ) ( not ( = ?auto_278181 ?auto_278186 ) ) ( not ( = ?auto_278181 ?auto_278187 ) ) ( not ( = ?auto_278181 ?auto_278188 ) ) ( not ( = ?auto_278182 ?auto_278183 ) ) ( not ( = ?auto_278182 ?auto_278184 ) ) ( not ( = ?auto_278182 ?auto_278185 ) ) ( not ( = ?auto_278182 ?auto_278186 ) ) ( not ( = ?auto_278182 ?auto_278187 ) ) ( not ( = ?auto_278182 ?auto_278188 ) ) ( not ( = ?auto_278183 ?auto_278184 ) ) ( not ( = ?auto_278183 ?auto_278185 ) ) ( not ( = ?auto_278183 ?auto_278186 ) ) ( not ( = ?auto_278183 ?auto_278187 ) ) ( not ( = ?auto_278183 ?auto_278188 ) ) ( not ( = ?auto_278184 ?auto_278185 ) ) ( not ( = ?auto_278184 ?auto_278186 ) ) ( not ( = ?auto_278184 ?auto_278187 ) ) ( not ( = ?auto_278184 ?auto_278188 ) ) ( not ( = ?auto_278185 ?auto_278186 ) ) ( not ( = ?auto_278185 ?auto_278187 ) ) ( not ( = ?auto_278185 ?auto_278188 ) ) ( not ( = ?auto_278186 ?auto_278187 ) ) ( not ( = ?auto_278186 ?auto_278188 ) ) ( not ( = ?auto_278187 ?auto_278188 ) ) ( ON ?auto_278186 ?auto_278187 ) ( ON ?auto_278185 ?auto_278186 ) ( ON ?auto_278184 ?auto_278185 ) ( ON ?auto_278183 ?auto_278184 ) ( ON ?auto_278182 ?auto_278183 ) ( ON ?auto_278181 ?auto_278182 ) ( ON ?auto_278180 ?auto_278181 ) ( ON ?auto_278179 ?auto_278180 ) ( CLEAR ?auto_278177 ) ( ON ?auto_278178 ?auto_278179 ) ( CLEAR ?auto_278178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_278175 ?auto_278176 ?auto_278177 ?auto_278178 )
      ( MAKE-13PILE ?auto_278175 ?auto_278176 ?auto_278177 ?auto_278178 ?auto_278179 ?auto_278180 ?auto_278181 ?auto_278182 ?auto_278183 ?auto_278184 ?auto_278185 ?auto_278186 ?auto_278187 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_278229 - BLOCK
      ?auto_278230 - BLOCK
      ?auto_278231 - BLOCK
      ?auto_278232 - BLOCK
      ?auto_278233 - BLOCK
      ?auto_278234 - BLOCK
      ?auto_278235 - BLOCK
      ?auto_278236 - BLOCK
      ?auto_278237 - BLOCK
      ?auto_278238 - BLOCK
      ?auto_278239 - BLOCK
      ?auto_278240 - BLOCK
      ?auto_278241 - BLOCK
    )
    :vars
    (
      ?auto_278242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_278241 ?auto_278242 ) ( ON-TABLE ?auto_278229 ) ( ON ?auto_278230 ?auto_278229 ) ( not ( = ?auto_278229 ?auto_278230 ) ) ( not ( = ?auto_278229 ?auto_278231 ) ) ( not ( = ?auto_278229 ?auto_278232 ) ) ( not ( = ?auto_278229 ?auto_278233 ) ) ( not ( = ?auto_278229 ?auto_278234 ) ) ( not ( = ?auto_278229 ?auto_278235 ) ) ( not ( = ?auto_278229 ?auto_278236 ) ) ( not ( = ?auto_278229 ?auto_278237 ) ) ( not ( = ?auto_278229 ?auto_278238 ) ) ( not ( = ?auto_278229 ?auto_278239 ) ) ( not ( = ?auto_278229 ?auto_278240 ) ) ( not ( = ?auto_278229 ?auto_278241 ) ) ( not ( = ?auto_278229 ?auto_278242 ) ) ( not ( = ?auto_278230 ?auto_278231 ) ) ( not ( = ?auto_278230 ?auto_278232 ) ) ( not ( = ?auto_278230 ?auto_278233 ) ) ( not ( = ?auto_278230 ?auto_278234 ) ) ( not ( = ?auto_278230 ?auto_278235 ) ) ( not ( = ?auto_278230 ?auto_278236 ) ) ( not ( = ?auto_278230 ?auto_278237 ) ) ( not ( = ?auto_278230 ?auto_278238 ) ) ( not ( = ?auto_278230 ?auto_278239 ) ) ( not ( = ?auto_278230 ?auto_278240 ) ) ( not ( = ?auto_278230 ?auto_278241 ) ) ( not ( = ?auto_278230 ?auto_278242 ) ) ( not ( = ?auto_278231 ?auto_278232 ) ) ( not ( = ?auto_278231 ?auto_278233 ) ) ( not ( = ?auto_278231 ?auto_278234 ) ) ( not ( = ?auto_278231 ?auto_278235 ) ) ( not ( = ?auto_278231 ?auto_278236 ) ) ( not ( = ?auto_278231 ?auto_278237 ) ) ( not ( = ?auto_278231 ?auto_278238 ) ) ( not ( = ?auto_278231 ?auto_278239 ) ) ( not ( = ?auto_278231 ?auto_278240 ) ) ( not ( = ?auto_278231 ?auto_278241 ) ) ( not ( = ?auto_278231 ?auto_278242 ) ) ( not ( = ?auto_278232 ?auto_278233 ) ) ( not ( = ?auto_278232 ?auto_278234 ) ) ( not ( = ?auto_278232 ?auto_278235 ) ) ( not ( = ?auto_278232 ?auto_278236 ) ) ( not ( = ?auto_278232 ?auto_278237 ) ) ( not ( = ?auto_278232 ?auto_278238 ) ) ( not ( = ?auto_278232 ?auto_278239 ) ) ( not ( = ?auto_278232 ?auto_278240 ) ) ( not ( = ?auto_278232 ?auto_278241 ) ) ( not ( = ?auto_278232 ?auto_278242 ) ) ( not ( = ?auto_278233 ?auto_278234 ) ) ( not ( = ?auto_278233 ?auto_278235 ) ) ( not ( = ?auto_278233 ?auto_278236 ) ) ( not ( = ?auto_278233 ?auto_278237 ) ) ( not ( = ?auto_278233 ?auto_278238 ) ) ( not ( = ?auto_278233 ?auto_278239 ) ) ( not ( = ?auto_278233 ?auto_278240 ) ) ( not ( = ?auto_278233 ?auto_278241 ) ) ( not ( = ?auto_278233 ?auto_278242 ) ) ( not ( = ?auto_278234 ?auto_278235 ) ) ( not ( = ?auto_278234 ?auto_278236 ) ) ( not ( = ?auto_278234 ?auto_278237 ) ) ( not ( = ?auto_278234 ?auto_278238 ) ) ( not ( = ?auto_278234 ?auto_278239 ) ) ( not ( = ?auto_278234 ?auto_278240 ) ) ( not ( = ?auto_278234 ?auto_278241 ) ) ( not ( = ?auto_278234 ?auto_278242 ) ) ( not ( = ?auto_278235 ?auto_278236 ) ) ( not ( = ?auto_278235 ?auto_278237 ) ) ( not ( = ?auto_278235 ?auto_278238 ) ) ( not ( = ?auto_278235 ?auto_278239 ) ) ( not ( = ?auto_278235 ?auto_278240 ) ) ( not ( = ?auto_278235 ?auto_278241 ) ) ( not ( = ?auto_278235 ?auto_278242 ) ) ( not ( = ?auto_278236 ?auto_278237 ) ) ( not ( = ?auto_278236 ?auto_278238 ) ) ( not ( = ?auto_278236 ?auto_278239 ) ) ( not ( = ?auto_278236 ?auto_278240 ) ) ( not ( = ?auto_278236 ?auto_278241 ) ) ( not ( = ?auto_278236 ?auto_278242 ) ) ( not ( = ?auto_278237 ?auto_278238 ) ) ( not ( = ?auto_278237 ?auto_278239 ) ) ( not ( = ?auto_278237 ?auto_278240 ) ) ( not ( = ?auto_278237 ?auto_278241 ) ) ( not ( = ?auto_278237 ?auto_278242 ) ) ( not ( = ?auto_278238 ?auto_278239 ) ) ( not ( = ?auto_278238 ?auto_278240 ) ) ( not ( = ?auto_278238 ?auto_278241 ) ) ( not ( = ?auto_278238 ?auto_278242 ) ) ( not ( = ?auto_278239 ?auto_278240 ) ) ( not ( = ?auto_278239 ?auto_278241 ) ) ( not ( = ?auto_278239 ?auto_278242 ) ) ( not ( = ?auto_278240 ?auto_278241 ) ) ( not ( = ?auto_278240 ?auto_278242 ) ) ( not ( = ?auto_278241 ?auto_278242 ) ) ( ON ?auto_278240 ?auto_278241 ) ( ON ?auto_278239 ?auto_278240 ) ( ON ?auto_278238 ?auto_278239 ) ( ON ?auto_278237 ?auto_278238 ) ( ON ?auto_278236 ?auto_278237 ) ( ON ?auto_278235 ?auto_278236 ) ( ON ?auto_278234 ?auto_278235 ) ( ON ?auto_278233 ?auto_278234 ) ( ON ?auto_278232 ?auto_278233 ) ( CLEAR ?auto_278230 ) ( ON ?auto_278231 ?auto_278232 ) ( CLEAR ?auto_278231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_278229 ?auto_278230 ?auto_278231 )
      ( MAKE-13PILE ?auto_278229 ?auto_278230 ?auto_278231 ?auto_278232 ?auto_278233 ?auto_278234 ?auto_278235 ?auto_278236 ?auto_278237 ?auto_278238 ?auto_278239 ?auto_278240 ?auto_278241 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_278283 - BLOCK
      ?auto_278284 - BLOCK
      ?auto_278285 - BLOCK
      ?auto_278286 - BLOCK
      ?auto_278287 - BLOCK
      ?auto_278288 - BLOCK
      ?auto_278289 - BLOCK
      ?auto_278290 - BLOCK
      ?auto_278291 - BLOCK
      ?auto_278292 - BLOCK
      ?auto_278293 - BLOCK
      ?auto_278294 - BLOCK
      ?auto_278295 - BLOCK
    )
    :vars
    (
      ?auto_278296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_278295 ?auto_278296 ) ( ON-TABLE ?auto_278283 ) ( not ( = ?auto_278283 ?auto_278284 ) ) ( not ( = ?auto_278283 ?auto_278285 ) ) ( not ( = ?auto_278283 ?auto_278286 ) ) ( not ( = ?auto_278283 ?auto_278287 ) ) ( not ( = ?auto_278283 ?auto_278288 ) ) ( not ( = ?auto_278283 ?auto_278289 ) ) ( not ( = ?auto_278283 ?auto_278290 ) ) ( not ( = ?auto_278283 ?auto_278291 ) ) ( not ( = ?auto_278283 ?auto_278292 ) ) ( not ( = ?auto_278283 ?auto_278293 ) ) ( not ( = ?auto_278283 ?auto_278294 ) ) ( not ( = ?auto_278283 ?auto_278295 ) ) ( not ( = ?auto_278283 ?auto_278296 ) ) ( not ( = ?auto_278284 ?auto_278285 ) ) ( not ( = ?auto_278284 ?auto_278286 ) ) ( not ( = ?auto_278284 ?auto_278287 ) ) ( not ( = ?auto_278284 ?auto_278288 ) ) ( not ( = ?auto_278284 ?auto_278289 ) ) ( not ( = ?auto_278284 ?auto_278290 ) ) ( not ( = ?auto_278284 ?auto_278291 ) ) ( not ( = ?auto_278284 ?auto_278292 ) ) ( not ( = ?auto_278284 ?auto_278293 ) ) ( not ( = ?auto_278284 ?auto_278294 ) ) ( not ( = ?auto_278284 ?auto_278295 ) ) ( not ( = ?auto_278284 ?auto_278296 ) ) ( not ( = ?auto_278285 ?auto_278286 ) ) ( not ( = ?auto_278285 ?auto_278287 ) ) ( not ( = ?auto_278285 ?auto_278288 ) ) ( not ( = ?auto_278285 ?auto_278289 ) ) ( not ( = ?auto_278285 ?auto_278290 ) ) ( not ( = ?auto_278285 ?auto_278291 ) ) ( not ( = ?auto_278285 ?auto_278292 ) ) ( not ( = ?auto_278285 ?auto_278293 ) ) ( not ( = ?auto_278285 ?auto_278294 ) ) ( not ( = ?auto_278285 ?auto_278295 ) ) ( not ( = ?auto_278285 ?auto_278296 ) ) ( not ( = ?auto_278286 ?auto_278287 ) ) ( not ( = ?auto_278286 ?auto_278288 ) ) ( not ( = ?auto_278286 ?auto_278289 ) ) ( not ( = ?auto_278286 ?auto_278290 ) ) ( not ( = ?auto_278286 ?auto_278291 ) ) ( not ( = ?auto_278286 ?auto_278292 ) ) ( not ( = ?auto_278286 ?auto_278293 ) ) ( not ( = ?auto_278286 ?auto_278294 ) ) ( not ( = ?auto_278286 ?auto_278295 ) ) ( not ( = ?auto_278286 ?auto_278296 ) ) ( not ( = ?auto_278287 ?auto_278288 ) ) ( not ( = ?auto_278287 ?auto_278289 ) ) ( not ( = ?auto_278287 ?auto_278290 ) ) ( not ( = ?auto_278287 ?auto_278291 ) ) ( not ( = ?auto_278287 ?auto_278292 ) ) ( not ( = ?auto_278287 ?auto_278293 ) ) ( not ( = ?auto_278287 ?auto_278294 ) ) ( not ( = ?auto_278287 ?auto_278295 ) ) ( not ( = ?auto_278287 ?auto_278296 ) ) ( not ( = ?auto_278288 ?auto_278289 ) ) ( not ( = ?auto_278288 ?auto_278290 ) ) ( not ( = ?auto_278288 ?auto_278291 ) ) ( not ( = ?auto_278288 ?auto_278292 ) ) ( not ( = ?auto_278288 ?auto_278293 ) ) ( not ( = ?auto_278288 ?auto_278294 ) ) ( not ( = ?auto_278288 ?auto_278295 ) ) ( not ( = ?auto_278288 ?auto_278296 ) ) ( not ( = ?auto_278289 ?auto_278290 ) ) ( not ( = ?auto_278289 ?auto_278291 ) ) ( not ( = ?auto_278289 ?auto_278292 ) ) ( not ( = ?auto_278289 ?auto_278293 ) ) ( not ( = ?auto_278289 ?auto_278294 ) ) ( not ( = ?auto_278289 ?auto_278295 ) ) ( not ( = ?auto_278289 ?auto_278296 ) ) ( not ( = ?auto_278290 ?auto_278291 ) ) ( not ( = ?auto_278290 ?auto_278292 ) ) ( not ( = ?auto_278290 ?auto_278293 ) ) ( not ( = ?auto_278290 ?auto_278294 ) ) ( not ( = ?auto_278290 ?auto_278295 ) ) ( not ( = ?auto_278290 ?auto_278296 ) ) ( not ( = ?auto_278291 ?auto_278292 ) ) ( not ( = ?auto_278291 ?auto_278293 ) ) ( not ( = ?auto_278291 ?auto_278294 ) ) ( not ( = ?auto_278291 ?auto_278295 ) ) ( not ( = ?auto_278291 ?auto_278296 ) ) ( not ( = ?auto_278292 ?auto_278293 ) ) ( not ( = ?auto_278292 ?auto_278294 ) ) ( not ( = ?auto_278292 ?auto_278295 ) ) ( not ( = ?auto_278292 ?auto_278296 ) ) ( not ( = ?auto_278293 ?auto_278294 ) ) ( not ( = ?auto_278293 ?auto_278295 ) ) ( not ( = ?auto_278293 ?auto_278296 ) ) ( not ( = ?auto_278294 ?auto_278295 ) ) ( not ( = ?auto_278294 ?auto_278296 ) ) ( not ( = ?auto_278295 ?auto_278296 ) ) ( ON ?auto_278294 ?auto_278295 ) ( ON ?auto_278293 ?auto_278294 ) ( ON ?auto_278292 ?auto_278293 ) ( ON ?auto_278291 ?auto_278292 ) ( ON ?auto_278290 ?auto_278291 ) ( ON ?auto_278289 ?auto_278290 ) ( ON ?auto_278288 ?auto_278289 ) ( ON ?auto_278287 ?auto_278288 ) ( ON ?auto_278286 ?auto_278287 ) ( ON ?auto_278285 ?auto_278286 ) ( CLEAR ?auto_278283 ) ( ON ?auto_278284 ?auto_278285 ) ( CLEAR ?auto_278284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_278283 ?auto_278284 )
      ( MAKE-13PILE ?auto_278283 ?auto_278284 ?auto_278285 ?auto_278286 ?auto_278287 ?auto_278288 ?auto_278289 ?auto_278290 ?auto_278291 ?auto_278292 ?auto_278293 ?auto_278294 ?auto_278295 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_278337 - BLOCK
      ?auto_278338 - BLOCK
      ?auto_278339 - BLOCK
      ?auto_278340 - BLOCK
      ?auto_278341 - BLOCK
      ?auto_278342 - BLOCK
      ?auto_278343 - BLOCK
      ?auto_278344 - BLOCK
      ?auto_278345 - BLOCK
      ?auto_278346 - BLOCK
      ?auto_278347 - BLOCK
      ?auto_278348 - BLOCK
      ?auto_278349 - BLOCK
    )
    :vars
    (
      ?auto_278350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_278349 ?auto_278350 ) ( not ( = ?auto_278337 ?auto_278338 ) ) ( not ( = ?auto_278337 ?auto_278339 ) ) ( not ( = ?auto_278337 ?auto_278340 ) ) ( not ( = ?auto_278337 ?auto_278341 ) ) ( not ( = ?auto_278337 ?auto_278342 ) ) ( not ( = ?auto_278337 ?auto_278343 ) ) ( not ( = ?auto_278337 ?auto_278344 ) ) ( not ( = ?auto_278337 ?auto_278345 ) ) ( not ( = ?auto_278337 ?auto_278346 ) ) ( not ( = ?auto_278337 ?auto_278347 ) ) ( not ( = ?auto_278337 ?auto_278348 ) ) ( not ( = ?auto_278337 ?auto_278349 ) ) ( not ( = ?auto_278337 ?auto_278350 ) ) ( not ( = ?auto_278338 ?auto_278339 ) ) ( not ( = ?auto_278338 ?auto_278340 ) ) ( not ( = ?auto_278338 ?auto_278341 ) ) ( not ( = ?auto_278338 ?auto_278342 ) ) ( not ( = ?auto_278338 ?auto_278343 ) ) ( not ( = ?auto_278338 ?auto_278344 ) ) ( not ( = ?auto_278338 ?auto_278345 ) ) ( not ( = ?auto_278338 ?auto_278346 ) ) ( not ( = ?auto_278338 ?auto_278347 ) ) ( not ( = ?auto_278338 ?auto_278348 ) ) ( not ( = ?auto_278338 ?auto_278349 ) ) ( not ( = ?auto_278338 ?auto_278350 ) ) ( not ( = ?auto_278339 ?auto_278340 ) ) ( not ( = ?auto_278339 ?auto_278341 ) ) ( not ( = ?auto_278339 ?auto_278342 ) ) ( not ( = ?auto_278339 ?auto_278343 ) ) ( not ( = ?auto_278339 ?auto_278344 ) ) ( not ( = ?auto_278339 ?auto_278345 ) ) ( not ( = ?auto_278339 ?auto_278346 ) ) ( not ( = ?auto_278339 ?auto_278347 ) ) ( not ( = ?auto_278339 ?auto_278348 ) ) ( not ( = ?auto_278339 ?auto_278349 ) ) ( not ( = ?auto_278339 ?auto_278350 ) ) ( not ( = ?auto_278340 ?auto_278341 ) ) ( not ( = ?auto_278340 ?auto_278342 ) ) ( not ( = ?auto_278340 ?auto_278343 ) ) ( not ( = ?auto_278340 ?auto_278344 ) ) ( not ( = ?auto_278340 ?auto_278345 ) ) ( not ( = ?auto_278340 ?auto_278346 ) ) ( not ( = ?auto_278340 ?auto_278347 ) ) ( not ( = ?auto_278340 ?auto_278348 ) ) ( not ( = ?auto_278340 ?auto_278349 ) ) ( not ( = ?auto_278340 ?auto_278350 ) ) ( not ( = ?auto_278341 ?auto_278342 ) ) ( not ( = ?auto_278341 ?auto_278343 ) ) ( not ( = ?auto_278341 ?auto_278344 ) ) ( not ( = ?auto_278341 ?auto_278345 ) ) ( not ( = ?auto_278341 ?auto_278346 ) ) ( not ( = ?auto_278341 ?auto_278347 ) ) ( not ( = ?auto_278341 ?auto_278348 ) ) ( not ( = ?auto_278341 ?auto_278349 ) ) ( not ( = ?auto_278341 ?auto_278350 ) ) ( not ( = ?auto_278342 ?auto_278343 ) ) ( not ( = ?auto_278342 ?auto_278344 ) ) ( not ( = ?auto_278342 ?auto_278345 ) ) ( not ( = ?auto_278342 ?auto_278346 ) ) ( not ( = ?auto_278342 ?auto_278347 ) ) ( not ( = ?auto_278342 ?auto_278348 ) ) ( not ( = ?auto_278342 ?auto_278349 ) ) ( not ( = ?auto_278342 ?auto_278350 ) ) ( not ( = ?auto_278343 ?auto_278344 ) ) ( not ( = ?auto_278343 ?auto_278345 ) ) ( not ( = ?auto_278343 ?auto_278346 ) ) ( not ( = ?auto_278343 ?auto_278347 ) ) ( not ( = ?auto_278343 ?auto_278348 ) ) ( not ( = ?auto_278343 ?auto_278349 ) ) ( not ( = ?auto_278343 ?auto_278350 ) ) ( not ( = ?auto_278344 ?auto_278345 ) ) ( not ( = ?auto_278344 ?auto_278346 ) ) ( not ( = ?auto_278344 ?auto_278347 ) ) ( not ( = ?auto_278344 ?auto_278348 ) ) ( not ( = ?auto_278344 ?auto_278349 ) ) ( not ( = ?auto_278344 ?auto_278350 ) ) ( not ( = ?auto_278345 ?auto_278346 ) ) ( not ( = ?auto_278345 ?auto_278347 ) ) ( not ( = ?auto_278345 ?auto_278348 ) ) ( not ( = ?auto_278345 ?auto_278349 ) ) ( not ( = ?auto_278345 ?auto_278350 ) ) ( not ( = ?auto_278346 ?auto_278347 ) ) ( not ( = ?auto_278346 ?auto_278348 ) ) ( not ( = ?auto_278346 ?auto_278349 ) ) ( not ( = ?auto_278346 ?auto_278350 ) ) ( not ( = ?auto_278347 ?auto_278348 ) ) ( not ( = ?auto_278347 ?auto_278349 ) ) ( not ( = ?auto_278347 ?auto_278350 ) ) ( not ( = ?auto_278348 ?auto_278349 ) ) ( not ( = ?auto_278348 ?auto_278350 ) ) ( not ( = ?auto_278349 ?auto_278350 ) ) ( ON ?auto_278348 ?auto_278349 ) ( ON ?auto_278347 ?auto_278348 ) ( ON ?auto_278346 ?auto_278347 ) ( ON ?auto_278345 ?auto_278346 ) ( ON ?auto_278344 ?auto_278345 ) ( ON ?auto_278343 ?auto_278344 ) ( ON ?auto_278342 ?auto_278343 ) ( ON ?auto_278341 ?auto_278342 ) ( ON ?auto_278340 ?auto_278341 ) ( ON ?auto_278339 ?auto_278340 ) ( ON ?auto_278338 ?auto_278339 ) ( ON ?auto_278337 ?auto_278338 ) ( CLEAR ?auto_278337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_278337 )
      ( MAKE-13PILE ?auto_278337 ?auto_278338 ?auto_278339 ?auto_278340 ?auto_278341 ?auto_278342 ?auto_278343 ?auto_278344 ?auto_278345 ?auto_278346 ?auto_278347 ?auto_278348 ?auto_278349 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_278392 - BLOCK
      ?auto_278393 - BLOCK
      ?auto_278394 - BLOCK
      ?auto_278395 - BLOCK
      ?auto_278396 - BLOCK
      ?auto_278397 - BLOCK
      ?auto_278398 - BLOCK
      ?auto_278399 - BLOCK
      ?auto_278400 - BLOCK
      ?auto_278401 - BLOCK
      ?auto_278402 - BLOCK
      ?auto_278403 - BLOCK
      ?auto_278404 - BLOCK
      ?auto_278405 - BLOCK
    )
    :vars
    (
      ?auto_278406 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_278404 ) ( ON ?auto_278405 ?auto_278406 ) ( CLEAR ?auto_278405 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_278392 ) ( ON ?auto_278393 ?auto_278392 ) ( ON ?auto_278394 ?auto_278393 ) ( ON ?auto_278395 ?auto_278394 ) ( ON ?auto_278396 ?auto_278395 ) ( ON ?auto_278397 ?auto_278396 ) ( ON ?auto_278398 ?auto_278397 ) ( ON ?auto_278399 ?auto_278398 ) ( ON ?auto_278400 ?auto_278399 ) ( ON ?auto_278401 ?auto_278400 ) ( ON ?auto_278402 ?auto_278401 ) ( ON ?auto_278403 ?auto_278402 ) ( ON ?auto_278404 ?auto_278403 ) ( not ( = ?auto_278392 ?auto_278393 ) ) ( not ( = ?auto_278392 ?auto_278394 ) ) ( not ( = ?auto_278392 ?auto_278395 ) ) ( not ( = ?auto_278392 ?auto_278396 ) ) ( not ( = ?auto_278392 ?auto_278397 ) ) ( not ( = ?auto_278392 ?auto_278398 ) ) ( not ( = ?auto_278392 ?auto_278399 ) ) ( not ( = ?auto_278392 ?auto_278400 ) ) ( not ( = ?auto_278392 ?auto_278401 ) ) ( not ( = ?auto_278392 ?auto_278402 ) ) ( not ( = ?auto_278392 ?auto_278403 ) ) ( not ( = ?auto_278392 ?auto_278404 ) ) ( not ( = ?auto_278392 ?auto_278405 ) ) ( not ( = ?auto_278392 ?auto_278406 ) ) ( not ( = ?auto_278393 ?auto_278394 ) ) ( not ( = ?auto_278393 ?auto_278395 ) ) ( not ( = ?auto_278393 ?auto_278396 ) ) ( not ( = ?auto_278393 ?auto_278397 ) ) ( not ( = ?auto_278393 ?auto_278398 ) ) ( not ( = ?auto_278393 ?auto_278399 ) ) ( not ( = ?auto_278393 ?auto_278400 ) ) ( not ( = ?auto_278393 ?auto_278401 ) ) ( not ( = ?auto_278393 ?auto_278402 ) ) ( not ( = ?auto_278393 ?auto_278403 ) ) ( not ( = ?auto_278393 ?auto_278404 ) ) ( not ( = ?auto_278393 ?auto_278405 ) ) ( not ( = ?auto_278393 ?auto_278406 ) ) ( not ( = ?auto_278394 ?auto_278395 ) ) ( not ( = ?auto_278394 ?auto_278396 ) ) ( not ( = ?auto_278394 ?auto_278397 ) ) ( not ( = ?auto_278394 ?auto_278398 ) ) ( not ( = ?auto_278394 ?auto_278399 ) ) ( not ( = ?auto_278394 ?auto_278400 ) ) ( not ( = ?auto_278394 ?auto_278401 ) ) ( not ( = ?auto_278394 ?auto_278402 ) ) ( not ( = ?auto_278394 ?auto_278403 ) ) ( not ( = ?auto_278394 ?auto_278404 ) ) ( not ( = ?auto_278394 ?auto_278405 ) ) ( not ( = ?auto_278394 ?auto_278406 ) ) ( not ( = ?auto_278395 ?auto_278396 ) ) ( not ( = ?auto_278395 ?auto_278397 ) ) ( not ( = ?auto_278395 ?auto_278398 ) ) ( not ( = ?auto_278395 ?auto_278399 ) ) ( not ( = ?auto_278395 ?auto_278400 ) ) ( not ( = ?auto_278395 ?auto_278401 ) ) ( not ( = ?auto_278395 ?auto_278402 ) ) ( not ( = ?auto_278395 ?auto_278403 ) ) ( not ( = ?auto_278395 ?auto_278404 ) ) ( not ( = ?auto_278395 ?auto_278405 ) ) ( not ( = ?auto_278395 ?auto_278406 ) ) ( not ( = ?auto_278396 ?auto_278397 ) ) ( not ( = ?auto_278396 ?auto_278398 ) ) ( not ( = ?auto_278396 ?auto_278399 ) ) ( not ( = ?auto_278396 ?auto_278400 ) ) ( not ( = ?auto_278396 ?auto_278401 ) ) ( not ( = ?auto_278396 ?auto_278402 ) ) ( not ( = ?auto_278396 ?auto_278403 ) ) ( not ( = ?auto_278396 ?auto_278404 ) ) ( not ( = ?auto_278396 ?auto_278405 ) ) ( not ( = ?auto_278396 ?auto_278406 ) ) ( not ( = ?auto_278397 ?auto_278398 ) ) ( not ( = ?auto_278397 ?auto_278399 ) ) ( not ( = ?auto_278397 ?auto_278400 ) ) ( not ( = ?auto_278397 ?auto_278401 ) ) ( not ( = ?auto_278397 ?auto_278402 ) ) ( not ( = ?auto_278397 ?auto_278403 ) ) ( not ( = ?auto_278397 ?auto_278404 ) ) ( not ( = ?auto_278397 ?auto_278405 ) ) ( not ( = ?auto_278397 ?auto_278406 ) ) ( not ( = ?auto_278398 ?auto_278399 ) ) ( not ( = ?auto_278398 ?auto_278400 ) ) ( not ( = ?auto_278398 ?auto_278401 ) ) ( not ( = ?auto_278398 ?auto_278402 ) ) ( not ( = ?auto_278398 ?auto_278403 ) ) ( not ( = ?auto_278398 ?auto_278404 ) ) ( not ( = ?auto_278398 ?auto_278405 ) ) ( not ( = ?auto_278398 ?auto_278406 ) ) ( not ( = ?auto_278399 ?auto_278400 ) ) ( not ( = ?auto_278399 ?auto_278401 ) ) ( not ( = ?auto_278399 ?auto_278402 ) ) ( not ( = ?auto_278399 ?auto_278403 ) ) ( not ( = ?auto_278399 ?auto_278404 ) ) ( not ( = ?auto_278399 ?auto_278405 ) ) ( not ( = ?auto_278399 ?auto_278406 ) ) ( not ( = ?auto_278400 ?auto_278401 ) ) ( not ( = ?auto_278400 ?auto_278402 ) ) ( not ( = ?auto_278400 ?auto_278403 ) ) ( not ( = ?auto_278400 ?auto_278404 ) ) ( not ( = ?auto_278400 ?auto_278405 ) ) ( not ( = ?auto_278400 ?auto_278406 ) ) ( not ( = ?auto_278401 ?auto_278402 ) ) ( not ( = ?auto_278401 ?auto_278403 ) ) ( not ( = ?auto_278401 ?auto_278404 ) ) ( not ( = ?auto_278401 ?auto_278405 ) ) ( not ( = ?auto_278401 ?auto_278406 ) ) ( not ( = ?auto_278402 ?auto_278403 ) ) ( not ( = ?auto_278402 ?auto_278404 ) ) ( not ( = ?auto_278402 ?auto_278405 ) ) ( not ( = ?auto_278402 ?auto_278406 ) ) ( not ( = ?auto_278403 ?auto_278404 ) ) ( not ( = ?auto_278403 ?auto_278405 ) ) ( not ( = ?auto_278403 ?auto_278406 ) ) ( not ( = ?auto_278404 ?auto_278405 ) ) ( not ( = ?auto_278404 ?auto_278406 ) ) ( not ( = ?auto_278405 ?auto_278406 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_278405 ?auto_278406 )
      ( !STACK ?auto_278405 ?auto_278404 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_278421 - BLOCK
      ?auto_278422 - BLOCK
      ?auto_278423 - BLOCK
      ?auto_278424 - BLOCK
      ?auto_278425 - BLOCK
      ?auto_278426 - BLOCK
      ?auto_278427 - BLOCK
      ?auto_278428 - BLOCK
      ?auto_278429 - BLOCK
      ?auto_278430 - BLOCK
      ?auto_278431 - BLOCK
      ?auto_278432 - BLOCK
      ?auto_278433 - BLOCK
      ?auto_278434 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_278433 ) ( ON-TABLE ?auto_278434 ) ( CLEAR ?auto_278434 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_278421 ) ( ON ?auto_278422 ?auto_278421 ) ( ON ?auto_278423 ?auto_278422 ) ( ON ?auto_278424 ?auto_278423 ) ( ON ?auto_278425 ?auto_278424 ) ( ON ?auto_278426 ?auto_278425 ) ( ON ?auto_278427 ?auto_278426 ) ( ON ?auto_278428 ?auto_278427 ) ( ON ?auto_278429 ?auto_278428 ) ( ON ?auto_278430 ?auto_278429 ) ( ON ?auto_278431 ?auto_278430 ) ( ON ?auto_278432 ?auto_278431 ) ( ON ?auto_278433 ?auto_278432 ) ( not ( = ?auto_278421 ?auto_278422 ) ) ( not ( = ?auto_278421 ?auto_278423 ) ) ( not ( = ?auto_278421 ?auto_278424 ) ) ( not ( = ?auto_278421 ?auto_278425 ) ) ( not ( = ?auto_278421 ?auto_278426 ) ) ( not ( = ?auto_278421 ?auto_278427 ) ) ( not ( = ?auto_278421 ?auto_278428 ) ) ( not ( = ?auto_278421 ?auto_278429 ) ) ( not ( = ?auto_278421 ?auto_278430 ) ) ( not ( = ?auto_278421 ?auto_278431 ) ) ( not ( = ?auto_278421 ?auto_278432 ) ) ( not ( = ?auto_278421 ?auto_278433 ) ) ( not ( = ?auto_278421 ?auto_278434 ) ) ( not ( = ?auto_278422 ?auto_278423 ) ) ( not ( = ?auto_278422 ?auto_278424 ) ) ( not ( = ?auto_278422 ?auto_278425 ) ) ( not ( = ?auto_278422 ?auto_278426 ) ) ( not ( = ?auto_278422 ?auto_278427 ) ) ( not ( = ?auto_278422 ?auto_278428 ) ) ( not ( = ?auto_278422 ?auto_278429 ) ) ( not ( = ?auto_278422 ?auto_278430 ) ) ( not ( = ?auto_278422 ?auto_278431 ) ) ( not ( = ?auto_278422 ?auto_278432 ) ) ( not ( = ?auto_278422 ?auto_278433 ) ) ( not ( = ?auto_278422 ?auto_278434 ) ) ( not ( = ?auto_278423 ?auto_278424 ) ) ( not ( = ?auto_278423 ?auto_278425 ) ) ( not ( = ?auto_278423 ?auto_278426 ) ) ( not ( = ?auto_278423 ?auto_278427 ) ) ( not ( = ?auto_278423 ?auto_278428 ) ) ( not ( = ?auto_278423 ?auto_278429 ) ) ( not ( = ?auto_278423 ?auto_278430 ) ) ( not ( = ?auto_278423 ?auto_278431 ) ) ( not ( = ?auto_278423 ?auto_278432 ) ) ( not ( = ?auto_278423 ?auto_278433 ) ) ( not ( = ?auto_278423 ?auto_278434 ) ) ( not ( = ?auto_278424 ?auto_278425 ) ) ( not ( = ?auto_278424 ?auto_278426 ) ) ( not ( = ?auto_278424 ?auto_278427 ) ) ( not ( = ?auto_278424 ?auto_278428 ) ) ( not ( = ?auto_278424 ?auto_278429 ) ) ( not ( = ?auto_278424 ?auto_278430 ) ) ( not ( = ?auto_278424 ?auto_278431 ) ) ( not ( = ?auto_278424 ?auto_278432 ) ) ( not ( = ?auto_278424 ?auto_278433 ) ) ( not ( = ?auto_278424 ?auto_278434 ) ) ( not ( = ?auto_278425 ?auto_278426 ) ) ( not ( = ?auto_278425 ?auto_278427 ) ) ( not ( = ?auto_278425 ?auto_278428 ) ) ( not ( = ?auto_278425 ?auto_278429 ) ) ( not ( = ?auto_278425 ?auto_278430 ) ) ( not ( = ?auto_278425 ?auto_278431 ) ) ( not ( = ?auto_278425 ?auto_278432 ) ) ( not ( = ?auto_278425 ?auto_278433 ) ) ( not ( = ?auto_278425 ?auto_278434 ) ) ( not ( = ?auto_278426 ?auto_278427 ) ) ( not ( = ?auto_278426 ?auto_278428 ) ) ( not ( = ?auto_278426 ?auto_278429 ) ) ( not ( = ?auto_278426 ?auto_278430 ) ) ( not ( = ?auto_278426 ?auto_278431 ) ) ( not ( = ?auto_278426 ?auto_278432 ) ) ( not ( = ?auto_278426 ?auto_278433 ) ) ( not ( = ?auto_278426 ?auto_278434 ) ) ( not ( = ?auto_278427 ?auto_278428 ) ) ( not ( = ?auto_278427 ?auto_278429 ) ) ( not ( = ?auto_278427 ?auto_278430 ) ) ( not ( = ?auto_278427 ?auto_278431 ) ) ( not ( = ?auto_278427 ?auto_278432 ) ) ( not ( = ?auto_278427 ?auto_278433 ) ) ( not ( = ?auto_278427 ?auto_278434 ) ) ( not ( = ?auto_278428 ?auto_278429 ) ) ( not ( = ?auto_278428 ?auto_278430 ) ) ( not ( = ?auto_278428 ?auto_278431 ) ) ( not ( = ?auto_278428 ?auto_278432 ) ) ( not ( = ?auto_278428 ?auto_278433 ) ) ( not ( = ?auto_278428 ?auto_278434 ) ) ( not ( = ?auto_278429 ?auto_278430 ) ) ( not ( = ?auto_278429 ?auto_278431 ) ) ( not ( = ?auto_278429 ?auto_278432 ) ) ( not ( = ?auto_278429 ?auto_278433 ) ) ( not ( = ?auto_278429 ?auto_278434 ) ) ( not ( = ?auto_278430 ?auto_278431 ) ) ( not ( = ?auto_278430 ?auto_278432 ) ) ( not ( = ?auto_278430 ?auto_278433 ) ) ( not ( = ?auto_278430 ?auto_278434 ) ) ( not ( = ?auto_278431 ?auto_278432 ) ) ( not ( = ?auto_278431 ?auto_278433 ) ) ( not ( = ?auto_278431 ?auto_278434 ) ) ( not ( = ?auto_278432 ?auto_278433 ) ) ( not ( = ?auto_278432 ?auto_278434 ) ) ( not ( = ?auto_278433 ?auto_278434 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_278434 )
      ( !STACK ?auto_278434 ?auto_278433 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_278449 - BLOCK
      ?auto_278450 - BLOCK
      ?auto_278451 - BLOCK
      ?auto_278452 - BLOCK
      ?auto_278453 - BLOCK
      ?auto_278454 - BLOCK
      ?auto_278455 - BLOCK
      ?auto_278456 - BLOCK
      ?auto_278457 - BLOCK
      ?auto_278458 - BLOCK
      ?auto_278459 - BLOCK
      ?auto_278460 - BLOCK
      ?auto_278461 - BLOCK
      ?auto_278462 - BLOCK
    )
    :vars
    (
      ?auto_278463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_278462 ?auto_278463 ) ( ON-TABLE ?auto_278449 ) ( ON ?auto_278450 ?auto_278449 ) ( ON ?auto_278451 ?auto_278450 ) ( ON ?auto_278452 ?auto_278451 ) ( ON ?auto_278453 ?auto_278452 ) ( ON ?auto_278454 ?auto_278453 ) ( ON ?auto_278455 ?auto_278454 ) ( ON ?auto_278456 ?auto_278455 ) ( ON ?auto_278457 ?auto_278456 ) ( ON ?auto_278458 ?auto_278457 ) ( ON ?auto_278459 ?auto_278458 ) ( ON ?auto_278460 ?auto_278459 ) ( not ( = ?auto_278449 ?auto_278450 ) ) ( not ( = ?auto_278449 ?auto_278451 ) ) ( not ( = ?auto_278449 ?auto_278452 ) ) ( not ( = ?auto_278449 ?auto_278453 ) ) ( not ( = ?auto_278449 ?auto_278454 ) ) ( not ( = ?auto_278449 ?auto_278455 ) ) ( not ( = ?auto_278449 ?auto_278456 ) ) ( not ( = ?auto_278449 ?auto_278457 ) ) ( not ( = ?auto_278449 ?auto_278458 ) ) ( not ( = ?auto_278449 ?auto_278459 ) ) ( not ( = ?auto_278449 ?auto_278460 ) ) ( not ( = ?auto_278449 ?auto_278461 ) ) ( not ( = ?auto_278449 ?auto_278462 ) ) ( not ( = ?auto_278449 ?auto_278463 ) ) ( not ( = ?auto_278450 ?auto_278451 ) ) ( not ( = ?auto_278450 ?auto_278452 ) ) ( not ( = ?auto_278450 ?auto_278453 ) ) ( not ( = ?auto_278450 ?auto_278454 ) ) ( not ( = ?auto_278450 ?auto_278455 ) ) ( not ( = ?auto_278450 ?auto_278456 ) ) ( not ( = ?auto_278450 ?auto_278457 ) ) ( not ( = ?auto_278450 ?auto_278458 ) ) ( not ( = ?auto_278450 ?auto_278459 ) ) ( not ( = ?auto_278450 ?auto_278460 ) ) ( not ( = ?auto_278450 ?auto_278461 ) ) ( not ( = ?auto_278450 ?auto_278462 ) ) ( not ( = ?auto_278450 ?auto_278463 ) ) ( not ( = ?auto_278451 ?auto_278452 ) ) ( not ( = ?auto_278451 ?auto_278453 ) ) ( not ( = ?auto_278451 ?auto_278454 ) ) ( not ( = ?auto_278451 ?auto_278455 ) ) ( not ( = ?auto_278451 ?auto_278456 ) ) ( not ( = ?auto_278451 ?auto_278457 ) ) ( not ( = ?auto_278451 ?auto_278458 ) ) ( not ( = ?auto_278451 ?auto_278459 ) ) ( not ( = ?auto_278451 ?auto_278460 ) ) ( not ( = ?auto_278451 ?auto_278461 ) ) ( not ( = ?auto_278451 ?auto_278462 ) ) ( not ( = ?auto_278451 ?auto_278463 ) ) ( not ( = ?auto_278452 ?auto_278453 ) ) ( not ( = ?auto_278452 ?auto_278454 ) ) ( not ( = ?auto_278452 ?auto_278455 ) ) ( not ( = ?auto_278452 ?auto_278456 ) ) ( not ( = ?auto_278452 ?auto_278457 ) ) ( not ( = ?auto_278452 ?auto_278458 ) ) ( not ( = ?auto_278452 ?auto_278459 ) ) ( not ( = ?auto_278452 ?auto_278460 ) ) ( not ( = ?auto_278452 ?auto_278461 ) ) ( not ( = ?auto_278452 ?auto_278462 ) ) ( not ( = ?auto_278452 ?auto_278463 ) ) ( not ( = ?auto_278453 ?auto_278454 ) ) ( not ( = ?auto_278453 ?auto_278455 ) ) ( not ( = ?auto_278453 ?auto_278456 ) ) ( not ( = ?auto_278453 ?auto_278457 ) ) ( not ( = ?auto_278453 ?auto_278458 ) ) ( not ( = ?auto_278453 ?auto_278459 ) ) ( not ( = ?auto_278453 ?auto_278460 ) ) ( not ( = ?auto_278453 ?auto_278461 ) ) ( not ( = ?auto_278453 ?auto_278462 ) ) ( not ( = ?auto_278453 ?auto_278463 ) ) ( not ( = ?auto_278454 ?auto_278455 ) ) ( not ( = ?auto_278454 ?auto_278456 ) ) ( not ( = ?auto_278454 ?auto_278457 ) ) ( not ( = ?auto_278454 ?auto_278458 ) ) ( not ( = ?auto_278454 ?auto_278459 ) ) ( not ( = ?auto_278454 ?auto_278460 ) ) ( not ( = ?auto_278454 ?auto_278461 ) ) ( not ( = ?auto_278454 ?auto_278462 ) ) ( not ( = ?auto_278454 ?auto_278463 ) ) ( not ( = ?auto_278455 ?auto_278456 ) ) ( not ( = ?auto_278455 ?auto_278457 ) ) ( not ( = ?auto_278455 ?auto_278458 ) ) ( not ( = ?auto_278455 ?auto_278459 ) ) ( not ( = ?auto_278455 ?auto_278460 ) ) ( not ( = ?auto_278455 ?auto_278461 ) ) ( not ( = ?auto_278455 ?auto_278462 ) ) ( not ( = ?auto_278455 ?auto_278463 ) ) ( not ( = ?auto_278456 ?auto_278457 ) ) ( not ( = ?auto_278456 ?auto_278458 ) ) ( not ( = ?auto_278456 ?auto_278459 ) ) ( not ( = ?auto_278456 ?auto_278460 ) ) ( not ( = ?auto_278456 ?auto_278461 ) ) ( not ( = ?auto_278456 ?auto_278462 ) ) ( not ( = ?auto_278456 ?auto_278463 ) ) ( not ( = ?auto_278457 ?auto_278458 ) ) ( not ( = ?auto_278457 ?auto_278459 ) ) ( not ( = ?auto_278457 ?auto_278460 ) ) ( not ( = ?auto_278457 ?auto_278461 ) ) ( not ( = ?auto_278457 ?auto_278462 ) ) ( not ( = ?auto_278457 ?auto_278463 ) ) ( not ( = ?auto_278458 ?auto_278459 ) ) ( not ( = ?auto_278458 ?auto_278460 ) ) ( not ( = ?auto_278458 ?auto_278461 ) ) ( not ( = ?auto_278458 ?auto_278462 ) ) ( not ( = ?auto_278458 ?auto_278463 ) ) ( not ( = ?auto_278459 ?auto_278460 ) ) ( not ( = ?auto_278459 ?auto_278461 ) ) ( not ( = ?auto_278459 ?auto_278462 ) ) ( not ( = ?auto_278459 ?auto_278463 ) ) ( not ( = ?auto_278460 ?auto_278461 ) ) ( not ( = ?auto_278460 ?auto_278462 ) ) ( not ( = ?auto_278460 ?auto_278463 ) ) ( not ( = ?auto_278461 ?auto_278462 ) ) ( not ( = ?auto_278461 ?auto_278463 ) ) ( not ( = ?auto_278462 ?auto_278463 ) ) ( CLEAR ?auto_278460 ) ( ON ?auto_278461 ?auto_278462 ) ( CLEAR ?auto_278461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_278449 ?auto_278450 ?auto_278451 ?auto_278452 ?auto_278453 ?auto_278454 ?auto_278455 ?auto_278456 ?auto_278457 ?auto_278458 ?auto_278459 ?auto_278460 ?auto_278461 )
      ( MAKE-14PILE ?auto_278449 ?auto_278450 ?auto_278451 ?auto_278452 ?auto_278453 ?auto_278454 ?auto_278455 ?auto_278456 ?auto_278457 ?auto_278458 ?auto_278459 ?auto_278460 ?auto_278461 ?auto_278462 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_278478 - BLOCK
      ?auto_278479 - BLOCK
      ?auto_278480 - BLOCK
      ?auto_278481 - BLOCK
      ?auto_278482 - BLOCK
      ?auto_278483 - BLOCK
      ?auto_278484 - BLOCK
      ?auto_278485 - BLOCK
      ?auto_278486 - BLOCK
      ?auto_278487 - BLOCK
      ?auto_278488 - BLOCK
      ?auto_278489 - BLOCK
      ?auto_278490 - BLOCK
      ?auto_278491 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_278491 ) ( ON-TABLE ?auto_278478 ) ( ON ?auto_278479 ?auto_278478 ) ( ON ?auto_278480 ?auto_278479 ) ( ON ?auto_278481 ?auto_278480 ) ( ON ?auto_278482 ?auto_278481 ) ( ON ?auto_278483 ?auto_278482 ) ( ON ?auto_278484 ?auto_278483 ) ( ON ?auto_278485 ?auto_278484 ) ( ON ?auto_278486 ?auto_278485 ) ( ON ?auto_278487 ?auto_278486 ) ( ON ?auto_278488 ?auto_278487 ) ( ON ?auto_278489 ?auto_278488 ) ( not ( = ?auto_278478 ?auto_278479 ) ) ( not ( = ?auto_278478 ?auto_278480 ) ) ( not ( = ?auto_278478 ?auto_278481 ) ) ( not ( = ?auto_278478 ?auto_278482 ) ) ( not ( = ?auto_278478 ?auto_278483 ) ) ( not ( = ?auto_278478 ?auto_278484 ) ) ( not ( = ?auto_278478 ?auto_278485 ) ) ( not ( = ?auto_278478 ?auto_278486 ) ) ( not ( = ?auto_278478 ?auto_278487 ) ) ( not ( = ?auto_278478 ?auto_278488 ) ) ( not ( = ?auto_278478 ?auto_278489 ) ) ( not ( = ?auto_278478 ?auto_278490 ) ) ( not ( = ?auto_278478 ?auto_278491 ) ) ( not ( = ?auto_278479 ?auto_278480 ) ) ( not ( = ?auto_278479 ?auto_278481 ) ) ( not ( = ?auto_278479 ?auto_278482 ) ) ( not ( = ?auto_278479 ?auto_278483 ) ) ( not ( = ?auto_278479 ?auto_278484 ) ) ( not ( = ?auto_278479 ?auto_278485 ) ) ( not ( = ?auto_278479 ?auto_278486 ) ) ( not ( = ?auto_278479 ?auto_278487 ) ) ( not ( = ?auto_278479 ?auto_278488 ) ) ( not ( = ?auto_278479 ?auto_278489 ) ) ( not ( = ?auto_278479 ?auto_278490 ) ) ( not ( = ?auto_278479 ?auto_278491 ) ) ( not ( = ?auto_278480 ?auto_278481 ) ) ( not ( = ?auto_278480 ?auto_278482 ) ) ( not ( = ?auto_278480 ?auto_278483 ) ) ( not ( = ?auto_278480 ?auto_278484 ) ) ( not ( = ?auto_278480 ?auto_278485 ) ) ( not ( = ?auto_278480 ?auto_278486 ) ) ( not ( = ?auto_278480 ?auto_278487 ) ) ( not ( = ?auto_278480 ?auto_278488 ) ) ( not ( = ?auto_278480 ?auto_278489 ) ) ( not ( = ?auto_278480 ?auto_278490 ) ) ( not ( = ?auto_278480 ?auto_278491 ) ) ( not ( = ?auto_278481 ?auto_278482 ) ) ( not ( = ?auto_278481 ?auto_278483 ) ) ( not ( = ?auto_278481 ?auto_278484 ) ) ( not ( = ?auto_278481 ?auto_278485 ) ) ( not ( = ?auto_278481 ?auto_278486 ) ) ( not ( = ?auto_278481 ?auto_278487 ) ) ( not ( = ?auto_278481 ?auto_278488 ) ) ( not ( = ?auto_278481 ?auto_278489 ) ) ( not ( = ?auto_278481 ?auto_278490 ) ) ( not ( = ?auto_278481 ?auto_278491 ) ) ( not ( = ?auto_278482 ?auto_278483 ) ) ( not ( = ?auto_278482 ?auto_278484 ) ) ( not ( = ?auto_278482 ?auto_278485 ) ) ( not ( = ?auto_278482 ?auto_278486 ) ) ( not ( = ?auto_278482 ?auto_278487 ) ) ( not ( = ?auto_278482 ?auto_278488 ) ) ( not ( = ?auto_278482 ?auto_278489 ) ) ( not ( = ?auto_278482 ?auto_278490 ) ) ( not ( = ?auto_278482 ?auto_278491 ) ) ( not ( = ?auto_278483 ?auto_278484 ) ) ( not ( = ?auto_278483 ?auto_278485 ) ) ( not ( = ?auto_278483 ?auto_278486 ) ) ( not ( = ?auto_278483 ?auto_278487 ) ) ( not ( = ?auto_278483 ?auto_278488 ) ) ( not ( = ?auto_278483 ?auto_278489 ) ) ( not ( = ?auto_278483 ?auto_278490 ) ) ( not ( = ?auto_278483 ?auto_278491 ) ) ( not ( = ?auto_278484 ?auto_278485 ) ) ( not ( = ?auto_278484 ?auto_278486 ) ) ( not ( = ?auto_278484 ?auto_278487 ) ) ( not ( = ?auto_278484 ?auto_278488 ) ) ( not ( = ?auto_278484 ?auto_278489 ) ) ( not ( = ?auto_278484 ?auto_278490 ) ) ( not ( = ?auto_278484 ?auto_278491 ) ) ( not ( = ?auto_278485 ?auto_278486 ) ) ( not ( = ?auto_278485 ?auto_278487 ) ) ( not ( = ?auto_278485 ?auto_278488 ) ) ( not ( = ?auto_278485 ?auto_278489 ) ) ( not ( = ?auto_278485 ?auto_278490 ) ) ( not ( = ?auto_278485 ?auto_278491 ) ) ( not ( = ?auto_278486 ?auto_278487 ) ) ( not ( = ?auto_278486 ?auto_278488 ) ) ( not ( = ?auto_278486 ?auto_278489 ) ) ( not ( = ?auto_278486 ?auto_278490 ) ) ( not ( = ?auto_278486 ?auto_278491 ) ) ( not ( = ?auto_278487 ?auto_278488 ) ) ( not ( = ?auto_278487 ?auto_278489 ) ) ( not ( = ?auto_278487 ?auto_278490 ) ) ( not ( = ?auto_278487 ?auto_278491 ) ) ( not ( = ?auto_278488 ?auto_278489 ) ) ( not ( = ?auto_278488 ?auto_278490 ) ) ( not ( = ?auto_278488 ?auto_278491 ) ) ( not ( = ?auto_278489 ?auto_278490 ) ) ( not ( = ?auto_278489 ?auto_278491 ) ) ( not ( = ?auto_278490 ?auto_278491 ) ) ( CLEAR ?auto_278489 ) ( ON ?auto_278490 ?auto_278491 ) ( CLEAR ?auto_278490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_278478 ?auto_278479 ?auto_278480 ?auto_278481 ?auto_278482 ?auto_278483 ?auto_278484 ?auto_278485 ?auto_278486 ?auto_278487 ?auto_278488 ?auto_278489 ?auto_278490 )
      ( MAKE-14PILE ?auto_278478 ?auto_278479 ?auto_278480 ?auto_278481 ?auto_278482 ?auto_278483 ?auto_278484 ?auto_278485 ?auto_278486 ?auto_278487 ?auto_278488 ?auto_278489 ?auto_278490 ?auto_278491 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_278506 - BLOCK
      ?auto_278507 - BLOCK
      ?auto_278508 - BLOCK
      ?auto_278509 - BLOCK
      ?auto_278510 - BLOCK
      ?auto_278511 - BLOCK
      ?auto_278512 - BLOCK
      ?auto_278513 - BLOCK
      ?auto_278514 - BLOCK
      ?auto_278515 - BLOCK
      ?auto_278516 - BLOCK
      ?auto_278517 - BLOCK
      ?auto_278518 - BLOCK
      ?auto_278519 - BLOCK
    )
    :vars
    (
      ?auto_278520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_278519 ?auto_278520 ) ( ON-TABLE ?auto_278506 ) ( ON ?auto_278507 ?auto_278506 ) ( ON ?auto_278508 ?auto_278507 ) ( ON ?auto_278509 ?auto_278508 ) ( ON ?auto_278510 ?auto_278509 ) ( ON ?auto_278511 ?auto_278510 ) ( ON ?auto_278512 ?auto_278511 ) ( ON ?auto_278513 ?auto_278512 ) ( ON ?auto_278514 ?auto_278513 ) ( ON ?auto_278515 ?auto_278514 ) ( ON ?auto_278516 ?auto_278515 ) ( not ( = ?auto_278506 ?auto_278507 ) ) ( not ( = ?auto_278506 ?auto_278508 ) ) ( not ( = ?auto_278506 ?auto_278509 ) ) ( not ( = ?auto_278506 ?auto_278510 ) ) ( not ( = ?auto_278506 ?auto_278511 ) ) ( not ( = ?auto_278506 ?auto_278512 ) ) ( not ( = ?auto_278506 ?auto_278513 ) ) ( not ( = ?auto_278506 ?auto_278514 ) ) ( not ( = ?auto_278506 ?auto_278515 ) ) ( not ( = ?auto_278506 ?auto_278516 ) ) ( not ( = ?auto_278506 ?auto_278517 ) ) ( not ( = ?auto_278506 ?auto_278518 ) ) ( not ( = ?auto_278506 ?auto_278519 ) ) ( not ( = ?auto_278506 ?auto_278520 ) ) ( not ( = ?auto_278507 ?auto_278508 ) ) ( not ( = ?auto_278507 ?auto_278509 ) ) ( not ( = ?auto_278507 ?auto_278510 ) ) ( not ( = ?auto_278507 ?auto_278511 ) ) ( not ( = ?auto_278507 ?auto_278512 ) ) ( not ( = ?auto_278507 ?auto_278513 ) ) ( not ( = ?auto_278507 ?auto_278514 ) ) ( not ( = ?auto_278507 ?auto_278515 ) ) ( not ( = ?auto_278507 ?auto_278516 ) ) ( not ( = ?auto_278507 ?auto_278517 ) ) ( not ( = ?auto_278507 ?auto_278518 ) ) ( not ( = ?auto_278507 ?auto_278519 ) ) ( not ( = ?auto_278507 ?auto_278520 ) ) ( not ( = ?auto_278508 ?auto_278509 ) ) ( not ( = ?auto_278508 ?auto_278510 ) ) ( not ( = ?auto_278508 ?auto_278511 ) ) ( not ( = ?auto_278508 ?auto_278512 ) ) ( not ( = ?auto_278508 ?auto_278513 ) ) ( not ( = ?auto_278508 ?auto_278514 ) ) ( not ( = ?auto_278508 ?auto_278515 ) ) ( not ( = ?auto_278508 ?auto_278516 ) ) ( not ( = ?auto_278508 ?auto_278517 ) ) ( not ( = ?auto_278508 ?auto_278518 ) ) ( not ( = ?auto_278508 ?auto_278519 ) ) ( not ( = ?auto_278508 ?auto_278520 ) ) ( not ( = ?auto_278509 ?auto_278510 ) ) ( not ( = ?auto_278509 ?auto_278511 ) ) ( not ( = ?auto_278509 ?auto_278512 ) ) ( not ( = ?auto_278509 ?auto_278513 ) ) ( not ( = ?auto_278509 ?auto_278514 ) ) ( not ( = ?auto_278509 ?auto_278515 ) ) ( not ( = ?auto_278509 ?auto_278516 ) ) ( not ( = ?auto_278509 ?auto_278517 ) ) ( not ( = ?auto_278509 ?auto_278518 ) ) ( not ( = ?auto_278509 ?auto_278519 ) ) ( not ( = ?auto_278509 ?auto_278520 ) ) ( not ( = ?auto_278510 ?auto_278511 ) ) ( not ( = ?auto_278510 ?auto_278512 ) ) ( not ( = ?auto_278510 ?auto_278513 ) ) ( not ( = ?auto_278510 ?auto_278514 ) ) ( not ( = ?auto_278510 ?auto_278515 ) ) ( not ( = ?auto_278510 ?auto_278516 ) ) ( not ( = ?auto_278510 ?auto_278517 ) ) ( not ( = ?auto_278510 ?auto_278518 ) ) ( not ( = ?auto_278510 ?auto_278519 ) ) ( not ( = ?auto_278510 ?auto_278520 ) ) ( not ( = ?auto_278511 ?auto_278512 ) ) ( not ( = ?auto_278511 ?auto_278513 ) ) ( not ( = ?auto_278511 ?auto_278514 ) ) ( not ( = ?auto_278511 ?auto_278515 ) ) ( not ( = ?auto_278511 ?auto_278516 ) ) ( not ( = ?auto_278511 ?auto_278517 ) ) ( not ( = ?auto_278511 ?auto_278518 ) ) ( not ( = ?auto_278511 ?auto_278519 ) ) ( not ( = ?auto_278511 ?auto_278520 ) ) ( not ( = ?auto_278512 ?auto_278513 ) ) ( not ( = ?auto_278512 ?auto_278514 ) ) ( not ( = ?auto_278512 ?auto_278515 ) ) ( not ( = ?auto_278512 ?auto_278516 ) ) ( not ( = ?auto_278512 ?auto_278517 ) ) ( not ( = ?auto_278512 ?auto_278518 ) ) ( not ( = ?auto_278512 ?auto_278519 ) ) ( not ( = ?auto_278512 ?auto_278520 ) ) ( not ( = ?auto_278513 ?auto_278514 ) ) ( not ( = ?auto_278513 ?auto_278515 ) ) ( not ( = ?auto_278513 ?auto_278516 ) ) ( not ( = ?auto_278513 ?auto_278517 ) ) ( not ( = ?auto_278513 ?auto_278518 ) ) ( not ( = ?auto_278513 ?auto_278519 ) ) ( not ( = ?auto_278513 ?auto_278520 ) ) ( not ( = ?auto_278514 ?auto_278515 ) ) ( not ( = ?auto_278514 ?auto_278516 ) ) ( not ( = ?auto_278514 ?auto_278517 ) ) ( not ( = ?auto_278514 ?auto_278518 ) ) ( not ( = ?auto_278514 ?auto_278519 ) ) ( not ( = ?auto_278514 ?auto_278520 ) ) ( not ( = ?auto_278515 ?auto_278516 ) ) ( not ( = ?auto_278515 ?auto_278517 ) ) ( not ( = ?auto_278515 ?auto_278518 ) ) ( not ( = ?auto_278515 ?auto_278519 ) ) ( not ( = ?auto_278515 ?auto_278520 ) ) ( not ( = ?auto_278516 ?auto_278517 ) ) ( not ( = ?auto_278516 ?auto_278518 ) ) ( not ( = ?auto_278516 ?auto_278519 ) ) ( not ( = ?auto_278516 ?auto_278520 ) ) ( not ( = ?auto_278517 ?auto_278518 ) ) ( not ( = ?auto_278517 ?auto_278519 ) ) ( not ( = ?auto_278517 ?auto_278520 ) ) ( not ( = ?auto_278518 ?auto_278519 ) ) ( not ( = ?auto_278518 ?auto_278520 ) ) ( not ( = ?auto_278519 ?auto_278520 ) ) ( ON ?auto_278518 ?auto_278519 ) ( CLEAR ?auto_278516 ) ( ON ?auto_278517 ?auto_278518 ) ( CLEAR ?auto_278517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_278506 ?auto_278507 ?auto_278508 ?auto_278509 ?auto_278510 ?auto_278511 ?auto_278512 ?auto_278513 ?auto_278514 ?auto_278515 ?auto_278516 ?auto_278517 )
      ( MAKE-14PILE ?auto_278506 ?auto_278507 ?auto_278508 ?auto_278509 ?auto_278510 ?auto_278511 ?auto_278512 ?auto_278513 ?auto_278514 ?auto_278515 ?auto_278516 ?auto_278517 ?auto_278518 ?auto_278519 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_278535 - BLOCK
      ?auto_278536 - BLOCK
      ?auto_278537 - BLOCK
      ?auto_278538 - BLOCK
      ?auto_278539 - BLOCK
      ?auto_278540 - BLOCK
      ?auto_278541 - BLOCK
      ?auto_278542 - BLOCK
      ?auto_278543 - BLOCK
      ?auto_278544 - BLOCK
      ?auto_278545 - BLOCK
      ?auto_278546 - BLOCK
      ?auto_278547 - BLOCK
      ?auto_278548 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_278548 ) ( ON-TABLE ?auto_278535 ) ( ON ?auto_278536 ?auto_278535 ) ( ON ?auto_278537 ?auto_278536 ) ( ON ?auto_278538 ?auto_278537 ) ( ON ?auto_278539 ?auto_278538 ) ( ON ?auto_278540 ?auto_278539 ) ( ON ?auto_278541 ?auto_278540 ) ( ON ?auto_278542 ?auto_278541 ) ( ON ?auto_278543 ?auto_278542 ) ( ON ?auto_278544 ?auto_278543 ) ( ON ?auto_278545 ?auto_278544 ) ( not ( = ?auto_278535 ?auto_278536 ) ) ( not ( = ?auto_278535 ?auto_278537 ) ) ( not ( = ?auto_278535 ?auto_278538 ) ) ( not ( = ?auto_278535 ?auto_278539 ) ) ( not ( = ?auto_278535 ?auto_278540 ) ) ( not ( = ?auto_278535 ?auto_278541 ) ) ( not ( = ?auto_278535 ?auto_278542 ) ) ( not ( = ?auto_278535 ?auto_278543 ) ) ( not ( = ?auto_278535 ?auto_278544 ) ) ( not ( = ?auto_278535 ?auto_278545 ) ) ( not ( = ?auto_278535 ?auto_278546 ) ) ( not ( = ?auto_278535 ?auto_278547 ) ) ( not ( = ?auto_278535 ?auto_278548 ) ) ( not ( = ?auto_278536 ?auto_278537 ) ) ( not ( = ?auto_278536 ?auto_278538 ) ) ( not ( = ?auto_278536 ?auto_278539 ) ) ( not ( = ?auto_278536 ?auto_278540 ) ) ( not ( = ?auto_278536 ?auto_278541 ) ) ( not ( = ?auto_278536 ?auto_278542 ) ) ( not ( = ?auto_278536 ?auto_278543 ) ) ( not ( = ?auto_278536 ?auto_278544 ) ) ( not ( = ?auto_278536 ?auto_278545 ) ) ( not ( = ?auto_278536 ?auto_278546 ) ) ( not ( = ?auto_278536 ?auto_278547 ) ) ( not ( = ?auto_278536 ?auto_278548 ) ) ( not ( = ?auto_278537 ?auto_278538 ) ) ( not ( = ?auto_278537 ?auto_278539 ) ) ( not ( = ?auto_278537 ?auto_278540 ) ) ( not ( = ?auto_278537 ?auto_278541 ) ) ( not ( = ?auto_278537 ?auto_278542 ) ) ( not ( = ?auto_278537 ?auto_278543 ) ) ( not ( = ?auto_278537 ?auto_278544 ) ) ( not ( = ?auto_278537 ?auto_278545 ) ) ( not ( = ?auto_278537 ?auto_278546 ) ) ( not ( = ?auto_278537 ?auto_278547 ) ) ( not ( = ?auto_278537 ?auto_278548 ) ) ( not ( = ?auto_278538 ?auto_278539 ) ) ( not ( = ?auto_278538 ?auto_278540 ) ) ( not ( = ?auto_278538 ?auto_278541 ) ) ( not ( = ?auto_278538 ?auto_278542 ) ) ( not ( = ?auto_278538 ?auto_278543 ) ) ( not ( = ?auto_278538 ?auto_278544 ) ) ( not ( = ?auto_278538 ?auto_278545 ) ) ( not ( = ?auto_278538 ?auto_278546 ) ) ( not ( = ?auto_278538 ?auto_278547 ) ) ( not ( = ?auto_278538 ?auto_278548 ) ) ( not ( = ?auto_278539 ?auto_278540 ) ) ( not ( = ?auto_278539 ?auto_278541 ) ) ( not ( = ?auto_278539 ?auto_278542 ) ) ( not ( = ?auto_278539 ?auto_278543 ) ) ( not ( = ?auto_278539 ?auto_278544 ) ) ( not ( = ?auto_278539 ?auto_278545 ) ) ( not ( = ?auto_278539 ?auto_278546 ) ) ( not ( = ?auto_278539 ?auto_278547 ) ) ( not ( = ?auto_278539 ?auto_278548 ) ) ( not ( = ?auto_278540 ?auto_278541 ) ) ( not ( = ?auto_278540 ?auto_278542 ) ) ( not ( = ?auto_278540 ?auto_278543 ) ) ( not ( = ?auto_278540 ?auto_278544 ) ) ( not ( = ?auto_278540 ?auto_278545 ) ) ( not ( = ?auto_278540 ?auto_278546 ) ) ( not ( = ?auto_278540 ?auto_278547 ) ) ( not ( = ?auto_278540 ?auto_278548 ) ) ( not ( = ?auto_278541 ?auto_278542 ) ) ( not ( = ?auto_278541 ?auto_278543 ) ) ( not ( = ?auto_278541 ?auto_278544 ) ) ( not ( = ?auto_278541 ?auto_278545 ) ) ( not ( = ?auto_278541 ?auto_278546 ) ) ( not ( = ?auto_278541 ?auto_278547 ) ) ( not ( = ?auto_278541 ?auto_278548 ) ) ( not ( = ?auto_278542 ?auto_278543 ) ) ( not ( = ?auto_278542 ?auto_278544 ) ) ( not ( = ?auto_278542 ?auto_278545 ) ) ( not ( = ?auto_278542 ?auto_278546 ) ) ( not ( = ?auto_278542 ?auto_278547 ) ) ( not ( = ?auto_278542 ?auto_278548 ) ) ( not ( = ?auto_278543 ?auto_278544 ) ) ( not ( = ?auto_278543 ?auto_278545 ) ) ( not ( = ?auto_278543 ?auto_278546 ) ) ( not ( = ?auto_278543 ?auto_278547 ) ) ( not ( = ?auto_278543 ?auto_278548 ) ) ( not ( = ?auto_278544 ?auto_278545 ) ) ( not ( = ?auto_278544 ?auto_278546 ) ) ( not ( = ?auto_278544 ?auto_278547 ) ) ( not ( = ?auto_278544 ?auto_278548 ) ) ( not ( = ?auto_278545 ?auto_278546 ) ) ( not ( = ?auto_278545 ?auto_278547 ) ) ( not ( = ?auto_278545 ?auto_278548 ) ) ( not ( = ?auto_278546 ?auto_278547 ) ) ( not ( = ?auto_278546 ?auto_278548 ) ) ( not ( = ?auto_278547 ?auto_278548 ) ) ( ON ?auto_278547 ?auto_278548 ) ( CLEAR ?auto_278545 ) ( ON ?auto_278546 ?auto_278547 ) ( CLEAR ?auto_278546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_278535 ?auto_278536 ?auto_278537 ?auto_278538 ?auto_278539 ?auto_278540 ?auto_278541 ?auto_278542 ?auto_278543 ?auto_278544 ?auto_278545 ?auto_278546 )
      ( MAKE-14PILE ?auto_278535 ?auto_278536 ?auto_278537 ?auto_278538 ?auto_278539 ?auto_278540 ?auto_278541 ?auto_278542 ?auto_278543 ?auto_278544 ?auto_278545 ?auto_278546 ?auto_278547 ?auto_278548 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_278563 - BLOCK
      ?auto_278564 - BLOCK
      ?auto_278565 - BLOCK
      ?auto_278566 - BLOCK
      ?auto_278567 - BLOCK
      ?auto_278568 - BLOCK
      ?auto_278569 - BLOCK
      ?auto_278570 - BLOCK
      ?auto_278571 - BLOCK
      ?auto_278572 - BLOCK
      ?auto_278573 - BLOCK
      ?auto_278574 - BLOCK
      ?auto_278575 - BLOCK
      ?auto_278576 - BLOCK
    )
    :vars
    (
      ?auto_278577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_278576 ?auto_278577 ) ( ON-TABLE ?auto_278563 ) ( ON ?auto_278564 ?auto_278563 ) ( ON ?auto_278565 ?auto_278564 ) ( ON ?auto_278566 ?auto_278565 ) ( ON ?auto_278567 ?auto_278566 ) ( ON ?auto_278568 ?auto_278567 ) ( ON ?auto_278569 ?auto_278568 ) ( ON ?auto_278570 ?auto_278569 ) ( ON ?auto_278571 ?auto_278570 ) ( ON ?auto_278572 ?auto_278571 ) ( not ( = ?auto_278563 ?auto_278564 ) ) ( not ( = ?auto_278563 ?auto_278565 ) ) ( not ( = ?auto_278563 ?auto_278566 ) ) ( not ( = ?auto_278563 ?auto_278567 ) ) ( not ( = ?auto_278563 ?auto_278568 ) ) ( not ( = ?auto_278563 ?auto_278569 ) ) ( not ( = ?auto_278563 ?auto_278570 ) ) ( not ( = ?auto_278563 ?auto_278571 ) ) ( not ( = ?auto_278563 ?auto_278572 ) ) ( not ( = ?auto_278563 ?auto_278573 ) ) ( not ( = ?auto_278563 ?auto_278574 ) ) ( not ( = ?auto_278563 ?auto_278575 ) ) ( not ( = ?auto_278563 ?auto_278576 ) ) ( not ( = ?auto_278563 ?auto_278577 ) ) ( not ( = ?auto_278564 ?auto_278565 ) ) ( not ( = ?auto_278564 ?auto_278566 ) ) ( not ( = ?auto_278564 ?auto_278567 ) ) ( not ( = ?auto_278564 ?auto_278568 ) ) ( not ( = ?auto_278564 ?auto_278569 ) ) ( not ( = ?auto_278564 ?auto_278570 ) ) ( not ( = ?auto_278564 ?auto_278571 ) ) ( not ( = ?auto_278564 ?auto_278572 ) ) ( not ( = ?auto_278564 ?auto_278573 ) ) ( not ( = ?auto_278564 ?auto_278574 ) ) ( not ( = ?auto_278564 ?auto_278575 ) ) ( not ( = ?auto_278564 ?auto_278576 ) ) ( not ( = ?auto_278564 ?auto_278577 ) ) ( not ( = ?auto_278565 ?auto_278566 ) ) ( not ( = ?auto_278565 ?auto_278567 ) ) ( not ( = ?auto_278565 ?auto_278568 ) ) ( not ( = ?auto_278565 ?auto_278569 ) ) ( not ( = ?auto_278565 ?auto_278570 ) ) ( not ( = ?auto_278565 ?auto_278571 ) ) ( not ( = ?auto_278565 ?auto_278572 ) ) ( not ( = ?auto_278565 ?auto_278573 ) ) ( not ( = ?auto_278565 ?auto_278574 ) ) ( not ( = ?auto_278565 ?auto_278575 ) ) ( not ( = ?auto_278565 ?auto_278576 ) ) ( not ( = ?auto_278565 ?auto_278577 ) ) ( not ( = ?auto_278566 ?auto_278567 ) ) ( not ( = ?auto_278566 ?auto_278568 ) ) ( not ( = ?auto_278566 ?auto_278569 ) ) ( not ( = ?auto_278566 ?auto_278570 ) ) ( not ( = ?auto_278566 ?auto_278571 ) ) ( not ( = ?auto_278566 ?auto_278572 ) ) ( not ( = ?auto_278566 ?auto_278573 ) ) ( not ( = ?auto_278566 ?auto_278574 ) ) ( not ( = ?auto_278566 ?auto_278575 ) ) ( not ( = ?auto_278566 ?auto_278576 ) ) ( not ( = ?auto_278566 ?auto_278577 ) ) ( not ( = ?auto_278567 ?auto_278568 ) ) ( not ( = ?auto_278567 ?auto_278569 ) ) ( not ( = ?auto_278567 ?auto_278570 ) ) ( not ( = ?auto_278567 ?auto_278571 ) ) ( not ( = ?auto_278567 ?auto_278572 ) ) ( not ( = ?auto_278567 ?auto_278573 ) ) ( not ( = ?auto_278567 ?auto_278574 ) ) ( not ( = ?auto_278567 ?auto_278575 ) ) ( not ( = ?auto_278567 ?auto_278576 ) ) ( not ( = ?auto_278567 ?auto_278577 ) ) ( not ( = ?auto_278568 ?auto_278569 ) ) ( not ( = ?auto_278568 ?auto_278570 ) ) ( not ( = ?auto_278568 ?auto_278571 ) ) ( not ( = ?auto_278568 ?auto_278572 ) ) ( not ( = ?auto_278568 ?auto_278573 ) ) ( not ( = ?auto_278568 ?auto_278574 ) ) ( not ( = ?auto_278568 ?auto_278575 ) ) ( not ( = ?auto_278568 ?auto_278576 ) ) ( not ( = ?auto_278568 ?auto_278577 ) ) ( not ( = ?auto_278569 ?auto_278570 ) ) ( not ( = ?auto_278569 ?auto_278571 ) ) ( not ( = ?auto_278569 ?auto_278572 ) ) ( not ( = ?auto_278569 ?auto_278573 ) ) ( not ( = ?auto_278569 ?auto_278574 ) ) ( not ( = ?auto_278569 ?auto_278575 ) ) ( not ( = ?auto_278569 ?auto_278576 ) ) ( not ( = ?auto_278569 ?auto_278577 ) ) ( not ( = ?auto_278570 ?auto_278571 ) ) ( not ( = ?auto_278570 ?auto_278572 ) ) ( not ( = ?auto_278570 ?auto_278573 ) ) ( not ( = ?auto_278570 ?auto_278574 ) ) ( not ( = ?auto_278570 ?auto_278575 ) ) ( not ( = ?auto_278570 ?auto_278576 ) ) ( not ( = ?auto_278570 ?auto_278577 ) ) ( not ( = ?auto_278571 ?auto_278572 ) ) ( not ( = ?auto_278571 ?auto_278573 ) ) ( not ( = ?auto_278571 ?auto_278574 ) ) ( not ( = ?auto_278571 ?auto_278575 ) ) ( not ( = ?auto_278571 ?auto_278576 ) ) ( not ( = ?auto_278571 ?auto_278577 ) ) ( not ( = ?auto_278572 ?auto_278573 ) ) ( not ( = ?auto_278572 ?auto_278574 ) ) ( not ( = ?auto_278572 ?auto_278575 ) ) ( not ( = ?auto_278572 ?auto_278576 ) ) ( not ( = ?auto_278572 ?auto_278577 ) ) ( not ( = ?auto_278573 ?auto_278574 ) ) ( not ( = ?auto_278573 ?auto_278575 ) ) ( not ( = ?auto_278573 ?auto_278576 ) ) ( not ( = ?auto_278573 ?auto_278577 ) ) ( not ( = ?auto_278574 ?auto_278575 ) ) ( not ( = ?auto_278574 ?auto_278576 ) ) ( not ( = ?auto_278574 ?auto_278577 ) ) ( not ( = ?auto_278575 ?auto_278576 ) ) ( not ( = ?auto_278575 ?auto_278577 ) ) ( not ( = ?auto_278576 ?auto_278577 ) ) ( ON ?auto_278575 ?auto_278576 ) ( ON ?auto_278574 ?auto_278575 ) ( CLEAR ?auto_278572 ) ( ON ?auto_278573 ?auto_278574 ) ( CLEAR ?auto_278573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_278563 ?auto_278564 ?auto_278565 ?auto_278566 ?auto_278567 ?auto_278568 ?auto_278569 ?auto_278570 ?auto_278571 ?auto_278572 ?auto_278573 )
      ( MAKE-14PILE ?auto_278563 ?auto_278564 ?auto_278565 ?auto_278566 ?auto_278567 ?auto_278568 ?auto_278569 ?auto_278570 ?auto_278571 ?auto_278572 ?auto_278573 ?auto_278574 ?auto_278575 ?auto_278576 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_278592 - BLOCK
      ?auto_278593 - BLOCK
      ?auto_278594 - BLOCK
      ?auto_278595 - BLOCK
      ?auto_278596 - BLOCK
      ?auto_278597 - BLOCK
      ?auto_278598 - BLOCK
      ?auto_278599 - BLOCK
      ?auto_278600 - BLOCK
      ?auto_278601 - BLOCK
      ?auto_278602 - BLOCK
      ?auto_278603 - BLOCK
      ?auto_278604 - BLOCK
      ?auto_278605 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_278605 ) ( ON-TABLE ?auto_278592 ) ( ON ?auto_278593 ?auto_278592 ) ( ON ?auto_278594 ?auto_278593 ) ( ON ?auto_278595 ?auto_278594 ) ( ON ?auto_278596 ?auto_278595 ) ( ON ?auto_278597 ?auto_278596 ) ( ON ?auto_278598 ?auto_278597 ) ( ON ?auto_278599 ?auto_278598 ) ( ON ?auto_278600 ?auto_278599 ) ( ON ?auto_278601 ?auto_278600 ) ( not ( = ?auto_278592 ?auto_278593 ) ) ( not ( = ?auto_278592 ?auto_278594 ) ) ( not ( = ?auto_278592 ?auto_278595 ) ) ( not ( = ?auto_278592 ?auto_278596 ) ) ( not ( = ?auto_278592 ?auto_278597 ) ) ( not ( = ?auto_278592 ?auto_278598 ) ) ( not ( = ?auto_278592 ?auto_278599 ) ) ( not ( = ?auto_278592 ?auto_278600 ) ) ( not ( = ?auto_278592 ?auto_278601 ) ) ( not ( = ?auto_278592 ?auto_278602 ) ) ( not ( = ?auto_278592 ?auto_278603 ) ) ( not ( = ?auto_278592 ?auto_278604 ) ) ( not ( = ?auto_278592 ?auto_278605 ) ) ( not ( = ?auto_278593 ?auto_278594 ) ) ( not ( = ?auto_278593 ?auto_278595 ) ) ( not ( = ?auto_278593 ?auto_278596 ) ) ( not ( = ?auto_278593 ?auto_278597 ) ) ( not ( = ?auto_278593 ?auto_278598 ) ) ( not ( = ?auto_278593 ?auto_278599 ) ) ( not ( = ?auto_278593 ?auto_278600 ) ) ( not ( = ?auto_278593 ?auto_278601 ) ) ( not ( = ?auto_278593 ?auto_278602 ) ) ( not ( = ?auto_278593 ?auto_278603 ) ) ( not ( = ?auto_278593 ?auto_278604 ) ) ( not ( = ?auto_278593 ?auto_278605 ) ) ( not ( = ?auto_278594 ?auto_278595 ) ) ( not ( = ?auto_278594 ?auto_278596 ) ) ( not ( = ?auto_278594 ?auto_278597 ) ) ( not ( = ?auto_278594 ?auto_278598 ) ) ( not ( = ?auto_278594 ?auto_278599 ) ) ( not ( = ?auto_278594 ?auto_278600 ) ) ( not ( = ?auto_278594 ?auto_278601 ) ) ( not ( = ?auto_278594 ?auto_278602 ) ) ( not ( = ?auto_278594 ?auto_278603 ) ) ( not ( = ?auto_278594 ?auto_278604 ) ) ( not ( = ?auto_278594 ?auto_278605 ) ) ( not ( = ?auto_278595 ?auto_278596 ) ) ( not ( = ?auto_278595 ?auto_278597 ) ) ( not ( = ?auto_278595 ?auto_278598 ) ) ( not ( = ?auto_278595 ?auto_278599 ) ) ( not ( = ?auto_278595 ?auto_278600 ) ) ( not ( = ?auto_278595 ?auto_278601 ) ) ( not ( = ?auto_278595 ?auto_278602 ) ) ( not ( = ?auto_278595 ?auto_278603 ) ) ( not ( = ?auto_278595 ?auto_278604 ) ) ( not ( = ?auto_278595 ?auto_278605 ) ) ( not ( = ?auto_278596 ?auto_278597 ) ) ( not ( = ?auto_278596 ?auto_278598 ) ) ( not ( = ?auto_278596 ?auto_278599 ) ) ( not ( = ?auto_278596 ?auto_278600 ) ) ( not ( = ?auto_278596 ?auto_278601 ) ) ( not ( = ?auto_278596 ?auto_278602 ) ) ( not ( = ?auto_278596 ?auto_278603 ) ) ( not ( = ?auto_278596 ?auto_278604 ) ) ( not ( = ?auto_278596 ?auto_278605 ) ) ( not ( = ?auto_278597 ?auto_278598 ) ) ( not ( = ?auto_278597 ?auto_278599 ) ) ( not ( = ?auto_278597 ?auto_278600 ) ) ( not ( = ?auto_278597 ?auto_278601 ) ) ( not ( = ?auto_278597 ?auto_278602 ) ) ( not ( = ?auto_278597 ?auto_278603 ) ) ( not ( = ?auto_278597 ?auto_278604 ) ) ( not ( = ?auto_278597 ?auto_278605 ) ) ( not ( = ?auto_278598 ?auto_278599 ) ) ( not ( = ?auto_278598 ?auto_278600 ) ) ( not ( = ?auto_278598 ?auto_278601 ) ) ( not ( = ?auto_278598 ?auto_278602 ) ) ( not ( = ?auto_278598 ?auto_278603 ) ) ( not ( = ?auto_278598 ?auto_278604 ) ) ( not ( = ?auto_278598 ?auto_278605 ) ) ( not ( = ?auto_278599 ?auto_278600 ) ) ( not ( = ?auto_278599 ?auto_278601 ) ) ( not ( = ?auto_278599 ?auto_278602 ) ) ( not ( = ?auto_278599 ?auto_278603 ) ) ( not ( = ?auto_278599 ?auto_278604 ) ) ( not ( = ?auto_278599 ?auto_278605 ) ) ( not ( = ?auto_278600 ?auto_278601 ) ) ( not ( = ?auto_278600 ?auto_278602 ) ) ( not ( = ?auto_278600 ?auto_278603 ) ) ( not ( = ?auto_278600 ?auto_278604 ) ) ( not ( = ?auto_278600 ?auto_278605 ) ) ( not ( = ?auto_278601 ?auto_278602 ) ) ( not ( = ?auto_278601 ?auto_278603 ) ) ( not ( = ?auto_278601 ?auto_278604 ) ) ( not ( = ?auto_278601 ?auto_278605 ) ) ( not ( = ?auto_278602 ?auto_278603 ) ) ( not ( = ?auto_278602 ?auto_278604 ) ) ( not ( = ?auto_278602 ?auto_278605 ) ) ( not ( = ?auto_278603 ?auto_278604 ) ) ( not ( = ?auto_278603 ?auto_278605 ) ) ( not ( = ?auto_278604 ?auto_278605 ) ) ( ON ?auto_278604 ?auto_278605 ) ( ON ?auto_278603 ?auto_278604 ) ( CLEAR ?auto_278601 ) ( ON ?auto_278602 ?auto_278603 ) ( CLEAR ?auto_278602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_278592 ?auto_278593 ?auto_278594 ?auto_278595 ?auto_278596 ?auto_278597 ?auto_278598 ?auto_278599 ?auto_278600 ?auto_278601 ?auto_278602 )
      ( MAKE-14PILE ?auto_278592 ?auto_278593 ?auto_278594 ?auto_278595 ?auto_278596 ?auto_278597 ?auto_278598 ?auto_278599 ?auto_278600 ?auto_278601 ?auto_278602 ?auto_278603 ?auto_278604 ?auto_278605 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_278620 - BLOCK
      ?auto_278621 - BLOCK
      ?auto_278622 - BLOCK
      ?auto_278623 - BLOCK
      ?auto_278624 - BLOCK
      ?auto_278625 - BLOCK
      ?auto_278626 - BLOCK
      ?auto_278627 - BLOCK
      ?auto_278628 - BLOCK
      ?auto_278629 - BLOCK
      ?auto_278630 - BLOCK
      ?auto_278631 - BLOCK
      ?auto_278632 - BLOCK
      ?auto_278633 - BLOCK
    )
    :vars
    (
      ?auto_278634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_278633 ?auto_278634 ) ( ON-TABLE ?auto_278620 ) ( ON ?auto_278621 ?auto_278620 ) ( ON ?auto_278622 ?auto_278621 ) ( ON ?auto_278623 ?auto_278622 ) ( ON ?auto_278624 ?auto_278623 ) ( ON ?auto_278625 ?auto_278624 ) ( ON ?auto_278626 ?auto_278625 ) ( ON ?auto_278627 ?auto_278626 ) ( ON ?auto_278628 ?auto_278627 ) ( not ( = ?auto_278620 ?auto_278621 ) ) ( not ( = ?auto_278620 ?auto_278622 ) ) ( not ( = ?auto_278620 ?auto_278623 ) ) ( not ( = ?auto_278620 ?auto_278624 ) ) ( not ( = ?auto_278620 ?auto_278625 ) ) ( not ( = ?auto_278620 ?auto_278626 ) ) ( not ( = ?auto_278620 ?auto_278627 ) ) ( not ( = ?auto_278620 ?auto_278628 ) ) ( not ( = ?auto_278620 ?auto_278629 ) ) ( not ( = ?auto_278620 ?auto_278630 ) ) ( not ( = ?auto_278620 ?auto_278631 ) ) ( not ( = ?auto_278620 ?auto_278632 ) ) ( not ( = ?auto_278620 ?auto_278633 ) ) ( not ( = ?auto_278620 ?auto_278634 ) ) ( not ( = ?auto_278621 ?auto_278622 ) ) ( not ( = ?auto_278621 ?auto_278623 ) ) ( not ( = ?auto_278621 ?auto_278624 ) ) ( not ( = ?auto_278621 ?auto_278625 ) ) ( not ( = ?auto_278621 ?auto_278626 ) ) ( not ( = ?auto_278621 ?auto_278627 ) ) ( not ( = ?auto_278621 ?auto_278628 ) ) ( not ( = ?auto_278621 ?auto_278629 ) ) ( not ( = ?auto_278621 ?auto_278630 ) ) ( not ( = ?auto_278621 ?auto_278631 ) ) ( not ( = ?auto_278621 ?auto_278632 ) ) ( not ( = ?auto_278621 ?auto_278633 ) ) ( not ( = ?auto_278621 ?auto_278634 ) ) ( not ( = ?auto_278622 ?auto_278623 ) ) ( not ( = ?auto_278622 ?auto_278624 ) ) ( not ( = ?auto_278622 ?auto_278625 ) ) ( not ( = ?auto_278622 ?auto_278626 ) ) ( not ( = ?auto_278622 ?auto_278627 ) ) ( not ( = ?auto_278622 ?auto_278628 ) ) ( not ( = ?auto_278622 ?auto_278629 ) ) ( not ( = ?auto_278622 ?auto_278630 ) ) ( not ( = ?auto_278622 ?auto_278631 ) ) ( not ( = ?auto_278622 ?auto_278632 ) ) ( not ( = ?auto_278622 ?auto_278633 ) ) ( not ( = ?auto_278622 ?auto_278634 ) ) ( not ( = ?auto_278623 ?auto_278624 ) ) ( not ( = ?auto_278623 ?auto_278625 ) ) ( not ( = ?auto_278623 ?auto_278626 ) ) ( not ( = ?auto_278623 ?auto_278627 ) ) ( not ( = ?auto_278623 ?auto_278628 ) ) ( not ( = ?auto_278623 ?auto_278629 ) ) ( not ( = ?auto_278623 ?auto_278630 ) ) ( not ( = ?auto_278623 ?auto_278631 ) ) ( not ( = ?auto_278623 ?auto_278632 ) ) ( not ( = ?auto_278623 ?auto_278633 ) ) ( not ( = ?auto_278623 ?auto_278634 ) ) ( not ( = ?auto_278624 ?auto_278625 ) ) ( not ( = ?auto_278624 ?auto_278626 ) ) ( not ( = ?auto_278624 ?auto_278627 ) ) ( not ( = ?auto_278624 ?auto_278628 ) ) ( not ( = ?auto_278624 ?auto_278629 ) ) ( not ( = ?auto_278624 ?auto_278630 ) ) ( not ( = ?auto_278624 ?auto_278631 ) ) ( not ( = ?auto_278624 ?auto_278632 ) ) ( not ( = ?auto_278624 ?auto_278633 ) ) ( not ( = ?auto_278624 ?auto_278634 ) ) ( not ( = ?auto_278625 ?auto_278626 ) ) ( not ( = ?auto_278625 ?auto_278627 ) ) ( not ( = ?auto_278625 ?auto_278628 ) ) ( not ( = ?auto_278625 ?auto_278629 ) ) ( not ( = ?auto_278625 ?auto_278630 ) ) ( not ( = ?auto_278625 ?auto_278631 ) ) ( not ( = ?auto_278625 ?auto_278632 ) ) ( not ( = ?auto_278625 ?auto_278633 ) ) ( not ( = ?auto_278625 ?auto_278634 ) ) ( not ( = ?auto_278626 ?auto_278627 ) ) ( not ( = ?auto_278626 ?auto_278628 ) ) ( not ( = ?auto_278626 ?auto_278629 ) ) ( not ( = ?auto_278626 ?auto_278630 ) ) ( not ( = ?auto_278626 ?auto_278631 ) ) ( not ( = ?auto_278626 ?auto_278632 ) ) ( not ( = ?auto_278626 ?auto_278633 ) ) ( not ( = ?auto_278626 ?auto_278634 ) ) ( not ( = ?auto_278627 ?auto_278628 ) ) ( not ( = ?auto_278627 ?auto_278629 ) ) ( not ( = ?auto_278627 ?auto_278630 ) ) ( not ( = ?auto_278627 ?auto_278631 ) ) ( not ( = ?auto_278627 ?auto_278632 ) ) ( not ( = ?auto_278627 ?auto_278633 ) ) ( not ( = ?auto_278627 ?auto_278634 ) ) ( not ( = ?auto_278628 ?auto_278629 ) ) ( not ( = ?auto_278628 ?auto_278630 ) ) ( not ( = ?auto_278628 ?auto_278631 ) ) ( not ( = ?auto_278628 ?auto_278632 ) ) ( not ( = ?auto_278628 ?auto_278633 ) ) ( not ( = ?auto_278628 ?auto_278634 ) ) ( not ( = ?auto_278629 ?auto_278630 ) ) ( not ( = ?auto_278629 ?auto_278631 ) ) ( not ( = ?auto_278629 ?auto_278632 ) ) ( not ( = ?auto_278629 ?auto_278633 ) ) ( not ( = ?auto_278629 ?auto_278634 ) ) ( not ( = ?auto_278630 ?auto_278631 ) ) ( not ( = ?auto_278630 ?auto_278632 ) ) ( not ( = ?auto_278630 ?auto_278633 ) ) ( not ( = ?auto_278630 ?auto_278634 ) ) ( not ( = ?auto_278631 ?auto_278632 ) ) ( not ( = ?auto_278631 ?auto_278633 ) ) ( not ( = ?auto_278631 ?auto_278634 ) ) ( not ( = ?auto_278632 ?auto_278633 ) ) ( not ( = ?auto_278632 ?auto_278634 ) ) ( not ( = ?auto_278633 ?auto_278634 ) ) ( ON ?auto_278632 ?auto_278633 ) ( ON ?auto_278631 ?auto_278632 ) ( ON ?auto_278630 ?auto_278631 ) ( CLEAR ?auto_278628 ) ( ON ?auto_278629 ?auto_278630 ) ( CLEAR ?auto_278629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_278620 ?auto_278621 ?auto_278622 ?auto_278623 ?auto_278624 ?auto_278625 ?auto_278626 ?auto_278627 ?auto_278628 ?auto_278629 )
      ( MAKE-14PILE ?auto_278620 ?auto_278621 ?auto_278622 ?auto_278623 ?auto_278624 ?auto_278625 ?auto_278626 ?auto_278627 ?auto_278628 ?auto_278629 ?auto_278630 ?auto_278631 ?auto_278632 ?auto_278633 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_278649 - BLOCK
      ?auto_278650 - BLOCK
      ?auto_278651 - BLOCK
      ?auto_278652 - BLOCK
      ?auto_278653 - BLOCK
      ?auto_278654 - BLOCK
      ?auto_278655 - BLOCK
      ?auto_278656 - BLOCK
      ?auto_278657 - BLOCK
      ?auto_278658 - BLOCK
      ?auto_278659 - BLOCK
      ?auto_278660 - BLOCK
      ?auto_278661 - BLOCK
      ?auto_278662 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_278662 ) ( ON-TABLE ?auto_278649 ) ( ON ?auto_278650 ?auto_278649 ) ( ON ?auto_278651 ?auto_278650 ) ( ON ?auto_278652 ?auto_278651 ) ( ON ?auto_278653 ?auto_278652 ) ( ON ?auto_278654 ?auto_278653 ) ( ON ?auto_278655 ?auto_278654 ) ( ON ?auto_278656 ?auto_278655 ) ( ON ?auto_278657 ?auto_278656 ) ( not ( = ?auto_278649 ?auto_278650 ) ) ( not ( = ?auto_278649 ?auto_278651 ) ) ( not ( = ?auto_278649 ?auto_278652 ) ) ( not ( = ?auto_278649 ?auto_278653 ) ) ( not ( = ?auto_278649 ?auto_278654 ) ) ( not ( = ?auto_278649 ?auto_278655 ) ) ( not ( = ?auto_278649 ?auto_278656 ) ) ( not ( = ?auto_278649 ?auto_278657 ) ) ( not ( = ?auto_278649 ?auto_278658 ) ) ( not ( = ?auto_278649 ?auto_278659 ) ) ( not ( = ?auto_278649 ?auto_278660 ) ) ( not ( = ?auto_278649 ?auto_278661 ) ) ( not ( = ?auto_278649 ?auto_278662 ) ) ( not ( = ?auto_278650 ?auto_278651 ) ) ( not ( = ?auto_278650 ?auto_278652 ) ) ( not ( = ?auto_278650 ?auto_278653 ) ) ( not ( = ?auto_278650 ?auto_278654 ) ) ( not ( = ?auto_278650 ?auto_278655 ) ) ( not ( = ?auto_278650 ?auto_278656 ) ) ( not ( = ?auto_278650 ?auto_278657 ) ) ( not ( = ?auto_278650 ?auto_278658 ) ) ( not ( = ?auto_278650 ?auto_278659 ) ) ( not ( = ?auto_278650 ?auto_278660 ) ) ( not ( = ?auto_278650 ?auto_278661 ) ) ( not ( = ?auto_278650 ?auto_278662 ) ) ( not ( = ?auto_278651 ?auto_278652 ) ) ( not ( = ?auto_278651 ?auto_278653 ) ) ( not ( = ?auto_278651 ?auto_278654 ) ) ( not ( = ?auto_278651 ?auto_278655 ) ) ( not ( = ?auto_278651 ?auto_278656 ) ) ( not ( = ?auto_278651 ?auto_278657 ) ) ( not ( = ?auto_278651 ?auto_278658 ) ) ( not ( = ?auto_278651 ?auto_278659 ) ) ( not ( = ?auto_278651 ?auto_278660 ) ) ( not ( = ?auto_278651 ?auto_278661 ) ) ( not ( = ?auto_278651 ?auto_278662 ) ) ( not ( = ?auto_278652 ?auto_278653 ) ) ( not ( = ?auto_278652 ?auto_278654 ) ) ( not ( = ?auto_278652 ?auto_278655 ) ) ( not ( = ?auto_278652 ?auto_278656 ) ) ( not ( = ?auto_278652 ?auto_278657 ) ) ( not ( = ?auto_278652 ?auto_278658 ) ) ( not ( = ?auto_278652 ?auto_278659 ) ) ( not ( = ?auto_278652 ?auto_278660 ) ) ( not ( = ?auto_278652 ?auto_278661 ) ) ( not ( = ?auto_278652 ?auto_278662 ) ) ( not ( = ?auto_278653 ?auto_278654 ) ) ( not ( = ?auto_278653 ?auto_278655 ) ) ( not ( = ?auto_278653 ?auto_278656 ) ) ( not ( = ?auto_278653 ?auto_278657 ) ) ( not ( = ?auto_278653 ?auto_278658 ) ) ( not ( = ?auto_278653 ?auto_278659 ) ) ( not ( = ?auto_278653 ?auto_278660 ) ) ( not ( = ?auto_278653 ?auto_278661 ) ) ( not ( = ?auto_278653 ?auto_278662 ) ) ( not ( = ?auto_278654 ?auto_278655 ) ) ( not ( = ?auto_278654 ?auto_278656 ) ) ( not ( = ?auto_278654 ?auto_278657 ) ) ( not ( = ?auto_278654 ?auto_278658 ) ) ( not ( = ?auto_278654 ?auto_278659 ) ) ( not ( = ?auto_278654 ?auto_278660 ) ) ( not ( = ?auto_278654 ?auto_278661 ) ) ( not ( = ?auto_278654 ?auto_278662 ) ) ( not ( = ?auto_278655 ?auto_278656 ) ) ( not ( = ?auto_278655 ?auto_278657 ) ) ( not ( = ?auto_278655 ?auto_278658 ) ) ( not ( = ?auto_278655 ?auto_278659 ) ) ( not ( = ?auto_278655 ?auto_278660 ) ) ( not ( = ?auto_278655 ?auto_278661 ) ) ( not ( = ?auto_278655 ?auto_278662 ) ) ( not ( = ?auto_278656 ?auto_278657 ) ) ( not ( = ?auto_278656 ?auto_278658 ) ) ( not ( = ?auto_278656 ?auto_278659 ) ) ( not ( = ?auto_278656 ?auto_278660 ) ) ( not ( = ?auto_278656 ?auto_278661 ) ) ( not ( = ?auto_278656 ?auto_278662 ) ) ( not ( = ?auto_278657 ?auto_278658 ) ) ( not ( = ?auto_278657 ?auto_278659 ) ) ( not ( = ?auto_278657 ?auto_278660 ) ) ( not ( = ?auto_278657 ?auto_278661 ) ) ( not ( = ?auto_278657 ?auto_278662 ) ) ( not ( = ?auto_278658 ?auto_278659 ) ) ( not ( = ?auto_278658 ?auto_278660 ) ) ( not ( = ?auto_278658 ?auto_278661 ) ) ( not ( = ?auto_278658 ?auto_278662 ) ) ( not ( = ?auto_278659 ?auto_278660 ) ) ( not ( = ?auto_278659 ?auto_278661 ) ) ( not ( = ?auto_278659 ?auto_278662 ) ) ( not ( = ?auto_278660 ?auto_278661 ) ) ( not ( = ?auto_278660 ?auto_278662 ) ) ( not ( = ?auto_278661 ?auto_278662 ) ) ( ON ?auto_278661 ?auto_278662 ) ( ON ?auto_278660 ?auto_278661 ) ( ON ?auto_278659 ?auto_278660 ) ( CLEAR ?auto_278657 ) ( ON ?auto_278658 ?auto_278659 ) ( CLEAR ?auto_278658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_278649 ?auto_278650 ?auto_278651 ?auto_278652 ?auto_278653 ?auto_278654 ?auto_278655 ?auto_278656 ?auto_278657 ?auto_278658 )
      ( MAKE-14PILE ?auto_278649 ?auto_278650 ?auto_278651 ?auto_278652 ?auto_278653 ?auto_278654 ?auto_278655 ?auto_278656 ?auto_278657 ?auto_278658 ?auto_278659 ?auto_278660 ?auto_278661 ?auto_278662 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_278677 - BLOCK
      ?auto_278678 - BLOCK
      ?auto_278679 - BLOCK
      ?auto_278680 - BLOCK
      ?auto_278681 - BLOCK
      ?auto_278682 - BLOCK
      ?auto_278683 - BLOCK
      ?auto_278684 - BLOCK
      ?auto_278685 - BLOCK
      ?auto_278686 - BLOCK
      ?auto_278687 - BLOCK
      ?auto_278688 - BLOCK
      ?auto_278689 - BLOCK
      ?auto_278690 - BLOCK
    )
    :vars
    (
      ?auto_278691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_278690 ?auto_278691 ) ( ON-TABLE ?auto_278677 ) ( ON ?auto_278678 ?auto_278677 ) ( ON ?auto_278679 ?auto_278678 ) ( ON ?auto_278680 ?auto_278679 ) ( ON ?auto_278681 ?auto_278680 ) ( ON ?auto_278682 ?auto_278681 ) ( ON ?auto_278683 ?auto_278682 ) ( ON ?auto_278684 ?auto_278683 ) ( not ( = ?auto_278677 ?auto_278678 ) ) ( not ( = ?auto_278677 ?auto_278679 ) ) ( not ( = ?auto_278677 ?auto_278680 ) ) ( not ( = ?auto_278677 ?auto_278681 ) ) ( not ( = ?auto_278677 ?auto_278682 ) ) ( not ( = ?auto_278677 ?auto_278683 ) ) ( not ( = ?auto_278677 ?auto_278684 ) ) ( not ( = ?auto_278677 ?auto_278685 ) ) ( not ( = ?auto_278677 ?auto_278686 ) ) ( not ( = ?auto_278677 ?auto_278687 ) ) ( not ( = ?auto_278677 ?auto_278688 ) ) ( not ( = ?auto_278677 ?auto_278689 ) ) ( not ( = ?auto_278677 ?auto_278690 ) ) ( not ( = ?auto_278677 ?auto_278691 ) ) ( not ( = ?auto_278678 ?auto_278679 ) ) ( not ( = ?auto_278678 ?auto_278680 ) ) ( not ( = ?auto_278678 ?auto_278681 ) ) ( not ( = ?auto_278678 ?auto_278682 ) ) ( not ( = ?auto_278678 ?auto_278683 ) ) ( not ( = ?auto_278678 ?auto_278684 ) ) ( not ( = ?auto_278678 ?auto_278685 ) ) ( not ( = ?auto_278678 ?auto_278686 ) ) ( not ( = ?auto_278678 ?auto_278687 ) ) ( not ( = ?auto_278678 ?auto_278688 ) ) ( not ( = ?auto_278678 ?auto_278689 ) ) ( not ( = ?auto_278678 ?auto_278690 ) ) ( not ( = ?auto_278678 ?auto_278691 ) ) ( not ( = ?auto_278679 ?auto_278680 ) ) ( not ( = ?auto_278679 ?auto_278681 ) ) ( not ( = ?auto_278679 ?auto_278682 ) ) ( not ( = ?auto_278679 ?auto_278683 ) ) ( not ( = ?auto_278679 ?auto_278684 ) ) ( not ( = ?auto_278679 ?auto_278685 ) ) ( not ( = ?auto_278679 ?auto_278686 ) ) ( not ( = ?auto_278679 ?auto_278687 ) ) ( not ( = ?auto_278679 ?auto_278688 ) ) ( not ( = ?auto_278679 ?auto_278689 ) ) ( not ( = ?auto_278679 ?auto_278690 ) ) ( not ( = ?auto_278679 ?auto_278691 ) ) ( not ( = ?auto_278680 ?auto_278681 ) ) ( not ( = ?auto_278680 ?auto_278682 ) ) ( not ( = ?auto_278680 ?auto_278683 ) ) ( not ( = ?auto_278680 ?auto_278684 ) ) ( not ( = ?auto_278680 ?auto_278685 ) ) ( not ( = ?auto_278680 ?auto_278686 ) ) ( not ( = ?auto_278680 ?auto_278687 ) ) ( not ( = ?auto_278680 ?auto_278688 ) ) ( not ( = ?auto_278680 ?auto_278689 ) ) ( not ( = ?auto_278680 ?auto_278690 ) ) ( not ( = ?auto_278680 ?auto_278691 ) ) ( not ( = ?auto_278681 ?auto_278682 ) ) ( not ( = ?auto_278681 ?auto_278683 ) ) ( not ( = ?auto_278681 ?auto_278684 ) ) ( not ( = ?auto_278681 ?auto_278685 ) ) ( not ( = ?auto_278681 ?auto_278686 ) ) ( not ( = ?auto_278681 ?auto_278687 ) ) ( not ( = ?auto_278681 ?auto_278688 ) ) ( not ( = ?auto_278681 ?auto_278689 ) ) ( not ( = ?auto_278681 ?auto_278690 ) ) ( not ( = ?auto_278681 ?auto_278691 ) ) ( not ( = ?auto_278682 ?auto_278683 ) ) ( not ( = ?auto_278682 ?auto_278684 ) ) ( not ( = ?auto_278682 ?auto_278685 ) ) ( not ( = ?auto_278682 ?auto_278686 ) ) ( not ( = ?auto_278682 ?auto_278687 ) ) ( not ( = ?auto_278682 ?auto_278688 ) ) ( not ( = ?auto_278682 ?auto_278689 ) ) ( not ( = ?auto_278682 ?auto_278690 ) ) ( not ( = ?auto_278682 ?auto_278691 ) ) ( not ( = ?auto_278683 ?auto_278684 ) ) ( not ( = ?auto_278683 ?auto_278685 ) ) ( not ( = ?auto_278683 ?auto_278686 ) ) ( not ( = ?auto_278683 ?auto_278687 ) ) ( not ( = ?auto_278683 ?auto_278688 ) ) ( not ( = ?auto_278683 ?auto_278689 ) ) ( not ( = ?auto_278683 ?auto_278690 ) ) ( not ( = ?auto_278683 ?auto_278691 ) ) ( not ( = ?auto_278684 ?auto_278685 ) ) ( not ( = ?auto_278684 ?auto_278686 ) ) ( not ( = ?auto_278684 ?auto_278687 ) ) ( not ( = ?auto_278684 ?auto_278688 ) ) ( not ( = ?auto_278684 ?auto_278689 ) ) ( not ( = ?auto_278684 ?auto_278690 ) ) ( not ( = ?auto_278684 ?auto_278691 ) ) ( not ( = ?auto_278685 ?auto_278686 ) ) ( not ( = ?auto_278685 ?auto_278687 ) ) ( not ( = ?auto_278685 ?auto_278688 ) ) ( not ( = ?auto_278685 ?auto_278689 ) ) ( not ( = ?auto_278685 ?auto_278690 ) ) ( not ( = ?auto_278685 ?auto_278691 ) ) ( not ( = ?auto_278686 ?auto_278687 ) ) ( not ( = ?auto_278686 ?auto_278688 ) ) ( not ( = ?auto_278686 ?auto_278689 ) ) ( not ( = ?auto_278686 ?auto_278690 ) ) ( not ( = ?auto_278686 ?auto_278691 ) ) ( not ( = ?auto_278687 ?auto_278688 ) ) ( not ( = ?auto_278687 ?auto_278689 ) ) ( not ( = ?auto_278687 ?auto_278690 ) ) ( not ( = ?auto_278687 ?auto_278691 ) ) ( not ( = ?auto_278688 ?auto_278689 ) ) ( not ( = ?auto_278688 ?auto_278690 ) ) ( not ( = ?auto_278688 ?auto_278691 ) ) ( not ( = ?auto_278689 ?auto_278690 ) ) ( not ( = ?auto_278689 ?auto_278691 ) ) ( not ( = ?auto_278690 ?auto_278691 ) ) ( ON ?auto_278689 ?auto_278690 ) ( ON ?auto_278688 ?auto_278689 ) ( ON ?auto_278687 ?auto_278688 ) ( ON ?auto_278686 ?auto_278687 ) ( CLEAR ?auto_278684 ) ( ON ?auto_278685 ?auto_278686 ) ( CLEAR ?auto_278685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_278677 ?auto_278678 ?auto_278679 ?auto_278680 ?auto_278681 ?auto_278682 ?auto_278683 ?auto_278684 ?auto_278685 )
      ( MAKE-14PILE ?auto_278677 ?auto_278678 ?auto_278679 ?auto_278680 ?auto_278681 ?auto_278682 ?auto_278683 ?auto_278684 ?auto_278685 ?auto_278686 ?auto_278687 ?auto_278688 ?auto_278689 ?auto_278690 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_278706 - BLOCK
      ?auto_278707 - BLOCK
      ?auto_278708 - BLOCK
      ?auto_278709 - BLOCK
      ?auto_278710 - BLOCK
      ?auto_278711 - BLOCK
      ?auto_278712 - BLOCK
      ?auto_278713 - BLOCK
      ?auto_278714 - BLOCK
      ?auto_278715 - BLOCK
      ?auto_278716 - BLOCK
      ?auto_278717 - BLOCK
      ?auto_278718 - BLOCK
      ?auto_278719 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_278719 ) ( ON-TABLE ?auto_278706 ) ( ON ?auto_278707 ?auto_278706 ) ( ON ?auto_278708 ?auto_278707 ) ( ON ?auto_278709 ?auto_278708 ) ( ON ?auto_278710 ?auto_278709 ) ( ON ?auto_278711 ?auto_278710 ) ( ON ?auto_278712 ?auto_278711 ) ( ON ?auto_278713 ?auto_278712 ) ( not ( = ?auto_278706 ?auto_278707 ) ) ( not ( = ?auto_278706 ?auto_278708 ) ) ( not ( = ?auto_278706 ?auto_278709 ) ) ( not ( = ?auto_278706 ?auto_278710 ) ) ( not ( = ?auto_278706 ?auto_278711 ) ) ( not ( = ?auto_278706 ?auto_278712 ) ) ( not ( = ?auto_278706 ?auto_278713 ) ) ( not ( = ?auto_278706 ?auto_278714 ) ) ( not ( = ?auto_278706 ?auto_278715 ) ) ( not ( = ?auto_278706 ?auto_278716 ) ) ( not ( = ?auto_278706 ?auto_278717 ) ) ( not ( = ?auto_278706 ?auto_278718 ) ) ( not ( = ?auto_278706 ?auto_278719 ) ) ( not ( = ?auto_278707 ?auto_278708 ) ) ( not ( = ?auto_278707 ?auto_278709 ) ) ( not ( = ?auto_278707 ?auto_278710 ) ) ( not ( = ?auto_278707 ?auto_278711 ) ) ( not ( = ?auto_278707 ?auto_278712 ) ) ( not ( = ?auto_278707 ?auto_278713 ) ) ( not ( = ?auto_278707 ?auto_278714 ) ) ( not ( = ?auto_278707 ?auto_278715 ) ) ( not ( = ?auto_278707 ?auto_278716 ) ) ( not ( = ?auto_278707 ?auto_278717 ) ) ( not ( = ?auto_278707 ?auto_278718 ) ) ( not ( = ?auto_278707 ?auto_278719 ) ) ( not ( = ?auto_278708 ?auto_278709 ) ) ( not ( = ?auto_278708 ?auto_278710 ) ) ( not ( = ?auto_278708 ?auto_278711 ) ) ( not ( = ?auto_278708 ?auto_278712 ) ) ( not ( = ?auto_278708 ?auto_278713 ) ) ( not ( = ?auto_278708 ?auto_278714 ) ) ( not ( = ?auto_278708 ?auto_278715 ) ) ( not ( = ?auto_278708 ?auto_278716 ) ) ( not ( = ?auto_278708 ?auto_278717 ) ) ( not ( = ?auto_278708 ?auto_278718 ) ) ( not ( = ?auto_278708 ?auto_278719 ) ) ( not ( = ?auto_278709 ?auto_278710 ) ) ( not ( = ?auto_278709 ?auto_278711 ) ) ( not ( = ?auto_278709 ?auto_278712 ) ) ( not ( = ?auto_278709 ?auto_278713 ) ) ( not ( = ?auto_278709 ?auto_278714 ) ) ( not ( = ?auto_278709 ?auto_278715 ) ) ( not ( = ?auto_278709 ?auto_278716 ) ) ( not ( = ?auto_278709 ?auto_278717 ) ) ( not ( = ?auto_278709 ?auto_278718 ) ) ( not ( = ?auto_278709 ?auto_278719 ) ) ( not ( = ?auto_278710 ?auto_278711 ) ) ( not ( = ?auto_278710 ?auto_278712 ) ) ( not ( = ?auto_278710 ?auto_278713 ) ) ( not ( = ?auto_278710 ?auto_278714 ) ) ( not ( = ?auto_278710 ?auto_278715 ) ) ( not ( = ?auto_278710 ?auto_278716 ) ) ( not ( = ?auto_278710 ?auto_278717 ) ) ( not ( = ?auto_278710 ?auto_278718 ) ) ( not ( = ?auto_278710 ?auto_278719 ) ) ( not ( = ?auto_278711 ?auto_278712 ) ) ( not ( = ?auto_278711 ?auto_278713 ) ) ( not ( = ?auto_278711 ?auto_278714 ) ) ( not ( = ?auto_278711 ?auto_278715 ) ) ( not ( = ?auto_278711 ?auto_278716 ) ) ( not ( = ?auto_278711 ?auto_278717 ) ) ( not ( = ?auto_278711 ?auto_278718 ) ) ( not ( = ?auto_278711 ?auto_278719 ) ) ( not ( = ?auto_278712 ?auto_278713 ) ) ( not ( = ?auto_278712 ?auto_278714 ) ) ( not ( = ?auto_278712 ?auto_278715 ) ) ( not ( = ?auto_278712 ?auto_278716 ) ) ( not ( = ?auto_278712 ?auto_278717 ) ) ( not ( = ?auto_278712 ?auto_278718 ) ) ( not ( = ?auto_278712 ?auto_278719 ) ) ( not ( = ?auto_278713 ?auto_278714 ) ) ( not ( = ?auto_278713 ?auto_278715 ) ) ( not ( = ?auto_278713 ?auto_278716 ) ) ( not ( = ?auto_278713 ?auto_278717 ) ) ( not ( = ?auto_278713 ?auto_278718 ) ) ( not ( = ?auto_278713 ?auto_278719 ) ) ( not ( = ?auto_278714 ?auto_278715 ) ) ( not ( = ?auto_278714 ?auto_278716 ) ) ( not ( = ?auto_278714 ?auto_278717 ) ) ( not ( = ?auto_278714 ?auto_278718 ) ) ( not ( = ?auto_278714 ?auto_278719 ) ) ( not ( = ?auto_278715 ?auto_278716 ) ) ( not ( = ?auto_278715 ?auto_278717 ) ) ( not ( = ?auto_278715 ?auto_278718 ) ) ( not ( = ?auto_278715 ?auto_278719 ) ) ( not ( = ?auto_278716 ?auto_278717 ) ) ( not ( = ?auto_278716 ?auto_278718 ) ) ( not ( = ?auto_278716 ?auto_278719 ) ) ( not ( = ?auto_278717 ?auto_278718 ) ) ( not ( = ?auto_278717 ?auto_278719 ) ) ( not ( = ?auto_278718 ?auto_278719 ) ) ( ON ?auto_278718 ?auto_278719 ) ( ON ?auto_278717 ?auto_278718 ) ( ON ?auto_278716 ?auto_278717 ) ( ON ?auto_278715 ?auto_278716 ) ( CLEAR ?auto_278713 ) ( ON ?auto_278714 ?auto_278715 ) ( CLEAR ?auto_278714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_278706 ?auto_278707 ?auto_278708 ?auto_278709 ?auto_278710 ?auto_278711 ?auto_278712 ?auto_278713 ?auto_278714 )
      ( MAKE-14PILE ?auto_278706 ?auto_278707 ?auto_278708 ?auto_278709 ?auto_278710 ?auto_278711 ?auto_278712 ?auto_278713 ?auto_278714 ?auto_278715 ?auto_278716 ?auto_278717 ?auto_278718 ?auto_278719 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_278734 - BLOCK
      ?auto_278735 - BLOCK
      ?auto_278736 - BLOCK
      ?auto_278737 - BLOCK
      ?auto_278738 - BLOCK
      ?auto_278739 - BLOCK
      ?auto_278740 - BLOCK
      ?auto_278741 - BLOCK
      ?auto_278742 - BLOCK
      ?auto_278743 - BLOCK
      ?auto_278744 - BLOCK
      ?auto_278745 - BLOCK
      ?auto_278746 - BLOCK
      ?auto_278747 - BLOCK
    )
    :vars
    (
      ?auto_278748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_278747 ?auto_278748 ) ( ON-TABLE ?auto_278734 ) ( ON ?auto_278735 ?auto_278734 ) ( ON ?auto_278736 ?auto_278735 ) ( ON ?auto_278737 ?auto_278736 ) ( ON ?auto_278738 ?auto_278737 ) ( ON ?auto_278739 ?auto_278738 ) ( ON ?auto_278740 ?auto_278739 ) ( not ( = ?auto_278734 ?auto_278735 ) ) ( not ( = ?auto_278734 ?auto_278736 ) ) ( not ( = ?auto_278734 ?auto_278737 ) ) ( not ( = ?auto_278734 ?auto_278738 ) ) ( not ( = ?auto_278734 ?auto_278739 ) ) ( not ( = ?auto_278734 ?auto_278740 ) ) ( not ( = ?auto_278734 ?auto_278741 ) ) ( not ( = ?auto_278734 ?auto_278742 ) ) ( not ( = ?auto_278734 ?auto_278743 ) ) ( not ( = ?auto_278734 ?auto_278744 ) ) ( not ( = ?auto_278734 ?auto_278745 ) ) ( not ( = ?auto_278734 ?auto_278746 ) ) ( not ( = ?auto_278734 ?auto_278747 ) ) ( not ( = ?auto_278734 ?auto_278748 ) ) ( not ( = ?auto_278735 ?auto_278736 ) ) ( not ( = ?auto_278735 ?auto_278737 ) ) ( not ( = ?auto_278735 ?auto_278738 ) ) ( not ( = ?auto_278735 ?auto_278739 ) ) ( not ( = ?auto_278735 ?auto_278740 ) ) ( not ( = ?auto_278735 ?auto_278741 ) ) ( not ( = ?auto_278735 ?auto_278742 ) ) ( not ( = ?auto_278735 ?auto_278743 ) ) ( not ( = ?auto_278735 ?auto_278744 ) ) ( not ( = ?auto_278735 ?auto_278745 ) ) ( not ( = ?auto_278735 ?auto_278746 ) ) ( not ( = ?auto_278735 ?auto_278747 ) ) ( not ( = ?auto_278735 ?auto_278748 ) ) ( not ( = ?auto_278736 ?auto_278737 ) ) ( not ( = ?auto_278736 ?auto_278738 ) ) ( not ( = ?auto_278736 ?auto_278739 ) ) ( not ( = ?auto_278736 ?auto_278740 ) ) ( not ( = ?auto_278736 ?auto_278741 ) ) ( not ( = ?auto_278736 ?auto_278742 ) ) ( not ( = ?auto_278736 ?auto_278743 ) ) ( not ( = ?auto_278736 ?auto_278744 ) ) ( not ( = ?auto_278736 ?auto_278745 ) ) ( not ( = ?auto_278736 ?auto_278746 ) ) ( not ( = ?auto_278736 ?auto_278747 ) ) ( not ( = ?auto_278736 ?auto_278748 ) ) ( not ( = ?auto_278737 ?auto_278738 ) ) ( not ( = ?auto_278737 ?auto_278739 ) ) ( not ( = ?auto_278737 ?auto_278740 ) ) ( not ( = ?auto_278737 ?auto_278741 ) ) ( not ( = ?auto_278737 ?auto_278742 ) ) ( not ( = ?auto_278737 ?auto_278743 ) ) ( not ( = ?auto_278737 ?auto_278744 ) ) ( not ( = ?auto_278737 ?auto_278745 ) ) ( not ( = ?auto_278737 ?auto_278746 ) ) ( not ( = ?auto_278737 ?auto_278747 ) ) ( not ( = ?auto_278737 ?auto_278748 ) ) ( not ( = ?auto_278738 ?auto_278739 ) ) ( not ( = ?auto_278738 ?auto_278740 ) ) ( not ( = ?auto_278738 ?auto_278741 ) ) ( not ( = ?auto_278738 ?auto_278742 ) ) ( not ( = ?auto_278738 ?auto_278743 ) ) ( not ( = ?auto_278738 ?auto_278744 ) ) ( not ( = ?auto_278738 ?auto_278745 ) ) ( not ( = ?auto_278738 ?auto_278746 ) ) ( not ( = ?auto_278738 ?auto_278747 ) ) ( not ( = ?auto_278738 ?auto_278748 ) ) ( not ( = ?auto_278739 ?auto_278740 ) ) ( not ( = ?auto_278739 ?auto_278741 ) ) ( not ( = ?auto_278739 ?auto_278742 ) ) ( not ( = ?auto_278739 ?auto_278743 ) ) ( not ( = ?auto_278739 ?auto_278744 ) ) ( not ( = ?auto_278739 ?auto_278745 ) ) ( not ( = ?auto_278739 ?auto_278746 ) ) ( not ( = ?auto_278739 ?auto_278747 ) ) ( not ( = ?auto_278739 ?auto_278748 ) ) ( not ( = ?auto_278740 ?auto_278741 ) ) ( not ( = ?auto_278740 ?auto_278742 ) ) ( not ( = ?auto_278740 ?auto_278743 ) ) ( not ( = ?auto_278740 ?auto_278744 ) ) ( not ( = ?auto_278740 ?auto_278745 ) ) ( not ( = ?auto_278740 ?auto_278746 ) ) ( not ( = ?auto_278740 ?auto_278747 ) ) ( not ( = ?auto_278740 ?auto_278748 ) ) ( not ( = ?auto_278741 ?auto_278742 ) ) ( not ( = ?auto_278741 ?auto_278743 ) ) ( not ( = ?auto_278741 ?auto_278744 ) ) ( not ( = ?auto_278741 ?auto_278745 ) ) ( not ( = ?auto_278741 ?auto_278746 ) ) ( not ( = ?auto_278741 ?auto_278747 ) ) ( not ( = ?auto_278741 ?auto_278748 ) ) ( not ( = ?auto_278742 ?auto_278743 ) ) ( not ( = ?auto_278742 ?auto_278744 ) ) ( not ( = ?auto_278742 ?auto_278745 ) ) ( not ( = ?auto_278742 ?auto_278746 ) ) ( not ( = ?auto_278742 ?auto_278747 ) ) ( not ( = ?auto_278742 ?auto_278748 ) ) ( not ( = ?auto_278743 ?auto_278744 ) ) ( not ( = ?auto_278743 ?auto_278745 ) ) ( not ( = ?auto_278743 ?auto_278746 ) ) ( not ( = ?auto_278743 ?auto_278747 ) ) ( not ( = ?auto_278743 ?auto_278748 ) ) ( not ( = ?auto_278744 ?auto_278745 ) ) ( not ( = ?auto_278744 ?auto_278746 ) ) ( not ( = ?auto_278744 ?auto_278747 ) ) ( not ( = ?auto_278744 ?auto_278748 ) ) ( not ( = ?auto_278745 ?auto_278746 ) ) ( not ( = ?auto_278745 ?auto_278747 ) ) ( not ( = ?auto_278745 ?auto_278748 ) ) ( not ( = ?auto_278746 ?auto_278747 ) ) ( not ( = ?auto_278746 ?auto_278748 ) ) ( not ( = ?auto_278747 ?auto_278748 ) ) ( ON ?auto_278746 ?auto_278747 ) ( ON ?auto_278745 ?auto_278746 ) ( ON ?auto_278744 ?auto_278745 ) ( ON ?auto_278743 ?auto_278744 ) ( ON ?auto_278742 ?auto_278743 ) ( CLEAR ?auto_278740 ) ( ON ?auto_278741 ?auto_278742 ) ( CLEAR ?auto_278741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_278734 ?auto_278735 ?auto_278736 ?auto_278737 ?auto_278738 ?auto_278739 ?auto_278740 ?auto_278741 )
      ( MAKE-14PILE ?auto_278734 ?auto_278735 ?auto_278736 ?auto_278737 ?auto_278738 ?auto_278739 ?auto_278740 ?auto_278741 ?auto_278742 ?auto_278743 ?auto_278744 ?auto_278745 ?auto_278746 ?auto_278747 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_278763 - BLOCK
      ?auto_278764 - BLOCK
      ?auto_278765 - BLOCK
      ?auto_278766 - BLOCK
      ?auto_278767 - BLOCK
      ?auto_278768 - BLOCK
      ?auto_278769 - BLOCK
      ?auto_278770 - BLOCK
      ?auto_278771 - BLOCK
      ?auto_278772 - BLOCK
      ?auto_278773 - BLOCK
      ?auto_278774 - BLOCK
      ?auto_278775 - BLOCK
      ?auto_278776 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_278776 ) ( ON-TABLE ?auto_278763 ) ( ON ?auto_278764 ?auto_278763 ) ( ON ?auto_278765 ?auto_278764 ) ( ON ?auto_278766 ?auto_278765 ) ( ON ?auto_278767 ?auto_278766 ) ( ON ?auto_278768 ?auto_278767 ) ( ON ?auto_278769 ?auto_278768 ) ( not ( = ?auto_278763 ?auto_278764 ) ) ( not ( = ?auto_278763 ?auto_278765 ) ) ( not ( = ?auto_278763 ?auto_278766 ) ) ( not ( = ?auto_278763 ?auto_278767 ) ) ( not ( = ?auto_278763 ?auto_278768 ) ) ( not ( = ?auto_278763 ?auto_278769 ) ) ( not ( = ?auto_278763 ?auto_278770 ) ) ( not ( = ?auto_278763 ?auto_278771 ) ) ( not ( = ?auto_278763 ?auto_278772 ) ) ( not ( = ?auto_278763 ?auto_278773 ) ) ( not ( = ?auto_278763 ?auto_278774 ) ) ( not ( = ?auto_278763 ?auto_278775 ) ) ( not ( = ?auto_278763 ?auto_278776 ) ) ( not ( = ?auto_278764 ?auto_278765 ) ) ( not ( = ?auto_278764 ?auto_278766 ) ) ( not ( = ?auto_278764 ?auto_278767 ) ) ( not ( = ?auto_278764 ?auto_278768 ) ) ( not ( = ?auto_278764 ?auto_278769 ) ) ( not ( = ?auto_278764 ?auto_278770 ) ) ( not ( = ?auto_278764 ?auto_278771 ) ) ( not ( = ?auto_278764 ?auto_278772 ) ) ( not ( = ?auto_278764 ?auto_278773 ) ) ( not ( = ?auto_278764 ?auto_278774 ) ) ( not ( = ?auto_278764 ?auto_278775 ) ) ( not ( = ?auto_278764 ?auto_278776 ) ) ( not ( = ?auto_278765 ?auto_278766 ) ) ( not ( = ?auto_278765 ?auto_278767 ) ) ( not ( = ?auto_278765 ?auto_278768 ) ) ( not ( = ?auto_278765 ?auto_278769 ) ) ( not ( = ?auto_278765 ?auto_278770 ) ) ( not ( = ?auto_278765 ?auto_278771 ) ) ( not ( = ?auto_278765 ?auto_278772 ) ) ( not ( = ?auto_278765 ?auto_278773 ) ) ( not ( = ?auto_278765 ?auto_278774 ) ) ( not ( = ?auto_278765 ?auto_278775 ) ) ( not ( = ?auto_278765 ?auto_278776 ) ) ( not ( = ?auto_278766 ?auto_278767 ) ) ( not ( = ?auto_278766 ?auto_278768 ) ) ( not ( = ?auto_278766 ?auto_278769 ) ) ( not ( = ?auto_278766 ?auto_278770 ) ) ( not ( = ?auto_278766 ?auto_278771 ) ) ( not ( = ?auto_278766 ?auto_278772 ) ) ( not ( = ?auto_278766 ?auto_278773 ) ) ( not ( = ?auto_278766 ?auto_278774 ) ) ( not ( = ?auto_278766 ?auto_278775 ) ) ( not ( = ?auto_278766 ?auto_278776 ) ) ( not ( = ?auto_278767 ?auto_278768 ) ) ( not ( = ?auto_278767 ?auto_278769 ) ) ( not ( = ?auto_278767 ?auto_278770 ) ) ( not ( = ?auto_278767 ?auto_278771 ) ) ( not ( = ?auto_278767 ?auto_278772 ) ) ( not ( = ?auto_278767 ?auto_278773 ) ) ( not ( = ?auto_278767 ?auto_278774 ) ) ( not ( = ?auto_278767 ?auto_278775 ) ) ( not ( = ?auto_278767 ?auto_278776 ) ) ( not ( = ?auto_278768 ?auto_278769 ) ) ( not ( = ?auto_278768 ?auto_278770 ) ) ( not ( = ?auto_278768 ?auto_278771 ) ) ( not ( = ?auto_278768 ?auto_278772 ) ) ( not ( = ?auto_278768 ?auto_278773 ) ) ( not ( = ?auto_278768 ?auto_278774 ) ) ( not ( = ?auto_278768 ?auto_278775 ) ) ( not ( = ?auto_278768 ?auto_278776 ) ) ( not ( = ?auto_278769 ?auto_278770 ) ) ( not ( = ?auto_278769 ?auto_278771 ) ) ( not ( = ?auto_278769 ?auto_278772 ) ) ( not ( = ?auto_278769 ?auto_278773 ) ) ( not ( = ?auto_278769 ?auto_278774 ) ) ( not ( = ?auto_278769 ?auto_278775 ) ) ( not ( = ?auto_278769 ?auto_278776 ) ) ( not ( = ?auto_278770 ?auto_278771 ) ) ( not ( = ?auto_278770 ?auto_278772 ) ) ( not ( = ?auto_278770 ?auto_278773 ) ) ( not ( = ?auto_278770 ?auto_278774 ) ) ( not ( = ?auto_278770 ?auto_278775 ) ) ( not ( = ?auto_278770 ?auto_278776 ) ) ( not ( = ?auto_278771 ?auto_278772 ) ) ( not ( = ?auto_278771 ?auto_278773 ) ) ( not ( = ?auto_278771 ?auto_278774 ) ) ( not ( = ?auto_278771 ?auto_278775 ) ) ( not ( = ?auto_278771 ?auto_278776 ) ) ( not ( = ?auto_278772 ?auto_278773 ) ) ( not ( = ?auto_278772 ?auto_278774 ) ) ( not ( = ?auto_278772 ?auto_278775 ) ) ( not ( = ?auto_278772 ?auto_278776 ) ) ( not ( = ?auto_278773 ?auto_278774 ) ) ( not ( = ?auto_278773 ?auto_278775 ) ) ( not ( = ?auto_278773 ?auto_278776 ) ) ( not ( = ?auto_278774 ?auto_278775 ) ) ( not ( = ?auto_278774 ?auto_278776 ) ) ( not ( = ?auto_278775 ?auto_278776 ) ) ( ON ?auto_278775 ?auto_278776 ) ( ON ?auto_278774 ?auto_278775 ) ( ON ?auto_278773 ?auto_278774 ) ( ON ?auto_278772 ?auto_278773 ) ( ON ?auto_278771 ?auto_278772 ) ( CLEAR ?auto_278769 ) ( ON ?auto_278770 ?auto_278771 ) ( CLEAR ?auto_278770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_278763 ?auto_278764 ?auto_278765 ?auto_278766 ?auto_278767 ?auto_278768 ?auto_278769 ?auto_278770 )
      ( MAKE-14PILE ?auto_278763 ?auto_278764 ?auto_278765 ?auto_278766 ?auto_278767 ?auto_278768 ?auto_278769 ?auto_278770 ?auto_278771 ?auto_278772 ?auto_278773 ?auto_278774 ?auto_278775 ?auto_278776 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_278791 - BLOCK
      ?auto_278792 - BLOCK
      ?auto_278793 - BLOCK
      ?auto_278794 - BLOCK
      ?auto_278795 - BLOCK
      ?auto_278796 - BLOCK
      ?auto_278797 - BLOCK
      ?auto_278798 - BLOCK
      ?auto_278799 - BLOCK
      ?auto_278800 - BLOCK
      ?auto_278801 - BLOCK
      ?auto_278802 - BLOCK
      ?auto_278803 - BLOCK
      ?auto_278804 - BLOCK
    )
    :vars
    (
      ?auto_278805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_278804 ?auto_278805 ) ( ON-TABLE ?auto_278791 ) ( ON ?auto_278792 ?auto_278791 ) ( ON ?auto_278793 ?auto_278792 ) ( ON ?auto_278794 ?auto_278793 ) ( ON ?auto_278795 ?auto_278794 ) ( ON ?auto_278796 ?auto_278795 ) ( not ( = ?auto_278791 ?auto_278792 ) ) ( not ( = ?auto_278791 ?auto_278793 ) ) ( not ( = ?auto_278791 ?auto_278794 ) ) ( not ( = ?auto_278791 ?auto_278795 ) ) ( not ( = ?auto_278791 ?auto_278796 ) ) ( not ( = ?auto_278791 ?auto_278797 ) ) ( not ( = ?auto_278791 ?auto_278798 ) ) ( not ( = ?auto_278791 ?auto_278799 ) ) ( not ( = ?auto_278791 ?auto_278800 ) ) ( not ( = ?auto_278791 ?auto_278801 ) ) ( not ( = ?auto_278791 ?auto_278802 ) ) ( not ( = ?auto_278791 ?auto_278803 ) ) ( not ( = ?auto_278791 ?auto_278804 ) ) ( not ( = ?auto_278791 ?auto_278805 ) ) ( not ( = ?auto_278792 ?auto_278793 ) ) ( not ( = ?auto_278792 ?auto_278794 ) ) ( not ( = ?auto_278792 ?auto_278795 ) ) ( not ( = ?auto_278792 ?auto_278796 ) ) ( not ( = ?auto_278792 ?auto_278797 ) ) ( not ( = ?auto_278792 ?auto_278798 ) ) ( not ( = ?auto_278792 ?auto_278799 ) ) ( not ( = ?auto_278792 ?auto_278800 ) ) ( not ( = ?auto_278792 ?auto_278801 ) ) ( not ( = ?auto_278792 ?auto_278802 ) ) ( not ( = ?auto_278792 ?auto_278803 ) ) ( not ( = ?auto_278792 ?auto_278804 ) ) ( not ( = ?auto_278792 ?auto_278805 ) ) ( not ( = ?auto_278793 ?auto_278794 ) ) ( not ( = ?auto_278793 ?auto_278795 ) ) ( not ( = ?auto_278793 ?auto_278796 ) ) ( not ( = ?auto_278793 ?auto_278797 ) ) ( not ( = ?auto_278793 ?auto_278798 ) ) ( not ( = ?auto_278793 ?auto_278799 ) ) ( not ( = ?auto_278793 ?auto_278800 ) ) ( not ( = ?auto_278793 ?auto_278801 ) ) ( not ( = ?auto_278793 ?auto_278802 ) ) ( not ( = ?auto_278793 ?auto_278803 ) ) ( not ( = ?auto_278793 ?auto_278804 ) ) ( not ( = ?auto_278793 ?auto_278805 ) ) ( not ( = ?auto_278794 ?auto_278795 ) ) ( not ( = ?auto_278794 ?auto_278796 ) ) ( not ( = ?auto_278794 ?auto_278797 ) ) ( not ( = ?auto_278794 ?auto_278798 ) ) ( not ( = ?auto_278794 ?auto_278799 ) ) ( not ( = ?auto_278794 ?auto_278800 ) ) ( not ( = ?auto_278794 ?auto_278801 ) ) ( not ( = ?auto_278794 ?auto_278802 ) ) ( not ( = ?auto_278794 ?auto_278803 ) ) ( not ( = ?auto_278794 ?auto_278804 ) ) ( not ( = ?auto_278794 ?auto_278805 ) ) ( not ( = ?auto_278795 ?auto_278796 ) ) ( not ( = ?auto_278795 ?auto_278797 ) ) ( not ( = ?auto_278795 ?auto_278798 ) ) ( not ( = ?auto_278795 ?auto_278799 ) ) ( not ( = ?auto_278795 ?auto_278800 ) ) ( not ( = ?auto_278795 ?auto_278801 ) ) ( not ( = ?auto_278795 ?auto_278802 ) ) ( not ( = ?auto_278795 ?auto_278803 ) ) ( not ( = ?auto_278795 ?auto_278804 ) ) ( not ( = ?auto_278795 ?auto_278805 ) ) ( not ( = ?auto_278796 ?auto_278797 ) ) ( not ( = ?auto_278796 ?auto_278798 ) ) ( not ( = ?auto_278796 ?auto_278799 ) ) ( not ( = ?auto_278796 ?auto_278800 ) ) ( not ( = ?auto_278796 ?auto_278801 ) ) ( not ( = ?auto_278796 ?auto_278802 ) ) ( not ( = ?auto_278796 ?auto_278803 ) ) ( not ( = ?auto_278796 ?auto_278804 ) ) ( not ( = ?auto_278796 ?auto_278805 ) ) ( not ( = ?auto_278797 ?auto_278798 ) ) ( not ( = ?auto_278797 ?auto_278799 ) ) ( not ( = ?auto_278797 ?auto_278800 ) ) ( not ( = ?auto_278797 ?auto_278801 ) ) ( not ( = ?auto_278797 ?auto_278802 ) ) ( not ( = ?auto_278797 ?auto_278803 ) ) ( not ( = ?auto_278797 ?auto_278804 ) ) ( not ( = ?auto_278797 ?auto_278805 ) ) ( not ( = ?auto_278798 ?auto_278799 ) ) ( not ( = ?auto_278798 ?auto_278800 ) ) ( not ( = ?auto_278798 ?auto_278801 ) ) ( not ( = ?auto_278798 ?auto_278802 ) ) ( not ( = ?auto_278798 ?auto_278803 ) ) ( not ( = ?auto_278798 ?auto_278804 ) ) ( not ( = ?auto_278798 ?auto_278805 ) ) ( not ( = ?auto_278799 ?auto_278800 ) ) ( not ( = ?auto_278799 ?auto_278801 ) ) ( not ( = ?auto_278799 ?auto_278802 ) ) ( not ( = ?auto_278799 ?auto_278803 ) ) ( not ( = ?auto_278799 ?auto_278804 ) ) ( not ( = ?auto_278799 ?auto_278805 ) ) ( not ( = ?auto_278800 ?auto_278801 ) ) ( not ( = ?auto_278800 ?auto_278802 ) ) ( not ( = ?auto_278800 ?auto_278803 ) ) ( not ( = ?auto_278800 ?auto_278804 ) ) ( not ( = ?auto_278800 ?auto_278805 ) ) ( not ( = ?auto_278801 ?auto_278802 ) ) ( not ( = ?auto_278801 ?auto_278803 ) ) ( not ( = ?auto_278801 ?auto_278804 ) ) ( not ( = ?auto_278801 ?auto_278805 ) ) ( not ( = ?auto_278802 ?auto_278803 ) ) ( not ( = ?auto_278802 ?auto_278804 ) ) ( not ( = ?auto_278802 ?auto_278805 ) ) ( not ( = ?auto_278803 ?auto_278804 ) ) ( not ( = ?auto_278803 ?auto_278805 ) ) ( not ( = ?auto_278804 ?auto_278805 ) ) ( ON ?auto_278803 ?auto_278804 ) ( ON ?auto_278802 ?auto_278803 ) ( ON ?auto_278801 ?auto_278802 ) ( ON ?auto_278800 ?auto_278801 ) ( ON ?auto_278799 ?auto_278800 ) ( ON ?auto_278798 ?auto_278799 ) ( CLEAR ?auto_278796 ) ( ON ?auto_278797 ?auto_278798 ) ( CLEAR ?auto_278797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_278791 ?auto_278792 ?auto_278793 ?auto_278794 ?auto_278795 ?auto_278796 ?auto_278797 )
      ( MAKE-14PILE ?auto_278791 ?auto_278792 ?auto_278793 ?auto_278794 ?auto_278795 ?auto_278796 ?auto_278797 ?auto_278798 ?auto_278799 ?auto_278800 ?auto_278801 ?auto_278802 ?auto_278803 ?auto_278804 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_278820 - BLOCK
      ?auto_278821 - BLOCK
      ?auto_278822 - BLOCK
      ?auto_278823 - BLOCK
      ?auto_278824 - BLOCK
      ?auto_278825 - BLOCK
      ?auto_278826 - BLOCK
      ?auto_278827 - BLOCK
      ?auto_278828 - BLOCK
      ?auto_278829 - BLOCK
      ?auto_278830 - BLOCK
      ?auto_278831 - BLOCK
      ?auto_278832 - BLOCK
      ?auto_278833 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_278833 ) ( ON-TABLE ?auto_278820 ) ( ON ?auto_278821 ?auto_278820 ) ( ON ?auto_278822 ?auto_278821 ) ( ON ?auto_278823 ?auto_278822 ) ( ON ?auto_278824 ?auto_278823 ) ( ON ?auto_278825 ?auto_278824 ) ( not ( = ?auto_278820 ?auto_278821 ) ) ( not ( = ?auto_278820 ?auto_278822 ) ) ( not ( = ?auto_278820 ?auto_278823 ) ) ( not ( = ?auto_278820 ?auto_278824 ) ) ( not ( = ?auto_278820 ?auto_278825 ) ) ( not ( = ?auto_278820 ?auto_278826 ) ) ( not ( = ?auto_278820 ?auto_278827 ) ) ( not ( = ?auto_278820 ?auto_278828 ) ) ( not ( = ?auto_278820 ?auto_278829 ) ) ( not ( = ?auto_278820 ?auto_278830 ) ) ( not ( = ?auto_278820 ?auto_278831 ) ) ( not ( = ?auto_278820 ?auto_278832 ) ) ( not ( = ?auto_278820 ?auto_278833 ) ) ( not ( = ?auto_278821 ?auto_278822 ) ) ( not ( = ?auto_278821 ?auto_278823 ) ) ( not ( = ?auto_278821 ?auto_278824 ) ) ( not ( = ?auto_278821 ?auto_278825 ) ) ( not ( = ?auto_278821 ?auto_278826 ) ) ( not ( = ?auto_278821 ?auto_278827 ) ) ( not ( = ?auto_278821 ?auto_278828 ) ) ( not ( = ?auto_278821 ?auto_278829 ) ) ( not ( = ?auto_278821 ?auto_278830 ) ) ( not ( = ?auto_278821 ?auto_278831 ) ) ( not ( = ?auto_278821 ?auto_278832 ) ) ( not ( = ?auto_278821 ?auto_278833 ) ) ( not ( = ?auto_278822 ?auto_278823 ) ) ( not ( = ?auto_278822 ?auto_278824 ) ) ( not ( = ?auto_278822 ?auto_278825 ) ) ( not ( = ?auto_278822 ?auto_278826 ) ) ( not ( = ?auto_278822 ?auto_278827 ) ) ( not ( = ?auto_278822 ?auto_278828 ) ) ( not ( = ?auto_278822 ?auto_278829 ) ) ( not ( = ?auto_278822 ?auto_278830 ) ) ( not ( = ?auto_278822 ?auto_278831 ) ) ( not ( = ?auto_278822 ?auto_278832 ) ) ( not ( = ?auto_278822 ?auto_278833 ) ) ( not ( = ?auto_278823 ?auto_278824 ) ) ( not ( = ?auto_278823 ?auto_278825 ) ) ( not ( = ?auto_278823 ?auto_278826 ) ) ( not ( = ?auto_278823 ?auto_278827 ) ) ( not ( = ?auto_278823 ?auto_278828 ) ) ( not ( = ?auto_278823 ?auto_278829 ) ) ( not ( = ?auto_278823 ?auto_278830 ) ) ( not ( = ?auto_278823 ?auto_278831 ) ) ( not ( = ?auto_278823 ?auto_278832 ) ) ( not ( = ?auto_278823 ?auto_278833 ) ) ( not ( = ?auto_278824 ?auto_278825 ) ) ( not ( = ?auto_278824 ?auto_278826 ) ) ( not ( = ?auto_278824 ?auto_278827 ) ) ( not ( = ?auto_278824 ?auto_278828 ) ) ( not ( = ?auto_278824 ?auto_278829 ) ) ( not ( = ?auto_278824 ?auto_278830 ) ) ( not ( = ?auto_278824 ?auto_278831 ) ) ( not ( = ?auto_278824 ?auto_278832 ) ) ( not ( = ?auto_278824 ?auto_278833 ) ) ( not ( = ?auto_278825 ?auto_278826 ) ) ( not ( = ?auto_278825 ?auto_278827 ) ) ( not ( = ?auto_278825 ?auto_278828 ) ) ( not ( = ?auto_278825 ?auto_278829 ) ) ( not ( = ?auto_278825 ?auto_278830 ) ) ( not ( = ?auto_278825 ?auto_278831 ) ) ( not ( = ?auto_278825 ?auto_278832 ) ) ( not ( = ?auto_278825 ?auto_278833 ) ) ( not ( = ?auto_278826 ?auto_278827 ) ) ( not ( = ?auto_278826 ?auto_278828 ) ) ( not ( = ?auto_278826 ?auto_278829 ) ) ( not ( = ?auto_278826 ?auto_278830 ) ) ( not ( = ?auto_278826 ?auto_278831 ) ) ( not ( = ?auto_278826 ?auto_278832 ) ) ( not ( = ?auto_278826 ?auto_278833 ) ) ( not ( = ?auto_278827 ?auto_278828 ) ) ( not ( = ?auto_278827 ?auto_278829 ) ) ( not ( = ?auto_278827 ?auto_278830 ) ) ( not ( = ?auto_278827 ?auto_278831 ) ) ( not ( = ?auto_278827 ?auto_278832 ) ) ( not ( = ?auto_278827 ?auto_278833 ) ) ( not ( = ?auto_278828 ?auto_278829 ) ) ( not ( = ?auto_278828 ?auto_278830 ) ) ( not ( = ?auto_278828 ?auto_278831 ) ) ( not ( = ?auto_278828 ?auto_278832 ) ) ( not ( = ?auto_278828 ?auto_278833 ) ) ( not ( = ?auto_278829 ?auto_278830 ) ) ( not ( = ?auto_278829 ?auto_278831 ) ) ( not ( = ?auto_278829 ?auto_278832 ) ) ( not ( = ?auto_278829 ?auto_278833 ) ) ( not ( = ?auto_278830 ?auto_278831 ) ) ( not ( = ?auto_278830 ?auto_278832 ) ) ( not ( = ?auto_278830 ?auto_278833 ) ) ( not ( = ?auto_278831 ?auto_278832 ) ) ( not ( = ?auto_278831 ?auto_278833 ) ) ( not ( = ?auto_278832 ?auto_278833 ) ) ( ON ?auto_278832 ?auto_278833 ) ( ON ?auto_278831 ?auto_278832 ) ( ON ?auto_278830 ?auto_278831 ) ( ON ?auto_278829 ?auto_278830 ) ( ON ?auto_278828 ?auto_278829 ) ( ON ?auto_278827 ?auto_278828 ) ( CLEAR ?auto_278825 ) ( ON ?auto_278826 ?auto_278827 ) ( CLEAR ?auto_278826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_278820 ?auto_278821 ?auto_278822 ?auto_278823 ?auto_278824 ?auto_278825 ?auto_278826 )
      ( MAKE-14PILE ?auto_278820 ?auto_278821 ?auto_278822 ?auto_278823 ?auto_278824 ?auto_278825 ?auto_278826 ?auto_278827 ?auto_278828 ?auto_278829 ?auto_278830 ?auto_278831 ?auto_278832 ?auto_278833 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_278848 - BLOCK
      ?auto_278849 - BLOCK
      ?auto_278850 - BLOCK
      ?auto_278851 - BLOCK
      ?auto_278852 - BLOCK
      ?auto_278853 - BLOCK
      ?auto_278854 - BLOCK
      ?auto_278855 - BLOCK
      ?auto_278856 - BLOCK
      ?auto_278857 - BLOCK
      ?auto_278858 - BLOCK
      ?auto_278859 - BLOCK
      ?auto_278860 - BLOCK
      ?auto_278861 - BLOCK
    )
    :vars
    (
      ?auto_278862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_278861 ?auto_278862 ) ( ON-TABLE ?auto_278848 ) ( ON ?auto_278849 ?auto_278848 ) ( ON ?auto_278850 ?auto_278849 ) ( ON ?auto_278851 ?auto_278850 ) ( ON ?auto_278852 ?auto_278851 ) ( not ( = ?auto_278848 ?auto_278849 ) ) ( not ( = ?auto_278848 ?auto_278850 ) ) ( not ( = ?auto_278848 ?auto_278851 ) ) ( not ( = ?auto_278848 ?auto_278852 ) ) ( not ( = ?auto_278848 ?auto_278853 ) ) ( not ( = ?auto_278848 ?auto_278854 ) ) ( not ( = ?auto_278848 ?auto_278855 ) ) ( not ( = ?auto_278848 ?auto_278856 ) ) ( not ( = ?auto_278848 ?auto_278857 ) ) ( not ( = ?auto_278848 ?auto_278858 ) ) ( not ( = ?auto_278848 ?auto_278859 ) ) ( not ( = ?auto_278848 ?auto_278860 ) ) ( not ( = ?auto_278848 ?auto_278861 ) ) ( not ( = ?auto_278848 ?auto_278862 ) ) ( not ( = ?auto_278849 ?auto_278850 ) ) ( not ( = ?auto_278849 ?auto_278851 ) ) ( not ( = ?auto_278849 ?auto_278852 ) ) ( not ( = ?auto_278849 ?auto_278853 ) ) ( not ( = ?auto_278849 ?auto_278854 ) ) ( not ( = ?auto_278849 ?auto_278855 ) ) ( not ( = ?auto_278849 ?auto_278856 ) ) ( not ( = ?auto_278849 ?auto_278857 ) ) ( not ( = ?auto_278849 ?auto_278858 ) ) ( not ( = ?auto_278849 ?auto_278859 ) ) ( not ( = ?auto_278849 ?auto_278860 ) ) ( not ( = ?auto_278849 ?auto_278861 ) ) ( not ( = ?auto_278849 ?auto_278862 ) ) ( not ( = ?auto_278850 ?auto_278851 ) ) ( not ( = ?auto_278850 ?auto_278852 ) ) ( not ( = ?auto_278850 ?auto_278853 ) ) ( not ( = ?auto_278850 ?auto_278854 ) ) ( not ( = ?auto_278850 ?auto_278855 ) ) ( not ( = ?auto_278850 ?auto_278856 ) ) ( not ( = ?auto_278850 ?auto_278857 ) ) ( not ( = ?auto_278850 ?auto_278858 ) ) ( not ( = ?auto_278850 ?auto_278859 ) ) ( not ( = ?auto_278850 ?auto_278860 ) ) ( not ( = ?auto_278850 ?auto_278861 ) ) ( not ( = ?auto_278850 ?auto_278862 ) ) ( not ( = ?auto_278851 ?auto_278852 ) ) ( not ( = ?auto_278851 ?auto_278853 ) ) ( not ( = ?auto_278851 ?auto_278854 ) ) ( not ( = ?auto_278851 ?auto_278855 ) ) ( not ( = ?auto_278851 ?auto_278856 ) ) ( not ( = ?auto_278851 ?auto_278857 ) ) ( not ( = ?auto_278851 ?auto_278858 ) ) ( not ( = ?auto_278851 ?auto_278859 ) ) ( not ( = ?auto_278851 ?auto_278860 ) ) ( not ( = ?auto_278851 ?auto_278861 ) ) ( not ( = ?auto_278851 ?auto_278862 ) ) ( not ( = ?auto_278852 ?auto_278853 ) ) ( not ( = ?auto_278852 ?auto_278854 ) ) ( not ( = ?auto_278852 ?auto_278855 ) ) ( not ( = ?auto_278852 ?auto_278856 ) ) ( not ( = ?auto_278852 ?auto_278857 ) ) ( not ( = ?auto_278852 ?auto_278858 ) ) ( not ( = ?auto_278852 ?auto_278859 ) ) ( not ( = ?auto_278852 ?auto_278860 ) ) ( not ( = ?auto_278852 ?auto_278861 ) ) ( not ( = ?auto_278852 ?auto_278862 ) ) ( not ( = ?auto_278853 ?auto_278854 ) ) ( not ( = ?auto_278853 ?auto_278855 ) ) ( not ( = ?auto_278853 ?auto_278856 ) ) ( not ( = ?auto_278853 ?auto_278857 ) ) ( not ( = ?auto_278853 ?auto_278858 ) ) ( not ( = ?auto_278853 ?auto_278859 ) ) ( not ( = ?auto_278853 ?auto_278860 ) ) ( not ( = ?auto_278853 ?auto_278861 ) ) ( not ( = ?auto_278853 ?auto_278862 ) ) ( not ( = ?auto_278854 ?auto_278855 ) ) ( not ( = ?auto_278854 ?auto_278856 ) ) ( not ( = ?auto_278854 ?auto_278857 ) ) ( not ( = ?auto_278854 ?auto_278858 ) ) ( not ( = ?auto_278854 ?auto_278859 ) ) ( not ( = ?auto_278854 ?auto_278860 ) ) ( not ( = ?auto_278854 ?auto_278861 ) ) ( not ( = ?auto_278854 ?auto_278862 ) ) ( not ( = ?auto_278855 ?auto_278856 ) ) ( not ( = ?auto_278855 ?auto_278857 ) ) ( not ( = ?auto_278855 ?auto_278858 ) ) ( not ( = ?auto_278855 ?auto_278859 ) ) ( not ( = ?auto_278855 ?auto_278860 ) ) ( not ( = ?auto_278855 ?auto_278861 ) ) ( not ( = ?auto_278855 ?auto_278862 ) ) ( not ( = ?auto_278856 ?auto_278857 ) ) ( not ( = ?auto_278856 ?auto_278858 ) ) ( not ( = ?auto_278856 ?auto_278859 ) ) ( not ( = ?auto_278856 ?auto_278860 ) ) ( not ( = ?auto_278856 ?auto_278861 ) ) ( not ( = ?auto_278856 ?auto_278862 ) ) ( not ( = ?auto_278857 ?auto_278858 ) ) ( not ( = ?auto_278857 ?auto_278859 ) ) ( not ( = ?auto_278857 ?auto_278860 ) ) ( not ( = ?auto_278857 ?auto_278861 ) ) ( not ( = ?auto_278857 ?auto_278862 ) ) ( not ( = ?auto_278858 ?auto_278859 ) ) ( not ( = ?auto_278858 ?auto_278860 ) ) ( not ( = ?auto_278858 ?auto_278861 ) ) ( not ( = ?auto_278858 ?auto_278862 ) ) ( not ( = ?auto_278859 ?auto_278860 ) ) ( not ( = ?auto_278859 ?auto_278861 ) ) ( not ( = ?auto_278859 ?auto_278862 ) ) ( not ( = ?auto_278860 ?auto_278861 ) ) ( not ( = ?auto_278860 ?auto_278862 ) ) ( not ( = ?auto_278861 ?auto_278862 ) ) ( ON ?auto_278860 ?auto_278861 ) ( ON ?auto_278859 ?auto_278860 ) ( ON ?auto_278858 ?auto_278859 ) ( ON ?auto_278857 ?auto_278858 ) ( ON ?auto_278856 ?auto_278857 ) ( ON ?auto_278855 ?auto_278856 ) ( ON ?auto_278854 ?auto_278855 ) ( CLEAR ?auto_278852 ) ( ON ?auto_278853 ?auto_278854 ) ( CLEAR ?auto_278853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_278848 ?auto_278849 ?auto_278850 ?auto_278851 ?auto_278852 ?auto_278853 )
      ( MAKE-14PILE ?auto_278848 ?auto_278849 ?auto_278850 ?auto_278851 ?auto_278852 ?auto_278853 ?auto_278854 ?auto_278855 ?auto_278856 ?auto_278857 ?auto_278858 ?auto_278859 ?auto_278860 ?auto_278861 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_278877 - BLOCK
      ?auto_278878 - BLOCK
      ?auto_278879 - BLOCK
      ?auto_278880 - BLOCK
      ?auto_278881 - BLOCK
      ?auto_278882 - BLOCK
      ?auto_278883 - BLOCK
      ?auto_278884 - BLOCK
      ?auto_278885 - BLOCK
      ?auto_278886 - BLOCK
      ?auto_278887 - BLOCK
      ?auto_278888 - BLOCK
      ?auto_278889 - BLOCK
      ?auto_278890 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_278890 ) ( ON-TABLE ?auto_278877 ) ( ON ?auto_278878 ?auto_278877 ) ( ON ?auto_278879 ?auto_278878 ) ( ON ?auto_278880 ?auto_278879 ) ( ON ?auto_278881 ?auto_278880 ) ( not ( = ?auto_278877 ?auto_278878 ) ) ( not ( = ?auto_278877 ?auto_278879 ) ) ( not ( = ?auto_278877 ?auto_278880 ) ) ( not ( = ?auto_278877 ?auto_278881 ) ) ( not ( = ?auto_278877 ?auto_278882 ) ) ( not ( = ?auto_278877 ?auto_278883 ) ) ( not ( = ?auto_278877 ?auto_278884 ) ) ( not ( = ?auto_278877 ?auto_278885 ) ) ( not ( = ?auto_278877 ?auto_278886 ) ) ( not ( = ?auto_278877 ?auto_278887 ) ) ( not ( = ?auto_278877 ?auto_278888 ) ) ( not ( = ?auto_278877 ?auto_278889 ) ) ( not ( = ?auto_278877 ?auto_278890 ) ) ( not ( = ?auto_278878 ?auto_278879 ) ) ( not ( = ?auto_278878 ?auto_278880 ) ) ( not ( = ?auto_278878 ?auto_278881 ) ) ( not ( = ?auto_278878 ?auto_278882 ) ) ( not ( = ?auto_278878 ?auto_278883 ) ) ( not ( = ?auto_278878 ?auto_278884 ) ) ( not ( = ?auto_278878 ?auto_278885 ) ) ( not ( = ?auto_278878 ?auto_278886 ) ) ( not ( = ?auto_278878 ?auto_278887 ) ) ( not ( = ?auto_278878 ?auto_278888 ) ) ( not ( = ?auto_278878 ?auto_278889 ) ) ( not ( = ?auto_278878 ?auto_278890 ) ) ( not ( = ?auto_278879 ?auto_278880 ) ) ( not ( = ?auto_278879 ?auto_278881 ) ) ( not ( = ?auto_278879 ?auto_278882 ) ) ( not ( = ?auto_278879 ?auto_278883 ) ) ( not ( = ?auto_278879 ?auto_278884 ) ) ( not ( = ?auto_278879 ?auto_278885 ) ) ( not ( = ?auto_278879 ?auto_278886 ) ) ( not ( = ?auto_278879 ?auto_278887 ) ) ( not ( = ?auto_278879 ?auto_278888 ) ) ( not ( = ?auto_278879 ?auto_278889 ) ) ( not ( = ?auto_278879 ?auto_278890 ) ) ( not ( = ?auto_278880 ?auto_278881 ) ) ( not ( = ?auto_278880 ?auto_278882 ) ) ( not ( = ?auto_278880 ?auto_278883 ) ) ( not ( = ?auto_278880 ?auto_278884 ) ) ( not ( = ?auto_278880 ?auto_278885 ) ) ( not ( = ?auto_278880 ?auto_278886 ) ) ( not ( = ?auto_278880 ?auto_278887 ) ) ( not ( = ?auto_278880 ?auto_278888 ) ) ( not ( = ?auto_278880 ?auto_278889 ) ) ( not ( = ?auto_278880 ?auto_278890 ) ) ( not ( = ?auto_278881 ?auto_278882 ) ) ( not ( = ?auto_278881 ?auto_278883 ) ) ( not ( = ?auto_278881 ?auto_278884 ) ) ( not ( = ?auto_278881 ?auto_278885 ) ) ( not ( = ?auto_278881 ?auto_278886 ) ) ( not ( = ?auto_278881 ?auto_278887 ) ) ( not ( = ?auto_278881 ?auto_278888 ) ) ( not ( = ?auto_278881 ?auto_278889 ) ) ( not ( = ?auto_278881 ?auto_278890 ) ) ( not ( = ?auto_278882 ?auto_278883 ) ) ( not ( = ?auto_278882 ?auto_278884 ) ) ( not ( = ?auto_278882 ?auto_278885 ) ) ( not ( = ?auto_278882 ?auto_278886 ) ) ( not ( = ?auto_278882 ?auto_278887 ) ) ( not ( = ?auto_278882 ?auto_278888 ) ) ( not ( = ?auto_278882 ?auto_278889 ) ) ( not ( = ?auto_278882 ?auto_278890 ) ) ( not ( = ?auto_278883 ?auto_278884 ) ) ( not ( = ?auto_278883 ?auto_278885 ) ) ( not ( = ?auto_278883 ?auto_278886 ) ) ( not ( = ?auto_278883 ?auto_278887 ) ) ( not ( = ?auto_278883 ?auto_278888 ) ) ( not ( = ?auto_278883 ?auto_278889 ) ) ( not ( = ?auto_278883 ?auto_278890 ) ) ( not ( = ?auto_278884 ?auto_278885 ) ) ( not ( = ?auto_278884 ?auto_278886 ) ) ( not ( = ?auto_278884 ?auto_278887 ) ) ( not ( = ?auto_278884 ?auto_278888 ) ) ( not ( = ?auto_278884 ?auto_278889 ) ) ( not ( = ?auto_278884 ?auto_278890 ) ) ( not ( = ?auto_278885 ?auto_278886 ) ) ( not ( = ?auto_278885 ?auto_278887 ) ) ( not ( = ?auto_278885 ?auto_278888 ) ) ( not ( = ?auto_278885 ?auto_278889 ) ) ( not ( = ?auto_278885 ?auto_278890 ) ) ( not ( = ?auto_278886 ?auto_278887 ) ) ( not ( = ?auto_278886 ?auto_278888 ) ) ( not ( = ?auto_278886 ?auto_278889 ) ) ( not ( = ?auto_278886 ?auto_278890 ) ) ( not ( = ?auto_278887 ?auto_278888 ) ) ( not ( = ?auto_278887 ?auto_278889 ) ) ( not ( = ?auto_278887 ?auto_278890 ) ) ( not ( = ?auto_278888 ?auto_278889 ) ) ( not ( = ?auto_278888 ?auto_278890 ) ) ( not ( = ?auto_278889 ?auto_278890 ) ) ( ON ?auto_278889 ?auto_278890 ) ( ON ?auto_278888 ?auto_278889 ) ( ON ?auto_278887 ?auto_278888 ) ( ON ?auto_278886 ?auto_278887 ) ( ON ?auto_278885 ?auto_278886 ) ( ON ?auto_278884 ?auto_278885 ) ( ON ?auto_278883 ?auto_278884 ) ( CLEAR ?auto_278881 ) ( ON ?auto_278882 ?auto_278883 ) ( CLEAR ?auto_278882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_278877 ?auto_278878 ?auto_278879 ?auto_278880 ?auto_278881 ?auto_278882 )
      ( MAKE-14PILE ?auto_278877 ?auto_278878 ?auto_278879 ?auto_278880 ?auto_278881 ?auto_278882 ?auto_278883 ?auto_278884 ?auto_278885 ?auto_278886 ?auto_278887 ?auto_278888 ?auto_278889 ?auto_278890 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_278905 - BLOCK
      ?auto_278906 - BLOCK
      ?auto_278907 - BLOCK
      ?auto_278908 - BLOCK
      ?auto_278909 - BLOCK
      ?auto_278910 - BLOCK
      ?auto_278911 - BLOCK
      ?auto_278912 - BLOCK
      ?auto_278913 - BLOCK
      ?auto_278914 - BLOCK
      ?auto_278915 - BLOCK
      ?auto_278916 - BLOCK
      ?auto_278917 - BLOCK
      ?auto_278918 - BLOCK
    )
    :vars
    (
      ?auto_278919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_278918 ?auto_278919 ) ( ON-TABLE ?auto_278905 ) ( ON ?auto_278906 ?auto_278905 ) ( ON ?auto_278907 ?auto_278906 ) ( ON ?auto_278908 ?auto_278907 ) ( not ( = ?auto_278905 ?auto_278906 ) ) ( not ( = ?auto_278905 ?auto_278907 ) ) ( not ( = ?auto_278905 ?auto_278908 ) ) ( not ( = ?auto_278905 ?auto_278909 ) ) ( not ( = ?auto_278905 ?auto_278910 ) ) ( not ( = ?auto_278905 ?auto_278911 ) ) ( not ( = ?auto_278905 ?auto_278912 ) ) ( not ( = ?auto_278905 ?auto_278913 ) ) ( not ( = ?auto_278905 ?auto_278914 ) ) ( not ( = ?auto_278905 ?auto_278915 ) ) ( not ( = ?auto_278905 ?auto_278916 ) ) ( not ( = ?auto_278905 ?auto_278917 ) ) ( not ( = ?auto_278905 ?auto_278918 ) ) ( not ( = ?auto_278905 ?auto_278919 ) ) ( not ( = ?auto_278906 ?auto_278907 ) ) ( not ( = ?auto_278906 ?auto_278908 ) ) ( not ( = ?auto_278906 ?auto_278909 ) ) ( not ( = ?auto_278906 ?auto_278910 ) ) ( not ( = ?auto_278906 ?auto_278911 ) ) ( not ( = ?auto_278906 ?auto_278912 ) ) ( not ( = ?auto_278906 ?auto_278913 ) ) ( not ( = ?auto_278906 ?auto_278914 ) ) ( not ( = ?auto_278906 ?auto_278915 ) ) ( not ( = ?auto_278906 ?auto_278916 ) ) ( not ( = ?auto_278906 ?auto_278917 ) ) ( not ( = ?auto_278906 ?auto_278918 ) ) ( not ( = ?auto_278906 ?auto_278919 ) ) ( not ( = ?auto_278907 ?auto_278908 ) ) ( not ( = ?auto_278907 ?auto_278909 ) ) ( not ( = ?auto_278907 ?auto_278910 ) ) ( not ( = ?auto_278907 ?auto_278911 ) ) ( not ( = ?auto_278907 ?auto_278912 ) ) ( not ( = ?auto_278907 ?auto_278913 ) ) ( not ( = ?auto_278907 ?auto_278914 ) ) ( not ( = ?auto_278907 ?auto_278915 ) ) ( not ( = ?auto_278907 ?auto_278916 ) ) ( not ( = ?auto_278907 ?auto_278917 ) ) ( not ( = ?auto_278907 ?auto_278918 ) ) ( not ( = ?auto_278907 ?auto_278919 ) ) ( not ( = ?auto_278908 ?auto_278909 ) ) ( not ( = ?auto_278908 ?auto_278910 ) ) ( not ( = ?auto_278908 ?auto_278911 ) ) ( not ( = ?auto_278908 ?auto_278912 ) ) ( not ( = ?auto_278908 ?auto_278913 ) ) ( not ( = ?auto_278908 ?auto_278914 ) ) ( not ( = ?auto_278908 ?auto_278915 ) ) ( not ( = ?auto_278908 ?auto_278916 ) ) ( not ( = ?auto_278908 ?auto_278917 ) ) ( not ( = ?auto_278908 ?auto_278918 ) ) ( not ( = ?auto_278908 ?auto_278919 ) ) ( not ( = ?auto_278909 ?auto_278910 ) ) ( not ( = ?auto_278909 ?auto_278911 ) ) ( not ( = ?auto_278909 ?auto_278912 ) ) ( not ( = ?auto_278909 ?auto_278913 ) ) ( not ( = ?auto_278909 ?auto_278914 ) ) ( not ( = ?auto_278909 ?auto_278915 ) ) ( not ( = ?auto_278909 ?auto_278916 ) ) ( not ( = ?auto_278909 ?auto_278917 ) ) ( not ( = ?auto_278909 ?auto_278918 ) ) ( not ( = ?auto_278909 ?auto_278919 ) ) ( not ( = ?auto_278910 ?auto_278911 ) ) ( not ( = ?auto_278910 ?auto_278912 ) ) ( not ( = ?auto_278910 ?auto_278913 ) ) ( not ( = ?auto_278910 ?auto_278914 ) ) ( not ( = ?auto_278910 ?auto_278915 ) ) ( not ( = ?auto_278910 ?auto_278916 ) ) ( not ( = ?auto_278910 ?auto_278917 ) ) ( not ( = ?auto_278910 ?auto_278918 ) ) ( not ( = ?auto_278910 ?auto_278919 ) ) ( not ( = ?auto_278911 ?auto_278912 ) ) ( not ( = ?auto_278911 ?auto_278913 ) ) ( not ( = ?auto_278911 ?auto_278914 ) ) ( not ( = ?auto_278911 ?auto_278915 ) ) ( not ( = ?auto_278911 ?auto_278916 ) ) ( not ( = ?auto_278911 ?auto_278917 ) ) ( not ( = ?auto_278911 ?auto_278918 ) ) ( not ( = ?auto_278911 ?auto_278919 ) ) ( not ( = ?auto_278912 ?auto_278913 ) ) ( not ( = ?auto_278912 ?auto_278914 ) ) ( not ( = ?auto_278912 ?auto_278915 ) ) ( not ( = ?auto_278912 ?auto_278916 ) ) ( not ( = ?auto_278912 ?auto_278917 ) ) ( not ( = ?auto_278912 ?auto_278918 ) ) ( not ( = ?auto_278912 ?auto_278919 ) ) ( not ( = ?auto_278913 ?auto_278914 ) ) ( not ( = ?auto_278913 ?auto_278915 ) ) ( not ( = ?auto_278913 ?auto_278916 ) ) ( not ( = ?auto_278913 ?auto_278917 ) ) ( not ( = ?auto_278913 ?auto_278918 ) ) ( not ( = ?auto_278913 ?auto_278919 ) ) ( not ( = ?auto_278914 ?auto_278915 ) ) ( not ( = ?auto_278914 ?auto_278916 ) ) ( not ( = ?auto_278914 ?auto_278917 ) ) ( not ( = ?auto_278914 ?auto_278918 ) ) ( not ( = ?auto_278914 ?auto_278919 ) ) ( not ( = ?auto_278915 ?auto_278916 ) ) ( not ( = ?auto_278915 ?auto_278917 ) ) ( not ( = ?auto_278915 ?auto_278918 ) ) ( not ( = ?auto_278915 ?auto_278919 ) ) ( not ( = ?auto_278916 ?auto_278917 ) ) ( not ( = ?auto_278916 ?auto_278918 ) ) ( not ( = ?auto_278916 ?auto_278919 ) ) ( not ( = ?auto_278917 ?auto_278918 ) ) ( not ( = ?auto_278917 ?auto_278919 ) ) ( not ( = ?auto_278918 ?auto_278919 ) ) ( ON ?auto_278917 ?auto_278918 ) ( ON ?auto_278916 ?auto_278917 ) ( ON ?auto_278915 ?auto_278916 ) ( ON ?auto_278914 ?auto_278915 ) ( ON ?auto_278913 ?auto_278914 ) ( ON ?auto_278912 ?auto_278913 ) ( ON ?auto_278911 ?auto_278912 ) ( ON ?auto_278910 ?auto_278911 ) ( CLEAR ?auto_278908 ) ( ON ?auto_278909 ?auto_278910 ) ( CLEAR ?auto_278909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_278905 ?auto_278906 ?auto_278907 ?auto_278908 ?auto_278909 )
      ( MAKE-14PILE ?auto_278905 ?auto_278906 ?auto_278907 ?auto_278908 ?auto_278909 ?auto_278910 ?auto_278911 ?auto_278912 ?auto_278913 ?auto_278914 ?auto_278915 ?auto_278916 ?auto_278917 ?auto_278918 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_278934 - BLOCK
      ?auto_278935 - BLOCK
      ?auto_278936 - BLOCK
      ?auto_278937 - BLOCK
      ?auto_278938 - BLOCK
      ?auto_278939 - BLOCK
      ?auto_278940 - BLOCK
      ?auto_278941 - BLOCK
      ?auto_278942 - BLOCK
      ?auto_278943 - BLOCK
      ?auto_278944 - BLOCK
      ?auto_278945 - BLOCK
      ?auto_278946 - BLOCK
      ?auto_278947 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_278947 ) ( ON-TABLE ?auto_278934 ) ( ON ?auto_278935 ?auto_278934 ) ( ON ?auto_278936 ?auto_278935 ) ( ON ?auto_278937 ?auto_278936 ) ( not ( = ?auto_278934 ?auto_278935 ) ) ( not ( = ?auto_278934 ?auto_278936 ) ) ( not ( = ?auto_278934 ?auto_278937 ) ) ( not ( = ?auto_278934 ?auto_278938 ) ) ( not ( = ?auto_278934 ?auto_278939 ) ) ( not ( = ?auto_278934 ?auto_278940 ) ) ( not ( = ?auto_278934 ?auto_278941 ) ) ( not ( = ?auto_278934 ?auto_278942 ) ) ( not ( = ?auto_278934 ?auto_278943 ) ) ( not ( = ?auto_278934 ?auto_278944 ) ) ( not ( = ?auto_278934 ?auto_278945 ) ) ( not ( = ?auto_278934 ?auto_278946 ) ) ( not ( = ?auto_278934 ?auto_278947 ) ) ( not ( = ?auto_278935 ?auto_278936 ) ) ( not ( = ?auto_278935 ?auto_278937 ) ) ( not ( = ?auto_278935 ?auto_278938 ) ) ( not ( = ?auto_278935 ?auto_278939 ) ) ( not ( = ?auto_278935 ?auto_278940 ) ) ( not ( = ?auto_278935 ?auto_278941 ) ) ( not ( = ?auto_278935 ?auto_278942 ) ) ( not ( = ?auto_278935 ?auto_278943 ) ) ( not ( = ?auto_278935 ?auto_278944 ) ) ( not ( = ?auto_278935 ?auto_278945 ) ) ( not ( = ?auto_278935 ?auto_278946 ) ) ( not ( = ?auto_278935 ?auto_278947 ) ) ( not ( = ?auto_278936 ?auto_278937 ) ) ( not ( = ?auto_278936 ?auto_278938 ) ) ( not ( = ?auto_278936 ?auto_278939 ) ) ( not ( = ?auto_278936 ?auto_278940 ) ) ( not ( = ?auto_278936 ?auto_278941 ) ) ( not ( = ?auto_278936 ?auto_278942 ) ) ( not ( = ?auto_278936 ?auto_278943 ) ) ( not ( = ?auto_278936 ?auto_278944 ) ) ( not ( = ?auto_278936 ?auto_278945 ) ) ( not ( = ?auto_278936 ?auto_278946 ) ) ( not ( = ?auto_278936 ?auto_278947 ) ) ( not ( = ?auto_278937 ?auto_278938 ) ) ( not ( = ?auto_278937 ?auto_278939 ) ) ( not ( = ?auto_278937 ?auto_278940 ) ) ( not ( = ?auto_278937 ?auto_278941 ) ) ( not ( = ?auto_278937 ?auto_278942 ) ) ( not ( = ?auto_278937 ?auto_278943 ) ) ( not ( = ?auto_278937 ?auto_278944 ) ) ( not ( = ?auto_278937 ?auto_278945 ) ) ( not ( = ?auto_278937 ?auto_278946 ) ) ( not ( = ?auto_278937 ?auto_278947 ) ) ( not ( = ?auto_278938 ?auto_278939 ) ) ( not ( = ?auto_278938 ?auto_278940 ) ) ( not ( = ?auto_278938 ?auto_278941 ) ) ( not ( = ?auto_278938 ?auto_278942 ) ) ( not ( = ?auto_278938 ?auto_278943 ) ) ( not ( = ?auto_278938 ?auto_278944 ) ) ( not ( = ?auto_278938 ?auto_278945 ) ) ( not ( = ?auto_278938 ?auto_278946 ) ) ( not ( = ?auto_278938 ?auto_278947 ) ) ( not ( = ?auto_278939 ?auto_278940 ) ) ( not ( = ?auto_278939 ?auto_278941 ) ) ( not ( = ?auto_278939 ?auto_278942 ) ) ( not ( = ?auto_278939 ?auto_278943 ) ) ( not ( = ?auto_278939 ?auto_278944 ) ) ( not ( = ?auto_278939 ?auto_278945 ) ) ( not ( = ?auto_278939 ?auto_278946 ) ) ( not ( = ?auto_278939 ?auto_278947 ) ) ( not ( = ?auto_278940 ?auto_278941 ) ) ( not ( = ?auto_278940 ?auto_278942 ) ) ( not ( = ?auto_278940 ?auto_278943 ) ) ( not ( = ?auto_278940 ?auto_278944 ) ) ( not ( = ?auto_278940 ?auto_278945 ) ) ( not ( = ?auto_278940 ?auto_278946 ) ) ( not ( = ?auto_278940 ?auto_278947 ) ) ( not ( = ?auto_278941 ?auto_278942 ) ) ( not ( = ?auto_278941 ?auto_278943 ) ) ( not ( = ?auto_278941 ?auto_278944 ) ) ( not ( = ?auto_278941 ?auto_278945 ) ) ( not ( = ?auto_278941 ?auto_278946 ) ) ( not ( = ?auto_278941 ?auto_278947 ) ) ( not ( = ?auto_278942 ?auto_278943 ) ) ( not ( = ?auto_278942 ?auto_278944 ) ) ( not ( = ?auto_278942 ?auto_278945 ) ) ( not ( = ?auto_278942 ?auto_278946 ) ) ( not ( = ?auto_278942 ?auto_278947 ) ) ( not ( = ?auto_278943 ?auto_278944 ) ) ( not ( = ?auto_278943 ?auto_278945 ) ) ( not ( = ?auto_278943 ?auto_278946 ) ) ( not ( = ?auto_278943 ?auto_278947 ) ) ( not ( = ?auto_278944 ?auto_278945 ) ) ( not ( = ?auto_278944 ?auto_278946 ) ) ( not ( = ?auto_278944 ?auto_278947 ) ) ( not ( = ?auto_278945 ?auto_278946 ) ) ( not ( = ?auto_278945 ?auto_278947 ) ) ( not ( = ?auto_278946 ?auto_278947 ) ) ( ON ?auto_278946 ?auto_278947 ) ( ON ?auto_278945 ?auto_278946 ) ( ON ?auto_278944 ?auto_278945 ) ( ON ?auto_278943 ?auto_278944 ) ( ON ?auto_278942 ?auto_278943 ) ( ON ?auto_278941 ?auto_278942 ) ( ON ?auto_278940 ?auto_278941 ) ( ON ?auto_278939 ?auto_278940 ) ( CLEAR ?auto_278937 ) ( ON ?auto_278938 ?auto_278939 ) ( CLEAR ?auto_278938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_278934 ?auto_278935 ?auto_278936 ?auto_278937 ?auto_278938 )
      ( MAKE-14PILE ?auto_278934 ?auto_278935 ?auto_278936 ?auto_278937 ?auto_278938 ?auto_278939 ?auto_278940 ?auto_278941 ?auto_278942 ?auto_278943 ?auto_278944 ?auto_278945 ?auto_278946 ?auto_278947 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_278962 - BLOCK
      ?auto_278963 - BLOCK
      ?auto_278964 - BLOCK
      ?auto_278965 - BLOCK
      ?auto_278966 - BLOCK
      ?auto_278967 - BLOCK
      ?auto_278968 - BLOCK
      ?auto_278969 - BLOCK
      ?auto_278970 - BLOCK
      ?auto_278971 - BLOCK
      ?auto_278972 - BLOCK
      ?auto_278973 - BLOCK
      ?auto_278974 - BLOCK
      ?auto_278975 - BLOCK
    )
    :vars
    (
      ?auto_278976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_278975 ?auto_278976 ) ( ON-TABLE ?auto_278962 ) ( ON ?auto_278963 ?auto_278962 ) ( ON ?auto_278964 ?auto_278963 ) ( not ( = ?auto_278962 ?auto_278963 ) ) ( not ( = ?auto_278962 ?auto_278964 ) ) ( not ( = ?auto_278962 ?auto_278965 ) ) ( not ( = ?auto_278962 ?auto_278966 ) ) ( not ( = ?auto_278962 ?auto_278967 ) ) ( not ( = ?auto_278962 ?auto_278968 ) ) ( not ( = ?auto_278962 ?auto_278969 ) ) ( not ( = ?auto_278962 ?auto_278970 ) ) ( not ( = ?auto_278962 ?auto_278971 ) ) ( not ( = ?auto_278962 ?auto_278972 ) ) ( not ( = ?auto_278962 ?auto_278973 ) ) ( not ( = ?auto_278962 ?auto_278974 ) ) ( not ( = ?auto_278962 ?auto_278975 ) ) ( not ( = ?auto_278962 ?auto_278976 ) ) ( not ( = ?auto_278963 ?auto_278964 ) ) ( not ( = ?auto_278963 ?auto_278965 ) ) ( not ( = ?auto_278963 ?auto_278966 ) ) ( not ( = ?auto_278963 ?auto_278967 ) ) ( not ( = ?auto_278963 ?auto_278968 ) ) ( not ( = ?auto_278963 ?auto_278969 ) ) ( not ( = ?auto_278963 ?auto_278970 ) ) ( not ( = ?auto_278963 ?auto_278971 ) ) ( not ( = ?auto_278963 ?auto_278972 ) ) ( not ( = ?auto_278963 ?auto_278973 ) ) ( not ( = ?auto_278963 ?auto_278974 ) ) ( not ( = ?auto_278963 ?auto_278975 ) ) ( not ( = ?auto_278963 ?auto_278976 ) ) ( not ( = ?auto_278964 ?auto_278965 ) ) ( not ( = ?auto_278964 ?auto_278966 ) ) ( not ( = ?auto_278964 ?auto_278967 ) ) ( not ( = ?auto_278964 ?auto_278968 ) ) ( not ( = ?auto_278964 ?auto_278969 ) ) ( not ( = ?auto_278964 ?auto_278970 ) ) ( not ( = ?auto_278964 ?auto_278971 ) ) ( not ( = ?auto_278964 ?auto_278972 ) ) ( not ( = ?auto_278964 ?auto_278973 ) ) ( not ( = ?auto_278964 ?auto_278974 ) ) ( not ( = ?auto_278964 ?auto_278975 ) ) ( not ( = ?auto_278964 ?auto_278976 ) ) ( not ( = ?auto_278965 ?auto_278966 ) ) ( not ( = ?auto_278965 ?auto_278967 ) ) ( not ( = ?auto_278965 ?auto_278968 ) ) ( not ( = ?auto_278965 ?auto_278969 ) ) ( not ( = ?auto_278965 ?auto_278970 ) ) ( not ( = ?auto_278965 ?auto_278971 ) ) ( not ( = ?auto_278965 ?auto_278972 ) ) ( not ( = ?auto_278965 ?auto_278973 ) ) ( not ( = ?auto_278965 ?auto_278974 ) ) ( not ( = ?auto_278965 ?auto_278975 ) ) ( not ( = ?auto_278965 ?auto_278976 ) ) ( not ( = ?auto_278966 ?auto_278967 ) ) ( not ( = ?auto_278966 ?auto_278968 ) ) ( not ( = ?auto_278966 ?auto_278969 ) ) ( not ( = ?auto_278966 ?auto_278970 ) ) ( not ( = ?auto_278966 ?auto_278971 ) ) ( not ( = ?auto_278966 ?auto_278972 ) ) ( not ( = ?auto_278966 ?auto_278973 ) ) ( not ( = ?auto_278966 ?auto_278974 ) ) ( not ( = ?auto_278966 ?auto_278975 ) ) ( not ( = ?auto_278966 ?auto_278976 ) ) ( not ( = ?auto_278967 ?auto_278968 ) ) ( not ( = ?auto_278967 ?auto_278969 ) ) ( not ( = ?auto_278967 ?auto_278970 ) ) ( not ( = ?auto_278967 ?auto_278971 ) ) ( not ( = ?auto_278967 ?auto_278972 ) ) ( not ( = ?auto_278967 ?auto_278973 ) ) ( not ( = ?auto_278967 ?auto_278974 ) ) ( not ( = ?auto_278967 ?auto_278975 ) ) ( not ( = ?auto_278967 ?auto_278976 ) ) ( not ( = ?auto_278968 ?auto_278969 ) ) ( not ( = ?auto_278968 ?auto_278970 ) ) ( not ( = ?auto_278968 ?auto_278971 ) ) ( not ( = ?auto_278968 ?auto_278972 ) ) ( not ( = ?auto_278968 ?auto_278973 ) ) ( not ( = ?auto_278968 ?auto_278974 ) ) ( not ( = ?auto_278968 ?auto_278975 ) ) ( not ( = ?auto_278968 ?auto_278976 ) ) ( not ( = ?auto_278969 ?auto_278970 ) ) ( not ( = ?auto_278969 ?auto_278971 ) ) ( not ( = ?auto_278969 ?auto_278972 ) ) ( not ( = ?auto_278969 ?auto_278973 ) ) ( not ( = ?auto_278969 ?auto_278974 ) ) ( not ( = ?auto_278969 ?auto_278975 ) ) ( not ( = ?auto_278969 ?auto_278976 ) ) ( not ( = ?auto_278970 ?auto_278971 ) ) ( not ( = ?auto_278970 ?auto_278972 ) ) ( not ( = ?auto_278970 ?auto_278973 ) ) ( not ( = ?auto_278970 ?auto_278974 ) ) ( not ( = ?auto_278970 ?auto_278975 ) ) ( not ( = ?auto_278970 ?auto_278976 ) ) ( not ( = ?auto_278971 ?auto_278972 ) ) ( not ( = ?auto_278971 ?auto_278973 ) ) ( not ( = ?auto_278971 ?auto_278974 ) ) ( not ( = ?auto_278971 ?auto_278975 ) ) ( not ( = ?auto_278971 ?auto_278976 ) ) ( not ( = ?auto_278972 ?auto_278973 ) ) ( not ( = ?auto_278972 ?auto_278974 ) ) ( not ( = ?auto_278972 ?auto_278975 ) ) ( not ( = ?auto_278972 ?auto_278976 ) ) ( not ( = ?auto_278973 ?auto_278974 ) ) ( not ( = ?auto_278973 ?auto_278975 ) ) ( not ( = ?auto_278973 ?auto_278976 ) ) ( not ( = ?auto_278974 ?auto_278975 ) ) ( not ( = ?auto_278974 ?auto_278976 ) ) ( not ( = ?auto_278975 ?auto_278976 ) ) ( ON ?auto_278974 ?auto_278975 ) ( ON ?auto_278973 ?auto_278974 ) ( ON ?auto_278972 ?auto_278973 ) ( ON ?auto_278971 ?auto_278972 ) ( ON ?auto_278970 ?auto_278971 ) ( ON ?auto_278969 ?auto_278970 ) ( ON ?auto_278968 ?auto_278969 ) ( ON ?auto_278967 ?auto_278968 ) ( ON ?auto_278966 ?auto_278967 ) ( CLEAR ?auto_278964 ) ( ON ?auto_278965 ?auto_278966 ) ( CLEAR ?auto_278965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_278962 ?auto_278963 ?auto_278964 ?auto_278965 )
      ( MAKE-14PILE ?auto_278962 ?auto_278963 ?auto_278964 ?auto_278965 ?auto_278966 ?auto_278967 ?auto_278968 ?auto_278969 ?auto_278970 ?auto_278971 ?auto_278972 ?auto_278973 ?auto_278974 ?auto_278975 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_278991 - BLOCK
      ?auto_278992 - BLOCK
      ?auto_278993 - BLOCK
      ?auto_278994 - BLOCK
      ?auto_278995 - BLOCK
      ?auto_278996 - BLOCK
      ?auto_278997 - BLOCK
      ?auto_278998 - BLOCK
      ?auto_278999 - BLOCK
      ?auto_279000 - BLOCK
      ?auto_279001 - BLOCK
      ?auto_279002 - BLOCK
      ?auto_279003 - BLOCK
      ?auto_279004 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_279004 ) ( ON-TABLE ?auto_278991 ) ( ON ?auto_278992 ?auto_278991 ) ( ON ?auto_278993 ?auto_278992 ) ( not ( = ?auto_278991 ?auto_278992 ) ) ( not ( = ?auto_278991 ?auto_278993 ) ) ( not ( = ?auto_278991 ?auto_278994 ) ) ( not ( = ?auto_278991 ?auto_278995 ) ) ( not ( = ?auto_278991 ?auto_278996 ) ) ( not ( = ?auto_278991 ?auto_278997 ) ) ( not ( = ?auto_278991 ?auto_278998 ) ) ( not ( = ?auto_278991 ?auto_278999 ) ) ( not ( = ?auto_278991 ?auto_279000 ) ) ( not ( = ?auto_278991 ?auto_279001 ) ) ( not ( = ?auto_278991 ?auto_279002 ) ) ( not ( = ?auto_278991 ?auto_279003 ) ) ( not ( = ?auto_278991 ?auto_279004 ) ) ( not ( = ?auto_278992 ?auto_278993 ) ) ( not ( = ?auto_278992 ?auto_278994 ) ) ( not ( = ?auto_278992 ?auto_278995 ) ) ( not ( = ?auto_278992 ?auto_278996 ) ) ( not ( = ?auto_278992 ?auto_278997 ) ) ( not ( = ?auto_278992 ?auto_278998 ) ) ( not ( = ?auto_278992 ?auto_278999 ) ) ( not ( = ?auto_278992 ?auto_279000 ) ) ( not ( = ?auto_278992 ?auto_279001 ) ) ( not ( = ?auto_278992 ?auto_279002 ) ) ( not ( = ?auto_278992 ?auto_279003 ) ) ( not ( = ?auto_278992 ?auto_279004 ) ) ( not ( = ?auto_278993 ?auto_278994 ) ) ( not ( = ?auto_278993 ?auto_278995 ) ) ( not ( = ?auto_278993 ?auto_278996 ) ) ( not ( = ?auto_278993 ?auto_278997 ) ) ( not ( = ?auto_278993 ?auto_278998 ) ) ( not ( = ?auto_278993 ?auto_278999 ) ) ( not ( = ?auto_278993 ?auto_279000 ) ) ( not ( = ?auto_278993 ?auto_279001 ) ) ( not ( = ?auto_278993 ?auto_279002 ) ) ( not ( = ?auto_278993 ?auto_279003 ) ) ( not ( = ?auto_278993 ?auto_279004 ) ) ( not ( = ?auto_278994 ?auto_278995 ) ) ( not ( = ?auto_278994 ?auto_278996 ) ) ( not ( = ?auto_278994 ?auto_278997 ) ) ( not ( = ?auto_278994 ?auto_278998 ) ) ( not ( = ?auto_278994 ?auto_278999 ) ) ( not ( = ?auto_278994 ?auto_279000 ) ) ( not ( = ?auto_278994 ?auto_279001 ) ) ( not ( = ?auto_278994 ?auto_279002 ) ) ( not ( = ?auto_278994 ?auto_279003 ) ) ( not ( = ?auto_278994 ?auto_279004 ) ) ( not ( = ?auto_278995 ?auto_278996 ) ) ( not ( = ?auto_278995 ?auto_278997 ) ) ( not ( = ?auto_278995 ?auto_278998 ) ) ( not ( = ?auto_278995 ?auto_278999 ) ) ( not ( = ?auto_278995 ?auto_279000 ) ) ( not ( = ?auto_278995 ?auto_279001 ) ) ( not ( = ?auto_278995 ?auto_279002 ) ) ( not ( = ?auto_278995 ?auto_279003 ) ) ( not ( = ?auto_278995 ?auto_279004 ) ) ( not ( = ?auto_278996 ?auto_278997 ) ) ( not ( = ?auto_278996 ?auto_278998 ) ) ( not ( = ?auto_278996 ?auto_278999 ) ) ( not ( = ?auto_278996 ?auto_279000 ) ) ( not ( = ?auto_278996 ?auto_279001 ) ) ( not ( = ?auto_278996 ?auto_279002 ) ) ( not ( = ?auto_278996 ?auto_279003 ) ) ( not ( = ?auto_278996 ?auto_279004 ) ) ( not ( = ?auto_278997 ?auto_278998 ) ) ( not ( = ?auto_278997 ?auto_278999 ) ) ( not ( = ?auto_278997 ?auto_279000 ) ) ( not ( = ?auto_278997 ?auto_279001 ) ) ( not ( = ?auto_278997 ?auto_279002 ) ) ( not ( = ?auto_278997 ?auto_279003 ) ) ( not ( = ?auto_278997 ?auto_279004 ) ) ( not ( = ?auto_278998 ?auto_278999 ) ) ( not ( = ?auto_278998 ?auto_279000 ) ) ( not ( = ?auto_278998 ?auto_279001 ) ) ( not ( = ?auto_278998 ?auto_279002 ) ) ( not ( = ?auto_278998 ?auto_279003 ) ) ( not ( = ?auto_278998 ?auto_279004 ) ) ( not ( = ?auto_278999 ?auto_279000 ) ) ( not ( = ?auto_278999 ?auto_279001 ) ) ( not ( = ?auto_278999 ?auto_279002 ) ) ( not ( = ?auto_278999 ?auto_279003 ) ) ( not ( = ?auto_278999 ?auto_279004 ) ) ( not ( = ?auto_279000 ?auto_279001 ) ) ( not ( = ?auto_279000 ?auto_279002 ) ) ( not ( = ?auto_279000 ?auto_279003 ) ) ( not ( = ?auto_279000 ?auto_279004 ) ) ( not ( = ?auto_279001 ?auto_279002 ) ) ( not ( = ?auto_279001 ?auto_279003 ) ) ( not ( = ?auto_279001 ?auto_279004 ) ) ( not ( = ?auto_279002 ?auto_279003 ) ) ( not ( = ?auto_279002 ?auto_279004 ) ) ( not ( = ?auto_279003 ?auto_279004 ) ) ( ON ?auto_279003 ?auto_279004 ) ( ON ?auto_279002 ?auto_279003 ) ( ON ?auto_279001 ?auto_279002 ) ( ON ?auto_279000 ?auto_279001 ) ( ON ?auto_278999 ?auto_279000 ) ( ON ?auto_278998 ?auto_278999 ) ( ON ?auto_278997 ?auto_278998 ) ( ON ?auto_278996 ?auto_278997 ) ( ON ?auto_278995 ?auto_278996 ) ( CLEAR ?auto_278993 ) ( ON ?auto_278994 ?auto_278995 ) ( CLEAR ?auto_278994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_278991 ?auto_278992 ?auto_278993 ?auto_278994 )
      ( MAKE-14PILE ?auto_278991 ?auto_278992 ?auto_278993 ?auto_278994 ?auto_278995 ?auto_278996 ?auto_278997 ?auto_278998 ?auto_278999 ?auto_279000 ?auto_279001 ?auto_279002 ?auto_279003 ?auto_279004 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_279019 - BLOCK
      ?auto_279020 - BLOCK
      ?auto_279021 - BLOCK
      ?auto_279022 - BLOCK
      ?auto_279023 - BLOCK
      ?auto_279024 - BLOCK
      ?auto_279025 - BLOCK
      ?auto_279026 - BLOCK
      ?auto_279027 - BLOCK
      ?auto_279028 - BLOCK
      ?auto_279029 - BLOCK
      ?auto_279030 - BLOCK
      ?auto_279031 - BLOCK
      ?auto_279032 - BLOCK
    )
    :vars
    (
      ?auto_279033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279032 ?auto_279033 ) ( ON-TABLE ?auto_279019 ) ( ON ?auto_279020 ?auto_279019 ) ( not ( = ?auto_279019 ?auto_279020 ) ) ( not ( = ?auto_279019 ?auto_279021 ) ) ( not ( = ?auto_279019 ?auto_279022 ) ) ( not ( = ?auto_279019 ?auto_279023 ) ) ( not ( = ?auto_279019 ?auto_279024 ) ) ( not ( = ?auto_279019 ?auto_279025 ) ) ( not ( = ?auto_279019 ?auto_279026 ) ) ( not ( = ?auto_279019 ?auto_279027 ) ) ( not ( = ?auto_279019 ?auto_279028 ) ) ( not ( = ?auto_279019 ?auto_279029 ) ) ( not ( = ?auto_279019 ?auto_279030 ) ) ( not ( = ?auto_279019 ?auto_279031 ) ) ( not ( = ?auto_279019 ?auto_279032 ) ) ( not ( = ?auto_279019 ?auto_279033 ) ) ( not ( = ?auto_279020 ?auto_279021 ) ) ( not ( = ?auto_279020 ?auto_279022 ) ) ( not ( = ?auto_279020 ?auto_279023 ) ) ( not ( = ?auto_279020 ?auto_279024 ) ) ( not ( = ?auto_279020 ?auto_279025 ) ) ( not ( = ?auto_279020 ?auto_279026 ) ) ( not ( = ?auto_279020 ?auto_279027 ) ) ( not ( = ?auto_279020 ?auto_279028 ) ) ( not ( = ?auto_279020 ?auto_279029 ) ) ( not ( = ?auto_279020 ?auto_279030 ) ) ( not ( = ?auto_279020 ?auto_279031 ) ) ( not ( = ?auto_279020 ?auto_279032 ) ) ( not ( = ?auto_279020 ?auto_279033 ) ) ( not ( = ?auto_279021 ?auto_279022 ) ) ( not ( = ?auto_279021 ?auto_279023 ) ) ( not ( = ?auto_279021 ?auto_279024 ) ) ( not ( = ?auto_279021 ?auto_279025 ) ) ( not ( = ?auto_279021 ?auto_279026 ) ) ( not ( = ?auto_279021 ?auto_279027 ) ) ( not ( = ?auto_279021 ?auto_279028 ) ) ( not ( = ?auto_279021 ?auto_279029 ) ) ( not ( = ?auto_279021 ?auto_279030 ) ) ( not ( = ?auto_279021 ?auto_279031 ) ) ( not ( = ?auto_279021 ?auto_279032 ) ) ( not ( = ?auto_279021 ?auto_279033 ) ) ( not ( = ?auto_279022 ?auto_279023 ) ) ( not ( = ?auto_279022 ?auto_279024 ) ) ( not ( = ?auto_279022 ?auto_279025 ) ) ( not ( = ?auto_279022 ?auto_279026 ) ) ( not ( = ?auto_279022 ?auto_279027 ) ) ( not ( = ?auto_279022 ?auto_279028 ) ) ( not ( = ?auto_279022 ?auto_279029 ) ) ( not ( = ?auto_279022 ?auto_279030 ) ) ( not ( = ?auto_279022 ?auto_279031 ) ) ( not ( = ?auto_279022 ?auto_279032 ) ) ( not ( = ?auto_279022 ?auto_279033 ) ) ( not ( = ?auto_279023 ?auto_279024 ) ) ( not ( = ?auto_279023 ?auto_279025 ) ) ( not ( = ?auto_279023 ?auto_279026 ) ) ( not ( = ?auto_279023 ?auto_279027 ) ) ( not ( = ?auto_279023 ?auto_279028 ) ) ( not ( = ?auto_279023 ?auto_279029 ) ) ( not ( = ?auto_279023 ?auto_279030 ) ) ( not ( = ?auto_279023 ?auto_279031 ) ) ( not ( = ?auto_279023 ?auto_279032 ) ) ( not ( = ?auto_279023 ?auto_279033 ) ) ( not ( = ?auto_279024 ?auto_279025 ) ) ( not ( = ?auto_279024 ?auto_279026 ) ) ( not ( = ?auto_279024 ?auto_279027 ) ) ( not ( = ?auto_279024 ?auto_279028 ) ) ( not ( = ?auto_279024 ?auto_279029 ) ) ( not ( = ?auto_279024 ?auto_279030 ) ) ( not ( = ?auto_279024 ?auto_279031 ) ) ( not ( = ?auto_279024 ?auto_279032 ) ) ( not ( = ?auto_279024 ?auto_279033 ) ) ( not ( = ?auto_279025 ?auto_279026 ) ) ( not ( = ?auto_279025 ?auto_279027 ) ) ( not ( = ?auto_279025 ?auto_279028 ) ) ( not ( = ?auto_279025 ?auto_279029 ) ) ( not ( = ?auto_279025 ?auto_279030 ) ) ( not ( = ?auto_279025 ?auto_279031 ) ) ( not ( = ?auto_279025 ?auto_279032 ) ) ( not ( = ?auto_279025 ?auto_279033 ) ) ( not ( = ?auto_279026 ?auto_279027 ) ) ( not ( = ?auto_279026 ?auto_279028 ) ) ( not ( = ?auto_279026 ?auto_279029 ) ) ( not ( = ?auto_279026 ?auto_279030 ) ) ( not ( = ?auto_279026 ?auto_279031 ) ) ( not ( = ?auto_279026 ?auto_279032 ) ) ( not ( = ?auto_279026 ?auto_279033 ) ) ( not ( = ?auto_279027 ?auto_279028 ) ) ( not ( = ?auto_279027 ?auto_279029 ) ) ( not ( = ?auto_279027 ?auto_279030 ) ) ( not ( = ?auto_279027 ?auto_279031 ) ) ( not ( = ?auto_279027 ?auto_279032 ) ) ( not ( = ?auto_279027 ?auto_279033 ) ) ( not ( = ?auto_279028 ?auto_279029 ) ) ( not ( = ?auto_279028 ?auto_279030 ) ) ( not ( = ?auto_279028 ?auto_279031 ) ) ( not ( = ?auto_279028 ?auto_279032 ) ) ( not ( = ?auto_279028 ?auto_279033 ) ) ( not ( = ?auto_279029 ?auto_279030 ) ) ( not ( = ?auto_279029 ?auto_279031 ) ) ( not ( = ?auto_279029 ?auto_279032 ) ) ( not ( = ?auto_279029 ?auto_279033 ) ) ( not ( = ?auto_279030 ?auto_279031 ) ) ( not ( = ?auto_279030 ?auto_279032 ) ) ( not ( = ?auto_279030 ?auto_279033 ) ) ( not ( = ?auto_279031 ?auto_279032 ) ) ( not ( = ?auto_279031 ?auto_279033 ) ) ( not ( = ?auto_279032 ?auto_279033 ) ) ( ON ?auto_279031 ?auto_279032 ) ( ON ?auto_279030 ?auto_279031 ) ( ON ?auto_279029 ?auto_279030 ) ( ON ?auto_279028 ?auto_279029 ) ( ON ?auto_279027 ?auto_279028 ) ( ON ?auto_279026 ?auto_279027 ) ( ON ?auto_279025 ?auto_279026 ) ( ON ?auto_279024 ?auto_279025 ) ( ON ?auto_279023 ?auto_279024 ) ( ON ?auto_279022 ?auto_279023 ) ( CLEAR ?auto_279020 ) ( ON ?auto_279021 ?auto_279022 ) ( CLEAR ?auto_279021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_279019 ?auto_279020 ?auto_279021 )
      ( MAKE-14PILE ?auto_279019 ?auto_279020 ?auto_279021 ?auto_279022 ?auto_279023 ?auto_279024 ?auto_279025 ?auto_279026 ?auto_279027 ?auto_279028 ?auto_279029 ?auto_279030 ?auto_279031 ?auto_279032 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_279048 - BLOCK
      ?auto_279049 - BLOCK
      ?auto_279050 - BLOCK
      ?auto_279051 - BLOCK
      ?auto_279052 - BLOCK
      ?auto_279053 - BLOCK
      ?auto_279054 - BLOCK
      ?auto_279055 - BLOCK
      ?auto_279056 - BLOCK
      ?auto_279057 - BLOCK
      ?auto_279058 - BLOCK
      ?auto_279059 - BLOCK
      ?auto_279060 - BLOCK
      ?auto_279061 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_279061 ) ( ON-TABLE ?auto_279048 ) ( ON ?auto_279049 ?auto_279048 ) ( not ( = ?auto_279048 ?auto_279049 ) ) ( not ( = ?auto_279048 ?auto_279050 ) ) ( not ( = ?auto_279048 ?auto_279051 ) ) ( not ( = ?auto_279048 ?auto_279052 ) ) ( not ( = ?auto_279048 ?auto_279053 ) ) ( not ( = ?auto_279048 ?auto_279054 ) ) ( not ( = ?auto_279048 ?auto_279055 ) ) ( not ( = ?auto_279048 ?auto_279056 ) ) ( not ( = ?auto_279048 ?auto_279057 ) ) ( not ( = ?auto_279048 ?auto_279058 ) ) ( not ( = ?auto_279048 ?auto_279059 ) ) ( not ( = ?auto_279048 ?auto_279060 ) ) ( not ( = ?auto_279048 ?auto_279061 ) ) ( not ( = ?auto_279049 ?auto_279050 ) ) ( not ( = ?auto_279049 ?auto_279051 ) ) ( not ( = ?auto_279049 ?auto_279052 ) ) ( not ( = ?auto_279049 ?auto_279053 ) ) ( not ( = ?auto_279049 ?auto_279054 ) ) ( not ( = ?auto_279049 ?auto_279055 ) ) ( not ( = ?auto_279049 ?auto_279056 ) ) ( not ( = ?auto_279049 ?auto_279057 ) ) ( not ( = ?auto_279049 ?auto_279058 ) ) ( not ( = ?auto_279049 ?auto_279059 ) ) ( not ( = ?auto_279049 ?auto_279060 ) ) ( not ( = ?auto_279049 ?auto_279061 ) ) ( not ( = ?auto_279050 ?auto_279051 ) ) ( not ( = ?auto_279050 ?auto_279052 ) ) ( not ( = ?auto_279050 ?auto_279053 ) ) ( not ( = ?auto_279050 ?auto_279054 ) ) ( not ( = ?auto_279050 ?auto_279055 ) ) ( not ( = ?auto_279050 ?auto_279056 ) ) ( not ( = ?auto_279050 ?auto_279057 ) ) ( not ( = ?auto_279050 ?auto_279058 ) ) ( not ( = ?auto_279050 ?auto_279059 ) ) ( not ( = ?auto_279050 ?auto_279060 ) ) ( not ( = ?auto_279050 ?auto_279061 ) ) ( not ( = ?auto_279051 ?auto_279052 ) ) ( not ( = ?auto_279051 ?auto_279053 ) ) ( not ( = ?auto_279051 ?auto_279054 ) ) ( not ( = ?auto_279051 ?auto_279055 ) ) ( not ( = ?auto_279051 ?auto_279056 ) ) ( not ( = ?auto_279051 ?auto_279057 ) ) ( not ( = ?auto_279051 ?auto_279058 ) ) ( not ( = ?auto_279051 ?auto_279059 ) ) ( not ( = ?auto_279051 ?auto_279060 ) ) ( not ( = ?auto_279051 ?auto_279061 ) ) ( not ( = ?auto_279052 ?auto_279053 ) ) ( not ( = ?auto_279052 ?auto_279054 ) ) ( not ( = ?auto_279052 ?auto_279055 ) ) ( not ( = ?auto_279052 ?auto_279056 ) ) ( not ( = ?auto_279052 ?auto_279057 ) ) ( not ( = ?auto_279052 ?auto_279058 ) ) ( not ( = ?auto_279052 ?auto_279059 ) ) ( not ( = ?auto_279052 ?auto_279060 ) ) ( not ( = ?auto_279052 ?auto_279061 ) ) ( not ( = ?auto_279053 ?auto_279054 ) ) ( not ( = ?auto_279053 ?auto_279055 ) ) ( not ( = ?auto_279053 ?auto_279056 ) ) ( not ( = ?auto_279053 ?auto_279057 ) ) ( not ( = ?auto_279053 ?auto_279058 ) ) ( not ( = ?auto_279053 ?auto_279059 ) ) ( not ( = ?auto_279053 ?auto_279060 ) ) ( not ( = ?auto_279053 ?auto_279061 ) ) ( not ( = ?auto_279054 ?auto_279055 ) ) ( not ( = ?auto_279054 ?auto_279056 ) ) ( not ( = ?auto_279054 ?auto_279057 ) ) ( not ( = ?auto_279054 ?auto_279058 ) ) ( not ( = ?auto_279054 ?auto_279059 ) ) ( not ( = ?auto_279054 ?auto_279060 ) ) ( not ( = ?auto_279054 ?auto_279061 ) ) ( not ( = ?auto_279055 ?auto_279056 ) ) ( not ( = ?auto_279055 ?auto_279057 ) ) ( not ( = ?auto_279055 ?auto_279058 ) ) ( not ( = ?auto_279055 ?auto_279059 ) ) ( not ( = ?auto_279055 ?auto_279060 ) ) ( not ( = ?auto_279055 ?auto_279061 ) ) ( not ( = ?auto_279056 ?auto_279057 ) ) ( not ( = ?auto_279056 ?auto_279058 ) ) ( not ( = ?auto_279056 ?auto_279059 ) ) ( not ( = ?auto_279056 ?auto_279060 ) ) ( not ( = ?auto_279056 ?auto_279061 ) ) ( not ( = ?auto_279057 ?auto_279058 ) ) ( not ( = ?auto_279057 ?auto_279059 ) ) ( not ( = ?auto_279057 ?auto_279060 ) ) ( not ( = ?auto_279057 ?auto_279061 ) ) ( not ( = ?auto_279058 ?auto_279059 ) ) ( not ( = ?auto_279058 ?auto_279060 ) ) ( not ( = ?auto_279058 ?auto_279061 ) ) ( not ( = ?auto_279059 ?auto_279060 ) ) ( not ( = ?auto_279059 ?auto_279061 ) ) ( not ( = ?auto_279060 ?auto_279061 ) ) ( ON ?auto_279060 ?auto_279061 ) ( ON ?auto_279059 ?auto_279060 ) ( ON ?auto_279058 ?auto_279059 ) ( ON ?auto_279057 ?auto_279058 ) ( ON ?auto_279056 ?auto_279057 ) ( ON ?auto_279055 ?auto_279056 ) ( ON ?auto_279054 ?auto_279055 ) ( ON ?auto_279053 ?auto_279054 ) ( ON ?auto_279052 ?auto_279053 ) ( ON ?auto_279051 ?auto_279052 ) ( CLEAR ?auto_279049 ) ( ON ?auto_279050 ?auto_279051 ) ( CLEAR ?auto_279050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_279048 ?auto_279049 ?auto_279050 )
      ( MAKE-14PILE ?auto_279048 ?auto_279049 ?auto_279050 ?auto_279051 ?auto_279052 ?auto_279053 ?auto_279054 ?auto_279055 ?auto_279056 ?auto_279057 ?auto_279058 ?auto_279059 ?auto_279060 ?auto_279061 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_279076 - BLOCK
      ?auto_279077 - BLOCK
      ?auto_279078 - BLOCK
      ?auto_279079 - BLOCK
      ?auto_279080 - BLOCK
      ?auto_279081 - BLOCK
      ?auto_279082 - BLOCK
      ?auto_279083 - BLOCK
      ?auto_279084 - BLOCK
      ?auto_279085 - BLOCK
      ?auto_279086 - BLOCK
      ?auto_279087 - BLOCK
      ?auto_279088 - BLOCK
      ?auto_279089 - BLOCK
    )
    :vars
    (
      ?auto_279090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279089 ?auto_279090 ) ( ON-TABLE ?auto_279076 ) ( not ( = ?auto_279076 ?auto_279077 ) ) ( not ( = ?auto_279076 ?auto_279078 ) ) ( not ( = ?auto_279076 ?auto_279079 ) ) ( not ( = ?auto_279076 ?auto_279080 ) ) ( not ( = ?auto_279076 ?auto_279081 ) ) ( not ( = ?auto_279076 ?auto_279082 ) ) ( not ( = ?auto_279076 ?auto_279083 ) ) ( not ( = ?auto_279076 ?auto_279084 ) ) ( not ( = ?auto_279076 ?auto_279085 ) ) ( not ( = ?auto_279076 ?auto_279086 ) ) ( not ( = ?auto_279076 ?auto_279087 ) ) ( not ( = ?auto_279076 ?auto_279088 ) ) ( not ( = ?auto_279076 ?auto_279089 ) ) ( not ( = ?auto_279076 ?auto_279090 ) ) ( not ( = ?auto_279077 ?auto_279078 ) ) ( not ( = ?auto_279077 ?auto_279079 ) ) ( not ( = ?auto_279077 ?auto_279080 ) ) ( not ( = ?auto_279077 ?auto_279081 ) ) ( not ( = ?auto_279077 ?auto_279082 ) ) ( not ( = ?auto_279077 ?auto_279083 ) ) ( not ( = ?auto_279077 ?auto_279084 ) ) ( not ( = ?auto_279077 ?auto_279085 ) ) ( not ( = ?auto_279077 ?auto_279086 ) ) ( not ( = ?auto_279077 ?auto_279087 ) ) ( not ( = ?auto_279077 ?auto_279088 ) ) ( not ( = ?auto_279077 ?auto_279089 ) ) ( not ( = ?auto_279077 ?auto_279090 ) ) ( not ( = ?auto_279078 ?auto_279079 ) ) ( not ( = ?auto_279078 ?auto_279080 ) ) ( not ( = ?auto_279078 ?auto_279081 ) ) ( not ( = ?auto_279078 ?auto_279082 ) ) ( not ( = ?auto_279078 ?auto_279083 ) ) ( not ( = ?auto_279078 ?auto_279084 ) ) ( not ( = ?auto_279078 ?auto_279085 ) ) ( not ( = ?auto_279078 ?auto_279086 ) ) ( not ( = ?auto_279078 ?auto_279087 ) ) ( not ( = ?auto_279078 ?auto_279088 ) ) ( not ( = ?auto_279078 ?auto_279089 ) ) ( not ( = ?auto_279078 ?auto_279090 ) ) ( not ( = ?auto_279079 ?auto_279080 ) ) ( not ( = ?auto_279079 ?auto_279081 ) ) ( not ( = ?auto_279079 ?auto_279082 ) ) ( not ( = ?auto_279079 ?auto_279083 ) ) ( not ( = ?auto_279079 ?auto_279084 ) ) ( not ( = ?auto_279079 ?auto_279085 ) ) ( not ( = ?auto_279079 ?auto_279086 ) ) ( not ( = ?auto_279079 ?auto_279087 ) ) ( not ( = ?auto_279079 ?auto_279088 ) ) ( not ( = ?auto_279079 ?auto_279089 ) ) ( not ( = ?auto_279079 ?auto_279090 ) ) ( not ( = ?auto_279080 ?auto_279081 ) ) ( not ( = ?auto_279080 ?auto_279082 ) ) ( not ( = ?auto_279080 ?auto_279083 ) ) ( not ( = ?auto_279080 ?auto_279084 ) ) ( not ( = ?auto_279080 ?auto_279085 ) ) ( not ( = ?auto_279080 ?auto_279086 ) ) ( not ( = ?auto_279080 ?auto_279087 ) ) ( not ( = ?auto_279080 ?auto_279088 ) ) ( not ( = ?auto_279080 ?auto_279089 ) ) ( not ( = ?auto_279080 ?auto_279090 ) ) ( not ( = ?auto_279081 ?auto_279082 ) ) ( not ( = ?auto_279081 ?auto_279083 ) ) ( not ( = ?auto_279081 ?auto_279084 ) ) ( not ( = ?auto_279081 ?auto_279085 ) ) ( not ( = ?auto_279081 ?auto_279086 ) ) ( not ( = ?auto_279081 ?auto_279087 ) ) ( not ( = ?auto_279081 ?auto_279088 ) ) ( not ( = ?auto_279081 ?auto_279089 ) ) ( not ( = ?auto_279081 ?auto_279090 ) ) ( not ( = ?auto_279082 ?auto_279083 ) ) ( not ( = ?auto_279082 ?auto_279084 ) ) ( not ( = ?auto_279082 ?auto_279085 ) ) ( not ( = ?auto_279082 ?auto_279086 ) ) ( not ( = ?auto_279082 ?auto_279087 ) ) ( not ( = ?auto_279082 ?auto_279088 ) ) ( not ( = ?auto_279082 ?auto_279089 ) ) ( not ( = ?auto_279082 ?auto_279090 ) ) ( not ( = ?auto_279083 ?auto_279084 ) ) ( not ( = ?auto_279083 ?auto_279085 ) ) ( not ( = ?auto_279083 ?auto_279086 ) ) ( not ( = ?auto_279083 ?auto_279087 ) ) ( not ( = ?auto_279083 ?auto_279088 ) ) ( not ( = ?auto_279083 ?auto_279089 ) ) ( not ( = ?auto_279083 ?auto_279090 ) ) ( not ( = ?auto_279084 ?auto_279085 ) ) ( not ( = ?auto_279084 ?auto_279086 ) ) ( not ( = ?auto_279084 ?auto_279087 ) ) ( not ( = ?auto_279084 ?auto_279088 ) ) ( not ( = ?auto_279084 ?auto_279089 ) ) ( not ( = ?auto_279084 ?auto_279090 ) ) ( not ( = ?auto_279085 ?auto_279086 ) ) ( not ( = ?auto_279085 ?auto_279087 ) ) ( not ( = ?auto_279085 ?auto_279088 ) ) ( not ( = ?auto_279085 ?auto_279089 ) ) ( not ( = ?auto_279085 ?auto_279090 ) ) ( not ( = ?auto_279086 ?auto_279087 ) ) ( not ( = ?auto_279086 ?auto_279088 ) ) ( not ( = ?auto_279086 ?auto_279089 ) ) ( not ( = ?auto_279086 ?auto_279090 ) ) ( not ( = ?auto_279087 ?auto_279088 ) ) ( not ( = ?auto_279087 ?auto_279089 ) ) ( not ( = ?auto_279087 ?auto_279090 ) ) ( not ( = ?auto_279088 ?auto_279089 ) ) ( not ( = ?auto_279088 ?auto_279090 ) ) ( not ( = ?auto_279089 ?auto_279090 ) ) ( ON ?auto_279088 ?auto_279089 ) ( ON ?auto_279087 ?auto_279088 ) ( ON ?auto_279086 ?auto_279087 ) ( ON ?auto_279085 ?auto_279086 ) ( ON ?auto_279084 ?auto_279085 ) ( ON ?auto_279083 ?auto_279084 ) ( ON ?auto_279082 ?auto_279083 ) ( ON ?auto_279081 ?auto_279082 ) ( ON ?auto_279080 ?auto_279081 ) ( ON ?auto_279079 ?auto_279080 ) ( ON ?auto_279078 ?auto_279079 ) ( CLEAR ?auto_279076 ) ( ON ?auto_279077 ?auto_279078 ) ( CLEAR ?auto_279077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_279076 ?auto_279077 )
      ( MAKE-14PILE ?auto_279076 ?auto_279077 ?auto_279078 ?auto_279079 ?auto_279080 ?auto_279081 ?auto_279082 ?auto_279083 ?auto_279084 ?auto_279085 ?auto_279086 ?auto_279087 ?auto_279088 ?auto_279089 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_279105 - BLOCK
      ?auto_279106 - BLOCK
      ?auto_279107 - BLOCK
      ?auto_279108 - BLOCK
      ?auto_279109 - BLOCK
      ?auto_279110 - BLOCK
      ?auto_279111 - BLOCK
      ?auto_279112 - BLOCK
      ?auto_279113 - BLOCK
      ?auto_279114 - BLOCK
      ?auto_279115 - BLOCK
      ?auto_279116 - BLOCK
      ?auto_279117 - BLOCK
      ?auto_279118 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_279118 ) ( ON-TABLE ?auto_279105 ) ( not ( = ?auto_279105 ?auto_279106 ) ) ( not ( = ?auto_279105 ?auto_279107 ) ) ( not ( = ?auto_279105 ?auto_279108 ) ) ( not ( = ?auto_279105 ?auto_279109 ) ) ( not ( = ?auto_279105 ?auto_279110 ) ) ( not ( = ?auto_279105 ?auto_279111 ) ) ( not ( = ?auto_279105 ?auto_279112 ) ) ( not ( = ?auto_279105 ?auto_279113 ) ) ( not ( = ?auto_279105 ?auto_279114 ) ) ( not ( = ?auto_279105 ?auto_279115 ) ) ( not ( = ?auto_279105 ?auto_279116 ) ) ( not ( = ?auto_279105 ?auto_279117 ) ) ( not ( = ?auto_279105 ?auto_279118 ) ) ( not ( = ?auto_279106 ?auto_279107 ) ) ( not ( = ?auto_279106 ?auto_279108 ) ) ( not ( = ?auto_279106 ?auto_279109 ) ) ( not ( = ?auto_279106 ?auto_279110 ) ) ( not ( = ?auto_279106 ?auto_279111 ) ) ( not ( = ?auto_279106 ?auto_279112 ) ) ( not ( = ?auto_279106 ?auto_279113 ) ) ( not ( = ?auto_279106 ?auto_279114 ) ) ( not ( = ?auto_279106 ?auto_279115 ) ) ( not ( = ?auto_279106 ?auto_279116 ) ) ( not ( = ?auto_279106 ?auto_279117 ) ) ( not ( = ?auto_279106 ?auto_279118 ) ) ( not ( = ?auto_279107 ?auto_279108 ) ) ( not ( = ?auto_279107 ?auto_279109 ) ) ( not ( = ?auto_279107 ?auto_279110 ) ) ( not ( = ?auto_279107 ?auto_279111 ) ) ( not ( = ?auto_279107 ?auto_279112 ) ) ( not ( = ?auto_279107 ?auto_279113 ) ) ( not ( = ?auto_279107 ?auto_279114 ) ) ( not ( = ?auto_279107 ?auto_279115 ) ) ( not ( = ?auto_279107 ?auto_279116 ) ) ( not ( = ?auto_279107 ?auto_279117 ) ) ( not ( = ?auto_279107 ?auto_279118 ) ) ( not ( = ?auto_279108 ?auto_279109 ) ) ( not ( = ?auto_279108 ?auto_279110 ) ) ( not ( = ?auto_279108 ?auto_279111 ) ) ( not ( = ?auto_279108 ?auto_279112 ) ) ( not ( = ?auto_279108 ?auto_279113 ) ) ( not ( = ?auto_279108 ?auto_279114 ) ) ( not ( = ?auto_279108 ?auto_279115 ) ) ( not ( = ?auto_279108 ?auto_279116 ) ) ( not ( = ?auto_279108 ?auto_279117 ) ) ( not ( = ?auto_279108 ?auto_279118 ) ) ( not ( = ?auto_279109 ?auto_279110 ) ) ( not ( = ?auto_279109 ?auto_279111 ) ) ( not ( = ?auto_279109 ?auto_279112 ) ) ( not ( = ?auto_279109 ?auto_279113 ) ) ( not ( = ?auto_279109 ?auto_279114 ) ) ( not ( = ?auto_279109 ?auto_279115 ) ) ( not ( = ?auto_279109 ?auto_279116 ) ) ( not ( = ?auto_279109 ?auto_279117 ) ) ( not ( = ?auto_279109 ?auto_279118 ) ) ( not ( = ?auto_279110 ?auto_279111 ) ) ( not ( = ?auto_279110 ?auto_279112 ) ) ( not ( = ?auto_279110 ?auto_279113 ) ) ( not ( = ?auto_279110 ?auto_279114 ) ) ( not ( = ?auto_279110 ?auto_279115 ) ) ( not ( = ?auto_279110 ?auto_279116 ) ) ( not ( = ?auto_279110 ?auto_279117 ) ) ( not ( = ?auto_279110 ?auto_279118 ) ) ( not ( = ?auto_279111 ?auto_279112 ) ) ( not ( = ?auto_279111 ?auto_279113 ) ) ( not ( = ?auto_279111 ?auto_279114 ) ) ( not ( = ?auto_279111 ?auto_279115 ) ) ( not ( = ?auto_279111 ?auto_279116 ) ) ( not ( = ?auto_279111 ?auto_279117 ) ) ( not ( = ?auto_279111 ?auto_279118 ) ) ( not ( = ?auto_279112 ?auto_279113 ) ) ( not ( = ?auto_279112 ?auto_279114 ) ) ( not ( = ?auto_279112 ?auto_279115 ) ) ( not ( = ?auto_279112 ?auto_279116 ) ) ( not ( = ?auto_279112 ?auto_279117 ) ) ( not ( = ?auto_279112 ?auto_279118 ) ) ( not ( = ?auto_279113 ?auto_279114 ) ) ( not ( = ?auto_279113 ?auto_279115 ) ) ( not ( = ?auto_279113 ?auto_279116 ) ) ( not ( = ?auto_279113 ?auto_279117 ) ) ( not ( = ?auto_279113 ?auto_279118 ) ) ( not ( = ?auto_279114 ?auto_279115 ) ) ( not ( = ?auto_279114 ?auto_279116 ) ) ( not ( = ?auto_279114 ?auto_279117 ) ) ( not ( = ?auto_279114 ?auto_279118 ) ) ( not ( = ?auto_279115 ?auto_279116 ) ) ( not ( = ?auto_279115 ?auto_279117 ) ) ( not ( = ?auto_279115 ?auto_279118 ) ) ( not ( = ?auto_279116 ?auto_279117 ) ) ( not ( = ?auto_279116 ?auto_279118 ) ) ( not ( = ?auto_279117 ?auto_279118 ) ) ( ON ?auto_279117 ?auto_279118 ) ( ON ?auto_279116 ?auto_279117 ) ( ON ?auto_279115 ?auto_279116 ) ( ON ?auto_279114 ?auto_279115 ) ( ON ?auto_279113 ?auto_279114 ) ( ON ?auto_279112 ?auto_279113 ) ( ON ?auto_279111 ?auto_279112 ) ( ON ?auto_279110 ?auto_279111 ) ( ON ?auto_279109 ?auto_279110 ) ( ON ?auto_279108 ?auto_279109 ) ( ON ?auto_279107 ?auto_279108 ) ( CLEAR ?auto_279105 ) ( ON ?auto_279106 ?auto_279107 ) ( CLEAR ?auto_279106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_279105 ?auto_279106 )
      ( MAKE-14PILE ?auto_279105 ?auto_279106 ?auto_279107 ?auto_279108 ?auto_279109 ?auto_279110 ?auto_279111 ?auto_279112 ?auto_279113 ?auto_279114 ?auto_279115 ?auto_279116 ?auto_279117 ?auto_279118 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_279133 - BLOCK
      ?auto_279134 - BLOCK
      ?auto_279135 - BLOCK
      ?auto_279136 - BLOCK
      ?auto_279137 - BLOCK
      ?auto_279138 - BLOCK
      ?auto_279139 - BLOCK
      ?auto_279140 - BLOCK
      ?auto_279141 - BLOCK
      ?auto_279142 - BLOCK
      ?auto_279143 - BLOCK
      ?auto_279144 - BLOCK
      ?auto_279145 - BLOCK
      ?auto_279146 - BLOCK
    )
    :vars
    (
      ?auto_279147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279146 ?auto_279147 ) ( not ( = ?auto_279133 ?auto_279134 ) ) ( not ( = ?auto_279133 ?auto_279135 ) ) ( not ( = ?auto_279133 ?auto_279136 ) ) ( not ( = ?auto_279133 ?auto_279137 ) ) ( not ( = ?auto_279133 ?auto_279138 ) ) ( not ( = ?auto_279133 ?auto_279139 ) ) ( not ( = ?auto_279133 ?auto_279140 ) ) ( not ( = ?auto_279133 ?auto_279141 ) ) ( not ( = ?auto_279133 ?auto_279142 ) ) ( not ( = ?auto_279133 ?auto_279143 ) ) ( not ( = ?auto_279133 ?auto_279144 ) ) ( not ( = ?auto_279133 ?auto_279145 ) ) ( not ( = ?auto_279133 ?auto_279146 ) ) ( not ( = ?auto_279133 ?auto_279147 ) ) ( not ( = ?auto_279134 ?auto_279135 ) ) ( not ( = ?auto_279134 ?auto_279136 ) ) ( not ( = ?auto_279134 ?auto_279137 ) ) ( not ( = ?auto_279134 ?auto_279138 ) ) ( not ( = ?auto_279134 ?auto_279139 ) ) ( not ( = ?auto_279134 ?auto_279140 ) ) ( not ( = ?auto_279134 ?auto_279141 ) ) ( not ( = ?auto_279134 ?auto_279142 ) ) ( not ( = ?auto_279134 ?auto_279143 ) ) ( not ( = ?auto_279134 ?auto_279144 ) ) ( not ( = ?auto_279134 ?auto_279145 ) ) ( not ( = ?auto_279134 ?auto_279146 ) ) ( not ( = ?auto_279134 ?auto_279147 ) ) ( not ( = ?auto_279135 ?auto_279136 ) ) ( not ( = ?auto_279135 ?auto_279137 ) ) ( not ( = ?auto_279135 ?auto_279138 ) ) ( not ( = ?auto_279135 ?auto_279139 ) ) ( not ( = ?auto_279135 ?auto_279140 ) ) ( not ( = ?auto_279135 ?auto_279141 ) ) ( not ( = ?auto_279135 ?auto_279142 ) ) ( not ( = ?auto_279135 ?auto_279143 ) ) ( not ( = ?auto_279135 ?auto_279144 ) ) ( not ( = ?auto_279135 ?auto_279145 ) ) ( not ( = ?auto_279135 ?auto_279146 ) ) ( not ( = ?auto_279135 ?auto_279147 ) ) ( not ( = ?auto_279136 ?auto_279137 ) ) ( not ( = ?auto_279136 ?auto_279138 ) ) ( not ( = ?auto_279136 ?auto_279139 ) ) ( not ( = ?auto_279136 ?auto_279140 ) ) ( not ( = ?auto_279136 ?auto_279141 ) ) ( not ( = ?auto_279136 ?auto_279142 ) ) ( not ( = ?auto_279136 ?auto_279143 ) ) ( not ( = ?auto_279136 ?auto_279144 ) ) ( not ( = ?auto_279136 ?auto_279145 ) ) ( not ( = ?auto_279136 ?auto_279146 ) ) ( not ( = ?auto_279136 ?auto_279147 ) ) ( not ( = ?auto_279137 ?auto_279138 ) ) ( not ( = ?auto_279137 ?auto_279139 ) ) ( not ( = ?auto_279137 ?auto_279140 ) ) ( not ( = ?auto_279137 ?auto_279141 ) ) ( not ( = ?auto_279137 ?auto_279142 ) ) ( not ( = ?auto_279137 ?auto_279143 ) ) ( not ( = ?auto_279137 ?auto_279144 ) ) ( not ( = ?auto_279137 ?auto_279145 ) ) ( not ( = ?auto_279137 ?auto_279146 ) ) ( not ( = ?auto_279137 ?auto_279147 ) ) ( not ( = ?auto_279138 ?auto_279139 ) ) ( not ( = ?auto_279138 ?auto_279140 ) ) ( not ( = ?auto_279138 ?auto_279141 ) ) ( not ( = ?auto_279138 ?auto_279142 ) ) ( not ( = ?auto_279138 ?auto_279143 ) ) ( not ( = ?auto_279138 ?auto_279144 ) ) ( not ( = ?auto_279138 ?auto_279145 ) ) ( not ( = ?auto_279138 ?auto_279146 ) ) ( not ( = ?auto_279138 ?auto_279147 ) ) ( not ( = ?auto_279139 ?auto_279140 ) ) ( not ( = ?auto_279139 ?auto_279141 ) ) ( not ( = ?auto_279139 ?auto_279142 ) ) ( not ( = ?auto_279139 ?auto_279143 ) ) ( not ( = ?auto_279139 ?auto_279144 ) ) ( not ( = ?auto_279139 ?auto_279145 ) ) ( not ( = ?auto_279139 ?auto_279146 ) ) ( not ( = ?auto_279139 ?auto_279147 ) ) ( not ( = ?auto_279140 ?auto_279141 ) ) ( not ( = ?auto_279140 ?auto_279142 ) ) ( not ( = ?auto_279140 ?auto_279143 ) ) ( not ( = ?auto_279140 ?auto_279144 ) ) ( not ( = ?auto_279140 ?auto_279145 ) ) ( not ( = ?auto_279140 ?auto_279146 ) ) ( not ( = ?auto_279140 ?auto_279147 ) ) ( not ( = ?auto_279141 ?auto_279142 ) ) ( not ( = ?auto_279141 ?auto_279143 ) ) ( not ( = ?auto_279141 ?auto_279144 ) ) ( not ( = ?auto_279141 ?auto_279145 ) ) ( not ( = ?auto_279141 ?auto_279146 ) ) ( not ( = ?auto_279141 ?auto_279147 ) ) ( not ( = ?auto_279142 ?auto_279143 ) ) ( not ( = ?auto_279142 ?auto_279144 ) ) ( not ( = ?auto_279142 ?auto_279145 ) ) ( not ( = ?auto_279142 ?auto_279146 ) ) ( not ( = ?auto_279142 ?auto_279147 ) ) ( not ( = ?auto_279143 ?auto_279144 ) ) ( not ( = ?auto_279143 ?auto_279145 ) ) ( not ( = ?auto_279143 ?auto_279146 ) ) ( not ( = ?auto_279143 ?auto_279147 ) ) ( not ( = ?auto_279144 ?auto_279145 ) ) ( not ( = ?auto_279144 ?auto_279146 ) ) ( not ( = ?auto_279144 ?auto_279147 ) ) ( not ( = ?auto_279145 ?auto_279146 ) ) ( not ( = ?auto_279145 ?auto_279147 ) ) ( not ( = ?auto_279146 ?auto_279147 ) ) ( ON ?auto_279145 ?auto_279146 ) ( ON ?auto_279144 ?auto_279145 ) ( ON ?auto_279143 ?auto_279144 ) ( ON ?auto_279142 ?auto_279143 ) ( ON ?auto_279141 ?auto_279142 ) ( ON ?auto_279140 ?auto_279141 ) ( ON ?auto_279139 ?auto_279140 ) ( ON ?auto_279138 ?auto_279139 ) ( ON ?auto_279137 ?auto_279138 ) ( ON ?auto_279136 ?auto_279137 ) ( ON ?auto_279135 ?auto_279136 ) ( ON ?auto_279134 ?auto_279135 ) ( ON ?auto_279133 ?auto_279134 ) ( CLEAR ?auto_279133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_279133 )
      ( MAKE-14PILE ?auto_279133 ?auto_279134 ?auto_279135 ?auto_279136 ?auto_279137 ?auto_279138 ?auto_279139 ?auto_279140 ?auto_279141 ?auto_279142 ?auto_279143 ?auto_279144 ?auto_279145 ?auto_279146 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_279162 - BLOCK
      ?auto_279163 - BLOCK
      ?auto_279164 - BLOCK
      ?auto_279165 - BLOCK
      ?auto_279166 - BLOCK
      ?auto_279167 - BLOCK
      ?auto_279168 - BLOCK
      ?auto_279169 - BLOCK
      ?auto_279170 - BLOCK
      ?auto_279171 - BLOCK
      ?auto_279172 - BLOCK
      ?auto_279173 - BLOCK
      ?auto_279174 - BLOCK
      ?auto_279175 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_279175 ) ( not ( = ?auto_279162 ?auto_279163 ) ) ( not ( = ?auto_279162 ?auto_279164 ) ) ( not ( = ?auto_279162 ?auto_279165 ) ) ( not ( = ?auto_279162 ?auto_279166 ) ) ( not ( = ?auto_279162 ?auto_279167 ) ) ( not ( = ?auto_279162 ?auto_279168 ) ) ( not ( = ?auto_279162 ?auto_279169 ) ) ( not ( = ?auto_279162 ?auto_279170 ) ) ( not ( = ?auto_279162 ?auto_279171 ) ) ( not ( = ?auto_279162 ?auto_279172 ) ) ( not ( = ?auto_279162 ?auto_279173 ) ) ( not ( = ?auto_279162 ?auto_279174 ) ) ( not ( = ?auto_279162 ?auto_279175 ) ) ( not ( = ?auto_279163 ?auto_279164 ) ) ( not ( = ?auto_279163 ?auto_279165 ) ) ( not ( = ?auto_279163 ?auto_279166 ) ) ( not ( = ?auto_279163 ?auto_279167 ) ) ( not ( = ?auto_279163 ?auto_279168 ) ) ( not ( = ?auto_279163 ?auto_279169 ) ) ( not ( = ?auto_279163 ?auto_279170 ) ) ( not ( = ?auto_279163 ?auto_279171 ) ) ( not ( = ?auto_279163 ?auto_279172 ) ) ( not ( = ?auto_279163 ?auto_279173 ) ) ( not ( = ?auto_279163 ?auto_279174 ) ) ( not ( = ?auto_279163 ?auto_279175 ) ) ( not ( = ?auto_279164 ?auto_279165 ) ) ( not ( = ?auto_279164 ?auto_279166 ) ) ( not ( = ?auto_279164 ?auto_279167 ) ) ( not ( = ?auto_279164 ?auto_279168 ) ) ( not ( = ?auto_279164 ?auto_279169 ) ) ( not ( = ?auto_279164 ?auto_279170 ) ) ( not ( = ?auto_279164 ?auto_279171 ) ) ( not ( = ?auto_279164 ?auto_279172 ) ) ( not ( = ?auto_279164 ?auto_279173 ) ) ( not ( = ?auto_279164 ?auto_279174 ) ) ( not ( = ?auto_279164 ?auto_279175 ) ) ( not ( = ?auto_279165 ?auto_279166 ) ) ( not ( = ?auto_279165 ?auto_279167 ) ) ( not ( = ?auto_279165 ?auto_279168 ) ) ( not ( = ?auto_279165 ?auto_279169 ) ) ( not ( = ?auto_279165 ?auto_279170 ) ) ( not ( = ?auto_279165 ?auto_279171 ) ) ( not ( = ?auto_279165 ?auto_279172 ) ) ( not ( = ?auto_279165 ?auto_279173 ) ) ( not ( = ?auto_279165 ?auto_279174 ) ) ( not ( = ?auto_279165 ?auto_279175 ) ) ( not ( = ?auto_279166 ?auto_279167 ) ) ( not ( = ?auto_279166 ?auto_279168 ) ) ( not ( = ?auto_279166 ?auto_279169 ) ) ( not ( = ?auto_279166 ?auto_279170 ) ) ( not ( = ?auto_279166 ?auto_279171 ) ) ( not ( = ?auto_279166 ?auto_279172 ) ) ( not ( = ?auto_279166 ?auto_279173 ) ) ( not ( = ?auto_279166 ?auto_279174 ) ) ( not ( = ?auto_279166 ?auto_279175 ) ) ( not ( = ?auto_279167 ?auto_279168 ) ) ( not ( = ?auto_279167 ?auto_279169 ) ) ( not ( = ?auto_279167 ?auto_279170 ) ) ( not ( = ?auto_279167 ?auto_279171 ) ) ( not ( = ?auto_279167 ?auto_279172 ) ) ( not ( = ?auto_279167 ?auto_279173 ) ) ( not ( = ?auto_279167 ?auto_279174 ) ) ( not ( = ?auto_279167 ?auto_279175 ) ) ( not ( = ?auto_279168 ?auto_279169 ) ) ( not ( = ?auto_279168 ?auto_279170 ) ) ( not ( = ?auto_279168 ?auto_279171 ) ) ( not ( = ?auto_279168 ?auto_279172 ) ) ( not ( = ?auto_279168 ?auto_279173 ) ) ( not ( = ?auto_279168 ?auto_279174 ) ) ( not ( = ?auto_279168 ?auto_279175 ) ) ( not ( = ?auto_279169 ?auto_279170 ) ) ( not ( = ?auto_279169 ?auto_279171 ) ) ( not ( = ?auto_279169 ?auto_279172 ) ) ( not ( = ?auto_279169 ?auto_279173 ) ) ( not ( = ?auto_279169 ?auto_279174 ) ) ( not ( = ?auto_279169 ?auto_279175 ) ) ( not ( = ?auto_279170 ?auto_279171 ) ) ( not ( = ?auto_279170 ?auto_279172 ) ) ( not ( = ?auto_279170 ?auto_279173 ) ) ( not ( = ?auto_279170 ?auto_279174 ) ) ( not ( = ?auto_279170 ?auto_279175 ) ) ( not ( = ?auto_279171 ?auto_279172 ) ) ( not ( = ?auto_279171 ?auto_279173 ) ) ( not ( = ?auto_279171 ?auto_279174 ) ) ( not ( = ?auto_279171 ?auto_279175 ) ) ( not ( = ?auto_279172 ?auto_279173 ) ) ( not ( = ?auto_279172 ?auto_279174 ) ) ( not ( = ?auto_279172 ?auto_279175 ) ) ( not ( = ?auto_279173 ?auto_279174 ) ) ( not ( = ?auto_279173 ?auto_279175 ) ) ( not ( = ?auto_279174 ?auto_279175 ) ) ( ON ?auto_279174 ?auto_279175 ) ( ON ?auto_279173 ?auto_279174 ) ( ON ?auto_279172 ?auto_279173 ) ( ON ?auto_279171 ?auto_279172 ) ( ON ?auto_279170 ?auto_279171 ) ( ON ?auto_279169 ?auto_279170 ) ( ON ?auto_279168 ?auto_279169 ) ( ON ?auto_279167 ?auto_279168 ) ( ON ?auto_279166 ?auto_279167 ) ( ON ?auto_279165 ?auto_279166 ) ( ON ?auto_279164 ?auto_279165 ) ( ON ?auto_279163 ?auto_279164 ) ( ON ?auto_279162 ?auto_279163 ) ( CLEAR ?auto_279162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_279162 )
      ( MAKE-14PILE ?auto_279162 ?auto_279163 ?auto_279164 ?auto_279165 ?auto_279166 ?auto_279167 ?auto_279168 ?auto_279169 ?auto_279170 ?auto_279171 ?auto_279172 ?auto_279173 ?auto_279174 ?auto_279175 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_279190 - BLOCK
      ?auto_279191 - BLOCK
      ?auto_279192 - BLOCK
      ?auto_279193 - BLOCK
      ?auto_279194 - BLOCK
      ?auto_279195 - BLOCK
      ?auto_279196 - BLOCK
      ?auto_279197 - BLOCK
      ?auto_279198 - BLOCK
      ?auto_279199 - BLOCK
      ?auto_279200 - BLOCK
      ?auto_279201 - BLOCK
      ?auto_279202 - BLOCK
      ?auto_279203 - BLOCK
    )
    :vars
    (
      ?auto_279204 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_279190 ?auto_279191 ) ) ( not ( = ?auto_279190 ?auto_279192 ) ) ( not ( = ?auto_279190 ?auto_279193 ) ) ( not ( = ?auto_279190 ?auto_279194 ) ) ( not ( = ?auto_279190 ?auto_279195 ) ) ( not ( = ?auto_279190 ?auto_279196 ) ) ( not ( = ?auto_279190 ?auto_279197 ) ) ( not ( = ?auto_279190 ?auto_279198 ) ) ( not ( = ?auto_279190 ?auto_279199 ) ) ( not ( = ?auto_279190 ?auto_279200 ) ) ( not ( = ?auto_279190 ?auto_279201 ) ) ( not ( = ?auto_279190 ?auto_279202 ) ) ( not ( = ?auto_279190 ?auto_279203 ) ) ( not ( = ?auto_279191 ?auto_279192 ) ) ( not ( = ?auto_279191 ?auto_279193 ) ) ( not ( = ?auto_279191 ?auto_279194 ) ) ( not ( = ?auto_279191 ?auto_279195 ) ) ( not ( = ?auto_279191 ?auto_279196 ) ) ( not ( = ?auto_279191 ?auto_279197 ) ) ( not ( = ?auto_279191 ?auto_279198 ) ) ( not ( = ?auto_279191 ?auto_279199 ) ) ( not ( = ?auto_279191 ?auto_279200 ) ) ( not ( = ?auto_279191 ?auto_279201 ) ) ( not ( = ?auto_279191 ?auto_279202 ) ) ( not ( = ?auto_279191 ?auto_279203 ) ) ( not ( = ?auto_279192 ?auto_279193 ) ) ( not ( = ?auto_279192 ?auto_279194 ) ) ( not ( = ?auto_279192 ?auto_279195 ) ) ( not ( = ?auto_279192 ?auto_279196 ) ) ( not ( = ?auto_279192 ?auto_279197 ) ) ( not ( = ?auto_279192 ?auto_279198 ) ) ( not ( = ?auto_279192 ?auto_279199 ) ) ( not ( = ?auto_279192 ?auto_279200 ) ) ( not ( = ?auto_279192 ?auto_279201 ) ) ( not ( = ?auto_279192 ?auto_279202 ) ) ( not ( = ?auto_279192 ?auto_279203 ) ) ( not ( = ?auto_279193 ?auto_279194 ) ) ( not ( = ?auto_279193 ?auto_279195 ) ) ( not ( = ?auto_279193 ?auto_279196 ) ) ( not ( = ?auto_279193 ?auto_279197 ) ) ( not ( = ?auto_279193 ?auto_279198 ) ) ( not ( = ?auto_279193 ?auto_279199 ) ) ( not ( = ?auto_279193 ?auto_279200 ) ) ( not ( = ?auto_279193 ?auto_279201 ) ) ( not ( = ?auto_279193 ?auto_279202 ) ) ( not ( = ?auto_279193 ?auto_279203 ) ) ( not ( = ?auto_279194 ?auto_279195 ) ) ( not ( = ?auto_279194 ?auto_279196 ) ) ( not ( = ?auto_279194 ?auto_279197 ) ) ( not ( = ?auto_279194 ?auto_279198 ) ) ( not ( = ?auto_279194 ?auto_279199 ) ) ( not ( = ?auto_279194 ?auto_279200 ) ) ( not ( = ?auto_279194 ?auto_279201 ) ) ( not ( = ?auto_279194 ?auto_279202 ) ) ( not ( = ?auto_279194 ?auto_279203 ) ) ( not ( = ?auto_279195 ?auto_279196 ) ) ( not ( = ?auto_279195 ?auto_279197 ) ) ( not ( = ?auto_279195 ?auto_279198 ) ) ( not ( = ?auto_279195 ?auto_279199 ) ) ( not ( = ?auto_279195 ?auto_279200 ) ) ( not ( = ?auto_279195 ?auto_279201 ) ) ( not ( = ?auto_279195 ?auto_279202 ) ) ( not ( = ?auto_279195 ?auto_279203 ) ) ( not ( = ?auto_279196 ?auto_279197 ) ) ( not ( = ?auto_279196 ?auto_279198 ) ) ( not ( = ?auto_279196 ?auto_279199 ) ) ( not ( = ?auto_279196 ?auto_279200 ) ) ( not ( = ?auto_279196 ?auto_279201 ) ) ( not ( = ?auto_279196 ?auto_279202 ) ) ( not ( = ?auto_279196 ?auto_279203 ) ) ( not ( = ?auto_279197 ?auto_279198 ) ) ( not ( = ?auto_279197 ?auto_279199 ) ) ( not ( = ?auto_279197 ?auto_279200 ) ) ( not ( = ?auto_279197 ?auto_279201 ) ) ( not ( = ?auto_279197 ?auto_279202 ) ) ( not ( = ?auto_279197 ?auto_279203 ) ) ( not ( = ?auto_279198 ?auto_279199 ) ) ( not ( = ?auto_279198 ?auto_279200 ) ) ( not ( = ?auto_279198 ?auto_279201 ) ) ( not ( = ?auto_279198 ?auto_279202 ) ) ( not ( = ?auto_279198 ?auto_279203 ) ) ( not ( = ?auto_279199 ?auto_279200 ) ) ( not ( = ?auto_279199 ?auto_279201 ) ) ( not ( = ?auto_279199 ?auto_279202 ) ) ( not ( = ?auto_279199 ?auto_279203 ) ) ( not ( = ?auto_279200 ?auto_279201 ) ) ( not ( = ?auto_279200 ?auto_279202 ) ) ( not ( = ?auto_279200 ?auto_279203 ) ) ( not ( = ?auto_279201 ?auto_279202 ) ) ( not ( = ?auto_279201 ?auto_279203 ) ) ( not ( = ?auto_279202 ?auto_279203 ) ) ( ON ?auto_279190 ?auto_279204 ) ( not ( = ?auto_279203 ?auto_279204 ) ) ( not ( = ?auto_279202 ?auto_279204 ) ) ( not ( = ?auto_279201 ?auto_279204 ) ) ( not ( = ?auto_279200 ?auto_279204 ) ) ( not ( = ?auto_279199 ?auto_279204 ) ) ( not ( = ?auto_279198 ?auto_279204 ) ) ( not ( = ?auto_279197 ?auto_279204 ) ) ( not ( = ?auto_279196 ?auto_279204 ) ) ( not ( = ?auto_279195 ?auto_279204 ) ) ( not ( = ?auto_279194 ?auto_279204 ) ) ( not ( = ?auto_279193 ?auto_279204 ) ) ( not ( = ?auto_279192 ?auto_279204 ) ) ( not ( = ?auto_279191 ?auto_279204 ) ) ( not ( = ?auto_279190 ?auto_279204 ) ) ( ON ?auto_279191 ?auto_279190 ) ( ON ?auto_279192 ?auto_279191 ) ( ON ?auto_279193 ?auto_279192 ) ( ON ?auto_279194 ?auto_279193 ) ( ON ?auto_279195 ?auto_279194 ) ( ON ?auto_279196 ?auto_279195 ) ( ON ?auto_279197 ?auto_279196 ) ( ON ?auto_279198 ?auto_279197 ) ( ON ?auto_279199 ?auto_279198 ) ( ON ?auto_279200 ?auto_279199 ) ( ON ?auto_279201 ?auto_279200 ) ( ON ?auto_279202 ?auto_279201 ) ( ON ?auto_279203 ?auto_279202 ) ( CLEAR ?auto_279203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_279203 ?auto_279202 ?auto_279201 ?auto_279200 ?auto_279199 ?auto_279198 ?auto_279197 ?auto_279196 ?auto_279195 ?auto_279194 ?auto_279193 ?auto_279192 ?auto_279191 ?auto_279190 )
      ( MAKE-14PILE ?auto_279190 ?auto_279191 ?auto_279192 ?auto_279193 ?auto_279194 ?auto_279195 ?auto_279196 ?auto_279197 ?auto_279198 ?auto_279199 ?auto_279200 ?auto_279201 ?auto_279202 ?auto_279203 ) )
  )

)
